unit URepPagoComisionesXVta;

interface

uses
  Windows, SysUtils, Variants, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, DB, QuickRpt, QRCtrls;

type
  TModoRepComision = (mrcResumido, mrcDetallado);

  TqckRepPagoComisionesXVta = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabelEmpresa: TQRDBText;
    QRLabelDireccion: TQRDBText;
    QRLabelCiudad: TQRDBText;
    QRLabelTelefono: TQRDBText;
    QRLabelTitulo: TQRLabel;
    QRLabelPeriodo: TQRLabel;
    QRSysDataFecha: TQRSysData;

    QRBand2: TQRBand;
    QRLabelColVendedor: TQRLabel;
    QRLabelColFechaPago: TQRLabel;
    QRLabelColDesde: TQRLabel;
    QRLabelColHasta: TQRLabel;
    QRLabelColMontoBase: TQRLabel;
    QRLabelColPorc: TQRLabel;
    QRLabelColComision: TQRLabel;

    QRGroup1: TQRGroup;
    QRLabelEmpleado: TQRLabel;

    QRBand3: TQRBand;
    QRDBTextFechaPago: TQRDBText;
    QRDBTextFechaInicio: TQRDBText;
    QRDBTextFechaFinal: TQRDBText;
    QRDBTextMontoBase: TQRDBText;
    QRDBTextPorcComision: TQRDBText;
    QRDBTextMontoComision: TQRDBText;

    QRBand4: TQRBand;
    QRLabelEmpleadoResumen: TQRLabel;
    QRLabelTotalVendedor: TQRLabel;
    QRExprTotalBaseVendedor: TQRExpr;
    QRExprTotalComisionVendedor: TQRExpr;

    QRBand5: TQRBand;
    QRLabelTotalGeneral: TQRLabel;
    QRExprTotalBaseGeneral: TQRExpr;
    QRExprTotalComisionGeneral: TQRExpr;

    procedure QRLabelPeriodoPrint(Sender: TObject; var Value: String);
    procedure QRLabelEmpleadoPrint(Sender: TObject; var Value: String);
    procedure QRLabelEmpleadoResumenPrint(Sender: TObject; var Value: String);
  private
    FFechaIni: TDateTime;
    FFechaFin: TDateTime;
    FModo: TModoRepComision;

    procedure AplicarModoReporte;
    function NombreVendedorActual: string;
  public
    procedure ConfigurarReporte(
      const AFechaIni, AFechaFin: TDateTime;
      const AModo: TModoRepComision
    );
  end;

var
  qckRepPagoComisionesXVta: TqckRepPagoComisionesXVta;

implementation

uses
  UGlobal, UDatModComisiones, UDatModCompania;

{$R *.DFM}

procedure TqckRepPagoComisionesXVta.ConfigurarReporte(
  const AFechaIni, AFechaFin: TDateTime;
  const AModo: TModoRepComision);
begin
  FFechaIni := ExtraerFecha(AFechaIni);
  FFechaFin := ExtraerFecha(AFechaFin);
  FModo := AModo;

  if FFechaFin < FFechaIni then
    raise Exception.Create(
      'La fecha final del reporte de comisiones no puede ser menor ' +
      'que la fecha inicial.'
    );

  {
    El reporte usa exactamente el dataset de COMISION_XVTA que ya existe
    en UDatModComisiones.

    SQL esperado en tblComisionXVta:

      SELECT *
      FROM COMISION_XVTA
      WHERE FECHA_PAGO BETWEEN :FECHAINI AND :FECHAFIN
      ORDER BY CODIGO_EMPLEADO, FECHA_PAGO, FECHA_INICIO, FECHA_FINAL

    El ORDER BY es importante para que el resumen por vendedor sea
    determinístico cuando el rango contiene más de un período.
  }
  dmComision.tblComisionXVta.Close;
  dmComision.tblComisionXVta.Params[0].Value := FFechaIni;
  dmComision.tblComisionXVta.Params[1].Value := FFechaFin;
  dmComision.tblComisionXVta.Open;

  if dmComision.qryVendedores.State = dsInactive then
    dmComision.qryVendedores.Open;

  AplicarModoReporte;
end;

procedure TqckRepPagoComisionesXVta.AplicarModoReporte;
var
  LDetallado: Boolean;
