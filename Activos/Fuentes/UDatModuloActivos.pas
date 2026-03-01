unit UDatModuloActivos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RxLogin, DBSecur, IBCustomDataSet, Db, RxMemDS, IBStoredProc, IBTable,
  Variants, IBUpdateSQL, IBQuery;

type
  Tdm = class(TDataModule)
    qryMaestroActivos: TIBQuery;
    dtqryMaestroActivos: TDataSource;
    updqryMaestroActivos: TIBUpdateSQL;
    tTipoActivos: TIBTable;
    dtTipoActivos: TDataSource;
    tTipoActivosTIPO: TIntegerField;
    tTipoActivosDESCRIPCION: TStringField;
    tTipoActivosCTA_DB1: TStringField;
    tTipoActivosCTA_DB2: TStringField;
    tTipoActivosCTA_DB3: TStringField;
    tTipoActivosCTA_CR1: TStringField;
    tTipoActivosCTA_CR2: TStringField;
    tTipoActivosCTA_CR3: TStringField;
    tTipoActivosFECHA_IN: TDateTimeField;
    tTipoActivosIN_POR: TStringField;
    tTipoActivosFECHA_UPD: TDateTimeField;
    tTipoActivosUPD_POR: TStringField;
    qryDepreciacion: TIBQuery;
    dtqryDepreciacion: TDataSource;
    updqryDepreciacion: TIBUpdateSQL;
    qryDepreciacionTIPO: TIntegerField;
    qryDepreciacionCODIGO: TIntegerField;
    qryDepreciacionFECHA: TDateTimeField;
    qryDepreciacionVALOR: TFloatField;
    qryDepreciacionSTATUS: TStringField;
    qryDepreciacionFECHA_IN: TDateTimeField;
    qryDepreciacionIN_POR: TStringField;
    qryDepreciacionFECHA_UPD: TDateTimeField;
    qryDepreciacionUPD_POR: TStringField;
    qryControl: TIBQuery;
    qryControlDet: TIBQuery;
    qryControlSISTEMA: TIntegerField;
    qryControlSUB_SISTEMA: TIntegerField;
    qryControlCOD_CIA: TIntegerField;
    qryControlFECHA_ACT: TDateTimeField;
    qryControlDESCRIPCION: TStringField;
    qryControlSTATUS: TStringField;
    qryControlFECHA_IN: TDateTimeField;
    qryControlIN_POR: TStringField;
    qryControlFECHA_MOD: TDateTimeField;
    qryControlMOD_POR: TStringField;
    dtqryControl: TDataSource;
    dtqryControlDet: TDataSource;
    rxDepreciacion: TRxMemoryData;
    rxDepreciacionTIPO: TIntegerField;
    rxDepreciacionCODIGO: TIntegerField;
    rxDepreciacionFECHA: TDateTimeField;
    rxDepreciacionVALOR: TFloatField;
    rxDepreciacionSTATUS: TStringField;
    rxDepreciacionDepre_Anual: TFloatField;
    dtrxDepreciacion: TDataSource;
    rxDepreciacionDESC_TIPO: TStringField;
    rxDepreciacionDepre_Mensual: TFloatField;
    rxDepreciacionDescripcion: TStringField;
    qryHistoricoActivos: TIBQuery;
    dtqryHistoricoActivos: TDataSource;
    updqryHistoricoActivos: TIBUpdateSQL;
    qryMaestroActivosTIPO: TIntegerField;
    qryMaestroActivosCODIGO: TIntegerField;
    qryMaestroActivosDESCRIPCION: TStringField;
    qryMaestroActivosMARCA: TStringField;
    qryMaestroActivosREGISTRO: TStringField;
    qryMaestroActivosREFERENCIA: TStringField;
    qryMaestroActivosSERIE_ACTIVO: TIntegerField;
    qryMaestroActivosFECHA_COMPRA: TDateTimeField;
    qryMaestroActivosVIDA_UTIL: TSmallintField;
    qryMaestroActivosVALOR_COMPRA: TFloatField;
    qryMaestroActivosVALOR_REMODELA: TFloatField;
    qryMaestroActivosVALOR_ORIGINAL: TFloatField;
    qryMaestroActivosVALOR_EN_LIBRO: TFloatField;
    qryMaestroActivosPORC_ADICCION: TFloatField;
    qryMaestroActivosPORC_DEPRE: TFloatField;
    qryMaestroActivosDEPRE_MENSUAL: TFloatField;
    qryMaestroActivosDEPRE_ANUAL: TFloatField;
    qryMaestroActivosDEPRE_ACUM_ANUAL: TFloatField;
    qryMaestroActivosBALANCE_DEPRE: TFloatField;
    qryMaestroActivosFECHA_ULT_ACT: TDateTimeField;
    qryMaestroActivosFECHA_SALIDA: TDateTimeField;
    qryMaestroActivosVALOR_DEPRECIABLE: TFloatField;
    qryMaestroActivosDEPRE_ACUMULADA: TFloatField;
    qryMaestroActivosSTATUS_ACTIVO: TStringField;
    qryMaestroActivosFECHA_IN: TDateTimeField;
    qryMaestroActivosIN_POR: TStringField;
    qryMaestroActivosFECHA_UPD: TDateTimeField;
    qryMaestroActivosUPD_POR: TStringField;
    qryHistoricoActivosTIPO: TIntegerField;
    qryHistoricoActivosCODIGO: TIntegerField;
    qryHistoricoActivosFECHA: TDateTimeField;
    qryHistoricoActivosDEPRE_ACUMULADA: TFloatField;
    qryHistoricoActivosVALOR_EN_LIBRO: TFloatField;
    qryHistoricoActivosBALANCE_DEPRE: TFloatField;
    qryHistoricoActivosIN_POR: TStringField;
    qryHistoricoActivosFECHA_IN: TDateTimeField;
    updqryControl: TIBUpdateSQL;
    qryControlDetSERIE: TFloatField;
    qryControlDetSISTEMA: TIntegerField;
    qryControlDetSUB_SISTEMA: TIntegerField;
    qryControlDetCOD_CIA: TIntegerField;
    qryControlDetFECHA_ACT: TDateTimeField;
    qryControlDetSTATUS: TStringField;
    qryControlDetFECHA_IN: TDateTimeField;
    qryControlDetIN_POR: TStringField;
    qryControlDetFECHA_MOD: TDateTimeField;
    qryControlDetMOD_POR: TStringField;
    qryMastertrncnt: TIBQuery;
    qryMastertrncntNUMERO: TIntegerField;
    qryMastertrncntFECHA: TDateTimeField;
    qryMastertrncntDESCRIPCION: TStringField;
    qryMastertrncntSTATUS: TStringField;
    qryMastertrncntIN_POR: TStringField;
    qryMastertrncntFECHA_IN: TDateTimeField;
    qryMastertrncntMOD_POR: TStringField;
    qryMastertrncntFECHA_MOD: TDateTimeField;
    qryMastertrncntTIPO_DOC: TSmallintField;
    qryMastertrncntMONTO: TFloatField;
    updMastertrncnt: TIBUpdateSQL;
    qryDetTrnCnt: TIBQuery;
    qryDetTrnCntSERIE: TFloatField;
    qryDetTrnCntNUMERO: TIntegerField;
    qryDetTrnCntDESCRIPCION_TRN: TStringField;
    qryDetTrnCntDEBITO_TRN: TFloatField;
    qryDetTrnCntCREDITO_TRN: TFloatField;
    qryDetTrnCntCUENTA1: TStringField;
    qryDetTrnCntCUENTA2: TStringField;
    qryDetTrnCntCUENTA3: TStringField;
    qryDetTrnCntSTATUS_APLICADA: TStringField;
    qryDetTrnCntSTATUS: TStringField;
    qryDetTrnCntIN_POR: TStringField;
    qryDetTrnCntFECHA_IN: TDateTimeField;
    qryDetTrnCntMOD_POR: TStringField;
    qryDetTrnCntFECHA_MOD: TDateTimeField;
    qryDetTrnCntCODIGO_DEPTO: TStringField;
    qryDetTrnCntNUM_DOC: TFloatField;
    qryDetTrnCntCOD_CTA_CONCEPTO: TIntegerField;
    updDetControl: TIBUpdateSQL;
    dtRxTranCnt: TDataSource;
    rxTranCnt: TRxMemoryData;
    rxTranCntrxCuenta1: TStringField;
    rxTranCntrxCuenta2: TStringField;
    rxTranCntrxCuenta3: TStringField;
    rxTranCntrxCodDepto: TStringField;
    rxTranCntrxFecha: TDateField;
    rxTranCntrxDescripcion: TStringField;
    rxTranCntrxDebito: TFloatField;
    rxTranCntrxCredito: TFloatField;
    rxTranCntrxNumFact: TIntegerField;
    rxTranCntrxDepartamento: TIntegerField;
    stpActSeriecntdet: TIBStoredProc;
    stpActSeriecntm: TIBStoredProc;
    stpseriedetalle: TIBStoredProc;
    stpActSerieCtrl: TIBStoredProc;
    tTipoActivosCODIGO_CONCEPTO: TIntegerField;
    tClase_Cuenta_Adm: TIBTable;
    tClase_Cuenta_AdmCODIGO: TIntegerField;
    tClase_Cuenta_AdmNOMBRE: TStringField;
    dtClase_Cuenta_Adm: TDataSource;
    rxTranCntcod_concepto_cta: TIntegerField;
    qryDepreciacionTIPO_DESC: TStringField;
    qryDepreciacionDESCRIPCION_ACTIVO: TStringField;
    qryNombreActivo: TIBQuery;
    qryNombreActivoTIPO: TIntegerField;
    qryNombreActivoCODIGO: TIntegerField;
    qryNombreActivoDESCRIPCION: TStringField;
    tActivoCuenta: TIBTable;
    dttActivoCuenta: TDataSource;
    tActivoCuentaTIPO: TIntegerField;
    tActivoCuentaCODIGO: TIntegerField;
    tActivoCuentaCODIGO_CONCEPTO: TIntegerField;
    tActivoCuentaFECHA_IN: TDateTimeField;
    tActivoCuentaIN_POR: TStringField;
    tActivoCuentaFECHA_UPD: TDateTimeField;
    tActivoCuentaUPD_POR: TStringField;
    tClasif_cuentas: TIBTable;
    tClasif_cuentasCODIGO: TIntegerField;
    tClasif_cuentasDESCRIPCION: TStringField;
    tClasif_cuentasSTATUS: TStringField;
    tClasif_cuentasTIPOSERVICIO: TIntegerField;
    tSubTipoCta: TIBTable;
    tSubTipoCtaCODIGO: TSmallintField;
    tSubTipoCtaDESCRIPCION: TStringField;
    tSubTipoCtaCOD_ABR: TStringField;
    tSubTipoCtaSTATUS: TStringField;
    dtSubTipoCta: TDataSource;
    dtClasif_cuentas: TDataSource;
    rxTranCntNombreCuenta: TStringField;
    rxTranCntrxCodigoActivo: TStringField;
    rxTranCntrxDescActivo: TStringField;
    qryMaestroActivosTIPODESCRIPCION: TStringField;
    tActivoCuentaGrupo: TIBTable;
    tActivoCuentaGrupoCTA1: TStringField;
    tActivoCuentaGrupoCTA2: TStringField;
    tActivoCuentaGrupoCTA3: TStringField;
    tActivoCuentaGrupoTIPOSERVICIO: TIntegerField;
    tActivoCuentaGrupoCOD_SUBTIPO: TSmallintField;
    tActivoCuentaGrupoCTA_ORIGEN: TIntegerField;
    tActivoCuentaGrupoFECHA_IN: TDateTimeField;
    tActivoCuentaGrupoIN_POR: TStringField;
    tActivoCuentaGrupoFECHA_UPD: TDateTimeField;
    tActivoCuentaGrupoUPD_POR: TStringField;
    dtActivoCuentaGrupo: TDataSource;
    tActivoCuentaCODGRUPOCTA: TIntegerField;
    tActivoCuentaGrupoCODIGOGRUPO: TIntegerField;
    updTrnCntDet: TIBUpdateSQL;
    rxTranCntrxTipo: TIntegerField;
    rxTranCntrxCodigo: TIntegerField;
    rxTranCntrxTipoDesc: TStringField;
    qryCtasTramp: TIBDataSet;
    QryCtaTrampDet: TIBDataSet;
    dtqryCtasTramp: TDataSource;
    dsQryCtaTrampDet: TDataSource;
    tblCompania: TIBTable;
    tblCompaniaCODIGO: TSmallintField;
    tblCompaniaNOMBRE: TIBStringField;
    tblCompaniaCALLEYNUMERO: TIBStringField;
    tblCompaniaTELEFONO: TIBStringField;
    tblCompaniaFAX: TIBStringField;
    tblCompaniaEMAIL: TIBStringField;
    tblCompaniaWEBSITE: TIBStringField;
    tblCompaniaCIUDAD: TIBStringField;
    tblCompaniaPAIS: TIBStringField;
    tblCompaniaRNC_NUMERO: TIBStringField;
    tblCompaniaDIRECTORIO: TIBStringField;
    tblCompaniaFECHAI_ACT: TDateTimeField;
    tblCompaniaFECHAF_ACT: TDateTimeField;
    tblCompaniaCTA1_GYP_PERIODO: TIBStringField;
    tblCompaniaCTA2_GYP_PERIODO: TIBStringField;
    tblCompaniaCTA3_GYP_PERIODO: TIBStringField;
    tblCompaniaCTA1_SUPERAVIT_ACM: TIBStringField;
    tblCompaniaCTA2_SUPERAVIT_ACM: TIBStringField;
    tblCompaniaCTA3_SUPERAVIT_ACM: TIBStringField;
    tblCompaniaCTA1_RESUMEN_GYP: TIBStringField;
    tblCompaniaCTA2_RESUMEN_GYP: TIBStringField;
    tblCompaniaCTA3_RESUMEN_GYP: TIBStringField;
    tblCompaniaOBSERVACION: TIBStringField;
    tblCompaniaSTATUS: TIBStringField;
    tblCompaniaNUM_PATENTE: TIBStringField;
    tblCompaniaCTA1_ULT_RETENIDA: TIBStringField;
    tblCompaniaCTA2_ULT_RETENIDA: TIBStringField;
    tblCompaniaCTA3_ULT_RETENIDA: TIBStringField;
    tblCompaniaCTA1_GYP_MES: TIBStringField;
    tblCompaniaCTA2_GYP_MES: TIBStringField;
    tblCompaniaCTA3_GYP_MES: TIBStringField;
    tblCompaniaFECHA_IN: TDateTimeField;
    tblCompaniaIN_POR: TIBStringField;
    tblCompaniaFECHA_MOD: TDateTimeField;
    tblCompaniaMOD_POR: TIBStringField;
    tblCompaniaLOGOCIA: TIBStringField;
    tblCompaniaOFFICE_ID: TIntegerField;
    tblCompaniaNUM_SUCURSAL: TIBStringField;
    dstblCompania: TDataSource;
    qryClase_Cuenta_Adm: TIBQuery;
    dsqryClase_Cuenta_Adm: TDataSource;
    qryDepreciacionCons: TIBQuery;
    qryDepreciacionConsDESCRIPCION_ACTIVO: TIBStringField;
    qryDepreciacionConsTIPO: TIntegerField;
    qryDepreciacionConsTIPO_DESC: TIBStringField;
    qryDepreciacionConsCODIGO: TIntegerField;
    qryDepreciacionConsFECHA: TDateTimeField;
    qryDepreciacionConsVALOR: TFloatField;
    qryDepreciacionConsSTATUS: TIBStringField;
    qryDepreciacionConsFECHA_IN: TDateTimeField;
    qryDepreciacionConsIN_POR: TIBStringField;
    qryDepreciacionConsFECHA_UPD: TDateTimeField;
    qryDepreciacionConsUPD_POR: TIBStringField;
    dsqryDepreciacionCons: TDataSource;
    procedure qryMastertrncntAfterScroll(DataSet: TDataSet);
    procedure qryDepreciacionCalcFields(DataSet: TDataSet);
    procedure tClase_Cuenta_AdmFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure tActivoCuentaGrupoFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure qryMaestroActivosFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure qryHistoricoActivosFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure qryControlFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure tActivoCuentaFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    activoTipo:String;
    activoCodigo:string;
  end;

