unit UFrmOrders2EcfNcrBuilder;

interface
                
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, CheckLst, StrUtils, DB, DBGrids,
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
    procedure cbReasonChange(Sender: TObject);
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
    FSourceMaxSubtotal: Currency;
    FSourceMaxTotal: Currency;
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
    function GetReferenceTipoEcf: string;
    function GetReferenceSaleCondition: string;
    function GetReferenceCurrency: string;
    function GetReferenceOutputCurrency: string;
    function GetReferenceExchangeRate: Double;
    function GetCustomerRnc: string;
    function GetCustomerName: string;
    function GetCustomerCity: string;
    function GetCustomerAddress: string;
    function GetCustomerMunicipioCode: string;
    function GetCustomerProvinciaCode: string;
    function GetCurrentMasterDataSet: TDataSet;
    function GetCurrentCustomerCode: Integer;
    function LocateCurrentCustomer(out AClientes: TDataSet): Boolean;
    function GetSubItemSafe(const AItem: TListItem; const AIndex: Integer; const ADefault: string = ''): string;
  public
    class function ExecuteNcr(AOwner: TComponent;
      const ARefNcf: string;
      const AReasonCode: Integer;
      const AReasonText: string;
      const ADefaultIssueDate: TDateTime;
      out ARequestJsonPath, ASummaryText: string): Boolean;
    class function ExecuteNcrFromCurrentVenta(AOwner: TComponent;
    const AExpectedRefNcf: string;
    const AReasonCode: Integer; const AReasonText: string;
    out ARequestJsonPath, ASummaryText: string): Boolean;
  end;

implementation

uses UDatModFactura, UDatModClientes;

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

function _OnlyDigits(const S: string): string;
var
  I: Integer;
begin
  Result := '';
  for I := 1 to Length(S) do
    if S[I] in ['0'..'9'] then
      Result := Result + S[I];
end;

procedure TfrmOrders2EcfNcrBuilder.cbReasonChange(Sender: TObject);
begin
  // Motivo 1 = Anulación total: fuerza alcance total.
  if SelectedReasonCode = 1 then
  begin
    rgScope.ItemIndex := 0;
  end
  else
  begin
    // Motivos distintos de anulación total permiten parcial.
    // Para motivo 3 - Corrige montos, por defecto parcial.
    if SelectedReasonCode = 3 then
      rgScope.ItemIndex := 1;
  end;

  NormalizeScope;
  RecalcTotals;
end;
function _NormalizeGeoCode6(const S: string): string;
var
  Digits: string;
begin
  Digits := _OnlyDigits(Trim(S));
  if Length(Digits) = 5 then
    Result := '0' + Digits
  else if Length(Digits) = 6 then
    Result := Digits
  else
    Result := Digits;
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

    F.cbReasonChange(nil);

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
  const AExpectedRefNcf: string;
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

    // Importante: aplicar el motivo ANTES de cargar el detalle.
    // SeedFromCurrentVenta usa SelectedReasonCode para decidir si carga todas
    // las líneas o solamente las seleccionadas en RxDBGrid2(dmFactura.qryVentaFacturaDet).
    if AReasonCode > 0 then
    begin
      for I := 0 to F.cbReason.Items.Count - 1 do
        if _ExtractLeadingInt(F.cbReason.Items[I]) = AReasonCode then
        begin
          F.cbReason.ItemIndex := I;
          Break;
        end;
    end
    else if Trim(AReasonText) <> '' then
      F.cbReason.Text := AReasonText;

    F.cbReasonChange(nil);
    
    F.SeedFromCurrentVenta;
    if Trim(AExpectedRefNcf) <> '' then
    begin
      if not SameText(Trim(F.edtRefNcf.Text), Trim(AExpectedRefNcf)) then
      raise Exception.CreateFmt(
      'Inconsistencia crítica en NCR.' + sLineBreak +
      'El e-NCF seleccionado para modificar es [%s], pero la factura activa cargada en el diseñador tiene [%s].' + sLineBreak +
      'No se generará la Nota de Crédito para evitar aplicar la NCR al documento incorrecto.',
      [Trim(AExpectedRefNcf), Trim(F.edtRefNcf.Text)]);
    end;

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

function TfrmOrders2EcfNcrBuilder.GetCurrentMasterDataSet: TDataSet;
begin
  Result := nil;
  if Assigned(dmFactura) and Assigned(dmFactura.qryVentaFactura) and
     dmFactura.qryVentaFactura.Active and (not dmFactura.qryVentaFactura.IsEmpty) then
    Result := dmFactura.qryVentaFactura;
