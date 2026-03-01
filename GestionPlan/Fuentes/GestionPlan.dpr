program GestionPlan;

uses
  Forms,
  UMenuPrincipal in 'UMenuPrincipal.pas' {frmMenuPrincipal},
  UDatosVentas in 'UDatosVentas.pas' {dmVentas: TDataModule},
  UDatModInventario in 'UDatModInventario.pas' {dmInventario: TDataModule},
  UGlobal in 'UGlobal.pas',
  UDatModCxc in 'UDatModCxc.pas' {dmCxc: TDataModule},
  UDatModIngresos in 'UDatModIngresos.pas' {dmIngresos: TDataModule},
  UDatModFactura in 'UDatModFactura.pas' {dmFactura: TDataModule},
  UPresentacion in 'UPresentacion.pas' {frmPresentacion},
  UDatModClientes in 'UDatModClientes.pas' {dmClientes: TDataModule},
  UDatModCompania in 'UDatModCompania.pas' {dmCompania: TDataModule},
  UDatModControl in 'UDatModControl.pas' {dmControl: TDataModule},
  UAcercaDe in 'UAcercaDe.pas' {AboutBox},
  UDatModBalanceCxc in 'UDatModBalanceCxc.pas' {dmBalanceCxc: TDataModule},
  uLogin in 'uLogin.pas' {frmLogin},
  UDatModEmpleados in 'UDatModEmpleados.pas' {dmEmpleados: TDataModule},
  UDatModDespacho in 'UDatModDespacho.pas' {dmDespacho: TDataModule},
  UDatModRuta in 'UDatModRuta.pas' {dmRutas: TDataModule},
  UDatModCuadrexRuta in 'UDatModCuadrexRuta.pas' {dmCuadrexRuta: TDataModule},
  UGlobalCp in '..\..\..\Comun\UGlobalCp.pas',
  UDatModCostos in 'UDatModCostos.pas' {dmCostos: TDataModule},
  UDatModPrestamo in 'UDatModPrestamo.pas' {dmPrestamo: TDataModule},
  UControlAct in '..\..\..\Comun\UControlAct.pas' {frmControlSistema},
  UDatModConectar in 'UDatModConectar.pas' {dmConectar: TDataModule},
  UDatModITBIS in 'UDatModITBIS.pas' {dmItbis: TDataModule},
  UConectar in 'UConectar.pas' {frmInciaConeccion},
  UDatmodDatosGenerales in 'UDatmodDatosGenerales.pas' {dmDatos: TDataModule},
  UDatModPagoTarjeta in 'UDatModPagoTarjeta.pas' {dmPagosTarjeta: TDataModule},
  UDatModProveedor in 'UDatModProveedor.pas' {dmProveedor: TDataModule},
  UDatModCxp in 'UDatModCxp.pas' {dmCxp: TDataModule},
  UConfigRep in 'UConfigRep.pas' {frmConfReporte},
  DSim in 'DSim.pas',
  UFormRegPlan in 'UFormRegPlan.pas' {frmProcPlanFunerario},
  UTarifaPlan in 'UTarifaPlan.pas' {frmTarifaPlan},
  UFormTipoPlan in 'UFormTipoPlan.pas' {frmTipoPlan},
  UFormGeneraFactPlan in 'UFormGeneraFactPlan.pas' {frmGeneraFactPlan},
  UFactServicio in 'bck\UFactServicio.pas' {qckFactServicio: TQuickRep},
  UBuscarClientesPersonasP in '..\..\PuntoVenta\Fuentes\UBuscarClientesPersonasP.pas' {FrmBuscarClientesPersonas},
  UCobrarFacturas in '..\..\PuntoVenta\Fuentes\UCobrarFacturas.pas' {frmCobrarFacturas},
  UMaestroClientes in '..\..\PuntoVenta\Fuentes\UMaestroClientes.pas' {frmClientes},
  UDatModReportes in '..\..\PuntoVenta\Reportes\UDatModReportes.pas' {dmReportes: TDataModule},
  URepClientes in '..\..\PuntoVenta\Reportes\URepClientes.pas' {qckRepClientes: TQuickRep},
  UDatModUsuarios in '..\..\PuntoVenta\Fuentes\UDatModUsuarios.pas' {dmUsuarios: TDataModule},
  URepReciboAbonoCXC in '..\..\PuntoVenta\Fuentes\URepReciboAbonoCXC.pas' {qckReciboAbonoCXC: TQuickRep},
  UBalanceClientesPlanf in 'UBalanceClientesPlanf.pas' {frmBalanceCtesPF},
  URepFactPendCxc in '..\..\PuntoVenta\Fuentes\URepFactPendCxc.pas' {qckFactPendCxc: TQuickRep},
  URepPlanesCte in 'URepPlanesCte.pas' {qckPlanesXCliente: TQuickRep},
  URepFacturaPuntoVenta in 'URepFacturaPuntoVenta.pas' {qckRepFactPuntoVenta: TQuickRep},
  URepComisionesVPlan in 'URepComisionesVPlan.pas' {qryRepComisionPlanF: TQuickRep},
  UFormVendedores in 'UFormVendedores.pas' {frmVendedores},
  UFormSelFecha in '..\..\PuntoVenta\Fuentes\UFormSelFecha.pas' {frmSelFecha},
  UfrmRelacionFact in '..\..\PuntoVenta\Fuentes\UfrmRelacionFact.pas' {frmRelacionFact},
  URepQckRelacionFactCxc in '..\..\PuntoVenta\Fuentes\URepQckRelacionFactCxc.pas' {qckRepRelacionFactCxc: TQuickRep},
  UFormSaldAntCxc in '..\..\PuntoVenta\Fuentes\UFormSaldAntCxc.pas' {frmConsultaAntCxc},
  URepSaldoXAntCxc in '..\..\PuntoVenta\Fuentes\URepSaldoXAntCxc.pas' {qckRepSaldoXAntCxc: TQuickRep},
  URepSaldoAntCxcRes in '..\..\PuntoVenta\Fuentes\URepSaldoAntCxcRes.pas' {qckRepSaldoXantCxcRes: TQuickRep};

