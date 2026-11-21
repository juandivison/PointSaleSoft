using System.Data;
using FirebirdSql.Data.FirebirdClient;

namespace PointSaleSoft.Sync;

public sealed class FirebirdCatalog(string connectionString)
{
    private FbConnection Open()
    {
        var c = new FbConnection(connectionString); c.Open(); return c;
    }
    private static FbTransaction Snapshot(FbConnection c) => c.BeginTransaction(new FbTransactionOptions
    { TransactionBehavior = FbTransactionBehavior.Read | FbTransactionBehavior.Concurrency });
    private static FbCommand Command(FbConnection c, FbTransaction tx, string sql, params object?[] args)
    {
        var charsetName=new FbConnectionStringBuilder(c.ConnectionString).Charset.ToUpperInvariant();
        var charset=charsetName switch
        {
            "ISO8859_1"=>FbCharset.Iso8859_1,"WIN1252"=>FbCharset.Windows1252,
            "UTF8"=>FbCharset.Utf8,"NONE"=>FbCharset.None,"ASCII"=>FbCharset.Ascii,
            _=>throw new InvalidOperationException("Codificacion no validada para sincronizacion")
        };
        // In legacy CHARACTER SET NONE columns, the provider prepares text
        // parameters as NONE (UTF8 bytes) even on an ISO8859_1 connection.
        // An explicit parameter cast gives the descriptor the correct charset.
        for(int i=args.Length-1;i>=0;i--)
            if(args[i] is string text)
            {
                int length=Math.Max(1,text.Length);
                var type=length>(charsetName=="UTF8"?8191:32765) ? "BLOB SUB_TYPE TEXT" : $"VARCHAR({length})";
                sql=System.Text.RegularExpressions.Regex.Replace(sql,$"@p{i}(?![0-9])",$"CAST(@p{i} AS {type} CHARACTER SET {charsetName})");
            }
        var q = new FbCommand(sql, c, tx) { CommandTimeout = 120 };
        for (int i = 0; i < args.Length; i++)
        {
            var p=q.Parameters.AddWithValue("p" + i, args[i] ?? DBNull.Value);
            // NONE legacy columns do not transliterate UTF8 parameters for us.
            // Explicit parameter encoding must match the connection's legacy encoding.
            if(args[i] is string)p.Charset=charset;
        }
        return q;
    }
    private static int Exec(FbConnection c, FbTransaction tx, string sql, params object?[] args)
    { using var q = Command(c, tx, sql, args); return q.ExecuteNonQuery(); }
    private static string Key(string[] key) => string.Join('\u001f', key);
    private static string Literal(string text) => "'" + text.Replace("'", "''") + "'";
    private static bool Exists(FbConnection c, FbTransaction tx, string table)
    {
        using var q = Command(c, tx,"SELECT COUNT(*) FROM RDB$RELATIONS WHERE RDB$RELATION_NAME=@p0",table);
        return Convert.ToInt32(q.ExecuteScalar()) == 1;
    }
    private static readonly (string Name, string[] Keys)[] Definitions =
    [
        ("TIPO_INVENTARIO", ["CODIGO"]), ("INVENTARIO_CATEGORIA", ["CODCATEGORIA"]),
        ("INVENTARIO_SUBCATEGORIA", ["CODSUBCATEGORIA"]), ("UNIDADES", ["IDUNIDAD"]),
        ("MONEDA", ["CODIGO"]), ("MONEDA_DET", ["SERIE","CODIGO"]),
        ("TASA_ITBIS", ["IDTASAITBIS"]), ("TIPO_PRECIO", ["PRECIO_ID"]),
        ("INVENTARIO_PRODUCTO", ["CODIGO"]),
        ("PRECIO_UNIDADSURTIDORA", ["IDUNIDAD","COD_PRODUCTO"]),
        ("PRECIO_INVENTARIO", ["CODIGO_TEXTO","FECHA_INICIAL","FECHA_FINAL"]),
        ("CLASIF_PRECIO", ["COD_PRODUCTO","PRECIO_ID"])
    ];
    private static readonly HashSet<string> AuditFields = new(StringComparer.Ordinal)
    { "COD_USUARIO_IN","COD_USUARIO_UPD","COD_USUARIO","USER_IN","USER_MOD","IN_POR","MOD_POR",
      "FECHA_IN","FECHA_MOD","FECHA_UPDATE","FECHA_UPD","INSERTADO_POR","MODIFICADO_POR",
      "FECHA_UPCAMPO_FECHA_HORA" };

