unit UDatModComisiones;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBTable, IBQuery;

type
  TdmComision = class(TDataModule)
    tblComisiones: TIBDataSet;
    tblTipoComision: TIBTable;
    tblComisionesCODIGO: TIBStringField;
    tblComisionesTIPO: TSmallintField;
    tblComisionesFECHA_INICIAL: TDateTimeField;
    tblComisionesFECHA_FINAL: TDateTimeField;
    tblComisionesMONTO_COMISION: TFloatField;
    tblComisionesSTATUS: TIBStringField;
    tblInventarioProd: TIBTable;
    tblInventarioProdCODIGO: TIntegerField;
    tblInventarioProdDESCRIPCION: TIBStringField;
    dstblInventarioProd: TDataSource;
    tblInventarioProdCodigoMasDesc: TStringField;
    tblInventarioProdCODIGO_TEXTO: TIBStringField;
    tblComisionTrab: TIBDataSet;
    tblComisionTrabNUMEROID: TIntegerField;
    tblComisionTrabFECHA: TDateTimeField;
    tblComisionTrabFECHA_FACTURA: TDateTimeField;
    tblComisionTrabNUMERO_FACT: TIntegerField;
    tblComisionTrabTIPO_PAGO: TSmallintField;
    tblComisionTrabTIPO_SERVICIO: TIntegerField;
    tblComisionTrabCODIGO_OPERADOR: TIntegerField;
    tblComisionTrabMONTO_FACTURA: TFloatField;
    tblComisionTrabMONTO_COMISIONABLE: TFloatField;
    tblComisionTrabPORC_COMISION: TFloatField;
    tblComisionTrabCOD_USUARIO: TIntegerField;
    tblComisionTrabFECHA_IN: TDateTimeField;
    tblComisionTrabIN_POR: TIBStringField;
    tblComisionTrabFECHA_MOD: TDateTimeField;
    tblComisionTrabMOD_POR: TIBStringField;
    tblComisionTrabSTATUS: TIBStringField;
    tblComisionTrabMONTO_COMISIONPAGAR: TFloatField;
    dstblComisionTrab: TDataSource;
    tblTipoInventario: TIBQuery;
    tblTipoInventarioCODIGO: TSmallintField;
    tblTipoInventarioDESCRIPCION: TIBStringField;
    dstblTipoInventario: TDataSource;
    qryEmpleados: TIBQuery;
    qryEmpleadosCODIGO: TIntegerField;
    qryEmpleadosCODIGO_CIA: TIntegerField;
    qryEmpleadosNOMBRE: TIBStringField;
    qryEmpleadosAPELLIDO: TIBStringField;
    qryEmpleadosCEDULA: TIBStringField;
    qryEmpleadosFOTO: TBlobField;
    qryEmpleadosPASSPORT: TIBStringField;
    qryEmpleadosCALLE: TIBStringField;
    qryEmpleadosNUM_CASA: TSmallintField;
    qryEmpleadosCIUDAD: TIBStringField;
    qryEmpleadosPAIS: TIBStringField;
    qryEmpleadosTELEF_CASA: TIBStringField;
    qryEmpleadosTELEF_OFICINA: TIBStringField;
    qryEmpleadosCELULAR: TIBStringField;
    qryEmpleadosEMAIL: TIBStringField;
    qryEmpleadosSEXO: TIBStringField;
    qryEmpleadosESTADO_CIVIL: TIBStringField;
    qryEmpleadosTELEF_REFERENCIA: TIBStringField;
    qryEmpleadosNOMBRE_REFERENCIA: TIBStringField;
    qryEmpleadosFECHA_NAC: TDateTimeField;
    qryEmpleadosNACIONALIDAD: TIBStringField;
    qryEmpleadosFECHA_ENTRADA: TDateTimeField;
    qryEmpleadosFECHA_SALIDA: TDateTimeField;
    qryEmpleadosSALARIO: TFloatField;
    qryEmpleadosTIPO_NOMINA: TSmallintField;
    qryEmpleadosTIPO_EMPLEADO: TSmallintField;
    qryEmpleadosDEPTO_EMP: TSmallintField;
    qryEmpleadosSECCION: TSmallintField;
    qryEmpleadosCARGO: TSmallintField;
    qryEmpleadosPAGA_AFP: TSmallintField;
    qryEmpleadosPAGA_TSS: TSmallintField;
    qryEmpleadosSTATUS: TIBStringField;
    qryEmpleadosFECHA_IN: TDateTimeField;
    qryEmpleadosIN_POR: TIBStringField;
    qryEmpleadosFECHA_MOD: TDateTimeField;
    qryEmpleadosMOD_POR: TIBStringField;
    qryEmpleadosLICENCIA: TIBStringField;
    qryEmpleadosFECHA_VENCE_LICENCIA: TDateTimeField;
    qryEmpleadosFECHAVACACIONES: TDateTimeField;
    dsqryEmpleados: TDataSource;
    qryEmpleadosNOMBREOPERADOR: TIBStringField;
    qryVentas_base_credito: TIBQuery;
    qryVentas_base_contado: TIBQuery;
    qryVentas: TIBQuery;
    qryVentasNUMERO: TIntegerField;
    qryVentasFECHA: TDateTimeField;
    qryVentasCIA_KEY: TIntegerField;
    qryVentasFORMA_PAGO: TSmallintField;
    qryVentasMONEDA: TIBStringField;
    qryVentasVALOR_TOTAL_DET: TFloatField;
    qryVentasNUMERO_FACTURA: TIntegerField;
    qryVentasNUMERO_DOC_PAGO: TIBStringField;
    qryListadoPagoComisiones: TIBQuery;
    qryListadoPagoComisionesBase: TIBQuery;
    qryEmpleado: TIBQuery;
    qryEmpleadoCODIGO: TIntegerField;
    qryEmpleadoCODIGO_CIA: TIntegerField;
    qryEmpleadoNOMBRE: TIBStringField;
    qryEmpleadoAPELLIDO: TIBStringField;
    qryEmpleadoCEDULA: TIBStringField;
    qryEmpleadoFOTO: TBlobField;
    qryEmpleadoPASSPORT: TIBStringField;
    qryEmpleadoCALLE: TIBStringField;
    qryEmpleadoNUM_CASA: TSmallintField;
    qryEmpleadoCIUDAD: TIBStringField;
    qryEmpleadoPAIS: TIBStringField;
    qryEmpleadoTELEF_CASA: TIBStringField;
    qryEmpleadoTELEF_OFICINA: TIBStringField;
    qryEmpleadoCELULAR: TIBStringField;
    qryEmpleadoEMAIL: TIBStringField;
    qryEmpleadoSEXO: TIBStringField;
    qryEmpleadoESTADO_CIVIL: TIBStringField;
    qryEmpleadoTELEF_REFERENCIA: TIBStringField;
    qryEmpleadoNOMBRE_REFERENCIA: TIBStringField;
    qryEmpleadoFECHA_NAC: TDateTimeField;
    qryEmpleadoNACIONALIDAD: TIBStringField;
    qryEmpleadoFECHA_ENTRADA: TDateTimeField;
    qryEmpleadoFECHA_SALIDA: TDateTimeField;
    qryEmpleadoSALARIO: TFloatField;
    qryEmpleadoTIPO_NOMINA: TSmallintField;
    qryEmpleadoTIPO_EMPLEADO: TSmallintField;
    qryEmpleadoDEPTO_EMP: TSmallintField;
    qryEmpleadoSECCION: TSmallintField;
    qryEmpleadoCARGO: TSmallintField;
    qryEmpleadoPAGA_AFP: TSmallintField;
    qryEmpleadoPAGA_TSS: TSmallintField;
    qryEmpleadoSTATUS: TIBStringField;
    qryEmpleadoFECHA_IN: TDateTimeField;
    qryEmpleadoIN_POR: TIBStringField;
    qryEmpleadoFECHA_MOD: TDateTimeField;
    qryEmpleadoMOD_POR: TIBStringField;
    qryEmpleadoLICENCIA: TIBStringField;
    qryEmpleadoFECHA_VENCE_LICENCIA: TDateTimeField;
    qryEmpleadoFECHAVACACIONES: TDateTimeField;
    qryEmpleadoNOMBRECOMPLETO: TIBStringField;
    qryListadoPagoComisionesNUMEROID: TIntegerField;
    qryListadoPagoComisionesFECHA: TDateTimeField;
    qryListadoPagoComisionesFECHA_FACTURA: TDateTimeField;
    qryListadoPagoComisionesNUMERO_FACT: TIntegerField;
    qryListadoPagoComisionesTIPO_PAGO: TSmallintField;
    qryListadoPagoComisionesNOMBREEMPLEADO: TIBStringField;
    qryListadoPagoComisionesDESCFPAGO: TIBStringField;
    qryListadoPagoComisionesTIPO_SERVICIO: TIntegerField;
    qryListadoPagoComisionesCODIGO_OPERADOR: TIntegerField;
    qryListadoPagoComisionesMONTO_FACTURA: TFloatField;
    qryListadoPagoComisionesMONTO_COMISIONABLE: TFloatField;
    qryListadoPagoComisionesPORC_COMISION: TFloatField;
    qryListadoPagoComisionesCOD_USUARIO: TIntegerField;
    qryListadoPagoComisionesFECHA_IN: TDateTimeField;
    qryListadoPagoComisionesIN_POR: TIBStringField;
    qryListadoPagoComisionesFECHA_MOD: TDateTimeField;
    qryListadoPagoComisionesMOD_POR: TIBStringField;
    qryListadoPagoComisionesSTATUS: TIBStringField;
    qryListadoPagoComisionesMONTO_COMISIONPAGAR: TFloatField;
    qryListadoPagoComisionesDESC_TIPOINV: TIBStringField;
    tblMetasPorVendedor: TIBDataSet;
    tblMetasPorVendedorCOD_VENDEDOR: TIntegerField;
    tblMetasPorVendedorFECHAINI: TDateTimeField;
    tblMetasPorVendedorFECHAFIN: TDateTimeField;
    tblMetasPorVendedorMONTO_BASE: TFloatField;
    tblMetasPorVendedorSTATUS: TIBStringField;
    dstblMetasPorVendedor: TDataSource;
    tblComisionTrabTIPO_COMISION: TSmallintField;
    tblComisionTrabNUMERO_TRN: TIntegerField;
    qryListadoPagoComisionesCANT: TFloatField;
    qryEmpleadoDESC_CARGO: TIBStringField;
    tblComisionXVta: TIBDataSet;
    tblComisionXVtaID: TIntegerField;
    tblComisionXVtaTIPO: TSmallintField;
    tblComisionXVtaFECHA_PAGO: TDateTimeField;
    tblComisionXVtaFECHA_INICIO: TDateTimeField;
    tblComisionXVtaFECHA_FINAL: TDateTimeField;
    tblComisionXVtaCODIGO_EMPLEADO: TIntegerField;
    tblComisionXVtaMONTO_BASE: TFloatField;
    tblComisionXVtaPORC_COMISION: TFloatField;
    tblComisionXVtaMONTO_COMISION: TFloatField;
    tblComisionXVtaFECHA_IN: TDateTimeField;
    tblComisionXVtaIN_POR: TIBStringField;
    tblComisionXVtaSTATUS: TIBStringField;
    qryVentasComisionable: TIBQuery;
    qryVentasComisionableSum: TIBQuery;
    qryVentasComisionableSumCODIGO_VENDEDOR: TIntegerField;
    qryVentasComisionableSumNOMBREEMPLEADO: TIBStringField;
    qryVentasComisionableSumVALORTOTALVENTA: TFloatField;
    qryVendedores: TIBQuery;
    qryVendedoresDESC_CARGO: TIBStringField;
    qryVendedoresNOMBREVENDEDOR: TIBStringField;
    qryVendedoresCODIGO: TIntegerField;
    qryVendedoresNOMBRE: TIBStringField;
    qryVendedoresAPELLIDO: TIBStringField;
    qryVendedoresDEPTO_EMP: TSmallintField;
    qryVendedoresSECCION: TSmallintField;
    qryVendedoresCARGO: TSmallintField;
    qryVentasComisionableNUMERO: TIntegerField;
    qryVentasComisionableFECHA: TDateTimeField;
    qryVentasComisionableCODIGO_CTE: TIntegerField;
    qryVentasComisionableNOMBRECLIENTE: TIBStringField;
    qryVentasComisionableCIA_KEY: TIntegerField;
    qryVentasComisionableFORMA_PAGO: TSmallintField;
    qryVentasComisionableMONEDA: TIBStringField;
    qryVentasComisionableCODIGO_VENDEDOR: TIntegerField;
    qryVentasComisionableCOD_USR_CAJA: TIntegerField;
    qryVentasComisionableNOMBREEMPLEADO: TIBStringField;
    qryVentasComisionableCODIGO_PROD: TIBStringField;
    qryVentasComisionableDESCRIPCION: TIBStringField;
    qryVentasComisionableCANTIDAD: TFloatField;
    qryVentasComisionablePRECIO: TFloatField;
    qryVentasComisionableMONTO_BRUTO: TFloatField;
    qryVentasComisionableDESCUENTO: TFloatField;
    qryVentasComisionableVALOR_TOTAL_DET: TFloatField;
    qryVentasComisionableNUMERO_FACTURA: TIntegerField;
    qryVentasComisionableNUMERO_DOC_PAGO: TIBStringField;
    procedure tblInventarioProdCalcFields(DataSet: TDataSet);
    procedure tblComisionTrabAfterScroll(DataSet: TDataSet);
    procedure qryVentasComisionableAfterOpen(DataSet: TDataSet);
    procedure qryVentasComisionableFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    codVendedor : Integer;
  end;

