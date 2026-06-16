program PointSaleSoft;

uses
  Forms, SysUtils, Classes, DB, ExtCtrls, IBDatabase,
  UGlobal in '..\fuentes\UGlobal.pas',
  UMenuPrincipal in '..\fuentes\UMenuPrincipal.pas' {frmMenuPrincipal},
  UDatosVentas in '..\fuentes\UDatosVentas.pas' {dmVentas: TDataModule},
  UInventarioProd in '..\fuentes\UInventarioProd.pas' {frmInventarioProd},
  UDatModInventario in '..\fuentes\UDatModInventario.pas' {dmInventario: TDataModule},
  UTipoInventario in '..\fuentes\UTipoInventario.pas' {frmTipoInventario},
  UInventarioHistorico in '..\fuentes\UInventarioHistorico.pas' {frmInventarioHist},
  UCambiarPrecios in '..\fuentes\UCambiarPrecios.pas' {frmCambiarPrecio},
  UDatModCxc in '..\fuentes\UDatModCxc.pas' {dmCxc: TDataModule},
  UDatModIngresos in '..\fuentes\UDatModIngresos.pas' {dmIngresos: TDataModule},
  UFormRegIngreso in '..\fuentes\UFormRegIngreso.pas' {frmRegIngresos},
  UDatModFactura in '..\fuentes\UDatModFactura.pas' {dmFactura: TDataModule},
  UPresentacion in '..\fuentes\UPresentacion.pas' {frmPresentacion},
  UBuscarProductoInvVenta in '..\fuentes\UBuscarProductoInvVenta.pas' {frmBuscarProdInv},
  UMaestroClientes in '..\fuentes\UMaestroClientes.pas' {frmClientes},
  UDatModClientes in '..\fuentes\UDatModClientes.pas' {dmClientes: TDataModule},
  URepClientes in '..\fuentes\..\Reportes\URepClientes.pas' {qckRepClientes: TQuickRep},
  UDatModCompania in '..\fuentes\UDatModCompania.pas' {dmCompania: TDataModule},
  UDatModReportes in '..\fuentes\..\Reportes\UDatModReportes.pas' {dmReportes: TDataModule},
  UFormSelFecha in '..\fuentes\UFormSelFecha.pas' {frmSelFecha},
  UTransaccionesCxc in '..\fuentes\UTransaccionesCxc.pas' {frmTransaccionesCxc},
  UDatModControl in '..\fuentes\UDatModControl.pas' {dmControl: TDataModule},
  UAcercaDe in '..\fuentes\UAcercaDe.pas' {AboutBox},
  URepEstadoCtaCxc in '..\fuentes\..\Reportes\URepEstadoCtaCxc.pas' {qckRepXServ: TQuickRep},
  UDatModBalanceCxc in '..\fuentes\UDatModBalanceCxc.pas' {dmBalanceCxc: TDataModule},
  UBalanceCxcClientes in '..\fuentes\UBalanceCxcClientes.pas' {frmBalanceCxcCtes},
  UDebitosycreditosaplicados in '..\fuentes\UDebitosycreditosaplicados.pas' {frmVerCreditosyDebitosAplicados},
  UQckReporteFactura in '..\fuentes\..\Reportes\UQckReporteFactura.pas' {qckFactura: TQuickRep},
  UDatModUsuarios in '..\fuentes\UDatModUsuarios.pas' {dmUsuarios: TDataModule},
  UCambiarClaveUsuario in '..\fuentes\UCambiarClaveUsuario.pas' {frmCambiarClaveUsuario},
  uLogin in '..\fuentes\uLogin.pas' {frmLogin},
  URepResumenVentas in '..\fuentes\..\Reportes\URepResumenVentas.pas' {qckResumenVentas: TQuickRep},
  UDatModEmpleados in '..\fuentes\UDatModEmpleados.pas' {dmEmpleados: TDataModule},
  UEmpleados in '..\fuentes\UEmpleados.pas' {frmEmpleados},
  URepVentaDiaria in '..\fuentes\URepVentaDiaria.pas' {qckRepVentaDiaria: TQuickRep},
  URepVentaMesxDia in '..\fuentes\..\Reportes\URepVentaMesxDia.pas' {qckRepVentaMesxDia: TQuickRep},
  UDatosVentaXMes in '..\fuentes\UDatosVentaXMes.pas' {frmConsultaDatosVentaXMes},
  URepVigenciaCxcCtes in '..\fuentes\..\Reportes\URepVigenciaCxcCtes.pas' {qryvigenciaCxc: TQuickRep},
  UEntradaDeUsuarios in '..\fuentes\UEntradaDeUsuarios.pas' {frmEntradaUsuarios},
  UDatModDespacho in '..\fuentes\UDatModDespacho.pas' {dmDespacho: TDataModule},
  UBuscarProductoInvDespacho in '..\fuentes\UBuscarProductoInvDespacho.pas' {frmBuscarInvDespachoVendedores},
  UReporteResumenDespacho in '..\fuentes\..\Reportes\UReporteResumenDespacho.pas' {qckResumenDespacho: TQuickRep},
  URepInventarioProd in '..\fuentes\..\Reportes\URepInventarioProd.pas' {qckRepDatosInventario: TQuickRep},
  UPreciosInventario in '..\fuentes\UPreciosInventario.pas' {frmPreciosInventario},
  URutas in '..\fuentes\URutas.pas' {frmRutas},
  UDatModRuta in '..\fuentes\UDatModRuta.pas' {dmRutas: TDataModule},
  UCuadreVentaxRuta in '..\fuentes\UCuadreVentaxRuta.pas' {frmCuadreXRuta},
  UDatModCuadrexRuta in '..\fuentes\UDatModCuadrexRuta.pas' {dmCuadrexRuta: TDataModule},
  URepCuadreRuta in '..\fuentes\..\Reportes\URepCuadreRuta.pas' {qckCuadreRuta: TQuickRep},
  UQckReporteFacturaCuadre in '..\fuentes\..\Reportes\UQckReporteFacturaCuadre.pas' {qckFacturaCuadre: TQuickRep},
  UBalanceSalidaXRuta in '..\fuentes\UBalanceSalidaXRuta.pas' {frmBalanceDespacho},
  URepCuadreDiario in '..\fuentes\..\Reportes\URepCuadreDiario.pas' {qckReporteCuadreDiario: TQuickRep},
  URegistro in '..\fuentes\URegistro.pas' {frmTrgtr},
  UGlobalCp in '..\fuentes\..\..\..\Comun\UGlobalCp.pas',
  URepSalidaRuta in '..\fuentes\..\Reportes\URepSalidaRuta.pas' {qckSalidaRuta: TQuickRep},
  URepBeneficioBruto in '..\fuentes\..\Reportes\URepBeneficioBruto.pas' {qckBeneficioBruto: TQuickRep},
  URepFacturaVenta in '..\fuentes\..\Reportes\URepFacturaVenta.pas' {qckFacturaVenta: TQuickRep},
  UBuscaProductoProcPedido in '..\fuentes\UBuscaProductoProcPedido.pas' {frmBuscarProdProcPed},
  URepPrecio in '..\fuentes\..\Reportes\URepPrecio.pas' {qckRepPrecio: TQuickRep},
  UDatModCostos in '..\fuentes\UDatModCostos.pas' {dmCostos: TDataModule},
  UDatModPrestamo in '..\fuentes\UDatModPrestamo.pas' {dmPrestamo: TDataModule},
  UPrestamoEmpleados in '..\fuentes\UPrestamoEmpleados.pas' {frmPrestamos},
  USeleccionaEmpleadoPrestamo in '..\fuentes\USeleccionaEmpleadoPrestamo.pas' {frmSelEmpParaPrestamo},
  URepVentaCajaXRuta in '..\fuentes\..\Reportes\URepVentaCajaXRuta.pas' {qckVentaCajaxRuta: TQuickRep},
  URepVentaCajaxRutaResumen in '..\fuentes\..\Reportes\URepVentaCajaxRutaResumen.pas' {qckVentaCajaxRutaResumen: TQuickRep},
  UDatModComisiones in '..\fuentes\UDatModComisiones.pas' {dmComision: TDataModule},
  UFormComisiones in '..\fuentes\UFormComisiones.pas' {frmComisiones},
  URegistrarTransOpeDiaria in '..\fuentes\URegistrarTransOpeDiaria.pas' {frmRegTransOpeDiaria},
  UDatModRegOpeDiaria in '..\fuentes\UDatModRegOpeDiaria.pas' {dtmTransOpeDiaria: TDataModule},
  UFormProveedores in '..\fuentes\UFormProveedores.pas' {frmProveedores},
  URepTransOpeDiaria in '..\fuentes\..\Reportes\URepTransOpeDiaria.pas' {qckTransOpeDiaria: TQuickRep},
  UFormProductosServicios in '..\fuentes\UFormProductosServicios.pas' {frmProductosServ},
  UFormCentroDeCostos in '..\fuentes\UFormCentroDeCostos.pas' {frmCentroDeCostos},
  UFormNominaEmpleado in '..\fuentes\UFormNominaEmpleado.pas' {frmNominaEmpleado},
  UReporteValoresEntregadosCuadre in '..\fuentes\..\Reportes\UReporteValoresEntregadosCuadre.pas' {qckRepValoresEntxRuta: TQuickRep},
  UDatModNomina in '..\fuentes\UDatModNomina.pas' {dmNomina: TDataModule},
  UControlAct in '..\fuentes\..\..\..\Comun\UControlAct.pas' {frmControlSistema},
  USelTipoNomIntegrar in '..\fuentes\USelTipoNomIntegrar.pas' {frmSelDatosIntegrarNom},
  UDatModDescuentosNom in '..\fuentes\UDatModDescuentosNom.pas' {dmDescuentosNom: TDataModule},
  UConfDescuentosNomina in '..\fuentes\UConfDescuentosNomina.pas' {frmConfDescuentosNomina},
  UDatosComision in '..\fuentes\UDatosComision.pas' {frmDatosComision},
  UReporteNomina in '..\fuentes\..\Reportes\UReporteNomina.pas' {qckRepNomina: TQuickRep},
  UCompania in '..\fuentes\UCompania.pas' {frmCompania},
  UReporteSobreNominaEmp in '..\fuentes\..\Reportes\UReporteSobreNominaEmp.pas' {qckSobrePagoNomina: TQuickRep},
  URFacturaStandar in '..\fuentes\URFacturaStandar.pas' {qckRepFacturaEstandarNew: TQuickRep},
  UDatModConectar in '..\fuentes\UDatModConectar.pas' {dmConectar: TDataModule},
  UDetValoresCuadre in '..\fuentes\UDetValoresCuadre.pas' {frmValoresCuadreRuta},
  URepComResVendedor in '..\fuentes\..\Reportes\URepComResVendedor.pas' {qckRepResComVendedor: TQuickRep},
  UFormPromociones in '..\fuentes\UFormPromociones.pas' {frmPromociones},
  URepPreciocomiciones in '..\fuentes\..\Reportes\URepPreciocomiciones.pas' {qckPrecioComision: TQuickRep},
  URepPromociones in '..\fuentes\..\Reportes\URepPromociones.pas' {qckRepPromociones: TQuickRep},
  URepPromoRes in '..\fuentes\..\Reportes\URepPromoRes.pas' {qckRepPromoResumen: TQuickRep},
  UDatModITBIS in '..\fuentes\UDatModITBIS.pas' {dmItbis: TDataModule},
  URegItbis in '..\fuentes\URegItbis.pas' {frmItbis},
  UProcVentaRapida in '..\fuentes\UProcVentaRapida.pas' {frmProcVentaRapida},
  URepComprobante in '..\fuentes\..\Reportes\URepComprobante.pas' {qckRepRecibo: TQuickRep},
  UProcMiniInventario in '..\fuentes\UProcMiniInventario.pas' {frmRegMiniInvientario},
  UConectar in '..\fuentes\UConectar.pas' {frmInciaConeccion},
  UFormNumCompFiscal in '..\fuentes\UFormNumCompFiscal.pas' {frmMantNumCombFiscal},
  USeleccionarNCF in '..\fuentes\USeleccionarNCF.pas' {frmSelNCF},
  UFormCompFiscal in '..\fuentes\UFormCompFiscal.pas' {frmTipoCompFiscal},
  UFormHistSecNCF in '..\fuentes\UFormHistSecNCF.pas' {frmMantHistoricoNCF},
  uFormAsignarNCFVenta in '..\fuentes\uFormAsignarNCFVenta.pas' {frmAsignarNCFVenta},
  UBuscarClientesPersonasP in '..\fuentes\UBuscarClientesPersonasP.pas' {FrmBuscarClientesPersonas},
  UFormDatosCotiza in '..\fuentes\UFormDatosCotiza.pas' {frmCotizaciones},
  URFactura in '..\fuentes\..\Reportes\URFactura.pas' {qckRepFacturaEstandar: TQuickRep},
  UFormSelproducto in '..\fuentes\UFormSelproducto.pas' {frmMostrarProductos},
  URepReciboIngreso in '..\fuentes\..\Reportes\URepReciboIngreso.pas' {qckReciboIngreso: TQuickRep},
  UDatmodDatosGenerales in '..\fuentes\UDatmodDatosGenerales.pas' {dmDatos: TDataModule},
  UDatModPagoTarjeta in '..\fuentes\UDatModPagoTarjeta.pas' {dmPagosTarjeta: TDataModule},
  UDatModProveedor in '..\fuentes\UDatModProveedor.pas' {dmProveedor: TDataModule},
  UFormFinanciamiento in '..\fuentes\UFormFinanciamiento.pas' {frmFinanciamiento},
  UFormInteres in '..\fuentes\UFormInteres.pas' {frmPorcientoInteres},
  URepItebis in '..\fuentes\URepItebis.pas' {qckRepItbis: TQuickRep},
  UBalanceCxpProv in '..\fuentes\UBalanceCxpProv.pas' {frmBalanceCxpProv},
  UCobroDeCuotasFinanc in '..\fuentes\UCobroDeCuotasFinanc.pas' {frmCobroCuotasXFinanc},
  UDatModCxp in '..\fuentes\UDatModCxp.pas' {dmCxp: TDataModule},
  UQckReporteFacturaPedido in '..\fuentes\..\Reportes\UQckReporteFacturaPedido.pas' {qckFacturaPedido: TQuickRep},
  UFormTransaccionesCXP in '..\fuentes\..\Reportes\UFormTransaccionesCXP.pas' {frmTransaccionesCxP},
  uRepAvisoAtrasoPagoCuotaFinanc in '..\fuentes\uRepAvisoAtrasoPagoCuotaFinanc.pas' {qckRepAvisoAtraso: TQuickRep},
  uFormConsultaAvisoAtraso in '..\fuentes\uFormConsultaAvisoAtraso.pas' {frmConsultaAvisoAtraso},
  URepItbisResXDia in '..\fuentes\URepItbisResXDia.pas' {qckRepItbis_ResXDia: TQuickRep},
  UMostrarFinancVigente in '..\fuentes\UMostrarFinancVigente.pas' {frmShowFinancVigente},
  UConfigRep in '..\fuentes\UConfigRep.pas' {frmConfReporte},
  URepCotizacionPapel8_55 in '..\fuentes\URepCotizacionPapel8_55.pas' {qckCotizacion8_55: TQuickRep},
  URepRecibo8_5_11 in '..\fuentes\URepRecibo8_5_11.pas' {qckRepRecibo8_5_11: TQuickRep},
  USolDatos in '..\fuentes\USolDatos.pas' {frmSolDatos},
  UDistCuotasFinanc in '..\fuentes\UDistCuotasFinanc.pas' {frmDistCuotas},
  URepTarjeta_dePago in '..\fuentes\URepTarjeta_dePago.pas' {qckRepTarjetaDePago: TQuickRep},
  UFormAvisoAtraso in '..\fuentes\UFormAvisoAtraso.pas' {frmAvisoAtraso},
  UFormSelSerieProd in '..\fuentes\UFormSelSerieProd.pas' {frmSelSerie},
  URepReciboAbonoCXC in '..\fuentes\URepReciboAbonoCXC.pas' {qckReciboAbonoCXC: TQuickRep},
  URepIngresoDet in '..\fuentes\URepIngresoDet.pas' {qckRepTransCxc: TQuickRep},
  UFormRepXTipoInv in '..\fuentes\UFormRepXTipoInv.pas' {frmRepIngXTipo},
  UTransNcNbDev in '..\fuentes\UTransNcNbDev.pas' {frmTransCxcNCdbDev},
  UTransCxcDoc in '..\fuentes\UTransCxcDoc.pas' {qckRepTransCxcDoc: TQuickRep},
  UMostrarProdTranscxc in '..\fuentes\UMostrarProdTranscxc.pas' {frmProdTranscxc},
  uSelSingleFechaOpc in '..\fuentes\uSelSingleFechaOpc.pas' {frmSelSingleFechaOpc},
  UEdicionVenta in '..\fuentes\UEdicionVenta.pas' {frmEdicionVenta},
  UFormProcDevolucion in '..\fuentes\UFormProcDevolucion.pas' {frmProcVentaRapidaEdicion},
  URepComprobanteDevol in '..\fuentes\..\Reportes\URepComprobanteDevol.pas' {qckRepReciboDevol: TQuickRep},
  UFormEntreClave in '..\fuentes\UFormEntreClave.pas' {frmEntrreClave},
  URepIngEfeyCxc in '..\fuentes\URepIngEfeyCxc.pas' {QckRepIngEfeyCxc: TQuickRep},
  URegMiscelaneos in '..\fuentes\URegMiscelaneos.pas' {frmConfVarios},
  ULabelImpCodBarra in '..\fuentes\ULabelImpCodBarra.pas' {frmCodigoBarra},
  DSim in '..\fuentes\DSim.pas',
  URFacturaStandarReimp in '..\fuentes\URFacturaStandarReimp.pas' {qckRepFacturaEstandarNewReimp: TQuickRep},
  UCobrarFacturas in '..\fuentes\UCobrarFacturas.pas' {frmCobrarFacturas},
  URegPedidoProv in '..\fuentes\URegPedidoProv.pas' {frmRegPedidoProv},
  UFormTransCxcDbCr_r in '..\fuentes\UFormTransCxcDbCr_r.pas' {frmTransCxcProc_R},
  UFactServicio in '..\fuentes\UFactServicio.pas' {qckFactServicio: TQuickRep},
  UFormServiciosFijos in '..\fuentes\UFormServiciosFijos.pas' {frmProgServFijos},
  UFormServFijos in '..\fuentes\UFormServFijos.pas' {frmServiciosReg},
  UFormSaldAntCxc in '..\fuentes\UFormSaldAntCxc.pas' {frmConsultaAntCxc},
  URepSaldoXAntCxc in '..\fuentes\URepSaldoXAntCxc.pas' {qckRepSaldoXAntCxc: TQuickRep},
  URepSaldoAntCxcRes in '..\fuentes\URepSaldoAntCxcRes.pas' {qckRepSaldoXantCxcRes: TQuickRep},
  UFormDatosVentaVeh in '..\fuentes\UFormDatosVentaVeh.pas' {frmDatosVentaVehiculos},
  URepVencimientoProd in '..\fuentes\URepVencimientoProd.pas' {qckRepVencimientoProd: TQuickRep},
  UIndicarLoteNum in '..\fuentes\UIndicarLoteNum.pas' {frmShowLote},
  UProdVencidos in '..\fuentes\UProdVencidos.pas' {frmProdVencidos},
  UPagarCXPFacturas in '..\fuentes\UPagarCXPFacturas.pas' {frmPagarCXPFacturas},
  UBuscarProveedores in '..\fuentes\UBuscarProveedores.pas' {frmProcBuscarProv},
  URepCompAbonoCXP in '..\fuentes\URepCompAbonoCXP.pas' {QckRepCompAbonoCXP: TQuickRep},
  URepEstadoCtaCxp in '..\fuentes\URepEstadoCtaCxp.pas' {qckRepXServCxp: TQuickRep},
  UProcCierreOfc in '..\fuentes\UProcCierreOfc.pas' {frmProcCierreOfc},
  UCerrarHistoriocxc in '..\fuentes\UCerrarHistoriocxc.pas' {frmVTrnDiaria},
  URegNumTarjetaPagoCxp in '..\fuentes\URegNumTarjetaPagoCxp.pas' {frmRegNumTarjeta},
  URegNumChequeCxp in '..\fuentes\URegNumChequeCxp.pas' {frmRegNumCheque},
  UfrmBancos in '..\fuentes\UfrmBancos.pas' {frmBancos},
  uFrmConsultaFactPendCxp in '..\fuentes\uFrmConsultaFactPendCxp.pas' {frmFactCxpPendiente},
  URepFactPendCxp in '..\fuentes\URepFactPendCxp.pas' {qckFactCxpPendientes: TQuickRep},
  URepFactPendCxc in '..\fuentes\URepFactPendCxc.pas' {qckFactPendCxc: TQuickRep},
  UfrmRelacionFact in '..\fuentes\UfrmRelacionFact.pas' {frmRelacionFact},
  URepQckRelacionFactCxc in '..\fuentes\URepQckRelacionFactCxc.pas' {qckRepRelacionFactCxc: TQuickRep},
  URepItebis_esp in '..\fuentes\URepItebis_esp.pas' {qckRepItbis_esp: TQuickRep},
  UReciboPuntoVenta in '..\fuentes\UReciboPuntoVenta.pas' {qckReciboPuntoVenta: TQuickRep},
  URepRecibo8_5_11Devol in '..\fuentes\URepRecibo8_5_11Devol.pas' {qckRepRecibo8_5_11Devol: TQuickRep},
  UFormCaja in '..\fuentes\UFormCaja.pas' {frmCaja},
  UFormTransCaja in '..\fuentes\UFormTransCaja.pas' {frmTransCaja},
  UCargosEmp in '..\fuentes\UCargosEmp.pas' {frmCargo},
  UFormTurno in '..\fuentes\UFormTurno.pas' {frmTurno},
  UFrmConsultaCuadreCaja in '..\fuentes\UFrmConsultaCuadreCaja.pas' {frmConsultaDatosCCaja},
  URepCuadreCaja in '..\fuentes\URepCuadreCaja.pas' {qckRepCuadreCaja: TQuickRep},
  UConsultaPrecio in '..\fuentes\UConsultaPrecio.pas' {frmConsultaPrecio},
  UFormMostrarTodoInventario in '..\fuentes\UFormMostrarTodoInventario.pas' {frmMostrarTodo},
  URepInvProdCosto in '..\fuentes\URepInvProdCosto.pas' {qckInvProdCosto: TQuickRep},
  USelInventario in '..\fuentes\USelInventario.pas' {frmSelInventario},
  UFromDespachoInvAlmacen in '..\fuentes\UFromDespachoInvAlmacen.pas' {frmDespachoInvAlmacen},
  UClasifPrecio in '..\fuentes\UClasifPrecio.pas' {frmTipoPrecio},
  UDivisionInventario in '..\fuentes\UDivisionInventario.pas' {frmDivisionInv},
  URepInventarioProdArea in '..\fuentes\..\Reportes\URepInventarioProdArea.pas' {qckRepDatosInventarioXarea: TQuickRep},
  UQckReporteFacturaDespA in '..\fuentes\..\Reportes\UQckReporteFacturaDespA.pas' {qckFacturaDespA: TQuickRep},
  UFormUnidades in '..\fuentes\UFormUnidades.pas' {frmUnidades},
  UCtrlEnvioaReparaciones in '..\fuentes\UCtrlEnvioaReparaciones.pas' {frmReparaciones},
  qckRepReparacionRecibo in '..\fuentes\qckRepReparacionRecibo.pas' {qckReciboReparacion: TQuickRep},
  UDatModDistCNT in '..\fuentes\UDatModDistCNT.pas' {dmDistCnt: TDataModule},
  UViewCtaCatalogo in '..\fuentes\UViewCtaCatalogo.pas' {frmViewCtaCatalogo},
  UDistCtaCnt in '..\fuentes\UDistCtaCnt.pas' {frmDistCtaCnt},
  UContabilizarformBase in '..\fuentes\UContabilizarformBase.pas' {frmContabilizaDatos},
  UDatModTransCnt in '..\fuentes\UDatModTransCnt.pas' {dmTransCnt: TDataModule},
  UContabilizarVentas in '..\fuentes\UContabilizarVentas.pas' {frmContabilizarVentas},
  UFromContCtas in '..\fuentes\UFromContCtas.pas' {frmDistCtaCntNuevo},
  UGrupoCnt in '..\fuentes\UGrupoCnt.pas' {frmGrupocnt},
  URepMvCtaCntDet in '..\fuentes\URepMvCtaCntDet.pas' {qckListMvCtacntDet: TQuickRep},
  URepListadoACnt in '..\fuentes\URepListadoACnt.pas' {qckListadoAcnt: TQuickRep},
  UDistCntGestorProd in '..\fuentes\UDistCntGestorProd.pas' {frmPrepararDatosCnt},
  UEditarPedidos in '..\fuentes\UEditarPedidos.pas' {frmEditarPedido},
  URepFacturaPuntoVenta in '..\fuentes\URepFacturaPuntoVenta.pas' {qckRepFactPuntoVenta: TQuickRep},
  URegOrdenCompra in '..\fuentes\URegOrdenCompra.pas' {frmRegOrdenCompra},
  UFormOrdenCompraR in '..\fuentes\UFormOrdenCompraR.pas' {frmOrdenCompraR},
  URepOrdenCompra in '..\fuentes\URepOrdenCompra.pas' {qckRepOrdenCompra: TQuickRep},
  UFormImpordenCompras in '..\fuentes\UFormImpordenCompras.pas' {frmImpOrden},
  UFormTipoNomina in '..\fuentes\UFormTipoNomina.pas' {frmTipoNomina},
  UDatosTempEscalaIsr in '..\fuentes\UDatosTempEscalaIsr.pas' {frmDatosTempEscalaIsr},
  UEscalaISR in '..\fuentes\UEscalaISR.pas' {frmEscalaIsr},
  UFechaFinEscalaIsr in '..\fuentes\UFechaFinEscalaIsr.pas' {frmFechaEscalaFinIsr},
  URepInventarioProdSerie in '..\fuentes\..\Reportes\URepInventarioProdSerie.pas' {qckRepDatosInventarioSerie: TQuickRep},
  URepRecibo8_5_11REspinal in '..\fuentes\URepRecibo8_5_11REspinal.pas' {qckRepRecibo8_5_11REsp: TQuickRep},
  URepRecibo8_5_11DevolREspinal in '..\fuentes\URepRecibo8_5_11DevolREspinal.pas' {qckRepRecibo8_5_11DevolResp: TQuickRep},
  URFacturaStandarReimpREsp in '..\fuentes\URFacturaStandarReimpREsp.pas' {qckRepFacturaEstandarNewReimpREsp: TQuickRep},
  UPrecioProdXUnidad in '..\fuentes\UPrecioProdXUnidad.pas' {frmPrecioProdXUnidad},
  URepComprobante_II in '..\fuentes\URepComprobante_II.pas' {qckRepReciboNew: TQuickRep},
  UFormReferenciaClientes in '..\fuentes\UFormReferenciaClientes.pas' {frmReferenciaClientes},
  URepInvMargenGananciaXProd in '..\fuentes\URepInvMargenGananciaXProd.pas' {qckRepMargenBeneficio: TQuickRep},
  URepInvMargenGananciaXVenta in '..\fuentes\URepInvMargenGananciaXVenta.pas' {qckRepMargenBeneficioVenta: TQuickRep},
  URepFinanciamientos in '..\fuentes\URepFinanciamientos.pas' {qckRepFinanciamientos: TQuickRep},
  UFormTransCxpDbCr_r in '..\fuentes\UFormTransCxpDbCr_r.pas' {frmTransCxpProc_R},
  URepPagoCxpDet in '..\fuentes\URepPagoCxpDet.pas' {qckRepTransCxp: TQuickRep},
  UCobrosCuotaFinanciamientos in '..\fuentes\UCobrosCuotaFinanciamientos.pas' {frmCobroCuotasFinanciamientos},
  UConsultaInventario in '..\fuentes\UConsultaInventario.pas' {frmConsultaInventario},
  UConsultaPreventa in '..\fuentes\UConsultaPreventa.pas' {frmConsultaPreVenta},
  UDatModEstudiante in '..\fuentes\UDatModEstudiante.pas' {dmEstudiante: TDataModule},
  UFormMaestroEstudiante in '..\fuentes\UFormMaestroEstudiante.pas' {frmMaestroEstudiante},
  UDatModPanaderia in '..\fuentes\UDatModPanaderia.pas' {dmPanaderia: TDataModule},
  UFormPanRecetas in '..\fuentes\UFormPanRecetas.pas' {frmRecetas},
  UConfigurarSkin in '..\fuentes\UConfigurarSkin.pas' {frmConfSkin},
  UFormRequisicion in '..\fuentes\UFormRequisicion.pas' {frmRequisicion},
  UFormPanRendimiento in '..\fuentes\UFormPanRendimiento.pas' {frmPanRendimiento},
  URepRequisicion in '..\fuentes\..\Reportes\URepRequisicion.pas' {qckRepRequisicion: TQuickRep},
  UFormRegProduccionPan in '..\fuentes\UFormRegProduccionPan.pas' {frmRegProduccion},
  UFormPanProcesoProduccionEmp in '..\fuentes\UFormPanProcesoProduccionEmp.pas' {frmProcProdEmpleados},
  URepProdPanEmpleados in '..\fuentes\..\Reportes\URepProdPanEmpleados.pas' {qckRepProdEmpleadosPan: TQuickRep},
  URepComprobanteNuevo in '..\fuentes\..\Reportes\URepComprobanteNuevo.pas' {qckRepReciboNuevo: TQuickRep},
  URepComprobanteFix in '..\fuentes\URepComprobanteFix.pas' {qckRepReciboFix: TQuickRep},
  UFormMantBlcCteCxc in '..\fuentes\UFormMantBlcCteCxc.pas' {frmActBlcCteCxc},
  UFormMantBlcCteCxp in '..\fuentes\UFormMantBlcCteCxp.pas' {frmActBlcCteCxp},
  UFormRegDesembolsoCaja in '..\fuentes\UFormRegDesembolsoCaja.pas' {frmDesembolsos},
  URegInvFisicoPan in '..\fuentes\URegInvFisicoPan.pas' {frmRegInvFisicoPan},
  URepInvFisicoPan in '..\fuentes\URepInvFisicoPan.pas' {qckRepInvFisicoPan: TQuickRep},
  UClasificacionN in '..\fuentes\UClasificacionN.pas' {frmClasifNomina},
  UFormRegServicio in '..\fuentes\UFormRegServicio.pas' {frmRegServicioLavanderia},
  UqckRepComprobanteLav in '..\fuentes\UqckRepComprobanteLav.pas' {qckRepComprobanteLav: TQuickRep},
  UFormConfServCafeteria in '..\fuentes\UFormConfServCafeteria.pas' {frmConfServCafeteria},
  UFormVerIngredientes in '..\fuentes\UFormVerIngredientes.pas' {frmVerIngredientes},
  UFormRepTransIngCaf in '..\fuentes\UFormRepTransIngCaf.pas' {qckRepTransIngCaf: TQuickRep},
  UProcVentaRapidaOrdComp in '..\fuentes\UProcVentaRapidaOrdComp.pas' {frmProcOrdCompraN},
  UFormBackup in '..\fuentes\UFormBackup.pas' {frmBackup},
  URegContactoCtes in '..\fuentes\URegContactoCtes.pas' {frmRegContactos},
  URepContactoCte in '..\fuentes\URepContactoCte.pas' {qckRepContactoCte: TQuickRep},
  UFormDatosFamilia in '..\fuentes\UFormDatosFamilia.pas' {frmFamila},
  UFormCursos in '..\fuentes\UFormCursos.pas' {frmCursos},
  UFormAnioEscolar in '..\fuentes\UFormAnioEscolar.pas' {frmAnoEscolar},
  URepQckRelacionFactCxcDet in '..\fuentes\URepQckRelacionFactCxcDet.pas' {qckRepRelacionFactCxcDet: TQuickRep},
  UQckRepListadoEstudiantes in '..\fuentes\UQckRepListadoEstudiantes.pas' {qckRepListaEstudiantes: TQuickRep},
  UFormMantPrecioColegio in '..\fuentes\UFormMantPrecioColegio.pas' {frmPrecioXNivelColegio},
  UFormMensualidadEstudiantes in '..\fuentes\UFormMensualidadEstudiantes.pas' {frmMensualidadEstudiantes},
  UformEstadoCtaEstudiantes in '..\fuentes\UformEstadoCtaEstudiantes.pas' {frmEstadoCtaMensEstu},
  URepEstadoAtrasoCXCEstColegio in '..\fuentes\URepEstadoAtrasoCXCEstColegio.pas' {qckRepAtrasoEstColegio: TQuickRep},
  UFormCobroEstudiantes in '..\fuentes\UFormCobroEstudiantes.pas' {frmCobroEstudiantes},
  URepIngCobroMensualidadEst in '..\fuentes\URepIngCobroMensualidadEst.pas' {qckRepIngCobroMensEst: TQuickRep},
  UFormBuscarDatosEstudiantes in '..\fuentes\UFormBuscarDatosEstudiantes.pas' {frmBuscarEstudiantes},
  URepListadoEstActivos in '..\fuentes\URepListadoEstActivos.pas' {qckRepEstActivos: TQuickRep},
  UReversaCobroEstudiante in '..\fuentes\UReversaCobroEstudiante.pas' {frmReversarCobroEst},
  UFormEditaReciboIngresos in '..\fuentes\UFormEditaReciboIngresos.pas' {frmEditaReciboIngresos},
  UFormQueryDataFuente in '..\fuentes\..\..\..\Comun\UFormQueryDataFuente.pas' {frmqryDatosFuente},
  Uexcel2 in '..\fuentes\..\..\..\Comun\Uexcel2.pas' {frmConsultaCustom},
  UConfDescuentoFactura in '..\fuentes\UConfDescuentoFactura.pas' {frmConfigurarDescFact},
  UFormVerDescFacturaServicio in '..\fuentes\UFormVerDescFacturaServicio.pas' {frmVerDescFactServicio},
  UQckFactServIngeservis8_5 in '..\fuentes\..\Reportes\UQckFactServIngeservis8_5.pas' {qckFactServIngeservis: TQuickRep},
  UFormTemplateFactura in '..\fuentes\UFormTemplateFactura.pas' {frmTemplateExcel},
  UFormPrecioProdPorProveedor in '..\fuentes\UFormPrecioProdPorProveedor.pas' {frmListadoCostoProdProveedor},
  UFormFacturas in '..\fuentes\UFormFacturas.pas' {frmConsultaFacturas},
  UFormCrearXMLToExportExcel in '..\fuentes\UFormCrearXMLToExportExcel.pas' {frmExportarRepXML},
  UQckFactServIngeservis8_5_N in '..\fuentes\..\Reportes\UQckFactServIngeservis8_5_N.pas' {qckFactServIngeservis_N: TQuickRep},
  UFormGetNumFctAExportarExcel in '..\fuentes\UFormGetNumFctAExportarExcel.pas' {frmGetNumFactExpExcel},
  UEXPORTFACTTOXML in '..\fuentes\UEXPORTFACTTOXML.pas',
  UQckFactServIngeservis8_5_NCotiza in '..\fuentes\..\Reportes\UQckFactServIngeservis8_5_NCotiza.pas' {qckFactServIngeservis_NCotiza: TQuickRep},
  UFormRetencionesTercero in '..\fuentes\UFormRetencionesTercero.pas' {frmRetencionestercero},
  UQckFactServIngeservis8_5_NConduce in '..\fuentes\..\Reportes\UQckFactServIngeservis8_5_NConduce.pas' {qckFactServIngeservis_NConduce: TQuickRep},
  UFormConsignacion in '..\fuentes\UFormConsignacion.pas' {frmConsignacion},
  UQckFactServIngeservis8_5_NConsigna in '..\fuentes\..\Reportes\UQckFactServIngeservis8_5_NConsigna.pas' {qckFactServIngeservis_NConsigna: TQuickRep},
  UFormDatosConsigna in '..\fuentes\UFormDatosConsigna.pas' {frmConsultaConsignaciones},
  UFormIngChequesDet in '..\fuentes\UFormIngChequesDet.pas' {frmDatosIngCheque},
  UQckFactServArtioficce8_5 in '..\fuentes\..\Reportes\UQckFactServArtioficce8_5.pas' {qckFactServArtioffice8_5: TQuickRep},
  UQckFactServIngeservis8_5_NCotizaN in '..\fuentes\..\Reportes\UQckFactServIngeservis8_5_NCotizaN.pas' {qckFactServIngeservis_NCotizaN: TQuickRep},
  UQckCotiza8_5_F_1 in '..\fuentes\..\Reportes\UQckCotiza8_5_F_1.pas' {qckCotiza8_5_F_1: TQuickRep},
  UQckCotiza8_5_F_2 in '..\fuentes\..\Reportes\UQckCotiza8_5_F_2.pas' {qckCotiza8_5_F_2: TQuickRep},
  UQckFactCredArtioffice8_5_F_1 in '..\fuentes\..\Reportes\UQckFactCredArtioffice8_5_F_1.pas' {qckFactCredArtioffice8_5_F_1: TQuickRep},
  UQckCotiza8_5_F_1_IDESI in '..\fuentes\..\Reportes\UQckCotiza8_5_F_1_IDESI.pas' {qckCotiza8_5_F_1IDESI: TQuickRep},
  UDetalleFormaDePago in '..\fuentes\UDetalleFormaDePago.pas' {frmAceptaDetalleFormaPago},
  UFormRecibirOrdenes in '..\fuentes\UFormRecibirOrdenes.pas' {frmRecibirOrdenes},
  URepReciboIngresoAI in '..\fuentes\..\Reportes\URepReciboIngresoAI.pas' {qckReciboIngresoAI: TQuickRep},
  UQckRepCotizaXVendedor in '..\fuentes\..\Reportes\UQckRepCotizaXVendedor.pas' {qckRepCotizacionXVend: TQuickRep},
  UFormModificaCotiza in '..\fuentes\UFormModificaCotiza.pas',
  UFormCrearOrdenCompra in '..\fuentes\UFormCrearOrdenCompra.pas' {frmCrearOrdenCompra},
  UQckOrdenCompraNew in '..\fuentes\..\Reportes\UQckOrdenCompraNew.pas' {qckOrdenDeCompraNew: TQuickRep},
  UProcesarDevolucion in '..\fuentes\UProcesarDevolucion.pas',
  UFormDescAdicional in '..\fuentes\UFormDescAdicional.pas' {frmDescripcionAdicional},
  uSortData in '..\fuentes\uSortData.pas',
  UFormRegServicioTaller in '..\fuentes\UFormRegServicioTaller.pas' {frmRegServicioTaller},
  UQckRepServDetalle in '..\fuentes\UQckRepServDetalle.pas' {qckRepServicioTaller: TQuickRep},
  ImageWin in '..\fuentes\ImageWin.pas' {ImageForm},
  ViewWin in '..\fuentes\ViewWin.pas' {ViewForm},
  UTasaDolar in '..\fuentes\UTasaDolar.pas' {frmMoneda},
  UDatosCambioTasa in '..\fuentes\UDatosCambioTasa.pas' {frmDatosCambioTasa},
  UFormShowImagen in '..\fuentes\UFormShowImagen.pas' {frmShowImages},
  UFormDistribuirPgoVenta in '..\fuentes\UFormDistribuirPgoVenta.pas' {frmDistribuirPgoVenta},
  UFormIngDetBonos in '..\fuentes\UFormIngDetBonos.pas' {frmDetallesIngEnBonos},
  UFormCrearSolOrdenCompra in '..\fuentes\UFormCrearSolOrdenCompra.pas' {frmCrearSolicitudOrdenCompra},
  UFormImpSolordenCotizacion in '..\fuentes\UFormImpSolordenCotizacion.pas' {frmImpSolOrden},
  UQckOrdenSolCompraNew in '..\fuentes\..\Reportes\UQckOrdenSolCompraNew.pas' {qckSolOrdenDeCompraNew: TQuickRep},
  UQckRepListaFactura in '..\fuentes\..\Reportes\UQckRepListaFactura.pas' {qckListaFactXCte: TQuickRep},
  UFormConsultaVentaXCliente in '..\fuentes\..\Reportes\UFormConsultaVentaXCliente.pas' {frmListadoVentas},
  UFormOperacionServicios in '..\fuentes\UFormOperacionServicios.pas' {frmOperacionServicios},
  URepComisionOpeServ in '..\fuentes\URepComisionOpeServ.pas' {qckRepComisionOpeServ: TQuickRep},
  UQckRepListaFacturaProducto in '..\fuentes\..\Reportes\UQckRepListaFacturaProducto.pas' {qckListaFactXCteXProducto: TQuickRep},
  UFormConsultaCotizaXCliente in '..\fuentes\..\Reportes\UFormConsultaCotizaXCliente.pas' {frmListadoCotizaciones},
  UQckRepListaCotizacion in '..\fuentes\..\Reportes\UQckRepListaCotizacion.pas' {qckListaCotizacionXCte: TQuickRep},
  UMarbetePolizaSsegPepin in '..\fuentes\..\Reportes\UMarbetePolizaSsegPepin.pas' {qckRepMarbeteSegPepin: TQuickRep},
  UFormMarcaVehiculos in '..\fuentes\..\Reportes\UFormMarcaVehiculos.pas' {frmMarcaVehiculos},
  UFormTipoVehiculo in '..\fuentes\UFormTipoVehiculo.pas' {frmTipoVehiculo},
  UQckRepVendedorFactura in '..\fuentes\..\Reportes\UQckRepVendedorFactura.pas' {qckListaFactXVendedor: TQuickRep},
  UFormConsultaVentaXVendedor in '..\fuentes\..\Reportes\UFormConsultaVentaXVendedor.pas' {frmListadoVentasXVendedor},
  UFormConsultaCotizaXVendedor in '..\fuentes\..\Reportes\UFormConsultaCotizaXVendedor.pas' {frmListadoCotizacionesXVendedor},
  UQckRepListaCotizacionXVendedor in '..\fuentes\..\Reportes\UQckRepListaCotizacionXVendedor.pas' {qckListaCotizacionXVendedor: TQuickRep},
  UQckRepListaCotizacionProducto in '..\fuentes\..\Reportes\UQckRepListaCotizacionProducto.pas' {qckListaCotizaXCteXProducto: TQuickRep},
  UFormConsultaOrden in '..\fuentes\UFormConsultaOrden.pas' {frmConsultaOrden},
  UformVendedorProveedor in '..\fuentes\UformVendedorProveedor.pas' {frmVendedorProveedor},
  URepInventarioProdReorden in '..\fuentes\..\Reportes\URepInventarioProdReorden.pas' {qckRepDatosInvReorden: TQuickRep},
  SynPdf in '..\fuentes\..\..\..\synpdf\SynPdf.pas',
  SynCommons in '..\fuentes\..\..\..\synpdf\SynCommons.pas',
  URepClientesDatosVeh in '..\fuentes\..\Reportes\URepClientesDatosVeh.pas' {qckRepDatosVehClientes: TQuickRep},
  USelClienteRepXVendedor in '..\fuentes\USelClienteRepXVendedor.pas' {frmSelRepXVendedor},
  UFormCambiarCteFact in '..\fuentes\UFormCambiarCteFact.pas' {frmCambiarCteFact},
  UFormPagosCombinados in '..\fuentes\UFormPagosCombinados.pas' {frmPagosCombinados},
  UTestImpFiscal in '..\fuentes\UTestImpFiscal.pas' {frmTestImpresoraFiscal},
  UConfCajaXusuario in '..\fuentes\UConfCajaXusuario.pas' {frmConfCajaxUsuario},
  UFormImpresora in '..\fuentes\UFormImpresora.pas' {frmImpresoraFiscal},
  UDescLineaDocfiscal in '..\fuentes\UDescLineaDocfiscal.pas' {frmConfLineaDocFiscal},
  UFrmiTipoifiscal in '..\fuentes\UFrmiTipoifiscal.pas' {frmNCFTipoIfiscal},
  UFormRegPedidoOrden in '..\fuentes\UFormRegPedidoOrden.pas' {frmPedidosProveedores},
  UFormTipoDescNomina in '..\fuentes\UFormTipoDescNomina.pas' {frmTipoDescuentoNomina},
  URepClientesCumple in '..\fuentes\..\Reportes\URepClientesCumple.pas' {qckRepClientesCumple: TQuickRep},
  UFormDescuentoNomDependiente in '..\fuentes\UFormDescuentoNomDependiente.pas' {frmProcDescDependientes},
  UFormVacaciones in '..\fuentes\UFormVacaciones.pas' {frmVacaciones},
  URepNominaGral in '..\fuentes\..\Reportes\URepNominaGral.pas' {QckRepNominaGral: TQuickRep},
  UFormParamsRepOrdComp in '..\fuentes\..\Reportes\UFormParamsRepOrdComp.pas' {frmDatosRepOrdenCompra},
  URepOrdenRecibida in '..\fuentes\..\Reportes\URepOrdenRecibida.pas' {qckRepOrdenRecibida: TQuickRep},
  UFormNominaContratista in '..\fuentes\..\Reportes\UFormNominaContratista.pas' {frmNominaContratista},
  UFormProyecto in '..\fuentes\..\Reportes\UFormProyecto.pas' {frmProyecto},
  UFormContratista in '..\fuentes\UFormContratista.pas' {frmContratistas},
  USelTipoNomIntegrarContratista in '..\fuentes\USelTipoNomIntegrarContratista.pas' {frmSelDatosIntegrarNomCont},
  URepNominaContratista in '..\fuentes\..\Reportes\URepNominaContratista.pas' {QckRepNominaContratista: TQuickRep},
  UFormTasaITBIS in '..\fuentes\..\Reportes\UFormTasaITBIS.pas' {frmTasaITBIS},
  UQckCotiServIngeservis8_5_NConduce in '..\fuentes\..\Reportes\UQckCotiServIngeservis8_5_NConduce.pas' {qckCotiServIngeservis_NConduce: TQuickRep},
  UFormSelTipoConduce in '..\fuentes\..\Reportes\UFormSelTipoConduce.pas' {frmSeleccionarTipoConduce},
  UFormGenerarConduce in '..\fuentes\..\Reportes\UFormGenerarConduce.pas' {frmGenerarConduce},
  UFormGenerarConduceFct in '..\fuentes\..\Reportes\UFormGenerarConduceFct.pas' {frmGenerarConduceFCT},
  UQckFactCredArtioffice8_5_F_1_bym in '..\fuentes\..\Reportes\UQckFactCredArtioffice8_5_F_1_bym.pas' {qckFactCredArtioffice8_5_F_1ByM: TQuickRep},
  UQckCotiza8_5_F_1ByM in '..\fuentes\..\Reportes\UQckCotiza8_5_F_1ByM.pas' {qckCotiza8_5_F_1ByM: TQuickRep},
  USelDatosReporte in '..\fuentes\USelDatosReporte.pas' {frmDatosReporte},
  UFormBuscarNCF in '..\fuentes\UFormBuscarNCF.pas' {frmBuscarNCF},
  UfrmBuscarNIF in '..\fuentes\UfrmBuscarNIF.pas' {frmBuscarNIF},
  UCoreOCXFiscal in '..\fuentes\UCoreOCXFiscal.pas',
  URepReciboIngresoByM in '..\fuentes\..\Reportes\URepReciboIngresoByM.pas' {qckReciboIngresoByM: TQuickRep},
  UVerDataImpIFiscal in '..\fuentes\UVerDataImpIFiscal.pas' {frmInfoParaTicketFiscal},
  UcheckSecNCF in '..\fuentes\UcheckSecNCF.pas' {frmCheckNCFSec},
  UFormSelTasaITBIS in '..\fuentes\UFormSelTasaITBIS.pas' {frmSelTasaITBIS},
  UFormCalculosVentaActiva in '..\fuentes\UFormCalculosVentaActiva.pas' {frmVerCalcVenta},
  UDatModCotizafiscal in '..\fuentes\UDatModCotizafiscal.pas' {dmcotizafiscal: TDataModule},
  UImprimeCotizaFiscal in '..\fuentes\UImprimeCotizaFiscal.pas',
  UDescLineaCotizacion in '..\fuentes\UDescLineaCotizacion.pas' {frmConfLineaCotizacion},
  UFormVerCierreZ in '..\fuentes\UFormVerCierreZ.pas' {frmCierreZ},
  UFormAyuda in '..\fuentes\UFormAyuda.pas' {frmAyuda},
  UProcCierreJornada in '..\fuentes\UProcCierreJornada.pas' {frmCierreJornada},
  URepVentaFiscalDet in '..\fuentes\..\Reportes\URepVentaFiscalDet.pas' {qckRepVentaFiscalDet: TQuickRep},
  UDatModCalculos in '..\fuentes\UDatModCalculos.pas' {dmCalculos: TDataModule},
  UTemporalVtaForm in '..\fuentes\UTemporalVtaForm.pas' {frmTemporalForm},
  UFormConsultaDatosVenta in '..\fuentes\UFormConsultaDatosVenta.pas' {frmConsultaDatosVenta},
  UConciliarNIF in '..\fuentes\UConciliarNIF.pas' {frmConciliarNIFvsVenta},
  UFormHistoricoCierreZ in '..\fuentes\UFormHistoricoCierreZ.pas' {frmHistoricoCierreZ},
  UDatamodulocnt in '..\fuentes\..\DmCnt\UDatamodulocnt.pas' {dmCnt: TDataModule},
  UDatmodPerm in '..\fuentes\..\DmCnt\UDatmodPerm.pas' {dmPerm: TDataModule},
  UDatModCheques in '..\fuentes\..\Cheques\UDatModCheques.pas' {dmcks: TDataModule},
  URepInventarioProdReordenxTipo in '..\fuentes\..\Reportes\URepInventarioProdReordenxTipo.pas' {qckRepDatosInvReordenXTipo: TQuickRep},
  UFormCrearNotaCRVta in '..\fuentes\UFormCrearNotaCRVta.pas' {frmCrearNotaCreditoVta},
  UFormVerDetalleVta in '..\fuentes\UFormVerDetalleVta.pas' {frmVerDet},
  UFormTipoTrnCNT in '..\fuentes\UFormTipoTrnCNT.pas' {frmTipoTrnConfig},
  UFormCheckGenerador in '..\fuentes\UFormCheckGenerador.pas' {frmCheckGenerador},
  UQckFactCredArtioffice8_5_F_1Std in '..\fuentes\..\Reportes\UQckFactCredArtioffice8_5_F_1Std.pas' {qckFactCredArtioffice8_5_F_1Std: TQuickRep},
  URepRecibo8_5_11REspinalReimp in '..\fuentes\URepRecibo8_5_11REspinalReimp.pas' {qckRepRecibo8_5_11REspReimp: TQuickRep},
  frmVerComprobantes in '..\fuentes\frmVerComprobantes.pas' {frmVerTipoComprobantes},
  UContabilizarVentasDevoluciones in '..\fuentes\UContabilizarVentasDevoluciones.pas' {frmContabilizarVtasDevol},
  UContabilizarVentasTarjeta in '..\fuentes\UContabilizarVentasTarjeta.pas' {frmContabilizarVentasTarjeta},
  UFormPuertosLibres in '..\fuentes\UFormPuertosLibres.pas' {frmPuertosLibres},
  UContabilizarCostosYGastos in '..\fuentes\UContabilizarCostosYGastos.pas' {frmContabilizarCostosYGastos},
  UFormContFacturasSuplidores in '..\fuentes\UFormContFacturasSuplidores.pas' {frmContFacturasSuplidores},
  UFormEstructuraNCFHelp in '..\fuentes\UFormEstructuraNCFHelp.pas' {frmHelpNCF},
  URepVentaDiariaGeneral in '..\fuentes\URepVentaDiariaGeneral.pas' {qckRepVentaDiariaGeneral: TQuickRep},
  UContabilizarIngresosCxc in '..\fuentes\UContabilizarIngresosCxc.pas' {frmContabilizarIngCxc},
  URepItebisResumen in '..\fuentes\URepItebisResumen.pas' {qckRepItbisResumen: TQuickRep},
  UformEmailProcess in '..\fuentes\UformEmailProcess.pas' {frmEmailProcess},
  UFormEnviarEmailLVentas in '..\fuentes\UFormEnviarEmailLVentas.pas' {frmEnviarFileLVentas},
  UEnviarEmailEstandar in '..\fuentes\UEnviarEmailEstandar.pas' {frmEnviarEmailEstandar},
  UCtrlEnvioaLavanderia in '..\fuentes\UCtrlEnvioaLavanderia.pas' {frmLavanderia},
  UFormConfReportes in '..\fuentes\UFormConfReportes.pas' {frmConfReportes},
  qckRepLavanderiaRecibo in '..\fuentes\qckRepLavanderiaRecibo.pas' {qckReciboLavanderia: TQuickRep},
  UCtrlAlquiler in '..\fuentes\UCtrlAlquiler.pas' {frmAlquiler},
  qckRepCompAlquiler in '..\fuentes\qckRepCompAlquiler.pas' {qckCompAlquiler: TQuickRep},
  qckRepCompAlquilerN in '..\fuentes\qckRepCompAlquilerN.pas' {qckCompAlquilerN: TQuickRep},
  uFormAsignarNCFVentaGastos in '..\fuentes\uFormAsignarNCFVentaGastos.pas' {frmAsignarNCFGastos},
  USeleccionarNCFGastos in '..\fuentes\USeleccionarNCFGastos.pas' {frmSelNCFGastos},
  UqckRepComprobanteTaller in '..\fuentes\UqckRepComprobanteTaller.pas' {qckRepComprobanteTaller: TQuickRep},
  UFormConsServTaller in '..\fuentes\..\Reportes\UFormConsServTaller.pas' {frmListadoServTaller},
  UQckRepServVendedor in '..\fuentes\..\Reportes\UQckRepServVendedor.pas' {qckListaServtXVendedor: TQuickRep},
  UQckCotiza8_5_FormG in '..\fuentes\..\Reportes\UQckCotiza8_5_FormG.pas' {qckCotiza8_5_FormG: TQuickRep},
  UFormConsServXTipo in '..\fuentes\..\Reportes\UFormConsServXTipo.pas' {frmListadoServXTipo},
  UQckRepServXTipo in '..\fuentes\..\Reportes\UQckRepServXTipo.pas' {qckListaServtXTipo: TQuickRep},
  URepPrecioXLevel in '..\fuentes\..\Reportes\URepPrecioXLevel.pas' {qckRepPrecioXLevel: TQuickRep},
  UFormSelTipoInv in '..\fuentes\..\Reportes\UFormSelTipoInv.pas' {frmSelTipoInv},
  UFormConsServXTipoBuscar in '..\fuentes\UFormConsServXTipoBuscar.pas' {frmListadoServXTipoBuscar},
  URepCotizacionPapel3Pulg in '..\fuentes\URepCotizacionPapel3Pulg.pas' {qckCotizacion3Pulg: TQuickRep},
  UFormPromoverEstudiantes in '..\fuentes\UFormPromoverEstudiantes.pas' {frmPromoverEstudiantes},
  URepComprobanteReimp in '..\fuentes\..\Reportes\URepComprobanteReimp.pas' {qckRepReciboReimp: TQuickRep},
  UQckCotiza8_5_F_1ByMPrefact in '..\fuentes\..\Reportes\UQckCotiza8_5_F_1ByMPrefact.pas' {qckCotiza8_5_F_1ByMPreFct: TQuickRep},
  UMembreteCia in '..\fuentes\..\Reportes\UMembreteCia.pas' {frmMembrete},
  UQckOrdenCompraNewBB in '..\fuentes\..\Reportes\UQckOrdenCompraNewBB.pas' {qckOrdenDeCompraNewBB: TQuickRep},
  UQckCotiza8_5_F_1BB in '..\fuentes\..\Reportes\UQckCotiza8_5_F_1BB.pas' {qckCotiza8_5_F_1BB: TQuickRep},
  URepReciboIngresoByB in '..\fuentes\..\Reportes\URepReciboIngresoByB.pas' {qckReciboIngresoByB: TQuickRep},
  UQckFactServ8_5BB in '..\fuentes\..\Reportes\UQckFactServ8_5BB.pas' {qckFactServ8_5BB: TQuickRep},
  qckrepEstadoCtaBB in '..\fuentes\qckrepEstadoCtaBB.pas' {qckEstadoCxcBB: TQuickRep},
  UQckRepOrdenTrabajo in '..\fuentes\UQckRepOrdenTrabajo.pas' {qckOrdenTrabajo: TQuickRep},
  UFormOrdenTrabajo in '..\fuentes\UFormOrdenTrabajo.pas' {frmOrdenTrabajo},
  UFormConsultarOrden in '..\fuentes\UFormConsultarOrden.pas' {frmConsultaOrdenes},
  URepOrdenesTrabajoBB in '..\fuentes\URepOrdenesTrabajoBB.pas' {qckRepOrdenesTrabajo: TQuickRep},
  UConsultaNCFNulos in '..\fuentes\UConsultaNCFNulos.pas' {frmConsultaNCF},
  UContRegOrdenes in '..\fuentes\UContRegOrdenes.pas' {frmContOrdenReg},
  UReporteSobreNominaEmpCont in '..\fuentes\..\Reportes\UReporteSobreNominaEmpCont.pas' {qckSobrePagoNominaCont: TQuickRep},
  UQckFactServ8_5Ayaco in '..\fuentes\..\Reportes\UQckFactServ8_5Ayaco.pas' {qckFactServ8_5Ayaco: TQuickRep},
  UCategoriaInventario in '..\fuentes\..\Reportes\UCategoriaInventario.pas' {frmCategoriaInv},
  UInventarioSubCategoria in '..\fuentes\..\Reportes\UInventarioSubCategoria.pas' {frmSubCategoriaInv},
  URepProdMasVenta in '..\fuentes\URepProdMasVenta.pas' {qckProdMasVendidos: TQuickRep},
  UFormConsultaVentaProd in '..\fuentes\UFormConsultaVentaProd.pas' {frmConsultaProdVenta},
  UFormConsultaNoVentaProd in '..\fuentes\UFormConsultaNoVentaProd.pas' {frmConsultaFechaUltmaVta},
  URepProdMasVentaFUltVta in '..\fuentes\URepProdMasVentaFUltVta.pas' {qckProdFUltVta: TQuickRep},
  URepComprobanteDevol_3Pulg in '..\fuentes\..\Reportes\URepComprobanteDevol_3Pulg.pas' {qckRepReciboDevol3Pulg: TQuickRep},
  UDatModFastFood in '..\fuentes\UDatModFastFood.pas' {dmFastfood: TDataModule},
  UFormDatosPendCrearTicket in '..\fuentes\UFormDatosPendCrearTicket.pas' {frmDatosVenta},
  URepReimpFastFoodPOS in '..\fuentes\..\Reportes\URepReimpFastFoodPOS.pas' {qckRepReciboReimpFFoodPOS: TQuickRep},
  UformOficina in '..\fuentes\..\Reportes\UformOficina.pas' {frmOficina},
  UFormCiudad in '..\fuentes\..\Reportes\UFormCiudad.pas' {frmCiudades},
  UFormPrecioXUnidadNivel in '..\fuentes\UFormPrecioXUnidadNivel.pas' {frmPrecioUnidadNivel},
  URepReimpTicketSurtidora in '..\fuentes\..\Reportes\URepReimpTicketSurtidora.pas' {qckRepReciboReimpTicketSurtidora: TQuickRep},
  UDatModDGII in '..\fuentes\UDatModDGII.pas' {dmDGII: TDataModule},
  UBuscarRazonSocialDBDgii in '..\fuentes\UBuscarRazonSocialDBDgii.pas' {frmBuscarRNC},
  UQckCotServ8_5Ayaco in '..\fuentes\..\Reportes\UQckCotServ8_5Ayaco.pas' {qckCotServ8_5Ayaco: TQuickRep},
  UFormPosExtraDET in '..\fuentes\UFormPosExtraDET.pas' {frmPosExtraDet},
  URepRecibo8_5_11REspinalReimpFFood in '..\fuentes\URepRecibo8_5_11REspinalReimpFFood.pas' {qckRepRecibo8_5_11REspReimpFFood: TQuickRep},
  UQckFactServ8_5Limao in '..\fuentes\..\Reportes\UQckFactServ8_5Limao.pas' {qckFactServ8_5Limao: TQuickRep},
  UQckFactServ8_5Surtidora in '..\fuentes\..\Reportes\UQckFactServ8_5Surtidora.pas' {qckFactServ8_5Surtidora: TQuickRep},
  UFormPagoComisionTrab in '..\fuentes\UFormPagoComisionTrab.pas' {frmComisionTrab},
  URepComisionTrab in '..\fuentes\URepComisionTrab.pas' {qckRepComisionTrab: TQuickRep},
  UCtrlEntradaSalidaInvtario in '..\fuentes\UCtrlEntradaSalidaInvtario.pas' {frmCtrlEntSalInv},
  UFormParamsRepComTrab in '..\fuentes\..\Reportes\UFormParamsRepComTrab.pas' {frmDatosRepComisiones},
  UFormInfoTasaITBIS in '..\fuentes\..\Reportes\UFormInfoTasaITBIS.pas' {frmInfoTasaItbis},
  UReipReimpFastRetailPOS in '..\fuentes\..\Reportes\UReipReimpFastRetailPOS.pas' {qckRepReciboReimpFRetailPOS: TQuickRep},
  URepRecibo8x5_5 in '..\fuentes\URepRecibo8x5_5.pas' {QCKFactRepuesto8x5_5: TQuickRep},
  UFormDatosVeh in '..\fuentes\..\Reportes\UFormDatosVeh.pas' {frmDatosVeh},
  UQckCotServ8_5AyacoRep in '..\fuentes\..\Reportes\UQckCotServ8_5AyacoRep.pas' {qckCotServ8_5AyacoRep: TQuickRep},
  URepRecibo8x5_5Conduce in '..\fuentes\URepRecibo8x5_5Conduce.pas' {QCKFactRepuesto8x5_5Conduce: TQuickRep},
  frmImprimirDoc in '..\fuentes\frmImprimirDoc.pas' {frmImprimir},
  UFormLog in '..\fuentes\UFormLog.pas' {frmLogError},
  URegFpagoVtaRep in '..\fuentes\URegFpagoVtaRep.pas' {frmFormaPagoVRep},
  qckrepEstadoCtaGeneral in '..\fuentes\qckrepEstadoCtaGeneral.pas' {qckEstadoCxcGeneral: TQuickRep},
  UCancelaReinsertaVenta in '..\fuentes\UCancelaReinsertaVenta.pas' {frmCancelaVta},
  URepDatos607 in '..\fuentes\URepDatos607.pas' {qckRepData607: TQuickRep},
  UBuscarProvConOrden in '..\fuentes\UBuscarProvConOrden.pas' {frmProcBuscarProvOrden},
  UDatModFinanzas in '..\fuentes\UDatModFinanzas.pas' {dmFinanzas: TDataModule},
  URepItebisSum in '..\fuentes\URepItebisSum.pas' {qckRepItbisSum: TQuickRep},
  qckRepTestImpresora in '..\fuentes\qckRepTestImpresora.pas' {qckRepFuenteImpresora: TQuickRep},
  specialfolders in '..\fuentes\specialfolders.pas',
  UFormOfertas in '..\fuentes\UFormOfertas.pas' {frmOfertas},
  UConfirmaConduce in '..\fuentes\UConfirmaConduce.pas' {frmConfirmaConduce},
  UQckRepConduce in '..\fuentes\UQckRepConduce.pas' {qckRepConduce: TQuickRep},
  UFormDatosOrdenConduce in '..\fuentes\UFormDatosOrdenConduce.pas' {frmDatosOrdConduce},
  UQckRepOrdenAlmacen in '..\fuentes\UQckRepOrdenAlmacen.pas' {qckRepOrdenAlmacen: TQuickRep},
  UFormGenericoImpresoras in '..\fuentes\UFormGenericoImpresoras.pas' {frmConfImpresoras},
  UQckRepOrdenAlmacenPOS in '..\fuentes\UQckRepOrdenAlmacenPOS.pas' {qckRepOrdenAlmacenPOS: TQuickRep},
  UFormCuadreConduce in '..\fuentes\UFormCuadreConduce.pas' {frmCuadraConduce},
  UFactLimao01 in '..\fuentes\UFactLimao01.pas' {qckFacturaLimao01: TQuickRep},
  UFormVocadosDet in '..\fuentes\UFormVocadosDet.pas' {frmVocadoDet},
  UQckFactServ8_5EXDMar in '..\fuentes\..\Reportes\UQckFactServ8_5EXDMar.pas' {qckFactServ8_5EXDMar: TQuickRep},
  URepCuadreCajaPOS in '..\fuentes\..\Reportes\URepCuadreCajaPOS.pas' {qckRepCuadreCajaPOS: TQuickRep},
  UFormMetasXVendedor in '..\fuentes\UFormMetasXVendedor.pas' {frmMetasXVendedor},
  UQckCotizaServ8_5EXDMar in '..\fuentes\..\Reportes\UQckCotizaServ8_5EXDMar.pas' {qckCotizaServ8_5EXDMar: TQuickRep},
  UFormMargenBeneficio in '..\fuentes\UFormMargenBeneficio.pas' {frmMargenBeneficio},
  UFormReporteVentas in '..\fuentes\UFormReporteVentas.pas' {frmReporteVentas},
  URepDepositos in '..\fuentes\URepDepositos.pas' {qckRepDeposito: TQuickRep},
  UFormMantDepositos in '..\fuentes\UFormMantDepositos.pas' {frmDepositos},
  UFormDepDesglose in '..\fuentes\UFormDepDesglose.pas' {frmDesgloseDeposito},
  UFormTipoDeposito in '..\fuentes\UFormTipoDeposito.pas' {frmTipoDeposito},
  UFormTipoCtaBanco in '..\fuentes\UFormTipoCtaBanco.pas' {frmTipoCtaBanco},
  UFormComicionesXVtaProd in '..\fuentes\UFormComicionesXVtaProd.pas' {frmComisionVtaXProd},
  URepTicketVta in '..\fuentes\URepTicketVta.pas' {qckTicketVta: TQuickRep},
  URepConduce in '..\fuentes\URepConduce.pas' {frmRepConduce},
  URepDatosConduce in '..\fuentes\URepDatosConduce.pas' {qckReporteConduce: TQuickRep},
  UFormCteXCiudad in '..\fuentes\UFormCteXCiudad.pas' {frmRepCteXCiudad},
  UFormSectores in '..\fuentes\UFormSectores.pas' {frmSectores},
  USelClienteRepXRuta in '..\fuentes\USelClienteRepXRuta.pas' {frmSelRepXRuta},
  UFormPagoComisionesXVta in '..\fuentes\UFormPagoComisionesXVta.pas' {frmPagoComisiones},
  UFormActTipoNomina in '..\fuentes\UFormActTipoNomina.pas' {frmActTipoNomina},
  URepComisionTrabXVta in '..\fuentes\URepComisionTrabXVta.pas' {qckRepComisionTrabXVta: TQuickRep},
  UFormRutaVentas in '..\fuentes\UFormRutaVentas.pas' {frmRutasVentas},
  UQckRepExistenciaVenta in '..\fuentes\UQckRepExistenciaVenta.pas' {qckRepExistenciaVenta: TQuickRep},
  UDatModVehiculo in '..\fuentes\UDatModVehiculo.pas' {dmVehiculo: TDataModule},
  UFichaVeh in '..\fuentes\UFichaVeh.pas' {FrmFichasVeh},
  UQckFactServ8_5Agua in '..\fuentes\..\Reportes\UQckFactServ8_5Agua.pas' {qckFactServ8_5Agua: TQuickRep},
  UFormDetalleAdicionalVta in '..\fuentes\UFormDetalleAdicionalVta.pas' {frmDatosAdicConduce},
  UQckRepVendedorDatCom in '..\fuentes\..\Reportes\UQckRepVendedorDatCom.pas' {qckListaFactXVendedorDatCom: TQuickRep},
  UFormSelServGastosVsVta in '..\fuentes\..\Reportes\UFormSelServGastosVsVta.pas' {frmRelGastosCostos},
  URepRelVtasGastos in '..\fuentes\..\Reportes\URepRelVtasGastos.pas' {qckRelGastosVentas: TQuickRep},
  URepComisionTrabXVtaRes in '..\fuentes\URepComisionTrabXVtaRes.pas' {qckRepComisionTrabXVtaRes: TQuickRep},
  URepFVtaCuadre in '..\fuentes\..\Reportes\URepFVtaCuadre.pas' {QckRepFVtaCuadre: TQuickRep},
  UFormConsultaVentaProductos in '..\fuentes\..\Reportes\UFormConsultaVentaProductos.pas' {frmConsultaVtaProductos},
  URepInvExistencia in '..\fuentes\URepInvExistencia.pas' {qckRepInvExistencia: TQuickRep},
  UFormRepPrecioXTipoProd in '..\fuentes\UFormRepPrecioXTipoProd.pas' {frmPrecioXTipoProd},
  URepPrecioXLevelXUnidad in '..\fuentes\..\Reportes\URepPrecioXLevelXUnidad.pas' {qckRepPrecioXLevelXUnidad: TQuickRep},
  UFormDetVtaXUsuario in '..\fuentes\UFormDetVtaXUsuario.pas' {frmVentaDetXUsuario},
  UFormEncriptarValor in '..\fuentes\UFormEncriptarValor.pas' {frmEncrypt},
  UFormEnviarEmailTest in '..\fuentes\UFormEnviarEmailTest.pas' {frmEnviarEmailTest},
  UFormConsultaVentaXRuta in '..\fuentes\..\Reportes\UFormConsultaVentaXRuta.pas' {frmListadoVentasXRuta},
  UQckRepVendedorXRuta in '..\fuentes\..\Reportes\UQckRepVendedorXRuta.pas' {qckListaFactXRuta: TQuickRep},
  URepClientesXDireccion in '..\fuentes\..\Reportes\URepClientesXDireccion.pas' {qckRepClientesXDireccion: TQuickRep},
  UFormVentaSumXRuta in '..\fuentes\UFormVentaSumXRuta.pas' {frmVentasSumXRuta},
  URepClientesXManzana in '..\fuentes\..\Reportes\URepClientesXManzana.pas' {qckRepClientesXDirCalleMEdif: TQuickRep},
  UFormConsultaCteXManzana in '..\fuentes\..\Reportes\UFormConsultaCteXManzana.pas' {frmListadoClientesDireccion},
  UFormTipoCliente in '..\fuentes\UFormTipoCliente.pas' {frmTipoCliente},
  UFormFiltrarTasaItbis in '..\fuentes\UFormFiltrarTasaItbis.pas' {frmFiltrarTasaItbis},
  UFormDatosProdControlados in '..\fuentes\UFormDatosProdControlados.pas' {frmMedicamentoDNCD},
  UFormARS in '..\fuentes\UFormARS.pas' {frmARS},
  UFormCoberturaVtaARS in '..\fuentes\UFormCoberturaVtaARS.pas' {frmCoberturaVtaARS},
  UFormConciliarARS in '..\fuentes\UFormConciliarARS.pas' {frmConciliacionDeFctSeguro},
  ULiquidacionARS in '..\fuentes\ULiquidacionARS.pas' {frmLiquidacionARS},
  UDatModFarmacia in '..\fuentes\UDatModFarmacia.pas' {dmFarmacia: TDataModule},
  URepReimpTicketFarm_ARS in '..\fuentes\..\Reportes\URepReimpTicketFarm_ARS.pas' {qckRepReciboReimpTicketFarmaciaARS: TQuickRep},
  UFormRecordConciARS in '..\fuentes\UFormRecordConciARS.pas' {frmConcARSRRecord},
  URepFacturaARS in '..\fuentes\URepFacturaARS.pas' {qckRepFactARS: TQuickRep},
  URepReclamacionesARS in '..\fuentes\URepReclamacionesARS.pas' {qckRepReclamacionesARS: TQuickRep},
  UQckFactServ8_5_SAM in '..\fuentes\..\Reportes\UQckFactServ8_5_SAM.pas' {qckFactServ_8_5SAM: TQuickRep},
  UQckCotServ8_5SAM in '..\fuentes\..\Reportes\UQckCotServ8_5SAM.pas' {qckCotServ8_5SAM: TQuickRep},
  UFormImportPolizas in '..\fuentes\UFormImportPolizas.pas' {frmImportarPolizas},
  URepTransCostoGastos in '..\fuentes\..\Reportes\URepTransCostoGastos.pas' {qckTransCostosGastos: TQuickRep},
  UFormDatosRepCostosGastos in '..\fuentes\..\Reportes\UFormDatosRepCostosGastos.pas' {frmDatosRepCostos},
  UFormIndiqueMontoRetencion in '..\fuentes\..\Reportes\UFormIndiqueMontoRetencion.pas' {frmIndicaMontoRetencion},
  UQckFactServ8_5_Standar in '..\fuentes\..\Reportes\UQckFactServ8_5_Standar.pas' {qckFactServ_8_5Standard: TQuickRep},
  UFormFormatoTipoDoc in '..\fuentes\..\Reportes\UFormFormatoTipoDoc.pas' {frmFormatoReportes},
  UQckCotServ8_5Standar in '..\fuentes\..\Reportes\UQckCotServ8_5Standar.pas' {qckCotServ8_5Standar: TQuickRep},
  UformExpExcel in '..\fuentes\UformExpExcel.pas' {frmExportarExcel},
  UFormDealers in '..\fuentes\UFormDealers.pas' {frmDealers},
  UFormAgencias in '..\fuentes\UFormAgencias.pas' {frmAgencias},
  UFormConsultaCertificados in '..\fuentes\UFormConsultaCertificados.pas' {frmConsultaCertificados},
  UFormEnviarEmailCertificados in '..\fuentes\UFormEnviarEmailCertificados.pas' {frmEnviaEmailCertificados},
  UFormInvCertificado in '..\fuentes\UFormInvCertificado.pas' {frmInvCertificados},
  UFormReportePolizas in '..\fuentes\UFormReportePolizas.pas' {frmReportesPoliza},
  UConsultaPolizas in '..\fuentes\UConsultaPolizas.pas' {frmConsultaPolizas},
  UQckRepPolizas in '..\fuentes\UQckRepPolizas.pas' {qckRepPolizaSam: TQuickRep},
  UFormEnviarEmail in '..\fuentes\UFormEnviarEmail.pas' {frmEnviarEmail},
  UFormCertEnConsigna in '..\fuentes\UFormCertEnConsigna.pas' {frmCertAsigAgente},
  UFormCertConsignados in '..\fuentes\UFormCertConsignados.pas' {frmCertConsignados},
  URepCumpleanioCte in '..\fuentes\..\Reportes\URepCumpleanioCte.pas' {qckListadoCumpleAnio: TQuickRep},
  UQckRepComisionVtaSam in '..\fuentes\..\Reportes\UQckRepComisionVtaSam.pas' {qckRepComisionVtaSam: TQuickRep},
  UFormConfComisiones in '..\fuentes\UFormConfComisiones.pas' {frmConfComisiones},
  UFormContabilizaCheques in '..\fuentes\UFormContabilizaCheques.pas' {frmContabilizaCheques},
  UFormConfComisionEmpleados in '..\fuentes\UFormConfComisionEmpleados.pas' {frmConfComEmpleado},
  URepItbisResXDiaTipoInv in '..\fuentes\URepItbisResXDiaTipoInv.pas' {qckRepItbis_ResXDiaTipoInv: TQuickRep},
  URepItebisResumenXTipoNCF in '..\fuentes\URepItebisResumenXTipoNCF.pas' {qckRepItbisResumenXTipoNCF: TQuickRep},
  URepFVtaCuadreXCliente in '..\fuentes\..\Reportes\URepFVtaCuadreXCliente.pas' {QckRepFVtaCuadreXCte: TQuickRep},
  UBorrarNifDuplicado in '..\fuentes\UBorrarNifDuplicado.pas' {frmEliminaNIFDuplicado},
  UFormConsultaVentaXVendedorComSam in '..\fuentes\..\Reportes\UFormConsultaVentaXVendedorComSam.pas' {frmListadoVentasXVendedorComSam},
  UFormFiltrarCatInv in '..\fuentes\UFormFiltrarCatInv.pas' {frmFiltrarCategoriaInv},
  UFormCertEnCxc in '..\fuentes\UFormCertEnCxc.pas' {frmCertificadosEnCxc},
  UFormPolizasCXC in '..\fuentes\UFormPolizasCXC.pas' {frmPolizasCxc},
  UQckFactServ8_5_SAMNew in '..\fuentes\..\Reportes\UQckFactServ8_5_SAMNew.pas' {qckFactServ_8_5SAMNew: TQuickRep},
  qckRepCertificadoSAMNew in '..\fuentes\qckRepCertificadoSAMNew.pas' {qckCertificadoSamNew: TQuickRep},
  UFormReclamaciones in '..\fuentes\UFormReclamaciones.pas' {frmReclamaciones},
  UFormTipoAfiliacion in '..\fuentes\UFormTipoAfiliacion.pas' {frmTipoAfiliacion},
  UDatModCobertura in '..\fuentes\UDatModCobertura.pas' {dmCobertura: TDataModule},
  UFormCoberturaSam in '..\fuentes\UFormCoberturaSam.pas' {frmCobertura},
  UFormLogoTipoAfiliado in '..\fuentes\UFormLogoTipoAfiliado.pas' {frmLogoTipoAfiliado},
  UQckFactServ8_5_SAMNewM in '..\fuentes\..\Reportes\UQckFactServ8_5_SAMNewM.pas' {qckFactServ_8_5SAMNewM: TQuickRep},
  URepConduceECom in '..\fuentes\URepConduceECom.pas' {qckRepConduceECom: TQuickRep},
  UFactFormatoECom in '..\fuentes\..\Reportes\UFactFormatoECom.pas' {QckFactServ_8_5ECom: TQuickRep},
  UCtrlEquipoRMA in '..\fuentes\UCtrlEquipoRMA.pas' {frmRMA},
  qckRepREMAComprobante in '..\fuentes\qckRepREMAComprobante.pas' {qckRMAComprobante: TQuickRep},
  UQckRepEquipos in '..\fuentes\UQckRepEquipos.pas' {qckRepEquipos: TQuickRep},
  UFormRepEquipos in '..\fuentes\UFormRepEquipos.pas' {frmReporteEquipos},
  URepReciboIngGen in '..\fuentes\..\Reportes\URepReciboIngGen.pas' {qckReciboIngresoGen: TQuickRep},
  UFormBuscarSerie in '..\fuentes\..\Reportes\UFormBuscarSerie.pas' {frmBuscarSerie},
  UFormFactRecurrentes in '..\fuentes\UFormFactRecurrentes.pas' {frmGenFactRecurrentes},
  URepReciboIngGenPOS in '..\fuentes\URepReciboIngGenPOS.pas' {qckReciboIngresoGenPOS: TQuickRep},
  UFormConsultaTransf in '..\fuentes\UFormConsultaTransf.pas' {frmConsultaTransf},
  UFormImpFactRecurrentes in '..\fuentes\UFormImpFactRecurrentes.pas' {frmImpresionFactRecurrente},
  UFormDatosTablas in '..\fuentes\UFormDatosTablas.pas' {frmDatosTabla},
  UPrintPDFCustom in '..\fuentes\UPrintPDFCustom.pas',
  UFormInvKardex in '..\fuentes\UFormInvKardex.pas' {frmkardex},
  UFormConsultaCertAvanzado in '..\fuentes\UFormConsultaCertAvanzado.pas' {frmConsultaCertAvanzada},
  frmTransferenciasBanco in '..\fuentes\frmTransferenciasBanco.pas' {frmtransferencias},
  UFormContractWisPro in '..\fuentes\UFormContractWisPro.pas' {frmContractosWisPro},
  UFormClientWisPro in '..\fuentes\UFormClientWisPro.pas' {frmClientWisPro},
  UConfColores in '..\fuentes\UConfColores.pas' {frmcolores},
  UFormProvTarjetas in '..\fuentes\UFormProvTarjetas.pas' {frmProvTarjetas},
  UDatModBanco in '..\fuentes\UDatModBanco.pas' {dmBancos: TDataModule},
  UQckReclamaciones in '..\fuentes\UQckReclamaciones.pas' {qckReclamacion: TQuickRep},
  UFormProcCuadreCajaNew in '..\fuentes\UFormProcCuadreCajaNew.pas' {frmCuadreCajaNew},
  UFormCteDelivery in '..\fuentes\UFormCteDelivery.pas' {frmCteDelivery},
  qckRepCertificadoSAMNewP2 in '..\fuentes\qckRepCertificadoSAMNewP2.pas' {qckCertificadoSamNewP2: TQuickRep},
  UFormCambiarCtePoliza in '..\fuentes\UFormCambiarCtePoliza.pas' {frmCambiarCtePoliza},
  UFormEstatusContratos in '..\fuentes\UFormEstatusContratos.pas',
  UFormImportGMovil in '..\fuentes\UFormImportGMovil.pas' {frmImportarGarantias},
  UFormEnviarEmailCertificadosGMovil in '..\fuentes\UFormEnviarEmailCertificadosGMovil.pas' {frmEnviaEmailCertificadosGM},
  qckRepCertificadoSAMNewGM in '..\fuentes\qckRepCertificadoSAMNewGM.pas' {qckCertificadoSamNewGMovil: TQuickRep},
  UFormConsultaCertificadosGM in '..\fuentes\UFormConsultaCertificadosGM.pas' {frmConsultaCertificadosGMovil},
  UQckFactServ8_5_SAMNewMuturs in '..\fuentes\..\Reportes\UQckFactServ8_5_SAMNewMuturs.pas' {qckFactServ_8_5SAMNewMuturs: TQuickRep},
  UQckRepMotores in '..\fuentes\UQckRepMotores.pas' {qckRepMotores: TQuickRep},
  UFormBuscarMotor in '..\fuentes\UFormBuscarMotor.pas' {frmBuscarMotor},
  UFormReporteMotoresVeh in '..\fuentes\UFormReporteMotoresVeh.pas' {frmReportesVehiculos},
  UqckRepVeh in '..\fuentes\UqckRepVeh.pas' {qckRepVeh: TQuickRep},
  UFormConsVeh in '..\fuentes\UFormConsVeh.pas' {frmConsVeh},
  UFormAsignarMotores in '..\fuentes\..\..\..\Motores\Fuentes\UFormAsignarMotores.pas' {frmAsignarVeh},
  UFormInspecciones in '..\fuentes\UFormInspecciones.pas' {frmInspecciones},
  URepReimpTicketSurtidoraNew in '..\fuentes\..\Reportes\URepReimpTicketSurtidoraNew.pas' {qckRepReciboReimpTicketSurtidoraNew: TQuickRep},
  UImprimirDocs in '..\fuentes\UImprimirDocs.pas',
  UDmSistema in '..\fuentes\UDmSistema.pas' {dmSistema: TDataModule},
  UFormSistemaIdesi in '..\fuentes\UFormSistemaIdesi.pas' {frmSistemaIdesi},
  UConfirmaLicencia in '..\fuentes\UConfirmaLicencia.pas',
  URepAfiliaciones in '..\fuentes\URepAfiliaciones.pas' {frmRepInspecciones},
  URepInspecciones in '..\fuentes\..\Reportes\URepInspecciones.pas' {qckRepInspecciones: TQuickRep},
  UFormConsultaGarantias in '..\fuentes\UFormConsultaGarantias.pas' {frmConsultaGarantias},
  UFormConsultarOrdenCompra in '..\fuentes\UFormConsultarOrdenCompra.pas' {frmConsultaOrdenCompra},
  UREpListadoOrdenesCompra in '..\fuentes\UREpListadoOrdenesCompra.pas' {qckListadoOrdenesCompra: TQuickRep},
  UREpListadoOrdenesCompraRes in '..\fuentes\UREpListadoOrdenesCompraRes.pas' {qckListadoOrdenesCompraRes: TQuickRep},
  UQckFactServ8_5Farmacia in '..\fuentes\..\Reportes\UQckFactServ8_5Farmacia.pas' {qckFactServ8_5Farmacia: TQuickRep},
  URepFVtaResumen in '..\fuentes\..\Reportes\URepFVtaResumen.pas' {QckRepFVtaResumen: TQuickRep},
  UFormbuscarAfiliacion in '..\fuentes\..\Reportes\UFormbuscarAfiliacion.pas' {frmBuscarInspecciones},
  UQckCotServ8_5StandarFarmacia in '..\fuentes\..\Reportes\UQckCotServ8_5StandarFarmacia.pas' {qckCotServ8_5Farmacia: TQuickRep},
  URepReciboIngresoAIFarmacia in '..\fuentes\..\Reportes\URepReciboIngresoAIFarmacia.pas' {qckReciboIngresoAIFarmacia: TQuickRep},
  UFormConsultaRegPedido in '..\fuentes\..\Reportes\UFormConsultaRegPedido.pas' {frmConsultaRegPedido},
  UFormLote in '..\fuentes\UFormLote.pas' {frmLotes},
  qckRepCertificadoSAMNewP2GMovil in '..\fuentes\..\Reportes\qckRepCertificadoSAMNewP2GMovil.pas' {qckCertificadoSamNewP2GMovil: TQuickRep},
  UEmailTemplate in '..\fuentes\UEmailTemplate.pas' {frmEmailTemplate},
  UGarantiasEliminadas in '..\fuentes\UGarantiasEliminadas.pas' {frmRecuperaGEliminada},
  UFormHistReclUnaPoliza in '..\fuentes\UFormHistReclUnaPoliza.pas' {frmHistReclPoliza},
  UQckOrdenCompraRecibida in '..\fuentes\..\Reportes\UQckOrdenCompraRecibida.pas' {qckOrdenDeCompraRecibida: TQuickRep},
  UConvertirDBGridToHTML in '..\fuentes\..\Reportes\UConvertirDBGridToHTML.pas' {frmConvertirDbGridToHTML},
  UFormSelEstatusVeh in '..\fuentes\..\Reportes\UFormSelEstatusVeh.pas' {frmEstatusVeh},
  frmMostrarDatosCoberturaRecl in '..\fuentes\frmMostrarDatosCoberturaRecl.pas' {frmMostrarDatosdupCob},
  UFormCalcPrecioCuadros in '..\fuentes\UFormCalcPrecioCuadros.pas' {frmCalcPrecioArticulo},
  UFormDimensionProd in '..\fuentes\UFormDimensionProd.pas' {frmDimensionProd},
  UQckCotizacionOrdenTrab in '..\fuentes\UQckCotizacionOrdenTrab.pas' {qckRepOrdenComp: TQuickRep},
  UProcesarIngresoCxc in '..\fuentes\UProcesarIngresoCxc.pas' {frmProcPagoCxc},
  UFormPrepago in '..\fuentes\UFormPrepago.pas' {frmProcesarPrepago},
  UQckComprobantePrepago in '..\fuentes\UQckComprobantePrepago.pas' {qckComprobanteAbonoPrep: TQuickRep},
  UConsultaReordenProdProv in '..\fuentes\UConsultaReordenProdProv.pas' {frmConsultaReordenInvXProv},
  UFormRepTipoXInv in '..\fuentes\UFormRepTipoXInv.pas' {frmRepTipoXInv},
  URepInventarioProdReordenxTipoCosto in '..\fuentes\..\Reportes\URepInventarioProdReordenxTipoCosto.pas' {qckRepDatosInvReordenXTipoCosto: TQuickRep},
  UfrmInvPrecioAudit in '..\fuentes\UfrmInvPrecioAudit.pas' {frmInvPrecioAudit},
  UFormfrmHistVentasInv in '..\fuentes\UFormfrmHistVentasInv.pas' {frmHistVentasInv},
  UfrmVtasHistInv in '..\fuentes\UfrmVtasHistInv.pas' {frmVtasHistInv},
  UFormAsignarNCFAVenta in '..\fuentes\UFormAsignarNCFAVenta.pas' {frmAsignarNCFAVenta},
  UFormUpdateMontopagado in '..\fuentes\UFormUpdateMontopagado.pas' {frmUpdateMontopago},
  UQckRepCodigoBarras in '..\fuentes\..\Reportes\UQckRepCodigoBarras.pas' {qckCodigoBarraProd: TQuickRep},
  UformVerificarVntas in '..\fuentes\UformVerificarVntas.pas' {frmVerificarValoresVta},
  UformVerificarVntasPagos in '..\fuentes\UformVerificarVntasPagos.pas' {frmVerificarValoresVtaPago},
  UImprimirzebralabel in '..\fuentes\UImprimirzebralabel.pas' {frmImpZebraLabel},
  ULabelImpCodBarraRefactored in '..\fuentes\ULabelImpCodBarraRefactored.pas' {frmCodigoBarraNew},
  UFormAuditoriaBlcCxc in '..\fuentes\UFormAuditoriaBlcCxc.pas' {frmAuditoriaBlcCxc},
  UFormAplicarDbCrCxc in '..\fuentes\UFormAplicarDbCrCxc.pas' {frmAplicarDbCrCxc},
  UFormCiudadesECF in '..\fuentes\UFormCiudadesECF.pas' {frmciudadesecf},
  URepVentaDiariaNuevo in '..\fuentes\URepVentaDiariaNuevo.pas' {qckRepVentaDiariaNuevo: TQuickRep},
  UFormAuditoriaInv in '..\fuentes\UFormAuditoriaInv.pas' {frmAuditoriaInv},
  UFormCuadraEfeFondoCaja in '..\fuentes\UFormCuadraEfeFondoCaja.pas' {frmCuadreEfeFondoCaja},
  URepCuadreFondoCajaPOS in '..\fuentes\..\Reportes\URepCuadreFondoCajaPOS.pas' {qckRepCuadreFondoCajaPOS: TQuickRep},
  FacturaElectronicaUnit in '..\fuentes\FacturaElectronicaUnit.pas',
  URepVentaDiariaNuevoR in '..\fuentes\URepVentaDiariaNuevoR.pas' {qckRepVentaDiariaNuevoRev: TQuickRep},
  UFormProgressBarfRM in '..\fuentes\UFormProgressBarfRM.pas' {frmProgressbarfrm},
  URepVentaDiariaResumen in '..\fuentes\URepVentaDiariaResumen.pas' {qckRepVentaDiariaResumen: TQuickRep},
  UDatModLavanderia in '..\fuentes\UDatModLavanderia.pas' {dmLavanderia: TDataModule},
  UFrmOrdenLavanderia in '..\fuentes\UFrmOrdenLavanderia.pas' {frmOrdenLavanderia},
  UqrOrdenLavanderia in '..\fuentes\UqrOrdenLavanderia.pas' {qrOrdenLavanderia: TQuickRep},
  DelphiZXingQRCode in '..\fuentes\DelphiZXingQRCode.pas',
  UQckStickerprendalavanderia in '..\fuentes\UQckStickerprendalavanderia.pas' {qckstickerprenda: TQuickRep},
  frmEntregaOrdenLavanderia in '..\fuentes\frmEntregaOrdenLavanderia.pas' {frmEntregarOrdenLavanderia},
  qrReciboPagoLavanderia in '..\fuentes\qrReciboPagoLavanderia.pas' {qckrReciboPagoLavanderia: TQuickRep},
  UnitFrmConfigEndpoints in '..\fuentes\UnitFrmConfigEndpoints.pas',
  UDatModFacturaElectronica in '..\fuentes\UDatModFacturaElectronica.pas' {dmFactElectronica: TDataModule},
  UfrmValidaFactura in '..\fuentes\UfrmValidaFactura.pas' {frmValidaFactura},
  TestMainUnit in '..\fuentes\..\TestUnit\TestMainUnit.pas' {TestForm},
  UImpresionVentas in '..\fuentes\UImpresionVentas.pas',
  UUtilecf in '..\fuentes\UUtilecf.pas',
  UUtilecftimbre in '..\fuentes\UUtilecftimbre.pas',
  UPrintDevolucion in '..\fuentes\UPrintDevolucion.pas',
  UDlgMotivoNCR in '..\fuentes\UDlgMotivoNCR.pas' {frmMotivoNCR},
  UfrmlECF_TIMBRE_LOG in '..\fuentes\UfrmlECF_TIMBRE_LOG.pas' {frmConsultaTimbreEcf},
  UFrmEditProvinciaMunicipio in '..\fuentes\UFrmEditProvinciaMunicipio.pas' {frmEditProvinciaMunicipio},
  UfrmConciliareCFConDGII in '..\fuentes\UfrmConciliareCFConDGII.pas' {frmConciliareCFConDGII},
  UFormAsignareCFAVentasSineCF in '..\fuentes\UFormAsignareCFAVentasSineCF.pas' {frmAsignareCFAVtasGen},
  UModoConsumoToCredito in '..\fuentes\UModoConsumoToCredito.pas' {frmModoConsumoToCredito},
  UFormNCFAsignados in '..\fuentes\UFormNCFAsignados.pas' {frmNCFAsignados},
  UTicketCustomSize in '..\fuentes\..\Reportes\UTicketCustomSize.pas',
  UDgiiRncClient in '..\fuentes\..\..\Comun\UDgiiRncClient.pas',
  UQrJpgHelper in '..\fuentes\UQrJpgHelper.pas',
  USetClaveMaestra in '..\fuentes\USetClaveMaestra.pas' {frmConfClaveMaestra},
  UFrmFpVerify in '..\fuentes\DigPers\UFrmFpVerify.pas' {FrmFpVerify},
  UFingerprintIBX in '..\fuentes\DigPers\UFingerprintIBX.pas',
  UFingerprintTaskAuth in '..\fuentes\DigPers\UFingerprintTaskAuth.pas',
  UFingerprintTypes in '..\fuentes\DigPers\UFingerprintTypes.pas',
  UFrmFpEnroll in '..\fuentes\DigPers\UFrmFpEnroll.pas' {FrmFpEnroll},
  UVarBytes in '..\fuentes\DigPers\UVarBytes.pas',
  UFrmOrders2EcfRunner in '..\fuentes\UFrmOrders2EcfRunner.pas' {frmOrders2EcfRunner},
  UFormSecFact in '..\fuentes\UFormSecFact.pas' {frmSecuenciaFct},
  UFrmOrderFilePicker in '..\fuentes\UFrmOrderFilePicker.pas' {frmOrderFilePicker},
  UFacturaTxtBuilder in '..\fuentes\UFacturaTxtBuilder.pas',
  UFacturaTxtEcfFlow in '..\fuentes\UFacturaTxtEcfFlow.pas',
  UQckRepCartaRutaVehTpl in '..\fuentes\UQckRepCartaRutaVehTpl.pas' {qckCartaRutaVehTpl: TQuickRep},
  UFrmCartaRutaTemplate in '..\fuentes\UFrmCartaRutaTemplate.pas' {frmCartaRutaTemplate},
  USincronizarTablaInv in '..\fuentes\USincronizarTablaInv.pas',
  USincronizarPrecioUnidadSurtidora in '..\fuentes\USincronizarPrecioUnidadSurtidora.pas',
  URegDatAdicionales in '..\fuentes\URegDatAdicionales.pas' {frmDatosAdicRegalia},
  UProyeccionRegalia in '..\fuentes\UProyeccionRegalia.pas' {frmProyeccionRegPascual},
  UElijeTipockReg in '..\fuentes\UElijeTipockReg.pas' {frmElijeBcoCksReg},
  URepProyRegalia in '..\fuentes\..\Reportes\URepProyRegalia.pas' {qckProyRegalia: TQuickRep},
  UChequesRegalia in '..\fuentes\..\Reportes\UChequesRegalia.pas' {frmCksRegalia},
  URepCksNomPer in '..\fuentes\..\Reportes\URepCksNomPer.pas' {QckRepCksNomPer: TQuickRep},
  UImpChequesNomina in '..\fuentes\UImpChequesNomina.pas' {FrmImpcksNomina},
  UVercksDanados in '..\fuentes\UVercksDanados.pas' {frmCksDaniados},
  URepCksProg in '..\fuentes\URepCksProg.pas' {QckRepCksProg: TQuickRep},
  UCksRegalia in '..\fuentes\..\Reportes\UCksRegalia.pas' {qckCksRegalia: TQuickRep},
  UReptEmpleados in '..\fuentes\UReptEmpleados.pas',
  ReportePersonalSimple in '..\fuentes\..\Reportes\ReportePersonalSimple.pas' {QckReporteGralSimple: TQuickRep},
  ReportePersonalXDepto in '..\fuentes\..\Reportes\ReportePersonalXDepto.pas' {QckReporteGralXDepto: TQuickRep},
  URepNFISFN in '..\fuentes\..\Reportes\URepNFISFN.pas' {qckRepPerNFSFN: TQuickRep},
  URepListadoNomina in '..\fuentes\..\Reportes\URepListadoNomina.pas' {qckListadoNomina: TQuickRep},
  URepListadoNominaB in '..\fuentes\..\Reportes\URepListadoNominaB.pas' {qckListadoNominaB: TQuickRep},
  UOrdenDespEmpleados in '..\fuentes\UOrdenDespEmpleados.pas' {frmOrdEmpleados},
  UListFirmOrdEmp in '..\fuentes\UListFirmOrdEmp.pas' {qckListFirmOrdComp: TQuickRep},
  URepOrdenComp in '..\fuentes\..\Reportes\URepOrdenComp.pas' {qckOrdenComp: TQuickRep},
  UCreditosFrmCoop in '..\fuentes\UCreditosFrmCoop.pas' {frmCreditosCoop},
  UTipoOrdEmpCoop in '..\fuentes\UTipoOrdEmpCoop.pas' {frmTipoOrdEmpCoop},
  UFrmbrowseDatosNomina in '..\fuentes\UFrmbrowseDatosNomina.pas' {frmDatosNomina},
  UImportarDatosTSS in '..\fuentes\UImportarDatosTSS.pas' {frmExportarDatosTSS},
  UFrmTssExportCenter in '..\fuentes\UFrmTssExportCenter.pas' {frmTssExportCenter},
  URepBonifica in '..\fuentes\URepBonifica.pas' {qckboni: TQuickRep},
  UCalculoBonificaciones in '..\fuentes\UCalculoBonificaciones.pas' {frmCalculoBonificaciones},
  UFrmTssNovedadManual in '..\fuentes\UFrmTssNovedadManual.pas' {frmTssNovedadManual},
  UFrmEmpleadoPensionAlimenticia in '..\fuentes\UFrmEmpleadoPensionAlimenticia.pas' {frmEmpleadoPensionAlimenticia},
  UNOmHistorico in '..\fuentes\UNOmHistorico.pas' {frmNOmHistorico},
  URepIR13 in '..\Reportes\URepIR13.pas' {qckRepIR13: TQuickRep}

