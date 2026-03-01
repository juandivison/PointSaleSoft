unit UGlobal;

interface
 Uses Forms,Dbtables, db, Sysutils, windows, Dialogs, Controls,Printers,Classes,
 IniFiles,IBCustomDataSet, IBQuery, IBSQL;
 const
    {C1 y C2 are used for encryption of Master Password string}
    {C1 y C2 aon usadas para encriptar la cadena de la clave}
         C1 = 52845;
         C2 = 11719;
     GlbAdministrador = 0;
     GlbSupervisor    = 1;
     GlbAgente        = 2;

     TipoTarifaHora      = 1;
     TipoTarifaDiaria    = 2;
     TipoTarifaSemanal   = 3;
     TipoTarifaQuincenal = 4;
     TipoTarifaMensual   = 5;

    GLB_FPAGO_DIARIO    = 1;
    GLB_FPAGO_SEMANAL   = 2;
    GLB_FPAGO_QUINCENAL = 3;
    GLB_FPAGO_MENSUAL   = 4;

     TNCF_FACTURA_CREDITO = '01';
     TNCF_FACTURA_CONTADO = '02';
     TNCF_NOTA_DEBITO     = '03';
     TNCF_NOTA_CREDITO    = '04';
     TNCF_REG_PROV_INFORMAL   = '11';
     TNCF_REG_UNICO_INGRESO   = '12';
     TNCF_REG_GASTOS_MENORES  = '13';
     TNCF_REG_OPE_EMP_REG_ESP = '14';

     {GLB_ORDEN_CONTRATO = 1;
     GLB_ORDEN_TRASLADO = 2;
     GLB_ORDEN_DIRECTO  = 3;
     GLB_ORDEN_CAMB_FICHA = 4;}

 var
    GlbCaptionVentana : String;
    GlbCobraTtalIntEnSaldo : smallint;
    NombreMes : Array[1..12] of String;
    GlbProcede  : Boolean;
    GlbTrnNoCuadra : Boolean;
    GlbClaveSup : String;
    strUserName : String;
    strUsuarioID: String;
    strAppPath  : String;
    DateCurr    : string;
    Size        : DWord;
    StatusGlb   : String = 'A';
    GlbLetrero  : String;
    GlbSimboloMoneda: String;
    GlbFechaInicial : TDatetime;
    GlbFechaFinal  : TDatetime;
    GlbFechaTrnDiaria: TDatetime;
    PideFecha  :Boolean = True;
    GLBRUTADB : String;
    GlbRutaDBActual : String;
    EsProcBlcCte : Boolean;
    glbTPag : Integer;
    GlbError: Boolean;
    glbMoneda       : Smallint;
    GlbNumero       : Integer;
    CodServicioGlb  : Integer;
    GlbTipoPagoContrato : Smallint;
    GlbImprimeNumCksEnRecibo : Smallint;
    GlbEsAumentoFianza : Boolean;
    GlbContError:Integer = 0;
    GlbNombreCampo : String;
    GlbCampoInt : Integer;
    GlbCampoStr : String;
    glblineacodigo: String;
    GlbSalirFiltro, GlbCteInsertado: Boolean;
    GlbAperturaContrato : Smallint = 0;
    varTipousuario,VarUsuarioGlb:Integer;
    FechaIniGlb : TDate;
    FechaFinGlb : TDate;
    HoraIniGlb  : TTime;
    HoraFinGlb  : TTime;
    GlbBalanceAnt:Real;
    glbtipodoccontrato: String;
    glbtipocontrato: Smallint;
    GlbCodOficina  : Integer;
    GlbCodCiudad   : Integer;
    GlbCodigoCia   : Integer;
    GLBCODIGO_CIA : Integer;
    glbCia_Key : Integer;
    GlbNumContrato : Integer;

    glbImpBlcAnt : Boolean;
    glbCampoFilterCte : String;
    glbValueFilterCte : String;

    GLBNombreUsuario : String;
    GlbCobroSolMonto : Integer;

    GlbOrderBy : String;
    glbNombreCta : String;
    GlbMuestraInteres : Integer;

    GlbMGendet :Boolean;
    GlbUsaFechaApertura : Integer;
    GlbMostrarBalance:Integer;
    //glbEjecutablePath : string;
    Boo_auxiglb:Boolean = False;// Usado en UEstadodeGyp para Label Rep
                               // True = Mensual
                               // False = Acumulado

   procedure LeerDatosIni;
   Function GlbTempDir:String;
   procedure SizePapelPrinter;
   function  InsertarComa(fuente:string):String;
   Function  MyStrCopy(Fuente:String;Long1:Integer;Long2:Integer):String;
   Function  MyStrCopyCta(Fuente:String;Desde:Integer;Hasta:Integer):String;
   Function  LlenarEspacios(Fuente:String;Longitud:Integer):String;
   //Procedure PAbrirtablaMoneda(Ultimo:Boolean;CodigoM:String;PorSerie:Boolean;SerieX:Integer);
   function  IdiomadeWindows:string;
   Procedure GlbAsignaCuenta(cuenta:String;var cta1:String;var cta2:String;var cta3:String);
   Function PrecioCodigo(strCodigo:String;DataSet : TIBQuery):Real;
   FuncTion DiasEnElMes(anio : Integer; Mes : Integer) : Smallint;
   Function GlbPrimerDiaDelMes(Fecha:TDatetime):TDatetime;
   Function GlbUltimoDiaMesAct(Fecha:TDatetime):TDatetime;
   FuncTion GlbUltimoDiaMesAnt(glbfechaInicial:TDatetime):TDatetime;
   Function GlbPermiteDato(sistema:integer;subsistema:integer;ciakey:Integer;Fecha:TDateTime):Boolean;
   Function ExtraerFecha(Fecha : TDatetime) : TDatetime;
   Function ExtraerHora(Hora: TDateTime) : TDatetime;
   Function FGlbPorcItbi(fecha:TDateTime):Real;
   Function FsqlMaxNumero(tabla:string;campo:string): Integer;
   Procedure glbNoExiste;//Desplega mensage de no existe en un locate
   function Encriptar(const S: String; Key: Word): String;
   function Desencriptar(const S: String; Key: Word): String;
   procedure GlbSalvarQuery(Tabla:TIBDataSet);
   Function CtaExiste(cuenta1:String;cuenta2:String;cuenta3:String;Error:Boolean):Boolean;
   Function FileToUse(folder:string; xfile:string):String;
   Function FCtaTipo(cuenta1:String;cuenta2:String;cuenta3:String;Error:Boolean):Integer;//retorna -> debito o credito
   Function PadLeftCharacter(Longitud:Smallint;Valor:Real;strFill:Char):String;
   Function  Imprime(db,cr:Real;cero:smallint):Boolean;//determina si imprime banda en reporte
   Function  sqlConsulta(tabla:string;campo:string;condicion:string;valor:String): Boolean;
   Function  CalCHora(horai : TDatetime;horaf : TDatetime):Integer;
   Function VerificaCierreDia(Sistema:Integer;SubSistema:Integer;
                            CiaKey:Integer;Fecha:TDateTime; Var FechaAct:TDatetime):Boolean;

   Function LicenciaValida(nombreCia : String) : Boolean;
   Function GetCommandParam(const Key:string; Deflt:string=''):string;

