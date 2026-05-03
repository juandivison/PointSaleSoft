unit UQckRepCartaRutaVeh;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, QRCtrls, ExtCtrls, DB, JPEG;

type
  TqckCartaRutaVeh = class(TQuickRep)
    bndHeader: TQRBand;
    bndDetail: TQRBand;
    bndFooter: TQRBand;
    imgLogo: TQRImage;
    lblLugar: TQRLabel;
    lblFecha: TQRLabel;
    lblNoCarta: TQRLabel;
    lblTitulo: TQRLabel;
    qrmDestinatario: TQRMemo;
    lblControl: TQRLabel;
    qrmCuerpo: TQRMemo;
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
    procedure bndHeaderBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    FRutaLogo: string;
    FNumeroCarta: string;
    FCiudadEmision: string;
    FFechaEmisionTexto: string;
    FDestinatario: string;
    FNumeroControl: string;
    FResponsableNombre: string;
    FTipoDocumentoLabel: string;
    FDocumentoNo: string;
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
    FValoresAplicados: Boolean;
    procedure InicializarValores;
    procedure AplicarValores;
    function GetFieldText(ADataSet: TDataSet; const AFieldName,
      ADefault: string): string;
  public
    constructor Create(AOwner: TComponent); override;
    procedure CargarDesdeDataSet(ADataSet: TDataSet);
    class function GetSql: string;

    property RutaLogo: string read FRutaLogo write FRutaLogo;
    property NumeroCarta: string read FNumeroCarta write FNumeroCarta;
    property CiudadEmision: string read FCiudadEmision write FCiudadEmision;
    property FechaEmisionTexto: string read FFechaEmisionTexto write FFechaEmisionTexto;
    property Destinatario: string read FDestinatario write FDestinatario;
    property NumeroControl: string read FNumeroControl write FNumeroControl;
    property ResponsableNombre: string read FResponsableNombre write FResponsableNombre;
    property TipoDocumentoLabel: string read FTipoDocumentoLabel write FTipoDocumentoLabel;
    property DocumentoNo: string read FDocumentoNo write FDocumentoNo;
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
  end;

var
  qckCartaRutaVeh: TqckCartaRutaVeh;

implementation

{$R *.dfm}

constructor TqckCartaRutaVeh.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  InicializarValores;
end;

procedure TqckCartaRutaVeh.InicializarValores;
begin
  FRutaLogo := '';
  FNumeroCarta := 'TIEMBRE/2025';
  FCiudadEmision := 'HIGUEY, RD';
  FFechaEmisionTexto := '19/DICIEMBRE/2025';
  FDestinatario := 'A LA: DIRECCION GENERAL DE SEGURIDAD DE TRANSITO Y TRANSPORTE' + #13#10 +
                   '(DIGESETT) Y/O POLICIA NACIONAL.';
  FNumeroControl := 'C/766';
  FResponsableNombre := 'RAMON ANTONIO MERCEDES MELO';
  FTipoDocumentoLabel := 'RNC';
  FDocumentoNo := '402-1964779-5';
  FTipoVehiculo := 'MOTOCICLETA';
  FMarca := 'SUZUKI';
  FModelo := 'LETS4';
  FChasis := 'CA45A-140249';
  FMaquina := 'A404-322221';
  FColor := 'NARANJA';
  FAnio := '1994';
  FTextoDocumentos := 'Sus documentos estan en la Direccion General de Impuestos Internos.';
  FTextoAgradecimiento := 'Agradecemos todas las colaboraciones y consideraciones posibles para esta persona hasta que sus documentos sean entregados.';
  FCargoFirma := 'DTO. DE VENTAS';
  FDireccionPie := 'C/ Altagracia No.10';
  FTelefonosPie := 'Telefono: 809-554-9226  Cel: 829-452-7407';
  FValoresAplicados := False;
end;

function TqckCartaRutaVeh.GetFieldText(ADataSet: TDataSet; const AFieldName,
  ADefault: string): string;
var
  F: TField;
begin
  Result := ADefault;
  if ADataSet = nil then Exit;
  F := ADataSet.FindField(AFieldName);
  if (F <> nil) and (not F.IsNull) then
    Result := Trim(F.AsString);
end;

procedure TqckCartaRutaVeh.CargarDesdeDataSet(ADataSet: TDataSet);
var
  F: TField;