    public CatalogPolicy DiscoverPolicy()
    {
        using var c = Open(); using var tx = Snapshot(c); var tables = new List<TablePolicy>();
        foreach (var def in Definitions)
        {
            if (!Exists(c,tx,def.Name)) continue;
            using var q = Command(c,tx,"SELECT TRIM(RF.RDB$FIELD_NAME),F.RDB$FIELD_TYPE,F.RDB$FIELD_SUB_TYPE " +
                "FROM RDB$RELATION_FIELDS RF JOIN RDB$FIELDS F ON F.RDB$FIELD_NAME=RF.RDB$FIELD_SOURCE " +
                "WHERE RF.RDB$RELATION_NAME=@p0 AND F.RDB$COMPUTED_BLR IS NULL ORDER BY RF.RDB$FIELD_POSITION",def.Name);
            var fields = new List<string>(); using (var r = q.ExecuteReader()) while (r.Read())
            {
                var f = r.GetString(0); var type = r.GetInt16(1);
                if (type == 261 || AuditFields.Contains(f) || f.StartsWith("AUD_",StringComparison.Ordinal)) continue;
                if (def.Name == "INVENTARIO_PRODUCTO" && CatalogPolicy.ProtectedFields.Contains(f)) continue;
                fields.Add(SqlName.Check(f));
            }
            if (def.Keys.Any(k=>!fields.Contains(k))) throw new InvalidOperationException("Clave no soportada: " + def.Name);
            tables.Add(new(def.Name,def.Keys,fields.ToArray(),tables.Count));
        }
        var policy = new CatalogPolicy(tables.ToArray()); policy.Validate(); tx.Rollback(); return policy;
    }

    public void ValidateSchema(CatalogPolicy policy)
    {
        policy.Validate(); using var c = Open(); using var tx = Snapshot(c);
        foreach (var t in policy.Tables)
        {
            using var q = Command(c,tx,$"SELECT FIRST 1 {string.Join(',',t.Fields)} FROM {t.Name}");
            using (var r=q.ExecuteReader()) { /* Preparation verifies all fields. */ }
            using var duplicate = Command(c,tx,$"SELECT FIRST 1 COUNT(*) FROM {t.Name} GROUP BY {string.Join(',',t.Keys)} HAVING COUNT(*)>1");
            if (duplicate.ExecuteScalar() is not null) throw new InvalidOperationException("Claves duplicadas: " + t.Name);
            using var nullKey=Command(c,tx,$"SELECT FIRST 1 1 FROM {t.Name} WHERE {string.Join(" OR ",t.Keys.Select(k=>k+" IS NULL"))}");
            if (nullKey.ExecuteScalar() is not null) throw new InvalidOperationException("Clave nula: " + t.Name);
        }
        tx.Rollback();
    }