implementation


uses UDatModConectar, UDatModControl, UDatModCompania;

function GetCommandParam(const Key:string; Deflt:string=''):string;
var
   iPos:integer;
   i : integer;
begin
   Result := '';
   iPos := Pos(Key, Uppercase(CmdLine) );
   if iPos > 0 then begin
       for i := 1 to ParamCount do begin
           if Uppercase(copy(ParamStr(i), 1, Length(Key))) = Key then begin
               Result := Trim(copy(ParamStr(i), Length(Key)+2, Length(ParamStr(i))-Length(Key)-1));
               Break;
           end;
       end
   end
   else
       Result := Deflt;
end;

Procedure glbNoExiste;//usada en un locate o find
begin
  MessageDlg('No existe',mtInformation,[mbOk],0);
end;

Function  Imprime(db,cr:Real;cero:smallint):Boolean;//determina si imprime banda en reporte
begin
  if Cero = 0 then
  begin
    if ((db <> 0) or (cr <> 0)) then Result := True else Result := False;
  end else
  begin
  if ((db >= 0.0001) or (db < -0.0001)) OR
     ((CR >= 0.0001) or (CR < -0.0001)) THEN
     Result := True else Result := False;
  end;
end;


Function FCtaTipo(cuenta1:String;cuenta2:String;cuenta3:String;Error:Boolean):Integer;
var
  sqlQuery : TIBQuery;
