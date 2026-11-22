program PruebasPedidos;
{$APPTYPE CONSOLE}
uses SysUtils,Classes,DB,IBDatabase,IBQuery,UPedidoRecepcionModelo,UPedidoRecepcionDatos;
var D:TIBDatabase;Tx,Negocio:TIBTransaction;Q:TIBQuery;R:TPedidoRecepcionDatos;
  P,P2:TPedidoRecepcion;Prod:TPedidoProducto;L:TPedidoLinea;Lista:TStringList;
  Unidades:TPedidoUnidades;N,Numero,Antes:Integer;S,Path,Mensaje:string;Fallo:Boolean;
procedure Check(B:Boolean;const Texto:string);
begin if not B then raise Exception.Create(Texto);Inc(N);WriteLn('PASS ',Texto);end;
function ParamDfm(const Texto,Nombre:string):string;
var A,B:Integer;
begin A:=Pos(Nombre+'=',Texto)+Length(Nombre)+1;B:=A;while(B<=Length(Texto))and(Texto[B]<>#39)do Inc(B);Result:=Copy(Texto,A,B-A);end;
procedure Exec(const SQL:string);
begin
  Q.Close;if not Tx.InTransaction then Tx.StartTransaction;Q.SQL.Text:=SQL;Q.ExecSQL;Tx.Commit;
end;
function Scalar(const SQL:string):Double;
begin
  Q.Close;if not Tx.InTransaction then Tx.StartTransaction;Q.SQL.Text:=SQL;Q.Open;Result:=Q.Fields[0].AsFloat;Q.Close;Tx.Rollback;
end;
function Nuevo(Factura:Integer;Modo:TPedidoModoPrecio;Costo:Currency):TPedidoRecepcion;
var C:TPedidoProducto;B:TPedidoLinea;
begin
  Result:=TPedidoRecepcion.Create;
  try
    Result.Empresa:=1;Result.Almacen:=1;Result.Usuario:=1;Result.Proveedor:=1;Result.Factura:=Factura;
    Result.NombreUsuario:='QA';Result.NombreEmpresa:='Empresa QA';Result.NombreProveedor:='Proveedor QA';Result.NombreAlmacen:='Principal QA';
    Result.Fecha:=Date;Result.VencimientoPago:=Date+30;Result.FormaPago:=1;Result.Rnc:='999999999';
    C:=R.CargarProducto(1,1001,Modo);C.Tasa:=18;Result.Productos.Add(C);C.Proponer(Costo);C.PreciosConfirmados:=True;
    B:=TPedidoLinea.Create;B.Producto:=C;B.Unidad:=7;B.Presentacion:='Unidad';B.Factor:=1;
    B.Cantidad:=1;B.Oferta:=0;B.CostoProveedor:=Costo;B.IncluyeItbis:=True;Result.Lineas.Add(B);Result.TotalProveedor:=Result.Total;
  except Result.Free;raise;end;
end;
procedure GuardarDebeFallar(Pedido:TPedidoRecepcion;const Texto:string);
begin
  Fallo:=False;Mensaje:='';try R.Guardar(Pedido);except on E:Exception do begin Fallo:=True;Mensaje:=E.Message;end;end;
  Check(Fallo,Texto);WriteLn('  motivo: ',Mensaje);
end;
begin
 try
  Path:=ExpandFileName(ParamStr(1));
  if (Pos(ExtractFilePath(ExpandFileName(ParamStr(0))),Path)<>1) or
    (Pos('pedidos-qa-',ExtractFileName(Path))<>1) then raise Exception.Create('Solo se permite una base sintetica pedidos-qa- junto a este ejecutable.');
  D:=TIBDatabase.Create(nil);Tx:=TIBTransaction.Create(nil);Negocio:=TIBTransaction.Create(nil);Q:=TIBQuery.Create(nil);Lista:=TStringList.Create;
  try
    if ParamStr(2)<>'' then Lista.LoadFromFile(ParamStr(2))
    else Lista.LoadFromFile('C:\Proyectos\PointSaleSoftResp\PuntoVenta\Fuentes\UDatModConectar.dfm');S:=Lista.Text;
    D.DatabaseName:='localhost:'+Path;D.SQLDialect:=1;D.LoginPrompt:=False;
    D.Params.Values['user_name']:=ParamDfm(S,'user_name');D.Params.Values['password']:=ParamDfm(S,'password');S:='';D.Connected:=True;
    Tx.DefaultDatabase:=D;Tx.Params.Add('read_committed');Tx.Params.Add('rec_version');Q.Database:=D;Q.Transaction:=Tx;
    Negocio.DefaultDatabase:=D;Negocio.Params.Add('read_committed');Negocio.Params.Add('rec_version');
    R:=TPedidoRecepcionDatos.Create(D);
    try
      R.Proveedores(1,Lista);Check(Lista.Count=1,'proveedores limitados a la empresa');
      R.Buscar(1,'FTEST',Lista);Check(Lista.Count=1,'busqueda no cruza empresas');
      R.Buscar(1,'ftest',Lista);Check(Lista.Count=1,'prefijo de codigo en minusculas encuentra codigo normalizado');
      R.Unidades(Unidades);Check((Length(Unidades)=2)and(Unidades[0].Id=7),'unidad base localizada sin suponer ID=1');
      Prod:=R.CargarProducto(1,1001,ppPresentaciones);
      try Check((Length(Prod.Precios)=1)and(Prod.Precios[0].Unidad=7),'sin precios por presentacion prepara Unidad en memoria');
        Check(Scalar('SELECT COUNT(*) FROM PRECIO_UNIDADSURTIDORA')=0,'preparar precios no inserta registros');
      finally Prod.Free;end;
      P:=Nuevo(101,ppNiveles,118);
      try
        Prod:=TPedidoProducto(P.Productos[0]);L:=TPedidoLinea(P.Lineas[0]);
        Check(Prod.Precios[0].Precios[1]=177,'reutiliza porcentaje previo sin sumar ITBIS dos veces');
        Check(Prod.Precios[0].Precios[2]=236,'recalcula precio2 desde porcentaje propio');
        Check(Prod.Precios[0].Precios[3]=153.4,'conserva niveles sin imponer orden ascendente');
        Check(Prod.MinimoBase=Prod.PrecioBase,'con niveles minimo y precio principal iguales a precio1');
        L.Cantidad:=3;L.Oferta:=1;L.Unidad:=12;L.Presentacion:='Caja de 12';L.Factor:=12;L.CostoProveedor:=1200;L.IncluyeItbis:=False;L.Descuento:=5;
        L.Lote:='LOTE-A';L.Vence:=Date+100;
        Check(L.CostoConItbis=1416,'normaliza costo proveedor sin ITBIS');
        Check(L.CostoBase=118,'convierte costo caja a costo base con ITBIS');
        Check(L.CompradasBase=36,'3 cajas de 12 equivalen a 36 compradas');
        Check(L.EntradaBase=48,'oferta suma 12 al inventario');
        Check(L.Total=4035.6,'descuento cuadra factura sin recostear inventario');
        Check(L.Impuesto=615.6,'extrae ITBIS incluido del importe descontado');
        Check(L.CostoBase=118,'descuento y oferta no reducen costo base');
        L:=TPedidoLinea.Create;L.Producto:=Prod;L.Unidad:=7;L.Presentacion:='Unidad';L.Factor:=1;L.Cantidad:=2;
        L.CostoProveedor:=118;L.IncluyeItbis:=True;L.Lote:='LOTE-B';L.Vence:=Date+200;P.Lineas.Add(L);
        P.TotalProveedor:=P.Total;P.Validar;Check(P.Total=4271.6,'dos lotes mantienen totales separados');
        P.TotalProveedor:=P.Total+0.01;GuardarDebeFallar(P,'cuadre exige total exacto del proveedor');P.TotalProveedor:=P.Total;
        Check(Scalar('SELECT COUNT(*) FROM DESPACHO_MASTER')=0,'validar todo el borrador no guarda cabecera');
        Check(Scalar('SELECT CANTIDAD FROM INVENTARIO_PRODUCTO WHERE CODIGO=1001')=10,'captura no modifica inventario');
        Prod.PreciosConfirmados:=False;GuardarDebeFallar(P,'precios sin revisar impiden procesar');Prod.PreciosConfirmados:=True;
        Negocio.StartTransaction;Q.Transaction:=Negocio;Q.SQL.Text:='INSERT INTO COMPANIA(CODIGO) VALUES(3)';Q.ExecSQL;Q.Transaction:=Tx;
        Numero:=R.Guardar(P);Check(Numero>0,'recepcion completa confirmada');
        Check(Negocio.InTransaction,'no confirma transacciones pendientes de otra pantalla');Negocio.Rollback;
        Check(Scalar('SELECT COUNT(*) FROM COMPANIA WHERE CODIGO=3')=0,'no guarda trabajo ajeno');
        Check(Scalar('SELECT COUNT(*) FROM DESPACHO_MASTER')=1,'una cabecera');
        Check(Scalar('SELECT COUNT(*) FROM DESPACHO')=2,'dos detalles por sus lotes');
        Check(Scalar('SELECT CANTIDAD FROM INVENTARIO_PRODUCTO WHERE CODIGO=1001')=60,'inventario recibe compradas y oferta de ambas lineas');
        Check(Scalar('SELECT CANTIDAD FROM INVENTARIO_ALMACEN WHERE CODIGO=1001 AND CIA_KEY=1')=57,'almacen recibe la misma entrada incluyendo oferta');
        Check(Scalar('SELECT CANTIDAD FROM INVENTARIO_ALMACEN WHERE CODIGO=1001 AND CIA_KEY=2')=99,'almacen de otra empresa intacto');
        Check(Scalar('SELECT CANT_IN FROM LOTE WHERE LOTE_NUM=''LOTE-A''')=48,'lote incluye oferta');
        Check(Scalar('SELECT CANT_IN FROM LOTE WHERE LOTE_NUM=''LOTE-B''')=2,'segundo lote independiente');
        Check(Scalar('SELECT COUNT(*) FROM INVENTARIO_PRODUCTO WHERE CODIGO=1001 AND FECHA_VENCIMIENTO='''+FormatDateTime('yyyy-mm-dd',Date+100)+'''')=1,'vencimiento general conserva el lote mas cercano');
        Check(Scalar('SELECT PRECIO_COMPRA FROM INVENTARIO_PRODUCTO WHERE CODIGO=1001')=118,'costo con ITBIS persistido');
        Check(Scalar('SELECT PRECIO FROM INVENTARIO_PRODUCTO WHERE CODIGO=1001')=177,'precio1 confirmado persistido');
        Check(Scalar('SELECT PRECIO_MINIMO FROM INVENTARIO_PRODUCTO WHERE CODIGO=1001')=177,'minimo igual a precio1 persistido');
        Check(Scalar('SELECT SUM(CANT) FROM KARDEX_TRAN_DET')=50,'Kardex incluye toda la entrada');
        Check(Scalar('SELECT PRECIO FROM COSTO_PRODUCTO')=118,'historial del proveedor conserva costo bruto sin descuento');
        Check(R.Guardar(P)=Numero,'doble llamada sobre pedido guardado no duplica');
        Check(Scalar('SELECT COUNT(*) FROM DESPACHO_MASTER')=1,'cabecera no duplicada por doble llamada');
      finally P.Free;end;
      P:=Nuevo(101,ppNiveles,118);try GuardarDebeFallar(P,'otra ventana no vuelve a registrar misma factura/proveedor');finally P.Free;end;
      P:=Nuevo(102,ppNiveles,118);try
        L:=TPedidoLinea(P.Lineas[0]);L.Cantidad:=0.5;GuardarDebeFallar(P,'fracciones de compra siguen aplazadas');
        L.Cantidad:=1;L.Lote:='LOTE-A';L.Vence:=Date+101;GuardarDebeFallar(P,'no sobrescribe vencimiento de lote existente');
      finally P.Free;end;
      P:=Nuevo(103,ppNiveles,118);try
        Exec('UPDATE INVENTARIO_PRODUCTO SET PRECIO=178 WHERE CODIGO=1001');
        GuardarDebeFallar(P,'detecta precio cambiado por otra pantalla');
        Exec('UPDATE INVENTARIO_PRODUCTO SET PRECIO=177 WHERE CODIGO=1001');
      finally P.Free;end;
      Exec('CREATE EXCEPTION QA_FALLO ''Fallo inyectado QA''');
      Exec('CREATE TRIGGER QA_FALLA_ALMACEN FOR INVENTARIO_ALMACEN ACTIVE BEFORE UPDATE POSITION 100 AS BEGIN EXCEPTION QA_FALLO; END');
      P:=Nuevo(104,ppNiveles,118);try GuardarDebeFallar(P,'fallo de almacen revierte recepcion');finally P.Free;end;
      Check(Scalar('SELECT COUNT(*) FROM DESPACHO_MASTER')=1,'rollback quita cabecera parcial');
      Check(Scalar('SELECT COUNT(*) FROM DESPACHO')=2,'rollback quita detalle parcial');
      Check(Scalar('SELECT SUM(CANT) FROM KARDEX_TRAN_DET')=50,'rollback no deja Kardex parcial');
      Check(Scalar('SELECT CANTIDAD FROM INVENTARIO_PRODUCTO WHERE CODIGO=1001')=60,'rollback devuelve stock');
      Exec('DROP TRIGGER QA_FALLA_ALMACEN');
      Exec('CREATE TRIGGER QA_FALLA_CXP FOR TRANS_CXP ACTIVE BEFORE INSERT POSITION 100 AS BEGIN EXCEPTION QA_FALLO; END');
      P:=Nuevo(105,ppNiveles,118);P.FormaPago:=7;
      try GuardarDebeFallar(P,'fallo CXP revierte inventario y documento');finally P.Free;end;
      Check(Scalar('SELECT COUNT(*) FROM DESPACHO_MASTER')=1,'fallo CXP sin cabecera parcial');
      Check(Scalar('SELECT CANTIDAD FROM INVENTARIO_ALMACEN WHERE CODIGO=1001 AND CIA_KEY=1')=57,'fallo CXP devuelve almacen');
      Exec('DROP TRIGGER QA_FALLA_CXP');
      P:=Nuevo(106,ppNiveles,118);P.FormaPago:=7;
      try R.Guardar(P);Check(Scalar('SELECT COUNT(*) FROM TRANS_CXP')=1,'compra credito crea transaccion CXP');
        Check(Scalar('SELECT MONTO_PENDIENTE FROM FACTURAS_CXP_PENDIENTES')=118,'credito conserva pendiente');
        Check(Scalar('SELECT BALANCE_ACT FROM BALANCE_CXP')=118,'credito actualiza saldo proveedor');
      finally P.Free;end;
      P:=Nuevo(107,ppPresentaciones,130);
      try
        Prod:=TPedidoProducto(P.Productos[0]);Check(Length(Prod.Precios)=1,'producto sin tabla inicia solo Unidad');
        SetLength(Prod.Precios,2);Prod.Precios[1].Unidad:=12;Prod.Precios[1].Descripcion:='Caja de 12';Prod.Precios[1].Factor:=12;
        Prod.Precios[1].Precios[1]:=2028;Prod.Precios[1].Porcientos[1]:=30;Prod.PreciosConfirmados:=True;
        R.Guardar(P);Check(Scalar('SELECT COUNT(*) FROM PRECIO_UNIDADSURTIDORA')=2,'crea Unidad y caja solo al procesar');
        Check(Scalar('SELECT PRECIOVENTA1 FROM PRECIO_UNIDADSURTIDORA WHERE IDUNIDAD=12')=2028,'precio caja acorde al costo por presentacion');
      finally P.Free;end;
      Prod:=R.CargarProducto(1,1001,ppPresentaciones);
      try Check(Length(Prod.Precios)=2,'recupera presentaciones previas');Prod.Proponer(140);
        Check(Prod.Precios[1].Precios[1]=2184,'reutiliza utilidad por presentacion sin doble ITBIS');
      finally Prod.Free;end;
      Fallo:=False;try Prod:=R.CargarProducto(1,2001,ppSimple);Prod.Free;except Fallo:=True;end;
      Check(Fallo,'no captura producto de otra empresa');
      P:=Nuevo(108,ppSimple,130);
      try
        Prod:=TPedidoProducto(P.Productos[0]);Prod.Precios[0].Precios[1]:=180;Prod.Precios[0].Precios[2]:=170;Prod.PreciosConfirmados:=True;
        P.Validar;R.Guardar(P);Check(Scalar('SELECT PRECIO_MINIMO FROM INVENTARIO_PRODUCTO WHERE CODIGO=1001')=170,'precio sencillo conserva minimo independiente');
      finally P.Free;end;
      P:=Nuevo(109,ppPresentaciones,140);P.Usuario:=2;P.NombreUsuario:='QA-OTRO';
      try
        R.Guardar(P);Check(Scalar('SELECT PRECIOVENTA1 FROM PRECIO_UNIDADSURTIDORA WHERE IDUNIDAD=7')=210,'actualiza filas existentes con sus porcentajes');
        Check(Scalar('SELECT COD_USUARIO_IN FROM PRECIO_UNIDADSURTIDORA WHERE IDUNIDAD=7')=1,'conserva auditoria de creacion de precio');
        Check(Scalar('SELECT AUD_COD_USUARIO FROM PRECIO_UNIDADSURTIDORA WHERE IDUNIDAD=7')=2,'audita usuario actual cuando existe campo de auditoria');
      finally P.Free;end;
      P:=Nuevo(110,ppPresentaciones,140);
      try
        Exec('UPDATE PRECIO_UNIDADSURTIDORA SET PRECIOVENTA2=250 WHERE IDUNIDAD=7');
        GuardarDebeFallar(P,'detecta edicion concurrente de precios por presentacion');
      finally P.Free;end;
      WriteLn('PEDIDOS_NUEVOS=PASS; CHECKS=',N,'; EMISION=0; BASE_COMERCIAL=0; ERP_COMPLETO=0');
    finally R.Free;end;
  finally if Tx.InTransaction then Tx.Rollback;if Negocio.InTransaction then Negocio.Rollback;Lista.Free;Q.Free;Negocio.Free;Tx.Free;D.Free;end;
 except on E:Exception do begin WriteLn('FAIL ',E.ClassName,': ',E.Message);Halt(1);end;end;
end.
