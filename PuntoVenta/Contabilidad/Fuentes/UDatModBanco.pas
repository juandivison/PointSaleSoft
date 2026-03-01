unit UDatModBanco;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBTable;

type
  TdmBanco = class(TDataModule)
    tblBancoMaster: TIBDataSet;
    tblBancoDetalle: TIBDataSet;
    tblBancoDetalleSERIE: TFloatField;
    tblBancoDetalleCODIGO: TSmallintField;
    tblBancoDetalleTIPO: TIBStringField;
    tblBancoDetalleCUENTA_BANCO: TIBStringField;
    tblBancoDetalleMONEDA: TIBStringField;
    tblBancoDetalleCUENTA1: TIBStringField;
    tblBancoDetalleCUENTA2: TIBStringField;
    tblBancoDetalleCUENTA3: TIBStringField;
    tblBancoDetalleSTATUS: TIBStringField;
    tblBancoDetalleFECHA_APERTURA: TDateTimeField;
    tblBancoDetalleFECHA_CANCELADA: TDateTimeField;
    tblBancoDetalleCKS_CLASIFICACION: TSmallintField;
    tblBancoMasterCODIGO: TSmallintField;
    tblBancoMasterDESCRIPCION: TIBStringField;
    tblBancoMasterCODIGO_ABR: TIBStringField;
    tblTipoCtaBanco: TIBTable;
    tblTipoCtaBancoCODIGO: TIntegerField;
    tblTipoCtaBancoDESCRIPCION: TIBStringField;
    tblMoneda: TIBTable;
    tblMonedaCODIGO: TIBStringField;
    tblMonedaDESCRIPCION: TIBStringField;
    tblMonedaFECHA_IN: TDateTimeField;
    tblMonedaFECHA_UPCAMPO_FECHA_HORA: TDateTimeField;
    tblMonedaMODIFICADO_POR: TIBStringField;
    tblMonedaSIMBOLO: TIBStringField;
    procedure tblBancoMasterAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmBanco: TdmBanco;

implementation

uses UDatModConectar;

{$R *.dfm}

procedure TdmBanco.tblBancoMasterAfterScroll(DataSet: TDataSet);
begin
  tblBancoDetalle.Close;
  tblBancoDetalle.Params[0].Value:= tblBancoMasterCodigo.Value;
  tblBancoDetalle.Open;
end;

end.
