program LoanProcess;



uses
  Forms,
  MenuPrincipalLoan in 'MenuPrincipalLoan.pas' {frmMenu},
  UDatModCon in 'UDatModCon.pas' {dmCon: TDataModule},
  UConectar in 'UConectar.pas' {frmInciaConeccion},
  UDatModCompania in 'UDatModCompania.pas' {dmCompania: TDataModule},
  UGlobal in 'UGlobal.pas',
  UDatModControl in 'UDatModControl.pas' {dmControl: TDataModule},
  UGlobalCp in 'UGlobalCp.pas',
  UDatModEmpleados in 'UDatModEmpleados.pas' {dmEmpleados: TDataModule},
  UDatModUsuarios in 'UDatModUsuarios.pas' {dmUsuarios: TDataModule},
  uLogin in 'uLogin.pas' {frmLogin},
  UFormEntreClave in 'UFormEntreClave.pas' {frmEntrreClave},
  UFormMantOficina in 'UFormMantOficina.pas' {frmOficina},
  UPresentacion in 'UPresentacion.pas' {frmPresentacion},
  UControlAct in 'UControlAct.pas' {frmControlSistema},
  UDatModOficina in 'UDatModOficina.pas' {dmOficina: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Setup Security - Configurar permisos';
  Application.CreateForm(TdmCon, dmCon);
  Application.CreateForm(TdmControl, dmControl);
  Application.CreateForm(TdmCompania, dmCompania);
  Application.CreateForm(TdmEmpleados, dmEmpleados);
  Application.CreateForm(TdmUsuarios, dmUsuarios);
  Application.CreateForm(TdmOficina, dmOficina);
  Application.CreateForm(TfrmMenu, frmMenu);
  Application.Run;
end.
