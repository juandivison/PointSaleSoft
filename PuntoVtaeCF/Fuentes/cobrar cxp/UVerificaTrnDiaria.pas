unit UVerificaTrnDiaria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBTables, DB, IBCustomDataSet;

type
  TfrmVTrnDiaria = class(TForm)
    dtqryBceHistorico: TDataSource;
    qryBceHistorico: TIBDataSet;
    qryBceHistoricoCODIGO: TIntegerField;
    qryBceHistoricoSERVICIO: TIntegerField;
    qryBceHistoricoMONEDA: TIBStringField;
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

uses UDatModCxc, UDatModConectar, UGlobal, UDatModControl;

{$R *.dfm}
 procedure TfrmVTrnDiaria.ActualizaHistorico;
begin
  {qryBceHistorico.Close;
  qryBceHistorico.Params[0].Value := Extraerfecha(GlbFechaTrnDiaria);
  qryBceHistorico.Open;
  dmcxc.qryBalanceCtes.First;
  While Not dmcxc.qryBalanceCtes.Eof do
  begin
    try
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
  if not dmcxc.qryBalanceCtes.Transaction.InTransaction then
  dmcxc.qryBalanceCtes.Transaction.StartTransaction;
  try
    dmcxc.qryBalanceCtes.Transaction.Commit;
  except
  dmcxc.qryBalanceCtes.Transaction.Rollback;
  end;}
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
  end;
  dmControl.qrycontrol.Filtered:=false;
  dmControl.qrycontrol.open;
  dmControl.qrycontrol.Filter:='sistema = 3 and sub_sistema = 1 and cod_cia = 1 ';
  dmControl.qrycontrol.Filtered:=true; //Transacciones cxc
  dmControl.qryControl.Edit;
  dmControl.qryControlFECHA_ACT.Value:=ExtraerFEcha(GlbFechaTrnDiaria);
  dmControl.qryControl.Post;
  dmControl.qryControl.ApplyUpdates;
  GlbFechaTrnDiaria:=GlbFechaTrnDiaria+1;
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
  dmcxc.qryBalanceCtes.close;
  dmcxc.qryBalanceCtes.open;
  dmcxc.qryBalanceCtes.First;
  While Not dmcxc.qryBalanceCtes.Eof do
  begin
    try
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
    qryBceHistorico.Transaction.Commit;
  except
  qryBceHistorico.Transaction.Rollback;
  end;
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
    dmControl.qryControl.Transaction.Commit;
  except
  dmControl.qryControl.Transaction.Rollback;
  end;
  qryBceHistorico.Close;
  dmcxc.qryBalanceCtes.close;
  ActualizaHistorico;
end;

end.
