unit URepProdPanEmpleados;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckRepProdEmpleadosPan = class(TQuickRep)
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
    QRLabel9: TQRLabel;
    DetailBand1: TQRBand;
    SummaryBand1: TQRBand;
    QRSubDetail1: TQRSubDetail;
    QRBand3: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRExpr1: TQRExpr;
    QRLabel10: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    procedure QRLabel3Print(sender: TObject; var Value: String);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;

var
  qckRepProdEmpleadosPan: TqckRepProdEmpleadosPan;

implementation
uses UDatModCompania, UDatModPanaderia;
{$R *.DFM}

procedure TqckRepProdEmpleadosPan.QRLabel3Print(sender: TObject;
  var Value: String);
begin
  Value := FormatDateTime('mmm-dd-yyyy',dmPanaderia.qryRepPanProdEmpMaster.Params[0].Value)+
  ' a '+ FormatDateTime('mmm-dd-yyyy',dmPanaderia.qryRepPanProdEmpMaster.Params[1].Value);
end;

procedure TqckRepProdEmpleadosPan.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
    qckRepProdEmpleadosPan.AllDataSets.Add(dmcompania.tblCompania);
end;

end.
