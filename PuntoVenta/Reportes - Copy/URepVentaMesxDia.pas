unit URepVentaMesxDia;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckRepVentaMesxDia = class(TQuickRep)
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText9: TQRDBText;
    QRSysData2: TQRSysData;
    qrTpaginas: TQRLabel;
    QRBand3: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel38: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRBand4: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    QRExpr13: TQRExpr;
    QRExpr14: TQRExpr;
    QRExpr15: TQRExpr;
    QRExpr16: TQRExpr;
    QRExpr17: TQRExpr;
    QRExpr18: TQRExpr;
    QRExpr19: TQRExpr;
    QRExpr20: TQRExpr;
    QRExpr21: TQRExpr;
    QRExpr22: TQRExpr;
    QRExpr23: TQRExpr;
    QRExpr24: TQRExpr;
    QRExpr25: TQRExpr;
    QRExpr26: TQRExpr;
    QRExpr27: TQRExpr;
    QRExpr28: TQRExpr;
    QRExpr29: TQRExpr;
    QRExpr1: TQRExpr;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    QRDBText35: TQRDBText;
    QRDBText36: TQRDBText;
    QRDBText37: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRSysData3: TQRSysData;
    QRExpr30: TQRExpr;
    QRExpr31: TQRExpr;
    QRExpr32: TQRExpr;
    QRExpr33: TQRExpr;
    QRExpr34: TQRExpr;
    QRExpr35: TQRExpr;
    QRExpr36: TQRExpr;
    procedure QRLabel3Print(sender: TObject; var Value: String);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRDBText7Print(sender: TObject; var Value: String);
    procedure QRDBText37Print(sender: TObject; var Value: String);
    procedure QRDBText36Print(sender: TObject; var Value: String);
    procedure QRDBText35Print(sender: TObject; var Value: String);
    procedure QRDBText34Print(sender: TObject; var Value: String);
    procedure QRDBText33Print(sender: TObject; var Value: String);
    procedure QRDBText32Print(sender: TObject; var Value: String);
    procedure QRDBText28Print(sender: TObject; var Value: String);
    procedure QRDBText13Print(sender: TObject; var Value: String);
    procedure QRDBText17Print(sender: TObject; var Value: String);
    procedure QRDBText16Print(sender: TObject; var Value: String);
    procedure QRDBText15Print(sender: TObject; var Value: String);
    procedure QRDBText12Print(sender: TObject; var Value: String);
    procedure QRDBText11Print(sender: TObject; var Value: String);
    procedure QRDBText27Print(sender: TObject; var Value: String);
    procedure QRDBText29Print(sender: TObject; var Value: String);
    procedure QRDBText26Print(sender: TObject; var Value: String);
    procedure QRDBText25Print(sender: TObject; var Value: String);
    procedure QRDBText22Print(sender: TObject; var Value: String);
    procedure QRDBText21Print(sender: TObject; var Value: String);
    procedure QRDBText20Print(sender: TObject; var Value: String);
    procedure QRDBText19Print(sender: TObject; var Value: String);
    procedure QRDBText5Print(sender: TObject; var Value: String);
    procedure QRDBText23Print(sender: TObject; var Value: String);
    procedure QRDBText14Print(sender: TObject; var Value: String);
    procedure QRDBText24Print(sender: TObject; var Value: String);
    procedure QRDBText30Print(sender: TObject; var Value: String);
    procedure QRDBText31Print(sender: TObject; var Value: String);
    procedure QRDBText2Print(sender: TObject; var Value: String);
    procedure QRDBText3Print(sender: TObject; var Value: String);
    procedure QRDBText4Print(sender: TObject; var Value: String);
    procedure QRDBText6Print(sender: TObject; var Value: String);
    procedure QRExpr36Print(sender: TObject; var Value: String);
    procedure QRExpr3Print(sender: TObject; var Value: String);
    procedure QRExpr4Print(sender: TObject; var Value: String);
    procedure QRExpr5Print(sender: TObject; var Value: String);
    procedure QRExpr6Print(sender: TObject; var Value: String);
    procedure QRExpr7Print(sender: TObject; var Value: String);
    procedure QRExpr8Print(sender: TObject; var Value: String);
    procedure QRExpr9Print(sender: TObject; var Value: String);
    procedure QRExpr10Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  qckRepVentaMesxDia: TqckRepVentaMesxDia;

