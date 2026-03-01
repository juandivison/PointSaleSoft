unit UDatModDescuentosNom;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBTable, IBQuery;

type
  TdmDescuentosNom = class(TDataModule)
    tblDescNomina: TIBDataSet;
    tblDescNominaCODIGO_DESCUENTO: TSmallintField;
    tblDescNominaFECHA_INICIAL: TDateTimeField;
    tblDescNominaFECHA_FINAL: TDateTimeField;
    tblDescNominaPORCIENTO_EMP: TFloatField;
    tblDescNominaPORCIENTO_EMPLEADOR: TFloatField;
    tblDescNominaDESCRIPCION: TIBStringField;
    tblDescNominaSTATUS: TIBStringField;
    tblTipoDescuento: TIBTable;
    dstblTipoDescuento: TDataSource;
    tblTipoNomina: TIBTable;
    tblTipoNominaCODIGO: TIntegerField;
    tblTipoNominaDESCRIPCION: TIBStringField;
    dsTipoNomina: TDataSource;
    qryTipoDescNom: TIBQuery;
    qryTipoDescNomTIPO_NOMINA: TIntegerField;
    qryTipoDescNomCODIGO_DESCUENTO: TSmallintField;
    qryTipoDescNomFECHA_INICIAL: TDateTimeField;
    qryTipoDescNomFECHA_FINAL: TDateTimeField;
    qryTipoDescNomPORCIENTO_EMP: TFloatField;
    qryTipoDescNomPORCIENTO_EMPLEADOR: TFloatField;
    qryTipoDescNomDESCRIPCION: TIBStringField;
    qryTipoDescNomSTATUS: TIBStringField;
    tblDescNominaTIPO_NOMINA: TIntegerField;
    tblTipoDescuentoCODIGO: TIntegerField;
    tblTipoDescuentoDESCRIPCION: TIBStringField;
    qryFechasTipoDes: TIBQuery;
    qryFechasTipoDesFECHA_INICIAL: TDateTimeField;
    qryFechasTipoDesFECHA_FINAL: TDateTimeField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmDescuentosNom: TdmDescuentosNom;

implementation

uses UDatModConectar;

{$R *.dfm}

end.
