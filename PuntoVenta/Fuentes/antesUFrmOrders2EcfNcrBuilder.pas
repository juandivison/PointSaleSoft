unit UFrmOrders2EcfNcrBuilder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, CheckLst, StrUtils, DB,
  UNcrCliPayload;

type
  TfrmOrders2EcfNcrBuilder = class(TForm)
    pnlTop: TPanel;
    Label1: TLabel;
    edtRefNcf: TEdit;
    Label2: TLabel;
    cbReason: TComboBox;
    Label3: TLabel;
    rgScope: TRadioGroup;
    Label4: TLabel;
    dtpSourceDate: TDateTimePicker;
    Label5: TLabel;
    dtpIssueDate: TDateTimePicker;
    chkApplyItbis: TCheckBox;
    Label6: TLabel;
    edtDays: TEdit;
    lblThirtyRule: TLabel;
    pnlLineEditor: TPanel;
    Label7: TLabel;
    edtCode: TEdit;
    Label8: TLabel;
    edtDescription: TEdit;
    Label9: TLabel;
    edtQtyOrig: TEdit;
    Label10: TLabel;
    edtQtyNcr: TEdit;
    Label11: TLabel;
    edtPrice: TEdit;
    Label12: TLabel;
    edtItbis: TEdit;
    chkInclude: TCheckBox;
    chkReturnStock: TCheckBox;
    btnAddLine: TButton;
    btnUpdateLine: TButton;
    btnDeleteLine: TButton;
    btnClearEditor: TButton;
    lvItems: TListView;
    pnlBottom: TPanel;
    btnOk: TButton;
    btnCancel: TButton;
    btnSelectAll: TButton;
    btnUnselectAll: TButton;
    gbTotals: TGroupBox;
    Label13: TLabel;
    edtSubtotal: TEdit;
    Label14: TLabel;
    edtItbisTotal: TEdit;
    Label15: TLabel;
    edtGrandTotal: TEdit;
    Label16: TLabel;
    edtItemsCount: TEdit;
    memNotes: TMemo;
    Label17: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure dtpSourceDateChange(Sender: TObject);
    procedure dtpIssueDateChange(Sender: TObject);
    procedure rgScopeClick(Sender: TObject);
    procedure btnAddLineClick(Sender: TObject);
    procedure btnUpdateLineClick(Sender: TObject);
    procedure btnDeleteLineClick(Sender: TObject);
    procedure btnClearEditorClick(Sender: TObject);
    procedure lvItemsClick(Sender: TObject);
    procedure btnSelectAllClick(Sender: TObject);
    procedure btnUnselectAllClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    FRequestJsonPath: string;
    FSummaryText: string;
    procedure RecalcFiscalRule;
    procedure RecalcTotals;
    procedure LoadSelectedItemToEditor;
    procedure ClearEditor;
    procedure NormalizeScope;
    procedure SeedFromCurrentVenta;
    procedure AddPreloadedItem(const ACode, ADescription: string; const AQtyOrig, AQtyNcr,
      APrice, AItbisRate, ASourceSubtotal, ASourceItbis, ASourceTotal,
      ASourceDiscountAmount, ASourceDiscountPercent: Double; const AInclude,
      AReturnStock: Boolean; const ALineRef: string; const ATranspItbis: Integer);
    function HasCurrentVentaContext: Boolean;
    function CurrentLineTotal(const AQty, APrice, AItbis: Double): Currency;
    function Round2(const AValue: Double): Currency;
    procedure ComputeLineAmounts(const AItem: TListItem; const AQty, APrice,
      AItbis: Double; out ASubtotal, AItbisAmount, ATotal: Currency);
    function BuildRequestJson: string;
    function ValidateAndNormalize: Boolean;
    function SelectedReasonCode: Integer;
    function SelectedReasonText: string;
    function ItemAsBool(const S: string): Boolean;
    function GetSummaryText: string;
    function DeriveTaxRate(const AValorServicio, AItbiDet: Double; const AItbisExento: Integer): Double;
    function NormalizeTaxRate(const ARate: Double): Double;
    function SourceMaxRefundAmount: Currency;
    function CurrentRequestedRefundAmount: Currency;
    function SourceLineSubtotal(const AItem: TListItem): Currency;
    function SourceLineItbis(const AItem: TListItem): Currency;
    function SourceLineTotal(const AItem: TListItem): Currency;
    function SourceLineDiscountAmount(const AItem: TListItem): Currency;
    function SourceLineDiscountPercent(const AItem: TListItem): Double;
    function SourceLineQtyOrig(const AItem: TListItem): Double;
    function SourceLinePriceOrig(const AItem: TListItem): Double;
    function ItemLineRef(const AItem: TListItem): string;
    function ItemTranspItbis(const AItem: TListItem): Integer;
    function GetSubItemSafe(const AItem: TListItem; const AIndex: Integer; const ADefault: string = ''): string;
  public
    class function ExecuteNcr(AOwner: TComponent;
      const ARefNcf: string;
      const AReasonCode: Integer;
      const AReasonText: string;
      const ADefaultIssueDate: TDateTime;
      out ARequestJsonPath, ASummaryText: string): Boolean;
    class function ExecuteNcrFromCurrentVenta(AOwner: TComponent;
      const AReasonCode: Integer; const AReasonText: string;
      out ARequestJsonPath, ASummaryText: string): Boolean;
  end;

implementation

uses UDatModFactura;

{$R *.dfm}

const
  IDX_CODE            = 0;
  IDX_DESCRIPTION     = 1;
  IDX_QTY_ORIG        = 2;
  IDX_QTY_NCR         = 3;
  IDX_PRICE           = 4;
  IDX_TAX_RATE        = 5;
  IDX_RETURN_STOCK    = 6;
  IDX_LINE_TOTAL      = 7;
  IDX_SRC_SUBTOTAL    = 8;
  IDX_SRC_ITBIS       = 9;
  IDX_SRC_TOTAL       = 10;
  IDX_LINE_REF        = 11;
  IDX_TRANSP_ITBIS    = 12;
  IDX_SRC_DISC_AMT    = 13;
  IDX_SRC_DISC_PCT    = 14;
  IDX_SRC_QTY_FULL    = 15;
  IDX_SRC_PRICE_ORIG  = 16;

