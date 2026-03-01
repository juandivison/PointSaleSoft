unit UDatModRegOpeDiaria;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBTable, IBQuery;

type
  TdtmTransOpeDiaria = class(TDataModule)
    tblOrdenCompraMaster: TIBDataSet;
    dstblRegTransOpeDiariaMast: TDataSource;
    tblRegTransOpeDiariaDet: TIBDataSet;
    dstblRegTransOpeDiariaDet: TDataSource;
    tblRegTransOpeDiariaDetSERIE: TFloatField;
    tblRegTransOpeDiariaDetNUMERO: TIntegerField;
    tblRegTransOpeDiariaDetCOD_SERV_PROD: TIntegerField;
    tblRegTransOpeDiariaDetDEPARTAMENTO: TIntegerField;
    tblRegTransOpeDiariaDetOBSERVACION: TIBStringField;
    tblRegTransOpeDiariaDetCANTIDAD: TFloatField;
    tblRegTransOpeDiariaDetPRECIO: TFloatField;
    tblRegTransOpeDiariaDetVALOR: TFloatField;
    tblRegTransOpeDiariaDetNUMERO_DOCUMENTO: TIntegerField;
    tblRegTransOpeDiariaDetNUMERO_FACTURA: TIntegerField;
    tblRegTransOpeDiariaDetCOD_CTA_CONCEPTO: TIntegerField;
    tblRegTransOpeDiariaDetCODIGO_USUARIO: TIntegerField;
    tblRegTransOpeDiariaDetSTATUS: TIBStringField;
    tblRegTransOpeDiariaDetIN_POR: TIBStringField;
    tblRegTransOpeDiariaDetFECHA_IN: TDateTimeField;
    tblRegTransOpeDiariaDetMOD_POR: TIBStringField;
    tblRegTransOpeDiariaDetFECHA_MOD: TDateTimeField;
    tblCondicion: TIBTable;
    dstblCondicion: TDataSource;
    tblCondicionCODIGO: TIntegerField;
    tblCondicionDESCRIPCION: TIBStringField;
    tblProveedores: TIBDataSet;
    tblProveedoresCODIGO_CTE: TIntegerField;
    tblProveedoresTIPO_CLIENTE: TIntegerField;
    tblProveedoresDESCRIPCION: TIBStringField;
    tblProveedoresCONTACTO: TIBStringField;
    tblProveedoresPAIS: TIBStringField;
    tblProveedoresESTADO: TIBStringField;
    tblProveedoresCIUDAD: TIBStringField;
    tblProveedoresCALYYNUM: TIBStringField;
    tblProveedoresTELEFONO: TIBStringField;
    tblProveedoresFAX: TIBStringField;
    tblProveedoresCODIGOPOSTAL: TIBStringField;
    tblProveedoresEMAIL: TIBStringField;
    tblProveedoresDIRECCIONWEB: TIBStringField;
    tblProveedoresSTATUS: TIBStringField;
    tblProveedoresFECHA_IN: TDateTimeField;
    tblProveedoresIN_POR: TIBStringField;
    tblProveedoresFECHA_MOD: TDateTimeField;
    tblProveedoresMOD_POR: TIBStringField;
    qryProveedor: TIBQuery;
    qryProveedorCODIGO_CTE: TIntegerField;
    qryProveedorTIPO_CLIENTE: TIntegerField;
    qryProveedorCONTACTO: TIBStringField;
    qryProveedorPAIS: TIBStringField;
    qryProveedorESTADO: TIBStringField;
    qryProveedorCIUDAD: TIBStringField;
    qryProveedorCALYYNUM: TIBStringField;
    qryProveedorTELEFONO: TIBStringField;
    qryProveedorFAX: TIBStringField;
    qryProveedorCODIGOPOSTAL: TIBStringField;
    qryProveedorEMAIL: TIBStringField;
    qryProveedorDIRECCIONWEB: TIBStringField;
    qryProveedorSTATUS: TIBStringField;
    qryProveedorFECHA_IN: TDateTimeField;
    qryProveedorIN_POR: TIBStringField;
    qryProveedorFECHA_MOD: TDateTimeField;
    qryProveedorMOD_POR: TIBStringField;
    dsqryProveedor: TDataSource;
    qryCentroCostos: TIBQuery;
    dsqryCentroCostos: TDataSource;
    qryDeptos: TIBQuery;
    dsqryDeptos: TDataSource;
    qryDeptosCODIGO: TSmallintField;
    qryDeptosNOMBRE: TIBStringField;
    qryDeptosSTATUS: TIBStringField;
    qryDeptosFECHA_IN: TDateTimeField;
    qryDeptosIN_POR: TIBStringField;
    qryDeptosFECHA_MOD: TDateTimeField;
    qryDeptosMOD_POR: TIBStringField;
    qryProdServicio: TIBQuery;
    dsqryProdServicio: TDataSource;
    tblProductosServicios: TIBDataSet;
    dstblProductosServicios: TDataSource;
    tblProductosServiciosCODIGO: TIntegerField;
    tblProductosServiciosDESCRIPCION: TIBStringField;
    tblCentroDeCostos: TIBTable;
    tblCentroDeCostosCODIGO: TIntegerField;
    tblCentroDeCostosNOMBRE: TIBStringField;
    tblCentroDeCostosCODDGII: TIntegerField;
    dstblCentroDeCostos: TDataSource;
    tblCargoEmp: TIBTable;
    dstblCargoEmp: TDataSource;
    tblTurno: TIBTable;
    tblTurnoCODIGO_TURNO: TIntegerField;
    tblTurnoDESCRIPCION: TIBStringField;
    tblTurnoHORAINI: TDateTimeField;
    tblTurnoHORAFIN: TDateTimeField;
    tblTurnoSTATUS: TIBStringField;
    dstblTurno: TDataSource;
    tblProveedoresRNC_PROVEEDOR: TIBStringField;
    tblProveedoresMOVIL1: TIBStringField;
    tblProveedoresMOVIL2: TIBStringField;
    tblProveedoresTELEFONO2: TIBStringField;
    tblProveedoresTELEFONO3: TIBStringField;
    tblProveedoresEXTENSIONES: TIBStringField;
    tblProveedoresNOMBRE_ABR: TIBStringField;
    qryGetFechaOrden: TIBQuery;
    qryGetFechaOrdenFECHA: TDateTimeField;
    tblOrdenCompraMasterNUMERO: TIntegerField;
    tblOrdenCompraMasterCODIGO_PROVEE: TIntegerField;
    tblOrdenCompraMasterFECHA: TDateTimeField;
    tblOrdenCompraMasterFPAGO: TSmallintField;
    tblOrdenCompraMasterCOD_CAJA_CHICA: TIntegerField;
    tblOrdenCompraMasterCODIGO_BANCO: TIntegerField;
    tblOrdenCompraMasterCUENTABANCO: TIBStringField;
    tblOrdenCompraMasterOBSERVACION: TIBStringField;
    tblOrdenCompraMasterMONTO: TFloatField;
    tblOrdenCompraMasterSTATUS: TIBStringField;
    tblOrdenCompraMasterIN_POR: TIBStringField;
    tblOrdenCompraMasterFECHA_IN: TDateTimeField;
    tblOrdenCompraMasterMOD_POR: TIBStringField;
    tblOrdenCompraMasterFECHA_MOD: TDateTimeField;
    tblOrdenCompraMasterTIPO_INV: TSmallintField;
    tblOrdenCompraMasterSTATUS_CNT: TIBStringField;
    tblOrdenCompraMasterNUM_ORDEN: TIntegerField;
    tblOrdenCompraMasterSTATUS_ORD: TIBStringField;
    tblOrdenCompraMasterAREA_ORDEN: TIntegerField;
    tblOrdenCompraMasterCIA_KEY: TIntegerField;
    tblRegTransOpeDiariaMast: TIBDataSet;
    tblRegTransOpeDiariaMastNUMERO: TIntegerField;
    tblRegTransOpeDiariaMastCOD_PROVEEDOR: TIntegerField;
    tblRegTransOpeDiariaMastFECHA: TDateTimeField;
    tblRegTransOpeDiariaMastCIA_KEY: TIntegerField;
    tblRegTransOpeDiariaMastFPAGO: TSmallintField;
    tblRegTransOpeDiariaMastOBSERVACION: TIBStringField;
    tblRegTransOpeDiariaMastMONTO: TFloatField;
    tblRegTransOpeDiariaMastSTATUS: TIBStringField;
    tblRegTransOpeDiariaMastSTATUS_CNT: TIBStringField;
    tblRegTransOpeDiariaMastIN_POR: TIBStringField;
    tblRegTransOpeDiariaMastFECHA_IN: TDateTimeField;
    tblRegTransOpeDiariaMastMOD_POR: TIBStringField;
    tblRegTransOpeDiariaMastFECHA_MOD: TDateTimeField;
    tblOrdenCompraDet: TIBDataSet;
    dstblOrdenCompraDet: TDataSource;
    tblOrdenCompraDetSERIE: TFloatField;
    tblOrdenCompraDetNUMERO: TIntegerField;
    tblOrdenCompraDetCOD_SERV_PROD: TIntegerField;
    tblOrdenCompraDetDEPARTAMENTO: TIntegerField;
    tblOrdenCompraDetCANTIDAD: TFloatField;
    tblOrdenCompraDetVALOR: TFloatField;
    tblOrdenCompraDetSTATUS: TIBStringField;
    tblOrdenCompraDetIN_POR: TIBStringField;
    tblOrdenCompraDetFECHA_IN: TDateTimeField;
    tblOrdenCompraDetMOD_POR: TIBStringField;
    tblOrdenCompraDetFECHA_MOD: TDateTimeField;
    tblOrdenCompraDetNUMERO_DOCUMENTO: TIntegerField;
    tblOrdenCompraDetNUMERO_FACTURA: TIntegerField;
    tblOrdenCompraDetCOD_CTA_CONCEPTO: TIntegerField;
    tblOrdenCompraDetTIPOSERVICIO: TIntegerField;
    tblOrdenCompraDetSUBTIPOSERV: TIntegerField;
    tblOrdenCompraDetNO_SERIE_RES: TIntegerField;
    tblOrdenCompraDetCODIGO_CONDUCTOR: TIntegerField;
    tblOrdenCompraDetSERIE_CDC: TIntegerField;
    tblOrdenCompraDetCODIGO_SERVCOSTO: TIntegerField;
    tblOrdenCompraDetNUMEROOLD: TIntegerField;
    tblOrdenCompraDetPRECIO: TFloatField;
    tblOrdenCompraDetAREA_ORDEN: TIntegerField;
    tblOrdenCompraDetITBI_DET: TFloatField;
    tblOrdenCompraDetPORC_DESC_DET: TFloatField;
    tblOrdenCompraDetMONTO_DESCUENTO: TFloatField;
    dstblOrdenCompraMaster: TDataSource;
    qryProveedorNOMBRE_ABR: TIBStringField;
    qryProveedorRNC_PROVEEDOR: TIBStringField;
    qryProveedorMOVIL1: TIBStringField;
    qryProveedorMOVIL2: TIBStringField;
    qryProveedorTELEFONO2: TIBStringField;
    qryProveedorTELEFONO3: TIBStringField;
    qryProveedorEXTENSIONES: TIBStringField;
    qryProveedorCIA_KEY: TIntegerField;
    tblOrdenCompraDetOBSERVACION: TIBStringField;
    qryProveedorDESCRIPCION: TIBStringField;
    tblOrdenCompraMasterNUMERO_NCF: TIBStringField;
    tblCargoEmpCODIGO: TIntegerField;
    tblCargoEmpNOMBRE: TIBStringField;
    tblCargoEmpSTATUS: TIBStringField;
    tblCargoEmpIN_POR: TIBStringField;
    tblCargoEmpFECHA_IN: TDateTimeField;
    tblCargoEmpMOD_POR: TIBStringField;
    tblCargoEmpFECHA_MOD: TDateTimeField;
    tblProveedoresCOD_VENDEDOR: TIntegerField;
    tblProveedoresCONDICION: TIntegerField;
    tblProveedoresCANT_DIAS_CREDITO: TSmallintField;
    tblProveedoresLIMITE_CREDITO: TFloatField;
    tblOrdenCompraMasterCODIGO_VENDEDOR: TIntegerField;
    tblVendedorProveedor: TIBDataSet;
    dstblVendedorProveedor: TDataSource;
    tblVendedorProveedorCODIGO_PROV: TIntegerField;
    tblVendedorProveedorNOMBRE_VENDEDOR: TIBStringField;
    tblVendedorProveedorCELULAR: TIBStringField;
    tblVendedorProveedorTELEFONO: TIBStringField;
    tblVendedorProveedorEXT: TIBStringField;
    tblVendedorProveedorEMAIL: TIBStringField;
    tblVendedorProveedorSTATUS: TIBStringField;
    tblVendedorProveedorIDVENDEDOR: TIntegerField;
    tblOrdenCompDetRecibida: TIBDataSet;
    tblOrdenCompDetRecibidaSERIE: TFloatField;
    tblOrdenCompDetRecibidaNUMERO: TIntegerField;
    tblOrdenCompDetRecibidaFECHA_RECIBIDA: TDateTimeField;
    tblOrdenCompDetRecibidaCOD_SERV_PROD: TIntegerField;
    tblOrdenCompDetRecibidaCANT_OFERTA: TFloatField;
    tblOrdenCompDetRecibidaCANTIDAD: TFloatField;
    tblOrdenCompDetRecibidaPRECIO: TFloatField;
    tblOrdenCompDetRecibidaSTATUS: TIBStringField;
    tblPersonaJuridica: TIBTable;
    tblPersonaJuridicaIDTIPO: TIntegerField;
    tblPersonaJuridicaDESCRIPCION: TIBStringField;
    dstblPersonaJuridica: TDataSource;
    tblProveedoresIDTIPO_PROV: TIntegerField;
    tblProveedoresTIPODOC: TSmallintField;
    tblRegTransOpeDiariaMastRCXP: TIBStringField;
    tblRegTransOpeDiariaMastTIPO_CF: TIBStringField;
    tblRegTransOpeDiariaMastRCNT: TIBStringField;
    tblRegTransOpeDiariaMastNUMERO_NCF: TIBStringField;
    tblCentroDeCostosCUENTAXPAGAR: TIBStringField;
    tblCentroDeCostosCUENTA_GASTO: TIBStringField;
    tblCentroDeCostosNombreCtaXPagar: TIBStringField;
    tblCentroDeCostosNombreCtaGastos: TIBStringField;
    tblTipoCF: TIBTable;
    tblTipoCFTIPO_CF: TIBStringField;
    tblTipoCFDESCRIPCION: TIBStringField;
    dstblTipoCF: TDataSource;
    tblRegTransOpeDiariaDetMONTO_ITBIS: TFloatField;
    tblCentroDeCostosCUENTAITBCXP: TIBStringField;
    tblCentroDeCostosNombreCtaItbisXPagar: TStringField;
    tblRegTransOpeDiariaDetIDTASAITBIS: TIntegerField;
    tblTipoCompra: TIBTable;
    tblTipoCompraTIPO: TIntegerField;
    tblTipoCompraDESCRIPCION: TIBStringField;
    tblRegTransOpeDiariaMastFECHA_VENCE: TDateTimeField;
    tblRegTransOpeDiariaMastIDTIPO_COMPRA: TIntegerField;
    dstblTipoCompra: TDataSource;
    qryProveedorLIMITE_CREDITO: TFloatField;
    qryProveedorCOD_VENDEDOR: TIntegerField;
    qryProveedorCONDICION: TIntegerField;
    qryProveedorCANT_DIAS_CREDITO: TSmallintField;
    qryProveedorIDTIPO_PROV: TIntegerField;
    qryProveedorTIPODOC: TSmallintField;
    tblOrdenCompraMasterSERIE_TIPOTRNCNT: TIntegerField;
    tblOrdenCompraMasterTASA_ITBIS: TFloatField;
    tblOrdenCompraMasterTASA_ISR: TFloatField;
    tblOrdenCompraMasterMONTO_RETENER_ISR: TFloatField;
    tblOrdenCompraMasterMONTO_RETENER_ITBIS: TFloatField;
    tblOrdenCompraMasterIDTIPO_COMPRA: TIntegerField;
    tblRegTransOpeDiariaDetFICHA_VEH: TIntegerField;
    tblRegTransOpeDiariaMastIDCODIGO_TPAGODGII: TSmallintField;
    tblOrdenCompraDetCANT_OFERTA: TIntegerField;
    tblOrdenCompraDetIDUNIDAD: TIntegerField;
    tblOrdenCompraDetCOD_USUARIO_RECIBE: TIntegerField;
    tblOrdenCompraDetCOD_USUARIO_CREA: TIntegerField;
    tblOrdenCompraMasterFECHA_RECIBIDA: TDateTimeField;
    tblProveedoresCIA_KEY: TIntegerField;
    procedure tblOrdenCompraMasterAfterScroll(DataSet: TDataSet);
    procedure tblRegTransOpeDiariaDetBeforePost(DataSet: TDataSet);
    procedure tblRegTransOpeDiariaDetCANTIDADChange(Sender: TField);
    procedure tblOrdenCompraDetAfterScroll(DataSet: TDataSet);
    procedure tblOrdenCompraDetBeforePost(DataSet: TDataSet);
    procedure tblRegTransOpeDiariaMastAfterScroll(DataSet: TDataSet);
    procedure tblRegTransOpeDiariaDetAfterPost(DataSet: TDataSet);
    procedure tblCentroDeCostosCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    EsRecibiendoOrden : boolean;
  end;