end;

function TfrmOrders2EcfNcrBuilder.GetCurrentCustomerCode: Integer;
var
  DS: TDataSet;
  F: TField;
begin
  Result := 0;

  DS := GetCurrentMasterDataSet;
  if DS = nil then
    Exit;

  F := _TryField(DS, 'CODIGO_CTE');
  if F = nil then
    F := _TryField(DS, 'CODIGO_CLIENTE');
  if F = nil then
    F := _TryField(DS, 'CLIENTE_ID');
  if F = nil then
    F := _TryField(DS, 'ID_CLIENTE');

  if (F <> nil) and (not F.IsNull) then
    Result := F.AsInteger;
end;

function TfrmOrders2EcfNcrBuilder.LocateCurrentCustomer(out AClientes: TDataSet): Boolean;
var
  CodigoCte: Integer;
  LocateField: string;
begin
  Result := False;
  AClientes := nil;

  CodigoCte := GetCurrentCustomerCode;
  if CodigoCte <= 0 then
    Exit;

  if (not Assigned(dmClientes)) or (not Assigned(dmClientes.qryClientes)) then
    Exit;

  AClientes := dmClientes.qryClientes;

  if not AClientes.Active then
    AClientes.Open;

  if AClientes.IsEmpty then
  begin
    AClientes := nil;
    Exit;
  end;

  LocateField := '';
  if AClientes.FindField('CODIGO_CTE') <> nil then
    LocateField := 'CODIGO_CTE'
  else if AClientes.FindField('CODIGO_CLIENTE') <> nil then
    LocateField := 'CODIGO_CLIENTE'
  else if AClientes.FindField('CODIGO') <> nil then
    LocateField := 'CODIGO'
  else if AClientes.FindField('ID_CLIENTE') <> nil then
    LocateField := 'ID_CLIENTE';

  if LocateField = '' then
  begin
    AClientes := nil;
    Exit;
  end;

  Result := AClientes.Locate(LocateField, CodigoCte, []);
  if not Result then
    AClientes := nil;
end;

function TfrmOrders2EcfNcrBuilder.GetReferenceTipoEcf: string;
var
  DS: TDataSet;
  Ncf: string;
begin
  DS := GetCurrentMasterDataSet;
  Result := UpperCase(_FieldAsStringAny(DS, ['TIPO_NCF', 'TIPO_ECF', 'TipoComprobante'], ''));

  if Result = '' then
  begin
    Ncf := UpperCase(Trim(edtRefNcf.Text));
    if (Length(Ncf) >= 3) and (Ncf[1] = 'E') then
      Result := Copy(Ncf, 1, 3);
  end;

  if (Length(Result) = 2) and (Result[1] in ['0'..'9']) then
    Result := 'E' + Result;
end;

function TfrmOrders2EcfNcrBuilder.GetReferenceSaleCondition: string;
var
  DS: TDataSet;
  ObsRaw: string;
  FormaPagoRaw: string;
  FormaPagoCode: Integer;

  function NormalizeText(const S: string): string;
  begin
    Result := UpperCase(Trim(S));
    Result := StringReplace(Result, 'É', 'E', [rfReplaceAll]);
    Result := StringReplace(Result, 'È', 'E', [rfReplaceAll]);
    Result := StringReplace(Result, 'Á', 'A', [rfReplaceAll]);
    Result := StringReplace(Result, 'Í', 'I', [rfReplaceAll]);
    Result := StringReplace(Result, 'Ó', 'O', [rfReplaceAll]);
    Result := StringReplace(Result, 'Ú', 'U', [rfReplaceAll]);
  end;

  function FirstIntegerInText(const S: string): Integer;
  var
    I: Integer;
    Digits: string;
  begin
    Result := 0;
    Digits := '';

    for I := 1 to Length(S) do
    begin
      if (S[I] >= '0') and (S[I] <= '9') then
        Digits := Digits + S[I]
      else if Digits <> '' then
        Break;
    end;

    if Digits <> '' then
      Result := StrToIntDef(Digits, 0);
  end;

