unit URepInvMargenGananciaXProd;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckRepMargenBeneficio = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    qrTpaginas: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRBand2: TQRBand;
    QRTARIFA: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel17: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    bandgrpTipoInventario: TQRBand;
    QRExpr3: TQRExpr;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRGroup1: TQRGroup;
    QRDBText6: TQRDBText;
    SummaryBand2: TQRBand;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRDBText3Print(sender: TObject; var Value: String);
    procedure QRDBText5Print(sender: TObject; var Value: String);
    procedure QRDBText7Print(sender: TObject; var Value: String);
    procedure QRExpr2Print(sender: TObject; var Value: String);
    procedure QRExpr1Print(sender: TObject; var Value: String);
    procedure QRExpr3Print(sender: TObject; var Value: String);
    procedure QRExpr4Print(sender: TObject; var Value: String);
    procedure QRExpr5Print(sender: TObject; var Value: String);
    procedure QRExpr6Print(sender: TObject; var Value: String);
    procedure qrTpaginasPrint(sender: TObject; var Value: String);
  private

  public

  end;

var
  qckRepMargenBeneficio: TqckRepMargenBeneficio;

implementation

uses UDatModReportes, UDatModCompania, uGlobal;

{$R *.DFM}

procedure TqckRepMargenBeneficio.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
 qckRepMargenBeneficio.AllDataSets.Add(dmCompania.tblCompania);
end;

procedure TqckRepMargenBeneficio.QRDBText3Print(sender: TObject;
  var Value: String);
begin
  if value = '0.00' then value :='';
end;

procedure TqckRepMargenBeneficio.QRDBText5Print(sender: TObject;
  var Value: String);
begin
  if value = '0.00' then value :='';
end;

procedure TqckRepMargenBeneficio.QRDBText7Print(sender: TObject;
  var Value: String);
begin
  if value = '0.00' then value :='';
end;

procedure TqckRepMargenBeneficio.QRExpr2Print(sender: TObject;
  var Value: String);
begin
  if value = '0.00' then value :='';
end;

procedure TqckRepMargenBeneficio.QRExpr1Print(sender: TObject;
  var Value: String);
begin
  if value = '0.00' then value :='';
end;

procedure TqckRepMargenBeneficio.QRExpr3Print(sender: TObject;
  var Value: String);
begin
  if value = '0.00' then value :='';
end;

procedure TqckRepMargenBeneficio.QRExpr4Print(sender: TObject;
  var Value: String);
begin
  if value = '0.00' then value :='';
end;

procedure TqckRepMargenBeneficio.QRExpr5Print(sender: TObject;
  var Value: String);
begin
  if value = '0.00' then value :='';
end;

procedure TqckRepMargenBeneficio.QRExpr6Print(sender: TObject;
  var Value: String);
begin
  if value = '0.00' then value :='';
end;

procedure TqckRepMargenBeneficio.qrTpaginasPrint(sender: TObject;
  var Value: String);
begin
  Value := ' de '+IntToStr(glbTPag);
end;

end.
