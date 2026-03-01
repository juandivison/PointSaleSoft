unit UDatModReportes;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBQuery, RxQuery, RxMemDS;
         

type
  TdmReportes = class(TDataModule)
    qryDatosRepClientes: TIBQuery;
    qryDatosRepClientesCIUDAD: TIBStringField;
    qryDatosRepClientesCODIGO_AGENCIA: TSmallintField;
    qryDatosRepClientesCODIGO_CTE: TIntegerField;
    qryDatosRepClientesCONTACTO: TIBStringField;
    qryDatosRepClientesDIRECCION_CONT: TIBStringField;
    qryDatosRepClientesEMAIL: TIBStringField;
    qryDatosRepClientesFAX_CONTACTO: TIBStringField;
    qryDatosRepClientesFECHA_INSERTADO: TDateTimeField;
    qryDatosRepClientesFECHA_MOD: TDateTimeField;
    qryDatosRepClientesFORMA_PAGO: TSmallintField;
    qryDatosRepClientesFOTO: TBlobField;
    qryDatosRepClientesLIMITE_CREDITO: TFloatField;
    qryDatosRepClientesMONEDA_FACT: TIBStringField;
    qryDatosRepClientesNOMBRE_ABREV: TIBStringField;
    qryDatosRepClientesNOMBRE_CTE: TIBStringField;
    qryDatosRepClientesNOMBRE_FACTURAR: TIBStringField;
    qryDatosRepClientesPAIS: TIBStringField;
    qryDatosRepClientesSTATUS_CLIENTE: TIBStringField;
    qryDatosRepClientesTELEF_CONTACTO: TIBStringField;
    qryDatosRepClientesTIPO_CLIENTE: TSmallintField;
    qryDatosRepClientesWEBSITE: TIBStringField;
    qryDatosRepClientesDESCRIPCION_TIPOCTE: TIBStringField;
    qryResumenVentas: TIBQuery;
    qryDatosRepVentaDiaria: TIBQuery;
    qryDatosRepVentaDiariaCODIGO_CLIENTE: TIntegerField;
    qryDatosRepVentaDiariaNUMERO_DOCUMENTO: TIntegerField;
    qryDatosRepVentaDiariaTIPO_DOCUMENTO: TIBStringField;
    qryDatosRepVentaDiariaDEBITO: TFloatField;
    qryDatosRepVentaDiariaCREDITO: TFloatField;
    qryDatosRepVentaDiariaVALOR_DOCUMENTO: TFloatField;
    qryDatosRepVentaDiariaTIPO_TRANF: TSmallintField;
    qryDatosRepVentaDiariaMONEDA: TIBStringField;
    qryDatosRepVentaDiariaFECHA: TDateTimeField;
    qryDatosRepVentaDiariaTIPO_DOC: TIntegerField;
    qryDatosRepVentaDiariaSTATUS: TIBStringField;
    qryDatosRepVentaDiariaCODIGO_EMPLEADO: TIntegerField;
    qryDatosRepVentaDiariaPRECIO_PRODUCTO: TIntegerField;
    qryDatosRepVentaDiariaDESCUENTO: TFloatField;
    qryDatosRepVentaDiariaDESCRIPCION_PRODUCTO: TIBStringField;
    qryDatosRepVentaDiariaCANTIDAD: TFloatField;
    qryDatosRepVentaMesxDia: TIBQuery;
    qryDatosRepVentaMesxDiaMES: TSmallintField;
    qryDatosRepVentaMesxDiaDIA: TSmallintField;
    qryDatosRepVentaMesxDiaMONEDA: TIBStringField;
    qryDatosRepVentaMesxDiaMONTO: TFloatField;
    rxDatosOrganizadosDiaxMes: TRxMemoryData;
    qryVigenciaCxc: TIBQuery;
    qryVigenciaCxcCODIGO: TIntegerField;
    qryVigenciaCxcNOMBRE_FACTURAR: TIBStringField;
    qryVigenciaCxcFECHA_BCE: TDateTimeField;
    qryVigenciaCxcFECHA_ULT_PAGO: TDateTimeField;
    qryVigenciaCxcMORAENDIAS: TIntegerField;
    qryVigenciaCxcMORAENMESES: TFloatField;
    qryVigenciaCxcBALANCE_ACT: TFloatField;
    qryVigenciaCxcNOMBRE_FACTURAR1: TIBStringField;
    qryVigenciaCxcFECHA_BCE1: TDateTimeField;
    qryResumenDespacho: TIBQuery;
    qryDatosRepInventario: TIBQuery;
    qryDatosResumenBeneficioBruto: TIBQuery;
    qryDatosResumenBeneficioBrutoCODIGO: TIntegerField;
    qryDatosResumenBeneficioBrutoDESCRIPCION: TIBStringField;
    qryDatosResumenBeneficioBrutoPRECIO: TFloatField;
    qryDatosResumenBeneficioBrutoPRECIO_DISTRIBUIDOR: TFloatField;
    qryDatosResumenBeneficioBrutoCANT: TFloatField;
    qryDatosResumenBeneficioBrutoMONTO: TFloatField;
    qryDatosResumenBeneficioBrutoBENEFICIO: TFloatField;
    qryPrecioInventario: TIBQuery;
    qryRepInventarioProdMasBclRuta: TIBQuery;
    qryDatosRepVxCajas: TIBQuery;
    qryDatosRepVxCajasRUTA: TIntegerField;
    qryDatosRepVxCajasFECHA: TDateTimeField;
    qryDatosRepVxCajasCODIGO_EMP: TIntegerField;
    qryDatosRepVxCajasCODIGO_PROD: TIBStringField;
    qryDatosRepVxCajasCANTIDAD: TFloatField;
    qryDatosRepVxCajasDESCRIPCION: TIBStringField;
    qryDatosRepVxCajasPRECIO: TFloatField;
    qryDatosRepVxCajasMonto: TFloatField;
    qryDatosRepVxCajasNOMBRE: TIBStringField;
    qryDatosRepVxCajasAPELLIDO: TIBStringField;
    qryDatosRepVxCajasNOMBRECOMPLETO: TIBStringField;
    qryDatosRepVxCajasResumen: TIBQuery;
    qryDatosRepVxCajasResumenRUTA: TIntegerField;
    qryDatosRepVxCajasResumenCODIGO_EMP: TIntegerField;
    qryDatosRepVxCajasResumenCANTIDAD: TFloatField;
    qryDatosRepVxCajasResumenNOMBRE: TIBStringField;
    qryDatosRepVxCajasResumenAPELLIDO: TIBStringField;
    qryDatosRepVxCajasResumenNOMBRECOMPLETO: TIBStringField;
    qryDatosRepVxCajasResumenDESCRIPCION: TIBStringField;
    qryDatosRepVxCajasResumenPRECIO: TFloatField;
    qryDatosRepVxCajasResumenMonto: TFloatField;
    qryRepTransOpeDiaria: TIBQuery;
    qryRepTransOpeDiariaNUMERO: TIntegerField;
    qryRepTransOpeDiariaCOD_PROVEEDOR: TIntegerField;
    qryRepTransOpeDiariaFECHA: TDateTimeField;
    qryRepTransOpeDiariaFPAGO: TSmallintField;
    qryRepTransOpeDiariaOBSERVACION: TIBStringField;
    qryRepTransOpeDiariaMONTO: TFloatField;
    qryRepTransOpeDiariaSTATUS: TIBStringField;
    qryRepTransOpeDiariaSTATUS_CNT: TIBStringField;
    qryRepTransOpeDiariaIN_POR: TIBStringField;
    qryRepTransOpeDiariaFECHA_IN: TDateTimeField;
    qryRepTransOpeDiariaMOD_POR: TIBStringField;
    qryRepTransOpeDiariaFECHA_MOD: TDateTimeField;
    qryRepTransOpeDiariaSERIE: TFloatField;
    qryRepTransOpeDiariaCOD_SERV_PROD: TIntegerField;
    qryRepTransOpeDiariaDEPARTAMENTO: TIntegerField;
    qryRepTransOpeDiariaOBSERVACION1: TIBStringField;
    qryRepTransOpeDiariaCANTIDAD: TFloatField;
    qryRepTransOpeDiariaPRECIO: TFloatField;
    qryRepTransOpeDiariaVALOR: TFloatField;
    qryRepTransOpeDiariaNUMERO_DOCUMENTO: TIntegerField;
    qryRepTransOpeDiariaNUMERO_FACTURA: TIntegerField;
    qryRepTransOpeDiariaCOD_CTA_CONCEPTO: TIntegerField;
    qryRepTransOpeDiariaCODIGO_USUARIO: TIntegerField;
    qryRepTransOpeDiariaSTATUS1: TIBStringField;
    qryRepTransOpeDiariaNOMBREPROVEEDOR: TIBStringField;
    qryRepTransOpeDiariaNOMBRE_CENTRO_COSTO: TIBStringField;
    qryRepTransOpeDiariaNOMBRE_DEPARTAMENTO: TIBStringField;
    qryRepTransOpeDiariaNOMBREUSUARIO: TIBStringField;
    qryDatosRepDifVendedores: TIBQuery;
    qryDatosRepDifVendedoresFECHA: TDateTimeField;
    qryDatosRepDifVendedoresRUTA: TIntegerField;
    qryDatosRepDifVendedoresCODIGO_EMP: TIntegerField;
    qryDatosRepDifVendedoresNOMBRE: TIBStringField;
    qryDatosRepDifVendedoresAPELLIDO: TIBStringField;
    qryDatosRepDifVendedoresEFECTIVO: TFloatField;
    qryDatosRepDifVendedoresCHEQUE: TFloatField;
    qryDatosRepDifVendedoresCREDITO_DIRECTO: TFloatField;
    qryDatosRepDifVendedoresCREDITO_NORMAL: TFloatField;
    qryDatosRepDifVendedoresPROMOCION: TFloatField;
    qryDatosRepDifVendedoresMONTO_VENTA: TFloatField;
    qryDatosRepDifVendedoresMontoReportado: TFloatField;
    qryDatosRepDifVendedoresDiferencia: TFloatField;
    qryDatosRepDifVendedoresAJUSTE: TFloatField;
    qryDatosRepDifVendedoresCOMENTARIO: TMemoField;
    QryDatosComsionxVenta: TIBQuery;
    QryDatosComsionxVentaCODIGO_EMP: TIntegerField;
    QryDatosComsionxVentaCODIGO_RUTA: TIntegerField;
    QryDatosComsionxVentaTIPO_COMISION: TIntegerField;
    QryDatosComsionxVentaMONTO_COMISION: TFloatField;
    QryDatosComsionxVentaCANT_CAJAS_VENDIDAS: TFloatField;
    QryDatosComsionxVentaCOMISION_NETA: TFloatField;
    QryDatosComsionxVentaDESC_PRODUCTO: TIBStringField;
    QryDatosComsionxVentaFECHA_VENTA: TDateTimeField;
    QryDatosComsionxVentaNOMBRE_EMPLEADO: TIBStringField;
    qryRepComResXEmp: TIBQuery;
    qryRepComResXEmpCODIGO_EMP: TIntegerField;
    qryRepComResXEmpDESC_PRODUCTO: TIBStringField;
    qryRepComResXEmpNOMBRE_EMPLEADO: TIBStringField;
    qryRepComResXEmpMONTO_COMISION: TFloatField;
    qryRepComResXEmpCANT_CAJAS_VENDIDAS: TFloatField;
    qryRepComResXEmpCOMISION_NETA: TFloatField;
    qryPrecioComisiones: TIBQuery;
    qryRepPromociones: TIBQuery;
    qryRepPromocionesRUTA: TIntegerField;
    qryRepPromocionesFECHA: TDateTimeField;
    qryRepPromocionesCODIGO_PROD: TIBStringField;
    qryRepPromocionesCODIGO_CTE: TIntegerField;
    qryRepPromocionesCANTIDAD: TFloatField;
    qryRepPromocionesCODIGO_USUARIO: TIntegerField;
    qryRepPromocionesFECHA_IN: TDateTimeField;
    qryRepPromocionesSTATUS: TIBStringField;
    qryRepPromocionesNOMBRE: TIBStringField;
    qryRepPromocionesAPELLIDO: TIBStringField;
    qryRepPromocionesDESC_PRODUCTO: TIBStringField;
    qryRepPromocionesCODIGO: TIntegerField;
    qryRepPromocionesCODIGO_EMP: TIntegerField;
    qryRepPromocionesPRECIO: TFloatField;
    qryRepPromocionesPRECIO_DISTRIBUIDOR: TFloatField;
    qryDatosFaltante: TIBQuery;
    qryDatosFaltanteFECHA: TDateTimeField;
    qryDatosFaltanteRUTA: TIntegerField;
    qryDatosFaltanteCODIGO_EMP: TIntegerField;
    qryDatosFaltanteNOMBRE: TIBStringField;
    qryDatosFaltanteAPELLIDO: TIBStringField;
    qryDatosFaltanteEFECTIVO: TFloatField;
    qryDatosFaltanteCHEQUE: TFloatField;
    qryDatosFaltanteCREDITO_DIRECTO: TFloatField;
    qryDatosFaltanteCREDITO_NORMAL: TFloatField;
    qryDatosFaltantePROMOCION: TFloatField;
    qryDatosFaltanteMONTO_VENTA: TFloatField;
    qryDatosFaltanteAJUSTE: TFloatField;
    qryDatosFaltanteCOMENTARIO: TMemoField;
    qryDatosFaltanteMontoReportado: TFloatField;
    qryDatosFaltanteDiferencia: TFloatField;
    qryRepFinancDistcuota: TIBQuery;
    qryRepFinancDistcuotaCODIGO_CTE: TIntegerField;
    qryRepFinancDistcuotaNOMBRE_CTE: TIBStringField;
    qryRepFinancDistcuotaCEDULA: TIBStringField;
    qryRepFinancDistcuotaCIUDAD: TIBStringField;
    qryRepFinancDistcuotaPAIS: TIBStringField;
    qryRepFinancDistcuotaDIRECCION_CONT: TIBStringField;
    qryRepFinancDistcuotaTELEF_CONTACTO: TIBStringField;
    qryRepFinancDistcuotaCANT_CUOTAS: TIntegerField;
    qryRepFinancDistcuotaMONTOINICIAL: TFloatField;
    qryRepFinancDistcuotaPORCIENTO: TFloatField;
    qryRepFinancDistcuotaFECHA: TDateTimeField;
    qryRepIngresos: TIBQuery;
    qryDatosRepVentaDiariaDESC_PRODUCTO: TIBStringField;
    qryDatosRepVentaDiariaDESC_TIPO_INVENTARIO: TIBStringField;
    qryDatosRepVentaDiariaXTIPO_INVENTARIO: TIntegerField;
    qryDatosRepVentaDiariaNUMERO_TRN: TIntegerField;
    qryDatosSaldoAntiguedadCxc: TIBQuery;
    qryDatosSaldoAntiguedadCxcDIASENATRASO: TIntegerField;
    qryDatosSaldoAntiguedadCxcCANTMESES: TFloatField;
    qryDatosSaldoAntiguedadCxcNUMERO: TFloatField;
    qryDatosSaldoAntiguedadCxcFECHA: TDateTimeField;
    qryDatosSaldoAntiguedadCxcCODIGO_CTE: TIntegerField;
    qryDatosSaldoAntiguedadCxcMONTO_PENDIENTE: TFloatField;
    qryDatosSaldoAntiguedadCxcSTATUS: TIBStringField;
    qryDatosSaldoAntiguedadCxcNOMBRE_CTE: TIBStringField;
    rxSaldoAntCxc: TRxMemoryData;
    rxSaldoAntCxccodigo: TIntegerField;
    rxSaldoAntCxcNombreCliente: TStringField;
    rxSaldoAntCxcd30: TCurrencyField;
    rxSaldoAntCxcd60: TCurrencyField;
    rxSaldoAntCxcd90: TCurrencyField;
    rxSaldoAntCxcd120: TCurrencyField;
    rxSaldoAntCxcNumFact: TIntegerField;
    dsrxSaldoAntCxc: TDataSource;
    rxSaldoAntCxcrnc: TStringField;
    qryDatosSaldoAntiguedadCxcRNC_NUMERO: TIBStringField;
    qryDatosRepVentaDiariaCODIGO_PRODUCTO: TIBStringField;
    qryDatosResumenBeneficioBrutoCODIGO_TEXTO: TIBStringField;
    qryDatosRepVxCajasResumenCODIGO_PROD: TIBStringField;
    qryRepComResXEmpCODIGO_PROD: TIBStringField;
    QryDatosComsionxVentaCODIGO_PROD: TIBStringField;
    qryRepInventarioProdMasBclRutaCANTIDAD: TFloatField;
    qryRepInventarioProdMasBclRutaUNIDAD: TFloatField;
    qryRepInventarioProdMasBclRutaCODIGO: TIntegerField;
    qryRepInventarioProdMasBclRutaPRECIO: TFloatField;
    qryRepInventarioProdMasBclRutaFECHA_ULTIMA_TRN: TDateTimeField;
    qryRepInventarioProdMasBclRutaCODIGO_TEXTO: TIBStringField;
    qryRepInventarioProdMasBclRutaFECHA: TDateTimeField;
    qryRepInventarioProdMasBclRutaCODIGO_BARRA: TIBStringField;
    qryRepInventarioProdMasBclRutaTIPO: TIntegerField;
    qryRepInventarioProdMasBclRutaCANTIDAD_REORDEN: TIntegerField;
    qryRepInventarioProdMasBclRutaPRECIO_ANT: TFloatField;
    qryRepInventarioProdMasBclRutaBLCE_CANT_ENTRADA: TFloatField;
    qryRepInventarioProdMasBclRutaBLCE_CANT_SALIDA: TFloatField;
    qryRepInventarioProdMasBclRutaSTATUS: TIBStringField;
    qryRepInventarioProdMasBclRutaPORC_DESCUENTO: TFloatField;
    qryRepInventarioProdMasBclRutaFOTO: TBlobField;
    qryRepInventarioProdMasBclRutaPAGA_ITBI: TSmallintField;
    qryRepInventarioProdMasBclRutaCODIGO_PRECIO: TIBStringField;
    qryRepInventarioProdMasBclRutaBALANCE_EN_RUTA: TFloatField;
    qryRelacionFacturas: TIBQuery;
    qryRepInventarioProdMasBclRutaPRECIO_COMPRA: TFloatField;
    qryRepInventarioProdMasBclDiv: TIBQuery;
    qryRepInventarioProdMasBclDivCANTIDAD: TFloatField;
    qryRepInventarioProdMasBclDivUNIDAD: TFloatField;
    qryRepInventarioProdMasBclDivCODIGO: TIntegerField;
    qryRepInventarioProdMasBclDivPRECIO: TFloatField;
    qryRepInventarioProdMasBclDivFECHA_ULTIMA_TRN: TDateTimeField;
    qryRepInventarioProdMasBclDivCODIGO_TEXTO: TIBStringField;
    qryRepInventarioProdMasBclDivFECHA: TDateTimeField;
    qryRepInventarioProdMasBclDivCODIGO_BARRA: TIBStringField;
    qryRepInventarioProdMasBclDivTIPO: TIntegerField;
    qryRepInventarioProdMasBclDivCANTIDAD_REORDEN: TIntegerField;
    qryRepInventarioProdMasBclDivPRECIO_ANT: TFloatField;
    qryRepInventarioProdMasBclDivBLCE_CANT_ENTRADA: TFloatField;
    qryRepInventarioProdMasBclDivBLCE_CANT_SALIDA: TFloatField;
    qryRepInventarioProdMasBclDivSTATUS: TIBStringField;
    qryRepInventarioProdMasBclDivPORC_DESCUENTO: TFloatField;
    qryRepInventarioProdMasBclDivFOTO: TBlobField;
    qryRepInventarioProdMasBclDivPAGA_ITBI: TSmallintField;
    qryRepInventarioProdMasBclDivCODIGO_PRECIO: TIBStringField;
    qryRepInventarioProdMasBclDivBALANCE_EN_RUTA: TFloatField;
    qryRepInventarioProdMasBclDivPRECIO_COMPRA: TFloatField;
    qryDivInventario: TIBQuery;
    qryDivInventarioINVENTARIO_ID: TIntegerField;
    qryDivInventarioSTATUS: TIBStringField;
    qryRepComisionVPlan: TIBQuery;
    dsqryRepComisionVPlan: TDataSource;
    qryComisionVPlan: TIBQuery;
    qryRepComisionVPlanNOMBRE: TIBStringField;
    qryRepComisionVPlanID_TIPO_PLAN: TSmallintField;
    qryRepComisionVPlanNOMBRE_CTE: TIBStringField;
    qryRepComisionVPlanFECHA_APERTURA: TDateTimeField;
    qryRepComisionVPlanCODIGO_CTE: TIntegerField;
    qryRepComisionVPlanID_PLAN: TIntegerField;
    qryRepComisionVPlanDESCRIPCION: TIBStringField;
    qryComisionVPlanPORC_COMISION: TFloatField;
    qryComisionVPlanPRECIO: TFloatField;
    qryRepComisionVPlanPorcCom: TCurrencyField;
    qryRepComisionVPlanPrecioTarifa: TCurrencyField;
    qryRepComisionVPlanCODIGO: TIntegerField;
    qryInventarioSerie: TIBQuery;
    qryInventarioSerieCODIGO: TIntegerField;
    qryInventarioSerieSERIE: TIBStringField;
    qryInventarioSerieSTATUS: TIBStringField;
    qryDatosSaldoAntiguedadCxcDESCRIPCION: TIBStringField;
    qryRepFinancDistcuotaMONTO_CAP_INICIAL: TFloatField;
    qryMargenGanInvent: TIBQuery;
    qryMargenGanInventCODIGO: TIntegerField;
    qryMargenGanInventTIPO: TIntegerField;
    qryMargenGanInventDESC_TIPO_INVENTARIO: TIBStringField;
    qryMargenGanInventPRECIO_COMPRA: TFloatField;
    qryMargenGanInventPRECIO: TFloatField;
    qryMargenGanInventMARGEN: TFloatField;
    qryMargenBruto: TIBQuery;
    qryMargenBrutoCODIGO_TEXTO: TIBStringField;
    qryMargenBrutoCODIGO: TIntegerField;
    qryMargenBrutoDESCTIPOINV: TIBStringField;
    qryMargenBrutoPRECIO_COMPRA: TFloatField;
    qryMargenBrutoPRECIO: TFloatField;
    qryMargenBrutoCOSTONETO: TFloatField;
    qryMargenBrutoCANT: TFloatField;
    qryMargenBrutoMONTO_VENTA_NETO: TFloatField;
    qryMargenBrutoBENEFICIO: TCurrencyField;
    qryRepFinanciamientos: TIBQuery;
    qryRepFinanciamientosSERIE: TIntegerField;
    qryRepFinanciamientosNUMERO_TRN: TIntegerField;
    qryRepFinanciamientosFECHA: TDateTimeField;
    qryRepFinanciamientosCODIGO_CTE: TIntegerField;
    qryRepFinanciamientosTIPO_FREC_PAGO: TIntegerField;
    qryRepFinanciamientosPORCIENTO: TFloatField;
    qryRepFinanciamientosPORC_MORA: TFloatField;
    qryRepFinanciamientosCANT_CUOTAS: TIntegerField;
    qryRepFinanciamientosMONTOINICIAL: TFloatField;
    qryRepFinanciamientosDEBITO_ACUM: TFloatField;
    qryRepFinanciamientosCREDITO_ACUM: TFloatField;
    qryRepFinanciamientosMONTO_MORA_ACUM: TFloatField;
    qryRepFinanciamientosMONTO_DESC_PRONTOPAGO: TFloatField;
    qryRepFinanciamientosBALANCE_ACT: TFloatField;
    qryRepFinanciamientosFECHA_ULT_PAGO: TDateTimeField;
    qryRepFinanciamientosSTATUS: TIBStringField;
    qryRepFinanciamientosID_USUARIO_IN: TIntegerField;
    qryRepFinanciamientosFECHA_IN: TDateTimeField;
    qryRepFinanciamientosNOMBREPC: TIBStringField;
    qryRepFinanciamientosFECHA_UPDATE: TDateTimeField;
    qryRepFinanciamientosID_USUARIO_UPDATE: TIntegerField;
    qryRepFinanciamientosCUOTASPEND: TIntegerField;
    qryRepFinanciamientosNUM_FACTURA: TIntegerField;
    qryRepFinanciamientosMONTO_CAP_INICIAL: TFloatField;
    qryRepFinanciamientosNOMBRE_CTE: TIBStringField;
    qryRepFinanciamientosTELEF_CONTACTO: TIBStringField;
    qryRepRequisicion: TIBQuery;
    qryRepRequisicionXfecha: TIBQuery;
    qryViewVentasMast: TIBQuery;
    qryViewVentasDet: TIBQuery;
    qryViewVentasMastNUMERO: TIntegerField;
    qryViewVentasMastFECHA: TDateTimeField;
    qryViewVentasMastCODIGO_CTE: TIntegerField;
    qryViewVentasMastCODIGO_VENDEDOR: TIntegerField;
    qryViewVentasMastFORMA_PAGO: TSmallintField;
    qryViewVentasMastOBSERVACION: TIBStringField;
    qryViewVentasMastMONEDA: TIBStringField;
    qryViewVentasMastVALOR_TOTAL_DET: TFloatField;
    qryViewVentasMastSTATUS: TIBStringField;
    qryViewVentasMastNUMERO_FACTURA: TIntegerField;
    qryViewVentasMastNUMERO_DOC_PAGO: TIBStringField;
    qryViewVentasMastSERIE_NCF_ASIGNADO: TIntegerField;
    qryViewVentasMastMONTO_BRUTO: TFloatField;
    qryViewVentasMastPORC_DESCUENTO: TIntegerField;
    qryViewVentasMastMONTO_DESCUENTO: TFloatField;
    qryViewVentasMastMONTO_PAGADO: TFloatField;
    qryViewVentasMastMONTO_CAMBIO: TFloatField;
    qryViewVentasMastNOMBRE_CLIENTE_GENERAL: TIBStringField;
    qryViewVentasMastNOMBRE_COMPLETO: TIBStringField;
    qryViewVentasMastNUMERO_NCF: TIBStringField;
    qryViewVentasMastTIPO_NCF: TIBStringField;
    qryViewVentasMastNOMBRE_CTE: TIBStringField;
    qryViewVentasMastCEDULA: TIBStringField;
    qryViewVentasMastRNC: TIBStringField;
    qryViewVentasMastDIRECCION_CONT: TIBStringField;
    qryViewVentasMastTELEF_CONTACTO: TIBStringField;
    qryViewVentasMastDESC_TIPOPAGO: TIBStringField;
    qryViewVentasMastORIGEN: TSmallintField;
    qryViewVentasDetSERIE: TIntegerField;
    qryViewVentasDetNUMERO: TIntegerField;
    qryViewVentasDetCODIGO_PROD: TIBStringField;
    qryViewVentasDetCODIGO_BARRA: TIBStringField;
    qryViewVentasDetCANTIDAD: TFloatField;
    qryViewVentasDetPRECIO: TFloatField;
    qryViewVentasDetPORC_DESC_DET: TFloatField;
    qryViewVentasDetITBI_DET: TFloatField;
    qryViewVentasDetVALOR_SERVICIO_DET: TFloatField;
    qryViewVentasDetVALOR_TOTAL_DET: TFloatField;
    qryViewVentasDetNUM_FACTURA: TFloatField;
    qryViewVentasDetSTATUS_DET: TIBStringField;
    qryViewVentasDetCANT_REGRESO: TFloatField;
    qryViewVentasDetCANT_PROMO: TFloatField;
    qryViewVentasDetMONTO_DIETA: TFloatField;
    qryViewVentasDetMONTO_AJUSTE: TFloatField;
    qryViewVentasDetSERIE_PROD: TIBStringField;
    qryViewVentasDetSTATUS_CNT: TIBStringField;
    qryViewVentasDetTIPO_VENTA: TSmallintField;
    qryViewVentasDetDESC_TIPOUNIDAD: TIBStringField;
    qryViewVentasDetCX_TIPOUNIDAD: TIntegerField;
    qryViewVentasDetIDUNIDAD: TIntegerField;
    qryViewVentasMastMONTO_INICIAL: TFloatField;
    qryViewVentasMastDESC_TIPONCF: TIBStringField;
    qryRepInvFisicoPan: TIBQuery;
    qryDatosRepVentaDiariaSTATUS_DET: TIBStringField;
    qryDatosRepVentaDiariaMONTO_INICIAL: TFloatField;
    qryRelacionFacturasDet: TIBQuery;
    qryRelacionFacturasDetFECHA: TDateTimeField;
    qryRelacionFacturasDetCODIGO_PROD: TIBStringField;
    qryRelacionFacturasDetCANTIDAD: TFloatField;
    qryRepEstudianteRep: TIBQuery;
    qryRepEstudianteRepMast: TIBQuery;
    qryRepEstudianteRepMastCODIGO_CTE: TIntegerField;
    qryRepEstudianteRepMastNOMBRE_TUTOR: TIBStringField;
    qryRepEstudianteRepMastCEDULA_PADRE: TIBStringField;
    qryRepEstudianteRepMastNOMBREPADRE: TIBStringField;
    qryRepEstudianteRepMastCEDULA_MADRE: TIBStringField;
    qryRepEstudianteRepMastNOMBREMADRE: TIBStringField;
    qryRepEstudianteRepMastSTATUS: TIBStringField;
    qryRepEstudianteRepMastFECHASALIDA: TDateTimeField;
    qryRepEstudianteRepMastFECHAENTRADA: TDateTimeField;
    qryRepEstudianteRepMastDIRECCION_CONT: TIBStringField;
    qryRepEstudianteRepMastTELEF_CONTACTO: TIBStringField;
    qryRepEstudianteRepMastCIUDAD: TIBStringField;
    qryRepEstudianteRepMastCEDULA_TUTOR: TIBStringField;
    qryRepEstudiantesActivos: TIBQuery;
    qryRepEstudiantesActivosID_ESTUDIANTE: TIntegerField;
    qryRepEstudiantesActivosIDFAMILIA: TIntegerField;
    qryRepEstudiantesActivosSTATUS: TIBStringField;
    qryRepEstudiantesActivosNOMBRE_ESTUDIANTE: TIBStringField;
    qryRepEstudiantesActivosFECHANACIMIENTO: TDateTimeField;
    qryRepEstudiantesActivosDESCRIPCION_CURSOS: TIBStringField;
    qryRepEstudiantesActivosNUMERO_ESTUDIANTE: TIBStringField;
    qryRepEstudiantesActivosIDCURSO: TIntegerField;
    qryRepEstudiantesActivosDESC_SECCION: TIBStringField;
    qryGetDatosTemplateXLS: TIBQuery;
    qryGetDatosTemplateXLSNOMBRE_TEMPLATE: TIBStringField;
    qryGetDatosTemplateXLSNOMBRE_ARCHIVO: TIBStringField;
    qryGetDatosTemplateXLSSERIEID: TIntegerField;
    qryGetDatosTemplateXLSNUMEROID: TIntegerField;
    qryGetDatosTemplateXLSSECCION: TIBStringField;
    qryGetDatosTemplateXLSNOMBRE_CAMPO: TIBStringField;
    qryGetDatosTemplateXLSDESCRIPCION_LABEL: TIBStringField;
    qryGetDatosTemplateXLSCOLUMNA_NOMBRE: TIBStringField;
    qryGetDatosTemplateXLSFILE_NUMERO: TIBStringField;
    qryGetDatosTemplateXLSISDETAIL: TSmallintField;
    qryGetDatosTemplateXLSSTATUS: TIBStringField;
    qryViewVentasDetDESCRIPCIONPRODUCTO: TMemoField;
    qryViewVentasMastNumeroDocCldo: TStringField;
    qryViewVentasDetMontototal: TCurrencyField;
    qryViewVentasMastNOMBRE_ABREV: TIBStringField;
    qryRelacionFacturasTELEFONO: TIBStringField;
    qryRelacionFacturasCIUDAD: TIBStringField;
    qryRelacionFacturasDIASENATRASO: TIntegerField;
    qryRelacionFacturasCANTMESES: TFloatField;
    qryRelacionFacturasNUMERO: TFloatField;
    qryRelacionFacturasFECHA: TDateTimeField;
    qryRelacionFacturasCODIGO_CTE: TIntegerField;
    qryRelacionFacturasMONTO_PENDIENTE: TFloatField;
    qryRelacionFacturasSTATUS: TIBStringField;
    qryRelacionFacturasDESCRIPCION: TIBStringField;
    qryRelacionFacturasNOMBRE_CTE: TIBStringField;
    qryRelacionFacturasRNC_NUMERO: TIBStringField;
    qryRelacionFacturasDetDESCRIPCION: TIBStringField;
    qryViewVentasDetDESCRIPCION: TIBStringField;
    rxSaldoAntCxcFecha: TDateTimeField;
    qryDatosRepVentaDiariaNOMBRE_FACTURAR: TIBStringField;
    qryDatosRepInventarioCODIGO: TIntegerField;
    qryDatosRepInventarioCODIGO_TEXTO: TIBStringField;
    qryDatosRepInventarioFECHA: TDateTimeField;
    qryDatosRepInventarioCODIGO_BARRA: TIBStringField;
    qryDatosRepInventarioTIPO: TIntegerField;
    qryDatosRepInventarioDESCRIPCION: TIBStringField;
    qryDatosRepInventarioCANTIDAD_REORDEN: TIntegerField;
    qryDatosRepInventarioPRECIO_ANT: TFloatField;
    qryDatosRepInventarioCANTIDAD: TFloatField;
    qryDatosRepInventarioPRECIO: TFloatField;
    qryDatosRepInventarioBLCE_CANT_ENTRADA: TFloatField;
    qryDatosRepInventarioBLCE_CANT_SALIDA: TFloatField;
    qryDatosRepInventarioFECHA_ULTIMA_TRN: TDateTimeField;
    qryDatosRepInventarioSTATUS: TIBStringField;
    qryDatosRepInventarioPORC_DESCUENTO: TFloatField;
    qryDatosRepInventarioFOTO: TBlobField;
    qryDatosRepInventarioPAGA_ITBI: TSmallintField;
    qryDatosRepInventarioCODIGO_PRECIO: TIBStringField;
    qryDatosRepInventarioUNIDAD: TFloatField;
    qryDatosRepInventarioPRECIO_COMPRA: TFloatField;
    qryDatosRepInventarioPRECIO_MINIMO: TFloatField;
    qryDatosRepInventarioREFERENCIA: TIBStringField;
    qryDatosRepInventarioFECHA_VENCIMIENTO: TDateTimeField;
    qryDatosRepInventarioINVENTARIAR: TSmallintField;
    qryDatosRepInventarioPRECIO_TIPO_UNIDAD: TFloatField;
    qryDatosRepInventarioTIPO_UNIDAD: TIntegerField;
    qryDatosRepInventarioORIGEN: TIntegerField;
    qryDatosRepInventarioUBICACION: TIBStringField;
    qryDatosRepInventarioREFERENCIA_ALTERNA: TIBStringField;
    qryDatosRepInventarioMARCA: TIBStringField;
    qryDatosRepInventarioMODELO: TIBStringField;
    qryDatosRepInventarioPRECIOVENTA1: TFloatField;
    qryDatosRepInventarioPRECIOVENTA2: TFloatField;
    qryDatosRepInventarioPRECIOVENTA3: TFloatField;
    qryDatosRepInventarioPRECIOVENTA4: TFloatField;
    qryDatosRepInventarioPORCUTILIDAD1: TFloatField;
    qryDatosRepInventarioPORCUTILIDAD2: TFloatField;
    qryDatosRepInventarioPORCUTILIDAD3: TFloatField;
    qryDatosRepInventarioPORCUTILIDAD4: TFloatField;
    qryDatosRepInventarioUSARLEVELPRECIO: TSmallintField;
    qryDatosRepInventarioCIA_KEY: TIntegerField;
    qryDatosRepInventarioSITUACIONPROD: TSmallintField;
    qryDatosRepInventarioAPLICAIMPTOCOMPRA: TSmallintField;
    qryDatosRepInventarioCODFABRICANTE: TIntegerField;
    qryDatosRepInventarioCTAINVENTARIO: TIBStringField;
    qryDatosRepInventarioCTAVENTA: TIBStringField;
    qryDatosRepInventarioCTACOMPRA: TIBStringField;
    qryDatosRepInventarioCODSUBCATEGORIA: TIntegerField;
    qryDatosRepInventarioCODCATEGORIA: TIntegerField;
    qryDatosRepInventarioPORCITBIS: TFloatField;
    qryDatosRepInventarioCOD_MONEDA: TIBStringField;
    qryDatosRepInventarioKILOMETROS: TFloatField;
    qryRepInventarioProdMasBclRutaDESCRIPCION: TIBStringField;
    qryRelacionFacturasDIRECCION_CONT: TIBStringField;
    qryMargenBrutoTIPO: TIntegerField;
    qryMargenBrutoDESCRIPCION: TIBStringField;
    qryRepRequisicionDESC_TIPO_UNIDAD: TIBStringField;
    qryRepRequisicionCODIGO_PROD: TIntegerField;
    qryRepRequisicionTIPO_UNIDAD: TIntegerField;
    qryRepRequisicionDESC_PRODUCTO: TIBStringField;
    qryRepRequisicionID_REQUISICION: TIntegerField;
    qryRepRequisicionCANTIDAD: TFloatField;
    qryRepRequisicionPRECIO: TFloatField;
    qryRepRequisicionVALOR: TFloatField;
    qryRepRequisicionSERIE: TIntegerField;
    qryRepRequisicionFECHA: TDateTimeField;
    qryRepRequisicionID_RECETA: TIntegerField;
    qryRepRequisicionDESC_RECETA: TIBStringField;
    qryRepRequisicionXfechaDESC_TIPO_UNIDAD: TIBStringField;
    qryRepRequisicionXfechaCODIGO_PROD: TIntegerField;
    qryRepRequisicionXfechaTIPO_UNIDAD: TIntegerField;
    qryRepRequisicionXfechaDESC_PRODUCTO: TIBStringField;
    qryRepRequisicionXfechaID_REQUISICION: TIntegerField;
    qryRepRequisicionXfechaCANTIDAD: TFloatField;
    qryRepRequisicionXfechaPRECIO: TFloatField;
    qryRepRequisicionXfechaVALOR: TFloatField;
    qryRepRequisicionXfechaSERIE: TIntegerField;
    qryRepRequisicionXfechaFECHA: TDateTimeField;
    qryRepRequisicionXfechaID_RECETA: TIntegerField;
    qryRepRequisicionXfechaDESC_RECETA: TIBStringField;
    qryViewVentasMastNOMBRE_FACTURAR: TIBStringField;
    qryViewVentasMastCOMENTARIO: TIBStringField;
    qryPrecioInventarioCODIGO_TEXTO: TIBStringField;
    qryPrecioInventarioFECHA_INICIAL: TDateTimeField;
    qryPrecioInventarioFECHA_FINAL: TDateTimeField;
    qryPrecioInventarioDESCRIPCION: TIBStringField;
    qryPrecioInventarioPRECIO_DISTRIBUIDOR: TFloatField;
    qryPrecioInventarioPRECIO_UNITARIO: TFloatField;
    qryPrecioInventarioMARGENES: TFloatField;
    qryPrecioInventarioPRECIOS_EN_GENERAL: TFloatField;
    qryPrecioInventarioCANTIDAD: TFloatField;
    qryPrecioInventarioUNIDAD: TFloatField;
    qryPrecioInventarioCODIGO: TIntegerField;
    qryRepInventarioProdMasBclDivDESCRIPCION: TIBStringField;
    qryDivInventarioDESCRIPCION: TIBStringField;
    qryMargenGanInventDESCRIPCION: TIBStringField;
    qryRepInvFisicoPanID_TRAN: TIntegerField;
    qryRepInvFisicoPanFECHA: TDateTimeField;
    qryRepInvFisicoPanCODIGO_PROD: TIntegerField;
    qryRepInvFisicoPanCANT: TFloatField;
    qryRepInvFisicoPanPRECIO_COMPRA: TFloatField;
    qryRepInvFisicoPanPRECIO: TFloatField;
    qryRepInvFisicoPanCOD_EMPLEADO: TIntegerField;
    qryRepInvFisicoPanIN_POR: TIBStringField;
    qryRepInvFisicoPanFECHA_IN: TDateTimeField;
    qryRepInvFisicoPanSTATUS: TIBStringField;
    qryRepInvFisicoPanDESCRIPCION: TIBStringField;
    qryRepInvFisicoPanNOMBREEMPLEADO: TIBStringField;
    qryDatosRepVentaDiariaNOMBRE_VENDEDOR: TIBStringField;
    QryServiciosTaller: TIBQuery;
    QryServiciosTallerDESCTIPOINVENTARIO: TIBStringField;
    QryServiciosTallerDESCRIPCION_SERVICIO: TIBStringField;
    QryServiciosTallerDESCRIPCIONADICIONAL: TMemoField;
    QryServiciosTallerCOD_SERVICIO: TIntegerField;
    QryServiciosTallerSERIE: TIntegerField;
    QryServiciosTallerNUMERO: TIntegerField;
    QryServiciosTallerFECHA: TDateTimeField;
    QryServiciosTallerCANT: TFloatField;
    QryServiciosTallerVALOR_SERVICIO: TFloatField;
    QryServiciosTallerPORC_ITBIS: TFloatField;
    QryServiciosTallerPORC_DESC: TFloatField;
    QryServiciosTallerVALOR_ITBIS: TFloatField;
    QryServiciosTallerVALOR_DESCUENTO: TFloatField;
    QryServiciosTallerDESCRIPCION: TIBStringField;
    QryServiciosTallerSTATUS: TIBStringField;
    QryServiciosTallerCOD_USUARIO: TIntegerField;
    QryServiciosTallerPRECIO: TFloatField;
    QryServiciosTallerFECHA_ENTRADA: TDateTimeField;
    QryServiciosTallerFECHA_SALIDA: TDateTimeField;
    QryServiciosTallerLAVADO: TSmallintField;
    QryServiciosTallerPLANCHADO: TSmallintField;
    QryServiciosTallerNOMBRE_CLIENTE: TIBStringField;
    QryServiciosTallerMONTO_TOTAL: TFloatField;
    QryServiciosTallerSTATUSDET: TIBStringField;
    QryServiciosTallerMONTO_RECIBIDO: TFloatField;
    QryServiciosTallerMONTO_DEVUELTO: TFloatField;
    QryServiciosTallerCODIGO_EMP: TIntegerField;
    QryServiciosTallerNOMBREEMPLEADO: TIBStringField;
    QryServiciosTallerCODIGO_CIA: TIntegerField;
    QryServiciosTallerCEDULA: TIBStringField;
    qryViewVentasHist: TIBQuery;
    qryViewVentasHistNOMBRE_ABREV: TIBStringField;
    qryViewVentasHistNUMERO: TIntegerField;
    qryViewVentasHistFECHA: TDateTimeField;
    qryViewVentasHistCIA_KEY: TIntegerField;
    qryViewVentasHistCODIGO_CTE: TIntegerField;
    qryViewVentasHistCODIGO_VENDEDOR: TIntegerField;
    qryViewVentasHistFORMA_PAGO: TSmallintField;
    qryViewVentasHistOBSERVACION: TIBStringField;
    qryViewVentasHistMONEDA: TIBStringField;
    qryViewVentasHistVALOR_TOTAL_DET_MAST: TFloatField;
    qryViewVentasHistSTATUS: TIBStringField;
    qryViewVentasHistNUMERO_FACTURA: TIntegerField;
    qryViewVentasHistNUMERO_DOC_PAGO: TIBStringField;
    qryViewVentasHistSERIE_NCF_ASIGNADO: TIntegerField;
    qryViewVentasHistMONTO_BRUTO: TFloatField;
    qryViewVentasHistPORC_DESCUENTO: TIntegerField;
    qryViewVentasHistMONTO_DESCUENTO: TFloatField;
    qryViewVentasHistMONTO_INICIAL: TFloatField;
    qryViewVentasHistNOMBRE_CLIENTE_GENERAL: TIBStringField;
    qryViewVentasHistMONTO_PAGADO: TFloatField;
    qryViewVentasHistMONTO_CAMBIO: TFloatField;
    qryViewVentasHistMONTO_TOTAL_ITBIS: TFloatField;
    qryViewVentasHistMONTODESCGASTOSADMIN: TFloatField;
    qryViewVentasHistMONTODESCITBISGASTOSADMIN: TFloatField;
    qryViewVentasHistMONTODESCTRANSP: TFloatField;
    qryViewVentasHistMONTODESCDIRTECNICA: TFloatField;
    qryViewVentasHistMONTODESCITBISDIRTECNICA: TFloatField;
    qryViewVentasHistMONTODESCIMPREVISTO: TFloatField;
    qryViewVentasHistMONTODESCITBISIMPREVISTO: TFloatField;
    qryViewVentasHistCOMENTARIO: TIBStringField;
    qryViewVentasHistNOMBRE_FACTURAR: TIBStringField;
    qryViewVentasHistSERIE: TIntegerField;
    qryViewVentasHistDESCRIPCION_DET: TIBStringField;
    qryViewVentasHistCODIGO_PROD: TIBStringField;
    qryViewVentasHistCANTIDAD: TFloatField;
    qryViewVentasHistPRECIO: TFloatField;
    qryViewVentasHistPORC_DESC_DET: TFloatField;
    qryViewVentasHistITBI_DET: TFloatField;
    qryViewVentasHistVALOR_SERVICIO_DET: TFloatField;
    qryViewVentasHistVALOR_TOTAL_DET: TFloatField;
    qryViewVentasHistNUM_FACTURA: TFloatField;
    qryViewVentasHistSTATUS_DET: TIBStringField;
    qryViewVentasHistSERIE_PROD: TIBStringField;
    qryViewVentasHistSTATUS_CNT: TIBStringField;
    qryViewVentasHistTIPO_UNIDAD: TIntegerField;
    qryViewVentasHistITBIS_EXENTO: TSmallintField;
    qryViewVentasHistTIPO_VENTA_DET: TSmallintField;
    qryViewVentasHistDESCRIPCIONPRODUCTO: TMemoField;
    qryViewVentasHistDESC_PRODUCTO_INVENTARIO: TIBStringField;
    qryViewVentasHistNOMBRE_VENDEDOR: TIBStringField;
    qryViewVentasHistPRECIO_COMPRA: TFloatField;
    qryViewVentasHistDIRECCION_CONT: TIBStringField;
    qryViewVentasHistTELEF_CONTACTO: TIBStringField;
    qryViewVentasHistCIUDAD: TIBStringField;
    qryViewVentasHistPAIS: TIBStringField;
    qryViewVentasHist_base: TIBQuery;
    qryViewVentasHistNOMBREPROVEEDOR: TIBStringField;
    qryViewVentasHistCODIGO_PROVEEDOR: TIntegerField;
    qryClientes: TIBQuery;
    qryClientesCODIGO_CTE: TIntegerField;
    qryClientesNOMBRE_FACTURAR: TIBStringField;
    qryClientesDESCRIPCION_TIPOCTE: TIBStringField;
    qryClientesNOMBRE_ABREV: TIBStringField;
    qryClientesNOMBRE_CTE: TIBStringField;
    qryClientesCONTACTO: TIBStringField;
    qryClientesDIRECCION_CONT: TIBStringField;
    qryClientesEMAIL: TIBStringField;
    qryClientesFAX_CONTACTO: TIBStringField;
    qryClientesFECHA_INSERTADO: TDateTimeField;
    qryClientesFECHA_MOD: TDateTimeField;
    qryClientesFORMA_PAGO: TSmallintField;
    qryClientesFOTO: TBlobField;
    qryClientesLIMITE_CREDITO: TFloatField;
    qryClientesMONEDA_FACT: TIBStringField;
    qryClientesPAIS: TIBStringField;
    qryClientesSTATUS_CLIENTE: TIBStringField;
    qryClientesTELEF_CONTACTO: TIBStringField;
    qryClientesTIPO_CLIENTE: TSmallintField;
    qryClientesWEBSITE: TIBStringField;
    qryClientesCIUDAD: TIBStringField;
    qryClientesCODIGO_AGENCIA: TSmallintField;
    qryRepVentaServicio: TIBQuery;
    qryRepVentaServicioDIRECCION_CONT: TIBStringField;
    qryRepVentaServicioTELEF_CONTACTO: TIBStringField;
    qryRepVentaServicioCIUDAD: TIBStringField;
    qryRepVentaServicioPAIS: TIBStringField;
    qryRepVentaServicioNOMBRE_ABREV: TIBStringField;
    qryRepVentaServicioNOMBRE_FACTURAR: TIBStringField;
    qryRepVentaServicioCOD_VENDEDOR: TIntegerField;
    qryRepVentaServicioDESCRIPCION: TIBStringField;
    qryRepVentaServicioNOMBREEMPLEADO: TIBStringField;
    qryRepVentaServicioPRECIO_COMPRA: TFloatField;
    qryRepVentaServicioCODIGO_CTE: TIntegerField;
    qryRepVentaServicioCODIGO_OPERARIO: TIntegerField;
    qryRepVentaServicioSERIE: TIntegerField;
    qryRepVentaServicioFECHA: TDateTimeField;
    qryRepVentaServicioNUMERO_TRN: TIntegerField;
    qryRepVentaServicioCODIGO_SERVICIO: TIntegerField;
    qryRepVentaServicioDESCRIPCION1: TIBStringField;
    qryRepVentaServicioMONTO_SERVICIO: TFloatField;
    qryRepVentaServicioMONTO_COMISION: TFloatField;
    qryRepVentaServicioPORC_COMISION: TFloatField;
    qryRepVentaServicioMONTO_DESCUENTO: TFloatField;
    qryRepVentaServicioPORC_DESCUENTO: TFloatField;
    qryRepVentaServicioFECHA_IN: TDateTimeField;
    qryRepVentaServicioIN_POR: TIBStringField;
    qryRepVentaServicioFECHA_MOD: TDateTimeField;
    qryRepVentaServicioMOD_POR: TIBStringField;
    qryRepVentaServicioCOMENTARIO: TIBStringField;
    qryRepVentaServicioSTATUS: TIBStringField;
    qryRepVentaServicioCOD_USUARIO: TIntegerField;
    qryRepVentaServicioRNC: TIBStringField;
    qryViewVentasHistCODIGO_TEXTO: TIBStringField;
    qryRepCotizaciones: TIBQuery;
    qryRepCotizacionesBase: TIBQuery;
    qryRepCotizacionesNUMERO: TIntegerField;
    qryRepCotizacionesFECHA: TDateTimeField;
    qryRepCotizacionesCIA_KEY: TIntegerField;
    qryRepCotizacionesFECHA_VENCE: TDateTimeField;
    qryRepCotizacionesCODIGO_CTE: TIntegerField;
    qryRepCotizacionesCODIGO_VENDEDOR: TIntegerField;
    qryRepCotizacionesOBSERVACION: TIBStringField;
    qryRepCotizacionesMONEDA: TIBStringField;
    qryRepCotizacionesVALOR_TOTAL: TFloatField;
    qryRepCotizacionesSTATUS: TIBStringField;
    qryRepCotizacionesFECHA_IN: TDateTimeField;
    qryRepCotizacionesIN_POR: TIBStringField;
    qryRepCotizacionesFECHA_MOD: TDateTimeField;
    qryRepCotizacionesMOD_POR: TIBStringField;
    qryRepCotizacionesNUMERO_FACTURA: TIntegerField;
    qryRepCotizacionesNUMERO_DOC_PAGO: TIBStringField;
    qryRepCotizacionesSERIE_NCF_ASIGNADO: TIntegerField;
    qryRepCotizacionesMONTO_BRUTO: TFloatField;
    qryRepCotizacionesPORC_DESCUENTO: TIntegerField;
    qryRepCotizacionesMONTO_DESCUENTO: TFloatField;
    qryRepCotizacionesMONTO_INICIAL: TFloatField;
    qryRepCotizacionesNOMBRE_CLIENTE_GENERAL: TIBStringField;
    qryRepCotizacionesMONTO_PAGADO: TFloatField;
    qryRepCotizacionesMONTO_CAMBIO: TFloatField;
    qryRepCotizacionesMONTO_TOTAL_ITBIS: TFloatField;
    qryRepCotizacionesMONTODESCGASTOSADMIN: TFloatField;
    qryRepCotizacionesMONTODESCITBISGASTOSADMIN: TFloatField;
    qryRepCotizacionesMONTODESCTRANSP: TFloatField;
    qryRepCotizacionesMONTODESCDIRTECNICA: TFloatField;
    qryRepCotizacionesMONTODESCITBISDIRTECNICA: TFloatField;
    qryRepCotizacionesMONTODESCIMPREVISTO: TFloatField;
    qryRepCotizacionesMONTODESCITBISIMPREVISTO: TFloatField;
    qryRepCotizacionesTIPO_FACTURA: TSmallintField;
    qryRepCotizacionesAPLICA_TIPODESC: TSmallintField;
    qryRepCotizacionesCOMENTARIO: TMemoField;
    qryRepCotizacionesSERIE: TIntegerField;
    qryRepCotizacionesNUMERO1: TIntegerField;
    qryRepCotizacionesCODIGO_PROD: TIBStringField;
    qryRepCotizacionesCODIGO_BARRA: TIBStringField;
    qryRepCotizacionesDESCRIPCIONESPECIAL: TMemoField;
    qryRepCotizacionesDESCRIPCION: TIBStringField;
    qryRepCotizacionesCANTIDAD: TFloatField;
    qryRepCotizacionesPRECIO: TFloatField;
    qryRepCotizacionesPORC_DESC_DET: TFloatField;
    qryRepCotizacionesITBI_DET: TFloatField;
    qryRepCotizacionesVALOR_SERVICIO_DET: TFloatField;
    qryRepCotizacionesVALOR_TOTAL_DET: TFloatField;
    qryRepCotizacionesSTATUS_DET: TIBStringField;
    qryRepCotizacionesFECHA_IN1: TDateTimeField;
    qryRepCotizacionesIN_POR1: TIBStringField;
    qryRepCotizacionesFECHA_MOD1: TDateTimeField;
    qryRepCotizacionesMOD_POR1: TIBStringField;
    qryRepCotizacionesCANT_REGRESO: TFloatField;
    qryRepCotizacionesCANT_PROMO: TFloatField;
    qryRepCotizacionesMONTO_DIETA: TFloatField;
    qryRepCotizacionesMONTO_AJUSTE: TFloatField;
    qryRepCotizacionesSERIE_PROD: TIBStringField;
    qryRepCotizacionesSTATUS_CNT: TIBStringField;
    qryRepCotizacionesTIPO_UNIDAD: TIntegerField;
    qryRepCotizacionesITBIS_EXENTO: TSmallintField;
    qryRepCotizacionesTIPO_VENTA: TSmallintField;
    qryRepCotizacionesDESCRIPCIONPRODUCTO: TMemoField;
    qryRepCotizacionesNOMBREPROVEEDOR: TIBStringField;
    qryRepCotizacionesCODIGO_TEXTO: TIBStringField;
    qryRepCotizacionesPRECIO_COMPRA: TFloatField;
    qryRepCotizacionesNOMBRE_FACTURAR: TIBStringField;
    qryRepCotizacionesNOMBRE_ABREV: TIBStringField;
    qryRepCotizacionesNOMBREVENDEDOR: TIBStringField;
    qryRepCotizacionesCEDULA: TIBStringField;
    qryRepCotizacionesDIRECCION_CONT: TIBStringField;
    qryRepCotizacionesTELEF_CONTACTO: TIBStringField;
    qryRepCotizacionesCIUDAD: TIBStringField;
    qryRepCotizacionesPAIS: TIBStringField;
    qryRelacionFacturasMONEDA: TIBStringField;
    qryRepInventarioProdMasBclRutaCODFABRICANTE: TIntegerField;
    qryProvInvLook: TIBQuery;
    qryRepInventarioProdMasBclRutaDescProveedor: TStringField;
    qryProvInvLookCODIGO_CTE: TIntegerField;
    qryProvInvLookDESCRIPCION: TIBStringField;
    qryRepDatosCteVeh: TIBQuery;
    qryRepDatosCteVehNUMERO: TIntegerField;
    qryRepDatosCteVehCODIGO_CTE: TIntegerField;
    qryRepDatosCteVehPLACA: TIBStringField;
    qryRepDatosCteVehIDMARCA: TIntegerField;
    qryRepDatosCteVehMODELO: TIBStringField;
    qryRepDatosCteVehANO_VEH: TIntegerField;
    qryRepDatosCteVehFECHA_VENCE_SEGURO: TDateTimeField;
    qryRepDatosCteVehTIPO_SEGURO: TSmallintField;
    qryRepDatosCteVehCIA_SEGURO: TIBStringField;
    qryRepDatosCteVehEMPRESA_LABORA: TIBStringField;
    qryRepDatosCteVehFECHA_IN: TDateTimeField;
    qryRepDatosCteVehIN_POR: TIBStringField;
    qryRepDatosCteVehCODIGO_CTE1: TIntegerField;
    qryRepDatosCteVehCIA_KEY: TIntegerField;
    qryRepDatosCteVehTIPO_CLIENTE: TSmallintField;
    qryRepDatosCteVehFOTO: TBlobField;
    qryRepDatosCteVehNOMBRE_CTE: TIBStringField;
    qryRepDatosCteVehNOMBRE_ABREV: TIBStringField;
    qryRepDatosCteVehMONEDA_FACT: TIBStringField;
    qryRepDatosCteVehNOMBRE_FACTURAR: TIBStringField;
    qryRepDatosCteVehCONTACTO: TIBStringField;
    qryRepDatosCteVehDIRECCION_CONT: TIBStringField;
    qryRepDatosCteVehTELEF_CONTACTO: TIBStringField;
    qryRepDatosCteVehFAX_CONTACTO: TIBStringField;
    qryRepDatosCteVehFORMA_PAGO: TSmallintField;
    qryRepDatosCteVehCODIGO_AGENCIA: TSmallintField;
    qryRepDatosCteVehSTATUS_CLIENTE: TIBStringField;
    qryRepDatosCteVehINSERTADO_POR: TIBStringField;
    qryRepDatosCteVehFECHA_INSERTADO: TDateTimeField;
    qryRepDatosCteVehFECHA_MOD: TDateTimeField;
    qryRepDatosCteVehMODI_POR: TIBStringField;
    qryRepDatosCteVehLIMITE_CREDITO: TFloatField;
    qryRepDatosCteVehEMAIL: TIBStringField;
    qryRepDatosCteVehWEBSITE: TIBStringField;
    qryRepDatosCteVehPAIS: TIBStringField;
    qryRepDatosCteVehCIUDAD: TIBStringField;
    qryRepDatosCteVehCEDULA: TIBStringField;
    qryRepDatosCteVehRNC: TIBStringField;
    qryRepDatosCteVehREFERENCIA: TIBStringField;
    qryRepDatosCteVehTELEF_REFERENCIA: TIBStringField;
    qryRepDatosCteVehOTRO_TELEFONO: TIBStringField;
    qryRepDatosCteVehCANT_DIAS_CREDITO: TSmallintField;
    qryRepDatosCteVehTIPO_NCF: TIBStringField;
    qryRepDatosCteVehOBSERVACION: TMemoField;
    qryRepDatosCteVehLUGAR_DE_TRABAJO: TIBStringField;
    qryRepDatosCteVehAPODO: TIBStringField;
    qryRepDatosCteVehCODIGO_USUARIO: TIntegerField;
    qryRepDatosCteVehRNC_NUMERO: TIBStringField;
    qryRepDatosCteVehCOMENTARIO: TMemoField;
    qryRepDatosCteVehCONDICION: TIntegerField;
    qryRepDatosCteVehPRECIO_ID: TIntegerField;
    qryRepDatosCteVehTIPO_CF: TIBStringField;
    qryRepDatosCteVehMOVIL1: TIBStringField;
    qryRepDatosCteVehMOVIL2: TIBStringField;
    qryRepDatosCteVehCODIGO_TEXTO: TIBStringField;
    qryRepDatosCteVehUSARLEVELPRECIO: TSmallintField;
    qryRepDatosCteVehCOD_VENDEDOR: TIntegerField;
    qryRepDatosCteVehDescTipoSEguro: TStringField;
    qryRepDatosCteVehDESCTIPO_CLIENTE: TIBStringField;
    qryDatosRepClientesCOD_VENDEDOR: TIntegerField;
    qryDatosRepVentaDiariaNUMERO_FACTURA: TIntegerField;
    qryDatosVentaDetalle: TIBQuery;
    qryDatosVentaDetalleSERIE: TIntegerField;
    qryDatosVentaDetalleNUMERO: TIntegerField;
    qryDatosVentaDetalleCODIGO_PROD: TIBStringField;
    qryDatosVentaDetalleCODIGO_BARRA: TIBStringField;
    qryDatosVentaDetalleCANTIDAD: TFloatField;
    qryDatosVentaDetallePRECIO: TFloatField;
    qryDatosVentaDetallePORC_DESC_DET: TFloatField;
    qryDatosVentaDetalleITBI_DET: TFloatField;
    qryDatosVentaDetalleVALOR_SERVICIO_DET: TFloatField;
    qryDatosVentaDetalleVALOR_TOTAL_DET: TFloatField;
    qryDatosVentaDetalleNUM_FACTURA: TFloatField;
    qryDatosVentaDetalleSTATUS_DET: TIBStringField;
    qryDatosVentaDetalleCANT_REGRESO: TFloatField;
    qryDatosVentaDetalleCANT_PROMO: TFloatField;
    qryDatosVentaDetalleMONTO_DIETA: TFloatField;
    qryDatosVentaDetalleMONTO_AJUSTE: TFloatField;
    qryDatosVentaDetalleSERIE_PROD: TIBStringField;
    qryDatosVentaDetalleSTATUS_CNT: TIBStringField;
    qryDatosVentaDetalleDESC_TIPOUNIDAD: TIBStringField;
    qryDatosVentaDetalleCX_TIPOUNIDAD: TIntegerField;
    qryDatosVentaDetalleIDUNIDAD: TIntegerField;
    qryDatosVentaDetalleTIPO_VENTA: TSmallintField;
    qryDatosVentaMaster: TIBQuery;
    qryDatosVentaMasterNUMERO: TIntegerField;
    qryDatosVentaMasterFECHA: TDateTimeField;
    qryDatosVentaMasterCODIGO_CTE: TIntegerField;
    qryDatosVentaMasterCODIGO_VENDEDOR: TIntegerField;
    qryDatosVentaMasterFORMA_PAGO: TSmallintField;
    qryDatosVentaMasterMONEDA: TIBStringField;
    qryDatosVentaMasterVALOR_TOTAL_DET: TFloatField;
    qryDatosVentaMasterSTATUS: TIBStringField;
    qryDatosVentaMasterNUMERO_FACTURA: TIntegerField;
    qryDatosVentaMasterNUMERO_DOC_PAGO: TIBStringField;
    qryDatosVentaMasterSERIE_NCF_ASIGNADO: TIntegerField;
    qryDatosVentaMasterMONTO_BRUTO: TFloatField;
    qryDatosVentaMasterPORC_DESCUENTO: TIntegerField;
    qryDatosVentaMasterMONTO_DESCUENTO: TFloatField;
    qryDatosVentaMasterNUMERO_NCF: TIBStringField;
    qryDatosVentaMasterCEDULA: TIBStringField;
    qryDatosVentaMasterRNC: TIBStringField;
    qryDatosVentaMasterDIRECCION_CONT: TIBStringField;
    qryDatosVentaMasterTELEF_CONTACTO: TIBStringField;
    qryDatosVentaMasterDESC_TIPOPAGO: TIBStringField;
    qryDatosVentaMasterORIGEN: TSmallintField;
    qryDatosVentaMasterNOMBRE_CTE: TIBStringField;
    qryDatosVentaMasterMONTO_PAGADO: TFloatField;
    qryDatosVentaMasterTIPO_NCF: TIBStringField;
    qryDatosVentaMasterMONTO_CAMBIO: TFloatField;
    qryDescLineasDocF: TIBQuery;
    qryDescLineasDocFIDLINEA: TIntegerField;
    qryDescLineasDocFITEM: TIntegerField;
    qryDescLineasDocFDESCRIPCION: TIBStringField;
    qryDatosReimpdocFiscalDet: TIBQuery;
    qryDatosReimpdocFiscalDetSERIE: TIntegerField;
    qryDatosReimpdocFiscalDetNUMERO: TIntegerField;
    qryDatosReimpdocFiscalDetCODIGO_PROD: TIBStringField;
    qryDatosReimpdocFiscalDetCODIGO_BARRA: TIBStringField;
    qryDatosReimpdocFiscalDetCANTIDAD: TFloatField;
    qryDatosReimpdocFiscalDetPRECIO: TFloatField;
    qryDatosReimpdocFiscalDetPORC_DESC_DET: TFloatField;
    qryDatosReimpdocFiscalDetITBI_DET: TFloatField;
    qryDatosReimpdocFiscalDetVALOR_SERVICIO_DET: TFloatField;
    qryDatosReimpdocFiscalDetVALOR_TOTAL_DET: TFloatField;
    qryDatosReimpdocFiscalDetNUM_FACTURA: TFloatField;
    qryDatosReimpdocFiscalDetSTATUS_DET: TIBStringField;
    qryDatosReimpdocFiscalDetCANT_REGRESO: TFloatField;
    qryDatosReimpdocFiscalDetCANT_PROMO: TFloatField;
    qryDatosReimpdocFiscalDetMONTO_DIETA: TFloatField;
    qryDatosReimpdocFiscalDetMONTO_AJUSTE: TFloatField;
    qryDatosReimpdocFiscalDetSERIE_PROD: TIBStringField;
    qryDatosReimpdocFiscalDetSTATUS_CNT: TIBStringField;
    qryDatosReimpdocFiscalDetDESC_TIPOUNIDAD: TIBStringField;
    qryDatosReimpdocFiscalDetCX_TIPOUNIDAD: TIntegerField;
    qryDatosReimpdocFiscalDetIDUNIDAD: TIntegerField;
    qryDatosReimpdocFiscalDetTIPO_VENTA: TSmallintField;
    qryDatosRepTranscxcIFiscal: TIBQuery;
    qryDatosRepTranscxcIFiscalSERIE: TIntegerField;
    qryDatosRepTranscxcIFiscalNOMBRE_COMPLETO: TIBStringField;
    qryDatosRepTranscxcIFiscalNUMERO_NCF: TIBStringField;
    qryDatosRepTranscxcIFiscalTIPO_NCF: TIBStringField;
    qryDatosRepTranscxcIFiscalCEDULA: TIBStringField;
    qryDatosRepTranscxcIFiscalRNC_NUMERO: TIBStringField;
    qryDatosRepTranscxcIFiscalDIRECCION_CONT: TIBStringField;
    qryDatosRepTranscxcIFiscalNOMBRE_FACTURAR: TIBStringField;
    qryDatosRepTranscxcIFiscalTELEF_CONTACTO: TIBStringField;
    qryDatosRepTranscxcIFiscalNUM_DOC: TIntegerField;
    qryDatosRepTranscxcIFiscalNUMERO_FACT: TIntegerField;
    qryDatosRepTranscxcIFiscalSERIE_NCF_ASIGNADO: TIntegerField;
    qryDatosRepTranscxcIFiscalVALOR_DOCUMENTO: TFloatField;
    qryDatosRepTranscxcIFiscalCODIGO_CLIENTE: TIntegerField;
    qryDatosRepTranscxcIFiscalNUM_NCF_AFECTADO: TIBStringField;
    qryDatosRepTranscxcIFiscalTIPO_TRANF: TSmallintField;
    qryDatosRepTranscxcIFiscalTIPO_DOC: TIntegerField;
    qryDatosRepTranscxcIFiscalFECHA: TDateTimeField;
    qryDatosRepTranscxcIFiscalCONCEPTO: TIBStringField;
    qryDatosCajaImpUser: TIBQuery;
    qryDatosCajaImpUserCOD_EMPLEADO: TIntegerField;
    qryDatosCajaImpUserCOD_CAJA: TIntegerField;
    qryDatosCajaImpUserID_FISCALPRINTER: TIntegerField;
    qryDatosCajaImpUserNOMBRECOMPLETO: TIBStringField;
    qryTipoIFiscal: TIBQuery;
    qryStatusImpresora: TIBQuery;
    qryStatusImpresoraID_ERROR: TIntegerField;
    qryStatusImpresoraID_USUARIO: TIntegerField;
    qryStatusImpresoraID_FISCALPRINTE: TIntegerField;
    qryStatusImpresoraDESCRIPCION: TIBStringField;
    qryBuscarNIF: TIBQuery;
    qryBuscarNIFNUMERO: TIntegerField;
    qryBuscarNIFNIF: TIBStringField;
    qryBuscarNIFTIPO: TIntegerField;
    qryBuscarNIFTOTAL_BRUTO: TFloatField;
    qryBuscarNIFMONTO_ITBIS: TFloatField;
    qryBuscarNIFTOTAL_NETO: TFloatField;
    qryBuscarNIFSTATUS: TIBStringField;
    qryDatosReimpDocFiscalOKI: TIBQuery;
    qryDatosReimpDocFiscalOKINombrecliente: TStringField;
    qryDatosReimpDocFiscalOKIRNC: TStringField;
    qryDatosReimpDocFiscalOKIFECHA: TDateTimeField;
    qryDatosReimpDocFiscalOKINUMERO: TIntegerField;
    qryDatosReimpDocFiscalOKICODIGO_CTE: TIntegerField;
    qryDatosReimpDocFiscalOKINIF: TIBStringField;
    qryDatosReimpDocFiscalOKINUMERO_NCF: TIBStringField;
    qryDatosReimpDocFiscalOKITIPO: TIntegerField;
    qryDatosReimpDocFiscalOKITOTAL_BRUTO: TFloatField;
    qryDatosReimpDocFiscalOKIMONTO_ITBIS: TFloatField;
    qryDatosReimpDocFiscalOKIMONTO_CAMBIO: TFloatField;
    qryDatosReimpDocFiscalOKITOTAL_NETO: TFloatField;
    qryDatosReimpDocFiscalOKIMONTO_DESCUENTO: TFloatField;
    qryDatosReimpDocFiscalOKIMONTO_PAGADO: TFloatField;
    qryDatosReimpDocFiscalOKITIPO_NCF: TIBStringField;
    qryDatosReimpDocFiscalOKIDESCDOCUMENTOFISCAL: TIBStringField;
    qryDatosReimpDocFiscal: TIBQuery;
    qryDatosReimpDocFiscalNUMERO: TIntegerField;
    qryDatosReimpDocFiscalCODIGO_CTE: TIntegerField;
    qryDatosReimpDocFiscalNIF: TIBStringField;
    qryDatosReimpDocFiscalNUMERO_NCF: TIBStringField;
    qryDatosReimpDocFiscalTIPO: TIntegerField;
    qryDatosReimpDocFiscalTOTAL_BRUTO: TFloatField;
    qryDatosReimpDocFiscalMONTO_ITBIS: TFloatField;
    qryDatosReimpDocFiscalTOTAL_NETO: TFloatField;
    qryDatosReimpDocFiscalNombrecliente: TStringField;
    qryDatosReimpDocFiscalRNC: TStringField;
    qryDatosReimpDocFiscalFECHA: TDateTimeField;
    qryDatosReimpDocFiscalMONTO_DESCUENTO: TFloatField;
    qryDatosReimpDocFiscalMONTO_PAGADO: TFloatField;
    qryDatosReimpDocFiscalMONTO_CAMBIO: TFloatField;
    qryClientesRNC_NUMERO: TIBStringField;
    tblCtrlTransusuario: TIBDataSet;
    qryDetallePagos: TIBQuery;
    qryDetallePagosIFISCAL_TPAGO: TSmallintField;
    qryDetallePagosDESCRIPCION: TIBStringField;
    qryDetallePagosMONTO_PAGADO: TFloatField;
    qryDetallePagosPAGO: TSmallintField;
    dsqryDetallePagos: TDataSource;
    qryDatosReimpdocFiscalDetDESCRIPCION: TIBStringField;
    qryDatosReimpdocFiscalDetDESCRIPCIONPRODUCTO: TMemoField;
    qryDatosVentaMasterNOMBRE_COMPLETO: TIBStringField;
    qryDatosVentaMasterNOMBRE_FACTURAR: TIBStringField;
    qryDatosVentaMasterCOMENTARIO: TIBStringField;
    qryDatosVentaMasterOBSERVACION: TIBStringField;
    qryDatosVentaDetalleDESCRIPCION: TIBStringField;
    qryDatosVentaDetalleDESCRIPCIONPRODUCTO: TMemoField;
    qryDatosRepTranscxcIFiscalNOMBRE_CTE: TIBStringField;
    qryDatosCajaImpUserRUTA_TICKET: TIBStringField;
    qryDatosRepClientesFECHA_NACIMIENTO: TDateTimeField;
    qryDatosRepClientesCumple: TIBQuery;
    qryDatosRepClientesCumpleCODIGO_CTE: TIntegerField;
    qryDatosRepClientesCumpleNOMBRE_FACTURAR: TIBStringField;
    qryDatosRepClientesCumpleDESCRIPCION_TIPOCTE: TIBStringField;
    qryDatosRepClientesCumpleNOMBRE_ABREV: TIBStringField;
    qryDatosRepClientesCumpleNOMBRE_CTE: TIBStringField;
    qryDatosRepClientesCumpleCONTACTO: TIBStringField;
    qryDatosRepClientesCumpleDIRECCION_CONT: TIBStringField;
    qryDatosRepClientesCumpleEMAIL: TIBStringField;
    qryDatosRepClientesCumpleFAX_CONTACTO: TIBStringField;
    qryDatosRepClientesCumpleFECHA_INSERTADO: TDateTimeField;
    qryDatosRepClientesCumpleFECHA_MOD: TDateTimeField;
    qryDatosRepClientesCumpleFORMA_PAGO: TSmallintField;
    qryDatosRepClientesCumpleFOTO: TBlobField;
    qryDatosRepClientesCumpleLIMITE_CREDITO: TFloatField;
    qryDatosRepClientesCumpleMONEDA_FACT: TIBStringField;
    qryDatosRepClientesCumplePAIS: TIBStringField;
    qryDatosRepClientesCumpleSTATUS_CLIENTE: TIBStringField;
    qryDatosRepClientesCumpleTELEF_CONTACTO: TIBStringField;
    qryDatosRepClientesCumpleTIPO_CLIENTE: TSmallintField;
    qryDatosRepClientesCumpleWEBSITE: TIBStringField;
    qryDatosRepClientesCumpleCIUDAD: TIBStringField;
    qryDatosRepClientesCumpleCODIGO_AGENCIA: TSmallintField;
    qryDatosRepClientesCumpleCOD_VENDEDOR: TIntegerField;
    qryDatosRepClientesCumpleFECHA_NACIMIENTO: TDateTimeField;
    qryDatosRepOrdenComp: TIBQuery;
    qryDatosRepOrdenComp_Base: TIBQuery;
    qryDatosRepOrdenCompNUMERO: TIntegerField;
    qryDatosRepOrdenCompCODIGO_PROVEE: TIntegerField;
    qryDatosRepOrdenCompFECHA: TDateTimeField;
    qryDatosRepOrdenCompFPAGO: TSmallintField;
    qryDatosRepOrdenCompCOD_CAJA_CHICA: TIntegerField;
    qryDatosRepOrdenCompCODIGO_BANCO: TSmallintField;
    qryDatosRepOrdenCompOBSERVACION: TIBStringField;
    qryDatosRepOrdenCompMONTO: TFloatField;
    qryDatosRepOrdenCompSTATUS: TIBStringField;
    qryDatosRepOrdenCompTIPO_INV: TSmallintField;
    qryDatosRepOrdenCompNUM_ORDEN: TIntegerField;
    qryDatosRepOrdenCompSTATUS_ORD: TIBStringField;
    qryDatosRepOrdenCompAREA_ORDEN: TIntegerField;
    qryDatosRepOrdenCompCIA_KEY: TSmallintField;
    qryDatosRepOrdenCompNUMERO_NCF: TIBStringField;
    qryDatosRepOrdenCompCODIGO_VENDEDOR: TIntegerField;
    qryDatosRepOrdenCompDESCRIPCION_PROVEEDOR: TIBStringField;
    qryDatosRepOrdenCompSERIE: TFloatField;
    qryDatosRepOrdenCompCANTIDAD: TFloatField;
    qryDatosRepOrdenCompVALOR: TFloatField;
    qryDatosRepOrdenCompSTATUS_DET: TIBStringField;
    qryDatosRepOrdenCompNUMERO_DOCUMENTO: TIntegerField;
    qryDatosRepOrdenCompNUMERO_FACTURA: TIntegerField;
    qryDatosRepOrdenCompCOD_CTA_CONCEPTO: TIntegerField;
    qryDatosRepOrdenCompPRECIO: TFloatField;
    qryDatosRepOrdenCompITBI_DET: TFloatField;
    qryDatosRepOrdenCompPORC_DESC_DET: TFloatField;
    qryDatosRepOrdenCompMONTO_DESCUENTO: TFloatField;
    qryDatosRepOrdenCompFORMA_DEPAGO: TIBStringField;
    qryDatosRepOrdenCompDESC_PRODUCTO: TIBStringField;
    qryDatosRepOrdenCompDESC_TIPOUNIDAD: TIBStringField;
    qryDatosRepOrdenCompCOD_SERV_PROD: TIntegerField;
    qryDatosRepOrdenCompNOMBRE_ABR: TIBStringField;
    qryDatosRepOrdenCompCANT_OFERTA: TIntegerField;
    qryDatosRepOrdenCompCANTIDAD_ORIGINAL: TIntegerField;
    qryDatosRepOrdenComp_BaseNUMERO: TIntegerField;
    qryDatosRepOrdenComp_BaseCODIGO_PROVEE: TIntegerField;
    qryDatosRepOrdenComp_BaseFECHA: TDateTimeField;
    qryDatosRepOrdenComp_BaseFPAGO: TSmallintField;
    qryDatosRepOrdenComp_BaseCOD_CAJA_CHICA: TIntegerField;
    qryDatosRepOrdenComp_BaseCODIGO_BANCO: TSmallintField;
    qryDatosRepOrdenComp_BaseOBSERVACION: TIBStringField;
    qryDatosRepOrdenComp_BaseMONTO: TFloatField;
    qryDatosRepOrdenComp_BaseSTATUS: TIBStringField;
    qryDatosRepOrdenComp_BaseTIPO_INV: TSmallintField;
    qryDatosRepOrdenComp_BaseNUM_ORDEN: TIntegerField;
    qryDatosRepOrdenComp_BaseSTATUS_ORD: TIBStringField;
    qryDatosRepOrdenComp_BaseAREA_ORDEN: TIntegerField;
    qryDatosRepOrdenComp_BaseCIA_KEY: TSmallintField;
    qryDatosRepOrdenComp_BaseNUMERO_NCF: TIBStringField;
    qryDatosRepOrdenComp_BaseCODIGO_VENDEDOR: TIntegerField;
    qryDatosRepOrdenComp_BaseDESCRIPCION_PROVEEDOR: TIBStringField;
    qryDatosRepOrdenComp_BaseSERIE: TFloatField;
    qryDatosRepOrdenComp_BaseCANTIDAD: TFloatField;
    qryDatosRepOrdenComp_BaseVALOR: TFloatField;
    qryDatosRepOrdenComp_BaseSTATUS_DET: TIBStringField;
    qryDatosRepOrdenComp_BaseNUMERO_DOCUMENTO: TIntegerField;
    qryDatosRepOrdenComp_BaseNUMERO_FACTURA: TIntegerField;
    qryDatosRepOrdenComp_BaseCOD_CTA_CONCEPTO: TIntegerField;
    qryDatosRepOrdenComp_BasePRECIO: TFloatField;
    qryDatosRepOrdenComp_BaseITBI_DET: TFloatField;
    qryDatosRepOrdenComp_BasePORC_DESC_DET: TFloatField;
    qryDatosRepOrdenComp_BaseMONTO_DESCUENTO: TFloatField;
    qryDatosRepOrdenComp_BaseFORMA_DEPAGO: TIBStringField;
    qryDatosRepOrdenComp_BaseDESC_PRODUCTO: TIBStringField;
    qryDatosRepOrdenComp_BaseDESC_TIPOUNIDAD: TIBStringField;
    qryDatosRepOrdenComp_BaseCOD_SERV_PROD: TIntegerField;
    qryDatosRepOrdenComp_BaseCANT_OFERTA: TIntegerField;
    qryDatosRepOrdenComp_BaseNOMBRE_ABR: TIBStringField;
    qryDatosRepOrdenComp_BaseCANTIDAD_ORIGINAL: TIntegerField;
    qryDatosRepVentaDiaria_0: TIBQuery;
    qryViewVentasDetPORC_DESC_ITEM: TFloatField;
    qryViewVentasDetMONTO_DESC_ITEM: TFloatField;
    qryDatosVentaMasterCIA_KEY: TIntegerField;
    qryDatosVentaMasterFECHA_IN: TDateTimeField;
    qryDatosVentaMasterIN_POR: TIBStringField;
    qryDatosVentaMasterFECHA_MOD: TDateTimeField;
    qryDatosVentaMasterMOD_POR: TIBStringField;
    qryDatosVentaMasterMONTO_INICIAL: TFloatField;
    qryDatosVentaMasterNOMBRE_CLIENTE_GENERAL: TIBStringField;
    qryDatosVentaMasterMONTO_TOTAL_ITBIS: TFloatField;
    qryDatosVentaMasterMONTODESCGASTOSADMIN: TFloatField;
    qryDatosVentaMasterMONTODESCITBISGASTOSADMIN: TFloatField;
    qryDatosVentaMasterMONTODESCTRANSP: TFloatField;
    qryDatosVentaMasterMONTODESCDIRTECNICA: TFloatField;
    qryDatosVentaMasterMONTODESCITBISDIRTECNICA: TFloatField;
    qryDatosVentaMasterMONTODESCIMPREVISTO: TFloatField;
    qryDatosVentaMasterMONTODESCITBISIMPREVISTO: TFloatField;
    qryDatosVentaMasterDESC_TIPONCF: TIBStringField;
    qryDatosVentaMasterNOMBRE_ABREV: TIBStringField;
    qryDatosReimpdocFiscalDetPORC_DESC_ITEM: TFloatField;
    qryDatosReimpdocFiscalDetMONTO_DESC_ITEM: TFloatField;
    qryDatosVentaDetallePORC_DESC_ITEM: TFloatField;
    qryDatosVentaDetalleMONTO_DESC_ITEM: TFloatField;
    qryDatosVentaMasterMONTO_RECARGO: TFloatField;
    qryTipoIFiscalTIPO_NCF: TIBStringField;
    qryTipoIFiscalTIPO_NCF_IFISCAL: TIntegerField;
    qryTipoIFiscalDESCRIPCION: TIBStringField;
    qryDatosVentaMasterTIPONCFIFISCAL: TIntegerField;
    qryDatosReimpDocFiscalMONTO_RECARGO: TFloatField;
    qryDatosReimpDocFiscalTIPONCFIFISCAL: TIntegerField;
    qryViewVentasMastMONTO_RECARGO: TFloatField;
    qryViewVentasMastTIPONCFIFISCAL: TIntegerField;
    qryProcGetDatosNCNB: TIBQuery;
    qryProcGetDatosNCNBSERIE: TIntegerField;
    qryProcGetDatosNCNBNOMBRE_COMPLETO: TIBStringField;
    qryProcGetDatosNCNBNUMERO_NCF: TIBStringField;
    qryProcGetDatosNCNBTIPO_NCF: TIBStringField;
    qryProcGetDatosNCNBNOMBRE_CTE: TIBStringField;
    qryProcGetDatosNCNBCEDULA: TIBStringField;
    qryProcGetDatosNCNBRNC_NUMERO: TIBStringField;
    qryProcGetDatosNCNBDIRECCION_CONT: TIBStringField;
    qryProcGetDatosNCNBNOMBRE_FACTURAR: TIBStringField;
    qryProcGetDatosNCNBTELEF_CONTACTO: TIBStringField;
    qryProcGetDatosNCNBNUM_DOC: TIntegerField;
    qryProcGetDatosNCNBNUMERO_FACT: TSmallintField;
    qryProcGetDatosNCNBSERIE_NCF_ASIGNADO: TSmallintField;
    qryProcGetDatosNCNBVALOR_DOCUMENTO: TFloatField;
    qryProcGetDatosNCNBCODIGO_CLIENTE: TSmallintField;
    qryProcGetDatosNCNBNUM_NCF_AFECTADO: TIBStringField;
    qryProcGetDatosNCNBTIPO_TRANF: TSmallintField;
    qryProcGetDatosNCNBTIPO_DOC: TIntegerField;
    qryProcGetDatosNCNBFECHA: TDateTimeField;
    qryProcGetDatosNCNBCONCEPTO: TIBStringField;
    qryDatosReimpDocFiscalMONTO_TOTAL_ITBIS: TFloatField;
    qryDatosReimpDocFiscalMONTO_EXONERADO_ITBIS: TFloatField;
    qryDatosReimpDocFiscalMONTO_BRUTO: TFloatField;
    qryDatosReimpdocFiscalDetITBIS_FISCAL_DET: TFloatField;
    qryDatosReimpDocFiscalPORC_DESCUENTO: TIntegerField;
    qryRepLibroVentaDet: TIBQuery;
    qryRepInventarioProdMasBclRutaGRUPO_TIPO: TIBStringField;
    qryDatosVentaDetalleITBIS_FISCAL_DET: TFloatField;
    qryDatosVentaDetalleIDTASAITBIS: TFloatField;
    qryDatosVentaDetalleMONTOIBISRECARGO: TFloatField;
    qryDatosVentaDetalleMONTO_TASA: TFloatField;
    qryDatosVentaDetalleMONEDA: TIBStringField;
    qryDatosRepVentaDiariaMONTO_RECIBIDO: TFloatField;
    qryDatosRepVentaDiariaRes: TIBQuery;
    qryDatosRepVentaDiariaResFECHA: TDateTimeField;
    qryDatosRepVentaDiariaResNUMERO_TRN: TIntegerField;
    qryDatosRepVentaDiariaResNUMERO_DOCUMENTO: TIntegerField;
    qryDatosRepVentaDiariaResMONEDA: TIBStringField;
    qryDatosRepVentaDiariaResCODIGO_EMPLEADO: TIntegerField;
    qryDatosRepVentaDiariaResNOMBRE_VENDEDOR: TIBStringField;
    qryDatosRepVentaDiariaResFECHA1: TDateTimeField;
    qryDatosRepVentaDiariaResTIPO_DOCUMENTO: TIBStringField;
    qryDatosRepVentaDiariaResTIPO_DOC: TIntegerField;
    qryDatosRepVentaDiariaResVALOR_DOCUMENTO: TFloatField;
    qryDatosRepVentaDiariaResMONTO_RECIBIDO: TFloatField;
    qryDatosRepVentaDiariaResCANTVTA: TIntegerField;
    qryRepTransOpeDiariaMONTO_ITBIS: TFloatField;
    qryRepTransOpeDiariaIDTASAITBIS: TIntegerField;
    qryRepTransOpeDiariaDESC_TASAITBIS: TIBStringField;
    dstblConfReportes: TDataSource;
    tblConfReportes: TIBDataSet;
    tblConfReportesIDREPORTE: TIntegerField;
    tblConfReportesSIZE_REP: TSmallintField;
    tblConfReportesDESCRIPCION: TIBStringField;
    tblConfReportesENVIAR_EMAIL: TSmallintField;
    tblConfReportesTO_EMAIL: TIBStringField;
    tblConfReportesCC_EMAIL: TIBStringField;
    tblConfReportesCOD_USUARIO: TIntegerField;
    tblConfReportesFECHA_IN: TDateTimeField;
    tblConfReportesIN_POR: TIBStringField;
    tblConfReportesFECHA_UPD: TDateTimeField;
    tblConfReportesUPD_POR: TIBStringField;
    tblConfReportesSTATUS: TIBStringField;
    tblConfReportesIMPRECIBOSINPREG: TSmallintField;
    tblConfReportesNOTA_PIE_PAGINA: TIBStringField;
    tblConfReportesHEADER_LINE1: TMemoField;
    qryConfReportes: TIBQuery;
    qryConfReportesIDREPORTE: TIntegerField;
    qryConfReportesSIZE_REP: TSmallintField;
    qryConfReportesDESCRIPCION: TIBStringField;
    qryConfReportesENVIAR_EMAIL: TSmallintField;
    qryConfReportesTO_EMAIL: TIBStringField;
    qryConfReportesCC_EMAIL: TIBStringField;
    qryConfReportesCOD_USUARIO: TIntegerField;
    qryConfReportesFECHA_IN: TDateTimeField;
    qryConfReportesIN_POR: TIBStringField;
    qryConfReportesFECHA_UPD: TDateTimeField;
    qryConfReportesUPD_POR: TIBStringField;
    qryConfReportesSTATUS: TIBStringField;
    qryConfReportesIMPRECIBOSINPREG: TSmallintField;
    qryConfReportesNOTA_PIE_PAGINA: TIBStringField;
    qryConfReportesHEADER_LINE1: TMemoField;
    qryRepRepMasterDet: TIBQuery;
    qryRepRepMaster: TIBQuery;
    qryRepRepMasterNUMERO: TIntegerField;
    qryRepRepMasterTIPO_TRN: TIntegerField;
    qryRepRepMasterCOD_PROVEEDOR: TIntegerField;
    qryRepRepMasterFECHA: TDateTimeField;
    qryRepRepMasterOBSERVACION: TIBStringField;
    qryRepRepMasterSTATUS: TIBStringField;
    qryRepRepMasterDESCRIPCION: TIBStringField;
    qryRepRepMasterTELEFONO: TIBStringField;
    qryRepRepMasterCALYYNUM: TIBStringField;
    qryRepRepMasterCIUDAD: TIBStringField;
    qryRepRepMasterPAIS: TIBStringField;
    qryRepRepMasterCONTACTO: TIBStringField;
    qryRepRepMasterTIPO_TRNDESC: TIBStringField;
    qryRepServTallerM_base: TIBQuery;
    qryRepServTallerDet: TIBQuery;
    qryRepServTallerDetSERIE: TIntegerField;
    qryRepServTallerDetNUMERO: TIntegerField;
    qryRepServTallerDetFECHA: TDateTimeField;
    qryRepServTallerDetCOD_SERVICIO: TIntegerField;
    qryRepServTallerDetCANT: TFloatField;
    qryRepServTallerDetVALOR_SERVICIO: TFloatField;
    qryRepServTallerDetPORC_ITBIS: TFloatField;
    qryRepServTallerDetPORC_DESC: TFloatField;
    qryRepServTallerDetVALOR_ITBIS: TFloatField;
    qryRepServTallerDetVALOR_DESCUENTO: TFloatField;
    qryRepServTallerDetDESCRIPCION: TIBStringField;
    qryRepServTallerDetSTATUS: TIBStringField;
    qryRepServTallerDetIN_POR: TIBStringField;
    qryRepServTallerDetFECHA_IN: TDateTimeField;
    qryRepServTallerDetUPDATE_POR: TIBStringField;
    qryRepServTallerDetFECHA_UPDATE: TDateTimeField;
    qryRepServTallerDetCOD_USUARIO: TIntegerField;
    qryRepServTallerDetPRECIO: TFloatField;
    qryRepServTallerDetDESCRIPCIONESPECIAL: TMemoField;
    qryRepServTallerDetDESCRIPCION1: TIBStringField;
    qryRepServTallerM: TIBQuery;
    qryRepServTallerDetPRECIO_COMPRA: TFloatField;
    qryRepServTallerDetCOSTO_PRODUCTO: TFloatField;
    qryRepServTallerDetFECHA_ENTRADA: TDateTimeField;
    qryRepServTallerM_baseCopia: TIBQuery;
    qryRepServTallerM_baseCODIGO_EMP: TIntegerField;
    qryRepServTallerM_baseNOMBRE_EMPLEADO: TIBStringField;
    qryRepServTallerM_baseNOMBRE: TIBStringField;
    qryRepServTallerM_baseAPELLIDO: TIBStringField;
    qryRepServTallerMCODIGO_EMP: TIntegerField;
    qryRepServTallerMNOMBRE_EMPLEADO: TIBStringField;
    qryRepServTallerMNOMBRE: TIBStringField;
    qryRepServTallerMAPELLIDO: TIBStringField;
    qryRepServXTipoDet: TIBQuery;
    qryRepServXTipoDetSERIE: TIntegerField;
    qryRepServXTipoDetIDSERIE: TIntegerField;
    qryRepServXTipoDetCOD_PRODUCTO: TIntegerField;
    qryRepServXTipoDetSERIE_TRN: TIntegerField;
    qryRepServXTipoDetCANT_DIAS: TFloatField;
    qryRepServXTipoDetPRECIO_XDIA: TFloatField;
    qryRepServXTipoDetMONTO: TFloatField;
    qryRepServXTipoDetSTATUS: TIBStringField;
    qryRepServXTipoDetFECHA_IN: TDateTimeField;
    qryRepServXTipoDetIN_POR: TIBStringField;
    qryRepServXTipoDetFECHA_MOD: TDateTimeField;
    qryRepServXTipoDetMOD_POR: TIBStringField;
    qryRepServXTipoDetCODIGO_USUARIO: TIntegerField;
    qryRepServXTipoDetDESCRIPCIONSERVICIO: TMemoField;
    qryRepServXTipoDetPORC_SEGURO: TFloatField;
    qryRepServXTipoDetMONTO_SEGURO: TFloatField;
    qryRepServXTipoDetDESCRIPCION: TIBStringField;
    qryRepServXTipoDetPRECIO_COMPRA: TFloatField;
    qryRepServXTipoDetFECHA: TDateTimeField;
    qryRepServXTipoDetFECHA_ENTRADA: TDateTimeField;
    qryRepServXTipoDetFECHA_ENT_ESTIMADA: TDateTimeField;
    qryRepServXTipoMaster: TIBQuery;
    qryRepServXTipoMaster_Base: TIBQuery;
    tblConfReportesCODIGO_PROD: TIntegerField;
    qryConfReportesCODIGO_PROD: TIntegerField;
    qryRepServXTipoMasterCODIGO_USUARIO: TIntegerField;
    qryRepServXTipoMasterNOMBRE_EMPLEADO: TIBStringField;
    qryRepServXTipoMasterNOMBRE: TIBStringField;
    qryRepServXTipoMasterAPELLIDO: TIBStringField;
    qryRepServTallerDetFECHA_ESTIMADA_ENTREGA: TDateTimeField;
    qryViewVentasMastMontoRetencion: TCurrencyField;
    qryPorcRetencion: TIBQuery;
    qryPorcRetencionIDRETENCION: TIntegerField;
    qryPorcRetencionFECHAINI: TDateTimeField;
    qryPorcRetencionFECHAFINAL: TDateTimeField;
    qryPorcRetencionPORCIENTO: TFloatField;
    qryPorcRetencionDESCRIPCION: TIBStringField;
    qryPorcRetencionSTATUS: TIBStringField;
    qryViewVentasMastIDRETENCION: TIntegerField;
    qryViewVentasMastCIA_KEY: TIntegerField;
    qryViewVentasMastFECHA_IN: TDateTimeField;
    qryViewVentasMastIN_POR: TIBStringField;
    qryViewVentasMastFECHA_MOD: TDateTimeField;
    qryViewVentasMastMOD_POR: TIBStringField;
    qryViewVentasMastMONTO_TOTAL_ITBIS: TFloatField;
    qryViewVentasMastMONTODESCGASTOSADMIN: TFloatField;
    qryViewVentasMastMONTODESCITBISGASTOSADMIN: TFloatField;
    qryViewVentasMastMONTODESCTRANSP: TFloatField;
    qryViewVentasMastMONTODESCDIRTECNICA: TFloatField;
    qryViewVentasMastMONTODESCITBISDIRTECNICA: TFloatField;
    qryViewVentasMastMONTODESCIMPREVISTO: TFloatField;
    qryViewVentasMastMONTODESCITBISIMPREVISTO: TFloatField;
    qryViewVentasMastMONTO_EXONERADO_ITBIS: TFloatField;
    qryEstadoCxcBB: TIBQuery;
    qryEstadoCxcBBCODIGO_CTE: TIntegerField;
    qryEstadoCxcBBNOMBRE_CTE: TIBStringField;
    qryEstadoCxcBBRNC_NUMERO: TIBStringField;
    qryEstadoCxcBBTELEF_CONTACTO: TIBStringField;
    qryEstadoCxcBBMOVIL1: TIBStringField;
    qryEstadoCxcBBNUMERO: TFloatField;
    qryEstadoCxcBBFECHA: TDateTimeField;
    qryEstadoCxcBBFECHA_VENCE: TDateTimeField;
    qryEstadoCxcBBMONTO_FACT: TFloatField;
    qryEstadoCxcBBMONTO_VENCIDO: TFloatField;
    qryEstadoCxcBBMONTO_PENDIENTE: TFloatField;
    qryEstadoCxcBBMONEDA: TIBStringField;
    qryEstadoCxcBBSTATUS_FACTURA: TIBStringField;
    qryRepOrdenTrabajo: TIBQuery;
    qryRepOrdenTrabajoIDORDEN: TIntegerField;
    qryRepOrdenTrabajoFECHA: TDateTimeField;
    qryRepOrdenTrabajoCOD_MONEDA: TIBStringField;
    qryRepOrdenTrabajoCODIGO_CTE: TIntegerField;
    qryRepOrdenTrabajoFECHA_ENTREGA: TDateTimeField;
    qryRepOrdenTrabajoNUM_ORDEN: TIntegerField;
    qryRepOrdenTrabajoDESC_VEHICULO: TIBStringField;
    qryRepOrdenTrabajoDESC_ORDEN: TMemoField;
    qryRepOrdenTrabajoMONTO_TOTAL: TFloatField;
    qryRepOrdenTrabajoMONTO_ABONO: TFloatField;
    qryRepOrdenTrabajoASIGNADO_A: TIntegerField;
    qryRepOrdenTrabajoCODIGO_USER: TIntegerField;
    qryRepOrdenTrabajoSTATUS: TIBStringField;
    qryRepOrdenTrabajoDESC_MONEDA: TIBStringField;
    qryRepOrdenTrabajoSIMBOLO_MONEDA: TIBStringField;
    qryRepOrdenTrabajoNOMBRE_CTE: TIBStringField;
    qryRepOrdenTrabajoNOMBRECOMPLETO: TIBStringField;
    qryRepOrdenTrabajoRESTA: TFloatField;
    qryReporteOrdenes_base: TIBQuery;
    IntegerField11: TIntegerField;
    DateTimeField2: TDateTimeField;
    IBStringField20: TIBStringField;
    IntegerField12: TIntegerField;
    DateTimeField3: TDateTimeField;
    IntegerField13: TIntegerField;
    IBStringField21: TIBStringField;
    MemoField2: TMemoField;
    FloatField23: TFloatField;
    FloatField24: TFloatField;
    IntegerField14: TIntegerField;
    IntegerField15: TIntegerField;
    IBStringField22: TIBStringField;
    IBStringField23: TIBStringField;
    IBStringField24: TIBStringField;
    IBStringField25: TIBStringField;
    IBStringField26: TIBStringField;
    FloatField25: TFloatField;
    qryReporteOrdenes: TIBQuery;
    qryUsuarios: TIBQuery;
    qryUsuariosNUMERO: TSmallintField;
    qryUsuariosCODIGO: TIBStringField;
    qryUsuariosCLAVE: TIBStringField;
    qryUsuariosCODIGO_EMPLEADO: TIntegerField;
    qryUsuariosNOMBRECOMPLETO: TIBStringField;
    qryUsuariosFOTO: TBlobField;
    qryUsuariosTIPO: TSmallintField;
    qryUsuariosFECHA_VENCE_CLAVE: TDateTimeField;
    qryUsuariosFECHA_ENTRADA: TDateTimeField;
    qryUsuariosFECHA_SALIDA: TDateTimeField;
    qryUsuariosSTATUS: TIBStringField;
    qryUsuariosARCHIVOCONFGWIN: TIBStringField;
    qryReporteOrdenesIDORDEN: TIntegerField;
    qryReporteOrdenesFECHA: TDateTimeField;
    qryReporteOrdenesCOD_MONEDA: TIBStringField;
    qryReporteOrdenesCODIGO_CTE: TIntegerField;
    qryReporteOrdenesFECHA_ENTREGA: TDateTimeField;
    qryReporteOrdenesNUM_ORDEN: TIntegerField;
    qryReporteOrdenesDESC_VEHICULO: TIBStringField;
    qryReporteOrdenesDESC_ORDEN: TMemoField;
    qryReporteOrdenesMONTO_TOTAL: TFloatField;
    qryReporteOrdenesMONTO_ABONO: TFloatField;
    qryReporteOrdenesRESTA: TFloatField;
    qryReporteOrdenesASIGNADO_A: TIntegerField;
    qryReporteOrdenesCODIGO_USER: TIntegerField;
    qryReporteOrdenesSTATUS: TIBStringField;
    qryReporteOrdenesDESC_MONEDA: TIBStringField;
    qryReporteOrdenesSIMBOLO_MONEDA: TIBStringField;
    qryReporteOrdenesNOMBRE_CTE: TIBStringField;
    qryReporteOrdenesNOMBRECOMPLETO: TIBStringField;
    qryRepOrdenTrabajoDIAS: TFloatField;
    qryNCFNull: TIBQuery;
    qryNCFNullNCF_SERIE: TIntegerField;
    qryNCFNullNCF_TIPO_NCF: TIBStringField;
    qryNCFNullNCF_NUMERO_NCF: TIBStringField;
    qryNCFNullNCF_FECHA: TDateTimeField;
    qryNCFNullNCF_MONTO: TFloatField;
    qryNCFNullNCF_STATUS: TIBStringField;
    qryNCFNullNCF_CODIGOUSUARIO: TIntegerField;
    qryNCFNullNCF_FECHA_INSERT: TDateTimeField;
    qryNCFNullNCF_CODIGO_USUARIO: TIntegerField;
    qryNCFNullNCF_NOMBREUSUARIO: TIBStringField;
    qryNCFNullNUMERO: TIntegerField;
    qryNCFNullCODIGO_CTE: TIntegerField;
    qryNCFNullCODIGO_VENDEDOR: TIntegerField;
    qryNCFNullFORMA_PAGO: TSmallintField;
    qryNCFNullOBSERVACION: TIBStringField;
    qryNCFNullVALOR_TOTAL_DET: TFloatField;
    qryNCFNullMONTO_TOTAL_ITBIS: TFloatField;
    qryNCFNullSTATUS: TIBStringField;
    qryNCFNullNUMERO_FACTURA: TIntegerField;
    qryNCFNullNUMERO_DOC_PAGO: TIBStringField;
    qryNCFNullSERIE_NCF_ASIGNADO: TIntegerField;
    qryNCFNullMONTO_PAGADO: TFloatField;
    qryNCFNullMONTO_CAMBIO: TFloatField;
    qryProdMasVendido: TIBQuery;
    qryProdMasVendidoCODIGO_PROD: TIBStringField;
    qryProdMasVendidoCANTVENTAS: TIntegerField;
    qryProdMasVendidoCANT: TFloatField;
    qryProdMasVendidoDESCRIPCION: TIBStringField;
    qryFechaUltVtaProd: TIBQuery;
    qryFechaUltVtaProdCODIGO: TIntegerField;
    qryFechaUltVtaProdDESCRIPCION: TIBStringField;
    qryFechaUltVtaProdULTIMAFECHAVENTA: TDateTimeField;
    qryFechaUltVtaProdCANTDIASNOVTA: TIntegerField;
    qryFechaUltVtaProdCANTVECESVENDIDO: TIntegerField;
    qryFechaUltVtaProd_0: TIBQuery;
    qryFechaUltVtaProd_1: TIBQuery;
    qryFechaUltVtaProd_0CODIGO: TIntegerField;
    qryFechaUltVtaProd_0DESCRIPCION: TIBStringField;
    qryFechaUltVtaProd_0ULTIMAFECHAVENTA: TDateTimeField;
    qryFechaUltVtaProd_0CANTDIASNOVTA: TIntegerField;
    qryFechaUltVtaProd_0CANTVECESVENDIDO: TIntegerField;
    qryFechaUltVtaProd_1CODIGO: TIntegerField;
    qryFechaUltVtaProd_1DESCRIPCION: TIBStringField;
    qryFechaUltVtaProd_1ULTIMAFECHAVENTA: TDateTimeField;
    qryFechaUltVtaProd_1CANTDIASNOVTA: TIntegerField;
    qryFechaUltVtaProd_1CANTVECESVENDIDO: TIntegerField;
    qryFechaUltVtaProdCANT_ACTUAL: TIntegerField;
    qryFechaUltVtaProd_0CANT_ACTUAL: TIntegerField;
    qryFechaUltVtaProd_1CANT_ACTUAL: TIntegerField;
    qryViewVentasHist_baseDIRECCION_CONT: TIBStringField;
    qryViewVentasHist_baseTELEF_CONTACTO: TIBStringField;
    qryViewVentasHist_baseCIUDAD: TIBStringField;
    qryViewVentasHist_basePAIS: TIBStringField;
    qryViewVentasHist_baseNOMBRE_ABREV: TIBStringField;
    qryViewVentasHist_baseNUMERO: TIntegerField;
    qryViewVentasHist_baseFECHA: TDateTimeField;
    qryViewVentasHist_baseCIA_KEY: TIntegerField;
    qryViewVentasHist_baseCODIGO_CTE: TIntegerField;
    qryViewVentasHist_baseCODIGO_VENDEDOR: TIntegerField;
    qryViewVentasHist_baseFORMA_PAGO: TSmallintField;
    qryViewVentasHist_baseOBSERVACION: TIBStringField;
    qryViewVentasHist_baseMONEDA: TIBStringField;
    qryViewVentasHist_baseVALOR_TOTAL_DET_MAST: TFloatField;
    qryViewVentasHist_baseSTATUS: TIBStringField;
    qryViewVentasHist_baseNUMERO_FACTURA: TIntegerField;
    qryViewVentasHist_baseNUMERO_DOC_PAGO: TIBStringField;
    qryViewVentasHist_baseSERIE_NCF_ASIGNADO: TIntegerField;
    qryViewVentasHist_baseMONTO_BRUTO: TFloatField;
    qryViewVentasHist_basePORC_DESCUENTO: TIntegerField;
    qryViewVentasHist_baseMONTO_DESCUENTO: TFloatField;
    qryViewVentasHist_baseMONTO_INICIAL: TFloatField;
    qryViewVentasHist_baseNOMBRE_CLIENTE_GENERAL: TIBStringField;
    qryViewVentasHist_baseMONTO_PAGADO: TFloatField;
    qryViewVentasHist_baseMONTO_CAMBIO: TFloatField;
    qryViewVentasHist_baseMONTO_TOTAL_ITBIS: TFloatField;
    qryViewVentasHist_baseMONTODESCGASTOSADMIN: TFloatField;
    qryViewVentasHist_baseMONTODESCITBISGASTOSADMIN: TFloatField;
    qryViewVentasHist_baseMONTODESCTRANSP: TFloatField;
    qryViewVentasHist_baseMONTODESCDIRTECNICA: TFloatField;
    qryViewVentasHist_baseMONTODESCITBISDIRTECNICA: TFloatField;
    qryViewVentasHist_baseMONTODESCIMPREVISTO: TFloatField;
    qryViewVentasHist_baseMONTODESCITBISIMPREVISTO: TFloatField;
    qryViewVentasHist_baseCOMENTARIO: TIBStringField;
    qryViewVentasHist_baseNOMBRE_FACTURAR: TFloatField;
    qryViewVentasHist_baseCOD_VENDEDOR: TFloatField;
    qryViewVentasHist_baseSERIE: TIBStringField;
    qryViewVentasHist_baseDESCRIPCION_DET: TIntegerField;
    qryViewVentasHist_baseCODIGO_PROD: TIntegerField;
    qryViewVentasHist_baseCANTIDAD: TIBStringField;
    qryViewVentasHist_basePRECIO: TIBStringField;
    qryViewVentasHist_basePORC_DESC_DET: TFloatField;
    qryViewVentasHist_baseITBI_DET: TFloatField;
    qryViewVentasHist_baseVALOR_SERVICIO_DET: TFloatField;
    qryViewVentasHist_baseVALOR_TOTAL_DET: TFloatField;
    qryViewVentasHist_baseNUM_FACTURA: TFloatField;
    qryViewVentasHist_baseSTATUS_DET: TFloatField;
    qryViewVentasHist_baseSERIE_PROD: TFloatField;
    qryViewVentasHist_baseSTATUS_CNT: TIBStringField;
    qryViewVentasHist_baseTIPO_UNIDAD: TIBStringField;
    qryViewVentasHist_baseITBIS_EXENTO: TIBStringField;
    qryViewVentasHist_baseTIPO_VENTA_DET: TIntegerField;
    qryViewVentasHist_baseDESCRIPCIONPRODUCTO: TSmallintField;
    qryViewVentasHist_baseDESC_PRODUCTO_INVENTARIO: TSmallintField;
    qryViewVentasHist_baseNOMBRE_VENDEDOR: TMemoField;
    qryViewVentasHist_basePRECIO_COMPRA: TIBStringField;
    qryViewVentasHist_baseNOMBREPROVEEDOR: TIBStringField;
    qryViewVentasHist_baseCODIGO_PROVEEDOR: TFloatField;
    qryViewVentasHist_baseCODIGO_TEXTO: TIBStringField;
    qryViewVentasHist_basePROPINA: TIntegerField;
    qryViewVentasHist_basePORCPROPINALEGAL: TIBStringField;
    qryDatosVentaMasterMONTO_EXONERADO_ITBIS: TFloatField;
    qryDatosVentaMasterIDRETENCION: TIntegerField;
    qryDatosVentaMasterPROPINA: TFloatField;
    qryDatosVentaMasterPORCPROPINALEGAL: TFloatField;
    qryDatosVentaMasterPROPINALEGAL: TFloatField;
    qryDatosReimpDocFiscalPORCPROPINALEGAL: TFloatField;
    qryDatosReimpDocFiscalPROPINA: TFloatField;
    qryDatosReimpDocFiscalPROPINALEGAL: TFloatField;
    qryDetItbisFastFood: TIBQuery;
    qryDetItbisFastFoodNUMERO: TIntegerField;
    qryDetItbisFastFoodMONTO_ITBIS: TFloatField;
    qryDetItbisFastFoodPORC_ITBIS: TFloatField;
    qryDatosReimpDocFiscalFECHAHORA: TDateTimeField;
    qryNCFAfectado: TIBQuery;
    qryNCFAfectadoNUMERO_NCF: TIBStringField;
    qryDescLineasDocFSTATUS: TIBStringField;
    qryViewVentasMastPROPINA: TFloatField;
    qryViewVentasMastPORCPROPINALEGAL: TFloatField;
    qryViewVentasMastPROPINALEGAL: TFloatField;
    qryViewVentasMastCIUDAD: TIBStringField;
    qryDetItbisFastFoodMONTO_ITBISFOOD: TFloatField;
    tblTicket_params: TIBDataSet;
    QryTicket_params: TIBQuery;
    QryTicket_paramsFPAGO: TIntegerField;
    QryTicket_paramsNUMERO_TRN: TIntegerField;
    QryTicket_paramsSTATUS: TIBStringField;
    tblTicket_paramsFPAGO: TIntegerField;
    tblTicket_paramsNUMERO_TRN: TIntegerField;
    tblTicket_paramsSTATUS: TIBStringField;
    tblCtrlTransusuarioID_USUARIO: TIntegerField;
    tblCtrlTransusuarioNUMERO_TRANS: TIntegerField;
    tblCtrlTransusuarioINSERTADO_POR: TIBStringField;
    tblCtrlTransusuarioFECHA_IN: TDateTimeField;
    tblCtrlTransusuarioSTATUS: TIBStringField;
    tblTicket_paramsPARAMETROS: TIBStringField;
    tblTicket_paramsARCHIVO: TIBStringField;
    QryTicket_paramsPARAMETROS: TIBStringField;
    QryTicket_paramsARCHIVO: TIBStringField;
    tblTicket_paramsORIGEN: TIBStringField;
    QryTicket_paramsORIGEN: TIBStringField;
    qryDatosReimpDocFiscalNOMBRE_CLIENTE_GENERAL: TIBStringField;
    qryViewVentasMastFECHA_VENCE: TDateTimeField;
    qryLComentario: TIBQuery;
    qryLComentarioID: TSmallintField;
    qryLComentarioNUMERO_TRN: TIntegerField;
    qryLComentarioNUMLIN: TSmallintField;
    qryLComentarioLINEA: TIBStringField;
    qryClientesMOVIL1: TIBStringField;
    qryClientesMOVIL2: TIBStringField;
    qryClientesOTRO_TELEFONO: TIBStringField;
    qryClientesRUTA_FOTO: TIBStringField;
    qryClientesCODZONA: TIntegerField;
    qryLComentarioTIPO_OPE: TSmallintField;
    qryDatos607: TIBQuery;
    qryDatosReimpDocFiscalNOMBRE_CTE: TIBStringField;
    qryDatosReimpDocFiscalRNC_NUMERO: TIBStringField;
    qryDatosReimpDocFiscalSUB_TOTALITBIS: TFloatField;
    qryTipoInv: TIBQuery;
    qryTipoInvCODIGO: TSmallintField;
    qryTipoInvDESCRIPCION: TIBStringField;
    qryFPagoTicket: TIBQuery;
    qryFPagoTicketTIPO_PAGO: TSmallintField;
    qryFPagoTicketMONTO_PAGADO: TFloatField;
    qryFPagoTicketMONTO_CAMBIO: TFloatField;
    qryFPagoTicketNUMERO: TIntegerField;
    qryFPagoTicketFPAGO: TSmallintField;
    qryFPagoTicketFPAGODGII: TSmallintField;
    qryFPagoTicketFORMA_PAGO: TSmallintField;
    qryFPagoTicketDESCRIPCION: TIBStringField;
    qryFPagoTicketDESCRIPCIONDGII: TIBStringField;
    qryRepDepositos: TIBQuery;
    qryRepDepositosDESCRIPCION: TIBStringField;
    qryRepDepositosNUMERO: TIntegerField;
    qryRepDepositosFECHA: TDateTimeField;
    qryRepDepositosID_BANCO: TIntegerField;
    qryRepDepositosMONTO: TFloatField;
    qryRepDepositosSTATUS: TIBStringField;
    qryRepDepositosCOD_USUARIO: TIntegerField;
    qryRepDepositosFECHA_IN: TDateTimeField;
    qryRepDepositosIN_POR: TIBStringField;
    qryRepDepositosFECHA_UPDATE: TDateTimeField;
    qryRepDepositosTIPO_CTA: TIntegerField;
    qryRepDepositosCUENTA_BANCO: TIBStringField;
    qryRepDepositosDESC_BANCO: TIBStringField;
    qryRepDepositosDESC_TIPO_CTA: TIBStringField;
    qryRepDepositosDet: TIBQuery;
    qryRepDepositosDetDESC_TIPO_DEPOSITO: TIBStringField;
    qryRepDepositosDetSERIE: TIntegerField;
    qryRepDepositosDetNUMERO: TIntegerField;
    qryRepDepositosDetTIPO_DEPOSITO: TIntegerField;
    qryRepDepositosDetNUMERO_DOCUMENTO: TIBStringField;
    qryRepDepositosDetDESCRIPCION: TIBStringField;
    qryRepDepositosDetMONTO_DEPOSITO: TIntegerField;
    qryRepDepositosDetSTATUS: TIBStringField;
    qryRepDepositosDetCOD_USUARIO: TIntegerField;
    qryRepDepositosDetFECHA_IN: TDateTimeField;
    qryRepDepositosDetIN_POR: TIBStringField;
    qryRepDepositosDetFECHA_UPDATE: TDateTimeField;
    qryDatosRepClientesCOD_CIUDAD: TIntegerField;
    qryDatosRepClientesRUTA: TIntegerField;
    qryDatosRepClientesDESCCIUDAD: TIBStringField;
    qryDatosRepClientesDESC_RUTAVTA: TIBStringField;
    qryDatosRepClientesDIA_RUTA: TIBStringField;
    qryDatosRepClientesNOMBREVENDEDOR: TIBStringField;
    qryViewVentasMastDESC_SECTOR: TIBStringField;
    qryViewVentasMastDESC_CIUDAD: TIBStringField;
    qryViewVentasDetFICHA_VEH: TIntegerField;
    qryViewVentasDetNUM_IDENT: TIBStringField;
    qryViewVentasDetITBIS_FISCAL_DET: TFloatField;
    qryViewVentasDetIDTASAITBIS: TFloatField;
    qryViewVentasDetMONTOIBISRECARGO: TFloatField;
    qryViewVentasDetMONTO_TASA: TFloatField;
    qryViewVentasDetMONEDA: TIBStringField;
    qryViewVentasMastCANT_DIAS_CREDITO: TSmallintField;
    qryRepTransOpeDiariaFICHA_VEH: TIntegerField;
    qryRepTransOpeDiariaROTULO: TIBStringField;
    qryRepTransOpeDiariaPLACA: TIBStringField;
    qryRepGastosVtas: TIBQuery;
    qryRepGastosVtas_Base: TIBQuery;
    qryDatos607TIPODOC: TIBStringField;
    qryDatos607CANT_COMPROBANTE: TIntegerField;
    qryDatos607NUMERO_TRN: TIntegerField;
    qryDatos607FECHA: TDateTimeField;
    qryDatos607SERIE: TIntegerField;
    qryDatos607DESCRIPCION: TIBStringField;
    qryDatos607IDTASAITBIS: TSmallintField;
    qryDatos607TIPO_NCF: TIBStringField;
    qryDatos607NUMERO_NCF: TIBStringField;
    qryDatos607DESCRIPCION_2018: TIBStringField;
    qryDatos607NOMBRE_FACTURAR: TIBStringField;
    qryDatos607RNC_NUMERO: TIBStringField;
    qryDatos607MONTO_BRUTO: TFloatField;
    qryDatos607MONTO_DESCUENTO: TFloatField;
    qryDatos607MONTO_EXONERADO_ITBIS: TFloatField;
    qryDatos607MONTO_TOTAL_ITBIS: TFloatField;
    qryDatos607ITBIS_FISCAL_DET: TFloatField;
    qryDatos607ITBI_DET: TFloatField;
    qryDatos607ITBI_18: TFloatField;
    qryDatos607ITBI_16: TFloatField;
    qryDatos607ITBI_13: TFloatField;
    qryDatos607ITBI_11: TFloatField;
    qryDatos607ITBI_8: TFloatField;
    qryDatos607ITBI_EXONERADO: TFloatField;
    qryDatos607VALOR_TOTAL_DET: TFloatField;
    qryDatos607TIPO_IDENT: TSmallintField;
    qryDatos607TIPODEINGRESO: TSmallintField;
    qryDatos607MONTO_PROPINA_LEGAL: TFloatField;
    qryDatos607MONTO_RECARGO: TFloatField;
    qryDatos607FORMA_PAGO: TSmallintField;
    qckRepDatos: TIBQuery;
    qckRepDatosCODIGO: TIntegerField;
    qckRepDatosDESCRIPCION: TIBStringField;
    qckRepDatosUNIDAD: TIBStringField;
    qckRepDatosPRECIOACTUAL: TFloatField;
    qckRepDatosEXISTENCIA: TFloatField;
    qryViewVentasDetNUM_CONDUCE_CTE: TIBStringField;
    qryRepAnalisisPrecio: TIBQuery;
    qryRepAnalisisPrecioCODIGO: TIntegerField;
    qryRepAnalisisPrecioDESCRIPCION: TIBStringField;
    qryRepAnalisisPrecioTIPOUNIDADINV: TIBStringField;
    qryRepAnalisisPrecioTUNIDADPRECIOVTA: TIBStringField;
    qryRepAnalisisPrecioTIENEVTA: TIBStringField;
    qryRepAnalisisPrecioCOSTO: TFloatField;
    qryRepAnalisisPrecioPRECIO_MINIMO: TFloatField;
    qryRepAnalisisPrecioPRECIO: TFloatField;
    qryRepAnalisisPrecioCANT_UNIDAD: TFloatField;
    qryRepAnalisisPrecioPRECIOVENTA1: TFloatField;
    qryRepAnalisisPrecioPRECIOVENTA2: TFloatField;
    qryRepAnalisisPrecioPRECIOVENTA3: TFloatField;
    qryRepAnalisisPrecioPRECIOVENTA4: TFloatField;
    qryRepAnalisisPrecioVTA_VS_COSTOP_1: TIBStringField;
    qryRepAnalisisPrecioVTA_VS_COSTOP_2: TIBStringField;
    qryRepAnalisisPrecioVTA_VS_COSTOP_3: TIBStringField;
    qryRepAnalisisPrecioVTA_VS_COSTOP_4: TIBStringField;
    qryRepAnalisisPrecioEVALP_1: TIBStringField;
    qryRepAnalisisPrecioEVALP_2: TIBStringField;
    qryRepAnalisisPrecioEVALP_3: TIBStringField;
    qryRepAnalisisPrecioEVALP_4: TIBStringField;
    qryRepListaPrecioIncons: TIBQuery;
    qryRepListaPrecioInconsCODIGO: TIntegerField;
    qryRepListaPrecioInconsDESCRIPCION: TIBStringField;
    qryRepListaPrecioInconsTIPOUNIDADINV: TIBStringField;
    qryRepListaPrecioInconsTUNIDADPRECIOVTA: TIBStringField;
    qryRepListaPrecioInconsTIENEVTA: TIBStringField;
    qryRepListaPrecioInconsCOSTO: TFloatField;
    qryRepListaPrecioInconsPRECIO_MINIMO: TFloatField;
    qryRepListaPrecioInconsPRECIO: TFloatField;
    qryRepListaPrecioInconsCANT_UNIDAD: TFloatField;
    qryRepListaPrecioInconsPRECIOVENTA1: TFloatField;
    qryRepListaPrecioInconsPRECIOVENTA2: TFloatField;
    qryRepListaPrecioInconsPRECIOVENTA3: TFloatField;
    qryRepListaPrecioInconsPRECIOVENTA4: TFloatField;
    qryRepListaPrecioInconsVTA_VS_COSTOP_1: TIBStringField;
    qryRepListaPrecioInconsVTA_VS_COSTOP_2: TIBStringField;
    qryRepListaPrecioInconsVTA_VS_COSTOP_3: TIBStringField;
    qryRepListaPrecioInconsVTA_VS_COSTOP_4: TIBStringField;
    qryRepListaPrecioInconsEVALP_1: TIBStringField;
    qryRepListaPrecioInconsEVALP_2: TIBStringField;
    qryRepListaPrecioInconsEVALP_3: TIBStringField;
    qryRepListaPrecioInconsEVALP_4: TIBStringField;
    qryViewVentasHistRUTA: TIntegerField;
    qryViewVentasHistDESC_RUTA: TIBStringField;
    qryDatosRepClientesBase: TIBQuery;
    qryDatosRepClientesCODZONA: TIntegerField;
    qryDatosRepClientesSECTOR: TIBStringField;
    qryDatosRepClientesCANTDIASSINVTA: TFloatField;
    qryDatosRepClientesCALLE: TIBStringField;
    qryDatosRepClientesMANZANA: TIBStringField;
    qryDatosRepClientesEDIFICIO: TIBStringField;
    qryFPagoTicketMONTOPAGADODET: TFloatField;
    qryViewVentasMastEMAIL: TIBStringField;
    qryViewVentasMastREFERENCIACTE: TIBStringField;
    qryViewVentasMastNOMBRE_VENDEDOR: TIBStringField;
    qryRepTransOpeDiariaNUMERO_NCF: TIBStringField;
    qryRepTransOpeDiariaIDTIPO_COMPRA: TIntegerField;
    qryRepTransOpeDiariaDESCTIPOCOMPRA: TIBStringField;
    qryRepTransOpeDiariaDESCFPAGODGII: TIBStringField;
    qryRepTransOpeDiariaIDCODIGO_TPAGODGII: TSmallintField;
    qryRepTransOpeDiariaRNC_PROVEEDOR: TIBStringField;
    qryViewVentasDetCODIGO_VENDEDOR: TIntegerField;
    qryCantVendedoresSam: TIBQuery;
    qryCantVendedoresSamCANTVENDEDORES: TIntegerField;
    qryDatosVentaMasterNOMBRE_VENDEDOR: TIBStringField;
    qryDatosVentaMasterCOD_USR_CAJA: TIntegerField;
    qryRepComisionSAM: TIBQuery;
    qryRepComisionSAMSECCION: TIBStringField;
    qryRepComisionSAMCODIGO_VENDEDOR: TIntegerField;
    qryRepComisionSAMNOMBRE_VENDEDOR: TIBStringField;
    qryRepComisionSAMCANTVTA: TIntegerField;
    qryRepComisionSAMMETACUMPLIDA: TSmallintField;
    qryRepComisionSAMCANTMETA: TIntegerField;
    qryRepComisionSAMPORC_COMISION: TFloatField;
    qryRepComisionSAMPORC_COM_EXTRA: TFloatField;
    qryRepComisionSAMMONTO_VENTA: TFloatField;
    qryRepComisionSAMMONTO_COMISION: TFloatField;
    qryRepComisionSAM_Base: TIBQuery;
    qryRepComisionSAMCODCATEGORIA: TIntegerField;
    qryRepComisionSAMDESC_CATEGORIA: TIBStringField;
    qryViewVentasMastFECHAINICIAPOLIZA: TDateTimeField;
    qryRepDatosPoliza: TIBQuery;
    qryRepDatosPolizaDESCMARCAVEH: TIBStringField;
    qryRepDatosPolizaNUMERO: TIntegerField;
    qryRepDatosPolizaCODIGO_CTE: TIntegerField;
    qryRepDatosPolizaTIPO_AFILIADO: TSmallintField;
    qryRepDatosPolizaPLACA: TIBStringField;
    qryRepDatosPolizaIDMARCA: TIntegerField;
    qryRepDatosPolizaMODELO: TIBStringField;
    qryRepDatosPolizaANO_VEH: TIntegerField;
    qryRepDatosPolizaFECHA_VENCE_SEGURO: TDateTimeField;
    qryRepDatosPolizaTIPO_SEGURO: TSmallintField;
    qryRepDatosPolizaCIA_SEGURO: TIBStringField;
    qryRepDatosPolizaEMPRESA_LABORA: TIBStringField;
    qryRepDatosPolizaFECHA_IN: TDateTimeField;
    qryRepDatosPolizaIN_POR: TIBStringField;
    qryRepDatosPolizaCODIGO_DEALER: TIntegerField;
    qryRepDatosPolizaCODIGO_AGENCIA: TIntegerField;
    qryRepDatosPolizaCOLOR: TIBStringField;
    qryRepDatosPolizaNUM_CERTIFICADO: TIntegerField;
    qryRepDatosPolizaCHASSIS: TIBStringField;
    qryRepDatosPolizaNUMPOL: TIntegerField;
    qryRepDatosPolizaSTATUSCXC: TIBStringField;
    qryViewVentasMastTIPO_AFILIADO: TSmallintField;
    qryViewVentasMastDESCTIPOAFILIADO: TIBStringField;
    qryDatosVentaMasterTIPO_AFILIADO: TSmallintField;
    qryDatosVentaMasterFECHAINICIAPOLIZA: TDateTimeField;
    qryDatosVentaMasterDESCTIPOAFILIADO: TIBStringField;
    qryRepEquipos: TIBQuery;
    qryRepEquiposCODIGO_PROD: TIntegerField;
    qryRepEquiposDESCRIPCION: TIBStringField;
    qryRepEquiposSTATUS_EQUIPO: TSmallintField;
    qryRepEquiposDESCESTATUS: TIBStringField;
    qryRepEquiposFECHA_ENTRADA: TDateTimeField;
    qryRepEquiposFECHA_ULTIMA_TRN: TDateTimeField;
    qryRepEquiposSERIE_EQUIPO: TIBStringField;
    qryRepEquiposCODIGO_CTE: TIntegerField;
    qryRepEquiposNOMBRECLIENTE: TIBStringField;
    qryRepEquiposTELEF_CONTACTO: TIBStringField;
    qryRepEquiposDIRECCION_CONT: TIBStringField;
    qryRepEquiposFECHASALIDARMA: TDateTimeField;
    qryRepEquiposFECHAENTRADARMA: TDateTimeField;
    qryRepEquiposFECHAESTIMADARMA: TDateTimeField;
    qryRepEquiposCANTIDAD: TFloatField;
    qryViewVentasMastDESC_FORMAPAGO: TIBStringField;
    qryRepEquiposCODIGO_TECNICO: TIntegerField;
    qryRepEquiposNOMBRETECNICO: TIBStringField;
    qryRepEquiposNUMERO: TIntegerField;
    qryDatosRepVentaDiariaESCXC: TSmallintField;
    qryDatosRepVentaDiariaNUM_TRANSFERENCIA: TIntegerField;
    qryViewVentasMastFECHA_VENCEFCT: TDateTimeField;
    tblConfReportesNOTAPIEPAGINAFACTCREDITO: TMemoField;
    qryConfReportesNOTAPIEPAGINAFACTCREDITO: TMemoField;
    qryViewVentasMastIDNUMERODVEH: TIntegerField;
    qryReporteOrdenesComp: TIBQuery;
    qryReporteOrdenesComp_base: TIBQuery;
    qryReporteOrdenesCompORDENRECIBIDAPOR: TIBStringField;
    qryReporteOrdenesCompORDENCREADAPOR: TIBStringField;
    qryReporteOrdenesCompDESCTIPOUNIDAD: TIBStringField;
    qryReporteOrdenesCompFORMADEPAGO: TIBStringField;
    qryReporteOrdenesCompDESCPROVEEDOR: TIBStringField;
    qryReporteOrdenesCompEMAIL: TIBStringField;
    qryReporteOrdenesCompTELEFONO: TIBStringField;
    qryReporteOrdenesCompMOVIL1: TIBStringField;
    qryReporteOrdenesCompNUMERO: TIntegerField;
    qryReporteOrdenesCompCODIGO_PROVEE: TIntegerField;
    qryReporteOrdenesCompFECHA: TDateTimeField;
    qryReporteOrdenesCompFPAGO: TSmallintField;
    qryReporteOrdenesCompCOD_CAJA_CHICA: TIntegerField;
    qryReporteOrdenesCompCODIGO_BANCO: TIntegerField;
    qryReporteOrdenesCompCUENTABANCO: TIBStringField;
    qryReporteOrdenesCompOBSERVACION: TIBStringField;
    qryReporteOrdenesCompMONTO: TFloatField;
    qryReporteOrdenesCompSTATUS: TIBStringField;
    qryReporteOrdenesCompIN_POR: TIBStringField;
    qryReporteOrdenesCompFECHA_IN: TDateTimeField;
    qryReporteOrdenesCompMOD_POR: TIBStringField;
    qryReporteOrdenesCompFECHA_MOD: TDateTimeField;
    qryReporteOrdenesCompTIPO_INV: TSmallintField;
    qryReporteOrdenesCompSTATUS_CNT: TIBStringField;
    qryReporteOrdenesCompNUM_ORDEN: TIntegerField;
    qryReporteOrdenesCompSTATUS_ORD: TIBStringField;
    qryReporteOrdenesCompAREA_ORDEN: TIntegerField;
    qryReporteOrdenesCompCIA_KEY: TIntegerField;
    qryReporteOrdenesCompNUMERO_NCF: TIBStringField;
    qryReporteOrdenesCompCODIGO_VENDEDOR: TIntegerField;
    qryReporteOrdenesCompSERIE_TIPOTRNCNT: TIntegerField;
    qryReporteOrdenesCompTASA_ITBIS: TFloatField;
    qryReporteOrdenesCompTASA_ISR: TFloatField;
    qryReporteOrdenesCompMONTO_RETENER_ISR: TFloatField;
    qryReporteOrdenesCompMONTO_RETENER_ITBIS: TFloatField;
    qryReporteOrdenesCompIDTIPO_COMPRA: TIntegerField;
    qryReporteOrdenesCompSERIE: TFloatField;
    qryReporteOrdenesCompCOD_SERV_PROD: TIntegerField;
    qryReporteOrdenesCompDEPARTAMENTO: TIntegerField;
    qryReporteOrdenesCompOBSERVACION1: TIBStringField;
    qryReporteOrdenesCompCANTIDAD: TFloatField;
    qryReporteOrdenesCompVALOR: TFloatField;
    qryReporteOrdenesCompNUMERO_DOCUMENTO: TIntegerField;
    qryReporteOrdenesCompNUMERO_FACTURA: TIntegerField;
    qryReporteOrdenesCompCOD_CTA_CONCEPTO: TIntegerField;
    qryReporteOrdenesCompTIPOSERVICIO: TIntegerField;
    qryReporteOrdenesCompSUBTIPOSERV: TIntegerField;
    qryReporteOrdenesCompNO_SERIE_RES: TIntegerField;
    qryReporteOrdenesCompCODIGO_CONDUCTOR: TIntegerField;
    qryReporteOrdenesCompSERIE_CDC: TIntegerField;
    qryReporteOrdenesCompCODIGO_SERVCOSTO: TIntegerField;
    qryReporteOrdenesCompNUMEROOLD: TIntegerField;
    qryReporteOrdenesCompPRECIO: TFloatField;
    qryReporteOrdenesCompITBI_DET: TFloatField;
    qryReporteOrdenesCompPORC_DESC_DET: TFloatField;
    qryReporteOrdenesCompMONTO_DESCUENTO: TFloatField;
    qryReporteOrdenesCompCANT_OFERTA: TIntegerField;
    qryReporteOrdenesCompIDUNIDAD: TIntegerField;
    qryReporteOrdenesCompCOD_USUARIO_RECIBE: TIntegerField;
    qryReporteOrdenesCompCOD_USUARIO_CREA: TIntegerField;
    qryReporteOrdenesCompCODIGO_EMPLEADO: TIntegerField;
    qryReporteOrdenesCompFECHA_RECIBIDA: TDateTimeField;
    qryReporteOrdenesCompCANTORDEN: TFloatField;
    qryReporteOrdenesCompDESCPRODUCTO: TIBStringField;
    qryDatosRepVentaDiariaMONTO_DESC_ITEM: TFloatField;
    qryDatosRepVentaDiariaResMONTO_DESC_ITEM: TFloatField;
    qryViewVentasMastMONTOPREPAGADO: TFloatField;
    qryReporteOrdenesCompFECHA_DEBERECIBIR: TDateTimeField;
    qryDatosRepVentaDiariaVALOR_VENTA_DET: TFloatField;
    qryDatosVentaDet_Pendiente: TIBQuery;
    qryDatosRepVentaDiariaMONTO_TOTAL_ITBIS: TFloatField;
    qryDatosRepVentaDiariaPROPINA: TFloatField;
    qryDatosRepVentaDiariaPROPINALEGAL: TFloatField;
    qryDatosRepVentaDiariaMONTOCOBERTURA: TFloatField;
    qryDatosRepVentaDiariaVENTAARS: TSmallintField;
    qryDatosRepVentaDiariaSERIE_VTA: TIntegerField;
    qryDatosRepVentaDiariaMONTO_PAGADO_DIST: TFloatField;
    qryDatosRepVentaDiariaSubDetail: TIBQuery;
    qryDatosRepVentaDiariaSubDetailMONEDA: TIBStringField;
    qryDatosRepVentaDiariaSubDetailDEBITO: TFloatField;
    qryDatosRepVentaDiariaSubDetailCREDITO: TFloatField;
    qryDatosRepVentaDiariaSubDetailTIPO_DOCUMENTO: TIBStringField;
    qryDatosRepVentaDiariaSubDetailNUMERO_TRN: TIntegerField;
    qryDatosRepVentaDiariaSubDetailMONTO_INICIAL: TFloatField;
    qryDatosRepVentaDiariaSubDetailMONTO_RECIBIDO: TFloatField;
    qryDatosRepVentaDiariaSubDetailMONTO_TOTAL_ITBIS: TFloatField;
    qryDatosRepVentaDiariaSubDetailPROPINA: TFloatField;
    qryDatosRepVentaDiariaSubDetailPROPINALEGAL: TFloatField;
    qryDatosRepVentaDiariaSubDetailMONTOCOBERTURA: TFloatField;
    qryDatosRepVentaDiariaSubDetailNUM_TRANSFERENCIA: TIntegerField;
    qryDatosRepVentaDiariaSubDetailMONTO_PAGADO_DIST: TFloatField;
    qryDatosRepVentaDiariaNew: TIBQuery;
    qryDatosRepVentaDiariaNewTEMP: TIBStringField;
    qryDatosRepVentaDiariaNewXSMS: TIBStringField;
    qryDatosRepVentaDiariaNewCODIGO_CLIENTE: TIntegerField;
    qryDatosRepVentaDiariaNewNOMBRE_FACTURAR: TIBStringField;
    qryDatosRepVentaDiariaNewNUMERO_DOCUMENTO: TIntegerField;
    qryDatosRepVentaDiariaNewVALOR_DOCUMENTO: TFloatField;
    qryDatosRepVentaDiariaNewVALOR_VENTA_DET: TFloatField;
    qryDatosRepVentaDiariaNewTIPO_TRANF: TSmallintField;
    qryDatosRepVentaDiariaNewMONEDA: TIBStringField;
    qryDatosRepVentaDiariaNewFECHA: TDateTimeField;
    qryDatosRepVentaDiariaNewTIPO_DOC: TIntegerField;
    qryDatosRepVentaDiariaNewSTATUS: TIBStringField;
    qryDatosRepVentaDiariaNewDEBITO: TFloatField;
    qryDatosRepVentaDiariaNewCREDITO: TFloatField;
    qryDatosRepVentaDiariaNewTIPO_DOCUMENTO: TIBStringField;
    qryDatosRepVentaDiariaNewNOMBRE_VENDEDOR: TIBStringField;
    qryDatosRepVentaDiariaNewCODIGO_EMPLEADO: TIntegerField;
    qryDatosRepVentaDiariaNewCODIGO_PRODUCTO: TIBStringField;
    qryDatosRepVentaDiariaNewPRECIO_PRODUCTO: TIntegerField;
    qryDatosRepVentaDiariaNewDESCUENTO: TFloatField;
    qryDatosRepVentaDiariaNewMONTO_DESC_ITEM: TFloatField;
    qryDatosRepVentaDiariaNewDESCRIPCION_PRODUCTO: TIBStringField;
    qryDatosRepVentaDiariaNewCANTIDAD: TFloatField;
    qryDatosRepVentaDiariaNewDESC_PRODUCTO: TIBStringField;
    qryDatosRepVentaDiariaNewDESC_TIPO_INVENTARIO: TIBStringField;
    qryDatosRepVentaDiariaNewXTIPO_INVENTARIO: TIntegerField;
    qryDatosRepVentaDiariaNewSTATUS_DET: TIBStringField;
    qryDatosRepVentaDiariaNewNUMERO_TRN: TIntegerField;
    qryDatosRepVentaDiariaNewMONTO_INICIAL: TFloatField;
    qryDatosRepVentaDiariaNewNUMERO_FACTURA: TIntegerField;
    qryDatosRepVentaDiariaNewMONTO_RECIBIDO: TFloatField;
    qryDatosRepVentaDiariaNewMONTO_TOTAL_ITBIS: TFloatField;
    qryDatosRepVentaDiariaNewPROPINA: TFloatField;
    qryDatosRepVentaDiariaNewPROPINALEGAL: TFloatField;
    qryDatosRepVentaDiariaNewMONTOCOBERTURA: TFloatField;
    qryDatosRepVentaDiariaNewVENTAARS: TSmallintField;
    qryDatosRepVentaDiariaNewESCXC: TSmallintField;
    qryDatosRepVentaDiariaNewSERIE_VTA: TIntegerField;
    qryDatosRepVentaDiariaNewNUM_TRANSFERENCIA: TIntegerField;
    qryDatosRepVentaDiariaNewMONTO_PAGADO_DIST: TFloatField;
    qryDatosRepVentaDiariaResMONTO_VENTA: TFloatField;
    qryFPagoTicketV2: TIBQuery;
    QryRepVtaMaster: TIBQuery;
    QryRepVtaMasterNUMERO_TRN: TIntegerField;
    QryRepVtaMasterSUM: TFloatField;
    QryRepVtaMasterCANTFPAGO: TIntegerField;
    qryFPagoTicketV2TIPO_PAGO: TSmallintField;
    qryFPagoTicketV2MONTO_PAGADO: TFloatField;
    qryFPagoTicketV2MONTO_CAMBIO: TFloatField;
    qryFPagoTicketV2MONTOPAGADODET: TFloatField;
    qryFPagoTicketV2NUMERO: TIntegerField;
    qryFPagoTicketV2FPAGO: TSmallintField;
    qryFPagoTicketV2FPAGODGII: TSmallintField;
    qryFPagoTicketV2FORMA_PAGO: TSmallintField;
    qryFPagoTicketV2DESCRIPCION: TIBStringField;
    qryFPagoTicketV2DESCRIPCIONDGII: TIBStringField;
    qryMargenBrutoDet: TIBQuery;
    procedure qryDatosRepVxCajasCalcFields(DataSet: TDataSet);
    procedure qryDatosRepVxCajasResumenCalcFields(DataSet: TDataSet);
    procedure qryDatosRepDifVendedoresCalcFields(DataSet: TDataSet);
    procedure qryDatosFaltanteCalcFields(DataSet: TDataSet);
    procedure qryDatosRepVentaDiariaFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure qryDatosSaldoAntiguedadCxcAfterOpen(DataSet: TDataSet);
    procedure rxSaldoAntCxcFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure qryRepComisionVPlanAfterScroll(DataSet: TDataSet);
    procedure qryRepComisionVPlanCalcFields(DataSet: TDataSet);
    procedure qryRepInventarioProdMasBclRutaAfterScroll(DataSet: TDataSet);
    procedure qryDatosSaldoAntiguedadCxcFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure qryMargenBrutoCalcFields(DataSet: TDataSet);
    procedure qryViewVentasMastAfterScroll(DataSet: TDataSet);
    procedure qryRelacionFacturasAfterScroll(DataSet: TDataSet);
    procedure qryRepEstudianteRepMastAfterScroll(DataSet: TDataSet);
    procedure qryViewVentasMastCalcFields(DataSet: TDataSet);
    procedure qryRepDatosCteVehCalcFields(DataSet: TDataSet);
    procedure qryDatosRepClientesFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure qryDatosVentaMasterAfterScroll(DataSet: TDataSet);
    procedure qryDatosRepTranscxcIFiscalAfterScroll(DataSet: TDataSet);
    procedure qryDatosReimpDocFiscalAfterScroll(DataSet: TDataSet);
    procedure qryDatosReimpDocFiscalCalcFields(DataSet: TDataSet);
    procedure qryDatosReimpDocFiscalOKIAfterScroll(DataSet: TDataSet);
    procedure qryDatosReimpDocFiscalOKICalcFields(DataSet: TDataSet);
    procedure qryDatosRepClientesCumpleFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure qryRepServTallerMAfterScroll(DataSet: TDataSet);
    procedure qryRepServXTipoMasterAfterScroll(DataSet: TDataSet);
    procedure qryRepOrdenTrabajoFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure qryRepDepositosAfterScroll(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure qryRepTransOpeDiariaFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure qryMargenBrutoFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure qryDatosRepVentaDiariaSubDetailFilterRecord(
      DataSet: TDataSet; var Accept: Boolean);
    procedure qryDatosRepVentaDiariaNewFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure qryFPagoTicketV2FilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
  private
    { Private declarations }
    Procedure ProcOrganizaDataSaldoAntCxc;

  public
    mesCumple : Integer;
    mesCumpleIni, mesCumpleFin : Integer;
    rango : boolean;
    tipRptCte : smallint;

    xCantDiasSinVenta : Integer;
    filtrarTipoInv : Integer;
    filtrarNUMERO_TRN : Integer;
    _FieldNTRep, DescTipoProd   : String;
    filtrarRepIngEfe,
    filtrarRepIngCxc,
    filtrarRepIngTodo : Integer;
    filtrarxCodCte : Integer;
    SaldoResumen : Boolean;
    codEmp, codRuta,codCiudad : Integer;
    generandoRepSeries : Boolean;
    filtraPlanFunerario: String;
    esReimpreso : Boolean;
    _TipoB, orden_trab_num : Integer;
    cteFName: String;
    cteFValor : String;
    _FCodProv, _FPago : Smallint;
    strnumerotrn : string;
  end;

var
  dmReportes: TdmReportes;

implementation

uses UDatModConectar, UGlobal;

{$R *.dfm}

procedure TdmReportes.qryDatosRepVxCajasCalcFields(DataSet: TDataSet);
begin
  qryDatosRepVxCajasMonto.Value:= qryDatosRepVxCajasCANTIDAD.Value * qryDatosRepVxCajasPRECIO.Value;
end;

procedure TdmReportes.qryDatosRepVxCajasResumenCalcFields(
  DataSet: TDataSet);
begin
  qryDatosRepVxCajasResumenMonto.Value:= qryDatosRepVxCajasResumenCANTIDAD.Value * qryDatosRepVxCajasResumenPRECIO.Value;
end;

procedure TdmReportes.qryDatosRepDifVendedoresCalcFields(
  DataSet: TDataSet);
begin
  qryDatosRepDifVendedoresMontoReportado.Value:=
  qryDatosRepDifVendedoresEFECTIVO.Value +
  qryDatosRepDifVendedoresCHEQUE.Value +
  qryDatosRepDifVendedoresCREDITO_DIRECTO.Value +
  qryDatosRepDifVendedoresCREDITO_NORMAL.Value +
  qryDatosRepDifVendedoresPROMOCION.Value + qryDatosRepDifVendedoresAJUSTE.Value;

  qryDatosRepDifVendedoresDiferencia.Value:=
  qryDatosRepDifVendedoresMontoReportado.Value - qryDatosRepDifVendedoresMONTO_VENTA.Value;

end;

procedure TdmReportes.qryDatosFaltanteCalcFields(DataSet: TDataSet);
begin
  qryDatosFaltanteMontoReportado.Value:=
  qryDatosFaltanteEFECTIVO.Value +
  qryDatosFaltanteCHEQUE.Value +
  qryDatosFaltanteCREDITO_DIRECTO.Value +
  qryDatosFaltanteCREDITO_NORMAL.Value +
  qryDatosFaltantePROMOCION.Value +
  qryDatosFaltanteAJUSTE.Value;

  qryDatosFaltanteDiferencia.Value:=
  qryDatosFaltanteMontoReportado.Value - qryDatosFaltanteMONTO_VENTA.Value;

end;

procedure TdmReportes.qryDatosRepVentaDiariaFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);

