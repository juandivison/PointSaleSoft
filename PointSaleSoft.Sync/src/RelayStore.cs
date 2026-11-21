using System.Text.Json;
using MySqlConnector;

namespace PointSaleSoft.Sync;

public sealed record RelayTenant(string Id,string Epoch,string PolicyHash,string[] Branches);
public sealed record RelayIdentity(string Tenant,string Node,string Role,string TokenHash);
public sealed record Delivery(Guid EventId,string Payload);
public sealed record BranchStatus(string Branch,int Pending,DateTime? LastAckUtc);
public interface IRelayStore
{
    Task Publish(Envelope envelope,RelayTenant tenant,CancellationToken ct);
    Task<Delivery[]> Pending(string tenant,string branch,CancellationToken ct);
    Task Ack(string tenant,string branch,Guid id,CancellationToken ct);
    Task<BranchStatus[]> Status(RelayTenant tenant,CancellationToken ct);
}

// A durable file adapter is restricted to the local QA profile by RelayHost.
// The VPS uses MySQL; both implement exactly the same protocol.
public sealed class FileQaRelayStore(string path) : IRelayStore
{
    private readonly SemaphoreSlim gate=new(1,1);
    public sealed record Entry(string Tenant,Guid Id,string Hash,string? Payload,Dictionary<string,DateTime?> Acks);
    private List<Entry> Load() => File.Exists(path) ? JsonSerializer.Deserialize<List<Entry>>(File.ReadAllText(path))
        ?? throw new InvalidOperationException("Cola QA corrupta") : [];
    private void Save(List<Entry> entries)
    {
        Directory.CreateDirectory(Path.GetDirectoryName(Path.GetFullPath(path))!);
        var tmp=path+".tmp";
        using(var stream=new FileStream(tmp,FileMode.Create,FileAccess.Write,FileShare.None))
        { JsonSerializer.Serialize(stream,entries);stream.Flush(true); }
        File.Move(tmp,path,true);
    }
    public async Task Publish(Envelope envelope,RelayTenant tenant,CancellationToken ct)
    {
        await gate.WaitAsync(ct);try
        {
            var all=Load();var prior=all.SingleOrDefault(x=>x.Tenant==tenant.Id && x.Id==envelope.EventId);
            if(prior is not null){if(prior.Hash!=envelope.Hash)throw new InvalidOperationException("UUID con otro contenido");return;}
            if(all.Where(x=>x.Tenant==tenant.Id).Sum(x=>(long)(x.Payload?.Length??0)) + envelope.Json.Length > 32L*1024*1024)
                throw new InvalidOperationException("Cuota QA alcanzada; el origen conserva el envio");
            all.Add(new(tenant.Id,envelope.EventId,envelope.Hash,envelope.Json,tenant.Branches.ToDictionary(x=>x,_=>(DateTime?)null)));
            Save(all);
        }finally{gate.Release();}
    }
    public async Task<Delivery[]> Pending(string tenant,string branch,CancellationToken ct)
    {
        await gate.WaitAsync(ct);try{return Load().Where(x=>x.Tenant==tenant && x.Payload is not null &&
            x.Acks.TryGetValue(branch,out var ack) && ack is null).Take(50).Select(x=>new Delivery(x.Id,x.Payload!)).ToArray();}
        finally{gate.Release();}
    }
    public async Task Ack(string tenant,string branch,Guid id,CancellationToken ct)
    {
        await gate.WaitAsync(ct);try
        {
            var all=Load();var e=all.SingleOrDefault(x=>x.Tenant==tenant && x.Id==id)
                ?? throw new InvalidOperationException("Envio no existe");
            if(!e.Acks.ContainsKey(branch))throw new InvalidOperationException("Destino no autorizado");
            e.Acks[branch]??=DateTime.UtcNow;
            if(e.Acks.Values.All(x=>x.HasValue))all[all.IndexOf(e)]=e with{Payload=null};
            Save(all);
        }finally{gate.Release();}
    }
    public async Task<BranchStatus[]> Status(RelayTenant tenant,CancellationToken ct)
    {
        await gate.WaitAsync(ct);try
        {
            var all=Load().Where(x=>x.Tenant==tenant.Id).ToArray();
            return tenant.Branches.Select(b=>new BranchStatus(b,all.Count(x=>x.Acks.TryGetValue(b,out var a)&&a is null),
                all.Where(x=>x.Acks.ContainsKey(b)).Select(x=>x.Acks[b]).DefaultIfEmpty().Max())).ToArray();
        }finally{gate.Release();}
    }
}

