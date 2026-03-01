unit URepMayorDetallado;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, QRExport;

type
  TqckRepMayorGDet = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    qrTpaginas: TQRLabel;
    QRBand2: TQRBand;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRBand3: TQRBand;
    QRExpr1: TQRExpr;
    QRDBText1: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel16: TQRLabel;
    QRBand4: TQRBand;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRSubDetail1: TQRSubDetail;
    QRExpr2: TQRExpr;
    QRDBText10: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText11: TQRDBText;
    QRBand5: TQRBand;
    qrSubTotalDbCta: TQRExpr;
    qrSubTotalCrCta: TQRExpr;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    qrBalanceAFechaDb: TQRLabel;
    qrBalanceAFechaCR: TQRLabel;
    QRTextFilter1: TQRTextFilter;
    QRGroup1: TQRGroup;
    QRExpr5: TQRExpr;
    QRBand6: TQRBand;
    QRExpr8: TQRExpr;
    QRGroup2: TQRGroup;
    QRExpr9: TQRExpr;
    QRBand7: TQRBand;
    QRExpr12: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    QRDBText6: TQRDBText;
    QRDBText9: TQRDBText;
    procedure QRLabel4Print(sender: TObject; var Value: String);
    procedure QRBand5BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRDBText2Print(sender: TObject; var Value: String);
    procedure qrTpaginasPrint(sender: TObject; var Value: String);
    procedure qrSubTotalCrCtaPrint(sender: TObject; var Value: String);
    procedure QRExpr11Print(sender: TObject; var Value: String);
    procedure QRExpr10Print(sender: TObject; var Value: String);
    procedure QRExpr6Print(sender: TObject; var Value: String);
    procedure QRExpr7Print(sender: TObject; var Value: String);
    procedure qrSubTotalDbCtaPrint(sender: TObject; var Value: String);
    procedure QRDBText11Print(sender: TObject; var Value: String);
    procedure QRDBText3Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  qckRepMayorGDet: TqckRepMayorGDet;
  BalanceInicial : Real;
  OrigenCta      : Smallint;
  TotalCreditoDetalle : Real = 0;
  TotalDebitoDetalle  : Real = 0;
  TotalCreditoDetalleD :Real = 0;
  TotalDebitoDetalleD  :real = 0;
  TotalCreditoDetalleC :Real = 0;
  TotalDebitoDetalleC  :real = 0;
implementation
uses UDmRep, Uglobal;
{$R *.DFM}

procedure TqckRepMayorGDet.QRLabel4Print(sender: TObject; var Value: String);
begin
  Value := 'Al Mes de '+FormatDateTime('mmmmm',GlbFechaInicial)+'`'+FormatDateTime('yyyy',GlbFechaInicial);
end;

procedure TqckRepMayorGDet.QRBand5BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var  Resultado:Real;
begin
  //BalanceInicial
  qrBalanceAFechaCr.Caption := '';
  qrBalanceAFechaDb.Caption := '';
  if (OrigenCta = 1 ) then
  begin
    Resultado := TotalDebitoDetalle - TotalCreditoDetalle + BalanceInicial;
    if (Resultado > 0) then
    qrBalanceAFechaDb.Caption     := InsertarComa(Format('%8.2f', [Resultado]))
    else qrBalanceAFechaCr.Caption:= InsertarComa(Format('%8.2f', [Abs(Resultado)]));
  end else
  begin
    Resultado := TotalCreditoDetalle - TotalDebitoDetalle + BalanceInicial;
    if (Resultado > 0) then
    qrBalanceAFechaCr.Caption := InsertarComa(Format('%8.2f', [Resultado]))
    else qrBalanceAFechaDb.Caption := InsertarComa(Format('%8.2f', [Abs(Resultado)]));
  end;
end;

procedure TqckRepMayorGDet.QRSubDetail1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  if BandPrinted then
  begin
    TotalCreditoDetalle := TotalCreditoDetalle + dtmodrep.qryRepMayorGenDetCR_CLD.Value;
    TotalDebitoDetalle  := TotalDebitoDetalle  + dtmodrep.qryRepMayorGenDetDB_CLD.Value;
    TotalCreditoDetalleD := TotalCreditoDetalleD + dtmodrep.qryRepMayorGenDetCR_CLD.Value;
    TotalDebitoDetalleD  := TotalDebitoDetalleD  + dtmodrep.qryRepMayorGenDetDB_CLD.Value;
    TotalCreditoDetalleC := TotalCreditoDetalleC + dtmodrep.qryRepMayorGenDetCR_CLD.Value;
    TotalDebitoDetalleC  := TotalDebitoDetalleC  + dtmodrep.qryRepMayorGenDetDB_CLD.Value;
  end;
end;

procedure TqckRepMayorGDet.QRDBText2Print(sender: TObject; var Value: String);
begin
  if dtModRep.qryRepMayorGenDetSTATUS.Value = 'C' then
  Value := '*** Cancelado *** ';
end;

procedure TqckRepMayorGDet.qrTpaginasPrint(sender: TObject;
  var Value: String);
begin
  Value := ' de '+IntToStr(glbTPag);
end;

procedure TqckRepMayorGDet.qrSubTotalCrCtaPrint(sender: TObject;
  var Value: String);
begin
  Value := InsertarComa(Format('%8.2f', [TotalCreditoDetalle]));
  if value  = '0.00' then value :='';
  if value  = '0' then value :='';
  TotalCreditoDetalle := 0;
end;

procedure TqckRepMayorGDet.QRExpr11Print(sender: TObject;
  var Value: String);
begin
  Value := InsertarComa(Format('%8.2f', [TotalCreditoDetalleC]));
  if Value  = '0.00' then Value :='';
  if Value  = '0' then Value :='';
  TotalCreditoDetalleC:= 0;
end;

procedure TqckRepMayorGDet.QRExpr10Print(sender: TObject;
  var Value: String);
begin
  Value := InsertarComa(Format('%8.2f', [TotalCreditoDetalleD]));
  if value  = '0.00' then value :='';
  if value  = '0' then value :='';
  TotalCreditoDetalleD:= 0;
end;

procedure TqckRepMayorGDet.QRExpr6Print(sender: TObject;
  var Value: String);
begin
  Value := InsertarComa(Format('%8.2f', [TotalDebitoDetalleD]));
  if value  = '0.00' then value :='';
  if value  = '0' then value :='';
  TotalDebitoDetalleD:= 0;
end;

procedure TqckRepMayorGDet.QRExpr7Print(sender: TObject;
  var Value: String);
begin
  Value := InsertarComa(Format('%8.2f', [TotalDebitoDetalleD]));
  if value  = '0.00' then value :='';
  if value  = '0' then value :='';
  TotalDebitoDetalleD:= 0;
end;

procedure TqckRepMayorGDet.qrSubTotalDbCtaPrint(sender: TObject;
  var Value: String);
begin
  Value := InsertarComa(Format('%8.2f', [TotalDebitoDetalle]));
  if value  = '0.00' then value :='';
  if value  = '0' then value :='';
  TotalDebitoDetalle:= 0;
end;

procedure TqckRepMayorGDet.QRDBText11Print(sender: TObject;
  var Value: String);
begin
  if value = '0.00' then Value := '';
end;

procedure TqckRepMayorGDet.QRDBText3Print(sender: TObject;
  var Value: String);
begin
  if value = '0.00' then Value := '';
end;

end.
