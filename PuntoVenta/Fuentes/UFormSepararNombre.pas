unit UFormSepararNombre;

{
  Unidad: UNombrePersonaParser
  Objetivo:
    Separar una cadena de nombre completo en Nombre y Apellido usando heurísticas
    para ambiente hispano/dominicano.

  Regla principal:
    1 palabra  => Nombre solamente
    2 palabras => Nombre + Apellido
    3 palabras => Ambiguo, usa lista de segundos nombres / iniciales / apellidos probables
    4 palabras => 2 primeras Nombre, 2 últimas Apellido
    5 palabras => 3 primeras Nombre, 2 últimas Apellido
    6+ palabras => últimos 2 como apellidos, ajustando partículas como DE, DEL, DE LA, DE LOS

  Compatible con Delphi 7.
}


interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TNombreSeparado = record
    Nombre: string;
    Apellido: string;
    Regla: string;
    Confianza: Integer;       // 0..100
    CantidadPalabras: Integer;
  end;

type
  TfrmSepararNombre = class(TForm)
    BitBtn1: TBitBtn;
    edtValor: TEdit;
    Memo1: TMemo;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  frmSepararNombre: TfrmSepararNombre;
  r_nombre, r_apellido:string;
implementation

{$R *.dfm}

function NormalizarEspacios(const S: string): string;
var
  I: Integer;
  C: Char;
  LastWasSpace: Boolean;
begin
  Result := '';
  LastWasSpace := True;

  for I := 1 to Length(S) do
  begin
    C := S[I];

    if C <= ' ' then
    begin
      if not LastWasSpace then
      begin
        Result := Result + ' ';
        LastWasSpace := True;
      end;
    end
    else
    begin
      Result := Result + C;
      LastWasSpace := False;
    end;
  end;

  Result := Trim(Result);
end;

