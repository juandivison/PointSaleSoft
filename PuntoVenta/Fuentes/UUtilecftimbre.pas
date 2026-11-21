unit UUtilecftimbre;
//if not GetVerificaeCF(dmFactura.qryVentaFacturaNumero.Value) then
interface
           
uses
  SysUtils, Classes, IBDatabase, IBQuery, IB, Dialogs,
  Dateutils, Variants, UDatModConectar;

  function PosEx(const SubStr, S: string; Offset: Cardinal = 1): Integer;

// --- helper: dividir por '|' sin usar DelimitedText ---
procedure SplitByPipe(const S: string; L: TStrings);

function ExtractQueryParam(const Url, Param: string): string;

{
  Parsea el string returntimbre (formato):
  "<codigoSeguridad>|<encf>|fechaEmision=dd-MM-yyyy hh:nn:ss|montoTotal=nnnnn.nn|urlImage=http://...>"
}
procedure ParseReturnTimbre(const S: string;
  var CodigoSeg, Encf, FechaEmiStr, MontoStr, UrlImg: string);
{
  Inserta el timbre en Firebird 2.5.
  Si ADatabase o ATrans son nil, usa dmConectar.IBDatabase1 / dmConectar.IBTransaction1.
  ATRN: número de transacción (TRN) a guardar.
}
function SaveTimbreToFirebird(const ADatabase: TIBDatabase; const ATrans: TIBTransaction;
  ATRN: Integer; const ReturnTimbre: string): Boolean;

function GetRutaTimbre(trn :Integer;var codseg:string;var femision:string):String;
function GetUrlImageTimbre(trn :Integer;var codseg:string;var femision:string):String;

procedure GuardarTimbreEjemplo(trn:Integer;ReturnTimbre:string);

function GetVerificaeCF(trn :Integer):Boolean;
function GetVerificaTieneeCF(trn :Integer):Boolean;
function GetTieneeCF(trn :Integer):Boolean;
function FindQrFileRecursive(const RootDir, FileName: string): string;

implementation
uses uglobal, UEcfTimbreVentaLocal;

function GetTieneeCF(trn :Integer):Boolean;
var
  q:TIBQuery;
begin
  q := TIBQuery.Create(nil);
  try
    q.Database := dmConectar.IBDatabase1;
    q.SQL.Text :=
      'SELECT 1 '+
      'from ECF_TIMBRE_LOG '+
      'Where trn=:trn';
    q.ParamByName('TRN').AsInteger:= trn;
    q.open;
    q.first;
    if q.RecordCount >= 1 then
    result:=True
    else result:=False;
  except
    on E: Exception do
    begin
      //MessageDlg(E.Message, mtError, [mbOK], 0);
      result:=True;
    end;
  end;
  q.Free;
end;

function GetVerificaTieneeCF(trn :Integer):Boolean;
var
  q:TIBQuery;
  flag:Boolean;
begin
  flag:=true;
  q := TIBQuery.Create(nil);
  try
    q.Database := dmConectar.IBDatabase1;
    q.SQL.Text :=
    'Select 1 '+
    'From NCF_ASIGNADOS r '+
    'inner join VENTAS_MAST v On v.SERIE_NCF_ASIGNADO=r.SERIE '+
    'Where v.NUMERO =:TRN';
    q.ParamByName('TRN').AsInteger:= trn;
    q.open;
    q.first;
    if q.RecordCount >= 1 then
      result:=True
    else
    result:=False;
  except
    on E: Exception do
    begin
      MessageDlg(E.Message, mtError, [mbOK], 0);
      result:=True;
    end;
  end;
  q.Free;
end;

function GetVerificaeCF(trn :Integer):Boolean;
var
  q:TIBQuery;
  flag:Boolean;
