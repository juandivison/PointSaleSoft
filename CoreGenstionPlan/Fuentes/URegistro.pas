unit URegistro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Mask, DBCtrls, IBCustomDataSet, IBTable, StdCtrls, Buttons,
  RXCtrls, RXDBCtrl, WinSkinData;

type
  TfrmTrgtr = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DataSource1: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Button1: TButton;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    tRegistro: TIBTable;
    tRegistroCLAVE: TIntegerField;
    tRegistroSERIAL: TIBStringField;
    tRegistroFECHA_REGISTRO: TDateTimeField;
    tRegistroCANTCABINAS: TSmallintField;
    tRegistroCANTCORRIDA: TIntegerField;
    BitBtn1: TBitBtn;
    DBStatusLabel1: TDBStatusLabel;
    SkinData1: TSkinData;
    tRegistroCODIGO_PC: TIntegerField;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    chkFinanciamiento: TCheckBox;
    tRegistroMOD_FINANC: TSmallintField;
    tRegistroCANT_LICENCIAS: TIntegerField;
    DBEdit6: TDBEdit;
    Label6: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure chkFinanciamientoClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTrgtr: TfrmTrgtr;

implementation

uses uglobal, UDatModCon, UDatModConectar;

{$R *.DFM}

procedure TfrmTrgtr.Button1Click(Sender: TObject);
begin
  if tregistro.state in [dsInsert,dsEdit] then
  tRegistro.Post;
  if not tregistro.Transaction.InTransaction then
  tregistro.Transaction.StartTransaction;
  try
    tregistro.Transaction.CommitRetaining;
  except
  tregistro.Transaction.RollbackRetaining;
  end;
  BitBtn1Click(self);
end;

procedure TfrmTrgtr.FormCreate(Sender: TObject);
var
  usr : string[7];
begin
  usr := Trim(StrUserName);
  if (usr <> 'DIVISON') and (VarUsuarioGlb > 0) then
  begin
    label4.Visible := False;
    dbedit4.Visible:= False;
    dbedit6.Visible:= False;
    if  (tRegistroMOD_FINANC.Value = 1) then
    chkFinanciamiento.Checked:=true
    else chkFinanciamiento.Checked:=False;
  end else
  begin
    label4.Visible := True;
    dbedit4.Visible:= True;
    dbedit6.Visible:= True;
  end;
  BitBtn1Click(self);
end;

procedure TfrmTrgtr.BitBtn1Click(Sender: TObject);
begin
  tRegistro.close;
  tRegistro.Open;
end;

procedure TfrmTrgtr.chkFinanciamientoClick(Sender: TObject);
begin
  if  chkFinanciamiento.Checked then
  begin
    tRegistro.Edit;
    tRegistroMOD_FINANC.Value := 1;
  end else
  begin
    tRegistro.Edit;
    tRegistroMOD_FINANC.Value := 0;  
  end;
end;

procedure TfrmTrgtr.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if tRegistro.State in [dsEdit, dsInsert] then
  begin
    MessageDlg('Transaccion pendiente, verifique',mtInformation, [mbOK], 0);
    CanClose:=False;
  end else
  CanClose:=True;
end;

end.
