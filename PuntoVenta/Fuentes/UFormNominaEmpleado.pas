unit UFormNominaEmpleado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  db,Dialogs, DBCtrls, StdCtrls, Mask, RXCtrls, RXDBCtrl, Buttons, Grids,
  DBGrids, dbnavE, WinSkinData, Menus, EditNew, ExtCtrls, IBCustomDataSet,
  IBQuery, ComCtrls, DBTables;

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
    SpeedButton2: TSpeedButton;
    ProgressBar1: TProgressBar;
    qryEscalaIsr: TIBQuery;
    qryEscalaIsrCODIGO_ESCALA: TIntegerField;
    qryEscalaIsrESCALA_RETENCION: TFloatField;
    qryEscalaIsrTASA_EXENTO: TFloatField;
    qryEscalaIsrFECHA_INI: TDateTimeField;
    qryEscalaIsrFECHA_FIN: TDateTimeField;
    qryNomantIsr: TIBQuery;
    qryNomantIsrSALARIO_BRUTO: TFloatField;
    qryNomantIsrCODIGO: TIntegerField;
    edtBuscarxNombre: TEdit;
    Label16: TLabel;
    Button1: TButton;
    Label17: TLabel;
    DBEdit11: TDBEdit;
    Label18: TLabel;
    DBEdit12: TDBEdit;
    Label19: TLabel;
    DBEdit13: TDBEdit;
    SpeedButton1: TSpeedButton;
    qryVaca: TIBQuery;
    qryVacaCODIGO: TIntegerField;
    qryVacaVALOR_TRANS: TFloatField;
    qryVacaFECHAVACACIONES: TDateTimeField;
    BrowseNomina1: TMenuItem;
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
    procedure SpeedButton2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BrowseNomina1Click(Sender: TObject);
  private
    { Private declarations }
    procedure ProcCalcularDeducciones;
    procedure ProcFaltante(codEmp : Integer);
    procedure ProcPrestamo;
    procedure ProcActBlcPrestamo;
    Procedure BuscarFechaComision(Var fechaIni,fechaFin:TDateTime);
    procedure ProcIntegrarComision;
    procedure RepComisionXVta(tipo:smallint);
    procedure CalculoIsrNuevo;
    procedure CalculoIsrNormal;
    procedure CalculoIsrProyectado;
    procedure PrestamosEmp;
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
  URepComisionTrabXVta, URepComisionTrabXVtaRes, UFormPagoComisionesXVta,
  UDatmodDatosGenerales, UDatModConectar, UFrmbrowseDatosNomina;
  //, URepComision;

{$R *.dfm}
procedure TfrmNominaEmpleado.CalculoIsrNuevo;
var
  MontoSalarioDed : Real;
  SalarioPeriodoISR : Real;
  SalarioMensualISR : Real;
  SalarioAnualISR   : Real;
  SalarioQuincena15 : Real;
  ValorVacaciones   : Real;

  PorcAFP      : Real;
  PorcTSS      : Real;
  PorcTotalTSS : Real;

  BaseISRAnual : Real;
  ISRAnual     : Real;
  ISRPeriodo   : Real;

  FechaQuincena15 : TDateTime;
  Y, M, D : Word;

  function ObtenerPorcLey8701(CodigoDescuento: Integer): Real;
  begin
    Result := 0;

    dmNomina.qryLey8701.Close;
    dmNomina.qryLey8701.Params[0].Value := CodigoDescuento;
    dmNomina.qryLey8701.Params[1].Value := ExtraerFecha(GlbFechaNomina);
    dmNomina.qryLey8701.Open;

    if not dmNomina.qryLey8701.IsEmpty then
      Result := dmNomina.qryLey8701PORC_EMPLEADO.Value;

    {
      Fallback de seguridad según tabla vigente:
      CODIGO_DESCUENTO = 2 -> AFP
      CODIGO_DESCUENTO = 3 -> TSS/SFS
    }
    if Result = 0 then
    begin
      if CodigoDescuento = 2 then
        Result := 2.87
      else if CodigoDescuento = 3 then
        Result := 3.04;
    end;
  end;

  procedure LogISR(const Linea: string);
  var
    F: TextFile;
    RutaLog: string;
  begin
    RutaLog := ExtractFilePath(Application.ExeName) + 'log_isr_nomina.txt';

    AssignFile(F, RutaLog);

    if FileExists(RutaLog) then
      Append(F)
    else
      Rewrite(F);

    try
      Writeln(F, FormatDateTime('yyyy-mm-dd hh:nn:ss', Now) + ' | ' + Linea);
    finally
      CloseFile(F);
    end;
  end;

