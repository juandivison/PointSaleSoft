unit UFormPagoComisionesXVta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, RxToolEdit, WinSkinData, DB, Buttons, ComCtrls,
  Grids, DBGrids, RxDBCtrl, DBCtrls;

type
  TfrmPagoComisiones = class(TForm)
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    dstblComisionXVta: TDataSource;
    SkinData1: TSkinData;
    BitBtn3: TBitBtn;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    RxDBGrid1: TRxDBGrid;
    dsqryVentasComisionableSum: TDataSource;
    dsqryVentasComisionables: TDataSource;
    RxDBGrid2: TRxDBGrid;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    RxDBGrid3: TRxDBGrid;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    Label5: TLabel;
    DBEdit2: TDBEdit;
    edtPorcCom: TEdit;
    Label6: TLabel;
    BitBtn6: TBitBtn;
    Label7: TLabel;
    cboxListaVendedores: TComboBox;
    dsqryVendedores: TDataSource;
    cboxVendedoresresumen: TComboBox;
    Label8: TLabel;
    CheckBox1: TCheckBox;
    Label9: TLabel;
    btnConfirmarComision: TButton;
    lblFechaPago: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure cboxListaVendedoresChange(Sender: TObject);
    procedure cboxVendedoresresumenChange(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure RxDBGrid2Enter(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure DateTimePicker1Exit(Sender: TObject);
    procedure DateTimePicker2Exit(Sender: TObject);
    procedure btnConfirmarComisionClick(Sender: TObject);
  private
    { Private declarations }
    function FCantDiasAPagar(fechaini: TDateTime; fechafin: TDateTime): string;
    function ObtenerFechaControlComision(var AFecha: TDateTime): Boolean;
    function ValidarRangoComision: Boolean;
    function ValidarFechasRegistroComision: Boolean;
    function ExisteComisionPeriodoActual: Boolean;
    procedure ActualizarEtiquetaFechaPago(const AFechaPago: TDateTime);
    function CargarPeriodoDesdeControl: Boolean;
  public
    { Public declarations }
  end;

var
  frmPagoComisiones: TfrmPagoComisiones;
  _codigoEmpleado: Integer;

implementation

uses
  UGlobal, UDatModComisiones, DateUtils, UDatModNomina,
  URepPagoComisionesXVta;

{$R *.dfm}

function SeleccionarParametrosReporteComision(
  var AFechaIni: TDateTime;
  var AFechaFin: TDateTime;
  var AModo: TModoRepComision): Boolean;
var
  LForm: TForm;
  LLabelTitulo, LLabelDesde, LLabelHasta: TLabel;
  LFechaIni, LFechaFin: TDateTimePicker;
  LrbResumido, LrbDetallado: TRadioButton;
  LBtnAceptar, LBtnCancelar: TButton;
  LResultado: Integer;
begin
  Result := False;

  LForm := TForm.Create(nil);
  try
    LForm.Caption := 'Consultar / Imprimir Comisiones';
    LForm.BorderStyle := bsDialog;
    LForm.Position := poScreenCenter;
    LForm.ClientWidth := 430;
    LForm.ClientHeight := 210;

    LLabelTitulo := TLabel.Create(LForm);
    LLabelTitulo.Parent := LForm;
    LLabelTitulo.Left := 16;
    LLabelTitulo.Top := 14;
    LLabelTitulo.Width := 395;
    LLabelTitulo.Height := 30;
    LLabelTitulo.AutoSize := False;
    LLabelTitulo.WordWrap := True;
    LLabelTitulo.Caption :=
      'Seleccione el rango histórico de FECHA_PAGO que desea consultar e imprimir.';

    LLabelDesde := TLabel.Create(LForm);
    LLabelDesde.Parent := LForm;
    LLabelDesde.Left := 18;
    LLabelDesde.Top := 58;
    LLabelDesde.Caption := 'Desde:';

    LFechaIni := TDateTimePicker.Create(LForm);
    LFechaIni.Parent := LForm;
    LFechaIni.Left := 80;
    LFechaIni.Top := 54;
    LFechaIni.Width := 135;
    LFechaIni.Date := ExtraerFecha(AFechaIni);

    LLabelHasta := TLabel.Create(LForm);
    LLabelHasta.Parent := LForm;
    LLabelHasta.Left := 230;
    LLabelHasta.Top := 58;
    LLabelHasta.Caption := 'Hasta:';

    LFechaFin := TDateTimePicker.Create(LForm);
    LFechaFin.Parent := LForm;
    LFechaFin.Left := 282;
    LFechaFin.Top := 54;
    LFechaFin.Width := 135;
    LFechaFin.Date := ExtraerFecha(AFechaFin);

    LrbResumido := TRadioButton.Create(LForm);
    LrbResumido.Parent := LForm;
    LrbResumido.Left := 82;
    LrbResumido.Top := 103;
    LrbResumido.Width := 100;
    LrbResumido.Caption := 'Resumido';
    LrbResumido.Checked := True;

    LrbDetallado := TRadioButton.Create(LForm);
    LrbDetallado.Parent := LForm;
    LrbDetallado.Left := 220;
    LrbDetallado.Top := 103;
    LrbDetallado.Width := 100;
    LrbDetallado.Caption := 'Detallado';

    LBtnAceptar := TButton.Create(LForm);
    LBtnAceptar.Parent := LForm;
    LBtnAceptar.Left := 110;
    LBtnAceptar.Top := 150;
    LBtnAceptar.Width := 95;
    LBtnAceptar.Height := 28;
    LBtnAceptar.Caption := 'Vista previa';
    LBtnAceptar.ModalResult := mrOk;
    LBtnAceptar.Default := True;

    LBtnCancelar := TButton.Create(LForm);
    LBtnCancelar.Parent := LForm;
    LBtnCancelar.Left := 225;
    LBtnCancelar.Top := 150;
    LBtnCancelar.Width := 95;
    LBtnCancelar.Height := 28;
    LBtnCancelar.Caption := 'Cancelar';
    LBtnCancelar.ModalResult := mrCancel;
    LBtnCancelar.Cancel := True;

    while True do
    begin
      LResultado := LForm.ShowModal;

      if LResultado <> mrOk then
        Exit;

      if ExtraerFecha(LFechaFin.Date) < ExtraerFecha(LFechaIni.Date) then
      begin
        MessageDlg(
          'La fecha final del reporte no puede ser menor que la fecha inicial.',
          mtWarning, [mbOK], 0
        );
        Continue;
      end;

      AFechaIni := ExtraerFecha(LFechaIni.Date);
      AFechaFin := ExtraerFecha(LFechaFin.Date);

      if LrbDetallado.Checked then
        AModo := mrcDetallado
      else
        AModo := mrcResumido;

      Result := True;
      Exit;
    end;
  finally
    LForm.Free;
  end;
end;

procedure TfrmPagoComisiones.ActualizarEtiquetaFechaPago(
  const AFechaPago: TDateTime);
begin
  lblFechaPago.Caption :=
    'Fecha Pago: ' + FormatDateTime('dd-mmm-yyyy', ExtraerFecha(AFechaPago));
end;

function TfrmPagoComisiones.ObtenerFechaControlComision(
  var AFecha: TDateTime): Boolean;
begin
  Result := False;

  dmNomina.tblControl.Close;
  dmNomina.tblControl.Params[0].Value := 5; // SISTEMA = 5
  dmNomina.tblControl.Params[1].Value := 5; // SUB_SISTEMA = 5 - Comisiones
  dmNomina.tblControl.Open;

  if dmNomina.tblControl.IsEmpty then
  begin
    MessageDlg(
      'No existe configuración CONTROL para Sistema 5, ' +
      'Sub-Sistema 5 - Comisiones.',
      mtWarning,
      [mbOK],
      0
    );
    Exit;
  end;

  if dmNomina.tblControlFECHA_ACT.IsNull then
  begin
    MessageDlg(
      'La fecha de control de Comisiones no ha sido configurada.',
      mtWarning,
      [mbOK],
      0
    );
    Exit;
  end;

  {
    Para Comisiones:
      CONTROL(5,5).FECHA_ACT = primera fecha pendiente
      del próximo período a pagar.
  }
  AFecha := ExtraerFecha(dmNomina.tblControlFECHA_ACT.Value);

  Result := True;
end;

function TfrmPagoComisiones.CargarPeriodoDesdeControl: Boolean;
var
  LFechaControl: TDateTime;
begin
  Result := False;

  if not ObtenerFechaControlComision(LFechaControl) then
    Exit;

  {
    FECHA_PAGO y FECHA_INICIO nacen de CONTROL(5,5).FECHA_ACT.
    La fecha inicial queda bloqueada para impedir saltos o reprocesos.
    El usuario solamente decide hasta qué FECHA_FINAL pagar.
  }
  DateTimePicker1.DateTime := LFechaControl;
  DateTimePicker2.DateTime := LFechaControl;
  DateTimePicker1.Enabled := False;

  ActualizarEtiquetaFechaPago(LFechaControl);

  Result := True;
end;

function TfrmPagoComisiones.ValidarRangoComision: Boolean;
var
  LFechaControl: TDateTime;
  LFechaIni: TDateTime;
  LFechaFin: TDateTime;
begin
  Result := False;

  if not ObtenerFechaControlComision(LFechaControl) then
    Exit;

  LFechaControl := ExtraerFecha(LFechaControl);
  LFechaIni := ExtraerFecha(DateTimePicker1.Date);
  LFechaFin := ExtraerFecha(DateTimePicker2.Date);

  {
    La fecha inicial debe coincidir exactamente con la fecha
    pendiente indicada por CONTROL(5,5).
  }
  if LFechaIni <> LFechaControl then
  begin
    MessageDlg(
      'La fecha inicial debe coincidir con la fecha de control ' +
      'de Comisiones.' +
      #13#10#13#10 +
      'Fecha de Control: ' + DateToStr(LFechaControl) + #13#10 +
      'Fecha Inicial: ' + DateToStr(LFechaIni),
      mtWarning,
      [mbOK],
      0
    );
    Exit;
  end;

  if LFechaFin < LFechaIni then
  begin
    MessageDlg(
      'La fecha final no puede ser menor que la fecha inicial.',
      mtWarning,
      [mbOK],
      0
    );
    Exit;
  end;

  Result := True;
end;

function TfrmPagoComisiones.ValidarFechasRegistroComision: Boolean;
var
  LFechaPago: TDateTime;
  LFechaIni: TDateTime;
  LFechaFin: TDateTime;
begin
  Result := False;

  if dmComision.tblComisionXVta.State = dsInactive then
  begin
    MessageDlg(
      'El detalle de comisiones no está activo.',
      mtWarning,
      [mbOK],
      0
    );
    Exit;
  end;

  if dmComision.tblComisionXVtaFECHA_PAGO.IsNull or
     dmComision.tblComisionXVtaFECHA_INICIO.IsNull or
     dmComision.tblComisionXVtaFECHA_FINAL.IsNull then
  begin
    MessageDlg(
      'Fecha de pago, fecha inicial y fecha final son obligatorias.',
      mtWarning,
      [mbOK],
      0
    );
    Exit;
  end;

  LFechaPago := ExtraerFecha(dmComision.tblComisionXVtaFECHA_PAGO.Value);
  LFechaIni := ExtraerFecha(dmComision.tblComisionXVtaFECHA_INICIO.Value);
  LFechaFin := ExtraerFecha(dmComision.tblComisionXVtaFECHA_FINAL.Value);

  {
    Invariante solicitado:
      FECHA_INICIO >= FECHA_PAGO
      FECHA_FINAL  >= FECHA_PAGO
      FECHA_FINAL  >= FECHA_INICIO
  }
  if LFechaIni < LFechaPago then
  begin
    MessageDlg(
      'La fecha inicial de la comisión no puede ser menor ' +
      'que la fecha de pago.' +
      #13#10#13#10 +
      'Fecha Pago: ' + DateToStr(LFechaPago) + #13#10 +
      'Fecha Inicial: ' + DateToStr(LFechaIni),
      mtWarning,
      [mbOK],
      0
    );
    Exit;
  end;

  if LFechaFin < LFechaPago then
  begin
    MessageDlg(
      'La fecha final de la comisión no puede ser menor ' +
      'que la fecha de pago.' +
      #13#10#13#10 +
      'Fecha Pago: ' + DateToStr(LFechaPago) + #13#10 +
      'Fecha Final: ' + DateToStr(LFechaFin),
      mtWarning,
      [mbOK],
      0
    );
    Exit;
  end;

  if LFechaFin < LFechaIni then
  begin
    MessageDlg(
      'La fecha final de la comisión no puede ser menor ' +
      'que la fecha inicial.',
      mtWarning,
      [mbOK],
      0
    );
    Exit;
  end;

  Result := True;
end;

function TfrmPagoComisiones.ExisteComisionPeriodoActual: Boolean;
var
  LFechaIni: TDateTime;
  LFechaFin: TDateTime;
begin
  Result := False;

  if dmComision.tblComisionXVta.State = dsInactive then
    Exit;

  if dmComision.tblComisionXVta.IsEmpty then
    Exit;

  LFechaIni := ExtraerFecha(DateTimePicker1.Date);
  LFechaFin := ExtraerFecha(DateTimePicker2.Date);

  {
    No basta con que el query tenga registros.
    Debe existir al menos una comisión del período exacto
    que se está confirmando.
  }
  Result := dmComision.tblComisionXVta.Locate(
    'TIPO;FECHA_PAGO;FECHA_INICIO;FECHA_FINAL',
    VarArrayOf([
      0,
      LFechaIni,
      LFechaIni,
      LFechaFin
    ]),
    []
  );
end;

procedure TfrmPagoComisiones.FormCreate(Sender: TObject);
begin
  {
    BitBtn2 ya existe en el DFM. Se conecta aquí para no modificar
    la estructura ni las propiedades existentes del formulario.
  }
  BitBtn2.Caption := 'Reporte';
  BitBtn2.OnClick := BitBtn2Click;

  lblFechaPago.Caption := '';
  Label9.Caption := '';

  dmComision.qryVendedores.Close;
  dmComision.qryVendedores.Open;

  cboxListaVendedores.Clear;
  cboxVendedoresresumen.Clear;

  dmComision.qryVendedores.First;

  while not dmComision.qryVendedores.Eof do
  begin
    cboxListaVendedores.Items.Add(
      dmComision.qryVendedoresNOMBREVENDEDOR.Value);

    cboxVendedoresresumen.Items.Add(
      dmComision.qryVendedoresNOMBREVENDEDOR.Value);

    dmComision.qryVendedores.Next;
  end;

  if not dmComision.qryVendedores.IsEmpty then
  begin
    dmComision.qryVendedores.First;

    cboxListaVendedores.Text :=
      dmComision.qryVendedoresNOMBREVENDEDOR.Value;

    cboxVendedoresresumen.Text :=
      dmComision.qryVendedoresNOMBREVENDEDOR.Value;
  end;

  {
    Comisiones trabaja exclusivamente con CONTROL 5,5.
    No se solicita fecha de Nómina ni se consulta CONTROL 5,1.
  }
  if not CargarPeriodoDesdeControl then
  begin
    btnConfirmarComision.Enabled := False;
    Exit;
  end;

  btnConfirmarComision.Enabled := True;

  BitBtn5Click(Self);

  if not dmComision.qryVendedores.IsEmpty then
  begin
    cboxVendedoresresumenChange(Self);
    cboxListaVendedoresChange(Self);
  end;

  Label9.Caption :=
    FCantDiasAPagar(DateTimePicker1.Date, DateTimePicker2.Date);
end;

procedure TfrmPagoComisiones.BitBtn3Click(Sender: TObject);
begin
  if not ValidarRangoComision then
    Exit;

  dmComision.qryVentasComisionable.Close;
  dmComision.qryVentasComisionable.Params[0].Value :=
    ExtraerFecha(DateTimePicker1.Date);
  dmComision.qryVentasComisionable.Params[1].Value :=
    ExtraerFecha(DateTimePicker2.Date);
  dmComision.qryVentasComisionable.Open;

  dmComision.tblComisionXVta.Close;
  dmComision.tblComisionXVta.Params[0].Value :=
    ExtraerFecha(DateTimePicker1.Date);
  dmComision.tblComisionXVta.Params[1].Value :=
    ExtraerFecha(DateTimePicker2.Date);
  dmComision.tblComisionXVta.Open;
end;

procedure TfrmPagoComisiones.BitBtn1Click(Sender: TObject);
begin
  if dmComision.tblComisionXVta.State = dsInactive then
    Exit;

  if dmComision.tblComisionXVta.State in [dsEdit, dsInsert] then
  begin
    if not ValidarFechasRegistroComision then
      Exit;
  end;

  GlbSalvarQuery(dmComision.tblComisionXVta);
end;

procedure TfrmPagoComisiones.BitBtn2Click(Sender: TObject);
var
  LFechaIni, LFechaFin: TDateTime;
  LFechaTrabajoIni, LFechaTrabajoFin: TDateTime;
  LModo: TModoRepComision;
begin
  {
    El reporte histórico es independiente del período de pago actual.
    NO se llama ValidarRangoComision porque esa validación está ligada
    a CONTROL(5,5).FECHA_ACT y sólo aplica al pago corriente.
  }
  if dmComision.tblComisionXVta.State in [dsEdit, dsInsert] then
  begin
    MessageDlg(
      'Existe una comisión pendiente de guardar.' +
      #13#10#13#10 +
      'Guarde o cancele la edición antes de consultar otro período.',
      mtWarning, [mbOK], 0
    );
    Exit;
  end;

  {
    Preservar el rango operativo que se está pagando.
  }
  LFechaTrabajoIni := ExtraerFecha(DateTimePicker1.Date);
  LFechaTrabajoFin := ExtraerFecha(DateTimePicker2.Date);

  {
    El diálogo arranca con el período actual, pero el usuario
    puede consultar libremente cualquier rango histórico.
  }
  LFechaIni := LFechaTrabajoIni;
  LFechaFin := LFechaTrabajoFin;

  if not SeleccionarParametrosReporteComision(
           LFechaIni, LFechaFin, LModo) then
    Exit;

  qckRepPagoComisionesXVta :=
    TqckRepPagoComisionesXVta.Create(nil);
  try
    qckRepPagoComisionesXVta.ConfigurarReporte(
      LFechaIni,
      LFechaFin,
      LModo
    );

    if dmComision.tblComisionXVta.IsEmpty then
    begin
      MessageDlg(
        'No existen comisiones registradas para el rango consultado.' +
        #13#10#13#10 +
        'Desde: ' + DateToStr(LFechaIni) + #13#10 +
        'Hasta: ' + DateToStr(LFechaFin),
        mtInformation, [mbOK], 0
      );
      Exit;
    end;

    qckRepPagoComisionesXVta.Preview;
  finally
    qckRepPagoComisionesXVta.Free;
    qckRepPagoComisionesXVta := nil;

    {
      El reporte reutiliza tblComisionXVta.
      Restaurar el rango actual evita que el formulario quede
      mostrando comisiones históricas después del Preview.
    }
    dmComision.tblComisionXVta.Close;
    dmComision.tblComisionXVta.Params[0].Value := LFechaTrabajoIni;
    dmComision.tblComisionXVta.Params[1].Value := LFechaTrabajoFin;
    dmComision.tblComisionXVta.Open;
  end;
end;

procedure TfrmPagoComisiones.BitBtn4Click(Sender: TObject);
begin
  if dmComision.tblComisionXVta.State = dsInactive then
    Exit;

  if dmComision.tblComisionXVta.IsEmpty then
    Exit;

  dmComision.tblComisionXVta.Edit;
end;

procedure TfrmPagoComisiones.BitBtn5Click(Sender: TObject);
begin
  BitBtn3Click(Self);
end;

procedure TfrmPagoComisiones.BitBtn6Click(Sender: TObject);
begin
  if dmComision.qryVentasComisionableSum.State = dsInactive then
    Exit;

  dmComision.qryVentasComisionableSum.First;
  SpeedButton2Click(Self);
end;

procedure TfrmPagoComisiones.SpeedButton1Click(Sender: TObject);
begin
  BitBtn7Click(Self);
end;

procedure TfrmPagoComisiones.BitBtn7Click(Sender: TObject);
var
  LFechaPago: TDateTime;
begin
  if not ValidarRangoComision then
    Exit;

  if dmComision.qryVentasComisionableSum.State = dsInactive then
    Exit;

  if dmComision.qryVentasComisionableSum.IsEmpty then
    Exit;

  cboxListaVendedoresChange(Self);

  if dmComision.tblComisionXVta.State = dsInactive then
    Exit;

  LFechaPago := ExtraerFecha(DateTimePicker1.Date);

  {
    La identificación del registro incluye FECHA_PAGO.
    Esto impide editar por error una comisión histórica
    del mismo empleado.
  }
  if not dmComision.tblComisionXVta.Locate(
       'CODIGO_EMPLEADO;TIPO;FECHA_PAGO',
       VarArrayOf([dmComision.qryVentasComisionableSumCODIGO_VENDEDOR.Value,
         0,LFechaPago]),[]) then
  begin
    dmComision.tblComisionXVta.Insert;

    dmComision.tblComisionXVtaTIPO.Value := 0;
    dmComision.tblComisionXVtaCODIGO_EMPLEADO.Value :=
      dmComision.qryVentasComisionableSumCODIGO_VENDEDOR.Value;

    dmComision.tblComisionXVtaFECHA_PAGO.Value := LFechaPago;
    dmComision.tblComisionXVtaFECHA_INICIO.Value :=
      ExtraerFecha(DateTimePicker1.Date);
    dmComision.tblComisionXVtaFECHA_FINAL.Value :=
      ExtraerFecha(DateTimePicker2.Date);

    dmComision.tblComisionXVtaSTATUS.Value := 'A';
    dmComision.tblComisionXVtaFECHA_IN.Value := Now;
    dmComision.tblComisionXVtaIN_POR.Value := strUserName;

    dmComision.tblComisionXVtaMONTO_BASE.Value :=
      dmComision.qryVentasComisionableSumVALORTOTALVENTA.Value;

    dmComision.tblComisionXVtaPORC_COMISION.Value :=
      StrToFloat(edtPorcCom.Text);

    dmComision.tblComisionXVtaMONTO_COMISION.Value :=
      dmComision.tblComisionXVtaMONTO_BASE.Value *
      dmComision.tblComisionXVtaPORC_COMISION.Value / 100;
  end
  else
  begin
    dmComision.tblComisionXVta.Edit;

    {
      También se reafirman las fechas al editar.
      No dejamos que una comisión existente conserve
      un rango distinto al período actual.
    }
    dmComision.tblComisionXVtaFECHA_PAGO.Value := LFechaPago;
    dmComision.tblComisionXVtaFECHA_INICIO.Value :=
      ExtraerFecha(DateTimePicker1.Date);
    dmComision.tblComisionXVtaFECHA_FINAL.Value :=
      ExtraerFecha(DateTimePicker2.Date);

    dmComision.tblComisionXVtaSTATUS.Value := 'A';
    dmComision.tblComisionXVtaIN_POR.Value := strUserName;

    dmComision.tblComisionXVtaMONTO_BASE.Value :=
      dmComision.qryVentasComisionableSumVALORTOTALVENTA.Value;

    dmComision.tblComisionXVtaPORC_COMISION.Value :=
      StrToFloat(edtPorcCom.Text);

    dmComision.tblComisionXVtaMONTO_COMISION.Value :=
      dmComision.tblComisionXVtaMONTO_BASE.Value *
      dmComision.tblComisionXVtaPORC_COMISION.Value / 100;
  end;

  if not ValidarFechasRegistroComision then
  begin
    if dmComision.tblComisionXVta.State in [dsEdit, dsInsert] then
      dmComision.tblComisionXVta.Cancel;
    Exit;
  end;

  GlbSalvarQuery(dmComision.tblComisionXVta);
end;

procedure TfrmPagoComisiones.FormCloseQuery(
  Sender: TObject; var CanClose: Boolean);
begin
  if dmComision.tblComisionXVta.State in [dsEdit, dsInsert] then
  begin
    if MessageDlg(
         'Tienes una trasacción pendiente, aún desea salir',
         mtInformation,
         [mbYes, mbNo],
         0
       ) = mrNo then
      CanClose := False
    else
      CanClose := True;
  end
  else
    CanClose := True;
end;

procedure TfrmPagoComisiones.cboxListaVendedoresChange(Sender: TObject);
begin
  if dmComision.qryVentasComisionable.State = dsInactive then
    Exit;

  if dmComision.qryVendedores.Locate(
       'NOMBREVENDEDOR',
       cboxListaVendedores.Text,
       []) then
  begin
    _codigoEmpleado := dmComision.qryVendedoresCODIGO.Value;

    if dmComision.qryVentasComisionable.Locate(
         'CODIGO_VENDEDOR',
         _codigoEmpleado,
         []) then
    begin
      if CheckBox1.Checked then
      begin
        CheckBox1.Caption := 'Filtrado';
        dmComision.codVendedor :=
          dmComision.qryVentasComisionableCODIGO_VENDEDOR.Value;
        dmComision.qryVentasComisionable.Filtered := True;
      end;
    end;
  end;
end;

procedure TfrmPagoComisiones.cboxVendedoresresumenChange(Sender: TObject);
begin
  if dmComision.qryVentasComisionableSum.State = dsInactive then
    Exit;

  if dmComision.qryVendedores.Locate(
       'NOMBREVENDEDOR',
       cboxVendedoresresumen.Text,
       []) then
  begin
    _codigoEmpleado := dmComision.qryVendedoresCODIGO.Value;

    dmComision.qryVentasComisionableSum.Locate(
      'CODIGO_VENDEDOR',
      _codigoEmpleado,
      []);
  end;
end;

procedure TfrmPagoComisiones.SpeedButton2Click(Sender: TObject);
var
  LFechaPago: TDateTime;
begin
  if dmComision.qryVentasComisionableSum.State = dsInactive then
    Exit;

  if dmComision.tblComisionXVta.State = dsInactive then
    Exit;

  if not ValidarRangoComision then
    Exit;

  LFechaPago := ExtraerFecha(DateTimePicker1.Date);

  dmComision.qryVentasComisionableSum.First;

  while not dmComision.qryVentasComisionableSum.Eof do
  begin
    if not dmComision.tblComisionXVta.Locate(
         'CODIGO_EMPLEADO;TIPO;FECHA_PAGO',
         VarArrayOf([
           dmComision.qryVentasComisionableSumCODIGO_VENDEDOR.Value,
           0,
           LFechaPago
         ]),
         []) then
    begin
      dmComision.tblComisionXVta.Insert;

      dmComision.tblComisionXVtaTIPO.Value := 0;
      dmComision.tblComisionXVtaCODIGO_EMPLEADO.Value :=
        dmComision.qryVentasComisionableSumCODIGO_VENDEDOR.Value;

      dmComision.tblComisionXVtaFECHA_PAGO.Value := LFechaPago;
      dmComision.tblComisionXVtaFECHA_INICIO.Value :=
        ExtraerFecha(DateTimePicker1.Date);
      dmComision.tblComisionXVtaFECHA_FINAL.Value :=
        ExtraerFecha(DateTimePicker2.Date);

      dmComision.tblComisionXVtaSTATUS.Value := 'A';
      dmComision.tblComisionXVtaFECHA_IN.Value := Now;
      dmComision.tblComisionXVtaIN_POR.Value := strUserName;

      dmComision.tblComisionXVtaMONTO_BASE.Value :=
        dmComision.qryVentasComisionableSumVALORTOTALVENTA.Value;

      dmComision.tblComisionXVtaPORC_COMISION.Value :=
        StrToFloat(edtPorcCom.Text);

      dmComision.tblComisionXVtaMONTO_COMISION.Value :=
        dmComision.tblComisionXVtaMONTO_BASE.Value *
        dmComision.tblComisionXVtaPORC_COMISION.Value / 100;
    end
    else
    begin
      dmComision.tblComisionXVta.Edit;

      dmComision.tblComisionXVtaFECHA_PAGO.Value := LFechaPago;
      dmComision.tblComisionXVtaFECHA_INICIO.Value :=
        ExtraerFecha(DateTimePicker1.Date);
      dmComision.tblComisionXVtaFECHA_FINAL.Value :=
        ExtraerFecha(DateTimePicker2.Date);

      dmComision.tblComisionXVtaSTATUS.Value := 'A';
      dmComision.tblComisionXVtaIN_POR.Value := strUserName;

      dmComision.tblComisionXVtaMONTO_BASE.Value :=
        dmComision.qryVentasComisionableSumVALORTOTALVENTA.Value;

      dmComision.tblComisionXVtaPORC_COMISION.Value :=
        StrToFloat(edtPorcCom.Text);

      dmComision.tblComisionXVtaMONTO_COMISION.Value :=
        dmComision.tblComisionXVtaMONTO_BASE.Value *
        dmComision.tblComisionXVtaPORC_COMISION.Value / 100;
    end;

    if not ValidarFechasRegistroComision then
    begin
      if dmComision.tblComisionXVta.State in [dsEdit, dsInsert] then
        dmComision.tblComisionXVta.Cancel;
      Exit;
    end;

    GlbSalvarQuery(dmComision.tblComisionXVta);

    dmComision.qryVentasComisionableSum.Next;
  end;
end;

procedure TfrmPagoComisiones.SpeedButton3Click(Sender: TObject);
begin
  if dmComision.tblComisionXVta.State = dsInactive then
    Exit;

  if dmComision.tblComisionXVta.IsEmpty then
    Exit;

  if dmComision.tblComisionXVtaSTATUS.Value = 'A' then
  begin
    dmComision.tblComisionXVta.Delete;
    GlbSalvarQuery(dmComision.tblComisionXVta);
  end;
end;

procedure TfrmPagoComisiones.SpeedButton4Click(Sender: TObject);
begin
  if dmComision.tblComisionXVta.State = dsInactive then
    Exit;

  dmComision.tblComisionXVta.First;

  while not dmComision.tblComisionXVta.Eof do
  begin
    if dmComision.tblComisionXVtaSTATUS.Value = 'A' then
    begin
      dmComision.tblComisionXVta.Delete;
      GlbSalvarQuery(dmComision.tblComisionXVta);
    end
    else
      dmComision.tblComisionXVta.Next;
  end;
end;

procedure TfrmPagoComisiones.RxDBGrid2Enter(Sender: TObject);
begin
  if dmComision.tblComisionXVta.State = dsInactive then
  begin
    dmComision.tblComisionXVta.Close;
    dmComision.tblComisionXVta.Params[0].Value :=
      ExtraerFecha(DateTimePicker1.Date);
    dmComision.tblComisionXVta.Params[1].Value :=
      ExtraerFecha(DateTimePicker2.Date);
    dmComision.tblComisionXVta.Open;
  end;

  if dmComision.qryVentasComisionableSum.State = dsInactive then
    Exit;

  if dmComision.qryVentasComisionableSum.IsEmpty then
    Exit;

  dmComision.tblComisionXVta.Locate(
    'CODIGO_EMPLEADO;TIPO;FECHA_PAGO',
    VarArrayOf([
      dmComision.qryVentasComisionableSumCODIGO_VENDEDOR.Value,
      0,
      ExtraerFecha(DateTimePicker1.Date)
    ]),
    []);
end;

procedure TfrmPagoComisiones.DBEdit1Exit(Sender: TObject);
begin
  if dmComision.tblComisionXVta.State in [dsEdit, dsInsert] then
    dmComision.tblComisionXVtaMONTO_COMISION.Value :=
      dmComision.tblComisionXVtaMONTO_BASE.Value *
      dmComision.tblComisionXVtaPORC_COMISION.Value / 100;
end;

procedure TfrmPagoComisiones.DBEdit2Exit(Sender: TObject);
begin
  if dmComision.tblComisionXVta.State in [dsEdit, dsInsert] then
    dmComision.tblComisionXVtaMONTO_COMISION.Value :=
      dmComision.tblComisionXVtaMONTO_BASE.Value *
      dmComision.tblComisionXVtaPORC_COMISION.Value / 100;
end;

procedure TfrmPagoComisiones.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
  begin
    CheckBox1.Caption := 'Filtrado';

    if dmComision.qryVentasComisionable.State <> dsInactive then
    begin
      if not dmComision.qryVentasComisionable.IsEmpty then
      begin
        dmComision.codVendedor :=
          dmComision.qryVentasComisionableCODIGO_VENDEDOR.Value;
        dmComision.qryVentasComisionable.Filtered := True;
      end;
    end;
  end
  else
  begin
    CheckBox1.Caption := '';
    dmComision.qryVentasComisionable.Filtered := False;
  end;
end;

function TfrmPagoComisiones.FCantDiasAPagar(
  fechaini, fechafin: TDateTime): string;
var
  cantD: Integer;
begin
  Result := '';

  if ExtraerFecha(fechafin) < ExtraerFecha(fechaini) then
    Exit;

  {
    Se mantiene la intención original:
    advertir cuando el período excede 15 días.
    Se cuenta de forma inclusiva.
  }
  cantD := DaysBetween(
             ExtraerFecha(fechafin),
             ExtraerFecha(fechaini)
           ) + 1;

  if cantD > 15 then
    Result := '*** Total Dias Comisiones?' + IntToStr(cantD);
end;

procedure TfrmPagoComisiones.DateTimePicker1Exit(Sender: TObject);
var
  LFechaControl: TDateTime;
begin
  {
    El DFM conserva el evento. Aunque el control queda Disabled
    durante operación normal, esta protección evita que código
    externo o un cambio futuro permita alterar el inicio.
  }
  if not ObtenerFechaControlComision(LFechaControl) then
    Exit;

  LFechaControl := ExtraerFecha(LFechaControl);

  if ExtraerFecha(DateTimePicker1.Date) <> LFechaControl then
  begin
    MessageDlg(
      'La fecha inicial está controlada por CONTROL 5,5 y no puede cambiarse.' +
      #13#10#13#10 +
      'Fecha permitida: ' + DateToStr(LFechaControl),
      mtInformation,
      [mbOK],
      0
    );

    DateTimePicker1.DateTime := LFechaControl;
  end;

  if DateTimePicker2.Date < DateTimePicker1.Date then
    DateTimePicker2.DateTime := DateTimePicker1.Date;

  ActualizarEtiquetaFechaPago(LFechaControl);

  Label9.Caption :=
    FCantDiasAPagar(DateTimePicker1.Date, DateTimePicker2.Date);
end;

procedure TfrmPagoComisiones.DateTimePicker2Exit(Sender: TObject);
begin
  if DateTimePicker2.Date < DateTimePicker1.Date then
  begin
    MessageDlg(
      'Verifica fecha final, no puede ser menor a fecha inicial.',
      mtInformation,
      [mbOK],
      0
    );

    DateTimePicker2.DateTime := DateTimePicker1.Date;
  end;

  Label9.Caption :=
    FCantDiasAPagar(DateTimePicker1.Date, DateTimePicker2.Date);
end;

procedure TfrmPagoComisiones.btnConfirmarComisionClick(Sender: TObject);
var
  LFechaIni: TDateTime;
  LFechaFin: TDateTime;
  LProximaFecha: TDateTime;
begin
  if not ValidarRangoComision then
    Exit;

  LFechaIni := ExtraerFecha(DateTimePicker1.Date);
  LFechaFin := ExtraerFecha(DateTimePicker2.Date);
  LProximaFecha := IncDay(LFechaFin, 1);

  {
    Si existe una edición pendiente, primero debe quedar válida
    y persistida antes de avanzar CONTROL(5,5).
  }
  if dmComision.tblComisionXVta.State in [dsEdit, dsInsert] then
  begin
    if not ValidarFechasRegistroComision then
      Exit;

    GlbSalvarQuery(dmComision.tblComisionXVta);
  end;

  if not ExisteComisionPeriodoActual then
  begin
    MessageDlg(
      'No existen comisiones registradas para el período que intenta confirmar.' +
      #13#10#13#10 +
      'Desde: ' + DateToStr(LFechaIni) + #13#10 +
      'Hasta: ' + DateToStr(LFechaFin),
      mtWarning,
      [mbOK],
      0
    );
    Exit;
  end;

  if MessageDlg(
       'Confirmar pago de comisiones?' +
       #13#10#13#10 +
       'Fecha Pago: ' + DateToStr(LFechaIni) + #13#10 +
       'Desde: ' + DateToStr(LFechaIni) + #13#10 +
       'Hasta: ' + DateToStr(LFechaFin) + #13#10 +
       'Próximo período inicia: ' + DateToStr(LProximaFecha),
       mtConfirmation,
       [mbYes, mbNo],
       0
     ) = mrNo then
    Exit;

  {
    Releer CONTROL justo antes de actualizarlo.
    Esto protege contra doble confirmación o contra otro proceso
    que haya avanzado el período después de abrir el formulario.
  }
  dmNomina.tblControl.Close;
  dmNomina.tblControl.Params[0].Value := 5;
  dmNomina.tblControl.Params[1].Value := 5;
  dmNomina.tblControl.Open;

  if dmNomina.tblControl.IsEmpty then
  begin
    MessageDlg(
      'No existe configuración de control para Comisiones.',
      mtWarning,
      [mbOK],
      0
    );
    Exit;
  end;

  if dmNomina.tblControlFECHA_ACT.IsNull then
  begin
    MessageDlg(
      'La fecha de control de Comisiones no ha sido configurada.',
      mtWarning,
      [mbOK],
      0
    );
    Exit;
  end;

  if ExtraerFecha(dmNomina.tblControlFECHA_ACT.Value) <> LFechaIni then
  begin
    MessageDlg(
      'El período de comisiones ya no coincide con la fecha de control.' +
      #13#10#13#10 +
      'Fecha de Control: ' +
        DateToStr(ExtraerFecha(dmNomina.tblControlFECHA_ACT.Value)) +
      #13#10 +
      'Fecha Inicial: ' + DateToStr(LFechaIni),
      mtWarning,
      [mbOK],
      0
    );
    Exit;
  end;

  dmNomina.tblControl.Edit;

  {
    Regla principal:
      Si se pagó 01..15, CONTROL.FECHA_ACT pasa a 16.
      En general: nueva FECHA_ACT = FECHA_FINAL + 1 día.
  }
  dmNomina.tblControlFECHA_ACT.Value := LProximaFecha;

  GlbSalvarQuery(dmNomina.tblControl);

  MessageDlg(
    'Pago de comisiones confirmado correctamente.' +
    #13#10#13#10 +
    'Período pagado: ' +
      DateToStr(LFechaIni) + ' al ' + DateToStr(LFechaFin) +
    #13#10 +
    'La próxima fecha de inicio será: ' +
      DateToStr(LProximaFecha),
    mtInformation,
    [mbOK],
    0
  );

  {
    Deja el formulario preparado para el próximo ciclo independiente
    de Comisiones. No se toca CONTROL 5,1 de Nómina.
  }
  if CargarPeriodoDesdeControl then
  begin
    btnConfirmarComision.Enabled := True;
    BitBtn3Click(Self);

    Label9.Caption :=
      FCantDiasAPagar(DateTimePicker1.Date, DateTimePicker2.Date);
  end
  else
    btnConfirmarComision.Enabled := False;
end;

end.