    public string Install(CatalogPolicy policy,string role,string? epoch=null)
    {
        ValidateSchema(policy);
        if (role is not ("source" or "branch")) throw new InvalidOperationException("Rol invalido");
        using var c=Open(); var tx=c.BeginTransaction();
        void CommitPhase(){tx.Commit();tx.Dispose();tx=c.BeginTransaction();}
        try
        {
        if (Exists(c,tx,"PSSYNC_META"))
        {
            using var q=Command(c,tx,"SELECT EPOCH,POLICY_HASH,NODE_ROLE FROM PSSYNC_META WHERE ID=1");
            using var r=q.ExecuteReader();
            if (!r.Read() || r.GetString(1).Trim()!=policy.Hash || r.GetString(2).Trim()!=role ||
                (epoch is not null && r.GetString(0).Trim()!=epoch)) throw new InvalidOperationException("Instalacion previa con otra identidad/contrato");
            var existing=r.GetString(0).Trim(); r.Close();
            CheckInstallation(c,tx,policy,role); tx.Rollback(); return existing;
        }
        epoch ??= Guid.NewGuid().ToString();
        Exec(c,tx,"CREATE TABLE PSSYNC_META(ID INTEGER NOT NULL PRIMARY KEY,EPOCH VARCHAR(36) NOT NULL,POLICY_HASH VARCHAR(64) NOT NULL,NODE_ROLE VARCHAR(8) NOT NULL,READY SMALLINT NOT NULL)");
        Exec(c,tx,"CREATE TABLE PSSYNC_REV(TABLE_NAME VARCHAR(31) CHARACTER SET ASCII NOT NULL,ROW_KEY VARCHAR(245) CHARACTER SET ASCII NOT NULL,REVISION INTEGER NOT NULL,DELETED_FLAG SMALLINT NOT NULL,PRIMARY KEY(TABLE_NAME,ROW_KEY))");
        Exec(c,tx,"CREATE TABLE PSSYNC_INBOX(EVENT_ID VARCHAR(36) NOT NULL PRIMARY KEY,PAYLOAD_HASH VARCHAR(64) NOT NULL,APPLIED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP)");
        CommitPhase(); // Firebird 2.5 must publish table metadata before preparing DML.
        Exec(c,tx,"INSERT INTO PSSYNC_META(ID,EPOCH,POLICY_HASH,NODE_ROLE,READY) VALUES(1,@p0,@p1,@p2,0)",epoch,policy.Hash,role);
        if (role=="source")
        {
            Exec(c,tx,"CREATE TABLE PSSYNC_OUTBOX(EVENT_ID VARCHAR(36) NOT NULL PRIMARY KEY,TABLE_NAME VARCHAR(31) NOT NULL,KEY1 VARCHAR(80) NOT NULL,KEY2 VARCHAR(80) NOT NULL,KEY3 VARCHAR(80) NOT NULL,PAYLOAD BLOB SUB_TYPE TEXT,PUBLISHED SMALLINT DEFAULT 0 NOT NULL,CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP)");
            Exec(c,tx,"CREATE INDEX IX_PSSYNC_PENDING ON PSSYNC_OUTBOX(PUBLISHED,CREATED_AT)");
            Exec(c,tx,"CREATE EXCEPTION PSSYNC_REV_EXHAUSTED 'Revision de catalogo agotada'");
            CommitPhase();
            Exec(c,tx,"CREATE PROCEDURE PSSYNC_CAPTURE(T VARCHAR(31),K1 VARCHAR(80),K2 VARCHAR(80),K3 VARCHAR(80),D SMALLINT) AS DECLARE VARIABLE K VARCHAR(245); BEGIN " +
                "K=K1||ASCII_CHAR(31)||K2||ASCII_CHAR(31)||K3; " +
                "IF(EXISTS(SELECT 1 FROM PSSYNC_REV WHERE TABLE_NAME=:T AND ROW_KEY=:K AND REVISION=2147483647)) THEN EXCEPTION PSSYNC_REV_EXHAUSTED; " +
                "UPDATE PSSYNC_REV SET REVISION=REVISION+1,DELETED_FLAG=:D WHERE TABLE_NAME=:T AND ROW_KEY=:K; " +
                "IF(ROW_COUNT=0) THEN INSERT INTO PSSYNC_REV(TABLE_NAME,ROW_KEY,REVISION,DELETED_FLAG) VALUES(:T,:K,1,:D); " +
                "INSERT INTO PSSYNC_OUTBOX(EVENT_ID,TABLE_NAME,KEY1,KEY2,KEY3) VALUES(LOWER(UUID_TO_CHAR(GEN_UUID())),:T,:K1,:K2,:K3); END");
            CommitPhase();
            int i=0;
            foreach(var t in policy.Tables)
            {
                string Args(string context) => string.Join(',',Enumerable.Range(0,3).Select(n=>n<t.Keys.Length ?
                    $"TRIM(CAST({context}.{t.Keys[n]} AS VARCHAR(80)))" : "''"));
                var changed=string.Join(" OR ",t.Fields.Select(f=>$"OLD.{f} IS DISTINCT FROM NEW.{f}"));
                var keyChanged=string.Join(" OR ",t.Keys.Select(f=>$"OLD.{f} IS DISTINCT FROM NEW.{f}"));
                var body=$"CREATE TRIGGER PSSYNC_C_{i++} FOR {t.Name} ACTIVE AFTER INSERT OR UPDATE OR DELETE POSITION 32760 AS BEGIN " +
                    $"IF(DELETING) THEN EXECUTE PROCEDURE PSSYNC_CAPTURE({Literal(t.Name)},{Args("OLD")},1); ELSE BEGIN " +
                    $"IF(UPDATING AND ({keyChanged})) THEN EXECUTE PROCEDURE PSSYNC_CAPTURE({Literal(t.Name)},{Args("OLD")},1); " +
                    $"IF(INSERTING OR ({changed})) THEN EXECUTE PROCEDURE PSSYNC_CAPTURE({Literal(t.Name)},{Args("NEW")},0); END END";
                Exec(c,tx,body);
            }
        }
        else
        {
            Exec(c,tx,"CREATE EXCEPTION PSSYNC_READONLY 'Catalogo administrado desde oficina principal'");
            CommitPhase();
            int i=0;
            foreach(var t in policy.Tables)
            {
                var changed=string.Join(" OR ",t.Fields.Select(f=>$"OLD.{f} IS DISTINCT FROM NEW.{f}"));
                Exec(c,tx,$"CREATE TRIGGER PSSYNC_G_{i++} FOR {t.Name} ACTIVE BEFORE INSERT OR UPDATE OR DELETE POSITION 32760 AS BEGIN " +
                    "IF(COALESCE(RDB$GET_CONTEXT('USER_TRANSACTION','PSSYNC_APPLY'),'0')<>'1') THEN " +
                    $"IF(INSERTING OR DELETING OR ({changed})) THEN EXCEPTION PSSYNC_READONLY; END");
            }
        }
        if(role=="source")Exec(c,tx,"UPDATE PSSYNC_META SET READY=1 WHERE ID=1");
        tx.Commit(); return epoch;
        }
        finally{tx.Dispose();}
    }

