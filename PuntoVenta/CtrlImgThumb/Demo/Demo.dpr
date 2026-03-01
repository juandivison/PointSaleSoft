program demo;

uses
  Forms,
  UnFrmMain in 'UnFrmMain.pas' {FrmMain},
  ImageZoom in '..\ImageZoom.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'TImagePlus Demo';
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