begin
  flag:=true;
  q := TIBQuery.Create(nil);
  try
    q.Database := dmConectar.IBDatabase1;
    q.SQL.Text :=
    'Select 1 '+
    'From NCF_ASIGNADOS r '+
    'inner join VENTAS_MAST v On v.SERIE_NCF_ASIGNADO=r.SERIE '+
    'Where v.NUMERO =:TRN';
    q.ParamByName('TRN').AsInteger:= trn;
    q.open;
    q.first;
    if q.RecordCount >= 1 then
    begin
      result:=True;
      flag:=false;//tiene ecF asignado
    end else
        result:=False;
  except
    on E: Exception do
    begin
      MessageDlg(E.Message, mtError, [mbOK], 0);
      result:=True;
      flag:=true;
    end;
  end;
  q.Free;
  
  if flag then exit;

  q := TIBQuery.Create(nil);
  try
    q.Database := dmConectar.IBDatabase1;
    q.SQL.Text :=
      'SELECT 1 '+
      'from ECF_TIMBRE_LOG '+
      'Where trn=:trn';
    q.ParamByName('TRN').AsInteger:= trn;
    q.open;
    q.first;
    if q.RecordCount >= 1 then
    result:=True
    else result:=False;
  except
    on E: Exception do
    begin
      MessageDlg(E.Message, mtError, [mbOK], 0);
      result:=True;
    end;
  end;
  q.Free;
end;

function FindQrFileRecursive(const RootDir, FileName: string): string;
var
  sr      : TSearchRec;
  res     : Integer;
  current : string;
  found   : string;
begin
  Result  := '';
  current := IncludeTrailingPathDelimiter(RootDir);

  res := FindFirst(current + '*.*', faAnyFile, sr);
  try
    while res = 0 do
    begin
      if (sr.Attr and faDirectory) <> 0 then
      begin
        if (sr.Name <> '.') and (sr.Name <> '..') then
        begin
          found := FindQrFileRecursive(current + sr.Name, FileName);
          if found <> '' then
          begin
            Result := found;
            Exit;
          end;
        end;
      end
      else
      begin
        if SameText(sr.Name, FileName) then
        begin
          Result := current + sr.Name;
          Exit;
        end;
      end;

      res := FindNext(sr);
    end;
  finally
    FindClose(sr);
  end;
end;

