unit UQckStickerprendalavanderia;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  DelphiZXingQRCode, StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  Tqckstickerprenda = class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRLabelIDOrden: TQRLabel;
    QRLabelFechaEntrega: TQRLabel;
    QRDBText1: TQRDBText;
    ChildBand1: TQRChildBand;
    QRDBText2: TQRDBText;
    QRLabel1: TQRLabel;
    ChildBand2: TQRChildBand;
    QRImageQR: TQRImage;
    PageFooterBand1: TQRBand;
    QRShape1: TQRShape;
    QRSysData1: TQRSysData;
    procedure QRDBTextCantidadPrint(sender: TObject; var Value: String);
    procedure QRDBText1Print(sender: TObject; var Value: String);
    procedure QRLabel1Print(sender: TObject; var Value: String);
    procedure ChildBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRSysData1Print(sender: TObject; var Value: String);
  private

  public
     chkCodigoQR:Boolean;
     procedure  UpdateQR(OrdenID:Integer;OrdenPrendaID: Integer);
  end;

var
  qckstickerprenda: Tqckstickerprenda;

implementation
uses UDatModLavanderia, UGlobal;

{$R *.DFM}

procedure Tqckstickerprenda.QRDBTextCantidadPrint(sender: TObject;
  var Value: String);
begin
  Value:=Value+'/'+dmLavanderia.qryrepstickersprendasCANTPIEZAS.AsString;
end;

procedure Tqckstickerprenda.QRDBText1Print(sender: TObject;
  var Value: String);
var
  servStr: String;
begin
  dmLavanderia.qryServOrdenPrenda.Close;
  dmLavanderia.qryServOrdenPrenda.Params[0].Value:= dmLavanderia.qryrepstickersprendasIDSERIEORDEN.Value;
  dmLavanderia.qryServOrdenPrenda.Open;
  dmLavanderia.qryServOrdenPrenda.First;
  servStr := '';
  while not dmLavanderia.qryServOrdenPrenda.Eof do
  begin
    servStr := servStr + Trim(dmLavanderia.qryServOrdenPrendaDESCSERVICIO.Value) + ',';
    dmLavanderia.qryServOrdenPrenda.Next;
  end;

  // Eliminar la última coma si la cadena no está vacía
  if Length(servStr) > 0 then
  begin
    if servStr[Length(servStr)] = ',' then
    begin
      SetLength(servStr, Length(servStr) - 1);
    end;
  end;

  Value := Value + ' ' + servStr;
end;

procedure Tqckstickerprenda.QRLabel1Print(sender: TObject;
  var Value: String);
begin
  Value:='S:'+VarNombreUsuario;
end;

procedure Tqckstickerprenda.UpdateQR(OrdenID:Integer;OrdenPrendaID: Integer);
var
  QRCode: TDelphiZXingQRCode;
  Row, Column: Integer;
begin
  QRCode := TDelphiZXingQRCode.Create;
  try
    QRCode.Data := Format('ORDENID:%d|OrdenPrendaID:%d', [OrdenID, OrdenPrendaID]);
    QRCode.Encoding := TQRCodeEncoding(0); //'Auto','Numeric','Alphanumeric','ISO-8859-1','UTF-8 without BOM','UTF-8 with BOM')
    QRCode.QuietZone := StrToIntDef('4', 4);
    //QRImageQR.SetSize(QRCode.Rows, QRCode.Columns);
    for Row := 0 to QRCode.Rows - 1 do
    begin
      for Column := 0 to QRCode.Columns - 1 do
      begin
        if (QRCode.IsBlack[Row, Column]) then
        begin
          QRImageQR.Canvas.Pixels[Column, Row] := clBlack;
        end else
        begin
          QRImageQR.Canvas.Pixels[Column, Row] := clWhite;
        end;
      end;
    end;
  finally
    QRCode.Free;
  end;
  QRImageQR.Repaint;
end;

procedure Tqckstickerprenda.ChildBand1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  if chkCodigoQR then
  UpdateQR(dmLavanderia.qryrepstickersprendasID_ORDEN.Value,
           dmLavanderia.qryrepstickersprendasIDSERIEORDEN.Value)
  else ChildBand1.HasChild:=False;
end;

procedure Tqckstickerprenda.QRSysData1Print(sender: TObject;
  var Value: String);
begin
  Value:=Value + '/' + dmLavanderia.qryrepstickersprendasCANTPIEZAS.AsString;
end;

end.