begin  //repIngTodo
  //repIngEfe
  //repIngCxc
  if repIngEfe then
  begin
    Accept := DataSet['TIPO_DOC'] = filtrarRepIngEfe
  end else
  if repIngCxc then
  begin
    Accept := DataSet['EsCxc'] = 1
  end else
  if repIngTodo then
  begin
    Accept := DataSet['TIPO_DOC'] = filtrarRepIngTodo
  end else
  if (filtrarTipoInv > 0) then
  Accept := DataSet['xTipo_Inventario'] = filtrarTipoInv
end;

procedure TdmReportes.ProcOrganizaDataSaldoAntCxc;
    procedure insertar;
    begin
      rxSaldoAntCxc.Insert;
      rxSaldoAntCxccodigo.Value:= qryDatosSaldoAntiguedadCxccodigo_cte.Value;
      rxSaldoAntCxcFecha.Value := qryDatosSaldoAntiguedadCxcFECHA.Value;
      rxSaldoAntCxcNombreCliente.Value:= qryDatosSaldoAntiguedadCxcNombre_cte.value;
      rxSaldoAntCxcNumFact.Value := qryDatosSaldoAntiguedadCxcNUMERO.AsInteger;
      rxSaldoAntCxcrnc.Value := qryDatosSaldoAntiguedadCxcRNC_NUMERO.Value;
      case qryDatosSaldoAntiguedadCxcDIASENATRASO.AsInteger of
      0..30 : begin
                rxSaldoAntCxcd30.Value:= qryDatosSaldoAntiguedadCxcMONTO_PENDIENTE.Value;
              end;
      31..60 :begin
                rxSaldoAntCxcd60.Value:= qryDatosSaldoAntiguedadCxcMONTO_PENDIENTE.Value;
              end;
      61..90 :begin
                rxSaldoAntCxcd60.Value:= qryDatosSaldoAntiguedadCxcMONTO_PENDIENTE.Value;
              end;
      else
      begin
        rxSaldoAntCxcd120.Value:= qryDatosSaldoAntiguedadCxcMONTO_PENDIENTE.Value;
      end;
     end;//case
    end;
