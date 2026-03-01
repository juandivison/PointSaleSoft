unit UDatosVentas;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBUpdateSQL, IBQuery, IBTable,
  dialogs, IBStoredProc, IBSQL;

type
  TdmVentas = class(TDataModule)
    tblVentasMast: TIBDataSet;
    tblVentasDetalle: TIBDataSet;
    tblVentasMastNUMERO: TIntegerField;
    tblVentasMastFECHA: TDateTimeField;
    tblVentasMastCODIGO_CTE: TIntegerField;
    tblVentasMastOBSERVACION: TIBStringField;
    tblVentasMastMONEDA: TIBStringField;
    tblVentasMastVALOR_TOTAL_DET: TFloatField;
    tblVentasMastSTATUS: TIBStringField;
    tblVentasMastFECHA_IN: TDateTimeField;
    tblVentasMastIN_POR: TIBStringField;
    tblVentasMastFECHA_MOD: TDateTimeField;
    tblVentasMastMOD_POR: TIBStringField;
    tblVentasDetalleSERIE: TIntegerField;
    tblVentasDetalleNUMERO: TIntegerField;
    tblVentasDetalleCODIGO_BARRA: TIBStringField;
    tblVentasDetalleDESCRIPCION: TIBStringField;
    tblVentasDetallePRECIO: TFloatField;
    tblVentasDetallePORC_DESC_DET: TFloatField;
    tblVentasDetalleITBI_DET: TFloatField;
    tblVentasDetalleVALOR_SERVICIO_DET: TFloatField;
    tblVentasDetalleVALOR_TOTAL_DET: TFloatField;
    tblVentasDetalleNUM_FACTURA: TFloatField;
    tblVentasDetalleSTATUS_DET: TIBStringField;
    tblVentasDetalleFECHA_IN: TDateTimeField;
    tblVentasDetalleIN_POR: TIBStringField;
    tblVentasDetalleFECHA_MOD: TDateTimeField;
    tblVentasDetalleMOD_POR: TIBStringField;
    dsVentasDetalle: TDataSource;
    dsVentasMast: TDataSource;
    IBUpdateSQL2: TIBUpdateSQL;
    qryClientes: TIBQuery;
    dsqryClientes: TDataSource;
    qryClientesCODIGO_CTE: TIntegerField;
    qryClientesNOMBRE_CTE: TIBStringField;
    qryitbi: TIBQuery;
    dsqryitbi: TDataSource;
    qryitbiFECHA_INI: TDateTimeField;
    qryitbiFECHA_FIN: TDateTimeField;
    qryitbiPORCIENTO: TFloatField;
    qryitbiOBSERVACIONES: TIBStringField;
    qryitbiSTATUS: TIBStringField;
    tblDoc_tran_cxc: TIBTable;
    dstblDoc_tran_cxc: TDataSource;
    tblDoc_tran_cxcCODIGO: TSmallintField;
    tblDoc_tran_cxcCODIGO_ABR: TIBStringField;
    tblDoc_tran_cxcDESCRIPCION: TIBStringField;
    TblFormaPago: TIBTable;
    dsTblFormaPago: TDataSource;
    TblFormaPagoCODIGO: TSmallintField;
    TblFormaPagoDESCRIPCION: TIBStringField;
    IBUpdateSQL1: TIBUpdateSQL;
    tblVentasMastFORMA_PAGO: TSmallintField;
    qryClientesCIUDAD: TIBStringField;
    qryClientesDIRECCION_CONT: TIBStringField;
    qryClientesNOMBRE_FACTURAR: TIBStringField;
    qryClientesPAIS: TIBStringField;
    qryClientesTELEF_CONTACTO: TIBStringField;
    qryClientesFOTO: TBlobField;
    GenNumFactura: TIBSQL;
    tblVentasMastNUMERO_FACTURA: TIntegerField;
    tblVentasDetalleCANTIDAD: TFloatField;
    IBStoredProc1: TIBStoredProc;
    tblVentasMastCODIGO_VENDEDOR: TIntegerField;
    TblFormaPagoORIGEN: TSmallintField;
    tblVentasMastNUMERO_DOC_PAGO: TIBStringField;
    tblVentasDetalleCANT_REGRESO: TFloatField;
    tblVentasDetalleCANT_PROMO: TFloatField;
    tblVentasDetalleMONTO_DIETA: TFloatField;
    tblVentasDetalleMONTO_AJUSTE: TFloatField;
    qryClientesRNC_NUMERO: TIBStringField;
    tblVentasDetalleCODIGO_PROD: TIBStringField;
    qryProveedor: TIBQuery;
    IntegerField1: TIntegerField;
    IBStringField1: TIBStringField;
    IBStringField2: TIBStringField;
    IBStringField3: TIBStringField;
    IBStringField4: TIBStringField;
    IBStringField5: TIBStringField;
    IBStringField6: TIBStringField;
    IBStringField7: TIBStringField;
    procedure tblVentasDetalleBeforePost(DataSet: TDataSet);
    procedure tblVentasMastAfterScroll(DataSet: TDataSet);
    procedure tblVentasMastAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
    function GeneraNumFactura:integer;
  public
    { Public declarations }
  end;

var
  dmVentas: TdmVentas;

implementation

uses UDatModConectar;

{$R *.dfm}

procedure TdmVentas.tblVentasDetalleBeforePost(DataSet: TDataSet);
begin
  if tblVentasMast.State in [dsInsert] then
  tblVentasMast.Post;
end;

procedure TdmVentas.tblVentasMastAfterScroll(DataSet: TDataSet);
begin
  if tblVentasDetalle.State In [dsInactive, dsBrowse] then
  begin
    tblVentasDetalle.Close;
    tblVentasDetalle.Params[0].Value:= tblVentasMastNUMERO.Value;
    tblVentasDetalle.Open;
  end;
end;

function TdmVentas.GeneraNumFactura: integer;
begin
  dmVentas.GenNumFactura.ExecQuery;
  if dmVentas.GenNumFactura.Open then
  try
    Result:=dmVentas.GenNumFactura.Fields[0].AsInteger;
  finally
  dmventas.GenNumFactura.Close;
  end;
end;

procedure TdmVentas.tblVentasMastAfterInsert(DataSet: TDataSet);
begin
  dmVentas.tblVentasMastnumero_factura.Value :=GeneraNumFactura;//funcion
end;

end.
