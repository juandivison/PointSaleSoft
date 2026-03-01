unit UProcCierreJornada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  ShellApi, Dialogs, StdCtrls, Buttons, IBSQL, DB, IBCustomDataSet, ExtCtrls,
  WinSkinData, Dateutils;

type
  TfrmCierreJornada = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    labelFecha: TLabel;
    DataSource1: TDataSource;
    tblInvFisicoVeh: TIBDataSet;
    tblInvFisicoVehFECHA_INV: TDateTimeField;
    tblInvFisicoVehFLOTILLA_HOY: TIntegerField;
    tblInvFisicoVehFECHA_IN: TDateTimeField;
    tblInvFisicoVehIN_POR: TIBStringField;
    tblInvFisicoVehFECHA_MOD: TDateTimeField;
    tblInvFisicoVehMOD_POR: TIBStringField;
    tblInvFisicoVehSTATUS: TIBStringField;
    Label4: TLabel;
    SkinData1: TSkinData;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
     Procedure ProcCerrarDia;
     procedure ProcesarCierreDiaTrn;
     procedure ProcCerrarDiaAtrasado(xFecha:TDateTime);
     Function VerificaAutorizacion:Boolean;
  public
    { Public declarations }
    BitBtn1Enabled : Boolean;
  end;

var
  frmCierreJornada: TfrmCierreJornada;
  FechaUltimoInventario : TDatetime;

implementation
uses UGlobal, UFormSelFecha,
  UDatModCxc, UCerrarHistoriocxc, UFormEntreClave;

{$R *.dfm}

procedure TfrmCierreJornada.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmCierreJornada.FormCreate(Sender: TObject);
begin
  VerificaCierreDia(17,1,1, ExtraerFecha(Now), GlbFechaTrnDiaria);
  LabelFecha.Caption :=FormatDateTime('dd-mmm-yyyy',GlbFechaTrnDiaria);
end;

procedure TfrmCierreJornada.BitBtn1Click(Sender: TObject);
var
  x, y : String;
  DiaAct : Smallint;
  DiaTrn : Smallint;
  MesAct, MesTrn : Smallint;
begin
  x:= FormatDateTime('dd-mmm-yyyy', FechaUltimoInventario);
  y:= FormatDateTime('dd-mmm-yyyy', GlbFechaTrnDiaria);
  DiaTrn:= StrToInt(FormatDateTime('dd', GlbFechaTrnDiaria));
  DiaAct:= StrToInt(FormatDateTime('dd', Date));
  MesTrn:= StrToInt(FormatDateTime('mm', GlbFechaTrnDiaria));
  MesAct:= StrToInt(FormatDateTime('mm', Date));
  if (DiaTrn > DiaAct) And (MesTrn = MesAct) then
  begin
    if Abs(DiaAct-Diatrn) <> 1 then
    begin
      MessageDlg('Imposible cerrar dia ' + FormatDateTime('dd-mmm-yyyy', GlbFechaTrnDiaria)+', verifique ',mtError, [mbOK], 0);
      Exit;
    end;
  end;
  ProcCerrarDia;

  VerificaCierreDia(17,1,1, ExtraerFecha(Now), GlbFechaTrnDiaria);
  if (GlbActivaIFiscal = 1) then
  UpdateCierreZ(0,GlbFechaTrnDiaria);
  LabelFecha.Caption :=FormatDateTime('dd-mmm-yyyy',GlbFechaTrnDiaria);
end;

procedure TfrmCierreJornada.ProcCerrarDia;
var
  x, y : string;
  z: Integer;
begin
  if VerificaCierreDia(17,1,1, ExtraerFecha(Now), GlbFechaTrnDiaria) then
  begin
    If (varTipousuario = 0) or (varTipousuario = 1) or (varTipousuario = 2) then
    begin
      if MessageDlg('Desea cerrar transacciones del dia '+FormatDateTime('dd-mmm-yyyy',GlbFechaTrnDiaria)+'?',mtWarning,[mbNo,mbYes],0)=mrYes then
      ProcesarCierreDiaTrn;// else
    end;
  end else MessageDlg('Imposible cerrar dia, verifique',mtWarning,[mbOk],0);
end;

procedure TfrmCierreJornada.ProcesarCierreDiaTrn;
begin
  dmcxc.qryBalanceCtes.Close;
  dmcxc.qryBalanceCtes.Filtered:=False;
  dmcxc.qryBalanceCtes.Open;
  frmVTrnDiaria:=TfrmVTrnDiaria.Create(Nil);
  try
    if StrToInt(FormatDateTime('dd',GlbFechaTrnDiaria)) = DiasEnElMes(StrToInt(FormatDateTime('yyyy',GlbFechaTrnDiaria)),
                                    StrToInt(FormatDateTime('mm',GlbFechaTrnDiaria))) then
    begin
      //if MessageDlg('Es hora de cerrar el mes y el dia, desea cerrarlo ahora?',mtInformation,[mbyes,mbno,mbhelp],0)=mrYes then
      //begin
        frmVTrnDiaria.CerrarMesBalanceCxc;
        //frmVTrnDiaria.ActualizaHistorico;
      //end;
    end else
    frmVTrnDiaria.ActualizaHistorico;
  finally
  frmVTrnDiaria.Free;
  frmVTrnDiaria:=Nil;
  end;
  dmcxc.qryBalanceCtes.Close;
end;

procedure TfrmCierreJornada.ProcCerrarDiaAtrasado(xFecha: TDateTime);
var
  FechaInv : TDatetime;
begin
end;

function TfrmCierreJornada.VerificaAutorizacion: Boolean;
var
  Clave:String;