begin
  qryDatosSaldoAntiguedadCxc.First;
  While Not qryDatosSaldoAntiguedadCxc.Eof do
  begin
    if SaldoResumen then
    begin
      if rxSaldoAntCxc.Locate('codigo',qryDatosSaldoAntiguedadCxccodigo_cte.Value,[]) then
      begin
        rxSaldoAntCxc.Edit;
        case qryDatosSaldoAntiguedadCxcDIASENATRASO.AsInteger of
        0..30 : begin
                  rxSaldoAntCxcd30.Value:= rxSaldoAntCxcd30.Value +
                  qryDatosSaldoAntiguedadCxcMONTO_PENDIENTE.Value;
                end;
        31..60 :begin
                  rxSaldoAntCxcd60.Value:=rxSaldoAntCxcd60.Value +
                  qryDatosSaldoAntiguedadCxcMONTO_PENDIENTE.Value;
                end;
        61..90 :begin
                  rxSaldoAntCxcd60.Value:=rxSaldoAntCxcd60.Value +
                  qryDatosSaldoAntiguedadCxcMONTO_PENDIENTE.Value;
                end;
        else
        begin
          rxSaldoAntCxcd120.Value:=rxSaldoAntCxcd120.Value + 
          qryDatosSaldoAntiguedadCxcMONTO_PENDIENTE.Value;
        end;
        end;//case
      end else
      begin
        insertar;
      end;//locase
    end else
    begin
      Insertar;
    end;//else
    rxSaldoAntCxc.Post;
    qryDatosSaldoAntiguedadCxc.Next;
  end;
  if (filtrarxCodCte > 0) then
  rxSaldoAntCxc.Filtered:=True;
