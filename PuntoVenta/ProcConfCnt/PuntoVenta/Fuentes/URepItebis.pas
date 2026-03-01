unit URepItebis;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckRepItbis = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRSysData3: TQRSysData;
    QRLabel32: TQRLabel;
    TPag: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText7: TQRDBText;
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText6: TQRDBText;
    SummaryBand1: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText2: TQRDBText;
    QRExpr2: TQRExpr;
    QRLabel8: TQRLabel;
    procedure QRDBText3Print(sender: TObject; var Value: String);
    procedure QRLabel6Print(sender: TObject; var Value: String);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRDBText4Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  qckRepItbis: TqckRepItbis;

implementation
uses UDatModCompania, uglobal, UDatModFactura;

{$R *.DFM}

procedure TqckRepItbis.QRDBText3Print(sender: TObject; var Value: String);
begin
 // if dmFactura.qryRepItbisrnc_numero.IsNull then
 // Value:= dmFactura.qryRepItbiscedula.Value;
end;

procedure TqckRepItbis.QRLabel6Print(sender: TObject; var Value: String);
begin
  Value:= '';
  Value:= 'De '+ FormatDateTime('dd-mmm-yy',ExtraerFecha(dmfactura.qryRepItbis.Params[0].Value))+
          ' a ' + FormatDateTime('dd-mmm-yy',ExtraerFecha(dmfactura.qryRepItbis.Params[1].Value));
end;

procedure TqckRepItbis.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  qckRepItbis.AllDataSets.Add(dmCompania.tblCompania);
end;

procedure TqckRepItbis.QRDBText4Print(sender: TObject; var Value: String);
begin
  if (Value = '') then
  Value:='*** Cliente Contado ***';
end;

end.
