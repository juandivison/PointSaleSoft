unit URepInvMargenGananciaXVenta;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckRepMargenBeneficioVenta = class(TQuickRep)
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
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel17: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    bandgrpTipoInventario: TQRBand;
    QRExpr2: TQRExpr;
    QRGroup1: TQRGroup;
    QRDBText6: TQRDBText;
    SummaryBand2: TQRBand;
    QRExpr4: TQRExpr;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRExpr5: TQRExpr;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText8: TQRDBText;
    QRExpr1: TQRExpr;
    QRDBText10: TQRDBText;
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
  qckRepMargenBeneficioVenta: TqckRepMargenBeneficioVenta;

implementation

uses UDatModReportes, UDatModCompania, uGlobal;

{$R *.DFM}

procedure TqckRepMargenBeneficioVenta.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  qckRepMargenBeneficioVenta.AllDataSets.Add(dmCompania.tblCompania);
end;

procedure TqckRepMargenBeneficioVenta.QRDBText3Print(sender: TObject;
  var Value: String);
begin
  if value = '0.00' then value :='';
end;

procedure TqckRepMargenBeneficioVenta.QRDBText5Print(sender: TObject;
  var Value: String);
begin
  if value = '0.00' then value :='';
end;

procedure TqckRepMargenBeneficioVenta.QRDBText7Print(sender: TObject;
  var Value: String);
begin
  if value = '0.00' then value :='';
end;

procedure TqckRepMargenBeneficioVenta.QRExpr2Print(sender: TObject;
  var Value: String);
begin
  if value = '0.00' then value :='';
end;

procedure TqckRepMargenBeneficioVenta.QRExpr1Print(sender: TObject;
  var Value: String);
begin
  if value = '0.00' then value :='';
end;

procedure TqckRepMargenBeneficioVenta.QRExpr3Print(sender: TObject;
  var Value: String);
begin
  if value = '0.00' then value :='';
end;

procedure TqckRepMargenBeneficioVenta.QRExpr4Print(sender: TObject;
  var Value: String);
begin
  if value = '0.00' then value :='';
end;

procedure TqckRepMargenBeneficioVenta.QRExpr5Print(sender: TObject;
  var Value: String);
begin
  if value = '0.00' then value :='';
end;

procedure TqckRepMargenBeneficioVenta.QRExpr6Print(sender: TObject;
  var Value: String);
begin
  if value = '0.00' then value :='';
end;

procedure TqckRepMargenBeneficioVenta.qrTpaginasPrint(sender: TObject;
  var Value: String);
begin
  Value := ' de '+IntToStr(glbTPag);
end;

end.
