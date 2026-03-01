unit UProcVentaRapida;
//UFormConsignacion

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, RXDBCtrl, DBCtrls,
  Printers, DB, Mask, RxMemDS, EditNew, IBCustomDataSet, IBQuery, WinSkinData, Menus,
  ShellApi, RXCtrls, IBStoredProc, IBSQL, RxLookup, RXSpin, OleServer,
  RxVerInf, RxGIF, ExcelXP, comObj, rxToolEdit, RxDBComb, IBTable, ComCtrls;

type
  TfrmProcVentaRapida = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    rxVentaXXX: TRxMemoryData;
    rxVentaXXXSerie: TIntegerField;
    rxVentaXXXFecha: TDateTimeField;
    rxVentaXXXCant: TFloatField;
    rxVentaXXXPrecio: TCurrencyField;
    rxVentaXXXMontoBruto: TCurrencyField;
    rxVentaXXXDescripcion: TStringField;
    rxVentaXXXDevolucion: TCurrencyField;
    rxVentaXXXMontoNeto: TCurrencyField;
    rxVentaXXXCodUsuario: TIntegerField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    dstblPOSVentasMast: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBText1: TDBText;
    Label4: TLabel;
    RxDBGrid1: TRxDBGrid;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    Label6: TLabel;
    rxVentaXXXCodArticulo: TIntegerField;
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
    rxVentaXXXNumeroRecibo: TIntegerField;
    Label11: TLabel;
    Label12: TLabel;
    rxVentaXXXCodTexto: TStringField;
    rxVentaXXXNCF: TStringField;
    NCFSinValorFiscal1: TMenuItem;
    CheckBox1: TCheckBox;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    Shape4: TShape;
    rxVentaXXXNumeroTrn: TIntegerField;
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
    rxVentaXXXporc_desc: TFloatField;
    rxVentaXXXItbi: TFloatField;
    ibStpActualizaInvProd: TIBStoredProc;
    BitBtn9: TBitBtn;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    rxVentaXXXMontoDescuento: TFloatField;
    Totales: TRxMemoryData;
    Totalesmontodesc: TFloatField;
    Totalestotalneto: TFloatField;
    Totalesmontorecibido: TFloatField;
    Totalesdevolucion: TFloatField;
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
    rxVentaXXXSerieProd: TStringField;
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
    rxVentaXXXNumeroFactura: TIntegerField;
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
    rxVentaXXXInvetariar: TSmallintField;
    tblProductoSerie: TIBDataSet;
    tblProductoSerieCODIGO: TIntegerField;
    tblProductoSerieSERIE: TIBStringField;
    tblProductoSerieSTATUS: TIBStringField;
    qryInventarioCODIGO: TIntegerField;
    rxVentaXXXloteNum: TStringField;
    ibstpUpdateLote: TIBStoredProc;
    qryProductosPAGA_ITBI: TSmallintField;
    rxVentaXXXMontoItbisenPrecio: TCurrencyField;
    rxVentaXXXReferencia: TStringField;
    ImprimirLabel1: TMenuItem;
    NoGenerarNCF1: TMenuItem;
    Label21: TLabel;
    rxSolDatosctencfDescripcion: TStringField;
    BitBtn16: TBitBtn;
    ibstpProcSecuencia: TIBStoredProc;
    rxVentaXXXNumeroDoc: TIntegerField;
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
    rxVentaXXXTipoUnidad: TIntegerField;
    qryInventarioPRECIO_TIPO_UNIDAD: TFloatField;
    rxqryInvTipoUnidad: TIntegerField;
    qryInventarioTIPO_UNIDAD: TIntegerField;
    rxVentaXXXDescUnidadMedida: TStringField;
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
    dsrxVenta: TDataSource;
    ConsultaGeneral1: TMenuItem;
    BitBtn17: TBitBtn;
    rxPreventa: TRxMemoryData;
    rxPreventaSerie: TIntegerField;
    rxPreventaNumero: TIntegerField;
    ibsqlDeletePreventaDet: TIBSQL;
    ibsqlDeletePreventaMaster: TIBSQL;
    rxVentaXXXItbisExento: TSmallintField;
    rxVentaXXXTipoVenta: TIntegerField;
    SkinData1: TSkinData;
    Label26: TLabel;
    SpeedButton1: TSpeedButton;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    panelDescripcionServ: TPanel;
    Label27: TLabel;
    DBMemo1: TDBMemo;
    rxVentaXXXDescripcionEspecial: TMemoField;
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
    rxVentaXXXSerieOriginal: TIntegerField;
    rxVentaXXXNumeroTrnOriginal: TIntegerField;
    rxVentaXXXStatus: TStringField;
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
    rxVentaXXXNumeroCotiza: TIntegerField;
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
    rxVentaXXXMoneda: TStringField;
    TotalesMoneda: TStringField;
    lblTasa: TLabel;
    rxVentaXXXMonedaBase: TStringField;
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
    rxVentaXXXRutaImagen: TStringField;
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
    rxVentaXXXCostoProducto: TCurrencyField;
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
    rxVentaXXXglbcodVendedor: TIntegerField;
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
    rxVentaXXXPorcDescItem: TCurrencyField;
    TotalesMontoDescItems: TCurrencyField;
    rxVentaXXXMontoDescItem: TCurrencyField;
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
    rxVentaXXXRecargo: TCurrencyField;
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
    rxVentaXXXMontoTranspItbis: TCurrencyField;
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
    rxVentaXXXMontoItbisRecargo: TCurrencyField;
    TotalesMontoITBISRecargo: TCurrencyField;
    rxVentaXXXMontoDesGlobal: TCurrencyField;
    rxVentaXXXIDTasaITBIS: TIntegerField;
    ibStpInsertCotizaDet: TIBStoredProc;
    BitBtn27: TBitBtn;
    BitBtn28: TBitBtn;
    rxVentaXXXMontoItbRecItmConDesc: TCurrencyField;
    TotalesMontoItbRecItmConDesc: TCurrencyField;
    tblnif_ctrl: TIBDataSet;
    tblnif_ctrlNUMERO_TRN: TIntegerField;
    tblnif_ctrlNIF: TIBStringField;
    tblnif_ctrlFECHA_IN: TDateTimeField;
    tblnif_ctrlFECHA_UPDATE: TDateTimeField;
    tblnif_ctrlSTATUS: TIBStringField;
    ConciliarNIF1: TMenuItem;
    TotalesMontoDescGlbItbis: TCurrencyField;
    rxVentaXXXMontoDescGlbDist: TCurrencyField;
    CancelarTicket1: TMenuItem;
    imbBarcode: TImage;
    rxVentaXXXmonto_tasa: TCurrencyField;
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
    rxVentaXXXCantPax: TIntegerField;
    BitBtn29: TBitBtn;
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
    btnPagoExacto: TBitBtn;
    chkNoLeyPropina: TCheckBox;
    qryCheckDetVta: TIBQuery;
    RxDBLookupCombo5: TRxDBLookupCombo;
    dsqryPrecioUnidadSurt: TDataSource;
    ProductName: TLabel;
    Version: TLabel;
    BuscarRNCDGII1: TMenuItem;
    qryTotales: TIBQuery;
    qryValoresVta: TIBQuery;
    qryValoresVtaSERIE: TIntegerField;
    qryValoresVtaNUMERO: TIntegerField;
    qryValoresVtaCODIGO_USUARIO: TIntegerField;
    qryValoresVtaFECHA: TDateTimeField;
    qryValoresVtaCANTIDAD: TFloatField;
    qryValoresVtaMONTO_TOTAL_BRUTO: TFloatField;
    qryValoresVtaTIPO_VENTA: TSmallintField;
    qryValoresVtaSTATUS_DET: TIBStringField;
    qryValoresVtaCANT_VIAJES: TFloatField;
    qryValoresVtaPRECIO: TFloatField;
    qryValoresVtaDESCUENTO: TFloatField;
    qryValoresVtaMONTODESCITEM: TFloatField;
    qryValoresVtaITBIS: TFloatField;
    qryValoresVtaMONTOBRUTO: TFloatField;
    qryValoresVtaPRECIOSUM: TFloatField;
    qryValoresVtaMONTORECITBISCONDESC: TFloatField;
    qryValoresVtaMONTORECITBIS: TFloatField;
    qryValoresVtaMONTODESCGLBDIST: TFloatField;
    qryValoresVtaMONTOITBISRECARGO: TFloatField;
    qryValoresVtaCODIGOPROD: TIntegerField;
    qryValoresVtaMONTOITBRECITMCONDESC: TFloatField;
    qryValoresVtaRECARGO_DET: TFloatField;
    qryValoresVtaMONTODESCADICIONAL: TFloatField;
    qryValoresVtaPORCDESADICIONAL: TFloatField;
    qryValoresVtaTIPONCFIFISCAL: TSmallintField;
    qryValoresVtaPROPINALEY: TSmallintField;
    qryValoresVtaMONTOPROPINA: TFloatField;
    qryValoresVtaNETO: TFloatField;
    qryValoresVtaPORC_DESC_ITEM: TFloatField;
    qryValoresVtaX1: TFloatField;
    qryValoresVtaX2: TFloatField;
    qryValoresVtaX3: TFloatField;
    qryValoresVtaX4_MONTODESCADICIONAL: TFloatField;
    tblRecoverMater: TIBDataSet;
    tblRecoverMaterNUMERO: TIntegerField;
    tblRecoverMaterFECHA: TDateTimeField;
    tblRecoverMaterSTATUS: TIBStringField;
    tblRecoverMaterMONTO_TOTAL_BRUTO: TFloatField;
    tblRecoverMaterCODIGO_USUARIO: TIntegerField;
    tblRecoverMaterMONTO_RECARGO: TFloatField;
    tblRecoverMaterPORCDESADICIONAL: TFloatField;
    tblRecoverMaterPROPINALEY: TSmallintField;
    tblRecoverMaterTIPONCFIFISCAL: TSmallintField;
    tblRecoverMaterPROPINA: TFloatField;
    IBDataSet1: TIBDataSet;
    rxVenta: TIBDataSet;
    rxVentaSERIE: TIntegerField;
    rxVentaNUMERO: TIntegerField;
    rxVentaFECHA: TDateTimeField;
    rxVentaCANT: TFloatField;
    rxVentaPRECIO: TFloatField;
    rxVentaMONTOBRUTO: TFloatField;
    rxVentaDESCRIPCION: TIBStringField;
    rxVentaDEVOLUCION: TFloatField;
    rxVentaMONTONETO: TFloatField;
    rxVentaCODUSUARIO: TIntegerField;
    rxVentaCODARTICULO: TIntegerField;
    rxVentaNUMERORECIBO: TIntegerField;
    rxVentaCODTEXTO: TIBStringField;
    rxVentaNCF: TIBStringField;
    rxVentaNUMEROTRN: TIntegerField;
    rxVentaPORC_DESC: TFloatField;
    rxVentaITBI: TFloatField;
    rxVentaMONTODESCUENTO: TFloatField;
    rxVentaSERIEPROD: TIBStringField;
    rxVentaNUMEROFACTURA: TIntegerField;
    rxVentaINVETARIAR: TSmallintField;
    rxVentaLOTENUM: TIBStringField;
    rxVentaMONTOITBISENPRECIO: TFloatField;
    rxVentaREFERENCIA: TIBStringField;
    rxVentaNUMERODOC: TIntegerField;
    rxVentaTIPOUNIDAD: TIntegerField;
    rxVentaDESCUNIDADMEDIDA: TIBStringField;
    rxVentaITBISEXENTO: TSmallintField;
    rxVentaTIPOVENTA: TIntegerField;
    rxVentaDESCRIPCIONESPECIAL: TMemoField;
    rxVentaMONTODESGASTOADMIN: TFloatField;
    rxVentaMONTODESCITBISGASTOSADMIN: TFloatField;
    rxVentaMONTODESCTRANSP: TFloatField;
    rxVentaMONTODESCDIRTECNICA: TFloatField;
    rxVentaMONTODESCITBISDIRTEC: TFloatField;
    rxVentaMONTODESCIMPREVISTO: TFloatField;
    rxVentaMONTODESCITBISIMPREVISTO: TFloatField;
    rxVentaSERIEORIGINAL: TIntegerField;
    rxVentaNUMEROTRNORIGINAL: TIntegerField;
    rxVentaNUMEROCOTIZA: TIntegerField;
    rxVentaMONEDA: TIBStringField;
    rxVentaMONEDABASE: TIBStringField;
    rxVentaRUTAIMAGEN: TIBStringField;
    rxVentaCOSTOPRODUCTO: TFloatField;
    rxVentaGLBCODVENDEDOR: TIntegerField;
    rxVentaPORCDESCITEM: TFloatField;
    rxVentaMONTODESCITEM: TFloatField;
    rxVentaRECARGO: TFloatField;
    rxVentaMONTOTRANSPITBIS: TFloatField;
    rxVentaMONTOITBISRECARGO: TFloatField;
    rxVentaMONTODESGLOBAL: TFloatField;
    rxVentaIDTASAITBIS: TIntegerField;
    rxVentaMONTOITBRECITMCONDESC: TFloatField;
    rxVentaMONTODESCGLBDIST: TFloatField;
    rxVentaMONTO_TASA: TFloatField;
    rxVentaCANTPAX: TIntegerField;
    rxVentaFECHA_IN: TDateTimeField;
    rxVentaCOD_USUARIO: TIntegerField;
    rxVentaSTATUS: TIBStringField;
    DBStatusLabel2: TDBStatusLabel;
    procedure BitBtn4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtCodigoChange(Sender: TObject);
    procedure edtCodigoExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure rxVentaXXXAfterPost(DataSet: TDataSet);
    procedure Edit1Exit(Sender: TObject);
    procedure edtCodigoEnter(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
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
    procedure rxVentaXXXBeforeEdit(DataSet: TDataSet);
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
    procedure rxVentaXXXAfterClose(DataSet: TDataSet);
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
    procedure BitBtn29Click(Sender: TObject);
    procedure btnPagoExactoClick(Sender: TObject);
    procedure DBEdit9Change(Sender: TObject);
    procedure DBEdit10Change(Sender: TObject);
    procedure chkNoLeyPropinaClick(Sender: TObject);
    procedure RxDBLookupCombo5Change(Sender: TObject);
    procedure RxDBLookupCombo5Enter(Sender: TObject);
    procedure ReImprimeNCR1Click(Sender: TObject);
    procedure BuscarRNCDGII1Click(Sender: TObject);
    procedure tblRecoverMaterAfterScroll(DataSet: TDataSet);
    procedure rxVentaAfterClose(DataSet: TDataSet);
    procedure rxVentaAfterScroll(DataSet: TDataSet);
    procedure rxVentaBeforeInsert(DataSet: TDataSet);
    procedure rxVentaBeforePost(DataSet: TDataSet);

  private
    procedure ProcMostrarVersion;
    procedure AbrirUnidades;
    procedure ActivarBotonesEnModifica;
    procedure CargarDatosAModificar;
    procedure SetMontoNotaCredito;
    procedure CalcularDescIndirecto;
    procedure ProcesaNuevo;
    procedure InsertarDet(numero : Integer);
    procedure InsertarCotizacionDet(numero : Integer);
    procedure InsertarCotizacionDetUpd(numero : Integer;serie:Integer);
    //movido a UDatModCalculos = dmCalculos

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
    procedure Exito_ActDetalleRxVenta;
    procedure Exito_ProcActualizaRcverMast;

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

    Procedure AbrirDatosParaTicket(
              CheckBox1_Checked:Boolean;
              rdgCredito_Checked:boolean;
              edtCodCte_Text:String;
              EditN1_ValueInteger:integer;
              DateTimePicker1_Date:TDateTime);

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
    procedure NotificaErrorByEmail(sms:string);
    procedure Exito_ProcUpdatePosVentaDetDesc;
    procedure Exito_ProcIniPosTotales;
  public
    NoTieneCredito :  boolean;
    NumTrnServ : integer;
    NumTrnServAlq : integer;
    sumarDatos  : Boolean;
    AbortarPostServTaller : boolean;
    canCloseAlquiler: boolean;
    NumTicketFFood: integer;
    //tblRegServicioMasterNUM_TRNVENTA
    Function VerificaLimiteCredito(codigocte:integer;MontoVenta:Real):Boolean;
    procedure AsignaNCFCFinal;
    procedure ActFastFoodTicket(numTicket:Integer);
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
  StatusImpFiscal:Boolean;
  _NumeroCotiza : Integer;
    esContado : boolean;
  numerodocReimp : Integer;
  NumeroTrn, NumeroRecibo : Integer;
  _abortar, EsBrowsing, EsEditando : Boolean;
  LlenandoDatos : Boolean;
  precioSum : Currency;
  procCalc,EsProdVencido : Boolean;
  _ulttrnImp : string;
 pesoProd: String;
 HayDescNivelItem, entraDessGlb, EsReimp, esCargaDatosFFood : boolean;
 numRecoverMaster : integer;


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
  URepComprobanteReimp, UQckCotiza8_5_F_1ByMPrefact, UQckFactServ8_5BB,
  UQckFactServ8_5Ayaco, URepComprobanteDevol_3Pulg, UDatModFastFood,
  URepReimpFastFoodPOS, URepReimpTicketSurtidora, UBuscarRazonSocialDBDgii,
  UDatModDGII;

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

   if dmVentas.tblPOSTotales.State = dsbrowse then dmVentas.tblPOSTotales.Edit;
      dmVentas.tblPOStotalesCodCliente.Value:= codCte;

   dmVentas.tblPOStotalesNombreCliente.Value := qryClienteNOMBRE_CTE.Value;
   dmVentas.tblPOStotalesDireccion.Value     := qryClienteDIRECCION_CONT.Value;
   dmVentas.tblPOStotalesTelefono.Value      := qryClienteTELEF_CONTACTO.Value;
   dmVentas.tblPOStotalesCodCliente.Value    := qryClienteCODIGO_CTE.Value;
   dmVentas.tblPOStotalesRNC_NUMERO.Value    := qryClienteRNC_NUMERO.Value;
   if (Not qryClienteCANT_DIAS_CREDITO.IsNull) And (qryClienteCANT_DIAS_CREDITO.Value > 0) Then
      dmVentas.tblPOStotalesFechaVence.Value    := GlbFechaTrnDiaria + qryClienteCANT_DIAS_CREDITO.Value
   else
   dmVentas.tblPOStotalesFechaVence.Value    := GlbFechaTrnDiaria + 15;//Default
   if not rxVentaNUMERO.IsNull then
   dmVentas.tblPOSTotalesNumero.Value:=rxVentaNUMERO.Value
   else
   GlbSalvarQuery(dmVentas.tblPOStotales);
       
   rxSolDatoscte.EmptyTable;

   if rxSolDatoscte.State In [dsInactive] then
   rxSolDatoscte.Open;

    //if rxSolDatoscte.State In [dsBrowse] then
    if (rxSolDatoscte.RecordCount = 0) Or (rxSolDatoscteNombre.IsNull) then
    begin
      //if tablaPropietarioCodigoPropietario.value > 0 then
      //begin
        //rxSolDatoscte.Close;
        //rxSolDatoscte.Open;
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

procedure TfrmProcVentaRapida.BitBtn4Click(Sender: TObject);
var
  serie_asignadoncf : integer;
  valorNCF : String;
  showNcfwindows : Boolean;
  genNcf : Boolean;
  flag : Boolean;
  pulgadaInc : Real;
begin
  showNcfwindows:=false;
  esContado:=True;
  BitBtn4.Enabled:=False;
  if (dmVentas.tblPOStotalesdevolucion.Value > 2000) then
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

  if (dmVentas.tblPOStotalesSubTotal.Value <= 0) then
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
    if dmVentas.tblPOStotalesTipoNCF.IsNull then
    begin
      MessageDlg('Favor indicar tipo comprobante', mtWarning, [mbOk], 0);
      BitBtn4.Enabled:= True;
      Exit;
    end;
    if ((tablaPropietario.RecordCount = 0) Or (tablaPropietarioCodigoPropietario.Value = 0)
     Or (tablaPropietarioCodigoPropietario.IsNull)) And
        (dmVentas.tblPOSTotalesTipoNCFIFiscal.Value In [1,4,5]) then
    begin
      MessageDlg('Favor asignar cliente', mtInformation, [mbOk], 0);
      BitBtn4.Enabled:= True;
      Exit;
    end;
  end;

  if (dmVentas.tblPOSTotalesTipoNCFIFiscal.Value < 0) then
  begin
    MessageDlg('Verifique tipo NCF', mtError, [mbOk], 0);
    BitBtn4.Enabled:= True;
    Exit;
  end;
  AbortarPostServTaller:=False;
  if (GlbActivaIFiscal = 1 ) then 
  begin
    if ((tablaPropietario.RecordCount = 0) Or (tablaPropietarioCodigoPropietario.Value = 0)) And
        (dmVentas.tblPOSTotalesTipoNCFIFiscal.Value In [1,4,5]) then
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
    {ProcesaEstadoImpresora;
    if (Length(GlbStatusFiscalError) > 0) And (UpperCase(GlbStatusFiscalError) <> 'READY') then
    begin
      MessageDlg('Estatus impresora fiscal: "'+GlbStatusFiscalError+'", verifique.', mtError, [mbOk], 0);
      Exit;
    end;
    if Not GLBIFiscalOnline then
    begin
       MessageDlg('Impresora no está en linea, verifique. '+GlbStatusFiscalError, mtError, [mbok], 0);
       Exit;
    end;}
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
  //if CheckBox4.Checked then
  if dmVentas.tblPOSTotalesMontoNCRAplicado.Value > 0 then
  DescargaNotaCredito;

  //if CheckBox1.Checked then
  //begin
    frmSelNCF:=TfrmSelNCF.Create(Self);
    try
      if Not EsDevolucion then
      begin
        if RxDBLookupCombo3.Visible then
           dmFactura.ibQryViewNCF.Locate('TIPO_CF', dmVentas.tblPOStotalesTipoNCF.Value,[])
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

           if dmVentas.tblPOStotalesTipoNCF.IsNull then
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
          dmFactura.ibQryViewNCF.Locate('TIPO_CF',dmVentas.tblPOStotalesTipoNCF.Value,[]);
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

     dmVentas.tblPOStotalesTipoNCF.Value;
     dmVentas.tblPOStotalesTipoNCFIFiscal.Value;
     dmFactura.ibQryViewNCFTIPO_NCF_IFISCAL.Value;
     if showNcfwindows then
     begin
       if dmFactura.ibQryViewNCF.Locate('TIPO_CF;tipo_ncf_ifiscal',
       VarArrayOf([dmVentas.tblPOStotalesTipoNCF.Value,dmVentas.tblPOStotalesTipoNCFIFiscal.Value]), []) then
       if (GlbNCFConfFinal = 0) And (dmVentas.tblPOStotalesTipoNCF.IsNull) then
       begin
         if frmSelNCF.ShowModal = mrok then
         genNcf:= True
         else
         begin
           genNcf:= False;
           dmVentas.tblPOStotales.Edit;
           dmVentas.tblPOStotalesTipoNCF.AsVariant:= null;
           dmVentas.tblPOStotalesTipoNCFIFiscal.AsVariant:= null;
           if not rxVentaNUMERO.IsNull then
           dmVentas.tblPOSTotalesNumero.Value:=rxVentaNUMERO.Value
           else
           GlbSalvarQuery(dmVentas.tblPOStotales);
         end;
       end else genNcf:= true;
     end else
     if Not showNcfwindows And (GlbActivaIFiscal = 0) then
     begin
       if RxDBLookupCombo3.Visible then
       dmFactura.ibQryViewNCF.Locate('TIPO_CF',dmVentas.tblPOStotalesTipoNCF.Value,[]);

       if frmSelNCF.ShowModal = mrok then
       begin
         genNcf:= True;
         if dmVentas.tblPOSTotales.State = dsBrowse then
         begin
           dmVentas.tblPOStotales.Edit;
           dmVentas.tblPOStotalesTipoNCF.Value := dmFactura.ibQryViewNCFTIPO_CF.Value;
           dmVentas.tblPOStotalesTipoNCFIFiscal.Value := dmFactura.ibQryViewNCFTIPO_NCF_IFISCAL.Value;
    if not rxVentaNUMERO.IsNull then
    dmVentas.tblPOSTotalesNumero.Value:=rxVentaNUMERO.Value
    else

           GlbSalvarQuery(dmVentas.tblPOStotales);
         end;
       end else
       begin
         genNcf:= False;
         dmVentas.tblPOStotales.Edit;
         dmVentas.tblPOStotalesTipoNCF.AsVariant:= null;
         dmVentas.tblPOStotalesTipoNCFIFiscal.AsVariant:= null;
    if not rxVentaNUMERO.IsNull then
    dmVentas.tblPOSTotalesNumero.Value:=rxVentaNUMERO.Value
    else 
         
         GlbSalvarQuery(dmVentas.tblPOStotales);
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
         frmAsignarNCFVenta.IBDataSet1MONTO.Value      := dmVentas.tblPOSTotalestotalneto.Value; //StrToFloat(EditN1.Text);

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
         if dmVentas.tblPOSTotales.State = dsBrowse then
         dmVentas.tblPOSTotales.Edit;

         if dmVentas.tblPOSTotales.State In [dsInsert, dsEdit] then
         begin
           dmVentas.tblPOStotales.Edit;
           dmVentas.tblPOStotalesncf_numero.Value := valorNCF;
           dmVentas.tblPOStotalesqrLabelNcfDesc.Value:=GlbDescNCF;
           //GlbDescNCF:='';
    if not rxVentaNUMERO.IsNull then
    dmVentas.tblPOSTotalesNumero.Value:=rxVentaNUMERO.Value
    else 

           GlbSalvarQuery(dmVentas.tblPOStotales);
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
  //end;

  //ibstpProcSecuencia.Params[0].Value := out
  //ibstpProcSecuencia.Params[1].Value :=
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

  if not dmVentas.tblPOSTotalesMoneda.isNull then
  ipStpInsertVentMast.Params[7].Value    := dmVentas.tblPOSTotalesMoneda.Value
  else
  ipStpInsertVentMast.Params[7].Value    := '1';
  ipStpInsertVentMast.Params[8].Value    := dmVentas.tblPOSTotalestotalneto.Value; //EditN1.Text;
  ipStpInsertVentMast.Params[9].Value    := 'A';
  ipStpInsertVentMast.Params[10].Value   := Now;
  ipStpInsertVentMast.Params[11].Value   := Null;
  ipStpInsertVentMast.Params[12].Value   := Null;
  ipStpInsertVentMast.Params[13].Value   := Null;
  ipStpInsertVentMast.Params[14].Value   := Null;
  ipStpInsertVentMast.Params[15].Value   := ibstpProcSecuencia.Params[0].Value;

  ipStpInsertVentMast.Params[17].Value   := dmVentas.tblPOStotalesSubTotal.Value;
  ipStpInsertVentMast.Params[18].Value   := dmVentas.tblPOStotalesPorcDesAdicional.Value;
  if Abs(dmVentas.tblPOStotalesMontoDescAdicional.Value) > 0 then
  ipStpInsertVentMast.Params[19].Value   := dmVentas.tblPOStotalesMontoDescAdicional.Value
  else
  ipStpInsertVentMast.Params[19].Value   := dmVentas.tblPOStotalesMontoDescItems.Value;
  ipStpInsertVentMast.Params[20].Value   := dmVentas.tblPOStotalesmontorecibido.Value;
  ipStpInsertVentMast.Params[21].Value   := dmVentas.tblPOStotalesdevolucion.Value;
  ipStpInsertVentMast.Params[22].Value:= dmVentas.tblPOStotalesitbis.Value;
  ipStpInsertVentMast.Params[23].Value:= 0;//chequear para financiamiento
  ipStpInsertVentMast.Params[24].Value:= edtObservacion.Text;
  ipStpInsertVentMast.Params[25].Value:= dmVentas.tblPOSTotalesMONTODESCGASTOSADMIN.Value;
  ipStpInsertVentMast.Params[26].Value:= dmVentas.tblPOStotalesMontoDescItbisGastosAdmin.Value;
  ipStpInsertVentMast.Params[27].Value:= dmVentas.tblPOStotalesMontoDescTransp.Value;
  ipStpInsertVentMast.Params[28].Value:= dmVentas.tblPOStotalesMontoDescDirtecnica.Value;
  ipStpInsertVentMast.Params[29].Value:= dmVentas.tblPOStotalesMontoDescItbisDirTecnica.Value;
  ipStpInsertVentMast.Params[30].Value:= dmVentas.tblPOStotalesMontoDescImprevisto.Value;
  ipStpInsertVentMast.Params[31].Value:= dmVentas.tblPOStotalesMontoDescItbisImprevisto.Value;
  ipStpInsertVentMast.Params[32].Value:= dmVentas.tblPOStotalesComentario.Value;
  ipStpInsertVentMast.Params[33].Value:= rxVentaNumeroCotiza.Value;
  ipStpInsertVentMast.Params[34].Value:= dmVentas.tblPOStotalesReferenciaCte.Value;
  ipStpInsertVentMast.Params[35].Value:= dmVentas.tblPOStotalesRecargo.Value;

  ipStpInsertVentMast.Params[37].Value:= dmVentas.tblPOStotalesMontoExoneraITBIS.Value;
  ipStpInsertVentMast.Params[38].Value:= 0;

  if Serie_asignadoncf > 0 then
  begin
    ipStpInsertVentMast.Params[16].Value  := Serie_asignadoncf;
      ipStpInsertVentMast.Params[36].Value:= dmVentas.tblPOStotalesTipoNCFIFiscal.Value;
  end else
  begin
    ipStpInsertVentMast.Params[16].Value:= Null;
    ipStpInsertVentMast.Params[36].Value:= Null;
  end;

  ipStpInsertVentMast.Params[39].Value:= dmVentas.tblPOStotalesPropina.Value;
  ipStpInsertVentMast.Params[40].Value:= GlbPorcPropina;
  ipStpInsertVentMast.Params[41].Value:= dmVentas.tblPOStotalesPropinaLegal.Value;

  ipStpInsertVentMast.ExecProc;
  numeroTrnVta:= ipStpInsertVentMast.Params[0].Value;

  if Not ipStpInsertVentMast.Transaction.InTransaction then
  ipStpInsertVentMast.Transaction.StartTransaction;
  try
    ipStpInsertVentMast.Transaction.CommitRetaining;
  except
  ipStpInsertVentMast.Transaction.RollbackRetaining;
  end;
  ActFastFoodTicket(NumTicketFFood);
  if (dmVentas.tblPOSTotalesTipoNCF.Value = '15') OR (dmVentas.tblPOStotalesTipoNCF.Value = '14') then
  begin
    updTipoRetencionVta.Params[0].Value:= 1;//LEY RETENCION GOBIERNO y ONG
    updTipoRetencionVta.Params[1].Value:= ipStpInsertVentMast.Params[0].Value;
    updTipoRetencionVta.ExecQuery;
    if Not updTipoRetencionVta.Transaction.InTransaction then
    updTipoRetencionVta.Transaction.StartTransaction;
    try
      updTipoRetencionVta.Transaction.CommitRetaining;
    except
    updTipoRetencionVta.Transaction.RollbackRetaining;
    end;
  end;
  if Assigned(frmRegServicioTaller) then
  UpdateServINFO(ipStpInsertVentMast.Params[0].Value);
  if Assigned(frmAlquiler) then
  UpdateServAlquiler(ipStpInsertVentMast.Params[0].Value);

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
  RxDBGrid1.DisableScroll;
  While Not rxVenta.Eof do
  begin
    InsertarDet(ipStpInsertVentMast.Params[0].Value);
    ibStpActualizaInvProd.Params[0].Value:= rxVentaCodArticulo.Value;
    if (GlbUsaPUnidadLevel = 0) then
    begin
      if (rxVentaTipoUnidad.Value = 3) Or (rxVentaTipoUnidad.Value = 0) then
      ibStpActualizaInvProd.Params[1].Value:= rxVentaCant.Value
      else
      begin
        ibStpActualizaInvProd.Params[1].Value:= rxVentaCant.Value * CantUnidad;
      end;
    end else
    ibStpActualizaInvProd.Params[1].Value:= rxVentaCant.Value * CantUnidad;
    
    if Not EsDevolucion then
    ibStpActualizaInvProd.Params[2].Value     := 0  //tipoTrn
    else ibStpActualizaInvProd.Params[2].Value:= 1; //ingresar al inventario
    ibStpActualizaInvProd.Params[3].Value     := 1; //porCodigo
    if (rxVentaInvetariar.Value <> 0) And (GlbCodDivInventario = 1 ) then
    ibStpActualizaInvProd.ExecProc;   //ctualiza inventario

    if (rxVentaTipoVenta.Value = 0) Or (rxVentaTipoVenta.IsNull ) then //Item de Venta
    begin
    try
    ActualizaInvAlmacen;//Actualiza Division Inventario
    except
    end;
    end;
    rxVenta.Next;
  end;
  rxVenta.First;

  //RxDBGrid2.DisableScroll;
  sumarDatos:=False;
  NumeroRecibo:=ipStpInsertVentMast.Params[0].Value;
  //RxDBGrid2.Visible:= False;
  //Temporal alcanzar el exito ini
  {  rxVenta.AutoCalcFields:=False;
  While not rxVenta.Eof do
  begin
    rxVenta.Edit;
    rxVentaNumeroRecibo.Value := ipStpInsertVentMast.Params[0].Value;
    rxVentaNumeroDoc.Value := ipStpInsertVentMast.Params[15].Value;
    rxVenta.Post;
    //WriteToLog('Post rxVenta - Line 1051');
    rxVenta.Next;
  end; }
  //Temporal alcanzar el exito end
  RxDBGrid1.EnableScroll;
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
  qryCheckDetVta.Close;
  qryCheckDetVta.Params[0].Value:= NumeroTrn;
  qryCheckDetVta.Open;
  qryCheckDetVta.Last;
  if (qryCheckDetVta.RecordCount = 0) then
  begin
    NotificaErrorByEmail('Transacción #'+IntToStr(NumeroTrn)+ ' no fue registrada en detalle, favor verificar #13'+
    '. Error critico.');
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
      Delay(2000);
      qryVerificaReciboPdte.Close;
      qryVerificaReciboPdte.Open;
      qryVerificaReciboPdte.Last;
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
        dmFactura.qryVentaFacturaDet.Last;
        dmFactura.qryVentaFacturaDet.First;
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
      if (GlBAyaco = 1) then
      begin
        qckFactServ8_5Ayaco:=TqckFactServ8_5Ayaco.Create(Nil);
        try
          qckFactServ8_5Ayaco.TPag.Caption:=
          IntToStr(qckFactServ8_5Ayaco.PageNumber);
          qckFactServ8_5Ayaco.xtipoVenta := TipoVenta;
          qckFactServ8_5Ayaco.valorNCF:= valorNCF;
          if (GlbImpReciboSinPreg = 1) then
            qckFactServ8_5Ayaco.Print
            else
            if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
            begin
              qckFactServ8_5Ayaco.PrinterSetup;
              qckFactServ8_5Ayaco.Print;
            end else
            qckFactServ8_5Ayaco.Preview;

            if (GlbImpReciboSinPreg = 0) then
            if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
            begin 
              qckFactServ8_5Ayaco.Preview;
            end;
        finally
        qckFactServ8_5Ayaco.Free;
        qckFactServ8_5Ayaco:=Nil;
        end;
      end else
      if (GlBBurgos = 1) then
      begin
        qckFactServ8_5BB:=TqckFactServ8_5BB.Create(Nil);
        try
          qckFactServ8_5BB.TPag.Caption:=
          IntToStr(qckFactServ8_5BB.PageNumber);
          qckFactServ8_5BB.xtipoVenta := TipoVenta;
          qckFactServ8_5BB.valorNCF:= valorNCF;
          if (GlbImpReciboSinPreg = 1) then
            qckFactServ8_5BB.Print
            else
            if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
            begin
              qckFactServ8_5BB.PrinterSetup;
              qckFactServ8_5BB.Print;
            end else
            qckFactServ8_5BB.Preview;

            if (GlbImpReciboSinPreg = 0) then
            if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
            begin 
              qckFactServ8_5BB.Preview;
            end;
        finally
        qckFactServ8_5BB.Free;
        qckFactServ8_5BB:=Nil;
        end;
      end else
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
    {RxDBGrid1.DataSource:= datasource3;
    dbtext1.DataField:='';
    dbtext1.DataSource:= datasource3;
    dbedit1.DataField:='';
    dbedit1.DataSource:= datasource3;
    dbedit2.DataField:='';
    dbedit2.DataSource:= datasource3;
    dbedit3.DataField:='';
    dbedit3.DataSource:= datasource3;}
    if (GlbUsaPUnidadLevel = 1 ) then
    begin
      TipoVenta:='CONTADO';
      if dmReportes.qryViewVentasMastForma_pago.AsInteger in [7,8] then
      TipoVenta := 'CREDITO'
      else
      if dmReportes.qryViewVentasMastForma_pago.value = 1 then
      TipoVenta := 'CONTADO';
      
      if (TipoVenta = 'CONTADO') then
      AbrirDatosParaTicket(false,false,dmReportes.qryViewVentasMastCODIGO_CTE.AsString,dmReportes.qryViewVentasMastNUMERO_DOC_PAGO.AsInteger,
      dmReportes.qryViewVentasMastFECHA.Value)
      else
      if (TipoVenta = 'CREDITO') then
      AbrirDatosParaTicket(false,true,dmReportes.qryViewVentasMastCODIGO_CTE.AsString,dmReportes.qryViewVentasMastNUMERO_FACTURA.AsInteger,
      dmReportes.qryViewVentasMastFECHA.Value);
      qckRepReciboReimpTicketSurtidora:=TqckRepReciboReimpTicketSurtidora.Create(Nil);
      try
        qckRepReciboReimpTicketSurtidora.strcopia :='';
        if GlbImpCodProducto = 0 then
        begin
          qckRepReciboReimpTicketSurtidora.qckRepComprobante.Height := 20;
          qckRepReciboReimpTicketSurtidora.QRLabel26.Enabled := False;
          //qckRepReciboReimpTicketSurtidora.QRDBText20.Enabled:= False;
        end;

        qckRepReciboReimpTicketSurtidora.ncfDesc := GlbDescNCF;
        if Length(edtObservacion.Text) > 0 then
        qckRepReciboReimpTicketSurtidora.nombreCteGenerico:=edtObservacion.Text;
        if (tablaPropietarioCodigoPropietario.value > 0) then
        begin
          qckRepReciboReimpTicketSurtidora.qrLabelRNC.Caption:='RNC-' + qryClienteRNC_NUMERO.Value;
          qckRepReciboReimpTicketSurtidora.nombreCteGenerico:= qryClienteNOMBRE_CTE.Value;
        end
        else qckRepReciboReimpTicketSurtidora.qrLabelRNC.Caption:='';
        qckRepReciboReimpTicketSurtidora.xtipoVenta := TipoVenta;
        qckRepReciboReimpTicketSurtidora.valorNCF   := valorNCF;
        pulgadaInc:=0.86;

        if rxVenta.RecordCount = 1 then
        qckRepReciboReimpTicketSurtidora.Page.Length:= 5
        else
        if rxVenta.RecordCount >= 2 then
        qckRepReciboReimpTicketSurtidora.Page.Length:= qckRepReciboReimpTicketSurtidora.Page.Length +
        (rxVenta.RecordCount - 1 ) * 0.25;

        flag:=true;
        qckRepReciboReimpTicketSurtidora.Prepare;
        rxventa.DisableControls;
        rxdbgrid1.Enabled:=False;
        if (rxventa.RecordCount > 1) or (qckRepReciboReimpTicketSurtidora.PageNumber > 1) then
        begin
          repeat
            begin
              if (qckRepReciboReimpTicketSurtidora.PageNumber > 1) then
              begin
                qckRepReciboReimpTicketSurtidora.Page.Length:=qckRepReciboReimpTicketSurtidora.Page.Length + 0.25;
                qckRepReciboReimpTicketSurtidora.Prepare;
                flag:=False;
              end else break;
            end;
          until flag = true;
        end;
        rxventa.EnableControls;
        rxdbgrid1.Enabled:=True;

        dmreportes.qryViewVentasMast.Close;
        dmreportes.qryViewVentasMast.Params[0].Value:= ipStpInsertVentMast.Params[0].Value;
        dmreportes.qryViewVentasMast.Open;

        //RxDBGrid1.DataSource:= dstblPOSTotales;
        //dbtext1.DataField:='Descripcion';
        //dbtext1.DataSource:= dstblPOSTotales;
        ///dbedit1.DataSource:= dstblPOSTotales;
        //dbedit1.DataField:='Cant';
        //dbedit2.DataSource:= dstblPOSTotales;
        //dbedit2.DataField:='Precio';
        //dbedit3.DataSource:= dstblPOSTotales;
        //dbedit3.DataField:='MontoBruto';
        //RxDBGrid1.Visible:=True;

        if (GlbImpReciboSinPreg = 1) and (GlbImprimeReciboFact = 1) then
        qckRepReciboReimpTicketSurtidora.Print
        else
        if MessageDlg('Imprimir?',mtInformation, [mbYes, mbNo], 0)=mryes then
        begin
          if (GlbImprimeReciboFact = 1) then
          begin
            qckRepReciboReimpTicketSurtidora.PrinterSetup;
            qckRepReciboReimpTicketSurtidora.Print;
          end;
        end else
        qckRepReciboReimpTicketSurtidora.Preview;
        reciboImpreso:=True;
      finally
      qckRepReciboReimpTicketSurtidora.Free;
      qckRepReciboReimpTicketSurtidora:=Nil;
      end;
    end else
    if GLBEsFastFood then
    begin
      TipoVenta:='CONTADO';
      if dmReportes.qryViewVentasMastForma_pago.AsInteger in [7,8] then
      TipoVenta := 'CREDITO'
      else
      if dmReportes.qryViewVentasMastForma_pago.value = 1 then
      TipoVenta := 'CONTADO';
      
      if (TipoVenta = 'CONTADO') then
      AbrirDatosParaTicket(false,false,dmReportes.qryViewVentasMastCODIGO_CTE.AsString,dmReportes.qryViewVentasMastNUMERO_DOC_PAGO.AsInteger,
      dmReportes.qryViewVentasMastFECHA.Value)
      else
      if (TipoVenta = 'CREDITO') then
      AbrirDatosParaTicket(false,true,dmReportes.qryViewVentasMastCODIGO_CTE.AsString,dmReportes.qryViewVentasMastNUMERO_FACTURA.AsInteger,
      dmReportes.qryViewVentasMastFECHA.Value);
      qckRepReciboReimpFFoodPOS:=TqckRepReciboReimpFFoodPOS.Create(Nil);
      try
        qckRepReciboReimpFFoodPOS.strcopia :='';
        if GlbImpCodProducto = 0 then
        begin
          qckRepReciboReimpFFoodPOS.qckRepComprobante.Height := 20;
          qckRepReciboReimpFFoodPOS.QRLabel26.Enabled := False;
          qckRepReciboReimpFFoodPOS.QRDBText20.Enabled:= False;
        end;

        qckRepReciboReimpFFoodPOS.ncfDesc := GlbDescNCF;
        if Length(edtObservacion.Text) > 0 then
        qckRepReciboReimpFFoodPOS.nombreCteGenerico:=edtObservacion.Text;
        if (tablaPropietarioCodigoPropietario.value > 0) then
        begin
          //qckRepReciboReimpFFoodPOS.qrLabelRNC.Caption:='RNC-' + qryClienteRNC_NUMERO.Value;
          //qckRepReciboReimpFFoodPOS.nombreCteGenerico:= qryClienteNOMBRE_CTE.Value;
        end;
        //else qckRepReciboReimpFFoodPOS.qrLabelRNC.Caption:='';
        qckRepReciboReimpFFoodPOS.xtipoVenta := TipoVenta;
        qckRepReciboReimpFFoodPOS.valorNCF   := valorNCF;
        pulgadaInc:=0.86;

        if dmFactura.qryVentaFacturaDet.RecordCount = 1 then
        qckRepReciboReimpFFoodPOS.Page.Length:= 5
        else
        if rxVenta.RecordCount >= 2 then
        qckRepReciboReimpFFoodPOS.Page.Length:= qckRepReciboReimpFFoodPOS.Page.Length +
        (rxVenta.RecordCount - 1 ) * 0.25;

        flag:=true;
        qckRepReciboReimpFFoodPOS.Prepare;
        rxventa.DisableControls;
        rxdbgrid1.Enabled:=False;
        if (rxventa.RecordCount > 1) or (qckRepReciboReimpFFoodPOS.PageNumber > 1) then
        begin
          repeat
            begin
              if (qckRepReciboReimpFFoodPOS.PageNumber > 1) then
              begin
                qckRepReciboReimpFFoodPOS.Page.Length:=qckRepReciboReimpFFoodPOS.Page.Length + 0.20;
                qckRepReciboReimpFFoodPOS.Prepare;
                flag:=False;
              end else break;
            end;
          until flag = true;
        end;
        rxventa.EnableControls;
        rxdbgrid1.Enabled:=True;

        dmreportes.qryViewVentasMast.Close;
        dmreportes.qryViewVentasMast.Params[0].Value:= ipStpInsertVentMast.Params[0].Value;
        dmreportes.qryViewVentasMast.Open;

{        RxDBGrid1.DataSource:= dstblPOSTotales;
        dbtext1.DataField:='Descripcion';
        dbtext1.DataSource:= dstblPOSTotales;
        dbedit1.DataSource:= dstblPOSTotales;
        dbedit1.DataField:='Cant';
        dbedit2.DataSource:= dstblPOSTotales;
        dbedit2.DataField:='Precio';
        dbedit3.DataSource:= dstblPOSTotales;
        dbedit3.DataField:='MontoBruto';}
        RxDBGrid1.Visible:=True;

        if (GlbImpReciboSinPreg = 1) and (GlbImprimeReciboFact = 1) then
        qckRepReciboReimpFFoodPOS.Print
        else
        if MessageDlg('Imprimir?',mtInformation, [mbYes, mbNo], 0)=mryes then
        begin
          if (GlbImprimeReciboFact = 1) then
          begin
            qckRepReciboReimpFFoodPOS.PrinterSetup;
            qckRepReciboReimpFFoodPOS.Print;
          end;
        end else
        qckRepReciboReimpFFoodPOS.Preview;
        reciboImpreso:=True;
      finally
      qckRepReciboReimpFFoodPOS.Free;
      qckRepReciboReimpFFoodPOS:=Nil;
      end;
      end else //Retail
      begin
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
        qckRepRecibo.xtipoVenta := TipoVenta;
        qckRepRecibo.valorNCF:= valorNCF;
        pulgadaInc:=0.86;

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

      dmreportes.qryViewVentasMast.Close;
      dmreportes.qryViewVentasMast.Params[0].Value:= ipStpInsertVentMast.Params[0].Value;
      dmreportes.qryViewVentasMast.Open;

{      RxDBGrid1.DataSource:= dstblPOSTotales;
      dbtext1.DataField:='Descripcion';
      dbtext1.DataSource:= dstblPOSTotales;
      dbedit1.DataSource:= dstblPOSTotales;
      dbedit1.DataField:='Cant';
      dbedit2.DataSource:= dstblPOSTotales;
      dbedit2.DataField:='Precio';
      dbedit3.DataSource:= dstblPOSTotales;
      dbedit3.DataField:='MontoBruto';}
      RxDBGrid1.Visible:=True;

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
    end
  end;
  //rxVenta.EmptyTable;
  if chkDisplay.Checked then
  Finalizardisplay;
  BitBtn1.Enabled:=True;
  BitBtn4.Enabled:=True;
  tablaPropietario.EmptyTable;
  tablaPropietario.Edit;
  tablaPropietarioCodigoPropietario.AsVariant := null;
  tablaPropietario.Post;

  edtCodigo.Text := '';
  BitBtn4.Enabled := False;

  if isShowing then
  BitBtn1.SetFocus;

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
  InactivaImprecibo    := False;
  label25.Font.Color   := clBlack;
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
  GlbAlreadyCld := False;
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

   label29.Top:= 413;
   dbTextMontoExoneraITBIS.Top := 410;
   label41.Visible := True;
   DBText15.Visible:= True;
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

procedure TfrmProcVentaRapida.ProcActUltTrn;
begin
  stpProcBuscarUltNum.Params[2].Value := glbCia_Key;
  stpProcBuscarUltNum.ExecProc;
  RxLabel1.Caption:='Ult. #Fact:'+ stpProcBuscarUltNum.params[1].AsString;
  RxLabel2.Caption:='Ult. #Trans:'+ stpProcBuscarUltNum.params[0].AsString;
end;

procedure TfrmProcVentaRapida.FormCreate(Sender: TObject);
begin
  HayDescNivelItem:= False;
  StatusImpFiscal:=False;
  if GlbUsaPUnidadLevel = 0 then
  begin
    DSQryPrecios.DataSet := QryPrecios;
    RxDBLookupCombo5.Visible:=False;
    RxDBLookupCombo5.Enabled:=False;
    RxDBLookupCombo5.SendToBack;
    cboxTipoUnidad.Visible:=True;
    cboxTipoUnidad.Enabled:=True;
    cboxTipoUnidad.TabOrder:=1;
  end else
  begin
    DSQryPrecios.DataSet := dmVentas.qryPrecioUnidadSurt;
    RxDBLookupCombo5.Visible:=True;
    RxDBLookupCombo5.Enabled:=True;
    RxDBLookupCombo5.BringToFront;
    cboxTipoUnidad.Visible:=False;
    cboxTipoUnidad.Enabled:=False;
    RxDBLookupCombo5.TabOrder:=1;
  end;
  //Ancho := 800;//1366;//1280; // Ancho del diseño
  //Alto  := 600;//768
  {  Height := Height * Screen.Height Div Alto;
   Width := Width * Screen.Width Div Ancho;
   ScaleBy(Screen.Width, Ancho);
  }
  //t sumarDatos:=true;
  tablaPropietario.Close;
  tablaPropietario.Open;
  NumTicketFFood:=-1;
  if (GLBEsFastFood) then
  begin
    btnPagoExacto.Visible := True;
    panelFastFood.Visible := True;
  end;
  if (UpperCase(GLBFormatoFactura) = 'BYMSERVICIOS') then
  begin
    cboxTipoUnidad.Visible:=False;
    Label24.Visible :=False;
    Label48.Visible :=true;
    DBEdit12.Visible:=true;
    BitBtn29.Visible:=True;
    BitBtn29.BringToFront;
  end else
  begin
    cboxTipoUnidad.Visible:=True;
    Label24.Visible := True;
    Label48.Visible := False;
    DBEdit12.Visible:= False;
    BitBtn29.Visible:= False;
    BitBtn29.SendToBack;
  end;
  canCloseAlquiler:=False;
  ProcActualizaMsg;
  //Cargar transacciones en caso de que haya existido algun issue
  recuperando := True;
  EsModificandoFactura := False;
  //ProcRecoverData(False);
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
    ProductName.Visible:= True;
    Version.Visible    := True;
    ProcMostrarVersion;
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

    //Application.ProcessMessages;

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
    //rxVenta.EmptyTable;
    rxVenta.Open;
    tablaPropietario.EmptyTable;
    //dmVentas.tblPOSTotales.EmptyTable;
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
    sqlAsignado := False;
    sumarDatos  := True;
    GlbImprimeReciboFact:= 1;
    InactivaImprecibo   := False;

    bitBtnEditarFact.Visible := False;

    AbrirUnidades;

    dmInventario.qryTipoUnidad.First;
    {dmventas.qryUnidadPLSurt.Close;
    dmventas.qryUnidadPLSurt.Open;
    dmventas.qryUnidadPLSurt.First;
    if GlbUsaPUnidadLevel = 1 then
    begin
      While Not dmventas.qryUnidadPLSurt.Eof Do
      begin
      cboxTipoUnidad.Items.Add(dmventas.qryUnidadPLSurtdescripcion.Value);
      dmventas.qryUnidadPLSurt.Next;
      end;
    end else
    begin}
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
    Label12.Caption:= dmUsuarios.qryEmpleadosNOMBRE.Value;

    Exito_ProcIniPosTotales;

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
    qryVence.Close;
    qryVence.Open;

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
      panelDescripcionServ.Visible:=False;
      While Not qryVence.Eof Do
      begin
        if qryVenceDIASVENCIDOS.Value > 0  then
        SecretPanel1.Lines.Add(qryVenceDESCRIPCION_PRODUCTO.Value+' - '+
        qryVenceDIASVENCIDOS.AsString);
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
    if (qryVerificaReciboPdteFORMA_PAGO.Value = 1) then //Contado
    ImprimeFiscalContado(qryVerificaReciboPdteNUMERO.Value);
  end;
end;

procedure TfrmProcVentaRapida.Exito_ProcIniPosTotales;
begin
  if rxVentaNUMERO.IsNull then exit;
  dmVentas.tblPOSTotales.Close;
  dmVentas.tblPOSTotales.Open;

  dmVentas.tblPOSTotales.Insert;
  if (GlbMonedaBase > 0) then
  dmVentas.tblPOSTotalesMoneda.Value   := IntToStr(GlbMonedaBase)
  else
  dmVentas.tblPOSTotalesMoneda.Value   := '1';
  dmVentas.tblPOSTotalesSubTotal.Value := 0;
  dmVentas.tblPOSTotalesitbis.Value    := 0;
  dmVentas.tblPOSTotalesmontodesc.Value:= 0;
  dmVentas.tblPOSTotalestotalneto.Value:= 0;
  dmVentas.tblPOSTotalesRecargo.Value  := 0;
  //TotalesMoneda.Value   :='1';
  dmVentas.tblPOSTotalesMontoNotaCredito.Value:=0;
  CheckBox4.Checked := False;
  dmVentas.tblPOSTotalesmontorecibido.Value :=0;
  dmVentas.tblPOSTotalesdevolucion.Value    :=0;
  if not rxVentaNUMERO.IsNull then
    dmVentas.tblPOSTotalesNumero.Value:=rxVentaNUMERO.Value
  else
  GlbSalvarQuery(dmVentas.tblPOStotales);
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
  if LectorCodBarra1.Checked then Exit;
  BuscandoPorDesc:=False;

  if (dmInventario.qryTipoUnidad.State = dsInactive) then
  AbrirUnidades;
  
  if (edtCodigo.Text = '') then Exit;

  GlbAlreadyCld := False;
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
      noExiste:=False;
    end else noExiste:= True;
  end else
  begin
    sqlAsignado    := False;
    BuscandoPorDesc:= True;
    AsignarSqlText('Descripcion', chr(39) + '%' + edtCodigo.Text +'%'+chr(39),'');
    if qryProductos.Locate('Descripcion', edtCodigo.Text, [loCaseInsensitive, loPartialKey]) then
    begin
      qryProdPorProveedor.Close;
      qryProdPorProveedor.Params[0].Value:= qryProductosCODIGO.Value;
      qryProdPorProveedor.Open;

      if dmInventario.qryTipoUnidad.state = dsInactive then
      AbrirUnidades;
      
      dmInventario.qryTipoUnidad.Locate('IDUNIDAD', qryProductosTipo_Unidad.value,[]);
      cboxTipoUnidad.Text:=dmInventario.qryTipoUnidadDescripcion.Value;
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
  if (edtCodigo.Text <> '') then
  GlbAlreadyCld:=False;
  //dmCalculos.esFeedback :=False;
  if (Pos('Cotización',label36.Caption) <= 0 )  then
  EsModificandoCotiza:=False;

  if LectorCodBarra1.Checked then
  begin
    //if Not sqlAsignado then
    pesoProd :='';
    if (GlbUsaBalanza = 1) then
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
    if Not Assigned(frmProcVentaRapida) Then
      if isShowing then
    edtCodigo.SetFocus;
    Exit;
  end;
  MontoItbisEnPrecio:=0;
  if (edtCodigo.Text = '') then Exit;
  Edit1.Text  := '';
  PrecioCambio:= False;
  //t exito if reciboImpreso then
  //t exito dmVentas.tblPOSTotales.EmptyTable;

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
      //t LlenarTipoUnidadBox(qryProductosTipo_Unidad.Value);
      if (qryProductosTipo_Unidad.value >0) or (Not qryProductosTipo_Unidad.IsNull) then
      begin
        dmInventario.qryTipoUnidad.Locate('IDUNIDAD',qryProductosTipo_Unidad.value,[]);
        cboxTipoUnidad.Text:=dmInventario.qryTipoUnidadDescripcion.value;
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
      qryProdPorProveedor.Close;
      qryProdPorProveedor.Params[0].Value:= qryProductosCODIGO.Value;
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
    Prod_existe:= True;
    if EsProdVencido then
    begin
      EsProdVencido:=False;
      if MessageDlg('Producto vencido, cancelar?',mtWarning,[mbyes, mbno],0)=mryes then
      begin
        edtCodigo.Text := '';
        edtCodigo.SetFocus;
        rxLabelVence.Visible:=false;
        Panel2.Visible:=False;
        Exit;
      end;
    end;
    qryInventario.Locate('CODIGO_TEXTO', edtCodigo.Text,[loCaseInsensitive]);

    if rxVenta.State = dsBrowse then
    begin
      //rxVenta.DisableControls;
      //rxVenta.SortOnFields('serie', false, false);
      //if (rxVenta.RecordCount > 0) then
      //begin
      //  rxVenta.Last;
      //  numero := rxVentaSerie.Value + 1;
      //end else numero := 1;
      //rxVenta.EnableControls;
      recuperando := False;
      //WriteToLog('Post rxVenta - Line 1812');
      rxVenta.Append;
      rxVentanumero.Value:= dmventas.tblPOSTotalesNUMERO.Value;
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
          if (GlbUsaescalaPrecio = 1) then
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

procedure TfrmProcVentaRapida.ProcSetNCFCliente;
begin
  if Not dmVentas.tblPOSTotalesTipoNCFIFiscal.IsNull then Exit;
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
            if dmVentas.tblPOSTotales.State = dsBrowse then
            dmVentas.tblPOSTotales.Edit;
            dmVentas.tblPOSTotalesTipoNCFIFiscal.Value := dmFactura.ibQryViewNCFTIPO_NCF_IFISCAL.Value;
            dmVentas.tblPOSTotalesTipoNCF.Value := dmFactura.ibQryViewNCFTIPO_CF.Value;
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
procedure TfrmProcVentaRapida.AsignaNCFCFinal;
begin
  if dmFactura.ibQryViewNCF.State = dsInactive then
  dmFactura.ibQryViewNCF.Open;
  if dmFactura.ibQryViewNCF.Locate('TIPO_CF', '02', []) then
    begin
      if dmVentas.tblPOSTotales.State = dsBrowse then
         dmVentas.tblPOSTotales.Edit;
      if (CheckBox1.Checked) then
      begin
        dmVentas.tblPOSTotalesTipoNCFIFiscal.Value := dmFactura.ibQryViewNCFTIPO_NCF_IFISCAL.Value;
        dmVentas.tblPOSTotalesTipoNCF.Value := dmFactura.ibQryViewNCFTIPO_CF.Value;
      end else if (GlbActivaIFiscal = 0) then
      begin
        dmVentas.tblPOSTotalesTipoNCFIFiscal.AsVariant := null;
        dmVentas.tblPOSTotalesTipoNCF.AsVariant := null;
      end;
    end;
end;
procedure TfrmProcVentaRapida.AsignaNCFCFinalX(TIPO_NCF_IFISCAL : integer);
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
    if dmVentas.tblPOSTotales.State = dsBrowse then
       dmVentas.tblPOSTotales.Edit;
    if (CheckBox1.Checked) then
    begin
      dmVentas.tblPOSTotalesTipoNCFIFiscal.Value := dmFactura.ibQryViewNCFTIPO_NCF_IFISCAL.Value;
      dmVentas.tblPOSTotalesTipoNCF.Value := dmFactura.ibQryViewNCFTIPO_CF.Value;
    end else if (GlbActivaIFiscal = 0) then
    begin
      dmVentas.tblPOSTotalesTipoNCFIFiscal.AsVariant := null;
      dmVentas.tblPOSTotalesTipoNCF.AsVariant := null;
    end;
  end;
end;

procedure TfrmProcVentaRapida.ProcesaNuevo;
var
  numero : Integer;
begin
  if numRecoverMaster = -1 then
  begin
    if dmVentas.tblPOSTotales.State = dsBrowse then
    dmVentas.tblPOSTotales.Close;

    dmVentas.tblPOSTotales.Params[0].Value:= numRecoverMaster;
    dmVentas.tblPOSTotales.Open;
    dmVentas.tblPOSTotales.First;
  end;
  if (dmVentas.tblPOSTotales.RecordCount = 0) then
  begin
    if not rxVentaNumero.IsNull then
    begin
      dmVentas.tblPOSTotales.Insert;
      dmVentas.tblPOSTotalesFECHA.Value:= ExtraerFecha(GlbFechaTrnDiaria);
      dmVentas.tblPOSTotalesNumero.Value:=numRecoverMaster;
      //dmVentas.tblPOSTotalesSTATUS.Value:='A';
      //dmVentas.tblPOSTotalesCIA_KEY.Value:= glbCia_Key;
      //dmVentas.tblPOSTotalesCODIGO_VENDEDOR.Value:=VarUsuarioGlb;
      //dmVentas.tblPOSTotalesFECHA_IN.Value:=now;
      //dmVentas.tblPOSTotalesIN_POR.Value:= strUserName;
      if not rxVentaNUMERO.IsNull then
      dmVentas.tblPOSTotalesNumero.Value:=rxVentaNUMERO.Value
      else
      GlbSalvarQuery(dmVentas.tblPOSTotales);
    end;
  end;
  if rxVenta.State = dsInactive then
  rxVenta.Open;

  if (edit1.Text <> '') And (rxVenta.RecordCount = 0) then
  begin
    edit1.Text:='';
    GlbUsandoCotiza:= False;
    GlbUsandoCotiza := False;
    //rxVenta.Close;
    //rxVenta.EmptyTable;
    rxVenta.Append;
    rxVenta.Params[0].Value := dmVentas.tblPOSTotales.Params[0].Value;
    //tablaPropietario.EmptyTable;
    //exito dmVentas.tblPOSTotales.EmptyTable;
    ActualizarRecoverData;//evaluando
    EsModificandoFactura:=False;
    bitBtnEditarFact.Visible:=False;
    bitBtnEditarFact.SendToBack;
    Label36.Visible:=False;
    label36.Caption:='';
    label29.Top:= 413;
    dbTextMontoExoneraITBIS.Top := 410;
    label41.Visible := True;
    DBText15.Visible:= True;    
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
    //rxVenta.Post;
    //WriteToLog('Post rxVenta - Line 1959');
  end;
  //rxVenta.DisableControls;
  // if (rxVenta.RecordCount > 0) then
  // begin
  //   rxVenta.Last;
  //   numero := rxVentaSerie.Value/ + 1;
  // end else numero:=1;

  // rxVenta.EnableControls;
  recuperando := False;

  //WriteToLog('Post rxVenta - Line 1970');
  //rxVenta.Append;
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
        lblProcDev.Visible := False;
        tablaPropietario.Close;
        tablaPropietario.Open;
        rxventa.EnableControls;
        rxventa.Close;
        rxventa.Open;
        tablaPropietario.EmptyTable;
        EsModificandoFactura:= False;
        lblProcDev.Visible  := EsDevolucion;

        GlbUsandoCotiza:= False;
        GlbUsandoCotiza := False;
        rxVenta.Close;
        //rxVenta.EmptyTable;
        rxVenta.Open;
        tablaPropietario.EmptyTable;
        //dmVentas.tblPOSTotales.EmptyTable;
        ActualizarRecoverData;
        EsModificandoFactura:=False;
        bitBtnEditarFact.Visible:=False;
        bitBtnEditarFact.SendToBack;
        Label36.Visible:=False;
        label36.Caption:='';
       label29.Top:= 413;
       dbTextMontoExoneraITBIS.Top := 410;
       label41.Visible := True;
       DBText15.Visible:= True;
        ActivarBotonesEnModifica;
        tablaPropietario.Close;
        tablaPropietario.Open;
        lblFechaCotizacion.Visible:=False;
        dbFechaCotizacion.Visible:=False;
        EsModificandoCotiza:=False;
       _NumeroCotiza:=-1;
       glbcodVendedor := -1;
       dmCalculos.rxVenta.EmptyTable;
       //dmCalculos.dmVentas.tblPOSTotales.EmptyTable;
       dmCalculos.rxError.EmptyTable;
       AbortarPostServTaller := True;
       try
         if numRecoverMaster > 0 then
         begin
           tblRecoverMater.Close;
           tblRecoverMater.Params[0].Value:= numRecoverMaster;
           tblRecoverMater.Open;
           if tblRecoverMater.RecordCount > 0 then           
           tblRecoverMater.Delete;
           GlbSalvarQuery(tblRecoverMater);
           lblFechaCotizacion.Visible:= False;
           dbFechaCotizacion.Visible := False;
           Label36.Visible := False;
           Label36.caption:='';
         end;
       except
       end;
       label29.Top:= 413;
       dbTextMontoExoneraITBIS.Top := 410;
       label41.Visible := True;
       DBText15.Visible:= True;
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

procedure TfrmProcVentaRapida.DBEdit1Exit(Sender: TObject);
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
    if (rxVentaCantPax.Value > 0) then
    rxVentaMontoBruto.Value:= (rxVentaCant.Value * rxVentaPrecio.Value) *
    rxVentaCantPax.Value;

    if EsDevolucion then
    rxVentaMontoBruto.Value:=(rxVentaCant.Value * rxVentaPrecio.Value) * -1;

    rxVentaMontoDescItem.Value:= rxVentaMontoBruto.Value * rxVentaPorcDescItem.Value / 100;
    rxVentaMontoDesGlobal.Value := rxVentaMontoBruto.Value * (dmVentas.tblPOSTotalesPorcDesAdicional.Value / 100);
  end;
  // guardarRec := rxVenta.GetBookmark;
  //Aplica Descuento e Itbis
  if (rxVentaSerie.Value = 0) then
  rxVentaSerie.Value:=1;
  GlbNumero:= rxVentaSerie.Value;

  if (auxiCant > 0) And (auxiCant <> rxVentaCant.Value) then
  PrecioCambio:=true;

  //Refresh;
  if rxVenta.State In [dsInsert, dsEdit] Then
  GlbSalvarQuery(rxVenta);

  //WriteToLog('Post rxVenta - Line 2061');
  //ProcesaNuevo;
  edtCodigo.SelectAll;
  edtCodigo.ClearSelection;

  //if frmProcVentaRapida.Showing then
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

  end;
end;

procedure TfrmProcVentaRapida.BitBtn2Click(Sender: TObject);
begin
  if GlbModoHistorico then
  begin
    MessageDlg('Operacion no permitida en MODO HISTORICO.',mtError,[mbok],0);
  end;
  BitBtn10Click(Self);

  TipoVenta:='CONTADO';
  if rxVenta.State In [dsInsert, dsEdit] Then
  begin
    if Not dmVentas.tblPOSTotalesMoneda.IsNull then
    rxVentaMoneda.Value:= dmVentas.tblPOSTotalesMoneda.Value;

    if rxVentaCodArticulo.IsNull Or rxVentaCant.IsNull Or rxVentaPrecio.IsNull then
    rxVenta.Cancel else
    GlbSalvarQuery(rxVenta);
    //WriteToLog('Post rxVenta - Line 2102');
  end;

  if (rxVentaMoneda.IsNull) then
  begin
    MessageDlg('Favor indicar tipo moneda.',mtError,[mbok],0);
    RxDBLookupCombo2.SetFocus;
  end;
  if rxVenta.RecordCount > 0 then
  //  if frmProcVentaRapida.Showing then
  if frmProcVentaRapida.Showing then
  Edit1.SetFocus;
  ActualizarRecoverData;
end;

procedure TfrmProcVentaRapida.rxVentaXXXAfterPost(DataSet: TDataSet);
begin
  if not recuperando then
  ProcInsertarRecoverData;
  recuperando :=False;

  Exito_ProcActualizaRcverMast;
  
  //if not recuperando then
  ProcInsertarRecoverData;
  recuperando :=False;

//t  qryValoresVta.close;
//t   qryValoresVta.params[0].value:= rxVentaSerie.Value;
//t  qryValoresVta.open;

  if sumarDatos then
  begin
    //rxVenta.EnableControls;
    // rxdbgrid2.EnableScroll;
  end;
  procCalc:=False;
  if not dmCalculos.esFeedback then
  if not esCargaDatosFFood then
    BitBtn27Click(Self);
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
  svalue := Format('%8.2f', [dmVentas.tblPOSTotalestotalneto.Value]);
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
  dmVentas.tblPOSTotales.Edit;
  dmVentas.tblPOSTotalesdevolucion.Value := 0;
  BitBtn4.Enabled := True;
  if Not EsFactura Or Not EsFinanciamiento then
    if (x < -0.01 ) then
    begin
      if (UpperCase(GlbFormatoFactura) <> 'BYMSERVICIOS') then
      begin
        MessageDlg('Monto entregado es menor que total a pagar, verifique',mtInformation, [mbOK], 0);
        Edit1.SetFocus;
        BitBtn4.Enabled := False;
        Exit;
      end;
    end;
  dmVentas.tblPOSTotalesmontorecibido.AsString := Edit1.Text;
  if (x > 0) then
  dmVentas.tblPOSTotalesdevolucion.Value := x;
    if not rxVentaNUMERO.IsNull then
    dmVentas.tblPOSTotalesNumero.Value:=rxVentaNUMERO.Value
    else 
  
  GlbSalvarQuery(dmVentas.tblPOStotales);

  BitBtn4.Enabled := True;
 if isShowing then
  BitBtn4.SetFocus;

end;

procedure TfrmProcVentaRapida.edtCodigoEnter(Sender: TObject);
begin
  if tablaPropietario.State = dsInactive then
  tablaPropietario.Open;
  if dmFactura.ibQryViewNCF.State = dsInactive then
  dmFactura.ibQryViewNCF.Open;
  if (dmVentas.tblPOSTotales.State = dsInactive) then
  begin
    dmVentas.tblPOSTotales.Close;
    dmVentas.tblPOSTotales.Open;
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
  LectorCodBarra1Click(Self)
  else
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
  else
  if (key = 114) then
  BitBtn2Click(Self)
  else
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
      if rxVenta.Locate('Serie', strToInt(item),[]) then
      rxVenta.Delete;
      //temp Marzo-17-2015 ProcesarSumaTotal;
      procCalc:=True;
      BitBtn27Click(Self);
    end;
  end else
  if (key = 119) then //F8
  btnPagoExactoClick(Self);

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
        procCalc:=True;
        BitBtn27Click(Self);
      end else
      begin
        rxVenta.Edit;
        rxVentaStatus.Value:='C';
        GlbSalvarQuery(rxVenta);
        //WriteToLog('Post rxVenta - Line 2357');
        //marzo 17 2015 ProcesarSumaTotal;
        procCalc:=True;
        BitBtn27Click(Self);
      end;
    end else
    if EsModificandoFactura then
    begin
      if (rxVentaStatus.Value = 'I') then
      begin
        rxVenta.Delete;
        GlbSalvarQuery(rxVenta);
        BitBtn27Click(Self);
      end else
      begin
        rxVenta.Edit;
        rxVentaStatus.Value:='C';
        GlbSalvarQuery(rxVenta);
        //WriteToLog('Post rxVenta - Line 2372');
        //marzo 17 2015 ProcesarSumaTotal;
        procCalc:=True;
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
        procCalc:=True;
        BitBtn27Click(Self);
        end;
      end;
    end else
    begin
      if MessageDlg('Borrar item No.' + rxVentaSerie.AsString + '?', mtWarning, [mbYes, mbNO], 0)= mrYes then
      begin
        EliminarRecoverData;
        rxVenta.Delete;
        procCalc:=True;
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
        if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
        begin
          qckRepVentaDiaria.PrinterSetup;
          qckRepVentaDiaria.Print;
        end else
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
  if (ABS(dmVentas.tblPOSTotalesMontoExoneraITBIS.Value) > 0) then
  ibStpInsertVentaDet.Params[22].Value := 1
  else
  ibStpInsertVentaDet.Params[22].Value := rxVentaItbisExento.Value;
  ibStpInsertVentaDet.Params[23].Value := rxVentaTipoVenta.Value;//Item de Venta
  ibStpInsertVentaDet.Params[24].Value := rxVentaDescripcionEspecial.Value;//Item de Venta
  ibStpInsertVentaDet.Params[25].Value := rxVentaCostoProducto.Value;
  ibStpInsertVentaDet.Params[26].Value := rxVentaPorcDescItem.Value;
  if (abs(rxVentaMontoDescItem.Value) > 0) then
  ibStpInsertVentaDet.Params[27].Value := rxVentaMontoDescItem.Value
  else
  ibStpInsertVentaDet.Params[27].Value := rxVentaMontoDesGlobal.Value;
  ibStpInsertVentaDet.Params[28].Value := rxVentaMontoDescuento.Value;
  ibStpInsertVentaDet.Params[29].Value := rxVentaIDTasaITBIS.Value;
  if Abs(rxVentaMontoItbisRecargo.Value) > 0 then
  ibStpInsertVentaDet.Params[30].Value := rxVentaMontoItbisRecargo.Value*-1;
  ibStpInsertVentaDet.Params[31].Value := rxVentaMoneda.Value;
  ibStpInsertVentaDet.Params[32].Value := rxVentamonto_tasa.Value;
  ibStpInsertVentaDet.Params[33].Value := rxVentaCantPax.Value;
  
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
    //ibStpInsertVentaDet.Params[27].Value := rxVentaMontoDescItem.Value * -1;
    if (rxVentaMontoDescItem.Value > 0) then
    ibStpInsertVentaDet.Params[27].Value := rxVentaMontoDescItem.Value * -1
    else
    ibStpInsertVentaDet.Params[27].Value := rxVentaMontoDesGlobal.Value * -1;
    ibStpInsertVentaDet.Params[28].Value := rxVentaMontoDescuento.Value * -1;
    ibStpInsertVentaDet.Params[29].Value := rxVentaIDTasaITBIS.Value;
    ibStpInsertVentaDet.Params[30].Value := rxVentaMontoItbisRecargo.Value*-1;
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
    ibStpInsertVentaDet.Params[30].Value := rxVentaMontoItbisRecargo.Value * -1;
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
  if (ABS(dmVentas.tblPOSTotalesMontoExoneraITBIS.Value) > 0) then
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

  //ibStpInsertVentaDet.Params[28].Value := rxVentaMontoDescuento.Value;
  ibStpInsertVentaDet.Params[29].Value := rxVentaIDTasaITBIS.Value;
  //ibStpInsertVentaDet.Params[30].Value := rxVentaMontoItbisRecargo.Value;
  ibStpInsertVentaDet.Params[31].Value := rxVentaMoneda.Value;
  ibStpInsertVentaDet.Params[32].Value := rxVentamonto_tasa.Value;
  ibStpInsertVentaDet.Params[33].Value := rxVentaCantPax.Value;
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
  ibStpInsertVentaDet.Params[33].Value := rxVentaCantPax.Value;  
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

  if (dmVentas.tblPOSTotalesTipoNCFIFiscal.Value < 0) then
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
        if dmVentas.tblPOSTotales.State = dsbrowse then dmVentas.tblPOSTotales.Edit;
        dmVentas.tblPOSTotalesCodCliente.Value:= xCodigoCte;

        qryCliente.Locate('CODIGO_CTE',xCodigoCte,[]);
        dmVentas.tblPOSTotalesNombreCliente.Value := qryClienteNOMBRE_CTE.Value;
        dmVentas.tblPOSTotalesDireccion.Value     := qryClienteDIRECCION_CONT.Value;
        dmVentas.tblPOSTotalesTelefono.Value      := qryClienteTELEF_CONTACTO.Value;
        dmVentas.tblPOSTotalesCodCliente.Value    := qryClienteCODIGO_CTE.Value;
        dmVentas.tblPOSTotalesRNC_NUMERO.Value    := qryClienteRNC_NUMERO.Value;
        if (Not qryClienteCANT_DIAS_CREDITO.IsNull) And (qryClienteCANT_DIAS_CREDITO.Value > 0) Then
        dmVentas.tblPOSTotalesFechaVence.Value    := GlbFechaTrnDiaria + qryClienteCANT_DIAS_CREDITO.Value
        else
        dmVentas.tblPOSTotalesFechaVence.Value    := GlbFechaTrnDiaria + 15;//Default
    if not rxVentaNUMERO.IsNull then
    dmVentas.tblPOSTotalesNumero.Value:=rxVentaNUMERO.Value
    else 
        
        GlbSalvarQuery(dmVentas.tblPOStotales);

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

        if not VerificaLimiteCredito(xCodigoCte,dmVentas.tblPOSTotalesTotalNeto.Value) then
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
         if dmVentas.tblPOSTotalesTipoNCF.IsNull then
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
            dmFactura.ibQryViewNCF.Locate('TIPO_CF',dmVentas.tblPOSTotalesTipoNCF.Value,[]);
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
            if dmVentas.tblPOSTotalesMontoNCRAplicado.Value > 0 then
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
              if dmVentas.tblPOSTotalesMontoNCRAplicado.Value > 0 then
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
                  
                if dmVentas.tblPOSTotales.State = dsBrowse then
                dmVentas.tblPOSTotales.Edit;

                if dmVentas.tblPOSTotales.State In [dsInsert, dsEdit] then
                begin
                  dmVentas.tblPOSTotales.Edit;
                  dmVentas.tblPOSTotalesncf_numero.Value := valorNCF;
                  dmVentas.tblPOSTotalesqrLabelNcfDesc.Value:=GlbDescNCF;
                  //GlbDescNCF:='';
    if not rxVentaNUMERO.IsNull then
    dmVentas.tblPOSTotalesNumero.Value:=rxVentaNUMERO.Value
    else 
                  
                  GlbSalvarQuery(dmVentas.tblPOStotales);
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

    exit; //Salir cuando es version fiscal

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
  dmVentas.tblPOSTotales.EmptyTable;
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
     MessageDlg('Debe existir al menos un record activo, verifique.',mtInformation,[mbok],0);
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

     if ((rxVentaCantPax.Value > 0) or (UpperCase(GLBFormatoFactura) = 'BYMSERVICIOS'))
        And (Edit1.Text = '') then
     begin
       MessageDlg('Indique monto Depósito o entre valor 0(cero)',mtInformation,[mbYes, mbNo],0);
       Edit1.SetFocus;
     end;
     if MessageDlg('Mantener número cotización?', mtInformation,[mbYes, mbNo], 0)=mrYes then
     begin
       ActualizaCotizacionMaster;
       rxVenta.First;
       RxDBGrid1.DisableScroll;
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
      RxDBGrid1.EnableScroll;
      dmfactura.qryRepCotizaNew.Close;
      dmfactura.qryRepCotizaNew.Params[0].Value:= _NumeroCotiza;
      dmfactura.qryRepCotizaNew.Open;
      ActFastFoodTicket(NumTicketFFood);
      NumTicketFFood:=-1;
      if GlbActivaIFiscal = 1 then
      begin
        dmDatos.qryMembrete.Close;
        dmDatos.qryMembrete.Params[0].Value:= glbCia_Key;
        dmDatos.qryMembrete.Open;
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
           if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
           begin
             qckCotiza8_5_FormG.PrinterSetup;
             qckCotiza8_5_FormG.Print;
           end else
           qckCotiza8_5_FormG.Preview;
          finally
          qckCotiza8_5_FormG.Free;
          qckCotiza8_5_FormG:=Nil;
          end;
        end else
        if (UpperCase(GLBFormatoFactura) = 'BYMSERVICIOS') then
        begin
          qckCotiza8_5_F_1ByMPreFct:=TqckCotiza8_5_F_1ByMPreFct.Create(Nil);
          try
            qckCotiza8_5_F_1ByMPreFct.Preview;
          finally
          qckCotiza8_5_F_1ByMPreFct.Free;
          qckCotiza8_5_F_1ByMPreFct:=Nil;
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
  //rxVenta.EmptyTable;
  Edit1.Text      := '';
  edtCodigo.Text  := '';
  pesoProd := '';
  BitBtn4.Enabled := False;
  if isShowing then
  BitBtn1.SetFocus;
  //dmVentas.tblPOSTotales.EmptyTable;
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

        if dmVentas.tblPOSTotales.State = dsbrowse then dmVentas.tblPOSTotales.Edit;
        dmVentas.tblPOSTotalesCodCliente.Value:= xCodigoCte;
        if xCodigoCte > 0 then
        begin
          qryCliente.Locate('CODIGO_CTE',xCodigoCte,[]);
          dmVentas.tblPOSTotalesNombreCliente.Value := qryClienteNOMBRE_CTE.Value;
          dmVentas.tblPOSTotalesDireccion.Value     := qryClienteDIRECCION_CONT.Value;
          dmVentas.tblPOSTotalesTelefono.Value      := qryClienteTELEF_CONTACTO.Value;
          dmVentas.tblPOSTotalesCodCliente.Value    := qryClienteCODIGO_CTE.Value;
          dmVentas.tblPOSTotalesRNC_NUMERO.Value    := qryClienteRNC_NUMERO.Value;
    if not rxVentaNUMERO.IsNull then
    dmVentas.tblPOSTotalesNumero.Value:=rxVentaNUMERO.Value
    else 
          
          GlbSalvarQuery(dmVentas.tblPOStotales);
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
  if not dmVentas.tblPOSTotalesMoneda.isNull then
  ipStpInsertCotizaMast.Params[6].Value:=  dmVentas.tblPOSTotalesMoneda.Value
  else
  ipStpInsertCotizaMast.Params[6].Value:=  '1';
  ipStpInsertCotizaMast.Params[7].Value:= dmVentas.tblPOSTotalesTotalneto.Value;//EditN1.Text;
  ipStpInsertCotizaMast.Params[8].Value   := 'A';
  ipStpInsertCotizaMast.Params[9].Value   := Now;
  ipStpInsertCotizaMast.Params[10].AsString := Trim(StrUserName);
  ipStpInsertCotizaMast.Params[11].Value    := Null;
  ipStpInsertCotizaMast.Params[12].Value    := Null;
  ipStpInsertCotizaMast.Params[13].Value    := null;
  ipStpInsertCotizaMast.Params[14].Value    := null;
  ipStpInsertCotizaMast.Params[15].Value    := null;
  ipStpInsertCotizaMast.Params[16].Value    := dmVentas.tblPOSTotalesSubTotal.Value;
  ipStpInsertCotizaMast.Params[17].Value    := dmVentas.tblPOSTotalesPorcDesAdicional.Value;
  if TotalesMontoDescAdicional.Value > 0 then
  ipStpInsertCotizaMast.Params[18].Value    := dmVentas.tblPOSTotalesMontoDescAdicional.Value
  else
  ipStpInsertCotizaMast.Params[18].Value    := dmVentas.tblPOSTotalesMontoDescItems.Value;

  if ((rxVentaCantPax.Value >0) or (UpperCase(GLBFormatoFactura) = 'BYMSERVICIOS'))
    And (Edit1.Text <> '') then
  ipStpInsertCotizaMast.Params[19].Value := StrToFloat(Edit1.Text)
  else
  ipStpInsertCotizaMast.Params[19].Value    := 0;
  
  if (edtObservacion.Text <> '') then
  ipStpInsertCotizaMast.Params[20].Value    := edtObservacion.Text
  else
  ipStpInsertCotizaMast.Params[20].Value    := '';//TotalesComentario.Value;
  ipStpInsertCotizaMast.Params[21].Value    := 0;
  ipStpInsertCotizaMast.Params[22].Value    := 0;
  ipStpInsertCotizaMast.Params[23].Value    := dmVentas.tblPOSTotalesitbis.Value;//montototalitbis
  ipStpInsertCotizaMast.Params[24].Value    := dmVentas.tblPOSTotalesMontoDescGastosAdmin.Value;
  ipStpInsertCotizaMast.Params[25].Value    := dmVentas.tblPOSTotalesMontoDescItbisGastosAdmin.Value;
  ipStpInsertCotizaMast.Params[26].Value    := dmVentas.tblPOSTotalesMontoDescTransp.Value;
  ipStpInsertCotizaMast.Params[27].Value    := dmVentas.tblPOSTotalesMontoDescDirtecnica.Value;
  ipStpInsertCotizaMast.Params[28].Value    := dmVentas.tblPOSTotalesMontoDescItbisDirTecnica.Value;
  ipStpInsertCotizaMast.Params[29].Value    := dmVentas.tblPOSTotalesMontoDescImprevisto.Value;
  ipStpInsertCotizaMast.Params[30].Value    := dmVentas.tblPOSTotalesMontoDescItbisImprevisto.Value;

  if rdgFactServicio.Checked then
  ipStpInsertCotizaMast.Params[31].Value     := 0 //Tipo_factura
  else ipStpInsertCotizaMast.Params[31].Value:= 1;

  ipStpInsertCotizaMast.Params[32].Value     := null;
  if CheckBox2.Checked then
  ipStpInsertCotizaMast.Params[32].Value     := 1 //aplica_tipodesc
  else
  if CheckBox3.Checked then
  ipStpInsertCotizaMast.Params[32].Value     := 2;
  
  ipStpInsertCotizaMast.Params[33].Value := dmVentas.tblPOSTotalesComentario.AsVariant;
  ipStpInsertCotizaMast.Params[34].Value     := dmVentas.tblPOSTotalesReferenciaCte.Value;
  ipStpInsertCotizaMast.Params[35].Value     := dmVentas.tblPOSTotalesRecargo.Value;
  ipStpInsertCotizaMast.Params[36].Value     := dmVentas.tblPOSTotalesTIPONCFIFiscal.Value;
  ipStpInsertCotizaMast.Params[37].Value     := dmVentas.tblPOSTotalesMontoExoneraITBIS.Value;
  ipStpInsertCotizaMast.Params[38].Value     := GlbPorcPropina;
  ipStpInsertCotizaMast.Params[39].Value     := dmVentas.tblPOSTotalesPropina.Value;
  ipStpInsertCotizaMast.Params[40].Value     := dmVentas.tblPOSTotalesPropinaLegal.Value;
  ipStpInsertCotizaMast.ExecProc;

  if Not ipStpInsertCotizaMast.Transaction.InTransaction then
  ipStpInsertCotizaMast.Transaction.StartTransaction;
  try
    ipStpInsertCotizaMast.Transaction.CommitRetaining;
  except
  ipStpInsertCotizaMast.Transaction.RollbackRetaining;
  end;

  dmfactura.ibstpInsertarPorcOtrosCargosCotiza.Params[0].Value:= ipStpInsertCotizaMast.Params[0].Value;
  dmfactura.ibstpInsertarPorcOtrosCargosCotiza.Params[1].Value:= dmVentas.tblPOSTotalesTPorcGAdmin.Value;
  dmfactura.ibstpInsertarPorcOtrosCargosCotiza.Params[2].Value:= dmVentas.tblPOSTotalesTPorcItbisGAdmin.Value;
  dmfactura.ibstpInsertarPorcOtrosCargosCotiza.Params[3].Value:= dmVentas.tblPOSTotalesTPorcTrans.Value;
  dmfactura.ibstpInsertarPorcOtrosCargosCotiza.Params[4].Value:= dmVentas.tblPOSTotalesTPorcDirTec.Value;
  dmfactura.ibstpInsertarPorcOtrosCargosCotiza.Params[5].Value:= dmVentas.tblPOSTotalesTPorcItbisDirTec.Value;
  dmfactura.ibstpInsertarPorcOtrosCargosCotiza.Params[6].Value:= dmVentas.tblPOSTotalesTPorcImprevisto.Value;
  dmfactura.ibstpInsertarPorcOtrosCargosCotiza.Params[7].Value:= dmVentas.tblPOSTotalesTPorcItbisImprevisto.Value;
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
  NumeroRecibo:=ipStpInsertCotizaMast.Params[0].Value;
  //Temporal alcanzar el exito ini
  {
  rxVenta.First;
  RxDBGrid1.DisableScroll;
  While Not rxVenta.Eof Do
  begin
    rxVenta.Edit;
    rxVentaNumeroRecibo.Value := ipStpInsertCotizaMast.Params[0].Value;
    rxVenta.Post;
    //WriteToLog('Post rxVenta - Line 3221');
    rxVenta.Next;
  end; }
  //Temporal alcanzar el exito ini
  rxVenta.EnableControls;
  RxDBGrid1.EnableScroll;
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
        if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
        begin
          qckCotiza8_5_FormG.PrinterSetup;
          qckCotiza8_5_FormG.Print;
        end else
        qckCotiza8_5_FormG.Preview;
      finally
      qckCotiza8_5_FormG.Free;
      qckCotiza8_5_FormG:=Nil;
      end;
    end else
      if (UpperCase(GLBFormatoFactura) = 'BYMSERVICIOS') then
      begin
        {
        qckCotiza8_5_F_1ByM:=TqckCotiza8_5_F_1ByM.Create(Nil);
        try
          qckCotiza8_5_F_1ByM.Preview;
        finally
        qckCotiza8_5_F_1ByM.Free;
        qckCotiza8_5_F_1ByM:=Nil;
        end; }
        qckCotiza8_5_F_1ByMPreFct:=TqckCotiza8_5_F_1ByMPreFct.Create(Nil);
        try
          qckCotiza8_5_F_1ByMPreFct.Preview;
        finally
        qckCotiza8_5_F_1ByMPreFct.Free;
        qckCotiza8_5_F_1ByMPreFct:=Nil;
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
  //rxVenta.EmptyTable;
  Edit1.Text    := '';
  edtCodigo.Text := '';
  pesoProd := '';
  BitBtn4.Enabled := False;
  if isShowing then
  BitBtn1.SetFocus;
  //dmVentas.tblPOSTotales.EmptyTable;
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

procedure TfrmProcVentaRapida.InsertarCotizacionDet(numero: Integer);
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
  if (ABS(dmVentas.tblPOSTotalesMontoExoneraITBIS.Value) > 0) then
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
  ibStpInsertCotizaDet.Params[25].Value    := rxVentaCantPax.Value;
  //ibStpInsertCotizaDet.Params[21].Value := rxVentaMontoDescItem.Value;
  ibStpInsertCotizaDet.ExecProc;
end;

procedure TfrmProcVentaRapida.BitBtn9Click(Sender: TObject);
begin
  if (rdgFactServicio.Checked And rdgFactVentaProducto.Checked)
  And (rxventa.RecordCount > 0) Then
  begin
    MessageDlg('Favor indicar tipo de Operación', mtInformation, [mbOK], 0);
    rdgFactServicio.SetFocus;
    Exit;
  end;
  if (dmVentas.tblPOSTotalesmontorecibido.Value > 0) and (rxVenta.RecordCount > 0) then
  begin
    MessageDlg('Favor procesar o cancelar venta en progreso', mtInformation, [mbOK], 0);
    Exit;
  end;
  dmCalculos.datosSetDataDone:=False;
  dmCalculos.datosCargados:=False;
  LlenandoDatos:=True;

  {t if (dmVentas.tblPOSTotales.RecordCount > 0) then
  begin
    dmVentas.tblPOSTotales.Close;
    dmVentas.tblPOSTotales.Open;
    Edit1.Text:='';
    dmVentas.tblPOSTotales.Close;
    dmVentas.tblPOSTotales.Open;
    dmVentas.tblPOSTotales.Insert;
    if (GlbMonedaBase > 0) then
    dmVentas.tblPOSTotalesMoneda.Value   := IntToStr(GlbMonedaBase)
    else
    dmVentas.tblPOSTotalesMoneda.Value   := '1';
    dmVentas.tblPOSTotalesSubTotal.Value:=0;
    dmVentas.tblPOSTotalesMontoDescItems.Value:=0;
    dmVentas.tblPOSTotalesitbis.Value     := 0;
    //WriteToLog('Total itbis: '+dmVentas.tblPOSTotalesitbis.AssTring);
    dmVentas.tblPOSTotalesmontodesc.Value := 0;
    dmVentas.tblPOSTotalestotalneto.Value := 0;
    dmVentas.tblPOSTotalesmontorecibido.Value:= 0;
    dmVentas.tblPOSTotalesdevolucion.Value   := 0;
    if not rxVentaNUMERO.IsNull then
    dmVentas.tblPOSTotalesNumero.Value:=rxVentaNUMERO.Value
    else
    GlbSalvarQuery(dmVentas.tblPOStotales);
    
    lblProcDev.Visible := False;
    //dmCalculos.esFeedback:=False;
  end;}
  RxDBGrid1.DisableScroll;
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
      LlenandoDatos:=True;
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
          GlbSalvarQuery(rxVenta);
          //WriteToLog('Post rxVenta - Line 3512');
          tablaPropietario.Edit;
          tablaPropietarioCodigoPropietario.Value:=
          frmCotizaciones.ibqryCotizacionMasterCODIGO_CTE.Value;
          tablaPropietario.Post;
        end;
        //Application.ProcessMessages;
        frmCotizaciones.ibqryCotizacionDet.Next;
      end;
      Application.ProcessMessages;      
      dmVentas.tblPOSTotales.Edit;
      dmVentas.tblPOSTotalesComentario.Value := frmCotizaciones.ibqryCotizacionMasterCOMENTARIO.Value;
      dmVentas.tblPOSTotalesRecargo.Value    := frmCotizaciones.ibqryCotizacionMasterMONTO_RECARGO.Value;
      dmVentas.tblPOSTotalesMontoExoneraITBIS.Value := frmCotizaciones.ibqryCotizacionMasterMONTO_EXONERADO_ITBIS.Value;
      dmVentas.tblPOSTotalesTipoNCFIFiscal.Value    := frmCotizaciones.ibqryCotizacionMasterTIPONCFIFISCAL.Value;
      dmVentas.tblPOSTotalesitbis.Value             := frmCotizaciones.ibqryCotizacionMasterMONTO_TOTAL_ITBIS.Value;
      dmVentas.tblPOSTotalesPorcDesAdicional.Value :=
      frmCotizaciones.ibqryCotizacionMasterPORC_DESCUENTO.Value;

      if dmVentas.tblPOSTotalesPorcDesAdicional.Value > 0 then
      chKDescuentoGlobal.Checked := True else
      chKDescuentoGlobal.Checked := False;

      if dmVentas.tblPOSTotales.State = dsEdit then
    if not rxVentaNUMERO.IsNull then
    dmVentas.tblPOSTotalesNumero.Value:=rxVentaNUMERO.Value
    else 
      
      GlbSalvarQuery(dmVentas.tblPOStotales);
      
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
      if EsDevolucion then
      Label36.Caption:='Procesando Devolución a Vta No.: ' + frmCotizaciones.ibqryCotizacionMasterNUMERO.AsString
      else
      Label36.Caption:='Modificando Cotización: ' + frmCotizaciones.ibqryCotizacionMasterNUMERO.AsString;
      edtObservacion.Text := frmCotizaciones.ibqryCotizacionMasterNOMBRE_CLIENTE_GENERAL.Value;
      dmCalculos.esFeedback:=True;//Autoriza ejecuta calculos
      Edit1Enter(Self);
    end;
  finally
  frmCotizaciones.Free;
  frmCotizaciones:=Nil;
  end;
  procCalc:=True;

  DBEdit10Exit(Self);
  LlenandoDatos:=false;
  dmCalculos.esFeedback := True;
  procCalc:=True;
  BitBtn27Click(Self);
  RxDBGrid1.EnableScroll;
  Refresh;
  Application.ProcessMessages;

  rxVenta.EnableControls;
  RxDBGrid1.EnableScroll;
end;

procedure TfrmProcVentaRapida.ProcCargaDatosCotizacion;
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
  rxVentaCantPax.Value  := frmCotizaciones.ibqryCotizacionDetCANT_VIAJES.AsInteger;
  rxVentaPrecio.Value:= frmCotizaciones.ibqryCotizacionDetPRECIO.Value;
  rxVentaPorcDescItem.Value:=frmCotizaciones.ibqryCotizacionDetPORC_DESC_ITEM.Value;
  rxVentaItbi.Value  := frmCotizaciones.ibqryCotizacionDetITBI_DET.Value;
  rxVentaMontoNeto.Value := frmCotizaciones.ibqryCotizacionDetVALOR_TOTAL_DET.Value;
  rxVentaMontoBruto.Value := frmCotizaciones.ibqryCotizacionDetVALOR_SERVICIO_DET.Value; 
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
  if not dmVentas.tblPOSTotalesMoneda.IsNull then
  dmfactura.IBDataSetFacturasMONEDA.Value := dmVentas.tblPOSTotalesMoneda.Value
  else
  dmfactura.IBDataSetFacturasMONEDA.Value  := '1';

  dmfactura.IBDataSetFacturasTIPO.Value   := 2;
  dmfactura.IBDataSetFacturasCODIGO_CTE.Value := codcte;
  dmfactura.IBDataSetFacturasFECHA.Value      := ExtraerFecha(GlbFechatrndiaria);
  dmfactura.IBDataSetFacturasDESCRIPCION.Value:= 'Venta';
  dmfactura.IBDataSetFacturasMONTO_FACT.Value := dmVentas.tblPOSTotalestotalNeto.Value;
  dmfactura.IBDataSetFacturasRCXC.Value       := 'R';
  dmfactura.IBDataSetFacturasSTATUS.Value     := 'P';
  dmfactura.IBDataSetFacturasFECHA_IN.Value   := Now;
  dmfactura.IBDataSetFacturasFECHA_VENCE.Value:= dmVentas.tblPOSTotalesFechaVence.Value;
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
  dmfactura.stpInsertPorcOtrosCargosFServ.Params[1].Value := dmVentas.tblPOSTotalesTPorcGAdmin.Value;
  dmfactura.stpInsertPorcOtrosCargosFServ.Params[2].Value := dmVentas.tblPOSTotalesTPorcItbisGAdmin.Value;
  dmfactura.stpInsertPorcOtrosCargosFServ.Params[3].Value := dmVentas.tblPOSTotalesTPorcTrans.Value;
  dmfactura.stpInsertPorcOtrosCargosFServ.Params[4].Value := dmVentas.tblPOSTotalesTPorcDirTec.Value;
  dmfactura.stpInsertPorcOtrosCargosFServ.Params[5].Value := dmVentas.tblPOSTotalesTPorcItbisDirTec.Value;
  dmfactura.stpInsertPorcOtrosCargosFServ.Params[6].Value := dmVentas.tblPOSTotalesTPorcImprevisto.Value;
  dmfactura.stpInsertPorcOtrosCargosFServ.Params[7].Value := dmVentas.tblPOSTotalesTPorcItbisImprevisto.Value;
  if (dmfactura.stpInsertPorcOtrosCargosFServ.Params[0].Value > 0) then
  //dmfactura.stpInsertPorcOtrosCargosFServ.Params[7].Value := dmVentas.tblPOSTotalesPorcItbisImprevisto.Value;
  dmfactura.stpInsertPorcOtrosCargosFServ.ExecProc;

  //Inserta factura en tabla factura_pendiente y pone status factura igual a F donde
  //status igual a P
  dmfactura.stpProcInsFactPendiente.Params[0].Value:= ExtraerFecha(GlbFechatrndiaria);
  dmfactura.stpProcInsFactPendiente.Params[1].Value:= ExtraerFecha(GlbFechatrndiaria);
  if not dmVentas.tblPOSTotalesMoneda.IsNull then
  begin
  dmfactura.stpProcInsFactPendiente.Params[2].Value:= dmVentas.tblPOSTotalesMoneda.Value;
  dmfactura.stpProcInsFactPendiente.Params[3].Value:= dmVentas.tblPOSTotalesMoneda.Value;
  end else
  begin
    dmfactura.stpProcInsFactPendiente.Params[2].Value:= '1';
    dmfactura.stpProcInsFactPendiente.Params[3].Value:= '1';
  end;
  dmfactura.stpProcInsFactPendiente.ExecProc;

  rxVenta.First;
  //While Not rxVenta.Eof Do
  //begin
  if (dmVentas.tblPOSTotalestotalneto.Value > 0 ) then
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
    if not dmVentas.tblPOSTotalesMoneda.IsNull then
    dmCxc.tblTransCxcmoneda.Value  := dmVentas.tblPOSTotalesMoneda.Value
    else
    dmCxc.tblTransCxcmoneda.Value  := '1';
    dmCxc.tblTransCxcfecha.Value   := ExtraerFecha(GlbFechatrndiaria);

    dmCxc.tblTransCxccodigo_cliente.Value := dmVentas.tblPOSTotalesCodCliente.Value;
    dmCxc.tblTransCxccodigo_serv.Value    := 0;
    dmCxc.tblTransCxcNUMERO_DOC.Value     := Numdoc;

    dmCxc.tblTransCxcvalor_documento.Value:= dmVentas.tblPOSTotalestotalNeto.Value;
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
  dmcxc.qryBalanceCtesCODIGO.Value    := dmVentas.tblPOSTotalesCodCliente.Value;//dmCxc.qryProcServcodigo_cliente.Value;
  dmcxc.qryBalanceCtesSERVICIO.Value  := 0; //dmCxc.qryProcServcodigo_serv.Value;
  if dmVentas.tblPOSTotalesMoneda.isNull then
  dmcxc.qryBalanceCtesMONEDA.Value    := '1' // dmCxc.qryProcServmoneda.Value;
  else
  dmcxc.qryBalanceCtesMONEDA.Value :=dmVentas.tblPOSTotalesMoneda.Value;

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
      frmAsignarNCFVenta.IBDataSet1MONTO.Value      := dmVentas.tblPOSTotalestotalneto.Value; //StrToFloat(EditN1.Text);

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

      if dmVentas.tblPOSTotales.State = dsBrowse then
      dmVentas.tblPOSTotales.Edit;

      if dmVentas.tblPOSTotales.State In [dsInsert, dsEdit] then
      begin
        dmVentas.tblPOSTotales.Edit;
        dmVentas.tblPOSTotalesncf_numero.Value := valorNCF;
        dmVentas.tblPOSTotalesqrLabelNcfDesc.Value:=GlbDescNCF;
    if not rxVentaNUMERO.IsNull then
    dmVentas.tblPOSTotalesNumero.Value:=rxVentaNUMERO.Value
    else 
        
        GlbSalvarQuery(dmVentas.tblPOStotales);
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
  try
  edtCodigo.Text := qryProductosCodigo_texto.Value;
  except
  edtCodigo.Text := qryProductosCodigo.AsSTring;
  end;
  panel2.Visible := False;
  Prod_existe    := True;
  BuscandoPorDesc:=false;
  //t DBEdit1.SetFocus;
  if Assigned(frmProcVentaRapida) Then
  if (showing) then
  if cboxTipoUnidad.Enabled then
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

  Panel2.Visible:=False;
end;

procedure TfrmProcVentaRapida.BitBtn10Click(Sender: TObject);
begin
  if (rxVenta.RecordCount >  0) then
  begin
    dmVentas.tblPOSTotales.Edit;
    rxVenta.Edit;
    //DBEdit5.SetFocus;
  end;
end;

procedure TfrmProcVentaRapida.DBEdit5Exit(Sender: TObject);
begin
  if dmVentas.tblPOSTotales.State in [dsedit, dsinsert] then
  begin
    EsEditando := True;

    if dmVentas.tblPOSTotales.State in [dsedit, dsinsert] then
    if not rxVentaNUMERO.IsNull then
    dmVentas.tblPOSTotalesNumero.Value:=rxVentaNUMERO.Value
    else 
    
    GlbSalvarQuery(dmVentas.tblPOStotales);
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
        if dmVentas.tblPOSTotales.State = dsbrowse
        then dmVentas.tblPOSTotales.Edit;

        dmVentas.tblPOSTotalesCodCliente.Value:= xCodigoCte;
        FrmBuscarClientesPersonas.qryClienteStd.Close;
        FrmBuscarClientesPersonas.qryClienteStd.Open;
        if FrmBuscarClientesPersonas.qryClienteStd.State = dsBrowse then
        begin
          FrmBuscarClientesPersonas.qryClienteStd.Locate('codigo_cte', xCodigoCte,[]);
          dmVentas.tblPOSTotalesNombreCliente.Value := FrmBuscarClientesPersonas.qryClienteStdNOMBRE_CTE.Value;
          dmVentas.tblPOSTotalesDireccion.Value     := FrmBuscarClientesPersonas.qryClienteStdDIRECCION_CONT.Value;
          dmVentas.tblPOSTotalesTelefono.Value      := FrmBuscarClientesPersonas.qryClienteStdTELEF_CONTACTO.Value;
          dmVentas.tblPOSTotalesRNC_NUMERO.Value    := FrmBuscarClientesPersonas.qryClienteStdRNC_NUMERO.Value;
        end else if FrmBuscarClientesPersonas.qryPrestamos.State = dsBrowse then
        begin
          FrmBuscarClientesPersonas.qryPrestamos.Locate('codigo_cte', xCodigoCte,[]);
          dmVentas.tblPOSTotalesNombreCliente.Value := FrmBuscarClientesPersonas.qryPrestamosNOMBRE_CTE.Value;
          dmVentas.tblPOSTotalesDireccion.Value     := FrmBuscarClientesPersonas.qryPrestamosDIRECCION_CONT.Value;
          dmVentas.tblPOSTotalesTelefono.Value      := FrmBuscarClientesPersonas.qryPrestamosTELEF_CONTACTO.Value;
          dmVentas.tblPOSTotalesRNC_NUMERO.Value    := FrmBuscarClientesPersonas.qryPrestamosRNC_NUMERO.Value;
        end;
    if not rxVentaNUMERO.IsNull then
    dmVentas.tblPOSTotalesNumero.Value:=rxVentaNUMERO.Value
    else 
        
        GlbSalvarQuery(dmVentas.tblPOStotales);

        CheckBox1.Checked:=True;

        frmFinanciamiento:=TfrmFinanciamiento.Create(Nil);

        frmFinanciamiento.rxLabelNombreCliente.Caption := dmVentas.tblPOSTotalesNombreCliente.Value;
        frmFinanciamiento.xCodigocliente := xCodigoCte;
        frmFinanciamiento.qryFinancAbiertos.Close;
        frmFinanciamiento.qryFinancAbiertos.Params[0].Value:= xCodigoCte;
        frmFinanciamiento.qryFinancAbiertos.Open;
        //frmFinanciamiento.xNumeroTrn := SerieDoc;
        frmFinanciamiento.rxDatosFinanc.Insert;
        frmFinanciamiento.rxDatosFinancMontoAFinanciar.Value:= dmVentas.tblPOSTotalestotalneto.Value;
        frmFinanciamiento.rxDatosFinancMontoInicial.Value:=0;
        //frmFinanciamiento.rxDatosFinancMontoInicial.Value:= dmVentas.tblPOSTotalestotalneto.Value
        //- dmVentas.tblPOSTotalesmontorecibido.Value;// - dmVentas.tblPOSTotalesMontoInteres.Value;

        frmFinanciamiento.ShowModal;
        if frmFinanciamiento.rxDatosFinanc.RecordCount > 0 then
        begin
          dmVentas.tblPOSTotales.Edit;
          if GlbMuestraInteresFactFinac = 1 then
          dmVentas.tblPOSTotalesMontoInteres.Value := 0
          else
          begin
            dmVentas.tblPOSTotalesMontoInteres.Value :=
            frmFinanciamiento.rxDatosFinancMontoInteres.Value *
            frmFinanciamiento.rxDatosFinanccantCuotas.Value;
          end;
          dmVentas.tblPOSTotalesmontorecibido.Value := frmFinanciamiento.rxDatosFinancMontoInicial.Value;
          dmVentas.tblPOSTotalestotalNeto.Value     := frmFinanciamiento.rxDatosFinancMontoFinanciado.Value;
    if not rxVentaNUMERO.IsNull then
    dmVentas.tblPOSTotalesNumero.Value:=rxVentaNUMERO.Value
    else 
          
          GlbSalvarQuery(dmVentas.tblPOStotales);
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
  //dmVentas.tblPOSTotales.EmptyTable;
  //CheckBox1.Checked:=false;
  //edtCodigo.SetFocus;
  if dmVentas.tblPOSTotalesMontoInteres.Value > 0 then
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

    if dmVentas.tblPOSTotales.State = dsbrowse
    then dmVentas.tblPOSTotales.Edit;
    dmVentas.tblPOSTotalesCodCliente.Value:= xCodigoCte;

    qryCliente.Locate('CODIGO_CTE',xCodigoCte,[]);
    dmVentas.tblPOSTotalesNombreCliente.Value := qryClienteNOMBRE_CTE.Value;
    dmVentas.tblPOSTotalesDireccion.Value     := qryClienteDIRECCION_CONT.Value;
    dmVentas.tblPOSTotalesTelefono.Value      := qryClienteTELEF_CONTACTO.Value;
    dmVentas.tblPOSTotalesCodCliente.Value    := qryClienteCODIGO_CTE.Value;
    dmVentas.tblPOSTotalesRNC_NUMERO.Value    := qryClienteRNC_NUMERO.Value;
    if (Not qryClienteCANT_DIAS_CREDITO.IsNull) And (qryClienteCANT_DIAS_CREDITO.Value > 0) Then
    dmVentas.tblPOSTotalesFechaVence.Value    := GlbFechaTrnDiaria + qryClienteCANT_DIAS_CREDITO.Value
    else
    dmVentas.tblPOSTotalesFechaVence.Value    := GlbFechaTrnDiaria + 15;//Default
    if not rxVentaNUMERO.IsNull then
    dmVentas.tblPOSTotalesNumero.Value:=rxVentaNUMERO.Value
    else 
    
    GlbSalvarQuery(dmVentas.tblPOStotales);

    ProcesaFacturar(1, serieDoc, xCodigoCte);//xcodigocte);
    rxVenta.First;
    RxDBGrid1.DisableScroll;
    While Not rxVenta.Eof Do
    begin
      rxVenta.Edit;
      rxVentaNumeroFactura.Value:= serieDoc;
      GlbSalvarQuery(rxVenta);
      //WriteToLog('Post rxVenta - Line 4158');
      rxVenta.Next;
    end;
    RxDBGrid1.EnableScroll;
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
        qckRepFacturaEstandarNew.valorNCF   := dmVentas.tblPOSTotalesncf_numero.Value;
        qckRepFacturaEstandarNew.QRLabel14.Caption := 'Monto Inicial';
        if dmVentas.tblPOSTotales.State = dsBrowse then
        begin
          dmVentas.tblPOSTotales.Edit;
          dmVentas.tblPOSTotalesPorcientoInteres.Value:= frmFinanciamiento.rxDatosFinancPorcInteres.Value;
    if not rxVentaNUMERO.IsNull then
    dmVentas.tblPOSTotalesNumero.Value:=rxVentaNUMERO.Value
    else 
          
          GlbSalvarQuery(dmVentas.tblPOStotales);
        end else
        if dmVentas.tblPOSTotales.State in [dsEdit, dsInsert] then
        dmVentas.tblPOSTotalesPorcientoInteres.Value:= frmFinanciamiento.rxDatosFinancPorcInteres.Value;
        dmVentas.tblPOSTotalestotalneto.Value;
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
//      dmVentas.tblPOSTotales.EmptyTable;

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
              
  //rxVenta.EmptyTable;
  Edit1.Text      := '';
  edtCodigo.Text  := '';pesoProd := '';
  BitBtn4.Enabled := False;
//  dmVentas.tblPOSTotales.EmptyTable;
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

procedure TfrmProcVentaRapida.DBEdit2Exit(Sender: TObject);
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
     if (cPrecio < aPrecio) or (cPrecio < qryProductosPRECIO_MINIMO.Value) and (not EsDevolucion) then
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
  //tj   dmVentas.tblPOSTotalesPorcDesAdicional.Value:= porcdes;
  //tj   DBEdit5Exit(Self);
  //tj end;{t else
  //tj begin
  //tj   if rxVenta.State In [dsBrowse] Then
  //tj   rxVenta.Edit;
  //tj   rxVentaPrecio.Value:=rxqryInvPRECIO.Value;
  //tj end; }
  if (aPrecio <> cPrecio) then
  PrecioCambio:=True else PrecioCambio:=False;
  procCalc:=True;
  BitBtn27Click(Self);

  if rxVenta.State In [dsInsert, dsEdit] Then
  GlbSalvarQuery(rxVenta);
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
    (ABS(diff) > 2)) And (glbUsaescalaPrecio = 0) And (Not cambioValido)
    And (not GLBEsFastFood) //temporal hasta probar version Limao
     then
    begin
      rxVenta.Edit;
      rxVentaPrecio.Value := aPrecio;
      GlbSalvarQuery(rxVenta);
      procCalc:=True;
      if (GlbUsaPUnidadLevel = 0) then
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

      dmVentas.tblPOSTotales.Close;
      dmVentas.tblPOSTotales.Open;
      dmVentas.tblPOSTotales.Insert;
      dmVentas.tblPOSTotalesNumero.Value:= frmEdicionVenta.tblDatosDetNUMERO.Value;
      //dmVentas.tblPOSTotalesMoneda.Value := IntToStr(GlbMonedaBase);
      if (GlbMonedaBase > 0) then
      dmVentas.tblPOSTotalesMoneda.Value   := IntToStr(GlbMonedaBase)
      else
      dmVentas.tblPOSTotalesMoneda.Value   := '1';
      dmVentas.tblPOSTotalesSubTotal.Value:=0;
      dmVentas.tblPOSTotalesitbis.Value:=0;
      dmVentas.tblPOSTotalesmontodesc.Value:=0;
      dmVentas.tblPOSTotalestotalneto.Value:=0;
      dmVentas.tblPOSTotalesmontorecibido.Value:=0;
      dmVentas.tblPOSTotalesdevolucion.Value:=0;
    if not rxVentaNUMERO.IsNull then
    dmVentas.tblPOSTotalesNumero.Value:=rxVentaNUMERO.Value
    else 
      
      GlbSalvarQuery(dmVentas.tblPOStotales);

      if dmVentas.tblPOSTotales.State = dsBrowse then
      dmVentas.tblPOSTotales.Edit;
      dmVentas.tblPOSTotalesCodCliente.Value:=frmEdicionVenta.tblDatosVentaCODIGO_CTE.Value;
      dmVentas.tblPOSTotalesComentario.Value := frmEdicionVenta.tblDatosVentaCOMENTARIO.Value;
      dmVentas.tblPOSTotalesPorcDesAdicional.Value:= frmEdicionVenta.tblDatosVentaPORC_DESCUENTO.Value;
      if dmVentas.tblPOSTotales.State = dsBrowse then
      dmVentas.tblPOSTotales.Edit;
      dmVentas.tblPOSTotalesMontoDescAdicional.Value :=  frmEdicionVenta.tblDatosVentaMONTO_DESCUENTO.Value;
    if not rxVentaNUMERO.IsNull then
    dmVentas.tblPOSTotalesNumero.Value:=rxVentaNUMERO.Value
    else 
      
      GlbSalvarQuery(dmVentas.tblPOStotales);
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
  NumTrnGen : Integer;
  NumOrden : Integer;
  _flag : Boolean;
  flag : boolean;
