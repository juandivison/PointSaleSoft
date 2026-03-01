unit UCerrarHistoriocxc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBStoredProc;

type
  TfrmVTrnDiaria = class(TForm)
    qryBceHistorico: TIBDataSet;
    qryBceHistoricoCODIGO: TIntegerField;
    qryBceHistoricoSERVICIO: TIntegerField;
    qryBceHistoricoMONEDA: TIBStringField;
    qryBceHistoricoFECHA_HISTORICO: TDateTimeField;
    qryBceHistoricoBALANCE_ACT: TFloatField;
    qryBceHistoricoBALANCE_ANT: TFloatField;
    qryBceHistoricoDEBITO_MES: TFloatField;
    qryBceHistoricoCREDITO_MES: TFloatField;
    qryBceHistoricoDEBITO_ACM: TFloatField;
    qryBceHistoricoCREDITO_ACM: TFloatField;
    qryBceHistoricoSTATUS: TIBStringField;
    qryBceHistoricoFECHA_IN: TDateTimeField;
    qryBceHistoricoIN_POR: TIBStringField;
    qryBceHistoricoFECHA_MOD: TDateTimeField;
    qryBceHistoricoMOD_POR: TIBStringField;
    dtqryBceHistorico: TDataSource;
    qryVerificaBceHist: TIBDataSet;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    IBStringField1: TIBStringField;
    DateTimeField1: TDateTimeField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    IBStringField2: TIBStringField;
    DateTimeField2: TDateTimeField;
    IBStringField3: TIBStringField;
    DateTimeField3: TDateTimeField;
    IBStringField4: TIBStringField;
    IBPROC_INSHISTORICOCXP: TIBStoredProc;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ActualizaHistorico;
    procedure CerrarMesBalanceCxc;

  end;

var
  frmVTrnDiaria: TfrmVTrnDiaria;

implementation

uses UConectar, UDatModCxc,UGlobal, UDatModControl, UDatModConectar;

{$R *.dfm}

{ TForm1 }

procedure TfrmVTrnDiaria.ActualizaHistorico;
begin
  dmControl.qryControl.Close;          // Sistema trn diaria
  dmControl.qrycontrol.Filtered:=False; //
  dmControl.qrycontrol.Open;
  if not dmControl.qrycontrol.Locate('Sistema;Sub_sistema;cod_cia',
                       VarArrayOf([17,1,1]),[]) then
  begin
    Beep;
    Exit;
  end else
  begin
    dmControl.qryControl.Edit;
    dmControl.qryControlFECHA_ACT.Value:= ExtraerFEcha(GlbFechaTrnDiaria)+1;
    dmControl.qryControl.Post;
    dmControl.qryControl.ApplyUpdates;
    if not dmControl.qryControl.Transaction.InTransaction then
    dmControl.qryControl.Transaction.StartTransaction;
    try
      dmControl.qryControl.Transaction.Commit;
    except
    dmControl.qryControl.Transaction.Rollback;
    end;
  end;
  dmControl.qrycontrol.Filtered:=false;
  dmControl.qrycontrol.Close;  
  dmControl.qrycontrol.Open;
  dmControl.qrycontrol.Filter:='sistema = 3 and sub_sistema = 1 and cod_cia = 1 ';
  dmControl.qrycontrol.Filtered:=True; //Transacciones cxc
  if  dmControl.qrycontrol.Locate('sistema;sub_sistema;cod_cia',VarArrayof([3,1,1]),[]) then
  begin
    //dmControl.qrycontrol.Filtered:=true; //Transacciones cxc
    dmControl.qryControl.Edit;
    dmControl.qryControlFECHA_ACT.Value:=ExtraerFEcha(GlbFechaTrnDiaria)+1;
    dmControl.qryControl.Post;  
  end;
  dmControl.qryControl.ApplyUpdates;
  GlbFechaTrnDiaria:=GlbFechaTrnDiaria+1;

  GlbDiaActualizado:=1;
  
  //dmcxc.qryBalan ceCtesFECHA_BCE.Value:=
  if not dmControl.qryControl.Transaction.InTransaction then
  dmControl.qryControl.Transaction.StartTransaction;
  try
    dmControl.qryControl.Transaction.Commit;
  except
  dmControl.qryControl.Transaction.Rollback;
  end;
  qryBceHistorico.Close;
  dmcxc.qryBalanceCtes.close;
