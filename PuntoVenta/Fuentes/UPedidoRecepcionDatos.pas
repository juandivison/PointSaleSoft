unit UPedidoRecepcionDatos;
interface
uses SysUtils,Classes,DB,IBDatabase,IBQuery,UPedidoRecepcionModelo;
type
  TPedidoUnidad=record Id:Integer;Descripcion:string;Factor:Double;end;
  TPedidoUnidades=array of TPedidoUnidad;
  TPedidoRecepcionDatos=class
  private
    FDB:TIBDatabase;FLectura:TIBTransaction;
    function Consulta(const SQL:string):TIBQuery;
    function SelloInv(Q:TDataSet):string;
    function SelloPresentaciones(Codigo:Integer;Tx:TIBTransaction;Bloquear:Boolean=False):string;
    function EjecutarProc(Tx:TIBTransaction;const Nombre:string;
      const Nombres:array of string;const Valores:array of Variant;
      const Salida:string=''):Variant;
    procedure GuardarPrecios(P:TPedidoProducto;Tx:TIBTransaction;Usuario:Integer;const Nombre:string);
  public
    constructor Create(DB:TIBDatabase);
    destructor Destroy;override;
    procedure Proveedores(Empresa:Integer;Lista:TStrings);
    procedure Unidades(out Lista:TPedidoUnidades);
    procedure Buscar(Empresa:Integer;const Texto:string;Lista:TStrings);
    function CargarProducto(Empresa,Codigo:Integer;Modo:TPedidoModoPrecio):TPedidoProducto;
    procedure DatosProveedor(Empresa,Codigo:Integer;out Rnc:string;out Dias:Integer);
    procedure DatosEmpresa(Empresa:Integer;out Nombre:string);
    function Guardar(P:TPedidoRecepcion):Integer;
    function ComprobarGuardado(P:TPedidoRecepcion):Boolean;
  end;
implementation
uses Variants,IBStoredProc,Math,Windows;
constructor TPedidoRecepcionDatos.Create(DB:TIBDatabase);
begin
  inherited Create;
  if (DB=nil) or not DB.Connected then raise Exception.Create('Abra la base de datos antes de registrar pedidos.');
  FDB:=DB;FLectura:=TIBTransaction.Create(nil);FLectura.DefaultDatabase:=DB;
  FLectura.Params.Add('read');FLectura.Params.Add('read_committed');FLectura.Params.Add('rec_version');FLectura.Params.Add('nowait');
end;
destructor TPedidoRecepcionDatos.Destroy;
begin if FLectura.InTransaction then FLectura.Rollback;FLectura.Free;inherited;end;
function TPedidoRecepcionDatos.Consulta(const SQL:string):TIBQuery;
begin
  Result:=TIBQuery.Create(nil);Result.Database:=FDB;Result.Transaction:=FLectura;
  Result.SQL.Text:=SQL;
end;
procedure TPedidoRecepcionDatos.DatosEmpresa(Empresa:Integer;out Nombre:string);
var Q:TIBQuery;
begin
  Q:=Consulta('SELECT * FROM COMPANIA WHERE CODIGO=:E');
  try Q.ParamByName('E').AsInteger:=Empresa;Q.Open;
    if Q.Eof then raise Exception.Create('La empresa no existe.');
    Nombre:='Empresa '+IntToStr(Empresa);
    if (Q.FindField('NOMBRE')<>nil) and (Trim(Q.FieldByName('NOMBRE').AsString)<>'') then Nombre:=Q.FieldByName('NOMBRE').AsString
    else if Q.FindField('DESCRIPCION')<>nil then Nombre:=Q.FieldByName('DESCRIPCION').AsString;
  finally Q.Free;if FLectura.InTransaction then FLectura.Rollback;end;
end;
procedure TPedidoRecepcionDatos.Proveedores(Empresa:Integer;Lista:TStrings);
var Q:TIBQuery;
begin
  Lista.Clear;Q:=Consulta('SELECT CODIGO_CTE,DESCRIPCION FROM PROVEEDORES WHERE CIA_KEY=:E ORDER BY DESCRIPCION');
  try Q.ParamByName('E').AsInteger:=Empresa;Q.Open;
    while not Q.Eof do begin Lista.AddObject(Q.Fields[1].AsString,TObject(Q.Fields[0].AsInteger));Q.Next;end;
  finally Q.Free;if FLectura.InTransaction then FLectura.Rollback;end;
end;
procedure TPedidoRecepcionDatos.DatosProveedor(Empresa,Codigo:Integer;out Rnc:string;out Dias:Integer);
var Q:TIBQuery;
begin
  Rnc:='';Dias:=30;Q:=Consulta('SELECT RNC_PROVEEDOR,CANT_DIAS_CREDITO FROM PROVEEDORES WHERE CODIGO_CTE=:P AND CIA_KEY=:E');
  try Q.ParamByName('E').AsInteger:=Empresa;Q.ParamByName('P').AsInteger:=Codigo;Q.Open;
    if Q.Eof then raise Exception.Create('El proveedor no pertenece a esta empresa.');
    Rnc:=Trim(Q.Fields[0].AsString);if Q.Fields[1].AsInteger>0 then Dias:=Q.Fields[1].AsInteger;
  finally Q.Free;if FLectura.InTransaction then FLectura.Rollback;end;
