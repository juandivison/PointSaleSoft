unit UGlobal;

interface
 Uses Forms,Dbtables, db, Sysutils, windows, Dialogs, Controls,Printers,Classes,
 IniFiles, Variants, IBCustomDataSet, IBQuery, IBSQL;
 const
    {C1 y C2 are used for encryption of Master Password string}
    {C1 y C2 aon usadas para encriptar la cadena de la clave}
         C1 = 52845;
         C2 = 11719;
     LF    = #10;
     TAB   = #9;
     CR    = #13;
     BLANK = #32;


    BreakingLine = '//----------------------------------------------------------------------------//';         
 var

    NombreMes : Array[1..12] of String;

    strUserName : String;
    glbLogueado : smallint; 
    vUserName   : String[12];
    GlbClaveSup : String;
    strUsuarioID: String;
    strAppPath  : String;
    DateCurr    : string;
    Size        : DWord;
    StatusGlb   : String = 'A';
    GlbLetrero  : String;
    GlbSimboloMoneda : String;
    GlbFechaInicial : TDatetime;
    glbFechaFinal   : TDatetime;
    GlbFechaTrnDiaria: TDatetime;
    PideFecha  :Boolean = True;
    EsCuadre   :Boolean = False;
    EsDevolucion : Boolean = False;
    EsProcBlcCte     : Boolean;
    glbTPag :  Integer;
    GlbCampoFilterCte : String;
    GlbOrderBy  : String;
    glbValueFilterCte : String;
    GlbError: Boolean;
    glbMoneda       : Smallint;
    GlbNumero       : Integer;
    CodServicioGlb  : Integer;
    GlbCodigoCia    : Integer;
    GlbContError:Integer=0;
    GlbNombreCampo : String;
    GlbCampoInt : Integer;
    GlbCampoStr : String;
    Glblineacodigo: String;
    GlbSalirFiltro: Boolean;
    varTipousuario,VarUsuarioGlb:Integer;
    FechaIniGlb : TDate;
    FechaFinGlb : TDate;
    HoraIniGlb  : TTime;
    HoraFinGlb  : TTime;
    GLBRUTADB : String;
    GlbRutaDBActual : String;    
    GlbBalanceAnt  : Real;
    GlbFechaNomina : TDate;
    GlbPrecioMayRegOrden: Integer;
    GlbCodOficina  : Integer;
    GlbMontoInteresMoraPgdo : Real;
    GlbFinanciamiento : Boolean = false;
    GlbPermiteCambioPrecio : Boolean = false;
    repIngTodo : Boolean = False;
    repIngEfe  : Boolean = False;
    repIngCxc  : Boolean = False;
    GlbDescNCF : String;
    VarNombreUsuario:String;
    NombreMesCorto : Array[1..12] of string = ('ENE','FEB','MAR','ABR','MAY','JUN',
                                               'JUL','AGO','SEP','OCT','NOV','DIC');
    GlbSizeFact8x11,
    GlbSizeCotiza8x11,
    GlbActF10CodBarra,
    GlbImpCodProducto,
    GlbSolDCteVCash,
    GlbRec3Pulg,
    GlbRec55Pulg,
    GlbFact3Pulg,
    GlbFact55Pulg,
    GlbCot3Pulg,
    GlbCot55Pulg,
    GlbNCFConfFinal : Integer;
    GlbPiedePaginaFactura: String;
    GlbSolicitaDVeh : Integer;
    //GlbNoGeneraNCF  : Boolean;
    GlbCodDivInventario : Integer;
    GlbPermiteVentaInv0 : Integer;
    GlbPrecioCodificado : Smallint;
    GlbFechaVencProducto: Smallint;
    GlbInluirPrecioItbisenLabel : Smallint;
    GlbPermiteUnaInstancia : Integer;
    GlbEsDebugEntradas : smallint;
    glbNombreCta    : String;
    glbCredito      : Real;
    GlbPrueba       : Boolean;
    glbDebito       : Real;
    glbBalanceIni   : Real = 0;
    GlbDif          : Real;
    GlbCorriendo    : Integer;
    GlbCorriendoII  : Smallint;
    GlbImpReciboSinPreg : Smallint;
    SISTEMA_CNT     : Smallint;
    SUBSISTEMA_CNT  : Smallint;
    GLBCODIGO_CIA   : Smallint;
    Actualizar:Boolean = False;
    EsReporte : Boolean = False;
    GlbDescTipoCNT  : String;
    GlbVenderDesdeAlmacenP : Smallint;
    GLBMODULO_CNT : Integer;
    TIPO_DOCUMENTO_CNT : Smallint = 0;

   Procedure LeerDatosIni;
   Procedure SizePapelPrinter;
   Function  InsertarComa(fuente:string):String;
   //Function  MyStrCopy(Fuente:String;Long1:Integer;Long2:Integer):String;
   Function  MyStrCopy(Fuente:String;Desde:Integer;Hasta:Integer):String;
   //Procedure PAbrirtablaMoneda(Ultimo:Boolean;CodigoM:String;PorSerie:Boolean;SerieX:Integer);
   Function  IdiomadeWindows:string;

   Function FRangoFechaNomina(Fecha : TDatetime; Var FechaNom:TDatetime):String;

   Function GetCommandParam(const Key:string; Deflt:string=''):string;
   Procedure IniciaTransaccion(data:TIBDataSet);
   Procedure GuardarIbDataset(data:TIBDataSet);

   Function RemoverCaracter(valor : String; dato:String):String;
   Procedure ProcFechaIniComNomina(Var xFechaIni: TDatetime);
   Procedure GlbAsignaCuenta(cuenta:String;var cta1:String;var cta2:String;var cta3:String);
   Function PrecioEnLetra(precio : Real;DataSet : TIBQuery):Real;
   Function PrecioCodigo(strCodigo:String;DataSet : TIBQuery):Real;
   FuncTion DiasEnElMes(anio : Integer; Mes : Integer) : Smallint;
   FuncTion GlbUltimoDiaMesAnt(glbfechaInicial:TDatetime):TDatetime;
   Function GlbPermiteDato(sistema:integer;subsistema:integer;ciakey:Integer;Fecha:TDateTime):Boolean;
   Function ExtraerFecha(Fecha : TDatetime) : TDatetime;
   Function ExtraerHora(Hora: TDateTime) : TDatetime;
   Function  CtaExiste(cuenta1:String;cuenta2:String;cuenta3:String;Error:Boolean):Boolean;
   Function IsNumerico(const S: string):Boolean;

   Function  FGlbPorcItbi(fecha:TDateTime):Real;
   Function  FsqlMaxNumero(tabla:string;campo:string): Integer;
   function Encriptar(const S: String; Key: Word): String;
   function Desencriptar(const S: String; Key: Word): String;
   procedure GlbSalvarQuery(Tabla:TIBDataSet);
   Function  sqlConsulta(tabla:string;campo:string;condicion:string;valor:String): Boolean;
   Function  CalCHora(horai : TDatetime;horaf : TDatetime):Integer;
   Function VerificaCierreDia(Sistema:Integer;SubSistema:Integer;
                            CiaKey:Integer;Fecha:TDateTime; Var FechaAct:TDatetime):Boolean;
   Function PadLeftCharacter(Longitud:Smallint;Valor:Real;strFill:Char):String;
   Function FileToUse(folder:string; xfile:string):String;
      // Procedure for appending a Message to an existing logfile with current Date and Time **
   procedure WriteToLog(aLogMessage:String);
   procedure CreateLogfile;
