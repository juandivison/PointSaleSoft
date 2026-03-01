unit UFormNominaEmpleado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  db,Dialogs, DBCtrls, StdCtrls, Mask, RXCtrls, RXDBCtrl, Buttons, Grids,
  DBGrids, dbnavE, WinSkinData, Menus, EditNew, ExtCtrls;

type
  TfrmNominaEmpleado = class(TForm)
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
    DBLookupComboBox3: TDBLookupComboBox;
    Label12: TLabel;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    Label9: TLabel;
    DBGrid1: TDBGrid;
    btnNuevo: TBitBtn;
    btnModificar: TBitBtn;
    btnCancelar: TBitBtn;
    BitBtn4: TBitBtn;
    btnRefrescar: TBitBtn;
    BitBtn12: TBitBtn;
    DBStatusLabel3: TDBStatusLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBEdit8: TDBEdit;
    Label10: TLabel;
    DBNavigatorE1: TDBNavigatorE;
    BitBtn3: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    RxSpeedButton1: TRxSpeedButton;
    PopupMenu1: TPopupMenu;
    ComisionDetallada1: TMenuItem;
    ResumenComision1: TMenuItem;
    BitBtn9: TBitBtn;
    SkinData1: TSkinData;
    Label11: TLabel;
    DBEdit9: TDBEdit;
    MainMenu1: TMainMenu;
    Opciones1: TMenuItem;
    Empleados1: TMenuItem;
    BitBtn10: TBitBtn;
    GDias_Trab: TGroupBox;
    Label24: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Bevel2: TBevel;
    Label29: TLabel;
    Label30: TLabel;
    BitBtn11: TBitBtn;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;
    EditN1: TEditN;
    EditN2: TEditN;
    DBEdit10: TDBEdit;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    ActualizarComisiones1: TMenuItem;
    AplicarComisiones1: TMenuItem;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure btnModificarClick(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure ResumenComision1Click(Sender: TObject);
    procedure ComisionDetallada1Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure Empleados1Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure DBEdit6Change(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure EditN2Exit(Sender: TObject);
    procedure EditN1Exit(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure ActualizarComisiones1Click(Sender: TObject);
    procedure AplicarComisiones1Click(Sender: TObject);
    procedure btnRefrescarClick(Sender: TObject);
  private
    { Private declarations }
    procedure ProcCalcularDeducciones;
    procedure ProcFaltante(codEmp : Integer);
    procedure ProcPrestamo;
    procedure ProcActBlcPrestamo;
    Procedure BuscarFechaComision(Var fechaIni,fechaFin:TDateTime);
    procedure ProcIntegrarComision;
    procedure RepComisionXVta(tipo:smallint);
  public
    { Public declarations }
  end;

var
  frmNominaEmpleado: TfrmNominaEmpleado;
  PorcAFP : Currency;
  PorcTSS : Currency;
  CheckExcluir : Boolean;

implementation

uses UFormSelFecha, UDatModNomina, UGlobal, UDatModCompania,
  UDatosComision, UReporteNomina, UReporteSobreNominaEmp, UDatModReportes,
  URepComResVendedor, UFormTipoNomina, UDatModPanaderia, URepNominaGral,
  UEmpleados, UFormParamsRepComTrab, URepComisionTrab, UDatModComisiones,
  URepComisionTrabXVta, URepComisionTrabXVtaRes, UFormPagoComisionesXVta;
  //, URepComision;

{$R *.dfm}

procedure TfrmNominaEmpleado.BitBtn2Click(Sender: TObject);
var
  flag:boolean;
  tipoNomina : Integer;
begin
  dmNomina.qryEmpleados.Close;
  dmNomina.qryEmpleados.Open;
  dmNomina.qryEmpleados.First;
  //if dmNomina.tblNomina.RecordCount > 0 then
  //begin
  //  MessageDlg('Nómina ya fue integrada, verifique', mtInformation, [mbOK], 0);
  //  Exit;
  //end;

  flag:=false;
  frmTipoNomina:=TfrmTipoNomina.Create(nil);
  try
    if frmTipoNomina.Showmodal = mrCancel then
    flag:=true else
    tipoNomina:= frmTipoNomina.xTipoNomina;
  finally
  frmTipoNomina.free;
  frmTipoNomina:=nil;
  end;

  if flag then exit; 

  While Not dmNomina.qryEmpleados.Eof Do
  begin
    if (dmNomina.qryEmpleadosSALARIO.Value = 0)  then
    begin
      dmNomina.qryEmpleados.Next;
      Continue;
    end;
    if (dmNomina.qryEmpleadosSTATUS.Value <> 'A')  then
    begin
      dmNomina.qryEmpleados.Next;
      Continue;
    end;
    if not dmNomina.tblNomina.Locate('CODIGO_EMP',dmNomina.qryEmpleadosCODIGO.Value,[]) then
    begin
      dmNomina.tblNomina.Append;
      dmNomina.tblNominaSTATUS_NOMINA.Value:= 'A';
      dmNomina.tblNominaFECHA_IN.Value := Now;
      dmNomina.tblNominaIDSS.Value:=0;
      dmNomina.tblNominaTSS.Value :=0;
      dmNomina.tblNominaMONTO_AFP.Value:=0;
      dmNomina.tblNominaCOMISION.Value:=0;
      dmNomina.tblNominaCODIGO_EMP.Value   := dmNomina.qryEmpleadosCODIGO.Value;
    end else
    if (dmNomina.tblNominaSTATUS_NOMINA.Value = 'A') then
    begin
      dmNomina.tblNomina.Edit;
      dmNomina.tblNominaCODIGO_USUARIO.Value:= VarUsuarioGlb;
    end else
    begin
      dmNomina.qryEmpleados.Next;
      continue;
    end;
    dmNomina.tblNominaCIA_KEY.Value      := dmCompania.tblCompaniacodigo.Value;
    dmNomina.tblNominaTIPO_NOMINA.Value  := tipoNomina;//2;//Quincenal
    dmNomina.tblNominaFECHA_NOMINA.Value := GlbFechaNomina;

    if (tipoNomina = 1) then //Semanal
    begin
      dmNomina.tblNominaSALARIO_BRUTO.Value:=dmNomina.qryEmpleadosSALARIO.Value / glbDNomina;
      glbTipoNom := 1;
      glbDNomina := 4.33333;
    end else
    if (tipoNomina = 2) then //Quincenal;
    begin
      dmNomina.tblNominaSALARIO_BRUTO.Value:=dmNomina.qryEmpleadosSALARIO.Value / glbDNomina;
      glbTipoNom := 2;
      glbDNomina := 2;
    end else
    if (tipoNomina = 3) then //Semanal;
    begin
      dmNomina.tblNominaSALARIO_BRUTO.Value:=dmNomina.qryEmpleadosSALARIO.Value / glbDNomina;
      glbTipoNom := 3;
      glbDNomina := 1;
    end else
    if (tipoNomina = 4) then //Ocasionales;
    begin
      dmNomina.tblNominaSALARIO_BRUTO.Value:=dmNomina.qryEmpleadosSALARIO.Value / glbDNomina;
      glbTipoNom := 4;
      glbDNomina := 2;
    end;
     //glbTipoNom := 1;
     //glbDNomina := 2;

    dmNomina.tblNominaIDSS.Value := 0;
    dmNomina.tblNominaCOOPERATIVA.Value  := 0;
    dmNomina.tblNominaSEGURO_MEDICO.Value:= 0;
    dmNomina.tblNominaISR.Value          := 0;
    dmNomina.tblNominaOTRAS_DEDUCCIONES.Value:= 0;
    dmNomina.tblNominaCUOTA_PRESTAMO.Value   := 0;
    dmNomina.tblNominaTSS.Value   := 0;
    ProcCalcularDeducciones;
    ProcPrestamo;
    dmNomina.tblNomina.Post;
    dmNomina.tblNomina.ApplyUpdates;
    dmNomina.qryEmpleados.Next;
  end;
  if Not dmNomina.tblNomina.Transaction.InTransaction then
  dmNomina.tblNomina.Transaction.StartTransaction;
  try
    dmNomina.tblNomina.Transaction.CommitRetaining;
  except
  dmNomina.tblNomina.Transaction.RollbackRetaining;
  end;
  try
    ProcIntegrarComision;
  except
  end
end;

//proc_RepComisionTrab
procedure TfrmNominaEmpleado.ProcIntegrarComision;
var
  FechaIni, FechaFin : TDateTime;
begin
  //Actualizar aqui la comision por monto vendido para electronica
  if (GlbTipoComision = 2) and (GlBAyaco =1) then
  begin
    dmnomina.ibstpProcActNomComisiones.Params[0].Value:= glbTipoNom;
    dmnomina.ibstpProcActNomComisiones.Params[1].Value:= glbCia_Key;
    dmnomina.ibstpProcActNomComisiones.Params[2].Value:= ExtraerFecha(GlbFechaNomina);
    dmnomina.ibstpProcActNomComisiones.ExecProc;
    if Not dmnomina.ibstpProcActNomComisiones.Transaction.InTransaction then
    dmnomina.ibstpProcActNomComisiones.Transaction.StartTransaction;
    try
      dmnomina.ibstpProcActNomComisiones.Transaction.CommitRetaining;
    except
    dmnomina.ibstpProcActNomComisiones.Transaction.RollbackRetaining;
    end;
    dmNomina.tblNomina.Close;
    dmNomina.tblNomina.Params[0].Value := GlbCia_Key;
    dmNomina.tblNomina.Params[1].Value := GlbTipoNom;
    dmNomina.tblNomina.Params[2].Value := ExtraerFecha(GlbFechaNomina);
    dmNomina.tblNomina.Open;
    Exit;
  end;
  BuscarFechaComision(FechaIni,FechaFin);
  dmNomina.StpIntegraComisionXVta.Params[0].Value:= FechaFin;   //fechapagod
  dmNomina.StpIntegraComisionXVta.Params[1].Value:= ExtraerFecha(FechaIni);   //fecha ini
  dmNomina.StpIntegraComisionXVta.Params[2].Value:= ExtraerFecha(FechaFin);   //fecha fin
  dmNomina.StpIntegraComisionXVta.Params[3].Value:= VarUsuarioGlb;   //codigo usuario
  dmNomina.StpIntegraComisionXVta.Open;
  dmNomina.StpIntegraComisionXVta.Last;

  if not dmNomina.StpIntegraComisionXVta.Transaction.InTransaction then
  dmNomina.StpIntegraComisionXVta.Transaction.StartTransaction;
  try
    dmNomina.StpIntegraComisionXVta.Transaction.CommitRetaining;
  except
  dmNomina.StpIntegraComisionXVta.Transaction.RollbackRetaining;
  end;

  dmNomina.tblNomina.Close;
  dmNomina.tblNomina.Params[0].Value := GlbCia_Key;
  dmNomina.tblNomina.Params[1].Value := GlbTipoNom;
  dmNomina.tblNomina.Params[2].Value := ExtraerFecha(GlbFechaNomina);
  dmNomina.tblNomina.Open;


  {
  frmDatosRepComisiones:=TfrmDatosRepComisiones.Create(nil);
   try
     //if frmDatosRepComisiones.showmodal = mrok then
     //begin
    frmDatosRepComisiones.orderTipo := 0;
    frmDatosRepComisiones.RadioGroup1.ItemIndex:=1;//por fecha
    frmDatosRepComisiones.dbEditFechaInicial.Date := ExtraerFecha(FechaIni);
    frmDatosRepComisiones.dbEditFechaFinal.Date   := ExtraerFecha(FechaFin);
    frmDatosRepComisiones.chboxExportarPDF.Checked:= False;
    frmDatosRepComisiones.AbrirDatos;
    if dmComision.qryListadoPagoComisiones.RecordCount > 0 then
    begin
    qckRepComisionTrab:=TqckRepComisionTrab.Create(Nil);
    try
    qckRepComisionTrab.labelCretrioRep:=frmDatosRepComisiones.labelCretrioRep;
    qckRepComisionTrab.Preview;
    if frmDatosRepComisiones.chboxExportarPDF.Checked then
    begin
      ReportExport(qckRepComisionTrab,GlbRutaInformes+'\Comisiones'+FormatDateTime('dd-mm-yyyy',dmComision.qryListadoPagoComisionesFecha.Value)+'.pdf');
    end;
    finally
    qckRepComisionTrab.Free;
    qckRepComisionTrab:=nil;
    end;
    end;
    //end;
   finally
   frmDatosRepComisiones.free;
   frmDatosRepComisiones:=nil;
   end;
   }
end;

procedure TfrmNominaEmpleado.ProcCalcularDeducciones;
begin
{
2	AFP
3	SFS
4	ARL
5	INFOTEP

}
  if dmNomina.qryDeducciones.Locate('CODIGO_DESCUENTO', 2, []) then //Afp
  if dmNomina.qryEmpleadosPAGA_AFP.Value = 1 then
  begin
    PorcAFP :=dmNomina.qryDeduccionesPORCIENTO_EMP.Value;
    dmNomina.tblNominaMONTO_AFP.Value  := dmNomina.tblNominaSALARIO_BRUTO.Value *
                                          dmNomina.qryDeduccionesPORCIENTO_EMP.Value / 100;
  end else dmNomina.tblNominaMONTO_AFP.Value := 0;

   if dmNomina.qryDeducciones.Locate('CODIGO_DESCUENTO', 3, []) then //SFS
  if dmNomina.qryEmpleadosPAGA_TSS.Value = 1 then
  begin
    PorcTSS :=dmNomina.qryDeduccionesPORCIENTO_EMP.Value;
    dmnomina.qryListaDependienteEmp.Close;
    dmnomina.qryListaDependienteEmp.Params[0].Value:= ExtraerFecha(GlbFechaNomina);
    dmnomina.qryListaDependienteEmp.Params[1].Value:= dmNomina.tblNominaCODIGO_EMP.Value;
    dmnomina.qryListaDependienteEmp.Open;
    dmNomina.tblNominaTSS.Value  := dmNomina.tblNominaSALARIO_BRUTO.Value *
                                    dmNomina.qryDeduccionesPORCIENTO_EMP.Value / 100;
    dmnomina.qryListaDependienteEmp.First;
    dmNomina.tblNominaSFS_DEPENDIENTES.Value  := 0;
    dmNomina.tblNominaSFS_COMPLEMENTARIO.Value:= 0;
    While Not dmnomina.qryListaDependienteEmp.Eof do
    begin
      if (dmnomina.qryListaDependienteEmpMONTO_DEPENDIENTE.Value > 0) then
      dmNomina.tblNominaSFS_DEPENDIENTES.Value:=
      dmNomina.tblNominaSFS_DEPENDIENTES.Value + dmnomina.qryListaDependienteEmpMONTO_DEPENDIENTE.Value;
      dmNomina.tblNominaSFS_COMPLEMENTARIO.Value:=
      dmNomina.tblNominaSFS_COMPLEMENTARIO.Value +
      dmnomina.qryListaDependienteEmpMONTO_COMPLEMENTARIOASEGURADO.Value +
      dmnomina.qryListaDependienteEmpMONTO_COMPLEMENTARIODEPENDIENTE.Value;
      dmnomina.qryListaDependienteEmp.Next;
    end;
    dmNomina.tblNominaTSS.Value := dmNomina.tblNominaTSS.Value +
    dmNomina.tblNominaSFS_DEPENDIENTES.Value +
    dmNomina.tblNominaSFS_COMPLEMENTARIO.Value;

  end;
end;

procedure TfrmNominaEmpleado.FormCreate(Sender: TObject);
begin
  dmCompania.tblCompania.Close;
  dmCompania.tblCompania.Open;
  dmCompania.tblCompania.Locate('CODIGO',GlbCodigoCia,[]);
  dmNomina.tblNomina.Close;
  dmNomina.tblNomina.Params[0].Value := GlbCia_Key;
  dmNomina.tblNomina.Params[1].Value := GlbTipoNom;
  dmNomina.tblNomina.Params[2].Value := ExtraerFecha(GlbFechaNomina);
  dmNomina.tblNomina.Open;
  
  dmNomina.qryDeducciones.Close;
  dmNomina.qryDeducciones.Params[0].Value:= ExtraerFecha(GlbFechaNomina);
  dmNomina.qryDeducciones.Open;
  if (dmNomina.qryDeducciones.RecordCount = 0) then
  begin
    MessageDlg('Debe configurar opciones de descuento para nómina.', mtWarning,[mbok],0);
  end;
  dmNomina.tblPrestamo.Close;
  dmNomina.tblPrestamo.Open;
  dmNomina.qryEmpleados.Close;
  dmNomina.qryEmpleados.Open;
end;

procedure TfrmNominaEmpleado.ProcPrestamo;
begin
  if dmNomina.tblPrestamo.Locate('CODIGO_EMP', dmNomina.tblNominaCODIGO_EMP.Value,[]) then
  begin
    if dmNomina.tblPrestamoMONTO_PAGADO.Value < dmNomina.tblPrestamoMONTO_PRESTAMO.Value then
    dmNomina.tblNominaCUOTA_PRESTAMO.Value:=dmNomina.tblPrestamoMONTO_PRESTAMO.Value / dmNomina.tblPrestamoCUOTAS.Value;
  end else
  dmNomina.tblNominaCUOTA_PRESTAMO.Value:= 0;
end;

procedure TfrmNominaEmpleado.BitBtn4Click(Sender: TObject);
begin
  if dmNomina.tblNomina.State in [dsEdit, dsInsert] then
  begin
    dmNomina.tblNomina.Post;
    dmNomina.tblNomina.ApplyUpdates;
    if Not dmNomina.tblNomina.Transaction.InTransaction then
          dmNomina.tblNomina.Transaction.StartTransaction;
    try
      dmNomina.tblNomina.Transaction.CommitRetaining;
    except
    dmNomina.tblNomina.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmNominaEmpleado.BitBtn3Click(Sender: TObject);
begin
  dmnomina.qryEscalaISR.Close;// ibstpAplicaISR
  dmnomina.qryEscalaISR.Params[0].Value:=ExtraerFecha(GlbFechaTrnDiaria);
  dmnomina.qryEscalaISR.Open;

  dmNomina.tblNomina.First;
  While Not dmNomina.tblNomina.Eof Do
  begin

    if dmNomina.tblNominaSTATUS_NOMINA.Value = 'A' then
    begin
      dmNomina.tblNomina.Edit;
      ProcCalcularDeducciones;
      ProcPrestamo;
      ProcFaltante(dmNomina.tblNominaCODIGO_EMP.Value);

      BitBtn4Click(Self);
    end;
    dmNomina.tblNomina.Next;
  end;
  dmNomina.qryDeducciones.Close;
  dmNomina.qryDeducciones.Open;
  if dmNomina.qryDeducciones.Locate('CODIGO_DESCUENTO', 2, []) then //Afp
  PorcAFP :=dmNomina.qryDeduccionesPORCIENTO_EMP.Value;

  if dmNomina.qryDeducciones.Locate('CODIGO_DESCUENTO', 3, []) then //SFS
  PorcTSS :=dmNomina.qryDeduccionesPORCIENTO_EMP.Value;

  dmnomina.ibstpAplicaISR.Params[8].Value:= glbCia_Key;
  dmnomina.ibstpAplicaISR.Params[9].Value:= glbTipoNom;
  dmnomina.ibstpAplicaISR.Params[10].Value:= ExtraerFecha(GlbFechaNomina);
  dmnomina.ibstpAplicaISR.Params[11].Value:= dmnomina.qryEscalaISRR1.Value;
  dmnomina.ibstpAplicaISR.Params[12].Value:= dmnomina.qryEscalaISRR2.Value;
  dmnomina.ibstpAplicaISR.Params[13].Value:= dmnomina.qryEscalaISRR3.Value;
  dmnomina.ibstpAplicaISR.Params[14].Value:= PorcAFP;
  dmnomina.ibstpAplicaISR.Params[15].Value:= PorcTSS;
  dmnomina.ibstpAplicaISR.ExecProc;
  if Not dmnomina.ibstpAplicaISR.Transaction.InTransaction then
  dmnomina.ibstpAplicaISR.Transaction.StartTransaction;
  try
    dmnomina.ibstpAplicaISR.Transaction.CommitRetaining;
  except
  dmnomina.ibstpAplicaISR.Transaction.RollbackRetaining;
  end;

  dmnomina.ibstpProcActNomTotales.Params[0].Value:= glbTipoNom;
  dmnomina.ibstpProcActNomTotales.Params[1].Value:= glbCia_Key;
  dmnomina.ibstpProcActNomTotales.Params[2].Value:= ExtraerFecha(GlbFechaNomina);
  dmnomina.ibstpProcActNomTotales.ExecProc;
  if Not dmnomina.ibstpProcActNomTotales.Transaction.InTransaction then
  dmnomina.ibstpProcActNomTotales.Transaction.StartTransaction;
  try
    dmnomina.ibstpProcActNomTotales.Transaction.CommitRetaining;
  except
  dmnomina.ibstpProcActNomTotales.Transaction.RollbackRetaining;
  end;
end;

procedure TfrmNominaEmpleado.BuscarFechaComision(var FechaIni,  FechaFin: TDateTime);
begin
  dmNomina.tblControl.Close;
  dmNomina.tblControl.Params[1].Value:=5;//Comisiones
  dmNomina.tblControl.Params[0].Value:=5;//Comisiones
  dmNomina.tblControl.Open;
  FechaIni := ExtraerFecha(dmNomina.tblControlFECHA_ACT.Value+1);
  FechaFin := ExtraerFecha(GlbFechaNomina);
  dmNomina.tblControl.Close;
end;

procedure TfrmNominaEmpleado.BitBtn6Click(Sender: TObject);
var
  FechaIni, FechaFin : TDatetime;
  Suma:Real;
begin
  BuscarFechaComision(FechaIni,FechaFin);
  frmDatosComision:=TfrmDatosComision.Create(nil);
  try
    frmDatosComision.QryDatosComsionxVenta.close;
    frmDatosComision.QryDatosComsionxVenta.Params[0].Value:= 0;
    frmDatosComision.QryDatosComsionxVenta.Params[1].Value:= 1000;
    frmDatosComision.QryDatosComsionxVenta.Params[2].Value:= ExtraerFecha(FechaIni);
    frmDatosComision.QryDatosComsionxVenta.Params[3].Value:= ExtraerFecha(FechaFin);
    frmDatosComision.QryDatosComsionxVenta.Open;
    frmDatosComision.Label2.Caption := FormatDatetime('dd-mmm-yyyy',FechaIni) + ' al '+
                                       FormatDatetime('dd-mmm-yyyy',FechaFin);
    frmDatosComision.Showmodal;
  finally
  frmDatosComision.Free;
  frmDatosComision:=Nil;
  end;
end;

procedure TfrmNominaEmpleado.BitBtn1Click(Sender: TObject);
begin
 glbCheckNomina := 3;
 dmNomina.QryRepNomGral.Close;
 dmNomina.QryRepNomGral.Params[0].value := glbCia_Key;
 dmNomina.QryRepNomGral.Params[1].value := glbTipoNom;
 dmNomina.QryRepNomGral.Params[2].value := glbFechaNom;
 dmNomina.QryRepNomGral.Open;
 if dmNomina.QryRepNomGral.recordcount = 0 then
 raise Exception.Create('No hay datos');
  QckRepNominaGral:=TQckRepNominaGral.Create(nil);
  try
    if MessageDlg('Imprimir?',mtinformation,[mbyes,mbno],0)=mryes then
    begin
    QckRepNominaGral.PrinterSetup;
    QckRepNominaGral.Print;
    end else
    QckRepNominaGral.Preview;
  finally
  QckRepNominaGral.free;
  QckRepNominaGral:=nil;
  end;

  {

  dmNomina.qryRepNomina.Close;
  dmNomina.qryRepNomina.Params[0].Value:=GlbFechaNomina;
  dmNomina.qryRepNomina.Open;
  qckRepNomina:=TqckRepNomina.Create(Nil);
  try
    if dmNomina.qryRepNominaSTATUS_NOMINA.Value = 'A' then
    qckRepNomina.QRLabel11.caption:='Preliminar' else
    if dmNomina.qryRepNominaSTATUS_NOMINA.Value = 'R' then    
    qckRepNomina.QRLabel11.caption:='Definitiva' else
    qckRepNomina.QRLabel11.caption:='Status nomina sin definir';
    qckRepNomina.Preview;
  finally
  qckRepNomina.Free;
  qckRepNomina:=Nil;
  end;  }
end;

procedure TfrmNominaEmpleado.BitBtn7Click(Sender: TObject);
begin
  if MessageDlg('Continuar con posteo de nómina?',mtInformation, [mbYes,mbNo], 0) = mrNo then
  exit;

  dmNomina.tblControl.Close;
  dmNomina.tblControl.Params[1].Value:=5;//Comisiones
  dmNomina.tblControl.Params[0].Value:=5;//Comisiones
  dmNomina.tblControl.Open;
  dmNomina.tblControl.Edit;
  if  ExtraerFecha(GlbFechaNomina) < dmNomina.tblControlFECHA_ACT.Value then
  begin
    MessageDlg('Nómina no puede ser posteada, verifique',mtInformation, [mbOK], 0);
    Exit;
  end;
  dmNomina.tblControlFECHA_ACT.Value:= ExtraerFecha(GlbFechaNomina);
  dmNomina.tblControl.Post;
  dmNomina.tblControl.ApplyUpdates;
  dmNomina.tblControl.Close;
  dmNomina.tblControl.Params[0].Value:= 5;//nomina
  dmNomina.tblControl.Params[1].Value:= 1;//
  dmNomina.tblControl.Open;
  dmNomina.tblControl.Edit;
  dmNomina.tblControlFECHA_ACT.Value:= ExtraerFecha(GlbFechaNomina);
  GlbSalvarQuery(dmNomina.tblControl);
  dmNomina.tblTipoNomina.close;
  dmNomina.tblTipoNomina.open;
  if dmNomina.tblTipoNomina.Locate('CODIGO',dmNomina.tblNominaTIPO_NOMINA.Value,[]) then
  begin
    dmNomina.tblTipoNomina.Edit;
    dmNomina.tblTipoNominaULT_FECHA_NOM.Value:= ExtraerFecha(GlbFechaNomina);
    dmNomina.tblTipoNomina.Post;
    dmNomina.tblTipoNomina.ApplyUpdates;
    if not dmNomina.tblTipoNomina.Transaction.InTransaction then
    dmNomina.tblTipoNomina.Transaction.StartTransaction;
    try
      dmNomina.tblTipoNomina.Transaction.CommitRetaining;
    except
    dmNomina.tblTipoNomina.Transaction.RollbackRetaining;
    end;
  end;
  dmNomina.tblControl.Close;
  dmnomina.tblNomina.First;
  ProcActBlcPrestamo;
  
  dmnomina.tblNomina.First;
  
  While Not dmnomina.tblNomina.Eof do
  begin
    dmnomina.tblNomina.Edit;
    dmnomina.tblNominaSTATUS_NOMINA.Value := 'R';
    BitBtn4Click(Self);
    dmnomina.tblNomina.next;
  end;
end;

procedure TfrmNominaEmpleado.btnModificarClick(Sender: TObject);
begin
  if dmNomina.tblNomina.State In [dsBrowse] then
  begin
    if dmNomina.tblNominaSTATUS_NOMINA.Value ='A' then
    dmNomina.tblNomina.Edit else
    if dmNomina.tblNominaSTATUS_NOMINA.Value = 'R' then
    MessageDlg('NOMINA FUE POSTEADA, VERIFIQUE',mtError, [mbOK], 0);
  end;
end;

procedure TfrmNominaEmpleado.BitBtn8Click(Sender: TObject);
begin
  dmNomina.qryRepNomina.Close;
  dmNomina.qryRepNomina.Params[0].Value:=GlbFechaNomina;
  dmNomina.qryRepNomina.Open;

  qckSobrePagoNomina:=tqckSobrePagoNomina.Create(nil);
  try
    if dmNomina.qryRepNominaSTATUS_NOMINA.Value = 'A' then
    qckSobrePagoNomina.QRLabel11.caption       := 'Preliminar' else
    if dmNomina.qryRepNominaSTATUS_NOMINA.Value = 'R' then
    qckSobrePagoNomina.QRLabel11.caption       := 'Definitiva' else
    qckSobrePagoNomina.QRLabel11.caption       := 'Status nómina sin definir';
    qckSobrePagoNomina.Preview;
  finally
  qckSobrePagoNomina.Free;
  qckSobrePagoNomina:=Nil;
  end;
end;

procedure TfrmNominaEmpleado.ResumenComision1Click(Sender: TObject);
var
  FechaIni, FechaFin : TDatetime;
  Suma:Real;
begin
  if GlbTipoComision = 2 then
  begin
    RepComisionXVta(2);
  end else
  begin
    BuscarFechaComision(FechaIni,FechaFin);
    dmReportes.qryRepComResXEmp.Close;
    dmReportes.qryRepComResXEmp.Params[0].Value:=0;
    dmReportes.qryRepComResXEmp.Params[1].Value:=1000;
    dmReportes.qryRepComResXEmp.Params[2].Value:=ExtraerFecha(FechaIni);
    dmReportes.qryRepComResXEmp.Params[3].Value:=ExtraerFecha(FechaFin);
    dmReportes.qryRepComResXEmp.Open;

    qckRepResComVendedor:=TqckRepResComVendedor.Create(Nil);
    try
      qckRepResComVendedor.Preview;
    finally
    qckRepResComVendedor.Free;
    qckRepResComVendedor:=Nil;
    end;
  end;
end;

procedure TfrmNominaEmpleado.ComisionDetallada1Click(Sender: TObject);
var
  FechaIni, FechaFin : TDatetime;
  Suma:Real;
begin
  if (GlbTipoComision = 2) and (GlbAyaco = 1) then  //comision fija por cantidad vendida
  begin
    MessageDlg('En construcción.',mtinformation,[mbok],0);
    exit;
  end else
  if GlbTipoComision = 2 then  //comision fija por cantidad vendida
  begin
    RepComisionXVta(1);
  end else
  begin
    BuscarFechaComision(FechaIni,FechaFin);
    dmReportes.QryDatosComsionxVenta.Close;
    dmReportes.QryDatosComsionxVenta.Params[0].Value:=0;
    dmReportes.QryDatosComsionxVenta.Params[1].Value:=1000;
    dmReportes.QryDatosComsionxVenta.Params[2].Value:=ExtraerFecha(FechaIni);
    dmReportes.QryDatosComsionxVenta.Params[3].Value:=ExtraerFecha(FechaFin);
    dmReportes.QryDatosComsionxVenta.Open;
  end;
  {qckRepComision:=TqckRepComision.Create(Nil);
  try
    qckRepComision.Preview;
  finally
  qckRepComision.Free;
  qckRepComision:=Nil;
  end;}
end;

procedure TfrmNominaEmpleado.ProcFaltante(codEmp : Integer);
var
  FechaIni, FechaFin : TDatetime;
  Suma:Real;
begin
  BuscarFechaComision(FechaIni,FechaFin);
  dmReportes.qryDatosFaltante.Close;
  dmReportes.qryDatosFaltante.Params[0].Value:= ExtraerFecha(FechaIni);
  dmReportes.qryDatosFaltante.Params[1].Value:= ExtraerFecha(FechaFin);
  dmReportes.qryDatosFaltante.Params[2].Value:= CodEmp;
  dmReportes.qryDatosFaltante.Params[3].Value:= CodEmp;
  dmReportes.qryDatosFaltante.Open;
  dmReportes.qryDatosFaltante.First;
  Suma:=0;
  While not dmReportes.qryDatosFaltante.Eof do
  begin
    Suma := Suma + dmReportes.qryDatosFaltanteDiferencia.Value;
    dmReportes.qryDatosFaltante.Next;
  end;
  if Suma < 0 then
  Suma:=Suma * -1;
  dmNomina.tblNominaOTRAS_DEDUCCIONES.Value := Suma;
end;

procedure TfrmNominaEmpleado.ProcActBlcPrestamo;
begin
  dmNomina.tblNomina.First;
  While Not dmNomina.tblNomina.Eof do
  begin
    if dmNomina.tblPrestamo.Locate('CODIGO_EMP', dmNomina.tblNominaCODIGO_EMP.Value,[]) then
    begin
      dmNomina.tblPrestamo.Edit;
      if dmNomina.tblPrestamoMONTO_PAGADO.IsNull then
      dmNomina.tblPrestamoMONTO_PAGADO.Value := 0;
      if (dmNomina.tblPrestamoStatus.Value = 'A') then
      dmNomina.tblPrestamoMONTO_PAGADO.Value :=
      dmNomina.tblPrestamoMONTO_PAGADO.Value  +  dmNomina.tblNominaCUOTA_PRESTAMO.Value;
      if (dmNomina.tblPrestamoMONTO_PAGADO.Value   = dmNomina.tblPrestamoMONTO_PRESTAMO.Value) then
      dmNomina.tblPrestamoStatus.Value            := 'R';
      dmNomina.tblPrestamoFECHA_ULTIMO_PAGO.Value := ExtraerFecha(dmNomina.tblNominaFECHA_NOMINA.Value);
      dmNomina.tblPrestamoFECHA_MOD.Value         := Now;
      dmNomina.tblPrestamoMOD_POR.Value           := StrUserName; 
      dmNomina.tblPrestamo.Post;
    end;
    dmNomina.tblNomina.Next;
  end;

  dmNomina.tblPrestamo.ApplyUpdates;
  if Not dmNomina.tblPrestamo.Transaction.InTransaction then
  dmNomina.tblPrestamo.Transaction.StartTransaction;
  try
    dmNomina.tblPrestamo.Transaction.CommitRetaining;
  except
  dmNomina.tblPrestamo.Transaction.RollbackRetaining;
  end;
end;

procedure TfrmNominaEmpleado.BitBtn9Click(Sender: TObject);
var
  FechaIni, FechaFin : TDatetime;
  Suma:Real;
begin
  if dmNomina.tblNomina.State = dsInactive then exit;
  //MessageDlg('',mtWarning,[mbok],0);
  ProcFechaIniComNomina(FechaIni);
  if Not Assigned(dmPanaderia) then
  dmPanaderia:=TdmPanaderia.Create(Nil);
  
  dmPanaderia.stpProcIntegrarPanProd.Close;
  dmPanaderia.QryProcIntegrarPanProd.Params[0].Value:= ExtraerFecha(FechaIni);
  dmPanaderia.QryProcIntegrarPanProd.Params[1].Value:= ExtraerFecha(dmNomina.tblNominaFECHA_NOMINA.Value);
  dmPanaderia.QryProcIntegrarPanProd.Params[2].Value:= dmNomina.tblNominaCIA_KEY.Value;
  dmPanaderia.QryProcIntegrarPanProd.Params[3].Value:= dmNomina.tblNominaTIPO_NOMINA.Value;
  dmPanaderia.QryProcIntegrarPanProd.Open;
  dmPanaderia.QryProcIntegrarPanProd.First;

  While not dmPanaderia.QryProcIntegrarPanProd.Eof do
  begin
    if dmNomina.tblNomina.Locate('CODIGO_EMP',dmPanaderia.QryProcIntegrarPanProdCOD_EMPLEADO.Value,[]) then
    begin
      dmNomina.tblNomina.Edit;
      dmNomina.tblNominaOTROS_INGRESOS.Value := dmPanaderia.QryProcIntegrarPanProdMONTOPAGAR.Value;
    end;
    BitBtn4Click(Self);
    dmPanaderia.QryProcIntegrarPanProd.Next;
  end;

  if Assigned(dmPanaderia) then
  begin
    dmPanaderia.Free;
    dmPanaderia:=Nil;
  end;
end;

procedure TfrmNominaEmpleado.Empleados1Click(Sender: TObject);
begin
  frmEmpleados:=TfrmEmpleados.Create(nil);
  try
    frmEmpleados.Showmodal;
  finally
  frmEmpleados.Free;
  frmEmpleados:=Nil;
  end;
  dmNomina.qryEmpleados.Close;
  dmNomina.qryEmpleados.Open;  
end;

procedure TfrmNominaEmpleado.BitBtn10Click(Sender: TObject);
begin
  CheckExcluir := False;
  GDias_Trab.Caption := 'Incluir/Excluir Personal';
  DbEdit10.Visible := True;
  EditN1.Visible := True;
  Label24.Visible := True;
  Label39.Visible := True;
  Label29.Visible := True;
  Label30.Visible := True;
  Label38.Visible := True;
  Label40.Visible := True;
  GDias_Trab.Visible := True;
  EditN2.Setfocus;
end;

procedure TfrmNominaEmpleado.BitBtn11Click(Sender: TObject);
begin
  GDias_Trab.Visible := False;
  dmNomina.tblNomina.Locate('CODIGO_EMP', EditN2.Text,[]);
  if CheckExcluir = false Then
     Begin
       btnModificarClick(sender);
       dmNomina.tblNominaSALARIO_BRUTO.Value := dmNomina.tblNominaDiasTrab.Value;
       //dmNomina.tblNominaSALARIO_NETO.Value := (dmNomina.tblNominaSALARIO_BRUTO.Value + dmNomina.tblNominaOtros_Ingresos.Value) -
       //(dmNomina.tblNominaOtras_Deducciones.Value + dmNomina.tblNominaCooperativa.Value + dmNomina.tblNominaBMI.Value + dmNomina.tblNominaISR.Value + dmNomina.tblNominaIDSS.Value);
       ProcCalcularDeducciones;
       BitBtn4Click(sender);
     End
  Else
  if CheckExcluir = True Then
     Begin
       btnModificarClick(Sender);
       if dmNomina.tblNominaSTATUS_NOMINA.Value = 'A' Then
          dmNomina.tblNominaSTATUS_NOMINA.Value := 'E'
       Else dmNomina.tblNominaSTATUS_NOMINA.Value := 'A';
       BitBtn4Click(Sender);
       DBEdit6Change(Sender);
     End;
end;

procedure TfrmNominaEmpleado.DBEdit6Change(Sender: TObject);
begin
  if dmNomina.tblNominaSTATUS_NOMINA.Value = 'A' Then
     Begin
       if not dmNomina.tblNomina.Filtered then
       begin
         Label14.Caption := 'Activo';
         Label14.Color := clBtnFace;
         Label14.Font.Size := 10;
       end;
     End
  Else
  if dmNomina.tblNominaSTATUS_NOMINA.Value = 'E' Then
     Begin
       Label14.Caption := 'Excluido';
       Label14.Color := clRed;
       Label14.Font.Size := 10;
     End
  Else
  if dmNomina.tblNominaSTATUS_NOMINA.Value = 'P' Then
     Begin
       Label14.Caption := 'Procesado';
       Label14.Color := clGreen;
       Label14.Font.Size := 10;
     End;
end;

procedure TfrmNominaEmpleado.btnCancelarClick(Sender: TObject);
begin
  if dmNomina.tblNomina.State In [dsEdit] Then
  begin
    dmNomina.tblNomina.Cancel;
  end;
end;

procedure TfrmNominaEmpleado.EditN2Exit(Sender: TObject);
begin
  if (EditN2.Text = '') then Exit;
  if Not DmNomina.tblNomina.Locate('Codigo_emp',EditN2.Text,[]) Then
  begin
     MessageDlg('Codigo Empleado No Existe, Verifique',mtWarning,[mbOk],0);
  end;
end;

procedure TfrmNominaEmpleado.EditN1Exit(Sender: TObject);
begin
  DmNomina.tblNomina.Locate('Codigo_emp',EditN2.Text,[])
end;

procedure TfrmNominaEmpleado.BitBtn14Click(Sender: TObject);
begin
  GDias_Trab.Visible := False;
end;

procedure TfrmNominaEmpleado.BitBtn5Click(Sender: TObject);
begin
  CheckExcluir := True;
  GDias_Trab.Caption := 'Incluir/Excluir Personal';
  DbEdit10.Visible := False;
  EditN1.Visible := False;
  Label24.Visible := False;
  Label39.Visible := False;
  Label29.Visible := False;
  Label30.Visible := False;
  Label38.Visible := False;
  Label40.Visible := False;
  GDias_Trab.Visible := True;
  EditN2.Text := dmNomina.tblPrestamoCODIGO_EMP.AsString; 
  EditN2.Setfocus;
end;

procedure TfrmNominaEmpleado.RepComisionXVta(tipo:smallint);
var
  FechaIni, FechaFin : TDateTime;
begin
  BuscarFechaComision(FechaIni,FechaFin);
  dmNomina.StpIntegraComisionXVta.Params[0].Value:= GlbFechaNomina;   //fechapagod
  dmNomina.StpIntegraComisionXVta.Params[1].Value:= ExtraerFecha(FechaIni);   //fecha ini
  dmNomina.StpIntegraComisionXVta.Params[2].Value:= ExtraerFecha(FechaFin);   //fecha fin
  dmNomina.StpIntegraComisionXVta.Params[3].Value:= VarUsuarioGlb;   //codigo usuario
  dmNomina.StpIntegraComisionXVta.Open;
  dmNomina.StpIntegraComisionXVta.Last;
  frmDatosRepComisiones:=TfrmDatosRepComisiones.Create(nil);
   try
     //if frmDatosRepComisiones.showmodal = mrok then
     //begin
    frmDatosRepComisiones.orderTipo := 0;
    frmDatosRepComisiones.RadioGroup1.ItemIndex:=1;//por fecha
    frmDatosRepComisiones.dbEditFechaInicial.Date := ExtraerFecha(FechaIni);
    frmDatosRepComisiones.dbEditFechaFinal.Date   := ExtraerFecha(FechaFin);
    frmDatosRepComisiones.chboxExportarPDF.Checked:= False;
    frmDatosRepComisiones.AbrirDatos;
    if dmComision.qryListadoPagoComisiones.RecordCount > 0 then
    begin
      if tipo = 1 then
      begin
        qckRepComisionTrabXVta:=TqckRepComisionTrabXVta.Create(Nil);
        try
          qckRepComisionTrabXVta.labelCretrioRep:=frmDatosRepComisiones.labelCretrioRep;
          qckRepComisionTrabXVta.Preview;
          if frmDatosRepComisiones.chboxExportarPDF.Checked then
          begin
            ReportExport(qckRepComisionTrabXVta,GlbRutaInformes+'\Comisiones'+FormatDateTime('dd-mm-yyyy',dmComision.qryListadoPagoComisionesFecha.Value)+'.pdf');
          end;
        finally
        qckRepComisionTrabXVta.Free;
        qckRepComisionTrabXVta:=nil;
        end;
      end else
      if tipo = 2 then
      begin
        qckRepComisionTrabXVtaRes:=TqckRepComisionTrabXVtaRes.Create(Nil);
        try
          qckRepComisionTrabXVtaRes.labelCretrioRep:=frmDatosRepComisiones.labelCretrioRep;
          qckRepComisionTrabXVtaRes.Preview;
          if frmDatosRepComisiones.chboxExportarPDF.Checked then
          begin
            ReportExport(qckRepComisionTrabXVtaRes,GlbRutaInformes+'\Comisiones'+FormatDateTime('dd-mm-yyyy',dmComision.qryListadoPagoComisionesFecha.Value)+'.pdf');
          end;
        finally
        qckRepComisionTrabXVtaRes.Free;
        qckRepComisionTrabXVtaRes:=Nil;
        end;
      end;
    end else MessageDlg('No hay datos de comisión para rango fecha nómina.',mtInformation,[mbok],0);
    //end;
   finally
   frmDatosRepComisiones.Free;
   frmDatosRepComisiones:=Nil;
   end;
end;

procedure TfrmNominaEmpleado.ActualizarComisiones1Click(Sender: TObject);
begin
  frmPagoComisiones:=TfrmPagoComisiones.Create(Nil);
  try
    frmPagoComisiones.Showmodal;
  finally
  frmPagoComisiones.Free;
  frmPagoComisiones:=Nil;
  end;
end;

procedure TfrmNominaEmpleado.AplicarComisiones1Click(Sender: TObject);
begin
  try
    ProcIntegrarComision;
  except
  end
end;

procedure TfrmNominaEmpleado.btnRefrescarClick(Sender: TObject);
begin
  dmNomina.tblNomina.Close;
  dmNomina.tblNomina.Open;
end;

end.
