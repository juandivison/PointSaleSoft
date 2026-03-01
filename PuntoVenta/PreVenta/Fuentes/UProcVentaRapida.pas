unit UProcVentaRapida;
//UFormConsignacion
//FORMAFACOCO = formato facturas - conduce - cotizacion
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, RXDBCtrl, DBCtrls,
  Printers, DB, Mask, RxMemDS, EditNew, IBCustomDataSet, IBQuery, WinSkinData, Menus,
  ShellApi, RXCtrls, IBStoredProc, IBSQL, RxLookup, RXSpin, OleServer,
  RxVerInf, RxGIF, ExcelXP, comObj, rxToolEdit, RxDBComb, IBTable, ComCtrls,
  QRPrntr;

type
  TfrmProcVentaRapida = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
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
    edtCodigoNotEnUso: TEditN;
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
    Shape4: TShape;
    rxVentaNumeroTrn: TIntegerField;
    BuscarCliente1: TMenuItem;
    Cotizar1: TMenuItem;
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
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    rxVentaMontoDescuento: TFloatField;
    Totales: TRxMemoryData;
    Totalesmontodesc: TFloatField;
    Totalestotalneto: TFloatField;
    Totalesmontorecibido: TFloatField;
    Totalesdevolucion: TFloatField;
    dsTotales: TDataSource;
    DBText2: TDBText;
    DBText3: TDBText;
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
    Totalesncf_numero: TStringField;
    TotalesMontoInteres: TCurrencyField;
    DBText6: TDBText;
    Label17: TLabel;
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
    Label25Temporalrename: TLabel;
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
    TotalesMontoSubTotalIndirectos: TCurrencyField;
    DBText8: TDBText;
    Label29: TLabel;
    TotalesPorcGAdmin: TStringField;
    TotalesPorcItbisGAdmin: TStringField;
    TotalesPorcTrans: TStringField;
    TotalesPorcDirTec: TStringField;
    TotalesPorcItbisDirTec: TStringField;
    TotalesPorcImprevisto: TStringField;
    TotalesPorcItbisImprevisto: TStringField;
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
    DBText16: TDBText;
    Label44: TLabel;
    ReImprimeDocFiscal1: TMenuItem;
    Panel3: TPanel;
    Label45: TLabel;
    rxspinImpCantCopias: TRxSpinEdit;
    chboxSelTipoNCF: TCheckBox;
    ImpFiscal1: TMenuItem;
    Cancelar1: TMenuItem;
    CirreZ1: TMenuItem;
    CierreX1: TMenuItem;
    rxVentaRecargo: TCurrencyField;
    TotalesRecargo: TCurrencyField;
    StatusBar: TStatusBar;
    Estatus1: TMenuItem;
    DBEdit10: TDBEdit;
    RxDBLookupCombo3: TRxDBLookupCombo;
    Label46: TLabel;
    TotalesNCF: TStringField;
    TotalesTipoNCF: TStringField;
    TotalesTipoNCFIFiscal: TIntegerField;
    TotalesMontoExoneraITBIS: TCurrencyField;
    dbTextMontoExoneraITBIS: TDBText;
    chKDescuentoGlobal: TCheckBox;
    DBEdit11: TDBEdit;
    Label47: TLabel;
    DBText4: TDBText;
    rxVentaMontoTranspItbis: TCurrencyField;
    TotalesSubTotal: TCurrencyField;
    Totalesitbis: TCurrencyField;
    stpProcRecDatosReimpfiscal: TIBStoredProc;
    qryVerificaReciboPdte: TIBQuery;
    qryVerificaReciboPdteNIF_IMPRESO: TSmallintField;
    qryVerificaReciboPdteNUMERO: TIntegerField;
    qryVerificaReciboPdteFORMA_PAGO: TSmallintField;
    qryVerificaReciboPdteNUMERO_FACTURA: TIntegerField;
    qryVerificaReciboPdteNUMERO_DOC_PAGO: TIBStringField;
    RecuperaTicketfiscal1: TMenuItem;
    rxVentaMontoItbisRecargo: TCurrencyField;
    TotalesMontoITBISRecargo: TCurrencyField;
    rxVentaMontoDesGlobal: TCurrencyField;
    rxVentaIDTasaITBIS: TIntegerField;
    ibStpInsertCotizaDet: TIBStoredProc;
    BitBtn27: TBitBtn;
    BitBtn28: TBitBtn;
    rxVentaMontoItbRecItmConDesc: TCurrencyField;
    TotalesMontoItbRecItmConDesc: TCurrencyField;
    tblnif_ctrl: TIBDataSet;
    tblnif_ctrlNUMERO_TRN: TIntegerField;
    tblnif_ctrlNIF: TIBStringField;
    tblnif_ctrlFECHA_IN: TDateTimeField;
    tblnif_ctrlFECHA_UPDATE: TDateTimeField;
    tblnif_ctrlSTATUS: TIBStringField;
    ConciliarNIF1: TMenuItem;
    TotalesMontoDescGlbItbis: TCurrencyField;
    rxVentaMontoDescGlbDist: TCurrencyField;
    CancelarTicket1: TMenuItem;
    imbBarcode: TImage;
    rxVentamonto_tasa: TCurrencyField;
    rxdbgridTestTipofiscal: TRxDBGrid;
    PopupMenu2: TPopupMenu;
    VerDetalleVenta1: TMenuItem;
    IBQuery1: TIBQuery;
    PopupMenu3: TPopupMenu;
    VerTipoComprobantes1: TMenuItem;
    lblRNC: TLabel;
    ListarPuertosCom1: TMenuItem;
    Alquiler1: TMenuItem;
    Lavanderia1: TMenuItem;
    Costura1: TMenuItem;
    rxVentaCantPax: TIntegerField;
    DBEdit12: TDBEdit;
    Label48: TLabel;
    updTipoRetencionVta: TIBSQL;
    panelFastFood: TPanel;
    DBText17: TDBText;
    Label49: TLabel;
    Label50: TLabel;
    TotalesPropina: TCurrencyField;
    TotalesPropinaLegal: TCurrencyField;
    DBEdit13: TDBEdit;
    chkNoLeyPropina: TCheckBox;
    qryCheckDetVta: TIBQuery;
    rxdblookupTipoUnidad: TRxDBLookupCombo;
    dsqryPrecioUnidadSurt: TDataSource;
    ProductName: TLabel;
    Version: TLabel;
    BuscarRNCDGII1: TMenuItem;
    DetallePosExtra1: TMenuItem;
    ProgressBar1: TProgressBar;
    rxPreventaticket_id: TIntegerField;
    qryProductosIDTASAITBIS: TSmallintField;
    qryInventarioIDTASAITBIS: TSmallintField;
    DBStatusLabel2: TDBStatusLabel;
    rxVentaDC_ITBIS_CLD: TCurrencyField;
    rxVentaTC_MONTOITBISRECARGO_GLB: TCurrencyField;
    rxVentaTC_MONTOITBISRECARGO_ITM: TCurrencyField;
    lblTotalItem: TLabel;
    rxVentaPorcTasaItbisCld: TStringField;
    BitBtn30: TBitBtn;
    Log1: TMenuItem;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Extras1: TMenuItem;
    DesactivarSkin1: TMenuItem;
    TotalesSubTotalScreen: TCurrencyField;
    Label54: TLabel;
    BitBtn32: TBitBtn;
    qryValidaVta: TIBQuery;
    edtCodigo: TEdit;
    InactivaReciboFarmacia1: TMenuItem;
    rxBckVta: TRxMemoryData;
    rxBckVtaSerie: TIntegerField;
    rxBckVtaFecha: TDateTimeField;
    rxBckVtaCant: TFloatField;
    rxBckVtaPrecio: TCurrencyField;
    rxBckVtaCodArticulo: TIntegerField;
    rxBckVtaDup: TIntegerField;
    rxOfertas: TRxMemoryData;
    rxOfertasserie: TIntegerField;
    rxOfertascodProd: TIntegerField;
    rxOfertascant: TCurrencyField;
    rxOfertastipoUnidadVta: TIntegerField;
    rxOfertascant_tipound: TCurrencyField;
    rxVentaCantExcedeInv: TIntegerField;
    ImprimirOrdenEntrega1: TMenuItem;
    Conduce1: TMenuItem;
    ConfirmarConduce2: TMenuItem;
    ActualizaConduce1: TMenuItem;
    ReImprimeFactRest1: TMenuItem;
    ReImprimeTicketVta1: TMenuItem;
    RxDBLookupCombo4: TRxDBLookupCombo;
    Label55: TLabel;
    qryEmpleado: TIBQuery;
    dsqryEmpleado: TDataSource;
    qryClienteNOMBRECLIENTE: TIBStringField;
    rxDataAnt: TRxMemoryData;
    rxDataAntSerie: TIntegerField;
    rxDataAntCant: TCurrencyField;
    rxDataAntCodigoProd: TIntegerField;
    rxDataAntCantNueva: TCurrencyField;
    rxDataAntCantFinal: TCurrencyField;
    dsrxDataAnt: TDataSource;
    ReImprimeConduce1: TMenuItem;
    rxVentaFICHA_VEH: TIntegerField;
    panelDatoConduceCte: TPanel;
    dsqryVehiculos: TDataSource;
    qryVehiculos: TIBQuery;
    qryVehiculosFICHA: TIntegerField;
    qryVehiculosPLACA: TIBStringField;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    DBEdit14: TDBEdit;
    RxDBLookupCombo5: TRxDBLookupCombo;
    DBEdit15: TDBEdit;
    qryCteTieneVta: TIBQuery;
    qryCteTieneVtaVALOR_TOTAL_DET: TFloatField;
    lblAvisoCte: TLabel;
    qryValidaPosExtra: TIBQuery;
    qryValidaPosExtraVALOR: TFloatField;
    rxVentaNUM_CONDUCE_CTE: TStringField;
    rxVentaNUM_IDENT: TStringField;
    MedicamentosControlados1: TMenuItem;
    Cobertura1: TMenuItem;
    rxCobertura: TRxMemoryData;
    rxCoberturaNumero: TIntegerField;
    rxCoberturaIDARS: TIntegerField;
    rxCoberturaNum_Autorizacion: TStringField;
    rxCoberturaNombre_Medico: TStringField;
    rxCoberturaExequatur: TStringField;
    rxCoberturaEspecialidad: TStringField;
    rxCoberturaDiagnostico: TMemoField;
    rxCoberturaMontoCobertura: TCurrencyField;
    rxCoberturaAfiliado: TStringField;
    rxCoberturaPorcDescuento: TCurrencyField;
    rxCoberturaMontoAsegurado: TCurrencyField;
    rxCoberturaMontoTotal: TCurrencyField;
    rxCoberturaCodigo_Cliente: TIntegerField;
    rxCoberturaAplicaDesc: TFloatField;
    qryClienteNSS: TIBStringField;
    qryChequeaSec: TIBQuery;
    qryChequeaSecCONSTANT: TIBStringField;
    qryChequeaSecSEC_CACH: TIntegerField;
    qryChequeaSecSECUENCIA: TIntegerField;
    qryChequeaSecULTIMO_NUMCASHGENERADO: TIntegerField;
    qryChequeaSecCONSTANT1: TIBStringField;
    qryChequeaSecSEC_CREDITO: TIntegerField;
    qryChequeaSecGEN_NUM_FACTURA: TIntegerField;
    qryChequeaSecULTIMO_NUMFACTURAGENERADO: TIntegerField;
    qryChequeaSecMAX_NUMERO_MASTER: TIntegerField;
    btnVerSecCertificados: TBitBtn;
    rxCertificados: TRxMemoryData;
    rxCertificadosCodigoCte: TIntegerField;
    rxCertificadosNumeroCerf: TIntegerField;
    qryEmpleadoNOMBREVENDEDOR: TIBStringField;
    qryEmpleadoCODIGO: TIntegerField;
    panelPoliza: TPanel;
    Label25: TLabel;
    DBEdit16: TDBEdit;
    tblPolizaCte: TIBDataSet;
    tblPolizaCteCODIGO_CTE: TIntegerField;
    tblPolizaCteNUM_POL: TIntegerField;
    tblPolizaCteSTATUSCXC: TIBStringField;
    tblPolizaCteSTATUS: TIBStringField;
    TotalesFechaIniciaPoliza: TDateTimeField;
    lblFechaInicaPoliza: TLabel;
    dbFechaIniciaPoliza: TDBDateEdit;
    cboxUseLogo: TComboBox;
    qryLogoTipoAfiliado: TIBQuery;
    qryLogoTipoAfiliadoIDTIPO: TIntegerField;
    qryLogoTipoAfiliadoRUTA_LOGO: TIBStringField;
    qryLogoTipoAfiliadoDESCRIPCION: TIBStringField;
    TotalesTipoAfiliado: TSmallintField;
    qryProdSerieCODIGO_CTE: TIntegerField;
    qryProdSerieSTATUS_EQUIPO: TSmallintField;
    tblProductoSerieCODIGO_CTE: TIntegerField;
    tblProductoSerieSTATUS_EQUIPO: TSmallintField;
    qryProdSerieDESCESTATUS: TIBStringField;
    tblClienteDeliveryTrn: TIBDataSet;
    tblClienteDeliveryTrnCODIGO: TIntegerField;
    tblClienteDeliveryTrnNUMERO_TRN: TIntegerField;
    TotalesCodigoCteDelivery: TIntegerField;
    TotalesidNumeroDVeh: TIntegerField;
    tblDatosVentaVehiculosCHASSIS: TIBStringField;
    qryDatosVh: TIBQuery;
    qryDatosVhNUMERO: TIntegerField;
    qryDatosVhCODIGO_CTE: TIntegerField;
    qryDatosVhFECHA_APERTURA: TDateTimeField;
    qryDatosVhFECHA_VENCE_SEGURO: TDateTimeField;
    qryDatosVhTIPO_AFILIADO: TSmallintField;
    qryDatosVhPLACA: TIBStringField;
    qryDatosVhIDMARCA: TIntegerField;
    qryDatosVhMODELO: TIBStringField;
    qryDatosVhANO_VEH: TIntegerField;
    qryDatosVhTIPO_SEGURO: TSmallintField;
    qryDatosVhCIA_SEGURO: TIBStringField;
    qryDatosVhEMPRESA_LABORA: TIBStringField;
    qryDatosVhFECHA_IN: TDateTimeField;
    qryDatosVhIN_POR: TIBStringField;
    qryDatosVhCODIGO_DEALER: TIntegerField;
    qryDatosVhCODIGO_AGENCIA: TIntegerField;
    qryDatosVhCOLOR: TIBStringField;
    qryDatosVhNUM_CERTIFICADO: TIntegerField;
    qryDatosVhCHASSIS: TIBStringField;
    qryDatosVhNUMPOL: TIntegerField;
    qryDatosVhSTATUSCXC: TIBStringField;
    qryDatosVhPOLIZA_ESPECIAL: TSmallintField;
    qryDatosVhRUTA_FILEAUTH: TIBStringField;
    qryDatosVhMARCA_VEHICULO: TIBStringField;
    CerrarPrograma1: TMenuItem;
    Label59: TLabel;
    Label60: TLabel;
    tblPreventaMaster: TIBDataSet;
    tblPreventaMasterNUMERO: TIntegerField;
    tblPreventaMasterFECHA: TDateTimeField;
    tblPreventaMasterCIA_KEY: TIntegerField;
    tblPreventaMasterCODIGO_CTE: TIntegerField;
    tblPreventaMasterCODIGO_VENDEDOR: TIntegerField;
    tblPreventaMasterFORMA_PAGO: TSmallintField;
    tblPreventaMasterOBSERVACION: TIBStringField;
    tblPreventaMasterMONEDA: TIBStringField;
    tblPreventaMasterVALOR_TOTAL_DET: TFloatField;
    tblPreventaMasterSTATUS: TIBStringField;
    tblPreventaMasterFECHA_IN: TDateTimeField;
    tblPreventaMasterIN_POR: TIBStringField;
    tblPreventaMasterFECHA_MOD: TDateTimeField;
    tblPreventaMasterMOD_POR: TIBStringField;
    tblPreventaMasterNUMERO_FACTURA: TIntegerField;
    tblPreventaMasterNUMERO_DOC_PAGO: TIBStringField;
    tblPreventaMasterSERIE_NCF_ASIGNADO: TIntegerField;
    tblPreventaMasterMONTO_BRUTO: TFloatField;
    tblPreventaMasterPORC_DESCUENTO: TIntegerField;
    tblPreventaMasterMONTO_DESCUENTO: TFloatField;
    tblPreventaMasterMONTO_INICIAL: TFloatField;
    tblPreventaMasterNOMBRE_CLIENTE_GENERAL: TIBStringField;
    TotalesPreAbono: TCurrencyField;
    qryTicketPreventaMast: TIBQuery;
    qryTicketPreventaDet: TIBQuery;
    qryTicketPreventaMastNUMERO: TIntegerField;
    qryTicketPreventaMastFECHA: TDateTimeField;
    qryTicketPreventaMastCIA_KEY: TIntegerField;
    qryTicketPreventaMastCODIGO_CTE: TIntegerField;
    qryTicketPreventaMastCODIGO_VENDEDOR: TIntegerField;
    qryTicketPreventaMastFORMA_PAGO: TSmallintField;
    qryTicketPreventaMastOBSERVACION: TIBStringField;
    qryTicketPreventaMastMONEDA: TIBStringField;
    qryTicketPreventaMastVALOR_TOTAL_DET: TFloatField;
    qryTicketPreventaMastSTATUS: TIBStringField;
    qryTicketPreventaMastFECHA_IN: TDateTimeField;
    qryTicketPreventaMastIN_POR: TIBStringField;
    qryTicketPreventaMastFECHA_MOD: TDateTimeField;
    qryTicketPreventaMastMOD_POR: TIBStringField;
    qryTicketPreventaMastNUMERO_FACTURA: TIntegerField;
    qryTicketPreventaMastNUMERO_DOC_PAGO: TIBStringField;
    qryTicketPreventaMastSERIE_NCF_ASIGNADO: TIntegerField;
    qryTicketPreventaMastMONTO_BRUTO: TFloatField;
    qryTicketPreventaMastPORC_DESCUENTO: TIntegerField;
    qryTicketPreventaMastMONTO_DESCUENTO: TFloatField;
    qryTicketPreventaMastMONTO_INICIAL: TFloatField;
    qryTicketPreventaMastNOMBRE_CLIENTE_GENERAL: TIBStringField;
    qryTicketPreventaDetSERIE: TIntegerField;
    qryTicketPreventaDetNUMERO: TIntegerField;
    qryTicketPreventaDetCODIGO_PROD: TIBStringField;
    qryTicketPreventaDetCODIGO_BARRA: TIBStringField;
    qryTicketPreventaDetDESCRIPCION: TIBStringField;
    qryTicketPreventaDetCANTIDAD: TFloatField;
    qryTicketPreventaDetPRECIO: TFloatField;
    qryTicketPreventaDetPORC_DESC_DET: TFloatField;
    qryTicketPreventaDetITBI_DET: TFloatField;
    qryTicketPreventaDetVALOR_SERVICIO_DET: TFloatField;
    qryTicketPreventaDetVALOR_TOTAL_DET: TFloatField;
    qryTicketPreventaDetNUM_FACTURA: TFloatField;
    qryTicketPreventaDetSTATUS_DET: TIBStringField;
    qryTicketPreventaDetFECHA_IN: TDateTimeField;
    qryTicketPreventaDetIN_POR: TIBStringField;
    qryTicketPreventaDetFECHA_MOD: TDateTimeField;
    qryTicketPreventaDetMOD_POR: TIBStringField;
    qryTicketPreventaDetCANT_REGRESO: TFloatField;
    qryTicketPreventaDetCANT_PROMO: TFloatField;
    qryTicketPreventaDetMONTO_DIETA: TFloatField;
    qryTicketPreventaDetMONTO_AJUSTE: TFloatField;
    qryTicketPreventaDetSERIE_PROD: TIBStringField;
    qryTicketPreventaDetSTATUS_CNT: TIBStringField;
    qryTicketPreventaDetTIPO_UNIDAD: TIntegerField;
    chkImprimeTicket: TCheckBox;
    Button2: TButton;
    qryProductosLOTE_NUM: TIBStringField;
    qryProductosCANTLOT: TIntegerField;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    rxLote: TRxMemoryData;
    rxLoteLotNum: TStringField;
    rxPreventalot_num: TStringField;
    btnPresupuesto: TButton;
    procedure BitBtn4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure rxVentaAfterPost(DataSet: TDataSet);
    procedure Edit1Exit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rxVentaBeforePost(DataSet: TDataSet);
    procedure BitBtn5Click(Sender: TObject);
    procedure Inventario1Click(Sender: TObject);
    procedure Ayuda1Click(Sender: TObject);
    procedure ImprimirRecibo1Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BuscarCliente1Click(Sender: TObject);
    procedure Cotizar1Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure MaestroCliente1Click(Sender: TObject);
    procedure RxDBGrid2DblClick(Sender: TObject);
    procedure DBEdit1Enter(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure MostrarVistaproductos1Click(Sender: TObject);
    procedure edtReferenciaChange(Sender: TObject);
    procedure edtReferenciaExit(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure DBEdit2Enter(Sender: TObject);
    procedure chkExentoExit(Sender: TObject);
    procedure RxDBGrid2KeyPress(Sender: TObject; var Key: Char);
    procedure RxDBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure chkExentoEnter(Sender: TObject);
    procedure RxDBGrid2GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure ReImprimirRecibo1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RxLabel1Click(Sender: TObject);
    procedure LectorCodBarra1Click(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure NoGenerarNCF1Click(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure qryClienteAfterScroll(DataSet: TDataSet);
    procedure qryProductosAfterScroll(DataSet: TDataSet);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure RxDBGrid3DblClick(Sender: TObject);
    procedure SecretPanel1DblClick(Sender: TObject);
    procedure NoMostrarProdVencidos1Click(Sender: TObject);
    procedure rxLabelVenceDblClick(Sender: TObject);
    procedure rxqryInvAfterScroll(DataSet: TDataSet);
    procedure cboxTipoUnidadChange(Sender: TObject);
    procedure cboxTipoUnidadExit(Sender: TObject);
    procedure qryInventarioAfterScroll(DataSet: TDataSet);
    procedure Label25TemporalrenameClick(Sender: TObject);
    procedure RxSpeedButton1Click(Sender: TObject);
    procedure MaestroInventario1Click(Sender: TObject);
    procedure cboxTipoUnidadEnter(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure RxDBGrid2Enter(Sender: TObject);
    procedure RxDBGrid2Exit(Sender: TObject);
    procedure ConsultaGeneral1Click(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure DBMemo1Exit(Sender: TObject);
    procedure RecuperarTransacciones1Click(Sender: TObject);
    procedure RxSpinEdit1Change(Sender: TObject);
    procedure TotalesCalcFields(DataSet: TDataSet);
    procedure CheckBox2Exit(Sender: TObject);
    procedure CheckBox3Exit(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure BitBtn6MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Label37Click(Sender: TObject);
    procedure BitBtn21Click(Sender: TObject);
    procedure DBEdit7Exit(Sender: TObject);
    procedure RxDBGrid1Enter(Sender: TObject);
    procedure RxDBGrid1Exit(Sender: TObject);
    //procedure ReImprimeFacturaContado1Click(Sender: TObject);
    procedure dbFechaCotizacionClick(Sender: TObject);
    procedure dbFechaCotizacionExit(Sender: TObject);
    procedure dbFechaCotizacionEnter(Sender: TObject);
    procedure ReImprimeDevolucion1Click(Sender: TObject);
    procedure BitBtn4Exit(Sender: TObject);
    procedure TotalesAfterScroll(DataSet: TDataSet);
    procedure RxDBLookupCombo2Change(Sender: TObject);
    procedure RxDBLookupCombo2Enter(Sender: TObject);
    procedure RxDBLookupCombo2Exit(Sender: TObject);
    procedure RxDBLookupCombo2Click(Sender: TObject);
    procedure tblMonedaAfterScroll(DataSet: TDataSet);
    procedure Poliza1Click(Sender: TObject);
    procedure ReImprimeDevolucionsinFact1Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure BitBtn26Click(Sender: TObject);
    procedure rxVentaBeforeInsert(DataSet: TDataSet);
    procedure BitBtn1Enter(Sender: TObject);
    procedure BitBtn1Exit(Sender: TObject);
    procedure DBRadioGroup1Enter(Sender: TObject);
    procedure DBRadioGroup1Exit(Sender: TObject);
    procedure VerificaImpresoraFiscalM;
    procedure qryVenceAfterClose(DataSet: TDataSet);
    procedure qryVenceBeforeClose(DataSet: TDataSet);
    procedure DBEdit5Enter(Sender: TObject);
    procedure CirreZ1Click(Sender: TObject);
    procedure CierreX1Click(Sender: TObject);
    procedure DBEdit10Exit(Sender: TObject);
    procedure RxDBLookupCombo3Exit(Sender: TObject);
    procedure chKDescuentoGlobalClick(Sender: TObject);
    procedure DBEdit11Change(Sender: TObject);
    procedure FormClick(Sender: TObject);
    procedure DBEdit11Exit(Sender: TObject);
    procedure DBEdit10Enter(Sender: TObject);
    procedure rxVentaBeforeEdit(DataSet: TDataSet);
    procedure DBEdit11Enter(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure BitBtn27Click(Sender: TObject);
    procedure CancelarTicket1Click(Sender: TObject);
    procedure RxDBLookupCombo3Change(Sender: TObject);
    procedure StatusBarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CheckBox1Click(Sender: TObject);
    procedure VerTipoComprobantes1Click(Sender: TObject);
    procedure RxDBLookupCombo1Change(Sender: TObject);
    procedure tablaPropietarioAfterOpen(DataSet: TDataSet);
    procedure rxVentaAfterClose(DataSet: TDataSet);
    procedure DBEdit1Change(Sender: TObject);
    procedure DBEdit2Change(Sender: TObject);
    procedure Alquiler1Click(Sender: TObject);
    procedure RxSpinEdit1Exit(Sender: TObject);
    procedure tablaPropietarioBeforePost(DataSet: TDataSet);
    procedure DBEdit9Change(Sender: TObject);
    procedure DBEdit10Change(Sender: TObject);
    procedure chkNoLeyPropinaClick(Sender: TObject);
    procedure rxdblookupTipoUnidadChange(Sender: TObject);
    procedure rxdblookupTipoUnidadEnter(Sender: TObject);
    procedure BuscarRNCDGII1Click(Sender: TObject);
    procedure DetallePosExtra1Click(Sender: TObject);
    procedure rxVentaAfterInsert(DataSet: TDataSet);
    procedure TotalesAfterPost(DataSet: TDataSet);
    procedure rxVentaBeforeDelete(DataSet: TDataSet);
    procedure TotalesBeforePost(DataSet: TDataSet);
    procedure rxVentaAfterEdit(DataSet: TDataSet);
    procedure rxVentaAfterDelete(DataSet: TDataSet);
    procedure chkNoLeyPropinaExit(Sender: TObject);
    procedure rxdblookupTipoUnidadExit(Sender: TObject);
    procedure rxVentaAfterOpen(DataSet: TDataSet);
    procedure DBEdit12Change(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure Log1Click(Sender: TObject);
    procedure DesactivarSkin1Click(Sender: TObject);
    procedure BitBtn32Click(Sender: TObject);
    procedure edtCodigoChange(Sender: TObject);
    procedure edtCodigoEnter(Sender: TObject);
    procedure edtCodigoExit(Sender: TObject);
    procedure InactivaReciboFarmacia1Click(Sender: TObject);
    procedure DataSource1StateChange(Sender: TObject);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure ImprimirOrdenEntrega1Click(Sender: TObject);
    procedure ReImprimeFactRest1Click(Sender: TObject);
    procedure ReImprimeTicketVta1Click(Sender: TObject);
    procedure ReImprimeConduce1Click(Sender: TObject);
    procedure TotalesAfterClose(DataSet: TDataSet);
    procedure rxCoberturaMontoCoberturaChange(Sender: TField);
    procedure DBEdit6DblClick(Sender: TObject);
    procedure Label22Click(Sender: TObject);
    procedure dbFechaIniciaPolizaExit(Sender: TObject);
    procedure DBEdit16Change(Sender: TObject);
    procedure edtCodigoDblClick(Sender: TObject);
    procedure CerrarPrograma1Click(Sender: TObject);
    procedure btnAsignarVehClick(Sender: TObject);
    procedure qryTicketPreventaMastAfterScroll(DataSet: TDataSet);
    procedure Button2Click(Sender: TObject);
    procedure edtObservacionDblClick(Sender: TObject);
    procedure ProcAsignaNumLote(codProd:string);
    procedure rxVentaAfterScroll(DataSet: TDataSet);
    procedure btnPresupuestoClick(Sender: TObject);

  private
    function VerificaNIFTExiste: Boolean;
    procedure ProcAsignarClienteACert(codte : integer);
    function VerificaVentaExisteRX(serie:integer):boolean;
    procedure DatosVocado(numtrn:integer;fpago:integer);
    procedure ProcSetBtnConduce;
    procedure ImprimirFacturaRepuesto(numTran:Integer);
    procedure ProvVerDatosDescGlb;
    procedure ProcItbisExonerado;
    procedure ProcMostrarVersion;
    procedure AbrirUnidades;

    procedure ProcSetPathlogoTipoServicio(tipo:smallint);

    procedure ImprimirTicketVtaAgua(numtrn:integer);
    procedure SetMontoNotaCredito;
    //procedure CalcularDescIndirecto;
    procedure ProcesaNuevo;
    procedure InsertarDet(numero : Integer);
    procedure InsertarPolizaCliente;
    procedure InsertarCotizacionDet(numero : Integer);
    procedure InsertarCotizacionDetUpd(numero : Integer;serie:Integer);
    //movido a UDatModCalculos = dmCalculos

    //procedure ProcCargaDatosCotizacion;
    procedure ProcCalculoDivisa;
    Procedure PrepararInfoFiscal(numerotrn:integer);
    Procedure PrepararInfoFiscalNCR(numerotrn:integer);

    procedure ImpFacturaservicio(numerotrn:Integer;EsReimpresion:Boolean);
    procedure ProcActUltTrn;

    procedure AbrirClasifPrecio;
    Function ValidaSubTotal : Boolean;
    procedure ProcesaFacturar(tipo : smallint;numdoc:integer;codcte:integer);
    procedure ActBalaceCteP(operacion:smallint);
    procedure EditarBalanceP(monto:Real;tipo:Integer);overload;
    //procedure EditarBalanceP(monto:Real;fecha:TDateTime);overload;
    procedure EditarBalanceP(monto : Real);overload;
    procedure InsertaBalanceP(monto: Real);
    procedure InsertaBalanceARS(monto: Real;tDoc:smallint;codcte:integer);
    Function VerificaClave:Boolean;

    procedure ProcVentaConNCF(tiponcf:String; Var valorNCF:String; Var seriedoc:Integer; Var serie_asignadoncf : Integer);

    procedure ProcVenta(valorNCF:String; Serie_Asignadoncf:Integer; Var serieDoc:Integer);
    procedure ProcUpdateNumDLinea(numPos:integer; numeroTrnVta:integer; tipo:Smallint);

    Procedure AplicaPrecioMayorista;
    Function FncFrecuencia(Frec : Integer):String;
    procedure AsignarSqlText(campo:String; valor:string; OrderBy : String);
    procedure Finalizardisplay;
    procedure ActualizaInvAlmacen;

    //procedure LlenarTipoUnidadBox(umedida:integer);
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

    procedure ProcInsertarVtaMastCashEnDev(var NumTrnGen : Integer; var NumOrden : Integer);
    procedure InsertarDetDevolucionCash(numero : Integer);

    //Procsa devolucion de 1 o varios productos de una factura;
    //t procedure ProcesarDevolucion;

    Function BuscarRutaImagen(codProducto : Integer):String;
    procedure ProcInsertarDetPagos(numtrn : integer);
    procedure ProcInsertarDetCheque(numtrn : integer);
    procedure ProcInsertarDetEfectivo(numtrn: integer;fpago:integer);
    procedure ProcInsertarDetBono(numtrn : integer);

    procedure DescargaNotaCredito;
    Procedure SetPrecioPorCantidad;
    //Function CheckPrecioPorCantidad:Real;
    Procedure SetPrecioPorCantidadMay;
    function VerificaRecordsVenta:boolean;
    Procedure ProcesaEstadoImpresora(xNumeroTrn:Integer);

    procedure ImprimeFiscalContado(xNumeroTrn:Integer);
    Procedure ReactivarValores;

    //Procedure ProcesarCalculoAlterno;
    Procedure FInsertarDatosCtrlNIF(_numerotrnvta:Integer);

    Procedure ProcEntradaCliente;
    //function GetMonedaProducto(codigo:Integer):String;
    Procedure ImprimeDocumento(serieDoc:integer);

    Procedure AbrirDatosParaTicket(
              CheckBox1_Checked:Boolean;
              rdgCredito_Checked:boolean;
              edtCodCte_Text:String;
              EditN1_ValueInteger:integer;
              DateTimePicker1_Date:TDateTime);

    Procedure ProcActualizaMsg;
    Procedure ProcGetUltNcf(tipo:string);
    Procedure ProcGetDatosDevparaNotaCR;

    procedure AsignaNCFCFinalX(TIPOCF:String;TIPO_NCF_IFISCAL : integer);
    //AsignaNCFCFinalX(TIPO_NCF_IFISCAL : integer);overload;

    procedure ReimprimirFacturaNoFiscal(numTRN : Integer);
    procedure ImprimeFacturaEXDMAR(num: integer;tventa: string;valorNCF:string;xdir:string);
    procedure LlenarrxSolDatoscte(codCte:integer);
    Function CheckPortComDisponible:boolean;

    procedure ReImpDevolucion(numDev : Integer;var _flag : boolean);

    //procedure ProcDevoluconCash;
    procedure UpdateServINFO(numVta : integer);
    procedure UpdateServAlquiler(numVta : integer);
    procedure NotificaErrorByEmail(sms:string);
    procedure ProcActTipoUnidad;
    procedure ProcModFactCantXUnidad(_codProd:integer;_idUnidad:integer);
    procedure ProcMostrarBotonVerVta;
    procedure ReversaCantInventario(numtrn:integer);
    procedure ProcChequeaOtrasVtasCte;
    procedure CheckTipoNCFCte;

    procedure ProcInsertarDatosVtaSeguro(numtrn:integer);
    procedure ProcActualizaSecCertSAM(sec:integer);
    procedure ProcesaDatosVehiculoPoliza(_existe:boolean);
    procedure DescargarVehiculoDev(numerotrn:integer);
    function ValidarDobleRegPago: boolean;
    procedure ImprimeFactura8_5Farmacia(num: integer; tventa, valorNCF,
      xdir: string);
    procedure CalcularMontoBrutoXMoneda;
    procedure ConsultaPreventa;
    procedure ImprimirTicket(numtrn: integer);

  public
    tempN : string;
    NoTieneCredito :  boolean;
    NumTrnServ : integer;
    NumTrnServAlq : integer;
    sumarDatos  : Boolean;
    AbortarPostServTaller : boolean;
    canCloseAlquiler: boolean;
    NumTicketFFood: integer;
    recuperando : Boolean;
    esContado : boolean;
    numerodocReimp : Integer;
    NumeroTrn : Integer;
    flagSolLote,_GenNCFFactR, LlenandoDatos : Boolean;
    DescFactRecurrente : String;
    xnumprogrec : integer;
    procedure ActivarBotonesEnModifica;
    procedure CargarDatosAModificar;
    procedure ImprimirFacturaRepuestoConduce(numstr:integer);
    procedure ImprimirFacturaAgua(numstr:integer);
    procedure ImprimirVentaRepuestoConduce;
    Function VerificaLimiteCredito(codigocte:integer;MontoVenta:Real):Boolean;
    procedure AsignaNCFCFinal;
    procedure ActFastFoodTicket(numTicket:Integer);
    Procedure ProcInsFiscalCtrl(ntrn: integer;vtaFecha:TDateTime;var trnExiste:Boolean);
    Procedure ProcReImpDocFiscal(ntrn: integer;vtaFecha:TDateTime);
    Procedure CerrarPuertoImpF;
    Procedure ProcUpdateItbiRecargoVtaMast(numeroTrnVta:Integer);
    Procedure ProcUpdateItbiRecargoCotizaMast(numeroTrnVta:Integer);
    Function ChequeaSecuencia:Boolean;
    procedure ProcSetNCFCliente;
    procedure ImprimirEnFormatoPDF(idmodulo:integer;idreporte:integer);
    procedure ProcFacturaRecurrente(_codCte: Integer;
    Fecha: TDateTime; _numTrn: Integer;_numfact:integer;_ruta:string;_xnumprogrec:integer);
  end;

Const
  FormaPagoNotaDebito = 6;//Devolucion
  TipoPagoFactura = 7;//Factura-Credito
  //PORC_TRANSP_ITBIS = 16/1.16;//13.79;
var
  frmProcVentaRapida: TfrmProcVentaRapida;
  TipoVenta : String;
  xCodigoCte : Integer;
  codAuxi: string;
  xSalir, Prod_existe: boolean;
  EsFinanciamiento : Boolean = false;
  EsFactura  : Boolean = false;
  BuscandoPorDesc: Boolean = false;
  CalcYaEjecutado : Boolean = false;
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
  EsNotaCRParcial : boolean;
  ExpExcel : Boolean;
  EsReimprimirContado : Boolean;
  EsModificandoCotiza : Boolean;
  _NumeroCotiza : Integer;

  _abortar, EsBrowsing, EsEditando : Boolean;
  precioMinimo : Currency;
  precioSum : Currency;
 EsConduce,  procCalc,EsProdVencido : Boolean;
  _ulttrnImp : string;
    pesoProd: String;
    SoloGuardaVenta,entraDessGlb, EsReimp, esCargaDatosFFood : boolean;
    precioAnt: currency;
    ExecuteResult, _UsarLevelPrecio : Integer;
    reimpConduce, valPgoARS : Boolean;
    Parametros : string;
    _chassisVeh : string;

implementation
uses UDatModConectar, UGlobal, URepComprobante, UDatModCompania,
  UProcMiniInventario, UFormSelFecha, UDatModReportes,
  UDatmodDatosGenerales, USolDatos, UDatModFactura, UFormDatosVentaVeh,
  UDatosVentas, UDatModInventario, UDatModUsuarios, UDatModCalculos,
  UFormLog, UFormPosExtraDET, UBuscarClientesPersonasP,
  URepCotizacionPapel8_55, UDatModCxc, UMaestroClientes, UDatModClientes,
  UFormEntreClave, UInventarioProd, UConsultaInventario, UConsultaPreventa,
  UDatModPagoTarjeta, UDatModFastFood, UFormSelSerieProd, UIndicarLoteNum,
  UTicketPreventaPos, UFormCteDelivery, UFormPresupuesto;



{$R *.dfm}


  function esNumero(valor:String):Boolean;
  begin
    if (Valor[1] =  '0') or (Valor[1] =  '1') or (Valor[1] =  '2')
    or (Valor[1] =  '3') or (Valor[1] =  '4') or (Valor[1] =  '5')
    or (Valor[1] =  '6') or (Valor[1] =  '7')
    or (Valor[1] =  '8') or (Valor[1] =  '9') then
    result:= True else result:= False;
  end;

procedure TfrmProcVentaRapida.LlenarrxSolDatoscte(codCte:integer);
begin
  rxSolDatoscte.Close;
  rxSolDatoscte.Open;

  if qryCliente.state = dsInactive then
  qryCliente.Open;

  if not qryCliente.Locate('CODIGO_CTE', codCte, []) then
  begin
    rxSolDatoscte.Insert;
    rxSolDatoscteNombre.Value  := '*** Cliente Generico ***';
    if Length(edtObservacion.Text) > 0 then
      rxSolDatoscteNombre.Value := edtObservacion.Text;
      rxSolDatoscte.Post;
      Exit;
  end;

   if Totales.State = dsbrowse then Totales.Edit;
      TotalesCodCliente.Value:= codCte;

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

   rxSolDatoscte.EmptyTable;

   if rxSolDatoscte.State In [dsInactive] then
   rxSolDatoscte.Open;

    //if rxSolDatoscte.State In [dsBrowse] then
    if (rxSolDatoscte.RecordCount = 0) Or (rxSolDatoscteNombre.IsNull) then
    begin
        rxSolDatoscte.Insert;
        if qryClienteNOMBRE_CTE.IsNull then
        rxSolDatoscteNombre.Value    := '('+
        qryClienteCODIGO_CTE.AsString+')'+ qryClienteNOMBRE_CTE.Value
        else
        rxSolDatoscteNombre.Value    := '('+
        qryClienteCODIGO_CTE.AsString+') '+ qryClienteNOMBRE_FACTURAR.Value;

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
procedure  TfrmProcVentaRapida.FInsertarDatosCtrlNIF(_numerotrnvta:Integer);
begin
end;

//Recibo F5
procedure TfrmProcVentaRapida.BitBtn4Click(Sender: TObject);
var
  serie_asignadoncf : integer;
  valorNCF : String;
  showNcfwindows : boolean;
  genNcf : Boolean;
  flag : Boolean;
  pulgadaInc : Real;
  xNumTrn : integer;
begin
  //Generar y asignar Numero de Comprobante Fiscal
  sumarDatos:=False;
  valorNCF:='';
  Serie_asignadoncf:=0;
  if rxPreventa.RecordCount = 0 then
  begin

  ibstpProcSecuencia.Params[2].Value := 4;

  ipStpInsertVentMast.Params[1].Value := GlbFechaTrnDiaria;
  ipStpInsertVentMast.Params[2].Value:= GlbCodigoCia;

  if tablaPropietarioCodigoPropietario.IsNull then
  ipStpInsertVentMast.Params[3].Value := 0//generico
  else ipStpInsertVentMast.Params[3].Value:= tablaPropietarioCodigoPropietario.Value;

  if Not EsDevolucion then
  begin
    ipStpInsertVentMast.Params[6].Value:= 'PRE-VENTA';
    ipStpInsertVentMast.Params[4].Value:= 1;
    ibstpProcSecuencia.Params[1].Value := 1;
  end else
  begin
    ipStpInsertVentMast.Params[6].Value   := 'Devolución';
    ipStpInsertVentMast.Params[4].Value:= 6;
    ibstpProcSecuencia.Params[1].Value := 6;
  end;
  ipStpInsertVentMast.Params[5].Value:= 1;
  ibstpProcSecuencia.ExecProc;

  ipStpInsertVentMast.Params[7].Value   := '1';
  ipStpInsertVentMast.Params[8].Value:= TotalesSubTotal.Value; //VALOR_TOTAL_DET
  ipStpInsertVentMast.Params[9].Value   := 'A';
  ipStpInsertVentMast.Params[10].Value   := Now;
  ipStpInsertVentMast.Params[11].Value  := Null;
  ipStpInsertVentMast.Params[12].Value  := Null;
  ipStpInsertVentMast.Params[13].Value  := Null;
  ipStpInsertVentMast.Params[14].Value  := ibstpProcSecuencia.Params[0].Value;
  ipStpInsertVentMast.Params[15].Value  := null;
  ipStpInsertVentMast.Params[17].Value  := TotalesSubTotal.Value;  //monto_bruto
  ipStpInsertVentMast.Params[18].Value  := TotalesPorcDesAdicional.Value;//PORC_DESCUENTO
  ipStpInsertVentMast.Params[19].Value  := TotalesMontoDescAdicional.Value;//MONTO_DESCUENTO
  ipStpInsertVentMast.Params[20].Value  := Totalesmontorecibido.Value;
  ipStpInsertVentMast.Params[21].Value  := edtObservacion.Text;

  if Serie_asignadoncf > 0 then
  ipStpInsertVentMast.Params[16].Value  := Serie_asignadoncf
  else ipStpInsertVentMast.Params[16].Value:= Null;

  ipStpInsertVentMast.ExecProc;
  xNumTrn:=ipStpInsertVentMast.Params[0].Value;

  if Not ipStpInsertVentMast.Transaction.InTransaction then
  ipStpInsertVentMast.Transaction.StartTransaction;
  try
    ipStpInsertVentMast.Transaction.CommitRetaining;
  except
  ipStpInsertVentMast.Transaction.RollbackRetaining;
  end;
  ipStpInsertVentMast.Params[0].Value;
  end // if rxPreventa.RecordCount > 0
  else
  begin
    tblPreventaMaster.Close;
    tblPreventaMaster.Params[0].Value:= rxPreventaNumero.Value;
    tblPreventaMaster.open;
    if tblPreventaMaster.RecordCount > 0 then
    begin
      tblPreventaMaster.Edit;
      tblPreventaMasterNOMBRE_CLIENTE_GENERAL.Value:= edtObservacion.Text;
      tblPreventaMasterVALOR_TOTAL_DET.Value:=TotalesSubTotal.Value;
      tblPreventaMastermonto_bruto.Value:=TotalesSubTotal.Value;
      tblPreventaMasterPORC_DESCUENTO.Value:=TotalesPorcDesAdicional.AsInteger;
      tblPreventaMasterMONTO_DESCUENTO.Value:= TotalesMontoDescAdicional.Value;
      tblPreventaMasterCODIGO_CTE.Value:= tablaPropietarioCodigoPropietario.Value;
      tblPreventaMasterCODIGO_VENDEDOR.Value:=VarUsuarioGlb;
      GlbSalvarQuery(tblPreventaMaster);
    end;
  end;

  if rxPreventa.RecordCount > 0  then
  xNumTrn:=rxPreventaNumero.Value; 

  rxVenta.DisableControls;
  rxVenta.First;
  While Not rxVenta.Eof do
  begin
    if rxPreventa.RecordCount > 0 then
    begin
      if rxPreventa.Locate('serie',rxVentaSerie.Value,[]) then
      begin
        rxVenta.Next;
        continue;
      end;
    end;
    InsertarDet(xNumTrn);
    rxVenta.Next;
  end;
  rxVenta.First;

  sumarDatos:=False;

  rxVenta.EnableControls;

  if Not ibStpInsertVentaDet.Transaction.InTransaction then
  ibStpInsertVentaDet.Transaction.StartTransaction;
  try
    ibStpInsertVentaDet.Transaction.CommitRetaining;
  except
  ibStpInsertVentaDet.Transaction.RollbackRetaining;
  end;


  dmfactura.qryVtaConDeliveryTrn.Close;

  if (TotalesCodigoCteDelivery.Value > 0) then
  begin
    tblClienteDeliveryTrn.Close;
    tblClienteDeliveryTrn.Params[0].Value:= TotalesCodigoCteDelivery.Value;
    tblClienteDeliveryTrn.Open;
    tblClienteDeliveryTrn.First;
    //if tblClienteDeliveryTrn.RecordCount = 0 then
    //begin
      if not tblClienteDeliveryTrn.Locate('NUMERO_TRN', xNumTrn,[]) then
      begin
        tblClienteDeliveryTrn.Append;
        tblClienteDeliveryTrnCODIGO.Value:= TotalesCodigoCteDelivery.Value;
        tblClienteDeliveryTrnNUMERO_TRN.Value:= xNumTrn;
        GlbSalvarQuery(tblClienteDeliveryTrn);
        dmfactura.qryVtaConDeliveryTrn.Close;
        dmfactura.qryVtaConDeliveryTrn.Params[0].Value:= xNumTrn;
        dmfactura.qryVtaConDeliveryTrn.Open;
      end else
      begin
        tblClienteDeliveryTrn.Edit;
        tblClienteDeliveryTrnNUMERO_TRN.Value:=xNumTrn;
        GlbSalvarQuery(tblClienteDeliveryTrn);        
        dmfactura.qryVtaConDeliveryTrn.Close;
        dmfactura.qryVtaConDeliveryTrn.Params[0].Value:= xNumTrn;
        dmfactura.qryVtaConDeliveryTrn.Open;
        dmfactura.qryVtaConDeliveryTrn.first;
      end;
    //end;
  end;

  if chkImprimeTicket.Checked then
  ImprimirTicket(xNumTrn);

  rxPreventa.EmptyTable;
  rxPreventa.Close;
  rxPreventa.Open;
  RxDBGrid1.Visible:=True;

  rxVenta.EmptyTable;
  if chkDisplay.Checked then
  Finalizardisplay;

  tablaPropietario.Edit;
  tablaPropietarioCodigoPropietario.AsVariant := null;
  tablaPropietario.Post;

  edtCodigo.Text := '';
  BitBtn4.Enabled := True;
  if isShowing then
  BitBtn1.SetFocus;

  Caption:='Proceso Pre-Venta';

  edtCodigo.SetFocus;
  edtObservacion.Text := '';

  if InactivaImprecibo then
  GlbImprimeReciboFact := 0;
  InactivaImprecibo    := False;
  label25.Font.Color   := clBlack;
  sumarDatos:=True;
  ProcActUltTrn;
  if (GlbNumVtaPOS > 0) then
  dmcalculos.ProcDeletePosExtraDet(GlbNumVtaPOS);
  GlbNumVtaPOS:=-1;

end;

procedure TfrmProcVentaRapida.ImprimirTicket(numtrn:integer);
var
  flag : boolean;
begin
  dmfactura.qryVtaConDeliveryTrn.Close;
  dmfactura.qryVtaConDeliveryTrn.Params[0].Value:= numtrn;
  dmfactura.qryVtaConDeliveryTrn.Open;
  
  qryTicketPreventaMast.close;
  qryTicketPreventaMast.params[0].value:=numtrn;
  qryTicketPreventaMast.open;
  qckTicketPreventaPos:=TqckTicketPreventaPos.Create(Nil);
  try
    if (edtObservacion.Text <> '') then
    qckTicketPreventaPos.nombreCteGenerico:=edtObservacion.Text
    else qckTicketPreventaPos.nombreCteGenerico:='';

    if (glbQckUnaPagina = 1) then
            begin
              if (qckTicketPreventaPos.PageNumber >= 3) then
              qckTicketPreventaPos.Page.Length:=26;

              if ((qryTicketPreventaDet.RecordCount >= 1) and
                 ((qryTicketPreventaDet.RecordCount < 10))) then
              begin
                ProgressBar1.Visible :=True;
                ProgressBar1.Position:=0;
                ProgressBar1.Max:=qryTicketPreventaDet.RecordCount;
                qckTicketPreventaPos.Prepare;
                repeat
                begin
                  ProgressBar1.StepIt;
                  //cRc:=cRc + 1;
                  if (qckTicketPreventaPos.PageNumber > 1) then
                  begin
                    qckTicketPreventaPos.Page.Length:=qckTicketPreventaPos.Page.Length + 0.26;

                    qckTicketPreventaPos.Prepare;
                    flag:=False;
                  end else break;
                  if (qckTicketPreventaPos.PageNumber = 1) then
                  break;
                end;
                until flag = true;
              end;
          end;//if (glbQckUnaPagina = 1) then
          ProgressBar1.Visible := False;
    qckTicketPreventaPos.Preview;
  finally
  qckTicketPreventaPos.free;
  qckTicketPreventaPos:=nil;
  end;
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
  if not Assigned(frmLogError) then
  frmLogError:=TfrmLogError.Create(nil);
  _chassisVeh:='';
  valPgoARS:=False;
  _GenNCFFactR:=False;
  GlbLogoServSam:='';
  qryCliente.Close;
  qryCliente.Open;
  qryVehiculos.Close;
  qryVehiculos.Open;
  
  qryEmpleado.Close;
  cboxUseLogo.Visible:=False;
  if GLBSAM = 1 then
  begin
    qryEmpleado.SQL.Clear;
    qryEmpleado.SQL.Text :=
    'Select c.NOMBRE desc_cargo, e.nombre ||'+chr(39)+' '+chr(39)+'||e.apellido nombrevendedor '+
    ', e.* From EMPLEADO e ' +
    'Inner Join CARGO_EMPLEADOS c on c.CODIGO = e.CARGO';
    lblFechaInicaPoliza.Visible:=True;
    lblFechaInicaPoliza.BringToFront;
    dbFechaIniciaPoliza.Visible:=True;
    dbFechaIniciaPoliza.BringToFront;
    //BitBtn23.Visible:=False;
    //BitBtn23.Enabled:=False;
    label20.Caption :='Tipo Afiliación ';
    cboxUseLogo.Visible:=True;
    cboxUseLogo.BringToFront;
  end;

  qryEmpleado.Open;
  GlbExtraUpdate:=False;
  if (GlBLimao = 1) or (GlBInMobi = 1)then
  begin
    ReImprimeFactRest1.Visible:=True;
  end;
  if GlbFarmacia = 1 then
  InactivaReciboFarmacia1.Checked:=False;
  label51.Caption:=FormatDateTime('hh:mm:ss',now);label52.Caption:=FormatDateTime('hh:mm:ss',now);label53.Caption:='';
    
  if (GlbIgI = 1) and (GlbActivaIFiscal = 0) then
  begin
    CheckBox1.Checked:=False;
    CheckBox1.Visible:=True;
    NoGenerarNCF1.Checked:=False;
  end;
  
  GlbEntradoAvta:= True;
  codAuxi:='';

  GLBMostrarArchivo:=True;
  dmCalculos.qryConsultaPosExtraDet.Close;
  dmCalculos.qryPosExtraDet.Close;
  dmCalculos.qryCheckVtaExtExiste.Close;
  dmCalculos.ibstpproc_InseCotiVtaExtraDet.Close;
  
  dmCalculos.esFeedbackExtra := False;
  if GlbUsaPUnidadLevel = 0 then
  begin
    DSQryPrecios.DataSet := QryPrecios;

    rxdblookupTipoUnidad.Visible:=False;
    rxdblookupTipoUnidad.Enabled:=False;
    rxdblookupTipoUnidad.SendToBack;
    cboxTipoUnidad.Visible :=True;
    cboxTipoUnidad.Enabled :=True;
    cboxTipoUnidad.TabOrder:=1;
  end else
  begin
    DSQryPrecios.DataSet := dmVentas.qryPrecioUnidadSurt;
    rxdblookupTipoUnidad.Visible:=True;
    rxdblookupTipoUnidad.Enabled:=True;
    rxdblookupTipoUnidad.BringToFront;
    cboxTipoUnidad.Visible:=False;
    cboxTipoUnidad.Enabled:=False;
    rxdblookupTipoUnidad.TabOrder:=1;
  end;
  //Ancho := 800;//1366;//1280; // Ancho del diseño
  //Alto  := 600;//768
  {  Height := Height * Screen.Height Div Alto;
   Width := Width * Screen.Width Div Ancho;
   ScaleBy(Screen.Width, Ancho);
  }
  //t sumarDatos:=true;
  NumTicketFFood:=-1;
  //if (GLBEsFastFood) then
  //begin
    //btnPagoExacto.Visible := True;

    if GLBEsFastFood then
    panelFastFood.Visible := True
    else
    begin
      panelFastFood.Visible := False;
      DBText15.Visible := True;
    end;
  //end;
  if (UpperCase(GLBFormatoFactura) = 'BYMSERVICIOS') then
  begin
    cboxTipoUnidad.Visible:=False;
    Label24.Visible :=False;
    Label48.Visible :=true;
    DBEdit12.Visible:=true;
    //BitBtn29.Visible:=True;
    //BitBtn29.BringToFront;
  end else
  begin
    cboxTipoUnidad.Visible:=True;
    Label24.Visible := True;
    Label48.Visible := False;
    DBEdit12.Visible:= False;
    //BitBtn29.Visible:= False;
    //BitBtn29.SendToBack;
  end;
  canCloseAlquiler:=False;
  ProcActualizaMsg;
  //Cargar transacciones en caso de que haya existido algun issue
  recuperando := True;
  EsModificandoFactura := False;
  ProcRecoverData(False);
  InicializaOtrosDesc;
  if (GlbEsDebugFiscal = 0) then
  begin
    BitBtn28.Visible := False;
  end else
  BitBtn28.Visible := True;

  {label25.Visible := False;
  if (GlbImprimeReciboFact = 0) then
  begin
    label25.Caption := 'No Imp Rcbo';
    label25.Visible := True;
  end else
  label25.Caption := '';}

  Panel3.Visible:=True;
  EsDevolucion:=False;
  NoGenerarNCF1Click(Self);
  if (GlbActivaIFiscal = 1) then
  begin
    RxSpeedButton1.Visible:= False;
    ProductName.Visible:= True;
    Version.Visible    := True;
    ProcMostrarVersion;
    if not CheckPortComDisponible then
    begin
      lblStatusImpFiscal.Visible:=True;
      lblStatusImpFiscal.Font.Color:= clRed;
    end;
    
    dmReportes.qryDatosCajaImpUser.Close;
    dmReportes.qryDatosCajaImpUser.Params[0].Value:= VarUsuarioGlb;
    dmReportes.qryDatosCajaImpUser.Open;
    dmReportes.qryDatosCajaImpUser.Last;
    dmReportes.qryDatosCajaImpUser.RecordCount;

    lblStatusImpFiscal.Visible:= False;
    lblStatusImpFiscal.Font.Color:= clRed;

    //Application.ProcessMessages;

    label46.Visible:= False;
    RxDBLookupCombo3.Visible:= False;

    RxSpeedButton1.Visible:=False;
    CheckBox2.Visible := False;
    CheckBox3.Visible := False;

    chkExento.Visible := False;

  end else //not fiscal
  begin
    ProductName.Visible:= False;
    Version.Visible    := False;

    ReImprimeDocFiscal1.Visible:=False;
    ListarPuertosCom1.Visible:=False;
    RecuperaTicketfiscal1.Visible:=False;
    ConciliarNIF1.Visible:=False;
    //chkExento.Visible := True;
    Panel3.Visible := False;
    Button1.Visible:= False;
    //Button2.Visible:= True;
    DBRadioGroup1.Visible := False;
    //BitBtn19.Visible := False;

    if (GlbPermiteVtaServicioAdc = 1) and (GLBSAM = 0) then
    begin
      //BitBtn23.Left := BitBtn19.Left;
      //BitBtn23.Top  := BitBtn19.Top;
      //BitBtn23.Visible:=True;
      //BitBtn23.BringToFront;
      label20.Caption :='Nombre Cliente Generico';
      cboxUseLogo.Visible:=False;
      cboxUseLogo.SendToBack;

      //BitBtn19.Visible := False;
      //BitBtn19.SendToBack;
    end;
  end;
    rxdbgridTestTipofiscal.Visible := False;
    rxdbgridTestTipofiscal.SendToBack;

    imbBarcode.Visible    := LectorCodBarra1.Checked;
    
    //bitBtnEditarFact.Left := BitBtn6.Left;
    rxVenta.Close;
    rxVenta.EmptyTable;
    rxVenta.Open;
        
    tablaPropietario.EmptyTable;
    Totales.EmptyTable;
    ActualizarRecoverData;
    EsModificandoFactura := False;
    GlbUsandoCotiza      := False;
    //bitBtnEditarFact.Visible := False;
    //bitBtnEditarFact.Top := 475;
    //bitBtnEditarFact.SendToBack;
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
    sqlAsignado := False;
    sumarDatos  := True;
    GlbImprimeReciboFact:= 1;
    InactivaImprecibo   := False;

    //bitBtnEditarFact.Visible := False;

    AbrirUnidades;

    //llenar cboxTipoUnidad
    dmInventario.qryTipoUnidad.First;
    cboxTipoUnidad.Clear;
    While Not dmInventario.qryTipoUnidad.Eof Do
    begin
      cboxTipoUnidad.Items.Add(dmInventario.qryTipoUnidadDESCRIPCION.Value);
      dmInventario.qryTipoUnidad.Next;
    end;
    //end;
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
    tablaPropietario.EmptyTable;
    dmCompania.tblCompania.Close;
    dmCompania.tblCompania.Open;
    dmCompania.tblCompania.Locate('codigo', glbCia_Key,[]);
    Label10.Caption:= DateToStr(GlbFechaTrnDiaria);
    dmUsuarios.qryEmpleados.Close;
    dmUsuarios.qryEmpleados.Open;
    dmUsuarios.qryEmpleados.Locate('CODIGO', VarUsuarioGlb,[]);
    Label12.Caption:= dmUsuarios.qryEmpleados.FieldByName('NOMBRE').Value;
    Totales.Close;
    Totales.Open;
    Totales.Insert;
    if (GlbMonedaBase > 0) then
    TotalesMoneda.Value   := IntToStr(GlbMonedaBase)
    else
    TotalesMoneda.Value   := '1';
    TotalesSubTotal.Value := 0;
    TotalesSubTotalScreen.Value := 0;
    Totalesitbis.Value    := 0;
    Totalesmontodesc.Value:= 0;
    Totalestotalneto.Value:= 0;
    TotalesRecargo.Value  := 0;
    //TotalesMoneda.Value   :='1';
    TotalesMontoNotaCredito.Value:=0;
    CheckBox4.Checked := False;
    Totalesmontorecibido.Value :=0;
    Totalesdevolucion.Value    :=0;
    Totales.Post;
    lblProcDev.Visible := False;
    //BitBtn1.SetFocus;
    //frmMostrarProductos:=TfrmMostrarProductos.Create(Nil);
    if GlbFinanciamiento = false then
    begin
      //BitBtn11.Visible := False;
      //BitBtn12.Visible := False;
      //BitBtn15.Top     := 401;
    end;

    if (GlbActF10CodBarra = 1) then
       LectorCodBarra1Click(Self);
    qryVence.Close;
    qryVence.Open;

    //if (UpperCase(GLBFormatoFactura) = 'TRIPLETASSO') then
    //BitBtn19.Visible:=True
    //else
    //BitBtn19.Visible:=False;

    dmFactura.ibQryViewNCF.Close;
    if dmFactura.ibQryViewNCF.Prepared then
    dmFactura.ibQryViewNCF.UnPrepare;
    dmFactura.ibQryViewNCF.SQL.Text := dmFactura.ibQryViewNCF_0.SQL.Text;
    label46.Visible:= True;
    RxDBLookupCombo3.Visible:= True;
    if Not dmFactura.ibQryViewNCF.Prepared then
    dmFactura.ibQryViewNCF.Prepare;

    dmFactura.ibQryViewNCF.Open;
    if GLBMuestraInfoProv = 1 then
    begin
    if qryVence.RecordCount > 0 then
    begin
      SecretPanel1.Visible:=true;
      SecretPanel1.Lines.Clear;
      panelDescripcionServ.Visible:=False;
      {While Not qryVence.Eof Do
      begin
        if qryVenceDIASVENCIDOS.Value > 0  then
        SecretPanel1.Lines.Add(qryVenceDESCRIPCION_PRODUCTO.Value+' - '+
        qryVenceDIASVENCIDOS.AsString);
        qryVence.Next;
      end;
      SecretPanel1.Visible:= True;
      SecretPanel1.Active := True;  }
    end;
    end;
    //ReImprimirRecibo1.Visible := True;

  if TotalesReferenciaCte.IsNull and (GLBSAM = 1 ) then
  begin
    btnVerSecCertificados.Visible:=True;
    Label42.Caption:='* Referencia *';
    Label42.Font.Color:= clRed;
    Label42.Font.Size:=11;
  end;

  ProcMostrarBotonVerVta;
  if GLBNumConduceCte = 1 then
  begin
    panelDatoConduceCte.Visible := True;
  end else panelDatoConduceCte.Visible := False;

  if (GLBSAM = 1) then
  begin
    btnVerSecCertificados.Visible:=True;
    panelPoliza.Left := 8;
    panelPoliza.Visible:=True;
    panelPoliza.BringToFront;
    cboxUseLogo.Clear;
    qryLogoTipoAfiliado.Close;
    qryLogoTipoAfiliado.Open;
    qryLogoTipoAfiliado.First;
    while not qryLogoTipoAfiliado.Eof do
    begin
      cboxUseLogo.Items.Add(qryLogoTipoAfiliadoDESCRIPCION.Value);
      qryLogoTipoAfiliado.Next;
    end;
    qryLogoTipoAfiliado.First;
    cboxUseLogo.Text:=qryLogoTipoAfiliadoDESCRIPCION.Value;
    //cboxUseLogoChange(Self);

  end else
  btnVerSecCertificados.Visible:=False;
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


procedure TfrmProcVentaRapida.ProcSetNCFCliente;
begin
  if Not TotalesTipoNCFIFiscal.IsNull AND NCFCTeNotSetup then Exit;
  if (tablaPropietarioCodigoPropietario.Value > 0) then
  begin
    if qryCliente.Locate('CODIGO_CTE', tablaPropietarioCodigoPropietario.Value, []) then
    begin
      if (qryClienteTIPO_CF.Value <> '') then
      begin
        NCFCTeNotSetup:=False;
        if dmFactura.ibQryViewNCF.Locate('TIPO_CF', qryClienteTIPO_CF.Value, []) then
        begin
          if (GlbUsaSecNCF2018 = 0) then
          GlbDescNCF := dmFactura.ibQryViewNCFDESCRIPCION.Value
          else
          GlbDescNCF := dmFactura.ibQryViewNCFDESCRIPCION_2018.Value;

          if dmFactura.ibQryViewNCF.Locate('TIPO_CF', qryClienteTIPO_CF.Value, []) then
          begin
            if Totales.State = dsBrowse then
            Totales.Edit;
            TotalesTipoNCFIFiscal.Value := dmFactura.ibQryViewNCFTIPO_NCF_IFISCAL.Value;
            TotalesTipoNCF.Value := dmFactura.ibQryViewNCFTIPO_CF.Value;
          end else
          begin
            AsignaNCFCFinal;
          end;
          RxDBLookupCombo3Change(Self);
        end else
        NCFCTeNotSetup:=True;
      end;
    end;
  end else
  begin
    AsignaNCFCFinal;
  end;
end;
procedure TfrmProcVentaRapida.AsignaNCFCFinal;
begin
  if dmFactura.ibQryViewNCF.Locate('TIPO_CF', '02', []) then
    begin
      if Totales.State = dsBrowse then
         Totales.Edit;
      if (CheckBox1.Checked) then
      begin
        TotalesTipoNCFIFiscal.Value := dmFactura.ibQryViewNCFTIPO_NCF_IFISCAL.Value;
        TotalesTipoNCF.Value := dmFactura.ibQryViewNCFTIPO_CF.Value;
      end else if (GlbActivaIFiscal = 0) then
      begin
        TotalesTipoNCFIFiscal.AsVariant := null;
        TotalesTipoNCF.AsVariant := null;
      end;
    end;
end;
procedure TfrmProcVentaRapida.AsignaNCFCFinalX(TIPOCF:String;TIPO_NCF_IFISCAL : integer);
begin
  dmFactura.ibQryViewNCF.Close;
  if dmFactura.ibQryViewNCF.Prepared then
  dmFactura.ibQryViewNCF.UnPrepare;
  dmFactura.ibQryViewNCF.SQL.Text := dmFactura.ibQryViewNCF_0.SQL.Text;
  label46.Visible:= True;
  RxDBLookupCombo3.Visible:= True;
  if Not dmFactura.ibQryViewNCF.Prepared then
  dmFactura.ibQryViewNCF.Prepare;

  dmFactura.ibQryViewNCF.Open;

  if dmFactura.ibQryViewNCF.Locate('TIPO_CF;TIPO_NCF_IFISCAL',
     VarArrayOf([TIPOCF,TIPO_NCF_IFISCAL]), []) then
  begin
    if Totales.State = dsBrowse then
       Totales.Edit;
    if (CheckBox1.Checked) then
    begin
      TotalesTipoNCFIFiscal.Value := dmFactura.ibQryViewNCFTIPO_NCF_IFISCAL.Value;
      TotalesTipoNCF.Value := dmFactura.ibQryViewNCFTIPO_CF.Value;
    end else if (GlbActivaIFiscal = 0) then
    begin
      TotalesTipoNCFIFiscal.AsVariant := null;
      TotalesTipoNCF.AsVariant := null;
    end;
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
        
    tablaPropietario.EmptyTable;
    Totales.EmptyTable;
    //Ignored Exito pos ActualizarRecoverData;
    EsModificandoFactura    := False;
    //bitBtnEditarFact.Visible:= False;
    //bitBtnEditarFact.SendToBack;
    Label36.Visible:=False;
    label36.Caption:='';
    if not GLBEsFastFood then
    begin
      label29.Top:= 413;
      dbTextMontoExoneraITBIS.Top := 410;
    end;
    label41.Visible := False;
    DBText15.Visible:= False;
    ActivarBotonesEnModifica;
    tablaPropietario.Close;
    tablaPropietario.Open;
    lblFechaCotizacion.Visible:=False;
    dbFechaCotizacion.Visible:=False;
    EsModificandoCotiza:=False;
    _NumeroCotiza:=-1;
    glbcodVendedor := -1;
  end;

  if (rxVenta.RecordCount > 0) then
  begin
    rxVenta.Last;
    numero := rxVentaSerie.Value + 1;
  end else numero:=1;

  if rxVenta.State In [dsInsert, dsEdit] then
  begin
    if (rxVentaCodArticulo.IsNull) OR (rxVentaCant.IsNull) OR (rxVentaPrecio.IsNull) then
    begin
      //if frmProcVentaRapida.Showing then
      if isShowing then
      begin
        begin
          edtCodigo.SetFocus;
          PostMessage(edtCodigo.Handle, WM_SETFOCUS, 0, 0);
        end;
        exit;
      end;
    end else
    //Exit;
    //rxVenta.Post;
    //WriteToLog('Post rxVenta - Line 1959');
  end;
  //rxVenta.DisableControls;

  //rxVenta.EnableControls;
  recuperando := False;

  //WriteToLog('Post rxVenta - Line 1970');
  rxVenta.Append;
  if rxVenta.State In [dsInsert] then
  rxVentaTipoVenta.Value := 0;//Item venta;
  rxVentaglbcodVendedor.Value := qryClienteCOD_VENDEDOR.Value;
  rxVentaItbi.Value:=0;
  rxVentaTipoUnidad.Value:=1;
  GlbTipoUnidad := 1;
  CantUnidad:= 1;

  if EsModificandoFactura then
  rxVentaStatus.Value   := 'I';
  if (GlbActivaIFiscal = 0) then
  RxSpeedButton1.Visible:= False else
  RxSpeedButton1.Visible:=False;
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
  begin
    begin
      edtCodigo.SetFocus;
      PostMessage(edtCodigo.Handle, WM_SETFOCUS, 0, 0);
    end;
    //PostMessage(edtCodigo.Handle, WM_SETFOCUS, 0, 0);    
  end;
end;

procedure TfrmProcVentaRapida.BitBtn3Click(Sender: TObject);
begin
  if rxVenta.state in [dsEdit, dsInsert] then
  begin
    rxVenta.Cancel;
  end;
  if rxVenta.RecordCount > 0 then
  begin
    if MessageDlg('Cancelar transacción?', mtInformation, [mbYes, mbNo], 0)= mrYes then
      begin
        //if not ValidarDobleRegPago then exit;
        if (GlbNumVtaPOS > 0) then
        dmcalculos.ProcDeletePosExtraDet(GlbNumVtaPOS);
        GlbNumVtaPOS:=-1;

        rxPreventa.EmptyTable;
        rxPreventa.Close;
        rxPreventa.Open;

        EsDevolucion:=False;
        Label59.Caption:='';
        lblProcDev.SendToBack;
        tablaPropietario.EmptyTable;
        EsModificandoFactura:= False;
        lblProcDev.Visible  := EsDevolucion;
        if lblProcDev.Visible = false then
           lblProcDev.SendToBack else
        lblProcDev.BringToFront;
        panel2.Visible:=False;
        dmcalculos.ProcDeletePosExtraDet(GlbNumVtaPOS);
        lblProcDev.Visible := False;
        tablaPropietario.Close;
        tablaPropietario.Open;
        rxventa.EnableControls;
        rxventa.Close;
        rxventa.Open;
        Label60.Caption:='';
        
        tablaPropietario.EmptyTable;
        EsModificandoFactura:= False;
        lblProcDev.Visible  := EsDevolucion;

        GlbUsandoCotiza:= False;
        GlbUsandoCotiza := False;
        rxVenta.Close;
        rxVenta.EmptyTable;
        rxVenta.Open;
        tablaPropietario.EmptyTable;
        Totales.EmptyTable;
        ActualizarRecoverData;
        EsModificandoFactura:=False;
        //bitBtnEditarFact.Visible:=False;
        //bitBtnEditarFact.SendToBack;
        Label36.Visible:=False;
        label36.Caption:='';
        GlbNumeroTrn:=-1;

        if not GLBEsFastFood then
        begin
           label29.Top:= 413;
           dbTextMontoExoneraITBIS.Top := 410;
        end;

        label41.Visible := False;
        DBText15.Visible:= True;
        ActivarBotonesEnModifica;
        tablaPropietario.Close;
        tablaPropietario.Open;
        lblFechaCotizacion.Visible:=False;
        dbFechaCotizacion.Visible:=False;
        EsModificandoCotiza:=False;
        GlbNumeroTrn:=-1;
        _NumeroCotiza:=-1;
        glbcodVendedor := -1;

        dmCalculos.rxError.EmptyTable;
        AbortarPostServTaller := True;

        if not GLBEsFastFood then
        begin
          label29.Top:= 413;
          dbTextMontoExoneraITBIS.Top := 410;
        end;

        label41.Visible := False;
        DBText15.Visible:= True;
        //if Assigned(frmLogError) then
        //frmLogError.rxLog.EmptyTable;
        GlbNumVtaPOS:=-1;
        if (NumTrnServAlq = -1) then
        begin
          //if Assigned(frmAlquiler) then
          //begin
          //  Hide;
          //  frmAlquiler.BringToFront;
          //end;
          NumTrnServAlq:= 0;
        end;
    end;
  end else
  begin
    //RxDBGrid2.visible
  end;
end;

procedure TfrmProcVentaRapida.ActivarBotonesEnModifica;
begin
  if EsModificandoFactura then
  begin
  //BitBtn9.Enabled:=False;
  //BitBtn8.Enabled:=False;
  //BitBtn12.Enabled:=False;
  //BitBtn15.Enabled:=False;
  //BitBtn11.Enabled:=False;
  //BitBtn17.Enabled:=False;
  //bitBtnEditarFact.Visible:=True;
  //bitBtnEditarFact.Top := BitBtn6.Top;
  //bitBtnEditarFact.BringToFront;
  end else
  begin
  {BitBtn9.Enabled:=True;
  BitBtn8.Enabled:=True;
  BitBtn12.Enabled:=True;
  BitBtn15.Enabled:=True;
   }
  //BitBtn11.Enabled:=True;
  BitBtn17.Enabled:=True;
  end;
  refresh;
end;



procedure TfrmProcVentaRapida.DBEdit1Exit(Sender: TObject);
//var
//  guardarRec : TBookMark;
begin
  if rxVenta.State In [dsInsert, dsEdit] then
  begin
    if not rxVentacodarticulo.IsNull then
    begin

    end;
    if rxVentaPrecio.IsNull then exit;

    //qryProductosPRECIO_COMPRA.Value

    if rxVentaCant.IsNull and (rxVentaPrecio.Value > 0) then
    rxVentaCant.Value:=1;
    rxVentaDescUnidadMedida.Value:=cboxTipoUnidad.Text;

    if rxVentaloteNum.IsNull then
    rxVentaloteNum.Value :=qryProductosLOTE_NUM.Value;

    if ((rxVentaCant.Value * CantUnidad) > qryProductosCANTIDAD.Value) And (GlbPermiteVentaInv0 = 0) then
    begin
      MessageDlg('Cantidad venta es mayor que existencia inventario.', mtWarning, [mbOk], 0);
      if rxVenta.State in [dsEdit, dsInsert] then
      rxVenta.Cancel;
      if isShowing then
      edtCodigo.Setfocus;
      
      if isShowing then
      DBEdit1.SetFocus;
      Exit;
    end else
    if (rxVentaCant.Value > qryProductosCANTIDAD.Value) And (GlbPermiteVentaInv0 = 0) then
    begin
      MessageDlg('Cantidad venta es mayor que existencia inventario.', mtWarning, [mbOk], 0);
      if rxVenta.State in [dsEdit, dsInsert] then
      rxVenta.Cancel;
      //rxVenta.Delete;
      if isShowing then
      edtCodigo.Setfocus;
      
      if isShowing then
      DBEdit1.SetFocus;
      Exit;

    end;

    if (rxVentaCant.Value < 0) then
    begin
      MessageDlg('Cantidad no puede ser número negativo, verifique',mtError, [mbOK], 0);

      if isShowing then
      DBEdit1.SetFocus;
      exit;
    end;
    rxVentaMontoBruto.Value:= rxVentaCant.Value * rxVentaPrecio.Value;
    if not rxVentaMoneda.IsNull then
    begin
      CalcularMontoBrutoXMoneda;
    end;

    if (rxVentaCantPax.Value > 0) then
    rxVentaMontoBruto.Value:= (rxVentaCant.Value * rxVentaPrecio.Value) *
    rxVentaCantPax.Value;

    if EsDevolucion then
    rxVentaMontoBruto.Value:=rxVentaMontoBruto.Value * 1;//-1;

    rxVentaMontoDescItem.Value:= rxVentaMontoBruto.Value * rxVentaPorcDescItem.Value / 100;
    rxVentaMontoDesGlobal.Value := rxVentaMontoBruto.Value * (TotalesPorcDesAdicional.Value / 100);
  end;

  GlbNumero:= rxVentaSerie.Value;

  if (auxiCant > 0) And (auxiCant <> rxVentaCant.Value) then
  PrecioCambio:=true;

  panel2.Visible := False;

  if isShowing then
  if (GlbPermiteCambioPrecio) then //Adm
  begin
    DBEdit2.ReadOnly := False;
    DBEdit2.SetFocus;
  end else
  begin
    if (rxVentaPrecio.isnull) or (rxVentaPrecio.Value = 0) then
    if isShowing then
    DBEdit2.SetFocus;
  end;
end;

procedure TfrmProcVentaRapida.CalcularMontoBrutoXMoneda;
begin
  if (rxVentaMonedaBase.Value <> rxVentaMoneda.Value) then
      begin
        if (TotalesMoneda.Value <> '1') then
        begin
          lblTasa.Caption:=Concat('1 = ',InsertarComa(FloatToStr(GlbMontoTasa(TotalesMoneda.Value))));
          //Label60.Caption:=SimboloMoneda('1')+InsertarComa(FloatToStr(rxVentaMontoBruto.Value * GlbMontoTasa(TotalesMoneda.Value)));
          Label60.Caption:=SimboloMoneda('1')+InsertarComa(Format('%8.2f', [rxVentaMontoBruto.Value * GlbMontoTasa(TotalesMoneda.Value)]));
        end else
        if (not rxVentaMonedaBase.IsNull and (rxVentaMonedaBase.Value <> '')) then
        begin
          rxVentamonto_tasa.Value:= GlbMontoTasa(rxVentaMonedaBase.Value);
          rxVentaMontoBruto.Value:= rxVentaMontoBruto.Value * rxVentamonto_tasa.Value;

          GlbMontoTasa(rxVentaMonedaBase.Value);
          lblTasa.Caption:=Concat('1 = ',InsertarComa(FloatToStr(GlbMontoTasa(rxVentaMonedaBase.Value))));
          Totalestotalneto.DisplayFormat:=Concat(SimboloMoneda(TotalesMoneda.Value),',0.00');
          frmProcVentaRapida.lblTasa.Visible :=True;
        end;
      end else
      if (TotalesMoneda.Value <> '1') then
      begin
        lblTasa.Caption:=Concat('1 = ',InsertarComa(FloatToStr(GlbMontoTasa(TotalesMoneda.Value))));
        Label60.Caption:=SimboloMoneda('1')+InsertarComa(Format('%8.2f', [rxVentaMontoBruto.Value * GlbMontoTasa(TotalesMoneda.Value)]));
      end;
      frmProcVentaRapida.lblTasa.Visible:=True;
end;

procedure TfrmProcVentaRapida.rxVentaAfterPost(DataSet: TDataSet);
var
  oftaAp : boolean;
begin
  esEditando:= False;
  dmCalculos.datCambio :=esEditando;
  if Assigned(frmPosExtraDet) then
  frmPosExtraDet.serierxVenta:= rxVentaSerie.Value;

  if Assigned(dmCalculos) then
  dmCalculos.serierxVenta:= rxVentaSerie.Value;
  
  codAuxi:='';
  if rxVentaMoneda.IsNull then Exit;
  if (rxVenta.Tag = 27) and (not procCalc)then
  begin
    rxVenta.Tag:=0;
    exit;//Debe ejecutar boton de Calculos;
  end;

  if esCargaDatosFFood then exit;

  if (GlbNumVtaPOS = -1) or (procCalc) and (not GlbCalculado) then
  begin
    if Not rxVentaMoneda.IsNull and (rxVentaStatus.Value <> 'C') then
    if (procCalc  or (GlbNumVtaPOS < 0 ))then
    dmCalculos.ProcInsertUpdatePosExtraDet(GlbNumVtaPOS);
    //frmLogError.CurrenLN:=4537;
    //frmLogError.LogSteps(GlbNumVtaPOS,rxVentaSerie.Value,now,now,
    //'Antes dmCalculos.Pos_UpdateTotales(GlbNumVtaPOS);',
    //'UProcVentaRapida');
    if GlbCalculado then
    dmCalculos.Pos_UpdateTotales(GlbNumVtaPOS);
    //frmLogError.CurrenLN:=4543;
    //frmLogError.LogSteps(GlbNumVtaPOS,rxVentaSerie.Value,now,now,
    //'Despues dmCalculos.Pos_UpdateTotales(GlbNumVtaPOS);',
    //'UProcVentaRapida');

    procCalc:=False;
    dmCalculos.avoidLoop:=False;
  end;


  //probando hoy ***************************************************
  frmLogError.LogSteps(GlbNumVtaPOS,rxVentaSerie.Value,now,now,
   '******finicio probando loop','UProcVentaRapida');

  if not dmCalculos.avoidLoopExtra then
  begin

  if not dmCalculos.VtaExiste(GlbNumVtaPOS,rxVentaSerie.Value,VarUsuarioGlb) then
  begin
    dmCalculos.ProcInsertUpdatePosExtraDet(GlbNumVtaPOS);
    procCalc:=true;
  end else
  if not dmCalculos.VtaExisteExtra(GlbNumVtaPOS,rxVentaSerie.Value,VarUsuarioGlb) then
  begin
    dmCalculos.ProcInsertUpdatePosExtraDet(GlbNumVtaPOS);
    procCalc:=true;
  end;
  if not procCalc  then exit;

  if procCalc and dmCalculos.avoidLoop and not dmCalculos.esFeedback then //And (GlbNumVtaPOS > 0) then
  begin
    if dmCalculos.qryConsultaPosExtraDet.Tag <> 99 then
    if not rxVentaMoneda.IsNull and (rxVentaStatus.Value <> 'C') and (not GlbCalculado) then
    BEGIN
      dmCalculos.ProcInsertUpdatePosExtraDet(GlbNumVtaPOS);
      procCalc:=false;
    END;

    if dmCalculos.qryConsultaPosExtraDet.Tag = 0 then
    begin
      frmLogError.CurrenLN:=4568;
      frmLogError.LogSteps(GlbNumVtaPOS,rxVentaSerie.Value,now,now,
      'Antes dmCalculos.Pos_UpdateTotales(GlbNumVtaPOS);',
      'UProcVentaRapida');
      if GlbCalculado then
      dmCalculos.Pos_UpdateTotales(GlbNumVtaPOS);

      frmLogError.LogSteps(GlbNumVtaPOS,rxVentaSerie.Value,now,now,
      'Despues dmCalculos.Pos_UpdateTotales(GlbNumVtaPOS);',
      'UProcVentaRapida');
    end;
    if not GlbExtraUpdate then
    begin
    GlbCalculado:=False;
    dmCalculos.ProcInsertUpdatePosExtraDet(GlbNumVtaPOS);
    GlbExtraUpdate:=False;
  end;
    Exit;
  end;
  //if not recuperando then
  //ProcInsertarRecoverData;
  if esEditando then
  dmCalculos.esFeedbackExtra := False;
  if not dmCalculos.esFeedbackExtra then
  if not rxVentaMoneda.IsNull then
  if dmCalculos.qryConsultaPosExtraDet.Tag <> 99 then
  if procCalc  then
  dmCalculos.ProcInsertUpdatePosExtraDet(GlbNumVtaPOS);
  recuperando :=False;
  if sumarDatos then
  begin
    rxVenta.EnableControls;
    rxdbgrid2.EnableScroll;
  end;

  if not GlbExtraUpdate then
  begin
    GlbCalculado:=False;
    dmCalculos.ProcInsertUpdatePosExtraDet(GlbNumVtaPOS);
    GlbExtraUpdate:=False;
  end;
  if not dmCalculos.esFeedback then
    BitBtn27Click(Self);
  if dmCalculos.qryConsultaPosExtraDet.Tag = 0 then
   begin
      frmLogError.LogSteps(GlbNumVtaPOS,rxVentaSerie.Value,now,now,
      'Antes dmCalculos.Pos_UpdateTotales(GlbNumVtaPOS);',
      'UProcVentaRapida');
      if GlbCalculado then
      dmCalculos.Pos_UpdateTotales(GlbNumVtaPOS);

      frmLogError.CurrenLN:=4605;

      frmLogError.LogSteps(GlbNumVtaPOS,rxVentaSerie.Value,now,now,
      'Despues dmCalculos.Pos_UpdateTotales(GlbNumVtaPOS);',
      'UProcVentaRapida');          
   end;

   end;
   //final probando lopp ***********************************
   frmLogError.LogSteps(GlbNumVtaPOS,rxVentaSerie.Value,now,now,
   '******final probando loop','UProcVentaRapida');
  if GlbAplicaOfertas = 1 then
  begin
    oftaAp:=false;
    if rxOfertas.state = dsinactive then rxOfertas.Open;
    dmCalculos.qryAplicaOferta.Close;
    dmCalculos.qryAplicaOferta.params[0].Value:= rxVentaCodArticulo.Value;
    dmCalculos.qryAplicaOferta.params[1].Value:= rxVentaTipoUnidad.Value;
    dmCalculos.qryAplicaOferta.params[2].Value:= ExtraerFecha(rxVentaFecha.Value);
    dmCalculos.qryAplicaOferta.Open;
    dmCalculos.qryAplicaOferta.Last;
    if dmCalculos.qryAplicaOferta.RecordCount = 1 then
    begin
      if rxVentaPrecio.Value > 0 then
      if not rxOfertas.Locate('codProd', rxVentaCodArticulo.Value,[]) then
      begin
        if (rxVentaDescripcion.Value = 'PROMO') then
        oftaAp:=False
        else oftaAp:=True;
      end else oftaAp:= False;
      if oftaAp then
      begin
        begin
         rxofertas.Append;
         rxOfertasserie.Value:=rxventaserie.Value;
         rxOfertascodProd.Value:=rxVentaCodArticulo.Value;
         rxOfertascant.Value:= dmcalculos.qryAplicaOfertaCANTIDAD.Value;
         rxOfertastipoUnidadVta.Value:= dmcalculos.qryAplicaOfertaTIPO_UNIDADOFTA.Value;
         rxOfertas.Post;

         if not Assigned(frmPosExtraDet) then
         frmPosExtraDet:=TfrmPosExtraDet.Create(nil);
         try
           dmCalculos.esFeedbackExtra := False;
           dmCalculos.qryConsultaPosExtraDet.Close;
           dmCalculos.qryConsultaPosExtraDet.Params[0].Value := -777;
           dmCalculos.qryConsultaPosExtraDet.Params[1].Value := VarUsuarioGlb;

           dmCalculos.qryConsultaPosExtraDet.Params[2].Value := GlbNumVtaPOS;

           dmCalculos.qryConsultaPosExtraDet.Open;

           frmPosExtraDet.ProcInsertarOferta(rxVentaserie.value,
           dmCalculos.qryAplicaOfertaCANTIDAD.value,rxVentaCodarticulo.Value);

           //dmCalculos.esFeedbackExtra := True;
         finally
         //frmPosExtraDet.free;
         //frmPosExtraDet:=nil
         end;
       end;
     end;
    end;
  end;
  dmCalculos.avoidLoop:=False;
  RxDBLookupCombo3.Tag:=0;
  CalcYaEjecutado:=False;
  lblTotalItem.Caption:= 'Total Items:'+IntToStr(rxVenta.RecordCount);
  
  lblTotalItem.Visible:=True;
  ProcMostrarBotonVerVta;
end;

procedure TfrmProcVentaRapida.ProcMostrarBotonVerVta;
begin
  qryValidaVta.Close;
  qryValidaVta.Open;
  qryValidaVta.First;
  if qryValidaVta.RecordCount <> rxVenta.RecordCount then
  begin
    qryValidaVta.params[0].Value:= GlbNumVtaPOS;
    BitBtn32.Visible:=True;
  end else
  BitBtn32.Visible:=False;
  if imbBarcode.Visible then
  begin
    if isShowing then
    edtCodigo.SetFocus;
  end;
  if GlbImpTicketVtaAgua = 0 then
  ReImprimeTicketVta1.Visible:=False
  ELSE ReImprimeTicketVta1.Visible:=True;
end;
procedure TfrmProcVentaRapida.Edit1Exit(Sender: TObject);
var
  x,y : Real;
  Activa : Boolean;
  svalue : String;
  xvalue : String;
begin
  Activa:=True;
  if Edit1.text = '' then Exit;

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
      if (UpperCase(GlbFormatoFactura) <> 'BYMSERVICIOS') then
      begin
        MessageDlg('Monto entregado es menor que total a pagar, verifique',mtInformation, [mbOK], 0);
        if isShowing then
        Edit1.SetFocus;
        BitBtn4.Enabled := False;
        Exit;
      end;
    end;
  Totalesmontorecibido.AsString := Edit1.Text;
  if (x > 0) then
  Totalesdevolucion.Value := x;
  Totales.Post;

  BitBtn4.Enabled := True;
 if isShowing then
  BitBtn4.SetFocus;
end;

procedure TfrmProcVentaRapida.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var
    xxxx : word; item : String;
    xcerrar:boolean;
begin
  //113-F2 f4-115   f5-116     f3-114
  xxxx:= key;
  xcerrar:=False;
  if (key = 122) then //F11
  begin
    if rxVenta.RecordCount = 0 then exit;
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
    begin
      Close;
      xcerrar:=True;
      //FormClose(Self);
    end;
  end;
  if (key = 121) then //F10
  LectorCodBarra1Click(Self)
  else
  if (key = 118) then //F7
  BuscarCliente1Click(Self)
  else if (key = 117) then //F6
  begin
    if (GlbActivaIFiscal = 0) then
    begin
      CheckBox1.checked:= Not CheckBox1.checked;
      if not CheckBox1.Checked then
      GlbIgI := 1 else
      GlbIgI := 0;
      if (GlbIgI = 1) and (GlbActivaIFiscal = 0) then
      CheckBox1.checked:=False;
      ProcSetBtnConduce;
      end;
    end;
  if (key = 113) then
  begin
    if isShowing then
    if not edtCodigo.Focused then
      if not EsModificandoCotiza then
      begin
        if isShowing then
        begin
          edtCodigo.SetFocus;
          PostMessage(edtCodigo.Handle, WM_SETFOCUS, 0, 0);
        end;
      end;
    Exit;
  end;
  if (key = 115) then
  BitBtn3Click(Self) else
  if (key = 113) then
  BitBtn1Click(Self)
  else
  //if (key = 114) then
  //BitBtn2Click(Self)
  //else
  if (key = 116) then
  if (Edit1.Text <> '') then
  begin
    Edit1Exit(Self);
    BitBtn4Click(Self)
  end;

  if (key = 120) then //F8
  begin
    if rxVenta.State = dsBrowse then
    begin
      item:=InputBox('Borrar un item','Entre número item a eliminar','');
      if (rxVentaSerie.AsString<> item) then
      if rxVenta.Locate('Serie', strToInt(item),[]) then
      rxVenta.Delete;
      //temp Marzo-17-2015 ProcesarSumaTotal;
      BitBtn27Click(Self);
    end;
  end;
  if xcerrar then
     close;
  end;

procedure TfrmProcVentaRapida.rxVentaBeforePost(DataSet: TDataSet);
begin
  if (rxVentaPrecio.Value <= rxVentaCostoProducto.Value) And (rxVentaPrecio.Value > 0)
    And (not GlbFactRecurrente) then
  begin
    MessageDlg('Precio venta no puede ser menor que el costo, verifique.',mtError,[mbok],0);
    if isShowing then
    DBEdit2.SetFocus;
    Exit;
  end;
  
  if esCargaDatosFFood then
  Exit;

  if rxVentaTipoUnidad.IsNull then
  rxVentaTipoUnidad.Value := GlbTipoUnidad;
  //rxVentaMontoBruto.Value;

  if rxVentaCodArticulo.IsNull Or rxVentaCant.IsNull Or rxVentaPrecio.IsNull then
  begin
    rxVenta.Cancel;
    Exit;
  end else procCalc:=True;

  //Probando
  //VerificaVentaExisteRX(rxVentaSerie.Value);
  if not procCalc then
  begin
    if dmCalculos.VtaExiste(GlbNumVtaPOS,-1,-1) then
    exit;
  end;

  if (rxVenta.State = dsBrowse) and (not rxVentaPorcTasaItbisCld.IsNull)
  then exit;
  {
  if (GLBNumConduceCte = 1) and (rxVenta.State = dsInsert) then
  begin
    frmDatosAdicConduce:=TfrmDatosAdicConduce.Create(nil);
    try
      frmDatosAdicConduce.Showmodal;
    finally
    frmDatosAdicConduce.free;
    frmDatosAdicConduce:=nil;
    end;
  end;  }
  if (rxVenta.State = dsBrowse) then
  rxVenta.Edit;
   
  if (GlbMonedaBase > 0) then
    rxVentaMoneda.Value   := IntToStr(GlbMonedaBase)
  else
  rxVentaMoneda.Value   := '1';

  //t 05112018 if rxVentaCant.IsNull or rxVentaPrecio.IsNull or rxVentaSerie.IsNull or rxVentaCodArticulo.IsNull then
  //t 05112018 begin
  //t 05112018   DataSet.Cancel;

  //t 05112018  if isShowing then
  //t 05112018  BitBtn1.SetFocus;
  //t 05112018 end else
  if rxVentaStatus.isNull then
  rxVentaStatus.Value:='A';

  //if (rxVentaSerie.IsNull) or (rxVentaSerie.Value = 0) then
  //rxVentaSerie.Value:=1;

  rxVentaMontoBruto.Value:= rxVentaCant.Value * rxVentaPrecio.Value;

  CalcularMontoBrutoXMoneda;
  //Antes
  {if not rxVentaMoneda.IsNull then
  begin
    if (rxVentaMonedaBase.Value <> rxVentaMoneda.Value) then
    if (not rxVentaMonedaBase.IsNull and (rxVentaMonedaBase.Value <> '')) then
    begin
      rxVentamonto_tasa.Value:= GlbMontoTasa(rxVentaMonedaBase.Value);
      rxVentaMontoBruto.Value:= rxVentaMontoBruto.Value * rxVentamonto_tasa.Value;

      GlbMontoTasa(rxVentaMonedaBase.Value);
      lblTasa.Caption:=Concat('1 = ',InsertarComa(FloatToStr(GlbMontoTasa(rxVentaMonedaBase.Value))));
      Totalestotalneto.DisplayFormat:=Concat(SimboloMoneda(TotalesMoneda.Value),',0.00');

      frmProcVentaRapida.lblTasa.Visible:=True;
    end;
  end;}

  rxVentaMontoDescuento.Value:=rxVentaMontoBruto.Value * rxVentaPorcDescItem.Value/100;

  if (UpperCase(rxVentaDescripcion.Value) = 'RECARGO') then
  rxVentaTipoVenta.Value:=3;
  if rxVentaIDTasaITBIS.Value <> GlbIDTasa then
  rxVentaIDTasaITBIS.Value := GlbIDTasa;
                                                                  
  //Valido para el repuesto
  if (GlbIgI = 1) and (UpperCase(GLBFormatoFactura) = 'FORMAFACOCO')
  and (GlbCalcItbis = 0) then
  rxVentaIDTasaITBIS.Value := 1;

  if tablaPropietarioCodigoPropietario.IsNull then
  begin
    tablaPropietario.Edit;
    tablaPropietarioCodigoPropietario.Value:=0;
    tablaPropietario.Post;
    Totales.Edit;
    if Not (EsModificandoFactura) then
    begin
      AsignaNCFCFinal;
    end;
    //Ignored POS exito RxDBLookupCombo3Exit(Self);
  end;
  case rxVentaIDTasaITBIS.Value of
  1:rxVentaPorcTasaItbisCld.Value:='0%';
  3:rxVentaPorcTasaItbisCld.Value:='8%';
  2:rxVentaPorcTasaItbisCld.Value:='11%';
  4:rxVentaPorcTasaItbisCld.Value:='13%';
  5:rxVentaPorcTasaItbisCld.Value:='16%';
  6:rxVentaPorcTasaItbisCld.Value:='18%';
  end;

  if (rxVentaPrecio.Value = 0) And (not rxVentaPrecio.IsNull) And (GlbAplicaOfertas = 1) then
  rxVentaDescripcionEspecial.Value:='***Promoción***';

  if not dmCalculos.EsProcCalc then
  begin
    //frmLogError.Marca:=11; frmLogError.CurrenLN:=4869; frmLogError.LogSteps(GlbNumVtaPOS,rxVentaSerie.Value,now,now,'Antes dmCalculos.ProcesaCalculos;','UProcVentaRapida');
    dmCalculos.ProcesaCalculos;
    //frmLogError.Marca:=22; frmLogError.CurrenLN:=4869; frmLogError.LogSteps(GlbNumVtaPOS,rxVentaSerie.Value,now,now,'Despues dmCalculos.ProcesaCalculos;','UProcVentaRapida');
  end;
end;

procedure TfrmProcVentaRapida.BitBtn5Click(Sender: TObject);
begin
  if rxVenta.RecordCount = 0 then exit;
  EsModificandoFactura:= Label36.Visible;
  GlbCalculado := False;
  if rxVenta.state = dsBrowse then rxVenta.Cancel;
  begin
    if (EsModificandoCotiza) then
    begin
      if (rxVentaStatus.Value = 'I') then
      begin
        dmCalculos.ProcDelRecPosExtraDet(rxVentaSerie.Value);
        rxVenta.Delete;
        DBEdit2Exit(Self);        
        BitBtn27Click(Self);
      end else
      begin
        dmCalculos.ProcDelRecPosExtraDet(rxVentaSerie.Value);
        rxVenta.Edit;
        rxVentaStatus.Value:='C';
        DBEdit2Exit(Self);
        if rxVenta.State = dsEdit then
        rxVenta.Post;
        //WriteToLog('Post rxVenta - Line 2357');
        //marzo 17 2015 ProcesarSumaTotal;
        BitBtn27Click(Self);
      end;
    end else
    if EsModificandoFactura then
    begin
      if (rxVentaStatus.Value = 'I') then
      begin
        dmCalculos.ProcDelRecPosExtraDet(rxVentaSerie.Value);
        rxVenta.Delete;
        DBEdit2Exit(Self);
        BitBtn27Click(Self);
      end else
      begin
        dmCalculos.ProcDelRecPosExtraDet(rxVentaSerie.Value);
        rxVenta.Edit;
        rxVentaStatus.Value:='C';
        DBEdit2Exit(Self);
        if rxVenta.State = dsEdit then
        rxVenta.Post;
        //WriteToLog('Post rxVenta - Line 2372');
        //marzo 17 2015 ProcesarSumaTotal;
        BitBtn27Click(Self);
      end;
    end else
    if EsModificandoFactura then
    begin
      if VerificaClave then
      begin
        if MessageDlg('Borrar item No.' + rxVentaSerie.AsString + '?', mtWarning, [mbYes, mbNO], 0)= mrYes then
        begin
          if not ValidarDobleRegPago then exit;
          EliminarRecoverData;
          dmCalculos.ProcDelRecPosExtraDet(rxVentaSerie.Value);
          rxVenta.Delete;
          DBEdit2Exit(Self);
          //marzo 17 2015 ProcesarSumaTotal;
          BitBtn27Click(Self);
        end;
      end;
    end else
    begin
      if MessageDlg('Borrar item No.' + rxVentaSerie.AsString + '?', mtWarning, [mbYes, mbNO], 0)= mrYes then
      begin
        if not ValidarDobleRegPago then exit;
        EliminarRecoverData;
        dmCalculos.ProcDelRecPosExtraDet(rxVentaSerie.Value);
        rxVenta.Delete;//rxVenta.recordcount
        DBEdit2Exit(Self);
        if not GlbCalculado then
        BitBtn27Click(Self);
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
    if isShowing then
    if not edtCodigo.Focused then
      if not EsModificandoCotiza then
      begin
        if imbBarcode.Visible then
        begin
        if isShowing then
          edtCodigo.SetFocus;
          PostMessage(edtCodigo.Handle, WM_SETFOCUS, 0, 0);
        end;
      end;
  finally
  frmRegMiniInvientario.free;
  frmRegMiniInvientario:=nil;
  end;
end;

procedure TfrmProcVentaRapida.InsertarDetDevolucion(numero : Integer);
begin
 
end;

procedure TfrmProcVentaRapida.InsertarDet(numero : Integer);
begin
  ibStpInsertVentaDet.Params[0].Value  := Numero;
  ibStpInsertVentaDet.Params[1].Value  := rxVentaCodArticulo.Value;
  ibStpInsertVentaDet.Params[2].Value  := Null;
  ibStpInsertVentaDet.Params[3].Value  := rxVentaDescripcion.Value;
  ibStpInsertVentaDet.Params[4].Value  := rxVentaCant.Value;
  ibStpInsertVentaDet.Params[5].Value  := rxVentaPrecio.Value;
  ibStpInsertVentaDet.Params[6].Value  := rxVentaPorcDescItem.Value; //rxVentaporc_desc.Value;//descuento
  ibStpInsertVentaDet.Params[7].Value  := rxVentaItbi.Value;//itbi_det
  ibStpInsertVentaDet.Params[8].Value  := rxVentaMontoBruto.Value;
  ibStpInsertVentaDet.Params[9].Value  := rxVentaMontoNeto.Value;
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
  ibStpInsertVentaDet.Params[22].Value := rxVentaloteNum.Value;
  ibStpInsertVentaDet.ExecProc;
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
begin
  ConsultaPreventa;
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

//Facturar a credito
procedure TfrmProcVentaRapida.Cotizar1Click(Sender: TObject);
begin
  BitBtn8Click(Self)
end;

procedure TfrmProcVentaRapida.BitBtn8Click(Sender: TObject);
var
  flag , trnExiste : boolean;
  numCtz:integer;
begin

end;

procedure TfrmProcVentaRapida.InsertarCotizacionDet(numero: Integer);
begin

end;

procedure TfrmProcVentaRapida.ProcesaFacturar(tipo : smallint; numdoc:Integer; codcte:Integer);
begin

end;

procedure TfrmProcVentaRapida.ActBalaceCteP(operacion:smallint);
var
  Monto:Real;
begin

end;

procedure TfrmProcVentaRapida.EditarBalanceP(monto:Real);
begin
end;

procedure TfrmProcVentaRapida.EditarBalanceP(monto:Real;tipo:Integer);
begin
end;


procedure TfrmProcVentaRapida.InsertaBalanceP(monto:Real);
begin
end;

procedure TfrmProcVentaRapida.ProcVentaConNCF(tiponcf:String;var ValorNCF:String;var seriedoc:Integer; var serie_asignadoncf : Integer);
begin
end;

procedure TfrmProcVentaRapida.MaestroCliente1Click(Sender: TObject);
begin
  frmClientes:=TfrmClientes.Create(Self);
  try
    dmUsuarios.qryRoles.Close;
    dmUsuarios.qryRoles.Params[0].Value:= VarUsuarioGlb;
    dmUsuarios.qryRoles.Open;
    dmUsuarios.qryRoles.First;
    //While Not dmUsuarios.qryRoles.Eof Do
   // begin
      //ActivaPermiso(TForm(frmClientes), 1000, dmUsuarios.qryRolesID_ROL.Value, 0);//menu principal: 1000 debe estar en la tabla PROCESOS
      //dmUsuarios.qryRoles.Next;
   // end;
    if tablaPropietarioCodigoPropietario.Value > 0 then
    begin
      dmclientes.tblClientes.Tag:=-1;
      dmclientes.tblClientes.DisableControls;
      dmclientes.tblClientes.Locate('CODIGO_CTE', tablaPropietarioCodigoPropietario.Value,[]);
      dmclientes.tblClientes.Tag:=0;
      dmclientes.tblClientes.EnableControls;
    end;
    frmClientes.PageControl1.ActivePageIndex:=0;
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
  rxLote.Close;
  rxLote.Open;
  rxLote.Insert;
  rxLoteLotNum.Value:= qryProductosLOTE_NUM.Value;
  rxLote.Post;
  try
    edtCodigo.Text := qryProductosCodigo.AsString;
  except
  edtCodigo.Text := qryProductosCodigo.AsSTring;
  end;
  panel2.Visible := False;
  Prod_existe    := True;
  BuscandoPorDesc:=false;

  if Assigned(frmProcVentaRapida) Then
  if (showing) then
  if cboxTipoUnidad.Enabled then
     cboxTipoUnidad.SetFocus;
  edtCodigoExit(Self);
  if (GlbUsaPUnidadLevel = 1) then
  if isShowing then
  rxdblookupTipoUnidad.SetFocus;
end;

procedure TfrmProcVentaRapida.DBEdit1Enter(Sender: TObject);
begin
  //Refresh;
  yNumSerie:= rxVentaSerie.Value;
  if not rxVentaCant.IsNull then
  auxiCant:= rxVentaCant.Value
  else
  auxiCant:= -1;
  if Not Prod_existe and ((rxVenta.State in [dsEdit, dsInsert]) or (rxVenta.RecordCount > 0)) then
  begin
    if qryProductos.Locate('codigo_Texto', rxVentaCodTexto.Value,[]) then
    begin
      _UsarLevelPrecio:= qryProductosUSARLEVELPRECIO.Value;
      Prod_existe:=True;
    end else
    begin
      MessageDlg('Código producto no encontrado, verifique', mtInformation, [mbOK], 0);
      edtCodigo.Text:='';
      if not edtCodigo.Focused then
      begin
        if isShowing then
        begin
          edtCodigo.SetFocus;
          PostMessage(edtCodigo.Handle, WM_SETFOCUS, 0, 0);
        end;
      end;
      Exit;
    end;
  end;

  Panel2.Visible:=False;
end;

procedure TfrmProcVentaRapida.BitBtn10Click(Sender: TObject);
begin
  if (rxVenta.RecordCount >  0) then
  begin
    Totales.Edit;
    rxVenta.Edit;
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

procedure TfrmProcVentaRapida.MostrarVistaproductos1Click(Sender: TObject);
begin
  MostrarVistaproductos1.Checked := Not MostrarVistaproductos1.Checked;
end;

procedure TfrmProcVentaRapida.edtReferenciaChange(Sender: TObject);
begin
  if (edtReferencia.Text = '') then exit;
  if qryProductos.Locate('referencia', edtReferencia.Text, [loCaseInsensitive, loPartialKey]) then
  begin
    _UsarLevelPrecio:= qryProductosUSARLEVELPRECIO.Value;
    Prod_existe:= True;
    edtCodigo.Text := qryProductosCODIGO.AsString;
    //panel2.Top := edtcodigo.Top+30;
    panel2.Left:= edtcodigo.Left;
    panel2.Visible:=True;
    panel2.BringToFront;
  end
end;

procedure TfrmProcVentaRapida.edtReferenciaExit(Sender: TObject);
begin
  if (edtReferencia.Text = '') then
  begin
    edtCodigo.text:='';
    Panel2.Visible:=False;
    exit;
  end else
  begin
    edtCodigo.text:=qryProductosCodigo.AsString;
    edtReferencia.Text:='';
    Panel2.Visible:=False;
  end;
  //if Panel2.Visible then
  //edtReferencia.Text := qryProductosCodigo_Texto.Value;
  if (qryProductos.State = dsInactive) then
  qryProductos.Open;
  if (edtCodigo.text <> '') then
  edtCodigoExit(Self);
  //qryProductos.Locate('Referencia', edtReferencia.Text, [loCaseInsensitive])
end;

procedure TfrmProcVentaRapida.BitBtn14Click(Sender: TObject);
begin
  DBEdit2.ReadOnly := True;
  if (varTipousuario = 0) then //Adm
  begin
    DBEdit2.ReadOnly := False;
    if isShowing then
    DBEdit2.SetFocus;
  end else
  begin
    if not GlbPermiteCambioPrecio then
    begin
        precioAnt:=rxVentaPrecio.Value;
        DBEdit2.ReadOnly := False;
        if isShowing then
        DBEdit2.SetFocus;

    end else
    begin
      precioAnt:=rxVentaPrecio.Value;
      DBEdit2.ReadOnly := False;
      if isShowing then
      DBEdit2.SetFocus;
    end;
  end;
end;

procedure TfrmProcVentaRapida.DBEdit2Exit(Sender: TObject);
var
  guardarRec : TBookMark;
  porcdes : Extended;
  diff : Currency;
  cambioValido : Boolean;
begin
  if rxVentaPrecio.IsNull then
  begin
     if isShowing then
     begin
       edtCodigo.SetFocus;
       PostMessage(edtCodigo.Handle, WM_SETFOCUS, 0, 0);
     end;
     Exit;//Evitar loop y lentitud -en experimento  
  end;
  yNumSerie:= rxVentaSerie.Value;
  if rxVenta.State in [dsEdit, dsInsert] then
  begin
    if rxVentaPrecio.IsNull then
    rxVentaPrecio.Value:=0;
  end;
  if GlbCalculado  then  //nuevo ultimo
  begin
     if isShowing then
     begin
       edtCodigo.SetFocus;
       PostMessage(edtCodigo.Handle, WM_SETFOCUS, 0, 0);
     end;
     Exit;//Evitar loop y lentitud -en experimento
  end;
  //frmLogError.CurrenLN:=7288;
  //frmLogError.LogMarca(GlbNumVtaPOS,rxVentaSerie.Value,now,now,'OnExitPrecio',1);
  DBEdit2.Color:=clWindow;
  cambioValido:=False;  //cboxTipoUnidad.text
   cPrecio:= rxVentaPrecio.Value;//rxdblookupTipoUnidad.text
   if rxVenta.State in [dsEdit, dsInsert] then
   begin
     if (cPrecio < aPrecio) and (cPrecio < qryProductosPRECIO_MINIMO.Value) then
     begin
       if (not GlbFactRecurrente) then
       begin
       if not EsModificandoFactura then
       begin
         if (not VerificaClave) then
         begin
           MessageDlg('Precio no será cambiado', mtWarning, [mbOk], 0);
           rxVentaPrecio.Value := aPrecio;
         end else cambioValido:=True;
       end;
       end;
     end;
   end;

  if (aPrecio <> cPrecio) then
  PrecioCambio:=True else PrecioCambio:=False;
  DBEdit2.ReadOnly:=True;rxVenta.RecordCount;
  if PrecioCambio then
  dmCalculos.esFeedbackExtra:=False;
  //inicia lineas nuevas para recalcular
  if not dmCalculos.esFeedbackExtra then
  if not rxVentaMoneda.IsNull then
  if dmCalculos.qryConsultaPosExtraDet.Tag <> 99 then
  if procCalc  then
  dmCalculos.ProcInsertUpdatePosExtraDet(GlbNumVtaPOS);
  //end nuevo
  BitBtn27Click(Self);
  rxVenta.RecordCount;
  if rxVenta.State = dsBrowse then
  if (rxVentaSerie.Value <> yNumSerie) then
  rxVenta.Locate('Serie', yNumSerie,[]);

  if rxVentaCodTexto.Value = '' then Exit;

  if qryInventario.State = dsInactive then
  qryInventario.Open;
  //chKDescuentoGlobalClick(Self) ;
  if Not qryInventario.Locate('CODIGO_TEXTO', rxVentaCodTexto.Value,[]) then
  MessageDlg('codigo ' + rxVentaCodTexto.Value + ' no encontrado en inventario, verifique', mtError, [mbOK], 0)
  else
  begin //chequear precio
    diff := rxVentaPrecio.Value - qryProductosPRECIO_MINIMO.Value;
    qryProductos.Locate('CODIGO',qryInventariocODIGO.Value,[]);
    _UsarLevelPrecio:= qryProductosUSARLEVELPRECIO.Value;
    //if _UsarLevelPrecio > 0 then
    //RxSpinEdit1.Value:=_UsarLevelPrecio;

    if (Not FAplicaPrecioMayorista) And ((rxVentaPrecio.Value < qryProductosPRECIO_MINIMO.Value) and
    (ABS(diff) > 2)) And (glbUsaescalaPrecio = 0) And (Not cambioValido)
    And (not EsModificandoFactura) 
    And (not GLBEsFastFood) //temporal hasta probar version Limao
     then
    begin
      if (rxVenta.State = dsBrowse) then
      rxVenta.Edit;
      if not GlbFactRecurrente then
      rxVentaPrecio.Value := aPrecio;
      rxVenta.Post;
      if (not GlbFactRecurrente) and  (GlbUsaPUnidadLevel = 0) and (Not EsModificandoFactura) then
      if MessageDlg('Precio es menor que el minimo, continuar?', mtError, [mbYes,mbNo], 0) = mrno then
      begin
        DBEdit2.ReadOnly := False;
        if isShowing then
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
  //if Assigned(guardarRec) then
  //begin
  //  rxVenta.GotoBookmark(guardarRec);
  //  rxVenta.FreeBookmark(guardarRec);
  //end;

  dmCalculos.EsProcCalc:=True;
  //frmLogError.Marca:=11; frmLogError.CurrenLN:=7365; frmLogError.LogSteps(GlbNumVtaPOS,rxVentaSerie.Value,now,now,'Antes dmCalculos.ProcesaCalculos;','UProcVentaRapida');
  dmCalculos.ProcesaCalculos;
  //frmLogError.Marca:=22; frmLogError.CurrenLN:=7365; frmLogError.LogSteps(GlbNumVtaPOS,rxVentaSerie.Value,now,now,'Despues dmCalculos.ProcesaCalculos;','UProcVentaRapida');

  dmCalculos.EsProcCalc:=False;
  if rxVenta.State in [dsEdit, dsInsert] then
  rxVenta.Post;
  if isShowing then
  if not edtCodigo.Focused then
    if not EsModificandoCotiza then
    begin
        begin
          edtCodigo.SetFocus;
          PostMessage(edtCodigo.Handle, WM_SETFOCUS, 0, 0);
        end;
    end;
  rxVenta.EnableControls;
  RxDBGrid1.EnableScroll;
  label52.Caption:=FormatDateTime('hh:mm:ss',Now);
  //if (rxVenta.RecordCount > 0) then
  if isShowing then
  begin
    edtCodigo.SetFocus;
    PostMessage(edtCodigo.Handle, WM_SETFOCUS, 0, 0);
  end;
  edtCodigo.Color  :=clWindow;
  if (rxVentaPrecio.Value > 200000) then
  begin
    if MessageDlg('¿Precio es mayor a DOSCIENTOS MIL?',mtWarning,[mbno, mbyes],0) = mrno then
    begin
      if IsShowing then
      DBEdit2.SetFocus;
    end;
  end;
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

procedure TfrmProcVentaRapida.DBEdit2Enter(Sender: TObject);
begin
  frmLogError.Cant := rxVentaCant.value;
  frmLogError.LogMarca(GlbNumVtaPOS,rxVentaSerie.Value,now,now,'OnEnterPrecio',1);
  edtCodigo.Text := '';
  pesoProd := '';
  if (GlbNumero > 0) then
  if rxVenta.State = dsbrowse then
  if (rxVentaSerie.Value <> GlbNumero) then
  rxVenta.Locate('Serie', GlbNumero,[]);
  DBEdit2.SelectAll;
  DBEdit2.Color:= clYellow;

  Panel2.Visible:=False;

  if (rxVentaPrecio.Value = 0) then
  begin
    DBEdit2.ReadOnly:=False;
  end;
  aPrecio:= rxVentaPrecio.Value;
  if esEditando and imbBarcode.Visible then
  begin
    if isShowing then
    begin
      edtCodigo.SetFocus;
      PostMessage(edtCodigo.Handle, WM_SETFOCUS, 0, 0);
    end;
  end;
end;

procedure TfrmProcVentaRapida.chkExentoExit(Sender: TObject);
var
  _book : TBookmark;
begin
  BitBtn27Click(Self);
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

procedure TfrmProcVentaRapida.AsignarSqlText(campo, valor,OrderBy: String);
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
    //Format('Select INV.*, tipo_inv.Descripcion Desc_tipoInv ' +
    Format('Select INV.CODIGO, INV.CODIGO_TEXTO, INV.FECHA, INV.CODIGO_BARRA, INV.TIPO, INV.DESCRIPCION, INV.CANTIDAD_REORDEN, INV.PRECIO_ANT, INV.CANTIDAD, PRECIO, BLCE_CANT_ENTRADA, ' +
           'BLCE_CANT_SALIDA, INV.FECHA_ULTIMA_TRN, INV.STATUS, INV.PORC_DESCUENTO, FOTO, INV.PAGA_ITBI, INV.CODIGO_PRECIO, INV.UNIDAD, INV.PRECIO_COMPRA, INV.PRECIO_MINIMO, ' +
           'INV.REFERENCIA, FECHA_VENCIMIENTO, INVENTARIAR, PRECIO_TIPO_UNIDAD, INV.TIPO_UNIDAD, INV.PRECIOVENTA1, INV.PRECIOVENTA2, INV.PRECIOVENTA3, INV.PRECIOVENTA4, ' +
           'USARLEVELPRECIO, INV.CIA_KEY, INV.PORCITBIS, INV.DESCRIPCIONADICIONAL, INV.COD_MONEDA, INV.IDTASAITBIS, LOTE_NUM, CANTLOT, TIPO_INV.DESCRIPCION AS  DESC_TIPOINV ' +
           'From %s(%s) INV ' +
           'inner join TIPO_INVENTARIO tipo_inv on tipo_inv.CODIGO = inv.TIPO ' +
           ' WHERE CIA_KEY=:CIAKEY ' +
           ' ORDER BY codigo, tipo,descripcion, Referencia',[nombProc, IntToStr(GlbCodDivInventario)]);
  end else
  qryProductos.SQL.Text:=
  Format('Select INV.CODIGO, INV.CODIGO_TEXTO, INV.FECHA, INV.CODIGO_BARRA, INV.TIPO, INV.DESCRIPCION, INV.CANTIDAD_REORDEN, INV.PRECIO_ANT, INV.CANTIDAD, INV.PRECIO, INV.BLCE_CANT_ENTRADA, ' +
         'BLCE_CANT_SALIDA, FECHA_ULTIMA_TRN, STATUS, PORC_DESCUENTO, FOTO, PAGA_ITBI, CODIGO_PRECIO, INV.UNIDAD, INV.PRECIO_COMPRA, INV.PRECIO_MINIMO, ' +
         'INV.REFERENCIA, INV.FECHA_VENCIMIENTO, INVENTARIAR, PRECIO_TIPO_UNIDAD, INV.TIPO_UNIDAD, INV.PRECIOVENTA1, INV.PRECIOVENTA2, INV.PRECIOVENTA3, INV.PRECIOVENTA4, ' +
         'USARLEVELPRECIO, INV.CIA_KEY, INV.PORCITBIS, INV.DESCRIPCIONADICIONAL, INV.COD_MONEDA, INV.IDTASAITBIS, LOTE_NUM, CANTLOT, TIPO_INV.DESCRIPCION AS  DESC_TIPOINV ' +
         'From %s(%s) INV '+
         ' inner join TIPO_INVENTARIO tipo_inv on tipo_inv.CODIGO = inv.TIPO ' +
         ' AND inv.tipo = tipo_inv.codigo ' +
         ' WHERE  UPPER(inv.%s) like %s and INV.CIA_KEY=:CIAKEY ' +
         ' ORDER BY INV.codigo, tipo,INV.descripcion, INV.Referencia',[nombProc, IntToStr(GlbCodDivInventario), Campo, Valor]) ;

  qryProductos.Params[0].Value:= glbCia_Key;
  qryProductos.Open;

  if (qryProductos.RecordCount = 0) and (campo <> '') then
  begin
    qryProductos.SQL.Text:=
    Format('Select INV.*,tipo_inv.Descripcion Desc_tipoInv  From %s(%s) INV, TIPO_INVENTARIO tipo_inv ' +
        ' WHERE CIA_KEY=:CIAKEY AND inv.tipo = tipo_inv.codigo AND UPPER(inv.%s) like %s ',[nombProc, IntToStr(GlbCodDivInventario), 'codigo_texto', Valor]) +
        ' ORDER BY INV.codigo, INV.tipo,INV.descripcion, INV.Referencia';
    qryProductos.Close;
    qryProductos.Params[0].Value:= glbCia_Key;
    qryProductos.Open;
  end;

  qryProductos.EnableControls;
end;

procedure TfrmProcVentaRapida.chkExentoEnter(Sender: TObject);
begin
  if isShowing then
  chkExento.SetFocus;
end;

procedure TfrmProcVentaRapida.RxDBGrid2GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if qryProductosCANTIDAD.Value <=0 then
  begin
    BackGround := $00BDECE9;
    aFont.Color := clblack;
  end else
  if qryProductosCANTIDAD.Value <=5 then
  begin
    BackGround := clYellow;
    aFont.Color := clblack;
  end;// else
  if (qryProductosPrecio.Value < qryProductosPrecio_Minimo.Value) then
  begin
    BackGround := clRed;
    aFont.Color := clblack;
  end;
  if (qryVence.State = dsBrowse) then
  begin
    if qryVence.Locate('codigo', qryProductosCodigo.Value,[]) then
    begin
     if (qryVenceDiasVencidos.Value > 0) then
     begin
       BackGround := clPurple;
      aFont.Color := clWhite;
     end;
    end;
  end;
end;

procedure TfrmProcVentaRapida.ReImprimirRecibo1Click(Sender: TObject);
var
  flag : boolean;
begin

end;

procedure TfrmProcVentaRapida.FormShow(Sender: TObject);
begin
  ProcActUltTrn;
  isShowing:=True;
  if (GlbActivaCafeteria = 1) then
  label26.Visible := True
  else label26.Visible := False;
  //SkinData1.Active := False;
  Application.ProcessMessages;
  //t SkinData1.Active := True;
  tblMoneda.Close;
  tblMoneda.Open;
  qryCliente.Close;
  qryCliente.Open;
  if rxVenta.recordcount = 0 then
  begin
    tablaPropietario.Close;
    tablaPropietario.Open;
  end;
  qryVence.Close;
  qryVence.Open;
  AbrirUnidades;
  //Height:=735;


  frmPosExtraDet:=TfrmPosExtraDet.Create(nil);
  try
    dmCalculos.esFeedbackExtra := True;
    if dmCalculos.qryConsultaPosExtraDet.Tag <> 99 then
    begin
      GlbEntradoAvta:=False;
      frmPosExtraDet.ProcAbrirPorCodUsuario;
    end;
    dmCalculos.esFeedbackExtra := False;
  finally
  frmPosExtraDet.free;
  frmPosExtraDet:=nil
  end;
  edtCodigo.Enabled:=True;
  if imbBarcode.Visible then
  begin
    if isShowing then
    begin
      edtCodigo.SetFocus;
      PostMessage(edtCodigo.Handle, WM_SETFOCUS,0,0);
    end;
  end;
  //temporal
  //CheckBox1.Checked:=False;
end;

procedure TfrmProcVentaRapida.RxLabel1Click(Sender: TObject);
begin
  ProcActUltTrn;
  Refresh;
  if GLBIFiscalOpeAbierta then
  begin
    if MessageDlg('Ultima operación fiscal, presentó un fallo. Cancelar ahora?',
       mtInformation,[mbyes, mbno],0) = mryes then
    begin
    end;
  end;
end;

procedure TfrmProcVentaRapida.ProcVenta(valorNCF:String;Serie_Asignadoncf:Integer; Var serieDoc:Integer);
var
  xexiste : boolean;
begin

end;

procedure TfrmProcVentaRapida.LectorCodBarra1Click(Sender: TObject);
begin
  imbBarcode.Visible := not imbBarcode.Visible;
  LectorCodBarra1.Checked:= imbBarcode.Visible;
  if lectorcodbarra1.Checked then
  edtCodigo.Hint:='Enter - para buscar codigo barra. F10-on/off'
  else edtCodigo.Hint:= '';
  //imbBarcode.Visible := LectorCodBarra1.Checked;
  if imbBarcode.Visible then
  BEGIN
    if isShowing then
    begin
      edtCodigo.SetFocus;
      PostMessage(edtCodigo.Handle, WM_SETFOCUS, 0, 0);
    end;
    edtCodigo.Text:='';
    Label54.Visible:=true;
  END else
  begin
    if isShowing then
    begin
      edtCodigo.SetFocus;
      PostMessage(edtCodigo.Handle, WM_SETFOCUS, 0, 0);
    end;
    
    edtCodigo.Text:='';
    Label54.Visible:=false;
  end;
end;

procedure TfrmProcVentaRapida.Edit1Enter(Sender: TObject);
begin
  if TotalesTipoNCF.isnull then
  AsignaNCFCFinal;  //TotalesPropinaLegal.value
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
  if not GlbUsandoCotiza then
  ProcItbisExonerado;
  if not ValidaSubTotal then exit;
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
end;

procedure TfrmProcVentaRapida.FormHide(Sender: TObject);
begin
  isShowing:=False;
end;

procedure TfrmProcVentaRapida.qryClienteAfterScroll(DataSet: TDataSet);
begin
  if (GlbPrecioMayRegOrden = 1) then
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
    if ((rxVentaSerie.Value = 0) or rxVentaSerie.IsNull) 
    then Break;
     
    if rxVenta.State In [dsEdit, dsInsert] then
    rxVenta.Post;
    //WriteToLog('Post rxVenta - Line 5506');

    rxVenta.Next;
  end;

  sumarDatos:=True;
  rxVenta.AutoCalcFields := False;
end;

procedure TfrmProcVentaRapida.CheckTipoNCFCte;
begin
  if (tablaPropietarioCodigoPropietario.Value > 0) then
  begin
    if qryCliente.Locate('CODIGO_CTE', tablaPropietarioCodigoPropietario.Value, []) then
    begin
      if qryClienteTIPO_CF.IsNull then
      NCFCTeNotSetup:=True
      else
      NCFCTeNotSetup:=False;
    end else
    NCFCTeNotSetup:=False;
  end else
  if (tablaPropietarioCodigoPropietario.Value = 0) or (tablaPropietarioCodigoPropietario.IsNull) then
  NCFCTeNotSetup:=False;
end;
procedure TfrmProcVentaRapida.RxDBLookupCombo1Exit(Sender: TObject);
begin
  CheckTipoNCFCte;
  if not rxVentaglbcodVendedor.IsNull then
  glbcodVendedor := rxVentaglbcodVendedor.Value;
  RxDBLookupCombo1Change(Self);
  
  if rxVenta.RecordCount = 0 then
  begin
    if rxVentaSerie.IsNull then
    begin
      if isShowing then
      edtCodigo.SetFocus;
      PostMessage(edtCodigo.Handle, WM_SETFOCUS, 0, 0);
    end;
    exit;
  end;
  
  if (GlbPrecioMayRegOrden = 1) then
  begin
    AbrirClasifPrecio;
    AplicaPrecioMayorista;
  end;

  RxSpinEdit1.Value:=1;
  if not tablaPropietarioCodigoPropietario.IsNull then
  begin
    if (tablaPropietarioCodigoPropietario.Value <> qryClienteCODIGO_CTE.Value) then
    begin
      if qryCliente.locate('codigo_Cte',tablaPropietarioCodigoPropietario.Value,[]) then
      begin
        if qryClienteUSARLEVELPRECIO.Value > 0 then
        RxSpinEdit1.Value:= qryClienteUSARLEVELPRECIO.Value
        else
        if (_UsarLevelPrecio > 0) and (_UsarLevelPrecio <=4) then
        RxSpinEdit1.Value:= _UsarLevelPrecio;
      end else
      if (_UsarLevelPrecio > 0) and (_UsarLevelPrecio <=4) then
      RxSpinEdit1.Value:= _UsarLevelPrecio;
    end;
  end
  else
  if (_UsarLevelPrecio > 0) and (_UsarLevelPrecio <=4) then
  RxSpinEdit1.Value:= _UsarLevelPrecio;
    
  if Not tablaPropietarioCodigoPropietario.IsNull then
  if qryClienteCOD_VENDEDOR.Value > 0 then
    GlbCodVendedor :=qryClienteCOD_VENDEDOR.Value
  else
  GlbCodVendedor := -1;
  //qryClienteRNC_NUMERO
  if (rxVenta.RecordCount > 0) then
  begin
    //marzo 17 2015 ProcesarSumaTotal;
    BitBtn27Click(Self);
    rxVenta.EnableControls;
    rxdbgrid2.EnableScroll;
  end;

  ProcSetNCFCliente;
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
    end else
    begin
      if MessageDlg('Realmente desea salir con una venta en curso?',mtWarning,[mbyes,mbno],0) = mryes then
      CanClose:= True else
      CanClose:= False;
    end;
  end;
  SecretPanel1.Active:=False;
  SecretPanel1.Visible:=false;
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
    SecretPanel1.BringToFront;
    panelDescripcionServ.Visible:=False;
    While Not qryVence.Eof Do
    begin
      SecretPanel1.Lines.Add(qryVenceDESCRIPCION_PRODUCTO.Value+' - '+
      qryVenceDIASPORVENCER.AsString);
      qryVence.Next;
    end;
  end else
  begin
    SecretPanel1.Visible := False;
    panelDescripcionServ.Visible:=True;
    SecretPanel1.SendToBack;
  end;
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
var
  xflag:boolean;
begin
  if rxVenta.State In [dsBrowse] Then
  rxVenta.Edit;
  xflag:=False;

  {
  if (GLBPrecioMayUnidad = 1) and (uppercase(cboxTipoUnidad.Text) = 'UNIDAD') then
  begin
    rxVentaDescUnidadMedida.Value:=cboxTipoUnidad.Text;
    exit;
  end; }

  dmVentas.qryPrecioUnidadSurt.Close;
  dmVentas.qryPrecioUnidadSurt.Params[0].Value:=rxVentaCodArticulo.Value;
  dmVentas.qryPrecioUnidadSurt.Open;

  //dmVentas.qryPrecioUnidadSurt.recordcount
  xflag:=True;
  //if (GlbUsaPUnidadLevel = 1) or (GLBPrecioMayUnidad = 1) then
  if (GlbUsaPUnidadLevel = 1) then
  if not dmVentas.qryPrecioUnidadSurt.Locate('COD_PRODUCTO;DESCRIPCION',
  VarArrayOf([rxVentaCodArticulo.Value,cboxTipoUnidad.Text]),[]) then
  begin
    if (GlbUsaPUnidadLevel = 1) then
    begin
      MessageDlg('Unidad no encontrada en precio por unidad, verifique.', mtError, [mbOk], 0);
      xflag:=False;
    end;
  end else
  begin
    GlbTipoUnidad := dmVentas.qryPrecioUnidadSurtIDUNIDAD.Value;
    CantUnidad:= dmVentas.qryPrecioUnidadSurtCANTIDAD.Value;
    if GlbTipoUnidad = 1 then
    CantUnidad:=1;
    rxVentaTipoUnidad.Value:= GlbTipoUnidad;
  end;
  
  if GlbUsaPUnidadLevel = 0 then
  if not xFlag then
  if Not dmInventario.qryTipoUnidad.Locate('DESCRIPCION', cboxTipoUnidad.Text, []) then
  begin
    xflag:=False;
  end else
 //if (GlbUsaPUnidadLevel = 1) Or (GLBPrecioMayUnidad = 1) then
 if (GlbUsaPUnidadLevel = 1) then
  begin
    GlbTipoUnidad := dmInventario.qryTipoUnidadIDUNIDAD.Value;
    CantUnidad:= dminventario.qryTipoUnidadCANTIDAD.Value;
    rxVentaTipoUnidad.Value:= GlbTipoUnidad;
    if GlbTipoUnidad = 1 then
    CantUnidad:=1;
  end;

  if xFlag then;
  begin
    if not qryProductoscodigo.Isnull And (Not PrecioCambio ) then
    begin
      if GlbUsaPUnidadLevel = 1 then
      SetPrecioPorCantidad
      else
      begin
        if (GlbUsaEscalaPrecio = 0) and (GlbTipoUnidad <> 1) then
        if (GlbUsaPUnidadStd = 1) and (Not GlbUsandoCotiza Or ( rxVentaStatus.Value = 'I')) then
        rxVentaPrecio.Value  := precioXUnidad(GlbTipoUnidad, qryProductoscodigo.value); //qryProductosPRECIO_TIPO_UNIDAD.Value;

        if (rxVentaprecio.Value = 0) And (Not PrecioCambio )then
        begin
          if (GlbUsaescalaPrecio = 1) And (Not GlbUsandoCotiza Or ( rxVentaStatus.Value = 'I') ) then
          begin
            SetPrecioPorCantidad;//case
          end
        end;// else
      end;
    end;
  end;

  if rxVenta.State In [dsBrowse] Then
  rxVenta.Edit;

  rxVentaDescUnidadMedida.Value:=cboxTipoUnidad.Text;
end;

//no usado, ver si no es necesario Dic 1, 2017
{
procedure TfrmProcVentaRapida.LlenarTipoUnidadBox(umedida:integer);
begin
  dmInventario.qryTipoUnidad.First;

  CantUnidad := 0;
  qryPrecioXTipoUnidad.Close;
  qryPrecioXTipoUnidad.Params[0].Value:=qryProductosCODIGO.Value;
  qryPrecioXTipoUnidad.Open;
  dmInventario.qryTipoUnidad.First;
  cboxTipoUnidad.Items.Clear;
  While Not dmInventario.qryTipoUnidad.Eof Do
  begin
    //t if (dmInventario.qryTipoUnidadIDUNIDAD.Value = 3) Or
    //t    (dmInventario.qryTipoUnidadIDUNIDAD.Value = umedida) then
    //t begin
    //if qryPrecioXTipoUnidad.Locate('ID_UNIDAD',dminventario.qryTipoUnidadIDUNIDAD.Value,[]) then
    //begin
      cboxTipoUnidad.Items.Add(dmInventario.qryTipoUnidadDESCRIPCION.Value);
      cantUnidad:=dmInventario.qryTipoUnidadCANTIDAD.Value;
    //end;
    //if (dmInventario.qryTipoUnidadIDUNIDAD.Value = qryProductosTipo_Unidad.value) then
    //CantUnidad := dmInventario.qryTipoUnidadCANTIDAD.Value;
    //t end;
    dmInventario.qryTipoUnidad.Next;
  end;
  if cboxTipoUnidad.Items.Count = 0 then
  begin
    if dmInventario.qryTipoUnidad.Locate('Descripcion', 'UNIDAD', [loCaseInsensitive]) then
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
}

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
  if (isShowing) then
  begin
    DBEdit1.SetFocus;
    DBEdit1.SelectAll;
  end;
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
  //if GlbUsaPUnidadLevel = 0 then exit;
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
      if (GlbUsaPUnidadLevel = 1) then
      begin
        MessageDlg('Producto no tiene precio por unidad configurado.',mtError,[mbOk],0);
      end;
      if frmProcVentaRapida.Showing then
      begin
        //MessageDlg('Precio no configurado por tipo unidad, verifique',mtwarning,[mbok],0);
        rxVentaTipoUnidad.Value:=1;
        GlbTipoUnidad := 1;
        CantUnidad:= 1;
      end;
      result:=rxVentaPrecio.Value;
    end;
  end;
end;

procedure TfrmProcVentaRapida.Label25TemporalrenameClick(Sender: TObject);
begin
  if MessageDlg('Imprimir recibo cash en próxima transacción?',mtInformation,[mbyes,mbno],0) = mryes then
  begin
    GlbImprimeReciboFact := 1;
    InactivaImprecibo := true;
    //t label25.Font.Color :=clPurple;
  end else
  if InactivaImprecibo then
  begin
    GlbImprimeReciboFact := 0;
    InactivaImprecibo := False;
    //t label25.Font.Color :=clBlack;
  end;
end;

procedure TfrmProcVentaRapida.RxSpeedButton1Click(Sender: TObject);
begin
  if MessageDlg('Esta operacion guarda la venta, sin imprimir factura. Continuar?',mtInformation,[mbyes,mbno],0) = mryes then
  begin
    SoloGuardaVenta     := True;
    GlbImprimeReciboFact:= 0;
    BitBtn4Click(Self);
    RxSpeedButton1.Visible:=False;
    GlbImprimeReciboFact:=1;
    ProcActUltTrn;
    ActualizarRecoverData;
    rxVenta.EmptyTable;
    lblTotalItem.Caption:='Total Items:'+IntToStr(rxVenta.RecordCount);
    if chkDisplay.Checked then
    Finalizardisplay;
    BitBtn1.Enabled:=True;
    BitBtn4.Enabled:=True;
    tablaPropietario.EmptyTable;
    tablaPropietario.Edit;
    tablaPropietarioCodigoPropietario.AsVariant := null;
    tablaPropietario.Post;

    edtCodigo.Text  := '';
    BitBtn4.Enabled := False;
    RxSpeedButton1.Visible:=False;
    if isShowing then
    BitBtn1.SetFocus;

    //EsDevolucion := False;
    Caption:='Proceso Venta';

    //NoGenerarNCF1Click(Self);
    if isShowing then
    if not EsModificandoCotiza then
    begin
      edtCodigo.SetFocus;
      PostMessage(edtCodigo.Handle, WM_SETFOCUS, 0, 0);
    end;
    edtObservacion.Text := '';

    if InactivaImprecibo then
    GlbImprimeReciboFact := 0;
    InactivaImprecibo    := False;
    sumarDatos:=True;
    ActualizarPreventa;
    qryProdPorProveedor.Close;
    pnlPrecioProv.Visible:=False;
    EsModificandoFactura:=False;
    InicializaOtrosDesc;
    GlbAlreadyCld := False;

    if (GlbNumVtaPOS > 0) then
    dmcalculos.ProcDeletePosExtraDet(GlbNumVtaPOS);
    GlbNumVtaPOS:=-1;

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
  chKDescuentoGlobal.Checked:= False;
  rxSolDatoscte.EmptyTable;

  rxventa.EnableControls;
  rxdbgrid1.Enabled:=True;
  RxDBGrid1.EnableScroll;
  if not GLBEsFastFood then
  begin

  label29.Top:= 413;
  dbTextMontoExoneraITBIS.Top := 410;
  end;
   label41.Visible := False;
   DBText15.Visible:= True;
   SoloGuardaVenta:=False;    
  end;
end;

procedure TfrmProcVentaRapida.MaestroInventario1Click(Sender: TObject);
begin
  frmInventarioProd:=TfrmInventarioProd.Create(Nil);
  try
    dmUsuarios.qryRoles.Close;
    dmUsuarios.qryRoles.Params[0].Value:= VarUsuarioGlb;
    dmUsuarios.qryRoles.Open;
    dmUsuarios.qryRoles.First;
    //While Not dmUsuarios.qryRoles.Eof Do
    //begin
      //ActivaPermiso(TForm(frmInventarioProd), 1000, dmUsuarios.qryRolesID_ROL.Value, 0);//menu principal: 1000 debe estar en la tabla PROCESOS
    //  dmUsuarios.qryRoles.Next;
    //end;
      
    frmInventarioProd.PageControl1.TabIndex:=0;
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
  if (cboxTipoUnidad.Text = '') then
  BEGIN
    cboxTipoUnidad.Text:='UNIDAD';
    GlbTipoUnidad := 1;
    CantUnidad:= 1;
  END;
  panel2.Visible := False;
  if (not rxVentaCodArticulo.IsNull) then
  if (GlbUsaPUnidadLevel = 1) then
  begin
    dminventario.qryTipoUnidad.Filtered:=False;
    dmInventario.xcodProducto := rxVentaCodArticulo.AsInteger;
    dminventario.qryTipoUnidad.Filtered:=True;
    cboxTipoUnidad.Clear;
    While Not dmInventario.qryTipoUnidad.Eof Do
    begin
      cboxTipoUnidad.Items.Add(dmInventario.qryTipoUnidadDESCRIPCION.Value);
      dmInventario.qryTipoUnidad.Next;
    end;
  end;
end;

procedure TfrmProcVentaRapida.DBEdit3Exit(Sender: TObject);
begin
  if (rxVentaMontoBruto.Value = 0) or (rxVentaMontoBruto.IsNull) then
  if not edtCodigo.Focused then
    if not EsModificandoCotiza then
    begin
     if isShowing then
     begin
      edtCodigo.SetFocus;
      PostMessage(edtCodigo.Handle, WM_SETFOCUS, 0, 0);
     end;
    end;
end;

procedure TfrmProcVentaRapida.RxDBGrid2Enter(Sender: TObject);
begin
  GlbNumero:= rxVentaSerie.Value;
end;

procedure TfrmProcVentaRapida.RxDBGrid2Exit(Sender: TObject);
begin
  GlbNumero:= rxVentaSerie.Value;
  if (rxLoteLotNum.IsNull) then
  begin
    rxLote.Close;
    rxLote.Open;
    rxLote.Insert;
    rxLoteLotNum.Value:= qryProductosLOTE_NUM.Value;
    rxLote.Post;
  end;  
  if rxVentaTipoUnidad.IsNull then
  if rxVenta.State in [dsEdit,dsInsert] then
  begin
    rxVentaTipoUnidad.Value:=1;
    GlbTipoUnidad := 1;
    CantUnidad:= 1;
  end; //aqui aqui aqui es verifica qrytipounidad
  if Not dmInventario.qryTipoUnidad.Locate('IDUNIDAD', rxVentaTipoUnidad.Value, []) then
  begin
    if (rxVentaTipoUnidad.Value = 0) then
    begin
      if dmInventario.qryTipoUnidad.Locate('DESCRIPCION', 'UNIDAD', []) then
      begin
        GlbTipoUnidad := dmInventario.qryTipoUnidadIDUNIDAD.Value;
        if rxVenta.State in [dsEdit,dsInsert] then
        rxVentaTipoUnidad.Value:= GlbTipoUnidad;
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
  if GlbUsaPUnidadStd = 1 then
  begin
    if isShowing then
    rxdblookupTipoUnidad.SetFocus
  end else
  //DBEdit1.SetFocus;
  edtCodigoExit(Self);
end;

procedure TfrmProcVentaRapida.ProcActTipoUnidad;
begin
  dmVentas.qryPrecioUnidadSurt.Close;
  dmVentas.qryPrecioUnidadSurt.Params[0].Value:=rxVentaCodArticulo.Value;
  dmVentas.qryPrecioUnidadSurt.Open;

  if Not rxVentaTipoUnidad.IsNull then
  if dmVentas.qryPrecioUnidadSurt.Locate('IDUNIDAD', rxVentaTipoUnidad.Value,[]) then
  CantUnidad:=dmVentas.qryPrecioUnidadSurtCANTIDAD.Value
  else
  begin
    rxVentaTipoUnidad.Value:=1;
    GlbTipoUnidad:=1;
    if dmVentas.qryPrecioUnidadSurt.Locate('IDUNIDAD', rxVentaTipoUnidad.Value,[]) then
    begin
      CantUnidad:=dmVentas.qryPrecioUnidadSurtCANTIDAD.Value;
      cboxTipoUnidad.Text := 'UNIDAD';
    end;
  end;

  if qryproductos.state = dsBrowse then
  if not rxVentaCodArticulo.IsNull then
  begin
    QryPrecios.Close;
    QryPrecios.Params[0].Value:=rxVentaCodArticulo.Value;
    QryPrecios.Open;
  end;

  if rxVentaTipoUnidad.IsNull then Exit;
  dmInventario.qryTipoUnidad.Close;
  dmInventario.qryTipoUnidad.Open;
  if Not dmInventario.qryTipoUnidad.Locate('IDUNIDAD', rxVentaTipoUnidad.Value, []) then
  begin
    GlbTipoUnidad := 1;//dmInventario.qryTipoUnidadIDUNIDAD.Value;
    CantUnidad    := 1;//dminventario.qryTipoUnidadCANTIDAD.Value;
    cboxTipoUnidad.Text := 'UNIDAD';dmInventario.qryTipoUnidadDESCRIPCION.Value;
  end else
  begin
    GlbTipoUnidad := dmInventario.qryTipoUnidadIDUNIDAD.Value;
    CantUnidad    := dminventario.qryTipoUnidadCANTIDAD.Value;
    cboxTipoUnidad.Text := dmInventario.qryTipoUnidadDESCRIPCION.Value;
  end;

  if (rxVenta.State = dsBrowse) then
  begin
    qryProdPorProveedor.Close;
    qryProdPorProveedor.Params[0].Value:= rxVentaCodArticulo.Value;
    qryProdPorProveedor.Params[1].Value:= glbcia_key;
    qryProdPorProveedor.Open;

    if GLBMuestraInfoProv = 1 then
    begin
      if qryProdPorProveedor.RecordCount > 0 then
      pnlPrecioProv.Visible:= True else
      pnlPrecioProv.Visible:= False;
    end;
  end;
end;

procedure TfrmProcVentaRapida.ConsultaGeneral1Click(Sender: TObject);
begin
  frmConsultaInventario:=TfrmConsultaInventario.Create(Nil);
  try
    if frmConsultaInventario.Showmodal = mrOk then
    begin
      edtCodigo.Text:= frmConsultaInventario.ibquery1codigo.AsString;
      edtCodigoExit(Self);
      DBEdit2Exit(Self);
      if isShowing then
      DBEdit1.SetFocus;
      PostMessage(DBEdit1.Handle, WM_SETFOCUS, 0, 0);
    end;
    panel2.Visible:=False;
  finally
  frmConsultaInventario.Free;
  frmConsultaInventario:=Nil;
  end;
  Panel2.Visible:=false;
  if isShowing then
  edtCodigo.SetFocus;
  PostMessage(edtCodigo.Handle, WM_SETFOCUS, 0, 0);

  edtCodigoExit(Self);
  DBEdit2Exit(Self);
  if isShowing then
  edtCodigo.SetFocus;
  PostMessage(edtCodigo.Handle, WM_SETFOCUS, 0, 0);
end;

procedure TfrmProcVentaRapida.BitBtn17Click(Sender: TObject);
var
  pflag : boolean;
begin
  if (Totalesmontorecibido.Value > 0) or (rxVenta.RecordCount > 0) then
  begin
    MessageDlg('Favor procesar o cancelar venta en progreso', mtInformation, [mbOK], 0);
    Exit;
  end;
  LlenandoDatos := True;
  if (totales.RecordCount > 0) then
  begin
    totales.Close;
    totales.Open;
    Edit1.Text:='';
    Totales.Close;
    Totales.Open;
    Totales.Insert;
    //TotalesMoneda.Value := IntToStr(GlbMonedaBase);
    if (GlbMonedaBase > 0) then
    TotalesMoneda.Value   := IntToStr(GlbMonedaBase)
    else
    TotalesMoneda.Value   := '1';

    TotalesSubTotal.Value := 0;
    TotalesSubTotalScreen.Value := 0;
    Totalesitbis.Value    := 0;
    Totalesmontodesc.Value:= 0;
    Totalestotalneto.Value:= 0;
    Totalesmontorecibido.Value:=0;
    Totalesdevolucion.Value   :=0;
    Totales.Post;
    lblProcDev.Visible := False;
  end;

  frmConsultaPreVenta:=TfrmConsultaPreVenta.Create(Nil);
  try
    if frmConsultaPreVenta.Showmodal = mrOk then
    begin
      if frmConsultaPreVenta.qryPreventaMaster.recordCount > 0 then
      begin
        frmConsultaPreVenta.NumTicketFFood:=frmConsultaPreVenta.qryPreventaMasterNUMERO.Value;
        pflag:=False;
        if dmCalculos.GlbNumPosExiste(frmConsultaPreVenta.NumTicketFFood) then
        begin
          //MessageDlg('Datos pre-venta ya fueron cargados, verifique.',mtinformation,[mbOk], 1);
          dmCalculos.qryDatosCotiPosExtra.Close;
          dmCalculos.qryDatosCotiPosExtra.params[0].Value:=frmConsultaPreVenta.NumTicketFFood;
          dmCalculos.qryDatosCotiPosExtra.params[1].Value:=0;
          dmCalculos.qryDatosCotiPosExtra.params[2].Value:=0;
          dmCalculos.qryDatosCotiPosExtra.Open;
          dmCalculos.qryPosExtraDet.Close;
          dmCalculos.qryPosExtraDet.params[0].Value := dmCalculos.qryDatosCotiPosExtraNumero.value;
          dmCalculos.qryPosExtraDet.Open;
          GlbNumVtaPOS := dmCalculos.qryPosExtraDetNumero.Value;

          tablaPropietario.Edit;
          tablaPropietarioCodigoPropietario.Value:= frmConsultaPreVenta.qryPreventaMasterCODIGO_CTE.Value;
          tablaPropietario.Post;
          edtObservacion.Text:=frmConsultaPreVenta.qryPreventaMasterNOMBRE_CLIENTE_GENERAL.Value;
          if not Assigned(frmPosExtraDet) then
          frmPosExtraDet:=TfrmPosExtraDet(Self);
          frmPosExtraDet.ProcPosExtraRecuperaVenta(frmConsultaPreVenta.NumTicketFFood);
          pflag:=true;
        end;
        if not pflag then
        begin
          AsignarSqlText('','','');
          qryInventario.Close;
          qryInventario.Params[0].Value:= GlbCia_Key;
          qryInventario.Open;

          esCargaDatosFFood:=frmConsultaPreVenta.esCargaDatosFFood;
          if frmConsultaPreVenta.NumTicketFFood > 0 then
          NumTicketFFood:=frmConsultaPreVenta.NumTicketFFood;

          rxVenta.Close;
          rxVenta.Open;
          tablaPropietario.EmptyTable;
          if frmConsultaPreVenta.qryPreventaDet.State = dsBrowse then
          frmConsultaPreVenta.qryPreventaDet.First;
          rxPreventa.Close;
          rxPreventa.Open;

          tablaPropietario.Edit;
          tablaPropietarioCodigoPropietario.Value:= frmConsultaPreVenta.qryPreventaMasterCODIGO_CTE.Value;
          tablaPropietario.Post;

          edtObservacion.Text:=frmConsultaPreVenta.qryPreventaMasterNOMBRE_CLIENTE_GENERAL.Value;
          frmConsultaPreVenta.qryproc_InsePrevVtaExtraDet.Close;
          frmConsultaPreVenta.qryproc_InsePrevVtaExtraDet.Params[0].Value:=
          frmConsultaPreVenta.qryPreventaMasterNUMERO.Value;
          frmConsultaPreVenta.qryproc_InsePrevVtaExtraDet.Params[1].Value:=
          ExtraerFecha(frmConsultaPreVenta.qryPreventaMasterFECHA.Value);
          frmConsultaPreVenta.qryproc_InsePrevVtaExtraDet.Params[2].Value:=VarUsuarioGlb;
          frmConsultaPreVenta.qryproc_InsePrevVtaExtraDet.Open;
          if Not frmConsultaPreVenta.qryproc_InsePrevVtaExtraDet.Transaction.InTransaction then
          frmConsultaPreVenta.qryproc_InsePrevVtaExtraDet.Transaction.StartTransaction;
          try
            frmConsultaPreVenta.qryproc_InsePrevVtaExtraDet.Transaction.CommitRetaining;
          except
          frmConsultaPreVenta.qryproc_InsePrevVtaExtraDet.Transaction.RollbackRetaining;
          end;
          if not assigned(frmPosExtraDet) then
          frmPosExtraDet:=TfrmPosExtraDet.Create(nil);
          try
            frmPosExtraDet.ticket_preventa:=  frmConsultaPreVenta.qryPreventaMasterNUMERO.Value;
            dmCalculos.esFeedbackExtra := False;
            dmCalculos.qryConsultaPosExtraDet.Tag := 0;
            GlbEntradoAvta := false;
            if dmCalculos.qryConsultaPosExtraDet.Tag <> 99 then
            frmPosExtraDet.ProcAbrirPorCodUsuario; //frmProcVentaRapida.rxVenta.RecordCount
            GlbNumVtaPOS:=frmPosExtraDet.ticket_preventa;
            frmPosExtraDet.ticket_preventa:=-1;
            dmCalculos.esFeedbackExtra := True;
          finally
          //frmPosExtraDet.free;
          //frmPosExtraDet:=nil
          end;
          //***************************************
          if dmCalculos.GlbNumPosExiste(frmConsultaPreVenta.NumTicketFFood) then
          begin
            //MessageDlg('Datos pre-venta ya fueron cargados, verifique.',mtinformation,[mbOk], 1);
            dmCalculos.qryDatosCotiPosExtra.Close;
            dmCalculos.qryDatosCotiPosExtra.params[0].Value:=frmConsultaPreVenta.NumTicketFFood;
            dmCalculos.qryDatosCotiPosExtra.params[1].Value:=0;
            dmCalculos.qryDatosCotiPosExtra.params[2].Value:=0;
            dmCalculos.qryDatosCotiPosExtra.Open;
            dmCalculos.qryPosExtraDet.Close;
            dmCalculos.qryPosExtraDet.params[0].Value := dmCalculos.qryDatosCotiPosExtraNumero.value;
            dmCalculos.qryPosExtraDet.Open;
            GlbNumVtaPOS := dmCalculos.qryPosExtraDetNumero.Value;

            tablaPropietario.Edit;
            tablaPropietarioCodigoPropietario.Value:= frmConsultaPreVenta.qryPreventaMasterCODIGO_CTE.Value;
            tablaPropietario.Post;
            edtObservacion.Text:=frmConsultaPreVenta.qryPreventaMasterNOMBRE_CLIENTE_GENERAL.Value;
            if not Assigned(frmPosExtraDet) then
            frmPosExtraDet:=TfrmPosExtraDet(Self);
            frmPosExtraDet.ProcPosExtraRecuperaVenta(frmConsultaPreVenta.NumTicketFFood);
            pflag:=true;
          end;
          //***************************************
        end;
      end;
      if pflag then
      begin
        While Not frmConsultaPreVenta.qryPreventaDet.Eof Do
        begin
          rxPreventa.Append;
          rxPreventaNumero.Value   := frmConsultaPreVenta.qryPreventaMasterNUMERO.Value;
          rxPreventaSerie.Value    := frmConsultaPreVenta.qryPreventaDetSerie.Value;
          rxPreventaticket_id.Value:= frmConsultaPreVenta.qryPreventaMasterNUMERO.Value;
          rxPreventalot_num.Value  := frmConsultaPreVenta.qryPreventaDetLOTE_NUM.Value;
          rxPreventa.Post;
          frmConsultaPreVenta.qryPreventaDet.Next;
        end;
        if esCargaDatosFFood then
        begin
          Totales.Edit;
          TotalesComentario.Value:='UTouchPos #' + frmConsultaPreVenta.qryPreventaMasterNumero.AsString;
          Totales.Post;
        end;
      end;
    end;
  finally
  frmConsultaPreVenta.Free;
  frmConsultaPreVenta:=Nil;
  end;
  LlenandoDatos := False;
  rxVenta.EnableControls;
  RxDBGrid1.EnableScroll;
  dmVentas.qryPrecioUnidadSurt.Close;
  dmVentas.qryPrecioUnidadSurt.Params[0].Value:=rxVentaCodArticulo.Value;
  dmVentas.qryPrecioUnidadSurt.Open;

  ProcActTipoUnidad;
  BitBtn27Click(Self);
  Refresh;
end;

procedure TfrmProcVentaRapida.CargarPreventa;
begin
  if qryProductos.State = dsInactive then
  qryProductos.Open;
  rxVentaSerie.Value := frmConsultaPreVenta.qryPreventaDetSerie.Value;
  rxVentaFecha.Value := ExtraerFecha(GlbFechaTrnDiaria);
  rxVentaCant.Value  := frmConsultaPreVenta.qryPreventaDetCANTIDAD.Value;
  rxVentaPrecio.Value:= frmConsultaPreVenta.qryPreventaDetPRECIO.Value;
  rxVentaItbi.Value  := frmConsultaPreVenta.qryPreventaDetITBI_DET.Value;
  rxVentaTipoUnidad.Value := frmConsultaPreVenta.qryPreventaDetTIPO_UNIDAD.Value;

  rxVentaporc_desc.Value   := frmConsultaPreVenta.qryPreventaDetPORC_DESC_DET.Value;
  rxVentaDescripcion.Value := frmConsultaPreVenta.qryPreventaDetDESCRIPCION.Value;

  if qryProductos.Locate('CODIGO',frmConsultaPreVenta.qryPreventaDetCODIGO_PROD.Value,[]) then
  begin
    _UsarLevelPrecio:= qryProductosUSARLEVELPRECIO.Value;
    rxVentaCodTexto.Value   := qryProductosCODIGO_TEXTO.Value;
    rxVentaMonedaBase.Value := GetMonedaProducto(qryProductosCODIGO.AsInteger);
    rxVentaDescripcionEspecial.Value := qryProductosDESCRIPCIONADICIONAL.Value;
    rxVentaCostoProducto.Value       := qryProductosPRECIO_COMPRA.Value;
  end;
  rxVentaReferencia.Value := qryProductosREFERENCIA.Value;
  rxVentaInvetariar.Value:= qryProductosINVENTARIAR.Value;
  rxVentaCodArticulo.Value:= frmConsultaPreVenta.qryPreventaDetCODIGO_PROD.AsInteger;
  FGlbPorcItbi(ExtraerFecha(rxVentaFecha.Value), rxVentaCodArticulo.Value);
  if (GlbIgI = 1) and (GlbCalcItbis = 0) then
  rxVentaIDTasaITBIS.Value := 1
  else
  rxVentaIDTasaITBIS.Value := GlbIDTasa;

  //rxVentaRutaImagen.Value := BuscarRutaImagen(frmConsultaPreVenta.qryPreventaDetCODIGO_PROD.AsInteger);
  rxVentaMonedaBase.Value := GetMonedaProducto(qryProductosCODIGO.AsInteger);
  rxVentamonto_tasa.Value := GlbMontoTasa(rxVentaMonedaBase.Value);
  rxVentaCodUsuario.Value := frmConsultaPreVenta.qryPreventaMasterCODIGO_VENDEDOR.Value;
  rxVentaloteNum.Value  := frmConsultaPreVenta.qryPreventaDetLOTE_NUM.Value;

   rxPreventa.Append;
   rxPreventaNumero.Value   := frmConsultaPreVenta.qryPreventaMasterNUMERO.Value;
   rxPreventaSerie.Value    := frmConsultaPreVenta.qryPreventaDetSerie.Value;
   rxPreventaticket_id.Value:= frmConsultaPreVenta.qryPreventaMasterNUMERO.Value;
   rxPreventalot_num.Value  := frmConsultaPreVenta.qryPreventaDetLOTE_NUM.Value;

   rxPreventa.Post;
   //frmConsultaPreVenta.qryPreventaDet.Next;

  DBEdit1Exit(Self);

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
  if not ibsqlDeletePreventaMaster.Transaction.InTransaction then
  ibsqlDeletePreventaMaster.Transaction.StartTransaction;
  try
  ibsqlDeletePreventaMaster.Transaction.CommitRetaining;
  except
  ibsqlDeletePreventaMaster.Transaction.RollbackRetaining;
  end;
  
  if not ibsqlDeletePreventaDet.Transaction.InTransaction then
  ibsqlDeletePreventaDet.Transaction.StartTransaction;
  try
  ibsqlDeletePreventaDet.Transaction.CommitRetaining;
  except
  ibsqlDeletePreventaDet.Transaction.RollbackRetaining;
  end;
end;

procedure TfrmProcVentaRapida.InsertaTransCafeteria(numTrn : Integer;codigoP:Integer;cantP:Real);
begin



end;

procedure TfrmProcVentaRapida.ProcInsertarRecoverData;
begin

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
    //WriteToLog('Recover data rxVenta - Line 6390');
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
    rxVentaMoneda.Value  := '1';
    rxVentaMonedaBase.Value  := GetMonedaProducto(tblRecovertransCODIGO_PROD.AsInteger);
    //tblRecovertransTIPO_VENTA.Value:=
    rxVentaDescripcionEspecial.Value := tblRecovertransDESCRIPCIONPRODUCTO.Value;
    if tblRecovertransTIPO_OPE.Value = 0 then
    RxSpinEdit1.AsInteger := tblRecovertransPRECIO_LEVEL.Value;
    rxVenta.Post;
    //WriteToLog('Post rxVenta - Line 6420');
    tblRecovertrans.Next;
  end;
end;

procedure TfrmProcVentaRapida.ActualizarRecoverData;
begin

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
  dmCalculos.esFeedback:=False;
  GlbCalculado:=False;
  esEditando:=True;

  dmCalculos.esFeedback:=False;
  GlbCalculado:=False;

  GlbAlreadyCld := False;
  CalcYaEjecutado:=False;
  procCalc := True;
  esEditando := True;

  if rxVenta.State = dsBrowse then
  rxVenta.Edit;
  if rxVentaCodArticulo.IsNull then Exit;
  if (GLBPrecioMayUnidad = 1) then
  begin
    SetPrecioPorCantidadMay;
  end else
  SetPrecioPorCantidad;

  if rxVenta.state = dsbrowse then
  rxVenta.Edit;

end;


procedure TfrmProcVentaRapida.TotalesCalcFields(DataSet: TDataSet);
begin
  try
  TotalesMontoSubTotalIndirectos.Value  :=
  TotalesMontoDescGastosAdmin.Value  +
  TotalesMontoDescItbisGastosAdmin.Value +
  TotalesMontoDescTransp.Value   +
  TotalesMontoDescDirtecnica.Value +
  TotalesMontoDescItbisDirTecnica.Value +
  TotalesMontoDescImprevisto.Value      +
  TotalesMontoDescItbisImprevisto.Value;

  TotalesDiferencia.Value:=
  Totalestotalneto.Value -
  (TotalesMontoEnEfectivo.Value +
  TotalesMontoEnTarjeta.Value +
  TotalesMontoEnCheque.Value +
  TotalesMontoEnBonos.Value +
  TotalesMontoNCRAplicado.Value
  );
  except
  end;
end;

procedure TfrmProcVentaRapida.CheckBox2Exit(Sender: TObject);
begin
  if rxVenta.RecordCount = 0 then exit;
  if (rxVenta.State = dsBrowse) then
  rxVenta.Edit;
end;

procedure TfrmProcVentaRapida.CheckBox3Exit(Sender: TObject);
begin
  if rxVenta.RecordCount = 0 then exit;
  rxVenta.Edit;
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

procedure TfrmProcVentaRapida.CargarDatosAModificar;
var
  xDesc : String;
  x: integer;
begin

end;

procedure TfrmProcVentaRapida.ActualizaVentaDet;
begin

  //Application.ProcessMessages;
end;

procedure TfrmProcVentaRapida.ActualizaVentaMaster(fpago : String;serieNcfAsignado :integer);
begin

  //Application.ProcessMessages;
end;

procedure TfrmProcVentaRapida.ActualizaFactura;
begin

end;

procedure TfrmProcVentaRapida.ActualizaTransCxc;
begin

end;

procedure TfrmProcVentaRapida.ActualizaBalanceCteCxc;
begin

end;

procedure TfrmProcVentaRapida.ActualizaFactPendiente;
begin


end;

procedure TfrmProcVentaRapida.ImpFacturaservicio(numerotrn: Integer;
  EsReimpresion: Boolean);
begin

end;

procedure TfrmProcVentaRapida.Label37Click(Sender: TObject);
var
  numFcta :Integer;
begin

end;

procedure TfrmProcVentaRapida.BitBtn6MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if Label36.Visible then
  begin
    EsModificandoFactura:=True;
    if not EsModificandoCotiza then
    begin
      //bitBtnEditarFact.Visible:=True;
      //bitBtnEditarFact.Top := BitBtn6.Top;
      //bitBtnEditarFact.Left:= BitBtn6.Left;
      //bitBtnEditarFact.BringToFront;
    end;
  end;
end;

procedure TfrmProcVentaRapida.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if (rxVentaStatus.Value = 'C') then
  Background := clGray
  else
  if (rxVentaStatus.Value = 'I') then
  Background := clGreen
  else
  if rxVentaCantExcedeInv.Value = 1 then
  BackGround := $000080FF;
end;

procedure TfrmProcVentaRapida.BitBtn21Click(Sender: TObject);
var
   LN : smallint;
begin
  totales.Edit;
  if isShowing then
  DBEdit7.SetFocus;
  DBStatusLabel1.Visible:=True;

  //no inserta nada si esta en blanco
  if Length(TotalesComentario.Value) = 0 then exit;

  if dmventas.tblLineaComentario.state = dsInactive then
  begin
    dmventas.tblLineaComentario.Open;
    dmventas.tblLineaComentario.Params[0].Value:=GlbNumVtaPOS;
  end else
  begin
    if dmventas.tblLineaComentario.Params[0].Value <> GlbNumVtaPOS then
    begin
      dmventas.tblLineaComentario.Close;
      dmventas.tblLineaComentario.Params[0].Value:=GlbNumVtaPOS;
      dmventas.tblLineaComentario.Open;
    end;
  end;
  if dmventas.tblLineaComentario.RecordCount >= 40 then
  begin
    MessageDlg('Solo se aceptan 40 lineas de comentario',mtError,[mbok],0);
    exit;
  end;
  if dmventas.tblLineaComentario.RecordCount > 0 then
  begin
    dmventas.tblLineaComentario.Last;
    LN := dmventas.tblLineaComentarioNUMLIN.Value + 1;
  end else
  LN:=1;
  dmventas.tblLineaComentario.Append;

  dmventas.tblLineaComentarioNUMLIN.Value    := LN;
  dmventas.tblLineaComentariotipo_ope.Value  := 1;//en cotiacion será cambiado a 2
  dmventas.tblLineaComentarioLINEA.Value     := TotalesComentario.Value;
  dmventas.tblLineaComentarioNUMERO_TRN.Value:= GlbNumVtaPOS;
  GlbSalvarQuery(dmventas.tblLineaComentario);
end;

procedure TfrmProcVentaRapida.DBEdit7Exit(Sender: TObject);
begin
  if totales.State in [dsEdit, dsInsert] then
  totales.Post;
  DBStatusLabel1.Visible:=False;
end;

procedure TfrmProcVentaRapida.RxDBGrid1Enter(Sender: TObject);
begin
  GlbNumero:= rxVentaSerie.Value;
  rxVenta.EnableControls;
  RxDBGrid1.EnableScroll;
end;

procedure TfrmProcVentaRapida.RxDBGrid1Exit(Sender: TObject);
begin
  GlbNumero:= rxVentaSerie.Value;
end;



procedure TfrmProcVentaRapida.CrearNCreditoEnDevolucion;
begin

end;

procedure TfrmProcVentaRapida.ActualizaCotizacionMaster;
begin


end;

procedure TfrmProcVentaRapida.InsertarCotizacionDetUpd(numero,
  serie: Integer);
begin

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


end;

procedure TfrmProcVentaRapida.ReImprimeDevolucion1Click(Sender: TObject);
var
  flag, _xflag : Boolean;

begin

end;

procedure TfrmProcVentaRapida.BitBtn4Exit(Sender: TObject);
begin
  Refresh;
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
  if not esEditando then exit;
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

    if rxVenta.State In [dsInsert, dsEdit] Then
    begin
       rxVenta.Post;
       //WriteToLog('Post rxVenta - Line 8075');
    end;
    CalcularMontoBrutoXMoneda;
  end;
end;

procedure TfrmProcVentaRapida.RxDBLookupCombo2Change(Sender: TObject);
begin
  //glbMoneda:= TotalesMoneda.AsInteger;
  esEditando:= true;
  if rxVentaCodArticulo.IsNull then exit;
  GlbCalculado:=False;
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
  if rxVentaCodArticulo.IsNull then exit;
  if not esEditando then exit;
  GlbMoneda:= TotalesMoneda.AsInteger;

  if Totales.State in [dsInsert, dsEdit] then
  Totales.Post;
  if Totales.State = dsBrowse then
  Totales.Edit;
  dmCalculos.EsProcCalc:=True;rxVenta.RecordCount;
  frmLogError.Marca:=11; frmLogError.CurrenLN:=14230; frmLogError.LogSteps(GlbNumVtaPOS,rxVentaSerie.Value,now,now,'Antes dmCalculos.ProcesaCalculos;','UProcVentaRapida');
  dmCalculos.ProcesaCalculos;
  frmLogError.Marca:=22; frmLogError.CurrenLN:=14230; frmLogError.LogSteps(GlbNumVtaPOS,rxVentaSerie.Value,now,now,'Despues dmCalculos.ProcesaCalculos;','UProcVentaRapida');

  dmCalculos.EsProcCalc:=False;
  if esEditando then
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

function TfrmProcVentaRapida.ValidarDobleRegPago:boolean;
begin
end;
procedure TfrmProcVentaRapida.ProcInsertarDetPagos(numtrn : integer);
begin


end;

procedure TfrmProcVentaRapida.ProcInsertarDetBono(numtrn: integer);
begin


end;

procedure TfrmProcVentaRapida.ProcInsertarDetCheque(numtrn: integer);
begin
 

end;

procedure TfrmProcVentaRapida.Poliza1Click(Sender: TObject);
begin
  MessageDlg('Ventana Inactiva temporalmente.', mtinformation,[mbok],0);
  {frmPolizas:=TfrmPolizas.Create(Nil);
  try
    frmPolizas.Showmodal;
  finally
  frmPolizas.Free;
  frmPolizas:=Nil;
  end;}
end;


procedure TfrmProcVentaRapida.DescargaNotaCredito;
var
  resto : Currency;
begin

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
  end;
end;

procedure TfrmProcVentaRapida.SetMontoNotaCredito;
begin

end;

procedure TfrmProcVentaRapida.BitBtn26Click(Sender: TObject);
begin
  if (rxVenta.RecordCount > 0) and (rxVenta.State = dsbrowse) then
  begin
    rxVenta.Edit;
    if showing then
    if cboxTipoUnidad.Visible then
      if cboxTipoUnidad.Enabled then
      if isShowing then
    cboxTipoUnidad.SetFocus;
  end;
end;

procedure TfrmProcVentaRapida.rxVentaBeforeInsert(DataSet: TDataSet);
begin
  if rxVenta.State in [dsInsert] then
  if VerificaVentaExisteRX(rxVentaSerie.Value) then
  Exit;

  if rxVenta.State in [dsedit, dsInsert] then
  rxVenta.Post;
  if EsModificandoFactura then exit;
  //if rxVentaSerie.IsNull then
  //rxVenta.Cancel;
  procCalc:=True;
end;

procedure TfrmProcVentaRapida.SetPrecioPorCantidad;
begin
  if rxVenta.State = dsBrowse then
  rxVenta.Edit;
  dmVentas.qryPrecioUnidadSurt.Close;
  dmVentas.qryPrecioUnidadSurt.Params[0].Value:=rxVentaCodArticulo.Value;
  dmVentas.qryPrecioUnidadSurt.Open;
  
  if GlbUsaPUnidadLevel = 1 then
  begin
    dmVentas.qryPrecioUnidadSurt.Close;
    dmVentas.qryPrecioUnidadSurt.Params[0].Value:=rxVentaCodArticulo.Value;
    dmVentas.qryPrecioUnidadSurt.Open;
    if dmVentas.qryPrecioUnidadSurt.Locate('COD_PRODUCTO;IDUNIDAD',
    VarArrayOf([rxVentaCodArticulo.Value,GlbTipoUnidad]),[]) then
    begin
      cboxTipoUnidad.Text:=dmVentas.qryPrecioUnidadSurtDESCRIPCION.Value;
      case RxSpinEdit1.AsInteger Of
      1: begin
           if dmVentas.qryPrecioUnidadSurtPRECIOVENTA1.Value > 0 then
           rxVentaPrecio.Value := dmVentas.qryPrecioUnidadSurtPRECIOVENTA1.Value;
         end;
      2: begin
          if dmVentas.qryPrecioUnidadSurtPRECIOVENTA2.Value > 0 then
          rxVentaPrecio.Value := dmVentas.qryPrecioUnidadSurtPRECIOVENTA2.Value;
         end;
      3:begin
          if dmVentas.qryPrecioUnidadSurtPRECIOVENTA3.Value > 0 then
          rxVentaPrecio.Value := dmVentas.qryPrecioUnidadSurtPRECIOVENTA3.Value;
        end;
      4: begin
           if dmVentas.qryPrecioUnidadSurtPRECIOVENTA4.Value > 0 then
           rxVentaPrecio.Value := dmVentas.qryPrecioUnidadSurtPRECIOVENTA4.Value;
        end;
      end;//case
    end;
  end else
  begin
  //p1 p3 p3 p4
  QryPrecios.Close;
  QryPrecios.Params[0].Value:=rxVentaCodArticulo.Value;
  QryPrecios.Open;
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
  if (rxVentaPrecio.Value = 0) then
  begin
    MessageDlg('Precio por niveles no esta configurado verifique.',mterror,[mbok],0);
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

procedure TfrmProcVentaRapida.PrepararInfoFiscal(numerotrn: integer);
begin

end;

procedure TfrmProcVentaRapida.VerificaImpresoraFiscalM;
var
  archivo : String;
  tHoras : integer;
begin

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

procedure TfrmProcVentaRapida.CirreZ1Click(Sender: TObject);
var
  buttonSelected : Integer;
begin
end;

procedure TfrmProcVentaRapida.CierreX1Click(Sender: TObject);
var
  cmd : String;
begin
end;

procedure TfrmProcVentaRapida.ProcesaEstadoImpresora(xNumeroTrn:Integer);
begin

end;

procedure TfrmProcVentaRapida.DBEdit10Exit(Sender: TObject);
begin
  if (rxVenta.RecordCount > 0) and (rxVenta.State = dsBrowse) then
  rxVenta.Edit;
  GlbAlreadyCld := True;
  //Diciembre 11 del 2017
  //probemas con calculot monto itbis recargo
  //temporal juan ramon divison chkExento.Checked := True;
  chkExentoExit(Self);
  chkExento.Checked := False;
  if not GlbUsandoCotiza then
  begin
    RxDBLookupCombo3Exit(self);
    if not CalcYaEjecutado then
    BitBtn27Click(Self);
  end;
  Refresh;
end;

procedure TfrmProcVentaRapida.RxDBLookupCombo3Exit(Sender: TObject);
var
  xpos : integer;
begin
  //chkExentoExit(Self);   1,4,5,
  //lblRNC.Captioni
  CheckBox4.Checked := False;
  if rxVentaSerie.IsNull then Exit;
 if (TotalesTipoNCFIFiscal.Value In [1,4,5]) And
  (tablaPropietarioCodigoPropietario.IsNull or (tablaPropietarioCodigoPropietario.Value = 0)) then
  begin
    ProcEntradaCliente;
  end ELSE
  IF (lblRNC.Caption = 'Cte no tiene RNC/Cédula') THEN
  if (TotalesTipoNCFIFiscal.Value In [1,4,5]) then
  ProcEntradaCliente;

  if Totales.State = dsBrowse Then Totales.Edit;
  if Totales.State In [dsEdit, dsInsert] Then
  begin
    if (TotalesTipoNCF.IsNull) And (Not TotalesTipoNCFIFiscal.IsNull) then
    TotalesTipoNCF.Value := dmFactura.ibQryViewNCFTIPO_CF.Value
    else
    if (TotalesTipoNCF.Value <> dmFactura.ibQryViewNCFTIPO_CF.Value) then
    TotalesTipoNCF.Value := dmFactura.ibQryViewNCFTIPO_CF.Value;

     TotalesMontoExoneraITBIS.Value:= 0;  //Factura.ibQryViewNCFTIPO_NCF_IFISCAL.Value
      //antes
     //if Not dmFactura.ibQryViewNCF.Locate('TIPO_CF;tipo_ncf_ifiscal',
     if Not dmFactura.ibQryViewNCF.Locate('TIPO_CF',
     VarArrayOf([TotalesTipoNCF.Value]), []) then
     begin
       TotalesTipoNCF.AsVariant := null;
       TotalesTipoNCFIFiscal.AsVariant := null;;
     end;

     label29.Caption := 'Sub-Total Indirecto';
    //TotalesTipoNCFIFiscal.Value := dmFactura.ibQryViewNCFTIPO_NCF_IFISCAL.AsInteger;

  end;
  ProcItbisExonerado;
  {
  if (TotalesTipoNCFIFiscal.Value In [1,4,5]) And
  (tablaPropietarioCodigoPropietario.IsNull or (tablaPropietarioCodigoPropietario.Value = 0)) then
  begin
    ProcEntradaCliente;
  end;}
  BitBtn27Click(Self);
  //RxDBLookupCombo3Change(Self);
  //DBEdit10Exit(Self);
  //BitBtn27Click(Self);
  Refresh;
end;


procedure TfrmProcVentaRapida.PrepararInfoFiscalNCR(numerotrn: integer);
begin
  dmReportes.qryDatosRepTranscxcIFiscal.Close;
  dmReportes.qryDatosRepTranscxcIFiscal.Params[0].Value := numerotrn;
  dmReportes.qryDatosRepTranscxcIFiscal.Open;
  dmReportes.qryDatosRepTranscxcIFiscal.Last;
  dmReportes.qryDatosRepTranscxcIFiscal.RecordCount;

  if (GlbModeloImpresora = GLBIFISCALOKI407FP) then
  begin
    dmReportes.qryDatosReimpDocFiscalOKI.Close;
    dmReportes.qryDatosReimpDocFiscalOKI.Params[0].Value :=numerotrn;
    dmReportes.qryDatosReimpDocFiscalOKI.Open;
  end;

  dmreportes.qryDatosReimpDocFiscal.Close;
  dmreportes.qryDatosReimpDocFiscal.Params[0].Value:= numerotrn;
  dmreportes.qryDatosReimpDocFiscal.open;

  if (GlbModeloImpresora = GLBIFISCALOKI407FP) then
  begin

  end;
end;

procedure TfrmProcVentaRapida.chKDescuentoGlobalClick(Sender: TObject);
var
  guardarRec : TBookMark;
begin
  procCalc := True;
  GlbCalculado:=False;
  if entraDessGlb and LlenandoDatos then exit;//probando velocidad;

  if TotalesPorcDesAdicional.IsNull then
  begin
    ProvVerDatosDescGlb;  
    exit;
  end;

  DBEdit10Exit(Self);
  ProvVerDatosDescGlb;
  Refresh;
end;

procedure TfrmProcVentaRapida.DBEdit11Change(Sender: TObject);
begin
  GlbCalculado:=False;
  procCalc := True;
  if frmProcVentaRapida.Totales.Tag = 601 then
  begin
  frmProcVentaRapida.Totales.edit;
  exit;//estoy editando
  end;
  ProvVerDatosDescGlb;
  if LlenandoDatos then exit;
  GlbAlreadyCld := False;
  BitBtn10Click(Self);
end;

procedure TfrmProcVentaRapida.ImprimeFiscalContado(xNumeroTrn:Integer);
var
  xexiste:boolean;
begin
 
end;

procedure TfrmProcVentaRapida.FormClick(Sender: TObject);
begin
  //frmProcVentaRapida.Width :=969;
  //frmProcVentaRapida.Height:=731;
  refresh;
end;

procedure TfrmProcVentaRapida.DBEdit11Exit(Sender: TObject);
var
  guardarRec : TBookMark;
  porcdes : Extended;
  diff : Currency;
  cambioValido : Boolean;
begin
  if frmProcVentaRapida.Totales.tag = 601 then exit;
  if (rxVentaSerie.Value > 0) then
  if (TotalesPorcDesAdicional.Value > 0) then
  dmCalculos.ProcSetPorcDescValor(GlbNumVtaPOS);

  if (TotalesPorcDesAdicional.Value = 0) then
  chKDescuentoGlobal.Checked:=False;

  if rxVentaCodTexto.Value = '' then Exit;
  
  if entraDessGlb and LlenandoDatos then
  LlenandoDatos:=False;

  entraDessGlb:=False;

  GlbAlreadyCld := False;
  rxVenta.Edit;
  //DBEdit2Exit(Self);

  BitBtn27Click(Self);

  dmCalculos.EsProcCalc:=True;
  //t frmLogError.Marca:=11; frmLogError.CurrenLN:=15394; frmLogError.LogSteps(GlbNumVtaPOS,rxVentaSerie.Value,now,now,'Antes dmCalculos.ProcesaCalculos;','UProcVentaRapida');
  dmCalculos.ProcesaCalculos;
  //t frmLogError.Marca:=22; frmLogError.CurrenLN:=15394; frmLogError.LogSteps(GlbNumVtaPOS,rxVentaSerie.Value,now,now,'Despues dmCalculos.ProcesaCalculos;','UProcVentaRapida');

  dmCalculos.EsProcCalc:=False;

  if isShowing then
  if not edtCodigo.Focused then
    if not EsModificandoCotiza then
    begin
      edtCodigo.SetFocus;
      PostMessage(edtCodigo.Handle, WM_SETFOCUS, 0, 0);
    end;
  rxVenta.EnableControls;
  RxDBGrid1.EnableScroll;
  ProvVerDatosDescGlb;
end;

procedure TfrmProcVentaRapida.DBEdit10Enter(Sender: TObject);
begin
  if TotalesTipoNCFIFiscal.IsNull then
  begin
    MessageDlg('Favor indicar tipo comprobante fiscal.',mtInformation,[mbok], 0);
    if isShowing then
    RxDBLookupCombo3.SetFocus;
    Exit;
  end;
end;

procedure TfrmProcVentaRapida.rxVentaBeforeEdit(DataSet: TDataSet);
begin
  if not GlbUsandoCotiza then
  ProcItbisExonerado;
  procCalc:=True;
  esEditando:= true;
  dmCalculos.avoidLoopExtra:=False;
end;

procedure TfrmProcVentaRapida.ReactivarValores;
begin
  rxVenta.EmptyTable;
  Edit1.Text      := '';
  DescFactRecurrente:='';

  edtCodigo.Text  := '';
  BitBtn4.Enabled := False;
  Totales.EmptyTable;
  //CheckBox1.Checked := False;
  EsDevolucion      := False;
  GlbDescNCF        := '';
  if not edtCodigo.Focused then
  if not EsModificandoCotiza then
  begin
    if isShowing then
    begin
      edtCodigo.SetFocus;
      PostMessage(edtCodigo.Handle, WM_SETFOCUS, 0, 0);
    end;
  end;
  //NoGenerarNCF1Click(Self);
  EsFactura := False;
  //tablaPropietario.Edit;
  tablaPropietario.EmptyTable;
  //tablaPropietarioCodigoPropietario.AsVariant := null;
  //tablaPropietario.Post;
  ActualizarPreventa;
  qryProdPorProveedor.Close;
  pnlPrecioProv.Visible:=False;
  BitBtn6.Enabled:=True;
  EsModificandoFactura:= False;
  EsModificandoCotiza := False;
  qryInventario.Close;
  qryInventario.Open;
  qryProductos.Close;
  qryProductos.Open;
  lblFechaCotizacion.Visible:= False;
  dbFechaCotizacion.Visible := False;
  Label36.Visible:=False;
  label36.Caption:='';
  if not GLBEsFastFood then
  begin
    label29.Top:= 413;
    dbTextMontoExoneraITBIS.Top := 410;
  end;
   label41.Visible := False;
  DBText15.Visible:= True;
  _NumeroCotiza:=-1;
  glbcodVendedor := -1;
  GlbNumeroTrn:=-1;
  GlbUsandoCotiza := False;
  //Delay(3000);
  RxDBLookupCombo1Change(Self);
  Refresh;
  //Application.ProcessMessages;
end;

procedure TfrmProcVentaRapida.DBEdit11Enter(Sender: TObject);
begin
  LlenandoDatos:=True;
  entraDessGlb := True;
  if not chKDescuentoGlobal.Checked then
  chKDescuentoGlobal.Checked:= True; 
end;

procedure TfrmProcVentaRapida.Label5Click(Sender: TObject);
begin
  {frmVerCalcVenta :=TfrmVerCalcVenta.Create(Nil);
  try
    frmVerCalcVenta.ShowModal;
  finally
  frmVerCalcVenta.free;
  frmVerCalcVenta:= Nil;
  end;  }
  Refresh;
end;

procedure TfrmProcVentaRapida.BitBtn27Click(Sender: TObject);
begin
  //GlbCalculado:=False;
  if (rxVentaCant.Value = 0) and (rxVentaPrecio.Value = 0) and (rxVentaMontoBruto.Value = 0) then
  //if (totalestotalneto.Value > 0) then
  Exit;
  if chkNoLeyPropina.Checked then
  dmCalculos.CalcPropinaLegal := False
  else
  dmCalculos.CalcPropinaLegal:=True;

  if EsEditando  and dmCalculos.DatCambio then
  dmCalculos.Pos_UpdateTotales(GlbNumVtaPOS);
  esEditando:=False;
  
  if dmCalculos.qryConsultaPosExtraDet.Tag = 0 then
  begin
    if rxVenta.State in [dsEdit, dsInsert] then
    begin
      rxVenta.Tag:=27;
      rxVenta.Post;
    end;
    if RxDBLookupCombo3.Tag = 0 then
    begin
      ProcItbisExonerado;
      RxDBLookupCombo3.Tag := 77;
    end;
    if not GlbUsandoCotiza then
    begin
      //frmLogError.CurrenLN:= 15535;
      //frmLogError.LogSteps(GlbNumVtaPOS,rxVentaSerie.Value,now,now,
      //'Antes dmCalculos.Pos_UpdateTotales(GlbNumVtaPOS);',
      //'UProcVentaRapida');
      if Totalestotalneto.Value = 0 then Glbcalculado:=False;
      if not GlbCalculado then
      dmCalculos.Pos_UpdateTotales(GlbNumVtaPOS);
      //frmLogError.CurrenLN:=15541;
      //frmLogError.LogSteps(GlbNumVtaPOS,rxVentaSerie.Value,now,now,
      //'Despues dmCalculos.Pos_UpdateTotales(GlbNumVtaPOS);',
      //'UProcVentaRapida');
    end;
    CalcYaEjecutado:=True;
    procCalc := False;
  end else
  if PrecioCambio then
  begin
    //frmLogError.CurrenLN:=15551;
    //frmLogError.LogSteps(GlbNumVtaPOS,rxVentaSerie.Value,now,now,
    //'Antes dmCalculos.Pos_UpdateTotales(GlbNumVtaPOS);',
    //'UProcVentaRapida');
    if not GlbCalculado then
    dmCalculos.Pos_UpdateTotales(GlbNumVtaPOS);
    esEditando:=False;
    //frmLogError.LogSteps(GlbNumVtaPOS,rxVentaSerie.Value,now,now,
    //'Despues dmCalculos.Pos_UpdateTotales(GlbNumVtaPOS);',
    //'UProcVentaRapida');
    CalcYaEjecutado:=True;
  end;
end;

procedure TfrmProcVentaRapida.CancelarTicket1Click(Sender: TObject);
var
  archivo : String;
begin
 
end;

procedure TfrmProcVentaRapida.ProcEntradaCliente;
begin
  frmClientes:=TfrmClientes.Create(Nil);
  try
    dmUsuarios.qryRoles.Close;
    dmUsuarios.qryRoles.Params[0].Value:= VarUsuarioGlb;
    dmUsuarios.qryRoles.Open;
    dmUsuarios.qryRoles.First;
    //While Not dmUsuarios.qryRoles.Eof Do
    //begin
    //  ActivaPermiso(TForm(frmClientes),1000, dmUsuarios.qryRolesID_ROL.Value, 0);//menu principal: 1000 debe estar en la tabla PROCESOS
    //  dmUsuarios.qryRoles.Next;
    //end;
    //frmClientes.rncRequerido:=True;
    frmClientes.btnInsertarClick(Self);
    frmClientes.PageControl1.ActivePageIndex:=0;
    frmClientes.Showmodal;
    //frmClientes.rncRequerido:=false;
    qryCliente.Close;
    qryCliente.Open;
    //frmClientes.rncRequerido:=False;
    qryCliente.Locate('CODIGO_CTE',dmClientes.tblClientesCODIGO_CTE.Value,[]);
    tablaPropietario.Edit;
    tablaPropietarioCodigoPropietario.AsVariant := dmClientes.tblClientesCODIGO_CTE.Value;

    tablaPropietario.Post;

    qryCliente.Close;
    qryCliente.Open;
    if tablaPropietario.State = dsInactive then tablaPropietario.Open;
    xCodigoCte:= dmClientes.tblClientesCODIGO_CTE.Value;

    {if (Assigned(frmEdicionVenta)) then
    begin
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
    end;}
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
  finally
  frmClientes.Free;
  frmClientes:=Nil;
  end;
end;

procedure TfrmProcVentaRapida.ImprimeDocumento(serieDoc:integer);
var
   tRecordsDet : Integer;
   flag : boolean;
begin

end;

procedure TfrmProcVentaRapida.ProcActualizaMsg;
var
  sqlQuery : TIBQuery;
begin
  sqlQuery:=TIBQuery.Create(Nil);
  sqlQuery.Database:= dmconectar.IBDatabase1;
  sqlQuery.Sql.Clear;
  sqlQuery.Sql.Text :='Select numero_Trn numerotrn, NIF '+
  ' From NIF_CTRL '+
  ' Where numero_trn = (Select max(numero_trn) from NIF_CTRL)';
  sqlQuery.Prepare;
  sqlQuery.Open;

  StatusBar.Panels[3].Text:='Ult Trn : ';
  StatusBar.Panels[4].Text:='Ult. NIF : ';
  _ulttrnImp:='';
  if (sqlQuery.RecordCount > 0) then
  begin
    sqlQuery.First;
    StatusBar.Panels[3].Text:='Ult Trn : ' + sqlQuery.fieldbyname('numerotrn').AsString;
    _ulttrnImp := sqlQuery.fieldbyname('numerotrn').AsString;
    StatusBar.Panels[4].Text:='Ult. NIF : ' + sqlQuery.fieldbyname('NIF').AsString;
  end;
  sqlQuery.Close;
  sqlQuery.Free;
  sqlQuery:=Nil;  
end;

procedure TfrmProcVentaRapida.ProcGetUltNcf(tipo: string);
var
  sqlQuery : TIBQuery;
begin
  sqlQuery:=TIBQuery.Create(Nil);
  sqlQuery.Database:= dmconectar.IBDatabase1;
  sqlQuery.Sql.Clear;
  sqlQuery.Sql.Text :='Select Max(numero_ncf) ncf '+
                      'From NCF_ASIGNADOS Where tipo_ncf =:tipo';
  sqlQuery.Prepare;
  sqlQuery.Params[0].ParamType := ptInput;
  sqlQuery.Params[0].AsString  := trim(tipo);
  sqlQuery.Open;
  if (sqlQuery.RecordCount > 0) then
  begin
    sqlQuery.First;
    StatusBar.Panels[2].Text:='Ult NCF : ' + sqlQuery.fieldbyname('ncf').AsString;
  end else
  StatusBar.Panels[2].Text:='Ult NCF : ';
  sqlQuery.Close;
  sqlQuery.Free;
  sqlQuery:=Nil;
end;

procedure TfrmProcVentaRapida.RxDBLookupCombo3Change(Sender: TObject);
begin
  RxDBLookupCombo3.Tag:=0;
  GlbCalculado:=False;
  if not TotalesTipoNCF.IsNull then
  ProcGetUltNcf(TotalesTipoNCF.Value);
  // Totales.State = dsBrowse then
  //gin
    Totales.Edit;
    TotalesTipoNCF.Value := dmFactura.ibQryViewNCFTIPO_CF.Value;
    TotalesTipoNCFIFiscal.Value := dmFactura.ibQryViewNCFTIPO_NCF_IFISCAL.Value;
    //Totales.Post;
  //endd;
end;

procedure TfrmProcVentaRapida.StatusBarClick(Sender: TObject);
begin
  ProcActualizaMsg;
  RxDBLookupCombo3Change(Self);
end;

procedure TfrmProcVentaRapida.ProcGetDatosDevparaNotaCR;
begin

end;

procedure TfrmProcVentaRapida.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmCalculos.qryPosExtraDet.Close;
  if (GlbNumVtaPOS > 0) then
  dmcalculos.ProcDeletePosExtraDet(GlbNumVtaPOS);
  GlbNumeroTrn:=-1;
end;

procedure TfrmProcVentaRapida.CheckBox1Click(Sender: TObject);
begin
  if Totales.State = dsInactive then exit;
  if Not CheckBox1.Checked then
  begin
    if (Totales.State = dsBrowse) then
    Totales.Edit;
    TotalesTipoNCFIFiscal.AsVariant := Null;

    TotalesTipoNCF.AsVariant := Null;
    if (Totales.State In [dsEdit, dsInsert]) then
    Totales.Post;
  end; ProcSetBtnConduce;

end;

procedure TfrmProcVentaRapida.ProcSetBtnConduce;
begin
  if checkBox1.Checked then
  begin
    GlbIgI := 0;
    //BitBtn13.Font.Style:= [];
    //BitBtn13.Font.Color:=clblack;
  end else
  begin
    GlbIgI := 1;
    //BitBtn13.Font.Style:= [fsBold];
    //BitBtn13.Font.Color:=clRed;
  end;
end;

procedure TfrmProcVentaRapida.ReimprimirFacturaNoFiscal(numTRN : Integer);
var
  tRecordsDet : integer;
  ImpPDF, flag : boolean;
    
  pulgadaInc : Real;
begin

end;

procedure TfrmProcVentaRapida.VerTipoComprobantes1Click(Sender: TObject);
begin
end;//LlenarrxSolDatoscte;

    //829-982-7226

procedure TfrmProcVentaRapida.RxDBLookupCombo1Change(Sender: TObject);
var
  sDesc : String;
begin
   if tablaPropietario.State = dsBrowse then
   tablaPropietario.Edit;
  if (rxDBLookupCombo1.Value <> '') then
  begin
    tablaPropietarioCodigoPropietario.Value:=StrToInt(rxDBLookupCombo1.Value);
  end;
  if Length(qryclienternc_numero.Value) = 9 then
  sDesc := 'RNC =>'
  else
  if Length(qryclienternc_numero.Value) = 11 then
  sDesc := 'CEDULA=>'
  else
  sDesc := 'Cte no tiene RNC/Cédula';
  if (tablaPropietarioCodigoPropietario.IsNull) or
  (tablaPropietarioCodigoPropietario.Value = 0) then
  lblRNC.Caption:=''
  else
  begin
     if qryCliente.state = dsInactive then
     qryCliente.Open;
   
    if qryCliente.Locate('CODIGO_CTE', tablaPropietarioCodigoPropietario.Value, []) then
    lblRNC.Caption:= sDesc +qryclienternc_numero.Value
    else
    lblRNC.Caption :=sDesc;
  end;

  ProcChequeaOtrasVtasCte;
  ProcSetNCFCliente;
  //cboxUseLogoChange(Self);
end;

procedure TfrmProcVentaRapida.tablaPropietarioAfterOpen(DataSet: TDataSet);
begin
  lblRNC.Caption:= '';
  if tablaPropietarioCodigoPropietario.IsNull then
  begin
    tablaPropietario.Edit;
    tablaPropietarioCodigoPropietario.Value:=0;
    tablaPropietario.Post;
 end;  
end;

procedure TfrmProcVentaRapida.rxVentaAfterClose(DataSet: TDataSet);
begin
  lblRNC.Caption:='';
  codAuxi:='';
  SoloGuardaVenta:=False;
  EsConduce:=False;
  qryProductos.close;
  qryInventario.Close;
  NCFCTeNotSetup:= False;
  rxCobertura.Close;
  rxCobertura.EmptyTable;
  rxCobertura.Open;
  Label59.Caption:='';
  rxPreventa.close;
  rxPreventa.open;
end;

function TfrmProcVentaRapida.CheckPortComDisponible: boolean;
begin

end;

procedure TfrmProcVentaRapida.ReImprimeDevolucionsinFact1Click(
  Sender: TObject);
  var
  _xflag : Boolean;
begin

end;

procedure TfrmProcVentaRapida.ReImpDevolucion(numDev : Integer;var _flag : boolean);
var
  flag : Boolean;
begin

end;

//Procesar Devolución Ventas Cash sin Cliente


procedure TfrmProcVentaRapida.ProcInsertarVtaMastCashEnDev(var NumTrnGen : Integer; var NumOrden : Integer);
begin

end;

procedure TfrmProcVentaRapida.InsertarDetDevolucionCash(numero: Integer);
begin
 end;
procedure TfrmProcVentaRapida.UpdateServINFO(numVta: integer);
begin
 end;

procedure TfrmProcVentaRapida.DBEdit1Change(Sender: TObject);
begin
    //dmCalculos.esFeedback:=True;
  dmCalculos.esFeedback:=False;
  GlbCalculado:=False;
  frmLogError.Cant := rxVentaCant.value;
  frmLogError.LogMarca(GlbNumVtaPOS,rxVentaSerie.Value,now,now,'OnChangeCant',1);
  if Length(Dbedit1.text) >  5 then
  begin
    Dbedit1.Text:='';
    Exit;
  end;
  GlbAlreadyCld := False;
  CalcYaEjecutado:=False;
  procCalc := True;
  esEditando := True;
end;

procedure TfrmProcVentaRapida.DBEdit2Change(Sender: TObject);
begin
  //dmCalculos.esFeedback:=True;
  GlbCalculado:=False;
  esEditando:=True;
  frmLogError.precio := rxVentaPrecio.value;
  frmLogError.Cant := rxVentaCant.Value;
  frmLogError.CurrenLN:=18136;
  frmLogError.LogMarca(GlbNumVtaPOS,rxVentaSerie.Value,now,now,'OnChangePrecio',1);
  procCalc := True;
  GlbAlreadyCld := False;
  dmCalculos.esFeedback:=False;
end;

procedure TfrmProcVentaRapida.Alquiler1Click(Sender: TObject);
begin
  {
    frmAlquiler:=TfrmAlquiler.Create(Nil);
  try
    frmAlquiler.Panel1.Caption := 'PROCESAR ENTRADA ALQUILER';
    frmAlquiler.tripoTrn := 2;
    frmAlquiler.ProcAbrir;
    frmAlquiler.Showmodal;
  finally
  frmAlquiler.Free;
  frmAlquiler:=Nil;
  end;
  }

end;

procedure TfrmProcVentaRapida.RxSpinEdit1Exit(Sender: TObject);
begin
  DBEdit2Exit(Self)
  //BitBtn27Click(Self);
end;

procedure TfrmProcVentaRapida.UpdateServAlquiler(numVta: integer);
begin

end;

procedure TfrmProcVentaRapida.tablaPropietarioBeforePost(
  DataSet: TDataSet);
  var  xx:smallint;
begin
  xx:=0;
end;

procedure TfrmProcVentaRapida.DBEdit9Change(Sender: TObject);
begin
  dmCalculos.esFeedback:=False;
  GlbAlreadyCld := False;
  procCalc := True;
  GlbCalculado:=False;
  esEditando:=True;
end;

procedure TfrmProcVentaRapida.DBEdit10Change(Sender: TObject);
begin
dmCalculos.esFeedback:=False;
  GlbAlreadyCld := False;
  procCalc := True;
end;

procedure TfrmProcVentaRapida.chkNoLeyPropinaClick(Sender: TObject);
begin
  //if chkNoLeyPropina.Checked then
  //begin
   GlbCalculado:=False;
    BitBtn27Click(Self);
  //end;
end;

procedure TfrmProcVentaRapida.NotificaErrorByEmail(sms:string);
begin

end;

procedure TfrmProcVentaRapida.ActFastFoodTicket(numTicket:Integer);
begin

end;

procedure TfrmProcVentaRapida.AbrirDatosParaTicket(
          CheckBox1_Checked:Boolean;
          rdgCredito_Checked:boolean;
          edtCodCte_Text:String;
          EditN1_ValueInteger:integer;
          DateTimePicker1_Date:TDateTime
          );
begin

  {if Not rdgCredito_Checked then
     dmFactura.qryVentaFactura.Locate('numero_doc_pago',EditN1_ValueInteger,[])
  else
     dmFactura.qryVentaFactura.Locate('NUMERO_FACTURA',editn1_ValueInteger,[]);}
end;

procedure TfrmProcVentaRapida.AbrirUnidades;
begin
  dmInventario.qryTipoUnidad.Close;
  if GlbUsaPUnidadLevel = 1 then
  begin
    dmInventario.qryTipoUnidad.Params[0].Value:=2
  end else
  dmInventario.qryTipoUnidad.Params[0].Value:=1;
  dmInventario.qryTipoUnidad.Open;
end;

procedure TfrmProcVentaRapida.rxdblookupTipoUnidadChange(Sender: TObject);
var
  xFlag : boolean;
begin
  procCalc  := True;
  esEditando:= True;
  GlbCalculado:=False;
  frmLogError.LogMarca(GlbNumVtaPOS,rxVentaSerie.Value,now,now,'OnChangeUnit',1);
  if (rxdblookupTipoUnidad.Tag < 0) and
  (rxVenta.State = dsInsert) then exit
  else
  rxdblookupTipoUnidad.Tag:=0;
  GlbTipoUnidad := dmVentas.qryPrecioUnidadSurtIDUNIDAD.Value;
  CantUnidad:= dmVentas.qryPrecioUnidadSurtCANTIDAD.Value;
  xFlag:=False;
  if xFlag  then;
  begin
    if not qryProductoscodigo.Isnull And (Not PrecioCambio ) then
    begin
      if GlbUsaPUnidadLevel = 1 then
      begin
        SetPrecioPorCantidad;//case
      end else
      if (GLBPrecioMayUnidad = 1) then
      begin
        SetPrecioPorCantidadMay;
      end else
      begin
        if (GlbUsaEscalaPrecio = 0) and (GlbTipoUnidad <> 1) then
        if (GlbUsaPUnidadStd = 1) then
        rxVentaPrecio.Value  := precioXUnidad(GlbTipoUnidad, qryProductoscodigo.value); //qryProductosPRECIO_TIPO_UNIDAD.Value;
        if (rxVentaprecio.Value = 0) And (Not PrecioCambio )then
        begin
          if (GlbUsaescalaPrecio = 1) And (Not GlbUsandoCotiza Or ( rxVentaStatus.Value = 'I') ) then
          begin
            SetPrecioPorCantidad;//case
          end;
        end;
      end;
    end;
  end;
end;

procedure TfrmProcVentaRapida.rxdblookupTipoUnidadEnter(Sender: TObject);
begin
  if rxVenta.state = dsInsert then
  begin
    rxVentaTipoUnidad.Value:=1;
    GlbTipoUnidad := 1;
    CantUnidad:= 1;
    //el precio no se actualiza si tag es negativo
    //t rxdblookupTipoUnidad.Tag:=-1;
  end;
  if rxVentaCodArticulo.IsNull then exit;

  dmVentas.qryPrecioUnidadSurt.Close;
  dmVentas.qryPrecioUnidadSurt.Params[0].Value:=rxVentaCodArticulo.Value;
  dmVentas.qryPrecioUnidadSurt.Open;
  panel2.Visible := False;

  ProcActTipoUnidad;
end;

procedure TfrmProcVentaRapida.ProcMostrarVersion;
var
  VInfo: TVersionInfo;
  FAppVer, FAppBuild : String;
begin
  if (GlbActivaIFiscal = 0) then
  begin
    Version.Caption:='';
    exit;
  end;
  VInfo := TVersionInfo.Create(ParamStr(0));
  try
    FAppVer := VInfo.FileVersion;
    if trim(FAppVer)='' then FAppVer := '?.?';
    //FAppBuild := ' '+FormatDateTime('mm/dd/yyyy', VInfo.VerFileDate);
    //label6.Caption:= vinFO.CompanyName+' ';//  'IDESI SRL'+' ';
  finally
    VInfo.free;
    VInfo:= Nil;
  end;
  Version.Caption:='Version '+FAppVer+FAppBuild;
end;

procedure TfrmProcVentaRapida.BuscarRNCDGII1Click(Sender: TObject);
var
   nAbr : string[30];
begin

end;

procedure TfrmProcVentaRapida.DetallePosExtra1Click(Sender: TObject);
begin
  if not Assigned(frmPosExtraDet) then
  frmPosExtraDet:=TfrmPosExtraDet.Create(Nil);
  try
    frmPosExtraDet.show;
  finally
  //frmPosExtraDet.free;
  //frmPosExtraDet:=nil
  end;
end;

procedure TfrmProcVentaRapida.rxVentaAfterInsert(DataSet: TDataSet);
begin
  dmCalculos.avoidLoopExtra:=False;
  if (GlbMonedaBase > 0) then
  rxVentaMoneda.Value   := IntToStr(GlbMonedaBase)
  else
  rxVentaMoneda.Value   := '1';

  if glbMutur = 1 then
  begin
    if TotalesidNumeroDVeh.IsNull or (TotalesidNumeroDVeh.Value = 0) then
    begin

    end;
  end;

  if not procCalc then exit;
  if GlbNumVtaPOS > 0 then
  if dmCalculos.qryConsultaPosExtraDet.Tag = 0 then
  begin
    frmLogError.CurrenLN:= 18762;
    frmLogError.LogSteps(GlbNumVtaPOS,rxVentaSerie.Value,now,now,
      'Antes dmCalculos.Pos_UpdateTotales(GlbNumVtaPOS);',
      'UProcVentaRapida');
      if GlbCalculado then
      dmCalculos.Pos_UpdateTotales(GlbNumVtaPOS);

      frmLogError.LogSteps(GlbNumVtaPOS,rxVentaSerie.Value,now,now,
      'Despues dmCalculos.Pos_UpdateTotales(GlbNumVtaPOS);',
      'UProcVentaRapida');
  end;

end;

procedure TfrmProcVentaRapida.TotalesAfterPost(DataSet: TDataSet);
begin
  if rxVenta.recordcount = 0 then exit;
  if (GlbNumVtaPOS = -1) then exit;
  dmcalculos.ibstpProcPosUpdTExtDet.Params[0].Value:= GlbNumVtaPOS;
  dmcalculos.ibstpProcPosUpdTExtDet.Params[1].Value:= TotalesPorcDesAdicional.Value;
  dmcalculos.ibstpProcPosUpdTExtDet.Params[2].Value:= TotalesRecargo.Value;
  dmcalculos.ibstpProcPosUpdTExtDet.Params[3].Value:= TotalesPropina.Value;
  dmcalculos.ibstpProcPosUpdTExtDet.Params[4].Value:= TotalesMontoInteres.Value;
  dmcalculos.ibstpProcPosUpdTExtDet.Params[5].Value:= TotalesMontoNCRAplicado.Value;
  dmcalculos.ibstpProcPosUpdTExtDet.ExecProc;

  if Not dmcalculos.ibstpProcPosUpdTExtDet.Transaction.InTransaction then
  dmcalculos.ibstpProcPosUpdTExtDet.Transaction.StartTransaction;
  try
    dmcalculos.ibstpProcPosUpdTExtDet.Transaction.CommitRetaining;
  except
  dmcalculos.ibstpProcPosUpdTExtDet.Transaction.RollbackRetaining;
  end;
  if (Abs(Totalestotalneto.AsInteger) = 0) then
  Totales.Tag := 0;
  ProcChequeaOtrasVtasCte;
end;

procedure  TfrmProcVentaRapida.ProcChequeaOtrasVtasCte;
begin
  
end;
procedure TfrmProcVentaRapida.rxVentaBeforeDelete(DataSet: TDataSet);
begin
  dmcalculos.ProcDelRecPosExtraDet(rxVentaSerie.Value);
end;


procedure TfrmProcVentaRapida.TotalesBeforePost(DataSet: TDataSet);
begin
  if rxVenta.State = dsInactive then exit;
  //if rxVentaserie.IsNull then exit;
  if TotalesTipoNCFIFiscal.IsNull then
  TotalesTipoNCFIFiscal.Value:= 0;
  if TotalesTipoNCF.IsNull then
  TotalesTipoNCF.Value:='02';//Consumidor Final
  if Abs(TotalesMontoExoneraITBIS.Value) > 0 then
  if Abs(TotalesMontoExoneraITBIS.Value) > Abs(TotalesItbis.Value) then
  TotalesMontoExoneraITBIS.Value:=TotalesItbis.Value;
end;

procedure TfrmProcVentaRapida.rxVentaAfterEdit(DataSet: TDataSet);
begin
  procCalc:=True;
  CalcYaEjecutado:=False;
  esEditando:= true;
  dmCalculos.datCambio :=esEditando;
end;

procedure TfrmProcVentaRapida.ProcItbisExonerado;
var
  xpos : integer;
begin
  //if RxDBLookupCombo3.Tag = 77 then exit;
    if (not TotalesTipoNCF.IsNull) Or (TotalesTipoNCF.Value <> '') then
    begin
      if Totales.State = dsBrowse then Totales.Edit;
      xpos := Pos('ESPECIAL',UpperCase(dmFactura.ibQryViewNCFDESCRIPCION.Value));

      if Pos('ESPECIAL',UpperCase(dmFactura.ibQryViewNCFDESCRIPCION.Value)) > 0 then
      begin
        label29.Caption := 'ITBIS Exonerado';
        label29.Visible := True;
        if (GLBEsFastFood) then
        begin
          if not GLBEsFastFood then
          begin
            label29.Top:= label41.Top;
            dbTextMontoExoneraITBIS.Top := DBText15.Top;
          end;
          label41.Visible := False;
          DBText15.Visible:= False;
        end;
        dbTextMontoExoneraITBIS.Visible := True;
        dbTextMontoExoneraITBIs.BringToFront;
        TotalesMontoExoneraITBIS.Value:= Totalesitbis.Value;
        GlbCalculado:=False;
        dmcalculos.datCambio:=True;
        //WriteToLog('Total itbis: '+Totalesitbis.AssTring);
      end else
      begin
        TotalesMontoExoneraITBIS.Value:= 0;
        dmcalculos.datCambio:=True;
        GlbCalculado:=False;
        label29.Caption := 'Sub-Total Indirecto';
      end;
      //ttt chkExentoExit(Self);
    end;
    RxDBLookupCombo3.Tag := 77;
  if Totales.State In [dsEdit, dsInsert] then
  Totales.Post;
end;

procedure TfrmProcVentaRapida.rxVentaAfterDelete(DataSet: TDataSet);
begin
  GlbCalculado:=False;
  dmCalculos.avoidLoopExtra:=False;  
  dmCalculos.Pos_UpdateTotales(GlbNumVtaPOS);
end;

procedure TfrmProcVentaRapida.chkNoLeyPropinaExit(Sender: TObject);
begin
  ProcItbisExonerado;
end;

procedure TfrmProcVentaRapida.ProcInsFiscalCtrl(ntrn: integer;vtaFecha:TDateTime;var trnExiste:Boolean);
begin

  //Totales.Tag
end;


procedure TfrmProcVentaRapida.ProcReImpDocFiscal(ntrn: integer;vtaFecha:TDateTime);
begin
end;

procedure TfrmProcVentaRapida.ProvVerDatosDescGlb;
begin
if chKDescuentoGlobal.Checked then
  begin
     Label44.Caption := 'Monto Desc. Global';
     DBText4.Visible    := True;
     DBText4.BringToFront;
     Label47.Visible := True;
     DBEdit11.Visible:= True;
     DBEdit9.Enabled := false;
  end else
  begin
    DBEdit9.Enabled := True;
    Label47.Visible := False;
    DBEdit11.Visible:= False;
    Label44.Caption := 'Monto Desc. Items';
    DBText4.Visible:=False;
    //DBText4.SendToBack;
  end;
  if Abs(TotalesPorcDesAdicional.Value) = 0 then
  DBEdit9.Enabled:=True;  
end;

procedure TfrmProcVentaRapida.SetPrecioPorCantidadMay;
begin
  //Se esta usando la configuracion de la surtidora
  //if (GLBPrecioMayUnidad = 1) then
  //begin
  //  SetPrecioPorCantidadMay;
  //end;
  if rxVenta.State = dsBrowse then
  rxVenta.Edit;
  dmVentas.qryPrecioUnidadSurt.Close;
  dmVentas.qryPrecioUnidadSurt.Params[0].Value:=rxVentaCodArticulo.Value;
  dmVentas.qryPrecioUnidadSurt.Open;
  if not rxVentaTipoUnidad.IsNull and (GlbTipoUnidad = 0) then
  GlbTipoUnidad:= rxVentaTipoUnidad.Value;
  if GLBPrecioMayUnidad= 1 then
  begin
    rxVentaTipoUnidad.Value:= GlbTipoUnidad;
    //cboxTipoUnidad.text

    dmVentas.qryPrecioUnidadSurt.Close;
    dmVentas.qryPrecioUnidadSurt.Params[0].Value:=rxVentaCodArticulo.Value;
    dmVentas.qryPrecioUnidadSurt.Open;
    if dmVentas.qryPrecioUnidadSurt.Locate('COD_PRODUCTO;IDUNIDAD',
    VarArrayOf([rxVentaCodArticulo.Value,GlbTipoUnidad]),[]) then
    begin
      cboxTipoUnidad.Text:=dmVentas.qryPrecioUnidadSurtDESCRIPCION.Value;
      case RxSpinEdit1.AsInteger Of
      1: begin
           if dmVentas.qryPrecioUnidadSurtPRECIOVENTA1.Value > 0 then
           rxVentaPrecio.Value := dmVentas.qryPrecioUnidadSurtPRECIOVENTA1.Value;
         end;
      2: begin
          if dmVentas.qryPrecioUnidadSurtPRECIOVENTA2.Value > 0 then
          rxVentaPrecio.Value := dmVentas.qryPrecioUnidadSurtPRECIOVENTA2.Value;
         end;
      3:begin
          if dmVentas.qryPrecioUnidadSurtPRECIOVENTA3.Value > 0 then
          rxVentaPrecio.Value := dmVentas.qryPrecioUnidadSurtPRECIOVENTA3.Value;
        end;
      4: begin
           if dmVentas.qryPrecioUnidadSurtPRECIOVENTA4.Value > 0 then
           rxVentaPrecio.Value := dmVentas.qryPrecioUnidadSurtPRECIOVENTA4.Value;
        end;
      end;//case
    end;
  end else
  begin
  //p1 p3 p3 p4
  QryPrecios.Close;
  QryPrecios.Params[0].Value:=rxVentaCodArticulo.Value;
  QryPrecios.Open;
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
  if (rxVentaPrecio.Value = 0) then
  begin
    MessageDlg('Precio por unidad no esta configurado verifique.',mterror,[mbok],0);
  end;
end;

procedure TfrmProcVentaRapida.rxdblookupTipoUnidadExit(Sender: TObject);
begin
  rxdblookupTipoUnidad.Tag:=0;
end;

procedure TfrmProcVentaRapida.rxVentaAfterOpen(DataSet: TDataSet);
begin
  lblTotalItem.Caption:='Total Items:'+IntToStr(0);
  rxBckVta.Close;
  rxBckVta.Open;
end;

procedure TfrmProcVentaRapida.CerrarPuertoImpF;
begin

end;

procedure TfrmProcVentaRapida.DBEdit12Change(Sender: TObject);
begin
  procCalc := True;
end;

procedure TfrmProcVentaRapida.ProcModFactCantXUnidad(_codProd:integer;_idUnidad:integer);
var
  xflag:boolean;
begin

  xflag:=False;

  dmVentas.qryPrecioUnidadSurt.Close;
  dmVentas.qryPrecioUnidadSurt.Params[0].Value:=_codProd;
  dmVentas.qryPrecioUnidadSurt.Open;

  xflag:=True;
  if (GlbUsaPUnidadLevel = 1) then
  if not dmVentas.qryPrecioUnidadSurt.Locate('COD_PRODUCTO;IDUNIDAD',
  VarArrayOf([_codProd,_idUnidad]),[]) then
  begin
    if (GlbUsaPUnidadLevel = 1) then
    begin
      MessageDlg('Unidad no encontrada en precio por unidad, verifique.', mtError, [mbOk], 0);
      xflag:=False;
    end;
  end else
  begin
    GlbTipoUnidad := dmVentas.qryPrecioUnidadSurtIDUNIDAD.Value;
    CantUnidad:= dmVentas.qryPrecioUnidadSurtCANTIDAD.Value;
    if GlbTipoUnidad = 1 then
    CantUnidad:=1;
  end;
  
  if GlbUsaPUnidadLevel = 0 then
  if not xFlag then
  if Not dmInventario.qryTipoUnidad.Locate('DESCRIPCION', cboxTipoUnidad.Text, []) then
  begin
    xflag:=False;
  end else
  if (GlbUsaPUnidadLevel = 1) then
  begin
    GlbTipoUnidad := dmInventario.qryTipoUnidadIDUNIDAD.Value;
    CantUnidad:= dminventario.qryTipoUnidadCANTIDAD.Value;
    if GlbTipoUnidad = 1 then
    CantUnidad:=1;
  end;
end;


procedure TfrmProcVentaRapida.ImprimirFacturaRepuesto(numTran: Integer);
begin
 
end;

procedure TfrmProcVentaRapida.BitBtn13Click(Sender: TObject);

begin

end;
//FORMAREPUESTO
procedure TfrmProcVentaRapida.ImprimirFacturaRepuestoConduce(
  numstr: integer);
begin

end;

procedure TfrmProcVentaRapida.ProcUpdateNumDLinea(numPos:integer; numeroTrnVta:integer; tipo:Smallint);
begin

end;

procedure TfrmProcVentaRapida.Log1Click(Sender: TObject);
begin
  if Assigned(frmLogError) then
  frmLogError.show else
  begin
    frmLogError:=TfrmLogError.Create(nil);
    frmLogError.show;  
  end;
end;

procedure TfrmProcVentaRapida.DesactivarSkin1Click(Sender: TObject);
begin
  //SkinData1.Active:= not SkinData1.Active;
end;

procedure TfrmProcVentaRapida.ImprimirVentaRepuestoConduce;
var
  tRecordsDet : Integer;
  pulgadaInc : Real;
  flag : boolean;
  cRc : Integer;
begin

end;

procedure TfrmProcVentaRapida.BitBtn32Click(Sender: TObject);
begin
  dmCalculos.qryPosExtraDet.Close;
  dmCalculos.qryPosExtraDet.Params[0].Value:= GlbNumVtaPOS;;
  dmCalculos.qryPosExtraDet.Open;
  DetallePosExtra1Click(Self);
end;

procedure TfrmProcVentaRapida.edtCodigoChange(Sender: TObject);
begin
  //GlbCalculado
  if rxVenta.State in [dsEdit, dsInsert] then
  if not rxVentaSerie.IsNull then
  begin
    procCalc:=False;
    rxVenta.Post;
  end;
  if rxVenta.State = dsBrowse then  if Not rxVentaSerie.IsNull then
  if not rxVenta.BOF then
  rxVenta.Last;
  procCalc := True;
  rxLabelVence.Visible:= False;
  if LectorCodBarra1.Checked then Exit;
  BuscandoPorDesc:=False;
  if (dmInventario.qryTipoUnidad.State = dsInactive) then
  AbrirUnidades;

  if (edtCodigo.Text = '') then Exit;

  GlbAlreadyCld := False;
 
  if IsNumerico(edtCodigo.Text) then
  begin
    if Not sqlAsignado then
    AsignarSqlText('','','');
    if qryProductos.State = dsInactive then
    qryProductos.Open;
    //if rxqryInv.Locate('Codigo_Texto', edtCodigo.Text,[loCaseInsensitive, loPartialKey]) then
    if qryProductos.Locate('codigo', edtCodigo.Text, [loCaseInsensitive, loPartialKey]) then
    begin
      _UsarLevelPrecio:= qryProductosUSARLEVELPRECIO.Value;

      qryProdPorProveedor.Close; //qryProductosCodigo.value
      qryProdPorProveedor.Params[0].Value:= qryProductosCODIGO.Value;
      qryProdPorProveedor.Params[1].Value:= glbcia_key;
      qryProdPorProveedor.Open;
      dmInventario.qryTipoUnidad.Locate('IDUNIDAD',qryProductosTIPO_UNIDAD.Value ,[]);
      cboxTipoUnidad.Text:=dmInventario.qryTipoUnidadDescripcion.Value;
      if qryVence.Locate('codigo', qryProductosCodigo.Value,[]) then
      begin
        rxLabelVence.Visible:=true;
        if (qryVenceDiasVencidos.Value > 0) then
        begin
          rxLabelVence.Caption:='Cantidad días vencido: ' + qryVenceDiasVencidos.AsString;
          rxLabelVence.font.Color:=clRed;
          EsProdVencido :=True;
        end else
        begin
          if (qryVenceDIASPORVENCER.Value > 0) then
          begin
            rxLabelVence.Caption:='Vence en ' + qryVenceDIASPORVENCER.AsString;
            rxLabelVence.font.Color:=clGreen;
          end else rxLabelVence.Visible:=False;
        end;
      end else rxLabelVence.Visible:=False;
      panel2.Left:= edtcodigo.Left;

      panel2.Visible := True;
      panel2.BringToFront;

      noExiste:=False;
    end else noExiste:= True;
  end else
  begin
    sqlAsignado    := False;
    BuscandoPorDesc:= True;
    AsignarSqlText('Descripcion', chr(39) + '%' + edtCodigo.Text +'%'+chr(39),'');
    if qryProductos.State = dsInactive then
    qryProductos.Open;
    qryProductos.First;
    qryProductos.RecordCount;
    if qryProductos.Locate('Descripcion', edtCodigo.Text, [loCaseInsensitive, loPartialKey]) then
    begin
      _UsarLevelPrecio:= qryProductosUSARLEVELPRECIO.Value;
      qryProdPorProveedor.Close;
      qryProdPorProveedor.Params[0].Value:= qryProductosCODIGO.Value;
      qryProdPorProveedor.Params[1].Value:= glbcia_key;
      qryProdPorProveedor.Open;

      if dmInventario.qryTipoUnidad.state = dsInactive then
      AbrirUnidades;

      dmInventario.qryTipoUnidad.Locate('IDUNIDAD', qryProductosTipo_Unidad.value,[]);
      cboxTipoUnidad.Text:=dmInventario.qryTipoUnidadDescripcion.Value;
     if qryVence.state = dsInactive then
      qryVence.Open;
      if qryVence.Locate('Codigo_Texto',qryProductosCodigo_Texto.Value,[]) then
      begin
        rxLabelVence.Visible:= True;
        if (qryVenceDiasVencidos.Value > 0) then
        begin
          rxLabelVence.Caption:='Cantidad días vencido: ' + qryVenceDiasVencidos.AsString;
          rxLabelVence.Font.Color := clRed;
          EsProdVencido := True;
        end else
        begin
          if (qryVenceDIASPORVENCER.Value > 0) then
          begin
            rxLabelVence.Caption:='Vence en ' + qryVenceDIASPORVENCER.AsString;
            rxLabelVence.font.Color:=clGreen;
          end else rxLabelVence.Visible:=False;
        end;
      end else rxLabelVence.Visible:=False;
      //panel2.Top := edtcodigo.Top+30;
      panel2.Left := edtcodigo.Left;
      panel2.Visible := True;
      panel2.BringToFront;
      noExiste:= False;
           
    end else
    noExiste:= True;
  end;
  if qryProdPorProveedor.RecordCount > 0 then
  pnlPrecioProv.Visible:=True else
  pnlPrecioProv.Visible:=False;
end;

procedure TfrmProcVentaRapida.edtCodigoEnter(Sender: TObject);
var
  t : integer;
begin
  {DEBUG try
    if label53.Visible then
    t:= SecondsBetween(StrToDateTime(label52.Caption),StrToDateTime(label51.Caption));
    label53.Caption:=IntToStr(t);
  except
  end;  }
  //sender.ClassName
  EsEditando:=False;
  panel2.Visible:=False;
  BuscandoPorDesc:=False;
  if tablaPropietario.State = dsInactive then
  tablaPropietario.Open;

  if dmFactura.ibQryViewNCF.State = dsInactive then
  dmFactura.ibQryViewNCF.Open;
  if (Totales.State = dsInactive) then
  begin
    Totales.Close;
    Totales.Open;
  end;
  //Refresh;
  //edtCodigo.SelectAll;
  dmCalculos.esFeedback := True;
  panel2.Visible := False;
  panel2.SendToBack;
  edtCodigo.Enabled:=True;
  edtCodigo.Color  :=clWindow;
  //edtCodigo.Text:='';
end;

procedure TfrmProcVentaRapida.edtCodigoExit(Sender: TObject);
var
  numero : Integer;
  FExiste : Boolean;
begin
  if rxVenta.RecordCount > 0 then
  lblTotalItem.Caption:='Total Items:'+IntToStr(rxVenta.RecordCount);
  label51.Caption:=formatDateTime('hh:mm:ss',now);
  if (edtCodigo.Text = '') then Exit;
  if (edtCodigo.Text <> '') then
  begin
    rxVenta.EnableControls;
    RxDBGrid1.EnableScroll;
    GlbCalculado:=False;
  end;
  GlbAlreadyCld:=False;
  //dmCalculos.esFeedback :=False;
  if (Pos('COTIZACI',uppercase(label36.Caption)) <= 0 )  then
  EsModificandoCotiza:=False;

  if LectorCodBarra1.Checked OR imbBarcode.Visible then
  begin
    //if Not sqlAsignado then
    pesoProd :='';
    if (GlbUsaBalanza = 1) then
    if (Length(edtCodigo.Text) >= 12) then
    edtCodigo.Text:= GLBObtenerCodigoProdEAN13(edtCodigo.Text, pesoProd);
    //if (Length(pesoProd) > 0) then
    //rxVentaCant.Value := StrTofloat(pesoProd);
    if (edtCodigo.Text = '') then Exit;
    AsignarSqlText('','','');
    if qryProductos.Locate('CODIGO_BARRA', trim(edtCodigo.Text),[loCaseInsensitive]) then
    begin
      _UsarLevelPrecio:= qryProductosUSARLEVELPRECIO.Value;
       edtCodigo.Text := qryProductosCODIGO.AsString;
       noExiste := False;
       if not qryProductosLOTE_NUM.IsNull then
       flagSolLote:=True;
    end else
    begin
      if not qryProductos.Locate('CODIGO', trim(edtCodigo.Text),[loCaseInsensitive]) then
      begin
        MessageDlg('Código producto no encontrado, verifique', mtInformation, [mbOK], 0);
        edtCodigo.Text:='';
        if isShowing then
        edtCodigo.SetFocus;
        PostMessage(edtCodigo.Handle, WM_SETFOCUS, 0, 0);
        edtCodigo.Text:='';
      end;
    end;
  end;
  if (Length(edtcodigo.Text) > 0) And (uppercase(qryProductosCodigo_Texto.Value) <> uppercase(edtCodigo.text)) And ( noExiste ) and (not Panel2.Visible) then
  begin
    MessageDlg('Código producto no encontrado, verifique', mtInformation, [mbOK], 0);
    edtCodigo.Text:='';
    if Not Assigned(frmProcVentaRapida) Then
      if isShowing then
        if not EsModificandoCotiza then
        begin
          if isShowing then
          edtCodigo.SetFocus;
          PostMessage(edtCodigo.Handle, WM_SETFOCUS, 0, 0);
        end;
    Exit;
  end;
  MontoItbisEnPrecio:=0;
  if (edtCodigo.Text = '') then Exit;
  Edit1.Text  := '';
  PrecioCambio:= False;
  if reciboImpreso then
  Totales.EmptyTable;

  reciboImpreso := False;

  if BuscandoPorDesc then
  begin
    Panel2.BringToFront;
    Panel2.Top := 177;
    Panel2.Visible := True;
    if isShowing then
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
      if (qryProductosCANTIDAD.Value <=0 ) And (GlbPermiteVentaInv0 = 0) then
      begin
        MessageDlg('Cantidad venta es mayor que existencia inventario.', mtWarning, [mbOk], 0);
        if rxVenta.State in [dsEdit, dsInsert] then
        rxVenta.Cancel;
        edtCodigo.Text:='';
        if isShowing then
        edtCodigo.Setfocus;
        Exit;
      end;

      _UsarLevelPrecio:= qryProductosUSARLEVELPRECIO.Value;
      qryProdPorProveedor.Close;
      qryProdPorProveedor.Open;
      //t LlenarTipoUnidadBox(qryProductosTipo_Unidad.Value);
      if (qryProductosTipo_Unidad.value >0) or (Not qryProductosTipo_Unidad.IsNull) then
      begin
        dmInventario.qryTipoUnidad.Locate('IDUNIDAD',qryProductosTipo_Unidad.value,[]);
        cboxTipoUnidad.Text:=dmInventario.qryTipoUnidadDescripcion.Value;

        GlbTipoUnidad:=qryProductosTipo_Unidad.value;
      end;
      if qryVence.Locate('Codigo_Texto', qryProductosCodigo_Texto.Value,[]) then
      begin
        rxLabelVence.Visible:=true;
        if (qryVenceDiasVencidos.Value > 0) then
        begin
          rxLabelVence.Caption:='Cantidad días vencido: ' + qryVenceDiasVencidos.AsString;
          rxLabelVence.font.Color:=clRed;
          EsProdVencido :=True;
        end else
        begin
          if (qryVenceDIASPORVENCER.Value > 0) then
          begin
            rxLabelVence.Caption:='Vence en ' + qryVenceDIASPORVENCER.AsString;
            rxLabelVence.font.Color:=clGreen;
          end else rxLabelVence.Visible:=False;
        end;
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
      if (qryProductosCANTIDAD.Value <=0 ) And (GlbPermiteVentaInv0 = 0) then
      begin
        MessageDlg('Cantidad venta es mayor que existencia inventario.', mtWarning, [mbOk], 0);
        if rxVenta.State in [dsEdit, dsInsert] then
        rxVenta.Cancel;
        edtCodigo.Text:='';
        if isShowing then
        edtCodigo.Setfocus;
        Exit;
      end;    
      _UsarLevelPrecio:= qryProductosUSARLEVELPRECIO.Value;
      qryProdPorProveedor.Close;
      qryProdPorProveedor.Params[0].Value:= qryProductosCODIGO.Value;
      qryProdPorProveedor.Params[1].Value:= glbcia_key;
      qryProdPorProveedor.Open;
      //t LlenarTipoUnidadBox(qryProductosTipo_Unidad.Value);
      dmInventario.qryTipoUnidad.Locate('IDUNIDAD',qryProductosTipo_Unidad.value,[]);
      cboxTipoUnidad.Text:=dmInventario.qryTipoUnidadDescripcion.value;

      if qryVence.Locate('Codigo_Texto',qryProductosCodigo_Texto.Value,[]) then
      begin
        rxLabelVence.Visible:=true;
        if (qryVenceDiasVencidos.Value > 0) then
        begin
          rxLabelVence.Caption:='Cantidad días vencido: ' + qryVenceDiasVencidos.AsString;
          rxLabelVence.font.Color:=clRed;
          EsProdVencido :=True;
        end else
        begin
          if (qryVenceDIASPORVENCER.Value > 0) then
          begin
            rxLabelVence.Caption:='Vence en ' + qryVenceDIASPORVENCER.AsString;
            rxLabelVence.font.Color:=clGreen;
          end else rxLabelVence.Visible:=False;
        end;
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
    if Not qryProductos.Locate('codigo', edtCodigo.Text,[loCaseInsensitive]) then
    Prod_existe:= False;
  end else
  if Not qryProductos.Locate('codigo_Texto', edtCodigo.Text,[loCaseInsensitive]) then
  Prod_existe:= False;//qryProductoscodigo_texto.value

  if Prod_existe then
  begin
    if (rxVentaCant.IsNull) and (qryProductosCANTIDAD.Value <= 0) And (GlbPermiteVentaInv0 = 0) then
    begin
      MessageDlg('Cantidad venta es mayor que existencia inventario, verifique.', mtWarning, [mbok], 0);
      if rxVenta.State In [dsEdit, dsInsert] then
      rxVenta.Cancel;
      edtCodigo.Text:='';
      if isShowing then
      edtCodigo.SetFocus;
      Exit;
      {if MessageDlg('Cantidad venta es mayor que existencia inventario.'+
      ''#13#10'Desea continuar?', mtWarning, [mbyes, mbno], 0) = MrNo then
      begin
        if isShowing then
        DBEdit1.SetFocus;
        exit;
      end;}
    end;

    Prod_existe:= True;
    _UsarLevelPrecio:= qryProductosUSARLEVELPRECIO.Value;
    if qryVence.State = dsInactive then
    qryVence.Open;
    if qryVence.Locate('codigo', qryProductosCodigo.Value,[]) then
    begin
      if (qryVenceDiasVencidos.Value > 0) then
      begin
        EsProdVencido :=True;
      end else EsProdVencido :=False;
    end else
    EsProdVencido:=False;
    if EsProdVencido and (GlbAvisoProdVence = 1) then
    begin
      EsProdVencido:=False;
      if MessageDlg('Producto vencido, cancelar?',mtWarning,[mbyes, mbno],0)=mryes then
      begin
        edtCodigo.Text := '';
        if isShowing then
        begin
          edtCodigo.SetFocus;
          PostMessage(edtCodigo.Handle, WM_SETFOCUS, 0, 0);
        end;
        rxLabelVence.Visible := false;
        Panel2.Visible := False;
        Exit;
      end;
    end;
    if qryInventario.state =dsInactive then
    qryInventario.Open;
    qryInventario.Locate('CODIGO', edtCodigo.Text,[loCaseInsensitive]);

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

      //Asegurarse que simpre se asigne precio
      if qryProductosPRECIO.Value > 0 then
      if rxVentaPrecio.IsNull then
      rxVentaPrecio.Value  := qryProductosPRECIO.Value;
      precioMinimo := qryProductosPRECIO_MINIMO.Value;

      rxVentaSerie.Value := numero;
      IF GlbTipoUnidad = 0 THEN GlbTipoUnidad:=1; //UNIDAD
      rxVentaTipoUnidad.Value:=GlbTipoUnidad;
      //GlbTipoUnidad := 1;
      CantUnidad:= 1;

      rxVentaglbcodVendedor.Value := qryClienteCOD_VENDEDOR.Value;
      rxVentaItbi.Value := 0;

     //_NumeroCotiza := -1;
      if (rxVenta.State In [dsInsert]) and (not EsModificandoCotiza)
      and (not EsModificandoFactura) then
      begin
        if ((UpperCase(edtcodigo.Text) = 'RECARGO') Or (UPPERCASE(qryProductosDESCRIPCION.Value) = 'RECARGO')) then
        rxVentaTipoVenta.Value := 3
        else
        if ((UpperCase(edtcodigo.Text) = 'DESCUENTO') Or (UPPERCASE(qryProductosDESCRIPCION.Value) = 'DESCUENTO')) then
        rxVentaTipoVenta.Value := 2
        else
        rxVentaTipoVenta.Value := 0;//Item venta;
      end;
      if EsModificandoCotiza then
      begin
        rxVentaNumeroCotiza.Value:=_NumeroCotiza;
        rxVentaStatus.Value:= 'I';
      end;

      if EsModificandoFactura then
      rxVentaStatus.Value:='I';
      if (GlbActivaIFiscal = 0) then
      RxSpeedButton1.Visible:=False;
      rxVentaCant.Value     := 1;
      rxVentaInvetariar.Value:= qryProductosINVENTARIAR.Value;
      rxVentaSerie.Value := Numero;
      rxVentaFecha.Value := ExtraerFecha(GlbFechaTrnDiaria);
      if (GlbcodVendedor > 0) then
      rxVentaCodUsuario.Value := GlbcodVendedor
      else
      rxVentaCodUsuario.Value := VarUsuarioGlb;

      if flagSolLote then
      begin
        ProcAsignaNumLote(qryProductosCODIGO.AsString);
        flagSolLote:=False;
      end else
      begin
       if (rxLote.State = dsInactive) then
       rxLote.Open;
       if rxLoteLotNum.IsNull then
       rxVentaloteNum.Value :=qryProductosLOTE_NUM.Value
       else
       rxVentaloteNum.Value :=rxLoteLotNum.Value;
      end;


    end;
    if rxVenta.State In [dsInsert, dsEdit] then
    begin
      rxVentaDescripcion.Value:= qryProductosDESCRIPCION.Value;
      rxVentaDescripcionEspecial.Value := qryProductosDESCRIPCIONADICIONAL.Value;
      rxVentaItbisExento.Value:= qryProductosPAGA_ITBI.Value;
      rxVentaReferencia.Value := qryProductosREFERENCIA.Value;

      if (qryClienteUSARLEVELPRECIO.IsNull) or (qryClienteUSARLEVELPRECIO.Value <= 0) then
      begin
        if not qryProductosUSARLEVELPRECIO.IsNull then
        RxSpinEdit1.Value:=qryProductosUSARLEVELPRECIO.AsInteger
        else
        RxSpinEdit1.Value:=qryClienteUSARLEVELPRECIO.Value;
      end else
      if not qryClienteUSARLEVELPRECIO.IsNull then
      RxSpinEdit1.Value:=qryClienteUSARLEVELPRECIO.Value //rxspinedit1 aqui
      else
      if not qryProductosUSARLEVELPRECIO.IsNull then
      RxSpinEdit1.Value:=qryProductosUSARLEVELPRECIO.Value
      else
      if (tablaPropietarioCodigoPropietario.IsNull Or
         (tablaPropietarioCodigoPropietario.Value = 0)) then
      RxSpinEdit1.Value:=1
      else
      RxSpinEdit1.Value:=qryClienteUSARLEVELPRECIO.Value;//rxspinedit1 aqui

      rxVentaCodArticulo.Value:= qryProductoscodigo.Value;
      //cargar datos unidad producto
      if (GlbUsaPUnidadStd = 1) then
      ProcActTipoUnidad;

      FGlbPorcItbi(ExtraerFecha(rxVentaFecha.Value), rxVentaCodArticulo.Value);
      if (GlbIgI = 1) and (GlbCalcItbis = 0) then
      rxVentaIDTasaITBIS.Value := 1
      else
      rxVentaIDTasaITBIS.Value := GlbIDTasa;

      rxVentaRutaImagen.Value := BuscarRutaImagen(qryProductosCodigo.Value);
      rxVentaMonedaBase.Value := GetMonedaProducto(qryProductosCODIGO.Value);
      rxVentamonto_tasa.Value := GlbMontoTasa(rxVentaMonedaBase.Value);

      //if not dmcalculos.qryPosExtraDetD_TIPO_VENTA.IsNull then
      //rxVentaTipoVenta.Value  := 0;//? dmcalculos.qryPosExtraDetD_TIPO_VENTA.Value;

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
          if (tablaPropietarioCodigoPropietario.IsNull or
            (tablaPropietarioCodigoPropietario.Value = 0)) then
          RxSpinEdit1.Value:=1
         else        
          if (qryClienteUSARLEVELPRECIO.IsNull) or (qryClienteUSARLEVELPRECIO.Value <= 0) then
          begin
            if not qryProductosUSARLEVELPRECIO.IsNull then
            RxSpinEdit1.Value:=qryProductosUSARLEVELPRECIO.AsInteger
            else
            RxSpinEdit1.Value:=qryClienteUSARLEVELPRECIO.Value;
          end else
          RxSpinEdit1.Value:=qryClienteUSARLEVELPRECIO.Value;

          if (GlbUsaescalaPrecio = 1) then
          SetPrecioPorCantidad
          else
          if (GLBPrecioMayUnidad = 1) then
          begin
            SetPrecioPorCantidadMay;
          end else
          if (not GlbFactRecurrente) and (GlbTipoUnidad = 1) and (not GlbUsandoCotiza or (rxVentaStatus.Value = 'I')) then
          rxVentaPrecio.Value  := qryProductosPRECIO.Value //hoy es el dia de la salvacion
          else
          if (GlbUsaPUnidadStd = 1) then
          if  (precioXUnidad(GlbTipoUnidad,qryProductoscodigo.Value) > 0) and Not GlbUsandoCotiza then  // qryProductosPRECIO_TIPO_UNIDAD.Value > 0 then
          rxVentaPrecio.Value  := precioXUnidad(GlbTipoUnidad,qryProductoscodigo.Value)
          else
          begin
           if not GlbUsandoCotiza Or ( rxVentaStatus.Value = 'I')  then
            rxVentaPrecio.Value := qryProductosPRECIO.Value;
            cboxTipoUnidad.ItemIndex:=0;
            //MessageDlg('Precio no configurado para tipo unidad, verifique', mtError, [mbok],0);
          end;
          precioMinimo := qryProductosPRECIO_MINIMO.Value;
        end;
        if (rxVentaPrecio.Value = 0) and (rxVentaCant.Value > 0)
        and (GlbTipoUnidad > 1) then //GlbTipoUnidad > 1; 1 = unidad
        begin
          //ven chiquilla cria un niño
          rxVentaPrecio.Value:=qryProductosPRECIO_TIPO_UNIDAD.value;
          CantUnidad:=qryProductosUNIDAD.Value;
          if qryProductosTIPO_UNIDAD.Value = 1 then
          CantUnidad:=1;
        end;
        if (Length(pesoProd) > 0) then
        rxVentaCant.Value := StrTofloat(pesoProd);
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
          if (qryProdSerieSTATUS.Value = 'R') or (qryProdSerieSTATUS_EQUIPO.Value <> 1 ) then
          begin
            MessageDlg('Número serie no disponible, verifique',mtInformation, [mbOK], 0);
            if isShowing then
            begin
              if isShowing then
              begin
                edtCodigo.SetFocus;
                PostMessage(edtCodigo.Handle, WM_SETFOCUS, 0, 0);
              end;
            end;
          end;
          if (ibsqlVerificaSerie.Open) then
          ibsqlVerificaSerie.Close;
          ibsqlVerificaSerie.Params[0].Value:=qryProdSerieSERIE.Value;
          ibsqlVerificaSerie.ExecQuery;
          rxVentaSerieProd.Value:= qryProdSerieSERIE.Value;
          if (ibsqlVerificaSerie.FieldByName('serie_prod').IsNull) Or
          (ibsqlVerificaSerie.FieldByName('serie_prod').Value = '') then
          rxVentaSerieProd.Value:= qryProdSerieSERIE.Value
          else
          begin
            if (GLBECOM = 0) then
            begin
              rxVentaSerieProd.AsVariant:=null;
              MessageDlg('Este número de serie fue procesado en otra orden, verifique',mtInformation, [mbOK], 0);
              if isShowing then
              begin
                edtCodigo.SetFocus;
                PostMessage(edtCodigo.Handle, WM_SETFOCUS, 0, 0);
              end;
              ibsqlVerificaSerie.FieldByName('serie_prod').Value
           end;
          end;
        end;
      finally
      frmSelSerie.Free;
      frmSelSerie:= Nil;
      end;
      end;
      edtCodigo.text:='';
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
            begin
              if rxVenta.State in [dsBrowse] then rxVenta.Edit;
              rxVentaloteNum.Value:= dmInventario.qryLoteLOTE_NUM.Value;
            end;
          finally
          frmShowLote.Free;
          frmShowLote:=Nil;
          end;
        end;
      end;
    end  else
    ProcesaNuevo;
  end;

  ProcSetNCFCliente;

  panel2.Visible:=MostrarVistaproductos1.Checked;
  if LectorCodBarra1.Checked And (rxVentaPrecio.Value > 0) then
  begin
    DBEdit1Enter(Self);
    DBEdit1Exit(Self);
    if isShowing then
       if not EsModificandoCotiza then
       begin
         edtCodigo.SetFocus;
         PostMessage(edtCodigo.Handle, WM_SETFOCUS, 0, 0);
      end;
  end;
  if (GlbUsaPUnidadLevel = 0) and (esEditando) then
  DBEdit1.SetFocus;
  edtCodigo.Color  :=clSilver;
end;

procedure TfrmProcVentaRapida.InactivaReciboFarmacia1Click(
  Sender: TObject);
begin
  if not InactivaReciboFarmacia1.Checked then
  GlbFarmacia:=1 else
  begin
    GlbFarmacia:=0;
    InactivaReciboFarmacia1.Checked:=True;
  end;
end;

function TfrmProcVentaRapida.VerificaVentaExisteRX(serie: integer):boolean;
begin
  if rxBckVta.State = dsInactive then
  rxBckVta.Open;
  if rxBckVta.Locate('serie',rxVentaSerie.Value,[]) then
  begin
    //MessageDlg('Existe en bckVta', mterror,[mbok], 0);
    rxBckVta.Edit;
    rxBckVtaDup.Value:=rxBckVtaDup.Value + 1;
    rxBckVta.Post;
    if rxVenta.State in [dsEdit, dsInsert] then
    begin
      rxVenta.Cancel;
      result:=true;
      //rxVenta.EmptyTable;
      //rxBckVta.EmptyTable;
      //edtCodigo.Text:=rxVentaCodArticulo.AsString;
      //edtCodigoExit(Self);
    end;
  end else
  begin
    rxBckVta.Append;
    rxBckVtaSerie.Value:= rxVentaSerie.Value;
    rxBckVtaFecha.Value:= rxVentaFecha.Value;
    rxBckVtaCant.Value:=  rxVentaCant.Value;
    rxBckVtaPrecio.Value:= rxVentaPrecio.Value;
    rxBckVtaCodArticulo.Value:= rxVentaCodArticulo.Value;
    rxBckVtaDup.Value:=1;
    rxBckVta.Post;
    result:=False;
  end;
end;

procedure TfrmProcVentaRapida.DataSource1StateChange(Sender: TObject);
var
 check : smallint;
begin
  check:=0;
end;

procedure TfrmProcVentaRapida.RxDBLookupCombo1Enter(Sender: TObject);
begin
  tablaPropietario.Edit;
end;

procedure TfrmProcVentaRapida.ProcUpdateItbiRecargoVtaMast(numeroTrnVta:integer);
begin

end;

procedure TfrmProcVentaRapida.ProcUpdateItbiRecargoCotizaMast(
  numeroTrnVta: Integer);
begin

end;

procedure TfrmProcVentaRapida.FormResize(Sender: TObject);
begin
  refresh;
end;

procedure TfrmProcVentaRapida.ImprimirOrdenEntrega1Click(Sender: TObject);
var flag : boolean;
begin
 
end;

procedure TfrmProcVentaRapida.DatosVocado(numtrn:integer;fpago:integer);
begin

end;

procedure TfrmProcVentaRapida.ReImprimeFactRest1Click(Sender: TObject);
var
  tRecordsDet : Integer;
  pulgadaInc : Real;
  flag : boolean;
  cRc : Integer;
begin
 
end;

procedure TfrmProcVentaRapida.ImprimeFactura8_5Farmacia(num: integer;
  tventa: string;valorNCF:string;xdir:string);
begin

end;

procedure TfrmProcVentaRapida.ImprimeFacturaEXDMAR(num: integer;
  tventa: string;valorNCF:string;xdir:string);
begin

end;

procedure TfrmProcVentaRapida.ProcInsertarDetEfectivo(numtrn: integer;fpago:integer);
begin

end;

procedure TfrmProcVentaRapida.ImprimirTicketVtaAgua(numtrn:integer);
begin

end;

procedure TfrmProcVentaRapida.ReImprimeTicketVta1Click(Sender: TObject);
var
  tRecordsDet : Integer;
  pulgadaInc : Real;
  flag : boolean;
  cRc : Integer;
begin

end;

procedure TfrmProcVentaRapida.ReversaCantInventario(numtrn: integer);
begin

end;

procedure TfrmProcVentaRapida.ReImprimeConduce1Click(Sender: TObject);
begin
  BitBtn13Click(Self);
end;

procedure TfrmProcVentaRapida.ImprimirFacturaAgua(numstr: integer);
begin

end;

procedure TfrmProcVentaRapida.TotalesAfterClose(DataSet: TDataSet);
begin
  lblAvisoCte.Visible:=False;
  NCFCTeNotSetup:=False;
  rxCobertura.Close;
  rxCobertura.EmptyTable;
  rxCobertura.Open;
  Label60.Caption:='';
end;

function TfrmProcVentaRapida.ValidaSubTotal: Boolean;
begin
  if (GlbNumVtaPOS > 0) and (rxVenta.RecordCount > 0) then
  begin
    qryValidaPosExtra.Close;
    qryValidaPosExtra.params[0].Value:= GlbNumVtaPOS;
    qryValidaPosExtra.Open;    
    if (qryValidaPosExtraVALOR.Value - TotalesSubTotalScreen.Value) > 1 then
    begin
      MessageDlg('Favor validar total neto.',mtError,[mbOk],0);
      NotificaErrorByEmail(
      'Usuario:'+GlbUsuarioLogueado+
      '#13#10''Total Items:'+lblTotalItem.Caption+
      '#13#10''Transacción no cuadra.' +
      '#13#10''Cliente: '+qryClienteCODIGO_CTE.AsString+'-'+qryClienteNOMBRE_FACTURAR.Value+ ' '+
      '##13#10''Monto Pantalla: '+
      TotalesSubTotalScreen.AsString+' Monto Calculado PosExtraDet:'+qryValidaPosExtraVALOR.AsString);
      result:=False;
    end else result:=true;
  end else result :=true;
end;

procedure TfrmProcVentaRapida.ProcInsertarDatosVtaSeguro(numtrn:integer);
begin

end;

procedure TfrmProcVentaRapida.rxCoberturaMontoCoberturaChange(
  Sender: TField);
begin
  rxCoberturaMontoAsegurado.Value:=
  rxCoberturaMontoTotal.Value  -
  rxCoberturaMontoCobertura.Value;
end;
procedure TfrmProcVentaRapida.InsertaBalanceARS(monto: Real;tDoc:smallint;codcte:integer);
begin

end;

function TfrmProcVentaRapida.ChequeaSecuencia: Boolean;
begin

end;

procedure TfrmProcVentaRapida.ProcActualizaSecCertSAM(sec: integer);
begin

end;

procedure TfrmProcVentaRapida.ProcAsignarClienteACert(codte: integer);
var
  x: Integer;
  sCert : String;
begin

end;

procedure TfrmProcVentaRapida.DBEdit6DblClick(Sender: TObject);
var
  guardarRec : TBookMark;
begin
  guardarRec := qryCliente.GetBookmark;
  qryCliente.Close;
  qryCliente.Open;
  if Assigned(guardarRec) then
  begin
    qryCliente.GotoBookmark(guardarRec);
    qryCliente.FreeBookmark(guardarRec);
  end;
end;

Function TfrmProcVentaRapida.VerificaNIFTExiste : Boolean;
begin

end;

procedure TfrmProcVentaRapida.Label22Click(Sender: TObject);
begin
 { frmConciliarNIFvsVenta:=TfrmConciliarNIFvsVenta.Create(Nil);
  try
    frmConciliarNIFvsVenta.Showmodal;
  finally
  frmConciliarNIFvsVenta.Free;
  frmConciliarNIFvsVenta:=Nil;
  end;}
end;

procedure TfrmProcVentaRapida.InsertarPolizaCliente;
begin


end;

procedure TfrmProcVentaRapida.ProcesaDatosVehiculoPoliza(_existe:boolean);
begin

end;

procedure TfrmProcVentaRapida.dbFechaIniciaPolizaExit(Sender: TObject);
var
  nT : boolean;
begin

  
end;

procedure TfrmProcVentaRapida.DBEdit16Change(Sender: TObject);
begin
  if (rxVentaNUM_IDENT.Value = '') or (rxVentaNUM_IDENT.IsNull) then exit;
  if TotalesFechaIniciaPoliza.IsNull then Exit;
    
  if ((rxVentaNUM_IDENT.AsInteger) > 0)  then
  dbFechaIniciaPolizaExit(Self);
end;

procedure TfrmProcVentaRapida.ProcSetPathlogoTipoServicio(tipo:smallint);
begin

end;

procedure TfrmProcVentaRapida.edtCodigoDblClick(Sender: TObject);
begin
  ConsultaGeneral1Click(Self);
end;

procedure TfrmProcVentaRapida.ProcFacturaRecurrente(_codCte: Integer;
  Fecha: TDateTime; _numTrn: Integer;_numfact:integer;_ruta:string;_xnumprogrec:integer);
begin

end;

procedure TfrmProcVentaRapida.DescargarVehiculoDev(numerotrn: integer);
var
  stpProcDevVeh: TIBStoredProc;
begin

end;

procedure TfrmProcVentaRapida.CerrarPrograma1Click(Sender: TObject);
begin
  if rxVenta.RecordCount = 0 then
  Application.Terminate;
end;

procedure TfrmProcVentaRapida.ImprimirEnFormatoPDF(idmodulo:integer;idreporte:integer);
begin

end;

procedure TfrmProcVentaRapida.btnAsignarVehClick(Sender: TObject);
begin

  //end;
end;

procedure TfrmProcVentaRapida.ConsultaPreventa;
begin
  if (Totalesmontorecibido.Value > 0) and (rxVenta.RecordCount > 0)
  or (rxVenta.RecordCount > 0) then
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
    TotalesSubTotal.Value:=0;
    Totalesitbis.Value:=0;
    Totalesmontodesc.Value:=0;
    Totalestotalneto.Value:=0;
    Totalesmontorecibido.Value:=0;
    Totalesdevolucion.Value:=0;
    Totalesmoneda.Value:='1';
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
      edtObservacion.Text:=frmConsultaPreVenta.qryPreventaMasterNOMBRE_CLIENTE_GENERAL.Value;
      rxPreventa.Close;
      rxPreventa.Open;
      While Not frmConsultaPreVenta.qryPreventaDet.Eof do
      begin
        if (frmConsultaPreVenta.qryPreventaDetCANTIDAD.Value > 0)
        And (frmConsultaPreVenta.qryPreventaDetSTATUS_DET.Value = 'A') then
        begin
          rxVenta.Append;
          rxVentaNumeroTrn.Value:=frmConsultaPreVenta.qryPreventaMasterNUMERO.Value;
          rxVentaMoneda.Value:='1';
          RxSpeedButton1.Visible := True;
          CargarPreventa;
          if rxVenta.State In [dsInsert,dsEdit] then
          rxVenta.Post;
          tablaPropietario.Edit;
          tablaPropietarioCodigoPropietario.Value:= frmConsultaPreVenta.qryPreventaMasterCODIGO_CTE.Value;
          Totales.Edit;
          TotalesCodigoCteDelivery.Value:=frmConsultaPreVenta.qryPreventaMasterCODIGO_CTE.Value;
          tablaPropietario.Post;
          Totales.Post;
        end;
        frmConsultaPreVenta.qryPreventaDet.Next;
      end;
    end;
  finally
  frmConsultaPreVenta.Free;
  frmConsultaPreVenta:=Nil;
  end;
end;

procedure TfrmProcVentaRapida.qryTicketPreventaMastAfterScroll(
  DataSet: TDataSet);
begin
  qryTicketPreventaDet.Close;
  qryTicketPreventaDet.Params[0].Value:=qryTicketPreventaMastNUMERO.Value;
  qryTicketPreventaDet.open;
end;

procedure TfrmProcVentaRapida.Button2Click(Sender: TObject);
begin
  BitBtn6Click(Self);
  if (rxVentaNumeroTrn.Value > 0) then
  ImprimirTicket(rxVentaNumeroTrn.Value);
end;

procedure TfrmProcVentaRapida.edtObservacionDblClick(Sender: TObject);
begin
  frmCteDelivery:=TfrmCteDelivery.Create(Nil);
  try
    if frmCteDelivery.ShowModal = mrOk then
    begin
      if Totales.State = dsBrowse then
      begin
        if  Totales.State in [dsBrowse]  then Totales.Edit;
        Totales.Edit;
        TotalesCodigoCteDelivery.Value:=dmClientes.tblClientesDeliveryCODIGO.Value;
        edtObservacion.Text:= dmClientes.tblClientesDeliveryNOMBRE.Value;
      end;
    end else
    begin
      if  Totales.State in [dsBrowse]  then Totales.Edit;
      TotalesCodigoCteDelivery.Value := -1;
    end;
  finally
  frmCteDelivery.free;
  frmCteDelivery:=nil;
  end;

end;

procedure TfrmProcVentaRapida.ProcAsignaNumLote(codProd: string);
begin
  dmInventario.qryLote.Close;
  dmInventario.qryLote.Params[0].Value:= codProd;
  dmInventario.qryLote.Open;
  dmInventario.qryLote.first;
  if dmInventario.qryLote.Recordcount > 1 then
  begin
    frmShowLote:=TfrmShowLote.Create(Nil);
    try
      if frmShowLote.Showmodal = mrOk then
      begin
        if rxVenta.State in [dsBrowse] then rxVenta.Edit;
        rxVentaloteNum.Value:= dmInventario.qryLoteLOTE_NUM.Value;
      end;
    finally
    frmShowLote.Free;
    frmShowLote:=Nil;
    end;
  end else
  begin
    if rxVenta.State in [dsBrowse] then rxVenta.Edit;
    if not dmInventario.qryLoteLOTE_NUM.IsNull then
    rxVentaloteNum.Value:= dmInventario.qryLoteLOTE_NUM.Value;
  end;
end;

procedure TfrmProcVentaRapida.rxVentaAfterScroll(DataSet: TDataSet);
begin
  if not rxVentaCodArticulo.IsNull then
  begin
    QryPrecios.Close;
    QryPrecios.Params[0].Value:=rxVentaCodArticulo.Value;
    QryPrecios.Open;
  end;
end;

procedure TfrmProcVentaRapida.btnPresupuestoClick(Sender: TObject);
begin
  frmPresupuestoVta:=TfrmPresupuestoVta.Create(nil);
  try
    frmPresupuestoVta.showmodal;
  finally
  FreeAndNil(frmPresupuestoVta);
  end;
end;

end.

