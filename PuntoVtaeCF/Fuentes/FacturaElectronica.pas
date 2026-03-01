unit FacturaElectronica;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls,
  ShellApi, Dialogs, DB, Grids, StdCtrls, Buttons, variants;

type
  TDetalleItem = class
  private
    FTipo: Integer;
    FCantidad: Currency;
    FDescripcion: string;
    FPrecio: Currency;
    FTasaImpuesto: string;
    FCodigo: string;
    FUnidad: string;

  public
    property Tipo: Integer read FTipo write FTipo;
    property Cantidad: Currency read FCantidad write FCantidad;
    property Descripcion: string read FDescripcion write FDescripcion;
    property Precio: Currency read FPrecio write FPrecio;
    property TasaImpuesto: AnsiString read FTasaImpuesto write FTasaImpuesto;
    property Codigo: AnsiString read FCodigo write FCodigo;
    property Unidad: AnsiString read FUnidad write FUnidad;

    // Constructor
    constructor Create(ATipo: Integer; ACantidad: Currency; ADescripcion: string;
      APrecio: Currency; ATasaImpuesto, ACodigo, AUnidad: string);
  end;

  TFacturaElectronica = class
  private
    FTipoDeFactura: Integer;
    FNCF: string;
    FRazonSocialDelComprador: string;
    FRNCDelComprador: string;
    FNCFReferencia: string;
    FDescuento: Currency;
    FRecargo: Currency;
    FPropina: Currency;
    FComentarios: string;
    FPagoEfectivo: Currency;
    FPagoChequeTransferenciaDeposito: Currency;
    FPagoTarjetaDebitoCredito: Currency;
    FPagoACredito: Currency;
    FPagoBonosOCertificados: Currency;
    FPagoPermuta: Currency;
    FPagoNotaCredito: Currency;
    FPagoOtros: Currency;
    FFechaVencimientoSecuencia: TDateTime;
    FTipoDeIngreso: Integer;
    FFechaEmision: TDateTime;
    FCondiciones: Integer;
    FIndicadorMontoGravado: Integer;
    FMunicipio: Integer;
    FProvincia: Integer;
    //FDetalle: array of TDetalleItem; // Lista de detalle
    FDetalle: array[0..90] of TDetalleItem; // Campo privado para almacenar el arreglo

    // Setters y Getters
    procedure SetTipoDeFactura(Value: Integer);
    procedure SetNCF(Value: string);
    procedure SetRazonSocialDelComprador(Value: string);
    procedure SetRNCDelComprador(Value: string);
    procedure SetNCFReferencia(Value: string);
    procedure SetDescuento(Value: Currency);
    procedure SetRecargo(Value: Currency);
    procedure SetPropina(Value: Currency);
    procedure SetComentarios(Value: string);
    procedure SetPagoEfectivo(Value: Currency);
    procedure SetPagoChequeTransferenciaDeposito(Value: Currency);
    procedure SetPagoTarjetaDebitoCredito(Value: Currency);
    procedure SetPagoACredito(Value: Currency);
    procedure SetPagoBonosOCertificados(Value: Currency);
    procedure SetPagoPermuta(Value: Currency);
    procedure SetPagoNotaCredito(Value: Currency);
    procedure SetPagoOtros(Value: Currency);
    procedure SetFechaVencimientoSecuencia(Value: TDateTime);
    procedure SetTipoDeIngreso(Value: Integer);
    procedure SetFechaEmision(Value: TDateTime);
    procedure SetCondiciones(Value: Integer);
    procedure SetIndicadorMontoGravado(Value: Integer);
    procedure SetMunicipio(Value: Integer);
    procedure SetProvincia(Value: Integer);

  public
    // Constructor
    constructor Create;

    // Propiedades
    property TipoDeFactura: Integer read FTipoDeFactura write SetTipoDeFactura;
    property NCF: string read FNCF write SetNCF;
    property RazonSocialDelComprador: string read FRazonSocialDelComprador write SetRazonSocialDelComprador;
    property RNCDelComprador: string read FRNCDelComprador write SetRNCDelComprador;
    property NCFReferencia: string read FNCFReferencia write SetNCFReferencia;
    property Descuento: Currency read FDescuento write SetDescuento;
    property Recargo: Currency read FRecargo write SetRecargo;
    property Propina: Currency read FPropina write SetPropina;
    property Comentarios: string read FComentarios write SetComentarios;
    property PagoEfectivo: Currency read FPagoEfectivo write SetPagoEfectivo;
    property PagoChequeTransferenciaDeposito: Currency read FPagoChequeTransferenciaDeposito write SetPagoChequeTransferenciaDeposito;
    property PagoTarjetaDebitoCredito: Currency read FPagoTarjetaDebitoCredito write SetPagoTarjetaDebitoCredito;
    property PagoACredito: Currency read FPagoACredito write SetPagoACredito;
    property PagoBonosOCertificados: Currency read FPagoBonosOCertificados write SetPagoBonosOCertificados;
    property PagoPermuta: Currency read FPagoPermuta write SetPagoPermuta;
    property PagoNotaCredito: Currency read FPagoNotaCredito write SetPagoNotaCredito;
    property PagoOtros: Currency read FPagoOtros write SetPagoOtros;
    property FechaVencimientoSecuencia: TDateTime read FFechaVencimientoSecuencia write SetFechaVencimientoSecuencia;
    property TipoDeIngreso: Integer read FTipoDeIngreso write SetTipoDeIngreso;
    property FechaEmision: TDateTime read FFechaEmision write SetFechaEmision;
    property Condiciones: Integer read FCondiciones write SetCondiciones;
    property IndicadorMontoGravado: Integer read FIndicadorMontoGravado write SetIndicadorMontoGravado;
    property Municipio: Integer read FMunicipio write SetMunicipio;
    property Provincia: Integer read FProvincia write SetProvincia;


    // Métodos
    procedure AgregarDetalle(DetalleItem: TDetalleItem);
    procedure EscribirArchivoTxt(const FileName: string);
  end;

