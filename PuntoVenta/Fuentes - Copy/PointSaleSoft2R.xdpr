program PointSaleSoft2R;

uses
  Forms,
  UMenuPrincipal in 'UMenuPrincipal.pas' {frmMenuPrincipal},
  UProcesarVentas in 'UProcesarVentas.pas' {frmProcesarVentas},
  UDatosVentas in 'UDatosVentas.pas' {dmVentas: TDataModule},
  UInventarioProd in 'UInventarioProd.pas' {frmInventarioProd},
  UDatModInventario in 'UDatModInventario.pas' {dmInventario: TDataModule},
  UGlobal in 'UGlobal.pas',
  UTipoInventario in 'UTipoInventario.pas' {frmTipoInventario},
  UInventarioHistorico in 'UInventarioHistorico.pas' {frmInventarioHist},
  UCambiarPrecios in 'UCambiarPrecios.pas' {frmCambiarPrecio},
  UDatModCxc in 'UDatModCxc.pas' {dmCxc: TDataModule},
  UDatModIngresos in 'UDatModIngresos.pas' {dmIngresos: TDataModule},
  URegFpago in 'URegFpago.pas' {frmFormaPago},
  UCtrlIngresos in 'UCtrlIngresos.pas' {frmIngresos},
  UDatModFactura in 'UDatModFactura.pas' {dmFactura: TDataModule},
  UPresentacion in 'UPresentacion.pas' {frmPresentacion},
  UBuscarProductoInvVenta in 'UBuscarProductoInvVenta.pas' {frmBuscarProdInv},
  UMaestroClientes in 'UMaestroClientes.pas' {frmClientes},
  UDatModClientes in 'UDatModClientes.pas' {dmClientes: TDataModule},
  URepClientes in '..\Reportes\URepClientes.pas' {qckRepClientes: TQuickRep},
  UDatModCompania in 'UDatModCompania.pas' {dmCompania: TDataModule},
  UDatModReportes in '..\Reportes\UDatModReportes.pas' {dmReportes: TDataModule},
  UFormSelFecha in 'UFormSelFecha.pas' {frmSelFecha},
  UTransaccionesCxc in 'UTransaccionesCxc.pas' {frmTransaccionesCxc},
  UVerificaTrnDiaria in 'UVerificaTrnDiaria.pas' {frmVTrnDiaria},
  UDatModControl in 'UDatModControl.pas' {dmControl: TDataModule},
  UAcercaDe in 'UAcercaDe.pas' {AboutBox},
  URepEstadoCtaCxc in '..\Reportes\URepEstadoCtaCxc.pas' {qckRepXServ: TQuickRep},
  UDatModBalanceCxc in 'UDatModBalanceCxc.pas' {dmBalanceCxc: TDataModule},
  UBalanceCxcClientes in 'UBalanceCxcClientes.pas' {frmBalanceCxcCtes},
  UDebitosycreditosaplicados in 'UDebitosycreditosaplicados.pas' {frmVerCreditosyDebitosAplicados},
  UQckReporteFactura in '..\Reportes\UQckReporteFactura.pas' {qckFactura: TQuickRep},
  UDatModUsuarios in 'UDatModUsuarios.pas' {dmUsuarios: TDataModule},
  UCambiarClaveUsuario in 'UCambiarClaveUsuario.pas' {frmCambiarClaveUsuario},
  uLogin in 'uLogin.pas' {frmLogin},
  URepResumenVentas in '..\Reportes\URepResumenVentas.pas' {qckResumenVentas: TQuickRep},
  UDatModEmpleados in 'UDatModEmpleados.pas' {dmEmpleados: TDataModule},
  UEmpleados in 'UEmpleados.pas' {frmEmpleados},
  URepVentaDiaria in 'URepVentaDiaria.pas' {qckRepVentaDiaria: TQuickRep},
  URepVentaMesxDia in '..\Reportes\URepVentaMesxDia.pas' {qckRepVentaMesxDia: TQuickRep},
  UDatosVentaXMes in 'UDatosVentaXMes.pas' {frmConsultaDatosVentaXMes},
  URepVigenciaCxcCtes in '..\Reportes\URepVigenciaCxcCtes.pas' {qryvigenciaCxc: TQuickRep},
  UEntradaDeUsuarios in 'UEntradaDeUsuarios.pas' {frmEntradaUsuarios},
  UDatModDespacho in 'UDatModDespacho.pas' {dmDespacho: TDataModule},
  UProcesarDespacho in 'UProcesarDespacho.pas' {frmProcesarDespachoVendedores},
  UBuscarProductoInvDespacho in 'UBuscarProductoInvDespacho.pas' {frmBuscarInvDespachoVendedores},
  UReporteResumenDespacho in '..\Reportes\UReporteResumenDespacho.pas' {qckResumenDespacho: TQuickRep},
  URepInventarioProd in '..\Reportes\URepInventarioProd.pas' {qckRepDatosInventario: TQuickRep},
  UPreciosInventario in 'UPreciosInventario.pas' {frmPreciosInventario},
  URutas in 'URutas.pas' {frmRutas},
  UDatModRuta in 'UDatModRuta.pas' {dmRutas: TDataModule},
  UCuadreVentaxRuta in 'UCuadreVentaxRuta.pas' {frmCuadreXRuta},
  UDatModCuadrexRuta in 'UDatModCuadrexRuta.pas' {dmCuadrexRuta: TDataModule},
  URepCuadreRuta in '..\Reportes\URepCuadreRuta.pas' {qckCuadreRuta: TQuickRep},
  UQckReporteFacturaCuadre in '..\Reportes\UQckReporteFacturaCuadre.pas' {qckFacturaCuadre: TQuickRep},
  UBalanceSalidaXRuta in 'UBalanceSalidaXRuta.pas' {frmBalanceDespacho},
  URepCuadreDiario in '..\Reportes\URepCuadreDiario.pas' {qckReporteCuadreDiario: TQuickRep},
  URegistro in 'URegistro.pas' {frmTrgtr},
  UGlobalCp in '..\..\..\Comun\UGlobalCp.pas',
  URepSalidaRuta in '..\Reportes\URepSalidaRuta.pas' {qckSalidaRuta: TQuickRep},
  URepBeneficioBruto in '..\Reportes\URepBeneficioBruto.pas' {qckBeneficioBruto: TQuickRep},
  URepFacturaVenta in '..\Reportes\URepFacturaVenta.pas' {qckFacturaVenta: TQuickRep},
  UProcesarPedidos in 'UProcesarPedidos.pas' {frmRegistrarPedidos},
  UBuscaProductoProcPedido in 'UBuscaProductoProcPedido.pas' {frmBuscarProdProcPed},
  URepPrecio in '..\Reportes\URepPrecio.pas' {qckRepPrecio: TQuickRep},
  UDatModCostos in 'UDatModCostos.pas' {dmCostos: TDataModule},
  UDatModPrestamo in 'UDatModPrestamo.pas' {dmPrestamo: TDataModule},
  UPrestamoEmpleados in 'UPrestamoEmpleados.pas' {frmPrestamos},
  USeleccionaEmpleadoPrestamo in 'USeleccionaEmpleadoPrestamo.pas' {frmSelEmpParaPrestamo},
  URepVentaCajaXRuta in '..\Reportes\URepVentaCajaXRuta.pas' {qckVentaCajaxRuta: TQuickRep},
  URepVentaCajaxRutaResumen in '..\Reportes\URepVentaCajaxRutaResumen.pas' {qckVentaCajaxRutaResumen: TQuickRep},
  UDatModComisiones in 'UDatModComisiones.pas' {dmComision: TDataModule},
  UFormComisiones in 'UFormComisiones.pas' {frmComisiones},
  URegistrarTransOpeDiaria in 'URegistrarTransOpeDiaria.pas' {frmRegTransOpeDiaria},
  UDatModRegOpeDiaria in 'UDatModRegOpeDiaria.pas' {dtmTransOpeDiaria: TDataModule},
  UFormProveedores in 'UFormProveedores.pas' {frmProveedores},
  URepTransOpeDiaria in '..\Reportes\URepTransOpeDiaria.pas' {qckTransOpeDiaria: TQuickRep},
  UFormProductosServicios in 'UFormProductosServicios.pas' {frmProductosServ},
  UFormCentroDeCostos in 'UFormCentroDeCostos.pas' {frmCentroDeCostos},
  UFormNominaEmpleado in 'UFormNominaEmpleado.pas' {frmNominaEmpleado},
  UReporteValoresEntregadosCuadre in '..\Reportes\UReporteValoresEntregadosCuadre.pas' {qckRepValoresEntxRuta: TQuickRep},
  UDatModNomina in 'UDatModNomina.pas' {dmNomina: TDataModule},
  UControlAct in '..\..\..\Comun\UControlAct.pas' {frmControlSistema},
  USelTipoNomIntegrar in 'USelTipoNomIntegrar.pas' {frmSelDatosIntegrarNom},
  UDatModDescuentosNom in 'UDatModDescuentosNom.pas' {dmDescuentosNom: TDataModule},
  UConfDescuentosNomina in 'UConfDescuentosNomina.pas' {frmConfDescuentosNomina},
  UDatosComision in 'UDatosComision.pas' {frmDatosComision},
  UReporteNomina in '..\Reportes\UReporteNomina.pas' {qckRepNomina: TQuickRep},
  UCompania in 'UCompania.pas' {frmCompania},
  UReporteSobreNominaEmp in '..\Reportes\UReporteSobreNominaEmp.pas' {qckSobrePagoNomina: TQuickRep},
  URFacturaStandar in 'URFacturaStandar.pas' {qckRepFacturaEstandarNew: TQuickRep},
  UDatModConectar in 'UDatModConectar.pas' {dmConectar: TDataModule},
  UDetValoresCuadre in 'UDetValoresCuadre.pas' {frmValoresCuadreRuta},
  URepComision in 'URepComision.pas' {qckRepComision: TQuickRep},
  URepComResVendedor in '..\Reportes\URepComResVendedor.pas' {qckRepResComVendedor: TQuickRep},
  UFormPromociones in 'UFormPromociones.pas' {frmPromociones},
  URepPreciocomiciones in '..\Reportes\URepPreciocomiciones.pas' {qckPrecioComision: TQuickRep},
  URepPromociones in '..\Reportes\URepPromociones.pas' {qckRepPromociones: TQuickRep},
  URepPromoRes in '..\Reportes\URepPromoRes.pas' {qckRepPromoResumen: TQuickRep},
  UDatModITBIS in 'UDatModITBIS.pas' {dmItbis: TDataModule},
  URegItbis in 'URegItbis.pas' {frmItbis},
  UProcVentaRapida in 'UProcVentaRapida.pas' {frmProcVentaRapida},
  URepComprobante in '..\Reportes\URepComprobante.pas' {qckRepRecibo: TQuickRep},
  UProcMiniInventario in 'UProcMiniInventario.pas' {frmRegMiniInvientario},
  UConectar in 'UConectar.pas' {frmInciaConeccion},
  UFormNumCompFiscal in 'UFormNumCompFiscal.pas' {frmMantNumCombFiscal},
  USeleccionarNCF in 'USeleccionarNCF.pas' {frmSelNCF},
  UFormCompFiscal in 'UFormCompFiscal.pas' {frmTipoCompFiscal},
  UFormHistSecNCF in 'UFormHistSecNCF.pas' {frmMantHistoricoNCF},
  uFormAsignarNCFVenta in 'uFormAsignarNCFVenta.pas' {frmAsignarNCFVenta},
  UBuscarClientesPersonasP in 'UBuscarClientesPersonasP.pas' {FrmBuscarClientesPersonas},
  UFormDatosCotiza in 'UFormDatosCotiza.pas' {frmCotizaciones},
  URFactura in '..\Reportes\URFactura.pas' {qckRepFacturaEstandar: TQuickRep},
  UFormSelproducto in 'UFormSelproducto.pas' {frmMostrarProductos},
  URepReciboIngreso in '..\Reportes\URepReciboIngreso.pas' {qckReciboIngreso: TQuickRep},
  URecibosYCtaXCobrar in 'URecibosYCtaXCobrar.pas' {FrmRecibosYCtaXCobrar},
  UDatmodDatosGenerales in 'UDatmodDatosGenerales.pas' {dmDatos: TDataModule},
  UDetalleFormaDePago in 'UDetalleFormaDePago.pas' {frmAceptaDetalleFormaPago},
  UDatModPagoTarjeta in 'UDatModPagoTarjeta.pas' {dmPagosTarjeta: TDataModule},
  UDatModProveedor in 'UDatModProveedor.pas' {dmProveedor: TDataModule},
  UFormFinanciamiento in 'UFormFinanciamiento.pas' {frmFinanciamiento},
  UFormInteres in 'UFormInteres.pas' {frmPorcientoInteres},
  URepItebis in 'URepItebis.pas' {qckRepItbis: TQuickRep},
  UBalanceCxpProv in 'UBalanceCxpProv.pas' {frmBalanceCxpProv},
  UCobroDeCuotasFinanc in 'UCobroDeCuotasFinanc.pas' {frmCobroCuotasXFinanc},
  UDatModCxp in 'UDatModCxp.pas' {dmCxp: TDataModule},
  UQckReporteFacturaPedido in '..\Reportes\UQckReporteFacturaPedido.pas' {qckFacturaPedido: TQuickRep},
  UFormTransaccionesCXP in '..\Reportes\UFormTransaccionesCXP.pas' {frmTransaccionesCxP},
  uRepAvisoAtrasoPagoCuotaFinanc in 'uRepAvisoAtrasoPagoCuotaFinanc.pas' {qckRepAvisoAtraso: TQuickRep},
  uFormConsultaAvisoAtraso in 'uFormConsultaAvisoAtraso.pas' {frmConsultaAvisoAtraso},
  UPagoFacturas in 'UPagoFacturas.pas' {frmpagofacturas},
  URepItbisResXDia in 'URepItbisResXDia.pas' {qckRepItbis_ResXDia: TQuickRep},
  UMostrarFinancVigente in '..\..\..\LoanProcess\Fuentes\UMostrarFinancVigente.pas' {frmShowFinancVigente},
  UConfigRep in 'UConfigRep.pas' {frmConfReporte},
  URepCotizacionPapel8_55 in 'URepCotizacionPapel8_55.pas' {qckCotizacion8_55: TQuickRep},
  URepRecibo8_5_11 in 'URepRecibo8_5_11.pas' {qckRepRecibo8_5_11: TQuickRep},
  USolDatos in 'USolDatos.pas' {frmSolDatos},
  UDistCuotasFinanc in 'UDistCuotasFinanc.pas' {frmDistCuotas},
  URepTarjeta_dePago in 'URepTarjeta_dePago.pas' {qckRepTarjetaDePago: TQuickRep},
  UFormAvisoAtraso in 'UFormAvisoAtraso.pas' {frmAvisoAtraso};

