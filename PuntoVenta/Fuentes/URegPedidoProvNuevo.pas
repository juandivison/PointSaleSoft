unit URegPedidoProvNuevo;
interface
uses Windows,Messages,SysUtils,Classes,Graphics,Controls,Forms,Dialogs,StdCtrls,
  ExtCtrls,Grids,ComCtrls,Buttons,IBDatabase,UPedidoRecepcionModelo,UPedidoRecepcionDatos;
type
  TPedidoEditarPrecios=function(const Nombre:string;Costo:Currency;Modo:TPedidoModoPrecio;
    var Precios:TPedidoPresentaciones;const Unidades:TPedidoUnidades):Boolean;
  TPedidoResolverTasa=function(Fecha:TDateTime;Codigo:Integer):Double;
  TPedidoAviso=procedure(const Texto:string);
  TfrmRegPedidoProvNuevo=class(TForm)
  private
    FPedido:TPedidoRecepcion;FDatos:TPedidoRecepcionDatos;FUnidades:TPedidoUnidades;
    FModo:TPedidoModoPrecio;FTrabajo:TPedidoProducto;FEditando:Integer;
    FProcesando,FCargando,FDirty:Boolean;
    FEdicionHabilitada:TBits;
    FTitulo,FEstado,FProducto,FEquivalencia,FPrecioEstado,FError,FTotal,FPreciosTitulo:TLabel;
    LUnidad,LCosto,LVenta,LMinimo:TLabel;
    CProveedor,CUnidad,CImpuesto,CPago:TComboBox;
    EFactura,ENcf,ERnc,ETotalProveedor,EBuscar,ECantidad,EOferta,ECosto,EDescuento,ELote,EVenta,EMinimo,EMargen:TEdit;
    DFecha,DVence,DPago:TDateTimePicker;RPorcentaje,RPrecio:TRadioButton;
    GProductos,GLineas:TStringGrid;
    BBuscar,BElegir,BAgregar,BCancelar,BPrecios,BQuitar,BNuevo,BImprimir:TButton;
    BProcesar:TBitBtn;
    FFondoDocumento,FFondoEditor:TShape;
    procedure Construir;
    function Etiqueta(const Texto:string;X,Y,W:Integer):TLabel;
    function Entrada(const Texto:string;X,Y,W:Integer;out L:TLabel):TEdit;
    function Boton(const Texto:string;X,Y,W:Integer;Evento:TNotifyEvent):TButton;
    procedure Redimensionar(Sender:TObject);
    procedure Buscar(Sender:TObject);
    procedure TeclaBuscar(Sender:TObject;var Key:Word;Shift:TShiftState);
    procedure Elegir(Sender:TObject);
    procedure Captura(Sender:TObject);
    procedure CambiarUnidad(Sender:TObject);
    procedure CambiarProveedor(Sender:TObject);
    procedure ActualizarVista;
    procedure LimpiarEditor;
    function CapturarLinea:TPedidoLinea;
    procedure PrepararPrecios(L:TPedidoLinea);
    function RevisarPrecios:Boolean;
    procedure PreciosClick(Sender:TObject);
    procedure Agregar(Sender:TObject);
    procedure CancelarItem(Sender:TObject);
    procedure RefrescarLineas;
    procedure EditarLinea(Sender:TObject);
    procedure Quitar(Sender:TObject);
    procedure Procesar(Sender:TObject);
    procedure NuevaRecepcion(Sender:TObject);
    procedure Imprimir(Sender:TObject);
    procedure CerrarConsulta(Sender:TObject;var CanClose:Boolean);
    procedure Fallo(const S:string);
    procedure EstadoGuardado;
  public
    OnEditarPrecios:TPedidoEditarPrecios;
    ResolverTasa:TPedidoResolverTasa;
    OnAviso:TPedidoAviso;
    constructor Create(AOwner:TComponent);override;
    destructor Destroy;override;
    procedure Configurar(DB:TIBDatabase;Empresa,Almacen,Usuario:Integer;
      Fecha:TDateTime;Modo:TPedidoModoPrecio;const NombreUsuario,AlmacenNombre:string;
      RequiereLote:Boolean);
    procedure AplicarPermisosCaptura;
    property Borrador:TPedidoRecepcion read FPedido;
  end;
implementation
uses Math,UPedidoPreciosBorrador,UPedidoRecepcionReporte;
const Azul=$00A85F26;
function LeerNumero(E:TEdit;const Nombre:string):Double;
begin
  if not TryStrToFloat(Trim(E.Text),Result) then begin if (GetParentForm(E)<>nil) and GetParentForm(E).Visible and E.CanFocus then E.SetFocus;raise Exception.Create('Indique '+Nombre+' con un numero valido.');end;
end;
constructor TfrmRegPedidoProvNuevo.Create(AOwner:TComponent);
begin
  inherited CreateNew(AOwner);Name:='frmRegPedidoProvNuevo';FPedido:=TPedidoRecepcion.Create;
  FEdicionHabilitada:=TBits.Create;FEditando:=-1;Construir;OnResize:=Redimensionar;OnCloseQuery:=CerrarConsulta;Redimensionar(Self);
