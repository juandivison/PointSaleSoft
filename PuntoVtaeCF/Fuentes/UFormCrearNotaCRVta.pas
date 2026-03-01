unit UFormCrearNotaCRVta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, RxMemDS, StdCtrls, Grids, DBGrids, RXDBCtrl,
  IBCustomDataSet, IBQuery, WinSkinData, ExtCtrls, Mask, DBCtrls, EditNew;

type
  TfrmCrearNotaCreditoVta = class(TForm)
    rxVenta: TRxMemoryData;
    rxVentaSerie: TIntegerField;
    rxVentaFecha: TDateTimeField;
    rxVentaCant: TFloatField;
    rxVentaPrecio: TCurrencyField;
    rxVentaMontoBruto: TCurrencyField;
    rxVentaDescripcion: TStringField;
    rxVentaDevolucion: TCurrencyField;
    rxVentaMontoNeto: TCurrencyField;
    rxVentaCodUsuario: TIntegerField;
    rxVentaCodArticulo: TIntegerField;
    rxVentaNumeroRecibo: TIntegerField;
    rxVentaCodTexto: TStringField;
    rxVentaNCF: TStringField;
    rxVentaNumeroTrn: TIntegerField;
    rxVentaporc_desc: TFloatField;
    rxVentaItbi: TFloatField;
    rxVentaMontoDescuento: TFloatField;
    rxVentaSerieProd: TStringField;
    rxVentaNumeroFactura: TIntegerField;
    rxVentaInvetariar: TSmallintField;
    rxVentaloteNum: TStringField;
    rxVentaMontoItbisenPrecio: TCurrencyField;
    rxVentaReferencia: TStringField;
    rxVentaNumeroDoc: TIntegerField;
    rxVentaTipoUnidad: TIntegerField;
    rxVentaDescUnidadMedida: TStringField;
    rxVentaItbisExento: TSmallintField;
    rxVentaTipoVenta: TIntegerField;
    rxVentaDescripcionEspecial: TMemoField;
    rxVentaSerieOriginal: TIntegerField;
    rxVentaNumeroTrnOriginal: TIntegerField;
    rxVentaStatus: TStringField;
    rxVentaNumeroCotiza: TIntegerField;
    rxVentaMoneda: TStringField;
    rxVentaMonedaBase: TStringField;
    rxVentaRutaImagen: TStringField;
    rxVentaCostoProducto: TCurrencyField;
    rxVentaglbcodVendedor: TIntegerField;
    rxVentaPorcDescItem: TCurrencyField;
    rxVentaMontoDescItem: TCurrencyField;
    rxVentaRecargo: TCurrencyField;
    rxVentaMontoTranspItbis: TCurrencyField;
    rxVentaMontoItbisRecargo: TCurrencyField;
    rxVentaMontoDesGlobal: TCurrencyField;
    rxVentaIDTasaITBIS: TIntegerField;
    rxVentaMontoItbRecItmConDesc: TCurrencyField;
    rxVentaMontoDescGlbDist: TCurrencyField;
    rxVentamonto_tasa: TCurrencyField;
    RxDBGrid1: TRxDBGrid;
    Button1: TButton;
    qryProductos: TIBQuery;
    qryProductosCODIGO: TIntegerField;
    qryProductosCANTIDAD: TFloatField;
    qryProductosCODIGO_TEXTO: TIBStringField;
    qryProductosPRECIO_MINIMO: TFloatField;
    qryProductosPRECIO: TFloatField;
    qryProductosDESCRIPCION: TIBStringField;
    qryProductosREFERENCIA: TIBStringField;
    qryProductosINVENTARIAR: TSmallintField;
    qryProductosPAGA_ITBI: TSmallintField;
    qryProductosPORC_DESCUENTO: TFloatField;
    qryProductosUNIDAD: TFloatField;
    qryProductosPRECIO_COMPRA: TFloatField;
    qryProductosFECHA_VENCIMIENTO: TDateTimeField;
    qryProductosPRECIO_TIPO_UNIDAD: TFloatField;
    qryProductosTIPO_UNIDAD: TIntegerField;
    qryProductosPRECIOVENTA1: TFloatField;
    qryProductosPRECIOVENTA2: TFloatField;
    qryProductosPRECIOVENTA3: TFloatField;
    qryProductosPRECIOVENTA4: TFloatField;
    qryProductosUSARLEVELPRECIO: TSmallintField;
    qryProductosCIA_KEY: TIntegerField;
    qryProductosPORCITBIS: TFloatField;
    qryProductosFECHA: TDateTimeField;
    qryProductosCODIGO_BARRA: TIBStringField;
    qryProductosTIPO: TIntegerField;
    qryProductosCANTIDAD_REORDEN: TIntegerField;
    qryProductosPRECIO_ANT: TFloatField;
    qryProductosBLCE_CANT_ENTRADA: TFloatField;
    qryProductosBLCE_CANT_SALIDA: TFloatField;
    qryProductosFECHA_ULTIMA_TRN: TDateTimeField;
    qryProductosSTATUS: TIBStringField;
    qryProductosFOTO: TBlobField;
    qryProductosCODIGO_PRECIO: TIBStringField;
    qryProductosDESCRIPCIONADICIONAL: TMemoField;
    qryProductosCOD_MONEDA: TIBStringField;
    dsrxVenta: TDataSource;
    SkinData1: TSkinData;
    rxDatosVtaDet: TRxMemoryData;
    RxDBGrid2: TRxDBGrid;
    dsDatosVtaDet: TDataSource;
    RadioGroup1: TRadioGroup;
    edtMonto: TEditN;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure rxVentaAfterScroll(DataSet: TDataSet);
    procedure RadioGroup1Click(Sender: TObject);
  private
    { Private declarations }
    procedure Sumar;
  public
    procedure CargarDatos;
    procedure AsignarSqlText(campo:String; valor:string; OrderBy : String);
    procedure LlenarDatosVtaDet;
    { Public declarations }
  end;