public sealed class MySqlRelayStore : IRelayStore
{
    private readonly string cs;
    private const long MaxQueuedBytes=32L*1024*1024;
    public MySqlRelayStore(string connectionString)
    {
        var b=new MySqlConnectionStringBuilder(connectionString);
        if(!b.Database.StartsWith("pointsale_sync_",StringComparison.OrdinalIgnoreCase))
            throw new InvalidOperationException("La cola requiere una base pointsale_sync_ independiente");
        cs=connectionString;
    }
    public const string Schema="""
        CREATE TABLE IF NOT EXISTS sync_tenant_state(
          tenant VARCHAR(64) CHARACTER SET ascii COLLATE ascii_bin NOT NULL PRIMARY KEY,
          queued_bytes BIGINT NOT NULL DEFAULT 0
        ) ENGINE=InnoDB;
        CREATE TABLE IF NOT EXISTS sync_event(
          tenant VARCHAR(64) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
          event_id CHAR(36) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
          payload_hash CHAR(64) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
          payload MEDIUMTEXT CHARACTER SET utf8mb4 NULL,
          payload_bytes INTEGER NOT NULL,
          created_at DATETIME(6) NOT NULL,
          PRIMARY KEY(tenant,event_id)
        ) ENGINE=InnoDB;
        CREATE TABLE IF NOT EXISTS sync_delivery(
          tenant VARCHAR(64) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
          event_id CHAR(36) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
          branch VARCHAR(64) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
          ack_at DATETIME(6) NULL,
          PRIMARY KEY(tenant,event_id,branch),
          INDEX pending_branch(tenant,branch,ack_at),
          FOREIGN KEY(tenant,event_id) REFERENCES sync_event(tenant,event_id)
        ) ENGINE=InnoDB;
        CREATE TABLE IF NOT EXISTS sync_completed(
          tenant VARCHAR(64) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
          event_id CHAR(36) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
          branches TEXT CHARACTER SET ascii NOT NULL,
          completed_at DATETIME(6) NOT NULL,
          PRIMARY KEY(tenant,event_id),
          FOREIGN KEY(tenant,event_id) REFERENCES sync_event(tenant,event_id)
        ) ENGINE=InnoDB;
        CREATE TABLE IF NOT EXISTS sync_branch_state(
          tenant VARCHAR(64) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
          branch VARCHAR(64) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
          last_ack_at DATETIME(6) NOT NULL,
          PRIMARY KEY(tenant,branch)
        ) ENGINE=InnoDB;
        """;
    public async Task Initialize(CancellationToken ct)
    {await using var c=new MySqlConnection(cs);await c.OpenAsync(ct);await using var q=new MySqlCommand(Schema,c);await q.ExecuteNonQueryAsync(ct);}
    private static MySqlCommand Q(MySqlConnection c,MySqlTransaction? tx,string sql,params object?[] args)
    {
        var q=new MySqlCommand(sql,c,tx);
        for(int i=0;i<args.Length;i++)q.Parameters.AddWithValue("p"+i,args[i]??DBNull.Value);return q;
    }
    public async Task Publish(Envelope envelope,RelayTenant tenant,CancellationToken ct)
    {
        await using var c=new MySqlConnection(cs);await c.OpenAsync(ct);await using var tx=await c.BeginTransactionAsync(ct);
        await using(var state=Q(c,tx,"INSERT IGNORE INTO sync_tenant_state(tenant) VALUES(@p0)",tenant.Id))await state.ExecuteNonQueryAsync(ct);
        long queued;
        await using(var state=Q(c,tx,"SELECT queued_bytes FROM sync_tenant_state WHERE tenant=@p0 FOR UPDATE",tenant.Id))queued=Convert.ToInt64(await state.ExecuteScalarAsync(ct));
        // Hash survives payload purge, so an ACK timeout cannot resurrect a delivered event.
        await using(var prior=Q(c,tx,"SELECT payload_hash FROM sync_event WHERE tenant=@p0 AND event_id=@p1 FOR UPDATE",tenant.Id,envelope.EventId.ToString()))
        {
            var hash=await prior.ExecuteScalarAsync(ct);
            if(hash is not null)
            {
                if(Convert.ToString(hash)!=envelope.Hash)throw new InvalidOperationException("UUID con otro contenido");
                await tx.CommitAsync(ct);return;
            }
        }
        int bytes=System.Text.Encoding.UTF8.GetByteCount(envelope.Json);
        if(queued+bytes>MaxQueuedBytes)throw new InvalidOperationException("Cuota de pendientes alcanzada; el origen conserva el cambio");
        await using(var insert=Q(c,tx,"INSERT INTO sync_event(tenant,event_id,payload_hash,payload,payload_bytes,created_at) VALUES(@p0,@p1,@p2,@p3,@p4,UTC_TIMESTAMP(6))",tenant.Id,envelope.EventId.ToString(),envelope.Hash,envelope.Json,bytes))await insert.ExecuteNonQueryAsync(ct);
        foreach(var b in tenant.Branches)
        {await using var q=Q(c,tx,"INSERT INTO sync_delivery(tenant,event_id,branch) VALUES(@p0,@p1,@p2)",tenant.Id,envelope.EventId.ToString(),b);await q.ExecuteNonQueryAsync(ct);}
        await using(var state=Q(c,tx,"UPDATE sync_tenant_state SET queued_bytes=queued_bytes+@p0 WHERE tenant=@p1",bytes,tenant.Id))await state.ExecuteNonQueryAsync(ct);
        await tx.CommitAsync(ct);
    }
    public async Task<Delivery[]> Pending(string tenant,string branch,CancellationToken ct)
    {
        await using var c=new MySqlConnection(cs);await c.OpenAsync(ct);
        await using var q=Q(c,null,"SELECT e.event_id,e.payload FROM sync_delivery d JOIN sync_event e ON e.tenant=d.tenant AND e.event_id=d.event_id WHERE d.tenant=@p0 AND d.branch=@p1 AND d.ack_at IS NULL AND e.payload IS NOT NULL ORDER BY e.created_at,e.event_id LIMIT 50",tenant,branch);
        await using var r=await q.ExecuteReaderAsync(ct);var rows=new List<Delivery>();
        while(await r.ReadAsync(ct))rows.Add(new(r.GetGuid(0),r.GetString(1)));return rows.ToArray();
    }
    public async Task Ack(string tenant,string branch,Guid id,CancellationToken ct)
    {
        await using var c=new MySqlConnection(cs);await c.OpenAsync(ct);await using var tx=await c.BeginTransactionAsync(ct);
        await using(var state=Q(c,tx,"SELECT queued_bytes FROM sync_tenant_state WHERE tenant=@p0 FOR UPDATE",tenant))
            if(await state.ExecuteScalarAsync(ct) is null)throw new InvalidOperationException("Cliente no existe");
        bool hasPayload;int bytes;
        await using(var locked=Q(c,tx,"SELECT payload IS NOT NULL,payload_bytes FROM sync_event WHERE tenant=@p0 AND event_id=@p1 FOR UPDATE",tenant,id.ToString()))
        {
            await using var r=await locked.ExecuteReaderAsync(ct);if(!await r.ReadAsync(ct))throw new InvalidOperationException("Envio no existe");
            hasPayload=r.GetBoolean(0);bytes=r.GetInt32(1);
        }
        await using(var allowed=Q(c,tx,"SELECT COUNT(*) FROM sync_delivery WHERE tenant=@p0 AND event_id=@p1 AND branch=@p2",tenant,id.ToString(),branch))
            if(Convert.ToInt32(await allowed.ExecuteScalarAsync(ct))!=1)
            {
                await using var completed=Q(c,tx,"SELECT branches FROM sync_completed WHERE tenant=@p0 AND event_id=@p1",tenant,id.ToString());
                var json=await completed.ExecuteScalarAsync(ct);
                if(hasPayload || json is not string text || !(JsonSerializer.Deserialize<string[]>(text)??[]).Contains(branch))
                    throw new InvalidOperationException("Destino no autorizado");
                await tx.CommitAsync(ct);return;
            }
        await using(var ack=Q(c,tx,"UPDATE sync_delivery SET ack_at=COALESCE(ack_at,UTC_TIMESTAMP(6)) WHERE tenant=@p0 AND event_id=@p1 AND branch=@p2",tenant,id.ToString(),branch))await ack.ExecuteNonQueryAsync(ct);
        await using(var state=Q(c,tx,"INSERT INTO sync_branch_state(tenant,branch,last_ack_at) SELECT tenant,branch,ack_at FROM sync_delivery WHERE tenant=@p0 AND event_id=@p1 AND branch=@p2 ON DUPLICATE KEY UPDATE last_ack_at=GREATEST(last_ack_at,VALUES(last_ack_at))",tenant,id.ToString(),branch))await state.ExecuteNonQueryAsync(ct);
        await using(var left=Q(c,tx,"SELECT COUNT(*) FROM sync_delivery WHERE tenant=@p0 AND event_id=@p1 AND ack_at IS NULL",tenant,id.ToString()))
            if(Convert.ToInt32(await left.ExecuteScalarAsync(ct))==0 && hasPayload)
            {
                var branches=new List<string>();
                await using(var recipients=Q(c,tx,"SELECT branch FROM sync_delivery WHERE tenant=@p0 AND event_id=@p1 ORDER BY branch",tenant,id.ToString()))
                await using(var r=await recipients.ExecuteReaderAsync(ct))while(await r.ReadAsync(ct))branches.Add(r.GetString(0));
                await using(var receipt=Q(c,tx,"INSERT INTO sync_completed(tenant,event_id,branches,completed_at) VALUES(@p0,@p1,@p2,UTC_TIMESTAMP(6))",tenant,id.ToString(),JsonSerializer.Serialize(branches)))await receipt.ExecuteNonQueryAsync(ct);
                await using var purge=Q(c,tx,"UPDATE sync_event SET payload=NULL WHERE tenant=@p0 AND event_id=@p1",tenant,id.ToString());await purge.ExecuteNonQueryAsync(ct);
                await using var state=Q(c,tx,"UPDATE sync_tenant_state SET queued_bytes=queued_bytes-@p0 WHERE tenant=@p1",bytes,tenant);await state.ExecuteNonQueryAsync(ct);
            }
        await tx.CommitAsync(ct);
    }
    public async Task<BranchStatus[]> Status(RelayTenant tenant,CancellationToken ct)
    {
        await using var c=new MySqlConnection(cs);await c.OpenAsync(ct);var result=new List<BranchStatus>();
        foreach(var b in tenant.Branches)
        {
            await using var q=Q(c,null,"SELECT COALESCE(SUM(ack_at IS NULL),0),GREATEST(COALESCE(MAX(ack_at),'1000-01-01'),COALESCE((SELECT last_ack_at FROM sync_branch_state WHERE tenant=@p0 AND branch=@p1),'1000-01-01')) FROM sync_delivery WHERE tenant=@p0 AND branch=@p1",tenant.Id,b);
            await using var r=await q.ExecuteReaderAsync(ct);await r.ReadAsync(ct);
            var last=r.GetDateTime(1);
            result.Add(new(b,r.GetInt32(0),last.Year==1000?null:DateTime.SpecifyKind(last,DateTimeKind.Utc)));
        }
        return result.ToArray();
    }

    // Only fanout detail expires. UUID hashes and compact recipients survive for replay safety.
    public async Task<int> PruneConfirmed(string tenant,int retentionDays,CancellationToken ct)
    {
        if(retentionDays is <7 or >365)throw new InvalidOperationException("Retencion permitida: 7 a 365 dias");
        await using var c=new MySqlConnection(cs);await c.OpenAsync(ct);await using var tx=await c.BeginTransactionAsync(ct);
        await using(var state=Q(c,tx,"SELECT queued_bytes FROM sync_tenant_state WHERE tenant=@p0 FOR UPDATE",tenant))await state.ExecuteScalarAsync(ct);
        await using var q=Q(c,tx,"DELETE d FROM sync_delivery d JOIN sync_completed x ON x.tenant=d.tenant AND x.event_id=d.event_id JOIN sync_event e ON e.tenant=d.tenant AND e.event_id=d.event_id WHERE d.tenant=@p0 AND d.ack_at IS NOT NULL AND e.payload IS NULL AND x.completed_at<DATE_SUB(UTC_TIMESTAMP(6),INTERVAL @p1 DAY)",tenant,retentionDays);
        var removed=await q.ExecuteNonQueryAsync(ct);await tx.CommitAsync(ct);return removed;
    }
}
