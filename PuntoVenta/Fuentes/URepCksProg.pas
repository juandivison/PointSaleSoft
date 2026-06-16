unit URepCksProg;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Atexto, Db, Dialogs;

type
  TQckRepCksProg = class(TQuickRep)
    QRBand1: TQRBand;
    QRBand3: TQRBand;
    QRDBText3: TQRDBText;
    qrLabelMontoLetras: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBRichText2: TQRDBRichText;
    QRDBText5: TQRDBText;
    qrlabelnumcks1: TQRLabel;
    QRGroup1: TQRGroup;
    DineroEnLetras: TLetras;
    qrlabelnumcks2: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabelNombreAbr: TQRLabel;
    QRLabel13: TQRLabel;
    procedure qrLabelMontoLetrasPrint(sender: TObject; var Value: String);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QckRepCksNomPerBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QckRepCksNomPerAfterPrint(Sender: TObject);
    procedure QckRepCksNomPerAfterPreview(Sender: TObject);
  private

  public

  end;

var
  QckRepCksProg: TQckRepCksProg;
  cont : integer = 0;
implementation
Uses UDatModNomina, UDatModCheques, Uglobal, UImpChequesNomina,
  UDatModConectar;
{$R *.DFM}

procedure TQckRepCksProg.qrLabelMontoLetrasPrint(sender: TObject;
  var Value: String);
begin
  Value :='***'+UpperCase(Value)+'***';
end;

procedure TQckRepCksProg.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if dmnomina.QryRepCksNMONTO.Value <= 0 then
     begin
       MessageDlg('Error en número de cheque de '+
       dmnomina.QryRepCksNbeneficiario.Value,mtError,[mbok],0);
       PrintBand :=False;
       exit;
     end;

  if Not glbStatusCksNormal then
     begin
       dmcks.stpCksDanados.close;
       dmcks.stpCksDanados.params[0].Value:= dmNomina.QryRepCksNCODIGO_CIA.Value;
       dmcks.stpCksDanados.params[1].Value:= dmNomina.QryRepCksNSOL_EXPNO.Value;
       dmcks.stpCksDanados.params[2].Value:= dmNomina.QryRepCksNCODIGO_EMPLEADO.Value;
       dmcks.stpCksDanados.params[3].Value:= ExtraerFecha(date);
       dmcks.stpCksDanados.params[4].Value:= sqlNombreAbr(dmNomina.QryRepCksNCODIGO_EMPLEADO.Value);
       dmcks.stpCksDanados.params[5].Value:= dmNomina.QryRepCksNMONTO.Value;
       dmcks.stpCksDanados.params[6].Value:= dmNomina.QryRepCksNNUMERO_CKS.Value;
       dmcks.stpCksDanados.params[7].Value:= dmNomina.QryRepCksNFECHA_PAGO.Value;
       dmcks.stpCksDanados.params[8].Value:= dmNomina.QryRepCksNTIPO_CKS.Value;
       dmcks.stpCksDanados.params[9].Value:= dmNomina.QryRepCksNCOD_BANCO.Value;
       dmcks.stpCksDanados.params[10].Value:= dmNomina.QryRepCksNSTATUS.Value;
       dmcks.stpCksDanados.params[11].Value:= dmNomina.QryRepCksNTIPO_NOMINA.Value;
       dmcks.stpCksDanados.params[12].Value:= dmNomina.QryRepCksNSUBTIPO.Value;
       dmcks.stpCksDanados.ExecProc;
     end
  Else Begin End;
  if cont = 0 then
     begin
       dmnomina.QryRepCksN.edit;
       dmnomina.QryRepCksNNUMERO_CKS.Value:=generanumerocks  //funcion que genera el prox numero
     end
  else
     begin
       dmnomina.QryRepCksN.Edit;
       dmnomina.QryRepCksNNUMERO_CKS.Value:=generaproxnumcks;
     end;
  if dmnomina.QryRepCksN.State = dsEdit then
     begin
       dmnomina.QryRepCksNSTATUS.Value:='P';
       dmnomina.QryRepCksNFECHA_PAGO.Value:= glbFechaPagoCks;
       dmnomina.QryRepCksN.Post;
       dmnomina.QryRepCksN.ApplyUpdates;
     end;
  Inc(cont);
  qrlabelnumcks1.Caption:=dmnomina.QryRepCksNNUMERO_CKS.AsString;
  qrlabelnumcks2.Caption:=dmnomina.QryRepCksNNUMERO_CKS.AsString;
  QRLabelNombreAbr.Caption:=sqlNombreAbr(dmnomina.QryRepCksNCODIGO_EMPLEADO.Value);
  DineroEnLetras.Numero :=dmnomina.QryRepCksNMONTO.Value;
  qrLabelMontoLetras.Caption:=DineroEnLetras.AsString;
end;

procedure TQckRepCksProg.QckRepCksNomPerBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  cont := 0;
end;

procedure TQckRepCksProg.QckRepCksNomPerAfterPrint(Sender: TObject);
begin
  cont := 0;
  if not dmnomina.QryRepCksN.Transaction.InTransaction then
  dmnomina.QryRepCksN.Transaction.StartTransaction;
  try
    dmnomina.QryRepCksN.Transaction.CommitRetaining;
  except
  dmnomina.QryRepCksN.Transaction.RollbackRetaining;
  end;
end;

procedure TQckRepCksProg.QckRepCksNomPerAfterPreview(Sender: TObject);
begin
  cont := 0;
  if not dmnomina.QryRepCksN.Transaction.InTransaction then
  dmnomina.QryRepCksN.Transaction.StartTransaction;
  try
    dmnomina.QryRepCksN.Transaction.CommitRetaining;
  except
  dmnomina.QryRepCksN.Transaction.RollbackRetaining;
  end;
end;

end.