    public void InitializeEmptyBranch()
    {
        using var c=Open();using var tx=c.BeginTransaction();
        if(Exists(c,tx,"PSSYNC_META"))throw new InvalidOperationException("La inicializacion en cero solo admite una base nueva");
        var tables=new List<string>();var generators=new List<string>();
        using(var q=Command(c,tx,"SELECT TRIM(RDB$RELATION_NAME) FROM RDB$RELATIONS WHERE COALESCE(RDB$SYSTEM_FLAG,0)=0 AND RDB$VIEW_BLR IS NULL"))
        using(var r=q.ExecuteReader())while(r.Read())tables.Add(SqlName.Check(r.GetString(0)));
        foreach(var table in tables)
        {
            using var q=Command(c,tx,$"SELECT FIRST 1 1 FROM {table}");
            if(q.ExecuteScalar() is not null)throw new InvalidOperationException("Base no vacia; no se reinician secuencias: "+table);
        }
        using(var q=Command(c,tx,"SELECT TRIM(RDB$GENERATOR_NAME) FROM RDB$GENERATORS WHERE COALESCE(RDB$SYSTEM_FLAG,0)=0"))
        using(var r=q.ExecuteReader())while(r.Read())generators.Add(SqlName.Check(r.GetString(0)));
        // Generator changes are not transactional. All emptiness checks finish first.
        foreach(var g in generators)Exec(c,tx,$"SET GENERATOR {g} TO 0");
        tx.Commit();
    }

    public void PrepareBranch(CatalogPolicy policy,string epoch)
    {
        bool installed;
        using(var c=Open())using(var tx=Snapshot(c)){installed=Exists(c,tx,"PSSYNC_META");tx.Rollback();}
        if(!installed)InitializeEmptyBranch();
        Install(policy,"branch",epoch);
    }

    // Revision keys are padded to three components, matching the Firebird trigger.
    private static string RevisionKey(string[] keys) => Key(keys.Concat(Enumerable.Repeat("",3-keys.Length)).ToArray());
    private static string Where(TablePolicy t) => string.Join(" AND ",t.Keys.Select((k,i)=>$"{k}=@p{i}"));
    private static Dictionary<string,Cell> Row(FbDataReader r,TablePolicy t) =>
        t.Fields.Select((f,i)=>(f,value:Cell.From(r.GetValue(i)))).ToDictionary(x=>x.f,x=>x.value);

    private static void CheckNode(FbConnection c,FbTransaction tx,CatalogPolicy policy,string epoch,string role,bool ready)
    {
        using var q=Command(c,tx,"SELECT EPOCH,POLICY_HASH,NODE_ROLE,READY FROM PSSYNC_META WHERE ID=1");
        using var r=q.ExecuteReader();
        if(!r.Read() || r.GetString(0).Trim()!=epoch || r.GetString(1).Trim()!=policy.Hash ||
            r.GetString(2).Trim()!=role || (ready&&r.GetInt16(3)!=1))
            throw new InvalidOperationException("Base, rol o carga inicial no corresponden al agente");
    }
    public void VerifyNode(CatalogPolicy policy,string epoch,string role)
    {using var c=Open();using var tx=Snapshot(c);CheckNode(c,tx,policy,epoch,role,true);CheckInstallation(c,tx,policy,role);tx.Rollback();}

    private static void CheckInstallation(FbConnection c,FbTransaction tx,CatalogPolicy policy,string role)
    {
        foreach(var table in new[]{"PSSYNC_META","PSSYNC_REV","PSSYNC_INBOX"}.Concat(role=="source"?new[]{"PSSYNC_OUTBOX"}:[]))
            if(!Exists(c,tx,table))throw new InvalidOperationException("Instalacion incompleta: "+table);
        for(int i=0;i<policy.Tables.Length;i++)
        {
            using var q=Command(c,tx,"SELECT RDB$TRIGGER_INACTIVE,RDB$TRIGGER_TYPE,TRIM(RDB$RELATION_NAME),RDB$TRIGGER_SEQUENCE FROM RDB$TRIGGERS WHERE RDB$TRIGGER_NAME=@p0",
                (role=="source"?"PSSYNC_C_":"PSSYNC_G_")+i);
            using var r=q.ExecuteReader();
            if(!r.Read() || r.GetInt16(0)!=0 || r.GetInt16(1)!=(role=="source"?114:113) || r.GetString(2)!=policy.Tables[i].Name || r.GetInt16(3)!=32760)
                throw new InvalidOperationException("Trigger de sincronizacion ausente o alterado: "+policy.Tables[i].Name);
        }
        if(role=="source")
        {
            using var q=Command(c,tx,"SELECT COUNT(*) FROM RDB$PROCEDURES WHERE RDB$PROCEDURE_NAME='PSSYNC_CAPTURE' AND RDB$VALID_BLR=1");
            if(Convert.ToInt32(q.ExecuteScalar())!=1)throw new InvalidOperationException("Captura transaccional incompleta");
        }
    }