function _ExtractLeadingInt(const S: string): Integer;
var
  I: Integer;
  Digits: string;
begin
  Result := 0;
  Digits := '';
  for I := 1 to Length(S) do
  begin
    if S[I] in ['0'..'9'] then
      Digits := Digits + S[I]
    else if Digits <> '' then
      Break;
  end;
  if Digits <> '' then
    Result := StrToIntDef(Digits, 0);
end;

function _TryField(ADS: TDataSet; const AName: string): TField;
begin
  Result := nil;
  if ADS <> nil then
    Result := ADS.FindField(AName);
end;

function _FieldAsStringAny(ADS: TDataSet; const ANames: array of string; const ADefault: string): string;
var
  I: Integer;
  F: TField;
begin
  Result := ADefault;
  for I := Low(ANames) to High(ANames) do
  begin
    F := _TryField(ADS, ANames[I]);
    if F <> nil then
    begin
      if not F.IsNull then
        Result := Trim(F.AsString);
      Exit;
    end;
  end;
end;

function _FieldAsFloatAny(ADS: TDataSet; const ANames: array of string; const ADefault: Double): Double;
var
  I: Integer;
  F: TField;
begin
  Result := ADefault;
  for I := Low(ANames) to High(ANames) do
  begin
    F := _TryField(ADS, ANames[I]);
    if F <> nil then
    begin
      if not F.IsNull then
        Result := F.AsFloat;
      Exit;
    end;
  end;
end;

function _FieldAsDateAny(ADS: TDataSet; const ANames: array of string; const ADefault: TDateTime): TDateTime;
var
  I: Integer;
  F: TField;
begin
  Result := ADefault;
  for I := Low(ANames) to High(ANames) do
  begin
    F := _TryField(ADS, ANames[I]);
    if F <> nil then
    begin
      if not F.IsNull then
        Result := F.AsDateTime;
      Exit;
    end;
  end;
end;

class function TfrmOrders2EcfNcrBuilder.ExecuteNcr(AOwner: TComponent;
  const ARefNcf: string; const AReasonCode: Integer; const AReasonText: string;
  const ADefaultIssueDate: TDateTime; out ARequestJsonPath,
  ASummaryText: string): Boolean;
var
  F: TfrmOrders2EcfNcrBuilder;
  I: Integer;
begin
  Result := False;
  ARequestJsonPath := '';
  ASummaryText := '';
  F := TfrmOrders2EcfNcrBuilder.Create(AOwner);
  try
    F.edtRefNcf.Text := Trim(ARefNcf);
    F.dtpIssueDate.DateTime := ADefaultIssueDate;
    F.dtpSourceDate.DateTime := ADefaultIssueDate;
    F.RecalcFiscalRule;

    if AReasonCode > 0 then
    begin
      for I := 0 to F.cbReason.Items.Count - 1 do
      begin
        if _ExtractLeadingInt(F.cbReason.Items[I]) = AReasonCode then
        begin
          F.cbReason.ItemIndex := I;
          Break;
        end;
      end;
    end
    else if Trim(AReasonText) <> '' then
      F.cbReason.Text := AReasonText;

    if F.ShowModal = mrOk then
    begin
      ARequestJsonPath := F.FRequestJsonPath;
      ASummaryText := F.FSummaryText;
      Result := True;
    end;
  finally
    F.Free;
  end;
end;

class function TfrmOrders2EcfNcrBuilder.ExecuteNcrFromCurrentVenta(AOwner: TComponent;
  const AReasonCode: Integer; const AReasonText: string; out ARequestJsonPath,
  ASummaryText: string): Boolean;
var
  F: TfrmOrders2EcfNcrBuilder;
  I: Integer;
begin
  Result := False;
  ARequestJsonPath := '';
  ASummaryText := '';
  F := TfrmOrders2EcfNcrBuilder.Create(AOwner);
  try
    if not F.HasCurrentVentaContext then
      raise Exception.Create('No hay una factura seleccionada con detalle disponible para autocargar NCR.');

    F.SeedFromCurrentVenta;

    if AReasonCode > 0 then
      for I := 0 to F.cbReason.Items.Count - 1 do
        if _ExtractLeadingInt(F.cbReason.Items[I]) = AReasonCode then
        begin
          F.cbReason.ItemIndex := I;
          Break;
        end
    else if Trim(AReasonText) <> '' then
      F.cbReason.Text := AReasonText;

    if F.ShowModal = mrOk then
    begin
      ARequestJsonPath := F.FRequestJsonPath;
      ASummaryText := F.FSummaryText;
      Result := True;
    end;
  finally
    F.Free;
  end;
end;

function TfrmOrders2EcfNcrBuilder.NormalizeTaxRate(const ARate: Double): Double;
begin
  if Abs(ARate - 18) < 0.2 then Result := 18
  else if Abs(ARate - 16) < 0.2 then Result := 16
  else if Abs(ARate - 13) < 0.2 then Result := 13
  else if Abs(ARate - 11) < 0.2 then Result := 11
  else if Abs(ARate - 8) < 0.2 then Result := 8
  else if Abs(ARate) < 0.2 then Result := 0
  else Result := ARate;
end;

function TfrmOrders2EcfNcrBuilder.DeriveTaxRate(const AValorServicio,
  AItbiDet: Double; const AItbisExento: Integer): Double;
begin
  if (AItbisExento = 1) or (AItbiDet = 0) or (AValorServicio = 0) then
    Result := 0
  else
    Result := NormalizeTaxRate((AItbiDet / AValorServicio) * 100);
end;

function TfrmOrders2EcfNcrBuilder.GetSubItemSafe(const AItem: TListItem;
  const AIndex: Integer; const ADefault: string): string;
