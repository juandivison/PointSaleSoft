unit UQckRepCartaRutaVehTpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, QRCtrls, ExtCtrls, JPEG;

type
  TqckCartaRutaVehTpl = class(TQuickRep)
    bndHeader: TQRBand;
    bndDetail: TQRBand;
    bndFooter: TQRBand;
    imgLogo: TQRImage;
    lblFecha: TQRLabel;
    qrmDestinatario: TQRMemo;
    qrmCuerpo: TQRRichText;
    lblTipoCap: TQRLabel;
    lblTipoVal: TQRLabel;
    lblMarcaCap: TQRLabel;
    lblMarcaVal: TQRLabel;
    lblModeloCap: TQRLabel;
    lblModeloVal: TQRLabel;
    lblChasisCap: TQRLabel;
    lblChasisVal: TQRLabel;
    lblMaquinaCap: TQRLabel;
    lblMaquinaVal: TQRLabel;
    lblColorCap: TQRLabel;
    lblColorVal: TQRLabel;
    lblAnioCap: TQRLabel;
    lblAnioVal: TQRLabel;
    qrmNota: TQRMemo;
    shpFirma: TQRShape;
    lblCargoFirma: TQRLabel;
    lblPieDireccion: TQRLabel;
    lblPieTelefonos: TQRLabel;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText33: TQRDBText;
    lblTitulo: TQRLabel;
    lblNombreFirma: TQRLabel;
    procedure bndHeaderBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    FNumeroCarta: string;
    FCiudadEmision: string;
    FFechaEmisionTexto: string;
    FTituloDocumento: string;
    FDestinatario: string;
    FNumeroControl: string;
    FCuerpoTexto: string;
    FTipoVehiculo: string;
    FMarca: string;
    FModelo: string;
    FChasis: string;
    FMaquina: string;
    FColor: string;
    FAnio: string;
    FTextoDocumentos: string;
    FTextoAgradecimiento: string;
    FCargoFirma: string;
    FDireccionPie: string;
    FTelefonosPie: string;
    FRutaLogo: string;
    FValoresAplicados: Boolean;
    FNombreFirma: string;
    procedure InicializarValores;
    procedure AplicarValores;
    procedure CargarRichText(AControl: TQRRichText; const ARtf: string);
  public
    constructor Create(AOwner: TComponent); override;
    property NumeroCarta: string read FNumeroCarta write FNumeroCarta;
    property CiudadEmision: string read FCiudadEmision write FCiudadEmision;
    property FechaEmisionTexto: string read FFechaEmisionTexto write FFechaEmisionTexto;
    property TituloDocumento: string read FTituloDocumento write FTituloDocumento;
    property Destinatario: string read FDestinatario write FDestinatario;
    property NumeroControl: string read FNumeroControl write FNumeroControl;
    property CuerpoTexto: string read FCuerpoTexto write FCuerpoTexto;
    property TipoVehiculo: string read FTipoVehiculo write FTipoVehiculo;
    property Marca: string read FMarca write FMarca;
    property Modelo: string read FModelo write FModelo;
    property Chasis: string read FChasis write FChasis;
    property Maquina: string read FMaquina write FMaquina;
    property Color: string read FColor write FColor;
    property Anio: string read FAnio write FAnio;
    property TextoDocumentos: string read FTextoDocumentos write FTextoDocumentos;
    property TextoAgradecimiento: string read FTextoAgradecimiento write FTextoAgradecimiento;
    property CargoFirma: string read FCargoFirma write FCargoFirma;
    property DireccionPie: string read FDireccionPie write FDireccionPie;
    property TelefonosPie: string read FTelefonosPie write FTelefonosPie;
    property RutaLogo: string read FRutaLogo write FRutaLogo;
    procedure PrepararReporte;
    property NombreFirma: string read FNombreFirma write FNombreFirma;

  end;                                          

var
  qckCartaRutaVehTpl: TqckCartaRutaVehTpl;

implementation

uses UDatmodDatosGenerales, UDatModCompania;

{$R *.dfm}

constructor TqckCartaRutaVehTpl.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  InicializarValores;
end;

