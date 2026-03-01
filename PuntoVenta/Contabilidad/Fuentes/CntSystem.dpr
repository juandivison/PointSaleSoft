program CntSystem;

uses
  Forms,
  UMenuPrincipal in 'UMenuPrincipal.pas' {frmMenu},
  UConectar in 'UConectar.pas' {frmInciaConeccion},
  uLogin in 'uLogin.pas' {frmLogin},
  UGlobal in 'UGlobal.pas',
  UDatModCompania in 'UDatModCompania.pas' {dmCompania: TDataModule},
  UDatModControl in 'UDatModControl.pas' {dmControl: TDataModule},
  UGlobalCp in 'UGlobalCp.pas',
  UDatModBanco in 'UDatModBanco.pas' {dmBanco: TDataModule},
  UDatModUsuarios in 'UDatModUsuarios.pas' {dmUsuarios: TDataModule},
  UDatModClientes in 'UDatModClientes.pas' {dmClientes: TDataModule},
  URegistro in 'URegistro.pas' {frmTrgtr},
  UDatModConectar in 'UDatModConectar.pas' {dmCon: TDataModule},
  UEmpleados in 'UEmpleados.pas' {frmEmpleados},
  UDatModEmpleados in 'UDatModEmpleados.pas' {dmEmpleados: TDataModule},
  UEntradaDeUsuarios in 'UEntradaDeUsuarios.pas' {frmEntradaUsuarios},
  UCompania in 'UCompania.pas' {frmCompania},
  UDatModCatalogo in 'UDatModCatalogo.pas' {dmCatalogo: TDataModule},
  UDatModTransCnt in 'UDatModTransCnt.pas' {dmTransCnt: TDataModule},
  UTransaccionesCnt in 'UTransaccionesCnt.pas' {frmTransaccionesCnt},
  UPostearTransCnt in 'UPostearTransCnt.pas' {frmActBlcecta},
  UVerificaBlcdbcrtrncnt in 'UVerificaBlcdbcrtrncnt.pas' {frmVeriDbcrtrncnt},
  UControlAct in 'UControlAct.pas' {frmControlSistema},
  UCambiarClaveUsuario in 'UCambiarClaveUsuario.pas' {frmCambiarClaveUsuario},
  UBalanceMensual in 'UBalanceMensual.pas' {frmBceMensual},
  UCierremescnt in 'UCierremescnt.pas' {frmCierremescnt},
  UTransCierreAnioCnt in 'UTransCierreAnioCnt.pas' {frmTransCierreAnioCnt},
  UDatmodDatos in 'UDatmodDatos.pas' {dmDatos: TDataModule},
  UCierreAnio in 'UCierreAnio.pas' {frmCierreAnio},
  UCerrarperiodoFiscal in 'UCerrarperiodoFiscal.pas' {frmCerrarPFiscal},
  UFormBancos in 'UFormBancos.pas' {frmBancos},
  UDatModCheques in 'UDatModCheques.pas' {dmcks: TDataModule},
  UdatosParablcgrl in 'UdatosParablcgrl.pas' {frmDatosblcgrl},
  UDmRep in 'UDmRep.pas' {dtmodrep: TDataModule},
  URepbleGrl in 'URepbleGrl.pas' {qckBceGral: TQuickRep},
  UEstadoGyP in 'UEstadoGyP.pas' {frmEstadoGyP},
  URepEstadoGyP in 'URepEstadoGyP.pas' {qckEGyP: TQuickRep},
  UViewCtaCatalogo in 'UViewCtaCatalogo.pas' {frmViewCtaCatalogo},
  UFormMantDepositos in 'UFormMantDepositos.pas' {frmDepositos},
  UFormSelFecha in 'UFormSelFecha.pas' {frmSelFecha},
  UFormTipoDeposito in 'UFormTipoDeposito.pas' {frmTipoDeposito},
  URepDepositos in 'URepDepositos.pas' {qckRepDeposito: TQuickRep},
  UFormTipoCtaBanco in 'UFormTipoCtaBanco.pas' {frmTipoCtaBanco},
  UFormDepDesglose in 'UFormDepDesglose.pas' {frmDesgloseDeposito},
  UCatalogo in '..\..\..\Comun\UCatalogo.pas' {frmCatalogo},
  UFormaRepParaDos in 'UFormaRepParaDos.Pas' {frmRepParaDos},
  UMaryorGeneralConsRep in 'UMaryorGeneralConsRep.pas' {frmMayorGeneral},
  URepMayorGeneral in '..\Reportes\URepMayorGeneral.pas' {qckRepMayorGeneral: TQuickRep},
  URepMayorDetallado in '..\Reportes\URepMayorDetallado.pas' {qckRepMayorGDet: TQuickRep},
  URepTrnDiariaResCta in 'URepTrnDiariaResCta.pas' {qckRepTrnDiariaResCta: TQuickRep},
  URepTransCnt in '..\Reportes\URepTransCnt.pas' {qckRepTrnCnt: TQuickRep},
  URepValoresCatalogo in 'URepValoresCatalogo.pas' {qckCatConValores: TQuickRep},
  URepCuentasCatalogo in '..\Reportes\URepCuentasCatalogo.pas' {qckRepCtaCatalogo: TQuickRep},
  URepCtaCtrl in '..\Reportes\URepCtaCtrl.pas' {qckRepCtasCtrls: TQuickRep},
  URepBceDeComp in '..\Reportes\URepBceDeComp.pas' {qckBalancedeComp: TQuickRep},
  UBlcComp in 'UBlcComp.pas' {frmBlcComp},
  UBlcCompTransJM in '..\Reportes\UBlcCompTransJM.pas' {frmBlcCompTransJM},
  USelParamReports in '..\Reportes\USelParamReports.pas' {frmParamsReport};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Sistema Contabilidad';
  Application.CreateForm(TdmCon, dmCon);
  Application.CreateForm(TdmClientes, dmClientes);
  Application.CreateForm(TdmUsuarios, dmUsuarios);
  Application.CreateForm(TdmBanco, dmBanco);
  Application.CreateForm(TdmCompania, dmCompania);
  Application.CreateForm(TdmControl, dmControl);
  Application.CreateForm(TdmTransCnt, dmTransCnt);
  Application.CreateForm(TdmEmpleados, dmEmpleados);
  Application.CreateForm(TdmCatalogo, dmCatalogo);
  Application.CreateForm(TdmDatos, dmDatos);
  Application.CreateForm(Tdtmodrep, dtmodrep);
  Application.CreateForm(Tdmcks, dmcks);
  Application.CreateForm(TfrmMenu, frmMenu);
  Application.Run;
end.
