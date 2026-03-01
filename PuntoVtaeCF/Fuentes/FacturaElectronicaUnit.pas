unit FacturaElectronicaUnit;

interface

uses
  SysUtils, Classes;

type
  TDetalleFactura = class
  private
    FTipo: Integer;
    FCantidad: Double;
    FDescripcion: string;
    FPrecio: Double;
    FTasaImpuesto: Integer;
    FCodigo: string;
    FUnidad: string;

    // Setters con validaciones
    procedure SetTipo(Value: Integer);
    procedure SetCantidad(Value: Double);
    procedure SetDescripcion(Value: string);
    procedure SetPrecio(Value: Double);
    procedure SetTasaImpuesto(Value: Integer);
    procedure SetCodigo(Value: string);
    procedure SetUnidad(Value: string);

  public
    // Getters y setters
    property Tipo: Integer read FTipo write SetTipo;
    property Cantidad: Double read FCantidad write SetCantidad;
    property Descripcion: string read FDescripcion write SetDescripcion;
    property Precio: Double read FPrecio write SetPrecio;
    property TasaImpuesto: Integer read FTasaImpuesto write SetTasaImpuesto;
    property Codigo: string read FCodigo write SetCodigo;
    property Unidad: string read FUnidad write SetUnidad;

    // Constructor para inicializar valores
    constructor Create(ATipo: Integer; ACantidad: Double; ADescripcion: string; APrecio: Double;
      ATasaImpuesto: Integer; ACodigo, AUnidad: string);
  end;

  TFacturaElectronica = class
  private
    FTipoDeFactura: Integer;
    FNCF: string;
    FRazonSocialDelComprador: string;
    FRNCDelComprador: string;
    FNCFReferencia: string;
    FDescuento: Double;
    FRecargo: Double;
    FPropina: Double;
    FComentarios: string;
    FPagoEfectivo: Double;
    FPagoChequeTransferenciaDeposito: Double;
    FPagoTarjetaDebitoCredito: Double;
    FPagoACredito: Double;
    FPagoBonosOCertificados: Double;
    FPagoPermuta: Double;
    FPagoNotaCredito: Double;
    FPagoOtros: Double;
    FFechaVencimientoSecuencia: TDateTime;
    FTipoDeIngreso: Integer;
    FFechaEmision: TDateTime;
    FCondiciones: Integer;
    FIndicadorMontoGravado: Integer;
    FMunicipio: string;
    FProvincia: string;

    FDetalles: TList;
             
    // Setters con validaciones
    procedure SetTipoDeFactura(Value: Integer);
    procedure SetNCF(Value: string);
    procedure SetRazonSocialDelComprador(Value: string);
    procedure SetRNCDelComprador(Value: string);
    procedure SetNCFReferencia(Value: string);
    procedure SetDescuento(Value: Double);
    procedure SetRecargo(Value: Double);
    procedure SetPropina(Value: Double);
    procedure SetComentarios(Value: string);
    procedure SetPagoEfectivo(Value: Double);
    procedure SetPagoChequeTransferenciaDeposito(Value: Double);
    procedure SetPagoTarjetaDebitoCredito(Value: Double);
    procedure SetPagoACredito(Value: Double);
    procedure SetPagoBonosOCertificados(Value: Double);
    procedure SetPagoPermuta(Value: Double);
    procedure SetPagoNotaCredito(Value: Double);
    procedure SetPagoOtros(Value: Double);
    procedure SetFechaVencimientoSecuencia(Value: TDateTime);
    procedure SetTipoDeIngreso(Value: Integer);
    procedure SetFechaEmision(Value: TDateTime);
    procedure SetCondiciones(Value: Integer);
    procedure SetIndicadorMontoGravado(Value: Integer);
    procedure SetMunicipio(Value: string);
    procedure SetProvincia(Value: string);


  public
    // Getters y setters
    property TipoDeFactura: Integer read FTipoDeFactura write SetTipoDeFactura;
    property NCF: string read FNCF write SetNCF;
    property RazonSocialDelComprador: string read FRazonSocialDelComprador write SetRazonSocialDelComprador;
    property RNCDelComprador: string read FRNCDelComprador write SetRNCDelComprador;
    property NCFReferencia: string read FNCFReferencia write SetNCFReferencia;
    property Descuento: Double read FDescuento write SetDescuento;
    property Recargo: Double read FRecargo write SetRecargo;
    property Propina: Double read FPropina write SetPropina;
    property Comentarios: string read FComentarios write SetComentarios;
    property PagoEfectivo: Double read FPagoEfectivo write SetPagoEfectivo;
    property PagoChequeTransferenciaDeposito: Double read FPagoChequeTransferenciaDeposito write SetPagoChequeTransferenciaDeposito;
    property PagoTarjetaDebitoCredito: Double read FPagoTarjetaDebitoCredito write SetPagoTarjetaDebitoCredito;
    property PagoACredito: Double read FPagoACredito write SetPagoACredito;
    property PagoBonosOCertificados: Double read FPagoBonosOCertificados write SetPagoBonosOCertificados;
    property PagoPermuta: Double read FPagoPermuta write SetPagoPermuta;
    property PagoNotaCredito: Double read FPagoNotaCredito write SetPagoNotaCredito;
    property PagoOtros: Double read FPagoOtros write SetPagoOtros;
    property FechaVencimientoSecuencia: TDateTime read FFechaVencimientoSecuencia write SetFechaVencimientoSecuencia;
    property TipoDeIngreso: Integer read FTipoDeIngreso write SetTipoDeIngreso;
    property FechaEmision: TDateTime read FFechaEmision write SetFechaEmision;
    property Condiciones: Integer read FCondiciones write SetCondiciones;
    property IndicadorMontoGravado: Integer read FIndicadorMontoGravado write SetIndicadorMontoGravado;
    property Municipio: string read FMunicipio write SetMunicipio;
    property Provincia: string read FProvincia write SetProvincia;

    // Métodos
    procedure GuardarFacturaEnArchivo(const NombreArchivo: string);
    procedure AgregarDetalle(ADetalle: TDetalleFactura);
    function GenerarTextoFactura: string;

    // Constructor
    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TDetalleFactura }