var
  dmComision: TdmComision;

implementation

uses UDatModConectar;

{$R *.dfm}

procedure TdmComision.tblInventarioProdCalcFields(DataSet: TDataSet);
begin
  tblInventarioProdCodigoMasDesc.Value:= tblInventarioProdCODIGO_TEXTO.Value+'-'+tblInventarioProdDESCRIPCION.Value;
end;

procedure TdmComision.tblComisionTrabAfterScroll(DataSet: TDataSet);
begin
  if (tblComisionTrabTIPO_PAGO.Value = 1) then //contado
  begin
    qryVentas.SQL.Text := dmComision.qryVentas_base_contado.SQL.Text;
  end else
  begin
    qryVentas.SQL.Text := dmComision.qryVentas_base_credito.SQL.Text;
  end;
end;

procedure TdmComision.qryVentasComisionableAfterOpen(DataSet: TDataSet);
begin
  qryVentasComisionableSum.close;
  qryVentasComisionableSum.params[0].Value:= qryVentasComisionable.params[0].value;
  qryVentasComisionableSum.params[1].Value:= qryVentasComisionable.params[1].value;
  qryVentasComisionableSum.Open;
end;

procedure TdmComision.qryVentasComisionableFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept:= Dataset['CODIGO_VENDEDOR'] = codVendedor;
end;

end.