end;
destructor TfrmRegPedidoProvNuevo.Destroy;
begin FTrabajo.Free;FPedido.Free;FDatos.Free;FEdicionHabilitada.Free;inherited;end;
function TfrmRegPedidoProvNuevo.Etiqueta(const Texto:string;X,Y,W:Integer):TLabel;
begin Result:=TLabel.Create(Self);Result.Parent:=Self;Result.SetBounds(X,Y,W,18);Result.AutoSize:=False;Result.Transparent:=True;Result.Caption:=Texto;end;
function TfrmRegPedidoProvNuevo.Entrada(const Texto:string;X,Y,W:Integer;out L:TLabel):TEdit;
begin L:=Etiqueta(Texto,X,Y,W);Result:=TEdit.Create(Self);Result.Parent:=Self;Result.SetBounds(X,Y+20,W,24);L.FocusControl:=Result;Result.OnChange:=Captura;end;
function TfrmRegPedidoProvNuevo.Boton(const Texto:string;X,Y,W:Integer;Evento:TNotifyEvent):TButton;
begin Result:=TButton.Create(Self);Result.Parent:=Self;Result.SetBounds(X,Y,W,29);Result.Caption:=Texto;Result.OnClick:=Evento;end;
procedure TfrmRegPedidoProvNuevo.Construir;
var L:TLabel;
  function Combo(const Texto:string;X,Y,W:Integer):TComboBox;
  begin Etiqueta(Texto,X,Y,W);Result:=TComboBox.Create(Self);Result.Parent:=Self;
    Result.SetBounds(X,Y+20,W,24);Result.Style:=csDropDownList;Result.OnChange:=Captura;end;
  function Fecha(const Texto:string;X,Y,W:Integer):TDateTimePicker;
  begin Etiqueta(Texto,X,Y,W);Result:=TDateTimePicker.Create(Self);Result.Parent:=Self;
    Result.SetBounds(X,Y+20,W,24);Result.Date:=Date;Result.Format:='dd/MM/yyyy';Result.OnChange:=Captura;end;
begin
  Caption:='Registro de pedidos - Nuevo';Font.Name:='Segoe UI';Font.Size:=9;Color:=$00F7F5F2;
  Position:=poScreenCenter;Width:=1120;Height:=780;Constraints.MinWidth:=1000;Constraints.MinHeight:=730;
  FFondoDocumento:=TShape.Create(Self);FFondoDocumento.Parent:=Self;FFondoDocumento.Brush.Color:=clWhite;FFondoDocumento.Pen.Color:=$00E6E1DB;
  FFondoEditor:=TShape.Create(Self);FFondoEditor.Parent:=Self;FFondoEditor.Brush.Color:=clWhite;FFondoEditor.Pen.Color:=$00E6E1DB;
  FTitulo:=Etiqueta('Registro de pedidos',20,14,700);FTitulo.Font.Size:=17;FTitulo.Font.Style:=[fsBold];FTitulo.Height:=28;
  FEstado:=Etiqueta('Borrador en memoria - nada se guarda hasta Procesar.',20,47,1000);FEstado.Font.Color:=Azul;
  CProveedor:=Combo('Proveedor',20,75,266);CProveedor.OnChange:=CambiarProveedor;
  EFactura:=Entrada('Factura proveedor',300,75,125,L);DFecha:=Fecha('Fecha recepcion',440,75,115);
  CPago:=Combo('Forma de pago',570,75,120);CPago.Items.Add('Contado');CPago.Items.Add('Credito');CPago.ItemIndex:=0;
  DPago:=Fecha('Vence el credito',705,75,115);DPago.Date:=Date+30;
  ETotalProveedor:=Entrada('Total proveedor',835,75,160,L);
  ENcf:=Entrada('NCF proveedor',20,128,266,L);ERnc:=Entrada('RNC proveedor',300,128,125,L);
  EBuscar:=Entrada('Buscar codigo, codigo texto, referencia o descripcion (Enter)',440,128,380,L);EBuscar.OnKeyDown:=TeclaBuscar;EBuscar.OnChange:=nil;
  BBuscar:=Boton('Buscar',835,147,94,Buscar);BElegir:=Boton('Seleccionar',940,147,120,Elegir);
  GProductos:=TStringGrid.Create(Self);GProductos.Parent:=Self;GProductos.SetBounds(20,184,1040,98);
  GProductos.ColCount:=5;GProductos.RowCount:=2;GProductos.FixedRows:=1;GProductos.FixedCols:=0;
  GProductos.DefaultRowHeight:=22;GProductos.Options:=[goFixedVertLine,goFixedHorzLine,goHorzLine,goRowSelect];
  GProductos.Cells[0,0]:='Codigo';GProductos.Cells[1,0]:='Codigo texto';GProductos.Cells[2,0]:='Descripcion';GProductos.Cells[3,0]:='Existencia';GProductos.Cells[4,0]:='Precio actual';
  GProductos.ColWidths[0]:=65;GProductos.ColWidths[1]:=125;GProductos.ColWidths[2]:=590;GProductos.ColWidths[3]:=100;GProductos.ColWidths[4]:=120;
  GProductos.OnDblClick:=Elegir;
  FProducto:=Etiqueta('Seleccione un producto para comenzar.',20,294,1000);FProducto.Font.Style:=[fsBold];FProducto.Font.Size:=10;
  FPreciosTitulo:=Etiqueta('Precios de venta',595,294,460);FPreciosTitulo.Font.Style:=[fsBold];FPreciosTitulo.Font.Color:=Azul;
  CUnidad:=Combo('Presentacion de compra',20,325,220);CUnidad.OnChange:=CambiarUnidad;
  ECantidad:=Entrada('Cantidad comprada',252,325,130,L);EOferta:=Entrada('Oferta / misma presentacion',395,325,165,L);EOferta.Text:='0';
  ECosto:=Entrada('Costo / presentacion',20,378,140,LCosto);ECosto.Tag:=656;
  CImpuesto:=Combo('ITBIS del costo',172,378,165);CImpuesto.Items.Add('Ya incluido');CImpuesto.Items.Add('No incluido');CImpuesto.ItemIndex:=0;
  EDescuento:=Entrada('Descuento documento %',350,378,210,L);EDescuento.Text:='0';
  ELote:=Entrada('Numero de lote (si aplica)',20,431,220,L);DVence:=Fecha('Vencimiento del lote',252,431,145);DVence.ShowCheckbox:=True;DVence.Checked:=False;
  FEquivalencia:=Etiqueta('Entrada al inventario: -',20,487,540);FEquivalencia.Font.Color:=Azul;FEquivalencia.Font.Style:=[fsBold];
  RPorcentaje:=TRadioButton.Create(Self);RPorcentaje.Parent:=Self;RPorcentaje.SetBounds(595,325,115,22);RPorcentaje.Caption:='Margen G';RPorcentaje.OnClick:=Captura;
  RPrecio:=TRadioButton.Create(Self);RPrecio.Parent:=Self;RPrecio.SetBounds(715,325,135,22);RPrecio.Caption:='Precio Venta';RPrecio.Checked:=True;RPrecio.OnClick:=Captura;
  EMargen:=Entrada('% utilidad',595,355,100,L);
  EVenta:=Entrada('Venta c/ITBIS',710,355,120,LVenta);EMinimo:=Entrada('Minimo c/ITBIS',845,355,120,LMinimo);
  BPrecios:=Boton('Revisar precios y presentaciones...',595,414,300,PreciosClick);
  FPrecioEstado:=Etiqueta('Costo y venta se guardan con ITBIS.',595,452,470);
  BAgregar:=Boton('Agregar al pedido',750,481,155,Agregar);BCancelar:=Boton('Cancelar item',915,481,145,CancelarItem);
  GLineas:=TStringGrid.Create(Self);GLineas.Parent:=Self;GLineas.SetBounds(20,528,1040,130);
  GLineas.ColCount:=8;GLineas.RowCount:=2;GLineas.FixedRows:=1;GLineas.FixedCols:=0;GLineas.DefaultRowHeight:=23;
  GLineas.Options:=[goFixedVertLine,goFixedHorzLine,goHorzLine,goRowSelect];GLineas.OnDblClick:=EditarLinea;
  GLineas.Cells[0,0]:='Producto / lote';GLineas.Cells[1,0]:='Presentacion';GLineas.Cells[2,0]:='Compra';GLineas.Cells[3,0]:='Oferta';
  GLineas.Cells[4,0]:='Entrada inv.';GLineas.Cells[5,0]:='Costo c/ITBIS';GLineas.Cells[6,0]:='Desc. %';GLineas.Cells[7,0]:='Total documento';
  GLineas.ColWidths[0]:=290;GLineas.ColWidths[1]:=180;GLineas.ColWidths[2]:=65;GLineas.ColWidths[3]:=65;
  GLineas.ColWidths[4]:=90;GLineas.ColWidths[5]:=115;GLineas.ColWidths[6]:=70;GLineas.ColWidths[7]:=130;
  FError:=Etiqueta('',20,663,1040);FError.Font.Color:=clMaroon;
  FTotal:=Etiqueta('Total documento: 0.00',20,690,430);FTotal.Font.Size:=13;FTotal.Font.Style:=[fsBold];FTotal.Height:=25;
  BQuitar:=Boton('Quitar linea',460,686,110,Quitar);BNuevo:=Boton('Nueva recepcion',580,686,130,NuevaRecepcion);
  BImprimir:=Boton('Vista previa',720,686,120,Imprimir);BImprimir.Enabled:=False;
  BProcesar:=TBitBtn.Create(Self);BProcesar.Parent:=Self;BProcesar.Name:='BitBtn2';BProcesar.SetBounds(850,686,210,31);
  BProcesar.Caption:='Procesar pedido';BProcesar.OnClick:=Procesar;
  BProcesar.Font.Style:=[fsBold];
  CProveedor.Name:='cboProveedorPedido';CUnidad.Name:='cboUnidadPedido';CImpuesto.Name:='cboItbisCosto';CPago.Name:='cboPagoPedido';
  EFactura.Name:='edtFacturaPedido';ETotalProveedor.Name:='edtTotalProveedor';ENcf.Name:='edtNcfProveedor';ERnc.Name:='edtRncProveedor';
  EBuscar.Name:='edtBuscarPedido';ECantidad.Name:='edtCantidadPedido';EOferta.Name:='edtOfertaPedido';ECosto.Name:='edtCostoPedido';
  EDescuento.Name:='edtDescuentoPedido';ELote.Name:='edtLotePedido';EVenta.Name:='edtVentaPedido';EMinimo.Name:='edtMinimoPedido';EMargen.Name:='edtMargenPedido';
  BBuscar.Name:='btnBuscarPedido';BElegir.Name:='btnElegirPedido';BAgregar.Name:='btnAgregarPedido';BCancelar.Name:='btnCancelarItem';
  BPrecios.Name:='btnPreciosPedido';BNuevo.Name:='btnNuevoPedido';GProductos.Name:='grdProductosPedido';GLineas.Name:='grdDetallePedido';
  DFecha.Name:='fechaPedido';DVence.Name:='venceLotePedido';DPago.Name:='vencePagoPedido';
