unit UDetalleFormaDePago;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RxDBComb, Mask, DBCtrls, ExtCtrls, DB, Buttons,
  RXCtrls, RXDBCtrl, WinSkinData, RxLookup;

type
  TfrmAceptaDetalleFormaPago = class(TForm)
    dstblDetallePagoConTarjeta: TDataSource;
    Panel1: TPanel;
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
    Label8: TLabel;
    Label9: TLabel;
    DBEdit2: TDBEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBStatusLabel1: TDBStatusLabel;
    SkinData1: TSkinData;
    RxDBLookupCombo1: TRxDBLookupCombo;
    RxDBLookupCombo2: TRxDBLookupCombo;
    RxDBLookupCombo3: TRxDBLookupCombo;
    procedure FormCreate(Sender: TObject);
    procedure RxDBLookupCombo1Click(Sender: TObject);
    procedure DBEdit9Enter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    fpago : integer;
    montoPgdo : Extended;
  end;

var
  frmAceptaDetalleFormaPago: TfrmAceptaDetalleFormaPago;

implementation

uses UDatModPagoTarjeta, uglobal,
  UDatModIngresos, UCobrarFacturas;

{$R *.dfm}

procedure TfrmAceptaDetalleFormaPago.FormCreate(Sender: TObject);
begin
  montoPgdo:=0;
  if frmCobrarFacturas.rxFormaPago.State = dsInsert then
  begin

  end;
  dmIngresos.tblFormaPago.Close;
  dmIngresos.tblFormaPago.Open;
  dmPagosTarjeta.tbltipotarjeta.Close;
  dmPagosTarjeta.tbltipotarjeta.Open;
  dmPagosTarjeta.tblProvCobroTarjeta.Close;
  dmPagosTarjeta.tblProvCobroTarjeta.Open;
end;

procedure TfrmAceptaDetalleFormaPago.RxDBLookupCombo1Click(
  Sender: TObject);
begin
  if frmCobrarFacturas.rxFormaPagoformaPago.Value = 2 then
  Panel1.Enabled := True else Panel1.Enabled := False;
end;

procedure TfrmAceptaDetalleFormaPago.DBEdit9Enter(Sender: TObject);
begin
  if (montoPgdo > 0) and (frmCobrarFacturas.rxFormaPago.State in [dsEdit, dsInsert]) then
  frmCobrarFacturas.rxFormaPagoMONTOAUTORIZADO.Value:=montoPgdo;
end;

end.
