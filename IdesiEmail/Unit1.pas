unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,shellapi,Unit2;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
EnviarEmail;
//ShellExecute(hwnd, "open", 'C:\Users\Jacobo\Documents\Visual Studio 2012\Projects\IdesiEmail\IdesiEmail\bin\Debug\IdesiEmail.exe', NULL, NULL, SW_SHOWNORMAL);
//ShellExecute(Handle,NIL,PChar('C:\Users\Jacobo\Documents\Visual Studio 2012\Projects\IdesiEmail\IdesiEmail\bin\Debug\IdesiEmail.exe'),'','',SW_SHOWNORMAL);
end;

end.