constructor TDetalleFactura.Create(ATipo: Integer; ACantidad: Double; ADescripcion: string; APrecio: Double;
  ATasaImpuesto: Integer; ACodigo, AUnidad: string);
begin
  SetTipo(ATipo);
  SetCantidad(ACantidad);
  SetDescripcion(ADescripcion);
  SetPrecio(APrecio);
  SetTasaImpuesto(ATasaImpuesto);
  SetCodigo(ACodigo);
  SetUnidad(AUnidad);
end;

procedure TDetalleFactura.SetTipo(Value: Integer);
begin
  if (Value < 1) or (Value > 4) then
    raise Exception.Create('Tipo inválido. Debe ser 1, 2, 3 o 4.');
  FTipo := Value;
end;

procedure TDetalleFactura.SetCantidad(Value: Double);
begin
  if Value <= 0 then
    raise Exception.Create('La cantidad debe ser mayor a 0.');
  FCantidad := Value;
end;

procedure TDetalleFactura.SetDescripcion(Value: string);
begin
  if Length(Value) > 40 then
    raise Exception.Create('La descripción no puede tener más de 40 caracteres.');
  FDescripcion := Value;
end;

procedure TDetalleFactura.SetPrecio(Value: Double);
begin
  if Value <= 0 then
    raise Exception.Create('El precio debe ser mayor a 0.');
  FPrecio := Value;
end;

procedure TDetalleFactura.SetTasaImpuesto(Value: Integer);
begin
  if (Value <> 1800) and (Value <> 1600) and (Value <> 1300) and (Value <> 1100) and
     (Value <> 800) and (Value <> 0) then
    raise Exception.Create('Tasa de impuesto inválida.');
  FTasaImpuesto := Value;
end;

procedure TDetalleFactura.SetCodigo(Value: string);
begin
  FCodigo := Value;
end;

procedure TDetalleFactura.SetUnidad(Value: string);
begin
  FUnidad := Value;
end;

{ TFacturaElectronica }


constructor TFacturaElectronica.Create;
begin
  FDetalles := TList.Create;