begin
  frmEntrreClave:=TfrmentrreClave.Create(nil);
  if frmEntrreClave.Showmodal=mrOk then
  Clave:= frmEntrreClave.Edit1.Text
  else Result := False;
  frmentrreClave.Free;
  frmentrreClave:=Nil;
  if GlbClaveSup <> Encriptar(Trim(clave),2005) then
  begin
    MessageDlg('Clave incorrecta, verifique', mtError, [mbOK], 0);
    Result := False;
  end else Result:=True;
end;

procedure TfrmCierreJornada.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose:=True;
  if glbfechatrndiaria < Date then
  begin
    if MessageDlg('Ultimo dia cerrado es menor que fecha actual.'#13''+
    'Aun desea salir?',mtWarning, [mbyes, mbNo], 0) = mrYes then
    CanClose:=True else CanClose:=False; 
  end;
end;

procedure TfrmCierreJornada.BitBtn3Click(Sender: TObject);
var
  archivo : String;
  buttonSelected : Integer;
  x, y : String;
  DiaAct : Smallint;
  DiaTrn : Smallint;
  MesAct, MesTrn : Smallint;
  hora : Integer;
  parameter:string;
begin
  //buttonSelected := MessageDlg('Yes - Genera Cierre Z e imprime, No-Solo generar cierre Z',mtConfirmation,[mbyes,mbno,mbCancel],0);
  if (GlbActivaIFiscal = 0) then Exit;
  if MessageDlg('Proceder con cierre Z?', mtinformation,[mbyes, mbno],0) = mrNo then Exit;

  x:= FormatDateTime('dd-mmm-yyyy', FechaUltimoInventario);
  y:= FormatDateTime('dd-mmm-yyyy', GlbFechaTrnDiaria);

  DiaTrn:= StrToInt(FormatDateTime('dd', GlbFechaTrnDiaria));
  DiaAct:= StrToInt(FormatDateTime('dd', Date));
  
  MesTrn:= StrToInt(FormatDateTime('mm', GlbFechaTrnDiaria));
  MesAct:= StrToInt(FormatDateTime('mm', Date));
  //FechaTrnDiaria ----> 07/20/2015
  //Fecha Actual   ----> 07/22/2015
  hora := HourOf(now);
  if (DiaTrn > DiaAct) And (MesTrn = MesAct) then
  begin
    //if (Abs(DiaAct-Diatrn) <> 1)  And ((hora < 20) or hora   ) then
    //begin
    //  MessageDlg('Imposible cerrar dia '+FormatDateTime('dd-mmm-yyyy', GlbFechaTrnDiaria)+', verifique. ',mtError, [mbOK], 0);
    //  Exit;
    //end;
  end;

  if CheckBox1.Checked then
  begin
    parameter:=format('/PortComm=%s /Baudrate=%s /TipoDoc=DVFN /Status=not /CierreZ=True,89  /ImprimeZ=1 /CierreX=False /ImpCierreX=0',[IntToStr(GlbPuerto),IntToStr(GlbBaudRate)]);
    ShellExecute(0, 'Open', PChar(GlbExeIFiscal), PChar(format('/PortComm=%s /Baudrate=%s /TipoDoc=DVFN /Status=not /CierreZ=True,89  /ImprimeZ=1 /CierreX=False /ImpCierreX=0',[IntToStr(GlbPuerto),IntToStr(GlbBaudRate)])), PChar(''), SW_Hide)
  end else //if buttonSelected = mrNo then
  begin
    parameter:=format('/PortComm=%s /Baudrate=%s /TipoDoc=DVFN /Status=not /CierreZ=True,89  /ImprimeZ=0 /CierreX=False /ImpCierreX=0',[IntToStr(GlbPuerto),IntToStr(GlbBaudRate)]);
    ShellExecute(0, 'Open', PChar(GlbExeIFiscal), PChar(format('/PortComm=%s /Baudrate=%s /TipoDoc=DVFN /Status=not /CierreZ=True,89  /ImprimeZ=0 /CierreX=False /ImpCierreX=0',[IntToStr(GlbPuerto),IntToStr(GlbBaudRate)])), PChar(''), SW_Hide);
    MessageDlg('Cierre Z realizado', mtinformation,[mbok],0);
  end;
  if (ProcedeCierreZ(GlbFechaTrnDiaria)) then
  begin
    UpdateCierreZ(0,GlbFechaTrnDiaria);
    BitBtn1Enabled:=True;
  end;
  BitBtn1Click(Self);
end;

procedure TfrmCierreJornada.BitBtn4Click(Sender: TObject);
var
  archivo : String;
  cmd : String;
begin
  archivo:=GlbExeIFiscal;
  if CheckBox2.Checked then
  begin
    cmd:= Format('/PortComm=%s /Baudrate=%s /TipoDoc=DVFN /Status=ifOnlineN /Caja=0001 /CierreZ=False,89 /ImprimeZ=0 /ImpCierreX=1 /CierreX=X /Cierre=True /Cancelar=False',[IntToStr(GlbPuerto),IntToStr(GlbBaudRate)]);
    ShellExecute(0, 'Open', PChar(archivo), PChar(cmd), PChar(''), SW_Hide);
    Delay(300);
    MessageDlg('Cierre Cajero finalizado', mtinformation,[mbok],0);
  end else
  begin
    cmd:= Format('/PortComm=%s /Baudrate=%s /TipoDoc=DVFN /Status=ifOnlineN /Caja=0001 /CierreZ=False,89 /ImprimeZ=0 /ImpCierreX=0 /CierreX=X /Cierre=X /Cancelar=False',[IntToStr(GlbPuerto),IntToStr(GlbBaudRate)]);
    ShellExecute(0, 'Open', PChar(archivo), PChar(cmd), PChar(''), SW_Hide);
    Delay(300);
    MessageDlg('Cierre Cajero finalizado', mtinformation,[mbok],0);
  end;
end;

end.
