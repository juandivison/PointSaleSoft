unit UReporteSobreNominaEmpCont;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckSobrePagoNominaCont = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRDBText9: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel11: TQRLabel;
    QRBand2: TQRBand;
    QRLabel1: TQRLabel;
    QRTARIFA: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel9: TQRLabel;
    QRBand3: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRExpr1: TQRExpr;
    QRGroup1: TQRGroup;
    ChildBand1: TQRChildBand;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBText13: TQRDBText;
    QRDBText6: TQRDBText;
    procedure QRLabel3Print(sender: TObject; var Value: String);
    procedure QRDBText6Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  qckSobrePagoNominaCont: TqckSobrePagoNominaCont;

implementation
 uses UDatModNomina;
 
{$R *.DFM}

procedure TqckSobrePagoNominaCont.QRLabel3Print(sender: TObject;
  var Value: String);
begin
  Value := FormatDatetime(Shortdateformat,dmNomina.qryRepNominaContratista.Params[2].Value);
  //+' al '+FormatDatetime(Shortdateformat,dmNomina.qryRepNomina.Params[2].Value);
end;

procedure TqckSobrePagoNominaCont.QRDBText6Print(sender: TObject;
  var Value: String);
begin
  Value := 'Proyecto:'+Value;
end;

end.
