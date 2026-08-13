unit UEcfGastoEmail;

interface

uses
  Windows, SysUtils;

function EnviarPdfEcfGastoPorEmail(
  const AEmail, AAsunto, ACuerpo, AArchivoPdf: string;
  out AMensaje: string): Boolean;

implementation

uses
  Forms, MAPI;

function EnviarPdfEcfGastoPorEmail(
  const AEmail, AAsunto, ACuerpo, AArchivoPdf: string;
  out AMensaje: string): Boolean;
var
  Msg: TMapiMessage;
  Recip: TMapiRecipDesc;
  Attach: TMapiFileDesc;
  EmailAnsi: AnsiString;
  SubjectAnsi: AnsiString;
  BodyAnsi: AnsiString;
  FileAnsi: AnsiString;
  DisplayAnsi: AnsiString;
  Res: Cardinal;
begin
  Result := False;
  AMensaje := '';

  if Trim(AEmail) = '' then
  begin
    AMensaje := 'Debe indicar el correo del destinatario.';
    Exit;
  end;

  if not FileExists(AArchivoPdf) then
  begin
    AMensaje := 'No existe el PDF a adjuntar: ' + AArchivoPdf;
    Exit;
  end;

  FillChar(Msg, SizeOf(Msg), 0);
  FillChar(Recip, SizeOf(Recip), 0);
  FillChar(Attach, SizeOf(Attach), 0);

  EmailAnsi := AnsiString('SMTP:' + Trim(AEmail));
  SubjectAnsi := AnsiString(AAsunto);
  BodyAnsi := AnsiString(ACuerpo);
  FileAnsi := AnsiString(AArchivoPdf);
  DisplayAnsi := AnsiString(ExtractFileName(AArchivoPdf));

  Recip.ulRecipClass := MAPI_TO;
  Recip.lpszAddress := PAnsiChar(EmailAnsi);

  Attach.nPosition := Cardinal(-1);
  Attach.lpszPathName := PAnsiChar(FileAnsi);
  Attach.lpszFileName := PAnsiChar(DisplayAnsi);

  Msg.lpszSubject := PAnsiChar(SubjectAnsi);
  Msg.lpszNoteText := PAnsiChar(BodyAnsi);
  Msg.nRecipCount := 1;
  Msg.lpRecips := @Recip;
  Msg.nFileCount := 1;
  Msg.lpFiles := @Attach;

  Res := MAPISendMail(
    0,
    Application.Handle,
    Msg,
    MAPI_DIALOG or MAPI_LOGON_UI,
    0);

  if Res = SUCCESS_SUCCESS then
  begin
    Result := True;
    Exit;
  end;

  if Res = MAPI_E_USER_ABORT then
    AMensaje := 'El usuario cancelo el envio del correo.'
  else
    AMensaje :=
      'No fue posible abrir/enviar el correo mediante Simple MAPI. Codigo: ' +
      IntToStr(Res);
end;

end.
