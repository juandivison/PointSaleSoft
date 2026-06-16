unit SepararNobmresApellidos;

//interface

//implementation



uses
  SysUtils, Classes;

type
  TNombreSeparado = record
    Nombre: string;
    Apellido: string;
    Regla: string;
    Confianza: Integer;
  end;

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

function TokenLimpio(const S: string): string;
begin
  Result := Trim(S);
  Result := StringReplace(Result, '.', '', [rfReplaceAll]);
  Result := StringReplace(Result, ',', '', [rfReplaceAll]);
  Result := AnsiUpperCase(Result);
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

  if DesdeIdx < 0 then
    DesdeIdx := 0;

  if HastaIdx > Lista.Count - 1 then
    HastaIdx := Lista.Count - 1;

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
  T := TokenLimpio(S);
  Result := Length(T) = 1;
end;

function EsSegundoNombreComun(const S: string): Boolean;
var
  T: string;
begin
  T := TokenLimpio(S);

  Result :=
    Pos('|' + T + '|',
      '|RAMON|RAMÓN|MANUEL|MANUAL|ANTONIO|JOSE|JOSÉ|LUIS|CARLOS|' +
      'MIGUEL|ANGEL|ÁNGEL|RAFAEL|FRANCISCO|JAVIER|EDUARDO|ENRIQUE|' +
      'ALBERTO|ALEXANDER|ALEJANDRO|ANDRES|ANDRÉS|DAVID|DANIEL|' +
      'PEDRO|PABLO|FELIX|FÉLIX|EMILIO|ARTURO|ALFONSO|FERNANDO|' +
      'GABRIEL|ISMAEL|ISAAC|ESTEBAN|RICARDO|ROBERTO|MARIO|' +
      'ELIAS|ELÍAS|VICTOR|VÍCTOR|ADRIAN|ADRIÁN|MATEO|SAMUEL|' +
      'MARIA|MARÍA|ELENA|ISABEL|CARMEN|MERCEDES|PATRICIA|YOLANDA|' +
      'ALTAGRACIA|MILAGROS|ROSARIO|LOURDES|ANGELES|ÁNGELES|JESUS|JESÚS|') > 0;
end;

function EsParticulaApellido(const S: string): Boolean;
var
  T: string;
begin
  T := TokenLimpio(S);

  Result :=
    (T = 'DE') or
    (T = 'DEL') or
    (T = 'LA') or
    (T = 'LAS') or
    (T = 'LOS') or
    (T = 'VAN') or
    (T = 'VON') or
    (T = 'DA') or
    (T = 'DI') or
    (T = 'DOS') or
    (T = 'DAS');
end;

function EsNombreDespuesDeParticula(const S: string): Boolean;
var
  T: string;
begin
  T := TokenLimpio(S);

  Result :=
    Pos('|' + T + '|',
      '|JESUS|JESÚS|CARMEN|ANGELES|ÁNGELES|MERCEDES|LOURDES|' +
      'DOLORES|CONCEPCION|CONCEPCIÓN|ALTAGRACIA|ROSARIO|FATIMA|FÁTIMA|') > 0;
end;

function SepararNombrePersona(const NombreCompleto: string): TNombreSeparado;
var
  Palabras: TStringList;
  Texto: string;
  N: Integer;
  CorteNombre: Integer;
  P1, P2, P3, P4: string;
begin
  Result.Nombre := '';
  Result.Apellido := '';
  Result.Regla := '';
  Result.Confianza := 0;

  Texto := NormalizarEspacios(NombreCompleto);

  Palabras := TStringList.Create;
  try
    SepararPalabras(Texto, Palabras);

    N := Palabras.Count;

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
      Exit;
    end;

    if N = 2 then
    begin
      Result.Nombre := Palabras[0];
      Result.Apellido := Palabras[1];
      Result.Regla := 'Dos palabras: nombre + apellido';
      Result.Confianza := 75;
      Exit;
    end;

    P1 := TokenLimpio(Palabras[0]);
    P2 := TokenLimpio(Palabras[1]);
    P3 := '';
    P4 := '';

    if N >= 3 then
      P3 := TokenLimpio(Palabras[2]);

    if N >= 4 then
      P4 := TokenLimpio(Palabras[3]);

    CorteNombre := 1;

    if N = 3 then
    begin
      if EsInicial(Palabras[1]) or EsSegundoNombreComun(Palabras[1]) then
      begin
        CorteNombre := 2;
        Result.Regla := 'Tres palabras: segunda palabra parece segundo nombre';
        Result.Confianza := 78;
      end
      else
      begin
        CorteNombre := 1;
        Result.Regla := 'Tres palabras: segunda palabra parece primer apellido';
        Result.Confianza := 70;
      end;
    end
    else
    begin
      // Casos especiales:
      // MARIA DEL CARMEN PEREZ
      // JOSE DE JESUS SANTOS
      // MARIA DE LOS ANGELES PEREZ
      if (P2 = 'DEL') and (N >= 4) and EsNombreDespuesDeParticula(Palabras[2]) then
      begin
        CorteNombre := 3;
        Result.Regla := 'Nombre compuesto con DEL';
        Result.Confianza := 82;
      end
      else if (P2 = 'DE') and (N >= 4) and EsNombreDespuesDeParticula(Palabras[2]) then
      begin
        CorteNombre := 3;
        Result.Regla := 'Nombre compuesto con DE';
        Result.Confianza := 82;
      end
      else if (P2 = 'DE') and
              ((P3 = 'LA') or (P3 = 'LOS') or (P3 = 'LAS')) and
              (N >= 5) and
              EsNombreDespuesDeParticula(Palabras[3]) then
      begin
        CorteNombre := 4;
        Result.Regla := 'Nombre compuesto con DE LA / DE LOS / DE LAS';
        Result.Confianza := 85;
      end
      else if EsParticulaApellido(Palabras[1]) then
      begin
        // JUAN DE LA ROSA -> Nombre=JUAN, Apellido=DE LA ROSA
        CorteNombre := 1;
        Result.Regla := 'Segunda palabra parece partícula de apellido';
        Result.Confianza := 72;
      end
      else
      begin
        // Patrón general dominicano/hispano:
        // 4 o más palabras => 2 primeras nombres, restantes apellidos.
        CorteNombre := 2;
        Result.Regla := 'Cuatro o más palabras: dos primeras como nombres';
        Result.Confianza := 80;
      end;
    end;

    Result.Nombre := UnirPalabras(Palabras, 0, CorteNombre - 1);
    Result.Apellido := UnirPalabras(Palabras, CorteNombre, N - 1);

  finally
    Palabras.Free;
  end;
end;
end.