end;

procedure TfrmVTrnDiaria.CerrarMesBalanceCxc;
begin
  qryBceHistorico.Close;
  qryBceHistorico.Params[0].Value := Extraerfecha(GlbFechaTrnDiaria);
  qryBceHistorico.Open;

  qryVerificaBceHist.Close;
  qryVerificaBceHist.Params[0].Value := Extraerfecha(GlbFechaTrnDiaria);
  qryVerificaBceHist.Open;
  dmcxc.qryBalanceCtes.First;
  While Not dmcxc.qryBalanceCtes.Eof do
  begin
    try
      if Not qryVerificaBceHist.Locate('codigo;servicio;moneda;',VarArrayOf([dmcxc.qryBalanceCtesCODIGO.Value,
      dmcxc.qryBalanceCtesSERVICIO.Value,
      dmcxc.qryBalanceCtesMONEDA.value]),[]) then
      qryBceHistorico.InsertRecord(
      [dmcxc.qryBalanceCtesCODIGO.value,
      dmcxc.qryBalanceCtesSERVICIO.value,
      dmcxc.qryBalanceCtesMONEDA.value,
      ExtraerFecha(GlbFechaTrnDiaria),
      dmcxc.qryBalanceCtesBALANCE_ACT.value,
      dmcxc.qryBalanceCtesBALANCE_ANT.value,
      dmcxc.qryBalanceCtesDEBITO_MES.value,
      dmcxc.qryBalanceCtesCREDITO_MES.value,
      dmcxc.qryBalanceCtesDEBITO_ACM.value,
      dmcxc.qryBalanceCtesCREDITO_ACM.value,
      dmcxc.qryBalanceCtesSTATUS_bce.value,
      Now,StrUserName,Null,Null]);
      except
      end;
      if qrybcehistorico.State = dsInsert then
      qrybcehistorico.Post;
      if qrybcehistorico.UpdatesPending then
      qrybcehistorico.ApplyUpdates;
      dmcxc.qryBalanceCtes.Next;
  end;
  if not qryBceHistorico.Transaction.InTransaction then
  qryBceHistorico.Transaction.StartTransaction;
  try
    qryBceHistorico.Transaction.CommitRetaining;
  except
  qryBceHistorico.Transaction.RollbackRetaining;
  end;

  ////////**************UPDATE HISTORICO CXP*********************

  IBPROC_INSHISTORICOCXP.Params[1].Value:= ExtraerFecha(GlbFechaTrnDiaria);
  IBPROC_INSHISTORICOCXP.ExecProc;
  if not IBPROC_INSHISTORICOCXP.Transaction.InTransaction then
  IBPROC_INSHISTORICOCXP.Transaction.StartTransaction;
  try
    IBPROC_INSHISTORICOCXP.Transaction.CommitRetaining;
  except
  IBPROC_INSHISTORICOCXP.Transaction.RollbackRetaining;
  end;
  
 ////////**************END UPDATE HISTORICO CXP*********************

  dmControl.qryControl.Close;          // Sistema trn diaria
  dmControl.qrycontrol.Filtered:=False; //
  dmControl.qrycontrol.Open;
  if not dmControl.qrycontrol.Locate('Sistema;Sub_sistema;cod_cia',
                       VarArrayOf([15,1,1]),[]) then
  begin
    Beep;
    Exit;
  end else
  begin
    dmControl.qryControl.Edit;
    dmControl.qryControlFECHA_ACT.Value:= ExtraerFEcha(GlbFechaTrnDiaria);
    dmControl.qryControl.Post;
    dmControl.qryControl.ApplyUpdates;
  end;
  if not dmControl.qryControl.Transaction.InTransaction then
  dmControl.qryControl.Transaction.StartTransaction;
  try
    dmControl.qryControl.Transaction.CommitRetaining;
  except
  dmControl.qryControl.Transaction.RollbackRetaining;
  end;
  qryBceHistorico.Close;
  dmcxc.qryBalanceCtes.close;
  ActualizaHistorico;
end;

end.