    public object Status(CatalogPolicy policy,string epoch,string role)
    {
        VerifyNode(policy,epoch,role);
        using var c=Open();using var tx=Snapshot(c);
        var counts=new Dictionary<string,int>();
        foreach(var t in policy.Tables){using var q=Command(c,tx,$"SELECT COUNT(*) FROM {t.Name}");counts[t.Name]=Convert.ToInt32(q.ExecuteScalar());}
        using var pending=Command(c,tx,role=="source"?"SELECT COUNT(*) FROM PSSYNC_OUTBOX WHERE PUBLISHED=0":"SELECT COUNT(*) FROM PSSYNC_INBOX");
        var events=Convert.ToInt32(pending.ExecuteScalar());tx.Rollback();
        return new{role,epoch,policyHash=policy.Hash,ready=true,counts,events};
    }

    public object VerifyCleanBranch(CatalogPolicy policy,string epoch)
    {
        VerifyNode(policy,epoch,"branch");
        using var c=Open();using var tx=Snapshot(c);
        using(var q=Command(c,tx,"SELECT COUNT(*) FROM INVENTARIO_PRODUCTO WHERE COALESCE(CANTIDAD,0)<>0 OR COALESCE(BLCE_CANT_ENTRADA,0)<>0 OR COALESCE(BLCE_CANT_SALIDA,0)<>0 OR COALESCE(PRECIO_COMPRA,0)<>0"))
            if(Convert.ToInt32(q.ExecuteScalar())!=0)throw new InvalidOperationException("Sucursal contiene existencias, acumulados o costos");
        var tables=new List<string>();var generators=new List<string>();
        using(var q=Command(c,tx,"SELECT TRIM(RDB$RELATION_NAME) FROM RDB$RELATIONS WHERE COALESCE(RDB$SYSTEM_FLAG,0)=0 AND RDB$VIEW_BLR IS NULL"))
        using(var r=q.ExecuteReader())while(r.Read())tables.Add(SqlName.Check(r.GetString(0)));
        int emptyTables=0;
        foreach(var table in tables.Where(t=>!t.StartsWith("PSSYNC_",StringComparison.Ordinal)&&!policy.Tables.Any(p=>p.Name==t)))
        {
            using var q=Command(c,tx,$"SELECT FIRST 1 1 FROM {table}");
            if(q.ExecuteScalar() is not null)throw new InvalidOperationException("Tabla local no vacia: "+table);
            emptyTables++;
        }
        using(var q=Command(c,tx,"SELECT TRIM(RDB$GENERATOR_NAME) FROM RDB$GENERATORS WHERE COALESCE(RDB$SYSTEM_FLAG,0)=0"))
        using(var r=q.ExecuteReader())while(r.Read())generators.Add(SqlName.Check(r.GetString(0)));
        foreach(var generator in generators.Where(g=>g!="GEN_NUM_INV_PROD"))
        {
            using var q=Command(c,tx,$"SELECT GEN_ID({generator},0) FROM RDB$DATABASE");
            if(Convert.ToInt64(q.ExecuteScalar())!=0)throw new InvalidOperationException("Numeracion local no esta en cero: "+generator);
        }
        using(var q=Command(c,tx,"SELECT GEN_ID(GEN_NUM_INV_PROD,0),(SELECT MAX(CODIGO) FROM INVENTARIO_PRODUCTO) FROM RDB$DATABASE"))
        using(var r=q.ExecuteReader())
        {
            r.Read();if(r.GetInt64(0)!=(r.IsDBNull(1)?0:Convert.ToInt64(r.GetValue(1))))throw new InvalidOperationException("Numeracion de productos no coincide");
        }
        tx.Rollback();return new{clean=true,emptyLocalTables=emptyTables,zeroLocalGenerators=generators.Count-1,stock=0,localCost=0,companyUsersConfigured=false};
    }
    public void MarkReady(CatalogPolicy policy,string epoch,Dictionary<string,int> expectedCounts)
    {
        using var c=Open();using var tx=c.BeginTransaction();CheckNode(c,tx,policy,epoch,"branch",false);
        CheckInstallation(c,tx,policy,"branch");
        foreach(var t in policy.Tables)
        {
            if(!expectedCounts.TryGetValue(t.Name,out int expected))throw new InvalidOperationException("Manifiesto inicial incompleto");
            using var q=Command(c,tx,$"SELECT COUNT(*) FROM {t.Name}");
            if(Convert.ToInt32(q.ExecuteScalar())!=expected)throw new InvalidOperationException("Cantidad inicial no coincide: "+t.Name);
        }
        // Product IDs are copied explicitly; never leave their local generator below them.
        using(var q=Command(c,tx,"SELECT MAX(CODIGO) FROM INVENTARIO_PRODUCTO"))
        {
            var max=q.ExecuteScalar();var n=max is null or DBNull?0:Convert.ToInt32(max);
            Exec(c,tx,"SET GENERATOR GEN_NUM_INV_PROD TO "+n.ToString(System.Globalization.CultureInfo.InvariantCulture));
        }
        Exec(c,tx,"UPDATE PSSYNC_META SET READY=1 WHERE ID=1");tx.Commit();
    }

