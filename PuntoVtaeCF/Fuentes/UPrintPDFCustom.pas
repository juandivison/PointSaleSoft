unit UPrintPDFCustom;

interface
uses  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, StdCtrls, Buttons, Mask, RxToolEdit, Grids,
  ShellApi, WinSkinData, DBGrids, RxDBCtrl, IBQuery, IBSQL, RxCtrls,
  Registry,OleCtrls, AcroPDFLib_TLB;

  function Execute( psExeName:string):integer;
  procedure PrintUsingShell( psFileName :string);
  function FindShellPrintCmd(psExtension:string):string;
  function FindShellCmd(psExtension:string;psCmd:string): string;

  function FindShellOpenCmd(psExtension:string):string;

implementation

procedure PrintUsingShell( psFileName :string);
  var s : string;
      i : integer;
  begin
     if not FileExists(psFileName)
     then
        Exit;

     s := FindShellPrintCmd( ExtractFileExt(psFileName) );
     i := Pos('%1',s);
     if i > 0
     then begin
        System.Delete(s,i,2);
        System.Insert(psFileName,s,i);
        Execute(s);
     end;
  end;

  function FindShellCmd(psExtension:string;psCmd:string): string;
  var r : TRegistry;
      sName : string;
  begin
     psExtension := Trim(psExtension);
     if psExtension = ''
     then begin
        Result := '';
        Exit;
     end;

     psCmd := Trim(psCmd);
     if psCmd = ''
     then
        psCmd := 'OPEN'
     else
        psCmd := UpperCase(psCmd);

     if psExtension[1] <> '.'
     then
        psExtension := '.' + psExtension;

     r := TRegistry.Create(KEY_READ);
     try
        r.RootKey := HKEY_LOCAL_MACHINE;
        r.OpenKeyReadOnly('software\classes\' + psExtension);
        sName := r.ReadString('');
        r.CloseKey();

        r.OpenKeyReadOnly('software\classes\' + sName + '\Shell\' + psCmd + '\Command');
        Result := r.ReadString('');
        r.CloseKey();
     finally
        FreeAndNil(r);
     end;
  end;
  function FindShellOpenCmd(psExtension:string):string;
  begin
     Result := FindShellCmd(psExtension,'OPEN');
  end;

  function FindShellPrintCmd(psExtension:string):string;
  begin
     Result := FindShellCmd(psExtension,'PRINT');
  end;

  {$ifdef windows}
  function LocalExecute( psExeName:string ; wait:boolean ; how:word):word;
  var i : integer;
      prog,parm:string;
      msg:TMsg;
      rc : word;
  begin

     i := pos(psExeName,' ');
     if i = 0
     then begin
        prog := psExeName;
        parm := '';
     end
     else begin
        prog := copy( psExeName,1,i-1);
        parm := copy( psExeName,i+1,255);
     end;

     if pos(prog,'.') <> 0
     then
        prog := prog + '.exe';

     psExeName := prog + ' ' + parm + #0;

     rc := WinExec( @psExeName[1] , how );
     if wait
     then begin
        if (rc > 32)
        then begin
           repeat
              if PeekMessage(Msg,0,0,0,PM_REMOVE)
              then begin
                 TranslateMessage(Msg);
                 DispatchMessage(Msg);
              end;
           until (GetModuleUsage(rc) = 0)
        end;
     end;
  end;   { LocalExecute }
  {$endif}
  {$ifdef win32}
  function LocalExecute32(FileName:String; Wait:boolean; Visibility : integer;
                          lWaitFor:Cardinal=INFINITE):integer;
  var zAppName:array[0..512] of char;
      zCurDir:array[0..255] of char;
      WorkDir:String;
      StartupInfo:TStartupInfo;
      ProcessInfo:TProcessInformation;
  begin
     StrPCopy(zAppName,FileName);
     GetDir(0,WorkDir);
     StrPCopy(zCurDir,WorkDir);
     FillChar(StartupInfo,Sizeof(StartupInfo),#0);
     StartupInfo.cb := Sizeof(StartupInfo);
     StartupInfo.dwFlags := STARTF_USESHOWWINDOW;
     StartupInfo.wShowWindow := Visibility;
     if not CreateProcess(nil,
        zAppName,                      { pointer to command line string }
        nil,                           { pointer to process security attributes }
        nil,                           { pointer to thread security attributes }
        false,                         { handle inheritance flag }
        CREATE_NEW_CONSOLE or          { creation flags }
        NORMAL_PRIORITY_CLASS,
        nil,                           { pointer to new environment block }
        nil,                           { pointer to current directory name }
        StartupInfo,                   { pointer to STARTUPINFO }
        ProcessInfo)                   { pointer to PROCESS_INF }
     then Result := -1
     else begin
        if Wait
        then begin
           Result := WaitforSingleObject(ProcessInfo.hProcess,lWaitFor);
           GetExitCodeProcess(ProcessInfo.hProcess,LongWord(Result));
        end;
     end;
  end;
  {$endif}


  function Execute( psExeName:string):integer;
  begin
     {$ifdef windows} result := LocalExecute(psExeName, false , SW_SHOW);   {$endif}
     {$ifdef win32}   result := LocalExecute32(psExeName, false , SW_SHOW); {$endif}
  end;

end.
