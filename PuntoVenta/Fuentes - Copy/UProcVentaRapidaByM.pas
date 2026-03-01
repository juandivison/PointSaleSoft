unit UProcVentaRapidaByM;
//UFormConsignacion

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, RXDBCtrl, DBCtrls,
  Printers, DB, Mask, RxMemDS, EditNew, IBCustomDataSet, IBQuery, WinSkinData, Menus,
  ShellApi, RXCtrls, IBStoredProc, IBSQL, RxLookup, RXSpin, OleServer,
  ExcelXP, comObj, rxToolEdit, RxDBComb, IBTable, ComCtrls;

type
  TfrmProcVentaRapidaByM = class(TForm)
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
    DBEdit12: TDBEdit;
    rxVentaCantPax: TCurrencyField;
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
    procedure ReImprimeDocFiscal1Click(Sender: TObject);
    procedure Cancelar1Click(Sender: TObject);
    procedure CirreZ1Click(Sender: TObject);
    procedure CierreX1Click(Sender: TObject);
    procedure Estatus1Click(Sender: TObject);
    procedure DBEdit10Exit(Sender: TObject);
    procedure RxDBLookupCombo3Exit(Sender: TObject);
    procedure chKDescuentoGlobalClick(Sender: TObject);
    procedure DBEdit11Change(Sender: TObject);
    procedure FormClick(Sender: TObject);
    procedure RecuperaTicketfiscal1Click(Sender: TObject);
    procedure DBEdit11Exit(Sender: TObject);
    procedure DBEdit10Enter(Sender: TObject);
    procedure rxVentaBeforeEdit(DataSet: TDataSet);
    procedure DBRadioGroup1Click(Sender: TObject);
    procedure DBEdit9Exit(Sender: TObject);
    procedure DBEdit11Enter(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure BitBtn27Click(Sender: TObject);
    procedure BitBtn28Click(Sender: TObject);
    procedure ConciliarNIF1Click(Sender: TObject);
    procedure CancelarTicket1Click(Sender: TObject);
    procedure RxDBLookupCombo3Change(Sender: TObject);
    procedure StatusBarClick(Sender: TObject);
    procedure VerDetalleVenta1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CheckBox1Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure VerTipoComprobantes1Click(Sender: TObject);
    procedure RxDBLookupCombo1Change(Sender: TObject);
    procedure tablaPropietarioAfterOpen(DataSet: TDataSet);
    procedure rxVentaAfterClose(DataSet: TDataSet);
    procedure ListarPuertosCom1Click(Sender: TObject);
    procedure DBEdit1Change(Sender: TObject);
    procedure DBEdit2Change(Sender: TObject);
    procedure Alquiler1Click(Sender: TObject);
    procedure RxSpinEdit1Exit(Sender: TObject);
    procedure tablaPropietarioBeforePost(DataSet: TDataSet);
    procedure Lavanderia1Click(Sender: TObject);
    procedure LavanderiaEntrada1Click(Sender: TObject);
    procedure Costura1Click(Sender: TObject);
    procedure CosturaEntrada1Click(Sender: TObject);

  private
    procedure ActivarBotonesEnModifica;
    procedure CargarDatosAModificar;
    //movido a dmCalculos
    //procedure ProcesarSumaTotal;
    procedure SetMontoNotaCredito;
    procedure CalcularDescIndirecto;
    procedure ProcesaNuevo;
    procedure InsertarDet(numero : Integer);
    procedure InsertarCotizacionDet(numero : Integer);
    procedure InsertarCotizacionDetUpd(numero : Integer;serie:Integer);
    //movido a UDatModCalculos = dmCalculos
    //procedure ProcesaCalculos;
    procedure ProcCargaDatosCotizacion;
    procedure ProcCalculoDivisa;
    Procedure PrepararInfoFiscal(numerotrn:integer);
    Procedure PrepararInfoFiscalNCR(numerotrn:integer);

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


    procedure ProcInsertarVtaMastCashEnDev(var NumTrnGen : Integer; var NumOrden : Integer);
    procedure InsertarDetDevolucionCash(numero : Integer);

    //Procsa devolucion de 1 o varios productos de una factura;
    //t procedure ProcesarDevolucion;

    Function BuscarRutaImagen(codProducto : Integer):String;
    procedure ProcInsertarDetPagos(numtrn : integer);
    procedure ProcInsertarDetCheque(numtrn : integer);
    procedure ProcInsertarDetBono(numtrn : integer);

    procedure DescargaNotaCredito;
    Procedure SetPrecioPorCantidad;
    function VerificaRecordsVenta:boolean;
    Procedure ProcesaEstadoImpresora;
    procedure ProcSetNCFCliente;
    procedure ImprimeFiscalContado(xNumeroTrn:Integer);
    Procedure ReactivarValores;

    Procedure ProcesarCalculoAlterno;
    Procedure FInsertarDatosCtrlNIF(_numerotrnvta:Integer);

    Procedure ProcEntradaCliente;
    //function GetMonedaProducto(codigo:Integer):String;
    Procedure ImprimeDocumento(serieDoc:integer);
    Procedure ProcActualizaMsg;
    Procedure ProcGetUltNcf(tipo:string);
    Procedure ProcGetDatosDevparaNotaCR;

    procedure AsignaNCFCFinalX(TIPO_NCF_IFISCAL : integer);overload;

    procedure ReimprimirFacturaNoFiscal(numTRN : Integer);
    procedure LlenarrxSolDatoscte(codCte:integer);
    Function CheckPortComDisponible:boolean;

    procedure ReImpDevolucion(numDev : Integer;var _flag : boolean);

    procedure ProcDevoluconCash;
    procedure UpdateServINFO(numVta : integer);
    procedure UpdateServAlquiler(numVta : integer);

  public
    NoTieneCredito :  boolean;
    NumTrnServ : integer;
    NumTrnServAlq : integer;
    sumarDatos  : Boolean;
    AbortarPostServTaller : boolean;
    canCloseAlquiler: boolean;
    //tblRegServicioMasterNUM_TRNVENTA
    Function VerificaLimiteCredito(codigocte:integer;MontoVenta:Real):Boolean;
    procedure AsignaNCFCFinal;
  end;

Const
  FormaPagoNotaDebito = 6;//Devolucion
  TipoPagoFactura = 7;//Factura-Credito
  //PORC_TRANSP_ITBIS = 16/1.16;//13.79;
var
  frmProcVentaRapidaByM: TfrmProcVentaRapidaByM;
  recuperando : Boolean;
  TipoVenta : String;
  xCodigoCte : Integer;
  xSalir, Prod_existe: boolean;
  EsFinanciamiento : Boolean = false;
  EsFactura  : Boolean = false;
  BuscandoPorDesc: Boolean = false;

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
    esContado : boolean;
  numerodocReimp : Integer;
  NumeroTrn : Integer;
  _abortar, EsBrowsing, EsEditando : Boolean;
  LlenandoDatos : Boolean;
  precioSum : Currency;
  procCalc : Boolean;
  _ulttrnImp : string;
    pesoProd: String;


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
  UQckFactCredArtioffice8_5_F_1_bym, UQckCotiza8_5_F_1ByM, UfrmBuscarNIF, UCoreOCXFiscal,
  UVerDataImpIFiscal, UFormSelTasaITBIS, UFormCalculosVentaActiva,UImprimeCotizaFiscal,
  UProcCierreJornada, UDatModCalculos, UTemporalVtaForm,
  UFormConsultaDatosVenta, UConciliarNIF, UActivapermisos,
  UFormVerDetalleVta, UQckFactCredArtioffice8_5_F_1Std,
  URepRecibo8_5_11DevolREspinal, URepRecibo8_5_11REspinalReimp,
  frmVerComprobantes, UFormPuertosLibres, UQckCotiza8_5_FormG,
  UCtrlAlquiler, URepComprobanteDevol, UCtrlEnvioaLavanderia,
  URepComprobanteReimp;

{$R *.dfm}

  function esNumero(valor:String):Boolean;
  begin
    if (Valor[1] =  '0') or (Valor[1] =  '1') or (Valor[1] =  '2')
    or (Valor[1] =  '3') or (Valor[1] =  '4') or (Valor[1] =  '5')
    or (Valor[1] =  '6') or (Valor[1] =  '7')
    or (Valor[1] =  '8') or (Valor[1] =  '9') then
    result:= True else result:= False;
  end;

procedure TfrmProcVentaRapidaByM.LlenarrxSolDatoscte(codCte:integer);
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
procedure  TfrmProcVentaRapidaByM.FInsertarDatosCtrlNIF(_numerotrnvta:Integer);
begin
  tblnif_ctrl.Close;
  tblnif_ctrl.Params[0].Value := _numerotrnvta;
  tblnif_ctrl.Open;
  if not tblnif_ctrl.Locate('NUMERO_TRN',_numerotrnvta,[]) then
  begin
    tblnif_ctrl.Insert;
    tblnif_ctrlNUMERO_TRN.Value:= _numerotrnvta;
    tblnif_ctrlFECHA_IN.Value := now;
    tblnif_ctrlSTATUS.Value := 'T';
    GlbSalvarQuery(tblnif_ctrl);
  end;
end;

procedure TfrmProcVentaRapidaByM.BitBtn4Click(Sender: TObject);
var
  serie_asignadoncf : integer;
  valorNCF : String;
  showNcfwindows : Boolean;
  genNcf : Boolean;
  flag : Boolean;
  pulgadaInc : Real;
begin
  esContado:=True;
  BitBtn4.Enabled:=False;
  if (Totalesdevolucion.Value > 2000) then
  begin
    if MessageDlg('MONTO CAMBIO PARECE QUE ES MUY ALTO, VERIFIQUE. '#13'ESTA CORRECTO?', mtError, [mbyes, mbno], 0) =mrno then
    begin
      Edit1.SelectAll;
      if isShowing then
      Edit1.SetFocus;
      BitBtn4.Enabled:= True;
      Exit;
    end;
  end;

  if (TotalesSubTotal.Value <= 0) then
  begin
    MessageDlg('Total venta no puede ser cero, verifique.', mtError, [mbOk], 0);
    BitBtn4.Enabled:= True;
    Exit;
  end;
  //Generar y asignar Numero de Comprobante Fiscal
  if (Edit1.Text = '') And (Not EsDevolucion) then
  begin
    Raise Exception.Create('Favor indicar monto pago');
    if isShowing then
    edit1.SetFocus;
    BitBtn4.Enabled:= True;
    Exit;
  end;

  if tablaPropietario.State in [dsInsert, dsEdit] then
  tablaPropietario.Post;

  if (GlbActivaIFiscal <> 1 ) And (CheckBox1.Checked) then
  begin
    if TotalesTipoNCF.IsNull then
    begin
      MessageDlg('Favor indicar tipo comprobante', mtWarning, [mbOk], 0);
      BitBtn4.Enabled:= True;
      Exit;
    end;
    if ((tablaPropietario.RecordCount = 0) Or (tablaPropietarioCodigoPropietario.Value = 0)
     Or (tablaPropietarioCodigoPropietario.IsNull)) And
        (TotalesTipoNCFIFiscal.Value In [1,4,5]) then
    begin
      MessageDlg('Favor asignar cliente', mtInformation, [mbOk], 0);
      BitBtn4.Enabled:= True;
      Exit;
    end;
  end;

  if (TotalesTipoNCFIFiscal.Value < 0) then
  begin
    MessageDlg('Verifique tipo NCF', mtError, [mbOk], 0);
    BitBtn4.Enabled:= True;
    Exit;
  end;
  AbortarPostServTaller:=False;
  if (GlbActivaIFiscal = 1 ) then 
  begin
    if ((tablaPropietario.RecordCount = 0) Or (tablaPropietarioCodigoPropietario.Value = 0)) And
        (TotalesTipoNCFIFiscal.Value In [1,4,5]) then
    begin
      if MessageDlg('Cliente no asignado, desea crearlo?', mtInformation, [mbYes,mbNo], 0)=mrYes then
      begin
        if (GlbActivaIFiscal = 1) And (tablaPropietarioCodigoPropietario.IsNull) then
        begin
          ProcEntradaCliente;
          if tablaPropietarioCodigoPropietario.IsNull then
          begin
            MessageDlg('Se requiere RNC/Cedula para tipo comprobante seleccionado, verifique. ', mtError, [mbok], 0);
            BitBtn4.Enabled:= True;
            Exit;
          end;
        end;
      end;
      if isShowing then
      RxDBLookupCombo1.SetFocus;
      BitBtn6.Enabled := True;
      Exit;
    end;

    frmPuertosLibres:= TfrmPuertosLibres.Create(nil);  
    frmPuertosLibres.VerificarPuertosLibres;
    if Not GlbPuertoDisponible then
    begin
      MessageDlg('Puerto ' + 'COM' + IntToStr(GlbPuerto) + ' no esta libre, verifique.', mtWarning, [mbOk], 0);
      BitBtn4.Enabled:= True;
    end;
    frmPuertosLibres.Free;
    frmPuertosLibres := Nil;
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

  if (GlbActivaIFiscal = 1) And (tablaPropietarioCodigoPropietario.IsNull) then
  begin
    ProcEntradaCliente;
    if tablaPropietarioCodigoPropietario.IsNull then
    begin
      MessageDlg('Se requiere RNC/Cédula para tipo comprobante seleccionado, verifique. ', mtError, [mbok], 0);
      BitBtn4.Enabled:= True;
      Exit;
    end;
  end;

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
  if TotalesMontoNCRAplicado.Value > 0 then
  DescargaNotaCredito;

    frmSelNCF:=TfrmSelNCF.Create(Self);
    try
      if Not EsDevolucion then
      begin
        if RxDBLookupCombo3.Visible then
           dmFactura.ibQryViewNCF.Locate('TIPO_CF', TotalesTipoNCF.Value,[])
        else
        dmFactura.ibQryViewNCF.Locate('TIPO_CF','02',[]); //Factura Consumidor Final
      end else
      dmFactura.ibQryViewNCF.Locate('TIPO_CF','04',[]);//Nota Credito

      if (GlbNCFConfFinal = 0)  and Not NoGenerarNCF1.Checked then
      begin
        showNcfwindows:= True;
      end else
      begin
        if NoGenerarNCF1.Checked then  //no imprime NCF
        showNcfwindows := false;

        if (GlbActivaIFiscal = 1 ) then
        begin
           showNcfwindows:=False;

           if TotalesTipoNCF.IsNull then
           begin
             MessageDlg('Favor indicar tipo comprobante.', mtInformation, [mbok],0);
             if isShowing then
             RxDBLookupCombo3.SetFocus;
             BitBtn4.Enabled:= True;
             Exit;
           end else
           begin
             if tablaPropietarioCodigoPropietario.IsNull then
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
           end;
         end;

        if showNcfwindows then
        begin
          if RxDBLookupCombo3.Visible then
          dmFactura.ibQryViewNCF.Locate('TIPO_CF',TotalesTipoNCF.Value,[]);
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
     if (GlbActivaIFiscal = 1 ) then
     ShowNcfwindows:= True;

     TotalesTipoNCF.Value;
     TotalesTipoNCFIFiscal.Value;
     dmFactura.ibQryViewNCFTIPO_NCF_IFISCAL.Value;
     if showNcfwindows then
     begin
       if dmFactura.ibQryViewNCF.Locate('TIPO_CF;tipo_ncf_ifiscal',
       VarArrayOf([TotalesTipoNCF.Value,TotalesTipoNCFIFiscal.Value]), []) then
       if (GlbNCFConfFinal = 0) And (TotalesTipoNCF.IsNull) then
       begin
         if frmSelNCF.ShowModal = mrok then
         genNcf:= True
         else
         begin
           genNcf:= False;
           Totales.Edit;
           TotalesTipoNCF.AsVariant:= null;
           TotalesTipoNCFIFiscal.AsVariant:= null;
           Totales.Post;
         end;
       end else genNcf:= true;
     end else
     if Not showNcfwindows And (GlbActivaIFiscal = 0) then
     begin
       if RxDBLookupCombo3.Visible then
       dmFactura.ibQryViewNCF.Locate('TIPO_CF',TotalesTipoNCF.Value,[]);

       if frmSelNCF.ShowModal = mrok then
       begin
         genNcf:= True;
         if Totales.State = dsBrowse then
         begin
           Totales.Edit;
           TotalesTipoNCF.Value := dmFactura.ibQryViewNCFTIPO_CF.Value;
           TotalesTipoNCFIFiscal.Value := dmFactura.ibQryViewNCFTIPO_NCF_IFISCAL.Value;
           Totales.Post;
         end;
       end else
       begin
         genNcf:= False;
         Totales.Edit;
         TotalesTipoNCF.AsVariant:= null;
         TotalesTipoNCFIFiscal.AsVariant:= null;
         Totales.Post;
       end;
     end;

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
           RxDBLookupCombo3Change(Self);
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
       //end;
      //end;
     finally
     //t frmSelNCF.Free;
     //t frmSelNCF:= Nil;
    end;

  ibstpProcSecuencia.Params[2].Value := 4;

  ipStpInsertVentMast.Params[1].Value := GlbFechaTrnDiaria;
  ipStpInsertVentMast.Params[2].Value := GlbCodigoCia;
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
  ipStpInsertVentMast.Params[8].Value    := Totalestotalneto.Value; //EditN1.Text;
  ipStpInsertVentMast.Params[9].Value    := 'A';
  ipStpInsertVentMast.Params[10].Value   := Now;
  ipStpInsertVentMast.Params[11].Value   := Null;
  ipStpInsertVentMast.Params[12].Value   := Null;
  ipStpInsertVentMast.Params[13].Value   := Null;
  ipStpInsertVentMast.Params[14].Value   := Null;
  ipStpInsertVentMast.Params[15].Value   := ibstpProcSecuencia.Params[0].Value;

  ipStpInsertVentMast.Params[17].Value   := TotalesSubTotal.Value;
  ipStpInsertVentMast.Params[18].Value   := TotalesPorcDesAdicional.Value;
  if TotalesMontoDescAdicional.Value > 0 then
  ipStpInsertVentMast.Params[19].Value   := TotalesMontoDescAdicional.Value
  else
  ipStpInsertVentMast.Params[19].Value   := TotalesMontoDescItems.Value;
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
  ipStpInsertVentMast.Params[35].Value:= TotalesRecargo.Value;

  ipStpInsertVentMast.Params[37].Value:= TotalesMontoExoneraITBIS.Value;
  ipStpInsertVentMast.Params[38].Value:= 0;

  if Serie_asignadoncf > 0 then
  begin
    ipStpInsertVentMast.Params[16].Value  := Serie_asignadoncf;
      ipStpInsertVentMast.Params[36].Value:= TotalesTipoNCFIFiscal.Value;
  end else
  begin
    ipStpInsertVentMast.Params[16].Value:= Null;
    ipStpInsertVentMast.Params[36].Value:= Null;
  end;

  ipStpInsertVentMast.ExecProc;
  numeroTrnVta:= ipStpInsertVentMast.Params[0].Value;
  if Assigned(frmRegServicioTaller) then
  UpdateServINFO(ipStpInsertVentMast.Params[0].Value);
  if Assigned(frmAlquiler) then
  UpdateServAlquiler(ipStpInsertVentMast.Params[0].Value);

  if Not ipStpInsertVentMast.Transaction.InTransaction then
  ipStpInsertVentMast.Transaction.StartTransaction;
  try
    ipStpInsertVentMast.Transaction.CommitRetaining;
  except
  ipStpInsertVentMast.Transaction.RollbackRetaining;
  end;
  numeroTrnVta:= ipStpInsertVentMast.Params[0].Value;

  //tblNiv_ctrl
  FInsertarDatosCtrlNIF(numerotrnvta);

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
  //Procesar pagos
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
    ibStpActualizaInvProd.Params[2].Value     := 0  //tipoTrn
    else ibStpActualizaInvProd.Params[2].Value:= 1; //ingresar al inventario
    ibStpActualizaInvProd.Params[3].Value     := 1; //porCodigo
    if (rxVentaInvetariar.Value <> 0) And (GlbCodDivInventario = 1 ) then
    ibStpActualizaInvProd.ExecProc;   //ctualiza inventario

    if (rxVentaTipoVenta.Value = 0) Or (rxVentaTipoVenta.IsNull ) then //Item de Venta
    ActualizaInvAlmacen;//Actualiza Division Inventario
    rxVenta.Next;
  end;
  rxVenta.First;
  //RxDBGrid2.DisableScroll;
  sumarDatos:=False;
  //RxDBGrid2.Visible:= False;
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
    try
      reciboImpreso:=False;
      ImprimeFiscalContado(NumeroTrn);
      Estatus1Click(Self);
    except
    end;

    if Not reciboImpreso then
    begin
      if MessageDlg('Recibo no fue impreso, intentar de nuevo?',mtError,[mbYes,mbNo],0) = mryes then
      begin
        try
          stpProcRecDatosReimpfiscal.Params[1].Value:= NumeroTrn;
          stpProcRecDatosReimpfiscal.ExecProc;
          numerotrn := stpProcRecDatosReimpfiscal.Params[0].Value;
          ImprimeFiscalContado(NumeroTrn);
        except
        MessageDlg('Error en segundo intento impresión recibo, verifique impresora.',mtError,[mbNo],0);
        end;
      end;
      qryVerificaReciboPdte.Close;
      qryVerificaReciboPdte.Open;
      qryVerificaReciboPdte.last;
    if (qryVerificaReciboPdte.RecordCount > 1) then
    begin
      MessageDlg('Existe mas de un record pendiente impresion ticket, '#13' verifique antes de registrar ventas.',mtError,[mbok], 0);
    end else
    if (qryVerificaReciboPdte.RecordCount > 0) then
    begin
      if MessageDlg('Ticket '+qryVerificaReciboPdteNUMERO.AsString+' no fue impreso, intentar de nuevo?',mtError,[mbYes, mbNo],0) = mrYes then
      ImprimeFiscalContado(qryVerificaReciboPdteNUMERO.Value);
    end;
    end;
    Estatus1Click(Self);
    if (GlbActivaIFiscal = 1) then
    Delay(1000);
    qryVerificaReciboPdte.Close;
    qryVerificaReciboPdte.Open;
    qryVerificaReciboPdte.First;
    if (qryVerificaReciboPdte.RecordCount > 1) then
    begin
      MessageDlg('Existe mas de un record pendiente impresion ticket, '#13' verifique antes de registrar ventas.',mtError,[mbok], 0);
      exit;
    end;
    if (qryVerificaReciboPdte.RecordCount > 0) then
    begin
      RecuperaTicketfiscal1Click(Self);
    end;
    ProcActualizaMsg;
    //BitBtn4.Enabled:= True;
  end else
  if (GlbRec55Pulg = 1) then
  begin
    if (UpperCase(GLBFormatoFactura) = 'CASANDRA2') then  //PENDIENTE DE ANALISIS
    begin
      frmConsultaFacturas:=TfrmConsultaFacturas.Create(Nil);
      try
        if (TipoVenta = 'CONTADO') then
        Begin
          frmConsultaFacturas.EditN1.SetInteger(dmReportes.qryViewVentasMastNUMERO_DOC_PAGO.AsInteger);
          frmConsultaFacturas.rdgContado.Checked := True;
        end else
        begin
          if (TipoVenta = 'CREDITO') then
          frmConsultaFacturas.rdgCredito.Checked := True;
          frmConsultaFacturas.EditN1.SetInteger(dmReportes.qryViewVentasMastNUMERO_FACTURA.VALUE);
          frmConsultaFacturas.rdgContado.Checked := True;
        end;
        //frmConsultaFacturas.EditN1.SetInteger(NumeroTrn);
        frmConsultaFacturas.BitBtn1Click(Self);
        LlenarrxSolDatoscte(dmFactura.qryVentaFacturaCODIGO_CTE.Value);
        if dmFactura.qryVentaFactura.RecordCount = 1 then
        begin
          qckRepRecibo8_5_11REspReimp :=TqckRepRecibo8_5_11REspReimp.Create(nil);
          try
            if EsDevolucion then
            begin
              //if EsModificandoFactura then
              //qckFactCredArtioffice8_5_F_1Std.qrLabelFactOrigen.Caption:='#Factura: '+IntToStr(UProcesarDevolucion.numeroFactura);
              qckRepRecibo8_5_11REspReimp.xtipoVenta:= TipoVenta;
            end;
            qckRepRecibo8_5_11REspReimp.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;
            qckRepRecibo8_5_11REspReimp.qrtipoVenta.Caption:= '';
            if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
            begin
              qckRepRecibo8_5_11REspReimp.PrinterSetup;
              qckRepRecibo8_5_11REspReimp.Print;
            end else
            qckRepRecibo8_5_11REspReimp.Preview;
          finally
          qckRepRecibo8_5_11REspReimp.free;
          qckRepRecibo8_5_11REspReimp:=Nil;
          end;
        end;
        finally
        frmConsultaFacturas.Free;
        frmConsultaFacturas:=Nil;
        end;
      end else
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
          qckFactServArtioffice8_5.TPag.Caption:=
          IntToStr(qckFactServArtioffice8_5.PageNumber);
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
  tablaPropietario.EmptyTable;
  tablaPropietario.Edit;
  tablaPropietarioCodigoPropietario.AsVariant := null;
  tablaPropietario.Post;
  //t Edit1.Text := ''; Ene-31-2010

  edtCodigo.Text := '';
  BitBtn4.Enabled := False;
  if isShowing then
  BitBtn1.SetFocus;

  //t Totales.EmptyTable; Ene-31-2010

  //EsDevolucion := False;
  Caption:='Proceso Venta';

  //NoGenerarNCF1Click(Self);
  if isShowing then
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
  chKDescuentoGlobal.Checked:= False;
  rxSolDatoscte.EmptyTable;
  
  //VerificaImpresoraFiscalM;
  if (GlbActivaIFiscal = 1 ) then
  begin
    ProcesaEstadoImpresora;
    ProcGlbSecuenciaNCF;
  end;
  if Assigned(frmPagosCombinados) then
    FreeAndNil(frmPagosCombinados);
  Refresh;
  if (NumTrnServ = -1) then
  begin
    Hide;
    frmRegServicioTaller.BringToFront;
    NumTrnServ := 0;
  end;
  if (NumTrnServAlq = -1) then
  begin
    if Assigned(frmAlquiler) then
    begin
      Hide;
      frmAlquiler.BringToFront;
    end;
    NumTrnServAlq:= 0;
  end;
end;

procedure TfrmProcVentaRapidaByM.ProcActUltTrn;
begin
  stpProcBuscarUltNum.Params[2].Value := glbCia_Key;
  stpProcBuscarUltNum.ExecProc;
  RxLabel1.Caption:='Ult. #Fact:'+ stpProcBuscarUltNum.params[1].AsString;
  RxLabel2.Caption:='Ult. #Trans:'+ stpProcBuscarUltNum.params[0].AsString;
end;

procedure TfrmProcVentaRapidaByM.FormCreate(Sender: TObject);
begin
  //Ancho := 800;//1366;//1280; // Ancho del diseño
  //Alto  := 600;//768
  {  Height := Height * Screen.Height Div Alto;
   Width := Width * Screen.Width Div Ancho;
   ScaleBy(Screen.Width, Ancho);
  }
  //t sumarDatos:=true;
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

  label25.Visible := False;
  if (GlbImprimeReciboFact = 0) then
  begin
    label25.Caption := 'No Imp Rcbo';
    label25.Visible := True;
  end else
  label25.Caption := '';

  Panel3.Visible:=True;
  EsDevolucion:=False;
  NoGenerarNCF1Click(Self);
  if (GlbActivaIFiscal = 1) then
  begin
    if not CheckPortComDisponible then
    begin
      lblStatusImpFiscal.Visible:=True;
      lblStatusImpFiscal.Font.Color:= clRed;      
    end;
    qryVerificaReciboPdte.Close;
    qryVerificaReciboPdte.Open;
    qryVerificaReciboPdte.Last;
    qryVerificaReciboPdte.First;
    qryVerificaReciboPdte.SQL.Text;
    if (qryVerificaReciboPdte.RecordCount > 1) then
    begin
      MessageDlg('Existe uno o mas records pendiente impresion ticket, '#13' verifique antes de registrar ventas.',mtError,[mbok], 0);
    end;

    dmReportes.qryDatosCajaImpUser.Close;
    dmReportes.qryDatosCajaImpUser.Params[0].Value:= VarUsuarioGlb;
    dmReportes.qryDatosCajaImpUser.Open;
    dmReportes.qryDatosCajaImpUser.Last;
    dmReportes.qryDatosCajaImpUser.RecordCount;

    lblStatusImpFiscal.Visible:= False;
    lblStatusImpFiscal.Font.Color:= clRed;

    Application.ProcessMessages;

    label46.Visible:= False;
    RxDBLookupCombo3.Visible:= False;

    RxSpeedButton1.Visible:=False;
    CheckBox2.Visible := False;
    CheckBox3.Visible := False;
    BitBtn19.Visible  := False;
    BitBtn18.Visible  := False;
    BitBtn23.Visible  := False;
    rdgFactServicio.Visible := False;
    rdgFactVentaProducto.Visible := False;
    chkExento.Visible := False;
    Delay(1000);
    ProcesaEstadoImpresora;
  end else //not fiscal
  begin
    chkExento.Visible := True;
    Panel3.Visible := False;
    Button1.Visible:= False;
    Button2.Visible:= True;
    DBRadioGroup1.Visible := False;
    BitBtn19.Visible := False;

    if (GlbPermiteVtaServicioAdc = 1) then
    begin
      BitBtn23.Left := BitBtn19.Left;
      BitBtn23.Top  := BitBtn19.Top;
      BitBtn23.Visible:=True;
      BitBtn23.BringToFront;
      BitBtn19.Visible := False;
      BitBtn19.SendToBack;
    end;
  end;
    rxdbgridTestTipofiscal.Visible := False;
    rxdbgridTestTipofiscal.SendToBack;

    imbBarcode.Visible    := LectorCodBarra1.Checked;
    bitBtnEditarFact.Left := BitBtn6.Left;
    rxVenta.Close;
    rxVenta.EmptyTable;
    rxVenta.Open;
    tablaPropietario.EmptyTable;
    Totales.EmptyTable;
    ActualizarRecoverData;
    EsModificandoFactura := False;
    GlbUsandoCotiza      := False;
    bitBtnEditarFact.Visible := False;
    bitBtnEditarFact.Top := 475;
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
    tablaPropietario.EmptyTable;
    dmCompania.tblCompania.Close;
    dmCompania.tblCompania.Open;
    dmCompania.tblCompania.Locate('codigo', glbCia_Key,[]);
    Label10.Caption:= DateToStr(GlbFechaTrnDiaria);
    dmUsuarios.qryEmpleados.Close;
    dmUsuarios.qryEmpleados.Open;
    dmUsuarios.qryEmpleados.Locate('CODIGO', VarUsuarioGlb,[]);
    Label12.Caption:= dmUsuarios.qryEmpleadosNOMBRE.Value;
    Totales.Close;
    Totales.Open;
    Totales.Insert;
    if (GlbMonedaBase > 0) then
    TotalesMoneda.Value   := IntToStr(GlbMonedaBase)
    else
    TotalesMoneda.Value   := '1';
    TotalesSubTotal.Value := 0;
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
      BitBtn11.Visible := False;
      BitBtn12.Visible := False;
      //BitBtn15.Top     := 401;
    end;

    if (GlbActF10CodBarra = 1) then
       LectorCodBarra1Click(Self);
    qryVence.close;
    qryVence.open;

    if (UpperCase(GLBFormatoFactura) = 'TRIPLETASSO') then
    BitBtn19.Visible:=True
    else
    BitBtn19.Visible:=False;

    dmFactura.ibQryViewNCF.Close;
    if dmFactura.ibQryViewNCF.Prepared then
    dmFactura.ibQryViewNCF.UnPrepare;
    dmFactura.ibQryViewNCF.SQL.Text := dmFactura.ibQryViewNCF_0.SQL.Text;
    label46.Visible:= True;
    RxDBLookupCombo3.Visible:= True;
    if Not dmFactura.ibQryViewNCF.Prepared then
    dmFactura.ibQryViewNCF.Prepare;

    dmFactura.ibQryViewNCF.Open;
    if qryVence.RecordCount > 0 then
    begin
      SecretPanel1.Visible:=true;
      SecretPanel1.Lines.Clear;
      While Not qryVence.Eof Do
      begin
        SecretPanel1.Lines.Add(qryVenceDESCRIPCION_PRODUCTO.Value+' - '+
        qryVenceDIASPORVENCER.AsString);
        qryVence.Next;
      end;
      SecretPanel1.Visible:= True;
      SecretPanel1.Active := True;
    end;
  if (GlbActivaIFiscal = 1) then
  begin
    ReImprimeDevolucionsinFact1.Visible := False;
    ReImprimirRecibo1.Visible := False;
    NoGenerarNCF1.Visible := False;
    NCFSinValorFiscal1.Visible := False;
    ReImprimeFacturaContado1.Visible := False;
    //Controlar error en impresion de recibo, cuando se produce falla por corte de energia u otros
    qryVerificaReciboPdte.Close;
    qryVerificaReciboPdte.Open;
    qryVerificaReciboPdte.Last;
    qryVerificaReciboPdte.First;
    qryVerificaReciboPdte.SQL.Text;
    if (qryVerificaReciboPdte.RecordCount > 1) then
    begin
      MessageDlg('Existe mas de un record pendiente impresion ticket, '#13' verifique antes de registrar ventas.',mtError,[mbok], 0);
      exit;
    end;
    //if (qryVerificaReciboPdte.RecordCount > 20000) then //temporal
    //Begin
      if (qryVerificaReciboPdteFORMA_PAGO.Value = 1) then //Contado
      ImprimeFiscalContado(qryVerificaReciboPdteNUMERO.Value);
    //End;

  end;
end;
procedure TfrmProcVentaRapidaByM.InicializaOtrosDesc;
begin
  dmfactura.stpInsertPorcOtrosCargosFServ.Params[1].Value := 0;
  dmfactura.stpInsertPorcOtrosCargosFServ.Params[2].Value := 0;
  dmfactura.stpInsertPorcOtrosCargosFServ.Params[3].Value := 0;
  dmfactura.stpInsertPorcOtrosCargosFServ.Params[4].Value := 0;
  dmfactura.stpInsertPorcOtrosCargosFServ.Params[5].Value := 0;
  dmfactura.stpInsertPorcOtrosCargosFServ.Params[6].Value := 0;
end;
procedure TfrmProcVentaRapidaByM.edtCodigoChange(Sender: TObject);
begin
  if rxVenta.State = dsBrowse then
  if Not rxVentaSerie.IsNull then
     rxVenta.Last;
  rxLabelVence.Visible:= False;
  if LectorCodBarra1.Checked then Exit;
  BuscandoPorDesc:=False;

  if (edtCodigo.Text = '') then Exit;
  //sqlAsignado:=False;
  if IsNumerico(edtCodigo.Text) then
  begin
    if Not sqlAsignado then
    AsignarSqlText('','','');
    if qryProductos.State = dsInactive then
    qryProductos.Open;
    //if rxqryInv.Locate('Codigo_Texto', edtCodigo.Text,[loCaseInsensitive, loPartialKey]) then
    if qryProductos.Locate('Codigo', StrtoInt(edtCodigo.Text), [loCaseInsensitive, loPartialKey]) then
    begin
      qryProdPorProveedor.Close; //qryProductosCodigo.value
      qryProdPorProveedor.Params[0].Value:= qryProductosCODIGO.Value;
      qryProdPorProveedor.Open;
      dmInventario.qryTipoUnidad.Locate('IDUNIDAD',qryProductosTIPO_UNIDAD.Value ,[]);
      cboxTipoUnidad.Text:=dmInventario.qryTipoUnidadDescripcion.Value;
      if qryVence.Locate('codigo', qryProductosCodigo.Value,[]) then
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
    AsignarSqlText('descripcion', chr(39) + '%' + edtCodigo.Text +'%'+chr(39),'');
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

procedure TfrmProcVentaRapidaByM.edtCodigoExit(Sender: TObject);
var
  numero : Integer;
  FExiste : Boolean;
begin
  //dmCalculos.esFeedback :=False;
  if (Pos('Cotización',label36.Caption) <= 0 )  then
  EsModificandoCotiza:=False;

  if LectorCodBarra1.Checked then
  begin
    //if Not sqlAsignado then
    pesoProd :='';
    if (Length(edtCodigo.Text) >= 12) then
    edtCodigo.Text:= GLBObtenerCodigoProdEAN13(edtCodigo.Text, pesoProd);
    //if (Length(pesoProd) > 0) then
    //rxVentaCant.Value := StrTofloat(pesoProd);

    AsignarSqlText('','','');
    if qryProductos.Locate('CODIGO_BARRA', edtCodigo.Text,[loCaseInsensitive, loPartialKey]) then
    begin
       edtCodigo.Text := qryProductosCODIGO.AsString;
       noExiste := False;
    end;
  end;
  if (Length(edtcodigo.Text) > 0) And (uppercase(qryProductosCodigo_Texto.Value) <> uppercase(edtCodigo.text)) And ( noExiste ) and (not Panel2.Visible) then
  begin
    MessageDlg('Código producto no encontrado, verifique', mtInformation, [mbOK], 0);
    if Not Assigned(frmProcVentaRapidaByM) Then
      if isShowing then
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
      qryProdPorProveedor.Close;
      qryProdPorProveedor.Open;
      LlenarTipoUnidadBox(qryProductosTipo_Unidad.Value);
      if (qryProductosTipo_Unidad.value >0) or (Not qryProductosTipo_Unidad.IsNull) then
      begin
        dmInventario.qryTipoUnidad.Locate('IDUNIDAD',qryProductosTipo_Unidad.value,[]);
        cboxTipoUnidad.Text:=dmInventario.qryTipoUnidadDescripcion.value;
      end;
      if qryVence.Locate('Codigo_Texto', qryProductosCodigo_Texto.Value,[]) then
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
    if Not qryProductos.Locate('codigo', edtCodigo.Text,[loCaseInsensitive]) then
    Prod_existe:= False;
  end else
  if Not qryProductos.Locate('codigo_Texto', edtCodigo.Text,[loCaseInsensitive]) then
  Prod_existe:= False;//qryProductoscodigo_texto.value

  if Prod_existe then
  begin
    Prod_existe:= True;
    qryInventario.Locate('CODIGO_TEXTO', edtCodigo.Text,[loCaseInsensitive]);

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
      rxVentaMonedaBase.Value := GetMonedaProducto(qryProductosCODIGO.Value);
      rxVentamonto_tasa.Value := GlbMontoTasa(rxVentaMonedaBase.Value);

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
           if not GlbUsandoCotiza Or ( rxVentaStatus.Value = 'I')  then
            rxVentaPrecio.Value := qryProductosPRECIO.Value;
            cboxTipoUnidad.ItemIndex:=0;
            //MessageDlg('Precio no configurado para tipo unidad, verifique', mtError, [mbok],0);
          end;
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
          if (qryProdSerieSTATUS.Value = 'R') then
          begin
            MessageDlg('Número serie no disponible, verifique',mtInformation, [mbOK], 0);
            if isShowing then
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

  ProcSetNCFCliente;

  panel2.Visible:=MostrarVistaproductos1.Checked;
  if LectorCodBarra1.Checked And (rxVentaPrecio.Value > 0) then
  begin
    DBEdit1Enter(Self);
    DBEdit1Exit(Self);
      if isShowing then
    edtCodigo.SetFocus;
  end;
end;

procedure TfrmProcVentaRapidaByM.ProcSetNCFCliente;
begin
  if Not TotalesTipoNCFIFiscal.IsNull then Exit;
  if (tablaPropietarioCodigoPropietario.Value > 0) then
  begin
    if qryCliente.Locate('CODIGO_CTE', tablaPropietarioCodigoPropietario.Value, []) then
    begin
      if (qryClienteTIPO_CF.Value <> '') then
      begin
        if dmFactura.ibQryViewNCF.Locate('TIPO_CF', qryClienteTIPO_CF.Value, []) then
        begin
          GlbDescNCF := dmFactura.ibQryViewNCFDESCRIPCION.Value;
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
        end;
      end;
    end;
  end else
  begin
    AsignaNCFCFinal;
  end;
end;
procedure TfrmProcVentaRapidaByM.AsignaNCFCFinal;
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
procedure TfrmProcVentaRapidaByM.AsignaNCFCFinalX(TIPO_NCF_IFISCAL : integer);
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

  if dmFactura.ibQryViewNCF.Locate('TIPO_NCF_IFISCAL', TIPO_NCF_IFISCAL, []) then
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

procedure TfrmProcVentaRapidaByM.ProcesaNuevo;
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

  //WriteToLog('Post rxVenta - Line 1970');
  rxVenta.Append;
  rxVentaglbcodVendedor.Value := qryClienteCOD_VENDEDOR.Value;
  rxVentaItbi.Value:=0;

  if EsModificandoFactura then
  rxVentaStatus.Value   := 'I';
  if (GlbActivaIFiscal = 0) then
  RxSpeedButton1.Visible:= True;
  rxVentaCant.Value  := 1;
  rxVentaSerie.Value := Numero;
  rxVentaFecha.Value := ExtraerFecha(GlbFechaTrnDiaria);
  if (GlbcodVendedor > 0) then
  rxVentaCodUsuario.Value := GlbcodVendedor
  else
  rxVentaCodUsuario.Value := VarUsuarioGlb;
end;

procedure TfrmProcVentaRapidaByM.BitBtn1Click(Sender: TObject);
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
  if isShowing then
  edtCodigo.SetFocus;
end;

procedure TfrmProcVentaRapidaByM.BitBtn3Click(Sender: TObject);
begin
  if rxVenta.state in [dsEdit, dsInsert] then
  begin
    rxVenta.Cancel;
  end;
  if rxVenta.RecordCount > 0 then
  begin
    if VerificaClave then
    begin
      if MessageDlg('Cancelar transacción?', mtInformation, [mbYes, mbNo], 0)= mrYes then
      begin
        GlbUsandoCotiza:= False;
        GlbUsandoCotiza := False;
        rxVenta.Close;
        rxVenta.EmptyTable;
        rxVenta.Open;
        tablaPropietario.EmptyTable;
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
       dmCalculos.rxVenta.EmptyTable;
       dmCalculos.Totales.EmptyTable;
       dmCalculos.rxError.EmptyTable;
       AbortarPostServTaller := True;
       if (NumTrnServAlq = -1) then
       begin
         if Assigned(frmAlquiler) then
         begin
           Hide;
           frmAlquiler.BringToFront;
         end;
         NumTrnServAlq:= 0;
       end;
      end;
    end;
  end else
  begin
    //RxDBGrid2.visible
  end;
end;

procedure TfrmProcVentaRapidaByM.DBEdit1Exit(Sender: TObject);
//var
//  guardarRec : TBookMark;
begin
  if rxVenta.State In [dsInsert, dsEdit] then
  begin
    rxVentaDescUnidadMedida.Value:=cboxTipoUnidad.Text;
    if (rxVentaCant.Value > qryProductosCANTIDAD.Value) And (GlbPermiteVentaInv0 = 0) then
    begin
      MessageDlg('Cantidad venta es mayor que existencia inventario', mtWarning, [mbOK], 0);
      DBEdit1.SetFocus;
      exit;
    end;

    if (rxVentaCant.Value < 0) then
    begin
      MessageDlg('Cantidad no puede ser número negativo, verifique',mtError, [mbOK], 0);
      DBEdit1.SetFocus;
      exit;
    end;
    rxVentaMontoBruto.Value:= rxVentaCant.Value * rxVentaPrecio.Value;

    if EsDevolucion then
    rxVentaMontoBruto.Value:=rxVentaMontoBruto.Value * -1;

    rxVentaMontoDescItem.Value:= rxVentaMontoBruto.Value * rxVentaPorcDescItem.Value / 100;
    rxVentaMontoDesGlobal.Value := rxVentaMontoBruto.Value * (TotalesPorcDesAdicional.Value / 100);
  end;
  // guardarRec := rxVenta.GetBookmark;
  //Aplica Descuento e Itbis
  if (rxVentaSerie.Value = 0) then
  rxVentaSerie.Value:=1;
  GlbNumero:= rxVentaSerie.Value;

  if (auxiCant > 0) And (auxiCant <> rxVentaCant.Value) then
  PrecioCambio:=true;

  //t Marzo 17 2015 ProcesaCalculos;
  Refresh;
  if rxVenta.State In [dsInsert, dsEdit] Then
  rxVenta.Post;
  //WriteToLog('Post rxVenta - Line 2061');
  //ProcesaNuevo;
  edtCodigo.SelectAll;
  edtCodigo.ClearSelection;

  if isShowing then
  edtCodigo.SetFocus;

  panel2.Visible := False;

  if isShowing then
  if (GlbPermiteCambioPrecio) then //Adm
  begin
    DBEdit2.ReadOnly := False;
    DBEdit2.SetFocus;
  end else
  begin
    //t Marzo 17 2015 ProcesaCalculos;
  end;
end;

procedure TfrmProcVentaRapidaByM.BitBtn2Click(Sender: TObject);
begin
  if GlbModoHistorico then
  begin
    MessageDlg('Operacion no permitida en MODO HISTORICO.',mtError,[mbok],0);
  end;
  BitBtn10Click(Self);

  TipoVenta:='CONTADO';
  if rxVenta.State In [dsInsert, dsEdit] Then
  begin
    if Not TotalesMoneda.IsNull then
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
  if isShowing then
  Edit1.SetFocus;
  ActualizarRecoverData;
end;

procedure TfrmProcVentaRapidaByM.rxVentaAfterPost(DataSet: TDataSet);
begin
  if not recuperando then
  ProcInsertarRecoverData;
  recuperando :=False;
  if sumarDatos then
  begin
    rxVenta.EnableControls;
    rxdbgrid2.EnableScroll;
  end;
  if not dmCalculos.esFeedback then
    BitBtn27Click(Self);
end;

procedure TfrmProcVentaRapidaByM.Edit1Exit(Sender: TObject);
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
      MessageDlg('Monto entregado es menor que total a pagar, verifique',mtInformation, [mbOK], 0);
      Edit1.SetFocus;
      BitBtn4.Enabled := False;
      Exit;
    end;
  Totalesmontorecibido.AsString := Edit1.Text;
  if (x > 0) then
  Totalesdevolucion.Value := x;
  Totales.Post;

  BitBtn4.Enabled := True;
 if isShowing then
  BitBtn4.SetFocus;

end;

procedure TfrmProcVentaRapidaByM.edtCodigoEnter(Sender: TObject);
begin
  if tablaPropietario.State = dsInactive then
  tablaPropietario.Open;
  if dmFactura.ibQryViewNCF.State = dsInactive then
  dmFactura.ibQryViewNCF.Open;
  if (Totales.State = dsInactive) then
  begin
    Totales.Close;
    Totales.Open;
  end;
  Refresh;
  if (GlbActivaIFiscal = 1 ) then
  begin
    ProcesaEstadoImpresora;
    if (GlbIFiscalError <> '') and  (Pos('Ready',GlbIFiscalError) < 0) then
    MessageDlg(GlbIFiscalError, mtInformation, [mbOk], 0)
    else
    if GLBIFiscalBusy Or Not GLBIFiscalOnline then
    begin
      Delay(3000);
      ProcesaEstadoImpresora;
      if GLBIFiscalBusy Or Not GLBIFiscalOnline then
      MessageDlg('Impresora fiscal esta offline. '#13'Verifique que no esta apagada, desconectada o '#13'que no exista un documento abierto.',mtInformation,[mbOk],0);
    end;
  end;
  edtCodigo.SelectAll;
  dmCalculos.esFeedback := true;
end;

procedure TfrmProcVentaRapidaByM.FormKeyDown(Sender: TObject; var Key: Word;
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
    if isShowing then  
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
  begin
    Edit1Exit(Self);
    BitBtn4Click(Self)
  end
  else if (key = 119) then //F8
  begin
    if rxVenta.State = dsBrowse then
    begin
      item:=InputBox('Borrar un item','Entre número item a eliminar','');
      if rxVenta.Locate('Serie', strToInt(item),[]) then
      rxVenta.Delete;
      //temp Marzo-17-2015 ProcesarSumaTotal;
      BitBtn27Click(Self);
  end;
  end;
  end;

procedure TfrmProcVentaRapidaByM.rxVentaBeforePost(DataSet: TDataSet);
begin
  if rxVentaCant.IsNull or rxVentaPrecio.IsNull or rxVentaSerie.IsNull or rxVentaCodArticulo.IsNull then
  begin
    DataSet.Cancel;
    if isShowing then
    BitBtn1.SetFocus;
  end else
  if rxVentaStatus.isNull then
  rxVentaStatus.Value:='A';
  if (UpperCase(rxVentaDescripcion.Value) = 'RECARGO') then
  rxVentaTipoVenta.Value:=3;
  
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
    RxDBLookupCombo3Exit(Self);
  end;
end;

procedure TfrmProcVentaRapidaByM.BitBtn5Click(Sender: TObject);
begin
  EsModificandoFactura:= Label36.Visible;
  if rxVenta.state = dsbrowse then
  begin
    if (EsModificandoCotiza) then
    begin
      if (rxVentaStatus.Value = 'I') then
      begin
        rxVenta.Delete;
        //marzo 17 2015 ProcesarSumaTotal;
        BitBtn27Click(Self);
      end else
      begin
        rxVenta.Edit;
        rxVentaStatus.Value:='C';
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
        rxVenta.Delete;
        //marzo 17 2015 ProcesarSumaTotal;
        BitBtn27Click(Self);
      end else
      begin
        rxVenta.Edit;
        rxVentaStatus.Value:='C';
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
          EliminarRecoverData;
          rxVenta.Delete;
        //marzo 17 2015 ProcesarSumaTotal;
        BitBtn27Click(Self);
        end;
      end;
    end else
    begin
      if MessageDlg('Borrar item No.' + rxVentaSerie.AsString + '?', mtWarning, [mbYes, mbNO], 0)= mrYes then
      begin
        EliminarRecoverData;
        rxVenta.Delete;
        //marzo 17 2015 ProcesarSumaTotal;
        BitBtn27Click(Self);
      end;
    end;
  end;
end;

procedure TfrmProcVentaRapidaByM.Inventario1Click(Sender: TObject);
begin
  frmRegMiniInvientario:=tfrmRegMiniInvientario.Create(nil);
  try
    frmRegMiniInvientario.Showmodal;
    if frmRegMiniInvientario.CodigoTexto <> '' then
    edtCodigo.Text:=frmRegMiniInvientario.CodigoTexto;
    if isShowing then
    edtCodigo.SetFocus;
  finally
  frmRegMiniInvientario.free;
  frmRegMiniInvientario:=nil;
  end;
end;

procedure TfrmProcVentaRapidaByM.CuadreCaja1Click(Sender: TObject);
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

procedure TfrmProcVentaRapidaByM.InsertarDetDevolucion(numero : Integer);
begin
  ibStpInsertVentaDet.Params[0].Value  := Numero;
  ibStpInsertVentaDet.Params[1].Value  := rxVentaCodArticulo.Value;
  ibStpInsertVentaDet.Params[2].Value  := Null;
  ibStpInsertVentaDet.Params[3].Value  := rxVentaDescripcion.Value;
  ibStpInsertVentaDet.Params[4].Value  := rxVentaCant.Value * -1;
  ibStpInsertVentaDet.Params[5].Value  := rxVentaPrecio.Value * -1;
  ibStpInsertVentaDet.Params[6].Value  := rxVentaporc_desc.Value;//descuento
  ibStpInsertVentaDet.Params[7].Value  := rxVentaItbi.Value * -1;//itbi_det
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
  if (ABS(TotalesMontoExoneraITBIS.Value) > 0) then
  ibStpInsertVentaDet.Params[22].Value := 1
  else
  ibStpInsertVentaDet.Params[22].Value := rxVentaItbisExento.Value;
  ibStpInsertVentaDet.Params[23].Value := rxVentaTipoVenta.Value;//Item de Venta
  ibStpInsertVentaDet.Params[24].Value := rxVentaDescripcionEspecial.Value;//Item de Venta
  ibStpInsertVentaDet.Params[25].Value := rxVentaCostoProducto.Value;
  ibStpInsertVentaDet.Params[26].Value := rxVentaPorcDescItem.Value;
  if (rxVentaMontoDescItem.Value > 0) then
  ibStpInsertVentaDet.Params[27].Value := rxVentaMontoDescItem.Value
  else
  ibStpInsertVentaDet.Params[27].Value := rxVentaMontoDesGlobal.Value;
  ibStpInsertVentaDet.Params[28].Value := rxVentaMontoDescuento.Value;
  ibStpInsertVentaDet.Params[29].Value := rxVentaIDTasaITBIS.Value;
  ibStpInsertVentaDet.Params[30].Value := rxVentaMontoItbisRecargo.Value;
  ibStpInsertVentaDet.Params[31].Value := rxVentaMoneda.Value;
  ibStpInsertVentaDet.Params[32].Value := rxVentamonto_tasa.Value;
  
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

procedure TfrmProcVentaRapidaByM.InsertarDet(numero : Integer);
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
    //ibStpInsertVentaDet.Params[27].Value := rxVentaMontoDescItem.Value * -1;
    if (rxVentaMontoDescItem.Value > 0) then
    ibStpInsertVentaDet.Params[27].Value := rxVentaMontoDescItem.Value * -1
    else
    ibStpInsertVentaDet.Params[27].Value := rxVentaMontoDesGlobal.Value * -1;
    ibStpInsertVentaDet.Params[28].Value := rxVentaMontoDescuento.Value * -1;
    ibStpInsertVentaDet.Params[29].Value := rxVentaIDTasaITBIS.Value;
    ibStpInsertVentaDet.Params[30].Value := rxVentaMontoItbisRecargo.Value;
  end else
  begin
    ibStpInsertVentaDet.Params[4].Value  := rxVentaCant.Value;
    ibStpInsertVentaDet.Params[5].Value  := rxVentaPrecio.Value;
    ibStpInsertVentaDet.Params[6].Value  := rxVentaporc_desc.Value;//descuento
    ibStpInsertVentaDet.Params[7].Value  := rxVentaItbi.Value;//itbi_det
    ibStpInsertVentaDet.Params[8].Value  := rxVentaMontoBruto.Value;
    ibStpInsertVentaDet.Params[9].Value  := rxVentaMontoNeto.Value;
    //ibStpInsertVentaDet.Params[27].Value := rxVentaMontoDescItem.Value;
    if (rxVentaMontoDescItem.Value > 0) then
    ibStpInsertVentaDet.Params[27].Value := rxVentaMontoDescItem.Value * -1
    else
    ibStpInsertVentaDet.Params[27].Value := rxVentaMontoDesGlobal.Value * -1;
    ibStpInsertVentaDet.Params[28].Value := rxVentaMontoDescuento.Value * -1;
    ibStpInsertVentaDet.Params[29].Value := rxVentaIDTasaITBIS.Value;
    ibStpInsertVentaDet.Params[30].Value := rxVentaMontoItbisRecargo.Value;
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
  if (ABS(TotalesMontoExoneraITBIS.Value) > 0) then
  ibStpInsertVentaDet.Params[22].Value := 1
  else  
  ibStpInsertVentaDet.Params[22].Value := rxVentaItbisExento.Value;
  ibStpInsertVentaDet.Params[23].Value := rxVentaTipoVenta.Value;//Item de Venta
  ibStpInsertVentaDet.Params[24].Value := rxVentaDescripcionEspecial.Value;//Item de Venta
  ibStpInsertVentaDet.Params[25].Value := rxVentaCostoProducto.Value;
  ibStpInsertVentaDet.Params[26].Value := rxVentaPorcDescItem.Value;
  if (rxVentaMontoDescItem.Value > 0) then
     ibStpInsertVentaDet.Params[27].Value := rxVentaMontoDescItem.Value
  else
    ibStpInsertVentaDet.Params[27].Value := rxVentaMontoDesGlobal.Value;

  ibStpInsertVentaDet.Params[28].Value := rxVentaMontoDescuento.Value;
  ibStpInsertVentaDet.Params[29].Value := rxVentaIDTasaITBIS.Value;
  ibStpInsertVentaDet.Params[30].Value := rxVentaMontoItbisRecargo.Value;
  ibStpInsertVentaDet.Params[31].Value := rxVentaMoneda.Value;
  ibStpInsertVentaDet.Params[32].Value := rxVentamonto_tasa.Value;
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
  ibStpInsertVentaDet.params[31].Value:= rxVentaMoneda.Value;
  ibStpInsertVentaDet.params[32].Value:= rxVentamonto_tasa.Value;
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

procedure TfrmProcVentaRapidaByM.Ayuda1Click(Sender: TObject);
begin
  ShellExecute(frmProcVentaRapidaByM.Handle,nil,PChar('C:\Proyectos\PointSaleSoftGold\PuntoVenta\ManualOnline.html'),'','',SW_SHOWNORMAL);
end;

procedure TfrmProcVentaRapidaByM.ImprimirRecibo1Click(Sender: TObject);
begin
  ImprimirRecibo1.Checked:= Not ImprimirRecibo1.Checked;
end;

procedure TfrmProcVentaRapidaByM.BitBtn6Click(Sender: TObject);
  var
     Serie_Asignadoncf : Integer;
     serieDoc : Integer;
     valorNCF : String;

     ShowNcfVentana:Boolean;
     flagAbortar : Boolean;
begin
  esContado:=False;
  flagAbortar:=false;
  BitBtn6.Enabled := False;
  if rxVenta.RecordCount = 0 then
  begin
    MessageDlg('No puedes guardar sin detalle, verifique.',mtInformation,[mbok],0);
    BitBtn6.Enabled := True;
    Exit;
  end;

  if (TotalesTipoNCFIFiscal.Value < 0) then
  begin
    MessageDlg('Verifique tipo NCF', mtError, [mbOk], 0);
    BitBtn6.Enabled := True;
    Exit;
  end;

  if not VerificaRecordsVenta then
  begin
    MessageDlg('Debe existir al menos un record activo, verifique.',mtInformation,[mbok],0);
    BitBtn6.Enabled := True;
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
  if (tablaPropietario.RecordCount = 0) Or (tablaPropietarioCodigoPropietario.Value = 0) then
  begin
    if MessageDlg('Cliente no asignado, desea crearlo?', mtInformation, [mbyes,mbno], 0)=mryes then
    begin
      if (GlbActivaIFiscal = 1) And (tablaPropietarioCodigoPropietario.IsNull) then
      begin
        ProcEntradaCliente;
        if tablaPropietarioCodigoPropietario.IsNull then
        begin
          MessageDlg('Se requiere RNC/Cédula para tipo comprobante seleccionado, verifique. ',mtError, [mbok], 0);
          BitBtn6.Enabled := True;
          exit;
        end;
      end;
    end;
    if isShowing then
    RxDBLookupCombo1.SetFocus;
    BitBtn6.Enabled:=True;
    Exit;
  end;

  BitBtn6.Enabled := False;
  xSalir := False;
  EsFinanciamiento := False;
  EsFactura := True;
  serieDoc  := 0;

  if Not tablaPropietarioCodigoPropietario.IsNull then
  if qryClienteCOD_VENDEDOR.Value > 0 then
    GlbCodVendedor :=qryClienteCOD_VENDEDOR.Value
  else
    GlbCodVendedor := -1;
  if Assigned(FrmBuscarClientesPersonas) then
  begin
    FrmBuscarClientesPersonas.Free;
    FrmBuscarClientesPersonas:=Nil;
  end;

  AbortarPostServTaller:=False;
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

        if not VerificaLimiteCredito(xCodigoCte,TotalesTotalNeto.Value) then
        begin
          if NoTieneCredito then
          MessageDlg('Cliente no tiene crédito...', mtWarning, [mbOK], 0)
          else
          MessageDlg('Balance CXC excede limite de crédito.', mtWarning, [mbOK], 0);
          BitBtn6.Enabled:=True;
          flagAbortar:=True;
          Exit;
        end;

        CheckBox1.Checked := True;
        ValorNCF := '';
        Serie_Asignadoncf := -1;
        ShowNcfVentana:=True;

       if (GlbActivaIFiscal = 1 ) then
       begin
        if TotalesTipoNCF.IsNull then
        begin
           MessageDlg('Favor indicar Tipo Comprobante.', mtInformation, [mbok],0);
           RxDBLookupCombo3.SetFocus;
           BitBtn6.Enabled := True;
           BitBtn6.BringToFront;
           Exit;
        end;               
        ProcesaEstadoImpresora;
        if (Length(GlbStatusFiscalError) > 0) And (UpperCase(GlbStatusFiscalError) <> 'READY') then
        begin
          MessageDlg('Estatus impresora fiscal: "' + GlbStatusFiscalError+'", verifique.', mtError, [mbOk], 0);
          Exit;
        end;
        if Not GLBIFiscalOnline then
        begin
          MessageDlg('Impresora no está en linea, verifique. '+GlbStatusFiscalError, mtError, [mbok], 0);
          Exit;
        end;
       end;

        frmSelNCF:=TfrmSelNCF.Create(Nil);
        try
          if (GlbActivaIFiscal = 1 ) then
          begin
            dmFactura.ibQryViewNCF.Locate('TIPO_CF',TotalesTipoNCF.Value,[]);
            if dmFactura.ibQryViewNCF.Locate('TIPO_CF',dmFactura.ibQryViewNCFTIPO_CF.Value ,[]) then
            begin
              GlbDescNCF := dmFactura.ibQryViewNCFDESCRIPCION.Value;
            end;
            ShowNcfVentana:=False;
          end else
          begin
            if NCFSinValorFiscal1.Checked then
            dmFactura.ibQryViewNCF.Locate('TIPO_CF','02',[])
            else dmFactura.ibQryViewNCF.Locate('TIPO_CF','01',[]);

            ProcSetNCFCliente;
            
          end;

          if ShowNcfVentana then
          begin
            if TotalesMontoNCRAplicado.Value > 0 then
            DescargaNotaCredito;
            if (frmSelNCF.ShowModal = mrOK) then
            begin
              GlbDescNCF:=dmFactura.ibQryViewNCFDESCRIPCION.Value;
              ProcVentaConNCF(dmFactura.ibQryViewNCFTIPO_CF.Value, ValorNCF, serieDoc, serie_asignadoncf);
              ProcVenta(valorNCF, Serie_Asignadoncf,serieDoc);//Aqui voy
              ProcesaFacturar(1, serieDoc, xcodigocte);
            end else
            begin
              GlbDescNCF:='';
              ProcVenta(ValorNCF,Serie_Asignadoncf,serieDoc);//Aqui voy
              ProcesaFacturar(1, serieDoc, xcodigocte);
            end;
          end else
          begin
            if (GlbActivaIFiscal = 1 ) then
            begin
              if TotalesMontoNCRAplicado.Value > 0 then
              DescargaNotaCredito;

              //************************* Generar NCF ******************************
              GlbDescNCF   := dmFactura.ibQryViewNCFDESCRIPCION.Value;

              ////////////////*****************************/////////////////////////
              {
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
                  RxDBLookupCombo3Change(Self);
                }
                ////////////////*****************************/////////////////////////
                  
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
                //finally
                //end;
              //*************************             ******************************
                GlbDescNCF:=dmFactura.ibQryViewNCFDESCRIPCION.Value;
                ProcVentaConNCF(dmFactura.ibQryViewNCFTIPO_CF.Value, ValorNCF, SerieDoc, Serie_asignadoncf);
                ProcVenta(valorNCF, Serie_Asignadoncf,serieDoc);
                ProcesaFacturar(1, serieDoc, xcodigocte);
            end;
          end;
          finally
          frmSelNCF.Free;
          frmSelNCF:= Nil;
          end;

    if (GlbActivaIFiscal = 1 ) then
    begin
      ReactivarValores;
      Estatus1Click(Self);
      qryVerificaReciboPdte.Close;
      qryVerificaReciboPdte.Open;
      qryVerificaReciboPdte.last;
    if (qryVerificaReciboPdte.RecordCount > 1) then
    begin
      MessageDlg('Existe más de un record pendiente impresión ticket, '#13' verifique antes de registrar ventas.',mtError,[mbok], 0);
      exit;
    end;
    if (qryVerificaReciboPdte.RecordCount > 0) then
    begin
      RecuperaTicketfiscal1Click(Self);
    end;
    Estatus1Click(Self);
    ProcActualizaMsg;
    exit;
    end;

    ImprimeDocumento(serieDoc);

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
  try
    ReactivarValores;
  except
    raise Exception.Create('Hubo un error terminando de preparar el ambiente');
  end;

  {
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
  if (GlbActivaIFiscal = 1 ) then
  begin
    ProcesaEstadoImpresora;
    ProcGlbSecuenciaNCF;
  end;
  Refresh;
  Application.ProcessMessages;   }

end;

procedure TfrmProcVentaRapidaByM.BuscarCliente1Click(Sender: TObject);
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

procedure TfrmProcVentaRapidaByM.Cotizar1Click(Sender: TObject);
begin
  BitBtn8Click(Self)
end;

procedure TfrmProcVentaRapidaByM.BitBtn8Click(Sender: TObject);
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

      if GlbActivaIFiscal = 1 then
      begin
        UImprimeCotizaFiscal.xNumCotizacion := _NumeroCotiza;
        UImprimeCotizaFiscal.ImprimircotizaFiscal;
        UImprimeCotizaFiscal.Imprimedoc;
        EsModificandoCotiza:=False;
        label36.Caption:='';
        GlbUsandoCotiza:=False;
      end else
      begin
        //end if new modelo cotiza
        //if rdgFactServicio.Checked or rdgFactVentaProducto.Checked then
        if (UpperCase(GLBFormatoFactura) = 'FORMATOGENERAL') then
        begin
          qckCotiza8_5_FormG:=TqckCotiza8_5_FormG.Create(Nil);
          try
            qckCotiza8_5_FormG.Preview;
          finally
          qckCotiza8_5_FormG.Free;
          qckCotiza8_5_FormG:=Nil;
          end;
        end else
        if (UpperCase(GLBFormatoFactura) = 'ARTIOFFICE') then
        begin
          qckCotiza8_5_F_1ByM:=TqckCotiza8_5_F_1ByM.Create(Nil);
          try
            qckCotiza8_5_F_1ByM.Preview;
          finally
          qckCotiza8_5_F_1ByM.Free;
          qckCotiza8_5_F_1ByM:=Nil;
          end;
        end else
        if (UpperCase(GLBFormatoFactura) = 'INGESERVIS') then
        begin
          qckCotiza8_5_F_2:=TqckCotiza8_5_F_2.Create(Nil);
          try
            qckCotiza8_5_F_2.Preview;
          finally
          qckCotiza8_5_F_2.Free;
          qckCotiza8_5_F_2:=Nil;
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
  EsModificandoFactura :=False;
  InicializaOtrosDesc;
  Application.ProcessMessages;
  rxVenta.EmptyTable;
  Edit1.Text      := '';
  edtCodigo.Text  := '';
  pesoProd := '';
  BitBtn4.Enabled := False;
  if isShowing then
  BitBtn1.SetFocus;
  Totales.EmptyTable;
  tablaPropietario.Edit;
  tablaPropietarioCodigoPropietario.AsVariant := null;
  tablaPropietario.Post;
  if isShowing then  
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
  ipStpInsertCotizaMast.Params[7].Value:= Totalestotalneto.Value;//EditN1.Text;
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
  if TotalesMontoDescAdicional.Value > 0 then
  ipStpInsertCotizaMast.Params[18].Value    := TotalesMontoDescAdicional.Value
  else
  ipStpInsertCotizaMast.Params[18].Value    := TotalesMontoDescItems.Value;

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
  
  ipStpInsertCotizaMast.Params[33].Value := TotalesComentario.AsVariant;
  ipStpInsertCotizaMast.Params[34].Value     := TotalesReferenciaCte.Value;
  ipStpInsertCotizaMast.Params[35].Value     := TotalesRecargo.Value;
  ipStpInsertCotizaMast.Params[36].Value     := TotalesTIPONCFIFiscal.Value;
  ipStpInsertCotizaMast.Params[37].Value     := TotalesMontoExoneraITBIS.Value;
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
  if GlbActivaIFiscal = 1 then
  begin
    UImprimeCotizaFiscal.xNumCotizacion := ipStpInsertCotizaMast.Params[0].Value;
    UImprimeCotizaFiscal.ImprimircotizaFiscal;
    UImprimeCotizaFiscal.Imprimedoc;
  end else
  begin
    if (UpperCase(GLBFormatoFactura) = 'FORMATOGENERAL') then
    begin
      qckCotiza8_5_FormG:=TqckCotiza8_5_FormG.Create(Nil);
      try
        qckCotiza8_5_FormG.Preview;
      finally
      qckCotiza8_5_FormG.Free;
      qckCotiza8_5_FormG:=Nil;
      end;
    end else
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
 end;
  rxVenta.EmptyTable;
  Edit1.Text    := '';
  edtCodigo.Text := '';
  pesoProd := '';
  BitBtn4.Enabled := False;
  if isShowing then
  BitBtn1.SetFocus;
  Totales.EmptyTable;
  tablaPropietario.Edit;
  tablaPropietarioCodigoPropietario.AsVariant := null;
  tablaPropietario.Post;
  if isShowing then  
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

procedure TfrmProcVentaRapidaByM.InsertarCotizacionDet(numero: Integer);
begin
  //ibStpInsertCotizaDet.Params[0].Value := Numero;
  ibStpInsertCotizaDet.Params[1].Value    := Numero;    //Numero
  ibStpInsertCotizaDet.Params[2].Value    := rxVentaCodArticulo.Value; //Codigo_Prod
  ibStpInsertCotizaDet.Params[3].Value    := Null;    //codigo_barra
  ibStpInsertCotizaDet.Params[4].Value    := rxVentaDescripcion.Value; //Descripcion
  ibStpInsertCotizaDet.Params[5].Value    := rxVentaDescripcionEspecial.Value;//DescripcionEspecial
  ibStpInsertCotizaDet.Params[6].Value    := rxVentaCant.Value;        //Cantidad
  ibStpInsertCotizaDet.Params[7].Value    := rxVentaPrecio.Value;      //Precio
  ibStpInsertCotizaDet.Params[8].Value    := 0;                        //Porc_desc_det
  ibStpInsertCotizaDet.Params[9].Value    := rxVentaItbi.Value;        //Itbi_det
  ibStpInsertCotizaDet.Params[10].Value   := rxVentaMontoBruto.Value;  //Valor_servicio_det
  ibStpInsertCotizaDet.Params[11].Value   := rxVentaMontoNeto.Value;   //Valor_Total_Det
  ibStpInsertCotizaDet.Params[12].Value   := 'A';                      //Status_det
  ibStpInsertCotizaDet.Params[13].Value   := Now;                      //Fecha_in
  ibStpInsertCotizaDet.Params[14].Value   := Null;        //In_Por
  ibStpInsertCotizaDet.Params[15].Value   := Null;                      //Fecha_mod
  ibStpInsertCotizaDet.Params[16].AsString:= Trim(StrUserName);        //Mod_por
  ibStpInsertCotizaDet.Params[17].Value   := rxVentaTipoUnidad.Value;  //Tipo_Unidad
  if (ABS(TotalesMontoExoneraITBIS.Value) > 0) then
  ibStpInsertCotizaDet.Params[18].Value := 1
  else
  ibStpInsertCotizaDet.Params[18].Value   := rxVentaItbisExento.Value; //Itbis_Exento
  ibStpInsertCotizaDet.Params[19].Value   := rxVentaTipoVenta.Value;   //Tipo_Venta
  ibStpInsertCotizaDet.Params[20].Value   := rxVentaPorcDescItem.Value;//Porc_Desc_Item
  if (rxVentaMontoDescItem.Value > 0) then
  ibStpInsertCotizaDet.Params[21].Value    := rxVentaMontoDescItem.Value //Monto_Desc_Item
  else
  ibStpInsertCotizaDet.Params[21].Value    := rxVentaMontoDesGlobal.Value;

  ibStpInsertCotizaDet.Params[22].Value    := rxVentaMoneda.Value;
  ibStpInsertCotizaDet.Params[23].Value    := rxVentamonto_tasa.Value;
  ibStpInsertCotizaDet.Params[24].Value    := rxVentaIDTasaITBIS.Value;
  //ibStpInsertCotizaDet.Params[21].Value := rxVentaMontoDescItem.Value;
  ibStpInsertCotizaDet.ExecProc;
end;

procedure TfrmProcVentaRapidaByM.BitBtn9Click(Sender: TObject);
begin
  if (rdgFactServicio.Checked And rdgFactVentaProducto.Checked)
  And (rxventa.RecordCount > 0) Then
  begin
    MessageDlg('Favor indicar tipo de Operación', mtInformation, [mbOK], 0);
    rdgFactServicio.SetFocus;
    Exit;
  end;
  if (Totalesmontorecibido.Value > 0) and (rxVenta.RecordCount > 0) then
  begin
    MessageDlg('Favor procesar o cancelar venta en progreso', mtInformation, [mbOK], 0);
    Exit;
  end;
  LlenandoDatos:=True;
  if (totales.RecordCount > 0) then
  begin
    totales.Close;
    totales.Open;
    Edit1.Text:='';
    Totales.Close;
    Totales.Open;
    Totales.Insert;
    if (GlbMonedaBase > 0) then
    TotalesMoneda.Value   := IntToStr(GlbMonedaBase)
    else
    TotalesMoneda.Value   := '1';
    TotalesSubTotal.Value:=0;
    TotalesMontoDescItems.Value:=0;
    Totalesitbis.Value     := 0;
    WriteToLog('Total itbis: '+Totalesitbis.AssTring);
    Totalesmontodesc.Value := 0;
    Totalestotalneto.Value := 0;
    Totalesmontorecibido.Value:= 0;
    Totalesdevolucion.Value   := 0;
    Totales.Post;
    lblProcDev.Visible := False;
    //dmCalculos.esFeedback:=False;
  end;
  frmCotizaciones:=TfrmCotizaciones.Create(Nil);
  try
    frmCotizaciones.BitBtn4Click(Self);
    if frmCotizaciones.Showmodal = mrOk then
    begin
      GlbUsandoCotiza:= True;
      rxVenta.Close;
      rxVenta.Open;
      tablaPropietario.EmptyTable;
      rxVenta.DisableControls;
      RxDBGrid1.DisableScroll;
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
          if (GlbActivaIFiscal = 0) then
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
            
      Totales.Edit;
      TotalesComentario.Value := frmCotizaciones.ibqryCotizacionMasterCOMENTARIO.Value;
      TotalesRecargo.Value    := frmCotizaciones.ibqryCotizacionMasterMONTO_RECARGO.Value;
      TotalesMontoExoneraITBIS.Value := frmCotizaciones.ibqryCotizacionMasterMONTO_EXONERADO_ITBIS.Value;
      TotalesTipoNCFIFiscal.Value    := frmCotizaciones.ibqryCotizacionMasterTIPONCFIFISCAL.Value;
      TotalesPorcDesAdicional.Value :=
      frmCotizaciones.ibqryCotizacionMasterPORC_DESCUENTO.Value;

      if TotalesPorcDesAdicional.Value > 0 then
      chKDescuentoGlobal.Checked := True else
      chKDescuentoGlobal.Checked := False;

      if Totales.State = dsEdit then
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
      EsModificandoCotiza := True;
      lblFechaCotizacion.Visible:= True;
      dbFechaCotizacion.Visible := True;
      Label36.Visible:=True;
      Label36.Caption:='Modificando Cotización: ' + frmCotizaciones.ibqryCotizacionMasterNUMERO.AsString;

      edtObservacion.Text := frmCotizaciones.ibqryCotizacionMasterNOMBRE_CLIENTE_GENERAL.Value;
      dmCalculos.esFeedback:=True;//Autoriza ejecuta calculos
    end;
  finally
  frmCotizaciones.Free;
  frmCotizaciones:=Nil;
  end;
  procCalc:=True;
  //t Marzo 17 2015 ProcesaCalculos;
  DBEdit10Exit(Self);
  BitBtn27Click(Self);
  RxDBGrid1.EnableScroll;
  Refresh;
  Application.ProcessMessages;

  BitBtn27Click(Self);
  BitBtn27Click(Self);
  LlenandoDatos:=false;
  rxVenta.EnableControls;
  RxDBGrid1.EnableScroll;
  
end;

procedure TfrmProcVentaRapidaByM.ProcCargaDatosCotizacion;
var
  porItbi : Currency;
begin
  _NumeroCotiza := frmCotizaciones.ibqryCotizacionDetNUMERO.Value;
  EsModificandoCotiza := True;
  rxVentaCodArticulo.Value := frmCotizaciones.ibqryCotizacionDetCODIGO_PROD.AsInteger;
  rxVentaSerie.Value  := frmCotizaciones.ibqryCotizacionDetSERIE.Value;
  rxVentaNumeroCotiza.Value := frmCotizaciones.ibqryCotizacionDetNUMERO.Value;
  rxVentaFecha.Value  := ExtraerFecha(frmCotizaciones.ibqryCotizacionMasterFECHA.Value);
  rxVentaMoneda.Value := frmCotizaciones.ibqryCotizacionDetMONEDA.Value;

  rxVentaCant.Value  := frmCotizaciones.ibqryCotizacionDetCANTIDAD.Value;
  rxVentaPrecio.Value:= frmCotizaciones.ibqryCotizacionDetPRECIO.Value;
  rxVentaPorcDescItem.Value:=frmCotizaciones.ibqryCotizacionDetPORC_DESC_ITEM.Value;
  rxVentaItbi.Value  := frmCotizaciones.ibqryCotizacionDetITBI_DET.Value;
  rxVentaporc_desc.Value   := frmCotizaciones.ibqryCotizacionDetPORC_DESC_DET.Value;
  rxVentaDescripcion.Value := frmCotizaciones.ibqryCotizacionDetDESCRIPCION.Value;
  rxVentaDescripcionEspecial.Value := frmCotizaciones.ibqryCotizacionDetDescripcionEspecial.Value;
  rxVentaTipoVenta.Value := frmCotizaciones.ibqryCotizacionDetTIPO_VENTA.Value;
  rxVentaTipoUnidad.Value:= frmCotizaciones.ibqryCotizacionDetTIPO_UNIDAD.Value;
  if qryProductos.State in [dsInactive] then qryProductos.Open;
  if qryProductos.Locate('CODIGO', frmCotizaciones.ibqryCotizacionDetCODIGO_PROD.Value,[]) then
  begin
    rxVentaCodTexto.Value:= qryProductosCODIGO_TEXTO.Value;
    if not qryProductosDESCRIPCIONADICIONAL.IsNull then
    if frmCotizaciones.ibqryCotizacionDetDescripcionEspecial.IsNull then
    rxVentaDescripcionEspecial.Value :=
    rxVentaDescripcionEspecial.Value +' '+
    qryProductosDESCRIPCIONADICIONAL.Value;
    rxVentaCodArticulo.Value:= frmCotizaciones.ibqryCotizacionDetCODIGO_PROD.AsInteger;

    rxVentaMonedaBase.Value := GetMonedaProducto(frmCotizaciones.ibqryCotizacionDetCODIGO_PROD.AsInteger);
    rxVentamonto_tasa.Value := GlbMontoTasa(rxVentaMonedaBase.Value);

    porItbi := FGlbPorcItbi(ExtraerFecha(rxVentaFecha.Value), rxVentaCodArticulo.Value);
    rxVentaIDTasaITBIS.Value := GlbIDTasa;

    rxVentaCostoProducto.Value := qryProductosPRECIO_COMPRA.Value;
  end;

  rxVentaItbisExento.Value:=qryProductosPAGA_ITBI.Value;

  rxVentaReferencia.Value := qryProductosREFERENCIA.Value;
  rxVentaInvetariar.Value:= qryProductosINVENTARIAR.Value;
  rxVentaRutaImagen.Value := BuscarRutaImagen(frmCotizaciones.ibqryCotizacionDetCODIGO_PROD.AsInteger);
  if (GlbcodVendedor > 0) then
  rxVentaCodUsuario.Value := GlbcodVendedor
  else
  rxVentaCodUsuario.Value := VarUsuarioGlb;
  procCalc:=false;
  //t Marzo 17 2015 ProcesaCalculos;
end;

procedure TfrmProcVentaRapidaByM.ProcesaFacturar(tipo : smallint; numdoc:Integer; codcte:Integer);
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

procedure TfrmProcVentaRapidaByM.ActBalaceCteP(operacion:smallint);
var
  Monto:Real;
begin
  if (Operacion = 2 ) then
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

procedure TfrmProcVentaRapidaByM.EditarBalanceP(monto:Real);
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

procedure TfrmProcVentaRapidaByM.EditarBalanceP(monto:Real;tipo:Integer);
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


procedure TfrmProcVentaRapidaByM.InsertaBalanceP(monto:Real);
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

procedure TfrmProcVentaRapidaByM.ProcVentaConNCF(tiponcf:String;var ValorNCF:String;var seriedoc:Integer; var serie_asignadoncf : Integer);
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
      RxDBLookupCombo3Change(Self);
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

procedure TfrmProcVentaRapidaByM.MaestroCliente1Click(Sender: TObject);
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

procedure TfrmProcVentaRapidaByM.RxDBGrid2DblClick(Sender: TObject);
begin
  try
  edtCodigo.Text := qryProductosCodigo_texto.Value;
  except
  edtCodigo.Text := qryProductosCodigo.AsSTring;
  end;
  panel2.Visible := False;
  Prod_existe    := True;
  BuscandoPorDesc:=false;
  //t DBEdit1.SetFocus;
  if Assigned(frmProcVentaRapidaByM) Then
  cboxTipoUnidad.SetFocus;
  edtCodigoExit(Self);
end;

procedure TfrmProcVentaRapidaByM.DBEdit1Enter(Sender: TObject);
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

procedure TfrmProcVentaRapidaByM.BitBtn10Click(Sender: TObject);
begin
  if (rxVenta.RecordCount >  0) then
  begin
    Totales.Edit;
    rxVenta.Edit;
    //DBEdit5.SetFocus;
  end;
end;

procedure TfrmProcVentaRapidaByM.DBEdit5Exit(Sender: TObject);
begin
  if Totales.State in [dsedit, dsinsert] then
  begin
    EsEditando := True;
    //t Marzo 17 2015 ProcesaCalculos;
    if Totales.State in [dsedit, dsinsert] then
    Totales.Post;
  end;
end;

procedure TfrmProcVentaRapidaByM.BitBtn11Click(Sender: TObject);
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
        if Totales.State = dsbrowse
        then Totales.Edit;

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

function TfrmProcVentaRapidaByM.FncFrecuencia(Frec: Integer): String;
begin
  case Frec of
  30 : result:='Mes(es)';
  15 : result:='Quincena(s)';
  07 : result:='Semana(s)';
  01 : result:='Dia(s)';
  else Result:= 'tiempo ind';
  end;
end;

procedure TfrmProcVentaRapidaByM.BitBtn12Click(Sender: TObject);
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

    if Totales.State = dsbrowse
    then Totales.Edit;
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
  edtCodigo.Text  := '';pesoProd := '';
  BitBtn4.Enabled := False;
  Totales.EmptyTable;
  CheckBox1.Checked := False;
  edtCodigo.SetFocus;
  ActualizarPreventa;
  ActualizarRecoverData;
  qryProdPorProveedor.Close;
  pnlPrecioProv.Visible:=False;    
end;

procedure TfrmProcVentaRapidaByM.MostrarVistaproductos1Click(Sender: TObject);
begin
  MostrarVistaproductos1.Checked := Not MostrarVistaproductos1.Checked;
end;

procedure TfrmProcVentaRapidaByM.BitBtn13Click(Sender: TObject);
begin
  //frmInvXReferencia:=TfrmInvXReferencia.Create(Nil);
  //try
  //  frmInvXReferencia.Showmodal;
  //finally
  //frmInvXReferencia.Free;
  //frmInvXReferencia:=Nil;
  //end;
end;

procedure TfrmProcVentaRapidaByM.edtReferenciaChange(Sender: TObject);
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

procedure TfrmProcVentaRapidaByM.edtReferenciaExit(Sender: TObject);
begin
  if Panel2.Visible then
  edtReferencia.Text := qryProductosCodigo_Texto.Value;
  if (qryProductos.State = dsInactive) then
  qryProductos.Open;
  qryProductos.Locate('Referencia', edtReferencia.Text, [loCaseInsensitive, loPartialKey])

end;

procedure TfrmProcVentaRapidaByM.NotaCrdito1Click(Sender: TObject);
begin
  FrmBuscarClientesPersonas:=TFrmBuscarClientesPersonas.Create(Nil);
  try
    if FrmBuscarClientesPersonas.Showmodal = mrOk then
    begin
      frmTransCxcProc_R:=TfrmTransCxcProc_R.Create(Nil);
      try
        frmTransCxcProc_R.CodCte := FrmBuscarClientesPersonas.CodigoCliente;
        //frmTransCxcProc_R.Pagecontrol1.ActivePage := TabSheet1;
        frmTransCxcProc_R.Pagecontrol1.ActivePageIndex := 0;
        frmTransCxcProc_R.Showmodal;
      finally
      frmTransCxcProc_R.Free;
      frmTransCxcProc_R:=Nil;
      end;
    end;
  finally
  FrmBuscarClientesPersonas.Free;
  FrmBuscarClientesPersonas:=Nil;
  end;
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

procedure TfrmProcVentaRapidaByM.NotaDebito1Click(Sender: TObject);
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

procedure TfrmProcVentaRapidaByM.BitBtn14Click(Sender: TObject);
begin
  DBEdit2.ReadOnly := True;
  if (varTipousuario = 0) then //Adm
  begin
    DBEdit2.ReadOnly := False;
    //tj Entro := True;
    //tj PrecioAnterior := rxVentaPrecio.Value;
    DBEdit2.SetFocus;
  end else
  begin
    if not GlbPermiteCambioPrecio then
    begin
      if VerificaClave then
      begin
        DBEdit2.ReadOnly := False;
        //tj MontoItbisEnPrecio := 0;
        //tj Entro:=true;
        //tj PrecioAnterior := rxVentaPrecio.Value;
        DBEdit2.SetFocus;
      end else
      begin
        DBEdit2.ReadOnly := False;
        DBEdit2.SetFocus;
     end;
    end else
    begin
      DBEdit2.ReadOnly := False;
      DBEdit2.SetFocus;
    end;
  end;
end;

procedure TfrmProcVentaRapidaByM.DBEdit2Exit(Sender: TObject);
var
  guardarRec : TBookMark;
  porcdes : Extended;
  diff : Currency;
  cambioValido : Boolean;
begin
  cambioValido:=False;
   cPrecio:= rxVentaPrecio.Value;
   if rxVenta.State in [dsEdit, dsInsert] then
   begin
     if (cPrecio < aPrecio) or (cPrecio < qryProductosPRECIO_MINIMO.Value) then
     begin
       if (not VerificaClave) then
       begin
         MessageDlg('Precio no será cambiado', mtWarning, [mbOk], 0);
         rxVentaPrecio.Value := aPrecio;
       end else cambioValido:=True;
     end;
   end;
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

  //temp Marzo 17-2015 ProcesaCalculos;
  BitBtn27Click(Self);

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

  if Not qryInventario.Locate('CODIGO_TEXTO', rxVentaCodTexto.Value,[]) then
  MessageDlg('codigo ' + rxVentaCodTexto.Value + ' no encontrado en inventario, verifique', mtError, [mbOK], 0)
  else
  begin //qryProductosDESCRIPCION.VALUE
    diff := rxVentaPrecio.Value - qryProductosPRECIO_MINIMO.Value;
    qryProductos.Locate('CODIGO',qryInventariocODIGO.Value,[]);
    if (Not FAplicaPrecioMayorista) And ((rxVentaPrecio.Value < qryProductosPRECIO_MINIMO.Value) and
    (ABS(diff) > 2)) And (glbUsaescalaPrecio = 0) And (Not cambioValido) then
    begin
      rxVenta.Edit;
      rxVentaPrecio.Value := aPrecio;
      rxVenta.Post;
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
  if Assigned(guardarRec) then
  begin
    rxVenta.GotoBookmark(guardarRec);
    rxVenta.FreeBookmark(guardarRec);
  end;
  if isShowing then
  edtCodigo.SetFocus;
end;

function TfrmProcVentaRapidaByM.VerificaClave: Boolean;
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

procedure TfrmProcVentaRapidaByM.Devolucin1Click(Sender: TObject);
begin
  frmProcVentaRapidaByM.Hide;
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
      frmProcVentaRapidaEdicion.tablaPropietario.EmptyTable;
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
        frmProcVentaRapidaEdicion.rxVentaMonedaBase.Value  := GetMonedaProducto(frmEdicionVenta.tblDatosDetCODIGO_PROD.AsInteger);
        frmProcVentaRapidaEdicion.rxVentamonto_tasa.Value := GlbMontoTasa(frmProcVentaRapidaEdicion.rxVentaMonedaBase.Value);
        
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
      //TotalesMoneda.Value := IntToStr(GlbMonedaBase);
      if (GlbMonedaBase > 0) then
      TotalesMoneda.Value   := IntToStr(GlbMonedaBase)
      else
      TotalesMoneda.Value   := '1';
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
      if Totales.State = dsBrowse then
      Totales.Edit;
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
  Show;
end;

procedure TfrmProcVentaRapidaByM.BitBtn7Click(Sender: TObject);
var
  x : Integer;
  NumTrnGen : Integer;
  NumOrden : Integer;
  _flag : Boolean;
  flag : boolean;
begin
  dmclientes.tblClientes.Close;
  dmclientes.tblClientes.Open;
  if not dmclientes.tblClientes.Locate('CODIGO_CTE',tablaPropietarioCodigoPropietario.Value,[]) then
  begin
    MessageDlg('Codigo cliente '+tablaPropietarioCodigoPropietario.AsString+' no existe, verifique.', mtError, [mbOk], 0);
    Exit;
  end;
  numeroTrnVta:= 0;
  TotalesTipoNCFIFiscal.Value;
  TotalesTipoNCF.Value;
  if EsModificandoCotiza then Exit;

  if (rxVenta.RecordCount > 0) And (Not EsDevolucion) then
  begin
    if (TotalesSubTotal.Value <= 0) then
    begin
      MessageDlg('Total venta no puede ser cero, verifique.', mtError, [mbOk], 0);
      Exit;
    end;

    if Not tablaPropietarioCodigoPropietario.IsNull then
    GlbcodVendedor:= qryClienteCOD_VENDEDOR.Value
    else
    begin
      MessageDlg('Favor indicar cliente.', mtInformation, [mbOk],0);
      RxDBLookupCombo1.SetFocus;
      Exit;
    end;

    if TotalesTipoNCF.IsNull And (GlbActivaIFiscal = 1 ) then
    begin
      MessageDlg('Favor indicar Tipo Comprobante.', mtInformation, [mbok],0);
      RxDBLookupCombo3.SetFocus;
      Exit;
    end;
    if EsModificandoFactura then
    begin
      if (dmFactura.qryFactTieneDevolucion.RecordCount = 1) then
      begin
        MessageDlg('Factura tiene una devolución previa, verifique ',mtInformation,[mbok],0);
        Exit;//dmFactura.qryFactTieneDevolucion.Params[0].Value
      end;
      if TotalesMoneda.IsNull then
      begin
        MessageDlg('Favor indicar moneda.', mtInformation, [mbok],0);
        Exit;
      end;

      if MessageDlg('Continuar con devolución factura, NCR será creada?', mtWarning,[mbYes, mbNo],0) = mrNo then
      Exit;
      if (not TotalesTipoNCF.IsNull) then
      begin
        if (TotalesTipoNCFIFiscal.Value = -1) then
        begin
          Totales.Edit;
          TotalesTipoNCFIFiscal.Value:= 2;//2;
          Totales.Post;
        end else
        if (TotalesTipoNCFIFiscal.Value = 0) then
        begin
          Totales.Edit;
          TotalesTipoNCFIFiscal.Value:=dmFactura.ibQryViewNCFTIPO_NCFNCR.Value;//2;
          Totales.Post;
        end else
        if (TotalesTipoNCFIFiscal.Value = 1) then
        begin
          Totales.Edit;
          TotalesTipoNCFIFiscal.Value:=dmFactura.ibQryViewNCFTIPO_NCFNCR.Value;//3;
          Totales.Post;
        end else
        if (TotalesTipoNCFIFiscal.Value = 5) then
        begin
          Totales.Edit;
          TotalesTipoNCFIFiscal.Value:=dmFactura.ibQryViewNCFTIPO_NCFNCR.Value;
          Totales.Post;
        end else
        if (TotalesTipoNCFIFiscal.Value = 4) then
        begin
          Totales.Edit;
          TotalesTipoNCFIFiscal.Value:=dmFactura.ibQryViewNCFTIPO_NCFNCR.Value;
          Totales.Post;
        end else
        begin
          MessageDlg('No permitido', mtInformation, [mbok],0);
          Exit;
        end;
      end;
    //Exit;//Temporal

    UProcesarDevolucion.GeneraNCF := True;
    //Crear Nota Credito
    if Not TotalesTipoNCF.IsNull then
    begin
      UProcesarDevolucion.tipoCF    := '04';
      UProcesarDevolucion.GeneraNCF := True;
    end
    else
    begin
      UProcesarDevolucion.tipoCF := '-1';
      UProcesarDevolucion.GeneraNCF := False;
    end;
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
    //if (not TotalesTipoNCF.IsNull) then
    if TotalesTipoNCFIFiscal.IsNull then
    UProcesarDevolucion.GeneraNCF:= False
    else
    UProcesarDevolucion.GeneraNCF:= True;

    if dmFactura.qryVentaFacturaFORMA_PAGO.Value in [7,8,15] then
    UProcesarDevolucion.UpdateBLCCXC  := True
    else
    UProcesarDevolucion.UpdateBLCCXC  := False;
    if UProcesarDevolucion.GeneraNCF then
    UProcesarDevolucion.Ejecutar('04', TotalesTipoNCFIFiscal.Value, dmFactura.qryVentaFacturaNUMERO.Value) //Comprobante Fiscal Nota de Credito
    else
    UProcesarDevolucion.Ejecutar(' ', -1, dmFactura.qryVentaFacturaNUMERO.Value);
    
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
      if (rxVentaInvetariar.Value <> 0) And (GlbCodDivInventario = 1) then
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
   dmCompania.tblCompania.Locate('codigo', glbCia_Key,[]);
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
      frmConsultaFacturas.rdgCredito.Checked := false;
      frmConsultaFacturas.EditN1.SetInteger(UProcesarDevolucion.numeroFactura);

      frmConsultaFacturas.BitBtn1Click(Self);
      dmFactura.qryDatosTrncxc.Close;  //dmFactura.qryVentaFactura.RecordCount;
      //t dmFactura.qryDatosTrncxc.Params[0].AsInteger:= dmFactura.qryVentaFacturaNUMERO_FACTURA.Value;
      //t dmFactura.qryDatosTrncxc.Params[1].AsInteger:= glbCia_Key;

      if esContado then
      dmFactura.qryDatosTrncxc.Params[0].AsInteger:= 2
      else
      dmFactura.qryDatosTrncxc.Params[0].AsInteger:= 1;
      dmFactura.qryDatosTrncxc.Params[1].AsInteger:= dmFactura.qryVentaFacturaNUMERO_FACTURA.Value;
      dmFactura.qryDatosTrncxc.Open;

      dmReportes.qryDatosVentaMaster.Close;
      dmReportes.qryDatosVentaMaster.Params[0].Value:= numeroTrnVta; //dmFactura.qryVentaFacturaNumero.Value;
      dmReportes.qryDatosVentaMaster.Open;

    finally              
    if Assigned(frmConsultaFacturas) then
    frmConsultaFacturas.Free;
    frmConsultaFacturas:=Nil;
    end;

    if (GlbActivaIFiscal = 1 ) then
    begin
      dmdatos.qryConfCajaXusuario.Close;
      dmdatos.qryConfCajaXusuario.Open;
      dmdatos.qryConfCajaXusuario.Locate('COD_EMPLEADO', VarUsuarioGlb,[]);

      dmReportes.qryDatosCajaImpUser.Close;
      dmReportes.qryDatosCajaImpUser.Params[0].Value:= VarUsuarioGlb;
      dmReportes.qryDatosCajaImpUser.Open;
      dmReportes.qryDatosCajaImpUser.Last;
      dmReportes.qryDatosCajaImpUser.RecordCount;

      if (dmFactura.qryVentaFacturaFORMA_PAGO.Value in [7,8]) then
      begin
         dmFactura.qryVentaFacturaNUMERO_FACTURA.Value
      end;

      GlbNombreFiletoPrint:= Format('%s%s%s%s%s%s%s',[dmReportes.qryDatosCajaImpUserRUTA_TICKET.Value,'\NotaCredito',Trim(GlbCodSucursal),Trim(GlbModeloImpresora),
      IntToStr(VarUsuarioGlb),IntToStr(dmFactura.qryDatosTrncxcNUM_DOC.Value),'.txt']);
      //Chequear parametros para nota de credito
      //dmFactura.qryDatosTrncxcNUM_DOC.Value
      dmdatos.qryConfCajaXusuario.Close;
      dmdatos.qryConfCajaXusuario.Open;
      dmdatos.qryConfCajaXusuario.Locate('COD_EMPLEADO',VarUsuarioGlb,[]);

      dmReportes.qryDatosCajaImpUser.close;
      dmReportes.qryDatosCajaImpUser.Params[0].Value:= VarUsuarioGlb;
      dmReportes.qryDatosCajaImpUser.Open;
      dmReportes.qryDatosCajaImpUser.Last;
      dmReportes.qryDatosCajaImpUser.RecordCount;

      PrepararInfoFiscalNCR(numeroTrnVta);
      if (dmFactura.qryDatosTrncxcNOMBRE_FACTURAR.IsNull) then
      begin
        MessageDlg('Se requiere Razon Social para Nota de Crédito, verifique.', mtError, [mbOk], 0);
        Exit;
      end;
      
      dmFactura.qryGetNcfAsignado.Close;
      if esContado then //contado
      dmFactura.qryGetNcfAsignado.SQL.Text:=dmFactura.qryGeNcfAsignado_1.SQL.Text
      else
      dmFactura.qryGetNcfAsignado.SQL.Text:=dmFactura.qryGetNcfAsignado_0.SQL.Text;
      //if esContado then
      dmFactura.qryGetNcfAsignado.Params[0].Value:= dmReportes.qryViewVentasMastNUMERO.Value;
      //else
      //dmFactura.qryGetNcfAsignado.Params[0].Value:= dmFactura.qryVentaFacturaNUMERO.Value;

      dmFactura.qryGetNcfAsignado.Open;
      dmFactura.qryVentaFactura.Last;
      //USADO PARA VER VALORES PARA TICKET FISCAL

      //t frmInfoParaTicketFiscal.Showmodal;

      if (dmReportes.qryViewVentasMastNUMERO_NCF.Isnull) then
      begin
        MessageDlg('Se requiere NCF afectado para Nota de Crédito, verifique.', mtError, [mbOk], 0);
        Exit;
      end;
      if (dmfactura.qryDatosTrncxc.State = dsInactive) then
      begin
        dmFactura.qryDatosTrncxc.Params[0].AsInteger:= 1;
        dmFactura.qryDatosTrncxc.Params[1].AsInteger:= dmReportes.qryViewVentasMastNUMERO_FACTURA.Value;
        dmFactura.qryDatosTrncxc.Open;
      end;
      if (dmfactura.qryDatosTrncxc.RecordCount = 0) then
      begin
        MessageDlg('Nota de Crédito no disponible para impresión, verifique.', mtError, [mbOk], 0);
        Exit;
      end else
      begin
        frmTestImpresoraFiscal:= TfrmTestImpresoraFiscal.Create(Nil);
        try
          frmTestImpresoraFiscal.ncfAfectado := dmReportes.qryViewVentasMastNUMERO_NCF.Value;
          frmTestImpresoraFiscal.LCantCopias := rxspinImpCantCopias.Text;
          frmTestImpresoraFiscal.BitBtn1Click(Self);
          frmTestImpresoraFiscal.btnImprimeReciboClick(Self);
        finally
        frmTestImpresoraFiscal.Free;
        frmTestImpresoraFiscal:= Nil;
        //Delay(1000);
        ReactivarValores;
        end;
      end;
      BitBtn17.Enabled:=True;
      BitBtn11.Enabled:=True;
      BitBtn15.Enabled:=True;
      BitBtn18.Enabled:=True;
      BitBtn19.Enabled:=True;
      EsModificandoFactura    :=False;
      GlbUsandoCotiza :=False;
      bitBtnEditarFact.Visible:=False;
      bitBtnEditarFact.Top := BitBtn6.Top;
      bitBtnEditarFact.SendToBack;
      Label36.Visible:=False;
      ActivarBotonesEnModifica;
      tablaPropietario.Close;
      tablaPropietario.Open;
      lblFechaCotizacion.Visible:=False;
      dbFechaCotizacion.Visible:=False;
      EsModificandoCotiza:=False;
      EsDevolucion := False;
     _NumeroCotiza:=-1;
      glbcodVendedor := -1;

      lblFechaCotizacion.Visible:= False;
      dbFechaCotizacion.Visible := False;
      Label36.Visible := False;
      Label36.caption:='';

      {bitBtnEditarFact.Enabled  := True;
      lblFechaCotizacion.Visible:= False;
      dbFechaCotizacion.Visible := False;
      Label36.Visible := False;
      Label36.caption:='';
      rdgFactServicio.Checked := False;
      GlbUsandoCotiza:= False;
      esContado :=False;
      Totales.Close;
      Totales.Open;

      Refresh;
      numerodocReimp := -1;}

      Application.ProcessMessages;
    end else
    begin
      if (dmFactura.qryVentaFacturaTIPO_FACTURA.Value = 6 ) or
      (dmFactura.formaPago = 6 ) then
      begin
        LlenarrxSolDatoscte(dmFactura.qryVentaFacturaCODIGO_CTE.Value);
        if (UpperCase(GLBFormatoFactura) = 'CASANDRA2') then  //PENDIENTE DE ANALISIS
        begin
          qckRepRecibo8_5_11REspReimp :=TqckRepRecibo8_5_11REspReimp.Create(Nil);
          try
            if EsDevolucion then
            begin
              qckRepRecibo8_5_11REspReimp.xtipoVenta:= TipoVenta;
            end;
            qckRepRecibo8_5_11REspReimp.QRLabel28.Enabled:=False;
            qckRepRecibo8_5_11REspReimp.QRDBText23.Enabled:=False;
            qckRepRecibo8_5_11REspReimp.QRDBText11.Enabled:=False;

            if not dmReportes.qryViewVentasMastNUMERO_NCF.IsNull then
            qckRepRecibo8_5_11REspReimp.valorNCF:= qckRepRecibo8_5_11REspReimp.valorNCF
            else
            qckRepRecibo8_5_11REspReimp.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;
            //qckRepRecibo8_5_11REspReimp.qrtipoVenta.Caption:= 'NOTA CREDITO';
            qckRepRecibo8_5_11REspReimp.xtipoVenta:= 'NOTA CREDITO (Devolución)';
            if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
            begin
              qckRepRecibo8_5_11REspReimp.PrinterSetup;
              qckRepRecibo8_5_11REspReimp.Print;
            end else
            qckRepRecibo8_5_11REspReimp.Preview;
          finally
          qckRepRecibo8_5_11REspReimp.Free;
          qckRepRecibo8_5_11REspReimp:= Nil;
          end;
          EsModificandoCotiza:= False;
          label36.Caption    := '';
          NoTieneCredito     := False;
          //Refresh;
          EsDevolucion       := False;
          BitBtn6.Enabled := True;
          BitBtn6.BringToFront;
        end else
        if (GlbFacturaLicoreria =1) then
        begin
          //qckRepRecibo8_5_11REsp:=TqckRepRecibo8_5_11REsp.Create(Nil); //ANTERIOR SEP 13 2015
          qckRepRecibo8_5_11REsp := TqckRepRecibo8_5_11REsp.Create(Nil);
          try
            if GlbSizeFact8x11 = 1 then
            qckRepRecibo8_5_11REsp.Page.Length := 11;
            qckRepRecibo8_5_11REsp.xtipoVenta := 'NOTA CREDITO';
            qckRepRecibo8_5_11REsp.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;

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
          //if GlbRec3Pulg = 1 then
          //begin
            //put here
          //end else
          begin
            qckFactCredArtioffice8_5_F_1:=TqckFactCredArtioffice8_5_F_1.Create(nil);
            try
              qckFactCredArtioffice8_5_F_1.qrLabelFactOrigen.Caption:='';
              if EsDevolucion then
              begin
                //if EsModificandoFactura then
                qckFactCredArtioffice8_5_F_1.qrLabelFactOrigen.Caption:='#Factura: ' + IntToStr(UProcesarDevolucion.numeroFactura);

                qckFactCredArtioffice8_5_F_1.QRLabel4.Caption := 'NOTA CREDITO';
              end;
              qckFactCredArtioffice8_5_F_1.strtipodoc := 'NOTA CREDITO';
              qckFactCredArtioffice8_5_F_1.Preview;
            finally
            qckFactCredArtioffice8_5_F_1.free;
            qckFactCredArtioffice8_5_F_1:=nil;
            end;
          end;
        end;
      end else
      begin
        ImpFacturaservicio(dmfactura.qryFactReimpMaster.Params[0].Value, True);
      end;
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
    try
      Totales.EmptyTable;
      Totales.Close;
      Totales.Open;
    Except
    end;
    lblProcDev.Visible := False;
    tablaPropietario.Close;
    tablaPropietario.Open;
    rxventa.EnableControls;
    rxventa.Close;
    rxventa.Open;
    tablaPropietario.EmptyTable;
    EsModificandoFactura:= False;
    lblProcDev.Visible  := EsDevolucion;
    if lblProcDev.Visible = false then
    lblProcDev.SendToBack else
    lblProcDev.BringToFront;
    BitBtn6.Enabled := True;
    BitBtn6.BringToFront;
    Exit;
  end; //FIN MODIFICAR FACTURA
  end;
  //***********************************PROCESO DEVOLUCION PARCIAL *************
  if (EsDevolucion) And (rxVenta.RecordCount > 0) then
  begin
    if dmFactura.qryVentaFactura.State = dsInactive then
    begin
      MessageDlg('Transacción no puede ser procesada como devolución, verifique.', mtInformation, [mbok], 0);
      Exit;
    end;

    //{Inicio Temporal   ----VOLVER AQUI CON LA DEVOLUCION
    if (GlbActivaIFiscal = 0) And (tablaPropietarioCodigoPropietario.IsNull Or
       (tablaPropietarioCodigoPropietario.Value = 0)) then
    Begin
      rxVenta.DisableControls;
      rxVenta.First;
      if rxVentaglbcodVendedor.Value > 0 then
         GlbcodVendedor:= rxVentaglbcodVendedor.Value;
      //ActualizaVentaMaster('6', UProcesarDevolucion.seriencfasignado);//Devolucion
      //ProcInsertarVtaMastEnDevolucion(UProcesarDevolucion.seriencfasignado);
      NumTrnGen := -1;
      NumOrden  := -1;
      ProcInsertarVtaMastCashEnDev(NumTrnGen,NumOrden);
      rxVenta.First;
      While Not rxVenta.Eof Do
      begin
        ibStpActualizaInvProd.Params[0].Value:= rxVentaCodArticulo.Value;
        ibStpActualizaInvProd.Params[1].Value:= rxVentaCant.Value;
        ibStpActualizaInvProd.Params[2].Value:= 1;//tipoTrn
        ibStpActualizaInvProd.Params[3].Value:= 1;//porCodigo
        if (rxVentaInvetariar.Value <> 0) And (GlbCodDivInventario = 1) then
        ibStpActualizaInvProd.ExecProc;

        InsertarDetDevolucionCash(ipStpInsertVentMast.Params[0].Value);

        ibStpActualizaInvProd.Params[0].Value:= rxVentaCodArticulo.Value;
        if (rxVentaTipoUnidad.Value = 3) Or (rxVentaTipoUnidad.Value = 0) then
        ibStpActualizaInvProd.Params[1].Value:= rxVentaCant.Value
        else
        begin
          ibStpActualizaInvProd.Params[1].Value:= rxVentaCant.Value * CantUnidad;
        end;
    
        if (rxVentaTipoVenta.Value = 0) Or (rxVentaTipoVenta.IsNull ) then //Item de Venta
        ActualizaInvAlmacen;//Actualiza Division Inventario

        //ActualizaInvAlmacen;
        rxVenta.Next;
      end;
      //ProcDevoluconCash;
      rxVenta.EnableControls;
      //ReImprimeDevolucionsinFact1Click(Self);
      ReImpDevolucion(NumOrden,_flag);
      UProcesarDevolucion.numeroFactura :=-1;
      ProcActualizaMsg;
      EsModificandoCotiza:= False;
      label36.Caption    := '';
      NoTieneCredito     := False;
      //Refresh;
      EsDevolucion       := False;
      //EsDevolucion := Not EsDevolucion;
      lblProcDev.Visible := EsDevolucion;
      if lblProcDev.Visible = false then
      lblProcDev.SendToBack else
      lblProcDev.BringToFront;
      lblProcDev.Left:= 192;
      rxventa.EmptyTable;
      rxSolDatoscte.EmptyTable;
      lblProcDev.Caption  :='Proceso Venta';
      EsModificandoFactura:=False;
      qryInventario.Close;
      qryInventario.Open;
      qryProductos.Close;
      qryProductos.Open;
      numeroTrnVta:= 0;
      GlbcodVendedor:=-1;
      rxventa.EnableControls;
      Refresh;
      lblProcDev.Visible := False;
      Exit;
    end;
    //Final Temporal

    if (dmFactura.qryVentaFacturaNumero_ncf.Value <> '') then
    begin
      if (TotalesTipoNCFIFiscal.Value = -1) then
      begin
        Totales.Edit;
        //TotalesTipoNCFIFiscal.Value
        TotalesTipoNCFIFiscal.Value:= 2;//2;
        Totales.Post;
      end else
      if (TotalesTipoNCFIFiscal.Value = 0) then
      begin
        Totales.Edit;                //dmFactura.ibQryViewNCF.sql.text
        //TotalesTipoNCFIFiscal.Value
        TotalesTipoNCFIFiscal.Value:=dmFactura.ibQryViewNCFTIPO_NCFNCR.Value;//2;
        Totales.Post;
      end else
      if (TotalesTipoNCFIFiscal.Value = 1) then
      begin
        Totales.Edit;
        TotalesTipoNCFIFiscal.Value:=dmFactura.ibQryViewNCFTIPO_NCFNCR.Value;//3;
        Totales.Post;
      end else
      if (TotalesTipoNCFIFiscal.Value = 5) then
      begin
        //MessageDlg('No permitido', mtInformation, [mbok],0);
        //Exit;
        Totales.Edit;
        TotalesTipoNCFIFiscal.Value:=dmFactura.ibQryViewNCFTIPO_NCFNCR.Value;
        Totales.Post;
      end else
      if (TotalesTipoNCFIFiscal.Value = 4) then
      begin
        Totales.Edit;
        TotalesTipoNCFIFiscal.Value:=dmFactura.ibQryViewNCFTIPO_NCFNCR.Value;
        Totales.Post;
      end else
      begin
        MessageDlg('No permitido', mtInformation, [mbok],0);
        Exit;
      end;
      end else
      begin
        Totales.Edit;
        TotalesTipoNCFIFiscal.AsVariant:= null;
        TotalesTipoNCF.AsVariant := null;
        Totales.Post;
      end;

    if TotalesMoneda.IsNull then
    begin
      MessageDlg('Favor indicar moneda.', mtInformation, [mbok], 0);
      Exit;
    end;  
    if MessageDlg('Desea procesar transacción como devolución?', mtWarning, [mbYes, mbNo],0)= mrYes then
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
    if TotalesTipoNCFIFiscal.IsNull then
    UProcesarDevolucion.GeneraNCF:= False
    else
    UProcesarDevolucion.GeneraNCF:= True;
    //UProcesarDevolucion.UpdateBLCCXC := dmFactura.qryVentaFacturaNUMEROFACTURA.Value > 0;
    if dmFactura.qryVentaFacturaFORMA_PAGO.Value in [7,8,15] then
    UProcesarDevolucion.UpdateBLCCXC  := True
    else
    UProcesarDevolucion.UpdateBLCCXC := False;

    if UProcesarDevolucion.GeneraNCF then
    UProcesarDevolucion.Ejecutar('04', TotalesTipoNCFIFiscal.Value, dmFactura.qryVentaFacturaNUMERO.Value)//Comprogante Fiscal Nota de Credito
    else
    UProcesarDevolucion.Ejecutar('', -1, dmFactura.qryVentaFacturaNUMERO.Value);

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
    if (GlbActivaIFiscal = 1 ) then
    begin
      dmdatos.qryConfCajaXusuario.Close;
      dmdatos.qryConfCajaXusuario.Open;
      dmdatos.qryConfCajaXusuario.Locate('COD_EMPLEADO',VarUsuarioGlb,[]);

      dmReportes.qryDatosCajaImpUser.Close;
      dmReportes.qryDatosCajaImpUser.Params[0].Value:= VarUsuarioGlb;
      dmReportes.qryDatosCajaImpUser.Open;
      dmReportes.qryDatosCajaImpUser.Last;
      dmReportes.qryDatosCajaImpUser.RecordCount;
      dmFactura.qryDatosTrncxc.Close;

      dmFactura.qryDatosTrncxc.Params[0].AsInteger:= 1;
      dmFactura.qryDatosTrncxc.Params[1].AsInteger:= UProcesarDevolucion.numeroFactura;
      dmFactura.qryDatosTrncxc.Open;

      GlbNombreFiletoPrint:= Format('%s%s%s%s%s%s%s',[dmReportes.qryDatosCajaImpUserRUTA_TICKET.Value,'\NotaCredito',Trim(GlbCodSucursal),Trim(GlbModeloImpresora),
      IntToStr(VarUsuarioGlb),IntToStr(dmFactura.qryDatosTrncxcNUM_DOC.Value),'.txt']);
      //if (dmfactura.qryDatosTrncxc.State = dsInactive) then
      //begin
      //end;

      dmReportes.qryDatosVentaMaster.Close;
      dmReportes.qryDatosVentaMaster.Params[0].Value:= numeroTrnVta; //dmFactura.qryVentaFacturaNumero.Value;
      dmReportes.qryDatosVentaMaster.Open;
      
      PrepararInfoFiscalNCR(dmFactura.qryDatosTrncxcNUM_DOC.Value);
      dmReportes.qryDatosRepTranscxcIFiscal.Last;
      dmReportes.qryDatosRepTranscxcIFiscal.First;

            
      dmFactura.qryGetNcfAsignado.Close;
      if esContado then //contado
      dmFactura.qryGetNcfAsignado.SQL.Text:=dmFactura.qryGeNcfAsignado_1.SQL.Text
      else
      dmFactura.qryGetNcfAsignado.SQL.Text:=dmFactura.qryGetNcfAsignado_0.SQL.Text;
      //if esContado then
      dmFactura.qryGetNcfAsignado.Params[0].Value:= dmReportes.qryViewVentasMastNUMERO.Value;
      //else
      //dmFactura.qryGetNcfAsignado.Params[0].Value:= dmFactura.qryVentaFacturaNUMERO.Value;

      dmFactura.qryGetNcfAsignado.Open;
      dmFactura.qryVentaFactura.Last;

      if (dmReportes.qryViewVentasMastNUMERO_NCF.Isnull) then
      begin
        MessageDlg('Se requiere NCF afectado para Nota de Crédito, verifique.', mtError, [mbOk], 0);
        Exit;
      end;
      if (dmfactura.qryDatosTrncxc.State = dsInactive) then
      begin
        dmFactura.qryDatosTrncxc.Params[0].AsInteger:= 1;
        dmFactura.qryDatosTrncxc.Params[1].AsInteger:= dmReportes.qryViewVentasMastNUMERO_FACTURA.Value;
        dmFactura.qryDatosTrncxc.Open;
      end;
      if (dmfactura.qryDatosTrncxc.RecordCount = 0) then
      begin
        MessageDlg('Nota de Crédito no disponible para impresión, verifique.', mtError, [mbOk], 0);
        Exit;
      end else
      begin

        frmTestImpresoraFiscal:= TfrmTestImpresoraFiscal.Create(Nil);
        try
          frmTestImpresoraFiscal.ncfAfectado := dmReportes.qryViewVentasMastNUMERO_NCF.Value;
          frmTestImpresoraFiscal.LCantCopias := rxspinImpCantCopias.Text;
          frmTestImpresoraFiscal.BitBtn1Click(Self);
          frmTestImpresoraFiscal.btnImprimeReciboClick(Self);
        finally
        frmTestImpresoraFiscal.Free;
        frmTestImpresoraFiscal:= Nil;
        end;
        Delay(1000);
        //frmTestImpresoraFiscal.ncfAfectado := dmReportes.qryViewVentasMastNUMERO_NCF.Value;
        //frmTestImpresoraFiscal.LCantCopias := rxspinImpCantCopias.Text;
        //frmTestImpresoraFiscal.BitBtn1Click(Self);
        //frmTestImpresoraFiscal.btnImprimeReciboClick(Self);
        ReactivarValores;
      end;
    end else //No Fiscal
    ReImprimeDevolucionsinFact1Click(Self);
    UProcesarDevolucion.numeroFactura :=-1;
    ProcActualizaMsg;
    EsModificandoCotiza:= False;
    label36.Caption    := '';
    NoTieneCredito     := False;
    //Refresh;
    EsDevolucion       := False;
    //EsDevolucion := Not EsDevolucion;
  lblProcDev.Visible := EsDevolucion;
  if lblProcDev.Visible = false then
  lblProcDev.SendToBack else
  lblProcDev.BringToFront;
  lblProcDev.Left:= 192;
  rxventa.EmptyTable;
  rxSolDatoscte.EmptyTable;
  lblProcDev.Caption  :='Proceso Venta';
  EsModificandoFactura:=False;
  qryInventario.Close;
  qryInventario.Open;
  qryProductos.Close;
  qryProductos.Open;
  numeroTrnVta:= 0;
  GlbcodVendedor:=-1;
  rxventa.EnableControls;
  Refresh;
  lblProcDev.Visible := False;
  exit;
  end;

 //---EN PRUEBA RE-hABILITAR PARA CONTINUAR
 // }
  EsDevolucion := Not EsDevolucion;
  lblProcDev.Visible := EsDevolucion;
  if lblProcDev.Visible = false then
  lblProcDev.SendToBack else
  lblProcDev.BringToFront;
  lblProcDev.Left:= 192;
  For x:=1 To 50 Do
  begin
    lblProcDev.Left:=lblProcDev.Left - 1;
  end;
  BitBtn4.Enabled    := True;
  BitBtn6.Enabled    := True;
  EsNotaCRParcial    := False;
  if EsDevolucion then
  begin
    lblProcDev.Caption:='Procesando Devolución';
    ProcGetDatosDevparaNotaCR;//Cargar datos
    EsNotaCRParcial:=True;
    if not _abortar then
    Exit;
  end
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
  //if rxventa.Recordcount = 0 then Exit;
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
    rxventa.EnableControls;
    try
    Totales.EmptyTable;
    lblProcDev.Visible := False;
    tablaPropietario.Close;
    tablaPropietario.Open;
    rxventa.EmptyTable;
    except
    end;
  EsModificandoFactura    :=False;
  GlbUsandoCotiza :=False;
  bitBtnEditarFact.Visible:=False;
  bitBtnEditarFact.Top := 475;
  bitBtnEditarFact.SendToBack;
  Label36.Visible:=False;
  ActivarBotonesEnModifica;
  tablaPropietario.Close;
  tablaPropietario.Open;
  lblFechaCotizacion.Visible := False;
  dbFechaCotizacion.Visible  := False;
  EsModificandoCotiza := False;

  _NumeroCotiza  := -1;
  glbcodVendedor := -1;
  
  numerodocReimp := -1;
  tblMoneda.Close;
  tblMoneda.Open;
  sqlAsignado:=False;
  sumarDatos:=True;
  GlbImprimeReciboFact := 1;
  InactivaImprecibo    := False;
  EsModificandoFactura := False;
  cboxTipoUnidad.Clear;
  bitBtnEditarFact.Visible := False;

  lblProcDev.Visible := False;
  UProcesarDevolucion.numeroFactura := 0;
  dmFactura.qryVentaFactura.Close;
  dmFactura.qryDatosTrncxc.Close;
  dmfactura.qryFactReimpDet.Close;

  Refresh;
  Application.ProcessMessages;
end;

procedure TfrmProcVentaRapidaByM.DBEdit2Enter(Sender: TObject);
begin
  edtCodigo.Text := '';
  pesoProd := '';
  if (GlbNumero > 0) then
  if rxVenta.State = dsbrowse then
  rxVenta.Locate('Serie', GlbNumero,[]);
  DBEdit2.SelectAll;
  aPrecio:= rxVentaPrecio.Value;
end;

procedure TfrmProcVentaRapidaByM.chkExentoExit(Sender: TObject);
var
  _book : TBookmark;
begin
 //aqui voy divison
  WriteToLog('Llamada a ChkExentoExit');
  if (rxVenta.Recordcount > 1) then
  begin
    _book :=  rxVenta.GetBookmark;
    SumarDatos := False;
    rxVenta.DisableControls;
    rxVenta.First;
    RxDBGrid1.DisableScroll;
    While Not rxVenta.Eof Do
    begin
      if (rxVentaStatus.Value = 'C') then
      begin
        rxVenta.Next;
        continue;
      end;
      rxVenta.Edit;
      //t Marzo 17 2015 ProcesaCalculos;
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
    //t Marzo 17 2015 ProcesaCalculos;
    //rxVenta.Post;
  end;
  rxVenta.EnableControls;
  RxDBGrid1.EnableScroll;
end;

procedure TfrmProcVentaRapidaByM.RxDBGrid2KeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = '#13' then
  RxDBGrid2DblClick(Self);
end;

procedure TfrmProcVentaRapidaByM.RxDBGrid2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = 13 then
  RxDBGrid2DblClick(Self);
end;

procedure TfrmProcVentaRapidaByM.AsignarSqlText(campo, valor,OrderBy: String);
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

procedure TfrmProcVentaRapidaByM.chkExentoEnter(Sender: TObject);
begin
  chkExento.SetFocus;
end;

procedure TfrmProcVentaRapidaByM.RxDBGrid2GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if qryProductosCANTIDAD.Value <=5 then
  begin
    BackGround := clYellow;
    aFont.Color := clblack;
  end;
end;

procedure TfrmProcVentaRapidaByM.ReImprimirRecibo1Click(Sender: TObject);
begin
  if rxVenta.RecordCount > 0 then
  begin
    MessageDlg('Terminar o cancelar transaccion en curso.',mtInformation,[mbok],0);
    exit;
  end;
  
  frmEdicionVenta:=TfrmEdicionVenta.Create(Nil);
  try
    frmEdicionVenta.tblDatosVenta.Close;
    frmEdicionVenta.tblDatosVenta.Params[0].Value:= ExtraerFecha(GlbFechaTrnDiaria);
    frmEdicionVenta.tblDatosVenta.Open;
    if Not EsModificandoFactura and not esContado  And (numerodocReimp <= 0) then
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
        //frmProcVentaRapidaEdicion.rxVenta.State;
        frmProcVentaRapidaEdicion.rxVenta.Append;
        frmProcVentaRapidaEdicion.rxVentaSerie.Value       := frmEdicionVenta.tblDatosDetSERIE.Value;
        frmProcVentaRapidaEdicion.rxVentaglbcodVendedor.Value := frmEdicionVenta.qryClientesCOD_VENDEDOR.Value;
        frmProcVentaRapidaEdicion.rxVentaItbi.Value:=0;

        frmProcVentaRapidaEdicion.rxVentaNumeroTrn.Value   := frmEdicionVenta.tblDatosDetNUMERO.Value;

        frmProcVentaRapidaEdicion.rxVentaNumeroRecibo.Value:= frmEdicionVenta.tblDatosVentaNUMERO_DOC_PAGO.AsInteger;
        if not frmEdicionVenta.tblDatosVentaNUMERO_DOC_PAGO.IsNull then
        frmProcVentaRapidaEdicion.rxVentaNumeroDoc.Value:=   frmEdicionVenta.tblDatosVentaNUMERO_DOC_PAGO.AsInteger
        else
        if not frmEdicionVenta.tblDatosVentaNUMERO_FACTURA.IsNull then
        frmProcVentaRapidaEdicion.rxVentaNumeroDoc.Value:= frmEdicionVenta.tblDatosVentaNUMERO_FACTURA.Value;
        
        frmProcVentaRapidaEdicion.rxVentaNumeroRecibo.Value:= frmEdicionVenta.tblDatosDetNUMERO.Value;
        frmProcVentaRapidaEdicion.rxVentaMoneda.Value      := frmEdicionVenta.tblDatosVentaMONEDA.Value;
        frmProcVentaRapidaEdicion.rxVentaMonedaBase.Value  := GetMonedaProducto(frmEdicionVenta.tblDatosDetCODIGO_PROD.AsInteger);
        frmProcVentaRapidaEdicion.rxVentamonto_tasa.Value := GlbMontoTasa(frmProcVentaRapidaEdicion.rxVentaMonedaBase.Value);
        
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
        if frmProcVentaRapidaEdicion.Totales.State = dsBrowse then
        frmProcVentaRapidaEdicion.Totales.Edit;
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

procedure TfrmProcVentaRapidaByM.FormShow(Sender: TObject);
begin
  ProcActUltTrn;
  isShowing:=True;
  if (GlbActivaCafeteria = 1) then
  label26.Visible := True
  else label26.Visible := False;
  SkinData1.Active := False;
  Application.ProcessMessages;
  SkinData1.Active := True;
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
  dmInventario.qryTipoUnidad.Close;
  dmInventario.qryTipoUnidad.Open;
  {
  if (GlbActivaIFiscal = 1) then
  begin
    if Not CheckPortComDisponible then
    begin
      lblStatusImpFiscal.Visible := True;
      lblStatusImpFiscal.Font.Color:= clRed;
    end else
    begin
      lblStatusImpFiscal.Visible := False;
    end;
  end;
  }
  if canCloseAlquiler then
  close
  else
  if Assigned(frmAlquiler) and canCloseAlquiler then
  begin
    frmAlquiler.hide;
    //frmAlquiler.free;
    //frmAlquiler:=nil;
  end;
end;

procedure TfrmProcVentaRapidaByM.RxLabel1Click(Sender: TObject);
begin
  ProcActUltTrn;
  Refresh;
  if GLBIFiscalOpeAbierta then
  begin
    if MessageDlg('Ultima operacion fiscal, presentó un fallo. Cancelar ahora?',
       mtInformation,[mbyes, mbno],0) = mryes then
    begin
    end;
  end;
end;

procedure TfrmProcVentaRapidaByM.ProcVenta(valorNCF:String;Serie_Asignadoncf:Integer; Var serieDoc:Integer);
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
  ipStpInsertVentMast.Params[13].Value   := Null;
  ipStpInsertVentMast.Params[14].Value   := SerieDoc;//Numero Factura
  ipStpInsertVentMast.Params[15].Value   := Null; //yo soy inteligencia divina
  //ver mas abajo
  //ipStpInsertVentMast.Params[16].Value:= Serie_Asignadoncf;
  ipStpInsertVentMast.Params[17].Value:= TotalesSubTotal.Value;
  ipStpInsertVentMast.Params[18].Value:= TotalesPorcDesAdicional.Value;
  if TotalesMontoDescAdicional.Value > 0 then
  ipStpInsertVentMast.Params[19].Value:= TotalesMontoDescAdicional.Value
  else
  ipStpInsertVentMast.Params[19].Value:= TotalesMontoDescItems.Value;
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
  ipStpInsertVentMast.Params[35].Value:= TotalesRecargo.Value;
  ipStpInsertVentMast.Params[36].Value:= TotalesTipoNCFIFiscal.Value;
  ipStpInsertVentMast.Params[37].Value:= TotalesMontoExoneraITBIS.Value;
  ipStpInsertVentMast.Params[38].Value:= 0;
      
  if Serie_asignadoncf > 0 then
  ipStpInsertVentMast.Params[16].Value     := Serie_Asignadoncf
  else ipStpInsertVentMast.Params[16].Value:= Null;
  //serie_ncf_asignado
  ipStpInsertVentMast.ExecProc;
  numeroTrnVta:= ipStpInsertVentMast.Params[0].Value;
  if Assigned(frmRegServicioTaller) then
  UpdateServINFO(ipStpInsertVentMast.Params[0].Value);
  if Assigned(frmAlquiler) then
  UpdateServAlquiler(ipStpInsertVentMast.Params[0].Value);
  //t SerieDoc := temporal arreglar numero de Factura
  if Not ipStpInsertVentMast.Transaction.InTransaction then
  ipStpInsertVentMast.Transaction.StartTransaction;
  try
    ipStpInsertVentMast.Transaction.CommitRetaining;
  except
  ipStpInsertVentMast.Transaction.RollbackRetaining;
  end;
  numeroTrnVta:= ipStpInsertVentMast.Params[0].Value;

  //tblNiv_ctrl
  FInsertarDatosCtrlNIF(numerotrnvta);
  
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
    rxVenta.Next;
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
        frmTestImpresoraFiscal.LCantCopias := rxspinImpCantCopias.Text;
        frmTestImpresoraFiscal.Button1Click(Self);
        frmTestImpresoraFiscal.btnImprimeReciboClick(Self);//Button1Click(Self);
      finally
      frmTestImpresoraFiscal.Free;
      frmTestImpresoraFiscal:=Nil;
      end;
      Delay(1000);
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

procedure TfrmProcVentaRapidaByM.LectorCodBarra1Click(Sender: TObject);
begin
  LectorCodBarra1.Checked:= Not LectorCodBarra1.Checked;
  if lectorcodbarra1.Checked then
  edtCodigo.Hint:='Enter - para buscar codigo barra. F10-on/off'
  else edtCodigo.Hint:= '';
  imbBarcode.Visible := LectorCodBarra1.Checked;
end;

procedure TfrmProcVentaRapidaByM.Edit1Enter(Sender: TObject);
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

procedure TfrmProcVentaRapidaByM.ImprimirLabel1Click(Sender: TObject);
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

procedure TfrmProcVentaRapidaByM.NoGenerarNCF1Click(Sender: TObject);
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

procedure TfrmProcVentaRapidaByM.BitBtn16Click(Sender: TObject);
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

procedure TfrmProcVentaRapidaByM.Finalizardisplay;
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

procedure TfrmProcVentaRapidaByM.ActualizaInvAlmacen;
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

procedure TfrmProcVentaRapidaByM.FormHide(Sender: TObject);
begin
  isShowing:=False;
end;

procedure TfrmProcVentaRapidaByM.qryClienteAfterScroll(DataSet: TDataSet);
begin
  AbrirClasifPrecio;
end;

procedure TfrmProcVentaRapidaByM.qryProductosAfterScroll(DataSet: TDataSet);
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

procedure TfrmProcVentaRapidaByM.AbrirClasifPrecio;
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

procedure TfrmProcVentaRapidaByM.AplicaPrecioMayorista;
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
    //t Marzo 17 2015 ProcesaCalculos;ProcesaCalculos;

    if rxVenta.State In [dsEdit, dsInsert] then
    rxVenta.Post;
    //WriteToLog('Post rxVenta - Line 5506');

    rxVenta.Next;
  end;

  sumarDatos:=True;
  rxVenta.AutoCalcFields := False;
end;

procedure TfrmProcVentaRapidaByM.RxDBLookupCombo1Exit(Sender: TObject);
begin
  RxDBLookupCombo1Change(Self);
  
  if rxVenta.RecordCount = 0 then exit;
  AbrirClasifPrecio;

  AplicaPrecioMayorista;
  
  if qryClienteUSARLEVELPRECIO.Value > 0 then
  RxSpinEdit1.Value:= qryClienteUSARLEVELPRECIO.Value;

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

function TfrmProcVentaRapidaByM.VerificaLimiteCredito(codigocte: integer;
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

procedure TfrmProcVentaRapidaByM.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if Assigned(frmAlquiler) and (not canCloseAlquiler ) then
  begin
    CanClose:=False;
    Hide;
    frmAlquiler.Show;
    exit;
  end;

  if Assigned(frmConsultaFacturas) then
  begin
    CanClose:=False;
    frmRegServicioTaller.Show;
    exit;
  end;
  if (rxVenta.RecordCount > 0) then
  begin
    if VerificaClave then
    begin
      CanClose := True;
      qryInventario.Close;
      qryProductos.Close;
      qryCliente.close;
       if Assigned(frmAlquiler) then
       begin
         frmAlquiler.Free;
         frmAlquiler:=Nil;
       end;
    end;// else CanClose:= False;
  end;
end;

procedure TfrmProcVentaRapidaByM.RxDBGrid3DblClick(Sender: TObject);
begin
  RxDBGrid3.Visible := False;
end;

procedure TfrmProcVentaRapidaByM.SecretPanel1DblClick(Sender: TObject);
begin
  RxDBGrid3.Visible   := True;
  SecretPanel1.Visible:= False;
end;

procedure TfrmProcVentaRapidaByM.NoMostrarProdVencidos1Click(Sender: TObject);
begin
  NoMostrarProdVencidos1.Checked:= Not NoMostrarProdVencidos1.Checked;
  if NoMostrarProdVencidos1.Checked Then
  begin
    SecretPanel1.Visible := True;
    SecretPanel1.Active  := True;
  end
  else SecretPanel1.Visible := False;
end;

procedure TfrmProcVentaRapidaByM.rxLabelVenceDblClick(Sender: TObject);
begin
  RxDBGrid3.Visible:= True;
end;

procedure TfrmProcVentaRapidaByM.cboxTipoUnidadChange(Sender: TObject);
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

  rxVentaDescUnidadMedida.Value:=cboxTipoUnidad.Text;

  if rxVenta.State In [dsInsert, dsEdit] Then
  rxVenta.Post;

end;

procedure TfrmProcVentaRapidaByM.LlenarTipoUnidadBox(umedida:integer);
begin
  dmInventario.qryTipoUnidad.First;
  cboxTipoUnidad.Items.Clear;
  CantUnidad := 0;
  qryPrecioXTipoUnidad.Close;
  qryPrecioXTipoUnidad.Params[0].Value:=qryProductosCODIGO.Value;
  qryPrecioXTipoUnidad.Open;
  While Not dmInventario.qryTipoUnidad.Eof Do
  begin

    if qryPrecioXTipoUnidad.Locate('ID_UNIDAD',dminventario.qryTipoUnidadIDUNIDAD.Value,[]) then
    begin
      cboxTipoUnidad.Items.Add(dmInventario.qryTipoUnidadDESCRIPCION.Value);
      cantUnidad:=dmInventario.qryTipoUnidadCANTIDAD.Value;
    end;
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

procedure TfrmProcVentaRapidaByM.cboxTipoUnidadExit(Sender: TObject);
begin
  if rxVentaCodTexto.IsNull then exit;
  if rxVentaDescUnidadMedida.isNull or (rxVentaDescUnidadMedida.Value = '') then
  begin
    if rxVenta.State = dsBrowse then rxVenta.Edit;
    rxVentaDescUnidadMedida.Value:=cboxTipoUnidad.Text;
  end;
  cboxTipoUnidadChange(Self);
  if rxVenta.State = dsBrowse then rxVenta.Edit;


  if rxVenta.State In [dsedit,dsInsert] then
  rxVentaTipoUnidad.Value:=GlbTipoUnidad;
  panel2.Visible := False;  
end;

procedure TfrmProcVentaRapidaByM.qryInventarioAfterScroll(DataSet: TDataSet);
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

function TfrmProcVentaRapidaByM.precioXUnidad(idTipoUnidad:Integer;idProducto: Integer): Extended;
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
      result:=rxVentaPrecio.Value;
    end;
  end;
end;

procedure TfrmProcVentaRapidaByM.Label25Click(Sender: TObject);
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

procedure TfrmProcVentaRapidaByM.RxSpeedButton1Click(Sender: TObject);
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

procedure TfrmProcVentaRapidaByM.MaestroInventario1Click(Sender: TObject);
begin
  frmInventarioProd:=TfrmInventarioProd.Create(Nil);
  try
    frmInventarioProd.ShowModal;
  finally
  frmInventarioProd.Free;
  frmInventarioProd:=Nil;
  end;
  qryInventario.Close;
  qryInventario.Params[0].Value:=glbCia_Key;
  qryInventario.Open;

  qryProductos.Close;
  qryProductos.Open;
  
end;

procedure TfrmProcVentaRapidaByM.ImprimirFactura(Avance: Integer);

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


procedure TfrmProcVentaRapidaByM.cboxTipoUnidadEnter(Sender: TObject);
begin
  panel2.Visible := False;
end;

procedure TfrmProcVentaRapidaByM.DBEdit3Exit(Sender: TObject);
begin
  if (rxVentaMontoBruto.Value = 0) or (rxVentaMontoBruto.IsNull) then
  edtCodigo.SetFocus;
end;

procedure TfrmProcVentaRapidaByM.RxDBGrid2Enter(Sender: TObject);
begin
  GlbNumero:= rxVentaSerie.Value;
end;

procedure TfrmProcVentaRapidaByM.RxDBGrid2Exit(Sender: TObject);
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

procedure TfrmProcVentaRapidaByM.rxVentaAfterScroll(DataSet: TDataSet);
begin
  if qryproductos.state = dsBrowse then
  if not rxVentaCodArticulo.IsNull then
  begin
    QryPrecios.Close;
    QryPrecios.Params[0].Value:=rxVentaCodArticulo.Value;
    QryPrecios.Open;
  end;
  //QryPreciosPRECIOVENTA1.value
  if dmInventario.qryTipoUnidad.State = dsInactive then
  dmInventario.qryTipoUnidad.Open;

  if rxVentaTipoUnidad.IsNull then Exit;
  
  if rxVentaTipoUnidad.Value = 0 then Exit;
  
  if Not dmInventario.qryTipoUnidad.Locate('IDUNIDAD', rxVentaTipoUnidad.Value, []) then
  begin
    MessageDlg('Unidad no encontrada, verifique.', mtError, [mbOk], 0);
    exit;
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
    qryProdPorProveedor.Open;

    if qryProdPorProveedor.RecordCount > 0 then
    pnlPrecioProv.Visible:= True else
    pnlPrecioProv.Visible:= False;
  end;
end;

procedure TfrmProcVentaRapidaByM.ConsultaGeneral1Click(Sender: TObject);
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

procedure TfrmProcVentaRapidaByM.BitBtn17Click(Sender: TObject);
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
    //TotalesMoneda.Value := IntToStr(GlbMonedaBase);
    if (GlbMonedaBase > 0) then
    TotalesMoneda.Value   := IntToStr(GlbMonedaBase)
    else
    TotalesMoneda.Value   := '1';

    TotalesSubTotal.Value := 0;
    Totalesitbis.Value    := 0;
    Totalesmontodesc.Value:= 0;
    Totalestotalneto.Value:= 0;
    Totalesmontorecibido.Value:= 0;
    Totalesdevolucion.Value   := 0;
    Totales.Post;
    lblProcDev.Visible := False;
  end;
  frmConsultaPreVenta:=TfrmConsultaPreVenta.Create(Nil);
  try
    if frmConsultaPreVenta.Showmodal = mrOk then
    begin
      rxVenta.Close;
      rxVenta.Open;
      tablaPropietario.EmptyTable;
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
        rxVentaStatus.Value := 'I';
        if (GlbActivaIFiscal = 0) then
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
  BitBtn27Click(Self);
  Refresh;
end;

procedure TfrmProcVentaRapidaByM.CargarPreventa;
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
    rxVentaMonedaBase.Value := GetMonedaProducto(qryProductosCODIGO.AsInteger);
    rxVentaDescripcionEspecial.Value := qryProductosDESCRIPCIONADICIONAL.Value;
    rxVentaCostoProducto.Value       := qryProductosPRECIO_COMPRA.Value;
  end;
  rxVentaReferencia.Value := qryProductosREFERENCIA.Value;
  rxVentaInvetariar.Value:= qryProductosINVENTARIAR.Value;
  rxVentaCodArticulo.Value:= frmConsultaPreVenta.qryPreventaDetCODIGO_PROD.AsInteger;
  rxVentaRutaImagen.Value := BuscarRutaImagen(frmConsultaPreVenta.qryPreventaDetCODIGO_PROD.AsInteger);
  rxVentaMonedaBase.Value := GetMonedaProducto(qryProductosCODIGO.AsInteger);
  rxVentaCodUsuario.Value := frmConsultaPreVenta.qryPreventaMasterCODIGO_VENDEDOR.Value;
  //t Marzo 17 2015 ProcesaCalculos;
end;

procedure TfrmProcVentaRapidaByM.ActualizarPreventa;
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

procedure TfrmProcVentaRapidaByM.InsertaTransCafeteria(numTrn : Integer;codigoP:Integer;cantP:Real);
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

procedure TfrmProcVentaRapidaByM.Label26Click(Sender: TObject);
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

procedure TfrmProcVentaRapidaByM.SpeedButton1Click(Sender: TObject);
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

procedure TfrmProcVentaRapidaByM.rdgFactServicioClick(Sender: TObject);
begin
  panelDescripcionServ.Visible:=True;
  if rxVenta.RecordCount = 0 then exit;
  if CheckBox2.Checked then
  CheckBox3.Checked:=False;
  rxVenta.Edit;
  //t Marzo 17 2015 ProcesaCalculos;
end;

procedure TfrmProcVentaRapidaByM.rdgFactVentaProductoClick(Sender: TObject);
begin
  //panelDescripcionServ.Visible:=False;
  if rxVenta.RecordCount = 0 then exit;
  if CheckBox2.Checked then
  CheckBox3.Checked:=False;
  rxVenta.Edit;
  //t Marzo 17 2015 ProcesaCalculos;
end;

procedure TfrmProcVentaRapidaByM.ProcInsertarRecoverData;
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

procedure TfrmProcVentaRapidaByM.ProcRecoverData(showsms:boolean);
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
    WriteToLog('Recover data rxVenta - Line 6390');
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

procedure TfrmProcVentaRapidaByM.ActualizarRecoverData;
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

procedure TfrmProcVentaRapidaByM.DBMemo1Exit(Sender: TObject);
begin
  if rxVenta.State In [dsEdit, dsInsert] then
  rxVenta.Post;
  //WriteToLog('Post rxVenta - Line 6455');
end;

procedure TfrmProcVentaRapidaByM.RecuperarTransacciones1Click(
  Sender: TObject);
begin
  recuperando := true;
  ProcRecoverData(true);
  recuperando := false;
end;

procedure TfrmProcVentaRapidaByM.EliminarRecoverData;
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

procedure TfrmProcVentaRapidaByM.EliminarRecoverDataAll;
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

procedure TfrmProcVentaRapidaByM.RxSpinEdit1Change(Sender: TObject);
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
  //t Marzo 17 2015 ProcesaCalculos;

  rxVenta.GotoBookmark(guardarRec);
  rxventa.FreeBookmark(guardarRec);
end;

procedure TfrmProcVentaRapidaByM.CalcularDescIndirecto;
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
  end;

  if (TotalesMontoSubTotalIndirectos.Value > 0) then
  begin
    DBText8.Visible := True;
    DBText8.BringToFront;
    Label29.Visible:=True;
    Label29.BringToFront;
  end;
end;

procedure TfrmProcVentaRapidaByM.BitBtn18Click(Sender: TObject);
begin
  frmVerDescFactServicio:=TfrmVerDescFactServicio.Create(Nil);
  try
    frmVerDescFactServicio.ShowModal;
  finally
  frmVerDescFactServicio.Free;
  frmVerDescFactServicio:=Nil;
  end;
end;

procedure TfrmProcVentaRapidaByM.TotalesCalcFields(DataSet: TDataSet);
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

procedure TfrmProcVentaRapidaByM.CheckBox2Exit(Sender: TObject);
begin
  if rxVenta.RecordCount = 0 then exit;
 // if CheckBox2.Checked then
 // CheckBox3.Checked:=False;
  //if (checkbox2.Checked) And (rxVentaCant.Value > 0) then
  //begin
    if (rxVenta.State = dsBrowse) then
    rxVenta.Edit;
    //t Marzo 17 2015 ProcesaCalculos;
  //end;
end;

procedure TfrmProcVentaRapidaByM.CheckBox3Exit(Sender: TObject);
begin
  if rxVenta.RecordCount = 0 then exit;
  //if CheckBox3.Checked then
  //CheckBox2.Checked:=False;
//  if (checkbox3.Checked) And (rxVentaCant.Value > 0) then
//  begin
    rxVenta.Edit;
    //t Marzo 17 2015 ProcesaCalculos;
//  end;
end;

procedure TfrmProcVentaRapidaByM.BitBtn19Click(Sender: TObject);
var
  nF : integer;
begin
  nF := StrtoInt(InputBox('Re-Imprimir Factura','Entre #Factura',''));
  ImpFacturaservicio(nf,true);
end;

procedure TfrmProcVentaRapidaByM.ExportarGridExcel;
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

procedure TfrmProcVentaRapidaByM.BitBtn20Click(Sender: TObject);
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

procedure TfrmProcVentaRapidaByM.ModificarFactura1Click(Sender: TObject);
begin
  if rxVenta.RecordCount > 0 then
  begin
    MessageDlg('Terminar o cancelar transacción en curso.',mtInformation,[mbok],0);
    Exit;
  end;
  frmConsultaFacturas:=TfrmConsultaFacturas.Create(Nil);
  try
    if frmConsultaFacturas.Showmodal = mrOK then
    begin
      if (dmFactura.qryVentaFacturaSTATUS.Value[1] in ['C','R']) then
      begin
        MessageDlg('Factura no está activa, no puede ser modificada.', mtInformation,[mbok],0);
        FreeAndNil(frmConsultaFacturas);
        exit;
      end;
      if VerificaClave then
      begin
        if frmConsultaFacturas.rdgContado.Checked then
        esContado:=True
        else esContado:=False;

        if esContado then
        numerodocReimp := dmFactura.qryVentaFacturaNUMERO.AsInteger
        else
        numerodocReimp := dmFactura.qryVentaFacturaNUMERO_FACTURA.Value;

        LlenandoDatos:=True;
        CargarDatosAModificar;
        LlenandoDatos :=False;
        DBEdit10Exit(Self);
        Edit1Enter(Self);
        ActivarBotonesEnModifica;
        //bitBtnEditarFact.Left:=713;
        //bitBtnEditarFact.Left:=BitBtn6.Left;
      end;
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

procedure TfrmProcVentaRapidaByM.CargarDatosAModificar;
var
  xDesc : String;
  x: integer;
begin
  if ((UpperCase(GLBFormatoFactura) = 'INGESERVIS')) then
  rdgFactServicio.Checked:=true;//Debe cargar esto desde la tabla
  BitBtn18.Enabled := rdgFactServicio.Checked;
  if (Totalesmontorecibido.Value > 0) And (rxVenta.RecordCount > 0) then
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

    if Not dmFactura.qryVentaFacturaTIPONCFIFISCAL.IsNull then
    AsignaNCFCFinalX(dmFactura.qryVentaFacturaTIPONCFIFISCAL.Value);

    TotalesSubTotal.Value := 0;
    Totalesitbis.Value    := 0;
    Totalesmontodesc.Value:= 0;
    Totalestotalneto.Value:= 0;
    Totalesmontorecibido.Value:= 0;
    Totalesdevolucion.Value   := 0;
    Totalesmontorecibido.Value:= dmFactura.qryVentaFacturaMONTO_PAGADO.Value;
    TotalesFechaVence.Value   := dmFactura.qryVentaFacturaFechaVence.Value;

    if Not dmFactura.qryVentaFacturaTIPONCFIFISCAL.IsNull then
    AsignaNCFCFinalX(dmFactura.qryVentaFacturaTIPONCFIFISCAL.Value);

    Totales.Post;
    lblProcDev.Visible := False;
  //end;
  EsModificandoFactura     := True;
  bitBtnEditarFact.Visible := True;
  bitBtnEditarFact.Top     := 475;
  bitBtnEditarFact.BringToFront;
  Label36.Visible := True;
  Label36.Caption := 'Modificando Factura:' + dmFactura.qryVentaFacturaNUMERO_FACTURA.AsString;
  rxVenta.Close;
  rxVenta.Open;
  tablaPropietario.EmptyTable;
  qryProductos.Close;
  qryProductos.Open;
  AsignarSqlText('','','');
  dmFactura.qryVentaFacturaDet.First;
  dmReportes.qryViewVentasMast.Close;
  dmReportes.qryViewVentasMast.Params[0].Value := dmFactura.qryVentaFacturaDetNUMERO.Value;
  dmReportes.qryViewVentasMast.Open;

  dmFactura.qryGetNcfAsignado.Close;
  if esContado then //contado
     dmFactura.qryGetNcfAsignado.SQL.Text:= dmFactura.qryGeNcfAsignado_1.SQL.Text
  else
  dmFactura.qryGetNcfAsignado.SQL.Text:= dmFactura.qryGetNcfAsignado_0.SQL.Text;
  //if esContado then
  dmFactura.qryGetNcfAsignado.Params[0].Value:= numerodocReimp;
  //else
  //dmFactura.qryGetNcfAsignado.Params[0].Value:= dmFactura.qryVentaFacturaNUMERO.Value;

  dmFactura.qryGetNcfAsignado.Open;
  if tablaPropietario.RecordCount = 0 then
  tablaPropietario.Insert
  else
  tablaPropietario.Edit;

  if tablaPropietarioCodigoPropietario.IsNull then
  tablaPropietarioCodigoPropietario.Value:= dmReportes.qryViewVentasMastCODIGO_CTE.Value;
  tablaPropietario.Post;
  if (EsModificandoFactura) and (frmConsultaFacturas.RxDBGrid2.SelectedRows.Count = 0) then
  frmConsultaFacturas.RxDBGrid2.SelectAll;
  if frmConsultaFacturas.RxDBGrid2.SelectedRows.Count > 0 then
  begin
    with frmConsultaFacturas.RxDBGrid2.DataSource.DataSet do
    begin
      For x := 0 to frmConsultaFacturas.RxDBGrid2.SelectedRows.Count-1 do
      begin
        GotoBookmark(Pointer(frmConsultaFacturas.RxDBGrid2.SelectedRows.Items[x]));

       //While Not dmFactura.qryVentaFacturaDet.Eof do
       //begin
       if not qryProductos.Locate('Codigo', dmFactura.qryVentaFacturaDetCODIGO_PROD.Value,[]) then
       begin
         MessageDlg(Format('Codigo producto %s no encontrado, verifique.',[dmFactura.qryVentaFacturaDetCODIGO_PROD.AsString]),mtError,[mbOk], 0);
       end;
       //WriteToLog('Post rxVenta - Line 6811');
       rxVenta.Append;
       rxVentaglbcodVendedor.Value := qryClienteCOD_VENDEDOR.Value;
       rxVentaItbi.Value := 0;

       if esContado then
          rxVentaNumeroFactura.Value  := dmFactura.qryVentaFacturaNUMERO.AsInteger
       else
       rxVentaNumeroFactura.Value  := dmFactura.qryVentaFacturaNUMERO_FACTURA.Value;

       if dmFactura.qryVentaFacturaDetSTATUS_DET.IsNull then
       rxVentaStatus.Value        := 'A' else
       rxVentaStatus.Value        := dmFactura.qryVentaFacturaDetSTATUS_DET.Value;

       //if (GlbActivaIFiscal = 0) then
       RxSpeedButton1.Visible:= True;
       //if qryProductos.Locate('CODIGO',dmFactura.qryVentaFacturaDetCODIGO_PROD.Value,[]) then
       rxVentaCodTexto.Value      := qryProductosCODIGO_TEXTO.Value;
       rxVentaCostoProducto.Value := dmfactura.qryVentaFacturadetPrecio_Compra.Value;
       rxVentaCodArticulo.Value   := dmFactura.qryVentaFacturaDetCODIGO_PROD.AsInteger;
       rxVentaSerieOriginal.Value := dmFactura.qryVentaFacturaDetSERIE.Value;
       rxVentaNumeroTrnOriginal.Value := dmFactura.qryVentaFacturaNUMERO.Value;
       rxVentaSerie.Value := dmFactura.qryVentaFacturaDetSERIE.Value;
       rxVentaFecha.Value := dmFactura.qryVentaFacturaFECHA.Value;
       rxVentaMonedaBase.Value :=  GetMonedaProducto(qryProductosCODIGO.Value);

       rxVentamonto_tasa.Value := GlbMontoTasa(rxVentaMonedaBase.Value);
       rxVentaNCF.Value := dmFactura.qryVentaFacturaNUMERO_NCF.Value;
       rxVentaCant.Value  := Abs(dmFactura.qryVentaFacturaDetCANTIDAD.Value);
       rxVentaPrecio.Value:= Abs(dmFactura.qryVentaFacturaDetPRECIO.Value);
       rxVentaporc_desc.Value      := Abs(dmFactura.qryVentaFacturaDetPORC_DESC_DET.Value);
       rxVentaglbcodVendedor.Value := dmFactura.qryVentaFacturaCODIGO_VENDEDOR.Value;
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
       if Totales.State = dsBrowse then
       begin
         Totales.AutoCalcFields:=False;
         Totales.Edit;
       end;
       TotalesCodCliente.Value:=dmFactura.qryVentaFacturaCODIGO_CTE.Value;
       TotalesComentario.Value := dmfactura.qryVentaFacturaCOMENTARIO.Value;

       TotalesPorcDesAdicional.Value:= dmFactura.qryVentaFacturaPORC_DESCUENTO.Value;
       if TotalesPorcDesAdicional.Value > 0 then
       chKDescuentoGlobal.Checked:=True;

       if Totales.State = dsBrowse then
       Totales.Edit;
       TotalesRecargo.Value := dmFactura.qryVentaFacturaMONTO_RECARGO.Value;
       TotalesMontoDescAdicional.Value := dmFactura.qryVentaFacturaMONTO_DESCUENTO.Value;
       if Totales.State = dsBrowse then
          Totales.Edit;
       //volver aqui
       if not dmFactura.qryGetNcfAsignadoTIPO_NCF.IsNull and
       TotalesTipoNCF.IsNull then
       TotalesTipoNCF.Value:= dmFactura.qryGetNcfAsignadoTIPO_NCF.Value;
       //TotalesTipoNCFIFiscal.Value:= dmFactura.qryVentaFacturaTIPONCFIFISCAL.Value;
       //dmfactura.qryVentaFacturaTIPONCFIFISCAL
       RxDBLookupCombo3.Visible:=True;
       if dmFactura.ibQryViewNCF.Locate('TIPO_CF', TotalesTipoNCF.Value,[]) then
         TotalesTipoNCFIFiscal.Value := dmFactura.ibQryViewNCFTIPO_NCF_IFISCAL.Value
       else
       TotalesTipoNCFIFiscal.AsVariant := null; 

       Totales.Post;
       //TotalesTipoNCFIFiscal.ReadOnly := true;

       if (rxVenta.State = dsBrowse) then
       rxVenta.Edit;

       rxVentaInvetariar.Value:= qryProductosINVENTARIAR.Value;
       if  (dmFactura.qryVentaFacturaTIPO_FACTURA.Value = 0) And ((UpperCase(GLBFormatoFactura) = 'INGESERVIS')) then
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

    Totales.AutoCalcFields:=True;

    //t Marzo 17 2015 ProcesaCalculos;
    CheckBox2Exit(Self);
    DBEdit2Exit(Self);
    if rxVenta.State In [dsInsert,dsEdit] then
    rxVenta.Post;
    //WriteToLog('Post rxVenta - Line 6872');

    tablaPropietario.Edit;
    tablaPropietarioCodigoPropietario.Value:=
    dmFactura.qryVentaFacturaCODIGO_CTE.Value;
    tablaPropietario.Post;
    //dmFactura.qryVentaFacturaDet.Next;
    end
   end;
  end;
  RxDBLookupCombo3Exit(Self);
  Refresh;
  {sumarDatos:=True;
  rxVenta.Edit;
  rxVenta.Post; }
end;

procedure TfrmProcVentaRapidaByM.ActualizaVentaDet;
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
    stpUpdateVentaDetU1.Params[26].Value:= rxVentaPorcDescItem.Value;
    //stpUpdateVentaDetU1.Params[27].Value:= rxVentaMontoDescItem.Value;
    if (rxVentaMontoDescItem.Value > 0) then
    stpUpdateVentaDetU1.Params[27].Value := rxVentaMontoDescItem.Value
    else
    stpUpdateVentaDetU1.Params[27].Value := rxVentaMontoDesGlobal.Value;

    stpUpdateVentaDetU1.Params[28].Value := rxVentaMontoDescuento.Value;
    stpUpdateVentaDetU1.Params[29].Value := rxVentaIDTasaITBIS.Value;
    stpUpdateVentaDetU1.Params[30].Value := rxVentaMontoItbisRecargo.Value;
    stpUpdateVentaDetU1.Params[31].Value := rxVentaMoneda.Value;
    stpUpdateVentaDetU1.Params[32].Value := rxVentamonto_tasa.Value;
    
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

procedure TfrmProcVentaRapidaByM.ActualizaVentaMaster(fpago : String;serieNcfAsignado :integer);
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
  stpProc_UpdateVENTAS_MAST_U1.Params[16].Value:= TotalesPorcientoInteres.Value;
  if TotalesMontoDescAdicional.Value > 0 then
  stpProc_UpdateVENTAS_MAST_U1.Params[17].Value:= TotalesMontoDescAdicional.Value
  else
  stpProc_UpdateVENTAS_MAST_U1.Params[17].Value:= TotalesMontoDescItems.Value;
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
  stpProc_UpdateVENTAS_MAST_U1.Params[32].Value:= TotalesRecargo.Value;
  stpProc_UpdateVENTAS_MAST_U1.Params[33].Value:= TotalesMontoExoneraITBIS.Value;  

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

procedure TfrmProcVentaRapidaByM.ActualizaFactura;
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

procedure TfrmProcVentaRapidaByM.ActualizaTransCxc;
begin
  if dmfactura.qryDatosTrncxcSERIE.Value = 0 then Exit;
  stpProcUpdateTrnCxcU1.Params[0].Value:= dmfactura.qryDatosTrncxcSERIE.Value;
  stpProcUpdateTrnCxcU1.Params[1].Value:= glbCia_Key;
  stpProcUpdateTrnCxcU1.Params[2].Value:= dmfactura.qryDatosTrncxcTIPO_DOC.Value;
  stpProcUpdateTrnCxcU1.Params[3].Value:= dmfactura.qryDatosTrncxcMONEDA.Value;
  stpProcUpdateTrnCxcU1.Params[4].Value:= dmfactura.qryDatosTrncxcFECHA.Value;
  stpProcUpdateTrnCxcU1.Params[5].Value:= dmfactura.qryDatosTrncxcNUM_DOC.Value;
  stpProcUpdateTrnCxcU1.Params[6].Value:= tablaPropietarioCodigoPropietario.Value;
  stpProcUpdateTrnCxcU1.Params[7].Value:= null;
  stpProcUpdateTrnCxcU1.Params[8].Value:= dmfactura.qryDatosTrncxcCONCEPTO.Value;
  stpProcUpdateTrnCxcU1.Params[9].Value:= totalestotalneto.Value;
  stpProcUpdateTrnCxcU1.Params[10].Value:= Now;
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

procedure TfrmProcVentaRapidaByM.ActualizaBalanceCteCxc;
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

procedure TfrmProcVentaRapidaByM.ActualizaFactPendiente;
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

procedure TfrmProcVentaRapidaByM.bitBtnEditarFactClick(Sender: TObject);
var
  numF : integer;
  tRecordsDet : integer;
begin
  esContado:=False;
  if (TotalesSubTotal.Value <= 0) then
  begin
    MessageDlg('Total venta no puede ser cero , verifique.', mtError, [mbOk], 0);
    Exit;
  end;
   if not VerificaRecordsVenta then
   begin
     MessageDlg('Debe existir al menos un record activo, verifique.',mtInformation,[mbok],0);
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

    if (TotalesTipoNCFIFiscal.Value < 0) then
    begin
      MessageDlg('Verifique tipo NCF', mtError, [mbOk], 0);
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
  //Totales.EmptyTable;
  //Totales.Close;
  //Totales.Open;

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
    if dmFactura.qryVentaFactura.State = dsInactive then
    dmFactura.qryVentaFactura.Open;

  if (GlbActivaIFiscal = 1 ) then
  begin
    ProcesaEstadoImpresora;
    if (Length(GlbStatusFiscalError) > 0) And (UpperCase(GlbStatusFiscalError) <> 'READY') then
    begin
      MessageDlg('Estatus impresora fiscal: "'+GlbStatusFiscalError+'", verifique.', mtError, [mbOk], 0);
      Exit;
    end;
    if Not GLBIFiscalOnline then
    begin
       MessageDlg('Impresora no está en linea, verifique. '+GlbStatusFiscalError, mtError, [mbok], 0);
       Exit;
    end;
    MessageDlg('Favor reimprimir como documento no fiscal.', mtError, [mbOk], 0);
    Exit;
  end;
    
    //dmFactura.qryVentaFactura.params[0].Value
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
    LlenarrxSolDatoscte(dmFactura.qryVentaFacturaCODIGO_CTE.Value);
    if dmfactura.qryFactReimpMaster.Recordcount > 0 then
    Begin
      if (GlbFact55Pulg = 1) then  
      begin
        if (UpperCase(GLBFormatoFactura) = 'CASANDRA2') then  //PENDIENTE DE ANALISIS
        begin
          qckRepRecibo8_5_11REspReimp :=TqckRepRecibo8_5_11REspReimp.Create(nil);
          try
            qckRepRecibo8_5_11REspReimp.xtipoVenta:= TipoVenta;
            //qckRepRecibo8_5_11REspReimp.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;
            if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
            begin
              qckRepRecibo8_5_11REspReimp.PrinterSetup;
              qckRepRecibo8_5_11REspReimp.Print;
            end else            
            qckRepRecibo8_5_11REspReimp.Preview;
          finally
          qckRepRecibo8_5_11REspReimp.free;
          qckRepRecibo8_5_11REspReimp:=Nil;
          end;
        end;
      end else
      if GlbFacturaLicoreria =1 then
      begin
        qckRepFacturaEstandarNewReimpREsp:=TqckRepFacturaEstandarNewReimpREsp.Create(Nil);
        try
          if GlbSizeFact8x11 = 1 then
          qckRepFacturaEstandarNewReimpREsp.Page.Length := 11;
          qckRepFacturaEstandarNewReimpREsp.xtipoVenta := TipoVenta;
          qckRepFacturaEstandarNewReimpREsp.Prepare;
          glbTPag := qckRepFacturaEstandarNewReimpREsp.PageNumber;

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
  //end;
  bitBtnEditarFact.Enabled  := True;
  
  lblFechaCotizacion.Visible:= False;
  dbFechaCotizacion.Visible := False;
  Label36.Visible := False;
  Label36.caption:='';
  rdgFactServicio.Checked := False;
  GlbUsandoCotiza:= False;
  esContado :=False;
  Totales.Close;
  Totales.Open;

  Refresh;
  numerodocReimp := -1;

  Application.ProcessMessages;
end;
procedure TfrmProcVentaRapidaByM.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if (rxVentaStatus.Value = 'C') then
  Background := clGray
  else
  if (rxVentaStatus.Value = 'I') then
  Background := clGreen;
end;

procedure TfrmProcVentaRapidaByM.BitBtn6MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if Label36.Visible then
  begin
    EsModificandoFactura:=True;
    if not EsModificandoCotiza then
    begin
      bitBtnEditarFact.Visible:=True;
      bitBtnEditarFact.Top := BitBtn6.Top;
      bitBtnEditarFact.Left:= BitBtn6.Left;
      bitBtnEditarFact.BringToFront;
    end;
  end;
end;

procedure TfrmProcVentaRapidaByM.ActivarBotonesEnModifica;
begin
  if EsModificandoFactura then
  begin
  BitBtn9.Enabled:=False;
  BitBtn8.Enabled:=False;
  BitBtn12.Enabled:=False;
  BitBtn15.Enabled:=False;
  BitBtn11.Enabled:=False;
  BitBtn17.Enabled:=False;
  bitBtnEditarFact.Visible:=True;
  bitBtnEditarFact.Top := BitBtn6.Top;
  bitBtnEditarFact.BringToFront;
  end else
  begin
  BitBtn9.Enabled:=True;
  BitBtn8.Enabled:=True;
  BitBtn12.Enabled:=True;
  BitBtn15.Enabled:=True;

  BitBtn11.Enabled:=True;
  BitBtn17.Enabled:=True;
  end;
  refresh;
end;

procedure TfrmProcVentaRapidaByM.ImpFacturaservicio(numerotrn: Integer;
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
      ImprimeDocumento(numerotrn);
      {t
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
        if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
        begin
          qckFactServIngeservis_N.PrinterSetup;
          qckFactServIngeservis_N.Print;
        end else
        qckFactServIngeservis_N.Preview;

      finally
      qckFactServIngeservis_N.Free;
      qckFactServIngeservis_N:=Nil;
      end;
    end else
    begin

      //Aqui Exportar a Excel
    end;   }
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

procedure TfrmProcVentaRapidaByM.Label37Click(Sender: TObject);
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

procedure TfrmProcVentaRapidaByM.BitBtn21Click(Sender: TObject);
begin
  totales.Edit;
  DBEdit7.SetFocus;
  DBStatusLabel1.Visible:=True;
end;

procedure TfrmProcVentaRapidaByM.DBEdit7Exit(Sender: TObject);
begin
  if totales.State in [dsEdit, dsInsert] then
  totales.Post;
  DBStatusLabel1.Visible:=False;
end;

procedure TfrmProcVentaRapidaByM.BitBtn22Click(Sender: TObject);
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

procedure TfrmProcVentaRapidaByM.RxDBGrid1Enter(Sender: TObject);
begin
  GlbNumero:= rxVentaSerie.Value;
end;

procedure TfrmProcVentaRapidaByM.RxDBGrid1Exit(Sender: TObject);
begin
  GlbNumero:= rxVentaSerie.Value;
end;

procedure TfrmProcVentaRapidaByM.ReImprimeFacturaContado1Click(
  Sender: TObject);
var
  tRecordsDet : Integer;
  pulgadaInc : Real;
  flag : boolean;
begin
  dmCompania.tblCompania.Close;
  dmCompania.tblCompania.Open;
  dmCompania.tblCompania.Locate('codigo', glbCia_Key, []);

  frmConsultaFacturas:=TfrmConsultaFacturas.Create(Nil);
  try
    frmConsultaFacturas.BitBtn2.Caption := '&Re-Imprimir';
    if frmConsultaFacturas.Showmodal = mrOK then
    begin
      if frmConsultaFacturas.rdgContado.Checked then
         esContado:=True
      else esContado:=False;

      if not dmFactura.qryVentaFacturaNUMERO_DOC_PAGO.IsNull then
      NumeroTrn := dmFactura.qryVentaFacturaNUMERO_DOC_PAGO.AsInteger
      else
      NumeroTrn := dmFactura.qryVentaFacturaNUMERO.Value;
    end else Exit;

    dmfactura.qryFactReimpMaster.Close;
    dmfactura.qryFactReimpMaster.Params[0].Value:= NumeroTrn;
   
    dmfactura.qryFactReimpDet.Close;
    dmfactura.qryFactReimpDet.Params[0].Value:= dmfactura.qryFactReimpMaster.Params[0].Value;
    dmfactura.qryFactReimpDet.Open;
    dmfactura.qryFactReimpDet.Last;
    tRecordsDet := dmfactura.qryFactReimpDet.RecordCount;
    dmfactura.qryFactReimpDet.Close;

    dmfactura.qryFactReimpMaster.Open;

    frmConsultaFacturas.EsReimprimirContado:= esContado;
    EsReimprimirContado:= esContado;
    frmConsultaFacturas.rdgContado.Checked := esContado;
    if esContado then
    TipoVenta := 'CONTADO'
    else TipoVenta := 'CREDITO';

    dmclientes.tblClientes.Close;
    dmclientes.tblClientes.Open;
    if dmclientes.tblClientes.Locate('CODIGO_CTE', dmfactura.qryFactReimpMasterCODIGO_CTE.Value,[]) then
    glbcodVendedor:=dmclientes.tblClientesCOD_VENDEDOR.Value
    else
    glbcodVendedor:= VarUsuarioGlb;

    if (TipoVenta = 'CREDITO') then
    begin
      frmConsultaFacturas.rdgCredito.Checked := True;
      frmConsultaFacturas.EditN1.SetInteger(dmfactura.qryVentaFacturaNUMERO_FACTURA.VALUE);
    end else
    begin
      frmConsultaFacturas.rdgContado.Checked := True;
      frmConsultaFacturas.EditN1.SetInteger(NumeroTrn);
    end;
    frmConsultaFacturas.BitBtn1Click(Self);
    finally
    if Assigned(frmConsultaFacturas) then
       frmConsultaFacturas.Free;
       frmConsultaFacturas:=Nil;
    end;
    LlenarrxSolDatoscte(dmFactura.qryVentaFacturaCODIGO_CTE.Value);
    if (UpperCase(GLBFormatoFactura) = 'CASANDRA2') or ((UpperCase(GLBFormatoFactura) = 'FORMATOGENERAL')) then  //PENDIENTE DE ANALISIS
    begin
      if (GlbRec3Pulg = 1) then
      //and (8=9)) then //temporals
      begin
        RxDBGrid1.DataSource:= datasource3;
        dbtext1.DataField:='';
        dbtext1.DataSource:= datasource3;
        dbedit1.DataField:='';
        dbedit1.DataSource:= datasource3;
        dbedit2.DataField:='';
        dbedit2.DataSource:= datasource3;
        dbedit3.DataField:='';
        dbedit3.DataSource:= datasource3;
        qckRepReciboReimp:=TqckRepReciboReimp.Create(Nil);
        try
        if GlbImpCodProducto = 0 then
        begin
          qckRepReciboReimp.QRSubDetail1.Height := 20;
          qckRepReciboReimp.QRLabel26.Enabled := False;
          qckRepReciboReimp.QRDBText20.Enabled:= False;
        end;

      qckRepReciboReimp.ncfDesc := GlbDescNCF;
      if Length(edtObservacion.Text) > 0 then
      qckRepReciboReimp.nombreCteGenerico:=edtObservacion.Text;
      if (tablaPropietarioCodigoPropietario.value > 0) then
      begin
        qckRepReciboreimp.qrLabelRNC.Caption:='RNC-' + qryClienteRNC_NUMERO.Value;
        qckRepReciboreimp.nombreCteGenerico:= qryClienteNOMBRE_CTE.Value;
      end
      else qckRepReciboreimp.qrLabelRNC.Caption:='';
      //RxDBGrid1.Visible:=False;
      //RxDBGrid1.DataSource:=DataSource2;
      qckRepReciboReimp.xtipoVenta := TipoVenta;
      qckRepReciboReimp.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;
      pulgadaInc:=0.86;
      //temporal
      //{
      if dmFactura.qryVentaFacturaDet.RecordCount = 1 then
      qckRepReciboReimp.Page.Length:= 5
      else
      if dmFactura.qryVentaFacturaDet.RecordCount >= 2 then
      qckRepReciboReimp.Page.Length:= qckRepReciboReimp.Page.Length +
      (dmFactura.qryVentaFacturaDet.RecordCount - 1 ) * 0.25;

      flag:=true;
      qckRepReciboReimp.Prepare;
      rxventa.DisableControls;
      rxdbgrid1.Enabled:=False;
      if (dmFactura.qryVentaFacturaDet.RecordCount > 1) or (qckRepReciboReimp.PageNumber > 1) then
      begin
        repeat
          begin
            if (qckRepReciboReimp.PageNumber > 1) then
            begin
              qckRepReciboReimp.Page.Length:=qckRepReciboReimp.Page.Length + 0.25;
              qckRepReciboReimp.Prepare;
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
      qckRepReciboReimp.Print
      else
      if MessageDlg('Imprimir?',mtInformation, [mbYes, mbNo], 0)=mryes then
      begin
        if (GlbImprimeReciboFact = 1) then
        begin
          qckRepReciboReimp.PrinterSetup;
          qckRepReciboReimp.Print;
        end;
      end else
      qckRepReciboReimp.Preview;
      reciboImpreso:=True;
    finally
    qckRepReciboReimp.Free;
    qckRepReciboReimp:=Nil;
    end;
      end else   
      begin
      if dmFactura.qryVentaFactura.RecordCount = 1 then
      begin
        qckRepRecibo8_5_11REspReimp :=TqckRepRecibo8_5_11REspReimp.Create(nil);
        try
          if EsDevolucion then
          begin
            qckRepRecibo8_5_11REspReimp.xtipoVenta:= TipoVenta + ' (Re-Impresion)';
          end;
          qckRepRecibo8_5_11REspReimp.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;
          qckRepRecibo8_5_11REspReimp.qrtipoVenta.Caption:= '';
          if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
          begin
            qckRepRecibo8_5_11REspReimp.PrinterSetup;
            qckRepRecibo8_5_11REspReimp.Print;
          end else
          qckRepRecibo8_5_11REspReimp.Preview;
        finally
        qckRepRecibo8_5_11REspReimp.free;
        qckRepRecibo8_5_11REspReimp:=Nil;
        end;
      end;
      end;
    end else
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

procedure TfrmProcVentaRapidaByM.CrearNCreditoEnDevolucion;
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

procedure TfrmProcVentaRapidaByM.ActualizaCotizacionMaster;
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
  if TotalesMontoDescAdicional.Value > 0 then
  ibstpUpdateCotizaMaster.Params[18].Value    := TotalesMontoDescAdicional.Value
  else
  ibstpUpdateCotizaMaster.Params[18].Value    := TotalesMontoDescItems.Value;//TotalesMontoDescAdicional.Value;//Totalesmontodesc.value;

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
  ibstpUpdateCotizaMaster.Params[36].Value     := TotalesRecargo.Value;
  ibstpUpdateCotizaMaster.Params[37].Value     := totalesTipoNCFIFiscal.Value;
  ibstpUpdateCotizaMaster.Params[38].Value     := TotalesMontoExoneraITBIS.Value;
  //ibstpUpdateCotizaMaster.Params[39].Value     := 0;//tipoVenta = debe ser en cotizacion detalle;

  ibstpUpdateCotizaMaster.ExecProc;

  if Not ibstpUpdateCotizaMaster.Transaction.InTransaction then
  ibstpUpdateCotizaMaster.Transaction.StartTransaction;
  try
    ibstpUpdateCotizaMaster.Transaction.CommitRetaining;
  except
  ibstpUpdateCotizaMaster.Transaction.RollbackRetaining;
  end;
end;

procedure TfrmProcVentaRapidaByM.InsertarCotizacionDetUpd(numero,
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
  if (ABS(TotalesMontoExoneraITBIS.Value) > 0) then
  stpProcUpdteCotDet.Params[18].Value := 1
  else
  stpProcUpdteCotDet.Params[18].Value   := rxVentaItbisExento.Value;
  stpProcUpdteCotDet.Params[19].Value   := rxVentaTipoVenta.Value;
  stpProcUpdteCotDet.Params[20].Value   := serie;
  stpProcUpdteCotDet.Params[21].Value   := rxVentaPorcDescItem.Value;
  if rxVentaMontoDescItem.Value > 0 then
  stpProcUpdteCotDet.Params[22].Value   := rxVentaMontoDescItem.Value
  else
  stpProcUpdteCotDet.Params[22].Value   := rxVentaMontoDesGlobal.Value;

  stpProcUpdteCotDet.Params[23].Value    := rxVentaMoneda.Value;
  stpProcUpdteCotDet.Params[24].Value    := rxVentamonto_tasa.Value;
  stpProcUpdteCotDet.Params[25].Value    := rxVentaIDTasaITBIS.Value;
  stpProcUpdteCotDet.ExecProc;
end;

procedure TfrmProcVentaRapidaByM.dbFechaCotizacionClick(Sender: TObject);
begin
  Totales.Edit;
end;

procedure TfrmProcVentaRapidaByM.dbFechaCotizacionExit(Sender: TObject);
begin
  if Totales.State in [dsEdit] then
  Totales.Post;
end;

procedure TfrmProcVentaRapidaByM.dbFechaCotizacionEnter(Sender: TObject);
begin
  Totales.Edit;
end;

procedure TfrmProcVentaRapidaByM.ProcInsertarVtaMastEnDevolucion(Serie_asignadoncf : Integer);
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
  if (dmcxc.tblTransCxcnumero_doc.IsNull) then
  begin
    dmcxc.stpProcNumDoc.Params[1].Value:= 5;
    dmcxc.stpProcNumDoc.ExecProc;
    ipStpInsertVentMast.Params[15].Value:= dmcxc.stpProcNumDoc.Params[0].Value;
    UProcesarDevolucion.numeroFactura   := ipStpInsertVentMast.Params[15].Value;
  end else
  ipStpInsertVentMast.Params[15].Value:= dmcxc.tblTransCxcnumero_doc.Value;    //yo soy inteligencia divina

  if Serie_asignadoncf > 0 then
  ipStpInsertVentMast.Params[16].Value     := Serie_Asignadoncf
  else ipStpInsertVentMast.Params[16].Value:= Null;
  ipStpInsertVentMast.Params[17].Value:= TotalesSubTotal.Value * -1;
  ipStpInsertVentMast.Params[18].Value:= TotalesPorcDesAdicional.Value;
  if TotalesMontoDescAdicional.Value > 0 then
  ipStpInsertVentMast.Params[19].Value:= TotalesMontoDescAdicional.Value
  else
  ipStpInsertVentMast.Params[19].Value:= TotalesMontoDescItems.Value * -1;//TotalesMontoDescAdicional.Value  * -1;
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
  ipStpInsertVentMast.Params[35].Value:= TotalesRecargo.Value;
  ipStpInsertVentMast.Params[36].Value:= TotalesTipoNCFIFiscal.Value;
  ipStpInsertVentMast.Params[37].Value:= TotalesMontoExoneraITBIS.Value;
  ipStpInsertVentMast.Params[38].Value:= 0;

  ipStpInsertVentMast.ExecProc;
  numeroTrnVta:= ipStpInsertVentMast.Params[0].Value;
  if Assigned(frmRegServicioTaller) then
  UpdateServINFO(ipStpInsertVentMast.Params[0].Value);
  if Assigned(frmAlquiler) then
  UpdateServAlquiler(ipStpInsertVentMast.Params[0].Value);
  
  if Not ipStpInsertVentMast.Transaction.InTransaction then
  ipStpInsertVentMast.Transaction.StartTransaction;
  try
    ipStpInsertVentMast.Transaction.CommitRetaining;
  except
  ipStpInsertVentMast.Transaction.RollbackRetaining;
  end;

  numeroTrnVta:= ipStpInsertVentMast.Params[0].Value;

  //tblNiv_ctrl
  if (GlbActivaIFiscal = 1 ) then
  FInsertarDatosCtrlNIF(numerotrnvta);

end;

procedure TfrmProcVentaRapidaByM.ReImprimeDevolucion1Click(Sender: TObject);
var
  _xflag : Boolean;
begin
//Usado para filtrar dmfactura.qryventafactura
  if rxVenta.RecordCount > 0 then
  begin
    MessageDlg('Terminar o cancelar transacción en curso.',mtInformation,[mbok],0);
    exit;
  end;

  dmFactura.formaPago := 6;//Devolucion
  UProcesarDevolucion.numeroFactura:=StrToInt(InputBox('Re-Imprimir Factura Devolución','Entre número devolución',''));
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
      dmFactura.qryVentaFactura.Params[1].AsInteger := glbCia_Key;
      dmFactura.qryVentaFactura.Open;
      GlbcodVendedor:= dmFactura.qryVentaFacturaCODIGO_VENDEDOR.Value;
      if dmFactura.qryVentaFactura.RecordCount = 0 then
      begin
        if dmFactura.qryVentaFactura.RecordCount = 0 then
        begin
          _xflag := False;
          ReImpDevolucion(UProcesarDevolucion.numeroFactura,_xflag);
          if not _xflag then
          MessageDlg('Factura no existe en devolución', mtInformation, [mbok], 0);
          Exit;
        end;
      end;
      dmFactura.qryDatosTrncxc.Close;  //dmFactura.qryVentaFactura.RecordCount;
      if esContado then
      dmFactura.qryDatosTrncxc.Params[0].AsInteger:= 2
      else
      dmFactura.qryDatosTrncxc.Params[0].AsInteger:= 1;
      dmFactura.qryDatosTrncxc.Params[1].AsInteger:= dmFactura.qryVentaFacturaNUMERO_FACTURA.Value;
      //dmFactura.qryDatosTrncxc.Params[1].AsInteger:= glbCia_Key;
      dmFactura.qryDatosTrncxc.Open;//dmFactura.qryDatosTrncxc.RecordCount
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

procedure TfrmProcVentaRapidaByM.BitBtn4Exit(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmProcVentaRapidaByM.RegistroServicioTaller1Click(
  Sender: TObject);
begin
  if  not Assigned(frmRegServicioTaller) then
  frmRegServicioTaller:=TfrmRegServicioTaller.Create(Nil);
  try
    frmRegServicioTaller.Show;
  finally
  end;
end;

procedure TfrmProcVentaRapidaByM.BitBtn24Click(Sender: TObject);
begin
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

procedure TfrmProcVentaRapidaByM.TotalesAfterScroll(DataSet: TDataSet);
begin
 if (TotalesMoneda.Value = '') then Exit;
  PAbrirtablaMoneda(TotalesMoneda.Value,GlbFechaTrnDiaria);
  lblTasa.Caption:=Concat('1 =',SimboloMoneda(rxVentaMonedaBase.Value))+dmdatos.qryTasaVALORMONEDA.AsString;
  Totalestotalneto.DisplayFormat:=Concat(SimboloMoneda(TotalesMoneda.Value),',0.00');
end;

procedure TfrmProcVentaRapidaByM.ProcCalculoDivisa;
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

    //t Marzo 17 2015 ProcesaCalculos;

    if rxVenta.State In [dsInsert, dsEdit] Then
    begin
       rxVenta.Post;
       //WriteToLog('Post rxVenta - Line 8075');
    end;

  end;

end;

procedure TfrmProcVentaRapidaByM.RxDBLookupCombo2Change(Sender: TObject);
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

procedure TfrmProcVentaRapidaByM.RxDBLookupCombo2Enter(Sender: TObject);
begin
  if Totales.State = dsBrowse then
  Totales.Edit;
end;

procedure TfrmProcVentaRapidaByM.RxDBLookupCombo2Exit(Sender: TObject);
begin
  GlbMoneda:= TotalesMoneda.AsInteger;
  if Totales.State in [dsInsert, dsEdit] then
  Totales.Post;
  if Totales.State = dsBrowse then
  Totales.Edit;
  ProcCalculoDivisa;

  Totalestotalneto.DisplayFormat:=Concat(SimboloMoneda(TotalesMoneda.Value),',0.00');
end;

procedure TfrmProcVentaRapidaByM.RxDBLookupCombo2Click(Sender: TObject);
begin
  if Totales.State = dsBrowse then
  Totales.Edit;
end;

procedure TfrmProcVentaRapidaByM.tblMonedaAfterScroll(DataSet: TDataSet);
begin
  GlbMoneda := tblMonedaCODIGO.AsInteger;
end;

function TfrmProcVentaRapidaByM.BuscarRutaImagen(
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

procedure TfrmProcVentaRapidaByM.BitBtn25Click(Sender: TObject);
begin
  if rxVenta.RecordCount = 0 then Exit;
  if (GlbActivaIFiscal = 1 ) then
  begin
    Button2Click(Self);
    Exit;
  end;
      //temporal eliminar lineas
      Button2Click(Self);
      exit;

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

procedure TfrmProcVentaRapidaByM.ProcInsertarDetPagos(numtrn : integer);
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

procedure TfrmProcVentaRapidaByM.ProcInsertarDetBono(numtrn: integer);
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

procedure TfrmProcVentaRapidaByM.ProcInsertarDetCheque(numtrn: integer);
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

procedure TfrmProcVentaRapidaByM.Poliza1Click(Sender: TObject);
begin
  frmPolizas:=TfrmPolizas.Create(Nil);
  try
    frmPolizas.Showmodal;
  finally
  frmPolizas.Free;
  frmPolizas:=Nil;
  end;
end;


procedure TfrmProcVentaRapidaByM.DescargaNotaCredito;
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

procedure TfrmProcVentaRapidaByM.CheckBox4Click(Sender: TObject);
begin
  Edit1.Text:='';
  if Not CheckBox4.Checked then
  begin
    Totales.Edit;
    TotalesMontoNotaCredito.Value := 0;
    TotalesMontoNCRAplicado.Value := 0;

    Totalesdevolucion.Value := 0;
    Totales.Post;
    //t Marzo 17 2015 ProcesaCalculos;
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
    //t Marzo 17 2015 ProcesaCalculos;
  end;
end;

procedure TfrmProcVentaRapidaByM.SetMontoNotaCredito;
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

procedure TfrmProcVentaRapidaByM.BitBtn26Click(Sender: TObject);
begin
  if (rxVenta.RecordCount > 0) and (rxVenta.State = dsbrowse) then
  begin
    rxVenta.Edit;
    cboxTipoUnidad.SetFocus;
  end;
end;

procedure TfrmProcVentaRapidaByM.rxVentaBeforeInsert(DataSet: TDataSet);
begin
  if EsModificandoFactura then exit;
  if rxVentaSerie.IsNull then
  rxVenta.Cancel;
  procCalc:=True;
end;

procedure TfrmProcVentaRapidaByM.SetPrecioPorCantidad;
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

procedure TfrmProcVentaRapidaByM.BitBtn1Enter(Sender: TObject);
begin
  BitBtn1.Font.Color := clRed;
  edtCodigo.Text:='';  
end;

function TfrmProcVentaRapidaByM.VerificaRecordsVenta: boolean;
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

procedure TfrmProcVentaRapidaByM.BitBtn1Exit(Sender: TObject);
begin
  BitBtn1.Font.Color := clBlack;
end;

procedure TfrmProcVentaRapidaByM.DBRadioGroup1Enter(Sender: TObject);
begin
  if (rxVenta.RecordCount > 0) then
  if rxVenta.State in [dsEdit, dsInsert] then
  begin
    rxVenta.Edit;
  end;
end;

procedure TfrmProcVentaRapidaByM.DBRadioGroup1Exit(Sender: TObject);
begin
  if frmProcVentaRapidaByM.Showing then
  dbedit2.SetFocus;
end;

procedure TfrmProcVentaRapidaByM.Button2Click(Sender: TObject);
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
  if not Assigned(frmPagosCombinados) then
  frmPagosCombinados:=TfrmPagosCombinados.Create(Nil);
  try
  //frmPagosCombinados.EditN1.SetFloat(0.00);
  //frmPagosCombinados.EditN2.SetFloat(0.00);
  //frmPagosCombinados.EditN3.SetFloat(0.00);
  //frmPagosCombinados.EditN4.SetFloat(0.00);
  if frmPagosCombinados.rxCobros.state = dsInactive then
  //frmPagosCombinados.rxCobros.Close;
  frmPagosCombinados.rxCobros.Open;
  frmPagosCombinados.areaTrans:=1;//ventas;
  if frmPagosCombinados.rxCobros.RecordCount = 0 then
  begin
    frmPagosCombinados.rxCobros.Insert;
    frmPagosCombinados.rxCobrostotalNeto.Value:=Totalestotalneto.Value;
    frmPagosCombinados.rxCobrosEfectivo.Value:=0;
    frmPagosCombinados.rxCobrosTarjeta.Value:=0;
    frmPagosCombinados.rxCobrosCheque.Value:=0;
    frmPagosCombinados.rxCobrosBono.Value:=0;
  end;
  if frmPagosCombinados.rxPagos.state = dsInactive then
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
  //frmPagosCombinados.Free;
  //frmPagosCombinados:=Nil;
  end;
  Edit1.SetFocus;
  BitBtn2Click(Self);
  Edit1Exit(Self);
  BitBtn4.SetFocus;

end;

procedure TfrmProcVentaRapidaByM.PrepararInfoFiscal(numerotrn: integer);
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

procedure TfrmProcVentaRapidaByM.Button1Click(Sender: TObject);
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
    frmTestImpresoraFiscal.LCantCopias := rxspinImpCantCopias.Text;
    frmTestImpresoraFiscal.Showmodal;
  finally
  frmTestImpresoraFiscal.Free;
  frmTestImpresoraFiscal:=Nil;
  end;
  Delay(1000);
  NumeroTrn := 0;
  refresh;
end;

procedure TfrmProcVentaRapidaByM.VerificaImpresoraFiscalM;
var
  archivo : String;
  tHoras : integer;
begin
  Delay(3000);
  UGlobal.VerificaImpresoraFiscal;

  if not GlbImpresoraFOnline then
  begin
    BitBtn1.Enabled:=False;
    lblStatusImpFiscal.Visible:= False;
    lblStatusImpFiscal.Font.Color:= clRed;
    lblStatusImpFiscal.Font.Style := [fsBold];
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

procedure TfrmProcVentaRapidaByM.qryVenceAfterClose(DataSet: TDataSet);
 var  x : Smallint;
begin
   x:=7;
end;

procedure TfrmProcVentaRapidaByM.qryVenceBeforeClose(DataSet: TDataSet);
 var  x : Smallint;
begin
   x:=7;
end;

procedure TfrmProcVentaRapidaByM.DBEdit5Enter(Sender: TObject);
begin
  if Totales.State = dsBrowse then
  EsBrowsing := True
  else EsBrowsing:=False;
end;

procedure TfrmProcVentaRapidaByM.ReImprimeDocFiscal1Click(Sender: TObject);
begin
  {if (NumeroTrn <= 0) then
  begin
    NumeroTrn := StrToInt(InputBox('Test numero venta','Indique numero',''));
  end;
  }
  if rxVenta.RecordCount > 0 then
  begin
    MessageDlg('Terminar o cancelar transaccion en curso.',mtInformation,[mbok],0);
    exit;
  end;

  frmConsultaFacturas:=TfrmConsultaFacturas.Create(Nil);
  try
    frmConsultaFacturas.BitBtn2.Caption := '&Re-Imprimir';
    if frmConsultaFacturas.Showmodal = mrOK then
    begin
      if VerificaClave then
      begin
        if frmConsultaFacturas.rdgContado.Checked then
        esContado:=True
        else esContado:=False;
        NumeroTrn := dmFactura.qryVentaFacturaNUMERO.Value;
        bitBtnEditarFact.Left:=BitBtn6.Left;
      end;
    end;
  finally
  frmConsultaFacturas.Free;
  frmConsultaFacturas:= Nil;
  end;
  if (NumeroTrn <=0) then
  begin
    MessageDlg('Número de documento no indicado. Verifique.', mtError, [mbOK], 0);
    Exit;
  end;
  dmreportes.qryDatosVentaMaster.Close;
  dmreportes.qryDatosVentaMaster.Params[0].Value:= numerotrn;
  dmreportes.qryDatosVentaMaster.Open;
  dmReportes.qryDatosReimpDocFiscal.Close;
  dmReportes.qryDatosReimpDocFiscal.Params[0].Value:= numerotrn;
  dmReportes.qryDatosReimpDocFiscal.Open;

  dmdatos.qryConfCajaXusuario.Close;
  dmdatos.qryConfCajaXusuario.Open;
  dmdatos.qryConfCajaXusuario.Locate('COD_EMPLEADO',VarUsuarioGlb,[]);

  dmReportes.qryDatosCajaImpUser.close;
  dmReportes.qryDatosCajaImpUser.Params[0].Value:= VarUsuarioGlb;
  dmReportes.qryDatosCajaImpUser.Open;
  dmReportes.qryDatosCajaImpUser.Last;
  dmReportes.qryDatosCajaImpUser.RecordCount;
  GlbNombreFiletoPrint:= Format('%s%s%s%s%s%s%s',[dmReportes.qryDatosCajaImpUserRUTA_TICKET.Value,'\ReImpRecibo',Trim(GlbCodSucursal),Trim(GlbModeloImpresora),
  IntToStr(VarUsuarioGlb),IntToStr(NumeroTrn),'.txt']);

  frmBuscarNIF:=TfrmBuscarNIF.Create(Nil);
  try
    if frmBuscarNIF.Showmodal = mrok then
    begin
      frmTestImpresoraFiscal:=TfrmTestImpresoraFiscal.Create(Nil);
      try
        //frmTestImpresoraFiscal.Button1Click(Self);
       frmTestImpresoraFiscal.EsDevolucion:= EsDevolucion;
       frmTestImpresoraFiscal.LCantCopias := rxspinImpCantCopias.Text;

        frmTestImpresoraFiscal.btnReimprimirdocFiscalClick(Self);//Button1Click(Self);
        frmTestImpresoraFiscal.Button3Click(Self);
      finally
      frmTestImpresoraFiscal.Free;
      frmTestImpresoraFiscal:=Nil;
      end;
      Delay(1000);
    end;
  finally
  frmBuscarNIF.Free;
  frmBuscarNIF:=Nil;
  end;
  tblnif_ctrl.close;
  tblnif_ctrl.Open;
  //tblnif_ctrlNIF.Value
  NumeroTrn := 0;
end;

procedure TfrmProcVentaRapidaByM.Cancelar1Click(Sender: TObject);
begin
  dmFactura.qryDatosParaCtrlNIF.Close;
  if (GlbcodVendedor > 0) then
  dmFactura.qryDatosParaCtrlNIF.Params[0].Value:= GlbcodVendedor
  else
  dmFactura.qryDatosParaCtrlNIF.Params[0].Value := VarUsuarioGlb;
  dmFactura.qryDatosParaCtrlNIF.Open;
  frmConsultaDatosVenta:=TfrmConsultaDatosVenta.Create(nil);
  try
    if frmConsultaDatosVenta.ShowModal = mrOk then
    begin
       if MessageDlg('Desea cancelar venta para NCF '+
       dmFactura.qryDatosParaCtrlNIFNUMERO_NCF.Value+'?', mtWarning,[mbyes, mbno],0) = mryes then
       begin
         try
           dmFactura.ibtpProcInsVtaCancelar.Close;
         except
         end;
         dmFactura.ibtpProcInsVtaCancelar.Params[0].Value:= dmFactura.qryDatosParaCtrlNIFNUMERO_TRN.Value;
         dmFactura.ibtpProcInsVtaCancelar.ExecProc;
         if not dmFactura.ibtpProcInsVtaCancelar.Transaction.InTransaction then
         dmFactura.ibtpProcInsVtaCancelar.Transaction.StartTransaction;
         try
           dmFactura.ibtpProcInsVtaCancelar.Transaction.CommitRetaining;
         except
         dmFactura.ibtpProcInsVtaCancelar.Transaction.RollbackRetaining;
         end;
         ShellExecute(0, 'Open', PChar(GlbExeIFiscal), PChar(format('/PortComm=%s /Baudrate=%s /TipoDoc=DVFN /Status=not /Cancelar=True /CierreZ=False /ImprimeZ=0 /CierreX=False /ImpCierreX=1',[IntToStr(GlbPuerto),IntToStr(GlbBaudRate)])), PChar(''), SW_Hide);
       end;
    end;
  finally
  frmConsultaDatosVenta.free;
  frmConsultaDatosVenta:=nil;
  end;
  GLBIFiscalOpeAbierta:=False;
  ProcesaEstadoImpresora;
  if GlbActivaIFiscal = 0 then exit;
  ProcActualizaMsg;
end;

procedure TfrmProcVentaRapidaByM.CirreZ1Click(Sender: TObject);
var
  buttonSelected : Integer;
begin
  frmCierreJornada:=TfrmCierreJornada.Create(nil);
  try
    frmCierreJornada.Showmodal;
  finally
  frmCierreJornada.Free;
  frmCierreJornada:=Nil;
  end;

  {buttonSelected := MessageDlg('Yes - Genera Cierre Z e imprime, No-Solo generar cierre Z',mtConfirmation,[mbyes,mbno,mbCancel],0);
  if buttonSelected = mrYes then
  ShellExecute(0, 'Open', PChar(GlbExeIFiscal), PChar(format('/PortComm=%s /Baudrate=%s /TipoDoc=DVFN /Status=not /CierreZ=True,89  /ImprimeZ=1 /CierreX=False /ImpCierreX=0',[IntToStr(GlbPuerto),IntToStr(GlbBaudRate)])), PChar(''), SW_Hide)
  else if buttonSelected = mrNo then
  begin
    ShellExecute(0, 'Open', PChar(GlbExeIFiscal), PChar(format('/PortComm=%s /Baudrate=%s /TipoDoc=DVFN /Status=not /CierreZ=True,89  /ImprimeZ=0 /CierreX=False /ImpCierreX=0',[IntToStr(GlbPuerto),IntToStr(GlbBaudRate)])), PChar(''), SW_Hide);
    MessageDlg('Cierre Z realizado', mtinformation,[mbok],0);
  end;}
  ProcesaEstadoImpresora;
end;

procedure TfrmProcVentaRapidaByM.CierreX1Click(Sender: TObject);
var
  cmd : String;
begin
  frmCierreJornada:=TfrmCierreJornada.Create(nil);
  try
    frmCierreJornada.Showmodal;
  finally
  frmCierreJornada.free;
  frmCierreJornada:=nil;
  end;
  //Cierre X
  {t
  cmd:= format('/PortComm=%s /Baudrate=%s /TipoDoc=DVFN /Status=ifOnlineN /Caja=0001 /CierreZ=False,89 /ImprimeZ=0 /CierreX=True /Cierre=X /Cancelar=False /ImpCierreX=1',[IntToStr(GlbPuerto),IntToStr(GlbBaudRate)]);
  ShellExecute(0, 'Open', PChar(GlbExeIFiscal), PChar(cmd), PChar(''), SW_Hide);
  Delay(300);
  MessageDlg('Cierre Cajero realizado', mtinformation,[mbok],0);
  }
  ProcesaEstadoImpresora;
end;

procedure TfrmProcVentaRapidaByM.ProcesaEstadoImpresora;
begin

  if GlbPuerto = 4 then
  begin
    FiscalPrinter.CommPort:= $00000003;
  end;
  if GlbBaudRate = 9600 then
  FiscalPrinter.BaudRate:= $00000003;

  //if not GLBIFiscalBusy and not  GLBIFiscalOnline then
  //begin
    AbrirPuerto;
    StatusBar.Panels[0].Text:='Printer: ' + GetFiscalStatus;
    StatusBar.Panels[1].Text:='Status: ' + GetFiscalError;
  //  end;
  //end else
  //begin
  //  StatusBar.Panels[1].Text:='Status: ' + GetFiscalError;
  //  StatusBar.Panels[0].Text:='Printer: ' + GetFiscalStatus;
  //end;
  if (GlbIFiscalError <> 'Puerto en uso') And
     (GlbIFiscalError <> '') And
     (GlbIFiscalError <> 'Ready') And
     (GlbIFiscalError <> 'Listo') then
  MessageDlg('Impresora fiscal esta offline. '#13'Verifique que no esta apagada, desconectada o '#13'que no exista un documento abierto.',mtInformation,[mbOk],0);
  CerrarPuerto;
  {if Not CheckPortComDisponible then
   begin
     lblStatusImpFiscal.Visible := True;
     lblStatusImpFiscal.Font.Color:= clRed;
   end else
   begin
     lblStatusImpFiscal.Visible := False;
   end;}
  //StatusBar.Panels[0].Text:='Printer: '+GetFiscalStatus;
end;

procedure TfrmProcVentaRapidaByM.Estatus1Click(Sender: TObject);
begin
  if (GlbActivaIFiscal = 1 ) then
  ProcesaEstadoImpresora;
end;

procedure TfrmProcVentaRapidaByM.DBEdit10Exit(Sender: TObject);
begin
  if (rxVenta.RecordCount > 0) and (rxVenta.State = dsBrowse) then
  rxVenta.Edit;
  chkExento.Checked := True;
  chkExentoExit(Self);
  chkExento.Checked := False;
  RxDBLookupCombo3Exit(self);
  BitBtn27Click(Self);
  Refresh;
end;

procedure TfrmProcVentaRapidaByM.RxDBLookupCombo3Exit(Sender: TObject);
var
  xpos : integer;
begin
  //chkExentoExit(Self);   1,4,5,
  if rxVentaSerie.IsNull then Exit;
  if Totales.State = dsBrowse Then Totales.Edit;
  if Totales.State In [dsEdit, dsInsert] Then
  begin
    if (TotalesTipoNCF.IsNull) And (Not TotalesTipoNCFIFiscal.IsNull) then
    TotalesTipoNCF.Value := dmFactura.ibQryViewNCFTIPO_CF.Value
    else
    if (TotalesTipoNCF.Value <> dmFactura.ibQryViewNCFTIPO_CF.Value) then
    TotalesTipoNCF.Value := dmFactura.ibQryViewNCFTIPO_CF.Value;

     TotalesMontoExoneraITBIS.Value:= 0;
     if Not dmFactura.ibQryViewNCF.Locate('TIPO_CF;tipo_ncf_ifiscal',
     VarArrayOf([TotalesTipoNCF.Value,TotalesTipoNCFIFiscal.Value]), []) then
     begin
       TotalesTipoNCF.AsVariant := null;
       TotalesTipoNCFIFiscal.AsVariant := null;;
     end;

     label29.Caption := 'Sub-Total Indirecto';
    //TotalesTipoNCFIFiscal.Value := dmFactura.ibQryViewNCFTIPO_NCF_IFISCAL.AsInteger;
    if (not TotalesTipoNCF.IsNull) Or (TotalesTipoNCF.Value <> '') then
    begin
      xpos := Pos('EXONERA',UpperCase(dmFactura.ibQryViewNCFDESCRIPCION.Value));

      if Pos('EXONERA',UpperCase(dmFactura.ibQryViewNCFDESCRIPCION.Value)) > 0 then
      begin
        label29.Caption := 'ITBIS Exonerado';
        label29.Visible := True;
        dbTextMontoExoneraITBIS.Visible := True;
        dbTextMontoExoneraITBIs.BringToFront;
        TotalesMontoExoneraITBIS.Value:= Totalesitbis.Value;
        WriteToLog('Total itbis: '+Totalesitbis.AssTring);
      end else
      begin
        TotalesMontoExoneraITBIS.Value:= 0;
        label29.Caption := 'Sub-Total Indirecto';
      end;
      chkExentoExit(Self);
    end;
  end;
  if Totales.State In [dsEdit, dsInsert] then
  Totales.Post;
  BitBtn27Click(Self);
  if (TotalesTipoNCFIFiscal.Value In [1,4,5]) And
  (tablaPropietarioCodigoPropietario.IsNull or (tablaPropietarioCodigoPropietario.Value = 0)) then
  begin
    ProcEntradaCliente;
  end;
  RxDBLookupCombo3Change(Self);
  //Refresh;
end;



procedure TfrmProcVentaRapidaByM.PrepararInfoFiscalNCR(numerotrn: integer);
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

procedure TfrmProcVentaRapidaByM.chKDescuentoGlobalClick(Sender: TObject);
var
  guardarRec : TBookMark;
  //nCampo : TField;
begin
  //nCampo := TField.Create(nil);
  //nCampo.FieldName
  Totales.AutoCalcFields:=False;
  //if (rxVentaMontoDesGlobal.Value <= 0) then exit;
  if chKDescuentoGlobal.Checked then
  begin
     Label44.Caption := 'Monto Desc. Global';
     //DBText16.Field.FieldName := 'MontoDescAdicional';
     DBText4.Visible    := True;
     DBText4.BringToFront;
     Label47.Visible := True;
     DBEdit11.Visible:= True;
     guardarRec:= rxVenta.GetBookmark;
     rxVenta.First;
     sumarDatos := False;
     rxVenta.DisableControls;
     While Not rxVenta.Eof do
     begin
       rxVenta.Edit;
       rxVentaPorcDescItem.Value := 0;
       rxVenta.Next;
     end;
     sumarDatos := True;
     rxventa.Edit;
     rxVenta.Post;
     rxventa.GotoBookmark(guardarRec);
     rxventa.FreeBookmark(guardarRec);
     rxventa.EnableControls;
     DBEdit9.Enabled := false;
     DBEdit11.SetFocus;
  end else
  begin
    Totales.Edit;
    TotalesPorcDesAdicional.Value:=0;
    if Totales.State = dsEdit then
    Totales.Post;
    DBEdit9.Enabled := True;
    Label47.Visible := False;
    DBEdit11.Visible:= False;
    Label44.Caption := 'Monto Desc. Items';
    //DBText16.Field.FieldName:='MontoDescItems';
    DBText4.Visible:=False;
    DBText4.SendToBack;
  end;
  Totales.AutoCalcFields:=True;
  Refresh;
  DBEdit10Exit(Self);
  Refresh;
end;

procedure TfrmProcVentaRapidaByM.DBEdit11Change(Sender: TObject);
begin
  if LlenandoDatos then exit;
  BitBtn10Click(Self);
  DBEdit5Exit(Self);
end;

procedure TfrmProcVentaRapidaByM.ImprimeFiscalContado(xNumeroTrn:Integer);
begin
  reciboImpreso := False;
  dmReportes.qryViewVentasMast.Close;
  dmReportes.qryViewVentasMast.Params[0].Value := xNumeroTrn;
  dmReportes.qryViewVentasMast.Open;
  ProcActualizaMsg;
    if (xNumeroTrn <= 0) then
    begin
      if not InputQuery('Entre número transacción','Indique número',_ulttrnImp) then
      exit
      else
      xNumeroTrn:= StrtoInt(_ulttrnImp);
    end;
    dmdatos.qryConfCajaXusuario.Close;
    dmdatos.qryConfCajaXusuario.Open;
    dmdatos.qryConfCajaXusuario.Locate('COD_EMPLEADO',VarUsuarioGlb,[]);

    dmReportes.qryDatosVentaMaster.Close;
    dmReportes.qryDatosVentaMaster.Params[0].Value:= xNumeroTrn; //dmFactura.qryVentaFacturaNumero.Value;
    dmReportes.qryDatosVentaMaster.Open;

    dmReportes.qryDatosCajaImpUser.Close;
    dmReportes.qryDatosCajaImpUser.Params[0].Value:= VarUsuarioGlb;
    dmReportes.qryDatosCajaImpUser.Open;
    dmReportes.qryDatosCajaImpUser.Last;
    dmReportes.qryDatosCajaImpUser.RecordCount;
    GlbNombreFiletoPrint:= Format('%s%s%s%s%s%s%s',[dmReportes.qryDatosCajaImpUserRUTA_TICKET.Value,'\Recibo',Trim(GlbCodSucursal),Trim(GlbModeloImpresora),
    IntToStr(VarUsuarioGlb),IntToStr(xNumeroTrn),'.txt']);
    PrepararInfoFiscal(xNumeroTrn);
    //rxVentaNumeroRecibo
    frmTestImpresoraFiscal:=TfrmTestImpresoraFiscal.Create(Nil);
    try
      frmTestImpresoraFiscal.LCantCopias := rxspinImpCantCopias.Text;
      frmTestImpresoraFiscal.Button1Click(Self);
      frmTestImpresoraFiscal.btnImprimeReciboClick(Self);//Button1Click(Self);
    finally
    frmTestImpresoraFiscal.Free;
    frmTestImpresoraFiscal:=Nil;
    end;
    Delay(1000);
    reciboImpreso := True;
end;

procedure TfrmProcVentaRapidaByM.FormClick(Sender: TObject);
begin
  refresh;
end;

procedure TfrmProcVentaRapidaByM.RecuperaTicketfiscal1Click(Sender: TObject);
begin
 if (GlbActivaIFiscal = 1) then
  begin
    qryVerificaReciboPdte.Close;
    qryVerificaReciboPdte.Open;
    qryVerificaReciboPdte.Last;
    qryVerificaReciboPdte.SQL.Text;
    if (qryVerificaReciboPdte.RecordCount > 1) then
    begin
      MessageDlg('Existe más de un record pendiente impresión ticket, '#13' verifique que la impresora esta en linea '#13' antes de registrar ventas.',mtError,[mbok], 0);
    end;
    //if (qryVerificaReciboPdte.RecordCount > 20000) then //temporal
    //Begin
      //if (qryVerificaReciboPdteFORMA_PAGO.Value = 1) then //Contado
      if MessageDlg('Desea reimprimir los '+IntToStr(qryVerificaReciboPdte.RecordCount) + ' pendiente?',mtInformation,[mbyes, mbno], 0) = mryes then
      begin
        qryVerificaReciboPdte.First;
        While Not qryVerificaReciboPdte.Eof Do
        begin
          if MessageDlg('Imprimir transaccion numero '+qryVerificaReciboPdteNUMERO.AsString+'?',mtInformation,[mbyes, mbno], 0) = mrno then
          break;

          ImprimeFiscalContado(qryVerificaReciboPdteNUMERO.Value);
          Delay(1000);
          if Not reciboImpreso then
          begin
            if MessageDlg('Ticket pendiente '+qryVerificaReciboPdteNUMERO.AsString+' no pudo ser impreso, desea continuar?',mtInformation,[mbyes, mbno], 0) = mrno then
            break;
          end;

          if MessageDlg('Continuar imprimiendo tickets pendientes?',mtInformation,[mbyes, mbno], 0) = mrno then
          Break;
          qryVerificaReciboPdte.Next;
        end;
      end;
    //End;
    qryVerificaReciboPdte.Close;
    qryVerificaReciboPdte.Open;
    qryVerificaReciboPdte.Last;
    qryVerificaReciboPdte.SQL.Text;
    if (qryVerificaReciboPdte.RecordCount > 1) then
    begin
      MessageDlg('Existe más de un record pendiente impresión ticket, '#13' NO DEBE GENERAR MAS VENTAS.',mtError,[mbok], 0);
    end;

    RxSpeedButton1.Visible:=False;
    CheckBox2.Visible:=False;
    CheckBox3.Visible:=False;
    BitBtn19.Visible:=False;
    BitBtn18.Visible:=False;
    BitBtn23.Visible:=False;
    rdgFactServicio.Visible := False;
    rdgFactVentaProducto.Visible := False;
    ProcActualizaMsg;    
  end;
end;

procedure TfrmProcVentaRapidaByM.DBEdit11Exit(Sender: TObject);
begin
  DBEdit10Exit(Self);
  if (TotalesPorcDesAdicional.Value) <= 0 then 
  chKDescuentoGlobal.Checked:=False;
  BitBtn27Click(Self);
end;

procedure TfrmProcVentaRapidaByM.DBEdit10Enter(Sender: TObject);
begin
  if TotalesTipoNCFIFiscal.IsNull then
  begin
    MessageDlg('Favor indicar tipo comprobante fiscal.',mtInformation,[mbok], 0);
    RxDBLookupCombo3.SetFocus;
    Exit;
  end;
end;

procedure TfrmProcVentaRapidaByM.rxVentaBeforeEdit(DataSet: TDataSet);
begin
  procCalc:=True;
end;

procedure TfrmProcVentaRapidaByM.DBRadioGroup1Click(Sender: TObject);
begin
  {T if rxVentaTipoVenta.Value in [2,3] then
  begin
    frmSelTasaITBIS:=TfrmSelTasaITBIS.Create(nil);
    try
     if frmSelTasaITBIS.ShowModal = mrOk then
     begin
       FGlbPorcItbiXID(rxVentaFecha.Value, GlbIDTasa);
       if rxVenta.State = dsBrowse then
       rxVenta.Edit;
       rxVentaIDTasaITBIS.Value := GlbIDTasa;
     end;
    finally
    frmSelTasaITBIS.Free;
    frmSelTasaITBIS:=Nil;
    end;
  end;}
end;

procedure TfrmProcVentaRapidaByM.DBEdit9Exit(Sender: TObject);
begin
  if rxVentaIDTasaITBIS.IsNull Or (rxVentaIDTasaITBIS.Value = 0) then
  DBRadioGroup1Click(Self);
end;

procedure TfrmProcVentaRapidaByM.ReactivarValores;
begin
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
  _NumeroCotiza:=-1;
  glbcodVendedor := -1;
  GlbUsandoCotiza := False;
  Delay(3000);
  if (GlbActivaIFiscal = 1 ) then
  begin
    ProcesaEstadoImpresora;
    ProcGlbSecuenciaNCF;
  end;
  RxDBLookupCombo1Change(Self);
  Refresh;
  Application.ProcessMessages;
  if (NumTrnServ = -1) then
  begin
    Hide;
    frmRegServicioTaller.BringToFront;
    NumTrnServ := 0;
  end;
  if (NumTrnServAlq = -1) then
  begin
    if Assigned(frmAlquiler) then
    begin
      Hide;
      frmAlquiler.BringToFront;
    end;
    NumTrnServAlq:= 0;
  end;  
end;

procedure TfrmProcVentaRapidaByM.DBEdit11Enter(Sender: TObject);
begin
  if not chKDescuentoGlobal.Checked then
  chKDescuentoGlobal.Checked:= True; 
end;

procedure TfrmProcVentaRapidaByM.Label5Click(Sender: TObject);
begin
  frmVerCalcVenta :=TfrmVerCalcVenta.Create(Nil);
  try
    frmVerCalcVenta.ShowModal;
  finally
  frmVerCalcVenta.free;
  frmVerCalcVenta:= Nil;
  end;
  Refresh;
end;

procedure TfrmProcVentaRapidaByM.ProcesarCalculoAlterno;
begin
  dmCalculos.CheckBox2Checked :=CheckBox2.Checked;
  dmCalculos.chkExentoChecked :=chkExento.Checked;
  dmCalculos.rdgFactServicioChecked :=rdgFactServicio.Checked;
  dmCalculos.CheckBox3Checked :=CheckBox3.Checked;
  dmCalculos.EsFactura := EsFactura;
  dmCalculos.EsFinanciamiento := EsFinanciamiento;
  dmCalculos.CheckBox4Checked := CheckBox4.Checked;
  dmCalculos.xCodigoPropietario := tablaPropietarioCodigoPropietario.Value;
  dmCalculos.chKDescuentoGlobalChecked := chKDescuentoGlobal.Checked;
  dmCalculos.LoadDataVenta(rxVenta);
  dmCalculos.LoadTotalVenta(Totales);
  //BitBtn1Click(Self);
end;

procedure TfrmProcVentaRapidaByM.BitBtn27Click(Sender: TObject);
var
  guardarRec : TBookMark;
begin
  if (rxVenta.RecordCount = 0) then Exit;

  if not dmCalculos.esFeedback then Exit;

  guardarRec:= rxVenta.GetBookmark;
  BitBtn10.Enabled:=False;
  if Not Assigned(frmTemporalForm) then
  frmTemporalForm:=TfrmTemporalForm.Create(Nil);
  try
    //if Not dmCalculos.esFeedback then
    ProcesarCalculoAlterno;
    dmCalculos.esFeedback:=True;
    dmCalculos.SetDataVenta(rxVenta);
    dmCalculos.FMontoDescNivelItem:=dmCalculos.GettotalMontoDescuentoItem;    
    dmCalculos.SetTotalVenta(Totales);
    dmCalculos.esFeedback := False;
    frmTemporalForm.BitBtn1Click(Self);
    //ttttttt frmTemporalForm.BitBtn1Click(Self);
  finally
  //FreeAndNil(frmTemporalForm);
  end;
  if Assigned(guardarRec) then
  begin
    rxVenta.GotoBookmark(guardarRec);
    rxVenta.FreeBookmark(guardarRec);
  end;
  Application.ProcessMessages;
  BitBtn10.Enabled:=True;  
end;

procedure TfrmProcVentaRapidaByM.BitBtn28Click(Sender: TObject);
begin
  if Assigned(frmTemporalForm) then
  frmTemporalForm.Show;
end;

procedure TfrmProcVentaRapidaByM.ConciliarNIF1Click(Sender: TObject);
begin
  frmConciliarNIFvsVenta:=TfrmConciliarNIFvsVenta.Create(Nil);
  try
    frmConciliarNIFvsVenta.Showmodal;
  finally
  frmConciliarNIFvsVenta.Free;
  frmConciliarNIFvsVenta:=Nil;
  end;
end;

procedure TfrmProcVentaRapidaByM.CancelarTicket1Click(Sender: TObject);
var
  archivo : String;
begin
  if GlbActivaIFiscal = 0 then Exit;

  archivo:=GlbExeIFiscal;
  ShellExecute(0, 'Open', PChar(archivo), PChar(Format('/PortComm=%s /Baudrate=%s /TipoDoc=DVFN /Status=not /Cancelar=True /CierreZ=False /ImprimeZ=0 /CierreX=False',[IntToStr(GlbPuerto),IntToStr(GlbBaudRate)])), PChar(''), SW_Hide);
  ProcActualizaMsg;
end;

procedure TfrmProcVentaRapidaByM.ProcEntradaCliente;
begin
  frmClientes:=TfrmClientes.Create(Nil);
  try
    dmUsuarios.qryRoles.Close;
    dmUsuarios.qryRoles.Params[0].Value:= VarUsuarioGlb;
    dmUsuarios.qryRoles.Open;
    dmUsuarios.qryRoles.First;
    While Not dmUsuarios.qryRoles.Eof Do
    begin
      ActivaPermiso(TForm(frmClientes),1000, dmUsuarios.qryRolesID_ROL.Value, 0);//menu principal: 1000 debe estar en la tabla PROCESOS
      dmUsuarios.qryRoles.Next;
    end;
    frmClientes.btnInsertarClick(Self);
    frmClientes.Showmodal;
    qryCliente.Close;
    qryCliente.Open;
    qryCliente.Locate('CODIGO_CTE',dmClientes.tblClientesCODIGO_CTE.Value,[]);
    tablaPropietario.Edit;
    tablaPropietarioCodigoPropietario.AsVariant := dmClientes.tblClientesCODIGO_CTE.Value;

    tablaPropietario.Post;

    qryCliente.Close;
    qryCliente.Open;
    if tablaPropietario.State = dsInactive then tablaPropietario.Open;
    xCodigoCte:= dmClientes.tblClientesCODIGO_CTE.Value;

    if (Assigned(frmEdicionVenta)) then
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
    end;
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

procedure TfrmProcVentaRapidaByM.ImprimeDocumento(serieDoc:integer);
var
   tRecordsDet : Integer;
begin
    //INGESERVIS, ARTIOFFICE,MAISONMARIE,TRIPLETASSO
    if ((UpperCase(GLBFormatoFactura) = 'CASANDRA2') or (UpperCase(GLBFormatoFactura) = 'FORMATOGENRAL')) then  //PENDIENTE DE ANALISIS
    begin
      frmConsultaFacturas:=TfrmConsultaFacturas.Create(Nil);
      try
        frmConsultaFacturas.rdgCredito.Checked := True;
        frmConsultaFacturas.EditN1.SetInteger(serieDoc);
        frmConsultaFacturas.BitBtn1Click(Self);
        LlenarrxSolDatoscte(dmFactura.qryVentaFacturaCODIGO_CTE.Value);
        if frmConsultaFacturas.rdgCredito.Checked then
        TipoVenta:='CREDITO'
        else
        tipoVenta:='CONTADO';

        if (GlbFact3Pulg = 1) then
        begin
          if (GlbActivaIFiscal = 0) then
          begin
            qckRepFactPuntoVenta:=TqckRepFactPuntoVenta.Create(Nil);
            try
              qckRepFactPuntoVenta.QRLabel14.Enabled:=False;
              if tRecordsDet > 2 then
               qckRepFactPuntoVenta.Page.Length:= qckRepFactPuntoVenta.Page.Length +
               (tRecordsDet - 1 ) * 74;
               if ImprimirRecibo1.Checked then
               begin
                 qckRepFactPuntoVenta.PrinterSetup;
                 qckRepFactPuntoVenta.Print
               end else
               qckRepFactPuntoVenta.Preview;
            finally
            qckRepFactPuntoVenta.Free;
            qckRepFactPuntoVenta:=Nil;
            end;
          end;
        end else
        begin
          qckRepRecibo8_5_11REspReimp :=TqckRepRecibo8_5_11REspReimp.Create(nil);
          try
         //if EsDevolucion then
         //begin
          //if EsModificandoFactura then
          //qckFactCredArtioffice8_5_F_1Std.qrLabelFactOrigen.Caption:='#Factura: '+IntToStr(UProcesarDevolucion.numeroFactura);
          qckRepRecibo8_5_11REspReimp.xtipoVenta:= TipoVenta;
         //end;
         //qckRepRecibo8_5_11REspReimp.qrtipoVenta.Caption:= '';
         qckRepRecibo8_5_11REspReimp.Prepare;
         glbTPag := qckRepRecibo8_5_11REspReimp.PageNumber;
         qckRepRecibo8_5_11REspReimp.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;
         if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
         begin
           qckRepRecibo8_5_11REspReimp.PrinterSetup;
           qckRepRecibo8_5_11REspReimp.Print;
         end else
         qckRepRecibo8_5_11REspReimp.Preview;
         finally
         qckRepRecibo8_5_11REspReimp.free;
         qckRepRecibo8_5_11REspReimp:=Nil;
         end;
        end;
       finally
       if Assigned(frmConsultaFacturas) then
          frmConsultaFacturas.Free;
          frmConsultaFacturas:=Nil;
       end;
    end else
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
            qckFactCredArtioffice8_5_F_1ByM.Prepare;
            glbTPag := qckFactCredArtioffice8_5_F_1ByM.PageNumber;
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
              qckFactCredArtioffice8_5_F_1.Prepare;
              glbTPag := qckFactCredArtioffice8_5_F_1.PageNumber;
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
    dmCompania.tblCompania.Locate('codigo', glbCia_Key,[]);
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
          if (GlbFacturaLicoreria =1) then
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
            begin
              qckRepFactPuntoVenta.PrinterSetup;
              qckRepFactPuntoVenta.Print;
            end else
            qckRepFactPuntoVenta.Preview;
          finally
          qckRepFactPuntoVenta.Free;
          qckRepFactPuntoVenta:=Nil;
          end;
        end;
      end;
    end;
  end;
end;

procedure TfrmProcVentaRapidaByM.ProcActualizaMsg;
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

procedure TfrmProcVentaRapidaByM.ProcGetUltNcf(tipo: string);
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

procedure TfrmProcVentaRapidaByM.RxDBLookupCombo3Change(Sender: TObject);
begin
  if not TotalesTipoNCF.IsNull then
  ProcGetUltNcf(TotalesTipoNCF.Value);
end;

procedure TfrmProcVentaRapidaByM.StatusBarClick(Sender: TObject);
begin
  ProcActualizaMsg;
  RxDBLookupCombo3Change(Self);

  if Not CheckPortComDisponible then
  begin
    lblStatusImpFiscal.Visible := True;
    lblStatusImpFiscal.Font.Color:= clRed;
  end else
  begin
    lblStatusImpFiscal.Visible := False;
  end;
end;

procedure TfrmProcVentaRapidaByM.ProcGetDatosDevparaNotaCR;
begin
  if rxVenta.RecordCount > 0 then
  begin
    MessageDlg('Terminar o cancelar transaccion en curso.',mtInformation,[mbok],0);
    exit;
  end;
  frmConsultaFacturas:=TfrmConsultaFacturas.Create(Nil);
  try
    frmConsultaFacturas.btnCrearNCR.Visible := True;
    frmConsultaFacturas.btnCrearNCR.Enabled := True;
    frmConsultaFacturas.BitBtn2.Enabled     := False;
    frmConsultaFacturas.BitBtn5.Enabled     := False;
    frmConsultaFacturas.BitBtn4.Enabled     := False;
    _abortar := True;
    if frmConsultaFacturas.Showmodal = mrOK then
    begin
      _abortar:=False;
      if (EsDevolucion) and (frmConsultaFacturas.RxDBGrid2.SelectedRows.Count = 0) then
      begin
         MessageDlg('Debe seleccionar producto, verifique.',mtError,[mbOk], 0);
         if frmConsultaFacturas.Showmodal <> mrOK then
         exit;
      end;
      if (dmFactura.qryVentaFacturaSTATUS.Value[1] In ['C','R']) then
      begin
        MessageDlg('Factura no está activa, no puede ser modificada.',mtInformation,[mbok],0);
        FreeAndNil(frmConsultaFacturas);
        exit;
      end;
      if VerificaClave then
      begin
        if frmConsultaFacturas.rdgContado.Checked then
        esContado:=True
        else esContado:=False;

        if esContado then
        numerodocReimp := dmFactura.qryVentaFacturaNUMERO.AsInteger
        else
        begin
          numerodocReimp := dmFactura.qryVentaFacturaNUMERO_FACTURA.Value;

        end;

        LlenandoDatos:=True;
        CargarDatosAModificar;
        LlenandoDatos :=False;
        DBEdit10Exit(Self);
        Edit1Enter(Self);
        //ActivarBotonesEnModifica;
      end;
    end else
    _abortar:=True;
  finally
  frmConsultaFacturas.Free;
  frmConsultaFacturas:= Nil;
  end;

  BitBtn7.Enabled:=True;
  Refresh;
end;

procedure TfrmProcVentaRapidaByM.VerDetalleVenta1Click(Sender: TObject);
begin
  if not Assigned(frmVerDet) then
  frmVerDet:=TfrmVerDet.Create(Nil);
  try
    frmVerDet.Show;
  finally
  end;
end;

procedure TfrmProcVentaRapidaByM.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Assigned(frmConsultaFacturas) then
  begin
    frmRegServicioTaller.Show;
    exit;
  end;
  if Assigned(frmVerDet) then
  begin
    FreeAndNil(frmVerDet);
  end;
end;

procedure TfrmProcVentaRapidaByM.CheckBox1Click(Sender: TObject);
begin
  if Not CheckBox1.Checked then
  begin
    if (Totales.State = dsBrowse) then
    Totales.Edit;
    TotalesTipoNCFIFiscal.AsVariant := Null;
    
    TotalesTipoNCF.AsVariant := Null;
    if (Totales.State In [dsEdit, dsInsert]) then
    Totales.Post;
  end;
end;

procedure TfrmProcVentaRapidaByM.ReimprimirFacturaNoFiscal(numTRN : Integer);
var
  tRecordsDet : integer;
  ImpPDF, flag : boolean;
begin
  ImpPDF := False;
  dmCompania.tblCompania.Close;
  dmCompania.tblCompania.Open;
  dmCompania.tblCompania.Locate('codigo',glbCia_Key,[]);
  dmfactura.qryFactReimpMaster.Close;
  if (numTRN = 0) then
  dmfactura.qryFactReimpMaster.Params[0].Value:= StrToInt(InputBox('Re-Imprimir factura a crédito','Entre número',''))
  else
  dmfactura.qryFactReimpMaster.Params[0].Value:= numTRN;
  TipoVenta := 'CREDITO';
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

    LlenarrxSolDatoscte(dmFactura.qryVentaFacturaCODIGO_CTE.Value);
    //INGESERVIS, ARTIOFFICE,MAISONMARIE,TRIPLETASSO,CASANDRA2
    if (UpperCase(GLBFormatoFactura) = 'CASANDRA2') then  //PENDIENTE DE ANALISIS
    begin
      //frmConsultaFacturas:=TfrmConsultaFacturas.Create(Nil);
      //try
      //  frmConsultaFacturas.rdgCredito.Checked := True;
      //  frmConsultaFacturas.EditN1.SetInteger(serieDoc);
      //  frmConsultaFacturas.BitBtn1Click(Self);
      qckRepRecibo8_5_11REspReimp :=TqckRepRecibo8_5_11REspReimp.Create(nil);
      try
        //if EsDevolucion then
        //begin
          //if EsModificandoFactura then
          //qckFactCredArtioffice8_5_F_1Std.qrLabelFactOrigen.Caption:='#Factura: '+IntToStr(UProcesarDevolucion.numeroFactura);
          qckRepRecibo8_5_11REspReimp.xtipoVenta:= TipoVenta;
          qckRepRecibo8_5_11REspReimp.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;
        //end;
        //qckRepRecibo8_5_11REspReimp.qrtipoVenta.Caption:= '';
        if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
        begin
          qckRepRecibo8_5_11REspReimp.PrinterSetup;
          qckRepRecibo8_5_11REspReimp.Print;
        end else
        qckRepRecibo8_5_11REspReimp.Preview;
      finally
      qckRepRecibo8_5_11REspReimp.free;
      qckRepRecibo8_5_11REspReimp:=Nil;
      end;
      //finally
      //if Assigned(frmConsultaFacturas) then
      //   frmConsultaFacturas.Free;
      //   frmConsultaFacturas:=Nil;
      //end;
    end else
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

      flag:= True;
      qckRepFactPuntoVenta.Prepare;
      rxventa.DisableControls;
      rxdbgrid1.Enabled:= False;
      if (dmfactura.qryFactReimpDet.RecordCount > 1) Or (qckRepFactPuntoVenta.PageNumber > 1) then
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
      rxdbgrid1.Enabled:= True;

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

procedure TfrmProcVentaRapidaByM.BitBtn15Click(Sender: TObject);
begin
  esContado:=False;
  ReimprimirFacturaNoFiscal(0);
end;

procedure TfrmProcVentaRapidaByM.VerTipoComprobantes1Click(Sender: TObject);
begin
  if not Assigned(frmVerTipoComprobantes) then
  frmVerTipoComprobantes:=TfrmVerTipoComprobantes.Create(Nil);
  try
    frmVerTipoComprobantes.Show;
  finally
  //frmVerTipoComprobantes.Free;
  //frmVerTipoComprobantes:=Nil;
  end;
end;//LlenarrxSolDatoscte;

    //829-982-7226

procedure TfrmProcVentaRapidaByM.RxDBLookupCombo1Change(Sender: TObject);
var
  sDesc : String;
begin
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
  lblRNC.Caption:= sDesc +qryclienternc_numero.Value;
end;

procedure TfrmProcVentaRapidaByM.tablaPropietarioAfterOpen(DataSet: TDataSet);
begin
  lblRNC.Caption:= '';
end;

procedure TfrmProcVentaRapidaByM.rxVentaAfterClose(DataSet: TDataSet);
begin
  lblRNC.Caption:='';
end;

procedure TfrmProcVentaRapidaByM.ListarPuertosCom1Click(Sender: TObject);
begin
  frmPuertosLibres:=TfrmPuertosLibres.Create(nil);
  try
    frmPuertosLibres.Showmodal;
  finally
  frmPuertosLibres.free;
  frmPuertosLibres:=nil;
  end;
end;

function TfrmProcVentaRapidaByM.CheckPortComDisponible: boolean;
begin
  result:=true;
  frmPuertosLibres:= TfrmPuertosLibres.Create(nil);
  frmPuertosLibres.VerificarPuertosLibres;
  if Not GlbPuertoDisponible then
  begin
    result:=False;
  end;
  frmPuertosLibres.Free;
  frmPuertosLibres :=nil;
end;

procedure TfrmProcVentaRapidaByM.ReImprimeDevolucionsinFact1Click(
  Sender: TObject);
  var
  _xflag : Boolean;
begin
  _xflag := True;
  ReImpDevolucion(UProcesarDevolucion.numeroFactura,_xflag);
  //ReImprimeDevolucion1Click(Self);
end;

procedure TfrmProcVentaRapidaByM.ReImpDevolucion(numDev : Integer;var _flag : boolean);
begin
  //Usado para filtrar dmfactura.qryventafactura
  UProcesarDevolucion.numeroFactura := numDev;
  if (rxVenta.RecordCount > 0) And (Not EsDevolucion) then
  begin
    MessageDlg('Terminar o cancelar transacción en curso.', mtInformation, [mbok], 0);
    exit;
  end;
  EsDevolucion := True;
  dmFactura.formaPago := 6;//Devolucion
  if UProcesarDevolucion.numeroFactura <= 0 then
  UProcesarDevolucion.numeroFactura := StrToInt(InputBox('Re-Imprimir factura devolución','Entre número devolución',''));
  dmCompania.tblCompania.Close;
  dmCompania.tblCompania.Open;
  dmCompania.tblCompania.Locate('codigo', glbCia_Key, []);
  dmfactura.qryFactReimpMaster.Close;
  dmfactura.qryFactReimpMaster.SQL.Text := dmfactura.qryFactReimpMasterDevol.SQL.Text;
  dmfactura.qryFactReimpMaster.Params[0].AsInteger := UProcesarDevolucion.numeroFactura;
  dmfactura.qryFactReimpMaster.Params[1].AsSmallInt:= 6;//Devolucion
  if not dmfactura.qryFactReimpMaster.Prepared then
  dmfactura.qryFactReimpMaster.Prepare;
  dmfactura.qryFactReimpMaster.Open;
  _flag := True;
  if dmfactura.qryFactReimpMaster.RecordCount = 0 then
  begin
    MessageDlg('Numero devolución no encontrada, verifique.',mtInformation,[mbok], 0);
    _flag := False;
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
      frmConsultaFacturas.rdgCredito.Checked := False;
      frmConsultaFacturas.EditN1.SetInteger(dmfactura.qryFactReimpMaster.Params[0].Value);
      dmFactura.qryVentaFactura.SQL.Text:=
      dmFactura.qryVentaFactDevolucion_base.SQL.Text +' Where VENTAS_MAST.NUMERO_doc_pago =:numero '+
      ' And ventas_mast.cia_key =:ciakey'+
      ' And ventas_mast.FORMA_PAGO = 6 ' +
      ' And ventas_mast.codigo_cte = '   + dmfactura.qryFactReimpMasterCODIGO_CTE.AsString;

      dmFactura.qryVentaFactura.Params[0].AsInteger := UProcesarDevolucion.numeroFactura;
      GlbcodVendedor:= dmFactura.qryVentaFacturaCODIGO_VENDEDOR.Value;
      dmFactura.qryVentaFactura.Params[1].AsInteger := glbCia_Key;
      dmFactura.qryVentaFactura.Open;
      GlbcodVendedor:= dmFactura.qryVentaFacturaCODIGO_VENDEDOR.Value;
      if dmFactura.qryVentaFactura.RecordCount = 0 then
      begin
        _flag := False;
        MessageDlg('Record para devolución no encontrado',mtInformation,[mbok],0);
        Exit;
      end;
      dmFactura.qryDatosTrncxc.Close;  //dmFactura.qryVentaFactura.RecordCount;
      if esContado then
      dmFactura.qryDatosTrncxc.Params[0].AsInteger:= 2
      else
      dmFactura.qryDatosTrncxc.Params[0].AsInteger:= 1;
      dmFactura.qryDatosTrncxc.Params[1].AsInteger:= dmFactura.qryVentaFacturaNUMERO_DOC_PAGO.AsInteger;
      dmFactura.qryDatosTrncxc.Open;

      LlenarrxSolDatoscte(dmFactura.qryVentaFacturaCODIGO_CTE.Value);
    finally
    if Assigned(frmConsultaFacturas) then
    frmConsultaFacturas.Free;
    frmConsultaFacturas:=Nil;
    end;

    if (dmFactura.qryVentaFacturaTIPO_FACTURA.Value = 6 ) then //
    begin
      if (UpperCase(GLBFormatoFactura) = 'CASANDRA2') then  //PENDIENTE DE ANALISIS
      begin
        qckRepRecibo8_5_11REspReimp :=TqckRepRecibo8_5_11REspReimp.Create(Nil);
        try
          qckRepRecibo8_5_11REspReimp.Prepare;
          glbTPag := qckRepRecibo8_5_11REspReimp.PageNumber;
          if EsDevolucion then
          begin
            qckRepRecibo8_5_11REspReimp.xtipoVenta:= 'Devolución';
          end;
          qckRepRecibo8_5_11REspReimp.QRLabel28.Enabled:=False;
          qckRepRecibo8_5_11REspReimp.QRDBText23.Enabled:=False;
          qckRepRecibo8_5_11REspReimp.QRDBText11.Enabled:=False;

          if not dmReportes.qryViewVentasMastNUMERO_NCF.IsNull then
          qckRepRecibo8_5_11REspReimp.valorNCF:= qckRepRecibo8_5_11REspReimp.valorNCF
          else
          qckRepRecibo8_5_11REspReimp.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;

          if (qckRepRecibo8_5_11REspReimp.valorNCF = '') then
          qckRepRecibo8_5_11REspReimp.valorNCF := dmFactura.qryVentaFacturaNUMERO_NCF.Value;

          qckRepRecibo8_5_11REspReimp.xtipoVenta:= 'NOTA CREDITO (Devolución)';
          if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
          begin
            qckRepRecibo8_5_11REspReimp.PrinterSetup;
            qckRepRecibo8_5_11REspReimp.Print;
            end else
            qckRepRecibo8_5_11REspReimp.Preview;
          finally
          qckRepRecibo8_5_11REspReimp.Free;
          qckRepRecibo8_5_11REspReimp:= Nil;
          end;
        end else
        begin
         //if GlbRec3Pulg = 1 then
         // begin
            //put code here
         // end else
          begin
          qckFactCredArtioffice8_5_F_1:=TqckFactCredArtioffice8_5_F_1.Create(nil);
          qckFactCredArtioffice8_5_F_1.Prepare;
          glbTPag := qckFactCredArtioffice8_5_F_1.PageNumber;
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
          END;
        end;
  end else
  begin
    ImpFacturaservicio(dmfactura.qryFactReimpMaster.Params[0].Value,True);
  end;
    Label36.Visible := False;
    Label36.Caption := '';
    rdgFactServicio.Checked:=False;
    Label36.Visible := False;
    Label36.caption := '';
    rdgFactServicio.Checked := False;
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
    EsModificandoCotiza := False;
    label36.Caption := '';
    NoTieneCredito := False;
    Refresh;
    EsDevolucion := False;
    Totales.EmptyTable;

    lblProcDev.Visible := False;
    UProcesarDevolucion.numeroFactura := 0;
    dmFactura.qryVentaFactura.Close;
    dmFactura.qryDatosTrncxc.Close;
    dmfactura.qryFactReimpDet.Close
end;

//Procesar Devolución Ventas Cash sin Cliente
procedure TfrmProcVentaRapidaByM.ProcDevoluconCash;
var
  x : Integer;
begin
  numeroTrnVta:= 0;
  TotalesTipoNCFIFiscal.Value;
  TotalesTipoNCF.Value;
  if EsModificandoCotiza then Exit;

  if (rxVenta.RecordCount > 0) and (not EsDevolucion) then
  begin
    if (TotalesSubTotal.Value <= 0) then
    begin
      MessageDlg('Total venta no puede ser cero, verifique.', mtError, [mbOk], 0);
      Exit;
    end;

    if (tablaPropietarioCodigoPropietario.Value > 0) then
    begin
      MessageDlg('Verificar que el cliente sea genérico(codigo 0).', mtInformation, [mbOk],0);
      RxDBLookupCombo1.SetFocus;
      Exit;
    end;

    //Asignar valor
    //GlbcodVendedor:=

    if (GlbActivaIFiscal = 1 ) then
    begin
      MessageDlg('Verifique configuración, versión fiscal activa.', mtInformation, [mbOk],0);
      RxDBLookupCombo3.SetFocus;
      Exit;
    end;
  end;
  
  //***********************************PROCESO DEVOLUCION PARCIAL *************
  if (EsDevolucion) And (rxVenta.RecordCount > 0) then
  begin
    if dmFactura.qryVentaFactura.State = dsInactive then
    begin
      MessageDlg('Transacción no puede ser procesada como devolución, verifique.', mtInformation, [mbok], 0);
      Exit;
    end;
    if (dmFactura.qryVentaFacturaNumero_ncf.value <> '') then
    begin
      if (TotalesTipoNCFIFiscal.Value = -1) then
      begin
        Totales.Edit;
        TotalesTipoNCFIFiscal.Value:= 2;//2;
        Totales.Post;
      end else
      if (TotalesTipoNCFIFiscal.Value = 0) then
      begin
        Totales.Edit;
        TotalesTipoNCFIFiscal.Value:=dmFactura.ibQryViewNCFTIPO_NCFNCR.Value;//2;
        Totales.Post;
      end else
      if (TotalesTipoNCFIFiscal.Value = 1) then
      begin
        Totales.Edit;
        TotalesTipoNCFIFiscal.Value:=dmFactura.ibQryViewNCFTIPO_NCFNCR.Value;//3;
        Totales.Post;
      end else
      if (TotalesTipoNCFIFiscal.Value = 5) then
      begin
        Totales.Edit;
        TotalesTipoNCFIFiscal.Value:=dmFactura.ibQryViewNCFTIPO_NCFNCR.Value;
        Totales.Post;
      end else
      if (TotalesTipoNCFIFiscal.Value = 4) then
      begin
        Totales.Edit;
        TotalesTipoNCFIFiscal.Value:=dmFactura.ibQryViewNCFTIPO_NCFNCR.Value;
        Totales.Post;
      end else
      begin
        MessageDlg('No permitido', mtInformation, [mbok],0);
        Exit;
      end;
      end else
      begin
        Totales.Edit;
        TotalesTipoNCFIFiscal.AsVariant:= null;
        TotalesTipoNCF.AsVariant := null;
        Totales.Post;
      end;

     if TotalesMoneda.IsNull then
     begin
       MessageDlg('Favor indicar moneda.', mtInformation, [mbok], 0);
       Exit;
     end;
     if MessageDlg('Desea procesar transacción como devolución?', mtWarning, [mbYes, mbNo],0)= mrYes then
     begin
       //if (tablaPropietarioCodigoPropietario.value = 0) then
       //begin
       //  MessageDlg('Favor seleccionar cliente.', mtInformation, [mbOK], 0);
       //  RxDBLookupCombo1.SetFocus;
       //  Exit;
       //end;

      //Crear Nota Credito
      UProcesarDevolucion.tipoCF    := '04';
      UProcesarDevolucion.fechaTrn  := rxVentaFecha.Value;
      UProcesarDevolucion.codigo_cte:= tablaPropietarioCodigoPropietario.Value;

      if not qryCliente.Locate('CODIGO_CTE',tablaPropietarioCodigoPropietario.Value,[]) then
      begin
        UProcesarDevolucion.nombrecompleto :='*** Genérico ***';
        UProcesarDevolucion.cedula   := '';
        UProcesarDevolucion.direccion:= '';
        UProcesarDevolucion.ciudad   := '';
      end else
      begin
        UProcesarDevolucion.nombrecompleto :=qryClienteNOMBRE_FACTURAR.Value;
        if Not qryClienteRNC_NUMERO.IsNull then
        UProcesarDevolucion.cedula   := qryClienteRNC_NUMERO.Value
        else
        UProcesarDevolucion.cedula   := qryClienteCEDULA.Value;
        UProcesarDevolucion.direccion:= qryClienteDIRECCION_CONT.Value;
        UProcesarDevolucion.ciudad   := qryClienteCIUDAD.Value;// '';
      end;
      UProcesarDevolucion.monto    := Totalestotalneto.Value;
      UProcesarDevolucion.status   := 'A';
      UProcesarDevolucion.Moneda   := Trim(TotalesMoneda.Value);
      UProcesarDevolucion.codig_usuario := VarUsuarioGlb;
      UProcesarDevolucion.fechaInsert   := Now;;
      UProcesarDevolucion.fechaUpdate   := Now ;
      UProcesarDevolucion.codigousuarioupd := VarUsuarioGlb;
      UProcesarDevolucion.tipodoc := 5; //Nota Credito
      UProcesarDevolucion.numeroFactura := rxVentaNumeroFactura.Value;
      if TotalesTipoNCFIFiscal.IsNull then
      UProcesarDevolucion.GeneraNCF:= False
      else
      UProcesarDevolucion.GeneraNCF:= True;
      //UProcesarDevolucion.UpdateBLCCXC := dmFactura.qryVentaFacturaNUMEROFACTURA.Value > 0;
      if dmFactura.qryVentaFacturaFORMA_PAGO.Value in [7,8,15] then
       UProcesarDevolucion.UpdateBLCCXC  := True
      else
      UProcesarDevolucion.UpdateBLCCXC := False;

      if UProcesarDevolucion.GeneraNCF then
      UProcesarDevolucion.Ejecutar('04', TotalesTipoNCFIFiscal.Value, dmFactura.qryVentaFacturaNUMERO.Value)//Comprogante Fiscal Nota de Credito
      else
      UProcesarDevolucion.Ejecutar('', -1, dmFactura.qryVentaFacturaNUMERO.Value);

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
    end;
    if (GlbActivaIFiscal = 1 ) then
    begin
      dmdatos.qryConfCajaXusuario.Close;
      dmdatos.qryConfCajaXusuario.Open;
      dmdatos.qryConfCajaXusuario.Locate('COD_EMPLEADO', VarUsuarioGlb,[]);

      dmReportes.qryDatosCajaImpUser.Close;
      dmReportes.qryDatosCajaImpUser.Params[0].Value:= VarUsuarioGlb;
      dmReportes.qryDatosCajaImpUser.Open;
      dmReportes.qryDatosCajaImpUser.Last;
      dmReportes.qryDatosCajaImpUser.RecordCount;
      dmFactura.qryDatosTrncxc.Close;

      dmFactura.qryDatosTrncxc.Params[0].AsInteger:= 1;
      dmFactura.qryDatosTrncxc.Params[1].AsInteger:= UProcesarDevolucion.numeroFactura;
      dmFactura.qryDatosTrncxc.Open;

      GlbNombreFiletoPrint:= Format('%s%s%s%s%s%s%s',[dmReportes.qryDatosCajaImpUserRUTA_TICKET.Value,'\NotaCredito',Trim(GlbCodSucursal),Trim(GlbModeloImpresora),
      IntToStr(VarUsuarioGlb),IntToStr(dmFactura.qryDatosTrncxcNUM_DOC.Value),'.txt']);
      //if (dmfactura.qryDatosTrncxc.State = dsInactive) then
      //begin
      //end;

      dmReportes.qryDatosVentaMaster.Close;
      dmReportes.qryDatosVentaMaster.Params[0].Value:= numeroTrnVta; //dmFactura.qryVentaFacturaNumero.Value;
      dmReportes.qryDatosVentaMaster.Open;

      PrepararInfoFiscalNCR(dmFactura.qryDatosTrncxcNUM_DOC.Value);
      dmReportes.qryDatosRepTranscxcIFiscal.Last;
      dmReportes.qryDatosRepTranscxcIFiscal.First;


      dmFactura.qryGetNcfAsignado.Close;
      if esContado then //contado
      dmFactura.qryGetNcfAsignado.SQL.Text:=dmFactura.qryGeNcfAsignado_1.SQL.Text
      else
      dmFactura.qryGetNcfAsignado.SQL.Text:=dmFactura.qryGetNcfAsignado_0.SQL.Text;
      //if esContado then
      dmFactura.qryGetNcfAsignado.Params[0].Value:= dmReportes.qryViewVentasMastNUMERO.Value;
      //else
      //dmFactura.qryGetNcfAsignado.Params[0].Value:= dmFactura.qryVentaFacturaNUMERO.Value;

      dmFactura.qryGetNcfAsignado.Open;
      dmFactura.qryVentaFactura.Last;

      if (dmReportes.qryViewVentasMastNUMERO_NCF.Isnull) then
      begin
        MessageDlg('Se requiere NCF afectado para Nota de Crédito, verifique.', mtError, [mbOk], 0);
        Exit;
      end;
      if (dmfactura.qryDatosTrncxc.State = dsInactive) then
      begin
        dmFactura.qryDatosTrncxc.Params[0].AsInteger:= 1;
        dmFactura.qryDatosTrncxc.Params[1].AsInteger:= dmReportes.qryViewVentasMastNUMERO_FACTURA.Value;
        dmFactura.qryDatosTrncxc.Open;
      end;
      if (dmfactura.qryDatosTrncxc.RecordCount = 0) then
      begin
        MessageDlg('Nota de Crédito no disponible para impresión, verifique.', mtError, [mbOk], 0);
        Exit;
      end else
      begin

        frmTestImpresoraFiscal:= TfrmTestImpresoraFiscal.Create(Nil);
        try
          frmTestImpresoraFiscal.ncfAfectado := dmReportes.qryViewVentasMastNUMERO_NCF.Value;
          frmTestImpresoraFiscal.LCantCopias := rxspinImpCantCopias.Text;
          frmTestImpresoraFiscal.BitBtn1Click(Self);
          frmTestImpresoraFiscal.btnImprimeReciboClick(Self);
        finally
        frmTestImpresoraFiscal.Free;
        frmTestImpresoraFiscal:= Nil;
        end;
        Delay(1000);
        //frmTestImpresoraFiscal.ncfAfectado := dmReportes.qryViewVentasMastNUMERO_NCF.Value;
        //frmTestImpresoraFiscal.LCantCopias := rxspinImpCantCopias.Text;
        //frmTestImpresoraFiscal.BitBtn1Click(Self);
        //frmTestImpresoraFiscal.btnImprimeReciboClick(Self);
        ReactivarValores;
      end;
    end else //No Fiscal
    ReImprimeDevolucionsinFact1Click(Self);
    UProcesarDevolucion.numeroFactura :=-1;
    ProcActualizaMsg;
    EsModificandoCotiza:= False;
    label36.Caption    := '';
    NoTieneCredito     := False;
    //Refresh;
    EsDevolucion       := False;
    //EsDevolucion := Not EsDevolucion;
    lblProcDev.Visible := EsDevolucion;
    if lblProcDev.Visible = false then
    lblProcDev.SendToBack else
    lblProcDev.BringToFront;
    lblProcDev.Left:= 192;
    rxventa.EmptyTable;
    rxSolDatoscte.EmptyTable;
    lblProcDev.Caption  :='Proceso Venta';
    EsModificandoFactura:=False;
    qryInventario.Close;
    qryInventario.Open;
    qryProductos.Close;
    qryProductos.Open;
    numeroTrnVta:= 0;
    GlbcodVendedor:=-1;
    rxventa.EnableControls;
    Refresh;
    lblProcDev.Visible := False;
    Exit;
  end;

 //---EN PRUEBA RE-hABILITAR PARA CONTINUAR
 // }
  EsDevolucion := Not EsDevolucion;
  lblProcDev.Visible := EsDevolucion;
  if lblProcDev.Visible = false then
  lblProcDev.SendToBack else
  lblProcDev.BringToFront;
  lblProcDev.Left:= 192;
  For x:=1 To 50 Do
  begin
    lblProcDev.Left:=lblProcDev.Left - 1;
  end;
  BitBtn4.Enabled    := True;
  BitBtn6.Enabled    := True;
  EsNotaCRParcial    := False;
  if EsDevolucion then
  begin
    lblProcDev.Caption:='Procesando Devolución';
    ProcGetDatosDevparaNotaCR;//Cargar datos
    EsNotaCRParcial:=True;
    Exit;
  end
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
    rxventa.EnableControls;
    try
    Totales.EmptyTable;
    lblProcDev.Visible := False;
    tablaPropietario.Close;
    tablaPropietario.Open;
    rxventa.EmptyTable;
    except
    end;
  EsModificandoFactura    :=False;
  GlbUsandoCotiza :=False;
  bitBtnEditarFact.Visible:=False;
  bitBtnEditarFact.Top := 475;
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
  GlbImprimeReciboFact := 1;
  InactivaImprecibo    := False;
  EsModificandoFactura := False;
  cboxTipoUnidad.Clear;
  bitBtnEditarFact.Visible := False;
  Refresh;
  Application.ProcessMessages;
end;

procedure TfrmProcVentaRapidaByM.ProcInsertarVtaMastCashEnDev(var NumTrnGen : Integer; var NumOrden : Integer);
begin
  if (GlbActivaIFiscal = 1 ) then Exit;
  
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

  ipStpInsertVentMast.Params[8].Value    := Totalestotalneto.Value; //EditN1.Text;
  ipStpInsertVentMast.Params[9].Value    := 'A';
  ipStpInsertVentMast.Params[10].Value   := Now;
  ipStpInsertVentMast.Params[11].Value   := StrUserName;
  ipStpInsertVentMast.Params[12].Value   := Null;
  ipStpInsertVentMast.Params[13].Value   := Null;

  //UProcesarDevolucion.numeroFactura;//Numero Factura
  //if (dmcxc.tblTransCxcnumero_doc.IsNull) then
  //begin

    dmcxc.stpProcNumDoc.Params[1].Value := 5;
    dmcxc.stpProcNumDoc.ExecProc;
    ipStpInsertVentMast.Params[15].Value:= dmcxc.stpProcNumDoc.Params[0].Value;
    NumOrden := ipStpInsertVentMast.Params[15].Value;

  ipStpInsertVentMast.Params[14].Value   := NumOrden;
  //  UProcesarDevolucion.numeroFactura   := ipStpInsertVentMast.Params[15].Value;
  //end else
  //ipStpInsertVentMast.Params[15].Value:= dmcxc.tblTransCxcnumero_doc.Value;    //yo soy inteligencia divina

  //if Serie_asignadoncf > 0 then
  ipStpInsertVentMast.Params[16].Value     := null;
  //else ipStpInsertVentMast.Params[16].Value:= Null;
  ipStpInsertVentMast.Params[17].Value:= TotalesSubTotal.Value;
  ipStpInsertVentMast.Params[18].Value:= TotalesPorcDesAdicional.Value;
  if TotalesMontoDescAdicional.Value > 0 then
  ipStpInsertVentMast.Params[19].Value:= TotalesMontoDescAdicional.Value
  else
  ipStpInsertVentMast.Params[19].Value:= TotalesMontoDescItems.Value;//TotalesMontoDescAdicional.Value  * -1;
  ipStpInsertVentMast.Params[20].Value:= Abs(Totalestotalneto.Value);
  ipStpInsertVentMast.Params[21].Value:= Totalesdevolucion.Value;
  ipStpInsertVentMast.Params[22].Value:= Totalesitbis.Value;
  ipStpInsertVentMast.Params[23].Value:= Abs(Totalestotalneto.Value);
  if (edtObservacion.Text <> '') then
  ipStpInsertVentMast.Params[24].Value:= edtObservacion.Text
  else ipStpInsertVentMast.Params[24].Value:= '';

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
  ipStpInsertVentMast.Params[35].Value:= TotalesRecargo.Value;
  ipStpInsertVentMast.Params[36].Value:= TotalesTipoNCFIFiscal.Value;
  ipStpInsertVentMast.Params[37].Value:= TotalesMontoExoneraITBIS.Value;
  ipStpInsertVentMast.Params[38].Value:= 0;

  ipStpInsertVentMast.ExecProc;
  numeroTrnVta:= ipStpInsertVentMast.Params[0].Value;
  if Assigned(frmRegServicioTaller) then
  UpdateServINFO(ipStpInsertVentMast.Params[0].Value);
  if Assigned(frmAlquiler) then
  UpdateServAlquiler(ipStpInsertVentMast.Params[0].Value);

  if Not ipStpInsertVentMast.Transaction.InTransaction then
  ipStpInsertVentMast.Transaction.StartTransaction;
  try
    ipStpInsertVentMast.Transaction.CommitRetaining;
  except
  ipStpInsertVentMast.Transaction.RollbackRetaining;
  end;

  NumTrnGen:= ipStpInsertVentMast.Params[0].Value;

end;

procedure TfrmProcVentaRapidaByM.InsertarDetDevolucionCash(numero: Integer);
begin
  ibStpInsertVentaDet.Params[0].Value  := Numero;
  ibStpInsertVentaDet.Params[1].Value  := rxVentaCodArticulo.Value;
  ibStpInsertVentaDet.Params[2].Value  := Null;
  ibStpInsertVentaDet.Params[3].Value  := rxVentaDescripcion.Value;
  ibStpInsertVentaDet.Params[4].Value  := rxVentaCant.Value;
  ibStpInsertVentaDet.Params[5].Value  := rxVentaPrecio.Value;
  ibStpInsertVentaDet.Params[6].Value  := rxVentaporc_desc.Value;//descuento
  ibStpInsertVentaDet.Params[7].Value  := rxVentaItbi.Value;//itbi_det
  ibStpInsertVentaDet.Params[8].Value  := rxVentaMontoBruto.Value;
  ibStpInsertVentaDet.Params[9].Value  := rxVentaMontoNeto.Value;
  ibStpInsertVentaDet.Params[10].Value := dmFactura.qryVentaFacturaNUMERO_FACTURA.Value;
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
  if (ABS(TotalesMontoExoneraITBIS.Value) > 0) then
  ibStpInsertVentaDet.Params[22].Value := 1
  else
  ibStpInsertVentaDet.Params[22].Value := rxVentaItbisExento.Value;
  ibStpInsertVentaDet.Params[23].Value := rxVentaTipoVenta.Value;//Item de Venta
  ibStpInsertVentaDet.Params[24].Value := rxVentaDescripcionEspecial.Value;//Item de Venta
  ibStpInsertVentaDet.Params[25].Value := rxVentaCostoProducto.Value;
  ibStpInsertVentaDet.Params[26].Value := rxVentaPorcDescItem.Value;

  if (rxVentaMontoDescItem.Value > 0) then
  ibStpInsertVentaDet.Params[27].Value := rxVentaMontoDescItem.Value
  else
  ibStpInsertVentaDet.Params[27].Value := rxVentaMontoDesGlobal.Value;

  ibStpInsertVentaDet.Params[28].Value := rxVentaMontoDescuento.Value;
  ibStpInsertVentaDet.Params[29].Value := rxVentaIDTasaITBIS.Value;
  ibStpInsertVentaDet.Params[30].Value := rxVentaMontoItbisRecargo.Value;
  ibStpInsertVentaDet.Params[31].Value := rxVentaMoneda.Value;
  ibStpInsertVentaDet.Params[32].Value := rxVentamonto_tasa.Value;
  
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
procedure TfrmProcVentaRapidaByM.UpdateServINFO(numVta: integer);
begin
  if (NumTrnServ > 0) then
  begin
    if Assigned(frmRegServicioTaller) then
    begin
      if (dmVentas.tblRegServicioMaster.Locate('NUMERO', NumTrnServ,[])) then
      begin
        if (dmVentas.tblRegServicioMasterNUM_TRNVENTA.IsNull) then
        begin
          dmVentas.tblRegServicioMaster.Edit;
          dmVentas.tblRegServicioMasterNUM_TRNVENTA.Value := numVta;
          dmVentas.tblRegServicioMasterSTATUS.Value := 'R';
          GlbSalvarQuery(dmVentas.tblRegServicioMaster);
          //dmVentas.tblRegServicioMaster.Close;
          //dmVentas.tblRegServicioMaster.Open;
          dmVentas.tblRegServicioMaster.Locate('NUMERO', NumTrnServ,[]);
          NumTrnServ:= -1;
        end;
      end;
    end;
  end;
end;

procedure TfrmProcVentaRapidaByM.DBEdit1Change(Sender: TObject);
begin
  //dmCalculos.esFeedback:=True;
end;

procedure TfrmProcVentaRapidaByM.DBEdit2Change(Sender: TObject);
begin
  //dmCalculos.esFeedback:=True;
end;

procedure TfrmProcVentaRapidaByM.Alquiler1Click(Sender: TObject);
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
  if Not Assigned(frmAlquiler) then
  frmAlquiler:=TfrmAlquiler.Create(Nil);
  try
    dmInventario.tblInventarioProd.Close;
    dmInventario.tblInventarioProd.Params[0].Value:=glbCia_Key;
    dmInventario.tblInventarioProd.Open;
    frmAlquiler.Panel1.Caption := 'PROCESAR SALIDA ALQUILER';
    frmAlquiler.tripoTrn := 1;
    //1-Alquiler
    //2-Lavanderia
    //3-Costura
    frmAlquiler.tipoOpe := 1;
    frmAlquiler.ProcAbrir;
    if Assigned(frmProcVentaRapidaByM) then
    begin
      Hide;
      frmAlquiler.Show;
    end;
  finally
  //frmAlquiler.Free;
  //frmAlquiler:=Nil;
  end;
end;

procedure TfrmProcVentaRapidaByM.RxSpinEdit1Exit(Sender: TObject);
begin
  BitBtn27Click(Self);
end;

procedure TfrmProcVentaRapidaByM.UpdateServAlquiler(numVta: integer);
begin
  if (NumTrnServAlq > 0) then
  begin
    if Assigned(frmAlquiler) then
    begin
      if (dmInventario.tblAlquilerMaster.Locate('idserie', NumTrnServAlq,[])) then
      begin
        if (dmInventario.tblAlquilerMasterNUM_TRNVENTA.IsNull) then
        begin
          dmInventario.tblAlquilerMaster.Edit;
          dmInventario.tblAlquilerMasterFECHA_ENTRADA.Value := ExtraerFecha(GlbFechaTrnDiaria);
          dmInventario.tblAlquilerMasterFECHA_MOD.Value := Now;
          dmInventario.tblAlquilerMasterMOD_POR.Value   := strUserName;
         //dmInventario.tblAlquilerMasterSTATUS.Value  := 'R';
         //dmInventario.tblAlquilerDet.Edit;

          //dmInventario.tblAlquilerMaster.Edit;
          dmInventario.tblAlquilerMasterNUM_TRNVENTA.Value := numVta;
          dmInventario.tblAlquilerMasterSTATUS.Value := 'R';
          GlbSalvarQuery(dmInventario.tblAlquilerMaster);
          dmInventario.tblAlquilerMaster.Locate('IDSERIE', NumTrnServAlq,[]);
          NumTrnServAlq:= -1;
          dmInventario.tblInventarioProd.Close;
          dmInventario.tblInventarioProd.Params[0].Value:=glbCia_Key;
          dmInventario.tblInventarioProd.Open;
         if dmInventario.tblInventarioProd.Locate('CODIGO', dmInventario.tblAlquilerDetCOD_PRODUCTO.Value,[]) then
         begin
           dmInventario.tblInventarioProd.Edit;
           dmInventario.tblInventarioProdFECHA_ULTIMA_TRN.Value:=ExtraerFecha(Date);
           dmInventario.tblInventarioProdCANTIDAD.Value:=
           dmInventario.tblInventarioProdCANTIDAD.Value + dmInventario.tblAlquilerDetCANTIDAD.Value;
           GlbSalvarQuery(dmInventario.tblInventarioProd);
           dmInventario.tblInventarioProd.Close;
           dmInventario.tblInventarioProd.Params[0].Value:=glbCia_Key;
           dmInventario.tblInventarioProd.Open;
         end;
        end;
      end;
    end;
  end;
end;

procedure TfrmProcVentaRapidaByM.tablaPropietarioBeforePost(
  DataSet: TDataSet);
  var  xx:smallint;
begin
  xx:=0;
end;

procedure TfrmProcVentaRapidaByM.Lavanderia1Click(Sender: TObject);
begin
  frmLavanderia:=TfrmLavanderia.Create(nil);
  try
    frmLavanderia.Caption:='Lavanderia';
    frmLavanderia.tripoTrn := 1;
    frmLavanderia.tipoOpe := 2;
    frmLavanderia.Showmodal;
  finally
  frmLavanderia.Free;
  frmLavanderia:=Nil;
  end;
end;

procedure TfrmProcVentaRapidaByM.LavanderiaEntrada1Click(Sender: TObject);
begin
  frmLavanderia:=TfrmLavanderia.Create(Nil);
  try
    frmLavanderia.Caption:='Lavanderia';
    frmLavanderia.tripoTrn := 1;
    frmLavanderia.tipoOpe := 2;
    frmLavanderia.Showmodal;
  finally
  frmLavanderia.Free;
  frmLavanderia:=Nil;
  end;
end;

procedure TfrmProcVentaRapidaByM.Costura1Click(Sender: TObject);
begin
  frmLavanderia:=TfrmLavanderia.Create(nil);
  try
    frmLavanderia.Caption:='Costura';
    frmLavanderia.tripoTrn := 1;
    frmLavanderia.tipoOpe := 3;
    frmLavanderia.Showmodal;
  finally
  frmLavanderia.Free;
  frmLavanderia:=Nil;
  end;
end;

procedure TfrmProcVentaRapidaByM.CosturaEntrada1Click(Sender: TObject);
begin
  frmLavanderia:=TfrmLavanderia.Create(nil);
  try
    frmLavanderia.Caption:='Costura';
    frmLavanderia.tripoTrn := 1;
    frmLavanderia.tipoOpe := 3;
    frmLavanderia.Showmodal;
  finally
  frmLavanderia.Free;
  frmLavanderia:=Nil;
  end;
end;

end.
