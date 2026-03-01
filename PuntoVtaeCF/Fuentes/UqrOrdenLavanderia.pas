// qrOrdenLavanderia.pas
unit UqrOrdenLavanderia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DelphiZXingQRCode, QuickRpt, QRCtrls, ExtCtrls, DB;

type
  TqrOrdenLavanderia = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRLabelMembrete1: TQRLabel;
    QRLabelMembrete2: TQRLabel;
    QRLabelMembrete3: TQRLabel;
    QRLabelMembrete4: TQRLabel;
    QRLabelMembrete5: TQRLabel;
    QRLabelIDOrden: TQRLabel;
    DetailBand1: TQRBand;
    QRDBTextProducto: TQRDBText;
    QRDBTextCantidad: TQRDBText;
    QRDBTextTotal: TQRDBText;
    SummaryBand1: TQRBand;
    QRLabelSubtotal: TQRLabel;
    QRExprSubtotal: TQRExpr;
    QRLabelTotal: TQRLabel;
    QRExprTotal: TQRExpr;
    QRLabelFechaEntrada: TQRLabel;
    QRLabelFechaEntrega: TQRLabel;
    ColumnHeaderBand1: TQRBand;
    QRLabelCliente: TQRLabel;
    QRLabelContacto: TQRLabel;
    QRShape1: TQRShape;
    ChildBand1: TQRChildBand;
    QRLabelOperador: TQRLabel;
    QRLabelIDOrdenbottom: TQRLabel;
    QRLabelNumPiezas: TQRLabel;
    ChildBand2: TQRChildBand;
    QRImageQR: TQRImage;
    ChildBand3: TQRChildBand;
    QRLabel1: TQRLabel;
    procedure ColumnHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBTextProductoPrint(sender: TObject; var Value: String);
    procedure SummaryBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRLabel1Print(sender: TObject; var Value: String);
    procedure ChildBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  public
    chkCodigoQR:Boolean;
    procedure PrepararEncabezado;
    procedure PrepararReporte(IDOrden: Integer);
    procedure UpdateQR(OrdenID: Integer; Fecha: TDateTime);
  end;

var
  qrOrdenLavanderia: TqrOrdenLavanderia;

implementation

uses UDatModLavanderia, UGlobal;

{$R *.DFM}

procedure TqrOrdenLavanderia.PrepararEncabezado;
begin
  with dmLavanderia.qryMembrete do
  begin
    Close;
    ParamByName('CODIGO_CIA').AsInteger := GlbCia_Key;
    Open;
    QRLabelMembrete1.Caption := FieldByName('LINEA1').AsString;
    QRLabelMembrete2.Caption := FieldByName('LINEA2').AsString;
    QRLabelMembrete3.Caption := FieldByName('LINEA3').AsString;
    QRLabelMembrete4.Caption := FieldByName('LINEA4').AsString;
    QRLabelMembrete5.Caption := FieldByName('LINEA5').AsString;
  end;
end;

procedure TqrOrdenLavanderia.PrepararReporte(IDOrden: Integer);
var
  qrCode: TDelphiZXingQRCode;
  bmp: TBitmap;
  x, y, escala: Integer;
  textoQR: string;
begin
  PrepararEncabezado;
  with dmLavanderia.qryreportOrdenLavanderia do
  begin
    Close;
    ParamByName('ID_ORDEN').AsInteger := IDOrden;
    Open;
  end;

  QRLabelIDOrden.Caption := '#lspc' + IntToStr(IDOrden);
  QRLabelIDOrdenbottom.Caption := '#lspc' + IntToStr(IDOrden);
  QRLabelFechaEntrada.Caption := 'Dejado: ' +
  FormatDateTime('dd/mm/yyyy hh:mm', dmLavanderia.qryreportOrdenLavanderiaFECHA_ENTRADA.Value)+' '+
  FormatDateTime('hh:mm a/p', dmLavanderia.qryreportOrdenLavanderiaHORA_ENTRADA.Value);
  //Entrega: hh a/p ddd mm dd/mm
  QRLabelFechaEntrega.Caption :='Entrega: '+
  FormatDateTime('hh:mm a/p', dmLavanderia.qryreportOrdenLavanderiaHORA_ENTREGA.AsDateTime)+
  ' '+NombreDia[DayOfWeek(dmLavanderia.qryreportOrdenLavanderiaFECHA_ENTREGA.Value)]+' '+
  FormatDateTime('dd/mm', dmLavanderia.qryreportOrdenLavanderiaFECHA_ENTREGA.AsDateTime);
  QRLabelCliente.Caption := 'Cliente: ' + dmLavanderia.qryreportOrdenLavanderiaNOMBRE_CLIENTE.AsString;
  QRLabelContacto.Caption := 'Telf: ' + dmLavanderia.qryreportOrdenLavanderiaTELEF_CONTACTO.AsString;
  QRLabelOperador.Caption := dmLavanderia.qryreportOrdenLavanderiaNOMBRE_OPERADOR.AsString;
  QRLabelNumPiezas.Caption := IntToStr(dmLavanderia.qryreportOrdenLavanderiaCANTPIEZAS.AsInteger) + ' Piezas';

  // Generar QR dinámicamente
  //textoQR := Format('ORDEN:%d|FECHA:%s', [IDOrden, FormatDateTime('yyyymmdd-hhnn', dmLavanderia.qryreportOrdenLavanderiaFECHA_ENTRADA.AsDateTime)]);
  if chkCodigoQR then
  UpdateQR(IDOrden,dmLavanderia.qryreportOrdenLavanderiaFECHA_ENTRADA.Value);

end;

procedure TqrOrdenLavanderia.UpdateQR(OrdenID: Integer; Fecha: TDateTime);
var
  QRCode: TDelphiZXingQRCode;
  Row, Column: Integer;
begin
  QRCode := TDelphiZXingQRCode.Create;
  try
    QRCode.Data := Format('ORDEN:%d|FECHA:%s', [OrdenID, FormatDateTime('yyyymmdd-hhnn', Fecha)]);
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

procedure TqrOrdenLavanderia.ColumnHeaderBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if dmLavanderia.qryreportOrdenLavanderiaDIRECCION_CONT.IsNull then
  ColumnHeaderBand1.Height:=0
  else
  ColumnHeaderBand1.Height:=19;
end;

procedure TqrOrdenLavanderia.QRDBTextProductoPrint(sender: TObject;
  var Value: String);
var
  servStr: String;
begin
  dmLavanderia.qryServOrdenPrenda.Close;
  dmLavanderia.qryServOrdenPrenda.Params[0].Value:= dmLavanderia.qryreportOrdenLavanderiaID_PRENDA.Value;
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

procedure TqrOrdenLavanderia.SummaryBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if not chkCodigoQR then
  SummaryBand1.HasChild:=False;
end;

procedure TqrOrdenLavanderia.QRLabel1Print(sender: TObject;
  var Value: String);
begin
  Value:= dmLavanderia.qryreportOrdenLavanderiaNOTAS.Value;
end;

procedure TqrOrdenLavanderia.ChildBand1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  if Length(dmLavanderia.qryreportOrdenLavanderiaNOTAS.Value) > 0 then
  ChildBand1.HasChild:=True else ChildBand1.HasChild:=False;
end;

end.
