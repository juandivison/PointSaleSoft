unit UDatmodAdm;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBTable;

type
  TdtAdm = class(TDataModule)
    tClasif_cuentas: TIBTable;
    tClasif_cuentasCODIGO: TIntegerField;
    tClasif_cuentasDESCRIPCION: TIBStringField;
    tClasif_cuentasSTATUS: TIBStringField;
    tClasif_cuentasTIPOSERVICIO: TIntegerField;
    tTipoClase_Ctas_adm: TIBTable;
    tClase_cuentas_adm: TIBTable;
    dstClasif_cuentas: TDataSource;
    dstTipoClase_Ctas_adm: TDataSource;
    dstClase_cuentas_adm: TDataSource;
    tDgIIAnexoB: TIBTable;
    dtDgIIAnexoB: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtAdm: TdtAdm;

implementation

uses UDatModConectar;

{$R *.dfm}

end.