{$R *.res}

begin
  Application.Initialize;
  frmPresentacion:=TfrmPresentacion.Create(nil);
  frmPresentacion.Show;
  frmPresentacion.Update;
  Application.HelpFile := '';
  Application.Title := 'Gestion Plan';
  Application.CreateForm(TdmConectar, dmConectar);
  Application.CreateForm(TdmUsuarios, dmUsuarios);
  Application.CreateForm(TdmControl, dmControl);
  Application.CreateForm(TdmCompania, dmCompania);
  Application.CreateForm(TdmEmpleados, dmEmpleados);
  Application.CreateForm(TdmInventario, dmInventario);
  Application.CreateForm(TdmCxc, dmCxc);
  Application.CreateForm(TdmIngresos, dmIngresos);
  Application.CreateForm(TdmFactura, dmFactura);
  Application.CreateForm(TdmClientes, dmClientes);
  Application.CreateForm(TdmVentas, dmVentas);
  Application.CreateForm(TdmBalanceCxc, dmBalanceCxc);
  Application.CreateForm(TdmDespacho, dmDespacho);
  Application.CreateForm(TdmRutas, dmRutas);
  Application.CreateForm(TdmCuadrexRuta, dmCuadrexRuta);
  Application.CreateForm(TdmCostos, dmCostos);
  Application.CreateForm(TdmCxp, dmCxp);
  Application.CreateForm(TdmPrestamo, dmPrestamo);
  Application.CreateForm(TdmItbis, dmItbis);
  Application.CreateForm(TdmDatos, dmDatos);
  Application.CreateForm(TdmPagosTarjeta, dmPagosTarjeta);
  Application.CreateForm(TdmProveedor, dmProveedor);
  Application.CreateForm(TdmReportes, dmReportes);
  Application.CreateForm(TfrmMenuPrincipal, frmMenuPrincipal);
  frmPresentacion.Close;
  frmPresentacion.Free;
  frmPresentacion:=Nil;
  Application.Run;
end.