//Debe ser mejorado esta muy lento
{
function GetRutaTimbre(trn: Integer; var codseg: string; var femision: string): string;
var
  q            : TIBQuery;
  baseDir      : string;
  fileName     : string;
  fecha, fechaDir : TDateTime;
  yearStr      : string;
  dayStr       : string;
  monthFolder  : string;
  monthName    : string;
  monthFolders : array[0..2] of string;
  tipoList     : array[0..5] of string;
  i, mf        : Integer;
  candidate    : string;
  dayRootDir   : string;
  m            : Integer;

  function MesEsFolder(const dt: TDateTime): string;
  var
    mm: Integer;
    s : string;
  begin
    mm := MonthOf(dt);

    // UGlobal: NombreMes[1..12] en español
    s := Trim(NombreMes[mm]);
    if s = '' then
      s := FormatDateTime('mm', dt); // fallback

    // Primera mayúscula: "marzo" -> "Marzo"
    s := AnsiUpperCase(Copy(s, 1, 1)) + Copy(s, 2, MaxInt);
    Result := s;
  end;

begin
  Result := '';
  codseg := '';
  femision := '';

  q := TIBQuery.Create(nil);
  try
    q.Database := dmConectar.IBDatabase1;
    q.SQL.Text :=
    'SELECT ' +
    'r.CODIGO_SEGURIDAD, max(n.FECHA) fecha, r.FECHA_CREACION, r.URL_IMAGE '+
    'FROM ECF_TIMBRE_LOG r '+
    'inner join NCF_ASIGNADOS n on n.NUMERO_NCF = r.ENCF '+
    'WHERE TRN = :TRN '+
    'Group by r.CODIGO_SEGURIDAD, r.FECHA_CREACION, r.URL_IMAGE ';
    q.ParamByName('TRN').AsInteger := trn;
    q.Open;

    if q.IsEmpty then
    begin
      LogInformacionTxt(Format('GetRutaTimbre: no hay timbre en ECF_TIMBRE_LOG para TRN %d', [trn]));
      Exit;
    end;

    codseg   := q.FieldByName('CODIGO_SEGURIDAD').AsString;
    femision := q.FieldByName('FECHA_CREACION').AsString;

    if not q.FieldByName('FECHA').IsNull then
    fechaDir:= q.FieldByName('FECHA').AsDateTime
    else
    if not q.FieldByName('FECHA_CREACION').IsNull then
      fechaDir:= q.FieldByName('FECHA_CREACION').AsDateTime
    else
      fechaDir:= Now; // fallback

    // 1) Fecha de creación (para YYYY\mes\DD)
    if not q.FieldByName('FECHA_CREACION').IsNull then
      fecha := q.FieldByName('FECHA_CREACION').AsDateTime
    else
      fecha := Now; // fallback

    yearStr := FormatDateTime('yyyy', fechaDir);
    dayStr  := FormatDateTime('dd', fechaDir);

    // Mes consistente en español (sin depender del locale de Windows)
    m := MonthOf(fechaDir);
    monthName := MesEsFolder(fechaDir);                 // "Marzo"
    monthFolders[0] := monthName;                    // "Marzo"
    //monthFolders[1] := Format('%.2d-%s', [m, monthName]); // "03-Marzo" (compatibilidad)
    monthFolders[1] := monthName; // "03-Marzo" (compatibilidad)
    monthFolders[2] := Format('%.2d', [m]);          // "03" (compatibilidad)

    // 2) Carpeta base a partir del template GlbRutaQREcf
    baseDir := ExtractFilePath(GlbRutaQREcf);        // C:\...\QR_ECF\

    // 3) Nombre de archivo según el template QR_[numerotrn].jpg
    fileName := ExtractFileName(GlbRutaQREcf);       // "QR_[numerotrn].jpg"
    fileName := StringReplace(
                  fileName,
                  '[numerotrn]',
                  IntToStr(trn),
                  [rfReplaceAll, rfIgnoreCase]
                );                                   // "QR_1234.jpg"

    // 4) Tipos conocidos
    tipoList[0] := 'E31';
    tipoList[1] := 'E32';
    tipoList[2] := 'E33';
    tipoList[3] := 'E34';
    tipoList[4] := 'E44';
    tipoList[5] := 'E45';

    // 5) Intentar reconstruir ruta exacta con variantes del folder del mes
    for mf := Low(monthFolders) to High(monthFolders) do
    begin
      monthFolder := monthFolders[mf];

      for i := Low(tipoList) to High(tipoList) do
      begin
        candidate :=
          IncludeTrailingPathDelimiter(baseDir) +
          yearStr + PathDelim +
          monthFolder + PathDelim +
          dayStr + PathDelim +
          tipoList[i] + PathDelim +
          fileName;

        if FileExists(candidate) then
        begin
          Result := candidate;
          LogInformacionTxt('Ruta QR (reconstruida) -> ' + Result);
          Exit;
        end;
      end;

      // 6) Fallback: buscar dentro de la carpeta del día (solo ese día)
      dayRootDir :=
        IncludeTrailingPathDelimiter(baseDir) +
        yearStr + PathDelim +
        monthFolder + PathDelim +
        dayStr;

      if DirectoryExists(dayRootDir) then
      begin
        Result := FindQrFileRecursive(dayRootDir, fileName);
        if Result <> '' then
        begin
          LogInformacionTxt('Ruta QR (fallback búsqueda) -> ' + Result);
          Exit;
        end;
      end;
    end;

    // 7) Último recurso: ruta "plana" antigua (compatibilidad)
    Result := IncludeTrailingPathDelimiter(baseDir) + fileName;
    LogInformacionTxt('Ruta QR (plana/compatibilidad) -> ' + Result);

  except
    on E: Exception do
    begin
      LogInformacionTxt('Error GetRutaTimbre -> ' + E.Message);
      MessageDlg(E.Message, mtError, [mbOK], 0);
      Result := '';
    end;
  end;

  q.Free;
end;}//Debe ser mejorado esta muy lento

