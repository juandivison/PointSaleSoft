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
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit1: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit3: TDBEdit;
    DBLookupComboBox2: TDBLookupComboBox;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit2: TDBEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBStatusLabel1: TDBStatusLabel;
    SkinData1: TSkinData;
    RxDBLookupCombo1: TRxDBLookupCombo;
    procedure FormCreate(Sender: TObject);
    procedure RxDBLookupCombo1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAceptaDetalleFormaPago: TfrmAceptaDetalleFormaPago;

implementation

uses UDatModPagoTarjeta, uglobal, URecibosYCtaXCobrar,
  UDatModIngresos;

{$R *.dfm}

procedure TfrmAceptaDetalleFormaPago.FormCreate(Sender: TObject);
begin
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
  if FrmRecibosYCtaXCobrar.rxFormaPagoformaPago.Value = 2 then
  Panel1.Enabled := True else Panel1.Enabled := False;
end;

end.