begin
  DS := GetCurrentMasterDataSet;

  // Regla correcta:
  // NO usar CONDICION / CONDICION_VENTA del cliente.
  // Esa configuración no representa necesariamente cómo se pagó esta factura.

  ObsRaw := NormalizeText(_FieldAsStringAny(DS,
    ['OBSERVACION', 'OBERVACION', 'OBSERVACIONES', 'COMENTARIO', 'NOTA'], ''));

  FormaPagoRaw := NormalizeText(_FieldAsStringAny(DS,
    ['FORMA_PAGO', 'FORMAPAGO', 'ID_FORMA_PAGO', 'COD_FORMA_PAGO',
     'CODIGO_FORMA_PAGO', 'TIPO_PAGO'], ''));

  // 1) OBSERVACION manda si trae texto explícito.
  if (Pos('VENTA A CREDITO', ObsRaw) > 0) or
     (Pos('VENTA CREDITO', ObsRaw) > 0) or
     (Pos('CREDITO', ObsRaw) > 0) then
  begin
    Result := 'CREDITO';
    Exit;
  end;

  if (Pos('VENTA DE CONTADO', ObsRaw) > 0) or
     (Pos('VENTA CONTADO', ObsRaw) > 0) or
     (Pos('CONTADO', ObsRaw) > 0) then
  begin
    Result := 'CONTADO';
    Exit;
  end;

  // 2) Si OBSERVACION no define claramente, usar FORMA_PAGO.
  // Según regla:
  //   7 u 8 = Crédito
  //   5 = Gratis, no crédito para esta función
  //   cualquier otro valor = Contado
  FormaPagoCode := FirstIntegerInText(FormaPagoRaw);

  if (FormaPagoCode = 7) or (FormaPagoCode = 8) then
    Result := 'CREDITO'
  else
    Result := 'CONTADO';
end;

function TfrmOrders2EcfNcrBuilder.GetReferenceCurrency: string;
var
  DS: TDataSet;
  Raw: string;
  Rate: Double;

  function NormalizeCurrency(const S: string): string;
  var
    U: string;
  begin
    U := UpperCase(Trim(S));
    U := StringReplace(U, '.', '', [rfReplaceAll]);
    U := StringReplace(U, '-', '', [rfReplaceAll]);
    U := StringReplace(U, '_', '', [rfReplaceAll]);
    U := StringReplace(U, ' ', '', [rfReplaceAll]);

    if (U = 'USD') or (Pos('US$', U) > 0) or
       (Pos('DOLAR', U) > 0) or (Pos('DOLLAR', U) > 0) or
       (Pos('US', U) > 0) then
      Result := 'USD'
    else if (U = 'DOP') or (Pos('RD$', U) > 0) or
            (Pos('PESOS', U) > 0) or (Pos('PESODOM', U) > 0) or
            (Pos('DOMINICANO', U) > 0) or (U = 'RD') then
      Result := 'DOP'
    else
      Result := '';             
  end;
  
begin
  DS := GetCurrentMasterDataSet;

  Raw := _FieldAsStringAny(DS,
    ['MONEDA', 'MONEDA_FACTURA', 'MONEDA_SALIDA', 'OUTPUT_CURRENCY',
     'CURRENCY', 'DIVISA', 'TIPO_MONEDA', 'COD_MONEDA', 'SIMBOLO_MONEDA',
     'TIPO_DIVISA', 'MONEDA_DOCUMENTO'], '');

  Result := NormalizeCurrency(Raw);
  if Result <> '' then
    Exit;

  // Fallback defensivo: si la factura tiene tasa mayor que 1, normalmente
  // los importes legacy/origen están expresados en USD y DGII recibirá DOP.
  Rate := GetReferenceExchangeRate;
  if Rate > 1.0001 then
    Result := 'USD'
  else
    Result := 'DOP';
end;

function TfrmOrders2EcfNcrBuilder.GetReferenceOutputCurrency: string;
begin
  // En el JSON NCR esta moneda representa la moneda fuente/representación
  // de los importes serializados desde legacy. La conversión a DOP para DGII
  // se hace en Orders2Ecf.Cli, no aquí.
  Result := GetReferenceCurrency;
end;

function TfrmOrders2EcfNcrBuilder.GetReferenceExchangeRate: Double;
var
  DS: TDataSet;
begin
  DS := GetCurrentMasterDataSet;

  Result := _FieldAsFloatAny(DS,
    ['TASA_CAMBIO', 'TASA', 'TASA_DOLAR', 'TASA_USD', 'VALOR_TASA',
     'CAMBIO', 'TIPO_CAMBIO', 'EXCHANGE_RATE', 'DOLLAR_RATE',
     'TASA_MONEDA', 'TASA_FACTURA'], 0);

  if Result <= 0 then
    Result := 1;
