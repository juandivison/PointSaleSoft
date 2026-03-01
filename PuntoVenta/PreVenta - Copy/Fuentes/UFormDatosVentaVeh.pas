unit UFormDatosVentaVeh;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RXCtrls, RXDBCtrl, StdCtrls, Buttons, Mask, DBCtrls, DB;

type
  TfrmDatosVentaVehiculos = class(TForm)
    DataSource1: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    DBStatusLabel1: TDBStatusLabel;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    NumeroVenta : Integer;
  end;

var
  frmDatosVentaVehiculos: TfrmDatosVentaVehiculos;

implementation

uses UProcVentaRapida;

{$R *.dfm}

procedure TfrmDatosVentaVehiculos.BitBtn2Click(Sender: TObject);
begin
  if frmProcVentaRapida.tblDatosVentaVehiculos.State = dsBrowse then
  frmProcVentaRapida.tblDatosVentaVehiculos.Edit;
end;

procedure TfrmDatosVentaVehiculos.BitBtn3Click(Sender: TObject);
begin
  if frmProcVentaRapida.tblDatosVentaVehiculos.State in [dsEdit, dsInsert] then
  frmProcVentaRapida.tblDatosVentaVehiculos.cancel;
end;

procedure TfrmDatosVentaVehiculos.BitBtn4Click(Sender: TObject);
begin
  if frmProcVentaRapida.tblDatosVentaVehiculos.State in [dsEdit, dsInsert] then
  begin
    if frmProcVentaRapida.tblDatosVentaVehiculos.State = dsInsert then
    begin
      frmProcVentaRapida.tblDatosVentaVehiculosNUM_SERIE.Value:=NumeroVenta;

    end;
    frmProcVentaRapida.tblDatosVentaVehiculos.Post;
    frmProcVentaRapida.tblDatosVentaVehiculos.ApplyUpdates;
    if Not frmProcVentaRapida.tblDatosVentaVehiculos.Transaction.InTransaction then
    frmProcVentaRapida.tblDatosVentaVehiculos.Transaction.StartTransaction;
    try
      frmProcVentaRapida.tblDatosVentaVehiculos.Transaction.CommitRetaining;
    except
    frmProcVentaRapida.tblDatosVentaVehiculos.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmDatosVentaVehiculos.BitBtn5Click(Sender: TObject);
begin
  if frmProcVentaRapida.tblDatosVentaVehiculos.State in [dsInactive, dsBrowse] then
  begin
    frmProcVentaRapida.tblDatosVentaVehiculos.Close;
    frmProcVentaRapida.tblDatosVentaVehiculos.Open;
  end;
end;

end.