begin
  Result := ADefault;
  if (AItem <> nil) and (AIndex >= 0) and (AIndex < AItem.SubItems.Count) then
    Result := AItem.SubItems[AIndex];
end;

function TfrmOrders2EcfNcrBuilder.SourceLineSubtotal(const AItem: TListItem): Currency;
begin
  Result := StrToCurrDef(GetSubItemSafe(AItem, IDX_SRC_SUBTOTAL, '0'), 0);
end;

function TfrmOrders2EcfNcrBuilder.SourceLineItbis(const AItem: TListItem): Currency;
begin
  Result := StrToCurrDef(GetSubItemSafe(AItem, IDX_SRC_ITBIS, '0'), 0);
end;

function TfrmOrders2EcfNcrBuilder.SourceLineTotal(const AItem: TListItem): Currency;
begin
  Result := StrToCurrDef(GetSubItemSafe(AItem, IDX_SRC_TOTAL, '0'), 0);
end;

function TfrmOrders2EcfNcrBuilder.SourceLineDiscountAmount(const AItem: TListItem): Currency;
begin
  Result := StrToCurrDef(GetSubItemSafe(AItem, IDX_SRC_DISC_AMT, '0'), 0);
end;

function TfrmOrders2EcfNcrBuilder.SourceLineDiscountPercent(const AItem: TListItem): Double;
begin
  Result := StrToFloatDef(GetSubItemSafe(AItem, IDX_SRC_DISC_PCT, '0'), 0);
end;

function TfrmOrders2EcfNcrBuilder.SourceLineQtyOrig(const AItem: TListItem): Double;
begin
  Result := StrToFloatDef(GetSubItemSafe(AItem, IDX_SRC_QTY_FULL, GetSubItemSafe(AItem, IDX_QTY_ORIG, '0')), 0);
end;

function TfrmOrders2EcfNcrBuilder.SourceLinePriceOrig(const AItem: TListItem): Double;
begin
  Result := StrToFloatDef(GetSubItemSafe(AItem, IDX_SRC_PRICE_ORIG, GetSubItemSafe(AItem, IDX_PRICE, '0')), 0);
end;

function TfrmOrders2EcfNcrBuilder.ItemLineRef(const AItem: TListItem): string;
begin
  Result := GetSubItemSafe(AItem, IDX_LINE_REF, '');
end;

function TfrmOrders2EcfNcrBuilder.ItemTranspItbis(const AItem: TListItem): Integer;
begin
  Result := StrToIntDef(GetSubItemSafe(AItem, IDX_TRANSP_ITBIS, '1'), 1);
end;

procedure TfrmOrders2EcfNcrBuilder.AddPreloadedItem(const ACode,
  ADescription: string; const AQtyOrig, AQtyNcr, APrice, AItbisRate,
  ASourceSubtotal, ASourceItbis, ASourceTotal, ASourceDiscountAmount,
  ASourceDiscountPercent: Double; const AInclude, AReturnStock: Boolean;
  const ALineRef: string; const ATranspItbis: Integer);
var
  It: TListItem;
  LSubtotal, LItbis, LTotal: Currency;
begin
  It := lvItems.Items.Add;
  if AInclude then
    It.Caption := 'SI'
  else
    It.Caption := 'NO';
  It.SubItems.Add(Trim(ACode));
  It.SubItems.Add(Trim(ADescription));
  It.SubItems.Add(FloatToStr(AQtyOrig));
  It.SubItems.Add(FloatToStr(AQtyNcr));
  It.SubItems.Add(FloatToStr(APrice));
  It.SubItems.Add(FloatToStr(AItbisRate));
  if AReturnStock then
    It.SubItems.Add('SI')
  else
    It.SubItems.Add('NO');
  It.SubItems.Add('0.00');
  It.SubItems.Add(FormatFloat('0.00', ASourceSubtotal));
  It.SubItems.Add(FormatFloat('0.00', ASourceItbis));
  It.SubItems.Add(FormatFloat('0.00', ASourceTotal));
  It.SubItems.Add(Trim(ALineRef));
  It.SubItems.Add(IntToStr(ATranspItbis));
  It.SubItems.Add(FormatFloat('0.00', ASourceDiscountAmount));
  It.SubItems.Add(FormatFloat('0.0000', ASourceDiscountPercent));
  It.SubItems.Add(FormatFloat('0.0000', AQtyOrig));
  It.SubItems.Add(FormatFloat('0.0000', APrice));

  ComputeLineAmounts(It, AQtyNcr, APrice, AItbisRate, LSubtotal, LItbis, LTotal);
  It.SubItems[IDX_LINE_TOTAL] := FormatFloat('0.00', LTotal);
end;

function TfrmOrders2EcfNcrBuilder.HasCurrentVentaContext: Boolean;
begin
  Result := Assigned(dmFactura) and
            Assigned(dmFactura.qryVentaFactura) and
            (not dmFactura.qryVentaFactura.IsEmpty) and
            Assigned(dmFactura.qryVentaFacturaDet) and
            (not dmFactura.qryVentaFacturaDet.IsEmpty);
end;

procedure TfrmOrders2EcfNcrBuilder.SeedFromCurrentVenta;
var
  SavePos: TBookmark;
  DS, DSD: TDataSet;
  RefNcf, TipoNcf, Desc, Cod, LineRef: string;
  Qty, Price, ItbisRate: Double;
  SourceDate: TDateTime;
  SourceSubtotal, SourceItbis, SourceTotal, SourceDiscountAmount, SourceDiscountPercent: Double;
  ItbisExento, TranspItbis: Integer;
