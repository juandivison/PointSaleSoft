unit UDatModCuadrexRuta;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBQuery, IBSQL, IBTable,
  IBStoredProc;

type
  TdmCuadrexRuta = class(TDataModule)
    tblBalanceDespacho: TIBDataSet;
    tblBalanceDespachoCODIGO_EMP: TIntegerField;
    tblBalanceDespachoCODIGO_RUTA: TIntegerField;
    tblBalanceDespachoCODIGO_PRODUCTO: TIntegerField;
    tblBalanceDespachoBALANCE_ACT: TFloatField;
    tblBalanceDespachoBALANCE_ANT: TFloatField;
    tblBalanceDespachoDEBITO_MES: TFloatField;
    tblBalanceDespachoCREDITO_MES: TFloatField;
    tblBalanceDespachoDEBITO_ACM: TFloatField;
    tblBalanceDespachoCREDITO_ACM: TFloatField;
    tblBalanceDespachoFECHA_BCE: TDateTimeField;
    tblBalanceDespachoFECHA_ULT_PAGO: TDateTimeField;
    tblBalanceDespachoSTATUS_BCE: TIBStringField;
    tblBalanceDespachoFECHA_IN: TDateTimeField;
    tblBalanceDespachoIN_POR: TIBStringField;
    tblBalanceDespachoFECHA_MOD: TDateTimeField;
    tblBalanceDespachoMOD_POR: TIBStringField;
    qryDatosEmpleado: TIBQuery;
    qryDatosEmpleadoCODIGO_EMP: TIntegerField;
    qryDatosEmpleadoCODIGO_PRODUCTO: TIntegerField;
    qryDatosEmpleadoCODIGO_RUTA: TIntegerField;
    qryDatosEmpleadoNOMBRECOMPLETO: TIBStringField;
    qryBlcRuta: TIBQuery;
    qryBlcRutaCODIGO_TEXTO: TIBStringField;
    qryBlcRutaBALANCE_ACT: TFloatField;
    qryBlcRutaDESCRIPCION: TIBStringField;
    qryBlcRutaPRECIO: TFloatField;
    qryBlcRutaVALOR: TFloatField;
    tblCuadreruta: TIBDataSet;
    qryTotalCajas: TIBSQL;
    qryDetalleCuadreRuta: TIBDataSet;
    qryDetalleCuadreRutaRUTA: TIntegerField;
    qryDetalleCuadreRutaFECHA: TDateTimeField;
    qryDetalleCuadreRutaCODIGO_EMP: TIntegerField;
    qryDetalleCuadreRutaEFECTIVO: TFloatField;
    qryDetalleCuadreRutaCHEQUE: TFloatField;
    qryDetalleCuadreRutaCREDITO_DIRECTO: TFloatField;
    qryDetalleCuadreRutaCREDITO_NORMAL: TFloatField;
    qryDetalleCuadreRutaPROMOCION: TFloatField;
    qryDetalleCuadreRutaDEVOLUCION_POR_VENCIMIENTO: TFloatField;
    qryDetalleCuadreRutaTotal: TFloatField;
    tblCuadrerutaRUTA: TIntegerField;
    tblCuadrerutaFECHA: TDateTimeField;
    tblCuadrerutaCODIGO_EMP: TIntegerField;
    tblCuadrerutaFORMAPAGO: TSmallintField;
    tblCuadrerutaNOMBRE_VENDEDOR: TIBStringField;
    tblCuadrerutaCANTSALIDA: TFloatField;
    tblCuadrerutaCANTREGRESO: TFloatField;
    tblCuadrerutaRECARGA: TFloatField;
    tblCuadrerutaCANTIDAD: TFloatField;
    tblCuadrerutaPRECIO: TFloatField;
    tblCuadrerutaMONTO: TFloatField;
    tblCuadrerutaDESCUENTO: TFloatField;
    tblCuadrerutaITBI: TFloatField;
    tblCuadrerutaNUMERODOC: TIBStringField;
    tblCuadrerutaDESCRIPCION: TIBStringField;
    tblCuadrerutaVALORTOTAL: TFloatField;
    tblCuadrerutaCODIGOCLIENTE: TIntegerField;
    tblCuadrerutaORIGEN: TSmallintField;
    tblCuadrerutaDEVOLUCION_POR_VENCIMIENTO: TFloatField;
    IBDataSet1: TIBDataSet;
    qryCargarDatosCuadreRuta: TIBQuery;
    tblBalanceDespachoCODIGO_TEXTO: TIBStringField;
    tblBalanceDespachoDESCRIPCION: TIBStringField;
    tblBalanceDespachoPRECIO: TFloatField;
    qryDatosRepBlcDespacho: TIBQuery;
    qryCargarDatosCuadreRutaBALANCE_ACT: TFloatField;
    qryCargarDatosCuadreRutaCODIGO_PROD_INV: TIntegerField;
    qryCargarDatosCuadreRutaDESCRIPCION: TIBStringField;
    qryCargarDatosCuadreRutaCODIGO_EMP: TIntegerField;
    qryCargarDatosCuadreRutaPRECIO: TFloatField;
    qryCargarDatosCuadreRutaNOMBREEMPLEADO: TIBStringField;
    qryDetalleCuadreRutaMONTO_VENTA: TFloatField;
    qryDetalleCuadreRutaAJUSTE: TFloatField;
    qryDetalleCuadreRutaCOMENTARIO: TMemoField;
    qryDetalleCuadreRutaDIETA: TFloatField;
    qryDetalleCuadreRutaCOMBUSTIBLE: TFloatField;
    qryDetalleCuadreRutaREP_CAMION: TFloatField;
    tblPromociones: TIBDataSet;
    tblPromocionesRUTA: TIntegerField;
    tblPromocionesFECHA: TDateTimeField;
    tblPromocionesCODIGO_PROD: TIBStringField;
    tblPromocionesCODIGO_CTE: TIntegerField;
    tblPromocionesCANTIDAD: TFloatField;
    tblPromocionesCODIGO_USUARIO: TIntegerField;
    tblPromocionesFECHA_IN: TDateTimeField;
    tblPromocionesSTATUS: TIBStringField;
    tblPromocionesMonto: TFloatField;
    qryInventario: TIBQuery;
    qryInventarioDESCRIPCION: TIBStringField;
    qryInventarioPRECIO: TFloatField;
    qryInventarioPAGA_ITBI: TSmallintField;
    qryInventarioDESC_TIPOINV: TIBStringField;
    qryInventarioTIPO: TIntegerField;
    qryInventarioPORC_DESCUENTO: TFloatField;
    qryInventarioCODIGO: TIntegerField;
    tblPromocionesPrecio: TFloatField;
    tblCliente: TIBTable;
    tblClienteCODIGO_CTE: TIntegerField;
    tblClienteNOMBRE_CTE: TIBStringField;
    tblClienteNOMBRE_ABREV: TIBStringField;
    tblClienteNOMBRE_FACTURAR: TIBStringField;
    tblCuadrerutaCODIGO_PROD: TIBStringField;
    qryInventarioCODIGO_TEXTO: TIBStringField;
    qryCargarDatosCuadreRutaCODIGO_TEXTO: TIBStringField;
    trnCajaTrn: TIBDataSet;
    trnCaja: TIBDataSet;
    trnCajaCOD_CAJA: TIntegerField;
    trnCajaFECHA: TDateTimeField;
    trnCajaBALANCE_ANT: TFloatField;
    trnCajaBALANCE_ACTUAL: TFloatField;
    trnCajaMONTO_ENTRADA_ACUM: TFloatField;
    trnCajaMONTO_RETIRADO_ACUM: TFloatField;
    trnCajaCOD_USUARIO: TIntegerField;
    trnCajaSTATUS: TIBStringField;
    trnCajaDESCRIPCION: TIBStringField;
    trnCajaTrnSERIE: TIntegerField;
    trnCajaTrnCOD_CAJA: TIntegerField;
    trnCajaTrnCODIGO_EMP: TIntegerField;
    trnCajaTrnFECHA: TDateTimeField;
    trnCajaTrnDESCRIPCION: TIBStringField;
    trnCajaTrnMONTO: TFloatField;
    trnCajaTrnCOD_USUARIO: TIntegerField;
    trnCajaTrnSTATUS: TIBStringField;
    trnCuadreDistVenta: TIBDataSet;
    qryCaja: TIBTable;
    qryCajaCOD_CAJA: TIntegerField;
    qryCajaFECHA: TDateTimeField;
    qryCajaDESCRIPCION: TIBStringField;
    qryCajaBALANCE_ANT: TFloatField;
    qryCajaBALANCE_ACTUAL: TFloatField;
    qryCajaMONTO_ENTRADA_ACUM: TFloatField;
    qryCajaMONTO_RETIRADO_ACUM: TFloatField;
    qryCajaCOD_USUARIO: TIntegerField;
    qryCajaSTATUS: TIBStringField;
    qryEmpleados: TIBQuery;
    ibProcUpdateCaja: TIBStoredProc;
    trnCajaTrnTIPO_TRN: TSmallintField;
    tblRuta: TIBTable;
    tblRutaCODIGO_TURNO: TIntegerField;
    tblRutaDESCRIPCION: TIBStringField;
    tblRutaHORAINI: TDateTimeField;
    tblRutaHORAFIN: TDateTimeField;
    tblRutaSTATUS: TIBStringField;
    sp_InsertCuadreCaja: TIBStoredProc;
    qryDatosCuadreCaja: TIBQuery;
    qryDatosCuadreCajaCOD_EMPLEADO: TIntegerField;
    qryDatosCuadreCajaFECHA: TDateTimeField;
    qryDatosCuadreCajaINGRESO_CXC: TFloatField;
    qryDatosCuadreCajaVENTA_A_CREDITO: TFloatField;
    qryDatosCuadreCajaVENTA_AL_CONTADO: TFloatField;
    qryDatosCuadreCajaMONTO_DEVOLUCION: TFloatField;
    qryDatosCuadreCajaMONTO_EN_CHEQUE: TFloatField;
    qryDatosCuadreCajaM2000: TIntegerField;
    qryDatosCuadreCajaM1000: TIntegerField;
    qryDatosCuadreCajaM500: TIntegerField;
    qryDatosCuadreCajaM200: TIntegerField;
    qryDatosCuadreCajaM100: TIntegerField;
    qryDatosCuadreCajaM50: TIntegerField;
    qryDatosCuadreCajaM25: TIntegerField;
    qryDatosCuadreCajaM20: TIntegerField;
    qryDatosCuadreCajaM10: TIntegerField;
    qryDatosCuadreCajaM5: TIntegerField;
    qryDatosCuadreCajaMONTO_MONEDAS: TFloatField;
    qryDatosCuadreCajaMONTO_AJUSTE: TFloatField;
    qryDatosCuadreCajaMONTO_DIETA: TFloatField;
    qryDatosCuadreCajaMONTO_RETIRO: TFloatField;
    qryDatosCuadreCajaCOD_USUARIO: TIntegerField;
    qryDatosCuadreCajaSTATUS: TIBStringField;
    qryDatosCuadreCajaFECHA_IN: TDateTimeField;
    qryDatosCuadreCajaFECHA_UPDATE: TDateTimeField;
    qryDatosCuadreCajaMONTO_EN_FONDO: TFloatField;
    tblDesembolsoCaja: TIBDataSet;
    tblDesembolsoCajaIDDESEMBOLSO: TIntegerField;
    tblDesembolsoCajaCOD_CAJA: TIntegerField;
    tblDesembolsoCajaFECHA: TDateTimeField;
    tblDesembolsoCajaCODIGO_EMP: TIntegerField;
    tblDesembolsoCajaMONTO: TFloatField;
    tblDesembolsoCajaDESCRIPCION: TIBStringField;
    tblDesembolsoCajaSTATUS: TIBStringField;
    tblDesembolsoCajaIN_POR: TIBStringField;
    tblDesembolsoCajaFECHA_IN: TDateTimeField;
    tblDesembolsoCajaFECHA_MOD: TDateTimeField;
    tblDesembolsoCajaMOD_POR: TIBStringField;
    dstblDesembolsoCaja: TDataSource;
    tblDesembolsoCajaCIA_KEY: TIntegerField;
    tblDesembolsoCajaCOD_OFICINA: TIntegerField;
    tblDesembolsoCajaMONEDA: TIBStringField;
    qryDatosCuadreCajaMONEDA: TIBStringField;
    qryDatosCuadreCajaINICIAL_FINANCIAMIENTO: TFloatField;
    qryDatosCuadreCajaMONTO_VISANET: TFloatField;
    qryDatosCuadreCajaMONTO_CARDNET: TFloatField;
    trnCuadreDistVentaCOD_EMPLEADO: TIntegerField;
    trnCuadreDistVentaFECHA: TDateTimeField;
    trnCuadreDistVentaMONEDA: TIBStringField;
    trnCuadreDistVentaINGRESO_CXC: TFloatField;
    trnCuadreDistVentaVENTA_A_CREDITO: TFloatField;
    trnCuadreDistVentaVENTA_AL_CONTADO: TFloatField;
    trnCuadreDistVentaMONTO_DEVOLUCION: TFloatField;
    trnCuadreDistVentaMONTO_EN_CHEQUE: TFloatField;
    trnCuadreDistVentaM2000: TIntegerField;
    trnCuadreDistVentaM1000: TIntegerField;
    trnCuadreDistVentaM500: TIntegerField;
    trnCuadreDistVentaM200: TIntegerField;
    trnCuadreDistVentaM100: TIntegerField;
    trnCuadreDistVentaM50: TIntegerField;
    trnCuadreDistVentaM25: TIntegerField;
    trnCuadreDistVentaM20: TIntegerField;
    trnCuadreDistVentaM10: TIntegerField;
    trnCuadreDistVentaM5: TIntegerField;
    trnCuadreDistVentaMONTO_MONEDAS: TFloatField;
    trnCuadreDistVentaMONTO_AJUSTE: TFloatField;
    trnCuadreDistVentaMONTO_DIETA: TFloatField;
    trnCuadreDistVentaMONTO_RETIRO: TFloatField;
    trnCuadreDistVentaCOD_USUARIO: TIntegerField;
    trnCuadreDistVentaSTATUS: TIBStringField;
    trnCuadreDistVentaFECHA_IN: TDateTimeField;
    trnCuadreDistVentaFECHA_UPDATE: TDateTimeField;
    trnCuadreDistVentaMONTO_EN_FONDO: TFloatField;
    trnCuadreDistVentaINICIAL_FINANCIAMIENTO: TFloatField;
    trnCuadreDistVentaMONTO_VISANET: TFloatField;
    trnCuadreDistVentaMONTO_CARDNET: TFloatField;
    qryDesembolso: TIBQuery;
    dsqryDesembolso: TDataSource;
    qryDesembolsoIDDESEMBOLSO: TIntegerField;
    qryDesembolsoCIA_KEY: TIntegerField;
    qryDesembolsoCOD_OFICINA: TIntegerField;
    qryDesembolsoCOD_CAJA: TIntegerField;
    qryDesembolsoFECHA: TDateTimeField;
    qryDesembolsoMONEDA: TIBStringField;
    qryDesembolsoCODIGO_EMP: TIntegerField;
    qryDesembolsoMONTO: TFloatField;
    qryDesembolsoDESCRIPCION: TIBStringField;
    qryDesembolsoSTATUS: TIBStringField;
    qryDesembolsoIN_POR: TIBStringField;
    qryDesembolsoFECHA_IN: TDateTimeField;
    qryDesembolsoFECHA_MOD: TDateTimeField;
    qryDesembolsoMOD_POR: TIBStringField;
    qryListadodeCuadres: TIBQuery;
    qryListadodeCuadresCOD_EMPLEADO: TIntegerField;
    qryListadodeCuadresFECHA: TDateTimeField;
    qryListadodeCuadresMONEDA: TIBStringField;
    qryListadodeCuadresINGRESO_CXC: TFloatField;
    qryListadodeCuadresVENTA_A_CREDITO: TFloatField;
    qryListadodeCuadresVENTA_AL_CONTADO: TFloatField;
    qryListadodeCuadresMONTO_DEVOLUCION: TFloatField;
    qryListadodeCuadresMONTO_EN_CHEQUE: TFloatField;
    qryListadodeCuadresM2000: TIntegerField;
    qryListadodeCuadresM1000: TIntegerField;
    qryListadodeCuadresM500: TIntegerField;
    qryListadodeCuadresM200: TIntegerField;
    qryListadodeCuadresM100: TIntegerField;
    qryListadodeCuadresM50: TIntegerField;
    qryListadodeCuadresM25: TIntegerField;
    qryListadodeCuadresM20: TIntegerField;
    qryListadodeCuadresM10: TIntegerField;
    qryListadodeCuadresM5: TIntegerField;
    qryListadodeCuadresMONTO_MONEDAS: TFloatField;
    qryListadodeCuadresMONTO_AJUSTE: TFloatField;
    qryListadodeCuadresMONTO_DIETA: TFloatField;
    qryListadodeCuadresMONTO_RETIRO: TFloatField;
    qryListadodeCuadresCOD_USUARIO: TIntegerField;
    qryListadodeCuadresSTATUS: TIBStringField;
    qryListadodeCuadresFECHA_IN: TDateTimeField;
    qryListadodeCuadresFECHA_UPDATE: TDateTimeField;
    qryListadodeCuadresMONTO_EN_FONDO: TFloatField;
    qryListadodeCuadresINICIAL_FINANCIAMIENTO: TFloatField;
    qryListadodeCuadresMONTO_VISANET: TFloatField;
    qryListadodeCuadresMONTO_CARDNET: TFloatField;
    ibsqlMaxFechaCuadre: TIBSQL;
    qryDatosCuadreCajaNOMBRECOMPLETO: TIBStringField;
    qryListadodeCuadresNOMBRECOMPLETO: TIBStringField;
    qryFechasConVentas: TIBQuery;
    qryFechasConVentasCODIGO_EMPLEADO: TIntegerField;
    qryFechasConVentasNOMBRECOMPLETO: TIBStringField;
    qryFechasConVentasFECHA: TDateTimeField;
    qryFechasConVentasTIPO_DOCUMENTO: TIBStringField;
    qryFechasConVentasTIPO_DOC: TIntegerField;
    qryFechasConVentasMONTO: TFloatField;
    qryFechasConVentasMONTO_RECIBIDO: TFloatField;
    qryFechasConVentasCANTVTA: TIntegerField;
    qryRepFactCuadre: TIBQuery;
    qryRepFactCuadreNUMERO: TIntegerField;
    qryRepFactCuadreFECHA: TDateTimeField;
    qryRepFactCuadreNUM_FACTURA: TIntegerField;
    qryRepFactCuadreCODIGO_CTE: TIntegerField;
    qryRepFactCuadreCLIENTE: TIBStringField;
    qryRepFactCuadreVALOR: TFloatField;
    qryRepFactCuadreITBIS: TFloatField;
    qryRepFactCuadreTOTAL: TFloatField;
    qryDatosCuadreCajaMONTOCREDITOARS: TFloatField;
    qryRepFactCuadreXCte: TIBQuery;
    qryRepFactCuadreXCteCODIGO_CTE: TIntegerField;
    qryRepFactCuadreXCteCLIENTE: TIBStringField;
    qryRepFactCuadreXCteFORMAPAGO: TIBStringField;
    qryRepFactCuadreXCteVALOR: TFloatField;
    qryRepFactCuadreXCteITBIS: TFloatField;
    qryRepFactCuadreXCteTOTAL: TFloatField;
    qryRepFactCuadreFORMAPAGO: TIBStringField;
    trnCuadreDistVentaMONTOCREDITOARS: TFloatField;
    trnCuadreDistVentaTRANSFERENCIA: TFloatField;
    qryDatosCuadreCajaTRANSFERENCIA: TFloatField;
    trnCuadreDistVentaTRANSFERENCIACXC: TFloatField;
    qryDatosCuadreCajaTRANSFERENCIACXC: TFloatField;
    trnCuadreDistVentaMONTO_AZUL: TFloatField;
    qryDatosCuadreCajaMONTO_AZUL: TFloatField;
    qryVtaResumen: TIBQuery;
    qryVtaResumenCODIGO_PROD: TIBStringField;
    qryVtaResumenFECHA: TDateTimeField;
    qryVtaResumenDESCRIPCION: TIBStringField;
    qryVtaResumenCANTIDAD: TFloatField;
    qryVtaResumenPRECIO: TFloatField;
    qryVtaResumenMONTO: TFloatField;
    qryVtaResumenITBIS: TFloatField;
    qryFechasConVentasMONTODESCUENTO: TFloatField;
    qryFechasConVentasITBIS: TFloatField;
    qryCargarDatosCuadreRutaCIA_KEY: TIntegerField;
    qryDatosCuadreCajaCIA_KEY: TIntegerField;
    Antes_qryFechasConVentas: TIBQuery;
    IntegerField1: TIntegerField;
    IBStringField1: TIBStringField;
    DateTimeField1: TDateTimeField;
    IBStringField2: TIBStringField;
    IntegerField2: TIntegerField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    IntegerField3: TIntegerField;
    qryFechasConVentasESCXC: TSmallintField;
    qryValidarPagos: TIBQuery;
    qryValidarPagosNOMBRECOMPLETO: TIBStringField;
    qryValidarPagosCODIGO_CTE: TIntegerField;
    qryValidarPagosNUMERO: TIntegerField;
    qryValidarPagosVALOR_TOTAL_DET: TFloatField;
    qryValidarPagosMONTO_BRUTO: TFloatField;
    qryValidarPagosMONTO_PAGADO: TFloatField;
    qryValidarPagosMONTO_CAMBIO: TFloatField;
    qryValidarPagosMONTOTOTALCLDO: TFloatField;
    qryValidarPagosMONTOPAGADODET: TFloatField;
    qryValidarPagosMONTODIFPAGO: TIntegerField;
    procedure tblCuadrerutaAfterScroll(DataSet: TDataSet);
    procedure qryDetalleCuadreRutaCalcFields(DataSet: TDataSet);
    procedure tblPromocionesCalcFields(DataSet: TDataSet);
    procedure qryCargarDatosCuadreRutaFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmCuadrexRuta: TdmCuadrexRuta;

