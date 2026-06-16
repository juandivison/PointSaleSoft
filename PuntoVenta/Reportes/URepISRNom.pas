unit URepISRNom;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TQckRepDeducciones = class(TQuickRep)
    QRBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel2: TQRLabel;
    QRCorrespondiente: TQRLabel;
    QRLabel10: TQRLabel;
    QRSysData3: TQRSysData;
    QRLabel28: TQRLabel;
    QRBand2: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText6: TQRDBText;
    QRBand4: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel7: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel3: TQRLabel;
    QRDBText2: TQRDBText;
    QRExpr3: TQRExpr;
    procedure QckRepDeduccionesBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRDBText6Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  QckRepDeducciones: TQckRepDeducciones;

implementation

Uses UDataModNomina, UGlobal;
{$R *.DFM}

procedure TQckRepDeducciones.QckRepDeduccionesBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
Var
  Ano, Mes, Dia : Word;
begin
  DecodeDate(glbFechaNom, Ano, Mes, Dia);
  if glbCheckNomina = 5 then
     Begin
       QRLabel2.Caption := 'LISTADO DE DEDUCCIONES '+glbDeduccion;
     End;
  if DmNom.QryRepNomGralTIPO_NOMINA.Value = 1 Then
     Begin
       QRCorrespondiente.Caption := 'Período del '+FormatDateTime('yyyy-mm-dd',glbFechaNom);
     end
  Else
     if DmNom.QryRepNomGralTIPO_NOMINA.Value = 2 Then
        Begin
          if glbCheckNomina = 5 then
          QRCorrespondiente.Caption :='Desde el '+
           FormatDateTime('dd-mmm',glbFechaInicial)+'  hasta  '+FormatDateTime('dd-mmm-yyyy',glbFechaFinal)
          else
          begin
            if dia = 15 Then
            QRCorrespondiente.Caption := 'Período del '+FormatDateTime('yyyy-mm-dd',EncodeDate(Ano, Mes, 1))+' al '+FormatDateTime('yyyy-mm-dd',glbFechaNom);
            if dia = 30 Then
            QRCorrespondiente.Caption := 'Período del '+FormatDateTime('yyyy-mm-dd',EncodeDate(Ano, Mes, 16))+' al '+FormatDateTime('yyyy-mm-dd',glbFechaNom);
            if (dia = 28) and (mes = 2 )Then
            QRCorrespondiente.Caption := 'Período del '+FormatDateTime('yyyy-mm-dd',EncodeDate(Ano, Mes, 16))+' al '+FormatDateTime('yyyy-mm-dd',glbFechaNom);
            if (dia = 29) and (mes = 2 )Then
            QRCorrespondiente.Caption := 'Período del '+FormatDateTime('yyyy-mm-dd',EncodeDate(Ano, Mes, 16))+' al '+FormatDateTime('yyyy-mm-dd',glbFechaNom);
          end;
        End
  Else
     if DmNom.QryRepNomGralTIPO_NOMINA.Value = 3 Then
        Begin
          QRCorrespondiente.Caption := 'Período del '+FormatDateTime('yyyy-mm-dd',EncodeDate(Ano, Mes, 16))+' al '+FormatDateTime('yyyy-mm-dd',glbFechaNom);
        End;
end;

procedure TQckRepDeducciones.QRDBText6Print(sender: TObject;
  var Value: String);
begin
  if Value = '0.00' then value := '';
end;

end.
