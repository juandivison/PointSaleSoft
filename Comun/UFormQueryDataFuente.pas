unit UFormQueryDataFuente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  inifiles, Dialogs, StdCtrls, Buttons;

type
  TfrmqryDatosFuente = class(TForm)
    Memo1: TMemo;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    BitBtn4: TBitBtn;
    CheckBox1: TCheckBox;
    Label2: TLabel;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
    procedure writeIniFile;
  public
    workFileName : String;
    FSECTION : String;
    FVARIABLE: String;
    FINI_FILE: String;
    procedure LeerIniFile;
  end;

var
  frmqryDatosFuente: TfrmqryDatosFuente;

implementation

{$R *.dfm}

procedure TfrmqryDatosFuente.BitBtn2Click(Sender: TObject);
begin
  SaveDialog1.InitialDir:=ExtractFilePath(Application.ExeName)+'';
  SaveDialog1.Filter := 'Text files (*.txt)|*.txt|All files (*.*)|*.*';
  if Length(workFileName) > 0 then
  begin
    SaveDialog1.FileName:=workFileName;
    if SaveDialog1.Execute then
    begin
      workFileName:= SaveDialog1.FileName;
      memo1.Lines.SaveToFile(workFileName);
    end;
  end else
  begin
    if SaveDialog1.Execute then
    begin
      workFileName:= SaveDialog1.FileName;
      memo1.Lines.SaveToFile(workFileName);
    end;
  end;
  writeIniFile;
end;

procedure TfrmqryDatosFuente.BitBtn1Click(Sender: TObject);
begin
  OpenDialog1.InitialDir:=ExtractFilePath(Application.ExeName);
  OpenDialog1.Filter := 'Text files (*.txt)|*.txt|All files (*.*)|*.*';
  if OpenDialog1.Execute then
  begin
    workFileName:=OpenDialog1.FileName;
    memo1.Lines.LoadFromFile(OpenDialog1.FileName);
  end;
  Label2.Caption:=workFileName;
  writeIniFile;
end;

procedure TfrmqryDatosFuente.BitBtn4Click(Sender: TObject);
begin
  SaveDialog1.InitialDir:=ExtractFilePath(Application.ExeName)+'';
  SaveDialog1.Filter := 'Text files (*.txt)|*.txt|All files (*.*)|*.*';
  if Length(workFileName) > 0 then
  begin
    SaveDialog1.FileName:='';
    if SaveDialog1.Execute then
    begin
      workFileName:= SaveDialog1.FileName;
      Memo1.Lines.SaveToFile(workFileName);
    end;
  end else
  begin
    if SaveDialog1.Execute then
    begin
      workFileName:= SaveDialog1.FileName;
      Memo1.Lines.SaveToFile(workFileName);
    end;
  end;
end;

procedure TfrmqryDatosFuente.LeerIniFile;
var
  IniFile : TIniFile;
  filename : string;
begin
  Label2.Caption:='';
  filename:=ExtractFilePath(Application.ExeName) + FINI_FILE;
  IniFile := TIniFile.Create(filename);
  try
    workFileName := IniFile.ReadString(FSECTION, FVARIABLE, '');

    Label2.Caption:=workFileName;
    //CheckBox1.Checked:=True;
    if FileExists(workFileName) then
    memo1.Lines.LoadFromFile(workFileName);
  finally
  IniFile.Free;
  IniFile:=Nil;
  end;
end;

procedure TfrmqryDatosFuente.writeIniFile;
var
  IniFile : TIniFile;
begin
  if Not CheckBox1.Checked then Exit;
  if (workFileName = '') then
  begin
    if length(label2.Caption) > 0 then
    workFileName:=label2.Caption;
  end;
  if (workFileName = '') then exit;
  
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+FINI_FILE) ;
  try
    IniFile.WriteString(FSECTION,FVARIABLE, workFileName);
  finally
  IniFile.Free;
  IniFile:=Nil;
  end;
end;

end.