begin
  EsReimp:=False;
  dmclientes.tblClientes.Close;
  dmclientes.tblClientes.Open;
  if not dmclientes.tblClientes.Locate('CODIGO_CTE', tablaPropietarioCodigoPropietario.Value,[]) then
  begin
    MessageDlg('Codigo cliente ' + tablaPropietarioCodigoPropietario.AsString + ' no existe, verifique.', mtError, [mbOk], 0);
    Exit;
  end;
  numeroTrnVta:= 0;
  dmVentas.tblPOSTotalesTipoNCFIFiscal.Value;
  dmVentas.tblPOSTotalesTipoNCF.Value;
  if EsModificandoCotiza then Exit;

  if (rxVenta.RecordCount > 0) And (Not EsDevolucion) then
  begin
    if (dmVentas.tblPOSTotalesSubTotal.Value <= 0) then
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

    if dmVentas.tblPOSTotalesTipoNCF.IsNull And (GlbActivaIFiscal = 1 ) then
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
      if dmVentas.tblPOSTotalesMoneda.IsNull then
      begin
        MessageDlg('Favor indicar moneda.', mtInformation, [mbok],0);
        Exit;
      end;

      if MessageDlg('Continuar con devolución factura, NCR será creada?', mtWarning,[mbYes, mbNo],0) = mrNo then
      Exit;
      if (not dmVentas.tblPOSTotalesTipoNCF.IsNull) then
      begin
        if (dmVentas.tblPOSTotalesTipoNCFIFiscal.Value = -1) then
        begin
          dmVentas.tblPOSTotales.Edit;
          dmVentas.tblPOSTotalesTipoNCFIFiscal.Value:= 2;//2;
    if not rxVentaNUMERO.IsNull then
    dmVentas.tblPOSTotalesNumero.Value:=rxVentaNUMERO.Value
    else 
          
          GlbSalvarQuery(dmVentas.tblPOStotales);
        end else
        if (dmVentas.tblPOSTotalesTipoNCFIFiscal.Value = 0) then
        begin
          dmVentas.tblPOSTotales.Edit;
          dmVentas.tblPOSTotalesTipoNCFIFiscal.Value:=dmFactura.ibQryViewNCFTIPO_NCFNCR.Value;//2;
    if not rxVentaNUMERO.IsNull then
    dmVentas.tblPOSTotalesNumero.Value:=rxVentaNUMERO.Value
    else 
          
          GlbSalvarQuery(dmVentas.tblPOStotales);
        end else
        if (dmVentas.tblPOSTotalesTipoNCFIFiscal.Value = 1) then
        begin
          dmVentas.tblPOSTotales.Edit;
          dmVentas.tblPOSTotalesTipoNCFIFiscal.Value:=dmFactura.ibQryViewNCFTIPO_NCFNCR.Value;//3;
    if not rxVentaNUMERO.IsNull then
    dmVentas.tblPOSTotalesNumero.Value:=rxVentaNUMERO.Value
    else 
          
          GlbSalvarQuery(dmVentas.tblPOStotales);
        end else
        if (dmVentas.tblPOSTotalesTipoNCFIFiscal.Value = 5) then
        begin
          dmVentas.tblPOSTotales.Edit;
          dmVentas.tblPOSTotalesTipoNCFIFiscal.Value:=dmFactura.ibQryViewNCFTIPO_NCFNCR.Value;
          GlbSalvarQuery(dmVentas.tblPOStotales);
        end else
        if (dmVentas.tblPOSTotalesTipoNCFIFiscal.Value = 4) then
        begin
          dmVentas.tblPOSTotales.Edit;
          dmVentas.tblPOSTotalesTipoNCFIFiscal.Value:=dmFactura.ibQryViewNCFTIPO_NCFNCR.Value;
          GlbSalvarQuery(dmVentas.tblPOStotales);
        end else
        begin
          MessageDlg('No permitido', mtInformation, [mbok],0);
          Exit;
        end;
      end;
    //Exit;//Temporal

    UProcesarDevolucion.GeneraNCF := True;
    //Crear Nota Credito
    if Not dmVentas.tblPOSTotalesTipoNCF.IsNull then
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
    UProcesarDevolucion.monto    := dmVentas.tblPOSTotalestotalneto.Value;
    UProcesarDevolucion.status   := 'A';

    UProcesarDevolucion.codig_usuario := VarUsuarioGlb;
    UProcesarDevolucion.fechaInsert   := Now;;
    UProcesarDevolucion.fechaUpdate   := Now ;
    UProcesarDevolucion.codigousuarioupd := VarUsuarioGlb;
    UProcesarDevolucion.tipodoc := 5; //Nota Credito
    UProcesarDevolucion.Moneda  := Trim(dmVentas.tblPOSTotalesMoneda.Value);
    UProcesarDevolucion.numeroFactura := rxVentaNumeroFactura.Value;
    //if (not dmVentas.tblPOSTotalesTipoNCF.IsNull) then
    if dmVentas.tblPOSTotalesTipoNCFIFiscal.IsNull then
    UProcesarDevolucion.GeneraNCF:= False
    else
    UProcesarDevolucion.GeneraNCF:= True;

    if dmFactura.qryVentaFacturaFORMA_PAGO.Value in [7,8,15] then
    UProcesarDevolucion.UpdateBLCCXC  := True
    else
    UProcesarDevolucion.UpdateBLCCXC  := False;
    if UProcesarDevolucion.GeneraNCF then
    UProcesarDevolucion.Ejecutar('04', dmVentas.tblPOSTotalesTipoNCFIFiscal.Value, dmFactura.qryVentaFacturaNUMERO.Value) //Comprobante Fiscal Nota de Credito
    else
    UProcesarDevolucion.Ejecutar(' ', -1, dmFactura.qryVentaFacturaNUMERO.Value);
    
    rxVenta.DisableControls; //dmFactura.qryVentaFacturaNUMERO_NCF.Value
    rxVenta.First;
    if rxVentaglbcodVendedor.Value > 0 then
    GlbcodVendedor:= rxVentaglbcodVendedor.Value;
    //ActualizaVentaMaster('6', UProcesarDevolucion.seriencfasignado);//Devolucion
    ProcInsertarVtaMastEnDevolucion(UProcesarDevolucion.seriencfasignado);
    rxVenta.First;
    While Not rxVenta.Eof Do
    begin
      ibStpActualizaInvProd.Params[0].Value:= rxVentaCodArticulo.Value;
      if (GlbUsaPUnidadLevel = 1) then
      ibStpActualizaInvProd.Params[1].Value:= rxVentaCant.Value * CantUnidad
      else
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
      //USADO PARA VER VALORES PARA TICKET FISCAL
      dmFactura.qryGetNcfAsignado.Open;
      dmFactura.qryVentaFactura.Last;

      dmreportes.qryNCFAfectado.Close;
      dmreportes.qryNCFAfectado.Params[0].Value:= dmReportes.qryViewVentasMastSERIE_NCF_ASIGNADO.Value;
      dmreportes.qryNCFAfectado.Open;
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
          dmReportes.qryViewVentasDet.Last;
          frmTestImpresoraFiscal.tRecord:= dmReportes.qryViewVentasDet.RecordCount;
          dmReportes.qryViewVentasDet.first;
          frmTestImpresoraFiscal.ncfAfectado := dmReportes.qryViewVentasMastNUMERO_NCF.Value;
          frmTestImpresoraFiscal.LCantCopias := rxspinImpCantCopias.Text;
          frmTestImpresoraFiscal.BitBtn1Click(Self);
          StatusImpFiscal:=True;
          frmTestImpresoraFiscal.btnImprimeReciboClick(Self);
        finally
        frmTestImpresoraFiscal.Free;
        frmTestImpresoraFiscal:= Nil;
        StatusImpFiscal:=False;
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
      dmVentas.tblPOSTotales.Close;
      dmVentas.tblPOSTotales.Open;

      Refresh;
      numerodocReimp := -1;}

      Application.ProcessMessages;
    end else
    begin
      if (dmFactura.qryVentaFacturaTIPO_FACTURA.Value = 6 ) or
      (dmFactura.formaPago = 6 ) then
      begin
        LlenarrxSolDatoscte(dmFactura.qryVentaFacturaCODIGO_CTE.Value);
        if ((UpperCase(GLBFormatoFactura) = 'CASANDRA2') or (UpperCase(GLBFormatoFactura) = 'FORMATOGENERAL'))
        and ((GlBAyaco = 0) and (GlBBurgos = 0)) and (GlbRec3Pulg = 0) then
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
        TipoVenta:= 'Devolución';
        if (GlbRec3Pulg = 1) then
        begin
        qckRepReciboDevol3Pulg:=TqckRepReciboDevol3Pulg.Create(Nil);
        try
          if GlbImpCodProducto = 1 then
          begin
            qckRepReciboDevol3Pulg.QRLabel27.Enabled := False;
            qckRepReciboDevol3Pulg.QRDBText5.Enabled:= False;
          end else
          begin
            qckRepReciboDevol3Pulg.QRLabel27.Enabled:= True;
            qckRepReciboDevol3Pulg.QRDBText5.Enabled:= True;
          end;

          if Length(dmVentas.tblPOSTotalesNombreCliente.Value) > 0 then
          dmVentas.tblPOSTotales.RecordCount;
          if dmFactura.qryVentaFacturaNOMBRE_FACTURAR.IsNull then
          qckRepReciboDevol3Pulg.nombreCteGenerico := dmFactura.qryVentaFacturaNOMBRE_CLIENTE_GENERAL.Value
          else
          qckRepReciboDevol3Pulg.nombreCteGenerico := dmFactura.qryVentaFacturaNOMBRE_FACTURAR.Value;
          if Length(edtObservacion.Text) > 0 then
          qckRepReciboDevol3Pulg.nombreCteGenerico := edtObservacion.Text;

          qckRepReciboDevol3Pulg.xtipoVenta:= TipoVenta;
          qckRepReciboDevol3Pulg.valorNCF  := dmFactura.qryVentaFacturaNUMERO_NCF.Value;

          //qckRepReciboDevol3Pulg.qrLabelRNC.Caption := dmFactura.qryVentaFacturaRNC_NUMERO.Value;

          if rxVenta.RecordCount = 1 then
          qckRepReciboDevol3Pulg.Page.Length:= 5
          else
          if rxVenta.RecordCount >= 2 then
          qckRepReciboDevol3Pulg.Page.Length:= qckRepReciboDevol3Pulg.Page.Length +
          (rxVenta.RecordCount - 1 ) * 0.25;

          flag:=True;
          repeat
          begin
            qckRepReciboDevol3Pulg.Prepare;
            if qckRepReciboDevol3Pulg.PageNumber > 1 then
            begin
              qckRepReciboDevol3Pulg.Page.Length := qckRepReciboDevol3Pulg.Page.Length + 0.25;
              qckRepReciboDevol3Pulg.Prepare;
              flag:=False;
            end else break;
          end;
        until flag = true;

        if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
        qckRepReciboDevol3Pulg.Print else
        qckRepReciboDevol3Pulg.Preview;
        finally
        qckRepReciboDevol3Pulg.Free;
        qckRepReciboDevol3Pulg:=Nil;
      end;
      end else 
         if (GlBAyaco = 1) then
         begin
           qckFactServ8_5Ayaco:=TqckFactServ8_5Ayaco.Create(Nil);
           try
             qckFactServ8_5Ayaco.TPag.Caption:=
             IntToStr(qckFactServ8_5Ayaco.PageNumber);
             qckFactServ8_5Ayaco.xtipoVenta := 'Devolución';
             qckFactServ8_5Ayaco.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;
             if (GlbImpReciboSinPreg = 1) then
                qckFactServ8_5Ayaco.Print
              else
              if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
              begin
                qckFactServ8_5Ayaco.PrinterSetup;
                qckFactServ8_5Ayaco.Print;
              end else
              qckFactServ8_5Ayaco.Preview;

            if (GlbImpReciboSinPreg = 0) then
            if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
            begin 
              qckFactServ8_5Ayaco.Preview;
            end;
        finally
        qckFactServ8_5Ayaco.Free;
        qckFactServ8_5Ayaco:=Nil;
        end;
      end else
      if (GlBBurgos = 1) then
      begin
        qckFactServ8_5BB:=TqckFactServ8_5BB.Create(Nil);
        try
          qckFactServ8_5BB.TPag.Caption:=
          IntToStr(qckFactServ8_5BB.PageNumber);
          qckFactServ8_5BB.xtipoVenta := 'Devolución';
          qckFactServ8_5BB.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;
          if (GlbImpReciboSinPreg = 1) then
            qckFactServ8_5BB.Print
            else
            if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
            begin
              qckFactServ8_5BB.PrinterSetup;
              qckFactServ8_5BB.Print;
            end else
            qckFactServ8_5BB.Preview;

            if (GlbImpReciboSinPreg = 0) then
            if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
            begin 
              qckFactServ8_5BB.Preview;
            end;
        finally
        qckFactServ8_5BB.Free;
        qckFactServ8_5BB:=Nil;
        end;
      end else
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
          qckFactServArtioffice8_5.xtipoVenta := 'Devolución';
          qckFactServArtioffice8_5.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;;
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
      end
      else
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
//      dmVentas.tblPOSTotales.EmptyTable;
      dmVentas.tblPOSTotales.Close;
      dmVentas.tblPOSTotales.Open;
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
       label29.Top:= 413;
       dbTextMontoExoneraITBIS.Top := 410;
       label41.Visible := True;
       DBText15.Visible:= True;    
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
        if (GlbUsaPUnidadLevel = 1) then
        ibStpActualizaInvProd.Params[1].Value:= rxVentaCant.Value * CantUnidad
        else
        ibStpActualizaInvProd.Params[1].Value:= rxVentaCant.Value;
        ibStpActualizaInvProd.Params[2].Value:= 1;//tipoTrn
        ibStpActualizaInvProd.Params[3].Value:= 1;//porCodigo
        if (rxVentaInvetariar.Value <> 0) And (GlbCodDivInventario = 1) then
        ibStpActualizaInvProd.ExecProc;

        InsertarDetDevolucionCash(ipStpInsertVentMast.Params[0].Value);

        ibStpActualizaInvProd.Params[0].Value:= rxVentaCodArticulo.Value;
        if (GlbUsaPUnidadLevel = 1) then
        ibStpActualizaInvProd.Params[1].Value:= rxVentaCant.Value * CantUnidad
        else
        begin
          if (rxVentaTipoUnidad.Value = 3) Or (rxVentaTipoUnidad.Value = 0) then
          ibStpActualizaInvProd.Params[1].Value:= rxVentaCant.Value
          else
          begin
            ibStpActualizaInvProd.Params[1].Value:= rxVentaCant.Value * CantUnidad;
          end;
        end;
        if (rxVentaTipoVenta.Value = 0) Or (rxVentaTipoVenta.IsNull ) then //Item de Venta
        begin
          try
          ActualizaInvAlmacen;//Actualiza Division Inventario
          except
          end;
        end;
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
      //rxventa.EmptyTable;
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
      if (dmVentas.tblPOSTotalesTipoNCFIFiscal.Value = -1) then
      begin
        dmVentas.tblPOSTotales.Edit;
        //dmVentas.tblPOSTotalesTipoNCFIFiscal.Value
        dmVentas.tblPOSTotalesTipoNCFIFiscal.Value:= 2;//2;
        GlbSalvarQuery(dmVentas.tblPOStotales);
      end else
      if (dmVentas.tblPOSTotalesTipoNCFIFiscal.Value = 0) then
      begin
        dmVentas.tblPOSTotales.Edit;                //dmFactura.ibQryViewNCF.sql.text
        //dmVentas.tblPOSTotalesTipoNCFIFiscal.Value
        dmVentas.tblPOSTotalesTipoNCFIFiscal.Value:=dmFactura.ibQryViewNCFTIPO_NCFNCR.Value;//2;
        GlbSalvarQuery(dmVentas.tblPOStotales);
      end else
      if (dmVentas.tblPOSTotalesTipoNCFIFiscal.Value = 1) then
      begin
        dmVentas.tblPOSTotales.Edit;
        dmVentas.tblPOSTotalesTipoNCFIFiscal.Value:=dmFactura.ibQryViewNCFTIPO_NCFNCR.Value;//3;
        GlbSalvarQuery(dmVentas.tblPOStotales);
      end else
      if (dmVentas.tblPOSTotalesTipoNCFIFiscal.Value = 5) then
      begin
        //MessageDlg('No permitido', mtInformation, [mbok],0);
        //Exit;
        dmVentas.tblPOSTotales.Edit;
        dmVentas.tblPOSTotalesTipoNCFIFiscal.Value:=dmFactura.ibQryViewNCFTIPO_NCFNCR.Value;
        GlbSalvarQuery(dmVentas.tblPOStotales);
      end else
      if (dmVentas.tblPOSTotalesTipoNCFIFiscal.Value = 4) then
      begin
        dmVentas.tblPOSTotales.Edit;
        dmVentas.tblPOSTotalesTipoNCFIFiscal.Value:=dmFactura.ibQryViewNCFTIPO_NCFNCR.Value;
        GlbSalvarQuery(dmVentas.tblPOStotales);
      end else
      begin
        MessageDlg('No permitido', mtInformation, [mbok],0);
        Exit;
      end;
      end else
      begin
        dmVentas.tblPOSTotales.Edit;
        dmVentas.tblPOSTotalesTipoNCFIFiscal.AsVariant:= null;
        dmVentas.tblPOSTotalesTipoNCF.AsVariant := null;
        GlbSalvarQuery(dmVentas.tblPOStotales);
      end;

    if dmVentas.tblPOSTotalesMoneda.IsNull then
    begin
      MessageDlg('Favor indicar moneda.', mtInformation, [mbok], 0);
      Exit;
    end;  
    if MessageDlg('Desea procesar transacción como devolución?', mtWarning, [mbYes, mbNo],0)= mrYes then
    begin
      if (tablaPropietarioCodigoPropietario.value = 0) then
      begin
         //t no req en fiscal MessageDlg('Favor seleccionar cliente.', mtInformation, [mbOK], 0);
         //t no req en fiscal RxDBLookupCombo1.SetFocus;
         //t no req en fiscal Exit;
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
    UProcesarDevolucion.monto    := dmVentas.tblPOSTotalestotalneto.Value;
    UProcesarDevolucion.status   := 'A';
    UProcesarDevolucion.Moneda   := Trim(dmVentas.tblPOSTotalesMoneda.Value);
    UProcesarDevolucion.codig_usuario := VarUsuarioGlb;
    UProcesarDevolucion.fechaInsert   := Now;;
    UProcesarDevolucion.fechaUpdate   := Now ;
    UProcesarDevolucion.codigousuarioupd := VarUsuarioGlb;
    UProcesarDevolucion.tipodoc := 5; //Nota Credito
    UProcesarDevolucion.numeroFactura := rxVentaNumeroFactura.Value;
    if dmVentas.tblPOSTotalesTipoNCFIFiscal.IsNull then
    UProcesarDevolucion.GeneraNCF:= False
    else
    UProcesarDevolucion.GeneraNCF:= True;
    //UProcesarDevolucion.UpdateBLCCXC := dmFactura.qryVentaFacturaNUMEROFACTURA.Value > 0;
    if dmFactura.qryVentaFacturaFORMA_PAGO.Value in [7,8,15] then
    UProcesarDevolucion.UpdateBLCCXC  := True
    else
    UProcesarDevolucion.UpdateBLCCXC := False;
              //dmVentas.tblPOSTotalesTipoNCFIFiscal.value
    if UProcesarDevolucion.GeneraNCF then
    begin
      dmfactura.ibqryViewNCF.Close;
      dmFactura.ibQryViewNCF.Close;
      if dmFactura.ibQryViewNCF.Prepared then
      dmFactura.ibQryViewNCF.UnPrepare;
      dmFactura.ibQryViewNCF.SQL.Text := dmFactura.ibQryViewNCF_0.SQL.Text;
      dmfactura.ibqryViewNCF.Open;

      //strnametipocf:='TIPO_CF;tipo_ncf_ifiscal';

      {if Not dmFactura.ibQryViewNCF.Locate('TIPO_CF;tipo_ncf_ifiscal',
      VarArrayOf(['04', dmVentas.tblPOSTotalesTipoNCFIFiscal.Value]), []) then
      begin
        MessageDlg('Verifique configuración NCF. Reporte a soporte usuario.', mtError, [mbOk], 0);
        Exit;
      end;}
      UProcesarDevolucion.Ejecutar('04', dmVentas.tblPOSTotalesTipoNCFIFiscal.Value, dmFactura.qryVentaFacturaNUMERO.Value)//Comprogante Fiscal Nota de Credito
    end else
    UProcesarDevolucion.Ejecutar('', -1, dmFactura.qryVentaFacturaNUMERO.Value);

    //ActualizaVentaMaster('6', UProcesarDevolucion.seriencfasignado);//Devolucion
    ProcInsertarVtaMastEnDevolucion(UProcesarDevolucion.seriencfasignado);
    rxVenta.First;
    While Not rxVenta.Eof Do
    begin
      ibStpActualizaInvProd.Params[0].Value:= rxVentaCodArticulo.Value;
      if (GlbUsaPUnidadLevel = 0) then
      ibStpActualizaInvProd.Params[1].Value:= rxVentaCant.Value
      else
      ibStpActualizaInvProd.Params[1].Value:= rxVentaCant.Value * CantUnidad;
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

      dmreportes.qryNCFAfectado.Close;
      dmreportes.qryNCFAfectado.Params[0].Value:= dmReportes.qryViewVentasMastSERIE_NCF_ASIGNADO.Value;
      dmreportes.qryNCFAfectado.Open;
      
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
      //temporal ver resultado if (dmfactura.qryDatosTrncxc.RecordCount = 0) then
      //temporal ver resultado begin
      //temporal ver resultado   MessageDlg('Nota de Crédito no disponible para impresión, verifique.', mtError, [mbOk], 0);
      //temporal ver resultado   Exit;
      //temporal ver resultado end else
      begin

        frmTestImpresoraFiscal:= TfrmTestImpresoraFiscal.Create(Nil);
        try
          dmReportes.qryViewVentasDet.Last;
          frmTestImpresoraFiscal.tRecord:= dmReportes.qryViewVentasDet.RecordCount;
          dmReportes.qryViewVentasDet.first;        
          frmTestImpresoraFiscal.ncfAfectado := dmReportes.qryViewVentasMastNUMERO_NCF.Value;
          frmTestImpresoraFiscal.LCantCopias := rxspinImpCantCopias.Text;
          frmTestImpresoraFiscal.BitBtn1Click(Self);
          StatusImpFiscal:=True;
          frmTestImpresoraFiscal.btnImprimeReciboClick(Self);
        finally
        frmTestImpresoraFiscal.Free;
        frmTestImpresoraFiscal:= Nil;
        end;
        //Delay(1000);
        StatusImpFiscal:=False;
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
  //rxventa.EmptyTable;
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
//    dmVentas.tblPOSTotales.EmptyTable;
    lblProcDev.Visible := False;
    tablaPropietario.Close;
    tablaPropietario.Open;
    //rxventa.EmptyTable;
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
         label29.Top:= 413;
       dbTextMontoExoneraITBIS.Top := 410;
       label41.Visible := True;
       DBText15.Visible:= True;
  Refresh;
  Application.ProcessMessages;
