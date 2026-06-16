unit UReporteNomina;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckRepNomina = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    qrTpaginas: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText5: TQRDBText;
    QRBand2: TQRBand;
    QRLabel1: TQRLabel;
    QRTARIFA: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRBand3: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRExpr1: TQRExpr;
    QRBand4: TQRBand;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRLabel11: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBText13: TQRDBText;
    QRExpr8: TQRExpr;
    QRLabel12: TQRLabel;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRLabel13: TQRLabel;
    ChildBand1: TQRChildBand;
    QRLabel14: TQRLabel;
    procedure QRLabel3Print(sender: TObject; var Value: String);
    procedure QRDBText8Print(sender: TObject; var Value: String);
    procedure QRDBText7Print(sender: TObject; var Value: String);
    procedure QRDBText10Print(sender: TObject; var Value: String);
    procedure QRDBText11Print(sender: TObject; var Value: String);
    procedure QRDBText12Print(sender: TObject; var Value: String);
    procedure QRExpr1Print(sender: TObject; var Value: String);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public

  end;              

var
  qckRepNomina: TqckRepNomina;
  sumaRegalia,
  SumaVacaciones,
  SumaBonificaciones:Currency;
implementation

uses UDatModNomina, UGlobal;

{$R *.DFM}

procedure TqckRepNomina.QRLabel3Print(sender: TObject; var Value: String);
begin
  Value := FormatDatetime(Shortdateformat,dmNomina.qryRepNomina.Params[0].Value)+' al '+FormatDatetime(Shortdateformat,dmNomina.qryRepNomina.Params[0].Value);
end;

procedure TqckRepNomina.QRDBText8Print(sender: TObject; var Value: String);
begin
  if Value = '0.00' then Value:='';
end;

procedure TqckRepNomina.QRDBText7Print(sender: TObject; var Value: String);
begin
  if Value = '0.00' then Value:='';
end;

procedure TqckRepNomina.QRDBText10Print(sender: TObject;
  var Value: String);
begin
  if Value = '0.00' then Value:='';
end;

procedure TqckRepNomina.QRDBText11Print(sender: TObject;
  var Value: String);
begin
  if Value = '0.00' then Value:='';
end;

procedure TqckRepNomina.QRDBText12Print(sender: TObject;
  var Value: String);
begin
  if Value = '0.00' then Value:='';
end;

procedure TqckRepNomina.QRExpr1Print(sender: TObject; var Value: String);
begin
  if Value = '0.00' then Value:='';
end;

procedure TqckRepNomina.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if dmNomina.qryRepNominaREGALIA.Value > 0 then
  sumaRegalia:=sumaRegalia + dmNomina.qryRepNominaREGALIA.Value;
  if dmNomina.qryRepNominaVACACIONES.Value > 0 then
  SumaVacaciones:=SumaVacaciones + dmNomina.qryRepNominaVACACIONES.Value;
  IF dmNomina.qryRepNominaBONIFICACION.Value > 0 then
  SumaBonificaciones:=SumaBonificaciones + dmNomina.qryRepNominaBONIFICACION.Value;
end;

procedure TqckRepNomina.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  sumaRegalia:=0;
  SumaVacaciones:=0;
  SumaBonificaciones:=0;
end;

procedure TqckRepNomina.ChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if (sumaRegalia = 0) or
  (SumaVacaciones = 0) or
  (SumaBonificaciones = 0) then
  begin
    PrintBand:=False;
    ChildBand1.Height:=0;
    exit;
  end;
  QRLabel14.Caption:=
  'Totales Regalia: '+InsertarComa(FloattoStr(sumaRegalia))+
  ' | Vacaciones: '+InsertarComa(FloattoStr(SumaVacaciones))+
  ' | Bonificaciones: '+InsertarComa(FloattoStr(SumaBonificaciones));
end;

end.