implementation



uses UDatModConectar, UDatosVentas, UDatModCompania, UDatModControl;

procedure CreateLogfile;
var
  F:TextFile;
FN:String;
begin
  //Exit;//Configurar aqui para usar Parametro
  // Getting the filename for the logfile (In this case the Filename is 'application-exename.log'
  FN := ChangeFileExt(Application.Exename, '.log');
  // Assigns Filename to variable F

  AssignFile(F, FN);

  if FileExists(FN) then   // Open file for appending
  Append(f)
  else
  Rewrite(F);
  // Write text to Textfile F
  WriteLn(F, BreakingLine);
  WriteLn(F, 'This Logfile was created on ' + DateTimeToStr(Now));
  WriteLn(F, BreakingLine);
  WriteLn(F, '');
  // finally close the file
  CloseFile(F);
end;

procedure WriteToLog(aLogMessage:String);
var
  T:TextFile;
FN:String;
begin
  //Exit;//Configurar aqui para usar Parametro
  
  // Getting the filename for the logfile (In this case the Filename is 'application-exename.log'
  FN := ChangeFileExt(Application.Exename, '.log');

  //Checking for file
  if (not FileExists(FN)) then
  begin
    // if file is not available then create a new file
    CreateLogFile;
  end;

  // Assigns Filename to variable F  
  AssignFile(T, FN);
  // start appending text
  Append(T);
  WriteLn(T, DateTimeToStr(Now) + ': ' + aLogMessage);
  //Write a new line with current date and message to the file
  CloseFile(T)
  // Close file
end;

Function RemoverCaracter(valor : String; dato:String):String;
begin
  Delete(valor,Length(valor),1);
  Result:=Valor;
end;

Procedure GlbAsignaCuenta(cuenta:String;var cta1:String;var cta2:String;var cta3:String);
begin
  cta1:=MyStrCopy(cuenta,1,3);
  cta2:=MyStrCopy(cuenta,4,5);
  cta3:=MyStrCopy(cuenta,6,7);
