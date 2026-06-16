unit UOrdenDespEmpleados;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  db,StdCtrls, Buttons, Grids, DBGrids, RXDBCtrl, Mask, DBCtrls, Menus,
  RXCtrls, GetAnyDate, RxLookup, ExtCtrls, WinSkinData,
  RxToolEdit;

type
  TfrmOrdEmpleados = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    RxSpeedButton3: TRxSpeedButton;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    SpeedButton1: TSpeedButton;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    RxDBGrid1: TRxDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    DBDateEdit1: TDBDateEdit;
    DBRadioGroup1: TDBRadioGroup;
    DBLookupComboBox3: TDBLookupComboBox;
    RxDBLookupCombo1: TRxDBLookupCombo;
    PopupMenu1: TPopupMenu;
    Orden1: TMenuItem;
    ListadoFirmas1: TMenuItem;
    Fecha: TGetAnyDate;
    SkinData1: TSkinData;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    BitBtn6: TBitBtn;
    RxDBLookupCombo2: TRxDBLookupCombo;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure ListadoFirmas1Click(Sender: TObject);
    procedure Orden1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure DBLookupComboBox2Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOrdEmpleados: TfrmOrdEmpleados;

implementation
uses UDatModNomina,Uglobal, UListFirmOrdEmp, URepOrdenComp,
  UTipoOrdEmpCoop, UDatmodDatosGenerales, UFormProveedores;
{$R *.dfm}

procedure TfrmOrdEmpleados.BitBtn1Click(Sender: TObject);
begin
  if dmDatos.qryOrdenEmp.State in [dsBrowse] then
  begin
    dmDatos.qryOrdenEmp.Insert;
    dmDatos.qryOrdenEmpFECHA.Value:=ExtraerFecha(GlbFechaTrnDiaria);
    dmDatos.qryOrdenEmpCOD_PROVEEDOR.Value := 0;
    dmDatos.qryOrdenEmpSTATUS.Value   := 'A';
    dmDatos.qryOrdenEmpFECHA_IN.Value := Now;
    dmDatos.qryOrdenEmpIN_POR.Value   := StrUserName;
    DBEdit1.SetFocus;
    DBEdit1.SelectAll;
  end;
end;

procedure TfrmOrdEmpleados.FormCreate(Sender: TObject);
begin
  Fecha.FechaCierre:=GlbFechaTrnDiaria;
  if Fecha.Execute then
  begin
    dmDatos.tTipoOrdenEmpCoop.close;
    dmDatos.tTipoOrdenEmpCoop.open;
    dmNomina.qryEmpleados.Close;
    dmNomina.qryEmpleados.Open;
    dmNomina.QryPersonal.close;
    dmNomina.QryPersonal.Filtered:= False;
    dmNomina.statusemp:='A';
    dmNomina.QryPersonal.Filter  :='status = '+chr(39)+'A'+chr(39);
    dmNomina.QryPersonal.Filtered:= True;
    dmNomina.QryPersonal.Open;
    dmdatos.tproveedores.Close;
    dmdatos.tproveedores.open;
    dmDatos.qryOrdenEmp.Close;
    dmDatos.qryOrdenEmp.Params[0].Value := ExtraerFecha(Fecha.Fecha);
    dmDatos.qryOrdenEmp.Params[1].Value := ExtraerFecha(Fecha.Fechafinal);
    dmDatos.qryOrdenEmp.Open;
  end else close;
end;

procedure TfrmOrdEmpleados.BitBtn2Click(Sender: TObject);
begin
  if dmDatos.qryOrdenEmp.State in [dsBrowse] then
  begin
    dmDatos.qryOrdenEmp.Edit;
    dmDatos.qryOrdenEmpFECHA_Mod.Value := Now;
    dmDatos.qryOrdenEmpMod_POR.Value := StrUserName;
  end;
end;

