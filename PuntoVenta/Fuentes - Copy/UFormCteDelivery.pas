unit UFormCteDelivery;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  DB, Dialogs, StdCtrls, Mask, DBCtrls, Buttons, RxCtrls, RxDBCtrl, WinSkinData,
  QuickRpt, QRCtrls;

type
  TfrmCteDelivery = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    btnSalvar: TBitBtn;
    BitBtn2: TBitBtn;
    btnCerarAbrirres: TBitBtn;
    edtTelefono: TEdit;
    DBStatusLabel2: TDBStatusLabel;
    SpeedButton1: TSpeedButton;
    SkinData1: TSkinData;
    DBText1: TDBText;
    procedure edtTelefonoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnInsertarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCerarAbrirresClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCteDelivery: TfrmCteDelivery;

implementation

uses UDatModClientes, UGlobal;

{$R *.dfm}

procedure TfrmCteDelivery.edtTelefonoExit(Sender: TObject);
begin
  if (edtTelefono.Text = '') then exit;
  if (Length(edtTelefono.Text) < 10) then Exit;

  dmClientes.tblClientesDelivery.Close;
  dmClientes.tblClientesDelivery.Params[0].Value:= Trim(edtTelefono.Text);
  dmClientes.tblClientesDelivery.Open;

  if not dmClientes.tblClientesDelivery.Locate('TELEFONO',edtTelefono.Text,[]) then
  begin
    dmClientes.tblClientesDelivery.Append;
    dmClientes.tblClientesDeliveryTELEFONO.Value  := edtTelefono.Text;
    dmClientes.tblClientesDeliveryCODIGO.Value    := FsqlMaxNumero('CLIENTES_DELIVERY','CODIGO');
    dmClientes.tblClientesDeliveryFECHA_IN.Value  := Now;
    dmClientes.tblClientesDeliveryINSERT_POR.Value:= Trim(StrUserName);
    DBEdit1.SetFocus; 
  end;
end;

procedure TfrmCteDelivery.FormCreate(Sender: TObject);
begin
  dmClientes.tblClientesDelivery.Close;
  dmClientes.tblClientesDelivery.Params[0].Value:= '-1';
  dmClientes.tblClientesDelivery.Open;
end;

procedure TfrmCteDelivery.btnInsertarClick(Sender: TObject);
begin
  dmClientes.tblClientesDelivery.Append;
end;

procedure TfrmCteDelivery.btnSalvarClick(Sender: TObject);
begin
  if dmClientes.tblClientesDelivery.State in [dsEdit, dsInsert] then
  begin
    GlbSalvarQuery(dmClientes.tblClientesDelivery);
  end;
end;

procedure TfrmCteDelivery.btnCerarAbrirresClick(Sender: TObject);
begin
  dmClientes.tblClientesDelivery.close;
  dmClientes.tblClientesDelivery.open;
end;

procedure TfrmCteDelivery.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if dmClientes.tblClientesDelivery.State in [dsEdit, dsInsert] then
  btnSalvarClick(Self);
end;

end.