begin
  if not HasCurrentVentaContext then
    Exit;

  DS := dmFactura.qryVentaFactura;
  DSD := dmFactura.qryVentaFacturaDet;

  RefNcf := _FieldAsStringAny(DS, ['NUMERO_NCF', 'NCF', 'E_NCF'], '');
  TipoNcf := UpperCase(_FieldAsStringAny(DS, ['TIPO_NCF'], ''));
  SourceDate := _FieldAsDateAny(DS, ['FECHA'], Date);

  edtRefNcf.Text := RefNcf;
  dtpSourceDate.DateTime := SourceDate;
  dtpIssueDate.DateTime := Date;
  memNotes.Lines.Clear;
  memNotes.Lines.Add('Factura origen TRN: ' + _FieldAsStringAny(DS, ['NUMERO'], ''));
  memNotes.Lines.Add('Factura origen No.: ' + _FieldAsStringAny(DS, ['NUMERO_FACTURA','NUMEROFACTURA'], ''));
  if TipoNcf <> '' then
    memNotes.Lines.Add('Tipo origen: ' + TipoNcf);
  memNotes.Lines.Add('TODO Expert: no controlar remanente por cantidad; controlar solo que el monto NCR no exceda el monto de la factura origen.');

  lvItems.Items.BeginUpdate;
  try
    lvItems.Items.Clear;
    SavePos := DSD.GetBookmark;
    try
      DSD.First;
      while not DSD.Eof do
      begin
        Cod := _FieldAsStringAny(DSD, ['CODIGO_PROD'], '');
        Desc := _FieldAsStringAny(DSD, ['DESCRIPCIONPRODUCTO', 'DESCRIPCION', 'DescripcionAdicional'], Cod);
        Qty := _FieldAsFloatAny(DSD, ['CANTIDAD'], 0);
        Price := _FieldAsFloatAny(DSD, ['PRECIO', 'Precio'], 0);
        SourceSubtotal := Abs(_FieldAsFloatAny(DSD, ['VALOR_SERVICIO_DET'], 0));
        SourceItbis := Abs(_FieldAsFloatAny(DSD, ['ITBI_DET'], 0));
        SourceTotal := Abs(_FieldAsFloatAny(DSD, ['VALOR_TOTAL_DET'], 0));
        SourceDiscountAmount := Abs(_FieldAsFloatAny(DSD, ['MONTO_DESC_ITEM', 'monto_desc_item'], 0));
        SourceDiscountPercent := _FieldAsFloatAny(DSD, ['PORC_DESC_ITEM', 'porc_desc_item'], 0);
        ItbisExento := Round(_FieldAsFloatAny(DSD, ['ITBIS_EXENTO'], 0));
        ItbisRate := DeriveTaxRate(SourceSubtotal, SourceItbis, ItbisExento);
        LineRef := _FieldAsStringAny(DSD, ['SERIE'], '');
        TranspItbis := Round(_FieldAsFloatAny(DSD, ['TRANSP_ITBIS'], 1));
        AddPreloadedItem(Cod, Desc, Qty, Qty, Price, ItbisRate,
          SourceSubtotal, SourceItbis, SourceTotal, SourceDiscountAmount,
          SourceDiscountPercent, True, True, LineRef, TranspItbis);
        DSD.Next;
      end;
    finally
      if DSD.BookmarkValid(SavePos) then
        DSD.GotoBookmark(SavePos);
      DSD.FreeBookmark(SavePos);
    end;
  finally
    lvItems.Items.EndUpdate;
  end;

  if lvItems.Items.Count > 0 then
  begin
    rgScope.ItemIndex := 1;
    NormalizeScope;
  end;

  RecalcFiscalRule;
  RecalcTotals;
end;

procedure TfrmOrders2EcfNcrBuilder.FormCreate(Sender: TObject);
begin
  Caption := 'Diseñador NCR para Orders2Ecf.Cli';
  cbReason.Items.Clear;
  cbReason.Items.Add('1 - Anulacion total');
  cbReason.Items.Add('2 - Corrige texto');
  cbReason.Items.Add('3 - Corrige montos');
  cbReason.ItemIndex := 0;
  rgScope.ItemIndex := 1;
  dtpIssueDate.Date := Date;
  dtpSourceDate.Date := Date;
  edtDays.ReadOnly := True;
  chkApplyItbis.Enabled := False;
  lblThirtyRule.Visible := False;
  lvItems.ViewStyle := vsReport;
  lvItems.ReadOnly := True;
  lvItems.RowSelect := True;
  lvItems.HideSelection := False;
  ClearEditor;
  RecalcFiscalRule;
  RecalcTotals;
end;

procedure TfrmOrders2EcfNcrBuilder.RecalcFiscalRule;
var
  Days: Integer;
begin
  Days := Trunc(dtpIssueDate.Date) - Trunc(dtpSourceDate.Date);
  edtDays.Text := IntToStr(Days);
  chkApplyItbis.Checked := Days <= 30;
  lblThirtyRule.Visible := not chkApplyItbis.Checked;
  if not chkApplyItbis.Checked then
    lblThirtyRule.Caption := 'Regla > 30 días activa: ITBIS = 0 en la NCR.';
  RecalcTotals;
end;

procedure TfrmOrders2EcfNcrBuilder.dtpSourceDateChange(Sender: TObject);
begin
  RecalcFiscalRule;
end;

procedure TfrmOrders2EcfNcrBuilder.dtpIssueDateChange(Sender: TObject);
begin
  RecalcFiscalRule;
end;

procedure TfrmOrders2EcfNcrBuilder.NormalizeScope;
var
  I: Integer;
  It: TListItem;
begin
  if rgScope.ItemIndex <> 0 then
    Exit;

  for I := 0 to lvItems.Items.Count - 1 do
  begin
    It := lvItems.Items[I];
    It.Caption := 'SI';
    It.SubItems[IDX_QTY_NCR] := It.SubItems[IDX_QTY_ORIG];
  end;
end;

procedure TfrmOrders2EcfNcrBuilder.rgScopeClick(Sender: TObject);
begin
  NormalizeScope;
  RecalcTotals;
end;

procedure TfrmOrders2EcfNcrBuilder.ClearEditor;
begin
  edtCode.Text := '';
  edtDescription.Text := '';
  edtQtyOrig.Text := '1';
  edtQtyNcr.Text := '1';
  edtPrice.Text := '0';
  edtItbis.Text := '18';
  chkInclude.Checked := True;
  chkReturnStock.Checked := True;
  edtCode.SetFocus;
