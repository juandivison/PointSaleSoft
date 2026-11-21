unit UEcfApiGastoPolitica;
interface
uses UEcfCanalConfig;
procedure ExigirAmbienteGastoIdesi(const C:TEcfCanalConfiguracion;const Ini:string);
implementation
uses SysUtils,IniFiles;
procedure ExigirAmbienteGastoIdesi(const C:TEcfCanalConfiguracion;const Ini:string);
var F:TIniFile;Permitido:Boolean;
begin
 if C.Canal<>ceIdesiApi then raise Exception.Create('El gasto requiere canal IDESI_API.');
 if C.Ambiente=aeTest then Exit;
 if (C.Ambiente<>aeProd) or (Trim(C.RncEmisor)='') then
  raise Exception.Create('Ambiente o emisor del gasto invalido.');
 Permitido:=False;
 if FileExists(Ini) then begin
  F:=TIniFile.Create(Ini);
  try Permitido:=F.ReadBool('ECF_IDESI_API_'+Trim(C.RncEmisor)+'_PROD',
   'EnableExpenseProduction',False);finally F.Free;end;
 end;
 if not Permitido then
  raise Exception.Create('Gastos IDESI API PROD no habilitados para este RNC.');
end;
end.
