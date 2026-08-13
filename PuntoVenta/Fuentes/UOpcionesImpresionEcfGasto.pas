unit UOpcionesImpresionEcfGasto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, ComCtrls, Printers, IniFiles;

type
  TFormatoImpresionEcfGasto = (
    fiegTicket80,
    fiegCarta
  );

  TAccionImpresionEcfGasto = (
    aiegVistaPrevia,
    aiegImprimir,
    aiegPdf,
    aiegEmail
  );

  TOpcionesEcfGasto = record
    Formato: TFormatoImpresionEcfGasto;
    Accion: TAccionImpresionEcfGasto;
    Impresora: string;
    Copias: Integer;
    ArchivoPdf: string;
    Email: string;
  end;

  TfrmOpcionesImpresionEcfGasto = class(TForm)
    pnlTitulo: TPanel;
    lblTitulo: TLabel;
    lblSubtitulo: TLabel;
    grpFormato: TRadioGroup;
    grpAccion: TRadioGroup;
    grpSalida: TGroupBox;
    lblImpresora: TLabel;
    lblCopias: TLabel;
    lblPdf: TLabel;
    lblEmail: TLabel;
    cmbImpresora: TComboBox;
    edtCopias: TEdit;
    udCopias: TUpDown;
    edtPdf: TEdit;
    btnPdf: TBitBtn;
    edtEmail: TEdit;
    lblAyuda: TLabel;
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    dlgPdf: TSaveDialog;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure grpAccionClick(Sender: TObject);
    procedure btnPdfClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
  private
    FIni: TIniFile;
    procedure ActualizarControles;
    procedure CargarConfiguracion;
    procedure GuardarConfiguracion;
    function RutaIni: string;
  public
    class function Ejecutar(
      AOwner: TComponent;
      ATrn: Integer;
      const AEncf, AEmailDefault: string;
      out AOpciones: TOpcionesEcfGasto): Boolean;
  end;

implementation

{$R *.dfm}

function TfrmOpcionesImpresionEcfGasto.RutaIni: string;
begin
  Result := ChangeFileExt(Application.ExeName, '.ini');
end;

procedure TfrmOpcionesImpresionEcfGasto.FormCreate(Sender: TObject);
begin
  FIni := TIniFile.Create(RutaIni);

  cmbImpresora.Items.Assign(Printer.Printers);

  if Printer.PrinterIndex >= 0 then
    cmbImpresora.ItemIndex := Printer.PrinterIndex;

  udCopias.Min := 1;
  udCopias.Max := 20;
  udCopias.Position := 1;

  CargarConfiguracion;
  ActualizarControles;
end;

procedure TfrmOpcionesImpresionEcfGasto.FormDestroy(Sender: TObject);
begin
  FIni.Free;
end;

procedure TfrmOpcionesImpresionEcfGasto.CargarConfiguracion;
var
  S: string;
  N: Integer;
begin
  N := FIni.ReadInteger(
    'ECF_GASTO_IMPRESION',
    'Formato',
    0);

  if N in [0, 1] then
    grpFormato.ItemIndex := N
  else
    grpFormato.ItemIndex := 0;

  N := FIni.ReadInteger(
    'ECF_GASTO_IMPRESION',
    'Accion',
    0);

  if N in [0, 1, 2, 3] then
    grpAccion.ItemIndex := N
  else
    grpAccion.ItemIndex := 0;

  N := FIni.ReadInteger(
    'ECF_GASTO_IMPRESION',
    'Copias',
    1);

  if N < 1 then N := 1;
  if N > 20 then N := 20;
  udCopias.Position := N;

  S := FIni.ReadString(
    'ECF_GASTO_IMPRESION',
    'Impresora',
    '');

  if (S <> '') and
     (cmbImpresora.Items.IndexOf(S) >= 0) then
    cmbImpresora.ItemIndex :=
      cmbImpresora.Items.IndexOf(S);
end;

procedure TfrmOpcionesImpresionEcfGasto.GuardarConfiguracion;
begin
  FIni.WriteInteger(
    'ECF_GASTO_IMPRESION',
    'Formato',
    grpFormato.ItemIndex);

  FIni.WriteInteger(
    'ECF_GASTO_IMPRESION',
    'Accion',
    grpAccion.ItemIndex);

  FIni.WriteInteger(
    'ECF_GASTO_IMPRESION',
    'Copias',
    udCopias.Position);

  FIni.WriteString(
    'ECF_GASTO_IMPRESION',
    'Impresora',
    cmbImpresora.Text);
end;

procedure TfrmOpcionesImpresionEcfGasto.ActualizarControles;
var
  EsImprimir: Boolean;
  RequierePdf: Boolean;
  EsEmail: Boolean;
