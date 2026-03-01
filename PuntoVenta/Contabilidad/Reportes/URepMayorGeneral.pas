unit URepMayorGeneral;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, QRExport;

type
  TqckRepMayorGeneral = class(TQuickRep)
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    QRBand4: TQRBand;
    QRSubDetail1: TQRSubDetail;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRExpr1: TQRExpr;
    QRDBText1: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRExpr2: TQRExpr;
    QRDBText10: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText11: TQRDBText;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRLabel16: TQRLabel;
    QRBand5: TQRBand;
    qrSubTotalDbCta: TQRExpr;
    qrSubTotalCrCta: TQRExpr;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    qrBalanceAFechaDb: TQRLabel;
    qrBalanceAFechaCR: TQRLabel;
    QRTextFilter1: TQRTextFilter;
    QRSysData2: TQRSysData;
    qrTpaginas: TQRLabel;
    QRExpr5: TQRExpr;
    QRDBText6: TQRDBText;
    QRDBText9: TQRDBText;
    procedure QRDBText7Print(sender: TObject; var Value: String);
    procedure QRDBText8Print(sender: TObject; var Value: String);
    procedure QRDBText3Print(sender: TObject; var Value: String);
    procedure QRDBText11Print(sender: TObject; var Value: String);
    procedure qrSubTotalDbCtaPrint(sender: TObject; var Value: String);
    procedure qrSubTotalCrCtaPrint(sender: TObject; var Value: String);
    procedure QRExpr3Print(sender: TObject; var Value: String);
    procedure QRExpr4Print(sender: TObject; var Value: String);
    procedure QRLabel4Print(sender: TObject; var Value: String);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand5BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRDBText2Print(sender: TObject; var Value: String);
    procedure qrTpaginasPrint(sender: TObject; var Value: String);
  private

  public

  end;

var
  qckRepMayorGeneral: TqckRepMayorGeneral;
  BalanceInicial : Real;
  OrigenCta      : Smallint;
  TotalCreditoDetalle : Real = 0;
  TotalDebitoDetalle  : Real = 0;
implementation
uses UDmRep, Uglobal;
{$R *.DFM}

procedure TqckRepMayorGeneral.QRDBText7Print(sender: TObject;
  var Value: String);
begin
  if value  = '0.00' then value :='';
end;

procedure TqckRepMayorGeneral.QRDBText8Print(sender: TObject;
  var Value: String);
begin
  if value  = '0.00' then value :='';
end;

procedure TqckRepMayorGeneral.QRDBText3Print(sender: TObject;
  var Value: String);
begin
  if value  = '0.00' then value :='';
end;

procedure TqckRepMayorGeneral.QRDBText11Print(sender: TObject;
  var Value: String);
begin
  if value  = '0.00' then value :='';
end;

procedure TqckRepMayorGeneral.qrSubTotalDbCtaPrint(sender: TObject;
  var Value: String);
begin
  Value := InsertarComa(Format('%8.2f', [TotalDebitoDetalle]));
  if value  = '0.00' then value :='';
  if value  = '0' then value :='';
  TotalDebitoDetalle:= 0;
end;

procedure TqckRepMayorGeneral.qrSubTotalCrCtaPrint(sender: TObject;
  var Value: String);
begin
  Value := InsertarComa(Format('%8.2f', [TotalCreditoDetalle]));
  if value  = '0.00' then value :='';
  if value  = '0' then value :='';
  TotalCreditoDetalle := 0;
end;

procedure TqckRepMayorGeneral.QRExpr3Print(sender: TObject;
  var Value: String);
begin
  if value  = '0.00' then value :='';
end;

procedure TqckRepMayorGeneral.QRExpr4Print(sender: TObject;
  var Value: String);
begin
  if value  = '0.00' then value :='';
end;

procedure TqckRepMayorGeneral.QRLabel4Print(sender: TObject;
  var Value: String);
begin
  Value := 'Al Mes de '+FormatDateTime('mmmmm',GlbFechaInicial)+'`'+FormatDateTime('yyyy',GlbFechaInicial);
end;

procedure TqckRepMayorGeneral.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  {if dtmodrep.qryRepMayorGenDebito_cld.Value <> 0 then
  BalanceInicial:= dtmodrep.qryRepMayorGenDebito_cld.Value
  else
  BalanceInicial:= dtmodrep.qryRepMayorGenCredito_cld.Value;}
  BalanceInicial:= dtmodrep.qryRepMayorGenBLC_INI_CLD.Value;
  OrigenCta:= dtmodrep.qryRepMayorGenSIGNO_CTA.Value;
  PrintBand:=True;
end;

procedure TqckRepMayorGeneral.QRBand5BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
  var
    Resultado:Real;
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

procedure TqckRepMayorGeneral.QRSubDetail1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  if BandPrinted then
  begin
    TotalCreditoDetalle := TotalCreditoDetalle + dtmodrep.qryRepMayorGenDetCR_CLD.Value;
    TotalDebitoDetalle  := TotalDebitoDetalle  + dtmodrep.qryRepMayorGenDetDB_CLD.Value;
  end;
end;

procedure TqckRepMayorGeneral.QRDBText2Print(sender: TObject;
  var Value: String);
begin
  if dtModRep.qryRepMayorGenDetSTATUS.Value = 'C' then
  Value := '*** Cancelado *** ';
end;

procedure TqckRepMayorGeneral.qrTpaginasPrint(sender: TObject;
  var Value: String);
begin
  Value := ' de '+IntToStr(glbTPag);
end;

end.