end;

function TfrmOrders2EcfNcrBuilder.GetCustomerRnc: string;
var
  DS: TDataSet;
begin
  Result := '';

  if LocateCurrentCustomer(DS) then
  begin
    Result := _FieldAsStringAny(DS, ['RNC_NUMERO', 'RNC', 'CEDULA', 'CEDULA_RNC'], '');
    if Trim(Result) <> '' then
      Exit;
  end;

  DS := GetCurrentMasterDataSet;
  Result := _FieldAsStringAny(DS,
    ['RNC', 'RNC_NUMERO', 'RNC_CLIENTE', 'CEDULA', 'CEDULA_RNC',
     'RNCComprador', 'RNC_COMPRADOR'], '');
end;

function TfrmOrders2EcfNcrBuilder.GetCustomerName: string;
var
  DS: TDataSet;
begin
  Result := '';

  if LocateCurrentCustomer(DS) then
  begin
    Result := _FieldAsStringAny(DS,
      ['NOMBRE_FACTURAR', 'NOMBRE_COMPLETO', 'NOMBRE_CLIENTE', 'CLIENTE', 'RAZON_SOCIAL'], '');
    if Trim(Result) <> '' then
      Exit;
  end;

  DS := GetCurrentMasterDataSet;
  Result := _FieldAsStringAny(DS,
    ['NOMBRE_COMPLETO', 'NOMBRE_CLIENTE', 'CLIENTE', 'RAZON_SOCIAL',
     'RAZONSOCIAL', 'RazonSocialComprador', 'RAZON_SOCIAL_COMPRADOR'], '');
end;

function TfrmOrders2EcfNcrBuilder.GetCustomerCity: string;
var
  DS: TDataSet;
begin
  Result := '';

  if LocateCurrentCustomer(DS) then
  begin
    Result := _FieldAsStringAny(DS, ['CIUDAD', 'MUNICIPIO', 'NOMBRE_CIUDAD'], '');
    if Trim(Result) <> '' then
      Exit;
  end;

  DS := GetCurrentMasterDataSet;
  Result := _FieldAsStringAny(DS,
    ['CIUDAD', 'MUNICIPIO', 'NOMBRE_CIUDAD', 'CIUDAD_CLIENTE',
     'MunicipioComprador'], '');
end;

function TfrmOrders2EcfNcrBuilder.GetCustomerAddress: string;
var
  DS: TDataSet;
begin
  Result := '';

  if LocateCurrentCustomer(DS) then
  begin
    Result := _FieldAsStringAny(DS, ['DIRECCION_CONT', 'DIRECCION', 'DIRECCION_CLIENTE'], '');
    if Trim(Result) <> '' then
      Exit;
  end;

  DS := GetCurrentMasterDataSet;
  Result := _FieldAsStringAny(DS,
    ['DIRECCION', 'DIRECCION_CLIENTE', 'DIRECCION_COMPRADOR', 'DireccionComprador'], '');
end;

function TfrmOrders2EcfNcrBuilder.GetCustomerMunicipioCode: string;
var
  DS: TDataSet;
begin
  Result := '';

  if LocateCurrentCustomer(DS) then
  begin
    Result := _NormalizeGeoCode6(_FieldAsStringAny(DS,
      ['ID_MUNICIPIO', 'CODCIUDAD', 'COD_CIUDAD', 'CODIGO_MUNICIPIO'], ''));
    if Trim(Result) <> '' then
      Exit;
  end;

  DS := GetCurrentMasterDataSet;
  Result := _NormalizeGeoCode6(_FieldAsStringAny(DS,
    ['CODCIUDAD', 'COD_CIUDAD', 'CODIGO_CIUDAD', 'CODIGO_MUNICIPIO',
     'COD_MUNICIPIO', 'MUNICIPIO_CODE', 'MUNICIPIO_COMPRADOR',
     'COD_CIUDAD_COMPRADOR'], ''));
end;

function TfrmOrders2EcfNcrBuilder.GetCustomerProvinciaCode: string;
var
  DS: TDataSet;
