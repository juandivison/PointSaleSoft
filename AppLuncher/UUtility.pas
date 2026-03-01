unit UUtility;

interface
 Uses Sysutils, windows, Dialogs, Controls,Printers,Classes,
 shlobj, Variants, Graphics, IniFiles;

   function GetFileTimes(FileName : string;
 var Created : TDateTime;
 var Modified : TDateTime;
 var Accessed : TDateTime) : boolean;

 function GetCommandParam(const Key:string; Deflt:string=''):string;
 
implementation

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

// ================================================================
// Return the three dates (Created,Modified,Accessed)
// of a given filename. Returns FALSE if file cannot
// be found or permissions denied. Results are returned
// in TdateTime VAR parameters
// ================================================================
// ================================================================
// Devuelve las tres fechas (Creación, modificación y último acceso)
// de un fichero que se pasa como parámetro.
// Devuelve FALSO si el fichero no se ha podido acceder, sea porque
// no existe o porque no se tienen permisos. Las fechas se devuelven
// en tres parámetros de ipo DateTime
// ================================================================
function GetFileTimes(FileName : string;
 var Created : TDateTime;
 var Modified : TDateTime;
 var Accessed : TDateTime) : boolean;
var
 FileHandle : integer;
 Retvar : boolean;
 FTimeC,FTimeA,FTimeM : TFileTime;
 LTime : TFileTime;
 STime : TSystemTime;
begin
 // Abrir el fichero
 FileHandle := FileOpen(FileName,fmShareDenyNone);
 // inicializar
 Created := 0.0;
 Modified := 0.0;
 Accessed := 0.0;

 // Ha tenido acceso al fichero?
 if FileHandle < 0 then
 RetVar := false
 else begin
 // Obtener las fechas
 RetVar := true;
 GetFileTime(FileHandle,@FTimeC,@FTimeA,@FTimeM);
 // Cerrar
 FileClose(FileHandle);
 // Creado
 FileTimeToLocalFileTime(FTimeC,LTime);
 if FileTimeToSystemTime(LTime,STime) then begin
 Created := EncodeDate(STime.wYear,STime.wMonth,STime.wDay);
 Created := Created + EncodeTime(STime.wHour,STime.wMinute,STime.wSecond,
  STime.wMilliSeconds);
 end;

 // Accedido
 FileTimeToLocalFileTime(FTimeA,LTime);
 if FileTimeToSystemTime(LTime,STime) then begin
 Accessed := EncodeDate(STime.wYear,STime.wMonth,STime.wDay);
 Accessed := Accessed + EncodeTime(STime.wHour,STime.wMinute,STime.wSecond,
  STime.wMilliSeconds);
 end;

 // Modificado
 FileTimeToLocalFileTime(FTimeM,LTime);
 if FileTimeToSystemTime(LTime,STime) then begin
 Modified := EncodeDate(STime.wYear,STime.wMonth,STime.wDay);
 Modified := Modified + EncodeTime(STime.wHour,STime.wMinute,STime.wSecond,
  STime.wMilliSeconds);
 end;
 end;

 Result := RetVar;
end;

end.
 