{$R *.res}

begin
  Application.Initialize;
  frmPresentacion:=TfrmPresentacion.Create(nil);
  frmPresentacion.Show;
  frmPresentacion.Update;
  Application.HelpFile := '';
  Application.Title := 'Punto de Ventas';
  Application.CreateForm(TdmConectar, dmConectar);
  Application.CreateForm(TdmControl, dmControl);
  Application.CreateForm(TdmCompania, dmCompania);
  Application.CreateForm(TdmEmpleados, dmEmpleados);
  Application.CreateForm(TdmUsuarios, dmUsuarios);
  Application.CreateForm(TdmInventario, dmInventario);
  Application.CreateForm(TdmCxc, dmCxc);
  Application.CreateForm(TdmIngresos, dmIngresos);
  Application.CreateForm(TdmFactura, dmFactura);
  Application.CreateForm(TdmClientes, dmClientes);
  Application.CreateForm(TdmVentas, dmVentas);
  Application.CreateForm(TdmReportes, dmReportes);
  Application.CreateForm(TdmBalanceCxc, dmBalanceCxc);
  Application.CreateForm(TdmDespacho, dmDespacho);
  Application.CreateForm(TdmRutas, dmRutas);
  Application.CreateForm(TdmCuadrexRuta, dmCuadrexRuta);
  Application.CreateForm(TdmCostos, dmCostos);
  Application.CreateForm(TdmCxp, dmCxp);
  Application.CreateForm(TdmPrestamo, dmPrestamo);
  Application.CreateForm(TdmComision, dmComision);
  Application.CreateForm(TdtmTransOpeDiaria, dtmTransOpeDiaria);
  Application.CreateForm(TdmNomina, dmNomina);
  Application.CreateForm(TdmDescuentosNom, dmDescuentosNom);
  Application.CreateForm(TdmItbis, dmItbis);
  Application.CreateForm(TdmDatos, dmDatos);
  Application.CreateForm(TdmPagosTarjeta, dmPagosTarjeta);
  Application.CreateForm(TdmProveedor, dmProveedor);
  Application.CreateForm(TfrmMenuPrincipal, frmMenuPrincipal);
  frmPresentacion.Close;
  frmPresentacion.Free;
  frmPresentacion:=Nil;
  Application.Run;
end.


