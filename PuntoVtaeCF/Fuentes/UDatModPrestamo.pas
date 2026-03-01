unit UDatModPrestamo;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBQuery, IBTable;

type
  TdmPrestamo = class(TDataModule)
    tblPrestamo: TIBDataSet;
    tblPrestamoNUMERO: TIntegerField;
    tblPrestamoCODIGO_EMP: TIntegerField;
    tblPrestamoRUTA: TIntegerField;
    tblPrestamoFECHA: TDateTimeField;
    tblPrestamoTIPO_PRESTAMO: TSmallintField;
    tblPrestamoCUOTAS: TFloatField;
    tblPrestamoPORC_INTERES: TFloatField;
    tblPrestamoMONTO_PRESTAMO: TFloatField;
    tblPrestamoMONTO_PAGADO: TFloatField;
    tblPrestamoFECHA_ULTIMO_PAGO: TDateTimeField;
    tblPrestamoSTATUS: TIBStringField;
    tblPrestamoIN_POR: TIBStringField;
    tblPrestamoFECHA_IN: TDateTimeField;
    tblPrestamoMOD_POR: TIBStringField;
    tblPrestamoFECHA_MOD: TDateTimeField;
    qryEmpleado: TIBQuery;
    tblTipoPrestamo: TIBTable;
    tblTipoPrestamoCODIGO: TSmallintField;
    tblTipoPrestamoDESCRIPCION: TIBStringField;
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
    qryRepAvisoAtraso: TIBQuery;
    qryRepAvisoAtrasoCODIGO_CTE: TIntegerField;
    qryRepAvisoAtrasoDIAS_EN_ATRASO: TIntegerField;
    qryRepAvisoAtrasoFECHA: TDateTimeField;
    qryRepAvisoAtrasoNOMBRE_CTE: TIBStringField;
    qryRepAvisoAtrasoDIRECCION_CONT: TIBStringField;
    qryRepAvisoAtrasoTELEF_CONTACTO: TIBStringField;
    qryRepAvisoAtrasoAPODO: TIBStringField;
    qryRepAvisoAtrasoSERIE: TIntegerField;
    qryRepAvisoAtrasoCIUDAD: TIBStringField;
    qryRepAvisoAtrasoFECHA_ULT_PAGO: TDateTimeField;
    qryRepAvisoAtrasoTIPO_FREC_PAGO: TIntegerField;
    qryRepAvisoAtrasoCODIGO_AVISO: TIntegerField;
    qryRepAvisoAtrasoAVISO_DESC: TMemoField;
    tblAvisoAtarso: TIBDataSet;
    tblAvisoAtarsoCODIGO: TIntegerField;
    tblAvisoAtarsoDIA_INICIAL: TIntegerField;
    tblAvisoAtarsoDIA_FINAL: TIntegerField;
    tblAvisoAtarsoDESCRIPCION: TMemoField;
    tblAvisoAtarsoSTATUS: TIBStringField;
    dstblAvisoAtarso: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmPrestamo: TdmPrestamo;

implementation

uses UDatModConectar;

{$R *.dfm}

end.