var
  dtmTransOpeDiaria: TdtmTransOpeDiaria;

implementation

uses UDatModConectar, UDatModInventario, UGlobal;

{$R *.dfm}

procedure TdtmTransOpeDiaria.tblOrdenCompraMasterAfterScroll(
  DataSet: TDataSet);
begin
  if tblOrdenCompraMasterNUMERO.IsNull then Exit;
  if tblOrdenCompraDet.State in [dsInactive,dsBrowse] then
  begin
    tblOrdenCompraDet.Close;
    tblOrdenCompraDet.Params[0].Value:= tblOrdenCompraMasterNUMERO.Value;
    tblOrdenCompraDet.Open;
  end;
end;

procedure TdtmTransOpeDiaria.tblRegTransOpeDiariaDetBeforePost(
  DataSet: TDataSet);
begin
  if dtmTransOpeDiaria.tblRegTransOpeDiariaDetNUMERO.IsNull then
  dtmTransOpeDiaria.tblRegTransOpeDiariaDetNumero.Value:=
  dtmTransOpeDiaria.tblRegTransOpeDiariaMastNUMERO.Value;
end;

procedure TdtmTransOpeDiaria.tblRegTransOpeDiariaDetCANTIDADChange(
  Sender: TField);
begin
  tblRegTransOpeDiariaDetVALOR.Value := tblRegTransOpeDiariaDetCANTIDAD.Value *
                                        tblRegTransOpeDiariaDetPRECIO.Value;
