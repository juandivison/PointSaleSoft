using System.Text.Json;
using System.Text.RegularExpressions;
using FirebirdSql.Data.FirebirdClient;
using PointSaleSoft.Sync;

internal static class BundleTests
{
    public static void Run()
    {
        int checks=0;void Check(bool ok,string text){if(!ok)throw new Exception(text);Console.WriteLine("PASS "+text);checks++;}
        var root=Path.GetFullPath("artifacts");using var config=JsonDocument.Parse(File.ReadAllText(Path.Combine(root,"qa.json")));
        var dfm=File.ReadAllText(@"C:\Proyectos\PointSaleSoftResp\PuntoVenta\Fuentes\UDatModConectar.dfm");
        string Cs(string name)
        {
            var path=config.RootElement.GetProperty(name).GetString()!;
            if(!Path.GetFullPath(path).StartsWith(root+Path.DirectorySeparatorChar,StringComparison.OrdinalIgnoreCase))throw new Exception("Solo copias QA");
            return new FbConnectionStringBuilder{Database=path,DataSource="localhost",Dialect=1,Charset="ISO8859_1",Pooling=false,
                UserID=Regex.Match(dfm,"user_name=([^']*)'").Groups[1].Value,Password=Regex.Match(dfm,"password=([^']*)'").Groups[1].Value}.ConnectionString;
        }
        var mainCs=Cs("principal");var branchCs=Cs("sucursal");
        object? Scalar(string cs,string sql){using var c=new FbConnection(cs);c.Open();using var tx=c.BeginTransaction();using var q=new FbCommand(sql,c,tx);var v=q.ExecuteScalar();tx.Rollback();return v;}
        void Exec(string cs,string sql){using var c=new FbConnection(cs);c.Open();using var tx=c.BeginTransaction();using var q=new FbCommand(sql,c,tx);q.ExecuteNonQuery();tx.Commit();}
        var policy=JsonSerializer.Deserialize<CatalogPolicy>(File.ReadAllText(Path.Combine(root,"policy.json")))!;
        var epoch=File.ReadAllText(Path.Combine(root,"epoch.txt"));var main=new FirebirdCatalog(mainCs);var branch=new FirebirdCatalog(branchCs);
        int code=Convert.ToInt32(Scalar(mainCs,"SELECT MAX(CODIGO) FROM INVENTARIO_PRODUCTO"));
        int unit=Convert.ToInt32(Scalar(mainCs,"SELECT MIN(IDUNIDAD) FROM UNIDADES"));
        int classification=Convert.ToInt32(Scalar(mainCs,"SELECT MIN(CODIGO) FROM TIPO_INVENTARIO"));
        var oldStock=Convert.ToDouble(Scalar(branchCs,$"SELECT CANTIDAD FROM INVENTARIO_PRODUCTO WHERE CODIGO={code}"));
        while(main.NextPending(policy,"PROSESUR_QA",epoch) is { } old)main.Published(old.EventId);
        // Force a fresh event even when rerunning against the same QA fixtures.
        Exec(mainCs,$"UPDATE INVENTARIO_PRODUCTO SET PRECIO=87 WHERE CODIGO={code}");
        if(Convert.ToInt32(Scalar(mainCs,$"SELECT COUNT(*) FROM PRECIO_UNIDADSURTIDORA WHERE IDUNIDAD={unit} AND COD_PRODUCTO={code}"))==0)
            Exec(mainCs,$"INSERT INTO PRECIO_UNIDADSURTIDORA(IDUNIDAD,COD_PRODUCTO,DESCRIPCION,CANTIDAD,PRECIOVENTA1) VALUES({unit},{code},'Presentacion QA',12,880)");
        else Exec(mainCs,$"UPDATE PRECIO_UNIDADSURTIDORA SET PRECIOVENTA1=880 WHERE IDUNIDAD={unit} AND COD_PRODUCTO={code}");
        // Update the product after the price event; materialization must capture
        // the coherent current product+prices+dependencies, not a half-update.
        Exec(mainCs,$"UPDATE INVENTARIO_PRODUCTO SET PRECIO=88,TIPO={classification},TIPO_UNIDAD={unit} WHERE CODIGO={code}");
        var envelope=main.NextPending(policy,"PROSESUR_QA",epoch)!;
        Check(envelope.Changes.Any(x=>x.Table=="INVENTARIO_PRODUCTO"),"paquete incluye producto");
        Check(envelope.Changes.Any(x=>x.Table=="PRECIO_UNIDADSURTIDORA"),"paquete incluye precios por unidad");
        Check(envelope.Changes.Any(x=>x.Table=="UNIDADES"),"paquete incluye unidad dependiente");
        Check(envelope.Changes.Any(x=>x.Table=="TIPO_INVENTARIO"),"paquete incluye clasificacion dependiente");
        branch.Apply(policy,envelope,"PROSESUR_QA",epoch);
        Check(Convert.ToDouble(Scalar(branchCs,$"SELECT PRECIO FROM INVENTARIO_PRODUCTO WHERE CODIGO={code}"))==88,"producto y precios aplicados juntos");
        Check(Convert.ToDouble(Scalar(branchCs,$"SELECT PRECIOVENTA1 FROM PRECIO_UNIDADSURTIDORA WHERE COD_PRODUCTO={code} AND IDUNIDAD={unit}"))==880,"precio por unidad coincide");
        Check(Convert.ToDouble(Scalar(branchCs,$"SELECT CANTIDAD FROM PRECIO_UNIDADSURTIDORA WHERE COD_PRODUCTO={code} AND IDUNIDAD={unit}"))==12,"factor de presentacion se distribuye");
        Check(Convert.ToDouble(Scalar(branchCs,$"SELECT CANTIDAD FROM INVENTARIO_PRODUCTO WHERE CODIGO={code}"))==oldStock,"factor no reemplaza existencias locales");
        Exec(branchCs,"CREATE EXCEPTION PSSYNC_QA_FAIL 'Fallo simulado QA'");
        Exec(branchCs,$"CREATE TRIGGER PSSYNC_QA_FAIL_PRICE FOR PRECIO_UNIDADSURTIDORA ACTIVE BEFORE UPDATE POSITION 32767 AS BEGIN IF(NEW.COD_PRODUCTO={code} AND NEW.PRECIOVENTA1=881) THEN EXCEPTION PSSYNC_QA_FAIL; END");
        var broken=envelope with{EventId=Guid.NewGuid(),Changes=envelope.Changes.Select(x=>
        {
            var values=new Dictionary<string,Cell>(x.Values);
            if(x.Table=="INVENTARIO_PRODUCTO")values["PRECIO"]=values["PRECIO"] with{Value="89"};
            if(x.Table=="PRECIO_UNIDADSURTIDORA")values["PRECIOVENTA1"]=values["PRECIOVENTA1"] with{Value="881"};
            return x with{Revision=x.Revision+100,Values=values};
        }).ToArray()};
        bool rolledBack=false;try{branch.Apply(policy,broken,"PROSESUR_QA",epoch);}catch(FbException){rolledBack=true;}
        finally{Exec(branchCs,"DROP TRIGGER PSSYNC_QA_FAIL_PRICE");Exec(branchCs,"DROP EXCEPTION PSSYNC_QA_FAIL");}
        Check(rolledBack,"fallo en precios cancela paquete entero");
        Check(Convert.ToDouble(Scalar(branchCs,$"SELECT PRECIO FROM INVENTARIO_PRODUCTO WHERE CODIGO={code}"))==88,"rollback conserva precio anterior del producto");
        Check(Convert.ToInt32(Scalar(branchCs,$"SELECT COUNT(*) FROM PSSYNC_INBOX WHERE EVENT_ID='{broken.EventId}'"))==0,"fallo no deja confirmacion local");
        Console.WriteLine($"SYNC_BUNDLE=PASS; CHECKS={checks}; ORIGINAL_MODIFIED=0");
    }
}