begin
  if ADataSet = nil then Exit;

  NumeroCarta := GetFieldText(ADataSet, 'NUMERO_CARTA', NumeroCarta);
  CiudadEmision := GetFieldText(ADataSet, 'CIUDAD_EMISION', CiudadEmision);

  F := ADataSet.FindField('FECHA_EMISION');
  if (F <> nil) and (not F.IsNull) then
  begin
    if F.DataType in [ftDate, ftDateTime] then
      FechaEmisionTexto := UpperCase(FormatDateTime('dd/mmmm/yyyy', F.AsDateTime))
    else
      FechaEmisionTexto := UpperCase(Trim(F.AsString));
  end;

  Destinatario := GetFieldText(ADataSet, 'DESTINATARIO', Destinatario);
  NumeroControl := GetFieldText(ADataSet, 'NUMERO_CONTROL', NumeroControl);
  ResponsableNombre := GetFieldText(ADataSet, 'RESPONSABLE_NOMBRE', ResponsableNombre);
  TipoDocumentoLabel := GetFieldText(ADataSet, 'TIPO_DOCUMENTO', TipoDocumentoLabel);
  DocumentoNo := GetFieldText(ADataSet, 'DOCUMENTO_NO', DocumentoNo);
  TipoVehiculo := GetFieldText(ADataSet, 'TIPO_VEHICULO', TipoVehiculo);
  Marca := GetFieldText(ADataSet, 'MARCA', Marca);
  Modelo := GetFieldText(ADataSet, 'MODELO', Modelo);
  Chasis := GetFieldText(ADataSet, 'CHASIS', Chasis);
  Maquina := GetFieldText(ADataSet, 'MAQUINA', Maquina);
  Color := GetFieldText(ADataSet, 'COLOR', Color);
  Anio := GetFieldText(ADataSet, 'ANIO', Anio);
  TextoDocumentos := GetFieldText(ADataSet, 'TEXTO_DOCUMENTOS', TextoDocumentos);
  TextoAgradecimiento := GetFieldText(ADataSet, 'TEXTO_AGRADECIMIENTO', TextoAgradecimiento);
  CargoFirma := GetFieldText(ADataSet, 'CARGO_FIRMA', CargoFirma);
  DireccionPie := GetFieldText(ADataSet, 'DIRECCION_PIE', DireccionPie);
  TelefonosPie := GetFieldText(ADataSet, 'TELEFONOS_PIE', TelefonosPie);
  RutaLogo := GetFieldText(ADataSet, 'RUTA_LOGO', RutaLogo);

  FValoresAplicados := False;
end;

procedure TqckCartaRutaVeh.AplicarValores;
var
  DocTipo: string;
begin
  if FValoresAplicados then Exit;

  if FileExists(FRutaLogo) then
    imgLogo.Picture.LoadFromFile(FRutaLogo)
  else
    imgLogo.Picture := nil;

  lblLugar.Caption := UpperCase(Trim(FCiudadEmision));
  lblFecha.Caption := UpperCase(Trim(FFechaEmisionTexto));
  lblNoCarta.Caption := UpperCase(Trim(FNumeroCarta));

  qrmDestinatario.Lines.Text := FDestinatario;
  lblControl.Caption := Trim(FNumeroControl);

  DocTipo := UpperCase(Trim(FTipoDocumentoLabel));

  qrmCuerpo.Lines.Clear;
  qrmCuerpo.Lines.Add('Hacemos la certificacion y al mismo tiempo hacemos constar que el o la Senor/a');

  if DocTipo = 'RNC' then
    qrmCuerpo.Lines.Add(UpperCase(Trim(FResponsableNombre)) + ' con RNC NO. ' +
      Trim(FDocumentoNo) + ' es responsable del vehiculo descrito a continuacion:')
  else
    qrmCuerpo.Lines.Add(UpperCase(Trim(FResponsableNombre)) + ' portador(a) del ' +
      LowerCase(Trim(FTipoDocumentoLabel)) + ' NO. ' + Trim(FDocumentoNo) +
      ' es responsable del vehiculo descrito a continuacion:');

  lblTipoVal.Caption := UpperCase(Trim(FTipoVehiculo));
  lblMarcaVal.Caption := UpperCase(Trim(FMarca));
  lblModeloVal.Caption := UpperCase(Trim(FModelo));
  lblChasisVal.Caption := UpperCase(Trim(FChasis));
  lblMaquinaVal.Caption := UpperCase(Trim(FMaquina));
  lblColorVal.Caption := UpperCase(Trim(FColor));
  lblAnioVal.Caption := UpperCase(Trim(FAnio));

  qrmNota.Lines.Clear;
  qrmNota.Lines.Add(FTextoDocumentos);
  qrmNota.Lines.Add('');
  qrmNota.Lines.Add(FTextoAgradecimiento);

  lblCargoFirma.Caption := UpperCase(Trim(FCargoFirma));
  lblPieDireccion.Caption := Trim(FDireccionPie);
  lblPieTelefonos.Caption := Trim(FTelefonosPie);

  FValoresAplicados := True;
