program Preventa;

uses
  Forms,
  UProcesarVentas in 'UProcesarVentas.pas' {frmProcesarVentas},
  UDatosVentas in 'UDatosVentas.pas' {dmVentas: TDataModule},
  UDatModInventario in 'UDatModInventario.pas' {dmInventario: TDataModule},
  UGlobal in 'UGlobal.pas',
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
  UDatModControl in 'UDatModControl.pas' {dmControl: TDataModule},
  UAcercaDe in 'UAcercaDe.pas' {AboutBox},
  URepEstadoCtaCxc in '..\Reportes\URepEstadoCtaCxc.pas' {qckRepXServ: TQuickRep},
  UDatModBalanceCxc in 'UDatModBalanceCxc.pas' {dmBalanceCxc: TDataModule},
  UQckReporteFactura in '..\Reportes\UQckReporteFactura.pas' {qckFactura: TQuickRep},
  UDatModUsuarios in 'UDatModUsuarios.pas' {dmUsuarios: TDataModule},
  uLogin in 'uLogin.pas' {frmLogin},
  URepResumenVentas in '..\Reportes\URepResumenVentas.pas' {qckResumenVentas: TQuickRep},
  UDatModEmpleados in 'UDatModEmpleados.pas' {dmEmpleados: TDataModule},
  UEmpleados in 'UEmpleados.pas' {frmEmpleados},
  URepVentaMesxDia in '..\Reportes\URepVentaMesxDia.pas' {qckRepVentaMesxDia: TQuickRep},
  URepVigenciaCxcCtes in '..\Reportes\URepVigenciaCxcCtes.pas' {qryvigenciaCxc: TQuickRep},
  UDatModDespacho in 'UDatModDespacho.pas' {dmDespacho: TDataModule},
  UBuscarProductoInvDespacho in 'UBuscarProductoInvDespacho.pas' {frmBuscarInvDespachoVendedores},
  UReporteResumenDespacho in '..\Reportes\UReporteResumenDespacho.pas' {qckResumenDespacho: TQuickRep},
  URepInventarioProd in '..\Reportes\URepInventarioProd.pas' {qckRepDatosInventario: TQuickRep},
  UDatModRuta in 'UDatModRuta.pas' {dmRutas: TDataModule},
  UCuadreVentaxRuta in 'UCuadreVentaxRuta.pas' {frmCuadreXRuta},
  UDatModCuadrexRuta in 'UDatModCuadrexRuta.pas' {dmCuadrexRuta: TDataModule},
  URepCuadreRuta in '..\Reportes\URepCuadreRuta.pas' {qckCuadreRuta: TQuickRep},
  UQckReporteFacturaCuadre in '..\Reportes\UQckReporteFacturaCuadre.pas' {qckFacturaCuadre: TQuickRep},
  UBalanceSalidaXRuta in 'UBalanceSalidaXRuta.pas' {frmBalanceDespacho},
  URepCuadreDiario in '..\Reportes\URepCuadreDiario.pas' {qckReporteCuadreDiario: TQuickRep},
  URegistro in 'URegistro.pas' {frmTrgtr},
  UGlobalCp in '..\..\..\UGlobalCp.pas',
  URepSalidaRuta in '..\Reportes\URepSalidaRuta.pas' {qckSalidaRuta: TQuickRep},
  URepFacturaVenta in '..\Reportes\URepFacturaVenta.pas' {qckFacturaVenta: TQuickRep},
  URepPrecio in '..\Reportes\URepPrecio.pas' {qckRepPrecio: TQuickRep},
  UDatModCostos in 'UDatModCostos.pas' {dmCostos: TDataModule},
  URepVentaCajaXRuta in '..\Reportes\URepVentaCajaXRuta.pas' {qckVentaCajaxRuta: TQuickRep},
  URepVentaCajaxRutaResumen in '..\Reportes\URepVentaCajaxRutaResumen.pas' {qckVentaCajaxRutaResumen: TQuickRep},
  UDatModComisiones in 'UDatModComisiones.pas' {dmComision: TDataModule},
  URegistrarTransOpeDiaria in 'URegistrarTransOpeDiaria.pas' {frmRegTransOpeDiaria},
  UDatModRegOpeDiaria in 'UDatModRegOpeDiaria.pas' {dtmTransOpeDiaria: TDataModule},
  URepTransOpeDiaria in '..\Reportes\URepTransOpeDiaria.pas' {qckTransOpeDiaria: TQuickRep},
  UFormProductosServicios in 'UFormProductosServicios.pas' {frmProductosServ},
  UReporteValoresEntregadosCuadre in '..\Reportes\UReporteValoresEntregadosCuadre.pas' {qckRepValoresEntxRuta: TQuickRep},
  UDatModNomina in 'UDatModNomina.pas' {dmNomina: TDataModule},
  UControlAct in '..\..\..\Comun\UControlAct.pas' {frmControlSistema},
  UDatModDescuentosNom in 'UDatModDescuentosNom.pas' {dmDescuentosNom: TDataModule},
  UDatosComision in 'UDatosComision.pas' {frmDatosComision},
  UReporteNomina in '..\Reportes\UReporteNomina.pas' {qckRepNomina: TQuickRep},
  UCompania in 'UCompania.pas' {frmCompania},
  URFacturaStandar in 'URFacturaStandar.pas' {qckRepFacturaEstandarNew: TQuickRep},
  UDatModConectar in 'UDatModConectar.pas' {dmConectar: TDataModule},
  URepComision in 'URepComision.pas' {qckRepComision: TQuickRep},
  URepComResVendedor in '..\Reportes\URepComResVendedor.pas' {qckRepResComVendedor: TQuickRep},
  URepPreciocomiciones in '..\Reportes\URepPreciocomiciones.pas' {qckPrecioComision: TQuickRep},
  URepPromociones in '..\Reportes\URepPromociones.pas' {qckRepPromociones: TQuickRep},
  URepPromoRes in '..\Reportes\URepPromoRes.pas' {qckRepPromoResumen: TQuickRep},
  UDatModITBIS in 'UDatModITBIS.pas' {dmItbis: TDataModule},
  URegItbis in 'URegItbis.pas' {frmItbis},
  UProcVentaRapida in 'UProcVentaRapida.pas' {frmProcVentaRapida},
  URepComprobante in '..\Reportes\URepComprobante.pas' {qckRepRecibo: TQuickRep},
  UProcMiniInventario in 'UProcMiniInventario.pas' {frmRegMiniInvientario},
  UConectar in 'UConectar.pas' {frmInciaConeccion},
  UFormCompFiscal in 'UFormCompFiscal.pas' {frmTipoCompFiscal},
  UBuscarClientesPersonasP in 'UBuscarClientesPersonasP.pas' {FrmBuscarClientesPersonas},
  UFormDatosCotiza in 'UFormDatosCotiza.pas' {frmCotizaciones},
  URFactura in '..\Reportes\URFactura.pas' {qckRepFacturaEstandar: TQuickRep},
  UFormSelproducto in 'UFormSelproducto.pas' {frmMostrarProductos},
  URepReciboIngreso in '..\Reportes\URepReciboIngreso.pas' {qckReciboIngreso: TQuickRep},
  UDatmodDatosGenerales in 'UDatmodDatosGenerales.pas' {dmDatos: TDataModule},
  UDatModPagoTarjeta in 'UDatModPagoTarjeta.pas' {dmPagosTarjeta: TDataModule},
  UDatModProveedor in 'UDatModProveedor.pas' {dmProveedor: TDataModule},
  URepItebis in 'URepItebis.pas' {qckRepItbis: TQuickRep},
  UBalanceCxpProv in 'UBalanceCxpProv.pas' {frmBalanceCxpProv},
  UCobroDeCuotasFinanc in 'UCobroDeCuotasFinanc.pas' {frmCobroCuotasXFinanc},
  UDatModCxp in 'UDatModCxp.pas' {dmCxp: TDataModule},
  UQckReporteFacturaPedido in '..\Reportes\UQckReporteFacturaPedido.pas' {qckFacturaPedido: TQuickRep},
  URepItbisResXDia in 'URepItbisResXDia.pas' {qckRepItbis_ResXDia: TQuickRep},
  UMostrarFinancVigente in 'UMostrarFinancVigente.pas' {frmShowFinancVigente},
  URepCotizacionPapel8_55 in 'URepCotizacionPapel8_55.pas' {qckCotizacion8_55: TQuickRep},
  URepRecibo8_5_11 in 'URepRecibo8_5_11.pas' {qckRepRecibo8_5_11: TQuickRep},
  USolDatos in 'USolDatos.pas' {frmSolDatos},
  URepTarjeta_dePago in 'URepTarjeta_dePago.pas' {qckRepTarjetaDePago: TQuickRep},
  UFormSelSerieProd in 'UFormSelSerieProd.pas' {frmSelSerie},
  URepReciboAbonoCXC in 'URepReciboAbonoCXC.pas' {qckReciboAbonoCXC: TQuickRep},
  URepIngresoDet in 'URepIngresoDet.pas' {qckRepTransCxc: TQuickRep},
  uSelSingleFechaOpc in 'uSelSingleFechaOpc.pas' {frmSelSingleFechaOpc},
  URepComprobanteDevol in '..\Reportes\URepComprobanteDevol.pas' {qckRepReciboDevol: TQuickRep},
  UFormEntreClave in 'UFormEntreClave.pas' {frmEntrreClave},
  URepIngEfeyCxc in 'URepIngEfeyCxc.pas' {QckRepIngEfeyCxc: TQuickRep},
  URegMiscelaneos in 'URegMiscelaneos.pas' {frmConfVarios},
  DSim in 'DSim.pas',
  URFacturaStandarReimp in 'URFacturaStandarReimp.pas' {qckRepFacturaEstandarNewReimp: TQuickRep},
  UCobrarFacturas in 'UCobrarFacturas.pas' {frmCobrarFacturas},
  UFactServicio in 'UFactServicio.pas' {qckFactServicio: TQuickRep},
  UFormServFijos in 'UFormServFijos.pas' {frmServiciosReg},
  URepSaldoXAntCxc in 'URepSaldoXAntCxc.pas' {qckRepSaldoXAntCxc: TQuickRep},
  URepSaldoAntCxcRes in 'URepSaldoAntCxcRes.pas' {qckRepSaldoXantCxcRes: TQuickRep},
  UFormDatosVentaVeh in 'UFormDatosVentaVeh.pas' {frmDatosVentaVehiculos},
  URepVencimientoProd in 'URepVencimientoProd.pas' {qckRepVencimientoProd: TQuickRep},
  UIndicarLoteNum in 'UIndicarLoteNum.pas' {frmShowLote},
  UProdVencidos in 'UProdVencidos.pas' {frmProdVencidos},
  UBuscarProveedores in 'UBuscarProveedores.pas' {frmProcBuscarProv},
  URepCompAbonoCXP in 'URepCompAbonoCXP.pas' {QckRepCompAbonoCXP: TQuickRep},
  URepEstadoCtaCxp in 'URepEstadoCtaCxp.pas' {qckRepXServCxp: TQuickRep},
  UCerrarHistoriocxc in 'UCerrarHistoriocxc.pas' {frmVTrnDiaria},
  URegNumTarjetaPagoCxp in 'URegNumTarjetaPagoCxp.pas' {frmRegNumTarjeta},
  URegNumChequeCxp in 'URegNumChequeCxp.pas' {frmRegNumCheque},
  URepFactPendCxp in 'URepFactPendCxp.pas' {qckFactCxpPendientes: TQuickRep},
  URepFactPendCxc in 'URepFactPendCxc.pas' {qckFactPendCxc: TQuickRep},
  URepQckRelacionFactCxc in 'URepQckRelacionFactCxc.pas' {qckRepRelacionFactCxc: TQuickRep},
  URepItebis_esp in 'URepItebis_esp.pas' {qckRepItbis_esp: TQuickRep},
  UReciboPuntoVenta in 'UReciboPuntoVenta.pas' {qckReciboPuntoVenta: TQuickRep},
  URepRecibo8_5_11Devol in 'URepRecibo8_5_11Devol.pas' {qckRepRecibo8_5_11Devol: TQuickRep},
  UCargosEmp in 'UCargosEmp.pas' {frmCargo},
  URepCuadreCaja in 'URepCuadreCaja.pas' {qckRepCuadreCaja: TQuickRep},
  UFormMostrarTodoInventario in 'UFormMostrarTodoInventario.pas' {frmMostrarTodo},
  URepInvProdCosto in 'URepInvProdCosto.pas' {qckInvProdCosto: TQuickRep},
  USelInventario in 'USelInventario.pas' {frmSelInventario},
  UFromDespachoInvAlmacen in 'UFromDespachoInvAlmacen.pas' {frmDespachoInvAlmacen},
  UClasifPrecio in 'UClasifPrecio.pas' {frmTipoPrecio},
  UDivisionInventario in 'UDivisionInventario.pas' {frmDivisionInv},
  URepInventarioProdArea in '..\Reportes\URepInventarioProdArea.pas' {qckRepDatosInventarioXarea: TQuickRep},
  UFormUnidades in 'UFormUnidades.pas' {frmUnidades},
  UDatModDistCNT in 'UDatModDistCNT.pas' {dmDistCnt: TDataModule},
  UDatModTransCnt in 'UDatModTransCnt.pas' {dmTransCnt: TDataModule},
  URepMvCtaCntDet in 'URepMvCtaCntDet.pas' {qckListMvCtacntDet: TQuickRep},
  URepListadoACnt in 'URepListadoACnt.pas' {qckListadoAcnt: TQuickRep},
  URepFacturaPuntoVenta in 'URepFacturaPuntoVenta.pas' {qckRepFactPuntoVenta: TQuickRep},
  URegOrdenCompra in 'URegOrdenCompra.pas' {frmRegOrdenCompra},
  URepOrdenCompra in 'URepOrdenCompra.pas' {qckRepOrdenCompra: TQuickRep},
  UEscalaISR in 'UEscalaISR.pas' {frmEscalaIsr},
  UFechaFinEscalaIsr in 'UFechaFinEscalaIsr.pas' {frmFechaEscalaFinIsr},
  URepInventarioProdSerie in '..\Reportes\URepInventarioProdSerie.pas' {qckRepDatosInventarioSerie: TQuickRep},
  URepRecibo8_5_11REspinal in 'URepRecibo8_5_11REspinal.pas' {qckRepRecibo8_5_11REsp: TQuickRep},
  URepRecibo8_5_11DevolREspinal in 'URepRecibo8_5_11DevolREspinal.pas' {qckRepRecibo8_5_11DevolResp: TQuickRep},
  URFacturaStandarReimpREsp in 'URFacturaStandarReimpREsp.pas' {qckRepFacturaEstandarNewReimpREsp: TQuickRep},
  URepComprobante_II in 'URepComprobante_II.pas' {qckRepReciboNew: TQuickRep},
  UFormReferenciaClientes in 'UFormReferenciaClientes.pas' {frmReferenciaClientes},
  URepInvMargenGananciaXProd in 'URepInvMargenGananciaXProd.pas' {qckRepMargenBeneficio: TQuickRep},
  URepInvMargenGananciaXVenta in 'URepInvMargenGananciaXVenta.pas' {qckRepMargenBeneficioVenta: TQuickRep},
  URepFinanciamientos in 'URepFinanciamientos.pas' {qckRepFinanciamientos: TQuickRep},
  UMenuPrincipal in 'UMenuPrincipal.pas' {frmMenuPrincipal},
  UConsultaInventario in '..\..\Fuentes\UConsultaInventario.pas' {frmConsultaInventario},
  UConsultaPreventa in '..\..\Fuentes\UConsultaPreventa.pas' {frmConsultaPreVenta},
  UDatModFastFood in '..\..\Fuentes\UDatModFastFood.pas' {dmFastfood: TDataModule},
  UFormPrecioProdPorProveedor in '..\..\Fuentes\UFormPrecioProdPorProveedor.pas' {frmListadoCostoProdProveedor},
  UInventarioProd in '..\..\Fuentes\UInventarioProd.pas' {frmInventarioProd},
  UFormPrecioXUnidadNivel in '..\..\Fuentes\UFormPrecioXUnidadNivel.pas' {frmPrecioUnidadNivel},
  ULabelImpCodBarra in '..\..\Fuentes\ULabelImpCodBarra.pas' {frmCodigoBarra},
  UFormDescAdicional in '..\..\Fuentes\UFormDescAdicional.pas' {frmDescripcionAdicional},
  ImageWin in '..\..\Fuentes\ImageWin.pas' {ImageForm},
  ViewWin in '..\..\Fuentes\ViewWin.pas' {ViewForm},
  UFormTasaITBIS in '..\..\Reportes\UFormTasaITBIS.pas' {frmTasaITBIS},
  UFormInfoTasaITBIS in '..\..\Reportes\UFormInfoTasaITBIS.pas' {frmInfoTasaItbis},
  UFormFiltrarTipoInv in '..\..\Fuentes\UFormFiltrarTipoInv.pas' {frmFiltrarInv},
  UCategoriaInventario in '..\..\Reportes\UCategoriaInventario.pas' {frmCategoriaInv},
  UInventarioSubCategoria in '..\..\Reportes\UInventarioSubCategoria.pas' {frmSubCategoriaInv},
  UFormOfertas in '..\..\Fuentes\UFormOfertas.pas' {frmOfertas},
  UFormFiltrarTasaItbis in '..\..\Fuentes\UFormFiltrarTasaItbis.pas' {frmFiltrarTasaItbis},
  UFormLote in '..\..\Fuentes\UFormLote.pas' {frmLotes},
  UFormSistemaIdesi in '..\..\Fuentes\UFormSistemaIdesi.pas' {frmSistemaIdesi},
  UDmSistema in '..\..\Fuentes\UDmSistema.pas' {dmSistema: TDataModule},
  specialfolders in '..\..\Fuentes\specialfolders.pas',
  UDatmodPerm in '..\..\DmCnt\UDatmodPerm.pas' {dmPerm: TDataModule},
  UDatamodulocnt in '..\..\DmCnt\UDatamodulocnt.pas' {dmCnt: TDataModule},
  UDatModCalculos in '..\..\Fuentes\UDatModCalculos.pas' {dmCalculos: TDataModule},
  UFormLog in '..\..\Fuentes\UFormLog.pas' {frmLogError},
  UFormPosExtraDET in '..\..\Fuentes\UFormPosExtraDET.pas' {frmPosExtraDet},
  UConfigRep in '..\..\Fuentes\UConfigRep.pas' {frmConfReporte},
  UFormDimensionProd in '..\..\Fuentes\UFormDimensionProd.pas' {frmDimensionProd},
  UDatModPanaderia in '..\..\Fuentes\UDatModPanaderia.pas' {dmPanaderia: TDataModule},
  UTicketPreventaPos in 'UTicketPreventaPos.pas' {qckTicketPreventaPos: TQuickRep},
  UFormCteDelivery in 'UFormCteDelivery.pas' {frmCteDelivery},
  UfrmInvPrecioAudit in '..\..\Fuentes\UfrmInvPrecioAudit.pas' {frmInvPrecioAudit},
  ULabelImpCodBarraRefactored in '..\..\Fuentes\ULabelImpCodBarraRefactored.pas' {frmCodigoBarraNew},
  UQckRepCodigoBarras in '..\..\Reportes\UQckRepCodigoBarras.pas' {qckCodigoBarraProd: TQuickRep},
  UImprimirzebralabel in '..\..\Fuentes\UImprimirzebralabel.pas' {frmImpZebraLabel},
  UFormAuditoriaInv in '..\..\Fuentes\UFormAuditoriaInv.pas' {frmAuditoriaInv},
  UFormPresupuesto in 'UFormPresupuesto.pas' {frmPresupuestoVta},
  URepPresupuestoFcia in '..\Reportes\URepPresupuestoFcia.pas' {qckPresupuesto: TQuickRep};

{$R *.res}

begin
  Application.Initialize;
  frmPresentacion:=TfrmPresentacion.Create(nil);
  frmPresentacion.Show;
  frmPresentacion.Update;
  Application.HelpFile := '';
  Application.Title := 'Sistema Preventa';
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
  Application.CreateForm(TdmSistema, dmSistema);
  Application.CreateForm(TdmPerm, dmPerm);
  Application.CreateForm(TdmCnt, dmCnt);
  Application.CreateForm(TdmCalculos, dmCalculos);
  Application.CreateForm(TdmPanaderia, dmPanaderia);
  Application.CreateForm(TfrmMenuPrincipal, frmMenuPrincipal);
  frmPresentacion.Close;
  frmPresentacion.Free;
  frmPresentacion:=Nil;
  Application.Run;
end.


