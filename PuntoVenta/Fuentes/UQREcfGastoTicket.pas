unit UQREcfGastoTicket;

interface

uses
  Windows, SysUtils, Classes, Graphics, Controls,
  QuickRpt, QRCtrls, DB,
  UEcfGastoPrintData, UQrJpgHelper,
  ExtCtrls;

type
  TfrmQREcfGastoTicket = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    qrEmpresa: TQRLabel;
    qrDireccionEmpresa: TQRLabel;
    qrTelefonoEmpresa: TQRLabel;
    qrRncEmpresa: TQRLabel;

    ColumnHeaderBand1: TQRBand;
    qrTipoDoc: TQRLabel;
    qrEncf: TQRLabel;
    qrFecha: TQRLabel;
    qrTrn: TQRLabel;
    qrProveedor: TQRLabel;
    qrDocProveedor: TQRLabel;
    qrLineaCab1: TQRShape;
    qrDescripcionCab: TQRLabel;
    qrMontoCab: TQRLabel;

    QRSubDetail1: TQRSubDetail;
    qrDescripcion: TQRLabel;
    qrCantidadPrecio: TQRLabel;
    qrMontoLinea: TQRLabel;
    qrImpuestosLinea: TQRLabel;

    PageFooterBand1: TQRBand;
    qrLineaTotales: TQRShape;
    qrBase: TQRLabel;
    qrItbis: TQRLabel;
    qrTotalFiscal: TQRLabel;
    qrRetItbis: TQRLabel;
    qrRetIsr: TQRLabel;
    qrNeto: TQRLabel;

    SummaryBand1: TQRBand;
    qrEstado: TQRLabel;
    qrCodigoSeg: TQRLabel;
    qrFechaFDigital: TQRLabel;

    ChildBandQr: TQRChildBand;
    QRImage1: TQRImage;
    procedure QRSubDetail1BeforePrint(
      Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    FData: TEcfGastoPrintData;

    function Texto(const ACampo: string): string;
    function Monto(const ACampo: string): Currency;
    function Fmt(AValor: Currency): string;
  public
    procedure Cargar(AData: TEcfGastoPrintData);
    procedure AjustarLongitudUnaPagina;

    procedure AplicarTimbreQr(
      const AUrlImage,
      ACodigoSeguridad,
      AFechaFDigital: string);
  end;

implementation

{$R *.dfm}

function TfrmQREcfGastoTicket.Texto(
  const ACampo: string): string;
begin
  Result := '';

  if (FData <> nil) and
     (FData.Master.FindField(ACampo) <> nil) and
     not FData.Master.FieldByName(ACampo).IsNull then
    Result := Trim(FData.Master.FieldByName(ACampo).AsString);
end;

function TfrmQREcfGastoTicket.Monto(
  const ACampo: string): Currency;
begin
  Result := 0;

  if (FData <> nil) and
     (FData.Master.FindField(ACampo) <> nil) and
     not FData.Master.FieldByName(ACampo).IsNull then
    Result := FData.Master.FieldByName(ACampo).AsCurrency;
end;

function TfrmQREcfGastoTicket.Fmt(
  AValor: Currency): string;
begin
  Result := FormatFloat('#,##0.00', AValor);
end;

procedure TfrmQREcfGastoTicket.Cargar(
  AData: TEcfGastoPrintData);
begin
  FData := AData;

  DataSet := FData.Master;
  QRSubDetail1.DataSet := FData.Detalle;

  qrEmpresa.Caption := Texto('EMPRESA');
  qrDireccionEmpresa.Caption := Texto('DIRECCION_EMISOR');
  qrRncEmpresa.Caption := 'RNC: ' + Texto('RNC_EMISOR');
  qrTelefonoEmpresa.Caption := '';
  qrTelefonoEmpresa.Enabled := False;

  qrTipoDoc.Caption :=
    FData.TipoEcfTexto + ' - ' +
    FData.TipoEcfDescripcion;

  qrEncf.Caption := 'e-NCF: ' + Texto('ENCF');

  qrFecha.Caption :=
    'Fecha: ' +
    FormatDateTime(
      'dd/mm/yyyy',
      FData.Master.FieldByName('FECHA_DOCUMENTO').AsDateTime);

  qrTrn.Caption :=
    'TRN: ' + IntToStr(FData.Trn);

  if Texto('TIPO_CF') = '41' then
  begin
    qrProveedor.Caption :=
      'Proveedor: ' + Texto('PROVEEDOR');

    qrDocProveedor.Caption :=
      'RNC/Cedula: ' + Texto('DOCUMENTO_PROVEEDOR');
  end
  else
  begin
    qrProveedor.Caption :=
      'Concepto gasto menor';

    qrDocProveedor.Caption := '';
  end;

  qrBase.Caption :=
    'Base / Exento: RD$ ' +
    Fmt(Monto('BASE_FISCAL'));

  qrItbis.Caption :=
    'ITBIS: RD$ ' +
    Fmt(Monto('TOTAL_ITBIS'));

  qrTotalFiscal.Caption :=           
    'TOTAL FISCAL: RD$ ' +
    Fmt(Monto('MONTO_TOTAL'));

  qrRetItbis.Caption :=
    'ITBIS Retenido: RD$ ' +
    Fmt(Monto('TOTAL_RET_ITBIS'));

  qrRetIsr.Caption :=
    'ISR Retenido: RD$ ' +
    Fmt(Monto('TOTAL_RET_ISR'));

  qrNeto.Caption :=
    'NETO PAGADO: RD$ ' + Fmt(Monto('MONTO_PAGADO'));

  qrEstado.Caption :=
    'Estado DGII: ' + Texto('ESTADO');

  qrCodigoSeg.Caption := '';
  qrFechaFDigital.Caption := '';

  QRImage1.Enabled := False;
  ChildBandQr.Height := 0;
end;

procedure TfrmQREcfGastoTicket.AjustarLongitudUnaPagina;
var
  Intentos: Integer;
begin
  Intentos := 0;

  Prepare;

  while (PageNumber > 1) and
        (Intentos < 80) do
  begin
    Page.Length := Page.Length + 0.25;
    Prepare;
    Inc(Intentos);
  end;
end;

procedure TfrmQREcfGastoTicket.AplicarTimbreQr(
  const AUrlImage,
  ACodigoSeguridad,
  AFechaFDigital: string);
begin
  qrCodigoSeg.Caption :=
    'Codigo Seguridad: ' +
    Trim(ACodigoSeguridad);

  qrFechaFDigital.Caption :=
    'Fecha Firma Digital: ' +
    Trim(AFechaFDigital);

  QRImage1.Enabled := False;
  ChildBandQr.Height := 0;

  if Trim(AUrlImage) = '' then
  begin
    AjustarLongitudUnaPagina;
    Exit;
  end;

  ChildBandQr.Height := 112;
  QRImage1.Enabled := True;

  SetQrUrlAsJpgToQRImage(
    AUrlImage,
    QRImage1,
    45,
    PrinterSettings.PrinterIndex
  );

  {
    Mismo patron usado en Punto de Ventas:
    Prepare, verificar PageNumber y aumentar Page.Length
    hasta conseguir una sola pagina.
  }
  AjustarLongitudUnaPagina;
end;

procedure TfrmQREcfGastoTicket.QRSubDetail1BeforePrint(
  Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  Q: TDataSet;
begin
  PrintBand := False;

  if (FData = nil) or
     not FData.Detalle.Active or
     FData.Detalle.IsEmpty then
    Exit;

  Q := FData.Detalle;

  qrDescripcion.Caption :=
    Q.FieldByName('DESCRIPCION').AsString;

  qrCantidadPrecio.Caption :=
    FormatFloat('0.####', Q.FieldByName('CANTIDAD').AsFloat) +
    ' x ' +
    FormatFloat('#,##0.00', Q.FieldByName('PRECIO').AsCurrency);

  qrMontoLinea.Caption :=
    'RD$ ' +
    FormatFloat('#,##0.00', Q.FieldByName('VALOR').AsCurrency);

  qrImpuestosLinea.Caption :=
    'ITBIS ' +
    FormatFloat('#,##0.00', Q.FieldByName('MONTO_ITBIS').AsCurrency) +
    '  Ret.ITBIS ' +
    FormatFloat('#,##0.00',
      Q.FieldByName('MONTO_ITBIS_RETENIDO').AsCurrency) +
    '  Ret.ISR ' +
    FormatFloat('#,##0.00',
      Q.FieldByName('MONTO_ISR_RETENIDO').AsCurrency);

  PrintBand := True;
end;

end.