begin
  {
    Escala ISR vigente según fecha de nómina.
  }
  dmdatos.qryEscalaIsr.Close;
  dmdatos.qryEscalaIsr.Params[0].Value := ExtraerFecha(GlbFechaNomina);
  dmdatos.qryEscalaIsr.Open;

  {
    Porcentajes del empleado:
    AFP = 2
    TSS/SFS = 3
  }
  PorcAFP := ObtenerPorcLey8701(2);
  PorcTSS := ObtenerPorcLey8701(3);
  PorcTotalTSS := PorcAFP + PorcTSS;

  {
    Vacaciones del período actual.
  }
  dmNomina.qVaca.Close;
  dmNomina.qVaca.Params[0].Value := ExtraerFecha(GlbFechaNomina);
  dmNomina.qVaca.Open;

  DecodeDate(ExtraerFecha(GlbFechaNomina), Y, M, D);

  {
    Si la nómina es del 30, abrimos qryNomantIsr solo para buscar
    la nómina pagada del día 15 del mismo mes.

    Query esperado:
      SELECT CODIGO_emp, sum(SALARIO_BRUTO) SALARIO_BRUTO
      FROM NOMINA
      WHERE fecha_nomina between :fechaini and :fechafin
        AND Status_Nomina = 'P'
      GROUP BY CODIGO_emp
  }
  if D > 15 then
  begin
    FechaQuincena15 := EncodeDate(Y, M, 15);

    qryNomantIsr.Close;
    qryNomantIsr.Params[0].Value := FechaQuincena15;
    qryNomantIsr.Params[1].Value := FechaQuincena15;
    qryNomantIsr.Open;

    LogISR(
      'QRY_QUINCENA_15' +
      ' | FECHA=' + FormatDateTime('dd/mm/yyyy', FechaQuincena15) +
      ' | RECORDS=' + IntToStr(qryNomantIsr.RecordCount)
    );
  end
  else
  begin
    qryNomantIsr.Close;
  end;

  dmNomina.tblNomina.First;

  ProgressBar1.Visible := True;
  ProgressBar1.BringToFront;
  ProgressBar1.Max := dmNomina.tblNomina.RecordCount;
  ProgressBar1.Position := 0;

  while not dmNomina.tblNomina.Eof do
  begin
    dmNomina.qryEmpleados.Locate(
      'Codigo;CODIGO_CIA',
      VarArrayOf([
        dmNomina.tblNominaCODIGO_EMP.Value,
        dmNomina.tblNominaCIA_KEY.Value
      ]),
      []
    );

    MontoSalarioDed := 0;
    ValorVacaciones := 0;
    SalarioQuincena15 := 0;

    {
      Por defecto, el ingreso ISR del período actual es el salario bruto
      de la nómina actual.
    }
    SalarioPeriodoISR := dmNomina.tblNominaSALARIO_BRUTO.Value;

    {
      Si el empleado tiene vacaciones con valor, usamos ese valor como
      ingreso del período actual para ISR.
    }
    if dmNomina.qVaca.Locate('CODIGO', dmNomina.tblNominaCODIGO_EMP.Value, []) then
    begin
      if dmNomina.qVacaVALOR_TRANS.Value > 0 then
      begin
        ValorVacaciones := dmNomina.qVacaVALOR_TRANS.Value;
        SalarioPeriodoISR := ValorVacaciones;
      end;
    end;

    {
      Nueva regla sin histórico anual:

      Día 15:
        salario mensual = período actual * 2

      Día 30:
        si existe nómina pagada del día 15:
          salario mensual = quincena 15 + período actual
        si no:
          salario mensual = período actual * 2
    }
    if D > 15 then
    begin
      if qryNomantIsr.Active then
      begin
        if qryNomantIsr.Locate('CODIGO_EMP', dmNomina.tblNominaCODIGO_EMP.Value, []) then
          SalarioQuincena15 := qryNomantIsrSALARIO_BRUTO.Value;
      end;

      if SalarioQuincena15 > 0 then
        SalarioMensualISR := SalarioQuincena15 + SalarioPeriodoISR
      else
        SalarioMensualISR := SalarioPeriodoISR * 2;
    end
    else
    begin
      SalarioMensualISR := SalarioPeriodoISR * 2;
    end;

    SalarioAnualISR := SalarioMensualISR * 12;

    MontoSalarioDed := SalarioAnualISR * PorcTotalTSS / 100;
    BaseISRAnual := SalarioAnualISR - MontoSalarioDed;
    ISRAnual := MontoIsrADeducir(BaseISRAnual);

    {
      Quincenal.
      Si en algún momento usas este procedimiento para otro tipo de nómina,
      aquí podemos abrir el divisor según TIPO_NOMINA.
    }
    ISRPeriodo := ISRAnual / 24;
    if (dmNomina.tblNominaCODIGO_EMP.Value = 13) then
    LogISR(
      'EMP=' + IntToStr(dmNomina.tblNominaCODIGO_EMP.Value) +
      ' | FECHA_NOM=' + FormatDateTime('dd/mm/yyyy', GlbFechaNomina) +
      ' | DIA_NOM=' + IntToStr(D) +
      ' | SALARIO_EMPLEADO_MENSUAL_FICHA=' + FormatFloat('#,##0.00', dmNomina.qryEmpleadosSALARIO.Value) +
      ' | SALARIO_BRUTO_NOMINA=' + FormatFloat('#,##0.00', dmNomina.tblNominaSALARIO_BRUTO.Value) +
      ' | VACACIONES=' + FormatFloat('#,##0.00', ValorVacaciones) +
      ' | SALARIO_PERIODO_ISR=' + FormatFloat('#,##0.00', SalarioPeriodoISR) +
      ' | SALARIO_QUINCENA_15=' + FormatFloat('#,##0.00', SalarioQuincena15) +
      ' | SALARIO_MENSUAL_ISR=' + FormatFloat('#,##0.00', SalarioMensualISR) +
      ' | PORC_AFP=' + FormatFloat('#,##0.0000', PorcAFP) +
      ' | PORC_TSS=' + FormatFloat('#,##0.0000', PorcTSS) +
      ' | PORC_TOTAL_TSS=' + FormatFloat('#,##0.0000', PorcTotalTSS) +
      ' | SALARIO_ANUAL_ISR=' + FormatFloat('#,##0.00', SalarioAnualISR) +
      ' | MONTO_SALARIO_DED=' + FormatFloat('#,##0.00', MontoSalarioDed) +
      ' | BASE_ISR_ANUAL=' + FormatFloat('#,##0.00', BaseISRAnual) +
      ' | ISR_ANUAL=' + FormatFloat('#,##0.00', ISRAnual) +
      ' | ISR_PERIODO=' + FormatFloat('#,##0.00', ISRPeriodo)
    );

    dmNomina.tblNomina.Edit;
    dmNomina.tblNominaISR.Value := ISRPeriodo;

    if dmNomina.tblNomina.State in [dsEdit] then
    begin
      if not dmNomina.tblNomina.Transaction.InTransaction then
        dmNomina.tblNomina.Transaction.StartTransaction;

      dmNomina.tblNomina.Post;
      dmNomina.tblNomina.ApplyUpdates;

      try
        dmNomina.tblNomina.Transaction.CommitRetaining;
      except
        dmNomina.tblNomina.Transaction.RollbackRetaining;
      end;
    end;

    ProgressBar1.StepIt;
    dmNomina.tblNomina.Next;
  end;

  ProgressBar1.Visible := False;
  ProgressBar1.SendToBack;

  dmNomina.StpCalTotalN.Close;
  dmNomina.StpCalTotalN.Params[0].Value := glbTipoNom;
  dmNomina.StpCalTotalN.Params[1].Value := glbCia_Key;
  dmNomina.StpCalTotalN.Params[2].Value := ExtraerFecha(GlbFechaNomina);
  dmNomina.StpCalTotalN.ExecProc;

  if not dmNomina.StpCalTotalN.Transaction.InTransaction then
    dmNomina.StpCalTotalN.Transaction.StartTransaction;

  try
    dmNomina.StpCalTotalN.Transaction.CommitRetaining;
  except
    dmNomina.StpCalTotalN.Transaction.RollbackRetaining;
  end;

  dmNomina.tblNomina.Close;
  dmNomina.tblNomina.Params[0].Value := glbCia_Key;
  dmNomina.tblNomina.Params[1].Value := glbTipoNom;
  dmNomina.tblNomina.Params[2].Value := GlbFechaNomina;
  dmNomina.tblNomina.Open;

  ProgressBar1.Visible := False;
  ProgressBar1.SendToBack;