begin
  sqlQuery:=TIBQuery.Create(nil);
  sqlQuery.Database:= dmCon.IBDatabase1;
  sqlQuery.Sql.Clear;
  sqlQuery.Sql.Text :='Select SIGNO_CTA'+
  ' from catalogo '+
  ' where cuenta1 = :cuenta1 '+
  ' and   cuenta2 = :cuenta2 '+
  ' and   cuenta3 = :cuenta3 ';
  sqlQuery.prepare;
  sqlQuery.Params[0].ParamType := ptInput;
  sqlQuery.Params[0].AsString  := cuenta1;
  sqlQuery.Params[1].ParamType := ptInput;
  sqlQuery.Params[1].AsString  := cuenta2;
  sqlQuery.Params[2].ParamType := ptInput;
  sqlQuery.Params[2].AsString  := cuenta3;
  sqlQuery.Open;
  //SIGNO_CTA ----> 1-DEBITO 2-CREDITO
  if sqlquery.RecordCount > 0 then
  Result := sqlQuery.FieldByName('SIGNO_CTA').Value  else
  begin
    Result := 0;
    if error then
    MessageDlg('Cuenta no existe', mtError,[mbOk],0);
  end;
  sqlQuery.Close;
  sqlQuery.Free;
  sqlQuery:=Nil;
end;

Function CtaExiste(cuenta1:String;cuenta2:String;cuenta3:String;Error:Boolean):Boolean;
var
  sqlQuery : TIBQuery;
begin
  sqlQuery:=TIBQuery.Create(nil);
  sqlQuery.Database:= dmCon.IBDatabase1;
  sqlQuery.Sql.Clear;
  sqlQuery.Sql.Text :='Select nombre_cta '+
  ' from catalogo '+
  ' where cuenta1 = :cuenta1 '+
  ' and   cuenta2 = :cuenta2 '+
  ' and   cuenta3 = :cuenta3 ';
  sqlQuery.prepare;
  sqlQuery.Params[0].ParamType := ptInput;
  sqlQuery.Params[0].AsString  := cuenta1;
  sqlQuery.Params[1].ParamType := ptInput;
  sqlQuery.Params[1].AsString  := cuenta2;
  sqlQuery.Params[2].ParamType := ptInput;
  sqlQuery.Params[2].AsString  := cuenta3;
  sqlQuery.Open;
  if not sqlQuery.FieldByName('nombre_cta').IsNull then
  glbNombreCta:=sqlQuery.FieldByName('nombre_cta').Value;
  if sqlquery.RecordCount > 0 then
  Result := True else
  begin
    Result := False;
    if error then
    MessageDlg('Cuenta '+cuenta1+'-'+cuenta2+'-'+cuenta3+'-'+'no existe',mtError,[mbOk],0);
  end;
  sqlQuery.Close;
  sqlQuery.Free;
  sqlQuery:=Nil;
end;


Function LicenciaValida(nombreCia : String) : Boolean;
begin
  if dmCompania.tblCompania.State = dsInactive then
  dmCompania.tblCompania.Open;
end;

Procedure GlbAsignaCuenta(cuenta:String;Var cta1:String;Var cta2:String;Var cta3:String);
begin
  cta1:= MyStrCopyCta(cuenta,1,3);
  cta2:= MyStrCopyCta(cuenta,4,5);
  cta3:= MyStrCopyCta(cuenta,6,7);
end;

Function FileToUse(folder:string; xfile:string):String;
var
   x : String;
begin
  x:=StringReplace(ExtractFilePath(Application.ExeName),'bin',folder,[rfIgnoreCase]) + xfile;
  if FileExists(x) then
  Result:= x else Result:='';
end;

Function GlbUltimoDiaMesAct(Fecha:TDatetime):TDatetime;
var
  m,d,a : word;
begin
  Decodedate(fecha,a,m,d);
  Result:=EncodeDate(a,m,DiasEnElMes(a,m));
end;

Function GlbPrimerDiaDelMes(fecha:TDatetime):TDatetime;
var
  m,d,a : word;
begin
  Decodedate(fecha,a,m,d);
  Result:=EncodeDate(a,m,1);
end;

Function PadLeftCharacter(Longitud:Smallint;Valor:Real;strFill:Char):String;
var
  strValor  : String;
  strResult : String[25];
  strMonto  : String;
  LongitudA,LongitudB,x,y:Integer;