{$E exe}

{$R PointSaleSoft.res}

procedure ShutdownTrace(const S: string);
var
  F: TextFile;
  FileName: string;
begin
  try
    FileName := ExtractFilePath(ParamStr(0)) + 'shutdown_trace.txt';
    AssignFile(F, FileName);

    if FileExists(FileName) then
      Append(F)
    else
      Rewrite(F);

    try
      Writeln(F, FormatDateTime('yyyy-mm-dd hh:nn:ss.zzz', Now) + ' | ' + S);
    finally
      CloseFile(F);
    end;
  except
    { Nunca levantar error desde el logger de cierre }
  end;
end;

procedure PrepareComponentForShutdown(AOwner: TComponent);
var
  I: Integer;
  C: TComponent;
  DS: TDataSet;
  SRC: TDataSource;
  TMR: TTimer;
  TR: TIBTransaction;
begin
  if AOwner = nil then
    Exit;

  ShutdownTrace('PREPARE BEGIN: ' + AOwner.Name + ' / ' + AOwner.ClassName);

  for I := AOwner.ComponentCount - 1 downto 0 do
  begin
    C := AOwner.Components[I];

    if C = nil then
      Continue;

    ShutdownTrace('  CHILD: ' + C.Name + ' / ' + C.ClassName);

    try
      if C is TTimer then
      begin
        TMR := TTimer(C);
        TMR.Enabled := False;
        ShutdownTrace('  TIMER OFF: ' + C.Name);
      end;

      if C is TDataSource then
      begin
        SRC := TDataSource(C);
        SRC.OnDataChange := nil;
        SRC.OnStateChange := nil;
        SRC.OnUpdateData := nil;
        SRC.DataSet := nil;
        ShutdownTrace('  DATASOURCE DETACHED: ' + C.Name);
      end;

      if C is TDataSet then
      begin
        DS := TDataSet(C);

        DS.BeforeOpen := nil;
        DS.AfterOpen := nil;
        DS.BeforeClose := nil;
        DS.AfterClose := nil;
        DS.BeforeInsert := nil;
        DS.AfterInsert := nil;
        DS.BeforeEdit := nil;
        DS.AfterEdit := nil;
        DS.BeforePost := nil;
        DS.AfterPost := nil;
        DS.BeforeCancel := nil;
        DS.AfterCancel := nil;
        DS.BeforeDelete := nil;
        DS.AfterDelete := nil;
        DS.BeforeScroll := nil;
        DS.AfterScroll := nil;
        DS.OnCalcFields := nil;
        DS.OnFilterRecord := nil;
        DS.OnNewRecord := nil;

        if DS.Active then
        begin
          ShutdownTrace('  DATASET CLOSE BEGIN: ' + DS.Name + ' / ' + DS.ClassName);
          DS.DisableControls;
          try
            DS.Close;
          finally
            DS.EnableControls;
          end;
          ShutdownTrace('  DATASET CLOSE OK: ' + DS.Name);
        end;
      end;

      if C is TIBTransaction then
      begin
        TR := TIBTransaction(C);
        if TR.InTransaction then
        begin
          ShutdownTrace('  TRANSACTION ACTIVE: ' + TR.Name);
          try
            TR.Commit;
            ShutdownTrace('  TRANSACTION COMMIT OK: ' + TR.Name);
          except
            on E: Exception do
            begin
              ShutdownTrace('  TRANSACTION COMMIT FAIL: ' + TR.Name + ' -> ' + E.Message);
              try
                TR.Rollback;
                ShutdownTrace('  TRANSACTION ROLLBACK OK: ' + TR.Name);
              except
                on E2: Exception do
                  ShutdownTrace('  TRANSACTION ROLLBACK FAIL: ' + TR.Name + ' -> ' + E2.Message);
              end;
            end;
          end;
        end;
      end;

    except
      on E: Exception do
      begin
        ShutdownTrace(
          '  CHILD PREPARE FAIL: ' + C.Name + ' / ' + C.ClassName +
          ' -> ' + E.ClassName + ': ' + E.Message
        );
      end;
    end;
  end;

  ShutdownTrace('PREPARE END: ' + AOwner.Name + ' / ' + AOwner.ClassName);