end;

{
procedure TfrmNominaEmpleado.CalculoIsrNuevo;
var
  MontoSalarioDed : Real;
  a1,M1,D1,a2,m2,d2 : Word;
  aT,mT,dT : Integer;
  fechaN : TDatetime;  
  Function ValorEscala(Indice:Integer):Real;
  begin
    if qryEscalaIsr.Locate('CODIGO_ESCALA',Indice,[]) then
    Result:=qryEscalaIsrESCALA_RETENCION.Value else Result:=0;
  end;
begin
  dmdatos.qryEscalaIsr.Close;
  dmdatos.qryEscalaIsr.Params[0].Value:=ExtraerFecha(GlbFechaNom);
  dmdatos.qryEscalaIsr.Open;

  qryNomantIsr.Close;
  qryNomantIsr.Params[0].Value:=
               EncodeDate(StrToInt(FormatDatetime('yyyy',GlbFechaNom)),01,01);

  qryNomantIsr.Params[1].Value:=
  EncodeDate(StrToInt(FormatDatetime('yyyy',GlbFechaNom)),
  StrToInt(FormatDatetime('mm', GlbFechaNom)),15);
  qryNomantIsr.Open;
  DecodeDate(qryNomantIsr.Params[1].AsDateTime,a1,m1,d1);
  fechaN := ExtraerFecha(StrToDate('12'+DateSeparator+'31'+DateSeparator+IntToStr(a1)));
  DecodeDate(fechaN, a2, m2, d2);

  CalculaTiempoT(a1,m1,d1,a2,m2,d2,aT,mt,dT);

  dmNomina.qryLey8701.Close;
  dmNomina.qryLey8701.Params[0].Value := 1;//Afp
  dmNomina.qryLey8701.Params[1].Value := ExtraerFecha(glbFechaNom);
  dmNomina.qryLey8701.Open;
  dmNomina.qryLey8701PORC_EMPLEADO.Value;//Afp

  dmNomina.qVaca.close;
  dmNomina.qVaca.Params[0].Value := ExtraerFEcha(GlbFechaNom);
  dmNomina.qVaca.Open;
  dmNomina.tblNomina.First;
  ProgressBar1.Visible:=True;
  ProgressBar1.BringToFront;
  ProgressBar1.Max:=dmNomina.tblNomina.RecordCount;
  ProgressBar1.Position:=0;
  While Not dmNomina.tblNomina.Eof do
  begin                //ValorEscala(
    dmNomina.qryEmpleados.Locate('Codigo;CODIGO_CIA',
    VarArrayOf([dmNomina.tblNominaCODIGO_EMP.Value,
                dmNomina.tblNominaCIA_KEY.Value]),[]);
    ProgressBar1.visible:=False;
    ProgressBar1.SendToBack;
    qryNomantIsr.Locate('CODIGO',dmNomina.tblNominaCODIGO_EMP.value,[]);
    MontoSalarioDed:=0;
    dmNomina.tblNomina.Edit;
    if dmNomina.qVaca.Locate('CODIGO',dmNomina.tblNominaCODIGO_EMP.value,[]) then
    begin
      if dmNomina.qVacaVALOR_TRANS.Value > 0 then
      MontoSalarioDed:=
             (( dmNomina.qryEmpleadosSALARIO.Value * mT ) +
               qryNomantIsrSALARIO_BRUTO.Value +
               dmNomina.qVacaVALOR_TRANS.Value
              ) * dmNomina.qryLey8701PORC_EMPLEADO.Value / 100
      else MontoSalarioDed :=
           (( dmNomina.qryEmpleadosSALARIO.Value * mT ) +
                  qryNomantIsrSALARIO_BRUTO.Value +
                  dmNomina.tblNominaSALARIO_BRUTO.Value
            ) * dmNomina.qryLey8701PORC_EMPLEADO.Value / 100;
    end
    else MontoSalarioDed:=
    (( dmNomina.qryEmpleadosSALARIO.Value * mt )+
    (qryNomantIsrSALARIO_BRUTO.Value + dmNomina.tblNominaSALARIO_BRUTO.Value))
     * dmNomina.qryLey8701PORC_EMPLEADO.Value/100;

     dmNomina.tblNominaISR.Value :=
     MontoIsrADeducir(
            ( dmNomina.qryEmpleadosSALARIO.Value * mt )+
              ( qryNomantIsrSALARIO_BRUTO.Value + dmNomina.qVacaVALOR_TRANS.Value +
                dmNomina.tblNominaSALARIO_BRUTO.Value
              ) - MontoSalarioDed
            )/12;
     if dmNomina.tblNomina.State in [dsEdit] Then
     begin//1
       if not dmNomina.tblNomina.Transaction.InTransaction then
       dmNomina.tblNomina.Transaction.StartTransaction;

       dmNomina.tblNomina.Post;
       dmNomina.tblNomina.Applyupdates;
       try
         dmNomina.tblNomina.Transaction.CommitRetaining;
       except
         dmNomina.tblNomina.Transaction.RollbackRetaining;
       end;
     end;//1
     ProgressBar1.StepIt;
     dmNomina.tblNomina.Next;
  end;
  ProgressBar1.Visible:=False;
  ProgressBar1.SendToBack;

  dmNomina.StpCalTotalN.Close;
  dmNomina.StpCalTotalN.Params[0].Value := glbTipoNom;
  dmNomina.StpCalTotalN.Params[1].Value := glbCia_Key;
  dmNomina.StpCalTotalN.Params[2].Value := ExtraerFecha(glbFechaNom);
  dmNomina.StpCalTotalN.ExecProc;
  if not dmNomina.StpCalTotalN.Transaction.InTransaction then
  dmNomina.StpCalTotalN.Transaction.StartTransaction;
  try
    dmNomina.StpCalTotalN.Transaction.CommitRetaining;
  except
  dmNomina.StpCalTotalN.Transaction.RollbackRetaining;
  end;
  dmNomina.tblNomina.Close;
  dmNomina.tblNomina.Params[0].Value := glbCia_Key;
  dmNomina.tblNomina.Params[1].Value := glbTipoNom;
  dmNomina.tblNomina.Params[2].Value := glbFechaNom;
  dmNomina.tblNomina.Open;
  ProgressBar1.Visible:=False;
  ProgressBar1.SendToBack;
end;
}

