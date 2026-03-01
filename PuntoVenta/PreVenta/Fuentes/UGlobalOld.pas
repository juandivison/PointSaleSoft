unit UGlobal;

interface
 Uses Forms,Dbtables, db, Sysutils, windows, Dialogs, Controls,Printers,Classes,
 IBCustomDataSet, IBQuery;
 var
    strUserName : String;
    strUsuarioID: String;
    strAppPath  : String;
    DateCurr    : string;
    Size        : DWord;
    StatusGlb   : String = 'A';
    GlbLetrero  : String;
    GlbFechaInicial : TDatetime;
    glbFechaFinal   : TDatetime;

    GlbError: Boolean;
    glbMoneda       : Smallint;
    GlbNumero       : Integer;
    CodServicioGlb  : Integer;

    FechaIniGlb : TDate;
    FechaFinGlb : TDate;
    HoraIniGlb  : TTime;
    HoraFinGlb  : TTime;

    GlbFechaTrnDiaria:TDatetime;


    procedure SizePapelPrinter;
    function  InsertarComa(fuente:string):String;
    Function  MyStrCopy(Fuente:String;Long1:Integer;Long2:Integer):String;
    //Procedure PAbrirtablaMoneda(Ultimo:Boolean;CodigoM:String;PorSerie:Boolean;SerieX:Integer);
    function  IdiomadeWindows:string;
    FuncTion  DiasEnElMes(anio : Integer; Mes : Integer) : Smallint;
    Function  ExtraerFecha(Fecha : TDatetime) : TDatetime;
    Function  ExtraerHora(Hora: TDateTime) : TDatetime;
    Function  FsqlMaxNumero(tabla:string;campo:string): Integer;
    Function  sqlConsulta(tabla:string;campo:string;condicion:string;valor:String): Boolean;
    Function  CalCHora(horai : TDatetime;horaf : TDatetime):Integer;
    Function  FGlbPorcItbi(fecha:TDateTime):Real;

implementation

uses UDatModConectar, UDatosVentas;

Function  FGlbPorcItbi(Fecha:TDateTime):Real;
begin
  dmVentas.qryitbi.Close;
  dmVentas.qryitbi.Params[0].Value:=ExtraerFecha(Fecha);
  dmVentas.qryitbi.Open;
  Result:=dmVentas.qryitbiPORCIENTO.Value;
end;

//Inserta una coma EJE.: 5450426 = 5,450,426
Function InsertarComa(fuente:String):String;
 var
   ContC,x,y,z  : Integer;
   Auxi         : String;
   Inicia       : Boolean;
   ControlaSigno: string;
begin
  y:=-1;
  z:=0;
  ContC:=0;
  Fuente:=Trim(Fuente);
  z:=Length(Fuente);
  if z <= 6 then
  begin
    Result:= Fuente;
    Exit;
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


FuncTion DiasEnElMes(anio : Integer; Mes : Integer):Smallint;
var
  a : string;
begin
  Result := MonthDays[IsLeapYear(anio), mes];
  a:='string';
end;

function CalCHora(horai, horaf: TDatetime): Integer;
var
    hora1, min1, sec1,mil1 :word;
    hora2, min2, sec2,mil2 :word;
    Year, Month, Day,
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
end;


Function sqlConsulta(tabla:string;campo:string;condicion:string;valor:String): Boolean;
var
  qry : TQUERY;
begin
  qry := Tquery.create(nil);
  qry.DatabaseName:=dmCon.IBDatabase1.DatabaseName;
  qry.sql.Clear;
  qry.SQL.Text :='Select '+campo+' from '+tabla+' where '+campo+' '+condicion+' '+chr(39)+valor+chr(39);
  qry.open;
  If qry.RecordCount > 0 then
  Result := true
  else Result := False;
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
  qryMax.Database:=dmCon.IBDatabase1;
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
  Size := 128;
  SetLength ( strUsername, Size);
  GetUserName (Pchar(strUserName),size);
  dateCurr:=FormatDatetime(ShortDateFormat,date);
end.


