unit UFormProcVentas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, RXDBCtrl, DBCtrls,
  Printers, DB, Mask, RxMemDS, EditNew, IBCustomDataSet, IBQuery, WinSkinData, Menus,
  ShellApi, RXCtrls, IBStoredProc, IBSQL, RxLookup;


type
  TfrmProcVentas = class(TForm)
    SkinData1: TSkinData;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBText1: TDBText;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    RxSpeedButton5: TRxSpeedButton;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Shape4: TShape;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText5: TDBText;
    DBText7: TDBText;
    Label16: TLabel;
    DBText6: TDBText;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    lblProcDev: TLabel;
    RxLabel1: TRxLabel;
    RxLabel2: TRxLabel;
    Label21: TLabel;
    Label22: TLabel;
    lblInventario: TLabel;
    Label23: TLabel;
    rxLabelVence: TRxLabel;
    RxDBGrid3: TRxDBGrid;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn16: TBitBtn;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    RxDBGrid1: TRxDBGrid;
    DBEdit3: TDBEdit;
    Edit1: TEdit;
    edtCodigo: TEditN;
    CheckBox1: TCheckBox;
    BitBtn6: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    Panel2: TPanel;
    RxDBGrid2: TRxDBGrid;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    RxDBLookupCombo1: TRxDBLookupCombo;
    DBEdit6: TDBEdit;
    edtReferencia: TEditN;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;
    edtObservacion: TEdit;
    chkExento: TCheckBox;
    BitBtn15: TBitBtn;
    chkDisplay: TCheckBox;
    SecretPanel1: TSecretPanel;
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
    DataSource1: TDataSource;
    qryProductos: TIBQuery;
    qryProductosCODIGO: TIntegerField;
    qryProductosCODIGO_TEXTO: TIBStringField;
    qryProductosCANTIDAD: TFloatField;
    qryProductosPRECIO_MINIMO: TFloatField;
    qryProductosPRECIO: TFloatField;
    qryProductosDESCRIPCION: TIBStringField;
    qryProductosREFERENCIA: TIBStringField;
    qryProductosINVENTARIAR: TSmallintField;
    qryProductosPAGA_ITBI: TSmallintField;
    SkinData2: TSkinData;
    PopupMenu1: TPopupMenu;
    MaestroCliente1: TMenuItem;
    Cotizar1: TMenuItem;
    Inventario1: TMenuItem;
    LectorCodBarra1: TMenuItem;
    CuadreCaja1: TMenuItem;
    ImprimirRecibo1: TMenuItem;
    NotaDebito1: TMenuItem;
    NotaCrdito1: TMenuItem;
    Devolucin1: TMenuItem;
    ReImprimirRecibo1: TMenuItem;
    NCFSinValorFiscal1: TMenuItem;
    MostrarVistaproductos1: TMenuItem;
    NoGenerarNCF1: TMenuItem;
    ImprimirLabel1: TMenuItem;
    BuscarCliente1: TMenuItem;
    NoMostrarProdVencidos1: TMenuItem;
    Ayuda1: TMenuItem;
    ipStpInsertVentMast: TIBStoredProc;
    ibStpInsertVentaDet: TIBStoredProc;
    ipStpInsertCotizaMast: TIBStoredProc;
    ibStpInsertCotizaDet: TIBStoredProc;
    dsqryInventario: TDataSource;
    qryInventario: TIBQuery;
    qryInventarioDESCRIPCION: TIBStringField;
    qryInventarioPRECIO: TFloatField;
    qryInventarioPAGA_ITBI: TSmallintField;
    qryInventarioDESC_TIPOINV: TIBStringField;
    qryInventarioTIPO: TIntegerField;
    qryInventarioPORC_DESCUENTO: TFloatField;
    qryInventarioCODIGO_TEXTO: TIBStringField;
    qryInventarioCANTIDAD: TFloatField;
    qryInventarioPRECIO_MINIMO: TFloatField;
    qryInventarioINVENTARIAR: TSmallintField;
    qryInventarioCODIGO: TIntegerField;
    ibStpActualizaInvProd: TIBStoredProc;
    Totales: TRxMemoryData;
    TotalesSubTotal: TFloatField;
    Totalesitbis: TFloatField;
    Totalesmontodesc: TFloatField;
    Totalestotalneto: TFloatField;
    Totalesmontorecibido: TFloatField;
    Totalesdevolucion: TFloatField;
    TotalesCodCliente: TIntegerField;
    TotalesNombreCliente: TStringField;
    TotalesDireccion: TStringField;
    TotalesTelefono: TStringField;
    TotalesPorcDesAdicional: TFloatField;
    TotalesMontoDescAdicional: TFloatField;
    Totalesncf_numero: TStringField;
    TotalesMontoInteres: TCurrencyField;
    TotalesPorcientoInteres: TFloatField;
    TotalesqrLabelNcfDesc: TStringField;
    TotalesRnc_Numero: TStringField;
    dsTotales: TDataSource;
    DataSource2: TDataSource;
    rxSolDatoscte: TRxMemoryData;
    rxSolDatoscteNombre: TStringField;
    rxSolDatoscteDireccion1: TStringField;
    rxSolDatoscteDireccion2: TStringField;
    rxSolDatoscteCedula: TStringField;
    rxSolDatoscteCelular: TStringField;
    rxSolDatoscteSector: TStringField;
    rxSolDatoscteCiudad: TStringField;
    rxSolDatoscteApodo: TStringField;
    rxSolDatoscteTelefono: TStringField;
    rxSolDatoscteOtraPersona: TStringField;
    rxSolDatosctencfDescripcion: TStringField;
    qryProdSerie: TIBQuery;
    qryProdSerieCODIGO: TIntegerField;
    qryProdSerieSERIE: TIBStringField;
    qryProdSerieSTATUS: TIBStringField;
    qryCliente: TIBQuery;
    qryClienteCODIGO_CTE: TIntegerField;
    qryClienteNOMBRE_CTE: TIBStringField;
    qryClienteNOMBRE_ABREV: TIBStringField;
    qryClienteNOMBRE_FACTURAR: TIBStringField;
    qryClienteDIRECCION_CONT: TIBStringField;
    qryClienteTELEF_CONTACTO: TIBStringField;
    qryClienteCIUDAD: TIBStringField;
    qryClienteRNC: TIBStringField;
    qryClienteRNC_NUMERO: TIBStringField;
    qryClienteCEDULA: TIBStringField;
    qryClientePRECIO_ID: TIntegerField;
    qryClienteLIMITE_CREDITO: TFloatField;
    dsqryCliente: TDataSource;
    dstablaPropietario: TDataSource;
    tablaPropietario: TRxMemoryData;
    tablaPropietarioCodigoPropietario: TIntegerField;
    stpProcBuscarUltNum: TIBStoredProc;
    tblDatosVentaVehiculos: TIBDataSet;
    tblDatosVentaVehiculosNUM_SERIE: TIntegerField;
    tblDatosVentaVehiculosMARCA: TIBStringField;
    tblDatosVentaVehiculosMODELO: TIBStringField;
    tblDatosVentaVehiculosPLACA: TIBStringField;
    tblDatosVentaVehiculosMONTO_INICIAL: TFloatField;
    tblProductoSerie: TIBDataSet;
    tblProductoSerieCODIGO: TIntegerField;
    tblProductoSerieSERIE: TIBStringField;
    tblProductoSerieSTATUS: TIBStringField;
    ibstpUpdateLote: TIBStoredProc;
    ibstpProcSecuencia: TIBStoredProc;
    stpMantInvAlmacen: TIBStoredProc;
    qryClasifPrecio: TIBQuery;
    qryClasifPrecioCOD_PRODUCTO: TIntegerField;
    qryClasifPrecioPRECIO_ID: TIntegerField;
    qryClasifPrecioPRECIO_VENTA: TFloatField;
    ibsqlBceCxcCte: TIBSQL;
    qryVence: TIBQuery;
    qryVenceCODIGO: TIntegerField;
    qryVenceLOTE_NUM: TIBStringField;
    qryVenceCODIGO_PROV: TIntegerField;
    qryVenceCANT_IN: TIntegerField;
    qryVenceCANT_OUT: TIntegerField;
    qryVenceFECHA_VENCIMIENTO: TDateTimeField;
    qryVenceNOMBRE_PROVEEDOR: TIBStringField;
    qryVenceDESCRIPCION_PRODUCTO: TIBStringField;
    qryVenceCODIGO_TEXTO: TIBStringField;
    qryVenceDIASPORVENCER: TIntegerField;
    qryVenceDIASVENCIDOS: TIntegerField;
    qryVencePRECIO: TFloatField;
    dsqryVence: TDataSource;
    procedure Ayuda1Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BuscarCliente1Click(Sender: TObject);
    procedure chkExentoEnter(Sender: TObject);
    procedure chkExentoExit(Sender: TObject);
    procedure Cotizar1Click(Sender: TObject);
    procedure CuadreCaja1Click(Sender: TObject);
    procedure DBEdit1Enter(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure DBEdit2Enter(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure DBEdit5Exit(Sender: TObject);
    procedure Devolucin1Click(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure edtCodigoChange(Sender: TObject);
    procedure edtCodigoEnter(Sender: TObject);
    procedure edtCodigoExit(Sender: TObject);
    procedure edtReferenciaChange(Sender: TObject);
    procedure edtReferenciaExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
    procedure ImprimirLabel1Click(Sender: TObject);
    procedure ImprimirRecibo1Click(Sender: TObject);
    procedure Inventario1Click(Sender: TObject);
    procedure LectorCodBarra1Click(Sender: TObject);
    procedure MaestroCliente1Click(Sender: TObject);
    procedure MostrarVistaproductos1Click(Sender: TObject);
    procedure NoGenerarNCF1Click(Sender: TObject);
    procedure NoMostrarProdVencidos1Click(Sender: TObject);
    procedure NotaCrdito1Click(Sender: TObject);
    procedure NotaDebito1Click(Sender: TObject);
    procedure qryClienteAfterScroll(DataSet: TDataSet);
    procedure qryProductosAfterScroll(DataSet: TDataSet);
    procedure ReImprimirRecibo1Click(Sender: TObject);
    procedure RxDBGrid2DblClick(Sender: TObject);
    procedure RxDBGrid2GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure RxDBGrid2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
    procedure RxDBGrid2KeyPress(Sender: TObject;
  var Key: Char);
    procedure RxDBGrid3DblClick(Sender: TObject);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure RxLabel1Click(Sender: TObject);
    procedure rxLabelVenceDblClick(Sender: TObject);
    procedure rxVentaAfterPost(DataSet: TDataSet);
    procedure rxVentaBeforePost(DataSet: TDataSet);
    procedure SecretPanel1DblClick(Sender: TObject);
  private
    { Private declarations }
procedure ProcesarSumaTotal;
    procedure ProcesaNuevo;
    procedure InsertarDet(numero : Integer);
    procedure InsertarCotizacionDet(numero : Integer);
    procedure ProcesaCalculos;
    procedure ProcCargaDatosCotizacion;

    procedure ProcActUltTrn;
    procedure AbrirClasifPrecio;

    procedure ProcesaFacturar(tipo : smallint;numdoc:integer;codcte:integer);
    procedure ActBalaceCteP(operacion:smallint);
    procedure EditarBalanceP(monto:Real;tipo:Integer);overload;
    //procedure EditarBalanceP(monto:Real;fecha:TDateTime);overload;
    procedure EditarBalanceP(monto : Real);overload;
    procedure InsertaBalanceP(monto: Real);
    Function VerificaClave:Boolean;

    procedure ProcVentaConNCF(tiponcf:String; Var valorNCF:String; Var seriedoc:Integer; Var serie_asignadoncf : Integer);

    procedure ProcVenta(valorNCF:String; Serie_Asignadoncf:Integer; Var serieDoc:Integer);

    Procedure AplicaPrecioMayorista;
    Function FncFrecuencia(Frec : Integer):String;
    procedure AsignarSqlText(campo:String; valor:string; OrderBy : String);
    procedure Finalizardisplay;
    procedure ActualizaInvAlmacen;
    Function VerificaLimiteCredito(codigocte:integer;MontoVenta:Real):Boolean;
    procedure LlenarTipoUnidadBox(umedida:integer);
    Function precioXUnidad(idTipoUnidad:Integer;idProducto: Integer): Extended;
    procedure ImprimirFactura(Avance: Integer);
    procedure CargarPreventa;
    procedure ActualizarPreventa;    
  public
    { Public declarations }
  end;

Const
  FormaPagoNotaDebito = 6;//Devolucion
  TipoPagoFactura = 7;//Factura-Credito
  PORC_TRANSP_ITBIS = 16/1.16;//13.79;
var
  frmProcVentas: TfrmProcVentas;
    TipoVenta : String;
  xCodigoCte : Integer;
  xSalir, Prod_existe: boolean;
  EsFinanciamiento : Boolean = false;
  EsFactura  : Boolean = false;
  BuscandoPorDesc: Boolean = false;
  sumarDatos  : Boolean = True;
  clave : String;
  yNumSerie : Integer;
  MontoItbisEnPrecio : Extended;
  PrecioAnterior : Extended;
  Entro : Boolean = false;
  reciboImpreso : Boolean;
  isShowing : Boolean;
  FAplicaPrecioMayorista: Boolean;
  NoTieneCredito :  boolean = False;
  CantUnidad : Real;
  InactivaImprecibo : Boolean;
  noExiste : Boolean;

implementation

uses UDatModFactura, UDatModCompania;

{$R *.dfm}

procedure TfrmProcVentas.AbrirClasifPrecio;
begin

end;

procedure TfrmProcVentas.ActBalaceCteP(operacion: smallint);
begin

end;

procedure TfrmProcVentas.ActualizaInvAlmacen;
begin

end;

procedure TfrmProcVentas.ActualizarPreventa;
begin

end;

procedure TfrmProcVentas.AplicaPrecioMayorista;
begin

end;

procedure TfrmProcVentas.AsignarSqlText(campo, valor, OrderBy: String);
begin

end;

procedure TfrmProcVentas.Ayuda1Click(Sender: TObject);
begin
  ShellExecute(frmProcVentas.Handle,nil,PChar('C:\Proyectos\PointSaleSoftGold\PuntoVenta\ManualOnline.html'),'','',SW_SHOWNORMAL);
end;

procedure TfrmProcVentas.BitBtn10Click(Sender: TObject);
begin
  if (rxVenta.RecordCount >  0) then
  begin
    Totales.Edit;
    rxVenta.Edit;
    DBEdit5.SetFocus;
  end;
end;

procedure TfrmProcVentas.BitBtn11Click(Sender: TObject);
var
  frecuencia:string;
  serieDoc:Integer;  
begin
  //BitBtn6Click(Self);//Facturar;
  //if xSalir then Exit;
  xSalir:=False;
  EsFinanciamiento:=True;
  if not Assigned(FrmBuscarClientesPersonas) then
  FrmBuscarClientesPersonas:=TFrmBuscarClientesPersonas.Create(Nil);
  try
    TipoVenta:='CREDITO';
    xCodigoCte:=-1;
    if FrmBuscarClientesPersonas.Showmodal = mrOk then
    begin
      xCodigoCte := FrmBuscarClientesPersonas.CodigoCliente;
    end else
    begin
      xSalir:=True;
      {FrmBuscarClientesPersonas.Free;
      FrmBuscarClientesPersonas := Nil;}
    end;

    //if FrmBuscarClientesPersonas.Showmodal = mrOk then
    //begin
    //  xCodigoCte := FrmBuscarClientesPersonas.CodigoCliente;
    if Not  xSalir then
    begin
      if xCodigoCte > 0 then
      begin
        if Totales.State = dsbrowse then Totales.Edit;
        TotalesCodCliente.Value:= xCodigoCte;

        if FrmBuscarClientesPersonas.qryClienteStd.State = dsBrowse then
        begin
          FrmBuscarClientesPersonas.qryClienteStd.Locate('codigo_cte', xCodigoCte,[]);
          TotalesNombreCliente.Value := FrmBuscarClientesPersonas.qryClienteStdNOMBRE_CTE.Value;
          TotalesDireccion.Value     := FrmBuscarClientesPersonas.qryClienteStdDIRECCION_CONT.Value;
          TotalesTelefono.Value      := FrmBuscarClientesPersonas.qryClienteStdTELEF_CONTACTO.Value;
          TotalesRNC_NUMERO.Value    := FrmBuscarClientesPersonas.qryClienteStdRNC_NUMERO.Value;
        end else if FrmBuscarClientesPersonas.qryPrestamos.State = dsBrowse then
        begin
          FrmBuscarClientesPersonas.qryPrestamos.Locate('codigo_cte', xCodigoCte,[]);
          TotalesNombreCliente.Value := FrmBuscarClientesPersonas.qryPrestamosNOMBRE_CTE.Value;
          TotalesDireccion.Value     := FrmBuscarClientesPersonas.qryPrestamosDIRECCION_CONT.Value;
          TotalesTelefono.Value      := FrmBuscarClientesPersonas.qryPrestamosTELEF_CONTACTO.Value;
          TotalesRNC_NUMERO.Value    := FrmBuscarClientesPersonas.qryPrestamosRNC_NUMERO.Value;
        end;
        Totales.Post;

        CheckBox1.Checked:=True;

        frmFinanciamiento:=TfrmFinanciamiento.Create(Nil);

        frmFinanciamiento.rxLabelNombreCliente.Caption := TotalesNombreCliente.Value;
        frmFinanciamiento.xCodigocliente := xCodigoCte;
        frmFinanciamiento.qryFinancAbiertos.Close;
        frmFinanciamiento.qryFinancAbiertos.Params[0].Value:= xCodigoCte;
        frmFinanciamiento.qryFinancAbiertos.Open;
        frmFinanciamiento.xNumeroTrn := SerieDoc;
        frmFinanciamiento.rxDatosFinanc.Insert;
        frmFinanciamiento.rxDatosFinancMontoInicial.Value:= Totalestotalneto.Value
        - Totalesmontorecibido.Value;// - TotalesMontoInteres.Value;

        frmFinanciamiento.ShowModal;
        if frmFinanciamiento.rxDatosFinanc.RecordCount > 0 then
        begin
          Totales.Edit;
          TotalesMontoInteres.Value :=
          frmFinanciamiento.rxDatosFinancMontoInteres.Value *
          frmFinanciamiento.rxDatosFinanccantCuotas.Value;

          TotalestotalNeto.Value  := frmFinanciamiento.rxDatosFinancMontoFinanciado.Value;
          Totales.Post;
        end;
    end;
      //ProcesaFacturar(tipo : smallint;numdoc:integer;codcte:integer);
  end;//if not xSalir
    //end;
  finally
  //try
  //  FrmBuscarClientesPersonas.qryPrestamos.Close;
  //  FrmBuscarClientesPersonas.qryClienteStd.Close;
  //  FrmBuscarClientesPersonas.Free;
  //FrmBuscarClientesPersonas:=Nil;
  //except
  //end;
  end;

  //rxVenta.EmptyTable;
  //Edit1.Text      := '';
  //edtCodigo.Text  := '';
  //BitBtn4.Enabled := False;
  //Totales.EmptyTable;
  //CheckBox1.Checked:=false;
  //edtCodigo.SetFocus;
  if TotalesMontoInteres.Value > 0 then
  begin
    BitBtn12.Enabled:= True;
    BitBtn12.SetFocus;
    Label17.Visible := True;
    DBText6.Visible := True;
    BitBtn11.Enabled:=False;
    tablaPropietario.Edit;
    tablaPropietarioCodigoPropietario.AsVariant := null;
    tablaPropietario.Post;
  end;
end;

procedure TfrmProcVentas.BitBtn12Click(Sender: TObject);
var
 serieDoc:Integer;
 frecuencia:string;
 ValorNCF : String;
 serie_asignadoncf : Integer;
begin
  BitBtn11.Enabled:=True;
  frmSelNCF:=TfrmSelNCF.Create(Nil);
  try
    if (frmSelNCF.ShowModal = mrOK) then
    begin
      ProcVentaConNCF(dmFactura.ibQryViewNCFTIPO_CF.Value, ValorNCF, serieDoc, serie_asignadoncf);
      ProcesaFacturar(1, serieDoc, xCodigoCte);//xcodigocte);
      if frmFinanciamiento.rxDatosFinanc.State = dsBrowse then
      frmFinanciamiento.rxDatosFinanc.Edit;
      frmFinanciamiento.rxDatosFinancNumeroFactura.Value:=serieDoc;
      frmFinanciamiento.rxDatosFinanc.Post;
      frmFinanciamiento.ProcInsertarDatos;

      qckRepFacturaEstandarNew := TqckRepFacturaEstandarNew.Create(Nil);
      try
        if GlbSizeFact8x11 = 1 then
        qckRepFacturaEstandarNew.Page.Length := 11;

        frecuencia := FncFrecuencia(frmFinanciamiento.tblFrecPagoFRECUENCIA_DIAS.Value);

        qckRepFacturaEstandarNew.xtipoVenta := 'Financiamiento a ' + frmFinanciamiento.rxDatosFinanccantCuotas.AsString+ ' '+ frecuencia;
        qckRepFacturaEstandarNew.valorNCF   := Totalesncf_numero.Value;
        if Totales.State = dsBrowse then
        begin
          Totales.Edit;
          TotalesPorcientoInteres.Value:= frmFinanciamiento.rxDatosFinancPorcInteres.Value;
          Totales.Post;
        end else
        if Totales.State in [dsEdit, dsInsert] then
        TotalesPorcientoInteres.Value:= frmFinanciamiento.rxDatosFinancPorcInteres.Value;
        Totalestotalneto.Value;

        if ImprimirRecibo1.Checked then
        begin
          qckRepFacturaEstandarNew.PrinterSetup;
          qckRepFacturaEstandarNew.Print;
        end else
        qckRepFacturaEstandarNew.Preview;
      finally
      qckRepFacturaEstandarNew.Free;
      qckRepFacturaEstandarNew := Nil;
      end;

      Totales.EmptyTable;
    end;
    finally
    frmSelNCF.Free;
    frmSelNCF:= Nil;

    //Reporte Distribucion de cuotas
    frmDistCuotas:=TfrmDistCuotas.create(Nil);
    try
      dmReportes.qryRepFinancDistcuota.Close;
      dmReportes.qryRepFinancDistcuota.Params[0].Value := xCodigoCte;
      dmReportes.qryRepFinancDistcuota.Params[1].Value := serieDoc;
      dmReportes.qryRepFinancDistcuota.Open;
      frmDistCuotas.InsertarCuotas(
      dmReportes.qryRepFinancDistcuotaCANT_CUOTAS.Value,
      dmReportes.qryRepFinancDistcuotaMONTOINICIAL.Value,
      dmReportes.qryRepFinancDistcuotaPORCIENTO.Value,
      dmReportes.qryRepFinancDistcuotaFECHA.Value,
      frmFinanciamiento.tblFrecPagoFRECUENCIA_DIAS.Value);
      frmDistCuotas.Showmodal;
    finally
    frmDistCuotas.Free;
    frmDistCuotas:= Nil;
    end;

    frmFinanciamiento.Free;
    frmFinanciamiento:=Nil;
  end;
  rxVenta.EmptyTable;
  Edit1.Text      := '';
  edtCodigo.Text  := '';
  BitBtn4.Enabled := False;
  Totales.EmptyTable;
  CheckBox1.Checked := False;
  edtCodigo.SetFocus;
end;

procedure TfrmProcVentas.BitBtn13Click(Sender: TObject);
begin
  //frmInvXReferencia:=TfrmInvXReferencia.Create(Nil);
  //try
  //  frmInvXReferencia.Showmodal;
  //finally
  //frmInvXReferencia.Free;
  //frmInvXReferencia:=Nil;
  //end;
end;

procedure TfrmProcVentas.BitBtn14Click(Sender: TObject);
begin
  DBEdit2.ReadOnly := False;
  if (varTipousuario = 0) then //Adm
  begin
    DBEdit2.ReadOnly := False;
    //tj Entro := True;
    //tj PrecioAnterior := rxVentaPrecio.Value;
    DBEdit2.SetFocus;
  end else
  begin
    if VerificaClave then
    begin
      DBEdit2.ReadOnly := False;
      //tj MontoItbisEnPrecio := 0;
      //tj Entro:=true;
      //tj PrecioAnterior := rxVentaPrecio.Value;
      DBEdit2.SetFocus;
    end;
  end;
end;

procedure TfrmProcVentas.BitBtn15Click(Sender: TObject);
var
  tRecordsDet : integer;
begin
  dmCompania.tblCompania.Close;
  dmCompania.tblCompania.Open;
  dmfactura.qryFactReimpMaster.Close;
  dmfactura.qryFactReimpMaster.Params[0].Value:=
  StrToInt(InputBox('Re-Imprimir factura','Entre numero',''));

  dmfactura.qryFactReimpDet.Close;
  dmfactura.qryFactReimpDet.Params[0].Value:=dmfactura.qryFactReimpMaster.Params[0].Value;
  dmfactura.qryFactReimpDet.Open;
  dmfactura.qryFactReimpDet.Last;
  tRecordsDet := dmfactura.qryFactReimpDet.RecordCount;
  dmfactura.qryFactReimpDet.Close;

  dmfactura.qryFactReimpMaster.Open;
  if dmfactura.qryFactReimpMaster.Recordcount > 0 then
  begin

  if (GlbFact55Pulg = 1) then
  begin
    qckRepFacturaEstandarNewReimp:=TqckRepFacturaEstandarNewReimp.Create(Nil);
    try
      if GlbSizeFact8x11 = 1 then
      qckRepFacturaEstandarNewReimp.Page.Length := 11;
      //else
      //qckRepFacturaEstandarNewReimp.Page.PaperSize :=
      if MessageDlg('Imprimir?', mtInformation, [mbYes, mbno], 0) = mryes then
      begin
        qckRepFacturaEstandarNewReimp.PrinterSetup;
        qckRepFacturaEstandarNewReimp.Print;
      end else
      qckRepFacturaEstandarNewReimp.Preview;
    finally
    qckRepFacturaEstandarNewReimp.Free;
    qckRepFacturaEstandarNewReimp:=Nil;
    end;
  end
  else
  begin
    qckRepFactPuntoVenta:=TqckRepFactPuntoVenta.Create(Nil);
    try
      if tRecordsDet > 2 then
      qckRepFactPuntoVenta.Page.Length:= qckRepFactPuntoVenta.Page.Length +
      (tRecordsDet - 1 ) * 74;
      if ImprimirRecibo1.Checked then
      qckRepFactPuntoVenta.Print else
      qckRepFactPuntoVenta.Preview;
    finally
    qckRepFactPuntoVenta.Free;
    qckRepFactPuntoVenta:=Nil;
    end;
  end;
  end else
  MessageDlg('Numero factura no econtrado verifique',mtInformation, [mbOK], 0);
{  dmCompania.tblCompania.Close;
  dmCompania.tblCompania.Open;
  dmfactura.qryFactReimpMaster.Close;
  dmfactura.qryFactReimpMaster.Params[0].Value:=
  StrToInt(InputBox('Re-Imprimir factura','Entre numero',''));
  dmfactura.qryFactReimpMaster.Open;
  if dmfactura.qryFactReimpMaster.Recordcount > 0 then
  begin

  if (GlbFact55Pulg = 1) then
  begin
    qckRepFacturaEstandarNewReimp:=TqckRepFacturaEstandarNewReimp.Create(Nil);
    try
      if GlbSizeFact8x11 = 1 then
      qckRepFacturaEstandarNewReimp.Page.Length := 11;
      //else
      //qckRepFacturaEstandarNewReimp.Page.PaperSize :=
      if MessageDlg('Imprimir?', mtInformation, [mbYes, mbno], 0) = mryes then
      begin
        qckRepFacturaEstandarNewReimp.PrinterSetup;
        qckRepFacturaEstandarNewReimp.Print;
      end else
      qckRepFacturaEstandarNewReimp.Preview;
    finally
    qckRepFacturaEstandarNewReimp.Free;
    qckRepFacturaEstandarNewReimp:=Nil;
    end;
  end
  else
  begin
    qckRepRecibo:=TqckRepRecibo.Create(Nil);
    try
      if Length(edtObservacion.Text) > 0 then
      qckRepRecibo.nombreCteGenerico:=edtObservacion.Text
      else
      if tablaPropietarioCodigoPropietario.Value > 0 then
      begin
        qryCliente.Locate('CODIGO_CTE', tablaPropietarioCodigoPropietario.Value,[]);
        qckRepRecibo.qrLabelRNC.Caption:='RNC-' + qryClienteRNC_NUMERO.Value;
        qckRepRecibo.nombreCteGenerico:= qryClienteNOMBRE_CTE.Value;
      end;
      qckRepRecibo.xtipoVenta := 'COTIZACION';
      qckRepRecibo.valorNCF:= '';
      if rxVenta.RecordCount > 2 then
      qckRepRecibo.Page.Length:= qckRepRecibo.Page.Length +
      (rxVenta.RecordCount - 2 ) * 0.65;
      if ImprimirRecibo1.Checked then
      begin
        qckRepRecibo.PrinterSetup;
        qckRepRecibo.Print;
      end else
      qckRepRecibo.Preview;
    finally
    qckRepRecibo.Free;
    qckRepRecibo:=Nil;
    end;
  end;
  end else
  MessageDlg('Numero factura no econtrado verifique',mtInformation, [mbOK], 0);
  }
end;

procedure TfrmProcVentas.BitBtn16Click(Sender: TObject);
begin
  frmConsultaPrecio:=TfrmConsultaPrecio.Create(Nil);
  try
    if frmConsultaPrecio.Showmodal = mrOk then
    begin
      edtCodigo.Text:= frmConsultaPrecio.qryProductosCODIGO_TEXTO.Value;
      edtCodigo.SetFocus;
    end;
  finally
  frmConsultaPrecio.Free;
  frmConsultaPrecio := Nil;
  end;
end;

procedure TfrmProcVentas.BitBtn1Click(Sender: TObject);
begin
  {if (rxVentaCodArticulo.AsString <>'') and (rxVentaCant.AsString <> '')
     and (rxVentaMontoBruto.Value <= 0) then
  begin
    raise ERangeError.Create('Monto debe ser mayor que cero, verifique');
    DBEdit1.SetFocus;
    exit;
  end;}
  reciboImpreso :=False;
  ProcesaNuevo;
  //if frmProcVentaRapida.Showing then
  if isShowing then
  edtCodigo.SetFocus;
end;

procedure TfrmProcVentas.BitBtn2Click(Sender: TObject);
begin
//tj   if Not Entro And GlbPermiteCambioPrecio then
//tj   begin
    BitBtn10Click(Self);
//tj     rxVentaPrecio.Value:= qryProductosPRECIO.Value;
//tj     DBEdit5Exit(Self);
//tj   end else
//tj   begin
//tj     rxVenta.Edit;
//tj     rxVentaPrecio.Value:= qryProductosPRECIO.Value;
//tj   end;
  TipoVenta:='CONTADO';
  if rxVenta.State In [dsInsert, dsEdit] Then
  begin
    if rxVentaCodArticulo.IsNull Or rxVentaCant.IsNull Or rxVentaPrecio.IsNull then
    rxVenta.Cancel else
    rxVenta.Post;
  end;
  if rxVenta.RecordCount > 0 then
  //  if frmProcVentaRapida.Showing then
  if isShowing then
  Edit1.SetFocus;
end;

procedure TfrmProcVentas.BitBtn3Click(Sender: TObject);
begin
  if rxVenta.RecordCount > 0 then
  begin
    if VerificaClave then
    begin
      if MessageDlg('Cancelar Venta?', mtInformation, [mbYes, mbNo], 0)= mryes then
      begin
        rxVenta.Close;
        rxVenta.EmptyTable;
        rxVenta.Open;
        Totales.EmptyTable;
      end;
    end;
  end;
end;

procedure TfrmProcVentas.BitBtn4Click(Sender: TObject);
var
  serie_asignadoncf : integer;
  valorNCF : String;
  showNcfwindows : boolean;
  genNcf : Boolean;

begin
  //Generar y asignar Numero de Comprobante Fiscal
  valorNCF:='';
  if (GlbSolDCteVCash = 1) And (TipoVenta = 'CONTADO') then
  begin
    rxSolDatoscte.Close;
    rxSolDatoscte.Open;
    rxSolDatoscte.Insert;
    frmSolDatos:=TfrmSolDatos.Create(Nil);
    try
      if frmSolDatos.Showmodal= mrOk then
      rxSolDatoscte.Post else rxSolDatoscte.Cancel;
    finally
    frmSolDatos.Free;
    frmSolDatos:=Nil;
    end;
  end;

  if EsDevolucion then
  TipoVenta:='Devolucion' else
  if GlbNCFConfFinal = 0 then
  begin
    CheckBox1.Checked:=true;
  end;
  //if CheckBox1.Checked then
  //begin
    frmSelNCF:=TfrmSelNCF.Create(Self);
    try
      dmFactura.ibQryViewNCF.Locate('TIPO_CF','02',[]);

      if (GlbNCFConfFinal = 0)  and not NoGenerarNCF1.Checked then
      begin
        showNcfwindows:= True;
      end else
      begin
        if NoGenerarNCF1.Checked then  //no imprime NCF
        showNcfwindows := false;

        if showNcfwindows then
        begin
          if frmSelNCF.ShowModal = mrOk then
          showNcfwindows:= True
          else
          showNcfwindows:= False;
        end else
        if (GlbNCFConfFinal = 1) then
        showNcfwindows:= true else
        showNcfwindows:= False;
      end;

      if NoGenerarNCF1.Checked then  //no imprime NCF
      showNcfwindows := False;
      if (GlbNCFConfFinal = 0) then
      showNcfwindows:= True;

      GlbDescNCF:='';

      if showNcfwindows then
      begin
       if dmFactura.ibQryViewNCF.Locate('TIPO_CF', dmFactura.ibQryViewNCFTIPO_CF.Value, []) then
       begin
         if GlbNCFConfFinal = 0 then
         begin
           if frmSelNCF.ShowModal = mrok then
           genNcf:= True
           else genNcf:= False;
         end else genNcf:= true;
         if genNcf then
         begin
         //GlbDescNCF := 'Fact. Consumidor Final';//dmFactura.ibQryViewNCFDESCRIPCION.Value;
         GlbDescNCF   := dmFactura.ibQryViewNCFDESCRIPCION.Value;
         frmAsignarNCFVenta := tfrmAsignarNCFVenta.Create(self);
         try
           frmAsignarNCFVenta.IBDataSet1.Close;
           frmAsignarNCFVenta.IBDataSet1.Open;
           frmAsignarNCFVenta.IBDataSet1.Insert;
           frmAsignarNCFVenta.IBDataSet1FECHA_INSERT.Value := Now;
           frmAsignarNCFVenta.IBDataSet1FECHA.Value := ExtraerFEcha(GlbFechaTrnDiaria);
           frmAsignarNCFVenta.IBDataSet1CODIGO_USUARIO.Value := VarUsuarioGlb;
           frmAsignarNCFVenta.IBDataSet1STATUS.Value := 'A';

           frmAsignarNCFVenta.IBDataSet1TIPO_NCF.Value := dmFactura.ibQryViewNCFTIPO_CF.Value;
           frmAsignarNCFVenta.BitBtn13Click(Self);

           frmAsignarNCFVenta.Asginarncf := frmAsignarNCFVenta.ncfGenerado;

           frmAsignarNCFVenta.IBDataSet1NUMERO_NCF.Value := frmAsignarNCFVenta.ncfGenerado;//rxVentaNCF.Value;
           frmAsignarNCFVenta.IBDataSet1MONTO.Value      := Totalestotalneto.Value; //StrToFloat(EditN1.Text);

           frmAsignarNCFVenta.BitBtn4Click(Self); //Guardar

           if (frmAsignarNCFVenta.ncfGenerado = '') then
           begin
             if MessageDlg('NCF no fue generado, desea continuar?',mtWarning, [mbyes,mbno], 0) = mrNO then
             Exit;
           end;

           serie_asignadoncf := frmAsignarNCFVenta.IBDataSet1SERIE.Value;
           valorNCF:= frmAsignarNCFVenta.ncfGenerado;

           if Totales.State = dsBrowse then
           Totales.Edit;

           if Totales.State In [dsInsert, dsEdit] then
           begin
             Totales.Edit;
             Totalesncf_numero.Value := valorNCF;
             TotalesqrLabelNcfDesc.Value:=GlbDescNCF;
             //GlbDescNCF:='';
             Totales.Post;
           end;
         finally
         //t frmAsignarNCFVenta.Free;
         //t frmAsignarNCFVenta:=Nil;
         end;
         end;//if genNcf
       end;
      end;
     finally
     //t frmSelNCF.Free;
     //t frmSelNCF:= Nil;
    end;
  //end;

  //ibstpProcSecuencia.Params[0].Value := out
  //ibstpProcSecuencia.Params[1].Value :=
  ibstpProcSecuencia.Params[2].Value := 4;

  ipStpInsertVentMast.Params[1].Value := GlbFechaTrnDiaria;
  if tablaPropietarioCodigoPropietario.IsNull then
  ipStpInsertVentMast.Params[2].Value := 0//generico
  else ipStpInsertVentMast.Params[2].Value:= tablaPropietarioCodigoPropietario.Value;
  ipStpInsertVentMast.Params[3].Value:= VarUsuarioGlb;

  if Not EsDevolucion then
  begin
    ipStpInsertVentMast.Params[5].Value:= 'CONTADO';
    ipStpInsertVentMast.Params[4].Value:= 1;
    ibstpProcSecuencia.Params[1].Value := 1;
  end else
  begin
    ipStpInsertVentMast.Params[5].Value   := 'Devolucion';
    ipStpInsertVentMast.Params[4].Value:= 6;
    ibstpProcSecuencia.Params[1].Value := 6;
  end;
  ibstpProcSecuencia.ExecProc;

  ipStpInsertVentMast.Params[6].Value   := '1';
  ipStpInsertVentMast.Params[7].AsString:= TotalesSubTotal.AsString; //EditN1.Text;
  ipStpInsertVentMast.Params[8].Value   := 'A';
  ipStpInsertVentMast.Params[9].Value   := Now;
  ipStpInsertVentMast.Params[10].Value  := Null;
  ipStpInsertVentMast.Params[11].Value  := Null;
  ipStpInsertVentMast.Params[12].Value  := Null;
  ipStpInsertVentMast.Params[13].Value  := Null;
  ipStpInsertVentMast.Params[14].Value  := ibstpProcSecuencia.Params[0].Value;

  ipStpInsertVentMast.Params[16].Value  := TotalesSubTotal.Value;
  ipStpInsertVentMast.Params[17].Value  := TotalesPorcDesAdicional.Value;
  ipStpInsertVentMast.Params[18].Value  := TotalesMontoDescAdicional.Value;

  if Serie_asignadoncf > 0 then
  ipStpInsertVentMast.Params[15].Value  := Serie_asignadoncf
  else ipStpInsertVentMast.Params[15].Value:= Null;

  ipStpInsertVentMast.ExecProc;

  if Not ipStpInsertVentMast.Transaction.InTransaction then
  ipStpInsertVentMast.Transaction.StartTransaction;
  try
    ipStpInsertVentMast.Transaction.CommitRetaining;
  except
  ipStpInsertVentMast.Transaction.RollbackRetaining;
  end;

  if (GlbSolicitaDVeh = 1) then
  begin
    tblDatosVentaVehiculos.Close;
    tblDatosVentaVehiculos.Open;
    frmDatosVentaVehiculos := TfrmDatosVentaVehiculos.Create(Nil);
    try
      tblDatosVentaVehiculos.Params[0].Value := ipStpInsertVentMast.Params[0].Value;
      frmDatosVentaVehiculos.NumeroVenta     := ipStpInsertVentMast.Params[0].Value;
      frmDatosVentaVehiculos.Showmodal; 
    finally
    frmDatosVentaVehiculos.Free;
    frmDatosVentaVehiculos := Nil;
    end;
  end;

  rxVenta.DisableControls;
  rxVenta.First;
  While not rxVenta.eof do
  begin
    InsertarDet(ipStpInsertVentMast.Params[0].Value);
    ibStpActualizaInvProd.Params[0].Value:= rxVentaCodArticulo.Value;
    ibStpActualizaInvProd.Params[1].Value:= rxVentaCant.Value;
    if Not EsDevolucion then
    ibStpActualizaInvProd.Params[2].Value     := 0//tipoTrn
    else ibStpActualizaInvProd.Params[2].Value:= 1;//ingresar al inventario
    ibStpActualizaInvProd.Params[3].Value     := 1;//porCodigo
    if (rxVentaInvetariar.Value <> 0) And (GlbCodDivInventario = 1 ) then
    ibStpActualizaInvProd.ExecProc;
    ActualizaInvAlmacen;//Actualiza Division Inventario
    rxVenta.Next;
  end;
  rxVenta.First;
  While not rxVenta.Eof do
  begin
    rxVenta.Edit;
    rxVentaNumeroRecibo.Value := ipStpInsertVentMast.Params[0].Value;
    rxVentaNumeroDoc.Value := ipStpInsertVentMast.Params[14].Value;
    rxVenta.Post;
  end;
  rxVenta.EnableControls;

  if Not ibStpInsertVentaDet.Transaction.InTransaction then
  ibStpInsertVentaDet.Transaction.StartTransaction;
  try
    ibStpInsertVentaDet.Transaction.CommitRetaining;
  except
  ibStpInsertVentaDet.Transaction.RollbackRetaining;
  end;

  if Not ibStpActualizaInvProd.Transaction.InTransaction then
  ibStpActualizaInvProd.Transaction.StartTransaction;
  try
    ibStpActualizaInvProd.Transaction.CommitRetaining;
  except
  ibStpActualizaInvProd.Transaction.RollbackRetaining;
  end;

  if (GlbRec55Pulg = 1) then
  begin
    if rxSolDatoscte.State In [dsInactive] then
    rxSolDatoscte.Open;

    if rxSolDatoscte.State In [dsBrowse] then
    if rxSolDatoscte.RecordCount = 0 then
    begin
      if tablaPropietarioCodigoPropietario.value > 0 then
      begin
        rxSolDatoscte.Close;
        rxSolDatoscte.Open;
        rxSolDatoscte.Insert;
        rxSolDatoscteNombre.Value    := qryClienteNOMBRE_CTE.Value;
        rxSolDatoscteDireccion1.Value:= qryClienteDIRECCION_CONT.Value;
        rxSolDatoscteDireccion2.Value:= '';
        //rxSolDatosctencfDescripcion.Value := aquis123aquis

        if qryClienteRNC_NUMERO.IsNull then
           rxSolDatoscteCedula.Value := qryClienteCEDULA.Value
        else
        rxSolDatoscteCedula.Value    := qryClienteRNC_NUMERO.Value;

        rxSolDatoscteCiudad.Value    := qryClienteCIUDAD.Value;
        rxSolDatoscteTelefono.Value  := qryClienteTELEF_CONTACTO.Value;

        if Length(edtObservacion.Text) > 0 then
        rxSolDatoscteNombre.Value    := edtObservacion.Text;
      end else
      begin
        rxSolDatoscte.Close;
        rxSolDatoscte.Open;
        rxSolDatoscte.Insert;
        rxSolDatoscteNombre.Value  := '*** Cliente Generico ***';
        if Length(edtObservacion.Text) > 0 then
        rxSolDatoscteNombre.Value  := edtObservacion.Text;
      end;
      rxSolDatosctencfDescripcion.Value := GlbDescNCF;
      rxSolDatoscte.Post;
    end;

    qckRepRecibo8_5_11:=TqckRepRecibo8_5_11.Create(Nil);
    try
    qckRepRecibo8_5_11.TPag.Caption:= IntToStr(qckRepRecibo8_5_11.PageNumber);
    finally
    qckRepRecibo8_5_11.Free;
    qckRepRecibo8_5_11:=Nil;
    end;

    qckRepRecibo8_5_11:=TqckRepRecibo8_5_11.Create(Nil);
    try
      qckRepRecibo8_5_11.xtipoVenta := TipoVenta;
      qckRepRecibo8_5_11.valorNCF:= valorNCF;
      if (GlbImpReciboSinPreg = 1) then
      qckRepRecibo8_5_11.Print
      else
      if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
      begin
        qckRepRecibo8_5_11.PrinterSetup;
        qckRepRecibo8_5_11.Print;
      end else
      qckRepRecibo8_5_11.PreviewModal;
      if (GlbImpReciboSinPreg = 0) then
      if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
      begin
        qckRepRecibo8_5_11.PreviewModal;
      end;
      reciboImpreso:=True;
    finally
    qckRepRecibo8_5_11.Free;
    qckRepRecibo8_5_11:=Nil;
    end;
  end else
  begin
    qckRepRecibo:=TqckRepRecibo.Create(Nil);
    try
      qckRepRecibo.ncfDesc := GlbDescNCF;
      if Length(edtObservacion.Text) > 0 then
      qckRepRecibo.nombreCteGenerico:=edtObservacion.Text;
      if (tablaPropietarioCodigoPropietario.value > 0) then
      begin
        qckRepRecibo.qrLabelRNC.Caption:='RNC-' + qryClienteRNC_NUMERO.Value;
        qckRepRecibo.nombreCteGenerico:= qryClienteNOMBRE_CTE.Value;
      end
      else qckRepRecibo.qrLabelRNC.Caption:='';

      qckRepRecibo.xtipoVenta := TipoVenta;
      qckRepRecibo.valorNCF:= valorNCF;
      if rxVenta.RecordCount >= 2 then
      qckRepRecibo.Page.Length:= qckRepRecibo.Page.Length +
      (rxVenta.RecordCount - 1 ) * 0.90;
      //if ImprimirRecibo1.Checked then
      //begin
      if GlbImpCodProducto = 1 then
      begin
        qckRepRecibo.qckRepComprobante.Size.Height := 0.250;
        qckRepRecibo.QRLabel26.Enabled := False;
        qckRepRecibo.QRDBText20.Enabled:= False;
      end;
      if (GlbImpReciboSinPreg = 1) then
      qckReprecibo.Print
      else
      if MessageDlg('Imprimir?',mtInformation, [mbYes, mbNo], 0)=mryes then
      begin
        qckRepRecibo.PrinterSetup;
        qckRepRecibo.Print;
      end else
      qckRepRecibo.PreviewModal;
      reciboImpreso:=True;
    finally
    qckRepRecibo.Free;
    qckRepRecibo:=Nil;
    end;
  end;
  rxVenta.EmptyTable;
  if chkDisplay.Checked then
  Finalizardisplay;

  tablaPropietario.Edit;
  tablaPropietarioCodigoPropietario.AsVariant := null;
  tablaPropietario.Post;
  //t Edit1.Text := ''; Ene-31-2010

  edtCodigo.Text := '';
  BitBtn4.Enabled := False;
  //if frmProcVentaRapida.Showing then
  if isShowing then
  BitBtn1.SetFocus;

  //t Totales.EmptyTable; Ene-31-2010
  
  EsDevolucion := False;
  Caption:='Proceso Venta';

  //NoGenerarNCF1Click(Self);
  edtCodigo.SetFocus;
  edtObservacion.Text := '';
  //if dmcompania.tblCompania.Locate('RNC_NUMERO', '01800047944', [loCaseInsensitive]) then
  //begin
  //  if (strToInt(formatdatetime('dd', Now)) >= 13) and (strToInt(formatdatetime('hh', Now)) >= 11) then
  //  begin
  //    MessageDlg('Aplicacion presenta licencia vencida, verifique',mtInformation, [mbOK], 0);
  //    Halt(0);
  //  end;
  //end;

end;

procedure TfrmProcVentas.BitBtn5Click(Sender: TObject);
begin
  if rxVenta.state = dsbrowse then
  begin
    if VerificaClave then
    begin
      if MessageDlg('Borrar item No.'+rxVentaSerie.AsString+'?',mtWarning, [mbYes,mbNO], 0)=mryes then
      begin
        rxVenta.Delete;
        ProcesarSumaTotal;
      end;
    end;
  end;
end;

procedure TfrmProcVentas.BitBtn6Click(Sender: TObject);
  var
     Serie_Asignadoncf : Integer;
     serieDoc : Integer;
     valorNCF : String;
begin
//tj   if Not Entro And GlbPermiteCambioPrecio then
//tj   begin
//tj     BitBtn10Click(Self);
//tj     rxVentaPrecio.Value:= qryProductosPRECIO.Value;
//tj     DBEdit5Exit(Self);
//tj   end;

  xSalir := False;
  EsFinanciamiento := False;
  EsFactura := True;
  serieDoc := 0;
  if tablaPropietario.State In [dsEdit, dsInsert] then
  tablaPropietario.Post;
  if (tablaPropietario.RecordCount = 0) then
  begin
    MessageDlg('Favor seleccionar cliente', mtInformation, [mbOK], 0);
    RxDBLookupCombo1.SetFocus;
    Exit;
  end;

  FrmBuscarClientesPersonas:=TFrmBuscarClientesPersonas.Create(Nil);
  try
    TipoVenta := 'CREDITO';
    xCodigoCte:= -1;

    xCodigoCte := tablaPropietarioCodigoPropietario.Value; //FrmBuscarClientesPersonas.CodigoCliente;

    if (xCodigoCte <= 0) then Exit;
    if not  xSalir then
    begin
      if xCodigoCte > 0 then
      begin
        if Totales.State = dsbrowse then Totales.Edit;
        TotalesCodCliente.Value:= xCodigoCte;

        qryCliente.Locate('CODIGO_CTE',xCodigoCte,[]);
        TotalesNombreCliente.Value := qryClienteNOMBRE_CTE.Value;
        TotalesDireccion.Value     := qryClienteDIRECCION_CONT.Value;
        TotalesTelefono.Value      := qryClienteTELEF_CONTACTO.Value;
        TotalesCodCliente.Value    := qryClienteCODIGO_CTE.Value;
        TotalesRNC_NUMERO.Value    := qryClienteRNC_NUMERO.Value;

        Totales.Post;

        if not VerificaLimiteCredito(
                  xCodigoCte,
                  TotalesTotalNeto.Value) then
        begin
          if NoTieneCredito then
          MessageDlg('Cliente no tiene crédito...',mtWarning, [mbOK], 0)
          else
          MessageDlg('Monto contrato excede limite de crédito, depositar diferencia...',mtWarning, [mbOK], 0);
          Exit;
        end;

        CheckBox1.Checked:=True;
        ValorNCF:='';
        Serie_Asignadoncf:=-1;
        frmSelNCF:=TfrmSelNCF.Create(Nil);
        try
          if (frmSelNCF.ShowModal = mrOK) then
          begin
            GlbDescNCF:=dmFactura.ibQryViewNCFDESCRIPCION.Value;
            ProcVentaConNCF(dmFactura.ibQryViewNCFTIPO_CF.Value, ValorNCF, serieDoc, serie_asignadoncf);
            ProcVenta(valorNCF, Serie_Asignadoncf,serieDoc);//Aqui voy
            ProcesaFacturar(1, serieDoc, xcodigocte);
            Totales.EmptyTable;
          end else
          begin
            GlbDescNCF:='';
            ProcVenta(ValorNCF,Serie_Asignadoncf,serieDoc);//Aqui voy
            ProcesaFacturar(1, serieDoc, xcodigocte);
            Totales.EmptyTable;
            serieDoc:=-1;
            Serie_Asignadoncf:=-1;
          end;
          finally
          frmSelNCF.Free;
          frmSelNCF:= Nil;
          end;
        end;
    end;//if not xSalir
  finally
  try
    FrmBuscarClientesPersonas.qryPrestamos.Close;
    FrmBuscarClientesPersonas.qryClienteStd.Close;
    FrmBuscarClientesPersonas.Free;
    FrmBuscarClientesPersonas := Nil;
  except
  end;
  end;

  rxVenta.EmptyTable;
  Edit1.Text      := '';
  edtCodigo.Text  := '';
  BitBtn4.Enabled := False;
  Totales.EmptyTable;
  CheckBox1.Checked := False;
  EsDevolucion      := False;
  GlbDescNCF        := '';
  edtCodigo.SetFocus;

  //NoGenerarNCF1Click(Self);
  EsFactura := False;
  tablaPropietario.Edit;
  tablaPropietarioCodigoPropietario.AsVariant := null;
  tablaPropietario.Post;
end;

procedure TfrmProcVentas.BitBtn7Click(Sender: TObject);
var
  x : Integer;
begin
  EsDevolucion := Not EsDevolucion;
  lblProcDev.Visible := EsDevolucion;
  lblProcDev.Left:=192;
  for x:=1 to 50 do
  begin
    lblProcDev.Left:=lblProcDev.Left - 1;
  end;
  BitBtn4.Enabled    := True;
  BitBtn6.Enabled    := True;
  if EsDevolucion then
  Caption:='Procesando Devolución'
  else
  Caption:='Proceso Venta';
end;

procedure TfrmProcVentas.BitBtn8Click(Sender: TObject);
begin
//tj   if Not Entro And GlbPermiteCambioPrecio then
//tj   begin
//tj     BitBtn10Click(Self);
//tj     rxVentaPrecio.Value:= qryProductosPRECIO.Value;
//tj     DBEdit5Exit(Self);
//tj   end;
        if (xCodigoCte =0) and (tablaPropietarioCodigoPropietario.Value > 0) then
        xCodigoCte := tablaPropietarioCodigoPropietario.Value;

        if Totales.State = dsbrowse then Totales.Edit;
        TotalesCodCliente.Value:= xCodigoCte;
        if xCodigoCte > 0 then
        begin
        qryCliente.Locate('CODIGO_CTE',xCodigoCte,[]);
        TotalesNombreCliente.Value := qryClienteNOMBRE_CTE.Value;
        TotalesDireccion.Value     := qryClienteDIRECCION_CONT.Value;
        TotalesTelefono.Value      := qryClienteTELEF_CONTACTO.Value;
        TotalesCodCliente.Value    := qryClienteCODIGO_CTE.Value;
        TotalesRNC_NUMERO.Value    := qryClienteRNC_NUMERO.Value;
        Totales.Post;
        end;

  CheckBox1.Checked := True;
  ipStpInsertCotizaMast.Params[1].Value:= GlbFechaTrnDiaria;
  ipStpInsertCotizaMast.Params[2].Value:= GlbFechaTrnDiaria+30;//fecha vence
  if not tablaPropietarioCodigoPropietario.IsNull then
  ipStpInsertCotizaMast.Params[3].Value:= tablaPropietarioCodigoPropietario.Value
  else
  ipStpInsertCotizaMast.Params[3].Value:= 0;//codigo cliente generico mientras tanto
  ipStpInsertCotizaMast.Params[4].Value:= VarUsuarioGlb;
  ipStpInsertCotizaMast.Params[5].Value:= 'Cotizacion';
  ipStpInsertCotizaMast.Params[6].Value:= '1';
  ipStpInsertCotizaMast.Params[7].AsString:= TotalesSubTotal.AsString;//EditN1.Text;
  ipStpInsertCotizaMast.Params[8].Value   := 'A';
  ipStpInsertCotizaMast.Params[9].Value   := Now;
  ipStpInsertCotizaMast.Params[10].AsString := Trim(StrUserName);
  ipStpInsertCotizaMast.Params[11].Value    := Null;
  ipStpInsertCotizaMast.Params[12].Value    := Null;
  ipStpInsertCotizaMast.ExecProc;

  if Not ipStpInsertCotizaMast.Transaction.InTransaction then
  ipStpInsertCotizaMast.Transaction.StartTransaction;
  try
    ipStpInsertCotizaMast.Transaction.CommitRetaining;
  except
  ipStpInsertCotizaMast.Transaction.RollbackRetaining;
  end;

  rxVenta.DisableControls;
  rxVenta.First;
  rxVenta.RecordCount;
  While Not rxVenta.Eof Do
  begin
    InsertarCotizacionDet(ipStpInsertCotizaMast.Params[0].Value);
    rxVenta.Next;
  end;

  rxVenta.First;
  While Not rxVenta.Eof Do
  begin
    rxVenta.Edit;
    rxVentaNumeroRecibo.Value := ipStpInsertCotizaMast.Params[0].Value;
    rxVenta.Post;
    rxVenta.Next;
  end;
  rxVenta.EnableControls;

  if Not ibStpInsertCotizaDet.Transaction.InTransaction then
  ibStpInsertCotizaDet.Transaction.StartTransaction;
  try
    ibStpInsertCotizaDet.Transaction.CommitRetaining;
  except
  ibStpInsertCotizaDet.Transaction.RollbackRetaining;
  end;

  if (GlbCot55Pulg = 1) then
  begin
    qckCotizacion8_55:=TqckCotizacion8_55.Create(nil);
    if Length(edtObservacion.Text) > 0 then
    qckCotizacion8_55.nombreCteGenerico:=edtObservacion.Text
    else 
    if tablaPropietarioCodigoPropietario.value > 0 then
    begin
      //qckCotizacion8_55.qrLabelRNC.Caption:='RNC-' + qryClienteRNC_NUMERO.Value;
      qckCotizacion8_55.nombreCteGenerico:= qryClienteNOMBRE_CTE.Value;
    end;

    //qckCotizacion8_55:=TqckCotizacion8_55.Create(Nil);
    try
      if GlbSizeCotiza8x11 = 1 then
      qckCotizacion8_55.Page.Length := 11;

      qckCotizacion8_55.xtipoVenta := 'COTIZACION';
      if MessageDlg('Imprimir?',mtInformation, [mbyes, mbno], 0) = mrYes then
      qckCotizacion8_55.Print else qckCotizacion8_55.Preview;
    finally
    qckCotizacion8_55.free;
    qckCotizacion8_55:=nil;
    end;
  end else
  begin
  qckRepRecibo:=TqckRepRecibo.Create(Nil);
  try
    if Length(edtObservacion.Text) > 0 then
    qckRepRecibo.nombreCteGenerico:=edtObservacion.Text
    else 
    if tablaPropietarioCodigoPropietario.Value > 0 then
    begin
      qryCliente.Locate('CODIGO_CTE', tablaPropietarioCodigoPropietario.Value,[]);
      qckRepRecibo.qrLabelRNC.Caption:='RNC-' + qryClienteRNC_NUMERO.Value;
      qckRepRecibo.nombreCteGenerico:= qryClienteNOMBRE_CTE.Value;
    end;
    qckRepRecibo.xtipoVenta := 'COTIZACION';
    qckRepRecibo.valorNCF:= '';
    if rxVenta.RecordCount > 2 then
    qckRepRecibo.Page.Length:= qckRepRecibo.Page.Length +
    (rxVenta.RecordCount - 2 ) * 0.65;
    if (GlbImpReciboSinPreg = 1) then
    qckRepRecibo.Print else
    if ImprimirRecibo1.Checked then
    begin
      qckRepRecibo.PrinterSetup;
      qckRepRecibo.Print;
    end  else
    qckRepRecibo.Preview;
  finally
  qckRepRecibo.Free;
  qckRepRecibo:=Nil;
  end;
  end;
  rxVenta.EmptyTable;
  Edit1.Text    := '';
  edtCodigo.Text := '';
  BitBtn4.Enabled := False;
  BitBtn1.SetFocus;
  Totales.EmptyTable;
  tablaPropietario.Edit;
  tablaPropietarioCodigoPropietario.AsVariant := null;
  tablaPropietario.Post;
  edtCodigo.SetFocus;
  edtObservacion.Text := '';
end;

procedure TfrmProcVentas.BitBtn9Click(Sender: TObject);
begin
  if Totalesmontorecibido.Value > 0 then
  begin
    MessageDlg('Favor procesar o cancelar venta en progreso',mtInformation, [mbOK], 0);
    Exit;
  end;
  frmCotizaciones:=TfrmCotizaciones.Create(Nil);
  try
    frmCotizaciones.BitBtn4Click(Self);
    if frmCotizaciones.Showmodal = mrOk then
    begin
      rxVenta.Close;
      rxVenta.Open;
      frmCotizaciones.ibqryCotizacionDet.First;
      While Not frmCotizaciones.ibqryCotizacionDet.Eof do
      begin
        if (frmCotizaciones.ibqryCotizacionDetCANTIDAD.Value > 0)
        and (frmCotizaciones.ibqryCotizacionDetSTATUS_DET.Value = 'A') then
        begin
          rxVenta.Insert;
          ProcCargaDatosCotizacion;
          if rxVenta.state in [dsInsert,dsedit] then
          rxVenta.Post;
          tablaPropietario.Edit;
          tablaPropietarioCodigoPropietario.Value:=
          frmCotizaciones.ibqryCotizacionMasterCODIGO_CTE.Value;
          tablaPropietario.Post;
        end;
        frmCotizaciones.ibqryCotizacionDet.Next;
      end;
    end;
  finally
  frmCotizaciones.Free;
  frmCotizaciones:=Nil;
  end;
end;

procedure TfrmProcVentas.BuscarCliente1Click(Sender: TObject);
begin
  FrmBuscarClientesPersonas:=TFrmBuscarClientesPersonas.Create(Nil);
  try
    xCodigoCte:=-1;
    if FrmBuscarClientesPersonas.Showmodal = mrOk then
    xCodigoCte := FrmBuscarClientesPersonas.CodigoCliente;
  finally
  FrmBuscarClientesPersonas.Free;
  FrmBuscarClientesPersonas:=Nil;
  end;
end;

procedure TfrmProcVentas.CargarPreventa;
begin

end;

procedure TfrmProcVentas.chkExentoEnter(Sender: TObject);
begin
  chkExento.SetFocus;
end;

procedure TfrmProcVentas.chkExentoExit(Sender: TObject);
begin
  if (rxVenta.Recordcount > 1) then
  begin
    SumarDatos := False;
    rxVenta.EnableControls;
    rxVenta.First;
    While Not rxVenta.Eof Do
    begin
      rxVenta.Edit;
      ProcesaCalculos;
      rxVenta.Next;
    end;
    sumarDatos := True;
    rxVenta.Edit;
    rxVenta.Post;
  end else
  begin
    rxVenta.Edit;
    ProcesaCalculos;
    //rxVenta.Post;
  end;
end;

procedure TfrmProcVentas.Cotizar1Click(Sender: TObject);
begin
  //BuscarCliente1Click(Self);
  BitBtn8Click(Self)
end;

procedure TfrmProcVentas.CuadreCaja1Click(Sender: TObject);
begin
  frmSelFecha:=TfrmSelFecha.Create(nil);
  try
    frmSelFecha.FechaIni.Date:=GlbFechaTrnDiaria;
    frmSelFecha.FechaFin.Date:=GlbFechaTrnDiaria;
    if frmSelFecha.showmodal = mrOk then
    begin
      dmReportes.qryDatosRepVentaDiaria.Close;
      dmReportes.qryDatosRepVentaDiaria.Params[0].value:= ExtraerFecha(frmSelFecha.FechaIni.Date);
      dmReportes.qryDatosRepVentaDiaria.Params[1].value:= ExtraerFecha(frmSelFecha.FechaFin.Date);
      dmReportes.qryDatosRepVentaDiaria.Open;

      qckRepVentaDiaria:=tQckRepVentaDiaria.Create(Nil);
      try
        qckRepVentaDiaria.Prepare;
        qckRepVentaDiaria.qrTpaginas.Caption:=' de '+IntToStr(qckRepVentaDiaria.PageNumber);
        qckRepVentaDiaria.Preview;
      finally
      qckRepVentaDiaria.Free;
      qckRepVentaDiaria:=Nil;
      end;
    end;
  finally
  frmSelFecha.Free;
  frmSelFecha:=Nil;
  end;
end;

procedure TfrmProcVentas.DBEdit1Enter(Sender: TObject);
begin
  yNumSerie:= rxVentaSerie.Value;
  if Not Prod_existe and ((rxVenta.State in [dsEdit, dsInsert]) or (rxVenta.RecordCount > 0)) then
  begin
    MessageDlg('codigo producto no encontrado, verifique', mtInformation, [mbOK], 0);
    edtCodigo.SetFocus;
    Exit;
  end;
  //ProcesaCalculos;
  Panel2.Visible:=False;
end;

procedure TfrmProcVentas.DBEdit1Exit(Sender: TObject);
//var
//  guardarRec : TBookMark;
begin
  if rxVenta.State In [dsInsert, dsEdit] then
  begin
    if (rxVentaCant.Value > qryProductosCANTIDAD.Value) and (GlbPermiteVentaInv0 = 0) then
    begin
      MessageDlg('Cantidad venta es mayor que existencia inventario', mtWarning, [mbOK], 0);
      DBEdit1.SetFocus;
      exit;
    end;

    if (rxVentaCant.Value < 0) then
    begin
      MessageDlg('Cantidad no puede ser numero negativo, verifique',mtError, [mbOK], 0);
      DBEdit1.SetFocus;
      exit;
    end;

    rxVentaMontoBruto.Value:= rxVentaCant.Value * rxVentaPrecio.Value;
    if EsDevolucion then
    rxVentaMontoBruto.Value:=rxVentaMontoBruto.Value * -1;
  end;
  // guardarRec := rxVenta.GetBookmark;
  //Aplica Descuento e Itbis
  GlbNumero:= rxVentaSerie.Value;
  ProcesaCalculos;

  if rxVenta.State In [dsInsert, dsEdit] Then
  rxVenta.Post;
  //ProcesaNuevo;
  edtCodigo.SelectAll;
  edtCodigo.ClearSelection;

  //if frmProcVentaRapida.Showing then
  if isShowing then
  edtCodigo.SetFocus;

  panel2.Visible := False;

  //BitBtn1.SetFocus;
  //if frmProcVentaRapida.Showing then
  if isShowing then
  if (GlbPermiteCambioPrecio ) then //Adm
  begin
    DBEdit2.ReadOnly := False;
    DBEdit2.SetFocus;
  end else ProcesaCalculos;
 // rxVenta.GotoBookmark(guardarRec);
 // rxVenta.FreeBookmark(guardarRec);
end;

procedure TfrmProcVentas.DBEdit2Enter(Sender: TObject);
begin
  if (GlbNumero > 0) then
  rxVenta.Locate('Serie', GlbNumero,[]);
  DBEdit2.SelectAll;
end;

procedure TfrmProcVentas.DBEdit2Exit(Sender: TObject);
var
  guardarRec : TBookMark;
  porcdes : Extended;
begin
  if DBEdit2.ReadOnly = false then
  begin
  //guardarRec := rxVenta.GetBookmark;
  end;
  
  //Aquiiiiiiiiiiiii
  //tj if (PrecioAnterior <> rxVentaPrecio.Value) And (Entro) And (GlbPermiteCambioPrecio) then
  //tj begin
  //tj   if PrecioAnterior > 0 then
  //tj   porcdes := 1 - (PrecioAnterior - rxVentaPrecio.Value)/PrecioAnterior
  //tj   else porcdes:=0;
  //tj   BitBtn10Click(Self);
  //tj   TotalesPorcDesAdicional.Value:= porcdes;
  //tj   DBEdit5Exit(Self);
  //tj end;{t else
  //tj begin
  //tj   if rxVenta.State In [dsBrowse] Then
  //tj   rxVenta.Edit;
  //tj   rxVentaPrecio.Value:=qryProductosPRECIO.Value;
  //tj end; }

  ProcesaCalculos;

  if rxVenta.State In [dsInsert, dsEdit] Then
  rxVenta.Post;

  if (DBEdit2.ReadOnly = false) then
  begin
    //rxVenta.GotoBookmark(guardarRec);
    //rxVenta.FreeBookmark(guardarRec);
  end;
  if rxVenta.State = dsBrowse then
  rxVenta.Locate('Serie', yNumSerie,[]);
  if rxVentaCodTexto.Value = '' then Exit;
  if not qryInventario.Locate('CODIGO_TEXTO', rxVentaCodTexto.Value,[]) then
  MessageDlg('codigo '+rxVentaCodTexto.Value+' no encontrado en inventario, verifique', mtError, [mbOK], 0)
  else
  begin
    if (not FAplicaPrecioMayorista) and (rxVentaPrecio.Value < qryInventarioPRECIO_MINIMO.Value) then
    begin
      if MessageDlg('Precio es menor que el minimo, continuar?', mtError, [mbYes,mbNo], 0) = mrno then
      begin
        DBEdit2.ReadOnly := False;
        DBEdit2.SetFocus;
        Exit;
      end;
    end;
  end;

  DBEdit2.ReadOnly := True;
  //if frmProcVentaRapida.Showing then
  if isShowing then
  edtCodigo.SetFocus;
end;

procedure TfrmProcVentas.DBEdit5Exit(Sender: TObject);
begin
  if Totales.State in [dsedit, dsinsert] then
  begin
    ProcesaCalculos;
    if Totales.State in [dsedit, dsinsert] then
    Totales.Post;
  end;

end;

procedure TfrmProcVentas.Devolucin1Click(Sender: TObject);
begin
  TfrmProcVentas.Hide;
  frmEdicionVenta:=TfrmEdicionVenta.Create(Nil);
  try
    frmEdicionVenta.tblDatosVenta.Close;
    frmEdicionVenta.tblDatosVenta.Params[0].value:= ExtraerFecha(glbfechatrndiaria);
    frmEdicionVenta.tblDatosVenta.Open;
    frmEdicionVenta.Caption := 'Procesa devolucion';
    if frmEdicionVenta.ShowModal = mrOk then
    begin
      frmProcVentaRapidaEdicion:=TfrmProcVentaRapidaEdicion.Create(Nil);
      frmProcVentaRapidaEdicion.rxVenta.Close;
      frmProcVentaRapidaEdicion.rxVenta.Open;
      frmEdicionVenta.tblDatosDet.First;
      While Not frmEdicionVenta.tblDatosDet.Eof do
      begin
        frmProcVentaRapidaEdicion.rxVenta.Insert;
        frmProcVentaRapidaEdicion.rxVentaSerie.Value       := frmEdicionVenta.tblDatosDetSERIE.Value;
        frmProcVentaRapidaEdicion.rxVentaNumeroTrn.Value   := frmEdicionVenta.tblDatosDetNUMERO.Value;
        frmProcVentaRapidaEdicion.rxVentaNumeroRecibo.Value:= frmEdicionVenta.tblDatosDetNUMERO.Value;
        frmProcVentaRapidaEdicion.rxVentaFecha.Value       := frmEdicionVenta.tblDatosVentaFECHA.Value;
        frmProcVentaRapidaEdicion.rxVentaCant.Value        := frmEdicionVenta.tblDatosDetCANTIDAD.Value;
        frmProcVentaRapidaEdicion.rxVentaPrecio.Value      := frmEdicionVenta.tblDatosDetPRECIO.Value;
        frmProcVentaRapidaEdicion.rxVentaMontoBruto.Value  := frmEdicionVenta.tblDatosDetVALOR_SERVICIO_DET.Value;
        frmProcVentaRapidaEdicion.rxVentaDescripcion.Value := frmEdicionVenta.tblDatosDetDESCRIPCION.Value;
        //t frmProcVentaRapidaEdicion.rxVentaReferencia.Value  := frmEdicionVenta.tblDatosDetReferencia.Value; 
        //frmProcVentaRapidaEdicion.rxVentaDevolucion.Value:= frmEdicionVenta.tblDatosDet
        frmProcVentaRapidaEdicion.rxVentaMontoNeto.Value   := frmEdicionVenta.tblDatosDetVALOR_TOTAL_DET.Value;
        //frmProcVentaRapidaEdicion.rxVentaCodUsuario.Value  := frmEdicionVenta.tblDatosDet
        frmProcVentaRapidaEdicion.rxVentaCodArticulo.Value := frmEdicionVenta.tblDatosDetCODIGO_PROD.AsInteger;
        frmProcVentaRapidaEdicion.rxVentaCodTexto.Value    := frmEdicionVenta.tblDatosDetCODIGO_PROD.Value;
        //frmProcVentaRapidaEdicion.rxVentaNCF.Value         := frmEdicionVenta.tblDatosDet
        frmProcVentaRapidaEdicion.rxVentaporc_desc.Value   := frmEdicionVenta.tblDatosDetPORC_DESC_DET.Value;
        if not chkExento.Checked then
        frmProcVentaRapidaEdicion.rxVentaItbi.Value        := frmEdicionVenta.tblDatosDetITBI_DET.Value
        else frmProcVentaRapidaEdicion.rxVentaItbi.Value   := 0;
        //frmProcVentaRapidaEdicion.rxVentaMontoDescuento.Value:=frmEdicionVenta.tblDatosDet aaaaaqui
        //frmProcVentaRapidaEdicion.rxVentaSerieProd.Value :=
        //frmProcVentaRapidaEdicion.rxVentaNumeroFactura.Value:=
        frmProcVentaRapidaEdicion.rxVenta.Post;
        frmEdicionVenta.tblDatosDet.Next;
      end;
      try
        frmProcVentaRapidaEdicion.BitBtn4.Enabled:=True;
        frmProcVentaRapidaEdicion.Showmodal;
      finally
      frmProcVentaRapidaEdicion.Free;
      frmProcVentaRapidaEdicion:=Nil;
      end;
    end;
  finally
  frmEdicionVenta.Free;
  frmEdicionVenta:=nil;
  end;
  //frmProcVentaRapida.Show;
  Show;
end;

procedure TfrmProcVentas.Edit1Enter(Sender: TObject);
begin
  if (Totalestotalneto.Value < 0) then
  begin
    MessageDlg('Total neto no puede ser negativo, verifique',mtError, [mbOK], 0);
    exit;
  end;
end;

procedure TfrmProcVentas.Edit1Exit(Sender: TObject);
var
  x,y : Real;
  Activa : Boolean;
  svalue : String;
  xvalue : String;
begin

  Activa:=True;
  if Edit1.text = '' then exit;
  x := StrToFloat(Edit1.Text);

  xvalue := Format('%8.2f', [StrToFloat(Edit1.Text)]);
  svalue := Format('%8.2f', [Totalestotalneto.Value]);
  x:= StrToFloat(xvalue);
  y:= StrToFloat(svalue);
  if (xvalue = svalue) then
  Activa:=True
  else
  if ((x - y) > 0 ) then
  begin
    Activa := False;
  end else Activa := True;

  x := StrToFloat(xvalue) - StrToFloat(svalue);
  Totales.Edit;
  BitBtn4.Enabled := True;
  if Not EsFactura Or Not EsFinanciamiento then
    if (x < -0.09 ) then
    begin
      MessageDlg('Monto entregado es menor que total a pagar, verifique',mtInformation, [mbOK], 0);
      Edit1.SetFocus;
      BitBtn4.Enabled := False;
      Exit;
    end;
  Totalesmontorecibido.AsString := Edit1.Text;
  if (x > 0) then
  Totalesdevolucion.Value := x;
  Totales.Post;

  //if Activa then
  //begin
    BitBtn4.Enabled := True;
    BitBtn4.SetFocus;
  //end;
end;

procedure TfrmProcVentas.EditarBalanceP(monto: Real);
begin

end;

procedure TfrmProcVentas.EditarBalanceP(monto: Real; tipo: Integer);
begin

end;

procedure TfrmProcVentas.edtCodigoChange(Sender: TObject);
begin
  //if rxVenta.State = dsBrowse then
  rxLabelVence.Visible:= False;
  if LectorCodBarra1.Checked then exit;
  BuscandoPorDesc:=False;
  if edtCodigo.Text = '' then Exit;
  if esNumero(edtCodigo.Text) then
  begin
    AsignarSqlText('','','');
    if qryProductos.Locate('Codigo_Texto', edtCodigo.Text,[loCaseInsensitive, loPartialKey]) then
    begin
      if qryVence.Locate('codigo_texto',qryProductosCodigo_Texto.Value,[]) then
      begin
        rxLabelVence.Visible:=true;
        rxLabelVence.Caption:='Vence en ' + qryVenceDIASPORVENCER.AsString;
      end else rxLabelVence.Visible:=False;
      panel2.Top := edtcodigo.Top + 30;
      panel2.Left:= edtcodigo.Left;
      panel2.Visible := True;
      panel2.BringToFront;
    end
  end else
  begin
     BuscandoPorDesc:=True;
    AsignarSqlText('descripcion',chr(39) + edtCodigo.Text +'%'+chr(39),'');
    if qryProductos.Locate('Descripcion',edtCodigo.Text,[loCaseInsensitive, loPartialKey]) then
    begin
      if qryVence.Locate('Codigo_Texto',qryProductosCodigo_Texto.Value,[]) then
      begin
        rxLabelVence.Visible:=true;
        rxLabelVence.Caption:='Vence en ' + qryVenceDIASPORVENCER.AsString;
      end else rxLabelVence.Visible:=False;    
      panel2.Top:=edtcodigo.Top+30;
      panel2.Left:=edtcodigo.Left;
      panel2.Visible:=True;
      panel2.BringToFront;
    end;
  end;
end;

procedure TfrmProcVentas.edtCodigoEnter(Sender: TObject);
begin
  edtCodigo.SelectAll;
end;

procedure TfrmProcVentas.edtCodigoExit(Sender: TObject);
var
  numero : Integer;
begin
  MontoItbisEnPrecio:=0;
  if (edtCodigo.Text = '') then Exit;
  Edit1.Text:='';
  if reciboImpreso then
  Totales.EmptyTable;

  reciboImpreso :=False;

  if BuscandoPorDesc  then
  begin
    RxDBGrid2.SetFocus;
    Exit;
  end;

  if panel2.Visible then
  edtCodigo.Text := qryProductosCodigo_Texto.Value;

  //****************xxxx***********************
  if esNumero(edtCodigo.Text) then
  begin
    AsignarSqlText('','','');
    if qryProductos.Locate('Codigo_Texto', edtCodigo.Text,[loCaseInsensitive, loPartialKey]) then
    begin
      if qryVence.Locate('codigo_texto',qryProductosCodigo_Texto.Value,[]) then
      begin
        rxLabelVence.Visible:=true;
        rxLabelVence.Caption:='Vence en ' + qryVenceDIASPORVENCER.AsString;
      end else rxLabelVence.Visible:=False;
      panel2.Top := edtcodigo.Top + 30;
      panel2.Left:= edtcodigo.Left;
      panel2.Visible := True;
      panel2.BringToFront;
    end
  end else
  begin
     BuscandoPorDesc:=True;
    AsignarSqlText('descripcion',chr(39) + edtCodigo.Text +'%'+chr(39),'');
    if qryProductos.Locate('Descripcion',edtCodigo.Text,[loCaseInsensitive, loPartialKey]) then
    begin
      if qryVence.Locate('Codigo_Texto',qryProductosCodigo_Texto.Value,[]) then
      begin
        rxLabelVence.Visible:=true;
        rxLabelVence.Caption:='Vence en ' + qryVenceDIASPORVENCER.AsString;
      end else rxLabelVence.Visible:=False;    
      panel2.Top:=edtcodigo.Top+30;
      panel2.Left:=edtcodigo.Left;
      panel2.Visible:=True;
      panel2.BringToFront;
    end;
  end;
  //****************xxxx***********************

  if Not qryProductos.Locate('codigo_Texto', edtCodigo.Text,[]) then
  begin
    //MessageDlg('Codigo no encontrado, verifique', mtError, [mbOK], 0);
    //edtCodigo.SetFocus;
    Prod_existe:=False;
  end else
  begin
    Prod_existe:= True;
    qryInventario.Locate('CODIGO_TEXTO', edtCodigo.Text,[]);

    if rxVenta.State = dsBrowse then
    begin
      rxVenta.DisableControls;
      rxVenta.SortOnFields('serie', false, false);
      if (rxVenta.RecordCount > 0) then
      begin
        rxVenta.Last;
        numero := rxVentaSerie.Value + 1;
      end else numero := 1;
      rxVenta.EnableControls;
      rxVenta.Insert;
      rxVentaCant.Value:=1;
      rxVentaInvetariar.Value:= qryProductosINVENTARIAR.Value;
      rxVentaSerie.Value := Numero;
      rxVentaFecha.Value := ExtraerFecha(GlbFechaTrnDiaria);
      rxVentaCodUsuario.Value := VarUsuarioGlb;
    end;
    if rxVenta.State In [dsInsert, dsEdit] then
    begin
      rxVentaDescripcion.Value:= qryProductosDESCRIPCION.Value;
      rxVentaReferencia.Value := qryProductosREFERENCIA.Value;

       //tj MontoItbisEnPrecio:=
       //tj qryProductosPRECIO.Value * FGlbPorcItbi(ExtraerFecha(rxVentaFecha.Value))/100;
       //tj if (qryProductosPAGA_ITBI.Value = 1) And (Not chkExento.Checked)
       //tj and GlbPermiteCambioPrecio then
       //tj rxVentaPrecio.Value  := qryProductosPRECIO.Value * (1 + FGlbPorcItbi(ExtraerFecha(rxVentaFecha.Value))/100)
       //tj else
       //tj begin
        if FAplicaPrecioMayorista then
        rxVentaPrecio.Value  := qryClasifPrecioPRECIO_VENTA.Value
        else
        rxVentaPrecio.Value  := qryProductosPRECIO.Value;
        rxVentaMontoItbisenPrecio.Value:=0;
        MontoItbisEnPrecio:=0;
       //tj end;

      rxVentaCodArticulo.Value:= qryProductoscodigo.Value;
      rxVentaCodTexto.Value   := edtCodigo.Text;
      rxVentaInvetariar.Value:= qryProductosINVENTARIAR.Value;
      qryProdSerie.close;
      //qryProdSerie.Params[0].Value:= edtCodigo.Text;
      qryProdSerie.Params[0].Value:= qryProductoscodigo.Value;
      qryProdSerie.Open;
      if (qryProdSerieSTATUS.Value = 'R') then
      begin
        MessageDlg('Número serie no disponible, verifique',mtInformation, [mbOK], 0);
        edtCodigo.SetFocus;
      end;
      if qryProdSerie.RecordCount > 0 then
      begin
      frmSelSerie:=TfrmSelSerie.Create(Nil);
      try
        if frmSelSerie.Showmodal = mrOk then
        begin
          rxVentaSerieProd.Value:= qryProdSerieSERIE.Value;
        end;
      finally
      frmSelSerie.Free;
      frmSelSerie:= Nil;
      end;
      end;

      dmInventario.qryLote.Close;
      dmInventario.qryLote.Params[0].Value:= qryInventarioCODIGO.Value;
      dmInventario.qryLote.Open;
      if dmInventario.qryLote.recordcount > 0 then
      begin
        frmShowLote:=TfrmShowLote.Create(Nil);
        try
          if frmShowLote.Showmodal = mrok then
          rxVentaloteNum.Value:= dmInventario.qryLoteLOTE_NUM.Value;
        finally
        frmShowLote.free;
        frmShowLote:=nil;
        end;
      end;
    end else ProcesaNuevo;
  end;
  panel2.Visible:=MostrarVistaproductos1.Checked;
  if LectorCodBarra1.Checked And (rxVentaPrecio.Value > 0) then
  begin
    DBEdit1Enter(Self);
    DBEdit1Exit(Self);
    edtCodigo.SetFocus;
  end;
end;

procedure TfrmProcVentas.edtReferenciaChange(Sender: TObject);
begin
  if qryProductos.Locate('referencia', edtReferencia.Text, [loCaseInsensitive, loPartialKey]) then
  begin
    Prod_existe:= True;
    edtCodigo.Text := qryProductosCODIGO_TEXTO.Value;
    panel2.Top := edtcodigo.Top+30;
    panel2.Left:= edtcodigo.Left;
    panel2.Visible:=True;
    panel2.BringToFront;
  end
end;

procedure TfrmProcVentas.edtReferenciaExit(Sender: TObject);
begin
  if Panel2.Visible then
  edtReferencia.Text := qryProductosCodigo_Texto.Value;

  qryProductos.Locate('Referencia', edtReferencia.Text, [loCaseInsensitive, loPartialKey])

end;

procedure TfrmProcVentas.Finalizardisplay;
begin

end;

function TfrmProcVentas.FncFrecuencia(Frec: Integer): String;
begin

end;

procedure TfrmProcVentas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var
    xxxx : word; item : String;
begin
  //113-F2 f4-115   f5-116     f3-114
  xxxx:= key;
  if (key = 123) then //F12
  begin
    NoGenerarNCF1Click(Self);
  end;
  if (key = 120) then
  BitBtn5Click(self);
  
  if (key = 27) then
  begin
    if MessageDlg('Cerrar ventana?', mtInformation, [mbYes,mbNo], 0) = mryes then
    Close;
  end;
  if (key = 121) then //F10
  LectorCodBarra1Click(Self);
  //lectorcodbarra1.Checked:= not lectorcodbarra1.Checked;
  
  if (key = 118) then //F7
  BuscarCliente1Click(Self)
  else if (key = 117) then
  CheckBox1.checked:= Not CheckBox1.checked;
  if (key = 113) then
  begin
    edtCodigo.SetFocus;
    Exit;
  end;
  if (key = 115) then
  BitBtn3Click(Self) else
  if (key = 113) then BitBtn1Click(Self)
  else if (key = 114) then BitBtn2Click(Self)
  else if (key = 116) then
  if (Edit1.Text <> '') then
  BitBtn4Click(Self)
  else if (key = 119) then //F9
  begin
    if rxVenta.State = dsBrowse then
    begin
      item:=InputBox('Borrar un item','Entre número item a eliminar','');
      if rxVenta.Locate('Serie', strToInt(item),[]) then
      rxVenta.Delete;
      ProcesarSumaTotal;
  end;
  end;
end;

procedure TfrmProcVentas.ImprimirFactura(Avance: Integer);
begin

end;

procedure TfrmProcVentas.ImprimirLabel1Click(Sender: TObject);
begin
  frmCodigoBarra:=TfrmCodigoBarra.Create(Nil);
  try
    if frmCodigoBarra.qryInv.State = dsBrowse then
    begin
      if Not frmCodigoBarra.qryInv.Locate('codigo', rxVentaCodArticulo.Value, []) then
      MessageDlg('Codigo no encontrado en tabla inventario.', mtInformation, [mbOK], 0);
    end;
    frmCodigoBarra.ShowModal;
  finally
  frmCodigoBarra.Free;
  frmCodigoBarra:= Nil;
  end;
end;

procedure TfrmProcVentas.ImprimirRecibo1Click(Sender: TObject);
begin
  ImprimirRecibo1.Checked:= Not ImprimirRecibo1.Checked;
end;

procedure TfrmProcVentas.InsertaBalanceP(monto: Real);
begin

end;

procedure TfrmProcVentas.InsertarCotizacionDet(numero: Integer);
begin

end;

procedure TfrmProcVentas.InsertarDet(numero: Integer);
begin

end;

procedure TfrmProcVentas.Inventario1Click(Sender: TObject);
begin
  frmRegMiniInvientario:=tfrmRegMiniInvientario.Create(nil);
  try
    frmRegMiniInvientario.Showmodal;
    if frmRegMiniInvientario.CodigoTexto <> '' then
    edtCodigo.Text:=frmRegMiniInvientario.CodigoTexto;
    edtCodigo.SetFocus;
  finally
  frmRegMiniInvientario.free;
  frmRegMiniInvientario:=nil;
  end;
end;

procedure TfrmProcVentas.LectorCodBarra1Click(Sender: TObject);
begin
  LectorCodBarra1.Checked:= Not LectorCodBarra1.Checked;
  if lectorcodbarra1.Checked then
  edtCodigo.Hint:='Enter - para buscar codigo barra. F10-on/off'
  else edtCodigo.Hint:= '';
end;

procedure TfrmProcVentas.LlenarTipoUnidadBox(umedida: integer);
begin

end;

procedure TfrmProcVentas.MaestroCliente1Click(Sender: TObject);
begin
  frmClientes:=TfrmClientes.Create(Self);
  try
    frmClientes.Showmodal;
  finally
  frmClientes.Free;
  frmClientes:=Nil;
  end;
end;

procedure TfrmProcVentas.MostrarVistaproductos1Click(Sender: TObject);
begin
  MostrarVistaproductos1.Checked := Not MostrarVistaproductos1.Checked;
end;

procedure TfrmProcVentas.NoGenerarNCF1Click(Sender: TObject);
begin
  NoGenerarNCF1.Checked := not NoGenerarNCF1.Checked;
  if  NoGenerarNCF1.Checked then
  Label21.Visible := True else
  Label21.Visible := false;
  CheckBox1.Visible := Not Label21.Visible;
end;

procedure TfrmProcVentas.NoMostrarProdVencidos1Click(Sender: TObject);
begin
  NoMostrarProdVencidos1.Checked:= not NoMostrarProdVencidos1.Checked;
  if NoMostrarProdVencidos1.Checked then
  begin
    SecretPanel1.Visible:=True;
    SecretPanel1.Active :=True;
  end
  else SecretPanel1.Visible:=False;
end;

procedure TfrmProcVentas.NotaCrdito1Click(Sender: TObject);
begin
  {frmTransCxcNCdbDev:=TfrmTransCxcNCdbDev.Create(Nil);
  try
    frmTransCxcNCdbDev.RadioGroup1.ItemIndex:=0;
    frmTransCxcNCdbDev.Caption:='Nota de Crédito';
    frmTransCxcNCdbDev.Showmodal;
  finally
  frmTransCxcNCdbDev.Free;
  frmTransCxcNCdbDev:=Nil;
  end;}
end;

procedure TfrmProcVentas.NotaDebito1Click(Sender: TObject);
begin
 { frmTransCxcNCdbDev:=TfrmTransCxcNCdbDev.Create(Nil);
  try
    frmTransCxcNCdbDev.RadioGroup1.ItemIndex:=1;
    frmTransCxcNCdbDev.Caption:='Nota de Debito';
    frmTransCxcNCdbDev.Showmodal;
  finally
  frmTransCxcNCdbDev.Free;
  frmTransCxcNCdbDev:=Nil;
  end; }
end;

function TfrmProcVentas.precioXUnidad(idTipoUnidad,
  idProducto: Integer): Extended;
begin

end;

procedure TfrmProcVentas.ProcActUltTrn;
begin

end;

procedure TfrmProcVentas.ProcCargaDatosCotizacion;
begin

end;

procedure TfrmProcVentas.ProcesaCalculos;
begin

end;

procedure TfrmProcVentas.ProcesaFacturar(tipo: smallint; numdoc,
  codcte: integer);
begin

end;

procedure TfrmProcVentas.ProcesaNuevo;
begin

end;

procedure TfrmProcVentas.ProcesarSumaTotal;
begin

end;

procedure TfrmProcVentas.ProcVenta(valorNCF: String;
  Serie_Asignadoncf: Integer; var serieDoc: Integer);
begin

end;

procedure TfrmProcVentas.ProcVentaConNCF(tiponcf: String;
  var valorNCF: String; var seriedoc, serie_asignadoncf: Integer);
begin

end;

procedure TfrmProcVentas.qryClienteAfterScroll(DataSet: TDataSet);
begin
  AbrirClasifPrecio;
end;

procedure TfrmProcVentas.qryProductosAfterScroll(DataSet: TDataSet);
begin
  FAplicaPrecioMayorista := False;
  Label23.Visible := False;
  if qryClasifPrecio.state = dsInactive then exit;
  if qryClasifPrecio.Locate('COD_PRODUCTO', qryProductoscodigo.Value,[]) then
  begin
  //MessageDlg('Precio Mayorista no ha sido configurado para este producto', mtInformation, [mbOK], 0)
  //else
    FAplicaPrecioMayorista := True;
    Label23.Visible := True;
  end;
end;

procedure TfrmProcVentas.ReImprimirRecibo1Click(Sender: TObject);
begin
  //frmProcVentaRapida.Hide;
  frmEdicionVenta:=TfrmEdicionVenta.Create(Nil);
  try
    frmEdicionVenta.tblDatosVenta.Close;
    frmEdicionVenta.tblDatosVenta.Params[0].Value:= ExtraerFecha(GlbFechaTrnDiaria);
    frmEdicionVenta.tblDatosVenta.Open;

    frmEdicionVenta.EditN1.Text:=InputBox('Re-Imprimir recibo','Entre número','');
    frmEdicionVenta.Button1Click(Self);
    frmEdicionVenta.BitBtn3.Click;
    frmEdicionVenta.Caption := 'Procesa devolución';

    rxSolDatoscte.Close;
    rxSolDatoscte.Open;
    rxSolDatoscte.Insert;
    rxSolDatoscteNombre.Value    := frmEdicionVenta.qryClientesNOMBRE_CTE.Value;
    rxSolDatoscteDireccion1.Value:= frmEdicionVenta.qryClientesDIRECCION_CONT.Value;
    rxSolDatoscteDireccion2.Value:= '';
    rxSolDatoscteCedula.Value    := frmEdicionVenta.qryClientesCEDULA.Value;
    rxSolDatoscteCiudad.Value    := frmEdicionVenta.qryClientesCIUDAD.Value;
    rxSolDatoscteTelefono.Value  := frmEdicionVenta.qryClientesTELEF_CONTACTO.Value;
    rxSolDatoscte.Post;

    begin
      frmProcVentaRapidaEdicion:=TfrmProcVentaRapidaEdicion.Create(Nil);
      frmProcVentaRapidaEdicion.rxVenta.Close;
      frmProcVentaRapidaEdicion.rxVenta.Open;
      if frmProcVentaRapidaEdicion.tablaPropietario.State = dsBrowse then
      frmProcVentaRapidaEdicion.tablaPropietario.Edit;
      frmProcVentaRapidaEdicion.tablaPropietarioCodigoPropietario.Value:=
      frmEdicionVenta.qryClientesCODIGO_CTE.Value;
      frmProcVentaRapidaEdicion.tablaPropietario.Post;
      
      frmEdicionVenta.tblDatosDet.First;
      While Not frmEdicionVenta.tblDatosDet.Eof do
      begin
        frmProcVentaRapidaEdicion.rxVenta.Insert;
        frmProcVentaRapidaEdicion.rxVentaSerie.Value       := frmEdicionVenta.tblDatosDetSERIE.Value;
        frmProcVentaRapidaEdicion.rxVentaNumeroTrn.Value   := frmEdicionVenta.tblDatosDetNUMERO.Value;

        frmProcVentaRapidaEdicion.rxVentaNumeroRecibo.Value:= frmEdicionVenta.tblDatosVentaNUMERO_DOC_PAGO.AsInteger;
        frmProcVentaRapidaEdicion.rxVentaNumeroDoc.Value:=   frmEdicionVenta.tblDatosVentaNUMERO_DOC_PAGO.AsInteger;
        frmProcVentaRapidaEdicion.rxVentaNumeroRecibo.Value:= frmEdicionVenta.tblDatosDetNUMERO.Value;

        frmProcVentaRapidaEdicion.rxVentaFecha.Value       := frmEdicionVenta.tblDatosVentaFECHA.Value;
        frmProcVentaRapidaEdicion.rxVentaCant.Value        := frmEdicionVenta.tblDatosDetCANTIDAD.Value;
        frmProcVentaRapidaEdicion.rxVentaPrecio.Value      := frmEdicionVenta.tblDatosDetPRECIO.Value;
        frmProcVentaRapidaEdicion.rxVentaMontoBruto.Value  := frmEdicionVenta.tblDatosDetVALOR_SERVICIO_DET.Value;
        frmProcVentaRapidaEdicion.rxVentaDescripcion.Value := frmEdicionVenta.tblDatosDetDESCRIPCION.Value;
        frmProcVentaRapidaEdicion.rxVentaMontoNeto.Value   := frmEdicionVenta.tblDatosDetVALOR_TOTAL_DET.Value;
        frmProcVentaRapidaEdicion.rxVentaCodArticulo.Value := frmEdicionVenta.tblDatosDetCODIGO_PROD.AsInteger;
        frmProcVentaRapidaEdicion.rxVentaCodTexto.Value    := frmEdicionVenta.tblDatosDetCODIGO_PROD.Value;
        frmProcVentaRapidaEdicion.rxVentaporc_desc.Value   := frmEdicionVenta.tblDatosDetPORC_DESC_DET.Value;

        if not chkExento.Checked then
        frmProcVentaRapidaEdicion.rxVentaItbi.Value        := frmEdicionVenta.tblDatosDetITBI_DET.Value
        else frmProcVentaRapidaEdicion.rxVentaItbi.Value   := 0;
        frmProcVentaRapidaEdicion.rxVenta.Post;
        frmEdicionVenta.tblDatosDet.Next;
      end;

      tblDatosVentaVehiculos.Close;
      tblDatosVentaVehiculos.Params[0].Value := frmEdicionVenta.tblDatosDetNUMERO.Value;
      tblDatosVentaVehiculos.Open;

      try
        frmProcVentaRapidaEdicion.BitBtn4.Enabled:=True;
        //aquiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii voy juannnnnnnnnnnnnn

        GlbDescNCF:= frmEdicionVenta.qryNCFDataDESCRIPCION.Value;
        if frmProcVentaRapidaEdicion.Totales.State = dsBrowse then
        frmProcVentaRapidaEdicion.Totales.Edit;
        frmProcVentaRapidaEdicion.TotalesqrLabelNcfDesc.Value:=GlbDescNCF;
        frmProcVentaRapidaEdicion.TotalesNombreCliente.Value :=
        frmEdicionVenta.tblDatosVentaNOMBRECLIENTE.Value;

        if qryCliente.Locate('CODIGO_CTE',frmEdicionVenta.tblDatosVentaCODIGO_CTE.Value,[]) then
        begin
          frmProcVentaRapidaEdicion.TotalesNombreCliente.Value := qryClienteNOMBRE_CTE.Value;
          frmProcVentaRapidaEdicion.TotalesDireccion.Value     := qryClienteDIRECCION_CONT.Value;
          frmProcVentaRapidaEdicion.TotalesTelefono.Value      := qryClienteTELEF_CONTACTO.Value;
          frmProcVentaRapidaEdicion.TotalesCodCliente.Value    := qryClienteCODIGO_CTE.Value;
          frmProcVentaRapidaEdicion.TotalesRNC_NUMERO.Value    := qryClienteRNC_NUMERO.Value;
        end;
        if frmProcVentaRapidaEdicion.Totales.State In [dsEdit, dsInsert] then
        frmProcVentaRapidaEdicion.Totales.Post;

        frmProcVentaRapidaEdicion.BitBtn4Click(Self);
      finally
      frmProcVentaRapidaEdicion.Free;
      frmProcVentaRapidaEdicion:=Nil;
      end;
    end;
  finally
  frmEdicionVenta.Free;
  frmEdicionVenta:=nil;
  end;
  Show;
end;

procedure TfrmProcVentas.RxDBGrid2DblClick(Sender: TObject);
begin
  //edtCodigo.Text:= frmProcVentaRapida.qryProductosCodigo_texto.Value;
  edtCodigo.Text := qryProductosCodigo_texto.Value;
  panel2.Visible := False;
  Prod_existe    := True;
  DBEdit1.SetFocus;
  edtCodigoExit(Self);
end;

procedure TfrmProcVentas.RxDBGrid2GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if qryProductosCANTIDAD.Value <=5 then
  begin
    BackGround := clYellow;
    aFont.Color := clblack;
  end;
end;

procedure TfrmProcVentas.RxDBGrid2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = 13 then
  RxDBGrid2DblClick(Self);
end;

procedure TfrmProcVentas.RxDBGrid2KeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = '#13' then
  RxDBGrid2DblClick(Self);
end;

procedure TfrmProcVentas.RxDBGrid3DblClick(Sender: TObject);
begin
  RxDBGrid3.Visible:=false;
end;

procedure TfrmProcVentas.RxDBLookupCombo1Exit(Sender: TObject);
begin
  AbrirClasifPrecio;
  AplicaPrecioMayorista;
end;

procedure TfrmProcVentas.RxLabel1Click(Sender: TObject);
begin
  ProcActUltTrn;
end;

procedure TfrmProcVentas.rxLabelVenceDblClick(Sender: TObject);
begin
  RxDBGrid3.Visible:= True;
end;

procedure TfrmProcVentas.rxVentaAfterPost(DataSet: TDataSet);
//var
//  GuardarRec : TBookMark;
begin
//  GuardarRec := rxVenta.GetBookmark;
  if sumarDatos then
  ProcesarSumaTotal;

//  rxVenta.GotoBookmark(GuardarRec);
//  rxVenta.FreeBookmark(GuardarRec);
end;

procedure TfrmProcVentas.rxVentaBeforePost(DataSet: TDataSet);
begin
  if rxVentaCant.IsNull or rxVentaPrecio.IsNull then
  begin
    DataSet.Cancel;
    //if frmProcVentaRapida.Showing then
    if isShowing then
    BitBtn1.SetFocus;
  end;
end;

procedure TfrmProcVentas.SecretPanel1DblClick(Sender: TObject);
begin
  RxDBGrid3.Visible:= True;
  SecretPanel1.Visible:=False;
end;

function TfrmProcVentas.VerificaClave: Boolean;
begin

end;

function TfrmProcVentas.VerificaLimiteCredito(codigocte: integer;
  MontoVenta: Real): Boolean;
begin

end;

end.
