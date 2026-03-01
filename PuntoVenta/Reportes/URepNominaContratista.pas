unit URepNominaContratista;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TQckRepNominaContratista = class(TQuickRep)
    QRBand2: TQRBand;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel15: TQRLabel;
    QRBand3: TQRBand;
    QRBand4: TQRBand;
    QRExpr1: TQRExpr;
    QRBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText6: TQRDBText;
    QRBand5: TQRBand;
    QRExpr2: TQRExpr;
    QRLabel6: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRDBText10: TQRDBText;
    QRExpr7: TQRExpr;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel24: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRDBText16: TQRDBText;
    QRExpr14: TQRExpr;
    QRExpr15: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr13: TQRExpr;
    QRExpr8: TQRExpr;
    QRDBText17: TQRDBText;
    QRExpr6: TQRExpr;
    QRExpr17: TQRExpr;
    QRExpr18: TQRExpr;
    QRExpr19: TQRExpr;
    QRExpr20: TQRExpr;
    QRExpr22: TQRExpr;
    QRExpr23: TQRExpr;
    QRExpr24: TQRExpr;
    QRLabel7: TQRLabel;
    QRDBText18: TQRDBText;
    QRExpr11: TQRExpr;
    QRSysData3: TQRSysData;
    QRLabel28: TQRLabel;
    QRBand6: TQRBand;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRExpr25: TQRExpr;
    QRLabel35: TQRLabel;
    QRExpr27: TQRExpr;
    QRExpr28: TQRExpr;
    QRExpr32: TQRExpr;
    QRExpr33: TQRExpr;
    QRExpr34: TQRExpr;
    QRExpr35: TQRExpr;
    QRExpr36: TQRExpr;
    QRExpr30: TQRExpr;
    QRExpr29: TQRExpr;
    QRDBText19: TQRDBText;
    QRLabel38: TQRLabel;
    QRDBText4: TQRDBText;
    QRExpr37: TQRExpr;
    QRLabel12: TQRLabel;
    QRDBText1: TQRDBText;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText2Print(sender: TObject; var Value: String);
    procedure QRDBText3Print(sender: TObject; var Value: String);
    procedure QRDBText15Print(sender: TObject; var Value: String);
    procedure QRDBText4Print(sender: TObject; var Value: String);
    procedure QRDBText5Print(sender: TObject; var Value: String);
    procedure QRDBText9Print(sender: TObject; var Value: String);
    procedure QRDBText10Print(sender: TObject; var Value: String);
    procedure QRDBText14Print(sender: TObject; var Value: String);
    procedure QRDBText13Print(sender: TObject; var Value: String);
    procedure QRDBText17Print(sender: TObject; var Value: String);
    procedure QRDBText16Print(sender: TObject; var Value: String);
    procedure QRExpr18Print(sender: TObject; var Value: String);
    procedure QRExpr17Print(sender: TObject; var Value: String);
    procedure QRExpr23Print(sender: TObject; var Value: String);
    procedure QRExpr16Print(sender: TObject; var Value: String);
    procedure QRExpr21Print(sender: TObject; var Value: String);
    procedure QRExpr20Print(sender: TObject; var Value: String);
    procedure QRExpr19Print(sender: TObject; var Value: String);
    procedure QRExpr6Print(sender: TObject; var Value: String);
    procedure QRExpr22Print(sender: TObject; var Value: String);
    procedure QRExpr24Print(sender: TObject; var Value: String);
    procedure QRExpr7Print(sender: TObject; var Value: String);
    procedure QRExpr15Print(sender: TObject; var Value: String);
    procedure QRExpr14Print(sender: TObject; var Value: String);
    procedure QRExpr13Print(sender: TObject; var Value: String);
    procedure QRExpr12Print(sender: TObject; var Value: String);
    procedure QRExpr9Print(sender: TObject; var Value: String);
    procedure QRExpr5Print(sender: TObject; var Value: String);
    procedure QRExpr3Print(sender: TObject; var Value: String);
    procedure QRExpr11Print(sender: TObject; var Value: String);
    procedure QRExpr10Print(sender: TObject; var Value: String);
    procedure QRExpr8Print(sender: TObject; var Value: String);
    procedure QRExpr4Print(sender: TObject; var Value: String);
    procedure QckRepNominaGralAfterPreview(Sender: TObject);
    procedure QckRepNominaGralAfterPrint(Sender: TObject);
    procedure QRLabel27Print(sender: TObject; var Value: String);
    procedure QRLabel12Print(sender: TObject; var Value: String);
    procedure QRLabel7Print(sender: TObject; var Value: String);
    procedure QRLabel6Print(sender: TObject; var Value: String);
    procedure QRLabel35Print(sender: TObject; var Value: String);
    procedure QRGroup2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRLabel10Print(sender: TObject; var Value: String);
  private

  public
    _xTipoNomina : integer;
  end;

