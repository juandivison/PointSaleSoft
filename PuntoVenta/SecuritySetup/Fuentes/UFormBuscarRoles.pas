unit UFormBuscarRoles;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, StdCtrls, Buttons, Grids, DBGrids,
  RXDBCtrl, WinSkinData;

type
  TfrmBuscarRol = class(TForm)
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    RxDBGrid1: TRxDBGrid;
    edtNombre: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    qryRoles: TIBQuery;
    dsqryRoles: TDataSource;
    qryRolesUSERID: TIntegerField;
    qryRolesDESCRIPCION: TIBStringField;
    SkinData1: TSkinData;
    procedure RxDBGrid1Exit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function Buscar(valor : string):Boolean;
  end;

var
  frmBuscarRol: TfrmBuscarRol;

implementation

uses UDatModCon;

{$R *.dfm}

function TfrmBuscarRol.Buscar(valor: string): Boolean;
begin
  if Not qryRoles.Locate('descripcion', Trim(valor), []) then
  result:= False
  else
  begin
    result:= True;
    edtNombre.Text :=qryRolesDESCRIPCION.Value;
  end;
end;

procedure TfrmBuscarRol.RxDBGrid1Exit(Sender: TObject);
begin
  edtNombre.Text :=qryRolesDESCRIPCION.Value;
end;

procedure TfrmBuscarRol.SpeedButton1Click(Sender: TObject);
begin
  if not Buscar(edtNombre.Text) then
  begin
    MessageDlg('Rol no existe', mtInformation, [mbok], 0);
    edtNombre.SetFocus;
  end;
end;

procedure TfrmBuscarRol.FormCreate(Sender: TObject);
begin
  qryRoles.Close;
  qryRoles.Open;
end;

end.
