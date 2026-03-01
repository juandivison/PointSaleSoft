unit UQckRepMotores;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, IBCustomDataSet,
  IBQuery;

type
  TqckRepMotores = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRDBText5: TQRDBText;
    QRLabel5: TQRLabel;
    QRSysData1: TQRSysData;
    qryMotores: TIBQuery;
    qryMotoresNUMERO: TIntegerField;
    qryMotoresTIPO: TSmallintField;
    qryMotoresFECHA_INGRESO: TDateTimeField;
    qryMotoresYEAR_FAB: TIntegerField;
    qryMotoresCHASIS: TIBStringField;
    qryMotoresCOLOR: TIBStringField;
    qryMotoresMODELO: TIBStringField;
    qryMotoresMATRICULA: TIBStringField;
    qryMotoresPLACA: TIBStringField;
    qryMotoresSTATUS: TIBStringField;
    qryMotoresCOD_USUARIO: TIntegerField;
    qryMotoresFECHA_IN: TDateTimeField;
    qryMotoresIN_POR: TIBStringField;
    qryMotoresFECHA_UPD: TDateTimeField;
    qryMotoresUPD_POR: TIBStringField;
    qryMotoresNOMBRECLIENTE: TIBStringField;
    qryMotoresFECHA_ASIGNADO: TDateTimeField;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRGroup1: TQRGroup;
    qryMotoresDESCTIPO: TIBStringField;
    QRDBText11: TQRDBText;
    QRBand1: TQRBand;
    qryMotores_Entrada: TIBQuery;
    qryMotores_Salida: TIBQuery;
    QRSysData2: TQRSysData;
    procedure QRExpr1Print(sender: TObject; var Value: String);
    procedure QRDBText12Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  qckRepMotores: TqckRepMotores;

implementation
    uses UDatModCompania,UDatModConectar;
{$R *.DFM}

procedure TqckRepMotores.QRExpr1Print(sender: TObject; var Value: String);
begin
  Value:='Cantidad: '+Value;
end;

procedure TqckRepMotores.QRDBText12Print(sender: TObject;
  var Value: String);
begin
  if qryMotoresFECHA_ASIGNADO.IsNull or (Value = '13/12/1899')   then
  Value:='';
end;

end.
