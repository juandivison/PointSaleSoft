using System.Collections.Concurrent;
using System.Net;
using System.Net.WebSockets;
using System.Security.Cryptography;
using System.Text;
using System.Text.Json;
using System.Threading.Channels;

namespace PointSaleSoft.Sync;

public sealed record RelayOptions(string Url,RelayTenant[] Tenants,RelayIdentity[] Identities,
    Dictionary<string,CatalogPolicy> Policies,string? MySqlConnectionString=null,string? LocalQaFile=null);

public static class RelayHost
{
    public static WebApplication Build(RelayOptions options,IRelayStore? testStore=null)
    {
        if(!Uri.TryCreate(options.Url,UriKind.Absolute,out var url) || !IPAddress.TryParse(url.Host,out var host) || !IPAddress.IsLoopback(host))
            throw new InvalidOperationException("El relay escucha solo loopback, publicado por el tunel");
        if(options.Tenants.Length==0 || options.Tenants.Select(t=>t.Id).Distinct().Count()!=options.Tenants.Length)
            throw new InvalidOperationException("Clientes vacios/duplicados");
        foreach(var t in options.Tenants)
        {
            if(t.Branches.Length==0 || t.Branches.Distinct().Count()!=t.Branches.Length ||
               !options.Policies.TryGetValue(t.Id,out var policy) || policy.Hash!=t.PolicyHash)
                throw new InvalidOperationException("Configuracion de cliente invalida");
            policy.Validate();
        }
        foreach(var i in options.Identities)
        {
            var t=options.Tenants.SingleOrDefault(t=>t.Id==i.Tenant) ?? throw new InvalidOperationException("Cliente desconocido");
            if(i.TokenHash.Length!=64 || !i.TokenHash.All(Uri.IsHexDigit) || i.Role is not ("source" or "branch") ||
                (i.Role=="branch"&&!t.Branches.Contains(i.Node)))throw new InvalidOperationException("Credencial invalida");
        }
        if(options.Identities.Select(i=>i.TokenHash.ToLowerInvariant()).Distinct().Count()!=options.Identities.Length)
            throw new InvalidOperationException("Cada nodo requiere su propia credencial");
        IRelayStore store=testStore ?? (options.MySqlConnectionString is not null ? new MySqlRelayStore(options.MySqlConnectionString) :
            options.LocalQaFile is not null && Environment.GetEnvironmentVariable("PSSYNC_LOCAL_QA")=="1" ? new FileQaRelayStore(options.LocalQaFile) :
            throw new InvalidOperationException("Configure MySQL; almacenamiento por archivo solo en QA explicito"));
        var builder=WebApplication.CreateBuilder(new WebApplicationOptions{Args=[]});
        builder.Logging.ClearProviders();
        builder.Logging.AddSimpleConsole();
        builder.Logging.SetMinimumLevel(LogLevel.Warning);
        builder.WebHost.UseUrls(options.Url);
        builder.WebHost.ConfigureKestrel(k=>k.Limits.MaxRequestBodySize=1024*1024);
        var app=builder.Build();
        var sockets=new ConcurrentDictionary<Guid,(string Tenant,Channel<bool> Signal)>();
        app.UseWebSockets(new WebSocketOptions{KeepAliveInterval=TimeSpan.FromSeconds(20)});
        app.Use(async(ctx,next)=>
        {
            if(ctx.Request.Path=="/health"){await next(ctx);return;}
            var authorization=ctx.Request.Headers.Authorization.ToString();
            if(!authorization.StartsWith("Bearer ",StringComparison.Ordinal) || authorization.Length>300)
            {ctx.Response.StatusCode=401;return;}
            var token=authorization[7..];var hash=SHA256.HashData(Encoding.UTF8.GetBytes(token));
            var identity=options.Identities.SingleOrDefault(i=>CryptographicOperations.FixedTimeEquals(Convert.FromHexString(i.TokenHash),hash));
            if(identity is null){ctx.Response.StatusCode=401;return;}
            ctx.Items["identity"]=identity;
            ctx.Response.Headers.CacheControl="no-store, private";
            try{await next(ctx);}
            catch(OperationCanceledException)when(ctx.RequestAborted.IsCancellationRequested){}
            catch(Exception e)
            {
                // Never echo database exceptions, payloads, tokens or connection strings.
                app.Logger.LogWarning("Sync request rejected: {Type}",e.GetType().Name);
                if(!ctx.Response.HasStarted){ctx.Response.StatusCode=e is InvalidOperationException ? 409 : 503;
                    await ctx.Response.WriteAsJsonAsync(new{code="SYNC_NOT_COMMITTED",retryable=true},ctx.RequestAborted);}
            }
        });
        app.MapGet("/health",()=>Results.Ok(new{service="pointsale-catalog-sync",protocol=1}));
        app.MapPost("/v1/events",async(HttpContext ctx)=>
        {
            var i=(RelayIdentity)ctx.Items["identity"]!;
            if(i.Role!="source")return Results.StatusCode(403);
            var tenant=options.Tenants.Single(t=>t.Id==i.Tenant);
            var e=await ctx.Request.ReadFromJsonAsync<Envelope>(ctx.RequestAborted) ?? throw new InvalidOperationException("Sin envio");
            e.Validate(options.Policies[i.Tenant],i.Tenant,tenant.Epoch);
            if(Encoding.UTF8.GetByteCount(e.Json)>1024*1024) return Results.StatusCode(413);
            await store.Publish(e,tenant,ctx.RequestAborted);
            foreach(var socket in sockets.Values.Where(s=>s.Tenant==i.Tenant))socket.Signal.Writer.TryWrite(true);
            return Results.Ok(new{eventId=e.EventId,stored=true});
        });
        app.MapGet("/v1/pending",async(HttpContext ctx)=>
        {
            var i=(RelayIdentity)ctx.Items["identity"]!;
            return i.Role!="branch" ? Results.StatusCode(403) : Results.Ok(await store.Pending(i.Tenant,i.Node,ctx.RequestAborted));
        });
        app.MapPost("/v1/events/{id:guid}/ack",async(HttpContext ctx,Guid id)=>
        {
            var i=(RelayIdentity)ctx.Items["identity"]!;
            if(i.Role!="branch")return Results.StatusCode(403);
            await store.Ack(i.Tenant,i.Node,id,ctx.RequestAborted);
            return Results.Ok(new{eventId=id,committed=true});
        });
        app.MapGet("/v1/status",async(HttpContext ctx)=>
        {
            var i=(RelayIdentity)ctx.Items["identity"]!;var tenant=options.Tenants.Single(t=>t.Id==i.Tenant);
            var states=await store.Status(tenant,ctx.RequestAborted);
            return Results.Ok(i.Role=="source"?states:states.Where(s=>s.Branch==i.Node).ToArray());
        });
        app.MapGet("/v1/notifications",async(HttpContext ctx)=>
        {
            var i=(RelayIdentity)ctx.Items["identity"]!;
            if(i.Role!="branch"){ctx.Response.StatusCode=403;return;}
            if(!ctx.WebSockets.IsWebSocketRequest){ctx.Response.StatusCode=400;return;}
            using var socket=await ctx.WebSockets.AcceptWebSocketAsync();var id=Guid.NewGuid();
            var signal=Channel.CreateBounded<bool>(new BoundedChannelOptions(1){FullMode=BoundedChannelFullMode.DropOldest});
            sockets[id]=(i.Tenant,signal);signal.Writer.TryWrite(true);
            try
            {
                using var linked=CancellationTokenSource.CreateLinkedTokenSource(ctx.RequestAborted,app.Lifetime.ApplicationStopping);
                var receive=socket.ReceiveAsync(new byte[64],linked.Token);
                while(socket.State==WebSocketState.Open&&!linked.IsCancellationRequested)
                {
                    using var waiter=CancellationTokenSource.CreateLinkedTokenSource(linked.Token);
                    var wait=signal.Reader.WaitToReadAsync(waiter.Token).AsTask();
                    var completed=await Task.WhenAny(wait,receive,Task.Delay(TimeSpan.FromSeconds(15),linked.Token));
                    waiter.Cancel();try{await wait;}catch(OperationCanceledException){}
                    if(completed==receive)break;
                    while(signal.Reader.TryRead(out _)){}
                    await socket.SendAsync(Encoding.UTF8.GetBytes("changes-available"),WebSocketMessageType.Text,true,linked.Token);
                }
                linked.Cancel();try{await receive;}catch(OperationCanceledException){}
            }
            catch(WebSocketException){}catch(OperationCanceledException){}
            finally{sockets.TryRemove(id,out _);}
        });
        return app;
    }
}