function QuitarPuntuacionLigera(const S: string): string;
begin
  Result := Trim(S);
  Result := StringReplace(Result, '.', '', [rfReplaceAll]);
  Result := StringReplace(Result, ',', '', [rfReplaceAll]);
  Result := StringReplace(Result, ';', '', [rfReplaceAll]);
  Result := StringReplace(Result, ':', '', [rfReplaceAll]);
  Result := StringReplace(Result, '''', '', [rfReplaceAll]);
  Result := StringReplace(Result, '"', '', [rfReplaceAll]);
end;

function NormalizarParaComparar(const S: string): string;
begin
  Result := AnsiUpperCase(QuitarPuntuacionLigera(S));

  Result := StringReplace(Result, 'Á', 'A', [rfReplaceAll]);
  Result := StringReplace(Result, 'À', 'A', [rfReplaceAll]);
  Result := StringReplace(Result, 'Ä', 'A', [rfReplaceAll]);
  Result := StringReplace(Result, 'Â', 'A', [rfReplaceAll]);

  Result := StringReplace(Result, 'É', 'E', [rfReplaceAll]);
  Result := StringReplace(Result, 'È', 'E', [rfReplaceAll]);
  Result := StringReplace(Result, 'Ë', 'E', [rfReplaceAll]);
  Result := StringReplace(Result, 'Ê', 'E', [rfReplaceAll]);

  Result := StringReplace(Result, 'Í', 'I', [rfReplaceAll]);
  Result := StringReplace(Result, 'Ì', 'I', [rfReplaceAll]);
  Result := StringReplace(Result, 'Ï', 'I', [rfReplaceAll]);
  Result := StringReplace(Result, 'Î', 'I', [rfReplaceAll]);

  Result := StringReplace(Result, 'Ó', 'O', [rfReplaceAll]);
  Result := StringReplace(Result, 'Ò', 'O', [rfReplaceAll]);
  Result := StringReplace(Result, 'Ö', 'O', [rfReplaceAll]);
  Result := StringReplace(Result, 'Ô', 'O', [rfReplaceAll]);

  Result := StringReplace(Result, 'Ú', 'U', [rfReplaceAll]);
  Result := StringReplace(Result, 'Ù', 'U', [rfReplaceAll]);
  Result := StringReplace(Result, 'Ü', 'U', [rfReplaceAll]);
  Result := StringReplace(Result, 'Û', 'U', [rfReplaceAll]);

  Result := StringReplace(Result, 'Ñ', 'N', [rfReplaceAll]);
end;

procedure SepararPalabras(const S: string; Lista: TStringList);
var
  I: Integer;
  Token: string;
  C: Char;
begin
  Lista.Clear;
  Token := '';

  for I := 1 to Length(S) do
  begin
    C := S[I];

    if C > ' ' then
      Token := Token + C
    else
    begin
      if Token <> '' then
      begin
        Lista.Add(Token);
        Token := '';
      end;
    end;
  end;

  if Token <> '' then
    Lista.Add(Token);
end;

function UnirPalabras(Lista: TStringList; DesdeIdx, HastaIdx: Integer): string;
var
  I: Integer;
begin
  Result := '';

  if Lista = nil then
    Exit;

  if Lista.Count = 0 then
    Exit;

  if DesdeIdx < 0 then
    DesdeIdx := 0;

  if HastaIdx > Lista.Count - 1 then
    HastaIdx := Lista.Count - 1;

  if DesdeIdx > HastaIdx then
    Exit;

  for I := DesdeIdx to HastaIdx do
  begin
    if Result <> '' then
      Result := Result + ' ';

    Result := Result + Lista[I];
  end;
end;

function EsInicial(const S: string): Boolean;
var
  T: string;
begin
  T := NormalizarParaComparar(S);
  Result := Length(T) = 1;
end;

function EstaEnLista(const Valor: string; const ListaPipe: string): Boolean;
var
  T: string;
begin
  T := NormalizarParaComparar(Valor);
  Result := Pos('|' + T + '|', ListaPipe) > 0;
end;

function EsSegundoNombreComun(const S: string): Boolean;
begin
  Result := EstaEnLista(S,
    '|RAMON|MANUEL|MANUAL|ANTONIO|JOSE|LUIS|CARLOS|' +
    'MIGUEL|ANGEL|RAFAEL|FRANCISCO|JAVIER|EDUARDO|ENRIQUE|' +
    'ALBERTO|ALEXANDER|ALEJANDRO|ANDRES|DAVID|DANIEL|' +
    'PEDRO|PABLO|FELIX|EMILIO|ARTURO|ALFONSO|FERNANDO|' +
    'GABRIEL|ISMAEL|ISAAC|ESTEBAN|RICARDO|ROBERTO|MARIO|' +
    'ELIAS|VICTOR|ADRIAN|MATEO|SAMUEL|ENRIQUE|IGNACIO|' +
    'MARIA|ELENA|ISABEL|CARMEN|MERCEDES|PATRICIA|YOLANDA|' +
    'ALTAGRACIA|MILAGROS|ROSARIO|LOURDES|ANGELES|JESUS|' +
    'MADELINE|MADELING|MADELYN|MADELIN|MADALINE|MABEL|' +
    'YANELIS|YANET|YANIRA|ELIZABETH|ELISABETH|CAROLINA|' +
    'GABRIELA|DANIELA|ESTHER|ROSA|ANA|ANNA|LUCIA|LUCIA|' +
    'KARINA|KATHERINE|KATERINE|KATIA|MARGARITA|NATALIA|' +
    'PAOLA|PAULA|SANDRA|CLAUDIA|VERONICA|VALENTINA|SOFIA|' +
    'EMILIA|VICTORIA|DIANA|LILIANA|ADRIANA|BEATRIZ|'
  );
end;

function EsPrimerNombreMuyComun(const S: string): Boolean;
begin
  Result := EstaEnLista(S,
    '|JUAN|JOSE|MARIA|LUIS|CARLOS|PEDRO|RAFAEL|FRANCISCO|' +
    'MIGUEL|ANTONIO|MANUEL|JESUS|ANGEL|DANIEL|DAVID|' +
    'ANA|ROSA|CARMEN|LUZ|MERCEDES|ELENA|ISABEL|'
  );
end;

function EsParticulaApellido(const S: string): Boolean;
var
  T: string;
begin
  T := NormalizarParaComparar(S);

  Result :=
    (T = 'DE') or
    (T = 'DEL') or
    (T = 'LA') or
    (T = 'LAS') or
    (T = 'LOS') or
    (T = 'DA') or
    (T = 'DAS') or
    (T = 'DO') or
    (T = 'DOS') or
    (T = 'DI') or
    (T = 'VAN') or
    (T = 'VON');
end;

function EsNombreDespuesDeParticula(const S: string): Boolean;
begin
  Result := EstaEnLista(S,
    '|JESUS|CARMEN|ANGELES|MERCEDES|LOURDES|DOLORES|' +
    'CONCEPCION|ALTAGRACIA|ROSARIO|FATIMA|SOCORRO|' +
    'MILAGROS|TRINIDAD|PILAR|REGLA|'
  );
end;

function EsArticuloDeParticula(const S: string): Boolean;
var
  T: string;
begin
  T := NormalizarParaComparar(S);

  Result :=
    (T = 'LA') or
    (T = 'LAS') or
    (T = 'LOS');
end;

function TerminaCon(const S, Sufijo: string): Boolean;
var
  T, F: string;
begin
  T := NormalizarParaComparar(S);
  F := NormalizarParaComparar(Sufijo);

  if Length(F) > Length(T) then
    Result := False
  else
    Result := Copy(T, Length(T) - Length(F) + 1, Length(F)) = F;
end;

function EsApellidoProbable(const S: string): Boolean;
begin
  Result :=
    TerminaCon(S, 'EZ') or     // PEREZ, GOMEZ, RODRIGUEZ, NUÑEZ
    TerminaCon(S, 'ES') or     // RIVERAS, FLORES, MONTES
    TerminaCon(S, 'OZ') or
    TerminaCon(S, 'IZ') or
    TerminaCon(S, 'AZ');
end;

function DetectarNombreCompuestoConParticula(Lista: TStringList): Integer;
var
  N: Integer;
  P2: string;
begin
  Result := 0;

  if Lista = nil then
    Exit;

  N := Lista.Count;

  if N < 4 then
    Exit;

  P2 := NormalizarParaComparar(Lista[1]);

  if (P2 = 'DEL') and EsNombreDespuesDeParticula(Lista[2]) then
  begin
    Result := 3;
    Exit;
  end;

  if (P2 = 'DE') and EsNombreDespuesDeParticula(Lista[2]) then
  begin
    Result := 3;
    Exit;
  end;

  if (P2 = 'DE') and EsArticuloDeParticula(Lista[2]) and
     (N >= 5) and EsNombreDespuesDeParticula(Lista[3]) then
  begin
    Result := 4;
    Exit;
  end;
end;

function AjustarCortePorParticulasDeApellido(Lista: TStringList; CorteInicial: Integer): Integer;
begin
  Result := CorteInicial;

  if Lista = nil then
    Exit;

  if Lista.Count = 0 then
    Exit;

  if Result < 1 then
    Result := 1;

  if Result > Lista.Count - 1 then
    Result := Lista.Count - 1;

  // Si justo antes del apellido hay una partícula, la movemos al apellido.
  // Ejemplo:
  // JUAN CARLOS DE LA CRUZ
  // Corte inicial 3: JUAN CARLOS DE / LA CRUZ
  // Corte ajustado 2: JUAN CARLOS / DE LA CRUZ
  while (Result > 1) and EsParticulaApellido(Lista[Result - 1]) do
    Dec(Result);
end;

function SepararNombrePersona(const NombreCompleto: string): TNombreSeparado;
var
  Palabras: TStringList;
  Texto: string;
  N: Integer;
  CorteNombre: Integer;
  CorteEspecial: Integer;

  procedure AsignarResultado(const ARegla: string; AConfianza: Integer);
  begin
    Result.Nombre := UnirPalabras(Palabras, 0, CorteNombre - 1);
    Result.Apellido := UnirPalabras(Palabras, CorteNombre, N - 1);
    Result.Regla := ARegla;
    Result.Confianza := AConfianza;
    Result.CantidadPalabras := N;
  end;

begin
  Result.Nombre := '';
  Result.Apellido := '';
  Result.Regla := '';
  Result.Confianza := 0;
  Result.CantidadPalabras := 0;

  Texto := NormalizarEspacios(NombreCompleto);

  Palabras := TStringList.Create;
  try
    SepararPalabras(Texto, Palabras);

    N := Palabras.Count;
    Result.CantidadPalabras := N;

    if N = 0 then
    begin
      Result.Regla := 'Cadena vacía';
      Result.Confianza := 0;
      Exit;
    end;

    if N = 1 then
    begin
      Result.Nombre := Palabras[0];
      Result.Apellido := '';
      Result.Regla := 'Una sola palabra';
      Result.Confianza := 40;
      Result.CantidadPalabras := N;
      Exit;
    end;

    if N = 2 then
    begin
      Result.Nombre := Palabras[0];
      Result.Apellido := Palabras[1];
      Result.Regla := 'Dos palabras: nombre + apellido';
      Result.Confianza := 75;
      Result.CantidadPalabras := N;
      Exit;
    end;

    // Caso más ambiguo.
    if N = 3 then
    begin
      if EsInicial(Palabras[1]) then
      begin
        CorteNombre := 2;
        AsignarResultado('Tres palabras: segunda palabra es inicial de segundo nombre', 82);
        Exit;
      end;

      if EsSegundoNombreComun(Palabras[1]) then
      begin
        CorteNombre := 2;
        AsignarResultado('Tres palabras: segunda palabra parece segundo nombre', 78);
        Exit;
      end;

      if EsApellidoProbable(Palabras[1]) then
      begin
        CorteNombre := 1;
        AsignarResultado('Tres palabras: segunda palabra parece primer apellido', 74);
        Exit;
      end;

      if EsPrimerNombreMuyComun(Palabras[0]) and not EsApellidoProbable(Palabras[1]) then
      begin
        CorteNombre := 2;
        AsignarResultado('Tres palabras: primer nombre común y segunda palabra no parece apellido', 70);
        Exit;
      end;

      CorteNombre := 1;
      AsignarResultado('Tres palabras: caso ambiguo, se asume una palabra como nombre y dos como apellidos', 65);
      Exit;
    end;

    // Casos con nombres compuestos tipo:
    // MARIA DEL CARMEN PEREZ
    // JOSE DE JESUS MEDINA
    // MARIA DE LOS ANGELES PEREZ
    CorteEspecial := DetectarNombreCompuestoConParticula(Palabras);

    if (CorteEspecial > 0) and (CorteEspecial < N) then
    begin
      CorteNombre := CorteEspecial;
      AsignarResultado('Nombre compuesto con partícula religiosa/tradicional', 86);
      Exit;
    end;

    if N = 4 then
    begin
      // JUAN DE LA ROSA
      // En este caso "DE LA ROSA" es más probable apellido.
      if EsParticulaApellido(Palabras[1]) then
      begin
        CorteNombre := 1;
        AsignarResultado('Cuatro palabras: segunda palabra parece partícula de apellido', 80);
        Exit;
      end;

      CorteNombre := 2;
      AsignarResultado('Cuatro palabras: dos primeras como nombres y dos últimas como apellidos', 90);
      Exit;
    end;

    if N = 5 then
    begin
      CorteNombre := 3;

      // Ajuste para casos como:
      // JUAN CARLOS DE LA CRUZ
      CorteNombre := AjustarCortePorParticulasDeApellido(Palabras, CorteNombre);

      if CorteNombre = 3 then
        AsignarResultado('Cinco palabras: tres primeras como nombres y dos últimas como apellidos', 86)
      else
        AsignarResultado('Cinco palabras: corte ajustado por partícula de apellido', 82);

      Exit;
    end;

    // 6 o más palabras:
    // Por defecto, últimos 2 como apellido, pero se ajusta si antes hay partículas.
    CorteNombre := N - 2;
    CorteNombre := AjustarCortePorParticulasDeApellido(Palabras, CorteNombre);

    AsignarResultado('Seis o más palabras: últimos apellidos detectados con posible partícula', 78);

  finally
    Palabras.Free;
  end;
end;


procedure TfrmSepararNombre.BitBtn1Click(Sender: TObject);
var
  R: TNombreSeparado;
begin
  R := SepararNombrePersona(edtValor.Text);

  Memo1.Clear;
  Memo1.Lines.Add('Entrada: ' + edtValor.Text);
  Memo1.Lines.Add('Nombre: ' + R.Nombre);
  Memo1.Lines.Add('Apellido: ' + R.Apellido);
  Memo1.Lines.Add('Regla: ' + R.Regla);
  Memo1.Lines.Add('Confianza: ' + IntToStr(R.Confianza));
  Memo1.Lines.Add('Cantidad palabras: ' + IntToStr(R.CantidadPalabras));
  r_nombre:=R.Nombre;
  r_apellido:=R.Apellido;

end;

end.

