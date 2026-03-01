unit UQckRepPolizas;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckRepPolizaSam = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRGroup1: TQRGroup;
    QRDBText1: TQRDBText;
    QRGroup2: TQRGroup;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRLabel13: TQRLabel;
    QRBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRBand2: TQRBand;
    QRLabel14: TQRLabel;
    procedure QRDBText3Print(sender: TObject; var Value: String);
    procedure QRSysData1Print(sender: TObject; var Value: String);
    procedure QRLabel14Print(sender: TObject; var Value: String);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure DetailBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private

  public

  end;

var
  qckRepPolizaSam: TqckRepPolizaSam;
  xCount : integer;
  TRecordG : integer;
implementation

  uses UDatModClientes,UDatModReportes, uglobal;

{$R *.DFM}

procedure TqckRepPolizaSam.QRDBText3Print(sender: TObject; var Value: String);
begin
 Value:= FormatDateTime('dd/mm/yy',dmClientes.qryRepCertificadoSamFECHAINICIAL.Value)+
 ' a ' + FormatDateTime('dd/mm/yy', dmClientes.qryRepCertificadoSamFECHAFIN.Value);
end;

procedure TqckRepPolizaSam.QRSysData1Print(sender: TObject;
  var Value: String);
begin
  Value
  :='Total Records '+dmClientes.qryRepCertificadoSamAgencia.Value + ':'+ IntToStr(xCount);
  xCount:=0;
end;

procedure TqckRepPolizaSam.QRLabel14Print(sender: TObject;
  var Value: String);
begin
  Value:= 'Total Records: '+IntToStr(TRecordG);
end;

procedure TqckRepPolizaSam.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  TRecordG:=0;
  xCount:=0;
end;

procedure TqckRepPolizaSam.DetailBand1AfterPrint(Sender: TQRCustomBand;
 BandPrinted: Boolean);
begin
  Inc(xCount, 1);
  Inc(TRecordG, 1);
end;

end.
