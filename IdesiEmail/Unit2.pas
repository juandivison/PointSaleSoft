unit Unit2;
interface
 Uses Forms,db, SysUtils , windows, Dialogs, Controls,Printers,Classes,
 ShellApi,  DateUtils,StdCtrls, Variants;

var

    _username,_Host,_password,_to, _cc, _bcc : String;
    _attachments : TStringList;
    _body : TStrings;
    _Subject : String;
    _Exeemailtool : string;
    Procedure EnviarEmail();

implementation
    Procedure EnviarEmail();
var
  archivo : String;
  parametros : string;
begin
     _body:=TStringList.Create;
     _attachments:=TStringList.Create;
     //Variables que se envian por parametros
    _username   :='luis-perez';
    _Host       :='@hotmail.com';
    _password   :='******';
    _to         :='******@hotmail.com';
    _cc         :='******@hotmail.com';
    _bcc        :='*****@hotmail.com';
    _Subject    :='prueba';
    _body.CommaText:='Hola';
    _attachments.Add('C:\Users\Jacobo\Desktop\codigo.jpg ');

  parametros:=Format('/u=%s /h=%s /p=%s /t=%s /c=%s /b=%s /s=%s /f=%s /a=%s',[_username,_Host,_password,_to , _cc,_bcc ,_Subject,_body.Text,_attachments.Text]);
  archivo:='C:\Projects\Emails\Emails\bin\Debug\Emails.exe';
  ShellExecute(0, 'Open', PChar(archivo), PChar(parametros), PChar(''), SW_HIDE);

end;
 end.













