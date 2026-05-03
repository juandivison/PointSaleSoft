program RRHH_App;

uses
  Forms,
  UDataModule in 'UDataModule.pas' {DataModule1: TDataModule},
  UFichaCandidato in 'UFichaCandidato.pas' {frmFichaCandidato},
  UControlEntrevistas in 'UControlEntrevistas.pas' {frmControlEntrevistas},
  UVisorHistorial in 'UVisorHistorial.pas' {frmVisorHistorial},
  UAccionPersonalWizard in 'UAccionPersonalWizard.pas' {frmAccionPersonalWizard},
  UGestionPermisos in 'UGestionPermisos.pas' {frmGestionPermisos},
  UMenuPrincipal in 'UMenuPrincipal.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TfrmGestionPermisos, frmGestionPermisos);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