begin
  Result := '';

  if LocateCurrentCustomer(DS) then
  begin
    Result := _NormalizeGeoCode6(_FieldAsStringAny(DS,
      ['ID_PROVINCIA', 'CODPROV', 'COD_PROV', 'CODIGO_PROVINCIA'], ''));
    if Trim(Result) <> '' then
      Exit;
  end;

  DS := GetCurrentMasterDataSet;
  Result := _NormalizeGeoCode6(_FieldAsStringAny(DS,
    ['CODPROV', 'COD_PROV', 'CODPROVINCIA', 'COD_PROVINCIA',
     'CODIGO_PROVINCIA', 'PROVINCIA_CODE', 'PROVINCIA_COMPRADOR',
     'COD_PROVINCIA_COMPRADOR'], ''));
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
            dmFactura.qryVentaFactura.Active and
            (not dmFactura.qryVentaFactura.IsEmpty) and
            Assigned(dmFactura.qryVentaFacturaDet) and
            dmFactura.qryVentaFacturaDet.Active and
            (not dmFactura.qryVentaFacturaDet.IsEmpty);
end;

procedure TfrmOrders2EcfNcrBuilder.SeedFromCurrentVenta;
var
  SavePos: TBookmark;
  DS, DSD: TDataSet;
  RefNcf, TipoNcf: string;
  SourceDate: TDateTime;
  DetailGrid: TDBGrid;
  SelectedCount: Integer;
  UseSelectedRows: Boolean;
  UseCurrentOnly: Boolean;
  I: Integer;

  function FindDetailGridForDataSet(ADetail: TDataSet): TDBGrid;
  var
    FIdx: Integer;
    C: TComponent;
    G: TDBGrid;
  begin
    Result := nil;
    if ADetail = nil then
      Exit;

    for FIdx := 0 to Screen.FormCount - 1 do
    begin
      C := Screen.Forms[FIdx].FindComponent('RxDBGrid2');
      if (C <> nil) and (C is TDBGrid) then
      begin
        G := TDBGrid(C);
        if Assigned(G.DataSource) and (G.DataSource.DataSet = ADetail) then
        begin
          Result := G;
          Exit;
        end;
      end;
    end;
  end;

  procedure ReadCurrentDetail(out ACod, ADesc, ALineRef: string;
    out AQty, APrice, AItbisRate, ASourceSubtotal, ASourceItbis, ASourceTotal,
    ASourceDiscountAmount, ASourceDiscountPercent: Double;
    out AItbisExento, ATranspItbis: Integer);
  var
    GrossLineAmount, NetSourceSubtotal: Double;
  begin
    ACod := _FieldAsStringAny(DSD, ['CODIGO_PROD'], '');
    ADesc := _FieldAsStringAny(DSD, ['DESCRIPCIONPRODUCTO', 'DESCRIPCION', 'DescripcionAdicional'], ACod);
    AQty := _FieldAsFloatAny(DSD, ['CANTIDAD'], 0);
    APrice := _FieldAsFloatAny(DSD, ['PRECIO', 'Precio'], 0);
    ASourceSubtotal := Abs(_FieldAsFloatAny(DSD, ['VALOR_SERVICIO_DET'], 0));
    ASourceItbis := Abs(_FieldAsFloatAny(DSD, ['ITBI_DET'], 0));
    ASourceTotal := Abs(_FieldAsFloatAny(DSD, ['VALOR_TOTAL_DET'], 0));
    ASourceDiscountAmount := Abs(_FieldAsFloatAny(DSD, ['MONTO_DESC_ITEM', 'monto_desc_item'], 0));
    ASourceDiscountPercent := _FieldAsFloatAny(DSD, ['PORC_DESC_ITEM', 'porc_desc_item'], 0);
    AItbisExento := Round(_FieldAsFloatAny(DSD, ['ITBIS_EXENTO'], 0));

    GrossLineAmount := AQty * APrice;
    if ASourceDiscountAmount > 0 then
      NetSourceSubtotal := Round2(GrossLineAmount - ASourceDiscountAmount)
    else if ASourceTotal > 0 then
      NetSourceSubtotal := Round2(ASourceTotal - ASourceItbis)
    else
      NetSourceSubtotal := Round2(ASourceSubtotal);

    if NetSourceSubtotal < 0 then
      NetSourceSubtotal := 0;

    ASourceSubtotal := NetSourceSubtotal;
    AItbisRate := DeriveTaxRate(NetSourceSubtotal, ASourceItbis, AItbisExento);
    ALineRef := _FieldAsStringAny(DSD, ['SERIE'], '');
    ATranspItbis := Round(_FieldAsFloatAny(DSD, ['TRANSP_ITBIS'], 1));
  end;

  procedure AccumulateSourceMaxFromCurrentDetail;
  var
    Cod, Desc, LineRef: string;
    Qty, Price, ItbisRate: Double;
    SourceSubtotal, SourceItbis, SourceTotal, SourceDiscountAmount, SourceDiscountPercent: Double;
    ItbisExento, TranspItbis: Integer;
  begin
    ReadCurrentDetail(Cod, Desc, LineRef, Qty, Price, ItbisRate,
      SourceSubtotal, SourceItbis, SourceTotal, SourceDiscountAmount,
      SourceDiscountPercent, ItbisExento, TranspItbis);

    FSourceMaxSubtotal := FSourceMaxSubtotal + Round2(SourceSubtotal);
    if SourceTotal > 0 then
      FSourceMaxTotal := FSourceMaxTotal + Round2(SourceTotal)
    else
      FSourceMaxTotal := FSourceMaxTotal + Round2(SourceSubtotal + SourceItbis);
  end;

  procedure AddCurrentDetailRecord;
  var
    Cod, Desc, LineRef: string;
    Qty, Price, ItbisRate: Double;
    SourceSubtotal, SourceItbis, SourceTotal, SourceDiscountAmount, SourceDiscountPercent: Double;
    ItbisExento, TranspItbis: Integer;
  begin
    ReadCurrentDetail(Cod, Desc, LineRef, Qty, Price, ItbisRate,
      SourceSubtotal, SourceItbis, SourceTotal, SourceDiscountAmount,
      SourceDiscountPercent, ItbisExento, TranspItbis);

    AddPreloadedItem(Cod, Desc, Qty, Qty, Price, ItbisRate,
      SourceSubtotal, SourceItbis, SourceTotal, SourceDiscountAmount,
      SourceDiscountPercent, True, True, LineRef, TranspItbis);
  end;

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

  // El máximo de devolución siempre debe calcularse contra la factura completa.
  // lvItems puede contener solo las líneas seleccionadas para una NCR parcial,
  // pero maxRefundAmount debe representar el total disponible del e-CF modificado.
  FSourceMaxSubtotal := 0;
  FSourceMaxTotal := 0;

  lvItems.Items.BeginUpdate;
  try
    lvItems.Items.Clear;
    SavePos := nil;
    try
      try
        SavePos := DSD.GetBookmark;
      except
        SavePos := nil;
      end;

      DSD.DisableControls;
      try
        DSD.First;
        while not DSD.Eof do
        begin
          AccumulateSourceMaxFromCurrentDetail;
          DSD.Next;
        end;

        DetailGrid := FindDetailGridForDataSet(DSD);
        SelectedCount := 0;
        if Assigned(DetailGrid) and Assigned(DetailGrid.SelectedRows) then
          SelectedCount := DetailGrid.SelectedRows.Count;

        // Motivo 1 = anulación total: siempre carga todas las líneas.
        // Motivo distinto de 1: se considera parcial/corrección y debe respetar
        // las filas seleccionadas en RxDBGrid2(dmFactura.qryVentaFacturaDet).
        // Si no hay multi-selección, carga la fila actual para permitir NCR parcial.
        UseSelectedRows := (SelectedReasonCode <> 1) and (SelectedCount > 0);
        UseCurrentOnly := (SelectedReasonCode <> 1) and (SelectedCount = 0);

        if UseSelectedRows then
        begin
          for I := 0 to SelectedCount - 1 do
          begin
            try
              DSD.Bookmark := DetailGrid.SelectedRows.Items[I];
              AddCurrentDetailRecord;
            except
              // Si algún bookmark quedó inválido, se ignora esa fila y se continúa.
            end;
          end;
        end
        else if UseCurrentOnly then
        begin
          AddCurrentDetailRecord;
        end
        else
        begin
          DSD.First;
          while not DSD.Eof do
          begin
            AddCurrentDetailRecord;
            DSD.Next;
          end;
        end;
      finally
        DSD.EnableControls;
      end;
    finally
      if SavePos <> nil then
      begin
        try
          if DSD.BookmarkValid(SavePos) then
            DSD.GotoBookmark(SavePos);
        finally
          DSD.FreeBookmark(SavePos);
        end;
      end;
    end;
  finally
    lvItems.Items.EndUpdate;
  end;

  if lvItems.Items.Count > 0 then
  begin
    if SelectedReasonCode = 1 then
      rgScope.ItemIndex := 0
    else
      rgScope.ItemIndex := 1;
    NormalizeScope;
  end;

  RecalcFiscalRule;
  RecalcTotals;
