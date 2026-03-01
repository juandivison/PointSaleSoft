unit URepCuadreDiario;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckReporteCuadreDiario = class(TQuickRep)
    QRBand3: TQRBand;
    QRBand4: TQRBand;
    QRDBText1: TQRDBText;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    TPag: TQRLabel;
    QRSysData3: TQRSysData;
    QRLabel11: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText2: TQRDBText;
    QRBand5: TQRBand;
    QRBand6: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel15: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText11: TQRDBText;
    QRBand1: TQRBand;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText15: TQRDBText;
    QRExpr1: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRLabel34: TQRLabel;
    QRExpr12: TQRExpr;
    QRExpr8: TQRExpr;
    ChildBand1: TQRChildBand;
    QRLabel1: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRExpr11: TQRExpr;
    QRLabel31: TQRLabel;
    QRShape1: TQRShape;
    QRLabel35: TQRLabel;
    QRExpr13: TQRExpr;
    QRLabel13: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRDBText21: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRExpr10Print(sender: TObject; var Value: String);
    procedure QRDBText3Print(sender: TObject; var Value: String);
    procedure QRDBText4Print(sender: TObject; var Value: String);
    procedure QRDBText12Print(sender: TObject; var Value: String);
    procedure QRDBText15Print(sender: TObject; var Value: String);
    procedure QRDBText9Print(sender: TObject; var Value: String);
    procedure QRExpr12Print(sender: TObject; var Value: String);
    procedure QRDBText11Print(sender: TObject; var Value: String);
    procedure QRDBText8Print(sender: TObject; var Value: String);
    procedure QRDBText10Print(sender: TObject; var Value: String);
    procedure QRDBText5Print(sender: TObject; var Value: String);
    procedure QRDBText16Print(sender: TObject; var Value: String);
    procedure QRDBText18Print(sender: TObject; var Value: String);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public

  end;

var
  qckReporteCuadreDiario: TqckReporteCuadreDiario;

implementation

uses UCuadreVentaxRuta, UGlobal, UDatModCuadrexRuta, UDatModCompania, UDatModUsuarios;

{$R *.DFM}

procedure TqckReporteCuadreDiario.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  qckReporteCuadreDiario.AllDataSets.Add(dmCompania.tblCompania);
  qckReporteCuadreDiario.AllDataSets.Add(dmCuadrexRuta.qryDetalleCuadreRuta);
end;

procedure TqckReporteCuadreDiario.QRExpr10Print(sender: TObject;
  var Value: String);
begin
  If Value = '0.00' then value :='';
end;

procedure TqckReporteCuadreDiario.QRDBText3Print(sender: TObject;
  var Value: String);
begin
  If Value = '0.00' then value :='';
end;

procedure TqckReporteCuadreDiario.QRDBText4Print(sender: TObject;
  var Value: String);
begin
  If Value = '0.00' then value :='';
end;

procedure TqckReporteCuadreDiario.QRDBText12Print(sender: TObject;
  var Value: String);
begin
  If Value = '0.00' then value :='';
end;

procedure TqckReporteCuadreDiario.QRDBText15Print(sender: TObject;
  var Value: String);
begin
  If Value = '0.00' then value :='';
end;

procedure TqckReporteCuadreDiario.QRDBText9Print(sender: TObject;
  var Value: String);
begin
  If Value = '0.00' then value :='';
end;

procedure TqckReporteCuadreDiario.QRExpr12Print(sender: TObject;
  var Value: String);
begin
  If Value = '0.00' then value :='';
end;

procedure TqckReporteCuadreDiario.QRDBText11Print(sender: TObject;
  var Value: String);
begin
  If Value = '0.00' then value :='';
end;

procedure TqckReporteCuadreDiario.QRDBText8Print(sender: TObject;
  var Value: String);
begin
  If Value = '0.00' then value :='';
end;

procedure TqckReporteCuadreDiario.QRDBText10Print(sender: TObject;
  var Value: String);
begin
  If Value = '0.00' then value :='';
end;

procedure TqckReporteCuadreDiario.QRDBText5Print(sender: TObject;
  var Value: String);
begin
  If Value = '0.00' then value :='';
end;

procedure TqckReporteCuadreDiario.QRDBText16Print(sender: TObject;
  var Value: String);
begin
  If Value = '0.00' then value :='';
end;

procedure TqckReporteCuadreDiario.QRDBText18Print(sender: TObject;
  var Value: String);
begin
  If Value = '0.00' then value :='';
end;

procedure TqckReporteCuadreDiario.ChildBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if varTipousuario >= 2 then
  PrintBand:=False
  else PrintBand:=True;
end;

end.
