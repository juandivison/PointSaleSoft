program PruebasJson;
{$APPTYPE CONSOLE}
uses SysUtils, UEcfResultadoNormalJson;
var J,E,M,T,N:string; C:Integer;
procedure Check(B:Boolean;const S:string);
begin if not B then raise Exception.Create(S);Inc(C);WriteLn('PASS ',S);end;
begin
 try
  J:='{"Estado":"ACEPTADO","TrackId":"QA-TRACK","Encf":"E320000000803","SecuenciaUtilizada":false,"Mensaje":"OK","Error":""}';
  Check(LeerResultadoNormalJson(J,E,M,T,N)and(T='QA-TRACK'),'PrintFinal seis campos');
  Check(LeerResultadoNormalJson('[LOG] inicio'+#13#10+J+#13#10+'fin',E,M,T,N),'log alrededor del DTO');
  Check(LeerResultadoNormalJson(StringReplace(J,'QA-TRACK','',[]),E,M,T,N)and(T=''),'RFCE sin TrackId');
  Check(not LeerResultadoNormalJson('ACEPTADO E320000000803',E,M,T,N),'texto libre');
  Check(not LeerResultadoNormalJson(Copy(J,1,Length(J)-1),E,M,T,N),'truncado');
  Check(not LeerResultadoNormalJson(J+#13#10+J,E,M,T,N),'DTO duplicado');
  Check(not LeerResultadoNormalJson(J+J,E,M,T,N),'concatenado');
  Check(not LeerResultadoNormalJson(StringReplace(J,'"Estado":"ACEPTADO"','"Estado":"ACEPTADO","Estado":"RECHAZADO"',[]),E,M,T,N),'clave duplicada');
  Check(not LeerResultadoNormalJson(StringReplace(J,'"Error":""','"Error":"ERROR"',[]),E,M,T,N),'aceptado con error');
  Check(not LeerResultadoNormalJson(StringReplace(J,'"Mensaje":"OK"','"Mensaje":null',[]),E,M,T,N),'null');
  Check(not LeerResultadoNormalJson(StringReplace(J,'"SecuenciaUtilizada":false','"SecuenciaUtilizada":"false"',[]),E,M,T,N),'booleano como texto');
  Check(not LeerResultadoNormalJson(StringReplace(J,'"Mensaje":"OK"','"Mensaje":{"Estado":"ACEPTADO"}',[]),E,M,T,N),'objeto anidado');
  Check(not LeerResultadoNormalJson(StringReplace(J,'"Mensaje":"OK"','"Mensaje":"\q"',[]),E,M,T,N),'escape invalido');
  Check(LeerResultadoNormalJson(StringReplace(J,'"Mensaje":"OK"','"Mensaje":"caf\u00e9 \"OK\""',[]),E,M,T,N)and(Pos('OK',M)>0),'Unicode y comillas escapadas');
  Check(not LeerResultadoNormalJson(StringReplace(J,'"Estado":"ACEPTADO"','"Estado":"NO ACEPTADO"',[]),E,M,T,N),'no aceptado');
  Check(LeerResultadoNormalJson(StringReplace(J,'"Estado":"ACEPTADO"','"Estado":"RECHAZADO"',[]),E,M,T,N)and(E='RECHAZADO'),'rechazado estructurado');
  Check(not LeerResultadoNormalJson(StringReplace(J,'E320000000803','E320000000803X',[]),E,M,T,N),'eNCF invalido');
  Check((E='')and(M='')and(T='')and(N=''),'fallo limpia salidas');
  WriteLn('JSON_NORMAL=PASS; CHECKS=',C,'; HTTP=0; DB=0');
 except on Ex:Exception do begin WriteLn('FAIL ',Ex.Message);Halt(1);end;end;
end.
