unit UFormDespachoAlmacen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UProcVentaRapida, IBCustomDataSet, IBStoredProc, Menus,
  WinSkinData, IBQuery, DB, RxMemDS, RxLookup, StdCtrls, EditNew, Grids,
  DBGrids, RXDBCtrl, Mask, DBCtrls, Buttons, ExtCtrls, RXCtrls;

type
  TfrmDespachoAlmacen = class(TfrmProcVentaRapida)
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
      procedure ProcesarSumaTotal;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDespachoAlmacen: TfrmDespachoAlmacen;

implementation

{$R *.dfm}

procedure TfrmDespachoAlmacen.BitBtn4Click(Sender: TObject);
begin
  //inherited;

end;

procedure TfrmDespachoAlmacen.BitBtn7Click(Sender: TObject);
begin
  //inherited;

end;

procedure TfrmDespachoAlmacen.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var
    xxxx : word; item : String;
begin
  //inherited;
  //113-F2 f4-115   f5-116     f3-114
  xxxx:= key;
  //if (key = 123) then //F12
  //begin
  //  NoGenerarNCF1Click(Self);
  //end;
  if (key = 120) then
  BitBtn5Click(self);

  if (key = 27) then
  begin
    if MessageDlg('Cerrar ventana?', mtInformation, [mbYes,mbNo], 0) = mryes then
    Close;
  end;
  if (key = 121) then //F
  LectorCodBarra1Click(Self);
  //lectorcodbarra1.Checked:= not lectorcodbarra1.Checked;

  if (key = 118) then //F7
  BuscarCliente1Click(Self)
  else if (key = 117) then
  CheckBox1.checked:= Not CheckBox1.checked;
  if (key = 113) then
  begin
    edtCodigo.SetFocus;
    Exit;
  end;
  if (key = 115) then
  BitBtn3Click(Self) else
  if (key = 113) then BitBtn1Click(Self)
  else if (key = 114) then BitBtn2Click(Self)
  else if (key = 116) then
  if (Edit1.Text <> '') then
  BitBtn4Click(Self)
  else if (key = 119) then //F9
  begin
    if rxVenta.State = dsBrowse then
    begin
      item:=InputBox('Borrar un item','Entre número item a eliminar','');
      if rxVenta.Locate('Serie',strToInt(item),[]) then
      rxVenta.Delete;
      ProcesarSumaTotal;
  end;
  end;
end;

procedure TfrmDespachoAlmacen.ProcesarSumaTotal;
var
  monto:Extended;
  itbis, descuento, neto: Extended;
  puerto, linea1, linea2 : String;
begin
  if rxVenta.state <> dsBrowse then Exit;
  rxVenta.DisableControls;
  rxVenta.First;
  Monto:=0; Itbis:=0; Descuento:=0; Neto:=0;
  //rxVenta.Edit;
  //rxVentaMontoItbisEnPrecio.Value:=0;
  //rxVenta.Post;
  While Not rxVenta.Eof do
  begin
    Monto := Monto + rxVentaMontoBruto.Value;
    Itbis := itbis + rxVentaItbi.Value;
    Descuento:= descuento + rxVentaMontoDescuento.Value;
    Neto     := Neto + rxVentaMontoNeto.Value;
    rxVenta.Next;
  end;
  //EditN1.Text:=InsertarComa(FloatToStr(Monto));

  //EdtMontoDesc.Text := InsertarComa(FloatToStr(Descuento));
  //edtTotalNeto.Text := InsertarComa(FloatToStr(Neto));
  //edtItbis.Text     := InsertarComa(FloatToStr(Itbis));

  Totales.Edit;
  TotalesSubTotal.Value     := Monto;
  Totalesitbis.Value        := Itbis;
  Totalesmontodesc.Value    := Descuento;
  {if not EsFactura or not EsFinanciamiento then
    if (Totalesmontorecibido.Value < Neto) then
  begin
    MessageDlg('Monto recibido no puede ser menor que Neto, verifique',mtInformation, [mbOK], 0);
  end;}
  if EsFactura or EsFinanciamiento then
  begin
    if (Totalesmontorecibido.Value < Neto) then
    Totalestotalneto.Value := Neto - Totalesmontorecibido.Value +
    TotalesMontoInteres.Value
    else Totalestotalneto.Value := Totalesmontorecibido.Value - Neto  +
    TotalesMontoInteres.Value;
  end else Totalestotalneto.Value := Neto;

  Totales.Post;

  if chkDisplay.Checked then
  begin
    puerto:='1';
    linea1:= '*** Total  Venta ***';
    linea2:=Format('%8.2f',[Totalestotalneto.Value]);
    WinExec(PChar('_display "'+puerto +'" "'+ linea1 +
    '" "'+ linea2 +'"'),SW_HIDE);
  end;
  rxVenta.EnableControls;
end;

end.
