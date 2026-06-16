unit UCksRegalia;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  db, Dialogs, StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, ATexto;

type
  TqckCksRegalia = class(TQuickRep)
    QRBand1: TQRBand;
    QRBand3: TQRBand;
    QRDBText3: TQRDBText;
    qrLabelMontoLetras: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBRichText2: TQRDBRichText;
    QRDBText5: TQRDBText;
    qrlabelnumcks1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel13: TQRLabel;
    qrlabelnumcks2: TQRLabel;
    QRShape1: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabelNombreAbr: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText15: TQRDBText;
    QRGroup1: TQRGroup;
    DineroEnLetras: TLetras;
    QRLabel3: TQRLabel;
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
    procedure qrLabelMontoLetrasPrint(sender: TObject;
  var Value: String);
    procedure QRLabel2Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  qckCksRegalia: TqckCksRegalia;
  cont : integer = 0;
implementation
Uses UDatModNomina, Uglobal, UImpChequesNomina, UDatModCheques;
{$R *.DFM}

procedure TqckCksRegalia.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if dmNomina.QryRepCksNMONTO.Value <= 0 then
     begin
       MessageDlg('Error en cheque, Monto es igual a Cero ( 0 ) '+
       dmNomina.QryRepCksNbeneficiario.Value,mtError,[mbok],0);
       PrintBand :=False;
       Exit;
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
       dmNomina.QryRepCksNSTATUS.Value:='P';
       dmNomina.QryRepCksNFECHA_PAGO.Value:= glbFechaPagoCks;
       dmNomina.QryRepCksN.Post;
       dmNomina.QryRepCksN.ApplyUpdates;
     end;
  Inc(cont);
  qrlabelnumcks1.Caption:=dmNomina.QryRepCksNNUMERO_CKS.AsString;
  qrlabelnumcks2.Caption:=dmNomina.QryRepCksNNUMERO_CKS.AsString;
  QRLabelNombreAbr.Caption:=sqlNombreAbr(dmNomina.QryRepCksNCODIGO_EMPLEADO.Value);
  DineroEnLetras.Numero :=dmNomina.QryRepCksNMONTO.Value;
  qrLabelMontoLetras.Caption:=DineroEnLetras.AsString;
  //*****
  dmNomina.QryRepNomGral.Locate('Codigo',dmNomina.QryRepCksNCodigo_Empleado.Value,[]);
  //*****
  dmNomina.StpNumCksNom.Close;
  dmNomina.StpNumCksNom.Params[0].value := glbCia_Key;
  dmNomina.StpNumCksNom.Params[1].value := glbTipoNom;
  dmNomina.StpNumCksNom.Params[2].value := glbFechaPagoCks;
  dmNomina.StpNumCksNom.Params[3].value := dmNomina.QryRepCksNCODIGO_EMPLEADO.Value;
  dmNomina.StpNumCksNom.Params[4].value := dmNomina.QryRepCksNNUMERO_CKS.Value;
  dmNomina.StpNumCksNom.ExecProc;
end;

procedure TqckCksRegalia.qrLabelMontoLetrasPrint(sender: TObject;
  var Value: String);
begin
  Value :='***'+UpperCase(Value)+'***';
end;

procedure TqckCksRegalia.QRLabel2Print(sender: TObject; var Value: String);
var
  anio : Integer;
begin
  anio:= StrToInt(FormatDatetime('yyyy',dmNomina.QryRepCksNFECHA_PAGO.Value));
  Inc(anio);
  Value := Value + ' '+IntToStr(anio);
end;

end.