end;
procedure FreeOwnedChildrenWithTrace(AOwner: TComponent);
var
  C: TComponent;
  N: string;
begin
  if AOwner = nil then
    Exit;

  ShutdownTrace('FREE CHILDREN BEGIN: ' + AOwner.Name + ' / ' + AOwner.ClassName);

  while AOwner.ComponentCount > 0 do
  begin
    C := AOwner.Components[AOwner.ComponentCount - 1];

    if C = nil then
      Break;

    N := C.Name;
    if N = '' then
      N := '(sin nombre)';

    ShutdownTrace('  CHILD FREE BEGIN: ' + N + ' / ' + C.ClassName);

    try
      C.Free;
      ShutdownTrace('  CHILD FREE OK: ' + N);
    except
      on E: Exception do
      begin
        ShutdownTrace(
          '  CHILD FREE FAIL: ' + N + ' / ' + C.ClassName +
          ' -> ' + E.ClassName + ': ' + E.Message
        );
        raise;
      end;
    end;
  end;

  ShutdownTrace('FREE CHILDREN END: ' + AOwner.Name + ' / ' + AOwner.ClassName);
end;

procedure FreeApplicationOwnedComponentsWithTrace;
var
  C: TComponent;
  N: string;
begin
  ShutdownTrace('ComponentCount inicial=' + IntToStr(Application.ComponentCount));

  while Application.ComponentCount > 0 do
  begin
    C := Application.Components[Application.ComponentCount - 1];

    if C = nil then
      Break;

    N := C.Name;
    if N = '' then
      N := '(sin nombre)';

    ShutdownTrace('FREE BEGIN: ' + N + ' / ' + C.ClassName);

    try
      PrepareComponentForShutdown(C);

      if SameText(C.Name, 'dmDatos') then
      FreeOwnedChildrenWithTrace(C);
      
      { En Delphi, Free ya lo remueve del Owner normalmente.
        Para diagnosticar, esta variante es menos agresiva. }
      C.Free;

      ShutdownTrace('FREE OK: ' + N);
    except
      on E: Exception do
      begin
        ShutdownTrace(
          'FREE FAIL: ' + N + ' / ' + C.ClassName +
          ' -> ' + E.ClassName + ': ' + E.Message
        );
        Break;
      end;
    end;
  end;

  ShutdownTrace('ComponentCount final=' + IntToStr(Application.ComponentCount));