procedure TfrmNominaEmpleado.BitBtn2Click(Sender: TObject);
var
  flag:boolean;
  tipoNomina : Integer;
begin
  dmNomina.qryEmpleados.Close;
  dmNomina.qryEmpleados.Open;
  dmNomina.qryEmpleados.First;
  

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
var
  ValorVacaciones: Double;
  BaseDeduccionTSS: Double;
  FechaIniMes: TDateTime;
  FechaFinMes: TDateTime;
  Y, M, D: Word;
  entra:string;
begin
{
  CODIGO_DESCUENTO:
  2 = AFP
  3 = SFS
  4 = ARL
  5 = INFOTEP

  Regla:
  - El monto de vacaciones se suma a la base de deducción TSS.
  - BaseDeduccionTSS = SALARIO_BRUTO + VALOR_TRANS vacaciones.
}

  ValorVacaciones := 0;

  DecodeDate(ExtraerFecha(GlbFechaNomina), Y, M, D);

  FechaIniMes := EncodeDate(Y, M, 1);      
  FechaFinMes := EncodeDate(Y, M, DiasEnElMes(Y, M));

  {
    Se abre qryVaca para el mes de la nómina.
    Parámetros según SpeedButton9Click:
      Params[0] = inicio de mes
      Params[1] = fin de mes
      Params[2] = fecha de nómina
  }
  if not qryVaca.Active then
  begin
    qryVaca.Close;
    qryVaca.Params[0].Value := ExtraerFecha(GlbFechaNomina);
    qryVaca.Open;
  end;

  if qryVaca.Locate('CODIGO', dmNomina.tblNominaCODIGO_EMP.Value, []) then
  begin
    if (ExtraerFecha(qryVacaFECHAVACACIONES.Value) =
        ExtraerFecha(GlbFechaNomina)) then
    begin                                 
    if qryVacaVALOR_TRANS.Value > 0 then
      ValorVacaciones := qryVacaVALOR_TRANS.Value;
    end;
  end;
 {Debug if ValorVacaciones > 0 then
  entra:='S' else entra:='';
  if (entra = 'S') then
  begin
    entra:='';
  end;    }

  BaseDeduccionTSS := dmNomina.tblNominaSALARIO_BRUTO.Value + ValorVacaciones;
  dmNomina.tblNominaVacaciones.Value:=ValorVacaciones;

  {
    AFP
  }
  if dmNomina.qryDeducciones.Locate('CODIGO_DESCUENTO', 2, []) then
  begin
    if dmNomina.qryEmpleadosPAGA_AFP.Value = 1 then
    begin
      PorcAFP := dmNomina.qryDeduccionesPORCIENTO_EMP.Value;

      dmNomina.tblNominaMONTO_AFP.Value :=
        BaseDeduccionTSS * dmNomina.qryDeduccionesPORCIENTO_EMP.Value / 100;
    end
    else
      dmNomina.tblNominaMONTO_AFP.Value := 0;
  end
  else
    dmNomina.tblNominaMONTO_AFP.Value := 0;

  {
    SFS / TSS
  }
  if dmNomina.qryDeducciones.Locate('CODIGO_DESCUENTO', 3, []) then
  begin
    if dmNomina.qryEmpleadosPAGA_TSS.Value = 1 then
    begin
      PorcTSS := dmNomina.qryDeduccionesPORCIENTO_EMP.Value;

      dmNomina.qryListaDependienteEmp.Close;
      dmNomina.qryListaDependienteEmp.Params[0].Value := ExtraerFecha(GlbFechaNomina);
      dmNomina.qryListaDependienteEmp.Params[1].Value := dmNomina.tblNominaCODIGO_EMP.Value;
      dmNomina.qryListaDependienteEmp.Open;

      dmNomina.tblNominaTSS.Value :=
        BaseDeduccionTSS * dmNomina.qryDeduccionesPORCIENTO_EMP.Value / 100;

      dmNomina.qryListaDependienteEmp.First;

      dmNomina.tblNominaSFS_DEPENDIENTES.Value := 0;
      dmNomina.tblNominaSFS_COMPLEMENTARIO.Value := 0;

      while not dmNomina.qryListaDependienteEmp.Eof do
      begin
        if dmNomina.qryListaDependienteEmpMONTO_DEPENDIENTE.Value > 0 then
          dmNomina.tblNominaSFS_DEPENDIENTES.Value :=
            dmNomina.tblNominaSFS_DEPENDIENTES.Value +
            dmNomina.qryListaDependienteEmpMONTO_DEPENDIENTE.Value;

        dmNomina.tblNominaSFS_COMPLEMENTARIO.Value :=
          dmNomina.tblNominaSFS_COMPLEMENTARIO.Value +
          dmNomina.qryListaDependienteEmpMONTO_COMPLEMENTARIOASEGURADO.Value +
          dmNomina.qryListaDependienteEmpMONTO_COMPLEMENTARIODEPENDIENTE.Value;

        dmNomina.qryListaDependienteEmp.Next;
      end;

      dmNomina.tblNominaTSS.Value :=
        dmNomina.tblNominaTSS.Value +
        dmNomina.tblNominaSFS_DEPENDIENTES.Value +
        dmNomina.tblNominaSFS_COMPLEMENTARIO.Value;
    end
    else
    begin
      dmNomina.tblNominaTSS.Value := 0;
      dmNomina.tblNominaSFS_DEPENDIENTES.Value := 0;
      dmNomina.tblNominaSFS_COMPLEMENTARIO.Value := 0;
    end;
  end
  else
  begin
    dmNomina.tblNominaTSS.Value := 0;
    dmNomina.tblNominaSFS_DEPENDIENTES.Value := 0;
    dmNomina.tblNominaSFS_COMPLEMENTARIO.Value := 0;
  end;
