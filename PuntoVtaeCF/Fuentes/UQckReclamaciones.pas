unit UQckReclamaciones;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, jpeg, DB, IBCustomDataSet,
  IBQuery;

type
  TqckReclamacion = class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    SummaryBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    QRImage1: TQRImage;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    qryRepReclamacion: TIBQuery;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel12: TQRLabel;
    QRDBText17: TQRDBText;
    QRLabel20: TQRLabel;
    QRDBText18: TQRDBText;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRDBText19: TQRDBText;
    qryRepReclamacionFECHA: TDateTimeField;
    qryRepReclamacionNUMPOL: TIntegerField;
    qryRepReclamacionCODIGO_CTE: TIntegerField;
    qryRepReclamacionDESCCLIENTE: TIBStringField;
    qryRepReclamacionTELEF_CONTACTO: TIBStringField;
    qryRepReclamacionESTADO: TSmallintField;
    qryRepReclamacionDESC_TIPOAFILIADO: TIBStringField;
    qryRepReclamacionDESCASESOR: TIBStringField;
    qryRepReclamacionDESC_PROVEEDOR: TIBStringField;
    qryRepReclamacionCANAL_DEALER: TIBStringField;
    qryRepReclamacionIDRECLAMACION: TIntegerField;
    qryRepReclamacionCODIGO_ASESOR: TIntegerField;
    qryRepReclamacionCODIGO_CANAL: TIntegerField;
    qryRepReclamacionFALLAMECANICA: TMemoField;
    qryRepReclamacionKILOMETRAJE: TIntegerField;
    qryRepReclamacionTALLERRECMOTORTRANS: TSmallintField;
    qryRepReclamacionMONTO_APAGAR: TFloatField;
    qryRepReclamacionGARANTIAPAGADA: TSmallintField;
    qryRepReclamacionNOTA1: TMemoField;
    qryRepReclamacionNOTA2: TMemoField;
    qryRepReclamacionNOTA3: TMemoField;
    qryRepReclamacionPROCEDE: TSmallintField;
    qryRepReclamacionCODIGO_USUARIO: TIntegerField;
    qryRepReclamacionFECHA_IN: TDateTimeField;
    qryRepReclamacionIN_POR: TIBStringField;
    qryRepReclamacionFECHA_MOD: TDateTimeField;
    qryRepReclamacionMOD_POR: TIBStringField;
    qryRepReclamacionSTATUS: TIBStringField;
    qryRepReclamacionTIPO_AFILIADO: TSmallintField;
    qryRepReclamacionCODIGO_PROV: TIntegerField;
    qryRepReclamacionMONTO_COTIZADO: TFloatField;
    qryRepReclamacionMONTO_CLIENTE: TFloatField;
    qryRepReclamacionFECHAVENCEPOLIZA: TDateTimeField;
    QRLabel8: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    qryRepReclamacionESTATUSPOLIZA: TSmallintField;
    qryRepReclamacionMODELOMARCAYEAR: TIBStringField;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRDBText10: TQRDBText;
    qryRepReclamacionGRUA_ENVIADA: TSmallintField;
    qryRepReclamacionGRUA_FECHA_ENVIADA: TDateTimeField;
    qryRepReclamacionGRUA_SAM_AUTORIZA: TSmallintField;
    QRLabel40: TQRLabel;
    QRDBText11: TQRDBText;
    qryRepReclamacionCHASSIS: TIBStringField;
    qryRepReclamacionANO_VEH: TIntegerField;
    qryRepReclamacionDESC_ESTADO: TIBStringField;
    qryRepReclamacionEMAIL: TIBStringField;
    QRLabel39: TQRLabel;
    QRDBText12: TQRDBText;
    ChildBand1: TQRChildBand;
    QRLabel10: TQRLabel;
    QRDBText9: TQRDBText;
    ChildBand2: TQRChildBand;
    QRLabel13: TQRLabel;
    QRDBText14: TQRDBText;
    ChildBand3: TQRChildBand;
    QRLabel18: TQRLabel;
    QRDBText15: TQRDBText;
    ChildBand4: TQRChildBand;
    QRLabel19: TQRLabel;
    QRDBText16: TQRDBText;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRDBText13: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText23: TQRDBText;
    qryRepReclamacionMONTOCOBERTURAAPLICA: TFloatField;
    QRLabel48: TQRLabel;
    QRDBText21: TQRDBText;
    QRLabel49: TQRLabel;
    QRDBText22: TQRDBText;
    qryRepReclamacionPORCAPLICA: TFloatField;
    qryRepReclamacionDESCUENTOAFILIADO: TFloatField;
    qryRepReclamacionMONTOCONDESCAPLICADO: TFloatField;
    qryRepReclamacionMONTONOCUBIERTO: TFloatField;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText19Print(sender: TObject; var Value: String);
    procedure QRDBText10Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  qckReclamacion: TqckReclamacion;

implementation

uses UDatModConectar, UGlobal;

{$R *.DFM}

procedure TqckReclamacion.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if qryRepReclamacionPROCEDE.Value = 0 then
  QRLabel23.Caption:='   '
  else
  QRLabel24.Caption:='   ';

  if qryRepReclamacionTALLERRECMOTORTRANS.Value = 0 then
  QRLabel25.Caption:='   '
  else
  QRLabel26.Caption:='   ';

  if qryRepReclamacionGRUA_ENVIADA.Value = 0 then
  QRLabel31.Caption:='   '
  else
  QRLabel32.Caption:='   ';

  if qryRepReclamacionGRUA_SAM_AUTORIZA.Value = 0 then
  QRLabel36.Caption:='   '
  else
  QRLabel37.Caption:='   ';

end;

procedure TqckReclamacion.QRDBText19Print(sender: TObject;
  var Value: String);
begin
  if (qryRepReclamacionFECHAVENCEPOLIZA.Value < ExtraerFecha(now)) then
  begin
    Value:=Value+' (Vencida)';
    QRDBText19.font.Color:=clred;
  end;
end;

procedure TqckReclamacion.QRDBText10Print(sender: TObject;
  var Value: String);
begin
  if qryRepReclamacionGRUA_FECHA_ENVIADA.IsNull then
  Value:='';
end;

end.