begin  //Format('%8.2f', [123.456])
  SetLength(strResult, Longitud);
  FillChar(strResult,SizeOf(strResult),strFill);
  strValor:=Format('%9.0f', [Valor]);
  strValor:=Trim(strValor);
  LongitudA:=Length(Trim(strValor));
  LongitudB:=Longitud - LongitudA;
  For x:=1 to LongitudB do
  strResult[x]:='0';
  y:=1;
  Inc(LongitudB);
  for x:=LongitudB to Longitud do
  begin
    strResult[x]:=strValor[y];
    Inc(y);
 end;
  Result:=strResult;
end;

Function  LlenarEspacios(Fuente:String;Longitud:Integer):String;
var
  x, y  : Integer;
begin
  y :=Longitud - Length(Trim(Fuente));
  Result:='';
  for x:=1 to y do
  begin
    Result:=Result + ' ';
  end;
  Result:=Trim(Fuente) + Result;
end;

Function GlbTempDir:String;
var
   {Creamos un buffer para llamar a GetTempPath}
   {Create a buffer to call GetTempPath}
   Temp:array[0..Max_Path]of char;
begin
  { Metemos en Temp el directorio temporal}
  { Put in Temp the temp directory }
    GetTempPath(MAX_PATH,Temp);
  {Lo pasamos de Pchar a string}
  Result:=String(Temp);
end;


Function PrecioCodigo(strCodigo:String;DataSet : TIBQuery):Real;
var
  x : Integer;
  strValor : String;
begin
  StrValor:='';
  for x:=1 to Length(strcodigo) do
  begin
    if DataSet.Locate('codigo',strCodigo[x],[]) then
    StrValor:=StrValor + Dataset.Fieldbyname('valor').AsString
    else
    begin
      MessageDlg('Letra -'+strCodigo[x]+'- no es válida, verifique ',mtInformation, [mbOK], 0);
      strvalor:='';
      Break;
    end;
  end;
  if StrValor <> '' then
  result:=StrToFloat(StrValor);
end;

FuncTion  GlbUltimoDiaMesAnt(glbfechaInicial:TDatetime):TDatetime;
var
  a,m,d:Word;
begin
  DecodeDate(glbfechainicial,a,m,d);
  if (m = 1) then
  begin
    m:=12;
    Dec(a);
  end else Dec(m);
  Result:=EncodeDate(a,m,DiasEnElMes(a,m));
end;

Function GlbPermiteDato(sistema:integer;subsistema:integer;ciakey:Integer;Fecha:TDateTime):Boolean;
var
  sqlQuery : TIBSQL;
  tFecha :Tdatetime;
  tanio,tmes,tdia:word;
  anio,mes,dia:word;
  auxi:integer;
  Error:Boolean;
  AnioPeriodoF : Word;
