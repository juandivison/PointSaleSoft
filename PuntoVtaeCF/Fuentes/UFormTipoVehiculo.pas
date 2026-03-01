unit UFormTipoVehiculo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  db, Dialogs, StdCtrls, Buttons, Grids, DBGrids, RXDBCtrl, Mask, DBCtrls,
  RXCtrls, WinSkinData;

type
  TfrmTipoVehiculo = class(TForm)
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
  frmTipoVehiculo: TfrmTipoVehiculo;

implementation

uses UDatmodDatosGenerales, UGlobal;

{$R *.dfm}

procedure TfrmTipoVehiculo.BitBtn10Click(Sender: TObject);
begin
  dmDatos.tblTipoVehiculo.prior;
end;

procedure TfrmTipoVehiculo.BitBtn11Click(Sender: TObject);
begin
  dmDatos.tblTipoVehiculo.next;
end;

procedure TfrmTipoVehiculo.BitBtn12Click(Sender: TObject);
begin
  dmDatos.tblTipoVehiculo.Last;
end;

procedure TfrmTipoVehiculo.BitBtn9Click(Sender: TObject);
begin
  dmDatos.tblTipoVehiculo.first;
end;

procedure TfrmTipoVehiculo.SpeedButton1Click(Sender: TObject);
begin
  if dmDatos.tblTipoVehiculo.State in [dsinsert, dsEdit] then
  begin
    if dmDatos.tblTipoVehiculo.State in [dsinsert] then
    dmDatos.tblTipoVehiculoIDTIPOVEH.Value:= FsqlMaxNumero('tipo_vehiculo','IDTIPOVEH');
    dmDatos.tblTipoVehiculo.Post;
    dmDatos.tblTipoVehiculo.ApplyUpdates;
    if not dmDatos.tblTipoVehiculo.Transaction.InTransaction then
    dmDatos.tblTipoVehiculo.Transaction.StartTransaction;
    try
      dmDatos.tblTipoVehiculo.Transaction.CommitRetaining;
    except
    dmDatos.tblTipoVehiculo.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmTipoVehiculo.SpeedButton2Click(Sender: TObject);
begin

  if dmDatos.tblTipoVehiculo.State = dsBrowse then
  begin
    dmDatos.tblTipoVehiculo.Insert;
    DBEdit2.SetFocus;
  end;
end;

procedure TfrmTipoVehiculo.SpeedButton3Click(Sender: TObject);
begin
  if dmDatos.tblTipoVehiculo.State in [dsinsert, dsEdit] then
  begin
    dmDatos.tblTipoVehiculo.Cancel;
  end;
end;

procedure TfrmTipoVehiculo.FormCreate(Sender: TObject);
begin
  dmDatos.tblTipoVehiculo.Close;
  dmDatos.tblTipoVehiculo.Open;
end;

end.