end;

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

Function PadLeftCharacter(Longitud:Smallint;Valor:Real;strFill:Char):String;
var
   strValor : String;
  strResult : String[28];
  strMonto  : String;
  LongitudA,LongitudB,x,y:Integer;
begin  //Format('%8.2f', [123.456])
  SetLength(strResult, Longitud);
  FillChar(strResult,Longitud,strFill);
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

Function IsNumerico(const S: string):Boolean;
var
  P : Pchar;
begin
  P := PChar(S);
  Result := False;
  while P^ <> #0 do
  begin
    if not (p^ in ['0'..'9']) then Exit;
    Inc(p)
  end;
  Result:=True;
end;

Function FileToUse(folder:string; xfile:string):String;
var
   x : String;
begin
  x:=StringReplace(ExtractFilePath(Application.ExeName),'bin',folder,[rfIgnoreCase]) + xfile;
  if FileExists(x) then
  Result:= x else Result:='';
end;

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
               Result := Trim(copy(ParamStr(i), Length(Key) + 2, Length(ParamStr(i))-Length(Key)-1));
               Break;
           end;
       end
   end
   else
       Result := Deflt;
end;

procedure IniciaTransaccion(data:TIBDataSet);
Begin
  if Not data.Transaction.InTransaction then
  data.Transaction.StartTransaction;
end;

procedure GuardarIbDataset(data:TIBDataSet);
begin
  Data.ApplyUpdates;
  try
    data.Transaction.Commit;
  except
  Data.Transaction.Rollback;
  end;
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

Function PrecioEnLetra(precio : Real;DataSet : TIBQuery):Real;
var
  x : Integer;
  strValor : String;
begin
{  StrValor:='';
  for x:=1 to Length(strcodigo) do
  begin
    if DataSet.Locate('codigo', strCodigo[x],[]) then
    StrValor:=StrValor + Dataset.Fieldbyname('valor').AsString
    else
    begin
      MessageDlg('Letra -'+strCodigo[x]+'- no es válida, verifique ', mtInformation, [mbOK], 0);
      strvalor:='';
      Break;
    end;
  end;
  if StrValor <> '' then
  result:=StrToFloat(StrValor); }
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

Function  CtaExiste(cuenta1:String;cuenta2:String;cuenta3:String;Error:Boolean):Boolean;
var
  sqlQuery : TIBQuery;
begin
  sqlQuery:=TIBQuery.Create(Nil);
  //sqlQuery.Database.DatabaseName := dmCon.IBDatabase1.DatabaseName;
  sqlQuery.Database:= dmconectar.IBDatabase1;
  sqlQuery.Sql.Clear;
  sqlQuery.Sql.Text :='Select nombre_cta '+
  ' From catalogo '+
  ' Where cuenta1 = :cuenta1 '+
  ' And cuenta2   = :cuenta2 '+
  ' And cuenta3   = :cuenta3 ';
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
  sqlQuery.Database:= dmConectar.IBDatabase1;
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
    dmControl.qryControlDet.params[0].value := sistema;
    dmControl.qryControlDet.params[1].value := subsistema;
    dmControl.qryControlDet.params[2].value := ciakey;
    dmControl.qryControlDet.open;
    if dmControl.qryControlDet.Locate('FECHA_ACT',ExtraerFecha(fecha),[]) then
    begin
      Messagedlg('Dia posteado, verifique',mtError,[mbok],0);
      Result := false;
      Inc(GlbContError);
    end else Result := true;
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
  dmVentas.qryitbi.Close;
  dmVentas.qryitbi.Params[0].Value:=ExtraerFecha(Fecha);
  dmVentas.qryitbi.Open;
  Result:=dmVentas.qryitbiPORCIENTO.Value;
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


Function VerificaCierreDia(Sistema:Integer;SubSistema:Integer;
                            CiaKey:Integer;Fecha:TDateTime; Var FechaAct:TDatetime):Boolean;
var
  sqlQuery : TIBSQL;
  tFecha :TDatetime;
begin
  sqlQuery:=TIBSQL.Create(Nil);
  if not  dmConectar.IBTransaction1.Active then
  dmConectar.IBTransaction1.Active:=true;
  sqlQuery.Transaction:=dmConectar.IBTransaction1;
  sqlQuery.Database:= dmConectar.IBDatabase1;
  sqlQuery.Sql.Clear;
  sqlQuery.Sql.Text :='Select sistema, fecha_Act, status  '+
  ' From control '+
  ' where sistema = :sistema '+
  ' and sub_sistema = :subsistema '+
  ' and cod_cia = :ciakey';
  sqlQuery.Params[0].AsInteger := sistema;
  sqlQuery.Params[1].AsInteger := subsistema;
  sqlQuery.Params[2].AsInteger := ciakey;
  sqlQuery.prepare;
  sqlQuery.ExecQuery;
  sqlQuery.CheckOpen;  
  if sqlQuery.Open then
  begin
  if sqlQuery.RecordCount = 1 then
  begin
      tfecha:=sqlquery.fieldbyname('fecha_Act').Value;
    FechaAct:=sqlquery.fieldbyname('fecha_Act').Value;
    if (fecha > tFecha) then Result := True else Result:=False;
  end else
  begin
    ShowMessage(IntToStr(sistema)+' sistema no encontrado en tabla control, verifique');
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

