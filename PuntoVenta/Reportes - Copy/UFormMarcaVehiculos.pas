unit UFormMarcaVehiculos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, RXDBCtrl, Mask, DBCtrls,
  db,RXCtrls, WinSkinData;

type
  TfrmMarcaVehiculos = class(TForm)
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
  frmMarcaVehiculos: TfrmMarcaVehiculos;

implementation
  uses UDatmodDatosGenerales, UGlobal;

{$R *.dfm}

procedure TfrmMarcaVehiculos.BitBtn10Click(Sender: TObject);
begin
  dmdatos.tblMarcaVehiculo.prior;
end;

procedure TfrmMarcaVehiculos.BitBtn11Click(Sender: TObject);
begin
  dmdatos.tblMarcaVehiculo.next;
end;

procedure TfrmMarcaVehiculos.BitBtn12Click(Sender: TObject);
begin
  dmdatos.tblMarcaVehiculo.Last;
end;

procedure TfrmMarcaVehiculos.BitBtn9Click(Sender: TObject);
begin
  dmdatos.tblMarcaVehiculo.First;
end;

procedure TfrmMarcaVehiculos.SpeedButton1Click(Sender: TObject);
begin
  if dmdatos.tblMarcaVehiculo.State in [dsinsert, dsEdit] then
  begin
    if dmdatos.tblMarcaVehiculo.State in [dsinsert] then
    dmdatos.tblMarcaVehiculoIDMARCA.Value:= FsqlMaxNumero('marca_vehiculo','idmarca');
    dmdatos.tblMarcaVehiculo.Post;
    dmdatos.tblMarcaVehiculo.ApplyUpdates;
    if not dmdatos.tblMarcaVehiculo.Transaction.InTransaction then
    dmdatos.tblMarcaVehiculo.Transaction.StartTransaction;
    try
      dmdatos.tblMarcaVehiculo.Transaction.CommitRetaining;
    except
    dmdatos.tblMarcaVehiculo.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmMarcaVehiculos.SpeedButton2Click(Sender: TObject);
begin
  if dmdatos.tblMarcaVehiculo.State = dsBrowse then
  begin
    dmdatos.tblMarcaVehiculo.Insert;
    DBEdit2.SetFocus;
  end;
end;

procedure TfrmMarcaVehiculos.SpeedButton3Click(Sender: TObject);
begin
  if dmdatos.tblMarcaVehiculo.State in [dsinsert, dsEdit] then
  begin
    dmdatos.tblMarcaVehiculo.Cancel;
  end;
end;

procedure TfrmMarcaVehiculos.FormCreate(Sender: TObject);
begin
  dmDatos.tblMarcaVehiculo.Close;
  dmDatos.tblMarcaVehiculo.Open;
end;

end.