end;

procedure TfrmProcVentaRapida.DBEdit2Enter(Sender: TObject);
begin
  edtCodigo.Text := '';
  pesoProd := '';
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
 //aqui voy divison
  WriteToLog('Llamada a ChkExentoExit');
  if (rxVenta.Recordcount > 1) then
  begin
    _book :=  rxVenta.GetBookmark;
    SumarDatos := False;
    rxVenta.DisableControls;
    rxVenta.First;
    RxDBGrid1.DisableScroll;
    //{temporal check 1
    {While Not rxVenta.Eof Do
    begin
      if (rxVentaStatus.Value = 'C') then
      begin
        rxVenta.Next;
        continue;
      end;
      rxVenta.Edit;

      rxVenta.Next; //check 1
    end;}
    //} //enc temporal check 1
    sumarDatos := True;
    rxVenta.Edit;
    GlbSalvarQuery(rxVenta);
    rxVenta.GotoBookmark(_book); //hoy es un dia maravilloso
    rxventa.FreeBookmark(_book);
    rxventa.EnableControls;
    //WriteToLog('Post rxVenta - Line 4763');
  end else
  begin
    rxVenta.Edit;

    //rxVenta.Post;
  end;
  rxVenta.EnableControls;
  RxDBGrid1.EnableScroll;
  procCalc:=True;
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

