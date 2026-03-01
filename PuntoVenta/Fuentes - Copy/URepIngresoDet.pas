unit URepIngresoDet;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckRepTransCxc = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRLabel8: TQRLabel;
    QRDBText2: TQRDBText;
    QRSysData3: TQRSysData;
    QRLabel32: TQRLabel;
    TPag: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText24: TQRDBText;
    QRImage1: TQRImage;
    ChildBand2: TQRChildBand;
    QRShape4: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel15: TQRLabel;
    qrLabelDescTipoComp: TQRLabel;
    ColumnHeaderSubDetail: TQRBand;
    QRLabel20: TQRLabel;
    QRLabel22: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    GroupFooterSubDetail: TQRBand;
    QRLabel25: TQRLabel;
    ChildBand1: TQRChildBand;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRExpr1: TQRExpr;
    QRDBText3: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText1: TQRDBText;
    QRLabel1: TQRLabel;
    QRDBText18: TQRDBText;
    procedure PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure ChildBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public

  end;

var
  qckRepTransCxc: TqckRepTransCxc;

implementation

uses UDatModCompania, UDatModClientes, UGlobal, UDatModCxc;


{$R *.DFM}

procedure TqckRepTransCxc.PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  xGrafico : String;
begin
  xGrafico:=FileToUse('Grafico','Logo.jpg');
  if (xGrafico <> '') then
  QRImage1.Picture.LoadFromFile(xGrafico);
end;

procedure TqckRepTransCxc.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  qckRepTransCxc.AllDataSets.Add(dmCompania.tblCompania);
  //qckRepTransCxc.AllDataSets.Add(dmcxc.qryCliente);
end;

procedure TqckRepTransCxc.ChildBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if dmCxc.qryRepTransCxcNDB_NCRNUMERO_NCF.IsNull then
  begin
    QRLabel4.Enabled  := False;
    QRDBText3.Enabled := False;
    qrLabelDescTipoComp.Enabled := False;
  end;
end;

end.
