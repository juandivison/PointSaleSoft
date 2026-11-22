unit UPedidoPreciosBorrador;
interface
uses Forms,UPedidoRecepcionModelo,UPedidoRecepcionDatos;
// Puede recibir una instancia CreateNew de TfrmPrecioUnidadNivel: no usa sus datasets legacy.
function EditarPreciosPedido(Formulario:TForm;const Producto:string;CostoBase:Currency;
  Modo:TPedidoModoPrecio;var Perfiles:TPedidoPresentaciones;
  const Unidades:TPedidoUnidades):Boolean;
implementation
uses Windows,SysUtils,Classes,Controls,StdCtrls,Grids,Graphics,ExtCtrls,Dialogs;
type
  TEditorPedido=class
  private
    F:TForm;C:Currency;Modo:TPedidoModoPrecio;Datos:TPedidoPresentaciones;Unidades:TPedidoUnidades;
    Combo,Nueva:TComboBox;Grid:TStringGrid;Costo,Ayuda:TLabel;Anterior:Integer;Cargando:Boolean;
    procedure Cargar;
    procedure GuardarGrid;
    procedure Cambiar(Sender:TObject);
    procedure Editar(Sender:TObject;ACol,ARow:Longint;const Value:string);
    procedure Seleccionar(Sender:TObject;ACol,ARow:Longint;var CanSelect:Boolean);
    procedure Agregar(Sender:TObject);
    procedure Aceptar(Sender:TObject);
    procedure Construir(const Nombre:string);
  end;
function Numero(const S:string):Double;
begin
  if Trim(S)='' then Result:=0 else
    if not TryStrToFloat(Trim(S),Result) then raise Exception.Create('Numero invalido: '+S+'. No incluya separadores de miles.');
end;
procedure TEditorPedido.Cargar;
var J,N:Integer;
begin
  Cargando:=True;
  try
    N:=Combo.ItemIndex;if (N<0) or (N>High(Datos)) then Exit;
    Anterior:=N;Costo.Caption:='Costo con ITBIS por '+Datos[N].Descripcion+': '+FormatFloat('#,##0.00',C*Datos[N].Factor)+
      '   |   Equivalencia: '+FloatToStr(Datos[N].Factor)+' unidad(es)';
    for J:=1 to Grid.RowCount-1 do begin
      if Modo=ppSimple then begin if J=1 then Grid.Cells[0,J]:='Venta' else Grid.Cells[0,J]:='Minimo';end
      else Grid.Cells[0,J]:='Precio '+IntToStr(J);
      Grid.Cells[1,J]:=FormatFloat('0.00',Datos[N].Anteriores[J]);
      Grid.Cells[2,J]:=FormatFloat('0.00',Datos[N].Porcientos[J]);
      Grid.Cells[3,J]:=FormatFloat('0.00',Datos[N].Precios[J]);
    end;
  finally Cargando:=False;end;
end;
procedure TEditorPedido.GuardarGrid;
var J:Integer;
begin
  if (Anterior<0) or (Anterior>High(Datos)) then Exit;
  for J:=1 to Grid.RowCount-1 do begin
    Datos[Anterior].Precios[J]:=PedidoDinero(Numero(Grid.Cells[3,J]));
    Numero(Grid.Cells[2,J]); // Validar el texto, conservando porcentajes previos no editados.
  end;
end;
procedure TEditorPedido.Cambiar(Sender:TObject);
var Nuevo:Integer;
begin
  if Cargando then Exit;
  Nuevo:=Combo.ItemIndex;
  try GuardarGrid;except Combo.ItemIndex:=Anterior;raise;end;
  Combo.ItemIndex:=Nuevo;Cargar;
end;
procedure TEditorPedido.Editar(Sender:TObject;ACol,ARow:Longint;const Value:string);
var V:Double;Base:Currency;
begin
  if Cargando or (ARow<=0) or (Anterior<0) then Exit;
  if (Trim(Value)='') or not TryStrToFloat(Value,V) then Exit;
  Base:=PedidoDinero(C*Datos[Anterior].Factor);if Base<=0 then Exit;
  Cargando:=True;
  try
    if ACol=2 then begin
      Datos[Anterior].Porcientos[ARow]:=V;
      Grid.Cells[3,ARow]:=FormatFloat('0.00',PedidoDinero(Base*(1+V/100)));
    end
    else if ACol=3 then begin
      if V>0 then Datos[Anterior].Porcientos[ARow]:=(V/Base-1)*100
      else Datos[Anterior].Porcientos[ARow]:=0;
      Grid.Cells[2,ARow]:=FormatFloat('0.00',Datos[Anterior].Porcientos[ARow]);
    end;
  finally Cargando:=False;end;