procedure TfrmProcVentaRapida.FormShow(Sender: TObject);
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
  AbrirUnidades;

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

procedure TfrmProcVentaRapida.RxLabel1Click(Sender: TObject);
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

  if dmVentas.tblPOSTotalesMoneda.IsNull then
  ipStpInsertVentMast.Params[7].Value    := '1'
  else
  ipStpInsertVentMast.Params[7].Value    := dmVentas.tblPOSTotalesMoneda.Value;
  
  ipStpInsertVentMast.Params[8].AsString := dmVentas.tblPOSTotalestotalneto.AsString; //EditN1.Text;
  ipStpInsertVentMast.Params[9].Value    := 'A';
  ipStpInsertVentMast.Params[10].Value   := Now;
  ipStpInsertVentMast.Params[11].Value   := Null;
  ipStpInsertVentMast.Params[12].Value   := Null;
  ipStpInsertVentMast.Params[13].Value   := Null;
  ipStpInsertVentMast.Params[14].Value   := SerieDoc;//Numero Factura
  ipStpInsertVentMast.Params[15].Value   := Null; //yo soy inteligencia divina
  //ver mas abajo
  //ipStpInsertVentMast.Params[16].Value:= Serie_Asignadoncf;
  ipStpInsertVentMast.Params[17].Value:= dmVentas.tblPOSTotalesSubTotal.Value;
  ipStpInsertVentMast.Params[18].Value:= dmVentas.tblPOSTotalesPorcDesAdicional.Value;
  if dmVentas.tblPOSTotalesMontoDescAdicional.Value > 0 then
  ipStpInsertVentMast.Params[19].Value:= dmVentas.tblPOSTotalesMontoDescAdicional.Value
  else
  ipStpInsertVentMast.Params[19].Value:= dmVentas.tblPOSTotalesMontoDescItems.Value;
  ipStpInsertVentMast.Params[20].Value:= dmVentas.tblPOSTotalesmontorecibido.Value;
  ipStpInsertVentMast.Params[21].Value:= dmVentas.tblPOSTotalesdevolucion.Value;
  ipStpInsertVentMast.Params[22].Value:= dmVentas.tblPOSTotalesitbis.Value;
  ipStpInsertVentMast.Params[23].Value:= dmVentas.tblPOSTotalesmontorecibido.Value;
  ipStpInsertVentMast.Params[24].Value:= edtObservacion.Text;
  ipStpInsertVentMast.Params[25].Value:= dmVentas.tblPOSTotalesMontoDescGastosAdmin.Value;
  ipStpInsertVentMast.Params[26].Value:= dmVentas.tblPOSTotalesMontoDescItbisGastosAdmin.Value;
  ipStpInsertVentMast.Params[27].Value:= dmVentas.tblPOSTotalesMontoDescTransp.Value;
  ipStpInsertVentMast.Params[28].Value:= dmVentas.tblPOSTotalesMontoDescDirtecnica.Value;
  ipStpInsertVentMast.Params[29].Value:= dmVentas.tblPOSTotalesMontoDescItbisDirTecnica.Value;
  ipStpInsertVentMast.Params[30].Value:= dmVentas.tblPOSTotalesMontoDescImprevisto.Value;
  ipStpInsertVentMast.Params[31].Value:= dmVentas.tblPOSTotalesMontoDescItbisImprevisto.Value;
  ipStpInsertVentMast.Params[32].Value:= dmVentas.tblPOSTotalesComentario.Value;
  ipStpInsertVentMast.Params[33].Value:= rxVentaNumeroCotiza.Value;
  ipStpInsertVentMast.Params[34].Value:= dmVentas.tblPOSTotalesReferenciaCte.Value;    
  ipStpInsertVentMast.Params[35].Value:= dmVentas.tblPOSTotalesRecargo.Value;
  ipStpInsertVentMast.Params[36].Value:= dmVentas.tblPOSTotalesTipoNCFIFiscal.Value;
  ipStpInsertVentMast.Params[37].Value:= dmVentas.tblPOSTotalesMontoExoneraITBIS.Value;
  ipStpInsertVentMast.Params[38].Value:= 0;
      
  if Serie_asignadoncf > 0 then
  ipStpInsertVentMast.Params[16].Value     := Serie_Asignadoncf
  else ipStpInsertVentMast.Params[16].Value:= Null;
  //serie_ncf_asignado
  ipStpInsertVentMast.Params[39].Value:= dmVentas.tblPOSTotalesPropina.Value;
  ipStpInsertVentMast.Params[40].Value:= GlbPorcPropina;
  ipStpInsertVentMast.Params[41].Value:= dmVentas.tblPOSTotalesPropinaLegal.Value;

  ipStpInsertVentMast.ExecProc;
  numeroTrnVta:= ipStpInsertVentMast.Params[0].Value;
  if (dmVentas.tblPOSTotalesTipoNCF.Value = '15') OR (dmVentas.tblPOSTotalesTipoNCF.Value = '14') then
  begin
    updTipoRetencionVta.Params[0].Value:= 1;//LEY RETENCION GOV y ONG
    updTipoRetencionVta.Params[1].Value:= ipStpInsertVentMast.Params[0].Value;
    updTipoRetencionVta.ExecQuery;
    if Not updTipoRetencionVta.Transaction.InTransaction then
    updTipoRetencionVta.Transaction.StartTransaction;
    try
      updTipoRetencionVta.Transaction.CommitRetaining;
    except
    updTipoRetencionVta.Transaction.RollbackRetaining;
    end;
  end;
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
  ActFastFoodTicket(NumTicketFFood);
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
    if (GlbUsaPUnidadLevel = 0) then
    ibStpActualizaInvProd.Params[1].Value:= rxVentaCant.Value
    else
    ibStpActualizaInvProd.Params[1].Value:= rxVentaCant.Value * CantUnidad;
    ibStpActualizaInvProd.Params[2].Value:= 0;//tipoTrn
    ibStpActualizaInvProd.Params[3].Value:= 1;//porCodigo
    if (rxVentaInvetariar.Value <> 0) And  (GlbCodDivInventario = 1 ) then
    ibStpActualizaInvProd.ExecProc;

    if (rxVentaTipoVenta.Value = 0) or (rxVentaTipoVenta.IsNull )  then //Item de Venta
    begin
      try
      ActualizaInvAlmacen;
      except
      end;
    end;

    rxVenta.Next;
  end;
  NumeroRecibo:=ipStpInsertVentMast.Params[0].Value;
  //Temporal alcanzar el exito ini
  {
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
  end;}
    //Temporal alcanzar el exito fin
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

      dmreportes.qryNCFAfectado.Close;
      dmreportes.qryNCFAfectado.Params[0].Value:= dmReportes.qryDatosVentaMasterSERIE_NCF_ASIGNADO.Value;
      dmreportes.qryNCFAfectado.Open;

      frmTestImpresoraFiscal:=TfrmTestImpresoraFiscal.Create(Nil);
      try
        dmReportes.qryDatosVentaDetalle.Last;
        frmTestImpresoraFiscal.tRecord:= dmReportes.qryDatosVentaDetalle.RecordCount;
        dmReportes.qryDatosVentaDetalle.first;
        frmTestImpresoraFiscal.LCantCopias := rxspinImpCantCopias.Text;
        frmTestImpresoraFiscal.Button1Click(Self);
        StatusImpFiscal:=True;
        frmTestImpresoraFiscal.btnImprimeReciboClick(Self);//Button1Click(Self);
      finally
      frmTestImpresoraFiscal.Free;
      frmTestImpresoraFiscal:=Nil;
      end;
      StatusImpFiscal:=False;
      //Delay(1000);
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
      if (GLBEsFastFood) then
      begin
      TipoVenta := 'CONTADO';

      if (TipoVenta = 'CONTADO') then
      AbrirDatosParaTicket(false,false,tablaPropietarioCodigoPropietario.AsString,numeroTrnVta,rxVentaFecha.Value);
      //else
      //if (TipoVenta = 'CREDITO') then
      //AbrirDatosParaTicket(false,true,tablaPropietarioCodigoPropietario,dmReportes.qryViewVentasMastNUMERO_FACTURA.AsInteger,
      //dmReportes.qryViewVentasMastFECHA.Value);
            
        qckRepReciboReimpFFoodPOS:=TqckRepReciboReimpFFoodPOS.Create(Nil);
        try
          qckRepReciboReimpFFoodPOS.xtipoVenta := TipoVenta;
          qckRepReciboReimpFFoodPOS.valorNCF   := valorNCF;
          qckRepReciboReimpFFoodPOS.ncfDesc    := GlbDescNCF;
          if rxVenta.RecordCount > 2 then
             qckRepReciboReimpFFoodPOS.Page.Length:= qckRepReciboReimpFFoodPOS.Page.Length +
             (rxVenta.RecordCount - 2 ) * 0.63;
          if ImprimirRecibo1.Checked then
             qckRepReciboReimpFFoodPOS.Print else
            qckRepReciboReimpFFoodPOS.Preview;
        finally
        qckRepReciboReimpFFoodPOS.Free;
        qckRepReciboReimpFFoodPOS:=Nil;
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
  RxDBGrid1.EnableScroll;
end;

procedure TfrmProcVentaRapida.LectorCodBarra1Click(Sender: TObject);
begin
  LectorCodBarra1.Checked:= Not LectorCodBarra1.Checked;
  if lectorcodbarra1.Checked then
  edtCodigo.Hint:='Enter - para buscar codigo barra. F10-on/off'
  else edtCodigo.Hint:= '';
  imbBarcode.Visible := LectorCodBarra1.Checked;
end;

procedure TfrmProcVentaRapida.Edit1Enter(Sender: TObject);
begin
  if not dmVentas.tblPOSTotalesMoneda.IsNull then
  begin
    if dmVentas.tblPOSTotalesMoneda.IsNull then
    begin
      dmVentas.tblPOSTotales.Edit;
      dmVentas.tblPOSTotalesMoneda.Value := IntToStr(GlbMonedaBase);
      GlbSalvarQuery(dmVentas.tblPOStotales);
      if (rxVenta.RecordCount > 0) and (rxVentaMoneda.IsNull) then
      rxVenta.Edit;
      rxVentaMoneda.Value:= dmVentas.tblPOSTotalesMoneda.Value;
      if rxVenta.State in [dsEdit, dsInsert] then
      GlbSalvarQuery(rxVenta);
    end;
  end;

  if (dmVentas.tblPOSTotalestotalneto.Value < 0) and (not EsDevolucion) then
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
  //linea2:=Format('%8.2f',[dmVentas.tblPOSTotalestotalneto.Value]);
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
  isShowing:=False;
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


    if rxVenta.State In [dsEdit, dsInsert] then
    GlbSalvarQuery(rxVenta);
    //WriteToLog('Post rxVenta - Line 5506');

    rxVenta.Next;
  end;

  sumarDatos:=True;
  rxVenta.AutoCalcFields := False;
end;

procedure TfrmProcVentaRapida.RxDBLookupCombo1Exit(Sender: TObject);
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
    procCalc:=True;
    BitBtn27Click(Self);
    rxVenta.EnableControls;
    rxdbgrid2.EnableScroll;
  end;

  ProcSetNCFCliente;

  //Refresh;
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
  dmVentas.qryPrecioUnidadSurt.Close;
  dmVentas.qryPrecioUnidadSurt.Params[0].Value:=rxVentaCodArticulo.Value;
  dmVentas.qryPrecioUnidadSurt.Open;

  //dmVentas.qryPrecioUnidadSurt.recordcount
  xflag:=True;
  if GlbUsaPUnidadLevel = 1 then
  if not dmVentas.qryPrecioUnidadSurt.Locate('COD_PRODUCTO;DESCRIPCION',
  VarArrayOf([rxVentaCodArticulo.Value,cboxTipoUnidad.Text]),[]) then
  begin
    MessageDlg('Unidad no encontrada, verifique.', mtError, [mbOk], 0);
    xflag:=False;
  end else
  begin
    GlbTipoUnidad := dmVentas.qryPrecioUnidadSurtIDUNIDAD.Value;
    CantUnidad:= dmVentas.qryPrecioUnidadSurtCANTIDAD.Value;
    rxVentaTipoUnidad.Value:= GlbTipoUnidad;
  end;
  
  if GlbUsaPUnidadLevel = 0 then  
  if not xFlag then
  if Not dmInventario.qryTipoUnidad.Locate('DESCRIPCION', cboxTipoUnidad.Text, []) then
  begin
    MessageDlg('Unidad no encontrada, verifique.', mtError, [mbOk], 0);
    xflag:=False;;
  end else
 if GlbUsaPUnidadLevel = 0 then  
  begin
    GlbTipoUnidad := dmInventario.qryTipoUnidadIDUNIDAD.Value;
    CantUnidad:= dminventario.qryTipoUnidadCANTIDAD.Value;
    rxVentaTipoUnidad.Value:= GlbTipoUnidad;
  end;

  if xFlag then;
  begin
    if not qryProductoscodigo.Isnull And (Not PrecioCambio ) then
    begin
      if GlbUsaPUnidadLevel = 1 then
      begin
        //if (GlbUsaEscalaPrecio = 0) and (GlbTipoUnidad <> 3) then
        //rxVentaPrecio.Value  := precioXUnidad(GlbTipoUnidad, qryProductoscodigo.value); //qryProductosPRECIO_TIPO_UNIDAD.Value;
        //if (rxVentaprecio.Value = 0) And (Not PrecioCambio )then
        //begin
        //  if (GlbUsaescalaPrecio = 1) And (Not GlbUsandoCotiza Or ( rxVentaStatus.Value = 'I') ) then
        //  begin
            SetPrecioPorCantidad;//case
        //  end;
          //rxVentaPrecio.Value  := qryProductosPrecio.Value;//poner aqui regla para precio por cantidad
          //cboxTipoUnidad.ItemIndex:=0;
        //end;
      end else
      begin
        if (GlbUsaEscalaPrecio = 0) and (GlbTipoUnidad <> 3) then
        rxVentaPrecio.Value  := precioXUnidad(GlbTipoUnidad, qryProductoscodigo.value); //qryProductosPRECIO_TIPO_UNIDAD.Value;
        if (rxVentaprecio.Value = 0) And (Not PrecioCambio )then
        begin
          if (GlbUsaescalaPrecio = 1) And (Not GlbUsandoCotiza Or ( rxVentaStatus.Value = 'I') ) then
          begin
            SetPrecioPorCantidad;//case
          end;
          //rxVentaPrecio.Value  := qryProductosPrecio.Value;//poner aqui regla para precio por cantidad
          //cboxTipoUnidad.ItemIndex:=0;
        end;
      end;
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



  if rxVenta.State In [dsInsert, dsEdit] Then
  GlbSalvarQuery(rxVenta);
  //WriteToLog('Post rxVenta - Line 5778');
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
  if (dmVentas.tblPOSTotalesmontorecibido.Value > 0) And(rxVenta.RecordCount > 0) then
  begin
    MessageDlg('Favor procesar o cancelar venta en progreso', mtInformation, [mbOK], 0);
    Exit;
  end;
  LlenandoDatos := True;
  if (dmVentas.tblPOSTotales.RecordCount > 0) then
  begin
    dmVentas.tblPOSTotales.Close;
    dmVentas.tblPOSTotales.Open;
    Edit1.Text:='';
    dmVentas.tblPOSTotales.Close;
    dmVentas.tblPOSTotales.Open;
    dmVentas.tblPOSTotales.Insert;
    //dmVentas.tblPOSTotalesMoneda.Value := IntToStr(GlbMonedaBase);
    if (GlbMonedaBase > 0) then
    dmVentas.tblPOSTotalesMoneda.Value   := IntToStr(GlbMonedaBase)
    else
    dmVentas.tblPOSTotalesMoneda.Value   := '1';

    dmVentas.tblPOSTotalesSubTotal.Value := 0;
    dmVentas.tblPOSTotalesitbis.Value    := 0;
    dmVentas.tblPOSTotalesmontodesc.Value:= 0;
    dmVentas.tblPOSTotalestotalneto.Value:= 0;
    dmVentas.tblPOSTotalesmontorecibido.Value:= 0;
    dmVentas.tblPOSTotalesdevolucion.Value   := 0;
    dmVentas.tblPOSTotales.Post;
    lblProcDev.Visible := False;
  end;

  frmConsultaPreVenta:=TfrmConsultaPreVenta.Create(Nil);
  try
    if frmConsultaPreVenta.Showmodal = mrOk then
    begin
      esCargaDatosFFood:=frmConsultaPreVenta.esCargaDatosFFood;
      if frmConsultaPreVenta.NumTicketFFood > 0 then
      NumTicketFFood:=frmConsultaPreVenta.NumTicketFFood;
      
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
        GlbSalvarQuery(rxVenta);
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
      dmVentas.tblPOSTotales.Edit;
      dmVentas.tblPOSTotalesComentario.Value:='UTouchPos #'+frmConsultaPreVenta.qryPreventaMasterNumero.AsString;
      GlbSalvarQuery(dmVentas.tblPOStotales);
    end;
  finally
  frmConsultaPreVenta.Free;
  frmConsultaPreVenta:=Nil;
  end;
  LlenandoDatos := False;
  procCalc:=True;
  BitBtn27Click(Self);
  Refresh;
