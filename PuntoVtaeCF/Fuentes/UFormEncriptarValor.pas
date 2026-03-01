unit UFormEncriptarValor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmEncrypt = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Label1: TLabel;
    Edit2: TEdit;
    Label2: TLabel;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    function Convertir : string;
  public
    { Public declarations }
  end;

var
  frmEncrypt: TfrmEncrypt;

implementation
    uses uglobal;
{$R *.dfm}

procedure TfrmEncrypt.Button1Click(Sender: TObject);
begin
  edit2.Text := Convertir;
end;

function TfrmEncrypt.Convertir: string;
var
  valor : string;
begin
  result:= Encriptar(Trim(Edit1.Text),2005);
end;

procedure TfrmEncrypt.Button2Click(Sender: TObject);
begin
  edit2.Text := Desencriptar(edit2.Text,2005);
end;

end.