end;
{
procedure TfrmNominaEmpleado.ProcCalcularDeducciones;
begin
//
//2	AFP
//3	SFS
//4	ARL
//5	INFOTEP

//
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
}

procedure TfrmNominaEmpleado.FormCreate(Sender: TObject);
begin
  ProgressBar1.Visible:=False;
  dmCompania.tblCompania.Close;
  dmCompania.tblCompania.Open;
  dmCompania.tblCompania.Locate('CODIGO',GlbCodigoCia,[]);
  dmNomina.tblNomina.Close;
  dmNomina.tblNomina.Params[0].Value := GlbCia_Key;
  dmNomina.tblNomina.Params[1].Value := GlbTipoNom;
  dmNomina.tblNomina.Params[2].Value := ExtraerFecha(GlbFechaNomina);
  dmNomina.tblNomina.Open;          
  
  DmNomina.QryIntNomina.Close;         
  DmNomina.QryIntNomina.Params[0].Value := glbCia_Key;
  DmNomina.QryIntNomina.Params[1].Value := glbTipoNom;
  DmNomina.QryIntNomina.Params[2].Value := ExtraerFecha(GlbFechaNomina);
  DmNomina.QryIntNomina.Open;
                                     
  dmNomina.qryDeducciones.Close;
  dmNomina.qryDeducciones.Params[0].Value:= ExtraerFecha(GlbFechaNomina);
  dmNomina.qryDeducciones.Open;
  if (dmNomina.qryDeducciones.RecordCount = 0) then
  begin
    MessageDlg('Debe configurar opciones de descuento para nómina.', mtWarning,[mbok],0);
  end;
  dmNomina.tblPrestamo.Close;
  dmNomina.qryEmpleados.Close;
  dmNomina.qryEmpleados.Open;