end;

procedure TfrmProcVentaRapida.CargarPreventa;
begin
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
    rxVentaCodTexto.Value   := qryProductosCODIGO_TEXTO.Value;
    rxVentaMonedaBase.Value := GetMonedaProducto(qryProductosCODIGO.AsInteger);
    rxVentaDescripcionEspecial.Value := qryProductosDESCRIPCIONADICIONAL.Value;
    rxVentaCostoProducto.Value       := qryProductosPRECIO_COMPRA.Value;
  end;
  rxVentaReferencia.Value := qryProductosREFERENCIA.Value;
  rxVentaInvetariar.Value:= qryProductosINVENTARIAR.Value;
  rxVentaCodArticulo.Value:= frmConsultaPreVenta.qryPreventaDetCODIGO_PROD.AsInteger;
  FGlbPorcItbi(ExtraerFecha(rxVentaFecha.Value), rxVentaCodArticulo.Value);
  rxVentaIDTasaITBIS.Value := GlbIDTasa;
  
  rxVentaRutaImagen.Value := BuscarRutaImagen(frmConsultaPreVenta.qryPreventaDetCODIGO_PROD.AsInteger);
  rxVentaMonedaBase.Value := GetMonedaProducto(qryProductosCODIGO.AsInteger);
  rxVentamonto_tasa.Value := GlbMontoTasa(rxVentaMonedaBase.Value);
  rxVentaCodUsuario.Value := frmConsultaPreVenta.qryPreventaMasterCODIGO_VENDEDOR.Value;

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

  if (GlbUsaPUnidadLevel = 0) then
  begin
    if (rxVentaTipoUnidad.Value = 3) Or (rxVentaTipoUnidad.Value = 0) then
    ibStpActualizaInvProd.Params[1].Value:= rxVentaCant.Value * cantP
    else
    begin
      ibStpActualizaInvProd.Params[1].Value:= rxVentaCant.Value * cantP;
    end;
  end else
  ibStpActualizaInvProd.Params[1].Value:= rxVentaCant.Value * cantP;

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

end;

procedure TfrmProcVentaRapida.rdgFactVentaProductoClick(Sender: TObject);
begin
  //panelDescripcionServ.Visible:=False;
  if rxVenta.RecordCount = 0 then exit;
  if CheckBox2.Checked then
  CheckBox3.Checked:=False;
  rxVenta.Edit;

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
  tblRecovertransDESCRIPCION.Value:=rxVentaDescripcion.Value;
  tblRecovertransDESCRIPCIONPRODUCTO.Value:=rxVentaDescripcionEspecial.Value;
  if rdgFactServicio.Checked then
  tblRecovertransTIPO_OPE.Value:= 0
  else  //0-Factura servicio
  tblRecovertransTIPO_OPE.Value:= 1;
  tblRecovertransPRECIO_LEVEL.Value:=RxSpinEdit1.AsInteger;

  GlbSalvarQuery(tblRecovertrans);
end;

procedure TfrmProcVentaRapida.ProcRecoverData(showsms:boolean);
begin
  edit1.Text:='';
  tblRecovertrans.Close;
  tblRecovertrans.Open;
  tblRecovertrans.First;
  if (tblRecovertrans.RecordCount = 0) and (showsms) then
  begin
    MessageDlg('No hay datos para recuperar.', mtInformation,[mbok],0);
    exit;
  end;
  if rxVenta.state = dsInactive then rxVenta.Open;
  rxVenta.EnableControls;
  While Not tblRecovertrans.Eof Do
  begin
    //WriteToLog('Recover data rxVenta - Line 6390');
    rxVenta.Insert;
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
    GlbSalvarQuery(rxVenta);
    //WriteToLog('Post rxVenta - Line 6420');
    tblRecovertrans.Next;
  end;
end;

procedure TfrmProcVentaRapida.ActualizarRecoverData;
begin
  Exit;//Evaluar
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
  //EliminarRecoverDataAll;
end;

procedure TfrmProcVentaRapida.DBMemo1Exit(Sender: TObject);
begin
  if rxVenta.State In [dsEdit, dsInsert] then
  GlbSalvarQuery(rxVenta);
  //WriteToLog('Post rxVenta - Line 6455');
end;

procedure TfrmProcVentaRapida.RecuperarTransacciones1Click(
  Sender: TObject);
begin
  Recuperando := True;
  ProcRecoverData(True);
  Recuperando := False;
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
  SetPrecioPorCantidad;
  {
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
  end;  }

  if rxVenta.state = dsbrowse then
  rxVenta.Edit;


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
          dmVentas.tblPOSTotalesMontoDescGastosAdmin.Value:=
          dmVentas.tblPOSTotalesSubTotal.Value * ibsqlGetPorcDescFctSvr.FieldByName('Porciento').AsFloat / 100;
          dmVentas.tblPOSTotalesPorcGAdmin.Value:=' '+ibsqlGetPorcDescFctSvr.FieldByName('Porciento').AsString+'%';
          dmFactura.stpInsertPorcOtrosCargosFServ.Params[1].Value:=ibsqlGetPorcDescFctSvr.FieldByName('Porciento').AsFloat;
          dmVentas.tblPOSTotalesTPorcGAdmin.Value:=ibsqlGetPorcDescFctSvr.FieldByName('Porciento').AsFloat;
          end;
         end;
      2: begin
          if CheckBox3.Checked then
          begin
          dmVentas.tblPOSTotalesMontoDescItbisGastosAdmin.Value:=
          dmVentas.tblPOSTotalesMontoDescGastosAdmin.Value * ibsqlGetPorcDescFctSvr.FieldByName('Porciento').AsFloat / 100;
          dmVentas.tblPOSTotalesPorcItbisGAdmin.Value:=' '+ibsqlGetPorcDescFctSvr.FieldByName('Porciento').AsString+'%';
          dmFactura.stpInsertPorcOtrosCargosFServ.Params[2].Value:=ibsqlGetPorcDescFctSvr.FieldByName('Porciento').AsFloat;
          dmVentas.tblPOSTotalesTPorcItbisGAdmin.Value:=ibsqlGetPorcDescFctSvr.FieldByName('Porciento').AsFloat;
          end;
         end;
      3: begin
          dmVentas.tblPOSTotalesMontoDescTransp.Value:=
          dmVentas.tblPOSTotalesSubTotal.Value * ibsqlGetPorcDescFctSvr.FieldByName('Porciento').AsFloat / 100;
          dmVentas.tblPOSTotalesPorcTrans.Value:=' '+ibsqlGetPorcDescFctSvr.FieldByName('Porciento').AsString+'%';
          dmFactura.stpInsertPorcOtrosCargosFServ.Params[3].Value:=ibsqlGetPorcDescFctSvr.FieldByName('Porciento').AsFloat;
          dmVentas.tblPOSTotalesTPorcTrans.Value:=ibsqlGetPorcDescFctSvr.FieldByName('Porciento').AsFloat;          
         end;
      4: begin
          dmVentas.tblPOSTotalesMontoDescDirtecnica.Value:=
          dmVentas.tblPOSTotalesSubTotal.Value * ibsqlGetPorcDescFctSvr.FieldByName('Porciento').AsFloat / 100;
          dmVentas.tblPOSTotalesPorcDirTec.Value:=' '+ibsqlGetPorcDescFctSvr.FieldByName('Porciento').AsString+'%';
          dmFactura.stpInsertPorcOtrosCargosFServ.Params[4].Value:=ibsqlGetPorcDescFctSvr.FieldByName('Porciento').AsFloat;
          dmVentas.tblPOSTotalesTPorcDirTec.Value:=ibsqlGetPorcDescFctSvr.FieldByName('Porciento').AsFloat;          
         end;
      5: begin
          dmVentas.tblPOSTotalesMontoDescItbisDirTecnica.Value:=
          dmVentas.tblPOSTotalesMontoDescDirtecnica.Value * ibsqlGetPorcDescFctSvr.FieldByName('Porciento').AsFloat / 100;
          dmVentas.tblPOSTotalesPorcItbisDirTec.Value:=' '+ibsqlGetPorcDescFctSvr.FieldByName('Porciento').AsString+'%';
          dmFactura.stpInsertPorcOtrosCargosFServ.Params[5].Value:=ibsqlGetPorcDescFctSvr.FieldByName('Porciento').AsFloat;
          dmVentas.tblPOSTotalesTPorcItbisDirTec.Value:=ibsqlGetPorcDescFctSvr.FieldByName('Porciento').AsFloat;
         end;
    end;//case
  end;//for
  dmVentas.tblPOSTotalesMontoDescImprevisto.Value:= 0;
  dmVentas.tblPOSTotalesMontoDescItbisImprevisto.Value:= 0;
  if CheckBox2.Checked then
  begin
    dmVentas.tblPOSTotalesMontoDescImprevisto.Value:=
    dmVentas.tblPOSTotalesSubTotal.Value * 4 / 100;
    dmVentas.tblPOSTotalesMontoDescItbisImprevisto.Value :=
    dmVentas.tblPOSTotalesMontoDescImprevisto.Value * porItbi/100;
    dmVentas.tblPOSTotalesPorcImprevisto.Value:=' 4%';
    dmVentas.tblPOSTotalesPorcItbisImprevisto.Value:=' '+FloatToStr(porItbi)+'%';
    dmVentas.tblPOSTotalesTPorcItbisImprevisto.Value:=porItbi;
    dmFactura.stpInsertPorcOtrosCargosFServ.Params[7].Value:=4;
    dmVentas.tblPOSTotalesTPorcImprevisto.Value:=4;
  end;
{t
  if (dmVentas.tblPOSTotalesmontosuMontoSubTotalIndirectos.Value > 0) then
  begin
    DBText8.Visible := True;
    DBText8.BringToFront;
    Label29.Visible:=True;
    Label29.BringToFront;
  end;
  }
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

procedure TfrmProcVentaRapida.CheckBox2Exit(Sender: TObject);
begin
  if rxVenta.RecordCount = 0 then exit;
 // if CheckBox2.Checked then
 // CheckBox3.Checked:=False;
  //if (checkbox2.Checked) And (rxVentaCant.Value > 0) then
  //begin
    if (rxVenta.State = dsBrowse) then
    rxVenta.Edit;

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

procedure TfrmProcVentaRapida.CargarDatosAModificar;
var
  xDesc : String;
  x: integer;
begin
  if ((UpperCase(GLBFormatoFactura) = 'INGESERVIS')) then
  rdgFactServicio.Checked:=true;//Debe cargar esto desde la tabla
  BitBtn18.Enabled := rdgFactServicio.Checked;
  if (dmVentas.tblPOSTotalesmontorecibido.Value > 0) And (rxVenta.RecordCount > 0) then
  begin
    MessageDlg('Favor procesar o cancelar venta en progreso', mtInformation, [mbOK], 0);
    Exit;
  end;
  //if (dmVentas.tblPOSTotales.RecordCount > 0) then
  //begin
    dmVentas.tblPOSTotales.Close;
    dmVentas.tblPOSTotales.Open;
    Edit1.Text:='';
    dmVentas.tblPOSTotales.Close;
    dmVentas.tblPOSTotales.Open;
    dmVentas.tblPOSTotales.Insert;
    dmVentas.tblPOSTotalesMoneda.Value   := Trim(dmFactura.qryVentaFacturaMONEDA.Value); // IntToStr(GlbMonedaBase);

    if Not dmFactura.qryVentaFacturaTIPONCFIFISCAL.IsNull then
    AsignaNCFCFinalX(dmFactura.qryVentaFacturaTIPONCFIFISCAL.Value);

    dmVentas.tblPOSTotalesSubTotal.Value := 0;
    dmVentas.tblPOSTotalesitbis.Value    := 0;
    dmVentas.tblPOSTotalesmontodesc.Value:= 0;
    dmVentas.tblPOSTotalestotalneto.Value:= 0;
    dmVentas.tblPOSTotalesmontorecibido.Value:= 0;
    dmVentas.tblPOSTotalesdevolucion.Value   := 0;
    dmVentas.tblPOSTotalesmontorecibido.Value:= dmFactura.qryVentaFacturaMONTO_PAGADO.Value;
    dmVentas.tblPOSTotalesFechaVence.Value   := dmFactura.qryVentaFacturaFechaVence.Value;
    dmVentas.tblPOSTotalesPropina.Value :=  dmFactura.qryVentaFacturaPROPINA.Value;
    dmVentas.tblPOSTotalesPropinaLegal.Value:= dmFactura.qryVentaFacturaPROPINALEGAL.Value;

    //if Not dmFactura.qryVentaFacturaPROPINALEGAL.IsNull then
    //t GlbPorcPropina := dmFactura.qryVentaFacturaPROPINALEGAL.Value;
    
    if Not dmFactura.qryVentaFacturaTIPONCFIFISCAL.IsNull then
    AsignaNCFCFinalX(dmFactura.qryVentaFacturaTIPONCFIFISCAL.Value);

    GlbSalvarQuery(dmVentas.tblPOStotales);
    lblProcDev.Visible := False;
  //end;
  EsModificandoFactura     := True;
  bitBtnEditarFact.Visible := True;
  bitBtnEditarFact.Top     := 475;
  bitBtnEditarFact.BringToFront;
  Label36.Visible := True;
  if EsDevolucion then
  Label36.Caption := 'NCR a Fct#:' + dmFactura.qryVentaFacturaNUMERO_FACTURA.AsString
  else
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
       rxVentaCantPax.Value  := Abs(dmFactura.qryVentaFacturaDetCANT_VIAJES.AsInteger);
       //vuelveAQUI JRD para itbis recargo
       rxVentaPrecio.Value:= Abs(dmFactura.qryVentaFacturaDetPRECIO.Value);
       rxVentaporc_desc.Value      := Abs(dmFactura.qryVentaFacturaDetPORC_DESC_DET.Value);
       rxVentaglbcodVendedor.Value := dmFactura.qryVentaFacturaCODIGO_VENDEDOR.Value;
       rxVentaPorcDescItem.Value   := Abs(dmFactura.qryVentaFacturaDetPORC_DESC_ITEM.Value);
       rxVentaMontoDescItem.Value  := Abs(dmFactura.qryVentaFacturaDetMONTO_DESC_ITEM.Value);
       rxVentaDescripcion.Value := dmFactura.qryVentaFacturaDetDESCRIPCION.Value;
       rxVentaDescripcionEspecial.Value := dmFactura.qryVentaFacturaDetDESCRIPCIONPRODUCTO.Value;
       rxVentaTipoVenta.Value   := dmFactura.qryVentaFacturaDetTIPO_VENTA.Value;
       rxVentaTipoUnidad.Value  := dmFactura.qryVentaFacturaDetTIPO_UNIDAD.Value;
       xDesc := StringReplace(rxVentaDescripcionEspecial.Value, rxVentaDescripcion.Value, '',
                             [rfReplaceAll, rfIgnoreCase]);
       if (Length(xDesc) > 4) then
       rxVentaDescripcionEspecial.Value := xDesc
       else
       rxVentaDescripcionEspecial.Value := '';

       rxVentaItbisExento.Value:=Abs(dmfactura.qryVentaFacturaDetITBIS_EXENTO.Value);// qryProductosPAGA_ITBI.Value;

       rxVentaReferencia.Value := qryProductosREFERENCIA.Value;
       if dmVentas.tblPOSTotales.State = dsBrowse then
       begin
         dmVentas.tblPOSTotales.AutoCalcFields:=False;
         dmVentas.tblPOSTotales.Edit;
       end;
       if GLBEsFastFood then
       if ABS(dmFactura.qryVentaFacturaPROPINALEGAL.Value) = 0 then
       chkNoLeyPropina.Checked:=True
       else chkNoLeyPropina.Checked:= False;

       dmVentas.tblPOSTotalesCodCliente.Value:=dmFactura.qryVentaFacturaCODIGO_CTE.Value;
       dmVentas.tblPOSTotalesComentario.Value := dmfactura.qryVentaFacturaCOMENTARIO.Value;

       dmVentas.tblPOSTotalesPorcDesAdicional.Value:= dmFactura.qryVentaFacturaPORC_DESCUENTO.Value;
       if dmVentas.tblPOSTotalesPorcDesAdicional.Value > 0 then
       chKDescuentoGlobal.Checked:=True;

       if dmVentas.tblPOSTotales.State = dsBrowse then
       dmVentas.tblPOSTotales.Edit;
       dmVentas.tblPOSTotalesRecargo.Value := dmFactura.qryVentaFacturaMONTO_RECARGO.Value;

       if (EsDevolucion) then
       dmVentas.tblPOSTotalesRecargo.Value := dmVentas.tblPOSTotalesRecargo.Value * -1;

       dmVentas.tblPOSTotalesMontoDescAdicional.Value := dmFactura.qryVentaFacturaMONTO_DESCUENTO.Value;
       if dmVentas.tblPOSTotales.State = dsBrowse then
          dmVentas.tblPOSTotales.Edit;
       //volver aqui
       if not dmFactura.qryGetNcfAsignadoTIPO_NCF.IsNull and
       dmVentas.tblPOSTotalesTipoNCF.IsNull then
       dmVentas.tblPOSTotalesTipoNCF.Value:= dmFactura.qryGetNcfAsignadoTIPO_NCF.Value;
       //dmVentas.tblPOSTotalesTipoNCFIFiscal.Value:= dmFactura.qryVentaFacturaTIPONCFIFISCAL.Value;
       //dmfactura.qryVentaFacturaTIPONCFIFISCAL
       RxDBLookupCombo3.Visible:=True;
       if dmFactura.ibQryViewNCF.Locate('TIPO_CF', dmVentas.tblPOSTotalesTipoNCF.Value,[]) then
         dmVentas.tblPOSTotalesTipoNCFIFiscal.Value := dmFactura.ibQryViewNCFTIPO_NCF_IFISCAL.Value
       else
       dmVentas.tblPOSTotalesTipoNCFIFiscal.AsVariant := null;

       GlbSalvarQuery(dmVentas.tblPOStotales);
       //dmVentas.tblPOSTotalesTipoNCFIFiscal.ReadOnly := true;

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

       if (dmInventario.qryTipoUnidad.Locate('idunidad', dmFactura.qryVentaFacturaDetTIPO_UNIDAD.Value ,[])) then
       begin
         cboxTipoUnidad.Text:= dmInventario.qryTipoUnidadDESCRIPCION.Value;
         cantUnidad := dmInventario.qryTipoUnidadCANTIDAD.Value;
       end;

       if (rxVenta.State = dsBrowse) then
       rxVenta.Edit;

       edtObservacion.Text := dmfactura.qryVentaFacturaNOMBRE_CLIENTE_GENERAL.Value;
       if GlbcodVendedor > 0 then
          rxVentaCodUsuario.Value := GlbcodVendedor
       else
       rxVentaCodUsuario.Value := VarUsuarioGlb;

       dmVentas.tblPOSTotales.AutoCalcFields:=True;

       CheckBox2Exit(Self);
       DBEdit2Exit(Self);
       if rxVenta.State In [dsInsert,dsEdit] then
          GlbSalvarQuery(rxVenta);
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
  DBEdit1Exit(Self);
  DBEdit3Exit(Self);
  Refresh;
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
    stpUpdateVentaDetU1.Params[33].Value := rxVentaCantPax.Value;
    
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
  stpProc_UpdateVENTAS_MAST_U1.Params[8].AsString := dmVentas.tblPOSTotalestotalneto.AsString; //EditN1.Text;
  stpProc_UpdateVENTAS_MAST_U1.Params[9].Value    := 'A';
  stpProc_UpdateVENTAS_MAST_U1.Params[10].Value   := Now;
  stpProc_UpdateVENTAS_MAST_U1.Params[11].Value   := strusername;
  stpProc_UpdateVENTAS_MAST_U1.Params[12].Value   := dmfactura.qryVentaFacturaNUMERO_FACTURA.Value;
  stpProc_UpdateVENTAS_MAST_U1.Params[13].Value:= dmfactura.qryVentaFacturaNUMERO_DOC_PAGO.Value;
  stpProc_UpdateVENTAS_MAST_U1.Params[14].Value:= serieNcfAsignado; //dmfactura.qryVentaFacturaSERIE_NCF_ASIGNADO.Value;
  stpProc_UpdateVENTAS_MAST_U1.Params[15].Value:= dmVentas.tblPOSTotalesSubTotal.Value;
  stpProc_UpdateVENTAS_MAST_U1.Params[16].Value:= dmVentas.tblPOSTotalesPorcientoInteres.Value;
  if dmVentas.tblPOSTotalesMontoDescAdicional.Value > 0 then
  stpProc_UpdateVENTAS_MAST_U1.Params[17].Value:= dmVentas.tblPOSTotalesMontoDescAdicional.Value
  else
  stpProc_UpdateVENTAS_MAST_U1.Params[17].Value:= dmVentas.tblPOSTotalesMontoDescItems.Value;
  stpProc_UpdateVENTAS_MAST_U1.Params[18].Value:= 0;//Null;//dmVentas.tblPOSTotalesmontorecibido.Value;//monto inicial
  stpProc_UpdateVENTAS_MAST_U1.Params[19].Value:= edtObservacion.Text;
  //stpProc_UpdateVENTAS_MAST_U1.Params[19].Value:= dmVentas.tblPOSTotalesNombreCliente.Value;// dmVentas.tblPOSTotalesMontoDescAdicional.Value;
  stpProc_UpdateVENTAS_MAST_U1.Params[20].Value:= dmVentas.tblPOSTotalesmontorecibido.Value;
  stpProc_UpdateVENTAS_MAST_U1.Params[21].Value:= dmVentas.tblPOSTotalesdevolucion.Value;
  stpProc_UpdateVENTAS_MAST_U1.Params[22].Value:= dmVentas.tblPOSTotalesitbis.Value;
  stpProc_UpdateVENTAS_MAST_U1.Params[23].Value:= dmVentas.tblPOSTotalesMontoDescGastosAdmin.Value;
  stpProc_UpdateVENTAS_MAST_U1.Params[24].Value:= dmVentas.tblPOSTotalesMontoDescItbisGastosAdmin.Value;
  stpProc_UpdateVENTAS_MAST_U1.Params[25].Value:= dmVentas.tblPOSTotalesMontoDescTransp.Value;
  stpProc_UpdateVENTAS_MAST_U1.Params[26].Value:= dmVentas.tblPOSTotalesMontoDescDirtecnica.Value;
  stpProc_UpdateVENTAS_MAST_U1.Params[27].Value:= dmVentas.tblPOSTotalesMontoDescItbisDirTecnica.Value;
  stpProc_UpdateVENTAS_MAST_U1.Params[28].Value:= dmVentas.tblPOSTotalesMontoDescImprevisto.Value;
  stpProc_UpdateVENTAS_MAST_U1.Params[29].Value:= dmVentas.tblPOSTotalesMontoDescItbisImprevisto.Value;
  stpProc_UpdateVENTAS_MAST_U1.Params[30].Value:= dmVentas.tblPOSTotalesComentario.Value;
  stpProc_UpdateVENTAS_MAST_U1.Params[31].Value:= rxVentaNumeroCotiza.Value;
  stpProc_UpdateVENTAS_MAST_U1.Params[32].Value:= dmVentas.tblPOSTotalesRecargo.Value;
  stpProc_UpdateVENTAS_MAST_U1.Params[33].Value:= dmVentas.tblPOSTotalesMontoExoneraITBIS.Value;
  stpProc_UpdateVENTAS_MAST_U1.Params[34].Value:= dmVentas.tblPOSTotalesPropina.Value;
  stpProc_UpdateVENTAS_MAST_U1.Params[35].Value:= GlbPorcPropina;
  stpProc_UpdateVENTAS_MAST_U1.Params[36].Value:= dmVentas.tblPOSTotalesPropinaLegal.Value;
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
  stpProcUpdateFactU1.Params[7].Value := dmVentas.tblPOSTotalestotalneto.Value;
  stpProcUpdateFactU1.Params[8].Value := Null;
  stpProcUpdateFactU1.Params[9].Value := Null;
  stpProcUpdateFactU1.Params[10].Value :=Null;
  stpProcUpdateFactU1.Params[11].Value :=Now;
  stpProcUpdateFactU1.Params[12].Value :=StrUserName;
  stpProcUpdateFactU1.Params[13].Value := dmVentas.tblPOSTotalesFechaVence.Value;
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
  stpProcUpdateTrnCxcU1.Params[9].Value:= dmVentas.tblPOSTotalestotalneto.Value;
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

procedure TfrmProcVentaRapida.ActualizaBalanceCteCxc;
begin
  if esContado then exit;

  stpProcUpdateBlcCteCxc.Params[0].Value:= 0;//anular cargo anterior;
  stpProcUpdateBlcCteCxc.Params[1].Value:= dmVentas.tblPOSTotalesCodCliente.Value;
  stpProcUpdateBlcCteCxc.Params[2].Value:= 0;
  if dmVentas.tblPOSTotalesMoneda.IsNull then
  stpProcUpdateBlcCteCxc.Params[3].Value:= '1' //pesos
  else
  stpProcUpdateBlcCteCxc.Params[3].Value:= dmVentas.tblPOSTotalesMoneda.Value;
  
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
  stpProcUpdateBlcCteCxc.Params[1].Value:= dmVentas.tblPOSTotalesCodCliente.Value;
  stpProcUpdateBlcCteCxc.Params[2].Value:= 0;
  if dmVentas.tblPOSTotalesMoneda.IsNull then
  stpProcUpdateBlcCteCxc.Params[3].Value:= '1'//pesos
  else
  stpProcUpdateBlcCteCxc.Params[3].Value:= dmVentas.tblPOSTotalesMoneda.Value;
  
  stpProcUpdateBlcCteCxc.Params[4].Value:= dmVentas.tblPOSTotalestotalneto.Value;
  stpProcUpdateBlcCteCxc.Params[5].Value:= null;
  stpProcUpdateBlcCteCxc.Params[6].Value:= dmVentas.tblPOSTotalestotalneto.Value;
  stpProcUpdateBlcCteCxc.Params[7].Value:= dmVentas.tblPOSTotalestotalneto.Value;
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
  stpProcUpdateFActPendu1.Params[3].Value:= dmVentas.tblPOSTotalestotalneto.Value;
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
  flag :boolean;
