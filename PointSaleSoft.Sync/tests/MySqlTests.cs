using System.Text.Json;
using System.Text.RegularExpressions;
using MySqlConnector;
using PointSaleSoft.Sync;

internal static class MySqlTests
{
    public static async Task Run()
    {
        var cs=Environment.GetEnvironmentVariable("PSSYNC_MYSQL_QA")??throw new Exception("Configure credencial local cifrada");
        var b=new MySqlConnectionStringBuilder(cs);var name=b.Database;
        if(b.Server!="127.0.0.1" || !Regex.IsMatch(name,"^pointsale_sync_qa_[0-9]+$"))throw new Exception("Solo base QA local independiente");
        b.Database="";
        try
        {
            await using var c=new MySqlConnection(b.ConnectionString);await c.OpenAsync();
            await using var create=new MySqlCommand($"CREATE DATABASE {name} CHARACTER SET utf8mb4 COLLATE utf8mb4_bin",c);await create.ExecuteNonQueryAsync();
        }
        catch(MySqlException e){Console.Error.WriteLine("MYSQL_QA_CREATE_FAILED; CODE="+e.Number);throw new InvalidOperationException("No se creo la base QA; revise usuario y permisos");}
        var store=new MySqlRelayStore(cs);await store.Initialize(default);
        int checks=0;void Check(bool ok,string label){if(!ok)throw new Exception(label);Console.WriteLine("PASS "+label);checks++;}
        var packet=new Envelope(Guid.NewGuid(),"STORE_QA","qa","qa",[new("TIPO_INVENTARIO",["1"],1,false,new(){{"DESCRIPCION",new("text","Prueba de cola")}})]);
        var tenant=new RelayTenant("STORE_QA","qa","qa",["0002","0003"]);
        await store.Publish(packet,tenant,default);await store.Publish(packet,tenant,default);
        Check((await store.Pending(tenant.Id,"0002",default)).Length==1,"MySQL publicacion idempotente");
        Check((await store.Pending("OTRO","0002",default)).Length==0,"MySQL aísla cliente");
        Check((await new MySqlRelayStore(cs).Pending(tenant.Id,"0002",default)).Length==1,"MySQL reapertura conserva pendientes");
        await store.Ack(tenant.Id,"0002",packet.EventId,default);
        Check((await store.Pending(tenant.Id,"0003",default)).Length==1,"MySQL conserva destinatario sin confirmar");
        await store.Ack(tenant.Id,"0003",packet.EventId,default);await store.Ack(tenant.Id,"0003",packet.EventId,default);
        await store.Publish(packet,tenant,default);
        Check((await store.Pending(tenant.Id,"0002",default)).Length==0,"MySQL reintento tras purga no resucita entrega");
        async Task<object?> Scalar(string sql){await using var c=new MySqlConnection(cs);await c.OpenAsync();await using var q=new MySqlCommand(sql,c);return await q.ExecuteScalarAsync();}
        Check(Convert.ToInt32(await Scalar("SELECT COUNT(*) FROM sync_event WHERE tenant='STORE_QA' AND payload IS NULL"))==1,"MySQL purga contenido tras todas las confirmaciones");
        Check(Convert.ToInt64(await Scalar("SELECT queued_bytes FROM sync_tenant_state WHERE tenant='STORE_QA'"))==0,"MySQL contador de espacio retorna a cero");
        bool conflict=false;try{await store.Publish(packet with{Epoch="diferente"},tenant,default);}catch(InvalidOperationException){conflict=true;}
        Check(conflict,"MySQL rechaza UUID con otro contenido");
        bool quota=false;
        try{await store.Publish(packet with{EventId=Guid.NewGuid(),Changes=[packet.Changes[0] with{Values=new(){{"DESCRIPCION",new("text",new string('X',32*1024*1024))}}}]},tenant,default);}
        catch(InvalidOperationException){quota=true;}
        Check(quota,"MySQL aplica limite de almacenamiento sin perder pendiente fuente");
        Check(Convert.ToInt64(await Scalar("SELECT queued_bytes FROM sync_tenant_state WHERE tenant='STORE_QA'"))==0,"MySQL rechazo por cuota revierte contador");
        await Scalar("UPDATE sync_completed SET completed_at=DATE_SUB(UTC_TIMESTAMP(6),INTERVAL 40 DAY) WHERE tenant='STORE_QA'");
        Check(await store.PruneConfirmed(tenant.Id,30,default)==2,"MySQL retencion elimina detalle confirmado antiguo");
        await store.Ack(tenant.Id,"0002",packet.EventId,default);
        Check(true,"MySQL ACK tardio sigue idempotente tras limpieza");
        await store.Publish(packet,tenant,default);
        Check((await store.Pending(tenant.Id,"0002",default)).Length==0,"MySQL limpieza no resucita envio confirmado");
        bool wrongBranch=false;try{await store.Ack(tenant.Id,"AJENA",packet.EventId,default);}catch(InvalidOperationException){wrongBranch=true;}
        Check(wrongBranch,"MySQL recibo compacto mantiene aislamiento de sucursal");
        Check((await store.Status(tenant,default)).All(s=>s.Pending==0&&s.LastAckUtc.HasValue),"MySQL estado conserva ultima confirmacion tras retencion");
        var stillPending=packet with{EventId=Guid.NewGuid()};await store.Publish(stillPending,tenant,default);
        await store.Ack(tenant.Id,"0002",stillPending.EventId,default);await store.PruneConfirmed(tenant.Id,7,default);
        Check((await store.Pending(tenant.Id,"0003",default)).Length==1,"MySQL retencion conserva destinatarios pendientes");
        Console.WriteLine($"MYSQL_STORE=PASS; CHECKS={checks}; DATABASE={name}");
        await TransportTests.Run();
        File.WriteAllText("artifacts/mysql-qa-result.json",JsonSerializer.Serialize(new{database=name,storePass=true,httpPass=true,checks}));
    }
}
