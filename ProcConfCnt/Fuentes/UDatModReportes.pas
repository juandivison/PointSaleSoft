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
    qryDatosRepVentaDiariaNOMBRE_FACTURAR: TIBStringField;
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
    qryDatosRepVentaDiariaNOMBRE_VENDEDOR: TIBStringField;
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
    qryRepInventarioProdMasBclRutaDESCRIPCION: TIBStringField;
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
    qryRelacionFacturasTELEFONO: TIBStringField;
    qryRelacionFacturasDIRECCION_CONT: TIBStringField;
    qryRelacionFacturasCIUDAD: TIBStringField;
    qryRelacionFacturasDIASENATRASO: TIntegerField;
    qryRelacionFacturasCANTMESES: TFloatField;
    qryRelacionFacturasNUMERO: TFloatField;
    qryRelacionFacturasFECHA: TDateTimeField;
    qryRelacionFacturasCODIGO_CTE: TIntegerField;
    qryRelacionFacturasMONTO_PENDIENTE: TFloatField;
    qryRelacionFacturasSTATUS: TIBStringField;
    qryRelacionFacturasNOMBRE_CTE: TIBStringField;
    qryRelacionFacturasRNC_NUMERO: TIBStringField;
    qryRepInventarioProdMasBclRutaPRECIO_COMPRA: TFloatField;
    qryRepInventarioProdMasBclDiv: TIBQuery;
    qryRepInventarioProdMasBclDivDESCRIPCION: TIBStringField;
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
    qryDivInventarioDESCRIPCION: TIBStringField;
    qryDivInventarioSTATUS: TIBStringField;
    IBQuery1: TIBQuery;
    procedure qryDatosRepVxCajasCalcFields(DataSet: TDataSet);
    procedure qryDatosRepVxCajasResumenCalcFields(DataSet: TDataSet);
    procedure qryDatosRepDifVendedoresCalcFields(DataSet: TDataSet);
    procedure qryDatosFaltanteCalcFields(DataSet: TDataSet);
    procedure qryDatosRepVentaDiariaFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure qryDatosSaldoAntiguedadCxcAfterOpen(DataSet: TDataSet);
    procedure rxSaldoAntCxcFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
  private
    { Private declarations }
    Procedure ProcOrganizaDataSaldoAntCxc;

  public

    filtrarTipoInv : Integer;
    DescTipoProd   : String;
   filtrarRepIngEfe,
   filtrarRepIngCxc,
   filtrarRepIngTodo : Integer;
   filtrarxCodCte : Integer;
   SaldoResumen : Boolean;
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
begin
  //repIngTodo
  //repIngEfe
  //repIngCxc
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
  Accept := DataSet['xTipo_Inventario'] = filtrarTipoInv
end;

procedure TdmReportes.ProcOrganizaDataSaldoAntCxc;
    procedure insertar;
    begin
      rxSaldoAntCxc.Insert;
      rxSaldoAntCxccodigo.Value:= qryDatosSaldoAntiguedadCxccodigo_cte.Value;
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

end.