var
  dm: Tdm;

implementation

uses UDatModConectar, UglobalActivos;

{$R *.DFM}

procedure Tdm.qryMastertrncntAfterScroll(DataSet: TDataSet);
begin
  qryDetTrnCnt.DisableControls;
  qryDetTrnCnt.Close;
  qryDetTrnCnt.Filtered:=False;
  qryDetTrnCnt.Params[0].Value := qrymastertrncntnumero.Value;
  qryDetTrnCnt.open;
  qryDetTrnCnt.EnableControls;
end;

procedure Tdm.qryDepreciacionCalcFields(DataSet: TDataSet);
begin
  if dm.qryNombreActivo.State = dsBrowse then
  if dm.qryNombreActivo.Locate('Tipo;Codigo',
     VarArrayOf([qryDepreciacionTipo.Value,
                 qryDepreciacionCodigo.Value]),[]) then
  begin
    qryDepreciacionDESCRIPCION_ACTIVO.Value:=dm.qryNombreActivoDESCRIPCION.Value;
  end else
  qryDepreciacionDESCRIPCION_ACTIVO.Value:='***Error***';
end;

procedure Tdm.tClase_Cuenta_AdmFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept:= DataSet['nombre'] = chr(39)+'D*'+chr(39);
end;

procedure Tdm.tActivoCuentaGrupoFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept:=DataSet['Codigogrupo'] = dm.tActivoCuentaCODGRUPOCTA.AsString;
end;