end;

procedure TfrmOrders2EcfNcrBuilder.FormCreate(Sender: TObject);
begin
  Caption := 'Dise?ador NCR para Orders2Ecf.Cli';
  cbReason.Items.Clear;
  cbReason.Items.Add('1 - Anulacion total');
  cbReason.Items.Add('2 - Corrige texto');
  cbReason.Items.Add('3 - Corrige montos');
  cbReason.ItemIndex := 0;
  FSourceMaxSubtotal := 0;
  FSourceMaxTotal := 0;
  rgScope.ItemIndex := 0;
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
  cbReasonChange(nil);
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
	if showing then			 
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
  QtyRatio, EffectiveDiscPct: Double;
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

    if (SrcQtyOrig > 0) and SamePrice and ((SrcTotal > 0) or (SrcSubtotal > 0)) then
    begin
      QtyRatio := AQty / SrcQtyOrig;

      ASubtotal := Round2(SrcSubtotal * QtyRatio);
      if chkApplyItbis.Checked then
      begin
        AItbisAmount := Round2(SrcItbis * QtyRatio);
        ATotal := Round2(ASubtotal + AItbisAmount);
      end
      else
      begin
        AItbisAmount := 0;
        ATotal := Round2(ASubtotal);
      end;

      if SameQty then
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

  if (SrcDiscPct > 0) then
    EffectiveDiscPct := SrcDiscPct
  else if (SrcDiscAmt > 0) and (SrcQtyOrig > 0) and (SrcPriceOrig > 0) then
    EffectiveDiscPct := (SrcDiscAmt / (SrcQtyOrig * SrcPriceOrig)) * 100
  else
    EffectiveDiscPct := 0;

  if EffectiveDiscPct < 0 then
    EffectiveDiscPct := 0;
  if EffectiveDiscPct > 100 then
    EffectiveDiscPct := 100;

  DiscountAmount := GrossAmount * (EffectiveDiscPct / 100);
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
  Itbis := NormalizeTaxRate(StrToFloatDef(Trim(edtItbis.Text), 0));

  if (Itbis <> 0) and not ((Abs(Itbis-8) < 0.001) or (Abs(Itbis-11) < 0.001) or
     (Abs(Itbis-13) < 0.001) or (Abs(Itbis-16) < 0.001) or (Abs(Itbis-18) < 0.001)) then
    raise Exception.Create('La tasa ITBIS debe ser una de estas: 0, 8, 11, 13, 16 o 18.');

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
  Itbis := NormalizeTaxRate(StrToFloatDef(Trim(edtItbis.Text), 0));

  if (Itbis <> 0) and not ((Abs(Itbis-8) < 0.001) or (Abs(Itbis-11) < 0.001) or
     (Abs(Itbis-13) < 0.001) or (Abs(Itbis-16) < 0.001) or (Abs(Itbis-18) < 0.001)) then
    raise Exception.Create('La tasa ITBIS debe ser una de estas: 0, 8, 11, 13, 16 o 18.');

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
  // Cuando SeedFromCurrentVenta cargó solo filas seleccionadas para NCR parcial,
  // FSourceMaxTotal/FSourceMaxSubtotal conservan el total de la factura completa.
  // Esto evita que maxRefundAmount=requestedRefundAmount y el CLI interprete
  // erróneamente una NCR parcial como total.
  if chkApplyItbis.Checked and (FSourceMaxTotal > 0) then
  begin
    Result := FSourceMaxTotal;
    Exit;
  end;

  if (not chkApplyItbis.Checked) and (FSourceMaxSubtotal > 0) then
  begin
    Result := FSourceMaxSubtotal;
    Exit;
  end;

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
var
  I: Integer;
  It: TListItem;
  Qty, Price, Itbis: Double;
  LineSubtotal, LineItbis, LineTotal: Currency;