end;

destructor TFacturaElectronica.Destroy;
begin
  FDetalles.Free;
  inherited;
end;

procedure TFacturaElectronica.AgregarDetalle(ADetalle: TDetalleFactura);
begin
  FDetalles.Add(ADetalle);
end;

function TFacturaElectronica.GenerarTextoFactura: string;
var
  i: Integer;
  DetalleTexto: string;
  Detalle: TDetalleFactura;
begin
  Result :=   // Generar encabezado de la factura
            IntToStr(TipoDeFactura) + '||' + NCF + '||' + RazonSocialDelComprador + '||' +
            RNCDelComprador + '||' + NCFReferencia + '||' + FloatToStr(Descuento) + '||' +
            FloatToStr(Recargo) + '||' + FloatToStr(Propina) + '||' + Comentarios + '||' +
            FloatToStr(PagoEfectivo) + '||' + FloatToStr(PagoChequeTransferenciaDeposito) + '||' +
            FloatToStr(PagoTarjetaDebitoCredito) + '||' + FloatToStr(PagoACredito) + '||' +
            FloatToStr(PagoBonosOCertificados) + '||' + FloatToStr(PagoPermuta) + '||'+
            FormatFloat('0.00', PagoNotaCredito) + '||' + 
            FormatFloat('0.00', PagoOtros) + '||' + 
            FormatDateTime('dd-mm-yyyy',FechaVencimientoSecuencia) + '||' +
            IntToStr(TipoDeIngreso) + '||' +
            FormatDateTime('dd-mm-yyyy',FechaEmision) + '||' +
            IntToStr(Condiciones) + '||' + IntToStr(IndicadorMontoGravado) + '||' +
            Municipio + '||' + Provincia;

  // Ahora agregamos los detalles de la factura
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

  // Agregamos los detalles a la factura
  Result := Result + DetalleTexto;
end;

procedure TFacturaElectronica.GuardarFacturaEnArchivo(const NombreArchivo: string);
var
  TextoFactura: string;
  Archivo: TextFile;
begin
  // Generar el texto de la factura
  TextoFactura := GenerarTextoFactura;

  // Asignar el archivo y abrirlo
  AssignFile(Archivo, NombreArchivo);
  Rewrite(Archivo);

  try
    // Escribir el texto de la factura en el archivo
    WriteLn(Archivo, TextoFactura);
  finally
    // Cerrar el archivo
    CloseFile(Archivo);
  end;
end;

procedure TFacturaElectronica.SetComentarios(Value: string);
begin
  if Length(Value) > 500 then
    raise Exception.Create('Los comentarios no pueden exceder los 500 caracteres.');
  FComentarios := Value;
end;

procedure TFacturaElectronica.SetCondiciones(Value: Integer);
begin
  if (Value < 0) or (Value > 10) then
    raise Exception.Create('Las condiciones deben ser un valor entre 0 y 10.');
  FCondiciones := Value;
end;

procedure TFacturaElectronica.SetDescuento(Value: Double);
begin
  if (Value < 0) or (Value > 100) then
    raise Exception.Create('El descuento debe estar entre 0 y 100%.');
  FDescuento := Value;
end;

procedure TFacturaElectronica.SetFechaEmision(Value: TDateTime);
begin
  if Value > Now then
    raise Exception.Create('La fecha de emisión no puede ser en el futuro.');
  FFechaEmision := Value;
end;

procedure TFacturaElectronica.SetFechaVencimientoSecuencia(Value: TDateTime);
begin
  if Value <= FFechaEmision then
    raise Exception.Create('La fecha de vencimiento debe ser posterior a la fecha de emisión.');
  FFechaVencimientoSecuencia := Value;
end;

procedure TFacturaElectronica.SetIndicadorMontoGravado(Value: Integer);
begin
  if (Value < 0) or (Value > 1) then
    raise Exception.Create('El indicador de monto gravado debe ser 0 o 1.');
  FIndicadorMontoGravado := Value;
end;

procedure TFacturaElectronica.SetMunicipio(Value: string);
begin
  if Length(Value) = 0 then
    raise Exception.Create('El municipio no puede estar vacío.');
  FMunicipio := Value;