    public List<Envelope> Export(CatalogPolicy policy,string tenant,string epoch,int rowsPerPacket=100)
    {
        using var c=Open(); using var tx=Snapshot(c); var versions=new Dictionary<string,long>();
        CheckNode(c,tx,policy,epoch,"source",true);
        using(var q=Command(c,tx,"SELECT TABLE_NAME,ROW_KEY,REVISION FROM PSSYNC_REV"))
        using(var r=q.ExecuteReader()) while(r.Read()) versions[r.GetString(0)+"|"+r.GetString(1)]=r.GetInt32(2);
        var result=new List<Envelope>();var changes=new List<CatalogChange>();
        foreach(var t in policy.Tables.OrderBy(x=>x.Order))
        {
            using var q=Command(c,tx,$"SELECT {string.Join(',',t.Fields)} FROM {t.Name} ORDER BY {string.Join(',',t.Keys)}");
            using var r=q.ExecuteReader();
            while(r.Read())
            {
                var values=Row(r,t);var keys=t.Keys.Select(k=>values[k].Value?.TrimEnd() ?? throw new InvalidOperationException("Clave nula")).ToArray();
                versions.TryGetValue(t.Name+"|"+RevisionKey(keys),out var v);
                changes.Add(new(t.Name,keys,v,false,values));
                if(changes.Count>=rowsPerPacket){result.Add(new(Guid.NewGuid(),tenant,epoch,policy.Hash,changes.ToArray()));changes.Clear();}
            }
        }
        if(changes.Count>0) result.Add(new(Guid.NewGuid(),tenant,epoch,policy.Hash,changes.ToArray()));
        tx.Rollback();return result;
    }

    public Envelope? NextPending(CatalogPolicy policy,string tenant,string epoch)
    {
        using var c=Open(); string id,table; string[] keys; string? payload;
        using(var tx=Snapshot(c))
        {
            CheckNode(c,tx,policy,epoch,"source",true);
            using var q=Command(c,tx,"SELECT FIRST 1 EVENT_ID,TABLE_NAME,KEY1,KEY2,KEY3,PAYLOAD FROM PSSYNC_OUTBOX WHERE PUBLISHED=0 ORDER BY CREATED_AT,EVENT_ID");
            using var r=q.ExecuteReader();if(!r.Read()) return null;
            id=r.GetString(0);table=r.GetString(1);var t=policy.Table(table);
            keys=Enumerable.Range(0,t.Keys.Length).Select(i=>r.GetString(i+2)).ToArray();
            payload=r.IsDBNull(5)?null:r.GetString(5);
            r.Close();tx.Rollback();
        }
        if(payload is not null) return System.Text.Json.JsonSerializer.Deserialize<Envelope>(payload)!;
        Envelope envelope;
        using(var tx=Snapshot(c))
        {
            var t=policy.Table(table);
            using var revision=Command(c,tx,"SELECT REVISION,DELETED_FLAG FROM PSSYNC_REV WHERE TABLE_NAME=@p0 AND ROW_KEY=@p1",table,RevisionKey(keys));
            using var vr=revision.ExecuteReader();if(!vr.Read()) throw new InvalidOperationException("Falta revision del evento");
            long v=vr.GetInt32(0);bool deleted=vr.GetInt16(1)!=0;vr.Close();
            Dictionary<string,Cell> values=[];
            if(!deleted)
            {
                using var q=Command(c,tx,$"SELECT {string.Join(',',t.Fields)} FROM {table} WHERE {Where(t)}",keys.Cast<object?>().ToArray());
                using var r=q.ExecuteReader();if(!r.Read())throw new InvalidOperationException("Fila fuente no corresponde a su revision");
                values=Row(r,t);if(r.Read())throw new InvalidOperationException("Clave duplicada");
            }
            var primary=new CatalogChange(table,keys,v,deleted,values);
            var bundle=ProductBundle(c,tx,policy,primary);
            envelope=new(Guid.Parse(id),tenant,epoch,policy.Hash,bundle);tx.Rollback();
        }
        // Freeze before HTTP: every retry of this UUID has exactly the same body.
        using(var tx=c.BeginTransaction())
        {
            Exec(c,tx,"UPDATE PSSYNC_OUTBOX SET PAYLOAD=@p0 WHERE EVENT_ID=@p1 AND PAYLOAD IS NULL",envelope.Json,id);
            using var q=Command(c,tx,"SELECT PAYLOAD FROM PSSYNC_OUTBOX WHERE EVENT_ID=@p0",id);
            var frozen=Convert.ToString(q.ExecuteScalar())!;tx.Commit();
            return System.Text.Json.JsonSerializer.Deserialize<Envelope>(frozen)!;
        }
    }