end;

procedure TfrmNominaEmpleado.ProcPrestamo;
begin
  if dmNomina.tblPrestamo.state = dsInactive then dmNomina.tblPrestamo.Open;
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
  dmNomina.tblPrestamo.close;
  dmNomina.tblPrestamo.open;
  dmnomina.qryEscalaISR.Close;// ibstpAplicaISR
  dmnomina.qryEscalaISR.Params[0].Value:=ExtraerFecha(GlbFechaTrnDiaria);
  dmnomina.qryEscalaISR.Open;
  PrestamosEmp;
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
  btnRefrescarClick(Self);
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
 dmNomina.QryRepNomGral.Params[2].value := GlbFechaNomina;
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
  if dmNomina.tblPrestamo.state = dsInactive then dmNomina.tblPrestamo.Open;
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
       if dmNomina.tblNomina.state = dsBrowse then
       dmNomina.tblNomina.Edit;
       dmNomina.tblNominaSALARIO_BRUTO.Value := dmNomina.tblNominaDiasTrab.Value;
       dmNomina.tblNominaSALARIO_NETO.Value := (dmNomina.tblNominaSALARIO_BRUTO.Value + dmNomina.tblNominaOtros_Ingresos.Value) -
      (dmNomina.tblNominaOtras_Deducciones.Value + dmNomina.tblNominaCooperativa.Value +  dmNomina.tblNominaISR.Value + dmNomina.tblNominaIDSS.Value);

       ProcCalcularDeducciones;
       BitBtn4Click(sender);
     End
  Else
  if CheckExcluir = True Then
     Begin
       btnModificarClick(Sender);
       if dmNomina.tblNomina.state = dsBrowse then
       dmNomina.tblNomina.Edit;
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