begin
  Result := 0;
  for I := 0 to lvItems.Items.Count - 1 do
  begin
    It := lvItems.Items[I];
    if ItemAsBool(It.Caption) then
    begin
      Qty := StrToFloatDef(GetSubItemSafe(It, IDX_QTY_NCR, '0'), 0);
      Price := StrToFloatDef(GetSubItemSafe(It, IDX_PRICE, '0'), 0);
      Itbis := StrToFloatDef(GetSubItemSafe(It, IDX_TAX_RATE, '0'), 0);
      ComputeLineAmounts(It, Qty, Price, Itbis, LineSubtotal, LineItbis, LineTotal);
      Result := Result + LineTotal;
    end;
  end;
  Result := Round2(Result);
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

  Subtotal := Round2(Subtotal);
  ItbisTotal := Round2(ItbisTotal);
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
  if Trim(GetCustomerRnc) = '' then
    raise Exception.Create('No se pudo determinar el RNC/Cedula del comprador para la NCR. Verifique qryClientes y CODIGO_CTE de la factura.');
  if Trim(GetCustomerName) = '' then
    raise Exception.Create('No se pudo determinar el nombre/razon social del comprador para la NCR. Verifique qryClientes.NOMBRE_FACTURAR.');
  if Trim(GetCustomerMunicipioCode) = '' then
    raise Exception.Create('No se pudo determinar ID_MUNICIPIO/COD.CIUD del comprador para la NCR. Debe tener 5 o 6 digitos.');
  if Trim(GetCustomerProvinciaCode) = '' then
    raise Exception.Create('No se pudo determinar ID_PROVINCIA/COD.PROV del comprador para la NCR. Debe tener 5 o 6 digitos.');
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
  CustomerRnc, CustomerName, CustomerCity, CustomerAddress: string;
  CustomerMunicipioCode, CustomerProvinciaCode: string;
  TipoRef, SaleCond, RefCurrency, RefOutputCurrency: string;
  RefExchangeRate: Double;
