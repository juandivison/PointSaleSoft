program Fixture;
{$APPTYPE CONSOLE}
uses SysUtils, Classes;
var L:TStringList;
begin
  if FileExists(ExtractFilePath(ParamStr(0))+'stdout.txt') then begin
    L:=TStringList.Create;try L.LoadFromFile(ExtractFilePath(ParamStr(0))+'stdout.txt');Write(L.Text);finally L.Free;end;Halt(0);
  end;
  WriteLn('D7T|Ab+/12%7CE310000000803%7C21-11-2026 02:35:00%7C1180.00%7CurlImage=https://ecf.dgii.gov.do/testecf/consultatimbre?RncEmisor=999999999&ENCF=E310000000803&MontoTotal=1180.00&CodigoSeguridad=Ab%2B%2F12');
  if FileExists(ExtractFilePath(ParamStr(0))+'persist-fail.flag')then
    WriteLn('D7|ACEPTADO|QA_FAIL|QA-NO-HTTP|E310000000803')
  else WriteLn('D7|ACEPTADO|OK|QA-NO-HTTP|E310000000803');
end.
