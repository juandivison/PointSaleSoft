unit UDatModCatalogo;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBTable, IBQuery, IBUpdateSQL;

type
  TdmCatalogo = class(TDataModule)
    tblqryCatalogo: TIBDataSet;
    tblqryCatalogoCUENTA1: TIBStringField;
    tblqryCatalogoCUENTA2: TIBStringField;
    tblqryCatalogoCUENTA3: TIBStringField;
    tblqryCatalogoNIVEL_CTA: TSmallintField;
    tblqryCatalogoTIPO_CTA: TIBStringField;
    tblqryCatalogoCTA_CTRL1: TIBStringField;
    tblqryCatalogoCTA_CTRL2: TIBStringField;
    tblqryCatalogoCTA_CTRL3: TIBStringField;
    tblqryCatalogoCTACIE1: TIBStringField;
    tblqryCatalogoCTACIE2: TIBStringField;
    tblqryCatalogoCTACIE3: TIBStringField;
    tblqryCatalogoSIGNO_CTA: TSmallintField;
    tblqryCatalogoBALANCE_ACT: TFloatField;
    tblqryCatalogoBALANCE_ANT: TFloatField;
    tblqryCatalogoCREDITO_ACT: TFloatField;
    tblqryCatalogoDEBITO_ACT: TFloatField;
    tblqryCatalogoCREDITO_ACM: TFloatField;
    tblqryCatalogoDEBITO_ACM: TFloatField;
    tblqryCatalogoFECHA_APE: TDateTimeField;
    tblqryCatalogoFECHA_ACT: TDateTimeField;
    tblqryCatalogoFECHA_ULT_TR: TDateTimeField;
    tblqryCatalogoTIPO: TIBStringField;
    tblqryCatalogoCTA_CONS1: TIBStringField;
    tblqryCatalogoCTA_CONS2: TIBStringField;
    tblqryCatalogoCTA_CONS3: TIBStringField;
    tblqryCatalogoCLASIFICACION_CTA: TIntegerField;
    tblqryCatalogoSTATUS: TIBStringField;
    tblqryCatalogoFECHA_IN: TDateTimeField;
    tblqryCatalogoIN_POR: TIBStringField;
    tblqryCatalogoFECHA_MOD: TDateTimeField;
    tblqryCatalogoMOD_POR: TIBStringField;
    tblTipocuenta: TIBTable;
    tblTipocuentaCODIGO: TSmallintField;
    tblTipocuentaDESCRIPCION: TIBStringField;
    dstblTipocuenta: TDataSource;
    qrycatalogo: TIBQuery;
    qryBceCtames: TIBDataSet;
    qryBceCtamesCUENTA1_BLC: TIBStringField;
    qryBceCtamesCUENTA2_BLC: TIBStringField;
    qryBceCtamesCUENTA3_BLC: TIBStringField;
    qryBceCtamesFECHA_BLC: TDateTimeField;
    qryBceCtamesSTATUS_CIEA: TIBStringField;
    qryBceCtamesTIPO_CTA: TIBStringField;
    qryBceCtamesSIGNO_CTA: TIBStringField;
    qryBceCtamesNIVEL_CTA: TSmallintField;
    qryBceCtamesBALANCE_ACT: TFloatField;
    qryBceCtamesBALANCE_ANT: TFloatField;
    qryBceCtamesDEBITO: TFloatField;
    qryBceCtamesCREDITO: TFloatField;
    qryBceCtamesFECHA_IN: TDateTimeField;
    qryBceCtamesIN_POR: TIBStringField;
    qryBceCtamesFECHA_MOD: TDateTimeField;
    qryBceCtamesMOD_POR: TIBStringField;
    qryBlcMesCta: TIBDataSet;
    qryBlcMesCtaCUENTA1_BLC: TIBStringField;
    qryBlcMesCtaCUENTA2_BLC: TIBStringField;
    qryBlcMesCtaCUENTA3_BLC: TIBStringField;
    qryBlcMesCtaFECHA_BLC: TDateTimeField;
    qryBlcMesCtaSTATUS_CIEA: TIBStringField;
    qryBlcMesCtaTIPO_CTA: TIBStringField;
    qryBlcMesCtaSIGNO_CTA: TIBStringField;
    qryBlcMesCtaNIVEL_CTA: TSmallintField;
    qryBlcMesCtaBALANCE_ACT: TFloatField;
    qryBlcMesCtaBALANCE_ANT: TFloatField;
    qryBlcMesCtaDEBITO: TFloatField;
    qryBlcMesCtaCREDITO: TFloatField;
    qryBlcMesCtaFECHA_IN: TDateTimeField;
    qryBlcMesCtaIN_POR: TIBStringField;
    qryBlcMesCtaFECHA_MOD: TDateTimeField;
    qryBlcMesCtaMOD_POR: TIBStringField;
    dtqryBlcMesCta: TDataSource;
    qryCuentas400_700: TIBQuery;
    qryCuentas400_700CUENTA1: TIBStringField;
    qryCuentas400_700CUENTA2: TIBStringField;
    qryCuentas400_700CUENTA3: TIBStringField;
    qryCuentas400_700NIVEL_CTA: TSmallintField;
    qryCuentas400_700TIPO_CTA: TIBStringField;
    qryCuentas400_700CTA_CTRL1: TIBStringField;
    qryCuentas400_700CTA_CTRL2: TIBStringField;
    qryCuentas400_700CTA_CTRL3: TIBStringField;
    qryCuentas400_700CTACIE1: TIBStringField;
    qryCuentas400_700CTACIE2: TIBStringField;
    qryCuentas400_700CTACIE3: TIBStringField;
    qryCuentas400_700SIGNO_CTA: TSmallintField;
    qryCuentas400_700BALANCE_ACT: TFloatField;
    qryCuentas400_700BALANCE_ANT: TFloatField;
    qryCuentas400_700CREDITO_ACT: TFloatField;
    qryCuentas400_700DEBITO_ACT: TFloatField;
    qryCuentas400_700CREDITO_ACM: TFloatField;
    qryCuentas400_700DEBITO_ACM: TFloatField;
    qryCuentas400_700FECHA_APE: TDateTimeField;
    qryCuentas400_700FECHA_ACT: TDateTimeField;
    qryCuentas400_700FECHA_ULT_TR: TDateTimeField;
    qryCuentas400_700TIPO: TIBStringField;
    qryCuentas400_700CTA_CONS1: TIBStringField;
    qryCuentas400_700CTA_CONS2: TIBStringField;
    qryCuentas400_700CTA_CONS3: TIBStringField;
    qryCuentas400_700CLASIFICACION_CTA: TIntegerField;
    qryCuentas400_700STATUS: TIBStringField;
    qryCuentas400_700FECHA_IN: TDateTimeField;
    qryCuentas400_700IN_POR: TIBStringField;
    qryCuentas400_700FECHA_MOD: TDateTimeField;
    qryCuentas400_700MOD_POR: TIBStringField;
    updsqlQryCatalogo: TIBUpdateSQL;
    tblqryCatalogoCTA_AFECTA: TSmallintField;
    qryAfectaCta: TIBQuery;
    qryAfectaCtaCODIGO: TSmallintField;
    qryAfectaCtaDESCRIPCION: TIBStringField;
    dsqryAfectaCta: TDataSource;
    tblqryCatalogoCIA_KEY: TIntegerField;
    qrycatalogoCIA_KEY: TIntegerField;
    qrycatalogoCUENTA1: TIBStringField;
    qrycatalogoCUENTA2: TIBStringField;
    qrycatalogoCUENTA3: TIBStringField;
    qrycatalogoNIVEL_CTA: TSmallintField;
    qrycatalogoTIPO_CTA: TIBStringField;
    qrycatalogoCTA_CTRL1: TIBStringField;
    qrycatalogoCTA_CTRL2: TIBStringField;
    qrycatalogoCTA_CTRL3: TIBStringField;
    qrycatalogoCTACIE1: TIBStringField;
    qrycatalogoCTACIE2: TIBStringField;
    qrycatalogoCTACIE3: TIBStringField;
    qrycatalogoSIGNO_CTA: TSmallintField;
    qrycatalogoBALANCE_ACT: TFloatField;
    qrycatalogoBALANCE_ANT: TFloatField;
    qrycatalogoCREDITO_ACT: TFloatField;
    qrycatalogoDEBITO_ACT: TFloatField;
    qrycatalogoCREDITO_ACM: TFloatField;
    qrycatalogoDEBITO_ACM: TFloatField;
    qrycatalogoFECHA_APE: TDateTimeField;
    qrycatalogoFECHA_ACT: TDateTimeField;
    qrycatalogoFECHA_ULT_TR: TDateTimeField;
    qrycatalogoTIPO: TIBStringField;
    qrycatalogoCTA_CONS1: TIBStringField;
    qrycatalogoCTA_CONS2: TIBStringField;
    qrycatalogoCTA_CONS3: TIBStringField;
    qrycatalogoCLASIFICACION_CTA: TIntegerField;
    qrycatalogoSTATUS: TIBStringField;
    qrycatalogoFECHA_IN: TDateTimeField;
    qrycatalogoIN_POR: TIBStringField;
    qrycatalogoFECHA_MOD: TDateTimeField;
    qrycatalogoMOD_POR: TIBStringField;
    qrycatalogoCTA_AFECTA: TSmallintField;
    qryCuentas400_700CIA_KEY: TIntegerField;
    qryCuentas400_700NOMBRE_CTA: TIBStringField;
    qryCuentas400_700CTA_AFECTA: TSmallintField;
    tblqryCatalogoNoExiste: TSmallintField;
    tblqryCatalogoNOMBRE_CTA: TIBStringField;
    qrycatalogoNOMBRE_CTA: TIBStringField;
    procedure qrycatalogoFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure tblqryCatalogoAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    strFilterField : string;
    strSinControl : String;
  end;

var
  dmCatalogo: TdmCatalogo;

implementation

uses  UDatModConectar, UGlobal;

{$R *.dfm}

procedure TdmCatalogo.qrycatalogoFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  if (strSinControl <> '') then
  Accept := (DataSet['Cta_ctrl1'] = '') and (DataSet['tipo_cta'] = 'A')
  else
  Accept := (DataSet['Balance_Act'] <> 0) or (DataSet['Balance_Ant'] <> 0);
end;

procedure TdmCatalogo.tblqryCatalogoAfterScroll(DataSet: TDataSet);
var
 c1,c2,c3:string;
begin
  if Not tblqryCatalogoCUENTA1.IsNull then
    if (tblqryCatalogoCUENTA1.Value <> '') then
       if Not CtaExiste(tblqryCatalogoCUENTA1.Value,tblqryCatalogoCUENTA2.Value,
          tblqryCatalogoCUENTA3.Value,false) then
          tblqryCatalogoNoExiste.Value:= 0
       else
  tblqryCatalogoNoExiste.Value:= 1;
end;

end.