procedure TfrmNominaEmpleado.SpeedButton2Click(Sender: TObject);
var
  respuesta: Word;
begin
  {temporal divison}
  if StrToInt(FormatDateTime('mm',Date)) >= 10 then
  Begin
    Respuesta:= MessageDlg('Asignar descuento ISR Proyectado?',mtinformation,[mbyes,mbno,mbCancel],0);
    if Respuesta = 7 then
    begin
      CalculoIsrNuevo;
      //Temporal Ok Divison CalculoIsrNormal;
    end else
    if Respuesta = 6 then
    begin
       //Ejecutar Store procedure StpIsrProyectado solo en dic y ene'01
       CalculoIsrProyectado;
    end else Exit;
  end else CalculoIsrNuevo;//temporal ok divison Junio 28 CalculoIsrNormal;
  
  if not DmNomina.QryIntNomina.Transaction.InTransaction then
  DmNomina.QryIntNomina.Transaction.StartTransaction;

  if DmNomina.QryIntNomina.State in [dsInsert, dsEdit] then
  DmNomina.QryIntNomina.Post;
  DmNomina.QryIntNomina.ApplyUpdates;
  try
    DmNomina.QryIntNomina.Transaction.CommitRetaining;
  except
  DmNomina.QryIntNomina.Transaction.RollbackRetaining;
  end;
  //********** Refrescar datos nomina ******
  DmNomina.QryIntNomina.Close;
  DmNomina.QryIntNomina.Params[0].Value := glbCia_Key;
  DmNomina.QryIntNomina.Params[1].Value := glbTipoNom;
  DmNomina.QryIntNomina.Params[2].Value := ExtraerFecha(GlbFechaNomina);
  DmNomina.QryIntNomina.Open;
  dmNomina.tblNomina.Close;
  dmNomina.tblNomina.Params[0].Value := GlbCia_Key;
  dmNomina.tblNomina.Params[1].Value := GlbTipoNom;
  dmNomina.tblNomina.Params[2].Value := ExtraerFecha(GlbFechaNomina);
  dmNomina.tblNomina.Open;
end;

procedure TfrmNominaEmpleado.CalculoIsrProyectado;
begin
  dmnomina.StpIsrProyectado.Params[0].Value := GlbFechaNomina;
  dmnomina.StpIsrProyectado.ExecProc;
end;

procedure TfrmNominaEmpleado.CalculoIsrNormal;
  Function ValorEscala(Indice:Integer):Real;
  begin
    if qryEscalaIsr.Locate('CODIGO_ESCALA',Indice,[]) then
    Result:=qryEscalaIsrESCALA_RETENCION.Value else Result:=0;
  end;
begin
  //dmNomina.StpIntIsr.close;          //***** ISR *******
  qryEscalaIsr.Close;
  qryEscalaIsr.Params[0].Value := ExtraerFecha(GlbFechaNomina);
  qryEscalaIsr.Open;
  DmNomina.StpIntIsr.Params[0].Value := glbCia_Key;
  DmNomina.StpIntIsr.Params[1].Value := glbTipoNom;
  DmNomina.StpIntIsr.Params[2].Value := ExtraerFecha(GlbFechaNomina);   //2002 2001
  DmNomina.StpIntIsr.Params[3].Value := ValorEscala(1);//138420.01;//125256.01;//120000.00;
  DmNomina.StpIntIsr.Params[4].Value := ValorEscala(2);//230701.01;//208760.01;//200000.00;
  DmNomina.StpIntIsr.Params[5].Value := ValorEscala(3);//346051.01;//313140.01;//300000.00;
  DmNomina.qryLey8701.Close;
  DmNomina.qryLey8701.Params[0].Value := 1;//Afp
  DmNomina.qryLey8701.Params[1].Value := ExtraerFecha(GlbFechaNomina);
  DmNomina.qryLey8701.Open;
  DmNomina.StpIntIsr.Params[6].Value := DmNomina.qryLey8701PORC_EMPLEADO.Value;//Afp

  DmNomina.qryLey8701.Close;
  DmNomina.qryLey8701.Params[0].Value := 2;//Salud;
  DmNomina.qryLey8701.Params[1].Value := ExtraerFecha(GlbFechaNomina);
  DmNomina.qryLey8701.Open;
  DmNomina.StpIntIsr.Params[7].Value := DmNomina.qryLey8701PORC_EMPLEADO.Value;//Salud
  DmNomina.StpIntIsr.ExecProc;
  //************ Calcular Total **************
  DmNomina.StpCalTotalN.Close;
  DmNomina.StpCalTotalN.Params[0].Value := glbTipoNom;
  DmNomina.StpCalTotalN.Params[1].Value := glbCia_Key;
  DmNomina.StpCalTotalN.Params[2].Value := GlbFechaNomina;
  DmNomina.StpCalTotalN.ExecProc;