implementation

uses UDatModReportes, UGlobal, UDatModCompania;

{$R *.DFM}

procedure TqckRepVentaMesxDia.QRLabel3Print(sender: TObject;
  var Value: String);
begin
  Value := FormatDatetime(Shortdateformat,dmReportes.qryDatosRepVentaMesxDia.params[0].value)+
                          ' al '+FormatDatetime(Shortdateformat,
                          dmReportes.qryDatosRepVentaMesxDia.params[0].value);
end;

procedure TqckRepVentaMesxDia.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  dmCompania.tblCompania.close;
  dmCompania.tblCompania.open;
  dmCompania.tblCompania.Locate('codigo',glbCia_Key,[]);
end;

procedure TqckRepVentaMesxDia.QRDBText7Print(sender: TObject;
  var Value: String);
begin
  Value:='RNC-'+Value;
end;

procedure TqckRepVentaMesxDia.QRDBText37Print(sender: TObject;
  var Value: String);
begin
  if (Value = '0.00') then Value := '';
end;

procedure TqckRepVentaMesxDia.QRDBText36Print(sender: TObject;
  var Value: String);
begin
  if (Value = '0.00') then Value := '';
end;

procedure TqckRepVentaMesxDia.QRDBText35Print(sender: TObject;
  var Value: String);
begin
  if (Value = '0.00') then Value := '';
end;

procedure TqckRepVentaMesxDia.QRDBText34Print(sender: TObject;
  var Value: String);
begin
  if (Value = '0.00') then Value := '';
end;

procedure TqckRepVentaMesxDia.QRDBText33Print(sender: TObject;
  var Value: String);
begin
  if (Value = '0.00') then Value := '';
end;

procedure TqckRepVentaMesxDia.QRDBText32Print(sender: TObject;
  var Value: String);
begin
  if (Value = '0.00') then Value := '';
end;

procedure TqckRepVentaMesxDia.QRDBText28Print(sender: TObject;
  var Value: String);
begin
  if (Value = '0.00') then Value := '';
end;

procedure TqckRepVentaMesxDia.QRDBText13Print(sender: TObject;
  var Value: String);
begin
  if (Value = '0.00') then Value := '';
end;

procedure TqckRepVentaMesxDia.QRDBText17Print(sender: TObject;
  var Value: String);
begin
  if (Value = '0.00') then Value := '';
end;

procedure TqckRepVentaMesxDia.QRDBText16Print(sender: TObject;
  var Value: String);
begin
  if (Value = '0.00') then Value := '';
end;

procedure TqckRepVentaMesxDia.QRDBText15Print(sender: TObject;
  var Value: String);
begin
  if (Value = '0.00') then Value := '';
end;

procedure TqckRepVentaMesxDia.QRDBText12Print(sender: TObject;
  var Value: String);
begin
  if (Value = '0.00') then Value := '';
end;

procedure TqckRepVentaMesxDia.QRDBText11Print(sender: TObject;
  var Value: String);
begin
  if (Value = '0.00') then Value := '';
end;

procedure TqckRepVentaMesxDia.QRDBText27Print(sender: TObject;
  var Value: String);
begin
  if (Value = '0.00') then Value := '';
end;

procedure TqckRepVentaMesxDia.QRDBText29Print(sender: TObject;
  var Value: String);
begin
  if (Value = '0.00') then Value := '';
end;

procedure TqckRepVentaMesxDia.QRDBText26Print(sender: TObject;
  var Value: String);
begin
  if (Value = '0.00') then Value := '';
end;