begin
  esContado:=False;
  if (dmVentas.tblPOSTotalesSubTotal.Value <= 0) then
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

    if (dmVentas.tblPOSTotalesTipoNCFIFiscal.Value < 0) then
    begin
      MessageDlg('Verifique tipo NCF', mtError, [mbOk], 0);
      Exit;
    end;

  { if not VerificaLimiteCredito(dmVentas.tblPOSTotalesCodCliente.Value,dmVentas.tblPOSTotalesTotalNeto.Value) then
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

   dmVentas.tblPOSTotales.Edit; 
   dmVentas.tblPOSTotalesNombreCliente.Value := qryClienteNOMBRE_CTE.Value;
   dmVentas.tblPOSTotalesDireccion.Value     := qryClienteDIRECCION_CONT.Value;
   dmVentas.tblPOSTotalesTelefono.Value      := qryClienteTELEF_CONTACTO.Value;
   dmVentas.tblPOSTotalesCodCliente.Value    := qryClienteCODIGO_CTE.Value;
   dmVentas.tblPOSTotalesRNC_NUMERO.Value    := qryClienteRNC_NUMERO.Value;
   if (Not qryClienteCANT_DIAS_CREDITO.IsNull) And (qryClienteCANT_DIAS_CREDITO.Value > 0) Then
   dmVentas.tblPOSTotalesFechaVence.Value    := GlbFechaTrnDiaria + qryClienteCANT_DIAS_CREDITO.Value
   else
   dmVentas.tblPOSTotalesFechaVence.Value    := GlbFechaTrnDiaria + 15;//Default
   GlbSalvarQuery(dmVentas.tblPOStotales);

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
      if (GlbUsaPUnidadLevel = 1) then
      begin
        ibStpActualizaInvProd.Params[1].Value:= rxVentaCant.Value * CantUnidad;
      end else
      begin
        if (rxVentaTipoUnidad.Value = 3) Or (rxVentaTipoUnidad.Value = 0) then
           ibStpActualizaInvProd.Params[1].Value:= rxVentaCant.Value
        else
        begin
          ibStpActualizaInvProd.Params[1].Value:= rxVentaCant.Value * CantUnidad;
        end;
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
      if (GlbUsaPUnidadLevel = 1) then
      begin
        //ibStpActualizaInvProd.Params[1].Value:= rxVentaCant.Value * CantUnidad;
        ibStpActualizaInvProd.Params[1].Value:= (dmfactura.qryVentaFacturaDetCANTIDAD.Value - rxVentaCant.Value) * CantUnidad;
      end else
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
      if (GlbUsaPUnidadLevel = 1) then
      begin
        //ibStpActualizaInvProd.Params[1].Value:= rxVentaCant.Value * CantUnidad;
        ibStpActualizaInvProd.Params[1].Value:= (dmfactura.qryVentaFacturaDetCANTIDAD.Value - rxVentaCant.Value) * CantUnidad;
      end else
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
      if (GlbUsaPUnidadLevel = 1) then
      begin
        ibStpActualizaInvProd.Params[1].Value:= rxVentaCant.Value * CantUnidad;
        //ibStpActualizaInvProd.Params[1].Value:= (dmfactura.qryVentaFacturaDetCANTIDAD.Value - rxVentaCant.Value) * CantUnidad;
      end else
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
    try
    ActualizaInvAlmacen;//Actualiza Division Inventario
    except
    end;
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
  //dmVentas.tblPOSTotales.EmptyTable;
  //dmVentas.tblPOSTotales.Close;
  //dmVentas.tblPOSTotales.Open;

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

            if dmFactura.qryVentaFacturaDet.RecordCount = 1 then
            qckRepFactPuntoVenta.Page.Length:= 5
            else
            if dmFactura.qryVentaFacturaDet.RecordCount >= 2 then
            qckRepFactPuntoVenta.Page.Length:= qckRepFactPuntoVenta.Page.Length +
            (dmFactura.qryVentaFacturaDet.RecordCount - 1 ) * 0.25;

            flag:=true;
            qckRepFactPuntoVenta.Prepare;
            rxventa.DisableControls;
            rxdbgrid1.Enabled:=False;
            if (dmFactura.qryVentaFacturaDet.RecordCount > 1) or (qckRepFactPuntoVenta.PageNumber > 1) then
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
   end;
   //***************************** end ************************************
  //end;
  bitBtnEditarFact.Enabled  := True;
  
  lblFechaCotizacion.Visible:= False;
  dbFechaCotizacion.Visible := False;
  Label36.Visible := False;
  Label36.caption:='';
       label29.Top:= 413;
       dbTextMontoExoneraITBIS.Top := 410;
       label41.Visible := True;
       DBText15.Visible:= True;  
  rdgFactServicio.Checked := False;
  GlbUsandoCotiza:= False;
  esContado :=False;
  dmVentas.tblPOSTotales.Close;
  dmVentas.tblPOSTotales.Open;

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
      bitBtnEditarFact.Top := BitBtn6.Top;
      bitBtnEditarFact.Left:= BitBtn6.Left;
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
  dmVentas.tblPOSTotales.Edit;
  DBEdit7.SetFocus;
  DBStatusLabel1.Visible:=True;
end;

procedure TfrmProcVentaRapida.DBEdit7Exit(Sender: TObject);
begin
  if dmVentas.tblPOSTotales.State in [dsEdit, dsInsert] then
  GlbSalvarQuery(dmVentas.tblPOStotales);
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
      NumeroTrn := dmFactura.qryVentaFacturaNUMERO_Factura.Value;
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
    else 
    TipoVenta := 'CREDITO';

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
    if (GlBAyaco= 1) then
    begin
      dmreportes.qryViewVentasMast.Close;
      dmreportes.qryViewVentasMast.Params[0].Value:= dmfactura.qryVentaFacturaNUMERO.Value;
      dmreportes.qryViewVentasMast.Open;
      qckFactServ8_5Ayaco:=TqckFactServ8_5Ayaco.Create(Nil);
      try
        qckFactServ8_5Ayaco.TPag.Caption:=
        IntToStr(qckFactServ8_5Ayaco.PageNumber);
        qckFactServ8_5Ayaco.xtipoVenta := TipoVenta;//dmFactura.qryVentaFactura.sql.text
        qckFactServ8_5Ayaco.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;
        if (GlbImpReciboSinPreg = 1) then
           qckFactServ8_5Ayaco.Print
        else
        if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
        begin
          qckFactServ8_5Ayaco.PrinterSetup;
          qckFactServ8_5Ayaco.Print;
        end else
        qckFactServ8_5Ayaco.Preview;

        if (GlbImpReciboSinPreg = 0) then
        if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
        begin
          qckFactServ8_5Ayaco.Preview;
        end;
        finally
        qckFactServ8_5Ayaco.Free;
        qckFactServ8_5Ayaco:=Nil;
        end;
      end else
    if (GlBBurgos = 1) then
    begin
      dmreportes.qryViewVentasMast.Close;
      dmreportes.qryViewVentasMast.Params[0].Value:= dmfactura.qryVentaFacturaNUMERO.Value;
      dmreportes.qryViewVentasMast.Open;    
      qckFactServ8_5BB:=TqckFactServ8_5BB.Create(Nil);
      try
        qckFactServ8_5BB.TPag.Caption:=
        IntToStr(qckFactServ8_5BB.PageNumber);
        qckFactServ8_5BB.xtipoVenta := TipoVenta;
        qckFactServ8_5BB.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;
        if (GlbImpReciboSinPreg = 1) then
           qckFactServ8_5BB.Print
        else
        if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
        begin
          qckFactServ8_5BB.PrinterSetup;
          qckFactServ8_5BB.Print;
        end else
        qckFactServ8_5BB.Preview;

        if (GlbImpReciboSinPreg = 0) then
        if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
        begin
          qckFactServ8_5BB.Preview;
        end;
        finally
        qckFactServ8_5BB.Free;
        qckFactServ8_5BB:=Nil;
        end;
      end else
    if (UpperCase(GLBFormatoFactura) = 'CASANDRA2') or ((UpperCase(GLBFormatoFactura) = 'FORMATOGENERAL')) then  //PENDIENTE DE ANALISIS
    begin
      if (GlbRec3Pulg = 1) then
      //and (8=9)) then //temporals
      begin
{        RxDBGrid1.DataSource:= datasource3;
        dbtext1.DataField:='';
        dbtext1.DataSource:= datasource3;
        dbedit1.DataField:='';
        dbedit1.DataSource:= datasource3;
        dbedit2.DataField:='';
        dbedit2.DataSource:= datasource3;
        dbedit3.DataField:='';
        dbedit3.DataSource:= datasource3;}
//      qckRepReciboReimpFFoodPOS
        //qckRepReciboReimpTicketSurtidora
        if (GlbUsaPUnidadLevel = 1) then
        begin
          if (TipoVenta = 'CONTADO') then
          begin
            qckRepReciboReimpTicketSurtidora:=tqckRepReciboReimpTicketSurtidora.Create(Nil);
            try
             qckRepReciboReimpTicketSurtidora.strcopia :=' (COPIA)';
             if GlbImpCodProducto = 0 then
             begin
               qckRepReciboReimpTicketSurtidora.QRSubDetail1.Height := 20;
               qckRepReciboReimpTicketSurtidora.QRLabel26.Enabled := False;
               //qckRepReciboReimpTicketSurtidora.QRDBText20.Enabled:= False;
             end;

             qckRepReciboReimpTicketSurtidora.ncfDesc := GlbDescNCF;
             if Length(edtObservacion.Text) > 0 then
             qckRepReciboReimpTicketSurtidora.nombreCteGenerico:=edtObservacion.Text;
             if (tablaPropietarioCodigoPropietario.value > 0) then
             begin
               qckRepReciboReimpTicketSurtidora.qrLabelRNC.Caption:='RNC-' + qryClienteRNC_NUMERO.Value;
               qckRepReciboReimpTicketSurtidora.nombreCteGenerico:= qryClienteNOMBRE_CTE.Value;
             end
             else qckRepReciboReimpTicketSurtidora.qrLabelRNC.Caption:='';
            //RxDBGrid1.Visible:=False;
            //RxDBGrid1.DataSource:=DataSource2;
            qckRepReciboReimpTicketSurtidora.xtipoVenta := TipoVenta;
            qckRepReciboReimpTicketSurtidora.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;
            pulgadaInc:=0.86;
            //temporal
            //{
            if dmFactura.qryVentaFacturaDet.RecordCount = 1 then
            qckRepReciboReimpTicketSurtidora.Page.Length:= 5
            else
            if dmFactura.qryVentaFacturaDet.RecordCount >= 2 then
            qckRepReciboReimpTicketSurtidora.Page.Length:= qckRepReciboReimpTicketSurtidora.Page.Length +
            (dmFactura.qryVentaFacturaDet.RecordCount - 1 ) * 0.25;

            flag:=true;
            qckRepReciboReimpTicketSurtidora.Prepare;
            rxventa.DisableControls;
            rxdbgrid1.Enabled:=False;
            if (dmFactura.qryVentaFacturaDet.RecordCount > 1) or (qckRepReciboReimpTicketSurtidora.PageNumber > 1) then
            begin
              repeat
              begin
                if (qckRepReciboReimpTicketSurtidora.PageNumber > 1) then
                begin
                  qckRepReciboReimpTicketSurtidora.Page.Length:=qckRepReciboReimpTicketSurtidora.Page.Length + 0.25;
                  qckRepReciboReimpTicketSurtidora.Prepare;
                  flag:=False;
                end else break;
              end;
              until flag = true;
            end;
            rxventa.EnableControls;
            rxdbgrid1.Enabled:=True;
            dmreportes.qryViewVentasMast.Close;
            dmreportes.qryViewVentasMast.Params[0].Value:= ipStpInsertVentMast.Params[0].Value;
            dmreportes.qryViewVentasMast.Open;

{            RxDBGrid1.DataSource:= dstblPOSTotales;
            dbtext1.DataField:='Descripcion';
            dbtext1.DataSource:= dstblPOSTotales;
            dbedit1.DataSource:= dstblPOSTotales;
            dbedit1.DataField:='Cant';
            dbedit2.DataSource:= dstblPOSTotales;
            dbedit2.DataField:='Precio';
            dbedit3.DataSource:= dstblPOSTotales;
            dbedit3.DataField:='MontoBruto';

 }           RxDBGrid1.Visible:=True;
            //if ImprimirRecibo1.Checked then
            //begin

            if (GlbImpReciboSinPreg = 1) and (GlbImprimeReciboFact = 1) then
            qckRepReciboReimpTicketSurtidora.Print
            else
            if MessageDlg('Imprimir?',mtInformation, [mbYes, mbNo], 0)=mryes then
            begin
              if (GlbImprimeReciboFact = 1) then
              begin
                qckRepReciboReimpTicketSurtidora.PrinterSetup;
               qckRepReciboReimpTicketSurtidora.Print;
              end;
            end else
            qckRepReciboReimpTicketSurtidora.Preview;
            reciboImpreso:=True;
            finally
            qckRepReciboReimpTicketSurtidora.Free;
            qckRepReciboReimpTicketSurtidora:=Nil;
            end;
          end
          else
          if (TipoVenta = 'CREDITO') then
          begin
            qckRepFactPuntoVenta:=TqckRepFactPuntoVenta.Create(Nil);
            try
              qckRepFactPuntoVenta.QRLabel14.Enabled:=True;

            pulgadaInc:=0.86;
            //temporal
            //{
            if dmFactura.qryVentaFacturaDet.RecordCount = 1 then
            qckRepFactPuntoVenta.Page.Length:= 5
            else
            if dmFactura.qryVentaFacturaDet.RecordCount >= 2 then
            qckRepFactPuntoVenta.Page.Length:= qckRepFactPuntoVenta.Page.Length +
            (dmFactura.qryVentaFacturaDet.RecordCount - 1 ) * 0.25;

            flag:=true;
            qckRepFactPuntoVenta.Prepare;
            rxventa.DisableControls;
            rxdbgrid1.Enabled:=False;
            if (dmFactura.qryVentaFacturaDet.RecordCount > 1) or (qckRepFactPuntoVenta.PageNumber > 1) then
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
            begin
              qckRepFactPuntoVenta.Print;
            end else
            qckRepFactPuntoVenta.Preview;
            finally
            qckRepFactPuntoVenta.Free;
            qckRepFactPuntoVenta:=Nil;
            end;
          end;//final surtidora
        end else
        if GLBEsFastFood then
        begin
          {if (TipoVenta = 'CONTADO') then
          AbrirDatosParaTicket(false,false,dmReportes.qryViewVentasMastCODIGO_CTE.AsString,dmReportes.qryViewVentasMastNUMERO_DOC_PAGO.AsInteger,
          dmReportes.qryViewVentasMastFECHA.Value)
          else
          if (TipoVenta = 'CREDITO') then
          AbrirDatosParaTicket(false,true,dmReportes.qryViewVentasMastCODIGO_CTE.AsString,dmReportes.qryViewVentasMastNUMERO_FACTURA.AsInteger,
          dmReportes.qryViewVentasMastFECHA.Value);
           }
          if (TipoVenta = 'CONTADO') then
          begin
            qckRepReciboReimpFFoodPOS:=TqckRepReciboReimpFFoodPOS.Create(Nil);
            try
             qckRepReciboReimpFFoodPOS.strcopia :=' (COPIA)';
             if GlbImpCodProducto = 0 then
             begin
               qckRepReciboReimpFFoodPOS.QRSubDetail1.Height := 20;
               qckRepReciboReimpFFoodPOS.QRLabel26.Enabled := False;
               qckRepReciboReimpFFoodPOS.QRDBText20.Enabled:= False;
             end;

             qckRepReciboReimpFFoodPOS.ncfDesc := GlbDescNCF;
             if Length(edtObservacion.Text) > 0 then
             qckRepReciboReimpFFoodPOS.nombreCteGenerico:=edtObservacion.Text;
             if (tablaPropietarioCodigoPropietario.value > 0) then
             begin
               //qckRepReciboReimpFFoodPOS.qrLabelRNC.Caption:='RNC-' + qryClienteRNC_NUMERO.Value;
               //qckRepReciboReimpFFoodPOS.nombreCteGenerico:= qryClienteNOMBRE_CTE.Value;
             end;
             //else qckRepReciboReimpFFoodPOS.qrLabelRNC.Caption:='';
            //RxDBGrid1.Visible:=False;
            //RxDBGrid1.DataSource:=DataSource2;
            qckRepReciboReimpFFoodPOS.xtipoVenta := TipoVenta;
            qckRepReciboReimpFFoodPOS.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;
            pulgadaInc:=0.86;
            //temporal
            //{
            if dmFactura.qryVentaFacturaDet.RecordCount = 1 then
            qckRepReciboReimpFFoodPOS.Page.Length:= 5
            else
            if dmFactura.qryVentaFacturaDet.RecordCount >= 2 then
            qckRepReciboReimpFFoodPOS.Page.Length:= qckRepReciboReimpFFoodPOS.Page.Length +
            (dmFactura.qryVentaFacturaDet.RecordCount - 1 ) * 0.22;

            flag:=true;
            qckRepReciboReimpFFoodPOS.Prepare;
            rxventa.DisableControls;
            rxdbgrid1.Enabled:=False;
            if (dmFactura.qryVentaFacturaDet.RecordCount > 1) or (qckRepReciboReimpFFoodPOS.PageNumber > 1) then
            begin
              repeat
              begin
                if (qckRepReciboReimpFFoodPOS.PageNumber > 1) then
                begin
                  qckRepReciboReimpFFoodPOS.Page.Length:=qckRepReciboReimpFFoodPOS.Page.Length + 0.25;
                  qckRepReciboReimpFFoodPOS.Prepare;
                  flag:=False;
                end else break;
              end;
              until flag = true;
            end;
            rxventa.EnableControls;
            rxdbgrid1.Enabled:=True;
            dmreportes.qryViewVentasMast.Close;
            dmreportes.qryViewVentasMast.Params[0].Value:= ipStpInsertVentMast.Params[0].Value;
            dmreportes.qryViewVentasMast.Open;

{            RxDBGrid1.DataSource:= dstblPOSTotales;
            dbtext1.DataField:='Descripcion';
            dbtext1.DataSource:= dstblPOSTotales;
            dbedit1.DataSource:= dstblPOSTotales;
            dbedit1.DataField:='Cant';
            dbedit2.DataSource:= dstblPOSTotales;
            dbedit2.DataField:='Precio';
            dbedit3.DataSource:= dstblPOSTotales;
            dbedit3.DataField:='MontoBruto';
 }
            RxDBGrid1.Visible:=True;
            //if ImprimirRecibo1.Checked then
            //begin

            if (GlbImpReciboSinPreg = 1) and (GlbImprimeReciboFact = 1) then
            qckRepReciboReimpFFoodPOS.Print
            else
            if MessageDlg('Imprimir?',mtInformation, [mbYes, mbNo], 0)=mryes then
            begin
              if (GlbImprimeReciboFact = 1) then
              begin
                qckRepReciboReimpFFoodPOS.PrinterSetup;
               qckRepReciboReimpFFoodPOS.Print;
              end;
            end else
            qckRepReciboReimpFFoodPOS.Preview;
            reciboImpreso:=True;
            finally
            qckRepReciboReimpFFoodPOS.Free;
            qckRepReciboReimpFFoodPOS:=Nil;
            end;
          end
          else
          if (TipoVenta = 'CREDITO') then
          begin
            qckRepFactPuntoVenta:=TqckRepFactPuntoVenta.Create(Nil);
            try
              qckRepFactPuntoVenta.QRLabel14.Enabled:=True;

            pulgadaInc:=0.86;
            //temporal
            //{
            if dmFactura.qryVentaFacturaDet.RecordCount = 1 then
            qckRepFactPuntoVenta.Page.Length:= 5
            else
            if dmFactura.qryVentaFacturaDet.RecordCount >= 2 then
            qckRepFactPuntoVenta.Page.Length:= qckRepFactPuntoVenta.Page.Length +
            (dmFactura.qryVentaFacturaDet.RecordCount - 1 ) * 0.25;

            flag:=true;
            qckRepFactPuntoVenta.Prepare;
            rxventa.DisableControls;
            rxdbgrid1.Enabled:=False;
            if (dmFactura.qryVentaFacturaDet.RecordCount > 1) or (qckRepFactPuntoVenta.PageNumber > 1) then
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
            begin
              qckRepFactPuntoVenta.Print;
            end else
            qckRepFactPuntoVenta.Preview;
            finally
            qckRepFactPuntoVenta.Free;
            qckRepFactPuntoVenta:=Nil;
            end;
          end;
        end else //recibo retail
        begin
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
      //rxventa.DisableControls;
        rxdbgrid1.Enabled := False;
        if rxVenta.RecordCount = 1 then
        qckRepReciboReimp.Page.Length:= 5
        else
        if dmFactura.qryVentaFacturaDet.RecordCount >= 2 then
        qckRepReciboReimp.Page.Length:= qckRepReciboReimp.Page.Length +
        (dmFactura.qryVentaFacturaDet.RecordCount - 1 ) * 0.25;

        flag:= True;
        qckRepReciboReimp.Prepare;
        //rxventa.DisableControls;
        //rxdbgrid1.Enabled:=False;
        if (dmFactura.qryVentaFacturaDet.RecordCount > 1) OR (qckRepReciboReimp.PageNumber > 1) then
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
        {t if (dmFactura.qryVentaFacturaDet.RecordCount > 1) or (qckRepReciboReimp.PageNumber > 1) then
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
        end; }//t
        rxventa.EnableControls;
        rxdbgrid1.Enabled:=True;
        dmreportes.qryViewVentasMast.Close;
        dmreportes.qryViewVentasMast.Params[0].Value:= ipStpInsertVentMast.Params[0].Value;
        dmreportes.qryViewVentasMast.Open;

{        RxDBGrid1.DataSource:= dstblPOSTotales;
        dbtext1.DataField:='Descripcion';
        dbtext1.DataSource:= dstblPOSTotales;
        dbedit1.DataSource:= dstblPOSTotales;
        dbedit1.DataField:='Cant';
        dbedit2.DataSource:= dstblPOSTotales;
        dbedit2.DataField:='Precio';
        dbedit3.DataSource:= dstblPOSTotales;
        dbedit3.DataField:='MontoBruto';

 }       RxDBGrid1.Visible:=True;
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
        end;
      end else
      begin
        if dmFactura.qryVentaFactura.RecordCount = 1 then
        begin
        //Formato 5.5
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

procedure TfrmProcVentaRapida.CrearNCreditoEnDevolucion;
begin
  exit;//de forma temporal hasta que analice bien
  frmTransCxcProc_R:=TfrmTransCxcProc_R.Create(Nil);
  try
    frmTransCxcProc_R.CodCte := FrmBuscarClientesPersonas.CodigoCliente;
    frmTransCxcProc_R.Pagecontrol1.ActivePage := frmTransCxcProc_R.TabSheet1;
    frmTransCxcProc_R.Pagecontrol1.ActivePageIndex:=0;
    frmTransCxcProc_R.edtMontoAcobrar.SetFloat(Abs(dmVentas.tblPOSTotalestotalneto.Value));
    frmTransCxcProc_R.Showmodal;
  finally
  frmTransCxcProc_R.Free;
  frmTransCxcProc_R:=Nil;
  end;
end;

procedure TfrmProcVentaRapida.ActualizaCotizacionMaster;
begin
  if not dmVentas.tblPOSTotalesFechaCotizacion.IsNull then
  ibstpUpdateCotizaMaster.Params[1].Value:= dmVentas.tblPOSTotalesFechaCotizacion.Value //GlbFechaTrnDiaria;
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
  if dmVentas.tblPOSTotalesMoneda.IsNull then
  ibstpUpdateCotizaMaster.Params[6].Value:= '1'
  else
  ibstpUpdateCotizaMaster.Params[6].Value:=dmVentas.tblPOSTotalesMoneda.Value;
  
  ibstpUpdateCotizaMaster.Params[7].Value:= dmVentas.tblPOSTotalestotalneto.Value;//EditN1.Text;
  ibstpUpdateCotizaMaster.Params[8].Value   := 'A';
  ibstpUpdateCotizaMaster.Params[9].Value   := Now;
  ibstpUpdateCotizaMaster.Params[10].AsString := Trim(StrUserName);
  ibstpUpdateCotizaMaster.Params[11].Value    := Null;
  ibstpUpdateCotizaMaster.Params[12].Value    := Null;
  ibstpUpdateCotizaMaster.Params[13].Value    := null;
  ibstpUpdateCotizaMaster.Params[14].Value    := null;
  ibstpUpdateCotizaMaster.Params[15].Value    := null;
  ibstpUpdateCotizaMaster.Params[16].Value    := dmVentas.tblPOSTotalesSubTotal.Value;
  ibstpUpdateCotizaMaster.Params[17].Value    := dmVentas.tblPOSTotalesPorcDesAdicional.Value;
  if dmVentas.tblPOSTotalesMontoDescAdicional.Value > 0 then
  ibstpUpdateCotizaMaster.Params[18].Value    := dmVentas.tblPOSTotalesMontoDescAdicional.Value
  else
  ibstpUpdateCotizaMaster.Params[18].Value    := dmVentas.tblPOSTotalesMontoDescItems.Value;//dmVentas.tblPOSTotalesMontoDescAdicional.Value;//dmVentas.tblPOSTotalesmontodesc.value;

  if ((rxVentaCantPax.Value >0) or (UpperCase(GLBFormatoFactura) = 'BYMSERVICIOS'))
    And (Edit1.Text <> '') then
  ibstpUpdateCotizaMaster.Params[19].Value := StrToFloat(Edit1.Text)
  else
  ibstpUpdateCotizaMaster.Params[19].Value    := 0;

  if (edtObservacion.Text <> '') then
  ibstpUpdateCotizaMaster.Params[20].Value    := edtObservacion.Text
  else
  ibstpUpdateCotizaMaster.Params[20].Value    := null;
  ibstpUpdateCotizaMaster.Params[21].Value    := 0;
  ibstpUpdateCotizaMaster.Params[22].Value    := 0;
  ibstpUpdateCotizaMaster.Params[23].Value    := dmVentas.tblPOSTotalesitbis.Value;//montototalitbis
  ibstpUpdateCotizaMaster.Params[24].Value    := dmVentas.tblPOSTotalesMontoDescGastosAdmin.Value;
  ibstpUpdateCotizaMaster.Params[25].Value    := dmVentas.tblPOSTotalesMontoDescItbisGastosAdmin.Value;
  ibstpUpdateCotizaMaster.Params[26].Value    := dmVentas.tblPOSTotalesMontoDescTransp.Value;
  ibstpUpdateCotizaMaster.Params[27].Value    := dmVentas.tblPOSTotalesMontoDescDirtecnica.Value;
  ibstpUpdateCotizaMaster.Params[28].Value    := dmVentas.tblPOSTotalesMontoDescItbisDirTecnica.Value;
  ibstpUpdateCotizaMaster.Params[29].Value    := dmVentas.tblPOSTotalesMontoDescImprevisto.Value;
  ibstpUpdateCotizaMaster.Params[30].Value    := dmVentas.tblPOSTotalesMontoDescItbisImprevisto.Value;

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
  ibstpUpdateCotizaMaster.Params[34].Value     := dmVentas.tblPOSTotalesComentario.Value;//Numero_Cotiza
  ibstpUpdateCotizaMaster.Params[35].Value     := dmVentas.tblPOSTotalesReferenciaCte.Value;//Numero_Cotiza
  ibstpUpdateCotizaMaster.Params[36].Value     := dmVentas.tblPOSTotalesRecargo.Value;
  ibstpUpdateCotizaMaster.Params[37].Value     := dmVentas.tblPOSTotalesTipoNCFIFiscal.Value;
  ibstpUpdateCotizaMaster.Params[38].Value     := dmVentas.tblPOSTotalesMontoExoneraITBIS.Value;
  ibstpUpdateCotizaMaster.Params[39].Value     := GlbPorcPropina;
  ibstpUpdateCotizaMaster.Params[40].Value     := dmVentas.tblPOSTotalesPropina.Value;
  ibstpUpdateCotizaMaster.Params[41].Value     := dmVentas.tblPOSTotalesPropinaLegal.Value;
  
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
  if (ABS(dmVentas.tblPOSTotalesMontoExoneraITBIS.Value) > 0) then
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
  stpProcUpdteCotDet.Params[26].Value    := rxVentaCantPax.Value;
  stpProcUpdteCotDet.ExecProc;
end;

procedure TfrmProcVentaRapida.dbFechaCotizacionClick(Sender: TObject);
begin
  dmVentas.tblPOSTotales.Edit;
end;

procedure TfrmProcVentaRapida.dbFechaCotizacionExit(Sender: TObject);
begin
  if dmVentas.tblPOSTotales.State in [dsEdit] then
  GlbSalvarQuery(dmVentas.tblPOStotales);
end;

procedure TfrmProcVentaRapida.dbFechaCotizacionEnter(Sender: TObject);
begin
  dmVentas.tblPOSTotales.Edit;
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
  if dmVentas.tblPOSTotalesMoneda.IsNull then
  ipStpInsertVentMast.Params[7].Value    := '1'
  else
    ipStpInsertVentMast.Params[7].Value    := dmVentas.tblPOSTotalesMoneda.Value;

  ipStpInsertVentMast.Params[8].Value    := dmVentas.tblPOSTotalestotalneto.Value * -1; //EditN1.Text;
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
  ipStpInsertVentMast.Params[17].Value:= dmVentas.tblPOSTotalesSubTotal.Value * -1;
  ipStpInsertVentMast.Params[18].Value:= dmVentas.tblPOSTotalesPorcDesAdicional.Value;

  if Abs(dmVentas.tblPOSTotalesMontoDescAdicional.Value) > 0 then
  ipStpInsertVentMast.Params[19].Value:= (abs(dmVentas.tblPOSTotalesMontoDescAdicional.Value))*-1
  else
  if Abs(dmVentas.tblPOSTotalesMontoDescItems.Value) > 0 then
  ipStpInsertVentMast.Params[19].Value:= (ABS(dmVentas.tblPOSTotalesMontoDescItems.Value)) * -1 //dmVentas.tblPOSTotalesMontoDescAdicional.Value  * -1;
  else
  ipStpInsertVentMast.Params[19].Value:= 0;
  ipStpInsertVentMast.Params[20].Value:= dmVentas.tblPOSTotalesmontorecibido.Value;
  ipStpInsertVentMast.Params[21].Value:= dmVentas.tblPOSTotalesdevolucion.Value;
  ipStpInsertVentMast.Params[22].Value:= dmVentas.tblPOSTotalesitbis.Value * -1;
  ipStpInsertVentMast.Params[23].Value:= dmVentas.tblPOSTotalesmontorecibido.Value;
  if (edtObservacion.Text <> '') then
  ipStpInsertVentMast.Params[24].Value:= edtObservacion.Text
  else ipStpInsertVentMast.Params[24].Value:= '';
  //ipStpInsertVentMast.Params[24].Value:= 'No. Trn Original '+rxVentaNumeroTrn.AsString; //edtObservacion.Text;
  ipStpInsertVentMast.Params[25].Value:= dmVentas.tblPOSTotalesMontoDescGastosAdmin.Value  * -1;
  ipStpInsertVentMast.Params[26].Value:= dmVentas.tblPOSTotalesMontoDescItbisGastosAdmin.Value  * -1;
  ipStpInsertVentMast.Params[27].Value:= dmVentas.tblPOSTotalesMontoDescTransp.Value  * -1;
  ipStpInsertVentMast.Params[28].Value:= dmVentas.tblPOSTotalesMontoDescDirtecnica.Value  * -1;
  ipStpInsertVentMast.Params[29].Value:= dmVentas.tblPOSTotalesMontoDescItbisDirTecnica.Value  * -1;
  ipStpInsertVentMast.Params[30].Value:= dmVentas.tblPOSTotalesMontoDescImprevisto.Value  * -1;
  ipStpInsertVentMast.Params[31].Value:= dmVentas.tblPOSTotalesMontoDescItbisImprevisto.Value  * -1;
  ipStpInsertVentMast.Params[32].Value:= dmVentas.tblPOSTotalesComentario.Value;
  ipStpInsertVentMast.Params[33].Value:= rxVentaNumeroCotiza.Value;
  ipStpInsertVentMast.Params[34].Value:= dmVentas.tblPOSTotalesReferenciaCte.Value;
  ipStpInsertVentMast.Params[35].Value:= dmVentas.tblPOSTotalesRecargo.Value;
  ipStpInsertVentMast.Params[36].Value:= dmVentas.tblPOSTotalesTipoNCFIFiscal.Value;
  ipStpInsertVentMast.Params[37].Value:= dmVentas.tblPOSTotalesMontoExoneraITBIS.Value;
  ipStpInsertVentMast.Params[38].Value:= 0;
    ipStpInsertVentMast.Params[39].Value:= dmVentas.tblPOSTotalesPropina.Value;
  ipStpInsertVentMast.Params[40].Value:= GlbPorcPropina;
  ipStpInsertVentMast.Params[41].Value:= dmVentas.tblPOSTotalesPropinaLegal.Value;

  ipStpInsertVentMast.ExecProc;
  numeroTrnVta:= ipStpInsertVentMast.Params[0].Value;
  if (dmVentas.tblPOSTotalesTipoNCF.Value = '15') OR (dmVentas.tblPOSTotalesTipoNCF.Value = '14') then
  begin
    updTipoRetencionVta.Params[0].Value:= 1;//LEY RETENCION GOV y ONG
    updTipoRetencionVta.Params[1].Value:= ipStpInsertVentMast.Params[0].Value;
    updTipoRetencionVta.ExecQuery;
    if Not updTipoRetencionVta.Transaction.InTransaction then
    updTipoRetencionVta.Transaction.StartTransaction;
    try
      updTipoRetencionVta.Transaction.CommitRetaining;
    except
    updTipoRetencionVta.Transaction.RollbackRetaining;
    end;    
  end;  
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
  ActFastFoodTicket(NumTicketFFood);
  numeroTrnVta:= ipStpInsertVentMast.Params[0].Value;

  //tblNiv_ctrl
  if (GlbActivaIFiscal = 1 ) then
  FInsertarDatosCtrlNIF(numerotrnvta);

end;

procedure TfrmProcVentaRapida.ReImprimeDevolucion1Click(Sender: TObject);
var
  flag, _xflag : Boolean;

begin
//Usado para filtrar dmfactura.qryventafactura
  if rxVenta.RecordCount > 0 then
  begin
    MessageDlg('Terminar o cancelar transacción en curso.',mtInformation,[mbok],0);
    exit;
  end;
  EsReimp:=True;
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
   //vuelve aqui aqui aqui
      TipoVenta:= 'Devolución'+ ' (Re-Impreso)';
      if (GlbRec3Pulg = 1) then
      begin
        qckRepReciboDevol3Pulg:=TqckRepReciboDevol3Pulg.Create(Nil);
        try
          if GlbImpCodProducto = 1 then
          begin
            qckRepReciboDevol3Pulg.QRLabel27.Enabled := False;
            qckRepReciboDevol3Pulg.QRDBText5.Enabled:= False;
          end else
          begin
            qckRepReciboDevol3Pulg.QRLabel27.Enabled:= True;
            qckRepReciboDevol3Pulg.QRDBText5.Enabled:= True;
          end;

          if Length(dmVentas.tblPOSTotalesNombreCliente.Value) > 0 then
          dmVentas.tblPOSTotales.RecordCount;
          if dmFactura.qryVentaFacturaNOMBRE_FACTURAR.IsNull then
          qckRepReciboDevol3Pulg.nombreCteGenerico := dmFactura.qryVentaFacturaNOMBRE_CLIENTE_GENERAL.Value
          else
          qckRepReciboDevol3Pulg.nombreCteGenerico := dmFactura.qryVentaFacturaNOMBRE_FACTURAR.Value;
          if Length(edtObservacion.Text) > 0 then
          qckRepReciboDevol3Pulg.nombreCteGenerico := edtObservacion.Text;

          qckRepReciboDevol3Pulg.xtipoVenta:= TipoVenta;
          qckRepReciboDevol3Pulg.valorNCF  := dmFactura.qryVentaFacturaNUMERO_NCF.Value;

          //qckRepReciboDevol3Pulg.qrLabelRNC.Caption := dmFactura.qryVentaFacturaRNC_NUMERO.Value;

          if rxVenta.RecordCount = 1 then
          qckRepReciboDevol3Pulg.Page.Length:= 5
          else
          if rxVenta.RecordCount >= 2 then
          qckRepReciboDevol3Pulg.Page.Length:= qckRepReciboDevol3Pulg.Page.Length +
          (rxVenta.RecordCount - 1 ) * 0.25;

          flag:=True;
          repeat
          begin
            qckRepReciboDevol3Pulg.Prepare;
            if qckRepReciboDevol3Pulg.PageNumber > 1 then
            begin
              qckRepReciboDevol3Pulg.Page.Length := qckRepReciboDevol3Pulg.Page.Length + 0.25;
              qckRepReciboDevol3Pulg.Prepare;
              flag:=False;
            end else break;
          end;
        until flag = true;

        if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
        qckRepReciboDevol3Pulg.Print else
        qckRepReciboDevol3Pulg.Preview;
        finally
        qckRepReciboDevol3Pulg.Free;
        qckRepReciboDevol3Pulg:=Nil;
      end;
   end else
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
{t
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
  UProcesarDevolucion.monto    := ABS(dmVentas.tblPOSTotalestotalneto.Value);
  UProcesarDevolucion.status   := 'A';

  UProcesarDevolucion.codig_usuario := VarUsuarioGlb;
  UProcesarDevolucion.fechaInsert   := Now;
  UProcesarDevolucion.fechaUpdate   := Now;
  UProcesarDevolucion.codigousuarioupd := VarUsuarioGlb;
  UProcesarDevolucion.tipodoc := 5; //Nota Credito
  UProcesarDevolucion.Moneda  := trim(dmVentas.tblPOSTotalesMoneda.Value);

  //Not used in devolucion
  UProcesarDevolucion.numeroFactura := -1;//rxVentaNumeroFactura.Value;
  //No afectar factura pendiente
  UProcesarDevolucion.AfectaFactPend := false;
  UProcesarDevolucion.GeneraNCF:=True;
  UProcesarDevolucion.Ejecutar('04', dmVentas.tblPOSTotalesTipoNCFIFiscal.Value,dmFactura.qryVentaFacturaNUMERO.Value);//Comprogante Fiscal Nota de Credito
end;
  }
procedure TfrmProcVentaRapida.BitBtn4Exit(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmProcVentaRapida.RegistroServicioTaller1Click(
  Sender: TObject);
begin
  {frmOperacionServicios:=TfrmOperacionServicios.Create(Nil);
  try
    frmOperacionServicios.Showmodal;
  finally
  frmOperacionServicios.Free;
  frmOperacionServicios:=Nil;
  end;
  }//temp

  if  not Assigned(frmRegServicioTaller) then
  frmRegServicioTaller:=TfrmRegServicioTaller.Create(Nil);
  try
    frmRegServicioTaller.Show;
  finally
  //frmRegServicioTaller.Free;
  //frmRegServicioTaller:=Nil;
  end;
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
        rxVentaMoneda.Value := dmVentas.tblPOSTotalesmoneda.Value;
        GlbSalvarQuery(rxVenta);
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
      rxVentaMoneda.Value := dmVentas.tblPOSTotalesmoneda.Value;
    end;
    if rxVenta.State In [dsBrowse] Then
       rxVenta.Edit;

    if rxVenta.State In [dsInsert, dsEdit] Then
    begin
       GlbSalvarQuery(rxVenta);
       //WriteToLog('Post rxVenta - Line 8075');
    end;

  end;

end;

procedure TfrmProcVentaRapida.RxDBLookupCombo2Change(Sender: TObject);
begin
  //glbMoneda:= dmVentas.tblPOSTotalesMoneda.AsInteger;
  GlbMoneda := tblMonedaCODIGO.AsInteger;
  if dmVentas.tblPOSTotales.State = dsBrowse then
  dmVentas.tblPOSTotales.Edit;
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
  if dmVentas.tblPOSTotales.State = dsBrowse then
  dmVentas.tblPOSTotales.Edit;
end;

procedure TfrmProcVentaRapida.RxDBLookupCombo2Exit(Sender: TObject);
begin
  GlbMoneda:= dmVentas.tblPOSTotalesMoneda.AsInteger;
  if dmVentas.tblPOSTotales.State in [dsInsert, dsEdit] then
  GlbSalvarQuery(dmVentas.tblPOStotales);
  if dmVentas.tblPOSTotales.State = dsBrowse then
  dmVentas.tblPOSTotales.Edit;
  ProcCalculoDivisa;

  dmVentas.tblPOSTotalestotalneto.DisplayFormat:=Concat(SimboloMoneda(dmVentas.tblPOSTotalesMoneda.Value),',0.00');
  lblTasa.Caption:=Concat('1 =',SimboloMoneda(rxVentaMonedaBase.Value))+dmdatos.qryTasaVALORMONEDA.AsString;
end;

procedure TfrmProcVentaRapida.RxDBLookupCombo2Click(Sender: TObject);
begin
  if dmVentas.tblPOSTotales.State = dsBrowse then
  dmVentas.tblPOSTotales.Edit;
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
  if (GlbActivaIFiscal = 1 ) then
  begin
    Button2Click(Self);
    Exit;
  end;
  //temporal eliminar lineas
  Button2Click(Self);
  
  Exit;

  frmDistribuirPgoVenta:=TfrmDistribuirPgoVenta.Create(Nil);
  try
    if dmVentas.tblPOSTotales.State = dsBrowse then
    dmVentas.tblPOSTotales.Edit;
    if dmVentas.tblPOSTotalesMoneda.IsNull then
    dmVentas.tblPOSTotalesMoneda.Value := IntToStr(GlbMonedaBase);
    dmVentas.tblPOSTotalesMontoNotaCredito.Value:=
    frmDistribuirPgoVenta.GetMontoNotaCreditoPendiente(dmVentas.tblPOSTotalesMoneda.Value, tablaPropietarioCodigoPropietario.Value);
    frmDistribuirPgoVenta.Label11.Caption:=dmVentas.tblPOSTotalesMontoNotaCredito.AsString;
    GlbSalvarQuery(dmVentas.tblPOStotales);
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
  dmVentas.tblPOSTotalesMontoEnEfectivo.Value +
  dmVentas.tblPOSTotalesMontoEnTarjeta.Value +
  dmVentas.tblPOSTotalesMontoEnCheque.Value +
  dmVentas.tblPOSTotalesMontoEnBonos.Value+
  dmVentas.tblPOSTotalesMontoNCRAplicado.Value]);
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


procedure TfrmProcVentaRapida.DescargaNotaCredito;
var
  resto : Currency;
begin
  //if Not (CheckBox4.Checked) then Exit;
  if (dmVentas.tblPOSTotalesMontoNCRAplicado.Value > 0) then
  begin
    dmDatos.tblDevolucionAbierta.First;
    resto:=dmVentas.tblPOSTotalesMontoNCRAplicado.Value;
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
        //dmVentas.tblPOSTotalesMontoNCRAplicado.Value;
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
    dmVentas.tblPOSTotales.Edit;
    dmVentas.tblPOSTotalesMontoNotaCredito.Value := 0;
    dmVentas.tblPOSTotalesMontoNCRAplicado.Value := 0;

    dmVentas.tblPOSTotalesdevolucion.Value := 0;
    GlbSalvarQuery(dmVentas.tblPOStotales);

    if rxVenta.State In [dsInsert, dsEdit] Then
    begin
      GlbSalvarQuery(rxVenta);
      //WriteToLog('Post rxVenta - Line 8417');
    end;
  end else
  if CheckBox4.Checked then
  begin
    dmVentas.tblPOSTotales.Edit;
    dmVentas.tblPOSTotalesdevolucion.Value := 0;
    GlbSalvarQuery(dmVentas.tblPOStotales);

  end;
end;

procedure TfrmProcVentaRapida.SetMontoNotaCredito;
begin
  if (tablaPropietarioCodigoPropietario.Value > 0)  and (not dmVentas.tblPOSTotalesMoneda.IsNull) then
  begin
    dmDatos.tblDevolucionAbierta.Close;
    dmDatos.tblDevolucionAbierta.Params[0].Value := dmVentas.tblPOSTotalesMoneda.Value;//moneda
    dmDatos.tblDevolucionAbierta.Params[1].Value := tablaPropietarioCodigoPropietario.Value; //codigocte
    dmDatos.tblDevolucionAbierta.Open;
    dmDatos.tblDevolucionAbierta.First;
    if dmVentas.tblPOSTotales.State = dsBrowse then
    dmVentas.tblPOSTotales.Edit;
    dmVentas.tblPOSTotalesMontoNotaCredito.Value := 0;
    While Not dmDatos.tblDevolucionAbierta.Eof Do
    begin
      dmVentas.tblPOSTotalesMontoNotaCredito.Value :=
      dmVentas.tblPOSTotalesMontoNotaCredito.Value +
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
    if showing then
    if cboxTipoUnidad.Visible then
      if cboxTipoUnidad.Enabled then
    cboxTipoUnidad.SetFocus;
  end;
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
    frmPagosCombinados.rxCobrostotalNeto.Value:=dmVentas.tblPOSTotalestotalneto.Value;
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
  if frmProcVentaRapida.showing then
  Edit1.SetFocus;
  BitBtn2Click(Self);
  Edit1Exit(Self);
  if frmProcVentaRapida.showing then
  if frmProcVentaRapida.BitBtn4.Enabled then
  frmProcVentaRapida.BitBtn4.SetFocus;
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
    dmreportes.qryNCFAfectado.Close;
    dmreportes.qryNCFAfectado.Params[0].Value:= dmReportes.qryDatosVentaMasterSERIE_NCF_ASIGNADO.Value;
    dmreportes.qryNCFAfectado.Open;

  //rxVentaNumeroRecibo
  frmTestImpresoraFiscal:=TfrmTestImpresoraFiscal.Create(Nil);
  try
    dmReportes.qryDatosVentaDetalle.Last;
    frmTestImpresoraFiscal.tRecord:= dmReportes.qryDatosVentaDetalle.RecordCount;
    dmReportes.qryDatosVentaDetalle.first;

    frmTestImpresoraFiscal.EsDevolucion:= EsDevolucion;
    frmTestImpresoraFiscal.LCantCopias := rxspinImpCantCopias.Text;
    frmTestImpresoraFiscal.Showmodal;
  finally
  frmTestImpresoraFiscal.Free;
  frmTestImpresoraFiscal:=Nil;
  end;
  //Delay(1000);
  NumeroTrn := 0;
  refresh;
end;

procedure TfrmProcVentaRapida.VerificaImpresoraFiscalM;
var
  archivo : String;
  tHoras : integer;
begin
  Delay(1000);
  UGlobal.VerificaImpresoraFiscal;

  if not GlbImpresoraFOnline then
  begin
    BitBtn1.Enabled:=False;
    if GlbActivaIFiscal = 1 then
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
  if dmVentas.tblPOSTotales.State = dsBrowse then
  EsBrowsing := True
  else EsBrowsing:=False;
end;

