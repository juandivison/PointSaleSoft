unit UfrmValidaFactura;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, RXDBCtrl, DBCtrls,
  DB, Mask, RxMemDS, EditNew, IBCustomDataSet, WinSkinData, Menus,
  RXCtrls, IBStoredProc, IBSQL, RxLookup,Math,
  RxVerInf, RxGIF, ExcelXP, comObj, rxToolEdit, RxDBComb, IBTable, ComCtrls;

type
  TfrmValidaFactura = class(TForm)
    rxCalcVenta: TRxMemoryData;
    dsCalcVenta: TDataSource;
    CalcTotales: TRxMemoryData;
    dsCalcTotales: TDataSource;
    RxDBGrid1:TRxDBGrid;
    Panel1: TPanel;
    btnRefrescar: TButton;
    LabelSubtotal: TLabel;
    LabelITBIS: TLabel;
    LabelTotal: TLabel;
    LabelPropina: TLabel;
    LabelITBIS0: TLabel;
    LabelITBIS8: TLabel;
    LabelITBIS11: TLabel;
    LabelITBIS13: TLabel;
    LabelITBIS16: TLabel;
    LabelITBIS18: TLabel;

    LabelRecargo: TLabel;
    LabelDescuento: TLabel;
    LabelPropinaAdic: TLabel;
    LabelPropinaLey: TLabel;
    LabelITBISExonerado: TLabel;
    SkinData1: TSkinData;
    Button1: TButton;
    edtshetindexnum: TEdit;
    Label1: TLabel;
    procedure btnRefrescarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure AntesCalcularTodo;
    procedure CalcularTodo;

    procedure CargarDatosVenta(LineaVenta: TRxMemoryData);
    function ObtenerTasaPorID(IDTasa: Integer): Double;
    procedure CargarSimulacionDesdeExcel(const ArchivoExcel: string;
      SheetIndex: Integer; var rxVenta: TRxMemoryData);
  public
    TRANS_ITBIS: Integer;
    PROPINA_LEY: Double;
    PROPINA_ADICIONAL: Double;
    MONTORECARGO: Double;
    PorcDesAdicional: Double;
    NCF: string;
    function EsNCFExento: Boolean;
    procedure ValidarFactura(LineaVenta, Totales: TRxMemoryData);
  end;

var
  frmValidaFactura: TfrmValidaFactura;

implementation

uses UDatModInventario;

{$R *.dfm}

procedure TfrmValidaFactura.FormCreate(Sender: TObject);
begin
  TRANS_ITBIS := 0;
  PROPINA_LEY := 0.0;
  PROPINA_ADICIONAL := 0.0;
  MONTORECARGO := 0.0;
  PorcDesAdicional:=0;
end;

procedure TfrmValidaFactura.ValidarFactura(LineaVenta, Totales: TRxMemoryData);
begin
  CargarDatosVenta(LineaVenta);
end;

procedure TfrmValidaFactura.CargarDatosVenta(LineaVenta: TRxMemoryData);
begin
  rxCalcVenta.Close;
  rxCalcVenta.Open;
  LineaVenta.First;
  while not LineaVenta.Eof do
  begin
    rxCalcVenta.Append;
    rxCalcVenta.FieldByName('Serie').Value := LineaVenta.FieldByName('Serie').Value;
    rxCalcVenta.FieldByName('Fecha').Value := LineaVenta.FieldByName('Fecha').Value;
    rxCalcVenta.FieldByName('IDTasaITBIS').Value := LineaVenta.FieldByName('IDTasaITBIS').Value;
    rxCalcVenta.FieldByName('Cant').Value := LineaVenta.FieldByName('Cant').Value;
    rxCalcVenta.FieldByName('Precio').Value := LineaVenta.FieldByName('Precio').Value;
    rxCalcVenta.FieldByName('CodArticulo').Value := LineaVenta.FieldByName('CodArticulo').Value;
    rxCalcVenta.FieldByName('PorcDescItem').Value := LineaVenta.FieldByName('PorcDescItem').Value;
    rxCalcVenta.FieldByName('ItbisExento').Value := LineaVenta.FieldByName('ItbisExento').Value;
    rxCalcVenta.FieldByName('TipoVenta').Value := LineaVenta.FieldByName('TipoVenta').Value;
    rxCalcVenta.Post;
    LineaVenta.Next;
  end;

  CalcularTodo;
end;

procedure TfrmValidaFactura.btnRefrescarClick(Sender: TObject);
begin
  CalcularTodo;
end;

