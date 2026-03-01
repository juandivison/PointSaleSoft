unit UTiles;
uses
  ShellApi;

procedure ShellFileOperation(fromFile: string; toFile: string; Flags: Integer);
var
  shellinfo: TSHFileOpStructA;
begin
  with shellinfo do
  begin
    wnd   := Application.Handle;
    wFunc := Flags;
    pFrom := PChar(fromFile);
    pTo   := PChar(toFile);
  end;
  SHFileOperation(shellinfo);
end;


// Example, Beispiel:

procedure TForm1.Button1Click(Sender: TObject);
begin
  ShellFileOperation('c:\afile.txt', 'd:\afile2.txt', FO_COPY);
  // To Move a file: FO_MOVE
end;
