unit UFormTipoDescNomina;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, RXDBCtrl, Mask, DBCtrls,
  db,RXCtrls, WinSkinData;

type
  TfrmTipoDescuentoNomina = class(TForm)
    Label2: TLabel;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton1: TSpeedButton;
    DBStatusLabel1: TDBStatusLabel;
    DBEdit2: TDBEdit;
    RxDBGrid1: TRxDBGrid;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    SkinData1: TSkinData;
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTipoDescuentoNomina: TfrmTipoDescuentoNomina;

implementation

uses UDatModDescuentosNom, uglobal;

{$R *.dfm}

procedure TfrmTipoDescuentoNomina.BitBtn10Click(Sender: TObject);
begin
  dmDescuentosNom.tblTipoDescuento.prior;
end;

procedure TfrmTipoDescuentoNomina.BitBtn11Click(Sender: TObject);
begin
  dmDescuentosNom.tblTipoDescuento.next;
end;

procedure TfrmTipoDescuentoNomina.BitBtn12Click(Sender: TObject);
begin
  dmDescuentosNom.tblTipoDescuento.Last;
end;

procedure TfrmTipoDescuentoNomina.BitBtn9Click(Sender: TObject);
begin
  dmDescuentosNom.tblTipoDescuento.first;
end;

procedure TfrmTipoDescuentoNomina.SpeedButton1Click(Sender: TObject);
begin
  if dmDescuentosNom.tblTipoDescuento.State in [dsinsert, dsEdit] then
  begin
    if dmDescuentosNom.tblTipoDescuento.State in [dsinsert] then
    dmDescuentosNom.tblTipoDescuentoCODIGO.Value:= FsqlMaxNumero('TIPO_DESCUENTO','codigo');
    dmDescuentosNom.tblTipoDescuento.Post;
    dmDescuentosNom.tblTipoDescuento.ApplyUpdates;
    if not dmDescuentosNom.tblTipoDescuento.Transaction.InTransaction then
    dmDescuentosNom.tblTipoDescuento.Transaction.StartTransaction;
    try
      dmDescuentosNom.tblTipoDescuento.Transaction.CommitRetaining;
    except
    dmDescuentosNom.tblTipoDescuento.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmTipoDescuentoNomina.SpeedButton2Click(Sender: TObject);
begin
  if dmDescuentosNom.tblTipoDescuento.State = dsBrowse then
  begin
    dmDescuentosNom.tblTipoDescuento.Insert;
    DBEdit2.SetFocus;
  end;
end;

procedure TfrmTipoDescuentoNomina.SpeedButton3Click(Sender: TObject);
begin
  if dmDescuentosNom.tblTipoDescuento.State in [dsinsert, dsEdit] then
  begin
    dmDescuentosNom.tblTipoDescuento.Cancel;
  end;
end;

procedure TfrmTipoDescuentoNomina.FormCreate(Sender: TObject);
begin
 dmDescuentosNom.tblTipoDescuento.Close;
 dmDescuentosNom.tblTipoDescuento.Open;
end;

end.