procedure TqckRepVentaMesxDia.QRDBText25Print(sender: TObject;
  var Value: String);
begin
  if (Value = '0.00') then Value := '';
end;

procedure TqckRepVentaMesxDia.QRDBText22Print(sender: TObject;
  var Value: String);
begin
  if (Value = '0.00') then Value := '';
end;

procedure TqckRepVentaMesxDia.QRDBText21Print(sender: TObject;
  var Value: String);
begin
  if (Value = '0.00') then Value := '';
end;

procedure TqckRepVentaMesxDia.QRDBText20Print(sender: TObject;
  var Value: String);
begin
  if (Value = '0.00') then Value := '';
end;

procedure TqckRepVentaMesxDia.QRDBText19Print(sender: TObject;
  var Value: String);
begin
  if (Value = '0.00') then Value := '';
end;

procedure TqckRepVentaMesxDia.QRDBText5Print(sender: TObject;
  var Value: String);
begin
  if (Value = '0.00') then Value := '';
end;

procedure TqckRepVentaMesxDia.QRDBText23Print(sender: TObject;
  var Value: String);
begin
  if (Value = '0.00') then Value := '';
end;

procedure TqckRepVentaMesxDia.QRDBText14Print(sender: TObject;
  var Value: String);
begin
  if (Value = '0.00') then Value := '';
end;

procedure TqckRepVentaMesxDia.QRDBText24Print(sender: TObject;
  var Value: String);
begin
  if (Value = '0.00') then Value := '';
end;

procedure TqckRepVentaMesxDia.QRDBText30Print(sender: TObject;
  var Value: String);
begin
  if (Value = '0.00') then Value := '';
end;

procedure TqckRepVentaMesxDia.QRDBText31Print(sender: TObject;
  var Value: String);
begin
  if (Value = '0.00') then Value := '';
end;

procedure TqckRepVentaMesxDia.QRDBText2Print(sender: TObject;
  var Value: String);
begin
  if (Value = '0.00') then Value := '';
end;

procedure TqckRepVentaMesxDia.QRDBText3Print(sender: TObject;
  var Value: String);
begin
  if (Value = '0.00') then Value := '';
end;

procedure TqckRepVentaMesxDia.QRDBText4Print(sender: TObject;
  var Value: String);
begin
  if (Value = '0.00') then Value := '';
end;

procedure TqckRepVentaMesxDia.QRDBText6Print(sender: TObject;
  var Value: String);
begin
  if (Value = '0.00') then Value := '';
end;

procedure TqckRepVentaMesxDia.QRExpr36Print(sender: TObject;
  var Value: String);
begin
  if (Value = '0.00') then Value := '';
end;

procedure TqckRepVentaMesxDia.QRExpr3Print(sender: TObject;
  var Value: String);
begin
  if (Value = '0.00') then Value := '';
end;

procedure TqckRepVentaMesxDia.QRExpr4Print(sender: TObject;
  var Value: String);
begin
  if (Value = '0.00') then Value := '';
end;

procedure TqckRepVentaMesxDia.QRExpr5Print(sender: TObject;
  var Value: String);
begin
  if (Value = '0.00') then Value := '';
end;

procedure TqckRepVentaMesxDia.QRExpr6Print(sender: TObject;
  var Value: String);
begin
  if (Value = '0.00') then Value := '';
end;

procedure TqckRepVentaMesxDia.QRExpr7Print(sender: TObject;
  var Value: String);
begin
  if (Value = '0.00') then Value := '';
end;

procedure TqckRepVentaMesxDia.QRExpr8Print(sender: TObject;
  var Value: String);
begin
  if (Value = '0.00') then Value := '';
end;

procedure TqckRepVentaMesxDia.QRExpr9Print(sender: TObject;
  var Value: String);
begin
  if (Value = '0.00') then Value := '';
end;

procedure TqckRepVentaMesxDia.QRExpr10Print(sender: TObject;
  var Value: String);
begin
  if (Value = '0.00') then Value := '';
end;

end.
