program PruebasInterfaz;
{$APPTYPE CONSOLE}
uses Windows,Messages,SysUtils,Classes,Forms,Controls,StdCtrls,ComCtrls,Grids,Graphics,ExtCtrls,IBDatabase,
 UPedidoRecepcionModelo,UPedidoRecepcionDatos,UPedidoPreciosBorrador,URegPedidoProvNuevo,
 UPedidoRecepcionReporte,QuickRpt,UBridgePedidoQA;
function PrintWindow(hWnd:HWND;hdcBlt:HDC;nFlags:UINT):BOOL;stdcall;external 'user32.dll';
type TEventos=class
  public Accion:Integer;
  Modal:TForm;Timer:TTimer;
  Objetivo:HWND;
  procedure Mostrar(Sender:TObject);
  procedure CerrarModal(Sender:TObject);
  procedure Confirmar(Sender:TObject);
end;
var D:TIBDatabase;F:TfrmRegPedidoProvNuevo;B:TBitmap;L:TStringList;S,Path:string;
 P:TForm;Perfiles:TPedidoPresentaciones;U:TPedidoUnidades;E:TEventos;N,I,DCGuardado:Integer;
 Rpt:TQuickRep;RectOk:Boolean;C:TWinControl;
function Valor(const Texto,Nombre:string):string;
var A,B:Integer;
begin A:=Pos(Nombre+'=',Texto)+Length(Nombre)+1;B:=A;while(B<=Length(Texto))and(Texto[B]<>#39)do Inc(B);Result:=Copy(Texto,A,B-A);end;
function Tasa(Fecha:TDateTime;Codigo:Integer):Double;
begin Result:=18;end;
procedure Check(Ok:Boolean;const Texto:string);
begin if not Ok then raise Exception.Create(Texto);Inc(N);WriteLn('PASS ',Texto);Flush(Output);end;
procedure ErrorPrueba(const Texto:string);
begin raise Exception.Create('Error de formulario: '+Texto);end;
procedure TEventos.Mostrar(Sender:TObject);
begin
 Modal:=TForm(Sender);Modal.Left:=-20000;Modal.Top:=-20000;
 Timer:=TTimer.Create(Modal);Timer.Interval:=80;Timer.OnTimer:=CerrarModal;Timer.Enabled:=True;
end;
procedure TEventos.CerrarModal(Sender:TObject);
var I:Integer;G:TStringGrid;Boton:TButton;
begin
  Timer.Enabled:=False;
  G:=nil;Boton:=nil;
  for I:=0 to Modal.ComponentCount-1 do begin
    if Modal.Components[I] is TStringGrid then G:=TStringGrid(Modal.Components[I]);
    if (Modal.Components[I] is TButton) and (TButton(Modal.Components[I]).Caption='Confirmar precios') then Boton:=TButton(Modal.Components[I]);
  end;
  if G=nil then raise Exception.Create('No se encontro grilla de precios');
  G.Cells[3,1]:='210.00';G.OnSetEditText(G,3,1,'210.00');
  if Accion=0 then Modal.ModalResult:=mrCancel else Boton.Click;
end;
procedure TEventos.Confirmar(Sender:TObject);
var W:HWND;Id:DWORD;Clase:array[0..63]of Char;
begin
 W:=GetLastActivePopup(Objetivo);
 if W=Objetivo then Exit;
 GetWindowThreadProcessId(W,@Id);GetClassName(W,Clase,SizeOf(Clase));
 if (Id=GetCurrentProcessId) and (string(Clase)='#32770') then begin
   Timer.Enabled:=False;PostMessage(W,WM_COMMAND,IDYES,0);
 end;
end;
begin
 try
  Path:=ExpandFileName(ParamStr(1));
  if (Pos(ExtractFilePath(ExpandFileName(ParamStr(0))),Path)<>1) or (Pos('pedidos-qa-',ExtractFileName(Path))<>1) then raise Exception.Create('Solo base sintetica junto al ejecutable.');
  WriteLn('INICIO_INTERFAZ_QA');Flush(Output);
  Application.Initialize;D:=TIBDatabase.Create(nil);L:=TStringList.Create;
  try
    if ParamStr(2)<>'' then L.LoadFromFile(ParamStr(2))
    else L.LoadFromFile('C:\Proyectos\PointSaleSoftResp\PuntoVenta\Fuentes\UDatModConectar.dfm');S:=L.Text;
    D.DatabaseName:='localhost:'+Path;D.SQLDialect:=1;D.LoginPrompt:=False;
    D.Params.Values['user_name']:=Valor(S,'user_name');D.Params.Values['password']:=Valor(S,'password');S:='';D.Connected:=True;
    WriteLn('CONEXION_QA_OK');Flush(Output);F:=TfrmRegPedidoProvNuevo.Create(nil);F.OnAviso:=ErrorPrueba;
    try
      F.ResolverTasa:=Tasa;F.Configurar(D,1,1,1,Date,ppSimple,'QA','Almacen principal',False);
      F.Position:=poDesigned;F.Left:=-20000;F.Top:=-20000;F.Show;Application.ProcessMessages;
      Check(F.Borrador.Lineas.Count=0,'ventana inicia sin lineas persistentes');
      TEdit(F.FindComponent('edtBuscarPedido')).Text:='FTEST';TButton(F.FindComponent('btnBuscarPedido')).Click;
      Check(TStringGrid(F.FindComponent('grdProductosPedido')).Cells[0,1]='1001','busqueda conectada al formulario nuevo');
      TButton(F.FindComponent('btnElegirPedido')).Click;
      TComboBox(F.FindComponent('cboUnidadPedido')).ItemIndex:=1;
      TComboBox(F.FindComponent('cboUnidadPedido')).OnChange(TComboBox(F.FindComponent('cboUnidadPedido')));
      TEdit(F.FindComponent('edtCantidadPedido')).Text:='3';TEdit(F.FindComponent('edtOfertaPedido')).Text:='1';
      TEdit(F.FindComponent('edtCostoPedido')).Text:='1416';TEdit(F.FindComponent('edtDescuentoPedido')).Text:='5';
      for I:=0 to F.ControlCount-1 do if (F.Controls[I] is TRadioButton) and (TRadioButton(F.Controls[I]).Caption='Precio Venta') then TRadioButton(F.Controls[I]).Checked:=True;
      TEdit(F.FindComponent('edtVentaPedido')).Text:='2160';TEdit(F.FindComponent('edtMinimoPedido')).Text:='2040';
      B:=TBitmap.Create;
      try
        F.Width:=1024;F.Height:=760;F.HandleNeeded;F.Update;B.Width:=F.ClientWidth;B.Height:=F.ClientHeight;
        DCGuardado:=SaveDC(B.Canvas.Handle);F.PaintTo(B.Canvas.Handle,0,0);RestoreDC(B.Canvas.Handle,DCGuardado);
        RectOk:=True;
        for I:=0 to F.ControlCount-1 do if F.Controls[I] is TWinControl then begin
          C:=TWinControl(F.Controls[I]);RectOk:=RectOk and (C.Left>=0) and (C.Top>=0) and (C.Left+C.Width<=F.ClientWidth) and (C.Top+C.Height<=F.ClientHeight);
          DCGuardado:=SaveDC(B.Canvas.Handle);C.PaintTo(B.Canvas.Handle,C.Left,C.Top);RestoreDC(B.Canvas.Handle,DCGuardado);
        end;
        B.SaveToFile(ExtractFilePath(ParamStr(0))+'ventana-pedidos.bmp');Check(RectOk,'controles caben a 1024 px sin salirse de la ventana');
      finally B.Free;end;
      TButton(F.FindComponent('btnAgregarPedido')).Click;
      Check(F.Borrador.Lineas.Count=1,'agregar producto solo al borrador');
      Check(TPedidoLinea(F.Borrador.Lineas[0]).EntradaBase=48,'formulario convierte caja y oferta a unidades');
      Check(TPedidoLinea(F.Borrador.Lineas[0]).CostoBase=118,'formulario conserva costo bruto sin descuento');
      Check(F.Borrador.Total=4035.6,'formulario muestra total del proveedor');
      Check(not TDateTimePicker(F.FindComponent('fechaPedido')).Enabled,'fecha se fija mientras existen lineas');
      TButton(F.FindComponent('btnElegirPedido')).Click;
      TEdit(F.FindComponent('edtCantidadPedido')).Text:='2';TEdit(F.FindComponent('edtCostoPedido')).Text:='130';
      TButton(F.FindComponent('btnCancelarItem')).Click;
      Check(TPedidoProducto(F.Borrador.Productos[0]).CostoNuevo=118,'cancelar item no cambia precios/costo de lineas existentes');
      TComboBox(F.FindComponent('cboProveedorPedido')).ItemIndex:=0;
      TComboBox(F.FindComponent('cboProveedorPedido')).OnChange(TComboBox(F.FindComponent('cboProveedorPedido')));
      TEdit(F.FindComponent('edtFacturaPedido')).Text:='999';TEdit(F.FindComponent('edtTotalProveedor')).Text:='4035.60';
      TEdit(F.FindComponent('edtCostoPedido')).Enabled:=False;F.AplicarPermisosCaptura;
      E:=TEventos.Create;
      try
        E.Objetivo:=F.Handle;E.Timer:=TTimer.Create(F);E.Timer.Interval:=60;E.Timer.OnTimer:=E.Confirmar;E.Timer.Enabled:=True;
        TButton(F.FindComponent('BitBtn2')).Click;
        E.Timer.Enabled:=False;
        Check(F.Borrador.NumeroGuardado>0,'boton Procesar registra una sola vez en QA');
        Rpt:=CrearReporteRecepcionPedido(F.Borrador);
        try
          Check(Rpt.DataSet.RecordCount=1,'reporte nuevo contiene la linea confirmada');
          Check(Rpt.DataSet.FieldByName('Costo').AsString=FormatFloat('#,##0.00',1416),'reporte muestra costo de la presentacion con ITBIS');
          Check(Rpt.DataSet.FieldByName('Total').AsString=FormatFloat('#,##0.00',4035.6),'reporte conserva descuento y total del proveedor');
        finally Rpt.Free;end;
        TButton(F.FindComponent('BitBtn2')).Click;
        Check(not TEdit(F.FindComponent('edtFacturaPedido')).Enabled,'pedido guardado queda cerrado a cambios');
        TButton(F.FindComponent('btnNuevoPedido')).Click;
        Check(F.Borrador.Lineas.Count=0,'nueva recepcion inicia otro borrador');
        Check(not TEdit(F.FindComponent('edtCostoPedido')).Enabled,'nueva recepcion conserva permiso de costo');
        Check(not TComboBox(F.FindComponent('cboItbisCosto')).Enabled,'permiso de costo cubre su base de impuestos');
        E.Timer.Free;
      finally E.Free;end;
      F.OnCloseQuery:=nil;
    finally F.Free;end;
    SetLength(Perfiles,1);Perfiles[0].Unidad:=7;Perfiles[0].Descripcion:='Unidad';Perfiles[0].Factor:=1;
    Perfiles[0].Precios[1]:=180;Perfiles[0].Precios[2]:=170;Perfiles[0].Porcientos[1]:=50;
    SetLength(U,1);U[0].Id:=7;U[0].Descripcion:='Unidad';U[0].Factor:=1;E:=TEventos.Create;
    try
      P:=TForm.CreateNew(nil);P.OnShow:=E.Mostrar;E.Accion:=0;
      try Check(not EditarPreciosPedido(P,'Producto QA',118,ppSimple,Perfiles,U),'cancelar ventana de precios devuelve cancelacion');
      finally P.Free;end;
      Check(Perfiles[0].Precios[1]=180,'cancelar ventana no altera precios originales');
      P:=TForm.CreateNew(nil);P.OnShow:=E.Mostrar;E.Accion:=1;
      try Check(EditarPreciosPedido(P,'Producto QA',118,ppSimple,Perfiles,U),'confirmacion valida editor en memoria');finally P.Free;end;
      Check(Perfiles[0].Precios[1]=210,'confirmar devuelve precio revisado');
      Check(Abs(Perfiles[0].Porcientos[1]-(210/118-1)*100)<0.000001,'precio manual actualiza porcentaje sin impuesto adicional');
    finally E.Free;end;
    WriteLn('INTERFAZ_PEDIDOS=PASS; CHECKS=',N,'; BASE_COMERCIAL=0; GUARDADO_SOLO_QA=1');
  finally L.Free;D.Free;end;
 except on Ex:Exception do begin WriteLn('FAIL ',Ex.ClassName,': ',Ex.Message);Halt(1);end;end;
end.
