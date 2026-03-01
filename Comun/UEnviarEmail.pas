unit UEnviarEmail;

interface

uses IdHTTP, Classes, SysUtils, IdSMTP, IdMessage, windows;

function ConectarServidorEmail (servidor : string; usuario : string; puerto : integer) : boolean;
function enviarEmail (servidor : string; usuario : string; contrasena : string;
    puerto : integer; asunto : string; mensaje : TStringList; conAutenticacion : boolean;
    emisor : string; nombreEmisor : string; destinatario : string; cc : string) : boolean;

implementation

var
  compEnvioEmail : TIdSMTP;


//Función para conectar con el servidor de email
function ConectarServidorEmail (servidor : string; usuario : string; puerto : integer) : boolean;
begin
  compEnvioEmail := TIdSMTP.Create(nil);
  compEnvioEmail.host := servidor;
  compEnvioEmail.userid := usuario;
  compEnvioEmail.Port := puerto;
  try
    compEnvioEmail.connect;
  except
    compEnvioEmail.Free;
    ConectarServidorEmail := false;
  end;
end;

//enviar email
function enviarEmail (servidor : string; usuario : string; contrasena : string;
    puerto : integer; asunto : string; mensaje : TStringList; conAutenticacion : boolean;
    emisor : string; nombreEmisor : string; destinatario : string; cc : string) : boolean;
var
  compMensaje : TIdMessage;
  textoTemp : string;
  tipoAutenticacion : TAuthenticationType;
  envioCorrecto : boolean;
begin
  if conAutenticacion then
  begin
    compEnvioEmail.AuthenticationType := atLogin;
    compEnvioEmail.UserId := usuario;
    compEnvioEmail.Password := contrasena;
  end
  else
    compEnvioEmail.AuthenticationType := atNone;
  compMensaje := TIdMessage.Create (nil);
  compMensaje.From.Address := emisor;
  compMensaje.From.Name := nombreEmisor;
  compMensaje.Recipients.Add.Address := destinatario;
  compMensaje.CCList.Add.Address := cc;
  compMensaje.Body.AddStrings (mensaje);
  compMensaje.Subject := asunto;
  compMensaje.ReplyTo.Add.Address := emisor;
  envioCorrecto := true;
  try
    compEnvioEmail.Send(compMensaje);
  except
    envioCorrecto := false;
  end;
  compMensaje.Free;
  enviarEmail := envioCorrecto;
end;

end.