end;
procedure TfrmRegPedidoProvNuevo.Redimensionar(Sender:TObject);
var W,H:Integer;
begin
  if GLineas=nil then Exit;W:=ClientWidth-40;H:=ClientHeight;
  FFondoDocumento.SetBounds(10,68,ClientWidth-20,110);FFondoEditor.SetBounds(10,287,ClientWidth-20,232);
  GProductos.Width:=W;GLineas.SetBounds(20,528,W,Max(55,H-617));
  FError.SetBounds(20,H-84,W,18);FTotal.Top:=H-57;
  FTotal.Width:=Max(240,ClientWidth-680);
  BProcesar.SetBounds(ClientWidth-230,H-61,210,31);BImprimir.SetBounds(ClientWidth-360,H-61,120,31);
  BNuevo.SetBounds(ClientWidth-500,H-61,130,31);BQuitar.SetBounds(ClientWidth-620,H-61,110,31);
  // El formulario conserva medidas legibles a 1024 px; el editor derecho se contrae.
  EMinimo.Width:=Max(100,ClientWidth-865);LMinimo.Width:=EMinimo.Width;
  ETotalProveedor.Width:=Max(115,ClientWidth-855);
  BCancelar.Left:=ClientWidth-165;BAgregar.Left:=ClientWidth-330;
  BElegir.Left:=ClientWidth-140;BBuscar.Left:=ClientWidth-245;
  EBuscar.Width:=Max(220,ClientWidth-705);FPrecioEstado.Width:=ClientWidth-615;
  FProducto.Width:=550;FPreciosTitulo.Width:=ClientWidth-615;FEstado.Width:=W;GProductos.ColWidths[2]:=Max(320,W-430);
  GLineas.ColWidths[0]:=Max(200,W-730);
