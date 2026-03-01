unit UQckRepCodigoBarras;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, SvQrBarcode, DB, RxMemDS;

type
  TqckCodigoBarraProd = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    SvQRBarcode1: TSvQRBarcode;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRDBText3Print(sender: TObject; var Value: String);
    procedure QRDBText5Print(sender: TObject; var Value: String);
    procedure QRDBText1Print(sender: TObject; var Value: String);
  private

  public
    edtCia:String;
  end;

var
  qckCodigoBarraProd: TqckCodigoBarraProd;

implementation

uses UGlobal, UDatModReportes, UDatModCompania, ULabelImpCodBarra;

{$R *.DFM}

procedure TqckCodigoBarraProd.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  dmCompania.tblCompania.Close;
  dmCompania.tblCompania.Open;
  SvQRBarcode1.Text := frmCodigoBarra.qryInvCODIGO.AsString;
end;

procedure TqckCodigoBarraProd.QRDBText3Print(sender: TObject;
  var Value: String);
begin
  Value:='Codigo: '+Value;
end;

procedure TqckCodigoBarraProd.QRDBText5Print(sender: TObject;
  var Value: String);
begin
  Value:='Precio: '+Value;
end;

procedure TqckCodigoBarraProd.QRDBText1Print(sender: TObject;
  var Value: String);
begin
  Value:=edtCia;
end;

end.
