unit UReporteSobreNominaEmp;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckSobrePagoNomina = class(TQuickRep)
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
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel9: TQRLabel;
    QRBand3: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRExpr1: TQRExpr;
    QRGroup1: TQRGroup;
    ChildBand1: TQRChildBand;
    QRLabel16: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel18: TQRLabel;
    QRDBText15: TQRDBText;
    ChildBand2: TQRChildBand;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    procedure QRLabel3Print(sender: TObject; var Value: String);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public

  end;

var
  qckSobrePagoNomina: TqckSobrePagoNomina;

implementation
 uses UDatModNomina;
 
{$R *.DFM}

procedure TqckSobrePagoNomina.QRLabel3Print(sender: TObject;
  var Value: String);
begin
  Value := FormatDatetime(Shortdateformat,dmNomina.qryRepNomina.Params[0].Value)+' al '+FormatDatetime(Shortdateformat,dmNomina.qryRepNomina.Params[0].Value);
end;

procedure TqckSobrePagoNomina.ChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if (dmNomina.qryRepNominaREGALIA.Value > 0) AND
     (dmNomina.qryRepNominaVACACIONES.Value > 0) AND
     (dmNomina.qryRepNominaBONIFICACION.Value > 0) then
  begin
    PrintBand:=false;
    ChildBand1.Height:=0;
  end else
  begin
    PrintBand:=True;
    QRLabel12.Enabled:=dmNomina.qryRepNominaREGALIA.Value > 0;
    QRDBText16.Enabled:=dmNomina.qryRepNominaREGALIA.Value > 0;
    QRLabel13.Enabled:=dmNomina.qryRepNominaVACACIONES.Value > 0;
    QRDBText17.Enabled:=dmNomina.qryRepNominaVACACIONES.Value > 0;
    QRLabel14.Enabled:=dmNomina.qryRepNominaBONIFICACION.Value > 0;
    QRDBText18.Enabled:=dmNomina.qryRepNominaBONIFICACION.Value >0;
  end;
end;

end.