end;

procedure TfrmNominaEmpleado.Button1Click(Sender: TObject);
begin
  if dmnomina.qryEmpleados.state = dsInactive then
  dmnomina.qryEmpleados.Open;
  if dmnomina.qryEmpleados.Locate('NOMBRECOMPLETO',edtBuscarxNombre.Text,[]) then
  dmnomina.tblNomina.Locate('CODIGO_EMP',dmnomina.qryEmpleadosCODIGO.Value,[]);
end;

procedure TfrmNominaEmpleado.SpeedButton1Click(Sender: TObject);
begin
  dmnomina.StpIntDeduc.close;                //**** Cooperativa *****
  dmnomina.StpIntDeduc.Params[0].Value := 10;
  dmnomina.StpIntDeduc.Params[1].Value := glbTipoNom;
  dmnomina.StpIntDeduc.Params[2].Value := glbCia_Key;
  dmnomina.StpIntDeduc.Params[3].Value := GlbFechaNomina;
  dmnomina.StpIntDeduc.ExecProc;
  //********************* Calcular Total **************
  dmnomina.StpCalTotalN.Close;
  dmnomina.StpCalTotalN.Params[0].Value := glbTipoNom;
  dmnomina.StpCalTotalN.Params[1].Value := glbCia_Key;
  dmnomina.StpCalTotalN.Params[2].Value := GlbFechaNomina;
  dmnomina.StpCalTotalN.ExecProc;
  if not dmnomina.StpCalTotalN.Transaction.InTransaction then
     dmnomina.StpCalTotalN.Transaction.StartTransaction;

  dmnomina.QryIntNomina.ApplyUpdates;
  if not dmnomina.StpCalTotalN.Transaction.InTransaction  then
     dmnomina.StpCalTotalN.Transaction.StartTransaction;
  try
    dmnomina.StpCalTotalN.Transaction.CommitRetaining;
  except
  dmnomina.StpCalTotalN.Transaction.RollbackRetaining;
  end;
  //********** Refrescar datos nomina ******
  dmnomina.QryIntNomina.Close;
  dmnomina.QryIntNomina.Params[0].Value := glbCia_Key;
  dmnomina.QryIntNomina.Params[1].Value := glbTipoNom;
  dmnomina.QryIntNomina.Params[2].Value := GlbFechaNomina;
  dmnomina.QryIntNomina.Open;
  btnRefrescarClick(Self);
end;

procedure TfrmNominaEmpleado.PrestamosEmp;
begin
  dmNomina.StpIntDeduc.close;      //**** Prestamos ******
       dmNomina.StpIntDeduc.Params[0].Value := 14;
       dmNomina.StpIntDeduc.Params[1].Value := glbTipoNom;
       dmNomina.StpIntDeduc.Params[2].Value := glbCia_Key;
       dmNomina.StpIntDeduc.Params[3].Value := ExtraerFecha(GlbFechaNomina);
       dmNomina.StpIntDeduc.ExecProc;
       //*************** Calcular Total *****************
       dmNomina.StpCalTotalN.Close;
       dmNomina.StpCalTotalN.Params[0].Value := glbTipoNom;
       dmNomina.StpCalTotalN.Params[1].Value := glbCia_Key;
       dmNomina.StpCalTotalN.Params[2].Value := ExtraerFecha(GlbFechaNomina);
       dmNomina.StpCalTotalN.ExecProc;
       if not dmNomina.StpCalTotalN.Transaction.InTransaction then
       dmNomina.StpCalTotalN.Transaction.StartTransaction;
       //dmNomina.StpCalTotalN.ApplyUpdates;
       try
       dmNomina.QryIntNomina.Transaction.CommitRetaining;
       except
       dmNomina.QryIntNomina.Transaction.RollbackRetaining;
       end;
       //********** Refrescar datos nomina ******
       dmNomina.QryIntNomina.Close;
       dmNomina.QryIntNomina.Params[0].Value := glbCia_Key;
       dmNomina.QryIntNomina.Params[1].Value := glbTipoNom;
       dmNomina.QryIntNomina.Params[2].Value := ExtraerFecha(GlbFechaNomina);
       dmNomina.QryIntNomina.Open;
end;

procedure TfrmNominaEmpleado.BrowseNomina1Click(Sender: TObject);
begin
  frmDatosNomina:=TfrmDatosNomina.Create(nil);
  try
    frmDatosNomina.Showmodal;
  finally
  frmDatosNomina.free;
  frmDatosNomina:=nil;
  end;
end;

end.
