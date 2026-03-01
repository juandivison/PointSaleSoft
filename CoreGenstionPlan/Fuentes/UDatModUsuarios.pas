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
