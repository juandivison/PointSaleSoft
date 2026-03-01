unit UFormUpdateMontopagado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, RxCtrls, StdCtrls, Mask, DBCtrls,
  WinSkinData, Buttons, RxDBCtrl;

type
  TfrmUpdateMontopago = class(TForm)
    tblVentasMast: TIBDataSet;
    tblVentasMastNUMERO: TIntegerField;
    tblVentasMastFECHA: TDateTimeField;
    tblVentasMastCIA_KEY: TIntegerField;
    tblVentasMastCODIGO_CTE: TIntegerField;
    tblVentasMastCODIGO_VENDEDOR: TIntegerField;
    tblVentasMastFORMA_PAGO: TSmallintField;
    tblVentasMastOBSERVACION: TIBStringField;
    tblVentasMastMONEDA: TIBStringField;
    tblVentasMastVALOR_TOTAL_DET: TFloatField;
    tblVentasMastSTATUS: TIBStringField;
    tblVentasMastFECHA_IN: TDateTimeField;
    tblVentasMastIN_POR: TIBStringField;
    tblVentasMastFECHA_MOD: TDateTimeField;
    tblVentasMastMOD_POR: TIBStringField;
    tblVentasMastNUMERO_FACTURA: TIntegerField;
    tblVentasMastNUMERO_DOC_PAGO: TIBStringField;
    tblVentasMastSERIE_NCF_ASIGNADO: TIntegerField;
    tblVentasMastMONTO_BRUTO: TFloatField;
    tblVentasMastPORC_DESCUENTO: TIntegerField;
    tblVentasMastMONTO_DESCUENTO: TFloatField;
    tblVentasMastMONTO_INICIAL: TFloatField;
    tblVentasMastNOMBRE_CLIENTE_GENERAL: TIBStringField;
    tblVentasMastMONTO_PAGADO: TFloatField;
    tblVentasMastMONTO_CAMBIO: TFloatField;
    tblVentasMastMONTO_TOTAL_ITBIS: TFloatField;
    tblVentasMastMONTODESCGASTOSADMIN: TFloatField;
    tblVentasMastMONTODESCITBISGASTOSADMIN: TFloatField;
    tblVentasMastMONTODESCTRANSP: TFloatField;
    tblVentasMastMONTODESCDIRTECNICA: TFloatField;
    tblVentasMastMONTODESCITBISDIRTECNICA: TFloatField;
    tblVentasMastMONTODESCIMPREVISTO: TFloatField;
    tblVentasMastMONTODESCITBISIMPREVISTO: TFloatField;
    tblVentasMastDESC_MONTO_COMBUSTIBLE: TFloatField;
    tblVentasMastDESC_MONTO_PRESTAMO: TFloatField;
    tblVentasMastDESC_MONTO_SINDICATO: TFloatField;
    tblVentasMastDESC_IMP_SOBRE_RENTA: TFloatField;
    tblVentasMastDESC_OTROS: TFloatField;
    tblVentasMastPORC_DESC_SINDICATO: TIBBCDField;
    tblVentasMastPORC_DESC_IMP_SOBRE_RENTA: TIBBCDField;
    tblVentasMastDESC_RUTA: TFloatField;
    tblVentasMastOTROS_DESCUENTOS_2: TFloatField;
    tblVentasMastOTROS_DESCUENTOS_3: TFloatField;
    tblVentasMastMONTO_DESC_CHOFER: TFloatField;
    tblVentasMastTIPO_VENTA: TSmallintField;
    tblVentasMastCOMENTARIO: TIBStringField;
    tblVentasMastCOTIZACION_ORIGEN: TIntegerField;
    tblVentasMastREFERENCIACTE: TIBStringField;
    tblVentasMastMONTO_RECARGO: TFloatField;
    tblVentasMastTIPONCFIFISCAL: TIntegerField;
    tblVentasMastMONTO_EXONERADO_ITBIS: TFloatField;
    tblVentasMastNIF_IMPRESO: TSmallintField;
    tblVentasMastIDRETENCION: TIntegerField;
    tblVentasMastPROPINALEGAL: TFloatField;
    tblVentasMastPORCPROPINALEGAL: TFloatField;
    tblVentasMastPROPINA: TFloatField;
    tblVentasMastTICKET_ID: TIntegerField;
    tblVentasMastSUB_TOTALITBIS: TFloatField;
    tblVentasMastCOD_USR_CAJA: TIntegerField;
    tblVentasMastCOD_SUBCLIENTE: TIntegerField;
    tblVentasMastVENTAARS: TSmallintField;
    tblVentasMastFECHAINICIAPOLIZA: TDateTimeField;
    tblVentasMastTIPO_AFILIADO: TSmallintField;
    tblVentasMastIDNUMERODVEH: TIntegerField;
    tblVentasMastCOD_CAJA: TIntegerField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DataSource1: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    Label14: TLabel;
    DBEdit14: TDBEdit;
    Label15: TLabel;
    DBEdit15: TDBEdit;
    Label16: TLabel;
    DBEdit16: TDBEdit;
    Label17: TLabel;
    DBEdit17: TDBEdit;
    Label18: TLabel;
    DBEdit18: TDBEdit;
    Label19: TLabel;
    DBEdit19: TDBEdit;
    Label20: TLabel;
    DBEdit20: TDBEdit;
    RxSpeedButton1: TRxSpeedButton;
    SkinData1: TSkinData;
    DBStatusLabel1: TDBStatusLabel;
    SpeedButton3: TSpeedButton;
    procedure RxSpeedButton1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUpdateMontopago: TfrmUpdateMontopago;

implementation
  uses UDatModConectar, UGlobal;
{$R *.dfm}

procedure TfrmUpdateMontopago.RxSpeedButton1Click(Sender: TObject);
begin
  GlbSalvarQuery(tblVentasMast);
end;

procedure TfrmUpdateMontopago.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if tblVentasMast.state in [dsEdit, dsInsert] then
  begin
     if MessageDlg('Transacción activa. Salir sin guardar cambios?', mtError,[mbYes,mbNo],0) = mrYes then
     begin
       tblVentasMast.Cancel;
       CanClose:=True;
     end else
     CanClose:=False;
  end;
end;

procedure TfrmUpdateMontopago.SpeedButton3Click(Sender: TObject);
begin
  if tblVentasMast.state in [dsEdit, dsInsert] then
  tblVentasMast.Cancel;
end;

end.
