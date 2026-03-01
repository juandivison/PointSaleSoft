unit UModoConsumoToCredito;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TfrmModoConsumoToCredito = class(TForm)
    pnlBottom: TPanel;
    btnOK: TButton;
    btnCancel: TButton;
    lblTitulo: TLabel;
    grpFactura: TGroupBox;
    lblTrnCaption: TLabel;
    lblTrnValue: TLabel;
    lblTipoCaption: TLabel;
    lblTipoValue: TLabel;
    lblNcfCaption: TLabel;
    lblNcfValue: TLabel;
    lblFechaCaption: TLabel;
    lblFechaValue: TLabel;
    lblMontoCaption: TLabel;
    lblMontoValue: TLabel;
    grpModo: TGroupBox;
    rgModo: TRadioGroup;
    grpComprador: TGroupBox;
    lblRncCaption: TLabel;
    edtRNC: TEdit;
    lblNombreCaption: TLabel;
    edtNombre: TEdit;
    lblHint: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    procedure ConfigurarModoDesdeGlobal;
  public
    { Ejecuta el diálogo.
      Parámetros de entrada:
        ATrn           -> Número de transacción (TRN) de la factura actual
        ATipoECF       -> Tipo de e-CF actual (ej. 'E32')
        ANcf           -> NCF actual (si existe, puede venir vacío)
        AFecha         -> Fecha de la factura
        AMonto         -> Monto total de la factura
        ARncActual     -> RNC actual del comprador (puede venir vacío)
        ANombreActual  -> Nombre / Razón Social actual del comprador (puede venir vacío)

      Parámetros de salida:
        AModoSeleccionado -> 0 ó 1 (Modo 0 o Modo 1) según radio group (y parámetro global)
        ARNC              -> RNC capturado por el usuario
        ANombre           -> Nombre capturado por el usuario

      Devuelve True si el usuario confirma (Aceptar), False si cancela. }
    function Execute(ATrn: Integer;
      const ATipoECF, ANcf: string;
      AFecha: TDateTime;
      AMonto: Currency;
      const ARncActual, ANombreActual: string;
      out AModoSeleccionado: Integer;
      out ARNC, ANombre: string): Boolean;
  end;

implementation

{$R *.dfm}

uses
  UGlobal; // donde está GlbModoConsumoToCredito (ajusta si es otro unit)

{ TfrmModoConsumoToCredito }

procedure TfrmModoConsumoToCredito.FormCreate(Sender: TObject);
begin
  Caption := 'Conversión de Consumo (E32) a Crédito Fiscal (E31)';
  lblTitulo.Caption :=
    'Configure la conversión de esta factura de consumo a créito fiscal.';

  btnOK.Caption := 'Aceptar';
  btnCancel.Caption := 'Cancelar';
  btnOK.Default := True;
  btnCancel.Cancel := True;

  // Etiquetas estáticas
  lblTrnCaption.Caption   := 'TRN:';
  lblTipoCaption.Caption  := 'Tipo e-CF actual:';
  lblNcfCaption.Caption   := 'NCF actual:';
  lblFechaCaption.Caption := 'Fecha:';
  lblMontoCaption.Caption := 'Monto total:';

  grpModo.Caption      := 'Modo de conversión';
  grpComprador.Caption := 'Datos del comprador (E31)';

  lblRncCaption.Caption    := 'RNC:';
  lblNombreCaption.Caption := 'Nombre / Razón Social:';

  lblHint.Caption :=
    'Modo 0: Convierte esta misma factura E32 en E31.' + sLineBreak +
    'Modo 1: Crea una nueva E31 y una Nota de Crédito E34 que anula la E32.';

  // Configurar modos al crear el formulario
  ConfigurarModoDesdeGlobal;
end;

procedure TfrmModoConsumoToCredito.ConfigurarModoDesdeGlobal;
var
  idx: Integer;
begin
  // Asegurarse de que haya al menos dos ítems (Modo 0 y Modo 1)
  if rgModo.Items.Count < 2 then
  begin
    rgModo.Items.Clear;
    rgModo.Items.Add('Modo 0: Convertir la misma factura E32 en E31 (sin crear nueva venta)');
    rgModo.Items.Add('Modo 1: Crear nueva factura E31 y Nota de Crédito E34 que anula la E32');
  end;

  idx := GlbModoConsumoToCredito;
  if (idx < 0) or (idx > 1) then
    idx := 0;

  rgModo.ItemIndex := idx;

  // Si quieres que el usuario NO pueda cambiar el modo, lo deshabilitamos:
  // rgModo.Enabled := False;
end;

procedure TfrmModoConsumoToCredito.btnOKClick(Sender: TObject);
begin
  if Trim(edtRNC.Text) = '' then
  begin
    MessageDlg('Debe indicar el RNC del comprador.', mtWarning, [mbOK], 0);
    edtRNC.SetFocus;
    Exit;
  end;

  if Trim(edtNombre.Text) = '' then
  begin
    MessageDlg('Debe indicar el nombre o razón social del comprador.', mtWarning, [mbOK], 0);
    edtNombre.SetFocus;
    Exit;
  end;

  if rgModo.ItemIndex < 0 then
  begin
    MessageDlg('No se ha definido el modo de conversión.', mtWarning, [mbOK], 0);
    Exit;
  end;

  ModalResult := mrOk;
end;

procedure TfrmModoConsumoToCredito.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

function TfrmModoConsumoToCredito.Execute(ATrn: Integer;
  const ATipoECF, ANcf: string;
  AFecha: TDateTime;
  AMonto: Currency;
  const ARncActual, ANombreActual: string;
  out AModoSeleccionado: Integer;
  out ARNC, ANombre: string): Boolean;
begin
  Result := False;
  AModoSeleccionado := 0;
  ARNC := '';
  ANombre := '';

  // Inicializar datos de la factura en esta instancia
  lblTrnValue.Caption  := IntToStr(ATrn);
  lblTipoValue.Caption := Trim(ATipoECF);
  lblNcfValue.Caption  := Trim(ANcf);

  if AFecha > 0 then
    lblFechaValue.Caption := DateToStr(AFecha)
  else
    lblFechaValue.Caption := '';

  lblMontoValue.Caption := CurrToStrF(AMonto, ffCurrency, 2);

  // RNC/Nombre iniciales
  edtRNC.Text    := Trim(ARncActual);
  edtNombre.Text := Trim(ANombreActual);

  // Configurar modo según global
  ConfigurarModoDesdeGlobal;

  // Mostrar el formulario y devolver resultados
  if ShowModal = mrOk then
  begin
    AModoSeleccionado := rgModo.ItemIndex;
    ARNC    := Trim(edtRNC.Text);
    ANOMBRE := Trim(edtNombre.Text);
    Result  := True;
  end;
end;

end.