end;
procedure TPedidoRecepcionDatos.Unidades(out Lista:TPedidoUnidades);
var Q:TIBQuery;N:Integer;
begin
  SetLength(Lista,0);Q:=Consulta('SELECT IDUNIDAD,DESCRIPCION,CANTIDAD FROM UNIDADES WHERE CANTIDAD>0 ORDER BY CANTIDAD,IDUNIDAD');
  try Q.Open;
    while not Q.Eof do begin
      N:=Length(Lista);SetLength(Lista,N+1);Lista[N].Id:=Q.Fields[0].AsInteger;
      Lista[N].Descripcion:=Q.Fields[1].AsString;Lista[N].Factor:=Q.Fields[2].AsFloat;Q.Next;
    end;
  finally Q.Free;if FLectura.InTransaction then FLectura.Rollback;end;
end;
procedure TPedidoRecepcionDatos.Buscar(Empresa:Integer;const Texto:string;Lista:TStrings);
var Q:TIBQuery;S:string;
begin
  Lista.Clear;S:=Trim(Texto);if S='' then Exit;
  Q:=Consulta('SELECT FIRST 80 CODIGO,CODIGO_TEXTO,DESCRIPCION,CANTIDAD,PRECIO FROM INVENTARIO_PRODUCTO '+
    'WHERE CIA_KEY=:E AND (CODIGO=:C OR CODIGO_TEXTO STARTING WITH :S OR CODIGO_BARRA=:B '+
    'OR DESCRIPCION CONTAINING :D OR REFERENCIA STARTING WITH :R) ORDER BY DESCRIPCION');
  try
    Q.ParamByName('E').AsInteger:=Empresa;Q.ParamByName('C').AsInteger:=StrToIntDef(S,-1);
    Q.ParamByName('S').AsString:=AnsiUpperCase(S);Q.ParamByName('B').AsString:=S;Q.ParamByName('D').AsString:=S;Q.ParamByName('R').AsString:=S;Q.Open;
    while not Q.Eof do begin
      Lista.Add(IntToStr(Q.Fields[0].AsInteger)+#9+StringReplace(Q.Fields[1].AsString,#9,' ',[rfReplaceAll])+#9+
        StringReplace(Q.Fields[2].AsString,#9,' ',[rfReplaceAll])+#9+Q.Fields[3].AsString+#9+Q.Fields[4].AsString);Q.Next;
    end;
  finally Q.Free;if FLectura.InTransaction then FLectura.Rollback;end;
end;
function TPedidoRecepcionDatos.SelloInv(Q:TDataSet):string;
const Campos:array[0..12] of string=('PRECIO_COMPRA','PRECIO','PRECIO_MINIMO','PRECIOVENTA1','PRECIOVENTA2','PRECIOVENTA3','PRECIOVENTA4','PORCUTILIDAD1','PORCUTILIDAD2','PORCUTILIDAD3','PORCUTILIDAD4','INVENTARIAR','PAGA_ITBI');
var I:Integer;
begin Result:='';for I:=0 to High(Campos) do Result:=Result+'|'+Q.FieldByName(Campos[I]).AsString;end;
function TPedidoRecepcionDatos.SelloPresentaciones(Codigo:Integer;Tx:TIBTransaction;Bloquear:Boolean):string;
var Q:TIBQuery;I:Integer;
begin
  Result:='';Q:=TIBQuery.Create(nil);
  try
    Q.Database:=FDB;Q.Transaction:=Tx;Q.SQL.Text:='SELECT IDUNIDAD,CANTIDAD,PRECIOVENTA1,PRECIOVENTA2,PRECIOVENTA3,PRECIOVENTA4,PORCUTILIDAD1,PORCUTILIDAD2,PORCUTILIDAD3,PORCUTILIDAD4 FROM PRECIO_UNIDADSURTIDORA WHERE COD_PRODUCTO=:P ORDER BY IDUNIDAD';
    if Bloquear then Q.SQL.Add('WITH LOCK');
    Q.ParamByName('P').AsInteger:=Codigo;Q.Open;
    while not Q.Eof do begin for I:=0 to Q.FieldCount-1 do Result:=Result+'|'+Q.Fields[I].AsString;Result:=Result+';';Q.Next;end;
  finally Q.Free;end;
end;
function TPedidoRecepcionDatos.CargarProducto(Empresa,Codigo:Integer;Modo:TPedidoModoPrecio):TPedidoProducto;
var Q:TIBQuery;P:TPedidoProducto;U:TPedidoUnidades;I,J,N,B:Integer;
begin
  Result:=nil;Unidades(U);B:=-1;
  for I:=0 to High(U) do if (B<0) and (Abs(U[I].Factor-1)<0.000001) then B:=I;
  if B<0 then raise Exception.Create('Configure una presentacion Unidad con equivalencia 1.');
  Q:=Consulta('SELECT * FROM INVENTARIO_PRODUCTO WHERE CODIGO=:C AND CIA_KEY=:E');P:=TPedidoProducto.Create;
  try
    Q.ParamByName('C').AsInteger:=Codigo;Q.ParamByName('E').AsInteger:=Empresa;Q.Open;
    if Q.Eof then raise Exception.Create('El producto no pertenece a esta empresa.');
    P.Codigo:=Codigo;P.CodigoTexto:=Q.FieldByName('CODIGO_TEXTO').AsString;P.Descripcion:=Q.FieldByName('DESCRIPCION').AsString;
    P.CostoAnterior:=Q.FieldByName('PRECIO_COMPRA').AsCurrency;P.PrecioAnterior:=Q.FieldByName('PRECIO').AsCurrency;
    P.MinimoAnterior:=Q.FieldByName('PRECIO_MINIMO').AsCurrency;P.StockAnterior:=Q.FieldByName('CANTIDAD').AsFloat;
    P.Inventariar:=Q.FieldByName('INVENTARIAR').AsInteger=1;P.Modo:=Modo;P.Tasa:=0;
    // El llamador resuelve la tasa por producto/fecha mediante el helper del ERP.
    if Q.FieldByName('PAGA_ITBI').AsInteger=1 then P.Tasa:=-1;
    P.SelloInventario:=SelloInv(Q);P.CostoNuevo:=0;
    SetLength(P.Precios,1);P.Precios[0].Unidad:=U[B].Id;P.Precios[0].Descripcion:=U[B].Descripcion;P.Precios[0].Factor:=1;
    if Modo=ppNiveles then for J:=1 to 4 do begin
      P.Precios[0].Precios[J]:=Q.FieldByName('PRECIOVENTA'+IntToStr(J)).AsCurrency;
      P.Precios[0].Porcientos[J]:=Q.FieldByName('PORCUTILIDAD'+IntToStr(J)).AsFloat;
    end else begin P.Precios[0].Precios[1]:=P.PrecioAnterior;P.Precios[0].Precios[2]:=P.MinimoAnterior;end;
    Q.Close;P.SelloPresentaciones:=SelloPresentaciones(Codigo,FLectura);
    if Modo=ppPresentaciones then begin
      Q.SQL.Text:='SELECT R.*,U.IDUNIDAD UNIDAD_CATALOGO,U.DESCRIPCION DESC_UNIDAD FROM PRECIO_UNIDADSURTIDORA R LEFT JOIN UNIDADES U ON U.IDUNIDAD=R.IDUNIDAD WHERE R.COD_PRODUCTO=:C ORDER BY R.CANTIDAD,R.IDUNIDAD';
      Q.ParamByName('C').AsInteger:=Codigo;Q.Open;
      if not Q.Eof then begin
        SetLength(P.Precios,0);
        while not Q.Eof do begin
          if Q.FieldByName('UNIDAD_CATALOGO').IsNull then raise Exception.Create('Una presentacion no existe en el catalogo de unidades. Corrijala antes de recibir.');
          N:=Length(P.Precios);SetLength(P.Precios,N+1);P.Precios[N].Unidad:=Q.FieldByName('IDUNIDAD').AsInteger;
          P.Precios[N].Descripcion:=Q.FieldByName('DESC_UNIDAD').AsString;P.Precios[N].Factor:=Q.FieldByName('CANTIDAD').AsFloat;P.Precios[N].Persistida:=True;
          for J:=1 to 4 do begin P.Precios[N].Precios[J]:=Q.FieldByName('PRECIOVENTA'+IntToStr(J)).AsCurrency;
            P.Precios[N].Porcientos[J]:=Q.FieldByName('PORCUTILIDAD'+IntToStr(J)).AsFloat;end;
          Q.Next;
        end;
      end else begin
        for J:=2 to 4 do P.Precios[0].Precios[J]:=0;
      end;
      // Si existen cajas pero falta la unidad, se prepara en memoria, nunca en la BD.
      N:=0;for I:=0 to High(P.Precios) do if Abs(P.Precios[I].Factor-1)<0.000001 then Inc(N);
      if N=0 then begin N:=Length(P.Precios);SetLength(P.Precios,N+1);P.Precios[N].Unidad:=U[B].Id;
        P.Precios[N].Descripcion:=U[B].Descripcion;P.Precios[N].Factor:=1;P.Precios[N].Precios[1]:=P.PrecioAnterior;end;
    end;
    for I:=0 to High(P.Precios) do P.Precios[I].Anteriores:=P.Precios[I].Precios;
    Result:=P;P:=nil;
  finally P.Free;Q.Free;if FLectura.InTransaction then FLectura.Rollback;end;
end;
function TPedidoRecepcionDatos.EjecutarProc(Tx:TIBTransaction;const Nombre:string;
  const Nombres:array of string;const Valores:array of Variant;const Salida:string):Variant;
var P:TIBStoredProc;I:Integer;
begin
  if Length(Nombres)<>Length(Valores) then raise Exception.Create('Contrato de procedimiento incompleto.');
  Result:=Null;P:=TIBStoredProc.Create(nil);
  try
    P.Database:=FDB;P.Transaction:=Tx;P.StoredProcName:=Nombre;P.Prepare;
    for I:=0 to P.Params.Count-1 do if P.Params[I].ParamType=ptInput then P.Params[I].Clear;
    for I:=0 to High(Nombres) do P.ParamByName(Nombres[I]).Value:=Valores[I];
    P.ExecProc;if Salida<>'' then Result:=P.ParamByName(Salida).Value;
  finally P.Free;end;
end;
procedure TPedidoRecepcionDatos.GuardarPrecios(P:TPedidoProducto;Tx:TIBTransaction;Usuario:Integer;const Nombre:string);
var Q:TIBQuery;I,J:Integer;S,AudCols,AudValues,AudSet:string;
  AudUsuario,AudNombre,AudPC:Boolean;PC:array[0..255]of Char;Tam:DWORD;
begin
  if P.Modo<>ppPresentaciones then Exit;
  Q:=TIBQuery.Create(nil);Q.Database:=FDB;Q.Transaction:=Tx;
  try
    Q.SQL.Text:='SELECT * FROM PRECIO_UNIDADSURTIDORA WHERE 1=0';Q.Open;
    AudUsuario:=Q.FindField('AUD_COD_USUARIO')<>nil;AudNombre:=Q.FindField('AUD_APP_USER')<>nil;AudPC:=Q.FindField('AUD_PC_NAME')<>nil;Q.Close;
    AudCols:='';AudValues:='';AudSet:='';
    if AudUsuario then begin AudCols:=AudCols+',AUD_COD_USUARIO';AudValues:=AudValues+',:US';AudSet:=AudSet+',AUD_COD_USUARIO=:US';end;
    if AudNombre then begin AudCols:=AudCols+',AUD_APP_USER';AudValues:=AudValues+',:AN';AudSet:=AudSet+',AUD_APP_USER=:AN';end;
    if AudPC then begin AudCols:=AudCols+',AUD_PC_NAME';AudValues:=AudValues+',:PC';AudSet:=AudSet+',AUD_PC_NAME=:PC';end;
    Tam:=SizeOf(PC);PC[0]:=#0;GetComputerName(PC,Tam);
    for I:=0 to High(P.Precios) do begin
      if P.Precios[I].Persistida then begin
        S:='UPDATE PRECIO_UNIDADSURTIDORA SET DESCRIPCION=:D,CANTIDAD=:F';
        for J:=1 to 4 do S:=S+',PRECIOVENTA'+IntToStr(J)+'=:V'+IntToStr(J)+',PORCUTILIDAD'+IntToStr(J)+'=:M'+IntToStr(J);
        S:=S+',COD_USUARIO_UPD=:US,FECHA_MOD=CURRENT_TIMESTAMP,MOD_POR=:N'+AudSet+' WHERE COD_PRODUCTO=:P AND IDUNIDAD=:U';
      end else begin
        S:='INSERT INTO PRECIO_UNIDADSURTIDORA (COD_PRODUCTO,IDUNIDAD,DESCRIPCION,CANTIDAD';
        for J:=1 to 4 do S:=S+',PRECIOVENTA'+IntToStr(J)+',PORCUTILIDAD'+IntToStr(J);
        S:=S+',COD_USUARIO_IN,FECHA_IN,IN_POR,COD_USUARIO_UPD,FECHA_MOD,MOD_POR'+AudCols+') VALUES (:P,:U,:D,:F';
        for J:=1 to 4 do S:=S+',:V'+IntToStr(J)+',:M'+IntToStr(J);
        S:=S+',:US,CURRENT_TIMESTAMP,:N,:US,CURRENT_TIMESTAMP,:N'+AudValues+')';
      end;
      Q.SQL.Text:=S;Q.ParamByName('P').AsInteger:=P.Codigo;Q.ParamByName('U').AsInteger:=P.Precios[I].Unidad;
      Q.ParamByName('D').AsString:=P.Precios[I].Descripcion;Q.ParamByName('F').AsFloat:=P.Precios[I].Factor;
      for J:=1 to 4 do begin
        Q.ParamByName('V'+IntToStr(J)).AsCurrency:=P.Precios[I].Precios[J];
        // Se guarda el porcentaje confirmado explicitamente; el trigger no debe inferirlo con una base distinta.
        Q.ParamByName('M'+IntToStr(J)).AsFloat:=P.Precios[I].Porcientos[J];
      end;
      Q.ParamByName('US').AsInteger:=Usuario;Q.ParamByName('N').AsString:=Copy(Nombre,1,12);
      if AudNombre then Q.ParamByName('AN').AsString:=Copy(Nombre,1,50);
      if AudPC then Q.ParamByName('PC').AsString:=string(PC);
      Q.ExecSQL;
      // Los campos de auditoria adicionales solo se incluyen si existen en este cliente.
      Q.SQL.Text:='SELECT * FROM PRECIO_UNIDADSURTIDORA WHERE COD_PRODUCTO=:P AND IDUNIDAD=:U';
      Q.ParamByName('P').AsInteger:=P.Codigo;Q.ParamByName('U').AsInteger:=P.Precios[I].Unidad;Q.Open;
      for J:=1 to 4 do if Abs(Q.FieldByName('PRECIOVENTA'+IntToStr(J)).AsCurrency-P.Precios[I].Precios[J])>0.005 then
        raise Exception.Create('La base no conservo el precio por presentacion confirmado.');
      Q.Close;
    end;
  finally Q.Free;end;
end;
function TPedidoRecepcionDatos.Guardar(P:TPedidoRecepcion):Integer;
var Tx:TIBTransaction;Q:TIBQuery;I,J,K,Num,Det,Cxp:Integer;L:TPedidoLinea;Prod:TPedidoProducto;
  Entrada,PrevStock,PrevAlmacen:Double;S:string;BrutoNeto:Currency;SeIntentoCommit:Boolean;
  procedure SQL(const Texto:string);
  begin Q.Close;Q.SQL.Text:=Texto;end;
  procedure LockProducto(Codigo:Integer);
  begin
    SQL('SELECT * FROM INVENTARIO_PRODUCTO WHERE CODIGO=:P AND CIA_KEY=:E WITH LOCK');
    Q.ParamByName('P').AsInteger:=Codigo;Q.ParamByName('E').AsInteger:=P.Empresa;Q.Open;
    if Q.Eof then raise Exception.Create('El producto ya no pertenece a esta empresa.');
  end;
begin
  if P.NumeroGuardado>0 then begin Result:=P.NumeroGuardado;Exit;end;
  P.Validar;Num:=0;SeIntentoCommit:=False;
  Tx:=TIBTransaction.Create(nil);Q:=TIBQuery.Create(nil);
  try
    Tx.DefaultDatabase:=FDB;Tx.Params.Add('write');Tx.Params.Add('read_committed');Tx.Params.Add('rec_version');Tx.Params.Add('nowait');
    Q.Database:=FDB;Q.Transaction:=Tx;Tx.StartTransaction;
    // Serializar recepciones por empresa protege tambien la comprobacion de duplicados.
    SQL('SELECT CODIGO FROM COMPANIA WHERE CODIGO=:E WITH LOCK');Q.ParamByName('E').AsInteger:=P.Empresa;Q.Open;
    if Q.Eof then raise Exception.Create('Empresa inexistente.');Q.Close;
    SQL('SELECT CODIGO_CTE FROM PROVEEDORES WHERE CODIGO_CTE=:P AND CIA_KEY=:E');
    Q.ParamByName('P').AsInteger:=P.Proveedor;Q.ParamByName('E').AsInteger:=P.Empresa;Q.Open;
    if Q.Eof then raise Exception.Create('Proveedor ajeno a la empresa.');Q.Close;
    SQL('SELECT FIRST 1 M.NUMERO FROM DESPACHO_MASTER M WHERE M.CODIGO_PROV=:P AND M.NUMERO_FACTURA=:F AND M.STATUS<>''C'' '+
      'AND EXISTS(SELECT 1 FROM DESPACHO D JOIN INVENTARIO_PRODUCTO I ON I.CODIGO=D.CODIGO_PROD WHERE D.NUMERO=M.NUMERO AND I.CIA_KEY=:E)');
    Q.ParamByName('P').AsInteger:=P.Proveedor;Q.ParamByName('F').AsInteger:=P.Factura;Q.ParamByName('E').AsInteger:=P.Empresa;Q.Open;
    if not Q.Eof then raise Exception.Create('La factura de este proveedor ya fue registrada. Consulte la recepcion '+Q.Fields[0].AsString+'.');Q.Close;
    // Todo el documento y sus precios se comprueban antes de ejecutar un INSERT.
    for I:=0 to P.Lineas.Count-1 do begin
      L:=TPedidoLinea(P.Lineas[I]);Prod:=L.Producto;LockProducto(Prod.Codigo);
      if SelloInv(Q)<>Prod.SelloInventario then raise Exception.Create('Los precios/costos de '+Prod.Descripcion+' cambiaron desde la captura. Recargue el producto.');Q.Close;
      if (Prod.Modo=ppPresentaciones) and (SelloPresentaciones(Prod.Codigo,Tx,True)<>Prod.SelloPresentaciones) then
        raise Exception.Create('Los precios por presentacion cambiaron. Recargue '+Prod.Descripcion+'.');
      if Trim(L.Lote)<>'' then begin
        SQL('SELECT CODIGO_PROV,FECHA_VENCIMIENTO FROM LOTE WHERE CODIGO=:P AND LOTE_NUM=:L WITH LOCK');
        Q.ParamByName('P').AsInteger:=Prod.Codigo;Q.ParamByName('L').AsString:=Trim(L.Lote);Q.Open;
        if not Q.Eof then begin
          if (Q.Fields[0].AsInteger<>P.Proveedor) or (Trunc(Q.Fields[1].AsDateTime)<>Trunc(L.Vence)) then
            raise Exception.Create('El lote '+L.Lote+' ya tiene otro proveedor o vencimiento; no se mezclara.');
          Q.Next;if not Q.Eof then raise Exception.Create('El lote tiene registros duplicados; conciliar antes de procesar.');
        end;Q.Close;
      end;
    end;
    Num:=EjecutarProc(Tx,'PROC_INS_DESPACHO_MASTER',
      ['FECHA','TIPO_TRN','CODIGO_DESPACHADOR','CODIGO_EMP','MONTO_TOTAL','STATUS','FECHA_IN','IN_POR','FECHA_MOD','MOD_POR','CODIGO_RUTA','NUM_CONDUCE','CODIGO_PROV','NCF','RNC_PROVEEDOR','INVENTARIO_ID','SERIE_INV_ID','INV_ID_ORIGEN','INV_ID_DESTINO','FORMA_PAGO'],
      [VarFromDateTime(P.Fecha),1,P.Usuario,P.Usuario,P.Total,'A',VarFromDateTime(Now),Copy(P.NombreUsuario,1,12),Null,Null,0,P.Factura,P.Proveedor,P.NCF,P.Rnc,P.Almacen,Null,Null,P.Almacen,P.FormaPago],'NUMERO');
    if Num<=0 then raise Exception.Create('El procedimiento no devolvio el numero de recepcion.');
    for I:=0 to P.Lineas.Count-1 do begin
      L:=TPedidoLinea(P.Lineas[I]);Prod:=L.Producto;
      // DESPACHO conserva su descomposicion documental neto/ITBIS; INVENTARIO guarda costo bruto.
      BrutoNeto:=PedidoDinero(L.Bruto/(1+Prod.Tasa/100));
      Det:=EjecutarProc(Tx,'PROC_INS_DESPACHO_DET',
        ['NUMERO','TIPO_TRN','CODIGO_PROD','CANTIDAD','PRECIO','PORC_DESC_DET','ITBI_DET','VALOR_BRUTO','VALOR_TOTAL_DET','NUM_ORDEN','STATUS_DET','FECHA_IN','IN_POR','FECHA_MOD','MOD_POR','DESCRIPCION','RECARGA','CANT_UNIDADES','UNIDADID','CANTOFERTA','LOTE_NUM'],
        [Num,1,Prod.Codigo,L.CompradasBase,L.CostoConItbis/(1+Prod.Tasa/100)/L.Factor,L.Descuento,L.Impuesto,BrutoNeto,L.Total,Null,'A',VarFromDateTime(Now),Copy(P.NombreUsuario,1,12),Null,Null,Prod.Descripcion,Null,L.Cantidad,L.Unidad,L.Oferta*L.Factor,Trim(L.Lote)],'SERIE_TRNS');
      if Prod.Inventariar then begin
        if Trim(L.Lote)<>'' then EjecutarProc(Tx,'PROC_INS_LOTE',
          ['CODIGO','LOTE_NUM','CODIGO_PROV','FECHA','CANT_IN','CANT_OUT','FECHA_VENCIMIENTO','SERIE_TRN_REGPED'],
          [Prod.Codigo,Trim(L.Lote),P.Proveedor,VarFromDateTime(P.Fecha),Round(L.EntradaBase),0,VarFromDateTime(L.Vence),Det]);
        EjecutarProc(Tx,'PROC_INSERKARDEXDET',
          ['CIA_KEY','TIPO','TIPO_OPE','FECHA_TRN','CODIGO_PRODUCTO','CANT','COSTO_PRODUCTO','PRECIO_VENTA','CODIGO_USUARIO','NUMERO_TRN_VTA','STATUS','FECHA_IN','IN_POR','FECHA_MOD','MOD_POR','AREAMOVIMIENTO'],
          [P.Empresa,1,7,VarFromDateTime(P.Fecha),Prod.Codigo,L.EntradaBase,L.CostoBase,Prod.PrecioBase,P.Usuario,Num,'A',VarFromDateTime(Now),Copy(P.NombreUsuario,1,12),Null,Null,'Registro Pedido Nuevo']);
      end;
    end;
    for I:=0 to P.Productos.Count-1 do begin
      Prod:=TPedidoProducto(P.Productos[I]);Entrada:=0;K:=0;
      for J:=0 to P.Lineas.Count-1 do begin L:=TPedidoLinea(P.Lineas[J]);if L.Producto=Prod then begin Inc(K);if Prod.Inventariar then Entrada:=Entrada+L.EntradaBase;end;end;
      if K=0 then Continue;
      LockProducto(Prod.Codigo);PrevStock:=Q.FieldByName('CANTIDAD').AsFloat;Q.Close;
      S:='UPDATE INVENTARIO_PRODUCTO SET CANTIDAD=COALESCE(CANTIDAD,0)+:C,BLCE_CANT_ENTRADA=COALESCE(BLCE_CANT_ENTRADA,0)+:C,'+
        'FECHA_ULTIMA_TRN=:F,PRECIO_ANT=PRECIO,PRECIO_COMPRA=:CO,PRECIO=:V,PRECIO_MINIMO=:M';
      if Prod.Modo=ppNiveles then for J:=1 to 4 do S:=S+',PRECIOVENTA'+IntToStr(J)+'=:V'+IntToStr(J)+',PORCUTILIDAD'+IntToStr(J)+'=:M'+IntToStr(J);
      S:=S+' WHERE CODIGO=:P AND CIA_KEY=:E';SQL(S);
      Q.ParamByName('C').AsFloat:=Entrada;Q.ParamByName('F').AsDateTime:=P.Fecha;Q.ParamByName('CO').AsCurrency:=Prod.CostoNuevo;
      Q.ParamByName('V').AsCurrency:=Prod.PrecioBase;Q.ParamByName('M').AsCurrency:=Prod.MinimoBase;
      Q.ParamByName('P').AsInteger:=Prod.Codigo;Q.ParamByName('E').AsInteger:=P.Empresa;
      if Prod.Modo=ppNiveles then for J:=1 to 4 do begin Q.ParamByName('V'+IntToStr(J)).AsCurrency:=Prod.Precios[0].Precios[J];Q.ParamByName('M'+IntToStr(J)).AsFloat:=Prod.Precios[0].Porcientos[J];end;
      Q.ExecSQL;
      // Compatibilidad con consultas legacy: conservar el vencimiento mas cercano,
      // sin sustituir la identidad de cada lote por la ultima linea del pedido.
      K:=0;for J:=0 to P.Lineas.Count-1 do begin L:=TPedidoLinea(P.Lineas[J]);
        if (L.Producto=Prod) and (Trim(L.Lote)<>'') then Inc(K);end;
      if K>0 then begin
        SQL('UPDATE INVENTARIO_PRODUCTO SET FECHA_VENCIMIENTO=(SELECT MIN(FECHA_VENCIMIENTO) FROM LOTE WHERE CODIGO=:P AND COALESCE(CANT_IN,0)>COALESCE(CANT_OUT,0)) WHERE CODIGO=:P AND CIA_KEY=:E');
        Q.ParamByName('P').AsInteger:=Prod.Codigo;Q.ParamByName('E').AsInteger:=P.Empresa;Q.ExecSQL;
      end;
      if Prod.Inventariar then begin
        // No se usa el SP legacy: su fallback omite CIA_KEY en dos comprobaciones.
        SQL('SELECT CANTIDAD FROM INVENTARIO_ALMACEN WHERE CODIGO=:P AND INVENTARIO_ID=:A AND CIA_KEY=:E WITH LOCK');
        Q.ParamByName('P').AsInteger:=Prod.Codigo;Q.ParamByName('A').AsInteger:=P.Almacen;Q.ParamByName('E').AsInteger:=P.Empresa;Q.Open;
        PrevAlmacen:=0;
        if Q.Eof then begin
          Q.Close;SQL('INSERT INTO INVENTARIO_ALMACEN(CODIGO,INVENTARIO_ID,CIA_KEY,CANTIDAD,CODIGO_USUARIO,FECHA_IN,IN_POR,STATUS) VALUES(:P,:A,:E,:C,:US,:F,:N,''A'')');
          Q.ParamByName('US').AsInteger:=P.Usuario;Q.ParamByName('F').AsDateTime:=P.Fecha;Q.ParamByName('N').AsString:=Copy(P.NombreUsuario,1,12);
        end else begin
          PrevAlmacen:=Q.Fields[0].AsFloat;Q.Next;if not Q.Eof then raise Exception.Create('Almacen con productos duplicados.');Q.Close;
          SQL('UPDATE INVENTARIO_ALMACEN SET CANTIDAD=COALESCE(CANTIDAD,0)+:C,FECHA_MOD=:F,MOD_POR=:N WHERE CODIGO=:P AND INVENTARIO_ID=:A AND CIA_KEY=:E');
          Q.ParamByName('F').AsDateTime:=P.Fecha;Q.ParamByName('N').AsString:=Copy(P.NombreUsuario,1,12);
        end;
        Q.ParamByName('P').AsInteger:=Prod.Codigo;Q.ParamByName('A').AsInteger:=P.Almacen;Q.ParamByName('E').AsInteger:=P.Empresa;Q.ParamByName('C').AsFloat:=Entrada;Q.ExecSQL;
        SQL('SELECT CANTIDAD FROM INVENTARIO_ALMACEN WHERE CODIGO=:P AND INVENTARIO_ID=:A AND CIA_KEY=:E');
        Q.ParamByName('P').AsInteger:=Prod.Codigo;Q.ParamByName('A').AsInteger:=P.Almacen;Q.ParamByName('E').AsInteger:=P.Empresa;Q.Open;
        if Q.Eof or (Abs(Q.Fields[0].AsFloat-PrevAlmacen-Entrada)>0.0001) then raise Exception.Create('El almacen no conservo toda la cantidad recibida.');Q.Close;
      end;
      GuardarPrecios(Prod,Tx,P.Usuario,P.NombreUsuario);
      EjecutarProc(Tx,'PROC_INSCOSTO_PRODUCTO',['CODIGOPROVEEDOR','CODIGO_ARTICULO','FECHA_ULT_PEDIDO','NUMERO_CONDUCE','PRECIO','CODIGO_USUARIO'],
        [P.Proveedor,Prod.Codigo,VarFromDateTime(P.Fecha),P.Factura,Prod.CostoNuevo,P.Usuario]);
      LockProducto(Prod.Codigo);
      if (Abs(Q.FieldByName('CANTIDAD').AsFloat-PrevStock-Entrada)>0.0001) or
        (Abs(Q.FieldByName('PRECIO_COMPRA').AsCurrency-Prod.CostoNuevo)>0.005) or
        (Abs(Q.FieldByName('PRECIO').AsCurrency-Prod.PrecioBase)>0.005) or
        (Abs(Q.FieldByName('PRECIO_MINIMO').AsCurrency-Prod.MinimoBase)>0.005) then
        raise Exception.Create('Inventario no conservo cantidad/costo/precio completos.');
      if Prod.Modo=ppNiveles then for J:=1 to 4 do
        if Abs(Q.FieldByName('PRECIOVENTA'+IntToStr(J)).AsCurrency-Prod.Precios[0].Precios[J])>0.005 then
          raise Exception.Create('Un trigger altero los precios confirmados; no se guardo la recepcion.');
      Q.Close;
    end;
    if P.FormaPago in [7,8] then begin
      SQL('SELECT GEN_ID(GEN_SERIE_TRN_CXP,1) FROM RDB$DATABASE');Q.Open;Cxp:=Q.Fields[0].AsInteger;Q.Close;
      SQL('INSERT INTO TRANS_CXP(SERIE,CIA_KEY,TIPO_DOC,MONEDA,FECHA,NUMERO_DOC,CODIGO_CLIENTE,CODIGO_SERV,CONCEPTO,VALOR_DOCUMENTO,TIPO_TRANF,STATUS,TIPO_SERV,FECHA_IN,IN_POR,CODIGO_USUARIO,SERIETRNCOSTO) '+
        'VALUES(:S,:E,2,''1'',:F,:N,:P,0,''Compra'',:M,1,''A'',2,CURRENT_TIMESTAMP,:US,:U,:R)');
      Q.ParamByName('S').AsInteger:=Cxp;Q.ParamByName('E').AsInteger:=P.Empresa;Q.ParamByName('F').AsDateTime:=P.Fecha;
      Q.ParamByName('N').AsInteger:=P.Factura;Q.ParamByName('P').AsInteger:=P.Proveedor;Q.ParamByName('M').AsCurrency:=P.Total;
      Q.ParamByName('US').AsString:=Copy(P.NombreUsuario,1,12);Q.ParamByName('U').AsInteger:=P.Usuario;Q.ParamByName('R').AsInteger:=Num;Q.ExecSQL;
      EjecutarProc(Tx,'PROC_INSFACTURAS_PEND',['CODIGO_PROV','TIPO','MONEDA','NUMERO_FACT','MONTO_PENDIENTE','FECHA','TIPO_CF','FECHA_VENCE','NUM_FACT_PROV'],
        [P.Proveedor,0,'1',P.Factura,P.Total,VarFromDateTime(P.Fecha),Null,VarFromDateTime(P.VencimientoPago),IntToStr(P.Factura)]);
      EjecutarProc(Tx,'PROC_ACT_BALANCE_PROV_CXP',['CODIGO_CTE','XTIPO','MONEDA','ORIGEN','MONTO','FECHATRN','NUMEROTRN'],
        [P.Proveedor,0,'1',1,P.Total,VarFromDateTime(P.Fecha),Cxp]);
    end;
    SQL('SELECT COUNT(*),SUM(VALOR_TOTAL_DET) FROM DESPACHO WHERE NUMERO=:N');Q.ParamByName('N').AsInteger:=Num;Q.Open;
    if (Q.Fields[0].AsInteger<>P.Lineas.Count) or (Abs(Q.Fields[1].AsCurrency-P.Total)>0.005) then raise Exception.Create('El detalle no coincide con el documento revisado.');Q.Close;
    P.NumeroTentativo:=Num;SeIntentoCommit:=True;Tx.Commit;P.NumeroGuardado:=Num;P.ResultadoIncierto:=False;Result:=Num;
  except
    on E:Exception do begin
      if SeIntentoCommit then P.ResultadoIncierto:=True;
      if Tx.InTransaction then try Tx.Rollback;except end;
      Q.Free;Tx.Free;raise;
    end;
  end;
  Q.Free;Tx.Free;
end;
function TPedidoRecepcionDatos.ComprobarGuardado(P:TPedidoRecepcion):Boolean;
var Q:TIBQuery;
begin
  Result:=False;if P.NumeroTentativo<=0 then Exit;
  Q:=Consulta('SELECT M.MONTO_TOTAL,M.CODIGO_PROV,M.NUMERO_FACTURA,(SELECT COUNT(*) FROM DESPACHO D WHERE D.NUMERO=M.NUMERO) CANT '+
    'FROM DESPACHO_MASTER M WHERE M.NUMERO=:N');
  try
    Q.ParamByName('N').AsInteger:=P.NumeroTentativo;Q.Open;
    if not Q.Eof then begin
      Result:=(Abs(Q.Fields[0].AsCurrency-P.Total)<0.005) and (Q.Fields[1].AsInteger=P.Proveedor) and
        (Q.Fields[2].AsInteger=P.Factura) and (Q.Fields[3].AsInteger=P.Lineas.Count);
      if not Result then raise Exception.Create('El numero tentativo existe con datos diferentes; requiere conciliacion.');
      P.NumeroGuardado:=P.NumeroTentativo;
    end;
    P.ResultadoIncierto:=False;
  finally Q.Free;if FLectura.InTransaction then FLectura.Rollback;end;
end;
end.