var
  QckRepNominaContratista: TQckRepNominaContratista;
  ContDet : Integer = 0 ;

implementation

Uses UDatModConectar, UDatModNomina, UGlobal, UDatModCompania;
{$R *.DFM}

procedure TQckRepNominaContratista.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  Ano, Mes, Dia : Word;
begin
  DecodeDate(dmNomina.qryRepNominaContratistaFECHA_NOMINA.Value, Ano, Mes, Dia);
  if glbCheckNomina = 3 then
     Begin
       QRLabel1.Caption := 'NOMINA PRELIMINAR';
       if dia = 15 Then
       QRLabel2.Caption := 'PERIODO DEL '+FormatDateTime('yyyy-mm-dd',EncodeDate(Ano, Mes, 1))+ ' AL '+FormatDateTime('yyyy-mm-dd',glbFechaNom);
       if (dia = 30) or (dia = 31) Then
       QRLabel2.Caption := 'PERIODO DEL '+FormatDateTime('yyyy-mm-dd',EncodeDate(Ano, Mes, 16))+' AL '+FormatDateTime('yyyy-mm-dd',glbFechaNom);
       if (dia = 28) and (mes = 2 ) then
       QRLabel2.Caption := 'PERIODO DEL '+FormatDateTime('yyyy-mm-dd',EncodeDate(Ano, Mes, 16))+' AL '+FormatDateTime('yyyy-mm-dd',glbFechaNom);
       if (dia = 29) and (mes = 2 ) then
       QRLabel2.Caption := 'PERIODO DEL '+FormatDateTime('yyyy-mm-dd',EncodeDate(Ano, Mes, 16))+' AL '+FormatDateTime('yyyy-mm-dd',glbFechaNom);       
     End
  Else
     Begin
       QRLabel1.Caption := 'NOMINA DEFINITIVA';
     End;
  if _xTipoNomina = 1 Then
     Begin
       QRLabel10.Caption := 'NOMINA SEMANAL';
     end
  Else
     if _xTipoNomina = 2 Then
        Begin
          QRLabel10.Caption := 'NOMINA QUINCENAL';
          if dia = 15 Then
          QRLabel2.Caption := 'PERIODO DEL '+FormatDateTime('yyyy-mm-dd',EncodeDate(Ano, Mes, 1))+ ' AL '+FormatDateTime('yyyy-mm-dd',glbFechaNom);
          if (dia = 30) or (dia = 31) Then
          QRLabel2.Caption := 'PERIODO DEL '+FormatDateTime('yyyy-mm-dd',EncodeDate(Ano, Mes, 16))+' AL '+FormatDateTime('yyyy-mm-dd',glbFechaNom);
          if (dia = 28) and (mes = 2 ) then
          QRLabel2.Caption := 'PERIODO DEL '+FormatDateTime('yyyy-mm-dd',EncodeDate(Ano, Mes, 16))+' AL '+FormatDateTime('yyyy-mm-dd',glbFechaNom);
          if (dia = 29) and (mes = 2 ) then
          QRLabel2.Caption := 'PERIODO DEL '+FormatDateTime('yyyy-mm-dd',EncodeDate(Ano, Mes, 16))+' AL '+FormatDateTime('yyyy-mm-dd',glbFechaNom);
        End
  Else
     if _xTipoNomina = 4 Then
        Begin
          QRLabel10.Caption := 'NOMINA OCASIONALES';
          if dia = 15 Then
          QRLabel2.Caption := 'PERIODO DEL '+FormatDateTime('yyyy-mm-dd', EncodeDate(Ano, Mes, 1))+ ' AL '+FormatDateTime('yyyy-mm-dd',glbFechaNom);
          if (dia = 30) or (dia = 31) Then
          QRLabel2.Caption := 'PERIODO DEL '+FormatDateTime('yyyy-mm-dd', EncodeDate(Ano, Mes, 16))+' AL '+FormatDateTime('yyyy-mm-dd',glbFechaNom);
          if (dia = 28) and (mes = 2 ) then
          QRLabel2.Caption := 'PERIODO DEL '+FormatDateTime('yyyy-mm-dd', EncodeDate(Ano, Mes, 16))+' AL '+FormatDateTime('yyyy-mm-dd',glbFechaNom);
          if (dia = 29) and (mes = 2 ) then
          QRLabel2.Caption := 'PERIODO DEL '+FormatDateTime('yyyy-mm-dd', EncodeDate(Ano, Mes, 16))+' AL '+FormatDateTime('yyyy-mm-dd',glbFechaNom);
        End
  Else
     if _xTipoNomina = 3 Then
        Begin
          QRLabel10.Caption := 'NOMINA MENSUAL';
        End
  Else
     if _xTipoNomina = 4 Then
        Begin
          QRLabel10.Caption := 'NOMINA OCASIONAL';
        End;