end;

procedure TqckCartaRutaVeh.bndHeaderBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  AplicarValores;
end;

class function TqckCartaRutaVeh.GetSql: string;
begin
  Result :=
    'select ' +
    '  ''TIEMBRE/'' || extract(year from current_date) as NUMERO_CARTA, ' +
    '  coalesce(nullif(trim(mc.linea3), ''''), ''HIGUEY, RD'') as CIUDAD_EMISION, ' +
    '  vm.fecha as FECHA_EMISION, ' +
    '  ''A LA: DIRECCION GENERAL DE SEGURIDAD DE TRANSITO Y TRANSPORTE'' || ascii_char(13) || ascii_char(10) || ''(DIGESETT) Y/O POLICIA NACIONAL.'' as DESTINATARIO, ' +
    '  ''C/'' || cast(vm.numero as varchar(20)) as NUMERO_CONTROL, ' +
    '  coalesce(nullif(trim(c.nombre_cte), ''''), nullif(trim(vm.nombre_cliente_general), ''''), ''CLIENTE GENERAL'') as RESPONSABLE_NOMBRE, ' +
    '  ''RNC'' as TIPO_DOCUMENTO, ' +
    '  coalesce(nullif(trim(c.rnc_numero), ''''), '''') as DOCUMENTO_NO, ' +
    '  ''MOTOCICLETA'' as TIPO_VEHICULO, ' +
    '  coalesce(nullif(trim(dv.marca), ''''), nullif(trim(v1.marca), ''''), nullif(trim(v2.marca), ''''), '''') as MARCA, ' +
    '  coalesce(nullif(trim(dv.modelo), ''''), nullif(trim(v1.modelo), ''''), nullif(trim(v2.modelo), ''''), '''') as MODELO, ' +
    '  coalesce(nullif(trim(dv.chassis), ''''), nullif(trim(v1.chassis), ''''), nullif(trim(v2.chassis), ''''), '''') as CHASIS, ' +
    '  '''' as MAQUINA, ' +
    '  coalesce(nullif(trim(v1.color), ''''), nullif(trim(v2.color), ''''), '''') as COLOR, ' +
    '  cast(coalesce(v1.year_veh, v2.year_veh, 0) as varchar(10)) as ANIO, ' +
    '  ''Sus documentos estan en la Direccion General de Impuestos Internos.'' as TEXTO_DOCUMENTOS, ' +
    '  ''Agradecemos todas las colaboraciones y consideraciones posibles para esta persona hasta que sus documentos sean entregados.'' as TEXTO_AGRADECIMIENTO, ' +
    '  ''DTO. DE VENTAS'' as CARGO_FIRMA, ' +
    '  coalesce(nullif(trim(mc.linea2), ''''), '''') as DIRECCION_PIE, ' +
    '  coalesce(nullif(trim(mc.linea5), ''''), '''') as TELEFONOS_PIE, ' +
    '  '''' as RUTA_LOGO ' +
    'from ventas_mast vm ' +
    'left join datosventavehiculo dv on dv.num_serie = vm.numero ' +
    'left join vehiculo v1 on v1.ficha = vm.idnumerodveh ' +
    'left join vehiculo v2 on (v1.ficha is null and trim(coalesce(v2.chassis, '''')) = trim(coalesce(dv.chassis, ''''))) ' +
    'left join clientes c on c.codigo_cte = vm.codigo_cte ' +
    'left join membrete_cia mc on mc.codigo_cia = vm.cia_key ' +
    'where vm.numero = :PNUMERO';
end;

end.
