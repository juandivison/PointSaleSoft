unit frmTransferenciasBanco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Mask, DBCtrls, RxCtrls, RxDBCtrl, Buttons,
  WinSkinData, Grids, DBGrids;

type
  Tfrmtransferencias = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DataSource1: TDataSource;
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
    SpeedButton3: TSpeedButton;
    SpeedButton1: TSpeedButton;
    DBStatusLabel1: TDBStatusLabel;
    RxDBGrid1: TRxDBGrid;
    SkinData1: TSkinData;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure DBEdit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
  private
    function CheckIfTransExiste: Boolean;
    { Private declarations }
  public
    { Public declarations }
    procedure AbrirDatos(_icodcte : integer);
  end;

var
  frmtransferencias: Tfrmtransferencias;
  numTranfCambio : boolean;
implementation

uses UDatModIngresos, uGlobal;

{$R *.dfm}

procedure Tfrmtransferencias.SpeedButton1Click(Sender: TObject);
begin
  if dmIngresos.tblTransf.State in [dsEdit, dsInsert] then
  begin
    if Showing then
    DBEdit2.SetFocus;
    if numTranfCambio then
    if CheckIfTransExiste then
    begin
      MessageDlg('Número de transferencia ya existe, verifique.',mtError,[mbok],0);
      DBEdit1.SetFocus;
      DBEdit1.SelectAll;
      if dmIngresos.tblTransf.State in [dsEdit, dsInsert] then
      dmIngresos.tblTransf.Cancel;
      exit;
   end;
    GlbSalvarQuery(dmIngresos.tblTransf);
    numTranfCambio:=False;
  end;
end;

procedure Tfrmtransferencias.SpeedButton3Click(Sender: TObject);
begin
  dmIngresos.tblTransf.Edit;
end;

procedure Tfrmtransferencias.AbrirDatos;
begin
  dmIngresos.tblTransf.close;
  dmIngresos.tblTransf.Params[0].Value:= _icodcte;
  dmIngresos.tblTransf.open;
end;

function Tfrmtransferencias.CheckIfTransExiste: Boolean;
begin
  result:=false;
  dmIngresos.tblTransferencias.Close;
  dmIngresos.tblTransferencias.Params[0].Value:= dmIngresos.tblTransfNUMERO_TRANSF.Value;
  dmIngresos.tblTransferencias.Open;
  dmIngresos.tblTransferencias.First;
  if dmIngresos.tblTransferencias.RecordCount = 1 then
  begin
    result:=True;
  end;
end;

procedure Tfrmtransferencias.DBEdit1Change(Sender: TObject);
begin
  numTranfCambio:=True;
end;

procedure Tfrmtransferencias.FormCreate(Sender: TObject);
begin
  numTranfCambio:=False;
end;

procedure Tfrmtransferencias.DBEdit1Exit(Sender: TObject);
begin
  //
end;

end.