begin
  sqlQuery:= TIBSQL.Create(Nil);
  sqlQuery.Database:= dmCon.IBDatabase1;
  sqlQuery.Sql.Clear;
  sqlQuery.Sql.Text :='Select sistema, fecha_Act, status  '+
  ' From control '+
  ' Where sistema = :sistema '+
  ' And sub_sistema = :subsistema '+
  ' And cod_cia = :ciakey';
  if not sqlQuery.prepared then
  sqlQuery.Prepare;
  sqlQuery.Params[0].AsInteger    := sistema;
  sqlQuery.Params[1].AsInteger := subsistema;
  sqlQuery.Params[2].AsInteger := ciakey;
  sqlQuery.ExecQuery;
  sqlQuery.CheckOpen;
  if sqlQuery.Open then
  begin
  error:=false;
  if sqlQuery.RecordCount = 1 then
  begin
    DecodeDate(sqlquery.fieldbyname('fecha_Act').Value,tanio,tmes,tdia);
    DecodeDate(Fecha,anio,mes,dia);
    Result:=True;
    if (tmes = mes) and (sqlquery.Fieldbyname('Status').Value = 'R') then
    begin
      Messagedlg('Mes Cerrado, verifique',mtError,[mbok],0);
      Error := true;
      Result := False;
      Inc(GlbContError);
    end;
    if dmCompania.tblCompania.State = dsInactive then
    dmCompania.tblCompania.open;
    AnioPeriodoF:=StrToInt(FormatDateTime('yyyy',dmCompania.tblCompaniaFECHAI_ACT.Value));
    auxi:=tmes;
    if auxi = 12 then auxi:=1;
    if (auxi > mes) And (AnioPeriodoF = Anio) then
    begin
      Messagedlg('Mes es menor que el último mes cerrado, verifique',mterror,[mbok],0);
      Result := False;
      Error:=true;
      Inc(GlbContError);
    end;
    if (DiasEnElMes(tanio,tmes) = tdia) and
       (sqlquery.Fieldbyname('Status').Value = 'R') then
    Begin
      Inc(tmes);
      tdia:=1;
    end;
    if (tmes = mes ) And (tdia > dia) then
    Begin
      Messagedlg('Dia es menor que el último dia posteado, verifique',mterror,[mbok],0);
      Error := True;
      Inc(GlbContError);
    end;
    if (anio <> AnioPeriodoF) and (sistema = 1) and (subsistema = 0) then
    begin
      Result := False;
      Error:=True;
      Messagedlg('Año difiere de período fiscal, verifique',mtError,[mbok],0);
      Inc(GlbContError);
    end;
    dmControl.qryControlDet.Close;
    dmControl.qryControlDet.Filtered:=false;
    dmControl.qryControlDet.Params[0].value := Sistema;
    dmControl.qryControlDet.Params[1].value := Subsistema;
    dmControl.qryControlDet.Params[2].value := ciakey;
    dmControl.qryControlDet.Open;
    if dmControl.qryControlDet.Locate('FECHA_ACT', ExtraerFecha(fecha),[]) then
    begin
      Messagedlg('Dia posteado, verifique',mtError,[mbok],0);
      Result := False;
      Inc(GlbContError);
    end else Result := True;
    if Error then
    Result := False;
    dmControl.qryControlDet.Close;
  end else
  Begin
    Messagedlg('Sistema ='+InttoStr(sistema)+' SubSistema ='+InttoStr(SubSistema)+' Cia'+InttoStr(ciakey)+'no contemplado en Control, verifique',mterror,[mbok],0);
    Result := False;
    Inc(GlbContError);
  end;
  end;
  sqlQuery.Free;
  sqlQuery:=Nil;
end;


FuncTion DiasEnElMes(anio : Integer; Mes : Integer):Smallint;
var
  a : string;
begin
  Result := MonthDays[IsLeapYear(anio), mes];
  a:='string';
end;


Function  FGlbPorcItbi(Fecha:TDateTime):Real;
begin
  Result:=0;
end;

function Desencriptar(const S: String; Key: Word): String;
var
  I: byte;
begin
  SetLength(Result,Length(S));
  for I := 1 to Length(S) do
  begin
    Result[I] := char(byte(S[I]) xor (Key shr 8));
    Key := (byte(S[I]) + Key) * C1 + C2;
  end;
end;

{ Standard Encryption algorithm - Copied from Borland}


function Encriptar(const S: String; Key: Word): String;
var
  I: byte;
begin
  SetLength(Result,Length(S));
  for I := 1 to Length(S) do
  begin
    Result[I] := char(byte(S[I]) xor (Key shr 8));
    Key := (byte(Result[I]) + Key) * C1 + C2;
  end;
end;
// Por ejemplo, para encriptar el texto de Label1:
// Label1.Caption:= Encrypt(Label1.Caption,6474);
// Y para desencriptarla:
// Label1.Caption:= Decrypt(Label1.Caption,6474);

procedure LeerDatosIni;
var
  Ini: TIniFile;
  clave : String;
begin
  Ini := TIniFile.Create( ChangeFileExt( Application.ExeName, '.INI' ) );
  try
    GlbClaveSup := Ini.ReadString('Clave', 'Maestra', '');
  finally
    Ini.Free;
  end;
end;



Function VerificaCierreDia(Sistema:Integer;SubSistema:Integer;
                            CiaKey:Integer;Fecha:TDateTime; Var FechaAct:TDatetime):Boolean;
var
  sqlQuery : TIBSQL;
  tFecha :TDatetime;
