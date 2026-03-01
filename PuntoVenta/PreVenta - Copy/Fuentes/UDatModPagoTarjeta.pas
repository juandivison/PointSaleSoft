unit UDatModPagoTarjeta;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBTable;

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
    tblTipoPagoContrato: TIBTable;
    IntegerField1: TIntegerField;
    IBStringField1: TIBStringField;
    BlobField1: TBlobField;
    dstblTipoPagoContrato: TDataSource;
    tblProvCobroTarjeta: TIBTable;
    dstblProvCobroTarjeta: TDataSource;
    tblDetallePagoConTarjetaCODIGO_PROVEEDOR: TSmallintField;
    tblDetallePagoConTarjetaTIPO_PAGO: TSmallintField;
    tblDetallePagoConTarjetaFECHA: TDateTimeField;
    tblDetallePagoConTarjetaNUMERO_TARJETA_CRED: TIBStringField;
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