begin
  LDetallado := FModo = mrcDetallado;

  if LDetallado then
    QRLabelTitulo.Caption := 'REPORTE DETALLADO DE COMISIONES'
  else
    QRLabelTitulo.Caption := 'RESUMEN DE COMISIONES';

  {
    QuickReport usa Enabled para decidir si un componente imprimible
    participa o no en la salida. Visible controla la interfaz VCL,
    pero no es fiable para excluir componentes de la impresion.

    DETALLADO:
      Vendedor en QRGroup1.
      Una linea QRBand3 por registro COMISION_XVTA.
      QRBand4 imprime Total Vendedor.

    RESUMIDO:
      No imprime encabezado de grupo ni detalle.
      QRBand4 imprime una linea por vendedor con su nombre y totales.
  }

  { Encabezados }
  QRLabelColVendedor.Enabled := not LDetallado;
  QRLabelColFechaPago.Enabled := LDetallado;
  QRLabelColDesde.Enabled := LDetallado;
  QRLabelColHasta.Enabled := LDetallado;
  QRLabelColMontoBase.Enabled := True;
  QRLabelColPorc.Enabled := LDetallado;
  QRLabelColComision.Enabled := True;

  { Nombre vendedor en cabecera de grupo: solo detalle }
  QRLabelEmpleado.Enabled := LDetallado;

  { Linea detalle }
  QRDBTextFechaPago.Enabled := LDetallado;
  QRDBTextFechaInicio.Enabled := LDetallado;
  QRDBTextFechaFinal.Enabled := LDetallado;
  QRDBTextMontoBase.Enabled := LDetallado;
  QRDBTextPorcComision.Enabled := LDetallado;
  QRDBTextMontoComision.Enabled := LDetallado;

  { Footer del vendedor }
  QRLabelEmpleadoResumen.Enabled := not LDetallado;
  QRLabelTotalVendedor.Enabled := LDetallado;
  QRExprTotalBaseVendedor.Enabled := True;
  QRExprTotalComisionVendedor.Enabled := True;

  { Total general siempre se imprime }
  QRLabelTotalGeneral.Enabled := True;
  QRExprTotalBaseGeneral.Enabled := True;
  QRExprTotalComisionGeneral.Enabled := True;

  if LDetallado then
  begin
    QRGroup1.Height := 22;
    QRBand3.Height := 18;
  end
  else
  begin
    {
      Las bandas se mantienen con altura minima para que QuickReport
      recorra el dataset y ejecute correctamente los grupos/acumulados.
    }
    QRGroup1.Height := 1;
    QRBand3.Height := 1;
  end;
end;

function TqckRepPagoComisionesXVta.NombreVendedorActual: string;
var
  LNombre: Variant;
  LCodigo: Integer;
begin
  Result := '';

  if dmComision.tblComisionXVta.State = dsInactive then
    Exit;

  if dmComision.tblComisionXVta.IsEmpty then
    Exit;

  if dmComision.tblComisionXVtaCODIGO_EMPLEADO.IsNull then
    Exit;

  LCodigo := dmComision.tblComisionXVtaCODIGO_EMPLEADO.Value;

  if dmComision.qryVendedores.State = dsInactive then
    dmComision.qryVendedores.Open;

  LNombre := dmComision.qryVendedores.Lookup(
    'CODIGO',
    LCodigo,
    'NOMBREVENDEDOR'
  );

  if VarIsNull(LNombre) or VarIsEmpty(LNombre) then
    Result := IntToStr(LCodigo)
  else
    Result := IntToStr(LCodigo) + ' - ' + VarToStr(LNombre);
end;

procedure TqckRepPagoComisionesXVta.QRLabelPeriodoPrint(
  Sender: TObject; var Value: String);
begin
  Value :=
    'Desde ' + FormatDateTime('dd-mmm-yyyy', FFechaIni) +
    '  hasta ' + FormatDateTime('dd-mmm-yyyy', FFechaFin);
end;

procedure TqckRepPagoComisionesXVta.QRLabelEmpleadoPrint(
  Sender: TObject; var Value: String);
begin
  Value := NombreVendedorActual;
end;

procedure TqckRepPagoComisionesXVta.QRLabelEmpleadoResumenPrint(
  Sender: TObject; var Value: String);
begin
  Value := NombreVendedorActual;
end;

end.