begin
  sqlQuery:=TIBSQL.Create(Nil);
  sqlQuery.Database:= dmCon.IBDatabase1;
  sqlQuery.Sql.Clear;
  sqlQuery.Sql.Text :='Select sistema, fecha_Act, status  '+
  ' From control '+
  ' Where Sistema = :Sistema '+
  ' And sub_sistema = :SubSistema '+
  ' And cod_cia = :Ciakey';
  if not sqlQuery.Transaction.InTransaction then
  sqlQuery.Transaction.StartTransaction;
  sqlQuery.Params[0].AsInteger := Sistema;
  sqlQuery.Params[1].AsInteger := Subsistema;
  sqlQuery.Params[2].AsInteger := Ciakey;
  sqlQuery.prepare;
  sqlQuery.ExecQuery;
  sqlQuery.CheckOpen;
  if SqlQuery.Open then
  begin
  if SqlQuery.RecordCount = 1 then
  begin
    tFecha:= Sqlquery.Fieldbyname('Fecha_Act').Value;
    FechaAct:= Sqlquery.Fieldbyname('Fecha_Act').Value;
    if (fecha > tFecha) then
    Result := True
    else if (fecha = tFecha) and (StrToInt(FormatDateTime('HH', Now)) >= 17)then
    begin
      Result:= True
    end else
    Result:=False;
  end else
  begin
    ShowMessage(IntToStr(Sistema)+' sistema no encontrado en tabla control, verifique');
    Result := False;
  end;
  end;
  sqlQuery.Free;
  sqlQuery:=Nil;
end;

procedure GlbSalvarQuery(Tabla:TIBDataSet);
begin
  if tabla.State in [dsEdit,dsInsert] then
  begin
    if not tabla.Transaction.InTransaction then
    tabla.Transaction.StartTransaction;
    tabla.Post;
    if  tabla.UpdatesPending then
    begin
      tabla.applyupdates;
    end;
    try
      tabla.Transaction.CommitRetaining;
    except
      tabla.Transaction.RollbackRetaining;
    end;
  end;
end;


//Inserta una coma Eje.: 5450426 = 5,450,426
Function InsertarComa(fuente:String):String;
 var
   ContC,x,y,z :Integer;
   auxi  :string;
   Inicia:boolean;
   ControlaSigno:string;
begin
  y:=-1;
  z:=0;
  ContC:=0;
  Fuente:=Trim(fuente);
  z:=Length(fuente);
  if z <= 5 then
  begin
    Result:= fuente;
    exit;
  end;
  z:=0;
  for x:=Length(fuente) downto 1  do
  begin
     if fuente[x] = '.' then
    Inicia := true;
    Auxi:=Auxi + Fuente[x];
    if Inicia then
    y:=0;
    if y = 0 then
    Inc(z) else z:=0;
    if z = 4 then
    begin
      Inc(ContC);
      if x > 1 then
      auxi:= auxi+',';
      if contc > 0   then
      z:=1 else z:=0;
    end;
  end;
  Result:='';
  z:=0;
  for x:=Length(auxi) downto 1 do
  begin
    Inc(z);
    if z = 1 then
    ControlaSigno:= auxi[x];
    if (controlaSigno = '-') and (z = 2) and (auxi[x] = ',') then
    y:=0 else Result:=Result+ auxi[x];
  end;
end;


Function IdiomadeWindows:string;
var
  ID:LangID;
  Language: array [0..100] of char;
begin
  ID:=GetSystemDefaultLangID;
  VerLanguageName(ID,Language,100);
  Result:=String(Language);
end;

Function  MyStrCopyCta(Fuente:String;Desde:Integer;Hasta:Integer):String;
var x :Integer;
begin
  Result:='';
  for x:=1 to Length(Fuente) do
  begin
    if Desde <= Hasta then
    begin
      Result:=Result + fuente[Desde];
      Inc(Desde);
    end else exit;
  end;
end;

//Long1 = 0 para copiar desde el Inicio
//Long2 = indica cuantos caracteres se copiaran
Function  MyStrCopy(Fuente:String;Long1:Integer;Long2:Integer):String;
var x :Integer;
begin
  for x:=1 to Length(Fuente) do
  begin
    if Long1 = 0 then
    begin
      if x <= Long2 then
      Result:=Result+Fuente[x];
    end else
    begin
      if x >= Long1 then
      begin
        Result:=Result+Fuente[x];
      end;
    end;
  end;
end;


function CalCHora(horai, horaf: TDatetime): Integer;
var
    hora1, min1, sec1,mil1 : Word;
    hora2, min2, sec2,mil2 : Word;
    Year, Month, Day,
    Year1, Month1, Day1: Word;
    x:Integer;