implementation

constructor TDetalleItem.Create(ATipo: Integer; ACantidad: Currency; ADescripcion: string;
  APrecio: Currency; ATasaImpuesto, ACodigo, AUnidad: string);
begin
  FTipo := ATipo;
  FCantidad := ACantidad;
  FDescripcion := ADescripcion;
  FPrecio := APrecio;
  FTasaImpuesto := ATasaImpuesto;
  FCodigo := ACodigo;
  FUnidad := AUnidad;
end;

constructor TFacturaElectronica.Create;
begin
  inherited Create;
  // Inicialización de valores por defecto
  FTipoDeFactura := 2;

end;

// Setters y Getters
procedure TFacturaElectronica.SetTipoDeFactura(Value: Integer);
begin
  if (Value >= 1) and (Value <= 10) then
    FTipoDeFactura := Value
  else
    FTipoDeFactura := 2;
end;

procedure TFacturaElectronica.SetNCF(Value: string);
begin
  if Length(Value) = 13 and Value[1] = 'E' then
    FNCF := Value
  else
    raise Exception.Create('NCF inválido');
end;

procedure TFacturaElectronica.SetRazonSocialDelComprador(Value: string);
begin
  FRazonSocialDelComprador := Value;
end;

procedure TFacturaElectronica.SetRNCDelComprador(Value: string);
begin
  // Validación del RNC (según las reglas específicas)
  if (Length(Value) = 11 or Length(Value) = 9) and IsValidRNC(Value) then
    FRNCDelComprador := Value
  else
    raise Exception.Create('RNC inválido');
end;

procedure TFacturaElectronica.SetNCFReferencia(Value: string);
begin
  if Length(Value) = 13 and Value[1] = 'E' then
    FNCFReferencia := Value
  else
    raise Exception.Create('NCF de referencia inválido');
end;

procedure TFacturaElectronica.SetDescuento(Value: Currency);
begin
  if Value >= 0 then
    FDescuento := Value
  else
    raise Exception.Create('Descuento no puede ser negativo');
end;

procedure TFacturaElectronica.SetRecargo(Value: Currency);
begin
  if Value >= 0 then
    FRecargo := Value
  else
    raise Exception.Create('Recargo no puede ser negativo');
end;

procedure TFacturaElectronica.SetPropina(Value: Currency);
begin
  if Value >= 0 then
    FPropina := Value
  else
    raise Exception.Create('Propina no puede ser negativa');
end;

procedure TFacturaElectronica.SetComentarios(Value: string);
begin
  FComentarios := Value;
end;

procedure TFacturaElectronica.SetPagoEfectivo(Value: Currency);
begin
  if Value >= 0 then
    FPagoEfectivo := Value
  else
    raise Exception.Create('Pago efectivo no puede ser negativo');
end;

procedure TFacturaElectronica.SetPagoChequeTransferenciaDeposito(Value: Currency);
begin
  if Value >= 0 then
    FPagoChequeTransferenciaDeposito := Value
  else
    raise Exception.Create('Pago cheque/transferencia/depósito no puede ser negativo');
end;

procedure TFacturaElectronica.SetPagoTarjetaDebitoCredito(Value: Currency);
begin
  if Value >= 0 then
    FPagoTarjetaDebitoCredito := Value
  else
    raise Exception.Create('Pago tarjeta de débito/crédito no puede ser negativo');
end;

procedure TFacturaElectronica.SetPagoACredito(Value: Currency);
begin
  if Value >= 0 then
    FPagoACredito := Value
  else
    raise Exception.Create('Pago a crédito no puede ser negativo');
