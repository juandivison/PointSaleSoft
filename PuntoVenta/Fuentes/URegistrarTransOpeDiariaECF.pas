unit URegistrarTransOpeDiariaECF;


interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Buttons, DB, DBCtrls, Grids,
  DBGrids, Mask, rxToolEdit, RxLookup, IBCustomDataSet, IBQuery, IBTable,
  DateUtils,
  WinSkinData;

type
  TSerieEcfInfo = class
  public
    Serie: string;
    DivNegocio: string;
    PECF: string;
    AICF: string;
    TipoCF: string;
    UltimoCorrelativo: Int64;
    FechaVence: TDateTime;
  end;

  TfrmRegTransOpeDiariaECF = class(TForm)
    pnlHeader: TPanel;
    lblTitulo: TLabel;
    lblSubtitulo: TLabel;
    lblEstadoDocumento: TLabel;
    pnlToolbar: TPanel;
    btnNuevoE41: TBitBtn;
    btnNuevoE43: TBitBtn;
    btnAnterior: TBitBtn;
    btnSiguiente: TBitBtn;
    btnConsultar: TBitBtn;
    btnEditarCabecera: TBitBtn;
    btnGuardar: TBitBtn;
    btnCancelar: TBitBtn;
    btnCerrar: TBitBtn;
    lblOperacion: TLabel;
    dbtxtOperacion: TDBText;
    pcPrincipal: TPageControl;
    tsDatos: TTabSheet;
    tsDetalle: TTabSheet;
    tsRevision: TTabSheet;
    tsConsulta: TTabSheet;
    pnlConsultaFiltros: TPanel;
    lblConsultaDesde: TLabel;
    lblConsultaHasta: TLabel;
    lblConsultaAyuda: TLabel;
    lblConsultaTotal: TLabel;
    dtpConsultaDesde: TDateTimePicker;
    dtpConsultaHasta: TDateTimePicker;
    btnConsultarTransacciones: TBitBtn;
    btnAbrirTransaccion: TBitBtn;
    grdConsulta: TDBGrid;
    pnlAyudaTipo: TPanel;
    lblTipoSeleccionado: TLabel;
    lblAyudaTipo: TLabel;
    grpDatosGenerales: TGroupBox;
    lblFecha: TLabel;
    lblProveedor: TLabel;
    lblCondicion: TLabel;
    lblFormaPago: TLabel;
    lblFechaVence: TLabel;
    lblTipoCompra: TLabel;
    lblObservacion: TLabel;
    lblDocumentoProveedor: TLabel;
    lblTerritorioProveedor: TLabel;
    btnCompletarTerritorio: TBitBtn;
    deFecha: TDateTimePicker;
    cmbProveedor: TRxDBLookupCombo;
    btnBuscarProveedor: TBitBtn;
    cmbCondicion: TRxDBLookupCombo;
    cmbFormaPago: TRxDBLookupCombo;
    deFechaVence: TDateTimePicker;
    cmbTipoCompra: TRxDBLookupCombo;
    edtObservacion: TDBEdit;
    rgItbisIncluido: TDBRadioGroup;
    btnIrDetalle: TBitBtn;
    lblAyudaPaso1: TLabel;
    grpLinea: TGroupBox;
    lblProducto: TLabel;
    lblDescripcion: TLabel;
    lblCantidad: TLabel;
    lblPrecio: TLabel;
    lblValor: TLabel;
    lblTasaItbis: TLabel;
    lblMontoItbis: TLabel;
    lblItbisRetenido: TLabel;
    lblTasaIsr: TLabel;
    lblTasaIsrManual: TLabel;
    lblIsrRetenido: TLabel;
    lblDepartamento: TLabel;
    lblCentroCosto: TLabel;
    lblAyudaRetenciones: TLabel;
    cmbProducto: TRxDBLookupCombo;
    btnNuevoProducto: TBitBtn;
    edtDescripcion: TDBEdit;
    rgBienServicio: TDBRadioGroup;
    edtCantidad: TDBEdit;
    edtPrecio: TDBEdit;
    edtValor: TDBEdit;
    cmbTasaItbis: TRxDBLookupCombo;
    edtMontoItbis: TDBEdit;
    edtItbisRetenido: TDBEdit;
    cmbTasaIsr: TComboBox;
    edtTasaIsrManual: TEdit;
    edtIsrRetenido: TDBEdit;
    cmbDepartamento: TRxDBLookupCombo;
    cmbCentroCosto: TRxDBLookupCombo;
    btnAgregarLinea: TBitBtn;
    btnEditarLinea: TBitBtn;
    btnGuardarLinea: TBitBtn;
    btnCancelarLinea: TBitBtn;
    btnEliminarLinea: TBitBtn;
    grdDetalle: TDBGrid;
    pnlResumenDetalle: TPanel;
    lblResumenLineas: TLabel;
    lblResumenItbis: TLabel;
    lblResumenRetenciones: TLabel;
    lblResumenNeto: TLabel;
    btnIrRevision: TBitBtn;
    grpResumenFiscal: TGroupBox;
    lblBaseFiscalTitulo: TLabel;
    lblItbisTitulo: TLabel;
    lblTotalFiscalTitulo: TLabel;
    lblRetItbisTitulo: TLabel;
    lblRetIsrTitulo: TLabel;
    lblNetoTitulo: TLabel;
    lblBaseFiscal: TLabel;
    lblTotalItbis: TLabel;
    lblTotalFiscal: TLabel;
    lblTotalRetItbis: TLabel;
    lblTotalRetIsr: TLabel;
    lblNetoCalculado: TLabel;
    lblMontoPagadoTitulo: TLabel;
    edtMontoPagado: TEdit;
    btnUsarNeto: TBitBtn;
    lblDiferencia: TLabel;
    grpSecuencia: TGroupBox;
    lblSerieTitulo: TLabel;
    cmbSerieEcf: TComboBox;
    btnRecargarSeries: TBitBtn;
    lblProximaSecuencia: TLabel;
    lblVencimientoSecuencia: TLabel;
    lblEcfActualTitulo: TLabel;
    edtEcfActual: TDBEdit;
    grpValidacion: TGroupBox;
    lstValidacion: TListBox;
    btnValidar: TBitBtn;
    btnReservarEcf: TBitBtn;
    btnEnviarEcf: TBitBtn;
    btnVolverDetalle: TBitBtn;
    grpEstadoEnvio: TGroupBox;
    lblEstadoDgiiTitulo: TLabel;
    lblEstadoDgii: TLabel;
    lblTrackIdTitulo: TLabel;
    lblTrackId: TLabel;
    memoMensajeDgii: TMemo;
    btnImprimirEcf: TBitBtn;
    qryTasaItbis: TIBQuery;
    dsTasaItbis: TDataSource;
    tblTipoPagoCxp: TIBTable;
    dsTipoPagoCxp: TDataSource;
    qrySerieEcf: TIBQuery;
    qryEstadoEnvio: TIBQuery;
    qryConsultaTransacciones: TIBQuery;
    dsConsultaTransacciones: TDataSource;
    BitBtn1: TBitBtn;
    lblGastosTXTActivo: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnNuevoE41Click(Sender: TObject);
    procedure btnNuevoE43Click(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnSiguienteClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnEditarCabeceraClick(Sender: TObject);
    procedure btnGuardarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure btnBuscarProveedorClick(Sender: TObject);
    procedure deFechaChange(Sender: TObject);
    procedure deFechaVenceChange(Sender: TObject);
    procedure cmbProveedorChange(Sender: TObject);
    procedure btnCompletarTerritorioClick(Sender: TObject);
    procedure cmbCondicionChange(Sender: TObject);
    procedure rgItbisIncluidoClick(Sender: TObject);
    procedure btnIrDetalleClick(Sender: TObject);
    procedure btnNuevoProductoClick(Sender: TObject);
    procedure cmbProductoChange(Sender: TObject);
    procedure edtCantidadExit(Sender: TObject);
    procedure edtPrecioExit(Sender: TObject);
    procedure cmbTasaItbisChange(Sender: TObject);
    procedure cmbTasaIsrChange(Sender: TObject);
    procedure edtTasaIsrManualChange(Sender: TObject);
    procedure rgBienServicioClick(Sender: TObject);
    procedure btnAgregarLineaClick(Sender: TObject);
    procedure btnEditarLineaClick(Sender: TObject);
    procedure btnGuardarLineaClick(Sender: TObject);
    procedure btnCancelarLineaClick(Sender: TObject);
    procedure btnEliminarLineaClick(Sender: TObject);
    procedure btnIrRevisionClick(Sender: TObject);
    procedure btnVolverDetalleClick(Sender: TObject);
    procedure btnUsarNetoClick(Sender: TObject);
    procedure cmbSerieEcfChange(Sender: TObject);
    procedure btnReservarEcfClick(Sender: TObject);
    procedure btnImprimirEcfClick(Sender: TObject);
    procedure pcPrincipalChange(Sender: TObject);
    procedure btnConsultarTransaccionesClick(Sender: TObject);
    procedure btnAbrirTransaccionClick(Sender: TObject);
    procedure grdConsultaDblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnEnviarEcfClick(Sender: TObject);
    procedure btnRecargarSeriesClick(Sender: TObject);
    procedure btnValidarClick(Sender: TObject);
    //procedure btnValidarClick(Sender: TObject);
  private
    FResumenBase: Currency;
    FResumenItbis: Currency;
    FResumenItbisRetenido: Currency;
    FResumenIsrRetenido: Currency;
    FResumenTotalFiscal: Currency;
    FResumenNeto: Currency;
    FEstadoEnvio: string;
    FTrackIdEnvio: string;
    FPrevMasterFilter: string;
    FPrevMasterFiltered: Boolean;
    FVerificandoTerritorio: Boolean;
    FSincronizandoFechas: Boolean;
    procedure AbrirCatalogos;
    procedure AbrirOperacionesMesActual;
    procedure AbrirOperacionesRango(ADesde, AHasta: TDateTime);
    procedure AbrirDetalleActual;
    procedure IniciarNuevo(const ATipoCF: string);
    procedure GuardarMaestro;
    procedure GuardarDetalle;
    procedure AplicarReglasTipo;
    procedure AplicarReglasDetalle;
    procedure CalcularLinea;
    procedure SincronizarTasaIsrDesdeDetalle;
    function PorcientoIsrSeleccionado: Double;
    function TextoPorcentajeAFloat(const ATexto: string): Double;
    procedure ActualizarEditorTasaIsrManual;
    procedure SincronizarMontoPagadoE41;
    procedure CalcularResumen;
    procedure ActualizarPantalla;
    procedure SincronizarFechasDesdeDataset;
    procedure AplicarFechasAlDataset;
    procedure InicializarConsulta;
    procedure ConsultarTransacciones;
    procedure AbrirTransaccionConsulta;
    procedure ActualizarBotones;
    procedure ActualizarInfoProveedor;
    procedure ActualizarInfoTerritorioProveedor;
    function RequiereTerritorioProveedor: Boolean;
    function AsegurarTerritorioProveedor(AMostrarVentana: Boolean): Boolean;
    procedure CargarSeriesEcf;
    procedure LiberarSeriesEcf;
    procedure ActualizarInfoSerie;
    procedure CargarEstadoEnvio;
    procedure GuardarMontoPagado;
    procedure MostrarValidacion(AValido: Boolean; AMensajes: TStrings);
    function TipoActual: string;
    function EstaReservado: Boolean;
    function EstaAceptado: Boolean;
    function SerieSeleccionada: TSerieEcfInfo;
    function ValidarCabecera(AMensajes: TStrings): Boolean;
    function ValidarDetalleActual(AMensajes: TStrings): Boolean;
    function ValidarDocumento(AParaEnvio: Boolean; AMensajes: TStrings): Boolean;
    function ObtenerDatosTasa(AIdTasa: Integer; out AIndicador: Integer;
      out APorciento: Double): Boolean;
    function BuscarTasaExenta: Integer;
    procedure ForzarTratamientoFiscalE43;
    function LeerMontoPagado(out AValor: Currency): Boolean;
    function Redondear2(AValor: Double): Currency;
    function FormatearMonto(AValor: Currency): string;
    function ConstruirENCFVista(const ATipo: string;
      ACorrelativo: Int64): string;
    function EstadoEnvioPermiteCorreccion: Boolean;
    function RechazoActualRequiereNuevaSecuencia: Boolean;
  public
  end;

var
  frmRegTransOpeDiariaECF: TfrmRegTransOpeDiariaECF;

implementation

uses
  UDatModRegOpeDiaria, UDatModConectar, UGlobal, UBuscarProveedores,
  UFormProductosServicios, UEcfReservaGastos, UUtilecfGastos,
  UEcfEnvioGastos, UAsignarTerritorioProveedorECF,
  UEcfGastoImpresion, UGastoTxtEcfFlow,
  UFormProveedores;

{$R *.dfm}

function TfrmRegTransOpeDiariaECF.Redondear2(AValor: Double): Currency;
begin
  if AValor >= 0 then
    Result := Trunc((AValor * 100) + 0.5) / 100
  else
    Result := Trunc((AValor * 100) - 0.5) / 100;
end;

function TfrmRegTransOpeDiariaECF.FormatearMonto(
  AValor: Currency): string;
begin
  Result := FormatFloat('#,##0.00', AValor);
end;

function TfrmRegTransOpeDiariaECF.ConstruirENCFVista(
  const ATipo: string; ACorrelativo: Int64): string;
var
  S: string;
begin
  S := IntToStr(ACorrelativo);
  while Length(S) < 10 do
    S := '0' + S;
  Result := 'E' + Trim(ATipo) + S;
end;

procedure TfrmRegTransOpeDiariaECF.FormCreate(Sender: TObject);
begin
  FVerificandoTerritorio := False;
  FSincronizandoFechas := False;
  FTrackIdEnvio := '';
  FPrevMasterFilter := dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Filter;
  FPrevMasterFiltered := dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Filtered;
  pcPrincipal.ActivePage := tsDatos;
  AbrirCatalogos;
  AbrirOperacionesMesActual;
  InicializarConsulta;
  ActualizarPantalla;
  if GlbUsarFacturaTxtECF = 1 then
  lblGastosTXTActivo.Visible:=True else lblGastosTXTActivo.Visible:=False;
end;

procedure TfrmRegTransOpeDiariaECF.FormDestroy(Sender: TObject);
begin
  LiberarSeriesEcf;
  dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Filtered := False;
  dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Filter := FPrevMasterFilter;
  dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Filtered := FPrevMasterFiltered;
end;

procedure TfrmRegTransOpeDiariaECF.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := True;

  if dtmTransOpeDiaria.tblRegTransOpeDiariaDet.State in [dsEdit, dsInsert] then
  begin
    if MessageDlg(
         'La linea actual tiene cambios sin guardar. Desea salir?',
         mtWarning, [mbYes, mbNo], 0) = mrNo then
    begin
      CanClose := False;
      Exit;
    end;
    dtmTransOpeDiaria.tblRegTransOpeDiariaDet.Cancel;
  end;

  if dtmTransOpeDiaria.tblRegTransOpeDiariaMast.State in [dsEdit, dsInsert] then
  begin
    if MessageDlg(
         'El documento tiene cambios sin guardar. Desea salir?',
         mtWarning, [mbYes, mbNo], 0) = mrNo then
    begin
      CanClose := False;
      Exit;
    end;
    dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Cancel;
  end;
end;

procedure TfrmRegTransOpeDiariaECF.AbrirCatalogos;
begin
  if not qryTasaItbis.Active then
    qryTasaItbis.Open;

  if not tblTipoPagoCxp.Active then
    tblTipoPagoCxp.Open;

  if not dtmTransOpeDiaria.tblCondicion.Active then
    dtmTransOpeDiaria.tblCondicion.Open;

  if not dtmTransOpeDiaria.qryProveedor.Active then
    dtmTransOpeDiaria.qryProveedor.Open;

  if not dtmTransOpeDiaria.tblTipoCompra.Active then
    dtmTransOpeDiaria.tblTipoCompra.Open;

  if not dtmTransOpeDiaria.tblProductosServicios.Active then
    dtmTransOpeDiaria.tblProductosServicios.Open;

  if not dtmTransOpeDiaria.qryDeptos.Active then
    dtmTransOpeDiaria.qryDeptos.Open;

  if not dtmTransOpeDiaria.qryCentroCostos.Active then
    dtmTransOpeDiaria.qryCentroCostos.Open;
end;

procedure TfrmRegTransOpeDiariaECF.AbrirOperacionesRango(
  ADesde, AHasta: TDateTime);
begin
  if Trunc(AHasta) < Trunc(ADesde) then
    Exit;

  dtmTransOpeDiaria.tblRegTransOpeDiariaDet.Close;
  dtmTransOpeDiaria.tblRegTransOpeDiariaDet.Params[0].AsInteger := -1;
  dtmTransOpeDiaria.tblRegTransOpeDiariaDet.Open;

  dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Close;
  dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Params[0].AsDateTime :=
    ExtraerFecha(ADesde);
  dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Params[1].AsDateTime :=
    ExtraerFecha(AHasta) + EncodeTime(23, 59, 59, 999);
  dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Open;
  dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Filter :=
    '(TIPO_CF = ''41'') OR (TIPO_CF = ''43'')';
  dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Filtered := True;
end;

procedure TfrmRegTransOpeDiariaECF.AbrirOperacionesMesActual;
var
  FechaBase: TDateTime;
  FechaIni: TDateTime;
  FechaFin: TDateTime;
begin
  FechaBase := GlbFechaTrnDiaria;
  if FechaBase <= 0 then
    FechaBase := Date;

  FechaIni := EncodeDate(YearOf(FechaBase), MonthOf(FechaBase), 1);
  FechaFin := IncMonth(FechaIni, 1) - 1;

  AbrirOperacionesRango(FechaIni, FechaFin);

  if not dtmTransOpeDiaria.tblRegTransOpeDiariaMast.IsEmpty then
    dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Last;
end;

procedure TfrmRegTransOpeDiariaECF.AbrirDetalleActual;
begin
  dtmTransOpeDiaria.tblRegTransOpeDiariaDet.Close;

  if dtmTransOpeDiaria.tblRegTransOpeDiariaMast.IsEmpty or
     dtmTransOpeDiaria.tblRegTransOpeDiariaMastNUMERO.IsNull then
    dtmTransOpeDiaria.tblRegTransOpeDiariaDet.Params[0].AsInteger := -1
  else
    dtmTransOpeDiaria.tblRegTransOpeDiariaDet.Params[0].AsInteger :=
      dtmTransOpeDiaria.tblRegTransOpeDiariaMastNUMERO.AsInteger;

  dtmTransOpeDiaria.tblRegTransOpeDiariaDet.Open;
end;

procedure TfrmRegTransOpeDiariaECF.SincronizarFechasDesdeDataset;
begin
  FSincronizandoFechas := True;
  try
    if dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Active and
       not dtmTransOpeDiaria.tblRegTransOpeDiariaMast.IsEmpty then
    begin
      if not dtmTransOpeDiaria.tblRegTransOpeDiariaMastFECHA.IsNull then
        deFecha.Date := dtmTransOpeDiaria.tblRegTransOpeDiariaMastFECHA.AsDateTime
      else
        deFecha.Date := Date;

      if not dtmTransOpeDiaria.tblRegTransOpeDiariaMastFECHA_VENCE.IsNull then
      begin
        deFechaVence.Checked := True;
        deFechaVence.Date :=
          dtmTransOpeDiaria.tblRegTransOpeDiariaMastFECHA_VENCE.AsDateTime;
      end
      else
      begin
        deFechaVence.Date := Date;
        deFechaVence.Checked := False;
      end;
    end
    else
    begin
      deFecha.Date := Date;
      deFechaVence.Date := Date;
      deFechaVence.Checked := False;
    end;
  finally
    FSincronizandoFechas := False;
  end;
end;

procedure TfrmRegTransOpeDiariaECF.AplicarFechasAlDataset;
begin
  if FSincronizandoFechas then
    Exit;

  if not (dtmTransOpeDiaria.tblRegTransOpeDiariaMast.State in
          [dsEdit, dsInsert]) then
    Exit;

  dtmTransOpeDiaria.tblRegTransOpeDiariaMastFECHA.AsDateTime :=
    ExtraerFecha(deFecha.Date);

  if deFechaVence.Checked then
    dtmTransOpeDiaria.tblRegTransOpeDiariaMastFECHA_VENCE.AsDateTime :=
      ExtraerFecha(deFechaVence.Date)
  else
    dtmTransOpeDiaria.tblRegTransOpeDiariaMastFECHA_VENCE.Clear;
end;

procedure TfrmRegTransOpeDiariaECF.deFechaChange(Sender: TObject);
begin
  AplicarFechasAlDataset;
end;

procedure TfrmRegTransOpeDiariaECF.deFechaVenceChange(Sender: TObject);
begin
  AplicarFechasAlDataset;
end;

procedure TfrmRegTransOpeDiariaECF.InicializarConsulta;
var
  FechaBase: TDateTime;
begin
  FechaBase := GlbFechaTrnDiaria;
  if FechaBase <= 0 then
    FechaBase := Date;

  dtpConsultaDesde.Date := EncodeDate(YearOf(FechaBase), MonthOf(FechaBase), 1);
  dtpConsultaHasta.Date := Date;
  if dtpConsultaHasta.Date < dtpConsultaDesde.Date then
    dtpConsultaHasta.Date := IncMonth(dtpConsultaDesde.Date, 1) - 1;

  lblConsultaTotal.Caption := 'Seleccione el rango y presione Consultar.';
end;

procedure TfrmRegTransOpeDiariaECF.ConsultarTransacciones;
var
  Cantidad: Integer;
begin
  if Trunc(dtpConsultaHasta.Date) < Trunc(dtpConsultaDesde.Date) then
  begin
    MessageDlg('La fecha hasta no puede ser menor que la fecha desde.',
      mtInformation, [mbOK], 0);
    Exit;
  end;

  qryConsultaTransacciones.Close;
  qryConsultaTransacciones.ParamByName('CIA_KEY').AsInteger := glbCia_Key;
  qryConsultaTransacciones.ParamByName('FECHA_DESDE').AsDateTime :=
    ExtraerFecha(dtpConsultaDesde.Date);
  qryConsultaTransacciones.ParamByName('FECHA_HASTA').AsDateTime :=
    ExtraerFecha(dtpConsultaHasta.Date) + 1;
  qryConsultaTransacciones.Open;

  Cantidad := 0;
  if not qryConsultaTransacciones.IsEmpty then
  begin
    qryConsultaTransacciones.DisableControls;
    try
      qryConsultaTransacciones.Last;
      Cantidad := qryConsultaTransacciones.RecordCount;
      qryConsultaTransacciones.First;
    finally
      qryConsultaTransacciones.EnableControls;
    end;
  end;

  lblConsultaTotal.Caption := IntToStr(Cantidad) +
    ' transaccion(es) E41/E43 encontrada(s).';
end;

procedure TfrmRegTransOpeDiariaECF.AbrirTransaccionConsulta;
var
  Numero: Integer;
begin
  if not qryConsultaTransacciones.Active or qryConsultaTransacciones.IsEmpty then
    Exit;

  if dtmTransOpeDiaria.tblRegTransOpeDiariaDet.State in [dsEdit, dsInsert] then
  begin
    MessageDlg('Guarde o cancele la linea actual antes de abrir otra transaccion.',
      mtInformation, [mbOK], 0);
    Exit;
  end;

  if dtmTransOpeDiaria.tblRegTransOpeDiariaMast.State in [dsEdit, dsInsert] then
  begin
    MessageDlg('Guarde o cancele el documento actual antes de abrir otra transaccion.',
      mtInformation, [mbOK], 0);
    Exit;
  end;

  Numero := qryConsultaTransacciones.FieldByName('NUMERO').AsInteger;

  AbrirOperacionesRango(dtpConsultaDesde.Date, dtpConsultaHasta.Date);

  if not dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Locate(
           'NUMERO', Numero, []) then
  begin
    MessageDlg('No fue posible localizar la transaccion seleccionada.',
      mtInformation, [mbOK], 0);
    Exit;
  end;

  AbrirDetalleActual;
  pcPrincipal.ActivePage := tsDatos;
  ActualizarPantalla;
end;

procedure TfrmRegTransOpeDiariaECF.btnConsultarClick(Sender: TObject);
begin
  pcPrincipal.ActivePage := tsConsulta;
  ConsultarTransacciones;
end;

procedure TfrmRegTransOpeDiariaECF.btnConsultarTransaccionesClick(
  Sender: TObject);
begin
  ConsultarTransacciones;
end;

procedure TfrmRegTransOpeDiariaECF.btnAbrirTransaccionClick(Sender: TObject);
begin
  AbrirTransaccionConsulta;
end;

procedure TfrmRegTransOpeDiariaECF.grdConsultaDblClick(Sender: TObject);
begin
  AbrirTransaccionConsulta;
end;

function TfrmRegTransOpeDiariaECF.TipoActual: string;
begin
  Result := '';
  if dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Active and
     not dtmTransOpeDiaria.tblRegTransOpeDiariaMast.IsEmpty then
    Result := Trim(dtmTransOpeDiaria.tblRegTransOpeDiariaMastTIPO_CF.AsString);
end;

function TfrmRegTransOpeDiariaECF.EstaReservado: Boolean;
begin
  Result := dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Active and
            not dtmTransOpeDiaria.tblRegTransOpeDiariaMast.IsEmpty and
            (Trim(dtmTransOpeDiaria.tblRegTransOpeDiariaMastECF.AsString) <> '');
end;

function TfrmRegTransOpeDiariaECF.EstaAceptado: Boolean;
begin
  Result := Pos('ACEPTADO', UpperCase(Trim(FEstadoEnvio))) > 0;
end;

function TfrmRegTransOpeDiariaECF.EstadoEnvioPermiteCorreccion: Boolean;
var
  Estado: string;
begin
  Estado := UpperCase(Trim(FEstadoEnvio));

  {
    Una reserva normal sigue bloqueando edición.
    Después de RECH_LOCAL o RECHAZADO sí debemos permitir corregir
    el documento antes del próximo intento.
  }
  Result :=
    (Estado = 'RECH_LOCAL') or
    (Estado = 'RECHAZADO');
end;

function TfrmRegTransOpeDiariaECF.RechazoActualRequiereNuevaSecuencia: Boolean;
begin
  {
    Regla operativa:
      RECHAZADO + TrackId -> la solicitud llegó al circuito DGII.
      El próximo envío corregido debe usar otra secuencia.

    El flag SecuenciaUtilizada no se usa aquí.
  }
  Result :=
    (UpperCase(Trim(FEstadoEnvio)) = 'RECHAZADO') and
    (Trim(FTrackIdEnvio) <> '');
end;

procedure TfrmRegTransOpeDiariaECF.IniciarNuevo(const ATipoCF: string);
var
  Tipo: string;
begin
  Tipo := Trim(ATipoCF);
  if (Tipo <> '41') and (Tipo <> '43') then
    Exit;

  if dtmTransOpeDiaria.tblRegTransOpeDiariaMast.State in [dsEdit, dsInsert] then
  begin
    MessageDlg('Guarde o cancele el documento actual antes de crear otro.',
      mtInformation, [mbOK], 0);
    Exit;
  end;

  if dtmTransOpeDiaria.tblRegTransOpeDiariaDet.State in [dsEdit, dsInsert] then
  begin
    MessageDlg('Guarde o cancele la linea actual antes de crear otro documento.',
      mtInformation, [mbOK], 0);
    Exit;
  end;

  FEstadoEnvio := '';
  FTrackIdEnvio := '';
  dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Append;
  dtmTransOpeDiaria.tblRegTransOpeDiariaMastCIA_KEY.AsInteger := glbCia_Key;
  if GlbFechaTrnDiaria > 0 then
    dtmTransOpeDiaria.tblRegTransOpeDiariaMastFECHA.AsDateTime :=
      ExtraerFecha(GlbFechaTrnDiaria)
  else
    dtmTransOpeDiaria.tblRegTransOpeDiariaMastFECHA.AsDateTime := Date;
  dtmTransOpeDiaria.tblRegTransOpeDiariaMastSTATUS.AsString := 'A';
  dtmTransOpeDiaria.tblRegTransOpeDiariaMastCOD_PROVEEDOR.AsInteger := 0;
  dtmTransOpeDiaria.tblRegTransOpeDiariaMastFPAGO.AsInteger := 1;
  dtmTransOpeDiaria.tblRegTransOpeDiariaMastIDCODIGO_TPAGODGII.AsInteger := 1;
  dtmTransOpeDiaria.tblRegTransOpeDiariaMastTIPO_CF.AsString := Tipo;
  dtmTransOpeDiaria.tblRegTransOpeDiariaMastMONTO.AsCurrency := 0;
  dtmTransOpeDiaria.tblRegTransOpeDiariaMastFECHA_IN.AsDateTime := Now;
  dtmTransOpeDiaria.tblRegTransOpeDiariaMastIN_POR.AsString := StrUserName;
  dtmTransOpeDiaria.tblRegTransOpeDiariaMastECF.Clear;
  dtmTransOpeDiaria.tblRegTransOpeDiariaMastSERIE_NCF_ASIGNADO.Clear;

  if Tipo = '41' then
    dtmTransOpeDiaria.tblRegTransOpeDiariaMastIND_MONTO_GRAVADO.AsInteger := 0
  else
    dtmTransOpeDiaria.tblRegTransOpeDiariaMastIND_MONTO_GRAVADO.Clear;

  edtMontoPagado.Text := '0.00';
  pcPrincipal.ActivePage := tsDatos;
  AplicarReglasTipo;
  ActualizarBotones;

  {
    En E43 el proveedor no debe ser el primer paso obligatorio del flujo.
    El tipo de compra si es requerido para el reporte 606.
  }
  if Tipo = '43' then
    cmbTipoCompra.SetFocus
  else
    cmbProveedor.SetFocus;
end;

procedure TfrmRegTransOpeDiariaECF.btnNuevoE41Click(Sender: TObject);
begin
  IniciarNuevo('41');
end;

procedure TfrmRegTransOpeDiariaECF.btnNuevoE43Click(Sender: TObject);
begin
  IniciarNuevo('43');
end;

procedure TfrmRegTransOpeDiariaECF.btnAnteriorClick(Sender: TObject);
begin
  if dtmTransOpeDiaria.tblRegTransOpeDiariaMast.State <> dsBrowse then
  begin
    MessageDlg('Guarde o cancele los cambios antes de navegar.',
      mtInformation, [mbOK], 0);
    Exit;
  end;

  dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Prior;
  AbrirDetalleActual;
  ActualizarPantalla;
end;

procedure TfrmRegTransOpeDiariaECF.btnSiguienteClick(Sender: TObject);
begin
  if dtmTransOpeDiaria.tblRegTransOpeDiariaMast.State <> dsBrowse then
  begin
    MessageDlg('Guarde o cancele los cambios antes de navegar.',
      mtInformation, [mbOK], 0);
    Exit;
  end;

  dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Next;
  AbrirDetalleActual;
  ActualizarPantalla;
end;

procedure TfrmRegTransOpeDiariaECF.btnEditarCabeceraClick(Sender: TObject);
begin
  if dtmTransOpeDiaria.tblRegTransOpeDiariaMast.IsEmpty then
    Exit;

  if EstaReservado then
  begin
    MessageDlg(
      'El documento ya tiene un e-NCF reservado y sus datos fiscales estan bloqueados.',
      mtInformation, [mbOK], 0);
    Exit;
  end;

  if dtmTransOpeDiaria.tblRegTransOpeDiariaMast.State = dsBrowse then
    dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Edit;

  AplicarReglasTipo;
  ActualizarBotones;
end;

procedure TfrmRegTransOpeDiariaECF.GuardarMaestro;
var
  Mensajes: TStringList;
begin
  AplicarFechasAlDataset;
  if not (dtmTransOpeDiaria.tblRegTransOpeDiariaMast.State in
          [dsEdit, dsInsert]) then
    Exit;

  if not AsegurarTerritorioProveedor(True) then
    Exit;

  Mensajes := TStringList.Create;
  try
    if not ValidarCabecera(Mensajes) then
    begin
      MostrarValidacion(False, Mensajes);
      pcPrincipal.ActivePage := tsDatos;
      MessageDlg(Mensajes.Text, mtInformation, [mbOK], 0);
      Exit;
    end;

    GlbSalvarQuery(dtmTransOpeDiaria.tblRegTransOpeDiariaMast);
    AbrirDetalleActual;
    edtMontoPagado.Text := FormatearMonto(
      dtmTransOpeDiaria.tblRegTransOpeDiariaMastMONTO.AsCurrency);
  finally
    Mensajes.Free;
  end;

  ActualizarPantalla;
end;

procedure TfrmRegTransOpeDiariaECF.btnGuardarClick(Sender: TObject);
begin
  if dtmTransOpeDiaria.tblRegTransOpeDiariaDet.State in [dsEdit, dsInsert] then
    GuardarDetalle
  else
    GuardarMaestro;
end;

procedure TfrmRegTransOpeDiariaECF.btnCancelarClick(Sender: TObject);
begin
  if dtmTransOpeDiaria.tblRegTransOpeDiariaDet.State in [dsEdit, dsInsert] then
    dtmTransOpeDiaria.tblRegTransOpeDiariaDet.Cancel
  else if dtmTransOpeDiaria.tblRegTransOpeDiariaMast.State in [dsEdit, dsInsert] then
    dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Cancel;

  ActualizarPantalla;
end;

procedure TfrmRegTransOpeDiariaECF.btnCerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmRegTransOpeDiariaECF.btnBuscarProveedorClick(Sender: TObject);
begin
  if not (dtmTransOpeDiaria.tblRegTransOpeDiariaMast.State in
          [dsEdit, dsInsert]) then
  begin
    MessageDlg('Pulse Modificar datos antes de cambiar el proveedor.',
      mtInformation, [mbOK], 0);
    Exit;
  end;

  frmProcBuscarProv := TfrmProcBuscarProv.Create(nil);
  try
    if frmProcBuscarProv.ShowModal = mrOk then
      dtmTransOpeDiaria.tblRegTransOpeDiariaMastCOD_PROVEEDOR.AsInteger :=
        frmProcBuscarProv.xCodigoCte;
  finally
    frmProcBuscarProv.Free;
    frmProcBuscarProv := nil;
  end;

  ActualizarInfoProveedor;
end;

procedure TfrmRegTransOpeDiariaECF.cmbProveedorChange(Sender: TObject);
begin
  ActualizarInfoProveedor;
  ActualizarInfoTerritorioProveedor;

  if (dtmTransOpeDiaria.tblRegTransOpeDiariaMast.State in [dsEdit, dsInsert]) and
     RequiereTerritorioProveedor then
    AsegurarTerritorioProveedor(True);
end;

procedure TfrmRegTransOpeDiariaECF.btnCompletarTerritorioClick(
  Sender: TObject);
begin
  AsegurarTerritorioProveedor(True);
  ActualizarInfoTerritorioProveedor;
end;

procedure TfrmRegTransOpeDiariaECF.cmbCondicionChange(Sender: TObject);
begin
  AplicarReglasTipo;
end;

procedure TfrmRegTransOpeDiariaECF.rgItbisIncluidoClick(Sender: TObject);
begin
  if TipoActual = '41' then
    CalcularLinea;
end;

procedure TfrmRegTransOpeDiariaECF.btnIrDetalleClick(Sender: TObject);
begin
  if dtmTransOpeDiaria.tblRegTransOpeDiariaMast.State in [dsEdit, dsInsert] then
    GuardarMaestro;

  if dtmTransOpeDiaria.tblRegTransOpeDiariaMast.State <> dsBrowse then
    Exit;

  pcPrincipal.ActivePage := tsDetalle;
  if dtmTransOpeDiaria.tblRegTransOpeDiariaDet.IsEmpty then
    btnAgregarLineaClick(Sender)
  else
    ActualizarPantalla;
end;

procedure TfrmRegTransOpeDiariaECF.btnNuevoProductoClick(Sender: TObject);
begin
  frmProductosServ := TfrmProductosServ.Create(nil);
  try
    frmProductosServ.ShowModal;
  finally
    frmProductosServ.Free;
    frmProductosServ := nil;
  end;

  dtmTransOpeDiaria.tblProductosServicios.Close;
  dtmTransOpeDiaria.tblProductosServicios.Open;
end;

procedure TfrmRegTransOpeDiariaECF.cmbProductoChange(Sender: TObject);
var
  Codigo: Integer;
  Tipo: Integer;
begin
  if not (dtmTransOpeDiaria.tblRegTransOpeDiariaDet.State in
          [dsEdit, dsInsert]) then
    Exit;

  if dtmTransOpeDiaria.tblRegTransOpeDiariaDetCOD_SERV_PROD.IsNull then
    Exit;

  Codigo := dtmTransOpeDiaria.tblRegTransOpeDiariaDetCOD_SERV_PROD.AsInteger;
  if dtmTransOpeDiaria.tblProductosServicios.Locate('CODIGO', Codigo, []) then
  begin
    dtmTransOpeDiaria.tblRegTransOpeDiariaDetOBSERVACION.AsString :=
      dtmTransOpeDiaria.tblProductosServiciosDESCRIPCION.AsString;

    if not dtmTransOpeDiaria.tblProductosServiciosIND_BIEN_SERVICIO.IsNull then
    begin
      Tipo := dtmTransOpeDiaria.tblProductosServiciosIND_BIEN_SERVICIO.AsInteger;
      if Tipo in [1, 2] then
        dtmTransOpeDiaria.tblRegTransOpeDiariaDetIND_BIEN_SERVICIO.AsInteger := Tipo;
    end;
  end;

  AplicarReglasDetalle;
end;

procedure TfrmRegTransOpeDiariaECF.edtCantidadExit(Sender: TObject);
begin
  CalcularLinea;
end;

procedure TfrmRegTransOpeDiariaECF.edtPrecioExit(Sender: TObject);
begin
  CalcularLinea;
end;

procedure TfrmRegTransOpeDiariaECF.cmbTasaItbisChange(Sender: TObject);
begin
  CalcularLinea;
end;

procedure TfrmRegTransOpeDiariaECF.cmbTasaIsrChange(Sender: TObject);
begin
  ActualizarEditorTasaIsrManual;

  if dtmTransOpeDiaria.tblRegTransOpeDiariaDet.State in [dsEdit, dsInsert] then
    CalcularLinea;
end;

procedure TfrmRegTransOpeDiariaECF.edtTasaIsrManualChange(Sender: TObject);
begin
  if (cmbTasaIsr.ItemIndex = 5) and
     (dtmTransOpeDiaria.tblRegTransOpeDiariaDet.State in [dsEdit, dsInsert]) then
    CalcularLinea;
end;

procedure TfrmRegTransOpeDiariaECF.rgBienServicioClick(Sender: TObject);
begin
  if dtmTransOpeDiaria.tblRegTransOpeDiariaDet.State in [dsEdit, dsInsert] then
  begin
    case rgBienServicio.ItemIndex of
      0:
        dtmTransOpeDiaria.tblRegTransOpeDiariaDetIND_BIEN_SERVICIO.AsInteger := 1;
      1:
        dtmTransOpeDiaria.tblRegTransOpeDiariaDetIND_BIEN_SERVICIO.AsInteger := 2;
    end;
  end;

  AplicarReglasDetalle;
end;

function TfrmRegTransOpeDiariaECF.BuscarTasaExenta: Integer;
begin
  Result := 0;
  if qryTasaItbis.Locate('IDITBISECF', 4, []) then
    Result := qryTasaItbis.FieldByName('IDTASAITBIS').AsInteger;
end;

procedure TfrmRegTransOpeDiariaECF.ForzarTratamientoFiscalE43;
var
  IdExento: Integer;
begin
  if TipoActual <> '43' then
    Exit;

  if not (dtmTransOpeDiaria.tblRegTransOpeDiariaDet.State in
          [dsEdit, dsInsert]) then
    Exit;

  {
    DGII e-CF 43:
    IndicadorFacturacion debe ser 4 (Exento).
    En el XML E43 no se informa ITBIS generado ni retenciones.
    El valor de la linea representa el monto completo del gasto.
  }
  IdExento := BuscarTasaExenta;

  if IdExento > 0 then
  begin
    if dtmTransOpeDiaria.tblRegTransOpeDiariaDetIDTASAITBIS.IsNull or
       (dtmTransOpeDiaria.tblRegTransOpeDiariaDetIDTASAITBIS.AsInteger <>
        IdExento) then
      dtmTransOpeDiaria.tblRegTransOpeDiariaDetIDTASAITBIS.AsInteger :=
        IdExento;
  end;

  dtmTransOpeDiaria.tblRegTransOpeDiariaDetMONTO_ITBIS.AsCurrency := 0;
  dtmTransOpeDiaria.tblRegTransOpeDiariaDetMONTO_ITBIS_RETENIDO.AsCurrency := 0;
  dtmTransOpeDiaria.tblRegTransOpeDiariaDetMONTO_ISR_RETENIDO.AsCurrency := 0;
end;

procedure TfrmRegTransOpeDiariaECF.btnAgregarLineaClick(Sender: TObject);
begin
  if dtmTransOpeDiaria.tblRegTransOpeDiariaMast.IsEmpty or
     (dtmTransOpeDiaria.tblRegTransOpeDiariaMast.State <> dsBrowse) then
  begin
    MessageDlg('Primero guarde los datos generales del gasto.',
      mtInformation, [mbOK], 0);
    Exit;
  end;

  if EstaReservado then
  begin
    MessageDlg('No se pueden agregar lineas despues de reservar el e-NCF.',
      mtInformation, [mbOK], 0);
    Exit;
  end;

  if dtmTransOpeDiaria.tblRegTransOpeDiariaDet.State <> dsBrowse then
    Exit;

  dtmTransOpeDiaria.tblRegTransOpeDiariaDet.Insert;
  dtmTransOpeDiaria.tblRegTransOpeDiariaDetNUMERO.AsInteger :=
    dtmTransOpeDiaria.tblRegTransOpeDiariaMastNUMERO.AsInteger;
  dtmTransOpeDiaria.tblRegTransOpeDiariaDetCANTIDAD.AsFloat := 1;
  dtmTransOpeDiaria.tblRegTransOpeDiariaDetPRECIO.AsFloat := 0;
  dtmTransOpeDiaria.tblRegTransOpeDiariaDetVALOR.AsFloat := 0;
  dtmTransOpeDiaria.tblRegTransOpeDiariaDetMONTO_ITBIS.AsCurrency := 0;
  dtmTransOpeDiaria.tblRegTransOpeDiariaDetMONTO_ITBIS_RETENIDO.AsCurrency := 0;
  dtmTransOpeDiaria.tblRegTransOpeDiariaDetMONTO_ISR_RETENIDO.AsCurrency := 0;
  cmbTasaIsr.ItemIndex := 0;
  edtTasaIsrManual.Text := '';
  ActualizarEditorTasaIsrManual;
  dtmTransOpeDiaria.tblRegTransOpeDiariaDetIN_POR.AsString := StrUserName;
  dtmTransOpeDiaria.tblRegTransOpeDiariaDetFECHA_IN.AsDateTime := Now;
  dtmTransOpeDiaria.tblRegTransOpeDiariaDetSTATUS.AsString := 'A';

  if TipoActual = '43' then
    ForzarTratamientoFiscalE43;

  AplicarReglasDetalle;
  ActualizarBotones;
  cmbProducto.SetFocus;
end;

procedure TfrmRegTransOpeDiariaECF.btnEditarLineaClick(Sender: TObject);
begin
  if dtmTransOpeDiaria.tblRegTransOpeDiariaDet.IsEmpty then
    Exit;

  if EstaReservado then
  begin
    MessageDlg('No se pueden modificar lineas despues de reservar el e-NCF.',
      mtInformation, [mbOK], 0);
    Exit;
  end;

  if dtmTransOpeDiaria.tblRegTransOpeDiariaDet.State = dsBrowse then
    dtmTransOpeDiaria.tblRegTransOpeDiariaDet.Edit;
  SincronizarTasaIsrDesdeDetalle;

  AplicarReglasDetalle;
  ActualizarBotones;
end;

function TfrmRegTransOpeDiariaECF.ObtenerDatosTasa(AIdTasa: Integer;
  out AIndicador: Integer; out APorciento: Double): Boolean;
begin
  Result := False;
  AIndicador := -1;
  APorciento := 0;

  if AIdTasa <= 0 then
    Exit;

  if not qryTasaItbis.Locate('IDTASAITBIS', AIdTasa, []) then
    Exit;

  if qryTasaItbis.FieldByName('IDITBISECF').IsNull then
    Exit;

  AIndicador := qryTasaItbis.FieldByName('IDITBISECF').AsInteger;
  APorciento := qryTasaItbis.FieldByName('PORCIENTO').AsFloat;
  Result := True;
end;

function TfrmRegTransOpeDiariaECF.TextoPorcentajeAFloat(
  const ATexto: string): Double;
var
  S: string;
begin
  Result := 0;
  S := Trim(ATexto);

  if S = '' then
    Exit;

  S := StringReplace(S, '%', '', [rfReplaceAll]);

  { Aceptar que el usuario escriba 4.5 o 4,5 independientemente
    del separador decimal configurado en Windows. }
  if DecimalSeparator = ',' then
    S := StringReplace(S, '.', ',', [rfReplaceAll])
  else
    S := StringReplace(S, ',', '.', [rfReplaceAll]);

  Result := StrToFloatDef(S, 0);
end;

procedure TfrmRegTransOpeDiariaECF.ActualizarEditorTasaIsrManual;
var
  EsOtra: Boolean;
begin
  EsOtra := cmbTasaIsr.ItemIndex = 5;

  lblTasaIsrManual.Visible := EsOtra and (TipoActual = '41');
  edtTasaIsrManual.Visible := EsOtra and (TipoActual = '41');

  edtTasaIsrManual.Enabled :=
    EsOtra and
    cmbTasaIsr.Enabled and
    not EstaReservado;

  if not EsOtra then
    edtTasaIsrManual.Text := '';
end;

function TfrmRegTransOpeDiariaECF.PorcientoIsrSeleccionado: Double;
begin
  Result := 0;

  case cmbTasaIsr.ItemIndex of
    1: Result := 2;
    2: Result := 3;
    3: Result := 10;
    4: Result := 15;
    5: Result := TextoPorcentajeAFloat(edtTasaIsrManual.Text);
  end;
end;

procedure TfrmRegTransOpeDiariaECF.SincronizarTasaIsrDesdeDetalle;
var
  BaseLinea: Currency;
  MontoIsr: Currency;
  TasaCalculada: Double;
  IncluyeItbis: Boolean;
begin
  if (TipoActual <> '41') or
     not dtmTransOpeDiaria.tblRegTransOpeDiariaDet.Active or
     dtmTransOpeDiaria.tblRegTransOpeDiariaDet.IsEmpty then
  begin
    cmbTasaIsr.ItemIndex := 0;
    edtTasaIsrManual.Text := '';
    ActualizarEditorTasaIsrManual;
    Exit;
  end;

  if dtmTransOpeDiaria.tblRegTransOpeDiariaDetIND_BIEN_SERVICIO.IsNull or
     (dtmTransOpeDiaria.tblRegTransOpeDiariaDetIND_BIEN_SERVICIO.AsInteger <> 2) then
  begin
    cmbTasaIsr.ItemIndex := 0;
    edtTasaIsrManual.Text := '';
    ActualizarEditorTasaIsrManual;
    Exit;
  end;

  MontoIsr :=
    dtmTransOpeDiaria.tblRegTransOpeDiariaDetMONTO_ISR_RETENIDO.AsCurrency;

  if Abs(MontoIsr) <= 0.005 then
  begin
    cmbTasaIsr.ItemIndex := 0;
    edtTasaIsrManual.Text := '';
    ActualizarEditorTasaIsrManual;
    Exit;
  end;

  BaseLinea :=
    dtmTransOpeDiaria.tblRegTransOpeDiariaDetVALOR.AsCurrency;

  IncluyeItbis :=
    not dtmTransOpeDiaria.tblRegTransOpeDiariaMastIND_MONTO_GRAVADO.IsNull and
    (dtmTransOpeDiaria.tblRegTransOpeDiariaMastIND_MONTO_GRAVADO.AsInteger = 1);

  if IncluyeItbis then
    BaseLinea := Redondear2(
      BaseLinea -
      dtmTransOpeDiaria.tblRegTransOpeDiariaDetMONTO_ITBIS.AsCurrency);

  if Abs(BaseLinea) <= 0.005 then
  begin
    cmbTasaIsr.ItemIndex := 0;
    edtTasaIsrManual.Text := '';
    ActualizarEditorTasaIsrManual;
    Exit;
  end;

  TasaCalculada := (MontoIsr / BaseLinea) * 100;

  if Abs(TasaCalculada - 2) <= 0.05 then
    cmbTasaIsr.ItemIndex := 1
  else if Abs(TasaCalculada - 3) <= 0.05 then
    cmbTasaIsr.ItemIndex := 2
  else if Abs(TasaCalculada - 10) <= 0.05 then
    cmbTasaIsr.ItemIndex := 3
  else if Abs(TasaCalculada - 15) <= 0.05 then
    cmbTasaIsr.ItemIndex := 4
  else
  begin
    cmbTasaIsr.ItemIndex := 5;
    edtTasaIsrManual.Text := FormatFloat('0.####', TasaCalculada);
  end;

  ActualizarEditorTasaIsrManual;
end;

procedure TfrmRegTransOpeDiariaECF.CalcularLinea;
var
  Cantidad: Double;
  Precio: Double;
  ValorLinea: Currency;
  BaseIsr: Currency;
  MontoItbis: Currency;
  MontoIsr: Currency;
  Indicador: Integer;
  Porciento: Double;
  TasaIsr: Double;
  IncluyeItbis: Boolean;
  EsServicio: Boolean;
begin
  if not (dtmTransOpeDiaria.tblRegTransOpeDiariaDet.State in
          [dsEdit, dsInsert]) then
    Exit;

  Cantidad := dtmTransOpeDiaria.tblRegTransOpeDiariaDetCANTIDAD.AsFloat;
  Precio := dtmTransOpeDiaria.tblRegTransOpeDiariaDetPRECIO.AsFloat;
  ValorLinea := Redondear2(Cantidad * Precio);
  MontoItbis := 0;
  MontoIsr := 0;

  dtmTransOpeDiaria.tblRegTransOpeDiariaDetVALOR.AsCurrency := ValorLinea;

  if TipoActual = '43' then
  begin
    ForzarTratamientoFiscalE43;
    Exit;
  end;

  IncluyeItbis :=
    not dtmTransOpeDiaria.tblRegTransOpeDiariaMastIND_MONTO_GRAVADO.IsNull and
    (dtmTransOpeDiaria.tblRegTransOpeDiariaMastIND_MONTO_GRAVADO.AsInteger = 1);

  Indicador := 0;
  Porciento := 0;

  if not dtmTransOpeDiaria.tblRegTransOpeDiariaDetIDTASAITBIS.IsNull then
    ObtenerDatosTasa(
      dtmTransOpeDiaria.tblRegTransOpeDiariaDetIDTASAITBIS.AsInteger,
      Indicador,
      Porciento);

  if (Indicador in [1, 2]) and (Porciento > 0) then
  begin
    if IncluyeItbis then
      MontoItbis := Redondear2(
        ValorLinea - (ValorLinea / (1 + (Porciento / 100))))
    else
      MontoItbis := Redondear2(ValorLinea * (Porciento / 100));
  end;

  dtmTransOpeDiaria.tblRegTransOpeDiariaDetMONTO_ITBIS.AsCurrency :=
    MontoItbis;

  { E41: retener automaticamente el 100% del ITBIS generado. }
  if (TipoActual = '41') and (Indicador in [1, 2]) then
    dtmTransOpeDiaria.tblRegTransOpeDiariaDetMONTO_ITBIS_RETENIDO.AsCurrency :=
      MontoItbis
  else
    dtmTransOpeDiaria.tblRegTransOpeDiariaDetMONTO_ITBIS_RETENIDO.AsCurrency := 0;

  { ISR E41:
    - Bien: no aplica, se mantiene en cero.
    - Servicio: el usuario selecciona la tasa aplicable (2% o 10%) y
      PointSaleSoft calcula el monto sobre la base del servicio sin ITBIS.
    No se deja al usuario adivinar o digitar el monto retenido. }
  EsServicio :=
    not dtmTransOpeDiaria.tblRegTransOpeDiariaDetIND_BIEN_SERVICIO.IsNull and
    (dtmTransOpeDiaria.tblRegTransOpeDiariaDetIND_BIEN_SERVICIO.AsInteger = 2);

  if (TipoActual = '41') and EsServicio then
  begin
    BaseIsr := ValorLinea;
    if IncluyeItbis then
      BaseIsr := Redondear2(ValorLinea - MontoItbis);

    TasaIsr := PorcientoIsrSeleccionado;
    if TasaIsr > 0 then
      MontoIsr := Redondear2(BaseIsr * (TasaIsr / 100))
    else
      MontoIsr := 0;
  end;

  dtmTransOpeDiaria.tblRegTransOpeDiariaDetMONTO_ISR_RETENIDO.AsCurrency :=
    MontoIsr;
end;

procedure TfrmRegTransOpeDiariaECF.SincronizarMontoPagadoE41;
begin
  if TipoActual <> '41' then
    Exit;

  if EstaReservado then
    Exit;

  if not dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Active or
     dtmTransOpeDiaria.tblRegTransOpeDiariaMast.IsEmpty then
    Exit;

  if dtmTransOpeDiaria.tblRegTransOpeDiariaMast.State <> dsBrowse then
    Exit;

  CalcularResumen;

  dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Edit;
  try
    dtmTransOpeDiaria.tblRegTransOpeDiariaMastMONTO.AsCurrency := FResumenNeto;
    GlbSalvarQuery(dtmTransOpeDiaria.tblRegTransOpeDiariaMast);
  except
    if dtmTransOpeDiaria.tblRegTransOpeDiariaMast.State in [dsEdit, dsInsert] then
      dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Cancel;
    raise;
  end;

  edtMontoPagado.Text := FormatearMonto(FResumenNeto);
  lblDiferencia.Caption := 'Diferencia: RD$ 0.00';
end;

procedure TfrmRegTransOpeDiariaECF.AplicarReglasDetalle;
var
  EsEdicion: Boolean;
  EsServicio: Boolean;
begin
  EsEdicion := dtmTransOpeDiaria.tblRegTransOpeDiariaDet.State in
    [dsEdit, dsInsert];

  lblItbisRetenido.Visible := TipoActual = '41';
  lblTasaIsr.Visible := TipoActual = '41';
  lblIsrRetenido.Visible := TipoActual = '41';
  edtItbisRetenido.Visible := TipoActual = '41';
  cmbTasaIsr.Visible := TipoActual = '41';
  lblTasaIsrManual.Visible := False;
  edtTasaIsrManual.Visible := False;
  edtIsrRetenido.Visible := TipoActual = '41';

  if TipoActual = '41' then
  begin
    lblTasaItbis.Caption := 'Tratamiento ITBIS *';
    lblMontoItbis.Caption := 'ITBIS calculado';
    lblItbisRetenido.Caption := 'ITBIS ret. 100%';
    lblAyudaRetenciones.Caption :=
      'E41: ITBIS retenido 100% automatico. Para servicios seleccione 2%, 3%, ' +
      '10%, 15% u Otro porcentaje; PointSaleSoft calcula el ISR retenido.';
  end;

  if TipoActual = '43' then
  begin
    lblTasaItbis.Caption := 'Tratamiento fiscal E43 *';
    lblMontoItbis.Caption := 'ITBIS e-CF';
    cmbTasaItbis.Enabled := False;
    edtMontoItbis.ReadOnly := True;
    edtItbisRetenido.Enabled := False;
    cmbTasaIsr.Enabled := False;
    edtIsrRetenido.Enabled := False;
    cmbTasaIsr.ItemIndex := 0;

    lblAyudaRetenciones.Caption :=
      'E43: DGII exige IndicadorFacturacion=4 (Exento). El ITBIS del gasto ' +
      'no se usa como adelanto y no se informa como ITBIS en el e-CF. ' +
      'Registre en Precio el monto completo del gasto.';

    if EsEdicion then
      ForzarTratamientoFiscalE43;
  end
  else
  begin
    cmbTasaItbis.Enabled := EsEdicion and not EstaReservado;
    edtItbisRetenido.Enabled := EsEdicion and not EstaReservado;
    edtItbisRetenido.ReadOnly := True;
    edtIsrRetenido.ReadOnly := True;

    if EsEdicion and (rgBienServicio.ItemIndex in [0, 1]) then
      EsServicio := rgBienServicio.ItemIndex = 1
    else
      EsServicio :=
        not dtmTransOpeDiaria.tblRegTransOpeDiariaDetIND_BIEN_SERVICIO.IsNull and
        (dtmTransOpeDiaria.tblRegTransOpeDiariaDetIND_BIEN_SERVICIO.AsInteger = 2);

    if not EsEdicion then
      SincronizarTasaIsrDesdeDetalle;

    cmbTasaIsr.Enabled :=
      (TipoActual = '41') and
      EsEdicion and
      EsServicio and
      not EstaReservado;
    ActualizarEditorTasaIsrManual;
    edtIsrRetenido.Enabled := False;

    if TipoActual = '41' then
    begin
      if EsServicio then
        lblAyudaRetenciones.Caption :=
          'Servicio E41: seleccione la tasa ISR aplicable (2%, 3%, 10%, 15% ' +
          'u Otro porcentaje). PointSaleSoft calcula el monto retenido.'
      else
        lblAyudaRetenciones.Caption :=
          'Bien E41: el ISR no aplica. Cambie la Clasificacion a Servicio ' +
          'si esta linea corresponde realmente a un servicio.';
    end;

    if EsEdicion and not EsServicio then
    begin
      cmbTasaIsr.ItemIndex := 0;
      edtTasaIsrManual.Text := '';
      ActualizarEditorTasaIsrManual;
      dtmTransOpeDiaria.tblRegTransOpeDiariaDetMONTO_ISR_RETENIDO.AsCurrency := 0;
    end;
  end;

  lblAyudaRetenciones.Visible :=
    (TipoActual = '41') or (TipoActual = '43');
  CalcularLinea;
end;

function TfrmRegTransOpeDiariaECF.ValidarDetalleActual(
  AMensajes: TStrings): Boolean;
var
  Indicador: Integer;
  Porciento: Double;
  EsServicio: Boolean;
begin
  Result := False;
  Indicador := 0;
  Porciento := 0;

  if dtmTransOpeDiaria.tblRegTransOpeDiariaDetCOD_SERV_PROD.IsNull or
     (dtmTransOpeDiaria.tblRegTransOpeDiariaDetCOD_SERV_PROD.AsInteger <= 0) then
    AMensajes.Add('Seleccione el producto o servicio de la linea.');

  if Trim(dtmTransOpeDiaria.tblRegTransOpeDiariaDetOBSERVACION.AsString) = '' then
    AMensajes.Add('Escriba una descripcion clara para la linea.');

  if dtmTransOpeDiaria.tblRegTransOpeDiariaDetCANTIDAD.AsFloat <= 0 then
    AMensajes.Add('La cantidad debe ser mayor que cero.');

  if dtmTransOpeDiaria.tblRegTransOpeDiariaDetPRECIO.AsFloat < 0 then
    AMensajes.Add('El precio no puede ser negativo.');

  if dtmTransOpeDiaria.tblRegTransOpeDiariaDetIND_BIEN_SERVICIO.IsNull or
     not (dtmTransOpeDiaria.tblRegTransOpeDiariaDetIND_BIEN_SERVICIO.AsInteger
          in [1, 2]) then
    AMensajes.Add('Indique si la linea es un bien o un servicio.');

  if (TipoActual = '43') and (BuscarTasaExenta <= 0) then
    AMensajes.Add(
      'No existe en TASA_ITBIS una tasa con IDITBISECF=4 (Exento). ' +
      'E43 no puede guardarse hasta configurar ese mapeo.')
  else if dtmTransOpeDiaria.tblRegTransOpeDiariaDetIDTASAITBIS.IsNull or
     not ObtenerDatosTasa(
       dtmTransOpeDiaria.tblRegTransOpeDiariaDetIDTASAITBIS.AsInteger,
       Indicador, Porciento) then
    AMensajes.Add('Seleccione una tasa ITBIS configurada para e-CF.')
  else if TipoActual = '43' then
  begin
    if Indicador <> 4 then
      AMensajes.Add('E43 requiere que todas las lineas sean exentas.');
  end
  else if not (Indicador in [1, 2, 3, 4]) then
    AMensajes.Add('La tasa seleccionada no es valida para E41.');

  if TipoActual = '41' then
  begin
    if Indicador in [1, 2] then
    begin
      if Abs(
           dtmTransOpeDiaria.tblRegTransOpeDiariaDetMONTO_ITBIS_RETENIDO.AsCurrency -
           dtmTransOpeDiaria.tblRegTransOpeDiariaDetMONTO_ITBIS.AsCurrency) > 0.02 then
        AMensajes.Add(
          'En E41 el ITBIS retenido debe ser igual al 100% del ITBIS generado. ' +
          'PointSaleSoft lo calcula automaticamente.');
    end
    else if (Indicador in [3, 4]) and
            (Abs(
               dtmTransOpeDiaria.tblRegTransOpeDiariaDetMONTO_ITBIS_RETENIDO.AsCurrency) >
             0.005) then
      AMensajes.Add(
        'Una linea E41 sin ITBIS generado no debe tener ITBIS retenido.');
  end;

  if dtmTransOpeDiaria.tblRegTransOpeDiariaDetMONTO_ITBIS_RETENIDO.AsCurrency < 0 then
    AMensajes.Add('El ITBIS retenido no puede ser negativo.');

  if dtmTransOpeDiaria.tblRegTransOpeDiariaDetMONTO_ISR_RETENIDO.AsCurrency < 0 then
    AMensajes.Add('El ISR retenido no puede ser negativo.');

  EsServicio :=
    not dtmTransOpeDiaria.tblRegTransOpeDiariaDetIND_BIEN_SERVICIO.IsNull and
    (dtmTransOpeDiaria.tblRegTransOpeDiariaDetIND_BIEN_SERVICIO.AsInteger = 2);

  if (TipoActual = '41') and EsServicio then
  begin
    if PorcientoIsrSeleccionado <= 0 then
      AMensajes.Add(
        'Seleccione la tasa de ISR aplicable al servicio. Puede usar 2%, 3%, ' +
        '10%, 15% u Otro porcentaje.');

    if PorcientoIsrSeleccionado > 100 then
      AMensajes.Add('El porcentaje de ISR no puede ser mayor que 100%.');

    if (cmbTasaIsr.ItemIndex = 5) and
       (TextoPorcentajeAFloat(edtTasaIsrManual.Text) <= 0) then
      AMensajes.Add(
        'Indique un porcentaje ISR valido mayor que cero en Otro porcentaje.');

    if dtmTransOpeDiaria.tblRegTransOpeDiariaDetMONTO_ISR_RETENIDO.AsCurrency <= 0 then
      AMensajes.Add(
        'La linea E41 de servicio requiere un monto de ISR retenido calculado.');
  end;

  if (dtmTransOpeDiaria.tblRegTransOpeDiariaDetMONTO_ISR_RETENIDO.AsCurrency > 0) and
     not EsServicio then
    AMensajes.Add('El ISR retenido solo corresponde a lineas de servicio.');

  if TipoActual = '43' then
  begin
    if Abs(dtmTransOpeDiaria.tblRegTransOpeDiariaDetMONTO_ITBIS.AsCurrency) > 0.005 then
      AMensajes.Add('E43 no permite ITBIS.');
    if Abs(dtmTransOpeDiaria.tblRegTransOpeDiariaDetMONTO_ITBIS_RETENIDO.AsCurrency) > 0.005 then
      AMensajes.Add('E43 no permite ITBIS retenido.');
    if Abs(dtmTransOpeDiaria.tblRegTransOpeDiariaDetMONTO_ISR_RETENIDO.AsCurrency) > 0.005 then
      AMensajes.Add('E43 no permite ISR retenido.');
  end;

  Result := AMensajes.Count = 0;
end;

procedure TfrmRegTransOpeDiariaECF.GuardarDetalle;
var
  Mensajes: TStringList;
begin
  if not (dtmTransOpeDiaria.tblRegTransOpeDiariaDet.State in
          [dsEdit, dsInsert]) then
    Exit;

  CalcularLinea;
  Mensajes := TStringList.Create;
  try
    if not ValidarDetalleActual(Mensajes) then
    begin
      MostrarValidacion(False, Mensajes);
      MessageDlg(Mensajes.Text, mtInformation, [mbOK], 0);
      Exit;
    end;

    dtmTransOpeDiaria.tblRegTransOpeDiariaDetCODIGO_USUARIO.AsInteger :=
      VarUsuarioGlb;
    GlbSalvarQuery(dtmTransOpeDiaria.tblRegTransOpeDiariaDet);
  finally
    Mensajes.Free;
  end;

  CalcularResumen;
  SincronizarMontoPagadoE41;
  ActualizarPantalla;
end;

procedure TfrmRegTransOpeDiariaECF.btnGuardarLineaClick(Sender: TObject);
begin
  GuardarDetalle;
end;

procedure TfrmRegTransOpeDiariaECF.btnCancelarLineaClick(Sender: TObject);
begin
  if dtmTransOpeDiaria.tblRegTransOpeDiariaDet.State in [dsEdit, dsInsert] then
    dtmTransOpeDiaria.tblRegTransOpeDiariaDet.Cancel;
  ActualizarPantalla;
end;

procedure TfrmRegTransOpeDiariaECF.btnEliminarLineaClick(Sender: TObject);
begin
  if dtmTransOpeDiaria.tblRegTransOpeDiariaDet.IsEmpty then
    Exit;

  if EstaReservado then
  begin
    MessageDlg('No se pueden eliminar lineas despues de reservar el e-NCF.',
      mtInformation, [mbOK], 0);
    Exit;
  end;

  if MessageDlg('Desea eliminar la linea seleccionada?', mtConfirmation,
       [mbYes, mbNo], 0) <> mrYes then
    Exit;

  if not dtmTransOpeDiaria.tblRegTransOpeDiariaDet.Transaction.InTransaction then
    dtmTransOpeDiaria.tblRegTransOpeDiariaDet.Transaction.StartTransaction;

  try
    dtmTransOpeDiaria.tblRegTransOpeDiariaDet.Delete;
    dtmTransOpeDiaria.tblRegTransOpeDiariaDet.ApplyUpdates;
    dtmTransOpeDiaria.tblRegTransOpeDiariaDet.Transaction.CommitRetaining;
  except
    if dtmTransOpeDiaria.tblRegTransOpeDiariaDet.Transaction.InTransaction then
      dtmTransOpeDiaria.tblRegTransOpeDiariaDet.Transaction.RollbackRetaining;
    raise;
  end;

  CalcularResumen;
  SincronizarMontoPagadoE41;
  ActualizarPantalla;
end;

procedure TfrmRegTransOpeDiariaECF.CalcularResumen;
var
  Marca: TBookmark;
  ValorLineas: Currency;
  Itbis: Currency;
  ItbisRet: Currency;
  IsrRet: Currency;
  IncluyeItbis: Boolean;
begin
  FResumenBase := 0;
  FResumenItbis := 0;
  FResumenItbisRetenido := 0;
  FResumenIsrRetenido := 0;
  FResumenTotalFiscal := 0;
  FResumenNeto := 0;

  if not dtmTransOpeDiaria.tblRegTransOpeDiariaDet.Active or
     dtmTransOpeDiaria.tblRegTransOpeDiariaDet.IsEmpty then
  begin
    lblResumenLineas.Caption := 'Valor lineas: RD$0.00';
    lblResumenItbis.Caption := 'ITBIS: RD$0.00';
    lblResumenRetenciones.Caption := 'Retenciones: RD$0.00';
    lblResumenNeto.Caption := 'Neto esperado: RD$0.00';
    Exit;
  end;

  ValorLineas := 0;
  Itbis := 0;
  ItbisRet := 0;
  IsrRet := 0;

  Marca := dtmTransOpeDiaria.tblRegTransOpeDiariaDet.GetBookmark;
  dtmTransOpeDiaria.tblRegTransOpeDiariaDet.DisableControls;
  try
    dtmTransOpeDiaria.tblRegTransOpeDiariaDet.First;
    while not dtmTransOpeDiaria.tblRegTransOpeDiariaDet.Eof do
    begin
      if Trim(dtmTransOpeDiaria.tblRegTransOpeDiariaDetSTATUS.AsString) <> 'C' then
      begin
        ValorLineas := ValorLineas +
          dtmTransOpeDiaria.tblRegTransOpeDiariaDetVALOR.AsCurrency;
        Itbis := Itbis +
          dtmTransOpeDiaria.tblRegTransOpeDiariaDetMONTO_ITBIS.AsCurrency;
        ItbisRet := ItbisRet +
          dtmTransOpeDiaria.tblRegTransOpeDiariaDetMONTO_ITBIS_RETENIDO.AsCurrency;
        IsrRet := IsrRet +
          dtmTransOpeDiaria.tblRegTransOpeDiariaDetMONTO_ISR_RETENIDO.AsCurrency;
      end;
      dtmTransOpeDiaria.tblRegTransOpeDiariaDet.Next;
    end;
  finally
    if dtmTransOpeDiaria.tblRegTransOpeDiariaDet.BookmarkValid(Marca) then
      dtmTransOpeDiaria.tblRegTransOpeDiariaDet.GotoBookmark(Marca);
    dtmTransOpeDiaria.tblRegTransOpeDiariaDet.FreeBookmark(Marca);
    dtmTransOpeDiaria.tblRegTransOpeDiariaDet.EnableControls;
  end;

  IncluyeItbis :=
    (TipoActual = '41') and
    not dtmTransOpeDiaria.tblRegTransOpeDiariaMastIND_MONTO_GRAVADO.IsNull and
    (dtmTransOpeDiaria.tblRegTransOpeDiariaMastIND_MONTO_GRAVADO.AsInteger = 1);

  if IncluyeItbis then
    FResumenBase := Redondear2(ValorLineas - Itbis)
  else
    FResumenBase := Redondear2(ValorLineas);

  FResumenItbis := Redondear2(Itbis);
  FResumenItbisRetenido := Redondear2(ItbisRet);
  FResumenIsrRetenido := Redondear2(IsrRet);

  if IncluyeItbis or (TipoActual = '43') then
    FResumenTotalFiscal := Redondear2(ValorLineas)
  else
    FResumenTotalFiscal := Redondear2(ValorLineas + Itbis);

  FResumenNeto := Redondear2(
    FResumenTotalFiscal - FResumenItbisRetenido - FResumenIsrRetenido);

  lblResumenLineas.Caption := 'Valor lineas: RD$' + FormatearMonto(ValorLineas);

  if TipoActual = '43' then
  begin
    lblResumenItbis.Caption := 'ITBIS e-CF: RD$0.00';
    lblItbisTitulo.Caption := 'ITBIS e-CF';
  end
  else
  begin
    lblResumenItbis.Caption := 'ITBIS: RD$' + FormatearMonto(FResumenItbis);
    lblItbisTitulo.Caption := 'Total ITBIS';
  end;

  lblResumenRetenciones.Caption := 'Retenciones: RD$' +
    FormatearMonto(FResumenItbisRetenido + FResumenIsrRetenido);
  lblResumenNeto.Caption := 'Neto esperado: RD$' + FormatearMonto(FResumenNeto);

  lblBaseFiscal.Caption := 'RD$ ' + FormatearMonto(FResumenBase);
  lblTotalItbis.Caption := 'RD$ ' + FormatearMonto(FResumenItbis);
  lblTotalFiscal.Caption := 'RD$ ' + FormatearMonto(FResumenTotalFiscal);
  lblTotalRetItbis.Caption := 'RD$ ' + FormatearMonto(FResumenItbisRetenido);
  lblTotalRetIsr.Caption := 'RD$ ' + FormatearMonto(FResumenIsrRetenido);
  lblNetoCalculado.Caption := 'RD$ ' + FormatearMonto(FResumenNeto);
end;

procedure TfrmRegTransOpeDiariaECF.btnIrRevisionClick(Sender: TObject);
begin
  if dtmTransOpeDiaria.tblRegTransOpeDiariaDet.State in [dsEdit, dsInsert] then
    GuardarDetalle;

  if dtmTransOpeDiaria.tblRegTransOpeDiariaDet.State <> dsBrowse then
    Exit;

  CalcularResumen;
  edtMontoPagado.Text := FormatearMonto(
    dtmTransOpeDiaria.tblRegTransOpeDiariaMastMONTO.AsCurrency);
  pcPrincipal.ActivePage := tsRevision;
  CargarSeriesEcf;
  CargarEstadoEnvio;
  ActualizarBotones;
end;

procedure TfrmRegTransOpeDiariaECF.btnVolverDetalleClick(Sender: TObject);
begin
  pcPrincipal.ActivePage := tsDetalle;
end;

procedure TfrmRegTransOpeDiariaECF.btnUsarNetoClick(Sender: TObject);
begin
  if EstaReservado then
  begin
    MessageDlg('El monto esta bloqueado porque el e-NCF ya fue reservado.',
      mtInformation, [mbOK], 0);
    Exit;
  end;
  edtMontoPagado.Text := FormatearMonto(FResumenNeto);
  lblDiferencia.Caption := 'Diferencia: RD$ 0.00';
end;

function TfrmRegTransOpeDiariaECF.LeerMontoPagado(
  out AValor: Currency): Boolean;
var
  S: string;
  PComa: Integer;
  PPunto: Integer;
  PDecimal: Integer;
  SepDecimalOrigen: Char;
begin
  Result := False;
  AValor := 0;
  S := Trim(edtMontoPagado.Text);
  S := StringReplace(S, 'RD$', '', [rfReplaceAll, rfIgnoreCase]);
  S := StringReplace(S, ' ', '', [rfReplaceAll]);

  PComa := LastDelimiter(',', S);
  PPunto := LastDelimiter('.', S);
  PDecimal := 0;
  SepDecimalOrigen := #0;

  if (PComa > 0) and (PPunto > 0) then
  begin
    if PComa > PPunto then
    begin
      PDecimal := PComa;
      SepDecimalOrigen := ',';
      S := StringReplace(S, '.', '', [rfReplaceAll]);
    end
    else
    begin
      PDecimal := PPunto;
      SepDecimalOrigen := '.';
      S := StringReplace(S, ',', '', [rfReplaceAll]);
    end;
  end
  else if PComa > 0 then
  begin
    PDecimal := PComa;
    SepDecimalOrigen := ',';
  end
  else if PPunto > 0 then
  begin
    PDecimal := PPunto;
    SepDecimalOrigen := '.';
  end;

  if (PDecimal > 0) and (SepDecimalOrigen <> DecimalSeparator) then
    S := StringReplace(S, String(SepDecimalOrigen),
      String(DecimalSeparator), [rfReplaceAll]);

  Result := TryStrToCurr(S, AValor);
end;

procedure TfrmRegTransOpeDiariaECF.GuardarMontoPagado;
var
  Monto: Currency;
begin
  if EstaReservado then
  begin
    edtMontoPagado.Text := FormatearMonto(
      dtmTransOpeDiaria.tblRegTransOpeDiariaMastMONTO.AsCurrency);
    Exit;
  end;

  if not LeerMontoPagado(Monto) then
    raise Exception.Create('El monto pagado al proveedor no tiene un formato valido.');

  if Monto < 0 then
    raise Exception.Create('El monto pagado al proveedor no puede ser negativo.');

  if dtmTransOpeDiaria.tblRegTransOpeDiariaMast.State = dsBrowse then
    dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Edit;

  dtmTransOpeDiaria.tblRegTransOpeDiariaMastMONTO.AsCurrency := Monto;
  GlbSalvarQuery(dtmTransOpeDiaria.tblRegTransOpeDiariaMast);
  edtMontoPagado.Text := FormatearMonto(Monto);
end;

function TfrmRegTransOpeDiariaECF.ValidarCabecera(
  AMensajes: TStrings): Boolean;
var
  CodigoProveedor: Integer;
  TipoDoc: Integer;
  Documento: string;
begin
  if dtmTransOpeDiaria.tblRegTransOpeDiariaMastFECHA.IsNull then
    AMensajes.Add('Seleccione la fecha del gasto.');

  if (TipoActual <> '41') and (TipoActual <> '43') then
    AMensajes.Add('Seleccione E41 o E43 como tipo de documento.');

  {
    E41:
      La identidad real del proveedor es parte del comprobante y sigue
      siendo obligatoria.

    E43:
      COD_PROVEEDOR=0 es un valor tecnico valido para indicar que no se
      selecciono un proveedor interno. El comprador no forma parte del XML E43.
  }
  if TipoActual = '41' then
  begin
    if dtmTransOpeDiaria.tblRegTransOpeDiariaMastCOD_PROVEEDOR.IsNull or
       (dtmTransOpeDiaria.tblRegTransOpeDiariaMastCOD_PROVEEDOR.AsInteger <= 0) then
      AMensajes.Add('Seleccione el proveedor para el E41.')
    else
    begin
      CodigoProveedor :=
        dtmTransOpeDiaria.tblRegTransOpeDiariaMastCOD_PROVEEDOR.AsInteger;
    if dtmTransOpeDiaria.qryProveedor.Locate('CODIGO_CTE', CodigoProveedor, []) then
    begin
      TipoDoc := dtmTransOpeDiaria.qryProveedorTIPODOC.AsInteger;
      Documento := Trim(dtmTransOpeDiaria.qryProveedorRNC_PROVEEDOR.AsString);
      if not (TipoDoc in [1, 2, 3]) then
        AMensajes.Add('El proveedor E41 debe usar RNC, cedula u otro documento valido.');
      if Documento = '' then
        AMensajes.Add('El proveedor E41 no tiene numero de identificacion.');
      if (Trim(dtmTransOpeDiaria.qryProveedorDESCRIPCION.AsString) = '') and
         (Trim(dtmTransOpeDiaria.qryProveedorNOMBRE_ABR.AsString) = '') then
        AMensajes.Add('El proveedor E41 no tiene nombre o razon social.');

      if (TipoDoc in [1, 2]) and
         not AsegurarTerritorioProveedor(False) then
        AMensajes.Add(
          'El proveedor E41 con RNC/Cedula requiere provincia y municipio e-CF.');
    end
      else
        AMensajes.Add('No fue posible localizar los datos del proveedor E41.');
    end;
  end;

  if dtmTransOpeDiaria.tblRegTransOpeDiariaMastFPAGO.IsNull or
     not (dtmTransOpeDiaria.tblRegTransOpeDiariaMastFPAGO.AsInteger in [1, 2]) then
    AMensajes.Add('La condicion debe ser Contado o Credito.');

  if (TipoActual = '41') and
     (dtmTransOpeDiaria.tblRegTransOpeDiariaMastIDCODIGO_TPAGODGII.IsNull or
      (dtmTransOpeDiaria.tblRegTransOpeDiariaMastIDCODIGO_TPAGODGII.AsInteger <= 0)) then
    AMensajes.Add('Seleccione la forma de pago para el E41.');

  if not dtmTransOpeDiaria.tblRegTransOpeDiariaMastFPAGO.IsNull and
     (dtmTransOpeDiaria.tblRegTransOpeDiariaMastFPAGO.AsInteger = 2) and
     dtmTransOpeDiaria.tblRegTransOpeDiariaMastFECHA_VENCE.IsNull then
    AMensajes.Add('Una operacion a credito requiere fecha limite de pago.');

  if dtmTransOpeDiaria.tblRegTransOpeDiariaMastIDTIPO_COMPRA.IsNull or
     (dtmTransOpeDiaria.tblRegTransOpeDiariaMastIDTIPO_COMPRA.AsInteger <= 0) then
    AMensajes.Add('Seleccione el tipo de compra para el reporte 606.');

  if Trim(dtmTransOpeDiaria.tblRegTransOpeDiariaMastOBSERVACION.AsString) = '' then
    AMensajes.Add('Escriba una descripcion general del gasto.');

  if TipoActual = '41' then
  begin
    if dtmTransOpeDiaria.tblRegTransOpeDiariaMastIND_MONTO_GRAVADO.IsNull or
       not (dtmTransOpeDiaria.tblRegTransOpeDiariaMastIND_MONTO_GRAVADO.AsInteger
            in [0, 1]) then
      AMensajes.Add('Indique si los precios del E41 incluyen ITBIS.');
  end
  else if not dtmTransOpeDiaria.tblRegTransOpeDiariaMastIND_MONTO_GRAVADO.IsNull then
    AMensajes.Add('En E43 no corresponde indicar ITBIS incluido.');

  Result := AMensajes.Count = 0;
end;

function TfrmRegTransOpeDiariaECF.ValidarDocumento(AParaEnvio: Boolean;
  AMensajes: TStrings): Boolean;
var
  Marca: TBookmark;
  Indicador: Integer;
  Porciento: Double;
  NumeroLinea: string;
  TieneDetalle: Boolean;
  TieneGravadas: Boolean;
  MontoPagado: Currency;
begin
  ValidarCabecera(AMensajes);
  TieneDetalle := False;
  TieneGravadas := False;

  if not dtmTransOpeDiaria.tblRegTransOpeDiariaDet.Active or
     dtmTransOpeDiaria.tblRegTransOpeDiariaDet.IsEmpty then
    AMensajes.Add('Agregue al menos una linea de detalle.')
  else
  begin
    Marca := dtmTransOpeDiaria.tblRegTransOpeDiariaDet.GetBookmark;
    dtmTransOpeDiaria.tblRegTransOpeDiariaDet.DisableControls;
    try
      dtmTransOpeDiaria.tblRegTransOpeDiariaDet.First;
      while not dtmTransOpeDiaria.tblRegTransOpeDiariaDet.Eof do
      begin
        if Trim(dtmTransOpeDiaria.tblRegTransOpeDiariaDetSTATUS.AsString) <> 'C' then
        begin
          TieneDetalle := True;
          Indicador := 0;
          Porciento := 0;
          NumeroLinea := dtmTransOpeDiaria.tblRegTransOpeDiariaDetSERIE.AsString;

          if dtmTransOpeDiaria.tblRegTransOpeDiariaDetCANTIDAD.AsFloat <= 0 then
            AMensajes.Add('Linea ' + NumeroLinea + ': cantidad invalida.');
          if dtmTransOpeDiaria.tblRegTransOpeDiariaDetPRECIO.AsFloat < 0 then
            AMensajes.Add('Linea ' + NumeroLinea + ': precio invalido.');
          if Trim(dtmTransOpeDiaria.tblRegTransOpeDiariaDetOBSERVACION.AsString) = '' then
            AMensajes.Add('Linea ' + NumeroLinea + ': falta descripcion.');
          if dtmTransOpeDiaria.tblRegTransOpeDiariaDetIND_BIEN_SERVICIO.IsNull or
             not (dtmTransOpeDiaria.tblRegTransOpeDiariaDetIND_BIEN_SERVICIO.AsInteger
                  in [1, 2]) then
            AMensajes.Add('Linea ' + NumeroLinea + ': indique Bien o Servicio.');

          if (TipoActual = '43') and (BuscarTasaExenta <= 0) then
            AMensajes.Add(
              'Linea ' + NumeroLinea +
              ': no existe TASA_ITBIS con IDITBISECF=4 (Exento).')
          else if dtmTransOpeDiaria.tblRegTransOpeDiariaDetIDTASAITBIS.IsNull or
             not ObtenerDatosTasa(
               dtmTransOpeDiaria.tblRegTransOpeDiariaDetIDTASAITBIS.AsInteger,
               Indicador, Porciento) then
            AMensajes.Add('Linea ' + NumeroLinea + ': tasa ITBIS sin mapeo e-CF.')
          else if TipoActual = '43' then
          begin
            if Indicador <> 4 then
              AMensajes.Add('Linea ' + NumeroLinea + ': E43 exige Exento.');
          end
          else
          begin
            if not (Indicador in [1, 2, 3, 4]) then
              AMensajes.Add('Linea ' + NumeroLinea + ': indicador fiscal no valido para E41.');
            if Indicador in [1, 2] then
              TieneGravadas := True;
          end;

          if TipoActual = '41' then
          begin
            if Indicador in [1, 2] then
            begin
              if Abs(
                   dtmTransOpeDiaria.tblRegTransOpeDiariaDetMONTO_ITBIS_RETENIDO.AsCurrency -
                   dtmTransOpeDiaria.tblRegTransOpeDiariaDetMONTO_ITBIS.AsCurrency) > 0.02 then
                AMensajes.Add(
                  'Linea ' + NumeroLinea +
                  ': E41 requiere ITBIS retenido igual al 100% del ITBIS generado.');
            end
            else if (Indicador in [3, 4]) and
                    (Abs(
                       dtmTransOpeDiaria.tblRegTransOpeDiariaDetMONTO_ITBIS_RETENIDO.AsCurrency) >
                     0.005) then
              AMensajes.Add(
                'Linea ' + NumeroLinea +
                ': una linea sin ITBIS generado no debe tener ITBIS retenido.');
          end;

          if dtmTransOpeDiaria.tblRegTransOpeDiariaDetMONTO_ITBIS_RETENIDO.AsCurrency < 0 then
            AMensajes.Add('Linea ' + NumeroLinea + ': ITBIS retenido negativo.');
          if dtmTransOpeDiaria.tblRegTransOpeDiariaDetMONTO_ISR_RETENIDO.AsCurrency < 0 then
            AMensajes.Add('Linea ' + NumeroLinea + ': ISR retenido negativo.');

          if (TipoActual = '41') and
             (dtmTransOpeDiaria.tblRegTransOpeDiariaDetIND_BIEN_SERVICIO.AsInteger = 2) and
             (dtmTransOpeDiaria.tblRegTransOpeDiariaDetMONTO_ISR_RETENIDO.AsCurrency <= 0) then
            AMensajes.Add(
              'Linea ' + NumeroLinea +
              ': la linea E41 de servicio requiere ISR retenido.');

          if (dtmTransOpeDiaria.tblRegTransOpeDiariaDetMONTO_ISR_RETENIDO.AsCurrency > 0) and
             (dtmTransOpeDiaria.tblRegTransOpeDiariaDetIND_BIEN_SERVICIO.AsInteger <> 2) then
            AMensajes.Add('Linea ' + NumeroLinea + ': el ISR retenido solo aplica a servicios.');

          if TipoActual = '43' then
          begin
            if Abs(dtmTransOpeDiaria.tblRegTransOpeDiariaDetMONTO_ITBIS.AsCurrency) > 0.005 then
              AMensajes.Add('Linea ' + NumeroLinea + ': E43 no permite ITBIS.');
            if Abs(dtmTransOpeDiaria.tblRegTransOpeDiariaDetMONTO_ITBIS_RETENIDO.AsCurrency) > 0.005 then
              AMensajes.Add('Linea ' + NumeroLinea + ': E43 no permite ITBIS retenido.');
            if Abs(dtmTransOpeDiaria.tblRegTransOpeDiariaDetMONTO_ISR_RETENIDO.AsCurrency) > 0.005 then
              AMensajes.Add('Linea ' + NumeroLinea + ': E43 no permite ISR retenido.');
          end;
        end;

        dtmTransOpeDiaria.tblRegTransOpeDiariaDet.Next;
      end;
    finally
      if dtmTransOpeDiaria.tblRegTransOpeDiariaDet.BookmarkValid(Marca) then
        dtmTransOpeDiaria.tblRegTransOpeDiariaDet.GotoBookmark(Marca);
      dtmTransOpeDiaria.tblRegTransOpeDiariaDet.FreeBookmark(Marca);
      dtmTransOpeDiaria.tblRegTransOpeDiariaDet.EnableControls;
    end;
  end;

  if not TieneDetalle then
    AMensajes.Add('El documento no tiene lineas activas.');

  if (TipoActual = '41') and TieneGravadas and
     dtmTransOpeDiaria.tblRegTransOpeDiariaMastIND_MONTO_GRAVADO.IsNull then
    AMensajes.Add('E41 con lineas gravadas requiere indicar si el ITBIS esta incluido.');

  CalcularResumen;
  MontoPagado := dtmTransOpeDiaria.tblRegTransOpeDiariaMastMONTO.AsCurrency;
  if Abs(MontoPagado - FResumenNeto) > 0.02 then
    AMensajes.Add(
      'El monto pagado al proveedor (' + FormatearMonto(MontoPagado) +
      ') no coincide con el neto calculado (' + FormatearMonto(FResumenNeto) + ').');

  if AParaEnvio then
  begin
    if not EstaReservado then
      AMensajes.Add('Reserve el e-NCF antes de enviar.');
    if EstaReservado and
       (Copy(UpperCase(Trim(
          dtmTransOpeDiaria.tblRegTransOpeDiariaMastECF.AsString)), 1, 3) <>
        'E' + TipoActual) then
      AMensajes.Add('El e-NCF reservado no coincide con el tipo del documento.');
  end;

  Result := AMensajes.Count = 0;
end;

procedure TfrmRegTransOpeDiariaECF.MostrarValidacion(AValido: Boolean;
  AMensajes: TStrings);
var
  I: Integer;
begin
  lstValidacion.Items.Clear;
  if AValido then
  begin
    lstValidacion.Items.Add('OK - Los datos estan listos para continuar.');
    Exit;
  end;

  for I := 0 to AMensajes.Count - 1 do
    lstValidacion.Items.Add('- ' + AMensajes[I]);
end;

//procedure TfrmRegTransOpeDiariaECF.btnValidarClick(Sender: TObject);
//begin
//end;

procedure TfrmRegTransOpeDiariaECF.LiberarSeriesEcf;
var
  I: Integer;
begin
  for I := 0 to cmbSerieEcf.Items.Count - 1 do
    cmbSerieEcf.Items.Objects[I].Free;
  cmbSerieEcf.Items.Clear;
end;

procedure TfrmRegTransOpeDiariaECF.CargarSeriesEcf;
var
  Info: TSerieEcfInfo;
  Texto: string;
  Tipo: string;
begin
  LiberarSeriesEcf;
  Tipo := TipoActual;
  if (Tipo <> '41') and (Tipo <> '43') then
  begin
    ActualizarInfoSerie;
    Exit;
  end;

  qrySerieEcf.Close;
  qrySerieEcf.ParamByName('TIPO_CF').AsString := Tipo;
  qrySerieEcf.Open;

  while not qrySerieEcf.Eof do
  begin
    Info := TSerieEcfInfo.Create;
    Info.Serie := Trim(qrySerieEcf.FieldByName('SERIE').AsString);
    Info.DivNegocio := Trim(qrySerieEcf.FieldByName('DIV_NEGOCIO').AsString);
    Info.PECF := Trim(qrySerieEcf.FieldByName('PECF').AsString);
    Info.AICF := Trim(qrySerieEcf.FieldByName('AICF').AsString);
    Info.TipoCF := Trim(qrySerieEcf.FieldByName('TIPO_CF').AsString);
    Info.UltimoCorrelativo := Trunc(qrySerieEcf.FieldByName('NCF').AsFloat);
    Info.FechaVence := qrySerieEcf.FieldByName('FECHA_VENCE').AsDateTime;

    Texto := ConstruirENCFVista(Info.TipoCF, Info.UltimoCorrelativo + 1) +
      '  |  vence ' + DateToStr(Info.FechaVence);
    cmbSerieEcf.Items.AddObject(Texto, Info);
    qrySerieEcf.Next;
  end;

  if cmbSerieEcf.Items.Count > 0 then
    cmbSerieEcf.ItemIndex := 0;

  ActualizarInfoSerie;
end;

function TfrmRegTransOpeDiariaECF.SerieSeleccionada: TSerieEcfInfo;
begin
  Result := nil;
  if (cmbSerieEcf.ItemIndex >= 0) and
     (cmbSerieEcf.ItemIndex < cmbSerieEcf.Items.Count) then
    Result := TSerieEcfInfo(cmbSerieEcf.Items.Objects[cmbSerieEcf.ItemIndex]);
end;

procedure TfrmRegTransOpeDiariaECF.ActualizarInfoSerie;
var
  Info: TSerieEcfInfo;
begin
  Info := SerieSeleccionada;
  if Info = nil then
  begin
    lblProximaSecuencia.Caption := 'Proxima secuencia: no disponible';
    lblVencimientoSecuencia.Caption := 'Vencimiento: no disponible';
  end
  else
  begin
    lblProximaSecuencia.Caption := 'Proxima secuencia: ' +
      ConstruirENCFVista(Info.TipoCF, Info.UltimoCorrelativo + 1);
    lblVencimientoSecuencia.Caption := 'Vencimiento: ' +
      DateToStr(Info.FechaVence);
  end;
end;


procedure TfrmRegTransOpeDiariaECF.cmbSerieEcfChange(Sender: TObject);
begin
  ActualizarInfoSerie;
end;

procedure TfrmRegTransOpeDiariaECF.btnReservarEcfClick(Sender: TObject);
var
  Mensajes: TStringList;
  Info: TSerieEcfInfo;
  Reserva: TReservaEcfGastoResult;
  MensajeReserva: string;
begin
  if EstaReservado then
  begin
    MessageDlg('El documento ya tiene reservado el e-NCF ' +
      dtmTransOpeDiaria.tblRegTransOpeDiariaMastECF.AsString + '.',
      mtInformation, [mbOK], 0);
    Exit;
  end;

  if not AsegurarTerritorioProveedor(True) then
  begin
    MessageDlg(
      'Complete la Provincia y el Municipio e-CF del proveedor antes de reservar.',
      mtInformation, [mbOK], 0);
    Exit;
  end;

  try
    GuardarMontoPagado;
  except
    on E: Exception do
    begin
      MessageDlg(E.Message, mtInformation, [mbOK], 0);
      Exit;
    end;
  end;

  Mensajes := TStringList.Create;
  try
    if not ValidarDocumento(False, Mensajes) then
    begin
      MostrarValidacion(False, Mensajes);
      MessageDlg('Corrija los datos indicados antes de reservar el e-NCF.',
        mtInformation, [mbOK], 0);
      Exit;
    end;
  finally
    Mensajes.Free;
  end;

  Info := SerieSeleccionada;
  if Info = nil then
  begin
    MessageDlg('No existe una secuencia activa para el tipo ' + TipoActual + '.',
      mtError, [mbOK], 0);
    Exit;
  end;

  if not ReservarOReutilizarEcfGasto(
           dmConectar.IBDatabase1,
           dtmTransOpeDiaria.tblRegTransOpeDiariaMastNUMERO.AsInteger,
           VarUsuarioGlb,
           Info.Serie,
           Info.DivNegocio,
           Info.PECF,
           Info.AICF,
           TipoActual,
           Reserva,
           MensajeReserva) then
  begin
    MessageDlg(MensajeReserva, mtError, [mbOK], 0);
    Exit;
  end;

  dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Refresh;
  CargarEstadoEnvio;
  ActualizarPantalla;
  MessageDlg(MensajeReserva + #13#10 +
    'e-NCF: ' + Reserva.ENCF + #13#10 +
    'Vence: ' + DateToStr(Reserva.FechaVencimientoSecuencia),
    mtInformation, [mbOK], 0);
end;

procedure TfrmRegTransOpeDiariaECF.CargarEstadoEnvio;
begin
  FEstadoEnvio := '';
  FTrackIdEnvio := '';
  lblEstadoDgii.Caption := 'Sin enviar';
  lblTrackId.Caption := '-';
  memoMensajeDgii.Clear;

  if dtmTransOpeDiaria.tblRegTransOpeDiariaMast.IsEmpty or
     dtmTransOpeDiaria.tblRegTransOpeDiariaMastNUMERO.IsNull then
    Exit;

  try
    qryEstadoEnvio.Close;
    qryEstadoEnvio.ParamByName('CIA_KEY').AsInteger :=
      dtmTransOpeDiaria.tblRegTransOpeDiariaMastCIA_KEY.AsInteger;
    qryEstadoEnvio.ParamByName('TRN').AsInteger :=
      dtmTransOpeDiaria.tblRegTransOpeDiariaMastNUMERO.AsInteger;
    qryEstadoEnvio.Open;

    if not qryEstadoEnvio.IsEmpty then
    begin
      FEstadoEnvio := qryEstadoEnvio.FieldByName('ESTADO').AsString;
      FTrackIdEnvio := qryEstadoEnvio.FieldByName('TRACK_ID').AsString;
      lblEstadoDgii.Caption := FEstadoEnvio;
      lblTrackId.Caption := FTrackIdEnvio;
      memoMensajeDgii.Text := qryEstadoEnvio.FieldByName('MENSAJE').AsString;
    end
    else if EstaReservado then
      lblEstadoDgii.Caption := 'RESERVADO';
  except
    on E: Exception do
    begin
      FEstadoEnvio := '';
      FTrackIdEnvio := '';
      RegistrarLogEcfGasto(
        'FORM_ESTADO_ERROR',
        'TRN=' +
        IntToStr(dtmTransOpeDiaria.tblRegTransOpeDiariaMastNUMERO.AsInteger) +
        ' Error=' + E.Message
      );
      if EstaReservado then
        lblEstadoDgii.Caption := 'RESERVADO'
      else
        lblEstadoDgii.Caption := 'Sin enviar';
      memoMensajeDgii.Text := 'No fue posible consultar el historial de envio: ' +
        E.Message;
    end;
  end;
end;

procedure TfrmRegTransOpeDiariaECF.AplicarReglasTipo;
var
  Tipo: string;
  EditandoMaster: Boolean;
begin
  Tipo := TipoActual;
  EditandoMaster := dtmTransOpeDiaria.tblRegTransOpeDiariaMast.State in
    [dsEdit, dsInsert];

  if Tipo = '41' then
  begin
    lblTipoSeleccionado.Caption := 'E41 - Compras a proveedor no registrado';
    lblAyudaTipo.Caption :=
      'Use E41 para compras de bienes o servicios a personas no registradas. ' +
      'Debe identificar al proveedor y puede registrar ITBIS y retenciones.';
    rgItbisIncluido.Visible := True;
    rgItbisIncluido.Enabled := EditandoMaster and not EstaReservado;
    lblProveedor.Caption := 'Proveedor no registrado *';
    lblFormaPago.Caption := 'Forma de pago *';
  end
  else if Tipo = '43' then
  begin
    lblTipoSeleccionado.Caption := 'E43 - Gastos menores';
    lblAyudaTipo.Caption :=
      'Use E43 para peajes, parqueos, transporte y otros gastos menores. ' +
      'El proveedor es opcional y, si se selecciona, se conserva solo para control interno; ' +
      'no se envia como comprador en el XML E43.';
    rgItbisIncluido.Enabled := False;
    rgItbisIncluido.Visible := False;
    lblProveedor.Caption := 'Beneficiario / proveedor interno (opcional)';
    lblFormaPago.Caption := 'Forma de pago (uso interno)';
    if EditandoMaster then
      dtmTransOpeDiaria.tblRegTransOpeDiariaMastIND_MONTO_GRAVADO.Clear;
  end
  else
  begin
    lblTipoSeleccionado.Caption := 'Seleccione Nuevo E41 o Nuevo E43';
    lblAyudaTipo.Caption :=
      'El formulario mostrara solamente los campos aplicables al tipo seleccionado.';
    rgItbisIncluido.Enabled := False;
    rgItbisIncluido.Visible := True;
    lblProveedor.Caption := 'Proveedor / beneficiario *';
    lblFormaPago.Caption := 'Forma de pago';
  end;

  deFechaVence.Enabled := EditandoMaster and
    not dtmTransOpeDiaria.tblRegTransOpeDiariaMastFPAGO.IsNull and
    (dtmTransOpeDiaria.tblRegTransOpeDiariaMastFPAGO.AsInteger = 2) and
    not EstaReservado;

  cmbFormaPago.Enabled := EditandoMaster and not EstaReservado;
  AplicarReglasDetalle;
end;

function TfrmRegTransOpeDiariaECF.RequiereTerritorioProveedor: Boolean;
var
  Codigo: Integer;
  TipoDoc: Integer;
begin
  Result := False;

  if TipoActual <> '41' then
    Exit;

  if dtmTransOpeDiaria.tblRegTransOpeDiariaMast.IsEmpty or
     dtmTransOpeDiaria.tblRegTransOpeDiariaMastCOD_PROVEEDOR.IsNull then
    Exit;

  Codigo :=
    dtmTransOpeDiaria.tblRegTransOpeDiariaMastCOD_PROVEEDOR.AsInteger;
  if Codigo <= 0 then
    Exit;

  if not dtmTransOpeDiaria.qryProveedor.Locate(
           'CODIGO_CTE',
           Codigo,
           []
         ) then
    Exit;

  TipoDoc := dtmTransOpeDiaria.qryProveedorTIPODOC.AsInteger;
  Result := TipoDoc in [1, 2];
end;

procedure TfrmRegTransOpeDiariaECF.ActualizarInfoTerritorioProveedor;
var
  Codigo: Integer;
  Provincia: string;
  Municipio: string;
begin
  lblTerritorioProveedor.Caption := 'Ubicacion e-CF: no requerida';
  btnCompletarTerritorio.Visible := False;

  if not RequiereTerritorioProveedor then
    Exit;

  if dtmTransOpeDiaria.tblRegTransOpeDiariaMastCOD_PROVEEDOR.IsNull then
    Exit;

  Codigo :=
    dtmTransOpeDiaria.tblRegTransOpeDiariaMastCOD_PROVEEDOR.AsInteger;

  if ObtenerTerritorioProveedorECF(
       dmConectar.IBDatabase1,
       Codigo,
       Provincia,
       Municipio
     ) then
  begin
    lblTerritorioProveedor.Caption :=
      'Ubicacion e-CF: Provincia ' + Provincia +
      ' / Municipio ' + Municipio + '  [Completa]';
    btnCompletarTerritorio.Caption := 'Modificar ubicacion';
  end
  else
  begin
    lblTerritorioProveedor.Caption :=
      'Ubicacion e-CF: falta Provincia y/o Municipio';
    btnCompletarTerritorio.Caption := 'Completar ubicacion';
  end;

  btnCompletarTerritorio.Visible := True;
end;

function TfrmRegTransOpeDiariaECF.AsegurarTerritorioProveedor(
  AMostrarVentana: Boolean): Boolean;
var
  Codigo: Integer;
  Provincia: string;
  Municipio: string;
begin
  Result := True;

  if not RequiereTerritorioProveedor then
    Exit;

  Codigo :=
    dtmTransOpeDiaria.tblRegTransOpeDiariaMastCOD_PROVEEDOR.AsInteger;

  if ObtenerTerritorioProveedorECF(
       dmConectar.IBDatabase1,
       Codigo,
       Provincia,
       Municipio
     ) then
  begin
    ActualizarInfoTerritorioProveedor;
    Exit;
  end;

  Result := False;
  ActualizarInfoTerritorioProveedor;

  if not AMostrarVentana or FVerificandoTerritorio then
    Exit;

  if MessageDlg(
       'El proveedor seleccionado no tiene Provincia y Municipio e-CF ' +
       'completos.' + #13#10 + #13#10 +
       'Estos datos son obligatorios para emitir un E41 con RNC o Cedula.' +
       #13#10 + #13#10 +
       'Desea asignarlos ahora?',
       mtInformation,
       [mbYes, mbNo],
       0
     ) <> mrYes then
    Exit;

  FVerificandoTerritorio := True;
  try
    if not EditarTerritorioProveedorECF(
             dmConectar.IBDatabase1,
             Codigo
           ) then
      Exit;

    Result := ObtenerTerritorioProveedorECF(
                dmConectar.IBDatabase1,
                Codigo,
                Provincia,
                Municipio
              );

    ActualizarInfoTerritorioProveedor;

    if not Result then
      MessageDlg(
        'La Provincia y el Municipio e-CF siguen incompletos. ' +
        'No se puede continuar con el E41.',
        mtInformation,
        [mbOK],
        0
      );
  finally
    FVerificandoTerritorio := False;
  end;
end;

procedure TfrmRegTransOpeDiariaECF.ActualizarInfoProveedor;
var
  Codigo: Integer;
  TipoDoc: Integer;
  NombreTipo: string;
  Documento: string;
begin
  if TipoActual = '43' then
    lblDocumentoProveedor.Caption :=
      'Proveedor interno: no seleccionado (opcional)'
  else
    lblDocumentoProveedor.Caption := 'Documento: no seleccionado';

  if dtmTransOpeDiaria.tblRegTransOpeDiariaMast.IsEmpty or
     dtmTransOpeDiaria.tblRegTransOpeDiariaMastCOD_PROVEEDOR.IsNull then
    Exit;

  Codigo := dtmTransOpeDiaria.tblRegTransOpeDiariaMastCOD_PROVEEDOR.AsInteger;
  if Codigo <= 0 then
    Exit;

  if not dtmTransOpeDiaria.qryProveedor.Locate('CODIGO_CTE', Codigo, []) then
    Exit;

  TipoDoc := dtmTransOpeDiaria.qryProveedorTIPODOC.AsInteger;
  case TipoDoc of
    1: NombreTipo := 'RNC';
    2: NombreTipo := 'Cedula';
    3: NombreTipo := 'Otro / Pasaporte';
  else
    NombreTipo := 'Sin tipo';
  end;

  Documento := Trim(dtmTransOpeDiaria.qryProveedorRNC_PROVEEDOR.AsString);
  if Documento = '' then
    Documento := '(sin numero)';

  lblDocumentoProveedor.Caption := 'Documento: ' + NombreTipo + ' - ' + Documento;
  if TipoActual = '43' then
    lblDocumentoProveedor.Caption := lblDocumentoProveedor.Caption +
      '  |  Uso interno; no se envia en el XML E43';

  ActualizarInfoTerritorioProveedor;
end;

procedure TfrmRegTransOpeDiariaECF.ActualizarBotones;
var
  MasterEditando: Boolean;
  DetalleEditando: Boolean;
  TieneMaster: Boolean;
  TieneDetalle: Boolean;
  Bloqueado: Boolean;
begin
  MasterEditando := dtmTransOpeDiaria.tblRegTransOpeDiariaMast.State in
    [dsEdit, dsInsert];
  DetalleEditando := dtmTransOpeDiaria.tblRegTransOpeDiariaDet.State in
    [dsEdit, dsInsert];
  TieneMaster := dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Active and
    not dtmTransOpeDiaria.tblRegTransOpeDiariaMast.IsEmpty;
  TieneDetalle := dtmTransOpeDiaria.tblRegTransOpeDiariaDet.Active and
    not dtmTransOpeDiaria.tblRegTransOpeDiariaDet.IsEmpty;
  Bloqueado :=
    EstaAceptado or
    (EstaReservado and not EstadoEnvioPermiteCorreccion);

  btnEditarCabecera.Enabled := TieneMaster and not MasterEditando and
    not DetalleEditando and not Bloqueado;
  btnGuardar.Enabled := MasterEditando or DetalleEditando;
  btnCancelar.Enabled := MasterEditando or DetalleEditando;
  btnAnterior.Enabled := TieneMaster and not MasterEditando and not DetalleEditando;
  btnSiguiente.Enabled := btnAnterior.Enabled;

  btnAgregarLinea.Enabled := TieneMaster and not MasterEditando and
    not DetalleEditando and not Bloqueado;
  btnEditarLinea.Enabled := TieneDetalle and not MasterEditando and
    not DetalleEditando and not Bloqueado;
  btnGuardarLinea.Enabled := DetalleEditando;
  btnCancelarLinea.Enabled := DetalleEditando;
  btnEliminarLinea.Enabled := TieneDetalle and not DetalleEditando and not Bloqueado;

  btnIrDetalle.Enabled := TieneMaster;
  btnIrRevision.Enabled := TieneMaster and not DetalleEditando;
  edtMontoPagado.ReadOnly := Bloqueado;
  btnUsarNeto.Enabled := TieneMaster and not Bloqueado;
  {
    Si ya existe e-NCF, la serie no se cambia manualmente.
    Tras un rechazo, la corrección del documento sí queda habilitada,
    pero la secuencia se decide automáticamente al volver a enviar.
  }
  cmbSerieEcf.Enabled := (not EstaReservado) and (not EstaAceptado);
  btnRecargarSeries.Enabled := cmbSerieEcf.Enabled;
  btnReservarEcf.Enabled :=
    TieneMaster and TieneDetalle and
    (not EstaReservado) and (not EstaAceptado);
  btnEnviarEcf.Enabled :=
    TieneMaster and EstaReservado and
    (not EstaAceptado) and
    (not MasterEditando) and
    (not DetalleEditando);
  btnImprimirEcf.Enabled := TieneMaster and EstaAceptado;

  cmbProveedor.Enabled := MasterEditando and not Bloqueado;
  btnBuscarProveedor.Enabled := cmbProveedor.Enabled;
  deFecha.Enabled := MasterEditando and not Bloqueado;
  cmbCondicion.Enabled := MasterEditando and not Bloqueado;
  cmbTipoCompra.Enabled := MasterEditando and not Bloqueado;
  edtObservacion.Enabled := MasterEditando and not Bloqueado;

  cmbProducto.Enabled := DetalleEditando and not Bloqueado;
  btnNuevoProducto.Enabled := DetalleEditando and not Bloqueado;
  edtDescripcion.Enabled := DetalleEditando and not Bloqueado;
  rgBienServicio.Enabled := DetalleEditando and not Bloqueado;
  edtCantidad.Enabled := DetalleEditando and not Bloqueado;
  edtPrecio.Enabled := DetalleEditando and not Bloqueado;
  cmbDepartamento.Enabled := DetalleEditando and not Bloqueado;
  cmbCentroCosto.Enabled := DetalleEditando and not Bloqueado;
end;

procedure TfrmRegTransOpeDiariaECF.ActualizarPantalla;
var
  Diferencia: Currency;
begin
  SincronizarFechasDesdeDataset;
  AplicarReglasTipo;
  ActualizarInfoProveedor;
  CalcularResumen;
  CargarEstadoEnvio;

  if dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Active and
     not dtmTransOpeDiaria.tblRegTransOpeDiariaMast.IsEmpty then
  begin
    edtMontoPagado.Text := FormatearMonto(
      dtmTransOpeDiaria.tblRegTransOpeDiariaMastMONTO.AsCurrency);
    Diferencia := Redondear2(
      dtmTransOpeDiaria.tblRegTransOpeDiariaMastMONTO.AsCurrency - FResumenNeto);
    lblDiferencia.Caption := 'Diferencia: RD$ ' + FormatearMonto(Diferencia);
  end
  else
  begin
    edtMontoPagado.Text := '0.00';
    lblDiferencia.Caption := 'Diferencia: RD$ 0.00';
  end;

  if EstaAceptado then
  begin
    lblEstadoDocumento.Caption := 'ACEPTADO';
    lblEstadoDocumento.Color := clGreen;
    lblEstadoDocumento.Font.Color := clWhite;
  end
  else if EstaReservado then
  begin
    lblEstadoDocumento.Caption := 'RESERVADO';
    lblEstadoDocumento.Color := clOlive;
    lblEstadoDocumento.Font.Color := clWhite;
  end
  else if dtmTransOpeDiaria.tblRegTransOpeDiariaMast.State in [dsEdit, dsInsert] then
  begin
    lblEstadoDocumento.Caption := 'EDITANDO';
    lblEstadoDocumento.Color := clNavy;
    lblEstadoDocumento.Font.Color := clWhite;
  end
  else
  begin
    lblEstadoDocumento.Caption := 'BORRADOR';
    lblEstadoDocumento.Color := clBtnFace;
    lblEstadoDocumento.Font.Color := clWindowText;
  end;

  CargarSeriesEcf;
  ActualizarBotones;
end;

procedure TfrmRegTransOpeDiariaECF.btnImprimirEcfClick(
  Sender: TObject);
var
  Trn: Integer;
  Mensaje: string;
begin
  if not dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Active or
     dtmTransOpeDiaria.tblRegTransOpeDiariaMast.IsEmpty then
    Exit;

  if not EstaAceptado then
  begin
    MessageDlg(
      'El comprobante debe estar ACEPTADO antes de imprimirlo.',
      mtInformation,
      [mbOK],
      0);
    Exit;
  end;

  Trn :=
    dtmTransOpeDiaria.tblRegTransOpeDiariaMastNUMERO.AsInteger;

  Mensaje := '';

  if not EjecutarImpresionEcfGasto(
           Self,
           Trn,
           Mensaje) then
  begin
    if Trim(Mensaje) <> 'Operacion cancelada.' then
      MessageDlg(
        'No fue posible procesar la impresion del e-CF.' +
        #13#10 +
        Mensaje,
        mtError,
        [mbOK],
        0);
    Exit;
  end;

  if Trim(Mensaje) <> '' then
    MessageDlg(
      Mensaje,
      mtInformation,
      [mbOK],
      0);
end;

procedure TfrmRegTransOpeDiariaECF.pcPrincipalChange(Sender: TObject);
begin
  if (pcPrincipal.ActivePage = tsConsulta) and
     not qryConsultaTransacciones.Active then
    ConsultarTransacciones;

  if pcPrincipal.ActivePage = tsRevision then
  begin
    CalcularResumen;
    CargarSeriesEcf;
    CargarEstadoEnvio;
  end;
  ActualizarBotones;
end;

procedure TfrmRegTransOpeDiariaECF.BitBtn1Click(Sender: TObject);
begin
  frmProveedores:=TfrmProveedores.Create(Nil);
  try
    frmProveedores.Showmodal;
  finally
  frmProveedores.Free;
  frmProveedores:=Nil;
  end;
  dtmTransOpeDiaria.qryProveedor.Close;
  dtmTransOpeDiaria.qryProveedor.Open;
end;

procedure TfrmRegTransOpeDiariaECF.btnEnviarEcfClick(Sender: TObject);
const
  MAX_REASIGNACIONES_SECUENCIA = 5;
var
  Mensajes: TStringList;
  ExePath: string;
  ErrorPath: string;
  Mensaje: string;
  Resultado: TGastoEcfCliResult;
  Estado: string;
  Trn: Integer;
  Info: TSerieEcfInfo;
  ReservaNueva: TReservaEcfGastoResult;
  MensajeReasignacion: string;
  ENCFRechazado: string;
  Reasignaciones: Integer;
  EnvioProcesado: Boolean;
  GastoTxtOutputDir: string;
begin
  RegistrarLogEcfGasto(
    'FORM_ENVIAR_CLICK',
    'Inicio btnEnviarEcfClick'
  );

  if not AsegurarTerritorioProveedor(True) then
  begin
    RegistrarLogEcfGasto(
      'FORM_VALIDACION_TERRITORIO',
      'No se pudo completar territorio del proveedor.'
    );
    MessageDlg(
      'Complete la Provincia y el Municipio e-CF del proveedor antes de enviar.',
      mtInformation, [mbOK], 0);
    Exit;
  end;

  Mensajes := TStringList.Create;
  try
    if not ValidarDocumento(True, Mensajes) then
    begin
      RegistrarLogEcfGasto(
        'FORM_VALIDACION_DOCUMENTO',
        Mensajes.Text
      );
      MostrarValidacion(False, Mensajes);
      MessageDlg('Corrija los datos indicados antes de enviar.',
        mtInformation, [mbOK], 0);
      Exit;
    end;
  finally
    Mensajes.Free;
  end;

  if not ResolverEjecutableEcfGastos(ExePath, ErrorPath) then
  begin
    RegistrarLogEcfGasto(
      'FORM_EXE_ERROR',
      ErrorPath
    );
    MessageDlg(ErrorPath, mtError, [mbOK], 0);
    Exit;
  end;

  Trn := dtmTransOpeDiaria.tblRegTransOpeDiariaMastNUMERO.AsInteger;
  Reasignaciones := 0;

  RegistrarLogEcfGasto(
    'FORM_ENVIO_PREPARAR',
    'TRN=' + IntToStr(Trn) +
    ' ECF=' +
    Trim(dtmTransOpeDiaria.tblRegTransOpeDiariaMastECF.AsString) +
    ' GlbUsarFacturaTxtECF=' + IntToStr(GlbUsarFacturaTxtECF)
  );

  {
    Antes de un NUEVO intento volvemos a consultar el último estado.

    Si el intento anterior quedó:
      RECHAZADO + TrackId
    consideramos operacionalmente que esa secuencia ya llegó a DGII y
    no debe reutilizarse.

    Importante:
    NO reasignamos inmediatamente cuando llega el rechazo. Primero el usuario
    corrige el documento. Solo al volver a pulsar Enviar, después de validar
    nuevamente, se genera la nueva secuencia.
  }
  CargarEstadoEnvio;

  if RechazoActualRequiereNuevaSecuencia then
  begin
    Info := SerieSeleccionada;
    if Info = nil then
    begin
      CargarSeriesEcf;
      Info := SerieSeleccionada;
    end;

    if Info = nil then
    begin
      RegistrarLogEcfGasto(
        'FORM_REINTENTO_SIN_SERIE',
        'TRN=' + IntToStr(Trn) +
        ' EstadoAnterior=' + FEstadoEnvio +
        ' TrackIdAnterior=' + FTrackIdEnvio
      );

      MessageDlg(
        'El intento anterior fue RECHAZADO por DGII y tiene TrackId.' +
        #13#10 +
        'Para reenviar se requiere una nueva secuencia, pero no existe ' +
        'una serie activa disponible.',
        mtError, [mbOK], 0);
      Exit;
    end;

    ENCFRechazado :=
      UpperCase(Trim(
        dtmTransOpeDiaria.tblRegTransOpeDiariaMastECF.AsString
      ));

    MensajeReasignacion :=
      'RECHAZADO con TrackId=' + Trim(FTrackIdEnvio) + '. ' +
      Trim(memoMensajeDgii.Text);

    RegistrarLogEcfGasto(
      'FORM_REINTENTO_NUEVA_SECUENCIA',
      'TRN=' + IntToStr(Trn) +
      ' ENCFAnterior=' + ENCFRechazado +
      ' TrackId=' + FTrackIdEnvio +
      #13#10 + MensajeReasignacion
    );

    if not ReasignarSecuenciaEcfGasto(
             dmConectar.IBDatabase1,
             Trn,
             VarUsuarioGlb,
             Info.Serie,
             Info.DivNegocio,
             Info.PECF,
             Info.AICF,
             TipoActual,
             ENCFRechazado,
             MensajeReasignacion,
             ReservaNueva,
             Mensaje) then
    begin
      RegistrarLogEcfGasto(
        'FORM_REINTENTO_REASIGNACION_ERROR',
        'TRN=' + IntToStr(Trn) +
        ' ENCFAnterior=' + ENCFRechazado +
        #13#10 + Mensaje
      );

      MessageDlg(
        'El intento anterior fue RECHAZADO con TrackId y no debe ' +
        'reutilizar la misma secuencia.' + #13#10 +
        'No fue posible asignar un nuevo e-NCF.' + #13#10 +
        Mensaje,
        mtError, [mbOK], 0);
      Exit;
    end;

    Inc(Reasignaciones);
    dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Refresh;

    RegistrarLogEcfGasto(
      'FORM_REINTENTO_REASIGNACION_OK',
      'TRN=' + IntToStr(Trn) +
      ' ENCFAnterior=' + ENCFRechazado +
      ' ENCFNuevo=' + ReservaNueva.ENCF +
      ' TrackIdAnterior=' + FTrackIdEnvio
    );
  end;

  {
    Nueva ruta opcional para E41/E43 basada en Gastos.txt.
    Firebird se usa solamente aqui en Delphi para construir el archivo.
    IdesiToolECF recibe --gasto-txt y no consulta Firebird en esa ruta.
  }
  GastoTxtOutputDir :=
    IncludeTrailingPathDelimiter('C:\Electronico') + 'gasto_txt';

  btnEnviarEcf.Enabled := False;
  Screen.Cursor := crHourGlass;
  try
    while True do
    begin
      RegistrarLogEcfGasto(
        'FORM_INTENTO_INICIO',
        'TRN=' + IntToStr(Trn) +
        ' ECF=' +
        Trim(dtmTransOpeDiaria.tblRegTransOpeDiariaMastECF.AsString) +
        ' Reasignaciones=' + IntToStr(Reasignaciones) +
        ' RutaTxt=' + BoolToStr(GlbUsarFacturaTxtECF = 1, True)
      );

      if GlbUsarFacturaTxtECF = 1 then
      begin
        EnvioProcesado := ProcesarEnvioEcfGastoTxt(
                            dmConectar.IBDatabase1,
                            dmConectar.IBTransaction1,
                            ExePath,
                            Trn,
                            GastoTxtOutputDir,
                            Resultado,
                            Mensaje);
      end
      else
      begin
        { Ruta actual --gasto intacta. }
        EnvioProcesado := ProcesarEnvioEcfGasto(
                            dmConectar.IBDatabase1,
                            ExePath,
                            Trn,
                            Resultado,
                            Mensaje);
      end;
      //RegistrarLogEcfGasto(EnvioProcesado);
      RegistrarLogEcfGasto(
        'FORM_INTENTO_RESULTADO',
        'TRN=' + IntToStr(Trn) +
        ' Procesado=' + BoolToStr(EnvioProcesado, True) +
        ' Estado=' + Resultado.Estado +
        ' TrackId=' + Resultado.TrackId +
        ' ENCF=' + Resultado.ENCF +
        #13#10 +
        'Mensaje=' + Resultado.Mensaje +
        #13#10 +
        'MensajeProceso=' + Mensaje +
        #13#10 +
        'SalidaCompleta=' + Resultado.SalidaCompleta
      );

      { CRITICO: evaluar primero el resultado devuelto por ASLAN/DGII. No se
        debe salir por el Boolean antes de determinar si el rechazo corresponde
        a una secuencia ya utilizada, porque ese caso es recuperable. }
      if ResultadoRequiereReasignacionSecuencia(Resultado, Mensaje) then
      begin
        Resultado.Estado := 'SECUENCIA_USADA';
        Estado := 'SECUENCIA_USADA';

        if Trim(Resultado.Mensaje) = '' then
          Resultado.Mensaje := Mensaje;
      end
      else
        Estado := UpperCase(Trim(Resultado.Estado));

      { Solo ahora un fallo tÃ©cnico real detiene el proceso. }
      if (not EnvioProcesado) and (Estado <> 'SECUENCIA_USADA') then
      begin
        RegistrarLogEcfGasto(
          'FORM_ENVIO_ERROR_TECNICO',
          'TRN=' + IntToStr(Trn) +
          ' Estado=' + Resultado.Estado +
          ' TrackId=' + Resultado.TrackId +
          #13#10 + Mensaje +
          #13#10 + Resultado.SalidaCompleta
        );

        MessageDlg(
          'No fue posible completar el envio.' + #13#10 +
          'Estado: ' + Resultado.Estado + #13#10 +
          Mensaje,
          mtError, [mbOK], 0);
        Exit;
      end;

      if Estado <> 'SECUENCIA_USADA' then
        Break;

      Inc(Reasignaciones);

      RegistrarLogEcfGasto(
        'FORM_SECUENCIA_USADA',
        'TRN=' + IntToStr(Trn) +
        ' Estado=' + Resultado.Estado +
        ' TrackId=' + Resultado.TrackId +
        ' ENCF=' + Resultado.ENCF +
        ' Reasignaciones=' + IntToStr(Reasignaciones) +
        #13#10 + Resultado.Mensaje
      );

      if Reasignaciones > MAX_REASIGNACIONES_SECUENCIA then
      begin
        MessageDlg(
          'ASLAN/DGII reporto varias secuencias ya utilizadas.' + #13#10 +
          'Se detuvo el proceso para evitar consumir secuencias de forma indefinida.' +
          #13#10 + Resultado.Mensaje,
          mtError, [mbOK], 0);
        Exit;
      end;

      Info := SerieSeleccionada;
      if Info = nil then
      begin
        CargarSeriesEcf;
        Info := SerieSeleccionada;
      end;

      if Info = nil then
      begin
        MessageDlg(
          'La secuencia fue reportada como utilizada, pero no existe una ' +
          'configuracion activa para reasignar otro e-NCF.',
          mtError, [mbOK], 0);
        Exit;
      end;

      ENCFRechazado := UpperCase(Trim(Resultado.ENCF));
      if ENCFRechazado = '' then
        ENCFRechazado :=
          UpperCase(Trim(
            dtmTransOpeDiaria.tblRegTransOpeDiariaMastECF.AsString
          ));

      if not ReasignarSecuenciaEcfGasto(
               dmConectar.IBDatabase1,
               Trn,
               VarUsuarioGlb,
               Info.Serie,
               Info.DivNegocio,
               Info.PECF,
               Info.AICF,
               TipoActual,
               ENCFRechazado,
               Resultado.Mensaje,
               ReservaNueva,
               MensajeReasignacion) then
      begin
        MessageDlg(
          'ASLAN/DGII indico que la secuencia ' + ENCFRechazado +
          ' ya fue utilizada, pero no fue posible reasignar otra.' +
          #13#10 + MensajeReasignacion,
          mtError, [mbOK], 0);
        Exit;
      end;                             

      dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Refresh;

      RegistrarLogEcfGasto(
        'FORM_SECUENCIA_REASIGNADA',
        'TRN=' + IntToStr(Trn) +
        ' ENCFAnterior=' + ENCFRechazado +
        ' ENCFNuevo=' + ReservaNueva.ENCF +
        ' Motivo=' + Resultado.Mensaje
      );

      { Se continua automaticamente con el nuevo e-NCF.
        - Ruta --gasto: C# vuelve a extraer desde Firebird.
        - Ruta --gasto-txt: Delphi regenera Gastos.txt desde Firebird con la
          nueva secuencia y C# recibe exclusivamente el TXT. }
    end;
  finally
    Screen.Cursor := crDefault;
    btnEnviarEcf.Enabled := True;
  end;

  CargarSeriesEcf;
  CargarEstadoEnvio;
  ActualizarPantalla;
  Estado := UpperCase(Trim(Resultado.Estado));

  RegistrarLogEcfGasto(
    'FORM_ENVIO_FIN',
    'TRN=' + IntToStr(Trn) +
    ' Estado=' + Resultado.Estado +
    ' TrackId=' + Resultado.TrackId +
    ' ENCF=' + Resultado.ENCF +
    ' Reasignaciones=' + IntToStr(Reasignaciones) +
    #13#10 +
    'Mensaje=' + Resultado.Mensaje +
    #13#10 +
    'SalidaCompleta=' + Resultado.SalidaCompleta
  );

  if Pos('ACEPTADO', Estado) > 0 then
  begin
    {
      Para el usuario final no mostramos advertencias técnicas mezcladas
      con un resultado fiscal aceptado. El detalle queda en log / tracking.
    }
    Mensaje := 'e-CF ACEPTADO.' + #13#10 +
      'e-NCF: ' + Resultado.ENCF;

    if Trim(Resultado.TrackId) <> '' then
      Mensaje := Mensaje + #13#10 +
        'TrackId: ' + Resultado.TrackId;

    if Reasignaciones > 0 then
      Mensaje := Mensaje + #13#10 +
        'Secuencias reasignadas automaticamente: ' +
        IntToStr(Reasignaciones);

    MessageDlg(Mensaje, mtInformation, [mbOK], 0);
  end
  else if (Pos('IN_PROCESS', Estado) > 0) or
          (Pos('EN PROCESO', Estado) > 0) then
    MessageDlg(
      'El e-CF permanece EN PROCESO.' + #13#10 +
      'e-NCF: ' + Resultado.ENCF + #13#10 +
      'TrackId: ' + Resultado.TrackId + #13#10 +
      Resultado.Mensaje,
      mtInformation, [mbOK], 0)
  else if ResultadoEsRechazadoConTrackId(Resultado) then
    MessageDlg(
      'El e-CF fue RECHAZADO por DGII.' + #13#10 +
      'TrackId: ' + Resultado.TrackId + #13#10 +
      Resultado.Mensaje + #13#10#13#10 +
      'Corrija el documento. En el próximo envío PointSaleSoft ' +
      'asignará una nueva secuencia.',
      mtError, [mbOK], 0)
  else if ResultadoEsRechazadoSinTrackId(Resultado) then
    MessageDlg(
      'El e-CF fue RECHAZADO sin TrackId.' + #13#10 +
      Resultado.Mensaje + #13#10#13#10 +
      'Corrija el documento y vuelva a enviar. Se conservará la misma ' +
      'secuencia porque no existe evidencia de recepción DGII.',
      mtError, [mbOK], 0)
  else
    MessageDlg(
      'El e-CF no fue aceptado.' + #13#10 +
      'Estado: ' + Resultado.Estado + #13#10 +
      Resultado.Mensaje,
      mtError, [mbOK], 0);
end;

procedure TfrmRegTransOpeDiariaECF.btnRecargarSeriesClick(Sender: TObject);
begin
  CargarSeriesEcf;
end;

procedure TfrmRegTransOpeDiariaECF.btnValidarClick(Sender: TObject);
var
  Mensajes: TStringList;
  Valido: Boolean;
begin
  if dtmTransOpeDiaria.tblRegTransOpeDiariaDet.State in [dsEdit, dsInsert] then
    GuardarDetalle;
  if dtmTransOpeDiaria.tblRegTransOpeDiariaMast.State in [dsEdit, dsInsert] then
    GuardarMaestro;

  if (dtmTransOpeDiaria.tblRegTransOpeDiariaMast.State <> dsBrowse) or
     (dtmTransOpeDiaria.tblRegTransOpeDiariaDet.State <> dsBrowse) then
    Exit;

  if not AsegurarTerritorioProveedor(True) then
  begin
    MessageDlg(
      'Complete la Provincia y el Municipio e-CF del proveedor antes de validar.',
      mtInformation, [mbOK], 0);
    Exit;
  end;

  try
    GuardarMontoPagado;
  except
    on E: Exception do
    begin
      MessageDlg(E.Message, mtInformation, [mbOK], 0);
      Exit;
    end;
  end;

  Mensajes := TStringList.Create;
  try
    Valido := ValidarDocumento(False, Mensajes);
    MostrarValidacion(Valido, Mensajes);
    if Valido then
      MessageDlg('Validación completada. El documento esta listo para reservar.',
        mtInformation, [mbOK], 0);
  finally
    Mensajes.Free;
  end;
end;

end.
