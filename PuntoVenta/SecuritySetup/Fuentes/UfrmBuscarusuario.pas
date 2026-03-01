unit UfrmBuscarusuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, Grids, DBGrids, RXDBCtrl, Buttons,
  StdCtrls, WinSkinData;

type
  TfrmBuscarusuario = class(TForm)
    RxDBGrid1: TRxDBGrid;
    qryUsuarios: TIBQuery;
    dsqryUsuarios: TDataSource;
    qryUsuariosCODIGO_EMPLEADO: TIntegerField;
    qryUsuariosNOMBRECOMPLETO: TIBStringField;
    qryUsuariosDESCRIPCION: TIBStringField;
    edtNombre: TEdit;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    SkinData1: TSkinData;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RxDBGrid1Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function Buscar(valor : string):Boolean;
  end;

var
  frmBuscarusuario: TfrmBuscarusuario;

implementation

uses UDatModCon;

{$R *.dfm}

procedure TfrmBuscarusuario.SpeedButton1Click(Sender: TObject);
begin
  if not Buscar(edtNombre.Text) then
  begin
    MessageDlg('Nombre no existe', mtInformation, [mbok], 0);
    edtNombre.SetFocus;
  end;
end;

procedure TfrmBuscarusuario.FormCreate(Sender: TObject);
begin
  qryUsuarios.Close;
  qryUsuarios.Open;
end;

function TfrmBuscarusuario.Buscar(valor: string): Boolean;
begin
  if Not qryUsuarios.Locate('NOMBRECOMPLETO', valor, []) then
  result:= False
  else
  begin
    result:= True;
    edtNombre.Text :=qryUsuariosNOMBRECOMPLETO.Value;
  end;
end;

procedure TfrmBuscarusuario.RxDBGrid1Exit(Sender: TObject);
begin
  edtNombre.Text :=qryUsuariosNOMBRECOMPLETO.Value;
end;

end.
