unit URepCksbonifica;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Atexto, Db, Dialogs,
  IBStoredProc, IBCustomDataSet;

type
  Tqckcksbonifica = class(TQuickRep)
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
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    qrlabelnumcks2: TQRLabel;
    QRShape1: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabelNombreAbr: TQRLabel;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText15: TQRDBText;
    StpNumCksBono: TIBStoredProc;
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
  qckcksbonifica: Tqckcksbonifica;
  cont : integer = 0;
implementation
Uses UDataModNomina, UDatCks, UDatamodulocnt1,Uglobal, UImpChequesNomina,
  UDatModCon;
{$R *.DFM}

procedure Tqckcksbonifica.qrLabelMontoLetrasPrint(sender: TObject;
  var Value: String);
begin
  Value :='***'+UpperCase(Value)+'***';
end;

procedure Tqckcksbonifica.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if dmNomina.QryRepCksNMONTO.Value <= 0 then
     begin
       MessageDlg('Error en número de cheque de '+
       dmNomina.QryRepCksNbeneficiario.Value,mtError,[mbok],0);
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
//  if not glbContImpCks then
//  begin
    if cont = 0 then
       begin
         dmNomina.QryRepCksN.edit;
         dmNomina.QryRepCksNNUMERO_CKS.Value:=generanumerocks  //funcion que genera el prox numero
       end
    else
     begin
       dmNomina.QryRepCksN.Edit;
       dmNomina.QryRepCksNNUMERO_CKS.Value:=generaproxnumcks;
     end;
  if dmNomina.QryRepCksN.State = dsEdit then
     begin
       dmNomina.QryRepCksNSTATUS.Value    := 'P';
       dmNomina.QryRepCksNFECHA_PAGO.Value:= glbFechaPagoCks;
       dmNomina.QryRepCksN.Post;
       dmNomina.QryRepCksN.ApplyUpdates;
     end;
  Inc(cont);
//  end;//if not glbContImpCks then
  qrlabelnumcks1.Caption  := dmNomina.QryRepCksNNUMERO_CKS.AsString;
  qrlabelnumcks2.Caption  := dmNomina.QryRepCksNNUMERO_CKS.AsString;
  QRLabelNombreAbr.Caption:= SqlNombreAbr(dmNomina.QryRepCksNCODIGO_EMPLEADO.Value);
  DineroEnLetras.Numero   := dmNomina.QryRepCksNMONTO.Value;
  qrLabelMontoLetras.Caption := DineroEnLetras.AsString;
  //*****
  if dmNomina.QryRepNomGral.Locate('Codigo',dmNomina.QryRepCksNCodigo_Empleado.Value,[]) then
  begin
  //*****
    StpNumCksBono.Close;
    StpNumCksBono.Params[0].Value := glbCia_Key;
    StpNumCksBono.Params[1].Value := glbTipoNom;
    StpNumCksBono.Params[2].Value := glbFechaPagoCks;
    StpNumCksBono.Params[3].Value := dmNomina.QryRepCksNCODIGO_EMPLEADO.Value;
    StpNumCksBono.Params[4].Value := dmNomina.QryRepCksNNUMERO_CKS.Value;
    StpNumCksBono.ExecProc;
  end;
end;

procedure Tqckcksbonifica.QckRepCksNomPerBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  cont := 0;                 
  qckcksbonifica.AllDataSets.Add(dmNomina.QryRepNomGral);
end;

procedure Tqckcksbonifica.QckRepCksNomPerAfterPrint(Sender: TObject);
begin
  cont := 0;
{  if not dm.dbDatos.InTransaction then
  dm.dbDatos.StartTransaction;
  try
    dmCon.IBDatabase1.CommitRetaining;
  except
  dmCon.IBDatabase1.RollbackRetaining;
  end;}
end;

procedure Tqckcksbonifica.QckRepCksNomPerAfterPreview(Sender: TObject);
begin
  cont := 0;
{  if not dm.dbDatos.InTransaction then
  dm.dbDatos.StartTransaction;
  try
    dmCon.IBDatabase1.CommitRetaining;
  except
  dmCon.IBDatabase1.RollbackRetaining;
  end;}
end;

end.

