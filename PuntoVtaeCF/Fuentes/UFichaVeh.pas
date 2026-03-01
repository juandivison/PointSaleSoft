unit UFichaVeh;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, ExtCtrls, Grids, DBGrids, Buttons, Mask,
  RXCtrls, RXDBCtrl, DB, RxDBComb, ComCtrls, Menus, EditNew,
  RxLookup, WinSkinData, RxToolEdit, GetAnyDate, IBCustomDataSet, IBQuery;

type
  TFrmFichasVeh = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label9: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    DBStatusLabel1: TDBStatusLabel;
    Panel2: TPanel;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    TabSheet2: TTabSheet;
    RxDBGrid1: TRxDBGrid;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    Label1: TLabel;
    DBEdit26: TDBEdit;
    Label2: TLabel;
    DBEdit27: TDBEdit;
    BitBtn8: TBitBtn;
    dsqrySeguroVeh: TDataSource;
    PopupMenu1: TPopupMenu;
    arifas1: TMenuItem;
    Modelos1: TMenuItem;
    EstatusVehculo1: TMenuItem;
    Label26: TLabel;
    DBEdit8: TDBEdit;
    EditN1: TEditN;
    BitBtn14: TBitBtn;
    Label6: TLabel;
    Label7: TLabel;
    Label16: TLabel;
    dstblTanqueGasolina: TDataSource;
    RxDBLookupCombo1: TRxDBLookupCombo;
    RxDBLookupCombo2: TRxDBLookupCombo;
    RxDBLookupCombo3: TRxDBLookupCombo;
    RxDBLookupCombo4: TRxDBLookupCombo;
    Label3: TLabel;
    RxDBLookupCombo5: TRxDBLookupCombo;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    BitBtn3: TBitBtn;
    DBDateEdit1: TDBDateEdit;
    Label8: TLabel;
    DBEdit3: TDBEdit;
    Label17: TLabel;
    SkinData1: TSkinData;
    RxDBLookupCombo6: TRxDBLookupCombo;
    Label5: TLabel;
    Label10: TLabel;
    DBEdit2: TDBEdit;
    RxLabel1: TRxLabel;
    Shape1: TShape;
    Label18: TLabel;
    edtBuscaChassis: TEdit;
    BitBtn13: TBitBtn;
    edtBuscarPlaca: TEdit;
    Label19: TLabel;
    BitBtn15: TBitBtn;
    BitBtn16: TBitBtn;
    GetAnyDate1: TGetAnyDate;
    BitBtn17: TBitBtn;
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
    DataSource1: TDataSource;
    BitBtn18: TBitBtn;
    BitBtn19: TBitBtn;
    BitBtn20: TBitBtn;
    Label20: TLabel;
    Label24: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Label25: TLabel;
    rxdbboxmoneda: TRxDBComboBox;
    Label27: TLabel;
    Label28: TLabel;
    RxDBLookupCombo7: TRxDBLookupCombo;
    tblMotoresMAQUINA: TIBStringField;
    DBEdit7: TDBEdit;
    Label29: TLabel;
    DBEdit9: TDBEdit;
    Label30: TLabel;
    DBText1: TDBText;
    Label31: TLabel;
    qryInventario: TIBQuery;
    RxDBLookupCombo8: TRxDBLookupCombo;
    dsqryInventario: TDataSource;
    SpeedButton1: TSpeedButton;
    qryInventarioCODIGO: TIntegerField;
    qryInventarioDESCRIPCION: TIBStringField;
    BitBtn21: TBitBtn;
    RxSpeedButton12: TRxSpeedButton;
    VerificaCodigoInventario1: TMenuItem;
    qryInvLook: TIBQuery;
    qryInvLookCODIGO: TIntegerField;
    qryInvLookDESCRIPCION: TIBStringField;
    FiltrarCodigoProd1: TMenuItem;
    CheckBox1: TCheckBox;
    BitBtn22: TBitBtn;
    qryCteLook: TIBQuery;
    qryCteLookCODIGO_CTE: TIntegerField;
    qryCteLookCIA_KEY: TIntegerField;
    qryCteLookNOMBRE_FACTURAR: TIBStringField;
    dsqryCteLook: TDataSource;
    RxDBLookupCombo9: TRxDBLookupCombo;
    Label32: TLabel;
    BitBtn23: TBitBtn;
    Label33: TLabel;
    RxDBLookupCombo10: TRxDBLookupCombo;
    dsqryCteLookAct: TDataSource;
    MaestroClientes1: TMenuItem;
    BitBtn24: TBitBtn;
    tblDatosVeh: TIBDataSet;
    tblDatosVehNUMERO: TIntegerField;
    tblDatosVehCODIGO_CTE: TIntegerField;
    tblDatosVehCHASSIS: TIBStringField;
    qryCteLookAct: TIBQuery;
    BitBtn25: TBitBtn;
    BitBtn26: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure DBEdit2Change(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure EditN1Change(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBEdit17Change(Sender: TObject);
    procedure RxDBLookupCombo2Click(Sender: TObject);
    procedure DBEdit27Change(Sender: TObject);
    procedure DBEdit8Exit(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure BitBtn18Click(Sender: TObject);
    procedure BitBtn19Click(Sender: TObject);
    procedure BitBtn20Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBEdit18Exit(Sender: TObject);
    procedure BitBtn21Click(Sender: TObject);
    procedure EstatusVehculo1Click(Sender: TObject);
    procedure VerificaCodigoInventario1Click(Sender: TObject);
    procedure FiltrarCodigoProd1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure BitBtn22Click(Sender: TObject);
    procedure RxDBLookupCombo8Exit(Sender: TObject);
    procedure BitBtn23Click(Sender: TObject);
    procedure MaestroClientes1Click(Sender: TObject);
    procedure BitBtn25Click(Sender: TObject);
    procedure BitBtn26Click(Sender: TObject);
    procedure BitBtn24Click(Sender: TObject);
    procedure RxDBLookupCombo10Exit(Sender: TObject);
  private
    { Private declarations }
    Procedure ProcMostrarSegTarifa;
    Procedure ProcCalcCombustible;
    Procedure InsertarEnMotores;
    Procedure InsertarEnInvenario;
    Procedure EditarEnMotores;
    Function VerificaTrn:Boolean;
  public
    { Public declarations }
    Procedure AsignarCte;

  end;

var
  FrmFichasVeh: TFrmFichasVeh;
  
  esIns : boolean;
  esEdt : boolean;

implementation

uses Uglobal, UDatModVehiculo, UBuscarProveedores, UDatModCompania,
  UQckRepMotores, UFormBuscarMotor, UFormReporteMotoresVeh,
  UInventarioProd, UDatModInventario, UDatosVentas, UDatModConectar,
  UConsultaInventario, UFormSelEstatusVeh, UFormProveedores,
  UMaestroClientes, UDatModUsuarios, UBuscarClientesPersonasP;

{$R *.dfm}

procedure TFrmFichasVeh.BitBtn1Click(Sender: TObject);
begin
  if not VerificaTrn then exit;
  if dmVehiculo.tblVehiculo.State = dsBrowse then
  begin
    dmVehiculo.tblVehiculo.Insert;
    dmVehiculo.tblVehiculoTIPO_COMBUSTIBLE.Value:=1;
    dmVehiculo.tblVehiculoFECHA.Value:=ExtraerFecha(GlbFechaTrnDiaria);
    dmVehiculo.tblVehiculoFECHA_INICIO.Value :=ExtraerFecha(now);
    dmVehiculo.tblVehiculoCOD_MONEDA.Value   :='2';
    dmVehiculo.tblVehiculoSTATUS_ACTIVO.Value:='1';
    dmVehiculo.tblVehiculoCOD_PROPIETARIO.Value:= glbCia_Key;
    dmVehiculo.tblVehiculoIN_POR.Value      := StrUserName;
    dmVehiculo.tblVehiculoFECHA_IN.Value    := Now;
    RxDBLookupCombo7.SetFocus;
  end;
end;

procedure TFrmFichasVeh.BitBtn2Click(Sender: TObject);
begin
  esIns:= dmVehiculo.tblVehiculo.State in [dsInsert];
  esEdt:= dmVehiculo.tblVehiculo.State in [dsEdit];

  if dmVehiculo.tblVehiculoCODIGO_PROD.IsNull then
  begin
    MessageDlg('Debes indicar la descripcion',mtError,[mbok],0);
    RxDBLookupCombo8.Color:=clYellow;
    exit;
  end;

  if dmVehiculo.tblVehiculo.State in [dsInsert, dsEdit] then
  begin
    if dmVehiculo.tblVehiculoMARCA.IsNull or (dmVehiculo.tblVehiculoMARCA.Value ='') then
    begin
      MessageDlg('Debes indicar la marca',mtinformation,[mbok],0);
      DBEdit19.SetFocus;
      exit;
    end;
    if dmVehiculo.tblVehiculoColor.IsNull or (dmVehiculo.tblVehiculoColor.Value ='') then
    begin
      MessageDlg('Debes indicar el color',mtinformation,[mbok],0);
      DBEdit2.SetFocus;
      exit;
    end;

    if dmVehiculo.tblVehiculoYEAR_VEH.IsNull or (dmVehiculo.tblVehiculoYEAR_VEH.Value = 0) then
    begin
      MessageDlg('Debes indicar el año',mtinformation,[mbok], 0);
      DBEdit21.SetFocus;
      exit;
    end;

    if dmVehiculo.tblVehiculoMODELO.IsNull or (dmVehiculo.tblVehiculoModelo.Value ='') then
    begin
      MessageDlg('Debes indicar el modelo',mtinformation,[mbok],0);
      DBEdit2.SetFocus;
      exit;
    end;
    if dmVehiculo.tblVehiculoCHASSIS.IsNull or (dmVehiculo.tblVehiculoCHASSIS.Value ='') then
    begin
      MessageDlg('Debes indicar el chassis',mtinformation,[mbok],0);
      DBEdit18.SetFocus;
      exit;
    end;

    if dmVehiculo.tblVehiculoCHASSIS.IsNull then
    dmVehiculo.tblVehiculoCHASSIS.Value:=dmVehiculo.tblVehiculoREFERENCIA.Value;
    if qryInventario.Locate('codigo',dmVehiculo.tblVehiculoCODIGO_PROD.Value,[]) then
    dmVehiculo.tblVehiculoDESCRIPCION.Value:=qryInventarioDESCRIPCION.Value;
    GlbSalvarQuery(dmVehiculo.tblVehiculo);
  end;
  if esIns then
  InsertarEnMotores
  else
  if esEdt then
  EditarEnMotores;
  if esIns or esEdt then
  begin
    InsertarEnInvenario;
    if not dmVehiculo.tblVehiculoCODIGO_CTE_ACT.IsNull then
    begin
      tblDatosVeh.Close;
      tblDatosVeh.Params[0].Value:=dmVehiculo.tblVehiculoCHASSIS.Value;
      tblDatosVeh.Open;
      tblDatosVeh.first;
      if tblDatosVeh.RecordCount > 0 then
      begin
        tblDatosVeh.Edit;
        tblDatosVehCODIGO_CTE.Value:= dmVehiculo.tblVehiculoCODIGO_CTE_ACT.Value;
        GlbSalvarQuery(tblDatosVeh);
      end;
    end;
  end;
end;

procedure TFrmFichasVeh.BitBtn5Click(Sender: TObject);
begin
  if dmVehiculo.tblVehiculo.State In [dsInsert, dsEdit] then
  dmVehiculo.tblVehiculo.Cancel;
end;

procedure TFrmFichasVeh.FormCreate(Sender: TObject);
begin
  dmCompania.tblCompania.Close;
  dmCompania.tblCompania.Open;
  dmVehiculo.tblVehiculo.Close;
  dmVehiculo.tblVehiculo.Open;
  dmVehiculo.qryClientes.Close;
  dmVehiculo.qryClientes.Open;

  qryCteLookAct.Close;
  qryCteLookAct.params[0].Value:= glbCia_Key;
  qryCteLookAct.Open;
  
  qryCteLook.close;
  qryCteLook.params[0].Value:= glbCia_Key;
  qryCteLook.open;
  dmVehiculo.tblEstatusVeh.Close;
  dmVehiculo.tblEstatusVeh.Open;

  dmVehiculo.tblTanqueGasolina.Close;
  dmVehiculo.tblTanqueGasolina.Open;
  dmVehiculo.tblTipoCombustible.Close;
  dmVehiculo.tblTipoCombustible.Open;
  dmVehiculo.qryEmpleado.Close;
  dmVehiculo.qryEmpleado.Open;
  dmVehiculo.qryProvLook.close;
  dmVehiculo.qryProvLook.open;

  qryInventario.Close;
  qryInventario.params[0].Value:= glbCia_Key;
  qryInventario.Open;
end;

procedure TFrmFichasVeh.BitBtn9Click(Sender: TObject);
begin
  if dmVehiculo.tblVehiculo.State = dsBrowse then
  begin
    dmVehiculo.tblVehiculo.First;
    //ProcMostrarSegTarifa;
  end;
end;

procedure TFrmFichasVeh.BitBtn10Click(Sender: TObject);
begin
  if dmVehiculo.tblVehiculo.State = dsBrowse then
  begin
    //ProcMostrarSegTarifa;
    dmVehiculo.tblVehiculo.Prior;
  end;
end;

procedure TFrmFichasVeh.BitBtn11Click(Sender: TObject);
begin
  if dmVehiculo.tblVehiculo.State = dsBrowse then
  begin
    //ProcMostrarSegTarifa;
    dmVehiculo.tblVehiculo.Next;
  end;

end;

procedure TFrmFichasVeh.BitBtn12Click(Sender: TObject);
begin
  if dmVehiculo.tblVehiculo.State = dsBrowse then
  begin
    //ProcMostrarSegTarifa;
    dmVehiculo.tblVehiculo.Last;
  end;
end;

procedure TFrmFichasVeh.DBEdit2Change(Sender: TObject);
begin
  //ProcMostrarSegTarifa;
end;

procedure TFrmFichasVeh.BitBtn8Click(Sender: TObject);
begin
  if dmVehiculo.tblVehiculo.State = dsBrowse then
  dmVehiculo.tblVehiculo.Edit;
end;

procedure TFrmFichasVeh.EditN1Change(Sender: TObject);
begin
  dmvehiculo.tblVehiculo.Locate('FICHA',editn1.ValueInteger,[loCaseInsensitive,loPartialKey]);
end;

procedure TFrmFichasVeh.BitBtn14Click(Sender: TObject);
begin
  if Not dmvehiculo.tblVehiculo.Locate('FICHA',editn1.ValueInteger,[]) then
     MessageDlg('Ficha no encontrada, verifique',mtInformation, [mbOk], 0);
end;

procedure TFrmFichasVeh.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if dmVehiculo.tblVehiculo.State in [dsInsert, dsEdit] then
  begin
    MessageDlg('Hay una transaccion pendiente, verifique',mtInformation, [mbOK], 0);
    CanClose := False;
  end else CanClose := True;
end;

procedure TFrmFichasVeh.ProcMostrarSegTarifa;
begin

end;

procedure TFrmFichasVeh.DBEdit17Change(Sender: TObject);
begin
  //ProcMostrarSegTarifa;
end;

procedure TFrmFichasVeh.RxDBLookupCombo2Click(Sender: TObject);
begin
  DBEdit2Change(Self);
end;

procedure TFrmFichasVeh.DBEdit27Change(Sender: TObject);
begin
  if dmVehiculo.tblVehiculo.State in [dsEdit, dsInsert] then
  begin
  // ProcCalcCombustible;
  end;
end;

procedure TFrmFichasVeh.ProcCalcCombustible;
begin
{  dmVehiculo.ibsqlMontoComb.close;
  if (dmVehiculo.tblVehiculoCANTIDAD_COMBUSTIBLE.IsNull) or
      (dmVehiculo.tblVehiculoTIPO_COMBUSTIBLE.IsNull) then Exit;
  dmVehiculo.ibsqlMontoComb.Params[0].Value:= dmVehiculo.tblVehiculoTIPO_COMBUSTIBLE.Value;
  dmVehiculo.ibsqlMontoComb.Params[1].Value:= ExtraerFecha(GlbFechaTrnDiaria);
  dmVehiculo.ibsqlMontoComb.Params[2].Value:= dmVehiculo.tblVehiculoCANTIDAD_COMBUSTIBLE.Value;
  dmVehiculo.ibsqlMontoComb.ExecQuery;
  if (not dmVehiculo.ibsqlMontoComb.Current.Vars[0].IsNull) then
  dmVehiculo.tblVehiculoVALOR_TANQUE.Value:=
  dmVehiculo.ibsqlMontoComb.Current.Vars[0].Value;
  }
end;

procedure TFrmFichasVeh.DBEdit8Exit(Sender: TObject);
begin
  //if dmVehiculo.tblVehiculo.State in [dsEdit, dsInsert] then
  //ProcCalcCombustible;
end;

procedure TFrmFichasVeh.BitBtn3Click(Sender: TObject);
begin
  {frmBuscarProveedores:=TfrmBuscarProveedores.Create(Nil);
  try
    if frmBuscarProveedores.ShowModal = mrOk then
    begin
      if dmVehiculo.tblVehiculo.State in [dsEdit, dsInsert] then
      dmVehiculo.tblVehiculoCOD_PROPIETARIO.Value:= frmBuscarProveedores.xCodigoCte;
    end;
  finally
  frmBuscarProveedores.Free;
  frmBuscarProveedores:=Nil;
  end;}
end;

procedure TFrmFichasVeh.BitBtn13Click(Sender: TObject);
begin
  if dmVehiculo.tblVehiculo.state in [dsedit, dsinsert] then Exit;
  if (trim(edtBuscaChassis.Text) <> '') then
  begin
    if Not dmVehiculo.tblVehiculo.Locate('CHASSIS',edtBuscaChassis.Text,[loCaseInsensitive]) then
    MessageDlg('Chassis '+edtBuscaChassis.Text+' no existe, verifique.', mtinformation,[mbok],0);
  end else
  if (trim(edtBuscarPlaca.Text) <> '') then
  begin
    if Not dmVehiculo.tblVehiculo.Locate('PLACA',edtBuscarPlaca.Text,[loCaseInsensitive]) then
    MessageDlg('Placa '+edtBuscarPlaca.Text+' no existe, verifique.', mtinformation,[mbok],0);
  end;
end;

procedure TFrmFichasVeh.BitBtn15Click(Sender: TObject);
begin
  if not VerificaTrn then exit;
  if (dmVehiculo.tblVehiculoSTATUS_ACTIVO.value = '6') then exit;
  if dmVehiculo.tblVehiculo.State in [dsBrowse] then
  begin
    dmVehiculo.qryVerificaVeh.Close;
    dmVehiculo.qryVerificaVeh.Params[0].Value:=dmVehiculo.tblVehiculoreferencia.Value;
    dmVehiculo.qryVerificaVeh.Open;
    dmVehiculo.qryVerificaVeh.First;
    if dmVehiculo.qryVerificaVeh.RecordCount > 0 then
    begin
       MessageDlg('Record no puede ser eliminado, ha sido vendido.', mtinformation,[mbok],0);
    end else
    begin
      if MessageDlg('¿Desea eliminar record?', mtinformation,[mbyes,mbno],0) = mryes then
      begin
        dmVehiculo.tblVehiculo.Delete;   dmVehiculo.tblVehiculoSTATUS_ACTIVO.value;
        GlbSalvarQuery(dmVehiculo.tblVehiculo);
      end;
    end;
  end;
end;

procedure TFrmFichasVeh.BitBtn16Click(Sender: TObject);
begin
  if not VerificaTrn then exit;
  qckRepMotores:=TqckRepMotores.Create(nil);
  try
    qckRepMotores.qryMotores.Close;
    qckRepMotores.qryMotores.SQL.Clear;
    qckRepMotores.qryMotores.SQL.Text:= qckRepMotores.qryMotores_Entrada.SQL.Text;
    GetAnyDate1.Fecha:=now;
    GetAnyDate1.FechaFinal:=now;
    if GetAnyDate1.Execute then
    begin
      qckRepMotores.qryMotores.params[0].Value:= ExtraerFecha(GetAnyDate1.Fecha);
      qckRepMotores.qryMotores.params[1].Value:= ExtraerFecha(GetAnyDate1.FechaFinal);
      qckRepMotores.qryMotores.Open;
      qckRepMotores.Preview;
    end;
  finally
  qckRepMotores.free;
  qckRepMotores:=nil;
  end;
end;

procedure TFrmFichasVeh.BitBtn17Click(Sender: TObject);
begin
  if tblMotores.State in [dsEdit, dsInsert] then exit;
  GlbTipoTransMotores:=1;
  frmBuscarMotor:=TfrmBuscarMotor.Create(Nil);
  try
    frmBuscarMotor._Tipo := 1;
    if frmBuscarMotor.ShowModal = mrOk then
    begin
      tblMotores.Close;
      tblMotores.Params[0].Value := 1;
      tblMotores.Params[1].Value := 1;
      tblMotores.Open;
      if not tblMotores.Locate('Numero', frmBuscarMotor.qryMotoresEntradaNUMERO.Value,[]) then
      MessageDlg('Record no encontrado, verifique.', mtInformation,[mbok],0)
      else
      dmVehiculo.tblVehiculo.Locate('CHASSIS',frmBuscarMotor.qryMotoresEntradaCHASIS.Value,[loCaseInsensitive]);
    end;
  finally
  frmBuscarMotor.Free;
  frmBuscarMotor:= Nil;
  end;
end;

procedure TFrmFichasVeh.InsertarEnMotores;
begin
  tblMotores.Close;
  tblMotores.params[0].Value:=1;
  tblMotores.params[1].Value:=1;
  tblMotores.Open;
  if tblMotores.State In [dsBrowse] then
  begin
    if tblMotores.Locate('CHASIS',dmVehiculo.tblVehiculoCHASSIS.Value,[]) then
    begin
      EditarenMotores;
      exit;
    end;
    tblMotores.Append;
    tblMotoresTIPO.Value:=1;
    //tblMotoresFECHA_ASIGNADO.Value:=ExtraerFecha(now);
    tblMotoresSTATUS.Value  :='A';
    tblMotoresIN_POR.Value  := StrUserName;
    tblMotoresFECHA_IN.Value:= now;
    tblMotoresCOD_USUARIO.Value:= VarUsuarioGlb;
    tblMotoresFECHA_INGRESO.Value:= dmVehiculo.tblVehiculoFECHA.Value;
    tblMotoresYEAR_FAB.Value:= dmVehiculo.tblVehiculoYEAR_VEH.Value;
    tblMotoresCHASIS.Value  := dmVehiculo.tblVehiculoCHASSIS.Value;
    tblMotoresCOLOR.Value   := dmVehiculo.tblVehiculoCOLOR.Value;
    tblMotoresMODELO.Value  := dmVehiculo.tblVehiculoMODELO.Value;
    tblMotoresMAQUINA.Value := dmVehiculo.tblVehiculoREGISTRO.Value;
    //tblMotoresMATRICULA.Value:= dmVehiculo.tblVehiculom.Value;
    tblMotoresPLACA.Value := dmVehiculo.tblVehiculoPLACA.Value;
    GlbSalvarQuery(tblMotores);
  end;
end;

procedure TFrmFichasVeh.EditarEnMotores;
begin
  tblMotores.Close;
  tblMotores.params[0].Value:=1;
  tblMotores.params[1].Value:=1;
  tblMotores.Open;
  if tblMotores.State In [dsBrowse] then
  begin
    if tblMotores.Locate('chasis',dmVehiculo.tblVehiculoCHASSIS.Value,[]) then
    begin
      tblMotores.Edit;
      tblMotoresTIPO.Value:=1;
      //tblMotoresFECHA_ASIGNADO.Value:=ExtraerFecha(now);
      tblMotoresSTATUS.Value:='A';
      tblMotoresIN_POR.Value:= StrUserName;
      tblMotoresFECHA_IN.Value:= now;
      tblMotoresCOD_USUARIO.Value:= VarUsuarioGlb;
      tblMotoresFECHA_INGRESO.Value:= dmVehiculo.tblVehiculoFECHA.Value;
      tblMotoresYEAR_FAB.Value:= dmVehiculo.tblVehiculoYEAR_VEH.Value;
      tblMotoresCHASIS.Value  := dmVehiculo.tblVehiculoCHASSIS.Value;
      tblMotoresCOLOR.Value := dmVehiculo.tblVehiculoCOLOR.Value;
      tblMotoresMODELO.Value:= dmVehiculo.tblVehiculoMODELO.Value;
      //tblMotoresMATRICULA.Value:= dmVehiculo.tblVehiculom.Value;
      tblMotoresPLACA.Value := dmVehiculo.tblVehiculoPLACA.Value;
      GlbSalvarQuery(tblMotores);
    end else
    InsertarEnMotores;
  end;
end;

procedure TFrmFichasVeh.BitBtn18Click(Sender: TObject);
begin
  if not VerificaTrn then exit;
  qckRepMotores:=TqckRepMotores.Create(nil);
  try
    qckRepMotores.qryMotores.Close;
    qckRepMotores.qryMotores.SQL.Clear;
    qckRepMotores.qryMotores.SQL.Text:= qckRepMotores.qryMotores_Salida.SQL.Text;
    GetAnyDate1.Fecha:=now;
    GetAnyDate1.FechaFinal:=now;
    if GetAnyDate1.Execute then
    begin
      qckRepMotores.qryMotores.params[0].Value:= ExtraerFecha(GetAnyDate1.Fecha);
      qckRepMotores.qryMotores.params[1].Value:= ExtraerFecha(GetAnyDate1.FechaFinal);
      qckRepMotores.qryMotores.Open;
      qckRepMotores.Preview;
    end;
  finally
  qckRepMotores.free;
  qckRepMotores:= Nil;
  end;
end;

function TFrmFichasVeh.VerificaTrn:Boolean;
begin
  if dmVehiculo.tblVehiculo.State in [dsInsert, dsEdit] then
  begin
    MessageDlg('Hay una transacción pendiente, verifique',mtInformation, [mbOK], 0);
    result:=False;
  end else result:=true;
end;

procedure TFrmFichasVeh.BitBtn19Click(Sender: TObject);
begin
  frmReportesVehiculos:=TfrmReportesVehiculos.Create(nil);
  try
    frmReportesVehiculos.ShowModal;
  finally
  frmReportesVehiculos.Free;
  frmReportesVehiculos:=Nil;
  end;
end;

procedure TFrmFichasVeh.BitBtn20Click(Sender: TObject);
begin
  frmInventarioProd:=TfrmInventarioProd.Create(Nil);
  try
    if Not dmVehiculo.tblVehiculoCodigo_prod.IsNull then
    dmInventario.tblInventarioProd.Locate('codigo',dmVehiculo.tblVehiculoCodigo_prod.Value,[])
    else
    dmInventario.tblInventarioProd.Locate('descripcion',dmVehiculo.tblVehiculodescripcion.Value,[]);
    frminventarioprod.ShowModal;
  finally
  frmInventarioProd.Free;
  frmInventarioProd:=Nil;
  end;
  qryInventario.Close;
  qryInventario.params[0].Value:= glbCia_Key;
  qryInventario.Open;  
end;

procedure TFrmFichasVeh.InsertarEnInvenario;
begin
  dmInventario.tblInventarioProd.Close;
  dmInventario.tblInventarioProd.Params[0].Value:= glbCia_Key;
  dmInventario.tblInventarioProd.Open;
  if dmInventario.tblInventarioProd.Locate('codigo',dmVehiculo.tblVehiculoCODIGO_PROD.Value,[]) then
  begin
    dmInventario.tblInventarioProd.Edit;
    if (esIns) then
    begin
      if dmInventario.tblInventarioProdCANTIDAD.IsNull then
      dmInventario.tblInventarioProdCANTIDAD.Value:=0;
      if (dmVehiculo.tblVehiculoSTATUS_ACTIVO.Value <> '6') then
      dmInventario.tblInventarioProdCANTIDAD.Value:=dmInventario.tblInventarioProdCANTIDAD.Value + 1;

      dmInventario.tblInventarioProdPRECIO_COMPRA.Value:=
      dmVehiculo.tblVehiculoPrecioCompra.Value * GlbMontoTasa(dmVehiculo.tblVehiculoCOD_MONEDA.Value);
      dmInventario.tblInventarioProdPRECIO_MINIMO.Value :=dmVehiculo.tblVehiculoPrecioVenta.Value;
      dmInventario.tblInventarioProdPRECIO.Value :=dmVehiculo.tblVehiculoPrecioVenta.Value;
      try
        if (dmVehiculo.tblVehiculoSTATUS_ACTIVO.Value <> '6') then
        dmVentas.Proc_InsertarKardexDet(
        glbCia_Key,
        1, //TIPO SMALLINT,  --1-Entradas 2-Salida
        7, //TIPO_OPE SMALLINT,--1-Orden Compra 2-Venta 3-Devolucion 4-Transferencia 5-Dañado 6-Donacion 7-Otro
        extraerfecha(now),
        dmInventario.tblInventarioProdCODIGO.Value, //CODIGO_PRODUCTO :integer;
        1,
        dmInventario.tblInventarioProdPRECIO_COMPRA.Value, //COSTO_PRODUCTO :real;
        dmInventario.tblInventarioProdPRECIO.Value, // PRECIO_VENTA :real;
        VarUsuarioGlb, //CODIGO_USUARIO :integer;
        dmVehiculo.tblVehiculoFICHA.Value,//Numero trn despacho
        'A' //STATUS :string;
        ,'Registro Vehículo');
      except
      end;
    end;
    GlbSalvarQuery(dmInventario.tblInventarioProd);
  end else
  begin
    //no existe
  end;
end;

procedure TFrmFichasVeh.SpeedButton1Click(Sender: TObject);
begin
  frmConsultaInventario:=TfrmConsultaInventario.Create(Nil);
  try
    if frmConsultaInventario.Showmodal = mrOk then
    begin
      if dmVehiculo.tblVehiculo.State in [dsInsert, dsEdit] then
      dmVehiculo.tblVehiculoCODIGO_PROD.Value := frmConsultaInventario.ibquery1codigo.Value
      else
      dmVehiculo.tblVehiculo.Locate('CODIGO_PROD', frmConsultaInventario.ibquery1codigo.Value,[]);
    end;
  finally
  frmConsultaInventario.Free;
  frmConsultaInventario:=Nil;
  end;
end;

{
dmInventario.tblInventarioProd.Append;
    dmInventario.tblInventarioProdCIA_KEY.Value:= glbCia_Key;
    dmInventario.tblInventarioProdCODCATEGORIA.Value:=0;
    dmInventario.tblInventarioProdCOD_MONEDA.Value :='1';
    dmInventario.tblInventarioProdCANTIDAD.Value:=1;
    dmInventario.tblInventarioProdFECHA.Value:=extraerfecha(now);
    dmInventario.tblInventarioProdTIPO.Value :=1;
    dmInventario.tblInventarioProdPRECIO.Value:= dmVehiculo.tblVehiculoPrecioVenta.Value;

    dmInventario.tblInventarioProdPRECIO_COMPRA.Value:=
    dmVehiculo.tblVehiculoPrecioCompra.Value * GlbMontoTasa(dmVehiculo.tblVehiculoCOD_MONEDA.Value);
    dmInventario.tblInventarioProdPRECIO_MINIMO.Value :=dmVehiculo.tblVehiculoPrecioVenta.Value;
    dmInventario.tblInventarioProdSTATUS.Value    :='A';
    dmInventario.tblInventarioProdPAGA_ITBI.Value :=1;
    dmInventario.tblInventarioProdIDTASAITBIS.Value:=6;//18%
    dmInventario.tblInventarioProdREFERENCIA.Value :=dmVehiculo.tblVehiculoCHASSIS.Value;
    dmInventario.tblInventarioProdPORC_DESCUENTO.Value:=0;

    dmInventario.tblInventarioProdINVENTARIAR.Value:=1;
    dmInventario.tblInventarioProdDESCRIPCION.Value:=dmVehiculo.tblVehiculoDESCRIPCION.Value;
    dmInventario.tblInventarioProdTIPO_UNIDAD.Value:=1;
    dmInventario.tblInventarioProdUNIDAD.Value     :=1;

    GlbSalvarQuery(dmInventario.tblInventarioProd);
    if dmInventario.tblInventarioProdCodigo_texto.IsNull then
    begin
      dmInventario.tblInventarioProd.Edit;
      //codigo_texto
      dmInventario.tblInventarioProdCodigo_texto.Value:=
      dmInventario.tblInventarioProdCodigo.AsString;
      //codigo_barra
      if dmInventario.tblInventarioProdCODIGO_BARRA.IsNull then
      dmInventario.tblInventarioProdCODIGO_BARRA.Value:=
      dmInventario.tblInventarioProdCodigo_texto.Value;
      GlbSalvarQuery(dmInventario.tblInventarioProd);
    end;
}
procedure TFrmFichasVeh.DBEdit18Exit(Sender: TObject);
begin
  if dmVehiculo.tblVehiculo.state in [dsedit, dsinsert] then
  dmVehiculo.tblVehiculoREFERENCIA.Value:=dmVehiculo.tblVehiculoCHASSIS.Value;
end;

procedure TFrmFichasVeh.BitBtn21Click(Sender: TObject);
begin
  if dmVehiculo.tblVehiculo.State = dsBrowse then
  begin
    dmVehiculo.tblVehiculo.close;
    dmVehiculo.tblVehiculo.open;
  end;
end;

procedure TFrmFichasVeh.EstatusVehculo1Click(Sender: TObject);
begin
  dmVehiculo._codProdVeh:= 0;
  if EstatusVehculo1.Checked then
  begin
    EstatusVehculo1.Checked:=False;
    exit;
  end;

  frmEstatusVeh :=TfrmEstatusVeh.Create(nil);
  try
    if frmEstatusVeh.ShowModal = mrok then
    begin
      dmVehiculo._statusveh:=frmEstatusVeh._statusveh;
      if not EstatusVehculo1.Checked then
      begin
        dmVehiculo.tblVehiculo.Filtered:=True;
        EstatusVehculo1.Checked :=true;
        CheckBox1.Checked := True;
      end else
      begin
        dmVehiculo.tblVehiculo.Filtered:=false;
        EstatusVehculo1.Checked :=false;
        CheckBox1.Checked := false;
      end;
    end;
  except
  frmEstatusVeh.free;
  frmEstatusVeh:=nil;
  end;
end;

procedure TFrmFichasVeh.VerificaCodigoInventario1Click(Sender: TObject);
var
  codProd : integer;
begin
  dmVehiculo.tblVehiculo.First;
  qryInvLook.Close;
  qryInvLook.params[0].Value:= glbCia_Key;
  qryInvLook.open;
  if not FiltrarCodigoProd1.Checked then
  begin
    MessageDlg('Debe filtrar por codigo de producto.',mtwarning,[mbok],0);
    exit;
  end;

  frmConsultaInventario:=TfrmConsultaInventario.Create(Nil);
  try
    if frmConsultaInventario.Showmodal = mrOk then
    codProd := frmConsultaInventario.ibquery1codigo.Value
    else codProd := -1;
  finally
  frmConsultaInventario.Free;
  frmConsultaInventario:=Nil;
  end;

  if (codProd < 0) then exit;
  dmVehiculo.tblVehiculo.Filtered:=False;
  while not dmVehiculo.tblVehiculo.Eof do
  begin
    if dmVehiculo.tblVehiculo.Locate('CODIGO_PROD',dmVehiculo._codProdVeh,[]) then
    begin
      dmVehiculo.tblVehiculo.Edit;
      dmVehiculo.tblVehiculoCODIGO_PROD.Value:= codProd;
      dmVehiculo.tblVehiculoFECHA_UPD.Value  := now;
      dmVehiculo.tblVehiculoUPD_POR.Value    := strusername;
      GlbSalvarQuery(dmVehiculo.tblVehiculo);
    end;
    dmVehiculo.tblVehiculo.Next;
  end;
  codProd := -1;
  dmVehiculo._codProdVeh:=0;
  CheckBox1.Checked:=false;
end;

procedure TFrmFichasVeh.FiltrarCodigoProd1Click(Sender: TObject);
begin
  if CheckBox1.Checked then exit;
  dmVehiculo._codProdVeh:=dmVehiculo.tblVehiculoCODIGO_PROD.Value;
  if not FiltrarCodigoProd1.Checked then
  begin
    dmVehiculo.tblVehiculo.Filtered:=false;
    dmVehiculo.tblVehiculo.Filtered:=True;
    FiltrarCodigoProd1.Checked :=true;
    CheckBox1.Checked:=True;
  end else
  begin
    dmVehiculo.tblVehiculo.Filtered:=false;
    FiltrarCodigoProd1.Checked :=false;
    CheckBox1.Checked:=false;
  end;
end;

procedure TFrmFichasVeh.CheckBox1Click(Sender: TObject);
begin
  if not CheckBox1.Checked then
  begin
    CheckBox1.Checked:=false;
    dmVehiculo.tblVehiculo.Filtered:=false;
    FiltrarCodigoProd1.Checked :=false;
    EstatusVehculo1.Checked := false;
    dmVehiculo._codProdVeh:= 0;
  end;
end;

procedure TFrmFichasVeh.BitBtn22Click(Sender: TObject);
begin
  frmProveedores:=TfrmProveedores.create(nil);
  try
    frmProveedores.ShowModal;
    if dmVehiculo.tblVehiculo.State = dsInsert then
    dmVehiculo.tblVehiculoCOD_PROVEEDOR.Value:= frmProveedores._codP;
  finally
  frmProveedores.Free;
  frmProveedores:=nil;
  end;
  dmVehiculo.qryProvLook.close;
  dmVehiculo.qryProvLook.open;
end;

procedure TFrmFichasVeh.RxDBLookupCombo8Exit(Sender: TObject);
begin
  RxDBLookupCombo8.Color:=clWindow;
end;

procedure TFrmFichasVeh.BitBtn23Click(Sender: TObject);
begin
  if tblMotores.State in [dsEdit, dsInsert] then exit;
  GlbTipoTransMotores:=1;
  frmBuscarMotor:=TfrmBuscarMotor.Create(Nil);
  try                                            
    frmBuscarMotor._Tipo := 1;
    frmBuscarMotor._Vendidos := True;
    frmBuscarMotor.BitBtn1Click(Self);

    if not dmVehiculo.tblVehiculoCHASSIS.IsNull then
    frmBuscarMotor.qryMotoresEntrada.Locate('CHASIS',dmVehiculo.tblVehiculoCHASSIS.Value,[]);

    if frmBuscarMotor.ShowModal = mrOk then  
    begin
      if dmVehiculo.tblVehiculo.State in [dsEdit, dsInsert] then
      begin
        if not frmBuscarMotor.qryMotoresEntradaCODIGO_CTE.IsNull then
        dmVehiculo.tblVehiculoCODIGO_CTE_ANT.Value := frmBuscarMotor.qryMotoresEntradaCODIGO_CTE.Value
        else
        begin
          MessageDlg('No puede ser asignado veh/motor no tiene codigo cliente, verifique.',mtinformation,[mbok],0);
        end;
      end;
    end;
  finally
  frmBuscarMotor.Free;
  frmBuscarMotor:= Nil;
  end;
end;

procedure TFrmFichasVeh.MaestroClientes1Click(Sender: TObject);
begin
  frmClientes:=TfrmClientes.Create(Nil);
  try
    {dmUsuarios.qryRoles.Close;
    dmUsuarios.qryRoles.Params[0].Value:= VarUsuarioGlb;
    dmUsuarios.qryRoles.Open;
    dmUsuarios.qryRoles.First;
    While Not dmUsuarios.qryRoles.Eof Do
    begin
      //ActivaPermiso(TForm(frmClientes), 1000, dmUsuarios.qryRolesID_ROL.Value, 0);//menu principal: 1000 debe estar en la tabla PROCESOS
      dmUsuarios.qryRoles.Next;
    end;
    }
    frmClientes.PageControl1.ActivePageIndex:=0;
    frmClientes.Showmodal;
  finally
  frmClientes.Free;
  frmClientes:=Nil;
  end;
  qryCteLookAct.Close;
  qryCteLookAct.Open;
end;

procedure TFrmFichasVeh.AsignarCte;
begin
end;

procedure TFrmFichasVeh.BitBtn25Click(Sender: TObject);
begin
  if dmVehiculo.tblVehiculo.State in [dsInsert, dsEdit] then
  begin
    dmVehiculo.tblVehiculoCODIGO_CTE_ACT.AsVariant:=null;
  end;
end;

procedure TFrmFichasVeh.BitBtn26Click(Sender: TObject);
begin
  if dmVehiculo.tblVehiculo.State in [dsInsert, dsEdit] then
  begin
    dmVehiculo.tblVehiculoCODIGO_CTE_ANT.AsVariant:=null;
  end;

end;

procedure TFrmFichasVeh.BitBtn24Click(Sender: TObject);
begin
  qryCteLookAct.close;
  qryCteLookAct.open;
  FrmBuscarClientesPersonas:=TFrmBuscarClientesPersonas.Create(nil);
  try
    FrmBuscarClientesPersonas.CodigoCliente := -1;
    if FrmBuscarClientesPersonas.Showmodal = mrOk then
    begin
      if dmVehiculo.tblVehiculo.State in [dsInsert, dsEdit] then
      dmVehiculo.tblVehiculoCODIGO_CTE_ACT.Value:=FrmBuscarClientesPersonas.CodigoCliente;
    end;
  finally
  FrmBuscarClientesPersonas.Free;
  FrmBuscarClientesPersonas:=Nil;
  end;
end;

procedure TFrmFichasVeh.RxDBLookupCombo10Exit(Sender: TObject);
begin
  if (dmVehiculo.tblVehiculo.State = dsInsert) and
  (not dmVehiculo.tblVehiculoCODIGO_CTE_ACT.IsNull) then
  dmVehiculo.tblVehiculoSTATUS_ACTIVO.Value:='6';
end;

end.