end;

procedure TQckRepNominaContratista.QRDBText2Print(sender: TObject;
  var Value: String);
begin
  if Value = '0.00' then Value :='';
end;

procedure TQckRepNominaContratista.QRDBText3Print(sender: TObject;
  var Value: String);
begin
  if Value = '0.00' then Value :='';
end;

procedure TQckRepNominaContratista.QRDBText15Print(sender: TObject;
  var Value: String);
begin
  if Value = '0.00' then Value :='';
end;

procedure TQckRepNominaContratista.QRDBText4Print(sender: TObject;
  var Value: String);
begin
  if Value = '0.00' then Value :='';
end;

procedure TQckRepNominaContratista.QRDBText5Print(sender: TObject;
  var Value: String);
begin
  if Value = '0.00' then Value :='';
end;

procedure TQckRepNominaContratista.QRDBText9Print(sender: TObject;
  var Value: String);
begin
  if Value = '0.00' then Value :='';
end;

procedure TQckRepNominaContratista.QRDBText10Print(sender: TObject;
  var Value: String);
begin
    if Value = '0.00' then Value :='';
end;

procedure TQckRepNominaContratista.QRDBText14Print(sender: TObject;
  var Value: String);
begin
  if Value = '0.00' then Value :='';
end;

procedure TQckRepNominaContratista.QRDBText13Print(sender: TObject;
  var Value: String);
begin
  if Value = '0.00' then Value :='';
end;

procedure TQckRepNominaContratista.QRDBText17Print(sender: TObject;
  var Value: String);
begin
  if Value = '0.00' then Value :='';
end;

procedure TQckRepNominaContratista.QRDBText16Print(sender: TObject;
  var Value: String);
begin
  if Value = '0.00' then Value :='';
end;

procedure TQckRepNominaContratista.QRExpr18Print(sender: TObject;
  var Value: String);
begin
  if Value = '0.00' then Value :='';
end;

procedure TQckRepNominaContratista.QRExpr17Print(sender: TObject;
  var Value: String);
begin
  if Value = '0.00' then Value :='';
end;

procedure TQckRepNominaContratista.QRExpr23Print(sender: TObject;
  var Value: String);
begin
  if Value = '0.00' then Value :='';
end;

procedure TQckRepNominaContratista.QRExpr16Print(sender: TObject;
  var Value: String);
begin
  if Value = '0.00' then Value :='';
end;

procedure TQckRepNominaContratista.QRExpr21Print(sender: TObject;
  var Value: String);
begin
  if Value = '0.00' then Value :='';
end;

procedure TQckRepNominaContratista.QRExpr20Print(sender: TObject;
  var Value: String);
begin
    if Value = '0.00' then Value :='';
end;

procedure TQckRepNominaContratista.QRExpr19Print(sender: TObject;
  var Value: String);
begin
  if Value = '0.00' then Value :='';
end;

procedure TQckRepNominaContratista.QRExpr6Print(sender: TObject;
  var Value: String);
begin
  if Value = '0.00' then Value :='';
end;

procedure TQckRepNominaContratista.QRExpr22Print(sender: TObject;
  var Value: String);
begin
  if Value = '0.00' then Value :='';
end;

procedure TQckRepNominaContratista.QRExpr24Print(sender: TObject;
  var Value: String);
begin
  if Value = '0.00' then Value :='';
end;

procedure TQckRepNominaContratista.QRExpr7Print(sender: TObject;
  var Value: String);
begin
  if Value = '0.00' then Value :='';
end;

procedure TQckRepNominaContratista.QRExpr15Print(sender: TObject;
  var Value: String);
begin
  if Value = '0.00' then Value :='';
end;

procedure TQckRepNominaContratista.QRExpr14Print(sender: TObject;
  var Value: String);
begin
  if Value = '0.00' then Value :='';
end;

procedure TQckRepNominaContratista.QRExpr13Print(sender: TObject;
  var Value: String);
begin
  if Value = '0.00' then Value :='';
end;

procedure TQckRepNominaContratista.QRExpr12Print(sender: TObject;
  var Value: String);
begin
  if Value = '0.00' then Value :='';
end;

procedure TQckRepNominaContratista.QRExpr9Print(sender: TObject;
  var Value: String);
begin
  if Value = '0.00' then Value :='';
end;

procedure TQckRepNominaContratista.QRExpr5Print(sender: TObject;
  var Value: String);