var
  frmCrearNotaCreditoVta: TfrmCrearNotaCreditoVta;
  sqlAsignado : Boolean;
    _monto : Currency;

implementation

uses UDatModFactura, UGlobal, UFormFacturas;

{$R *.dfm}

{ TfrmCrearNotaCreditoVta }

procedure TfrmCrearNotaCreditoVta.AsignarSqlText(campo, valor, OrderBy: String);
var
  nombProc:string;
begin
  qryProductos.DisableControls;
  if qryProductos.Active then
  qryProductos.Close;
  if GlbVenderDesdeAlmacenP = 1 then
  nombProc:='PROC_INV_VENTA_est'
  else
  nombProc:='PROC_INV_VENTA';
  if (campo = '') then
  begin
    sqlAsignado := True;
    qryProductos.SQL.Text:=
    Format('Select INV.*, tipo_inv.Descripcion Desc_tipoInv From %s(%s) INV, TIPO_INVENTARIO tipo_inv', [nombProc, IntToStr(GlbCodDivInventario)]) +
    ' Where CIA_KEY=:CIAKEY AND inv.tipo = tipo_inv.codigo' +' ORDER BY codigo, tipo,descripcion, Referencia';
  end else
  qryProductos.SQL.Text:=
  Format('Select INV.*,tipo_inv.Descripcion Desc_tipoInv  From %s(%s) INV, TIPO_INVENTARIO tipo_inv ' +
        ' WHERE CIA_KEY=:CIAKEY AND inv.tipo = tipo_inv.codigo AND UPPER(inv.%s) like %s ',[nombProc, IntToStr(GlbCodDivInventario), Campo, Valor]) +
        ' ORDER BY codigo, tipo,descripcion, Referencia';
  qryProductos.Params[0].Value:= glbCia_Key;
  qryProductos.Open;
  
  if (qryProductos.RecordCount = 0) and (campo <> '') then
  begin
    qryProductos.SQL.Text:=
    Format('Select INV.*,tipo_inv.Descripcion Desc_tipoInv  From %s(%s) INV, TIPO_INVENTARIO tipo_inv ' +
        ' WHERE CIA_KEY=:CIAKEY AND inv.tipo = tipo_inv.codigo AND UPPER(inv.%s) like %s ',[nombProc, IntToStr(GlbCodDivInventario), 'codigo_texto', Valor]) +
        ' ORDER BY codigo, tipo,descripcion, Referencia';
    qryProductos.Close;
    qryProductos.Params[0].Value:= glbCia_Key;
    qryProductos.Open;
  end;
  qryProductos.EnableControls;
end;

procedure TfrmCrearNotaCreditoVta.CargarDatos;
var
  xDesc : String;
  x: integer;
