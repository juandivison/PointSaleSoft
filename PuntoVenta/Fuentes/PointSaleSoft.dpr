program PointSaleSoft;

uses
  Forms,
  SysUtils,
  Classes,
  DB,
  ExtCtrls,
  IBDatabase,
  UGlobal in 'UGlobal.pas',
  UMenuPrincipal in 'UMenuPrincipal.pas' {frmMenuPrincipal},
  UDatosVentas in 'UDatosVentas.pas' {dmVentas: TDataModule},
  UInventarioProd in 'UInventarioProd.pas' {frmInventarioProd},
  UDatModInventario in 'UDatModInventario.pas' {dmInventario: TDataModule},
  UTipoInventario in 'UTipoInventario.pas' {frmTipoInventario},
  UInventarioHistorico in 'UInventarioHistorico.pas' {frmInventarioHist},
  UCambiarPrecios in 'UCambiarPrecios.pas' {frmCambiarPrecio},
  UDatModCxc in 'UDatModCxc.pas' {dmCxc: TDataModule},
  UDatModIngresos in 'UDatModIngresos.pas' {dmIngresos: TDataModule},
  UFormRegIngreso in 'UFormRegIngreso.pas' {frmRegIngresos},
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
  UDatmodDatosGenerales in 'UDatmodDatosGenerales.pas' {dmDatos: TDataModule},
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
  URepItbisResXDia in 'URepItbisResXDia.pas' {qckRepItbis_ResXDia: TQuickRep},
  UMostrarFinancVigente in 'UMostrarFinancVigente.pas' {frmShowFinancVigente},
  UConfigRep in 'UConfigRep.pas' {frmConfReporte},
  URepCotizacionPapel8_55 in 'URepCotizacionPapel8_55.pas' {qckCotizacion8_55: TQuickRep},
  URepRecibo8_5_11 in 'URepRecibo8_5_11.pas' {qckRepRecibo8_5_11: TQuickRep},
  USolDatos in 'USolDatos.pas' {frmSolDatos},
  UDistCuotasFinanc in 'UDistCuotasFinanc.pas' {frmDistCuotas},
  URepTarjeta_dePago in 'URepTarjeta_dePago.pas' {qckRepTarjetaDePago: TQuickRep},
  UFormAvisoAtraso in 'UFormAvisoAtraso.pas' {frmAvisoAtraso},
  UFormSelSerieProd in 'UFormSelSerieProd.pas' {frmSelSerie},
  URepReciboAbonoCXC in 'URepReciboAbonoCXC.pas' {qckReciboAbonoCXC: TQuickRep},
  URepIngresoDet in 'URepIngresoDet.pas' {qckRepTransCxc: TQuickRep},
  UFormRepXTipoInv in 'UFormRepXTipoInv.pas' {frmRepIngXTipo},
  UTransNcNbDev in 'UTransNcNbDev.pas' {frmTransCxcNCdbDev},
  UTransCxcDoc in 'UTransCxcDoc.pas' {qckRepTransCxcDoc: TQuickRep},
  UMostrarProdTranscxc in 'UMostrarProdTranscxc.pas' {frmProdTranscxc},
  uSelSingleFechaOpc in 'uSelSingleFechaOpc.pas' {frmSelSingleFechaOpc},
  UEdicionVenta in 'UEdicionVenta.pas' {frmEdicionVenta},
  UFormProcDevolucion in 'UFormProcDevolucion.pas' {frmProcVentaRapidaEdicion},
  URepComprobanteDevol in '..\Reportes\URepComprobanteDevol.pas' {qckRepReciboDevol: TQuickRep},
  UFormEntreClave in 'UFormEntreClave.pas' {frmEntrreClave},
  URepIngEfeyCxc in 'URepIngEfeyCxc.pas' {QckRepIngEfeyCxc: TQuickRep},
  URegMiscelaneos in 'URegMiscelaneos.pas' {frmConfVarios},
  ULabelImpCodBarra in 'ULabelImpCodBarra.pas' {frmCodigoBarra},
  DSim in 'DSim.pas',
  URFacturaStandarReimp in 'URFacturaStandarReimp.pas' {qckRepFacturaEstandarNewReimp: TQuickRep},
  UCobrarFacturas in 'UCobrarFacturas.pas' {frmCobrarFacturas},
  URegPedidoProv in 'URegPedidoProv.pas' {frmRegPedidoProv},
  UFormTransCxcDbCr_r in 'UFormTransCxcDbCr_r.pas' {frmTransCxcProc_R},
  UFactServicio in 'UFactServicio.pas' {qckFactServicio: TQuickRep},
  UFormServiciosFijos in 'UFormServiciosFijos.pas' {frmProgServFijos},
  UFormServFijos in 'UFormServFijos.pas' {frmServiciosReg},
  UFormSaldAntCxc in 'UFormSaldAntCxc.pas' {frmConsultaAntCxc},
  URepSaldoXAntCxc in 'URepSaldoXAntCxc.pas' {qckRepSaldoXAntCxc: TQuickRep},
  URepSaldoAntCxcRes in 'URepSaldoAntCxcRes.pas' {qckRepSaldoXantCxcRes: TQuickRep},
  UFormDatosVentaVeh in 'UFormDatosVentaVeh.pas' {frmDatosVentaVehiculos},
  URepVencimientoProd in 'URepVencimientoProd.pas' {qckRepVencimientoProd: TQuickRep},
  UIndicarLoteNum in 'UIndicarLoteNum.pas' {frmShowLote},
  UProdVencidos in 'UProdVencidos.pas' {frmProdVencidos},
  UPagarCXPFacturas in 'UPagarCXPFacturas.pas' {frmPagarCXPFacturas},
  UBuscarProveedores in 'UBuscarProveedores.pas' {frmProcBuscarProv},
  URepCompAbonoCXP in 'URepCompAbonoCXP.pas' {QckRepCompAbonoCXP: TQuickRep},
  URepEstadoCtaCxp in 'URepEstadoCtaCxp.pas' {qckRepXServCxp: TQuickRep},
  UProcCierreOfc in 'UProcCierreOfc.pas' {frmProcCierreOfc},
  UCerrarHistoriocxc in 'UCerrarHistoriocxc.pas' {frmVTrnDiaria},
  URegNumTarjetaPagoCxp in 'URegNumTarjetaPagoCxp.pas' {frmRegNumTarjeta},
  URegNumChequeCxp in 'URegNumChequeCxp.pas' {frmRegNumCheque},
  UfrmBancos in 'UfrmBancos.pas' {frmBancos},
  uFrmConsultaFactPendCxp in 'uFrmConsultaFactPendCxp.pas' {frmFactCxpPendiente},
  URepFactPendCxp in 'URepFactPendCxp.pas' {qckFactCxpPendientes: TQuickRep},
  URepFactPendCxc in 'URepFactPendCxc.pas' {qckFactPendCxc: TQuickRep},
  UfrmRelacionFact in 'UfrmRelacionFact.pas' {frmRelacionFact},
  URepQckRelacionFactCxc in 'URepQckRelacionFactCxc.pas' {qckRepRelacionFactCxc: TQuickRep},
  URepItebis_esp in 'URepItebis_esp.pas' {qckRepItbis_esp: TQuickRep},
  UReciboPuntoVenta in 'UReciboPuntoVenta.pas' {qckReciboPuntoVenta: TQuickRep},
  URepRecibo8_5_11Devol in 'URepRecibo8_5_11Devol.pas' {qckRepRecibo8_5_11Devol: TQuickRep},
  UFormCaja in 'UFormCaja.pas' {frmCaja},
  UFormTransCaja in 'UFormTransCaja.pas' {frmTransCaja},
  UCargosEmp in 'UCargosEmp.pas' {frmCargo},
  UFormTurno in 'UFormTurno.pas' {frmTurno},
  UFrmConsultaCuadreCaja in 'UFrmConsultaCuadreCaja.pas' {frmConsultaDatosCCaja},
  URepCuadreCaja in 'URepCuadreCaja.pas' {qckRepCuadreCaja: TQuickRep},
  UConsultaPrecio in 'UConsultaPrecio.pas' {frmConsultaPrecio},
  UFormMostrarTodoInventario in 'UFormMostrarTodoInventario.pas' {frmMostrarTodo},
  URepInvProdCosto in 'URepInvProdCosto.pas' {qckInvProdCosto: TQuickRep},
  USelInventario in 'USelInventario.pas' {frmSelInventario},
  UFromDespachoInvAlmacen in 'UFromDespachoInvAlmacen.pas' {frmDespachoInvAlmacen},
  UClasifPrecio in 'UClasifPrecio.pas' {frmTipoPrecio},
  UDivisionInventario in 'UDivisionInventario.pas' {frmDivisionInv},
  URepInventarioProdArea in '..\Reportes\URepInventarioProdArea.pas' {qckRepDatosInventarioXarea: TQuickRep},
  UQckReporteFacturaDespA in '..\Reportes\UQckReporteFacturaDespA.pas' {qckFacturaDespA: TQuickRep},
  UFormUnidades in 'UFormUnidades.pas' {frmUnidades},
  UCtrlEnvioaReparaciones in 'UCtrlEnvioaReparaciones.pas' {frmReparaciones},
  qckRepReparacionRecibo in 'qckRepReparacionRecibo.pas' {qckReciboReparacion: TQuickRep},
  UDatModDistCNT in 'UDatModDistCNT.pas' {dmDistCnt: TDataModule},
  UViewCtaCatalogo in 'UViewCtaCatalogo.pas' {frmViewCtaCatalogo},
  UDistCtaCnt in 'UDistCtaCnt.pas' {frmDistCtaCnt},
  UContabilizarformBase in 'UContabilizarformBase.pas' {frmContabilizaDatos},
  UDatModTransCnt in 'UDatModTransCnt.pas' {dmTransCnt: TDataModule},
  UContabilizarVentas in 'UContabilizarVentas.pas' {frmContabilizarVentas},
  UFromContCtas in 'UFromContCtas.pas' {frmDistCtaCntNuevo},
  UGrupoCnt in 'UGrupoCnt.pas' {frmGrupocnt},
  URepMvCtaCntDet in 'URepMvCtaCntDet.pas' {qckListMvCtacntDet: TQuickRep},
  URepListadoACnt in 'URepListadoACnt.pas' {qckListadoAcnt: TQuickRep},
  UDistCntGestorProd in 'UDistCntGestorProd.pas' {frmPrepararDatosCnt},
  UEditarPedidos in 'UEditarPedidos.pas' {frmEditarPedido},
  URepFacturaPuntoVenta in 'URepFacturaPuntoVenta.pas' {qckRepFactPuntoVenta: TQuickRep},
  URegOrdenCompra in 'URegOrdenCompra.pas' {frmRegOrdenCompra},
  UFormOrdenCompraR in 'UFormOrdenCompraR.pas' {frmOrdenCompraR},
  URepOrdenCompra in 'URepOrdenCompra.pas' {qckRepOrdenCompra: TQuickRep},
  UFormImpordenCompras in 'UFormImpordenCompras.pas' {frmImpOrden},
  UFormTipoNomina in 'UFormTipoNomina.pas' {frmTipoNomina},
  UDatosTempEscalaIsr in 'UDatosTempEscalaIsr.pas' {frmDatosTempEscalaIsr},
  UEscalaISR in 'UEscalaISR.pas' {frmEscalaIsr},
  UFechaFinEscalaIsr in 'UFechaFinEscalaIsr.pas' {frmFechaEscalaFinIsr},
  URepInventarioProdSerie in '..\Reportes\URepInventarioProdSerie.pas' {qckRepDatosInventarioSerie: TQuickRep},
  URepRecibo8_5_11REspinal in 'URepRecibo8_5_11REspinal.pas' {qckRepRecibo8_5_11REsp: TQuickRep},
  URepRecibo8_5_11DevolREspinal in 'URepRecibo8_5_11DevolREspinal.pas' {qckRepRecibo8_5_11DevolResp: TQuickRep},
  URFacturaStandarReimpREsp in 'URFacturaStandarReimpREsp.pas' {qckRepFacturaEstandarNewReimpREsp: TQuickRep},
  UPrecioProdXUnidad in 'UPrecioProdXUnidad.pas' {frmPrecioProdXUnidad},
  URepComprobante_II in 'URepComprobante_II.pas' {qckRepReciboNew: TQuickRep},
  UFormReferenciaClientes in 'UFormReferenciaClientes.pas' {frmReferenciaClientes},
  URepInvMargenGananciaXProd in 'URepInvMargenGananciaXProd.pas' {qckRepMargenBeneficio: TQuickRep},
  URepInvMargenGananciaXVenta in 'URepInvMargenGananciaXVenta.pas' {qckRepMargenBeneficioVenta: TQuickRep},
  URepFinanciamientos in 'URepFinanciamientos.pas' {qckRepFinanciamientos: TQuickRep},
  UFormTransCxpDbCr_r in 'UFormTransCxpDbCr_r.pas' {frmTransCxpProc_R},
  URepPagoCxpDet in 'URepPagoCxpDet.pas' {qckRepTransCxp: TQuickRep},
  UCobrosCuotaFinanciamientos in 'UCobrosCuotaFinanciamientos.pas' {frmCobroCuotasFinanciamientos},
  UConsultaInventario in 'UConsultaInventario.pas' {frmConsultaInventario},
  UConsultaPreventa in 'UConsultaPreventa.pas' {frmConsultaPreVenta},
  UDatModEstudiante in 'UDatModEstudiante.pas' {dmEstudiante: TDataModule},
  UFormMaestroEstudiante in 'UFormMaestroEstudiante.pas' {frmMaestroEstudiante},
  UDatModPanaderia in 'UDatModPanaderia.pas' {dmPanaderia: TDataModule},
  UFormPanRecetas in 'UFormPanRecetas.pas' {frmRecetas},
  UConfigurarSkin in 'UConfigurarSkin.pas' {frmConfSkin},
  UFormRequisicion in 'UFormRequisicion.pas' {frmRequisicion},
  UFormPanRendimiento in 'UFormPanRendimiento.pas' {frmPanRendimiento},
  URepRequisicion in '..\Reportes\URepRequisicion.pas' {qckRepRequisicion: TQuickRep},
  UFormRegProduccionPan in 'UFormRegProduccionPan.pas' {frmRegProduccion},
  UFormPanProcesoProduccionEmp in 'UFormPanProcesoProduccionEmp.pas' {frmProcProdEmpleados},
  URepProdPanEmpleados in '..\Reportes\URepProdPanEmpleados.pas' {qckRepProdEmpleadosPan: TQuickRep},
  URepComprobanteNuevo in '..\Reportes\URepComprobanteNuevo.pas' {qckRepReciboNuevo: TQuickRep},
  URepComprobanteFix in 'URepComprobanteFix.pas' {qckRepReciboFix: TQuickRep},
  UFormMantBlcCteCxc in 'UFormMantBlcCteCxc.pas' {frmActBlcCteCxc},
  UFormMantBlcCteCxp in 'UFormMantBlcCteCxp.pas' {frmActBlcCteCxp},
  UFormRegDesembolsoCaja in 'UFormRegDesembolsoCaja.pas' {frmDesembolsos},
  URegInvFisicoPan in 'URegInvFisicoPan.pas' {frmRegInvFisicoPan},
  URepInvFisicoPan in 'URepInvFisicoPan.pas' {qckRepInvFisicoPan: TQuickRep},
  UClasificacionN in 'UClasificacionN.pas' {frmClasifNomina},
  UFormRegServicio in 'UFormRegServicio.pas' {frmRegServicioLavanderia},
  UqckRepComprobanteLav in 'UqckRepComprobanteLav.pas' {qckRepComprobanteLav: TQuickRep},
  UFormConfServCafeteria in 'UFormConfServCafeteria.pas' {frmConfServCafeteria},
  UFormVerIngredientes in 'UFormVerIngredientes.pas' {frmVerIngredientes},
  UFormRepTransIngCaf in 'UFormRepTransIngCaf.pas' {qckRepTransIngCaf: TQuickRep},
  UProcVentaRapidaOrdComp in 'UProcVentaRapidaOrdComp.pas' {frmProcOrdCompraN},
  UFormBackup in 'UFormBackup.pas' {frmBackup},
  URegContactoCtes in 'URegContactoCtes.pas' {frmRegContactos},
  URepContactoCte in 'URepContactoCte.pas' {qckRepContactoCte: TQuickRep},
  UFormDatosFamilia in 'UFormDatosFamilia.pas' {frmFamila},
  UFormCursos in 'UFormCursos.pas' {frmCursos},
  UFormAnioEscolar in 'UFormAnioEscolar.pas' {frmAnoEscolar},
  URepQckRelacionFactCxcDet in 'URepQckRelacionFactCxcDet.pas' {qckRepRelacionFactCxcDet: TQuickRep},
  UQckRepListadoEstudiantes in 'UQckRepListadoEstudiantes.pas' {qckRepListaEstudiantes: TQuickRep},
  UFormMantPrecioColegio in 'UFormMantPrecioColegio.pas' {frmPrecioXNivelColegio},
  UFormMensualidadEstudiantes in 'UFormMensualidadEstudiantes.pas' {frmMensualidadEstudiantes},
  UformEstadoCtaEstudiantes in 'UformEstadoCtaEstudiantes.pas' {frmEstadoCtaMensEstu},
  URepEstadoAtrasoCXCEstColegio in 'URepEstadoAtrasoCXCEstColegio.pas' {qckRepAtrasoEstColegio: TQuickRep},
  UFormCobroEstudiantes in 'UFormCobroEstudiantes.pas' {frmCobroEstudiantes},
  URepIngCobroMensualidadEst in 'URepIngCobroMensualidadEst.pas' {qckRepIngCobroMensEst: TQuickRep},
  UFormBuscarDatosEstudiantes in 'UFormBuscarDatosEstudiantes.pas' {frmBuscarEstudiantes},
  URepListadoEstActivos in 'URepListadoEstActivos.pas' {qckRepEstActivos: TQuickRep},
  UReversaCobroEstudiante in 'UReversaCobroEstudiante.pas' {frmReversarCobroEst},
  UFormEditaReciboIngresos in 'UFormEditaReciboIngresos.pas' {frmEditaReciboIngresos},
  UFormQueryDataFuente in '..\..\..\Comun\UFormQueryDataFuente.pas' {frmqryDatosFuente},
  Uexcel2 in '..\..\..\Comun\Uexcel2.pas' {frmConsultaCustom},
  UConfDescuentoFactura in 'UConfDescuentoFactura.pas' {frmConfigurarDescFact},
  UFormVerDescFacturaServicio in 'UFormVerDescFacturaServicio.pas' {frmVerDescFactServicio},
  UQckFactServIngeservis8_5 in '..\Reportes\UQckFactServIngeservis8_5.pas' {qckFactServIngeservis: TQuickRep},
  UFormTemplateFactura in 'UFormTemplateFactura.pas' {frmTemplateExcel},
  UFormPrecioProdPorProveedor in 'UFormPrecioProdPorProveedor.pas' {frmListadoCostoProdProveedor},
  UFormFacturas in 'UFormFacturas.pas' {frmConsultaFacturas},
  UFormCrearXMLToExportExcel in 'UFormCrearXMLToExportExcel.pas' {frmExportarRepXML},
  UQckFactServIngeservis8_5_N in '..\Reportes\UQckFactServIngeservis8_5_N.pas' {qckFactServIngeservis_N: TQuickRep},
  UFormGetNumFctAExportarExcel in 'UFormGetNumFctAExportarExcel.pas' {frmGetNumFactExpExcel},
  UEXPORTFACTTOXML in 'UEXPORTFACTTOXML.pas',
  UQckFactServIngeservis8_5_NCotiza in '..\Reportes\UQckFactServIngeservis8_5_NCotiza.pas' {qckFactServIngeservis_NCotiza: TQuickRep},
  UFormRetencionesTercero in 'UFormRetencionesTercero.pas' {frmRetencionestercero},
  UQckFactServIngeservis8_5_NConduce in '..\Reportes\UQckFactServIngeservis8_5_NConduce.pas' {qckFactServIngeservis_NConduce: TQuickRep},
  UFormConsignacion in 'UFormConsignacion.pas' {frmConsignacion},
  UQckFactServIngeservis8_5_NConsigna in '..\Reportes\UQckFactServIngeservis8_5_NConsigna.pas' {qckFactServIngeservis_NConsigna: TQuickRep},
  UFormDatosConsigna in 'UFormDatosConsigna.pas' {frmConsultaConsignaciones},
  UFormIngChequesDet in 'UFormIngChequesDet.pas' {frmDatosIngCheque},
  UQckFactServArtioficce8_5 in '..\Reportes\UQckFactServArtioficce8_5.pas' {qckFactServArtioffice8_5: TQuickRep},
  UQckFactServIngeservis8_5_NCotizaN in '..\Reportes\UQckFactServIngeservis8_5_NCotizaN.pas' {qckFactServIngeservis_NCotizaN: TQuickRep},
  UQckCotiza8_5_F_1 in '..\Reportes\UQckCotiza8_5_F_1.pas' {qckCotiza8_5_F_1: TQuickRep},
  UQckCotiza8_5_F_2 in '..\Reportes\UQckCotiza8_5_F_2.pas' {qckCotiza8_5_F_2: TQuickRep},
  UQckFactCredArtioffice8_5_F_1 in '..\Reportes\UQckFactCredArtioffice8_5_F_1.pas' {qckFactCredArtioffice8_5_F_1: TQuickRep},
  UQckCotiza8_5_F_1_IDESI in '..\Reportes\UQckCotiza8_5_F_1_IDESI.pas' {qckCotiza8_5_F_1IDESI: TQuickRep},
  UDetalleFormaDePago in 'UDetalleFormaDePago.pas' {frmAceptaDetalleFormaPago},
  UFormRecibirOrdenes in 'UFormRecibirOrdenes.pas' {frmRecibirOrdenes},
  URepReciboIngresoAI in '..\Reportes\URepReciboIngresoAI.pas' {qckReciboIngresoAI: TQuickRep},
  UQckRepCotizaXVendedor in '..\Reportes\UQckRepCotizaXVendedor.pas' {qckRepCotizacionXVend: TQuickRep},
  UFormModificaCotiza in 'UFormModificaCotiza.pas',
  UFormCrearOrdenCompra in 'UFormCrearOrdenCompra.pas' {frmCrearOrdenCompra},
  UQckOrdenCompraNew in '..\Reportes\UQckOrdenCompraNew.pas' {qckOrdenDeCompraNew: TQuickRep},
  UProcesarDevolucion in 'UProcesarDevolucion.pas',
  UFormDescAdicional in 'UFormDescAdicional.pas' {frmDescripcionAdicional},
  uSortData in 'uSortData.pas',
  UFormRegServicioTaller in 'UFormRegServicioTaller.pas' {frmRegServicioTaller},
  UQckRepServDetalle in 'UQckRepServDetalle.pas' {qckRepServicioTaller: TQuickRep},
  ImageWin in 'ImageWin.pas' {ImageForm},
  ViewWin in 'ViewWin.pas' {ViewForm},
  UTasaDolar in 'UTasaDolar.pas' {frmMoneda},
  UDatosCambioTasa in 'UDatosCambioTasa.pas' {frmDatosCambioTasa},
  UFormShowImagen in 'UFormShowImagen.pas' {frmShowImages},
  UFormDistribuirPgoVenta in 'UFormDistribuirPgoVenta.pas' {frmDistribuirPgoVenta},
  UFormIngDetBonos in 'UFormIngDetBonos.pas' {frmDetallesIngEnBonos},
  UFormCrearSolOrdenCompra in 'UFormCrearSolOrdenCompra.pas' {frmCrearSolicitudOrdenCompra},
  UFormImpSolordenCotizacion in 'UFormImpSolordenCotizacion.pas' {frmImpSolOrden},
  UQckOrdenSolCompraNew in '..\Reportes\UQckOrdenSolCompraNew.pas' {qckSolOrdenDeCompraNew: TQuickRep},
  UQckRepListaFactura in '..\Reportes\UQckRepListaFactura.pas' {qckListaFactXCte: TQuickRep},
  UFormConsultaVentaXCliente in '..\Reportes\UFormConsultaVentaXCliente.pas' {frmListadoVentas},
  UFormOperacionServicios in 'UFormOperacionServicios.pas' {frmOperacionServicios},
  URepComisionOpeServ in 'URepComisionOpeServ.pas' {qckRepComisionOpeServ: TQuickRep},
  UQckRepListaFacturaProducto in '..\Reportes\UQckRepListaFacturaProducto.pas' {qckListaFactXCteXProducto: TQuickRep},
  UFormConsultaCotizaXCliente in '..\Reportes\UFormConsultaCotizaXCliente.pas' {frmListadoCotizaciones},
  UQckRepListaCotizacion in '..\Reportes\UQckRepListaCotizacion.pas' {qckListaCotizacionXCte: TQuickRep},
  UMarbetePolizaSsegPepin in '..\Reportes\UMarbetePolizaSsegPepin.pas' {qckRepMarbeteSegPepin: TQuickRep},
  UFormMarcaVehiculos in '..\Reportes\UFormMarcaVehiculos.pas' {frmMarcaVehiculos},
  UFormTipoVehiculo in 'UFormTipoVehiculo.pas' {frmTipoVehiculo},
  UQckRepVendedorFactura in '..\Reportes\UQckRepVendedorFactura.pas' {qckListaFactXVendedor: TQuickRep},
  UFormConsultaVentaXVendedor in '..\Reportes\UFormConsultaVentaXVendedor.pas' {frmListadoVentasXVendedor},
  UFormConsultaCotizaXVendedor in '..\Reportes\UFormConsultaCotizaXVendedor.pas' {frmListadoCotizacionesXVendedor},
  UQckRepListaCotizacionXVendedor in '..\Reportes\UQckRepListaCotizacionXVendedor.pas' {qckListaCotizacionXVendedor: TQuickRep},
  UQckRepListaCotizacionProducto in '..\Reportes\UQckRepListaCotizacionProducto.pas' {qckListaCotizaXCteXProducto: TQuickRep},
  UFormConsultaOrden in 'UFormConsultaOrden.pas' {frmConsultaOrden},
  UformVendedorProveedor in 'UformVendedorProveedor.pas' {frmVendedorProveedor},
  URepInventarioProdReorden in '..\Reportes\URepInventarioProdReorden.pas' {qckRepDatosInvReorden: TQuickRep},
  SynPdf in '..\..\..\synpdf\SynPdf.pas',
  SynCommons in '..\..\..\synpdf\SynCommons.pas',
  URepClientesDatosVeh in '..\Reportes\URepClientesDatosVeh.pas' {qckRepDatosVehClientes: TQuickRep},
  USelClienteRepXVendedor in 'USelClienteRepXVendedor.pas' {frmSelRepXVendedor},
  UFormCambiarCteFact in 'UFormCambiarCteFact.pas' {frmCambiarCteFact},
  UFormPagosCombinados in 'UFormPagosCombinados.pas' {frmPagosCombinados},
  UTestImpFiscal in 'UTestImpFiscal.pas' {frmTestImpresoraFiscal},
  UConfCajaXusuario in 'UConfCajaXusuario.pas' {frmConfCajaxUsuario},
  UFormImpresora in 'UFormImpresora.pas' {frmImpresoraFiscal},
  UDescLineaDocfiscal in 'UDescLineaDocfiscal.pas' {frmConfLineaDocFiscal},
  UFrmiTipoifiscal in 'UFrmiTipoifiscal.pas' {frmNCFTipoIfiscal},
  UFormRegPedidoOrden in 'UFormRegPedidoOrden.pas' {frmPedidosProveedores},
  UFormTipoDescNomina in 'UFormTipoDescNomina.pas' {frmTipoDescuentoNomina},
  URepClientesCumple in '..\Reportes\URepClientesCumple.pas' {qckRepClientesCumple: TQuickRep},
  UFormDescuentoNomDependiente in 'UFormDescuentoNomDependiente.pas' {frmProcDescDependientes},
  UFormVacaciones in 'UFormVacaciones.pas' {frmVacaciones},
  URepNominaGral in '..\Reportes\URepNominaGral.pas' {QckRepNominaGral: TQuickRep},
  UFormParamsRepOrdComp in '..\Reportes\UFormParamsRepOrdComp.pas' {frmDatosRepOrdenCompra},
  URepOrdenRecibida in '..\Reportes\URepOrdenRecibida.pas' {qckRepOrdenRecibida: TQuickRep},
  UFormNominaContratista in '..\Reportes\UFormNominaContratista.pas' {frmNominaContratista},
  UFormProyecto in '..\Reportes\UFormProyecto.pas' {frmProyecto},
  UFormContratista in 'UFormContratista.pas' {frmContratistas},
  USelTipoNomIntegrarContratista in 'USelTipoNomIntegrarContratista.pas' {frmSelDatosIntegrarNomCont},
  URepNominaContratista in '..\Reportes\URepNominaContratista.pas' {QckRepNominaContratista: TQuickRep},
  UFormTasaITBIS in '..\Reportes\UFormTasaITBIS.pas' {frmTasaITBIS},
  UQckCotiServIngeservis8_5_NConduce in '..\Reportes\UQckCotiServIngeservis8_5_NConduce.pas' {qckCotiServIngeservis_NConduce: TQuickRep},
  UFormSelTipoConduce in '..\Reportes\UFormSelTipoConduce.pas' {frmSeleccionarTipoConduce},
  UFormGenerarConduce in '..\Reportes\UFormGenerarConduce.pas' {frmGenerarConduce},
  UFormGenerarConduceFct in '..\Reportes\UFormGenerarConduceFct.pas' {frmGenerarConduceFCT},
  UQckFactCredArtioffice8_5_F_1_bym in '..\Reportes\UQckFactCredArtioffice8_5_F_1_bym.pas' {qckFactCredArtioffice8_5_F_1ByM: TQuickRep},
  UQckCotiza8_5_F_1ByM in '..\Reportes\UQckCotiza8_5_F_1ByM.pas' {qckCotiza8_5_F_1ByM: TQuickRep},
  USelDatosReporte in 'USelDatosReporte.pas' {frmDatosReporte},
  UFormBuscarNCF in 'UFormBuscarNCF.pas' {frmBuscarNCF},
  UfrmBuscarNIF in 'UfrmBuscarNIF.pas' {frmBuscarNIF},
  UCoreOCXFiscal in 'UCoreOCXFiscal.pas',
  URepReciboIngresoByM in '..\Reportes\URepReciboIngresoByM.pas' {qckReciboIngresoByM: TQuickRep},
  UVerDataImpIFiscal in 'UVerDataImpIFiscal.pas' {frmInfoParaTicketFiscal},
  UcheckSecNCF in 'UcheckSecNCF.pas' {frmCheckNCFSec},
  UFormSelTasaITBIS in 'UFormSelTasaITBIS.pas' {frmSelTasaITBIS},
  UFormCalculosVentaActiva in 'UFormCalculosVentaActiva.pas' {frmVerCalcVenta},
  UDatModCotizafiscal in 'UDatModCotizafiscal.pas' {dmcotizafiscal: TDataModule},
  UImprimeCotizaFiscal in 'UImprimeCotizaFiscal.pas',
  UDescLineaCotizacion in 'UDescLineaCotizacion.pas' {frmConfLineaCotizacion},
  UFormVerCierreZ in 'UFormVerCierreZ.pas' {frmCierreZ},
  UFormAyuda in 'UFormAyuda.pas' {frmAyuda},
  UProcCierreJornada in 'UProcCierreJornada.pas' {frmCierreJornada},
  URepVentaFiscalDet in '..\Reportes\URepVentaFiscalDet.pas' {qckRepVentaFiscalDet: TQuickRep},
  UDatModCalculos in 'UDatModCalculos.pas' {dmCalculos: TDataModule},
  UTemporalVtaForm in 'UTemporalVtaForm.pas' {frmTemporalForm},
  UFormConsultaDatosVenta in 'UFormConsultaDatosVenta.pas' {frmConsultaDatosVenta},
  UConciliarNIF in 'UConciliarNIF.pas' {frmConciliarNIFvsVenta},
  UFormHistoricoCierreZ in 'UFormHistoricoCierreZ.pas' {frmHistoricoCierreZ},
  UDatamodulocnt in '..\DmCnt\UDatamodulocnt.pas' {dmCnt: TDataModule},
  UDatmodPerm in '..\DmCnt\UDatmodPerm.pas' {dmPerm: TDataModule},
  UDatModCheques in '..\Cheques\UDatModCheques.pas' {dmcks: TDataModule},
  URepInventarioProdReordenxTipo in '..\Reportes\URepInventarioProdReordenxTipo.pas' {qckRepDatosInvReordenXTipo: TQuickRep},
  UFormCrearNotaCRVta in 'UFormCrearNotaCRVta.pas' {frmCrearNotaCreditoVta},
  UFormVerDetalleVta in 'UFormVerDetalleVta.pas' {frmVerDet},
  UFormTipoTrnCNT in 'UFormTipoTrnCNT.pas' {frmTipoTrnConfig},
  UFormCheckGenerador in 'UFormCheckGenerador.pas' {frmCheckGenerador},
  UQckFactCredArtioffice8_5_F_1Std in '..\Reportes\UQckFactCredArtioffice8_5_F_1Std.pas' {qckFactCredArtioffice8_5_F_1Std: TQuickRep},
  URepRecibo8_5_11REspinalReimp in 'URepRecibo8_5_11REspinalReimp.pas' {qckRepRecibo8_5_11REspReimp: TQuickRep},
  frmVerComprobantes in 'frmVerComprobantes.pas' {frmVerTipoComprobantes},
  UContabilizarVentasDevoluciones in 'UContabilizarVentasDevoluciones.pas' {frmContabilizarVtasDevol},
  UContabilizarVentasTarjeta in 'UContabilizarVentasTarjeta.pas' {frmContabilizarVentasTarjeta},
  UFormPuertosLibres in 'UFormPuertosLibres.pas' {frmPuertosLibres},
  UContabilizarCostosYGastos in 'UContabilizarCostosYGastos.pas' {frmContabilizarCostosYGastos},
  UFormContFacturasSuplidores in 'UFormContFacturasSuplidores.pas' {frmContFacturasSuplidores},
  UFormEstructuraNCFHelp in 'UFormEstructuraNCFHelp.pas' {frmHelpNCF},
  URepVentaDiariaGeneral in 'URepVentaDiariaGeneral.pas' {qckRepVentaDiariaGeneral: TQuickRep},
  UContabilizarIngresosCxc in 'UContabilizarIngresosCxc.pas' {frmContabilizarIngCxc},
  URepItebisResumen in 'URepItebisResumen.pas' {qckRepItbisResumen: TQuickRep},
  UformEmailProcess in 'UformEmailProcess.pas' {frmEmailProcess},
  UFormEnviarEmailLVentas in 'UFormEnviarEmailLVentas.pas' {frmEnviarFileLVentas},
  UEnviarEmailEstandar in 'UEnviarEmailEstandar.pas' {frmEnviarEmailEstandar},
  UCtrlEnvioaLavanderia in 'UCtrlEnvioaLavanderia.pas' {frmLavanderia},
  UFormConfReportes in 'UFormConfReportes.pas' {frmConfReportes},
  qckRepLavanderiaRecibo in 'qckRepLavanderiaRecibo.pas' {qckReciboLavanderia: TQuickRep},
  UCtrlAlquiler in 'UCtrlAlquiler.pas' {frmAlquiler},
  qckRepCompAlquiler in 'qckRepCompAlquiler.pas' {qckCompAlquiler: TQuickRep},
  qckRepCompAlquilerN in 'qckRepCompAlquilerN.pas' {qckCompAlquilerN: TQuickRep},
  uFormAsignarNCFVentaGastos in 'uFormAsignarNCFVentaGastos.pas' {frmAsignarNCFGastos},
  USeleccionarNCFGastos in 'USeleccionarNCFGastos.pas' {frmSelNCFGastos},
  UqckRepComprobanteTaller in 'UqckRepComprobanteTaller.pas' {qckRepComprobanteTaller: TQuickRep},
  UFormConsServTaller in '..\Reportes\UFormConsServTaller.pas' {frmListadoServTaller},
  UQckRepServVendedor in '..\Reportes\UQckRepServVendedor.pas' {qckListaServtXVendedor: TQuickRep},
  UQckCotiza8_5_FormG in '..\Reportes\UQckCotiza8_5_FormG.pas' {qckCotiza8_5_FormG: TQuickRep},
  UFormConsServXTipo in '..\Reportes\UFormConsServXTipo.pas' {frmListadoServXTipo},
  UQckRepServXTipo in '..\Reportes\UQckRepServXTipo.pas' {qckListaServtXTipo: TQuickRep},
  URepPrecioXLevel in '..\Reportes\URepPrecioXLevel.pas' {qckRepPrecioXLevel: TQuickRep},
  UFormSelTipoInv in '..\Reportes\UFormSelTipoInv.pas' {frmSelTipoInv},
  UFormConsServXTipoBuscar in 'UFormConsServXTipoBuscar.pas' {frmListadoServXTipoBuscar},
  URepCotizacionPapel3Pulg in 'URepCotizacionPapel3Pulg.pas' {qckCotizacion3Pulg: TQuickRep},
  UFormPromoverEstudiantes in 'UFormPromoverEstudiantes.pas' {frmPromoverEstudiantes},
  URepComprobanteReimp in '..\Reportes\URepComprobanteReimp.pas' {qckRepReciboReimp: TQuickRep},
  UQckCotiza8_5_F_1ByMPrefact in '..\Reportes\UQckCotiza8_5_F_1ByMPrefact.pas' {qckCotiza8_5_F_1ByMPreFct: TQuickRep},
  UMembreteCia in '..\Reportes\UMembreteCia.pas' {frmMembrete},
  UQckOrdenCompraNewBB in '..\Reportes\UQckOrdenCompraNewBB.pas' {qckOrdenDeCompraNewBB: TQuickRep},
  UQckCotiza8_5_F_1BB in '..\Reportes\UQckCotiza8_5_F_1BB.pas' {qckCotiza8_5_F_1BB: TQuickRep},
  URepReciboIngresoByB in '..\Reportes\URepReciboIngresoByB.pas' {qckReciboIngresoByB: TQuickRep},
  UQckFactServ8_5BB in '..\Reportes\UQckFactServ8_5BB.pas' {qckFactServ8_5BB: TQuickRep},
  qckrepEstadoCtaBB in 'qckrepEstadoCtaBB.pas' {qckEstadoCxcBB: TQuickRep},
  UQckRepOrdenTrabajo in 'UQckRepOrdenTrabajo.pas' {qckOrdenTrabajo: TQuickRep},
  UFormOrdenTrabajo in 'UFormOrdenTrabajo.pas' {frmOrdenTrabajo},
  UFormConsultarOrden in 'UFormConsultarOrden.pas' {frmConsultaOrdenes},
  URepOrdenesTrabajoBB in 'URepOrdenesTrabajoBB.pas' {qckRepOrdenesTrabajo: TQuickRep},
  UConsultaNCFNulos in 'UConsultaNCFNulos.pas' {frmConsultaNCF},
  UContRegOrdenes in 'UContRegOrdenes.pas' {frmContOrdenReg},
  UReporteSobreNominaEmpCont in '..\Reportes\UReporteSobreNominaEmpCont.pas' {qckSobrePagoNominaCont: TQuickRep},
  UQckFactServ8_5Ayaco in '..\Reportes\UQckFactServ8_5Ayaco.pas' {qckFactServ8_5Ayaco: TQuickRep},
  UCategoriaInventario in '..\Reportes\UCategoriaInventario.pas' {frmCategoriaInv},
  UInventarioSubCategoria in '..\Reportes\UInventarioSubCategoria.pas' {frmSubCategoriaInv},
  URepProdMasVenta in 'URepProdMasVenta.pas' {qckProdMasVendidos: TQuickRep},
  UFormConsultaVentaProd in 'UFormConsultaVentaProd.pas' {frmConsultaProdVenta},
  UFormConsultaNoVentaProd in 'UFormConsultaNoVentaProd.pas' {frmConsultaFechaUltmaVta},
  URepProdMasVentaFUltVta in 'URepProdMasVentaFUltVta.pas' {qckProdFUltVta: TQuickRep},
  URepComprobanteDevol_3Pulg in '..\Reportes\URepComprobanteDevol_3Pulg.pas' {qckRepReciboDevol3Pulg: TQuickRep},
  UDatModFastFood in 'UDatModFastFood.pas' {dmFastfood: TDataModule},
  UFormDatosPendCrearTicket in 'UFormDatosPendCrearTicket.pas' {frmDatosVenta},
  URepReimpFastFoodPOS in '..\Reportes\URepReimpFastFoodPOS.pas' {qckRepReciboReimpFFoodPOS: TQuickRep},
  UformOficina in '..\Reportes\UformOficina.pas' {frmOficina},
  UFormCiudad in '..\Reportes\UFormCiudad.pas' {frmCiudades},
  UFormPrecioXUnidadNivel in 'UFormPrecioXUnidadNivel.pas' {frmPrecioUnidadNivel},
  URepReimpTicketSurtidora in '..\Reportes\URepReimpTicketSurtidora.pas' {qckRepReciboReimpTicketSurtidora: TQuickRep},
  UDatModDGII in 'UDatModDGII.pas' {dmDGII: TDataModule},
  UBuscarRazonSocialDBDgii in 'UBuscarRazonSocialDBDgii.pas' {frmBuscarRNC},
  UQckCotServ8_5Ayaco in '..\Reportes\UQckCotServ8_5Ayaco.pas' {qckCotServ8_5Ayaco: TQuickRep},
  UFormPosExtraDET in 'UFormPosExtraDET.pas' {frmPosExtraDet},
  URepRecibo8_5_11REspinalReimpFFood in 'URepRecibo8_5_11REspinalReimpFFood.pas' {qckRepRecibo8_5_11REspReimpFFood: TQuickRep},
  UQckFactServ8_5Limao in '..\Reportes\UQckFactServ8_5Limao.pas' {qckFactServ8_5Limao: TQuickRep},
  UQckFactServ8_5Surtidora in '..\Reportes\UQckFactServ8_5Surtidora.pas' {qckFactServ8_5Surtidora: TQuickRep},
  UFormPagoComisionTrab in 'UFormPagoComisionTrab.pas' {frmComisionTrab},
  URepComisionTrab in 'URepComisionTrab.pas' {qckRepComisionTrab: TQuickRep},
  UCtrlEntradaSalidaInvtario in 'UCtrlEntradaSalidaInvtario.pas' {frmCtrlEntSalInv},
  UFormParamsRepComTrab in '..\Reportes\UFormParamsRepComTrab.pas' {frmDatosRepComisiones},
  UFormInfoTasaITBIS in '..\Reportes\UFormInfoTasaITBIS.pas' {frmInfoTasaItbis},
  UReipReimpFastRetailPOS in '..\Reportes\UReipReimpFastRetailPOS.pas' {qckRepReciboReimpFRetailPOS: TQuickRep},
  URepRecibo8x5_5 in 'URepRecibo8x5_5.pas' {QCKFactRepuesto8x5_5: TQuickRep},
  UFormDatosVeh in '..\Reportes\UFormDatosVeh.pas' {frmDatosVeh},
  UQckCotServ8_5AyacoRep in '..\Reportes\UQckCotServ8_5AyacoRep.pas' {qckCotServ8_5AyacoRep: TQuickRep},
  URepRecibo8x5_5Conduce in 'URepRecibo8x5_5Conduce.pas' {QCKFactRepuesto8x5_5Conduce: TQuickRep},
  frmImprimirDoc in 'frmImprimirDoc.pas' {frmImprimir},
  UFormLog in 'UFormLog.pas' {frmLogError},
  URegFpagoVtaRep in 'URegFpagoVtaRep.pas' {frmFormaPagoVRep},
  qckrepEstadoCtaGeneral in 'qckrepEstadoCtaGeneral.pas' {qckEstadoCxcGeneral: TQuickRep},
  UCancelaReinsertaVenta in 'UCancelaReinsertaVenta.pas' {frmCancelaVta},
  URepDatos607 in 'URepDatos607.pas' {qckRepData607: TQuickRep},
  UBuscarProvConOrden in 'UBuscarProvConOrden.pas' {frmProcBuscarProvOrden},
  UDatModFinanzas in 'UDatModFinanzas.pas' {dmFinanzas: TDataModule},
  URepItebisSum in 'URepItebisSum.pas' {qckRepItbisSum: TQuickRep},
  qckRepTestImpresora in 'qckRepTestImpresora.pas' {qckRepFuenteImpresora: TQuickRep},
  specialfolders in 'specialfolders.pas',
  UFormOfertas in 'UFormOfertas.pas' {frmOfertas},
  UConfirmaConduce in 'UConfirmaConduce.pas' {frmConfirmaConduce},
  UQckRepConduce in 'UQckRepConduce.pas' {qckRepConduce: TQuickRep},
  UFormDatosOrdenConduce in 'UFormDatosOrdenConduce.pas' {frmDatosOrdConduce},
  UQckRepOrdenAlmacen in 'UQckRepOrdenAlmacen.pas' {qckRepOrdenAlmacen: TQuickRep},
  UFormGenericoImpresoras in 'UFormGenericoImpresoras.pas' {frmConfImpresoras},
  UQckRepOrdenAlmacenPOS in 'UQckRepOrdenAlmacenPOS.pas' {qckRepOrdenAlmacenPOS: TQuickRep},
  UFormCuadreConduce in 'UFormCuadreConduce.pas' {frmCuadraConduce},
  UFactLimao01 in 'UFactLimao01.pas' {qckFacturaLimao01: TQuickRep},
  UFormVocadosDet in 'UFormVocadosDet.pas' {frmVocadoDet},
  UQckFactServ8_5EXDMar in '..\Reportes\UQckFactServ8_5EXDMar.pas' {qckFactServ8_5EXDMar: TQuickRep},
  URepCuadreCajaPOS in '..\Reportes\URepCuadreCajaPOS.pas' {qckRepCuadreCajaPOS: TQuickRep},
  UFormMetasXVendedor in 'UFormMetasXVendedor.pas' {frmMetasXVendedor},
  UQckCotizaServ8_5EXDMar in '..\Reportes\UQckCotizaServ8_5EXDMar.pas' {qckCotizaServ8_5EXDMar: TQuickRep},
  UFormMargenBeneficio in 'UFormMargenBeneficio.pas' {frmMargenBeneficio},
  UFormReporteVentas in 'UFormReporteVentas.pas' {frmReporteVentas},
  URepDepositos in 'URepDepositos.pas' {qckRepDeposito: TQuickRep},
  UFormMantDepositos in 'UFormMantDepositos.pas' {frmDepositos},
  UFormDepDesglose in 'UFormDepDesglose.pas' {frmDesgloseDeposito},
  UFormTipoDeposito in 'UFormTipoDeposito.pas' {frmTipoDeposito},
  UFormTipoCtaBanco in 'UFormTipoCtaBanco.pas' {frmTipoCtaBanco},
  UFormComicionesXVtaProd in 'UFormComicionesXVtaProd.pas' {frmComisionVtaXProd},
  URepTicketVta in 'URepTicketVta.pas' {qckTicketVta: TQuickRep},
  URepConduce in 'URepConduce.pas' {frmRepConduce},
  URepDatosConduce in 'URepDatosConduce.pas' {qckReporteConduce: TQuickRep},
  UFormCteXCiudad in 'UFormCteXCiudad.pas' {frmRepCteXCiudad},
  UFormSectores in 'UFormSectores.pas' {frmSectores},
  USelClienteRepXRuta in 'USelClienteRepXRuta.pas' {frmSelRepXRuta},
  UFormPagoComisionesXVta in 'UFormPagoComisionesXVta.pas' {frmPagoComisiones},
  UFormActTipoNomina in 'UFormActTipoNomina.pas' {frmActTipoNomina},
  URepComisionTrabXVta in 'URepComisionTrabXVta.pas' {qckRepComisionTrabXVta: TQuickRep},
  UFormRutaVentas in 'UFormRutaVentas.pas' {frmRutasVentas},
  UQckRepExistenciaVenta in 'UQckRepExistenciaVenta.pas' {qckRepExistenciaVenta: TQuickRep},
  UDatModVehiculo in 'UDatModVehiculo.pas' {dmVehiculo: TDataModule},
  UFichaVeh in 'UFichaVeh.pas' {FrmFichasVeh},
  UQckFactServ8_5Agua in '..\Reportes\UQckFactServ8_5Agua.pas' {qckFactServ8_5Agua: TQuickRep},
  UFormDetalleAdicionalVta in 'UFormDetalleAdicionalVta.pas' {frmDatosAdicConduce},
  UQckRepVendedorDatCom in '..\Reportes\UQckRepVendedorDatCom.pas' {qckListaFactXVendedorDatCom: TQuickRep},
  UFormSelServGastosVsVta in '..\Reportes\UFormSelServGastosVsVta.pas' {frmRelGastosCostos},
  URepRelVtasGastos in '..\Reportes\URepRelVtasGastos.pas' {qckRelGastosVentas: TQuickRep},
  URepComisionTrabXVtaRes in 'URepComisionTrabXVtaRes.pas' {qckRepComisionTrabXVtaRes: TQuickRep},
  URepFVtaCuadre in '..\Reportes\URepFVtaCuadre.pas' {QckRepFVtaCuadre: TQuickRep},
  UFormConsultaVentaProductos in '..\Reportes\UFormConsultaVentaProductos.pas' {frmConsultaVtaProductos},
  URepInvExistencia in 'URepInvExistencia.pas' {qckRepInvExistencia: TQuickRep},
  UFormRepPrecioXTipoProd in 'UFormRepPrecioXTipoProd.pas' {frmPrecioXTipoProd},
  URepPrecioXLevelXUnidad in '..\Reportes\URepPrecioXLevelXUnidad.pas' {qckRepPrecioXLevelXUnidad: TQuickRep},
  UFormDetVtaXUsuario in 'UFormDetVtaXUsuario.pas' {frmVentaDetXUsuario},
  UFormEncriptarValor in 'UFormEncriptarValor.pas' {frmEncrypt},
  UFormEnviarEmailTest in 'UFormEnviarEmailTest.pas' {frmEnviarEmailTest},
  UFormConsultaVentaXRuta in '..\Reportes\UFormConsultaVentaXRuta.pas' {frmListadoVentasXRuta},
  UQckRepVendedorXRuta in '..\Reportes\UQckRepVendedorXRuta.pas' {qckListaFactXRuta: TQuickRep},
  URepClientesXDireccion in '..\Reportes\URepClientesXDireccion.pas' {qckRepClientesXDireccion: TQuickRep},
  UFormVentaSumXRuta in 'UFormVentaSumXRuta.pas' {frmVentasSumXRuta},
  URepClientesXManzana in '..\Reportes\URepClientesXManzana.pas' {qckRepClientesXDirCalleMEdif: TQuickRep},
  UFormConsultaCteXManzana in '..\Reportes\UFormConsultaCteXManzana.pas' {frmListadoClientesDireccion},
  UFormTipoCliente in 'UFormTipoCliente.pas' {frmTipoCliente},
  UFormFiltrarTasaItbis in 'UFormFiltrarTasaItbis.pas' {frmFiltrarTasaItbis},
  UFormDatosProdControlados in 'UFormDatosProdControlados.pas' {frmMedicamentoDNCD},
  UFormARS in 'UFormARS.pas' {frmARS},
  UFormCoberturaVtaARS in 'UFormCoberturaVtaARS.pas' {frmCoberturaVtaARS},
  UFormConciliarARS in 'UFormConciliarARS.pas' {frmConciliacionDeFctSeguro},
  ULiquidacionARS in 'ULiquidacionARS.pas' {frmLiquidacionARS},
  UDatModFarmacia in 'UDatModFarmacia.pas' {dmFarmacia: TDataModule},
  URepReimpTicketFarm_ARS in '..\Reportes\URepReimpTicketFarm_ARS.pas' {qckRepReciboReimpTicketFarmaciaARS: TQuickRep},
  UFormRecordConciARS in 'UFormRecordConciARS.pas' {frmConcARSRRecord},
  URepFacturaARS in 'URepFacturaARS.pas' {qckRepFactARS: TQuickRep},
  URepReclamacionesARS in 'URepReclamacionesARS.pas' {qckRepReclamacionesARS: TQuickRep},
  UQckFactServ8_5_SAM in '..\Reportes\UQckFactServ8_5_SAM.pas' {qckFactServ_8_5SAM: TQuickRep},
  UQckCotServ8_5SAM in '..\Reportes\UQckCotServ8_5SAM.pas' {qckCotServ8_5SAM: TQuickRep},
  UFormImportPolizas in 'UFormImportPolizas.pas' {frmImportarPolizas},
  URepTransCostoGastos in '..\Reportes\URepTransCostoGastos.pas' {qckTransCostosGastos: TQuickRep},
  UFormDatosRepCostosGastos in '..\Reportes\UFormDatosRepCostosGastos.pas' {frmDatosRepCostos},
  UFormIndiqueMontoRetencion in '..\Reportes\UFormIndiqueMontoRetencion.pas' {frmIndicaMontoRetencion},
  UQckFactServ8_5_Standar in '..\Reportes\UQckFactServ8_5_Standar.pas' {qckFactServ_8_5Standard: TQuickRep},
  UFormFormatoTipoDoc in '..\Reportes\UFormFormatoTipoDoc.pas' {frmFormatoReportes},
  UQckCotServ8_5Standar in '..\Reportes\UQckCotServ8_5Standar.pas' {qckCotServ8_5Standar: TQuickRep},
  UformExpExcel in 'UformExpExcel.pas' {frmExportarExcel},
  UFormDealers in 'UFormDealers.pas' {frmDealers},
  UFormAgencias in 'UFormAgencias.pas' {frmAgencias},
  UFormConsultaCertificados in 'UFormConsultaCertificados.pas' {frmConsultaCertificados},
  UFormEnviarEmailCertificados in 'UFormEnviarEmailCertificados.pas' {frmEnviaEmailCertificados},
  UFormInvCertificado in 'UFormInvCertificado.pas' {frmInvCertificados},
  UFormReportePolizas in 'UFormReportePolizas.pas' {frmReportesPoliza},
  UConsultaPolizas in 'UConsultaPolizas.pas' {frmConsultaPolizas},
  UQckRepPolizas in 'UQckRepPolizas.pas' {qckRepPolizaSam: TQuickRep},
  UFormEnviarEmail in 'UFormEnviarEmail.pas' {frmEnviarEmail},
  UFormCertEnConsigna in 'UFormCertEnConsigna.pas' {frmCertAsigAgente},
  UFormCertConsignados in 'UFormCertConsignados.pas' {frmCertConsignados},
  URepCumpleanioCte in '..\Reportes\URepCumpleanioCte.pas' {qckListadoCumpleAnio: TQuickRep},
  UQckRepComisionVtaSam in '..\Reportes\UQckRepComisionVtaSam.pas' {qckRepComisionVtaSam: TQuickRep},
  UFormConfComisiones in 'UFormConfComisiones.pas' {frmConfComisiones},
  UFormContabilizaCheques in 'UFormContabilizaCheques.pas' {frmContabilizaCheques},
  UFormConfComisionEmpleados in 'UFormConfComisionEmpleados.pas' {frmConfComEmpleado},
  URepItbisResXDiaTipoInv in 'URepItbisResXDiaTipoInv.pas' {qckRepItbis_ResXDiaTipoInv: TQuickRep},
  URepItebisResumenXTipoNCF in 'URepItebisResumenXTipoNCF.pas' {qckRepItbisResumenXTipoNCF: TQuickRep},
  URepFVtaCuadreXCliente in '..\Reportes\URepFVtaCuadreXCliente.pas' {QckRepFVtaCuadreXCte: TQuickRep},
  UBorrarNifDuplicado in 'UBorrarNifDuplicado.pas' {frmEliminaNIFDuplicado},
  UFormConsultaVentaXVendedorComSam in '..\Reportes\UFormConsultaVentaXVendedorComSam.pas' {frmListadoVentasXVendedorComSam},
  UFormFiltrarCatInv in 'UFormFiltrarCatInv.pas' {frmFiltrarCategoriaInv},
  UFormCertEnCxc in 'UFormCertEnCxc.pas' {frmCertificadosEnCxc},
  UFormPolizasCXC in 'UFormPolizasCXC.pas' {frmPolizasCxc},
  UQckFactServ8_5_SAMNew in '..\Reportes\UQckFactServ8_5_SAMNew.pas' {qckFactServ_8_5SAMNew: TQuickRep},
  qckRepCertificadoSAMNew in 'qckRepCertificadoSAMNew.pas' {qckCertificadoSamNew: TQuickRep},
  UFormReclamaciones in 'UFormReclamaciones.pas' {frmReclamaciones},
  UFormTipoAfiliacion in 'UFormTipoAfiliacion.pas' {frmTipoAfiliacion},
  UDatModCobertura in 'UDatModCobertura.pas' {dmCobertura: TDataModule},
  UFormCoberturaSam in 'UFormCoberturaSam.pas' {frmCobertura},
  UFormLogoTipoAfiliado in 'UFormLogoTipoAfiliado.pas' {frmLogoTipoAfiliado},
  UQckFactServ8_5_SAMNewM in '..\Reportes\UQckFactServ8_5_SAMNewM.pas' {qckFactServ_8_5SAMNewM: TQuickRep},
  URepConduceECom in 'URepConduceECom.pas' {qckRepConduceECom: TQuickRep},
  UFactFormatoECom in '..\Reportes\UFactFormatoECom.pas' {QckFactServ_8_5ECom: TQuickRep},
  UCtrlEquipoRMA in 'UCtrlEquipoRMA.pas' {frmRMA},
  qckRepREMAComprobante in 'qckRepREMAComprobante.pas' {qckRMAComprobante: TQuickRep},
  UQckRepEquipos in 'UQckRepEquipos.pas' {qckRepEquipos: TQuickRep},
  UFormRepEquipos in 'UFormRepEquipos.pas' {frmReporteEquipos},
  URepReciboIngGen in '..\Reportes\URepReciboIngGen.pas' {qckReciboIngresoGen: TQuickRep},
  UFormBuscarSerie in '..\Reportes\UFormBuscarSerie.pas' {frmBuscarSerie},
  UFormFactRecurrentes in 'UFormFactRecurrentes.pas' {frmGenFactRecurrentes},
  URepReciboIngGenPOS in 'URepReciboIngGenPOS.pas' {qckReciboIngresoGenPOS: TQuickRep},
  UFormConsultaTransf in 'UFormConsultaTransf.pas' {frmConsultaTransf},
  UFormImpFactRecurrentes in 'UFormImpFactRecurrentes.pas' {frmImpresionFactRecurrente},
  UFormDatosTablas in 'UFormDatosTablas.pas' {frmDatosTabla},
  UPrintPDFCustom in 'UPrintPDFCustom.pas',
  UFormInvKardex in 'UFormInvKardex.pas' {frmkardex},
  UFormConsultaCertAvanzado in 'UFormConsultaCertAvanzado.pas' {frmConsultaCertAvanzada},
  frmTransferenciasBanco in 'frmTransferenciasBanco.pas' {frmtransferencias},
  UFormContractWisPro in 'UFormContractWisPro.pas' {frmContractosWisPro},
  UFormClientWisPro in 'UFormClientWisPro.pas' {frmClientWisPro},
  UConfColores in 'UConfColores.pas' {frmcolores},
  UFormProvTarjetas in 'UFormProvTarjetas.pas' {frmProvTarjetas},
  UDatModBanco in 'UDatModBanco.pas' {dmBancos: TDataModule},
  UQckReclamaciones in 'UQckReclamaciones.pas' {qckReclamacion: TQuickRep},
  UFormProcCuadreCajaNew in 'UFormProcCuadreCajaNew.pas' {frmCuadreCajaNew},
  UFormCteDelivery in 'UFormCteDelivery.pas' {frmCteDelivery},
  qckRepCertificadoSAMNewP2 in 'qckRepCertificadoSAMNewP2.pas' {qckCertificadoSamNewP2: TQuickRep},
  UFormCambiarCtePoliza in 'UFormCambiarCtePoliza.pas' {frmCambiarCtePoliza},
  UFormEstatusContratos in 'UFormEstatusContratos.pas',
  UFormImportGMovil in 'UFormImportGMovil.pas' {frmImportarGarantias},
  UFormEnviarEmailCertificadosGMovil in 'UFormEnviarEmailCertificadosGMovil.pas' {frmEnviaEmailCertificadosGM},
  qckRepCertificadoSAMNewGM in 'qckRepCertificadoSAMNewGM.pas' {qckCertificadoSamNewGMovil: TQuickRep},
  UFormConsultaCertificadosGM in 'UFormConsultaCertificadosGM.pas' {frmConsultaCertificadosGMovil},
  UQckFactServ8_5_SAMNewMuturs in '..\Reportes\UQckFactServ8_5_SAMNewMuturs.pas' {qckFactServ_8_5SAMNewMuturs: TQuickRep},
  UQckRepMotores in 'UQckRepMotores.pas' {qckRepMotores: TQuickRep},
  UFormBuscarMotor in 'UFormBuscarMotor.pas' {frmBuscarMotor},
  UFormReporteMotoresVeh in 'UFormReporteMotoresVeh.pas' {frmReportesVehiculos},
  UqckRepVeh in 'UqckRepVeh.pas' {qckRepVeh: TQuickRep},
  UFormConsVeh in 'UFormConsVeh.pas' {frmConsVeh},
  UFormAsignarMotores in '..\..\..\Motores\Fuentes\UFormAsignarMotores.pas' {frmAsignarVeh},
  UFormInspecciones in 'UFormInspecciones.pas' {frmInspecciones},
  URepReimpTicketSurtidoraNew in '..\Reportes\URepReimpTicketSurtidoraNew.pas' {qckRepReciboReimpTicketSurtidoraNew: TQuickRep},
  UImprimirDocs in 'UImprimirDocs.pas',
  UDmSistema in 'UDmSistema.pas' {dmSistema: TDataModule},
  UFormSistemaIdesi in 'UFormSistemaIdesi.pas' {frmSistemaIdesi},
  UConfirmaLicencia in 'UConfirmaLicencia.pas',
  URepAfiliaciones in 'URepAfiliaciones.pas' {frmRepInspecciones},
  URepInspecciones in '..\Reportes\URepInspecciones.pas' {qckRepInspecciones: TQuickRep},
  UFormConsultaGarantias in 'UFormConsultaGarantias.pas' {frmConsultaGarantias},
  UFormConsultarOrdenCompra in 'UFormConsultarOrdenCompra.pas' {frmConsultaOrdenCompra},
  UREpListadoOrdenesCompra in 'UREpListadoOrdenesCompra.pas' {qckListadoOrdenesCompra: TQuickRep},
  UREpListadoOrdenesCompraRes in 'UREpListadoOrdenesCompraRes.pas' {qckListadoOrdenesCompraRes: TQuickRep},
  UQckFactServ8_5Farmacia in '..\Reportes\UQckFactServ8_5Farmacia.pas' {qckFactServ8_5Farmacia: TQuickRep},
  URepFVtaResumen in '..\Reportes\URepFVtaResumen.pas' {QckRepFVtaResumen: TQuickRep},
  UFormbuscarAfiliacion in '..\Reportes\UFormbuscarAfiliacion.pas' {frmBuscarInspecciones},
  UQckCotServ8_5StandarFarmacia in '..\Reportes\UQckCotServ8_5StandarFarmacia.pas' {qckCotServ8_5Farmacia: TQuickRep},
  URepReciboIngresoAIFarmacia in '..\Reportes\URepReciboIngresoAIFarmacia.pas' {qckReciboIngresoAIFarmacia: TQuickRep},
  UFormConsultaRegPedido in '..\Reportes\UFormConsultaRegPedido.pas' {frmConsultaRegPedido},
  UFormLote in 'UFormLote.pas' {frmLotes},
  qckRepCertificadoSAMNewP2GMovil in '..\Reportes\qckRepCertificadoSAMNewP2GMovil.pas' {qckCertificadoSamNewP2GMovil: TQuickRep},
  UEmailTemplate in 'UEmailTemplate.pas' {frmEmailTemplate},
  UGarantiasEliminadas in 'UGarantiasEliminadas.pas' {frmRecuperaGEliminada},
  UFormHistReclUnaPoliza in 'UFormHistReclUnaPoliza.pas' {frmHistReclPoliza},
  UQckOrdenCompraRecibida in '..\Reportes\UQckOrdenCompraRecibida.pas' {qckOrdenDeCompraRecibida: TQuickRep},
  UConvertirDBGridToHTML in '..\Reportes\UConvertirDBGridToHTML.pas' {frmConvertirDbGridToHTML},
  UFormSelEstatusVeh in '..\Reportes\UFormSelEstatusVeh.pas' {frmEstatusVeh},
  frmMostrarDatosCoberturaRecl in 'frmMostrarDatosCoberturaRecl.pas' {frmMostrarDatosdupCob},
  UFormCalcPrecioCuadros in 'UFormCalcPrecioCuadros.pas' {frmCalcPrecioArticulo},
  UFormDimensionProd in 'UFormDimensionProd.pas' {frmDimensionProd},
  UQckCotizacionOrdenTrab in 'UQckCotizacionOrdenTrab.pas' {qckRepOrdenComp: TQuickRep},
  UProcesarIngresoCxc in 'UProcesarIngresoCxc.pas' {frmProcPagoCxc},
  UFormPrepago in 'UFormPrepago.pas' {frmProcesarPrepago},
  UQckComprobantePrepago in 'UQckComprobantePrepago.pas' {qckComprobanteAbonoPrep: TQuickRep},
  UConsultaReordenProdProv in 'UConsultaReordenProdProv.pas' {frmConsultaReordenInvXProv},
  UFormRepTipoXInv in 'UFormRepTipoXInv.pas' {frmRepTipoXInv},
  URepInventarioProdReordenxTipoCosto in '..\Reportes\URepInventarioProdReordenxTipoCosto.pas' {qckRepDatosInvReordenXTipoCosto: TQuickRep},
  UfrmInvPrecioAudit in 'UfrmInvPrecioAudit.pas' {frmInvPrecioAudit},
  UFormfrmHistVentasInv in 'UFormfrmHistVentasInv.pas' {frmHistVentasInv},
  UfrmVtasHistInv in 'UfrmVtasHistInv.pas' {frmVtasHistInv},
  UFormAsignarNCFAVenta in 'UFormAsignarNCFAVenta.pas' {frmAsignarNCFAVenta},
  UFormUpdateMontopagado in 'UFormUpdateMontopagado.pas' {frmUpdateMontopago},
  UQckRepCodigoBarras in '..\Reportes\UQckRepCodigoBarras.pas' {qckCodigoBarraProd: TQuickRep},
  UformVerificarVntas in 'UformVerificarVntas.pas' {frmVerificarValoresVta},
  UformVerificarVntasPagos in 'UformVerificarVntasPagos.pas' {frmVerificarValoresVtaPago},
  UImprimirzebralabel in 'UImprimirzebralabel.pas' {frmImpZebraLabel},
  ULabelImpCodBarraRefactored in 'ULabelImpCodBarraRefactored.pas' {frmCodigoBarraNew},
  UFormAuditoriaBlcCxc in 'UFormAuditoriaBlcCxc.pas' {frmAuditoriaBlcCxc},
  UFormAplicarDbCrCxc in 'UFormAplicarDbCrCxc.pas' {frmAplicarDbCrCxc},
  UFormCiudadesECF in 'UFormCiudadesECF.pas' {frmciudadesecf},
  URepVentaDiariaNuevo in 'URepVentaDiariaNuevo.pas' {qckRepVentaDiariaNuevo: TQuickRep},
  UFormAuditoriaInv in 'UFormAuditoriaInv.pas' {frmAuditoriaInv},
  UFormCuadraEfeFondoCaja in 'UFormCuadraEfeFondoCaja.pas' {frmCuadreEfeFondoCaja},
  URepCuadreFondoCajaPOS in '..\Reportes\URepCuadreFondoCajaPOS.pas' {qckRepCuadreFondoCajaPOS: TQuickRep},
  FacturaElectronicaUnit in 'FacturaElectronicaUnit.pas',
  URepVentaDiariaNuevoR in 'URepVentaDiariaNuevoR.pas' {qckRepVentaDiariaNuevoRev: TQuickRep},
  UFormProgressBarfRM in 'UFormProgressBarfRM.pas' {frmProgressbarfrm},
  URepVentaDiariaResumen in 'URepVentaDiariaResumen.pas' {qckRepVentaDiariaResumen: TQuickRep},
  UDatModLavanderia in 'UDatModLavanderia.pas' {dmLavanderia: TDataModule},
  UFrmOrdenLavanderia in 'UFrmOrdenLavanderia.pas' {frmOrdenLavanderia},
  UqrOrdenLavanderia in 'UqrOrdenLavanderia.pas' {qrOrdenLavanderia: TQuickRep},
  DelphiZXingQRCode in 'DelphiZXingQRCode.pas',
  UQckStickerprendalavanderia in 'UQckStickerprendalavanderia.pas' {qckstickerprenda: TQuickRep},
  frmEntregaOrdenLavanderia in 'frmEntregaOrdenLavanderia.pas' {frmEntregarOrdenLavanderia},
  qrReciboPagoLavanderia in 'qrReciboPagoLavanderia.pas' {qckrReciboPagoLavanderia: TQuickRep},
  UnitFrmConfigEndpoints in 'UnitFrmConfigEndpoints.pas',
  UDatModFacturaElectronica in 'UDatModFacturaElectronica.pas' {dmFactElectronica: TDataModule},
  UfrmValidaFactura in 'UfrmValidaFactura.pas' {frmValidaFactura},
  TestMainUnit in '..\TestUnit\TestMainUnit.pas' {TestForm},
  UImpresionVentas in 'UImpresionVentas.pas',
  UUtilecf in 'UUtilecf.pas',
  UUtilecftimbre in 'UUtilecftimbre.pas',
  UPrintDevolucion in 'UPrintDevolucion.pas',
  UDlgMotivoNCR in 'UDlgMotivoNCR.pas' {frmMotivoNCR},
  UfrmlECF_TIMBRE_LOG in 'UfrmlECF_TIMBRE_LOG.pas' {frmConsultaTimbreEcf},
  UFrmEditProvinciaMunicipio in 'UFrmEditProvinciaMunicipio.pas' {frmEditProvinciaMunicipio},
  UfrmConciliareCFConDGII in 'UfrmConciliareCFConDGII.pas' {frmConciliareCFConDGII},
  UFormAsignareCFAVentasSineCF in 'UFormAsignareCFAVentasSineCF.pas' {frmAsignareCFAVtasGen},
  UModoConsumoToCredito in 'UModoConsumoToCredito.pas' {frmModoConsumoToCredito},
  UFormNCFAsignados in 'UFormNCFAsignados.pas' {frmNCFAsignados},
  UTicketCustomSize in '..\Reportes\UTicketCustomSize.pas',
  UDgiiRncClient in '..\..\Comun\UDgiiRncClient.pas',
  UQrJpgHelper in 'UQrJpgHelper.pas',
  USetClaveMaestra in 'USetClaveMaestra.pas' {frmConfClaveMaestra},
  UFrmFpVerify in 'DigPers\UFrmFpVerify.pas' {FrmFpVerify},
  UFingerprintIBX in 'DigPers\UFingerprintIBX.pas',
  UFingerprintTaskAuth in 'DigPers\UFingerprintTaskAuth.pas',
  UFingerprintTypes in 'DigPers\UFingerprintTypes.pas',
  UFrmFpEnroll in 'DigPers\UFrmFpEnroll.pas' {FrmFpEnroll},
  UVarBytes in 'DigPers\UVarBytes.pas',
  UFrmOrders2EcfRunner in 'UFrmOrders2EcfRunner.pas' {frmOrders2EcfRunner},
  UFormSecFact in 'UFormSecFact.pas' {frmSecuenciaFct},
  UFrmOrderFilePicker in 'UFrmOrderFilePicker.pas' {frmOrderFilePicker},
  UFacturaTxtBuilder in 'UFacturaTxtBuilder.pas',
  UFacturaTxtEcfFlow in 'UFacturaTxtEcfFlow.pas',
  UQckRepCartaRutaVehTpl in 'UQckRepCartaRutaVehTpl.pas' {qckCartaRutaVehTpl: TQuickRep},
  UFrmCartaRutaTemplate in 'UFrmCartaRutaTemplate.pas' {frmCartaRutaTemplate},
  USincronizarTablaInv in 'USincronizarTablaInv.pas',
  USincronizarPrecioUnidadSurtidora in 'USincronizarPrecioUnidadSurtidora.pas',
  URegDatAdicionales in 'URegDatAdicionales.pas' {frmDatosAdicRegalia},
  UProyeccionRegalia in 'UProyeccionRegalia.pas' {frmProyeccionRegPascual},
  UElijeTipockReg in 'UElijeTipockReg.pas' {frmElijeBcoCksReg},
  URepProyRegalia in '..\Reportes\URepProyRegalia.pas' {qckProyRegalia: TQuickRep},
  UChequesRegalia in '..\Reportes\UChequesRegalia.pas' {frmCksRegalia},
  URepCksNomPer in '..\Reportes\URepCksNomPer.pas' {QckRepCksNomPer: TQuickRep},
  UImpChequesNomina in 'UImpChequesNomina.pas' {FrmImpcksNomina},
  UVercksDanados in 'UVercksDanados.pas' {frmCksDaniados},
  URepCksProg in 'URepCksProg.pas' {QckRepCksProg: TQuickRep},
  UCksRegalia in '..\Reportes\UCksRegalia.pas' {qckCksRegalia: TQuickRep},
  UReptEmpleados in 'UReptEmpleados.pas',
  ReportePersonalSimple in '..\Reportes\ReportePersonalSimple.pas' {QckReporteGralSimple: TQuickRep},
  ReportePersonalXDepto in '..\Reportes\ReportePersonalXDepto.pas' {QckReporteGralXDepto: TQuickRep},
  URepNFISFN in '..\Reportes\URepNFISFN.pas' {qckRepPerNFSFN: TQuickRep},
  URepListadoNomina in '..\Reportes\URepListadoNomina.pas' {qckListadoNomina: TQuickRep},
  URepListadoNominaB in '..\Reportes\URepListadoNominaB.pas' {qckListadoNominaB: TQuickRep},
  UOrdenDespEmpleados in 'UOrdenDespEmpleados.pas' {frmOrdEmpleados},
  UListFirmOrdEmp in 'UListFirmOrdEmp.pas' {qckListFirmOrdComp: TQuickRep},
  URepOrdenComp in '..\Reportes\URepOrdenComp.pas' {qckOrdenComp: TQuickRep},
  UCreditosFrmCoop in 'UCreditosFrmCoop.pas' {frmCreditosCoop},
  UTipoOrdEmpCoop in 'UTipoOrdEmpCoop.pas' {frmTipoOrdEmpCoop},
  UFrmbrowseDatosNomina in 'UFrmbrowseDatosNomina.pas' {frmDatosNomina},
  UImportarDatosTSS in 'UImportarDatosTSS.pas' {frmExportarDatosTSS},
  UFrmTssExportCenter in 'UFrmTssExportCenter.pas' {frmTssExportCenter},
  URepBonifica in 'URepBonifica.pas' {qckboni: TQuickRep},
  UCalculoBonificaciones in 'UCalculoBonificaciones.pas' {frmCalculoBonificaciones},
  UFrmTssNovedadManual in 'UFrmTssNovedadManual.pas' {frmTssNovedadManual},
  UFrmEmpleadoPensionAlimenticia in 'UFrmEmpleadoPensionAlimenticia.pas' {frmEmpleadoPensionAlimenticia},
  UNOmHistorico in 'UNOmHistorico.pas' {frmNOmHistorico},
  URepIR13 in '..\Reportes\URepIR13.pas' {qckRepIR13: TQuickRep},
  UFormSepararNombre in 'UFormSepararNombre.pas' {frmSepararNombre},
  UformConsultarVerificaMontosVtas in 'UformConsultarVerificaMontosVtas.pas' {frmConsultarVtasVerDiff};

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


