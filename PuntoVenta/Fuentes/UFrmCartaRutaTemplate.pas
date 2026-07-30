unit UFrmCartaRutaTemplate;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IBDatabase, StdCtrls, ExtCtrls, DB, IBQuery,
  Buttons,
  WinSkinData;

type
  TfrmCartaRutaTemplate = class(TForm)
    pnlTop: TPanel;                                                     
    lblNumero: TLabel;
    edtNumeroTransaccion: TEdit;
    btnVistaPrevia: TButton;
    btnCargarTemplate: TButton;
    btnGuardarTemplate: TButton;
    btnCerrar: TButton;
    grpGeneral: TGroupBox;
    lblNumeroCartaTemplate: TLabel;
    edtNumeroCartaTemplate: TEdit;
    lblCiudadEmision: TLabel;
    edtCiudadEmision: TEdit;
    lblTituloDocumento: TLabel;
    edtTituloDocumento: TEdit;
    lblTipoVehiculoDefecto: TLabel;
    edtTipoVehiculoDefecto: TEdit;
    lblCargoFirma: TLabel;
    edtCargoFirma: TEdit;
    lblDireccionPie: TLabel;
    edtDireccionPie: TEdit;
    lblTelefonosPie: TLabel;
    edtTelefonosPie: TEdit;
    lblRutaLogo: TLabel;
    edtRutaLogo: TEdit;
    btnBuscarLogo: TButton;
    grpTextos: TGroupBox;
    lblDestinatario: TLabel;
    memDestinatario: TMemo;
    lblCuerpoTemplate: TLabel;
    memCuerpoTemplate: TMemo;
    lblTextoDocumentos: TLabel;
    memTextoDocumentos: TMemo;
    lblTextoAgradecimiento: TLabel;
    memTextoAgradecimiento: TMemo;
    lblPlaceholders: TLabel;
    OpenDialog1: TOpenDialog;
    BitBtn1: TBitBtn;
    SkinData1: TSkinData;
    lblNombreFirma: TLabel;
    edtNombreFirma: TEdit;
    procedure FormShow(Sender: TObject);
    procedure btnCargarTemplateClick(Sender: TObject);
    procedure btnGuardarTemplateClick(Sender: TObject);
    procedure btnVistaPreviaClick(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure btnBuscarLogoClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    FDatabase: TIBDatabase;
    FTransaction: TIBTransaction;
    FCIAKey: Integer;
    FUsuario: string;
    function ValidarConexion: Boolean;
    procedure AplicarTemplatePorDefecto;
    procedure CargarTemplate;
    procedure GuardarTemplate;
    function GetSqlDatos: string;
    function GetFieldText(ADataSet: TDataSet; const AFieldName,
      ADefault: string): string;
    function FechaEmisionEs(const AFecha: TDateTime): string;
    function ExpandTemplate(const AText: string; ADataSet: TDataSet): string;
    function ValorTipoVehiculo(ADataSet: TDataSet): string;
  public
    _numtrn : integer;
    property Database: TIBDatabase read FDatabase write FDatabase;
    property Transaction: TIBTransaction read FTransaction write FTransaction;
    property CIAKey: Integer read FCIAKey write FCIAKey;
    property Usuario: string read FUsuario write FUsuario;
  end;

var
  frmCartaRutaTemplate: TfrmCartaRutaTemplate;

implementation
 uses UDatModConectar,UQckRepCartaRutaVehTpl, UGlobal,
  UCompania;
{$R *.dfm}

function RtfEscape(const S: string): string;
begin
  Result := S;
  Result := StringReplace(Result, '\', '\\', [rfReplaceAll]);
  Result := StringReplace(Result, '{', '\{', [rfReplaceAll]);
  Result := StringReplace(Result, '}', '\}', [rfReplaceAll]);
  Result := StringReplace(Result, #13#10, '\par ' + #13#10, [rfReplaceAll]);
  Result := StringReplace(Result, #10, '\par ' + #13#10, [rfReplaceAll]);
end;
     procedure ReplaceTokenBold(var S: string; const Token, Value: string);
begin
  S := StringReplace(
    S,
    Token,
    '{\b ' + RtfEscape(Value) + '}',
    [rfReplaceAll, rfIgnoreCase]
  );
end;

procedure ReplaceTokenNormal(var S: string; const Token, Value: string);
begin
  S := StringReplace(
    S,
    Token,
    RtfEscape(Value),
    [rfReplaceAll, rfIgnoreCase]
  );
end;

function ExpandTemplateRichCuerpoCartaRuta(
  const ATemplate: string;
  const ANombreCliente, ATipoDocumento, ADocumentoNo: string
): string;
var
  S: string;
begin
  S := ATemplate;

  S := StringReplace(S, '{RESPONSABLE_NOMBRE}', '<<RESPONSABLE_NOMBRE>>', [rfReplaceAll, rfIgnoreCase]);
  S := StringReplace(S, '{TIPO_DOCUMENTO}', '<<TIPO_DOCUMENTO>>', [rfReplaceAll, rfIgnoreCase]);
  S := StringReplace(S, '{DOCUMENTO_NO}', '<<DOCUMENTO_NO>>', [rfReplaceAll, rfIgnoreCase]);

  S := RtfEscape(S);

  ReplaceTokenBold(S, '<<RESPONSABLE_NOMBRE>>', ANombreCliente);
  ReplaceTokenNormal(S, '<<TIPO_DOCUMENTO>>', ATipoDocumento);
  ReplaceTokenBold(S, '<<DOCUMENTO_NO>>', ADocumentoNo);

  Result :=
    '{\rtf1\ansi\deff0' +
    '{\fonttbl{\f0 Times New Roman;}}' +
    '\fs28 ' + S + '}';
end;

procedure TfrmCartaRutaTemplate.AplicarTemplatePorDefecto;
begin
  edtNumeroCartaTemplate.Text := 'TIEMBRE/{YYYY}';
  edtCiudadEmision.Text := 'SAN RAFAEL DEL YUMA, RD';
  edtTituloDocumento.Text := 'CARTA DE RUTA';
  edtTipoVehiculoDefecto.Text := 'MOTOCICLETA';
  edtCargoFirma.Text := 'DTO. DE VENTAS';
  edtNombreFirma.Text := 'Amaurys García de la Paz';
  edtDireccionPie.Text := 'C/ Altagracia No.10';
  edtTelefonosPie.Text := 'Telefono: 809-554-9226  Cel: 829-452-7407';
  edtRutaLogo.Text := '';

  memDestinatario.Lines.Text :=
    'A LA: DIRECCION GENERAL DE SEGURIDAD DE TRANSITO Y TRANSPORTE' + #13#10 +
    '(DIGESETT) Y/O POLICIA NACIONAL.';

  memCuerpoTemplate.Lines.Text :=
    'Hacemos la certificación y al mismo tiempo hacemos constar que el o la Senor/a {RESPONSABLE_NOMBRE} ' +
    'con {DOCUMENTO_LABEL} {DOCUMENTO_NO} es responsable del vehículo descrito a continuación:';

  memTextoDocumentos.Lines.Text :=
    '  Sus documentos están en la Dirección General de Impuestos Internos, agradecemos '+
    'todas las colaboraciones y consideraciones posibles para esta persona '+
    'hasta que sus documentos sean entregados.';

  memTextoAgradecimiento.Lines.Text :=
    '';
end;

function TfrmCartaRutaTemplate.ValidarConexion: Boolean;
begin
  Result := Assigned(FDatabase) and Assigned(FTransaction);
  if not Result then
    ShowMessage('Debe asignar Database y Transaction al formulario antes de usarlo.');

  if Result and (FCIAKey = 0) then
    FCIAKey := 1;
end;

function TfrmCartaRutaTemplate.GetFieldText(ADataSet: TDataSet; const AFieldName,
  ADefault: string): string;
var
  F: TField;
begin
  Result := ADefault;
  if ADataSet = nil then
    Exit;

  F := ADataSet.FindField(AFieldName);
  if (F <> nil) and (not F.IsNull) then
    Result := Trim(F.AsString);
end;

function TfrmCartaRutaTemplate.FechaEmisionEs(const AFecha: TDateTime): string;
const
  Meses: array[1..12] of string =
    ('ENERO', 'FEBRERO', 'MARZO', 'ABRIL', 'MAYO', 'JUNIO',
     'JULIO', 'AGOSTO', 'SEPTIEMBRE', 'OCTUBRE', 'NOVIEMBRE', 'DICIEMBRE');
var
  Y, M, D: Word;
begin
  DecodeDate(AFecha, Y, M, D);
  Result := Format('%.2d/%s/%.4d', [D, Meses[M], Y]);
end;

function TfrmCartaRutaTemplate.ExpandTemplate(const AText: string;
  ADataSet: TDataSet): string;
var
  S: string;

  procedure ReplaceToken(const Token, Value: string);
  begin
    S := StringReplace(S, Token, Value, [rfReplaceAll, rfIgnoreCase]);
  end;

begin
  S := AText;

  ReplaceToken('{NUMERO}', GetFieldText(ADataSet, 'NUMERO', ''));
  ReplaceToken('{NUMERO_CONTROL}', 'C/' + GetFieldText(ADataSet, 'NUMERO', ''));
  ReplaceToken('{RESPONSABLE_NOMBRE}', GetFieldText(ADataSet, 'RESPONSABLE_NOMBRE', ''));
  ReplaceToken('{TIPO_DOCUMENTO}', GetFieldText(ADataSet, 'TIPO_DOCUMENTO', 'Cédula'));
  ReplaceToken('{DOCUMENTO_LABEL}', GetFieldText(ADataSet, 'DOCUMENTO_LABEL', 'Cédula No.'));
  ReplaceToken('{DOCUMENTO_NO}', GetFieldText(ADataSet, 'DOCUMENTO_NO', ''));
  ReplaceToken('{TIPO_VEHICULO}', ValorTipoVehiculo(ADataSet));
  ReplaceToken('{MARCA}', GetFieldText(ADataSet, 'MARCA', ''));
  ReplaceToken('{MODELO}', GetFieldText(ADataSet, 'MODELO', ''));
  ReplaceToken('{CHASIS}', GetFieldText(ADataSet, 'CHASIS', ''));
  ReplaceToken('{MAQUINA}', GetFieldText(ADataSet, 'MAQUINA', ''));
  ReplaceToken('{COLOR}', GetFieldText(ADataSet, 'COLOR', ''));
  ReplaceToken('{ANIO}', GetFieldText(ADataSet, 'ANIO', ''));
  ReplaceToken('{CIUDAD_EMISION}', Trim(edtCiudadEmision.Text));

  if (ADataSet <> nil) and (ADataSet.FindField('FECHA_EMISION') <> nil) and
     (not ADataSet.FieldByName('FECHA_EMISION').IsNull) then
  begin
    ReplaceToken('{FECHA_EMISION}', FechaEmisionEs(ADataSet.FieldByName('FECHA_EMISION').AsDateTime));
    ReplaceToken('{YYYY}', FormatDateTime('yyyy', ADataSet.FieldByName('FECHA_EMISION').AsDateTime));
    ReplaceToken('{MM}', FormatDateTime('mm', ADataSet.FieldByName('FECHA_EMISION').AsDateTime));
    ReplaceToken('{DD}', FormatDateTime('dd', ADataSet.FieldByName('FECHA_EMISION').AsDateTime));
  end;

  Result := S;
end;

function TfrmCartaRutaTemplate.ValorTipoVehiculo(ADataSet: TDataSet): string;
begin
  Result := Trim(edtTipoVehiculoDefecto.Text);
  if Result = '' then
    Result := GetFieldText(ADataSet, 'TIPO_VEHICULO', '');

  if Result = '' then
    Result := 'MOTOCICLETA';
end;

procedure TfrmCartaRutaTemplate.CargarTemplate;
var
  Q: TIBQuery;
  OwnTr: Boolean;
begin
  if not ValidarConexion then
    Exit;

  Q := TIBQuery.Create(nil);
  try
    Q.Database := FDatabase;
    Q.Transaction := FTransaction;
    Q.SQL.Text := 'select * from CFG_CARTA_RUTA_TEMPLATE where CIA_KEY = :PCIA';
    Q.ParamByName('PCIA').AsInteger := FCIAKey;

    OwnTr := not FTransaction.InTransaction;
    if OwnTr then
      FTransaction.StartTransaction;
    try
      Q.Open;
      if Q.IsEmpty then
        AplicarTemplatePorDefecto
      else
      begin
        edtNumeroCartaTemplate.Text := GetFieldText(Q, 'NUMERO_CARTA_TEMPLATE', 'TIEMBRE/{YYYY}');
        edtCiudadEmision.Text := GetFieldText(Q, 'CIUDAD_EMISION', 'HIGUEY, RD');
        edtTituloDocumento.Text := GetFieldText(Q, 'TITULO_DOCUMENTO', 'CARTA DE RUTA');
        edtTipoVehiculoDefecto.Text := GetFieldText(Q, 'TIPO_VEHICULO_DEFECTO', 'MOTOCICLETA');
        edtNombreFirma.Text := GetFieldText(Q, 'NOMBRE_FIRMA', '');
        edtCargoFirma.Text := GetFieldText(Q, 'CARGO_FIRMA', '');

        edtDireccionPie.Text := GetFieldText(Q, 'DIRECCION_PIE', '');
        edtTelefonosPie.Text := GetFieldText(Q, 'TELEFONOS_PIE', '');
        edtRutaLogo.Text := GetFieldText(Q, 'RUTA_LOGO', '');

        memDestinatario.Lines.Text := GetFieldText(Q, 'DESTINATARIO_TEMPLATE', '');
        memCuerpoTemplate.Lines.Text := GetFieldText(Q, 'CUERPO_TEMPLATE', '');
        memTextoDocumentos.Lines.Text := GetFieldText(Q, 'TEXTO_DOCUMENTOS', '');
        memTextoAgradecimiento.Lines.Text := GetFieldText(Q, 'TEXTO_AGRADECIMIENTO', '');

        if Trim(memDestinatario.Lines.Text) = '' then
          AplicarTemplatePorDefecto;
      end;

      Q.Close;
      if OwnTr then
        FTransaction.Commit;
    except
      if OwnTr and FTransaction.InTransaction then
        FTransaction.Rollback;
      raise;
    end;
  finally
    Q.Free;
  end;
  if (edtNumeroTransaccion.Text <> '') then
  btnVistaPreviaClick(Self);
end;

procedure TfrmCartaRutaTemplate.GuardarTemplate;
var
  Q: TIBQuery;
  OwnTr: Boolean;
begin
  if not ValidarConexion then
    Exit;

  Q := TIBQuery.Create(nil);
  try
    Q.Database := FDatabase;
    Q.Transaction := FTransaction;
    Q.SQL.Text :=
      'update or insert into CFG_CARTA_RUTA_TEMPLATE (' +
      'CIA_KEY, NUMERO_CARTA_TEMPLATE, CIUDAD_EMISION, DESTINATARIO_TEMPLATE, ' +
      'CUERPO_TEMPLATE, TEXTO_DOCUMENTOS, TEXTO_AGRADECIMIENTO, TITULO_DOCUMENTO, ' +
      'NOMBRE_FIRMA, CARGO_FIRMA, DIRECCION_PIE, TELEFONOS_PIE, TIPO_VEHICULO_DEFECTO, RUTA_LOGO, ' +
      'FECHA_MOD, MOD_POR) ' +
      'values (' +
      ':CIA_KEY, :NUMERO_CARTA_TEMPLATE, :CIUDAD_EMISION, :DESTINATARIO_TEMPLATE, ' +
      ':CUERPO_TEMPLATE, :TEXTO_DOCUMENTOS, :TEXTO_AGRADECIMIENTO, :TITULO_DOCUMENTO, ' +
      ':NOMBRE_FIRMA, :CARGO_FIRMA, :DIRECCION_PIE, :TELEFONOS_PIE, :TIPO_VEHICULO_DEFECTO, :RUTA_LOGO, ' +
      'current_timestamp, :MOD_POR) ' +
      'matching (CIA_KEY)';

    Q.ParamByName('CIA_KEY').AsInteger := FCIAKey;
    Q.ParamByName('NUMERO_CARTA_TEMPLATE').AsString := Trim(edtNumeroCartaTemplate.Text);
    Q.ParamByName('CIUDAD_EMISION').AsString := Trim(edtCiudadEmision.Text);
    Q.ParamByName('DESTINATARIO_TEMPLATE').AsString := memDestinatario.Lines.Text;
    Q.ParamByName('CUERPO_TEMPLATE').AsString := memCuerpoTemplate.Lines.Text;
    Q.ParamByName('TEXTO_DOCUMENTOS').AsString := memTextoDocumentos.Lines.Text;
    Q.ParamByName('TEXTO_AGRADECIMIENTO').AsString := memTextoAgradecimiento.Lines.Text;
    Q.ParamByName('TITULO_DOCUMENTO').AsString := Trim(edtTituloDocumento.Text);
    Q.ParamByName('NOMBRE_FIRMA').AsString := Trim(edtNombreFirma.Text);
    Q.ParamByName('CARGO_FIRMA').AsString := Trim(edtCargoFirma.Text);
    Q.ParamByName('DIRECCION_PIE').AsString := Trim(edtDireccionPie.Text);
    Q.ParamByName('TELEFONOS_PIE').AsString := Trim(edtTelefonosPie.Text);
    Q.ParamByName('TIPO_VEHICULO_DEFECTO').AsString := Trim(edtTipoVehiculoDefecto.Text);
    Q.ParamByName('RUTA_LOGO').AsString := Trim(edtRutaLogo.Text);
    Q.ParamByName('MOD_POR').AsString := Copy(Trim(FUsuario), 1, 12);

    OwnTr := not FTransaction.InTransaction;
    if OwnTr then
      FTransaction.StartTransaction;
    try
      Q.ExecSQL;
      if OwnTr then
        FTransaction.Commit;
      ShowMessage('Template guardado correctamente.');
    except
      if OwnTr and FTransaction.InTransaction then
        FTransaction.Rollback;
      raise;
    end;
  finally
    Q.Free;
  end;
end;

function TfrmCartaRutaTemplate.GetSqlDatos: string;
begin
  Result :=
    'select ' +
    '  vm.numero, ' +
    '  vm.fecha as FECHA_EMISION, ' +
    '  coalesce(nullif(trim(c.nombre_cte), ''''), nullif(trim(vm.nombre_cliente_general), ''''), ''CLIENTE GENERAL'') as RESPONSABLE_NOMBRE, ' +
    '  case ' +
    '    when char_length(replace(replace(replace(replace(trim(coalesce(c.rnc_numero, '''')), ''-'', ''''), '' '', ''''), ''/'', ''''), ''.'', '''')) = 9 then ''RNC'' ' +
    '    when char_length(replace(replace(replace(replace(trim(coalesce(c.rnc_numero, '''')), ''-'', ''''), '' '', ''''), ''/'', ''''), ''.'', '''')) = 11 then ''Cédula'' ' +
    '    when trim(coalesce(c.rnc_numero, '''')) <> '''' then ''PASAPORTE'' ' +
    '    else ''Cédula'' ' +
    '  end as TIPO_DOCUMENTO, ' +
    '  case ' +
    '    when char_length(replace(replace(replace(replace(trim(coalesce(c.rnc_numero, '''')), ''-'', ''''), '' '', ''''), ''/'', ''''), ''.'', '''')) = 9 then ''RNC No.'' ' +
    '    when char_length(replace(replace(replace(replace(trim(coalesce(c.rnc_numero, '''')), ''-'', ''''), '' '', ''''), ''/'', ''''), ''.'', '''')) = 11 then ''Cédula No.'' ' +
    '    when trim(coalesce(c.rnc_numero, '''')) <> '''' then ''PASAPORTE No.'' ' +
    '    else ''Cédula No.'' ' +
    '  end as DOCUMENTO_LABEL, ' +
    '  case ' +
    '    when trim(coalesce(c.rnc_numero, '''')) <> '''' then trim(c.rnc_numero) ' +
    '    else '''' ' +
    '  end as DOCUMENTO_NO, ' +
    '  coalesce(nullif(trim(dv.marca), ''''), nullif(trim(v.marca), ''''), '''') as MARCA, ' +
    '  coalesce(nullif(trim(dv.modelo), ''''), nullif(trim(v.modelo), ''''), '''') as MODELO, ' +
    '  coalesce(nullif(trim(dv.chassis), ''''), nullif(trim(v.chassis), ''''), '''') as CHASIS, ' +
    '  v.registro as MAQUINA, ' +
    '  coalesce(nullif(trim(v.color), ''''), '''') as COLOR, ' +
    '  cast(coalesce(v.year_veh, 0) as varchar(10)) as ANIO, ' +
    '  vm.cia_key ' +
    'from ventas_mast vm ' +
    'left join datosventavehiculo dv on dv.num_serie = vm.numero ' +
    //'left join vehiculo v on ((vm.idnumerodveh is not null and v.ficha = vm.idnumerodveh) ' +
    //'                     or (coalesce(trim(v.chassis), '''') <> '''' and trim(v.chassis) = trim(dv.chassis))) ' +
    'left join vehiculo v on ( ' +
    '       (coalesce(trim(dv.chassis), '''') <> '''' ' +
    '        and coalesce(trim(v.chassis), '''') <> '''' ' +
    '        and trim(v.chassis) = trim(dv.chassis)) ' +
    '       or ' +
    '       (coalesce(trim(dv.chassis), '''') = '''' ' +
    '        and coalesce(vm.idnumerodveh, 0) > 0 ' +
    '        and v.ficha = vm.idnumerodveh) ' +
    '     ) ' +
    'left join clientes c on c.codigo_cte = vm.codigo_cte ' +
    'where vm.numero = :PNUMERO';
end;

procedure TfrmCartaRutaTemplate.FormShow(Sender: TObject);
begin
  if not ValidarConexion then
    Exit;
  if (edtNumeroTransaccion.Text = '') and (_numtrn > 0) then
  edtNumeroTransaccion.Text:=IntToStr(_numtrn);
  CargarTemplate;
end;

procedure TfrmCartaRutaTemplate.btnCargarTemplateClick(Sender: TObject);
begin
  CargarTemplate;
end;

procedure TfrmCartaRutaTemplate.btnGuardarTemplateClick(Sender: TObject);
begin
  GuardarTemplate;
end;

procedure TfrmCartaRutaTemplate.btnVistaPreviaClick(Sender: TObject);
var
  Q: TIBQuery;
  R: TqckCartaRutaVehTpl;
  OwnTr: Boolean;
  NombreCliente: string;
  DocumentoLabel: string;
  DocumentoNo: string;  
begin
  if not ValidarConexion then
    Exit;

  if Trim(edtNumeroTransaccion.Text) = '' then
  begin
    ShowMessage('Debe indicar el numero de transaccion.');
    edtNumeroTransaccion.SetFocus;
    Exit;
  end;

  Q := TIBQuery.Create(nil);
  try
    Q.Database := FDatabase;
    Q.Transaction := FTransaction;
    Q.SQL.Text := GetSqlDatos;
    Q.ParamByName('PNUMERO').AsInteger := StrToIntDef(Trim(edtNumeroTransaccion.Text), 0);

    OwnTr := not FTransaction.InTransaction;
    if OwnTr then
      FTransaction.StartTransaction;
    try
      Q.Open;
      if Q.IsEmpty then
      begin
        if OwnTr then
          FTransaction.Commit;
        ShowMessage('No se encontraron datos para la transaccion indicada.');
        Exit;
      end;

      NombreCliente := GetFieldText(Q, 'RESPONSABLE_NOMBRE', '');
      DocumentoLabel := GetFieldText(Q, 'DOCUMENTO_LABEL', 'Cédula No.');
      DocumentoNo := GetFieldText(Q, 'DOCUMENTO_NO', '');

      if Assigned(qckCartaRutaVehTpl) then
      freeAndNil(qckCartaRutaVehTpl);
      R := TqckCartaRutaVehTpl.Create(nil);
      try
        R.NumeroCarta := ExpandTemplate(Trim(edtNumeroCartaTemplate.Text), Q);
        R.CiudadEmision := Trim(edtCiudadEmision.Text);

        if (Q.FindField('FECHA_EMISION') <> nil) and (not Q.FieldByName('FECHA_EMISION').IsNull) then
          R.FechaEmisionTexto := FechaEmisionEs(Q.FieldByName('FECHA_EMISION').AsDateTime)
        else
          R.FechaEmisionTexto := '';

        R.FechaEmisionTexto:=FechaEmisionEs(date);
        R.TituloDocumento := Trim(edtTituloDocumento.Text);
        R.Destinatario := ExpandTemplate(memDestinatario.Lines.Text, Q);
        R.NumeroControl := 'C/' + GetFieldText(Q, 'NUMERO', '');
        R.CuerpoTexto := ExpandTemplateRichCuerpoCartaRuta(
          memCuerpoTemplate.Lines.Text,
          NombreCliente,
          DocumentoLabel,
          DocumentoNo
        );
        R.NombreFirma := Trim(edtNombreFirma.Text);
        R.CargoFirma := Trim(edtCargoFirma.Text);          
        R.TipoVehiculo := ValorTipoVehiculo(Q);
        R.Marca := GetFieldText(Q, 'MARCA', '');
        R.Modelo := GetFieldText(Q, 'MODELO', '');
        R.Chasis := GetFieldText(Q, 'CHASIS', '');
        R.Maquina := GetFieldText(Q, 'MAQUINA', '');
        R.Color := GetFieldText(Q, 'COLOR', '');
        R.Anio := GetFieldText(Q, 'ANIO', '');
        R.TextoDocumentos := ExpandTemplate(memTextoDocumentos.Lines.Text, Q);
        R.TextoAgradecimiento := ExpandTemplate(memTextoAgradecimiento.Lines.Text, Q);
        R.DireccionPie := Trim(edtDireccionPie.Text);
        R.TelefonosPie := Trim(edtTelefonosPie.Text);
        R.RutaLogo := Trim(edtRutaLogo.Text);
        R.PrepararReporte;
        R.Preview;
      finally
        R.Free;
      end;

      Q.Close;
      if OwnTr then
        FTransaction.Commit;
    except
      if OwnTr and FTransaction.InTransaction then
        FTransaction.Rollback;
      raise;
    end;
  finally
    Q.Free;
  end;
end;

procedure TfrmCartaRutaTemplate.btnCerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCartaRutaTemplate.btnBuscarLogoClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
    edtRutaLogo.Text := OpenDialog1.FileName;
end;

procedure TfrmCartaRutaTemplate.BitBtn1Click(Sender: TObject);
begin
  frmCompania:=TfrmCompania.create(nil);
  try
    frmCompania.Showmodal;
  finally
  frmCompania.Free;
  frmCompania:=Nil;
  end;
end;

end.