end;
procedure TfrmRegPedidoProvNuevo.Configurar(DB:TIBDatabase;Empresa,Almacen,Usuario:Integer;
  Fecha:TDateTime;Modo:TPedidoModoPrecio;const NombreUsuario,AlmacenNombre:string;RequiereLote:Boolean);
var I:Integer;Nombre:string;
begin
  if FDatos<>nil then raise Exception.Create('La ventana ya fue configurada.');
  FDatos:=TPedidoRecepcionDatos.Create(DB);FModo:=Modo;
  case Modo of ppSimple:FPreciosTitulo.Caption:='Venta y precio minimo';ppNiveles:FPreciosTitulo.Caption:='Precios 1-4 / Inventario producto';
    ppPresentaciones:FPreciosTitulo.Caption:='Precios por presentacion / niveles';end;
  FPedido.Empresa:=Empresa;FPedido.Almacen:=Almacen;FPedido.Usuario:=Usuario;FPedido.NombreUsuario:=NombreUsuario;
  FPedido.NombreAlmacen:=AlmacenNombre;FPedido.RequiereLote:=RequiereLote;
  FDatos.DatosEmpresa(Empresa,Nombre);FPedido.NombreEmpresa:=Nombre;
  FEstado.Caption:=Nombre+' | '+AlmacenNombre+' | Borrador en memoria';
  FDatos.Proveedores(Empresa,CProveedor.Items);FDatos.Unidades(FUnidades);
  for I:=0 to High(FUnidades) do CUnidad.Items.Add(FUnidades[I].Descripcion);
  DFecha.Date:=Fecha;DPago.Date:=Fecha+30;FDirty:=False;LimpiarEditor;