function TfrmValidaFactura.ObtenerTasaPorID(IDTasa: Integer): Double;
begin
  Result := 0.0;
  if dmInventario.tblTasaITBIS.state = dsInactive then
  dmInventario.tblTasaITBIS.Open;
  if dmInventario.tblTasaITBIS.Locate('IDTasaITBIS', IDTasa, []) then
    Result := dmInventario.tblTasaITBISPORCIENTO.Value;
end;

procedure TfrmValidaFactura.AntesCalcularTodo;
var
  Base, Precio, Cantidad, Tasa, DescLinea, MontoBruto, MontoNeto: Double;
  TotalBase, TotalExento, TotalITBIS, TotalFinal, TotalPropina,ITBISExonerado: Double;
  TotalPorTasa: array[0..18] of Double;
  ITBISPorTasa: array[0..18] of Double;
  IDTasa, i: Integer;
  ExonerarITBIS: Boolean;
begin
  for i := Low(TotalPorTasa) to High(TotalPorTasa) do
  begin
    TotalPorTasa[i] := 0;
    ITBISPorTasa[i] := 0;
  end;

  TotalBase := 0;
  TotalExento := 0;
  TotalITBIS := 0;

  ExonerarITBIS := EsNCFExento;

  rxCalcVenta.First;
  while not rxCalcVenta.Eof do
  begin
    Precio := rxCalcVenta.FieldByName('Precio').AsFloat;
    Cantidad := rxCalcVenta.FieldByName('Cant').AsFloat;
    DescLinea := rxCalcVenta.FieldByName('PorcDescItem').AsFloat / 100;
    IDTasa := rxCalcVenta.FieldByName('IDTasaITBIS').AsInteger;
    Tasa := ObtenerTasaPorID(IDTasa);

    MontoBruto := Precio * Cantidad;
    MontoNeto := MontoBruto * (1 - DescLinea);

    if rxCalcVenta.FieldByName('ItbisExento').AsInteger = 1 then
    begin
      TotalExento := TotalExento + MontoNeto;
    end
    else
    begin
      if TRANS_ITBIS = 1 then
        Base := MontoNeto / (1 + Tasa / 100)
      else
        Base := MontoNeto;

      TotalBase := TotalBase + Base;
      if Round(Tasa) in [0, 8, 11, 13, 16, 18] then
      begin
        TotalPorTasa[Round(Tasa)] := TotalPorTasa[Round(Tasa)] + Base;
        ITBISPorTasa[Round(Tasa)] := ITBISPorTasa[Round(Tasa)] + (Base * Tasa / 100);
      end;
    end;

    if ExonerarITBIS then
    begin
      ITBISExonerado := ITBISExonerado + (Base * Tasa / 100);
      Tasa := 0;
    end;
    rxCalcVenta.Next;
  end;

  // Aplicar descuento y recargo global prorrateado
  if (TotalBase > 0) then
  begin
    for i := Low(TotalPorTasa) to High(TotalPorTasa) do
    begin
      if TotalPorTasa[i] > 0 then
      begin
        TotalPorTasa[i] := TotalPorTasa[i] * (1 - PorcDesAdicional / 100);
        TotalPorTasa[i] := TotalPorTasa[i] + (TotalPorTasa[i] / TotalBase * MONTORECARGO);
        ITBISPorTasa[i] := TotalPorTasa[i] * (i / 100);
      end;
    end;
  end;

  // Total ITBIS acumulado
  for i := Low(ITBISPorTasa) to High(ITBISPorTasa) do
    TotalITBIS := TotalITBIS + ITBISPorTasa[i];

  // Calcular propina legal
  TotalPropina := (TotalBase + TotalExento) * PROPINA_LEY + PROPINA_ADICIONAL;

  // Total final
  TotalFinal := TotalBase + TotalExento + TotalITBIS + TotalPropina;

  // Mostrar resultados
  LabelSubtotal.Caption    := Format('Subtotal Base: RD$ %.2f', [TotalBase]);
  LabelITBIS.Caption       := Format('ITBIS Total: RD$ %.2f', [TotalITBIS]);
  LabelPropina.Caption     := Format('Propina: RD$ %.2f', [TotalPropina]);
  LabelTotal.Caption       := Format('Total a Pagar: RD$ %.2f', [TotalFinal-ITBISExonerado]);

  LabelITBIS0.Caption      := Format('ITBIS 0%%: RD$ %.2f', [ITBISPorTasa[0]]);
  LabelITBIS8.Caption      := Format('ITBIS 8%%: RD$ %.2f', [ITBISPorTasa[8]]);
  LabelITBIS11.Caption     := Format('ITBIS 11%%: RD$ %.2f', [ITBISPorTasa[11]]);
  LabelITBIS13.Caption     := Format('ITBIS 13%%: RD$ %.2f', [ITBISPorTasa[13]]);
  LabelITBIS16.Caption     := Format('ITBIS 16%%: RD$ %.2f', [ITBISPorTasa[16]]);
  LabelITBIS18.Caption     := Format('ITBIS 18%%: RD$ %.2f', [ITBISPorTasa[18]]);

  LabelRecargo.Caption         := Format('Recargo: RD$ %.2f', [MONTORECARGO]);
  LabelDescuento.Caption       := Format('Descuento: %.2f%%', [PorcDesAdicional]);
  LabelPropinaAdic.Caption     := Format('Propina Adicional: RD$ %.2f', [PROPINA_ADICIONAL]);
  LabelPropinaLey.Caption      := Format('Propina Ley 10%%: RD$ %.2f', [(TotalBase + TotalExento) * PROPINA_LEY]);
  LabelITBISExonerado.Caption  := Format('ITBIS Exonerado: RD$ %.2f', [ITBISExonerado]);