procedure TfrmProcVentaRapida.ReImprimeDocFiscal1Click(Sender: TObject);
begin
  {if (NumeroTrn <= 0) then
  begin
    NumeroTrn := StrToInt(InputBox('Test numero venta','Indique numero',''));
  end;
  }
  if rxVenta.RecordCount > 0 then
  begin
    MessageDlg('Terminar o cancelar transacción en curso.',mtInformation,[mbok],0);
    exit;
  end;

  frmConsultaFacturas:=TfrmConsultaFacturas.Create(Nil);
  try
    frmConsultaFacturas.rdgContado.Checked:=True;
    frmConsultaFacturas.BitBtn2.Caption := '&Re-Imprimir';
    if frmConsultaFacturas.Showmodal = mrOK then
    begin
      if frmConsultaFacturas.rdgContado.Checked then
         esContado:=True
      else esContado:=False;
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
  dmdatos.qryConfCajaXusuario.Locate('COD_EMPLEADO', VarUsuarioGlb, []);

  dmReportes.qryDatosCajaImpUser.close;
  dmReportes.qryDatosCajaImpUser.Params[0].Value:= VarUsuarioGlb;
  dmReportes.qryDatosCajaImpUser.Open;
  dmReportes.qryDatosCajaImpUser.Last;
  dmReportes.qryDatosCajaImpUser.RecordCount;

  dmreportes.qryNCFAfectado.Close;
  dmreportes.qryNCFAfectado.Params[0].Value:= dmreportes.qryDatosVentaMasterSERIE_NCF_ASIGNADO.Value;
  dmreportes.qryNCFAfectado.Open;

  GlbNombreFiletoPrint:= Format('%s%s%s%s%s%s%s',[dmReportes.qryDatosCajaImpUserRUTA_TICKET.Value,'\ReImpRecibo',Trim(GlbCodSucursal),Trim(GlbModeloImpresora),
  IntToStr(VarUsuarioGlb),IntToStr(NumeroTrn),'.txt']);

  frmBuscarNIF:=TfrmBuscarNIF.Create(Nil);
  try
    if frmBuscarNIF.Showmodal = mrok then
    begin
      if (dmReportes.qryDatosReimpDocFiscal.RecordCount > 0) then
      begin

      frmTestImpresoraFiscal:=TfrmTestImpresoraFiscal.Create(Nil);
      try
        //frmTestImpresoraFiscal.Button1Click(Self);
        dmReportes.qryDatosVentaDetalle.Last;
        frmTestImpresoraFiscal.tRecord:= dmReportes.qryDatosVentaDetalle.RecordCount;
        dmReportes.qryDatosVentaDetalle.First;

        frmTestImpresoraFiscal.EsDevolucion:= EsDevolucion;
        frmTestImpresoraFiscal.LCantCopias := rxspinImpCantCopias.Text;
        StatusImpFiscal:=True;
        frmTestImpresoraFiscal.btnReimprimirdocFiscalClick(Self);//Button1Click(Self);
        frmTestImpresoraFiscal.Button3Click(Self);
      finally
      frmTestImpresoraFiscal.Free;
      frmTestImpresoraFiscal:=Nil;
      end;
      //Delay(1000);
      StatusImpFiscal:=False;
      end else
      MessageDlg('No hay nada para imprimir, verifique',mtWarning,[mbok],0);
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

procedure TfrmProcVentaRapida.Cancelar1Click(Sender: TObject);
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

procedure TfrmProcVentaRapida.CirreZ1Click(Sender: TObject);
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

procedure TfrmProcVentaRapida.CierreX1Click(Sender: TObject);
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

procedure TfrmProcVentaRapida.ProcesaEstadoImpresora;
begin
  if StatusImpFiscal then exit;
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

procedure TfrmProcVentaRapida.Estatus1Click(Sender: TObject);
begin
  if (GlbActivaIFiscal = 1 ) then
  ProcesaEstadoImpresora;
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
  RxDBLookupCombo3Exit(self);
  procCalc:=True;
  BitBtn27Click(Self);
  Refresh;
end;

procedure TfrmProcVentaRapida.RxDBLookupCombo3Exit(Sender: TObject);
var
  xpos : integer;
begin
  //chkExentoExit(Self);   1,4,5,
  if rxVentaSerie.IsNull then Exit;
  if dmVentas.tblPOSTotales.State = dsBrowse Then dmVentas.tblPOSTotales.Edit;
  if dmVentas.tblPOSTotales.State In [dsEdit, dsInsert] Then
  begin
    if (dmVentas.tblPOSTotalesTipoNCF.IsNull) And (Not dmVentas.tblPOSTotalesTipoNCFIFiscal.IsNull) then
    dmVentas.tblPOSTotalesTipoNCF.Value := dmFactura.ibQryViewNCFTIPO_CF.Value
    else
    if (dmVentas.tblPOSTotalesTipoNCF.Value <> dmFactura.ibQryViewNCFTIPO_CF.Value) then
    dmVentas.tblPOSTotalesTipoNCF.Value := dmFactura.ibQryViewNCFTIPO_CF.Value;

     dmVentas.tblPOSTotalesMontoExoneraITBIS.Value:= 0;
     if Not dmFactura.ibQryViewNCF.Locate('TIPO_CF;tipo_ncf_ifiscal',
     VarArrayOf([dmVentas.tblPOSTotalesTipoNCF.Value,dmVentas.tblPOSTotalesTipoNCFIFiscal.Value]), []) then
     begin
       dmVentas.tblPOSTotalesTipoNCF.AsVariant := null;
       dmVentas.tblPOSTotalesTipoNCFIFiscal.AsVariant := null;;
     end;

     label29.Caption := 'Sub-Total Indirecto';
    //dmVentas.tblPOSTotalesTipoNCFIFiscal.Value := dmFactura.ibQryViewNCFTIPO_NCF_IFISCAL.AsInteger;
    if (not dmVentas.tblPOSTotalesTipoNCF.IsNull) Or (dmVentas.tblPOSTotalesTipoNCF.Value <> '') then
    begin
      xpos := Pos('EXONERA',UpperCase(dmFactura.ibQryViewNCFDESCRIPCION.Value));

      if Pos('EXONERA',UpperCase(dmFactura.ibQryViewNCFDESCRIPCION.Value)) > 0 then
      begin
        label29.Caption := 'ITBIS Exonerado';
        label29.Visible := True;
        if (GLBEsFastFood) then
        begin
          label29.Top:= label41.Top;
          dbTextMontoExoneraITBIS.Top := DBText15.Top;
          label41.Visible := False;
          DBText15.Visible:= False;
        end;
        dbTextMontoExoneraITBIS.Visible := True;
        dbTextMontoExoneraITBIs.BringToFront;
        dmVentas.tblPOSTotalesMontoExoneraITBIS.Value  := dmVentas.tblPOSTotalesitbis.Value;
        WriteToLog('Total itbis: '+dmVentas.tblPOSTotalesitbis.AssTring);
      end else
      begin
        dmVentas.tblPOSTotalesMontoExoneraITBIS.Value:= 0;
        label29.Caption := 'Sub-Total Indirecto';
      end;
      chkExentoExit(Self);
    end;
  end;
  if dmVentas.tblPOSTotales.State In [dsEdit, dsInsert] then
  GlbSalvarQuery(dmVentas.tblPOStotales);
  //t Alcanzar el Exito BitBtn27Click(Self);
  if (dmVentas.tblPOSTotalesTipoNCFIFiscal.Value In [1,4,5]) And
  (tablaPropietarioCodigoPropietario.IsNull or (tablaPropietarioCodigoPropietario.Value = 0)) then
  begin
    ProcEntradaCliente;
  end;
  RxDBLookupCombo3Change(Self);
  //Refresh;
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
  //nCampo : TField;
begin
  if entraDessGlb and LlenandoDatos then exit;//probando velocidad;
  //nCampo := TField.Create(nil);
  //nCampo.FieldName
  if dmVentas.tblPOSTotalesPorcDesAdicional.IsNull then exit;
  
  dmVentas.tblPOSTotales.AutoCalcFields:=False;
  //if (rxVentaMontoDesGlobal.Value <= 0) then exit;
  if chKDescuentoGlobal.Checked then
  begin
     Label44.Caption := 'Monto Desc. Global';
     //DBText16.Field.FieldName := 'MontoDescAdicional';
     DBText4.Visible    := True;
     DBText4.BringToFront;
     Label47.Visible := True;
     DBEdit11.Visible:= True;
     if HayDescNivelItem then
     begin
       guardarRec:= rxVenta.GetBookmark;
       rxVenta.First;
       sumarDatos := False;
{       rxVenta.DisableControls;
       RxDBGrid1.DisableScroll;
       While Not rxVenta.Eof do
       begin
         rxVenta.Edit;
         rxVentaPorcDescItem.Value := 0;
         rxVenta.Next;
       end;}
       sumarDatos := True;

       Exito_ProcUpdatePosVentaDetDesc;

       rxventa.Edit;
       GlbSalvarQuery(rxVenta);
       rxventa.GotoBookmark(guardarRec);
       rxventa.FreeBookmark(guardarRec);
       rxventa.EnableControls;
     end;
     DBEdit9.Enabled := false;
     DBEdit11.SetFocus;
  end else
  begin
    dmVentas.tblPOSTotales.Edit;
    dmVentas.tblPOSTotalesPorcDesAdicional.Value:=0;
    if dmVentas.tblPOSTotales.State = dsEdit then
    GlbSalvarQuery(dmVentas.tblPOStotales);
    DBEdit9.Enabled := True;
    Label47.Visible := False;
    DBEdit11.Visible:= False;
    Label44.Caption := 'Monto Desc. Items';
    //DBText16.Field.FieldName:='MontoDescItems';
    DBText4.Visible:=False;
    DBText4.SendToBack;
  end;
  dmVentas.tblPOSTotales.AutoCalcFields:=True;
  //Refresh;
  DBEdit10Exit(Self);
  rxVenta.EnableControls;
  RxDBGrid1.EnableScroll;
  //Refresh;
end;

procedure TfrmProcVentaRapida.Exito_ProcUpdatePosVentaDetDesc;
begin
  if dmCalculos.ibSqlUpdateGenerico.Open then
       begin
         dmCalculos.ibSqlUpdateGenerico.Close;
         dmCalculos.ibSqlUpdateGenerico.SQL.Add('Update pos_ventas_Det set PorcDescItem = 0 where numero =:numero ');
         dmCalculos.ibSqlUpdateGenerico.Params[0].Value:= dmventas.tblPOSVentasMastNUMERO.Value;
         dmCalculos.ibSqlUpdateGenerico.ExecQuery;
         if dmCalculos.ibSqlUpdateGenerico.Transaction.InTransaction then
         dmCalculos.ibSqlUpdateGenerico.Transaction.StartTransaction;
         try
           dmCalculos.ibSqlUpdateGenerico.Transaction.CommitRetaining;
         except
         dmCalculos.ibSqlUpdateGenerico.Transaction.RollbackRetaining;
         end;
       end;
end;
procedure TfrmProcVentaRapida.DBEdit11Change(Sender: TObject);
begin
  if LlenandoDatos then exit;
  GlbAlreadyCld := False;
  BitBtn10Click(Self);
  DBEdit5Exit(Self);
end;

procedure TfrmProcVentaRapida.ImprimeFiscalContado(xNumeroTrn:Integer);
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

      dmreportes.qryDatosVentaDetalle.Last;
      frmTestImpresoraFiscal.tRecord:= dmReportes.qryDatosVentaDetalle.RecordCount;
      dmReportes.qryDatosVentaDetalle.First;
      StatusImpFiscal:=True;
      frmTestImpresoraFiscal.btnImprimeReciboClick(Self);//Button1Click(Self);
    finally
    frmTestImpresoraFiscal.Free;
    frmTestImpresoraFiscal:=Nil;
    end;
    StatusImpFiscal:=False;
    reciboImpreso := True;
end;

procedure TfrmProcVentaRapida.FormClick(Sender: TObject);
begin
  refresh;
end;