end;

begin
  Application.Initialize;
  frmPresentacion:=TfrmPresentacion.Create(nil);
  frmPresentacion.Show;
  frmPresentacion.Update;
  Application.Title := 'Punto de Ventas';
  Application.Title:='ERP Enterprise System';
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
  Application.CreateForm(TdmDistCnt, dmDistCnt);
  Application.CreateForm(TdmTransCnt, dmTransCnt);
  Application.CreateForm(TdmEstudiante, dmEstudiante);
  Application.CreateForm(Tdmcotizafiscal, dmcotizafiscal);
  Application.CreateForm(TdmCalculos, dmCalculos);
  Application.CreateForm(TdmCnt, dmCnt);
  Application.CreateForm(TdmPerm, dmPerm);
  Application.CreateForm(Tdmcks, dmcks);
  Application.CreateForm(TdmFinanzas, dmFinanzas);
  Application.CreateForm(TdmFarmacia, dmFarmacia);
  Application.CreateForm(TdmVehiculo, dmVehiculo);
  Application.CreateForm(TdmCobertura, dmCobertura);
  Application.CreateForm(TdmBancos, dmBancos);
  Application.CreateForm(TdmSistema, dmSistema);
  Application.CreateForm(TdmLavanderia, dmLavanderia);
  Application.CreateForm(TdmFactElectronica, dmFactElectronica);
  Application.CreateForm(TfrmMenuPrincipal, frmMenuPrincipal);
  //Application.CreateForm(TqckCartaRutaVehTpl, qckCartaRutaVehTpl);
  Application.Title := 'ERP Enterprise System';
  frmPresentacion.Close;
  frmPresentacion.Free;
  frmPresentacion:=Nil;
  try
    Application.Run;
  finally                                  
    GlbCerrandoSistema := True;
    //ShutdownTrace('Application.Run retorno. Iniciando cierre controlado.');
    //FreeApplicationOwnedComponentsWithTrace;
    //ShutdownTrace('Cierre controlado terminado.');
  end;
end.


