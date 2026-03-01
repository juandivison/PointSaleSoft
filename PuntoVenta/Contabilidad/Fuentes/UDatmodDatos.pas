unit UDatmodDatos;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBQuery;

type
  TdmDatos = class(TDataModule)
    qryTrnCierreAnio: TIBDataSet;
    qryTrnCierreAnioNUMERO: TIntegerField;
    qryTrnCierreAnioSERIE: TIntegerField;
    qryTrnCierreAnioFECHA: TDateTimeField;
    qryTrnCierreAnioTIPO_DOC: TIntegerField;
    qryTrnCierreAnioNUM_DOC: TIntegerField;
    qryTrnCierreAnioCUENTA1: TIBStringField;
    qryTrnCierreAnioCUENTA2: TIBStringField;
    qryTrnCierreAnioCUENTA3: TIBStringField;
    qryTrnCierreAnioDESCRIPCION_TRN: TIBStringField;
    qryTrnCierreAnioDEBITO_TRN: TFloatField;
    qryTrnCierreAnioCREDITO_TRN: TFloatField;
    qryTrnCierreAnioSTATUS_APLICADA: TIBStringField;
    qryTrnCierreAnioSTATUS: TIBStringField;
    qryTrnCierreAnioIN_POR: TIBStringField;
    qryTrnCierreAnioFECHA_IN: TDateTimeField;
    qryTrnCierreAnioMOD_POR: TIBStringField;
    qryTrnCierreAnioFECHA_MOD: TDateTimeField;
    dtqryTrnCierreAnio: TDataSource;
    qryViewCuentas: TIBQuery;
    qryBlcMesCta: TIBQuery;
    procedure qryBlcMesCtaFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    STATUS_CIEA_FILTER_V : String;
  end;

var
  dmDatos: TdmDatos;

implementation

uses UDatModConectar;

{$R *.dfm}

procedure TdmDatos.qryBlcMesCtaFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept:=DataSet['STATUS_CIEA'] = STATUS_CIEA_FILTER_V;
end;

end.
