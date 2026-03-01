unit UFormDistribuirPgoVenta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RXCtrls, StdCtrls, Mask, DBCtrls, WinSkinData, DB, Buttons,
  RxLookup, RxMemDS, Grids, DBGrids, RXDBCtrl, ExtCtrls;

type
  TfrmDistribuirPgoVenta = class(TForm)
    dstblDetallePagoConTarjeta: TDataSource;
    SkinData1: TSkinData;
    Label3: TLabel;
    Label10: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit1: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit3: TDBEdit;
    RxLabel1: TRxLabel;
    RxDBGrid1: TRxDBGrid;
    dsrxFormaPago: TDataSource;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton1: TSpeedButton;
    RxLabel2: TRxLabel;
    RxLabel3: TRxLabel;
    DBText1: TDBText;
    RxLabel4: TRxLabel;
    RxLabel5: TRxLabel;
    RxLabel6: TRxLabel;
    DBText2: TDBText;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBEdit2: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    RxLabel7: TRxLabel;
    DBEdit6: TDBEdit;
    Label2: TLabel;
    DBStatusLabel1: TDBStatusLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    RxDBLookupCombo2: TRxDBLookupCombo;
    BitBtn3: TBitBtn;
    RxLabel8: TRxLabel;
    DBEdit10: TDBEdit;
    DBText3: TDBText;
    Label8: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClick(Sender: TObject);
    procedure DBEdit10Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBEdit10Exit(Sender: TObject);
  private
    { Private declarations }
    Procedure SumarIngEnCheque;
    Procedure SumaIngresoBonos;
    procedure SumaIngresoEnTarjeta;

  public
    { Public declarations }
    Function GetMontoNotaCreditoPendiente(_moneda:string; codCte:Integer):Currency;
  end;

var
  frmDistribuirPgoVenta: TfrmDistribuirPgoVenta;

implementation
uses UDatModPagoTarjeta, UDatModCxc, uglobal,
  UProcVentaRapida, UDatModIngresos, UCobrarFacturas, UFormIngChequesDet, UFormIngDetBonos,
  UDatmodDatosGenerales;

{$R *.dfm}

procedure TfrmDistribuirPgoVenta.SpeedButton1Click(Sender: TObject);
begin
  if dmcxc.rxIngresoEnTarjeta.State in [dsInsert, dsEdit] then
  begin
    dmcxc.rxIngresoEnTarjeta.Post;
  end;
  SumaIngresoEnTarjeta;
  Refresh;
end;

procedure TfrmDistribuirPgoVenta.SpeedButton2Click(Sender: TObject);
begin
  if dmcxc.rxIngresoEnTarjeta.State = dsBrowse then
  begin
   dmcxc.rxIngresoEnTarjeta.Append;
  end;
end;

procedure TfrmDistribuirPgoVenta.SpeedButton3Click(Sender: TObject);
begin
  if dmcxc.rxIngresoEnTarjeta.State in [dsinsert, dsEdit] then
  begin
    dmcxc.rxIngresoEnTarjeta.Cancel;
  end;
end;

procedure TfrmDistribuirPgoVenta.SpeedButton7Click(Sender: TObject);
begin
  if dmcxc.rxIngresoEnTarjeta.State in [dsBrowse] then
  begin
    dmcxc.rxIngresoEnTarjeta.First;
  end;
  refresh;
end;

procedure TfrmDistribuirPgoVenta.SpeedButton8Click(Sender: TObject);
begin
  if MessageDlg('Desea eliminar record?', mtWarning,[mbyes,mbno],0)=mryes then
  begin
    dmcxc.rxIngresoEnTarjeta.Delete;
  end;
end;

procedure TfrmDistribuirPgoVenta.BitBtn1Click(Sender: TObject);
begin
  frmDatosIngCheque:=TfrmDatosIngCheque.Create(nil);
  try
    if dmcxc.rxIngChequeDet.State = dsInactive then
    begin
      dmcxc.rxIngChequeDet.Close;
      dmcxc.rxIngChequeDet.Open;
    end else
    if dmcxc.rxIngChequeDet.RecordCount = 0 then
       dmcxc.rxIngChequeDet.Insert;
    frmDatosIngCheque.Showmodal;
    if dmcxc.rxIngChequeDet.state in [dsEdit, dsInsert] then
       dmcxc.rxIngChequeDet.Post;
  finally
  frmDatosIngCheque.Free;
  frmDatosIngCheque:=Nil;
  end;
  SumarIngEnCheque;
  refresh;
end;

procedure TfrmDistribuirPgoVenta.BitBtn2Click(Sender: TObject);
begin
  frmDetallesIngEnBonos:=TfrmDetallesIngEnBonos.Create(nil);
  try
    if dmcxc.rxIngresoEnBonos.State = dsInactive then
    begin
      dmcxc.rxIngresoEnBonos.Close;
      dmcxc.rxIngresoEnBonos.Open;
    end else
    if dmcxc.rxIngresoEnBonos.RecordCount = 0 then
       dmcxc.rxIngresoEnBonos.Insert;
       
    frmDetallesIngEnBonos.Showmodal;
    if dmcxc.rxIngresoEnBonos.State In [dsEdit, dsInsert] then
       dmcxc.rxIngresoEnBonos.Post;
  finally
  frmDetallesIngEnBonos.Free;
  frmDetallesIngEnBonos:=Nil;
  end;
  SumaIngresoBonos;
  Refresh;
