unit UFormNominaEmpleado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  db,Dialogs, DBCtrls, StdCtrls, Mask, RXCtrls, RXDBCtrl, Buttons, Grids,
  DBGrids, dbnavE, WinSkinData, Menus;

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
    SkinData1: TSkinData;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    RxSpeedButton1: TRxSpeedButton;
    PopupMenu1: TPopupMenu;
    ComisionDetallada1: TMenuItem;
    ResumenComision1: TMenuItem;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure btnModificarClick(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure ResumenComision1Click(Sender: TObject);
    procedure ComisionDetallada1Click(Sender: TObject);
  private
    { Private declarations }
    procedure ProcCalcularDeducciones;
    procedure ProcFaltante(codEmp : Integer);
    procedure ProcPrestamo;
    procedure ProcActBlcPrestamo;
    Procedure BuscarFechaComision(Var fechaIni,fechaFin:TDateTime); 
  public
    { Public declarations }
  end;

var
  frmNominaEmpleado: TfrmNominaEmpleado;

implementation

uses UFormSelFecha, UDatModNomina, UGlobal, UDatModCompania,
  UDatosComision, UReporteNomina, UReporteSobreNominaEmp, UDatModReportes,
  URepComision, URepComResVendedor, UFormTipoNomina;

{$R *.dfm}

procedure TfrmNominaEmpleado.BitBtn2Click(Sender: TObject);
var
  flag:boolean;
  tipoNomina : Integer;
begin
  dmNomina.qryEmpleados.Close;
  dmNomina.qryEmpleados.Open;
  dmNomina.qryEmpleados.First;
  if dmNomina.tblNomina.RecordCount > 0 then
  begin
    MessageDlg('Nómina ya fue integrada, verifique', mtInformation, [mbOK], 0);
    Exit;
  end;
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

    dmNomina.tblNomina.Insert;
    dmNomina.tblNominaCODIGO_EMP.Value   := dmNomina.qryEmpleadosCODIGO.Value;
    dmNomina.tblNominaCIA_KEY.Value      := dmCompania.tblCompaniacodigo.Value;
    dmNomina.tblNominaTIPO_NOMINA.Value  := tipoNomina;//1;//Quincenal
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

    dmNomina.tblNominaFECHA_IN.Value := Now;
    dmNomina.tblNominaCODIGO_USUARIO.Value:= VarUsuarioGlb;
    ProcCalcularDeducciones;
    dmNomina.tblNominaIDSS.Value := 0;
    dmNomina.tblNominaCOOPERATIVA.Value  := 0;
    dmNomina.tblNominaSEGURO_MEDICO.Value:= 0;
    dmNomina.tblNominaISR.Value          := 0;
    dmNomina.tblNominaOTRAS_DEDUCCIONES.Value:= 0;
    dmNomina.tblNominaCUOTA_PRESTAMO.Value   := 0;
    dmNomina.tblNominaTSS.Value   := 0;
    dmNomina.tblNominaSTATUS_NOMINA.Value:= 'A';
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
end;

procedure TfrmNominaEmpleado.ProcCalcularDeducciones;
begin                                                 //Afp
  if dmNomina.qryDeducciones.Locate('CODIGO_DESCUENTO', 2, []) then
  if dmNomina.qryEmpleadosPAGA_AFP.Value = 1 then
  begin
    dmNomina.tblNominaMONTO_AFP.Value  := dmNomina.tblNominaSALARIO_BRUTO.Value *
                                          dmNomina.qryDeduccionesPORCIENTO_EMP.Value / 100;
  end else dmNomina.tblNominaMONTO_AFP.Value := 0;
end;

procedure TfrmNominaEmpleado.FormCreate(Sender: TObject);
begin
  dmNomina.tblNomina.Close;
  dmNomina.tblNomina.Params[0].Value:=ExtraerFecha(GlbFechaNomina);
  dmNomina.tblNomina.Open;
  dmNomina.qryDeducciones.Close;
  dmNomina.qryDeducciones.Params[0].Value:= ExtraerFecha(GlbFechaNomina);
  dmNomina.qryDeducciones.Open;
  if (dmNomina.qryDeducciones.RecordCount = 0) then
  begin
    MessageDlg('Debe configurar opciones de descuento para nomina.', mtWarning,[mbok],0);
  end;
  dmNomina.tblPrestamo.Close;
  dmNomina.tblPrestamo.Open;
  dmNomina.qryEmpleados.Close;
  dmNomina.qryEmpleados.Open;
end;

procedure TfrmNominaEmpleado.ProcPrestamo;
begin
  if dmNomina.tblPrestamo.Locate('CODIGO_EMP',dmNomina.tblNominaCODIGO_EMP.Value,[]) then
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
end;

procedure TfrmNominaEmpleado.BuscarFechaComision(var FechaIni,  FechaFin: TDateTime);
begin
  dmNomina.tblControl.Close;
  dmNomina.tblControl.Params[1].Value:=5;//Comisiones
  dmNomina.tblControl.Params[0].Value:=5;//Comisiones
  dmNomina.tblControl.Open;
  FechaIni := ExtraerFecha(dmNomina.tblControlFECHA_ACT.Value)+1;
  FechaFin := ExtraerFecha(GlbFechaNomina);
  dmNomina.tblControl.Close;
end;

procedure TfrmNominaEmpleado.BitBtn5Click(Sender: TObject);
var
  FechaIni, FechaFin : TDatetime;
  Suma:Real;
begin
  ProcFechaIniComNomina(FechaIni);
  dmNomina.tblNomina.First;
  While Not dmNomina.tblNomina.Eof do
  begin
    dmNomina.qryDatosComision.Close;
    dmNomina.qryDatosComision.Params[0].Value:= dmNomina.tblNominaCODIGO_EMP.Value;
    dmNomina.qryDatosComision.Params[1].Value:= dmNomina.tblNominaCODIGO_EMP.Value;
    dmNomina.qryDatosComision.Params[2].Value:= ExtraerFecha(FechaIni);
    dmNomina.qryDatosComision.Params[3].Value:= ExtraerFecha(dmNomina.tblNominaFECHA_NOMINA.Value);
    dmNomina.qryDatosComision.Open;
    dmNomina.qryDatosComision.First;
    Suma:=0;
    While Not dmNomina.qryDatosComision.Eof Do
    begin
      Suma:=Suma + dmNomina.qryDatosComisionCOMISION_NETA.Value;
      dmNomina.qryDatosComision.Next;
    end;
    dmNomina.tblNomina.Edit;
    dmNomina.tblNominaCOMISION.Value:=Suma;
    BitBtn4Click(Self);
    dmNomina.tblNomina.Next;
  end;
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
  end;
end;

procedure TfrmNominaEmpleado.BitBtn7Click(Sender: TObject);
begin
  if MessageDlg('Continuar con posteo de nómina?',mtInformation, [mbOK], 0) = mrNo then
  exit;

  dmNomina.tblControl.Close;
  dmNomina.tblControl.Params[1].Value:=5;//Comisiones
  dmNomina.tblControl.Params[0].Value:=5;//Comisiones
  dmNomina.tblControl.Open;
  dmNomina.tblControl.Edit;
  if  ExtraerFecha(GlbFechaNomina) < dmNomina.tblControlFECHA_ACT.Value then
  begin
    MessageDlg('Nomina no puede ser posteada, verifique',mtInformation, [mbOK], 0);
    Exit;
  end;
  dmNomina.tblControlFECHA_ACT.Value:= ExtraerFecha(GlbFechaNomina);
  dmNomina.tblControl.post;
  dmNomina.tblControl.ApplyUpdates;
  dmNomina.tblControl.Close;
  dmNomina.tblControl.Params[0].Value:=5;//nomina
  dmNomina.tblControl.Params[1].Value:=1;//
  dmNomina.tblControl.Open;
  dmNomina.tblControl.Edit;
  dmNomina.tblControlFECHA_ACT.Value:= ExtraerFecha(GlbFechaNomina);
  dmNomina.tblControl.post;
  dmNomina.tblControl.ApplyUpdates;

  if not dmNomina.tblControl.Transaction.InTransaction then
  dmNomina.tblControl.Transaction.StartTransaction;
  try
    dmNomina.tblControl.Transaction.CommitRetaining;
  except
  dmNomina.tblControl.Transaction.RollbackRetaining;
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
    qckSobrePagoNomina.QRLabel11.caption       := 'Status nomina sin definir';
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

procedure TfrmNominaEmpleado.ComisionDetallada1Click(Sender: TObject);
var
  FechaIni, FechaFin : TDatetime;
  Suma:Real;
begin
  BuscarFechaComision(FechaIni,FechaFin);
  dmReportes.QryDatosComsionxVenta.Close;
  dmReportes.QryDatosComsionxVenta.Params[0].Value:=0;
  dmReportes.QryDatosComsionxVenta.Params[1].Value:=1000;
  dmReportes.QryDatosComsionxVenta.Params[2].Value:=ExtraerFecha(FechaIni);
  dmReportes.QryDatosComsionxVenta.Params[3].Value:=ExtraerFecha(FechaFin);
  dmReportes.QryDatosComsionxVenta.Open;
  qckRepComision:=TqckRepComision.Create(Nil);
  try
    qckRepComision.Preview;
  finally
  qckRepComision.Free;
  qckRepComision:=Nil;
  end;
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

end.
