unit UProcVentaRapida;
//UFormConsignacion

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, RXDBCtrl, DBCtrls,
  Printers, DB, Mask, RxMemDS, EditNew, IBCustomDataSet, IBQuery, WinSkinData, Menus,
  ShellApi, RXCtrls, IBStoredProc, IBSQL, RxLookup, RXSpin, OleServer,
  ExcelXP, comObj, rxToolEdit, RxDBComb, IBTable;

type
  TfrmProcVentaRapida = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
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
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DataSource1: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBText1: TDBText;
    Label4: TLabel;
    RxDBGrid1: TRxDBGrid;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    Label6: TLabel;
    rxVentaCodArticulo: TIntegerField;
    BitBtn5: TBitBtn;
    Label7: TLabel;
    Edit1: TEdit;
    Label8: TLabel;
    edtCodigo: TEditN;
    qryProductos: TIBQuery;
    qryProductosCODIGO: TIntegerField;
    qryProductosCODIGO_TEXTO: TIBStringField;
    qryProductosDESCRIPCION: TIBStringField;
    qryProductosPRECIO: TFloatField;
    PopupMenu1: TPopupMenu;
    Inventario1: TMenuItem;
    CuadreCaja1: TMenuItem;
    RxSpeedButton5: TRxSpeedButton;
    ipStpInsertVentMast: TIBStoredProc;
    Label9: TLabel;
    Label10: TLabel;
    Ayuda1: TMenuItem;
    ImprimirRecibo1: TMenuItem;
    rxVentaNumeroRecibo: TIntegerField;
    Label11: TLabel;
    Label12: TLabel;
    rxVentaCodTexto: TStringField;
    rxVentaNCF: TStringField;
    NCFSinValorFiscal1: TMenuItem;
    CheckBox1: TCheckBox;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    Shape4: TShape;
    rxVentaNumeroTrn: TIntegerField;
    BuscarCliente1: TMenuItem;
    Cotizar1: TMenuItem;
    BitBtn8: TBitBtn;
    ipStpInsertCotizaMast: TIBStoredProc;
    dsqryInventario: TDataSource;
    qryInventario: TIBQuery;
    qryInventarioDESCRIPCION: TIBStringField;
    qryInventarioPRECIO: TFloatField;
    qryInventarioPAGA_ITBI: TSmallintField;
    qryInventarioDESC_TIPOINV: TIBStringField;
    qryInventarioTIPO: TIntegerField;
    qryInventarioPORC_DESCUENTO: TFloatField;
    qryInventarioCANTIDAD: TFloatField;
    rxVentaporc_desc: TFloatField;
    rxVentaItbi: TFloatField;
    ibStpActualizaInvProd: TIBStoredProc;
    BitBtn9: TBitBtn;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    rxVentaMontoDescuento: TFloatField;
    Totales: TRxMemoryData;
    TotalesSubTotal: TFloatField;
    Totalesitbis: TFloatField;
    Totalesmontodesc: TFloatField;
    Totalestotalneto: TFloatField;
    Totalesmontorecibido: TFloatField;
    Totalesdevolucion: TFloatField;
    dsTotales: TDataSource;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText5: TDBText;
    DBText7: TDBText;
    TotalesCodCliente: TIntegerField;
    TotalesNombreCliente: TStringField;
    TotalesDireccion: TStringField;
    TotalesTelefono: TStringField;
    MaestroCliente1: TMenuItem;
    Panel2: TPanel;
    RxDBGrid2: TRxDBGrid;
    DataSource2: TDataSource;
    Label16: TLabel;
    TotalesPorcDesAdicional: TFloatField;
    TotalesMontoDescAdicional: TFloatField;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    Totalesncf_numero: TStringField;
    TotalesMontoInteres: TCurrencyField;
    DBText6: TDBText;
    Label17: TLabel;
    BitBtn12: TBitBtn;
    rxSolDatoscte: TRxMemoryData;
    rxSolDatoscteNombre: TStringField;
    rxSolDatoscteDireccion1: TStringField;
    rxSolDatoscteDireccion2: TStringField;
    rxSolDatoscteTelefono: TStringField;
    rxSolDatoscteCedula: TStringField;
    rxSolDatoscteCelular: TStringField;
    rxSolDatoscteSector: TStringField;
    rxSolDatoscteCiudad: TStringField;
    rxSolDatoscteApodo: TStringField;
    rxSolDatoscteOtraPersona: TStringField;
    TotalesPorcientoInteres: TFloatField;
    qryProdSerie: TIBQuery;
    qryProdSerieCODIGO: TIntegerField;
    qryProdSerieSERIE: TIBStringField;
    qryProdSerieSTATUS: TIBStringField;
    rxVentaSerieProd: TStringField;
    MostrarVistaproductos1: TMenuItem;
    Label18: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    DBEdit6: TDBEdit;
    qryCliente: TIBQuery;
    qryClienteCODIGO_CTE: TIntegerField;
    qryClienteNOMBRE_CTE: TIBStringField;
    qryClienteNOMBRE_ABREV: TIBStringField;
    qryClienteNOMBRE_FACTURAR: TIBStringField;
    qryClienteDIRECCION_CONT: TIBStringField;
    qryClienteTELEF_CONTACTO: TIBStringField;
    qryClienteCIUDAD: TIBStringField;
    dsqryCliente: TDataSource;
    dstablaPropietario: TDataSource;
    tablaPropietario: TRxMemoryData;
    tablaPropietarioCodigoPropietario: TIntegerField;
    qryProductosREFERENCIA: TIBStringField;
    edtReferencia: TEditN;
    Label19: TLabel;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;
    rxVentaNumeroFactura: TIntegerField;
    NotaCrdito1: TMenuItem;
    NotaDebito1: TMenuItem;
    Devolucin1: TMenuItem;
    Label20: TLabel;
    edtObservacion: TEdit;
    qryInventarioPRECIO_MINIMO: TFloatField;
    chkExento: TCheckBox;
    lblProcDev: TLabel;
    qryProductosPRECIO_MINIMO: TFloatField;
    qryProductosCANTIDAD: TFloatField;
    TotalesqrLabelNcfDesc: TStringField;
    qryClienteRNC: TIBStringField;
    qryClienteRNC_NUMERO: TIBStringField;
    TotalesRnc_Numero: TStringField;
    ReImprimirRecibo1: TMenuItem;
    BitBtn15: TBitBtn;
    stpProcBuscarUltNum: TIBStoredProc;
    RxLabel1: TRxLabel;
    RxLabel2: TRxLabel;
    tblDatosVentaVehiculos: TIBDataSet;
    tblDatosVentaVehiculosNUM_SERIE: TIntegerField;
    tblDatosVentaVehiculosMARCA: TIBStringField;
    tblDatosVentaVehiculosMODELO: TIBStringField;
    tblDatosVentaVehiculosPLACA: TIBStringField;
    tblDatosVentaVehiculosMONTO_INICIAL: TFloatField;
    qryClienteCEDULA: TIBStringField;
    qryInventarioCODIGO_TEXTO: TIBStringField;
    LectorCodBarra1: TMenuItem;
    qryProductosINVENTARIAR: TSmallintField;
    qryInventarioINVENTARIAR: TSmallintField;
    rxVentaInvetariar: TSmallintField;
    tblProductoSerie: TIBDataSet;
    tblProductoSerieCODIGO: TIntegerField;
    tblProductoSerieSERIE: TIBStringField;
    tblProductoSerieSTATUS: TIBStringField;
    qryInventarioCODIGO: TIntegerField;
    rxVentaloteNum: TStringField;
    ibstpUpdateLote: TIBStoredProc;
    qryProductosPAGA_ITBI: TSmallintField;
    rxVentaMontoItbisenPrecio: TCurrencyField;
    rxVentaReferencia: TStringField;
    ImprimirLabel1: TMenuItem;
    NoGenerarNCF1: TMenuItem;
    Label21: TLabel;
    rxSolDatosctencfDescripcion: TStringField;
    BitBtn16: TBitBtn;
    ibstpProcSecuencia: TIBStoredProc;
    rxVentaNumeroDoc: TIntegerField;
    chkDisplay: TCheckBox;
    stpMantInvAlmacen: TIBStoredProc;
    Label22: TLabel;
    lblInventario: TLabel;
    qryClientePRECIO_ID: TIntegerField;
    qryClasifPrecio: TIBQuery;
    qryClasifPrecioCOD_PRODUCTO: TIntegerField;
    qryClasifPrecioPRECIO_ID: TIntegerField;
    qryClasifPrecioPRECIO_VENTA: TFloatField;
    Label23: TLabel;
    ibsqlBceCxcCte: TIBSQL;
    qryClienteLIMITE_CREDITO: TFloatField;
    SecretPanel1: TSecretPanel;
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
    RxDBGrid3: TRxDBGrid;
    dsqryVence: TDataSource;
    NoMostrarProdVencidos1: TMenuItem;
    rxLabelVence: TRxLabel;
    rxqryInv: TRxMemoryData;
    rxqryInvCODIGO: TIntegerField;
    rxqryInvCODIGO_TEXTO: TStringField;
    rxqryInvDESCRIPCION: TStringField;
    rxqryInvREFERENCIA: TStringField;
    rxqryInvPAGA_ITBI: TSmallintField;
    dsrxqryInv: TDataSource;
    rxqryInvPRECIO: TCurrencyField;
    rxqryInvPRECIO_MINIMO: TCurrencyField;
    rxqryInvCANTIDAD: TCurrencyField;
    rxqryInvINVENTARIAR: TIntegerField;
    qryInventarioREFERENCIA: TIBStringField;
    rxqryInvPORC_DESCUENTO: TCurrencyField;
    ibsqlVerificaSerie: TIBSQL;
    Label24: TLabel;
    cboxTipoUnidad: TComboBox;
    rxqryInvPrecioXTipoUnidad: TCurrencyField;
    rxVentaTipoUnidad: TIntegerField;
    qryInventarioPRECIO_TIPO_UNIDAD: TFloatField;
    rxqryInvTipoUnidad: TIntegerField;
    qryInventarioTIPO_UNIDAD: TIntegerField;
    rxVentaDescUnidadMedida: TStringField;
    qryProductosPORC_DESCUENTO: TFloatField;
    qryProductosUNIDAD: TFloatField;
    qryProductosPRECIO_COMPRA: TFloatField;
    qryProductosFECHA_VENCIMIENTO: TDateTimeField;
    qryProductosPRECIO_TIPO_UNIDAD: TFloatField;
    qryProductosTIPO_UNIDAD: TIntegerField;
    TotalesFechaVence: TDateTimeField;
    qryClienteCANT_DIAS_CREDITO: TSmallintField;
    qryPrecioXTipoUnidad: TIBQuery;
    qryPrecioXTipoUnidadID_PROD: TIntegerField;
    qryPrecioXTipoUnidadID_UNIDAD: TIntegerField;
    qryPrecioXTipoUnidadPRECIO: TFloatField;
    Label25: TLabel;
    RxSpeedButton1: TRxSpeedButton;
    MaestroInventario1: TMenuItem;
    DataSource3: TDataSource;
    ConsultaGeneral1: TMenuItem;
    BitBtn17: TBitBtn;
    rxPreventa: TRxMemoryData;
    rxPreventaSerie: TIntegerField;
    rxPreventaNumero: TIntegerField;
    ibsqlDeletePreventaDet: TIBSQL;
    ibsqlDeletePreventaMaster: TIBSQL;
    rxVentaItbisExento: TSmallintField;
    rxVentaTipoVenta: TIntegerField;
    SkinData1: TSkinData;
    Label26: TLabel;
    SpeedButton1: TSpeedButton;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    panelDescripcionServ: TPanel;
    Label27: TLabel;
    DBMemo1: TDBMemo;
    rxVentaDescripcionEspecial: TMemoField;
    RxSpinEdit1: TRxSpinEdit;
    Label28: TLabel;
    qryProductosPRECIOVENTA1: TFloatField;
    qryProductosPRECIOVENTA2: TFloatField;
    qryProductosPRECIOVENTA3: TFloatField;
    qryProductosPRECIOVENTA4: TFloatField;
    rdgFactServicio: TRadioButton;
    rdgFactVentaProducto: TRadioButton;
    Shape1: TShape;
    qryInventarioPRECIOVENTA1: TFloatField;
    qryInventarioPRECIOVENTA2: TFloatField;
    qryInventarioPRECIOVENTA3: TFloatField;
    qryInventarioPRECIOVENTA4: TFloatField;
    tblRecovertrans: TIBDataSet;
    tblRecovertransSERIE: TIntegerField;
    tblRecovertransFECHA: TDateTimeField;
    tblRecovertransNUMERO: TIntegerField;
    tblRecovertransCODIGO_PROD: TIBStringField;
    tblRecovertransCODIGO_BARRA: TIBStringField;
    tblRecovertransDESCRIPCION: TIBStringField;
    tblRecovertransCANTIDAD: TFloatField;
    tblRecovertransPRECIO: TFloatField;
    tblRecovertransPORC_DESC_DET: TFloatField;
    tblRecovertransITBI_DET: TFloatField;
    tblRecovertransVALOR_SERVICIO_DET: TFloatField;
    tblRecovertransVALOR_TOTAL_DET: TFloatField;
    tblRecovertransNUM_FACTURA: TFloatField;
    tblRecovertransSTATUS_DET: TIBStringField;
    tblRecovertransFECHA_IN: TDateTimeField;
    tblRecovertransIN_POR: TIBStringField;
    tblRecovertransFECHA_MOD: TDateTimeField;
    tblRecovertransMOD_POR: TIBStringField;
    tblRecovertransCANT_REGRESO: TFloatField;
    tblRecovertransCANT_PROMO: TFloatField;
    tblRecovertransMONTO_DIETA: TFloatField;
    tblRecovertransMONTO_AJUSTE: TFloatField;
    tblRecovertransSERIE_PROD: TIBStringField;
    tblRecovertransSTATUS_CNT: TIBStringField;
    tblRecovertransTIPO_UNIDAD: TIntegerField;
    tblRecovertransITBIS_EXENTO: TSmallintField;
    tblRecovertransTIPO_VENTA: TSmallintField;
    tblRecovertransDESCRIPCIONPRODUCTO: TMemoField;
    tblRecovertransTIPO_OPE: TSmallintField;
    tblRecovertransPRECIO_LEVEL: TSmallintField;
    RecuperarTransacciones1: TMenuItem;
    tblRecovertransID: TIntegerField;
    tblRecovertransCOD_USUARIO: TIntegerField;
    TotalesMontoDescGastosAdmin: TCurrencyField;
    TotalesMontoDescItbisGastosAdmin: TCurrencyField;
    TotalesMontoDescTransp: TCurrencyField;
    TotalesMontoDescDirtecnica: TCurrencyField;
    TotalesMontoDescItbisDirTecnica: TCurrencyField;
    TotalesMontoDescImprevisto: TCurrencyField;
    TotalesMontoDescItbisImprevisto: TCurrencyField;
    ibsqlGetPorcDescFctSvr: TIBSQL;
    BitBtn18: TBitBtn;
    TotalesMontoSubTotalIndirectos: TCurrencyField;
    DBText8: TDBText;
    Label29: TLabel;
    BitBtn19: TBitBtn;
    TotalesPorcGAdmin: TStringField;
    TotalesPorcItbisGAdmin: TStringField;
    TotalesPorcTrans: TStringField;
    TotalesPorcDirTec: TStringField;
    TotalesPorcItbisDirTec: TStringField;
    TotalesPorcImprevisto: TStringField;
    TotalesPorcItbisImprevisto: TStringField;
    ibStpInsertCotizaDet: TIBStoredProc;
    DBText9: TDBText;
    DBText10: TDBText;
    DBText11: TDBText;
    DBText12: TDBText;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    qryProductosUSARLEVELPRECIO: TSmallintField;
    qryInventarioUSARLEVELPRECIO: TSmallintField;
    qryProdPorProveedor: TIBQuery;
    dsqryProdPorProveedor: TDataSource;
    qryProdPorProveedorFECHA: TDateTimeField;
    qryProdPorProveedorCODIGO_PROV: TSmallintField;
    qryProdPorProveedorNOMBREPROVEEDOR: TIBStringField;
    qryProdPorProveedorPRECIO: TFloatField;
    qryProdPorProveedorTELEFONO: TIBStringField;
    qryProdPorProveedorEMAIL: TIBStringField;
    pnlPrecioProv: TPanel;
    BitBtn20: TBitBtn;
    DBText13: TDBText;
    Label34: TLabel;
    Label35: TLabel;
    DBText14: TDBText;
    ModificarFactura1: TMenuItem;
    Label36: TLabel;
    ibStpInsertVentaDet: TIBStoredProc;
    bitBtnEditarFact: TBitBtn;
    stpUpdateVentaDetU1: TIBStoredProc;
    rxVentaSerieOriginal: TIntegerField;
    rxVentaNumeroTrnOriginal: TIntegerField;
    rxVentaStatus: TStringField;
    stpProc_UpdateVENTAS_MAST_U1: TIBStoredProc;
    stpProcUpdateFactU1: TIBStoredProc;
    stpProcUpdateTrnCxcU1: TIBStoredProc;
    stpProcUpdateBlcCteCxc: TIBStoredProc;
    stpProcUpdateFActPendu1: TIBStoredProc;
    TotalesTPorcGAdmin: TFloatField;
    TotalesTPorcItbisGAdmin: TFloatField;
    TotalesTPorcTrans: TFloatField;
    TotalesTPorcDirTec: TFloatField;
    TotalesTPorcItbisDirTec: TFloatField;
    TotalesTPorcImprevisto: TFloatField;
    TotalesTPorcItbisImprevisto: TFloatField;
    Label37: TLabel;
    Label38: TLabel;
    qryClienteCIA_KEY: TIntegerField;
    qryClienteUSARLEVELPRECIO: TSmallintField;
    Label39: TLabel;
    DBEdit7: TDBEdit;
    TotalesComentario: TStringField;
    BitBtn21: TBitBtn;
    BitBtn22: TBitBtn;
    qryInventarioPORCITBIS: TFloatField;
    qryProductosCIA_KEY: TIntegerField;
    qryProductosPORCITBIS: TFloatField;
    qryClienteCOD_VENDEDOR: TIntegerField;
    qryClienteTIPO_CF: TIBStringField;
    ReImprimeFacturaContado1: TMenuItem;
    rxVentaNumeroCotiza: TIntegerField;
    ibstpUpdateCotizaMaster: TIBStoredProc;
    stpProcUpdteCotDet: TIBStoredProc;
    DBStatusLabel1: TDBStatusLabel;
    ibsqlDeleteSerieCotizaDet: TIBSQL;
    dbFechaCotizacion: TDBDateEdit;
    lblFechaCotizacion: TLabel;
    TotalesFechaCotizacion: TDateTimeField;
    ReImprimeDevolucion1: TMenuItem;
    qryInventarioDESCRIPCIONADICIONAL: TMemoField;
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
    RegistroServicioTaller1: TMenuItem;
    BitBtn23: TBitBtn;
    qryProductosDESCRIPCIONADICIONAL: TMemoField;
    BitBtn24: TBitBtn;
    Label40: TLabel;
    rxVentaMoneda: TStringField;
    TotalesMoneda: TStringField;
    lblTasa: TLabel;
    rxVentaMonedaBase: TStringField;
    qryProductosCOD_MONEDA: TIBStringField;
    qryInventarioCOD_MONEDA: TIBStringField;
    tblMoneda: TIBTable;
    tblMonedaCODIGO: TIBStringField;
    tblMonedaDESCRIPCION: TIBStringField;
    tblMonedaFECHA_IN: TDateTimeField;
    tblMonedaFECHA_UPCAMPO_FECHA_HORA: TDateTimeField;
    tblMonedaMODIFICADO_POR: TIBStringField;
    tblMonedaSIMBOLO: TIBStringField;
    dstblMoneda: TDataSource;
    RxDBLookupCombo2: TRxDBLookupCombo;
    rxVentaRutaImagen: TStringField;
    qryInventarioRUTAIMAGEN: TIBStringField;
    qryInvRutaImg: TIBQuery;
    qryInvRutaImgCODIGO: TIntegerField;
    qryInvRutaImgCODIGO_BARRA: TIBStringField;
    qryInvRutaImgCODIGO_TEXTO: TIBStringField;
    qryInvRutaImgRUTAIMAGEN: TIBStringField;
    BitBtn25: TBitBtn;
    TotalesMontoEnTarjeta: TCurrencyField;
    TotalesMontoEnEfectivo: TCurrencyField;
    TotalesMontoEnCheque: TCurrencyField;
    TotalesMontoEnBonos: TCurrencyField;
    TotalesDiferencia: TCurrencyField;
    rxVentaCostoProducto: TCurrencyField;
    Seguros1: TMenuItem;
    Poliza1: TMenuItem;
    ReImprimeDevolucionsinFact1: TMenuItem;
    DBText15: TDBText;
    Label41: TLabel;
    TotalesMontoNotaCredito: TCurrencyField;
    CheckBox4: TCheckBox;
    QryPrecios: TIBQuery;
    QryPreciosCODIGO: TIntegerField;
    QryPreciosPRECIOVENTA1: TFloatField;
    QryPreciosPRECIOVENTA2: TFloatField;
    QryPreciosPRECIOVENTA3: TFloatField;
    QryPreciosPRECIOVENTA4: TFloatField;
    DSQryPrecios: TDataSource;
    BitBtn26: TBitBtn;
    TotalesMontoNCRAplicado: TCurrencyField;
    rxVentaglbcodVendedor: TIntegerField;
    TotalesReferenciaCte: TStringField;
    Label42: TLabel;
    DBEdit8: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    Button2: TButton;
    rxPagos: TRxMemoryData;
    rxPagosSerie: TIntegerField;
    ibslqlUpdatetrnpagos: TIBSQL;
    lblStatusImpFiscal: TLabel;
    TotalesNumeroTrn: TIntegerField;
    Button1: TButton;
    Label43: TLabel;
    DBEdit9: TDBEdit;
    rxVentaPorcDescItem: TCurrencyField;
    TotalesMontoDescItems: TCurrencyField;
    rxVentaMontoDescItem: TCurrencyField;
    procedure BitBtn4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtCodigoChange(Sender: TObject);
    procedure edtCodigoExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure rxVentaAfterPost(DataSet: TDataSet);
    procedure Edit1Exit(Sender: TObject);
    procedure edtCodigoEnter(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rxVentaBeforePost(DataSet: TDataSet);
    procedure BitBtn5Click(Sender: TObject);
    procedure Inventario1Click(Sender: TObject);
    procedure CuadreCaja1Click(Sender: TObject);
    procedure Ayuda1Click(Sender: TObject);
    procedure ImprimirRecibo1Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BuscarCliente1Click(Sender: TObject);
    procedure Cotizar1Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure MaestroCliente1Click(Sender: TObject);
    procedure RxDBGrid2DblClick(Sender: TObject);
    procedure DBEdit1Enter(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure DBEdit5Exit(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure MostrarVistaproductos1Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure edtReferenciaChange(Sender: TObject);
    procedure edtReferenciaExit(Sender: TObject);
    procedure NotaCrdito1Click(Sender: TObject);
    procedure NotaDebito1Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure Devolucin1Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure DBEdit2Enter(Sender: TObject);
    procedure chkExentoExit(Sender: TObject);
    procedure RxDBGrid2KeyPress(Sender: TObject; var Key: Char);
    procedure RxDBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure chkExentoEnter(Sender: TObject);
    procedure RxDBGrid2GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure ReImprimirRecibo1Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RxLabel1Click(Sender: TObject);
    procedure LectorCodBarra1Click(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure ImprimirLabel1Click(Sender: TObject);
    procedure NoGenerarNCF1Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure qryClienteAfterScroll(DataSet: TDataSet);
    procedure qryProductosAfterScroll(DataSet: TDataSet);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure RxDBGrid3DblClick(Sender: TObject);
    procedure SecretPanel1DblClick(Sender: TObject);
    procedure NoMostrarProdVencidos1Click(Sender: TObject);
    procedure rxLabelVenceDblClick(Sender: TObject);
    procedure qryInventarioAfterOpen(DataSet: TDataSet);
    procedure rxqryInvAfterScroll(DataSet: TDataSet);
    procedure cboxTipoUnidadChange(Sender: TObject);
    procedure cboxTipoUnidadExit(Sender: TObject);
    procedure qryInventarioAfterScroll(DataSet: TDataSet);
    procedure Label25Click(Sender: TObject);
    procedure RxSpeedButton1Click(Sender: TObject);
    procedure MaestroInventario1Click(Sender: TObject);
    procedure cboxTipoUnidadEnter(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure RxDBGrid2Enter(Sender: TObject);
    procedure RxDBGrid2Exit(Sender: TObject);
    procedure rxVentaAfterScroll(DataSet: TDataSet);
    procedure ConsultaGeneral1Click(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure Label26Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure rdgFactServicioClick(Sender: TObject);
    procedure rdgFactVentaProductoClick(Sender: TObject);
    procedure DBMemo1Exit(Sender: TObject);
    procedure RecuperarTransacciones1Click(Sender: TObject);
    procedure RxSpinEdit1Change(Sender: TObject);
    procedure BitBtn18Click(Sender: TObject);
    procedure TotalesCalcFields(DataSet: TDataSet);
    procedure CheckBox2Exit(Sender: TObject);
    procedure CheckBox3Exit(Sender: TObject);
    procedure BitBtn19Click(Sender: TObject);
    procedure BitBtn20Click(Sender: TObject);
    procedure ModificarFactura1Click(Sender: TObject);
    procedure bitBtnEditarFactClick(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure BitBtn6MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Label37Click(Sender: TObject);
    procedure BitBtn21Click(Sender: TObject);
    procedure DBEdit7Exit(Sender: TObject);
    procedure BitBtn22Click(Sender: TObject);
    procedure RxDBGrid1Enter(Sender: TObject);
    procedure RxDBGrid1Exit(Sender: TObject);
    procedure ReImprimeFacturaContado1Click(Sender: TObject);
    procedure dbFechaCotizacionClick(Sender: TObject);
    procedure dbFechaCotizacionExit(Sender: TObject);
    procedure dbFechaCotizacionEnter(Sender: TObject);
    procedure ReImprimeDevolucion1Click(Sender: TObject);
    procedure BitBtn4Exit(Sender: TObject);
    procedure RegistroServicioTaller1Click(Sender: TObject);
    procedure BitBtn24Click(Sender: TObject);
    procedure TotalesAfterScroll(DataSet: TDataSet);
    procedure RxDBLookupCombo2Change(Sender: TObject);
    procedure RxDBLookupCombo2Enter(Sender: TObject);
    procedure RxDBLookupCombo2Exit(Sender: TObject);
    procedure RxDBLookupCombo2Click(Sender: TObject);
    procedure tblMonedaAfterScroll(DataSet: TDataSet);
    procedure BitBtn25Click(Sender: TObject);
    procedure Poliza1Click(Sender: TObject);
    procedure ReImprimeDevolucionsinFact1Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure BitBtn26Click(Sender: TObject);
    procedure rxVentaBeforeInsert(DataSet: TDataSet);
    procedure BitBtn1Enter(Sender: TObject);
    procedure BitBtn1Exit(Sender: TObject);
    procedure DBRadioGroup1Enter(Sender: TObject);
    procedure DBRadioGroup1Exit(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure VerificaImpresoraFiscalM;
    procedure qryVenceAfterClose(DataSet: TDataSet);
    procedure qryVenceBeforeClose(DataSet: TDataSet);
    procedure DBEdit5Enter(Sender: TObject);

  private
    procedure ActivarBotonesEnModifica;
    procedure CargarDatosAModificar;
    procedure ProcesarSumaTotal;
    procedure SetMontoNotaCredito;
    procedure CalcularDescIndirecto;
    procedure ProcesaNuevo;
    procedure InsertarDet(numero : Integer);
    procedure InsertarCotizacionDet(numero : Integer);
    procedure InsertarCotizacionDetUpd(numero : Integer;serie:Integer);
    procedure ProcesaCalculos;
    procedure ProcCargaDatosCotizacion;
    procedure ProcCalculoDivisa;
    Procedure PrepararInfoFiscal(numerotrn:integer);

    procedure ImpFacturaservicio(numerotrn:Integer;EsReimpresion:Boolean);
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

    procedure LlenarTipoUnidadBox(umedida:integer);
    Function precioXUnidad(idTipoUnidad:Integer;idProducto: Integer): Extended;
    procedure ImprimirFactura(Avance: Integer);
    procedure CargarPreventa;
    procedure ActualizarPreventa;
    Procedure InsertaTransCafeteria(numTrn : Integer;codigoP:Integer;cantP:Real);

    Procedure ProcInsertarRecoverData;
    Procedure ProcRecoverData(showsms:boolean);
    Procedure ActualizarRecoverData;
    procedure EliminarRecoverData;
    procedure EliminarRecoverDataAll;

    procedure ExportarGridExcel;

    //Metodos opcion modificar factura
    procedure ActualizaVentaDet;
    procedure ActualizaVentaMaster(fpago : String;serieNcfAsignado: Integer);
    procedure ActualizaFactura;
    procedure ActualizaFactPendiente;
    procedure ActualizaTransCxc;
    procedure ActualizaBalanceCteCxc;
    procedure InicializaOtrosDesc;
    procedure CrearNCreditoEnDevolucion;
    procedure ActualizaCotizacionMaster;
    procedure InsertarDetDevolucion(numero : Integer);
    procedure ProcInsertarVtaMastEnDevolucion(Serie_asignadoncf : Integer);

    //Procsa devolucion de 1 o varios productos de una factura;
    procedure ProcesarDevolucion;

    Function BuscarRutaImagen(codProducto : Integer):String;
    procedure ProcInsertarDetPagos(numtrn : integer);
    procedure ProcInsertarDetCheque(numtrn : integer);
    procedure ProcInsertarDetBono(numtrn : integer);

    procedure DescargaNotaCredito;
    Procedure SetPrecioPorCantidad;
    function VerificaRecordsVenta:boolean;
  public
    NoTieneCredito :  boolean;  
    Function VerificaLimiteCredito(codigocte:integer;MontoVenta:Real):Boolean;  
    { Public declarations }
    //procedure ActivaPermiso(proceso:integer; iduser:Integer; isperson:integer);
  end;

Const
  FormaPagoNotaDebito = 6;//Devolucion
  TipoPagoFactura = 7;//Factura-Credito
  //PORC_TRANSP_ITBIS = 16/1.16;//13.79;
var
  frmProcVentaRapida: TfrmProcVentaRapida;
  recuperando : Boolean;
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

  CantUnidad : Real;
  InactivaImprecibo : Boolean;
  noExiste : Boolean;
  sqlAsignado : Boolean;
  PrecioCambio : Boolean;
  auxiCant, cPrecio, aPrecio, PORC_TRANSP_ITBIS : Extended;
  EsModificandoFactura : boolean;
  ExpExcel : Boolean;
  EsReimprimirContado : Boolean;
  EsModificandoCotiza : Boolean;
  _NumeroCotiza : Integer;
    esContado : boolean;
  numerodocReimp : Integer;
  NumeroTrn : Integer;
  EsBrowsing, EsEditando : Boolean;

implementation
uses UDatModConectar, UGlobal, URepComprobante, UDatModCompania,
  UProcMiniInventario, UFormSelFecha, UDatModReportes, URepVentaDiaria,
  UDatModFactura, USeleccionarNCF, uFormAsignarNCFVenta,
  UBuscarClientesPersonasP, UFormDatosCotiza, UDatModCxc, UDatModClientes,
  UMaestroClientes, URFacturaStandar, URFactura, UFormSelproducto,
  UFormFinanciamiento, URepCotizacionPapel8_55, URepRecibo8_5_11,
  USolDatos, UDistCuotasFinanc, UFormSelSerieProd, UInvXReferencia,
  UTransNcNbDev, UEdicionVenta, UFormProcDevolucion, UFormEntreClave, Math,
  URFacturaStandarReimp, UFormDatosVentaVeh, UDatModInventario,
  UIndicarLoteNum, ULabelImpCodBarra, UConsultaPrecio,
  URepFacturaPuntoVenta, UDatModUsuarios, URepRecibo8_5_11REspinal,
  URFacturaStandarReimpREsp, UInventarioProd, UConsultaInventario,
  UConsultaPreventa, URepComprobanteFix, UDatosVentas,
  UFormVerIngredientes, UFormBuscarDatosEstudiantes,
  UFormVerDescFacturaServicio, 
  UFormPrecioProdPorProveedor, UFormFacturas, UQckFactServIngeservis8_5_N,
  UFormGetNumFctAExportarExcel, UQckFactServIngeservis8_5_NCotiza,
  UQckFactServIngeservis8_5_NConduce, UQckFactServArtioficce8_5,
  UQckFactServIngeservis8_5_NCotizaN, UQckCotiza8_5_F_1, UQckCotiza8_5_F_2,
  UQckFactCredArtioffice8_5_F_1, UFormTransCxcDbCr_r, UProcesarDevolucion,
  UFormRegServicioTaller, ImageWin, UDatmodDatosGenerales, UFormShowImagen,
  UFormDistribuirPgoVenta, UFormOperacionServicios, UFormPolizaMaster,
  UDatModPagoTarjeta, UFormPagosCombinados, UTestImpFiscal,
  UQckCotiServIngeservis8_5_NConduce, UFormSelTipoConduce,
  UFormGenerarConduce, UFormGenerarConduceFct,
  UQckFactCredArtioffice8_5_F_1_bym, UQckCotiza8_5_F_1ByM;

{$R *.dfm}

  function esNumero(valor:String):Boolean;
  begin
    if (Valor[1] =  '0') or (Valor[1] =  '1') or (Valor[1] =  '2')
    or (Valor[1] =  '3') or (Valor[1] =  '4') or (Valor[1] =  '5')
    or (Valor[1] =  '6') or (Valor[1] =  '7')
    or (Valor[1] =  '8') or (Valor[1] =  '9') then
    result:= True else result:= False;
  end;

procedure TfrmProcVentaRapida.BitBtn4Click(Sender: TObject);
var
  serie_asignadoncf : integer;
  valorNCF : String;
  showNcfwindows : boolean;
  genNcf : Boolean;
  flag : Boolean;
  pulgadaInc : Real;
begin
  //Generar y asignar Numero de Comprobante Fiscal
  if (Edit1.Text = '') And (not EsDevolucion) then
  begin
    Raise Exception.Create('Favor indicar monto pago');
    edit1.SetFocus;
    Exit;
  end;
  sumarDatos:=False;
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

  //**************************************************
  //**************************************************

  if EsDevolucion then
  TipoVenta:='Devolución' else
  if GlbNCFConfFinal = 0 then
  begin
    CheckBox1.Checked:=true;
  end;

    if not tablaPropietarioCodigoPropietario.IsNull then
  if qryClienteCOD_VENDEDOR.Value > 0 then
    GlbCodVendedor :=qryClienteCOD_VENDEDOR.Value
    else
    GlbCodVendedor := -1;
        
  //Aplicar nota de credito abiertas
  //if CheckBox4.Checked then
  if TotalesMontoNCRAplicado.Value > 0 then
  DescargaNotaCredito;

    //if CheckBox1.Checked then
  //begin
    frmSelNCF:=TfrmSelNCF.Create(Self);
    try
      if Not EsDevolucion then
      dmFactura.ibQryViewNCF.Locate('TIPO_CF','02',[]) //Factura Consumidor Final
      else
      dmFactura.ibQryViewNCF.Locate('TIPO_CF','04',[]);//Nota Credito

      if (GlbNCFConfFinal = 0)  and Not NoGenerarNCF1.Checked then
      begin
        showNcfwindows:= True;
      end else
      begin
        if NoGenerarNCF1.Checked then  //no imprime NCF
        showNcfwindows := false;

  if (GlbActivaIFiscal = 1 ) then
  showNcfwindows:=true;
  
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

      if (GlbNCFConfFinal = 0)  then
      showNcfwindows:= True;

      GlbDescNCF:='';
     if (GlbActivaIFiscal = 1 ) then
     showNcfwindows:=true;
     
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
             if GlbcodVendedor > 0 then
             frmAsignarNCFVenta.IBDataSet1CODIGO_USUARIO.Value := GlbcodVendedor
             else
             frmAsignarNCFVenta.IBDataSet1CODIGO_USUARIO.Value := VarUsuarioGlb;
             frmAsignarNCFVenta.IBDataSet1STATUS.Value := 'A';

             frmAsignarNCFVenta.IBDataSet1TIPO_NCF.Value := dmFactura.ibQryViewNCFTIPO_CF.Value;
             frmAsignarNCFVenta.BitBtn13Click(Self);

             frmAsignarNCFVenta.Asginarncf := frmAsignarNCFVenta.ncfGenerado;

             frmAsignarNCFVenta.IBDataSet1NUMERO_NCF.Value := frmAsignarNCFVenta.ncfGenerado;//rxVentaNCF.Value;
             frmAsignarNCFVenta.IBDataSet1MONTO.Value      := Totalestotalneto.Value; //StrToFloat(EditN1.Text);

             frmAsignarNCFVenta.BitBtn4Click(Self); //Guardar
             EsModificandoCotiza:=False;
             label36.Caption:='';
             GlbUsandoCotiza:=False;
             if (frmAsignarNCFVenta.ncfGenerado = '') then
             begin
               if MessageDlg('NCF no fue generado, desea continuar?', mtWarning, [mbYes, mbNo], 0) = mrNO then
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
  ipStpInsertVentMast.Params[2].Value:=GlbCodigoCia;
  if tablaPropietarioCodigoPropietario.IsNull then
  ipStpInsertVentMast.Params[3].Value := 0//generico
  else ipStpInsertVentMast.Params[3].Value:= tablaPropietarioCodigoPropietario.Value;
  if (GlbcodVendedor > 0) then
  ipStpInsertVentMast.Params[4].Value:= GlbcodVendedor
  else
  ipStpInsertVentMast.Params[4].Value:= VarUsuarioGlb;

  if Not EsDevolucion then
  begin
    ipStpInsertVentMast.Params[6].Value:= 'CONTADO';
    ipStpInsertVentMast.Params[5].Value:= 1;
    ibstpProcSecuencia.Params[1].Value := 1;
  end else
  begin
    ipStpInsertVentMast.Params[6].Value   := 'Devolución';
    ipStpInsertVentMast.Params[5].Value   := 6;
    ibstpProcSecuencia.Params[1].Value    := 6;
    //Codigo pendiente
    CrearNCreditoEnDevolucion;
  end;
  ibstpProcSecuencia.ExecProc;

  if not TotalesMoneda.isNull then
  ipStpInsertVentMast.Params[7].Value    := TotalesMoneda.Value
  else
  ipStpInsertVentMast.Params[7].Value    := '1';
  ipStpInsertVentMast.Params[8].AsString := TotalesSubTotal.AsString; //EditN1.Text;
  ipStpInsertVentMast.Params[9].Value    := 'A';
  ipStpInsertVentMast.Params[10].Value   := Now;
  ipStpInsertVentMast.Params[11].Value   := Null;
  ipStpInsertVentMast.Params[12].Value   := Null;
  ipStpInsertVentMast.Params[13].Value   := Null;
  ipStpInsertVentMast.Params[14].Value   := Null;
  ipStpInsertVentMast.Params[15].Value   := ibstpProcSecuencia.Params[0].Value;

  ipStpInsertVentMast.Params[17].Value   := TotalesSubTotal.Value;
  ipStpInsertVentMast.Params[18].Value   := TotalesPorcDesAdicional.Value;
  ipStpInsertVentMast.Params[19].Value   := TotalesMontoDescAdicional.Value;
  ipStpInsertVentMast.Params[20].Value   := Totalesmontorecibido.Value;
  ipStpInsertVentMast.Params[21].Value   := Totalesdevolucion.Value;
  ipStpInsertVentMast.Params[22].Value:= Totalesitbis.Value;
  ipStpInsertVentMast.Params[23].Value:= 0;//chequear para financiamiento
  ipStpInsertVentMast.Params[24].Value:= edtObservacion.Text;
  ipStpInsertVentMast.Params[25].Value:= TotalesMontoDescGastosAdmin.Value;
  ipStpInsertVentMast.Params[26].Value:= TotalesMontoDescItbisGastosAdmin.Value;
  ipStpInsertVentMast.Params[27].Value:= TotalesMontoDescTransp.Value;
  ipStpInsertVentMast.Params[28].Value:= TotalesMontoDescDirtecnica.Value;
  ipStpInsertVentMast.Params[29].Value:= TotalesMontoDescItbisDirTecnica.Value;
  ipStpInsertVentMast.Params[30].Value:= TotalesMontoDescImprevisto.Value;
  ipStpInsertVentMast.Params[31].Value:= TotalesMontoDescItbisImprevisto.Value;
  ipStpInsertVentMast.Params[32].Value:= totalesComentario.Value;
  ipStpInsertVentMast.Params[33].Value:= rxVentaNumeroCotiza.Value;
  ipStpInsertVentMast.Params[34].Value:= totalesReferenciaCte.Value;    

  if Serie_asignadoncf > 0 then
  ipStpInsertVentMast.Params[16].Value  := Serie_asignadoncf
  else ipStpInsertVentMast.Params[16].Value:= Null;

  ipStpInsertVentMast.ExecProc;
  numeroTrnVta:= ipStpInsertVentMast.Params[0].Value;

  if Not ipStpInsertVentMast.Transaction.InTransaction then
  ipStpInsertVentMast.Transaction.StartTransaction;
  try
    ipStpInsertVentMast.Transaction.CommitRetaining;
  except
  ipStpInsertVentMast.Transaction.RollbackRetaining;
  end;
  numeroTrnVta:= ipStpInsertVentMast.Params[0].Value;
  
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

  if (not EsFactura ) or (Not EsModificandoFactura) or (Not EsModificandoCotiza) then
  begin
    While Not rxPagos.Eof do
    begin
      ibslqlUpdatetrnpagos.Params[0].Value:= ipStpInsertVentMast.Params[0].Value;
      ibslqlUpdatetrnpagos.Params[1].Value:= rxPagosSerie.Value;
      ibslqlUpdatetrnpagos.ExecQuery;
      rxPagos.Next;
    end;
    if Not ibslqlUpdatetrnpagos.Transaction.InTransaction then
    ibslqlUpdatetrnpagos.Transaction.StartTransaction;
    try
      ibslqlUpdatetrnpagos.Transaction.CommitRetaining;
    except
    ibslqlUpdatetrnpagos.Transaction.RollbackRetaining;
    end;
  end;
  
  ProcInsertarDetCheque(ipStpInsertVentMast.Params[0].Value);
  ProcInsertarDetPagos(ipStpInsertVentMast.Params[0].Value);
  ProcInsertarDetBono(ipStpInsertVentMast.Params[0].Value);

  While Not rxPagos.Eof do
  begin
    ibslqlUpdatetrnpagos.Params[0].Value:= ipStpInsertVentMast.Params[0].Value;
    ibslqlUpdatetrnpagos.Params[1].Value:= rxPagosSerie.Value;
    ibslqlUpdatetrnpagos.ExecQuery;
    rxPagos.Next;
  end;
  if Not ibslqlUpdatetrnpagos.Transaction.InTransaction then
  ibslqlUpdatetrnpagos.Transaction.StartTransaction;
  try
    ibslqlUpdatetrnpagos.Transaction.CommitRetaining;
  except
  ibslqlUpdatetrnpagos.Transaction.RollbackRetaining;
  end;

  rxVenta.DisableControls;
  rxVenta.First;

  While Not rxVenta.Eof do
  begin
    InsertarDet(ipStpInsertVentMast.Params[0].Value);
    ibStpActualizaInvProd.Params[0].Value:= rxVentaCodArticulo.Value;
    if (rxVentaTipoUnidad.Value = 3) Or (rxVentaTipoUnidad.Value = 0) then
      ibStpActualizaInvProd.Params[1].Value:= rxVentaCant.Value
    else
    begin
      ibStpActualizaInvProd.Params[1].Value:= rxVentaCant.Value * CantUnidad;
    end;
    if Not EsDevolucion then
    ibStpActualizaInvProd.Params[2].Value     := 0//tipoTrn
    else ibStpActualizaInvProd.Params[2].Value:= 1;//ingresar al inventario
    ibStpActualizaInvProd.Params[3].Value     := 1;//porCodigo
    if (rxVentaInvetariar.Value <> 0) And (GlbCodDivInventario = 1 ) then
    ibStpActualizaInvProd.ExecProc;   //aqui actualiza inventario

    if (rxVentaTipoVenta.Value = 0) or (rxVentaTipoVenta.IsNull )  then //Item de Venta
    ActualizaInvAlmacen;//Actualiza Division Inventario
    rxVenta.Next;
  end;
  rxVenta.First;
  //RxDBGrid2.DisableScroll;
  sumarDatos:=False;
  //RxDBGrid2.Visible:=False;
  rxVenta.AutoCalcFields:=False;
  While not rxVenta.Eof do
  begin
    rxVenta.Edit;
    rxVentaNumeroRecibo.Value := ipStpInsertVentMast.Params[0].Value;
    rxVentaNumeroDoc.Value := ipStpInsertVentMast.Params[15].Value;
    rxVenta.Post;
    //WriteToLog('Post rxVenta - Line 1051');
    rxVenta.Next;
  end;
  //RxDBGrid2.EnableScroll;
  rxVenta.EnableControls;
  //xDBGrid2.Visible:=True;

  NumeroTrn:= ipStpInsertVentMast.Params[0].Value;

  //Where id_usuario =:idusuario
  //And numero_trans =:numero

  dmReportes.tblCtrlTransusuario.Close;
  dmReportes.tblCtrlTransusuario.Params[0].Value:= VarUsuarioGlb;
  dmReportes.tblCtrlTransusuario.Params[1].Value:= ipStpInsertVentMast.Params[0].Value;
  dmReportes.tblCtrlTransusuario.Open;

  dmReportes.tblCtrlTransusuario.Insert;
  dmReportes.tblCtrlTransusuarioID_USUARIO.Value   := VarUsuarioGlb;
  dmReportes.tblCtrlTransusuarioNUMERO_TRANS.Value := ipStpInsertVentMast.Params[0].Value;
  dmReportes.tblCtrlTransusuarioINSERTADO_POR.Value:= strUserName;
  dmReportes.tblCtrlTransusuarioFECHA_IN.Value  := Now;
  dmReportes.tblCtrlTransusuarioSTATUS.Value    := 'A';
  dmReportes.tblCtrlTransusuario.Post;
  dmReportes.tblCtrlTransusuario.ApplyUpdates;
  GlbSalvarQuery(dmReportes.tblCtrlTransusuario);
    
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

  //Datos para recibo/factura
  dmReportes.qryViewVentasMast.Close;
  dmReportes.qryViewVentasMast.Params[0].Value:=ipStpInsertVentMast.Params[0].Value;
  dmReportes.qryViewVentasMast.Open;

  if (GlbActivaIFiscal = 1) then
  begin
    if (NumeroTrn <= 0) then
    begin
      NumeroTrn := StrToInt(InputBox('Test numero venta','Indique numero',''));
    end;
    dmdatos.qryConfCajaXusuario.Close;
    dmdatos.qryConfCajaXusuario.Open;
    dmdatos.qryConfCajaXusuario.Locate('COD_EMPLEADO',VarUsuarioGlb,[]);

    dmReportes.qryDatosCajaImpUser.Close;
    dmReportes.qryDatosCajaImpUser.Params[0].Value:= VarUsuarioGlb;
    dmReportes.qryDatosCajaImpUser.Open;
    dmReportes.qryDatosCajaImpUser.Last;
    dmReportes.qryDatosCajaImpUser.RecordCount;
    GlbNombreFiletoPrint:= Format('%s%s%s%s%s%s%s',[dmReportes.qryDatosCajaImpUserRUTA_TICKET.Value,'\Recibo',Trim(GlbCodSucursal),Trim(GlbModeloImpresora),
    IntToStr(VarUsuarioGlb),IntToStr(NumeroTrn),'.txt']);
    PrepararInfoFiscal(NumeroTrn);
    //rxVentaNumeroRecibo
    frmTestImpresoraFiscal:=TfrmTestImpresoraFiscal.Create(Nil);
    try
      frmTestImpresoraFiscal.Button1Click(Self);
      frmTestImpresoraFiscal.btnImprimeReciboClick(Self);//Button1Click(Self);
    finally
    frmTestImpresoraFiscal.Free;
    frmTestImpresoraFiscal:=Nil;
    end;
    reciboImpreso:=True;
  end else
  if (GlbRec55Pulg = 1) then
  begin
    if rxSolDatoscte.State In [dsInactive] then
    rxSolDatoscte.Open;

    if rxSolDatoscte.State In [dsBrowse] then
    if (rxSolDatoscte.RecordCount = 0) Or (rxSolDatoscteNombre.IsNull) then
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
    if (GlbFacturaLicoreria =1) then
      begin
        qckRepRecibo8_5_11REsp:=TqckRepRecibo8_5_11REsp.Create(Nil);
        try
          if GlbSizeFact8x11 = 1 then
          qckRepRecibo8_5_11REsp.Page.Length := 11;
          qckRepRecibo8_5_11REsp.xtipoVenta := TipoVenta;
          qckRepRecibo8_5_11REsp.valorNCF:= valorNCF;

          qckRepRecibo8_5_11REsp.Prepare;
          glbTPag := qckRepRecibo8_5_11REsp.PageNumber;
          if (GlbImprimeReciboFact = 1) then
          begin
            if ImprimirRecibo1.Checked then
            begin
              qckRepRecibo8_5_11REsp.PrinterSetup;
              qckRepRecibo8_5_11REsp.Print;
            end else
            qckRepRecibo8_5_11REsp.Preview;
          end;
        finally
        qckRepRecibo8_5_11REsp.Free;
        qckRepRecibo8_5_11REsp:=Nil;
        end;
      end else
    begin
      if GlbFacturaArtioffice = 1 then
      begin
        qckFactServArtioffice8_5:=TqckFactServArtioffice8_5.Create(Nil);
        try
          qckFactServArtioffice8_5.TPag.Caption:= IntToStr(qckFactServArtioffice8_5.PageNumber);
        finally
        qckFactServArtioffice8_5.Free;
        qckFactServArtioffice8_5:=Nil;
        end;

        qckFactServArtioffice8_5:=TqckFactServArtioffice8_5.Create(Nil);
        try
          qckFactServArtioffice8_5.xtipoVenta := TipoVenta;
          qckFactServArtioffice8_5.valorNCF:= valorNCF;
          if (GlbImprimeReciboFact = 1) then
          begin
            if (GlbImpReciboSinPreg = 1) then
            qckFactServArtioffice8_5.Print
            else
            if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
            begin
              qckFactServArtioffice8_5.PrinterSetup;
              qckFactServArtioffice8_5.Print;
            end else
            qckFactServArtioffice8_5.Preview;

            if (GlbImpReciboSinPreg = 0) then
            if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
            begin
              //qckFactServArtioffice8_5
              qckFactServArtioffice8_5.Preview;
            end;
         end;
        reciboImpreso := True;
      finally
      qckFactServArtioffice8_5.Free;
      qckFactServArtioffice8_5:=Nil;
      end;
    end else
    begin
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
      if (GlbImprimeReciboFact = 1) then
      begin
        if (GlbImpReciboSinPreg = 1) then
        qckRepRecibo8_5_11.Print
        else
        if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
        begin
          qckRepRecibo8_5_11.PrinterSetup;
          qckRepRecibo8_5_11.Print;
        end else
        qckRepRecibo8_5_11.Preview;
        if (GlbImpReciboSinPreg = 0) then
        if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
        begin
          qckRepRecibo8_5_11.Preview;
        end;
      end;
      reciboImpreso:=True;
    finally
    qckRepRecibo8_5_11.Free;
    qckRepRecibo8_5_11:=Nil;
    end;
    end;
    end;//if licoreria
  end else
  begin     //aqui poner factura artioffice
    RxDBGrid1.DataSource:= datasource3;
        dbtext1.DataField:='';
        dbtext1.DataSource:= datasource3;
        dbedit1.DataField:='';
        dbedit1.DataSource:= datasource3;
        dbedit2.DataField:='';
        dbedit2.DataSource:= datasource3;
        dbedit3.DataField:='';
        dbedit3.DataSource:= datasource3;
    qckRepRecibo:=TqckRepRecibo.Create(Nil);
    try

      if GlbImpCodProducto = 0 then
      begin
        qckRepRecibo.qckRepComprobante.Height := 20;
        qckRepRecibo.QRLabel26.Enabled := False;
        qckRepRecibo.QRDBText20.Enabled:= False;
      end;

        qckRepRecibo.ncfDesc := GlbDescNCF;
      if Length(edtObservacion.Text) > 0 then
      qckRepRecibo.nombreCteGenerico:=edtObservacion.Text;
      if (tablaPropietarioCodigoPropietario.value > 0) then
      begin
        qckRepRecibo.qrLabelRNC.Caption:='RNC-' + qryClienteRNC_NUMERO.Value;
        qckRepRecibo.nombreCteGenerico:= qryClienteNOMBRE_CTE.Value;
      end
      else qckRepRecibo.qrLabelRNC.Caption:='';
      //RxDBGrid1.Visible:=False;
      //RxDBGrid1.DataSource:=DataSource2;
      qckRepRecibo.xtipoVenta := TipoVenta;
      qckRepRecibo.valorNCF:= valorNCF;
      pulgadaInc:=0.86;
      //temporal
      //{
      if rxVenta.RecordCount = 1 then
      qckRepRecibo.Page.Length:= 5
      else
      if rxVenta.RecordCount >= 2 then
      qckRepRecibo.Page.Length:= qckRepRecibo.Page.Length +
      (rxVenta.RecordCount - 1 ) * 0.25;

      flag:=true;
      qckRepRecibo.Prepare;
      rxventa.DisableControls;
      rxdbgrid1.Enabled:=False;
      if (rxventa.RecordCount > 1) or (qckRepRecibo.PageNumber > 1) then
      begin
        repeat
          begin
            if (qckRepRecibo.PageNumber > 1) then
            begin
              qckRepRecibo.Page.Length:=qckRepRecibo.Page.Length + 0.25;
              qckRepRecibo.Prepare;
              flag:=False;
            end else break;
          end;
        until flag = true;
      end;
      rxventa.EnableControls;
      rxdbgrid1.Enabled:=True;
      //case rxVenta.RecordCount of
      //4:qckRepRecibo.Page.Length:=qckRepRecibo.Page.Length -1;
      //6:qckRepRecibo.Page.Length:=qckRepRecibo.Page.Length -2;
      //12:qckRepRecibo.Page.Length:=qckRepRecibo.Page.Length -3.5;
      //16..1000:qckRepRecibo.Page.Length:=qckRepRecibo.Page.Length -6;
      //end;

      dmreportes.qryViewVentasMast.Close;
      dmreportes.qryViewVentasMast.Params[0].Value:= ipStpInsertVentMast.Params[0].Value;
      dmreportes.qryViewVentasMast.Open;
      //Ignorado de forma temporal debes habilitar este
      {
      qckRepReciboFix:=TqckRepReciboFix.Create(nil);

      if dmreportes.qryViewVentasMast.RecordCount >= 2 then
      qckRepReciboFix.Page.Length:= qckRepReciboFix.Page.Length +
      (dmreportes.qryViewVentasMast.RecordCount - 1 ) * 0.25;

      if GlbImpCodProducto = 1 then
      begin
        qckRepReciboFix.qckRepComprobante.Height := 20;
        qckRepReciboFix.QRLabel2.Enabled := False;
        qckRepReciboFix.QRDBText20.Enabled:= False;
      end;

      qckRepReciboFix.Prepare;
      try
        if dmreportes.qryViewVentasDet.RecordCount > 1 then
        begin
          repeat
            begin
              if (qckRepReciboFix.PageNumber > 1) then
              begin
                qckRepReciboFix.Page.Length:=qckRepReciboFix.Page.Length + 0.25;
                qckRepReciboFix.Prepare;
                flag:=False;
              end else break;
            end;
          until flag = true;
        end;

        qckRepReciboFix.QRLabel27.Enabled := False;
        qckRepReciboFix.QRDBText5.Enabled:= False;
        qckRepReciboFix.Preview;
      finally
      qckRepReciboFix.free;
      qckRepReciboFix:=Nil;
      end; }//temporal habilitar este

      RxDBGrid1.DataSource:= datasource1;
      dbtext1.DataField:='Descripcion';
      dbtext1.DataSource:= datasource1;
      dbedit1.DataSource:= datasource1;
      dbedit1.DataField:='Cant';
      dbedit2.DataSource:= datasource1;
      dbedit2.DataField:='Precio';
      dbedit3.DataSource:= datasource1;
      dbedit3.DataField:='MontoBruto';

      //}//temporal
      {
      if rxVenta.RecordCount = 1 then
      qckRepRecibo.Page.Length:= 5
      else
      if rxVenta.RecordCount >= 2 then
      qckRepRecibo.Page.Length:= qckRepRecibo.Page.Length +
      (rxVenta.RecordCount - 1 ) * 0.25;

      flag:=True;
      qckRepRecibo.Update;
      qckRepRecibo.Prepare;
      //qckRepRecibo.Page.Length:=19;
      repeat
        begin
          //qckRepRecibo.Prepare;
          pulgadaInc:=0.27;
          if qckRepRecibo.PageNumber > 1 then
          begin
            qckRepRecibo.Page.Length :=
            qckRepRecibo.Page.Length + pulgadaInc;
            qckRepRecibo.ResetPageFooterSize;
            qckRepRecibo.Update;
            qckRepRecibo.Prepare;
            flag:=False;
          end else break;
        end;
      until flag = true;  }
      //if (rxVenta.RecordCount > 3) then
      //qckRepRecibo.Page.Length:= qckRepRecibo.Page.Length - 0.5;
      RxDBGrid1.Visible:=True;
      //if ImprimirRecibo1.Checked then
      //begin

      if (GlbImpReciboSinPreg = 1) and (GlbImprimeReciboFact = 1) then
      qckReprecibo.Print
      else
      if MessageDlg('Imprimir?',mtInformation, [mbYes, mbNo], 0)=mryes then
      begin
        if (GlbImprimeReciboFact = 1) then
        begin
          qckRepRecibo.PrinterSetup;
          qckRepRecibo.Print;
        end;
      end else
      qckRepRecibo.Preview;
      reciboImpreso:=True;
    finally
    qckRepRecibo.Free;
    qckRepRecibo:=Nil;
    end;
    //temporal
    //ImprimirFactura(100);

    //RxDBGrid1.DataSource:=DataSource1;
  end;
  rxVenta.EmptyTable;
  if chkDisplay.Checked then
  Finalizardisplay;
  BitBtn1.Enabled:=True;
  BitBtn4.Enabled:=True;
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
  
  //EsDevolucion := False;
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
  if InactivaImprecibo then
  GlbImprimeReciboFact := 0;
  InactivaImprecibo:=False;
  label25.Font.Color := clBlack;
  if EsDevolucion then
  begin
    BitBtn7Click(Self);
  end;
  sumarDatos:=True;
  ActualizarPreventa;
  qryProdPorProveedor.Close;
  pnlPrecioProv.Visible:=False;
  EsModificandoFactura:=False;
  InicializaOtrosDesc;
  Application.ProcessMessages;
  if not Assigned(frmDistribuirPgoVenta) then
   frmDistribuirPgoVenta:=TfrmDistribuirPgoVenta.Create(Nil);
  try
    dmcxc.rxIngresoEnTarjeta.close;
    dmcxc.rxIngresoEnTarjeta.Open;
  finally
  frmDistribuirPgoVenta.Free;
  frmDistribuirPgoVenta:=nil;
  end;
  qryInventario.Close;
  qryInventario.Open;
  qryProductos.Close;
  qryProductos.Open;
  qryCliente.Close;
  qryCliente.Open;
  lblFechaCotizacion.Visible:= False;
  dbFechaCotizacion.Visible := False;
  Label36.Visible:=False;
  glbcodVendedor := -1;
  EsModificandoCotiza:=False;
  label36.Caption:='';
  NoTieneCredito:=False;     
  //VerificaImpresoraFiscalM;
  Refresh;
end;   

procedure TfrmProcVentaRapida.ProcActUltTrn;
begin
  stpProcBuscarUltNum.Params[2].Value := glbCia_Key; 
  stpProcBuscarUltNum.ExecProc;
  RxLabel1.Caption:='Ult. #Fact:'+ stpProcBuscarUltNum.params[1].AsString;
  RxLabel2.Caption:='Ult. #Trans:'+ stpProcBuscarUltNum.params[0].AsString;
end;

procedure TfrmProcVentaRapida.FormCreate(Sender: TObject);
begin
  //Ancho := 800;//1366;//1280; // Ancho del diseño
  //Alto  := 600;//768
{  Height := Height * Screen.Height Div Alto;
  Width := Width * Screen.Width Div Ancho;
  ScaleBy(Screen.Width, Ancho);
 }
  bitBtnEditarFact.Left := BitBtn6.Left;
  rxVenta.Close;
  rxVenta.EmptyTable;
  rxVenta.Open;
  Totales.EmptyTable;
  ActualizarRecoverData;
  EsModificandoFactura    :=False;
  GlbUsandoCotiza :=False;
  bitBtnEditarFact.Visible:=False;
  bitBtnEditarFact.Top := 490;
  bitBtnEditarFact.SendToBack;
  Label36.Visible:=False;
  ActivarBotonesEnModifica;
  tablaPropietario.Close;
  tablaPropietario.Open;
  lblFechaCotizacion.Visible:=False;
  dbFechaCotizacion.Visible:=False;
  EsModificandoCotiza:=False;
  
  _NumeroCotiza:=-1;
  glbcodVendedor := -1;
  
   numerodocReimp:=-1;
  tblMoneda.close;
  tblMoneda.Open;
  sqlAsignado:=False;
  sumarDatos:=True;
  GlbImprimeReciboFact:=1;
  InactivaImprecibo:=False;
  cboxTipoUnidad.Clear;
  bitBtnEditarFact.Visible := False;
  dmInventario.qryTipoUnidad.close;

  dmInventario.qryTipoUnidad.Open;
  dmInventario.qryTipoUnidad.First;
  While Not dmInventario.qryTipoUnidad.Eof Do
  begin
    cboxTipoUnidad.Items.Add(dmInventario.qryTipoUnidadDESCRIPCION.Value);
    dmInventario.qryTipoUnidad.Next;
  end;
  cboxTipoUnidad.ItemIndex := 1;
  if varTipousuario in [2,3]  then
  begin
    Devolucin1.Enabled := False;
    NotaDebito1.Enabled:= False;
    NotaCrdito1.Enabled:= False;
    CuadreCaja1.Enabled:= False;
    Inventario1.Enabled:= False;
  end else
  begin
    Devolucin1.Enabled := True;
    NotaDebito1.Enabled:= True;
    NotaCrdito1.Enabled:= True;
    CuadreCaja1.Enabled:= True;
    Inventario1.Enabled:= True;
  end;
  dmcompania.tblCompania.Close;
  dmcompania.tblCompania.Open;
  dmCompania.tblCompania.Locate('codigo',glbCia_Key,[]);
  reciboImpreso :=False;

  NoGenerarNCF1Click(Self);

  ProcActUltTrn;
  tablaPropietario.close;
  tablaPropietario.Open;
  qryCliente.Close;
  qryCliente.Open;
  qryProductos.Close;
  //qryProductos.Params[0].Value := glbCia_Key;//AQUIVOY
  //qryProductos.Params[1].Value := glbCia_Key;
  qryProductos.Open;
  Application.ProcessMessages;
  AsignarSqlText('','','');
  qryInventario.Close;
  qryInventario.Params[0].Value:=glbCia_Key;
  qryInventario.Open;
  rxVenta.Close;
  rxVenta.Open;
  dmCompania.tblCompania.Close;
  dmCompania.tblCompania.Open;
  dmCompania.tblCompania.Locate('codigo',glbCia_Key,[]);
  Label10.Caption:= DateToStr(GlbFechaTrnDiaria);
  dmUsuarios.qryEmpleados.Close;
  dmUsuarios.qryEmpleados.Open;
  dmUsuarios.qryEmpleados.Locate('CODIGO',VarUsuarioGlb,[]);
  Label12.Caption:= dmUsuarios.qryEmpleadosNOMBRE.Value;
  Totales.Close;
  Totales.Open;
  Totales.Insert;
  TotalesMoneda.Value  := IntToStr(GlbMonedaBase);
  TotalesSubTotal.Value:= 0;
  Totalesitbis.Value   := 0;
  Totalesmontodesc.Value:=0;
  Totalestotalneto.Value:=0;
  TotalesMontoNotaCredito.Value:=0;
  CheckBox4.Checked := False;
  Totalesmontorecibido.Value   :=0;
  Totalesdevolucion.Value      :=0;
  Totales.Post;
  lblProcDev.Visible := False;
  //BitBtn1.SetFocus;
  //frmMostrarProductos:=TfrmMostrarProductos.Create(Nil);
  if GlbFinanciamiento = false then
  begin
    BitBtn11.Visible := False;
    BitBtn12.Visible := False;
    BitBtn15.Top     := 401;
  end;

  if GlbActF10CodBarra = 1 then
  LectorCodBarra1Click(Self);
  qryVence.close;
  qryVence.open;
  if qryVence.RecordCount > 0 then
  begin
    SecretPanel1.Visible:=true;
    SecretPanel1.Lines.Clear;
    while not qryVence.eof do
    begin
      SecretPanel1.Lines.Add(qryVenceDESCRIPCION_PRODUCTO.Value+' - '+
      qryVenceDIASPORVENCER.AsString);
      qryVence.Next;
    end;
    SecretPanel1.Visible:=True;
    SecretPanel1.Active :=True;
  end;

  dmReportes.qryDatosCajaImpUser.close;
  dmReportes.qryDatosCajaImpUser.Params[0].Value:= VarUsuarioGlb;
  dmReportes.qryDatosCajaImpUser.Open;
  dmReportes.qryDatosCajaImpUser.Last;
  dmReportes.qryDatosCajaImpUser.RecordCount;

  lblStatusImpFiscal.Visible:= False;
  lblStatusImpFiscal.Font.Color:= clRed;
  NoGenerarNCF1Click(Self);
  Application.ProcessMessages;
  label25.Visible:=False;
  if (GlbImprimeReciboFact = 0) then
  begin
    label25.Caption := 'No Imp Rcbo';
    label25.Visible := True;
  end else
  label25.Caption := '';
  //Cargar transacciones en caso de que haya existido algun issue
  recuperando := True;
  EsModificandoFactura := False;  
  ProcRecoverData(False);
  InicializaOtrosDesc;
  if (GlbPermiteVtaServicioAdc = 1) then
  begin
    BitBtn23.Left := BitBtn19.Left;
    BitBtn23.Top  := BitBtn19.Top;
    BitBtn23.Visible:=True;
    BitBtn23.BringToFront;
    BitBtn19.Visible := False;
    BitBtn19.SendToBack;
  end;
  if (GlbActivaIFiscal = 0) then
  begin
    Button1.Visible:=False;
    Button2.Visible:=False;
    DBRadioGroup1.Visible:=False;
  end;
  //UGlobal.VerificaImpresoraFiscal;
  //if not GlbImpresoraFOnline then
  //begin
  //  lblStatusImpFiscal.Visible:= True;
  //  lblStatusImpFiscal.Font.Color:= clRed;
  //end;
end;
procedure TfrmProcVentaRapida.InicializaOtrosDesc;
begin
  dmfactura.stpInsertPorcOtrosCargosFServ.Params[1].Value := 0;
  dmfactura.stpInsertPorcOtrosCargosFServ.Params[2].Value := 0;
  dmfactura.stpInsertPorcOtrosCargosFServ.Params[3].Value := 0;
  dmfactura.stpInsertPorcOtrosCargosFServ.Params[4].Value := 0;
  dmfactura.stpInsertPorcOtrosCargosFServ.Params[5].Value := 0;
  dmfactura.stpInsertPorcOtrosCargosFServ.Params[6].Value := 0;
end;
procedure TfrmProcVentaRapida.edtCodigoChange(Sender: TObject);
begin
  if rxVenta.State = dsBrowse then
    if Not rxVentaSerie.IsNull then
      rxVenta.Last;
  rxLabelVence.Visible:= False;
  if LectorCodBarra1.Checked then exit;
  BuscandoPorDesc:=False;
  if (edtCodigo.Text = '') then Exit;
  //sqlAsignado:=False;
  if IsNumerico(edtCodigo.Text) then
  begin
    if Not sqlAsignado then
    AsignarSqlText('','','');
    //if rxqryInv.Locate('Codigo_Texto', edtCodigo.Text,[loCaseInsensitive, loPartialKey]) then
    if qryProductos.Locate('Codigo', StrtoInt(edtCodigo.Text), [loCaseInsensitive, loPartialKey]) then
    begin
      qryProdPorProveedor.Close; //qryProductosCodigo.value
      qryProdPorProveedor.Params[0].Value:= qryProductosCODIGO.Value;
      qryProdPorProveedor.Open;

      dmInventario.qryTipoUnidad.Locate('IDUNIDAD',qryProductosTIPO_UNIDAD.Value ,[]);
      cboxTipoUnidad.Text:=dmInventario.qryTipoUnidadDescripcion.Value;
      if qryVence.Locate('codigo_texto', qryProductosCodigo_Texto.Value,[]) then
      begin
        rxLabelVence.Visible:=true;
        rxLabelVence.Caption:='Vence en ' + qryVenceDIASPORVENCER.AsString;
      end else rxLabelVence.Visible:=False;
      //panel2.Top := edtcodigo.Top + 30;
      panel2.Left:= edtcodigo.Left;
      panel2.Visible := True;
      panel2.BringToFront;
      noExiste:=False;
    end else noExiste:= True;
  end else
  begin
    sqlAsignado:=False;
    BuscandoPorDesc:=True;
    AsignarSqlText('descripcion', chr(39) + '%'+edtCodigo.Text +'%'+chr(39),'');
    if qryProductos.Locate('Descripcion', edtCodigo.Text, [loCaseInsensitive, loPartialKey]) then
    begin
      qryProdPorProveedor.Close;
      qryProdPorProveedor.Params[0].Value:= qryProductosCODIGO.Value;
      qryProdPorProveedor.Open;
      if dmInventario.qryTipoUnidad.state = dsInactive then
      dmInventario.qryTipoUnidad.Open;
      dmInventario.qryTipoUnidad.Locate('IDUNIDAD',qryProductosTipo_Unidad.value,[]);
      cboxTipoUnidad.Text:=dmInventario.qryTipoUnidadDescripcion.value;
      if qryVence.Locate('Codigo_Texto',qryProductosCodigo_Texto.Value,[]) then
      begin
        rxLabelVence.Visible := true;
        rxLabelVence.Caption := 'Vence en ' + qryVenceDIASPORVENCER.AsString;
      end else rxLabelVence.Visible:=False;
      //panel2.Top := edtcodigo.Top+30;
      panel2.Left := edtcodigo.Left;
      panel2.Visible := True;
      panel2.BringToFront;
      noExiste:= False;
    end else noExiste:= True;
  end;
  if qryProdPorProveedor.RecordCount > 0 then
  pnlPrecioProv.Visible:=True else
  pnlPrecioProv.Visible:=False;
end;

procedure TfrmProcVentaRapida.edtCodigoExit(Sender: TObject);
var
  numero : Integer;
  FExiste : Boolean;
begin
  if (Pos('Cotización',label36.Caption) <= 0 )  then
  EsModificandoCotiza:=False;
  if (Length(edtcodigo.Text) > 0) And (qryProductosCodigo_Texto.Value <> edtCodigo.text) And ( noExiste ) and (not Panel2.Visible) then
  begin
    MessageDlg('Código producto no encontrado, verifique', mtInformation, [mbOK], 0);
    if Not Assigned(frmProcVentaRapida) Then
    edtCodigo.SetFocus;
    Exit;
  end;
  MontoItbisEnPrecio:=0;
  if (edtCodigo.Text = '') then Exit;
  Edit1.Text  := '';
  PrecioCambio:= False;
  if reciboImpreso then
  Totales.EmptyTable;

  reciboImpreso := False;
  //tttt if panel2.Visible  then
  //tttt edtCodigo.Text := qryProductosCodigo_Texto.Value;
  if BuscandoPorDesc then
  begin
    Panel2.BringToFront;
    Panel2.Visible := True;
    RxDBGrid2.SetFocus;
    Exit;
  end;

  //****************xxxx***********************
  if IsNumerico(edtCodigo.Text) then
  begin
    if Not sqlAsignado then
    AsignarSqlText('','','');
    if qryProductos.Locate('Codigo', edtCodigo.Text,[loCaseInsensitive, loPartialKey]) then
    begin
      qryProdPorProveedor.Close;
      qryProdPorProveedor.Params[0].Value:= qryProductosCODIGO.Value;
      qryProdPorProveedor.Open;
      LlenarTipoUnidadBox(qryProductosTipo_Unidad.Value);
      if (qryProductosTipo_Unidad.value >0) or (Not qryProductosTipo_Unidad.IsNull) then
      begin
        dmInventario.qryTipoUnidad.Locate('IDUNIDAD',qryProductosTipo_Unidad.value,[]);
        cboxTipoUnidad.Text:=dmInventario.qryTipoUnidadDescripcion.value;
      end;
      if qryVence.Locate('codigo', qryProductosCodigo_Texto.Value,[]) then
      begin
        rxLabelVence.Visible:= true;
        rxLabelVence.Caption:='Vence en ' + qryVenceDIASPORVENCER.AsString;
      end else rxLabelVence.Visible:=False;
      //panel2.Top := edtcodigo.Top + 30;
      panel2.Left:= edtcodigo.Left;
      panel2.Visible := True;
      panel2.BringToFront;
    end
  end else
  begin
    BuscandoPorDesc:=True;
    sqlAsignado:=False;
    AsignarSqlText('descripcion',chr(39) + '%'+edtCodigo.Text +'%'+chr(39),'');
    if qryProductos.Locate('Descripcion',edtCodigo.Text,[loCaseInsensitive, loPartialKey]) then
    begin
      qryProdPorProveedor.Close;
      qryProdPorProveedor.Params[0].Value:= qryProductosCODIGO.Value;
      qryProdPorProveedor.Open;    
      LlenarTipoUnidadBox(qryProductosTipo_Unidad.Value);
      dmInventario.qryTipoUnidad.Locate('IDUNIDAD',qryProductosTipo_Unidad.value,[]);
      cboxTipoUnidad.Text:=dmInventario.qryTipoUnidadDescripcion.value;

      if qryVence.Locate('Codigo_Texto',qryProductosCodigo_Texto.Value,[]) then
      begin
        rxLabelVence.Visible:=true;
        rxLabelVence.Caption:='Vence en ' + qryVenceDIASPORVENCER.AsString;
      end else rxLabelVence.Visible:=False;    
      //panel2.Top:=edtcodigo.Top+30;
      panel2.Left:=edtcodigo.Left;
      panel2.Visible:=True;
      panel2.BringToFront;
    end;
  end;
  //****************xxxx***********************
  Prod_existe := True;
  if IsNumerico(edtCodigo.text) then
  begin
    if Not qryProductos.Locate('codigo', edtCodigo.Text,[]) then
    Prod_existe:= False;
  end else
  if Not qryProductos.Locate('codigo_Texto', edtCodigo.Text,[]) then
  Prod_existe:= False;//qryProductoscodigo_texto.value

  if Prod_existe then
  begin
    Prod_existe:= True;
    qryInventario.Locate('CODIGO_TEXTO', edtCodigo.Text,[]);

    if rxVenta.State = dsBrowse then
    begin
      rxVenta.DisableControls;
      //rxVenta.SortOnFields('serie', false, false);
      if (rxVenta.RecordCount > 0) then
      begin
        rxVenta.Last;
        numero := rxVentaSerie.Value + 1;
      end else numero := 1;
      rxVenta.EnableControls;
      recuperando := False;
      //WriteToLog('Post rxVenta - Line 1812');
      rxVenta.Append;
      rxVentaglbcodVendedor.Value := qryClienteCOD_VENDEDOR.Value;
      rxVentaItbi.Value:=0;

     //_NumeroCotiza := -1;
      if (rxVenta.State In [dsInsert]) and (not EsModificandoCotiza)
      and (not EsModificandoFactura) then
      rxVentaTipoVenta.Value := 0;//Item venta;

      if EsModificandoCotiza then
      begin
        rxVentaNumeroCotiza.Value:=_NumeroCotiza;
        rxVentaStatus.Value:= 'I';
      end;

      if EsModificandoFactura then
      rxVentaStatus.Value:='I';

      RxSpeedButton1.Visible:=True;
      rxVentaCant.Value := 1;
      rxVentaInvetariar.Value:= qryProductosINVENTARIAR.Value;
      rxVentaSerie.Value := Numero;
      rxVentaFecha.Value := ExtraerFecha(GlbFechaTrnDiaria);
      if (GlbcodVendedor > 0) then
      rxVentaCodUsuario.Value := GlbcodVendedor
      else
      rxVentaCodUsuario.Value := VarUsuarioGlb;
    end;
    if rxVenta.State In [dsInsert, dsEdit] then
    begin
      rxVentaDescripcion.Value:= qryProductosDESCRIPCION.Value;
      rxVentaDescripcionEspecial.Value := qryProductosDESCRIPCIONADICIONAL.Value;
      rxVentaItbisExento.Value:= qryProductosPAGA_ITBI.Value;
      rxVentaReferencia.Value := qryProductosREFERENCIA.Value;
      if (qryClienteUSARLEVELPRECIO.IsNull) or (qryClienteUSARLEVELPRECIO.Value <= 0) then
      RxSpinEdit1.Value:=qryProductosUSARLEVELPRECIO.AsInteger
      else
      RxSpinEdit1.Value:=qryClienteUSARLEVELPRECIO.Value;

      rxVentaCodArticulo.Value:= qryProductoscodigo.Value;
      rxVentaRutaImagen.Value := BuscarRutaImagen(qryProductosCodigo.Value);
      rxVentaMonedaBase.Value := qryProductosCOD_MONEDA.Value;
      rxVentaCodTexto.Value   := qryProductosCODIGO_TEXTO.Value; //edtCodigo.Text;
      rxVentaCostoProducto.Value := qryProductosPRECIO_COMPRA.Value;

        if FAplicaPrecioMayorista and not GlbUsandoCotiza then
        rxVentaPrecio.Value  := qryClasifPrecioPRECIO_VENTA.Value
        else
        if (GlbUsaescalaPrecio =1) and (not GlbUsandoCotiza or ( rxVentaStatus.Value = 'I') ) then
        begin
          SetPrecioPorCantidad;//case
        end else
        begin
          if (qryClienteUSARLEVELPRECIO.IsNull) or (qryClienteUSARLEVELPRECIO.Value <= 0) then
          RxSpinEdit1.Value:=qryProductosUSARLEVELPRECIO.AsInteger
          else
          RxSpinEdit1.Value:=qryClienteUSARLEVELPRECIO.Value;
          SetPrecioPorCantidad;
          
          if (GlbTipoUnidad = 1) and (not GlbUsandoCotiza or (rxVentaStatus.Value = 'I'))then
          rxVentaPrecio.Value  := qryProductosPRECIO.Value //hoy es el dia de la salvacion
          else
          if  (precioXUnidad(GlbTipoUnidad,qryProductoscodigo.Value) > 0) and Not GlbUsandoCotiza then  // qryProductosPRECIO_TIPO_UNIDAD.Value > 0 then
          rxVentaPrecio.Value  := precioXUnidad(GlbTipoUnidad,qryProductoscodigo.Value)
          else
          begin
           if not GlbUsandoCotiza or ( rxVentaStatus.Value = 'I')  then
            rxVentaPrecio.Value  := qryProductosPRECIO.Value;
            cboxTipoUnidad.ItemIndex:=0;
            //MessageDlg('Precio no configurado para tipo unidad, verifique', mtError, [mbok],0);
          end;
        end;
        rxVentaMontoItbisenPrecio.Value:=0;
        MontoItbisEnPrecio:=0;
       //tj end;

      rxVentaInvetariar.Value:= qryProductosINVENTARIAR.Value;
      qryProdSerie.close;
      //qryProdSerie.Params[0].Value:= edtCodigo.Text;
      qryProdSerie.Params[0].Value:= qryProductoscodigo.Value;
      qryProdSerie.Open;
      if qryProdSerie.RecordCount > 0 then
      begin
      frmSelSerie:=TfrmSelSerie.Create(Nil);
      try
        if frmSelSerie.Showmodal = mrOk then
        begin
          if (qryProdSerieSTATUS.Value = 'R') then
          begin
            MessageDlg('Número serie no disponible, verifique',mtInformation, [mbOK], 0);
           edtCodigo.SetFocus;
          end;
          if (ibsqlVerificaSerie.Open) then
          ibsqlVerificaSerie.Close;
          ibsqlVerificaSerie.Params[0].Value:=qryProdSerieSERIE.Value;
          ibsqlVerificaSerie.ExecQuery;
          if (ibsqlVerificaSerie.FieldByName('serie_prod').IsNull) Or
          (ibsqlVerificaSerie.FieldByName('serie_prod').Value = '') then
          rxVentaSerieProd.Value:= qryProdSerieSERIE.Value
          else
          begin
            MessageDlg('Este número de serie fue procesado en otra orden, verifique',mtInformation, [mbOK], 0);
           edtCodigo.SetFocus;ibsqlVerificaSerie.FieldByName('serie_prod').Value
          end;
        end;
      finally
      frmSelSerie.Free;
      frmSelSerie:= Nil;
      end;
      end;

      if (GlbSolicitaNumLote = 1) then
      begin
        dmInventario.qryLote.Close;
        dmInventario.qryLote.Params[0].Value:= qryProductosCODIGO.Value;
        dmInventario.qryLote.Open;
        if dmInventario.qryLote.Recordcount > 0 then
        begin
          frmShowLote:=TfrmShowLote.Create(Nil);
          try
            if frmShowLote.Showmodal = mrOk then
            rxVentaloteNum.Value:= dmInventario.qryLoteLOTE_NUM.Value;
          finally
          frmShowLote.Free;
          frmShowLote:=Nil;
          end;
        end;
      end;
    end  else
    ProcesaNuevo;
  end;
  panel2.Visible:=MostrarVistaproductos1.Checked;
  if LectorCodBarra1.Checked And (rxVentaPrecio.Value > 0) then
  begin
    DBEdit1Enter(Self);
    DBEdit1Exit(Self);
    edtCodigo.SetFocus;
  end;
end;

procedure TfrmProcVentaRapida.ProcesaNuevo;
var
  numero : Integer;
begin
  if (edit1.Text <> '') and (rxVenta.RecordCount = 0) then
  begin
    edit1.Text:=''; 
    GlbUsandoCotiza:= False;
    GlbUsandoCotiza := False;
    rxVenta.Close;
    rxVenta.EmptyTable;
    rxVenta.Open;
    Totales.EmptyTable;
    ActualizarRecoverData;
    EsModificandoFactura:=False;
    bitBtnEditarFact.Visible:=False;
    bitBtnEditarFact.SendToBack;
    Label36.Visible:=False;
    label36.Caption:='';
    ActivarBotonesEnModifica;
    tablaPropietario.Close;
    tablaPropietario.Open;
    lblFechaCotizacion.Visible:=False;
    dbFechaCotizacion.Visible:=False;
    EsModificandoCotiza:=False;
    _NumeroCotiza:=-1;
    glbcodVendedor := -1;
  end;
  if rxVenta.State In [dsInsert] then
  rxVentaTipoVenta.Value := 0;//Item venta;
  if rxVenta.State In [dsInsert, dsEdit] then
  begin
    if (rxVentaCodArticulo.IsNull) OR (rxVentaCant.IsNull) OR (rxVentaPrecio.IsNull) then
    begin
      //if frmProcVentaRapida.Showing then
      if isShowing then
      begin
        edtCodigo.SetFocus;
        exit;
      end;
    end else
    //Exit;
    rxVenta.Post;
    //WriteToLog('Post rxVenta - Line 1959');
  end;
  rxVenta.DisableControls;
  if (rxVenta.RecordCount > 0) then
  begin
    rxVenta.Last;
    numero := rxVentaSerie.Value + 1;
  end else numero:=1;

  rxVenta.EnableControls;
  recuperando := False;

  WriteToLog('Post rxVenta - Line 1970');
  rxVenta.Append;
  rxVentaglbcodVendedor.Value := qryClienteCOD_VENDEDOR.Value;
  rxVentaItbi.Value:=0;

  if EsModificandoFactura then
  rxVentaStatus.Value   := 'I';
  RxSpeedButton1.Visible:= True;
  rxVentaCant.Value  := 1;
  rxVentaSerie.Value := Numero;
  rxVentaFecha.Value := ExtraerFecha(GlbFechaTrnDiaria);
  if (GlbcodVendedor > 0) then
  rxVentaCodUsuario.Value := GlbcodVendedor
  else
  rxVentaCodUsuario.Value := VarUsuarioGlb;
end;

procedure TfrmProcVentaRapida.BitBtn1Click(Sender: TObject);
begin
  {if (rxVentaCodArticulo.AsString <>'') and (rxVentaCant.AsString <> '')
     and (rxVentaMontoBruto.Value <= 0) then
  begin
    raise ERangeError.Create('Monto debe ser mayor que cero, verifique');
    DBEdit1.SetFocus;
    exit;
  end;}
  if (panel2.Visible = True) then
  begin
    DBEdit1Exit(Self);
    DBEdit2Exit(Self);
    panel2.Visible := False;
  end;
  reciboImpreso :=False;
  ProcesaNuevo;
  //if frmProcVentaRapida.Showing then
  if isShowing then
  edtCodigo.SetFocus;
end;

procedure TfrmProcVentaRapida.BitBtn3Click(Sender: TObject);
begin
  if rxVenta.state in [dsEdit, dsInsert] then rxVenta.Cancel;
  if rxVenta.RecordCount > 0 then
  begin
    if VerificaClave then
    begin
      if MessageDlg('Cancelar Venta?', mtInformation, [mbYes, mbNo], 0)= mrYes then
      begin
        GlbUsandoCotiza:= False;
        GlbUsandoCotiza := False;
        rxVenta.Close;
        rxVenta.EmptyTable;
        rxVenta.Open;
        Totales.EmptyTable;
        ActualizarRecoverData;
        EsModificandoFactura:=False;
        bitBtnEditarFact.Visible:=False;
        bitBtnEditarFact.SendToBack;
        Label36.Visible:=False;
        label36.Caption:='';
        ActivarBotonesEnModifica;
        tablaPropietario.Close;
        tablaPropietario.Open;
        lblFechaCotizacion.Visible:=False;
        dbFechaCotizacion.Visible:=False;
        EsModificandoCotiza:=False;
       _NumeroCotiza:=-1;
       glbcodVendedor := -1;
      end;
    end;
  end else
  begin
    //RxDBGrid2.visible
  end;
end;

procedure TfrmProcVentaRapida.DBEdit1Exit(Sender: TObject);
//var
//  guardarRec : TBookMark;
begin
  if rxVenta.State In [dsInsert, dsEdit] then
  begin
    rxVentaDescUnidadMedida.Value:=cboxTipoUnidad.Text;
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
    
    rxVentaMontoDescItem.Value:= rxVentaMontoBruto.Value * rxVentaPorcDescItem.Value / 100;    
  end;
  // guardarRec := rxVenta.GetBookmark;
  //Aplica Descuento e Itbis
  if (rxVentaSerie.Value = 0) then
  rxVentaSerie.Value:=1;
  GlbNumero:= rxVentaSerie.Value;

  if (auxiCant > 0) And (auxiCant <> rxVentaCant.Value) then
  PrecioCambio:=true;
   
  ProcesaCalculos;

  if rxVenta.State In [dsInsert, dsEdit] Then
  rxVenta.Post;
  //WriteToLog('Post rxVenta - Line 2061');
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

procedure TfrmProcVentaRapida.BitBtn2Click(Sender: TObject);
begin
//tj   if Not Entro And GlbPermiteCambioPrecio then
//tj   begin
    BitBtn10Click(Self);
//tj     rxVentaPrecio.Value:= rxqryInvPRECIO.Value;
//tj     DBEdit5Exit(Self);
//tj   end else
//tj   begin
//tj     rxVenta.Edit;
//tj     rxVentaPrecio.Value:= rxqryInvPRECIO.Value;
//tj   end;
  TipoVenta:='CONTADO';
  if rxVenta.State In [dsInsert, dsEdit] Then
  begin
    if not TotalesMoneda.IsNull then
    rxVentaMoneda.Value:= TotalesMoneda.Value;

    if rxVentaCodArticulo.IsNull Or rxVentaCant.IsNull Or rxVentaPrecio.IsNull then
    rxVenta.Cancel else
    rxVenta.Post;
    //WriteToLog('Post rxVenta - Line 2102');
  end;

  if (rxVentaMoneda.IsNull) then
  begin
    MessageDlg('Favor indicar tipo moneda.',mtError,[mbok],0);
    RxDBLookupCombo2.SetFocus;
  end;
  if rxVenta.RecordCount > 0 then
  //  if frmProcVentaRapida.Showing then
  if isShowing then
  Edit1.SetFocus;
  ActualizarRecoverData;
end;

procedure TfrmProcVentaRapida.rxVentaAfterPost(DataSet: TDataSet);
//var
//  GuardarRec : TBookMark;
begin
//  GuardarRec := rxVenta.GetBookmark;
  if not recuperando then
  ProcInsertarRecoverData;
  recuperando :=False;
  if sumarDatos then
  begin
    ProcesarSumaTotal;
    rxVenta.EnableControls;
    rxdbgrid2.EnableScroll;
    //rxdbgrid2.Enabled:=true;
  end;

//  rxVenta.GotoBookmark(GuardarRec);
//  rxVenta.FreeBookmark(GuardarRec);
end;

procedure TfrmProcVentaRapida.ProcesarSumaTotal;
var
  monto:Extended;
  itbis, descuento, neto: Extended;
  puerto, linea1, linea2 : String;
  MontoDescItem : Currency;
begin
  if rxVenta.state <> dsBrowse then Exit;
  rxVenta.DisableControls;
  rxVenta.First;
  Monto:=0; Itbis:=0; Descuento:=0; Neto:=0;
  MontoDescItem := 0;
  //rxVenta.Edit;
  //rxVentaMontoItbisEnPrecio.Value:=0;
  //rxVenta.Post;
  While Not rxVenta.Eof do
  begin
    if (rxVentaStatus.Value = 'C') then
    begin
      rxVenta.Next;
      Continue;
    end;
    {Monto := Monto + rxVentaMontoBruto.Value;
    Itbis := itbis + rxVentaItbi.Value;
    Descuento:= descuento + rxVentaMontoDescuento.Value;
    Neto     := Neto + rxVentaMontoNeto.Value;}

    if (rxVentaTipoVenta.Value = 2) then
    begin
      Monto := Monto - rxVentaMontoBruto.Value;
      Itbis := itbis - rxVentaItbi.Value;
      Descuento:= descuento - rxVentaMontoDescuento.Value;
      MontoDescItem := MontoDescItem - (Monto * rxVentaPorcDescItem.Value / 100);
      Neto     := Neto - rxVentaMontoNeto.Value;
    end else
    if (rxVentaTipoVenta.Value <> 0) And (rxVentaTipoVenta.Value <> 2) then
    begin
      Monto := Monto;// - rxVentaMontoBruto.Value;
      Itbis := itbis;// - rxVentaItbi.Value;
      Descuento:= descuento;// - rxVentaMontoDescuento.Value;
      MontoDescItem := MontoDescItem ;
      Neto     := Neto;// - rxVentaMontoNeto.Value;
    end else
    begin
      Monto := Monto + rxVentaMontoBruto.Value;
      Itbis := itbis + rxVentaItbi.Value;
      Descuento:= descuento + rxVentaMontoDescuento.Value;
      MontoDescItem := MontoDescItem + (Monto * rxVentaPorcDescItem.Value / 100);
      Neto     := Neto + rxVentaMontoNeto.Value;
    end;
    rxVenta.Next;
  end;
  rxVenta.EnableControls;
  //EditN1.Text:=InsertarComa(FloatToStr(Monto));

  //EdtMontoDesc.Text := InsertarComa(FloatToStr(Descuento));
  //edtTotalNeto.Text := InsertarComa(FloatToStr(Neto));
  //edtItbis.Text     := InsertarComa(FloatToStr(Itbis));

  Totales.Edit;

  TotalesSubTotal.Value     := Monto;
  TotalesMontoDescItems.Value:=MontoDescItem;
  
  if rdgFactServicio.Checked then
  CalcularDescIndirecto;

  Totalesitbis.Value        := Itbis;
  Totalesmontodesc.Value    := Descuento;
  {if not EsFactura or not EsFinanciamiento then
    if (Totalesmontorecibido.Value < Neto) then
  begin
    MessageDlg('Monto recibido no puede ser menor que Neto, verifique',mtInformation, [mbOK], 0);
  end;}
  SetMontoNotaCredito;
  //if (TotalesMontoNotaCredito.Value > 0) then
  //CheckBox4.Checked:= True
  //else
  //CheckBox4.Checked:= False;

  if EsFactura Or EsFinanciamiento then
  begin
    if (Totalesmontorecibido.Value < Neto) then
    Totalestotalneto.Value := Neto - Totalesmontorecibido.Value -
    TotalesMontoInteres.Value + TotalesMontoSubTotalIndirectos.Value
    else Totalestotalneto.Value := Totalesmontorecibido.Value - Neto -
    TotalesMontoInteres.Value +  TotalesMontoSubTotalIndirectos.Value;
  end else
  begin
    if Totales.State In [dsEdit, dsInsert] then
    Totalestotalneto.Value := Neto + TotalesMontoSubTotalIndirectos.Value;
  end;

  if (TotalesMontoNotaCredito.Value > ABS(Totalestotalneto.Value)) And (CheckBox4.Checked) then
  begin
    TotalesMontoNCRAplicado.Value:=Totalestotalneto.Value;
    Totalestotalneto.Value:= 0;
    //checkBox4.Checked:=False;
  end else
  if (CheckBox4.Checked) then
  begin
    //CheckBox4.Checked:=True;
    TotalesTotalNeto.Value:= TotalesTotalNeto.Value - TotalesMontoNotaCredito.Value;
    TotalesMontoNCRAplicado.Value:=TotalesMontoNotaCredito.Value;
  end;

  Totales.Post;

  if chkDisplay.Checked then
  begin
    puerto:='1';
    linea1:= '*** Total  Venta ***';
    linea2:=Format('%8.2f',[Totalestotalneto.Value]);
    WinExec(PChar('_display "'+puerto +'" "'+ linea1 +
    '" "'+ linea2 +'"'),SW_HIDE);
  end;
end;

procedure TfrmProcVentaRapida.Edit1Exit(Sender: TObject);
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
  Totalesdevolucion.Value := 0;
  BitBtn4.Enabled := True;
  if Not EsFactura Or Not EsFinanciamiento then
    if (x < -0.01 ) then
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

procedure TfrmProcVentaRapida.edtCodigoEnter(Sender: TObject);
begin
  Refresh;
  edtCodigo.SelectAll;
end;

procedure TfrmProcVentaRapida.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var
    xxxx : word; item : String;
begin
  //113-F2 f4-115   f5-116     f3-114
  xxxx:= key;
  if (key = 122) then //F11
  begin
    if MessageDlg('Desea guardar venta?',mtWarning,[mbyes,mbno],0) = mryes then
    RxSpeedButton1Click(Self);
    exit;
  end;
  if (key = 123) and (GlbActivaIFiscal = 0 ) then //F12
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
  else if (key = 117) then //F6
  CheckBox1.checked:= Not CheckBox1.checked;
  if (key = 113) then
  begin
    edtCodigo.SetFocus;
    Exit;
  end;
  if (key = 115) then
  BitBtn3Click(Self) else
  if (key = 113) then
  BitBtn1Click(Self)
  else if (key = 114) then BitBtn2Click(Self)
  else if (key = 116) then
  if (Edit1.Text <> '') then
  BitBtn4Click(Self)
  else if (key = 119) then //F8
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

procedure TfrmProcVentaRapida.rxVentaBeforePost(DataSet: TDataSet);
begin
  if rxVentaCant.IsNull or rxVentaPrecio.IsNull or rxVentaSerie.IsNull or rxVentaCodArticulo.IsNull then
  begin
    DataSet.Cancel;
    //if frmProcVentaRapida.Showing then
    if isShowing then
    BitBtn1.SetFocus;
  end else
  if rxVentaStatus.isNull then
  rxVentaStatus.Value:='A';
end;

procedure TfrmProcVentaRapida.BitBtn5Click(Sender: TObject);
begin
  EsModificandoFactura:= Label36.Visible;
  if rxVenta.state = dsbrowse then
  begin
    if (EsModificandoCotiza) then
    begin
      if (rxVentaStatus.Value = 'I') then
      begin
        rxVenta.Delete;
        ProcesarSumaTotal;        
      end else
      begin
        rxVenta.Edit;
        rxVentaStatus.Value:='C';
        rxVenta.Post;
        //WriteToLog('Post rxVenta - Line 2357');
        ProcesarSumaTotal;        
      end;
    end else
    if EsModificandoFactura then
    begin
      if (rxVentaStatus.Value = 'I') then
      begin
        rxVenta.Delete;
        ProcesarSumaTotal;        
      end else
      begin
        rxVenta.Edit;
        rxVentaStatus.Value:='C';
        rxVenta.Post;
        //WriteToLog('Post rxVenta - Line 2372');
        ProcesarSumaTotal;        
      end;
    end else
    if EsModificandoFactura then
    begin
      if VerificaClave then
      begin
        if MessageDlg('Borrar item No.' + rxVentaSerie.AsString + '?', mtWarning, [mbYes, mbNO], 0)= mrYes then
        begin
          EliminarRecoverData;
          rxVenta.Delete;
          ProcesarSumaTotal;
        end;
      end;
    end else
    begin
      if MessageDlg('Borrar item No.' + rxVentaSerie.AsString + '?', mtWarning, [mbYes, mbNO], 0)= mrYes then
      begin
        EliminarRecoverData;
        rxVenta.Delete;
        ProcesarSumaTotal;
      end;
    end;
  end;
end;

procedure TfrmProcVentaRapida.Inventario1Click(Sender: TObject);
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

procedure TfrmProcVentaRapida.CuadreCaja1Click(Sender: TObject);
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

procedure TfrmProcVentaRapida.InsertarDetDevolucion(numero : Integer);
begin
  ibStpInsertVentaDet.Params[0].Value  := Numero;
  ibStpInsertVentaDet.Params[1].Value  := rxVentaCodArticulo.Value;
  ibStpInsertVentaDet.Params[2].Value  := Null;
  ibStpInsertVentaDet.Params[3].Value  := rxVentaDescripcion.Value;
  ibStpInsertVentaDet.Params[4].Value  := rxVentaCant.Value* -1;
  ibStpInsertVentaDet.Params[5].Value  := rxVentaPrecio.Value* -1;
  ibStpInsertVentaDet.Params[6].Value  := rxVentaporc_desc.Value;//descuento
  ibStpInsertVentaDet.Params[7].Value  := rxVentaItbi.Value* -1;//itbi_det
  ibStpInsertVentaDet.Params[8].Value  := rxVentaMontoBruto.Value* -1;
  ibStpInsertVentaDet.Params[9].Value  := rxVentaMontoNeto.Value * -1;
  ibStpInsertVentaDet.Params[10].Value := UProcesarDevolucion.numerofactura;
  ibStpInsertVentaDet.Params[11].Value := 'A';
  ibStpInsertVentaDet.Params[12].Value := Now;
  ibStpInsertVentaDet.Params[13].Value := strusername;
  ibStpInsertVentaDet.Params[14].Value := Null;
  ibStpInsertVentaDet.Params[15].Value := Null;
  ibStpInsertVentaDet.Params[16].Value := Null;
  ibStpInsertVentaDet.Params[17].Value := Null;
  ibStpInsertVentaDet.Params[18].Value := Null;
  ibStpInsertVentaDet.Params[19].Value := Null;
  ibStpInsertVentaDet.Params[20].Value := rxVentaSerieProd.Value;
  ibStpInsertVentaDet.Params[21].Value := rxVentaTipoUnidad.Value;
  ibStpInsertVentaDet.Params[22].Value := rxVentaItbisExento.Value;
  ibStpInsertVentaDet.Params[23].Value := rxVentaTipoVenta.Value;//Item de Venta
  ibStpInsertVentaDet.Params[24].Value := rxVentaDescripcionEspecial.Value;//Item de Venta
  ibStpInsertVentaDet.Params[25].Value := rxVentaCostoProducto.Value;
  ibStpInsertVentaDet.Params[26].Value := rxVentaPorcDescItem.Value;
  ibStpInsertVentaDet.Params[27].Value := rxVentaMontoDescItem.Value;

  tblProductoSerie.close;
  tblProductoSerie.Params[0].Value := rxVentaSerieProd.Value;
  tblProductoSerie.Open;

  if (tblProductoSerie.RecordCount = 1) then
  begin
    tblProductoSerie.Edit;
    tblProductoSerieSTATUS.Value:='A';
    tblProductoSerie.Post;
    tblProductoSerie.ApplyUpdates;
    if not tblProductoSerie.Transaction.InTransaction then
    tblProductoSerie.Transaction.StartTransaction;
    try
      tblProductoSerie.Transaction.CommitRetaining;
    except
    tblProductoSerie.Transaction.RollbackRetaining;
    end;
  end;
  if (not rxVentaloteNum.IsNull) then
  begin
    ibstpUpdateLote.Params[0].Value:= rxVentaCodArticulo.Value;
    ibstpUpdateLote.Params[1].Value:= rxVentaloteNum.Value;
    ibstpUpdateLote.Params[2].Value:= rxVentaCant.Value*-1;
    ibstpUpdateLote.ExecProc;
    if Not ibstpUpdateLote.Transaction.InTransaction then
    ibstpUpdateLote.Transaction.StartTransaction;
    try
      ibstpUpdateLote.Transaction.CommitRetaining;
    except
    ibstpUpdateLote.Transaction.RollbackRetaining;
    end;
  end;
  ibStpInsertVentaDet.ExecProc;

  if Not ibStpInsertVentaDet.Transaction.InTransaction then
  ibStpInsertVentaDet.Transaction.StartTransaction;
  try
    ibStpInsertVentaDet.Transaction.CommitRetaining;
  except
  ibStpInsertVentaDet.Transaction.RollbackRetaining;
  end;
end;

procedure TfrmProcVentaRapida.InsertarDet(numero : Integer);
begin
  ibStpInsertVentaDet.Params[0].Value  := Numero;
  ibStpInsertVentaDet.Params[1].Value  := rxVentaCodArticulo.Value;
  ibStpInsertVentaDet.Params[2].Value  := Null;
  ibStpInsertVentaDet.Params[3].Value  := rxVentaDescripcion.Value;
    if (rxVentaTipoVenta.Value in [1,4,5])  then //Item de Venta
  begin
    ibStpInsertVentaDet.Params[4].Value  := rxVentaCant.Value * -1;
    ibStpInsertVentaDet.Params[5].Value  := rxVentaPrecio.Value * -1;
    ibStpInsertVentaDet.Params[6].Value  := rxVentaporc_desc.Value * -1;//descuento
    ibStpInsertVentaDet.Params[7].Value  := rxVentaItbi.Value * -1;//itbi_det
    ibStpInsertVentaDet.Params[8].Value  := rxVentaMontoBruto.Value * -1;
    ibStpInsertVentaDet.Params[9].Value  := rxVentaMontoNeto.Value * -1;
  end else
  begin
    ibStpInsertVentaDet.Params[4].Value  := rxVentaCant.Value;
    ibStpInsertVentaDet.Params[5].Value  := rxVentaPrecio.Value;
    ibStpInsertVentaDet.Params[6].Value  := rxVentaporc_desc.Value;//descuento
    ibStpInsertVentaDet.Params[7].Value  := rxVentaItbi.Value;//itbi_det
    ibStpInsertVentaDet.Params[8].Value  := rxVentaMontoBruto.Value;
    ibStpInsertVentaDet.Params[9].Value  := rxVentaMontoNeto.Value;
  end;

  ibStpInsertVentaDet.Params[10].Value := Null;
  ibStpInsertVentaDet.Params[11].Value := 'A';
  ibStpInsertVentaDet.Params[12].Value := Now;
  ibStpInsertVentaDet.Params[13].Value := Null;
  ibStpInsertVentaDet.Params[14].Value := Null;
  ibStpInsertVentaDet.Params[15].Value := Null;
  ibStpInsertVentaDet.Params[16].Value := Null;
  ibStpInsertVentaDet.Params[17].Value := Null;
  ibStpInsertVentaDet.Params[18].Value := Null;
  ibStpInsertVentaDet.Params[19].Value := Null;
  ibStpInsertVentaDet.Params[20].Value := rxVentaSerieProd.Value;
  ibStpInsertVentaDet.Params[21].Value := rxVentaTipoUnidad.Value;
  ibStpInsertVentaDet.Params[22].Value := rxVentaItbisExento.Value;
  ibStpInsertVentaDet.Params[23].Value := rxVentaTipoVenta.Value;//Item de Venta
  ibStpInsertVentaDet.Params[24].Value := rxVentaDescripcionEspecial.Value;//Item de Venta
  ibStpInsertVentaDet.Params[25].Value := rxVentaCostoProducto.Value;
  ibStpInsertVentaDet.Params[26].Value := rxVentaPorcDescItem.Value;
  ibStpInsertVentaDet.Params[27].Value := rxVentaMontoDescItem.Value;   

  tblProductoSerie.close;
  tblProductoSerie.Params[0].Value := rxVentaSerieProd.Value;
  tblProductoSerie.Open;

  if (tblProductoSerie.RecordCount = 1) then
  begin
    tblProductoSerie.Edit;
    tblProductoSerieSTATUS.Value:='R';
    tblProductoSerie.Post;
    tblProductoSerie.ApplyUpdates;
    if not tblProductoSerie.Transaction.InTransaction then
    tblProductoSerie.Transaction.StartTransaction;
    try
      tblProductoSerie.Transaction.CommitRetaining;
    except
    tblProductoSerie.Transaction.RollbackRetaining;
    end;
  end;
  if (not rxVentaloteNum.IsNull) then
  begin
    ibstpUpdateLote.Params[0].Value:= rxVentaCodArticulo.Value;
    ibstpUpdateLote.Params[1].Value:= rxVentaloteNum.Value;
    ibstpUpdateLote.Params[2].Value:= rxVentaCant.Value;
    ibstpUpdateLote.ExecProc;
  end;
  ibStpInsertVentaDet.ExecProc;

  if (GlbActivaCafeteria = 1) then
  begin
    dmVentas.qryIngredienteCaf.Close;
    dmVentas.qryIngredienteCaf.Params[0].Value:=rxVentaCodArticulo.Value;
    dmVentas.qryIngredienteCaf.Open;
    dmVentas.qryIngredienteCaf.First;
    dmVentas.tblTransCafeteria.Close;
    dmVentas.tblTransCafeteria.Params[0].Value:= Numero;
    dmVentas.tblTransCafeteria.open;
    while not dmVentas.qryIngredienteCaf.Eof do
    begin
      InsertaTransCafeteria(Numero,dmVentas.qryIngredienteCafCODIGO_PROD.Value,dmVentas.qryIngredienteCafCANT.Value);
      dmVentas.qryIngredienteCaf.Next;
    end;
  end;
end;

procedure TfrmProcVentaRapida.Ayuda1Click(Sender: TObject);
begin
  ShellExecute(frmProcVentaRapida.Handle,nil,PChar('C:\Proyectos\PointSaleSoftGold\PuntoVenta\ManualOnline.html'),'','',SW_SHOWNORMAL);
end;

procedure TfrmProcVentaRapida.ImprimirRecibo1Click(Sender: TObject);
begin
  ImprimirRecibo1.Checked:= Not ImprimirRecibo1.Checked;
end;

procedure TfrmProcVentaRapida.BitBtn6Click(Sender: TObject);
  var
     Serie_Asignadoncf : Integer;
     serieDoc : Integer;
     valorNCF : String;
     tRecordsDet : Integer;
     ShowNcfVentana:Boolean;
begin
  {if (rdgFactServicio.Checked and rdgFactVentaProducto.Checked)
  And (rxventa.RecordCount > 0) then
  begin
    MessageDlg('Favor indicar tipo de Operación', mtInformation, [mbOK], 0);
    rdgFactServicio.SetFocus;
    exit;
  end; }
//tj   if Not Entro And GlbPermiteCambioPrecio then
//tj   begin
//tj     BitBtn10Click(Self);
//tj     rxVentaPrecio.Value:= rxqryInvPRECIO.Value;
//tj     DBEdit5Exit(Self);
//tj   end;
   if rxVenta.RecordCount = 0 then
   begin
     MessageDlg('No puedes guardar sin detalle, verifique.',mtInformation,[mbok],0);
     Exit;
   end;
      if not VerificaRecordsVenta then
   begin
     MessageDlg('Debe existir al menos un record activo, verifique.',mtInformation,[mbok],0);
     Exit;
   end;

  if Not rxVentaNumeroCotiza.IsNull then
  begin
    if MessageDlg('Convertir cotización en venta y facturar?', mtInformation,[mbYes, mbNo], 0)=mrYes then
    begin
      EsModificandoCotiza:=False;
      _NumeroCotiza:=-1;
      lblFechaCotizacion.Visible:=False;
      dbFechaCotizacion.Visible:=False;
      Label36.Visible:=False;
      label36.Caption:='';
    end else
    begin
     BitBtn6.Enabled:=True;
     Exit;
    end;
  end;
   if tablaPropietario.State In [dsEdit, dsInsert] then
  tablaPropietario.Post;
  if (tablaPropietario.RecordCount = 0) or (tablaPropietarioCodigoPropietario.Value = 0) then
  begin
    MessageDlg('Favor seleccionar cliente', mtInformation, [mbOK], 0);
    RxDBLookupCombo1.SetFocus;
    BitBtn6.Enabled:=True;
    Exit;
  end;
    BitBtn6.Enabled:=False;
  xSalir := False;
  EsFinanciamiento := False;
  EsFactura := True;
  serieDoc := 0;

  if not tablaPropietarioCodigoPropietario.IsNull then
  if qryClienteCOD_VENDEDOR.Value > 0 then
    GlbCodVendedor :=qryClienteCOD_VENDEDOR.Value
    else
    GlbCodVendedor := -1;

  FrmBuscarClientesPersonas:=TFrmBuscarClientesPersonas.Create(Nil);
  try
    TipoVenta := 'CREDITO';
    xCodigoCte:= -1;
    xCodigoCte := tablaPropietarioCodigoPropietario.Value; //FrmBuscarClientesPersonas.CodigoCliente;
    if (xCodigoCte <= 0) Then Exit;
    if Not  xSalir Then
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
        if (Not qryClienteCANT_DIAS_CREDITO.IsNull) And (qryClienteCANT_DIAS_CREDITO.Value > 0) Then
        TotalesFechaVence.Value    := GlbFechaTrnDiaria + qryClienteCANT_DIAS_CREDITO.Value
        else
        TotalesFechaVence.Value    := GlbFechaTrnDiaria + 15;//Default
        Totales.Post;

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

        if not VerificaLimiteCredito(
                  xCodigoCte,
                  TotalesTotalNeto.Value) then
        begin
          if NoTieneCredito then
          MessageDlg('Cliente no tiene crédito...', mtWarning, [mbOK], 0)
          else
          MessageDlg('Balance CXC excede limite de crédito.', mtWarning, [mbOK], 0);
          BitBtn6.Enabled:=True;
          Exit;
        end;

        CheckBox1.Checked := True;
        ValorNCF := '';
        Serie_Asignadoncf := -1;
        ShowNcfVentana:=True;
        frmSelNCF:=TfrmSelNCF.Create(Nil);
        try
          if NCFSinValorFiscal1.Checked then
          dmFactura.ibQryViewNCF.Locate('TIPO_CF','02',[])
          else dmFactura.ibQryViewNCF.Locate('TIPO_CF','01',[]);

          if (tablaPropietarioCodigoPropietario.Value > 0) then
          begin
            if qryCliente.Locate('CODIGO_CTE',tablaPropietarioCodigoPropietario.Value,[]) then
            begin
              if (qryClienteTIPO_CF.Value <> '') then
              begin
                if dmFactura.ibQryViewNCF.Locate('TIPO_CF',qryClienteTIPO_CF.Value ,[]) then
                begin
                  //{necesito depurar esto
                  GlbDescNCF := dmFactura.ibQryViewNCFDESCRIPCION.Value;
                  //t ProcVentaConNCF(dmFactura.ibQryViewNCFTIPO_CF.Value, ValorNCF, serieDoc, serie_asignadoncf);
                  //t ProcVenta(valorNCF, Serie_Asignadoncf,serieDoc);//Aqui voy
                  //t ProcesaFacturar(1, serieDoc, xcodigocte);
                  //t Totales.EmptyTable;

                  //ShowNcfVentana := False;//}
                end;
              end;
            end;
          end;
          //}//temporal depurar

          //if (frmSelNCF.ShowModal = mrOK) and (ShowNcfVentana) then
          if ShowNcfVentana then
          begin
            //if CheckBox4.Checked then
            if TotalesMontoNCRAplicado.Value > 0 then
            DescargaNotaCredito;
            if (frmSelNCF.ShowModal = mrOK) then
            begin
              GlbDescNCF:=dmFactura.ibQryViewNCFDESCRIPCION.Value;
              ProcVentaConNCF(dmFactura.ibQryViewNCFTIPO_CF.Value, ValorNCF, serieDoc, serie_asignadoncf);
              ProcVenta(valorNCF, Serie_Asignadoncf,serieDoc);//Aqui voy
              ProcesaFacturar(1, serieDoc, xcodigocte);
              //Totales.EmptyTable;
            end else
            begin
              GlbDescNCF:='';
              ProcVenta(ValorNCF,Serie_Asignadoncf,serieDoc);//Aqui voy
              ProcesaFacturar(1, serieDoc, xcodigocte);
              //temporal
              //BitBtn19Click(self);
              //ImpFacturaservicio(serieDoc,true);
              //Totales.EmptyTable;
            end;
          end;
          finally
          frmSelNCF.Free;
          frmSelNCF:= Nil;
          end;
              //INGESERVIS, ARTIOFFICE,MAISONMARIE,TRIPLETASSO
    if (UpperCase(GLBFormatoFactura) = 'BYMSERVICIOS') then 
    begin
      frmConsultaFacturas:=TfrmConsultaFacturas.Create(Nil);
              try
                frmConsultaFacturas.rdgCredito.Checked := True;
                frmConsultaFacturas.EditN1.SetInteger(serieDoc);
                //frmConsultaFacturas.edtCodCte.SetInteger(tablaPropietarioCodigoPropietario.Value);
               if not ExpExcel then
               begin
                 frmConsultaFacturas.BitBtn1Click(Self);
                 qckFactCredArtioffice8_5_F_1ByM:=TqckFactCredArtioffice8_5_F_1ByM.Create(nil);
                 try
                   qckFactCredArtioffice8_5_F_1ByM.Preview;
                 finally
                 qckFactCredArtioffice8_5_F_1ByM.free;
                 qckFactCredArtioffice8_5_F_1ByM:=nil;
                 end;
                end else
               begin

                 //Aqui Exportar a Excel
               end;
          finally

          if Assigned(frmConsultaFacturas) then
          frmConsultaFacturas.Free;
          frmConsultaFacturas:=Nil;
          end;
    end else
          if (((UpperCase(GLBFormatoFactura) = 'INGESERVIS')) OR
             ((UpperCase(GLBFormatoFactura) = 'ARTIOFFICE'))) then
          begin
            if rdgFactServicio.Checked then
            begin
              ImpFacturaservicio(serieDoc,false);//Dios es Amor
            end else
            begin
              frmConsultaFacturas:=TfrmConsultaFacturas.Create(Nil);
              try
                frmConsultaFacturas.rdgCredito.Checked := True;
                frmConsultaFacturas.EditN1.SetInteger(serieDoc);
                //frmConsultaFacturas.edtCodCte.SetInteger(tablaPropietarioCodigoPropietario.Value);
               if not ExpExcel then
               begin
                 frmConsultaFacturas.BitBtn1Click(Self);
                 qckFactCredArtioffice8_5_F_1:=TqckFactCredArtioffice8_5_F_1.Create(nil);
                 try
                   qckFactCredArtioffice8_5_F_1.Preview;
                 finally
                 qckFactCredArtioffice8_5_F_1.free;
                 qckFactCredArtioffice8_5_F_1:=nil;
                 end;
                end else
               begin

                 //Aqui Exportar a Excel
               end;
          finally

          if Assigned(frmConsultaFacturas) then
          frmConsultaFacturas.Free;
          frmConsultaFacturas:=Nil;
          end;

        end;
  end else
  begin
    dmCompania.tblCompania.Close;
    dmCompania.tblCompania.Open;
    dmCompania.tblCompania.Locate('codigo',glbCia_Key,[]);
    dmfactura.qryFactReimpMaster.Close;
    dmfactura.qryFactReimpMaster.Params[0].Value:= serieDoc;

    dmfactura.qryFactReimpDet.Close;
    dmfactura.qryFactReimpDet.Params[0].Value:=dmfactura.qryFactReimpMaster.Params[0].Value;
    dmfactura.qryFactReimpDet.Open;
    dmfactura.qryFactReimpDet.Last;
    tRecordsDet := dmfactura.qryFactReimpDet.RecordCount;
    dmfactura.qryFactReimpDet.Close;

    dmfactura.qryFactReimpMaster.Open;
    frmConsultaFacturas:=TfrmConsultaFacturas.Create(Nil);
    try
      frmConsultaFacturas.rdgCredito.Checked:=True;
      frmConsultaFacturas.EditN1.SetInteger(dmfactura.qryFactReimpMaster.Params[0].Value);
      //frmConsultaFacturas.edtCodCte.SetInteger(dmfactura.qryFactReimpMasterCODIGO_CTE.Value);
      if not ExpExcel then
      begin
        frmConsultaFacturas.BitBtn1Click(Self);
      end else
      begin
        //Aqui Exportar a Excel
      end;
    finally
    if Assigned(frmConsultaFacturas) then
    frmConsultaFacturas.Free;
    frmConsultaFacturas:=Nil;
    end;

    dmclientes.tblClientes.Close;
    dmclientes.tblClientes.Open;
    if dmclientes.tblClientes.Locate('CODIGO_CTE', dmfactura.qryFactReimpMasterCODIGO_CTE.Value,[]) then
    glbcodVendedor:=dmclientes.tblClientesCOD_VENDEDOR.Value
    else
    glbcodVendedor:= VarUsuarioGlb;
      if dmfactura.qryFactReimpMaster.Recordcount > 0 then
      begin

        if (GlbFact55Pulg = 1) then
        begin
          if GlbFacturaLicoreria =1 then
          begin
            qckRepFacturaEstandarNewReimpREsp:=TqckRepFacturaEstandarNewReimpREsp.Create(Nil);
            try
             if GlbSizeFact8x11 = 1 then
             qckRepFacturaEstandarNewReimpREsp.Page.Length := 11;
             qckRepFacturaEstandarNewReimpREsp.xtipoVenta := TipoVenta;
             qckRepFacturaEstandarNewReimpREsp.Prepare;
             glbTPag := qckRepFacturaEstandarNewReimpREsp.PageNumber;
             //qckRepRecibo8_5_11REsp.valorNCF:= GlbDescNCF;//valorNCF;
            if ImprimirRecibo1.Checked then
             begin
               qckRepFacturaEstandarNewReimpREsp.PrinterSetup;
               qckRepFacturaEstandarNewReimpREsp.Print;
             end else
             qckRepFacturaEstandarNewReimpREsp.Preview;
             finally
             qckRepFacturaEstandarNewReimpREsp.Free;
             qckRepFacturaEstandarNewReimpREsp:=Nil;
             end;
          end else
          begin
            qckRepFacturaEstandarNewReimp:=TqckRepFacturaEstandarNewReimp.Create(Nil);
            try
              if GlbSizeFact8x11 = 1 then
              qckRepFacturaEstandarNewReimp.Page.Length := 11;

              qckRepFacturaEstandarNewReimp.Prepare;
              glbTPag := qckRepFacturaEstandarNewReimp.PageNumber;

              if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
              begin
                qckRepFacturaEstandarNewReimp.PrinterSetup;
                qckRepFacturaEstandarNewReimp.Print;
              end else
              qckRepFacturaEstandarNewReimp.Preview;
            finally
            qckRepFacturaEstandarNewReimp.Free;
            qckRepFacturaEstandarNewReimp:=Nil;
          end;
        end;
      end
      else
      begin //ver aqui posibilidad de impresora fiscal
        if (GlbActivaIFiscal = 0) then
        begin
          qckRepFactPuntoVenta:=TqckRepFactPuntoVenta.Create(Nil);
          try
            qckRepFactPuntoVenta.QRLabel14.Enabled:=False;
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
      end;
    end;
  end;
          //aquivoyDios y Señor te imploro que envies los angeles ayudantes de la mente en mi auxilio. Gracias. AMEN.
  serieDoc:=-1;
  Serie_Asignadoncf:=-1;
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
  ActualizarPreventa;
  qryProdPorProveedor.Close;
  pnlPrecioProv.Visible:=False;
  BitBtn6.Enabled:=True;
  EsModificandoFactura:=False;
  EsModificandoCotiza := False;
  qryInventario.Close;
  qryInventario.Open;
  qryProductos.Close;
  qryProductos.Open;
  lblFechaCotizacion.Visible:= False;
  dbFechaCotizacion.Visible := False;
  Label36.Visible:=False;
  label36.Caption:='';  
  _NumeroCotiza:=-1;
  glbcodVendedor := -1;
  GlbUsandoCotiza := False;
  Refresh;
  Application.ProcessMessages;
  
end;

procedure TfrmProcVentaRapida.BuscarCliente1Click(Sender: TObject);
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
  Application.ProcessMessages;
end;

procedure TfrmProcVentaRapida.Cotizar1Click(Sender: TObject);
begin
  //BuscarCliente1Click(Self);
  BitBtn8Click(Self)
end;

procedure TfrmProcVentaRapida.BitBtn8Click(Sender: TObject);
begin
   if rxVenta.RecordCount = 0 then
   begin
     MessageDlg('No puedes guardar sin detalle, verifique.',mtInformation,[mbok],0);
     Exit;
   end;
   if not VerificaRecordsVenta then
   begin
     MessageDlg('Debe existir al menos una record activo, verifique.',mtInformation,[mbok],0);
     Exit;
   end;
   if tablaPropietario.State In [dsEdit, dsInsert] then
   tablaPropietario.Post;
   if (tablaPropietario.RecordCount = 0) or (tablaPropietarioCodigoPropietario.Value = 0) then
   begin
     MessageDlg('Favor seleccionar cliente', mtInformation, [mbOK], 0);
     RxDBLookupCombo1.SetFocus;
     BitBtn6.Enabled:=True;
     Exit;
   end;
   if Not rxVentaNumeroCotiza.IsNull then
   begin
     GlbUsandoCotiza:=False;
     if MessageDlg('Mantener número cotización?', mtInformation,[mbYes, mbNo], 0)=mrYes then
     begin
       ActualizaCotizacionMaster;
       rxVenta.First;
       While Not rxVenta.Eof Do
       begin
         if (rxVentaStatus.Value = 'C') then
         begin
           //if ibsqlDeleteSerieCotizaDet.Open then
           //ibsqlDeleteSerieCotizaDet.Close;
           ibsqlDeleteSerieCotizaDet.Params[0].Value:=rxVentaSerie.Value;
           ibsqlDeleteSerieCotizaDet.Params[1].Value:=rxVentaNumeroCotiza.Value;
           ibsqlDeleteSerieCotizaDet.ExecQuery;
         end else
        if (rxVentaStatus.Value = 'I') then
        InsertarCotizacionDet(_NumeroCotiza)
        else
        InsertarCotizacionDetUpd(ibstpUpdateCotizaMaster.Params[33].Value,
        rxVentaSerie.Value);
        rxVenta.Next;
      end;
      if Not stpProcUpdteCotDet.Transaction.InTransaction then
      stpProcUpdteCotDet.Transaction.StartTransaction;
      try
        stpProcUpdteCotDet.Transaction.CommitRetaining;
      except
      stpProcUpdteCotDet.Transaction.RollbackRetaining;
      end;

      dmfactura.qryRepCotizaNew.Close;
      dmfactura.qryRepCotizaNew.Params[0].Value:= _NumeroCotiza;
      dmfactura.qryRepCotizaNew.Open;

      //end if new modelo cotiza
      //if rdgFactServicio.Checked or rdgFactVentaProducto.Checked then
      if (UpperCase(GLBFormatoFactura) = 'BYMSERVICIOS') then
      begin
        qckCotiza8_5_F_1ByM:=TqckCotiza8_5_F_1ByM.Create(Nil);
        try
          qckCotiza8_5_F_1ByM.Preview;
        finally
        qckCotiza8_5_F_1ByM.Free;
        qckCotiza8_5_F_1ByM:=Nil;
        end;
      end else
      if rdgFactServicio.Checked then
      begin
        qckCotiza8_5_F_2:=TqckCotiza8_5_F_2.Create(Nil);
        try
          qckCotiza8_5_F_2.Preview;
        finally
        qckCotiza8_5_F_2.Free;
        qckCotiza8_5_F_2:=Nil;
      end;
    end else
    begin
      qckCotiza8_5_F_1:=TqckCotiza8_5_F_1.Create(Nil);
      try
        qckCotiza8_5_F_1.Preview;
      finally
      qckCotiza8_5_F_1.Free;
      qckCotiza8_5_F_1:=Nil;
      end;
    end;
    lblFechaCotizacion.Visible:=False;
    dbFechaCotizacion.Visible:=False;
    Label36.Visible:=False;
    label36.Caption:='';    
    EsModificandoCotiza:=False;
    GlbUsandoCotiza:= False;
    _NumeroCotiza:=-1;
  if InactivaImprecibo then
  GlbImprimeReciboFact := 0;
  InactivaImprecibo:=False;
  label25.Font.Color := clBlack;
  if EsDevolucion then
  begin
    BitBtn7Click(Self);
  end;
  sumarDatos:=True;
  ActualizarPreventa;
  qryProdPorProveedor.Close;
  pnlPrecioProv.Visible:=False;
  EsModificandoFactura:=False;
  InicializaOtrosDesc;
  Application.ProcessMessages;
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
  xCodigoCte:=0;
  ActualizarRecoverData;
  qryProdPorProveedor.Close;
  pnlPrecioProv.Visible:=False;
  _NumeroCotiza := -1;
  EsModificandoCotiza := False;
  Label36.Visible:=False;
  label36.Caption:='';
  lblFechaCotizacion.Visible:=False;
  dbFechaCotizacion.Visible:=False;
  EsModificandoCotiza:=False;
  _NumeroCotiza:=-1;
  Exit;
    end;
  end;

  if (tablaPropietarioCodigoPropietario.IsNull) then
  begin
    MessageDlg('Antes debe indicar el cliente, verifique.', mtInformation, [mbOK], 0);
    Exit;
  end;
  if (rdgFactServicio.Checked and rdgFactVentaProducto.Checked)
  And (rxventa.RecordCount > 0) then
  begin
    MessageDlg('Favor indicar tipo de Operacion', mtInformation, [mbOK], 0);
    rdgFactServicio.SetFocus;
    exit;
  end;
//tj   if Not Entro And GlbPermiteCambioPrecio then
//tj   begin
//tj     BitBtn10Click(Self);
//tj     rxVentaPrecio.Value:= rxqryInvPRECIO.Value;
//tj     DBEdit5Exit(Self);
//tj   end;
        if (xCodigoCte =0) And (tablaPropietarioCodigoPropietario.Value > 0) then
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
  if qryClienteCOD_VENDEDOR.Value > 0 then
  GlbcodVendedor:= qryClienteCOD_VENDEDOR.Value
  else
  GlbcodVendedor:= VarUsuarioGlb;
  if not tablaPropietarioCodigoPropietario.IsNull then
  ipStpInsertCotizaMast.Params[3].Value:= tablaPropietarioCodigoPropietario.Value
  else
  ipStpInsertCotizaMast.Params[3].Value:= 0;//codigo cliente generico mientras tanto
  if (GlbcodVendedor > 0) then
  ipStpInsertCotizaMast.Params[4].Value:= GlbcodVendedor else
  ipStpInsertCotizaMast.Params[4].Value:= VarUsuarioGlb;
  ipStpInsertCotizaMast.Params[5].Value:= 'Cotizacion';
  if not TotalesMoneda.isNull then
  ipStpInsertCotizaMast.Params[6].Value:=  TotalesMoneda.Value
  else
  ipStpInsertCotizaMast.Params[6].Value:=  '1';
  ipStpInsertCotizaMast.Params[7].AsString:= Totalestotalneto.AsString;//EditN1.Text;
  ipStpInsertCotizaMast.Params[8].Value   := 'A';
  ipStpInsertCotizaMast.Params[9].Value   := Now;
  ipStpInsertCotizaMast.Params[10].AsString := Trim(StrUserName);
  ipStpInsertCotizaMast.Params[11].Value    := Null;
  ipStpInsertCotizaMast.Params[12].Value    := Null;
  ipStpInsertCotizaMast.Params[13].Value    := null;
  ipStpInsertCotizaMast.Params[14].Value    := null;
  ipStpInsertCotizaMast.Params[15].Value    := null;
  ipStpInsertCotizaMast.Params[16].Value    := TotalesSubTotal.Value;
  ipStpInsertCotizaMast.Params[17].Value    := TotalesPorcDesAdicional.Value;
  ipStpInsertCotizaMast.Params[18].Value    := TotalesMontoDescAdicional.Value;//Totalesmontodesc.value;
  ipStpInsertCotizaMast.Params[19].Value    := 0;
  if (edtObservacion.Text <> '') then
  ipStpInsertCotizaMast.Params[20].Value    := edtObservacion.Text
  else
  ipStpInsertCotizaMast.Params[20].Value    := '';//TotalesComentario.Value;
  ipStpInsertCotizaMast.Params[21].Value    := 0;
  ipStpInsertCotizaMast.Params[22].Value    := 0;
  ipStpInsertCotizaMast.Params[23].Value    := 0;//montototalitbis
  ipStpInsertCotizaMast.Params[24].Value    := TotalesMontoDescGastosAdmin.Value;
  ipStpInsertCotizaMast.Params[25].Value    := TotalesMontoDescItbisGastosAdmin.Value;
  ipStpInsertCotizaMast.Params[26].Value    := TotalesMontoDescTransp.Value;
  ipStpInsertCotizaMast.Params[27].Value    := TotalesMontoDescDirtecnica.Value;
  ipStpInsertCotizaMast.Params[28].Value    := TotalesMontoDescItbisDirTecnica.Value;
  ipStpInsertCotizaMast.Params[29].Value    := TotalesMontoDescImprevisto.Value;
  ipStpInsertCotizaMast.Params[30].Value    := TotalesMontoDescItbisImprevisto.Value;

  if rdgFactServicio.Checked then
  ipStpInsertCotizaMast.Params[31].Value     := 0 //Tipo_factura
  else ipStpInsertCotizaMast.Params[31].Value:= 1;

  ipStpInsertCotizaMast.Params[32].Value     := null;
  if CheckBox2.Checked then
  ipStpInsertCotizaMast.Params[32].Value     := 1 //aplica_tipodesc
  else
  if CheckBox3.Checked then
  ipStpInsertCotizaMast.Params[32].Value     := 2;
  ipStpInsertCotizaMast.Params[33].Value     := TotalesComentario.Value;
  ipStpInsertCotizaMast.Params[34].Value     := TotalesReferenciaCte.Value;
  ipStpInsertCotizaMast.ExecProc;

  if Not ipStpInsertCotizaMast.Transaction.InTransaction then
  ipStpInsertCotizaMast.Transaction.StartTransaction;
  try
    ipStpInsertCotizaMast.Transaction.CommitRetaining;
  except
  ipStpInsertCotizaMast.Transaction.RollbackRetaining;
  end;

  dmfactura.ibstpInsertarPorcOtrosCargosCotiza.Params[0].Value:= ipStpInsertCotizaMast.Params[0].Value;
  dmfactura.ibstpInsertarPorcOtrosCargosCotiza.Params[1].Value:= TotalesTPorcGAdmin.Value;
  dmfactura.ibstpInsertarPorcOtrosCargosCotiza.Params[2].Value:= TotalesTPorcItbisGAdmin.Value;
  dmfactura.ibstpInsertarPorcOtrosCargosCotiza.Params[3].Value:= TotalesTPorcTrans.Value;
  dmfactura.ibstpInsertarPorcOtrosCargosCotiza.Params[4].Value:= TotalesTPorcDirTec.Value;
  dmfactura.ibstpInsertarPorcOtrosCargosCotiza.Params[5].Value:= TotalesTPorcItbisDirTec.Value;
  dmfactura.ibstpInsertarPorcOtrosCargosCotiza.Params[6].Value:= TotalesTPorcImprevisto.Value;
  dmfactura.ibstpInsertarPorcOtrosCargosCotiza.Params[7].Value:= TotalesTPorcItbisImprevisto.Value;
  dmfactura.ibstpInsertarPorcOtrosCargosCotiza.ExecProc;

  if Not dmfactura.ibstpInsertarPorcOtrosCargosCotiza.Transaction.InTransaction then
  dmfactura.ibstpInsertarPorcOtrosCargosCotiza.Transaction.StartTransaction;
  try
    dmfactura.ibstpInsertarPorcOtrosCargosCotiza.Transaction.CommitRetaining;
  except
  dmfactura.ibstpInsertarPorcOtrosCargosCotiza.Transaction.RollbackRetaining;
  end;

  dmfactura.qryPorcOtrosCargosCotiza.Close;
  dmfactura.qryPorcOtrosCargosCotiza.Params[0].Value := ipStpInsertCotizaMast.Params[0].Value;
  dmfactura.qryPorcOtrosCargosCotiza.Open;

  rxVenta.DisableControls;
  rxVenta.First;
  rxVenta.RecordCount;
  While Not rxVenta.Eof Do
  begin
    if (rxVentaStatus.Value = 'C') then
    begin
      rxVenta.Next;
      continue;
    end;
    InsertarCotizacionDet(ipStpInsertCotizaMast.Params[0].Value);
    rxVenta.Next;
  end;

  rxVenta.First;
  While Not rxVenta.Eof Do
  begin
    rxVenta.Edit;
    rxVentaNumeroRecibo.Value := ipStpInsertCotizaMast.Params[0].Value;
    rxVenta.Post;
    //WriteToLog('Post rxVenta - Line 3221');
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

  //if New Modelo cotiza

  dmfactura.qryRepCotizaNew.Close;
  dmfactura.qryRepCotizaNew.Params[0].Value:=ipStpInsertCotizaMast.Params[0].Value;
  dmfactura.qryRepCotizaNew.Open;

  //end if new modelo cotiza
  //if rdgFactServicio.Checked or rdgFactVentaProducto.Checked then
      if (UpperCase(GLBFormatoFactura) = 'BYMSERVICIOS') then
      begin
        qckCotiza8_5_F_1ByM:=TqckCotiza8_5_F_1ByM.Create(Nil);
        try
          qckCotiza8_5_F_1ByM.Preview;
        finally
        qckCotiza8_5_F_1ByM.Free;
        qckCotiza8_5_F_1ByM:=Nil;
        end;
      end else  
  if rdgFactServicio.Checked then
  begin
    qckCotiza8_5_F_2:=TqckCotiza8_5_F_2.Create(Nil);
    try
     qckCotiza8_5_F_2.Preview;
    finally
    qckCotiza8_5_F_2.Free;
    qckCotiza8_5_F_2:=Nil;
    end;
  end else
  begin
    qckCotiza8_5_F_1:=TqckCotiza8_5_F_1.Create(Nil);
    try
     qckCotiza8_5_F_1.Preview;
    finally
    qckCotiza8_5_F_1.Free;
    qckCotiza8_5_F_1:=Nil;
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
  xCodigoCte:=0;
  ActualizarRecoverData;
  qryProdPorProveedor.Close;
  pnlPrecioProv.Visible:=False;
  _NumeroCotiza := -1;
  EsModificandoCotiza := False;
  Label6.Refresh;
  Refresh;
  Application.ProcessMessages;
end;

procedure TfrmProcVentaRapida.InsertarCotizacionDet(numero: Integer);
begin
  //ibStpInsertCotizaDet.Params[0].Value:= Numero;
  ibStpInsertCotizaDet.Params[1].Value  := Numero;
  ibStpInsertCotizaDet.Params[2].Value  := rxVentaCodArticulo.Value;
  ibStpInsertCotizaDet.Params[3].Value  := Null;
  ibStpInsertCotizaDet.Params[4].Value  := rxVentaDescripcion.Value;
  ibStpInsertCotizaDet.Params[5].Value  := rxVentaDescripcionEspecial.Value;
  ibStpInsertCotizaDet.Params[6].Value  := rxVentaCant.Value;
  ibStpInsertCotizaDet.Params[7].Value  := rxVentaPrecio.Value;
  ibStpInsertCotizaDet.Params[8].Value  := 0;
  ibStpInsertCotizaDet.Params[9].Value  := rxVentaItbi.Value; //Itbis
  ibStpInsertCotizaDet.Params[10].Value  := rxVentaMontoBruto.Value;
  ibStpInsertCotizaDet.Params[11].Value := rxVentaMontoNeto.Value;//rxVentaMontoBruto.Value;
  ibStpInsertCotizaDet.Params[12].Value := 'A';
  ibStpInsertCotizaDet.Params[13].Value := Now;
  ibStpInsertCotizaDet.Params[14].AsString:= Trim(StrUserName);
  ibStpInsertCotizaDet.Params[15].Value   := Null;
  ibStpInsertCotizaDet.Params[16].Value   := Null;
  ibStpInsertCotizaDet.Params[17].Value   := rxVentaTipoUnidad.Value;
  ibStpInsertCotizaDet.Params[18].Value   := rxVentaItbisExento.Value;
  ibStpInsertCotizaDet.Params[19].Value   := rxVentaTipoVenta.Value;
  ibStpInsertCotizaDet.Params[20].Value   := rxVentaPorcDescItem.Value;
  ibStpInsertCotizaDet.Params[21].Value   := rxVentaMontoDescItem.Value;
  ibStpInsertCotizaDet.ExecProc;
end;

procedure TfrmProcVentaRapida.ProcesaCalculos;
var
  porItbi: Real;
begin
  if (rxVentaStatus.Value = 'C') then exit;
  rxVenta.AutoCalcFields:=False;

  if (rxVentaCodArticulo.Value <> qryproductosCODIGO.Value) then
  begin
    if qryproductos.Locate('codigo', rxVentaCodArticulo.Value,[]) then
    begin
      if not qryInventario.Locate('CODIGO', qryProductosCODIGO.Value,[]) then
      begin
        MessageDlg('Verificar codigo producto.',mtError,[mbok],0);
        exit;
      end;
    end else
    begin
      if not qryInventario.Locate('CODIGO', rxVentaCodArticulo.Value,[]) then
      begin
        MessageDlg('Verificar codigo producto.',mtError,[mbok],0);
        exit;
      end;
    end;
  end else
  if not qryInventario.Locate('CODIGO', rxVentaCodArticulo.Value,[]) then
  begin
    MessageDlg('Verificar codigo producto.',mtError,[mbok],0);
    exit;
  end;

  if (qryInventarioPAGA_ITBI.Value = 1) then
  GlbPagaITbis := True
  else
  GlbPagaITbis := False;

  if rxVenta.State In [dsBrowse] Then
  rxVenta.Edit;

  if rxVenta.State In [dsEdit, dsInsert] then
  begin
    if not TotalesMoneda.IsNull then
    rxVentaMoneda.Value:= TotalesMoneda.Value;
    rxVentaMontoBruto.Value:= rxVentaCant.Value * rxVentaPrecio.Value;
    lblTasa.Visible := False;
    if not rxVentaMoneda.IsNull then
    begin
      if (rxVentaMonedaBase.Value <> rxVentaMoneda.Value) then
      if (not rxVentaMonedaBase.IsNull and (rxVentaMonedaBase.Value <> '')) then
      begin
        rxVentaMontoBruto.Value:= rxVentaMontoBruto.Value * GlbMontoTasa(rxVentaMonedaBase.Value);
        lblTasa.Caption:=Concat('1 = ',InsertarComa(FloatToStr(GlbMontoTasa(rxVentaMonedaBase.Value))));
        Totalestotalneto.DisplayFormat:=Concat(SimboloMoneda(TotalesMoneda.Value),',0.00');
        lblTasa.Visible:=True;
      end;
    end;
    if EsDevolucion then
    rxVentaMontoBruto.Value:= rxVentaMontoBruto.Value * -1;

    rxVentaMontoDescItem.Value:= rxVentaMontoBruto.Value * rxVentaPorcDescItem.Value / 100;
    porItbi := FGlbPorcItbi(ExtraerFecha(rxVentaFecha.Value), rxVentaCodArticulo.Value);

    //t if qryInventarioporcitbis.Value > 0 then
    //t porItbi:=qryInventarioporcitbis.Value;

    //if not GlbPagaITbis then
    //porItbi:= 0;

    if chkExento.Checked then
    begin
      porItbi := 0;
      rxVentaItbisExento.Value := 1;
    end else
    begin
      //if rxVenta.state = dsbrowse then
      //rxVenta.edit;
      rxVentaItbisExento.Value:=0;
      //rxVenta.post;
    end;

    if Not EsDevolucion then
    rxVentaPorc_Desc.Value := qryInventarioPORC_DESCUENTO.Value;

    PORC_TRANSP_ITBIS := FGlbPorcItbi(ExtraerFecha(rxVentaFecha.Value), rxVentaCodArticulo.Value)/
                       (1+FGlbPorcItbi(ExtraerFecha(rxVentaFecha.Value), rxVentaCodArticulo.Value)/100);

    //t if qryInventarioporcitbis.Value > 0 then
    //t if (PORC_TRANSP_ITBIS > 0) then
    //tPORC_TRANSP_ITBIS := PORC_TRANSP_ITBIS / //t qryInventarioporcitbis.Value/
                       //(1+qryInventarioporcitbis.Value/100);
    //t                   (1 + PORC_TRANSP_ITBIS / 100);

    //Transparentar el ITBIS
    if (qryInventarioPAGA_ITBI.Value = 1) And
       ((rxVentaPorc_Desc.Value = 0) Or rxVentaPorc_Desc.IsNull ) And
       (GlbTransparentaITBI = 1) And
       (Not chkExento.Checked) Then
    rxVentaPorc_Desc.Value := PORC_TRANSP_ITBIS;
    //End transparentar itbis

    if rxVentaPorc_Desc.Value > 0 then
    rxVentaMontoDescuento.Value := ((rxVentaMontoBruto.Value
    -(rxVentaMontoBruto.Value * rxVentaPorcDescItem.Value/100)) * rxVentaporc_desc.Value/100)
    else rxVentaMontoDescuento.Value := 0;

    //temporal esta linea es para probar devoluciones
    //if EsDevolucion then
    //rxVentaMontoDescuento.Value:= rxVentaMontoDescuento.Value * -1;
    //final - temporal esta linea es para probar devoluciones

    //T if (TotalesPorcDesAdicional.Value > 0) then
    //T TotalesMontoDescAdicional.Value:= (rxVentaMontoBruto.Value * TotalesPorcDesAdicional.Value / 100);

    rxVentaMontoNeto.Value := rxVentaMontoBruto.Value - rxVentaMontoDescuento.Value - TotalesMontoDescAdicional.Value -
    (rxVentaMontoBruto.Value * rxVentaPorcDescItem.Value/100);
    if not GlbPagaITbis then
    porItbi:=0;

    if chkExento.Checked then
    begin
      porItbi := 0;
      rxVentaItbisExento.Value := 1;
      rxVentaitbi.Value:= 0;
    end;

    //OR (EsEditando)

    //t - TotalesMontoDescAdicional.Value;
    if not GlbUsandoCotiza And not GlbPagaITbis then
    rxVentaitbi.Value:=0;
    if (qryInventarioPAGA_ITBI.Value = 1) And (Not chkExento.Checked) and
      (not GlbUsandoCotiza or ( rxVentaStatus.Value = 'I') )  then
      rxVentaitbi.Value:= (rxVentaMontoNeto.Value * porItbi / 100)
    else
    if PrecioCambio then
    rxVentaitbi.Value:= (rxVentaMontoNeto.Value * porItbi / 100);

    //if Not chkExento.Checked then
    //rxVentaitbi.Value:= (rxVentaMontoNeto.Value * porItbi / 100);

    //temporal esta linea es para probar devoluciones
    //if EsDevolucion then
    //rxVentaitbi.Value := rxVentaitbi.Value * -1;
    //temporal esta linea es para probar devoluciones

    rxVentaMontoNeto.Value:=rxVentaMontoNeto.Value + rxVentaitbi.Value;
    rxVenta.Post;
    //WriteToLog('Post rxVenta - Line 3397');
  end;
  if (EsModificandoCotiza) and (Assigned(frmCotizaciones))
  and (frmCotizaciones.ibqryCotizacionMasterPORC_DESCUENTO.Value  > 0) then
  begin
    Totales.edit;
    TotalesPorcDesAdicional.Value :=
    frmCotizaciones.ibqryCotizacionMasterPORC_DESCUENTO.Value;
    Totales.Post;
  end;
  if Totales.State = dsBrowse then
  Totales.edit;
  TotalesMontoDescAdicional.Value:= (TotalesSubTotal.Value * TotalesPorcDesAdicional.Value / 100);
  if (TotalesPorcDesAdicional.Value > 0) then
  begin
    Totales.Edit;
    TotalesMontoDescAdicional.Value:= (TotalesSubTotal.Value * TotalesPorcDesAdicional.Value / 100);
    Totales.Post;
    if rxVenta.State = dsBrowse then
    rxVenta.Edit;
    rxVentaMontoNeto.Value := rxVentaMontoBruto.Value - rxVentaMontoDescuento.Value
                                                  -  TotalesMontoDescAdicional.Value-
    (rxVentaMontoBruto.Value * rxVentaPorcDescItem.Value/100);

    if chkExento.Checked then
    begin
      porItbi := 0;
      rxVentaItbisExento.Value := 1;
    end;

    if not GlbUsandoCotiza then
    rxVentaitbi.Value:=0;
    if (qryInventarioPAGA_ITBI.Value = 1) And (Not chkExento.Checked) and (not GlbUsandoCotiza or ( rxVentaStatus.Value = 'I') ) then
    rxVentaitbi.Value:= (rxVentaMontoNeto.Value * porItbi / 100);
    rxVentaMontoNeto.Value:= rxVentaMontoNeto.Value + rxVentaitbi.Value;
    rxVenta.Post;
    //WriteToLog('Post rxVenta - Line 3414');
  end else
  if EsModificandoCotiza And (Assigned(frmCotizaciones)) then
  begin
    Totales.Edit;
    TotalesComentario.Value:= frmCotizaciones.ibqryCotizacionMasterCOMENTARIO.Value;
    TotalesFechaCotizacion.Value:= frmCotizaciones.ibqryCotizacionMasterFECHA.Value;
    TotalesReferenciaCte.Value:=frmCotizaciones.ibqryCotizacionMasterREFERENCIACTE.Value;
    Totales.Post;
  end;

  rxVenta.AutoCalcFields := False;
end;

procedure TfrmProcVentaRapida.BitBtn9Click(Sender: TObject);
begin
  if (rdgFactServicio.Checked And rdgFactVentaProducto.Checked)
  And (rxventa.RecordCount > 0) Then
  begin
    MessageDlg('Favor indicar tipo de Operacion', mtInformation, [mbOK], 0);
    rdgFactServicio.SetFocus;
    Exit;
  end;
  if (Totalesmontorecibido.Value > 0) and (rxVenta.RecordCount > 0) then
  begin
    MessageDlg('Favor procesar o cancelar venta en progreso', mtInformation, [mbOK], 0);
    Exit;
  end;
  if (totales.RecordCount > 0) then
  begin
    totales.Close;
    totales.Open;
    Edit1.Text:='';
    Totales.Close;
    Totales.Open;
    Totales.Insert;
    TotalesMoneda.Value := IntToStr(GlbMonedaBase);
    TotalesSubTotal.Value:=0;
    TotalesMontoDescItems.Value:=0;
    Totalesitbis.Value   :=0;
    Totalesmontodesc.Value:=0;
    Totalestotalneto.Value:=0;
    Totalesmontorecibido.Value:=0;
    Totalesdevolucion.Value   :=0;
    Totales.Post;
    lblProcDev.Visible := False;
  end;
  frmCotizaciones:=TfrmCotizaciones.Create(Nil);
  try
    frmCotizaciones.BitBtn4Click(Self);
    if frmCotizaciones.Showmodal = mrOk then
    begin
      GlbUsandoCotiza:= True;
      rxVenta.Close;
      rxVenta.Open;
      Totales.Edit;
      TotalesComentario.Value := frmCotizaciones.ibqryCotizacionMasterCOMENTARIO.Value;
      Totales.Post;
      if frmCotizaciones.ibqryCotizacionMasterTIPO_FACTURA.Value = 0 then
      rdgFactServicio.Checked:=True
      else
      rdgFactServicio.Checked:=false;

      if frmCotizaciones.ibqryCotizacionMasterAPLICA_TIPODESC.Value = 1 then
      begin
        CheckBox2.Checked:= True;
        CheckBox3.Checked:= False;
      end else
      if frmCotizaciones.ibqryCotizacionMasterAPLICA_TIPODESC.Value = 2 then
      begin
        CheckBox2.Checked:= False;
        CheckBox3.Checked:= True;
      end;
      //rdgFactServicio.Checked:=false;
      EsModificandoCotiza:=True;
      lblFechaCotizacion.Visible:= True;
      dbFechaCotizacion.Visible := True;
      Label36.Visible:=True;
      Label36.Caption:='Modificando Cotización: ' + frmCotizaciones.ibqryCotizacionMasterNUMERO.AsString;

      edtObservacion.Text := frmCotizaciones.ibqryCotizacionMasterNOMBRE_CLIENTE_GENERAL.Value;

      frmCotizaciones.ibqryCotizacionDet.First;
      While Not frmCotizaciones.ibqryCotizacionDet.Eof Do
      begin
        if (frmCotizaciones.ibqryCotizacionDetCANTIDAD.Value > 0)
        And (frmCotizaciones.ibqryCotizacionDetSTATUS_DET.Value = 'A') then
        begin
          rxVenta.Append;
          rxVentaglbcodVendedor.Value := qryClienteCOD_VENDEDOR.Value;
          rxVentaItbi.Value:=0;
          //if EsModificandoCotiza then
          //begin
            rxVentaNumeroCotiza.Value:=_NumeroCotiza;
            rxVentaStatus.Value:= 'A';
          //end;
          //if EsModificandoFactura then
          //rxVentaStatus.Value:='I';

          RxSpeedButton1.Visible:=True;
          ProcCargaDatosCotizacion;
          if rxVenta.state in [dsInsert,dsedit] then
          rxVenta.Post;
          //WriteToLog('Post rxVenta - Line 3512');
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
  CheckBox2Exit(Self);
  CheckBox3Exit(Self);
  Refresh;
  Application.ProcessMessages;
end;

procedure TfrmProcVentaRapida.ProcCargaDatosCotizacion;
begin
  _NumeroCotiza := frmCotizaciones.ibqryCotizacionDetNUMERO.Value;
  EsModificandoCotiza := True;
  rxVentaSerie.Value  := frmCotizaciones.ibqryCotizacionDetSERIE.Value;
  rxVentaNumeroCotiza.Value := frmCotizaciones.ibqryCotizacionDetNUMERO.Value;
  rxVentaFecha.Value := ExtraerFecha(frmCotizaciones.ibqryCotizacionMasterFECHA.Value);
  rxVentaCant.Value  := frmCotizaciones.ibqryCotizacionDetCANTIDAD.Value;
  rxVentaPrecio.Value:= frmCotizaciones.ibqryCotizacionDetPRECIO.Value;
  rxVentaPorcDescItem.Value:=frmCotizaciones.ibqryCotizacionDetPORC_DESC_ITEM.Value;
  rxVentaItbi.Value  := frmCotizaciones.ibqryCotizacionDetITBI_DET.Value;
  rxVentaporc_desc.Value   := frmCotizaciones.ibqryCotizacionDetPORC_DESC_DET.Value;
  rxVentaDescripcion.Value := frmCotizaciones.ibqryCotizacionDetDESCRIPCION.Value;
  rxVentaDescripcionEspecial.Value := frmCotizaciones.ibqryCotizacionDetDescripcionEspecial.Value;
  rxVentaTipoVenta.Value := frmCotizaciones.ibqryCotizacionDetTIPO_VENTA.Value;
  rxVentaTipoUnidad.Value:= frmCotizaciones.ibqryCotizacionDetTIPO_UNIDAD.Value;

  if qryProductos.Locate('CODIGO', frmCotizaciones.ibqryCotizacionDetCODIGO_PROD.Value,[]) then
  begin
    rxVentaCodTexto.Value:= qryProductosCODIGO_TEXTO.Value;
    if not qryProductosDESCRIPCIONADICIONAL.IsNull then
    rxVentaDescripcionEspecial.Value :=
    rxVentaDescripcionEspecial.Value +' '+
    qryProductosDESCRIPCIONADICIONAL.Value;
    rxVentaCostoProducto.Value := qryProductosPRECIO_COMPRA.Value;
  end;

  rxVentaItbisExento.Value:=qryProductosPAGA_ITBI.Value;

  rxVentaReferencia.Value := qryProductosREFERENCIA.Value;
  rxVentaInvetariar.Value:= qryProductosINVENTARIAR.Value;
  rxVentaMonedaBase.Value := qryProductosCOD_MONEDA.Value;
  rxVentaCodArticulo.Value:= frmCotizaciones.ibqryCotizacionDetCODIGO_PROD.AsInteger;
  rxVentaRutaImagen.Value := BuscarRutaImagen(frmCotizaciones.ibqryCotizacionDetCODIGO_PROD.AsInteger);
  if (GlbcodVendedor > 0) then
  rxVentaCodUsuario.Value := GlbcodVendedor
  else
  rxVentaCodUsuario.Value := VarUsuarioGlb;
  ProcesaCalculos;
end;

procedure TfrmProcVentaRapida.ProcesaFacturar(tipo : smallint; numdoc:Integer; codcte:Integer);
begin
  dmCxc.tblTransCxc.Close;
  dmCxc.tblTransCxc.Params[0].Value := ExtraerFecha(glbfechatrndiaria);
  dmCxc.tblTransCxc.Params[1].Value := ExtraerFecha(glbfechatrndiaria);
  dmCxc.tblTransCxc.Params[2].Value := glbCia_Key;
  dmCxc.tblTransCxc.Open;
  dmCxc.qryBalanceCtes.Close;
  dmCxc.qryBalanceCtes.Open;
  dmfactura.IBDataSetFacturas.Close;
  dmfactura.IBDataSetFacturas.Open;

  dmfactura.IBDataSetFacturas.Insert;
  dmfactura.IBDataSetFacturasNUMERO.Value  := numdoc;
  dmfactura.IBDataSetFacturasNUMERO_TRN_VTA.Value  := ipStpInsertVentMast.Params[0].Value;
  dmfactura.IBDataSetFacturasCIA_KEY.Value := glbCia_Key;
  if not TotalesMoneda.IsNull then
  dmfactura.IBDataSetFacturasMONEDA.Value := TotalesMoneda.Value
  else
  dmfactura.IBDataSetFacturasMONEDA.Value  := '1';

  dmfactura.IBDataSetFacturasTIPO.Value   := 2;
  dmfactura.IBDataSetFacturasCODIGO_CTE.Value := codcte;
  dmfactura.IBDataSetFacturasFECHA.Value      := ExtraerFecha(GlbFechatrndiaria);
  dmfactura.IBDataSetFacturasDESCRIPCION.Value:= 'Venta';
  dmfactura.IBDataSetFacturasMONTO_FACT.Value := TotalestotalNeto.Value;
  dmfactura.IBDataSetFacturasRCXC.Value       := 'R';
  dmfactura.IBDataSetFacturasSTATUS.Value     := 'P';
  dmfactura.IBDataSetFacturasFECHA_IN.Value   := Now;
  dmfactura.IBDataSetFacturasFECHA_VENCE.Value:= TotalesFechaVence.Value;
  //dmfactura.IBDataSetFacturasComentario.Value:=
  if rdgFactServicio.Checked then
  dmfactura.IBDataSetFacturasTIPO_FACTURA.Value:=0 //factura servicio
  else
  dmfactura.IBDataSetFacturasTIPO_FACTURA.Value:=1;//otros

  if CheckBox2.Checked then
  dmfactura.IBDataSetFacturasAPLICA_TIPODESC.Value:=1
  else
  if CheckBox3.Checked then
  dmfactura.IBDataSetFacturasAPLICA_TIPODESC.Value:=2;

  dmfactura.IBDataSetFacturas.Post;
  dmfactura.IBDataSetFacturas.ApplyUpdates;
  if Not dmfactura.IBDataSetFacturas.Transaction.InTransaction then
  dmfactura.IBDataSetFacturas.Transaction.StartTransaction;
  try
    dmfactura.IBDataSetFacturas.Transaction.CommitRetaining;
  except
  dmfactura.IBDataSetFacturas.Transaction.RollbackRetaining;
  end;

  dmfactura.stpInsertPorcOtrosCargosFServ.Params[0].Value := ipStpInsertVentMast.Params[0].Value;
  dmfactura.stpInsertPorcOtrosCargosFServ.Params[1].Value := TotalesTPorcGAdmin.Value;
  dmfactura.stpInsertPorcOtrosCargosFServ.Params[2].Value := TotalesTPorcItbisGAdmin.Value;
  dmfactura.stpInsertPorcOtrosCargosFServ.Params[3].Value := TotalesTPorcTrans.Value;
  dmfactura.stpInsertPorcOtrosCargosFServ.Params[4].Value := TotalesTPorcDirTec.Value;
  dmfactura.stpInsertPorcOtrosCargosFServ.Params[5].Value := TotalesTPorcItbisDirTec.Value;
  dmfactura.stpInsertPorcOtrosCargosFServ.Params[6].Value := TotalesTPorcImprevisto.Value;
  dmfactura.stpInsertPorcOtrosCargosFServ.Params[7].Value := TotalesTPorcItbisImprevisto.Value;
  if (dmfactura.stpInsertPorcOtrosCargosFServ.Params[0].Value > 0) then
  //dmfactura.stpInsertPorcOtrosCargosFServ.Params[7].Value := TotalesPorcItbisImprevisto.Value;
  dmfactura.stpInsertPorcOtrosCargosFServ.ExecProc;

  //Inserta factura en tabla factura_pendiente y pone status factura igual a F donde
  //status igual a P
  dmfactura.stpProcInsFactPendiente.Params[0].Value:= ExtraerFecha(GlbFechatrndiaria);
  dmfactura.stpProcInsFactPendiente.Params[1].Value:= ExtraerFecha(GlbFechatrndiaria);
  if not TotalesMoneda.IsNull then
  begin
  dmfactura.stpProcInsFactPendiente.Params[2].Value:= TotalesMoneda.Value;
  dmfactura.stpProcInsFactPendiente.Params[3].Value:= TotalesMoneda.Value;
  end else
  begin
    dmfactura.stpProcInsFactPendiente.Params[2].Value:= '1';
    dmfactura.stpProcInsFactPendiente.Params[3].Value:= '1';
  end;
  dmfactura.stpProcInsFactPendiente.ExecProc;

  rxVenta.First;
  //While Not rxVenta.Eof Do
  //begin
  if (Totalestotalneto.Value > 0 ) then
  begin
    dmCxc.tblTransCxc.Insert;
    dmCxc.tblTransCxcCIA_KEY.Value:=GlbCodigoCia;

    dmCxc.tblTransCxcSTATUS.Value := 'A';
    //dmCxc.tblTransCxcconcepto.Value     := 'Pago cuota';
    if (tipo = 1) then
    begin
      dmCxc.tblTransCxcTIPO_DOC.Value := 1; //Factura
      dmCxc.tblTransCxcconcepto.Value := 'Venta';
    end else dmCxc.tblTransCxcTIPO_DOC.Value := 2; //Recibo
    if not TotalesMoneda.IsNull then
    dmCxc.tblTransCxcmoneda.Value  := TotalesMoneda.Value
    else
    dmCxc.tblTransCxcmoneda.Value  := '1';
    dmCxc.tblTransCxcfecha.Value   := ExtraerFecha(GlbFechatrndiaria);

    dmCxc.tblTransCxccodigo_cliente.Value := TotalesCodCliente.Value;
    dmCxc.tblTransCxccodigo_serv.Value    := 0;
    dmCxc.tblTransCxcNUMERO_DOC.Value     := Numdoc;

    dmCxc.tblTransCxcvalor_documento.Value:= TotalestotalNeto.Value;
    dmCxc.tblTransCxctipo_tranf.Value     := 1;//Debito
    dmCxc.tblTransCxctipo_serv.Value      := 2;//General
    dmCxc.tblTransCxcfecha_in.Value       := Now;
    dmCxc.tblTransCxcIN_POR.Value := StrUserName;
    dmCxc.tblTransCxc.Post;
    dmCxc.tblTransCxc.ApplyUpdates;
    if Not dmCxc.tblTransCxc.Transaction.InTransaction then
    dmCxc.tblTransCxc.Transaction.StartTransaction;
    try
      dmCxc.tblTransCxc.Transaction.CommitRetaining;
    except
    dmCxc.tblTransCxc.Transaction.RollbackRetaining;
    end;
    ActBalaceCteP(tipo);
    end;
  //end;
end;

procedure TfrmProcVentaRapida.ActBalaceCteP(operacion:smallint);
var
  Monto:Real;
begin
  if (Operacion=2) then
  Monto:=dmcxc.tblTransCxcVALOR_DOCUMENTO.Value*-1
  else Monto:=dmcxc.tblTransCxcVALOR_DOCUMENTO.Value;
  if dmcxc.QrybalanceCtes.Locate('CODIGO;SERVICIO;MONEDA',
     VarArrayOf([dmCxc.tblTransCxccodigo_cliente.Value,
                 dmcxc.tblTransCxcCODIGO_SERV.Value,dmCxc.tblTransCxcMONEDA.Value]),[]) then
  begin
    EditarBalanceP(Monto,Operacion);
  end else
  begin
    InsertaBalanceP(Monto);
  end;
  if dmcxc.qryBalanceCtes.State in [dsEdit, dsInsert] then
  begin
    dmcxc.qryBalanceCtes.Post;
    dmcxc.qryBalanceCtes.ApplyUpdates;
  end;
  dmCxc.tblTranscxc.Edit;
  dmCxc.tblTransCxcSTATUS.Value:= 'R';
  dmCxc.tblTranscxc.Post;
  dmCxc.tblTranscxc.ApplyUpdates;
  if Not dmCxc.tblTranscxc.Transaction.InTransaction then
  dmCxc.tblTranscxc.Transaction.StartTransaction;
  try
    dmCxc.tblTranscxc.Transaction.CommitRetaining;
  except
  dmCxc.tblTranscxc.Transaction.RollbackRetaining;
  end;
  if Not dmcxc.qryBalanceCtes.Transaction.InTransaction then
  dmcxc.qryBalanceCtes.Transaction.StartTransaction;
  try
    dmcxc.qryBalanceCtes.Transaction.CommitRetaining;
  except
  dmcxc.qryBalanceCtes.Transaction.RollbackRetaining;
  end;
end;

procedure TfrmProcVentaRapida.EditarBalanceP(monto:Real);
begin
  dmcxc.qryBalanceCtes.Edit;
  dmcxc.qryBalanceCtesFECHA_BCE.Value:= dmcxc.tblTransCxcFECHA.Value;
  dmcxc.qryBalanceCtesBALANCE_ANT.Value:=dmcxc.qryBalanceCtesBALANCE_ACT.Value;
  dmcxc.qryBalanceCtesBALANCE_ACT.Value:=//+
  dmcxc.qryBalanceCtesBALANCE_ACT.Value + Monto;//dmCxc.tblTransCxcVALOR_DOCUMENTO.Value;
  dmcxc.qryBalanceCtesDEBITO_MES.Value:=//+
  dmcxc.qryBalanceCtesDEBITO_MES.Value + Monto;//dmCxc.tblTransCxcvalor_documento.Value;
  dmcxc.qryBalanceCtesDEBITO_ACM.Value:=//+
  dmcxc.qryBalanceCtesDEBITO_ACM.Value + Monto;//dmCxc.tblTransCxcvalor_documento.Value;
end;

procedure TfrmProcVentaRapida.EditarBalanceP(monto:Real;tipo:Integer);
begin
  dmcxc.qryBalanceCtes.Edit;
  dmcxc.qryBalanceCtesFECHA_BCE.Value:= glbFechaTrnDiaria;
  dmcxc.qryBalanceCtesBALANCE_ANT.Value:=dmcxc.qryBalanceCtesBALANCE_ACT.Value;
  if tipo = 1 then
  begin
  dmcxc.qryBalanceCtesBALANCE_ACT.Value:=//+
  dmcxc.qryBalanceCtesBALANCE_ACT.Value + Monto;//dmCxc.tblTransCxcVALOR_DOCUMENTO.Value;
  dmcxc.qryBalanceCtesDEBITO_MES.Value:=//+
  dmcxc.qryBalanceCtesDEBITO_MES.Value + Monto;//dmCxc.tblTransCxcvalor_documento.Value;
  dmcxc.qryBalanceCtesDEBITO_ACM.Value:=//+
  dmcxc.qryBalanceCtesDEBITO_ACM.Value + Monto;//dmCxc.tblTransCxcvalor_documento.Value;
  end else
  begin
  dmcxc.qryBalanceCtesBALANCE_ACT.Value:=//+
  dmcxc.qryBalanceCtesBALANCE_ACT.Value - Monto;//dmCxc.tblTransCxcVALOR_DOCUMENTO.Value;
  dmcxc.qryBalanceCtesCREDITO_MES.Value:=//+
  dmcxc.qryBalanceCtesCREDITO_MES.Value - Monto;//dmCxc.tblTransCxcvalor_documento.Value;
  dmcxc.qryBalanceCtesCREDITO_ACM.Value:=//+
  dmcxc.qryBalanceCtesCREDITO_ACM.Value - Monto;//dmCxc.tblTransCxcvalor_documento.Value;
  end;
  dmcxc.qryBalanceCtesFECHA_MOD.Value:=Now;
  dmcxc.qryBalanceCtesFECHA_ULT_PAGO.Value:=ExtraerFecha(Now);
end;


procedure TfrmProcVentaRapida.InsertaBalanceP(monto:Real);
begin
  dmcxc.qryBalanceCtes.Insert;
  dmcxc.qryBalanceCtesCODIGO.Value    := TotalesCodCliente.Value;//dmCxc.qryProcServcodigo_cliente.Value;
  dmcxc.qryBalanceCtesSERVICIO.Value  := 0; //dmCxc.qryProcServcodigo_serv.Value;
  if TotalesMoneda.isNull then
  dmcxc.qryBalanceCtesMONEDA.Value    := '1' // dmCxc.qryProcServmoneda.Value;
  else
  dmcxc.qryBalanceCtesMONEDA.Value :=TotalesMoneda.Value;

  dmcxc.qryBalanceCtesBALANCE_ACT.Value := 0;
  dmcxc.qryBalanceCtesDEBITO_MES.Value  := 0;
  dmcxc.qryBalanceCtesDEBITO_ACM.Value  := 0;
  dmcxc.qryBalanceCtesCREDITO_MES.Value := 0;
  dmcxc.qryBalanceCtesCREDITO_ACM.Value := 0;
  dmcxc.qryBalanceCtesBALANCE_ANT.Value := 0;

  if dmcxc.qryBalanceCtesMONEDA.IsNull then
  dmcxc.qryBalanceCtesMONEDA.Value:='1';
  //chequear moneda
  dmcxc.qryBalanceCtesSTATUS_BCE.Value:= 'A';
  dmcxc.qryBalanceCtesFECHA_BCE.Value := ExtraerFecha(Now);//dmCxc.qryProcServfecha.Value;
  dmcxc.qryBalanceCtesFECHA_IN.Value  :=Now;
  dmcxc.qryBalanceCtesIN_POR.Value    :=StrUserName;
  if (dmCxc.tblTransCxcTIPO_DOC.Value = 1) or (dmCxc.tblTransCxcTIPO_DOC.Value = 3) then
  begin
   dmcxc.qryBalanceCtesBALANCE_ACT.Value:= Monto;
   dmcxc.qryBalanceCtesDEBITO_MES.Value := Monto;
   dmcxc.qryBalanceCtesDEBITO_ACM.Value := Monto;
  end else
  if (dmCxc.tblTransCxcTIPO_DOC.Value = 2) Or (dmCxc.tblTransCxcTIPO_DOC.Value = 4) or
  (dmCxc.tblTransCxcTIPO_DOC.Value = 5) then
  begin
    if (dmCxc.tblTransCxcTIPO_DOC.Value = 4) And ((dmCxc.tblTransCxcTIPO_DOC.Value = 1) ) then
    begin
      dmcxc.qryBalanceCtesBALANCE_ACT.Value:= Monto;
      dmcxc.qryBalanceCtesDEBITO_MES.Value := Monto;
      dmcxc.qryBalanceCtesDEBITO_ACM.Value := Monto;
    end else
    begin
      dmcxc.qryBalanceCtesBALANCE_ACT.Value:=//-
      dmcxc.qryBalanceCtesBALANCE_ACT.Value - monto;//dmCxc.qryProcServVALOR_DOCUMENTO.Value;
      dmcxc.qryBalanceCtesCREDITO_MES.Value:= monto;//dmCxc.qryProcServVALOR_DOCUMENTO.Value;
      dmcxc.qryBalanceCtesCREDITO_ACM.Value:= monto;//dmCxc.qryProcServVALOR_DOCUMENTO.Value;
      dmcxc.qryBalanceCtesFECHA_ULT_PAGO.Value:= now;       //dmCxc.qryProcServfecha.Value;
    end;
  end;
end;

procedure TfrmProcVentaRapida.ProcVentaConNCF(tiponcf:String;var ValorNCF:String;var seriedoc:Integer; var serie_asignadoncf : Integer);
begin
  //Generar y Asignar Numero de Comprobante Fiscal
  valorNCF:='';
  serieDoc:= -1;//indica que no se generó el NCF

  if CheckBox1.Checked then
  begin
    frmAsignarNCFVenta:=tfrmAsignarNCFVenta.Create(nil);
    try
      frmAsignarNCFVenta.IBDataSet1.Close;
      frmAsignarNCFVenta.IBDataSet1.Open;
      frmAsignarNCFVenta.IBDataSet1.Insert;
      frmAsignarNCFVenta.IBDataSet1FECHA_INSERT.Value := Now;
      frmAsignarNCFVenta.IBDataSet1FECHA.Value := ExtraerFEcha(GlbFechaTrnDiaria);
      if (GlbcodVendedor > 0) then
      frmAsignarNCFVenta.IBDataSet1CODIGO_USUARIO.Value := GlbcodVendedor
      else
      frmAsignarNCFVenta.IBDataSet1CODIGO_USUARIO.Value := VarUsuarioGlb;

      frmAsignarNCFVenta.IBDataSet1STATUS.Value := 'A';

      frmAsignarNCFVenta.IBDataSet1TIPO_NCF.Value := tipoNCF;
      frmAsignarNCFVenta.BitBtn13Click(Self);

      frmAsignarNCFVenta.Asginarncf := frmAsignarNCFVenta.ncfGenerado;
      GlbDescNCF := frmAsignarNCFVenta.descNCF;
      frmAsignarNCFVenta.IBDataSet1NUMERO_NCF.Value := frmAsignarNCFVenta.ncfGenerado;//rxVentaNCF.Value;
      frmAsignarNCFVenta.IBDataSet1MONTO.Value      := Totalestotalneto.Value; //StrToFloat(EditN1.Text);

      frmAsignarNCFVenta.BitBtn4Click(Self); //Guardar

      if (frmAsignarNCFVenta.ncfGenerado = '') then
      begin
        if MessageDlg('NCF no fue generado, desea continuar?',mtWarning, [mbyes,mbno], 0) = mrNO then
        Exit;
      end;

      serie_asignadoncf := frmAsignarNCFVenta.IBDataSet1SERIE.Value;
      //Select Gen_id(gen_num_factura,1) From rdb$database
      serieDoc:= FsqlMaxNumeroFactura('gen_num_factura');

      if (serieDoc = 0) then
      serieDoc:=1;

      valorNCF:= frmAsignarNCFVenta.ncfGenerado;

      if Totales.State = dsBrowse then
      Totales.Edit;

      if Totales.State In [dsInsert, dsEdit] then
      begin
        Totales.Edit;
        Totalesncf_numero.Value := valorNCF;
        TotalesqrLabelNcfDesc.Value:=GlbDescNCF;
        Totales.Post;
      end;
    finally
    frmAsignarNCFVenta.free;
    frmAsignarNCFVenta:=nil;
    end;
  end;//Fin if CheckBox1.Checked then
end;

procedure TfrmProcVentaRapida.MaestroCliente1Click(Sender: TObject);
begin
  frmClientes:=TfrmClientes.Create(Self);
  try
    frmClientes.Showmodal;
  finally
  frmClientes.Free;
  frmClientes:=Nil;
  end;
  qryCliente.Close;
  qryCliente.Open;
end;

procedure TfrmProcVentaRapida.RxDBGrid2DblClick(Sender: TObject);
begin
  //edtCodigo.Text:= frmProcVentaRapida.rxqryInvCodigo_texto.Value;
  edtCodigo.Text := qryProductosCodigo_texto.Value;
  panel2.Visible := False;
  Prod_existe    := True;
  BuscandoPorDesc:=false;
  //t DBEdit1.SetFocus;
  if Assigned(frmProcVentaRapida) Then
  cboxTipoUnidad.SetFocus;
  edtCodigoExit(Self);
end;

procedure TfrmProcVentaRapida.DBEdit1Enter(Sender: TObject);
begin
  Refresh;
  yNumSerie:= rxVentaSerie.Value;
  if not rxVentaCant.IsNull then
  auxiCant:= rxVentaCant.Value
  else
  auxiCant:= -1;
  if Not Prod_existe and ((rxVenta.State in [dsEdit, dsInsert]) or (rxVenta.RecordCount > 0)) then
  begin
    if qryProductos.Locate('codigo_Texto', rxVentaCodTexto.Value,[]) then
    begin
      Prod_existe:=True;
    end else
    begin
      MessageDlg('codigo producto no encontrado, verifique', mtInformation, [mbOK], 0);
      edtCodigo.SetFocus;
      Exit;
    end;
  end;
  //ProcesaCalculos;
  Panel2.Visible:=False;
end;

procedure TfrmProcVentaRapida.BitBtn10Click(Sender: TObject);
begin
  if (rxVenta.RecordCount >  0) then
  begin
    Totales.Edit;
    rxVenta.Edit;
    DBEdit5.SetFocus;
  end;
end;

procedure TfrmProcVentaRapida.DBEdit5Exit(Sender: TObject);
begin
  if Totales.State in [dsedit, dsinsert] then
  begin
    EsEditando := True;
    ProcesaCalculos;
    if Totales.State in [dsedit, dsinsert] then
    Totales.Post;
  end;

end;

procedure TfrmProcVentaRapida.BitBtn11Click(Sender: TObject);
var
  frecuencia:string;
  serieDoc:Integer;
  muestraVentana:boolean;
begin
  //BitBtn6Click(Self);//Facturar;
  //if xSalir then Exit;
  if rxVenta.RecordCount = 0 then Exit;
  xSalir:=False;
  EsFinanciamiento := True;
  muestraVentana:=True;
  xCodigoCte:=-1;
  if Not tablaPropietarioCodigoPropietario.IsNull then
  begin
    xCodigoCte := tablaPropietarioCodigoPropietario.Value;
    muestraVentana:=false;
  end;

  if Not Assigned(FrmBuscarClientesPersonas) Then
  FrmBuscarClientesPersonas:=TFrmBuscarClientesPersonas.Create(Nil);
  try
    TipoVenta:='CREDITO';
    if  muestraVentana then
    begin
      if FrmBuscarClientesPersonas.Showmodal = mrOk then
      begin
        xCodigoCte := FrmBuscarClientesPersonas.CodigoCliente;
      end else
      begin
        xSalir:=True;
      {FrmBuscarClientesPersonas.Free;
      FrmBuscarClientesPersonas := Nil;}
      end;
    end;

    //if FrmBuscarClientesPersonas.Showmodal = mrOk then
    //begin
    //  xCodigoCte := FrmBuscarClientesPersonas.CodigoCliente;
    if Not xSalir then
    begin
      if xCodigoCte > 0 then
      begin
        if Totales.State = dsbrowse then Totales.Edit;
        TotalesCodCliente.Value:= xCodigoCte;
        FrmBuscarClientesPersonas.qryClienteStd.Close;
        FrmBuscarClientesPersonas.qryClienteStd.Open;
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
        //frmFinanciamiento.xNumeroTrn := SerieDoc;
        frmFinanciamiento.rxDatosFinanc.Insert;
        frmFinanciamiento.rxDatosFinancMontoAFinanciar.Value:= Totalestotalneto.Value;
        frmFinanciamiento.rxDatosFinancMontoInicial.Value:=0;
        //frmFinanciamiento.rxDatosFinancMontoInicial.Value:= Totalestotalneto.Value
        //- Totalesmontorecibido.Value;// - TotalesMontoInteres.Value;

        frmFinanciamiento.ShowModal;
        if frmFinanciamiento.rxDatosFinanc.RecordCount > 0 then
        begin
          Totales.Edit;
          if GlbMuestraInteresFactFinac = 1 then
          TotalesMontoInteres.Value := 0
          else
          begin
            TotalesMontoInteres.Value :=
            frmFinanciamiento.rxDatosFinancMontoInteres.Value *
            frmFinanciamiento.rxDatosFinanccantCuotas.Value;
          end;
          Totalesmontorecibido.Value := frmFinanciamiento.rxDatosFinancMontoInicial.Value;
          TotalestotalNeto.Value     := frmFinanciamiento.rxDatosFinancMontoFinanciado.Value;
          Totales.Post;
        end;
    end else
    begin
      MessageDlg('Financiamiento cancelado.',mtInformation, [mbok], 0);
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

function TfrmProcVentaRapida.FncFrecuencia(Frec: Integer): String;
begin
  case Frec of
  30 : result:='Mes(es)';
  15 : result:='Quincena(s)';
  07 : result:='Semana(s)';
  01 : result:='Dia(s)';
  else Result:= 'tiempo ind';
  end;
end;

procedure TfrmProcVentaRapida.BitBtn12Click(Sender: TObject);
var
 serieDoc:Integer;
 frecuencia:string;
 ValorNCF : String;
 serie_asignadoncf : Integer;
 xgenNcf : Boolean;
begin
  if rxVenta.recordcount = 0 then exit; //out of here
  if (rdgFactServicio.Checked and rdgFactVentaProducto.Checked)
  And (rxventa.RecordCount > 0) then
  begin
    MessageDlg('Favor indicar tipo de Operacion', mtInformation, [mbOK], 0);
    rdgFactServicio.SetFocus;
    exit;
  end;
  BitBtn11.Enabled:=True;
  frmSelNCF:=TfrmSelNCF.Create(Nil);
  try //aqui prepara para que trabaja sin ncf
    if (frmSelNCF.ShowModal = mrOK) then
    xgenNcf:=True
    else xgenNcf:= false;
  finally
  frmSelNCF.Free;
  frmSelNCF:= Nil;
  end;

  if xGenNCf then
  begin
    ProcVentaConNCF(dmFactura.ibQryViewNCFTIPO_CF.Value, ValorNCF, serieDoc, serie_asignadoncf);
  end else
  begin
    serieDoc:= FsqlMaxNumeroFactura('gen_num_factura');//FsqlMaxNumero('facturas','numero');

    if (serieDoc = 0) then
    serieDoc:=1;
  end;
    ProcVenta(valorNCF, Serie_Asignadoncf,serieDoc);//Aqui voy

    if Totales.State = dsbrowse then Totales.Edit;
    TotalesCodCliente.Value:= xCodigoCte;

    qryCliente.Locate('CODIGO_CTE',xCodigoCte,[]);
    TotalesNombreCliente.Value := qryClienteNOMBRE_CTE.Value;
    TotalesDireccion.Value     := qryClienteDIRECCION_CONT.Value;
    TotalesTelefono.Value      := qryClienteTELEF_CONTACTO.Value;
    TotalesCodCliente.Value    := qryClienteCODIGO_CTE.Value;
    TotalesRNC_NUMERO.Value    := qryClienteRNC_NUMERO.Value;
    if (Not qryClienteCANT_DIAS_CREDITO.IsNull) And (qryClienteCANT_DIAS_CREDITO.Value > 0) Then
    TotalesFechaVence.Value    := GlbFechaTrnDiaria + qryClienteCANT_DIAS_CREDITO.Value
    else
    TotalesFechaVence.Value    := GlbFechaTrnDiaria + 15;//Default
    Totales.Post;


    ProcesaFacturar(1, serieDoc, xCodigoCte);//xcodigocte);
    rxVenta.First;
    While Not rxVenta.Eof Do
    begin
      rxVenta.Edit;
      rxVentaNumeroFactura.Value:= serieDoc;
      rxVenta.Post;
      //WriteToLog('Post rxVenta - Line 4158');
      rxVenta.Next;
    end;
    if frmFinanciamiento.rxDatosFinanc.State = dsBrowse then
      frmFinanciamiento.rxDatosFinanc.Edit;
      frmFinanciamiento.rxDatosFinancNumeroFactura.Value:=serieDoc;
      //Aqui voy
      frmFinanciamiento.xNumeroTrn := rxVentaNumeroRecibo.Value;//aqui numero ventas master
      frmFinanciamiento.rxDatosFinanc.Post;
      frmFinanciamiento.ProcInsertarDatos;
      qckRepFacturaEstandarNew := TqckRepFacturaEstandarNew.Create(Nil);
      try
        if GlbSizeFact8x11 = 1 then
        qckRepFacturaEstandarNew.Page.Length := 11;

        frecuencia := FncFrecuencia(frmFinanciamiento.tblFrecPagoFRECUENCIA_DIAS.Value);

        qckRepFacturaEstandarNew.xtipoVenta := 'Financiamiento a ' + frmFinanciamiento.rxDatosFinanccantCuotas.AsString+ ' '+ frecuencia;
        qckRepFacturaEstandarNew.valorNCF   := Totalesncf_numero.Value;
        qckRepFacturaEstandarNew.QRLabel14.Caption := 'Monto Inicial';
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

    //Reporte Distribucion de cuotas
    frmDistCuotas:=TfrmDistCuotas.create(Nil);
    try
      dmReportes.qryRepFinancDistcuota.Close;
      dmReportes.qryRepFinancDistcuota.Params[0].Value := xCodigoCte;
      dmReportes.qryRepFinancDistcuota.Params[1].Value := serieDoc;
      dmReportes.qryRepFinancDistcuota.Open;
      frmDistCuotas.InsertarCuotas(
      dmReportes.qryRepFinancDistcuotaCANT_CUOTAS.Value,
      dmReportes.qryRepFinancDistcuotaMONTO_CAP_INICIAL.Value,
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
              
  rxVenta.EmptyTable;
  Edit1.Text      := '';
  edtCodigo.Text  := '';
  BitBtn4.Enabled := False;
  Totales.EmptyTable;
  CheckBox1.Checked := False;
  edtCodigo.SetFocus;
  ActualizarPreventa;
  ActualizarRecoverData;
  qryProdPorProveedor.Close;
  pnlPrecioProv.Visible:=False;    
end;

procedure TfrmProcVentaRapida.MostrarVistaproductos1Click(Sender: TObject);
begin
  MostrarVistaproductos1.Checked := Not MostrarVistaproductos1.Checked;
end;

procedure TfrmProcVentaRapida.BitBtn13Click(Sender: TObject);
begin
  //frmInvXReferencia:=TfrmInvXReferencia.Create(Nil);
  //try
  //  frmInvXReferencia.Showmodal;
  //finally
  //frmInvXReferencia.Free;
  //frmInvXReferencia:=Nil;
  //end;
end;

procedure TfrmProcVentaRapida.edtReferenciaChange(Sender: TObject);
begin
  if qryProductos.Locate('referencia', edtReferencia.Text, [loCaseInsensitive, loPartialKey]) then
  begin
    Prod_existe:= True;
    edtCodigo.Text := qryProductosCODIGO_TEXTO.Value;
    //panel2.Top := edtcodigo.Top+30;
    panel2.Left:= edtcodigo.Left;
    panel2.Visible:=True;
    panel2.BringToFront;
  end
end;

procedure TfrmProcVentaRapida.edtReferenciaExit(Sender: TObject);
begin
  if Panel2.Visible then
  edtReferencia.Text := qryProductosCodigo_Texto.Value;
  if (qryProductos.State = dsInactive) then
  qryProductos.Open;
  qryProductos.Locate('Referencia', edtReferencia.Text, [loCaseInsensitive, loPartialKey])

end;

procedure TfrmProcVentaRapida.NotaCrdito1Click(Sender: TObject);
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

procedure TfrmProcVentaRapida.NotaDebito1Click(Sender: TObject);
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

procedure TfrmProcVentaRapida.BitBtn14Click(Sender: TObject);
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

procedure TfrmProcVentaRapida.DBEdit2Exit(Sender: TObject);
var
  guardarRec : TBookMark;
  porcdes : Extended;
begin
   cPrecio:= rxVentaPrecio.Value;
  if DBEdit2.ReadOnly = false then
  begin
  //guardarRec := rxVenta.GetBookmark;
  end;
  guardarRec:= rxVenta.GetBookmark;
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
  //tj   rxVentaPrecio.Value:=rxqryInvPRECIO.Value;
  //tj end; }
  if (aPrecio <> cPrecio) then
  PrecioCambio:=True else PrecioCambio:=False;

  ProcesaCalculos;

  if rxVenta.State In [dsInsert, dsEdit] Then
  rxVenta.Post;
  //WriteToLog('Post rxVenta - Line 4353');

  if (DBEdit2.ReadOnly = false) then
  begin
    //rxVenta.GotoBookmark(guardarRec);
    //rxVenta.FreeBookmark(guardarRec);
  end;
  if rxVenta.State = dsBrowse then
  rxVenta.Locate('Serie', yNumSerie,[]);
  if rxVentaCodTexto.Value = '' then Exit;
  if not qryInventario.Locate('CODIGO_TEXTO', rxVentaCodTexto.Value,[]) then
  MessageDlg('codigo ' + rxVentaCodTexto.Value + ' no encontrado en inventario, verifique', mtError, [mbOK], 0)
  else
  begin
    if (Not FAplicaPrecioMayorista) And (rxVentaPrecio.Value < qryProductosPRECIO_MINIMO.Value)
    and (glbUsaescalaPrecio = 0) then
    begin
      if MessageDlg('Precio es menor que el minimo, continuar?', mtError, [mbYes,mbNo], 0) = mrno then
      begin
        DBEdit2.ReadOnly := False;
        DBEdit2.SetFocus;
        if Assigned(guardarRec) then
        begin
          rxVenta.GotoBookmark(guardarRec);
          rxVenta.FreeBookmark(guardarRec);
        end;
        Exit;
      end;
    end;
  end;

  DBEdit2.ReadOnly := True;
  //if frmProcVentaRapida.Showing then
  if Assigned(guardarRec) then
  begin
    rxVenta.GotoBookmark(guardarRec);
    rxVenta.FreeBookmark(guardarRec);
  end;
  if isShowing then
  edtCodigo.SetFocus;
end;

function TfrmProcVentaRapida.VerificaClave: Boolean;
begin
  frmEntrreClave:=TfrmentrreClave.Create(nil);
  if frmEntrreClave.showmodal=mrOk then
  Clave:= frmEntrreClave.Edit1.Text
  else Result := False;
  frmentrreClave.Free;
  frmentrreClave:=Nil;
  if GlbClaveSup <> Encriptar(Trim(clave), 2005) then
  begin
    MessageDlg('Clave incorrecta, verifique', mtError, [mbOK], 0);
    Result := False;
  end else Result := True;
end;

procedure TfrmProcVentaRapida.Devolucin1Click(Sender: TObject);
begin
  frmProcVentaRapida.Hide;
  frmEdicionVenta:=TfrmEdicionVenta.Create(Nil);
  try
    frmEdicionVenta.tblDatosVenta.Close;
    frmEdicionVenta.tblDatosVenta.Params[0].value:= ExtraerFecha(glbfechatrndiaria);
    frmEdicionVenta.tblDatosVenta.Open;
    frmEdicionVenta.Caption := 'Procesa devolucion';
    if frmEdicionVenta.ShowModal = mrOk then
    begin
      frmProcVentaRapidaEdicion:=TfrmProcVentaRapidaEdicion.Create(Nil);
      if frmProcVentaRapidaEdicion.tablaPropietario.State = dsInactive then
      frmProcVentaRapidaEdicion.tablaPropietario.Open;
      if frmProcVentaRapidaEdicion.tablaPropietario.RecordCount = 0 then
      begin
        frmProcVentaRapidaEdicion.tablaPropietario.Append;
        frmProcVentaRapidaEdicion.tablaPropietarioCodigoPropietario.Value:=  frmEdicionVenta.tblDatosVentaCODIGO_CTE.Value;
        frmProcVentaRapidaEdicion.tablaPropietario.Post;
      end;
      frmProcVentaRapidaEdicion.rxVenta.Close;
      frmProcVentaRapidaEdicion.rxVenta.Open;
      frmEdicionVenta.tblDatosDet.First;
      While Not frmEdicionVenta.tblDatosDet.Eof do
      begin
        frmProcVentaRapidaEdicion.rxVenta.Append;
        frmProcVentaRapidaEdicion.rxVentaglbcodVendedor.Value := frmEdicionVenta.qryClientesCOD_VENDEDOR.Value;
        rxVentaItbi.Value:=0;
        frmProcVentaRapidaEdicion.rxVentaSerie.Value       := frmEdicionVenta.tblDatosDetSERIE.Value;
        frmProcVentaRapidaEdicion.rxVentaNumeroTrn.Value   := frmEdicionVenta.tblDatosDetNUMERO.Value;
        frmProcVentaRapidaEdicion.rxVentaNumeroRecibo.Value:= frmEdicionVenta.tblDatosDetNUMERO.Value;
        frmProcVentaRapidaEdicion.rxVentaFecha.Value       := frmEdicionVenta.tblDatosVentaFECHA.Value;
        frmProcVentaRapidaEdicion.rxVentaCant.Value        := frmEdicionVenta.tblDatosDetCANTIDAD.Value;
        frmProcVentaRapidaEdicion.rxVentaTipoUnidad.Value  := frmEdicionVenta.tblDatosDetTIPO_UNIDAD.Value;
        frmProcVentaRapidaEdicion.rxVentaItbisExento.Value := frmEdicionVenta.tblDatosDetITBIS_EXENTO.Value;
        frmProcVentaRapidaEdicion.rxVentaMoneda.Value      := frmEdicionVenta.tblDatosDetMONEDA.Value;

        frmProcVentaRapidaEdicion.rxVentaPrecio.Value      := frmEdicionVenta.tblDatosDetPRECIO.Value;
        frmProcVentaRapidaEdicion.rxVentaMontoBruto.Value  := frmEdicionVenta.tblDatosDetVALOR_SERVICIO_DET.Value;
        frmProcVentaRapidaEdicion.rxVentaDescripcion.Value := frmEdicionVenta.tblDatosDetDESCRIPCION.Value;
        //t frmProcVentaRapidaEdicion.rxVentaReferencia.Value  := frmEdicionVenta.tblDatosDetReferencia.Value; 
        //frmProcVentaRapidaEdicion.rxVentaDevolucion.Value:= frmEdicionVenta.tblDatosDet
        frmProcVentaRapidaEdicion.rxVentaMontoNeto.Value   := frmEdicionVenta.tblDatosDetVALOR_TOTAL_DET.Value;
        //frmProcVentaRapidaEdicion.rxVentaCodUsuario.Value:= frmEdicionVenta.tblDatosDet
        frmProcVentaRapidaEdicion.rxVentaCodArticulo.Value := frmEdicionVenta.tblDatosDetCODIGO_PROD.AsInteger;
        frmProcVentaRapidaEdicion.rxVentaRutaImagen.Value  := BuscarRutaImagen(frmEdicionVenta.tblDatosDetCODIGO_PROD.AsInteger);
        frmProcVentaRapidaEdicion.rxVentaMontoDescItem.Value:= frmProcVentaRapidaEdicion.rxVentaMontoBruto.Value * frmEdicionVenta.tblDatosDetPORC_DESC_DET.Value / 100;
        //frmProcVentaRapidaEdicion.rxVentaCodTexto.Value    := frmEdicionVenta.tblDatosDet.Value;

        rxVentaCostoProducto.Value := frmEdicionVenta.tblDatosDetPRECIO_COMPRA.Value;
        //rxVentaCostoProducto.Value := qryProductosPRECIO_COMPRA.Value;//aquiiiiiiiiiiiiiiis
        //frmProcVentaRapidaEdicion.rxVentaNCF.Value         := frmEdicionVenta.tblDatosDet
        frmProcVentaRapidaEdicion.rxVentaporc_desc.Value   := frmEdicionVenta.tblDatosDetPORC_DESC_DET.Value;
        if not chkExento.Checked then
        frmProcVentaRapidaEdicion.rxVentaItbi.Value        := frmEdicionVenta.tblDatosDetITBI_DET.Value
        else frmProcVentaRapidaEdicion.rxVentaItbi.Value   := 0;
        //frmProcVentaRapidaEdicion.rxVentaMontoDescuento.Value:=frmEdicionVenta.tblDatosDet aaaaaqui
        frmProcVentaRapidaEdicion.rxVentaSerieProd.Value := frmEdicionVenta.tblDatosDetSERIE_PROD.Value;
        //frmProcVentaRapidaEdicion.rxVentaNumeroFactura.Value:=
        frmProcVentaRapidaEdicion.rxVenta.Post;
        frmEdicionVenta.tblDatosDet.Next;
      end;

      Totales.Close;
      Totales.Open;
      Totales.Insert;
      TotalesMoneda.Value := IntToStr(GlbMonedaBase);
      TotalesSubTotal.Value:=0;
      Totalesitbis.Value:=0;
      Totalesmontodesc.Value:=0;
      Totalestotalneto.Value:=0;
      Totalesmontorecibido.Value:=0;
      Totalesdevolucion.Value:=0;
      Totales.Post;

      if Totales.State = dsBrowse then
      Totales.Edit;
      TotalesCodCliente.Value:=frmEdicionVenta.tblDatosVentaCODIGO_CTE.Value;
      TotalesComentario.Value := frmEdicionVenta.tblDatosVentaCOMENTARIO.Value;
      TotalesPorcDesAdicional.Value:= frmEdicionVenta.tblDatosVentaPORC_DESCUENTO.Value;
      TotalesMontoDescAdicional.Value :=  frmEdicionVenta.tblDatosVentaMONTO_DESCUENTO.Value;
      Totales.Post;
      if not frmEdicionVenta.tblDatosVentaNOMBRE_CLIENTE_GENERAL.IsNull then
      frmProcVentaRapidaEdicion.edtObservacion.Text:= frmEdicionVenta.tblDatosVentaNOMBRE_CLIENTE_GENERAL.Value;
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

procedure TfrmProcVentaRapida.BitBtn7Click(Sender: TObject);
var
  x : Integer;
begin
  numeroTrnVta:= 0;
  if not tablaPropietarioCodigoPropietario.IsNull then
  GlbcodVendedor:= qryClienteCOD_VENDEDOR.Value;
  if EsModificandoFactura then
  begin
    if (dmFactura.qryFactTieneDevolucion.RecordCount = 1) then
    begin
      MessageDlg('Factura tiene una devolución previa, verifique ',mtInformation,[mbok],0);
      Exit;
    end;

    if MessageDlg('Continuar con devolución factura?', mtWarning,[mbYes, mbNo],0) = mrNo then
    Exit;
    if TotalesMoneda.IsNull then
    begin
      MessageDlg('Favor indicar moneda.', mtInformation, [mbok],0);
      Exit;
    end;
    //Crear Nota Credito
    UProcesarDevolucion.tipoCF    := '04';
    UProcesarDevolucion.fechaTrn  := rxVentaFecha.Value;
    UProcesarDevolucion.codigo_cte:= tablaPropietarioCodigoPropietario.Value;
    UProcesarDevolucion.nombrecompleto :=qryClienteNOMBRE_FACTURAR.Value;
    if Not qryClienteRNC_NUMERO.IsNull then
    UProcesarDevolucion.cedula   := qryClienteRNC_NUMERO.Value
    else
    UProcesarDevolucion.cedula   := qryClienteCEDULA.Value;
    UProcesarDevolucion.direccion:= qryClienteDIRECCION_CONT.Value;
    UProcesarDevolucion.ciudad   := qryClienteCIUDAD.Value;// '';
    UProcesarDevolucion.monto    := Totalestotalneto.Value;
    UProcesarDevolucion.status   := 'A';

    UProcesarDevolucion.codig_usuario := VarUsuarioGlb;
    UProcesarDevolucion.fechaInsert   := Now;;
    UProcesarDevolucion.fechaUpdate   := Now ;
    UProcesarDevolucion.codigousuarioupd := VarUsuarioGlb;
    UProcesarDevolucion.tipodoc := 5; //Nota Credito
    UProcesarDevolucion.Moneda  := Trim(TotalesMoneda.Value);
    UProcesarDevolucion.numeroFactura := rxVentaNumeroFactura.Value;
    UProcesarDevolucion.Ejecutar('04');//Comprogante Fiscal Nota de Credito

    rxVenta.DisableControls;
    rxVenta.First;
    if rxVentaglbcodVendedor.Value > 0 then
    GlbcodVendedor:= rxVentaglbcodVendedor.Value;
    //ActualizaVentaMaster('6', UProcesarDevolucion.seriencfasignado);//Devolucion
    ProcInsertarVtaMastEnDevolucion(UProcesarDevolucion.seriencfasignado);
    rxVenta.First;
    While Not rxVenta.Eof Do
    begin
      ibStpActualizaInvProd.Params[0].Value:= rxVentaCodArticulo.Value;
      ibStpActualizaInvProd.Params[1].Value:= rxVentaCant.Value;
      ibStpActualizaInvProd.Params[2].Value:= 1;//tipoTrn
      ibStpActualizaInvProd.Params[3].Value:= 1;//porCodigo
      if (rxVentaInvetariar.Value <> 0) And  (GlbCodDivInventario = 1 ) then
      ibStpActualizaInvProd.ExecProc;

      InsertarDetDevolucion(ipStpInsertVentMast.Params[0].Value);
      //ActualizaInvAlmacen;

      rxVenta.Next;
    end;
    //6	Devolucion

   //Usado para filtrar dmfactura.qryventafactura
   dmFactura.formaPago := 6;//Devolucion

   dmCompania.tblCompania.Close;
   dmCompania.tblCompania.Open;
   dmCompania.tblCompania.Locate('codigo',glbCia_Key,[]);
   dmfactura.qryFactReimpMaster.Close;
   dmfactura.qryFactReimpMaster.Params[0].Value:=UProcesarDevolucion.numeroFactura;

   dmfactura.qryFactReimpDet.Close;
   dmfactura.qryFactReimpDet.Params[0].Value:=UProcesarDevolucion.numeroFactura;
   dmfactura.qryFactReimpDet.Open;
   dmfactura.qryFactReimpDet.Last;
   dmfactura.qryFactReimpDet.Close;

    dmfactura.qryFactReimpMaster.Open;
    frmConsultaFacturas:=TfrmConsultaFacturas.Create(Nil);
    try
      frmConsultaFacturas.rdgCredito.Checked := True;
      frmConsultaFacturas.EditN1.SetInteger(dmfactura.qryFactReimpMaster.Params[0].Value);
      dmFactura.qryVentaFactura.SQL.Text:=
      dmFactura.qryVentaFactura_0.SQL.Text + ' Where VENTAS_MAST.NUMERO_FACTURA =:numero '+
      ' and VENTAS_MAST.Codigo_cte =:codcte  And ventas_mast.cia_key =:ciakey' +
      ' and ventas_mast.FORMA_PAGO = 6' ;

      dmFactura.qryVentaFactura.Params[0].AsInteger := UProcesarDevolucion.numeroFactura;
      dmFactura.qryVentaFactura.Params[1].AsInteger := UProcesarDevolucion.codigo_cte;
      dmFactura.qryVentaFactura.Params[2].AsInteger := glbCia_Key;
      dmFactura.qryVentaFactura.Open;

      dmFactura.qryDatosTrncxc.Close;  //dmFactura.qryVentaFactura.RecordCount;
      dmFactura.qryDatosTrncxc.Params[0].AsInteger:= dmFactura.qryVentaFacturaNUMERO_FACTURA.Value;
      dmFactura.qryDatosTrncxc.Params[1].AsInteger:= glbCia_Key;
      dmFactura.qryDatosTrncxc.Open;
      //frmConsultaFacturas.BitBtn1Click(Self);
    finally
    if Assigned(frmConsultaFacturas) then
    frmConsultaFacturas.Free;
    frmConsultaFacturas:=Nil;
    end;

    if (dmFactura.qryVentaFacturaTIPO_FACTURA.Value = 1 ) then //
    begin
      qckFactCredArtioffice8_5_F_1:=TqckFactCredArtioffice8_5_F_1.Create(nil);
      try
        qckFactCredArtioffice8_5_F_1.qrLabelFactOrigen.Caption:='';
        if EsDevolucion then
        begin
          //if EsModificandoFactura then
          qckFactCredArtioffice8_5_F_1.qrLabelFactOrigen.Caption:='#Factura: '+IntToStr(UProcesarDevolucion.numeroFactura);

         qckFactCredArtioffice8_5_F_1.QRLabel4.Caption := 'NOTA CREDITO';
        end;
        qckFactCredArtioffice8_5_F_1.strtipodoc := 'NOTA CREDITO';
        qckFactCredArtioffice8_5_F_1.Preview;
      finally
      qckFactCredArtioffice8_5_F_1.free;
      qckFactCredArtioffice8_5_F_1:=nil;
      end;
    end else
    begin
      ImpFacturaservicio(dmfactura.qryFactReimpMaster.Params[0].Value, True);
    end;
    Label36.Visible:=False;
    Label36.caption:='';
    rdgFactServicio.Checked:=False;
    Application.ProcessMessages;
    qryInventario.Close;
    qryInventario.Open;
    qryProductos.Close;
    qryProductos.Open;
    qryCliente.Close;
    qryCliente.Open;
    lblFechaCotizacion.Visible:= False;
    dbFechaCotizacion.Visible := False;
    Label36.Visible    := False;
    glbcodVendedor     := -1;
    EsModificandoCotiza:= False;
    label36.Caption    := '';
    NoTieneCredito     := False;
    Refresh;
    EsDevolucion       := False;
    Totales.Close;
    Totales.Open;
    lblProcDev.Visible := False;
    tablaPropietario.Close;
    tablaPropietario.Open;
    rxventa.EnableControls;
    rxventa.Close;
    rxventa.Open;
    Exit;
  end; //FIN MODIFICAR FACTURA

  //***********************************PROCESO DEVOLUCION PARCIAL *************
 //{*****EN PRUEBA
  if (EsDevolucion) And (rxVenta.RecordCount > 0) then
  begin
    if TotalesMoneda.IsNull then
    begin
      MessageDlg('Favor indicar moneda.', mtInformation, [mbok],0);
      Exit;
    end;  
    if MessageDlg('Desea procesar transacción como devolución?', mtInformation, [mbYes, mbNo],0)= mrYes then
    begin
      if (tablaPropietarioCodigoPropietario.value = 0) then
      begin
         MessageDlg('Favor seleccionar cliente.', mtInformation, [mbOK], 0);
         RxDBLookupCombo1.SetFocus;
         Exit;
      end;

    //Crear Nota Credito
    UProcesarDevolucion.tipoCF    := '04';
    UProcesarDevolucion.fechaTrn  := rxVentaFecha.Value;
    UProcesarDevolucion.codigo_cte:= tablaPropietarioCodigoPropietario.Value;
    UProcesarDevolucion.nombrecompleto :=qryClienteNOMBRE_FACTURAR.Value;
    if Not qryClienteRNC_NUMERO.IsNull then
    UProcesarDevolucion.cedula   := qryClienteRNC_NUMERO.Value
    else
    UProcesarDevolucion.cedula   := qryClienteCEDULA.Value;
    UProcesarDevolucion.direccion:= qryClienteDIRECCION_CONT.Value;
    UProcesarDevolucion.ciudad   := qryClienteCIUDAD.Value;// '';
    UProcesarDevolucion.monto    := Totalestotalneto.Value;
    UProcesarDevolucion.status   := 'A';
    UProcesarDevolucion.Moneda   := Trim(TotalesMoneda.Value); 
    UProcesarDevolucion.codig_usuario := VarUsuarioGlb;
    UProcesarDevolucion.fechaInsert   := Now;;
    UProcesarDevolucion.fechaUpdate   := Now ;
    UProcesarDevolucion.codigousuarioupd := VarUsuarioGlb;
    UProcesarDevolucion.tipodoc := 5; //Nota Credito
    UProcesarDevolucion.numeroFactura := rxVentaNumeroFactura.Value;
    UProcesarDevolucion.Ejecutar('04');//Comprogante Fiscal Nota de Credito      

      //ActualizaVentaMaster('6', UProcesarDevolucion.seriencfasignado);//Devolucion
      ProcInsertarVtaMastEnDevolucion(UProcesarDevolucion.seriencfasignado);
      rxVenta.First;
      While Not rxVenta.Eof Do
      begin
        ibStpActualizaInvProd.Params[0].Value:= rxVentaCodArticulo.Value;
        ibStpActualizaInvProd.Params[1].Value:= rxVentaCant.Value;
        ibStpActualizaInvProd.Params[2].Value:= 1;//tipoTrn
        ibStpActualizaInvProd.Params[3].Value:= 1;//porCodigo
        if (rxVentaInvetariar.Value <> 0) And  (GlbCodDivInventario = 1 ) then
           ibStpActualizaInvProd.ExecProc;

        InsertarDetDevolucion(ipStpInsertVentMast.Params[0].Value);
        //ActualizaInvAlmacen;
        rxVenta.Next;
      end;
      //No es necesario, probar y eliminar en caso de no.
      //ProcesarDevolucion;
    end;
    ReImprimeDevolucionsinFact1Click(Self);
    UProcesarDevolucion.numeroFactura :=-1;
  end;

 //  ---EN PRUEBA REABILITAR PARA CONTINUAR
 // }
  EsDevolucion := Not EsDevolucion;
  lblProcDev.Visible := EsDevolucion;
  if lblProcDev.Visible = false then
  lblProcDev.SendToBack else
  lblProcDev.BringToFront;
  lblProcDev.Left:=192;
  for x:=1 to 50 do
  begin
    lblProcDev.Left:=lblProcDev.Left - 1;
  end;
  BitBtn4.Enabled    := True;
  BitBtn6.Enabled    := True;
  if EsDevolucion then
  lblProcDev.Caption:='Procesando Devolución'
  else
  lblProcDev.Caption:='Proceso Venta';
  EsModificandoFactura:=False;
  qryInventario.Close;
  qryInventario.Open;
  qryProductos.Close;
  qryProductos.Open;
  numeroTrnVta:= 0;
  GlbcodVendedor:=-1;
  rxventa.EnableControls;
  Refresh;
  if rxventa.Recordcount = 0 then Exit;
    Label36.Visible:=False;
    Label36.caption:='';
    rdgFactServicio.Checked:=False;
    Application.ProcessMessages;
    qryInventario.Close;
    qryInventario.Open;
    qryProductos.Close;
    qryProductos.Open;
    qryCliente.Close;
    qryCliente.Open;
    lblFechaCotizacion.Visible:= False;
    dbFechaCotizacion.Visible := False;
    Label36.Visible    := False;
    glbcodVendedor     := -1;
    EsModificandoCotiza:= False;
    label36.Caption    := '';
    NoTieneCredito     := False;
    Refresh;
    EsDevolucion       := False;
    Totales.Close;
    Totales.Open;
    lblProcDev.Visible := False;
    tablaPropietario.Close;
    tablaPropietario.Open;
    rxventa.EnableControls;
    rxventa.Close;
    rxventa.Open;  
  Refresh;
  Application.ProcessMessages;
end;

procedure TfrmProcVentaRapida.DBEdit2Enter(Sender: TObject);
begin
  edtCodigo.Text := '';
  if (GlbNumero > 0) then
  if rxVenta.State = dsbrowse then
  rxVenta.Locate('Serie', GlbNumero,[]);
  DBEdit2.SelectAll;
  aPrecio:= rxVentaPrecio.Value;
end;

procedure TfrmProcVentaRapida.chkExentoExit(Sender: TObject);
var
  _book : TBookmark;
begin
  if (rxVenta.Recordcount > 1) then
  begin
    _book :=  rxVenta.GetBookmark;
    SumarDatos := False;
    rxVenta.DisableControls;
    rxVenta.First;
    While Not rxVenta.Eof Do
    begin
      if (rxVentaStatus.Value = 'C') then
      begin
        rxVenta.Next;
        continue;
      end;
      rxVenta.Edit;
      ProcesaCalculos;
      rxVenta.Next;
    end;
    sumarDatos := True;
    rxVenta.Edit;
    rxVenta.Post;
    rxVenta.GotoBookmark(_book); //hoy es un dia maravilloso
    rxventa.FreeBookmark(_book);
    rxventa.EnableControls;
    //WriteToLog('Post rxVenta - Line 4763');
  end else
  begin
    rxVenta.Edit;
    ProcesaCalculos;
    //rxVenta.Post;
  end;
end;

procedure TfrmProcVentaRapida.RxDBGrid2KeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = '#13' then
  RxDBGrid2DblClick(Self);
end;

procedure TfrmProcVentaRapida.RxDBGrid2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = 13 then
  RxDBGrid2DblClick(Self);
end;

procedure TfrmProcVentaRapida.AsignarSqlText(campo, valor,
  OrderBy: String);
var
  nombProc:string;
begin
  //t rxqryInv.DisableControls;
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
    {Select INV.*,
    tipo_inv.Descripcion Desc_tipoInv
    From PROC_INV_VENTA_est(1) INV,
    TIPO_INVENTARIO tipo_inv
    Where inv.tipo = tipo_inv.codigo
    ORDER BY codigo, tipo,descripcion, Referencia}
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

procedure TfrmProcVentaRapida.chkExentoEnter(Sender: TObject);
begin
  chkExento.SetFocus;
end;

procedure TfrmProcVentaRapida.RxDBGrid2GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if qryProductosCANTIDAD.Value <=5 then
  begin
    BackGround := clYellow;
    aFont.Color := clblack;
  end;
end;

procedure TfrmProcVentaRapida.ReImprimirRecibo1Click(Sender: TObject);
begin
  //frmProcVentaRapida.Hide;
  frmEdicionVenta:=TfrmEdicionVenta.Create(Nil);
  try
    frmEdicionVenta.tblDatosVenta.Close;
    frmEdicionVenta.tblDatosVenta.Params[0].Value:= ExtraerFecha(GlbFechaTrnDiaria);
    frmEdicionVenta.tblDatosVenta.Open;
    if not EsModificandoFactura and not esContado  and (numerodocReimp <= 0) then
    frmEdicionVenta.EditN1.Text:=InputBox('Re-Imprimir recibo','Entre número','')
    else frmEdicionVenta.EditN1.Text := IntToStr(numerodocReimp);
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
        frmProcVentaRapidaEdicion.rxVenta.Append;
        frmProcVentaRapidaEdicion.rxVentaglbcodVendedor.Value := frmEdicionVenta.qryClientesCOD_VENDEDOR.Value;
        rxVentaItbi.Value:=0;
        frmProcVentaRapidaEdicion.rxVentaSerie.Value       := frmEdicionVenta.tblDatosDetSERIE.Value;
        frmProcVentaRapidaEdicion.rxVentaNumeroTrn.Value   := frmEdicionVenta.tblDatosDetNUMERO.Value;

        frmProcVentaRapidaEdicion.rxVentaNumeroRecibo.Value:= frmEdicionVenta.tblDatosVentaNUMERO_DOC_PAGO.AsInteger;
        if not frmEdicionVenta.tblDatosVentaNUMERO_DOC_PAGO.IsNull then
        frmProcVentaRapidaEdicion.rxVentaNumeroDoc.Value:=   frmEdicionVenta.tblDatosVentaNUMERO_DOC_PAGO.AsInteger
        else
        if not frmEdicionVenta.tblDatosVentaNUMERO_FACTURA.IsNull then
        frmProcVentaRapidaEdicion.rxVentaNumeroDoc.Value:= frmEdicionVenta.tblDatosVentaNUMERO_FACTURA.Value;
        
        frmProcVentaRapidaEdicion.rxVentaNumeroRecibo.Value:= frmEdicionVenta.tblDatosDetNUMERO.Value;
        frmProcVentaRapidaEdicion.rxVentaMoneda.Value      := frmEdicionVenta.tblDatosVentaMONEDA.Value;
        frmProcVentaRapidaEdicion.rxVentaFecha.Value       := frmEdicionVenta.tblDatosVentaFECHA.Value;
        frmProcVentaRapidaEdicion.rxVentaCant.Value        := frmEdicionVenta.tblDatosDetCANTIDAD.Value;
        frmProcVentaRapidaEdicion.rxVentaPrecio.Value      := frmEdicionVenta.tblDatosDetPRECIO.Value;
        frmProcVentaRapidaEdicion.rxVentaMontoBruto.Value  := frmEdicionVenta.tblDatosDetVALOR_SERVICIO_DET.Value;
        frmProcVentaRapidaEdicion.rxVentaItbi.Value  :=  frmEdicionVenta.tblDatosDetITBI_DET.Value;
        frmProcVentaRapidaEdicion.rxVentaDescripcion.Value := frmEdicionVenta.tblDatosDetDESCRIPCION.Value;
        frmProcVentaRapidaEdicion.rxVentaMontoNeto.Value   := frmEdicionVenta.tblDatosDetVALOR_TOTAL_DET.Value;
        frmProcVentaRapidaEdicion.rxVentaCodArticulo.Value := frmEdicionVenta.tblDatosDetCODIGO_PROD.AsInteger;
        frmProcVentaRapidaEdicion.rxVentaCodTexto.Value      := frmEdicionVenta.tblDatosDetCODIGO_PROD.Value;
        frmProcVentaRapidaEdicion.rxVentaCostoProducto.Value := frmEdicionVenta.tblDatosDetPrecio_Compra.Value;
        frmProcVentaRapidaEdicion.rxVentaRutaImagen.Value := BuscarRutaImagen(frmEdicionVenta.tblDatosDetCODIGO_PROD.AsInteger);
        frmProcVentaRapidaEdicion.rxVentaporc_desc.Value   := frmEdicionVenta.tblDatosDetPORC_DESC_DET.Value;
        frmProcVentaRapidaEdicion.rxVentaSerieProd.Value   := frmEdicionVenta.tblDatosDetSERIE_PROD.Value;
        frmProcVentaRapidaEdicion.rxVentaTipoUnidad.Value  := frmEdicionVenta.tblDatosDetTIPO_UNIDAD.Value;

        if dmInventario.qryTipoUnidad.Locate('IDUNIDAD', frmEdicionVenta.tblDatosDetTIPO_UNIDAD.Value, []) then
        begin
          frmProcVentaRapidaEdicion.rxVentaDescUnidadMedida.Value:=
          dmInventario.qryTipoUnidadDESCRIPCION.Value;
        end;
        
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
        frmProcVentaRapidaEdicion.TotalesPorcDesAdicional.Value := frmEdicionVenta.tblDatosVentaPORC_DESCUENTO.Value;
        frmProcVentaRapidaEdicion.TotalesMontoDescAdicional.Value := frmEdicionVenta.tblDatosVentaMONTO_DESCUENTO.Value;
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
  refresh;
end;

procedure TfrmProcVentaRapida.BitBtn15Click(Sender: TObject);
var
  tRecordsDet : integer;
  ImpPDF, flag : boolean;
begin
  ImpPDF := False;
  dmCompania.tblCompania.Close;
  dmCompania.tblCompania.Open;
  dmCompania.tblCompania.Locate('codigo',glbCia_Key,[]);
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
    frmConsultaFacturas:=TfrmConsultaFacturas.Create(Nil);
    try
      frmConsultaFacturas.rdgCredito.Checked:=True;
      frmConsultaFacturas.EditN1.SetInteger(dmfactura.qryFactReimpMaster.Params[0].Value);
      //frmConsultaFacturas.edtCodCte.SetInteger(dmfactura.qryFactReimpMasterCODIGO_CTE.Value);
      if not ExpExcel then
      begin
        frmConsultaFacturas.BitBtn1Click(Self);
      end else
      begin
        //Aqui Exportar a Excel
      end;
      if frmConsultaFacturas.chkExportaPDF.Checked then
      ImpPDF := True;
    finally
    if Assigned(frmConsultaFacturas) then
    frmConsultaFacturas.Free;
    frmConsultaFacturas:=Nil;
    end;

    dmclientes.tblClientes.Close;
    dmclientes.tblClientes.Open;
    if dmclientes.tblClientes.Locate('CODIGO_CTE', dmfactura.qryFactReimpMasterCODIGO_CTE.Value,[]) then
    glbcodVendedor:=dmclientes.tblClientesCOD_VENDEDOR.Value
    else
    glbcodVendedor:= VarUsuarioGlb;

    //INGESERVIS, ARTIOFFICE,MAISONMARIE,TRIPLETASSO
    if (UpperCase(GLBFormatoFactura) = 'BYMSERVICIOS') then 
    begin
      qckFactCredArtioffice8_5_F_1ByM:=TqckFactCredArtioffice8_5_F_1ByM.Create(nil);
      try
        qckFactCredArtioffice8_5_F_1ByM.Preview;
        if ImpPDF then
        ReportExport(qckFactCredArtioffice8_5_F_1ByM,'FacturaNum'+dmfactura.qryFactReimpMaster.Params[0].AsString+'.pdf');

      finally
      qckFactCredArtioffice8_5_F_1ByM.free;
      qckFactCredArtioffice8_5_F_1ByM:=nil;
      end;

    end else
  if (((UpperCase(GLBFormatoFactura) = 'INGESERVIS')) OR
    ((UpperCase(GLBFormatoFactura) = 'ARTIOFFICE'))) then
  begin
    if (dmFactura.qryVentaFacturaTIPO_FACTURA.Value = 1 ) then //
    begin
      qckFactCredArtioffice8_5_F_1:=TqckFactCredArtioffice8_5_F_1.Create(nil);
      try
        qckFactCredArtioffice8_5_F_1.Preview;
      if ImpPDF then
      ReportExport(qckFactCredArtioffice8_5_F_1,'FacturaNum'+dmfactura.qryFactReimpMaster.Params[0].AsString+'.pdf');
        
      finally
      qckFactCredArtioffice8_5_F_1.free;
      qckFactCredArtioffice8_5_F_1:=nil;
      end;

    end else
    begin
      ImpFacturaservicio(dmfactura.qryFactReimpMaster.Params[0].Value,True);
    end;
  end else
  begin
      //Exit;//Valido para Ingeservice y Artioffice
      if dmfactura.qryFactReimpMaster.Recordcount > 0 then
      begin

        if (GlbFact55Pulg = 1) then
        begin
          if GlbFacturaLicoreria =1 then
          begin
            qckRepFacturaEstandarNewReimpREsp:=TqckRepFacturaEstandarNewReimpREsp.Create(Nil);
            try
             if GlbSizeFact8x11 = 1 then
             qckRepFacturaEstandarNewReimpREsp.Page.Length := 11;
             qckRepFacturaEstandarNewReimpREsp.xtipoVenta := TipoVenta;
             qckRepFacturaEstandarNewReimpREsp.Prepare;
             glbTPag := qckRepFacturaEstandarNewReimpREsp.PageNumber;
             //qckRepRecibo8_5_11REsp.valorNCF:= GlbDescNCF;//valorNCF;
            if ImprimirRecibo1.Checked then
             begin
               qckRepFacturaEstandarNewReimpREsp.PrinterSetup;
               qckRepFacturaEstandarNewReimpREsp.Print;
             end else
             qckRepFacturaEstandarNewReimpREsp.Preview;
             finally
             qckRepFacturaEstandarNewReimpREsp.Free;
             qckRepFacturaEstandarNewReimpREsp:=Nil;
             end;
          end else
          begin
            qckRepFacturaEstandarNewReimp:=TqckRepFacturaEstandarNewReimp.Create(Nil);
            try
              if GlbSizeFact8x11 = 1 then
              qckRepFacturaEstandarNewReimp.Page.Length := 11;

              qckRepFacturaEstandarNewReimp.Prepare;
              glbTPag := qckRepFacturaEstandarNewReimp.PageNumber;
          
              if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
              begin
                qckRepFacturaEstandarNewReimp.PrinterSetup;
                qckRepFacturaEstandarNewReimp.Print;
              end else
              qckRepFacturaEstandarNewReimp.Preview;
            finally
            qckRepFacturaEstandarNewReimp.Free;
            qckRepFacturaEstandarNewReimp:=Nil;
          end;
      end;
  end
  else
  begin

    qckRepFactPuntoVenta:=TqckRepFactPuntoVenta.Create(Nil);
    if dmfactura.qryFactReimpDet.RecordCount = 1 then
      qckRepFactPuntoVenta.Page.Length:= 5
      else
      if dmfactura.qryFactReimpDet.RecordCount >= 2 then
      qckRepFactPuntoVenta.Page.Length:= qckRepFactPuntoVenta.Page.Length +
      (dmfactura.qryFactReimpDet.RecordCount - 1 ) * 0.25;
              
    try
     qckRepFactPuntoVenta.QRLabel14.Enabled:=False;
      //if tRecordsDet > 2 then
      //qckRepFactPuntoVenta.Page.Length:= qckRepFactPuntoVenta.Page.Length +
      //(tRecordsDet - 1 ) * 74;

      flag:=true;
      qckRepFactPuntoVenta.Prepare;
      rxventa.DisableControls;
      rxdbgrid1.Enabled:=False;
      if (dmfactura.qryFactReimpDet.RecordCount > 1) or (qckRepFactPuntoVenta.PageNumber > 1) then
      begin
        repeat
          begin
            if (qckRepFactPuntoVenta.PageNumber > 1) then
            begin
              qckRepFactPuntoVenta.Page.Length:=qckRepFactPuntoVenta.Page.Length + 0.25;
              qckRepFactPuntoVenta.Prepare;
              flag:=False;
            end else break;
          end;
        until flag = true;
      end;
      rxventa.EnableControls;
      rxdbgrid1.Enabled:=True;

      if ImprimirRecibo1.Checked then
      qckRepFactPuntoVenta.Print else
      qckRepFactPuntoVenta.Preview;
    finally
    qckRepFactPuntoVenta.Free;
    qckRepFactPuntoVenta:=Nil;
    end;
  end;
  end else
  MessageDlg('Número factura no econtrado verifique',mtInformation, [mbOK], 0);
  end;
end;

procedure TfrmProcVentaRapida.FormShow(Sender: TObject);
begin
  ProcActUltTrn;
  isShowing:=True;
  if (GlbActivaCafeteria = 1) then
  label26.Visible:=True
  else label26.Visible:=False;
  SkinData1.Active:=False;
  Application.ProcessMessages;
  SkinData1.Active:=True;
  tblMoneda.close;
  tblMoneda.Open;
  qryCliente.Close;
  qryCliente.open;
  tablaPropietario.Close;
  tablaPropietario.Open;
  qryVence.close;
  qryVence.open;
  dmInventario.qryTipoUnidad.Close;
  dmInventario.qryTipoUnidad.Open;
end;

procedure TfrmProcVentaRapida.RxLabel1Click(Sender: TObject);
begin
  ProcActUltTrn;
  Refresh;  
end;

procedure TfrmProcVentaRapida.ProcVenta(valorNCF:String;Serie_Asignadoncf:Integer; Var serieDoc:Integer);
begin
  { Temporal hasta definir regla
  if (valorNCF = '') then  //Generar factura sin NCF
  begin
    serieDoc:= FsqlMaxNumeroFactura('GEN_NUM_FACTURA_SINNCF');//FsqlMaxNumero('facturas','numero');
    if (serieDoc = 0) then
    serieDoc:=1;
  end else
  } 
  if (seriedoc <= 0 ) then
  begin
    serieDoc:= FsqlMaxNumeroFactura('gen_num_factura');//FsqlMaxNumero('facturas','numero');
    if (serieDoc = 0) then
    serieDoc :=1;
  end;
  ipStpInsertVentMast.Params[1].Value:= GlbFechaTrnDiaria;
  ipStpInsertVentMast.Params[2].Value:= GlbCodigoCia;
  if Not tablaPropietarioCodigoPropietario.IsNull then
  ipStpInsertVentMast.Params[3].Value      := tablaPropietarioCodigoPropietario.Value
  else ipStpInsertVentMast.Params[3].Value := 0;//Generico
  if (GlbcodVendedor > 0) then
  ipStpInsertVentMast.Params[4].Value    := GlbcodVendedor
  else
  ipStpInsertVentMast.Params[4].Value    := VarUsuarioGlb;
  //Asignar tipo Venta
  ipStpInsertVentMast.Params[5].Value    := 7;//Credito Normal

  ipStpInsertVentMast.Params[6].Value    := 'Venta a Credito';

  if TotalesMoneda.IsNull then
  ipStpInsertVentMast.Params[7].Value    := '1'
  else
  ipStpInsertVentMast.Params[7].Value    := TotalesMoneda.Value;
  
  ipStpInsertVentMast.Params[8].AsString := Totalestotalneto.AsString; //EditN1.Text;
  ipStpInsertVentMast.Params[9].Value    := 'A';
  ipStpInsertVentMast.Params[10].Value   := Now;
  ipStpInsertVentMast.Params[11].Value   := Null;
  ipStpInsertVentMast.Params[12].Value   := Null;
  ipStpInsertVentMast.Params[13].Value:= Null;
  ipStpInsertVentMast.Params[14].Value:= serieDoc;//Numero Factura
  ipStpInsertVentMast.Params[15].Value:= Null;         //yo soy inteligencia divina
  //ver mas abajo
  //ipStpInsertVentMast.Params[16].Value:= Serie_Asignadoncf;
  ipStpInsertVentMast.Params[17].Value:= TotalesSubTotal.Value;
  ipStpInsertVentMast.Params[18].Value:= TotalesPorcDesAdicional.Value;
  ipStpInsertVentMast.Params[19].Value:= TotalesMontoDescAdicional.Value;
  ipStpInsertVentMast.Params[20].Value:= Totalesmontorecibido.Value;
  ipStpInsertVentMast.Params[21].Value:= Totalesdevolucion.Value;
  ipStpInsertVentMast.Params[22].Value:= Totalesitbis.Value;
  ipStpInsertVentMast.Params[23].Value:= Totalesmontorecibido.Value;
  ipStpInsertVentMast.Params[24].Value:= edtObservacion.Text;
  ipStpInsertVentMast.Params[25].Value:= TotalesMontoDescGastosAdmin.Value;
  ipStpInsertVentMast.Params[26].Value:= TotalesMontoDescItbisGastosAdmin.Value;
  ipStpInsertVentMast.Params[27].Value:= TotalesMontoDescTransp.Value;
  ipStpInsertVentMast.Params[28].Value:= TotalesMontoDescDirtecnica.Value;
  ipStpInsertVentMast.Params[29].Value:= TotalesMontoDescItbisDirTecnica.Value;
  ipStpInsertVentMast.Params[30].Value:= TotalesMontoDescImprevisto.Value;
  ipStpInsertVentMast.Params[31].Value:= TotalesMontoDescItbisImprevisto.Value;
  ipStpInsertVentMast.Params[32].Value:= TotalesComentario.Value;
  ipStpInsertVentMast.Params[33].Value:= rxVentaNumeroCotiza.Value;
  ipStpInsertVentMast.Params[34].Value:= totalesReferenciaCte.Value;    
    
  if Serie_asignadoncf > 0 then
  ipStpInsertVentMast.Params[16].Value     := Serie_Asignadoncf
  else ipStpInsertVentMast.Params[16].Value:= Null;
  //serie_ncf_asignado
  ipStpInsertVentMast.ExecProc;
  //t SerieDoc := temporal arreglar numero de Factura
  if Not ipStpInsertVentMast.Transaction.InTransaction then
  ipStpInsertVentMast.Transaction.StartTransaction;
  try
    ipStpInsertVentMast.Transaction.CommitRetaining;
  except
  ipStpInsertVentMast.Transaction.RollbackRetaining;
  end;
  numeroTrnVta:= ipStpInsertVentMast.Params[0].Value;
  rxVenta.DisableControls;
  rxVenta.First;
  While not rxVenta.Eof do
  begin
    if (rxVentaStatus.Value = 'C') then
    begin
      rxVenta.Next;
      continue;
    end;  
    InsertarDet(ipStpInsertVentMast.Params[0].Value);
    ibStpActualizaInvProd.Params[0].Value:= rxVentaCodArticulo.Value;
    ibStpActualizaInvProd.Params[1].Value:= rxVentaCant.Value;
    ibStpActualizaInvProd.Params[2].Value:= 0;//tipoTrn
    ibStpActualizaInvProd.Params[3].Value:= 1;//porCodigo
    if (rxVentaInvetariar.Value <> 0) And  (GlbCodDivInventario = 1 ) then
    ibStpActualizaInvProd.ExecProc;
    
    if (rxVentaTipoVenta.Value = 0) or (rxVentaTipoVenta.IsNull )  then //Item de Venta
    ActualizaInvAlmacen;

    rxVenta.Next;
  end;
  rxVenta.First;
  While Not rxVenta.Eof Do
  begin
    rxVenta.Edit;
    rxVentaNumeroRecibo.Value  := ipStpInsertVentMast.Params[0].Value;
    rxVentaNumeroFactura.Value := SerieDoc;
    rxVentaNumeroDoc.Value     := SerieDoc;
    rxVenta.Post;
    //WriteToLog('Post rxVenta - Line 5225');
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
  NumeroTrn:= ipStpInsertVentMast.Params[0].Value;
  if Not EsFinanciamiento then
  begin
    if (GlbActivaIFiscal = 1) then
    begin
      if (NumeroTrn <= 0) then
      begin
        NumeroTrn := StrToInt(InputBox('Entre número transacción','Indique número',''));
      end;
      dmdatos.qryConfCajaXusuario.Close;
      dmdatos.qryConfCajaXusuario.Open;
      dmdatos.qryConfCajaXusuario.Locate('COD_EMPLEADO',VarUsuarioGlb,[]);

      dmReportes.qryDatosCajaImpUser.close;
      dmReportes.qryDatosCajaImpUser.Params[0].Value:= VarUsuarioGlb;
      dmReportes.qryDatosCajaImpUser.Open;
      dmReportes.qryDatosCajaImpUser.Last;
      dmReportes.qryDatosCajaImpUser.RecordCount;
      GlbNombreFiletoPrint:= Format('%s%s%s%s%s%s%s',[dmReportes.qryDatosCajaImpUserRUTA_TICKET.Value,'\Recibo',Trim(GlbCodSucursal),Trim(GlbModeloImpresora),
      IntToStr(VarUsuarioGlb),IntToStr(NumeroTrn),'.txt']);

      PrepararInfoFiscal(NumeroTrn);
      //rxVentaNumeroRecibo
      frmTestImpresoraFiscal:=TfrmTestImpresoraFiscal.Create(Nil);
      try
        frmTestImpresoraFiscal.Button1Click(Self);
        frmTestImpresoraFiscal.btnImprimeReciboClick(Self);//Button1Click(Self);
      finally
      frmTestImpresoraFiscal.Free;
      frmTestImpresoraFiscal:=Nil;
      end;
    end else
    if rdgFactServicio.Checked or rdgFactVentaProducto.Checked or
    (GlbFacturaArtioffice = 1) then
    begin
      Exit;//will be process after this procedure
      //ImpFacturaservicio(serieDoc,false);//Dios es Amor
      //do nothing
    end
    else
    if (GlbFact55Pulg = 1)  then
    begin
      //rxVenta.SortOnFields('Descripcion',True,False);
      if GlbFacturaLicoreria =1 then
      begin
        qckRepRecibo8_5_11REsp:=TqckRepRecibo8_5_11REsp.Create(Nil);
        try
          if GlbSizeFact8x11 = 1 then
          qckRepRecibo8_5_11REsp.Page.Length:= 11;
          qckRepRecibo8_5_11REsp.xtipoVenta := TipoVenta;
          qckRepRecibo8_5_11REsp.valorNCF   := valorNCF;
          qckRepRecibo8_5_11REsp.QRLabel2.Caption:='Factura:';

          qckRepRecibo8_5_11REsp.Prepare;
          glbTPag := qckRepRecibo8_5_11REsp.PageNumber;
          if ImprimirRecibo1.Checked then
          begin
            qckRepRecibo8_5_11REsp.PrinterSetup;
            qckRepRecibo8_5_11REsp.Print;
          end else
          qckRepRecibo8_5_11REsp.Preview;
        finally
        qckRepRecibo8_5_11REsp.Free;
        qckRepRecibo8_5_11REsp:=Nil;
        end;
      end else
      begin
        qckRepFacturaEstandarNew:=TqckRepFacturaEstandarNew.Create(Nil);
        try
          if GlbSizeFact8x11 = 1 then
          qckRepFacturaEstandarNew.Page.Length := 11;
          qckRepFacturaEstandarNew.xtipoVenta := TipoVenta;
          qckRepFacturaEstandarNew.valorNCF:= valorNCF;
          if ImprimirRecibo1.Checked then
          begin
            qckRepFacturaEstandarNew.PrinterSetup;
            qckRepFacturaEstandarNew.Print;
          end else
          qckRepFacturaEstandarNew.Preview;
        finally
        qckRepFacturaEstandarNew.Free;
        qckRepFacturaEstandarNew:=Nil;
        end;
      end;
    end else
    begin
      qckRepRecibo:=TqckRepRecibo.Create(Nil);
      try
        qckRepRecibo.xtipoVenta := TipoVenta;
        qckRepRecibo.valorNCF:= valorNCF;
        qckRepRecibo.ncfDesc:=GlbDescNCF;
        if rxVenta.RecordCount > 2 then
           qckRepRecibo.Page.Length:= qckRepRecibo.Page.Length +
           (rxVenta.RecordCount - 2 ) * 0.63;
        if ImprimirRecibo1.Checked then
           qckRepRecibo.Print else
          qckRepRecibo.Preview;
      finally
      qckRepRecibo.Free;
      qckRepRecibo:=Nil;
      end;
    end;
  end;
end;

procedure TfrmProcVentaRapida.LectorCodBarra1Click(Sender: TObject);
begin
  LectorCodBarra1.Checked:= Not LectorCodBarra1.Checked;
  if lectorcodbarra1.Checked then
  edtCodigo.Hint:='Enter - para buscar codigo barra. F10-on/off'
  else edtCodigo.Hint:= '';
end;

procedure TfrmProcVentaRapida.Edit1Enter(Sender: TObject);
begin
  if not TotalesMoneda.IsNull then
  begin
    if TotalesMoneda.IsNull then
    begin
      Totales.Edit;
      TotalesMoneda.Value := IntToStr(GlbMonedaBase);
      Totales.Post;
      if (rxVenta.RecordCount > 0) and (rxVentaMoneda.IsNull) then
      rxVenta.Edit;
      rxVentaMoneda.Value:= TotalesMoneda.Value;
      if rxVenta.State in [dsEdit, dsInsert] then
      rxVenta.Post;
    end;
  end;

  if (Totalestotalneto.Value < 0) and (not EsDevolucion) then
  begin
    MessageDlg('Total neto no puede ser negativo, verifique',mtError, [mbOK], 0);
    exit;
  end;
  panel2.Visible := False;
end;

procedure TfrmProcVentaRapida.ImprimirLabel1Click(Sender: TObject);
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

procedure TfrmProcVentaRapida.NoGenerarNCF1Click(Sender: TObject);
begin
  if (GlbActivaIFiscal = 1 ) then
  begin
    Label21.Visible:=False;
    CheckBox1.Visible:=False;
  end else
  begin
    NoGenerarNCF1.Checked := not NoGenerarNCF1.Checked;
    if  NoGenerarNCF1.Checked then
    Label21.Visible := True else
    Label21.Visible := false;
    CheckBox1.Visible := Not Label21.Visible;
  end;
end;

procedure TfrmProcVentaRapida.BitBtn16Click(Sender: TObject);
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

procedure TfrmProcVentaRapida.Finalizardisplay;
var
  puerto, linea1, linea2 : String;
begin
  puerto:='1';
  linea1 :='Gracia por su compra';
  linea2 :='**************';
  WinExec(PChar('_display "'+puerto +'" "'+ linea1 +
  '" "'+ linea2 +'"'),SW_HIDE);

  //puerto:='1';
  //linea1:= '*** Total  Venta ***';
  //linea2:=Format('%8.2f',[Totalestotalneto.Value]);
  //WinExec(PChar('_display "'+puerto +'" "'+ linea1 +
  //'" "'+ linea2 +'"'),SW_HIDE);

end;

procedure TfrmProcVentaRapida.ActualizaInvAlmacen;
begin
  stpMantInvAlmacen.Params[0].Value := rxVentaCodArticulo.Value;//codigo inventario
  stpMantInvAlmacen.Params[1].Value := GlbCodDivInventario;//inventario_id
  if EsDevolucion then
  begin
    stpMantInvAlmacen.Params[2].Value := rxVentaCant.Value;
    if (rxVentaTipoUnidad.Value = 3) or (rxVentaTipoUnidad.Value = 0)  then
      stpMantInvAlmacen.Params[2].Value:= rxVentaCant.Value
    else
    begin
      stpMantInvAlmacen.Params[2].Value:= rxVentaCant.Value * CantUnidad;
    end;
  end else
  begin
    //stpMantInvAlmacen.Params[2].Value := rxVentaCant.Value * -1;
    if (rxVentaTipoUnidad.Value = 3) Or (rxVentaTipoUnidad.Value = 0) then
      stpMantInvAlmacen.Params[2].Value:= rxVentaCant.Value * -1
    else
    begin
      stpMantInvAlmacen.Params[2].Value:= rxVentaCant.Value * CantUnidad *-1;
    end;
  end;

  stpMantInvAlmacen.Params[3].Value := VarUsuarioGlb;//codigo_usuario
  stpMantInvAlmacen.Params[4].Value := ExtraerFecha(Now);//fecha_in
  stpMantInvAlmacen.Params[5].Value := strUserName;//in_por
  stpMantInvAlmacen.Params[6].Value := ExtraerFecha(Now);//fecha_mod
  stpMantInvAlmacen.Params[7].Value := strUserName;//in_por//mod_por
  stpMantInvAlmacen.Params[8].Value := 'A';//status
  stpMantInvAlmacen.ExecProc;

  if Not stpMantInvAlmacen.Transaction.InTransaction then
  stpMantInvAlmacen.Transaction.StartTransaction;
  try
    stpMantInvAlmacen.Transaction.CommitRetaining;
  except
  stpMantInvAlmacen.Transaction.RollbackRetaining;
  end;  
end;

procedure TfrmProcVentaRapida.FormHide(Sender: TObject);
begin
  isShowing:=True;
end;

procedure TfrmProcVentaRapida.qryClienteAfterScroll(DataSet: TDataSet);
begin
  AbrirClasifPrecio;
end;

procedure TfrmProcVentaRapida.qryProductosAfterScroll(DataSet: TDataSet);
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

procedure TfrmProcVentaRapida.AbrirClasifPrecio;
begin
  if rxVenta.state = dsInactive then Exit;
  if rxVenta.RecordCount = 0 then Exit;
  qryClasifPrecio.Close;//tablaPropietario.RecordCount;
  qryClasifPrecio.Params[0].Value := tablaPropietarioCodigoPropietario.Value;// qryClientePRECIO_ID.Value;
  qryClasifPrecio.Open;
  if qryClasifPrecio.RecordCount > 0 then
  DBEdit6.Color:=clGreen
  else
  DBEdit6.Color:=clWindow;
end;

procedure TfrmProcVentaRapida.AplicaPrecioMayorista;
begin
  if rxVenta.state = dsInactive then Exit;
  if rxVenta.RecordCount = 0 then Exit;
  sumarDatos:=False;
  qryClasifPrecio.Close;
  qryClasifPrecio.Params[0].Value := tablaPropietarioCodigoPropietario.Value;//qryClientePRECIO_ID.Value;
  qryClasifPrecio.Open;
  rxVenta.AutoCalcFields := False;
  rxVenta.First;
  While Not rxVenta.Eof Do
  begin
    if (rxVentaStatus.Value = 'C') then
    begin
      rxVenta.Next;
      continue;
    end;
    if qryClasifPrecio.Locate('COD_PRODUCTO', rxVentaCodArticulo.Value,[]) then
    begin
      rxVenta.Edit;
      rxVentaPrecio.Value  := qryClasifPrecioPRECIO_VENTA.Value;
    end;
    //t Ene-09-2011 else
    //t Ene-09-2011 if rxqryInv.Locate('CODIGO', rxVentaCodArticulo.Value,[]) then
    //t Ene-09-2011 begin
    //t Ene-09-2011  rxVenta.Edit;
    //t Ene-09-2011 rxVentaPrecio.Value  := rxqryInvPRECIO.Value;
    //t Ene-09-2011 end;
    if (rxVentaSerie.Value = 0) then Break;
    ProcesaCalculos;

    if rxVenta.State In [dsEdit, dsInsert] then
    rxVenta.Post;
    //WriteToLog('Post rxVenta - Line 5506');

    rxVenta.Next;
  end;

  sumarDatos:=True;
  rxVenta.AutoCalcFields := False;
end;

procedure TfrmProcVentaRapida.RxDBLookupCombo1Exit(Sender: TObject);
begin
  if rxVenta.RecordCount = 0 then exit;
  AbrirClasifPrecio;
  AplicaPrecioMayorista;
  if qryClienteUSARLEVELPRECIO.Value > 0 then
  RxSpinEdit1.Value:= qryClienteUSARLEVELPRECIO.Value;

  if not tablaPropietarioCodigoPropietario.IsNull then
  if qryClienteCOD_VENDEDOR.Value > 0 then
    GlbCodVendedor :=qryClienteCOD_VENDEDOR.Value
    else
    GlbCodVendedor := -1;
  if (rxVenta.RecordCount > 0) then
  begin
    ProcesarSumaTotal;
    rxVenta.EnableControls;
    rxdbgrid2.EnableScroll;
    //rxdbgrid2.Enabled:=true;
  end;
  Refresh;
end;

function TfrmProcVentaRapida.VerificaLimiteCredito(codigocte: integer;
  MontoVenta: Real): Boolean;
var
  limite_Credito : Real;
begin
  ibsqlBceCxcCte.Close;
  ibsqlBceCxcCte.Params[0].Value := codigocte;
  ibsqlBceCxcCte.ExecQuery;
  qryCliente.Close;
  qryCliente.Open;
  qryCliente.Locate('CODIGO_CTE', codigocte,[]);

  limite_Credito:=qryClienteLIMITE_CREDITO.Value  -
                  ibsqlBceCxcCte.FieldByName('balance_act').Value;
  if qryClienteLIMITE_CREDITO.Value = 0 then
  begin
    Result:=False;
    NoTieneCredito:=True;
    Exit;
  end else
  if limite_credito < Abs(MontoVenta) then
  begin
    NoTieneCredito := False;
    Result := False;
    //BitBtn9.SetFocus;
    Exit;
  end else Result:=True;
end;

procedure TfrmProcVentaRapida.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (rxVenta.RecordCount > 0) then
  begin
    if VerificaClave then
    begin
      CanClose := True;
      qryInventario.Close;
      qryProductos.Close;
      qryCliente.close;
    end;// else CanClose:= False;
  end;
end;

procedure TfrmProcVentaRapida.RxDBGrid3DblClick(Sender: TObject);
begin
  RxDBGrid3.Visible := False;
end;

procedure TfrmProcVentaRapida.SecretPanel1DblClick(Sender: TObject);
begin
  RxDBGrid3.Visible   := True;
  SecretPanel1.Visible:= False;
end;

procedure TfrmProcVentaRapida.NoMostrarProdVencidos1Click(Sender: TObject);
begin
  NoMostrarProdVencidos1.Checked:= Not NoMostrarProdVencidos1.Checked;
  if NoMostrarProdVencidos1.Checked Then
  begin
    SecretPanel1.Visible := True;
    SecretPanel1.Active  := True;
  end
  else SecretPanel1.Visible := False;
end;

procedure TfrmProcVentaRapida.rxLabelVenceDblClick(Sender: TObject);
begin
  RxDBGrid3.Visible:= True;
end;

{procedure TfrmProcVentaRapida.ActivaPermiso(proceso:integer; iduser:Integer; isperson:integer);
var
  X, y, z:integer;
begin

  dmusuarios.stpBuscarPermisos.Close;
  //dmusuarios.stpBuscarPermisos.Params[0].Value:=  //Out
  //dmusuarios.stpBuscarPermisos.Params[1].Value:=  //Out
  //dmusuarios.stpBuscarPermisos.Params[2].Value:=  //Out
  dmusuarios.stpBuscarPermisos.Params[0].Value:=  isperson;//Persona
  dmusuarios.stpBuscarPermisos.Params[1].Value:=  iduser;//In
  dmusuarios.stpBuscarPermisos.Open; 

  For x:=0 To frmProcVentaRapida.ControlCount - 1 Do
  begin
    if frmProcVentaRapida.controls[x].Tag > 0 then
    begin
    if dmusuarios.stpBuscarPermisos.Locate('procesoid;tareaid', Vararrayof([proceso,
    frmProcVentaRapida.controls[x].Tag]),[]) then
    begin
      if dmusuarios.stpBuscarPermisos.FieldByName('status').Value = 1 then
      frmProcVentaRapida.controls[x].Enabled:=True
      else
      begin
        frmProcVentaRapida.controls[x].Enabled:=False;
        if dmusuarios.stpBuscarPermisosVISIBLE.Value = 0 then
        frmProcVentaRapida.controls[x].Visible:=false;
      end
    end else
    begin
      frmProcVentaRapida.controls[x].Enabled:=False;
      if dmusuarios.stpBuscarPermisosVISIBLE.Value = 0 then
      frmProcVentaRapida.controls[x].Visible:=false;
    end;
    end;
  end;

  for x:=0 to ComponentCount-1 do
  begin
    if (Components[x] is TPopupMenu) then
    begin
        for y:=0 to TPopupMenu(Components[x]).Items.Count -1 do
        begin
          if TPopupMenu(Components[x]).Items[y].Tag > 0 then
          begin
            if dmusuarios.stpBuscarPermisos.Locate('procesoid;tareaid', Vararrayof([proceso,
            TPopupMenu(Components[x]).Items[y].Tag]),[]) then
            begin
              if dmusuarios.stpBuscarPermisos.FieldByName('status').Value = 1 then
              TPopupMenu(Components[x]).Items[y].Enabled:=True
              else
              begin
                TPopupMenu(Components[x]).Items[y].Enabled:=False;
                if dmusuarios.stpBuscarPermisos.FieldByName('status').Value = 1 then
                TPopupMenu(Components[x]).Items[y].Visible:=False;
              end;
            end else
            begin
              TPopupMenu(Components[x]).Items[y].Enabled:=False;
              if dmusuarios.stpBuscarPermisos.FieldByName('status').Value = 1 then
              TPopupMenu(Components[x]).Items[y].Visible:=False;
            end;
          end;
        end;
    end;

    if (Components[x] is TMainMenu) then
    begin
        for y:=0 to TMainMenu(Components[x]).Items.Count -1 do
        begin
          for z:=0 to TMainMenu(Components[x]).Items[y].Count - 1 do
          begin

            if TMainMenu(Components[x]).Items[y].Items[z].Tag > 0 then
            begin 
              if dmusuarios.stpBuscarPermisos.Locate('procesoid;tareaid', Vararrayof([proceso,
              TMainMenu(Components[x]).Items[y].Items[z].Tag]),[]) then
              begin
                if dmusuarios.stpBuscarPermisos.FieldByName('status').Value = 1 then
                TMainMenu(Components[x]).Items[y].Items[z].Enabled:=True
                else
                TMainMenu(Components[x]).Items[y].Items[z].Enabled:=False;
              end else
              TMainMenu(Components[x]).Items[y].Items[z].Enabled:=False;
            end;
          end;
        end;
    end;
  end;
end;  }




procedure TfrmProcVentaRapida.qryInventarioAfterOpen(DataSet: TDataSet);
begin
  //rxqryInv.Close;
  //rxqryInv.Open;
  //qryInventario.First;
  //While Not qryInventario.Eof do
  {begin
    rxqryInv.InsertRecord([
    qryInventarioCODIGO.Value,
    qryInventarioCODIGO_TEXTO.Value,
    qryInventarioDESCRIPCION.Value,
    qryInventarioPRECIO.Value,
    qryInventarioREFERENCIA.Value,
    qryInventarioPAGA_ITBI.Value,
    qryInventarioPRECIO_MINIMO.Value,
    qryInventarioCantidad.Value,
    qryInventarioINVENTARIAR.Value,
    qryInventarioPORC_DESCUENTO.Value,
    qryInventarioPRECIO_TIPO_UNIDAD.Value,
    qryInventarioTipo_Unidad.Value]);
    qryInventario.Next;
  end;
  rxqryInv.SortOnFields('descripcion', true, false);}
end;

procedure TfrmProcVentaRapida.rxqryInvAfterScroll(DataSet: TDataSet);
begin
  {FAplicaPrecioMayorista := False;
  Label23.Visible := False;
  if qryClasifPrecio.state = dsInactive then Exit;
  if qryClasifPrecio.Locate('COD_PRODUCTO', qryProductoscodigo.Value,[]) then
  begin
    FAplicaPrecioMayorista := True;
    Label23.Visible := True;
  end;}
end;

procedure TfrmProcVentaRapida.cboxTipoUnidadChange(Sender: TObject);
begin
  if rxVenta.State In [dsBrowse] Then
  rxVenta.Edit;

  if Not dmInventario.qryTipoUnidad.Locate('DESCRIPCION', cboxTipoUnidad.Text, []) then
  begin
    MessageDlg('Unidad no encontrada, verifique.', mtError, [mbOk], 0);
    exit;
  end else
  begin
    GlbTipoUnidad := dmInventario.qryTipoUnidadIDUNIDAD.Value;
    CantUnidad:= dminventario.qryTipoUnidadCANTIDAD.Value;
    rxVentaTipoUnidad.Value:= GlbTipoUnidad;

    if not qryProductoscodigo.Isnull And (Not PrecioCambio ) then
    if (GlbUsaEscalaPrecio = 0) and (GlbTipoUnidad <> 3) then
    rxVentaPrecio.Value  := precioXUnidad(GlbTipoUnidad, qryProductoscodigo.value); //qryProductosPRECIO_TIPO_UNIDAD.Value;
    if (rxVentaprecio.Value = 0) And (Not PrecioCambio )then
    begin
      if (GlbUsaescalaPrecio = 1) And (Not GlbUsandoCotiza Or ( rxVentaStatus.Value = 'I') ) then
      begin
        SetPrecioPorCantidad;//case
      end;
      //rxVentaPrecio.Value  := qryProductosPrecio.Value;//poner aqui regla para precio por cantidad
      cboxTipoUnidad.ItemIndex:=0;
    end;
  end;

  if rxVenta.State In [dsBrowse] Then
  rxVenta.Edit;

  //t if dmInventario.qryTipoUnidadIDUNIDAD.Value = 3  then
  //t begin
  //t   rxVentaPrecio.Value  := qryProductosPrecio.Value;
    //rxVentaCant.Value := rxVentaCant.Value * dmInventario.qryTipoUnidadCANTIDAD.Value;
  //t end;// else
  //begin
  //  MessageDlg('Precio no configurado para tipo unidad, verifique', mtError, [mbok],0);
  //end;
  rxVentaDescUnidadMedida.Value:=cboxTipoUnidad.Text;

  ProcesaCalculos;

  if rxVenta.State In [dsInsert, dsEdit] Then
  rxVenta.Post;
  //WriteToLog('Post rxVenta - Line 5778');
end;

procedure TfrmProcVentaRapida.LlenarTipoUnidadBox(umedida:integer);
begin
  dmInventario.qryTipoUnidad.First;
  cboxTipoUnidad.Items.Clear;
  CantUnidad := 0;
  qryPrecioXTipoUnidad.Close;
  qryPrecioXTipoUnidad.Params[0].Value:=qryProductosCODIGO.Value;
  qryPrecioXTipoUnidad.Open;
  While Not dmInventario.qryTipoUnidad.Eof Do
  begin
    //t if (dmInventario.qryTipoUnidadIDUNIDAD.Value = 3) Or
    //t    (dmInventario.qryTipoUnidadIDUNIDAD.Value = umedida) then
    //t begin
    if qryPrecioXTipoUnidad.Locate('ID_UNIDAD',dminventario.qryTipoUnidadIDUNIDAD.Value,[]) then
    begin
      cboxTipoUnidad.Items.Add(dmInventario.qryTipoUnidadDESCRIPCION.Value);
      cantUnidad:=dmInventario.qryTipoUnidadCANTIDAD.Value;
    end;
    //if (dmInventario.qryTipoUnidadIDUNIDAD.Value = qryProductosTipo_Unidad.value) then
    //CantUnidad := dmInventario.qryTipoUnidadCANTIDAD.Value;
    //t end;
    dmInventario.qryTipoUnidad.Next;
  end;
  if cboxTipoUnidad.Items.Count = 0 then
  begin
    if dmInventario.qryTipoUnidad.Locate('descripcion', 'UNIDAD', [loCaseInsensitive]) then
    begin
      cboxTipoUnidad.Items.Add(dmInventario.qryTipoUnidadDESCRIPCION.Value);
      cboxTipoUnidad.Text:='UNIDAD';
      cantUnidad:=1;
    end;
  end;
  if (dmInventario.qryTipoUnidad.Locate('idunidad', umedida,[])) then
  begin
    cboxTipoUnidad.Text:= dmInventario.qryTipoUnidadDESCRIPCION.Value;
    cantUnidad := dmInventario.qryTipoUnidadCANTIDAD.Value;
  end;
  if (CantUnidad = 0) then
  begin
    CantUnidad := 1;
    cboxTipoUnidad.Text:='UNIDAD';
  end;
end;

procedure TfrmProcVentaRapida.cboxTipoUnidadExit(Sender: TObject);
begin
  if rxVentaCodTexto.IsNull then exit;
  if rxVentaDescUnidadMedida.isNull or (rxVentaDescUnidadMedida.Value = '') then
  begin
    if rxVenta.State = dsBrowse then rxVenta.Edit;
    rxVentaDescUnidadMedida.Value:=cboxTipoUnidad.Text;
  end;
  cboxTipoUnidadChange(Self);
  if rxVenta.State = dsBrowse then rxVenta.Edit;

  //if (GlbTipoUnidad = 0) then GlbTipoUnidad= 1;

  if rxVenta.State In [dsedit,dsInsert] then
  rxVentaTipoUnidad.Value:=GlbTipoUnidad;
  panel2.Visible := False;  
end;

procedure TfrmProcVentaRapida.qryInventarioAfterScroll(DataSet: TDataSet);
begin
  //Activar cuando retitres rxQryInv
  FAplicaPrecioMayorista := False;
  Label23.Visible := False;
  if qryClasifPrecio.state = dsInactive then Exit;
  if qryClasifPrecio.Locate('COD_PRODUCTO', rxqryInvcodigo.Value,[]) then
  begin
    FAplicaPrecioMayorista := True;
    Label23.Visible := True;
  end;
end;

function TfrmProcVentaRapida.precioXUnidad(idTipoUnidad:Integer;idProducto: Integer): Extended;
begin
  if (idProducto > 0) then
  begin
    qryPrecioXTipoUnidad.Close;
    qryPrecioXTipoUnidad.Params[0].Value:=idProducto;
    qryPrecioXTipoUnidad.Open;
    if qryPrecioXTipoUnidad.Locate('id_unidad',idTipoUnidad,[]) then
    begin
      if Not qryPrecioXTipoUnidadPRECIO.IsNull then
      result := qryPrecioXTipoUnidadPRECIO.Value
    end else
    begin
      //if frmProcVentaRapida.Showing then
      //begin
      //  MessageDlg('Precio no configurado',mtwarning,[mbok],0);
      //  cboxTipoUnidad.SetFocus;
      //end;
      result:=rxVentaPrecio.Value;
    end;
  end;
end;

procedure TfrmProcVentaRapida.Label25Click(Sender: TObject);
begin
  if MessageDlg('Imprimir recibo cash en próxima transacción?',mtInformation,[mbyes,mbno],0) = mryes then
  begin
    GlbImprimeReciboFact := 1;
    InactivaImprecibo := true;
    label25.Font.Color :=clPurple;
  end else
  if InactivaImprecibo then
  begin
    GlbImprimeReciboFact := 0;
    InactivaImprecibo := False;
    label25.Font.Color :=clBlack;
  end;
end;

procedure TfrmProcVentaRapida.RxSpeedButton1Click(Sender: TObject);
begin
  if MessageDlg('Esta operacion guarda la venta, sin imprimir factura. Continuar?',mtInformation,[mbyes,mbno],0) = mryes then
  begin
    GlbImprimeReciboFact:=0;
    BitBtn4Click(Self);
    RxSpeedButton1.Visible:=False;
    GlbImprimeReciboFact:=1;
    ProcActUltTrn;
    ActualizarRecoverData;
  end;
end;

procedure TfrmProcVentaRapida.MaestroInventario1Click(Sender: TObject);
begin
  frmInventarioProd:=TfrmInventarioProd.Create(Nil);
  try
    frmInventarioProd.ShowModal;
  finally
  frmInventarioProd.Free;
  frmInventarioProd:=Nil;
  end;
  qryInventario.Close;
  //t qryInventario.Params[0].Value := glbCia_Key;
  qryInventario.Params[0].Value:=glbCia_Key;    
  qryInventario.Open;

  qryProductos.Close;
  //qryProductos.Params[1].Value:=glbCia_Key;
  qryProductos.Open;
  
end;

procedure TfrmProcVentaRapida.ImprimirFactura(Avance: Integer);

var
  DeviceMode: THandle;
  Device, Driver, Port: array[0..1023] of char;
  ms: Integer; //margen superior
  nLineas: Integer;

   procedure SaltarLinea;
   begin
      ms := ms + 100;
   end;
   procedure ImprimirLinea(Linea: String);
   begin
      Printer.Canvas.TextOut(10, ms, Linea);
      SaltarLinea;
   end;
begin
  //Configura la impresora
  ms:=10;
  Printer.GetPrinter(Device, Driver, Port, DeviceMode);
   
  Printer.SetPrinter('Microsoft XPS Document Writer', Driver, Port, DeviceMode);
  Printer.Title := 'Factura de Venta';
  with Printer do
  begin
    SetMapMode(Printer.Handle,MM_LOMETRIC);
    BeginDoc;
    Canvas.Font.Size:= 12;
    Canvas.Font.Name := 'ARIAL';
    //------------Datos del encabezado
    //Empresa
    ImprimirLinea('Cualquier Cosa');
    //Factura
    ImprimirLinea('Cualquier Cosa');
    //Datos del Cliente
    ImprimirLinea('RIF: ');
    ImprimirLinea('CLIENTE: ');
    ImprimirLinea('DIRECCION: ');
    SaltarLinea;
    //Encabezado
    ImprimirLinea('Can Descripcion Unitario Total');
    //Imprime los detalles
    nLineas := 0;
    rxVenta.First;
    while not rxVenta.Eof do
    begin
       ImprimirLinea(rxVentaCant.AsString+'     '+rxVentaDescripcion.Value);
       Inc(nLineas);
       rxVenta.Next;
    end;
    while nLineas < 10 do
    begin
       SaltarLinea;
       Inc(nLineas);
    end; //Rellena el numero de las lineas faltantes
    //Imprime el cierre de la factura
    ImprimirLinea('SubTotal: ');
    ImprimirLinea('Descuento: ');
    ImprimirLinea('IVA ');
    ImprimirLinea('Total: ');
    ImprimirLinea('PAGADO');
    if Avance > 0 then
    begin
       ms := ms + Avance;
       ImprimirLinea('-');
    end;
    EndDoc;
  end;
end;


procedure TfrmProcVentaRapida.cboxTipoUnidadEnter(Sender: TObject);
begin
  panel2.Visible := False;
end;

procedure TfrmProcVentaRapida.DBEdit3Exit(Sender: TObject);
begin
  if (rxVentaMontoBruto.Value = 0) or (rxVentaMontoBruto.IsNull) then
  edtCodigo.SetFocus;
end;

procedure TfrmProcVentaRapida.RxDBGrid2Enter(Sender: TObject);
begin
  GlbNumero:= rxVentaSerie.Value;
end;

procedure TfrmProcVentaRapida.RxDBGrid2Exit(Sender: TObject);
begin
  GlbNumero:= rxVentaSerie.Value;
  if Not dmInventario.qryTipoUnidad.Locate('IDUNIDAD', rxVentaTipoUnidad.Value, []) then
  begin
    if (rxVentaTipoUnidad.Value = 0) then
    begin
      if dmInventario.qryTipoUnidad.Locate('DESCRIPCION', 'UNIDAD', []) then
      begin
        GlbTipoUnidad := dmInventario.qryTipoUnidadIDUNIDAD.Value;
        CantUnidad:= dminventario.qryTipoUnidadCANTIDAD.Value;
        cboxTipoUnidad.Text := dminventario.qryTipoUnidadDESCRIPCION.Value;
      end;
    end else
    MessageDlg('Unidad no encontrada, verifique.', mtError, [mbOk], 0);
  end else
  begin
    GlbTipoUnidad := dmInventario.qryTipoUnidadIDUNIDAD.Value;
    CantUnidad:= dminventario.qryTipoUnidadCANTIDAD.Value;
    cboxTipoUnidad.Text := dmInventario.qryTipoUnidadDESCRIPCION.Value;
  end;
end;

procedure TfrmProcVentaRapida.rxVentaAfterScroll(DataSet: TDataSet);
begin
  if qryproductos.state = dsBrowse then
  if not rxVentaCodArticulo.IsNull then
  begin
    QryPrecios.Close;
    QryPrecios.Params[0].Value:=rxVentaCodArticulo.Value;
    QryPrecios.Open;
  end;
  //QryPreciosPRECIOVENTA1.value

  if rxVentaTipoUnidad.IsNull then Exit;
  if rxVentaTipoUnidad.Value = 0 then Exit;
  
  if Not dmInventario.qryTipoUnidad.Locate('IDUNIDAD', rxVentaTipoUnidad.Value, []) then
  begin
    MessageDlg('Unidad no encontrada, verifique.', mtError, [mbOk], 0);
    exit;
  end else
  begin
    GlbTipoUnidad := dmInventario.qryTipoUnidadIDUNIDAD.Value;
    CantUnidad:= dminventario.qryTipoUnidadCANTIDAD.Value;
    cboxTipoUnidad.Text := dmInventario.qryTipoUnidadDESCRIPCION.Value;
  end;

  if (rxVenta.State = dsBrowse) then
  begin
    qryProdPorProveedor.Close;
    qryProdPorProveedor.Params[0].Value:= rxVentaCodArticulo.Value;
    qryProdPorProveedor.Open;

    if qryProdPorProveedor.RecordCount > 0 then
    pnlPrecioProv.Visible:= True else
    pnlPrecioProv.Visible:= False;
  end;
end;

procedure TfrmProcVentaRapida.ConsultaGeneral1Click(Sender: TObject);
begin
  frmConsultaInventario:=TfrmConsultaInventario.Create(Nil);
  try
    if frmConsultaInventario.Showmodal = mrOk then
    edtCodigo.Text:= frmConsultaInventario.ibquery1codigo.AsString;
  finally
  frmConsultaInventario.Free;
  frmConsultaInventario:=Nil;
  end;
  if (Length(edtcodigo.Text) > 0) then
  edtcodigo.SetFocus;
  {
  frmConsultaInventario:=TfrmConsultaInventario.Create(Nil);
  try
    frmConsultaInventario.Showmodal;
  finally
  frmConsultaInventario.Free;
  frmConsultaInventario:=Nil;
  end;}
end;

procedure TfrmProcVentaRapida.BitBtn17Click(Sender: TObject);
begin
  if (Totalesmontorecibido.Value > 0) and(rxVenta.RecordCount > 0) then
  begin
    MessageDlg('Favor procesar o cancelar venta en progreso', mtInformation, [mbOK], 0);
    Exit;
  end;
  if (totales.RecordCount > 0) then
  begin
    totales.Close;
    totales.Open;
    Edit1.Text:='';
    Totales.Close;
    Totales.Open;
    Totales.Insert;
    TotalesMoneda.Value := IntToStr(GlbMonedaBase);
    TotalesSubTotal.Value:=0;
    Totalesitbis.Value:=0;
    Totalesmontodesc.Value:=0;
    Totalestotalneto.Value:=0;
    Totalesmontorecibido.Value:=0;
    Totalesdevolucion.Value:=0;
    Totales.Post;
    lblProcDev.Visible := False;
  end;
  frmConsultaPreVenta:=TfrmConsultaPreVenta.Create(Nil);
  try
    if frmConsultaPreVenta.Showmodal = mrOk then
    begin
      rxVenta.Close;
      rxVenta.Open;
      frmConsultaPreVenta.qryPreventaDet.First;
      rxPreventa.Close;
      rxPreventa.Open;
      edtObservacion.Text:=frmConsultaPreVenta.qryPreventaMasterNOMBRE_CLIENTE_GENERAL.Value;
      While Not frmConsultaPreVenta.qryPreventaDet.Eof do
      begin
        if (frmConsultaPreVenta.qryPreventaDetCANTIDAD.Value > 0)
        And (frmConsultaPreVenta.qryPreventaDetSTATUS_DET.Value = 'A') then
        begin
          rxVenta.Append;
          rxVentaglbcodVendedor.Value := qryClienteCOD_VENDEDOR.Value;
          rxVentaItbi.Value:=0;
        end;
          if EsModificandoCotiza then
          begin
            rxVentaNumeroCotiza.Value:=_NumeroCotiza;
            rxVentaStatus.Value:= 'I';
          end;
          
        if EsModificandoFactura then
        rxVentaStatus.Value:='I';

        RxSpeedButton1.Visible := True;
        CargarPreventa;
        if rxVenta.State In [dsInsert,dsEdit] then
        rxVenta.Post;
        //WriteToLog('Post rxVenta - Line 6150');
        tablaPropietario.Edit;
        tablaPropietarioCodigoPropietario.Value:= frmConsultaPreVenta.qryPreventaMasterCODIGO_CTE.Value;
        tablaPropietario.Post;

        rxPreventa.Append;
          if EsModificandoCotiza then
          begin
            rxVentaNumeroCotiza.Value:=_NumeroCotiza;
            rxVentaStatus.Value:= 'I';
          end;        
        if EsModificandoFactura then
        rxVentaStatus.Value:='I';

        rxPreventaNumero.Value:= frmConsultaPreVenta.qryPreventaMasterNUMERO.Value;
        rxPreventaSerie.Value := frmConsultaPreVenta.qryPreventaDetSerie.Value;
        rxPreventa.Post;        
        frmConsultaPreVenta.qryPreventaDet.Next;
      end;
    end;
  finally
  frmConsultaPreVenta.Free;
  frmConsultaPreVenta:=Nil;
  end;
end;

procedure TfrmProcVentaRapida.CargarPreventa;
begin
  rxVentaSerie.Value := frmConsultaPreVenta.qryPreventaDetSerie.Value;
  rxVentaFecha.Value := ExtraerFecha(GlbFechaTrnDiaria);
  rxVentaCant.Value  := frmConsultaPreVenta.qryPreventaDetCANTIDAD.Value;
  rxVentaPrecio.Value:= frmConsultaPreVenta.qryPreventaDetPRECIO.Value;
  rxVentaporc_desc.Value   := frmConsultaPreVenta.qryPreventaDetPORC_DESC_DET.Value;
  rxVentaDescripcion.Value := frmConsultaPreVenta.qryPreventaDetDESCRIPCION.Value;

  if qryProductos.Locate('CODIGO',frmConsultaPreVenta.qryPreventaDetCODIGO_PROD.Value,[]) then
  begin
    rxVentaCodTexto.Value   := qryProductosCODIGO_TEXTO.Value;
    rxVentaMonedaBase.Value := qryProductosCOD_MONEDA.Value;
    rxVentaDescripcionEspecial.Value := qryProductosDESCRIPCIONADICIONAL.Value;
    rxVentaCostoProducto.Value       := qryProductosPRECIO_COMPRA.Value;
  end;
  rxVentaReferencia.Value := qryProductosREFERENCIA.Value;
  rxVentaInvetariar.Value:= qryProductosINVENTARIAR.Value;
  rxVentaCodArticulo.Value:= frmConsultaPreVenta.qryPreventaDetCODIGO_PROD.AsInteger;
  rxVentaRutaImagen.Value := BuscarRutaImagen(frmConsultaPreVenta.qryPreventaDetCODIGO_PROD.AsInteger);
  rxVentaMonedaBase.Value := qryProductosCOD_MONEDA.Value;
  rxVentaCodUsuario.Value := frmConsultaPreVenta.qryPreventaMasterCODIGO_VENDEDOR.Value;
  ProcesaCalculos;
end;

procedure TfrmProcVentaRapida.ActualizarPreventa;
begin
  if rxPreventa.State = dsInactive then exit;
  rxPreventa.First;
  if (rxPreventa.RecordCount > 0) then
  begin
    ibsqlDeletePreventaMaster.Params[0].Value:= rxPreventaNumero.Value;
    ibsqlDeletePreventaMaster.ExecQuery;
    ibsqlDeletePreventaDet.Params[0].Value:= rxPreventaNumero.Value;
    ibsqlDeletePreventaDet.ExecQuery;
  end;
end;

procedure TfrmProcVentaRapida.InsertaTransCafeteria(numTrn : Integer;codigoP:Integer;cantP:Real);
begin
  dmVentas.tblTransCafeteria.Append;
  dmVentas.tblTransCafeteriaSERIE.Value:=FsqlMaxNumero('trans_cafeteria','serie');
  dmVentas.tblTransCafeteriaNUMERO.Value:= numTrn;
  dmVentas.tblTransCafeteriaCODIGO_PROD.Value:= codigoP;
  dmVentas.tblTransCafeteriaCANT.Value:= cantP;
  dmVentas.tblTransCafeteriaCOD_USUARIO.Value:= VarUsuarioGlb;
  dmVentas.tblTransCafeteriaFECHA_IN.Value:= now;
  dmVentas.tblTransCafeteriaIN_POR.Value:= strUserName;
  dmVentas.tblTransCafeteriaSTATUS.Value:='A';
  dmVentas.tblTransCafeteria.Post;
  dmVentas.tblTransCafeteria.ApplyUpdates;
  if not dmVentas.tblTransCafeteria.Transaction.InTransaction then
  dmVentas.tblTransCafeteria.Transaction.StartTransaction;
  try
    dmVentas.tblTransCafeteria.Transaction.CommitRetaining;
  except
  dmVentas.tblTransCafeteria.Transaction.RollbackRetaining;
  end;

  //Actualizar inventario ingredientes cafeteria
  ibStpActualizaInvProd.Params[0].Value:= codigoP;
  if (rxVentaTipoUnidad.Value = 3) Or (rxVentaTipoUnidad.Value = 0) then
  ibStpActualizaInvProd.Params[1].Value:= rxVentaCant.Value * cantP
    else
    begin
      ibStpActualizaInvProd.Params[1].Value:= rxVentaCant.Value * cantP;
    end;
    if Not EsDevolucion then
    ibStpActualizaInvProd.Params[2].Value     := 0//tipoTrn
    else ibStpActualizaInvProd.Params[2].Value:= 1;//ingresar al inventario
    ibStpActualizaInvProd.Params[3].Value     := 1;//porCodigo
    //if (rxVentaInvetariar.Value <> 0) And (GlbCodDivInventario = 1 ) then
    ibStpActualizaInvProd.ExecProc;
  if not ibStpActualizaInvProd.Transaction.InTransaction then
  ibStpActualizaInvProd.Transaction.StartTransaction;
  try
    ibStpActualizaInvProd.Transaction.CommitRetaining;
  except
  ibStpActualizaInvProd.Transaction.RollbackRetaining;
  end;
end;

procedure TfrmProcVentaRapida.Label26Click(Sender: TObject);
begin
  dmVentas.qryIngredienteCaf.Close;
  dmVentas.qryIngredienteCaf.Params[0].Value:=rxVentaCodArticulo.Value;
  dmVentas.qryIngredienteCaf.Open;
  frmVerIngredientes:=TfrmVerIngredientes.Create(nil);
  try
    frmVerIngredientes.Showmodal;
  finally
  frmVerIngredientes.free;
  frmVerIngredientes:=nil;
  end;
end;

procedure TfrmProcVentaRapida.SpeedButton1Click(Sender: TObject);
begin
  if (GlbColegio = 0) then
  begin
  FrmBuscarClientesPersonas:=TFrmBuscarClientesPersonas.Create(nil);
  try
    FrmBuscarClientesPersonas.CodigoCliente := -1;
    if FrmBuscarClientesPersonas.Showmodal = mrOk then
    begin
      if tablaPropietario.State In [dsBrowse] then
      tablaPropietario.Edit;
      tablaPropietarioCodigoPropietario.Value:=FrmBuscarClientesPersonas.CodigoCliente;
    end;
  finally
  FrmBuscarClientesPersonas.Free;
  FrmBuscarClientesPersonas:=Nil;
  end;
  end else
  begin
  frmBuscarEstudiantes:=TfrmBuscarEstudiantes.Create(nil);
  try
    frmBuscarEstudiantes.CodigoCliente := -1;
    if frmBuscarEstudiantes.Showmodal = mrOk then
    begin
      if tablaPropietario.State In [dsBrowse] then
      tablaPropietario.Edit;
      tablaPropietarioCodigoPropietario.Value:=frmBuscarEstudiantes.CodigoCliente;
    end;
  finally
  frmBuscarEstudiantes.Free;
  frmBuscarEstudiantes:=Nil;
  end;
  end;
end;

procedure TfrmProcVentaRapida.rdgFactServicioClick(Sender: TObject);
begin
  panelDescripcionServ.Visible:=True;
  if rxVenta.RecordCount = 0 then exit;
  if CheckBox2.Checked then
  CheckBox3.Checked:=False;
  rxVenta.Edit;
  ProcesaCalculos;
end;

procedure TfrmProcVentaRapida.rdgFactVentaProductoClick(Sender: TObject);
begin
  //panelDescripcionServ.Visible:=False;
  if rxVenta.RecordCount = 0 then exit;
  if CheckBox2.Checked then
  CheckBox3.Checked:=False;
  rxVenta.Edit;
  ProcesaCalculos;
end;

procedure TfrmProcVentaRapida.ProcInsertarRecoverData;
begin
  if tblRecovertrans.State = dsInactive then
  tblRecovertrans.Open; 
  if tblRecovertrans.Locate('serie;fecha;COD_USUARIO',
  VarArrayOF([rxVentaSerie.Value,rxVentaFecha.Value,VarUsuarioGlb]), []) then
  tblRecovertrans.edit
  else
  tblRecovertrans.Append;
  tblRecovertransCOD_USUARIO.Value:= VarUsuarioGlb;
  tblRecovertransSERIE.Value:= rxVentaSerie.Value;
  tblRecovertransFECHA.Value:= rxVentaFecha.Value;
  tblRecovertransNUMERO.Value:= rxVentaNumeroTrn.Value;
  tblRecovertransCODIGO_PROD.Value:= rxVentaCodTexto.Value;
  tblRecovertransCODIGO_BARRA.Value := rxVentaCodTexto.Value;
  tblRecovertransDESCRIPCION.Value:= rxVentaDescripcion.Value;
  tblRecovertransCANTIDAD.Value:= rxVentaCant.Value;
  tblRecovertransPRECIO.Value:= rxVentaPrecio.Value;
  tblRecovertransPORC_DESC_DET.Value:= rxVentaporc_desc.Value;
  tblRecovertransITBI_DET.Value:= rxVentaItbi.Value;
  tblRecovertransVALOR_SERVICIO_DET.Value:= rxVentaMontoBruto.Value;
  tblRecovertransVALOR_TOTAL_DET.Value:= rxVentaMontoNeto.Value;
  tblRecovertransNUM_FACTURA.Value:= rxVentaNumeroFactura.Value;
  if (tblRecovertrans.State = dsInsert) then
  tblRecovertransSTATUS_DET.Value:= 'A';
  tblRecovertransSERIE_PROD.Value:= rxVentaSerieProd.Value;
  tblRecovertransTIPO_UNIDAD.Value:= rxVentaTipoUnidad.Value;
  tblRecovertransITBIS_EXENTO.Value:= rxVentaItbisExento.Value;
  //tblRecovertransTIPO_VENTA.Value:=
  tblRecovertransDESCRIPCIONPRODUCTO.Value:=rxVentaDescripcionEspecial.Value;
  if rdgFactServicio.Checked then
  tblRecovertransTIPO_OPE.Value:= 0
  else  //0-Factura servicio
  tblRecovertransTIPO_OPE.Value:= 1;
  tblRecovertransPRECIO_LEVEL.Value:=RxSpinEdit1.AsInteger;
  tblRecovertrans.Post;
  tblRecovertrans.ApplyUpdates;

  if not tblRecovertrans.Transaction.InTransaction then
  tblRecovertrans.Transaction.StartTransaction;
  try
    tblRecovertrans.Transaction.CommitRetaining;
  Except
  tblRecovertrans.Transaction.RollbackRetaining;
  end;
end;

procedure TfrmProcVentaRapida.ProcRecoverData(showsms:boolean);
begin
  exit;//temporal
  edit1.Text:='';
  tblRecovertrans.Close;
  tblRecovertrans.Open;
  tblRecovertrans.First;
  if (tblRecovertrans.RecordCount = 0) and (showsms) then
  begin
    MessageDlg('No hay datos para recuperar.', mtInformation,[mbok],0);
    exit;
  end;
  While Not tblRecovertrans.Eof Do
  begin
    WriteToLog('Recoverda data rxVenta - Line 6390');
    rxVenta.Append;
    rxVentaglbcodVendedor.Value := qryClienteCOD_VENDEDOR.Value;
    rxVentaItbi.Value  := 0;
    rxVentaSerie.Value := tblRecovertransSERIE.Value;
    rxVentaFecha.Value := tblRecovertransFECHA.Value;
    rxVentaNumeroTrn.Value:= tblRecovertransNUMERO.Value;
    rxVentaCodTexto.Value := tblRecovertransCODIGO_PROD.Value;
    rxVentaCodTexto.Value := tblRecovertransCODIGO_BARRA.Value;
    rxVentaDescripcion.Value := tblRecovertransDESCRIPCION.Value;
    rxVentaCant.Value := tblRecovertransCANTIDAD.Value;
    rxVentaPrecio.Value := tblRecovertransPRECIO.Value;
    rxVentaporc_desc.Value := tblRecovertransPORC_DESC_DET.Value;
    rxVentaItbi.Value := tblRecovertransITBI_DET.Value;
    rxVentaMontoBruto.Value := tblRecovertransVALOR_SERVICIO_DET.Value;
    rxVentaMontoNeto.Value := tblRecovertransVALOR_TOTAL_DET.Value;
    //rxVentaNumeroFactura.Value := tblRecovertransNUM_FACTURA.Value;
    //tblRecovertransSTATUS_DET.Value:= 'A';
    rxVentaSerieProd.Value := tblRecovertransSERIE_PROD.Value;
    rxVentaTipoUnidad.Value := tblRecovertransTIPO_UNIDAD.Value;
    rxVentaItbisExento.Value := tblRecovertransITBIS_EXENTO.Value;
    //tblRecovertransTIPO_VENTA.Value:=
    rxVentaDescripcionEspecial.Value := tblRecovertransDESCRIPCIONPRODUCTO.Value;
    if tblRecovertransTIPO_OPE.Value = 0 then
    rdgFactServicio.Checked:=True
    else
    rdgFactVentaProducto.Checked:=True;

    //if rdgFactServicio.Checked then
    //tblRecovertransTIPO_OPE.Value:= 0
    //else  //0-Factura servicio

    //tblRecovertransTIPO_OPE.Value:= 1;
    RxSpinEdit1.AsInteger := tblRecovertransPRECIO_LEVEL.Value;
    rxVenta.Post;
    //WriteToLog('Post rxVenta - Line 6420');
    tblRecovertrans.Next;
  end;
end;

procedure TfrmProcVentaRapida.ActualizarRecoverData;
begin
  tblRecovertrans.Close;
  tblRecovertrans.Open;
  tblRecovertrans.First;
  While Not tblRecovertrans.eof do
  begin
    if (tblRecovertransSTATUS_DET.Value = 'A') then
    begin
      tblRecovertrans.Edit;
      tblRecovertransSTATUS_DET.Value:='R';
      tblRecovertrans.ApplyUpdates;

      if not tblRecovertrans.Transaction.InTransaction then
      tblRecovertrans.Transaction.StartTransaction;
      try
        tblRecovertrans.Transaction.CommitRetaining;
      Except
      tblRecovertrans.Transaction.RollbackRetaining;
      end;
    end;
    tblRecovertrans.Next;
  end;
  EliminarRecoverDataAll;
end;

procedure TfrmProcVentaRapida.DBMemo1Exit(Sender: TObject);
begin
  if rxVenta.State In [dsEdit, dsInsert] then
  rxVenta.Post;
  //WriteToLog('Post rxVenta - Line 6455');
end;

procedure TfrmProcVentaRapida.RecuperarTransacciones1Click(
  Sender: TObject);
begin
  recuperando := true;
  ProcRecoverData(true);
  recuperando := false;
end;

procedure TfrmProcVentaRapida.EliminarRecoverData;
begin
  tblRecovertrans.Close;
  tblRecovertrans.Open;
  if tblRecovertrans.Locate('serie;fecha;cod_usuario',
  VarArrayOF([rxVentaSerie.Value,rxVentaFecha.Value,VarUsuarioGlb]), []) then
  begin
    tblRecovertrans.Delete;
    tblRecovertrans.ApplyUpdates;

    if Not tblRecovertrans.Transaction.InTransaction then
    tblRecovertrans.Transaction.StartTransaction;
    try
      tblRecovertrans.Transaction.CommitRetaining;
    except
    tblRecovertrans.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmProcVentaRapida.EliminarRecoverDataAll;
begin
  tblRecovertrans.Close;
  tblRecovertrans.Open;
  tblRecovertrans.First;
  while not tblRecovertrans.Eof Do
  begin
    if (tblRecovertransSTATUS_DET.Value = 'R') And (tblRecovertransCOD_USUARIO.Value = VarUsuarioGlb) then
    begin
      tblRecovertrans.Delete;
      tblRecovertrans.ApplyUpdates;

      if Not tblRecovertrans.Transaction.InTransaction then
      tblRecovertrans.Transaction.StartTransaction;
      try
        tblRecovertrans.Transaction.CommitRetaining;
      except
      tblRecovertrans.Transaction.RollbackRetaining;
      end;
    end;
  end;
end;

procedure TfrmProcVentaRapida.RxSpinEdit1Change(Sender: TObject);
var
  guardarRec : TBookMark;
begin
  guardarRec := rxVenta.GetBookmark;
  if rxVenta.State = dsBrowse then
  rxVenta.Edit;
  if rxVentaCodArticulo.IsNull then Exit;
  if GlbUsaescalaPrecio =1 then
  begin
    if QryPrecios.Locate('Codigo', rxVentaCodArticulo.Value, []) then
    begin
      case RxSpinEdit1.AsInteger of
         1: begin
              if QryPreciosPRECIOVENTA1.Value > 0 then
              rxVentaPrecio.Value  := QryPreciosPRECIOVENTA1.Value;
            end;
         2: begin
              if QryPreciosPRECIOVENTA2.Value > 0 then
              rxVentaPrecio.Value  := QryPreciosPRECIOVENTA2.Value;
            end;
         3:begin
             if QryPreciosPRECIOVENTA3.Value > 0 then
             rxVentaPrecio.Value  := QryPreciosPRECIOVENTA3.Value;
           end;
         4: begin
              if QryPreciosPRECIOVENTA4.Value > 0 then
              rxVentaPrecio.Value  := QryPreciosPRECIOVENTA4.Value;
            end;
    end;//case
    end else //qryProductos.Sql.Text
    MessageDlg('Codigo producto no existe, verifique.', mtError, [mbOk],0);
  end;
  //if rxVenta.State = dsEdit then
  //rxVenta.Post;

  if rxVenta.state = dsbrowse then
  rxVenta.Edit;
  ProcesaCalculos;

  rxVenta.GotoBookmark(guardarRec);
  rxventa.FreeBookmark(guardarRec);
end;

procedure TfrmProcVentaRapida.CalcularDescIndirecto;
var
  x : Integer;
  porItbi : Real;
begin
  porItbi := FGlbPorcItbi(ExtraerFecha(rxVentaFecha.Value),-1);
  for x:=1 to 5 do
  begin
    ibsqlGetPorcDescFctSvr.Close;
    ibsqlGetPorcDescFctSvr.Params[0].Value:= x;
    ibsqlGetPorcDescFctSvr.ExecQuery;
    case ibsqlGetPorcDescFctSvr.FieldByName('tipo').AsInteger of
      1: begin
          if CheckBox3.Checked then
          begin
          TotalesMontoDescGastosAdmin.Value:=
          TotalesSubTotal.Value * ibsqlGetPorcDescFctSvr.FieldByName('Porciento').AsFloat / 100;
          TotalesPorcGAdmin.Value:=' '+ibsqlGetPorcDescFctSvr.FieldByName('Porciento').AsString+'%';
          dmFactura.stpInsertPorcOtrosCargosFServ.Params[1].Value:=ibsqlGetPorcDescFctSvr.FieldByName('Porciento').AsFloat;
          TotalesTPorcGAdmin.Value:=ibsqlGetPorcDescFctSvr.FieldByName('Porciento').AsFloat;
          end;
         end;
      2: begin
          if CheckBox3.Checked then
          begin
          TotalesMontoDescItbisGastosAdmin.Value:=
          TotalesMontoDescGastosAdmin.Value * ibsqlGetPorcDescFctSvr.FieldByName('Porciento').AsFloat / 100;
          TotalesPorcItbisGAdmin.Value:=' '+ibsqlGetPorcDescFctSvr.FieldByName('Porciento').AsString+'%';
          dmFactura.stpInsertPorcOtrosCargosFServ.Params[2].Value:=ibsqlGetPorcDescFctSvr.FieldByName('Porciento').AsFloat;
          TotalesTPorcItbisGAdmin.Value:=ibsqlGetPorcDescFctSvr.FieldByName('Porciento').AsFloat;
          end;
         end;
      3: begin
          TotalesMontoDescTransp.Value:=
          TotalesSubTotal.Value * ibsqlGetPorcDescFctSvr.FieldByName('Porciento').AsFloat / 100;
          TotalesPorcTrans.Value:=' '+ibsqlGetPorcDescFctSvr.FieldByName('Porciento').AsString+'%';
          dmFactura.stpInsertPorcOtrosCargosFServ.Params[3].Value:=ibsqlGetPorcDescFctSvr.FieldByName('Porciento').AsFloat;
          TotalesTPorcTrans.Value:=ibsqlGetPorcDescFctSvr.FieldByName('Porciento').AsFloat;          
         end;
      4: begin
          TotalesMontoDescDirtecnica.Value:=
          TotalesSubTotal.Value * ibsqlGetPorcDescFctSvr.FieldByName('Porciento').AsFloat / 100;
          TotalesPorcDirTec.Value:=' '+ibsqlGetPorcDescFctSvr.FieldByName('Porciento').AsString+'%';
          dmFactura.stpInsertPorcOtrosCargosFServ.Params[4].Value:=ibsqlGetPorcDescFctSvr.FieldByName('Porciento').AsFloat;
          TotalesTPorcDirTec.Value:=ibsqlGetPorcDescFctSvr.FieldByName('Porciento').AsFloat;          
         end;
      5: begin
          TotalesMontoDescItbisDirTecnica.Value:=
          TotalesMontoDescDirtecnica.Value * ibsqlGetPorcDescFctSvr.FieldByName('Porciento').AsFloat / 100;
          TotalesPorcItbisDirTec.Value:=' '+ibsqlGetPorcDescFctSvr.FieldByName('Porciento').AsString+'%';
          dmFactura.stpInsertPorcOtrosCargosFServ.Params[5].Value:=ibsqlGetPorcDescFctSvr.FieldByName('Porciento').AsFloat;
          TotalesTPorcItbisDirTec.Value:=ibsqlGetPorcDescFctSvr.FieldByName('Porciento').AsFloat;
         end;
    end;//case
  end;//for
  TotalesMontoDescImprevisto.Value:= 0;
  TotalesMontoDescItbisImprevisto.Value:= 0;
  if CheckBox2.Checked then
  begin
    TotalesMontoDescImprevisto.Value:=
    TotalesSubTotal.Value * 4 / 100;
    TotalesMontoDescItbisImprevisto.Value :=
    TotalesMontoDescImprevisto.Value * porItbi/100;
    TotalesPorcImprevisto.Value:=' 4%';
    TotalesPorcItbisImprevisto.Value:=' '+FloatToStr(porItbi)+'%';
    TotalesTPorcItbisImprevisto.Value:=porItbi;
    dmFactura.stpInsertPorcOtrosCargosFServ.Params[7].Value:=4;
    TotalesTPorcImprevisto.Value:=4;
  end;// else
  //if CheckBox3.Checked then
  //begin
  //  TotalesMontoDescImprevisto.Value:=
  //  TotalesSubTotal.Value * 3 / 100;
  //  TotalesMontoDescItbisImprevisto.Value :=
  //  TotalesMontoDescImprevisto.Value * porItbi/100;
  //  TotalesPorcImprevisto.Value:=' 3%';
  //  TotalesPorcItbisImprevisto.Value:=' '+FloatToStr(porItbi)+'%';
  //  dmFactura.stpInsertPorcOtrosCargosFServ.Params[6].Value:=3;
  //  TotalesTPorcItbisImprevisto.Value:=porItbi;
  //  TotalesTPorcImprevisto.Value:=3;
  //end;
  if (TotalesMontoSubTotalIndirectos.Value > 0) then
  begin
    DBText8.Visible := True;
    DBText8.BringToFront;
    Label29.Visible:=True;
    Label29.BringToFront;
  end;
end;

procedure TfrmProcVentaRapida.BitBtn18Click(Sender: TObject);
begin
  frmVerDescFactServicio:=TfrmVerDescFactServicio.Create(Nil);
  try
    frmVerDescFactServicio.ShowModal;
  finally
  frmVerDescFactServicio.Free;
  frmVerDescFactServicio:=Nil;
  end;
end;

procedure TfrmProcVentaRapida.TotalesCalcFields(DataSet: TDataSet);
begin
  TotalesMontoSubTotalIndirectos.Value  :=
  TotalesMontoDescGastosAdmin.Value  +
  TotalesMontoDescItbisGastosAdmin.Value +
  TotalesMontoDescTransp.Value   +
  TotalesMontoDescDirtecnica.Value +
  TotalesMontoDescItbisDirTecnica.Value +
  TotalesMontoDescImprevisto.Value      +
  TotalesMontoDescItbisImprevisto.Value;
  
  TotalesDiferencia.Value :=
  Totalestotalneto.Value -
  (TotalesMontoEnEfectivo.Value +
  TotalesMontoEnTarjeta.Value +
  TotalesMontoEnCheque.Value +
  TotalesMontoEnBonos.Value +
  TotalesMontoNCRAplicado.Value
  );
end;

procedure TfrmProcVentaRapida.CheckBox2Exit(Sender: TObject);
begin
  if rxVenta.RecordCount = 0 then exit;
 // if CheckBox2.Checked then
 // CheckBox3.Checked:=False;
  //if (checkbox2.Checked) And (rxVentaCant.Value > 0) then
  //begin
    if (rxVenta.State = dsBrowse) then
    rxVenta.Edit;
    ProcesaCalculos;
  //end;
end;

procedure TfrmProcVentaRapida.CheckBox3Exit(Sender: TObject);
begin
  if rxVenta.RecordCount = 0 then exit;
  //if CheckBox3.Checked then
  //CheckBox2.Checked:=False;
//  if (checkbox3.Checked) And (rxVentaCant.Value > 0) then
//  begin
    rxVenta.Edit;
    ProcesaCalculos;
//  end;
end;

procedure TfrmProcVentaRapida.BitBtn19Click(Sender: TObject);
var
  nF : integer;
begin
  nF := StrtoInt(InputBox('Re-Imprimir Factura','Entre #Factura',''));
  ImpFacturaservicio(nf,true);
end;

procedure TfrmProcVentaRapida.ExportarGridExcel;
const
  xlWBATWorksheet = -4167;

var
  rangoExcel : Variant;
  i, fila : integer;
  mMarcador : Tbookmarkstr;
  aplicacionExcel : Olevariant;

begin
  //put code here
end;

procedure TfrmProcVentaRapida.BitBtn20Click(Sender: TObject);
begin
  frmListadoCostoProdProveedor:=TfrmListadoCostoProdProveedor.Create(Nil);
  try
    frmListadoCostoProdProveedor.AbrirQuery(qryProdPorProveedor.Params[0].Value);
    frmListadoCostoProdProveedor.Showmodal;
  finally
  frmListadoCostoProdProveedor.Free;
  frmListadoCostoProdProveedor:=Nil;
  end;
end;

procedure TfrmProcVentaRapida.ModificarFactura1Click(Sender: TObject);
begin
  frmConsultaFacturas:=TfrmConsultaFacturas.Create(Nil);
  try
    if frmConsultaFacturas.Showmodal = mrOK then
    begin
      if VerificaClave then
      begin
        if frmConsultaFacturas.rdgContado.Checked then
        esContado:=True
        else esContado:=False;
        if esContado then
        numerodocReimp := dmFactura.qryVentaFacturaNUMERO_DOC_PAGO.AsInteger;
        CargarDatosAModificar;
        ActivarBotonesEnModifica;
        //bitBtnEditarFact.Left:=713;
        bitBtnEditarFact.Left:=BitBtn6.Left;
      end;//aquivoyyyyyyyyyyyyy
    end;
  finally
  frmConsultaFacturas.Free;
  frmConsultaFacturas:= Nil;
  end;
  //dmfactura.qryVentaFacturaDet.Close;
  //dmfactura.qryVentaFacturaDet.Params[0].Value:= 0;//temporal;
  //dmfactura.qryVentaFacturaDet.Open;
  BitBtn7.Enabled:=True;
  Refresh;
end;

procedure TfrmProcVentaRapida.CargarDatosAModificar;
var
  xDesc : String;
begin
  if ((UpperCase(GLBFormatoFactura) = 'INGESERVIS')) then
  rdgFactServicio.Checked:=true;//Debe cargar esto desde la tabla
  if (Totalesmontorecibido.Value > 0) and(rxVenta.RecordCount > 0) then
  begin
    MessageDlg('Favor procesar o cancelar venta en progreso', mtInformation, [mbOK], 0);
    Exit;
  end;
  //if (totales.RecordCount > 0) then
  //begin
    totales.Close;
    totales.Open;
    Edit1.Text:='';
    Totales.Close;
    Totales.Open;
    Totales.Insert;
    TotalesMoneda.Value   := Trim(dmFactura.qryVentaFacturaMONEDA.Value); // IntToStr(GlbMonedaBase);
    TotalesSubTotal.Value :=0;
    Totalesitbis.Value    :=0;
    Totalesmontodesc.Value:=0;
    Totalestotalneto.Value:=0;
    Totalesmontorecibido.Value:= 0;
    Totalesdevolucion.Value   := 0;
    Totales.Post;
    lblProcDev.Visible := False;
  //end;
  EsModificandoFactura:=True;
  bitBtnEditarFact.Visible := True;
  bitBtnEditarFact.Top := 490;
  bitBtnEditarFact.BringToFront;
  Label36.Visible:=True;
  Label36.Caption:='Modificando Factura:' + dmFactura.qryVentaFacturaNUMERO_FACTURA.AsString;
  rxVenta.Close;
  rxVenta.Open;
  qryProductos.Close;
  qryProductos.Open;
  AsignarSqlText('','','');
  dmFactura.qryVentaFacturaDet.First;
  While Not dmFactura.qryVentaFacturaDet.Eof do
  begin    
    if not qryProductos.Locate('Codigo', dmFactura.qryVentaFacturaDetCODIGO_PROD.Value,[]) then
    begin
      MessageDlg(Format('Codigo producto %s no encontrado, verifique.',[dmFactura.qryVentaFacturaDetCODIGO_PROD.AsString]),mtError,[mbOk], 0);
    end;
    WriteToLog('Post rxVenta - Line 6811');
    rxVenta.Append;
    rxVentaglbcodVendedor.Value := qryClienteCOD_VENDEDOR.Value;
    rxVentaItbi.Value := 0;
    rxVentaNumeroFactura.Value:=dmFactura.qryVentaFacturaDetNUMERO_FACTURA.Value;
    if dmFactura.qryVentaFacturaDetSTATUS_DET.IsNull then
    rxVentaStatus.Value   := 'A' else
    rxVentaStatus.Value   := dmFactura.qryVentaFacturaDetSTATUS_DET.Value;
    RxSpeedButton1.Visible:= True;
    //if qryProductos.Locate('CODIGO',dmFactura.qryVentaFacturaDetCODIGO_PROD.Value,[]) then
    rxVentaCodTexto.Value      := qryProductosCODIGO_TEXTO.Value;
    rxVentaCostoProducto.Value := dmfactura.qryVentaFacturadetPrecio_Compra.Value;
    rxVentaCodArticulo.Value   := dmFactura.qryVentaFacturaDetCODIGO_PROD.AsInteger;
    rxVentaSerieOriginal.Value := dmFactura.qryVentaFacturaDetSERIE.Value;
    rxVentaNumeroTrnOriginal.Value := dmFactura.qryVentaFacturaNUMERO.Value;
    rxVentaSerie.Value := dmFactura.qryVentaFacturaDetSERIE.Value;
    rxVentaFecha.Value := dmFactura.qryVentaFacturaFECHA.Value;
    rxVentaCant.Value  := dmFactura.qryVentaFacturaDetCANTIDAD.Value;
    rxVentaPrecio.Value:= dmFactura.qryVentaFacturaDetPRECIO.Value;
    rxVentaporc_desc.Value      := dmFactura.qryVentaFacturaDetPORC_DESC_DET.Value;
    rxVentaglbcodVendedor.Value := dmFactura.qryVentaFacturaCODIGO_VENDEDOR.Value;
    rxVentaPorcDescItem.Value   := dmFactura.qryVentaFacturaDetPORC_DESC_ITEM.Value;
    rxVentaMontoDescItem.Value  := dmFactura.qryVentaFacturaDetMONTO_DESC_ITEM.Value;
    rxVentaDescripcion.Value := dmFactura.qryVentaFacturaDetDESCRIPCION.Value;
    rxVentaDescripcionEspecial.Value := dmFactura.qryVentaFacturaDetDESCRIPCIONPRODUCTO.Value;
    xDesc := StringReplace(rxVentaDescripcionEspecial.Value, rxVentaDescripcion.Value, '',
                          [rfReplaceAll, rfIgnoreCase]);
    if (Length(xDesc) > 4) then
    rxVentaDescripcionEspecial.Value := xDesc
    else
    rxVentaDescripcionEspecial.Value := '';
    rxVentaItbisExento.Value:=dmfactura.qryVentaFacturaDetITBIS_EXENTO.Value;// qryProductosPAGA_ITBI.Value;

    rxVentaReferencia.Value := qryProductosREFERENCIA.Value;
    if Totales.State = dsBrowse then
    Totales.Edit;
    TotalesCodCliente.Value:=dmFactura.qryVentaFacturaCODIGO_CTE.Value;
    TotalesComentario.Value := dmfactura.qryVentaFacturaCOMENTARIO.Value;
    TotalesPorcDesAdicional.Value:= dmFactura.qryVentaFacturaPORC_DESCUENTO.Value;
    TotalesMontoDescAdicional.Value :=  dmFactura.qryVentaFacturaMONTO_DESCUENTO.Value;

    rxVentaInvetariar.Value:= qryProductosINVENTARIAR.Value;
    if  (dmFactura.qryVentaFacturaTIPO_FACTURA.Value = 0) and ((UpperCase(GLBFormatoFactura) = 'INGESERVIS')) then
    rdgFactServicio.Checked:= True
    else
    if  (dmFactura.qryVentaFacturaTIPO_FACTURA.Value = 1) then
    rdgFactVentaProducto.Checked:= True;

    if (dmFactura.qryVentaFacturaAPLICA_TIPODESC.Value = 1) then
    CheckBox2.Checked:=True
    else
    if (dmFactura.qryVentaFacturaAPLICA_TIPODESC.Value = 2) then
    CheckBox3.Checked:=True;

    if (rxVenta.State = dsBrowse) then
    rxVenta.Edit;

    edtObservacion.Text := dmfactura.qryVentaFacturaNOMBRE_CLIENTE_GENERAL.Value;
    if GlbcodVendedor > 0 then
    rxVentaCodUsuario.Value := GlbcodVendedor
    else
    rxVentaCodUsuario.Value := VarUsuarioGlb;

    ProcesaCalculos;
    CheckBox2Exit(Self);
    DBEdit2Exit(Self);
    if rxVenta.State In [dsInsert,dsEdit] then
    rxVenta.Post;
    //WriteToLog('Post rxVenta - Line 6872');

    tablaPropietario.Edit;
    tablaPropietarioCodigoPropietario.Value:=
    dmFactura.qryVentaFacturaCODIGO_CTE.Value;
    tablaPropietario.Post;
    dmFactura.qryVentaFacturaDet.Next;
  end;
  {sumarDatos:=True;
  rxVenta.Edit;
  rxVenta.Post; }
end;

procedure TfrmProcVentaRapida.ActualizaVentaDet;
begin
  if (rxVentaStatus.Value = 'C') then //eliminar
  begin
    dmfactura.ibsqlEliminarSerieVentaDet.Params[0].Value:=rxVentaSerieOriginal.Value;
    dmfactura.ibsqlEliminarSerieVentaDet.ExecQuery;
    if Not dmfactura.ibsqlEliminarSerieVentaDet.Transaction.InTransaction then
    dmfactura.ibsqlEliminarSerieVentaDet.Transaction.StartTransaction;
    try
      dmfactura.ibsqlEliminarSerieVentaDet.Transaction.CommitRetaining;
    except
    dmfactura.ibsqlEliminarSerieVentaDet.Transaction.RollbackRetaining;
  end;
  end else
  if (rxVentaStatus.Value = 'I') then //record nuevo
  InsertarDet(dmfactura.qryVentaFacturaDetNUMERO.Value)
  else
  begin
    stpUpdateVentaDetU1.Params[0].Value := rxVentaSerieOriginal.Value;
    stpUpdateVentaDetU1.Params[1].Value := rxVentaNumeroTrnOriginal.Value;
    stpUpdateVentaDetU1.Params[2].Value := rxVentaCodArticulo.Value;
    stpUpdateVentaDetU1.Params[3].Value := null;
    stpUpdateVentaDetU1.Params[4].Value := rxVentaDescripcion.Value;
    stpUpdateVentaDetU1.Params[5].Value := rxVentaCant.Value;
    stpUpdateVentaDetU1.Params[6].Value := rxVentaPrecio.Value;
    stpUpdateVentaDetU1.Params[7].Value := rxVentaporc_desc.Value;
    stpUpdateVentaDetU1.Params[8].Value := rxVentaItbi.Value;
    stpUpdateVentaDetU1.Params[9].Value := rxVentaMontoBruto.Value;
    stpUpdateVentaDetU1.Params[10].Value:= rxVentaMontoNeto.Value;
    stpUpdateVentaDetU1.Params[11].Value:= rxVentaNumeroFactura.Value;
    stpUpdateVentaDetU1.Params[12].Value:= rxVentaStatus.Value;
    stpUpdateVentaDetU1.Params[13].Value:= NOW;
    stpUpdateVentaDetU1.Params[14].Value:= strUserName;
    stpUpdateVentaDetU1.Params[15].Value:= null;
    stpUpdateVentaDetU1.Params[16].Value:= null;
    stpUpdateVentaDetU1.Params[17].Value:= null;
    stpUpdateVentaDetU1.Params[18].Value:= null;
    stpUpdateVentaDetU1.Params[19].Value:= rxVentaSerieProd.Value;
    stpUpdateVentaDetU1.Params[20].Value:= null;
    stpUpdateVentaDetU1.Params[21].Value:= rxVentaTipoUnidad.Value;
    stpUpdateVentaDetU1.Params[22].Value:= rxVentaItbisExento.Value;
    stpUpdateVentaDetU1.Params[23].Value:= rxVentaTipoVenta.Value;
    stpUpdateVentaDetU1.Params[24].Value:= rxVentaDescripcionEspecial.Value;
    stpUpdateVentaDetU1.Params[25].Value:= rxVentaCostoProducto.Value;
    stpUpdateVentaDetU1.ExecProc;
    if Not stpUpdateVentaDetU1.Transaction.InTransaction then
       stpUpdateVentaDetU1.Transaction.StartTransaction;
    try
      stpUpdateVentaDetU1.Transaction.CommitRetaining;
    except
    stpUpdateVentaDetU1.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmProcVentaRapida.ActualizaVentaMaster(fpago : String;serieNcfAsignado :integer);
begin
  stpProc_UpdateVENTAS_MAST_U1.Params[0].Value:= dmfactura.qryVentaFacturaNUMERO.Value;
  stpProc_UpdateVENTAS_MAST_U1.Params[1].Value:= dmfactura.qryVentaFacturaFECHA.Value;
  stpProc_UpdateVENTAS_MAST_U1.Params[2].Value:= dmfactura.qryVentaFacturaCIA_KEY.Value;//GlbCodigoCia;
  if Not tablaPropietarioCodigoPropietario.IsNull then
  stpProc_UpdateVENTAS_MAST_U1.Params[3].Value      := tablaPropietarioCodigoPropietario.Value
  else stpProc_UpdateVENTAS_MAST_U1.Params[3].Value := 0;//Generico

      if GlbcodVendedor > 0 then
    stpProc_UpdateVENTAS_MAST_U1.Params[4].Value    := GlbcodVendedor
    else
  stpProc_UpdateVENTAS_MAST_U1.Params[4].Value    := VarUsuarioGlb;
  //Asignar tipo Venta
  stpProc_UpdateVENTAS_MAST_U1.Params[5].Value    := fpago;dmfactura.qryVentaFacturaFORMA_PAGO.Value;//Credito Normal

  stpProc_UpdateVENTAS_MAST_U1.Params[6].Value    := 'Venta a Credito';
  stpProc_UpdateVENTAS_MAST_U1.Params[7].Value    := dmfactura.qryVentaFacturaMONEDA.Value;
  stpProc_UpdateVENTAS_MAST_U1.Params[8].AsString := Totalestotalneto.AsString; //EditN1.Text;
  stpProc_UpdateVENTAS_MAST_U1.Params[9].Value    := 'A';
  stpProc_UpdateVENTAS_MAST_U1.Params[10].Value   := Now;
  stpProc_UpdateVENTAS_MAST_U1.Params[11].Value   := strusername;
  stpProc_UpdateVENTAS_MAST_U1.Params[12].Value   := dmfactura.qryVentaFacturaNUMERO_FACTURA.Value;
  stpProc_UpdateVENTAS_MAST_U1.Params[13].Value:= dmfactura.qryVentaFacturaNUMERO_DOC_PAGO.Value;
  stpProc_UpdateVENTAS_MAST_U1.Params[14].Value:= serieNcfAsignado; //dmfactura.qryVentaFacturaSERIE_NCF_ASIGNADO.Value;
  stpProc_UpdateVENTAS_MAST_U1.Params[15].Value:= TotalesSubTotal.Value;
  stpProc_UpdateVENTAS_MAST_U1.Params[16].Value:= TotalesPorcientoInteres.Value;//aaaaaaaaaquiiiiiiiiiiiii
  stpProc_UpdateVENTAS_MAST_U1.Params[17].Value:= 0;//Totalesmontodesc.Value;
  stpProc_UpdateVENTAS_MAST_U1.Params[18].Value:= 0;//Null;//Totalesmontorecibido.Value;//monto inicial
  stpProc_UpdateVENTAS_MAST_U1.Params[19].Value:= edtObservacion.Text;
  //stpProc_UpdateVENTAS_MAST_U1.Params[19].Value:= TotalesNombreCliente.Value;// TotalesMontoDescAdicional.Value;
  stpProc_UpdateVENTAS_MAST_U1.Params[20].Value:= Totalesmontorecibido.Value;
  stpProc_UpdateVENTAS_MAST_U1.Params[21].Value:= Totalesdevolucion.Value;
  stpProc_UpdateVENTAS_MAST_U1.Params[22].Value:= Totalesitbis.Value;
  stpProc_UpdateVENTAS_MAST_U1.Params[23].Value:= TotalesMontoDescGastosAdmin.Value;
  stpProc_UpdateVENTAS_MAST_U1.Params[24].Value:= TotalesMontoDescItbisGastosAdmin.Value;
  stpProc_UpdateVENTAS_MAST_U1.Params[25].Value:= TotalesMontoDescTransp.Value;
  stpProc_UpdateVENTAS_MAST_U1.Params[26].Value:= TotalesMontoDescDirtecnica.Value;
  stpProc_UpdateVENTAS_MAST_U1.Params[27].Value:= TotalesMontoDescItbisDirTecnica.Value;
  stpProc_UpdateVENTAS_MAST_U1.Params[28].Value:= TotalesMontoDescImprevisto.Value;
  stpProc_UpdateVENTAS_MAST_U1.Params[29].Value:= TotalesMontoDescItbisImprevisto.Value;
  stpProc_UpdateVENTAS_MAST_U1.Params[30].Value:= TotalesComentario.Value;
  stpProc_UpdateVENTAS_MAST_U1.Params[31].Value:= rxVentaNumeroCotiza.Value;  

  //if Serie_asignadoncf > 0 then
  //stpProc_UpdateVENTAS_MAST_U1.Params[16].Value     := Serie_Asignadoncf
  //else stpProc_UpdateVENTAS_MAST_U1.Params[16].Value:= Null;
  //serie_ncf_asignado
  stpProc_UpdateVENTAS_MAST_U1.ExecProc;
  if Not stpProc_UpdateVENTAS_MAST_U1.Transaction.InTransaction then
  stpProc_UpdateVENTAS_MAST_U1.Transaction.StartTransaction;
  try
    stpProc_UpdateVENTAS_MAST_U1.Transaction.CommitRetaining;
  except
  stpProc_UpdateVENTAS_MAST_U1.Transaction.RollbackRetaining;
  end;
end;

procedure TfrmProcVentaRapida.ActualizaFactura;
begin
  if dmfactura.qryVentaFacturaNUMEROFACTURA.Value = 0 then exit;
  stpProcUpdateFactU1.Params[0].Value := dmfactura.qryVentaFacturaSERIEFACTURA.Value;
  stpProcUpdateFactU1.Params[1].Value := dmfactura.qryVentaFacturaNUMEROFACTURA.Value;
  stpProcUpdateFactU1.Params[2].Value := dmfactura.qryVentaFacturaMONEDAFACTURA.Value;
  stpProcUpdateFactU1.Params[3].Value := dmfactura.qryVentaFacturaTIPOFACTURA.Value;
  stpProcUpdateFactU1.Params[4].Value := dmfactura.qryVentaFacturaCODIGO_CTE.Value;
  stpProcUpdateFactU1.Params[5].Value := dmfactura.qryVentaFacturaFECHA.Value;
  stpProcUpdateFactU1.Params[6].Value := dmfactura.qryVentaFacturaOBSERVACION.Value;
  stpProcUpdateFactU1.Params[7].Value := Totalestotalneto.Value;
  stpProcUpdateFactU1.Params[8].Value := Null;
  stpProcUpdateFactU1.Params[9].Value := Null;
  stpProcUpdateFactU1.Params[10].Value :=Null;
  stpProcUpdateFactU1.Params[11].Value :=Now;
  stpProcUpdateFactU1.Params[12].Value :=StrUserName;
  stpProcUpdateFactU1.Params[13].Value := TotalesFechaVence.Value;
  if rdgFactServicio.Checked then
  stpProcUpdateFactU1.Params[14].Value := 0 //factura servicio
  else
    stpProcUpdateFactU1.Params[14].Value := 1; //factura articulos

  stpProcUpdateFactU1.Params[15].Value :=0;//no imprevisto
    
  if CheckBox2.Checked then
  stpProcUpdateFactU1.Params[15].Value :=1 //imprevisto 3%
  else if CheckBox3.Checked then
  stpProcUpdateFactU1.Params[15].Value :=2; //imprevisto 4%

  stpProcUpdateFactU1.ExecProc;
  if Not stpProcUpdateFactU1.Transaction.InTransaction then
  stpProcUpdateFactU1.Transaction.StartTransaction;
  try
    stpProcUpdateFactU1.Transaction.CommitRetaining;
  except
  stpProcUpdateFactU1.Transaction.RollbackRetaining;
  end;
end;

procedure TfrmProcVentaRapida.ActualizaTransCxc;
begin
  if dmfactura.qryDatosTrncxcSERIE.Value = 0 then exit;
  stpProcUpdateTrnCxcU1.Params[0].Value:= dmfactura.qryDatosTrncxcSERIE.Value;
  stpProcUpdateTrnCxcU1.Params[1].Value:= dmfactura.qryDatosTrncxcCIA_KEY.Value;
  stpProcUpdateTrnCxcU1.Params[2].Value:= dmfactura.qryDatosTrncxcTIPO_DOC.Value;
  stpProcUpdateTrnCxcU1.Params[3].Value:= dmfactura.qryDatosTrncxcMONEDA.Value;
  stpProcUpdateTrnCxcU1.Params[4].Value:=dmfactura.qryDatosTrncxcFECHA.Value;
  stpProcUpdateTrnCxcU1.Params[5].Value:= dmfactura.qryDatosTrncxcNUMERO_DOC.Value;
  stpProcUpdateTrnCxcU1.Params[6].Value:= tablaPropietarioCodigoPropietario.Value;
  stpProcUpdateTrnCxcU1.Params[7].Value:= null;
  stpProcUpdateTrnCxcU1.Params[8].Value:= dmfactura.qryDatosTrncxcCONCEPTO.Value;
  stpProcUpdateTrnCxcU1.Params[9].Value:= totalestotalneto.Value;
  stpProcUpdateTrnCxcU1.Params[10].Value:= now;
  stpProcUpdateTrnCxcU1.Params[11].Value:= strusername;
  stpProcUpdateTrnCxcU1.Params[12].Value:= rxVentaSerieOriginal.Value;

  stpProcUpdateTrnCxcU1.ExecProc;
  if Not stpProcUpdateTrnCxcU1.Transaction.InTransaction then
  stpProcUpdateTrnCxcU1.Transaction.StartTransaction;
  try
    stpProcUpdateTrnCxcU1.Transaction.CommitRetaining;
  except
  stpProcUpdateTrnCxcU1.Transaction.RollbackRetaining;
  end;
end;

procedure TfrmProcVentaRapida.ActualizaBalanceCteCxc;
begin
  if esContado then exit;

  stpProcUpdateBlcCteCxc.Params[0].Value:= 0;//anular cargo anterior;
  stpProcUpdateBlcCteCxc.Params[1].Value:= TotalesCodCliente.Value;
  stpProcUpdateBlcCteCxc.Params[2].Value:= 0;
  if TotalesMoneda.IsNull then
  stpProcUpdateBlcCteCxc.Params[3].Value:= '1' //pesos
  else
  stpProcUpdateBlcCteCxc.Params[3].Value:= TotalesMoneda.Value;
  
  stpProcUpdateBlcCteCxc.Params[4].Value:= dmFactura.qryVentaFacturaVALOR_TOTAL_DET.Value;
  stpProcUpdateBlcCteCxc.Params[5].Value:= null;
  stpProcUpdateBlcCteCxc.Params[6].Value:= dmFactura.qryVentaFacturaVALOR_TOTAL_DET.Value;
  stpProcUpdateBlcCteCxc.Params[7].Value:= dmFactura.qryVentaFacturaVALOR_TOTAL_DET.Value;
  stpProcUpdateBlcCteCxc.Params[8].Value:= now;
  stpProcUpdateBlcCteCxc.Params[9].Value:= strusername;
  stpProcUpdateBlcCteCxc.ExecProc;
  if Not stpProcUpdateBlcCteCxc.Transaction.InTransaction then
  stpProcUpdateBlcCteCxc.Transaction.StartTransaction;
  try
    stpProcUpdateBlcCteCxc.Transaction.CommitRetaining;
  except
  stpProcUpdateBlcCteCxc.Transaction.RollbackRetaining;
  end;


  stpProcUpdateBlcCteCxc.Params[0].Value:= 1;//Actualizar cargo factura actual
  stpProcUpdateBlcCteCxc.Params[1].Value:= TotalesCodCliente.Value;
  stpProcUpdateBlcCteCxc.Params[2].Value:= 0;
  if TotalesMoneda.IsNull then
  stpProcUpdateBlcCteCxc.Params[3].Value:= '1'//pesos
  else
  stpProcUpdateBlcCteCxc.Params[3].Value:= TotalesMoneda.Value;
  
  stpProcUpdateBlcCteCxc.Params[4].Value:= Totalestotalneto.Value;
  stpProcUpdateBlcCteCxc.Params[5].Value:= null;
  stpProcUpdateBlcCteCxc.Params[6].Value:= Totalestotalneto.Value;
  stpProcUpdateBlcCteCxc.Params[7].Value:= Totalestotalneto.Value;
  stpProcUpdateBlcCteCxc.Params[8].Value:= Now;
  stpProcUpdateBlcCteCxc.Params[9].Value:= strusername;

  stpProcUpdateBlcCteCxc.ExecProc;
  if Not stpProcUpdateBlcCteCxc.Transaction.InTransaction then
  stpProcUpdateBlcCteCxc.Transaction.StartTransaction;
  try
    stpProcUpdateBlcCteCxc.Transaction.CommitRetaining;
  except
  stpProcUpdateBlcCteCxc.Transaction.RollbackRetaining;
  end;
end;

procedure TfrmProcVentaRapida.ActualizaFactPendiente;
begin
  if dmfactura.qryVentaFacturaforma_pago.value in [1,6] then exit;
  stpProcUpdateFActPendu1.Params[0].Value:= 2;//dmfactura.qryVentaFacturaTIPO_FACTURA.Value;
  stpProcUpdateFActPendu1.Params[1].Value:= dmfactura.qryVentaFacturaMONEDA.Value;
  stpProcUpdateFActPendu1.Params[2].Value:= dmfactura.qryVentaFacturaNUMERO_FACTURA.Value;
  stpProcUpdateFActPendu1.Params[3].Value:= Totalestotalneto.Value;
  stpProcUpdateFActPendu1.Params[4].Value:= Now;
  stpProcUpdateFActPendu1.Params[5].Value:= StrUserName;

  stpProcUpdateFActPendu1.ExecProc;
  if Not stpProcUpdateFActPendu1.Transaction.InTransaction then
  stpProcUpdateFActPendu1.Transaction.StartTransaction;
  try
    stpProcUpdateFActPendu1.Transaction.CommitRetaining;
  except
  stpProcUpdateFActPendu1.Transaction.RollbackRetaining;
  end;

end;

procedure TfrmProcVentaRapida.bitBtnEditarFactClick(Sender: TObject);
var
  numF : integer;
  tRecordsDet : integer;
begin
   if not VerificaRecordsVenta then
   begin
     MessageDlg('Debe existir al menos una record activo, verifique.',mtInformation,[mbok],0);
     Exit;
   end;
   if rxVenta.RecordCount = 0 then
   begin
     MessageDlg('No puedes guardar sin detalle modificando factura, verifique.',mtInformation,[mbok],0);
     Exit;
   end;
    if (dmFactura.qryFactTieneDevolucion.RecordCount = 1) then
    begin
      MessageDlg('Factura tiene una devolución previa, verifique ',mtInformation,[mbok],0);
      bitBtnEditarFact.Enabled:=True;
      Exit;
    end;
  { if not VerificaLimiteCredito(TotalesCodCliente.Value,TotalesTotalNeto.Value) then
   begin
     if NoTieneCredito then
     MessageDlg('Cliente no tiene crédito...', mtWarning, [mbOK], 0)
     else
     MessageDlg('Monto contrato excede limite de crédito, depositar diferencia...',mtWarning, [mbOK], 0);
     Exit;
   end;
  }
     if tablaPropietario.State In [dsEdit, dsInsert] then
  tablaPropietario.Post;
  if (tablaPropietario.RecordCount = 0) or (tablaPropietarioCodigoPropietario.Value = 0) then
  begin
    MessageDlg('Favor seleccionar cliente', mtInformation, [mbOK], 0);
    RxDBLookupCombo1.SetFocus;
    BitBtn6.Enabled:=True;
    Exit;
  end;
  bitBtnEditarFact.Enabled:=False;
   qryCliente.Locate('CODIGO_CTE',tablaPropietarioCodigoPropietario.Value,[]);
   if not qryClienteCOD_VENDEDOR.IsNull then
   glbcodVendedor:=qryClienteCOD_VENDEDOR.Value
   else
   glbcodVendedor:= VarUsuarioGlb;

   Totales.Edit; 
   TotalesNombreCliente.Value := qryClienteNOMBRE_CTE.Value;
   TotalesDireccion.Value     := qryClienteDIRECCION_CONT.Value;
   TotalesTelefono.Value      := qryClienteTELEF_CONTACTO.Value;
   TotalesCodCliente.Value    := qryClienteCODIGO_CTE.Value;
   TotalesRNC_NUMERO.Value    := qryClienteRNC_NUMERO.Value;
   if (Not qryClienteCANT_DIAS_CREDITO.IsNull) And (qryClienteCANT_DIAS_CREDITO.Value > 0) Then
   TotalesFechaVence.Value    := GlbFechaTrnDiaria + qryClienteCANT_DIAS_CREDITO.Value
   else
   TotalesFechaVence.Value    := GlbFechaTrnDiaria + 15;//Default
   Totales.Post;

   rxVenta.First;

  //Actualizar Ventas_Mast con cambios
  ActualizaVentaMaster(dmfactura.qryVentaFacturaFORMA_PAGO.AsString,dmFactura.qryVentaFacturaSERIE_NCF_ASIGNADO.Value);
  rxventa.first;
  While Not rxventa.Eof do
  begin
    if (rxVentaStatus.Value = 'C') then
    begin
      //Pendiente
      //Re-Ingresar producto a inventario;
      ibStpActualizaInvProd.Params[0].Value:= rxVentaCodArticulo.Value;
      if (rxVentaTipoUnidad.Value = 3) Or (rxVentaTipoUnidad.Value = 0) then
        ibStpActualizaInvProd.Params[1].Value:= rxVentaCant.Value
      else
      begin
        ibStpActualizaInvProd.Params[1].Value:= rxVentaCant.Value * CantUnidad;
      end;
      //if Not EsDevolucion then
      //ibStpActualizaInvProd.Params[2].Value     := 0//tipoTrn
      //else
      ibStpActualizaInvProd.Params[2].Value:= 1;//0;//Actualiza Inventario
      ibStpActualizaInvProd.Params[3].Value     := 1;//porCodigo
      if (rxVentaInvetariar.Value <> 0) And (GlbCodDivInventario = 1 ) then
      ibStpActualizaInvProd.ExecProc;
      ActualizaVentaDet;//Elimina record de la tabla ventas_Det
      rxVenta.Next;
      continue;
    end;// else
    //ActualizaVentaDet;

    if (rxVentaStatus.Value = 'A') and (dmfactura.qryVentaFacturaDet.Locate('SERIE', rxVentaSerieOriginal.Value, []))
      and (rxVentaCant.Value < dmfactura.qryVentaFacturaDetCANTIDAD.Value) then
    begin
      ibStpActualizaInvProd.Params[0].Value:= rxVentaCodArticulo.Value;
      if (rxVentaTipoUnidad.Value = 3) Or (rxVentaTipoUnidad.Value = 0) then
         ibStpActualizaInvProd.Params[1].Value:=
         dmfactura.qryVentaFacturaDetCANTIDAD.Value - rxVentaCant.Value
      else
      begin
        ibStpActualizaInvProd.Params[1].Value:= (dmfactura.qryVentaFacturaDetCANTIDAD.Value - rxVentaCant.Value) * CantUnidad;
      end;
      //if Not EsDevolucion then
      ibStpActualizaInvProd.Params[2].Value     := 1;//tipoTrn
      //else
      //ibStpActualizaInvProd.Params[2].Value:= 1;//ingresar al inventario
      ibStpActualizaInvProd.Params[3].Value     := 1;//porCodigo
      if (rxVentaInvetariar.Value <> 0) And (GlbCodDivInventario = 1 ) then
         ibStpActualizaInvProd.ExecProc;
    end else
    if (rxVentaStatus.Value = 'A') and (dmfactura.qryVentaFacturaDet.Locate('SERIE', rxVentaSerieOriginal.Value, []))
      and (rxVentaCant.Value > dmfactura.qryVentaFacturaDetCANTIDAD.Value) then
    begin
      ibStpActualizaInvProd.Params[0].Value:= rxVentaCodArticulo.Value;
      if (rxVentaTipoUnidad.Value = 3) Or (rxVentaTipoUnidad.Value = 0) then
         ibStpActualizaInvProd.Params[1].Value:=
         rxVentaCant.Value - dmfactura.qryVentaFacturaDetCANTIDAD.Value
      else
      begin
        ibStpActualizaInvProd.Params[1].Value:= (rxVentaCant.Value - dmfactura.qryVentaFacturaDetCANTIDAD.Value) * CantUnidad;
      end;
      //if Not EsDevolucion then
      ibStpActualizaInvProd.Params[2].Value     := 0;//Disminuye Inventario
      //else
      //ibStpActualizaInvProd.Params[2].Value:= 1;//ingresar al inventario
      ibStpActualizaInvProd.Params[3].Value     := 1;//porCodigo
      if (rxVentaInvetariar.Value <> 0) And (GlbCodDivInventario = 1 ) then
         ibStpActualizaInvProd.ExecProc;
    end else
    if (rxVentaStatus.Value = 'I') then
    begin
      ibStpActualizaInvProd.Params[0].Value:= rxVentaCodArticulo.Value;
      if (rxVentaTipoUnidad.Value = 3) Or (rxVentaTipoUnidad.Value = 0) then
         ibStpActualizaInvProd.Params[1].Value:= rxVentaCant.Value
      else
      begin
        ibStpActualizaInvProd.Params[1].Value:= rxVentaCant.Value * CantUnidad;
      end;
      //if Not EsDevolucion then
      ibStpActualizaInvProd.Params[2].Value     := 0;//Add to inventario
      //else
      //ibStpActualizaInvProd.Params[2].Value:= 1;//ingresar al inventario
      ibStpActualizaInvProd.Params[3].Value     := 1;//porCodigo
      if (rxVentaInvetariar.Value <> 0) And (GlbCodDivInventario = 1 ) then
         ibStpActualizaInvProd.ExecProc;
    end;    
    ActualizaVentaDet;
    ActualizaInvAlmacen;//Actualiza Division Inventario
    rxventa.Next;
  end;

  //Actualiza tabla FACTURA
  ActualizaFactura;

  //Actualiza Factura Pendiente
  ActualizaFactPendiente;

  //Actualiza Trans CXC
  ActualizaTransCxc;

  //Balance Cliente CXC
  ActualizaBalanceCteCxc;

  bitBtnEditarFact.Visible:=False;
  bitBtnEditarFact.SendToBack;
  EsModificandoFactura:=False;
  ActivarBotonesEnModifica;
  label36.Visible:=False;
  Label36.caption:='';
  numF := dmFactura.qryVentaFacturaNUMERO_FACTURA.Value;
  dmFactura.qryVentaFactura.Close;
  dmfactura.qryVentaFacturaDet.Close;
  dmfactura.qryDatosTrncxc.Close;
  Totales.Close;
  Totales.Open;
  rxVenta.Close;
  rxVenta.Open;
  tablaPropietario.Close;
  tablaPropietario.Open;
  dmfactura.stpInsertPorcOtrosCargosFServ.Params[0].Value :=-1;
  InicializaOtrosDesc;

  //ImpFacturaservicio(numF,true);
  dmCompania.tblCompania.Close;
  dmCompania.tblCompania.Open;
  dmCompania.tblCompania.Locate('codigo',glbCia_Key,[]);
  dmfactura.qryFactReimpMaster.Close;
  dmfactura.qryFactReimpMaster.Params[0].Value:=numF;

  dmfactura.qryFactReimpDet.Close;
  dmfactura.qryFactReimpDet.Params[0].Value:=numF;
  dmfactura.qryFactReimpDet.Open;
  dmfactura.qryFactReimpDet.Last;
  dmfactura.qryFactReimpDet.Close;

    dmfactura.qryFactReimpMaster.Open;
    frmConsultaFacturas:=TfrmConsultaFacturas.Create(Nil);
    try
      frmConsultaFacturas.rdgCredito.Checked := True;
      frmConsultaFacturas.EditN1.SetInteger(dmfactura.qryFactReimpMaster.Params[0].Value);
      //frmConsultaFacturas.edtCodCte.SetInteger(tablaPropietarioCodigoPropietario.Value);
      frmConsultaFacturas.BitBtn1Click(Self);
    finally
    if Assigned(frmConsultaFacturas) then
    frmConsultaFacturas.Free;
    frmConsultaFacturas:=Nil;
    end;

    //chequear reimpresion de factura
    if (UpperCase(GLBFormatoFactura) = 'BYMSERVICIOS') then 
    begin
      qckFactCredArtioffice8_5_F_1ByM:=TqckFactCredArtioffice8_5_F_1ByM.Create(nil);
      try
        qckFactCredArtioffice8_5_F_1ByM.Preview;
      finally
      qckFactCredArtioffice8_5_F_1ByM.free;
      qckFactCredArtioffice8_5_F_1ByM:=nil;
      end;
    end else
      if (((UpperCase(GLBFormatoFactura) = 'INGESERVIS')) OR
    ((UpperCase(GLBFormatoFactura) = 'ARTIOFFICE'))) then
  begin
    if (dmFactura.qryVentaFacturaTIPO_FACTURA.Value = 1 ) then //
    begin
      qckFactCredArtioffice8_5_F_1:=TqckFactCredArtioffice8_5_F_1.Create(nil);
      try
        qckFactCredArtioffice8_5_F_1.Preview;
      finally
      qckFactCredArtioffice8_5_F_1.free;
      qckFactCredArtioffice8_5_F_1:=nil;
      end;
    end else
    begin
     ImpFacturaservicio(dmfactura.qryFactReimpMaster.Params[0].Value,True);
     end;
  end else
  if esContado then
  ReImprimirRecibo1Click(Self)
  else
  begin
   //***************************** begin **********************************
   dmCompania.tblCompania.Close;
    dmCompania.tblCompania.Open;
    dmCompania.tblCompania.Locate('codigo',glbCia_Key,[]);
    dmfactura.qryFactReimpMaster.Close;
    dmfactura.qryFactReimpMaster.Params[0].Value:= dmfactura.qryFactReimpMaster.Params[0].Value;


    dmfactura.qryFactReimpDet.Close;
    dmfactura.qryFactReimpDet.Params[0].Value:=dmfactura.qryFactReimpMaster.Params[0].Value;
    dmfactura.qryFactReimpDet.Open;
    dmfactura.qryFactReimpDet.Last;
    tRecordsDet := dmfactura.qryFactReimpDet.RecordCount;
    dmfactura.qryFactReimpDet.Close;

    dmfactura.qryFactReimpMaster.Open;
    frmConsultaFacturas:=TfrmConsultaFacturas.Create(Nil);
    try
      if esContado then
      frmConsultaFacturas.rdgCredito.Checked:=False;
      frmConsultaFacturas.EditN1.SetInteger(dmfactura.qryFactReimpMaster.Params[0].Value);
      //frmConsultaFacturas.edtCodCte.SetInteger(dmfactura.qryFactReimpMasterCODIGO_CTE.Value);
      if not ExpExcel then
      begin
        frmConsultaFacturas.BitBtn1Click(Self);
      end else
      begin
        //Aqui Exportar a Excel
      end;
    finally
    if Assigned(frmConsultaFacturas) then
    frmConsultaFacturas.Free;
    frmConsultaFacturas:=Nil;
    end;

    dmclientes.tblClientes.Close;
    dmclientes.tblClientes.Open;
    if dmclientes.tblClientes.Locate('CODIGO_CTE', dmfactura.qryFactReimpMasterCODIGO_CTE.Value,[]) then
    glbcodVendedor:=dmclientes.tblClientesCOD_VENDEDOR.Value
    else
    glbcodVendedor:= VarUsuarioGlb;
      if dmfactura.qryFactReimpMaster.Recordcount > 0 then
      begin

        if (GlbFact55Pulg = 1) then
        begin
          if GlbFacturaLicoreria =1 then
          begin
            qckRepFacturaEstandarNewReimpREsp:=TqckRepFacturaEstandarNewReimpREsp.Create(Nil);
            try
             if GlbSizeFact8x11 = 1 then
             qckRepFacturaEstandarNewReimpREsp.Page.Length := 11;
             qckRepFacturaEstandarNewReimpREsp.xtipoVenta := TipoVenta;
             qckRepFacturaEstandarNewReimpREsp.Prepare;
             glbTPag := qckRepFacturaEstandarNewReimpREsp.PageNumber;
             //qckRepRecibo8_5_11REsp.valorNCF:= GlbDescNCF;//valorNCF;
            if ImprimirRecibo1.Checked then
             begin
               qckRepFacturaEstandarNewReimpREsp.PrinterSetup;
               qckRepFacturaEstandarNewReimpREsp.Print;
             end else
             qckRepFacturaEstandarNewReimpREsp.Preview;
             finally
             qckRepFacturaEstandarNewReimpREsp.Free;
             qckRepFacturaEstandarNewReimpREsp:=Nil;
             end;
          end else
          begin
            qckRepFacturaEstandarNewReimp:=TqckRepFacturaEstandarNewReimp.Create(Nil);
            try
              if GlbSizeFact8x11 = 1 then
              qckRepFacturaEstandarNewReimp.Page.Length := 11;

              qckRepFacturaEstandarNewReimp.Prepare;
              glbTPag := qckRepFacturaEstandarNewReimp.PageNumber;

              if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
              begin
                qckRepFacturaEstandarNewReimp.PrinterSetup;
                qckRepFacturaEstandarNewReimp.Print;
              end else
              qckRepFacturaEstandarNewReimp.Preview;
            finally
            qckRepFacturaEstandarNewReimp.Free;
            qckRepFacturaEstandarNewReimp:=Nil;
          end;
        end;
      end
      else
      begin
        qckRepFactPuntoVenta:=TqckRepFactPuntoVenta.Create(Nil);
        try
          qckRepFactPuntoVenta.QRLabel14.Enabled:=False;
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
    end;
   //***************************** end ************************************
  end;
  bitBtnEditarFact.Enabled  := True;
  lblFechaCotizacion.Visible:= False;
  dbFechaCotizacion.Visible := False;
  Label36.Visible := False;
  Label36.caption:='';
  rdgFactServicio.Checked := False;
  GlbUsandoCotiza:= False;
  esContado :=False;
  Refresh;
  numerodocReimp := -1;
  Application.ProcessMessages;
end;
procedure TfrmProcVentaRapida.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if (rxVentaStatus.Value = 'C') then
  Background := clGray
  else
  if (rxVentaStatus.Value = 'I') then
  Background := clGreen;
end;

procedure TfrmProcVentaRapida.BitBtn6MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if Label36.Visible then
  begin
    EsModificandoFactura:=True;
    if not EsModificandoCotiza then
    begin
      bitBtnEditarFact.Visible:=True;
      bitBtnEditarFact.Top := 770;
      bitBtnEditarFact.BringToFront;
    end;
  end;
end;

procedure TfrmProcVentaRapida.ActivarBotonesEnModifica;
begin
  if EsModificandoFactura then
  begin
  BitBtn9.Enabled:=False;
  BitBtn8.Enabled:=False;
  BitBtn12.Enabled:=False;
  BitBtn15.Enabled:=False;
  BitBtn11.Enabled:=False;
  BitBtn17.Enabled:=False;
  end else
  begin
  BitBtn9.Enabled:=True;
  BitBtn8.Enabled:=True;
  BitBtn12.Enabled:=True;
  BitBtn15.Enabled:=True;
  BitBtn11.Enabled:=True;
  BitBtn17.Enabled:=True;
  end;
end;

procedure TfrmProcVentaRapida.ImpFacturaservicio(numerotrn: Integer;
  EsReimpresion: Boolean);
begin
  frmConsultaFacturas:=TfrmConsultaFacturas.Create(Nil);
  try
    if not EsReimprimirContado then
    frmConsultaFacturas.rdgCredito.Checked:=True;
    frmConsultaFacturas.EditN1.SetInteger(numerotrn);
    //frmConsultaFacturas.edtCodCte.SetInteger(tablaPropietarioCodigoPropietario.Value);
    if not ExpExcel then
    begin
      frmConsultaFacturas.BitBtn1Click(Self);
      qckFactServIngeservis_N := TqckFactServIngeservis_N.Create(Nil);
      try
        qckFactServIngeservis_N.qrLabelFactOrigen.Caption:='';
        if EsDevolucion then
        begin
          //if EsModificandoFactura then
          if (rxVentaNumeroFactura.AsString <> '') then
          qckFactServIngeservis_N.qrLabelFactOrigen.Caption:='#Factura: ' + IntToStr(UProcesarDevolucion.numeroFactura);
          //else
          //qckFactServIngeservis_N.qrLabelFactOrigen.Caption:='';
          qckFactServIngeservis_N.QRLabel4.Caption:='NOTA CREDITO';
        end;
        qckFactServIngeservis_N.Preview;
      finally
      qckFactServIngeservis_N.Free;
      qckFactServIngeservis_N:=Nil;
      end;
    end else
    begin

      //Aqui Exportar a Excel
    end;
    finally

  if Assigned(frmConsultaFacturas) then
  frmConsultaFacturas.Free;
  frmConsultaFacturas:=Nil;
  end;
  dmFactura.qryTemplateFactura.Close;
  dmFactura.qryTemplateFactura.Params[0].Value := 1;//Factura Servicio
  dmFactura.qryTemplateFactura.Open;
  ExportarGridExcel;
  ExpExcel:=False;
end;

procedure TfrmProcVentaRapida.Label37Click(Sender: TObject);
var
  numFcta :Integer;
begin
  stpProcBuscarUltNum.ExecProc;
  frmGetNumFactExpExcel:=TfrmGetNumFactExpExcel.Create(nil);
  try
    frmGetNumFactExpExcel.edtNumFactura.SetInteger(stpProcBuscarUltNum.params[1].AsInteger);
    if frmGetNumFactExpExcel.Showmodal = mrOk then
    begin
       //numFcta := frmGetNumFactExpExcel.edtNumFactura.;
       ImpFacturaservicio(frmGetNumFactExpExcel.edtNumFactura.ValueInteger,true);
    end;
  finally
  frmGetNumFactExpExcel.free;
  frmGetNumFactExpExcel:= nil;
  end;
end;

procedure TfrmProcVentaRapida.BitBtn21Click(Sender: TObject);
begin
  totales.Edit;
  DBEdit7.SetFocus;
  DBStatusLabel1.Visible:=True;
end;

procedure TfrmProcVentaRapida.DBEdit7Exit(Sender: TObject);
begin
  if totales.State in [dsEdit, dsInsert] then
  totales.Post;
  DBStatusLabel1.Visible:=False;
end;

procedure TfrmProcVentaRapida.BitBtn22Click(Sender: TObject);
var
  nf:integer;
  tipoConduce : smallint;
  numTrnV : integer;
begin
  frmSeleccionarTipoConduce:=TfrmSeleccionarTipoConduce.Create(Nil);
  try
    nF := -1;
    if frmSeleccionarTipoConduce.ShowModal = mrOk then
    begin
      nF := frmSeleccionarTipoConduce.EditN1.ValueInteger; //StrtoInt(InputBox('Imprimir conduce','Entre #Factura',stpProcBuscarUltNum.params[1].AsString));
      tipoConduce:=frmSeleccionarTipoConduce.tipoConduce;
    end;
  finally
  frmSeleccionarTipoConduce.Free;
  frmSeleccionarTipoConduce:=Nil;
  end;

  if (nF < 0) then Exit;

  if (tipoConduce = 0) then
  begin
    frmConsultaFacturas:=TfrmConsultaFacturas.Create(Nil);
    try
      frmConsultaFacturas.EditN1.SetInteger(nF);
      frmConsultaFacturas.NumTrnVenta:=nF;
      if Not ExpExcel then
      begin
        frmConsultaFacturas.rdgCredito.Checked:=True;
        frmConsultaFacturas.BitBtn1Click(Self);
        numTrnV := frmConsultaFacturas.NumTrnVenta;
        if (numTrnV = 0) then exit;
        frmGenerarConduceFCT:=TfrmGenerarConduceFCT.Create(Nil);
        try
          frmGenerarConduceFCT.ProcAbrirDatos(numTrnV);
          frmGenerarConduceFCT.ProcAsignaCantConduce;
          frmGenerarConduceFCT.ShowModal;
        finally
        frmGenerarConduceFCT.Free;
        frmGenerarConduceFCT:=Nil;
        end;

        frmConsultaFacturas.EditN1.SetInteger(nF);
        frmConsultaFacturas.BitBtn1Click(Self);

        qckFactServIngeservis_NConduce:=TqckFactServIngeservis_NConduce.Create(Nil);
        try
          qckFactServIngeservis_NConduce.Preview;
        if frmConsultaFacturas.chkExportaPDF.Checked then
        ReportExport(qckFactServIngeservis_NConduce,'ConduceF'+IntToStr(nF)+'.pdf');
          
        finally
        qckFactServIngeservis_NConduce.Free;
        qckFactServIngeservis_NConduce:=Nil;
        end;
      end
    finally
    if Assigned(frmConsultaFacturas) then
    frmConsultaFacturas.Free;
    frmConsultaFacturas:=Nil;
    end;
  end else
  begin
    dmfactura.qryCotizacionConduce.Close;
    dmfactura.qryCotizacionConduce.params[0].Value:= nF;
    dmfactura.qryCotizacionConduce.Open;
    if dmfactura.qryCotizacionConduce.RecordCount = 0 then
    MessageDlg('Numero cotizacion no encontrado, verifique', mtInformation, [mbOk],0)
    else
    begin
      frmGenerarConduce:=TfrmGenerarConduce.Create(nil);
      try
        frmGenerarConduce.ProcAbrirDatos(nF);
        frmGenerarConduce.ProcAsignaCantConduce;
        frmGenerarConduce.ProcAbrirDatos(nF);        
        frmGenerarConduce.Showmodal;
      finally
      frmGenerarConduce.Free;
      frmGenerarConduce:= Nil;
      end;

      dmfactura.qryCotizacionConduce.Close;
      dmfactura.qryCotizacionConduce.Open;
      qckCotiServIngeservis_NConduce:=TqckCotiServIngeservis_NConduce.Create(Nil);
      try
        qckCotiServIngeservis_NConduce.Preview;
      if frmConsultaFacturas.chkExportaPDF.Checked then
      ReportExport(qckFactServIngeservis_NConduce,'ContizacionN'+IntToStr(nF)+'.pdf');
        
      finally
      qckCotiServIngeservis_NConduce.Free;
      qckCotiServIngeservis_NConduce:=Nil;
      end;
    end;
  end;
end;

procedure TfrmProcVentaRapida.RxDBGrid1Enter(Sender: TObject);
begin
  GlbNumero:= rxVentaSerie.Value;
end;

procedure TfrmProcVentaRapida.RxDBGrid1Exit(Sender: TObject);
begin
  GlbNumero:= rxVentaSerie.Value;
end;

procedure TfrmProcVentaRapida.ReImprimeFacturaContado1Click(
  Sender: TObject);
var
  tRecordsDet : integer;
begin
  dmCompania.tblCompania.Close;
  dmCompania.tblCompania.Open;
  dmCompania.tblCompania.Locate('codigo', glbCia_Key, []);
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
    frmConsultaFacturas:=TfrmConsultaFacturas.Create(Nil);
    try
      frmConsultaFacturas.EsReimprimirContado:= True;
      EsReimprimirContado:=True;
      frmConsultaFacturas.rdgContado.Checked:=True;
      frmConsultaFacturas.EditN1.SetInteger(dmfactura.qryFactReimpMaster.Params[0].Value);
      if not ExpExcel then
      begin
        frmConsultaFacturas.BitBtn1Click(Self);
        //frmConsultaFacturas.ShowModal;
      end else
      begin
        //Aqui Exportar a Excel
      end;
    finally
    if Assigned(frmConsultaFacturas) then
    frmConsultaFacturas.Free;
    frmConsultaFacturas:=Nil;
    end;

    dmclientes.tblClientes.Close;
    dmclientes.tblClientes.Open;
    if dmclientes.tblClientes.Locate('CODIGO_CTE', dmfactura.qryFactReimpMasterCODIGO_CTE.Value,[]) then
    glbcodVendedor:=dmclientes.tblClientesCOD_VENDEDOR.Value
    else
    glbcodVendedor:= VarUsuarioGlb;

  if (dmFactura.qryVentaFacturaTIPO_FACTURA.Value = 1 ) Or
     (dmFactura.qryVentaFacturaTIPO_FACTURA.IsNull) then //
  begin
    qckFactCredArtioffice8_5_F_1:=TqckFactCredArtioffice8_5_F_1.Create(nil);
    try
      qckFactCredArtioffice8_5_F_1.Preview;
    finally
    qckFactCredArtioffice8_5_F_1.free;
    qckFactCredArtioffice8_5_F_1:=nil;
    end;
  end else
  begin
    ImpFacturaservicio(dmfactura.qryFactReimpMaster.Params[0].Value,True);
  end;
end;

procedure TfrmProcVentaRapida.CrearNCreditoEnDevolucion;
begin
  exit;//de forma temporal hasta que analice bien
  frmTransCxcProc_R:=TfrmTransCxcProc_R.Create(Nil);
  try
    frmTransCxcProc_R.CodCte := FrmBuscarClientesPersonas.CodigoCliente;
    frmTransCxcProc_R.Pagecontrol1.ActivePage := frmTransCxcProc_R.TabSheet1;
    frmTransCxcProc_R.Pagecontrol1.ActivePageIndex:=0;
    frmTransCxcProc_R.edtMontoAcobrar.SetFloat(Abs(Totalestotalneto.Value));
    frmTransCxcProc_R.Showmodal;
  finally
  frmTransCxcProc_R.Free;
  frmTransCxcProc_R:=Nil;
  end;
end;

procedure TfrmProcVentaRapida.ActualizaCotizacionMaster;
begin
  if not TotalesFechaCotizacion.IsNull then
  ibstpUpdateCotizaMaster.Params[1].Value:= TotalesFechaCotizacion.Value //GlbFechaTrnDiaria;
  else
  ibstpUpdateCotizaMaster.Params[1].Value:= ExtraerFecha(rxVentaFecha.Value); //GlbFechaTrnDiaria;
  ibstpUpdateCotizaMaster.Params[2].Value:= ibstpUpdateCotizaMaster.Params[1].Value + 30;//GlbFechaTrnDiaria+30;//fecha vence
  if qryClienteCOD_VENDEDOR.Value > 0 then
  GlbcodVendedor:= qryClienteCOD_VENDEDOR.Value
  else
  GlbcodVendedor:= VarUsuarioGlb;
  if not tablaPropietarioCodigoPropietario.IsNull then
  ibstpUpdateCotizaMaster.Params[3].Value:= tablaPropietarioCodigoPropietario.Value
  else
  ibstpUpdateCotizaMaster.Params[3].Value:= 0;//codigo cliente generico mientras tanto
  if (GlbcodVendedor > 0) then
  ibstpUpdateCotizaMaster.Params[4].Value:= GlbcodVendedor else
  ibstpUpdateCotizaMaster.Params[4].Value:= VarUsuarioGlb;
  ibstpUpdateCotizaMaster.Params[5].Value:= 'Cotización';
  if TotalesMoneda.IsNull then
  ibstpUpdateCotizaMaster.Params[6].Value:= '1'
  else
  ibstpUpdateCotizaMaster.Params[6].Value:=TotalesMoneda.Value;
  
  ibstpUpdateCotizaMaster.Params[7].Value:= Totalestotalneto.Value;//EditN1.Text;
  ibstpUpdateCotizaMaster.Params[8].Value   := 'A';
  ibstpUpdateCotizaMaster.Params[9].Value   := Now;
  ibstpUpdateCotizaMaster.Params[10].AsString := Trim(StrUserName);
  ibstpUpdateCotizaMaster.Params[11].Value    := Null;
  ibstpUpdateCotizaMaster.Params[12].Value    := Null;
  ibstpUpdateCotizaMaster.Params[13].Value    := null;
  ibstpUpdateCotizaMaster.Params[14].Value    := null;
  ibstpUpdateCotizaMaster.Params[15].Value    := null;
  ibstpUpdateCotizaMaster.Params[16].Value    := TotalesSubTotal.Value;
  ibstpUpdateCotizaMaster.Params[17].Value    := TotalesPorcDesAdicional.Value;
  ibstpUpdateCotizaMaster.Params[18].Value    := TotalesMontoDescAdicional.Value;//Totalesmontodesc.value;
  ibstpUpdateCotizaMaster.Params[19].Value    := 0;
  if (edtObservacion.Text <> '') then
  ibstpUpdateCotizaMaster.Params[20].Value    := edtObservacion.Text
  else
  ibstpUpdateCotizaMaster.Params[20].Value    := null;
  ibstpUpdateCotizaMaster.Params[21].Value    := 0;
  ibstpUpdateCotizaMaster.Params[22].Value    := 0;
  ibstpUpdateCotizaMaster.Params[23].Value    := 0;//montototalitbis
  ibstpUpdateCotizaMaster.Params[24].Value    := TotalesMontoDescGastosAdmin.Value;
  ibstpUpdateCotizaMaster.Params[25].Value    := TotalesMontoDescItbisGastosAdmin.Value;
  ibstpUpdateCotizaMaster.Params[26].Value    := TotalesMontoDescTransp.Value;
  ibstpUpdateCotizaMaster.Params[27].Value    := TotalesMontoDescDirtecnica.Value;
  ibstpUpdateCotizaMaster.Params[28].Value    := TotalesMontoDescItbisDirTecnica.Value;
  ibstpUpdateCotizaMaster.Params[29].Value    := TotalesMontoDescImprevisto.Value;
  ibstpUpdateCotizaMaster.Params[30].Value    := TotalesMontoDescItbisImprevisto.Value;

  if rdgFactServicio.Checked then
  ibstpUpdateCotizaMaster.Params[31].Value     := 0 //Tipo_factura
  else ibstpUpdateCotizaMaster.Params[31].Value:= 1;

  ibstpUpdateCotizaMaster.Params[32].Value     := null;
  if CheckBox2.Checked then
  ibstpUpdateCotizaMaster.Params[32].Value     := 1 //aplica_tipodesc
  else
  if CheckBox3.Checked then
  ibstpUpdateCotizaMaster.Params[32].Value     := 2;

  ibstpUpdateCotizaMaster.Params[33].Value     := rxVentaNumeroCotiza.Value;//Numero_Cotiza
  ibstpUpdateCotizaMaster.Params[34].Value     := totalesComentario.Value;//Numero_Cotiza
  ibstpUpdateCotizaMaster.Params[35].Value     := totalesReferenciaCte.Value;//Numero_Cotiza
  ibstpUpdateCotizaMaster.ExecProc;

  if Not ibstpUpdateCotizaMaster.Transaction.InTransaction then
  ibstpUpdateCotizaMaster.Transaction.StartTransaction;
  try
    ibstpUpdateCotizaMaster.Transaction.CommitRetaining;
  except
  ibstpUpdateCotizaMaster.Transaction.RollbackRetaining;
  end;
end;

procedure TfrmProcVentaRapida.InsertarCotizacionDetUpd(numero,
  serie: Integer);
begin
  stpProcUpdteCotDet.Params[1].Value  := Numero;
  stpProcUpdteCotDet.Params[2].Value  := rxVentaCodArticulo.Value;
  stpProcUpdteCotDet.Params[3].Value  := Null;
  stpProcUpdteCotDet.Params[4].Value  := rxVentaDescripcion.Value;
  stpProcUpdteCotDet.Params[5].Value  := rxVentaDescripcionEspecial.Value;
  stpProcUpdteCotDet.Params[6].Value  := rxVentaCant.Value;
  stpProcUpdteCotDet.Params[7].Value  := rxVentaPrecio.Value;
  stpProcUpdteCotDet.Params[8].Value  := 0;
  stpProcUpdteCotDet.Params[9].Value  := rxVentaItbi.Value; //Itbis
  stpProcUpdteCotDet.Params[10].Value := rxVentaMontoBruto.Value;
  stpProcUpdteCotDet.Params[11].Value := rxVentaMontoNeto.Value;//rxVentaMontoBruto.Value;
  stpProcUpdteCotDet.Params[12].Value := 'A';
  //if frmCotizaciones.ibqryCotizacionDet.Locate('NUMERO;SERIE',VarArrayOf([numero,serie]),[]) then
  //begin
  //  stpProcUpdteCotDet.Params[13].Value := frmCotizaciones.ibqryCotizacionDetFECHA_IN.Value;
  //  stpProcUpdteCotDet.Params[14].AsString:= frmCotizaciones.ibqryCotizacionDetIN_POR.Value;
  //end else
  //begin
  stpProcUpdteCotDet.Params[13].Value   := Now;
  stpProcUpdteCotDet.Params[14].AsString:= StrUserName;
  //end;
  stpProcUpdteCotDet.Params[15].Value   := Now;
  stpProcUpdteCotDet.Params[16].Value   := strUserName;
  stpProcUpdteCotDet.Params[17].Value   := rxVentaTipoUnidad.Value;
  stpProcUpdteCotDet.Params[18].Value   := rxVentaItbisExento.Value;
  stpProcUpdteCotDet.Params[19].Value   := rxVentaTipoVenta.Value;
  stpProcUpdteCotDet.Params[20].Value   := serie;
  stpProcUpdteCotDet.Params[21].Value   := rxVentaPorcDescItem.Value;
  stpProcUpdteCotDet.Params[22].Value   := rxVentaMontoDescItem.Value;
  stpProcUpdteCotDet.ExecProc;
end;

procedure TfrmProcVentaRapida.dbFechaCotizacionClick(Sender: TObject);
begin
  Totales.Edit;
end;

procedure TfrmProcVentaRapida.dbFechaCotizacionExit(Sender: TObject);
begin
  if Totales.State in [dsEdit] then
  Totales.Post;
end;

procedure TfrmProcVentaRapida.dbFechaCotizacionEnter(Sender: TObject);
begin
  Totales.Edit;
end;

procedure TfrmProcVentaRapida.ProcInsertarVtaMastEnDevolucion(Serie_asignadoncf : Integer);
begin
  ipStpInsertVentMast.Params[1].Value:= GlbFechaTrnDiaria;
  ipStpInsertVentMast.Params[2].Value:= GlbCodigoCia;
  if Not tablaPropietarioCodigoPropietario.IsNull then
  ipStpInsertVentMast.Params[3].Value      := tablaPropietarioCodigoPropietario.Value
  else ipStpInsertVentMast.Params[3].Value := 0;//Generico
  if (GlbcodVendedor > 0) then
  ipStpInsertVentMast.Params[4].Value    := GlbcodVendedor
  else
  ipStpInsertVentMast.Params[4].Value    := VarUsuarioGlb;
  //Asignar tipo Venta
  ipStpInsertVentMast.Params[5].Value    := 6;//Devolucion

  ipStpInsertVentMast.Params[6].Value    := 'Devolución';
  if TotalesMoneda.IsNull then
  ipStpInsertVentMast.Params[7].Value    := '1'
  else
    ipStpInsertVentMast.Params[7].Value    := TotalesMoneda.Value;
    
  ipStpInsertVentMast.Params[8].Value    := Totalestotalneto.Value * -1; //EditN1.Text;
  ipStpInsertVentMast.Params[9].Value    := 'A';
  ipStpInsertVentMast.Params[10].Value   := Now;
  ipStpInsertVentMast.Params[11].Value   := StrUserName;
  ipStpInsertVentMast.Params[12].Value   := Null;
  ipStpInsertVentMast.Params[13].Value:= Null;
  ipStpInsertVentMast.Params[14].Value:= UProcesarDevolucion.numeroFactura;//Numero Factura
  ipStpInsertVentMast.Params[15].Value:= dmcxc.tblTransCxcnumero_doc.Value;    //yo soy inteligencia divina

if Serie_asignadoncf > 0 then
  ipStpInsertVentMast.Params[16].Value     := Serie_Asignadoncf
  else ipStpInsertVentMast.Params[16].Value:= Null;
  ipStpInsertVentMast.Params[17].Value:= TotalesSubTotal.Value * -1;
  ipStpInsertVentMast.Params[18].Value:= TotalesPorcDesAdicional.Value;
  ipStpInsertVentMast.Params[19].Value:= TotalesMontoDescAdicional.Value  * -1;
  ipStpInsertVentMast.Params[20].Value:= Totalesmontorecibido.Value;
  ipStpInsertVentMast.Params[21].Value:= Totalesdevolucion.Value;
  ipStpInsertVentMast.Params[22].Value:= Totalesitbis.Value  * -1;
  ipStpInsertVentMast.Params[23].Value:= Totalesmontorecibido.Value;
  if (edtObservacion.Text <> '') then
  ipStpInsertVentMast.Params[24].Value:= edtObservacion.Text
  else ipStpInsertVentMast.Params[24].Value:= '';
  //ipStpInsertVentMast.Params[24].Value:= 'No. Trn Original '+rxVentaNumeroTrn.AsString; //edtObservacion.Text;
  ipStpInsertVentMast.Params[25].Value:= TotalesMontoDescGastosAdmin.Value  * -1;
  ipStpInsertVentMast.Params[26].Value:= TotalesMontoDescItbisGastosAdmin.Value  * -1;
  ipStpInsertVentMast.Params[27].Value:= TotalesMontoDescTransp.Value  * -1;
  ipStpInsertVentMast.Params[28].Value:= TotalesMontoDescDirtecnica.Value  * -1;
  ipStpInsertVentMast.Params[29].Value:= TotalesMontoDescItbisDirTecnica.Value  * -1;
  ipStpInsertVentMast.Params[30].Value:= TotalesMontoDescImprevisto.Value  * -1;
  ipStpInsertVentMast.Params[31].Value:= TotalesMontoDescItbisImprevisto.Value  * -1;
  ipStpInsertVentMast.Params[32].Value:= TotalesComentario.Value;
  ipStpInsertVentMast.Params[33].Value:= rxVentaNumeroCotiza.Value;
  ipStpInsertVentMast.Params[34].Value:= totalesReferenciaCte.Value;    


  ipStpInsertVentMast.ExecProc;
  numeroTrnVta:= ipStpInsertVentMast.Params[0].Value;
  if Not ipStpInsertVentMast.Transaction.InTransaction then
  ipStpInsertVentMast.Transaction.StartTransaction;
  try
    ipStpInsertVentMast.Transaction.CommitRetaining;
  except
  ipStpInsertVentMast.Transaction.RollbackRetaining;
  end;
  numeroTrnVta:= ipStpInsertVentMast.Params[0].Value;
end;

procedure TfrmProcVentaRapida.ReImprimeDevolucion1Click(Sender: TObject);
begin
//Usado para filtrar dmfactura.qryventafactura
  dmFactura.formaPago := 6;//Devolucion
  UProcesarDevolucion.numeroFactura:=StrToInt(InputBox('Re-Imprimir factura devolucion','Entre número factura',''));
  dmCompania.tblCompania.Close;
  dmCompania.tblCompania.Open;
  dmCompania.tblCompania.Locate('codigo',glbCia_Key,[]);
  dmfactura.qryFactReimpMaster.Close;
  dmfactura.qryFactReimpMaster.Params[0].Value:=UProcesarDevolucion.numeroFactura;

  dmfactura.qryFactReimpDet.Close;
  dmfactura.qryFactReimpDet.Params[0].Value:=UProcesarDevolucion.numeroFactura;
  dmfactura.qryFactReimpDet.Open;
  dmfactura.qryFactReimpDet.Last;
  dmfactura.qryFactReimpDet.Close;

    dmfactura.qryFactReimpMaster.Open;
    frmConsultaFacturas:=TfrmConsultaFacturas.Create(Nil);
    try
      frmConsultaFacturas.rdgCredito.Checked := True;
      frmConsultaFacturas.EditN1.SetInteger(dmfactura.qryFactReimpMaster.Params[0].Value);
      dmFactura.qryVentaFactura.SQL.Text:=
      dmFactura.qryVentaFactura_0.SQL.Text + ' Where VENTAS_MAST.NUMERO_FACTURA =:numero '+
      ' And ventas_mast.cia_key =:ciakey' +
      ' And ventas_mast.FORMA_PAGO = 6' ;

      dmFactura.qryVentaFactura.Params[0].AsInteger := UProcesarDevolucion.numeroFactura;
      //dmFactura.qryVentaFactura.Params[1].AsInteger := UProcesarDevolucion.codigo_cte;
      dmFactura.qryVentaFactura.Params[1].AsInteger := glbCia_Key;
      dmFactura.qryVentaFactura.Open;
      GlbcodVendedor:= dmFactura.qryVentaFacturaCODIGO_VENDEDOR.Value;
      if dmFactura.qryVentaFactura.RecordCount = 0 then
      begin
        MessageDlg('Factura no existe en devolución',mtInformation,[mbok],0);
        exit;
      end;
      dmFactura.qryDatosTrncxc.Close;  //dmFactura.qryVentaFactura.RecordCount;
      dmFactura.qryDatosTrncxc.Params[0].AsInteger:= dmFactura.qryVentaFacturaNUMERO_FACTURA.Value;
      dmFactura.qryDatosTrncxc.Params[1].AsInteger:= glbCia_Key;
      dmFactura.qryDatosTrncxc.Open;
      //frmConsultaFacturas.BitBtn1Click(Self);
    finally
    if Assigned(frmConsultaFacturas) then
    frmConsultaFacturas.Free;
    frmConsultaFacturas:=Nil;
    end;

  if (dmFactura.qryVentaFacturaTIPO_FACTURA.Value = 1 ) then //
  begin
    qckFactCredArtioffice8_5_F_1:=TqckFactCredArtioffice8_5_F_1.Create(nil);
    try
      qckFactCredArtioffice8_5_F_1.Preview;
    finally
    qckFactCredArtioffice8_5_F_1.free;
    qckFactCredArtioffice8_5_F_1:=nil;
    end;
  end else
  begin
    ImpFacturaservicio(dmfactura.qryFactReimpMaster.Params[0].Value,True);
  end;
  Label36.Visible:=False;
  Label36.caption:='';
  rdgFactServicio.Checked:=False;
end;

procedure TfrmProcVentaRapida.ProcesarDevolucion;
begin
  //Crear Nota Credito
  UProcesarDevolucion.tipoCF    := '04';
  UProcesarDevolucion.fechaTrn  := rxVentaFecha.Value;
  UProcesarDevolucion.codigo_cte:= tablaPropietarioCodigoPropietario.Value;
  UProcesarDevolucion.nombrecompleto :=qryClienteNOMBRE_FACTURAR.Value;

  if not qryClienteRNC_NUMERO.IsNull then
  UProcesarDevolucion.cedula   := qryClienteRNC_NUMERO.Value;
  UProcesarDevolucion.cedula   := qryClienteCEDULA.Value;
  UProcesarDevolucion.direccion:= qryClienteDIRECCION_CONT.Value;
  UProcesarDevolucion.ciudad   := qryClienteCIUDAD.Value;// '';
  UProcesarDevolucion.monto    := ABS(Totalestotalneto.Value);
  UProcesarDevolucion.status   := 'A';

  UProcesarDevolucion.codig_usuario := VarUsuarioGlb;
  UProcesarDevolucion.fechaInsert   := Now;
  UProcesarDevolucion.fechaUpdate   := Now;
  UProcesarDevolucion.codigousuarioupd := VarUsuarioGlb;
  UProcesarDevolucion.tipodoc := 5; //Nota Credito
  UProcesarDevolucion.Moneda := trim(TotalesMoneda.Value);
  
  //Not used in devolucion
  UProcesarDevolucion.numeroFactura := -1;//rxVentaNumeroFactura.Value;
  //No afectar factura pendiente
  UProcesarDevolucion.AfectaFactPend := false;

  UProcesarDevolucion.Ejecutar('04');//Comprogante Fiscal Nota de Credito
end;

procedure TfrmProcVentaRapida.BitBtn4Exit(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmProcVentaRapida.RegistroServicioTaller1Click(
  Sender: TObject);
begin
  frmOperacionServicios:=TfrmOperacionServicios.Create(Nil);
  try
    frmOperacionServicios.Showmodal;
  finally
  frmOperacionServicios.Free;
  frmOperacionServicios:=Nil;
  end;
{
  frmRegServicioTaller:=TfrmRegServicioTaller.Create(Nil);
  try
    frmRegServicioTaller.Showmodal;
  finally
  frmRegServicioTaller.Free;
  frmRegServicioTaller:=Nil;
  end;}
end;

procedure TfrmProcVentaRapida.BitBtn24Click(Sender: TObject);
begin
  {ImageForm:=TImageForm.create(Nil);
  try
    if not qryProductosCodigo.IsNull then
    ImageForm._rutaInv := qryProductosCodigo.AsString
    else
    ImageForm._rutaInv := '';
    ImageForm.setDirectorio;
    ImageForm.Showmodal;
  finally
  ImageForm.Free;
  ImageForm:=Nil;
  end;}
  frmShowImages:=TfrmShowImages.Create(Nil);
  try
    if (rxVentaRutaImagen.IsNull or (rxVentaRutaImagen.Value = '')) then
    rxVentaRutaImagen.Value := BuscarRutaImagen(rxVentaCodArticulo.Value);
    frmShowImages.FDirectory:= rxVentaRutaImagen.Value;
    frmShowImages.LoadImageData;
    frmShowImages.ShowModal;
  finally
  frmShowImages.free;
  frmShowImages:=Nil;
  end;
end;

procedure TfrmProcVentaRapida.TotalesAfterScroll(DataSet: TDataSet);
begin
 if (TotalesMoneda.Value = '') then Exit;
  PAbrirtablaMoneda(TotalesMoneda.Value,GlbFechaTrnDiaria);
  lblTasa.Caption:=Concat('1 =',SimboloMoneda(rxVentaMonedaBase.Value))+dmdatos.qryTasaVALORMONEDA.AsString;
  Totalestotalneto.DisplayFormat:=Concat(SimboloMoneda(TotalesMoneda.Value),',0.00');
end;

procedure TfrmProcVentaRapida.ProcCalculoDivisa;
var
  guardarRec : TBookMark;
begin
  if rxVenta.RecordCount > 0 then
  begin
    if rxVenta.State = dsBrowse then
    begin
      guardarRec := rxVenta.GetBookmark;
      rxVenta.First;
      rxVenta.AutoCalcFields := False;
      While Not rxVenta.Eof Do
      begin
        rxVenta.Edit;
        rxVentaMoneda.Value := totalesmoneda.Value;
        rxVenta.Post;
        //WriteToLog('Post rxVenta - Line 8055');
        rxVenta.Next;
      end;
      rxVenta.GotoBookmark(guardarRec);
      rxventa.FreeBookmark(guardarRec);
      rxVenta.AutoCalcFields:=True;
    end else
    begin
      if rxVenta.State In [dsBrowse] Then
      rxVenta.Edit;
      rxVentaMoneda.Value := totalesmoneda.Value;
    end;
    if rxVenta.State In [dsBrowse] Then
       rxVenta.Edit;

    ProcesaCalculos;

    if rxVenta.State In [dsInsert, dsEdit] Then
    begin
       rxVenta.Post;
       //WriteToLog('Post rxVenta - Line 8075');
    end;

  end;

end;

procedure TfrmProcVentaRapida.RxDBLookupCombo2Change(Sender: TObject);
begin
  //glbMoneda:= TotalesMoneda.AsInteger;
  GlbMoneda := tblMonedaCODIGO.AsInteger;
  if Totales.State = dsBrowse then
  Totales.Edit;
  if rxVenta.State In [dsBrowse] Then
  if rxVenta.RecordCount > 0 then
  begin
    rxVenta.Edit;
    ProcCalculoDivisa;
  end;
  Refresh;
end;

procedure TfrmProcVentaRapida.RxDBLookupCombo2Enter(Sender: TObject);
begin
  if Totales.State = dsBrowse then
  Totales.Edit;
end;

procedure TfrmProcVentaRapida.RxDBLookupCombo2Exit(Sender: TObject);
begin
  GlbMoneda:= TotalesMoneda.AsInteger;
  if Totales.State in [dsInsert, dsEdit] then
  Totales.Post;
  if Totales.State = dsBrowse then
  Totales.Edit;
  ProcCalculoDivisa;

  Totalestotalneto.DisplayFormat:=Concat(SimboloMoneda(TotalesMoneda.Value),',0.00');
end;

procedure TfrmProcVentaRapida.RxDBLookupCombo2Click(Sender: TObject);
begin
  if Totales.State = dsBrowse then
  Totales.Edit;
end;

procedure TfrmProcVentaRapida.tblMonedaAfterScroll(DataSet: TDataSet);
begin
  GlbMoneda := tblMonedaCODIGO.AsInteger;
end;

function TfrmProcVentaRapida.BuscarRutaImagen(
  codProducto: Integer): String;
begin
  qryInvRutaImg.Close;
  qryInvRutaImg.Params[1].Value:= codProducto;
  qryInvRutaImg.Params[0].Value:= glbCia_Key;
  qryInvRutaImg.Open;
  if not qryInvRutaImgRUTAIMAGEN.IsNull then
  result:=qryInvRutaImgRUTAIMAGEN.Value
  else result:=GlbRootImg;
end;

procedure TfrmProcVentaRapida.BitBtn25Click(Sender: TObject);
begin
  if rxVenta.RecordCount = 0 then Exit;
  frmDistribuirPgoVenta:=TfrmDistribuirPgoVenta.Create(Nil);
  try
    if Totales.State = dsBrowse then
    Totales.Edit;
    if TotalesMoneda.IsNull then
    TotalesMoneda.Value := IntToStr(GlbMonedaBase);
    TotalesMontoNotaCredito.Value:=
    frmDistribuirPgoVenta.GetMontoNotaCreditoPendiente(TotalesMoneda.Value, tablaPropietarioCodigoPropietario.Value);
    frmDistribuirPgoVenta.Label11.Caption:=TotalesMontoNotaCredito.AsString;
    Totales.Post;
    if dmcxc.rxIngresoEnTarjeta.State = dsInactive then
    dmcxc.rxIngresoEnTarjeta.Open
    else
    dmcxc.rxIngresoEnTarjeta.Insert;
    frmDistribuirPgoVenta.Showmodal;
    if dmcxc.rxIngresoEnTarjeta.state in [dsEdit, dsInsert] then
    dmcxc.rxIngresoEnTarjeta.Post;
  finally
  frmDistribuirPgoVenta.Free;
  frmDistribuirPgoVenta:=Nil;
  end;
  edit1.Text := format('%f',[
  TotalesMontoEnEfectivo.Value +
  TotalesMontoEnTarjeta.Value +
  TotalesMontoEnCheque.Value +
  TotalesMontoEnBonos.Value+
  TotalesMontoNCRAplicado.Value]);
  Edit1Exit(Self);
end;

procedure TfrmProcVentaRapida.ProcInsertarDetPagos(numtrn : integer);
begin
  if dmcxc.rxIngresoEnTarjetaMONTOAUTORIZADO.IsNull then exit;
  dmcxc.tblDetallePagos.Close;
  dmcxc.tblDetallePagos.Open;
  dmcxc.tblDetallePagos.Append;
  dmcxc.tblDetallePagosFECHA.Value              :=GlbFechaTrnDiaria;
  dmcxc.tblDetallePagosTIPO_TARJETA.Value       :=dmcxc.rxIngresoEnTarjetaTipoTarjeta.Value;
  dmcxc.tblDetallePagosNUMERO_TARJETA_CRED.Value:=dmcxc.rxIngresoEnTarjetaNumeroTarjeta.Value;
  dmcxc.tblDetallePagosANO_VENCE.Value := dmcxc.rxIngresoEnTarjetaAnio.Value;
  dmcxc.tblDetallePagosMES_VENCE.Value := dmcxc.rxIngresoEnTarjetaMes.Value;
  dmcxc.tblDetallePagosMONTO_PAGADO.Value      := dmcxc.rxIngresoEnTarjetaMONTOAUTORIZADO.Value;
  dmcxc.tblDetallePagosNUMERO_APROBACION.Value := dmcxc.rxIngresoEnTarjetaNumeroAutorizacion.Value;
  dmcxc.tblDetallePagosTIPO.Value                :=1;//al contado
  dmcxc.tblDetallePagosCODIGO_PROVEEDOR.Value := dmcxc.rxIngresoEnTarjetaProveedorTarjeta.Value;

  if Not dmcxc.rxIngresoEnTarjetaMONTOAUTORIZADO.IsNull then
  dmcxc.tblDetallePagosTIPO_PAGO.Value        := 2;//tarjeta
  //else
  //if not dmcxc.rxIngChequeDetNumero_Cheque.IsNull then
  //dmcxc.tblDetallePagosTIPO_PAGO.Value        := 3 //cheque
  //else
  //if not dmcxc.rxIngresoEnBonosNumero.IsNull then
  //dmcxc.tblDetallePagosTIPO_PAGO.Value        := 9; //bono - cupon

  dmcxc.tblDetallePagosNUMERO_CHEQUE.Value    := dmcxc.rxIngChequeDetNumero_Cheque.Value;
  dmcxc.tblDetallePagosCOD_BANCO_CHEQUE.Value := dmcxc.rxIngChequeDetCodigo_Banco.Value;
  dmcxc.tblDetallePagosSERIE_TRN.Value        := numtrn;
  dmcxc.tblDetallePagosAREA_TRANS.Value       := 1;//Ventas
  //dmcxc.tblDetallePagosNUMERO_CUPON.value   := dmcxc.rxIngresoEnBonosNumero.AsInteger;
  dmcxc.tblDetallePagos.Post;
  dmcxc.tblDetallePagos.ApplyUpdates;
  if not dmcxc.tblDetallePagos.Transaction.InTransaction then
  dmcxc.tblDetallePagos.Transaction.StartTransaction;
  try
    dmcxc.tblDetallePagos.Transaction.CommitRetaining;
  finally
  dmcxc.tblDetallePagos.Transaction.RollbackRetaining;
  end;  

end;

procedure TfrmProcVentaRapida.ProcInsertarDetBono(numtrn: integer);
begin
  if dmcxc.rxIngresoEnBonosNumero.IsNull then exit;
  dmcxc.tblDetallePagos.Close;
  dmcxc.tblDetallePagos.Open;
  dmcxc.tblDetallePagos.Append;
  dmcxc.tblDetallePagosFECHA.Value              :=GlbFechaTrnDiaria;
  //dmcxc.tblDetallePagosTIPO_TARJETA.Value       :=dmcxc.rxIngresoEnTarjetaTipoTarjeta.Value;
  //dmcxc.tblDetallePagosNUMERO_TARJETA_CRED.Value:=dmcxc.rxIngresoEnTarjetaNumeroTarjeta.Value;
  //dmcxc.tblDetallePagosANO_VENCE.Value := dmcxc.rxIngresoEnTarjetaAnio.Value;
  //dmcxc.tblDetallePagosMES_VENCE.Value := dmcxc.rxIngresoEnTarjetaMes.Value;
  //dmcxc.tblDetallePagosMONTO_PAGADO.Value      := dmcxc.rxIngresoEnTarjetaMONTOAUTORIZADO.Value;
  //dmcxc.tblDetallePagosNUMERO_APROBACION.Value := dmcxc.rxIngresoEnTarjetaNumeroAutorizacion.Value;
    dmcxc.tblDetallePagosTIPO.Value             := 1;//contado
  //dmcxc.tblDetallePagosCODIGO_PROVEEDOR.Value := dmcxc.rxIngresoEnTarjetaProveedorTarjeta.Value;

  //if Not dmcxc.rxIngresoEnTarjetaMONTOAUTORIZADO.IsNull then
  //dmcxc.tblDetallePagosTIPO_PAGO.Value        := 2;//tarjeta
  //else
  //if not dmcxc.rxIngChequeDetNumero_Cheque.IsNull then
  //dmcxc.tblDetallePagosTIPO_PAGO.Value        := 3 //cheque
  //else
  //if not dmcxc.rxIngresoEnBonosNumero.IsNull then
  dmcxc.tblDetallePagosTIPO_PAGO.Value        := 9; //bono - cupon

  //dmcxc.tblDetallePagosNUMERO_CHEQUE.Value    := dmcxc.rxIngChequeDetNumero_Cheque.Value;
  //dmcxc.tblDetallePagosCOD_BANCO_CHEQUE.Value := dmcxc.rxIngChequeDetCodigo_Banco.Value;
  dmcxc.tblDetallePagosSERIE_TRN.Value        := numtrn;
  dmcxc.tblDetallePagosAREA_TRANS.Value       := 1;//Ventas
  dmcxc.tblDetallePagosNUMERO_CUPON.value     := dmcxc.rxIngresoEnBonosNumero.AsInteger;
  dmcxc.tblDetallePagos.Post;

  dmcxc.tblDetallePagos.ApplyUpdates;
  if not dmcxc.tblDetallePagos.Transaction.InTransaction then
  dmcxc.tblDetallePagos.Transaction.StartTransaction;
  try
    dmcxc.tblDetallePagos.Transaction.CommitRetaining;
  finally
  dmcxc.tblDetallePagos.Transaction.RollbackRetaining;
  end;

end;

procedure TfrmProcVentaRapida.ProcInsertarDetCheque(numtrn: integer);
begin
  if dmcxc.rxIngChequeDetCodigo_Banco.IsNull then exit;
  dmcxc.tblDetallePagos.Close;
  dmcxc.tblDetallePagos.Open;
  dmcxc.tblDetallePagos.Append;
  dmcxc.tblDetallePagosFECHA.Value :=GlbFechaTrnDiaria;
  //dmcxc.tblDetallePagosTIPO_TARJETA.Value       :=dmcxc.rxIngresoEnTarjetaTipoTarjeta.Value;
  //dmcxc.tblDetallePagosNUMERO_TARJETA_CRED.Value:=dmcxc.rxIngresoEnTarjetaNumeroTarjeta.Value;
  //dmcxc.tblDetallePagosANO_VENCE.Value := dmcxc.rxIngresoEnTarjetaAnio.Value;
  //dmcxc.tblDetallePagosMES_VENCE.Value := dmcxc.rxIngresoEnTarjetaMes.Value;
  //dmcxc.tblDetallePagosMONTO_PAGADO.Value      := dmcxc.rxIngresoEnTarjetaMONTOAUTORIZADO.Value;
  //dmcxc.tblDetallePagosNUMERO_APROBACION.Value := dmcxc.rxIngresoEnTarjetaNumeroAutorizacion.Value;
  dmcxc.tblDetallePagosTIPO.Value             := 1;//CONTADO
  //dmcxc.tblDetallePagosCODIGO_PROVEEDOR.Value := dmcxc.rxIngresoEnTarjetaProveedorTarjeta.Value;

  //if Not dmcxc.rxIngresoEnTarjetaMONTOAUTORIZADO.IsNull then
  //dmcxc.tblDetallePagosTIPO_PAGO.Value        := 2;//tarjeta
  //else
  //if not dmcxc.rxIngChequeDetNumero_Cheque.IsNull then
  //dmcxc.tblDetallePagosTIPO_PAGO.Value        := 3 //cheque
  //else
  //if not dmcxc.rxIngresoEnBonosNumero.IsNull then
  dmcxc.tblDetallePagosTIPO_PAGO.Value        := 9; //bono - cupon

  dmcxc.tblDetallePagosNUMERO_CHEQUE.Value    := dmcxc.rxIngChequeDetNumero_Cheque.Value;
  dmcxc.tblDetallePagosCOD_BANCO_CHEQUE.Value := dmcxc.rxIngChequeDetCodigo_Banco.Value;
  dmcxc.tblDetallePagosSERIE_TRN.Value        := numtrn;
  dmcxc.tblDetallePagosAREA_TRANS.Value       := 1;//Ventas
  //dmcxc.tblDetallePagosNUMERO_CUPON.value     := dmcxc.rxIngresoEnBonosNumero.AsInteger;
  dmcxc.tblDetallePagos.Post;
  dmcxc.tblDetallePagos.ApplyUpdates;
  if not dmcxc.tblDetallePagos.Transaction.InTransaction then
  dmcxc.tblDetallePagos.Transaction.StartTransaction;
  try
    dmcxc.tblDetallePagos.Transaction.CommitRetaining;
  finally
  dmcxc.tblDetallePagos.Transaction.RollbackRetaining;
  end;

end;

procedure TfrmProcVentaRapida.Poliza1Click(Sender: TObject);
begin
  frmPolizas:=TfrmPolizas.Create(Nil);
  try
    frmPolizas.Showmodal;
  finally
  frmPolizas.Free;
  frmPolizas:=Nil;
  end;
end;

procedure TfrmProcVentaRapida.ReImprimeDevolucionsinFact1Click(
  Sender: TObject);
begin
  //Usado para filtrar dmfactura.qryventafactura
  dmFactura.formaPago := 6;//Devolucion
  if UProcesarDevolucion.numeroFactura <= 0 then
  UProcesarDevolucion.numeroFactura := StrToInt(InputBox('Re-Imprimir factura devolucion','Entre número devolución',''));
  dmCompania.tblCompania.Close;
  dmCompania.tblCompania.Open;
  dmCompania.tblCompania.Locate('codigo', glbCia_Key, []);
  dmfactura.qryFactReimpMaster.Close;
  dmfactura.qryFactReimpMaster.SQL.Text := dmfactura.qryFactReimpMasterDevol.SQL.Text;
  //dmfactura.qryFactReimpMaster.Params[0].ParamType := ptInput;
  dmfactura.qryFactReimpMaster.Params[0].AsInteger := UProcesarDevolucion.numeroFactura;
  //dmfactura.qryFactReimpMaster.Params[1].ParamType := ptInput;
  dmfactura.qryFactReimpMaster.Params[1].AsSmallInt:= 6;//Devolucion
  if not dmfactura.qryFactReimpMaster.Prepared then
  dmfactura.qryFactReimpMaster.Prepare;
  dmfactura.qryFactReimpMaster.Open;
  if dmfactura.qryFactReimpMaster.RecordCount = 0 then
  begin
    MessageDlg('Numero Devolucion no encontrada, verifique.',mtInformation,[mbok], 0);
    exit;
  end;
  dmfactura.qryFactReimpDet.Close;
  dmfactura.qryFactReimpDet.Sql.Text := dmfactura.qryFactReimpDetDevol.Sql.Text;
  dmfactura.qryFactReimpDet.Params[0].Value:=dmfactura.qryFactReimpMasterNUMERO.Value;
  dmfactura.qryFactReimpDet.Open;
  dmfactura.qryFactReimpDet.Last;
  dmfactura.qryFactReimpDet.Close;

    frmConsultaFacturas:=TfrmConsultaFacturas.Create(Nil);
    try
      frmConsultaFacturas.rdgCredito.Checked := True;
      frmConsultaFacturas.EditN1.SetInteger(dmfactura.qryFactReimpMaster.Params[0].Value);
      dmFactura.qryVentaFactura.SQL.Text:=
      dmFactura.qryVentaFactDevolucion_base.SQL.Text +' Where VENTAS_MAST.NUMERO_doc_pago =:numero '+
      ' And ventas_mast.cia_key =:ciakey'+
      ' And ventas_mast.FORMA_PAGO = 6 '+
      ' And ventas_mast.codigo_cte = '+dmfactura.qryFactReimpMasterCODIGO_CTE.AsString;

      dmFactura.qryVentaFactura.Params[0].AsInteger := UProcesarDevolucion.numeroFactura;
      GlbcodVendedor:= dmFactura.qryVentaFacturaCODIGO_VENDEDOR.Value;
    //dmFactura.qryVentaFactura.Params[1].AsInteger := UProcesarDevolucion.codigo_cte;
      dmFactura.qryVentaFactura.Params[1].AsInteger := glbCia_Key;
      dmFactura.qryVentaFactura.Open;
      GlbcodVendedor:= dmFactura.qryVentaFacturaCODIGO_VENDEDOR.Value;
      if dmFactura.qryVentaFactura.RecordCount = 0 then
      begin
        MessageDlg('Record para devolución no encontrado',mtInformation,[mbok],0);
        Exit;
      end;
      dmFactura.qryDatosTrncxc.Close;  //dmFactura.qryVentaFactura.RecordCount;
      dmFactura.qryDatosTrncxc.Params[0].AsInteger:= dmFactura.qryVentaFacturaNUMERO_DOC_PAGO.AsInteger;
      dmFactura.qryDatosTrncxc.Params[1].AsInteger:= glbCia_Key;
      dmFactura.qryDatosTrncxc.Open;
      //frmConsultaFacturas.BitBtn1Click(Self);
    finally
    if Assigned(frmConsultaFacturas) then
    frmConsultaFacturas.Free;
    frmConsultaFacturas:=Nil;
    end;

  if (dmFactura.qryVentaFacturaTIPO_FACTURA.Value = 6 ) then //
  begin
    qckFactCredArtioffice8_5_F_1:=TqckFactCredArtioffice8_5_F_1.Create(nil);
    try
      if (rxVentaNumeroFactura.AsString <> '') then
      qckFactCredArtioffice8_5_F_1.qrLabelFactOrigen.Caption:='#Factura: '+rxVentaNumeroFactura.AsString
      else
      qckFactCredArtioffice8_5_F_1.qrLabelFactOrigen.Caption:='';
      qckFactCredArtioffice8_5_F_1.QRLabel4.Caption:='DEVOLUCION';
      qckFactCredArtioffice8_5_F_1.Preview;
    finally
    qckFactCredArtioffice8_5_F_1.free;
    qckFactCredArtioffice8_5_F_1:=nil;
    end;
  end else
  begin
    ImpFacturaservicio(dmfactura.qryFactReimpMaster.Params[0].Value,True);
  end;
  Label36.Visible:=False;
  Label36.caption:='';
  rdgFactServicio.Checked:=False;
Label36.Visible:=False;
    Label36.caption:='';
    rdgFactServicio.Checked:=False;
    Application.ProcessMessages;
    qryInventario.Close;
    qryInventario.Open;
    qryProductos.Close;
    qryProductos.Open;
    qryCliente.Close;
    qryCliente.Open;
    lblFechaCotizacion.Visible:= False;
    dbFechaCotizacion.Visible := False;
    Label36.Visible:=False;
    glbcodVendedor := -1;
    EsModificandoCotiza:=False;
    label36.Caption:='';
    NoTieneCredito:=False;
    Refresh;
    EsDevolucion:=False;
    Totales.Close;
    Totales.Open;
    lblProcDev.Visible := False;

end;

procedure TfrmProcVentaRapida.DescargaNotaCredito;
var
  resto : Currency;
begin
  //if Not (CheckBox4.Checked) then Exit;
  if (TotalesMontoNCRAplicado.Value > 0) then
  begin
    dmDatos.tblDevolucionAbierta.First;
    resto:=TotalesMontoNCRAplicado.Value;
    While Not dmDatos.tblDevolucionAbierta.Eof Do
    begin
      dmDatos.tblDevolucionAbierta.Edit;
      if (resto >= dmDatos.tblDevolucionAbiertaMONTO_PENDIENTE.Value) then
      begin
        resto:=resto - dmDatos.tblDevolucionAbiertaMONTO_PENDIENTE.Value;
        dmDatos.tblDevolucionAbierta.Edit;
        dmDatos.tblDevolucionAbiertaMONTO_PENDIENTE.Value := 0;
        dmDatos.tblDevolucionAbiertaSTATUS.Value   := 'R';
        dmDatos.tblDevolucionAbiertaFECHA_MOD.Value:= Now;
        dmDatos.tblDevolucionAbiertaMOD_POR.Value  := StrUserName;
      end else
      begin
        dmDatos.tblDevolucionAbiertaMONTO_PENDIENTE.Value:=
        dmDatos.tblDevolucionAbiertaMONTO_PENDIENTE.Value - resto;
        resto:=0;
        //TotalesMontoNCRAplicado.Value;
        dmDatos.tblDevolucionAbiertaFECHA_MOD.Value:= Now;
        dmDatos.tblDevolucionAbiertaMOD_POR.Value  := StrUserName;
      end;
      GlbSalvarQuery(dmDatos.tblDevolucionAbierta);
      if (resto <= 0) then break;
      dmDatos.tblDevolucionAbierta.Next;
    end;
    dmDatos.tblDevolucionAbierta.Close;
    dmDatos.tblDevolucionAbierta.Open;
  end;
end;

procedure TfrmProcVentaRapida.CheckBox4Click(Sender: TObject);
begin
  Edit1.Text:='';
  if Not CheckBox4.Checked then
  begin
    Totales.Edit;
    TotalesMontoNotaCredito.Value := 0;
    TotalesMontoNCRAplicado.Value := 0;

    Totalesdevolucion.Value := 0;
    Totales.Post;
    ProcesaCalculos;
    if rxVenta.State In [dsInsert, dsEdit] Then
    begin
      rxVenta.Post;
      //WriteToLog('Post rxVenta - Line 8417');
    end;
  end else
  if CheckBox4.Checked then
  begin
    Totales.Edit;
    Totalesdevolucion.Value := 0;
    Totales.Post;
    //t SetMontoNotaCredito;
    ProcesaCalculos;
  end;
end;

procedure TfrmProcVentaRapida.SetMontoNotaCredito;
begin
  if (tablaPropietarioCodigoPropietario.Value > 0)  and (not TotalesMoneda.IsNull) then
  begin
    dmDatos.tblDevolucionAbierta.Close;
    dmDatos.tblDevolucionAbierta.Params[0].Value := TotalesMoneda.Value;//moneda
    dmDatos.tblDevolucionAbierta.Params[1].Value := tablaPropietarioCodigoPropietario.Value; //codigocte
    dmDatos.tblDevolucionAbierta.Open;
    dmDatos.tblDevolucionAbierta.First;
    if Totales.State = dsBrowse then
    Totales.Edit;
    TotalesMontoNotaCredito.Value := 0;
    While Not dmDatos.tblDevolucionAbierta.Eof Do
    begin
      TotalesMontoNotaCredito.Value :=
      TotalesMontoNotaCredito.Value +
      dmDatos.tblDevolucionAbiertaMONTO_PENDIENTE.Value;
     dmDatos.tblDevolucionAbierta.Next;
    end;
  end;
end;

procedure TfrmProcVentaRapida.BitBtn26Click(Sender: TObject);
begin
  if (rxVenta.RecordCount > 0) and (rxVenta.State = dsbrowse) then
  begin
    rxVenta.Edit;
    cboxTipoUnidad.SetFocus;
  end;
end;

procedure TfrmProcVentaRapida.rxVentaBeforeInsert(DataSet: TDataSet);
begin
  if rxVentaSerie.IsNull then
  rxVenta.Cancel;
end;

procedure TfrmProcVentaRapida.SetPrecioPorCantidad;
begin
  QryPrecios.Close;
  QryPrecios.Params[0].Value:=rxVentaCodArticulo.Value;
  QryPrecios.Open;
  if rxVenta.State = dsBrowse then
  rxVenta.Edit;
  if QryPrecios.Locate('Codigo', rxVentaCodArticulo.Value,[]) then
  begin
    case RxSpinEdit1.AsInteger Of
    1: begin
         if QryPreciosPRECIOVENTA1.Value > 0 then
         rxVentaPrecio.Value := QryPreciosPRECIOVENTA1.Value;
       end;
    2: begin
        if QryPreciosPRECIOVENTA2.Value > 0 then
        rxVentaPrecio.Value := QryPreciosPRECIOVENTA2.Value;
       end;
    3:begin
        if QryPreciosPRECIOVENTA3.Value > 0 then
        rxVentaPrecio.Value := QryPreciosPRECIOVENTA3.Value;
      end;
    4: begin
         if QryPreciosPRECIOVENTA4.Value > 0 then
         rxVentaPrecio.Value := QryPreciosPRECIOVENTA4.Value;
      end;
    end;//case
  end;
end;

procedure TfrmProcVentaRapida.BitBtn1Enter(Sender: TObject);
begin
  BitBtn1.Font.Color := clRed;
  edtCodigo.Text:='';  
end;

function TfrmProcVentaRapida.VerificaRecordsVenta: boolean;
var
  guardaR : TBookmark;
begin
  result:=False;
  guardaR := rxVenta.GetBookmark;
  rxVenta.First;
  while not rxVenta.Eof do
  begin
    if (rxVentaStatus.Value = 'A')  or (rxVentaStatus.Value = 'I') then
    begin
      result:=true;
      break;
    end
    else result:=false;
    rxVenta.Next;
  end;
  rxventa.GotoBookmark(guardaR);
  rxVenta.GotoBookmark(guardaR);
  rxventa.FreeBookmark(guardaR);
end;

procedure TfrmProcVentaRapida.BitBtn1Exit(Sender: TObject);
begin
  BitBtn1.Font.Color := clBlack;
end;

procedure TfrmProcVentaRapida.DBRadioGroup1Enter(Sender: TObject);
begin
  if (rxVenta.RecordCount > 0) then
  if rxVenta.State in [dsEdit, dsInsert] then
  begin
    rxVenta.Edit;
  end;
end;

procedure TfrmProcVentaRapida.DBRadioGroup1Exit(Sender: TObject);
begin
  if frmProcVentaRapida.Showing then
  dbedit2.SetFocus;
end;

procedure TfrmProcVentaRapida.Button2Click(Sender: TObject);
var
  mmonto : extended;
begin
  dmPagosTarjeta.tblDetallePagos.Close;
  dmPagosTarjeta.tblDetallePagos.Params[0].Value:=0;//
  dmPagosTarjeta.tblDetallePagos.Open;

  //Usado para aceptar pagos combinados.
  //Para ventas Area Trans = 1
  //Para Cobro facturas Area Trans = 2
  //Para Nota Crédito Area Trans = 3
  frmPagosCombinados:=TfrmPagosCombinados.Create(Nil);
  try
  //frmPagosCombinados.EditN1.SetFloat(0.00);
  //frmPagosCombinados.EditN2.SetFloat(0.00);
  //frmPagosCombinados.EditN3.SetFloat(0.00);
  //frmPagosCombinados.EditN4.SetFloat(0.00);
  frmPagosCombinados.rxCobros.Close;
  frmPagosCombinados.rxCobros.Open;
  frmPagosCombinados.areaTrans:=1;//ventas;
  frmPagosCombinados.rxCobros.Insert;
  frmPagosCombinados.rxCobrostotalNeto.Value:=Totalestotalneto.Value;
  frmPagosCombinados.rxCobrosEfectivo.Value:=0;
  frmPagosCombinados.rxCobrosTarjeta.Value:=0;
  frmPagosCombinados.rxCobrosCheque.Value:=0;
  frmPagosCombinados.rxCobrosBono.Value:=0;
  frmPagosCombinados.rxPagos.close;
  frmPagosCombinados.rxPagos.open;
  frmPagosCombinados.ShowModal;

  rxpagos.Close;
  rxpagos.open;
  frmPagosCombinados.rxPagos.First;
  while not frmPagosCombinados.rxPagos.eof do
  begin
    rxpagos.Insert;
    rxPagosSerie.Value:= frmPagosCombinados.rxPagosSerie.Value;
    rxpagos.Post;
    frmPagosCombinados.rxPagos.Next;
  end;
  mmonto := frmPagosCombinados.rxCobrosEfectivo.Value +
  frmPagosCombinados.rxCobrosTarjeta.Value +
  frmPagosCombinados.rxCobrosCheque.Value +
  frmPagosCombinados.rxCobrosBono.Value;
  Edit1.Text := Format('%8.2f',[mmonto]);
  finally
  frmPagosCombinados.Free;
  frmPagosCombinados:=Nil;
  end;
  Edit1.SetFocus;
  BitBtn2Click(Self);
  Edit1Exit(Self);
  BitBtn4.SetFocus;

end;

procedure TfrmProcVentaRapida.PrepararInfoFiscal(numerotrn: integer);
begin
  //Generar y asignar Numero de Comprobante Fiscal
  //usar parametro entrada para impresora fiscal
  //t dmreportes.qryDatosCajaImpUserCOD_CAJA
  //t dmreportes.qryDatosCajaImpUserID_FISCALPRINTER
  // GlbCodSucursal //Contiene codigo de sucursal
  dmReportes.qryDatosVentaMaster.Close;
  dmReportes.qryDatosVentaMaster.Params[0].Value:= numerotrn;
  dmReportes.qryDatosVentaMaster.Open;

  if (GlbModeloImpresora = GLBIFISCALOKI407FP) then
  begin
    dmReportes.qryDatosReimpDocFiscalOKI.Close;
    dmReportes.qryDatosReimpDocFiscalOKI.Params[0].Value :=numerotrn;
    dmReportes.qryDatosReimpDocFiscalOKI.Open;
  end;

  dmreportes.qryDatosReimpDocFiscal.Close;
  dmreportes.qryDatosReimpDocFiscal.Params[0].Value:= numerotrn;
  dmreportes.qryDatosReimpDocFiscal.Open;dmreportes.qryDatosReimpDocFiscal.Sql.Text
end;

procedure TfrmProcVentaRapida.Button1Click(Sender: TObject);
begin
  if (NumeroTrn <= 0) then
  begin
    NumeroTrn := StrToInt(InputBox('Test numero venta','Indique numero',''));
  end;
    dmdatos.qryConfCajaXusuario.Close;
    dmdatos.qryConfCajaXusuario.Open;
    dmdatos.qryConfCajaXusuario.Locate('COD_EMPLEADO',VarUsuarioGlb,[]);

    dmReportes.qryDatosCajaImpUser.close;
    dmReportes.qryDatosCajaImpUser.Params[0].Value:= VarUsuarioGlb;
    dmReportes.qryDatosCajaImpUser.Open;
    dmReportes.qryDatosCajaImpUser.Last;
    dmReportes.qryDatosCajaImpUser.RecordCount;
    GlbNombreFiletoPrint:= Format('%s%s%s%s%s%s%s',[dmReportes.qryDatosCajaImpUserRUTA_TICKET.Value,'\Recibo',Trim(GlbCodSucursal),Trim(GlbModeloImpresora),
    IntToStr(VarUsuarioGlb),IntToStr(NumeroTrn),'.txt']);
    
    PrepararInfoFiscal(NumeroTrn);
  //rxVentaNumeroRecibo
  frmTestImpresoraFiscal:=TfrmTestImpresoraFiscal.Create(Nil);
  try
    frmTestImpresoraFiscal.EsDevolucion:= EsDevolucion;
    frmTestImpresoraFiscal.LCantCopias := '2';//rxspinImpCantCopias.Text;
    frmTestImpresoraFiscal.Showmodal;
  finally
  frmTestImpresoraFiscal.Free;
  frmTestImpresoraFiscal:=Nil;
  end;
  NumeroTrn := 0;
  refresh;
end;

procedure TfrmProcVentaRapida.VerificaImpresoraFiscalM;
var
  archivo : String;
  tHoras : integer;
begin
  UGlobal.VerificaImpresoraFiscal;

  if not GlbImpresoraFOnline then
  begin
    BitBtn1.Enabled:=False;
    lblStatusImpFiscal.Visible:= False;
    lblStatusImpFiscal.Font.Color:= clRed;
    lblStatusImpFiscal.Font.Style := [fsBold];
    //label1.Caption :='Impresora fiscal fuera de linea, verifique';
  end else
  begin
    BitBtn1.Enabled:=True;
    lblStatusImpFiscal.Visible:=False;
    //label1.Caption:='';
    lblStatusImpFiscal.Font.Color := $000080FF;
    //tHoras := TotalHorasCierreZ(Date);
    if (TotalHorasCierreZ(Date) >=26) then
    begin
      MessageDlg('Es necesario realizar cierre Z', mtInformation,[mbok],0);
      BitBtn1.Enabled := False;
    end;
  end;
end;

procedure TfrmProcVentaRapida.qryVenceAfterClose(DataSet: TDataSet);
 var  x : Smallint;
begin
   x:=7;
end;

procedure TfrmProcVentaRapida.qryVenceBeforeClose(DataSet: TDataSet);
 var  x : Smallint;
begin
   x:=7;
end;

procedure TfrmProcVentaRapida.DBEdit5Enter(Sender: TObject);
begin
  if Totales.State = dsBrowse then
  EsBrowsing := True
  else EsBrowsing:=False;
end;

end.