begin
  SL := TStringList.Create;
  try
    CustomerRnc := GetCustomerRnc;
    CustomerName := GetCustomerName;
    CustomerCity := GetCustomerCity;
    CustomerAddress := GetCustomerAddress;
    CustomerMunicipioCode := GetCustomerMunicipioCode;
    CustomerProvinciaCode := GetCustomerProvinciaCode;
    TipoRef := GetReferenceTipoEcf;
    SaleCond := GetReferenceSaleCondition;
    RefCurrency := GetReferenceCurrency;
    RefOutputCurrency := GetReferenceOutputCurrency;
    RefExchangeRate := GetReferenceExchangeRate;

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
    SL.Add('  "currency": "' + TNcrCliPayload.JsonEscape(RefCurrency) + '",');
    SL.Add('  "outputCurrency": "' + TNcrCliPayload.JsonEscape(RefOutputCurrency) + '",');
    SL.Add('  "exchangeRate": ' + TNcrCliPayload.FloatToJson(RefExchangeRate) + ',');
    SL.Add('  "tipoEcfReferencia": "' + TNcrCliPayload.JsonEscape(TipoRef) + '",');
    SL.Add('  "saleCondition": "' + TNcrCliPayload.JsonEscape(SaleCond) + '",');
    SL.Add('  "customerRnc": "' + TNcrCliPayload.JsonEscape(CustomerRnc) + '",');
    SL.Add('  "customerName": "' + TNcrCliPayload.JsonEscape(CustomerName) + '",');
    SL.Add('  "customerCity": "' + TNcrCliPayload.JsonEscape(CustomerCity) + '",');
    SL.Add('  "customerAddress": "' + TNcrCliPayload.JsonEscape(CustomerAddress) + '",');
    SL.Add('  "customerMunicipioCode": "' + TNcrCliPayload.JsonEscape(CustomerMunicipioCode) + '",');
    SL.Add('  "customerProvinciaCode": "' + TNcrCliPayload.JsonEscape(CustomerProvinciaCode) + '",');
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
      Itbis := NormalizeTaxRate(StrToFloatDef(GetSubItemSafe(It, IDX_TAX_RATE, '0'), 0));
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
  if rgScope.ItemIndex = 0 then
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
    '; TipoRef=' + GetReferenceTipoEcf +
    '; Condicion=' + GetReferenceSaleCondition +
    '; Motivo=' + IntToStr(SelectedReasonCode) + ' - ' + Trim(SelectedReasonText) +
    '; Alcance=' + ScopeText +
    '; FechaOrigen=' + FormatDateTime('yyyy-mm-dd', dtpSourceDate.Date) +
    '; FechaNCR=' + FormatDateTime('yyyy-mm-dd', dtpIssueDate.Date) +
    '; Dias=' + Trim(edtDays.Text) +
    '; Itbis=' + IncludeText +
    '; Incluidos=' + IntToStr(IncludedCount) +
    '; Moneda=' + GetReferenceCurrency +
    '; Tasa=' + FormatFloat('0.0000', GetReferenceExchangeRate) +
    '; Solicitado=' + FormatFloat('0.00', CurrentRequestedRefundAmount) +
    '; Max=' + FormatFloat('0.00', SourceMaxRefundAmount);
end;
end.
