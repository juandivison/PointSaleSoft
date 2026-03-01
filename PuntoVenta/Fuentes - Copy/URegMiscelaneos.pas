unit URegMiscelaneos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  IniFiles, Dialogs, StdCtrls, Buttons, WinSkinData;

type
  TfrmConfVarios = class(TForm)
    btnGuardar: TBitBtn;
    edtClaveMaestra: TEdit;
    Label1: TLabel;
    BitBtn2: TBitBtn;
    SkinData1: TSkinData;
    procedure btnGuardarClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfVarios: TfrmConfVarios;

implementation
uses Uglobal;

{$R *.dfm}

procedure TfrmConfVarios.btnGuardarClick(Sender: TObject);
var
  Ini: TIniFile;
begin
  if edtClaveMaestra.Text='' then
  begin
    edtClaveMaestra.SetFocus;
    exit;
  end;
  Ini := TIniFile.Create( ChangeFileExt( Application.ExeName, '.INI' ) );
  try
    GlbClaveSup:= Encriptar(edtClaveMaestra.Text,2005);
    Ini.WriteString( 'Clave', 'Maestra',GlbClaveSup);
  finally
    Ini.Free;
  end;
  close;
end;

procedure TfrmConfVarios.BitBtn2Click(Sender: TObject);
begin
  close;
end;

end.