end;

procedure TdmReportes.qryDatosSaldoAntiguedadCxcAfterOpen(
  DataSet: TDataSet);
begin
  rxSaldoAntCxc.Close;
  rxSaldoAntCxc.Open;
  ProcOrganizaDataSaldoAntCxc;
end;

procedure TdmReportes.rxSaldoAntCxcFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept := DataSet['CODIGO'] = filtrarxCodCte;
end;

procedure TdmReportes.qryRepComisionVPlanAfterScroll(DataSet: TDataSet);
begin
  qryComisionVPlan.close;
  qryComisionVPlan.Params[0].Value:= qryRepComisionVPlanID_TIPO_PLAN.Value;
  qryComisionVPlan.Params[1].Value:= ExtraerFecha(qryRepComisionVPlanFECHA_APERTURA.Value);
  qryComisionVPlan.Open;
end;

procedure TdmReportes.qryRepComisionVPlanCalcFields(DataSet: TDataSet);
begin
  qryRepComisionVPlanPorcCom.Value:= qryComisionVPlanPORC_COMISION.Value / 100;
  qryRepComisionVPlanPrecioTarifa.Value := qryComisionVPlanPRECIO.Value;
end;

procedure TdmReportes.qryRepInventarioProdMasBclRutaAfterScroll(
  DataSet: TDataSet);
