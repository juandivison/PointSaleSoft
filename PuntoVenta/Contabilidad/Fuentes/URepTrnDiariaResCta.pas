unit URepTrnDiariaResCta;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TqckRepTrnDiariaResCta = class(TQuickRep)
    QRBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    QRBand2: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRBand3: TQRBand;
    QRExpr2: TQRExpr;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRBand4: TQRBand;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRSysData2: TQRSysData;
    QRDBText2: TQRDBText;
    QRLabel2: TQRLabel;
    qrFecha: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText6: TQRDBText;
    QRExpr1: TQRExpr;
    QRExpr5: TQRExpr;
    QRDBText7: TQRDBText;
    QRLabel8: TQRLabel;
    procedure QRDBText4Print(sender: TObject; var Value: String);
    procedure QRDBText3Print(sender: TObject; var Value: String);
    procedure QRExpr3Print(sender: TObject; var Value: String);
    procedure QRExpr4Print(sender: TObject; var Value: String);
    procedure qrFechaPrint(sender: TObject; var Value: String);
    procedure QRDBText7Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  qckRepTrnDiariaResCta: TqckRepTrnDiariaResCta;

implementation
uses uglobal,UDmRep;
{$R *.DFM}

procedure TqckRepTrnDiariaResCta.QRDBText4Print(sender: TObject;
  var Value: String);
begin
  if value = '0.00' then value := '';
end;

procedure TqckRepTrnDiariaResCta.QRDBText3Print(sender: TObject;
  var Value: String);
begin
  if value = '0.00' then value := '';
end;

procedure TqckRepTrnDiariaResCta.QRExpr3Print(sender: TObject;
  var Value: String);
begin
  if value = '0.00' then value := '';
end;

procedure TqckRepTrnDiariaResCta.QRExpr4Print(sender: TObject;
  var Value: String);
begin
  if value = '0.00' then value := '';
end;

procedure TqckRepTrnDiariaResCta.qrFechaPrint(sender: TObject;
  var Value: String);
begin
  Value := 'De '+Formatdatetime('yyyy-mm-dd',GlbFechaInicial)+ ' al '+
  Formatdatetime('yyyy-mm-dd',GlbFechaFinal);
end;

procedure TqckRepTrnDiariaResCta.QRDBText7Print(sender: TObject;
  var Value: String);
begin
  if value = '1' then Value := 'Db' else Value := 'Cr';  
end;

end.
 