begin
  rxDatosVtaDet.Close;
  rxDatosVtaDet.Open;
  if frmConsultaFacturas.RxDBGrid2.SelectedRows.Count > 0 then
  begin
    with frmConsultaFacturas.RxDBGrid2.DataSource.DataSet do
    begin
      For x := 0 to frmConsultaFacturas.RxDBGrid2.SelectedRows.Count-1 do
      begin
        GotoBookmark(Pointer(frmConsultaFacturas.RxDBGrid2.SelectedRows.Items[x]));
        LlenarDatosVtaDet;
        if not qryProductos.Locate('Codigo', dmFactura.qryVentaFacturaDetCODIGO_PROD.Value,[]) then
        begin
          MessageDlg(Format('Codigo producto %s no encontrado, verifique.',
         [dmFactura.qryVentaFacturaDetCODIGO_PROD.AsString]), mtError,[mbOk], 0);
        end;
        
        rxVenta.Append;
        //rxVentaglbcodVendedor.Value := qryClienteCOD_VENDEDOR.Value;
        rxVentaItbi.Value := 0;
        rxVentaNumeroFactura.Value  := dmFactura.qryVentaFacturaDetNUMERO_FACTURA.Value;
        if dmFactura.qryVentaFacturaDetSTATUS_DET.IsNull then
        rxVentaStatus.Value        := 'A' else
        rxVentaStatus.Value        := dmFactura.qryVentaFacturaDetSTATUS_DET.Value;

        rxVentaCodTexto.Value      := qryProductosCODIGO_TEXTO.Value;
        rxVentaCostoProducto.Value := dmfactura.qryVentaFacturadetPrecio_Compra.Value;
        rxVentaCodArticulo.Value   := dmFactura.qryVentaFacturaDetCODIGO_PROD.AsInteger;
        rxVentaSerieOriginal.Value := dmFactura.qryVentaFacturaDetSERIE.Value;
        rxVentaNumeroTrnOriginal.Value := dmFactura.qryVentaFacturaNUMERO.Value;
        rxVentaSerie.Value := dmFactura.qryVentaFacturaDetSERIE.Value;
        rxVentaFecha.Value := dmFactura.qryVentaFacturaFECHA.Value;
        rxVentaMonedaBase.Value :=  GetMonedaProducto(qryProductosCODIGO.Value);

        rxVentamonto_tasa.Value := GlbMontoTasa(rxVentaMonedaBase.Value);

        rxVentaCant.Value  := Abs(dmFactura.qryVentaFacturaDetCANTIDAD.Value);
        rxVentaPrecio.Value:= Abs(dmFactura.qryVentaFacturaDetPRECIO.Value);
        rxVentaporc_desc.Value      := Abs(dmFactura.qryVentaFacturaDetPORC_DESC_DET.Value);

        if dmFactura.qryVentaFacturaDetCODIGO_VENDEDOR.IsNull then
        rxVentaglbcodVendedor.Value := dmFactura.qryVentaFacturaCODIGO_VENDEDOR.Value
        else
        rxVentaglbcodVendedor.Value := dmFactura.qryVentaFacturaDetCODIGO_VENDEDOR.Value;

        rxVentaPorcDescItem.Value   := Abs(dmFactura.qryVentaFacturaDetPORC_DESC_ITEM.Value);
        rxVentaMontoDescItem.Value  := Abs(dmFactura.qryVentaFacturaDetMONTO_DESC_ITEM.Value);
        rxVentaDescripcion.Value := dmFactura.qryVentaFacturaDetDESCRIPCION.Value;
        rxVentaDescripcionEspecial.Value := dmFactura.qryVentaFacturaDetDESCRIPCIONPRODUCTO.Value;
        rxVentaTipoVenta.Value   := dmFactura.qryVentaFacturaDetTIPO_VENTA.Value;
        xDesc := StringReplace(rxVentaDescripcionEspecial.Value, rxVentaDescripcion.Value, '',
                          [rfReplaceAll, rfIgnoreCase]);
        if (Length(xDesc) > 4) then
        rxVentaDescripcionEspecial.Value := xDesc
        else
        rxVentaDescripcionEspecial.Value := '';
        rxVentaItbisExento.Value:=Abs(dmfactura.qryVentaFacturaDetITBIS_EXENTO.Value);// qryProductosPAGA_ITBI.Value;

        rxVentaReferencia.Value := qryProductosREFERENCIA.Value;

        rxVentaInvetariar.Value:= qryProductosINVENTARIAR.Value;

        if GlbcodVendedor > 0 then
        rxVentaCodUsuario.Value := GlbcodVendedor
        else
        rxVentaCodUsuario.Value := VarUsuarioGlb;

        if rxVenta.State In [dsInsert,dsEdit] then
        rxVenta.Post;
      end;
    end;
  end;
end;

procedure TfrmCrearNotaCreditoVta.FormCreate(Sender: TObject);
begin
  rxVenta.Close;
  rxVenta.Open;
  
end;

procedure TfrmCrearNotaCreditoVta.LlenarDatosVtaDet;
var
  x : integer;
begin
  dmFactura.qryVentaFacturaDet.First;
  rxDatosVtaDet.Append;
  for x:=0 to dmFactura.qryVentaFacturaDet.FieldCount - 1 do
      rxDatosVtaDet.FieldByName(dmFactura.qryVentaFacturaDet.Fields[x].FieldName).AsVariant :=
      dmFactura.qryVentaFacturaDet.FieldByName(dmFactura.qryVentaFacturaDet.Fields[x].FieldName).AsVariant;
  rxDatosVtaDet.Post;
end;

procedure TfrmCrearNotaCreditoVta.rxVentaAfterScroll(DataSet: TDataSet);
begin
  rxDatosVtaDet.Locate('serie',rxVentaSerieOriginal.Value,[]);
end;

procedure TfrmCrearNotaCreditoVta.Sumar;
var
  guardarRec : TBookMark;
begin
  guardarRec:= rxVenta.GetBookmark;
  rxVenta.First;
  _monto := 0;
  While Not rxVenta.Eof Do
  begin
    _monto := _monto + rxVentaMontoNeto.Value;
    rxVenta.Next;
  end;
  rxVenta.GotoBookmark(guardarRec);
  rxVenta.FreeBookmark(guardarRec);
end;

procedure TfrmCrearNotaCreditoVta.RadioGroup1Click(Sender: TObject);
begin
  if RadioGroup1.ItemIndex = 1 then
  begin
    edtMonto.Enabled:= True;
    edtMonto.SetFloat(_monto);
  end else
  begin
    edtMonto.SetFloat(0);
    edtMonto.Enabled:= False;
  end;
end;

end.