begin
  if generandoRepSeries then
  begin
    qryInventarioSerie.Close;
    qryinventarioserie.Params[0].Value := qryRepInventarioProdMasBclRutaCODIGO.Value;
    qryinventarioserie.Open;
  end;
end;

procedure TdmReportes.qryDatosSaldoAntiguedadCxcFilterRecord(
  DataSet: TDataSet; var Accept: Boolean);
begin
  if Length(filtraPlanFunerario) > 0 then
  Accept :=   UpperCase(DataSet['DESCRIPCION']) = filtraPlanFunerario;
end;


procedure TdmReportes.qryViewVentasMastAfterScroll(DataSet: TDataSet);
begin
  qryViewVentasDet.Close;
  qryViewVentasDet.Params[0].Value:= qryViewVentasMastNUMERO.Value;
  qryViewVentasDet.Open;
  qryCantVendedoresSam.Close;
  qryCantVendedoresSam.Params[0].Value:= qryViewVentasMastNUMERO.Value;
  qryCantVendedoresSam.Open;
end;

procedure TdmReportes.qryRelacionFacturasAfterScroll(DataSet: TDataSet);
begin
  qryRelacionFacturasDet.Close;
  qryRelacionFacturasDet.Params[0].Value := qryRelacionFacturasNUMERO.Value;
  qryRelacionFacturasDet.Open;