function GetUrlImageTimbre(trn:Integer;var codseg:string;var femision:string):string;
var Q:TIBQuery;Tx:TIBTransaction;Aviso,Retorno:string;Intento:Integer;Stamp:TTimbreVentaLocal;
begin
  Result:='';codseg:='';femision:='';
  Tx:=TIBTransaction.Create(nil);Q:=TIBQuery.Create(nil);
  try
    Tx.DefaultDatabase:=dmConectar.IBDatabase1;Q.Database:=dmConectar.IBDatabase1;Q.Transaction:=Tx;
    for Intento:=0 to 1 do
    begin
      Tx.StartTransaction;
      Q.SQL.Text:='SELECT FIRST 1 R.CODIGO_SEGURIDAD,R.FECHA_EMISION,R.URL_IMAGE,R.ENCF,R.MONTO_TOTAL,C.RNC_NUMERO FROM ECF_TIMBRE_LOG R '+
        'JOIN VENTAS_MAST V ON V.NUMERO=R.TRN JOIN NCF_ASIGNADOS N ON N.SERIE=V.SERIE_NCF_ASIGNADO '+
        'JOIN COMPANIA C ON C.CODIGO=V.CIA_KEY WHERE R.TRN=:T AND R.ENCF=N.NUMERO_NCF AND R.CODIGO_SEGURIDAD IS NOT NULL '+
        'AND CHAR_LENGTH(TRIM(R.CODIGO_SEGURIDAD))=6 AND R.FECHA_EMISION IS NOT NULL '+
        'AND R.MONTO_TOTAL IS NOT NULL AND R.URL_IMAGE IS NOT NULL AND CHAR_LENGTH(TRIM(R.URL_IMAGE))>0 ORDER BY R.ID DESC';
      Q.ParamByName('T').AsInteger:=trn;Q.Open;
      if not Q.Eof then begin
        Retorno:=Q.Fields[0].AsString+'|'+Q.Fields[3].AsString+'|'+
          FormatDateTime('dd-mm-yyyy hh:nn:ss',Q.Fields[1].AsDateTime)+'|'+
          StringReplace(FormatFloat('0.00',Q.Fields[4].AsCurrency),DecimalSeparator,'.',[rfReplaceAll])+'|urlImage='+Q.Fields[2].AsString;
        if not LeerRetornoTimbre(Retorno,Stamp) or (Stamp.Rnc<>Trim(Q.Fields[5].AsString)) then
          raise Exception.Create('Timbre guardado no corresponde a la factura/empresa');
        codseg:=Stamp.Codigo;femision:=FormatDateTime('dd-mm-yyyy hh:nn:ss',Stamp.Fecha);Result:=Stamp.Url;
        Q.Close;Tx.Rollback;Break;
      end;
      Q.Close;Tx.Rollback;
      if Intento=0 then
        if not RestaurarTimbreVentaLocal(dmConectar.IBDatabase1,trn,GlbRutaEcf,'',Aviso)then Break;
    end;
  except on E:Exception do begin
    LogInformacionTxt('Timbre impresion TRN='+IntToStr(trn)+': '+E.Message);
    Result:='';codseg:='';femision:='';
  end;end;
  if Tx.InTransaction then Tx.Rollback;Q.Free;Tx.Free;
end;

function GetRutaTimbre(trn:Integer;var codseg:string;var femision:string):string;
var Url:string;
begin
  Result:='';Url:=GetUrlImageTimbre(trn,codseg,femision);if Url='' then Exit;
  try
    Result:=StringReplace(GlbRutaQREcf,'[numerotrn]',IntToStr(trn),[rfReplaceAll,rfIgnoreCase]);
    CrearImagenQrTimbre(Url,Result);
  except on E:Exception do begin Result:='';LogInformacionTxt('QR Delphi: '+E.Message);end;end;