procedure Tdm.qryMaestroActivosFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  //Accept:= DataSet['STATUS_ACTIVO'] = chr(39)+'A'+chr(39)
  //         or DataSet['STATUS_ACTIVO'] = chr(39)+' '+chr(39)
  //         or DataSet['STATUS_ACTIVO'] = null;
end;

procedure Tdm.qryHistoricoActivosFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  if (activoCodigo <> '') And (activoTipo <> '') then
  Accept:=(DataSet['tipo'] = activoTipo) And (DataSet['codigo'] = activoCodigo)
  else
  if (activoCodigo <> '')  then
  Accept:=DataSet['codigo'] = activoCodigo
  else
  if (activoTipo <> '') then
  Accept:=DataSet['tipo'] = activoTipo;

  //Accept:=DataSet['tipo'] = dm.qryMaestroActivosTIPO.AsString +
  //and DataSet['codigo'] = dm.qryMaestroActivosCODIGO.Asstring;
end;

procedure Tdm.qryControlFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept:= (DataSet['SISTEMA'] = GlBCntSistema) AND (DataSet['SUB_SISTEMA'] = GlbCntSub_sistema)
  AND (DataSet['COD_CIA'] =GlbCntCod_cia );
end;

procedure Tdm.tActivoCuentaFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept:=DataSet['Codigogrupo'] = dm.tActivoCuentaCODGRUPOCTA.AsString;
end;

end.
