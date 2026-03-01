
unit UfrmValidaFactura;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, RxMemDS, StdCtrls, Buttons, ExtCtrls, RxDBGrid;

type
  TfrmValidaFactura = class(TForm)
    rxCalcVenta: TRxMemoryData;
    CalcTotales: TRxMemoryData;
    dsCalcVenta: TDataSource;
    dsCalcTotales: TDataSource;
    RxDBGrid1: TRxDBGrid;
    Panel1: TPanel;
    btnRefrescar: TBitBtn;

    // Campos rxCalcVenta
    rxCalcVentaSerie: TIntegerField;
    rxCalcVentaFecha: TDateTimeField;
    rxCalcVentaIDTasaITBIS: TIntegerField;
    rxCalcVentaCant: TFloatField;
    rxCalcVentaPrecio: TCurrencyField;
    rxCalcVentaCodArticulo: TIntegerField;
    rxCalcVentaPorcDescItem: TCurrencyField;
    rxCalcVentaItbisExento: TSmallintField;
    rxCalcVentaTipoVenta: TIntegerField;

    // Campos CalcTotales
    CalcTotalesSubTotalBase: TCurrencyField;
    CalcTotalesITBIS8: TCurrencyField;
    CalcTotalesITBIS11: TCurrencyField;
    CalcTotalesITBIS13: TCurrencyField;
    CalcTotalesITBIS16: TCurrencyField;
    CalcTotalesITBIS18: TCurrencyField;
    CalcTotalesITBISTotal: TCurrencyField;
    CalcTotalesTotalNeto: TCurrencyField;
    CalcTotalesPropinaLegal: TCurrencyField;
    CalcTotalesPropinaAdicional: TCurrencyField;
    CalcTotalesMontoDescGlobal: TCurrencyField;
    CalcTotalesMontoRecargo: TCurrencyField;

  public
    TRANS_ITBIS: Integer;
    PROPINA_LEY: Double;
    PROPINA_ADICIONAL: Double;

    procedure ValidarFactura(LineaVenta, Totales: TRxMemoryData);
    procedure CargarDatosVenta(LineaVenta: TRxMemoryData);
    procedure CargarDatosTotales(Totales: TRxMemoryData);
    procedure CalcularTodo;
    procedure FormCreate(Sender: TObject);
    procedure btnRefrescarClick(Sender: TObject);
  end;

var
  frmValidaFactura: TfrmValidaFactura;

implementation

uses UDatModInventario, Math;

{$R *.dfm}

procedure TfrmValidaFactura.FormCreate(Sender: TObject);
begin
  TRANS_ITBIS := 1;
  PROPINA_LEY := 0.10;
  PROPINA_ADICIONAL := 0;
end;

procedure TfrmValidaFactura.btnRefrescarClick(Sender: TObject);
begin
  CalcularTodo;
end;

procedure TfrmValidaFactura.ValidarFactura(LineaVenta, Totales: TRxMemoryData);
begin
  CargarDatosVenta(LineaVenta);
  CargarDatosTotales(Totales);
  CalcularTodo;
end;

procedure TfrmValidaFactura.CargarDatosVenta(LineaVenta: TRxMemoryData);
begin
  rxCalcVenta.Open;
  rxCalcVenta.EmptyTable;

  LineaVenta.First;
  while not LineaVenta.Eof do
  begin
    rxCalcVenta.Append;
    rxCalcVentaSerie.AsInteger := LineaVenta.FieldByName('Serie').AsInteger;
    rxCalcVentaFecha.AsDateTime := LineaVenta.FieldByName('Fecha').AsDateTime;
    rxCalcVentaIDTasaITBIS.AsInteger := LineaVenta.FieldByName('IDTasaITBIS').AsInteger;
    rxCalcVentaCant.AsFloat := LineaVenta.FieldByName('Cant').AsFloat;
    rxCalcVentaPrecio.AsCurrency := LineaVenta.FieldByName('Precio').AsCurrency;
    rxCalcVentaCodArticulo.AsInteger := LineaVenta.FieldByName('CodArticulo').AsInteger;
    rxCalcVentaPorcDescItem.AsCurrency := LineaVenta.FieldByName('PorcDescItem').AsCurrency;
    rxCalcVentaItbisExento.AsInteger := LineaVenta.FieldByName('ItbisExento').AsInteger;
    rxCalcVentaTipoVenta.AsInteger := LineaVenta.FieldByName('TipoVenta').AsInteger;
    rxCalcVenta.Post;
    LineaVenta.Next;
  end;