end;

procedure TdmReportes.qryRepEstudianteRepMastAfterScroll(
  DataSet: TDataSet);
begin
  qryRepEstudianteRep.Close;
  qryRepEstudianteRep.Params[0].Value:= qryRepEstudianteRepMastCODIGO_CTE.Value;
  qryRepEstudianteRep.Open;
end;

procedure TdmReportes.qryViewVentasMastCalcFields(DataSet: TDataSet);
begin
  if qryViewVentasMastNUMERO_FACTURA.IsNull then
  qryViewVentasMastNumeroDocCldo.Value:= qryViewVentasMastNUMERO_DOC_PAGO.Value
  else
  qryViewVentasMastNumeroDocCldo.Value:=qryViewVentasMastNUMERO_FACTURA.AsString;

  qryPorcRetencion.Close;
  qryPorcRetencion.Params[0].Value:= GlbFechaTrnDiaria;
  qryPorcRetencion.Params[1].Value:= qryViewVentasMastidretencion.Value;
  qryPorcRetencion.Open;
  qryViewVentasMastMontoRetencion.Value :=
  dmReportes.qryViewVentasMastVALOR_TOTAL_DET.Value *
  (qryPorcRetencionPORCIENTO.Value/100);

end;

procedure TdmReportes.qryRepDatosCteVehCalcFields(DataSet: TDataSet);
begin
{
LEY
FULL
SEMI-FULL
OTRO
}
  case qryRepDatosCteVehTIPO_SEGURO.Value of
  1 : qryRepDatosCteVehDescTipoSEguro.Value := 'LEY';
  2 : qryRepDatosCteVehDescTipoSEguro.Value := 'FULL';
  3 : qryRepDatosCteVehDescTipoSEguro.Value := 'SEMI-FULL';
  4 : qryRepDatosCteVehDescTipoSEguro.Value := 'OTRO';
  end;

