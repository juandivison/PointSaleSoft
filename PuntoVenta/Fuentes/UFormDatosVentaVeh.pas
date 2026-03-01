unit UFormDatosVentaVeh;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RXCtrls, RXDBCtrl, StdCtrls, Buttons, Mask, DBCtrls, DB,
  IBCustomDataSet, WinSkinData;

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
    Label1: TLabel;
    DBEdit1: TDBEdit;
    SpeedButton1: TSpeedButton;
    tblMotores: TIBDataSet;
    tblMotoresNUMERO: TIntegerField;
    tblMotoresTIPO: TSmallintField;
    tblMotoresFECHA_INGRESO: TDateTimeField;
    tblMotoresYEAR_FAB: TIntegerField;
    tblMotoresCHASIS: TIBStringField;
    tblMotoresCOLOR: TIBStringField;
    tblMotoresMODELO: TIBStringField;
    tblMotoresMATRICULA: TIBStringField;
    tblMotoresPLACA: TIBStringField;
    tblMotoresSTATUS: TIBStringField;
    tblMotoresCOD_USUARIO: TIntegerField;
    tblMotoresFECHA_IN: TDateTimeField;
    tblMotoresIN_POR: TIBStringField;
    tblMotoresFECHA_UPD: TDateTimeField;
    tblMotoresUPD_POR: TIBStringField;
    tblMotoresMAQUINA: TIBStringField;
    BitBtn2: TBitBtn;
    SkinData1: TSkinData;
    tblMotoresNOMBRECLIENTE: TIBStringField;
    tblMotoresFECHA_ASIGNADO: TDateTimeField;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    NumeroVenta : Integer;
  end;

var
  frmDatosVentaVehiculos: TfrmDatosVentaVehiculos;

implementation

uses UProcVentaRapida, UFichaVeh, UDatModVehiculo, UDatModConectar,
  UFormBuscarMotor, UGlobal;

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
  if frmProcVentaRapida.tblDatosVentaVehiculos.State in [dsInsert] then
  begin
    dmVehiculo.qryVerificaVeh.Close;
    dmVehiculo.qryVerificaVeh.Params[0].Value:=dmVehiculo.tblVehiculoreferencia.Value;
    dmVehiculo.qryVerificaVeh.Open;
    dmVehiculo.qryVerificaVeh.First;
    if dmVehiculo.qryVerificaVeh.RecordCount > 0 then
    begin
      MessageDlg('Vehículo/Motor ya esta asignado en otra venta, verifique', mtinformation,[mbok],0);
      exit;
    end
  end;
  if frmProcVentaRapida.tblDatosVentaVehiculos.State in [dsEdit, dsInsert] then
  begin
    if frmProcVentaRapida.tblDatosVentaVehiculosCHASSIS.IsNull or
       (frmProcVentaRapida.tblDatosVentaVehiculosCHASSIS.Value = '') then
    exit;

    if frmProcVentaRapida.tblDatosVentaVehiculos.State = dsInsert then
    begin
      frmProcVentaRapida.qryDatosVh.close;
      frmProcVentaRapida.qryDatosVh.params[0].value:=
      frmProcVentaRapida.tblDatosVentaVehiculosCHASSIS.Value;
      frmProcVentaRapida.qryDatosVh.open;
      frmProcVentaRapida.qryDatosVh.first;
      if frmProcVentaRapida.qryDatosVh.RecordCount = 0 then
      begin
        MessageDlg('Chassis no encontrado verifique.',mtinformation,[mbok],0);
        DBEdit1.SetFocus;
        exit;
      end;
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

procedure TfrmDatosVentaVehiculos.DBEdit1Exit(Sender: TObject);
begin
  if frmProcVentaRapida.tblDatosVentaVehiculos.State = dsInsert then
 begin
   frmProcVentaRapida.qryDatosVh.close;
   frmProcVentaRapida.qryDatosVh.params[0].value:=
   frmProcVentaRapida.tblDatosVentaVehiculosCHASSIS.Value;
   frmProcVentaRapida.qryDatosVh.open;
   frmProcVentaRapida.qryDatosVh.first;
   if frmProcVentaRapida.qryDatosVh.RecordCount = 0 then
   begin
     MessageDlg('Chassis no encontrado verifique.',mtinformation,[mbok],0);
     DBEdit1.SetFocus;
     exit;
   end else
   begin
     frmProcVentaRapida.tblDatosVentaVehiculosMODELO.Value :=
     frmProcVentaRapida.qryDatosVhMODELO.Value;
     frmProcVentaRapida.tblDatosVentaVehiculosPLACA.Value:=
     frmProcVentaRapida.qryDatosVhPLACA.Value;
     frmProcVentaRapida.tblDatosVentaVehiculosMARCA.Value:=
     frmProcVentaRapida.qryDatosVhMARCA_VEHICULO.Value;
   end;
 end;
end;

procedure TfrmDatosVentaVehiculos.SpeedButton1Click(Sender: TObject);
begin
  FrmFichasVeh:=TFrmFichasVeh.Create(nil);
  try
    FrmFichasVeh.Showmodal;
  finally
  FrmFichasVeh.free;
  FrmFichasVeh:=nil;
  end;
end;

procedure TfrmDatosVentaVehiculos.FormCreate(Sender: TObject);
begin
  dmVehiculo.tblVehiculo.Close;
  dmVehiculo.tblVehiculo.Open;
end;

procedure TfrmDatosVentaVehiculos.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if  frmProcVentaRapida.tblDatosVentaVehiculos.state in [dsEdit, dsInsert] then
  begin
    MessageDlg('Tienes una transacción pendiente, verifique.',mtWarning,[mbok],0);
    CanClose:=false;
  end else CanClose:=true;
end;

end.