end;
procedure TEditorPedido.Seleccionar(Sender:TObject;ACol,ARow:Longint;var CanSelect:Boolean);
begin CanSelect:=(ACol>1) and (ARow>0);end;
procedure TEditorPedido.Agregar(Sender:TObject);
var I,N:Integer;
begin
  if Nueva.ItemIndex<0 then Exit;
  GuardarGrid;I:=Nueva.ItemIndex;
  for N:=0 to High(Datos) do if Datos[N].Unidad=Unidades[I].Id then begin Combo.ItemIndex:=N;Cargar;Exit;end;
  N:=Length(Datos);SetLength(Datos,N+1);Datos[N].Unidad:=Unidades[I].Id;
  Datos[N].Descripcion:=Unidades[I].Descripcion;Datos[N].Factor:=Unidades[I].Factor;
  Combo.Items.Add(Datos[N].Descripcion);Combo.ItemIndex:=N;Cargar;Grid.SetFocus;
end;
procedure TEditorPedido.Aceptar(Sender:TObject);
begin
  try
    GuardarGrid;ValidarPreciosPedido(C,Modo,Datos);F.ModalResult:=mrOk;
  except on E:Exception do MessageBox(F.Handle,PChar(E.Message),'Revisar precios',MB_OK or MB_ICONWARNING);end;
end;
procedure TEditorPedido.Construir(const Nombre:string);
var L:TLabel;B:TButton;I:Integer;
  function Etiqueta(const Texto:string;X,Y:Integer):TLabel;
  begin Result:=TLabel.Create(F);Result.Parent:=F;Result.SetBounds(X,Y,650,20);Result.Caption:=Texto;end;
begin
  F.Caption:='Revisar precios - '+Nombre;F.Position:=poScreenCenter;F.BorderStyle:=bsDialog;
  F.ClientWidth:=700;F.ClientHeight:=416;F.Font.Name:='Segoe UI';F.Font.Size:=9;F.Color:=clWhite;
  L:=Etiqueta(Nombre,20,16);L.Font.Size:=12;L.Font.Style:=[fsBold];
  Etiqueta('Presentacion de venta',20,55);
  Combo:=TComboBox.Create(F);Combo.Parent:=F;Combo.SetBounds(20,77,295,24);Combo.Style:=csDropDownList;
  for I:=0 to High(Datos) do Combo.Items.Add(Datos[I].Descripcion);Combo.ItemIndex:=0;Combo.OnChange:=Cambiar;
  Costo:=Etiqueta('',20,114);
  Grid:=TStringGrid.Create(F);Grid.Parent:=F;Grid.SetBounds(20,145,660,154);Grid.ColCount:=4;
  if Modo=ppSimple then Grid.RowCount:=3 else Grid.RowCount:=5;
  Grid.FixedRows:=1;Grid.FixedCols:=2;Grid.DefaultRowHeight:=26;
  Grid.ColWidths[0]:=95;Grid.ColWidths[1]:=155;Grid.ColWidths[2]:=170;Grid.ColWidths[3]:=215;
  Grid.Cells[0,0]:='Nivel';Grid.Cells[1,0]:='Precio anterior';Grid.Cells[2,0]:='% utilidad sobre costo';Grid.Cells[3,0]:='Propuesto con ITBIS';
  Grid.Options:=Grid.Options+[goEditing,goTabs];Grid.OnSetEditText:=Editar;Grid.OnSelectCell:=Seleccionar;
  Ayuda:=Etiqueta('Edite porcentaje o precio. Niveles 2-4 en cero: no utilizados.',20,311);
  if Modo=ppSimple then Ayuda.Caption:='Costo < minimo <= venta. Los importes ya incluyen ITBIS.';
  Nueva:=TComboBox.Create(F);Nueva.Parent:=F;Nueva.SetBounds(335,77,230,24);Nueva.Style:=csDropDownList;
  for I:=0 to High(Unidades) do Nueva.Items.Add(Unidades[I].Descripcion);if Nueva.Items.Count>0 then Nueva.ItemIndex:=0;
  Nueva.Visible:=Modo=ppPresentaciones;
  B:=TButton.Create(F);B.Parent:=F;B.SetBounds(572,76,108,26);B.Caption:='Agregar';B.OnClick:=Agregar;B.Visible:=Nueva.Visible;
  Etiqueta('Los cambios quedan en el borrador hasta Procesar el pedido.',20,342);
  B:=TButton.Create(F);B.Parent:=F;B.SetBounds(445,372,110,29);B.Caption:='Cancelar';B.Cancel:=True;B.ModalResult:=mrCancel;
  B:=TButton.Create(F);B.Parent:=F;B.SetBounds(565,372,115,29);B.Caption:='Confirmar precios';B.Default:=True;B.OnClick:=Aceptar;
  Anterior:=-1;Cargar;
end;
function EditarPreciosPedido(Formulario:TForm;const Producto:string;CostoBase:Currency;
  Modo:TPedidoModoPrecio;var Perfiles:TPedidoPresentaciones;const Unidades:TPedidoUnidades):Boolean;
var E:TEditorPedido;
begin
  if CostoBase<=0 then raise Exception.Create('Indique el costo antes de revisar precios.');
  E:=TEditorPedido.Create;
  try
    E.F:=Formulario;E.C:=CostoBase;E.Modo:=Modo;E.Datos:=Copy(Perfiles,0,Length(Perfiles));E.Unidades:=Unidades;
    E.Construir(Producto);Result:=Formulario.ShowModal=mrOk;
    if Result then Perfiles:=Copy(E.Datos,0,Length(E.Datos));
  finally E.Free;end;
end;
end.
