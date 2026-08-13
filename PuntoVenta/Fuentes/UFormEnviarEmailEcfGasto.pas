unit UFormEnviarEmailEcfGasto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ShellApi;

type
  TfrmEnviarEmailEcfGasto = class(TForm)
    lblTema: TLabel;
    edtTema: TEdit;
    lblDestinatarios: TLabel;
    edtDestinatario: TEdit;
    lblMensaje: TLabel;
    memMensaje: TMemo;
    lblArchivo: TLabel;
    edtArchivo: TEdit;
    btnVerArchivo: TButton;
    btnEnviar: TBitBtn;
    btnCancelar: TBitBtn;
    lblEstado: TLabel;

    procedure FormCreate(Sender: TObject);
    procedure btnVerArchivoClick(Sender: TObject);
    procedure btnEnviarClick(Sender: TObject);
  private
    FArchivoAdjunto: string;
    FIdTipoEmail: Integer;
    FEmailEnviado: Boolean;

    function ValidarDatos: Boolean;
    function EnviarEmail: Boolean;
  public
    class function Ejecutar(
      AOwner: TComponent;
      const AArchivoAdjunto,
            ADestinatario,
            AAsunto,
            AMensaje: string;
      AIdTipoEmail: Integer;
      out AEmailEnviado: Boolean): Boolean;

    property EmailEnviado: Boolean read FEmailEnviado;
  end;

implementation

uses
  UGlobal,
  UDatmodDatosGenerales,
  UDatModCompania;

{$R *.dfm}

procedure TfrmEnviarEmailEcfGasto.FormCreate(Sender: TObject);
begin
  FArchivoAdjunto := '';
  FIdTipoEmail := 0;
  FEmailEnviado := False;
  lblEstado.Caption := '';
end;

function TfrmEnviarEmailEcfGasto.ValidarDatos: Boolean;
begin
  Result := False;
  lblEstado.Caption := '';

  if Trim(edtDestinatario.Text) = '' then
  begin
    MessageDlg(
      'Indique el correo del destinatario.',
      mtInformation,
      [mbOK],
      0);
    edtDestinatario.SetFocus;
    Exit;
  end;

  if Trim(edtTema.Text) = '' then
  begin
    MessageDlg(
      'Indique el asunto del correo.',
      mtInformation,
      [mbOK],
      0);
    edtTema.SetFocus;
    Exit;
  end;

  if Trim(memMensaje.Text) = '' then
  begin
    MessageDlg(
      'Indique el mensaje del correo.',
      mtInformation,
      [mbOK],
      0);
    memMensaje.SetFocus;
    Exit;
  end;

  if Trim(FArchivoAdjunto) = '' then
  begin
    MessageDlg(
      'No se ha indicado el archivo PDF adjunto.',
      mtError,
      [mbOK],
      0);
    Exit;
  end;

  if not FileExists(FArchivoAdjunto) then
  begin
    MessageDlg(
      'No existe el archivo PDF adjunto:' + #13#10 +
      FArchivoAdjunto,
      mtError,
      [mbOK],
      0);
    Exit;
  end;

  if FIdTipoEmail <= 0 then
  begin
    MessageDlg(
      'No se ha configurado el tipo de email para este proceso.',
      mtError,
      [mbOK],
      0);
    Exit;
  end;

  Result := True;
end;

procedure TfrmEnviarEmailEcfGasto.btnVerArchivoClick(
  Sender: TObject);
begin
  if not FileExists(FArchivoAdjunto) then
  begin
    MessageDlg(
      'No existe el archivo adjunto:' + #13#10 +
      FArchivoAdjunto,
      mtError,
      [mbOK],
      0);
    Exit;
  end;

  ShellExecute(
    Handle,
    'open',
    PChar(FArchivoAdjunto),
    nil,
    nil,
    SW_SHOWNORMAL);
end;

