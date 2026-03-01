unit URepClientesCumple;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckRepClientesCumple = class(TQuickRep)
    QRBand2: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRBand3: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRBand4: TQRBand;
    QRSysData1: TQRSysData;
    QRBand5: TQRBand;
    QRLabel12: TQRLabel;
    QRSysData2: TQRSysData;
    QRDBText1: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRGroup1: TQRGroup;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRLabel1: TQRLabel;
    QRDBText12: TQRDBText;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand3AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRSysData1Print(sender: TObject; var Value: String);
    procedure QRDBText12Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  qckRepClientesCumple: TqckRepClientesCumple;
  cont : integer;

implementation

uses UDatModCompania, UDatModReportes;

{$R *.DFM}

procedure TqckRepClientesCumple.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  cont:=0;
  qckRepClientesCumple.AllDataSets.Add(dmCompania.tblCompania);
end;

procedure TqckRepClientesCumple.QRBand3AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  inc(cont);
end;

procedure TqckRepClientesCumple.QRSysData1Print(sender: TObject;
  var Value: String);
begin
  try
  Value:='Total Record '+IntToStr(cont);
  except
  end;
end;

procedure TqckRepClientesCumple.QRDBText12Print(sender: TObject;
  var Value: String);
begin
  if dmReportes.qryDatosRepClientesCumpleFECHA_NACIMIENTO.IsNull then exit;
  if (FormatDateTime('mm', dmReportes.qryDatosRepClientesCumpleFECHA_NACIMIENTO.Value) =
     (FormatDateTime('mm', Now))) then
     QRDBText12.Font.Style := [fsBold];
end;

end.