begin
  EsImprimir := grpAccion.ItemIndex = 1;
  RequierePdf := grpAccion.ItemIndex in [2, 3];
  EsEmail := grpAccion.ItemIndex = 3;

  lblImpresora.Enabled := EsImprimir;
  cmbImpresora.Enabled := EsImprimir;
  lblCopias.Enabled := EsImprimir;
  edtCopias.Enabled := EsImprimir;
  udCopias.Enabled := EsImprimir;

  lblPdf.Enabled := RequierePdf;
  edtPdf.Enabled := RequierePdf;
  btnPdf.Enabled := RequierePdf;

  lblEmail.Enabled := EsEmail;
  edtEmail.Enabled := EsEmail;

  if EsEmail then
    lblAyuda.Caption :=
      'Se genera primero el PDF y luego se abre el cliente de correo ' +
      'predeterminado con el archivo adjunto.'
  else if RequierePdf then
    lblAyuda.Caption :=
      'El PDF se genera usando el filtro PDF de QuickReport.'
  else
    lblAyuda.Caption :=
      'Seleccione el formato y la accion. El QR se obtiene del timbre aceptado.';
end;

procedure TfrmOpcionesImpresionEcfGasto.grpAccionClick(Sender: TObject);
begin
  ActualizarControles;
end;

procedure TfrmOpcionesImpresionEcfGasto.btnPdfClick(Sender: TObject);
begin
  dlgPdf.FileName := edtPdf.Text;

  if dlgPdf.Execute then
    edtPdf.Text := dlgPdf.FileName;
end;

procedure TfrmOpcionesImpresionEcfGasto.btnAceptarClick(Sender: TObject);
begin
  if grpFormato.ItemIndex < 0 then
  begin
    MessageDlg(
      'Seleccione el formato de impresion.',
      mtInformation,
      [mbOK],
      0);
    Exit;
  end;

  if grpAccion.ItemIndex < 0 then
  begin
    MessageDlg(
      'Seleccione la accion a realizar.',
      mtInformation,
      [mbOK],
      0);
    Exit;
  end;

  if (grpAccion.ItemIndex = 1) and
     (Trim(cmbImpresora.Text) = '') then
  begin
    MessageDlg(
      'Seleccione la impresora.',
      mtInformation,
      [mbOK],
      0);
    Exit;
  end;

  if (grpAccion.ItemIndex in [2, 3]) and
     (Trim(edtPdf.Text) = '') then
  begin
    MessageDlg(
      'Indique la ruta del archivo PDF.',
      mtInformation,
      [mbOK],
      0);
    Exit;
  end;

  if (grpAccion.ItemIndex = 3) and
     (Trim(edtEmail.Text) = '') then
  begin
    MessageDlg(
      'Indique el correo del destinatario.',
      mtInformation,
      [mbOK],
      0);
    Exit;
  end;

  GuardarConfiguracion;
  ModalResult := mrOk;
end;

class function TfrmOpcionesImpresionEcfGasto.Ejecutar(
  AOwner: TComponent;
  ATrn: Integer;
  const AEncf, AEmailDefault: string;
  out AOpciones: TOpcionesEcfGasto): Boolean;
var
  F: TfrmOpcionesImpresionEcfGasto;
  PdfDefault: string;
begin
  AOpciones.Formato := fiegTicket80;
  AOpciones.Accion := aiegVistaPrevia;
  AOpciones.Impresora := '';
  AOpciones.Copias := 1;
  AOpciones.ArchivoPdf := '';
  AOpciones.Email := '';

  Result := False;

  F := TfrmOpcionesImpresionEcfGasto.Create(AOwner);
  try
    PdfDefault :=
      IncludeTrailingPathDelimiter(
        ExtractFilePath(Application.ExeName)) +
      'PDF_ECF_GASTOS\' +
      AEncf +
      '.pdf';

    ForceDirectories(ExtractFilePath(PdfDefault));

    F.edtPdf.Text := PdfDefault;
    F.edtEmail.Text := AEmailDefault;

    if F.ShowModal <> mrOk then
      Exit;

    if F.grpFormato.ItemIndex = 0 then
      AOpciones.Formato := fiegTicket80
    else
      AOpciones.Formato := fiegCarta;

    case F.grpAccion.ItemIndex of
      0: AOpciones.Accion := aiegVistaPrevia;
      1: AOpciones.Accion := aiegImprimir;
      2: AOpciones.Accion := aiegPdf;
      3: AOpciones.Accion := aiegEmail;
    else
      AOpciones.Accion := aiegVistaPrevia;
    end;

    AOpciones.Impresora := F.cmbImpresora.Text;
    AOpciones.Copias := F.udCopias.Position;
    AOpciones.ArchivoPdf := F.edtPdf.Text;
    AOpciones.Email := F.edtEmail.Text;

    Result := True;
  finally
    F.Free;
  end;
end;

end.
