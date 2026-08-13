unit UQREcfGastoCarta;

interface

uses
  Windows, SysUtils, Classes, Graphics, Controls,
  QuickRpt, QRCtrls, DB,
  UEcfGastoPrintData, UQrJpgHelper,
  ExtCtrls;

type
  TfrmQREcfGastoCarta = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    qrEmpresa: TQRLabel;
    qrRncEmpresa: TQRLabel;
    qrDireccionEmpresa: TQRLabel;
    qrTipoDoc: TQRLabel;
    qrEncf: TQRLabel;
    qrFecha: TQRLabel;
    qrTrn: TQRLabel;
    qrEstado: TQRLabel;

    ChildBandProveedor: TQRChildBand;
    qrProveedorTitulo: TQRLabel;
    qrProveedor: TQRLabel;
    qrDocProveedor: TQRLabel;
    qrDireccionProveedor: TQRLabel;

    ColumnHeaderBand1: TQRBand;
    hDesc: TQRLabel;
    hCant: TQRLabel;
    hPrecio: TQRLabel;
    hValor: TQRLabel;
    hItbis: TQRLabel;
    hRetItbis: TQRLabel;
    hRetIsr: TQRLabel;
    qrLineaColumnas: TQRShape;

    QRSubDetail1: TQRSubDetail;
    dDesc: TQRLabel;
    dCant: TQRLabel;
    dPrecio: TQRLabel;
    dValor: TQRLabel;
    dItbis: TQRLabel;
    dRetItbis: TQRLabel;
    dRetIsr: TQRLabel;

    SummaryBand1: TQRBand;
    qrLineaResumen: TQRShape;
    qrBase: TQRLabel;
    qrItbis: TQRLabel;
    qrTotal: TQRLabel;
    qrRetItbis: TQRLabel;
    qrRetIsr: TQRLabel;
    qrNeto: TQRLabel;
    qrCodigoSeg: TQRLabel;
    qrFechaFDigital: TQRLabel;
    qrTrack: TQRLabel;
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

    procedure AplicarTimbreQr(
      const AUrlImage,
      ACodigoSeguridad,
      AFechaFDigital: string);
  end;

implementation

{$R *.dfm}

function TfrmQREcfGastoCarta.Texto(
  const ACampo: string): string;
begin
  Result := '';

  if (FData <> nil) and
     (FData.Master.FindField(ACampo) <> nil) and
     not FData.Master.FieldByName(ACampo).IsNull then
    Result := Trim(FData.Master.FieldByName(ACampo).AsString);
end;

function TfrmQREcfGastoCarta.Monto(
  const ACampo: string): Currency;
begin
  Result := 0;

  if (FData <> nil) and
     (FData.Master.FindField(ACampo) <> nil) and
     not FData.Master.FieldByName(ACampo).IsNull then
    Result := FData.Master.FieldByName(ACampo).AsCurrency;
end;

function TfrmQREcfGastoCarta.Fmt(
  AValor: Currency): string;
begin
  Result := FormatFloat('#,##0.00', AValor);
end;

procedure TfrmQREcfGastoCarta.Cargar(
  AData: TEcfGastoPrintData);
begin
  FData := AData;

  DataSet := FData.Master;
  QRSubDetail1.DataSet := FData.Detalle;

  qrEmpresa.Caption := Texto('EMPRESA');
  qrRncEmpresa.Caption := 'RNC: ' + Texto('RNC_EMISOR');
  qrDireccionEmpresa.Caption := Texto('DIRECCION_EMISOR');

  qrTipoDoc.Caption :=
    FData.TipoEcfTexto + ' - ' +
    FData.TipoEcfDescripcion;

  qrEncf.Caption := 'e-NCF: ' + Texto('ENCF');

  qrFecha.Caption :=
    'Fecha Emision: ' +
    FormatDateTime(
      'dd/mm/yyyy',
      FData.Master.FieldByName('FECHA_DOCUMENTO').AsDateTime);

  qrTrn.Caption :=
    'TRN: ' + IntToStr(FData.Trn);

  qrEstado.Caption :=
    'Estado DGII: ' + Texto('ESTADO');

  if Texto('TIPO_CF') = '41' then
  begin
    ChildBandProveedor.Height := 70;
    qrProveedorTitulo.Caption := 'PROVEEDOR';
    qrProveedor.Caption := Texto('PROVEEDOR');
    qrDocProveedor.Caption :=
      'RNC/Cedula: ' + Texto('DOCUMENTO_PROVEEDOR');
    qrDireccionProveedor.Caption :=
      'Direccion: ' + Texto('DIRECCION_PROVEEDOR');
  end
  else
  begin
    ChildBandProveedor.Height := 0;
  end;

  qrBase.Caption :=
    'Base / Exento: RD$ ' +
    Fmt(Monto('BASE_FISCAL'));

  qrItbis.Caption :=
    'ITBIS: RD$ ' +
    Fmt(Monto('TOTAL_ITBIS'));

  qrTotal.Caption :=
    'TOTAL FISCAL: RD$ ' +
    Fmt(Monto('MONTO_TOTAL'));

  qrRetItbis.Caption :=
    'ITBIS Retenido: RD$ ' +
    Fmt(Monto('TOTAL_RET_ITBIS'));

  qrRetIsr.Caption :=
    'ISR Retenido: RD$ ' +
    Fmt(Monto('TOTAL_RET_ISR'));

  qrNeto.Caption :=
    'NETO PAGADO: RD$ ' +
    Fmt(Monto('MONTO_PAGADO'));

  qrTrack.Caption :=
    'TrackId: ' + Texto('TRACK_ID');

  qrCodigoSeg.Caption := '';
  qrFechaFDigital.Caption := '';

  QRImage1.Enabled := False;

  {
    Sin QR dejamos el resumen compacto. AplicarTimbreQr lo amplía
    solamente cuando URL_IMAGE tiene valor.
  }
  SummaryBand1.Height := 160;
end;

procedure TfrmQREcfGastoCarta.AplicarTimbreQr(
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
  SummaryBand1.Height := 160;

  {
    Si URL_IMAGE no tiene valor, no generamos QR.
    No existe fallback a archivo ni QRDown.
  }
  if Trim(AUrlImage) = '' then
    Exit;

  {
    El QR queda dentro del mismo SummaryBand, inmediatamente debajo
    del TrackId. Así evitamos el espacio que producía el ChildBand.
  }
  SummaryBand1.Height := 190;
  QRImage1.Enabled := True;

  SetQrUrlAsJpgToQRImage(
    AUrlImage,
    QRImage1,
    45,
    PrinterSettings.PrinterIndex
  );
end;

procedure TfrmQREcfGastoCarta.QRSubDetail1BeforePrint(
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

  dDesc.Caption :=
    Q.FieldByName('DESCRIPCION').AsString;

  dCant.Caption :=
    FormatFloat('0.####', Q.FieldByName('CANTIDAD').AsFloat);

  dPrecio.Caption :=
    Fmt(Q.FieldByName('PRECIO').AsCurrency);

  dValor.Caption :=
    Fmt(Q.FieldByName('VALOR').AsCurrency);

  dItbis.Caption :=
    Fmt(Q.FieldByName('MONTO_ITBIS').AsCurrency);

  dRetItbis.Caption :=
    Fmt(Q.FieldByName('MONTO_ITBIS_RETENIDO').AsCurrency);

  dRetIsr.Caption :=
    Fmt(Q.FieldByName('MONTO_ISR_RETENIDO').AsCurrency);

  PrintBand := True;
end;

end.