end;

procedure TdtmTransOpeDiaria.tblOrdenCompraDetAfterScroll(
  DataSet: TDataSet);
begin
  if EsRecibiendoOrden then
  begin
    if dmInventario.tblinventarioProd.state = dsInactive then
    begin
      dmInventario.tblInventarioProd.Close;
      dmInventario.tblInventarioProd.SelectSQL.Text := dmInventario.qryInvProd_Base.Sql.Text;
      dmInventario.tblInventarioProd.Params[0].Value:=glbCia_Key;
      dmInventario.tblInventarioProd.Open;
    end;
    dmInventario.tblInventarioProd.Locate('codigo',tblOrdenCompraDetCOD_SERV_PROD.Value,[]);
  end;
end;

procedure TdtmTransOpeDiaria.tblOrdenCompraDetBeforePost(
  DataSet: TDataSet);
begin
  if dtmTransOpeDiaria.tblOrdenCompraDet.State in [dsInsert] then
  if dtmTransOpeDiaria.tblOrdenCompraDetNUMERO.IsNull then
  dtmTransOpeDiaria.tblOrdenCompraDetNUMERO.Value:=
  dtmTransOpeDiaria.tblOrdenCompraMasterNUMERO.Value;
end;

procedure TdtmTransOpeDiaria.tblRegTransOpeDiariaMastAfterScroll(
  DataSet: TDataSet);