end;

procedure TFacturaElectronica.SetPagoBonosOCertificados(Value: Currency);
begin
  if Value >= 0 then
    FPagoBonosOCertificados := Value
  else
    raise Exception.Create('Pago bonos/certificados no puede ser negativo');
end;

procedure TFacturaElectronica.SetPagoPermuta(Value: Currency);
begin
  if Value >= 0 then
    FPagoPermuta := Value
  else
    raise Exception.Create('Pago permuta no puede ser negativo');
end;

procedure TFacturaElectronica.SetPagoNotaCredito(Value: Currency);
begin
  if Value >= 0 then
    FPagoNotaCredito := Value
  else
    raise Exception.Create('Pago nota de crédito no puede ser negativo');
end;

procedure TFacturaElectronica.SetPagoOtros(Value: Currency);
begin
  if Value >= 0 then
    FPagoOtros := Value
  else
    raise Exception.Create('Pago otros no puede ser negativo');
end;

procedure TFacturaElectronica.SetFechaVencimientoSecuencia(Value: TDateTime);
begin
  FFechaVencimientoSecuencia := Value;
end;

procedure TFacturaElectronica.SetTipoDeIngreso(Value: Integer);
begin
  if (Value >= 1) and (Value <= 6) then
    FTipoDeIngreso := Value
  else
    FTipoDeIngreso := 1;
end;

procedure TFacturaElectronica.SetFechaEmision(Value: TDateTime);
begin
  FFechaEmision := Value;
end;

procedure TFacturaElectronica.SetCondiciones(Value: Integer);
begin
  if (Value >= 1) and (Value <= 3) then
    FCondiciones := Value
  else
    FCondiciones := 1;
end;

procedure TFacturaElectronica.SetIndicadorMontoGravado(Value: Integer);
begin
  if (Value = 0) or (Value = 1) then
    FIndicadorMontoGravado := Value
  else
    FIndicadorMontoGravado := 0;
end;

procedure TFacturaElectronica.SetMunicipio(Value: Integer);
begin
  FMunicipio := Value;
end;

procedure TFacturaElectronica.SetProvincia(Value: Integer);
begin
  FProvincia := Value;
end;

// Método para agregar detalles
procedure TFacturaElectronica.AgregarDetalle(DetalleItem: TDetalleItem);
var
  Len: Integer;
begin
  Len := Length(FDetalle);
  SetLength(FDetalle, Len + 1);
  FDetalle[Len] := DetalleItem;
end;

// Método para escribir los valores en un archivo de texto
procedure TFacturaElectronica.EscribirArchivoTxt(const FileName: string);
var
  TxtFile: TextFile;
  i: Integer;
  LineaDetalle: string;
  EncabezadoLinea: string;
begin
  // Abrir archivo para escritura
  AssignFile(TxtFile, FileName);
  Rewrite(TxtFile);

  try
    // Construir línea de encabezado
    EncabezadoLinea := Format('%d||%s||%s||%s||%s||%.2f||%.2f||%.2f||%s||%.2f||%.2f||%.2f||%.2f||%.2f||%.2f||%.2f||%.2f||%s||%d||%s||%d||%d||%.6d||%.6d',
      [FTipoDeFactura, FNCF, FRazonSocialDelComprador, FRNCDelComprador, FNCFReferencia,
       FDescuento, FRecargo, FPropina, FComentarios, FPagoEfectivo, FPagoChequeTransferenciaDeposito,
       FPagoTarjetaDebitoCredito, FPagoACredito, FPagoBonosOCertificados, FPagoPermuta,
       FPagoNotaCredito, FPagoOtros, FormatDateTime('dd-mm-yyyy', FFechaVencimientoSecuencia),
       FTipoDeIngreso, FormatDateTime('dd-mm-yyyy', FFechaEmision), FCondiciones,
       FIndicadorMontoGravado, FMunicipio, FProvincia]);

    // Escribir línea de encabezado
    WriteLn(TxtFile, EncabezadoLinea);

    // Escribir cada detalle en líneas separadas
    // Detalles de la factura
  DetalleTexto := '';
  for i := 0 to FDetalles.Count - 1 do
  begin
    Detalle := TDetalleFactura(FDetalles[i]);
    DetalleTexto := DetalleTexto + sLineBreak + IntToStr(Detalle.Tipo) + '||' +
                    FormatFloat('0.00', Detalle.Cantidad) + '||' + Detalle.Descripcion + '||' +
                    FormatFloat('0.00', Detalle.Precio) + '||' + IntToStr(Detalle.TasaImpuesto) + '||' +
                    Detalle.Codigo + '||' + Detalle.Unidad;
  end;
  finally
    // Cerrar archivo
    CloseFile(TxtFile);
  end;
end;

end.
