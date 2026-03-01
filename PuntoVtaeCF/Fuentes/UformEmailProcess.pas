unit UformEmailProcess;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  DB, Dialogs, StdCtrls, Buttons, Grids, DBGrids, RXDBCtrl, Mask, DBCtrls,
  RXCtrls, WinSkinData, RxDBComb, math, Gradiente;

type
  TfrmEmailProcess = class(TForm)
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton1: TSpeedButton;
    DBStatusLabel1: TDBStatusLabel;
    RxDBGrid1: TRxDBGrid;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    SkinData1: TSkinData;
    SpeedButton4: TSpeedButton;
    btnDuplicar: TBitBtn;
    RxDBComboBox1: TRxDBComboBox;
    Gradiente1: TGradiente;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    SpeedButton5: TSpeedButton;
    OpenDialog1: TOpenDialog;
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure btnDuplicarClick(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEmailProcess: TfrmEmailProcess;
  EsDuplicando : Boolean;

implementation

uses UDatmodDatosGenerales, UGlobal;

{$R *.dfm}

procedure TfrmEmailProcess.BitBtn10Click(Sender: TObject);
begin
  dmDatos.tblEmail.prior;
end;

procedure TfrmEmailProcess.BitBtn11Click(Sender: TObject);
begin
  dmDatos.tblEmail.next;
end;

procedure TfrmEmailProcess.BitBtn12Click(Sender: TObject);
begin
  dmDatos.tblEmail.Last;
end;

procedure TfrmEmailProcess.BitBtn9Click(Sender: TObject);
begin
  dmDatos.tblEmail.First;
end;

procedure TfrmEmailProcess.SpeedButton1Click(Sender: TObject);
begin
  if dmDatos.tblEmail.State In [dsInsert, dsEdit] then
  begin
    if dmDatos.tblEmailSUBJECT.IsNull then
    begin
      MessageDlg('Favor indicar password usuario email',mtError,[mbok],0);
      exit;
    end;
    if dmDatos.tblEmailUSER_PASSWORD.IsNull then
    begin
      MessageDlg('Favor indicar password usuario email',mtError,[mbok],0);
      DBEdit5.SetFocus;
      exit;
    end;
    if Not EsDuplicando then
    begin
      if dmDatos.tblEmail.State In [dsInsert] then
      dmDatos.tblEmailUSER_PASSWORD.Value := Encriptar(dmDatos.tblEmailUSER_PASSWORD.Value, 2005);
    end;

    if dmDatos.tblEmail.State In [dsInsert] then
    begin
      dmDatos.tblEmailIDTIPO.Value  := FsqlMaxNumero('EMAILPROCESO','IDTIPO');
      dmDatos.tblEmailFECHAIN.Value := Now;
      dmDatos.tblEmailIN_POR.Value  := StrUserName;
      dmDatos.tblEmailSTATUS.Value  := 'A';
    end else
    if dmDatos.tblEmail.State in [dsEdit] then
    begin
      dmDatos.tblEmailFECHA_UPDATE.Value := Now;
      dmDatos.tblEmailUPD_POR.Value := StrUserName;
    end;
    GlbSalvarQuery(dmDatos.tblEmail);
    EsDuplicando := False;
  end;
end;

procedure TfrmEmailProcess.SpeedButton2Click(Sender: TObject);
begin
  if dmDatos.tblEmail.State = dsBrowse then
  begin
    dmDatos.tblEmail.Append;
    dmDatos.tblEmailFECHAIN.Value := Now;
    dmDatos.tblEmailIN_POR.Value  := StrUserName;
    dmDatos.tblEmailSTATUS.Value  := 'A';
    DBEdit3.SetFocus;
  end;
end;

procedure TfrmEmailProcess.SpeedButton3Click(Sender: TObject);
begin
  if dmDatos.tblEmail.State In [dsInsert, dsEdit] then
  begin
    dmDatos.tblEmail.Cancel;
  end;
end;

procedure TfrmEmailProcess.FormCreate(Sender: TObject);
begin
  dmDatos.tblEmail.Close;
  dmDatos.tblEmail.Open;
end;

procedure TfrmEmailProcess.SpeedButton4Click(Sender: TObject);
var
  spass : string;
begin
  if not dmDatos.tblEmailUSER_PASSWORD.IsNull then
  begin
    spass:= InputBox('Entre password usuario email', 'Entre password', '');
    if (Encriptar(spass,2005) = dmDatos.tblEmailUSER_PASSWORD.Value) then
    dmDatos.tblEmail.Edit
    else
    MessageDlg('Favor indicar password correcto.', mtError, [mbok], 0);
    //dmDatos.tblEmailUSER_PASSWORD.AsVariant:= null;
  end;
end;

procedure TfrmEmailProcess.btnDuplicarClick(Sender: TObject);
var
  x : integer;
begin
  dmdatos.qryEmailProceso.Close;
  dmdatos.qryEmailProceso.Params[0].Value := dmdatos.tblEmailIDTIPO.Value;
  dmdatos.qryEmailProceso.Open;
  if dmDatos.tblEmail.State = dsBrowse then
  begin
    dmDatos.tblEmail.Append;
    for x:=0 to dmDatos.tblEmail.FieldCount -1 do
    dmDatos.tblEmail.FieldByName(dmDatos.tblEmail.Fields[x].FieldName).Value:=
    dmDatos.qryEmailProceso.FieldValues[dmDatos.tblEmail.Fields[x].FieldName];
    dmDatos.tblEmailIDTIPO.AsVariant := Null;
    dmDatos.tblEmailSUBJECT.AsVariant:= Null;
    dmDatos.tblEmailFECHAIN.Value := Now;
    dmDatos.tblEmailIN_POR.Value  := StrUserName;
    dmDatos.tblEmailSTATUS.Value  := 'A';
    EsDuplicando := True;
  end;
end;

procedure TfrmEmailProcess.SpeedButton5Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    dmDatos.tblEmail.Edit;
    dmDatos.tblEmailEXEMAILTOOL.Value:=OpenDialog1.FileName;
    SpeedButton1Click(Self);
  end;
end;

end.