begin
  if tblRegTransOpeDiariaDet.State In [dsBrowse, dsInactive] then
  begin
    tblRegTransOpeDiariaDet.Close;
    tblRegTransOpeDiariaDet.Params[0].Value := tblRegTransOpeDiariaMastNUMERO.Value;
    tblRegTransOpeDiariaDet.Open;
  end;
end;

procedure TdtmTransOpeDiaria.tblRegTransOpeDiariaDetAfterPost(
  DataSet: TDataSet);
begin
  if tblRegTransOpeDiariaDetNUMERO.IsNull then
  tblRegTransOpeDiariaDetNUMERO.Value:= tblRegTransOpeDiariaMastNUMERO.Value;
end;

procedure TdtmTransOpeDiaria.tblCentroDeCostosCalcFields(DataSet: TDataSet);
begin
  if Not tblCentroDeCostosCUENTAXPAGAR.IsNull then
  tblCentroDeCostosNombreCtaXPagar.Value := GetNombreCuenta(tblCentroDeCostosCUENTAXPAGAR.Value);
  
  if Not tblCentroDeCostosCUENTA_GASTO.IsNull then
  tblCentroDeCostosNombreCtaGastos.Value := GetNombreCuenta(tblCentroDeCostosCUENTA_GASTO.Value);

  if Not tblCentroDeCostosCUENTAITBCXP.IsNull then
  tblCentroDeCostosNombreCtaItbisXPagar.Value := GetNombreCuenta(tblCentroDeCostosCUENTAITBCXP.Value);
end;

end.