end;

procedure TFacturaElectronica.SetNCF(Value: string);
begin
  if Length(Value) <> 19 then
    raise Exception.Create('El NCF debe tener 19 caracteres.');
  FNCF := Value;
end;

procedure TFacturaElectronica.SetNCFReferencia(Value: string);
begin
  if Length(Value) > 19 then
    raise Exception.Create('El NCF de referencia no puede exceder los 19 caracteres.');
  FNCFReferencia := Value;
end;

procedure TFacturaElectronica.SetPagoACredito(Value: Double);
begin
  if Value < 0 then
    raise Exception.Create('El pago a crédito no puede ser negativo.');
  FPagoACredito := Value;
end;

procedure TFacturaElectronica.SetPagoBonosOCertificados(Value: Double);
begin
  if Value < 0 then
    raise Exception.Create('El pago con bonos o certificados no puede ser negativo.');
  FPagoBonosOCertificados := Value;
end;

procedure TFacturaElectronica.SetPagoChequeTransferenciaDeposito(Value: Double);
begin
  if Value < 0 then
    raise Exception.Create('El pago por cheque, transferencia o depósito no puede ser negativo.');
  FPagoChequeTransferenciaDeposito := Value;
end;

procedure TFacturaElectronica.SetPagoEfectivo(Value: Double);
begin
  if Value < 0 then
    raise Exception.Create('El pago en efectivo no puede ser negativo.');
  FPagoEfectivo := Value;
end;

procedure TFacturaElectronica.SetPagoNotaCredito(Value: Double);
begin
  if Value < 0 then
    raise Exception.Create('El pago con nota de crédito no puede ser negativo.');
  FPagoNotaCredito := Value;
end;

procedure TFacturaElectronica.SetPagoOtros(Value: Double);
begin
  if Value < 0 then
    raise Exception.Create('El pago en "otros" no puede ser negativo.');
  FPagoOtros := Value;
end;

procedure TFacturaElectronica.SetPagoPermuta(Value: Double);
begin
  if Value < 0 then
    raise Exception.Create('El pago por permuta no puede ser negativo.');
  FPagoPermuta := Value;
end;

procedure TFacturaElectronica.SetPagoTarjetaDebitoCredito(Value: Double);
begin
  if Value < 0 then
    raise Exception.Create('El pago con tarjeta de débito o crédito no puede ser negativo.');
  FPagoTarjetaDebitoCredito := Value;
end;

procedure TFacturaElectronica.SetPropina(Value: Double);
begin
  if Value < 0 then
    raise Exception.Create('La propina no puede ser negativa.');
  FPropina := Value;
end;

procedure TFacturaElectronica.SetProvincia(Value: string);
begin
  if Length(Value) = 0 then
    raise Exception.Create('La provincia no puede estar vacía.');
  FProvincia := Value;
end;

procedure TFacturaElectronica.SetRazonSocialDelComprador(Value: string);
begin
  if Length(Value) = 0 then
    raise Exception.Create('La razón social del comprador no puede estar vacía.');
  FRazonSocialDelComprador := Value;
end;

procedure TFacturaElectronica.SetRecargo(Value: Double);
begin
  if Value < 0 then
    raise Exception.Create('El recargo no puede ser negativo.');
  FRecargo := Value;
end;

procedure TFacturaElectronica.SetRNCDelComprador(Value: string);
begin
  if Length(Value) <> 9 then
    raise Exception.Create('El RNC del comprador debe tener 9 caracteres.');
  FRNCDelComprador := Value;
end;

procedure TFacturaElectronica.SetTipoDeFactura(Value: Integer);
begin
  if (Value < 1) or (Value > 4) then
    raise Exception.Create('El tipo de factura debe estar entre 1 y 4.');
  FTipoDeFactura := Value;
end;

procedure TFacturaElectronica.SetTipoDeIngreso(Value: Integer);
begin
  if (Value < 1) or (Value > 3) then
    raise Exception.Create('El tipo de ingreso debe estar entre 1 y 3.');
  FTipoDeIngreso := Value;
end;


end.
