unit UDatModLavanderia;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBTable, IBQuery;

type
  TdmLavanderia = class(TDataModule)
    tblLAV_ORDEN: TIBDataSet;
    tblLAV_PRENDA: TIBDataSet;
    tblLAV_PRENDAID: TIntegerField;
    tblLAV_PRENDAID_ORDEN: TIntegerField;
    tblLAV_PRENDACODIGO_PRODUCTO: TIntegerField;
    tblLAV_PRENDACANTIDAD: TIntegerField;
    tblLAV_PRENDAPRECIO_UNITARIO: TFloatField;
    tblLAV_PRENDAMONTO_BASE: TFloatField;
    tblLAV_PRENDAMONTO_ITBIS: TFloatField;
    tblLAV_PRENDATOTAL_LINEA: TFloatField;
    tblLAV_PRENDAETAPA_ACTUAL: TIBStringField;
    tblLAV_PRENDACODIGO_BARRA: TIBStringField;
    tblLAV_ORDENID: TIntegerField;
    tblLAV_ORDENID_CLIENTE: TIntegerField;
    tblLAV_ORDENFECHA_ENTRADA: TDateTimeField;
    tblLAV_ORDENFECHA_ENTREGA: TDateTimeField;
    tblLAV_ORDENESTADO: TIBStringField;
    tblLAV_ORDENAPLICA_ITBIS: TSmallintField;
    tblLAV_ORDENID_OPERADOR: TSmallintField;
    tblLAV_ORDENNOTAS: TIBStringField;
    tblLAV_ORDENTOTAL: TFloatField;
    tblLAV_HISTORIAL: TIBDataSet;
    tblLAV_HISTORIALID: TIntegerField;
    tblLAV_HISTORIALID_PRENDA: TIntegerField;
    tblLAV_HISTORIALETAPA: TIBStringField;
    tblLAV_HISTORIALFECHA_HORA: TDateTimeField;
    tblLAV_HISTORIALUSUARIO_ID: TSmallintField;
    tbltasa_itbis: TIBTable;
    dstbltasa_itbis: TDataSource;
    dstblLAV_ORDEN: TDataSource;
    dstblLAV_HISTORIAL: TDataSource;
    dstblLAV_PRENDA: TDataSource;
    tbltasa_itbisIDTASAITBIS: TSmallintField;
    tbltasa_itbisDESCRIPCION: TIBStringField;
    tbltasa_itbisPORCIENTO: TFloatField;
    tbltasa_itbisSIMBOLO_TASA: TIBStringField;
    qryLavServicios: TIBQuery;
    qryLavServiciosID: TIntegerField;
    qryLavServiciosDESCRIPCION: TIBStringField;
    dsqryLavServicios: TDataSource;
    qryInvLookup: TIBQuery;
    dsqryInvLookup: TDataSource;
    qryInvLookupBLCE_CANT_ENTRADA: TFloatField;
    qryInvLookupBLCE_CANT_SALIDA: TFloatField;
    qryInvLookupCANTIDAD: TFloatField;
    qryInvLookupCODIGO: TIntegerField;
    qryInvLookupDESCRIPCION: TIBStringField;
    qryInvLookupFECHA_ULTIMA_TRN: TDateTimeField;
    qryInvLookupPRECIO: TFloatField;
    qryInvLookupCOD_MONEDA: TIBStringField;
    qryInvLookupPRECIO_COMPRA: TFloatField;
    qryInvLookupPRECIO_ANT: TFloatField;
    tblLAV_PRENDAPRENDA_SERVICIO: TStringField;
    tblLAV_PRENDA_SERVICIO: TIBDataSet;
    dslbllav_prendaserv: TDataSource;
    tblLAV_PRENDA_SERVICIOID: TIntegerField;
    tblLAV_PRENDA_SERVICIOID_PRENDA: TIntegerField;
    tblLAV_PRENDA_SERVICIOID_SERVICIO: TIntegerField;
    tblLAV_PRENDA_SERVICIODESCSERVICIO: TIBStringField;
    tblLAV_ORDENHORA_ENTRADA: TDateTimeField;
    tblLAV_ORDENHORA_ENTREGA: TDateTimeField;
    qryreportOrdenLavanderia: TIBQuery;
    qryreportOrdenLavanderiaID_ORDEN: TIntegerField;
    qryreportOrdenLavanderiaFECHA_ENTRADA: TDateTimeField;
    qryreportOrdenLavanderiaFECHA_ENTREGA: TDateTimeField;
    qryreportOrdenLavanderiaTOTAL: TFloatField;
    qryreportOrdenLavanderiaAPLICA_ITBIS: TSmallintField;
    qryreportOrdenLavanderiaESTADO: TIBStringField;
    qryreportOrdenLavanderiaNOTAS: TIBStringField;
    qryreportOrdenLavanderiaNOMBRE_CLIENTE: TIBStringField;
    qryreportOrdenLavanderiaTELEF_CONTACTO: TIBStringField;
    qryreportOrdenLavanderiaDIRECCION_CONT: TIBStringField;
    qryreportOrdenLavanderiaNOMBRE_OPERADOR: TIBStringField;
    qryreportOrdenLavanderiaID_PRENDA: TIntegerField;
    qryreportOrdenLavanderiaCODIGO_PRODUCTO: TIntegerField;
    qryreportOrdenLavanderiaNOMBRE_PRODUCTO: TIBStringField;
    qryreportOrdenLavanderiaCANTIDAD: TIntegerField;
    qryreportOrdenLavanderiaPRECIO_UNITARIO: TFloatField;
    qryreportOrdenLavanderiaMONTO_BASE: TFloatField;
    qryreportOrdenLavanderiaMONTO_ITBIS: TFloatField;
    qryreportOrdenLavanderiaTOTAL_LINEA: TFloatField;
    qryMembrete: TIBQuery;
    qryMembreteCODIGO_CIA: TIntegerField;
    qryMembreteLINE_NO: TIntegerField;
    qryMembreteLINEA1: TIBStringField;
    qryMembreteLINEA2: TIBStringField;
    qryMembreteLINEA3: TIBStringField;
    qryMembreteLINEA4: TIBStringField;
    qryMembreteLINEA5: TIBStringField;
    qryreportOrdenLavanderiaHORA_ENTRADA: TDateTimeField;
    qryreportOrdenLavanderiaHORA_ENTREGA: TDateTimeField;
    qryreportOrdenLavanderiaCANTPIEZAS: TIntegerField;
    qryServOrdenPrenda: TIBQuery;
    qryServOrdenPrendaDESCSERVICIO: TIBStringField;
    qryrepstickersprendas: TIBQuery;
    qryrepstickersprendasID_ORDEN: TIntegerField;
    qryrepstickersprendasCANTPIEZAS: TIntegerField;
    qryrepstickersprendasIDSERIEORDEN: TIntegerField;
    qryrepstickersprendasFECHA_ENTREGA: TDateTimeField;
    qryrepstickersprendasHORA_ENTREGA: TDateTimeField;
    qryrepstickersprendasNOMBRE_OPERADOR: TIBStringField;
    qryrepstickersprendasCODIGO_PRODUCTO: TIntegerField;
    qryrepstickersprendasNOMBRE_PRODUCTO: TIBStringField;
    qryrepstickersprendasCANTIDAD_REPETIDA: TIntegerField;
    tblLAV_PAGO: TIBDataSet;
    tblLAV_PAGOID: TIntegerField;
    tblLAV_PAGOID_ORDEN: TIntegerField;
    tblLAV_PAGOFECHA_PAGO: TDateTimeField;
    tblLAV_PAGOMONTO: TFloatField;
    tblLAV_PAGOMETODO_PAGO: TIBStringField;
    tblLAV_PAGOOBSERVACIONES: TIBStringField;
    tblLAV_PAGOUSUARIO_ID: TSmallintField;
    qryPrendasEntrega: TIBQuery;
    qryOrdenEntrega: TIBQuery;
    qryOrdenEntregaID_ORDEN: TIntegerField;
    qryOrdenEntregaID_CLIENTE: TIntegerField;
    qryOrdenEntregaFECHA_ENTRADA: TDateTimeField;
    qryOrdenEntregaFECHA_ENTREGA: TDateTimeField;
    qryOrdenEntregaHORA_ENTRADA: TDateTimeField;
    qryOrdenEntregaHORA_ENTREGA: TDateTimeField;
    qryOrdenEntregaESTADO: TIBStringField;
    qryOrdenEntregaTOTAL: TFloatField;
    qryOrdenEntregaSALDO: TFloatField;
    qryOrdenEntregaNOMBRE_CLIENTE: TIBStringField;
    procedure tblLAV_ORDENAfterScroll(DataSet: TDataSet);
    procedure tblLAV_PRENDAAfterScroll(DataSet: TDataSet);
    procedure qryreportOrdenLavanderiaAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmLavanderia: TdmLavanderia;

implementation
  uses UDatModConectar, ugLOBAL;
{$R *.dfm}

procedure TdmLavanderia.tblLAV_ORDENAfterScroll(DataSet: TDataSet);
begin
  tblLAV_PRENDA.Close;
  tblLAV_PRENDA.params[0].Value:= tblLAV_ORDENID.Value;
  tblLAV_PRENDA.Open;
end;

procedure TdmLavanderia.tblLAV_PRENDAAfterScroll(DataSet: TDataSet);
begin
  tblLAV_PRENDA_SERVICIO.Close;
  tblLAV_PRENDA_SERVICIO.Params[0].Value:=tblLAV_PRENDAID.Value;
  tblLAV_PRENDA_SERVICIO.open;
end;

procedure TdmLavanderia.qryreportOrdenLavanderiaAfterScroll(
  DataSet: TDataSet);
begin
  qryServOrdenPrenda.Close;
  qryServOrdenPrenda.Params[0].Value:= qryreportOrdenLavanderiaID_PRENDA.Value;
  qryServOrdenPrenda.Open;
end;

end.
