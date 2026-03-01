unit UConfColores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Inifiles, Dialogs, RxCtrls, StdCtrls, RxCombos, ExtCtrls, Gradiente;

type
  Tfrmcolores = class(TForm)
    Gradiente2: TGradiente;
    Panel1: TPanel;
    RxLabel1: TRxLabel;
    RxLabel2: TRxLabel;
    Button1: TButton;
    ColorComboBox1: TColorComboBox;
    ColorComboBox2: TColorComboBox;
    procedure ColorComboBox1Change(Sender: TObject);
    procedure ColorComboBox2Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    Procedure Guardar;
    Procedure Leer;
  public
    { Public declarations }

  end;

var
  frmcolores: Tfrmcolores;

implementation
  Uses UGlobal;
  
{$R *.dfm}

procedure Tfrmcolores.ColorComboBox1Change(Sender: TObject);
begin
  Gradiente2.ColorDesde:= ColorComboBox1.ColorValue;
end;

procedure Tfrmcolores.ColorComboBox2Change(Sender: TObject);
begin
  Gradiente2.ColorHasta:= ColorComboBox2.ColorValue;
end;

procedure Tfrmcolores.Guardar;
var
  Ini: TIniFile;
  NombArchivo : String;
  x: integer;
begin
  NombArchivo := ExtractFilePath(Application.ExeName)+'\'+'repconf_cr.ini';
  Ini := TIniFile.Create(NombArchivo );
  try
    Ini.WriteString('MenuPrincipal','GlbColorUno',ColorToString(ColorComboBox1.ColorValue));
    Ini.WriteString('MenuPrincipal','GlbColorDos',ColorToString(ColorComboBox2.ColorValue));
 finally
  Ini.Free;
  end;
end;

procedure Tfrmcolores.Leer;
var
  Ini: TIniFile;
  NombArchivo : String;
  x: integer;
begin
  NombArchivo := ExtractFilePath(Application.ExeName)+'\'+'repconf_cr.ini';
  Ini := TIniFile.Create(NombArchivo );
  try
    GlbColorUno := Ini.ReadString('MenuPrincipal', 'GlbColorUno', 'clBtnFace');
    GlbColorDos := Ini.ReadString('MenuPrincipal', 'GlbColorDos', 'clBtnFace');

    ColorComboBox1.ColorValue:=StringToColor(GlbColorUno);
    ColorComboBox2.ColorValue:=StringToColor(GlbColorDos);

  finally
  Ini.Free;
  end;
end;

procedure Tfrmcolores.Button1Click(Sender: TObject);
begin
  Guardar;
  Leer;
end;

procedure Tfrmcolores.FormCreate(Sender: TObject);
begin
  Leer;
end;

end.