end;

procedure TdmReportes.qryDatosRepClientesFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  //cteFName: String; cteFValor : String;
  if (cteFName <> '') then
  begin
    if (cteFName= 'codZona') then
    Accept:= DataSet[cteFName] = StrToInt(cteFValor)
    else
    Accept:= DataSet[cteFName] = chr(39)+cteFValor+chr(39);
    Exit;
  end;
  if xCantDiasSinVenta > 0 then
  begin
    Accept:= DataSet['CANTDIASSINVTA'] >= GlbDiasSinVenta;
  end else
  if tipRptCte = 1 then
  begin
    if codEmp > 0 then
    Accept:= DataSet['COD_VENDEDOR'] = codEmp
    else
    Accept:= DataSet['COD_VENDEDOR'] <= 0;
  end else
  if tipRptCte = 2 then
  begin
    Accept:= DataSet['COD_Ciudad'] = codCiudad;
  end else
  if tipRptCte = 3 then
  begin
    Accept:= DataSet['RUTA'] = codRuta;
  end
end;

procedure TdmReportes.qryDatosVentaMasterAfterScroll(DataSet: TDataSet);
begin
  qryDatosVentaDetalle.Close;
  qryDatosVentaDetalle.Params[0].Value:= qryDatosVentaMasterNUMERO.Value;
  qryDatosVentaDetalle.Open;
  qryTipoIFiscal.Close;
  qryTipoIFiscal.Params[0].Value := qryDatosVentaMasterTIPO_NCF.Value;
  qryTipoIFiscal.Open;

  qryTipoIFiscal.Locate('TIPO_NCF_IFISCAL', qryDatosVentaMasterTIPONCFIFISCAL.Value, []);

  qryBuscarNIF.Close;
  qryBuscarNIF.Params[0].Value:= qryDatosVentaMasterNUMERO.Value;
  qryBuscarNIF.Open;