procedure TqckCartaRutaVehTpl.InicializarValores;
begin
  FNumeroCarta := 'TIEMBRE/2025';
  FCiudadEmision := 'HIGUEY, RD';
  FFechaEmisionTexto := '19/DICIEMBRE/2025';
  FTituloDocumento := 'CARTA DE RUTA';
  FDestinatario := 'A LA: DIRECCION GENERAL DE SEGURIDAD DE TRANSITO Y TRANSPORTE' + #13#10 +
                   '(DIGESETT) Y/O POLICIA NACIONAL.';
  FNumeroControl := 'C/0';
  FCuerpoTexto := 'Hacemos la certificacion y al mismo tiempo hacemos constar que el o la Senor/a ' +
                  'CLIENTE GENERAL con Cédula No.  es responsable del vehiculo descrito a continuacion:';
  FTipoVehiculo := 'MOTOCICLETA';
  FMarca := '';
  FModelo := '';
  FChasis := '';
  FMaquina := '';
  FColor := '';
  FAnio := '';
  FTextoDocumentos := '     Sus documentos están en la Direccion General de Impuestos Internos.';
  FTextoAgradecimiento := 'Agradecemos todas las colaboraciones y consideraciones posibles para esta persona hasta que sus documentos sean entregados.';
  FCargoFirma := '';
  FNombreFirma := '';
  FDireccionPie := dmdatos.qryMembreteLINEA2.Value;
  FTelefonosPie := dmcompania.tblCompaniatelefono.value;
  FRutaLogo := '';
  FValoresAplicados := False;
end;

procedure TqckCartaRutaVehTpl.AplicarValores;
begin
  if FValoresAplicados then
    Exit;

  if FileExists(Trim(FRutaLogo)) then
    imgLogo.Picture.LoadFromFile(Trim(FRutaLogo))
  else
    imgLogo.Picture := nil;

  //lblLugar.Caption := UpperCase(Trim(FCiudadEmision));
  lblFecha.Caption := UpperCase(Trim(FFechaEmisionTexto));
  //lblNoCarta.Caption := Trim(FNumeroCarta);
  lblTitulo.Caption := UpperCase(Trim(FTituloDocumento));

  qrmDestinatario.Lines.Text := Trim(FDestinatario);
  //lblControl.Caption := Trim(FNumeroControl);
  //qrmCuerpo.Lines.Text := Trim(FCuerpoTexto);
  CargarRichText(qrmCuerpo, Trim(FCuerpoTexto));

  lblTipoVal.Caption := UpperCase(Trim(FTipoVehiculo));
  lblMarcaVal.Caption := UpperCase(Trim(FMarca));
  lblModeloVal.Caption := UpperCase(Trim(FModelo));
  lblChasisVal.Caption := UpperCase(Trim(FChasis));
  lblMaquinaVal.Caption := UpperCase(Trim(FMaquina));
  lblColorVal.Caption := UpperCase(Trim(FColor));
  lblAnioVal.Caption := UpperCase(Trim(FAnio));

  qrmNota.Lines.Clear;
  qrmNota.Lines.Add(Trim(FTextoDocumentos));
  qrmNota.Lines.Add('');
  qrmNota.Lines.Add(Trim(FTextoAgradecimiento));

  lblNombreFirma.Caption := Trim(FNombreFirma);
  lblCargoFirma.Caption := UpperCase(Trim(FCargoFirma));
  lblPieDireccion.Caption := Trim(FDireccionPie);
  lblPieTelefonos.Caption := Trim(FTelefonosPie);

  FValoresAplicados := True;
end;

procedure TqckCartaRutaVehTpl.PrepararReporte;
begin
  FValoresAplicados := False;
  AplicarValores;
end;

procedure TqckCartaRutaVehTpl.bndHeaderBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  //if Assigned(qckCartaRutaVehTpl) then
  //qckCartaRutaVehTpl.AllDataSets.Add(dmDatos.qryMembrete);
  AplicarValores;
end;

procedure TqckCartaRutaVehTpl.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  //dmDatos.qryMembrete.Close;
  //dmDatos.qryMembrete.Open;
end;

procedure TqckCartaRutaVehTpl.CargarRichText(AControl: TQRRichText; const ARtf: string);
var
  SS: TStringStream;
begin
  SS := TStringStream.Create(ARtf);
  try
    AControl.Lines.Clear;
    AControl.Lines.LoadFromStream(SS);
  finally
    SS.Free;
  end;
end;

end.