//Long1 = 0 para copiar desde el Inicio
//Long2 = indica cuantos caracteres se copiaran
{Function  MyStrCopy(Fuente:String;Long1:Integer;Long2:Integer):String;
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
end;}
Function  MyStrCopy(Fuente:String;Desde:Integer;Hasta:Integer):String;
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


function CalCHora(horai, horaf: TDatetime): Integer;
var
    hora1, min1, sec1,mil1 :word;
    hora2, min2, sec2,mil2 :word;
    YearI, MonthI, DayI,
    Year1, Month1, Day1:word;
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
  DecodeDate(Horai, YearI, MonthI, DayI);
  DecodeDate(horaf, Year1, Month1, Day1);
    if (MonthI = 12) and (Month1 = 1) then
        Result := 24 - hora1+ hora2
    else if Month1 > MonthI then
    Result := 24 - hora1 + hora2
    else if (hora2 <= 12)  and (day1 > dayI) then
    Result := 24 - hora1 + hora2
    else if ( Day1 = DayI ) then
    Result := hora2 - hora1 else
    Result := 24 - hora1 + hora2;
end;

Function FRangoFechaNomina(Fecha : TDatetime; Var FechaNom:TDatetime):String;
var
  Ano, Mes, Dia : Word;
  StrFechaIni, StrFechaFin : String;
begin
  dmControl.qryControl.Close;
  dmControl.qryControl.Open;
  if dmControl.qryControl.Locate('SISTEMA;SUB_SISTEMA;COD_CIA',
                          VarArrayOf([5,1,GlbCodigoCia]),[]) then
  begin
    Fecha:=ExtraerFecha(dmControl.qryControlFECHA_ACT.Value)+15;
    FechaNom:=Fecha;
    DecodeDate(dmControl.qryControlFECHA_ACT.Value, Ano, Mes, Dia);
    StrFechaIni := 'Del '+FormatDateTime('dd', dmControl.qryControlFECHA_ACT.Value + 1);
    DecodeDate(Fecha, Ano, Mes, Dia);
    StrFechaFin := FormatDateTime('dd', Fecha) + ' '+
    NombreMesCorto[StrToInt(FormatDateTime('mm', Fecha))]+', '+
                                           FormatDateTime('YYYY', Fecha);
    Result:=StrFechaIni + ' al ' + StrFechaFin;
  end;
end;

Procedure ProcFechaIniComNomina(Var xFechaIni: TDatetime);
var
  Ano, Mes, Dia : Word;
  StrFechaIni, StrFechaFin : String;
begin
  dmControl.qryControl.Close;
  dmControl.qryControl.Open;
  if dmControl.qryControl.Locate('SISTEMA;SUB_SISTEMA;COD_CIA',
                          VarArrayOf([5,1,GlbCodigoCia]),[]) then
  begin
    xFechaIni:=ExtraerFecha(dmControl.qryControlFECHA_ACT.Value)+1;
  end;
end;

Function sqlConsulta(tabla:string;campo:string;condicion:string;valor:String): Boolean;
var
  qry : TIBSQL;
begin
  qry := TIBSQL.create(nil);
  qry.Database:= dmConectar.IBDatabase1;
  qry.sql.Clear;
  qry.SQL.Text :='Select '+campo+' from '+tabla+' where '+campo+' '+condicion+' '+chr(39)+valor+chr(39);
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

Function FsqlMaxNumero(tabla:string;campo:string): Integer;
var
  qryMax : TIBQuery;
begin
  qryMax := TIBQuery.create(nil);
  qryMax.Database:= dmConectar.IBDatabase1;
  qryMax.Sql.Clear;
  qryMax.SQL.Text:='Select max('+campo+') NumMax'+' from '+tabla;
  qryMax.open;
  Result := qryMax.fieldbyname('NumMax').AsInteger + 1;
  qryMax.Close;
  qryMax.free;
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
  vUserName   := strUserName;
  strUserName := vUserName;
  dateCurr:=FormatDatetime('yyyy-mm-dd', Date);
  GlbMontoInteresMoraPgdo := 0;
  GlbDescNCF := '';
  GlbImpReciboSinPreg:=0;
  //GlbNoGeneraNCF := False;
end.