end;

procedure TfrmDistribuirPgoVenta.FormCreate(Sender: TObject);
begin
  dmPagosTarjeta.tblProvCobroTarjeta.Close;
  dmPagosTarjeta.tblProvCobroTarjeta.Open;
  dmPagosTarjeta.tbltipotarjeta.Close;
  dmPagosTarjeta.tbltipotarjeta.Open;
  if dmIngresos.tblFormaPago.State = dsInactive then
  begin
    dmIngresos.tblFormaPago.Close;
    dmIngresos.tblFormaPago.Open;
  end else
  if dmIngresos.tblFormaPago.RecordCount = 0 then
  begin
    dmIngresos.tblFormaPago.Insert;
    dmIngresos.tblFormaPagoORIGEN.Value := 2;
  end;
  refresh;
end;

procedure TfrmDistribuirPgoVenta.SumarIngEnCheque;
var
  suma : Currency;
begin
  suma:=0;
  dmcxc.rxIngChequeDet.First;
  While Not dmcxc.rxIngChequeDet.Eof Do
  begin
    if not dmcxc.rxIngChequeDetMonto_Cheque.IsNull then
    suma:= suma + dmcxc.rxIngChequeDetMonto_Cheque.Value;
    dmcxc.rxIngChequeDet.Next;
  end;
  frmProcVentaRapida.Totales.Edit;
  frmProcVentaRapida.TotalesMontoEnCheque.Value:=suma;
  frmProcVentaRapida.Totales.Post;
end;

procedure TfrmDistribuirPgoVenta.SumaIngresoBonos;
var
  suma : Currency;
begin
  suma:=0;
  dmcxc.rxIngresoEnBonos.First;
  While Not dmcxc.rxIngresoEnBonos.Eof Do
  begin
    if not dmcxc.rxIngresoEnBonosMonto.IsNull then
    suma:= suma + dmcxc.rxIngresoEnBonosMonto.Value;
    dmcxc.rxIngresoEnBonos.Next;
  end;
  frmProcVentaRapida.Totales.Edit;
  frmProcVentaRapida.TotalesMontoEnBonos.Value:=suma;
  frmProcVentaRapida.Totales.Post;
end;

procedure TfrmDistribuirPgoVenta.SumaIngresoEnTarjeta;
var
  suma : Currency;
begin
  suma:=0;
  dmcxc.rxIngresoEnTarjeta.First;
  While Not dmcxc.rxIngresoEnTarjeta.Eof Do
  begin
    if not dmcxc.rxIngresoEnTarjetaMONTOAUTORIZADO.IsNull then
    suma:= suma + dmcxc.rxIngresoEnTarjetaMONTOAUTORIZADO.Value;
    dmcxc.rxIngresoEnTarjeta.Next;
  end;
  frmProcVentaRapida.Totales.Edit;
  frmProcVentaRapida.TotalesMontoEnTarjeta.Value:=suma;
  frmProcVentaRapida.Totales.Post;
end;

procedure TfrmDistribuirPgoVenta.FormShow(Sender: TObject);
begin
  refresh;
end;

procedure TfrmDistribuirPgoVenta.FormActivate(Sender: TObject);
begin
  refresh;
end;

procedure TfrmDistribuirPgoVenta.FormClick(Sender: TObject);
begin
  Refresh;
end;

function TfrmDistribuirPgoVenta.GetMontoNotaCreditoPendiente(_moneda:string; codCte:Integer):Currency;
var
  montoNCR : Currency;
begin
  montoNCR:=0;
  dmDatos.tblDevolucionAbierta.Close;
  dmDatos.tblDevolucionAbierta.Params[0].Value := _moneda;
  dmDatos.tblDevolucionAbierta.Params[1].Value := codCte;
  dmDatos.tblDevolucionAbierta.Open;
  dmDatos.tblDevolucionAbierta.Filtered:=False;
  dmDatos.tblDevolucionAbierta.First;
  While Not dmDatos.tblDevolucionAbierta.Eof do
  begin
    montoNCR:= montoNCR + dmDatos.tblDevolucionAbiertaMONTO_PENDIENTE.Value;
    dmDatos.tblDevolucionAbierta.Next;
  end;
  result:=montoNCR;
  Label11.Caption:= InsertarComa(FloatToStr(montoNCR));
    refresh;
end;

procedure TfrmDistribuirPgoVenta.DBEdit10Change(Sender: TObject);
begin
  frmProcVentaRapida.Totales.Edit;
  frmProcVentaRapida.TotalesMontoNotaCredito.Value:=
  GetMontoNotaCreditoPendiente(frmProcVentaRapida.TotalesMoneda.Value,
  frmProcVentaRapida.tablaPropietarioCodigoPropietario.Value) -
  frmProcVentaRapida.TotalesMontoNCRAplicado.Value;
  Refresh;
end;

procedure TfrmDistribuirPgoVenta.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if frmProcVentaRapida.Totales.State in [dsEdit, dsInsert] then
  frmProcVentaRapida.Totales.Post;
end;

procedure TfrmDistribuirPgoVenta.DBEdit10Exit(Sender: TObject);
begin
  if frmProcVentaRapida.Totales.State in [dsEdit, dsInsert] then
  frmProcVentaRapida.Totales.Post;
end;

end.
