unit UQckRepCartaSaldoTpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, QRCtrls, ExtCtrls, JPEG;

type
  TqckCartaSaldoTpl = class(TQuickRep)
    bndHeader: TQRBand;
    bndDetail: TQRBand;
    bndFooter: TQRBand;
    imgLogo: TQRImage;
    lblLugar: TQRLabel;
    lblFecha: TQRLabel;
    lblTitulo: TQRLabel;
    qrmCierre: TQRMemo;
    lblAtentamente: TQRLabel;
    lblNombreGerente: TQRLabel;
    lblCargoGerente: TQRLabel;
    lblPieDireccion: TQRLabel;
    lblPieTelefonos: TQRLabel;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText33: TQRDBText;
    lblSubtitulo: TQRLabel;
    qrmPendiente: TQRRichText;
    qrmCuerpo: TQRRichText;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    procedure bndHeaderBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    FLugarEmision: string;
    FFechaCortaTexto: string;
    FTituloDocumento: string;
    FCuerpoTexto: string;
    FPendienteTexto: string;
    FCierreTexto: string;
    FNombreGerente: string;
    FCargoGerente: string;
    FNombreEmpresaFirma: string;
    FPieEmpresa: string;
    FPieDireccion: string;
    FPieTelefonos: string;
    FRutaLogo: string;
    FValoresAplicados: Boolean;
    procedure InicializarValores;
    procedure AplicarValores;
    procedure CargarRichText(AControl: TQRRichText; const ARtf: string);
  public
    constructor Create(AOwner: TComponent); override;
    property LugarEmision: string read FLugarEmision write FLugarEmision;
    property FechaCortaTexto: string read FFechaCortaTexto write FFechaCortaTexto;
    property TituloDocumento: string read FTituloDocumento write FTituloDocumento;
    property CuerpoTexto: string read FCuerpoTexto write FCuerpoTexto;
    property PendienteTexto: string read FPendienteTexto write FPendienteTexto;
    property CierreTexto: string read FCierreTexto write FCierreTexto;
    property NombreGerente: string read FNombreGerente write FNombreGerente;
    property CargoGerente: string read FCargoGerente write FCargoGerente;
    property NombreEmpresaFirma: string read FNombreEmpresaFirma write FNombreEmpresaFirma;
    property PieEmpresa: string read FPieEmpresa write FPieEmpresa;
    property PieDireccion: string read FPieDireccion write FPieDireccion;
    property PieTelefonos: string read FPieTelefonos write FPieTelefonos;
    property RutaLogo: string read FRutaLogo write FRutaLogo;
    procedure PrepararReporte;
  end;

var
  qckCartaSaldoTpl: TqckCartaSaldoTpl;

implementation

{$R *.dfm}

constructor TqckCartaSaldoTpl.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  InicializarValores;
end;

procedure TqckCartaSaldoTpl.InicializarValores;
begin
  FLugarEmision := 'Vicente Noble, Barahona, R.D.';
  FFechaCortaTexto := FormatDateTime('dd/mm/yyyy', Date);
  FTituloDocumento := 'CARTA DE SALDO';
  FCuerpoTexto := '';
  FPendienteTexto := '';
  FCierreTexto := 'Sin otro particular, se despide';
  FNombreGerente := '[NombreGerente]';
  FCargoGerente := 'Gerente General';
  FNombreEmpresaFirma := '[NombreEmpresa]';
  FPieEmpresa := '[NombreEmpresa]';
  FPieDireccion := '';
  FPieTelefonos := '';
  FRutaLogo := '';
  FValoresAplicados := False;
end;

procedure TqckCartaSaldoTpl.AplicarValores;
begin
  if FValoresAplicados then Exit;

  if FileExists(Trim(FRutaLogo)) then
    imgLogo.Picture.LoadFromFile(Trim(FRutaLogo))
  else
    imgLogo.Picture := nil;

  lblLugar.Caption := Trim(FLugarEmision);
  lblFecha.Caption := Trim(FFechaCortaTexto);
  lblTitulo.Caption := UpperCase(Trim(FTituloDocumento));

  //qrmCuerpo.Lines.Text := Trim(FCuerpoTexto);
  CargarRichText(qrmCuerpo, FCuerpoTexto);
  //qrmPendiente.Lines.Text := Trim(FPendienteTexto);
  CargarRichText(qrmPendiente, FPendienteTexto);
  qrmCierre.Lines.Text := Trim(FCierreTexto);

  lblNombreGerente.Caption := Trim(FNombreGerente);
  lblCargoGerente.Caption := Trim(FCargoGerente);
  //lblEmpresaFirma.Caption := 'de ' + Trim(FNombreEmpresaFirma);

  //lblPieEmpresa.Caption := Trim(FPieEmpresa);
  lblPieDireccion.Caption := Trim(FPieDireccion);
  lblPieTelefonos.Caption := Trim(FPieTelefonos);

  FValoresAplicados := True;
end;                                                 

procedure TqckCartaSaldoTpl.PrepararReporte;
begin
  FValoresAplicados := False;
  AplicarValores;
end;

procedure TqckCartaSaldoTpl.bndHeaderBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  AplicarValores;
end;

procedure TqckCartaSaldoTpl.CargarRichText(AControl: TQRRichText; const ARtf: string);
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