end;
procedure TfrmRegPedidoProvNuevo.Buscar(Sender:TObject);
var S,L:TStringList;I,J,A,B:Integer;T:string;
begin
  if FDatos=nil then Exit;S:=TStringList.Create;L:=TStringList.Create;
  try
    FDatos.Buscar(FPedido.Empresa,EBuscar.Text,S);GProductos.RowCount:=Max(2,S.Count+1);
    for I:=1 to GProductos.RowCount-1 do for J:=0 to 4 do GProductos.Cells[J,I]:='';
    for I:=0 to S.Count-1 do begin
      T:=S[I];A:=1;J:=0;
      while (A<=Length(T)+1) and (J<5) do begin B:=A;while(B<=Length(T))and(T[B]<>#9)do Inc(B);
        GProductos.Cells[J,I+1]:=Copy(T,A,B-A);A:=B+1;Inc(J);end;
    end;
    if S.Count=0 then FError.Caption:='No se encontraron productos en esta empresa.' else FError.Caption:='Seleccione un producto con doble clic o pulse Seleccionar.';
  except on E:Exception do Fallo(E.Message);end;
  S.Free;L.Free;
end;
procedure TfrmRegPedidoProvNuevo.TeclaBuscar(Sender:TObject;var Key:Word;Shift:TShiftState);
begin if Key=VK_RETURN then begin Key:=0;Buscar(Sender);if GProductos.Cells[0,1]<>'' then if Visible and GProductos.CanFocus then GProductos.SetFocus;end;end;
procedure TfrmRegPedidoProvNuevo.Elegir(Sender:TObject);
var Codigo,I:Integer;P:TPedidoProducto;Margen:Double;
begin
  if FPedido.NumeroGuardado>0 then Exit;
  Codigo:=StrToIntDef(GProductos.Cells[0,GProductos.Row],0);if Codigo<=0 then Exit;
  if (FTrabajo<>nil) and FDirty and (MessageBox(Handle,'Descartar el item en edicion?','Cambiar producto',MB_YESNO or MB_ICONQUESTION)<>IDYES) then Exit;
  try
    LimpiarEditor;P:=FPedido.Producto(Codigo);
    if P<>nil then begin FTrabajo:=TPedidoProducto.Create;FTrabajo.CopiarDe(P);end
    else begin
      FTrabajo:=FDatos.CargarProducto(FPedido.Empresa,Codigo,FModo);
      if FTrabajo.Tasa<0 then begin
        if not Assigned(ResolverTasa) then raise Exception.Create('No esta configurada la tasa ITBIS del producto.');
        FTrabajo.Tasa:=ResolverTasa(DFecha.Date,Codigo);
      end;
    end;
    FCargando:=True;
    FProducto.Caption:=FTrabajo.CodigoTexto+' - '+FTrabajo.Descripcion;
    if CUnidad.Items.Count>0 then CUnidad.ItemIndex:=0;
    EVenta.Text:=FormatFloat('0.00',FTrabajo.PrecioBase);EMinimo.Text:=FormatFloat('0.00',FTrabajo.MinimoBase);
    Margen:=0;
    for I:=0 to High(FTrabajo.Precios) do if Abs(FTrabajo.Precios[I].Factor-1)<0.000001 then Margen:=FTrabajo.Precios[I].Porcientos[1];
    if (Margen<=0) and (FTrabajo.CostoAnterior>0) and (FTrabajo.PrecioBase>FTrabajo.CostoAnterior) then
      Margen:=(FTrabajo.PrecioBase/FTrabajo.CostoAnterior-1)*100;
    RPorcentaje.Checked:=Margen>0;RPrecio.Checked:=not RPorcentaje.Checked;
    if Margen>0 then EMargen.Text:=FormatFloat('0.0000',Margen);
    ECantidad.Text:='';ECosto.Text:='';
    if not ECosto.Enabled then begin ECosto.Text:=CurrToStr(FTrabajo.CostoAnterior);CImpuesto.ItemIndex:=0;end;
    FCargando:=False;FDirty:=False;
    ActualizarVista;if Visible and ECantidad.CanFocus then ECantidad.SetFocus;
  except on E:Exception do begin FCargando:=False;Fallo(E.Message);end;end;
end;
procedure TfrmRegPedidoProvNuevo.LimpiarEditor;
begin
  FCargando:=True;
  try FreeAndNil(FTrabajo);FEditando:=-1;FProducto.Caption:='Seleccione un producto para comenzar.';
    ECantidad.Text:='';ECosto.Text:='';EOferta.Text:='0';EDescuento.Text:='0';ELote.Text:='';DVence.Checked:=False;
    EVenta.Text:='';EMinimo.Text:='';EMargen.Text:='';FEquivalencia.Caption:='Entrada al inventario: -';
    FPrecioEstado.Caption:='Costo y venta se guardan con ITBIS.';BAgregar.Caption:='Agregar al pedido';FDirty:=False;
  finally FCargando:=False;end;
end;
procedure TfrmRegPedidoProvNuevo.CambiarUnidad(Sender:TObject);
var F:Double;
begin
  if FCargando or (FTrabajo=nil) then Exit;
  FCargando:=True;
  try
    F:=FUnidades[CUnidad.ItemIndex].Factor;
    ECosto.Text:='';if not ECosto.Enabled then ECosto.Text:=CurrToStr(FTrabajo.CostoAnterior*F);
    EVenta.Text:=FormatFloat('0.00',FTrabajo.PrecioBase*F);EMinimo.Text:=FormatFloat('0.00',FTrabajo.MinimoBase*F);
  finally FCargando:=False;end;
  FDirty:=True;ActualizarVista;
end;
procedure TfrmRegPedidoProvNuevo.CambiarProveedor(Sender:TObject);
var R:string;Dias:Integer;
begin
  if FCargando or (CProveedor.ItemIndex<0) then Exit;
  try
    FDatos.DatosProveedor(FPedido.Empresa,Integer(CProveedor.Items.Objects[CProveedor.ItemIndex]),R,Dias);
    ERnc.Text:=R;DPago.Date:=DFecha.Date+Dias;
  except on E:Exception do Fallo(E.Message);end;
end;
procedure TfrmRegPedidoProvNuevo.Captura(Sender:TObject);
begin
  if FCargando or FProcesando then Exit;FDirty:=True;
  try ActualizarVista;except on E:Exception do FError.Caption:='Revise el importe: '+E.Message;end;
end;
procedure TfrmRegPedidoProvNuevo.ActualizarVista;
var Cant,Ofta,Costo,V,M,Factor:Double;Nombre:string;
begin
  if (FTrabajo=nil) or (CUnidad.ItemIndex<0) then Exit;
  Factor:=FUnidades[CUnidad.ItemIndex].Factor;Nombre:=FUnidades[CUnidad.ItemIndex].Descripcion;
  LCosto.Caption:='Costo presentacion';LVenta.Caption:='Venta c/ITBIS';LMinimo.Caption:='Minimo c/ITBIS';
  EVenta.Hint:='Precio por '+Nombre;EVenta.ShowHint:=True;EMinimo.Hint:=EVenta.Hint;EMinimo.ShowHint:=True;
  EMargen.ReadOnly:=not RPorcentaje.Checked;EVenta.ReadOnly:=RPorcentaje.Checked;
  EMinimo.ReadOnly:=FModo<>ppSimple;
  if EMargen.ReadOnly then EMargen.Color:=$00F2F2F2 else EMargen.Color:=clWhite;
  if EVenta.ReadOnly then EVenta.Color:=$00F2F2F2 else EVenta.Color:=clWhite;
  if EMinimo.ReadOnly then EMinimo.Color:=$00F2F2F2 else EMinimo.Color:=clWhite;
  if not TryStrToFloat(ECantidad.Text,Cant) then Cant:=0;if not TryStrToFloat(EOferta.Text,Ofta) then Ofta:=0;
  FEquivalencia.Caption:='Entrada: '+FloatToStr((Cant+Ofta)*Factor)+' unidad(es) = '+FloatToStr(Cant*Factor)+' compra + '+FloatToStr(Ofta*Factor)+' oferta';
  if not FTrabajo.Inventariar then FEquivalencia.Caption:='Producto no inventariable: no modifica existencias.';
  if TryStrToFloat(ECosto.Text,Costo) and (Costo>0) then begin
    if CImpuesto.ItemIndex=1 then Costo:=Costo*(1+FTrabajo.Tasa/100);
    FCargando:=True;
    try
      if RPorcentaje.Checked and TryStrToFloat(EMargen.Text,M) then EVenta.Text:=FormatFloat('0.00',PedidoDinero(Costo*(1+M/100)))
      else if TryStrToFloat(EVenta.Text,V) then EMargen.Text:=FormatFloat('0.00',(V/Costo-1)*100);
      if FModo<>ppSimple then EMinimo.Text:=EVenta.Text;
    finally FCargando:=False;end;
    FPrecioEstado.Caption:='Costo inventario / unidad: '+FormatFloat('#,##0.00',PedidoDinero(Costo/Factor))+' (ITBIS '+FloatToStr(FTrabajo.Tasa)+' % incluido)';
  end;
end;
function TfrmRegPedidoProvNuevo.CapturarLinea:TPedidoLinea;
var U:Integer;
begin
  if FTrabajo=nil then raise Exception.Create('Seleccione un producto.');
  U:=CUnidad.ItemIndex;if U<0 then raise Exception.Create('Seleccione la presentacion.');
  Result:=TPedidoLinea.Create;
  try
    Result.Producto:=FTrabajo;Result.Unidad:=FUnidades[U].Id;Result.Presentacion:=FUnidades[U].Descripcion;Result.Factor:=FUnidades[U].Factor;
    Result.Cantidad:=LeerNumero(ECantidad,'la cantidad comprada');Result.Oferta:=LeerNumero(EOferta,'la oferta');
    Result.CostoProveedor:=PedidoDinero(LeerNumero(ECosto,'el costo'));Result.IncluyeItbis:=CImpuesto.ItemIndex=0;
    Result.Descuento:=LeerNumero(EDescuento,'el descuento');Result.Lote:=Trim(ELote.Text);
    Result.Vence:=0;if DVence.Checked then Result.Vence:=Trunc(DVence.Date);
  except Result.Free;raise;end;
end;
procedure TfrmRegPedidoProvNuevo.PrepararPrecios(L:TPedidoLinea);
var I:Integer;V,M:Currency;
begin
  FTrabajo.Proponer(L.CostoBase);V:=PedidoDinero(LeerNumero(EVenta,'el precio de venta')/L.Factor);
  M:=PedidoDinero(LeerNumero(EMinimo,'el precio minimo')/L.Factor);
  for I:=0 to High(FTrabajo.Precios) do if Abs(FTrabajo.Precios[I].Factor-1)<0.000001 then begin
    if FTrabajo.Precios[I].Precios[1]<>V then FTrabajo.PreciosConfirmados:=False;
    FTrabajo.Precios[I].Precios[1]:=V;
    FTrabajo.Precios[I].Porcientos[1]:=(V/L.CostoBase-1)*100;
    if FModo=ppSimple then FTrabajo.Precios[I].Precios[2]:=M;
  end;
end;
function TfrmRegPedidoProvNuevo.RevisarPrecios:Boolean;
var F:TForm;Factor:Double;
begin
  if Assigned(OnEditarPrecios) then Result:=OnEditarPrecios(FTrabajo.Descripcion,FTrabajo.CostoNuevo,FModo,FTrabajo.Precios,FUnidades)
  else begin F:=TForm.CreateNew(Self);try Result:=EditarPreciosPedido(F,FTrabajo.Descripcion,FTrabajo.CostoNuevo,FModo,FTrabajo.Precios,FUnidades);finally F.Free;end;end;
  if Result then begin
    FTrabajo.PreciosConfirmados:=True;Factor:=FUnidades[CUnidad.ItemIndex].Factor;FCargando:=True;
    try EVenta.Text:=FormatFloat('0.00',FTrabajo.PrecioBase*Factor);EMinimo.Text:=FormatFloat('0.00',FTrabajo.MinimoBase*Factor);
    finally FCargando:=False;end;ActualizarVista;
  end;
end;
procedure TfrmRegPedidoProvNuevo.PreciosClick(Sender:TObject);
var L:TPedidoLinea;
begin
  L:=nil;
  try L:=CapturarLinea;L.Validar(DFecha.Date,FPedido.RequiereLote);PrepararPrecios(L);RevisarPrecios;
  except on E:Exception do Fallo(E.Message);end;L.Free;
end;
procedure TfrmRegPedidoProvNuevo.Agregar(Sender:TObject);
var L:TPedidoLinea;P:TPedidoProducto;
begin
  if FProcesando or (FPedido.NumeroGuardado>0) then Exit;L:=nil;
  try
    L:=CapturarLinea;L.Validar(DFecha.Date,FPedido.RequiereLote);PrepararPrecios(L);
    if FModo=ppSimple then begin ValidarPreciosPedido(FTrabajo.CostoNuevo,FModo,FTrabajo.Precios);FTrabajo.PreciosConfirmados:=True;end
    else if not FTrabajo.PreciosConfirmados then if not RevisarPrecios then begin FreeAndNil(L);Exit;end;
    P:=FPedido.Producto(FTrabajo.Codigo);
    if P=nil then begin P:=TPedidoProducto.Create;FPedido.Productos.Add(P);end;
    P.CopiarDe(FTrabajo);L.Producto:=P;
    if FEditando>=0 then begin FPedido.Lineas[FEditando]:=L;end else FPedido.Lineas.Add(L);
    L:=nil;LimpiarEditor;RefrescarLineas;FError.Caption:='Producto agregado. Puede continuar buscando o procesar el pedido.';if Visible and EBuscar.CanFocus then EBuscar.SetFocus;
  except on E:Exception do Fallo(E.Message);end;L.Free;
end;
procedure TfrmRegPedidoProvNuevo.CancelarItem(Sender:TObject);
begin LimpiarEditor;FError.Caption:='Item descartado. El pedido no fue modificado.';if Visible and EBuscar.CanFocus then EBuscar.SetFocus;end;
procedure TfrmRegPedidoProvNuevo.RefrescarLineas;
var I,J:Integer;L:TPedidoLinea;
begin
  GLineas.RowCount:=Max(2,FPedido.Lineas.Count+1);
  for I:=1 to GLineas.RowCount-1 do for J:=0 to 7 do GLineas.Cells[J,I]:='';
  for I:=0 to FPedido.Lineas.Count-1 do begin
    L:=TPedidoLinea(FPedido.Lineas[I]);GLineas.Cells[0,I+1]:=L.Producto.CodigoTexto+' '+L.Producto.Descripcion;
    if L.Lote<>'' then GLineas.Cells[0,I+1]:=GLineas.Cells[0,I+1]+' | Lote '+L.Lote+' '+DateToStr(L.Vence);
    GLineas.Cells[1,I+1]:=L.Presentacion;GLineas.Cells[2,I+1]:=FloatToStr(L.Cantidad);GLineas.Cells[3,I+1]:=FloatToStr(L.Oferta);
    if L.Producto.Inventariar then GLineas.Cells[4,I+1]:=FloatToStr(L.EntradaBase) else GLineas.Cells[4,I+1]:='No aplica';
    GLineas.Cells[5,I+1]:=FormatFloat('#,##0.00',L.CostoConItbis);GLineas.Cells[6,I+1]:=FloatToStr(L.Descuento);GLineas.Cells[7,I+1]:=FormatFloat('#,##0.00',L.Total);
  end;
  FTotal.Caption:='Total RD$ '+FormatFloat('#,##0.00',FPedido.Total);
  DFecha.Enabled:=FPedido.Lineas.Count=0;
end;
procedure TfrmRegPedidoProvNuevo.EditarLinea(Sender:TObject);
var L:TPedidoLinea;I,N:Integer;
begin
  if (FPedido.NumeroGuardado>0) or (GLineas.Row<1) or (GLineas.Row>FPedido.Lineas.Count) then Exit;
  if (FTrabajo<>nil) and FDirty and (MessageBox(Handle,'Descartar el item en edicion?','Editar linea',MB_YESNO)<>IDYES) then Exit;
  N:=GLineas.Row-1;LimpiarEditor;L:=TPedidoLinea(FPedido.Lineas[N]);FEditando:=N;
  FTrabajo:=TPedidoProducto.Create;FTrabajo.CopiarDe(L.Producto);FCargando:=True;
  try
    FProducto.Caption:='Editando: '+FTrabajo.CodigoTexto+' - '+FTrabajo.Descripcion;
    for I:=0 to High(FUnidades) do if FUnidades[I].Id=L.Unidad then CUnidad.ItemIndex:=I;
    ECantidad.Text:=FloatToStr(L.Cantidad);EOferta.Text:=FloatToStr(L.Oferta);ECosto.Text:=CurrToStr(L.CostoProveedor);
    if L.IncluyeItbis then CImpuesto.ItemIndex:=0 else CImpuesto.ItemIndex:=1;
    EDescuento.Text:=FloatToStr(L.Descuento);ELote.Text:=L.Lote;DVence.Checked:=L.Vence<>0;if L.Vence<>0 then DVence.Date:=L.Vence;
    RPorcentaje.Checked:=False;RPrecio.Checked:=True;
    EVenta.Text:=CurrToStr(FTrabajo.PrecioBase*L.Factor);EMinimo.Text:=CurrToStr(FTrabajo.MinimoBase*L.Factor);BAgregar.Caption:='Guardar cambios';
  finally FCargando:=False;end;FDirty:=False;ActualizarVista;if Visible and ECantidad.CanFocus then ECantidad.SetFocus;
end;
procedure TfrmRegPedidoProvNuevo.Quitar(Sender:TObject);
begin
  if (FPedido.NumeroGuardado>0) or (GLineas.Row>FPedido.Lineas.Count) then Exit;
  if (FPedido.Lineas.Count>0) and (MessageBox(Handle,'Quitar la linea seleccionada?','Pedido',MB_YESNO or MB_ICONQUESTION)=IDYES) then begin
    LimpiarEditor;FPedido.Lineas.Delete(GLineas.Row-1);RefrescarLineas;
  end;
end;
procedure TfrmRegPedidoProvNuevo.EstadoGuardado;
var I:Integer;
begin
  FEdicionHabilitada.Size:=ControlCount;
  for I:=0 to ControlCount-1 do begin
    FEdicionHabilitada[I]:=Controls[I].Enabled;
    if (Controls[I] is TEdit) or (Controls[I] is TComboBox) or
      (Controls[I] is TDateTimePicker) or (Controls[I] is TRadioButton) then Controls[I].Enabled:=False;
  end;
  BProcesar.Enabled:=False;BAgregar.Enabled:=False;BCancelar.Enabled:=False;BPrecios.Enabled:=False;BQuitar.Enabled:=False;
  BImprimir.Enabled:=True;BNuevo.Enabled:=True;
  FEstado.Caption:='Recepcion '+IntToStr(FPedido.NumeroGuardado)+' registrada. Inventario, precios y documento confirmados.';
  FError.Caption:='Puede abrir la vista previa. Un fallo de impresion no vuelve a registrar la recepcion.';
end;
procedure TfrmRegPedidoProvNuevo.Procesar(Sender:TObject);
var I,J:Integer;P:TPedidoProducto;L:TPedidoLinea;Resumen:string;Distinto:Boolean;
begin
  if FProcesando or (FPedido.NumeroGuardado>0) then Exit;
  if FPedido.ResultadoIncierto then begin
    try if FDatos.ComprobarGuardado(FPedido) then EstadoGuardado
      else begin BProcesar.Caption:='Procesar pedido';Fallo('Se comprobo que no existe la recepcion tentativa. Revise y pulse Procesar para reintentar.');end;
    except on E:Exception do Fallo('No fue posible comprobar: '+E.Message);end;Exit;
  end;
  try
    if FTrabajo<>nil then raise Exception.Create('Agregue o cancele primero el producto en edicion.');
    if CProveedor.ItemIndex<0 then begin if Visible and CProveedor.CanFocus then CProveedor.SetFocus;raise Exception.Create('Seleccione el proveedor.');end;
    FPedido.Proveedor:=Integer(CProveedor.Items.Objects[CProveedor.ItemIndex]);FPedido.NombreProveedor:=CProveedor.Text;
    FPedido.Factura:=StrToIntDef(Trim(EFactura.Text),0);FPedido.Fecha:=Trunc(DFecha.Date);FPedido.VencimientoPago:=Trunc(DPago.Date);
    FPedido.NCF:=Trim(ENcf.Text);FPedido.Rnc:=Trim(ERnc.Text);FPedido.FormaPago:=1;if CPago.ItemIndex=1 then FPedido.FormaPago:=7;
    FPedido.TotalProveedor:=PedidoDinero(LeerNumero(ETotalProveedor,'el total de la factura del proveedor'));
    FPedido.Validar;
    Resumen:='Proveedor: '+FPedido.NombreProveedor+' | Factura: '+IntToStr(FPedido.Factura)+#13#10+
      'Registrar '+IntToStr(FPedido.Lineas.Count)+' linea(s) por RD$ '+FormatFloat('#,##0.00',FPedido.Total)+'?'+#13#10+
      'Se actualizaran inventario, costos y los precios revisados.';
    for I:=0 to FPedido.Productos.Count-1 do begin
      P:=TPedidoProducto(FPedido.Productos[I]);Distinto:=False;
      for J:=0 to FPedido.Lineas.Count-1 do begin L:=TPedidoLinea(FPedido.Lineas[J]);
        if (L.Producto=P) and (Abs(L.CostoBase-P.CostoNuevo)>0.005) then Distinto:=True;end;
      if Distinto then Resumen:=Resumen+#13#10+P.CodigoTexto+': hay costos distintos por linea. Costo final inventario / unidad: '+CurrToStr(P.CostoNuevo)+'.';
    end;
    if MessageBox(Handle,PChar(Resumen),'Confirmar recepcion',MB_YESNO or MB_ICONQUESTION or MB_DEFBUTTON2)<>IDYES then Exit;
    FProcesando:=True;BProcesar.Enabled:=False;BNuevo.Enabled:=False;Screen.Cursor:=crHourGlass;
    try FDatos.Guardar(FPedido);EstadoGuardado;
    finally FProcesando:=False;Screen.Cursor:=crDefault;if FPedido.NumeroGuardado=0 then BProcesar.Enabled:=True;BNuevo.Enabled:=True;end;
  except on E:Exception do begin
    if FPedido.NumeroGuardado>0 then begin
      BProcesar.Enabled:=False;BImprimir.Enabled:=True;
      Fallo('La recepcion '+IntToStr(FPedido.NumeroGuardado)+' esta guardada. No vuelva a procesar. Revision de pantalla pendiente: '+E.Message);
    end
    else if FPedido.ResultadoIncierto then begin BProcesar.Caption:='Comprobar recepcion';Fallo('Resultado por comprobar. Referencia '+IntToStr(FPedido.NumeroTentativo)+'. '+E.Message);end
    else Fallo('No se registro la recepcion. El borrador se conserva. '+E.Message);
  end;end;
end;
procedure TfrmRegPedidoProvNuevo.NuevaRecepcion(Sender:TObject);
var P:TPedidoRecepcion;I:Integer;EstabaGuardado:Boolean;
begin
  if FPedido.ResultadoIncierto then begin Fallo('Compruebe primero la recepcion pendiente.');Exit;end;
  if (FPedido.Lineas.Count>0) and (FPedido.NumeroGuardado=0) and (MessageBox(Handle,'Descartar el pedido sin guardar?','Nueva recepcion',MB_YESNO or MB_DEFBUTTON2)<>IDYES) then Exit;
  EstabaGuardado:=FPedido.NumeroGuardado>0;
  P:=TPedidoRecepcion.Create;P.Empresa:=FPedido.Empresa;P.Almacen:=FPedido.Almacen;P.Usuario:=FPedido.Usuario;
  P.NombreUsuario:=FPedido.NombreUsuario;P.NombreEmpresa:=FPedido.NombreEmpresa;P.NombreAlmacen:=FPedido.NombreAlmacen;P.RequiereLote:=FPedido.RequiereLote;
  FPedido.Free;FPedido:=P;LimpiarEditor;
  if EstabaGuardado then for I:=0 to ControlCount-1 do
    if (Controls[I] is TEdit) or (Controls[I] is TComboBox) or (Controls[I] is TDateTimePicker) or (Controls[I] is TRadioButton) then Controls[I].Enabled:=FEdicionHabilitada[I];
  EFactura.Text:='';ETotalProveedor.Text:='';ENcf.Text:='';CProveedor.ItemIndex:=-1;ERnc.Text:='';CPago.ItemIndex:=0;BProcesar.Enabled:=True;
  BAgregar.Enabled:=True;BCancelar.Enabled:=True;BPrecios.Enabled:=True;BQuitar.Enabled:=True;BImprimir.Enabled:=False;
  BProcesar.Caption:='Procesar pedido';FEstado.Caption:=P.NombreEmpresa+' | '+P.NombreAlmacen+' | Borrador en memoria';RefrescarLineas;FError.Caption:='';
  FDirty:=False;
end;
procedure TfrmRegPedidoProvNuevo.AplicarPermisosCaptura;
begin CImpuesto.Enabled:=ECosto.Enabled;end;
procedure TfrmRegPedidoProvNuevo.Imprimir(Sender:TObject);
begin
  if FPedido.NumeroGuardado<=0 then Exit;
  try VistaPreviaRecepcionPedido(FPedido);except on E:Exception do Fallo('Recepcion guardada. No vuelva a procesar. Impresion pendiente: '+E.Message);end;
end;
procedure TfrmRegPedidoProvNuevo.Fallo(const S:string);
begin FError.Caption:=S;FError.Hint:=S;FError.ShowHint:=True;
  if Assigned(OnAviso) then OnAviso(S) else MessageBox(Handle,PChar(S),'Registro de pedidos',MB_OK or MB_ICONWARNING);end;
procedure TfrmRegPedidoProvNuevo.CerrarConsulta(Sender:TObject;var CanClose:Boolean);
begin
  CanClose:=not FProcesando;
  if CanClose and FPedido.ResultadoIncierto then
    CanClose:=MessageBox(Handle,PChar('Hay una recepcion por comprobar: '+IntToStr(FPedido.NumeroTentativo)+'. Conserve esta referencia. Cerrar?'),'Resultado pendiente',MB_YESNO or MB_DEFBUTTON2)=IDYES
  else if CanClose and (FPedido.NumeroGuardado=0) and ((FPedido.Lineas.Count>0) or FDirty) then
    CanClose:=MessageBox(Handle,'Cerrar y descartar el pedido sin guardar?','Registro de pedidos',MB_YESNO or MB_DEFBUTTON2)=IDYES;
end;
end.
