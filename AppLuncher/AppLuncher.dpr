program AppLuncher;

uses
  Forms,
  UMainMenu in 'UMainMenu.pas' {frmMenu},
  UUtility in 'UUtility.pas',
  CmdLineHelper in 'CmdLineHelper.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'App Lunch';
  Application.CreateForm(TfrmMenu, frmMenu);
  Application.Run;
end.