begin
  if Value = '0.00' then Value :='';
end;

procedure TQckRepNominaContratista.QRExpr3Print(sender: TObject;
  var Value: String);
begin
  if Value = '0.00' then Value :='';
end;

procedure TQckRepNominaContratista.QRExpr11Print(sender: TObject;
  var Value: String);
begin
  if Value = '0.00' then Value :='';
end;

procedure TQckRepNominaContratista.QRExpr10Print(sender: TObject;
  var Value: String);
begin
  if Value = '0.00' then Value :='';
end;

procedure TQckRepNominaContratista.QRExpr8Print(sender: TObject;
  var Value: String);
begin
  if Value = '0.00' then Value :='';
end;

procedure TQckRepNominaContratista.QRExpr4Print(sender: TObject;
  var Value: String);
begin
  if Value = '0.00' then Value :='';
end;

procedure TQckRepNominaContratista.QckRepNominaGralAfterPreview(Sender: TObject);
begin
  {if glbCheckNomina = 4 then
     Begin
       //********* Cambia el status de la Nomina **********
       dmNomina.StpStatus.Close;
       dmNomina.StpStatus.Params[0].value := glbTipoNom;
       dmNomina.StpStatus.Params[1].value := glbCia_Key;
       dmNomina.StpStatus.Params[2].value := glbFechaNom;
       dmNomina.StpStatus.Params[3].value := 'P';
       dmNomina.StpStatus.ExecProc;
     End;
  if not dmNomina.StpStatus.Transaction.InTransaction then
  dmNomina.StpStatus.Transaction.StartTransaction;
  try
    dmNomina.StpStatus.Transaction.CommitRetaining;
  except
  dmNomina.StpStatus.Transaction.RollbackRetaining;
  end;}
end;

procedure TQckRepNominaContratista.QckRepNominaGralAfterPrint(Sender: TObject);
begin
  {if glbCheckNomina = 4 then
     Begin
       //********* Cambia el status de la Nomina **********
       dmNomina.StpStatus.Close;
       dmNomina.StpStatus.Params[0].value := glbTipoNom;
       dmNomina.StpStatus.Params[1].value := glbCia_Key;
       dmNomina.StpStatus.Params[2].value := glbFechaNom;
       dmNomina.StpStatus.Params[3].value := 'P';
       dmNomina.StpStatus.ExecProc;
     end;
  if not dmNomina.StpStatus.Transaction.InTransaction then
  dmNomina.StpStatus.Transaction.StartTransaction;
  try
    dmNomina.StpStatus.Transaction.CommitRetaining;
  except
  dmNomina.StpStatus.Transaction.RollbackRetaining;
  end;}
end;

procedure TQckRepNominaContratista.QRLabel27Print(sender: TObject;
  var Value: String);
begin
  Value:=Trim(Value);
end;

procedure TQckRepNominaContratista.QRLabel12Print(sender: TObject;
  var Value: String);
begin
  Value:=Trim(Value);
end;

procedure TQckRepNominaContratista.QRLabel7Print(sender: TObject;
  var Value: String);
begin
  Value:=Trim(Value);
end;

procedure TQckRepNominaContratista.QRLabel6Print(sender: TObject;
  var Value: String);
begin
  Value:=Trim(Value);
end;

procedure TQckRepNominaContratista.QRLabel35Print(sender: TObject;
  var Value: String);
begin
  Value:=Trim(Value);
end;

procedure TQckRepNominaContratista.QRGroup2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  //if dmNomina.QryRepNomGralSECCION_EMP_DESC.Value = 'No Aplica' then
  //PrintBand := False else PrintBand := True;
end;

procedure TQckRepNominaContratista.QRBand3AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  Inc(ContDet);
end;

procedure TQckRepNominaContratista.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if ContDet > 1 then
  begin
    ContDet:=0;
    PrintBand:=True
  end else
  begin
    ContDet:=0;
    PrintBand:=False;
    QRExpr1.Reset;
    QRExpr18.Reset;
    QRExpr17.Reset;
    QRExpr23.Reset;
    QRExpr20.Reset;
    QRExpr19.Reset;
    QRExpr6.Reset;
    QRExpr22.Reset;
    QRExpr24.Reset;
    QRExpr7.Reset;
  end;
end;

procedure TQckRepNominaContratista.QRLabel10Print(sender: TObject;
  var Value: String);
  var
     xTipo:String;
begin
{  xTipo:='';
  case glbTipoNom of
  1 : xTipo:='Semanal';
  2 : xTipo:='Quincenal';
  3 : xTipo:='Mensual';
  4 : xTipo:='Ocasionales';
  end;
  if xTipo <> '' then
  Value:=Value + ' : '+xTipo;}
end;

end.