procedure TfrmOrdEmpleados.BitBtn3Click(Sender: TObject);
begin
  if dmDatos.qryOrdenEmp.State In [dsEdit,dsInsert] then
  begin
    if dmDatos.qryOrdenEmp.State In [dsInsert] then
    dmDatos.qryOrdenEmpNUMERO.Value := FsqlMaxNumero('orden_Empleados','Numero');
    dmDatos.qryOrdenEmp.Post;
    dmDatos.qryOrdenEmp.ApplyUpdates;

    if Not dmDatos.qryOrdenEmp.Transaction.InTransaction then
    dmDatos.qryOrdenEmp.Transaction.StartTransaction;
    try
      dmDatos.qryOrdenEmp.Transaction.CommitRetaining;
    except
    dmDatos.qryOrdenEmp.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmOrdEmpleados.BitBtn4Click(Sender: TObject);
begin
  if dmDatos.qryOrdenEmp.State In [dsEdit,dsInsert] then
  dmDatos.qryOrdenEmp.Cancel;
end;

procedure TfrmOrdEmpleados.BitBtn5Click(Sender: TObject);
begin
  if Fecha.Execute then
  begin
    dmDatos.qryOrdenEmp.Close;
    dmDatos.qryOrdenEmp.Params[0].Value := ExtraerFecha(Fecha.Fecha);
    dmDatos.qryOrdenEmp.Params[1].Value := ExtraerFecha(Fecha.Fechafinal);
    dmDatos.qryOrdenEmp.Open;
  end;
end;

procedure TfrmOrdEmpleados.ListadoFirmas1Click(Sender: TObject);
begin
  qckListFirmOrdComp:=TqckListFirmOrdComp.Create(nil);
  try
    qckListFirmOrdComp.Preview;
  finally
  qckListFirmOrdComp.free;
  qckListFirmOrdComp:=nil;
  end;
end;

procedure TfrmOrdEmpleados.Orden1Click(Sender: TObject);
begin
  dmdatos.qryRepOrdCFirm.Close;
  dmdatos.qryRepOrdCFirm.Open;
  qckOrdenComp:=TqckOrdenComp.Create(nil);
  try
    qckOrdenComp.Preview;
  finally
  qckOrdenComp.Free;
  qckOrdenComp:=Nil;
  end;
  if Not dmdatos.qryRepOrdCFirm.Transaction.InTransaction then
  dmdatos.qryRepOrdCFirm.Transaction.StartTransaction;
  try
    dmdatos.qryRepOrdCFirm.Transaction.CommitRetaining;
  except
  dmdatos.qryRepOrdCFirm.Transaction.RollbackRetaining;
  end;
end;

procedure TfrmOrdEmpleados.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmNomina.QryPersonal.close;
  dmNomina.QryPersonal.Filtered:= False;
  dmNomina.statusemp:='';  
  dmdatos.tproveedores.Close;
end;

procedure TfrmOrdEmpleados.SpeedButton1Click(Sender: TObject);
begin
  frmTipoOrdEmpCoop:=TfrmTipoOrdEmpCoop.Create(Nil);
  try
    frmTipoOrdEmpCoop.Showmodal;
  finally
  frmTipoOrdEmpCoop.Free;
  frmTipoOrdEmpCoop:= Nil;
  end;
end;

procedure TfrmOrdEmpleados.BitBtn9Click(Sender: TObject);
begin
  dmDatos.qryOrdenEmp.First;
end;

procedure TfrmOrdEmpleados.BitBtn10Click(Sender: TObject);
begin
  dmDatos.qryOrdenEmp.Prior;
end;

procedure TfrmOrdEmpleados.BitBtn11Click(Sender: TObject);
begin
  dmDatos.qryOrdenEmp.Next;
end;

procedure TfrmOrdEmpleados.BitBtn12Click(Sender: TObject);
begin
  dmDatos.qryOrdenEmp.Last;
end;

procedure TfrmOrdEmpleados.BitBtn6Click(Sender: TObject);
begin
  frmProveedores:=TfrmProveedores.Create(Nil);
  try
    frmProveedores.Showmodal;
  finally
  frmProveedores.Free;
  frmProveedores:=Nil;
  end;
end;

procedure TfrmOrdEmpleados.DBLookupComboBox2Exit(Sender: TObject);
begin
  dmNomina.QryPersonal.Locate('CODIGO',dmDatos.qryOrdenEmpCODIGO.Value,[]);
end;

end.
