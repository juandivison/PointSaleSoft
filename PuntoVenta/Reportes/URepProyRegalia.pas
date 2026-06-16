unit URepProyRegalia;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TqckProyRegalia = class(TQuickRep)
    QRBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    qrTituloReporte: TQRLabel;
    QRSysData3: TQRSysData;
    QRLabel28: TQRLabel;
    QRBand3: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRBand2: TQRBand;
    QRExpr1: TQRExpr;
    QRExpr9: TQRExpr;
    bandadetalle: TQRBand;
    QRDBText3: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRSysData4: TQRSysData;
    qrStatusEmp: TQRLabel;
    QRBand4: TQRBand;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRDBText30: TQRDBText;
    procedure QRLabel4Print(sender: TObject; var Value: String);
    procedure qrTituloReportePrint(sender: TObject; var Value: String);
    procedure bandadetalleBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText7Print(sender: TObject; var Value: String);
    procedure QRDBText4Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  qckProyRegalia: TqckProyRegalia;

implementation
uses UDatmodDatosGenerales,UGlobal;
{$R *.DFM}

procedure TqckProyRegalia.QRLabel4Print(sender: TObject;
  var Value: String);
begin
  Value := SqlNombreAbr(dmdatos.QryProyRegaliaCODIGO.Value);
end;

procedure TqckProyRegalia.qrTituloReportePrint(sender: TObject;
  var Value: String);
begin
  Value := Value + '`'+FormatDateTime('yyyy',glbfechaFinal);
end;

procedure TqckProyRegalia.bandadetalleBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if dmDatos.QryProyRegaliaReg_Proy.Value > 0 then
  PrintBand:=True else PrintBand:=False;
end;

procedure TqckProyRegalia.QRDBText7Print(sender: TObject;
  var Value: String);
begin
  if value = '0.00' then value := '';
end;

procedure TqckProyRegalia.QRDBText4Print(sender: TObject;
  var Value: String);
begin
  if value = '0.00' then value := '';
end;

end.
