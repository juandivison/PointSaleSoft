using System.Net.Http.Headers;
using System.Net.Http.Json;
using System.Net.WebSockets;
using System.Text.Json;
using System.Threading.Channels;

namespace PointSaleSoft.Sync;

public sealed record AgentOptions(string Role,string Tenant,string Epoch,string RelayUrl,string Token,
    string FirebirdConnectionString,CatalogPolicy Policy,int PollMilliseconds=1000);

public sealed class SyncAgent : IDisposable
{
    private readonly AgentOptions options;
    private readonly FirebirdCatalog catalog;
    private readonly HttpClient http;
    private readonly Channel<bool> wake=Channel.CreateBounded<bool>(new BoundedChannelOptions(1){FullMode=BoundedChannelFullMode.DropOldest});
    public SyncAgent(AgentOptions options)
    {
        this.options=options;options.Policy.Validate();
        var uri=new Uri(options.RelayUrl);
        if(uri.Scheme!="https" && !(uri.Scheme=="http" && uri.IsLoopback))throw new InvalidOperationException("HTTPS requerido");
        if(options.Role is not ("source" or "branch") || options.PollMilliseconds<100 || string.IsNullOrWhiteSpace(options.Token))
            throw new InvalidOperationException("Configuracion de agente invalida");
        catalog=new(options.FirebirdConnectionString);
        catalog.VerifyNode(options.Policy,options.Epoch,options.Role);
        http=new(){BaseAddress=uri,Timeout=TimeSpan.FromSeconds(20)};
        http.DefaultRequestHeaders.Authorization=new AuthenticationHeaderValue("Bearer",options.Token);
    }
    public async Task<int> Once(CancellationToken ct)
    {
        int count=0;
        if(options.Role=="source")
        {
            for(int i=0;i<50;i++)
            {
                var e=catalog.NextPending(options.Policy,options.Tenant,options.Epoch);if(e is null)break;
                using var result=await http.PostAsJsonAsync("v1/events",e,ct);result.EnsureSuccessStatusCode();
                catalog.Published(e.EventId);count++;
            }
        }
        else
        {
            var pending=await http.GetFromJsonAsync<Delivery[]>("v1/pending",ct) ?? [];
            foreach(var delivery in pending)
            {
                var e=JsonSerializer.Deserialize<Envelope>(delivery.Payload) ?? throw new InvalidOperationException("Envio vacio");
                if(e.EventId!=delivery.EventId)throw new InvalidOperationException("UUID inconsistente");
                catalog.Apply(options.Policy,e,options.Tenant,options.Epoch);
                using var ack=await http.PostAsync($"v1/events/{e.EventId}/ack",null,ct);ack.EnsureSuccessStatusCode();count++;
            }
        }
        return count;
    }
    public async Task Run(CancellationToken ct)
    {
        var notifications=options.Role=="branch"?Notifications(ct):Task.CompletedTask;
        try
        {
            while(!ct.IsCancellationRequested)
            {
                try{await Once(ct);}
                catch(OperationCanceledException)when(ct.IsCancellationRequested){break;}
                catch(Exception e){Console.Error.WriteLine("SYNC_PENDING "+e.GetType().Name);}
                // Polling is a recovery path, independent of WebSocket delivery.
                using var wait=CancellationTokenSource.CreateLinkedTokenSource(ct);
                var signal=wake.Reader.WaitToReadAsync(wait.Token).AsTask();
                await Task.WhenAny(signal,Task.Delay(options.PollMilliseconds,ct));wait.Cancel();
                try{await signal;}catch(OperationCanceledException){}
                while(wake.Reader.TryRead(out _)){}
            }
        }
        finally{try{await notifications;}catch(OperationCanceledException){}}
    }
    private async Task Notifications(CancellationToken ct)
    {
        while(!ct.IsCancellationRequested)
        {
            try
            {
                using var ws=new ClientWebSocket();ws.Options.SetRequestHeader("Authorization","Bearer "+options.Token);
                ws.Options.KeepAliveInterval=TimeSpan.FromSeconds(15);
                var uri=new UriBuilder(new Uri(new Uri(options.RelayUrl),"v1/notifications"));uri.Scheme=uri.Scheme=="https"?"wss":"ws";
                await ws.ConnectAsync(uri.Uri,ct);wake.Writer.TryWrite(true);
                var buffer=new byte[1024];
                while(ws.State==WebSocketState.Open&&!ct.IsCancellationRequested)
                {
                    var received=await ws.ReceiveAsync(buffer,ct);if(received.MessageType==WebSocketMessageType.Close)break;
                    wake.Writer.TryWrite(true);
                }
            }
            catch(OperationCanceledException)when(ct.IsCancellationRequested){break;}
            catch(WebSocketException){}catch(HttpRequestException){}
            await Task.Delay(1000,ct);
        }
    }
    public void Dispose()=>http.Dispose();
}