end;

//solo probar este
procedure TfrmValidaFactura.CalcularTodo;
var
  Base, Precio, Cantidad, Tasa, DescLinea, MontoBruto, MontoNeto: Double;
  TotalBase, TotalExento, TotalITBIS, TotalFinal, TotalPropina, ITBISExonerado: Double;
  TotalPorTasa: array[0..18] of Double;
  ITBISPorTasa: array[0..18] of Double;
  IDTasa, i, TipoVenta: Integer;
  ExonerarITBIS: Boolean;
begin
  for i := Low(TotalPorTasa) to High(TotalPorTasa) do
  begin
    TotalPorTasa[i] := 0;
    ITBISPorTasa[i] := 0;
  end;

  TotalBase := 0;
  TotalExento := 0;
  TotalITBIS := 0;
  ITBISExonerado := 0;

  ExonerarITBIS := EsNCFExento;

  rxCalcVenta.First;
  while not rxCalcVenta.Eof do
  begin
    TipoVenta := rxCalcVenta.FieldByName('TipoVenta').AsInteger;
    if not (TipoVenta in [0, 2, 3]) then
    begin
      rxCalcVenta.Next;
      Continue;
    end;

    Precio := rxCalcVenta.FieldByName('Precio').AsFloat;
    Cantidad := rxCalcVenta.FieldByName('Cant').AsFloat;
    DescLinea := rxCalcVenta.FieldByName('PorcDescItem').AsFloat / 100;
    IDTasa := rxCalcVenta.FieldByName('IDTasaITBIS').AsInteger;
    Tasa := ObtenerTasaPorID(IDTasa);

    MontoBruto := Precio * Cantidad;

    if TipoVenta = 2 then
      MontoNeto := -1 * (MontoBruto * (1 - DescLinea))
    else
      MontoNeto := MontoBruto * (1 + IfThen(TipoVenta = 3, DescLinea, -DescLinea));

    if rxCalcVenta.FieldByName('ItbisExento').AsInteger = 1 then
    begin
      TotalExento := TotalExento + MontoNeto;
    end
    else
    begin
      if TRANS_ITBIS = 1 then
        Base := MontoNeto / (1 + Tasa / 100)
      else
        Base := MontoNeto;

      if ExonerarITBIS then
      begin
        ITBISExonerado := ITBISExonerado + (Base * Tasa / 100);
        Tasa := 0;
      end;

      TotalBase := TotalBase + Base;
      if Round(Tasa) in [0, 8, 11, 13, 16, 18] then
      begin
        TotalPorTasa[Round(Tasa)] := TotalPorTasa[Round(Tasa)] + Base;
        ITBISPorTasa[Round(Tasa)] := ITBISPorTasa[Round(Tasa)] + (Base * Tasa / 100);
      end;
    end;

    rxCalcVenta.Next;
  end;

  if (TotalBase > 0) then
  begin
    for i := Low(TotalPorTasa) to High(TotalPorTasa) do
    begin
      if TotalPorTasa[i] > 0 then
      begin
        TotalPorTasa[i] := TotalPorTasa[i] * (1 - PorcDesAdicional / 100);
        TotalPorTasa[i] := TotalPorTasa[i] + (TotalPorTasa[i] / TotalBase * MONTORECARGO);
        ITBISPorTasa[i] := TotalPorTasa[i] * (i / 100);
      end;
    end;
  end;

  for i := Low(ITBISPorTasa) to High(ITBISPorTasa) do
    TotalITBIS := TotalITBIS + ITBISPorTasa[i];

  TotalPropina := (TotalBase + TotalExento) * PROPINA_LEY + PROPINA_ADICIONAL;
  TotalFinal := TotalBase + TotalExento + TotalITBIS + TotalPropina;

    // Mostrar resultados
  LabelSubtotal.Caption    := Format('Subtotal Base: RD$ %.2f', [TotalBase]);
  LabelITBIS.Caption       := Format('ITBIS Total: RD$ %.2f', [TotalITBIS]);
  LabelPropina.Caption     := Format('Propina: RD$ %.2f', [TotalPropina]);
  LabelTotal.Caption       := Format('Total a Pagar: RD$ %.2f', [TotalFinal-ITBISExonerado]);

  LabelITBIS0.Caption      := Format('ITBIS 0%%: RD$ %.2f', [ITBISPorTasa[0]]);
  LabelITBIS8.Caption      := Format('ITBIS 8%%: RD$ %.2f', [ITBISPorTasa[8]]);
  LabelITBIS11.Caption     := Format('ITBIS 11%%: RD$ %.2f', [ITBISPorTasa[11]]);
  LabelITBIS13.Caption     := Format('ITBIS 13%%: RD$ %.2f', [ITBISPorTasa[13]]);
  LabelITBIS16.Caption     := Format('ITBIS 16%%: RD$ %.2f', [ITBISPorTasa[16]]);
  LabelITBIS18.Caption     := Format('ITBIS 18%%: RD$ %.2f', [ITBISPorTasa[18]]);

  LabelRecargo.Caption         := Format('Recargo: RD$ %.2f', [MONTORECARGO]);
  LabelDescuento.Caption       := Format('Descuento: %.2f%%', [PorcDesAdicional]);
  LabelPropinaAdic.Caption     := Format('Propina Adicional: RD$ %.2f', [PROPINA_ADICIONAL]);
  LabelPropinaLey.Caption      := Format('Propina Ley 10%%: RD$ %.2f', [(TotalBase + TotalExento) * PROPINA_LEY]);
  LabelITBISExonerado.Caption  := Format('ITBIS Exonerado: RD$ %.2f', [ITBISExonerado]);

