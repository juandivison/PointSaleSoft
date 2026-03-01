unit qckRepCompAlquiler;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckCompAlquiler = class(TQuickRep)
    QRBand4: TQRBand;
    QRDBText1: TQRDBText;
    QRBand3: TQRBand;
    QRBand6: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRDBText7: TQRDBText;
    QRBand5: TQRBand;
    QRBand1: TQRBand;
    QRDBText10: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRExpr5: TQRExpr;
    ColumnHeaderBand1: TQRBand;
    QRMemo1: TQRMemo;
    ChildBand1: TQRChildBand;
    QRShape1: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel6: TQRLabel;
    QRShape2: TQRShape;
    QRLabel8: TQRLabel;
    QRExpr3: TQRExpr;
    QRLabel9: TQRLabel;
    QRExpr4: TQRExpr;
    ChildBand2: TQRChildBand;
    QRDBText2: TQRDBText;
    ChildBand3: TQRChildBand;
    ChildBand4: TQRChildBand;
    QRLabel7: TQRLabel;
    ChildBand5: TQRChildBand;
    QRDBText5: TQRDBText;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel2: TQRLabel;
    TPag: TQRLabel;
    QRSysData3: TQRSysData;
    QRLabel11: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel15: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public

  end;

var
  qckCompAlquiler: TqckCompAlquiler;

implementation

uses UDatModInventario, UDatModCompania, Uglobal;

{$R *.DFM}

procedure TqckCompAlquiler.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  dmCompania.tblCompania.Close;
  dmCompania.tblCompania.Open;
  qckCompAlquiler.AllDataSets.Add(dmCompania.tblCompania);
end;

procedure TqckCompAlquiler.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  xGrafico : String;
begin
  //xGrafico:=FileToUse('Grafico','Logo.jpg');
  //if (xGrafico <> '') then
  //QRImage1.Picture.LoadFromFile(xGrafico);
  QRLabel2.Caption := FormatDateTime('dd-mmm-yyyy',
  ExtraerFecha(dmInventario.qryRepAlquilerMasterFECHA.Value));
end;

procedure TqckCompAlquiler.ChildBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if Length(dmInventario.qryRepAlquilerDetDESCRIPCIONSERVICIO.Value) <= 0 then
  ChildBand2.Height:=0
  else ChildBand2.Height:=22;
end;

end.
