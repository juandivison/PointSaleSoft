unit UParamDisplay;

interface
 Uses Sysutils, windows, Controls,Classes,
 Variants, StdCtrls;


 var


    paramDisplaySaludo : String;

    outputChar : array of string;
    procedure showDisplaySaludo(s:string);
    function DisplayConvertoChr(v : string):string;


implementation
    function DisplayConvertoChr(v : string):string;
    var
       x : string;
       idx : integer;
    begin
      x:='';
      for idx:=1 to Length(v) do
      begin
        x:=x + IntToStr(ord(v[idx]));
        if (idx < Length(v)) then
        x:=x + '|';
      end;
      result := x;
    end;


    procedure showDisplaySaludo(s : string);
    var
      F2: TextFile;
    BEGIN
      AssignFile(F2, 'COM1');
      Rewrite(F2);
      Write(F2, '                    ');
      Write(F2, '                    ');
      Write(F2, '                    ');
      Write(F2, '     FELICIDADES    ');
      Write(F2, '                    ');      

      CloseFile(F2);
    END;

{
    procedure showDisplaySaludo(s : string);
    var
      F2: TextFile;
      Ch: Char;
       x: integer;
       t: string;
       idx: integer;
    begin
      AssignFile(F2, 'COM1');
      Rewrite(F2);
      SetLength(outputChar, length(s) );
      t:='';
      idx:=0;
      for x:=1 to length(s) do
      begin
        if (x < length(s)) then
        begin
          if (s[x] <> '|') then
          begin
             t:=t + s[x];
          end else
          begin
            idx:=idx +1;
            outputChar[idx]:= t;
            t:='';
          end;
        end;
      end;
      for x:=1 to length(s) do
      Write(F2, chr(strToInt(outputChar[x])));
      CloseFile(F2);
    end;}
begin

end.
