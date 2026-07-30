program PCargarTablaRNCDGII;

uses
  Forms,
  CargarTablaRNCDGII in 'CargarTablaRNCDGII.pas' {frmMain};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Import RNC DGII Oficial';
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
