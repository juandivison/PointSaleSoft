program GestorCnt;

uses
  Forms,
  UDistCntGestor in 'UDistCntGestor.pas' {frmPrepararDatosCnt};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrepararDatosCnt, frmPrepararDatosCnt);
  Application.Run;
end.
