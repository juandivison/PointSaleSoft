unit UDatModUsuarios;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBTable, IBQuery, IBStoredProc;

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
    procMantRegDet: TIBStoredProc;
    stpBuscarPermisosOLD: TIBStoredProc;
    stpBuscarPermisos: TIBQuery;
    stpBuscarPermisosPROCESOID: TIntegerField;
    stpBuscarPermisosTAREAID: TIntegerField;
    stpBuscarPermisosSTATUS: TIntegerField;
    stpBuscarPermisosVISIBLE: TSmallintField;
    stpBuscarPermisosISPERSON: TIntegerField;
    stpBuscarPermisosUSERID: TIntegerField;
    qryRoles: TIBQuery;
    qryRolesID_ROL: TIntegerField;
    qryRolesID_USUARIO: TIntegerField;
    tblVendedores: TIBDataSet;
    tblVendedoresCODIGO: TIntegerField;
    tblVendedoresFOTO: TBlobField;
    tblVendedoresNOMBRE: TIBStringField;
    tblVendedoresDIRECCION: TIBStringField;
    tblVendedoresTELEFONO: TIBStringField;
    tblVendedoresCELULAR: TIBStringField;
    tblVendedoresSTATUS: TIBStringField;
    tblVendedoresEMAIL: TIBStringField;
    tblVendedoresWEBSITE: TIBStringField;
    tblVendedoresPAIS: TIBStringField;
    tblVendedoresCIUDAD: TIBStringField;
    tblVendedoresCEDULA: TIBStringField;
    tblVendedoresREFERENCIA: TIBStringField;
    tblVendedoresTELEF_REFERENCIA: TIBStringField;
    tblVendedoresOTRO_TELEFONO: TIBStringField;
    tblVendedoresAPODO: TIBStringField;
    tblVendedoresINSERTADO_POR: TIBStringField;
    tblVendedoresFECHA_INSERTADO: TDateTimeField;
    tblVendedoresFECHA_MOD: TDateTimeField;
    tblVendedoresMODI_POR: TIBStringField;
    dstblVendedores: TDataSource;
    tblOficina: TIBTable;
    dstblEmpleados: TDataSource;
    tblOficinaCODIGO: TIntegerField;
    tblOficinaDESCRIPCION: TIBStringField;
    tblOficinaCODIGO_CIUDDAD: TIntegerField;
    qryEmpleadosCODIGO: TIntegerField;
    qryEmpleadosNOMBRE: TIBStringField;
    dstblOficina: TDataSource;
    IBTable1: TIBTable;
    IntegerField1: TIntegerField;
    IBStringField1: TIBStringField;
    IntegerField2: TIntegerField;
    qryProcesos: TIBQuery;
    qryProcesosPROCESOID: TIntegerField;
    tblCiudad: TIBTable;
    tblCiudadCODIGO: TIntegerField;
    tblCiudadDESCRIPCION: TIBStringField;
    tblCiudadVALOR: TFloatField;
    tblCiudadSTATUS: TIBStringField;
    dstblCiudad: TDataSource;
    qryEmpVentas: TIBQuery;
    qryEmpVentasCODIGO: TIntegerField;
    qryEmpVentasNOMBRE: TIBStringField;
    qryEmpVentasDESC_CARGO: TIBStringField;
    qryEmpleadosDESC_CARGO: TIBStringField;
    qryAlmacenesInv: TIBQuery;
    qryAlmacenesInvINVENTARIO_ID: TIntegerField;
    qryAlmacenesInvDESCRIPCION: TIBStringField;
    qryAlmacenesInvSTATUS: TIBStringField;
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
