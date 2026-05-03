unit UFrmCartaSaldoTemplate;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, DB, IBDatabase, IBQuery,
  WinSkinData;

type
  TfrmCartaSaldoTemplate = class(TForm)
    pnlTop: TPanel;
    lblNumero: TLabel;
    edtNumeroTransaccion: TEdit;
    btnVistaPrevia: TButton;
    btnCargarTemplate: TButton;
    btnGuardarTemplate: TButton;
    btnCerrar: TButton;
    grpGeneral: TGroupBox;
    lblLugarEmision: TLabel;
    edtLugarEmision: TEdit;
    lblTitulo: TLabel;
    edtTituloDocumento: TEdit;
    lblRutaLogo: TLabel;
    edtRutaLogo: TEdit;
    btnBuscarLogo: TButton;
    lblNombreGerente: TLabel;
    edtNombreGerente: TEdit;
    lblCargoGerente: TLabel;
    edtCargoGerente: TEdit;
    lblPieEmpresa: TLabel;
    edtPieEmpresa: TEdit;
    lblPieDireccion: TLabel;
    edtPieDireccion: TEdit;
    lblPieTelefonos: TLabel;
    edtPieTelefonos: TEdit;
    grpTextos: TGroupBox;
    lblCuerpo: TLabel;
    memCuerpoTemplate: TMemo;
    lblPendiente: TLabel;
    memPendienteTemplate: TMemo;
    lblCierre: TLabel;
    memCierreTemplate: TMemo;
    lblAyuda: TLabel;
    OpenDialog1: TOpenDialog;
    SkinData1: TSkinData;
    procedure FormShow(Sender: TObject);
    procedure btnCargarTemplateClick(Sender: TObject);
    procedure btnGuardarTemplateClick(Sender: TObject);
    procedure btnVistaPreviaClick(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure btnBuscarLogoClick(Sender: TObject);
  private
    FDatabase: TIBDatabase;
    FTransaction: TIBTransaction;
    FCIAKey: Integer;
    FUsuario: string;
    function ValidarConexion: Boolean;
    procedure AplicarTemplatePorDefecto;
    procedure CargarTemplate;
    procedure GuardarTemplate;
    function GetFieldText(ADataSet: TDataSet; const AFieldName, ADefault: string): string;
    function GetSqlDatos: string;
    function ValorDocumentoLabel(ADataSet: TDataSet): string;
    function ValorDocumentoNo(ADataSet: TDataSet): string;
    function ValorNombreEmpresa(ADataSet: TDataSet): string;
    function ValorPieDireccion(ADataSet: TDataSet): string;
    function ValorPieTelefonos(ADataSet: TDataSet): string;
    function MesEnTexto(const AFecha: TDateTime): string;
    function DiaEnTexto(ADia: Integer): string;
    function NumeroATexto(N: Integer): string;
    function AnioEnTexto(Anio: Integer): string;
    function FechaCorta(const AFecha: TDateTime): string;
    function ExpandTemplate(const AText: string; ADataSet: TDataSet): string;
    function ExpandTemplateRichPendiente(const ATemplate: string;
      ADataSet: TDataSet): string;
    function ExpandTemplateRichCuerpo(const ATemplate: string;
      ADataSet: TDataSet): string;
    function AnioCompletoEnTexto(Anio: Integer): string;
  public
    _numtrn:integer;
    property Database: TIBDatabase read FDatabase write FDatabase;
    property Transaction: TIBTransaction read FTransaction write FTransaction;
    property CIAKey: Integer read FCIAKey write FCIAKey;
    property Usuario: string read FUsuario write FUsuario;
  end;

var
  frmCartaSaldoTemplate: TfrmCartaSaldoTemplate;

implementation

uses UQckRepCartaSaldoTpl;

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

function CapitalizarInicial(const S: string): string;
begin
  Result := Trim(S);
  if Result = '' then Exit;
  Result := LowerCase(Result);
  Result[1] := UpCase(Result[1]);
end;

function TfrmCartaSaldoTemplate.AnioCompletoEnTexto(Anio: Integer): string;
begin
  if (Anio >= 2000) and (Anio <= 2099) then
  begin
    if Anio = 2000 then
      Result := 'dos mil'
    else
      Result := 'dos mil ' + CapitalizarInicial(NumeroATexto(Anio - 2000));
    Exit;
  end;

  Result := CapitalizarInicial(NumeroATexto(Anio));
end;

function TfrmCartaSaldoTemplate.ExpandTemplateRichPendiente(
  const ATemplate: string;
  ADataSet: TDataSet
): string;
var
  S: string;
  F: TDateTime;
  Y, M, D: Word;
begin
  F := Date;
  if (ADataSet <> nil) and (ADataSet.FindField('FECHA_EMISION') <> nil) and
     (not ADataSet.FieldByName('FECHA_EMISION').IsNull) then
    F := ADataSet.FieldByName('FECHA_EMISION').AsDateTime;

  DecodeDate(F, Y, M, D);

  S := ATemplate;

  S := StringReplace(S, '{LUGAR_MUNICIPIO}', '<<LUGAR_MUNICIPIO>>', [rfReplaceAll, rfIgnoreCase]);
  S := StringReplace(S, '{DIA_TEXTO_CAP}', '<<DIA_TEXTO_CAP>>', [rfReplaceAll, rfIgnoreCase]);
  S := StringReplace(S, '{DIA_TEXTO}', '<<DIA_TEXTO>>', [rfReplaceAll, rfIgnoreCase]);
  S := StringReplace(S, '{DIA2}', '<<DIA2>>', [rfReplaceAll, rfIgnoreCase]);
  S := StringReplace(S, '{MES_MAYUS}', '<<MES_MAYUS>>', [rfReplaceAll, rfIgnoreCase]);
  S := StringReplace(S, '{ANIO_LETRAS_COMPLETO}', '<<ANIO_LETRAS_COMPLETO>>', [rfReplaceAll, rfIgnoreCase]);
  S := StringReplace(S, '{ANIO4}', '<<ANIO4>>', [rfReplaceAll, rfIgnoreCase]);
  S := StringReplace(S, '{ANIO_TEXTO}', '<<ANIO_TEXTO>>', [rfReplaceAll, rfIgnoreCase]);

  S := RtfEscape(S);
  ReplaceTokenBold(S, '<<DIA_TEXTO>>', DiaEnTexto(D));
  ReplaceTokenBold(S, '<<ANIO_TEXTO>>', AnioEnTexto(Y));
  ReplaceTokenBold(S, '<<LUGAR_MUNICIPIO>>', Trim(edtLugarEmision.Text));
  ReplaceTokenBold(S, '<<DIA_TEXTO_CAP>>', CapitalizarInicial(DiaEnTexto(D)));
  ReplaceTokenBold(S, '<<DIA2>>', Format('%.2d', [D]));
  ReplaceTokenBold(S, '<<MES_MAYUS>>', MesEnTexto(F));
  ReplaceTokenBold(S, '<<ANIO_LETRAS_COMPLETO>>', AnioCompletoEnTexto(Y));
  ReplaceTokenBold(S, '<<ANIO4>>', IntToStr(Y));

  Result :=
    '{\rtf1\ansi\deff0' +
    '{\fonttbl{\f0 Times New Roman;}}' +
    '\fs24 ' + S + '}';
end;

function TfrmCartaSaldoTemplate.ValidarConexion: Boolean;
begin
  Result := Assigned(FDatabase) and Assigned(FTransaction);
  if not Result then
    ShowMessage('Debe asignar Database y Transaction al formulario antes de usarlo.');
  if Result and (FCIAKey = 0) then
    FCIAKey := 1;
end;

function TfrmCartaSaldoTemplate.GetFieldText(ADataSet: TDataSet; const AFieldName,
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

procedure TfrmCartaSaldoTemplate.AplicarTemplatePorDefecto;
begin
  edtLugarEmision.Text := 'Vicente Noble, Barahona, R.D.';
  edtTituloDocumento.Text := 'CARTA DE SALDO';
  edtRutaLogo.Text := '';
  edtNombreGerente.Text := '[NombreGerente]';
  edtCargoGerente.Text := 'Gerente General';
  edtPieEmpresa.Text := '[NombreEmpresa]';
  edtPieDireccion.Text := 'Calle Duarte No. 64, Local 1';
  edtPieTelefonos.Text := 'Whatsapp.: 829-563-3880 / Tel.: 809-527-2401 / Cel.: 809-876-4498';

  memCuerpoTemplate.Lines.Text :=
    'Por medio de la presente, la empresa {NOMBRE_EMPRESA}, hace constar que el vehiculo adquirido en nuestra empresa por el senor {NOMBRE_CLIENTE}, ' +
    'portador de {DOCUMENTO_LABEL} {DOCUMENTO_NO}, ha sido saldado en su totalidad satisfactoriamente, a continuacion la descripción de dicho vehículo:';
  memCuerpoTemplate.Lines.Add('');
  memCuerpoTemplate.Lines.Add('Un Vehículo De Motor Tipo {TIPO_VEHICULO}; Marca {MARCA}; Modelo {MODELO}; Chasis Nómero {CHASIS}; Color {COLOR}; {DESCRIPCION_ADICIONAL}.');

  //memPendienteTemplate.Lines.Text :=
  //  'Quedando Pendiente de Entrega, Placa y Matricula. Dado en el municipio de {LUGAR_MUNICIPIO} a los {DIA_TEXTO} ({DIA2}) dias del mes de {MES_MAYUS} del ano dos mil {ANIO_TEXTO} ({ANIO4}).';

  memPendienteTemplate.Lines.Text :=
  'Quedando Pendiente de Entrega, Placa y Matrícula. Dado en el municipio de {LUGAR_MUNICIPIO} a los {DIA_TEXTO_CAP} ({DIA2}) días del mes de {MES_MAYUS} del año {ANIO_LETRAS_COMPLETO} ({ANIO4}).';

  memCierreTemplate.Lines.Text :=
    'Sin otro particular, se despide';
end;

procedure TfrmCartaSaldoTemplate.CargarTemplate;
var
  Q: TIBQuery;
  OwnTr: Boolean;
begin
  if not ValidarConexion then Exit;

  Q := TIBQuery.Create(nil);
  try
    Q.Database := FDatabase;
    Q.Transaction := FTransaction;
    Q.SQL.Text := 'select * from CFG_CARTA_SALDO_TEMPLATE where CIA_KEY = :PCIA';
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
        edtLugarEmision.Text := GetFieldText(Q, 'LUGAR_EMISION', '');
        edtTituloDocumento.Text := GetFieldText(Q, 'TITULO_DOCUMENTO', '');
        edtRutaLogo.Text := GetFieldText(Q, 'RUTA_LOGO', '');
        edtNombreGerente.Text := GetFieldText(Q, 'NOMBRE_GERENTE', '');
        edtCargoGerente.Text := GetFieldText(Q, 'CARGO_GERENTE', '');
        edtPieEmpresa.Text := GetFieldText(Q, 'PIE_EMPRESA', '');
        edtPieDireccion.Text := GetFieldText(Q, 'PIE_DIRECCION', '');
        edtPieTelefonos.Text := GetFieldText(Q, 'PIE_TELEFONOS', '');
        memCuerpoTemplate.Lines.Text := GetFieldText(Q, 'CUERPO_TEMPLATE', '');
        memPendienteTemplate.Lines.Text := GetFieldText(Q, 'PENDIENTE_TEMPLATE', '');
        memCierreTemplate.Lines.Text := GetFieldText(Q, 'CIERRE_TEMPLATE', '');

        if Trim(memCuerpoTemplate.Lines.Text) = '' then
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
end;

procedure TfrmCartaSaldoTemplate.GuardarTemplate;
var
  Q: TIBQuery;
  OwnTr: Boolean;
begin
  if not ValidarConexion then Exit;

  Q := TIBQuery.Create(nil);
  try
    Q.Database := FDatabase;
    Q.Transaction := FTransaction;
    OwnTr := not FTransaction.InTransaction;
    if OwnTr then
      FTransaction.StartTransaction;
    try
      Q.SQL.Text :=
        'update or insert into CFG_CARTA_SALDO_TEMPLATE (' +
        '  CIA_KEY, LUGAR_EMISION, TITULO_DOCUMENTO, RUTA_LOGO, CUERPO_TEMPLATE, ' +
        '  PENDIENTE_TEMPLATE, CIERRE_TEMPLATE, NOMBRE_GERENTE, CARGO_GERENTE, ' +
        '  PIE_EMPRESA, PIE_DIRECCION, PIE_TELEFONOS, UPDATED_AT, UPDATED_BY' +
        ') values (' +
        '  :CIA_KEY, :LUGAR_EMISION, :TITULO_DOCUMENTO, :RUTA_LOGO, :CUERPO_TEMPLATE, ' +
        '  :PENDIENTE_TEMPLATE, :CIERRE_TEMPLATE, :NOMBRE_GERENTE, :CARGO_GERENTE, ' +
        '  :PIE_EMPRESA, :PIE_DIRECCION, :PIE_TELEFONOS, current_timestamp, :UPDATED_BY' +
        ') matching (CIA_KEY)';
      Q.ParamByName('CIA_KEY').AsInteger := FCIAKey;
      Q.ParamByName('LUGAR_EMISION').AsString := Trim(edtLugarEmision.Text);
      Q.ParamByName('TITULO_DOCUMENTO').AsString := Trim(edtTituloDocumento.Text);
      Q.ParamByName('RUTA_LOGO').AsString := Trim(edtRutaLogo.Text);
      Q.ParamByName('CUERPO_TEMPLATE').AsString := memCuerpoTemplate.Lines.Text;
      Q.ParamByName('PENDIENTE_TEMPLATE').AsString := memPendienteTemplate.Lines.Text;
      Q.ParamByName('CIERRE_TEMPLATE').AsString := memCierreTemplate.Lines.Text;
      Q.ParamByName('NOMBRE_GERENTE').AsString := Trim(edtNombreGerente.Text);
      Q.ParamByName('CARGO_GERENTE').AsString := Trim(edtCargoGerente.Text);
      Q.ParamByName('PIE_EMPRESA').AsString := Trim(edtPieEmpresa.Text);
      Q.ParamByName('PIE_DIRECCION').AsString := Trim(edtPieDireccion.Text);
      Q.ParamByName('PIE_TELEFONOS').AsString := Trim(edtPieTelefonos.Text);
      Q.ParamByName('UPDATED_BY').AsString := Copy(Trim(FUsuario), 1, 20);
      Q.ExecSQL;

      if OwnTr then
        FTransaction.Commit;
      ShowMessage('Template de carta de saldo guardado correctamente.');
    except
      if OwnTr and FTransaction.InTransaction then
        FTransaction.Rollback;
      raise;
    end;
  finally
    Q.Free;
  end;
end;

function TfrmCartaSaldoTemplate.GetSqlDatos: string;
begin
  Result :=
    'select ' +
    '  vm.numero, ' +
    '  vm.fecha as FECHA_EMISION, ' +
    '  coalesce(nullif(trim(c.nombre_cte), ''''), nullif(trim(vm.nombre_cliente_general), ''''), ''CLIENTE GENERAL'') as NOMBRE_CLIENTE, ' +
    '  case ' +
    '    when char_length(replace(replace(replace(trim(coalesce(c.rnc_numero, '''')), ''-'', ''''), '' '', ''''), ''/'', '''')) = 9 then ''el RNC numero'' ' +
    '    when char_length(replace(replace(replace(trim(coalesce(c.rnc_numero, '''')), ''-'', ''''), '' '', ''''), ''/'', '''')) = 11 then ''la cédula de identidad y electoral número'' ' +
    '    when trim(coalesce(c.rnc_numero, '''')) <> '''' then ''el pasaporte numero'' ' +
    '    else ''la cédula de identidad y electoral número'' ' +
    '  end as DOCUMENTO_LABEL, ' +
    '  coalesce(nullif(trim(c.rnc_numero), ''''), '''') as DOCUMENTO_NO, ' +
    '  ''MOTOCICLETA'' as TIPO_VEHICULO, ' +
    '  coalesce(nullif(trim(dv.marca), ''''), nullif(trim(v.marca), ''''), '''') as MARCA, ' +
    '  coalesce(nullif(trim(dv.modelo), ''''), nullif(trim(v.modelo), ''''), '''') as MODELO, ' +
    '  coalesce(nullif(trim(dv.chassis), ''''), nullif(trim(v.chassis), ''''), '''') as CHASIS, ' +
    '  coalesce(nullif(trim(v.color), ''''), '''') as COLOR, ' +
    '  ''De UN (1) Cilindro'' as DESCRIPCION_ADICIONAL, ' +
    '  coalesce(nullif(trim(mc.linea1), ''''), ''[NombreEmpresa]'') as NOMBRE_EMPRESA, ' +
    '  coalesce(nullif(trim(mc.linea2), ''''), '''') as PIE_DIRECCION, ' +
    '  coalesce(nullif(trim(mc.linea5), ''''), '''') as PIE_TELEFONOS, ' +
    '  coalesce(nullif(trim(mc.linea3), ''''), trim(c.ciudad), ''Vicente Noble, Barahona, R.D.'') as LUGAR_EMISION ' +
    'from ventas_mast vm ' +
    'left join datosventavehiculo dv on dv.num_serie = vm.numero ' +
    'left join vehiculo v on ((vm.idnumerodveh is not null and v.ficha = vm.idnumerodveh) ' +
    '                     or (coalesce(trim(v.chassis), '''') <> '''' and trim(v.chassis) = trim(dv.chassis))) ' +
    'left join clientes c on c.codigo_cte = vm.codigo_cte ' +
    'left join membrete_cia mc on mc.codigo_cia = vm.cia_key ' +
    'where vm.numero = :PNUMERO';
end;

function TfrmCartaSaldoTemplate.ValorDocumentoLabel(ADataSet: TDataSet): string;
begin
  Result := GetFieldText(ADataSet, 'DOCUMENTO_LABEL', 'la cédula de identidad y electoral número');
end;

function TfrmCartaSaldoTemplate.ValorDocumentoNo(ADataSet: TDataSet): string;
begin
  Result := GetFieldText(ADataSet, 'DOCUMENTO_NO', '');
end;

function TfrmCartaSaldoTemplate.ValorNombreEmpresa(ADataSet: TDataSet): string;
begin
  Result := GetFieldText(ADataSet, 'NOMBRE_EMPRESA', Trim(edtPieEmpresa.Text));
  if Trim(Result) = '' then
    Result := Trim(edtPieEmpresa.Text);
end;

function TfrmCartaSaldoTemplate.ValorPieDireccion(ADataSet: TDataSet): string;
begin
  Result := Trim(edtPieDireccion.Text);
  if Result = '' then
    Result := GetFieldText(ADataSet, 'PIE_DIRECCION', '');
end;

function TfrmCartaSaldoTemplate.ValorPieTelefonos(ADataSet: TDataSet): string;
begin
  Result := Trim(edtPieTelefonos.Text);
  if Result = '' then
    Result := GetFieldText(ADataSet, 'PIE_TELEFONOS', '');
end;

function TfrmCartaSaldoTemplate.MesEnTexto(const AFecha: TDateTime): string;
const
  Meses: array[1..12] of string =
    ('ENERO', 'FEBRERO', 'MARZO', 'ABRIL', 'MAYO', 'JUNIO',
     'JULIO', 'AGOSTO', 'SEPTIEMBRE', 'OCTUBRE', 'NOVIEMBRE', 'DICIEMBRE');
var
  Y, M, D: Word;
begin
  DecodeDate(AFecha, Y, M, D);
  Result := Meses[M];
end;

function TfrmCartaSaldoTemplate.DiaEnTexto(ADia: Integer): string;
const
  Dias: array[1..31] of string = (
    'UN', 'DOS', 'TRES', 'CUATRO', 'CINCO', 'SEIS', 'SIETE', 'OCHO', 'NUEVE', 'DIEZ',
    'ONCE', 'DOCE', 'TRECE', 'CATORCE', 'QUINCE', 'DIECISEIS', 'DIECISIETE', 'DIECIOCHO', 'DIECINUEVE', 'VEINTE',
    'VEINTIUNO', 'VEINTIDOS', 'VEINTITRES', 'VEINTICUATRO', 'VEINTICINCO', 'VEINTISEIS', 'VEINTISIETE', 'VEINTIOCHO', 'VEINTINUEVE', 'TREINTA',
    'TREINTA Y UN');
begin
  if (ADia >= 1) and (ADia <= 31) then
    Result := Dias[ADia]
  else
    Result := IntToStr(ADia);
end;

function TfrmCartaSaldoTemplate.NumeroATexto(N: Integer): string;
const
  U: array[0..29] of string = (
    'CERO','UN','DOS','TRES','CUATRO','CINCO','SEIS','SIETE','OCHO','NUEVE',
    'DIEZ','ONCE','DOCE','TRECE','CATORCE','QUINCE','DIECISEIS','DIECISIETE','DIECIOCHO','DIECINUEVE',
    'VEINTE','VEINTIUN','VEINTIDOS','VEINTITRES','VEINTICUATRO','VEINTICINCO','VEINTISEIS','VEINTISIETE','VEINTIOCHO','VEINTINUEVE');
  D: array[3..9] of string = ('TREINTA','CUARENTA','CINCUENTA','SESENTA','SETENTA','OCHENTA','NOVENTA');
  C: array[1..9] of string = ('CIENTO','DOSCIENTOS','TRESCIENTOS','CUATROCIENTOS','QUINIENTOS','SEISCIENTOS','SETECIENTOS','OCHOCIENTOS','NOVECIENTOS');
var
  Centena, Decena, Unidad, Resto: Integer;
begin
  if N < 0 then
  begin
    Result := 'MENOS ' + NumeroATexto(-N);
    Exit;
  end;

  if N <= 29 then
  begin
    Result := U[N];
    Exit;
  end;

  if N < 100 then
  begin
    Decena := N div 10;
    Unidad := N mod 10;
    Result := D[Decena];
    if Unidad > 0 then
      Result := Result + ' Y ' + NumeroATexto(Unidad);
    Exit;
  end;

  if N = 100 then
  begin
    Result := 'CIEN';
    Exit;
  end;

  if N < 1000 then
  begin
    Centena := N div 100;
    Resto := N mod 100;
    Result := C[Centena];
    if Resto > 0 then
      Result := Result + ' ' + NumeroATexto(Resto);
    Exit;
  end;

  if N = 1000 then
  begin
    Result := 'MIL';
    Exit;
  end;

  if N < 2000 then
  begin
    Result := 'MIL ' + NumeroATexto(N mod 1000);
    Exit;
  end;

  if N < 1000000 then
  begin
    Result := NumeroATexto(N div 1000) + ' MIL';
    Resto := N mod 1000;
    if Resto > 0 then
      Result := Result + ' ' + NumeroATexto(Resto);
    Exit;
  end;

  Result := IntToStr(N);
end;

function TfrmCartaSaldoTemplate.AnioEnTexto(Anio: Integer): string;
var
  Resto: Integer;
begin
  if (Anio >= 2000) and (Anio <= 2099) then
  begin
    Resto := Anio - 2000;
    if Resto = 0 then
      Result := 'MIL'
    else
      Result := 'MIL ' + NumeroATexto(Resto);
    Exit;
  end;

  Result := NumeroATexto(Anio);
end;

function TfrmCartaSaldoTemplate.FechaCorta(const AFecha: TDateTime): string;
begin
  Result := FormatDateTime('dd/mm/yyyy', AFecha);
end;

function TfrmCartaSaldoTemplate.ExpandTemplate(const AText: string; ADataSet: TDataSet): string;
var
  S: string;
  F: TDateTime;
  Y, M, D: Word;
  Lugar: string;

  procedure ReplaceToken(const Token, Value: string);
  begin
    S := StringReplace(S, Token, Value, [rfReplaceAll, rfIgnoreCase]);
  end;

begin
  S := AText;
  F := Date;
  if (ADataSet <> nil) and (ADataSet.FindField('FECHA_EMISION') <> nil) and
     (not ADataSet.FieldByName('FECHA_EMISION').IsNull) then
    F := ADataSet.FieldByName('FECHA_EMISION').AsDateTime;

  DecodeDate(F, Y, M, D);

  Lugar := Trim(edtLugarEmision.Text);
  if Lugar = '' then
    Lugar := GetFieldText(ADataSet, 'LUGAR_EMISION', 'Vicente Noble, Barahona, R.D.');

  ReplaceToken('{NUMERO}', GetFieldText(ADataSet, 'NUMERO', ''));
  ReplaceToken('{FECHA_CORTA}', FechaCorta(F));
  ReplaceToken('{LUGAR_EMISION}', Lugar);
  ReplaceToken('{LUGAR_MUNICIPIO}', Lugar);
  ReplaceToken('{NOMBRE_EMPRESA}', ValorNombreEmpresa(ADataSet));
  ReplaceToken('{NOMBRE_CLIENTE}', GetFieldText(ADataSet, 'NOMBRE_CLIENTE', ''));
  ReplaceToken('{DOCUMENTO_LABEL}', ValorDocumentoLabel(ADataSet));
  ReplaceToken('{DOCUMENTO_NO}', ValorDocumentoNo(ADataSet));
  ReplaceToken('{TIPO_VEHICULO}', GetFieldText(ADataSet, 'TIPO_VEHICULO', 'MOTOCICLETA'));
  ReplaceToken('{MARCA}', GetFieldText(ADataSet, 'MARCA', ''));
  ReplaceToken('{MODELO}', GetFieldText(ADataSet, 'MODELO', ''));
  ReplaceToken('{CHASIS}', GetFieldText(ADataSet, 'CHASIS', ''));
  ReplaceToken('{COLOR}', GetFieldText(ADataSet, 'COLOR', ''));
  ReplaceToken('{DESCRIPCION_ADICIONAL}', GetFieldText(ADataSet, 'DESCRIPCION_ADICIONAL', ''));
  ReplaceToken('{DIA2}', Format('%.2d', [D]));
  ReplaceToken('{DIA_TEXTO}', DiaEnTexto(D));
  ReplaceToken('{MES_MAYUS}', MesEnTexto(F));
  ReplaceToken('{ANIO4}', IntToStr(Y));
  ReplaceToken('{ANIO_TEXTO}', AnioEnTexto(Y));

  Result := S;
end;

procedure TfrmCartaSaldoTemplate.FormShow(Sender: TObject);
begin
  if (edtNumeroTransaccion.Text = '') and (_numtrn > 0) then
  edtNumeroTransaccion.Text:=IntToStr(_numtrn);
  CargarTemplate;  
end;

procedure TfrmCartaSaldoTemplate.btnCargarTemplateClick(Sender: TObject);
begin
  CargarTemplate;
end;

procedure TfrmCartaSaldoTemplate.btnGuardarTemplateClick(Sender: TObject);
begin
  GuardarTemplate;
end;

procedure TfrmCartaSaldoTemplate.btnVistaPreviaClick(Sender: TObject);
var
  Q: TIBQuery;
  R: TqckCartaSaldoTpl;
  OwnTr: Boolean;
  F: TDateTime;
  Lugar: string;
begin
  if not ValidarConexion then Exit;

  if Trim(edtNumeroTransaccion.Text) = '' then
  begin
    ShowMessage('Digite el número de transacción.');
    edtNumeroTransaccion.SetFocus;
    Exit;
  end;

  Q := TIBQuery.Create(nil);
  R := TqckCartaSaldoTpl.Create(nil);
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
        ShowMessage('No se encontraron datos para la transaccion indicada.');
        Exit;
      end;

      F := Date;
      if (Q.FindField('FECHA_EMISION') <> nil) and (not Q.FieldByName('FECHA_EMISION').IsNull) then
        F := Q.FieldByName('FECHA_EMISION').AsDateTime;

      Lugar := Trim(edtLugarEmision.Text);
      if Lugar = '' then
        Lugar := GetFieldText(Q, 'LUGAR_EMISION', 'Vicente Noble, Barahona, R.D.');

      R.LugarEmision := Lugar;
      R.FechaCortaTexto := FechaCorta(F);
      R.TituloDocumento := Trim(edtTituloDocumento.Text);
      //R.CuerpoTexto := ExpandTemplate(memCuerpoTemplate.Lines.Text, Q);
      R.CuerpoTexto := ExpandTemplateRichCuerpo(memCuerpoTemplate.Lines.Text, Q);
      //R.PendienteTexto := ExpandTemplate(memPendienteTemplate.Lines.Text, Q);
      R.PendienteTexto := ExpandTemplateRichPendiente(memPendienteTemplate.Lines.Text, Q);
      R.CierreTexto := ExpandTemplate(memCierreTemplate.Lines.Text, Q);
      R.NombreGerente := Trim(edtNombreGerente.Text);
      R.CargoGerente := Trim(edtCargoGerente.Text);
      R.NombreEmpresaFirma := ValorNombreEmpresa(Q);
      R.PieEmpresa := ValorNombreEmpresa(Q);
      R.PieDireccion := ValorPieDireccion(Q);
      R.PieTelefonos := ValorPieTelefonos(Q);
      R.RutaLogo := Trim(edtRutaLogo.Text);

      R.PrepararReporte;
      R.Preview;

      Q.Close;
      if OwnTr then
        FTransaction.Commit;
    except
      if OwnTr and FTransaction.InTransaction then
        FTransaction.Rollback;
      raise;
    end;
  finally
    R.Free;
    Q.Free;
  end;
end;

procedure TfrmCartaSaldoTemplate.btnCerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCartaSaldoTemplate.btnBuscarLogoClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
    edtRutaLogo.Text := OpenDialog1.FileName;
end;

function TfrmCartaSaldoTemplate.ExpandTemplateRichCuerpo(
  const ATemplate: string;
  ADataSet: TDataSet
): string;
var
  S: string;
begin
  S := ATemplate;

  S := StringReplace(S, '{NOMBRE_EMPRESA}', '<<NOMBRE_EMPRESA>>', [rfReplaceAll, rfIgnoreCase]);
  S := StringReplace(S, '{NOMBRE_CLIENTE}', '<<NOMBRE_CLIENTE>>', [rfReplaceAll, rfIgnoreCase]);
  S := StringReplace(S, '{DOCUMENTO_LABEL}', '<<DOCUMENTO_LABEL>>', [rfReplaceAll, rfIgnoreCase]);
  S := StringReplace(S, '{DOCUMENTO_NO}', '<<DOCUMENTO_NO>>', [rfReplaceAll, rfIgnoreCase]);
  S := StringReplace(S, '{TIPO_VEHICULO}', '<<TIPO_VEHICULO>>', [rfReplaceAll, rfIgnoreCase]);
  S := StringReplace(S, '{MARCA}', '<<MARCA>>', [rfReplaceAll, rfIgnoreCase]);
  S := StringReplace(S, '{MODELO}', '<<MODELO>>', [rfReplaceAll, rfIgnoreCase]);
  S := StringReplace(S, '{CHASIS}', '<<CHASIS>>', [rfReplaceAll, rfIgnoreCase]);
  S := StringReplace(S, '{COLOR}', '<<COLOR>>', [rfReplaceAll, rfIgnoreCase]);
  S := StringReplace(S, '{DESCRIPCION_ADICIONAL}', '<<DESCRIPCION_ADICIONAL>>', [rfReplaceAll, rfIgnoreCase]);

  S := RtfEscape(S);

  ReplaceTokenBold(S, '<<NOMBRE_EMPRESA>>', ValorNombreEmpresa(ADataSet));
  ReplaceTokenBold(S, '<<NOMBRE_CLIENTE>>', GetFieldText(ADataSet, 'NOMBRE_CLIENTE', ''));
  ReplaceTokenBold(S, '<<DOCUMENTO_LABEL>>', ValorDocumentoLabel(ADataSet));
  ReplaceTokenBold(S, '<<DOCUMENTO_NO>>', ValorDocumentoNo(ADataSet));
  ReplaceTokenBold(S, '<<TIPO_VEHICULO>>', GetFieldText(ADataSet, 'TIPO_VEHICULO', ''));
  ReplaceTokenBold(S, '<<MARCA>>', GetFieldText(ADataSet, 'MARCA', ''));
  ReplaceTokenBold(S, '<<MODELO>>', GetFieldText(ADataSet, 'MODELO', ''));
  ReplaceTokenBold(S, '<<CHASIS>>', GetFieldText(ADataSet, 'CHASIS', ''));
  ReplaceTokenBold(S, '<<COLOR>>', GetFieldText(ADataSet, 'COLOR', ''));
  ReplaceTokenBold(S, '<<DESCRIPCION_ADICIONAL>>', GetFieldText(ADataSet, 'DESCRIPCION_ADICIONAL', ''));

  Result :=
    '{\rtf1\ansi\deff0' +
    '{\fonttbl{\f0 Times New Roman;}}' +
    '\fs24 ' + S + '}';
end;
end.
