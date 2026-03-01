unit UDatModVehiculo;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBQuery, IBTable, Variants;

type
  TdmVehiculo = class(TDataModule)
    tblVehiculo: TIBDataSet;
    dstbVehiculo: TDataSource;
    qryClientes: TIBQuery;
    dsqryClientes: TDataSource;
    tblVehiculoFICHA: TIntegerField;
    tblVehiculoCOD_PROPIETARIO: TIntegerField;
    tblVehiculoDESCRIPCION: TIBStringField;
    tblVehiculoPLACA: TIBStringField;
    tblVehiculoNUM_POLIZA_SEGURO: TIBStringField;
    tblVehiculoMARCA: TIBStringField;
    tblVehiculoREGISTRO: TIBStringField;
    tblVehiculoREFERENCIA: TIBStringField;
    tblVehiculoCODIGO_EMPLEADO: TIntegerField;
    tblVehiculoFECHA: TDateTimeField;
    tblVehiculoSTATUS_ACTIVO: TIBStringField;
    tblVehiculoFECHA_IN: TDateTimeField;
    tblVehiculoIN_POR: TIBStringField;
    tblVehiculoFECHA_UPD: TDateTimeField;
    tblVehiculoUPD_POR: TIBStringField;
    tblVehiculoCOLOR: TIBStringField;
    tblVehiculoYEAR_VEH: TIntegerField;
    tblVehiculoULTIMO_KM: TIBStringField;
    tblVehiculoFECHA_INICIO: TDateTimeField;
    tblVehiculoTIPO_COMBUSTIBLE: TSmallintField;
    tblVehiculoCANT_GALONES: TFloatField;
    tblVehiculoVALOR_TANQUE: TFloatField;
    tblVehiculoNIVEL_TANQUE: TFloatField;
    tblEstatusVeh: TIBTable;
    tblEstatusVehCODIGO: TIntegerField;
    tblEstatusVehDESCRIPCION: TIBStringField;
    tblTanqueGasolina: TIBTable;
    tblTanqueGasolinaCODIGO: TIntegerField;
    tblTanqueGasolinaDESCRIPCION: TIBStringField;
    tblTipoCombustible: TIBTable;
    tblTipoCombustibleCODIGO: TSmallintField;
    tblTipoCombustibleDESCRIPCION: TIBStringField;
    tblTipoCombustibleSTATUS: TIBStringField;
    dsTipocombustible: TDataSource;
    dstblEstatusVeh: TDataSource;
    qryVehiculos: TIBQuery;
    dsqryVehiculos: TDataSource;
    qryClientesCODIGO_CTE: TIntegerField;
    qryClientesCIA_KEY: TIntegerField;
    qryClientesTIPO_CLIENTE: TSmallintField;
    qryClientesFOTO: TBlobField;
    qryClientesNOMBRE_CTE: TIBStringField;
    qryClientesNOMBRE_ABREV: TIBStringField;
    qryClientesMONEDA_FACT: TIBStringField;
    qryClientesNOMBRE_FACTURAR: TIBStringField;
    qryClientesCONTACTO: TIBStringField;
    qryClientesDIRECCION_CONT: TIBStringField;
    qryClientesTELEF_CONTACTO: TIBStringField;
    qryClientesFAX_CONTACTO: TIBStringField;
    qryClientesFORMA_PAGO: TSmallintField;
    qryClientesCODIGO_AGENCIA: TSmallintField;
    qryClientesSTATUS_CLIENTE: TIBStringField;
    qryClientesINSERTADO_POR: TIBStringField;
    qryClientesFECHA_INSERTADO: TDateTimeField;
    qryClientesFECHA_MOD: TDateTimeField;
    qryClientesMODI_POR: TIBStringField;
    qryClientesLIMITE_CREDITO: TFloatField;
    qryClientesEMAIL: TIBStringField;
    qryClientesWEBSITE: TIBStringField;
    qryClientesPAIS: TIBStringField;
    qryClientesCIUDAD: TIBStringField;
    qryClientesCEDULA: TIBStringField;
    qryClientesRNC: TIBStringField;
    qryClientesREFERENCIA: TIBStringField;
    qryClientesTELEF_REFERENCIA: TIBStringField;
    qryClientesOTRO_TELEFONO: TIBStringField;
    qryClientesCANT_DIAS_CREDITO: TSmallintField;
    qryClientesTIPO_NCF: TIBStringField;
    qryClientesOBSERVACION: TMemoField;
    qryClientesLUGAR_DE_TRABAJO: TIBStringField;
    qryClientesAPODO: TIBStringField;
    qryClientesCODIGO_USUARIO: TIntegerField;
    qryClientesRNC_NUMERO: TIBStringField;
    qryClientesCOMENTARIO: TMemoField;
    qryClientesCONDICION: TIntegerField;
    qryClientesPRECIO_ID: TIntegerField;
    qryClientesTIPO_CF: TIBStringField;
    qryClientesMOVIL1: TIBStringField;
    qryClientesMOVIL2: TIBStringField;
    qryClientesCODIGO_TEXTO: TIBStringField;
    qryClientesUSARLEVELPRECIO: TSmallintField;
    qryClientesCOD_VENDEDOR: TIntegerField;
    qryChoferes: TIBQuery;
    qryChoferesCODIGO: TIntegerField;
    qryChoferesCODIGO_CIA: TIntegerField;
    qryChoferesNOMBRE: TIBStringField;
    qryChoferesAPELLIDO: TIBStringField;
    qryChoferesCEDULA: TIBStringField;
    qryChoferesFOTO: TBlobField;
    qryChoferesPASSPORT: TIBStringField;
    qryChoferesCALLE: TIBStringField;
    qryChoferesNUM_CASA: TSmallintField;
    qryChoferesCIUDAD: TIBStringField;
    qryChoferesPAIS: TIBStringField;
    qryChoferesTELEF_CASA: TIBStringField;
    qryChoferesTELEF_OFICINA: TIBStringField;
    qryChoferesCELULAR: TIBStringField;
    qryChoferesEMAIL: TIBStringField;
    qryChoferesSEXO: TIBStringField;
    qryChoferesESTADO_CIVIL: TIBStringField;
    qryChoferesTELEF_REFERENCIA: TIBStringField;
    qryChoferesNOMBRE_REFERENCIA: TIBStringField;
    qryChoferesFECHA_NAC: TDateTimeField;
    qryChoferesNACIONALIDAD: TIBStringField;
    qryChoferesFECHA_ENTRADA: TDateTimeField;
    qryChoferesFECHA_SALIDA: TDateTimeField;
    qryChoferesSALARIO: TFloatField;
    qryChoferesTIPO_NOMINA: TSmallintField;
    qryChoferesTIPO_EMPLEADO: TSmallintField;
    qryChoferesDEPTO_EMP: TSmallintField;
    qryChoferesSECCION: TSmallintField;
    qryChoferesCARGO: TSmallintField;
    qryChoferesPAGA_AFP: TSmallintField;
    qryChoferesPAGA_TSS: TSmallintField;
    qryChoferesSTATUS: TIBStringField;
    qryChoferesFECHA_IN: TDateTimeField;
    qryChoferesIN_POR: TIBStringField;
    qryChoferesFECHA_MOD: TDateTimeField;
    qryChoferesMOD_POR: TIBStringField;
    qryChoferesLICENCIA: TIBStringField;
    qryChoferesFECHA_VENCE_LICENCIA: TDateTimeField;
    dsqryChoferes: TDataSource;
    qryChoferesNOMBRECOMPLETO: TIBStringField;
    tblVehiculoROTULO: TIBStringField;
    qryVehiculosFICHA: TIntegerField;
    qryVehiculosDESCRIPCION: TIBStringField;
    qryVehiculosPLACA: TIBStringField;
    qryVehiculosNUM_POLIZA_SEGURO: TIBStringField;
    qryVehiculosMARCA: TIBStringField;
    qryVehiculosREGISTRO: TIBStringField;
    qryVehiculosREFERENCIA: TIBStringField;
    qryVehiculosCODIGO_EMPLEADO: TIntegerField;
    qryVehiculosFECHA: TDateTimeField;
    qryVehiculosSTATUS_ACTIVO: TIBStringField;
    qryVehiculosFECHA_IN: TDateTimeField;
    qryVehiculosIN_POR: TIBStringField;
    qryVehiculosFECHA_UPD: TDateTimeField;
    qryVehiculosUPD_POR: TIBStringField;
    qryVehiculosCOLOR: TIBStringField;
    qryVehiculosYEAR_VEH: TIntegerField;
    qryVehiculosULTIMO_KM: TIBStringField;
    qryVehiculosFECHA_INICIO: TDateTimeField;
    qryVehiculosTIPO_COMBUSTIBLE: TSmallintField;
    qryVehiculosCANT_GALONES: TFloatField;
    qryVehiculosVALOR_TANQUE: TFloatField;
    qryVehiculosNIVEL_TANQUE: TFloatField;
    qryVehiculosCOD_PROPIETARIO: TIntegerField;
    qryVehiculosNOMBRE_CTE: TIBStringField;
    qryVehiculosCIA_KEY: TIntegerField;
    qryVehiculosCODIGO_CTE: TIntegerField;
    qryVehiculosNOMBRE_CHOFER: TIBStringField;
    qryVehiculosCEDULA: TIBStringField;
    qryVehiculosROTULO: TIBStringField;
    qryVehiculosCTA: TIBStringField;
    qryProveedores: TIBQuery;
    DataSource1: TDataSource;
    dsQryProveedores: TDataSource;
    qryProveedoresCODIGO_CTE: TIntegerField;
    qryProveedoresTIPO_CLIENTE: TIntegerField;
    qryProveedoresNOMBRE_ABR: TIBStringField;
    qryProveedoresDESCRIPCION: TIBStringField;
    qryProveedoresCONTACTO: TIBStringField;
    qryProveedoresPAIS: TIBStringField;
    qryProveedoresESTADO: TIBStringField;
    qryProveedoresCIUDAD: TIBStringField;
    qryProveedoresCALYYNUM: TIBStringField;
    qryProveedoresTELEFONO: TIBStringField;
    qryProveedoresFAX: TIBStringField;
    qryProveedoresCODIGOPOSTAL: TIBStringField;
    qryProveedoresEMAIL: TIBStringField;
    qryProveedoresDIRECCIONWEB: TIBStringField;
    qryProveedoresSTATUS: TIBStringField;
    qryProveedoresFECHA_IN: TDateTimeField;
    qryProveedoresIN_POR: TIBStringField;
    qryProveedoresFECHA_MOD: TDateTimeField;
    qryProveedoresMOD_POR: TIBStringField;
    qryProveedoresRNC_PROVEEDOR: TIBStringField;
    qryProveedoresMOVIL1: TIBStringField;
    qryProveedoresMOVIL2: TIBStringField;
    qryProveedoresTELEFONO2: TIBStringField;
    qryProveedoresTELEFONO3: TIBStringField;
    qryProveedoresEXTENSIONES: TIBStringField;
    qryProveedoresCIA_KEY: TIntegerField;
    qryVehiculosTIPO_CLIENTE: TIntegerField;
    qryVehiculosDESCRIPCION_TIPOPROV: TIBStringField;
    qryVehiculosPAGACHOFER: TSmallintField;
    qryVehiculosTIPOCXP: TIntegerField;
    qryChoferesCUENTANOMINA: TIBStringField;
    qryChoferesCUENTAXPAGAR: TIBStringField;
    qryEmpleado: TIBQuery;
    qryEmpleadoNOMBRECOMPLETO: TIBStringField;
    qryEmpleadoCODIGO: TIntegerField;
    qryEmpleadoCODIGO_CIA: TIntegerField;
    qryEmpleadoNOMBRE: TIBStringField;
    qryEmpleadoAPELLIDO: TIBStringField;
    qryEmpleadoNOMBRE_REFERENCIA: TIBStringField;
    qryEmpleadoMOD_POR: TIBStringField;
    qryEmpleadoLICENCIA: TIBStringField;
    qryEmpleadoFECHA_VENCE_LICENCIA: TDateTimeField;
    dsqryEmpleado: TDataSource;
    tblVehiculoMODELO: TIBStringField;
    qryVerificaVeh: TIBQuery;
    qryVerificaVehTVta: TIBQuery;
    tblVehiculoCHASSIS: TIBStringField;
    tblVehiculoCODIGO_PROD: TIntegerField;
    tblVehiculoPRECIOVENTA: TFloatField;
    tblVehiculoPRECIOCOMPRA: TFloatField;
    tblVehiculoCOD_MONEDA: TIBStringField;
    tblVehiculoCOD_PROVEEDOR: TIntegerField;
    tblVehiculoPrecioCalculadoRD: TCurrencyField;
    qryEsVeh: TIBQuery;
    qryEsVehCODIGO_PROD: TIntegerField;
    qryEstusVeh: TIBQuery;
    qryEstusVehCODIGO: TIntegerField;
    qryEstusVehDESCRIPCION: TIBStringField;
    qryProvLook: TIBQuery;
    dsqryProvLook: TDataSource;
    qryProvLookCODIGO_CTE: TIntegerField;
    qryProvLookDESCRIPCION: TIBStringField;
    tblVehiculoCODIGO_CTE_ANT: TIntegerField;
    tblVehiculoCODIGO_CTE_ACT: TIntegerField;
    procedure tblVehiculoCalcFields(DataSet: TDataSet);
    procedure tblVehiculoFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    _statusveh : string;
    _codProdVeh: integer;
  end;

var
  dmVehiculo: TdmVehiculo;

implementation

uses UDatModConectar, Uglobal;

{$R *.dfm}

procedure TdmVehiculo.tblVehiculoCalcFields(DataSet: TDataSet);
begin
   tblVehiculoPrecioCalculadoRD.Value:= 
   tblVehiculoPrecioCompra.Value * GlbMontoTasa(tblVehiculoCOD_MONEDA.Value);
end;

procedure TdmVehiculo.tblVehiculoFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  if _codProdVeh <> 0 then
  begin
    Accept:= DataSet['CODIGO_PROD'] = _codProdVeh
  end else
  Accept:= DataSet['STATUS_ACTIVO'] = _statusveh;
end;

procedure TdmVehiculo.DataModuleCreate(Sender: TObject);
begin
  _codProdVeh:= 0;
end;

end.
