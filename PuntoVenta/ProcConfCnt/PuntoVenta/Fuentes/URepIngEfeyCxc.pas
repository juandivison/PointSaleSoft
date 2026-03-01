unit URepIngEfeyCxc;
//Aun no lo estoy usando

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TQckRepIngEfeyCxc = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    qrTpaginas: TQRLabel;
    QRDBText9: TQRDBText;
    QRBand2: TQRBand;
    QRLabel1: TQRLabel;
    QRTARIFA: TQRLabel;
    QRGroup1: TQRGroup;
    QRExpr1: TQRExpr;
    QRBand3: TQRBand;
    qrFechaTrn: TQRDBText;
    QRDBText8: TQRDBText;
    QRBand5: TQRBand;
    QRExpr3: TQRExpr;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel17: TQRLabel;
    QRDBText1: TQRDBText;
    QRSysData3: TQRSysData;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRBand4: TQRBand;
    QRExpr2: TQRExpr;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    ChildBand1: TQRChildBand;
    QRLabel20: TQRLabel;
    qrTotalCr: TQRLabel;
    QRLabel21: TQRLabel;
    qrTotalDb: TQRLabel;
    QRLabel22: TQRLabel;
    qrTotalVenta: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRGroup2: TQRGroup;
    QRBand6: TQRBand;
    QRExpr5: TQRExpr;
    QRLabel9: TQRLabel;
    QRDBText15: TQRDBText;
    QRLabel14: TQRLabel;
    procedure QRLabel3Print(sender: TObject; var Value: String);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRDBText10Print(sender: TObject; var Value: String);
    procedure QRDBText11Print(sender: TObject; var Value: String);
    procedure QRDBText12Print(sender: TObject; var Value: String);
    procedure QRDBText8Print(sender: TObject; var Value: String);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public

  end;

var
  QckRepIngEfeyCxc: TQckRepIngEfeyCxc;

implementation

uses UDatModReportes, UDebitosycreditosaplicados;

{$R *.DFM}

procedure TQckRepIngEfeyCxc.QRLabel3Print(sender: TObject;
  var Value: String);
begin
  Value := FormatDatetime(Shortdateformat,dmReportes.qryDatosRepVentaDiaria.Params[0].Value)+
                          ' al '+FormatDatetime(Shortdateformat,
                          dmReportes.qryDatosRepVentaDiaria.Params[1].Value);
end;

procedure TQckRepIngEfeyCxc.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
   {if (dmReportes.qryDatosRepVentaDiaria.params[0].value =
           dmReportes.qryDatosRepVentaDiaria.params[1].value) then
   begin
     qckRepVentaDiaria.qrFechaTrn.Enabled:=False;
     QRBand5.HasChild:=True;
   end else QRBand5.HasChild:=False;}
end;

procedure TQckRepIngEfeyCxc.QRDBText10Print(sender: TObject;
  var Value: String);
begin
  if value = '0.00' then value :='';
end;

procedure TQckRepIngEfeyCxc.QRDBText11Print(sender: TObject;
  var Value: String);
begin
  if value = '0.00' then value :='';
end;

procedure TQckRepIngEfeyCxc.QRDBText12Print(sender: TObject;
  var Value: String);
begin
  if value = '0.00' then value :='';
end;

procedure TQckRepIngEfeyCxc.QRDBText8Print(sender: TObject;
  var Value: String);
begin
  if value = '0.00' then value :='';
end;

procedure TQckRepIngEfeyCxc.ChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  frmVerCreditosyDebitosAplicados :=TfrmVerCreditosyDebitosAplicados.Create(nil);
  try
    frmVerCreditosyDebitosAplicados.BuscarDatos(dmReportes.qryDatosRepVentaDiaria.params[0].value,
                                                dmReportes.qryDatosRepVentaDiaria.params[1].value);
    qrTotalDb.Caption:=frmVerCreditosyDebitosAplicados.EditN1.Text;
    qrTotalCr.Caption:=frmVerCreditosyDebitosAplicados.EditN2.Text;
    qrTotalVenta.Caption:= frmVerCreditosyDebitosAplicados.EditN3.Text;
  finally
  frmVerCreditosyDebitosAplicados.Free;
  frmVerCreditosyDebitosAplicados:=Nil;
  end;
end;

end.