end;

function SafePosEq(const S: string): Integer;
begin
  Result := Pos('=', S);
end;

function ParseFechaEmision(const S: string; out DT: TDateTime): Boolean;
var
  sp, d, t: string;
  dY, dM, dD, tH, tN, tS: Word;
  p1, p2, p3: Integer;
begin
  Result := False;
  DT := 0;
  sp := Trim(S);
  if sp = '' then Exit;

  // Esperado: "dd-MM-yyyy hh:nn:ss"
  // Separamos fecha y hora por espacio
  p1 := Pos(' ', sp);
  if p1 > 0 then
  begin
    d := Copy(sp, 1, p1 - 1);
    t := Copy(sp, p1 + 1, MaxInt);
  end
  else
  begin
    d := sp;
    t := '';
  end;

  // Fecha dd-MM-yyyy
  p1 := Pos('-', d);
  p2 := 0; p3 := 0;
  if p1 > 0 then p2 := PosEx('-', d, p1 + 1); // PosEx no existe en D7; emulamos:
  if (p1 > 0) and (p2 > 0) then
  begin
    // dd
    Val(Copy(d, 1, p1 - 1), dD, p3);
    if p3 <> 0 then Exit;
    // MM
    Val(Copy(d, p1 + 1, p2 - p1 - 1), dM, p3);
    if p3 <> 0 then Exit;
    // yyyy
    Val(Copy(d, p2 + 1, MaxInt), dY, p3);
    if p3 <> 0 then Exit;
  end
  else
    Exit;

  // Hora hh:nn:ss (opcional)
  tH := 0; tN := 0; tS := 0;
  if t <> '' then
  begin
    p1 := Pos(':', t);
    if p1 > 0 then
    begin
      Val(Copy(t, 1, p1 - 1), tH, p3);
      if p3 <> 0 then Exit;
      p2 := PosEx(':', t, p1 + 1);
      if p2 > 0 then
      begin
        Val(Copy(t, p1 + 1, p2 - p1 - 1), tN, p3);
        if p3 <> 0 then Exit;
        Val(Copy(t, p2 + 1, MaxInt), tS, p3);
        if p3 <> 0 then Exit;
      end
      else
      begin
        // hh:mm
        Val(Copy(t, p1 + 1, MaxInt), tN, p3);
        if p3 <> 0 then Exit;
      end;
    end
    else
    begin
      // Solo hora "hh"
      Val(t, tH, p3);
      if p3 <> 0 then Exit;
    end;
  end;

  try
    DT := EncodeDate(dY, dM, dD) + EncodeTime(tH, tN, tS, 0);
    Result := True;
  except
    Result := False;
  end;
end;

// Implementación de PosEx para Delphi 7
function PosEx(const SubStr, S: string; Offset: Cardinal = 1): Integer;
var
  i, l, subl: Integer;
begin
  Result := 0;
  l := Length(S);
  subl := Length(SubStr);
  if (subl = 0) or (Offset < 1) or (Offset > l) then Exit;
  for i := Integer(Offset) to l - subl + 1 do
    if CompareMem(@S[i], @SubStr[1], subl) then
    begin
      Result := i;
      Exit;
    end;
end;

// --- helper: dividir por '|' sin usar DelimitedText ---
procedure SplitByPipe(const S: string; L: TStrings);
var
  i: Integer;
  token, raw: string;
begin
  L.Clear;
  raw := S;

  // quitar pipes iniciales (si los hay)
  while (Length(raw) > 0) and (raw[1] = '|') do
    System.Delete(raw, 1, 1);

  token := '';
  i := 1;
  while i <= Length(raw) do
  begin
    if raw[i] = '|' then
    begin
      L.Add(token);
      token := '';
    end
    else
      token := token + raw[i];
    Inc(i);
  end;
  // último token
  L.Add(token);
end;

