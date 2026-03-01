unit UConfMiscelaneas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  FileCtrl, Inifiles, Dialogs, StdCtrls, Buttons, ExtCtrls, WinSkinData;

type
  TfrmConfMiscelaneas = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    CheckBox2: TCheckBox;
    BitBtn3: TBitBtn;
    OpenDialog1: TOpenDialog;
    Label2: TLabel;
    edtStringValue: TEdit;
    chkGarita: TCheckBox;
    SkinData1: TSkinData;
    Button1: TButton;
    edtNumReciboAntesSecCM2: TEdit;
    Label1: TLabel;
    edtDiasAtrasos: TEdit;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Procedure ProcesaGuardarDatos;
    procedure DatosConfiguracion;
  end;

var
  frmConfMiscelaneas: TfrmConfMiscelaneas;
  iniName : string;

  implementation
  uses UGlobal;

{$R *.dfm}

{ TfrmConfMiscelaneas }

procedure TfrmConfMiscelaneas.DatosConfiguracion;
var
  Ini: TIniFile;
  NombArchivo : String;
begin
  NombArchivo := ExtractFilePath(Application.ExeName)+'\'+iniName;
  Ini := TIniFile.Create(NombArchivo);
  try
    //GLBRecalculaCFija := Ini.ReadInteger('Cobro', 'GLBRecalculaCFija', 0);

    edtStringValue.Text := Ini.ReadString('DbConeccion','edtStringValue','JVecino');
    GLBDBStringValue    := edtStringValue.Text;
    glbG0000001         := Ini.ReadInteger('Parametros', 'G0000001', 0);
    //FRutaCopiarRecibos  := Ini.ReadString('Documentos', 'RutaCopiarRecibos', '');
    //GlbLogRecibos := Ini.ReadInteger('Documentos', 'LogRecibos', 0);
    edtNumReciboAntesSecCM2.Text := Ini.ReadString('Parametros', 'GlbUltNumRecAntSecCM2', '');
    //GlbUltNumRecAntSecCM2:= edtNumReciboAntesSecCM2.Text;
    edtDiasAtrasos.Text  := Ini.ReadString('Parametros', 'GlbDiasAtraso', '');
    if (edtDiasAtrasos.Text <> '') then
    GlbDiasAtraso  := StrToInt(edtDiasAtrasos.Text);

    if (glbG0000001 = 1) then
    chkGarita.Checked := True
    else
    chkGarita.Checked := False;
  finally
  Ini.Free;
  end;
end;

procedure TfrmConfMiscelaneas.ProcesaGuardarDatos;
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(ExtractFilePath(Application.ExeName)+'\'+iniName);
  try
    Ini.WriteString('DbConeccion', 'edtStringValue', edtStringValue.Text);
    if chkGarita.Checked then
    Ini.WriteInteger('Parametros', 'G0000001', 1)
    else
    Ini.WriteInteger('Parametros', 'G0000001', 0);
    Ini.WriteString('Parametros', 'GlbUltNumRecAntSecCM2', edtNumReciboAntesSecCM2.Text);
    Ini.WriteString('Parametros', 'GlbDiasAtraso', edtDiasAtrasos.Text);

    //Ini.WriteInteger('Cobro','GlbUsaInteresAnual',GlbUsaInteresAnual);
  finally
  Ini.Free;
  end;
end;

procedure TfrmConfMiscelaneas.FormCreate(Sender: TObject);
begin
  iniName:= 'repconf001.ini';
  DatosConfiguracion;
end;

procedure TfrmConfMiscelaneas.BitBtn1Click(Sender: TObject);
begin
  iniName:= 'repconf001.ini';
  ProcesaGuardarDatos;

  if CheckBox2.Checked then
  begin
    iniName:= InputBox('Guardar como adicional','Entre nombre cliente, 8 caracteres sin espacio','');
    if Length(iniName) > 0 then
    begin
      iniName:=iniName + '.dat';
      ProcesaGuardarDatos;
    end else
    begin
      MessageDlg('Configuración adicional no será guardada.',mtWarning,[mbok],0);
    end;
  end;
  iniName:= 'repconf001.ini';
end;

procedure TfrmConfMiscelaneas.FormClick(Sender: TObject);
begin
  BitBtn1Click(Self);
end;

procedure TfrmConfMiscelaneas.BitBtn3Click(Sender: TObject);
var
  fname : TOpenDialog;
begin
  fname:= TOpenDialog.Create(Nil);
  fname.DefaultExt:='*.dat';
  fname.Filter:='Configuración Test|*.dat|Configuración Producción|*repcon*.ini';
  fname.InitialDir:=ExtractFilePath(Application.ExeName);
  if fname.Execute then
  begin
    iniName:=fname.FileName+'.dat';
    DatosConfiguracion;
  end;
  fname.Free;
  fname:=Nil;
end;

procedure TfrmConfMiscelaneas.Button1Click(Sender: TObject);
begin
  try
    //SyncUpdateTransacciones;
  except
  end;
end;

end.