end;

//fin solo probar este
function TfrmValidaFactura.EsNCFExento: Boolean;
var
  Prefijo: string;
begin
  Result := False;
  if Length(Trim(NCF)) < 2 then Exit;

  Prefijo := UpperCase(Copy(Trim(NCF), 1, 2));

  if (Prefijo = '14') then //or (Prefijo = '15') then
    Result := True
  else if (Copy(UpperCase(NCF), 1, 2) = '44') then
    Result := True;
end;

procedure TfrmValidaFactura.CargarSimulacionDesdeExcel(const ArchivoExcel: string; SheetIndex: Integer; var rxVenta: TRxMemoryData);
var
  ExcelApp, Workbook, Worksheet, Cell: OleVariant;
  Row, LastRow: Integer;
begin
  rxVenta.Close;
  rxVenta.Open;

  ExcelApp := CreateOleObject('Excel.Application');
  try
    ExcelApp.Visible := False;
    Workbook := ExcelApp.Workbooks.Open(ArchivoExcel);
    Worksheet := Workbook.Worksheets[SheetIndex];

    // Asumimos que la fila 1 es encabezado
    Row := 2;
    while Worksheet.Cells[Row, 1].Value <> Null do
    begin
      rxVenta.Append;
      rxVenta.FieldByName('Serie').AsInteger        := Row - 1;
      rxVenta.FieldByName('Fecha').AsDateTime       := Date;
      rxVenta.FieldByName('CodArticulo').AsInteger  := Worksheet.Cells[Row, 3].Value;
      rxVenta.FieldByName('Descripcion').AsString   := Worksheet.Cells[Row, 4].Value;
      rxVenta.FieldByName('Cant').AsFloat           := Worksheet.Cells[Row, 5].Value;
      rxVenta.FieldByName('Precio').AsFloat         := Worksheet.Cells[Row, 6].Value;
      rxVenta.FieldByName('IDTasaITBIS').AsInteger  := Worksheet.Cells[Row, 7].Value;
      rxVenta.FieldByName('TipoVenta').AsInteger    := Worksheet.Cells[Row, 8].Value;
      rxVenta.FieldByName('PorcDescItem').AsFloat   := Worksheet.Cells[Row, 9].Value;
      rxVenta.FieldByName('ItbisExento').AsInteger  := Worksheet.Cells[Row, 10].Value;
      rxVenta.Post;
      Inc(Row);
    end;

    Workbook.Close(False);
  finally
    ExcelApp.Quit;
    ExcelApp := Unassigned;
  end;
end;

end.