function ExtractQueryParam(const Url, Param: string): string;
var
  LUrl, LParam: string;
  pStart, pAmp: Integer;
begin
  Result := '';
  LUrl := AnsiLowerCase(Url);
  LParam := AnsiLowerCase(Param) + '=';
  pStart := Pos(LParam, LUrl);
  if pStart > 0 then
  begin
    Inc(pStart, Length(LParam));
    // calcular en la cadena original para conservar mayúsculas/minúsculas
    pAmp := Pos('&', Copy(Url, pStart, MaxInt));
    if pAmp > 0 then
      Result := Copy(Url, pStart, pAmp - 1)
    else
      Result := Copy(Url, pStart, MaxInt);
  end;
end;

procedure ParseReturnTimbre(const S: string;
  var CodigoSeg, Encf, FechaEmiStr, MontoStr, UrlImg: string);
var
  items: TStringList;
  i, p: Integer;
  item, key, val: string;
begin
  CodigoSeg   := '';
  Encf        := '';
  FechaEmiStr := '';
  MontoStr    := '';
  UrlImg      := '';

  items := TStringList.Create;
  try
    // 2) Separa por '|'
    SplitByPipe(S, items);

    // Esperado:
    // [0]=codigoSeguridad
    // [1]=encf
    // [2..]=pares clave=valor (fechaEmision, montoTotal, urlImage, qrFile,...)
    if items.Count > 0 then CodigoSeg := items[0];
    if items.Count > 1 then Encf      := items[1];

    for i := 2 to items.Count - 1 do
    begin
      item := items[i];
      p := Pos('=', item);
      if p > 0 then
      begin
        key := AnsiLowerCase(Trim(Copy(item, 1, p - 1)));
        val := Trim(Copy(item, p + 1, MaxInt));

        if key = 'fechaemision' then
          FechaEmiStr := val
        else if key = 'montototal' then
          MontoStr := val
        else if key = 'urlimage' then
          UrlImg := val;
        // si quieres capturar qrFile:
        // else if key = 'qrfile' then
        //   QrFile := val;
      end;
    end;

    // Rescatar desde la URL si faltan datos críticos
    if (Encf = '') and (UrlImg <> '') then
    begin
      Encf := ExtractQueryParam(UrlImg, 'ENCF');
      if Encf = '' then Encf := ExtractQueryParam(UrlImg, 'encf');
    end;

    if (CodigoSeg = '') and (UrlImg <> '') then
    begin
      CodigoSeg := ExtractQueryParam(UrlImg, 'CodigoSeguridad');
      if CodigoSeg = '' then CodigoSeg := ExtractQueryParam(UrlImg, 'codigoseguridad');
    end;
  finally
    items.Free;
  end;
end;

function SaveTimbreToFirebird(const ADatabase: TIBDatabase; const ATrans: TIBTransaction;
  ATRN: Integer; const ReturnTimbre: string): Boolean;
var DB:TIBDatabase;T:TTimbreVentaLocal;
begin
  Result:=False;DB:=ADatabase;if DB=nil then DB:=dmConectar.IBDatabase1;
  if not LeerRetornoTimbre(ReturnTimbre,T) then Exit;
  // Transaccion propia: no confirma ni revierte cambios de la pantalla.
  Result:=GuardarTimbreVentaLocal(DB,ATRN,T);
end;

procedure GuardarTimbreEjemplo(trn:Integer;ReturnTimbre:string);
var
  ok: Boolean;
begin
  //ReturnTimbre := 'Uk9hPM|E320000000011|fechaEmision=19-09-2025 23:43:41|montoTotal=1500.00|urlImage=https://...';
  try
    ok := SaveTimbreToFirebird(dmConectar.IBDatabase1, dmConectar.IBTransaction1, TRN, ReturnTimbre);
    if ok then
    begin
      //ShowMessage('Timbre guardado correctamente.')
    end
    else
      ShowMessage('No se pudo guardar el timbre.');
  finally
  end;
end;

end.

