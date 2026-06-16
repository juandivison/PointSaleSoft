unit URepIR13;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TqckRepIR13 = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel4: TQRLabel;
    QRBand2: TQRBand;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRBand3: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRExpr1: TQRExpr;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText1: TQRDBText;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRBand4: TQRBand;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    QRLabel25: TQRLabel;
    QRExpr13: TQRExpr;
    QRDBText3: TQRDBText;
    QRExpr14: TQRExpr;
    QRLabel26: TQRLabel;
    procedure QRDBText1Print(sender: TObject; var Value: String);
    procedure QRDBText4Print(sender: TObject; var Value: String);
    procedure QRExpr2Print(sender: TObject; var Value: String);
    procedure QRExpr1Print(sender: TObject; var Value: String);
    procedure QRDBText6Print(sender: TObject; var Value: String);
    procedure QRDBText7Print(sender: TObject; var Value: String);
    procedure QRExpr3Print(sender: TObject; var Value: String);
    procedure QRExpr4Print(sender: TObject; var Value: String);
    procedure QRLabel2Print(sender: TObject; var Value: String);
    procedure QRExpr6Print(sender: TObject; var Value: String);
    procedure QRExpr5Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  qckRepIR13: TqckRepIR13;

implementation
uses UDatmodDatosGenerales,uglobal, UDatModNomina;
{$R *.DFM}

procedure TqckRepIR13.QRDBText1Print(sender: TObject; var Value: String);
begin
  Value := sqlNombreAbr(dmdatos.qryRepIR13CODIGO.Value);
end;

procedure TqckRepIR13.QRDBText4Print(sender: TObject; var Value: String);
begin
  if value = '0.00' then value := '';
end;

procedure TqckRepIR13.QRExpr2Print(sender: TObject; var Value: String);
begin
  if value = '0.00' then value := '';
end;

procedure TqckRepIR13.QRExpr1Print(sender: TObject; var Value: String);
begin
  if value = '0.00' then value := '';
end;

procedure TqckRepIR13.QRDBText6Print(sender: TObject; var Value: String);
begin
  if value = '0.00' then value := '';
end;

procedure TqckRepIR13.QRDBText7Print(sender: TObject; var Value: String);
begin
  if value = '0.00' then value := '';
end;

procedure TqckRepIR13.QRExpr3Print(sender: TObject; var Value: String);
begin
  if value = '0.00' then value := '';
end;

procedure TqckRepIR13.QRExpr4Print(sender: TObject; var Value: String);
begin
  if value = '0.00' then value := '';
  if value = '0.01' then value := '';
end;

procedure TqckRepIR13.QRLabel2Print(sender: TObject; var Value: String);
begin
  Value := Value + '`' + FormatDateTime('yyyy',GlbFechaInicial);
end;

procedure TqckRepIR13.QRExpr6Print(sender: TObject; var Value: String);
begin
  if value = '0.02' then value := '';
end;

procedure TqckRepIR13.QRExpr5Print(sender: TObject; var Value: String);
begin
  if value = '0.00' then value := '';
end;

end.
