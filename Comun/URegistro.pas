unit URegistro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Mask, DBCtrls, IBCustomDataSet, IBTable, StdCtrls, Buttons;

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
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTrgtr: TfrmTrgtr;

implementation

uses uglobal, UDatModConectar;

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
end;

procedure TfrmTrgtr.FormCreate(Sender: TObject);
begin
  if StrUserName <> 'DIVISON' then
  begin
    label4.Visible := False;
    dbedit4.Visible:= False;
  end else
  begin
    label4.Visible := True;
    dbedit4.Visible:= True;
  end;
end;

procedure TfrmTrgtr.BitBtn1Click(Sender: TObject);
begin
  tRegistro.close;
  tRegistro.Open;
end;

end.