end;

function TfrmOrders2EcfNcrBuilder.Round2(const AValue: Double): Currency;
begin
  if AValue >= 0 then
    Result := Trunc((AValue * 100) + 0.5) / 100
  else
    Result := Trunc((AValue * 100) - 0.5) / 100;
end;

procedure TfrmOrders2EcfNcrBuilder.ComputeLineAmounts(const AItem: TListItem;
  const AQty, APrice, AItbis: Double; out ASubtotal, AItbisAmount,
  ATotal: Currency);
var
  SrcSubtotal, SrcItbis, SrcTotal: Currency;
  SrcDiscAmt: Currency;
  SrcDiscPct, SrcQtyOrig, SrcPriceOrig: Double;
  SameQty, SamePrice: Boolean;
  GrossAmount, DiscountAmount, GrossAfterDiscount: Double;
  TranspItbis: Integer;
begin
  ASubtotal := 0;
  AItbisAmount := 0;
  ATotal := 0;

  if AItem <> nil then
  begin
    SrcSubtotal := SourceLineSubtotal(AItem);
    SrcItbis := SourceLineItbis(AItem);
    SrcTotal := SourceLineTotal(AItem);
    SrcDiscAmt := SourceLineDiscountAmount(AItem);
    SrcDiscPct := SourceLineDiscountPercent(AItem);
    SrcQtyOrig := SourceLineQtyOrig(AItem);
    SrcPriceOrig := SourceLinePriceOrig(AItem);
    TranspItbis := ItemTranspItbis(AItem);

    SameQty := Abs(AQty - SrcQtyOrig) < 0.0001;
    SamePrice := Abs(APrice - SrcPriceOrig) < 0.0001;

    if SameQty and SamePrice and ((SrcTotal > 0) or (SrcSubtotal > 0)) then
    begin
      ASubtotal := Round2(SrcSubtotal);
      if chkApplyItbis.Checked then
      begin
        AItbisAmount := Round2(SrcItbis);
        ATotal := Round2(SrcTotal);
      end
      else
      begin
        AItbisAmount := 0;
        ATotal := Round2(SrcSubtotal);
      end;
      Exit;
    end;
  end
  else
  begin
    SrcDiscAmt := 0;
    SrcDiscPct := 0;
    SrcQtyOrig := AQty;
    SrcPriceOrig := APrice;
    TranspItbis := 0;
  end;

  GrossAmount := AQty * APrice;

  if SrcDiscPct > 0 then
    DiscountAmount := GrossAmount * (SrcDiscPct / 100)
  else if (SrcDiscAmt > 0) and (SrcQtyOrig > 0) and (Abs(APrice - SrcPriceOrig) < 0.0001) then
    DiscountAmount := (SrcDiscAmt / SrcQtyOrig) * AQty
  else
    DiscountAmount := 0;

  DiscountAmount := Round2(DiscountAmount);
  GrossAfterDiscount := GrossAmount - DiscountAmount;

  if chkApplyItbis.Checked then
  begin
    if (TranspItbis = 1) and (AItbis > 0) then
    begin
      ASubtotal := Round2(GrossAfterDiscount / (1 + (AItbis / 100)));
      AItbisAmount := Round2(GrossAfterDiscount - ASubtotal);
      ATotal := Round2(ASubtotal + AItbisAmount);
    end
    else
    begin
      ASubtotal := Round2(GrossAfterDiscount);
      AItbisAmount := Round2(ASubtotal * (AItbis / 100));
      ATotal := Round2(ASubtotal + AItbisAmount);
    end;
  end
  else
  begin
    if (TranspItbis = 1) and (AItbis > 0) then
      ASubtotal := Round2(GrossAfterDiscount / (1 + (AItbis / 100)))
    else
      ASubtotal := Round2(GrossAfterDiscount);

    AItbisAmount := 0;
    ATotal := Round2(ASubtotal);
  end;
end;

function TfrmOrders2EcfNcrBuilder.CurrentLineTotal(const AQty, APrice,
  AItbis: Double): Currency;
var
  LSubtotal, LItbis, LTotal: Currency;
begin
  ComputeLineAmounts(nil, AQty, APrice, AItbis, LSubtotal, LItbis, LTotal);
  Result := LTotal;
end;

procedure TfrmOrders2EcfNcrBuilder.btnAddLineClick(Sender: TObject);
var
  It: TListItem;
  QtyOrig, QtyNcr, Price, Itbis: Double;
begin
  QtyOrig := StrToFloatDef(Trim(edtQtyOrig.Text), 0);
  QtyNcr := StrToFloatDef(Trim(edtQtyNcr.Text), 0);
  Price := StrToFloatDef(Trim(edtPrice.Text), 0);
  Itbis := StrToFloatDef(Trim(edtItbis.Text), 0);

  if Trim(edtCode.Text) = '' then
    raise Exception.Create('Debe indicar el código del ítem.');
  if Trim(edtDescription.Text) = '' then
    raise Exception.Create('Debe indicar la descripción del ítem.');
  if QtyOrig <= 0 then
    raise Exception.Create('La cantidad original debe ser mayor que cero.');
  if QtyNcr <= 0 then
    raise Exception.Create('La cantidad NCR debe ser mayor que cero.');
  if Price < 0 then
    raise Exception.Create('El precio no puede ser negativo.');

  It := lvItems.Items.Add;
  if chkInclude.Checked then
    It.Caption := 'SI'
  else
    It.Caption := 'NO';
  It.SubItems.Add(Trim(edtCode.Text));
  It.SubItems.Add(Trim(edtDescription.Text));
  It.SubItems.Add(FloatToStr(QtyOrig));
  It.SubItems.Add(FloatToStr(QtyNcr));
  It.SubItems.Add(FloatToStr(Price));
  It.SubItems.Add(FloatToStr(Itbis));
  if chkReturnStock.Checked then
    It.SubItems.Add('SI')
  else
    It.SubItems.Add('NO');
  It.SubItems.Add(FormatFloat('0.00', CurrentLineTotal(QtyNcr, Price, Itbis)));
  It.SubItems.Add('0.00');
  It.SubItems.Add('0.00');
  It.SubItems.Add('0.00');
  It.SubItems.Add('');
  It.SubItems.Add('1');
  It.SubItems.Add('0.00');
  It.SubItems.Add('0.0000');
  It.SubItems.Add(FloatToStr(QtyOrig));
  It.SubItems.Add(FloatToStr(Price));

  NormalizeScope;
  RecalcTotals;
  ClearEditor;