    private static CatalogChange[] ProductBundle(FbConnection c,FbTransaction tx,CatalogPolicy policy,CatalogChange primary)
    {
        var all=new Dictionary<string,CatalogChange>(StringComparer.Ordinal);
        void Add(CatalogChange change)=>all[change.Table+"|"+RevisionKey(change.Key)]=change;
        CatalogChange? Read(string name,string[] keys)
        {
            var table=policy.Table(name);Dictionary<string,Cell> row;
            using(var q=Command(c,tx,$"SELECT {string.Join(',',table.Fields)} FROM {name} WHERE {Where(table)}",keys.Cast<object?>().ToArray()))
            using(var r=q.ExecuteReader()){if(!r.Read())return null;row=Row(r,table);if(r.Read())throw new InvalidOperationException("Clave de dependencia duplicada");}
            using var rev=Command(c,tx,"SELECT REVISION FROM PSSYNC_REV WHERE TABLE_NAME=@p0 AND ROW_KEY=@p1",name,RevisionKey(keys));
            var value=rev.ExecuteScalar();return new(name,keys,value is null?0:Convert.ToInt64(value),false,row);
        }
        void Reference(Dictionary<string,Cell> row,string field,string table)
        {
            if(!row.TryGetValue(field,out var value)||value.Type=="null"||value.Value is null||value.Value=="0"||string.IsNullOrWhiteSpace(value.Value))return;
            var dependency=Read(table,[value.Value.TrimEnd()]);
            if(dependency is null)throw new InvalidOperationException("Dependencia del catalogo ausente: "+table);
            Add(dependency);
        }
        void Related(string table,string filter,string value)
        {
            var t=policy.Table(table);var rows=new List<Dictionary<string,Cell>>();
            using(var q=Command(c,tx,$"SELECT {string.Join(',',t.Fields)} FROM {table} WHERE {SqlName.Check(filter)}=@p0",value))
            using(var r=q.ExecuteReader())while(r.Read())rows.Add(Row(r,t));
            foreach(var row in rows)
            {
                var keys=t.Keys.Select(k=>row[k].Value!.TrimEnd()).ToArray();
                var change=Read(table,keys)!;Add(change);
                if(table=="PRECIO_UNIDADSURTIDORA")Reference(row,"IDUNIDAD","UNIDADES");
                if(table=="CLASIF_PRECIO")Reference(row,"PRECIO_ID","TIPO_PRECIO");
            }
        }
        Add(primary);
        string? productCode=primary.Table switch
        {
            "INVENTARIO_PRODUCTO"=>primary.Key[0],
            "PRECIO_UNIDADSURTIDORA"=>primary.Key[1],
            "CLASIF_PRECIO"=>primary.Key[0],
            _=>null
        };
        if(productCode is not null)
        {
            var product=Read("INVENTARIO_PRODUCTO",[productCode]);
            if(product is not null)
            {
                Add(product);var row=product.Values;
                Reference(row,"TIPO","TIPO_INVENTARIO");Reference(row,"CODCATEGORIA","INVENTARIO_CATEGORIA");
                Reference(row,"CODSUBCATEGORIA","INVENTARIO_SUBCATEGORIA");Reference(row,"TIPO_UNIDAD","UNIDADES");
                Reference(row,"COD_MONEDA","MONEDA");Reference(row,"IDTASAITBIS","TASA_ITBIS");
                Related("PRECIO_UNIDADSURTIDORA","COD_PRODUCTO",productCode);
                Related("CLASIF_PRECIO","COD_PRODUCTO",productCode);
                if(row.TryGetValue("CODIGO_TEXTO",out var text)&&text.Value is not null)
                    Related("PRECIO_INVENTARIO","CODIGO_TEXTO",text.Value);
            }
        }
        if(all.Count>500)throw new InvalidOperationException("El producto supera el limite de filas por paquete");
        return all.Values.OrderBy(x=>policy.Table(x.Table).Order).ThenBy(x=>RevisionKey(x.Key),StringComparer.Ordinal).ToArray();
    }

    public void Published(Guid id)
    {
        using var c=Open();using var tx=c.BeginTransaction();
        Exec(c,tx,"UPDATE PSSYNC_OUTBOX SET PUBLISHED=1 WHERE EVENT_ID=@p0 AND PAYLOAD IS NOT NULL",id.ToString());tx.Commit();
    }