begin
  //1-23
  //1-11 AM
  //12-23PM
  //horai = 15    06
  //horaf = 02    10
  // 2-3 3-4 4-5 5-6 6-7 7-8 8-9 9-10
  //10-11 11-12 12-1 1-2
  Decodetime(Horai,Hora1,min1,sec1,mil1);
  Decodetime(Horaf,Hora2,min2,sec2,mil2);
  DecodeDate(Horai, Year, Month, Day);
  DecodeDate(horaf, Year1, Month1, Day1);
    if (month = 12) and (month1 = 1) then
        Result := 24 - hora1+ hora2
    else if month1 > month then
    Result := 24 - hora1 + hora2
    else if (hora2 <= 12)  and (day1 > day) then
    Result := 24 - hora1 + hora2
    else if ( day1 = day ) then
    Result := hora2 - hora1 else
    Result := 24 - hora1 + hora2;
  if (Min2 > Min1) then
  begin
     if (Min2 - Min1) > 20 then
     Result:= Result+1;
   end;
end;


Function sqlConsulta(tabla:string;campo:string;condicion:string;valor:String): Boolean;
var
  qry : TIBSQL;
begin
  qry := TIBSQL.create(nil);
  qry.Database:= dmCon.IBDatabase1;
  qry.sql.Clear;
  qry.SQL.Text :='Select '+ Campo +' From '+ Tabla +' Where '+
                            Campo +' '+ Condicion +' '+ Chr(39) + Valor + Chr(39);
  qry.ExecQuery;
  qry.CheckOpen;
  if qry.open then
  begin
  If qry.RecordCount > 0 then
  Result := true
  else Result := False;
  end;
  qry.Close;
  qry.free;
end;

Function ExtraerFecha(Fecha : TDatetime) : TDatetime;
begin
  Result := StrToDate(FormatDatetime(ShortDateFormat, fecha));
end;

Function ExtraerHora(Hora: TDatetime) : TDateTime;
begin
  Result := StrToTime(FormatDatetime('hh:mm:ss',hora));
end;

Function FsqlMaxNumero(tabla:String;campo:String): Integer;
var
  qryMax : TIBQuery;
begin
  qryMax := TIBQuery.Create(Nil);
  qryMax.Database := dmCon.IBDatabase1;
  qryMax.Sql.Clear;
  qryMax.SQL.Text :='Select max('+campo+') NumMax'+' from '+tabla;
  qryMax.Open;
  Result := qryMax.Fieldbyname('NumMax').AsInteger + 1;
  qryMax.Close;
  qryMax.Free;
end;


procedure SizePapelPrinter;
var
   Device : array[0..255] of char;
   Driver : array[0..255] of char;
   Port   : array[0..255] of char;
   hDMode : THandle;
   PDMode : PDEVMODE;
begin
  Printer.PrinterIndex := Printer.PrinterIndex;
  Printer.GetPrinter(Device, Driver, Port, hDMode);
  if hDMode <> 0 then begin
     pDMode := GlobalLock(hDMode);
     if pDMode <> nil then begin

    {Set to legal}
     pDMode^.dmFields := pDMode^.dmFields Or dm_PaperSize;
     pDMode^.dmPaperSize := DMPAPER_LEGAL;

    {Set to custom size}
     pDMode^.dmFields := pDMode^.dmFields or
                          DM_PAPERSIZE or
                         DM_PAPERWIDTH or
                         DM_PAPERLENGTH;
     pDMode^.dmPaperSize := DMPAPER_USER;
     pDMode^.dmPaperWidth := 212 {SomeValueInTenthsOfAMillimeter};
     pDMode^.dmPaperLength := 92 {SomeValueInTenthsOfAMillimeter};

    {Set the bin to use}
     pDMode^.dmFields := pDMode^.dmFields or DMBIN_MANUAL;
     pDMode^.dmDefaultSource := DMBIN_MANUAL;

     GlobalUnlock(hDMode);
   end;
  end;
end;

Begin
  NombreMes[1]:='Enero';
  NombreMes[2]:='Febrero';
  NombreMes[3]:='Marzo';
  NombreMes[4]:='Abril';
  NombreMes[5]:='Mayo';
  NombreMes[6]:='Junio';
  NombreMes[7]:='Julio';
  NombreMes[8]:='Agosto';
  NombreMes[9]:='Septiembre';
  NombreMes[10]:='Octubre';
  NombreMes[11]:='Noviembre';
  NombreMes[12]:='Diciembre';
  Size := 128;
  SetLength ( strUsername, Size);
  GetUserName (Pchar(strUserName),size);
  dateCurr:=FormatDatetime('yyyy-mm-dd',date);
end.