end;

procedure TfrmOrders2EcfNcrBuilder.LoadSelectedItemToEditor;
var
  It: TListItem;
begin
  It := lvItems.Selected;
  if It = nil then
    Exit;
  chkInclude.Checked := SameText(It.Caption, 'SI');
  edtCode.Text := GetSubItemSafe(It, IDX_CODE);
  edtDescription.Text := GetSubItemSafe(It, IDX_DESCRIPTION);
  edtQtyOrig.Text := GetSubItemSafe(It, IDX_QTY_ORIG, '1');
  edtQtyNcr.Text := GetSubItemSafe(It, IDX_QTY_NCR, '1');
  edtPrice.Text := GetSubItemSafe(It, IDX_PRICE, '0');
  edtItbis.Text := GetSubItemSafe(It, IDX_TAX_RATE, '0');
  chkReturnStock.Checked := SameText(GetSubItemSafe(It, IDX_RETURN_STOCK), 'SI');
end;

procedure TfrmOrders2EcfNcrBuilder.lvItemsClick(Sender: TObject);
begin
  LoadSelectedItemToEditor;
end;

procedure TfrmOrders2EcfNcrBuilder.btnUpdateLineClick(Sender: TObject);
var
  It: TListItem;
  QtyOrig, QtyNcr, Price, Itbis: Double;
begin
  It := lvItems.Selected;
  if It = nil then
    raise Exception.Create('Debe seleccionar una línea para actualizar.');

  QtyOrig := StrToFloatDef(Trim(edtQtyOrig.Text), 0);
  QtyNcr := StrToFloatDef(Trim(edtQtyNcr.Text), 0);
  Price := StrToFloatDef(Trim(edtPrice.Text), 0);
  Itbis := StrToFloatDef(Trim(edtItbis.Text), 0);

  if QtyOrig <= 0 then
    raise Exception.Create('La cantidad original debe ser mayor que cero.');
  if QtyNcr <= 0 then
    raise Exception.Create('La cantidad NCR debe ser mayor que cero.');
  if Price < 0 then
    raise Exception.Create('El precio no puede ser negativo.');

  if chkInclude.Checked then
    It.Caption := 'SI'
  else
    It.Caption := 'NO';
  It.SubItems[IDX_CODE] := Trim(edtCode.Text);
  It.SubItems[IDX_DESCRIPTION] := Trim(edtDescription.Text);
  It.SubItems[IDX_QTY_ORIG] := FloatToStr(QtyOrig);
  It.SubItems[IDX_QTY_NCR] := FloatToStr(QtyNcr);
  It.SubItems[IDX_PRICE] := FloatToStr(Price);
  It.SubItems[IDX_TAX_RATE] := FloatToStr(Itbis);
  if chkReturnStock.Checked then
    It.SubItems[IDX_RETURN_STOCK] := 'SI'
  else
    It.SubItems[IDX_RETURN_STOCK] := 'NO';
  It.SubItems[IDX_LINE_TOTAL] := FormatFloat('0.00', CurrentLineTotal(QtyNcr, Price, Itbis));
  if GetSubItemSafe(It, IDX_SRC_QTY_FULL, '') = '' then
    It.SubItems[IDX_SRC_QTY_FULL] := FloatToStr(QtyOrig);
  if GetSubItemSafe(It, IDX_SRC_PRICE_ORIG, '') = '' then
    It.SubItems[IDX_SRC_PRICE_ORIG] := FloatToStr(Price);

  NormalizeScope;
  RecalcTotals;
end;

procedure TfrmOrders2EcfNcrBuilder.btnDeleteLineClick(Sender: TObject);
begin
  if lvItems.Selected <> nil then
    lvItems.Selected.Delete;
  RecalcTotals;
end;

procedure TfrmOrders2EcfNcrBuilder.btnClearEditorClick(Sender: TObject);
begin
  ClearEditor;
end;