implementation

uses UDatModConectar, Uglobal;

{$R *.dfm}

procedure TdmCuadrexRuta.tblCuadrerutaAfterScroll(DataSet: TDataSet);
begin
  dmcuadrexruta.qryDetalleCuadreRuta.close;
  dmcuadrexruta.qryDetalleCuadreRuta.Params[0].Value:=dmcuadrexruta.tblCuadrerutaRUTA.Value;
  dmcuadrexruta.qryDetalleCuadreRuta.Params[1].Value:=ExtraerFecha(dmcuadrexruta.tblCuadrerutaFECHA.Value);
  dmcuadrexruta.qryDetalleCuadreRuta.Params[2].Value:=dmcuadrexruta.tblCuadrerutaCODIGO_EMP.Value;
  dmcuadrexruta.qryDetalleCuadreRuta.Open;
end;

procedure TdmCuadrexRuta.qryDetalleCuadreRutaCalcFields(DataSet: TDataSet);
begin
  qryDetalleCuadreRutaTotal.Value:=
  qryDetalleCuadreRutaCheque.Value+
  qryDetalleCuadreRutaEfectivo.Value+
  qryDetalleCuadreRutaPromocion.Value+
  qryDetalleCuadreRutaCredito_directo.Value+
  qryDetalleCuadreRutaCredito_normal.Value +
  qryDetalleCuadreRutaREP_CAMION.Value +
  qryDetalleCuadreRutaCOMBUSTIBLE.Value +
  qryDetalleCuadreRutaAJUSTE.Value +
  qryDetalleCuadreRutaDIETA.Value;
end;

procedure TdmCuadrexRuta.tblPromocionesCalcFields(DataSet: TDataSet);
begin     
  if qryInventario.Locate('CODIGO_TEXTO',tblPromocionesCODIGO_PROD.Value,[]) then
  tblPromocionesPRECIO.Value:=  qryInventarioPRECIO.Value;
  tblPromocionesMonto.Value := tblPromocionesCANTIDAD.Value * tblPromocionesPRECIO.Value;
end;

procedure TdmCuadrexRuta.qryCargarDatosCuadreRutaFilterRecord(
  DataSet: TDataSet; var Accept: Boolean);
begin
  if qryCargarDatosCuadreRuta.Tag > 0 then
  begin
    Accept:= Dataset['cia_key'] = qryCargarDatosCuadreRuta.Tag;
  end;
end;

end.
