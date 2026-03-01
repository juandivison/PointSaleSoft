unit UFormPolizaMaster;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GetAnyDate, DB, WinSkinData, StdCtrls, Buttons, Grids, DBGrids,
  RXDBCtrl, rxToolEdit, RxLookup, Mask, DBCtrls, RXCtrls, ExtCtrls, ComCtrls,
  Menus;

type
  TfrmPolizas = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton1: TSpeedButton;
    Label2: TLabel;
    Label3: TLabel;
    DBStatusLabel1: TDBStatusLabel;
    DBStatusLabel2: TDBStatusLabel;
    Label5: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Shape1: TShape;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    DBDateEdit1: TDBDateEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    RxDBGrid2: TRxDBGrid;
    BitBtn8: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    BitBtn13: TBitBtn;
    DBEdit2: TDBEdit;
    BitBtn9: TBitBtn;
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBDateEdit2: TDBDateEdit;
    DBDateEdit3: TDBDateEdit;
    RxDBLookupCombo2: TRxDBLookupCombo;
    RxDBLookupCombo3: TRxDBLookupCombo;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    RxDBLookupCombo4: TRxDBLookupCombo;
    GetAnyDate1: TGetAnyDate;
    dsClientes: TDataSource;
    RxDBGrid1: TRxDBGrid;
    BitBtn4: TBitBtn;
    SkinData1: TSkinData;
    RxSpeedButton5: TRxSpeedButton;
    PopupMenu1: TPopupMenu;
    MarcaVeh1: TMenuItem;
    ipoVeh1: TMenuItem;
    Proveedores1: TMenuItem;
    Clientes1: TMenuItem;
    Label17: TLabel;
    DBEdit10: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    DBRadioGroup2: TDBRadioGroup;
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn1Click2(Sender: TObject);
    procedure BitBtn2Click2(Sender: TObject);
    procedure BitBtn3Click2(Sender: TObject);
    procedure BitBtn5Click2(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure SpeedButton1Click2(Sender: TObject);
    procedure SpeedButton2Click2(Sender: TObject);
    procedure SpeedButton3Click2(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure MarcaVeh1Click(Sender: TObject);
    procedure ipoVeh1Click(Sender: TObject);
    procedure Proveedores1Click(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPolizas: TfrmPolizas;

implementation
  uses UDatmodDatosGenerales, UDatModReportes, Uglobal, UDatModProveedor,
  UMarbetePolizaSsegPepin, UDatModClientes, UFormMarcaVehiculos,
  UFormTipoVehiculo, UFormProveedores, UMaestroClientes;
{$R *.dfm}

procedure TfrmPolizas.BitBtn10Click(Sender: TObject);
begin
  dmDatos.tblPolizaMaster.First;
end;

procedure TfrmPolizas.BitBtn11Click(Sender: TObject);
begin
  dmDatos.tblPolizaMaster.Prior;
end;

procedure TfrmPolizas.BitBtn12Click(Sender: TObject);
begin
  dmDatos.tblPolizaMaster.Next;
end;

procedure TfrmPolizas.BitBtn13Click(Sender: TObject);
begin
  dmDatos.tblPolizaMaster.Last;
end;

procedure TfrmPolizas.BitBtn1Click2(Sender: TObject);
begin
  SpeedButton1Click2(self);
  if dmdatos.tblPolizaMasterNUMERO.IsNull then exit;
  if dmDatos.tblPolizaDet.State = dsBrowse then
  begin
    dmDatos.tblPolizaDet.Insert;
    BitBtn1.Enabled:=False;
    dmDatos.tblPolizaDetNUMERO.Value:= dmdatos.tblPolizaMasterNUMERO.Value;
    dmDatos.tblPolizaDetNO_VEHICULO.Value := 1;
    dmDatos.tblPolizaDetIN_POR.Value := strusername;
    dmDatos.tblPolizaDetFECHA_IN.Value := now;
    dmDatos.tblPolizaDetSTATUS.Value := 'A';
    dmDatos.tblPolizaDetINICIOVIGENCIA.Value:= ExtraerFecha(dmDatos.tblPolizaMasterFECHA.Value) + ExtraerHora(now);
    dmDatos.tblPolizaDetFINVIGENCIA.Value:= dmDatos.tblPolizaMasterFECHA.Value + 365;
    dmDatos.tblPolizaDetFINVIGENCIA.Value:=ExtraerFecha(dmDatos.tblPolizaDetFINVIGENCIA.Value)+ExtraerHora(StrToTime('12:00 PM'));
    DBDateEdit2.SetFocus; 
  end;
end;

procedure TfrmPolizas.BitBtn2Click2(Sender: TObject);
begin
  if dmDatos.tblPolizaDet.State = dsBrowse then
  begin
    dmDatos.tblPolizaDet.Edit;
    BitBtn1.Enabled:=False;
  end;
end;

procedure TfrmPolizas.BitBtn3Click2(Sender: TObject);
begin
  if dmDatos.tblPolizaDet.State in [dsEdit, dsInsert] then
  begin
    dmDatos.tblPolizaDet.cancel;
    BitBtn1.Enabled:=True;
  end;
end;

procedure TfrmPolizas.BitBtn5Click2(Sender: TObject);
begin
  if dmDatos.tblPolizaDet.State in [dsInactive, dsBrowse] then
  begin
    dmDatos.tblPolizaDet.Close;
    dmDatos.tblPolizaDet.Open;
  end;
end;

procedure TfrmPolizas.BitBtn8Click(Sender: TObject);
begin
  if   dmDatos.tblPolizaMaster.State in [dsInactive, dsBrowse] then
  begin
  if GetAnyDate1.Execute then
  begin
    dmDatos.tblPolizaMaster.Close;
    dmDatos.tblPolizaMaster.Params[0].Value:= ExtraerFecha(GetAnyDate1.Fecha);
    dmDatos.tblPolizaMaster.Params[1].Value:= ExtraerFecha(GetAnyDate1.FechaFinal);
    dmDatos.tblPolizaMaster.Open;
  end;
  end;
end;

procedure TfrmPolizas.BitBtn9Click(Sender: TObject);
var
  sqlT : String;
begin
  if dmDatos.tblPolizaMaster.State In [dsInsert, dsEdit] then
  begin
    MessageDlg('Debe guardar transaccion en progreso antes de imprimir.', mtinformation, [mbYes, mbNo],0);
    Exit;
  end;
  if dmDatos.tblPolizaDet.State In [dsInsert, dsEdit] then
  begin
    MessageDlg('Debe guardar transaccion en progreso antes de imprimir.', mtinformation, [mbYes, mbNo],0);
    Exit;
  end;
  dmdatos.qryRepPoliza.Close;
  dmdatos.qryRepPoliza.params[0].value:= Trim(dmdatos.tblPolizaMasterPOLIZA.Value);
  dmdatos.qryRepPoliza.Open;
  qckRepMarbeteSegPepin:=TqckRepMarbeteSegPepin.Create(nil);
  try
    if MessageDlg('Imprimir?',mtinformation,[mbyes,mbno],0)=mrYES then
    qckRepMarbeteSegPepin.Print
    else
    qckRepMarbeteSegPepin.Preview;
  finally
  qckRepMarbeteSegPepin.free;
  qckRepMarbeteSegPepin:=nil;
  end;
end;

procedure TfrmPolizas.SpeedButton1Click2(Sender: TObject);
begin
  if dmDatos.tblPolizaMaster.State In [dsInsert, dsEdit] then
  begin
    if dmDatos.tblPolizaMasterCODIGO_CTE.IsNull then
    begin
      Raise Exception.Create('Favor indicar cliente.');
      RxDBLookupCombo4.SetFocus;
      Exit;
    end;
    if dmDatos.tblPolizaMaster.State In [dsInsert] then
    begin
      dmDatos.tblPolizaMasterFECHA_IN.Value := now;
      dmDatos.tblPolizaMasterIN_POR.Value := strusername;
    end;
    BitBtn8.Enabled:=True;
    GlbSalvarQuery(dmDatos.tblPolizaMaster)

    {dmDatos.tblPolizaMaster.Post;
    dmDatos.tblPolizaMaster.ApplyUpdates;
    if not dmDatos.tblPolizaMaster.Transaction.InTransaction then
    dmDatos.tblPolizaMaster.Transaction.StartTransaction;
    try
      dmDatos.tblPolizaMaster.Transaction.CommitRetaining;
    except
    dmDatos.tblPolizaMaster.Transaction.RollbackRetaining;
    end;}

  end;
  if dmDatos.tblPolizaDet.State In [dsInsert, dsEdit] then
  begin
    BitBtn1.Enabled:=True;
    if (dmDatos.tblPolizaDetNOMBREASEGURADO.IsNull) or
       (dmDatos.tblPolizaDetAPELLIDOASEGURADO.IsNull) then
    begin
      Messagedlg('Favor llenar nombre y apellido.',mtError,[mbok],0);
      exit;
    end;
    if (dmDatos.tblPolizaDetREGISTRO.IsNull) then
    begin
      Messagedlg('Favor llenar Registro (placa)', mtError, [mbok],0);
      exit;
    end;
    if (dmDatos.tblPolizaDetCHASSIS.IsNull) then
    begin
      Messagedlg('Favor llenar chasis', mtError, [mbok],0);
      exit;
    end;
    if (dmDatos.tblPolizaDetFIANZAJUDICIAL.IsNull) then
    begin
      Messagedlg('Favor llenar Monto Fianza Judicial ', mtError,[mbok],0);
      exit;
    end;
    if dmDatos.tblPolizaDetIDTIPOVEH.IsNull then
    begin
      Raise Exception.Create('Favor indicar tipo vehículo.');
      RxDBLookupCombo4.SetFocus;
      Exit;
    end;
    dmDatos.tblPolizaDetNUMERO.Value:= dmDatos.tblPolizaMasterNUMERO.Value;
    if dmDatos.tblPolizaDetFIANZAJUDICIAL.IsNull then
    begin
      Messagedlg('Indique monto fianza', mtError, [mbok],0);
      Exit;
    end;
    BitBtn8.Enabled := True;
    GlbSalvarQuery(dmDatos.tblPolizaDet);
  end;

end;

procedure TfrmPolizas.SpeedButton2Click2(Sender: TObject);
begin
  if dmDatos.tblPolizaMaster.State = dsBrowse then
  begin
    BitBtn8.Enabled := True;
    dmDatos.tblPolizaMaster.Insert;
    dmDatos.tblPolizaMasterSTATUS.Value:= 'A';
    dmDatos.tblPolizaMasterFECHA.Value := ExtraerFecha(GlbFechaTrnDiaria);
    dmDatos.tblPolizaMasterFECHA_IN.Value:= Now;
    dmDatos.tblPolizaMasterIN_POR.Value  := StruserName;
    dmDatos.tblPolizaMasterCOD_USUARIO.Value:= VarUsuarioGlb;
    DBDateEdit1.SetFocus;
    BitBtn8.Enabled:=False;
  end;
end;

procedure TfrmPolizas.SpeedButton3Click2(Sender: TObject);
begin
  if dmDatos.tblPolizaMaster.State in [dsinsert, dsEdit] then
  begin
    dmDatos.tblPolizaMaster.Cancel;
    BitBtn8.Enabled:=True;
  end else
  begin
    {if MessageDlg('Cancelar plan?', mtinformation,[mbyes,mbno],0)=mryes then
    begin
    if dmDatos.tblPolizaMasterDetSTATUS.Value = 'A' then
    begin
      dmDatos.tblPolizaMasterDet.Edit;
      dmDatos.tblPolizaMasterDetSTATUS.Value:='C';
      SpeedButton6Click(Self);
    end;
    end;}
  end;
end;

procedure TfrmPolizas.SpeedButton7Click(Sender: TObject);
begin
  if   dmDatos.tblPolizaMaster.State in [dsInactive, dsBrowse] then
  begin
    dmDatos.tblPolizaMaster.Close;
    dmDatos.tblPolizaMaster.Open;
  end;
end;

procedure TfrmPolizas.SpeedButton8Click(Sender: TObject);
begin
  if dmDatos.tblPolizaMasterSTATUS.Value = 'A' then
  begin
  if MessageDlg('Desea eliminar definitivamente esta póliza?', mtWarning,[mbyes,mbno],0)=mryes then
  begin
    if MessageDlg('Detalles serán eliminados, desea continuar?', mtWarning,[mbyes,mbno],0)=mryes then
    begin
      dmDatos.tblPolizaDet.First;
      While Not dmDatos.tblPolizaDet.Eof do
      begin
        dmDatos.tblPolizaDet.Delete;
      end;
      //SpeedButton6Click(Self);
    end;
    if dmDatos.tblPolizaDet.RecordCount = 0 then
    begin
      if dmDatos.tblPolizaMasterSTATUS.Value = 'A' then
      begin
        dmDatos.tblPolizaMaster.Delete;
        SpeedButton1Click2(Self);
      end;
    end;
  end;
  end;
end;

procedure TfrmPolizas.FormCreate(Sender: TObject);
begin
  dmDatos.tblPolizaMaster.Close;
  dmDatos.tblPolizaMaster.Open;
  dmDatos.tblTipoVehiculo.close;
  dmDatos.tblTipoVehiculo.Open;
  dmdatos.tblMarcaVehiculo.Close;
  dmdatos.tblMarcaVehiculo.Open;
  dmProveedor.qryProveedores.Close;
  dmProveedor.qryProveedores.Open;
  dmclientes.tblClientes.Close;
  dmclientes.tblClientes.Open;
  BitBtn8Click(Self);
end;

procedure TfrmPolizas.BitBtn4Click(Sender: TObject);
begin
  if dmDatos.tblPolizaMaster.State = dsBrowse then
  dmDatos.tblPolizaMaster.Edit;
end;

procedure TfrmPolizas.MarcaVeh1Click(Sender: TObject);
begin
  frmMarcaVehiculos:=TfrmMarcaVehiculos.Create(Nil);
  try
    frmMarcaVehiculos.showmodal;
  finally
  frmMarcaVehiculos.free;
  frmMarcaVehiculos:=nil;
  end;
end;

procedure TfrmPolizas.ipoVeh1Click(Sender: TObject);
begin
  frmTipoVehiculo :=TfrmTipoVehiculo.Create(Nil);
  try
    frmTipoVehiculo.Showmodal;
  finally
  frmTipoVehiculo.Free;
  frmTipoVehiculo:=Nil;
  end;
end;

procedure TfrmPolizas.Proveedores1Click(Sender: TObject);
begin
  frmProveedores:=TfrmProveedores.Create(Nil);
  try
    frmProveedores.Showmodal;
  finally
  frmProveedores.Free;
  frmProveedores:=Nil;
  end;
end;

procedure TfrmPolizas.Clientes1Click(Sender: TObject);
begin
  frmClientes:=TfrmClientes.Create(Nil);
  try
    frmClientes.Showmodal;
  finally
  frmClientes.Free;
  frmClientes:=Nil;
  end;
end;

end.