function TfrmEnviarEmailEcfGasto.EnviarEmail: Boolean;
begin
  Result := False;

  Application.ProcessMessages;

  dmdatos.qryEmailProceso.Close;
  dmdatos.qryEmailProceso.Params[0].Value := FIdTipoEmail;
  dmdatos.qryEmailProceso.Open;
  dmdatos.qryEmailProceso.First;

  if dmdatos.qryEmailProceso.RecordCount <> 1 then
  begin
    MessageDlg(
      'Tipo de reporte no configurado para enviar email, verifique.',
      mtError,
      [mbOK],
      0);
    Exit;
  end;

  if dmdatos.qryEmailProcesoSTATUS.Value <> 'A' then
  begin
    MessageDlg(
      'Tipo de reporte no configurado para enviar email, verifique.',
      mtError,
      [mbOK],
      0);
    Exit;
  end;

  GlbEmailToolGSAM :=
    dmdatos.qryEmailProcesoEXEMAILTOOL.Value;

  GlbEnviaEmail := True;
  try
    {
      A diferencia del formulario legacy, aqui el usuario revisa
      exactamente el SUBJECT y BODY que se enviaran.
      No agregamos texto oculto al asunto despues de la revision.
    }
    ProcLogTrackingEmail(
      FIdTipoEmail,
      dmdatos.qryEmailProcesoEMAIL_SERVER.Value,
      dmdatos.qryEmailProcesoPORT.AsString,
      dmdatos.qryEmailProcesoUSER_EMAIL.Value,
      Desencriptar(
        dmdatos.qryEmailProcesoUSER_PASSWORD.Value,
        2005),
      Now,
      Trim(edtDestinatario.Text),
      dmdatos.qryEmailProcesoFROMEMAIL.Value,
      Trim(edtTema.Text),
      memMensaje.Text,
      VarUsuarioGlb,
      'A',
      '',
      Now,
      strusername,
      FormatDateTime(
        'dd/mm/yyyy hh:mm a/p',
        Now),
      strusername,
      FArchivoAdjunto,
      dmCompania.tblCompaniaEMAIL.Value,
      dmCompania.tblCompaniaNOMBRE.Value
    );

    Result := True;
  finally
    GlbEnviaEmail := False;
  end;
end;

procedure TfrmEnviarEmailEcfGasto.btnEnviarClick(
  Sender: TObject);
begin
  if not ValidarDatos then
    Exit;

  lblEstado.Caption := 'Procesando envio...';
  Application.ProcessMessages;

  if not EnviarEmail then
  begin
    lblEstado.Caption := 'No fue posible preparar el envio.';
    Exit;
  end;

  FEmailEnviado := True;
  lblEstado.Caption := 'Email procesado correctamente.';

  MessageDlg(
    'El email fue procesado correctamente.',
    mtInformation,
    [mbOK],
    0);

  ModalResult := mrOk;
end;

class function TfrmEnviarEmailEcfGasto.Ejecutar(
  AOwner: TComponent;
  const AArchivoAdjunto,
        ADestinatario,
        AAsunto,
        AMensaje: string;
  AIdTipoEmail: Integer;
  out AEmailEnviado: Boolean): Boolean;
var
  F: TfrmEnviarEmailEcfGasto;
begin
  Result := False;
  AEmailEnviado := False;

  F := TfrmEnviarEmailEcfGasto.Create(AOwner);
  try
    F.FArchivoAdjunto := Trim(AArchivoAdjunto);
    F.FIdTipoEmail := AIdTipoEmail;

    F.edtArchivo.Text := F.FArchivoAdjunto;
    F.edtDestinatario.Text := Trim(ADestinatario);
    F.edtTema.Text := AAsunto;
    F.memMensaje.Text := AMensaje;

    Result := F.ShowModal = mrOk;
    AEmailEnviado := F.FEmailEnviado;
  finally
    F.Free;
  end;
end;

end.