end;

procedure TdmReportes.qryDatosRepTranscxcIFiscalAfterScroll(
  DataSet: TDataSet);
begin
  qryTipoIFiscal.Close;
  qryTipoIFiscal.Params[0].Value := qryDatosRepTranscxcIFiscalTIPO_NCF.Value;
  qryTipoIFiscal.Open;
  qryTipoIFiscal.RecordCount;
  if (qryDatosRepTranscxcIFiscalTIPO_NCF.Value = '15') then
  qryTipoIFiscal.Locate('TIPO_NCF_IFISCAL', '4', [])
  else
  begin
    if (qryDatosRepTranscxcIFiscalTIPO_NCF.Value = '02') then
    qryTipoIFiscal.Locate('TIPO_NCF_IFISCAL', '0', [])
    else
    if (qryDatosRepTranscxcIFiscalTIPO_NCF.Value = '02') then
    qryTipoIFiscal.Locate('TIPO_NCF_IFISCAL', '0', [])
    else
    if (qryDatosRepTranscxcIFiscalTIPO_NCF.Value = '01') then
    qryTipoIFiscal.Locate('TIPO_NCF_IFISCAL', '1', [])
    else
    if (qryDatosRepTranscxcIFiscalTIPO_NCF.Value = '03') then
    qryTipoIFiscal.Locate('TIPO_NCF_IFISCAL', '2', [])
    else
    if (qryDatosRepTranscxcIFiscalTIPO_NCF.Value = '04') then
    qryTipoIFiscal.Locate('TIPO_NCF_IFISCAL', '3', [])
    else
    if (qryDatosRepTranscxcIFiscalTIPO_NCF.Value = '05') then
    qryTipoIFiscal.Locate('TIPO_NCF_IFISCAL', '1', []);
  end;
  qryBuscarNIF.Close;
  qryBuscarNIF.Params[0].Value:= qryDatosRepTranscxcIFiscalSERIE.Value;
  qryBuscarNIF.Open;qryBuscarNIF.RecordCount;
end;

procedure TdmReportes.qryDatosReimpDocFiscalAfterScroll(DataSet: TDataSet);
begin
  qryClientes.Close;
  //qryClientes.Params[0].Value := qryDatosReimpDocFiscalCODIGO_CTE.Value;
  qryClientes.Open;
  qryClientes.Locate('CODIGO_CTE', qryDatosReimpDocFiscalCODIGO_CTE.Value, []);

  qryDatosReimpdocFiscalDet.Close;
  qryDatosReimpdocFiscalDet.Params[0].Value:= qryDatosReimpDocFiscalNUMERO.Value;
  qryDatosReimpdocFiscalDet.Open;
end;

procedure TdmReportes.qryDatosReimpDocFiscalCalcFields(DataSet: TDataSet);
begin
  if (qryClientes.RecordCount > 0) then
  begin
    qryDatosReimpDocFiscalNombrecliente.Value:= qryClientesNOMBRE_FACTURAR.Value;
    qryDatosReimpDocFiscalRNC.Value := qryClientesRNC_NUMERO.Value;
  end;
end;

procedure TdmReportes.qryDatosReimpDocFiscalOKIAfterScroll(
  DataSet: TDataSet);
begin
  qryClientes.Close;
  qryClientes.Params[0].Value := qryDatosReimpDocFiscalOKICODIGO_CTE.Value;
  qryClientes.Open;

  qryDatosReimpdocFiscalDet.Close;
  qryDatosReimpdocFiscalDet.Params[0].Value:=qryDatosReimpDocFiscalOKINUMERO.Value;
  qryDatosReimpdocFiscalDet.Open;
end;

procedure TdmReportes.qryDatosReimpDocFiscalOKICalcFields(
  DataSet: TDataSet);
begin
  if (qryClientes.RecordCount > 0) then
  begin
    qryDatosReimpDocFiscalOKINombrecliente.Value:= qryClientesNOMBRE_FACTURAR.Value;
    qryDatosReimpDocFiscalOKIRNC.Value := qryClientesRNC_NUMERO.Value;
  end;
end;

procedure TdmReportes.qryDatosRepClientesCumpleFilterRecord(
  DataSet: TDataSet; var Accept: Boolean);
begin
  if not rango then
  Accept:= StrToInt(FormatDateTime('mm', DataSet['FECHA_NACIMIENTO'])) = mesCumple
  else
  Accept:= (StrToInt(FormatDateTime('mm', DataSet['FECHA_NACIMIENTO'])) >= mesCumpleIni)
  And (StrToInt(FormatDateTime('mm', DataSet['FECHA_NACIMIENTO'])) <= mesCumpleFin);
end;

procedure TdmReportes.qryRepServTallerMAfterScroll(DataSet: TDataSet);
begin
  dmReportes.qryRepServTallerDet.Close;
  dmReportes.qryRepServTallerDet.Params[2].Value:= dmReportes.qryRepServTallerMCODIGO_EMP.Value;
  dmReportes.qryRepServTallerDet.Open;
end;

procedure TdmReportes.qryRepServXTipoMasterAfterScroll(DataSet: TDataSet);
begin
 { dmReportes.qryRepServXTipoDet.Close;
  dmReportes.qryRepServXTipoDet.Params[0].Value:= 0;//qryRepServXTipoM .Value;
  dmReportes.qryRepServXTipoMaster.Open;}
end;

procedure TdmReportes.qryRepOrdenTrabajoFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept := DataSet['NUM_ORDEN'] = orden_trab_num;
end;

procedure TdmReportes.qryRepDepositosAfterScroll(DataSet: TDataSet);
begin
  qryRepDepositosDet.close;
  qryRepDepositosDet.Params[0].Value:= qryRepDepositosNumero.Value;
  qryRepDepositosDet.open;
end;

procedure TdmReportes.DataModuleCreate(Sender: TObject);
begin
  dmreportes.xCantDiasSinVenta:=-1;
end;

procedure TdmReportes.qryRepTransOpeDiariaFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  if (_FPago > 0) and (_FCodProv > 0) then
  Accept:= (Dataset['FPAGO'] = _FPago) and (Dataset['COD_PROVEEDOR'] = _FCodProv)
  ELSE
  if (_FPago > 0) then
  Accept:= Dataset['FPAGO'] = _FPago
  ELSE
  if (_FCodProv > 0) then
  Accept:= Dataset['COD_PROVEEDOR'] = _FCodProv;
end;

procedure TdmReportes.qryMargenBrutoFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  if (filtrarTipoInv > 0) and (dmreportes._TipoB = 3) then
  Accept:= DataSet['TIPO'] = filtrarTipoInv
  else
  begin
    case dmreportes._TipoB of
    0: begin
         Accept:= DataSet[_FieldNTRep] = 0;
    end;
    1: begin
         Accept:= DataSet[_FieldNTRep] < 0;
    end;
    2: begin
         Accept:= DataSet[_FieldNTRep] > 0;
    end;
  end;
  end;
end;

procedure TdmReportes.qryMargenBrutoCalcFields(DataSet: TDataSet);
begin
  if (dmReportes.qryMargenBrutoCOSTONETO.Value > 0) then
  dmreportes.qryMargenBrutoBENEFICIO.Value:=
  dmreportes.qryMargenBrutoMONTO_VENTA_NETO.Value - dmReportes.qryMargenBrutoCOSTONETO.Value
  else
  dmreportes.qryMargenBrutoBENEFICIO.Value:= 0;
end;

procedure TdmReportes.qryDatosRepVentaDiariaSubDetailFilterRecord(
  DataSet: TDataSet; var Accept: Boolean);
begin
  Accept := DataSet['NUMERO_TRN'] = filtrarNUMERO_TRN;
end;

procedure TdmReportes.qryDatosRepVentaDiariaNewFilterRecord(
  DataSet: TDataSet; var Accept: Boolean);
begin
  if repIngEfe then
  begin
    Accept := DataSet['TIPO_DOC'] = filtrarRepIngEfe
  end else
  if repIngCxc then
  begin
    Accept := DataSet['TIPO_DOC'] = filtrarRepIngCxc
  end else
  if repIngTodo then
  begin
    Accept := DataSet['TIPO_DOC'] = filtrarRepIngTodo
  end else
  if (filtrarTipoInv > 0) then
  Accept := DataSet['xTipo_Inventario'] = filtrarTipoInv
end;

procedure TdmReportes.qryFPagoTicketV2FilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept:= DataSet['Numero']= strnumerotrn;
end;

end.
