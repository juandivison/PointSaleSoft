unit UUtilecf;
interface
uses Windows;
function ExecAndCapture(const ACmdLine,AWorkDir:string;
 out AOutput:string;out AExitCode:DWORD;ATimeoutMS:DWORD=600000):Boolean;
implementation
function ExecAndCapture(const ACmdLine,AWorkDir:string;
 out AOutput:string;out AExitCode:DWORD;ATimeoutMS:DWORD):Boolean;
begin AOutput:='Legacy CLI disabled in this QA executable';AExitCode:=1;Result:=False;end;
end.
