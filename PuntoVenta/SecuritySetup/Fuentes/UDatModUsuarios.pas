unit UDatModUsuarios;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBTable, IBQuery, IBSQL,
  IBUpdateSQL;

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
    dstblSecPermisos: TDataSource;
    dsqryUsuarios: TDataSource;
    tblTareas: TIBDataSet;
    dstblTareas: TDataSource;
    tblSecPermisos: TIBDataSet;
    tblProcesos: TIBDataSet;
    dstblProcesos: TDataSource;
    tblRoles: TIBDataSet;
    tblSecPermisosPERMISOID: TIntegerField;
    tblSecPermisosPROCESOID: TIntegerField;
    tblSecPermisosUSERID: TIntegerField;
    tblSecPermisosISPERSON: TSmallintField;
    tblSecPermisosSTATUS: TSmallintField;
    qryProcesos: TIBQuery;
    tblProcesosPROCESOID: TIntegerField;
    tblProcesosDESCRIPCION: TIBStringField;
    tblRolesUSERID: TIntegerField;
    tblRolesDESCRIPCION: TIBStringField;
    tblTareasTAREAID: TIntegerField;
    tblTareasPROCESOID: TIntegerField;
    tblTareasDESCRIPCION: TIBStringField;
    dstblRoles: TDataSource;
    qryProcesosPROCESOID: TIntegerField;
    qryProcesosDESCRIPCION: TIBStringField;
    dsqryProcesos: TDataSource;
    qryRoles: TIBQuery;
    qryRolesUSERID: TIntegerField;
    qryRolesDESCRIPCION: TIBStringField;
    dsqryRoles: TDataSource;
    tblSecPermisosTAREAID: TIntegerField;
    qryTareas: TIBQuery;
    qryTareasTAREAID: TIntegerField;
    qryTareasPROCESOID: TIntegerField;
    qryTareasDESCRIPCION: TIBStringField;
    dsqryTareas: TDataSource;
    tblRolUsuario: TIBDataSet;
    dstblRolUsuario: TDataSource;
    tblRolUsuarioID_ROL: TIntegerField;
    tblRolUsuarioID_USUARIO: TIntegerField;
    tblRolUsuarioCODIGO_USER: TIntegerField;
    tblRolUsuarioFECHA_IN: TDateTimeField;
    tblRolUsuarioFECHA_UPDATE: TDateTimeField;
    tblTareasVISIBLE: TSmallintField;
    tblRolLookup: TIBTable;
    tblRolLookupUSERID: TIntegerField;
    tblRolLookupDESCRIPCION: TIBStringField;
    tblRolUsuarioDescripcion: TStringField;
    tblUsuarioLookup: TIBTable;
    tblUsuarioLookupNUMERO: TSmallintField;
    tblUsuarioLookupCODIGO: TIBStringField;
    tblUsuarioLookupCODIGO_EMPLEADO: TIntegerField;
    tblUsuarioLookupNOMBRECOMPLETO: TIBStringField;
    tblRolUsuarioNombreUsuario: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmUsuarios: TdmUsuarios;

implementation

uses UDatModCon, UGlobal;

{$R *.dfm}

end.
