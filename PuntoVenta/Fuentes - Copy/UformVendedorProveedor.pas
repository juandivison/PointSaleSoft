unit UformVendedorProveedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  db, Dialogs, StdCtrls, Buttons, Grids, DBGrids, RXDBCtrl, Mask, DBCtrls,
  RXCtrls, RxLookup, WinSkinData;

type
  TfrmVendedorProveedor = class(TForm)
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
    SkinData1: TSkinData;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label7: TLabel;
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVendedorProveedor: TfrmVendedorProveedor;

implementation

uses UDatModRegOpeDiaria, uglobal;

{$R *.dfm}

procedure TfrmVendedorProveedor.BitBtn10Click(Sender: TObject);
begin
  dtmTransOpeDiaria.tblVendedorProveedor.prior;
end;

procedure TfrmVendedorProveedor.BitBtn11Click(Sender: TObject);
begin
  dtmTransOpeDiaria.tblVendedorProveedor.next;
end;

procedure TfrmVendedorProveedor.BitBtn12Click(Sender: TObject);
begin
  dtmTransOpeDiaria.tblVendedorProveedor.Last;
end;

procedure TfrmVendedorProveedor.BitBtn9Click(Sender: TObject);
begin
  dtmTransOpeDiaria.tblVendedorProveedor.first;
end;

procedure TfrmVendedorProveedor.SpeedButton1Click(Sender: TObject);
begin
  if dtmTransOpeDiaria.tblVendedorProveedor.State in [dsinsert, dsEdit] then
  begin
    if dtmTransOpeDiaria.tblVendedorProveedor.State in [dsinsert] then
    dtmTransOpeDiaria.tblVendedorProveedoridvendedor.Value:= FsqlMaxNumero('vendedor_proveedor','IDVENDEDOR');
    if dtmTransOpeDiaria.tblVendedorProveedoridvendedor.Value = 0 then
    dtmTransOpeDiaria.tblVendedorProveedoridvendedor.Value:= 1;
    GlbSalvarQuery(dtmTransOpeDiaria.tblVendedorProveedor);
  end;
end;

procedure TfrmVendedorProveedor.SpeedButton2Click(Sender: TObject);
begin
  if dtmTransOpeDiaria.tblVendedorProveedor.State = dsBrowse then
  begin
    dtmTransOpeDiaria.tblVendedorProveedor.Insert;
    DBEdit2.SetFocus;
  end;
end;

procedure TfrmVendedorProveedor.SpeedButton3Click(Sender: TObject);
begin
  if dtmTransOpeDiaria.tblVendedorProveedor.State in [dsinsert, dsEdit] then
  begin
    dtmTransOpeDiaria.tblVendedorProveedor.Cancel;
  end;
end;

end.
