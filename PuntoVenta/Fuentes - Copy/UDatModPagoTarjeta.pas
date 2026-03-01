unit UDatModPagoTarjeta;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBTable, IBQuery;

type
  TdmPagosTarjeta = class(TDataModule)
    tblDetallePagoConTarjeta: TIBDataSet;
    tblDetallePagoConTarjetaNUMERO_CONTRADO: TIntegerField;
    tblDetallePagoConTarjetaTIPO_TARJETA: TSmallintField;
    tblDetallePagoConTarjetaANO_VENCE: TIntegerField;
    tblDetallePagoConTarjetaMES_VENCE: TSmallintField;
    tblDetallePagoConTarjetaMONTOAUTORIZADO: TFloatField;
    tblDetallePagoConTarjetaNUMERO_APROBACION: TIBStringField;
    tblTipoTarjeta: TIBTable;
    tblTipoTarjetaCODIGO: TIntegerField;
    tblTipoTarjetaDESCRIPCION: TIBStringField;
    tblTipoTarjetaLOGO: TBlobField;
    dstbltipotarjeta: TDataSource;
    tblDetallePagoConTarjetaSERIE: TIntegerField;
    tblDetallePagoConTarjetaTIPO: TSmallintField;
    tblProvCobroTarjeta: TIBTable;
    dstblProvCobroTarjeta: TDataSource;
    tblDetallePagoConTarjetaCODIGO_PROVEEDOR: TSmallintField;
    tblDetallePagoConTarjetaTIPO_PAGO: TSmallintField;
    tblDetallePagoConTarjetaFECHA: TDateTimeField;
    tblDetallePagoConTarjetaNUMERO_TARJETA_CRED: TIBStringField;
    tblProvCobroTarjetaCODIGO: TSmallintField;
    tblProvCobroTarjetaDESCRIPCION: TIBStringField;
    tblProvCobroTarjetaCUENTA_BANCO: TIBStringField;
    tblProvCobroTarjetaCODIGO_BANCO: TIntegerField;
    tblTipoPagoContrato: TIBTable;
    IntegerField1: TIntegerField;
    IBStringField1: TIBStringField;
    BlobField1: TBlobField;
    dstblTipoPagoContrato: TDataSource;
    qryTipoPago: TIBQuery;
    qryTipoPagoCODIGO: TSmallintField;
    qryTipoPagoDESCRIPCION: TIBStringField;
    qryTipoPagoORIGEN: TSmallintField;
    qryTipoPagoIFISCAL_TPAGO: TSmallintField;
    dsqryTipoPago: TDataSource;
    tblDetallePagos: TIBDataSet;
    tblDetallePagosSERIE: TIntegerField;
    tblDetallePagosFECHA: TDateTimeField;
    tblDetallePagosTIPO_TARJETA: TSmallintField;
    tblDetallePagosNUMERO_TARJETA_CRED: TIBStringField;
    tblDetallePagosANO_VENCE: TIntegerField;
    tblDetallePagosMES_VENCE: TSmallintField;
    tblDetallePagosMONTO_PAGADO: TFloatField;
    tblDetallePagosNUMERO_APROBACION: TIBStringField;
    tblDetallePagosTIPO: TSmallintField;
    tblDetallePagosCODIGO_PROVEEDOR: TSmallintField;
    tblDetallePagosTIPO_PAGO: TSmallintField;
    tblDetallePagosNUMERO_CHEQUE: TIntegerField;
    tblDetallePagosCOD_BANCO_CHEQUE: TIntegerField;
    tblDetallePagosSERIE_TRN: TIntegerField;
    tblDetallePagosAREA_TRANS: TSmallintField;
    tblDetallePagosNUMERO_CUPON: TIntegerField;
    tblDetallePagosPAGO: TSmallintField;
    dstblDetallePagos: TDataSource;
    tblDetPagosRevisar: TIBDataSet;
    tblDetallePagosGLBNUMVTAPOS: TIntegerField;
    procedure tblDetallePagoConTarjetaBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmPagosTarjeta: TdmPagosTarjeta;

implementation

uses UDatModConectar, uglobal;

{$R *.dfm}

procedure TdmPagosTarjeta.tblDetallePagoConTarjetaBeforePost(
  DataSet: TDataSet);
begin
  if tbldetallepagocontarjeta.State = dsInsert then
  tblDetallePagoConTarjetaserie.value := FsqlMaxNumero('DETALLE_PAGO_TARJETA','Serie');
end;

end.
