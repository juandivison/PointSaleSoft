unit UProcCierreOfc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, IBSQL, DB, IBCustomDataSet, ExtCtrls,
  WinSkinData;

type
  TfrmProcCierreOfc = class(TForm)
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
    Image1: TImage;
    Label4: TLabel;
    SkinData1: TSkinData;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
     Procedure ProcCerrarDia;
     procedure ProcesarCierreDiaTrn;
     procedure ProcCerrarDiaAtrasado(xFecha:TDateTime);
     Function VerificaAutorizacion:Boolean;
  public
    { Public declarations }

  end;

var
  frmProcCierreOfc: TfrmProcCierreOfc;
  FechaUltimoInventario : TDatetime;

implementation
uses 
UGlobal, UFormSelFecha,
  UDatModCxc, UCerrarHistoriocxc, UFormEntreClave, DateUtils,
  UDatModInventario;

{$R *.dfm}

procedure TfrmProcCierreOfc.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmProcCierreOfc.FormCreate(Sender: TObject);
var
    _xImagen : String;
begin
  if SetLogoCia(_ximagen) then
  if (_ximagen <> '') then
  begin
    Image1.Picture.LoadFromFile(_ximagen);
  end else
  begin                      
    _xImagen:=FileToUse('Graficos','Logo.jpeg');
    if (_xImagen <> '') then
    Image1.Picture.LoadFromFile(_ximagen);
  end;
  VerificaCierreDia(17,1,1, ExtraerFecha(Now), GlbFechaTrnDiaria);
  LabelFecha.Caption :=FormatDateTime('dd-mmm-yyyy',GlbFechaTrnDiaria);
end;

procedure TfrmProcCierreOfc.BitBtn1Click(Sender: TObject);
var
  x, y : String;
  DiaAct : Smallint;
  DiaTrn : Smallint;
  MesAct, MesTrn : Smallint;
  hora : integer;
begin
  x:= FormatDateTime('dd-mmm-yyyy', FechaUltimoInventario);
  y:= FormatDateTime('dd-mmm-yyyy', GlbFechaTrnDiaria);
  DiaTrn:= StrToInt(FormatDateTime('dd', GlbFechaTrnDiaria));
  DiaAct:= StrToInt(FormatDateTime('dd', Date));
  MesTrn:= StrToInt(FormatDateTime('mm', GlbFechaTrnDiaria));
  MesAct:= StrToInt(FormatDateTime('mm', Date));
  hora := HourOf(now);
  if (DiaTrn > DiaAct) And (MesTrn = MesAct) then
  begin
    if (Abs(DiaAct-Diatrn) <> 1) And (hora < 17 ) then
    begin
      MessageDlg('Imposible cerrar dia '+FormatDateTime('dd-mmm-yyyy',
      GlbFechaTrnDiaria)+', verifique.(DiaAct='+IntToStr(DiaAct)+' Diatrn='+IntToStr(Diatrn)+' Hora='+IntToStr(hora)+')',mtError, [mbOK], 0);
      Exit;
    end;
  end;
  ProcCerrarDia;

  VerificaCierreDia(17,1,1, ExtraerFecha(Now), GlbFechaTrnDiaria);
  LabelFecha.Caption :=FormatDateTime('dd-mmm-yyyy',GlbFechaTrnDiaria);
end;

procedure TfrmProcCierreOfc.ProcCerrarDia;
var
  x, y : string;
  z: Integer;
begin
  if VerificaCierreDia(17,1,1, ExtraerFecha(Now), GlbFechaTrnDiaria) then
  begin
    If (varTipousuario = 0) or (varTipousuario = 1) or (varTipousuario = 2) then
    begin
      if MessageDlg('Desea Cerrar Transacciones del dia '+FormatDateTime('dd-mmm-yyyy',GlbFechaTrnDiaria)+'?',mtWarning,[mbNo,mbYes],0)=mrYes then
      ProcesarCierreDiaTrn;// else
    end;
  end else MessageDlg('Imposible cerrar dia, verifique',mtWarning,[mbOk],0);
end;

procedure TfrmProcCierreOfc.ProcesarCierreDiaTrn;
begin
  dmcxc.qryBalanceCtes.Close;
  dmcxc.qryBalanceCtes.Filtered:=False;
  dmcxc.qryBalanceCtes.Open;
  frmVTrnDiaria:=TfrmVTrnDiaria.Create(Nil);
  try
    if StrToInt(FormatDateTime('dd',GlbFechaTrnDiaria)) = DiasEnElMes(StrToInt(FormatDateTime('yyyy',GlbFechaTrnDiaria)),
                                    StrToInt(FormatDateTime('mm',GlbFechaTrnDiaria))) then
    begin
      if MessageDlg('Es hora de cerrar el mes y el dia, desea cerrarlo ahora?',mtInformation,[mbyes,mbno,mbhelp],0)=mrYes then
      begin
        try
          dmInventario.ProcInsertKardexBlc(GlbFechaTrnDiaria);
        except  on E : Exception do
        begin
          LogInformacionTxt('UMenuPrincipal');
          LogInformacionTxt('Error en dmInventario.ProcInsertKardexBlc(FechaInv);');
          LogInformacionTxt(E.ClassName+' Error. Mensaje: '+E.Message);
        end;
        end;
        frmVTrnDiaria.CerrarMesBalanceCxc;
        //frmVTrnDiaria.ActualizaHistorico;
      end;
    end else
    frmVTrnDiaria.ActualizaHistorico;
  finally
  frmVTrnDiaria.Free;
  frmVTrnDiaria:=Nil;
  end;
  dmcxc.qryBalanceCtes.Close;
end;

procedure TfrmProcCierreOfc.ProcCerrarDiaAtrasado(xFecha: TDateTime);
var
  FechaInv : TDatetime;
begin
end;

function TfrmProcCierreOfc.VerificaAutorizacion: Boolean;
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

procedure TfrmProcCierreOfc.FormCloseQuery(Sender: TObject;
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

end.