procedure TfrmProcVentaRapida.RecuperaTicketfiscal1Click(Sender: TObject);
begin
 if (GlbActivaIFiscal = 1) then
  begin
    Delay(2000);
    qryVerificaReciboPdte.Close;
    qryVerificaReciboPdte.Open;
    qryVerificaReciboPdte.Last;
    qryVerificaReciboPdte.SQL.Text;
    if (qryVerificaReciboPdte.RecordCount > 1) then
    begin
      MessageDlg('Existe más de un record pendiente impresión ticket, '#13' verifique que la impresora esta en linea '#13' antes de registrar ventas.',mtError,[mbok], 0);
    end;
    if (qryVerificaReciboPdte.RecordCount > 0) then 
    Begin
      //if (qryVerificaReciboPdteFORMA_PAGO.Value = 1) then //Contado
      if MessageDlg('Desea reimprimir los '+IntToStr(qryVerificaReciboPdte.RecordCount) + ' pendiente?',mtInformation,[mbyes, mbno], 0) = mryes then
      begin
        qryVerificaReciboPdte.First;
        While Not qryVerificaReciboPdte.Eof Do
        begin
          if MessageDlg('Imprimir transaccion número '+qryVerificaReciboPdteNUMERO.AsString+'?',mtInformation,[mbyes, mbno], 0) = mrno then
          break;

          ImprimeFiscalContado(qryVerificaReciboPdteNUMERO.Value);
          Delay(5000);
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
    End;
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

procedure TfrmProcVentaRapida.DBEdit11Exit(Sender: TObject);
begin
  if entraDessGlb and LlenandoDatos then
  LlenandoDatos:=False;
  
  entraDessGlb:=False;

  GlbAlreadyCld := False;
  rxVenta.Edit;
  DBEdit2Exit(Self);
end;

procedure TfrmProcVentaRapida.DBEdit10Enter(Sender: TObject);
begin
  if dmVentas.tblPOSTotalesTipoNCFIFiscal.IsNull then
  begin
    MessageDlg('Favor indicar tipo comprobante fiscal.',mtInformation,[mbok], 0);
    RxDBLookupCombo3.SetFocus;
    Exit;
  end;
end;

procedure TfrmProcVentaRapida.rxVentaXXXBeforeEdit(DataSet: TDataSet);
begin
  procCalc:=True;
end;

procedure TfrmProcVentaRapida.DBRadioGroup1Click(Sender: TObject);
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

procedure TfrmProcVentaRapida.DBEdit9Exit(Sender: TObject);
begin
  if rxVentaPorcDescItem.Value > 0 then HayDescNivelItem := True;

  if rxVentaIDTasaITBIS.IsNull Or (rxVentaIDTasaITBIS.Value = 0) then
  DBRadioGroup1Click(Self);
end;

procedure TfrmProcVentaRapida.ReactivarValores;
begin
//  rxVenta.EmptyTable;
  Edit1.Text      := '';
  edtCodigo.Text  := '';
  BitBtn4.Enabled := False;
  //dmVentas.tblPOSTotales.EmptyTable;
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
       label29.Top:= 413;
       dbTextMontoExoneraITBIS.Top := 410;
       label41.Visible := True;
       DBText15.Visible:= True;
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

procedure TfrmProcVentaRapida.DBEdit11Enter(Sender: TObject);
begin
  LlenandoDatos:=True;
  entraDessGlb := True;
  if not chKDescuentoGlobal.Checked then
  chKDescuentoGlobal.Checked:= True; 
end;

procedure TfrmProcVentaRapida.Label5Click(Sender: TObject);
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

procedure TfrmProcVentaRapida.ProcesarCalculoAlterno;
begin
  if not procCalc then exit;
  dmCalculos.CheckBox2Checked :=CheckBox2.Checked;
  dmCalculos.chkExentoChecked :=chkExento.Checked;
  dmCalculos.rdgFactServicioChecked :=rdgFactServicio.Checked;
  dmCalculos.CheckBox3Checked :=CheckBox3.Checked;
  dmCalculos.EsFactura := EsFactura;
  dmCalculos.EsFinanciamiento := EsFinanciamiento;
  dmCalculos.CheckBox4Checked := CheckBox4.Checked;
  dmCalculos.xCodigoPropietario := tablaPropietarioCodigoPropietario.Value;
  dmCalculos.chKDescuentoGlobalChecked := chKDescuentoGlobal.Checked;
  //temporal Exito dmCalculos.LoadDataVenta(rxVenta);
  //temporal Exito dmCalculos.SetDataVenta(rxVenta);
  //dmCalculos.LoadTotalVenta(dmVentas.tblPOSTotales);
  //BitBtn1Click(Self);
end;

procedure TfrmProcVentaRapida.BitBtn27Click(Sender: TObject);
var
  guardarRec : TBookMark;
begin
  if (rxVenta.RecordCount = 0) then Exit;

  if not dmCalculos.esFeedback then Exit;

  if ABS(dmVentas.tblPOSTotalesSubTotal.Value) > 0 then
  if not procCalc then exit;

  dmCalculos.datosSetDataDone:=False;
  dmCalculos.datosCargados:=False;

  RxDBGrid1.DisableScroll;
  if chkNoLeyPropina.Checked then
  dmCalculos.CalcPropinaLegal := False
  else
  dmCalculos.CalcPropinaLegal:=True;

  guardarRec:= rxVenta.GetBookmark;
  BitBtn10.Enabled := False;
  if Not Assigned(frmTemporalForm) then
  frmTemporalForm:=TfrmTemporalForm.Create(Nil);
  try
    //if Not dmCalculos.esFeedback then
    ProcesarCalculoAlterno;
    dmCalculos.esFeedback:=True;

    //t Exito dmCalculos.SetDataVenta(rxVenta);
    //t Exito dmCalculos.LoadDataVenta(rxVenta);

    dmCalculos.FMontoDescNivelItem:=dmCalculos.GettotalMontoDescuentoItem;
    //dmCalculos.SetTotalVenta(dmVentas.tblPOSTotales);
    dmCalculos.esFeedback := False;
    //Esta linea es temporal probando Nov-27
    if not LlenandoDatos then
    frmTemporalForm.BitBtn1Click(Self);
    if ((dmVentas.tblPOSTotalesSubTotal.IsNull) or  (Abs(dmVentas.tblPOSTotalesSubTotal.Value) = 0))
    and (rxVenta.RecordCount > 0)  then
    begin
       frmTemporalForm.BitBtn1Click(Self);
       //dmCalculos.SetTotalVenta(dmVentas.tblPOSTotales);
    end;
    //application.ProcessMessages;
  finally
  //FreeAndNil(frmTemporalForm);
  end;
  if Assigned(guardarRec) then
  begin
    rxVenta.GotoBookmark(guardarRec);
    rxVenta.FreeBookmark(guardarRec);
  end;
  RxDBGrid1.EnableScroll;
  rxVenta.EnableControls;
  //Application.ProcessMessages;
  BitBtn10.Enabled:=True;
  RxDBGrid1.EnableScroll;
  dmCalculos.esFeedback := True;
end;

procedure TfrmProcVentaRapida.BitBtn28Click(Sender: TObject);
begin
  if Assigned(frmTemporalForm) then
  frmTemporalForm.Show;
end;

procedure TfrmProcVentaRapida.ConciliarNIF1Click(Sender: TObject);
begin
  frmConciliarNIFvsVenta:=TfrmConciliarNIFvsVenta.Create(Nil);
  try
    frmConciliarNIFvsVenta.Showmodal;
  finally
  frmConciliarNIFvsVenta.Free;
  frmConciliarNIFvsVenta:=Nil;
  end;
end;

procedure TfrmProcVentaRapida.CancelarTicket1Click(Sender: TObject);
var
  archivo : String;
begin
  if GlbActivaIFiscal = 0 then Exit;

  archivo:=GlbExeIFiscal;
  ShellExecute(0, 'Open', PChar(archivo), PChar(Format('/PortComm=%s /Baudrate=%s /TipoDoc=DVFN /Status=not /Cancelar=True /CierreZ=False /ImprimeZ=0 /CierreX=False',[IntToStr(GlbPuerto),IntToStr(GlbBaudRate)])), PChar(''), SW_Hide);
  ProcActualizaMsg;
end;

procedure TfrmProcVentaRapida.ProcEntradaCliente;
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

    if dmVentas.tblPOSTotales.State = dsbrowse then dmVentas.tblPOSTotales.Edit;
       dmVentas.tblPOSTotalesCodCliente.Value:= xCodigoCte;
    if xCodigoCte > 0 then
    begin
      qryCliente.Locate('CODIGO_CTE',xCodigoCte,[]);
      dmVentas.tblPOSTotalesNombreCliente.Value := qryClienteNOMBRE_CTE.Value;
      dmVentas.tblPOSTotalesDireccion.Value     := qryClienteDIRECCION_CONT.Value;
      dmVentas.tblPOSTotalesTelefono.Value      := qryClienteTELEF_CONTACTO.Value;
      dmVentas.tblPOSTotalesCodCliente.Value    := qryClienteCODIGO_CTE.Value;
      dmVentas.tblPOSTotalesRNC_NUMERO.Value    := qryClienteRNC_NUMERO.Value;
      GlbSalvarQuery(dmVentas.tblPOStotales);
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
    //INGESERVIS, ARTIOFFICE,MAISONMARIE,TRIPLETASSO
   if (GlBAyaco= 1) then
   begin
     frmConsultaFacturas:=TfrmConsultaFacturas.Create(Nil);
     try
       frmConsultaFacturas.rdgCredito.Checked := True;
       frmConsultaFacturas.EditN1.SetInteger(serieDoc);
       frmConsultaFacturas.BitBtn1Click(Self);

      dmreportes.qryViewVentasMast.Close;
      dmreportes.qryViewVentasMast.Params[0].Value:= dmfactura.qryVentaFacturaNUMERO.Value;
      dmreportes.qryViewVentasMast.Open;
             
       LlenarrxSolDatoscte(dmFactura.qryVentaFacturaCODIGO_CTE.Value);
       if frmConsultaFacturas.rdgCredito.Checked then
          TipoVenta:='CREDITO'
       else
          tipoVenta:='CONTADO';

       qckFactServ8_5Ayaco:=TqckFactServ8_5Ayaco.Create(Nil);
       try
         qckFactServ8_5Ayaco.TPag.Caption:=
         IntToStr(qckFactServ8_5Ayaco.PageNumber);
         qckFactServ8_5Ayaco.xtipoVenta := TipoVenta;
         qckFactServ8_5Ayaco.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;
         if (GlbImpReciboSinPreg = 1) then
           qckFactServ8_5Ayaco.Print
           else
           if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
           begin
             qckFactServ8_5Ayaco.PrinterSetup;
             qckFactServ8_5Ayaco.Print;
           end else
           qckFactServ8_5Ayaco.Preview;
           if (GlbImpReciboSinPreg = 0) then
           if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
            begin
              qckFactServ8_5Ayaco.Preview;
            end;
        finally
        qckFactServ8_5Ayaco.Free;
        qckFactServ8_5Ayaco:=Nil;
        end;
        finally
        if Assigned(frmConsultaFacturas) then
           frmConsultaFacturas.Free;
           frmConsultaFacturas:=Nil;
       end;
    end else
   if (GlBBurgos = 1) then
   begin
     frmConsultaFacturas:=TfrmConsultaFacturas.Create(Nil);
     try
       frmConsultaFacturas.rdgCredito.Checked := True;
       frmConsultaFacturas.EditN1.SetInteger(serieDoc);
       frmConsultaFacturas.BitBtn1Click(Self);

      dmreportes.qryViewVentasMast.Close;
      dmreportes.qryViewVentasMast.Params[0].Value:= dmfactura.qryVentaFacturaNUMERO.Value;
      dmreportes.qryViewVentasMast.Open;
             
       LlenarrxSolDatoscte(dmFactura.qryVentaFacturaCODIGO_CTE.Value);
       if frmConsultaFacturas.rdgCredito.Checked then
          TipoVenta:='CREDITO'
       else
          tipoVenta:='CONTADO';

       qckFactServ8_5BB:=TqckFactServ8_5BB.Create(Nil);
       try
         qckFactServ8_5BB.TPag.Caption:=
         IntToStr(qckFactServ8_5BB.PageNumber);
         qckFactServ8_5BB.xtipoVenta := TipoVenta;
         qckFactServ8_5BB.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;
         if (GlbImpReciboSinPreg = 1) then
           qckFactServ8_5BB.Print
           else
           if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
           begin
             qckFactServ8_5BB.PrinterSetup;
             qckFactServ8_5BB.Print;
           end else
           qckFactServ8_5BB.Preview;
           if (GlbImpReciboSinPreg = 0) then
           if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
            begin
              qckFactServ8_5BB.Preview;
            end;
        finally
        qckFactServ8_5BB.Free;
        qckFactServ8_5BB:=Nil;
        end;
      finally
      if Assigned(frmConsultaFacturas) then
         frmConsultaFacturas.Free;
         frmConsultaFacturas:=Nil;
     end;
    end else
    if ((UpperCase(GLBFormatoFactura) = 'CASANDRA2') or (UpperCase(GLBFormatoFactura) = 'FORMATOGENERAL')) then  //PENDIENTE DE ANALISIS
    begin
      frmConsultaFacturas:=TfrmConsultaFacturas.Create(Nil);
      try
        frmConsultaFacturas.rdgCredito.Checked := True;
        frmConsultaFacturas.EditN1.SetInteger(serieDoc);
        frmConsultaFacturas.BitBtn1Click(Self);

        dmfactura.qryFactReimpMaster.Close;
        dmfactura.qryFactReimpMaster.Params[0].Value:=serieDoc;

        dmfactura.qryFactReimpDet.Close;
        dmfactura.qryFactReimpDet.Params[0].Value:=serieDoc;
        dmfactura.qryFactReimpDet.Open;
        dmfactura.qryFactReimpDet.Last;
        dmfactura.qryFactReimpDet.Close;

        dmfactura.qryFactReimpMaster.Open;

        LlenarrxSolDatoscte(dmFactura.qryVentaFacturaCODIGO_CTE.Value);
        if frmConsultaFacturas.rdgCredito.Checked then
        TipoVenta:='CREDITO'
        else
        tipoVenta:='CONTADO';//dmFactura.qryFactReimpMaster.RecordCount

        if (GlbFact3Pulg = 1) then
        begin
          if (GlbActivaIFiscal = 0) then
          begin
            qckRepFactPuntoVenta:=TqckRepFactPuntoVenta.Create(Nil);
            try
             qckRepFactPuntoVenta.QRLabel14.Enabled:=False;
            
            //pulgadaInc:=0.86;
            //temporal
            //{
            if dmFactura.qryVentaFacturaDet.RecordCount = 1 then
            qckRepFactPuntoVenta.Page.Length:= 5
            else
            if dmFactura.qryVentaFacturaDet.RecordCount >= 2 then
            qckRepFactPuntoVenta.Page.Length:= qckRepFactPuntoVenta.Page.Length +
            (dmFactura.qryVentaFacturaDet.RecordCount - 1 ) * 0.25;

            flag:=true;
            qckRepFactPuntoVenta.Prepare;
            rxventa.DisableControls;
            rxdbgrid1.Enabled:=False;
            if (dmFactura.qryVentaFacturaDet.RecordCount > 1) or (qckRepFactPuntoVenta.PageNumber > 1) then
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
            qckRepFactPuntoVenta:=TqckRepFactPuntoVenta.Create(Nil);
            //pulgadaInc:=0.86;
            //temporal
            //{
            if dmFactura.qryVentaFacturaDet.RecordCount = 1 then
            qckRepFactPuntoVenta.Page.Length:= 5
            else
            if dmFactura.qryVentaFacturaDet.RecordCount >= 2 then
            qckRepFactPuntoVenta.Page.Length:= qckRepFactPuntoVenta.Page.Length +
            (dmFactura.qryVentaFacturaDet.RecordCount - 1 ) * 0.25;

            flag:=true;
            qckRepFactPuntoVenta.Prepare;
            rxventa.DisableControls;
            rxdbgrid1.Enabled:=False;
            if (dmFactura.qryVentaFacturaDet.RecordCount > 1) or (qckRepFactPuntoVenta.PageNumber > 1) then
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
  if not dmVentas.tblPOSTotalesTipoNCF.IsNull then
  ProcGetUltNcf(dmVentas.tblPOSTotalesTipoNCF.Value);
end;

procedure TfrmProcVentaRapida.StatusBarClick(Sender: TObject);
begin
  ProcActualizaMsg;
  RxDBLookupCombo3Change(Self);

  if Not CheckPortComDisponible then
  begin
    if GlbActivaIFiscal = 1 then
    lblStatusImpFiscal.Visible := True;
    lblStatusImpFiscal.Font.Color:= clRed;
  end else
  begin
    lblStatusImpFiscal.Visible := False;
  end;
end;

procedure TfrmProcVentaRapida.ProcGetDatosDevparaNotaCR;
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

procedure TfrmProcVentaRapida.VerDetalleVenta1Click(Sender: TObject);
begin
  if not Assigned(frmVerDet) then
  frmVerDet:=TfrmVerDet.Create(Nil);
  try
    frmVerDet.Show;
  finally
  end;
end;

procedure TfrmProcVentaRapida.FormClose(Sender: TObject;
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
  try
    if numRecoverMaster > 0 then
    begin
      tblRecoverMater.Close;
      tblRecoverMater.Params[0].Value:= numRecoverMaster;
      tblRecoverMater.Open;
      if tblRecoverMater.RecordCount > 0 then
      tblRecoverMater.Delete;
      GlbSalvarQuery(tblRecoverMater);
      lblFechaCotizacion.Visible:= False;
      dbFechaCotizacion.Visible := False;
      Label36.Visible := False;
      Label36.caption:='';
    end;
    except
    end;
    numrecoverMaster:=-1;  
end;

procedure TfrmProcVentaRapida.CheckBox1Click(Sender: TObject);
begin
  if Not CheckBox1.Checked then
  begin
    if (dmVentas.tblPOSTotales.State = dsBrowse) then
    dmVentas.tblPOSTotales.Edit;
    dmVentas.tblPOSTotalesTipoNCFIFiscal.AsVariant := Null;
    
    dmVentas.tblPOSTotalesTipoNCF.AsVariant := Null;
    if (dmVentas.tblPOSTotales.State In [dsEdit, dsInsert]) then
    GlbSalvarQuery(dmVentas.tblPOStotales);
  end;
end;

procedure TfrmProcVentaRapida.ReimprimirFacturaNoFiscal(numTRN : Integer);
var
  tRecordsDet : integer;
  ImpPDF, flag : boolean;
    
  pulgadaInc : Real;
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
        if (GlBAyaco= 1) then
    begin
      dmreportes.qryViewVentasMast.Close;
      dmreportes.qryViewVentasMast.Params[0].Value:= dmfactura.qryVentaFacturaNUMERO.Value;
      dmreportes.qryViewVentasMast.Open;
      qckFactServ8_5Ayaco:=TqckFactServ8_5Ayaco.Create(Nil);
      try
        qckFactServ8_5Ayaco.TPag.Caption:=
        IntToStr(qckFactServ8_5Ayaco.PageNumber);
        qckFactServ8_5Ayaco.xtipoVenta := TipoVenta;
        qckFactServ8_5Ayaco.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;
        if (GlbImpReciboSinPreg = 1) then
           qckFactServ8_5Ayaco.Print
        else
        if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
        begin
          qckFactServ8_5Ayaco.PrinterSetup;
          qckFactServ8_5Ayaco.Print;
        end else
        qckFactServ8_5Ayaco.Preview;

        if (GlbImpReciboSinPreg = 0) then
        if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
        begin
          qckFactServ8_5Ayaco.Preview;
        end;
        finally
        qckFactServ8_5Ayaco.Free;
        qckFactServ8_5Ayaco:=Nil;
        end;
      end else
    if (GlBBurgos = 1) then
    begin
      dmreportes.qryViewVentasMast.Close;
      dmreportes.qryViewVentasMast.Params[0].Value:= dmfactura.qryVentaFacturaNUMERO.Value;
      dmreportes.qryViewVentasMast.Open;    
      qckFactServ8_5BB:=TqckFactServ8_5BB.Create(Nil);
      try
        qckFactServ8_5BB.TPag.Caption:=
        IntToStr(qckFactServ8_5BB.PageNumber);
        qckFactServ8_5BB.xtipoVenta := TipoVenta;
        qckFactServ8_5BB.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;
        if (GlbImpReciboSinPreg = 1) then
           qckFactServ8_5BB.Print
        else
        if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
        begin
          qckFactServ8_5BB.PrinterSetup;
          qckFactServ8_5BB.Print;
        end else
        qckFactServ8_5BB.Preview;

        if (GlbImpReciboSinPreg = 0) then
        if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
        begin
          qckFactServ8_5BB.Preview;
        end;
        finally
        qckFactServ8_5BB.Free;
        qckFactServ8_5BB:=Nil;
        end;
      end else
    if (UpperCase(GLBFormatoFactura) = 'CASANDRA2') or ((UpperCase(GLBFormatoFactura) = 'FORMATOGENERAL')) then  //PENDIENTE DE ANALISIS
    begin
      if (GlbRec3Pulg = 1) then
      //and (8=9)) then //temporals
      begin
{        RxDBGrid1.DataSource:= datasource3;
        dbtext1.DataField:='';
        dbtext1.DataSource:= datasource3;
        dbedit1.DataField:='';
        dbedit1.DataSource:= datasource3;
        dbedit2.DataField:='';
        dbedit2.DataSource:= datasource3;
        dbedit3.DataField:='';
        dbedit3.DataSource:= datasource3;   }
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
        dmreportes.qryViewVentasMast.Close;
        dmreportes.qryViewVentasMast.Params[0].Value:= ipStpInsertVentMast.Params[0].Value;
        dmreportes.qryViewVentasMast.Open;

        {RxDBGrid1.DataSource:= dmventas.dstblPOSTotales;
        dbtext1.DataField:='Descripcion';
        dbtext1.DataSource:= dmventas.dstblPOSTotales;
        dbedit1.DataSource:= dmventas.dstblPOSTotales;
        dbedit1.DataField:='Cant';
        dbedit2.DataSource:= dmventas.dstblPOSTotales;
        dbedit2.DataField:='Precio';
        dbedit3.DataSource:= dmventas.dstblPOSTotales;
        dbedit3.DataField:='MontoBruto';}

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
        //Formato 5.5
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
    //begin
    //  ImpFacturaservicio(dmfactura.qryFactReimpMaster.Params[0].Value,True);
    //end;
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
  end else
  begin
    qckRepFactPuntoVenta:=TqckRepFactPuntoVenta.Create(Nil);

    try
      qckRepFactPuntoVenta.QRLabel14.Enabled:=False;
      pulgadaInc:=0.86;
            //temporal
            //{
      if dmFactura.qryVentaFacturaDet.RecordCount = 1 then
      qckRepFactPuntoVenta.Page.Length:= 5
      else
      if dmFactura.qryVentaFacturaDet.RecordCount >= 2 then
      qckRepFactPuntoVenta.Page.Length:= qckRepFactPuntoVenta.Page.Length +
      (dmFactura.qryVentaFacturaDet.RecordCount - 1 ) * 0.25;

      flag:=true;
      qckRepFactPuntoVenta.Prepare;
      rxventa.DisableControls;
      rxdbgrid1.Enabled:=False;
      if (dmFactura.qryVentaFacturaDet.RecordCount > 1) or (qckRepFactPuntoVenta.PageNumber > 1) then
      begin
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
  end;// else
  //MessageDlg('Número factura no econtrado verifique',mtInformation, [mbOK], 0);
  end;
  end;
end;

procedure TfrmProcVentaRapida.BitBtn15Click(Sender: TObject);
begin
  esContado:=False;
  ReimprimirFacturaNoFiscal(0);
end;

procedure TfrmProcVentaRapida.VerTipoComprobantes1Click(Sender: TObject);
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

procedure TfrmProcVentaRapida.RxDBLookupCombo1Change(Sender: TObject);
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

procedure TfrmProcVentaRapida.tablaPropietarioAfterOpen(DataSet: TDataSet);
begin
  lblRNC.Caption:= '';
end;

procedure TfrmProcVentaRapida.rxVentaXXXAfterClose(DataSet: TDataSet);
begin
  lblRNC.Caption:='';
end;

procedure TfrmProcVentaRapida.ListarPuertosCom1Click(Sender: TObject);
begin
  frmPuertosLibres:=TfrmPuertosLibres.Create(nil);
  try
    frmPuertosLibres.Showmodal;
  finally
  frmPuertosLibres.free;
  frmPuertosLibres:=nil;
  end;
end;

function TfrmProcVentaRapida.CheckPortComDisponible: boolean;
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

procedure TfrmProcVentaRapida.ReImprimeDevolucionsinFact1Click(
  Sender: TObject);
  var
  _xflag : Boolean;
begin
  _xflag := True;
  ReImpDevolucion(UProcesarDevolucion.numeroFactura,_xflag);
  //ReImprimeDevolucion1Click(Self);
end;

procedure TfrmProcVentaRapida.ReImpDevolucion(numDev : Integer;var _flag : boolean);
var
  flag : Boolean;
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
    MessageDlg('Número devolución no encontrada, verifique.',mtInformation,[mbok], 0);
    _flag := False;
    exit;
  end;
  dmreportes.qryViewVentasMast.Close;
  dmreportes.qryViewVentasMast.Params[0].Value:= dmfactura.qryFactReimpMasterNUMERO.Value;
  dmreportes.qryViewVentasMast.Open;
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
      if EsReimp then
      TipoVenta:= 'Devolución'+' (Re-Impresion)'
      else
      TipoVenta:= 'Devolución';
      if (GlbRec3Pulg = 1) then
      begin
        qckRepReciboDevol3Pulg:=TqckRepReciboDevol3Pulg.Create(Nil);
        try
          if GlbImpCodProducto = 1 then
          begin
            qckRepReciboDevol3Pulg.QRLabel27.Enabled := False;
            qckRepReciboDevol3Pulg.QRDBText5.Enabled:= False;
          end else
          begin
            qckRepReciboDevol3Pulg.QRLabel27.Enabled:= True;
            qckRepReciboDevol3Pulg.QRDBText5.Enabled:= True;
          end;

          if Length(dmVentas.tblPOSTotalesNombreCliente.Value) > 0 then
          dmVentas.tblPOSTotales.RecordCount;
          if dmFactura.qryVentaFacturaNOMBRE_FACTURAR.IsNull then
          qckRepReciboDevol3Pulg.nombreCteGenerico := dmFactura.qryVentaFacturaNOMBRE_CLIENTE_GENERAL.Value
          else
          qckRepReciboDevol3Pulg.nombreCteGenerico := dmFactura.qryVentaFacturaNOMBRE_FACTURAR.Value;
          if Length(edtObservacion.Text) > 0 then
          qckRepReciboDevol3Pulg.nombreCteGenerico := edtObservacion.Text;

          qckRepReciboDevol3Pulg.xtipoVenta:= TipoVenta;
          qckRepReciboDevol3Pulg.valorNCF  := dmFactura.qryVentaFacturaNUMERO_NCF.Value;

          //qckRepReciboDevol3Pulg.qrLabelRNC.Caption := dmFactura.qryVentaFacturaRNC_NUMERO.Value;

          if rxVenta.RecordCount = 1 then
          qckRepReciboDevol3Pulg.Page.Length:= 5
          else
          if rxVenta.RecordCount >= 2 then
          qckRepReciboDevol3Pulg.Page.Length:= qckRepReciboDevol3Pulg.Page.Length +
          (rxVenta.RecordCount - 1 ) * 0.25;

          flag:=True;
          repeat
          begin
            qckRepReciboDevol3Pulg.Prepare;
            if qckRepReciboDevol3Pulg.PageNumber > 1 then
            begin
              qckRepReciboDevol3Pulg.Page.Length := qckRepReciboDevol3Pulg.Page.Length + 0.25;
              qckRepReciboDevol3Pulg.Prepare;
              flag:=False;
            end else break;
          end;
        until flag = true;

        if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
        qckRepReciboDevol3Pulg.Print else
        qckRepReciboDevol3Pulg.Preview;
        finally
        qckRepReciboDevol3Pulg.Free;
        qckRepReciboDevol3Pulg:=Nil;
      end;
      end else
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
        begin  //ven aqui
          //if GlbRec3Pulg = 1 then
          // begin
            //put code here
          // end else
          if (GlBAyaco = 1) then
          begin
            qckFactServ8_5Ayaco:=TqckFactServ8_5Ayaco.Create(Nil);
            try
              qckFactServ8_5Ayaco.TPag.Caption:=
              IntToStr(qckFactServ8_5Ayaco.PageNumber);
              qckFactServ8_5Ayaco.xtipoVenta := 'Devolución';
              qckFactServ8_5Ayaco.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;
              if (GlbImpReciboSinPreg = 1) then
                 qckFactServ8_5Ayaco.Print
              else
              if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
              begin
                qckFactServ8_5Ayaco.PrinterSetup;
                qckFactServ8_5Ayaco.Print;
              end else
              qckFactServ8_5Ayaco.Preview;

              if (GlbImpReciboSinPreg = 0) then
              if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
              begin
                qckFactServ8_5Ayaco.Preview;
              end;
            finally
            qckFactServ8_5Ayaco.Free;
            qckFactServ8_5Ayaco:=Nil;
          end;
        end else
        if (GlBBurgos = 1) then
        begin
          qckFactServ8_5BB:=TqckFactServ8_5BB.Create(Nil);
          try
            qckFactServ8_5BB.TPag.Caption:=
            IntToStr(qckFactServ8_5BB.PageNumber);
            qckFactServ8_5BB.xtipoVenta := 'Devolución';
            qckFactServ8_5BB.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;
            if (GlbImpReciboSinPreg = 1) then
            qckFactServ8_5BB.Print
            else
            if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
            begin
              qckFactServ8_5BB.PrinterSetup;
              qckFactServ8_5BB.Print;
            end else
            qckFactServ8_5BB.Preview;

            if (GlbImpReciboSinPreg = 0) then
            if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
            begin
              qckFactServ8_5BB.Preview;
            end;
          finally
          qckFactServ8_5BB.Free;
          qckFactServ8_5BB:=Nil;
        end;
      end else
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
          qckFactServArtioffice8_5.xtipoVenta := 'Devolución';
          qckFactServArtioffice8_5.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;;
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
        qckFactCredArtioffice8_5_F_1:=TqckFactCredArtioffice8_5_F_1.Create(Nil);
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
          qckFactCredArtioffice8_5_F_1.Free;
          qckFactCredArtioffice8_5_F_1:=Nil;
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
    NoTieneCredito  := False;
    Refresh;
    EsDevolucion    := False;
    //dmVentas.tblPOSTotales.EmptyTable;

    lblProcDev.Visible := False;
    UProcesarDevolucion.numeroFactura := 0;
    dmFactura.qryVentaFactura.Close;
    dmFactura.qryDatosTrncxc.Close;
    dmfactura.qryFactReimpDet.Close
end;

//Procesar Devolución Ventas Cash sin Cliente
procedure TfrmProcVentaRapida.ProcDevoluconCash;
var
  x : Integer;
begin
  numeroTrnVta:= 0;
  dmVentas.tblPOSTotalesTipoNCFIFiscal.Value;
  dmVentas.tblPOSTotalesTipoNCF.Value;
  if EsModificandoCotiza then Exit;

  if (rxVenta.RecordCount > 0) and (not EsDevolucion) then
  begin
    if (dmVentas.tblPOSTotalesSubTotal.Value <= 0) then
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
      if (dmVentas.tblPOSTotalesTipoNCFIFiscal.Value = -1) then
      begin
        dmVentas.tblPOSTotales.Edit;
        dmVentas.tblPOSTotalesTipoNCFIFiscal.Value:= 2;//2;
        GlbSalvarQuery(dmVentas.tblPOStotales);
      end else
      if (dmVentas.tblPOSTotalesTipoNCFIFiscal.Value = 0) then
      begin
        dmVentas.tblPOSTotales.Edit;
        dmVentas.tblPOSTotalesTipoNCFIFiscal.Value:=dmFactura.ibQryViewNCFTIPO_NCFNCR.Value;//2;
        GlbSalvarQuery(dmVentas.tblPOStotales);
      end else
      if (dmVentas.tblPOSTotalesTipoNCFIFiscal.Value = 1) then
      begin
        dmVentas.tblPOSTotales.Edit;
        dmVentas.tblPOSTotalesTipoNCFIFiscal.Value:=dmFactura.ibQryViewNCFTIPO_NCFNCR.Value;//3;
        dmVentas.tblPOSTotales.Post;
      end else
      if (dmVentas.tblPOSTotalesTipoNCFIFiscal.Value = 5) then
      begin
        dmVentas.tblPOSTotales.Edit;
        dmVentas.tblPOSTotalesTipoNCFIFiscal.Value:=dmFactura.ibQryViewNCFTIPO_NCFNCR.Value;
        dmVentas.tblPOSTotales.Post;
      end else
      if (dmVentas.tblPOSTotalesTipoNCFIFiscal.Value = 4) then
      begin
        dmVentas.tblPOSTotales.Edit;
        dmVentas.tblPOSTotalesTipoNCFIFiscal.Value:=dmFactura.ibQryViewNCFTIPO_NCFNCR.Value;
        dmVentas.tblPOSTotales.Post;
      end else
      begin
        MessageDlg('No permitido', mtInformation, [mbok],0);
        Exit;
      end;
      end else
      begin
        dmVentas.tblPOSTotales.Edit;
        dmVentas.tblPOSTotalesTipoNCFIFiscal.AsVariant:= null;
        dmVentas.tblPOSTotalesTipoNCF.AsVariant := null;
        dmVentas.tblPOSTotales.Post;
      end;

     if dmVentas.tblPOSTotalesMoneda.IsNull then
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
      UProcesarDevolucion.monto    := dmVentas.tblPOSTotalestotalneto.Value;
      UProcesarDevolucion.status   := 'A';
      UProcesarDevolucion.Moneda   := Trim(dmVentas.tblPOSTotalesMoneda.Value);
      UProcesarDevolucion.codig_usuario := VarUsuarioGlb;
      UProcesarDevolucion.fechaInsert   := Now;;
      UProcesarDevolucion.fechaUpdate   := Now ;
      UProcesarDevolucion.codigousuarioupd := VarUsuarioGlb;
      UProcesarDevolucion.tipodoc := 5; //Nota Credito
      UProcesarDevolucion.numeroFactura := rxVentaNumeroFactura.Value;
      if dmVentas.tblPOSTotalesTipoNCFIFiscal.IsNull then
      UProcesarDevolucion.GeneraNCF:= False
      else
      UProcesarDevolucion.GeneraNCF:= True;
      //UProcesarDevolucion.UpdateBLCCXC := dmFactura.qryVentaFacturaNUMEROFACTURA.Value > 0;
      if dmFactura.qryVentaFacturaFORMA_PAGO.Value in [7,8,15] then
       UProcesarDevolucion.UpdateBLCCXC  := True
      else
      UProcesarDevolucion.UpdateBLCCXC := False;

      if UProcesarDevolucion.GeneraNCF then
      begin
        dmfactura.ibqryViewNCF.Close;
        dmFactura.ibQryViewNCF.Close;
        if dmFactura.ibQryViewNCF.Prepared then
        dmFactura.ibQryViewNCF.UnPrepare;
        dmFactura.ibQryViewNCF.SQL.Text := dmFactura.ibQryViewNCF_0.SQL.Text;
        dmfactura.ibqryViewNCF.Open;

        //strnametipocf:='TIPO_CF;tipo_ncf_ifiscal';

        {if Not dmFactura.ibQryViewNCF.Locate('TIPO_CF;tipo_ncf_ifiscal',
        VarArrayOf(['04', dmVentas.tblPOSTotalesTipoNCFIFiscal.Value]), []) then
        begin
          MessageDlg('Verifique configuración NCF. Reporte a soporte usuario.', mtError,[mbOk], 0);
          //t exit;
        end; }
        UProcesarDevolucion.Ejecutar('04', dmVentas.tblPOSTotalesTipoNCFIFiscal.Value, dmFactura.qryVentaFacturaNUMERO.Value)//Comprogante Fiscal Nota de Credito
      end else
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
          dmreportes.qryViewVentasDet.Last;
          frmTestImpresoraFiscal.tRecord:= dmReportes.qryViewVentasDet.RecordCount;
          dmReportes.qryViewVentasDet.First;

          frmTestImpresoraFiscal.ncfAfectado := dmReportes.qryViewVentasMastNUMERO_NCF.Value;
          frmTestImpresoraFiscal.LCantCopias := rxspinImpCantCopias.Text;
          frmTestImpresoraFiscal.BitBtn1Click(Self);
          StatusImpFiscal:=True;
          frmTestImpresoraFiscal.btnImprimeReciboClick(Self);
        finally
        frmTestImpresoraFiscal.Free;
        frmTestImpresoraFiscal:= Nil;
        end;
        StatusImpFiscal:=False;
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
//    rxventa.EmptyTable;
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
    //dmVentas.tblPOSTotales.EmptyTable;
    lblProcDev.Visible := False;
    tablaPropietario.Close;
    tablaPropietario.Open;
//  rxventa.EmptyTable;
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

procedure TfrmProcVentaRapida.ProcInsertarVtaMastCashEnDev(var NumTrnGen : Integer; var NumOrden : Integer);
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
  if dmVentas.tblPOSTotalesMoneda.IsNull then
  ipStpInsertVentMast.Params[7].Value    := '1'
  else
    ipStpInsertVentMast.Params[7].Value    := dmVentas.tblPOSTotalesMoneda.Value;

  ipStpInsertVentMast.Params[8].Value    := dmVentas.tblPOSTotalestotalneto.Value; //EditN1.Text;
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
  ipStpInsertVentMast.Params[17].Value:= dmVentas.tblPOSTotalesSubTotal.Value;
  ipStpInsertVentMast.Params[18].Value:= dmVentas.tblPOSTotalesPorcDesAdicional.Value;
  if dmVentas.tblPOSTotalesMontoDescAdicional.Value > 0 then
  ipStpInsertVentMast.Params[19].Value:= dmVentas.tblPOSTotalesMontoDescAdicional.Value
  else
  ipStpInsertVentMast.Params[19].Value:= dmVentas.tblPOSTotalesMontoDescItems.Value;//dmVentas.tblPOSTotalesMontoDescAdicional.Value  * -1;
  ipStpInsertVentMast.Params[20].Value:= Abs(dmVentas.tblPOSTotalestotalneto.Value);
  ipStpInsertVentMast.Params[21].Value:= dmVentas.tblPOSTotalesdevolucion.Value;
  ipStpInsertVentMast.Params[22].Value:= dmVentas.tblPOSTotalesitbis.Value;
  ipStpInsertVentMast.Params[23].Value:= Abs(dmVentas.tblPOSTotalestotalneto.Value);
  if (edtObservacion.Text <> '') then
  ipStpInsertVentMast.Params[24].Value:= edtObservacion.Text
  else ipStpInsertVentMast.Params[24].Value:= '';

  ipStpInsertVentMast.Params[25].Value:= dmVentas.tblPOSTotalesMontoDescGastosAdmin.Value;
  ipStpInsertVentMast.Params[26].Value:= dmVentas.tblPOSTotalesMontoDescItbisGastosAdmin.Value;
  ipStpInsertVentMast.Params[27].Value:= dmVentas.tblPOSTotalesMontoDescTransp.Value;
  ipStpInsertVentMast.Params[28].Value:= dmVentas.tblPOSTotalesMontoDescDirtecnica.Value;
  ipStpInsertVentMast.Params[29].Value:= dmVentas.tblPOSTotalesMontoDescItbisDirTecnica.Value;
  ipStpInsertVentMast.Params[30].Value:= dmVentas.tblPOSTotalesMontoDescImprevisto.Value;
  ipStpInsertVentMast.Params[31].Value:= dmVentas.tblPOSTotalesMontoDescItbisImprevisto.Value;
  ipStpInsertVentMast.Params[32].Value:= dmVentas.tblPOSTotalesComentario.Value;
  ipStpInsertVentMast.Params[33].Value:= rxVentaNumeroCotiza.Value;
  ipStpInsertVentMast.Params[34].Value:= dmVentas.tblPOSTotalesReferenciaCte.Value;
  ipStpInsertVentMast.Params[35].Value:= dmVentas.tblPOSTotalesRecargo.Value;
  ipStpInsertVentMast.Params[36].Value:= dmVentas.tblPOSTotalesTipoNCFIFiscal.Value;
  ipStpInsertVentMast.Params[37].Value:= dmVentas.tblPOSTotalesMontoExoneraITBIS.Value;
  ipStpInsertVentMast.Params[38].Value:= 0;
  ipStpInsertVentMast.Params[39].Value:= dmVentas.tblPOSTotalesPropina.Value;
  ipStpInsertVentMast.Params[40].Value:= GlbPorcPropina;
  ipStpInsertVentMast.Params[41].Value:= dmVentas.tblPOSTotalesPropinaLegal.Value;

  ipStpInsertVentMast.ExecProc;
  numeroTrnVta:= ipStpInsertVentMast.Params[0].Value;
  if (dmVentas.tblPOSTotalesTipoNCF.Value = '15') OR (dmVentas.tblPOSTotalesTipoNCF.Value = '14') then
  begin
    updTipoRetencionVta.Params[0].Value:= 1;//LEY RETENCION GOV y ONG
    updTipoRetencionVta.Params[1].Value:= ipStpInsertVentMast.Params[0].Value;
    updTipoRetencionVta.ExecQuery;
    if Not updTipoRetencionVta.Transaction.InTransaction then
    updTipoRetencionVta.Transaction.StartTransaction;
    try
      updTipoRetencionVta.Transaction.CommitRetaining;
    except
    updTipoRetencionVta.Transaction.RollbackRetaining;
    end;    
  end;
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
  ActFastFoodTicket(NumTicketFFood);
  NumTrnGen:= ipStpInsertVentMast.Params[0].Value;

end;

procedure TfrmProcVentaRapida.InsertarDetDevolucionCash(numero: Integer);
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
  if (ABS(dmVentas.tblPOSTotalesMontoExoneraITBIS.Value) > 0) then
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
  ibStpInsertVentaDet.Params[33].Value := rxVentaCantPax.Value;  
  
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
procedure TfrmProcVentaRapida.UpdateServINFO(numVta: integer);
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
          dmVentas.tblRegServicioMasterNUM_TRNVENTA.Value:= numVta;
          dmVentas.tblRegServicioMasterSTATUS.Value      := 'R';
          dmVentas.tblRegServicioMasterFECHA_SALIDA.Value:= ExtraerFecha(GlbFechaTrnDiaria);
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

procedure TfrmProcVentaRapida.DBEdit1Change(Sender: TObject);
begin
  //dmCalculos.esFeedback:=True;
  GlbAlreadyCld := False;
end;

procedure TfrmProcVentaRapida.DBEdit2Change(Sender: TObject);
begin
  //dmCalculos.esFeedback:=True;
  GlbAlreadyCld := False;
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
    if Assigned(frmProcVentaRapida) then
    begin
      Hide;
      frmAlquiler.Show;
    end;
  finally
  //frmAlquiler.Free;
  //frmAlquiler:=Nil;
  end;
end;

procedure TfrmProcVentaRapida.RxSpinEdit1Exit(Sender: TObject);
begin
  procCalc:=True;
  BitBtn27Click(Self);
end;

procedure TfrmProcVentaRapida.UpdateServAlquiler(numVta: integer);
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

procedure TfrmProcVentaRapida.tablaPropietarioBeforePost(
  DataSet: TDataSet);
  var  xx:smallint;
begin
  xx:=0;
end;

procedure TfrmProcVentaRapida.Lavanderia1Click(Sender: TObject);
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

procedure TfrmProcVentaRapida.LavanderiaEntrada1Click(Sender: TObject);
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

procedure TfrmProcVentaRapida.Costura1Click(Sender: TObject);
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

procedure TfrmProcVentaRapida.CosturaEntrada1Click(Sender: TObject);
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

procedure TfrmProcVentaRapida.BitBtn29Click(Sender: TObject);
begin
  BitBtn9Click(Self);
end;

procedure TfrmProcVentaRapida.btnPagoExactoClick(Sender: TObject);
begin
  if (dmVentas.tblPOSTotalestotalneto.Value > 0) then
  begin
    Edit1.Text:=Format('%8.2f', [dmVentas.tblPOSTotalestotalneto.Value]);
    Edit1Exit(Self);
  end;
end;

procedure TfrmProcVentaRapida.DBEdit9Change(Sender: TObject);
begin
  GlbAlreadyCld := False;
end;

procedure TfrmProcVentaRapida.DBEdit10Change(Sender: TObject);
begin
  GlbAlreadyCld := False;
end;

procedure TfrmProcVentaRapida.chkNoLeyPropinaClick(Sender: TObject);
begin
  if chkNoLeyPropina.Checked then
  begin
   procCalc:=True;  
    BitBtn27Click(Self);
  end;
end;

procedure TfrmProcVentaRapida.NotificaErrorByEmail(sms:string);
begin
  dmCompania.qryEmailProceso.Close;
  dmCompania.qryEmailProceso.Open;

  if dmCompania.qryEmailProceso.Locate('IDTIPO',900,[]) then
  begin
    ProcLogTrackingEmailAviso(900,dmCompania.qryEmailProcesoEMAIL_SERVER.Value,
    dmCompania.qryEmailProcesoPORT.AsString,dmCompania.qryEmailProcesoUSER_EMAIL.Value,
    Desencriptar(dmCompania.qryEmailProcesoUSER_PASSWORD.Value,2005),
    Now,'nosivid@hotmail.com',dmCompania.qryEmailProcesoFROMEMAIL.Value,
    dmCompania.qryEmailProcesoSUBJECT.Value+' -CIA:'+
    dmCompania.tblCompaniaNOMBRE.Value+
    ' Sucursal : '+dmCompania.tblCompaniaCIUDAD.AsString+' '+FormatDateTime('dd/mm/yyyy hh:mm a/p',now),
    'Email: '#13''+dmCompania.tblCompaniaEMAIL.Value + ''#13''+
    sms+ ''#13'',
    //xVersion + ''#13'Cantidad de veces de uso disponible: '+IntToStr(qtyCorr),
  VarUsuarioGlb,'A','', Now, StrUserName, FormatDateTime('dd/mm/yyyy hh:mm a/p', Now),StrUserName,'');
  end;
end;

procedure TfrmProcVentaRapida.ActFastFoodTicket(numTicket:Integer);
begin
  if (Not GLBEsFastFood) then Exit;
  if (numTicket <= 0) then Exit;
  dmFastfood.tblAdoTicketUpdate.Close;
  dmFastfood.tblAdoTicketUpdate.Parameters[0].Value:= numTicket;
  dmFastfood.tblAdoTicketUpdate.Open;
  dmFastfood.tblAdoTicketUpdate.First;
  dmFastfood.tblAdoTicketUpdate.Edit;
  dmFastfood.tblAdoTicketUpdateProcessFiscalYN.Value:='Y';
  dmFastfood.tblAdoTicketUpdate.Post;
end;

procedure TfrmProcVentaRapida.AbrirDatosParaTicket(
          CheckBox1_Checked:Boolean;
          rdgCredito_Checked:boolean;
          edtCodCte_Text:String;
          EditN1_ValueInteger:integer;
          DateTimePicker1_Date:TDateTime
          );
begin
  dmFactura.qryVentaFactura.Close;
  if rdgCredito_Checked then
  dmFactura.qryVentaFactura.SQL.Text:=dmFactura.qryVentaFactura_0.SQL.Text+
  ' Where facturas.NUMERO is not null and ventas_mast.FORMA_PAGO = 7 order by ventas_mast.numero'
  else
  dmFactura.qryVentaFactura.SQL.Text:=dmFactura.qryVentacontado_0.SQL.Text+
  ' Where VENTAS_MAST.NUMERO_DOC_PAGO is not null and ventas_mast.FORMA_PAGO <> 7 order by ventas_mast.numero';

  if CheckBox1_Checked then
  begin
    dmFactura.qryVentaFactura.Open;
  end else
  if (EditN1_ValueInteger > 0) then
  begin
    if (edtCodCte_Text = '') then
    begin
      if rdgCredito_Checked then
      dmFactura.qryVentaFactura.SQL.Text:=
      dmFactura.qryVentaFactura_0.SQL.Text +
      ' Where facturas.NUMERO =:numero and ventas_mast.FORMA_PAGO = 7 '+
      ' And ventas_mast.cia_key =:ciakey and ventas_mast.FORMA_PAGO = 7'
      else
      dmFactura.qryVentaFactura.SQL.Text:=dmFactura.qryVentacontado_0.SQL.Text +
      ' Where VENTAS_MAST.NUMERO_DOC_PAGO =:numero And ventas_mast.cia_key =:ciakey '+
      'and ventas_mast.FORMA_PAGO <> 7';
      dmFactura.qryVentaFactura.Params[0].AsInteger:= editn1_ValueInteger;
      dmFactura.qryVentaFactura.Params[1].AsInteger:= glbCia_Key;
    end else
    begin
      if StrToInt(edtCodCte_Text) > 0 then
      begin
        if rdgCredito_Checked then
        begin
        dmFactura.qryVentaFactura.SQL.Text:=
        dmFactura.qryVentaFactura_0.SQL.Text + ' Where VENTAS_MAST.NUMERO_FACTURA =:numero '+
        ' and VENTAS_MAST.Codigo_cte =:codcte  And ventas_mast.cia_key =:ciakey' +
        ' and ventas_mast.FORMA_PAGO = 7'
        end else
        begin
          dmFactura.qryVentaFactura.SQL.Text:=
          dmFactura.qryVentacontado_0.SQL.Text + ' Where VENTAS_MAST.NUMERO_DOC_PAGO =:numero '+
          ' and VENTAS_MAST.Codigo_cte =:codcte  And ventas_mast.cia_key =:ciakey '+
          'and ventas_mast.FORMA_PAGO <> 7';
        end;
        dmFactura.qryVentaFactura.Params[0].AsInteger := editn1_ValueInteger;
        dmFactura.qryVentaFactura.Params[1].AsInteger := StrToInt(edtCodCte_Text);
        dmFactura.qryVentaFactura.Params[2].AsInteger := glbCia_Key;
      end else
      begin
        if rdgCredito_Checked then
        dmFactura.qryVentaFactura.SQL.Text:=
        dmFactura.qryVentaFactura_0.SQL.Text + ' Where '+
        ' Facturas.NUMERO =:numero And '+
           'VENTAS_MAST.Codigo_cte =:codcte And ' +
           '   ventas_mast.cia_key =:ciakey '+
        ' And ventas_mast.FORMA_PAGO = 7 '
        else
          dmFactura.qryVentaFactura.SQL.Text :=
          dmFactura.qryVentacontado_0.SQL.Text +
          ' Where VENTAS_MAST.NUMERO_DOC_PAGO  =:numero And '+
          ' VENTAS_MAST.Codigo_cte =:codcte And '+
          '    ventas_mast.cia_key =:ciakey  '+
          ' And ventas_mast.FORMA_PAGO <> 7';
        dmFactura.qryVentaFactura.Params[0].AsInteger := editn1_ValueInteger;
        dmFactura.qryVentaFactura.Params[1].AsInteger := StrToInt(edtCodCte_Text);
        dmFactura.qryVentaFactura.Params[2].AsInteger := glbCia_Key;
      end;
    end;
    dmFactura.qryVentaFactura.Open;
  end else
  if StrToInt(edtCodCte_Text) > 0 then
  begin
    if rdgCredito_Checked then
    dmFactura.qryVentaFactura.SQL.Text:=
    dmFactura.qryVentaFactura_0.SQL.Text + ' Where '+
    'Facturas.NUMERO =:numero And ventas_mast.FORMA_PAGO = 7'+
    ' and VENTAS_MAST.Codigo_cte =:codcte '+
    'And ventas_mast.cia_key =:ciakey' else
    dmFactura.qryVentaFactura.SQL.Text:=dmFactura.qryVentacontado_0.SQL.Text + ' Where '+
    'VENTAS_MAST.NUMERO_DOC_PAGO =:numero and ventas_mast.FORMA_PAGO <> 7'+
    ' and VENTAS_MAST.Codigo_cte =:codcte  '+
        'And ventas_mast.cia_key =:ciakey';

    dmFactura.qryVentaFactura.Params[0].AsInteger := editn1_ValueInteger;
    dmFactura.qryVentaFactura.Params[1].AsInteger := StrToInt(edtCodCte_Text);
    dmFactura.qryVentaFactura.Params[2].AsInteger := glbCia_Key;
    dmFactura.qryVentaFactura.Open;
  end else
  begin
    if rdgCredito_Checked then
    begin
      dmFactura.qryVentaFactura.SQL.Text:=
      dmFactura.qryVentaFactura_0.SQL.Text +
      ' Where VENTAS_MAST.NUMERO_FACTURA =:numero '+
      ' and VENTAS_MAST.Codigo_cte =:codcte  And ventas_mast.cia_key =:ciakey' +
      ' and ventas_mast.FORMA_PAGO = 7';
      dmFactura.qryVentaFactura.Params[0].AsInteger := editn1_ValueInteger;
      dmFactura.qryVentaFactura.Params[1].AsInteger := StrToInt(edtCodCte_Text);
      dmFactura.qryVentaFactura.Params[2].AsInteger := glbCia_Key;
    end else
    begin
      dmFactura.qryVentaFactura.SQL.Text:=
      dmFactura.qryVentacontado_0.SQL.Text +
      ' Where VENTAS_MAST.fecha =:fecha '+
      ' and VENTAS_MAST.NUMERO_DOC_PAGO =:numero and ventas_mast.FORMA_PAGO <> 7'+
      ' And ventas_mast.cia_key =:ciakey';
      dmFactura.qryVentaFactura.Params[0].AsDateTime := ExtraerFecha(DateTimePicker1_Date);
      dmFactura.qryVentaFactura.Params[1].AsInteger := editn1_ValueInteger;
      dmFactura.qryVentaFactura.Params[2].AsInteger := glbCia_Key;
      dmFactura.qryVentaFactura.Open; dmFactura.qryVentaFactura.RecordCount
    end;
  end;
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

procedure TfrmProcVentaRapida.RxDBLookupCombo5Change(Sender: TObject);
var
  xFlag : boolean;
begin
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
      begin        
        if (GlbUsaEscalaPrecio = 0) and (GlbTipoUnidad <> 3) then
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

procedure TfrmProcVentaRapida.RxDBLookupCombo5Enter(Sender: TObject);
begin
  dmVentas.qryPrecioUnidadSurt.Close;
  dmVentas.qryPrecioUnidadSurt.Params[0].Value:=rxVentaCodArticulo.Value;
  dmVentas.qryPrecioUnidadSurt.Open;
  panel2.Visible := False;
  //if (not rxVentaCodArticulo.IsNull) then
  //if (GlbUsaPUnidadLevel = 1) then
  //begin
  //  dminventario.qryTipoUnidad.Filtered:=False;
  //  dmInventario.xcodProducto := rxVentaCodArticulo.AsInteger;
  //  dminventario.qryTipoUnidad.Filtered:=True;
  //end;
end;

procedure TfrmProcVentaRapida.ProcMostrarVersion;
var
  VInfo: TVersionInfo;
  FAppVer, FAppBuild : String;
begin

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

procedure TfrmProcVentaRapida.ReImprimeNCR1Click(Sender: TObject);
begin
  {if (GlbActivaIFiscal = 1) then
  begin

  if rxVenta.RecordCount > 0 then
  begin
    MessageDlg('Terminar o cancelar transacción en curso.',mtInformation,[mbok],0);
    exit;
  end;

  frmConsultaFacturas:=TfrmConsultaFacturas.Create(Nil);
  try
    frmConsultaFacturas.rdgNotaCR.Visible := True;
    frmConsultaFacturas.rdgNotaCR.Checked := True;
    frmConsultaFacturas.rdgContado.Top := 47;
    frmConsultaFacturas.rdgCredito.Top := 61;
    frmConsultaFacturas.rdgNotaCR.Top  := 75;
    frmConsultaFacturas.BitBtn2.Caption:= '&Re-Imprimir';
    if frmConsultaFacturas.Showmodal = mrOK then
    begin
      if frmConsultaFacturas.rdgNotaCR.Checked then
      esContado:=false
      else
      if frmConsultaFacturas.rdgContado.Checked then
         esContado  := True
      else esContado:= False;
      if VerificaClave then
      begin
        if frmConsultaFacturas.rdgNotaCR.Checked then
        esContado:=False
        else
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
  dmdatos.qryConfCajaXusuario.Locate('COD_EMPLEADO', VarUsuarioGlb, []);

  dmReportes.qryDatosCajaImpUser.close;
  dmReportes.qryDatosCajaImpUser.Params[0].Value:= VarUsuarioGlb;
  dmReportes.qryDatosCajaImpUser.Open;
  dmReportes.qryDatosCajaImpUser.Last;
  dmReportes.qryDatosCajaImpUser.RecordCount;

  dmreportes.qryNCFAfectado.Close;//dmreportes.qryDatosVentaMasternumero.value
  dmreportes.qryNCFAfectado.Params[0].Value:= dmreportes.qryDatosVentaMasterSERIE_NCF_ASIGNADO.Value;
  dmreportes.qryNCFAfectado.Open;

  GlbNombreFiletoPrint:= Format('%s%s%s%s%s%s%s',[dmReportes.qryDatosCajaImpUserRUTA_TICKET.Value,'\ReImpRecibo',Trim(GlbCodSucursal),Trim(GlbModeloImpresora),
  IntToStr(VarUsuarioGlb),IntToStr(NumeroTrn),'.txt']);

  PrepararInfoFiscalNCR(dmreportes.qryDatosVentaMasterNUMERO.Value);

  frmBuscarNIF:=TfrmBuscarNIF.Create(Nil);
  try
    if frmBuscarNIF.Showmodal = mrok then
    begin
      if (dmReportes.qryDatosReimpDocFiscal.RecordCount > 0) then
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
      end else
      MessageDlg('No hay nada para imprimir, verifique',mtWarning,[mbok],0);
    end;
  finally
  frmBuscarNIF.Free;
  frmBuscarNIF:=Nil;
  end;
  tblnif_ctrl.close;
  tblnif_ctrl.Open;
  NumeroTrn := 0;
  end;}
end;

procedure TfrmProcVentaRapida.BuscarRNCDGII1Click(Sender: TObject);
var
   nAbr : string[30];
begin
  frmBuscarRNC:=TfrmBuscarRNC.Create(Nil);
  try
    if frmBuscarRNC.Showmodal = mrok then
    begin
      if frmBuscarRNC.CheckBox1.Checked  then
      begin
        if dmClientes.tblClientes.State = dsInactive then
        dmClientes.tblClientes.Open;
        if not dmClientes.tblClientes.locate('RNC_NUMERO',dmDGII.ibsqlBuscarRazonSocialrnc.Value,[]) then
        begin
          dmClientes.tblClientes.Insert;
          dmClientes.tblClientesNOMBRE_CTE.Value:=dmDGII.ibsqlBuscarRazonSocialRazonSocial.Value;
          dmClientes.tblClientesNOMBRE_FACTURAR.Value:=dmDGII.ibsqlBuscarRazonSocialRazonSocial.Value;
          nAbr:= dmClientes.tblClientesNOMBRE_FACTURAR.Value;
          dmClientes.tblClientesNOMBRE_ABREV.Value:= nAbr;
          dmClientes.tblClientesRNC_NUMERO.Value:=dmDGII.ibsqlBuscarRazonSocialRNC.Value;
          dmClientes.tblClientesSTATUS_CLIENTE.Value:='A';
          dmClientes.tblClientesINSERTADO_POR.Value:=strusername;
          dmClientes.tblClientesFECHA_INSERTADO.Value:=now;
          dmClientes.tblClientesCIA_KEY.Value:= glbCia_Key;
          dmClientes.tblClientesTIPO_CLIENTE.Value:=1;
          GlbSalvarQuery(dmClientes.tblClientes);
          qryCliente.Close;
          qryCliente.Open;
          if tablaPropietario.State In [dsBrowse] then
          tablaPropietario.Edit;
          tablaPropietarioCodigoPropietario.Value:=dmClientes.tblClientesCODIGO_CTE.Value;
          RxDBLookupCombo1Change(Self);
        end;
      end;
    end;
  finally
  frmBuscarRNC.Free;
  frmBuscarRNC:=Nil;
  end;
end;

procedure TfrmProcVentaRapida.Exito_ActDetalleRxVenta;
begin

end;

procedure TfrmProcVentaRapida.Exito_ProcActualizaRcverMast;
begin
  if tblRecoverMater.State = dsInactive then
  tblRecoverMater.Close;
  if numRecoverMaster = -1 then
  tblRecoverMater.Params[0].Value:= numRecoverMaster;
  tblRecoverMater.Open;
  tblRecoverMater.First;
  if (tblRecoverMater.RecordCount = 0) then
  begin
    tblRecoverMater.Insert;
    tblRecoverMaterFECHA.Value := GlbFechaTrnDiaria;
    tblRecoverMaterSTATUS.Value:= 'A';
    tblRecoverMaterCODIGO_USUARIO.Value:= VarUsuarioGlb;
    tblRecoverMaterMONTO_RECARGO.Value   := dmVentas.tblPOSTotalesRecargo.Value;
    tblRecoverMaterPORCDESADICIONAL.Value:= dmVentas.tblPOSTotalesPorcDesAdicional.Value;
    tblRecoverMaterTIPONCFIFISCAL.Value  := dmVentas.tblPOSTotalesTipoNCFIFiscal.Value;

    if chkNoLeyPropina.Checked then
    tblRecoverMaterPROPINALEY.Value := 0
    else tblRecoverMaterPROPINALEY.Value := 1;

    GlbSalvarQuery(tblRecoverMater);
    numRecoverMaster := tblRecoverMaterNUMERO.Value;
  end else
  begin
    tblRecoverMater.Edit;
    tblRecoverMaterFECHA.Value := GlbFechaTrnDiaria;
    tblRecoverMaterMONTO_RECARGO.Value   := dmVentas.tblPOSTotalesRecargo.Value;
    tblRecoverMaterPORCDESADICIONAL.Value:= dmVentas.tblPOSTotalesPorcDesAdicional.Value;
    tblRecoverMaterTIPONCFIFISCAL.Value  := dmVentas.tblPOSTotalesTipoNCFIFiscal.Value;
    tblRecoverMaterPROPINA.Value         := dmVentas.tblPOSTotalesPropina.Value;

    if chkNoLeyPropina.Checked then
    tblRecoverMaterPROPINALEY.Value := 0
    else tblRecoverMaterPROPINALEY.Value := 1;

    GlbSalvarQuery(tblRecoverMater);
  end;
end;

procedure TfrmProcVentaRapida.tblRecoverMaterAfterScroll(
  DataSet: TDataSet);
begin
  tblRecovertrans.Params[0].Value:= tblRecoverMaterNUMERO.Value;
end;



procedure TfrmProcVentaRapida.rxVentaAfterClose(DataSet: TDataSet);
begin
  lblRNC.Caption:='';
end;

procedure TfrmProcVentaRapida.rxVentaAfterScroll(DataSet: TDataSet);
begin
  dmVentas.qryPrecioUnidadSurt.Close;
  dmVentas.qryPrecioUnidadSurt.Params[0].Value:=rxVentaCodArticulo.Value;
  dmVentas.qryPrecioUnidadSurt.Open;

  if Not rxVentaTipoUnidad.IsNull then
  if dmVentas.qryPrecioUnidadSurt.Locate('IDUNIDAD', rxVentaTipoUnidad.Value,[]) then
  CantUnidad:=dmVentas.qryPrecioUnidadSurtCANTIDAD.Value;

  if qryproductos.state = dsBrowse then
  if not rxVentaCodArticulo.IsNull then
  begin
    QryPrecios.Close;
    QryPrecios.Params[0].Value:=rxVentaCodArticulo.Value;
    QryPrecios.Open;
  end;

  if rxVentaTipoUnidad.IsNull then Exit;
  dmInventario.qryTipoUnidad.close;
  dmInventario.qryTipoUnidad.Open;
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

procedure TfrmProcVentaRapida.rxVentaBeforeInsert(DataSet: TDataSet);
begin
  if EsModificandoFactura then exit;
  if rxVentaSerie.IsNull then
  rxVenta.Cancel;
  procCalc:=True;
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

  if rxVentaNUMERO.IsNull then
  rxVentaNumero.Value:= dmVentas.tblPOSTotalesNUMERO.Value;

  if (UpperCase(rxVentaDescripcion.Value) = 'RECARGO') then
  rxVentaTipoVenta.Value:=3;
  if rxVentaIDTasaITBIS.Value <> GlbIDTasa then
  rxVentaIDTasaITBIS.Value := GlbIDTasa;
  if dmVentas.tblPOSTotales.state = dsInactive then
  dmVentas.tblPOSTotales.Open;
  if tablaPropietarioCodigoPropietario.IsNull then
  begin
    tablaPropietario.Edit;
    tablaPropietarioCodigoPropietario.Value:=0;
    tablaPropietario.Post;
    dmVentas.tblPOSTotales.Edit;
    if Not (EsModificandoFactura) then
    begin
      AsignaNCFCFinal;
    end;
    RxDBLookupCombo3Exit(Self);
  end;
end;

end.
