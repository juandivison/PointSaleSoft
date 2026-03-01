unit UtilEncrypt;

interface


type
Tscramble=array[1..30] of integer;

TSecretRecord = record
pwd:Tscramble
// etc other fields not all need to be scrambled
end;
implementation
var
Secret:TSecretRecord;
SecretFile: file of TSecretRecord;

function scramble(ClearText:string):Tscramble;
var i:integer;
begin
  ClearText:=ClearText+#0;
  for i:=1 to 30 do
      result[i]:=ord(ClearText[i]) xor i;
end;

function unscramble(input:Tscramble):string;
var i:integer;
begin
  result:='';
  for i:=1 to 30 do
  begin
    if ord(input[i]) xor i=0 then break;
    result:=result+chr(ord(input[i]) xor i);
  end;
end;

begin
  //t assignfile(SecretFile,'passwords.md5');
  // not really md5 but puts the curious off

  // save secrets to disk
  //t secret.pwd:=scramble('Password123');
  //t write(SecretFile,Secret);

  // read secrets back off disk
  //t read(secretfile,secret);
  //Use in this way :
  //showmessage('Password is '+unscramble(secret.pwd));

end.
