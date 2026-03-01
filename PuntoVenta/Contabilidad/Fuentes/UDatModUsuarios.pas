unit UDatModUsuarios;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBTable, IBQuery, IBSQL;

type
  TdmUsuarios = class(TDataModule)
    tblUsuarios: TIBDataSet;
    tblUsuariosNUMERO: TSmallintField;
    tblUsuariosCODIGO: TIBStringField;
    tblUsuariosFOTO: TBlobField;
    tblUsuariosTIPO: TSmallintField;
    tblUsuariosSTATUS: TIBStringField; 
    tblUsuariosCLAVE: TIBStringField;
    tblUsuariosFECHA_ENTRADA: TDateTimeField;
    tblUsuariosFECHA_SALIDA: TDateTimeField;
    tblUsuariosFECHA_VENCE_CLAVE: TDateTimeField;
    qryUsuarios: TIBDataSet;
    qryUsuariosCLAVE: TIBStringField;
    qryUsuariosCODIGO: TIBStringField;
    qryUsuariosFECHA_ENTRADA: TDateTimeField;
    qryUsuariosFECHA_SALIDA: TDateTimeField;
    qryUsuariosFECHA_VENCE_CLAVE: TDateTimeField;
    qryUsuariosFOTO: TBlobField;
    qryUsuariosNOMBRECOMPLETO: TIBStringField;
    qryUsuariosNUMERO: TSmallintField;
    qryUsuariosSTATUS: TIBStringField;
    qryUsuariosTIPO: TSmallintField;
    tblUsuariosNOMBRECOMPLETO: TIBStringField;
    tblTipoUsuario: TIBTable;
    tblTipoUsuarioTIPO: TSmallintField;
    tblTipoUsuarioDESCRIPCION: TIBStringField;
    qryEmpleados: TIBQuery;
    tblUsuariosCODIGO_EMPLEADO: TIntegerField;
    qryUsuariosCODIGO_EMPLEADO: TIntegerField;
    tblUsuariosARCHIVOCONFGWIN: TIBStringField;
    qryUsuariosARCHIVOCONFGWIN: TIBStringField;
    tblOficina: TIBTable;
    tblOficinaCODIGO: TIntegerField;
    tblOficinaDESCRIPCION: TIBStringField;
    ibsqlUpdRegCantCorrida: TIBSQL;
    tblEmpleados: TIBTable;
    dstblEmpleados: TDataSource;
    tblEmpleadosCODIGO: TIntegerField;
    tblEmpleadosCODIGO_CIA: TIntegerField;
    tblEmpleadosNOMBRE: TIBStringField;
    tblEmpleadosAPELLIDO: TIBStringField;
    tblEmpleadosCEDULA: TIBStringField;
    tblEmpleadosFOTO: TBlobField;
    tblEmpleadosPASSPORT: TIBStringField;
    tblEmpleadosCALLE: TIBStringField;
    tblEmpleadosNUM_CASA: TSmallintField;
    tblEmpleadosCIUDAD: TIBStringField;
    tblEmpleadosPAIS: TIBStringField;
    tblEmpleadosTELEF_CASA: TIBStringField;
    tblEmpleadosTELEF_OFICINA: TIBStringField;
    tblEmpleadosCELULAR: TIBStringField;
    tblEmpleadosEMAIL: TIBStringField;
    tblEmpleadosSEXO: TIBStringField;
    tblEmpleadosESTADO_CIVIL: TIBStringField;
    tblEmpleadosTELEF_REFERENCIA: TIBStringField;
    tblEmpleadosNOMBRE_REFERENCIA: TIBStringField;
    tblEmpleadosFECHA_NAC: TDateTimeField;
    tblEmpleadosNACIONALIDAD: TIBStringField;
    tblEmpleadosFECHA_ENTRADA: TDateTimeField;
    tblEmpleadosFECHA_SALIDA: TDateTimeField;
    tblEmpleadosSALARIO: TFloatField;
    tblEmpleadosTIPO_NOMINA: TSmallintField;
    tblEmpleadosTIPO_EMPLEADO: TSmallintField;
    tblEmpleadosDEPTO_EMP: TSmallintField;
    tblEmpleadosSECCION: TSmallintField;
    tblEmpleadosCARGO: TSmallintField;
    tblEmpleadosPAGA_AFP: TSmallintField;
    tblEmpleadosPAGA_TSS: TSmallintField;
    tblEmpleadosSTATUS: TIBStringField;
    tblEmpleadosFECHA_IN: TDateTimeField;
    tblEmpleadosIN_POR: TIBStringField;
    tblEmpleadosFECHA_MOD: TDateTimeField;
    tblEmpleadosMOD_POR: TIBStringField;
    tblOficinaCODIGO_CIUDDAD: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmUsuarios: TdmUsuarios;

implementation

uses UDatModConectar, UGlobal;

{$R *.dfm}

end.