    public bool Apply(CatalogPolicy policy,Envelope envelope,string tenant,string epoch)
    {
        envelope.Validate(policy,tenant,epoch);
        using var c=Open();using var tx=c.BeginTransaction();
        CheckNode(c,tx,policy,epoch,"branch",false);
        using(var context=Command(c,tx,"SELECT RDB$SET_CONTEXT('USER_TRANSACTION','PSSYNC_APPLY','1') FROM RDB$DATABASE"))context.ExecuteScalar();
        using(var check=Command(c,tx,"SELECT PAYLOAD_HASH FROM PSSYNC_INBOX WHERE EVENT_ID=@p0",envelope.EventId.ToString()))
        {
            var hash=check.ExecuteScalar();if(hash is not null)
            {
                if(Convert.ToString(hash)!=envelope.Hash)throw new InvalidOperationException("UUID repetido con contenido diferente");
                tx.Rollback();return false;
            }
        }
        foreach(var change in envelope.Changes.OrderBy(x=>policy.Table(x.Table).Order))
        {
            var t=policy.Table(change.Table);var rk=RevisionKey(change.Key);
            using var qrev=Command(c,tx,"SELECT REVISION FROM PSSYNC_REV WHERE TABLE_NAME=@p0 AND ROW_KEY=@p1",t.Name,rk);
            var current=qrev.ExecuteScalar();if(current is not null && Convert.ToInt64(current)>=change.Revision)continue;
            using var count=Command(c,tx,$"SELECT COUNT(*) FROM {t.Name} WHERE {Where(t)}",change.Key.Cast<object?>().ToArray());
            var n=Convert.ToInt32(count.ExecuteScalar());if(n>1)throw new InvalidOperationException("Clave destino duplicada");
            Dictionary<string,Cell>? localBefore=null;
            var localFields=new[]{"CANTIDAD","BLCE_CANT_ENTRADA","BLCE_CANT_SALIDA","PRECIO_COMPRA"};
            var localPolicy=new TablePolicy(t.Name,t.Keys,localFields,t.Order);
            if(n==1 && t.Name=="INVENTARIO_PRODUCTO")
            {
                using var local=Command(c,tx,$"SELECT {string.Join(',',localFields)} FROM {t.Name} WHERE {Where(t)}",change.Key.Cast<object?>().ToArray());
                using var r=local.ExecuteReader();r.Read();localBefore=Row(r,localPolicy);
            }
            if(change.Deleted)
            {
                if(t.Name=="INVENTARIO_PRODUCTO")
                {
                    if(!t.Fields.Contains("STATUS"))throw new InvalidOperationException("Baja de producto no soportada");
                    Exec(c,tx,$"UPDATE {t.Name} SET STATUS='I' WHERE {Where(t)}",change.Key.Cast<object?>().ToArray());
                }
                else Exec(c,tx,$"DELETE FROM {t.Name} WHERE {Where(t)}",change.Key.Cast<object?>().ToArray());
            }
            else
            {
                var fields=t.Fields.Where(f=>n==0 || !t.Keys.Contains(f)).ToList();
                var values=fields.Select(f=>change.Values[f].ToValue()).ToList();
                if(n==0 && t.Name=="INVENTARIO_PRODUCTO")
                    foreach(var stock in new[]{"CANTIDAD","BLCE_CANT_ENTRADA","BLCE_CANT_SALIDA"}){fields.Add(stock);values.Add(0);}
                var names=fields.Select((f,i)=>$"{f}=@p{i+change.Key.Length}");
                var sql=n==0 ? $"INSERT INTO {t.Name} ({string.Join(',',fields)}) VALUES({string.Join(',',fields.Select((_,i)=>"@p"+(i+change.Key.Length)))})" :
                    $"UPDATE {t.Name} SET {string.Join(',',names)} WHERE {Where(t)}";
                // Always add key parameters first; unused parameters in INSERT are harmless.
                Exec(c,tx,sql,change.Key.Cast<object?>().Concat(values).ToArray());
                using var verify=Command(c,tx,$"SELECT {string.Join(',',t.Fields)} FROM {t.Name} WHERE {Where(t)}",change.Key.Cast<object?>().ToArray());
                using var r=verify.ExecuteReader();if(!r.Read())throw new InvalidOperationException("No se guardo la fila");
                var saved=Row(r,t);
                var differences=t.Fields.Where(f=>saved[f]!=change.Values[f]).ToArray();
                if(differences.Length>0)throw new InvalidOperationException("El destino altero campos del catalogo: "+t.Name+" / "+string.Join(',',differences));
            }
            if(localBefore is not null)
            {
                using var local=Command(c,tx,$"SELECT {string.Join(',',localFields)} FROM {t.Name} WHERE {Where(t)}",change.Key.Cast<object?>().ToArray());
                using var r=local.ExecuteReader();if(!r.Read())throw new InvalidOperationException("Se perdio el producto local");
                var after=Row(r,localPolicy);
                if(localFields.Any(f=>localBefore[f]!=after[f]))throw new InvalidOperationException("Cambio inesperado en existencias/costo local");
            }
            Exec(c,tx,"UPDATE OR INSERT INTO PSSYNC_REV(TABLE_NAME,ROW_KEY,REVISION,DELETED_FLAG) VALUES(@p0,@p1,@p2,@p3) MATCHING(TABLE_NAME,ROW_KEY)",t.Name,rk,change.Revision,change.Deleted?1:0);
        }
        Exec(c,tx,"INSERT INTO PSSYNC_INBOX(EVENT_ID,PAYLOAD_HASH) VALUES(@p0,@p1)",envelope.EventId.ToString(),envelope.Hash);
        tx.Commit();return true;
    }
}
