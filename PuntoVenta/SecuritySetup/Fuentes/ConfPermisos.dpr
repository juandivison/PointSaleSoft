program ConfPermisos;
uses
  Forms,
  frmMenuprincipal in 'frmMenuprincipal.pas' {frmMenu},
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
  UDatModOficina in 'UDatModOficina.pas' {dmOficina: TDataModule},
  UFormSecprocesos in 'UFormSecprocesos.pas' {frmProcesos},
  UFormPermisos in 'UFormPermisos.pas' {frmPermisos},
  UFormTareas in 'UFormTareas.pas' {frmTarea},
  UFormroles in 'UFormroles.pas' {frmRoles},
  UFormDatosTareaxProceso in 'UFormDatosTareaxProceso.pas' {frmSelTareaProceso},
  UFormAsignarPermisoUsuarios in 'UFormAsignarPermisoUsuarios.pas' {frmPermisousuarios},
  UfrmBuscarusuario in 'UfrmBuscarusuario.pas' {frmBuscarusuario},
  UFormActualizaPermisos in 'UFormActualizaPermisos.pas' {frmAsignarPermisos},
  UDatmodPermisos in 'UDatmodPermisos.pas' {dmpermisos: TDataModule},
  CheckPrevious in 'CheckPrevious.pas',
  UFormAsignarRolaUsuarios in 'UFormAsignarRolaUsuarios.pas' {frmAsignarRol},
  UFormBuscarRoles in 'UFormBuscarRoles.pas' {frmBuscarRol},
  UEntradaDeUsuarios in 'UEntradaDeUsuarios.pas' {frmEntradaUsuarios};

{$R *.res}

begin
  if not CheckPrevious.RestoreIfRunning(Application.Handle, 1) then
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
 end;
end.