end;

procedure TfrmValidaFactura.CargarDatosTotales(Totales: TRxMemoryData);
begin
  CalcTotales.Open;
  CalcTotales.EmptyTable;
  CalcTotales.Append;

  CalcTotalesMontoDescGlobal.Value := Totales.FieldByName('MontoDescGlobal').AsFloat;
  CalcTotalesMontoRecargo.Value := Totales.FieldByName('MontoRecargo').AsCurrency;
end;

procedure TfrmValidaFactura.CalcularTodo;
var
  Subtotal, ITBIS, Total, Propina, Base, Desc, Recargo, PrecioFinal, Cantidad, Tasa: Currency;
  isExento: Boolean;
begin
  Subtotal := 0;
  ITBIS := 0;
  Total := 0;

  // Inicialización
  CalcTotales.Edit;
  CalcTotalesITBIS8.Value := 0;
  CalcTotalesITBIS11.Value := 0;
  CalcTotalesITBIS13.Value := 0;
  CalcTotalesITBIS16.Value := 0;
  CalcTotalesITBIS18.Value := 0;

  rxCalcVenta.First;
  while not rxCalcVenta.Eof do
  begin
    if rxCalcVentaTipoVenta.AsInteger in [0, 2, 3] then
    begin
      PrecioFinal := rxCalcVentaPrecio.AsCurrency;
      Desc := PrecioFinal * rxCalcVentaPorcDescItem.AsCurrency / 100;
      Recargo := 0;
      if rxCalcVentaTipoVenta.AsInteger = 3 then
        Recargo := PrecioFinal;

      PrecioFinal := PrecioFinal - Desc + Recargo;
      Cantidad := rxCalcVentaCant.AsFloat;

      Tasa := 0;
      dmInventario.tblTasaITBIS.Close;
      dmInventario.tblTasaITBIS.Open;
      if dmInventario.tblTasaITBIS.Locate('IDTASAITBIS', rxCalcVentaIDTasaITBIS.AsInteger, []) then
        Tasa := dmInventario.tblTasaITBISPORCIENTO.Value;

      if TRANS_ITBIS = 1 then
        Base := PrecioFinal / (1 + Tasa / 100)
      else
        Base := PrecioFinal;

      isExento := rxCalcVentaItbisExento.AsInteger = 1;

      if not isExento then
      begin
        if TRANS_ITBIS = 1 then
          ITBIS := ITBIS + ((PrecioFinal - Base) * Cantidad)
        else
          ITBIS := ITBIS + (Base * Tasa / 100 * Cantidad);

        case Tasa of
          8: CalcTotalesITBIS8.Value := CalcTotalesITBIS8.Value + ((PrecioFinal - Base) * Cantidad);
          11: CalcTotalesITBIS11.Value := CalcTotalesITBIS11.Value + ((PrecioFinal - Base) * Cantidad);
          13: CalcTotalesITBIS13.Value := CalcTotalesITBIS13.Value + ((PrecioFinal - Base) * Cantidad);
          16: CalcTotalesITBIS16.Value := CalcTotalesITBIS16.Value + ((PrecioFinal - Base) * Cantidad);
          18: CalcTotalesITBIS18.Value := CalcTotalesITBIS18.Value + ((PrecioFinal - Base) * Cantidad);
        end;
      end;

      Subtotal := Subtotal + Base * Cantidad;
    end;
    rxCalcVenta.Next;
  end;

  Propina := RoundTo(Subtotal * PROPINA_LEY, -2);

  CalcTotalesSubTotalBase.Value := RoundTo(Subtotal, -2);
  CalcTotalesITBISTotal.Value := RoundTo(ITBIS, -2);
  CalcTotalesPropinaLegal.Value := Propina;
  CalcTotalesTotalNeto.Value := RoundTo(
    Subtotal
    - (Subtotal * CalcTotalesMontoDescGlobal.Value / 100)
    + ITBIS
    + CalcTotalesMontoRecargo.Value
    + Propina
    + CalcTotalesPropinaAdicional.Value, -2);
  CalcTotales.Post;
end;

end.
