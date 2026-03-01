unit USQLUtilitario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, IBSQL, Grids, DBGrids, RXDBCtrl,
  FileCtrl, StdCtrls, Buttons, WinSkinData;

type
  TfrmSQLUtilitario = class(TForm)
    Memo1: TMemo;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    RxDBGrid1: TRxDBGrid;
    IBSQL1: TIBSQL;
    IBQuery1: TIBQuery;
    DataSource1: TDataSource;
    BitBtn4: TBitBtn;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    BitBtn5: TBitBtn;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    BitBtn6: TBitBtn;
    RadioButton4: TRadioButton;
    SkinData1: TSkinData;
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure EjecutarScript;
    procedure EjecutarScriptLimpiar;
    procedure EjecutarScriptCreaSP;
  end;

var
  frmSQLUtilitario: TfrmSQLUtilitario;

implementation

uses UDatModCon;

{$R *.dfm}

procedure TfrmSQLUtilitario.BitBtn4Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    Memo1.Lines.LoadFromFile(OpenDialog1.FileName);
  end;
end;

procedure TfrmSQLUtilitario.BitBtn5Click(Sender: TObject);
begin
  if Memo1.Lines.Count > 0 then
  begin
    if SaveDialog1.Execute then
    begin
      Memo1.Lines.SaveToFile(SaveDialog1.FileName);
    end;
  end;
end;

procedure TfrmSQLUtilitario.BitBtn1Click(Sender: TObject);
begin
  if Memo1.Lines.Count > 0 then
  begin
    IBQuery1.Close;
    IBQuery1.Sql.Text := Memo1.Text;
    if Not IBQuery1.Prepared then
    IBQuery1.Prepare;
    if RadioButton1.Checked then
    IBQuery1.Open else IBQuery1.ExecSQL;
    if IBQuery1.RowsAffected > 0 then
    if RadioButton2.Checked OR RadioButton3.Checked OR RadioButton4.Checked then
    BitBtn2.Enabled:=True else BitBtn2.Enabled:=False;
  end;
end;

procedure TfrmSQLUtilitario.RadioButton1Click(Sender: TObject);
begin
  Memo1.Enabled:=True;
  Memo1.Color:=clWhite;
  Memo1.Font.Color:=clBlack;
  Memo1.Font.Style:= [fsBold];
end;

procedure TfrmSQLUtilitario.RadioButton2Click(Sender: TObject);
begin
  Memo1.Enabled:=True;
  Memo1.Color:=clBlack;
  Memo1.Font.Color := clLime;
  Memo1.Font.Style:= [fsBold];
end;

procedure TfrmSQLUtilitario.RadioButton3Click(Sender: TObject);
begin
  Memo1.Enabled:=True;
  Memo1.Color:=clBlack;
  Memo1.Font.Color := clWhite;
  Memo1.Font.Style:= [fsBold];
end;

procedure TfrmSQLUtilitario.Memo1Change(Sender: TObject);
begin
  BitBtn1.Enabled:=True;
end;

procedure TfrmSQLUtilitario.BitBtn6Click(Sender: TObject);
begin
  if MessageDlg('Limpiar sentencia sql',mtWarning, [mbyes,mbNo], 0)=mryes then
  begin
    BitBtn1.Enabled:=False;
    Memo1.Lines.Clear;
  end;
end;

procedure TfrmSQLUtilitario.RadioButton4Click(Sender: TObject);
begin
  Memo1.Enabled:=True;
  Memo1.Color:=clBlack;
  Memo1.Font.Color := clLime;
  Memo1.Font.Style:= [fsBold];
  
end;

procedure TfrmSQLUtilitario.BitBtn2Click(Sender: TObject);
begin
  if not ibquery1.Transaction.InTransaction then
  ibquery1.Transaction.StartTransaction;
  try
    ibquery1.Transaction.CommitRetaining;
  except
  ibquery1.Transaction.RollbackRetaining;
  end;
end;

procedure TfrmSQLUtilitario.BitBtn3Click(Sender: TObject);
begin
  if ibquery1.Transaction.InTransaction then
  try
    ibquery1.Transaction.RollbackRetaining;
  except
  end;
end;

procedure TfrmSQLUtilitario.EjecutarScript;
var
  strDirectory : String;
begin
  strDirectory:=ExtractFilePath(Application.ExeName);
  Memo1.Lines.Clear;
  if FileExists(strDirectory + 'ejecutascript.sql') then
  begin
    Memo1.Lines.LoadFromFile(strDirectory + 'ejecutascript.sql');
    BitBtn1.Enabled := True;
    BitBtn1Click(Self);
    if FileExists(strDirectory + 'ejecutascript.txt') then
    DeleteFile(strDirectory + 'ejecutascript.txt');
    RenameFile(strDirectory + 'ejecutascript.sql','ejecutascript.txt');
  end;
  if FileExists(strDirectory + 'ejecutascript1.sql') then
  begin
    Memo1.Lines.LoadFromFile(strDirectory + 'ejecutascript1.sql');
    BitBtn1.Enabled := True;
    BitBtn1Click(Self);
    if FileExists(strDirectory + 'ejecutascript1.txt') then
    DeleteFile(strDirectory + 'ejecutascript1.txt');
    RenameFile(strDirectory + 'ejecutascript1.sql','ejecutascript1.txt');
  end;
    if FileExists(strDirectory + 'ejecutascript2.sql') then
  begin
    Memo1.Lines.LoadFromFile(strDirectory + 'ejecutascript2.sql');
    BitBtn1.Enabled := True;
    BitBtn1Click(Self);
    if FileExists(strDirectory + 'ejecutascript2.txt') then
    DeleteFile(strDirectory + 'ejecutascript2.txt');
    RenameFile(strDirectory + 'ejecutascript2.sql','ejecutascript2.txt');
  end;
end;

procedure TfrmSQLUtilitario.EjecutarScriptLimpiar;
var
  strDirectory : String;
begin
  strDirectory:=ExtractFilePath(Application.ExeName);
  Memo1.Lines.Clear;
  if FileExists(strDirectory + 'scriptLimp.sql') then
  begin
    Memo1.Lines.LoadFromFile(strDirectory + 'scriptLimp.sql');
    BitBtn1.Enabled := True;
    BitBtn1Click(Self);
    if FileExists(strDirectory + 'scriptLimp.txt') then
    DeleteFile(strDirectory + 'scriptLimp.txt');
    RenameFile(strDirectory + 'scriptLimp.sql','scriptLimp.txt');
  end;
end;

procedure TfrmSQLUtilitario.EjecutarScriptCreaSP;
var
  strDirectory : String;
begin
  strDirectory:=ExtractFilePath(Application.ExeName);
  Memo1.Lines.Clear;
  if FileExists(strDirectory + 'CrearSP.sql') then
  begin
    Memo1.Lines.LoadFromFile(strDirectory + 'CrearSP.sql');
    BitBtn1.Enabled := True;
    BitBtn1Click(Self);
    if FileExists(strDirectory + 'CrearSP.txt') then
    DeleteFile(strDirectory + 'CrearSP.txt');
    RenameFile(strDirectory + 'CrearSP.sql','CrearSP.txt');
  end;
end;

end.
