// qrOrdenLavanderia.pas
unit UqrOrdenLavanderia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, QRCtrls, ExtCtrls, DB;

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
    QRLabelCliente: TQRLabel;
    QRLabelContacto: TQRLabel;
    QRLabelOperador: TQRLabel;
    QRLabelFecha: TQRLabel;
    QRLabelEntrega: TQRLabel;
    QRLabelFechaEntrega: TQRLabel;
  public
    procedure PrepararEncabezado;
    procedure PrepararReporte(IDOrden: Integer);
  end;

var
  qrOrdenLavanderia: TqrOrdenLavanderia;

implementation

uses dmLavanderia;

{$R *.DFM}

procedure TqrOrdenLavanderia.PrepararEncabezado;
begin
  with dmLavanderia.qryMembrete do
  begin
    Close;
    ParamByName('CODIGO_CIA').AsString := '1';
    Open;
    QRLabelMembrete1.Caption := FieldByName('LINEA1').AsString;
    QRLabelMembrete2.Caption := FieldByName('LINEA2').AsString;
    QRLabelMembrete3.Caption := FieldByName('LINEA3').AsString;
    QRLabelMembrete4.Caption := FieldByName('LINEA4').AsString;
    QRLabelMembrete5.Caption := FieldByName('LINEA5').AsString;
  end;
end;

procedure TqrOrdenLavanderia.PrepararReporte(IDOrden: Integer);
begin
  PrepararEncabezado;
  with dmLavanderia.qryreportOrdenLavanderia do
  begin
    Close;
    ParamByName('ID_ORDEN').AsInteger := IDOrden;
    Open;
  end;

  QRLabelIDOrden.Caption := '#lspc' + IntToStr(IDOrden);
  QRLabelFecha.Caption := 'Fecha Entrada: ' + FormatDateTime('dd/mm/yyyy hh:nn', dmLavanderia.qryreportOrdenLavanderiaFECHA_ENTRADA.AsDateTime);
  QRLabelFechaEntrega.Caption := FormatDateTime('dd/mm/yyyy hh:nn', dmLavanderia.qryreportOrdenLavanderiaFECHA_ENTREGA.AsDateTime);
  QRLabelCliente.Caption := 'Cliente: ' + dmLavanderia.qryreportOrdenLavanderiaNOMBRE_CLIENTE.AsString;
  QRLabelContacto.Caption := 'Teléfono: ' + dmLavanderia.qryreportOrdenLavanderiaTELEF_CONTACTO.AsString;
  QRLabelOperador.Caption := 'Operador: ' + dmLavanderia.qryreportOrdenLavanderiaNOMBRE_OPERADOR.AsString;
  QRLabelNumPiezas.Caption := IntToStr(dmLavanderia.qryreportOrdenLavanderia.RecordCount) + ' Piezas';
end;

end.