procedure TfrmOrders2EcfNcrBuilder.btnSelectAllClick(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to lvItems.Items.Count - 1 do
    lvItems.Items[I].Caption := 'SI';
  RecalcTotals;
end;

procedure TfrmOrders2EcfNcrBuilder.btnUnselectAllClick(Sender: TObject);
var
  I: Integer;
begin
  if rgScope.ItemIndex = 0 then
    raise Exception.Create('En alcance Total no puede desmarcar todos los ítems.');

  for I := 0 to lvItems.Items.Count - 1 do
    lvItems.Items[I].Caption := 'NO';
  RecalcTotals;
end;

function TfrmOrders2EcfNcrBuilder.ItemAsBool(const S: string): Boolean;
begin
  Result := SameText(Trim(S), 'SI') or SameText(Trim(S), 'TRUE') or (Trim(S) = '1');
end;

function TfrmOrders2EcfNcrBuilder.SourceMaxRefundAmount: Currency;
var
  I: Integer;
  It: TListItem;
begin
  Result := 0;
  for I := 0 to lvItems.Items.Count - 1 do
  begin
    It := lvItems.Items[I];
    if chkApplyItbis.Checked then
      Result := Result + SourceLineTotal(It)
    else
      Result := Result + SourceLineSubtotal(It);
  end;
end;

function TfrmOrders2EcfNcrBuilder.CurrentRequestedRefundAmount: Currency;
begin
  Result := StrToCurrDef(Trim(edtGrandTotal.Text), 0);
end;

procedure TfrmOrders2EcfNcrBuilder.RecalcTotals;
var
  I: Integer;
  It: TListItem;
  Qty, Price, Itbis: Double;
  Subtotal, ItbisTotal, GrandTotal: Currency;
  LineSubtotal, LineItbis, LineTotal: Currency;
  Included: Integer;
begin
  Subtotal := 0;
  ItbisTotal := 0;
  GrandTotal := 0;
  Included := 0;

  for I := 0 to lvItems.Items.Count - 1 do
  begin
    It := lvItems.Items[I];
    if ItemAsBool(It.Caption) then
    begin
      Inc(Included);
      Qty := StrToFloatDef(GetSubItemSafe(It, IDX_QTY_NCR, '0'), 0);
      Price := StrToFloatDef(GetSubItemSafe(It, IDX_PRICE, '0'), 0);
      Itbis := StrToFloatDef(GetSubItemSafe(It, IDX_TAX_RATE, '0'), 0);
      ComputeLineAmounts(It, Qty, Price, Itbis, LineSubtotal, LineItbis, LineTotal);
      Subtotal := Subtotal + LineSubtotal;
      ItbisTotal := ItbisTotal + LineItbis;
      It.SubItems[IDX_LINE_TOTAL] := FormatFloat('0.00', LineTotal);
    end
    else
      It.SubItems[IDX_LINE_TOTAL] := '0.00';
  end;

  GrandTotal := Round2(Subtotal + ItbisTotal);
  edtSubtotal.Text := FormatFloat('0.00', Subtotal);
  edtItbisTotal.Text := FormatFloat('0.00', ItbisTotal);
  edtGrandTotal.Text := FormatFloat('0.00', GrandTotal);
  edtItemsCount.Text := IntToStr(Included);
end;

function TfrmOrders2EcfNcrBuilder.SelectedReasonCode: Integer;
begin
  Result := _ExtractLeadingInt(cbReason.Text);
end;

function TfrmOrders2EcfNcrBuilder.SelectedReasonText: string;
begin
  Result := Trim(cbReason.Text);
end;

function TfrmOrders2EcfNcrBuilder.ValidateAndNormalize: Boolean;
var
  Included: Integer;
  I: Integer;
  ReqAmount, MaxAmount: Currency;
begin
  Result := False;
  if Trim(edtRefNcf.Text) = '' then
    raise Exception.Create('Debe indicar el e-NCF a modificar.');
  if SelectedReasonCode <= 0 then
    raise Exception.Create('Debe indicar el motivo NCR.');
  if lvItems.Items.Count = 0 then
    raise Exception.Create('Debe agregar por lo menos una línea a la NCR.');

  NormalizeScope;
  RecalcTotals;
  Included := StrToIntDef(Trim(edtItemsCount.Text), 0);
  if Included <= 0 then
    raise Exception.Create('Debe incluir al menos una línea.');

  for I := 0 to lvItems.Items.Count - 1 do
  begin
    if ItemAsBool(lvItems.Items[I].Caption) then
    begin
      if StrToFloatDef(GetSubItemSafe(lvItems.Items[I], IDX_QTY_NCR, '0'), 0) <= 0 then
        raise Exception.Create('Existe una línea incluida con cantidad NCR inválida.');
      if StrToFloatDef(GetSubItemSafe(lvItems.Items[I], IDX_PRICE, '0'), 0) < 0 then
        raise Exception.Create('Existe una línea incluida con precio negativo.');
    end;
  end;

  ReqAmount := CurrentRequestedRefundAmount;
  MaxAmount := SourceMaxRefundAmount;
  if (MaxAmount > 0) and (ReqAmount - MaxAmount > 0.009) then
    raise Exception.CreateFmt('La NCR no puede exceder el monto de la factura modificada. Solicitado: %s. Máximo permitido: %s.',
      [FormatFloat('0.00', ReqAmount), FormatFloat('0.00', MaxAmount)]);

  Result := True;
end;

function TfrmOrders2EcfNcrBuilder.BuildRequestJson: string;
var
  SL: TStringList;
  I: Integer;
  It: TListItem;
  FirstItem: Boolean;
  QtyOrig, QtyNcr, Price, Itbis, DiscPct: Double;
  DiscAmt: Currency;
  SamePriceAsSource: Boolean;
begin
  SL := TStringList.Create;
  try
    SL.Add('{');
    SL.Add('  "version": 1,');
    SL.Add('  "kind": "credit-note",');
    SL.Add('  "referenceNcf": "' + TNcrCliPayload.JsonEscape(Trim(edtRefNcf.Text)) + '",');
    SL.Add('  "reasonCode": "' + TNcrCliPayload.JsonEscape(IntToStr(SelectedReasonCode)) + '",');
    SL.Add('  "reasonText": "' + TNcrCliPayload.JsonEscape(SelectedReasonText) + '",');
    SL.Add('  "issueDate": "' + FormatDateTime('yyyy-mm-dd', dtpIssueDate.Date) + '",');
    if rgScope.ItemIndex = 0 then
      SL.Add('  "partial": false,')
    else
      SL.Add('  "partial": true,');
    SL.Add('  "appliesItbis": ' + TNcrCliPayload.BoolToJson(chkApplyItbis.Checked) + ',');
    SL.Add('  "daysElapsed": ' + IntToStr(StrToIntDef(edtDays.Text, 0)) + ',');
    SL.Add('  "currency": "DOP",');
    SL.Add('  "outputCurrency": "DOP",');
    SL.Add('  "maxRefundAmount": ' + TNcrCliPayload.CurrencyToJson(SourceMaxRefundAmount) + ',');
    SL.Add('  "requestedRefundAmount": ' + TNcrCliPayload.CurrencyToJson(CurrentRequestedRefundAmount) + ',');
    SL.Add('  "documentLabel": "NOTA DE CREDITO",');
    SL.Add('  "notes": "' + TNcrCliPayload.JsonEscape(Trim(memNotes.Text)) + '",');
    SL.Add('  "sourceIssueDate": "' + FormatDateTime('yyyy-mm-dd', dtpSourceDate.Date) + '",');
    SL.Add('  "lines": [');

    FirstItem := True;
    for I := 0 to lvItems.Items.Count - 1 do
    begin
      It := lvItems.Items[I];
      if not ItemAsBool(It.Caption) then
        Continue;

      QtyOrig := StrToFloatDef(GetSubItemSafe(It, IDX_QTY_ORIG, '0'), 0);
      QtyNcr := StrToFloatDef(GetSubItemSafe(It, IDX_QTY_NCR, '0'), 0);
      Price := StrToFloatDef(GetSubItemSafe(It, IDX_PRICE, '0'), 0);
      Itbis := StrToFloatDef(GetSubItemSafe(It, IDX_TAX_RATE, '0'), 0);
      DiscPct := SourceLineDiscountPercent(It);
      SamePriceAsSource := Abs(Price - SourceLinePriceOrig(It)) < 0.0001;
      if SamePriceAsSource then
        DiscAmt := SourceLineDiscountAmount(It)
      else
        DiscAmt := 0;

      if not FirstItem then
        SL[SL.Count - 1] := SL[SL.Count - 1] + ',';

      SL.Add('    {');
      SL.Add('      "lineRef": ' + IntToStr(_ExtractLeadingInt(ItemLineRef(It))) + ',');
      SL.Add('      "code": "' + TNcrCliPayload.JsonEscape(GetSubItemSafe(It, IDX_CODE)) + '",');
      SL.Add('      "description": "' + TNcrCliPayload.JsonEscape(GetSubItemSafe(It, IDX_DESCRIPTION)) + '",');
      SL.Add('      "qtyOriginal": ' + TNcrCliPayload.FloatToJson(QtyOrig) + ',');
      SL.Add('      "qtyNcr": ' + TNcrCliPayload.FloatToJson(QtyNcr) + ',');
      SL.Add('      "unitPrice": ' + TNcrCliPayload.FloatToJson(Price) + ',');
      SL.Add('      "sourceSubtotal": ' + TNcrCliPayload.CurrencyToJson(SourceLineSubtotal(It)) + ',');
      SL.Add('      "sourceItbis": ' + TNcrCliPayload.CurrencyToJson(SourceLineItbis(It)) + ',');
      SL.Add('      "sourceTotal": ' + TNcrCliPayload.CurrencyToJson(SourceLineTotal(It)) + ',');
      SL.Add('      "discountPercent": ' + TNcrCliPayload.FloatToJson(DiscPct) + ',');
      SL.Add('      "discountAmount": ' + TNcrCliPayload.CurrencyToJson(DiscAmt) + ',');
      SL.Add('      "taxRate": ' + TNcrCliPayload.FloatToJson(Itbis) + ',');
      SL.Add('      "itbisExempt": ' + TNcrCliPayload.BoolToJson(Itbis <= 0.0001) + ',');
      SL.Add('      "transpItbis": ' + TNcrCliPayload.BoolToJson(ItemTranspItbis(It) = 1) + ',');
      SL.Add('      "returnMerchandise": ' + TNcrCliPayload.BoolToJson(ItemAsBool(GetSubItemSafe(It, IDX_RETURN_STOCK))));
      SL.Add('    }');
      FirstItem := False;
    end;

    SL.Add('  ],');
    SL.Add('  "totals": {');
    SL.Add('    "subtotal": ' + TNcrCliPayload.CurrencyToJson(StrToCurrDef(edtSubtotal.Text, 0)) + ',');
    SL.Add('    "itbis": ' + TNcrCliPayload.CurrencyToJson(StrToCurrDef(edtItbisTotal.Text, 0)) + ',');
    SL.Add('    "total": ' + TNcrCliPayload.CurrencyToJson(StrToCurrDef(edtGrandTotal.Text, 0)));
    SL.Add('  }');
    SL.Add('}');
    Result := SL.Text;
  finally
    SL.Free;
  end;
end;

procedure TfrmOrders2EcfNcrBuilder.btnOkClick(Sender: TObject);
var
  JsonText: string;
begin
  if not ValidateAndNormalize then
    Exit;

  JsonText := BuildRequestJson;
  FRequestJsonPath := TNcrCliPayload.SaveJsonToTempFile('orders2ecf_ncr', JsonText);
  FSummaryText := GetSummaryText;
  ModalResult := mrOk;
end;

function TfrmOrders2EcfNcrBuilder.GetSummaryText: string;
var
  ScopeText: string;
  I: Integer;
  IncludedCount: Integer;
  IncludeText: string;
  Item: TListItem;
begin
  if rbTotal.Checked then
    ScopeText := 'Total'
  else
    ScopeText := 'Parcial';

  IncludedCount := 0;
  for I := 0 to lvItems.Items.Count - 1 do
  begin
    Item := lvItems.Items[I];

    if SameText(Trim(Item.Caption), 'SI') then
      Inc(IncludedCount)
    else if (Item.SubItems.Count > 0) and SameText(Trim(Item.SubItems[0]), 'SI') then
      Inc(IncludedCount);
  end;

  if chkApplyItbis.Checked then
    IncludeText := 'Con ITBIS'
  else
    IncludeText := 'Sin ITBIS (>30 días)';

  Result :=
    'Ref=' + Trim(edtRefNcf.Text) +
    '; Motivo=' + IntToStr(SelectedReasonCode) + ' - ' + Trim(SelectedReasonText) +
    '; Alcance=' + ScopeText +
    '; FechaOrigen=' + FormatDateTime('yyyy-mm-dd', dtpOriginDate.Date) +
    '; FechaNCR=' + FormatDateTime('yyyy-mm-dd', dtpIssueDate.Date) +
    '; Dias=' + Trim(edtDaysElapsed.Text) +
    '; Itbis=' + IncludeText +
    '; Incluidos=' + IntToStr(IncludedCount) +
    '; Solicitado=' + FormatFloat('0.00', CurrentRequestedRefundAmount) +
    '; Max=' + FormatFloat('0.00', SourceMaxRefundAmount);
end;
end.
