unit UProcVentaRapida;
//UFormConsignacion
//FORMAFACOCO = formato facturas - conduce - cotizacion
{
DatosModificados = el usuario cambió un dato que afecta cálculo.
CalculoPendiente = ya se solicitó ejecución del motor.
CalculoMsgPendiente = ya existe un WM_CALCULAR_TOTALES en cola.
EnProcesoCalculo = estoy dentro de dmCalculos.ProcesaCalculos.
GlbCalculado = el último cálculo terminó correctamente.
procCalc = hay proceso de cálculo requerido/activo.
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, RXDBCtrl, DBCtrls,
  Printers, DB, Mask, RxMemDS, EditNew, IBCustomDataSet, IBQuery, WinSkinData, Menus,
  ShellApi, RXCtrls, IBStoredProc, IBSQL, RxLookup, RXSpin, OleServer,
  RxVerInf, RxGIF, ExcelXP, comObj, rxToolEdit, RxDBComb, IBTable, ComCtrls,
  IBDatabase, QRPrntr;
                                 
  const
  WM_SET_FOCUS_CBOX = WM_USER + 101;
  WM_CALCULAR_TOTALES = WM_USER + 199;

type
  TTipoCambio = (tcCantidad, tcPrecio, tcDescuento, tcUnidad, tcMoneda, tcRecargo, tcMonedaCambio, tcrxspin);
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
    rxVentaCodArticulo: TIntegerField;
    rxVentaNumeroRecibo: TIntegerField;
    rxVentaNumeroTrn: TIntegerField;
    rxVentaCodTexto: TStringField;
    rxVentaNCF: TStringField;
    rxVentaporc_desc: TFloatField;
    rxVentaItbi: TFloatField;
    rxVentaMontoDescuento: TFloatField;
    rxVentaNumeroDoc: TIntegerField;
    rxVentaMontoItbisenPrecio: TCurrencyField;
    rxVentaReferencia: TStringField;
    rxVentaloteNum: TStringField;
    rxVentaInvetariar: TSmallintField;
    rxVentaNumeroFactura: TIntegerField;
    rxVentaSerieProd: TStringField;
    rxVentaItbisExento: TSmallintField;
    rxVentaTipoVenta: TIntegerField;
    rxVentaDescUnidadMedida: TStringField;
    rxVentaTipoUnidad: TIntegerField;
    rxVentaMontoDesGlobal: TCurrencyField;
    rxVentaMontoItbisRecargo: TCurrencyField;
    rxVentaMontoTranspItbis: TCurrencyField;
    rxVentaRecargo: TCurrencyField;
    rxVentaMontoDescItem: TCurrencyField;
    rxVentaPorcDescItem: TCurrencyField;
    rxVentaglbcodVendedor: TIntegerField;
    rxVentaCostoProducto: TCurrencyField;
    rxVentaRutaImagen: TStringField;
    rxVentaMonedaBase: TStringField;
    rxVentaMoneda: TStringField;
    rxVentaNumeroCotiza: TIntegerField;
    rxVentaDescripcionEspecial: TMemoField;
    rxVentaSerieOriginal: TIntegerField;
    rxVentaNumeroTrnOriginal: TIntegerField;
    rxVentaStatus: TStringField;                    
    rxVentaIDTasaITBIS: TIntegerField;
    rxVentaTagFloat: TFloatField;
    rxVentaLevelPrecio: TIntegerField;
    rxVentaNUM_CONDUCE_CTE: TStringField;
    rxVentaNUM_IDENT: TStringField;
    rxVentaFICHA_VEH: TIntegerField;
    rxVentaCantExcedeInv: TIntegerField;
    rxVentaCantPax: TIntegerField;
    rxVentamonto_tasa: TCurrencyField;
    rxVentaMontoDescGlbDist: TCurrencyField;
    rxVentaMontoItbRecItmConDesc: TCurrencyField;
    rxVentaDC_ITBIS_CLD: TCurrencyField;
    rxVentaTC_MONTOITBISRECARGO_GLB: TCurrencyField;
    rxVentaTC_MONTOITBISRECARGO_ITM: TCurrencyField;
    rxVentaPorcTasaItbisCld: TStringField;
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

    Label11: TLabel;
    Label12: TLabel;
    NCFSinValorFiscal1: TMenuItem;
    CheckBox1: TCheckBox;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    Shape4: TShape;
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
    ibStpActualizaInvProd: TIBStoredProc;
    BitBtn9: TBitBtn;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;

    Totales: TRxMemoryData;
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
    TotalesqrLabelNcfDesc: TStringField;
    TotalesPorcientoInteres: TFloatField;
    TotalesRnc_Numero: TStringField;
    TotalesFechaVence: TDateTimeField;
    TotalesMontoDescGastosAdmin: TCurrencyField;
    TotalesMontoDescItbisGastosAdmin: TCurrencyField;
    TotalesMontoDescTransp: TCurrencyField;
    TotalesMontoDescDirtecnica: TCurrencyField;
    TotalesMontoDescItbisDirTecnica: TCurrencyField;
    TotalesMontoDescImprevisto: TCurrencyField;
    TotalesMontoDescItbisImprevisto: TCurrencyField;
    TotalesMontoSubTotalIndirectos: TCurrencyField;
    TotalesPorcGAdmin: TStringField;
    TotalesPorcItbisGAdmin: TStringField;
    TotalesPorcTrans: TStringField;
    TotalesPorcDirTec: TStringField;
    TotalesPorcItbisDirTec: TStringField;
    TotalesPorcImprevisto: TStringField;
    TotalesPorcItbisImprevisto: TStringField;
    TotalesTPorcGAdmin: TFloatField;
    TotalesTPorcItbisGAdmin: TFloatField;
    TotalesTPorcTrans: TFloatField;
    TotalesTPorcDirTec: TFloatField;
    TotalesTPorcItbisDirTec: TFloatField;
    TotalesTPorcImprevisto: TFloatField;
    TotalesTPorcItbisImprevisto: TFloatField;
    TotalesComentario: TStringField;
    TotalesFechaCotizacion: TDateTimeField;

    TotalesMoneda: TStringField;

    TotalesMontoEnTarjeta: TCurrencyField;
    TotalesMontoEnEfectivo: TCurrencyField;
    TotalesMontoEnCheque: TCurrencyField;
    TotalesMontoEnBonos: TCurrencyField;
    TotalesDiferencia: TCurrencyField;
    TotalesMontoNCRAplicado: TCurrencyField;
    TotalesReferenciaCte: TStringField;
    TotalesMontoNotaCredito: TCurrencyField;
    TotalesRecargo: TCurrencyField;
    TotalesNCF: TStringField;
    TotalesTipoNCF: TStringField;
    TotalesTipoNCFIFiscal: TIntegerField;
    TotalesMontoExoneraITBIS: TCurrencyField;
    TotalesNumeroTrn: TIntegerField;
    TotalesSubTotal: TCurrencyField;
    TotalesMontoDescItems: TCurrencyField;
    Totalesitbis: TCurrencyField;
    TotalesMontoITBISRecargo: TCurrencyField;
    TotalesMontoItbRecItmConDesc: TCurrencyField;
    TotalesMontoDescGlbItbis: TCurrencyField;
    TotalesPropina: TCurrencyField;
    TotalesPropinaLegal: TCurrencyField;
    TotalesSubTotalScreen: TCurrencyField;
    TotalesPreAbono: TCurrencyField;
    TotalesFechaIniciaPoliza: TDateTimeField;
    TotalesTipoAfiliado: TSmallintField;
    TotalesCodigoCteDelivery: TIntegerField;
    TotalesidNumeroDVeh: TIntegerField;
    TotalesTipoDeIngreso: TStringField;

    dsTotales: TDataSource;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText5: TDBText;
    DBText7: TDBText;
    MaestroCliente1: TMenuItem;
    Panel2: TPanel;
    RxDBGrid2: TRxDBGrid;
    DataSource2: TDataSource;
    Label16: TLabel;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;

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
    
    qryProdSerie: TIBQuery;
    qryProdSerieCODIGO: TIntegerField;
    qryProdSerieSERIE: TIBStringField;
    qryProdSerieSTATUS: TIBStringField;

    MostrarVistaproductos1: TMenuItem;
    Label18: TLabel;
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

    qryClienteRNC: TIBStringField;
    qryClienteRNC_NUMERO: TIBStringField;
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
    tblProductoSerie: TIBDataSet;
    tblProductoSerieCODIGO: TIntegerField;
    tblProductoSerieSERIE: TIBStringField;
    tblProductoSerieSTATUS: TIBStringField;
    qryInventarioCODIGO: TIntegerField;
    ibstpUpdateLote: TIBStoredProc;
    qryProductosPAGA_ITBI: TSmallintField;

    ImprimirLabel1: TMenuItem;
    NoGenerarNCF1: TMenuItem;
    Label21: TLabel;
    rxSolDatosctencfDescripcion: TStringField;
    BitBtn16: TBitBtn;
    ibstpProcSecuencia: TIBStoredProc;

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

    qryInventarioPRECIO_TIPO_UNIDAD: TFloatField;
    rxqryInvTipoUnidad: TIntegerField;
    qryInventarioTIPO_UNIDAD: TIntegerField;

    qryProductosPORC_DESCUENTO: TFloatField;
    qryProductosUNIDAD: TFloatField;
    qryProductosPRECIO_COMPRA: TFloatField;
    qryProductosFECHA_VENCIMIENTO: TDateTimeField;
    qryProductosPRECIO_TIPO_UNIDAD: TFloatField;
    qryProductosTIPO_UNIDAD: TIntegerField;
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
    Label26: TLabel;
    SpeedButton1: TSpeedButton;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    panelDescripcionServ: TPanel;
    Label27: TLabel;
    DBMemo1: TDBMemo;

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

    ibsqlGetPorcDescFctSvr: TIBSQL;
    BitBtn18: TBitBtn;

    DBText8: TDBText;
    Label29: TLabel;
    BitBtn19: TBitBtn;
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
    stpProc_UpdateVENTAS_MAST_U1: TIBStoredProc;
    stpProcUpdateFactU1: TIBStoredProc;
    stpProcUpdateTrnCxcU1: TIBStoredProc;
    stpProcUpdateBlcCteCxc: TIBStoredProc;
    stpProcUpdateFActPendu1: TIBStoredProc;
    Label37: TLabel;
    Label38: TLabel;
    qryClienteCIA_KEY: TIntegerField;
    qryClienteUSARLEVELPRECIO: TSmallintField;
    Label39: TLabel;
    DBEdit7: TDBEdit;

    BitBtn21: TBitBtn;
    BitBtn22: TBitBtn;
    qryInventarioPORCITBIS: TFloatField;
    qryProductosCIA_KEY: TIntegerField;
    qryProductosPORCITBIS: TFloatField;
    qryClienteCOD_VENDEDOR: TIntegerField;
    qryClienteTIPO_CF: TIBStringField;
    ReImprimeFacturaContado1: TMenuItem;
    ibstpUpdateCotizaMaster: TIBStoredProc;
    stpProcUpdteCotDet: TIBStoredProc;
    DBStatusLabel1: TDBStatusLabel;
    ibsqlDeleteSerieCotizaDet: TIBSQL;
    dbFechaCotizacion: TDBDateEdit;
    lblFechaCotizacion: TLabel;
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
    lblTasa: TLabel;

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
    qryInventarioRUTAIMAGEN: TIBStringField;
    qryInvRutaImg: TIBQuery;
    qryInvRutaImgCODIGO: TIntegerField;
    qryInvRutaImgCODIGO_BARRA: TIBStringField;
    qryInvRutaImgCODIGO_TEXTO: TIBStringField;
    qryInvRutaImgRUTAIMAGEN: TIBStringField;
    BitBtn25: TBitBtn;
    Seguros1: TMenuItem;
    Poliza1: TMenuItem;
    ReImprimeDevolucionsinFact1: TMenuItem;
    DBText15: TDBText;
    Label41: TLabel;
    CheckBox4: TCheckBox;
    QryPrecios: TIBQuery;
    QryPreciosCODIGO: TIntegerField;
    QryPreciosPRECIOVENTA1: TFloatField;
    QryPreciosPRECIOVENTA2: TFloatField;
    QryPreciosPRECIOVENTA3: TFloatField;
    QryPreciosPRECIOVENTA4: TFloatField;
    DSQryPrecios: TDataSource;
    BitBtn26: TBitBtn;

    Label42: TLabel;
    DBEdit8: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    rxPagos: TRxMemoryData;
    rxPagosSerie: TIntegerField;
    ibslqlUpdatetrnpagos: TIBSQL;
    lblStatusImpFiscal: TLabel;

    Button1: TButton;
    Label43: TLabel;
    DBEdit9: TDBEdit;

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

    StatusBar: TStatusBar;
    Estatus1: TMenuItem;
    DBEdit10: TDBEdit;
    RxDBLookupCombo3: TRxDBLookupCombo;
    Label46: TLabel;
    dbTextMontoExoneraITBIS: TDBText;
    chKDescuentoGlobal: TCheckBox;
    DBEdit11: TDBEdit;
    Label47: TLabel;
    DBText4: TDBText;
    stpProcRecDatosReimpfiscal: TIBStoredProc;
    qryVerificaReciboPdte: TIBQuery;
    qryVerificaReciboPdteNIF_IMPRESO: TSmallintField;
    qryVerificaReciboPdteNUMERO: TIntegerField;
    qryVerificaReciboPdteFORMA_PAGO: TSmallintField;
    qryVerificaReciboPdteNUMERO_FACTURA: TIntegerField;
    qryVerificaReciboPdteNUMERO_DOC_PAGO: TIBStringField;
    RecuperaTicketfiscal1: TMenuItem;
    ibStpInsertCotizaDet: TIBStoredProc;
    BitBtn27: TBitBtn;
    BitBtn28: TBitBtn;

    tblnif_ctrl: TIBDataSet;
    tblnif_ctrlNUMERO_TRN: TIntegerField;
    tblnif_ctrlNIF: TIBStringField;
    tblnif_ctrlFECHA_IN: TDateTimeField;
    tblnif_ctrlFECHA_UPDATE: TDateTimeField;
    tblnif_ctrlSTATUS: TIBStringField;
    ConciliarNIF1: TMenuItem;
    CancelarTicket1: TMenuItem;
    imbBarcode: TImage;

    rxdbgridTestTipofiscal: TRxDBGrid;
    PopupMenu2: TPopupMenu;
    VerDetalleVenta1: TMenuItem;
    qryVerificapago: TIBQuery;
    PopupMenu3: TPopupMenu;
    VerTipoComprobantes1: TMenuItem;
    lblRNC: TLabel;
    ListarPuertosCom1: TMenuItem;
    Alquiler1: TMenuItem;
    Lavanderia1: TMenuItem;
    Costura1: TMenuItem;
    BitBtn29: TBitBtn;
    Label48: TLabel;
    updTipoRetencionVta: TIBSQL;
    panelFastFood: TPanel;
    DBText17: TDBText;
    Label49: TLabel;
    Label50: TLabel;
    DBEdit13: TDBEdit;
    btnPagoExacto: TBitBtn;
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

    lblTotalItem: TLabel;
    BitBtn30: TBitBtn;
    BitBtn13: TBitBtn;
    BitBtn31: TBitBtn;
    Log1: TMenuItem;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Extras1: TMenuItem;
    DesactivarSkin1: TMenuItem;
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
    BitBtn33: TBitBtn;
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

    lblFechaInicaPoliza: TLabel;
    dbFechaIniciaPoliza: TDBDateEdit;
    cboxUseLogo: TComboBox;
    qryLogoTipoAfiliado: TIBQuery;
    qryLogoTipoAfiliadoIDTIPO: TIntegerField;
    qryLogoTipoAfiliadoRUTA_LOGO: TIBStringField;
    qryLogoTipoAfiliadoDESCRIPCION: TIBStringField;
    qryProdSerieCODIGO_CTE: TIntegerField;
    qryProdSerieSTATUS_EQUIPO: TSmallintField;
    tblProductoSerieCODIGO_CTE: TIntegerField;
    tblProductoSerieSTATUS_EQUIPO: TSmallintField;
    qryProdSerieDESCESTATUS: TIBStringField;
    tblClienteDeliveryTrn: TIBDataSet;
    tblClienteDeliveryTrnCODIGO: TIntegerField;
    tblClienteDeliveryTrnNUMERO_TRN: TIntegerField;

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
    btnAsignarVeh: TBitBtn;
    Label59: TLabel;
    Label60: TLabel;
    BitBtn34: TBitBtn;
    stpProcDevVeh: TIBStoredProc;
    qryLookCantXUnidad: TIBQuery;
    qryLookCantXUnidadIDUNIDAD: TIntegerField;
    qryLookCantXUnidadCANTIDAD: TIntegerField;
    qryCtes: TIBQuery;
    qryCtesCODIGO_CTE: TIntegerField;
    qryCtesCIA_KEY: TIntegerField;
    qryCtesNOMBRE_FACTURAR: TIBStringField;
    qryCtesCOD_VENDEDOR: TIntegerField;
    DBEdit17: TDBEdit;

    BitBtn35: TBitBtn;
    rxPrepagoAplicado: TRxMemoryData;
    rxPrepagoAplicadoNumero: TIntegerField;
    rxPrepagoAplicadoMonto: TCurrencyField;
    QryPreciosC: TIBQuery;
    QryPreciosCCODIGO: TIntegerField;
    QryPreciosCPRECIOVENTA1: TFloatField;
    QryPreciosCPRECIOVENTA2: TFloatField;
    QryPreciosCPRECIOVENTA3: TFloatField;
    QryPreciosCPRECIOVENTA4: TFloatField;
    qryLevelPrecioCteC: TIBQuery;
    qryLevelPrecioCteCCODIGO_CTE: TIntegerField;
    qryLevelPrecioCteCUSARLEVELPRECIO: TSmallintField;
    qryLevelCPrecioCteC: TIBQuery;
    qryLevelCPrecioCteCCODIGO_CTE: TIntegerField;
    qryLevelCPrecioCteCUSARLEVELPRECIO: TSmallintField;
    Panel4: TPanel;
    btnFactCxcTercero: TPanel;
    DBEdit18: TDBEdit;
    Label61: TLabel;
    edtMontoInicial: TEdit;
    Label62: TLabel;
    stpProc_InsertaVentaAuto: TIBStoredProc;
    edtCodProdFinanc: TEdit;
    Label63: TLabel;
    Label64: TLabel;
    qryVerificaInv: TIBQuery;
    qryVerificaInvCANTIDAD: TFloatField;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    rxdbLookupCte: TRxDBLookupCombo;
    qryProductosLOTE_NUM: TIBStringField;
    qryProductosCANTLOT: TIntegerField;
    rxLote: TRxMemoryData;
    rxLoteLotNum: TStringField;
    panelTempPrecioLevels: TPanel;
    DBText18: TDBText;
    DBText19: TDBText;
    DBText20: TDBText;
    DBText21: TDBText;
    Label69: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    Label72: TLabel;
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
    //Creado para evitar venta duplicada
    tblctrlvtatmp: TIBDataSet;
    tblctrlvtatmpID: TIntegerField;
    tblctrlvtatmpFECHA_IN: TDateTimeField;
    tblctrlvtatmpFECHA_FIN: TDateTimeField;
    tblctrlvtatmpCOD_USR_CAJA: TIntegerField;
    tblctrlvtatmpNUMERO_TRN_VTA: TIntegerField;
    qryVerificapagoSERIE: TIntegerField;
    qryVerificapagoFECHA: TDateTimeField;
    qryVerificapagoTIPO_TARJETA: TSmallintField;
    qryVerificapagoNUMERO_TARJETA_CRED: TIBStringField;
    qryVerificapagoANO_VENCE: TIntegerField;
    qryVerificapagoMES_VENCE: TSmallintField;
    qryVerificapagoMONTO_PAGADO: TFloatField;
    qryVerificapagoNUMERO_APROBACION: TIBStringField;
    qryVerificapagoTIPO: TSmallintField;
    qryVerificapagoCODIGO_PROVEEDOR: TSmallintField;
    qryVerificapagoTIPO_PAGO: TSmallintField;
    qryVerificapagoNUMERO_CHEQUE: TIntegerField;
    qryVerificapagoCOD_BANCO_CHEQUE: TIntegerField;
    qryVerificapagoSERIE_TRN: TIntegerField;
    qryVerificapagoAREA_TRANS: TSmallintField;
    qryVerificapagoNUMERO_CUPON: TIntegerField;
    qryVerificapagoPAGO: TSmallintField;
    tblDetallePagosGLBNUMVTAPOS: TIntegerField;
    panelFinanc: TPanel;
    Label73: TLabel;
    DBText22: TDBText;
    DBText23: TDBText;
    Label74: TLabel;
    rxlblAvisoCierreZ: TRxLabel;
    EstatusCierreZ1: TMenuItem;
    RxDBLookupCombo1: TRxDBLookupCombo;
    lblTipoIngreso: TLabel;
    tbltipoDeIngresos: TIBTable;
    tbltipoDeIngresosIDINGRESO: TIBStringField;
    tbltipoDeIngresosDESCRIPCION: TIBStringField;
    dstbltipoDeIngresos: TDataSource;
    ValidarCalculos1: TMenuItem;
    CargarTest1: TMenuItem;
    DBEdit12: TDBEdit;
    CargarTesttxt1: TMenuItem;
    qryVerecfTerrCte: TIBQuery;
    qryVerecfTerrCteCODIGO_CTE: TIntegerField;
    qryVerecfTerrCteNOMBRE_FACTURAR: TIBStringField;
    qryVerecfTerrCtePROVINCIA: TIBStringField;
    qryVerecfTerrCteMUNICIPIO: TIBStringField;
    qryVerecfTerrCteID_MUNICIPIO: TIntegerField;
    qryVerecfTerrCteID_PROVINCIA: TIntegerField;
    ConciliareCF1: TMenuItem;
    qryClienteRNC_CED_ACTIVO: TSmallintField;
    ReEnviaFacturatxt1: TMenuItem;
    qryClienteID_PROVINCIA: TIntegerField;
    qryClienteID_MUNICIPIO: TIntegerField;
    tblDatosVentaVehiculosID: TIntegerField;
    TotalesVentaGuardada: TSmallintField;
    chkImpenPDF: TCheckBox;

    procedure BitBtn4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure rxVentaAfterPost(DataSet: TDataSet);
    procedure Edit1Exit(Sender: TObject);
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
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure MostrarVistaproductos1Click(Sender: TObject);
    procedure edtReferenciaChange(Sender: TObject);
    procedure edtReferenciaExit(Sender: TObject);
    procedure NotaCrdito1Click(Sender: TObject);
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
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure RxDBGrid3DblClick(Sender: TObject);
    procedure SecretPanel1DblClick(Sender: TObject);
    procedure NoMostrarProdVencidos1Click(Sender: TObject);
    procedure rxLabelVenceDblClick(Sender: TObject);
    procedure cboxTipoUnidadChange(Sender: TObject);
    procedure cboxTipoUnidadExit(Sender: TObject);
    procedure Label25TemporalrenameClick(Sender: TObject);
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
    procedure BitBtn29Click(Sender: TObject);
    procedure btnPagoExactoClick(Sender: TObject);
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
    procedure BitBtn31Click(Sender: TObject);
    procedure Log1Click(Sender: TObject);
    procedure DesactivarSkin1Click(Sender: TObject);
    procedure BitBtn32Click(Sender: TObject);
    procedure edtCodigoChange(Sender: TObject);
    procedure edtCodigoEnter(Sender: TObject);
    procedure edtCodigoExit(Sender: TObject);
    procedure InactivaReciboFarmacia1Click(Sender: TObject);
    procedure DataSource1StateChange(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure ImprimirOrdenEntrega1Click(Sender: TObject);
    procedure ActualizaConduce1Click(Sender: TObject);
    procedure ConfirmarConduce2Click(Sender: TObject);
    procedure ReImprimeFactRest1Click(Sender: TObject);
    procedure ReImprimeTicketVta1Click(Sender: TObject);
    procedure ReImprimeConduce1Click(Sender: TObject);
    procedure TotalesAfterClose(DataSet: TDataSet);
    procedure MedicamentosControlados1Click(Sender: TObject);
    procedure Cobertura1Click(Sender: TObject);
    procedure BitBtn33Click(Sender: TObject);
    procedure rxCoberturaMontoCoberturaChange(Sender: TField);
    procedure btnVerSecCertificadosClick(Sender: TObject);
    procedure DBEdit8Exit(Sender: TObject);
    procedure DBEdit6DblClick(Sender: TObject);
    procedure Label22Click(Sender: TObject);
    procedure dbFechaIniciaPolizaExit(Sender: TObject);
    procedure DBEdit16Change(Sender: TObject);
    procedure cboxUseLogoChange(Sender: TObject);
    procedure edtCodigoDblClick(Sender: TObject);
    procedure edtObservacionDblClick(Sender: TObject);
    procedure CerrarPrograma1Click(Sender: TObject);
    procedure btnAsignarVehClick(Sender: TObject);
    procedure BitBtn34Click(Sender: TObject);
    procedure BitBtn35Click(Sender: TObject);
    procedure DBEdit18DblClick(Sender: TObject);
    procedure DBEdit18Exit(Sender: TObject);
    procedure edtMontoInicialExit(Sender: TObject);
    procedure edtCodProdFinancDblClick(Sender: TObject);
    procedure rxdbLookupCteExit(Sender: TObject);
    procedure rxdbLookupCteEnter(Sender: TObject);
    procedure rxdbLookupCteChange(Sender: TObject);
    procedure rxVentaAfterScroll(DataSet: TDataSet);
    procedure EstatusCierreZ1Click(Sender: TObject);
    procedure rxVentaPrecioChange(Sender: TField);
    procedure DBEdit9Exit(Sender: TObject);
    procedure DBEdit9Enter(Sender: TObject);
    procedure RxSpinEdit1Enter(Sender: TObject);
    procedure DBEdit3Enter(Sender: TObject);
    procedure RxSpinEdit1Click(Sender: TObject);
    procedure RxSpinEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit17Change(Sender: TObject);
    procedure DBEdit13Change(Sender: TObject);
    procedure ValidarCalculos1Click(Sender: TObject);
    procedure CargarTest1Click(Sender: TObject);
    procedure DBEdit12Exit(Sender: TObject);
    procedure DBEdit17Exit(Sender: TObject);
    procedure CargarTesttxt1Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure DBEdit3Change(Sender: TObject);
    procedure ConciliareCF1Click(Sender: TObject);
    procedure Label46Click(Sender: TObject);
    procedure DBEdit6Exit(Sender: TObject);
    procedure DBEdit2Click(Sender: TObject);
    procedure RxDBLookupCombo3Click(Sender: TObject);
    procedure TotalesMonedaChange(Sender: TField);
    procedure ReEnviaFacturatxt1Click(Sender: TObject);
    procedure RxDBLookupCombo4Click(Sender: TObject);
    procedure RxDBLookupCombo4MouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure qryEmpleadoBeforeClose(DataSet: TDataSet);
    procedure tbltipoDeIngresosBeforeClose(DataSet: TDataSet);
  private
    SheetEditRef: TEdit;
    LTienePrecio:Boolean;
    
    procedure MarcarLineaActiva;
    procedure RestaurarLineaActiva;
    procedure LimpiarRestauracionGrid;

    //inicio evitar loop
    procedure LogEventoVenta(const AEvento, AOrigen: string);
    function EstadoDatasetTexto(ADataSet: TDataSet): string;
    function ControlTexto(AControl: TControl): string;
    function TipoCambioTexto(ATipo: TTipoCambio): string;
    //final evitar loop

    Function GetPrecioNivelCuadros(codProd:Integer; t : smallint):Currency;
    Function GetNivelPrecioCuadros(codcte: integer):smallint;
    Function GetNivelPrecioStandar(codProd:Integer; t : smallint):currency;
    procedure ProcAsignarProvMunc;
    function VerificaNIFTExiste: Boolean;
    procedure ProcAsignarClienteACert(codte : integer);
    function VerificaVentaExisteRX(serie:integer):boolean;
    procedure DatosVocado(numtrn:integer;fpago:integer);
    procedure ProcSetBtnConduce;
    //procedure ImprimirFacturaRepuesto(numTran:Integer);
    procedure ProvVerDatosDescGlb;
    procedure ProcItbisExonerado;
    procedure ProcMostrarVersion;
    procedure AbrirUnidades;
    procedure ConsultaPreventa;

    function SetCantUnidad(codProd : integer;_TipoUnidad:integer):Integer;
    

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

    //t procedure ImpFacturaservicio(numerotrn:Integer;EsReimpresion:Boolean);
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
    Function VerificaHuellas:boolean;

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
    procedure ProcInsertarVtaMastEnDevolucion(Serie_asignadoncf : Integer;numerotrnorigen:integer);

    procedure ProcInsertarVtaMastCashEnDev(var NumTrnGen : Integer; var NumOrden : Integer);
    procedure InsertarDetDevolucionCash(numero : Integer);

    //Procsa devolucion de 1 o varios productos de una factura;
    //t procedure ProcesarDevolucion;


    procedure ProcInsertarDetPagos(numtrn : integer);
    procedure ProcInsertarDetCheque(numtrn : integer);
    procedure ProcInsertarDetEfectivo(numtrn: integer;fpago:integer);
    procedure ProcInsertarDetEfectivoC(numtrn: integer;fpago:integer;monto:currency);
    procedure ProcInsertarDetBono(numtrn : integer);
    procedure ProcActualizarPagos(numtrn: integer;areatrans:smallint);
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
    
    Procedure ProcActualizaMsg;
    Procedure ProcGetUltNcf(tipo:string);
    Procedure ProcGetDatosDevparaNotaCR;

    procedure AsignaNCFCFinalX(TIPOCF:String;TIPO_NCF_IFISCAL : integer);
    //AsignaNCFCFinalX(TIPO_NCF_IFISCAL : integer);overload;

    //procedure ReimprimirFacturaNoFiscal(numTRN : Integer);
    //procedure ImprimeFacturaEXDMAR(num: integer;tventa: string;valorNCF:string;xdir:string);

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
    //procedure ImprimeFactura8_5Farmacia(num: integer; tventa, valorNCF,
    //  xdir: string);
    procedure CalcularMontoBrutoXMoneda;
    Procedure ProcGuardarDatosCoti(numeroTrnVta:integer);
    procedure ProcVerificaPreAbono;
    procedure ProcActualizarStadoPrepP(cte: integer;numtrn:integer);
    procedure ProcAsignaNumLote(codProd:string);
    //Facturas Financiamiento
    //not en use procedure ProcFactFinanciamientoFinc;
    procedure ProcFactCrearFctFinanciamiento(codcte:integer);
    procedure ProcFactCrarFctFincImprimir(numfct:integer);
    procedure ImprimeFactraCXCFinc(numtrn: integer;tipo:string);
    function FGetFPago(todasfPago: smallint): integer;
    procedure InsertarPagoEfectivoNormal;
    procedure ProcInsertCtrlNumVta;
    procedure ProcUpdateCtrlNumVta(numvta : Integer);
    function FuncPagoRegistrado(_serietrn: integer): Boolean;
    procedure ProcRestaurarFocoDbgrid;
    procedure LogProcedure(const ProcName: string);
    procedure ProcFAplicaPrecioMayorista(codprod: integer);
    procedure CargarSimulacionDesdeExcel(const ArchivoExcel: string;
      SheetIndex: Integer; var rxVenta, Totales: TRxMemoryData);
    procedure BtnCargarClick(Sender: TObject);
    procedure SafeSetFocus(AControl: TWinControl);
    procedure WMSetFocusCBox(var Msg: TMessage);message WM_SET_FOCUS_CBOX;
    procedure FocusCBox;
    procedure CalcularTotalesInterno;
    procedure WMDiferirCalculoTotales(var Msg: TMessage); message WM_CALCULAR_TOTALES;
    procedure WMCalcularTotales(var Msg: TMessage);
    procedure SolicitarCalculoTotales(Origen: TTipoCambio);
    //procedure WMDiferirCalculoTotales(var Msg: TMessage);
    procedure cbMonedaCambioChange(Sender: TObject);
    //procedure cbMonedaChange(Sender: TObject);
    //procedure cbUnidadChange(Sender: TObject);
    //procedure edCantidadChange(Sender: TObject);
    //procedure edDescuentoChange(Sender: TObject);
    //procedure edPrecioChange(Sender: TObject);
    //procedure edRecargoChange(Sender: TObject);
    procedure ProcAsignaQuery;
    procedure ImprimirVtaContado(valorNCF:string);
    function FSolicitarMotivoNCR: smallint;
    procedure ProcUpdateMotivo(numtrn: integer;motivo:smallint;ncfRef:string);
    procedure EjecutarCalculoTotales;
    function TipoCFRequiereCliente(const ATipo: string): Boolean;
    procedure MostrarTasa;
    function EsControlEntradaDetalle(AControl: TWinControl): Boolean;

  public
    tempN : string;
    NoTieneDiasDeCredito, NoTieneCredito :  boolean;
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
    flagSolLote, _GenNCFFactR, LlenandoDatos : Boolean;
    DescFactRecurrente : String;
    xnumprogrec : integer;
    _montoAbonoC : Currency;
    CerrarVentana: Boolean;
    _MontoPrepago:Currency;
    FPagoFctR : smallint;
    EntManual : boolean;
    sqlAsignado : Boolean;
    EnProcesoCalculo : boolean;
    procedure DgiiSolicitareCF(numerotrn:integer);
    //procedure ProcSetPathlogoTipoServicio(tipo:smallint);
    procedure ExportarGridExcel;
    Function BuscarRutaImagen(codProducto : Integer):String;
    procedure LlenarrxSolDatoscte(codCte:integer);
    function ExistePosextraDetParaVenta(NumVenta: Integer): Boolean;
    procedure DiferirCalculoTotales;
    procedure ActivarBotonesEnModifica;
    procedure CargarDatosAModificar;
    //procedure ImprimirFacturaRepuestoConduce(numstr:integer);
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

    Procedure AbrirDatosParaTicket(
              CheckBox1_Checked:Boolean;
              rdgCredito_Checked:boolean;
              edtCodCte_Text:String;
              EditN1_ValueInteger:integer;
              DateTimePicker1_Date:TDateTime);

    Procedure ProcVerificaActInventario(
    codigoProd: integer; cant: real;CantidadAnterior:real;numtrn:integer);

  end;

Const
  FormaPagoNotaDebito = 6;//Devolucion
  TipoPagoFactura = 7;//Factura-Credito
  //PORC_TRANSP_ITBIS = 16/1.16;//13.79;
var
  frmProcVentaRapida: TfrmProcVentaRapida;
  
  FDevolucionArmada: Boolean;         // indica si ya cargaste la factura en rxVenta
  FProcesandoDevolucion: Boolean;     // guardia SOLO para la fase 2 (no afecta el primer clic)

  TipoVenta : String;
  xCodigoCte : Integer;
  codAuxi: string;
  xSalir, Prod_existe, _TienepagoTarjeta: boolean;
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

  esInsertando,EsPagoExacto:Boolean;

  CantUnidad : Real;
  InactivaImprecibo : Boolean;
  noExiste : Boolean;
  _SolicitaCodCte : Smallint;
  PrecioCambio : Boolean;
  auxiCant, cPrecio, aPrecio, PORC_TRANSP_ITBIS : Extended;
  EsModificandoFactura : boolean;
  EsNotaCRParcial : boolean;
  ExpExcel : Boolean;
  EsReimprimirContado : Boolean;
  EsModificandoCotiza : Boolean;
  _NumeroCotiza : Integer;
  isMasterSave : boolean;
  _abortar, EsBrowsing, EsEditando : Boolean;
  _abortaImpre : boolean;
  precioMinimo : Currency;
  precioSum : Currency;
  EsConduce,  procCalc,EsProdVencido : Boolean;
  _ulttrnImp : string;
    pesoProd: String;
    SoloGuardaVenta,entraDessGlb, EsReimp, esCargaDatosFFood : boolean;
    precioAnt: currency;
    xCodProd, ExecuteResult, _UsarLevelPrecio : Integer;
    FUpdating, reimpConduce, valPgoARS : Boolean;
    Parametros : string;
    _chassisVeh : string;

  SavedRecNo: Integer;
  SavedSerieLinea: Integer;
  SerieLineaActiva: Integer;
  RestaurandoLineaActiva: Boolean;
  bm: TBookmark;
  SavedColIndex: Integer;
  RestoreGridFocus: Boolean;

  CalculoPendiente: Boolean;
  DatosModificados: Boolean;
  exDBEdit2ONClick:Boolean;
  UltimaVariableModificada: TTipoCambio;
  LogEventosVentaActivo: Boolean = True;
  LogEventosVentaSecuencia: Integer = 0;
  CalculoMsgPendiente: Boolean = False;
  ProcesandoVenta: Boolean = False;
  
implementation
uses UDatModConectar, UGlobal, URepComprobante, UDatModCompania,UDatModReportes,
UDatModClientes,UDatModFactura,UDlgMotivoNCR,
  UProcMiniInventario, UFormSelFecha, URepVentaDiaria,
   USeleccionarNCF, uFormAsignarNCFVenta, UTicketCustomSize,
  UBuscarClientesPersonasP, UFormDatosCotiza, UDatModCxc,
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
  UFormDistribuirPgoVenta, UFormOperacionServicios, {UFormPolizaMaster,}
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
  UDatModDGII, UQckCotServ8_5Ayaco, UFormPosExtraDET,
  URepRecibo8_5_11REspinalReimpFFood, UQckFactServ8_5Limao,
  UQckFactServ8_5Surtidora, UDatModCotizafiscal, {URepReimpFastRetailPOS,}
  URepCotizacionPapel3Pulg, URepReimpTicketSurtidora_1,
  UReipReimpFastRetailPOS, URepRecibo8x5_5, UFormDatosVeh,
  URepRecibo8x5_5Conduce, frmImprimirDoc, UFormLog, DateUtils, URegFpago,
  URegFpagoVtaRep, UQckCotiza8_5_F_1BB, UQckCotServ8_5AyacoRep,
  UCancelaReinsertaVenta, UConfirmaConduce,
  UQckRepConduce, UQckRepOrdenAlmacen, UFormDatosOrdenConduce,
  UQckRepOrdenAlmacenPOS, UFormVocadosDet, UFactLimao01,
  UQckFactServ8_5EXDMar, UQckCotizaServ8_5EXDMar, URepTicketVta,
  UQckFactServ8_5Agua, UFormDetalleAdicionalVta, UFormDatosProdControlados,
  UFormCoberturaVtaARS, URepReimpTicketFarm_ARS, UQckFactServ8_5_SAM,
  UQckCotServ8_5SAM, UQckFactServ8_5_Standar, UQckCotServ8_5Standar,
  UFormInvCertificado, UQckFactServ8_5_SAMNew, UQckFactServ8_5_SAMNewM,
  URepConduceECom, UFactFormatoECom, UDatModIngresos, UFormCteDelivery,
  UFormConsultaCertAvanzado, UQckFactServ8_5_SAMNewMuturs,UUtilecf,UUtilecftimbre,
  URepReimpTicketSurtidoraNew, UFormBuscarMotor, UDatModVehiculo,
  UQckFactServ8_5Farmacia, UQckCotServ8_5StandarFarmacia, UDatModPanaderia,
  UFormPrepago, UfrmValidaFactura,  UImpresionVentas, TestMainUnit,
  UPrintDevolucion, UFrmEditProvinciaMunicipio, UfrmConciliareCFConDGII,
  USetClaveMaestra,UFingerprintIBX, UFacturaTxtBuilder, UFacturaTxtEcfFlow;


{$R *.dfm}

function TfrmProcVentaRapida.TipoCFRequiereCliente(const ATipo: string): Boolean;
begin
  Result :=
    (ATipo = '01') or (ATipo = '14') or (ATipo = '15') or (ATipo = '31') or
    (ATipo = '41') or (ATipo = '45') or (ATipo = '46') or (ATipo = '47');
end;

procedure TfrmProcVentaRapida.LogProcedure(const ProcName: string);
var
  F: TextFile;
begin
  //LogProcedure('TfrmProcVentaRapida.LogProcedure');
  try
  AssignFile(F, 'C:\temp\erp\debuglog.txt');
  if not FileExists('C:\temp\erp\debuglog.txt') then
    Rewrite(F)
  else
    Append(F);
  Writeln(F, DateTimeToStr(Now) + ' - ' + ProcName);
  CloseFile(F);
  except
  end;
end;

function TfrmProcVentaRapida.EstadoDatasetTexto(ADataSet: TDataSet): string;
begin
  Result := 'nil';

  if not Assigned(ADataSet) then
    Exit;

  case ADataSet.State of
    dsInactive: Result := 'Inactive';
    dsBrowse:   Result := 'Browse';
    dsEdit:     Result := 'Edit';
    dsInsert:   Result := 'Insert';
    dsSetKey:   Result := 'SetKey';
    dsCalcFields: Result := 'CalcFields';
    dsFilter:   Result := 'Filter';
    dsNewValue: Result := 'NewValue';
    dsOldValue: Result := 'OldValue';
    dsCurValue: Result := 'CurValue';
  else
    Result := 'Other';
  end;
end;

function TfrmProcVentaRapida.ControlTexto(AControl: TControl): string;
begin
  if Assigned(AControl) then
    Result := AControl.Name
  else
    Result := 'nil';
end;

function TfrmProcVentaRapida.TipoCambioTexto(ATipo: TTipoCambio): string;
begin
  case ATipo of
    tcCantidad:      Result := 'Cantidad';
    tcPrecio:        Result := 'Precio';
    tcDescuento:     Result := 'Descuento';
    tcUnidad:        Result := 'Unidad';
    tcMoneda:        Result := 'Moneda';
    tcRecargo:       Result := 'Recargo';
    tcMonedaCambio:  Result := 'MonedaCambio';
    tcrxspin:        Result := 'RxSpin';
  else
    Result := 'Desconocido';
  end;
end;

procedure TfrmProcVentaRapida.LogEventoVenta(const AEvento, AOrigen: string);
var
  F: TextFile;
  Ruta: string;
  Linea: string;
begin
  if not LogEventosVentaActivo then
    Exit;

  try
    Ruta := 'C:\temp\erp\ventas_eventos.log';

    if not DirectoryExists('C:\temp\erp') then
      ForceDirectories('C:\temp\erp');

    Inc(LogEventosVentaSecuencia);

    Linea :=
      FormatDateTime('yyyy-mm-dd hh:nn:ss.zzz', Now) +
      ' | #' + IntToStr(LogEventosVentaSecuencia) +
      ' | Evento=' + AEvento +
      ' | Origen=' + AOrigen +
      ' | ActiveControl=' + ControlTexto(ActiveControl) +
      ' | rxVenta.State=' + EstadoDatasetTexto(rxVenta) +
      ' | rxVenta.Modified=' + BoolToStr(rxVenta.Modified, True) +
      ' | Totales.State=' + EstadoDatasetTexto(Totales) +
      ' | EnProcesoCalculo=' + BoolToStr(EnProcesoCalculo, True) +
      ' | CalculoPendiente=' + BoolToStr(CalculoPendiente, True) +
      ' | CalculoMsgPendiente=' + BoolToStr(CalculoMsgPendiente, True) +
      ' | GlbCalculado=' + BoolToStr(GlbCalculado, True) +
      ' | procCalc=' + BoolToStr(procCalc, True) +
      ' | Codigo=' + edtCodigo.Text;

    if Assigned(rxVenta) and (rxVenta.Active) and (rxVenta.RecordCount > 0) then
    begin
      Linea := Linea +
        ' | CodArticulo=' + rxVentaCodArticulo.AsString +
        ' | Cant=' + rxVentaCant.AsString +
        ' | Precio=' + rxVentaPrecio.AsString +
        ' | PorcDescItem=' + rxVentaPorcDescItem.AsString +
        ' | TipoUnidad=' + rxVentaTipoUnidad.AsString;
    end;

    AssignFile(F, Ruta);

    if FileExists(Ruta) then
      Append(F)
    else
      Rewrite(F);

    Writeln(F, Linea);
    CloseFile(F);
  except
    // Nunca permitir que el log rompa facturación.
  end;
end;

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
  //LogProcedure('TfrmProcVentaRapida.LlenarrxSolDatoscte');
  rxSolDatoscte.Close;
  rxSolDatoscte.Open;

  if qryCliente.state = dsInactive then
  qryCliente.Open;
  qryCliente.DisableControls;
  if not qryCliente.Locate('CODIGO_CTE', codCte, []) then
  begin
    rxSolDatoscte.Insert;
    rxSolDatoscteNombre.Value  := '*** Cliente Generico ***';
    if Length(edtObservacion.Text) > 0 then
      rxSolDatoscteNombre.Value := edtObservacion.Text;
      rxSolDatoscte.Post;
      Exit;
  end;
  qryCliente.EnableControls;//prueba
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
   if not LlenandoDatos then
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
  //LogProcedure('TfrmProcVentaRapida.FInsertarDatosCtrlNIF');
  tblnif_ctrl.Close;
  tblnif_ctrl.Params[0].Value := _numerotrnvta;
  tblnif_ctrl.Open;
  if not tblnif_ctrl.Locate('NUMERO_TRN',_numerotrnvta,[]) then
  begin
    tblnif_ctrl.Append;
    tblnif_ctrlNUMERO_TRN.Value:= _numerotrnvta;
    tblnif_ctrlFECHA_IN.Value := now;
    tblnif_ctrlSTATUS.Value := 'T';
    GlbSalvarQuery(tblnif_ctrl);
  end;
end;

//Recibo F5
procedure TfrmProcVentaRapida.BitBtn4Click(Sender: TObject);
var
  serie_asignadoncf : integer;
  valorNCF : String;
  showNcfwindows,flagaborta : Boolean;
  genNcf : Boolean;
    pulgadaInc : Real;
  flag : Boolean;
  numeroTrnVta : integer;           
  cantidadanterior:real;
  i, totalCopias: Integer;


  MasterCreado: Boolean;
  VentaCompleta: Boolean;
  PasoPersistencia: string;
  
begin
  numeroTrnVta := -1;
  MasterCreado := False;
  VentaCompleta := False;
  PasoPersistencia := 'Inicio';

  flagaborta:=False;
  if ProcesandoVenta then
  begin
    MessageDlg('La venta se está procesando. Espere a que finalice el proceso actual.', mtWarning, [mbok], 0);
    Exit;
  end;
  if TotalesVentaGuardada.Value = 1 then
  begin
    MessageDlg('Venta ya fue guardada, verifique..', mtWarning, [mbok], 0);
    Exit;
  end;

  if ((GLBMutur = 1) or (GLBMTEGroup = 1)) and (_chassisVeh = '') then
  begin
    if MessageDlg('No has asignado el Veh/Motor/Chasis, continuar?',mtWarning,[mbyes, mbno],0) = mrno then
    exit;
  end;
  dmDatos.qryImpresoras.Close;
  dmDatos.qryImpresoras.Open;
  GlbEsCopia:=False;                                                   
  if (GlbActivaIFiscal = 1) then
  begin
    if VerificaNIFTExiste then
    begin                                       
      if rxVenta.RecordCount > 0 then
      begin
        MessageDlg('TIENES UNA VENTA CON NIF EN T, NO PUEDES HACER MAS VENTAS.'+
        LF+CR+'PUEDES CONVERTIR ESTA VENTA COMO COTIZACION Y LUEGO LA PUEDES USAR.',mtError,[mbok],0);
        exit;
      end else
      begin
        MessageDlg('TIENES UNA VENTA CON NIF EN T, NO PUEDES HACER MAS TRANSACCIONES.',mtError,[mbok],0);
        exit;
      end;
    end;
  end;
  if TotalesVentaGuardada.Value = 1 then
  begin
    MessageDlg('Venta ya fue guardada, verifique..',mtWarning,[mbok],0);
    exit;
  end;

  //1	0	Factura Credito 8.5 Estandar
  //2	1	Factura Contado 8.5 Estandar
  //3	2	Factura Cotizacion 8.5 Estandar
  GlbRutaLogoDoc:='';
  if GetFormatoTipoDoc(1,GlbRutaLogoDoc) then  //2	1	Factura Contado 8.5 Estandar
  GlbDocStandar:=1
  else
  GlbDocStandar:=0;

  if GlbEsDebugFiscal = 1 then
  begin
    if (Edit1.Text <> '') then
    LogInformacionTxt(' Monto Neto:'+Totalestotalneto.AsString+' Monto Pagado:'+Edit1.Text);
    WriteToLog('Inicio Impresion');
  end;

  if rxVenta.RecordCount = 0 then
  begin
    MessageDlg('No puedes guardar sin detalle, verifique.',mtInformation,[mbok],0);
    BitBtn4.Enabled := True;
    ProcesandoVenta := False;
    Exit;
  end;

  if (EsDevolucion) And (rxVenta.RecordCount > 0) then
  begin
    MessageDlg('Estas en modo devolución, transacción no puede '#13'ser procesada como venta, verifique.', mtInformation, [mbok], 0);
    Exit;
  end;

  if Totalestotalneto.Value > GlbValorMaxVtaWarning then
  begin
    ///NotificaErrorByEmail(GlbNombreCia);
    //NotificaErrorByEmail('Usuario:'+GlbUsuarioLogueado);
    //NotificaErrorByEmail('Monto de la factura supera '+ FloatToStr(GlbValorMaxVtaWarning)+'.');
    if tablaPropietarioCodigoPropietario.IsNull or
    (tablaPropietarioCodigoPropietario.Value = 0) then
    begin
      MessageDlg('Factacturas con valor mayor/igual a 250mil, requieren RNC/Cedula,'#13'Seleccione el cliente?.', mtError, [mbok], 0);
      Exit;
    end;
  end;

  if Totalestotalneto.Value > 1000000 then
  begin
    NotificaErrorByEmail(GlbNombreCia);
    NotificaErrorByEmail('Usuario:'+GlbUsuarioLogueado);
    NotificaErrorByEmail('Monto de la factura es mayor o igula a 1 millon: '+ FloatToStr(GlbValorMaxVtaWarning)+'.');

    if MessageDlg('Monto de la factura supera el MILLON, es correcto?', mtWarning, [mbyes,mbno], 0) = mrno then
    Exit;
  end;

  if (Totalesdevolucion.Value >= 2000) then
  begin
    MessageDlg('MONTO CAMBIO PARECE QUE ES MUY ALTO, VERIFIQUE.', mtError, [mbOk], 0);
    begin
      Edit1.SelectAll;
      if isShowing then
      Edit1.SetFocus;
      BitBtn4.Enabled:= True;
      ProcesandoVenta := False;
      Exit;
    end;
  end;

  if (Totalesdevolucion.Value >= 3000) then
  begin
    MessageDlg('MONTO CAMBIO INCORRECTO, VERIFIQUE.', mtError, [mbOk], 0);
    begin
      Edit1.SelectAll;
      BitBtn4.Enabled:= True;
      ProcesandoVenta := False;
      Exit;
    end;
  end;
  if (CheckBox1.Checked) and  ((tablaPropietario.RecordCount = 0) or (tablaPropietarioCodigoPropietario.Value = 0)) then
  begin
    if (TotalesTipoNCF.Value = '31') or
       (TotalesTipoNCF.Value = '44') or
       (TotalesTipoNCF.Value = '45') or
       (TotalesTipoNCF.Value = '46') or
       (TotalesTipoNCF.Value = '47') then
    begin
      MessageDlg('Debes asignar un cliente con RNC/Cédula para este tipo de eNCF.', mtError, [mbOk], 0);
      Exit;
    end;
  end;
  // if (tablaPropietario.
  if _TienepagoTarjeta and (Totalesdevolucion.Value > 0) then
  begin
    MessageDlg('MONTO CAMBIO INCORRECTO, VERIFIQUE.', mtError, [mbOk], 0);
    begin
      Edit1.SelectAll;
      BitBtn4.Enabled:= True;
      ProcesandoVenta := False;
      Exit;
    end;
  end;

  showNcfwindows := False;
  dmDatos.qryMembrete.Close;
  dmDatos.qryMembrete.Params[0].Value:= glbCia_Key;
  dmDatos.qryMembrete.Open;
  if (GlbActivaIFiscal = 1) and (EsModificandoFactura) and (not EsModificandoCotiza) then
  begin
    MessageDlg('Transacciones no se pueden modificar, favor hacer nota de crédito.', mtError, [mbOk], 0);
    Exit;
  end;

    if EsModificandoFactura and (not EsModificandoCotiza) then
  begin
    MessageDlg('Favor hacer click en Guardar y Reimprimir', mtInformation, [mbOk], 0);
    bitBtnEditarFact.SetFocus;
    Exit;
  end;

  if (TotalesSubTotal.Value <= 0) or (Totalestotalneto.Value <= 0) then
  begin
    MessageDlg('Total venta no puede ser cero, verifique.', mtError, [mbOk], 0);
    BitBtn4.Enabled:= True;
    ProcesandoVenta := False;
    Exit;
  end;
  //Generar y asignar Numero de Comprobante Fiscal
  if (Edit1.Text = '') And (Not EsDevolucion) and (not btnFactCxcTercero.Visible) then
  begin
    Raise Exception.Create('Favor indicar monto pago');
    if isShowing then
    edit1.SetFocus;
    BitBtn4.Enabled:= True;
    ProcesandoVenta := False;
    Exit;
  end;

  if not ValidaSubTotal then
  begin
    Raise Exception.Create('Favor verificar cálculos.');
    exit;
  end;

  if (GlbActivaIFiscal <> 1 ) And (CheckBox1.Checked) then
  begin
    if TotalesTipoNCF.IsNull then
    begin
      MessageDlg('Favor indicar tipo comprobante', mtWarning, [mbOk], 0);
      BitBtn4.Enabled:= True;
      ProcesandoVenta := False;
      Exit;
    end;
    if ((tablaPropietario.RecordCount = 0) Or (tablaPropietarioCodigoPropietario.Value = 0)
     Or (tablaPropietarioCodigoPropietario.IsNull)) And
        (TotalesTipoNCFIFiscal.Value In [1,4,5]) then
    begin
      MessageDlg('Favor asignar cliente', mtInformation, [mbOk], 0);
      BitBtn4.Enabled:= True;
      ProcesandoVenta := False;
      Exit;
    end;
  end;

  if (TotalesTipoNCFIFiscal.Value < 0) then
  begin
    MessageDlg('Verifique tipo NCF', mtError, [mbOk], 0);
    BitBtn4.Enabled:= True;
    ProcesandoVenta := False;
    Exit;
  end;
    
  GlbEsCopia:=False;
  esContado      := True;
  //GLBEsImp:= True;

  ProcesandoVenta := True;
  BitBtn4.Enabled:= False;
             
  if tablaPropietario.State in [dsInsert, dsEdit] then
  tablaPropietario.Post;
   
  dmfactura.qryctabcofact.close;
  dmfactura.qryctabcofact.params[0].Value:=glbCia_Key;
  dmfactura.qryctabcofact.Open;
  if (dmfactura.qryctabcofact.RecordSize > 0) and (GlBAyaco = 0) then
  GlbShowCtaBanco:=1;
  //TEMPORAL PARA PROBAR PRECIO
  //GlbActivaIFiscal := 1;
  //TEMPORAL

  AbortarPostServTaller:=False;
  if (((GlbActivaIFiscal = 1) or (GlbActivaECF = 1)) and CheckBox1.Checked) then
  begin
    if GlbEsDebugFiscal = 1 then
    WriteToLog('Verifica cliente');
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
            MessageDlg('Se requiere RNC/Cédula para tipo comprobante seleccionado, verifique. ', mtError, [mbok], 0);
            BitBtn4.Enabled:= True;
            ProcesandoVenta := False;
            Exit;
          end;
        end;
      end;
      if isShowing then
         if tablaPropietarioCodigoPropietario.IsNull then
            rxdbLookupCte.SetFocus;
      BitBtn6.Enabled := True;
      Exit;
    end;
    flag:=false;
    if GlbEsDebugFiscal = 1 then
      WriteToLog('Chequea si puerto com esta libre');
    if (GlbActivaIFiscal = 1) then
    begin
      StatusBar.Panels[0].Text:='Printer: ' + 'Online';//esto temporal
      StatusBar.Panels[1].Text:='Status: ' + 'Ready';


      frmPuertosLibres:= TfrmPuertosLibres.Create(nil);
      frmPuertosLibres.VerificarPuertosLibres;
      if Not GlbPuertoDisponible then
      begin
        MessageDlg('Puerto ' + 'COM' + IntToStr(GlbPuerto) + ' no está libre, verifique.', mtWarning, [mbOk], 0);
        BitBtn4.Enabled:= True;
        ProcesandoVenta := False;
        flag:=true;
        StatusBar.Panels[0].Text:='Printer: ' + 'Busy';//esto temporal
        StatusBar.Panels[1].Text:='Status: ' + 'Offline';
      end;
      frmPuertosLibres.Free;
      frmPuertosLibres := Nil;
      if flag then exit;
    end;
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
      ProcesandoVenta := False;
      Exit;
    end;
  end;

  if (GlbActivaECF = 1) and (CheckBox1.Checked) and ((
  TotalesTipoNCF.Value ='31') or (TotalesTipoNCF.Value ='33') or
  (TotalesTipoNCF.Value ='34') or (TotalesTipoNCF.Value ='45')) then
  begin
    qryVerecfTerrCte.close;
    qryVerecfTerrCte.Params[0].Value:= tablaPropietarioCodigoPropietario.Value;
    qryVerecfTerrCte.open;
    qryVerecfTerrCte.first;
    if qryVerecfTerrCteID_PROVINCIA.IsNull or qryVerecfTerrCteID_MUNICIPIO.IsNull then
    begin
      if GlbActivaECF = 1 then
      begin
      MessageDlg('Tienes que configurar la Provincia y el Municipio del Cliente.', mtError, [mbok], 0);
      dmClientes.tblClienteTerritorio.Close;
      dmClientes.tblClienteTerritorio.Params[0].Value:= tablaPropietarioCodigoPropietario.Value;
      dmClientes.tblClienteTerritorio.Open;

      ProcAsignarProvMunc;

      qryVerecfTerrCte.close;
      qryVerecfTerrCte.Params[0].Value:= tablaPropietarioCodigoPropietario.Value;
      qryVerecfTerrCte.open;
      qryVerecfTerrCte.first;
      if qryVerecfTerrCteID_MUNICIPIO.IsNull or
      qryVerecfTerrCteID_PROVINCIA.IsNull then
      begin
        MessageDlg('Tienes que configurar la Provincia y el Municipio del Cliente.'#10#13'Actualice los campos desde la ventana de clientes.', mtError, [mbok], 0);
      end;

      BitBtn4.Enabled:= True;
      ProcesandoVenta := False;
      Exit;
      end;
    end;
  end;
  if EsDevolucion then
  TipoVenta:='Devolución' else
  if (GlbNCFConfFinal = 1) and (GlbIgI = 0) then
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
  if (GlbEsDebugFiscal = 1) and not CheckBox1.Checked then
  WriteToLog('Opcion para Asignar NCF desactivada');

  if CheckBox1.Checked then
  begin
    try
      if Assigned(frmSelNCF) then
      frmSelNCF:=nil;
    except
    end;
    
    frmSelNCF:=TfrmSelNCF.Create(Self);
    try
      if Not EsDevolucion then
      begin
        if GlbActivaECF = 0 then
        begin
          if RxDBLookupCombo3.Visible then
             dmFactura.ibQryViewNCF.Locate('TIPO_CF', TotalesTipoNCF.Value,[])
          else
          dmFactura.ibQryViewNCF.Locate('TIPO_CF','02',[]); //Factura Consumidor Final
        end else
        begin
          if RxDBLookupCombo3.Visible then
             dmFactura.ibQryViewNCF.Locate('TIPO_CF', TotalesTipoNCF.Value,[])
          else
          dmFactura.ibQryViewNCF.Locate('TIPO_CF','32',[]); //Factura Consumidor Final
        end;
      end else
      begin
        if GlbActivaECF = 0 then
        dmFactura.ibQryViewNCF.Locate('TIPO_CF','04',[]) //Nota Credito
        else
        dmFactura.ibQryViewNCF.Locate('TIPO_CF','34',[])
      end;

      if (GlbNCFConfFinal = 0) and Not NoGenerarNCF1.Checked then
      begin
        showNcfwindows:= True;//dmFactura.ibQryViewNCFtipo_cf.value
      end else
      begin
        if NoGenerarNCF1.Checked then  //no imprime NCF
        showNcfwindows := True;

        if (GlbActivaIFiscal = 1 ) then
        begin
           showNcfwindows:=False;

           if TotalesTipoNCF.IsNull then
           begin
             MessageDlg('Favor indicar tipo comprobante.', mtInformation, [mbok],0);
             if isShowing then
             RxDBLookupCombo3.SetFocus;
             BitBtn4.Enabled:= True;
             ProcesandoVenta := False;
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

        if GlbActivaECF = 1 then
        showNcfwindows:=False;

        if showNcfwindows and CheckBox1.Checked then
        begin
          if RxDBLookupCombo3.Visible then
          dmFactura.ibQryViewNCF.Locate('TIPO_CF',TotalesTipoNCF.Value,[]);
          flag:=True;
          if frmSelNCF.ShowModal = mrOk then
          begin
            showNcfwindows:= True;
            genNcf:=True;
            flag:=True; //dmFactura.ibQryViewNCF.sql.text
            if (dmFactura.ibQryViewNCFTIPO_CF.Value = '01') or
               (dmFactura.ibQryViewNCFTIPO_CF.Value = '14') or
               (dmFactura.ibQryViewNCFTIPO_CF.Value = '15') or
               (dmFactura.ibQryViewNCFTIPO_CF.Value = '31') or
               (dmFactura.ibQryViewNCFTIPO_CF.Value = '41') or
               (dmFactura.ibQryViewNCFTIPO_CF.Value = '45') or
               (dmFactura.ibQryViewNCFTIPO_CF.Value = '44') or
               (dmFactura.ibQryViewNCFTIPO_CF.Value = '46') or
               (dmFactura.ibQryViewNCFTIPO_CF.Value = '47') then
            begin
              if tablaPropietarioCodigoPropietario.Value = 0 then
              begin
                MessageDlg('Se requiere RNC/Cédula para tipo comprobante seleccionado, verifique. ', mtError, [mbok], 0);
                BitBtn4.Enabled:= True;
                ProcesandoVenta := False;
                Exit;
              end;
            end;
          end else
          BEGIN
            showNcfwindows:= False;
            genNcf:=False;
          END;
        end else
        if (GlbNCFConfFinal = 1) then
        showNcfwindows:= true else
        showNcfwindows:= False;
      end;

      if NoGenerarNCF1.Checked then  //No imprime NCF
      showNcfwindows := False;

      if (GlbNCFConfFinal = 1) and CheckBox1.Checked then
      showNcfwindows:= True else
      showNcfwindows:= False;

      GlbDescNCF:='';
      if (GlbActivaIFiscal = 1 ) then
      ShowNcfwindows:= True;

      TotalesTipoNCF.Value;
      TotalesTipoNCFIFiscal.Value;

      if not CheckBox1.Checked then genNcf := False;

      //dmFactura.ibQryViewNCFTIPO_NCF_IFISCAL.Value;
      if showNcfwindows and genNcf and CheckBox1.checked and not flag then
      begin
        if dmFactura.ibQryViewNCF.Locate('TIPO_CF',TotalesTipoNCF.Value, []) then
        if (GlbNCFConfFinal = 0) And (TotalesTipoNCF.IsNull) then
        begin
          if frmSelNCF.ShowModal = mrok then
          begin
            genNcf:= True;
            flag  := True;
            if (dmFactura.ibQryViewNCFTIPO_CF.Value = '01') or
               (dmFactura.ibQryViewNCFTIPO_CF.Value = '14') or
               (dmFactura.ibQryViewNCFTIPO_CF.Value = '15') or
               (dmFactura.ibQryViewNCFTIPO_CF.Value = '31') or
               (dmFactura.ibQryViewNCFTIPO_CF.Value = '41') or
               (dmFactura.ibQryViewNCFTIPO_CF.Value = '44') or
               (dmFactura.ibQryViewNCFTIPO_CF.Value = '45') then
            begin
              if tablaPropietarioCodigoPropietario.Value = 0 then
              begin
                MessageDlg('Se requiere RNC/Cédula para tipo comprobante seleccionado, verifique. ', mtError, [mbok], 0);
                BitBtn4.Enabled:= True;
                ProcesandoVenta := False;
                Exit;
              end;
            end;
          end else
          begin
            genNcf:= False;
            Totales.Edit;
            TotalesTipoNCF.AsVariant:= null;
            TotalesTipoNCFIFiscal.AsVariant:= null;
            if not LlenandoDatos then
            Totales.Post;
          end;
       end else genNcf:= true;
     end else
     if not flag And Not showNcfwindows And ((GlbActivaIFiscal = 0) or  (GlbActivaeCF = 0)) and (CheckBox1.Checked)  then  //AQUI CONDICIONR NO ENTRAR SI YA FUE INDICADO EN PREVIO MROK
     begin
       if RxDBLookupCombo3.Visible then
       dmFactura.ibQryViewNCF.Locate('TIPO_CF',TotalesTipoNCF.Value,[]);
       if not showNcfwindows then
       begin
         genNcf:= True;
         flag  := True;
            if (dmFactura.ibQryViewNCFTIPO_CF.Value = '01') or
               (dmFactura.ibQryViewNCFTIPO_CF.Value = '14') or
               (dmFactura.ibQryViewNCFTIPO_CF.Value = '15') or
               (dmFactura.ibQryViewNCFTIPO_CF.Value = '31') or
               (dmFactura.ibQryViewNCFTIPO_CF.Value = '44') or
               (dmFactura.ibQryViewNCFTIPO_CF.Value = '45') then
            begin
              if tablaPropietarioCodigoPropietario.Value = 0 then
              begin
                MessageDlg('Se requiere RNC/Cédula para tipo comprobante seleccionado, verifique. ', mtError, [mbok], 0);
                BitBtn4.Enabled:= True;
                ProcesandoVenta := False;
                Exit;
              end;
            end;
         if Totales.State = dsBrowse then
         begin
           //if not LlenandoDatos then
           //Totales.Post;
         end;
       end else
       if frmSelNCF.ShowModal = mrok then
       begin
         genNcf:= True;
         flag  := True;
         if Totales.State = dsBrowse then
         begin
           Totales.Edit;
           TotalesTipoNCF.Value := dmFactura.ibQryViewNCFTIPO_CF.Value;
           TotalesTipoNCFIFiscal.Value := dmFactura.ibQryViewNCFTIPO_NCF_IFISCAL.Value;
           if not LlenandoDatos then
           Totales.Post;
         end;
       end else
       begin
         genNcf:= False;
         Totales.Edit;
         TotalesTipoNCF.AsVariant:= null;
         TotalesTipoNCFIFiscal.AsVariant:= null;
         if not LlenandoDatos then
         Totales.Post;
       end;
     end;

     if ((GlbActivaIFiscal = 1) or (GlbActivaeCF = 1)) and CheckBox1.checked then genNcf:=True;
     //Refactorizado tratar de evitar duplicidad en registro de venta
     if (GlbNumVtaPOSTmp = -1) then
     try
       ProcInsertCtrlNumVta;
     except
       ShowMessage('No se puede guardar esta venta, comunicar a soporte.');
       exit;
     end;
     if genNcf and CheckBox1.checked then
     begin
       //GlbDescNCF := 'Fact. Consumidor Final';//dmFactura.ibQryViewNCFDESCRIPCION.Value;
       if Totales.State = dsBrowse then
       begin
         Totales.Edit;
         TotalesTipoNCF.Value := dmFactura.ibQryViewNCFTIPO_CF.Value;
         TotalesTipoNCFIFiscal.Value := dmFactura.ibQryViewNCFTIPO_NCF_IFISCAL.Value;
         if not LlenandoDatos then
         Totales.Post;
       end;
       if (GlbUsaSecNCF2018 = 0) then
       GlbDescNCF   := dmFactura.ibQryViewNCFDESCRIPCION.Value
       else
       GlbDescNCF   := dmFactura.ibQryViewNCFDESCRIPCION_2018.Value;

       if CheckBox1.checked AND ((tablaPropietarioCodigoPropietario.IsNull) or (tablaPropietarioCodigoPropietario.Value = 0)) and
       TipoCFRequiereCliente(dmFactura.ibQryViewNCFTIPO_CF.Value) then
       begin
         MessageDlg('Necesitas seleccionar un cliente, verificar.', mtError, [mbOk], 0);
         Exit;
       end;
       frmAsignarNCFVenta  := tfrmAsignarNCFVenta.Create(self);
       try
         frmAsignarNCFVenta.IBDataSet1.Close;
         frmAsignarNCFVenta.IBDataSet1.Open;
         frmAsignarNCFVenta.IBDataSet1.Append;
         frmAsignarNCFVenta.IBDataSet1CODIGO_CTE.Value:= tablaPropietarioCodigoPropietario.Value;
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
         EsModificandoCotiza:= False;
         label36.Caption    := '';
         GlbUsandoCotiza    := False;
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
           if not LlenandoDatos then
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
     // frmSelNCF:= Nil;
    end;
  end;
  //if GlbEsDebugFiscal = 1 then
  //WriteToLog('Grabar venta en ventas_mast');
  //ibstpProcSecuencia.Params[0].Value := out
  //ibstpProcSecuencia.Params[1].Value :=
  ibstpProcSecuencia.Params[2].Value := 4;

  ipStpInsertVentMast.Params[1].Value := ExtraerFecha(GlbFechaTrnDiaria);
  if (GLBSAM = 1) then
  begin
    if (GlbUsaFctMexico = 1) and (not TotalesFechaIniciaPoliza.IsNull) then
    ipStpInsertVentMast.Params[1].Value := ExtraerFecha(TotalesFechaIniciaPoliza.Value);
  end;  

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
  ipStpInsertVentMast.Params[9].Value    := 'P';
  ipStpInsertVentMast.Params[10].Value   := Now;
  ipStpInsertVentMast.Params[11].Value   := Null;
  ipStpInsertVentMast.Params[12].Value   := Null;
  ipStpInsertVentMast.Params[13].Value   := Null;
  ipStpInsertVentMast.Params[14].Value   := Null;
  ipStpInsertVentMast.Params[15].Value   := ibstpProcSecuencia.Params[0].Value;

  ipStpInsertVentMast.Params[17].Value   := TotalesSubTotal.Value;
  ipStpInsertVentMast.Params[18].Value   := TotalesPorcDesAdicional.Value;
  if Abs(TotalesMontoDescAdicional.Value) > 0 then
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

  ipStpInsertVentMast.Params[39].Value:= TotalesPropina.Value;
  ipStpInsertVentMast.Params[40].Value:= GlbPorcPropina;
  ipStpInsertVentMast.Params[41].Value:= TotalesPropinaLegal.Value;
  if not rxPreventaticket_id.IsNull then
  ipStpInsertVentMast.Params[42].Value:= rxPreventaticket_id.Value //ticket fast food limao
  else
  ipStpInsertVentMast.Params[42].Value:= null;

  if (rxCoberturaMontoCobertura.Value > 0) then
  ipStpInsertVentMast.Params[43].Value:= 1
  else
  ipStpInsertVentMast.Params[43].Value:= 0;

  ipStpInsertVentMast.Params[44].Value:= Null;
  ipStpInsertVentMast.Params[45].Value:= Null;
  //
  if GLBSAM = 1 then
  begin
    if not TotalesFechaIniciaPoliza.IsNull then
    ipStpInsertVentMast.Params[44].Value:= TotalesFechaIniciaPoliza.AsDateTime;
    if not TotalesTipoAfiliado.IsNull then
    ipStpInsertVentMast.Params[45].Value:= TotalesTipoAfiliado.Value;
  end;

  ipStpInsertVentMast.Params[46].Value:= TotalesidNumeroDVeh.Value;
  if Totalestipodeingreso.IsNull then
  ipStpInsertVentMast.Params[47].Value:= 1
  else
  ipStpInsertVentMast.Params[47].Value:= Totalestipodeingreso.AsInteger;

  if (GlbActivaECF = 1) and (Totalestipodeingreso.IsNull or
  (Totalestipodeingreso.Value = '0') or (Totalestipodeingreso.Value = '')) then
  ipStpInsertVentMast.Params[47].Value:=1;

    try
    PasoPersistencia := 'Insertando VENTAS_MAST';

    ipStpInsertVentMast.ExecProc; //1 venta normal

    numeroTrnVta := ipStpInsertVentMast.Params[0].Value;
    NumeroTrn := numeroTrnVta;
    MasterCreado := True;
    VentaCompleta := False;
    isMasterSave := True;

    {
      NO marcar TotalesVentaGuardada aquí.
      La venta todavía no está completa porque VENTAS_DET no ha sido insertado.
    }

  except
    on E: Exception do
    begin
      if ipStpInsertVentMast.Transaction.InTransaction then
      begin
        try
          ipStpInsertVentMast.Transaction.Rollback;
        except
        end;
      end;

      LogInformacionTxt(
        'ERROR guardando VENTAS_MAST. Paso=' + PasoPersistencia +
        ' Error=' + E.Message
      );

      NotificaErrorByEmail(
        'ERROR guardando VENTAS_MAST' + LF + CR +
        'Paso: ' + PasoPersistencia + LF + CR +
        'Usuario: ' + GlbUsuarioLogueado + LF + CR +
        'Error: ' + E.Message
      );

      MessageDlg('Error guardando en master: ' + E.Message, mtError, [mbok], 0);

      ProcesandoVenta := False;
      BitBtn4.Enabled := True;
      Exit;
    end;
  end;

  try
    PasoPersistencia := 'Post-master iniciado';

    ProcUpdateCtrlNumVta(numeroTrnVta);

    if TotalesPreAbono.Value > 0 then
      ProcActualizarStadoPrepP(tablaPropietarioCodigoPropietario.Value, numeroTrnVta);

    ProcGuardarDatosCoti(numeroTrnVta);

    if (GLBSAM = 1) then
    begin
      if (totalesReferenciaCte.Value <> '') then
        ProcActualizaSecCertSAM(totalesReferenciaCte.AsInteger);
    end;

    if (GlbFarmacia = 1) then
      ProcInsertarDatosVtaSeguro(numeroTrnVta);

    try
      DatosVocado(numeroTrnVta, ipStpInsertVentMast.Params[5].Value);
    except
      on E: Exception do
      begin
        LogInformacionTxt(
          'Aviso en DatosVocado. Trn=' + IntToStr(numeroTrnVta) +
          ' Error=' + E.Message
        );
        {
          Lo dejo como aviso para no cambiar la regla actual.
          Si DatosVocado debe ser obligatorio, sustituir este bloque por:
          raise;
        }
      end;
    end;

    PasoPersistencia := 'Actualizando vínculo POS/VENTA';
    ProcUpdateNumDLinea(GlbNumVtaPOS, numeroTrnVta, 1);

    Totales.Tag := numeroTrnVta;

    if not ipStpInsertVentMast.Transaction.InTransaction then
      ipStpInsertVentMast.Transaction.StartTransaction;

    try
      ipStpInsertVentMast.Transaction.CommitRetaining;
    except
      ipStpInsertVentMast.Transaction.RollbackRetaining;
      raise;
    end;

    ProcGuardarDatosCoti(numeroTrnVta);

    if GlbEsDebugFiscal = 1 then
      WriteToLog('Actualiza usuario caja: ActualizaCodUsrCaja(numeroTrnVta);');

    PasoPersistencia := 'Actualizando usuario caja';
    ActualizaCodUsrCaja(numeroTrnVta);

    PasoPersistencia := 'Actualizando recargo/ITBIS master';
    ProcUpdateItbiRecargoVtaMast(numeroTrnVta);

    if (rxVenta.RecordCount > 0) and (rxCoberturaMontoCobertura.Value > 0) then
      InsertaBalanceARS(rxCoberturaMontoCobertura.Value, 1, rxCoberturaCodigo_Cliente.Value);

    try
      if (GlbPorcPropina > 0) or (NumTicketFFood > 0) then
        ActFastFoodTicket(NumTicketFFood);
    except
      on E: Exception do
      begin
        LogInformacionTxt(
          'Aviso en ActFastFoodTicket. Trn=' + IntToStr(numeroTrnVta) +
          ' Error=' + E.Message
        );
      end;
    end;

    if (TotalesTipoNCF.Value = '15') or
       (TotalesTipoNCF.Value = '14') or
       (TotalesTipoNCF.Value = '45') then
    begin
      PasoPersistencia := 'Aplicando tipo retención venta';

      updTipoRetencionVta.Params[0].Value := 1; // LEY RETENCION GOBIERNO y ONG
      updTipoRetencionVta.Params[1].Value := numeroTrnVta;
      updTipoRetencionVta.ExecQuery;

      if not updTipoRetencionVta.Transaction.InTransaction then
        updTipoRetencionVta.Transaction.StartTransaction;

      try
        updTipoRetencionVta.Transaction.CommitRetaining;
      except
        updTipoRetencionVta.Transaction.RollbackRetaining;
        raise;
      end;
    end;

    if Assigned(frmRegServicioTaller) then
      UpdateServINFO(numeroTrnVta);

    if Assigned(frmAlquiler) then
      UpdateServAlquiler(numeroTrnVta);

    ProcGuardarDatosCoti(numeroTrnVta);

    if (GlbActivaIFiscal = 1) then
      FInsertarDatosCtrlNIF(numeroTrnVta);

    if (GlbSolicitaDVeh = 1) and (GlbMutur = 0) then
    begin
      PasoPersistencia := 'Registrando datos vehículo';

      tblDatosVentaVehiculos.Close;
      tblDatosVentaVehiculos.Open;
      frmDatosVentaVehiculos := TfrmDatosVentaVehiculos.Create(nil);
      try
        tblDatosVentaVehiculos.Params[0].Value := numeroTrnVta;
        tblDatosVentaVehiculos.Append;
        frmDatosVentaVehiculos.NumeroVenta := numeroTrnVta;
        tblDatosVentaVehiculosMONTO_INICIAL.Value := TotalesTotalNeto.Value;
        frmDatosVentaVehiculos.Showmodal;
      finally
        frmDatosVentaVehiculos.Free;
        frmDatosVentaVehiculos := nil;
      end;
    end
    else
    if (GlbMutur = 1) or (GLBMTEGroup = 1) then
    begin
      PasoPersistencia := 'Registrando datos vehículo Mutur/MTE';

      qryDatosVh.Close;
      qryDatosVh.Params[0].Value := _chassisVeh;
      qryDatosVh.Open;

      tblDatosVentaVehiculos.Close;
      tblDatosVentaVehiculos.Params[0].Value := numeroTrnVta;
      tblDatosVentaVehiculos.Open;

      if (tblDatosVentaVehiculos.RecordCount = 0) and (qryDatosVhCHASSIS.Value <> '') then
      begin
        tblDatosVentaVehiculos.Append;
        tblDatosVentaVehiculosMONTO_INICIAL.Value := TotalesTotalNeto.Value;
        tblDatosVentaVehiculosNUM_SERIE.Value := numeroTrnVta;
        tblDatosVentaVehiculosCHASSIS.Value := qryDatosVhCHASSIS.Value;
        tblDatosVentaVehiculosMARCA.Value := qryDatosVhMARCA_VEHICULO.Value;
        tblDatosVentaVehiculosMODELO.Value := qryDatosVhMODELO.Value;
        GlbSalvarQuery(tblDatosVentaVehiculos);

        qryDatosVh.Close;
        tblDatosVentaVehiculos.Close;
        _chassisVeh := '';
      end;
    end;

    PasoPersistencia := 'Actualizando pagos existentes';

    if (not EsFactura) or (not EsModificandoFactura) or (not EsModificandoCotiza) then
    begin
      rxPagos.First;
      while not rxPagos.Eof do
      begin
        ibslqlUpdatetrnpagos.Params[0].Value := numeroTrnVta;
        ibslqlUpdatetrnpagos.Params[1].Value := rxPagosSerie.Value;
        ibslqlUpdatetrnpagos.Params[2].Value := GlbNumVtaPOS;
        ibslqlUpdatetrnpagos.ExecQuery;

        if GlbEsDebugEntradas = 1 then
          WriteToLog(
            'II Pago guardado: GlbNumVtaPOS =' + IntToStr(GlbNumVtaPOS) +
            ' #Trn:' + IntToStr(NumeroTrn) +
            ' Monto Neto: ' + Totalestotalneto.AsString
          );

        rxPagos.Next;
      end;

      if not ibslqlUpdatetrnpagos.Transaction.InTransaction then
        ibslqlUpdatetrnpagos.Transaction.StartTransaction;

      try
        ibslqlUpdatetrnpagos.Transaction.CommitRetaining;
      except
        ibslqlUpdatetrnpagos.Transaction.RollbackRetaining;
        raise;
      end;
    end;

    if GlbEsDebugFiscal = 1 then
      WriteToLog('Procesar Pago');

    PasoPersistencia := 'Procesando pagos';

    if (rxPagos.RecordCount = 0) then
      ProcInsertarDetEfectivo(numeroTrnVta, ipStpInsertVentMast.Params[5].Value);

    if GlbFactRecurrente then
      ProcInsertarDetEfectivoC(numeroTrnVta, FPagoFctR, _montoAbonoC);

    ProcInsertarDetCheque(numeroTrnVta);
    ProcInsertarDetPagos(numeroTrnVta);
    ProcInsertarDetBono(numeroTrnVta);

    rxPagos.First;
    while not rxPagos.Eof do
    begin
      ibslqlUpdatetrnpagos.Params[0].Value := numeroTrnVta;
      ibslqlUpdatetrnpagos.Params[1].Value := rxPagosSerie.Value;
      ibslqlUpdatetrnpagos.Params[2].Value := GlbNumVtaPOS;
      ibslqlUpdatetrnpagos.ExecQuery;

      if GlbEsDebugEntradas = 1 then
        WriteToLog(
          'I Pago guardado: GlbNumVtaPOS =' + IntToStr(GlbNumVtaPOS) +
          ' #Trn:' + IntToStr(NumeroTrn) +
          ' Monto Neto: ' + Totalestotalneto.AsString
        );

      rxPagos.Next;
    end;

    if not ibslqlUpdatetrnpagos.Transaction.InTransaction then
      ibslqlUpdatetrnpagos.Transaction.StartTransaction;

    try
      ibslqlUpdatetrnpagos.Transaction.CommitRetaining;
    except
      ibslqlUpdatetrnpagos.Transaction.RollbackRetaining;
      raise;
    end;

    NumeroTrn := numeroTrnVta;
    ProcGuardarDatosCoti(numeroTrnVta);

    if not FuncPagoRegistrado(NumeroTrn) then
    begin
      WriteToLog(
        'Pago no guardado: #Trn:' + IntToStr(NumeroTrn) +
        ' Monto Neto: ' + Totalestotalneto.AsString
      );

      if Totalestotalneto.Value > 0 then
        ProcInsertarDetEfectivo(NumeroTrn, 1);

      if not FuncPagoRegistrado(NumeroTrn) then
      begin
        NotificaErrorByEmail(
          'Pago no guardado: #Trn:' + IntToStr(NumeroTrn) +
          ' Monto Neto:' + Totalestotalneto.AsString
        );

        {
          No hago raise aquí para no cambiar tu regla actual.
          Si pago obligatorio debe tumbar la venta, sustituir por:
          raise Exception.Create('Pago no guardado para Trn ' + IntToStr(NumeroTrn));
        }
      end;
    end;

    PasoPersistencia := 'Insertando VENTAS_DET';

    if GlbEsDebugFiscal = 1 then
      WriteToLog('Guardar en ventas det');

    rxVenta.DisableControls;
    RxDBGrid1.DisableScroll;
    ProgressBar1.Max := rxVenta.RecordCount;
    ProgressBar1.Position := 0;
    ProgressBar1.Visible := True;

    try
      rxVenta.First;

      while not rxVenta.Eof do
      begin
        if (rxVentaStatus.Value = 'C') or (rxVentaCodArticulo.Value = 0) then
        begin
          rxVenta.Next;
          Continue;
        end;

        try
          InsertarDet(numeroTrnVta);
        except
          on E: Exception do
          begin
            LogInformacionTxt(
              'ERROR INSERTANDO VENTAS_DET. Trn=' + IntToStr(numeroTrnVta) +
              ' CodProd=' + rxVentaCodArticulo.AsString +
              ' SerieLinea=' + rxVentaSerie.AsString +
              ' Cant=' + rxVentaCant.AsString +
              ' Precio=' + rxVentaPrecio.AsString +
              ' Error=' + E.Message
            );

            raise;
          end;
        end;

        ibStpActualizaInvProd.Params[0].Value := rxVentaCodArticulo.Value;

        if GlbEsDebugEntradas = 1 then
        begin
          qryVerificaInv.Close;
          qryVerificaInv.Params[0].Value := rxVentaCodArticulo.Value;
          qryVerificaInv.Open;
          cantidadanterior := qryVerificaInvCantidad.Value;
        end;

        CantUnidad := SetCantUnidad(rxVentaCodArticulo.Value, rxVentaTipoUnidad.Value);

        if CantUnidad = 0 then
          CantUnidad := 1;

        ibStpActualizaInvProd.Params[1].Value := rxVentaCant.Value * CantUnidad;

        if GlbUsaPUnidadLevel = 0 then
        begin
          if (rxVentaTipoUnidad.Value = 1) or (rxVentaTipoUnidad.Value = 0) then
            ibStpActualizaInvProd.Params[1].Value := rxVentaCant.Value
          else
            ibStpActualizaInvProd.Params[1].Value := rxVentaCant.Value * CantUnidad;
        end
        else
          ibStpActualizaInvProd.Params[1].Value := rxVentaCant.Value * CantUnidad;

        if GlbEsDebugEntradas = 1 then
          WriteToLog(
            'CodProd:' + rxVentaCodArticulo.AsString +
            '. Cantidad a descontar de inventario:' +
            ibStpActualizaInvProd.Params[1].AsString
          );

        if not EsDevolucion then
          ibStpActualizaInvProd.Params[2].Value := 0
        else
          ibStpActualizaInvProd.Params[2].Value := 1;

        ibStpActualizaInvProd.Params[3].Value := 1;

        if (rxVentaInvetariar.Value <> 0) and (GlbCodDivInventario = 1) then
        begin
          try
            Sleep(50);
            ibStpActualizaInvProd.ExecProc;
          except
            on E: Exception do
            begin
              NotificaErrorByEmail(
                'Actualizando Cant Inventario:' + rxDataAntCantFinal.AsString +
                ' #Trn ' + IntToStr(NumeroTrn) + LF + CR + E.Message
              );

              MessageDlg(
                'Error actualizando inventario, verifique.' + E.Message,
                mtError,
                [mbok],
                0
              );

              if GlbEsDebugEntradas = 1 then
                WriteToLog(
                  'CodProd:' + rxVentaCodArticulo.AsString +
                  '. Actualizando Cant Inventario:' + rxDataAntCantFinal.AsString +
                  ' #Trn ' + IntToStr(NumeroTrn) + LF + CR + E.Message
                );

              {
                Mantengo tu regla actual: error de inventario notifica,
                pero no tumba necesariamente la venta.
                Si inventario debe ser crítico, agrega:
                raise;
              }
            end;
          end;
        end;

        if not ibStpActualizaInvProd.Transaction.InTransaction then
          ibStpActualizaInvProd.Transaction.StartTransaction;

        try
          ibStpActualizaInvProd.Transaction.CommitRetaining;
        except
          ibStpActualizaInvProd.Transaction.RollbackRetaining;
          raise;
        end;

        if (rxVentaTipoVenta.Value = 0) or (rxVentaTipoVenta.IsNull) then
        begin
          try
            ActualizaInvAlmacen;
          except
            on E: Exception do
            begin
              NotificaErrorByEmail(
                'Actualizando Cant Inventario (stpMantInvAlmacen.ExecProc;):' +
                rxDataAntCantFinal.AsString +
                ' #Trn ' + IntToStr(NumeroTrn) + LF + CR + E.Message
              );

              WriteToLog(
                'Actualizando Cant Inventario (stpMantInvAlmacen.ExecProc;):' +
                rxDataAntCantFinal.AsString +
                ' #Trn ' + IntToStr(NumeroTrn) + LF + CR + E.Message
              );

              {
                Mantengo tu regla actual: avisa/loguea y continúa.
                Si esto debe ser obligatorio, agrega raise.
              }
            end;
          end;
        end;

        if GlbEsDebugEntradas = 1 then
          ProcVerificaActInventario(
            rxVentaCodArticulo.Value,
            rxVentaCant.Value,
            cantidadanterior,
            NumeroTrn
          );

        if GlbEsDebugEntradas = 1 then
          WriteToLog('CodProd:' + rxVentaCodArticulo.AsString);

        ProgressBar1.StepIt;
        rxVenta.Next;
      end;

    finally
      ProgressBar1.Visible := False;
      RxDBGrid1.EnableScroll;
      rxVenta.EnableControls;
    end;

    if GlbEsDebugFiscal = 1 then
      WriteToLog('Detalle venta guardado');

    if not ibStpInsertVentaDet.Transaction.InTransaction then
      ibStpInsertVentaDet.Transaction.StartTransaction;

    try
      ibStpInsertVentaDet.Transaction.CommitRetaining;
    except
      ibStpInsertVentaDet.Transaction.RollbackRetaining;
      raise;
    end;

    if EsConduce then
    begin
      ActualizaConduce1Click(Self);
    end;

    if not ibStpActualizaInvProd.Transaction.InTransaction then
      ibStpActualizaInvProd.Transaction.StartTransaction;

    try
      ibStpActualizaInvProd.Transaction.CommitRetaining;
    except
      ibStpActualizaInvProd.Transaction.RollbackRetaining;
      raise;
    end;

    PasoPersistencia := 'Validando VENTAS_DET';

    qryCheckDetVta.Close;
    qryCheckDetVta.Params[0].Value := numeroTrnVta;
    qryCheckDetVta.Open;
    qryCheckDetVta.Last;

    if qryCheckDetVta.RecordCount = 0 then
    begin
      raise Exception.Create(
        'Transacción #' + IntToStr(numeroTrnVta) +
        ' no fue registrada en VENTAS_DET.'
      );
    end;

    PasoPersistencia := 'Registrando delivery/ctrl usuario';

    dmfactura.qryVtaConDeliveryTrn.Close;

    if TotalesCodigoCteDelivery.Value > 0 then
    begin
      tblClienteDeliveryTrn.Close;
      tblClienteDeliveryTrn.Params[0].Value := TotalesCodigoCteDelivery.Value;
      tblClienteDeliveryTrn.Open;
      tblClienteDeliveryTrn.First;

      if not tblClienteDeliveryTrn.Locate('NUMERO_TRN', numeroTrnVta, []) then
      begin
        tblClienteDeliveryTrn.Append;
        tblClienteDeliveryTrnCODIGO.Value := TotalesCodigoCteDelivery.Value;
        tblClienteDeliveryTrnNUMERO_TRN.Value := numeroTrnVta;
        GlbSalvarQuery(tblClienteDeliveryTrn);
      end;

      dmfactura.qryVtaConDeliveryTrn.Close;
      dmfactura.qryVtaConDeliveryTrn.Params[0].Value := numeroTrnVta;
      dmfactura.qryVtaConDeliveryTrn.Open;
    end;

    try
      if GlbEsDebugFiscal = 1 then
        WriteToLog('Registro en tabla ctrltransusuario' + IntToStr(numeroTrnVta));

      dmReportes.tblCtrlTransusuario.Close;
      dmReportes.tblCtrlTransusuario.Params[0].Value := VarUsuarioGlb;
      dmReportes.tblCtrlTransusuario.Params[1].Value := numeroTrnVta;
      dmReportes.tblCtrlTransusuario.Open;
      dmReportes.tblCtrlTransusuario.First;

      if dmReportes.tblCtrlTransusuario.RecordCount = 0 then
      begin
        dmReportes.tblCtrlTransusuario.Append;
        dmReportes.tblCtrlTransusuarioID_USUARIO.Value := VarUsuarioGlb;
        dmReportes.tblCtrlTransusuarioNUMERO_TRANS.Value := numeroTrnVta;
        dmReportes.tblCtrlTransusuarioINSERTADO_POR.Value := strUserName;
        dmReportes.tblCtrlTransusuarioFECHA_IN.Value := Now;
        dmReportes.tblCtrlTransusuarioSTATUS.Value := 'A';
        dmReportes.tblCtrlTransusuario.Post;
        dmReportes.tblCtrlTransusuario.ApplyUpdates;
        GlbSalvarQuery(dmReportes.tblCtrlTransusuario);
      end
      else
      if dmReportes.tblCtrlTransusuario.RecordCount = 1 then
      begin
        dmReportes.tblCtrlTransusuario.Edit;
        dmReportes.tblCtrlTransusuarioFECHA_IN.Value := Now;
        GlbSalvarQuery(dmReportes.tblCtrlTransusuario);
      end;
    except
      on E: Exception do
      begin
        LogInformacionTxt(
          'Aviso registrando ctrltransusuario. Trn=' + IntToStr(numeroTrnVta) +
          ' Error=' + E.Message
        );
      end;
    end;

    PasoPersistencia := 'Activando VENTAS_MAST';

    dmfactura.tbltrnventasmastupd.Close;
    dmfactura.tbltrnventasmastupd.Params[0].Value := numeroTrnVta;
    dmfactura.tbltrnventasmastupd.Open;

    if not dmfactura.tbltrnventasmastupdNUMERO.IsNull then
    begin
      dmfactura.tbltrnventasmastupd.Edit;
      dmfactura.tbltrnventasmastupdSTATUS.Value := 'A';
      GlbSalvarQuery(dmfactura.tbltrnventasmastupd);
    end;

    Totales.Edit;
    TotalesVentaGuardada.Value := 1;
    Totales.Post;

    VentaCompleta := True;

  except
    on E: Exception do
    begin
      LogInformacionTxt(
        'VENTA INCOMPLETA. Trn=' + IntToStr(numeroTrnVta) +
        ' Paso=' + PasoPersistencia +
        ' Error=' + E.Message
      );

      if MasterCreado and (numeroTrnVta > 0) then
      begin
        try
          dmfactura.tbltrnventasmastupd.Close;
          dmfactura.tbltrnventasmastupd.Params[0].Value := numeroTrnVta;
          dmfactura.tbltrnventasmastupd.Open;

          if not dmfactura.tbltrnventasmastupdNUMERO.IsNull then
          begin
            dmfactura.tbltrnventasmastupd.Edit;
            dmfactura.tbltrnventasmastupdSTATUS.Value := 'E';
            GlbSalvarQuery(dmfactura.tbltrnventasmastupd);
          end;
        except
          on E2: Exception do
          begin
            LogInformacionTxt(
              'ERROR marcando VENTAS_MAST como E. Trn=' +
              IntToStr(numeroTrnVta) +
              ' Error=' + E2.Message
            );
          end;
        end;
      end;

      NotificaErrorByEmail(
        'VENTA INCOMPLETA / MASTER HUERFANO CONTROLADO' + LF + CR +
        'Trn: ' + IntToStr(numeroTrnVta) + LF + CR +
        'Paso: ' + PasoPersistencia + LF + CR +
        'Usuario: ' + GlbUsuarioLogueado + LF + CR +
        'Error: ' + E.Message
      );

      MessageDlg(
        'La venta no pudo completarse.' + #13 +
        'Transacción: ' + IntToStr(numeroTrnVta) + #13 +
        'Paso: ' + PasoPersistencia + #13 +
        'No vuelva a procesarla. Comunique a soporte.',
        mtError,
        [mbok],
        0
      );

      ProcesandoVenta := False;
      BitBtn4.Enabled := False;

      try
        ProgressBar1.Visible := False;
        RxDBGrid1.EnableScroll;
        rxVenta.EnableControls;
      except
      end;
      Totales.Edit;
      TotalesVentaGuardada.Value := 0;
      Totales.Post;
      Exit;
    end;
  end;
  
  //Crear Factura Financiamiento
 if (GlbFactCxcATercero = 1) and (not rxVentaNUM_CONDUCE_CTE.IsNull)
  and (edtMontoInicial.Text <> '') then
  begin
    stpProc_InsertaVentaAuto.Params[1].Value:= ipStpInsertVentMast.Params[0].Value;//numtrn
    stpProc_InsertaVentaAuto.Params[2].Value:= rxVentaNUM_CONDUCE_CTE.AsInteger;//codigocxc
    stpProc_InsertaVentaAuto.Params[3].Value:= StrToFloat(edtMontoInicial.Text);//montoafinancia
    stpProc_InsertaVentaAuto.Params[4].Value:= StrToInt(edtCodProdFinanc.Text);
    stpProc_InsertaVentaAuto.Params[5].Value:= FGetFPago(0);
    stpProc_InsertaVentaAuto.ExecProc;
    try
      if not stpProc_InsertaVentaAuto.Transaction.InTransaction then
      stpProc_InsertaVentaAuto.Transaction.StartTransaction;
      stpProc_InsertaVentaAuto.Transaction.Commit;
      //edtMontoInicial.Text:='';
    except
    stpProc_InsertaVentaAuto.Transaction.RollbackRetaining;
    end;//stpProc_InsertaVentaAuto.Params[0].Value
    //edtMontoInicial.Text:='';
    //edtCodProdFinanc.Text:='';
  end;

  //Datos para recibo/factura
  dmReportes.qryViewVentasMast.Close;
  dmReportes.qryViewVentasMast.Params[0].Value:=ipStpInsertVentMast.Params[0].Value;
  dmReportes.qryViewVentasMast.Open;

  UImpresionVentas.ProcSetPathlogoTipoServicio(dmReportes.qryViewVentasMastTIPO_AFILIADO.Value);
  //Debuguear proceso de impresion
  //Solicitar ecf a la DGII
  if (GlbActivaECF = 1) and (5=5) and (ipStpInsertVentMast.Params[0].Value > 0) and CheckBox1.Checked then //Temporal
  begin
    if (ipStpInsertVentMast.Params[0].Value > 0) then
    DgiiSolicitareCF(ipStpInsertVentMast.Params[0].Value);//Enviar a DGII
  end;
  if (GlbActivaIFiscal = 1) then
  begin
    try
      reciboImpreso:=False;
      ImprimeFiscalContado(NumeroTrn);
      Estatus1Click(Self);
    except on E : Exception do
      begin
        if GlbEsDebugFiscal = 1 then
        WriteToLog('ERROR imprimiendo ticket fiscal: '+ e.Message);
      end;
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
      Delay(3000);

      qryVerificaReciboPdte.Close;
      qryVerificaReciboPdte.Open;
      qryVerificaReciboPdte.Last;
      if (qryVerificaReciboPdte.RecordCount > 1) then
      begin
        Delay(dmReportes.qryViewVentasMast.RecordCount*1000);
      end;
      qryVerificaReciboPdte.Close;
      qryVerificaReciboPdte.Open; 
      qryVerificaReciboPdte.Last;

      if (qryVerificaReciboPdte.RecordCount > 7) then
      begin
        Delay(dmReportes.qryViewVentasMast.RecordCount*500);
      end;
      qryVerificaReciboPdte.Close;
      qryVerificaReciboPdte.Open;
      qryVerificaReciboPdte.Last;

      if not GLBEsImp then
      begin
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
    end;
    //if GlbEsDebugFiscal = 1 then
    //WriteToLog('Chequea estatus impresora, ignorado temporalmente');
    //temporal Estatus1Click(Self);
    if (GlbActivaIFiscal = 1) then
    Delay(1000);
    if not GLBEsImp then
    begin
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
      if GlbEsDebugFiscal = 1 then
    WriteToLog('Ticket no fue impreso, tratando de reimprimir');
      RecuperaTicketfiscal1Click(Self);
    end;
    end;
    GLBEsImp:=False;
    ProcActualizaMsg;
    //BitBtn4.Enabled:= True;
  end else
  if SoloGuardaVenta then
  begin
    //no imprime
  end else
  begin
    dmReportes.qryViewVentasMast.Close;
    dmReportes.qryViewVentasMast.Params[0].Value:=ipStpInsertVentMast.Params[0].Value;
    dmReportes.qryViewVentasMast.Open;
    ImprimirVtaContado(valorNCF); //fin impresion venta al contado
  end;
  //Inicializar variables temporales despues de la venta
  rxPagos.EmptyTable;
  rxVenta.EmptyTable;
  Totales.Edit;
  TotalesReferenciaCte.Value:='';
  TotalesVentaGuardada.Value:=0;
  dmventas.tblLineaComentario.Close;
  dmventas.tblLineaComentario.Params[0].Value:=-1;
  lblTotalItem.Caption:='Total Items:'+IntToStr(rxVenta.RecordCount);
  if chkDisplay.Checked then
  Finalizardisplay;
  BitBtn1.Enabled:=True;
  BitBtn4.Enabled:=True;
  ProcesandoVenta := False;
  tablaPropietario.EmptyTable;
  tablaPropietario.Edit;
  tablaPropietarioCodigoPropietario.AsVariant := null;
  tablaPropietario.Post;
  xCodProd:=-1;
  valPgoARS:=False;
  edtCodigo.Text := '';
  BitBtn4.Enabled := False;

  if isShowing then
  BitBtn1.SetFocus;

  //EsDevolucion := False;
  Caption:='Proceso Venta';

  //NoGenerarNCF1Click(Self);
  if isShowing then
  if not EsModificandoCotiza then
  begin
    if isShowing then
    begin
      edtCodigo.SetFocus;
      PostMessage(edtCodigo.Handle, WM_SETFOCUS, 0, 0);
    end;
  end;
  edtObservacion.Text := '';

  if InactivaImprecibo then
  GlbImprimeReciboFact := 0;
  InactivaImprecibo    := False;
  //t label25.Font.Color   := clBlack;
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

  if (GlbNumVtaPOS > 0) then
  dmcalculos.ProcDeletePosExtraDet(GlbNumVtaPOS);
  GlbNumVtaPOS:=-1;
  GlbNumeroTrn:=-1;
  xCodProd:=-1;
  Application.ProcessMessages;
  dmcxc.rxIngresoEnTarjeta.close;
  dmcxc.rxIngresoEnTarjeta.Open;
  qryInventario.Close;
  qryInventario.Open;
  qryProductos.Close;
  qryProductos.Open;
  qryCliente.Close;
  qryCliente.Open;
  lblFechaCotizacion.Visible:= False;
  dbFechaCotizacion.Visible := False;
  NCFCTeNotSetup:=False;
  Label36.Visible:=False;
  glbcodVendedor := -1;
  EsModificandoCotiza:=False;
  label36.Caption:='';
  NoTieneCredito:=False;
  NoTieneDiasDeCredito:=False;
  chKDescuentoGlobal.Checked:= False;
  rxSolDatoscte.EmptyTable;
  flagSolLote:=False;
  rxventa.EnableControls;
  rxdbgrid1.Enabled:=True;
  RxDBGrid1.EnableScroll;
  _abortaImpre := false;
  rxspinImpCantCopias.Text:='0';
  if GlbCantCopias > 0 then
  rxspinImpCantCopias.Value :=GlbCantCopias;
  if not GLBEsFastFood then
  begin
    label29.Top:= 413;
    dbTextMontoExoneraITBIS.Top := 410;
  end;
  
  label41.Visible := False;
  DBText15.Visible:= False;
  //VerificaImpresoraFiscalM;
  if (GlbActivaIFiscal = 1 ) then
  begin
    ProcesaEstadoImpresora(numeroTrnVta);
    ProcGlbSecuenciaNCF;
  end;
  if Assigned(frmPagosCombinados) then
    FreeAndNil(frmPagosCombinados);
  Refresh;

  if (NumTrnServ = -1) then
  begin
    //Hide;
    frmRegServicioTaller.BringToFront;
    NumTrnServ := 0;
  end;

  if (NumTrnServAlq = -1) then
  begin
    if Assigned(frmAlquiler) then
    begin
      //Hide;
      frmAlquiler.BringToFront;
    end;
    NumTrnServAlq:= 0;
  end;

  GlbNumeroTrn:=-1;
  GlbNumVtaPOSTmp:=-1;
  dmfactura.qryctabcofact.close;
  dmfactura.qryctabcofact.params[0].Value:=glbCia_Key;
  dmfactura.qryctabcofact.Open;
  if (dmfactura.qryctabcofact.RecordSize > 0) and (GlBAyaco = 0) then
  GlbShowCtaBanco:=1;
  dmVentas.qryPrecioMaxInv.Close;
  dmVentas.qryPrecioMaxInv.Params[0].Value:= GlbCia_Key;
  dmVentas.qryPrecioMaxInv.Open;

  tbltipoDeIngresos.Close;
  tbltipoDeIngresos.Open;
  rxVenta.EnableControls;
  RxDBGrid1.EnableScroll;
  _TienepagoTarjeta:=False;
  if CerrarVentana then close;
end;

procedure TfrmProcVentaRapida.ImprimirVtaContado(valorNCF:string);
var
  flag : boolean;
  pulgadaInc: Real;
  i, totalCopias: Integer;
  _nombreGenerico:string;
begin
  reciboImpreso:=True;
    if GLBEsFastFood then  //imprimir venta al contado
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
        if (dmFactura.qryVentaFacturaMONTO_EXONERADO_ITBIS.Value > 0) then
        begin
          //qckRepReciboReimpFFoodPOS.QRLabel17.Left:=13;
          qckRepReciboReimpFFoodPOS.QRLabel17.Caption:= 'ITBIS Exonerado'
        end;      
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

        end;

        qckRepReciboReimpFFoodPOS.xtipoVenta := TipoVenta;
        qckRepReciboReimpFFoodPOS.valorNCF   := valorNCF;

        dmFactura.qryVentaFacturaDet.Last;
        if dmFactura.qryVentaFacturaDet.RecordCount = 1 then
        qckRepReciboReimpFFoodPOS.Page.Length:= 6
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
                qckRepReciboReimpFFoodPOS.Page.Length:=qckRepReciboReimpFFoodPOS.Page.Length + 0.26;
                qckRepReciboReimpFFoodPOS.Prepare;
                flag:=False;
              end else break;
            end;
          until flag = true;
        end;
        rxventa.EnableControls;
        rxdbgrid1.Enabled:=True;
        RxDBGrid1.EnableScroll;
        dmreportes.qryViewVentasMast.Close;
        dmreportes.qryViewVentasMast.Params[0].Value:= ipStpInsertVentMast.Params[0].Value;
        dmreportes.qryViewVentasMast.Open;
        UImpresionVentas.ProcSetPathlogoTipoServicio(dmReportes.qryViewVentasMastTIPO_AFILIADO.Value);

        RxDBGrid1.DataSource:= datasource1;
        dbtext1.DataField:='Descripcion';
        dbtext1.DataSource:= datasource1;
        dbedit1.DataSource:= datasource1;
        dbedit1.DataField:='Cant';
        dbedit2.DataSource:= datasource1;
        dbedit2.DataField:='Precio';
        dbedit3.DataSource:= datasource1;
        dbedit3.DataField:='MontoBruto';
        RxDBGrid1.Visible:=True;

        dmDatos.qryImpresoras.Close;
        dmDatos.qryImpresoras.Open;
        if dmDatos.qryImpresoras.Locate('IDMODULO;IDREPORTE',
        VarArrayOf([1,6]),[]) then     //Factura/Recibo Punto Venta
        qckRepReciboReimpFFoodPOS.PrinterSettings.PrinterIndex:=
        GetImpresora(dmDatos.qryImpresorasNOMBRE_IMPRESORA.Value);

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
        if GlbImpTicketVtaAgua = 1 then
        ImprimirTicketVtaAgua(ipStpInsertVentMast.Params[0].Value);

      finally
      qckRepReciboReimpFFoodPOS.Free;
      qckRepReciboReimpFFoodPOS:=Nil;
      end;
      end else
  if (UpperCase(GLBFormatoFactura) = 'FORMAFACOCO') and (GLBNumConduceCte = 1)then
    begin
      TipoVenta:='CONTADO';
      if dmfactura.qryVentaFacturaFORMA_PAGO.AsInteger in [7,8] then
      TipoVenta := 'CREDITO'
      else
      if dmfactura.qryVentaFacturaFORMA_PAGO.value = 1 then
      TipoVenta := 'CONTADO';
      dmreportes.qryViewVentasMast.Close;
      dmreportes.qryViewVentasMast.Params[0].Value:= numerotrn;
      dmreportes.qryViewVentasMast.Open;
      UImpresionVentas.ProcSetPathlogoTipoServicio(dmReportes.qryViewVentasMastTIPO_AFILIADO.Value);

      if GlbFormatoConduce = 444 then
      begin
        qckFactServ8_5Agua:=TqckFactServ8_5Agua.Create(Nil);
        try
          if GlbEsCopia then
          qckFactServ8_5Agua.xtipoVenta := TipoVenta +' (Copia)'
          else qckFactServ8_5Agua.xtipoVenta := TipoVenta;
          qckFactServ8_5Agua.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;
          if (GlbImpReciboSinPreg = 1) then
             qckFactServ8_5Agua.Print
          else
          begin
            ProgressBar1.Visible:= False;
            frmImprimir:=TfrmImprimir.Create(Nil);
            try
              if frmImprimir.Showmodal = mrOk then
              begin
                if frmImprimir.RadioGroup1.ItemIndex = 0 then
                qckFactServ8_5Agua.Page.PaperSize := Letter;
                if frmImprimir.RadioButton1.Checked then
                begin
                  qckFactServ8_5Agua.PrinterSetup;
                  qckFactServ8_5Agua.Print;
                end else
                qckFactServ8_5Agua.Preview;
              end;
            finally
            frmImprimir.Free;
            frmImprimir:=Nil;
            end;
          end;

          if (GlbImpReciboSinPreg = 0) then
          if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
          begin
            qckFactServ8_5Agua.Preview;
          end;
          if GlbImpPDF then
          begin
            if not dmFactura.qryVentaFacturaNUMERO_FACTURA.IsNull then
                  ReportExportPDF(qckFactServ8_5Agua,GlbRutaRecibos+'\Recibos'+IntToStr(dmFactura.qryVentaFacturaNUMERO_FACTURA.Value)+'.pdf')
            else
            if not dmFactura.qryVentaFacturaNUMERO_DOC_PAGO.IsNull then
                  ReportExportPDF(qckFactServ8_5Agua,GlbRutaRecibos+'\Recibos'+IntToStr(dmFactura.qryVentaFacturaNUMERO_DOC_PAGO.AsInteger)+'.pdf')
          end;
        finally
        qckFactServ8_5Agua.Free;
        qckFactServ8_5Agua:=Nil;
        end;
      end;
    end else  //if (UpperCase(GLBFormatoFactura) = 'FORMAFACOCO') and (GLBNumConduceCte = 1)then
  if (UpperCase(GLBFormatoFactura) = 'FORMAFACOCO') and (EsConduce)then
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
    UImpresionVentas.ImprimirFacturaRepuestoConduce(dmreportes.qryViewVentasMast.Params[0].Value);
  end else
  //if (GlbRec55Pulg = 1) then  //salto aqui
  //begin
    if (UpperCase(GLBFormatoFactura) = 'FORMAFACOCO') then
    begin
      TipoVenta:='CONTADO';
      if dmReportes.qryViewVentasMastForma_pago.AsInteger in [7,8] then
      TipoVenta := 'CREDITO'
      else
      if dmReportes.qryViewVentasMastForma_pago.value = 1 then
      TipoVenta := 'CONTADO';

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
        
        frmConsultaFacturas.BitBtn1Click(Self);

        if dmfactura.qryFactReimpMaster.State = dsBrowse then
        UImpresionVentas.ImprimirFacturaRepuesto(dmfactura.qryFactReimpMaster.Params[0].Value)
        else
        UImpresionVentas.ImprimirFacturaRepuesto(dmreportes.qryViewVentasMast.Params[0].Value);
      finally
      frmConsultaFacturas.Free;
      frmConsultaFacturas:=Nil;
      end;
    end
    else
    if (UpperCase(GLBFormatoFactura) = 'CASANDRA2') then  //PENDIENTE DE ANALISIS
    begin
      TipoVenta:='CONTADO';
      if dmReportes.qryViewVentasMastForma_pago.AsInteger in [7,8] then
      TipoVenta := 'CREDITO'
      else
      if dmReportes.qryViewVentasMastForma_pago.value = 1 then
      TipoVenta := 'CONTADO';
    
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
            qckRepRecibo8_5_11REspReimp.Prepare;
            glbTPag := qckRepRecibo8_5_11REspReimp.PageNumber;

            if EsDevolucion then
            begin
              qckRepRecibo8_5_11REspReimp.xtipoVenta:= TipoVenta;
            end;
            qckRepRecibo8_5_11REspReimp.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;
            qckRepRecibo8_5_11REspReimp.qrtipoVenta.Caption:= '';

            dmDatos.qryImpresoras.Close;
            dmDatos.qryImpresoras.Open;
            if dmDatos.qryImpresoras.Locate('IDMODULO;IDREPORTE',
            VarArrayOf([1,5]),[]) then     //Factura/Recibo 8.5 x 5.5
            qckRepRecibo8_5_11REspReimp.PrinterSettings.PrinterIndex:=
            GetImpresora(dmDatos.qryImpresorasNOMBRE_IMPRESORA.Value);

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
    begin               //Verifica flujo de impresion electronica -ayaco
    if (UpperCase(GLBFormatoFactura) = 'FORMAEXPLODISMAR') then
      begin                       
        UImpresionVentas.ImprimeFacturaEXDMAR(0,TipoVenta,valorNCF,'Facturas');
      end else
    if ((GlBAyaco= 1) or (GlBTapiceria = 1) or (GlBInveraf =1)) and (GlbRec3Pulg = 0) then
    begin
      UImpresionVentas.ProcSetPathlogoTipoServicio(dmReportes.qryViewVentasMastTIPO_AFILIADO.Value);

      TipoVenta:='CONTADO';
      if dmReportes.qryViewVentasMastForma_pago.AsInteger in [7,8] then
      TipoVenta := 'CREDITO'
      else
      if dmReportes.qryViewVentasMastForma_pago.value = 1 then
      TipoVenta := 'CONTADO';

      if (TipoVenta = 'CONTADO') then
      AbrirDatosParaTicket(false,false,dmReportes.qryViewVentasMastCODIGO_CTE.AsString,
      dmReportes.qryViewVentasMastNUMERO_DOC_PAGO.AsInteger,
      dmReportes.qryViewVentasMastFECHA.Value)
      else
      if (TipoVenta = 'CREDITO') then
      AbrirDatosParaTicket(false,true,dmReportes.qryViewVentasMastCODIGO_CTE.AsString,
      dmReportes.qryViewVentasMastNUMERO_FACTURA.AsInteger,
      dmReportes.qryViewVentasMastFECHA.Value);

      if (dmreportes.qryViewVentasMastFORMA_PAGO.Value = 7) or (GlbSizeFact8x11 = 1) then
      begin
        qckFactServ8_5Ayaco:=TqckFactServ8_5Ayaco.Create(Nil);
        try
          if dmReportes.qryViewVentasMastMONTO_EXONERADO_ITBIS.Value > 0 then
          begin
            qckFactServ8_5Ayaco.QRLabel25.Caption :='ITBIS Exonerado';
          end  else
          qckFactServ8_5Ayaco.QRLabel25.Caption :='ITBIS';

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
          if GlbImpPDF then
          if not dmFactura.qryVentaFacturaNUMERO_FACTURA.IsNull then
          ReportExportPDF(qckFactServ8_5Ayaco,GlbRutaFacturas+'\Facturas'+IntToStr(dmFactura.qryVentaFacturaNUMERO_FACTURA.Value)+'.pdf');
          finally
          qckFactServ8_5Ayaco.Free;
          qckFactServ8_5Ayaco:=Nil;
          end;
      end else
      begin
      if (GlbImprimeTicketCustom = 1) then
      begin
        //TTicketCustomSize.PrintTicketReimpSurtidoraESCPos(const APrinterName, ATipoVenta, AValorNCF,
        //ANombreCteGenerico, AStrCopia: string): Boolean;
        dmDatos.qryImpresoras.Close;
    		dmDatos.qryImpresoras.Open;
  	  	if dmDatos.qryImpresoras.Locate('IDMODULO;IDREPORTE', VarArrayOf([1, 6]), []) then
        begin
          if dmReportes.qryViewVentasMastCodigo_cte.Value > 0 then
  		    begin
    		    //qckRepReciboReimpTicketSurtidoraNew.qrLabelRNC.Caption := 'RNC-' + qryClienteRNC_NUMERO.Value;
      		  _nombreGenerico:=qryClienteNOMBRE_CTE.Value;
    	  	end;
      		//else
     		  //qckRepReciboReimpTicketSurtidoraNew.qrLabelRNC.Caption := '';

        if not TTicketCustomSize.PrintTicketReimpSurtidoraESCPos(dmDatos.qryImpresorasNOMBRE_IMPRESORA.Value, TipoVenta, valorNCF,
        _nombreGenerico, rxspinImpCantCopias.Text) then
        MessageDlg('No fue posible imprimir el ticket, verifique.',mtWarning,[mbok],0);
      end else
      begin
        MessageDlg('Debes configurar el nombre de la impresora punto de venta.',mtError,[mbok],0);
      end;
    end else
    begin
      qckRepReciboReimpTicketSurtidoraNew:=tqckRepReciboReimpTicketSurtidoraNew.Create(Nil);
      try
        if (GlbImpQREncuesta = 0) then
        qckRepReciboReimpTicketSurtidoraNew.Height:=761;

        if (dmFactura.qryVentaFacturaFORMA_PAGO.Value = 6) then
        begin
          dmreportes.qryNCFAfectado.Close;
          dmreportes.qryNCFAfectado.Params[0].Value:= dmFactura.qryVentaFacturaSERIE_NCF_ASIGNADO.Value;
          dmreportes.qryNCFAfectado.Open;
          dmreportes.qryNCFAfectado.First;
          if Not dmreportes.qryNCFAfectadoNUMERO_NCF.IsNull then
          qckRepReciboReimpTicketSurtidoraNew.qrLablNCFAfectado.Caption:='NCF modificado:'+
          dmreportes.qryNCFAfectadoNUMERO_NCF.Value;
          qckRepReciboReimpTicketSurtidoraNew.qrLablNCFAfectado.Enabled:=True;
          qckRepReciboReimpTicketSurtidoraNew.ColumnHeaderBand1.Height:=88;
        end else
        begin
          qckRepReciboReimpTicketSurtidoraNew.qrLablNCFAfectado.Enabled:=False;
          qckRepReciboReimpTicketSurtidoraNew.ColumnHeaderBand1.Height:=66;
        end;
        if GlbImpQREncuesta = 0 then
        begin
          qckRepReciboReimpTicketSurtidoraNew.Page.Length:=6.156; //sin encuesta
          qckRepReciboReimpTicketSurtidoraNew.ChildBand14.Height:=0;
        end;
        qckRepReciboReimpTicketSurtidoraNew.SetParameterValues;
        if rxspinImpCantCopias.Decimal > 0 then
        qckRepReciboReimpTicketSurtidoraNew.PrinterSettings.Copies:= StrToInt(rxspinImpCantCopias.Text);
        qckRepReciboReimpTicketSurtidoraNew.strcopia :='';
        if GlbImpCodProducto = 0 then
        begin
          qckRepReciboReimpTicketSurtidoraNew.QRSubDetail1.Height := 20;
        end;
        if Length(edtObservacion.Text) > 0 then
        qckRepReciboReimpTicketSurtidoraNew.nombreCteGenerico:=edtObservacion.Text;
        if (dmReportes.qryViewVentasMastcodigo_cte.value > 0) then
        begin
          qckRepReciboReimpTicketSurtidoraNew.qrLabelRNC.Caption:='RNC-' + qryClienteRNC_NUMERO.Value;
          qckRepReciboReimpTicketSurtidoraNew.nombreCteGenerico:= qryClienteNOMBRE_CTE.Value;
        end
        else
        qckRepReciboReimpTicketSurtidoraNew.qrLabelRNC.Caption:='';
        qckRepReciboReimpTicketSurtidoraNew.xtipoVenta := TipoVenta;
        qckRepReciboReimpTicketSurtidoraNew.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;
        pulgadaInc:=0.86;
        dmFactura.qryVentaFacturaDet.Last;

        if dmFactura.qryVentaFacturaDet.RecordCount = 1 then
        begin
          if dmFactura.qryVentaFacturaDet.RecordCount = 1 then
          qckRepReciboReimpTicketSurtidoraNew.Page.Length:= qckRepReciboReimpTicketSurtidoraNew.Page.Length + 0.75
          else
          qckRepReciboReimpTicketSurtidoraNew.Page.Length:= qckRepReciboReimpTicketSurtidoraNew.Page.Length +
          (dmFactura.qryVentaFacturaDet.RecordCount - 1 ) * 0.50
        end
        else if dmFactura.qryVentaFacturaDet.RecordCount >= 2 then
            qckRepReciboReimpTicketSurtidoraNew.Page.Length:= qckRepReciboReimpTicketSurtidoraNew.Page.Length +
            (dmFactura.qryVentaFacturaDet.RecordCount - 2 ) * 0.50;

            flag:=true;
            qckRepReciboReimpTicketSurtidoraNew.Prepare;
            rxventa.DisableControls;
            rxdbgrid1.Enabled:=False;

            rxventa.EnableControls;
            rxdbgrid1.Enabled:=True;
            rxdbgrid1.EnableScroll;
            dmreportes.qryViewVentasMast.Close;
            dmreportes.qryViewVentasMast.Params[0].Value:= dmFactura.qryVentaFacturaNUMERO.Value;
            dmreportes.qryViewVentasMast.Open;
            UImpresionVentas.ProcSetPathlogoTipoServicio(dmReportes.qryViewVentasMastTIPO_AFILIADO.Value);

            RxDBGrid1.DataSource:= datasource1;
            dbtext1.DataField:='Descripcion';
            dbtext1.DataSource:= datasource1;
            dbedit1.DataSource:= datasource1;
            dbedit1.DataField:='Cant';
            dbedit2.DataSource:= datasource1;
            dbedit2.DataField:='Precio';
            dbedit3.DataSource:= datasource1;
            dbedit3.DataField:='MontoBruto';

            RxDBGrid1.Visible:=True;

            DmFactura.qryVentaFacturaDet.Last;
            //cRc := dmFactura.qryVentaFacturaDet.RecordCount;
            dmFactura.qryVentaFacturaDet.First;
            //cRc:=0;
            if (glbQckUnaPagina = 1) then
            begin
              if (qckRepReciboReimpTicketSurtidoraNew.PageNumber >= 3) then
              qckRepReciboReimpTicketSurtidoraNew.Page.Length:=26;

              if ((dmFactura.qryVentaFacturaDet.RecordCount >= 1) and
                 ((dmFactura.qryVentaFacturaDet.RecordCount < 10)
                 or (qckRepReciboReimpTicketSurtidoraNew.PageNumber = 2))) then
              begin
                ProgressBar1.Visible :=True;
                ProgressBar1.Position:=0;
                ProgressBar1.Max:=dmFactura.qryVentaFacturaDet.RecordCount;

                repeat
                begin
                  ProgressBar1.StepIt;
                  //cRc:=cRc + 1;
                  if (qckRepReciboReimpTicketSurtidoraNew.PageNumber > 1) then
                  begin
                    if dmFactura.qryVentaFacturaDet.RecordCount = 1 then
                    qckRepReciboReimpTicketSurtidoraNew.Page.Length:= qckRepReciboReimpTicketSurtidoraNew.Page.Length + 0.75
                    else
                    qckRepReciboReimpTicketSurtidoraNew.Page.Length:=qckRepReciboReimpTicketSurtidoraNew.Page.Length +
                    (dmFactura.qryVentaFacturaDet.RecordCount - 1 ) * 0.50;

                    qckRepReciboReimpTicketSurtidoraNew.Prepare;
                    flag:=False;
                  end else break;
                  if (qckRepReciboReimpTicketSurtidoraNew.PageNumber = 1) then
                  break;
                end;
                until flag = true;
              end;
          end;//if (glbQckUnaPagina = 1) then
          ProgressBar1.Visible:=False;
          dmFactura.qryVentaFacturaDet.Last;
          if (dmFactura.qryVentaFacturaDet.RecordCount >15) and (GlbImpFormatoPDF = 1) then
          begin
            ImprimirEnFormatoPDF(1,6);
          end else
          begin
            dmDatos.qryImpresoras.Close;
            dmDatos.qryImpresoras.Open;
            if dmDatos.qryImpresoras.Locate('IDMODULO;IDREPORTE',
            VarArrayOf([1,6]),[]) then     //Factura/Recibo Punto Venta
            qckRepReciboReimpTicketSurtidoraNew.PrinterSettings.PrinterIndex:=
            GetImpresora(dmDatos.qryImpresorasNOMBRE_IMPRESORA.Value);

            if (GlbImpReciboSinPreg = 1) and (GlbImprimeReciboFact = 1) then
            qckRepReciboReimpTicketSurtidoraNew.Print
            else
            if MessageDlg('Imprimir?',mtInformation, [mbYes, mbNo], 0)=mryes then
            begin
              if (GlbImprimeReciboFact = 1) then
              begin
                qckRepReciboReimpTicketSurtidoraNew.PrinterSetup;
                qckRepReciboReimpTicketSurtidoraNew.Print;
              end;
            end else
            qckRepReciboReimpTicketSurtidoraNew.Preview;
            reciboImpreso:=True;
          end;
      if GlbImpTicketVtaAgua = 1 then
      ImprimirTicketVtaAgua(ipStpInsertVentMast.Params[0].Value);
      finally
      qckRepReciboReimpTicketSurtidoraNew.Free;
      qckRepReciboReimpTicketSurtidoraNew:=Nil;
      end;
      end;
      end
      end else
      if (GLBECOM = 1) then   //Elias comunicaciones Santiago
      begin
        if (GlbFormatoConduce = 333) then //ECom
        begin
          qckRepConduceECom:=TqckRepConduceECom.Create(Nil);
          try
            qckRepConduceECom.Preview;
          finally
          qckRepConduceECom.free;
          qckRepConduceECom:=nil;
          end;
        end;
        QckFactServ_8_5ECom:=TQckFactServ_8_5ECom.Create(Nil);
        try
          QckFactServ_8_5ECom.rxVendedor.Close;
          QckFactServ_8_5ECom.rxVendedor.Open;
          if dmreportes.qryCantVendedoresSamCANTVENDEDORES.Value = 1 then
          begin
            if qryEmpleado.Locate('codigo', dmreportes.qryViewVentasDetCodigo_Vendedor.Value,[]) then
            begin
              QckFactServ_8_5ECom.rxVendedor.Append;
              QckFactServ_8_5ECom.rxVendedorNombreVendedor.Value:=
              qryEmpleadoNOMBREVENDEDOR.Value;
              QckFactServ_8_5ECom.rxVendedor.Post;
            end;
          end else
          begin
            QckFactServ_8_5ECom.rxVendedor.Close;
            QckFactServ_8_5ECom.rxVendedor.Open;
            QckFactServ_8_5ECom.rxVendedor.Append;
            QckFactServ_8_5ECom.rxVendedorNombreVendedor.Value:='';
            QckFactServ_8_5ECom.rxVendedor.Post;
          end;
          QckFactServ_8_5ECom.TPag.Caption:=
          IntToStr(QckFactServ_8_5ECom.PageNumber);
          QckFactServ_8_5ECom.xtipoVenta := TipoVenta;
          QckFactServ_8_5ECom.valorNCF:= valorNCF;
          if dmReportes.qryViewVentasMastMONTO_EXONERADO_ITBIS.Value > 0 then
            begin
              //qckFactServ8_5Ayaco.QRLabel25.left:=505;
              QckFactServ_8_5ECom.QRLabel25.Caption :='ITBIS Exonerado';
            end  else
            QckFactServ_8_5ECom.QRLabel25.Caption :='ITBIS';

            if (GlbImpReciboSinPreg = 1) then
              QckFactServ_8_5ECom.Print
              else
            if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
            begin
              //QckFactServ_8_5ECom.QRImage2.Enabled:= False;
              QckFactServ_8_5ECom.PrinterSetup;
              QckFactServ_8_5ECom.Print;
            end else
            QckFactServ_8_5ECom.Preview;

            if (GlbImpReciboSinPreg = 0) then
            if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
            begin
              QckFactServ_8_5ECom.Preview;
            end;

            if GlbImpPDF then
            begin
              if not dmReportes.qryViewVentasMastNUMERO_FACTURA.IsNull then
              ReportExportPDF(QckFactServ_8_5ECom,GlbRutaRecibos+'\Recibos'+IntToStr(dmReportes.qryViewVentasMastNUMERO_FACTURA.Value)+'.pdf')
              else
              ReportExportPDF(QckFactServ_8_5ECom,GlbRutaRecibos+'\Recibos'+IntToStr(dmReportes.qryViewVentasMastNUMERO_DOC_PAGO.AsInteger)+'.pdf')
            end;
          finally
          QckFactServ_8_5ECom.Free;
          QckFactServ_8_5ECom:=Nil;
          end;
      end else
      if (GLBMutur = 1) or (GLBMTEGroup = 1) then
      begin
        qckFactServ_8_5SAMNewMuturs:=TqckFactServ_8_5SAMNewMuturs.Create(Nil);
          try
            qckFactServ_8_5SAMNewMuturs.rxVendedor.Close;
            qckFactServ_8_5SAMNewMuturs.rxVendedor.Open;
            if dmreportes.qryCantVendedoresSamCANTVENDEDORES.Value = 1 then
            begin
              if qryEmpleado.Locate('codigo', dmreportes.qryViewVentasDetCodigo_Vendedor.Value,[]) then
              begin
                qckFactServ_8_5SAMNewMuturs.rxVendedor.Append;
                qckFactServ_8_5SAMNewMuturs.rxVendedorNombreVendedor.Value:=
                qryEmpleadoNOMBREVENDEDOR.Value;
                qckFactServ_8_5SAMNewMuturs.rxVendedor.Post;
              end;
            end else
            begin
              qckFactServ_8_5SAMNewMuturs.rxVendedor.Close;
              qckFactServ_8_5SAMNewMuturs.rxVendedor.Open;
              qckFactServ_8_5SAMNewMuturs.rxVendedor.Append;
              qckFactServ_8_5SAMNewMuturs.rxVendedorNombreVendedor.Value:='';
              qckFactServ_8_5SAMNewMuturs.rxVendedor.Post;
              end;
              qckFactServ_8_5SAMNewMuturs.TPag.Caption:=
              IntToStr(qckFactServ_8_5SAMNewMuturs.PageNumber);
              qckFactServ_8_5SAMNewMuturs.xtipoVenta := TipoVenta;
              qckFactServ_8_5SAMNewMuturs.valorNCF:= valorNCF;
              if dmReportes.qryViewVentasMastMONTO_EXONERADO_ITBIS.Value > 0 then
              begin
                qckFactServ_8_5SAMNewMuturs.QRLabel25.Caption :='ITBIS Exonerado';
              end  else
              qckFactServ_8_5SAMNewMuturs.QRLabel25.Caption :='ITBIS';

              if (GlbImpReciboSinPreg = 1) then
              qckFactServ_8_5SAMNewMuturs.Print
              else
              if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
              begin
                //qckFactServ_8_5SAMNewMuturs.QRImage2.Enabled:= False;
                qckFactServ_8_5SAMNewMuturs.PrinterSetup;
                qckFactServ_8_5SAMNewMuturs.Print;
              end else
              qckFactServ_8_5SAMNewMuturs.Preview;

              if (GlbImpReciboSinPreg = 0) then
              if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
              begin
                qckFactServ_8_5SAMNewMuturs.Preview;
              end;
             if GlbImpPDF then
             begin
               if not dmReportes.qryViewVentasMastNUMERO_FACTURA.IsNull then
               ReportExportPDF(qckFactServ_8_5SAMNewMuturs,GlbRutaRecibos+'\Recibos'+IntToStr(dmReportes.qryViewVentasMastNUMERO_FACTURA.Value)+'.pdf')
               else
               ReportExportPDF(qckFactServ_8_5SAMNewMuturs,GlbRutaRecibos+'\Recibos'+IntToStr(dmReportes.qryViewVentasMastNUMERO_DOC_PAGO.AsInteger)+'.pdf')
             end;
          finally
          qckFactServ_8_5SAMNewMuturs.Free;
          qckFactServ_8_5SAMNewMuturs:=Nil;
          end;
      end else
      if (GLBSAM = 1) then
      begin
        if (GlbUsaFctMexico = 1) then
        begin
          qckFactServ_8_5SAMNewM:=TqckFactServ_8_5SAMNewM.Create(Nil);
          try
            qckFactServ_8_5SAMNewM.rxVendedor.Close;
            qckFactServ_8_5SAMNewM.rxVendedor.Open;
            if dmreportes.qryCantVendedoresSamCANTVENDEDORES.Value = 1 then
            begin
              if qryEmpleado.Locate('codigo', dmreportes.qryViewVentasDetCodigo_Vendedor.Value,[]) then
              begin
                qckFactServ_8_5SAMNewM.rxVendedor.Append;
                qckFactServ_8_5SAMNewM.rxVendedorNombreVendedor.Value:=
                qryEmpleadoNOMBREVENDEDOR.Value;
                qckFactServ_8_5SAMNewM.rxVendedor.Post;
              end;
            end else
            begin
              qckFactServ_8_5SAMNewM.rxVendedor.Close;
              qckFactServ_8_5SAMNewM.rxVendedor.Open;
              qckFactServ_8_5SAMNewM.rxVendedor.Append;
              qckFactServ_8_5SAMNewM.rxVendedorNombreVendedor.Value:='';
              qckFactServ_8_5SAMNewM.rxVendedor.Post;
              end;
              qckFactServ_8_5SAMNewM.TPag.Caption:=
              IntToStr(qckFactServ_8_5SAMNewM.PageNumber);
              qckFactServ_8_5SAMNewM.xtipoVenta := TipoVenta;
              qckFactServ_8_5SAMNewM.valorNCF:= valorNCF;
              if dmReportes.qryViewVentasMastMONTO_EXONERADO_ITBIS.Value > 0 then
              begin
                qckFactServ_8_5SAMNewM.QRLabel25.Caption :='ITBIS Exonerado';
              end  else
              qckFactServ_8_5SAMNewM.QRLabel25.Caption :='ITBIS';

              if (GlbImpReciboSinPreg = 1) then
              qckFactServ_8_5SAMNewM.Print
              else
              if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
              begin
                //qckFactServ_8_5SAMNewM.QRImage2.Enabled:= False;
                qckFactServ_8_5SAMNewM.PrinterSetup;
                qckFactServ_8_5SAMNewM.Print;
              end else
              qckFactServ_8_5SAMNewM.Preview;

              if (GlbImpReciboSinPreg = 0) then
              if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
              begin
                qckFactServ_8_5SAMNewM.Preview;
              end;
             if GlbImpPDF then
             begin
               if not dmReportes.qryViewVentasMastNUMERO_FACTURA.IsNull then
               ReportExportPDF(qckFactServ_8_5SAMNewM,GlbRutaRecibos+'\Recibos'+IntToStr(dmReportes.qryViewVentasMastNUMERO_FACTURA.Value)+'.pdf')
               else
               ReportExportPDF(qckFactServ_8_5SAMNewM,GlbRutaRecibos+'\Recibos'+IntToStr(dmReportes.qryViewVentasMastNUMERO_DOC_PAGO.AsInteger)+'.pdf')
             end;
          finally
          qckFactServ_8_5SAMNewM.Free;
          qckFactServ_8_5SAMNewM:=Nil;
          end;
        end else
        if (GLBFORMATOFACTPREIMP = 0) then
        begin
          qckFactServ_8_5SAM:=TqckFactServ_8_5SAM.Create(Nil);
          try
            qckFactServ_8_5SAM.rxVendedor.Close;
            qckFactServ_8_5SAM.rxVendedor.Open;
            if dmreportes.qryCantVendedoresSamCANTVENDEDORES.Value = 1 then
            begin
              if qryEmpleado.Locate('codigo', dmreportes.qryViewVentasDetCodigo_Vendedor.Value,[]) then
              begin
                qckFactServ_8_5SAM.rxVendedor.Append;
                qckFactServ_8_5SAM.rxVendedorNombreVendedor.Value:=
                qryEmpleadoNOMBREVENDEDOR.Value;
                qckFactServ_8_5SAM.rxVendedor.Post;
              end;
            end else
            begin
              qckFactServ_8_5SAM.rxVendedor.Close;
              qckFactServ_8_5SAM.rxVendedor.Open;
              qckFactServ_8_5SAM.rxVendedor.Append;
              qckFactServ_8_5SAM.rxVendedorNombreVendedor.Value:='';
              qckFactServ_8_5SAM.rxVendedor.Post;
            end;
            qckFactServ_8_5SAM.TPag.Caption:=
            IntToStr(qckFactServ_8_5SAM.PageNumber);
            qckFactServ_8_5SAM.xtipoVenta := TipoVenta;
            qckFactServ_8_5SAM.valorNCF:= valorNCF;
            if dmReportes.qryViewVentasMastMONTO_EXONERADO_ITBIS.Value > 0 then
            begin
              //qckFactServ8_5Ayaco.QRLabel25.left:=505;
              qckFactServ_8_5SAM.QRLabel25.Caption :='ITBIS Exonerado';
            end  else
            qckFactServ_8_5SAM.QRLabel25.Caption :='ITBIS';

            if (GlbImpReciboSinPreg = 1) then
              qckFactServ_8_5SAM.Print
              else
            if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
            begin
              qckFactServ_8_5SAM.QRImage2.Enabled:= False;
              qckFactServ_8_5SAM.PrinterSetup;
              qckFactServ_8_5SAM.Print;
            end else
            qckFactServ_8_5SAM.Preview;

            if (GlbImpReciboSinPreg = 0) then
            if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
            begin
              qckFactServ_8_5SAM.Preview;
            end;

            if GlbImpPDF then
            begin
              if not dmReportes.qryViewVentasMastNUMERO_FACTURA.IsNull then
              ReportExportPDF(qckFactServ_8_5SAM,GlbRutaRecibos+'\Recibos'+IntToStr(dmReportes.qryViewVentasMastNUMERO_FACTURA.Value)+'.pdf')
              else
              ReportExportPDF(qckFactServ_8_5SAM,GlbRutaRecibos+'\Recibos'+IntToStr(dmReportes.qryViewVentasMastNUMERO_DOC_PAGO.AsInteger)+'.pdf')
            end;
          finally
          qckFactServ_8_5SAM.Free;
          qckFactServ_8_5SAM:=Nil;
          end;
        end else  //Nuevo Formato
        begin
          qckFactServ_8_5SAMNew:=TqckFactServ_8_5SAMNew.Create(Nil);
          try
            qckFactServ_8_5SAMNew.rxVendedor.Close;
            qckFactServ_8_5SAMNew.rxVendedor.Open;
            if dmreportes.qryCantVendedoresSamCANTVENDEDORES.Value = 1 then
            begin
              if qryEmpleado.Locate('codigo', dmreportes.qryViewVentasDetCodigo_Vendedor.Value,[]) then
              begin
                qckFactServ_8_5SAMNew.rxVendedor.Append;
                qckFactServ_8_5SAMNew.rxVendedorNombreVendedor.Value:=
                qryEmpleadoNOMBREVENDEDOR.Value;
                qckFactServ_8_5SAMNew.rxVendedor.Post;
              end;
            end else
            begin
              qckFactServ_8_5SAMNew.rxVendedor.Close;
              qckFactServ_8_5SAMNew.rxVendedor.Open;
              qckFactServ_8_5SAMNew.rxVendedor.Append;
              qckFactServ_8_5SAMNew.rxVendedorNombreVendedor.Value:='';
              qckFactServ_8_5SAMNew.rxVendedor.Post;
              end;
              qckFactServ_8_5SAMNew.TPag.Caption:=
              IntToStr(qckFactServ_8_5SAMNew.PageNumber);
              qckFactServ_8_5SAMNew.xtipoVenta := TipoVenta;
              qckFactServ_8_5SAMNew.valorNCF:= valorNCF;
              if dmReportes.qryViewVentasMastMONTO_EXONERADO_ITBIS.Value > 0 then
              begin
                qckFactServ_8_5SAMNew.QRLabel25.Caption :='ITBIS Exonerado';
              end  else
              qckFactServ_8_5SAMNew.QRLabel25.Caption :='ITBIS';

              if (GlbImpReciboSinPreg = 1) then
              qckFactServ_8_5SAMNew.Print
              else
              if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
              begin
                qckFactServ_8_5SAMNew.QRImage2.Enabled:= False;
                qckFactServ_8_5SAMNew.PrinterSetup;
                qckFactServ_8_5SAMNew.Print;
              end else
              qckFactServ_8_5SAMNew.Preview;

              if (GlbImpReciboSinPreg = 0) then
              if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
              begin
                qckFactServ_8_5SAMNew.Preview;
              end;
             if GlbImpPDF then
             begin
               if not dmReportes.qryViewVentasMastNUMERO_FACTURA.IsNull then
               ReportExportPDF(qckFactServ_8_5SAMNew,GlbRutaRecibos+'\Recibos'+IntToStr(dmReportes.qryViewVentasMastNUMERO_FACTURA.Value)+'.pdf')
               else
               ReportExportPDF(qckFactServ_8_5SAMNew,GlbRutaRecibos+'\Recibos'+IntToStr(dmReportes.qryViewVentasMastNUMERO_DOC_PAGO.AsInteger)+'.pdf')
             end;
          finally
          qckFactServ_8_5SAMNew.Free;
          qckFactServ_8_5SAMNew:=Nil;
          end;
        end;
      end else
      if (GlBBurgos = 1) then
      begin
        qckFactServ8_5BB:=TqckFactServ8_5BB.Create(Nil);
        try
          //qckFactServ8_5BB.TPag.Caption:=
          //IntToStr(qckFactServ8_5BB.PageNumber);
          qckFactServ8_5BB.xtipoVenta:= TipoVenta;
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
    if (GlbFarmacia = 1 ) then
    begin
      dmFactura.qryDatosVtaARS.Close;
      dmFactura.qryDatosVtaARS.Params[0].Value := dmReportes.qryViewVentasMastNUMERO.Value;
      dmFactura.qryDatosVtaARS.Open;
      dmFactura.qryDatosVtaARS.First;

      TipoVenta:='CONTADO';
      if dmReportes.qryViewVentasMastForma_pago.AsInteger in [7,8] then
      TipoVenta := 'CREDITO'
      else
      if dmReportes.qryViewVentasMastForma_pago.value = 1 then
      TipoVenta := 'CONTADO';

      if (TipoVenta = 'CONTADO') then
      AbrirDatosParaTicket(false,false,dmReportes.qryViewVentasMastCODIGO_CTE.AsString,
      dmReportes.qryViewVentasMastNUMERO_DOC_PAGO.AsInteger,
      dmReportes.qryViewVentasMastFECHA.Value)
      else
      if (TipoVenta = 'CREDITO') then
      AbrirDatosParaTicket(false,true,dmReportes.qryViewVentasMastCODIGO_CTE.AsString,
      dmReportes.qryViewVentasMastNUMERO_FACTURA.AsInteger,
      dmReportes.qryViewVentasMastFECHA.Value);

      if (GlbFact55Pulg = 1) and ((dmFactura.qryDatosVtaARSMONTO_COBERTURA.Value = 0) or
                                  (dmFactura.qryDatosVtaARSMONTO_COBERTURA.IsNull)) then
      begin
        TipoVenta:='CONTADO';
        if dmReportes.qryViewVentasMastForma_pago.AsInteger in [7,8] then
           TipoVenta := 'CREDITO'
        else
        if dmReportes.qryViewVentasMastForma_pago.value = 1 then
           TipoVenta := 'CONTADO';
           ImprimeFactura8_5Farmacia(dmReportes.qryViewVentasMastNumero.Value,TipoVenta,'','Recibos');
      end else
      begin
        qckRepReciboReimpTicketFarmaciaARS:=TqckRepReciboReimpTicketFarmaciaARS.Create(Nil);
        try
         if dmDatos.qryImpresoras.state =dsInactive then dmDatos.qryImpresoras.Open;

         if dmDatos.qryImpresoras.Locate('IDMODULO;IDREPORTE',
         VarArrayOf([1,6]),[]) then     //Factura/Recibo Punto Venta
         qckRepReciboReimpTicketFarmaciaARS.PrinterSettings.PrinterIndex:=
         GetImpresora(dmDatos.qryImpresorasNOMBRE_IMPRESORA.Value);

         if rxspinImpCantCopias.Decimal > 0 then
          qckRepReciboReimpTicketFarmaciaARS.PrinterSettings.Copies:= StrToInt(rxspinImpCantCopias.Text);

          if (dmFactura.qryDatosVtaARS.RecordCount = 0) then
          begin
            qckRepReciboReimpTicketFarmaciaARS.ChildBand10.Height:=0;
            qckRepReciboReimpTicketFarmaciaARS.ChildBand1.Height :=40;
            qckRepReciboReimpTicketFarmaciaARS.Page.Length:=
            qckRepReciboReimpTicketFarmaciaARS.Page.Length - 5;
          end else
          begin
            qckRepReciboReimpTicketFarmaciaARS.ChildBand1.Height:=95;
          end;

          if dmFactura.qryVtaConDeliveryTrn.RecordCount = 0 then
          begin
            qckRepReciboReimpTicketFarmaciaARS.ChildBand13.Height:=0;
            qckRepReciboReimpTicketFarmaciaARS.Page.Length:=
            qckRepReciboReimpTicketFarmaciaARS.Page.Length - 1.45;
          end;

          qckRepReciboReimpTicketFarmaciaARS.strcopia :='';
          qckRepReciboReimpTicketFarmaciaARS.SetParameterValues;

          qckRepReciboReimpTicketFarmaciaARS.ncfDesc := GlbDescNCF;
          if Length(edtObservacion.Text) > 0 then
             qckRepReciboReimpTicketFarmaciaARS.nombreCteGenerico:=edtObservacion.Text;
          if (dmReportes.qryViewVentasMastCodigo_cte.value > 0) then
          begin
            qckRepReciboReimpTicketFarmaciaARS.qrLabelRNC.Caption:='RNC-' + qryClienteRNC_NUMERO.Value;
            qckRepReciboReimpTicketFarmaciaARS.nombreCteGenerico:= qryClienteNOMBRE_CTE.Value;
          end
          else
          qckRepReciboReimpTicketFarmaciaARS.qrLabelRNC.Caption:='';
          qckRepReciboReimpTicketFarmaciaARS.xtipoVenta := TipoVenta;
          qckRepReciboReimpTicketFarmaciaARS.valorNCF   := valorNCF;
          //pulgadaInc:=0.86;
          dmFactura.qryVentaFacturaDet.Last;

          if (dmFactura.qryVentaFacturaDet.RecordCount = 1) and
          (qckRepReciboReimpTicketFarmaciaARS.Page.Length < 6.65)  then
           qckRepReciboReimpTicketFarmaciaARS.Page.Length:=5.759
          else
          if dmFactura.qryVentaFacturaDet.RecordCount >= 2 then
             qckRepReciboReimpTicketFarmaciaARS.Page.Length:= qckRepReciboReimpTicketFarmaciaARS.Page.Length +
            (dmFactura.qryVentaFacturaDet.RecordCount - 1 ) * 0.25;

        flag:=true;
        qckRepReciboReimpTicketFarmaciaARS.Prepare;
        dmFactura.qryVentaFacturaDet.Last;
        if (glbQckUnaPagina = 1) then
        begin
          if ((dmFactura.qryVentaFacturaDet.RecordCount >= 1) And
           ((dmFactura.qryVentaFacturaDet.RecordCount < 10)
            or (qckRepReciboReimpTicketFarmaciaARS.PageNumber = 2))) then
          begin
            ProgressBar1.Visible:=true;
            ProgressBar1.Position:=0;
            ProgressBar1.Max:=dmFactura.qryVentaFacturaDet.RecordCount;
            repeat
            begin
            ProgressBar1.StepIt;
            //cRc:=cRc + 1;
            if (qckRepReciboReimpTicketFarmaciaARS.PageNumber > 1) then
            begin
              qckRepReciboReimpTicketFarmaciaARS.Page.Length:=qckRepReciboReimpTicketFarmaciaARS.Page.Length + 0.50;

              qckRepReciboReimpTicketFarmaciaARS.Prepare;
              flag:=False;
            end else
            if (qckRepReciboReimpTicketFarmaciaARS.PageNumber = 1) then
            break;
            if (qckRepReciboReimpTicketFarmaciaARS.PageNumber = 1) then
            break;
            end;
            until flag = true;
          end;
        end;//glQckUnaPagina
        ProgressBar1.Visible:=False;
        dmFactura.qryVentaFacturaDet.First;
        if (GlbImpReciboSinPreg = 1) and (GlbImprimeReciboFact = 1) then
        qckRepReciboReimpTicketFarmaciaARS.Print
        else
        if MessageDlg('Imprimir?',mtInformation, [mbYes, mbNo], 0)=mryes then
        begin
          if (GlbImprimeReciboFact = 1) then
          begin
            qckRepReciboReimpTicketFarmaciaARS.PrinterSetup;
            qckRepReciboReimpTicketFarmaciaARS.Print;
          end;
        end else
        qckRepReciboReimpTicketFarmaciaARS.Preview;
        reciboImpreso:=True;
      finally
      qckRepReciboReimpTicketFarmaciaARS.Free;
      qckRepReciboReimpTicketFarmaciaARS:=Nil;
      end;
      end;
    end else
    if (GlbFarmacia = 1 ) then
    begin
      dmFactura.qryDatosVtaARS.Close;
      dmFactura.qryDatosVtaARS.Params[0].Value := dmReportes.qryViewVentasMastNUMERO.Value;
      dmFactura.qryDatosVtaARS.Open;
      dmFactura.qryDatosVtaARS.First;

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
      qckRepReciboReimpTicketFarmaciaARS:=TqckRepReciboReimpTicketFarmaciaARS.Create(Nil);
      try
        dmDatos.qryImpresoras.Close;
        dmDatos.qryImpresoras.Open;
        if dmDatos.qryImpresoras.Locate('IDMODULO;IDREPORTE',
        VarArrayOf([1,6]),[]) then     //Factura/Recibo Punto Venta
        qckRepReciboReimpTicketFarmaciaARS.PrinterSettings.PrinterIndex:=
        GetImpresora(dmDatos.qryImpresorasNOMBRE_IMPRESORA.Value);

        if (dmFactura.qryDatosVtaARS.RecordCount = 0) then
        begin
          qckRepReciboReimpTicketFarmaciaARS.ChildBand10.Height:=0;
          qckRepReciboReimpTicketFarmaciaARS.ChildBand1.Height :=40;
          qckRepReciboReimpTicketFarmaciaARS.Page.Length:=
          qckRepReciboReimpTicketFarmaciaARS.Page.Length - 5;
        end else
        begin
          qckRepReciboReimpTicketFarmaciaARS.ChildBand1.Height:=95;
        end;

        if dmFactura.qryVtaConDeliveryTrn.RecordCount = 0 then
        begin
          qckRepReciboReimpTicketFarmaciaARS.ChildBand13.Height:=0;
          qckRepReciboReimpTicketFarmaciaARS.Page.Length:=
          qckRepReciboReimpTicketFarmaciaARS.Page.Length - 3.45;
        end;
        qckRepReciboReimpTicketFarmaciaARS.strcopia :='';

        qckRepReciboReimpTicketFarmaciaARS.ncfDesc := GlbDescNCF;
        if Length(edtObservacion.Text) > 0 then
        qckRepReciboReimpTicketFarmaciaARS.nombreCteGenerico:=edtObservacion.Text;
        if (dmReportes.qryViewVentasMastCodigo_cte.value > 0) then
        begin
          qckRepReciboReimpTicketFarmaciaARS.qrLabelRNC.Caption:='RNC-' + qryClienteRNC_NUMERO.Value;
          qckRepReciboReimpTicketFarmaciaARS.nombreCteGenerico:= qryClienteNOMBRE_CTE.Value;
        end
        else qckRepReciboReimpTicketFarmaciaARS.qrLabelRNC.Caption:='';
        qckRepReciboReimpTicketFarmaciaARS.xtipoVenta := TipoVenta;
        qckRepReciboReimpTicketFarmaciaARS.valorNCF   := valorNCF;
        //pulgadaInc:=0.86;
        dmFactura.qryVentaFacturaDet.Last;
        if (dmFactura.qryVentaFacturaDet.RecordCount = 1) and
        (qckRepReciboReimpTicketFarmaciaARS.Page.Length < 6.65)  then
        qckRepReciboReimpTicketFarmaciaARS.Page.Length:=5.759
        else
        if dmFactura.qryVentaFacturaDet.RecordCount >= 2 then
        qckRepReciboReimpTicketFarmaciaARS.Page.Length:= qckRepReciboReimpTicketFarmaciaARS.Page.Length +
        (dmFactura.qryVentaFacturaDet.RecordCount - 1 ) * 0.25;

        flag:=true;
        qckRepReciboReimpTicketFarmaciaARS.SetParameterValues;

        qckRepReciboReimpTicketFarmaciaARS.Prepare;
      if (glbQckUnaPagina = 1) then
      begin
        dmFactura.qryVentaFacturaDet.Last;
        if ((dmFactura.qryVentaFacturaDet.RecordCount >= 1) and
           ((dmFactura.qryVentaFacturaDet.RecordCount < 10)
            or (qckRepReciboReimpTicketFarmaciaARS.PageNumber = 2))) then
        begin
          ProgressBar1.Visible:=true;
          ProgressBar1.Position:=0;
          ProgressBar1.Max:=dmFactura.qryVentaFacturaDet.RecordCount;
          repeat
          begin
            ProgressBar1.StepIt;
            //cRc:=cRc + 1;
            if (qckRepReciboReimpTicketFarmaciaARS.PageNumber > 1) then
            begin
              qckRepReciboReimpTicketFarmaciaARS.Page.Length:=qckRepReciboReimpTicketFarmaciaARS.Page.Length + 0.50;

                  qckRepReciboReimpTicketFarmaciaARS.Prepare;
                  flag:=False;
                end else
                if (qckRepReciboReimpTicketFarmaciaARS.PageNumber = 1) then
                break;
                if (qckRepReciboReimpTicketFarmaciaARS.PageNumber = 1) then
                break;
            end;
            until flag = true;
        end;
      end;
        ProgressBar1.Visible:=False;
        dmFactura.qryVentaFacturaDet.First;
        if (GlbImpReciboSinPreg = 1) and (GlbImprimeReciboFact = 1) then
        qckRepReciboReimpTicketFarmaciaARS.Print
        else
        if MessageDlg('Imprimir?',mtInformation, [mbYes, mbNo], 0)=mryes then
        begin
          if (GlbImprimeReciboFact = 1) then
          begin
              qckRepReciboReimpTicketFarmaciaARS.PrinterSetup;
              qckRepReciboReimpTicketFarmaciaARS.Print;
            //end;
          end;
        end else
        qckRepReciboReimpTicketFarmaciaARS.Preview;
        reciboImpreso:=True;
      finally
      qckRepReciboReimpTicketFarmaciaARS.Free;
      qckRepReciboReimpTicketFarmaciaARS:=Nil;
      end;
    end else
  if (Glbcolmado = 1) then
	begin
	  TipoVenta := 'CONTADO';
	  if dmReportes.qryViewVentasMastForma_pago.AsInteger in [7,8] then
		TipoVenta := 'CREDITO'
	  else if dmReportes.qryViewVentasMastForma_pago.Value = 1 then
		TipoVenta := 'CONTADO';

	  if (TipoVenta = 'CONTADO') then
		AbrirDatosParaTicket(false, false,
		  dmReportes.qryViewVentasMastCODIGO_CTE.AsString,
		  dmReportes.qryViewVentasMastNUMERO_DOC_PAGO.AsInteger,
		  dmReportes.qryViewVentasMastFECHA.Value)
	  else if (TipoVenta = 'CREDITO') then
		AbrirDatosParaTicket(false, true,
		  dmReportes.qryViewVentasMastCODIGO_CTE.AsString,
		  dmReportes.qryViewVentasMastNUMERO_FACTURA.AsInteger,
		  dmReportes.qryViewVentasMastFECHA.Value);
      //GlbImprimeTicketCustom:=1; //Temporal
    if (GlbImprimeTicketCustom = 1) then
    begin
      //TTicketCustomSize.PrintTicketReimpSurtidoraESCPos(const APrinterName, ATipoVenta, AValorNCF,
      //ANombreCteGenerico, AStrCopia: string): Boolean;
      dmDatos.qryImpresoras.Close;
  		dmDatos.qryImpresoras.Open;
	  	if dmDatos.qryImpresoras.Locate('IDMODULO;IDREPORTE',VarArrayOf([1, 6]), []) then
      begin 
        if dmReportes.qryViewVentasMastCodigo_cte.Value > 0 then
		    begin
  		    //qckRepReciboReimpTicketSurtidoraNew.qrLabelRNC.Caption := 'RNC-' + qryClienteRNC_NUMERO.Value;
    		  _nombreGenerico:=qryClienteNOMBRE_CTE.Value;
  	  	end;
    		//else
   		  //qckRepReciboReimpTicketSurtidoraNew.qrLabelRNC.Caption := '';

        if not TTicketCustomSize.PrintTicketReimpSurtidoraESCPos(dmDatos.qryImpresorasNOMBRE_IMPRESORA.Value, TipoVenta, valorNCF,
        _nombreGenerico, rxspinImpCantCopias.Text) then
        MessageDlg('No fue posible imprimir el ticket, verifique.',mtWarning,[mbok],0);
      end else
      begin
        MessageDlg('Debes configurar el nombre de la impresora punto de venta.',mtError,[mbok],0);
      end;
    end else
    begin
	  qckRepReciboReimpTicketSurtidoraNew := TqckRepReciboReimpTicketSurtidoraNew.Create(nil);
	  try

	   	if GlbImpQREncuesta = 0 then
		  begin
        qckRepReciboReimpTicketSurtidoraNew.Height:=761;
  		  //qckRepReciboReimpTicketSurtidoraNew.Page.Length := 6.156;
  		  qckRepReciboReimpTicketSurtidoraNew.ChildBand14.Height := 0;
  		  qckRepReciboReimpTicketSurtidoraNew.ChildBand13.HasChild := True;
  		end;
      qckRepReciboReimpTicketSurtidoraNew.SetParameterValues;
  		qckRepReciboReimpTicketSurtidoraNew.strcopia := '';

	  	if Length(edtObservacion.Text) > 0 then
  		  qckRepReciboReimpTicketSurtidoraNew.nombreCteGenerico := edtObservacion.Text;

	  	if dmReportes.qryViewVentasMastCodigo_cte.Value > 0 then
		  begin
		    qckRepReciboReimpTicketSurtidoraNew.qrLabelRNC.Caption := 'RNC-' + qryClienteRNC_NUMERO.Value;
  		  qckRepReciboReimpTicketSurtidoraNew.nombreCteGenerico := qryClienteNOMBRE_CTE.Value;
	  	end
  		else
 		  qckRepReciboReimpTicketSurtidoraNew.qrLabelRNC.Caption := '';

   		qckRepReciboReimpTicketSurtidoraNew.xtipoVenta := TipoVenta;
  		qckRepReciboReimpTicketSurtidoraNew.valorNCF := valorNCF;

	  	dmFactura.qryVentaFacturaDet.Last;

  		if (glbQckUnaPagina = 1) then
  		begin
  		  if (dmFactura.qryVentaFacturaDet.RecordCount = 1) and
  			 (qckRepReciboReimpTicketSurtidoraNew.Page.Length < 6.65) then
  			qckRepReciboReimpTicketSurtidoraNew.Page.Length := 8.759
  		  else if dmFactura.qryVentaFacturaDet.RecordCount >= 2 then
  			qckRepReciboReimpTicketSurtidoraNew.Page.Length :=
  		  qckRepReciboReimpTicketSurtidoraNew.Page.Length +
 			  (dmFactura.qryVentaFacturaDet.RecordCount - 1) * 0.50;

	  	  flag := True;
  		  dmFactura.qryVentaFacturaDet.First;
  		  dmFactura.qryVentaFacturaDet.Last;

	  	  if dmFactura.qryVentaFacturaDet.RecordCount > 25 then
  			qckRepReciboReimpTicketSurtidoraNew.Page.Length := 23.1
  		  else if dmFactura.qryVentaFacturaDet.RecordCount > 29 then
  			qckRepReciboReimpTicketSurtidoraNew.Page.Length := 26;

  		  qckRepReciboReimpTicketSurtidoraNew.Prepare;

	  	  if ((dmFactura.qryVentaFacturaDet.RecordCount >= 1) and
  			  ((dmFactura.qryVentaFacturaDet.RecordCount < 10) or
			  (qckRepReciboReimpTicketSurtidoraNew.PageNumber = 2))) then
  		  begin
	    		ProgressBar1.Visible := True;
    			ProgressBar1.Position := 0;
    			ProgressBar1.Max := dmFactura.qryVentaFacturaDet.RecordCount;

    			if (GlbIncLargoPapel = 1) then
    			begin
    			  repeat
    				  ProgressBar1.StepIt;

  		   	   	if (qckRepReciboReimpTicketSurtidoraNew.PageNumber = 1) then
  			   	  break;

      				if (qckRepReciboReimpTicketSurtidoraNew.PageNumber > 1) then
  				    begin
      				  qckRepReciboReimpTicketSurtidoraNew.Page.Length :=
      					qckRepReciboReimpTicketSurtidoraNew.Page.Length + 0.50;
      				  qckRepReciboReimpTicketSurtidoraNew.Prepare;
      				  flag := False;
      				end
      				else if dmFactura.qryVentaFacturaDet.RecordCount = 1 then
    				  qckRepReciboReimpTicketSurtidoraNew.Page.Length :=
    					qckRepReciboReimpTicketSurtidoraNew.Page.Length + 0.75
      				else if dmFactura.qryVentaFacturaDet.RecordCount >= 2 then
  		  		  qckRepReciboReimpTicketSurtidoraNew.Page.Length :=
    					qckRepReciboReimpTicketSurtidoraNew.Page.Length +
    					(dmFactura.qryVentaFacturaDet.RecordCount - 1) * 0.55;
			      until flag = True;
          end;
		    end;
      end;

  		ProgressBar1.Visible := False;
  		dmFactura.qryVentaFacturaDet.Last;

  		if (dmFactura.qryVentaFacturaDet.RecordCount > 15) and (GlbImpFormatoPDF = 1) then
  		begin
  		  ImprimirEnFormatoPDF(1, 6);
  		end
  		else
  		begin
  		  dmDatos.qryImpresoras.Close;
  		  dmDatos.qryImpresoras.Open;

	  	  if dmDatos.qryImpresoras.Locate('IDMODULO;IDREPORTE', VarArrayOf([1, 6]), []) then
  			qckRepReciboReimpTicketSurtidoraNew.PrinterSettings.PrinterIndex :=
 			  GetImpresora(dmDatos.qryImpresorasNOMBRE_IMPRESORA.Value);

		  // NUEVA LÓGICA PARA MANEJO DE COPIAS MANUALMENTE
		  begin
			totalCopias := StrToInt(rxspinImpCantCopias.Text);
      if totalCopias = 0 then
      totalCopias := 1;

      if chkImpenPDF.Checked then
      begin
        qckRepReciboReimpTicketSurtidoraNew.Prepare;
        //todo crear PDF ----REQUEIMIENDO ANA EL TEJEDOR
        GLBMostrarArchivo:=True;
        ReportExportPDF(qckRepReciboReimpTicketSurtidoraNew,
        GlbRutaRecibos+'\FacturaContado'+
        dmFactura.qryVentaFacturaNOMBRE_FACTURAR.Value+'_'+
        dmFactura.qryVentaFacturaNUMERO_FACTURA.AsString+'.pdf');
        GLBMostrarArchivo:=false;
        chkImpenPDF.Checked:=False;
      end else
      begin
			for i := 1 to totalCopias do
			begin
			  GlbEsCopia := (i > 1); // Primera impresión no es copia
			  qckRepReciboReimpTicketSurtidoraNew.Prepare;

			  if (GlbImpReciboSinPreg = 1) and (GlbImprimeReciboFact = 1) then
			  begin
				qckRepReciboReimpTicketSurtidoraNew.Print;
			  end
			  else if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
			  begin
				if (GlbImprimeReciboFact = 1) then
				begin
				  if i = 1 then
					qckRepReciboReimpTicketSurtidoraNew.PrinterSetup;

				  qckRepReciboReimpTicketSurtidoraNew.Print;
				end;
			  end
			  else
			  begin
				qckRepReciboReimpTicketSurtidoraNew.Preview;
				Break;
			  end;
			end;//end for
      end;
			GlbEsCopia := False;
		  end;

		  if (glbCuadros = 1) and (GlbFactRecurrente) then
			CerrarVentana := True;

		  reciboImpreso := True;
		end;

		if GlbImpTicketVtaAgua = 1 then
		  ImprimirTicketVtaAgua(ipStpInsertVentMast.Params[0].Value);

	  finally
		qckRepReciboReimpTicketSurtidoraNew.Free;
		qckRepReciboReimpTicketSurtidoraNew := nil;
	  end;
    end;//if GlbImprimeTicketCustom = 1
	end else //final ticket colmado venta al contado    --imprimir ticket global Verificar
  begin
      dmreportes.qryViewVentasMast.Close;
      dmreportes.qryViewVentasMast.Params[0].Value:= ipStpInsertVentMast.Params[0].Value;
      dmreportes.qryViewVentasMast.Open;

      UImpresionVentas.ProcSetPathlogoTipoServicio(dmReportes.qryViewVentasMastTIPO_AFILIADO.Value);

      numeroTrnVta := ipStpInsertVentMast.Params[0].Value;
       ProcGuardarDatosCoti(numeroTrnVta);

        rxventa.EnableControls;
        rxdbgrid1.Enabled:=True;
        RxDBGrid1.EnableScroll;
        dmreportes.qryViewVentasMast.Close;
        dmreportes.qryViewVentasMast.Params[0].Value:= ipStpInsertVentMast.Params[0].Value;
        dmreportes.qryViewVentasMast.Open;

        UImpresionVentas.ProcSetPathlogoTipoServicio(dmReportes.qryViewVentasMastTIPO_AFILIADO.Value);

        RxDBGrid1.DataSource:= datasource1;
        dbtext1.DataField:='Descripcion';
        dbtext1.DataSource:= datasource1;
        dbedit1.DataSource:= datasource1;
        dbedit1.DataField:='Cant';
        dbedit2.DataSource:= datasource1;
        dbedit2.DataField:='Precio';
        dbedit3.DataSource:= datasource1;
        dbedit3.DataField:='MontoBruto';
        RxDBGrid1.Visible:=True;      
      AbrirDatosParaTicket(false,false,
      dmReportes.qryViewVentasMastCODIGO_CTE.AsString,
      dmReportes.qryViewVentasMastNUMERO_DOC_PAGO.AsInteger,
      dmReportes.qryViewVentasMastFECHA.Value);
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
      //qckRepReciboReimpTicketSurtidora:=TqckRepReciboReimpTicketSurtidora.Create(Nil);
      qckRepReciboReimpTicketSurtidoraNew:=TqckRepReciboReimpTicketSurtidoraNew.Create(Nil);
      try
        if GlbImpQREncuesta = 0 then
        begin
          qckRepReciboReimpTicketSurtidoraNew.Height:=761;
          qckRepReciboReimpTicketSurtidoraNew.ChildBand14.Height:=0;

          //qckRepReciboReimpTicketSurtidoraNew.Page.Length:=6.156; //sin encuesta
          qckRepReciboReimpTicketSurtidoraNew.ChildBand14.Height:=0;
          qckRepReciboReimpTicketSurtidoraNew.ChildBand13.HasChild:=True;
        end;
        qckRepReciboReimpTicketSurtidoraNew.SetParameterValues;
        if rxspinImpCantCopias.Decimal > 0 then
        qckRepReciboReimpTicketSurtidoraNew.PrinterSettings.Copies:= StrToInt(rxspinImpCantCopias.Text);
        qckRepReciboReimpTicketSurtidoraNew.strcopia :='';

        if Length(edtObservacion.Text) > 0 then
        qckRepReciboReimpTicketSurtidoraNew.nombreCteGenerico:=edtObservacion.Text;
        if (dmReportes.qryViewVentasMastCodigo_cte.value > 0) then
        begin
          qckRepReciboReimpTicketSurtidoraNew.qrLabelRNC.Caption:='RNC-' + qryClienteRNC_NUMERO.Value;
          qckRepReciboReimpTicketSurtidoraNew.nombreCteGenerico:= qryClienteNOMBRE_CTE.Value;
        end
        else qckRepReciboReimpTicketSurtidoraNew.qrLabelRNC.Caption:='';
        qckRepReciboReimpTicketSurtidoraNew.xtipoVenta := TipoVenta;
        qckRepReciboReimpTicketSurtidoraNew.valorNCF   := valorNCF;
        //pulgadaInc:=0.86;
        dmFactura.qryVentaFacturaDet.Last;
      if (glbQckUnaPagina = 1) then
      begin
        if (dmFactura.qryVentaFacturaDet.RecordCount = 1) and
           (qckRepReciboReimpTicketSurtidoraNew.Page.Length < 6.65)  then
        qckRepReciboReimpTicketSurtidoraNew.Page.Length:=5.759
        else
        if dmFactura.qryVentaFacturaDet.RecordCount >= 2 then
        qckRepReciboReimpTicketSurtidoraNew.Page.Length:= qckRepReciboReimpTicketSurtidoraNew.Page.Length +
        (dmFactura.qryVentaFacturaDet.RecordCount - 1 ) * 0.50;

        flag:=true;
        dmFactura.qryVentaFacturaDet.First;
        dmFactura.qryVentaFacturaDet.Last;
        if dmFactura.qryVentaFacturaDet.RecordCount > 25  then
        qckRepReciboReimpTicketSurtidoraNew.Page.Length:=23.1
        else
        if dmFactura.qryVentaFacturaDet.RecordCount > 29  then
        qckRepReciboReimpTicketSurtidoraNew.Page.Length:=26;

        qckRepReciboReimpTicketSurtidoraNew.Prepare;

        if ((dmFactura.qryVentaFacturaDet.RecordCount >= 1) and
           ((dmFactura.qryVentaFacturaDet.RecordCount < 10)
            or (qckRepReciboReimpTicketSurtidoraNew.PageNumber = 2))) then
        begin
          ProgressBar1.Visible :=True;
          ProgressBar1.Position:=0;
          dmFactura.qryVentaFacturaDet.Last;
          ProgressBar1.Max:=dmFactura.qryVentaFacturaDet.RecordCount;
          dmFactura.qryVentaFacturaDet.First;
          if (GlbIncLargoPapel = 1) then
          begin
          repeat
          begin
            ProgressBar1.StepIt;
            //cRc:=cRc + 1;
            if (qckRepReciboReimpTicketSurtidoraNew.PageNumber > 1) then
            begin
              if ProgressBar1.Max > 1 then
              qckRepReciboReimpTicketSurtidoraNew.Page.Length:=qckRepReciboReimpTicketSurtidoraNew.Page.Length +
              (ProgressBar1.Max - 1) * 0.50
              else
              qckRepReciboReimpTicketSurtidoraNew.Page.Length:=qckRepReciboReimpTicketSurtidoraNew.Page.Length + 0.50;
              qckRepReciboReimpTicketSurtidoraNew.Prepare;
              flag:=False;
            end else
            if (qckRepReciboReimpTicketSurtidoraNew.PageNumber = 1) then
                break;
            if (qckRepReciboReimpTicketSurtidoraNew.PageNumber = 1) then
                break;
            end;
            until flag = true;
            end;
          end;
      end;//if (glbQckUnaPagina = 1) then

        ProgressBar1.Visible:=False;
        dmFactura.qryVentaFacturaDet.Last;
        if (dmFactura.qryVentaFacturaDet.RecordCount >15) and (GlbImpFormatoPDF = 1) then
        begin
          ImprimirEnFormatoPDF(1,6);
        end else
        begin
          dmDatos.qryImpresoras.Close;
          dmDatos.qryImpresoras.Open;
          if dmDatos.qryImpresoras.Locate('IDMODULO;IDREPORTE',
          VarArrayOf([1,6]),[]) then     //Factura/Recibo Punto Venta
          qckRepReciboReimpTicketSurtidoraNew.PrinterSettings.PrinterIndex:=
          GetImpresora(dmDatos.qryImpresorasNOMBRE_IMPRESORA.Value);

          if (GlbImpReciboSinPreg = 1) and (GlbImprimeReciboFact = 1) then
          qckRepReciboReimpTicketSurtidoraNew.Print
          else
          if MessageDlg('Imprimir?',mtInformation, [mbYes, mbNo], 0)=mryes then
          begin
            if (GlbImprimeReciboFact = 1) then
            begin
              qckRepReciboReimpTicketSurtidoraNew.PrinterSetup;
              qckRepReciboReimpTicketSurtidoraNew.Print;
            end;
          end else
          qckRepReciboReimpTicketSurtidoraNew.Preview;
          reciboImpreso:=True;
        end;

        if GlbImpTicketVtaAgua = 1 then
        ImprimirTicketVtaAgua(ipStpInsertVentMast.Params[0].Value);

      finally
      qckRepReciboReimpTicketSurtidoraNew.Free;
      qckRepReciboReimpTicketSurtidoraNew:=Nil;
      end;
    end;
  end; //fin impresion venta al contado
end;
procedure TfrmProcVentaRapida.ProcActUltTrn;
begin
  stpProcBuscarUltNum.Params[2].Value := glbCia_Key;
  stpProcBuscarUltNum.ExecProc;
  RxLabel1.Caption:='Ult. #Fact:'+ stpProcBuscarUltNum.params[1].AsString;
  RxLabel2.Caption:='Ult. #Trans:'+ stpProcBuscarUltNum.params[0].AsString;
end;

procedure TfrmProcVentaRapida.ProcAsignaQuery;
begin
  dmFactura.ibQryViewNCF.SQL.Text := dmFactura.ibQryViewNCF_0.SQL.Text;
  if GlbActivaECF = 1 then
    begin
      dmFactura.ibQryViewNCF.SQL.Add(' and v.TIPO_CF >'+chr(39)+'29'+chr(39));
      dmFactura.ibQryViewNCF.SQL.Add(' and n.TIPO_NCF_IFISCAL in (1,2,3,4,7,8)');
      dmFactura.ibQryViewNCF.SQL.Add('order by v.TIPO_CF, n.tipo_ncfNCR desc');
    end else
    begin
      dmFactura.ibQryViewNCF.SQL.Add(' and v.TIPO_CF <'+chr(39)+'17'+chr(39));
      dmFactura.ibQryViewNCF.SQL.Add('order by v.TIPO_CF, n.tipo_ncfNCR desc');
    end;
end;

procedure TfrmProcVentaRapida.FormCreate(Sender: TObject);
begin
  if GlbEsDebugFiscal = 1 then
  LogEventosVentaActivo:=False
  else LogEventosVentaActivo:=True;
  FDevolucionArmada := False;
  FProcesandoDevolucion := False;
  dmVentas.qryPrecioMaxInv.Close;
  dmVentas.qryPrecioMaxInv.Params[0].Value:= GlbCia_Key;
  dmVentas.qryPrecioMaxInv.Open;
  GlbNumVtaPOSTmp:=-1;
  tbltipoDeIngresos.Close;     
  tbltipoDeIngresos.Open;
  if GlbCantCopias > 0 then
  rxspinImpCantCopias.Value :=GlbCantCopias;
  //rxspinImpCantCopias.
  if (upperCase(strUserName) = 'NOSIVID') then
  begin                             
    frmProcVentaRapida.Hint:= IntToStr(frmProcVentaRapida.Width);
  end;           
  flagSolLote:=False;                
  rxLote.close;                   
  rxLote.Open;                          
   EntManual:=False;                               
  if GlBCuadros = 1 then
  begin
    BitBtn35.Visible:=True;         
    BitBtn35.Enabled:=True;
    Label14.Caption:='Pre-Abono';
  end;
  CerrarVentana:=False;
  _montoAbonoC:=0;
  if (GlbMutur = 1) or (GLBMTEGroup = 1) then
  begin
    btnAsignarVeh.Top :=143;
    btnAsignarVeh.Left:=8;
    btnAsignarVeh.Visible:=True;
    btnAsignarVeh.BringToFront;
  end else btnAsignarVeh.Visible:=False;
  xCodProd:=-1;
  _chassisVeh:='';
  valPgoARS:=False;
  _GenNCFFactR:=False;
  GlbLogoServSam:='';
  qryCliente.Close;
  qryCliente.Open;
  qryVehiculos.Close;
  qryVehiculos.Open;
  try
    RxDBGrid2.Align:= alClient;
  except
    LogInformacionTxt('Error RxDBGrid2.Align:= alClient;//FormCreate Method');
  end;
  qryEmpleado.Close;
  cboxUseLogo.Visible:=False;
  if GLBSAM = 1 then
  begin
    qryEmpleado.SQL.Clear;
    qryEmpleado.SQL.Text :=
    'Select c.NOMBRE desc_cargo, e.nombre ||'+chr(39)+' '+chr(39)+'||e.apellido nombrevendedor '+
    ', e.* From EMPLEADO e ' +
    'Inner Join CARGO_EMPLEADOS c on c.CODIGO = e.CARGO' +
    ' and e.CODIGO_CIA = '+IntToStr(glbCia_Key);
    lblFechaInicaPoliza.Visible:=True;
    lblFechaInicaPoliza.BringToFront;
    dbFechaIniciaPoliza.Visible:=True;
    dbFechaIniciaPoliza.BringToFront;
    BitBtn23.Visible:=False;
    BitBtn23.Enabled:=False;
    label20.Caption :='Tipo Afiliación ';
    cboxUseLogo.Visible:=True;
    cboxUseLogo.BringToFront;
  end;

  dmfactura.qryctabcofact.close;
  dmfactura.qryctabcofact.params[0].Value:=glbCia_Key;
  dmfactura.qryctabcofact.Open;
  if (dmfactura.qryctabcofact.RecordSize > 0) and (GlBAyaco = 0) then
  GlbShowCtaBanco:=1;

  qryEmpleado.Open;
  GlbExtraUpdate:=False;
  if (GlBLimao = 1) or (GlBInMobi = 1)then
  begin
    ReImprimeFactRest1.Visible:=True;
  end;
  if GlbFarmacia = 1 then
  InactivaReciboFarmacia1.Checked:=False;

  label51.Caption:=FormatDateTime('hh:mm:ss',now);label52.Caption:=FormatDateTime('hh:mm:ss',now);label53.Caption:='';

  if (UpperCase(GLBFormatoFactura) = 'FORMAFACOCO') and (GLBNumConduceCte = 0) then
  BitBtn13.Visible:= True
  else
  BitBtn13.Visible:=False;

  if GlbActivaFarmacia = 1 then
  begin
    BitBtn33.Visible:=True;
    BitBtn33.BringToFront;
    BitBtn13.Visible:=False;
  end else
  BitBtn33.Visible:=False;

  if BitBtn13.Visible then
  BitBtn22.Visible:=False;
  if GlbActivaIFiscal = 0 then
  BitBtn31.Visible:=False;

  if (GlbIgI = 1) and (GlbActivaIFiscal = 0) and (GlbActivaECF = 0) then
  begin
    Label21.Visible := True;
    CheckBox1.Checked := True;
    CheckBox1.Visible := True;
    NoGenerarNCF1.Checked:=False;
  end;
  if Not Assigned(frmLogError) then
  frmLogError:=TfrmLogError.Create(Nil);

  GlbEntradoAvta:= True;
  codAuxi:='';

  if (GlbFormatoConduce = 444) and (GlbActivaFarmacia = 1) and
  (GlbActivaIFiscal = 0) then
  Begin
    BitBtn13.Top:=BitBtn31.Top;
    BitBtn13.Visible:=True;
  end;
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
    cboxTipoUnidad.BringToFront;
    cboxTipoUnidad.TabOrder:=1;//dmVentas.qryPrecioUnidadSurt.params[0].value
  end else
  begin
    DSQryPrecios.DataSet := dmVentas.qryPrecioUnidadSurt;
    Label69.Color := clMoneyGreen;
    Label70.Color := clMoneyGreen;
    Label71.Color := clMoneyGreen;
    Label72.Color := clMoneyGreen;
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
    btnPagoExacto.Visible := True;

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
    Delay(3000);
    ProcesaEstadoImpresora(numeroTrnVta);
    Delay(2000);
  end else //not fiscal
  begin
    ProductName.Visible:= False;
    Version.Visible    := False;

    ReImprimeDocFiscal1.Visible:=False;
    ListarPuertosCom1.Visible:=False;
    RecuperaTicketfiscal1.Visible:=False;
    ConciliarNIF1.Visible:=False;
    //chkExento.Visible := True;
    Panel3.Visible := True;
    chboxSelTipoNCF.Visible:=False;
    Button1.Visible:= False;
    //Button2.Visible:= True;
    if GlbActivaECF = 0 then
    DBRadioGroup1.Visible := False;
    BitBtn19.Visible := False;

    if (GlbPermiteVtaServicioAdc = 1) and (GLBSAM = 0) then
    begin
      //t BitBtn23.Left := BitBtn19.Left;
      //t BitBtn23.Top  := BitBtn19.Top;
      BitBtn23.Visible:=True;
      BitBtn23.BringToFront;
      label20.Caption :='Nombre Cliente Generico';
      cboxUseLogo.Visible:=False;
      cboxUseLogo.SendToBack;

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
    rxPagos.EmptyTable;
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

    //llenar cboxTipoUnidad
    dmInventario.qryTipoUnidad.First;
    cboxTipoUnidad.Clear;
    While Not dmInventario.qryTipoUnidad.Eof Do
    begin
      cboxTipoUnidad.Items.Add(dmInventario.qryTipoUnidadDESCRIPCION.Value);
      dmInventario.qryTipoUnidad.Next;
    end;
    //end;
    cboxTipoUnidad.Text:='UNIDAD';
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
    if not dmUsuarios.qryEmpleados.Locate('CODIGO', VarUsuarioGlb,[]) then
    Label12.Caption:= VarNombreUsuario + ' *NReg'
    else
    Label12.Caption:= VarNombreUsuario;
    Totales.Close;
    Totales.Open;
    Totales.Insert;
    //     01: Ingresos por operaciones(No financieros).
    //     02: Ingresos Financieros
    //     03: Ingresos Extraordinarios
    //     04: Ingresos por Arrendamientos
    //     05: Ingresos por Venta de Activo Depreciable
    //     06: Otros Ingresos
    TotalesTipoDeIngreso.Value:='01';//
    if TotalesTipoNCF.IsNull then
    begin
      if GlbActivaECF = 1 then
         TotalesTipoNCF.Value:='32'
      else TotalesTipoNCF.Value:='02';
    end;
    if (GlbFactRecurrente) then
    TotalesPreAbono.Value:=_MontoPrepago;

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
    TotalesTipoDeIngreso.Value:='01';
    //TotalesMoneda.Value   :='1';
    TotalesMontoNotaCredito.Value:=0;
    CheckBox4.Checked := False;
    Totalesmontorecibido.Value :=0;
    Totalesdevolucion.Value    :=0;
    if not LlenandoDatos then
    Totales.Post;
    lblProcDev.Visible := False;

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
    ProcAsignaQuery;
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
      if qryVence.state = dsinactive then qryVence.Open;
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
    end;
    //ReImprimirRecibo1.Visible := True;
    if (GlbCodDivInventario = -1) then
    GlbCodDivInventario:=1;

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
    cboxUseLogoChange(Self);

  end else
  btnVerSecCertificados.Visible:=False;
  
  if (GlbCantCopias > 0) then
  rxspinImpCantCopias.Decimal := GlbCantCopias;

  btnFactCxcTercero.Visible:=False;
  if Not Assigned(dmPanaderia) then
    dmPanaderia:=TdmPanaderia.Create(nil);
  if (GlbFactCxcATercero = 1) then
  begin
    //temporal btnFactCxcTercero.Visible:=True;
    btnFactCxcTercero.BringToFront;
    btnFactCxcTercero.Visible:=True;
    BitBtn11.Visible:=True;
    BitBtn11.BringToFront;
    BitBtn12.Visible:=True;
    BitBtn12.BringToFront;
    btnPagoExacto.Top:= BitBtn35.Top;
    btnPagoExacto.BringToFront;
  end else
  begin
    btnFactCxcTercero.Visible:=False;
    btnFactCxcTercero.SendToBack;
    BitBtn11.Visible:=False;
    BitBtn11.BringToFront;
    BitBtn12.Visible:=False;
    BitBtn12.SendToBack;
  end;

  if GlbFinanciamiento = false then
  begin
    BitBtn11.Visible := False;
    BitBtn12.Visible := False;
    BitBtn11.SendToBack;
    BitBtn11.top:= 413;
    panelFinanc.Visible:=false
    //BitBtn15.Top     := 401;
  end else
  begin
    BitBtn11.Visible := True;
    panelFinanc.Visible:=True;
    BitBtn11.BringToFront;
    BitBtn11.top:= 336;//413;
    btnPagoExacto.sendToBack;
    BitBtn12.Visible := True;
    BitBtn12.BringToFront;
  end;
end;

procedure TfrmProcVentaRapida.InicializaOtrosDesc;
begin
  //LogProcedure('TfrmProcVentaRapida.InicializaOtrosDesc');
  dmfactura.stpInsertPorcOtrosCargosFServ.Params[1].Value := 0;
  dmfactura.stpInsertPorcOtrosCargosFServ.Params[2].Value := 0;
  dmfactura.stpInsertPorcOtrosCargosFServ.Params[3].Value := 0;
  dmfactura.stpInsertPorcOtrosCargosFServ.Params[4].Value := 0;
  dmfactura.stpInsertPorcOtrosCargosFServ.Params[5].Value := 0;
  dmfactura.stpInsertPorcOtrosCargosFServ.Params[6].Value := 0;
end;


procedure TfrmProcVentaRapida.ProcSetNCFCliente;
var
  vtipo : string;
begin
  if dmFactura.ibQryViewNCF.State = dsInactive then
  dmFactura.ibQryViewNCF.Open;
  if Not TotalesTipoNCFIFiscal.IsNull AND NCFCTeNotSetup then
  Exit;
  if (tablaPropietarioCodigoPropietario.Value > 0) then
  begin
    qryCliente.DisableControls;
    if qryCliente.Locate('CODIGO_CTE', tablaPropietarioCodigoPropietario.Value, []) then
    begin
      if qryClienteID_PROVINCIA.IsNull or qryClienteID_MUNICIPIO.IsNull then
      begin
        if GlbActivaECF = 1 then
        ProcAsignarProvMunc;
      end;
      if (qryClienteTIPO_CF.Value <> '') then
      begin
        NCFCTeNotSetup:=False;
        if (qryClienteTIPO_CF.Value = '01') and (GlbActivaEcf = 1) then
        vtipo:='31'
        else
        if (qryClienteTIPO_CF.Value = '02') and (GlbActivaEcf = 1) then
        vtipo:='32' else vtipo:=qryClienteTIPO_CF.Value;

        if dmFactura.ibQryViewNCF.Locate('TIPO_CF', vtipo, []) then
        begin
          if (GlbUsaSecNCF2018 = 0) then
          GlbDescNCF := dmFactura.ibQryViewNCFDESCRIPCION.Value
          else
          GlbDescNCF := dmFactura.ibQryViewNCFDESCRIPCION_2018.Value;

          if dmFactura.ibQryViewNCF.Locate('TIPO_CF', vtipo, []) then
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
    qryCliente.EnableControls;
  end else
  begin
    AsignaNCFCFinal;
  end;
end;
procedure TfrmProcVentaRapida.AsignaNCFCFinal;
begin
  //LogProcedure('TfrmProcVentaRapida.AsignaNCFCFinal');
  if dmFactura.ibQryViewNCF.state = dsInactive then
  dmFactura.ibQryViewNCF.Open;
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
  //LogProcedure('TfrmProcVentaRapida.AsignaNCFCFinalX');
  dmFactura.ibQryViewNCF.Close;
  if dmFactura.ibQryViewNCF.Prepared then
  dmFactura.ibQryViewNCF.UnPrepare;
  dmFactura.ibQryViewNCF.SQL.Text := dmFactura.ibQryViewNCF_0.SQL.Text;
  ProcAsignaQuery;
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

//voyaqui
procedure TfrmProcVentaRapida.ProcesaNuevo;
var
  numero : Integer;
begin
  //LogProcedure('TfrmProcVentaRapida.ProcesaNuevo');
  if (edit1.Text <> '') and (rxVenta.RecordCount = 0) then
  begin
    edit1.Text:='';
    rxPagos.close;
    rxPagos.EmptyTable;
    rxPagos.open;
    GlbUsandoCotiza:= False;
    GlbUsandoCotiza := False;
    rxVenta.Close;
    rxVenta.EmptyTable;
    rxVenta.Open;
        
    tablaPropietario.EmptyTable;
    Totales.EmptyTable;
    rxPagos.EmptyTable;
    //Ignored Exito pos ActualizarRecoverData;
    EsModificandoFactura    := False;
    bitBtnEditarFact.Visible:= False;
    bitBtnEditarFact.SendToBack;
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
  rxVenta.EnableControls;
  if (GlbNumVtaPOS < 0) then
      GlbNumVtaPOS:= GetRandomNumber(VarUsuarioGlb);

  rxVenta.Append;
  esInsertando:=True;
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
  LogProcedure('TfrmProcVentaRapida.BitBtn1Click');
  if (panel2.Visible = True) then
  begin
    DBEdit1Exit(Self);
    DBEdit2Exit(Self);
    panel2.Visible := False;
    panel2.Height:=87;
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
  LogProcedure('TfrmProcVentaRapida.BitBtn3Click');
  if rxVenta.state in [dsEdit, dsInsert] then
  begin
    rxVenta.Cancel;
  end;
  if rxVenta.RecordCount > 0 then
  begin
    if MessageDlg('Cancelar transacción?', mtInformation, [mbYes, mbNo], 0)= mrYes then
      begin
        if not ValidarDobleRegPago then exit;
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
        panel2.Height:=87;
        dmcalculos.ProcDeletePosExtraDet(GlbNumVtaPOS);
        GlbNumVtaPOS:=-1;
        GlbNumeroTrn:=-1;
        xCodProd:=-1;
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
        rxPagos.EmptyTable;
        ActualizarRecoverData;
        EsModificandoFactura:=False;
        bitBtnEditarFact.Visible:=False;
        bitBtnEditarFact.SendToBack;
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
        xCodProd:=-1;
        label41.Visible := False;
        DBText15.Visible:= True;
        if Assigned(frmLogError) then
        frmLogError.rxLog.EmptyTable;
        GlbNumVtaPOS:=-1;
        GlbNumVtaPOSTmp:=-1;
        _TienepagoTarjeta:=False;
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
  end else
  begin
    //RxDBGrid2.visible
  end;
end;
procedure TfrmProcVentaRapida.DBEdit1Exit(Sender: TObject);
begin
  DBEdit1.Color := clWindow;
  GlbCalculado:=False;
  procCalc:=True;
  if not Self.Visible or not isShowing or LlenandoDatos then Exit;
  if rxVentaCodArticulo.IsNull then Exit; rxVentaSerie.Value;

  if rxVenta.State in [dsInsert, dsEdit] then
  begin
    if not rxVentaCodArticulo.IsNull then
    begin
      if (GLBECOM = 0) then
      begin
        dmventas.qryVerProdEnConduce.Close;
        dmventas.qryVerProdEnConduce.Params[0].Value := rxVentaCodArticulo.Value;
        dmventas.qryVerProdEnConduce.Open;

        if dmventas.qryVerProdEnConduceCANT_EN_INV.Value < rxVentaCant.Value then
        begin
          if BitBtn13.Visible and
             (dmventas.qryVerProdEnConduceCANT_TOTAL_CONDUCE.Value > 0) then
          begin
            MessageDlg('Cantidad en inventario para: ' + rxVentaDescripcion.Value +
              ' es: ' + qryProductosCANTIDAD.AsString + '.\nLa cantidad en ruta con conduce es: ' +
              dmventas.qryVerProdEnConduceCANT_TOTAL_CONDUCE.AsString, mtWarning, [mbOK], 0);
            rxVentaCantExcedeInv.Value := 1;
          end;
        end;
      end;
    end;

    if rxVentaPrecio.IsNull then Exit;
    if rxVentaCant.IsNull and (rxVentaPrecio.Value > 0) then
      rxVentaCant.Value := 1;

    rxVentaDescUnidadMedida.Value := cboxTipoUnidad.Text;  rxVentaSerie.Value;

    if rxVentaLoteNum.IsNull then
      rxVentaLoteNum.Value := qryProductosLOTE_NUM.Value;

    if ((rxVentaCant.Value * CantUnidad) > qryProductosCANTIDAD.Value) and
       (GlbPermiteVentaInv0 = 0) then
    begin
      if not GlbFactRecurrente then
      begin
        MessageDlg('Cantidad venta es mayor que existencia inventario.', mtWarning, [mbOK], 0);
        rxVenta.Cancel;
        if isShowing then DBEdit1.SetFocus;
        Exit;
      end;
    end;

    if rxVentaCant.Value < 0 then
    begin
      MessageDlg('Cantidad no puede ser negativa.', mtError, [mbOK], 0);
      if isShowing then DBEdit1.SetFocus;
      Exit;
    end;

    // Cálculos internos
    rxVentaMontoBruto.Value := rxVentaCant.Value * rxVentaPrecio.Value;
    if not rxVentaMoneda.IsNull then
      CalcularMontoBrutoXMoneda;

    if rxVentaCantPax.Value > 0 then
      rxVentaMontoBruto.Value := rxVentaMontoBruto.Value * rxVentaCantPax.Value;

    if EsDevolucion then
      rxVentaMontoBruto.Value := rxVentaMontoBruto.Value * 1;

    rxVentaMontoDescItem.Value :=
      rxVentaMontoBruto.Value * rxVentaPorcDescItem.Value / 100;

    rxVentaMontoDesGlobal.Value :=
      rxVentaMontoBruto.Value * (TotalesPorcDesAdicional.Value / 100);

    GlbNumero := rxVentaSerie.Value;

    if (auxiCant > 0) and (auxiCant <> rxVentaCant.Value) then
      PrecioCambio := True;
  end;


  MarcarLineaActiva;

  // ?? Esta parte es clave:
  if rxVenta.State in [dsEdit, dsInsert] then
    rxVenta.Post;
  if esInsertando then
  begin
    rxVenta.Last;
    esInsertando:=False;
  end;

  //bm := rxVenta.GetBookmark;rxVentaserie.value;
  //try
    SolicitarCalculoTotales(tcCantidad);
    RestaurarLineaActiva;

      // Interfaz
  panel2.Visible := False;
  if glbUsaescalaPrecio = 0 then
    panelTempPrecioLevels.Visible := False;
  panel2.Height := 87;
  
  if isShowing then
  begin
    if GlbPermiteCambioPrecio then
    begin
      DBEdit2.ReadOnly := False;
      DBEdit2.SetFocus;
    end                              //rxVentaserie.value
    else if rxVentaPrecio.IsNull or (rxVentaPrecio.Value = 0) then
      DBEdit2.SetFocus;
  end;
      
  //finally
  //  if bm <> nil then
  //  begin
  //    try
  //      if rxVenta.Active and rxVenta.BookmarkValid(bm) then
  //        rxVenta.GotoBookmark(bm);
  //    finally
  //      if rxVenta.Active then
  //        rxVenta.FreeBookmark(bm);
  //      bm := nil;
  //    end;
  //  end;
  //end;
end;

procedure TfrmProcVentaRapida.CalcularMontoBrutoXMoneda;
begin
  //LogProcedure('TfrmProcVentaRapida.CalcularMontoBrutoXMoneda');
  if (rxVentaMonedaBase.Value <> rxVentaMoneda.Value) then
      begin
        if (TotalesMoneda.Value <> '1') then
        begin
          lblTasa.Caption:=Concat('1 = ',InsertarComa(FloatToStr(GlbMontoTasa(TotalesMoneda.Value))));
          //Label60.Caption:=SimboloMoneda('1')+InsertarComa(FloatToStr(rxVentaMontoBruto.Value * GlbMontoTasa(TotalesMoneda.Value)));
          Label60.Caption:=SimboloMoneda('1')+InsertarComa(Format('%8.2f', [Totalestotalneto.Value * GlbMontoTasa(TotalesMoneda.Value)]));
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
        Label60.Caption:=SimboloMoneda('1')+InsertarComa(Format('%8.2f', [Totalestotalneto.Value * GlbMontoTasa(TotalesMoneda.Value)]));
        if (Label60.Caption = '0.00') then Label60.Visible:= false;
      end;
      frmProcVentaRapida.lblTasa.Visible:=True;
end;

procedure TfrmProcVentaRapida.BitBtn2Click(Sender: TObject);
begin
  LogProcedure('TfrmProcVentaRapida.BitBtn2Click');
  GlbEsCopia:=False;
  if rxVenta.RecordCount = 0 then exit;
  if GlbModoHistorico then
  begin
    MessageDlg('Operación no permitida en MODO HISTORICO.',mtError,[mbok],0);
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

  if (rxVentaMoneda.IsNull) And (not rxVentaCant.IsNull) then
  begin
    MessageDlg('Favor indicar tipo moneda.',mtError,[mbok],0);
    if isShowing then
    RxDBLookupCombo2.SetFocus;
  end;
  if rxVenta.RecordCount > 0 then
  //  if frmProcVentaRapida.Showing then
  if frmProcVentaRapida.Showing then
  Edit1.SetFocus;
  ActualizarRecoverData;
end;

procedure TfrmProcVentaRapida.rxVentaAfterPost(DataSet: TDataSet);
var
  oftaAp : boolean;
begin
  LogProcedure('TfrmProcVentaRapida.rxVentaAfterPost');

  if EnProcesoCalculo or CalculoMsgPendiente  then
    Exit;

  CalculoPendiente:= True;
  GlbCalculado    := False;
  
  dmCalculos.datCambio :=esEditando;
  procCalc:=esEditando;
  GlbCalculado:=not esEditando;
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
    dmCalculos.Pos_UpdateTotales(GlbNumVtaPOS);
    frmLogError.CurrenLN:=4537;
    frmLogError.LogSteps(GlbNumVtaPOS,rxVentaSerie.Value,now,now,
    'Antes dmCalculos.Pos_UpdateTotales(GlbNumVtaPOS);',
    'UProcVentaRapida'); 
    if not GlbCalculado then
     CalcularTotalesInterno;
    frmLogError.CurrenLN:=4543;
    frmLogError.LogSteps(GlbNumVtaPOS,rxVentaSerie.Value,now,now,
    'Despues dmCalculos.Pos_UpdateTotales(GlbNumVtaPOS);',
    'UProcVentaRapida');

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

  if procCalc and dmCalculos.avoidLoop and not dmCalculos.esFeedback and (GlbNumVtaPOS > 0) then
  begin
    if dmCalculos.qryConsultaPosExtraDet.Tag <> 99 then
    if not rxVentaMoneda.IsNull and (rxVentaStatus.Value <> 'C') and (not GlbCalculado) then
    BEGIN
      dmCalculos.ProcInsertUpdatePosExtraDet(GlbNumVtaPOS);
      dmCalculos.Pos_UpdateTotales(GlbNumVtaPOS);
      procCalc:=false;
    END;
    if not GlbExtraUpdate then
    begin
      GlbCalculado:=False;
      dmCalculos.ProcInsertUpdatePosExtraDet(GlbNumVtaPOS);
      dmCalculos.Pos_UpdateTotales(GlbNumVtaPOS);
      GlbExtraUpdate:=False;
    end;
    Exit;
  end;

  if esEditando then
  dmCalculos.esFeedbackExtra := False;
  if not dmCalculos.esFeedbackExtra then
  if not rxVentaMoneda.IsNull then
  if dmCalculos.qryConsultaPosExtraDet.Tag <> 99 then
  if procCalc  then
  begin
    dmCalculos.ProcInsertUpdatePosExtraDet(GlbNumVtaPOS);
    dmCalculos.Pos_UpdateTotales(GlbNumVtaPOS);
    procCalc:=false;
  end;
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
    dmCalculos.Pos_UpdateTotales(GlbNumVtaPOS);
    GlbExtraUpdate:=False;
  end;
  //t if not dmCalculos.esFeedback then
  //t   BitBtn27Click(Self);
  //t if not GlbCalculado then
  //t CalcularTotalesInterno;

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
   //t if not GlbCalculado then
   //t CalcularTotalesInterno;

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
  
if rxVenta.State = dsBrowse then
begin
  if esInsertando then
  begin
    if not rxVentaSerie.IsNull then
      SerieLineaActiva := rxVentaSerie.Value;

    esInsertando := False;
    RestaurarLineaActiva;
  end;
end;

end;

procedure TfrmProcVentaRapida.ProcMostrarBotonVerVta;
begin
  LogProcedure('TfrmProcVentaRapida.ProcMostrarBotonVerVta');
 if EnProcesoCalculo or CalculoMsgPendiente or CalculoPendiente then
 Exit;

  qryValidaVta.Close;
  qryValidaVta.Open;
  qryValidaVta.First;
  if qryValidaVta.RecordCount <> rxVenta.RecordCount then
  begin
    qryValidaVta.params[0].Value:= GlbNumVtaPOS;
    BitBtn32.Visible:=True;
  end else
  BitBtn32.Visible:=False;
if imbBarcode.Visible and
   not EnProcesoCalculo and
   not CalculoMsgPendiente and
   not CalculoPendiente then
begin
  if isShowing and edtCodigo.CanFocus then
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
  LogProcedure('TfrmProcVentaRapida.Edit1Exit');
  Activa:=True;
  if Edit1.text = '' then Exit;
  LogInfoLoop('TfrmProcVentaRapida.Edit1Exit');
  LogInformacionTxt(' Monto Neto:'+Totalestotalneto.AsString + 'Monto Pagado:'+Edit1.Text);
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
  if TotalesTipoDeIngreso.IsNull then
  TotalesTipoDeIngreso.Value:='01';
  BitBtn4.Enabled := True;
  ProcesandoVenta := False;
  if Not EsFactura Or Not EsFinanciamiento then
    if (x < -0.01 ) then
    begin
      if (UpperCase(GlbFormatoFactura) <> 'BYMSERVICIOS') then
      begin
        MessageDlg('Monto entregado es menor que total a pagar, verifique',mtInformation, [mbOK], 0);
        if isShowing then
        Edit1.SetFocus;
        BitBtn4.Enabled := False;
        ProcesandoVenta := False;
        Exit;
      end;
    end;
  Totalesmontorecibido.AsString := Edit1.Text;
  if (x > 0) then
  Totalesdevolucion.Value := x;
  if not LlenandoDatos then
  Totales.Post;

  BitBtn4.Enabled := True;
  ProcesandoVenta := False;
  if isShowing then
  BitBtn4.SetFocus;
  if rxPagos.state = dsInactive then rxPagos.Open;
  
  if rxPagos.RecordCount = 0 then
  begin
    InsertarPagoEfectivoNormal;
    rxPagos.Insert;
    rxPagosSerie.Value:= tblDetallePagosSERIE.Value;
    rxPagos.Post;
  end;
end;

Function  TfrmProcVentaRapida.FuncPagoRegistrado(_serietrn:Integer):Boolean;
begin
  LogProcedure('TfrmProcVentaRapida.FuncPagoRegistrado');
  qryVerificapago.Close;
  qryVerificapago.Params[0].Value:= _serietrn;
  qryVerificapago.Open;
  qryVerificapago.First;
  if (qryVerificapagoSERIE_TRN.Value = _serietrn) then
  result := true else
  result := false
end;
procedure TfrmProcVentaRapida.InsertarPagoEfectivoNormal;
begin
  //LogProcedure('TfrmProcVentaRapida.InsertarPagoEfectivoNormal');
  tblDetallePagos.Close;  
  tblDetallePagos.Params[0].Value:= ExtraerFecha(GlbFechaTrnDiaria);  
  tblDetallePagos.Open;
  tblDetallePagos.Append;
  tblDetallePagosFECHA.Value            :=GlbFechaTrnDiaria;
  tblDetallePagosTIPO.Value             := 1;//CONTADO
  tblDetallePagosTIPO_PAGO.Value        := 1;
  tblDetallePagosAREA_TRANS.Value       := 1;//Ventas

  tblDetallePagosGlbNumVtaPOS.Value     := GlbNumVtaPOS;
  //tblDetallePagosSERIE_TRN.Value        := numtrn;
  tblDetallePagosAREA_TRANS.Value       := 1;//Ventas
  tblDetallePagosMONTO_PAGADO.value     := Totalestotalneto.Value;
  tblDetallePagos.Post;
  tblDetallePagos.ApplyUpdates;
  if not tblDetallePagos.Transaction.InTransaction then
  tblDetallePagos.Transaction.StartTransaction;
  try
    tblDetallePagos.Transaction.CommitRetaining;
  except
  tblDetallePagos.Transaction.RollbackRetaining;
  end;
end;

procedure TfrmProcVentaRapida.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var
    xxxx : word; item : String;
    xcerrar:boolean;
begin
  //LogProcedure('TfrmProcVentaRapida.FormKeyDown');
  //113-F2 f4-115   f5-116     f3-114
  xxxx:= key;
  xcerrar:=False;
  if (key = 122) and RxSpeedButton1.Visible then //F11
  begin
    if rxVenta.RecordCount = 0 then exit;
    if MessageDlg('Desea guardar venta?',mtWarning,[mbyes,mbno],0) = mryes then
    RxSpeedButton1Click(Self);
    exit;
  end;
  if (key = 123) then
  // and (GlbActivaIFiscal = 0 ) and (GlbActivaECF = 0))
  //    or ((GlBExpert = 1) or (GLBAyaco = 1))  then //F12
  begin
    if (GlbFarmacia = 0) then
    begin
      //Label21.Visible:=True;
      NoGenerarNCF1Click(Self);
      if CheckBox1.Checked then
      Label46.Font.Color:= clRed
      else Label46.Font.Color:= clBlack;
    end;
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
    if (GlbActivaIFiscal = 0) and (GlbActivaeCF = 0) then
    begin
      CheckBox1.checked:= Not CheckBox1.checked;
      if not CheckBox1.Checked then
      GlbIgI := 1 else GlbIgI := 0;
      
      if (GlbActivaECF = 1) then GlbIgI := 1;

      if (GlbIgI = 1) and ((GlbActivaIFiscal = 0) or (GlbActivaECF = 0)) then
      CheckBox1.checked:=False;
      ProcSetBtnConduce;
    end;                           
    if CheckBox1.Checked then
       Label46.Font.Color:= clRed
    else Label46.Font.Color:= clBlack;
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
      if (rxVentaSerie.AsString<> item) then
      if rxVenta.Locate('Serie', strToInt(item),[]) then
      rxVenta.Delete;
      //temp Marzo-17-2015 ProcesarSumaTotal;
      //t BitBtn27Click(Self);
      if not GlbCalculado then
      CalcularTotalesInterno;
    end;
  end else
  if (key = 119) then //F8
  btnPagoExactoClick(Self);
  if xcerrar then
     close;
  end;

procedure TfrmProcVentaRapida.rxVentaBeforePost(DataSet: TDataSet);
begin
  if (rxVentaPrecio.Value <= rxVentaCostoProducto.Value) And (rxVentaPrecio.Value > 0)
    AND (GlbMotor = 0) And (not GlbFactRecurrente) and (not EsModificandoFactura) then
  begin
    MessageDlg('Precio venta no puede ser menor que el costo, verifique.',mtError,[mbok],0);
    //t Exit;
  end;

  if (rxVentaCodArticulo.Value = 0) then
  begin
    rxVenta.Cancel;
    Exit;
  end;

  if esCargaDatosFFood then
  Exit;
  if Totales.state = dsBrowse then Totales.Edit;
  if TotalesTipoNCF.IsNull or (TotalesTipoNCF.Value = '') then
  begin
    if GlbActivaECF = 1 then
    TotalesTipoNCF.Value:='32' //Consumidor Final
    else TotalesTipoNCF.Value:='02';
  end else
  if GlbActivaECF = 1 then
  begin
    if (TotalesTipoNCF.Value[1] ='B') then
    TotalesTipoNCF.Value:='32' //Consumidor Final
  end;

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

  if (rxVentaPrecio.Value > 0) then
  rxVentaMontoBruto.Value:= rxVentaCant.Value * rxVentaPrecio.Value;

  CalcularMontoBrutoXMoneda;

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

  //if not dmCalculos.EsProcCalc then
  //begin
    //CalculoPendiente := True;
    GlbCalculado := False;
    procCalc := True;
 // end;
end;

procedure TfrmProcVentaRapida.BitBtn5Click(Sender: TObject);
begin
  LogProcedure('TfrmProcVentaRapida.BitBtn5Click');
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

        if not GlbCalculado then
        CalcularTotalesInterno;
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
        //t BitBtn27Click(Self);
        if not GlbCalculado then
        CalcularTotalesInterno;
      end;
    end else
    if EsModificandoFactura then
    begin
      if (rxVentaStatus.Value = 'I') then
      begin
        dmCalculos.ProcDelRecPosExtraDet(rxVentaSerie.Value);
        rxVenta.Delete;
        DBEdit2Exit(Self);
        //t BitBtn27Click(Self);
        if not GlbCalculado then
        CalcularTotalesInterno;
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
        //t BitBtn27Click(Self);
        if not GlbCalculado then
        CalcularTotalesInterno;
      end;
    end else
    if EsModificandoFactura then
    begin
      if MessageDlg('Borrar item No.' + rxVentaSerie.AsString + '?', mtWarning, [mbYes, mbNO], 0)= mrYes then
      begin
        //if not VerificaHuellas then
        begin
          //if VerificaClave then
          if VerificaHuellas then
          begin
            if not ValidarDobleRegPago then exit;
            EliminarRecoverData;
            dmCalculos.ProcDelRecPosExtraDet(rxVentaSerie.Value);
            rxVenta.Delete;
            DBEdit2Exit(Self);
            //marzo 17 2015 ProcesarSumaTotal;
            //t BitBtn27Click(Self);
            if not GlbCalculado then
            CalcularTotalesInterno;
          end;
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
        //t if not GlbCalculado then
        //t BitBtn27Click(Self);
        if not GlbCalculado then
        CalcularTotalesInterno;
      end;
    end;
   end;
end;

procedure TfrmProcVentaRapida.Inventario1Click(Sender: TObject);
begin
  LogProcedure('TfrmProcVentaRapida.Inventario1Click');
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

procedure TfrmProcVentaRapida.CuadreCaja1Click(Sender: TObject);
begin
  LogProcedure('TfrmProcVentaRapida.CuadreCaja1Click');
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
  LogProcedure('TfrmProcVentaRapida.InsertarDetDevolucion');
  if (dmcalculos.qryDatosItbPosExtra.Params[0].Value <> dmcalculos.qryConsultaPosExtraDetNUMERO.Value) then
  begin
    dmcalculos.qryDatosItbPosExtra.Close;
    dmcalculos.qryDatosItbPosExtra.Params[0].Value:= dmcalculos.qryConsultaPosExtraDetNUMERO.Value;
    dmcalculos.qryDatosItbPosExtra.Open;
  end;

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
  if (Abs(rxVentaMontoDescItem.Value) > 0) then
  ibStpInsertVentaDet.Params[27].Value := rxVentaMontoDescItem.Value
  else
  ibStpInsertVentaDet.Params[27].Value := rxVentaMontoDesGlobal.Value;

  ibStpInsertVentaDet.Params[28].Value := rxVentaItbi.Value; //  rxVentaMontoDescuento.Value;
  ibStpInsertVentaDet.Params[29].Value := rxVentaIDTasaITBIS.Value;
  ibStpInsertVentaDet.Params[30].Value := rxVentaMontoItbisRecargo.Value;
  ibStpInsertVentaDet.Params[31].Value := rxVentaMoneda.Value;
  ibStpInsertVentaDet.Params[32].Value := rxVentamonto_tasa.Value;
  ibStpInsertVentaDet.Params[33].Value := rxVentaCantPax.Value;

  //if dmcalculos.qryDatosItbPosExtra.state = dsInactive then
  //begin
    dmcalculos.qryDatosItbPosExtra.cLOSE;
    dmcalculos.qryDatosItbPosExtra.Params[0].Value:= GlbNumVtaPOS;
    dmcalculos.qryDatosItbPosExtra.Open;
  //end;

  if dmcalculos.qryDatosItbPosExtra.locate('serie',rxVentaserie.value,[]) then
  begin
  ibStpInsertVentaDet.Params[34].Value := dmcalculos.qryDatosItbPosExtraDC_ITBIS_CLD.Value;
  ibStpInsertVentaDet.Params[35].Value := dmcalculos.qryDatosItbPosExtraTC_MONTOITBISRECARGO_GLB.Value;
  ibStpInsertVentaDet.Params[36].Value := dmcalculos.qryDatosItbPosExtraTC_MONTOITBISRECARGO_ITM.Value;
  end else
  begin
    ibStpInsertVentaDet.Params[34].Value := 0;
    ibStpInsertVentaDet.Params[35].Value := 0;
    ibStpInsertVentaDet.Params[36].Value := 0;
  end;

  ibStpInsertVentaDet.Params[37].Value := rxVentaNUM_CONDUCE_CTE.Value;
  ibStpInsertVentaDet.Params[38].Value := rxVentaNUM_IDENT.Value;
  ibStpInsertVentaDet.Params[39].Value := rxVentaFICHA_VEH.Value;
  ibStpInsertVentaDet.Params[40].Value := null;//poner aqui el num_lote
  //ibStpInsertVentaDet.Params[41].Value := rxVentaCodigoVendedor.Value;
  if not rxVentaGlbcodVendedor.IsNull then
  ibStpInsertVentaDet.Params[41].Value := rxVentaglbcodVendedor.Value//poner aqui el num_lote
  else
  ibStpInsertVentaDet.Params[41].Value := GlbcodVendedor;

  ibStpInsertVentaDet.Params[42].Value := rxVentaLevelPrecio.Value;

  tblProductoSerie.close;
  tblProductoSerie.Params[0].Value := rxVentaSerieProd.Value;
  tblProductoSerie.Open;

  if (tblProductoSerie.RecordCount = 1) then
  begin
    tblProductoSerie.Edit;
    tblProductoSerieSTATUS.Value:='A';
    tblProductoSerieSTATUS_EQUIPO.Value:=1;
    tblProductoSerieCODIGO_CTE.AsVariant:=null;
    GlbSalvarQuery(tblProductoSerie);
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

  //devoluciones
  if Not ibStpInsertVentaDet.Transaction.InTransaction then
  ibStpInsertVentaDet.Transaction.StartTransaction;
  try
    ibStpInsertVentaDet.Transaction.CommitRetaining;
  except
  ibStpInsertVentaDet.Transaction.RollbackRetaining;
  end;

    try
    if rxVentaInvetariar.Value = 1 then
  dmVentas.Proc_InsertarKardexDet(
    glbCia_Key,
    1, //TIPO SMALLINT,  --1-Entradas 2-Salida
    3, //TIPO_OPE SMALLINT,--1-Orden Compra 2-Venta 3-Devolucion 4-Transferencia 5-Dañado 6-Donacion 7-Otro
    rxVentaFecha.Value,
    rxVentaCodArticulo.Value, //CODIGO_PRODUCTO :integer;
    rxVentaCant.Value,
    rxVentaCostoProducto.Value, //COSTO_PRODUCTO :real;
    rxVentaPrecio.Value, // PRECIO_VENTA :real;
    VarUsuarioGlb, //CODIGO_USUARIO :integer;
    Numero,// NUMERO_TRN_VTA: integer;
    'A' //STATUS :string;
    ,'Devolucion Venta');
  except
  end;
end;

procedure TfrmProcVentaRapida.InsertarDet(numero : Integer);
begin
  LogProcedure('TfrmProcVentaRapida.InsertarDet');
  if (dmcalculos.qryDatosItbPosExtra.Params[0].Value <> dmcalculos.qryConsultaPosExtraDetNUMERO.Value) then
  begin
    dmcalculos.qryDatosItbPosExtra.Close;
    dmcalculos.qryDatosItbPosExtra.Params[0].Value:= dmcalculos.qryConsultaPosExtraDetNUMERO.Value;
    dmcalculos.qryDatosItbPosExtra.Open;
  end;

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
    if (Abs(rxVentaMontoDescItem.Value) > 0) then
    ibStpInsertVentaDet.Params[27].Value := rxVentaMontoDescItem.Value * -1
    else
    ibStpInsertVentaDet.Params[27].Value := rxVentaMontoDesGlobal.Value * -1;
    ibStpInsertVentaDet.Params[28].Value := rxVentaItbi.Value * -1;//rxVentaMontoDescuento.Value * -1;
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
    if (Abs(rxVentaMontoDescItem.Value) > 0) then
    ibStpInsertVentaDet.Params[27].Value := rxVentaMontoDescItem.Value * -1
    else
    ibStpInsertVentaDet.Params[27].Value := rxVentaMontoDesGlobal.Value * -1;
    ibStpInsertVentaDet.Params[28].Value := rxVentaItbi.Value * -1;//rxVentaMontoDescuento.Value * -1;
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
  if (abs(rxVentaMontoDescItem.Value) > 0) then
     ibStpInsertVentaDet.Params[27].Value := rxVentaMontoDescItem.Value
  else
    ibStpInsertVentaDet.Params[27].Value := rxVentaMontoDesGlobal.Value;

  ibStpInsertVentaDet.Params[28].Value := rxVentaItbi.Value;//rxVentaMontoDescuento.Value;
  ibStpInsertVentaDet.Params[29].Value := rxVentaIDTasaITBIS.Value;
  ibStpInsertVentaDet.Params[30].Value := rxVentaMontoItbisRecargo.Value;
  ibStpInsertVentaDet.Params[31].Value := rxVentaMoneda.Value;
  ibStpInsertVentaDet.Params[32].Value := rxVentamonto_tasa.Value;
  ibStpInsertVentaDet.Params[33].Value := rxVentaCantPax.Value;
  //if dmcalculos.qryDatosItbPosExtra.state = dsInactive then
  //begin
    dmcalculos.qryDatosItbPosExtra.CLOSE;
    dmcalculos.qryDatosItbPosExtra.Params[0].Value:= GlbNumVtaPOS;
    dmcalculos.qryDatosItbPosExtra.Open;
  //end;
  if dmcalculos.qryDatosItbPosExtra.locate('serie',rxVentaserie.value,[]) then
  begin
  ibStpInsertVentaDet.Params[34].Value := dmcalculos.qryDatosItbPosExtraDC_ITBIS_CLD.Value;
  ibStpInsertVentaDet.Params[35].Value := dmcalculos.qryDatosItbPosExtraTC_MONTOITBISRECARGO_GLB.Value;
  ibStpInsertVentaDet.Params[36].Value := dmcalculos.qryDatosItbPosExtraTC_MONTOITBISRECARGO_ITM.Value;
  end else
  begin
    ibStpInsertVentaDet.Params[34].Value := 0;
    ibStpInsertVentaDet.Params[35].Value := 0;
    ibStpInsertVentaDet.Params[36].Value := 0;
  end;
  ibStpInsertVentaDet.Params[37].Value := rxVentaNUM_CONDUCE_CTE.Value;
  if (GlbMutur = 1) then
  ibStpInsertVentaDet.Params[38].Value := numero
  else
  ibStpInsertVentaDet.Params[38].Value := rxVentaNUM_IDENT.Value;
  ibStpInsertVentaDet.Params[39].Value := rxVentaFICHA_VEH.Value;
  ibStpInsertVentaDet.Params[40].Value := null;//poner aqui el num_lote

  if not rxVentaGlbcodVendedor.IsNull then
  ibStpInsertVentaDet.Params[41].Value := rxVentaglbcodVendedor.Value //poner aqui el num_lote
  else
  ibStpInsertVentaDet.Params[41].Value := GlbcodVendedor;

  ibStpInsertVentaDet.Params[42].Value := rxVentaLevelPrecio.Value;
  
  if not rxVentaSerieProd.IsNull then
  begin
    tblProductoSerie.close;
    tblProductoSerie.Params[0].Value := rxVentaSerieProd.Value;
    tblProductoSerie.Open;

    if (tblProductoSerie.RecordCount = 1) then
    begin
      tblProductoSerie.Edit;
      tblProductoSerieSTATUS.Value:='R';
      tblProductoSerieCODIGO_CTE.Value:=tablaPropietarioCodigoPropietario.Value;
      tblProductoSerieSTATUS_EQUIPO.Value:=2;//asignado
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

  dmcalculos.qryDatosItbPosExtra.OPEN;
  dmcalculos.qryDatosItbPosExtra.Params[0].Value:= GlbNumVtaPOS;
  dmcalculos.qryDatosItbPosExtra.Open;

  if dmcalculos.qryDatosItbPosExtra.Locate('serie',rxVentaserie.value,[]) then
  begin
    ibStpInsertVentaDet.Params[34].Value := dmcalculos.qryDatosItbPosExtraDC_ITBIS_CLD.Value;
    ibStpInsertVentaDet.Params[35].Value := dmcalculos.qryDatosItbPosExtraTC_MONTOITBISRECARGO_GLB.Value;
    ibStpInsertVentaDet.Params[36].Value := dmcalculos.qryDatosItbPosExtraTC_MONTOITBISRECARGO_ITM.Value;
  end else
  begin
    ibStpInsertVentaDet.Params[34].Value := 0;
    ibStpInsertVentaDet.Params[35].Value := 0;
    ibStpInsertVentaDet.Params[36].Value := 0;
  end;
  if rxVentaNUM_CONDUCE_CTE.IsNull then
  ibStpInsertVentaDet.Params[37].Value := null
  else
  ibStpInsertVentaDet.Params[37].Value := rxVentaNUM_CONDUCE_CTE.Value;

  if GlbMutur = 1 then
  ibStpInsertVentaDet.Params[38].Value := numero
  else
  ibStpInsertVentaDet.Params[38].Value := rxVentaNUM_IDENT.Value;

  ibStpInsertVentaDet.Params[39].Value := rxVentaFICHA_VEH.Value;
  ibStpInsertVentaDet.Params[40].Value := null;//poner aqui el num_lote

  if not rxVentaGlbcodVendedor.IsNull then
  ibStpInsertVentaDet.Params[41].Value := rxVentaglbcodVendedor.Value
  else
  ibStpInsertVentaDet.Params[41].Value := GlbcodVendedor;

  ibStpInsertVentaDet.Params[42].Value := rxVentaLevelPrecio.Value;

  ibStpInsertVentaDet.ExecProc;

  if (GLBSAM = 1) and (rxVentaNUM_IDENT.Value <> '' )then
  InsertarPolizaCliente;

  if (GlbActivaCafeteria = 1) or (GlbActivaProduccion = 1) then
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

  try
    //if rxVentaInventariar.Value
    dmVentas.Proc_InsertarKardexDet(
    glbCia_Key,
    2, //TIPO SMALLINT,  --1-Entradas 2-Salida
    2, //TIPO_OPE SMALLINT,--1-Orden Compra 2-Venta 3-Devolucion 4-Transferencia 5-Dañado 6-Donacion 7-Otro
    rxVentaFecha.Value,
    rxVentaCodArticulo.Value, //CODIGO_PRODUCTO :integer;
    rxVentaCant.Value,
    rxVentaCostoProducto.Value, //COSTO_PRODUCTO :real;
    rxVentaPrecio.Value, // PRECIO_VENTA :real;
    VarUsuarioGlb, //CODIGO_USUARIO :integer;
    Numero,// NUMERO_TRN_VTA: integer;
    'A' //STATUS :string;
    ,'Venta');
  except
  end;
end;

procedure TfrmProcVentaRapida.Ayuda1Click(Sender: TObject);
begin
  LogProcedure('TfrmProcVentaRapida.Ayuda1Click');
  ShellExecute(frmProcVentaRapida.Handle,nil,PChar('C:\Proyectos\PointSaleSoftGold\PuntoVenta\ManualOnline.html'),'','',SW_SHOWNORMAL);
end;

procedure TfrmProcVentaRapida.ImprimirRecibo1Click(Sender: TObject);
begin
  LogProcedure('TfrmProcVentaRapida.ImprimirRecibo1Click');
  ImprimirRecibo1.Checked:= Not ImprimirRecibo1.Checked;
end;
//Facturar -Credito
procedure TfrmProcVentaRapida.BitBtn6Click(Sender: TObject);
  var
     Serie_Asignadoncf : Integer;
     serieDoc : Integer;
     valorNCF : String;

     ShowNcfVentana:Boolean;
     flag,flagAbortar : Boolean;
begin
  if TotalesVentaGuardada.Value = 1 then
  begin
    MessageDlg('Factura ya fue guardada, verifique...',mtWarning,[mbok],0);
    Exit;
  end;
  dmDatos.qryImpresoras.Close; //GlbAyaco
  dmDatos.qryImpresoras.Open;
  GlbEsCopia:=False;
  if (rxVenta.recordcount = 0) then
  exit;
  if (GlbActivaIFiscal = 1) then
  if VerificaNIFTExiste then
  begin
    MessageDlg('TIENES UNA VENTA CON NIF EN T, NO PUEDES HACER MAS VENTAS.'+
    LF+CR+'PUEDES CONVERTIR ESTA VENTA COMO COTIZACION Y LUEGO LA PUEDES USAR.',mtError,[mbok],0);
    Exit;
  end;

  esContado:=False;
  GLBIFiscalOnline:=True;
  GlbEsCopia:=False;
  flagAbortar:=false;
  BitBtn6.Enabled := False;
  if rxVenta.RecordCount = 0 then
  begin
    MessageDlg('No puedes guardar sin detalle, verifique.',mtInformation,[mbok],0);
    BitBtn6.Enabled := True;
    Exit;
  end;

  if (GLBSAM = 1) and TotalesTipoAfiliado.IsNull then
  begin
    MessageDlg('Favor verifique tipo afiliado.',mtInformation,[mbok],0);
    BitBtn6.Enabled := True;
    if isShowing then
    cboxUseLogo.SetFocus;
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

  if not ValidaSubTotal then exit;

  if Not rxVentaNumeroCotiza.IsNull AND (Label36.VISIBLE)then
  begin
    if MessageDlg('Convertir cotización en venta y facturar?', mtInformation,[mbYes, mbNo], 0)=mrYes then
    begin
      EsModificandoCotiza:=False;
      _NumeroCotiza      :=-1;
      lblFechaCotizacion.Visible:=False;
      dbFechaCotizacion.Visible :=False;
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
      if (CheckBox1.Checked) and ((GlbActivaIFiscal = 1) Or (GlbActivaECF= 1))And (tablaPropietarioCodigoPropietario.IsNull) then
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
    if tablaPropietarioCodigoPropietario.IsNull then
    rxdbLookupCte.SetFocus;
    BitBtn6.Enabled:=True;
    Exit;
  end;
  if (Edit1.Text <> '') And (Not EsConduce ) then
  begin
    MessageDlg('Monto recibido debe estar en blanco, verifique',mtError, [mbok], 0);
    if isShowing then
    edit1.SetFocus;
    edit1.SelectAll;
    BitBtn6.Enabled:=True;
    Exit;
  end;

  if (GlbEsDebugEntradas = 1) then
  begin
    if (Edit1.Text <> '') then
    LogInformacionTxt(' Monto Neto:'+Totalestotalneto.AsString+' Monto Pagado:'+Edit1.Text);
  end;
  if (rxVentaPrecio.Value = 0) and (GlbFactRecurrente) then
  begin
    MessageDlg('Precio no puede ser Cero, verifique',mtError, [mbok], 0);
    BitBtn6.Enabled := True;
    //ShowModal;
    Exit;
  end;

  if (GlbFactCxcATercero = 1) and (not rxVentaNUM_CONDUCE_CTE.IsNull) and (edtMontoInicial.Text = '') then
  begin
    MessageDlg('Indique monto inicial.',mtError, [mbok], 0);
    BitBtn6.Enabled := True;
    if showing then
    edtMontoInicial.SetFocus;
    Exit;
  end;

  if GlbFactRecurrente then
  CalcularTotalesInterno;
  //t BitBtn27Click(Self);

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
  valPgoARS:=False;
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
        if qryCliente.State = dsinactive then
        begin
          MessageDlg('Se detectó una inconsistencia, verifica.', mtWarning, [mbOK], 0);
          BitBtn6.Enabled:=True;
          rxdbLookupCte.setfocus;
          Exit;
        end;
        qryCliente.Locate('CODIGO_CTE',xCodigoCte,[]);
        TotalesNombreCliente.Value := qryClienteNOMBRE_CTE.Value;
        TotalesDireccion.Value     := qryClienteDIRECCION_CONT.Value;
        TotalesTelefono.Value      := qryClienteTELEF_CONTACTO.Value;
        TotalesCodCliente.Value    := qryClienteCODIGO_CTE.Value;
        TotalesRNC_NUMERO.Value    := qryClienteRNC_NUMERO.Value;
        if (GlbFactRecurrente) then
        begin
          if qryClienteCANT_DIAS_CREDITO.Value > 0 then
          TotalesFechaVence.Value    := rxVentaFecha.Value + qryClienteCANT_DIAS_CREDITO.Value
          else
          TotalesFechaVence.Value    := rxVentaFecha.Value + 8;
        end else
        if (Not qryClienteCANT_DIAS_CREDITO.IsNull) And (qryClienteCANT_DIAS_CREDITO.Value > 0) Then
        TotalesFechaVence.Value    := GlbFechaTrnDiaria + qryClienteCANT_DIAS_CREDITO.Value
        else
        TotalesFechaVence.Value    := GlbFechaTrnDiaria + 15;//Default
        if not LlenandoDatos then
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
          if NoTieneDiasDeCredito then
          MessageDlg('Debes asignar la cantidad días de crédito...', mtWarning, [mbOK], 0)
          else if NoTieneCredito then
          MessageDlg('Cliente no tiene crédito...', mtWarning, [mbOK], 0)
          else
          MessageDlg('Balance CXC excede limite de crédito.', mtWarning, [mbOK], 0);
          BitBtn6.Enabled:=True;
          flagAbortar:=True;
          Exit;
        end;
        //if (GlbIgI = 1) and ((GlbActivaIFiscal = 0) or (GlbActivaECF = 0)) then
        //CheckBox1.Checked := False; //Vuelve Aqui
        ValorNCF := '';
        Serie_Asignadoncf := -1;

        if (Totalestotalneto.Value = 0) then
        begin
          LogEventoVenta('CALL ProcesaCalculos', 'TfrmProcVentaRapida.BitBtn6Click(Sender: TObject);');
          EnProcesoCalculo:=False;
          dmCalculos.ProcesaCalculos;
          //t BitBtn27Click(Self);
          if not GlbCalculado then
          CalcularTotalesInterno;

          if (Totalestotalneto.Value = 0) then
          begin
            //showmodal;
            MessageDlg('Monto total no puede ser cero, verifique',mtError, [mbok], 0);
            Exit;
          end;
        end;
        ShowNcfVentana:=True;

        if (EsConduce) and (GlbIgI = 1) and (GlbActivaIFiscal = 0 ) and (GlbActivaECF = 0) then
        ShowNcfVentana:=False;
       if (CheckBox1.Checked) and ((GlbActivaIFiscal = 1 ) or (GlbActivaECF = 1)) then
       begin
         if TotalesTipoNCF.IsNull then
         begin
           MessageDlg('Favor indicar Tipo Comprobante.', mtInformation, [mbok],0);
           if isShowing then
           RxDBLookupCombo3.SetFocus;
           BitBtn6.Enabled := True;
           BitBtn6.BringToFront;
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
              if (GlbUsaSecNCF2018 = 0) then
              GlbDescNCF := dmFactura.ibQryViewNCFDESCRIPCION.Value
              else
              GlbDescNCF := dmFactura.ibQryViewNCFDESCRIPCION_2018.Value;
            end;
            ShowNcfVentana:=False;
          end else
          begin
             if TotalesTipoNCFIFiscal.IsNull then
             begin
               if GlbActivaECF = 1 then
               dmFactura.ibQryViewNCF.Locate('TIPO_CF','32',[])
               else
               begin
                 if NCFSinValorFiscal1.Checked then
                 dmFactura.ibQryViewNCF.Locate('TIPO_CF','02',[])
                 else dmFactura.ibQryViewNCF.Locate('TIPO_CF','01',[]);
               end
             end;
            ProcSetNCFCliente;//dmFactura.ibQryViewNCFdescripcion.value

          end;
     //Refactorizado tratar de evitar duplicidad en registro de venta
     if (GlbNumVtaPOSTmp = -1) then
     try
       ProcInsertCtrlNumVta;
     except
       ShowMessage('No se puede guardar esta venta, comunicar a soporte.');
       exit;
     end; 
          if (EsConduce) and (GlbIgI = 1) and (GlbActivaIFiscal = 0 ) and (GlbActivaECF = 0) then
          begin
            if TotalesMontoNCRAplicado.Value > 0 then
            DescargaNotaCredito;
            GlbDescNCF:='';
            ProcVenta(ValorNCF,Serie_Asignadoncf,serieDoc);//Aqui voy
            ProcesaFacturar(1, serieDoc, xcodigocte);
          end else
          if ShowNcfVentana then
          begin
            if TotalesMontoNCRAplicado.Value > 0 then
            DescargaNotaCredito;
            if GlbFactRecurrente then
            begin
              if _GenNCFFactR then
              begin
                if (GlbUsaSecNCF2018 = 0) then
                GlbDescNCF:=dmFactura.ibQryViewNCFDESCRIPCION.Value
                else
                GlbDescNCF:=dmFactura.ibQryViewNCFDESCRIPCION_2018.Value;

                ProcVentaConNCF(dmFactura.ibQryViewNCFTIPO_CF.Value, ValorNCF, serieDoc, serie_asignadoncf);
                //Todos : si estamos en version fiscal/electronica evalur si serie_asignadoncf tiene valor
                ProcVenta(valorNCF, Serie_Asignadoncf,serieDoc);//Aqui voy
                ProcesaFacturar(1, serieDoc, xcodigocte);
                flag:=True;
              end else
              begin
                GlbDescNCF:='';
                ProcVenta(ValorNCF,Serie_Asignadoncf,serieDoc);//Aqui voy
                ProcesaFacturar(1, serieDoc, xcodigocte);
              end;

            end else
            if (frmSelNCF.ShowModal = mrOK) then
            begin
              if (GlbUsaSecNCF2018 = 0) then
              GlbDescNCF:=dmFactura.ibQryViewNCFDESCRIPCION.Value
              else
              GlbDescNCF:=dmFactura.ibQryViewNCFDESCRIPCION_2018.Value;

              ProcVentaConNCF(dmFactura.ibQryViewNCFTIPO_CF.Value, ValorNCF, serieDoc, serie_asignadoncf);
              ProcVenta(valorNCF, Serie_Asignadoncf,serieDoc);//Aqui voy
              ProcesaFacturar(1, serieDoc, xcodigocte);
              flag:=True;
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
              if (GlbUsaSecNCF2018 = 0) then
              GlbDescNCF   := dmFactura.ibQryViewNCFDESCRIPCION.Value
              else
              GlbDescNCF   := dmFactura.ibQryViewNCFDESCRIPCION_2018.Value;
              
                if Totales.State = dsBrowse then
                Totales.Edit;

                if Totales.State In [dsInsert, dsEdit] then
                begin
                  Totales.Edit;
                  Totalesncf_numero.Value := valorNCF;
                  TotalesqrLabelNcfDesc.Value:=GlbDescNCF;
                  //GlbDescNCF:='';
                  if not LlenandoDatos then
                  Totales.Post;
                end;
                //finally
                //end;
              //*************************             ******************************
                if (GlbUsaSecNCF2018 = 0) then
                GlbDescNCF:=dmFactura.ibQryViewNCFDESCRIPCION.Value
                else
                GlbDescNCF:=dmFactura.ibQryViewNCFDESCRIPCION_2018.Value;

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
      if not GLBEsImp then
      begin
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
      end;
      Estatus1Click(Self);
      ProcActualizaMsg;
      dmcalculos.ProcDeletePosExtraDet(GlbNumVtaPOS);
      GlbNumVtaPOS:=-1;
      GlbNumeroTrn:=-1;
      xCodProd:=-1;
      GLBEsImp:=False;
      exit; //Salir cuando es version fiscal 
    end;
    //stpProc_InsertaVentaAuto.Params[0].Value
    //stpProc_InsertaVentaAuto.params[0].Value

      //Solicitar ecf a la DGII
    if (GlbActivaECF = 1) and (5=5) and (CheckBox1.Checked) then //Factura a credito ecf
    begin
      if (CheckBox1.Checked) and (ipStpInsertVentMast.Params[0].Value > 0) then
      DgiiSolicitareCF(ipStpInsertVentMast.Params[0].Value);
    end;

    if (edtMontoInicial.Text <> '') then
    begin
      ImprimeFactura8_5Farmacia(stpProc_InsertaVentaAuto.Params[0].Value,'CONTADO','','Facturas');
    end else
    UImpresionVentas.ImprimeDocumento(serieDoc);//Imprimir factura a credito

    if GlbFactRecurrente then
    ProcFacturaRecurrente(xcodigocte,rxVentaFecha.Value,ipStpInsertVentMast.Params[0].Value, serieDoc, GlbRutaFactRecurr, xnumprogrec);
    GlbRutaFactRecurr:= '';

  //aquivoyDios y Señor te imploro que envies los angeles ayudantes de la mente en mi auxilio. Gracias. AMEN.
  serieDoc:=-1;
  Serie_Asignadoncf:=-1;
  dmcalculos.ProcDeletePosExtraDet(GlbNumVtaPOS);
  GlbNumVtaPOS:=-1;
  GlbNumeroTrn:=-1;
  xCodProd:=-1;  
  Totales.Edit;
  TotalesReferenciaCte.Value:='';
  dmventas.tblLineaComentario.Close;
  dmventas.tblLineaComentario.Params[0].Value:=-1;
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
  rxspinImpCantCopias.Text:='0';
  GlbNumVtaPOSTmp:=-1;
  _TienepagoTarjeta:=False;
  reciboImpreso:=True;
  dmVentas.qryPrecioMaxInv.Close;
  dmVentas.qryPrecioMaxInv.Params[0].Value:= GlbCia_Key;
  dmVentas.qryPrecioMaxInv.Open;
  
  if GlbCantCopias > 0 then
  rxspinImpCantCopias.Value :=GlbCantCopias;
  if CerrarVentana then
  close;
end;

procedure TfrmProcVentaRapida.BuscarCliente1Click(Sender: TObject);
begin
  LogProcedure('TfrmProcVentaRapida.BuscarCliente1Click');
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
  LogProcedure('TfrmProcVentaRapida.Cotizar1Click');
  BitBtn8Click(Self)
end;

procedure TfrmProcVentaRapida.BitBtn8Click(Sender: TObject);
var
  flag, trnExiste: Boolean;
  numCtz: Integer;
begin
  if EsModificandoFactura And Not EsModificandoCotiza then
  begin
    MessageDlg('No puede usar esta opción modificando transacción.', mtInformation, [mbok], 0);
    Exit;
  end;

  if (EsDevolucion) And (rxVenta.RecordCount > 0) then
  begin
    MessageDlg('Estas en modo devolución, transacción no puede ' + #13 +
      'ser procesada como venta, verifique.', mtInformation, [mbok], 0);
    Exit;
  end;

  trnExiste := False;

  dmDatos.qryMembrete.Close;
  dmDatos.qryMembrete.Params[0].Value := glbCia_Key;
  dmDatos.qryMembrete.Open;

  if rxVenta.RecordCount = 0 then
  begin
    MessageDlg('No puedes guardar sin detalle, verifique.', mtInformation, [mbok], 0);
    Exit;
  end;

  if not VerificaRecordsVenta then
  begin
    MessageDlg('Debe existir al menos un record activo, verifique.', mtInformation, [mbok], 0);
    Exit;
  end;

  if tablaPropietario.State in [dsEdit, dsInsert] then
    tablaPropietario.Post;

  if (tablaPropietario.RecordCount = 0) or (tablaPropietarioCodigoPropietario.Value = 0) then
  begin
    MessageDlg('Favor seleccionar cliente', mtInformation, [mbOK], 0);
    if isShowing then
      rxdbLookupCte.SetFocus;
    BitBtn6.Enabled := True;
    Exit;
  end;

  if not ValidaSubTotal then
    Exit;

  GlbRutaLogoDoc := '';
  if GetFormatoTipoDoc(2, GlbRutaLogoDoc) then
    GlbDocStandar := 1
  else
    GlbDocStandar := 0;

  if rxpagos.State = dsBrowse then
  begin
    if rxpagos.RecordCount > 0 then
    begin
      rxpagos.First;
      dmPagosTarjeta.tblDetPagosRevisar.Close;
      dmPagosTarjeta.tblDetPagosRevisar.Params[0].Value := ExtraerFecha(GlbFechaTrnDiaria);
      dmPagosTarjeta.tblDetPagosRevisar.Open;
      while not rxPagos.Eof do
      begin
        if dmPagosTarjeta.tblDetPagosRevisar.Locate('serie', rxPagosSerie.Value, []) then
          dmPagosTarjeta.tblDetPagosRevisar.Delete;
        rxPagos.Next;
      end;
      GlbSalvarQuery(dmPagosTarjeta.tblDetPagosRevisar);
      rxpagos.EmptyTable;
    end;
  end;

  if not rxVentaNumeroCotiza.IsNull then
  begin
    GlbUsandoCotiza := False;
    _NumeroCotiza := rxVentaNumeroCotiza.Value;
    numCtz := rxVentaNumeroCotiza.Value;

    if (rxVentaCantPax.Value > 0) and (Edit1.Text = '') then
    begin
      MessageDlg('Indique monto Depósito o entre valor 0(cero)', mtInformation, [mbYes, mbNo], 0);
      if isShowing then
        Edit1.SetFocus;
    end;

    if MessageDlg('Mantener número cotización?', mtInformation, [mbYes, mbNo], 0) = mrYes then
    begin
      ActualizaCotizacionMaster;
      rxVenta.DisableControls;
      rxVenta.First;
      RxDBGrid1.DisableScroll;

      while not rxVenta.Eof do
      begin
        if (rxVentaStatus.Value = 'C') then
        begin
          ibsqlDeleteSerieCotizaDet.Params[0].Value := rxVentaSerie.Value;
          ibsqlDeleteSerieCotizaDet.Params[1].Value := rxVentaNumeroCotiza.Value;
          ibsqlDeleteSerieCotizaDet.ExecQuery;
        end
        else if (rxVentaStatus.Value = 'I') then
          InsertarCotizacionDet(_NumeroCotiza)
        else
          InsertarCotizacionDetUpd(ibstpUpdateCotizaMaster.Params[33].Value, rxVentaSerie.Value);

        rxVenta.Next;
      end;

      if not stpProcUpdteCotDet.Transaction.InTransaction then
        stpProcUpdteCotDet.Transaction.StartTransaction;
      try
        stpProcUpdteCotDet.Transaction.CommitRetaining;
      except
        stpProcUpdteCotDet.Transaction.RollbackRetaining;
      end;

      RxDBGrid1.EnableScroll;
      rxVenta.EnableControls;

      dmfactura.qryRepCotizaNew.Close;
      dmfactura.qryRepCotizaNew.Params[0].Value := numCtz;
      dmfactura.qryRepCotizaNew.Open;

      if (GlbPorcPropina > 0) then
        ActFastFoodTicket(NumTicketFFood);
      NumTicketFFood := -1;

      if GlbActivaIFiscal = 1 then
      begin
        dmDatos.qryMembrete.Close;
        dmDatos.qryMembrete.Params[0].Value := glbCia_Key;
        dmDatos.qryMembrete.Open;

        UImprimeCotizaFiscal.xNumCotizacion := numCtz;
        dmcotizafiscal.ProcInsCtrlImpCotiFiscal(numCtz);
        UImprimeCotizaFiscal.ImprimircotizaFiscal;
        UImprimeCotizaFiscal.Imprimedoc;

        BitBtn1.Enabled := False;
        BitBtn9.Enabled := False;
        BitBtn8.Enabled := False;
        BitBtn17.Enabled := False;
        repeat
          dmcotizafiscal.ProcInsCtrlImpCotiFiscal(numCtz);
          Application.ProcessMessages;
        until not GlbImprimiendo;
        BitBtn1.Enabled := True;
        BitBtn9.Enabled := True;
        BitBtn8.Enabled := True;
        BitBtn17.Enabled := True;

        EsModificandoCotiza := True;
        Label36.Caption := '';
        GlbUsandoCotiza := False;

        if (GlbNumVtaPOS > 0) then
          dmcalculos.ProcDeletePosExtraDet(GlbNumVtaPOS);
        GlbNumVtaPOS := -1;
        GlbNumeroTrn := -1;
        xCodProd := -1;
      end
      else
      begin
        dmfactura.qryRepCotizaNew.Close;
        dmfactura.qryRepCotizaNew.Params[0].Value := numCtz;
        dmfactura.qryRepCotizaNew.Open;

        if (GlbFarmacia = 1) and (GlbFact55Pulg = 1) then
        begin
          qckCotServ8_5Farmacia := TqckCotServ8_5Farmacia.Create(Nil);
          try
            if (not DirectoryExists('Informes')) then
              CreateDir('Informes');
            if (not DirectoryExists(GlbRutaCotizaciones)) then
              CreateDir(GlbRutaCotizaciones);

            if CheckBox2.Checked then
              ReportExport(qckCotServ8_5Farmacia,
                GlbRutaCotizaciones + 'Cotizacion_' +
                dmfactura.qryRepCotizaNewNOMBRE_FACTURAR.Value + '_' +
                dmfactura.qryRepCotizaNewNUMERO.AsString + '.pdf');

            if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
            begin
              qckCotServ8_5Farmacia.PrinterSetup;
              qckCotServ8_5Farmacia.Print;
            end
            else
              qckCotServ8_5Farmacia.Preview;
          finally
            qckCotServ8_5Farmacia.Free;
            qckCotServ8_5Farmacia := Nil;
          end;

          if CheckBox2.Checked then
            ShellExecute(0, nil, PChar(glbZipFile), '', '', SW_SHOWNORMAL);
        end
        else if (UpperCase(GLBFormatoFactura) = 'FORMAFACOCO') and
                (GLBCOTI55EST = 'COTI5.5EST') then
        begin
          qckCotizacion8_55 := TqckCotizacion8_55.Create(Nil);
          try
            if (GlbRutaCotizaciones <> '') then
            begin
              if (not DirectoryExists(GlbRutaCotizaciones)) then
                CreateDir(GlbRutaCotizaciones);
            end
            else
            begin
              if (not DirectoryExists('Informes')) then
                CreateDir('Informes');
              if (not DirectoryExists('Informes\Cotizaciones')) then
                CreateDir('Informes\Cotizaciones');
            end;

            frmImprimir := TfrmImprimir.Create(nil);
            try
              qckCotizacion8_55.Prepare;
              glbTPag := qckCotizacion8_55.PageNumber;
              if frmImprimir.Showmodal = mrOk then
              begin
                if frmImprimir.RadioGroup1.ItemIndex = 0 then
                  qckCotizacion8_55.Page.PaperSize := Letter;
                if frmImprimir.RadioButton1.Checked then
                begin
                  qckCotizacion8_55.PrinterSetup;
                  qckCotizacion8_55.Print;
                end
                else
                  qckCotizacion8_55.Preview;
              end;
            finally
              frmImprimir.Free;
              frmImprimir := Nil;
            end;
          finally
            if CheckBox2.Checked then
              ReportExport(qckCotizacion8_55,
                GlbRutaCotizaciones + '\Cotizacion_' +
                dmfactura.qryRepCotizaNewNOMBRE_ABREV.Value +
                dmfactura.qryRepCotizaNewNUMERO.AsString + '.pdf');

            qckCotizacion8_55.Free;
            qckCotizacion8_55 := Nil;
          end;
        end
        else if (UpperCase(GLBFormatoFactura) = 'FORMAFACOCO') then
        begin
          qckCotServ8_5AyacoRep := TqckCotServ8_5AyacoRep.Create(Nil);
          try
            qckCotServ8_5AyacoRep.Prepare;
            qckCotServ8_5AyacoRep.totalPag := qckCotServ8_5AyacoRep.PageNumber;

            if (GlbRutaCotizaciones <> '') then
            begin
              if (not DirectoryExists(GlbRutaCotizaciones)) then
                CreateDir(GlbRutaCotizaciones);
            end
            else
            begin
              if (not DirectoryExists('Informes')) then
                CreateDir('Informes');
              if (not DirectoryExists('Informes\Facturas')) then
                CreateDir('Informes\Facturas');
            end;

            ProgressBar1.Visible := False;
            frmImprimir := TfrmImprimir.Create(nil);
            try
              if frmImprimir.Showmodal = mrOk then
              begin
                if frmImprimir.RadioGroup1.ItemIndex = 0 then
                  qckCotServ8_5AyacoRep.Page.PaperSize := Letter;
                if frmImprimir.RadioButton1.Checked then
                begin
                  qckCotServ8_5AyacoRep.PrinterSetup;
                  qckCotServ8_5AyacoRep.Print;
                end
                else
                  qckCotServ8_5AyacoRep.Preview;
              end;
            finally
              frmImprimir.Free;
              frmImprimir := Nil;
            end;
          finally
            if GlbImpPDF then
              ReportExport(qckCotServ8_5AyacoRep,
                GlbRutaCotizaciones + '\Cotizacion' +
                dmfactura.qryRepCotizaNewNOMBRE_ABREV.Value +
                dmfactura.qryRepCotizaNewNUMERO.AsString + '.pdf');

            qckCotServ8_5AyacoRep.Free;
            qckCotServ8_5AyacoRep := Nil;
          end;

          if GlbImpPDF then
            ShellExecute(0, nil, PChar(
              ExtractFilePath(Application.ExeName) +
              GlbRutaCotizaciones + '\Cotizacion' +
              dmfactura.qryRepCotizaNewNOMBRE_ABREV.Value +
              dmfactura.qryRepCotizaNewNUMERO.AsString + '.pdf'),
              '', '', SW_SHOWNORMAL);

          EsModificandoFactura := False;
        end
        else if (UpperCase(GLBFormatoFactura) = 'FORMAEXPLODISMAR') then
        begin
          qckCotizaServ8_5EXDMar := TqckCotizaServ8_5EXDMar.Create(Nil);
          try
            qckCotizaServ8_5EXDMar.Prepare;
            glbTPag := qckCotizaServ8_5EXDMar.PageNumber;

            if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
            begin
              qckCotizaServ8_5EXDMar.PrinterSetup;
              qckCotizaServ8_5EXDMar.Print;
            end
            else
              qckCotizaServ8_5EXDMar.Preview;

            if CheckBox2.Checked then
              ReportExport(qckCotizaServ8_5EXDMar,
                GlbRutaCotizaciones + '\Cotizacion' +
                dmfactura.qryRepCotizaNewNUMERO.AsString + '.pdf');
          finally
            qckCotizaServ8_5EXDMar.Free;
            qckCotizaServ8_5EXDMar := Nil;
          end;
        end
        else if (GlbDocStandar = 1) then
        begin
          qckCotServ8_5Standar := TqckCotServ8_5Standar.Create(Nil);
          try
            if (not DirectoryExists('Informes')) then
              CreateDir('Informes');
            if (not DirectoryExists('Informes\Cotizaciones')) then
              CreateDir('Informes\Cotizaciones');

            if CheckBox2.Checked then
              ReportExport(qckCotServ8_5Standar,
                GlbRutaCotizaciones + '\Cotizacion_' +
                dmfactura.qryRepCotizaNewNOMBRE_ABREV.Value +
                dmfactura.qryRepCotizaNewNUMERO.AsString + '.pdf');

            if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
            begin
              qckCotServ8_5Standar.PrinterSetup;
              qckCotServ8_5Standar.Print;
            end
            else
              qckCotServ8_5Standar.Preview;
          finally
            qckCotServ8_5Standar.Free;
            qckCotServ8_5Standar := Nil;
          end;

          if CheckBox2.Checked then
            ShellExecute(0, nil, PChar(
              ExtractFilePath(Application.ExeName) +
              'Informes\Cotizaciones\Cotizacion_' +
              dmfactura.qryRepCotizaNewNOMBRE_ABREV.Value +
              dmfactura.qryRepCotizaNewNUMERO.AsString + '.pdf'),
              '', '', SW_SHOWNORMAL);
        end
        else if ((GlBAyaco = 1) or (GlBTapiceria = 1) or (GlBInveraf = 1)) then
        begin
          qckCotServ8_5Ayaco := TqckCotServ8_5Ayaco.Create(Nil);
          try
            if (not DirectoryExists(GlbRutaCotizaciones)) then
              CreateDir(GlbRutaCotizaciones);

            if GlbImpPDF then
              ReportExport(qckCotServ8_5Ayaco,
                GlbRutaCotizaciones + '\Cotizacion' +
                dmfactura.qryRepCotizaNewNOMBRE_ABREV.Value +
                dmfactura.qryRepCotizaNewNUMERO.AsString + '.pdf');

            if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
            begin
              qckCotServ8_5Ayaco.PrinterSetup;
              qckCotServ8_5Ayaco.Print;
            end
            else
              qckCotServ8_5Ayaco.Preview;
          finally
            qckCotServ8_5Ayaco.Free;
            qckCotServ8_5Ayaco := Nil;
          end;

          if GlbImpPDF then
            ShellExecute(0, nil, PChar(
              ExtractFilePath(Application.ExeName) +
              GlbRutaCotizaciones + '\Cotizacion' +
              dmfactura.qryRepCotizaNewNOMBRE_ABREV.Value +
              dmfactura.qryRepCotizaNewNUMERO.AsString + '.pdf'),
              '', '', SW_SHOWNORMAL);
        end
        else if (UpperCase(GLBFormatoFactura) = 'FORMATOGENERAL') then
        begin
          if (GlBAyaco = 1) or (GlBTapiceria = 1) or (GlBInveraf = 1) then
          begin
            qckCotServ8_5Ayaco := TqckCotServ8_5Ayaco.Create(Nil);
            try
              if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
              begin
                qckCotServ8_5Ayaco.PrinterSetup;
                qckCotServ8_5Ayaco.Print;
              end
              else
                qckCotServ8_5Ayaco.Preview;

              if GlbImpPDF then
                ReportExportPDF(qckCotServ8_5Ayaco,
                  GlbRutaCotizaciones + '\Cotizacion' + IntToStr(_NumeroCotiza) + '.pdf');
            finally
              qckCotServ8_5Ayaco.Free;
              qckCotServ8_5Ayaco := Nil;
            end;
          end
          else
          begin
            qckCotiza8_5_FormG := TqckCotiza8_5_FormG.Create(Nil);
            try
              if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
              begin
                qckCotiza8_5_FormG.PrinterSetup;
                qckCotiza8_5_FormG.Print;
              end
              else
                qckCotiza8_5_FormG.Preview;
            finally
              qckCotiza8_5_FormG.Free;
              qckCotiza8_5_FormG := Nil;
            end;
          end;
        end
        else if (GlbCot3Pulg = 1) then
        begin
          qckCotizacion3Pulg := TqckCotizacion3Pulg.Create(Nil);
          try
            qckCotizacion3Pulg.Prepare;
            flag := True;

            if (dmfactura.qryRepCotizaNew.RecordCount > 1) or
               (qckCotizacion3Pulg.PageNumber > 1) then
            begin
              repeat
                begin
                  if (qckCotizacion3Pulg.PageNumber > 1) then
                  begin
                    qckCotizacion3Pulg.Page.Length := qckCotizacion3Pulg.Page.Length + 0.25;
                    qckCotizacion3Pulg.Prepare;
                    flag := False;
                  end
                  else
                    Break;
                end;
              until flag = True;
            end;

            glbTPag := qckCotizacion3Pulg.PageNumber;
            dmDatos.qryImpresoras.Close;
            dmDatos.qryImpresoras.Open;
            if dmDatos.qryImpresoras.Locate('IDMODULO;IDREPORTE',
              VarArrayOf([1, 9]), []) then
              qckCotizacion3Pulg.PrinterSettings.PrinterIndex :=
                GetImpresora(dmDatos.qryImpresorasNOMBRE_IMPRESORA.Value);

            if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
            begin
              qckCotizacion3Pulg.PrinterSetup;
              qckCotizacion3Pulg.Print;
            end
            else
              qckCotizacion3Pulg.Preview;

            if (not DirectoryExists('Informes')) then
              CreateDir('Informes');
            if (not DirectoryExists('Informes\Cotizaciones')) then
              CreateDir('Informes\Cotizaciones');

            if CheckBox2.Checked then
              ReportExport(qckCotizacion3Pulg,
                GlbRutaCotizaciones + '\Cotización' +
                dmfactura.qryRepCotizaNewNUMERO.AsString + '.pdf');
          finally
            qckCotizacion3Pulg.Free;
            qckCotizacion3Pulg := Nil;
          end;
        end
        else
        begin
          qckCotiza8_5_FormG := TqckCotiza8_5_FormG.Create(Nil);
          try
            if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
            begin
              qckCotiza8_5_FormG.PrinterSetup;
              qckCotiza8_5_FormG.Print;
            end
            else
              qckCotiza8_5_FormG.Preview;
          finally
            qckCotiza8_5_FormG.Free;
            qckCotiza8_5_FormG := Nil;
          end;
        end;
      end;

      if (GlbNumVtaPOS > 0) then
        dmcalculos.ProcDeletePosExtraDet(GlbNumVtaPOS);
      GlbNumVtaPOS := -1;
      GlbNumeroTrn := -1;
      xCodProd := -1;
      lblFechaCotizacion.Visible := False;
      dbFechaCotizacion.Visible := False;
      Label36.Visible := False;
      Label36.Caption := '';
      EsModificandoCotiza := False;
      GlbUsandoCotiza := False;
      _NumeroCotiza := -1;

      if InactivaImprecibo then
        GlbImprimeReciboFact := 0;
      InactivaImprecibo := False;

      if EsDevolucion then
        BitBtn7Click(Self);

      sumarDatos := True;
      ActualizarPreventa;
      qryProdPorProveedor.Close;
      pnlPrecioProv.Visible := False;
      EsModificandoFactura := False;
      InicializaOtrosDesc;
      Application.ProcessMessages;

      rxVenta.EmptyTable;
      Totales.Edit;
      TotalesReferenciaCte.Value := '';
      dmventas.tblLineaComentario.Close;
      dmventas.tblLineaComentario.Params[0].Value := -1;

      lblTotalItem.Caption := 'Total Items:' + IntToStr(rxVenta.RecordCount);
      Edit1.Text := '';
      rxPagos.Close;
      rxPagos.EmptyTable;
      rxPagos.Open;
      edtCodigo.Text := '';
      pesoProd := '';
      BitBtn4.Enabled := False;
      ProcesandoVenta := False;

      if isShowing then
        BitBtn1.SetFocus;

      Totales.EmptyTable;
      rxPagos.EmptyTable;
      tablaPropietario.Edit;
      tablaPropietarioCodigoPropietario.AsVariant := null;
      tablaPropietario.Post;

      if isShowing then
        if not edtCodigo.Focused then
          if not EsModificandoCotiza then
            if imbBarcode.Visible then
            begin
              edtCodigo.SetFocus;
              PostMessage(edtCodigo.Handle, WM_SETFOCUS, 0, 0);
            end;

      edtObservacion.Text := '';
      xCodigoCte := 0;
      ActualizarRecoverData;
      qryProdPorProveedor.Close;
      pnlPrecioProv.Visible := False;
      _NumeroCotiza := -1;
      EsModificandoCotiza := False;
      Label36.Visible := False;
      Label36.Caption := '';
      lblFechaCotizacion.Visible := False;
      dbFechaCotizacion.Visible := False;
      EsModificandoCotiza := False;
      _NumeroCotiza := -1;
      Exit;
    end;
  end;

  if (tablaPropietarioCodigoPropietario.IsNull) then
  begin
    MessageDlg('Antes debe indicar el cliente, verifique.', mtInformation, [mbOK], 0);
    Exit;
  end;

  if (rdgFactServicio.Checked and rdgFactVentaProducto.Checked) and
     (rxventa.RecordCount > 0) then
  begin
    MessageDlg('Favor indicar tipo de Operación', mtInformation, [mbOK], 0);
    if isShowing then
      rdgFactServicio.SetFocus;
    Exit;
  end;

  if (xCodigoCte = 0) and (tablaPropietarioCodigoPropietario.Value > 0) then
    xCodigoCte := tablaPropietarioCodigoPropietario.Value;

  if Totales.State = dsbrowse then
    Totales.Edit;
  TotalesCodCliente.Value := xCodigoCte;

  if xCodigoCte > 0 then
  begin
    qryCliente.Locate('CODIGO_CTE', xCodigoCte, []);
    TotalesNombreCliente.Value := qryClienteNOMBRE_CTE.Value;
    TotalesDireccion.Value := qryClienteDIRECCION_CONT.Value;
    TotalesTelefono.Value := qryClienteTELEF_CONTACTO.Value;
    TotalesCodCliente.Value := qryClienteCODIGO_CTE.Value;
    TotalesRNC_NUMERO.Value := qryClienteRNC_NUMERO.Value;
    if not LlenandoDatos then
      Totales.Post;
  end;

  if (GlbIgI = 0) then
    CheckBox1.Checked := True;

  ipStpInsertCotizaMast.Params[1].Value := GlbFechaTrnDiaria;
  ipStpInsertCotizaMast.Params[2].Value := GlbFechaTrnDiaria + 30;

  if qryClienteCOD_VENDEDOR.Value > 0 then
    GlbcodVendedor := qryClienteCOD_VENDEDOR.Value
  else
    GlbcodVendedor := VarUsuarioGlb;

  if not tablaPropietarioCodigoPropietario.IsNull then
    ipStpInsertCotizaMast.Params[3].Value := tablaPropietarioCodigoPropietario.Value
  else
    ipStpInsertCotizaMast.Params[3].Value := 0;

  if (GlbcodVendedor > 0) then
    ipStpInsertCotizaMast.Params[4].Value := GlbcodVendedor
  else
    ipStpInsertCotizaMast.Params[4].Value := VarUsuarioGlb;

  ipStpInsertCotizaMast.Params[5].Value := 'Cotizacion';

  if not TotalesMoneda.IsNull then
    ipStpInsertCotizaMast.Params[6].Value := TotalesMoneda.Value
  else
    ipStpInsertCotizaMast.Params[6].Value := '1';

  ipStpInsertCotizaMast.Params[7].Value := Totalestotalneto.Value;
  ipStpInsertCotizaMast.Params[8].Value := 'A';
  ipStpInsertCotizaMast.Params[9].Value := Now;
  ipStpInsertCotizaMast.Params[10].AsString := Trim(StrUserName);
  ipStpInsertCotizaMast.Params[11].Value := Null;
  ipStpInsertCotizaMast.Params[12].Value := Null;
  ipStpInsertCotizaMast.Params[13].Value := Null;
  ipStpInsertCotizaMast.Params[14].Value := Null;
  ipStpInsertCotizaMast.Params[15].Value := Null;
  ipStpInsertCotizaMast.Params[16].Value := TotalesSubTotal.Value;
  ipStpInsertCotizaMast.Params[17].Value := TotalesPorcDesAdicional.Value;

  if TotalesMontoDescAdicional.Value > 0 then
    ipStpInsertCotizaMast.Params[18].Value := TotalesMontoDescAdicional.Value
  else
    ipStpInsertCotizaMast.Params[18].Value := TotalesMontoDescItems.Value;

  if (rxVentaCantPax.Value > 0) and (Edit1.Text <> '') then
    ipStpInsertCotizaMast.Params[19].Value := StrToFloat(Edit1.Text)
  else
    ipStpInsertCotizaMast.Params[19].Value := 0;

  if (edtObservacion.Text <> '') then
    ipStpInsertCotizaMast.Params[20].Value := edtObservacion.Text
  else
    ipStpInsertCotizaMast.Params[20].Value := '';

  ipStpInsertCotizaMast.Params[21].Value := 0;
  ipStpInsertCotizaMast.Params[22].Value := 0;
  ipStpInsertCotizaMast.Params[23].Value := Totalesitbis.Value;
  ipStpInsertCotizaMast.Params[24].Value := TotalesMontoDescGastosAdmin.Value;
  ipStpInsertCotizaMast.Params[25].Value := TotalesMontoDescItbisGastosAdmin.Value;
  ipStpInsertCotizaMast.Params[26].Value := TotalesMontoDescTransp.Value;
  ipStpInsertCotizaMast.Params[27].Value := TotalesMontoDescDirtecnica.Value;
  ipStpInsertCotizaMast.Params[28].Value := TotalesMontoDescItbisDirTecnica.Value;
  ipStpInsertCotizaMast.Params[29].Value := TotalesMontoDescImprevisto.Value;
  ipStpInsertCotizaMast.Params[30].Value := TotalesMontoDescItbisImprevisto.Value;

  if rdgFactServicio.Checked then
    ipStpInsertCotizaMast.Params[31].Value := 0
  else
    ipStpInsertCotizaMast.Params[31].Value := 1;

  ipStpInsertCotizaMast.Params[32].Value := Null;
  if chKDescuentoGlobal.Checked then
    ipStpInsertCotizaMast.Params[32].Value := 1
  else if CheckBox3.Checked then
    ipStpInsertCotizaMast.Params[32].Value := 2;

  if not TotalesComentario.IsNull then
    ipStpInsertCotizaMast.Params[33].Value := TotalesComentario.AsVariant
  else
    ipStpInsertCotizaMast.Params[33].Value := '';

  ipStpInsertCotizaMast.Params[34].Value := TotalesReferenciaCte.Value;
  ipStpInsertCotizaMast.Params[35].Value := TotalesRecargo.Value;
  ipStpInsertCotizaMast.Params[36].Value := TotalesTIPONCFIFiscal.Value;
  ipStpInsertCotizaMast.Params[37].Value := TotalesMontoExoneraITBIS.Value;
  ipStpInsertCotizaMast.Params[38].Value := GlbPorcPropina;
  ipStpInsertCotizaMast.Params[39].Value := TotalesPropina.Value;
  ipStpInsertCotizaMast.Params[40].Value := TotalesPropinaLegal.Value;

  if (UpperCase(GLBFormatoFactura) = 'FORMAFACOCO') and
     (GLBCOTI55EST = 'COTI5.5RESP') then
  begin
    frmDatosVeh := TfrmDatosVeh.Create(nil);
    try
      if frmDatosVeh.ShowModal = mrOk then
      begin
        ipStpInsertCotizaMast.Params[41].Value := frmDatosVeh.rxDataCODZON.Value;
        ipStpInsertCotizaMast.Params[42].Value := 1;
        ipStpInsertCotizaMast.Params[43].Value := frmDatosVeh.rxDataIMPCOT.Value;
        ipStpInsertCotizaMast.Params[44].Value := frmDatosVeh.rxDataMARCOT.Value;
        ipStpInsertCotizaMast.Params[45].Value := frmDatosVeh.rxDataMODCOT.Value;
        ipStpInsertCotizaMast.Params[46].Value := frmDatosVeh.rxDataCHACOT.Value;
        ipStpInsertCotizaMast.Params[47].Value := frmDatosVeh.rxDataKILCOT.Value;
        ipStpInsertCotizaMast.Params[48].Value := frmDatosVeh.rxDataPLACOT.Value;
        ipStpInsertCotizaMast.Params[49].Value := frmDatosVeh.rxDataANOCOT.Value;
        ipStpInsertCotizaMast.Params[50].Value := frmDatosVeh.rxDataCOLCOT.Value;
      end
      else
      begin
        ipStpInsertCotizaMast.Params[41].Value := Null;
        ipStpInsertCotizaMast.Params[42].Value := Null;
        ipStpInsertCotizaMast.Params[43].Value := Null;
        ipStpInsertCotizaMast.Params[44].Value := Null;
        ipStpInsertCotizaMast.Params[45].Value := Null;
        ipStpInsertCotizaMast.Params[46].Value := Null;
        ipStpInsertCotizaMast.Params[47].Value := Null;
        ipStpInsertCotizaMast.Params[48].Value := Null;
        ipStpInsertCotizaMast.Params[49].Value := Null;
        ipStpInsertCotizaMast.Params[50].Value := Null;
      end;
    finally
      frmDatosVeh.Free;
      frmDatosVeh := nil;
    end;
  end
  else
  begin
    ipStpInsertCotizaMast.Params[41].Value := Null;
    ipStpInsertCotizaMast.Params[42].Value := Null;
    ipStpInsertCotizaMast.Params[43].Value := Null;
    ipStpInsertCotizaMast.Params[44].Value := Null;
    ipStpInsertCotizaMast.Params[45].Value := Null;
    ipStpInsertCotizaMast.Params[46].Value := Null;
    ipStpInsertCotizaMast.Params[47].Value := Null;
    ipStpInsertCotizaMast.Params[48].Value := Null;
    ipStpInsertCotizaMast.Params[49].Value := Null;
    ipStpInsertCotizaMast.Params[50].Value := Null;
  end;

  ipStpInsertCotizaMast.ExecProc;
  Totales.Tag := ipStpInsertCotizaMast.Params[0].Value;

  dmcotizafiscal.ibsqlUpdLcomentarioCoti.Params[0].Value := GlbNumVtaPOS;
  dmcotizafiscal.ibsqlUpdLcomentarioCoti.ExecQuery;

  ProcUpdateNumDLinea(GlbNumVtaPOS, ipStpInsertCotizaMast.Params[0].Value, 2);

  if not ipStpInsertCotizaMast.Transaction.InTransaction then
    ipStpInsertCotizaMast.Transaction.StartTransaction;
  try
    ipStpInsertCotizaMast.Transaction.CommitRetaining;
  except
    ipStpInsertCotizaMast.Transaction.RollbackRetaining;
  end;

  dmfactura.ibstpInsertarPorcOtrosCargosCotiza.Params[0].Value := ipStpInsertCotizaMast.Params[0].Value;
  dmfactura.ibstpInsertarPorcOtrosCargosCotiza.Params[1].Value := TotalesTPorcGAdmin.Value;
  dmfactura.ibstpInsertarPorcOtrosCargosCotiza.Params[2].Value := TotalesTPorcItbisGAdmin.Value;
  dmfactura.ibstpInsertarPorcOtrosCargosCotiza.Params[3].Value := TotalesTPorcTrans.Value;
  dmfactura.ibstpInsertarPorcOtrosCargosCotiza.Params[4].Value := TotalesTPorcDirTec.Value;
  dmfactura.ibstpInsertarPorcOtrosCargosCotiza.Params[5].Value := TotalesTPorcItbisDirTec.Value;
  dmfactura.ibstpInsertarPorcOtrosCargosCotiza.Params[6].Value := TotalesTPorcImprevisto.Value;
  dmfactura.ibstpInsertarPorcOtrosCargosCotiza.Params[7].Value := TotalesTPorcItbisImprevisto.Value;
  dmfactura.ibstpInsertarPorcOtrosCargosCotiza.ExecProc;

  if not dmfactura.ibstpInsertarPorcOtrosCargosCotiza.Transaction.InTransaction then
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
  while not rxVenta.Eof do
  begin
    if (rxVentaStatus.Value = 'C') then
    begin
      rxVenta.Next;
      Continue;
    end;
    InsertarCotizacionDet(ipStpInsertCotizaMast.Params[0].Value);
    rxVenta.Next;
  end;

  rxVenta.EnableControls;
  RxDBGrid1.EnableScroll;

  if not ibStpInsertCotizaDet.Transaction.InTransaction then
    ibStpInsertCotizaDet.Transaction.StartTransaction;
  try
    ibStpInsertCotizaDet.Transaction.CommitRetaining;
  except
    ibStpInsertCotizaDet.Transaction.RollbackRetaining;
  end;

  dmfactura.qryRepCotizaNew.Close;
  dmfactura.qryRepCotizaNew.Params[0].Value := ipStpInsertCotizaMast.Params[0].Value;
  dmfactura.qryRepCotizaNew.Open;

  if GlbActivaIFiscal = 1 then
  begin
    UImprimeCotizaFiscal.xNumCotizacion := ipStpInsertCotizaMast.Params[0].Value;
    UImprimeCotizaFiscal.ImprimircotizaFiscal;
    UImprimeCotizaFiscal.Imprimedoc;
  end
  else
  begin
    if (GlbFarmacia = 1) and (GlbFact55Pulg = 1) then
    begin
      qckCotServ8_5Farmacia := TqckCotServ8_5Farmacia.Create(Nil);
      try
        if (not DirectoryExists('Informes')) then
          CreateDir('Informes');
        if (not DirectoryExists(GlbRutaCotizaciones)) then
          CreateDir(GlbRutaCotizaciones);

        if CheckBox2.Checked then
          ReportExport(qckCotServ8_5Farmacia,
            GlbRutaCotizaciones + 'Cotizacion_' +
            dmfactura.qryRepCotizaNewNOMBRE_FACTURAR.Value + '_' +
            dmfactura.qryRepCotizaNewNUMERO.AsString + '.pdf');

        if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
        begin
          qckCotServ8_5Farmacia.PrinterSetup;
          qckCotServ8_5Farmacia.Print;
        end
        else
          qckCotServ8_5Farmacia.Preview;
      finally
        qckCotServ8_5Farmacia.Free;
        qckCotServ8_5Farmacia := Nil;
      end;

      if CheckBox2.Checked then
        ShellExecute(0, nil, PChar(glbZipFile), '', '', SW_SHOWNORMAL);
    end
    else if (UpperCase(GLBFormatoFactura) = 'FORMAFACOCO') and
            (GLBCOTI55EST = 'COTI5.5EST') and
            (GlbCot3Pulg = 0) then
    begin
      qckCotizacion8_55 := TqckCotizacion8_55.Create(Nil);
      try
        if (GlbRutaCotizaciones <> '') then
        begin
          if (not DirectoryExists(GlbRutaCotizaciones)) then
            CreateDir(GlbRutaCotizaciones);
        end
        else
        begin
          if (not DirectoryExists('Informes')) then
            CreateDir('Informes');
          if (not DirectoryExists('Informes\Cotizaciones')) then
            CreateDir('Informes\Cotizaciones');
        end;

        frmImprimir := TfrmImprimir.Create(nil);
        try
          qckCotizacion8_55.Prepare;
          glbTPag := qckCotizacion8_55.PageNumber;
          if frmImprimir.Showmodal = mrOk then
          begin
            if frmImprimir.RadioGroup1.ItemIndex = 0 then
              qckCotizacion8_55.Page.PaperSize := Letter;
            if frmImprimir.RadioButton1.Checked then
            begin
              qckCotizacion8_55.PrinterSetup;
              qckCotizacion8_55.Print;
            end
            else
              qckCotizacion8_55.Preview;
          end;
        finally
          frmImprimir.Free;
          frmImprimir := Nil;
        end;
      finally
        if CheckBox2.Checked then
          ReportExport(qckCotizacion8_55,
            GlbRutaCotizaciones + '\Cotizacion_' +
            dmfactura.qryRepCotizaNewNOMBRE_ABREV.Value +
            dmfactura.qryRepCotizaNewNUMERO.AsString + '.pdf');

        qckCotizacion8_55.Free;
        qckCotizacion8_55 := Nil;
      end;
    end
    else if (UpperCase(GLBFormatoFactura) = 'FORMAFACOCO') and
            (GlbCot3Pulg = 0) then
    begin
      qckCotServ8_5AyacoRep := TqckCotServ8_5AyacoRep.Create(Nil);
      try
        qckCotServ8_5AyacoRep.Prepare;
        qckCotServ8_5AyacoRep.totalPag := qckCotServ8_5AyacoRep.PageNumber;

        if (GlbRutaCotizaciones <> '') then
        begin
          if (not DirectoryExists(GlbRutaCotizaciones)) then
            CreateDir(GlbRutaCotizaciones);
        end
        else
        begin
          if (not DirectoryExists('Informes')) then
            CreateDir('Informes');
          if (not DirectoryExists('Informes\Cotizaciones')) then
            CreateDir('Informes\Cotizaciones');
        end;

        ProgressBar1.Visible := False;
        frmImprimir := TfrmImprimir.Create(nil);
        try
          if frmImprimir.Showmodal = mrOk then
          begin
            if frmImprimir.RadioGroup1.ItemIndex = 0 then
              qckCotServ8_5AyacoRep.Page.PaperSize := Letter;
            if frmImprimir.RadioButton1.Checked then
            begin
              qckCotServ8_5AyacoRep.PrinterSetup;
              qckCotServ8_5AyacoRep.Print;
            end
            else
              qckCotServ8_5AyacoRep.Preview;
          end;
        finally
          frmImprimir.Free;
          frmImprimir := Nil;
        end;
      finally
        if GlbImpPDF then
          ReportExport(qckCotServ8_5AyacoRep,
            GlbRutaCotizaciones + '\Cotizacion_' +
            dmfactura.qryRepCotizaNewNOMBRE_ABREV.Value +
            dmfactura.qryRepCotizaNewNUMERO.AsString + '.pdf');

        qckCotServ8_5AyacoRep.Free;
        qckCotServ8_5AyacoRep := Nil;
      end;

      if GlbImpPDF then
        ShellExecute(0, nil, PChar(
          ExtractFilePath(Application.ExeName) +
          GlbRutaCotizaciones + '\Cotizacion_' +
          dmfactura.qryRepCotizaNewNOMBRE_ABREV.Value +
          dmfactura.qryRepCotizaNewNUMERO.AsString + '.pdf'),
          '', '', SW_SHOWNORMAL);
    end
    else if (UpperCase(GLBFormatoFactura) = 'FORMAEXPLODISMAR') and
            (GlbCot3Pulg = 0) then
    begin
      qckCotizaServ8_5EXDMar := TqckCotizaServ8_5EXDMar.Create(Nil);
      try
        qckCotizaServ8_5EXDMar.Prepare;
        glbTPag := qckCotizaServ8_5EXDMar.PageNumber;

        if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
        begin
          qckCotizaServ8_5EXDMar.PrinterSetup;
          qckCotizaServ8_5EXDMar.Print;
        end
        else
          qckCotizaServ8_5EXDMar.Preview;

        if CheckBox2.Checked then
          ReportExport(qckCotizaServ8_5EXDMar,
            GlbRutaCotizaciones + '\Cotizacion' +
            dmfactura.qryRepCotizaNewNUMERO.AsString + '.pdf');
      finally
        qckCotizaServ8_5EXDMar.Free;
        qckCotizaServ8_5EXDMar := Nil;
      end;
    end
    else if (((GlBAyaco = 1) or (GlBTapiceria = 1) or (GlBInveraf = 1)) and
             (GlbCot3Pulg = 0)) then
    begin
      qckCotServ8_5Ayaco := TqckCotServ8_5Ayaco.Create(Nil);
      try
        if (not DirectoryExists('Informes')) then
          CreateDir('Informes');
        if (not DirectoryExists('Informes\Cotizaciones')) then
          CreateDir('Informes\Cotizaciones');

        if GlbImpPDF then
          ReportExport(qckCotServ8_5Ayaco,
            GlbRutaCotizaciones + '\Cotizacion' +
            dmfactura.qryRepCotizaNewNOMBRE_ABREV.Value +
            dmfactura.qryRepCotizaNewNUMERO.AsString + '.pdf');

        if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
        begin
          qckCotServ8_5Ayaco.PrinterSetup;
          qckCotServ8_5Ayaco.Print;
        end
        else
          qckCotServ8_5Ayaco.Preview;
      finally
        qckCotServ8_5Ayaco.Free;
        qckCotServ8_5Ayaco := Nil;
      end;

      if GlbImpPDF then
        ShellExecute(0, nil, PChar(
          ExtractFilePath(Application.ExeName) +
          GlbRutaCotizaciones + '\Cotizacion' +
          dmfactura.qryRepCotizaNewNOMBRE_ABREV.Value +
          dmfactura.qryRepCotizaNewNUMERO.AsString + '.pdf'),
          '', '', SW_SHOWNORMAL);
    end
    else if (GlbDocStandar = 1) then
    begin
      qckCotServ8_5Standar := TqckCotServ8_5Standar.Create(Nil);
      try
        if (not DirectoryExists('Informes')) then
          CreateDir('Informes');
        if (not DirectoryExists('Informes\Cotizaciones')) then
          CreateDir('Informes\Cotizaciones');

        if GlbImpPDF then
          ReportExport(qckCotServ8_5Standar,
            GlbRutaCotizaciones + '\Cotizacion' +
            dmfactura.qryRepCotizaNewNOMBRE_ABREV.Value +
            dmfactura.qryRepCotizaNewNUMERO.AsString + '.pdf');

        if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
        begin
          qckCotServ8_5Standar.PrinterSetup;
          qckCotServ8_5Standar.Print;
        end
        else
          qckCotServ8_5Standar.Preview;
      finally
        qckCotServ8_5Standar.Free;
        qckCotServ8_5Standar := Nil;
      end;

      if GlbImpPDF then
        ShellExecute(0, nil, PChar(
          ExtractFilePath(Application.ExeName) +
          GlbRutaCotizaciones + '\Cotizacion' +
          dmfactura.qryRepCotizaNewNOMBRE_ABREV.Value +
          dmfactura.qryRepCotizaNewNUMERO.AsString + '.pdf'),
          '', '', SW_SHOWNORMAL);
    end
    else if (GlbSizeCotiza8x11 = 0) and (GlbCot3Pulg = 0) and
            (GlbCot55Pulg = 1) and
            (UpperCase(GLBFormatoFactura) = 'FORMATOGENERAL') then
    begin
      qckCotizacion8_55 := TqckCotizacion8_55.Create(Nil);
      try
        qckCotizacion8_55.Prepare;
        glbTPag := qckCotizacion8_55.PageNumber;

        if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
        begin
          qckCotizacion8_55.PrinterSetup;
          qckCotizacion8_55.Print;
        end
        else
          qckCotizacion8_55.Preview;

        if (not DirectoryExists(GlbRutaCotizaciones + '\Cotizaciones')) then
          CreateDir(GlbRutaCotizaciones + '\Cotizaciones');

        if GlbImpPDF then
          ReportExport(qckCotizacion8_55,
            GlbRutaCotizaciones + '\Cotizacion' +
            dmfactura.qryRepCotizaNewNUMERO.AsString + '.pdf');
      finally
        qckCotizacion8_55.Free;
        qckCotizacion8_55 := Nil;
      end;
    end
    else if (UpperCase(GLBFormatoFactura) = 'FORMATOGENERAL') and
            (GlbCot3Pulg = 0) then
    begin
      qckCotiza8_5_FormG := TqckCotiza8_5_FormG.Create(Nil);
      try
        if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
        begin
          qckCotiza8_5_FormG.PrinterSetup;
          qckCotiza8_5_FormG.Print;
        end
        else
          qckCotiza8_5_FormG.Preview;
      finally
        qckCotiza8_5_FormG.Free;
        qckCotiza8_5_FormG := Nil;
      end;
    end
    else if (GlbCot3Pulg = 1) then
    begin
      qckCotizacion3Pulg := TqckCotizacion3Pulg.Create(Nil);
      try
        qckCotizacion3Pulg.Prepare;
        flag := True;

        if (dmfactura.qryRepCotizaNew.RecordCount > 1) or
           (qckCotizacion3Pulg.PageNumber > 1) then
        begin
          repeat
            begin
              if (qckCotizacion3Pulg.PageNumber > 1) then
              begin
                qckCotizacion3Pulg.Page.Length := qckCotizacion3Pulg.Page.Length + 0.25;
                qckCotizacion3Pulg.Prepare;
                flag := False;
              end
              else
                Break;
            end;
          until flag = True;
        end;

        glbTPag := qckCotizacion3Pulg.PageNumber;
        dmDatos.qryImpresoras.Close;
        dmDatos.qryImpresoras.Open;
        if dmDatos.qryImpresoras.Locate('IDMODULO;IDREPORTE',
          VarArrayOf([1,9]), []) then
          qckCotizacion3Pulg.PrinterSettings.PrinterIndex :=
            GetImpresora(dmDatos.qryImpresorasNOMBRE_IMPRESORA.Value);

        if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
        begin
          qckCotizacion3Pulg.PrinterSetup;
          qckCotizacion3Pulg.Print;
        end
        else
          qckCotizacion3Pulg.Preview;

        if (not DirectoryExists('Informes')) then
          CreateDir('Informes');
        if (not DirectoryExists('Informes\Cotizaciones')) then
          CreateDir('Informes\Cotizaciones');

        if CheckBox2.Checked then
          ReportExport(qckCotizacion3Pulg,
            GlbRutaCotizaciones + '\Cotización' +
            dmfactura.qryRepCotizaNewNUMERO.AsString + '.pdf');
      finally
        qckCotizacion3Pulg.Free;
        qckCotizacion3Pulg := Nil;
      end;
    end
    else
    begin
      qckCotiza8_5_FormG := TqckCotiza8_5_FormG.Create(Nil);
      try
        if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
        begin
          qckCotiza8_5_FormG.PrinterSetup;
          qckCotiza8_5_FormG.Print;
        end
        else
          qckCotiza8_5_FormG.Preview;
      finally
        qckCotiza8_5_FormG.Free;
        qckCotiza8_5_FormG := Nil;
      end;
    end;
  end;

  rxVenta.EmptyTable;
  lblTotalItem.Caption := 'Total Items:' + IntToStr(rxVenta.RecordCount);
  Edit1.Text := '';
  rxPagos.Close;
  rxPagos.EmptyTable;
  rxPagos.Open;
  edtCodigo.Text := '';
  pesoProd := '';
  BitBtn4.Enabled := False;
  ProcesandoVenta := False;

  if isShowing then
    BitBtn1.SetFocus;

  Totales.EmptyTable;
  rxPagos.EmptyTable;
  tablaPropietario.Edit;
  tablaPropietarioCodigoPropietario.AsVariant := null;
  tablaPropietario.Post;

  if isShowing then
    if not edtCodigo.Focused then
      if not EsModificandoCotiza then
      begin
        edtCodigo.SetFocus;
        PostMessage(edtCodigo.Handle, WM_SETFOCUS, 0, 0);
      end;

  edtObservacion.Text := '';
  xCodigoCte := 0;
  qryProdPorProveedor.Close;
  pnlPrecioProv.Visible := False;
  _NumeroCotiza := -1;
  EsModificandoCotiza := False;
  Label6.Refresh;

  lblFechaCotizacion.Visible := False;
  dbFechaCotizacion.Visible := False;
  Label36.Visible := False;
  glbcodVendedor := -1;
  EsModificandoCotiza := False;
  Label36.Caption := '';
  NoTieneCredito := False;
  chKDescuentoGlobal.Checked := False;
  rxSolDatoscte.EmptyTable;

  rxventa.EnableControls;
  rxdbgrid1.Enabled := True;
  RxDBGrid1.EnableScroll;

  label41.Visible := False;
  DBText15.Visible := True;

  if (GlbNumVtaPOS > 0) then
    dmcalculos.ProcDeletePosExtraDet(GlbNumVtaPOS);
  GlbNumVtaPOS := -1;
  xCodProd := -1;
  GlbNumVtaPOSTmp := -1;
  rxVenta.EnableControls;
  RxDBGrid1.EnableScroll;
  Refresh;
  Application.ProcessMessages;
end;

//Inicio cotizar --antes
{
procedure TfrmProcVentaRapida.BitBtn8Click(Sender: TObject);
var
  flag , trnExiste : boolean;
  numCtz:integer;
begin
  if EsModificandoFactura And Not EsModificandoCotiza then
  begin
    MessageDlg('No puede usar esta opción modificando transacción.',mtInformation,[mbok],0);
    exit;
  end;
  if (EsDevolucion) And (rxVenta.RecordCount > 0) then
  begin
    MessageDlg('Estas en modo devolución, transacción no puede '#13'ser procesada como venta, verifique.', mtInformation, [mbok], 0);
    Exit;
  end;
  trnExiste :=False;
                                           
  dmDatos.qryMembrete.Close;
  dmDatos.qryMembrete.Params[0].Value:= glbCia_Key;
  dmDatos.qryMembrete.Open;

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
     if isShowing then
     rxdbLookupCte.SetFocus;
     BitBtn6.Enabled:=True;
     Exit;
   end;

   if not ValidaSubTotal then exit;

   GlbRutaLogoDoc:='';
   if GetFormatoTipoDoc(2,GlbRutaLogoDoc) then  //2	1	Cotizacion 8.5 Estandar
   GlbDocStandar:=1
   else
   GlbDocStandar:=0;

   if rxpagos.State = dsBrowse then
   begin
     if rxpagos.RecordCount > 0 then
     begin
       rxpagos.first;
       dmPagosTarjeta.tblDetPagosRevisar.close;
       dmPagosTarjeta.tblDetPagosRevisar.params[0].value:=ExtraerFecha(GlbFechaTrnDiaria);
       dmPagosTarjeta.tblDetPagosRevisar.Open;
       while not rxPagos.eof do
       begin
         if dmPagosTarjeta.tblDetPagosRevisar.locate('serie',rxPagosSerie.Value,[]) then
         dmPagosTarjeta.tblDetPagosRevisar.delete;
         rxPagos.Next;//voy por aqui jun 15 2020
       end;
       GlbSalvarQuery(dmPagosTarjeta.tblDetPagosRevisar);
       rxpagos.EmptyTable;
     end
   end;

   if Not rxVentaNumeroCotiza.IsNull then
   begin
     GlbUsandoCotiza:=False;
     _NumeroCotiza :=  rxVentaNumeroCotiza.Value;
     numCtz:= rxVentaNumeroCotiza.Value;
     if ((rxVentaCantPax.Value > 0) or (UpperCase(GLBFormatoFactura) = 'BYMSERVICIOS'))
       And (Edit1.Text = '') then
     begin
       MessageDlg('Indique monto Depósito o entre valor 0(cero)',mtInformation,[mbYes, mbNo],0);
        if isShowing then
        Edit1.SetFocus;
     end;
     if MessageDlg('Mantener número cotización?', mtInformation,[mbYes, mbNo], 0)=mrYes then
     begin
       ActualizaCotizacionMaster;
       rxVenta.DisableControls;
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
      rxVenta.EnableControls;
      dmfactura.qryRepCotizaNew.Close;
      dmfactura.qryRepCotizaNew.Params[0].Value:= numCtz;
      dmfactura.qryRepCotizaNew.Open;
      if (GlbPorcPropina > 0) then
      ActFastFoodTicket(NumTicketFFood);
      NumTicketFFood:=-1;
      if GlbActivaIFiscal = 1 then
      begin
        dmDatos.qryMembrete.Close;
        dmDatos.qryMembrete.Params[0].Value:= glbCia_Key;
        dmDatos.qryMembrete.Open;
        UImprimeCotizaFiscal.xNumCotizacion := numCtz;
        dmcotizafiscal.ProcInsCtrlImpCotiFiscal(numCtz);
        UImprimeCotizaFiscal.ImprimircotizaFiscal;
        UImprimeCotizaFiscal.Imprimedoc;
        BitBtn1.Enabled:=False;
        BitBtn9.Enabled:=False;
        BitBtn8.Enabled:=False;
        BitBtn17.Enabled:=False;
        repeat
          dmcotizafiscal.ProcInsCtrlImpCotiFiscal(numCtz);
          Application.ProcessMessages;
        until not GlbImprimiendo;
        BitBtn1.Enabled   := True;
        BitBtn9.Enabled   := True;
        BitBtn8.Enabled   := True;
        BitBtn17.Enabled  := True;
        EsModificandoCotiza:= True;
        label36.Caption:='';
        GlbUsandoCotiza:=False;
        if (GlbNumVtaPOS > 0) then
        dmcalculos.ProcDeletePosExtraDet(GlbNumVtaPOS);
        GlbNumVtaPOS:=-1;
        GlbNumeroTrn:=-1;
        xCodProd:=-1;
      end else
      begin
        //end if new modelo cotiza
        //if rdgFactServicio.Checked or rdgFactVentaProducto.Checked then
        dmfactura.qryRepCotizaNew.Close;
        dmfactura.qryRepCotizaNew.Params[0].Value:= numCtz;
        dmfactura.qryRepCotizaNew.Open;

        if (GlbFarmacia = 1) and (GlbFact55Pulg = 1) then
        begin
          qckCotServ8_5Farmacia:=TqckCotServ8_5Farmacia.Create(Nil);
          try
            if (Not DirectoryExists('Informes')) then
            CreateDir('Informes');
            if (Not DirectoryExists(GlbRutaCotizaciones)) then
            CreateDir(GlbRutaCotizaciones);

            if CheckBox2.Checked then
            ReportExport(qckCotServ8_5Farmacia,
            GlbRutaCotizaciones+ 'Cotizacion_'+dmfactura.qryRepCotizaNewNOMBRE_FACTURAR.Value+'_'+dmfactura.qryRepCotizaNewNUMERO.AsString+'.pdf');

            if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
            begin
              qckCotServ8_5Farmacia.PrinterSetup;
              qckCotServ8_5Farmacia.Print;
            end else
            qckCotServ8_5Farmacia.Preview;
          finally
          qckCotServ8_5Farmacia.Free;
          qckCotServ8_5Farmacia:=Nil;
          end;

          if CheckBox2.Checked then
          ShellExecute(0,nil,PChar(glbZipFile),'','',SW_SHOWNORMAL);

        end else
        if (UpperCase(GLBFormatoFactura) = 'FORMAFACOCO') And (GLBCOTI55EST = 'COTI5.5EST') then
        begin
          qckCotizacion8_55:=TqckCotizacion8_55.Create(Nil);
          try
           if (GlbRutaCotizaciones <> '') then
           begin
             if (Not DirectoryExists(GlbRutaCotizaciones)) then
             CreateDir(GlbRutaCotizaciones);
           end else
           begin
             if (Not DirectoryExists('Informes')) then
                 CreateDir('Informes');
             if (Not DirectoryExists('Informes')) then
                CreateDir('Informes\Cotizaciones');
           end;
           frmImprimir:=TfrmImprimir.Create(nil);
           try
             qckCotizacion8_55.Prepare;
             glbTPag :=qckCotizacion8_55.PageNumber;
             if frmImprimir.Showmodal = mrOk then
             begin
               if frmImprimir.RadioGroup1.ItemIndex = 0 then
               qckCotizacion8_55.Page.PaperSize := Letter;
               if frmImprimir.RadioButton1.Checked then
               begin
                 qckCotizacion8_55.PrinterSetup;
                 qckCotizacion8_55.Print;
               end else
               qckCotizacion8_55.Preview;
            end;
            finally
            frmImprimir.Free;
            frmImprimir:=Nil;
            end;
            finally

            if CheckBox2.Checked then
            ReportExport(qckCotizacion8_55,
            GlbRutaCotizaciones+'\Cotizacion_'+dmfactura.qryRepCotizaNewNOMBRE_ABREV.Value+dmfactura.qryRepCotizaNewNUMERO.AsString+'.pdf');

            qckCotizacion8_55.Free;
            qckCotizacion8_55:=Nil;
        end;
      end else
        if (UpperCase(GLBFormatoFactura) = 'FORMAFACOCO') then
        begin
          qckCotServ8_5AyacoRep:=TqckCotServ8_5AyacoRep.Create(Nil);
          try
            qckCotServ8_5AyacoRep.Prepare;
            qckCotServ8_5AyacoRep.totalPag :=qckCotServ8_5AyacoRep.PageNumber;

            if (GlbRutaCotizaciones <> '') then
            begin
              if (Not DirectoryExists(GlbRutaCotizaciones)) then
              CreateDir(GlbRutaCotizaciones);
            end else
            begin
              if (Not DirectoryExists('Informes')) then
                  CreateDir('Informes');
              if (Not DirectoryExists('Informes')) then
              CreateDir('Informes\Facturas');
            end;
            ProgressBar1.Visible:= False;
            frmImprimir:=TfrmImprimir.Create(nil);
            try
              if frmImprimir.Showmodal = mrOk then
              begin
                if frmImprimir.RadioGroup1.ItemIndex = 0 then
                qckCotServ8_5AyacoRep.Page.PaperSize := Letter;
                if frmImprimir.RadioButton1.Checked then
                begin
                  qckCotServ8_5AyacoRep.PrinterSetup;
                  qckCotServ8_5AyacoRep.Print;
                end else
                qckCotServ8_5AyacoRep.Preview;
              end;
            finally
            frmImprimir.Free;
            frmImprimir:=Nil;
            end;
            finally
            if GlbImpPDF then
            ReportExport(qckCotServ8_5AyacoRep,
            GlbRutaCotizaciones+'\Cotizacion'+dmfactura.qryRepCotizaNewNOMBRE_ABREV.Value+dmfactura.qryRepCotizaNewNUMERO.AsString+'.pdf');

            qckCotServ8_5AyacoRep.Free;
            qckCotServ8_5AyacoRep:=Nil;
          end;
         if GlbImpPDF then
         ShellExecute(0,nil,PChar(
         ExtractFilePath(Application.ExeName)+
         GlbRutaCotizaciones+'\Cotizacion'+dmfactura.qryRepCotizaNewNOMBRE_ABREV.Value+dmfactura.qryRepCotizaNewNUMERO.AsString+'.pdf'
         ),'','',SW_SHOWNORMAL);
         EsModificandoFactura:=False;
        end else
        if (GlBBurgos = 1) then
        begin
          qckCotiza8_5_F_1BB:=TqckCotiza8_5_F_1BB.Create(Nil);
          try
            qckCotiza8_5_F_1BB.Prepare;

            glbTPag := qckCotiza8_5_F_1BB.PageNumber;
            if MessageDlg('Imprimir?',mtInformation,[mbyes,mbno],0) = mrYes then
            begin
              qckCotiza8_5_F_1BB.PrinterSetup;
              qckCotiza8_5_F_1BB.Print;
            end else
            qckCotiza8_5_F_1BB.Preview;

            if (Not DirectoryExists(GlbRutaFacturas)) then
            CreateDir(GlbRutaFacturas);
            if (Not DirectoryExists(GlbRutaFacturas)) then
            CreateDir(GlbRutaFacturas);

         if GlbImpPDF then
         ReportExport(qckCotiza8_5_F_1BB,GlbRutaCotizaciones+'\Cotizacion'+dmfactura.qryRepCotizaNewNUMERO.AsString+'.pdf');
       finally
       qckCotiza8_5_F_1BB.Free;
       qckCotiza8_5_F_1BB:=Nil;
       end;
      //if CheckBox2.Checked then
      //ReportExport(qckCotiza8_5_F_1BB,GlbRutaCotizaciones+'\Cotizacion'+dmfactura.qryRepCotizaNewNUMERO.AsString+'.pdf');
      end else
      if (UpperCase(GLBFormatoFactura) = 'FORMAEXPLODISMAR') then
      begin
        //ImprimeFacturaEXDMAR(0,TipoVenta,'','Cotizacion');
        qckCotizaServ8_5EXDMar:=TqckCotizaServ8_5EXDMar.Create(Nil);
        try
          qckCotizaServ8_5EXDMar.Prepare;
          glbTPag := qckCotizaServ8_5EXDMar.PageNumber;

          if MessageDlg('Imprimir?',mtInformation,[mbyes,mbno],0) = mryes then
          begin
            qckCotizaServ8_5EXDMar.PrinterSetup;
            qckCotizaServ8_5EXDMar.Print;
          end else
          qckCotizaServ8_5EXDMar.Preview;
          if CheckBox2.Checked then
          ReportExport(qckCotizaServ8_5EXDMar,GlbRutaCotizaciones+'\Cotizacion'+dmfactura.qryRepCotizaNewNUMERO.AsString+'.pdf');
        finally
        qckCotizaServ8_5EXDMar.Free;
        qckCotizaServ8_5EXDMar:=Nil;
        end;
      end else
      if (GlbDocStandar = 1) then
      begin
        qckCotServ8_5Standar:=TqckCotServ8_5Standar.Create(Nil);
        try
          if (Not DirectoryExists('Informes')) then
          CreateDir('Informes');
          if (Not DirectoryExists('Informes\Cotizaciones')) then
          CreateDir('Informes\Cotizaciones');

          if CheckBox2.Checked then
             ReportExport(qckCotServ8_5SAM,
             GlbRutaCotizaciones+'\Cotizacion_'+dmfactura.qryRepCotizaNewNOMBRE_ABREV.Value+dmfactura.qryRepCotizaNewNUMERO.AsString+'.pdf');

          if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
          begin
            qckCotServ8_5Standar.PrinterSetup;
            qckCotServ8_5Standar.Print;
          end else
          qckCotServ8_5Standar.Preview;
        finally
        qckCotServ8_5Standar.Free;
        qckCotServ8_5Standar:=Nil;
        end;

        if CheckBox2.Checked then
             ShellExecute(0,nil,PChar(
             ExtractFilePath(Application.ExeName)+
            'Informes\Cotizaciones\Cotizacion_'+dmfactura.qryRepCotizaNewNOMBRE_ABREV.Value+dmfactura.qryRepCotizaNewNUMERO.AsString+'.pdf'
             ),'','',SW_SHOWNORMAL);
          end else      
      if (GLBSAM = 1) then
      begin
        //TqckCotServ8_5SAM
        btnVerSecCertificados.Visible:=True;
        MessageDlg('Aqui formato cotizacion SAM',mtInformation,[mbok],0);
      end else

      if (GlBAyaco = 1) or (GlBTapiceria = 1) or (GlBInveraf =1) then
      begin
        qckCotServ8_5Ayaco:=TqckCotServ8_5Ayaco.Create(Nil);
        try
          if (Not DirectoryExists(GlbRutaFacturas)) then
          CreateDir(GlbRutaCotizaciones);
          if (Not DirectoryExists(GlbRutaFacturas)) then
          CreateDir(GlbRutaFacturas);

         if GlbImpPDF then
             ReportExport(qckCotServ8_5Ayaco,
             GlbRutaCotizaciones+'\Cotizacion'+dmfactura.qryRepCotizaNewNOMBRE_ABREV.Value+dmfactura.qryRepCotizaNewNUMERO.AsString+'.pdf');

          if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
          begin
            qckCotServ8_5Ayaco.PrinterSetup;
            qckCotServ8_5Ayaco.Print;
          end else
          qckCotServ8_5Ayaco.Preview;
        finally
        qckCotServ8_5Ayaco.Free;
        qckCotServ8_5Ayaco:=Nil;
        end;

         if GlbImpPDF then
             ShellExecute(0,nil,PChar(
             ExtractFilePath(Application.ExeName)+
            GlbRutaCotizaciones+'\Cotizacion'+dmfactura.qryRepCotizaNewNOMBRE_ABREV.Value+dmfactura.qryRepCotizaNewNUMERO.AsString+'.pdf'
             ),'','',SW_SHOWNORMAL);
      end else
      if (GlBAyaco = 1) or (GlBTapiceria = 1) or (GlBInveraf =1) then
          begin
            qckCotServ8_5Ayaco:=TqckCotServ8_5Ayaco.Create(Nil);
            try
            if (Not DirectoryExists('Informes')) then
            CreateDir('Informes');
            if (Not DirectoryExists('Informes')) then
            CreateDir('Informes\Cotizaciones');

         if GlbImpPDF then
             ReportExport(qckCotServ8_5Ayaco,
             GlbRutaCotizaciones+'\Cotizacion'+dmfactura.qryRepCotizaNewNOMBRE_ABREV.Value+dmfactura.qryRepCotizaNewNUMERO.AsString+'.pdf');

             if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
             begin
               qckCotServ8_5Ayaco.PrinterSetup;
               qckCotServ8_5Ayaco.Print;
             end else
             qckCotServ8_5Ayaco.Preview;
             finally
             qckCotServ8_5Ayaco.Free;
             qckCotServ8_5Ayaco:=Nil;
             end;
             if GlbImpPDF then
             ReportExportPDF(qckCotServ8_5Ayaco,GlbRutaCotizaciones+'\Cotizacion'+IntToStr(_NumeroCotiza)+'.pdf');

             if GlbImpPDF then
             ShellExecute(0,nil,PChar(
             GlbRutaCotizaciones+'\Cotizacion'+dmfactura.qryRepCotizaNewNOMBRE_ABREV.Value+dmfactura.qryRepCotizaNewNUMERO.AsString+'.pdf'
             ),'','',SW_SHOWNORMAL);
          end else

        if (UpperCase(GLBFormatoFactura) = 'FORMATOGENERAL') then
        begin
          if (GlBAyaco = 1) or (GlBTapiceria = 1) or (GlBInveraf =1) then
          begin
            qckCotServ8_5Ayaco:=TqckCotServ8_5Ayaco.Create(Nil);
            if dmReportes.qryViewVentasMastMONTO_EXONERADO_ITBIS.Value > 0 then
            begin
              //qckFactServ8_5Ayaco.QRLabel25.left:=505;
              qckCotServ8_5Ayaco.QRLabel25.Caption :='ITBIS Exonerado';
            end else
           qckFactServ8_5Ayaco.QRLabel25.Caption :='ITBIS';
            try
             if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
             begin
               qckCotServ8_5Ayaco.PrinterSetup;
               qckCotServ8_5Ayaco.Print;
             end else
             qckCotServ8_5Ayaco.Preview;
             if GlbImpPDF then
             ReportExportPDF(qckCotServ8_5Ayaco,GlbRutaCotizaciones+'\Cotizacion'+IntToStr(_NumeroCotiza)+'.pdf');
             finally
             qckCotServ8_5Ayaco.Free;
             qckCotServ8_5Ayaco:=Nil;
             end;
          end else
      if (GLBECOM = 1) then   //Elias comunicaciones Santiago
      begin
        if (GlbFormatoConduce = 333) then //ECom
        begin
          qckRepConduceECom:=TqckRepConduceECom.Create(Nil);
          try
            qckRepConduceECom.Preview;
          finally
          qckRepConduceECom.free;
          qckRepConduceECom:=nil;
          end;
        end;
        QckFactServ_8_5ECom:=TQckFactServ_8_5ECom.Create(Nil);
        try
          QckFactServ_8_5ECom.rxVendedor.Close;
          QckFactServ_8_5ECom.rxVendedor.Open;
          if dmreportes.qryCantVendedoresSamCANTVENDEDORES.Value = 1 then
          begin
            if qryEmpleado.Locate('codigo', dmreportes.qryViewVentasDetCodigo_Vendedor.Value,[]) then
            begin
              QckFactServ_8_5ECom.rxVendedor.Append;
              QckFactServ_8_5ECom.rxVendedorNombreVendedor.Value:=
              qryEmpleadoNOMBREVENDEDOR.Value;
              QckFactServ_8_5ECom.rxVendedor.Post;
            end;
          end else
          begin
            QckFactServ_8_5ECom.rxVendedor.Close;
            QckFactServ_8_5ECom.rxVendedor.Open;
            QckFactServ_8_5ECom.rxVendedor.Append;
            QckFactServ_8_5ECom.rxVendedorNombreVendedor.Value:='';
            QckFactServ_8_5ECom.rxVendedor.Post;
          end;
          QckFactServ_8_5ECom.TPag.Caption:=
          IntToStr(QckFactServ_8_5ECom.PageNumber);
          QckFactServ_8_5ECom.xtipoVenta := TipoVenta;
          //QckFactServ_8_5ECom.valorNCF:= valorNCF;
          if dmReportes.qryViewVentasMastMONTO_EXONERADO_ITBIS.Value > 0 then
            begin
              //qckFactServ8_5Ayaco.QRLabel25.left:=505;
              QckFactServ_8_5ECom.QRLabel25.Caption :='ITBIS Exonerado';
            end  else
            QckFactServ_8_5ECom.QRLabel25.Caption :='ITBIS';

            if (GlbImpReciboSinPreg = 1) then
              QckFactServ_8_5ECom.Print
              else
            if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
            begin
              //QckFactServ_8_5ECom.QRImage2.Enabled:= False;
              QckFactServ_8_5ECom.PrinterSetup;
              QckFactServ_8_5ECom.Print;
            end else
            QckFactServ_8_5ECom.Preview;

            if (GlbImpReciboSinPreg = 0) then
            if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
            begin
              QckFactServ_8_5ECom.Preview;
            end;

            if GlbImpPDF then
            begin
              if not dmReportes.qryViewVentasMastNUMERO_FACTURA.IsNull then
              ReportExportPDF(QckFactServ_8_5ECom,GlbRutaRecibos+'\Recibos'+IntToStr(dmReportes.qryViewVentasMastNUMERO_FACTURA.Value)+'.pdf')
              else
              ReportExportPDF(QckFactServ_8_5ECom,GlbRutaRecibos+'\Recibos'+IntToStr(dmReportes.qryViewVentasMastNUMERO_DOC_PAGO.AsInteger)+'.pdf')
            end;
          finally
          QckFactServ_8_5ECom.Free;
          QckFactServ_8_5ECom:=Nil;
          end;
        end else
          if (GLBSAM = 1) then
          begin
            btnVerSecCertificados.Visible:=True;
            qckCotServ8_5SAM:=TqckCotServ8_5SAM.Create(Nil);
            if dmReportes.qryViewVentasMastMONTO_EXONERADO_ITBIS.Value > 0 then
            begin
              //qckFactServ8_5Ayaco.QRLabel25.left:=505;
              qckCotServ8_5SAM.QRLabel25.Caption :='ITBIS Exonerado';
            end else
           qckCotServ8_5SAM.QRLabel25.Caption :='ITBIS';
            try
             if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
             begin      
               qckCotServ8_5SAM.PrinterSetup;
               qckCotServ8_5SAM.Print;
             end else
             qckCotServ8_5SAM.Preview;
             if GlbImpPDF then
             ReportExportPDF(qckCotServ8_5SAM,GlbRutaCotizaciones+'\Cotizacion'+IntToStr(_NumeroCotiza)+'.pdf');
             finally
             qckCotServ8_5SAM.Free;
             qckCotServ8_5SAM:=Nil;
             end;
          end else
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
      if GlbCot3Pulg = 1 then
      begin
        qckCotizacion3Pulg:=TqckCotizacion3Pulg.Create(Nil);
        try
          qckCotizacion3Pulg.Prepare;
          flag:=true;

          if (dmfactura.qryRepCotizaNew.RecordCount > 1) or (qckCotizacion3Pulg.PageNumber > 1) then
          begin
            repeat
            begin
              if (qckCotizacion3Pulg.PageNumber > 1) then
              begin
              qckCotizacion3Pulg.Page.Length:=qckCotizacion3Pulg.Page.Length + 0.25;
              qckCotizacion3Pulg.Prepare;
              flag:=False;
            end else break;
          end;
        until flag = true;
      end;
      glbTPag := qckCotizacion3Pulg.PageNumber;
        dmDatos.qryImpresoras.Close;
        dmDatos.qryImpresoras.Open;
        if dmDatos.qryImpresoras.Locate('IDMODULO;IDREPORTE',
        VarArrayOf([1,9]),[]) then     //Factura/Recibo Punto Venta
        qckCotizacion3Pulg.PrinterSettings.PrinterIndex:=
        GetImpresora(dmDatos.qryImpresorasNOMBRE_IMPRESORA.Value);
      if MessageDlg('Imprimir?', mtInformation,[mbyes,mbno],0) = mrYes then
      begin
        qckCotizacion3Pulg.PrinterSetup;
        qckCotizacion3Pulg.Print;
      end else
      qckCotizacion3Pulg.Preview;
    finally
    qckCotizacion3Pulg.Free;
    qckCotizacion3Pulg:=Nil;
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

    if (GlbNumVtaPOS > 0) then
    dmcalculos.ProcDeletePosExtraDet(GlbNumVtaPOS);
    GlbNumVtaPOS:=-1;
    GlbNumeroTrn:=-1;
    xCodProd:=-1;
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
  //t label25.Font.Color := clBlack;
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
  Totales.Edit;
  TotalesReferenciaCte.Value:='';
  dmventas.tblLineaComentario.Close;
  dmventas.tblLineaComentario.Params[0].Value:=-1;

  lblTotalItem.Caption:='Total Items:'+IntToStr(rxVenta.RecordCount);
  Edit1.Text      := '';
  rxPagos.close;
  rxPagos.EmptyTable;
  rxPagos.open;
  edtCodigo.Text  := '';
  pesoProd := '';
  BitBtn4.Enabled := False;
  ProcesandoVenta := False;
  if isShowing then
  BitBtn1.SetFocus;
  Totales.EmptyTable;
  rxPagos.EmptyTable;
  tablaPropietario.Edit;
  tablaPropietarioCodigoPropietario.AsVariant := null;
  tablaPropietario.Post;
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
    MessageDlg('Favor indicar tipo de Operación', mtInformation, [mbOK], 0);
    if isShowing then
    rdgFactServicio.SetFocus;
    exit;
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
    if not LlenandoDatos then
    Totales.Post;
  end;
  if (GlbIgI = 0) then
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
  ipStpInsertCotizaMast.Params[23].Value    := Totalesitbis.Value;//montototalitbis
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
  if chKDescuentoGlobal.Checked then
  ipStpInsertCotizaMast.Params[32].Value     := 1 //aplica_tipodesc
  else
  if CheckBox3.Checked then
  ipStpInsertCotizaMast.Params[32].Value     := 2;
  if not TotalesComentario.IsNull then
  ipStpInsertCotizaMast.Params[33].Value := TotalesComentario.AsVariant
  else ipStpInsertCotizaMast.Params[33].Value := '';
  ipStpInsertCotizaMast.Params[34].Value     := TotalesReferenciaCte.Value;
  ipStpInsertCotizaMast.Params[35].Value     := TotalesRecargo.Value;
  ipStpInsertCotizaMast.Params[36].Value     := TotalesTIPONCFIFiscal.Value;
  ipStpInsertCotizaMast.Params[37].Value     := TotalesMontoExoneraITBIS.Value;
  ipStpInsertCotizaMast.Params[38].Value     := GlbPorcPropina;
  ipStpInsertCotizaMast.Params[39].Value     := TotalesPropina.Value;
  ipStpInsertCotizaMast.Params[40].Value     := TotalesPropinaLegal.Value;
  if (UpperCase(GLBFormatoFactura) = 'FORMAFACOCO') AND ( GLBCOTI55EST = 'COTI5.5RESP') then
  begin
    frmDatosVeh:=TfrmDatosVeh.Create(nil);
    try
      if frmDatosVeh.ShowModal = mrOk then
      begin
        ipStpInsertCotizaMast.Params[41].Value  := frmDatosVeh.rxDataCODZON.Value;
        ipStpInsertCotizaMast.Params[42].Value  := 1;
        ipStpInsertCotizaMast.Params[43].Value  := frmDatosVeh.rxDataIMPCOT.Value;
        ipStpInsertCotizaMast.Params[44].Value  := frmDatosVeh.rxDataMARCOT.Value;
        ipStpInsertCotizaMast.Params[45].Value  := frmDatosVeh.rxDataMODCOT.Value;
        ipStpInsertCotizaMast.Params[46].Value  := frmDatosVeh.rxDataCHACOT.Value;
        ipStpInsertCotizaMast.Params[47].Value  := frmDatosVeh.rxDataKILCOT.Value;
        ipStpInsertCotizaMast.Params[48].Value  := frmDatosVeh.rxDataPLACOT.Value;
        ipStpInsertCotizaMast.Params[49].Value  := frmDatosVeh.rxDataANOCOT.Value;
        ipStpInsertCotizaMast.Params[50].Value  := frmDatosVeh.rxDataCOLCOT.Value;
      end else
      begin
        ipStpInsertCotizaMast.Params[41].Value  := null;
        ipStpInsertCotizaMast.Params[42].Value  := null;
        ipStpInsertCotizaMast.Params[43].Value  := null;
        ipStpInsertCotizaMast.Params[44].Value  := null;
        ipStpInsertCotizaMast.Params[45].Value  := null;
        ipStpInsertCotizaMast.Params[46].Value  := null;
        ipStpInsertCotizaMast.Params[47].Value  := null;
        ipStpInsertCotizaMast.Params[48].Value  := null;
        ipStpInsertCotizaMast.Params[49].Value  := null;
        ipStpInsertCotizaMast.Params[50].Value  := null;
        end;
      finally
      frmDatosVeh.free;
      frmDatosVeh:=nil;
    end;
    end else
    begin
      ipStpInsertCotizaMast.Params[41].Value  := null;
      ipStpInsertCotizaMast.Params[42].Value  := null;
      ipStpInsertCotizaMast.Params[43].Value  :=null;
      ipStpInsertCotizaMast.Params[44].Value  :=null;
      ipStpInsertCotizaMast.Params[45].Value  :=null;
      ipStpInsertCotizaMast.Params[46].Value  :=null;
      ipStpInsertCotizaMast.Params[47].Value  :=null;
      ipStpInsertCotizaMast.Params[48].Value  :=null;
      ipStpInsertCotizaMast.Params[49].Value  :=null;
      ipStpInsertCotizaMast.Params[50].Value  :=null;
    end;
  ipStpInsertCotizaMast.ExecProc;
  Totales.Tag:= ipStpInsertCotizaMast.Params[0].Value;

  dmcotizafiscal.ibsqlUpdLcomentarioCoti.params[0].value:=GlbNumVtaPOS;
  dmcotizafiscal.ibsqlUpdLcomentarioCoti.ExecQuery;
  
  ProcUpdateNumDLinea(GlbNumVtaPOS,ipStpInsertCotizaMast.Params[0].Value,2);
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
   if (GlbFarmacia = 1) and (GlbFact55Pulg = 1) then
        begin
          qckCotServ8_5Farmacia:=TqckCotServ8_5Farmacia.Create(Nil);
          try
            if (Not DirectoryExists('Informes')) then
            CreateDir('Informes');
            if (Not DirectoryExists(GlbRutaCotizaciones)) then
            CreateDir(GlbRutaCotizaciones);

            if CheckBox2.Checked then
            ReportExport(qckCotServ8_5Farmacia,
            GlbRutaCotizaciones+ 'Cotizacion_'+dmfactura.qryRepCotizaNewNOMBRE_FACTURAR.Value+'_'+dmfactura.qryRepCotizaNewNUMERO.AsString+'.pdf');

            if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
            begin
              qckCotServ8_5Farmacia.PrinterSetup;
              qckCotServ8_5Farmacia.Print;
            end else
            qckCotServ8_5Farmacia.Preview;
          finally
          qckCotServ8_5Farmacia.Free;
          qckCotServ8_5Ayaco:=Nil;
          end;

          if CheckBox2.Checked then
          ShellExecute(0,nil,PChar(glbZipFile),'','',SW_SHOWNORMAL);

        end else

  if (UpperCase(GLBFormatoFactura) = 'FORMAFACOCO') And (GLBCOTI55EST = 'COTI5.5EST') AND (GlbCot3Pulg = 0) then
        begin
          qckCotizacion8_55:=TqckCotizacion8_55.Create(Nil);
          try
           if (GlbRutaCotizaciones <> '') then
           begin
             if (Not DirectoryExists(GlbRutaCotizaciones)) then
             CreateDir(GlbRutaCotizaciones);
           end else
           begin
             if (Not DirectoryExists('Informes')) then
                 CreateDir('Informes');
             if (Not DirectoryExists('Informes')) then
                CreateDir('Informes\Cotizaciones');
           end;
           frmImprimir:=TfrmImprimir.Create(nil);
           try
             qckCotizacion8_55.Prepare;
             glbTPag :=qckCotizacion8_55.PageNumber;
             if frmImprimir.Showmodal = mrOk then
             begin
               if frmImprimir.RadioGroup1.ItemIndex = 0 then
               qckCotizacion8_55.Page.PaperSize := Letter;
               if frmImprimir.RadioButton1.Checked then
               begin
                 qckCotizacion8_55.PrinterSetup;
                 qckCotizacion8_55.Print;
               end else
               qckCotizacion8_55.Preview;
            end;
            finally
            frmImprimir.Free;
            frmImprimir:=Nil;
            end;
            finally

            if CheckBox2.Checked then
            ReportExport(qckCotizacion8_55,
            GlbRutaCotizaciones+'\Cotizacion_'+dmfactura.qryRepCotizaNewNOMBRE_ABREV.Value+dmfactura.qryRepCotizaNewNUMERO.AsString+'.pdf');

            qckCotizacion8_55.Free;
            qckCotizacion8_55:=Nil;
        end;
      end else
     if (UpperCase(GLBFormatoFactura) = 'FORMAFACOCO') AND (GlbCot3Pulg = 0) then
      begin
        qckCotServ8_5AyacoRep:=TqckCotServ8_5AyacoRep.Create(Nil);
        try
           qckCotServ8_5AyacoRep.Prepare;
           qckCotServ8_5AyacoRep.totalPag :=qckCotServ8_5AyacoRep.PageNumber;

          if (GlbRutaCotizaciones <> '') then
          begin
            if (Not DirectoryExists(GlbRutaCotizaciones)) then
            CreateDir(GlbRutaCotizaciones);
          end else
          begin
            if (Not DirectoryExists('Informes')) then
                CreateDir('Informes');
            if (Not DirectoryExists('Informes')) then
            CreateDir('Informes\Cotizaciones');
          end;
          ProgressBar1.Visible:= False;
            frmImprimir:=TfrmImprimir.Create(nil);
            try
              if frmImprimir.Showmodal = mrOk then
              begin
                if frmImprimir.RadioGroup1.ItemIndex = 0 then
                qckCotServ8_5AyacoRep.Page.PaperSize := Letter;
                if frmImprimir.RadioButton1.Checked then
                begin
                  qckCotServ8_5AyacoRep.PrinterSetup;
                  qckCotServ8_5AyacoRep.Print;
                end else
                qckCotServ8_5AyacoRep.Preview;
              end;
            finally
            frmImprimir.Free;
            frmImprimir:=Nil;
            end;
          finally
          if GlbImpPDF then
          ReportExport(qckCotServ8_5AyacoRep,
          GlbRutaCotizaciones+'\Cotizacion_'+dmfactura.qryRepCotizaNewNOMBRE_ABREV.Value+dmfactura.qryRepCotizaNewNUMERO.AsString+'.pdf');

      qckCotServ8_5AyacoRep.Free;
      qckCotServ8_5AyacoRep:=Nil;
      end;
      if GlbImpPDF then
      ShellExecute(0,nil,PChar(
      ExtractFilePath(Application.ExeName)+
      GlbRutaCotizaciones+'\Cotizacion_'+dmfactura.qryRepCotizaNewNOMBRE_ABREV.Value+dmfactura.qryRepCotizaNewNUMERO.AsString+'.pdf'
      ),'','',SW_SHOWNORMAL);
      end else  
     if (GlBBurgos = 1) AND (GlbCot3Pulg = 0) then
     begin
       qckCotiza8_5_F_1BB:=TqckCotiza8_5_F_1BB.Create(Nil);
       try
       qckCotiza8_5_F_1BB.Prepare;

       glbTPag := qckCotiza8_5_F_1BB.PageNumber;
       if MessageDlg('Imprimir?',mtInformation,[mbyes,mbno],0) = mrYes then
       begin
         qckCotiza8_5_F_1BB.PrinterSetup;
         qckCotiza8_5_F_1BB.Print;
       end else
       qckCotiza8_5_F_1BB.Preview;

       if (Not DirectoryExists(GlbRutaCotizaciones+'\Cotizaciones')) then
       CreateDir(GlbRutaCotizaciones+'\Cotizaciones');
       if (Not DirectoryExists(GlbRutaCotizaciones+'\Cotizaciones')) then
       CreateDir(GlbRutaCotizaciones+'\Cotizaciones');

       if GlbImpPDF then
       ReportExport(qckCotiza8_5_F_1BB,GlbRutaCotizaciones+'\Cotizacion'+dmfactura.qryRepCotizaNewNUMERO.AsString+'.pdf');

     finally
     qckCotiza8_5_F_1BB.Free;
     qckCotiza8_5_F_1BB:=Nil;
     end;
     if GlbImpPDF then
     ReportExport(qckCotiza8_5_F_1BB,GlbRutaCotizaciones+'\Cotizacion'+dmfactura.qryRepCotizaNewNUMERO.AsString+'.pdf');
   end else
   if (UpperCase(GLBFormatoFactura) = 'FORMAEXPLODISMAR') AND (GlbCot3Pulg = 0) then
      begin
        qckCotizaServ8_5EXDMar:=TqckCotizaServ8_5EXDMar.Create(Nil);
        try
          qckCotizaServ8_5EXDMar.Prepare;
          glbTPag := qckCotizaServ8_5EXDMar.PageNumber;

          if MessageDlg('Imprimir?',mtInformation,[mbyes,mbno],0) = mryes then
          begin
            qckCotizaServ8_5EXDMar.PrinterSetup;
            qckCotizaServ8_5EXDMar.Print;
          end else
          qckCotizaServ8_5EXDMar.Preview;
          if CheckBox2.Checked then
          ReportExport(qckCotizaServ8_5EXDMar,GlbRutaCotizaciones+'\Cotizacion'+dmfactura.qryRepCotizaNewNUMERO.AsString+'.pdf');
        finally
        qckCotizaServ8_5EXDMar.Free;
        qckCotizaServ8_5EXDMar:=Nil;
        end;
      end else
   if (GlBAyaco = 1) AND (GlbCot3Pulg = 0) or (GlBTapiceria = 1) or (GlBInveraf =1) then
      begin
        qckCotServ8_5Ayaco:=TqckCotServ8_5Ayaco.Create(Nil);
        try
          if (Not DirectoryExists('Informes')) then
          CreateDir('Informes');
          if (Not DirectoryExists('Informes')) then
          CreateDir('Informes\Cotizaciones');

          if GlbImpPDF then
             ReportExport(qckCotServ8_5Ayaco,
             GlbRutaCotizaciones+'\Cotizacion'+dmfactura.qryRepCotizaNewNOMBRE_ABREV.Value+dmfactura.qryRepCotizaNewNUMERO.AsString+'.pdf');

          if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
          begin
            qckCotServ8_5Ayaco.PrinterSetup;
            qckCotServ8_5Ayaco.Print;
          end else
          qckCotServ8_5Ayaco.Preview;
        finally
        qckCotServ8_5Ayaco.Free;                                  
        qckCotServ8_5Ayaco:=Nil;
        end;

        if GlbImpPDF then
             ShellExecute(0,nil,PChar(
             ExtractFilePath(Application.ExeName)+
            GlbRutaCotizaciones+'\Cotizacion'+dmfactura.qryRepCotizaNewNOMBRE_ABREV.Value+dmfactura.qryRepCotizaNewNUMERO.AsString+'.pdf'
             ),'','',SW_SHOWNORMAL);
          end else
          if (GlbDocStandar = 1) then
        begin
        qckCotServ8_5Standar:=TqckCotServ8_5Standar.Create(Nil);
        try
          if (Not DirectoryExists('Informes')) then
          CreateDir('Informes');
          if (Not DirectoryExists('Informes')) then
          CreateDir('Informes\Cotizaciones');

          if GlbImpPDF then
             ReportExport(qckCotServ8_5Standar,
             GlbRutaCotizaciones+'\Cotizacion'+dmfactura.qryRepCotizaNewNOMBRE_ABREV.Value+dmfactura.qryRepCotizaNewNUMERO.AsString+'.pdf');

          if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
          begin
            qckCotServ8_5Standar.PrinterSetup;
            qckCotServ8_5Standar.Print;
          end else
          qckCotServ8_5Standar.Preview;
        finally
        qckCotServ8_5Standar.Free;
        qckCotServ8_5Standar:=Nil;
        end;

        if GlbImpPDF then
             ShellExecute(0,nil,PChar(
             ExtractFilePath(Application.ExeName)+
            GlbRutaCotizaciones+'\Cotizacion'+dmfactura.qryRepCotizaNewNOMBRE_ABREV.Value+dmfactura.qryRepCotizaNewNUMERO.AsString+'.pdf'
             ),'','',SW_SHOWNORMAL);
          end else
//Aqui cotizacion ECOM         
        if (GLBSAM = 1) AND (GlbCot3Pulg = 0)  then
        begin
        qckCotServ8_5SAM:=TqckCotServ8_5SAM.Create(Nil);
        try
          if (Not DirectoryExists('Informes')) then
          CreateDir('Informes');
          if (Not DirectoryExists('Informes')) then
          CreateDir('Informes\Cotizaciones');

          if GlbImpPDF then
             ReportExport(qckCotServ8_5SAM,
             GlbRutaCotizaciones+'\Cotizacion'+dmfactura.qryRepCotizaNewNOMBRE_ABREV.Value+dmfactura.qryRepCotizaNewNUMERO.AsString+'.pdf');

          if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
          begin
            qckCotServ8_5SAM.PrinterSetup;
            qckCotServ8_5SAM.Print;
          end else
          qckCotServ8_5SAM.Preview;
        finally
        qckCotServ8_5SAM.Free;
        qckCotServ8_5SAM:=Nil;
        end;

        if GlbImpPDF then
             ShellExecute(0,nil,PChar(
             ExtractFilePath(Application.ExeName)+
            GlbRutaCotizaciones+'\Cotizacion'+dmfactura.qryRepCotizaNewNOMBRE_ABREV.Value+dmfactura.qryRepCotizaNewNUMERO.AsString+'.pdf'
             ),'','',SW_SHOWNORMAL);
          end else
  if (GlbSizeCotiza8x11 = 0) AND (GlbCot3Pulg = 0) and (GlbCot55Pulg = 1) And (UpperCase(GLBFormatoFactura) = 'FORMATOGENERAL') then
  begin
    qckCotizacion8_55:=TqckCotizacion8_55.Create(Nil);
    try
      qckCotizacion8_55.Prepare;

      glbTPag := qckCotizacion8_55.PageNumber;
      if MessageDlg('Imprimir?',mtInformation,[mbyes,mbno],0) = mrYes then
      begin
        qckCotizacion8_55.PrinterSetup;
        qckCotizacion8_55.Print;
      end else
      qckCotizacion8_55.Preview;

      if (Not DirectoryExists(GlbRutaCotizaciones+'\Cotizaciones')) then
      CreateDir(GlbRutaCotizaciones+'\Cotizaciones');
      if (Not DirectoryExists(GlbRutaCotizaciones+'\Cotizaciones')) then
      CreateDir(GlbRutaCotizaciones+'\Cotizaciones');

      if GlbImpPDF then
      ReportExport(qckCotizacion8_55,GlbRutaCotizaciones+'\Cotizacion'+dmfactura.qryRepCotizaNewNUMERO.AsString+'.pdf');
    finally
    qckCotizacion8_55.Free;
    qckCotizacion8_55:=Nil;
    end;
    //if GlbImpPDF then
    //ReportExport(qckCotizacion8_55,GlbRutaCotizaciones+'\Cotizacion'+dmfactura.qryRepCotizaNewNUMERO.AsString+'.pdf');
  end else
    if (UpperCase(GLBFormatoFactura) = 'FORMATOGENERAL') AND (GlbCot3Pulg = 0)  then
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
  if (GlbCot3Pulg = 1) then
  begin
    qckCotizacion3Pulg:=TqckCotizacion3Pulg.Create(Nil);
    try
      qckCotizacion3Pulg.Prepare;
      flag:=true;

      if (dmfactura.qryRepCotizaNew.RecordCount > 1) or (qckCotizacion3Pulg.PageNumber > 1) then
      begin
        repeat
          begin
            if (qckCotizacion3Pulg.PageNumber > 1) then
            begin
              qckCotizacion3Pulg.Page.Length:=qckCotizacion3Pulg.Page.Length + 0.25;
              qckCotizacion3Pulg.Prepare;
              flag:=False;
            end else break;
          end;
        until flag = true;
      end;
      glbTPag := qckCotizacion3Pulg.PageNumber;
        dmDatos.qryImpresoras.Close;
        dmDatos.qryImpresoras.Open;
        if dmDatos.qryImpresoras.Locate('IDMODULO;IDREPORTE',
        VarArrayOf([1,9]),[]) then     //Factura/Recibo Punto Venta
        qckCotizacion3Pulg.PrinterSettings.PrinterIndex:=
        GetImpresora(dmDatos.qryImpresorasNOMBRE_IMPRESORA.Value);      
      if MessageDlg('Imprimir?', mtInformation,[mbyes,mbno],0) = mrYes then
      begin
        qckCotizacion3Pulg.PrinterSetup;
        qckCotizacion3Pulg.Print;
      end else
      qckCotizacion3Pulg.Preview;
      if (Not DirectoryExists('Informes')) then
            CreateDir('Informes');
            if (Not DirectoryExists('Informes\Cotizaciones')) then
            CreateDir('Informes\Cotizaciones');
      if CheckBox2.Checked then
      ReportExport(qckCotizacion3Pulg,GlbRutaCotizaciones+'\Cotización' + dmfactura.qryRepCotizaNewNUMERO.AsString+'.pdf');
    finally
    qckCotizacion3Pulg.Free;
    qckCotizacion3Pulg:=Nil;
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
  lblTotalItem.Caption:='Total Items:'+IntToStr(rxVenta.RecordCount);  
  Edit1.Text    := '';
  rxPagos.close;
  rxPagos.EmptyTable;
  rxPagos.open;
  edtCodigo.Text := '';
  pesoProd := '';
  BitBtn4.Enabled := False;
  ProcesandoVenta := False;
  if isShowing then
  BitBtn1.SetFocus;
  Totales.EmptyTable;
  rxPagos.EmptyTable;
  tablaPropietario.Edit;
  tablaPropietarioCodigoPropietario.AsVariant := null;
  tablaPropietario.Post;
  if isShowing then
  if not edtCodigo.Focused then
    if not EsModificandoCotiza then
    begin
      begin
        edtCodigo.SetFocus;
        PostMessage(edtCodigo.Handle, WM_SETFOCUS, 0, 0);
      end;
    end;
  edtObservacion.Text := '';
  xCodigoCte:=0;
  //ignored  pos exito ActualizarRecoverData;
  qryProdPorProveedor.Close;
  pnlPrecioProv.Visible:=False;
  _NumeroCotiza := -1;
  EsModificandoCotiza := False;
  Label6.Refresh;

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

  //label29.Top:= 413;
  //dbTextMontoExoneraITBIS.Top := 410;
   label41.Visible := False;
   DBText15.Visible:= True;
   if (GlbNumVtaPOS > 0) then
   dmcalculos.ProcDeletePosExtraDet(GlbNumVtaPOS);
   GlbNumVtaPOS:=-1;
   xCodProd:=-1;
   GlbNumVtaPOSTmp:=-1;
  Refresh;
  Application.ProcessMessages;
end;}
//final cotizar --antes

procedure TfrmProcVentaRapida.InsertarCotizacionDet(numero: Integer);
begin
  LogProcedure('TfrmProcVentaRapida.InsertarCotizacionDet');
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
  ibStpInsertCotizaDet.Params[25].Value    := rxVentaCantPax.Value;
  ibStpInsertCotizaDet.Params[26].Value    := rxVentaLevelPrecio.Value;
  //ibStpInsertCotizaDet.Params[21].Value := rxVentaMontoDescItem.Value;
  ibStpInsertCotizaDet.ExecProc;
end;

procedure TfrmProcVentaRapida.BitBtn9Click(Sender: TObject);
var
  _Flag : Boolean;
begin
  LogProcedure('TfrmProcVentaRapida.BitBtn9Click');
  if (rdgFactServicio.Checked And rdgFactVentaProducto.Checked)
  And (rxventa.RecordCount > 0) Then
  begin
    MessageDlg('Favor indicar tipo de Operación', mtInformation, [mbOK], 0);
    if isShowing then
    rdgFactServicio.SetFocus;
    Exit;
  end;
  if (Totalesmontorecibido.Value > 0) and (rxVenta.RecordCount > 0) then
  begin
    MessageDlg('Favor procesar o cancelar venta en progreso', mtInformation, [mbOK], 0);
    Exit;
  end;

  EsDevolucion:=False;
  lblProcDev.SendToBack;
  tablaPropietario.EmptyTable;
  EsModificandoFactura:= False;
  lblProcDev.Visible  := EsDevolucion;
  if lblProcDev.Visible = false then
  lblProcDev.SendToBack else
  lblProcDev.BringToFront;

  dmCalculos.datosSetDataDone:=False;
  dmCalculos.datosCargados:=False;
  LlenandoDatos:=True;
  if (totales.RecordCount > 0) then
  begin
    totales.Close;
    totales.Open;
    Edit1.Text:='';
    Totales.Close;
    Totales.Open;
    Totales.Insert;
    TotalesTipoDeIngreso.Value:='01';
    if (GlbFactRecurrente) then
    TotalesPreAbono.Value:=_MontoPrepago;
    if (GlbMonedaBase > 0) then
    TotalesMoneda.Value   := IntToStr(GlbMonedaBase)
    else
    TotalesMoneda.Value   := '1';
    TotalesSubTotal.Value:=0;
    TotalesSubTotalScreen.Value := 0;    
    TotalesMontoDescItems.Value:=0;
    Totalesitbis.Value     := 0;
    //WriteToLog('Total itbis: '+Totalesitbis.AssTring);
    Totalesmontodesc.Value := 0;
    Totalestotalneto.Value := 0;
    Totalesmontorecibido.Value:= 0;
    Totalesdevolucion.Value   := 0;
    if not LlenandoDatos then
    Totales.Post;
    lblProcDev.Visible := False;
    if TotalesTipoNCF.IsNull then
    begin
      if GlbActivaECF = 1 then
         TotalesTipoNCF.Value:='32'
      else TotalesTipoNCF.Value:='02';
    end;    
    //dmCalculos.esFeedback:=False;
  end;

  if (GlbNumVtaPOS > 0) then
  dmcalculos.ProcDeletePosExtraDet(GlbNumVtaPOS);
  GlbNumVtaPOS:=-1;
  GlbNumeroTrn:=-1;
  xCodProd:=-1;
  RxDBGrid1.DisableScroll;
  frmCotizaciones:=TfrmCotizaciones.Create(Nil);
  try
    frmCotizaciones.BitBtn4Click(Self);

    if frmCotizaciones.Showmodal = mrOk then
    begin
      dmCalculos.qryVerCotiConVta.Close;
      dmCalculos.qryVerCotiConVta.Params[0].Value:= frmCotizaciones.ibqryCotizacionMasterNUMERO.Value;
      dmCalculos.qryVerCotiConVta.Open;
      dmCalculos.qryVerCotiConVta.First;
      if (dmCalculos.qryVerCotiConVta.RecordCount > 0) then
      begin
        if MessageDlg('Esta cotización fue usada en una venta anterior, desea re-utilizarla?',mtWarning,[Mbyes,Mbno],0) = mrYes then
        _Flag := True
        else _Flag := false;
      end else _Flag:=True;

      if _Flag then
      begin
      bitbtn9.Caption:='Espere...';
      GlbUsandoCotiza:= True;
      rxVenta.Close;
      rxVenta.Open;
      tablaPropietario.EmptyTable;
      rxVenta.DisableControls;
      RxDBGrid1.DisableScroll;
      GlbCalculado:=False;
      frmCotizaciones.ibqryCotizacionDet.First;
      LlenandoDatos:=True;//frmCotizaciones.ibqryCotizacionDet.RecordCount
      rxVenta.DisableControls;

      tablaPropietario.Edit;
      tablaPropietarioCodigoPropietario.Value:=
      frmCotizaciones.ibqryCotizacionMasterCODIGO_CTE.Value;
      tablaPropietario.Post;

      if (GlbActivaIFiscal = 0) then
      RxSpeedButton1.Visible:= False else
      RxSpeedButton1.Visible:= False;

      EsModificandoCotiza := True;

      //Cargar detalle coti en tabla pos_extra_Det
      GlbNumVtaPOS:=frmCotizaciones.ibqryCotizacionMasterNUMERO.Value;
      dmcalculos.ibstpproc_InseCotiVtaExtraDet.Close;
      dmcalculos.ibstpproc_InseCotiVtaExtraDet.Params[0].Value:= frmCotizaciones.ibqryCotizacionMasterNUMERO.Value; //numero cotiza
      dmcalculos.ibstpproc_InseCotiVtaExtraDet.Params[1].Value:= ExtraerFEcha(GlbFechaTrnDiaria); //fecha trn
      dmcalculos.ibstpproc_InseCotiVtaExtraDet.Params[2].Value:= VarUsuarioGlb; //cod usuario
      dmcalculos.ibstpproc_InseCotiVtaExtraDet.Open;
      dmcalculos.ibstpproc_InseCotiVtaExtraDet.First;
      if not dmcalculos.ibstpproc_InseCotiVtaExtraDet.Transaction.InTransaction then
      dmcalculos.ibstpproc_InseCotiVtaExtraDet.Transaction.StartTransaction;
      try
        dmcalculos.ibstpproc_InseCotiVtaExtraDet.Transaction.CommitRetaining;
      except
      dmcalculos.ibstpproc_InseCotiVtaExtraDet.Transaction.RollbackRetaining;
      end;

      Totales.Edit;
      TotalesComentario.Value := frmCotizaciones.ibqryCotizacionMasterCOMENTARIO.Value;
      TotalesRecargo.Value    := frmCotizaciones.ibqryCotizacionMasterMONTO_RECARGO.Value;
      TotalesMontoExoneraITBIS.Value := frmCotizaciones.ibqryCotizacionMasterMONTO_EXONERADO_ITBIS.Value;
      TotalesTipoNCFIFiscal.Value    := frmCotizaciones.ibqryCotizacionMasterTIPONCFIFISCAL.Value;
      Totalesitbis.Value             := frmCotizaciones.ibqryCotizacionMasterMONTO_TOTAL_ITBIS.Value;
      TotalesPorcDesAdicional.Value  := frmCotizaciones.ibqryCotizacionMasterPORC_DESCUENTO.Value;

      if TotalesPorcDesAdicional.Value > 0 then
      chKDescuentoGlobal.Checked := True else
      chKDescuentoGlobal.Checked := False;

      if Totales.State = dsEdit then
      if not LlenandoDatos then
      Totales.Post;

      frmPosExtraDet:=TfrmPosExtraDet.Create(nil);
      try
         frmPosExtraDet.numero_cotiza:=  frmCotizaciones.ibqryCotizacionMasterNUMERO.Value;
        dmCalculos.esFeedbackExtra := False;
        if dmCalculos.qryConsultaPosExtraDet.Tag <> 99 then
        frmPosExtraDet.ProcPosExtraCotiza(frmPosExtraDet.numero_cotiza);
        frmPosExtraDet.numero_cotiza:=-1;
      finally
      frmPosExtraDet.free;
      frmPosExtraDet:=nil
      end;

      EsModificandoCotiza := false;
      Label36.Visible:=False;
      rxVenta.EnableControls;

      Totales.Edit;
      TotalesComentario.Value := frmCotizaciones.ibqryCotizacionMasterCOMENTARIO.Value;
      TotalesRecargo.Value    := frmCotizaciones.ibqryCotizacionMasterMONTO_RECARGO.Value;
      TotalesMontoExoneraITBIS.Value := frmCotizaciones.ibqryCotizacionMasterMONTO_EXONERADO_ITBIS.Value;
      TotalesTipoNCFIFiscal.Value    := frmCotizaciones.ibqryCotizacionMasterTIPONCFIFISCAL.Value;

      if GlbActivaECF = 1 then
      begin
        if  not (TotalesTipoNCFIFiscal.Value in [1,7,8]) then
        begin
          TotalesTipoNCFIFiscal.Value:=1;
          TotalesTipoNCF.Value:='31';
        end;
      end;

      Totalesitbis.Value             := frmCotizaciones.ibqryCotizacionMasterMONTO_TOTAL_ITBIS.Value;
      TotalesPorcDesAdicional.Value  :=
      frmCotizaciones.ibqryCotizacionMasterPORC_DESCUENTO.Value;

      if TotalesPorcDesAdicional.Value > 0 then
      chKDescuentoGlobal.Checked := True else
      chKDescuentoGlobal.Checked := False;

      if Totales.State = dsEdit then
      if not LlenandoDatos then
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
      if EsDevolucion then
      Label36.Caption:='Procesando Devolución a Vta No.: ' + frmCotizaciones.ibqryCotizacionMasterNUMERO.AsString
      else
      Label36.Caption:='Modificando Cotización: ' + frmCotizaciones.ibqryCotizacionMasterNUMERO.AsString;
      edtObservacion.Text := frmCotizaciones.ibqryCotizacionMasterNOMBRE_CLIENTE_GENERAL.Value;
      dmCalculos.esFeedback:=True;//Autoriza ejecuta calculos
      Edit1Enter(Self);
    end else
    begin
      GlbUsandoCotiza:= False;
      EsModificandoFactura:=False;
    end;
    end;//_flag
  finally
  frmCotizaciones.Free;
  frmCotizaciones:=Nil;
  end;
  if rxVenta.RecordCount > 0 then
  begin
    procCalc:=True;
    GlbUsandoCotiza:=False;

    DBEdit10Exit(Self);
    LlenandoDatos:=false;
    dmCalculos.esFeedback := True;

    if not GlbCalculado then
       CalcularTotalesInterno;

    RxDBGrid1.EnableScroll;

    lblTotalItem.Caption:= 'Total Items:'+IntToStr(rxVenta.RecordCount);
    lblTotalItem.Visible:=True;
    bitbtn9.Caption:='&Usa Cotización';
    BitBtn2Click(Self);
  end;
  rxVenta.EnableControls;
  RxDBGrid1.EnableScroll;
  Refresh;
end;

procedure TfrmProcVentaRapida.ProcesaFacturar(tipo : smallint; numdoc:Integer; codcte:Integer);
begin
  LogProcedure('TfrmProcVentaRapida.ProcesaFacturar');
  dmCxc.tblTransCxc.Close;
  dmCxc.tblTransCxc.Params[0].Value := ExtraerFecha(glbfechatrndiaria);
  dmCxc.tblTransCxc.Params[1].Value := ExtraerFecha(glbfechatrndiaria);
  if (GLBSam = 1) then
  begin
    if (GlbUsaFctMexico = 1) and (not TotalesFechaIniciaPoliza.IsNull) then
    begin
      dmCxc.tblTransCxc.Params[0].Value := ExtraerFecha(TotalesFechaIniciaPoliza.Value);
      dmCxc.tblTransCxc.Params[1].Value := ExtraerFecha(TotalesFechaIniciaPoliza.Value);
    end;
  end;
  dmCxc.tblTransCxc.Params[2].Value := glbCia_Key;
  dmCxc.tblTransCxc.Open;
  dmCxc.qryBalanceCtes.Close;
  dmCxc.qryBalanceCtes.Open;
  dmfactura.IBDataSetFacturas.Close;
  dmfactura.IBDataSetFacturas.Open;

  dmfactura.IBDataSetFacturas.Append;
  dmfactura.IBDataSetFacturasPORC_ATRASOCXC.Value := GLBPORC_ATRASOCXC;
  dmfactura.IBDataSetFacturasNUMERO.Value         := numdoc;
  dmfactura.IBDataSetFacturasNUMERO_TRN_VTA.Value := ipStpInsertVentMast.Params[0].Value;
  dmfactura.IBDataSetFacturasCIA_KEY.Value := glbCia_Key;
  if not TotalesMoneda.IsNull then
  dmfactura.IBDataSetFacturasMONEDA.Value  := TotalesMoneda.Value
  else
  dmfactura.IBDataSetFacturasMONEDA.Value  := '1';

  dmfactura.IBDataSetFacturasTIPO.Value    := 2;
  dmfactura.IBDataSetFacturasCODIGO_CTE.Value := codcte;
  dmfactura.IBDataSetFacturasFECHA.Value      := ExtraerFecha(GlbFechatrndiaria);

  if (GLBSAM = 1) then
  if (GlbUsaFctMexico = 1) and (not TotalesFechaIniciaPoliza.IsNull) then
  dmfactura.IBDataSetFacturasFECHA.Value      := ExtraerFecha(TotalesFechaIniciaPoliza.Value);

  if (DescFactRecurrente <> '') then
  dmfactura.IBDataSetFacturasDESCRIPCION.Value:= DescFactRecurrente
  else
  dmfactura.IBDataSetFacturasDESCRIPCION.Value:= 'Venta';
  dmfactura.IBDataSetFacturasMONTO_FACT.Value := TotalestotalNeto.Value;
  dmfactura.IBDataSetFacturasRCXC.Value       := 'R';
  dmfactura.IBDataSetFacturasSTATUS.Value     := 'P';
  dmfactura.IBDataSetFacturasFECHA_IN.Value   := Now;
  dmfactura.IBDataSetFacturasFECHA_VENCE.Value:= TotalesFechaVence.Value;

  if rdgFactServicio.Checked then
  dmfactura.IBDataSetFacturasTIPO_FACTURA.Value:=0 //factura servicio
  else
  dmfactura.IBDataSetFacturasTIPO_FACTURA.Value:=1;//otros

  if chKDescuentoGlobal.Checked  then
  dmfactura.IBDataSetFacturasAPLICA_TIPODESC.Value:=1
  else
  if CheckBox3.Checked then
  dmfactura.IBDataSetFacturasAPLICA_TIPODESC.Value:=2;

  GlbSalvarQuery(dmfactura.IBDataSetFacturas);

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

  if (GLBSAM = 1) then
  begin
    if (GlbUsaFctMexico = 1) and (not TotalesFechaIniciaPoliza.IsNull) then
    begin
      dmfactura.stpProcInsFactPendiente.Params[0].Value:= ExtraerFecha(TotalesFechaIniciaPoliza.Value);
      dmfactura.stpProcInsFactPendiente.Params[1].Value:= ExtraerFecha(TotalesFechaIniciaPoliza.Value);
    end;
  end;
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
  rxVenta.DisableControls;
  rxVenta.First;
  //While Not rxVenta.Eof Do
  //begin
  if (Totalestotalneto.Value > 0 ) then
  begin
    dmCxc.tblTransCxc.Append;
    dmCxc.tblTransCxcCIA_KEY.Value:=glbCia_Key;

    dmCxc.tblTransCxcSTATUS.Value := 'A';
    //dmCxc.tblTransCxcconcepto.Value     := 'Pago cuota';
    if (tipo = 1) then
    begin
      dmCxc.tblTransCxcTIPO_DOC.Value := 1; //Factura
      if (DescFactRecurrente <> '') then
      dmCxc.tblTransCxcconcepto.Value:= DescFactRecurrente
      else
      dmCxc.tblTransCxcconcepto.Value := 'Venta';
    end else dmCxc.tblTransCxcTIPO_DOC.Value := 2; //Recibo
    if not TotalesMoneda.IsNull then
    dmCxc.tblTransCxcmoneda.Value  := TotalesMoneda.Value
    else
    dmCxc.tblTransCxcmoneda.Value  := '1';
    if (GlbUsaFctMexico = 1) and (not TotalesFechaIniciaPoliza.IsNull) then
        dmCxc.tblTransCxcfecha.Value   := TotalesFechaIniciaPoliza.Value
    else
    dmCxc.tblTransCxcfecha.Value   := ExtraerFecha(GlbFechatrndiaria);
                     
    dmCxc.tblTransCxccodigo_cliente.Value := TotalesCodCliente.Value;
    dmCxc.tblTransCxccodigo_serv.Value    := 0;
    dmCxc.tblTransCxcNUMERO_DOC.Value     := Numdoc;

    dmCxc.tblTransCxcvalor_documento.Value:= TotalestotalNeto.Value;
    dmCxc.tblTransCxctipo_tranf.Value     := 1;//Debito
    dmCxc.tblTransCxctipo_serv.Value      := 2;//General
    dmCxc.tblTransCxcfecha_in.Value       := Now;
    if (rxVentaNUM_IDENT.Value <> '') and (not rxVentaNUM_IDENT.IsNull) then
    dmCxc.tblTransCxcNUMPOL.Value := rxVentaNUM_IDENT.AsInteger;
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
    rxVenta.EnableControls;

  if (GlbFactCxcATercero = 1) and (not rxVentaNUM_CONDUCE_CTE.IsNull)
  and (edtMontoInicial.Text <> '') then
  begin
    stpProc_InsertaVentaAuto.Params[1].Value:= ipStpInsertVentMast.Params[0].Value;//numtrn
    stpProc_InsertaVentaAuto.Params[2].Value:= rxVentaNUM_CONDUCE_CTE.AsInteger;//codigocxc
    stpProc_InsertaVentaAuto.Params[3].Value:= StrToFloat(edtMontoInicial.Text);//montoafinancia
    stpProc_InsertaVentaAuto.Params[4].Value:= StrToInt(edtCodProdFinanc.Text);
    stpProc_InsertaVentaAuto.Params[5].Value:= FGetFPago(0);
    stpProc_InsertaVentaAuto.ExecProc;
    try
      if not stpProc_InsertaVentaAuto.Transaction.InTransaction then
      stpProc_InsertaVentaAuto.Transaction.StartTransaction;
      stpProc_InsertaVentaAuto.Transaction.Commit;
      //edtMontoInicial.Text:='';
    except
    stpProc_InsertaVentaAuto.Transaction.RollbackRetaining;
    end;//stpProc_InsertaVentaAuto.Params[0].Value
    //edtMontoInicial.Text:='';
    //edtCodProdFinanc.Text:='';
  end;
  //end;
end;

Function TfrmProcVentaRapida.FGetFPago(todasfPago : Smallint):integer;
begin
  LogProcedure('TfrmProcVentaRapida.FGetFPago');
  frmFormaPagoVRep:=TfrmFormaPagoVRep.Create(Nil);
  try
    frmFormaPagoVRep.setEfectivo := 1;
    frmFormaPagoVRep.soloEfeYCred:= todasfPago;

    if frmFormaPagoVRep.ShowModal = mrOk then
    begin     
      result:= frmFormaPagoVRep.codigo_fpago;
    end;
  finally
  frmFormaPagoVRep.Free;
  frmFormaPagoVRep:=Nil;  
  end;
end;

procedure TfrmProcVentaRapida.ActBalaceCteP(operacion:smallint);
var
  Monto:Real;
begin
  LogProcedure('TfrmProcVentaRapida.ActBalaceCteP');
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
  LogProcedure('TfrmProcVentaRapida.EditarBalanceP');
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
  LogProcedure('TfrmProcVentaRapida.EditarBalanceP');
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
  LogProcedure('TfrmProcVentaRapida.InsertaBalanceP');
  dmcxc.qryBalanceCtes.Append;
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
  //LogProcedure('TfrmProcVentaRapida.ProcVentaConNCF');
  //Generar y Asignar Numero de Comprobante Fiscal
  valorNCF:='';
  serieDoc:= -1;//indica que no se generó el NCF
  
  if CheckBox1.Checked then
  begin
    if ((tablaPropietarioCodigoPropietario.IsNull) or (tablaPropietarioCodigoPropietario.Value = 0)) and
    TipoCFRequiereCliente(dmFactura.ibQryViewNCFTIPO_CF.Value) then
    begin
      MessageDlg('Necesitas seleccionar un cliente, verificar.', mtError, [mbOk], 0);
      Exit;
    end;

    frmAsignarNCFVenta:=tfrmAsignarNCFVenta.Create(nil);
    try
      frmAsignarNCFVenta.IBDataSet1.Close;
      frmAsignarNCFVenta.IBDataSet1.Open;
      frmAsignarNCFVenta.IBDataSet1.Append;
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
        if not LlenandoDatos then
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
  //LogProcedure('TfrmProcVentaRapida.MaestroCliente1Click');
  if not Assigned(frmClientes) then
  frmClientes:=TfrmClientes.Create(Self);
  try
    dmUsuarios.qryRoles.Close;
    dmUsuarios.qryRoles.Params[0].Value:= VarUsuarioGlb;
    dmUsuarios.qryRoles.Open;
    dmUsuarios.qryRoles.First;
    While Not dmUsuarios.qryRoles.Eof Do
    begin
      ActivaPermiso(TForm(frmClientes), 1000, dmUsuarios.qryRolesID_ROL.Value, 0);//menu principal: 1000 debe estar en la tabla PROCESOS
      dmUsuarios.qryRoles.Next;
    end;
    if tablaPropietarioCodigoPropietario.Value > 0 then
    begin
      dmclientes.tblClientes.Tag:=-1;
      dmclientes.tblClientes.DisableControls;
      dmclientes.tblClientes.Locate('CODIGO_CTE', tablaPropietarioCodigoPropietario.Value,[]);
      dmclientes.tblClientes.Tag:=0;
      dmclientes.tblClientes.EnableControls;
    end;                            
    frmClientes.PageControl1.ActivePageIndex:=0;
    frmClientes.ShowModal;
  finally
  frmClientes.Free;
  frmClientes:=Nil;
  end;
  qryCliente.Close;
  qryCliente.Open;
  if qryEmpleado.State = dsInactive then
  qryEmpleado.Open;
  if tbltipoDeIngresos.state = dsinactive then
  tbltipoDeIngresos.open;
end;

procedure TfrmProcVentaRapida.RxDBGrid2DblClick(Sender: TObject);
begin
  LogProcedure('TfrmProcVentaRapida.RxDBGrid2DblClick');
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
  try

  //t if panel2.Showing then
  //t panel2.Visible := False;
  panel2.Height:=87;
  Prod_existe    := True;
  BuscandoPorDesc:=false;
  except
  end;
  if Assigned(frmProcVentaRapida) Then
  if (showing) then
  begin
    if cboxTipoUnidad.Enabled then
    if cboxTipoUnidad.Visible then
    begin
      rxdblookupTipoUnidad.SendToBack;
      cboxTipoUnidad.BringToFront;

      if cboxTipoUnidad.Showing then
      begin
        if not cboxTipoUnidad.Focused then
        try
          //cboxTipoUnidad.SetFocus;
          SafeSetFocus(cboxTipoUnidad);
        except on E : Exception do
        LogInformacionTxt(e.Message);
        end
      end;
    end;
  end;

  edtCodigoExit(Self);
  if (GlBCuadros = 1) and showing then
    //DBEdit1.SetFocus
    SafeSetFocus(DBEdit1)
  else
  begin
    if (GlbUsaPUnidadLevel = 1) then
    begin
      DSQryPrecios.DataSet := dmVentas.qryPrecioUnidadSurt;
      if Showing then
      begin
        if rxdblookupTipoUnidad.Showing then
        begin
          rxdblookupTipoUnidad.BringToFront;
          //rxdblookupTipoUnidad.SetFocus;
          SafeSetFocus(rxdblookupTipoUnidad);
        end;
      end;
    end;
  end;
end;

procedure TfrmProcVentaRapida.DBEdit1Enter(Sender: TObject);
begin
  DBEdit1.Color:= clYellow;
  //inicio
  if (Sender is TWinControl) then
  begin
    if imbBarcode.Visible and
       (rxVenta.State in [dsEdit, dsInsert]) and
       EsControlEntradaDetalle(TWinControl(Sender)) then
      Exit;
  end;

  if imbBarcode.Visible and
     (rxVenta.State in [dsEdit, dsInsert]) then
  begin
    if edtCodigo.CanFocus and (ActiveControl <> edtCodigo) then
      edtCodigo.SetFocus;
  end;
  //fin

  if rxVentaCodArticulo.IsNull then exit;
  yNumSerie:= rxVentaSerie.Value;
  if not rxVentaCant.IsNull then
  auxiCant:= rxVentaCant.Value
  else
  auxiCant:= -1;
  if Not Prod_existe and ((rxVenta.State in [dsEdit, dsInsert]) or (rxVenta.RecordCount > 0)) then
  begin
    if qryProductos.State = dsInactive then 
    AsignarSqlText('','','');
    qryProductos.DisableControls;
    if qryProductos.Locate('codigo_Texto', rxVentaCodTexto.Value,[]) then
    begin
      _UsarLevelPrecio:= qryProductosUSARLEVELPRECIO.Value;
      panelTempPrecioLevels.Visible:=true;
      Prod_existe:=True;
    end else
    begin
      MessageDlg('Código producto no encontrado, verifique', mtInformation, [mbOK], 0);
      edtCodigo.Text:='';
      if not edtCodigo.Focused then
      begin
        if Showing then
        begin
          edtCodigo.SetFocus;
          PostMessage(edtCodigo.Handle, WM_SETFOCUS, 0, 0);
        end;
      end;
      qryProductos.EnableControls;
      Exit;
    end;
  end;
  qryProductos.EnableControls;
  panel2.Height:=87;
  Panel2.Visible:=False;

  if panelTempPrecioLevels.Visible then
  panelTempPrecioLevels.Visible:= True
  else if glbUsaescalaPrecio= 0 then
  panelTempPrecioLevels.Visible:= False;
end;

procedure TfrmProcVentaRapida.BitBtn10Click(Sender: TObject);
begin
  if (Totales.Tag = 609) or LlenandoDatos then exit;
  if (rxVenta.RecordCount >  0) then
  begin
    if Totales.State in [dsBrowse] then
    Totales.Edit;
    if rxVenta.State in [dsBrowse] then
    rxVenta.Edit;
  end;
end;

procedure TfrmProcVentaRapida.BitBtn11Click(Sender: TObject);
var
  frecuencia:string;
  serieDoc:Integer;
  muestraVentana:boolean;
begin
  //LogProcedure('TfrmProcVentaRapida.BitBtn11Click');
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
        xSalir:=False;
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
      if (xCodigoCte = 0) and (not rxVentaNUM_CONDUCE_CTE.IsNull) then
      xCodigoCte:=rxVentaNUM_CONDUCE_CTE.AsInteger;
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
        if not LlenandoDatos then
        Totales.Post;
        if (GlbIgI = 0) then
        CheckBox1.Checked:=True;
        if not Assigned(frmFinanciamiento) then
        frmFinanciamiento:=TfrmFinanciamiento.Create(Nil);

        frmFinanciamiento.rxLabelNombreCliente.Caption := TotalesNombreCliente.Value;
        frmFinanciamiento.xCodigocliente := xCodigoCte;
        frmFinanciamiento.qryFinancAbiertos.Close;
        frmFinanciamiento.qryFinancAbiertos.Params[0].Value:= xCodigoCte;
        frmFinanciamiento.qryFinancAbiertos.Open;
        //frmFinanciamiento.xNumeroTrn := SerieDoc;
        frmFinanciamiento.rxDatosFinanc.Insert;
        frmFinanciamiento.rxDatosFinancMontoTotalVenta.Value:= Totalestotalneto.Value;
        frmFinanciamiento.rxDatosFinancMontoAFinanciar.Value:= Totalestotalneto.Value;
        frmFinanciamiento.rxDatosFinancMontoInicial.Value:=0;

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
          TotalesMontoInteres.Value :=
          frmFinanciamiento.rxDatosFinancMontoInteres.Value *
          frmFinanciamiento.rxDatosFinanccantCuotas.Value;
          //frmFinanciamiento.rxDatosFinancMontoTotalVenta.Value:= Totalestotalneto.Value;
          Totalesmontorecibido.Value := frmFinanciamiento.rxDatosFinancMontoInicial.Value;
          TotalestotalNeto.Value     := frmFinanciamiento.rxDatosFinancMontoFinanciado.Value;
          if not LlenandoDatos then
          Totales.Post;
        end;
    end else
    begin
      MessageDlg('Financiamiento cancelado.',mtInformation, [mbok], 0);
    end;
  end;//if not xSalir
    //end;
  finally
  end;
  if Not tablaPropietarioCodigoPropietario.IsNull then
  begin
    xCodigoCte := tablaPropietarioCodigoPropietario.Value;
    muestraVentana:=false;
  end;

  if TotalesMontoInteres.Value > 0 then
  begin
    BitBtn12.Enabled:= True;
    if isShowing then
    BitBtn12.SetFocus;
    //Label17.Visible := True;
    DBText6.Visible := True;
    BitBtn11.Enabled:=False;
    tablaPropietario.Edit;
    tablaPropietarioCodigoPropietario.AsVariant := null;
    tablaPropietario.Post;
  end;
end;

function TfrmProcVentaRapida.FncFrecuencia(Frec: Integer): String;
begin
  //LogProcedure('TfrmProcVentaRapida.FncFrecuencia');
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
  //LogProcedure('TfrmProcVentaRapida.BitBtn12Click');
  if rxVenta.recordcount = 0 then exit; //out of here
  if (rdgFactServicio.Checked and rdgFactVentaProducto.Checked)
  And (rxventa.RecordCount > 0) then
  begin
    MessageDlg('Favor indicar tipo de Operación', mtInformation, [mbOK], 0);
    if isShowing then
    rdgFactServicio.SetFocus;
    exit;
  end;
  BitBtn11.Enabled:=True;
  //if not flag then //evitar repetir solicitud de comprobante
  //begin
    frmSelNCF:=TfrmSelNCF.Create(Nil);
    try //aqui prepara para que trabaja sin ncf
      if (frmSelNCF.ShowModal = mrOK) then
      xgenNcf:=True
      else xgenNcf:= false;
//      flag:=True;
    finally
    frmSelNCF.Free;
    frmSelNCF:= Nil;
    end;
  //end;
  if xGenNCf and CheckBox1.checked then
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
    if not LlenandoDatos then
    Totales.Post;

    ProcesaFacturar(1, serieDoc, xCodigoCte);//xcodigocte);

    RxDBGrid1.EnableScroll;
    if not Assigned(frmFinanciamiento) then
    frmFinanciamiento:=TfrmFinanciamiento.Create(nil);
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
          if not LlenandoDatos then
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
      rxPagos.EmptyTable;
    //Reporte Distribucion de cuotas
    //No Gurder
    if rxVentaNUM_CONDUCE_CTE.IsNull then
    begin
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
    end;
    frmFinanciamiento.Free;
    frmFinanciamiento:=Nil;

  rxVenta.EmptyTable;
  lblTotalItem.Caption:='Total Items:'+IntToStr(rxVenta.RecordCount);
  Edit1.Text      := '';
  edtCodigo.Text  := '';
  pesoProd := '';
  BitBtn4.Enabled := False;
  ProcesandoVenta := False;
  Totales.EmptyTable;
  rxPagos.EmptyTable;
  //CheckBox1.Checked := False;
  if not edtCodigo.Focused then
    if not EsModificandoCotiza then
    begin
      if isShowing then
      begin
        edtCodigo.SetFocus;
        PostMessage(edtCodigo.Handle, WM_SETFOCUS, 0, 0);
      end;
    end;
  ActualizarPreventa;
  //ignored  pos exito ActualizarRecoverData;
  qryProdPorProveedor.Close;
  pnlPrecioProv.Visible:=False;
end;

procedure TfrmProcVentaRapida.MostrarVistaproductos1Click(Sender: TObject);
begin
  //LogProcedure('TfrmProcVentaRapida.MostrarVistaproductos1Click');
  MostrarVistaproductos1.Checked := Not MostrarVistaproductos1.Checked;
end;

procedure TfrmProcVentaRapida.edtReferenciaChange(Sender: TObject);
begin
  //LogProcedure('TfrmProcVentaRapida.edtReferenciaChange');
  if qryProductos.State = dsInactive then
  AsignarSqlText('','','');

  if (edtReferencia.Text = '') then exit;
  qryProductos.DisableControls;
  if qryProductos.Locate('referencia', edtReferencia.Text, [loCaseInsensitive, loPartialKey]) then
  begin
    _UsarLevelPrecio:= qryProductosUSARLEVELPRECIO.Value;
    panelTempPrecioLevels.Visible:=True;
    Prod_existe:= True;
    //temporal edtCodigo.Text := qryProductosCODIGO.AsString;
    //panel2.Top := edtcodigo.Top+30;
    panel2.Left  := edtcodigo.Left;
    //RxDBGrid2.Align:= alClient;
    try
    panel2.Visible:=True;
    panelTempPrecioLevels.Visible:= True;
    panel2.Height:=170;
    panel2.BringToFront;
    except
    LogInformacionTxt('Error');
    end;
    qryProductos.EnableControls;
  end
end;

procedure TfrmProcVentaRapida.edtReferenciaExit(Sender: TObject);
begin
  //LogProcedure('TfrmProcVentaRapida.edtReferenciaExit');
  if (qryProductos.State = dsInactive) then
  qryProductos.Open;
  if (edtReferencia.Text = '') then
  begin
    edtCodigo.text:='';
    panel2.Height:=87;
    Panel2.Visible:=False;
    if glbUsaescalaPrecio = 0 then
    panelTempPrecioLevels.Visible:= False;
    exit;
  end else
  begin
    if qryProductos.Locate('referencia', edtReferencia.Text, [loCaseInsensitive]) then
    begin
      if imbBarcode.Visible then
      edtCodigo.text:=qryProductosCODIGO_BARRA.AsString
      else edtCodigo.text:=qryProductosCODIGO.AsString;
      edtReferencia.Text:='';
      panel2.Height:=87;
      Panel2.Visible:=False;
      if glbUsaescalaPrecio = 0 then
      panelTempPrecioLevels.Visible:= False;
    end else
    begin
      edtCodigo.text:='';
      panel2.Height:=87;
      Panel2.Visible:=False;
      if glbUsaescalaPrecio = 0 then
      panelTempPrecioLevels.Visible:= False;
      exit;
    end;
  end;

  if (qryProductos.State = dsInactive) then
  qryProductos.Open;
  if (edtCodigo.text <> '') then
  edtCodigoExit(Self);
end;

procedure TfrmProcVentaRapida.NotaCrdito1Click(Sender: TObject);
begin
  //LogProcedure('TfrmProcVentaRapida.NotaCrdito1Click');
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
end;

function TfrmProcVentaRapida.VerificaClave: Boolean;
var
 valorE:String;
begin
  frmEntrreClave:=TfrmentrreClave.Create(nil);
  if frmEntrreClave.showmodal=mrOk then
  Clave:= frmEntrreClave.Edit1.Text
  else Result := False;
  frmentrreClave.Free;
  frmentrreClave:=Nil;
  frmConfClaveMaestra:=TfrmConfClaveMaestra.Create(nil);
   try
     frmConfClaveMaestra.Edit1.Text:=clave;
     //frmConfClaveMaestra.Edit2.Text:=clave;
     frmConfClaveMaestra.Button1Click(self);
     valorE :=frmConfClaveMaestra.Edit2.Text;

   finally
   freeAndNil(frmConfClaveMaestra);
   end;

  if (GlbClaveSup <> valorE) then
  begin
    MessageDlg('Clave incorrecta, verifique', mtError, [mbOK], 0);
    LogProcedure('Clave incorrecta: GlbClaveSup='+GlbClaveSup+'Input Clave='+Encriptar(Trim(clave), 2005));
    Result := False;
  end else Result := True;
end;

procedure TfrmProcVentaRapida.Devolucin1Click(Sender: TObject);
begin
  //LogProcedure('TfrmProcVentaRapida.Devolucin1Click');
  frmProcVentaRapida.Hide;
  frmEdicionVenta:=TfrmEdicionVenta.Create(Nil);
  try
    frmEdicionVenta.tblDatosVenta.Close;

    if (GlbUsaFctMexico = 1) and (not TotalesFechaIniciaPoliza.IsNull) then
    frmEdicionVenta.tblDatosVenta.Params[0].value:= ExtraerFecha(TotalesFechaIniciaPoliza.Value)
    else
    frmEdicionVenta.tblDatosVenta.Params[0].value:= ExtraerFecha(glbfechatrndiaria);

    frmEdicionVenta.tblDatosVenta.Open;
    frmEdicionVenta.Caption := 'Procesa devolución';
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
        esInsertando:=True;
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
        frmProcVentaRapidaEdicion.rxVentaMontoNeto.Value   := frmEdicionVenta.tblDatosDetVALOR_TOTAL_DET.Value;
        frmProcVentaRapidaEdicion.rxVentaCodArticulo.Value := frmEdicionVenta.tblDatosDetCODIGO_PROD.AsInteger;
        FGlbPorcItbi(ExtraerFecha(rxVentaFecha.Value), rxVentaCodArticulo.Value);
        rxVentaIDTasaITBIS.Value := GlbIDTasa;
        if (GlbIgI = 1) and (GlbCalcItbis = 0) then
        rxVentaIDTasaITBIS.Value := 1;
        frmProcVentaRapidaEdicion.rxVentaRutaImagen.Value  := BuscarRutaImagen(frmEdicionVenta.tblDatosDetCODIGO_PROD.AsInteger);
        frmProcVentaRapidaEdicion.rxVentaMontoDescItem.Value:= frmProcVentaRapidaEdicion.rxVentaMontoBruto.Value * frmEdicionVenta.tblDatosDetPORC_DESC_DET.Value / 100;

        rxVentaCostoProducto.Value := frmEdicionVenta.tblDatosDetPRECIO_COMPRA.Value;
        frmProcVentaRapidaEdicion.rxVentaporc_desc.Value   := frmEdicionVenta.tblDatosDetPORC_DESC_DET.Value;
        if not chkExento.Checked then
        frmProcVentaRapidaEdicion.rxVentaItbi.Value        := frmEdicionVenta.tblDatosDetITBI_DET.Value
        else frmProcVentaRapidaEdicion.rxVentaItbi.Value   := 0;
        frmProcVentaRapidaEdicion.rxVentaSerieProd.Value := frmEdicionVenta.tblDatosDetSERIE_PROD.Value;
        frmProcVentaRapidaEdicion.rxVenta.Post;
        frmEdicionVenta.tblDatosDet.Next;
      end;

      Totales.Close;
      Totales.Open;
      Totales.Insert;
      TotalesTipoDeIngreso.Value:='01';
      if (GlbFactRecurrente) then
      TotalesPreAbono.Value:=_MontoPrepago;
      //TotalesMoneda.Value := IntToStr(GlbMonedaBase);
      if (GlbMonedaBase > 0) then
      TotalesMoneda.Value  := IntToStr(GlbMonedaBase)
      else
      TotalesMoneda.Value   := '1';
      TotalesSubTotal.Value:=0;
      TotalesSubTotalScreen.Value := 0;
      Totalesitbis.Value          := 0;
      Totalesmontodesc.Value:=0;
      Totalestotalneto.Value:=0;
      Totalesmontorecibido.Value:=0;
      Totalesdevolucion.Value:=0;
      if TotalesTipoNCF.IsNull then
      begin
        if GlbActivaECF = 1 then
          TotalesTipoNCF.Value:='32'
        else TotalesTipoNCF.Value:='02';
      end;
      if not LlenandoDatos then
      Totales.Post;

      if Totales.State = dsBrowse then
      Totales.Edit;
      TotalesCodCliente.Value:=frmEdicionVenta.tblDatosVentaCODIGO_CTE.Value;
      TotalesComentario.Value := frmEdicionVenta.tblDatosVentaCOMENTARIO.Value;
      TotalesPorcDesAdicional.Value:= frmEdicionVenta.tblDatosVentaPORC_DESCUENTO.Value;
      if Totales.State = dsBrowse then
      Totales.Edit;
      TotalesMontoDescAdicional.Value :=  frmEdicionVenta.tblDatosVentaMONTO_DESCUENTO.Value;
      if not LlenandoDatos then
      Totales.Post;
      if not frmEdicionVenta.tblDatosVentaNOMBRE_CLIENTE_GENERAL.IsNull then
      frmProcVentaRapidaEdicion.edtObservacion.Text:= frmEdicionVenta.tblDatosVentaNOMBRE_CLIENTE_GENERAL.Value;
      try
        frmProcVentaRapidaEdicion.BitBtn4.Enabled:=True;
        ProcesandoVenta := False;
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



procedure TfrmProcVentaRapida.chkExentoExit(Sender: TObject);
var
  _book : TBookmark;
begin
  //LogProcedure('TfrmProcVentaRapida.chkExentoExit');
  //if rxVenta.Modified then
  //LogInfoLoop('rxVenta.Modified=True');
  //t BitBtn27Click(Self);
  if not GlbCalculado then
  CalcularTotalesInterno;
end;

procedure TfrmProcVentaRapida.RxDBGrid2KeyPress(Sender: TObject;
  var Key: Char);
begin
  //LogProcedure('TfrmProcVentaRapida.RxDBGrid2KeyPress');
 // if Key = '#13' then
 // RxDBGrid2DblClick(Self);
end;

{procedure TfrmProcVentaRapida.RxDBGrid2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = 13 then
  RxDBGrid2DblClick(Self);
end;}

procedure TfrmProcVentaRapida.RxDBGrid2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    Key := 0;                     // Evita el beep del grid
    PostMessage(Handle, WM_SET_FOCUS_CBOX, 0, 0);
  end;
end;

procedure TfrmProcVentaRapida.WMSetFocusCBox(var Msg: TMessage);
begin
  RxDBGrid2DblClick(RxDBGrid2);   // tu rutina habitual
  FocusCBox;                      // pasamos el foco con seguridad
end;

procedure TfrmProcVentaRapida.FocusCBox;
begin
    SafeSetFocus(cboxTipoUnidad);

  //if Assigned(cboxTipoUnidad) and
  //   cboxTipoUnidad.CanFocus then   // incluye Visible + Enabled + padres visibles
  //  cboxTipoUnidad.SetFocus;
end;

procedure TfrmProcVentaRapida.AsignarSqlText(campo, valor,OrderBy: String);
var
  nombProc:string;
begin
  //LogProcedure('TfrmProcVentaRapida.AsignarSqlText');
  qryProductos.DisableControls;
  if qryProductos.Active then
  qryProductos.Close;
  if (GlbVenderDesdeAlmacenP = 1) or (GlbCodDivInventario = 1)then
  nombProc:='PROC_INV_VENTA_EST'
  else
  nombProc:='PROC_INV_VENTA';
  if (campo = '') then
  begin
    sqlAsignado := True;

    qryProductos.SQL.Text:=
    Format('Select INV.*, tipo_inv.Descripcion Desc_tipoInv ' +
           'From %s(%s) INV ' +
           'Left outer join TIPO_INVENTARIO tipo_inv on tipo_inv.CODIGO = inv.TIPO ' +
           ' WHERE INV.CIA_KEY=:CIAKEY ' +
           ' ORDER BY INV.codigo, INV.tipo,INV.descripcion, INV.Referencia', [nombProc, IntToStr(GlbCodDivInventario)]);
  end else
  qryProductos.SQL.Text:=
  Format('Select INV.*,tipo_inv.Descripcion Desc_tipoInv ' +
         'From %s(%s) INV '+
         ' inner join TIPO_INVENTARIO tipo_inv on tipo_inv.CODIGO = inv.TIPO ' +
         ' AND inv.tipo = tipo_inv.codigo AND UPPER(inv.%s) like %s ' +
         ' WHERE inv.CIA_KEY=:CIAKEY ' +
         ' ORDER BY INV.codigo, INV.tipo,INV.descripcion, INV.Referencia',[nombProc, IntToStr(GlbCodDivInventario), Campo, Valor]) ;

  qryProductos.Params[0].Value:= glbCia_Key;
  qryProductos.Open;

  if (qryProductos.RecordCount = 0) and (campo <> '') then
  begin
    qryProductos.SQL.Text:=
    Format('Select INV.*,tipo_inv.Descripcion Desc_tipoInv  From %s(%s) INV, TIPO_INVENTARIO tipo_inv ' +
        ' WHERE INV.CIA_KEY=:CIAKEY AND inv.tipo = tipo_inv.codigo AND UPPER(inv.%s) like %s ',[nombProc, IntToStr(GlbCodDivInventario), 'codigo_texto', Valor]) +
        ' ORDER BY INV.codigo, INV.tipo,INV.descripcion, INV.Referencia';
    qryProductos.Close;
    qryProductos.Params[0].Value:= glbCia_Key;
    qryProductos.Open;
  end;

  qryProductos.EnableControls;
  qryProductos.Last;
  Label64.Caption:='QTYInv'+IntToStr(qryProductos.recordCount);
  qryProductos.First;
end;

procedure TfrmProcVentaRapida.chkExentoEnter(Sender: TObject);
begin
  //LogProcedure('TfrmProcVentaRapida.chkExentoEnter');
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
  GlbEsCopia:=True;
  UImpresionVentas.ReImprimirRecibo;
  Refresh;
end;

procedure TfrmProcVentaRapida.FormShow(Sender: TObject);
begin
   if (GlbCajaeCF <> '') and (UpperCase(GetComputerNameStr)<>UpperCase(GlbCajaeCF)) then
   begin
     Exit;
     BitBtn4.Enabled:=False;
     ProcesandoVenta := False;
     BitBtn6.Enabled:=False;
   end;
  //LogProcedure('TfrmProcVentaRapida.FormShow');
  if Assigned(frmRegServicioTaller) and (frmRegServicioTaller.xCerrar) then
  begin
    frmRegServicioTaller.Free;
    frmRegServicioTaller:=Nil;
  end;
  ProcActUltTrn;
  isShowing:=True;
  if (GlbActivaCafeteria = 1) or (GlbActivaProduccion = 1) then
  label26.Visible := True
  else label26.Visible := False;
  //SkinData1.Active := False;
  Application.ProcessMessages;
  //t SkinData1.Active := True;
  tblMoneda.Close;
  tblMoneda.Open;
  qryCliente.Close;
  qryCliente.Open;
  if rxVenta.Recordcount = 0 then
  begin
    tablaPropietario.Close;
    tablaPropietario.Open;
  end;
  qryVence.Close;
  qryVence.Open;
  AbrirUnidades;
//t  frmProcVentaRapida.Height:=744;
  
  if canCloseAlquiler then
  close
  else
  if Assigned(frmAlquiler) and canCloseAlquiler then
  begin
    frmAlquiler.hide;
    //frmAlquiler.free;
    //frmAlquiler:=nil;
  end;
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
  if not BitBtn18.Visible then
  BitBtn19.Left:=BitBtn18.Left;
  rxlblAvisoCierreZ.Visible:=false;
  if (GlbActivaCafeteria = 1) then
  begin
    if not ProcedVerificaCierreZ then
    rxlblAvisoCierreZ.Visible:=true
    else rxlblAvisoCierreZ.Visible:=false;
  end;
  if (GlbComerEs1ro = 1) then
  begin
    CheckBox1.Checked:=False;
  end;
end;

procedure TfrmProcVentaRapida.RxLabel1Click(Sender: TObject);
begin
  //LogProcedure('TfrmProcVentaRapida.RxLabel1Click');
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
  cantidadanterior:real;
begin
  //LogProcedure('TfrmProcVentaRapida.ProcVenta');
  xexiste := false;

  if (seriedoc <= 0 ) then
  begin
    serieDoc:= FsqlMaxNumeroFactura('gen_num_factura');//FsqlMaxNumero('facturas','numero');
    if (serieDoc = 0) then
    serieDoc :=1;
  end;
   if (GlbUsaFctMexico = 1) and (not TotalesFechaIniciaPoliza.IsNull) and (GLBSam = 1) then
  ipStpInsertVentMast.Params[1].Value := ExtraerFecha(TotalesFechaIniciaPoliza.Value)
  else
  ipStpInsertVentMast.Params[1].Value := ExtraerFecha(GlbFechaTrnDiaria);

  //ipStpInsertVentMast.Params[1].Value:= GlbFechaTrnDiaria;
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
  if abs(TotalesMontoDescAdicional.Value) > 0 then
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
  ipStpInsertVentMast.Params[39].Value:= TotalesPropina.Value;
  ipStpInsertVentMast.Params[40].Value:= GlbPorcPropina;
  ipStpInsertVentMast.Params[41].Value:= TotalesPropinaLegal.Value;
    if not rxPreventaticket_id.IsNull then
  ipStpInsertVentMast.Params[42].Value:= rxPreventaticket_id.Value //ticket fast food limao
  else
  ipStpInsertVentMast.Params[42].Value:= null;
  if (rxCoberturaMontoCobertura.Value > 0) then
  ipStpInsertVentMast.Params[43].Value:= 1
  else
  ipStpInsertVentMast.Params[43].Value:= 0;

  ipStpInsertVentMast.Params[44].Value:= Null;
  ipStpInsertVentMast.Params[45].Value:= Null;
  
  if GLBSAM = 1 then
  begin
    if not TotalesFechaIniciaPoliza.IsNull then
    ipStpInsertVentMast.Params[44].Value:= TotalesFechaIniciaPoliza.AsDateTime;
    if not TotalesTipoAfiliado.IsNull then
    ipStpInsertVentMast.Params[45].Value:= TotalesTipoAfiliado.Value;
  end;
  ipStpInsertVentMast.Params[46].Value:= TotalesidNumeroDVeh.Value;

  if Totalestipodeingreso.IsNull then
  ipStpInsertVentMast.Params[47].Value:= 1
  else
  ipStpInsertVentMast.Params[47].Value:= Totalestipodeingreso.AsInteger;

  if (GlbActivaECF = 1) and (Totalestipodeingreso.IsNull or
  (Totalestipodeingreso.Value = '0') or (Totalestipodeingreso.Value = '')) then
  ipStpInsertVentMast.Params[47].Value:=1;

  Try
    ipStpInsertVentMast.ExecProc; //2 - venta a credito
    Totales.Edit;
    TotalesVentaGuardada.Value:=1;
    Totales.Post;    
    isMasterSave:=True;
  except on E : Exception do
    begin
      Totales.Edit;
      TotalesVentaGuardada.Value := 0;
      Totales.Post;    
      if ipStpInsertVentMast.Transaction.InTransaction then
      begin
        try
        ipStpInsertVentMast.Transaction.Rollback;
        except
        end;
      end;
      MessageDlg('Error guardando en master:'+e.Message,mtError,[mbok],0);
      LogInformacionTxt('Error guardando en master, factura a crédito:'+e.Message);
      Exit;
    end;
  end;

  numeroTrnVta:= ipStpInsertVentMast.Params[0].Value;
  ProcUpdateCtrlNumVta(numeroTrnVta);
  ProcGuardarDatosCoti(numeroTrnVta);
   
   if TotalesPreAbono.Value > 0 then
   ProcActualizarStadoPrepP(tablaPropietarioCodigoPropietario.Value,numeroTrnVta);

  if (GLBSAM = 1) then
  begin
    if (totalesReferenciaCte.Value <> '') then
    ProcActualizaSecCertSAM(totalesReferenciaCte.AsInteger);
  end;
  
  //Guardar Datos ventas con seguros
  if (GlbFarmacia = 1) then
  ProcInsertarDatosVtaSeguro(ipStpInsertVentMast.Params[0].Value);

  DatosVocado(numeroTrnVta,ipStpInsertVentMast.Params[5].Value);
  ProcUpdateNumDLinea(GlbNumVtaPOS,numeroTrnVta,1);
  Totales.Tag:=numeroTrnVta;
  ProcUpdateItbiRecargoVtaMast(numeroTrnVta);

  if (TotalesTipoNCF.Value = '15') OR (TotalesTipoNCF.Value = '14') then
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
  ProcGuardarDatosCoti(numeroTrnVta);

  if (GlbMutur = 1) then
  begin
    if (_chassisVeh = '') then
    btnAsignarVehClick(Self);

    qryDatosVh.close;
    qryDatosVh.params[0].value:= _chassisVeh;
    qryDatosVh.open;

    tblDatosVentaVehiculos.Close;
    tblDatosVentaVehiculos.Params[0].Value := ipStpInsertVentMast.Params[0].Value;
    tblDatosVentaVehiculos.Open;
    if tblDatosVentaVehiculos.recordcount = 0 then
    begin
    tblDatosVentaVehiculos.Append;
    tblDatosVentaVehiculosMONTO_INICIAL.Value:= TotalesTotalNeto.Value;
    tblDatosVentaVehiculosNUM_SERIE.Value:=ipStpInsertVentMast.Params[0].Value;
    tblDatosVentaVehiculosCHASSIS.Value:=qryDatosVhCHASSIS.Value;
    tblDatosVentaVehiculosMARCA.Value:=qryDatosVhMARCA_VEHICULO.Value;
    tblDatosVentaVehiculosMODELO.Value:=qryDatosVhMODELO.Value;
    GlbSalvarQuery(tblDatosVentaVehiculos);
    qryDatosVh.close;
    tblDatosVentaVehiculos.close;
    _chassisVeh:='';
    end;
  end;

  //Factura a Credito
  ProcInsertarDetEfectivo(ipStpInsertVentMast.Params[0].Value,ipStpInsertVentMast.Params[5].Value);

  if (GlbFactRecurrente) then
  ProcInsertarDetEfectivoC(ipStpInsertVentMast.Params[0].Value,FPagoFctR, _montoAbonoC);

  ActualizaCodUsrCaja(numeroTrnVta);

  //NumTicketFFood:=numeroTrnVta;
  if NumTicketFFood > 0 then
  if (GlbPorcPropina > 0) then
  ActFastFoodTicket(NumTicketFFood);

  if (GlbActivaIFiscal = 1) then
  FInsertarDatosCtrlNIF(numerotrnvta);

  rxVenta.DisableControls;
  rxVenta.First;
  While not rxVenta.Eof do
  begin
    if (rxVentaStatus.Value = 'C') or (rxVentaCodArticulo.Value = 0) then
    begin
      rxVenta.Next;
      continue;
    end;
    if (GlbEsDebugEntradas = 1) then
    begin
      qryVerificaInv.Close;
      qryVerificaInv.Params[0].Value:= rxVentaCodArticulo.Value;
      qryVerificaInv.Open;
      cantidadanterior:=qryVerificaInvCantidad.Value;
      //ProcVerificaActInventario(rxVentaCodArticulo.Value,rxVentaCant.Value,cantidadanterior);
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

    if Not ibStpActualizaInvProd.Transaction.InTransaction then
    ibStpActualizaInvProd.Transaction.StartTransaction;
    try
      ibStpActualizaInvProd.Transaction.CommitRetaining;
    except
    ibStpActualizaInvProd.Transaction.RollbackRetaining;
    end;

    if (rxVentaTipoVenta.Value = 0) or (rxVentaTipoVenta.IsNull )  then //Item de Venta
    begin
      try
      ActualizaInvAlmacen;
      except on E : Exception do
      begin
        NotificaErrorByEmail('Actualizando Cant Inventario (stpMantInvAlmacen.ExecProc;):'+rxDataAntCantFinal.AsString+
        ' #Trn '+IntToStr(NumeroTrn)+LF+CR+e.Message);
        WriteToLog('Actualizando Cant Inventario (stpMantInvAlmacen.ExecProc;):'+rxDataAntCantFinal.AsString+
        ' #Trn '+IntToStr(NumeroTrn)+LF+CR+e.Message);
      end;
      end;
    end;

    if (GlbEsDebugEntradas = 1) then
    begin
      ProcVerificaActInventario(rxVentaCodArticulo.Value,rxVentaCant.Value,cantidadanterior,numerotrnvta);
    end;

    rxVenta.Next;
  end;
  rxVenta.EnableControls;

  if Not ibStpInsertVentaDet.Transaction.InTransaction then
  ibStpInsertVentaDet.Transaction.StartTransaction;
  try
    ibStpInsertVentaDet.Transaction.CommitRetaining;
  except
  ibStpInsertVentaDet.Transaction.RollbackRetaining;
  end;

  if (rxVenta.RecordCount > 0) and (rxCoberturaMontoCobertura.Value > 0) then
  InsertaBalanceARS(rxCoberturaMontoCobertura.Value,1, rxCoberturaCodigo_Cliente.Value);

  if EsConduce then
  begin
    ActualizaConduce1Click(self);
  end;
  if Not ibStpActualizaInvProd.Transaction.InTransaction then
  ibStpActualizaInvProd.Transaction.StartTransaction;
  try
    ibStpActualizaInvProd.Transaction.CommitRetaining;
  except
  ibStpActualizaInvProd.Transaction.RollbackRetaining;
  end;
  NumeroTrn:= ipStpInsertVentMast.Params[0].Value;
  ProcGuardarDatosCoti(numeroTrnVta);
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

      PrepararInfoFiscal(NumeroTrn);

      GlbNombreFiletoPrint:= Format('%s%s%s%s%s%s%s',[dmReportes.qryDatosCajaImpUserRUTA_TICKET.Value,'\Recibo',Trim(GlbCodSucursal),Trim(GlbModeloImpresora),
      IntToStr(VarUsuarioGlb),StrLeftPad(IntToStr(dmReportes.qryDatosVentaMasterNUMERO.Value),8),'.txt']);

      dmreportes.qryNCFAfectado.Close;
      dmreportes.qryNCFAfectado.Params[0].Value:= dmReportes.qryDatosVentaMasterSERIE_NCF_ASIGNADO.Value;
      dmreportes.qryNCFAfectado.Open;

      frmTestImpresoraFiscal:=TfrmTestImpresoraFiscal.Create(Nil);
      try
        frmTestImpresoraFiscal.LCantCopias := rxspinImpCantCopias.Text;
        frmTestImpresoraFiscal.Button1Click(Self);

        ProcInsFiscalCtrl(dmReportes.qryViewVentasMastNUMERO.Value,
        dmReportes.qryViewVentasMastFECHA.Value,xexiste);

        frmTestImpresoraFiscal.btnImprimeReciboClick(Self);//Button1Click(Self);
        Sleep(4000);
        repeat
          ProcInsFiscalCtrl(dmReportes.qryViewVentasMastNUMERO.Value,
          dmReportes.qryViewVentasMastFECHA.Value,xexiste);
        until not GlbImprimiendo;
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
    if (GlbFact55Pulg = 1) and (8=9) then //Formato inactivo, verificar
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
     if (UpperCase(GLBFormatoFactura) = 'FORMAFACOCO') then
      begin
        Exit;//will be process after this procedure
      end else
      begin
        Exit;//will be process after this procedure
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
      Exit;//will be process after this procedure
      TipoVenta := 'CREDITO';

      if (TipoVenta = 'CREDITO') then
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
        if GlbImpTicketVtaAgua = 1 then
        ImprimirTicketVtaAgua(ipStpInsertVentMast.Params[0].Value);
      end else
      begin

      Exit;//will be process after this procedure

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
  //LogProcedure('TfrmProcVentaRapida.LectorCodBarra1Click');
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



procedure TfrmProcVentaRapida.ImprimirLabel1Click(Sender: TObject);
begin
  //LogProcedure('TfrmProcVentaRapida.ImprimirLabel1Click');
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
  LogProcedure('TfrmProcVentaRapida.NoGenerarNCF1Click. Usuario accionó NCF');

// 1. Desvinculamos el evento para evitar que se llame a sí mismo
  NoGenerarNCF1.OnClick := nil; 
  try
    // 2. Cambiamos la visibilidad del Label
    Label21.Visible := not Label21.Visible;

    // 3. Forzamos el estado del CheckBox
    NoGenerarNCF1.Checked := Label21.Visible;

    // 4. Ajustamos el otro control
    CheckBox1.Visible := not Label21.Visible;
    CheckBox1.Checked := not CheckBox1.Checked;
  finally
    // 5. Reasignamos el evento para que siga funcionando después
    NoGenerarNCF1.OnClick := NoGenerarNCF1Click;
  end;
  
  CheckBox1Click(Self);
end;

procedure TfrmProcVentaRapida.BitBtn16Click(Sender: TObject);
begin
  //LogProcedure('TfrmProcVentaRapida.BitBtn16Click');
  frmConsultaPrecio:=TfrmConsultaPrecio.Create(Nil);
  try
    if frmConsultaPrecio.Showmodal = mrOk then
    begin
      edtCodigo.Text:= frmConsultaPrecio.qryProductosCODIGO.AsString;
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
  finally
  frmConsultaPrecio.Free;
  frmConsultaPrecio := Nil;
  end;
end;

procedure TfrmProcVentaRapida.Finalizardisplay;
var
  puerto, linea1, linea2 : String;
begin
  //LogProcedure('TfrmProcVentaRapida.Finalizardisplay');
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
  //LogProcedure('TfrmProcVentaRapida.ActualizaInvAlmacen');
  stpMantInvAlmacen.Params[0].Value := rxVentaCodArticulo.Value;//codigo inventario
  stpMantInvAlmacen.Params[1].Value := GlbCodDivInventario;//inventario_id
  if EsDevolucion then
  begin
    stpMantInvAlmacen.Params[2].Value := rxVentaCant.Value;
    if (rxVentaTipoUnidad.Value = 1) or (rxVentaTipoUnidad.Value = 0)  then
      stpMantInvAlmacen.Params[2].Value:= rxVentaCant.Value
    else
    begin
      stpMantInvAlmacen.Params[2].Value:= rxVentaCant.Value * CantUnidad;
    end;
  end else
  begin
    //stpMantInvAlmacen.Params[2].Value := rxVentaCant.Value * -1;
    if (rxVentaTipoUnidad.Value = 1) Or (rxVentaTipoUnidad.Value = 0) then
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
  stpMantInvAlmacen.Params[9].Value := glbCia_Key;
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
  //LogProcedure('TfrmProcVentaRapida.FormHide');
  isShowing:=False;
end;

procedure TfrmProcVentaRapida.ProcFAplicaPrecioMayorista(codprod:integer);
begin
  //LogProcedure('TfrmProcVentaRapida.qryProductosAfterScroll');
  FAplicaPrecioMayorista := False;
  Label23.Visible := False;
  if qryClasifPrecio.state = dsInactive then exit;
  if qryClasifPrecio.Locate('COD_PRODUCTO', codprod,[]) then
  begin
    FAplicaPrecioMayorista := True;
    Label23.Visible := True;
  end;
end;
procedure TfrmProcVentaRapida.AbrirClasifPrecio;
begin
  //LogProcedure('TfrmProcVentaRapida.AbrirClasifPrecio');
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
var
  guardarRec : TBookMark;
begin
  //LogProcedure('TfrmProcVentaRapida.AplicaPrecioMayorista');
  if rxVenta.state = dsInactive then Exit;
  if rxVenta.RecordCount = 0 then Exit;
  guardarRec:= rxVenta.GetBookmark;
  try
  sumarDatos:=False;
  qryClasifPrecio.Close;
  qryClasifPrecio.Params[0].Value := tablaPropietarioCodigoPropietario.Value;//qryClientePRECIO_ID.Value;
  qryClasifPrecio.Open;
  rxVenta.AutoCalcFields := False;
  rxVenta.First;
  While Not rxVenta.Eof Do
  begin
    if (rxVentaStatus.Value = 'C') or (rxVentaCodArticulo.Value = 0) then
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
  finally
    if Assigned(guardarRec) then
    begin
      rxVenta.GotoBookmark(guardarRec);
      rxVenta.FreeBookmark(guardarRec);
    end;
  end;
end;

procedure TfrmProcVentaRapida.CheckTipoNCFCte;
begin
  //LogProcedure('TfrmProcVentaRapida.CheckTipoNCFCte');
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

procedure TfrmProcVentaRapida.ProcActualizarStadoPrepP(cte: integer;numtrn:integer);
begin
  //LogProcedure('TfrmProcVentaRapida.ProcActualizarStadoPrepP');
  if rxPrepagoAplicado.State = dsInactive then exit;
  if rxPrepagoAplicado.State = dsInactive then exit;
  dmFactura.tblPrepagoCte.Close;
  dmFactura.tblPrepagoCte.Params[0].Value:= cte;
  dmFactura.tblPrepagoCte.Open;
  dmFactura.tblPrepagoCte.First;
  rxPrepagoAplicado.First;
  while not rxPrepagoAplicado.Eof do
  begin
    if  dmFactura.tblPrepagoCte.Locate('numero', rxPrepagoAplicadoNumero.Value,[]) then
    begin
      if (dmFactura.tblPrepagoCteSTATUS.Value = 'A') then
      begin
        dmFactura.tblPrepagoCte.Edit;
        dmFactura.tblPrepagoCteNUM_TRN_VTA.Value:= NumTrn;
        dmFactura.tblPrepagoCteSTATUS.Value:= 'R';
        GlbSalvarQuery(dmFactura.tblPrepagoCte);
      end;
    end;
    rxPrepagoAplicado.Next;
  end;
end;

procedure TfrmProcVentaRapida.ProcVerificaPreAbono;
begin
  //LogProcedure('TfrmProcVentaRapida.ProcVerificaPreAbono');
  if rxPrepagoAplicado.State = dsInactive then
  rxPrepagoAplicado.Open;
  if rxPrepagoAplicado.RecordCount > 0 then
  exit;

  dmFactura.tblPrepagoCte.Close;
  dmFactura.tblPrepagoCte.Params[0].Value:= tablaPropietarioCodigoPropietario.Value;
  dmFactura.tblPrepagoCte.Open;

  if (dmFactura.tblPrepagoCte.RecordCount > 0) then
  begin
    dmFactura.tblPrepagoCte.First;
    _MontoPrepago:=0;
    while not dmFactura.tblPrepagoCte.Eof do
    begin
      if (dmFactura.tblPrepagoCteSTATUS.Value = 'A') then
      begin
        if not dmFactura.tblPrepagoCteMONTO.IsNull then
        begin
          _MontoPrepago:=_MontoPrepago + dmFactura.tblPrepagoCteMONTO.Value;
          rxPrepagoAplicado.Insert;
          rxPrepagoAplicadoNumero.Value:= dmFactura.tblPrepagoCteNUMERO.Value;
          rxPrepagoAplicadoMonto.Value := dmFactura.tblPrepagoCteMONTO.Value;
          rxPrepagoAplicado.Post;
        end;
      end;
      dmFactura.tblPrepagoCte.Next;
    end;
    if Totales.state = dsBrowse then
    Totales.edit;
    TotalesPreAbono.Value:=_MontoPrepago ;
    DBEdit17.Visible := True;
    DBEdit17.BringToFront;

  end;
end;

function TfrmProcVentaRapida.VerificaLimiteCredito(codigocte: integer;
  MontoVenta: Real): Boolean;
var
  limite_Credito : Real;
begin
  //LogProcedure('TfrmProcVentaRapida.VerificaLimiteCredito');
  ibsqlBceCxcCte.Close;
  ibsqlBceCxcCte.Params[0].Value := codigocte;
  ibsqlBceCxcCte.ExecQuery;
  qryCliente.Close;
  qryCliente.Open;
  qryCliente.Locate('CODIGO_CTE', codigocte,[]);

  limite_Credito:=qryClienteLIMITE_CREDITO.Value  -
                  ibsqlBceCxcCte.FieldByName('balance_act').Value;
  if qryClienteCANT_DIAS_CREDITO.IsNull then
  begin
    Result:=False;
    NoTieneDiasDeCredito:=True;
    Exit;
  end else
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
  //LogProcedure('TfrmProcVentaRapida.FormCloseQuery');
  if Assigned(frmAlquiler) and (not canCloseAlquiler ) then
  begin
    CanClose:=False;
    Hide;
    frmAlquiler.Show;
    exit;
  end;

  //if Assigned(frmConsultaFacturas) then
  if Assigned(frmRegServicioTaller) then
  begin
    if (dmVentas.tblRegServicioMaster.State in [dsInsert, dsEdit]) or
       (dmVentas.tblRegServicioDet.State in [dsInsert, dsEdit]) then
     begin
       if MessageDlg('Tienes datos pendientes para guardar en servicio, aún desea salir?',mtWarning,[mbyes,mbno],0) = mrno then
       begin
         frmRegServicioTaller.Show;
         CanClose := False;
         exit;
       end else
       begin
         FreeAndNil(frmRegServicioTaller);
         CanClose:=True;
         //exit;
       end;
     end else
     begin
       //Exit;
     end;
  end;
  if (rxVenta.RecordCount > 0) then
  begin
    //if not VerificaHuellas then
    //begin
      //if VerificaClave then
      if VerificaHuellas then
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
      end else
      begin
        if MessageDlg('Realmente desea salir con una venta en curso?',mtWarning,[mbyes,mbno],0) = mryes then
        CanClose:= True else
        CanClose:= False;
      end;
    //end;
  end;
  SecretPanel1.Active:=False;
  SecretPanel1.Visible:=false;
end;

procedure TfrmProcVentaRapida.RxDBGrid3DblClick(Sender: TObject);
begin
  //LogProcedure('TfrmProcVentaRapida.RxDBGrid3DblClick');
  RxDBGrid3.Visible := False;
end;

procedure TfrmProcVentaRapida.SecretPanel1DblClick(Sender: TObject);
begin
  //LogProcedure('TfrmProcVentaRapida.SecretPanel1DblClick');
  RxDBGrid3.Visible   := True;
  SecretPanel1.Visible:= False;
end;

procedure TfrmProcVentaRapida.NoMostrarProdVencidos1Click(Sender: TObject);
begin
  //LogProcedure('TfrmProcVentaRapida.NoMostrarProdVencidos1Click');
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
  //LogProcedure('TfrmProcVentaRapida.rxLabelVenceDblClick');
  RxDBGrid3.Visible:= True;
end;


procedure TfrmProcVentaRapida.cboxTipoUnidadChange(Sender: TObject);
var
  xflag:boolean;
begin
  //LogProcedure('TfrmProcVentaRapida.cboxTipoUnidadChange');
  if rxVenta.State In [dsBrowse] Then
  rxVenta.Edit;
  xflag:=False;

  dmVentas.qryPrecioUnidadSurt.Close;
  dmVentas.qryPrecioUnidadSurt.Params[0].Value:=rxVentaCodArticulo.Value;
  dmVentas.qryPrecioUnidadSurt.Open;

  //dmVentas.qryPrecioUnidadSurt.recordcount
  xflag:=True;
  //if (GlbUsaPUnidadLevel = 1) or (GLBPrecioMayUnidad = 1) then
  if (GlbUsaPUnidadLevel = 1) then
  if Not dmVentas.qryPrecioUnidadSurt.Locate('COD_PRODUCTO;DESCRIPCION',
  VarArrayOf([rxVentaCodArticulo.Value,cboxTipoUnidad.Text]),[]) then
  begin
    if (GlbUsaPUnidadLevel = 1) then
    begin
      MessageDlg('Unidad no encontrada en precio por unidad, verifique.', mtError, [mbOk], 0);
      xflag:=False;
    end;
  end else
  begin
    DSQryPrecios.DataSet := dmVentas.qryPrecioUnidadSurt;
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
    GlbTipoUnidad:= dmInventario.qryTipoUnidadIDUNIDAD.Value;
    CantUnidad   := dminventario.qryTipoUnidadCANTIDAD.Value;
    rxVentaTipoUnidad.Value := GlbTipoUnidad;
    panelTempPrecioLevels.Visible:=True;
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
  LogProcedure('TfrmProcVentaRapida.LlenarTipoUnidadBox');
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
  //LogProcedure('TfrmProcVentaRapida.cboxTipoUnidadExit');
  if not Self.Visible or not isShowing then Exit;
  if rxVentaCodTexto.IsNull then exit;
  if rxVentaDescUnidadMedida.isNull or (rxVentaDescUnidadMedida.Value = '') then
  begin
    if rxVenta.State = dsBrowse then rxVenta.Edit;
    rxVentaDescUnidadMedida.Value:=cboxTipoUnidad.Text;
  end;

  if rxVenta.State in [dsEdit, dsInsert] then
    rxVenta.Post;

  //t cboxTipoUnidadChange(Self);
  if rxVenta.State = dsBrowse then rxVenta.Edit;

  //if (GlbTipoUnidad = 0) then GlbTipoUnidad= 1;

  if rxVenta.State In [dsedit,dsInsert] then           
  rxVentaTipoUnidad.Value:=GlbTipoUnidad;
  panel2.Height:=87;
  panel2.Visible := False;
  if glbUsaescalaPrecio = 0 then
  panelTempPrecioLevels.Visible:= False;

  SolicitarCalculoTotales(tcUnidad);
  
  if (isShowing) then
  begin
    DBEdit1.SetFocus;
    DBEdit1.SelectAll;
    DBRadioGroup1.BringToFront;
    Label59.BringToFront;
  end;
end;

function TfrmProcVentaRapida.precioXUnidad(idTipoUnidad:Integer;idProducto: Integer): Extended;
begin
  //LogProcedure('TfrmProcVentaRapida.precioXUnidad');
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
  LogProcedure('TfrmProcVentaRapida.Label25TemporalrenameClick');
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
  LogProcedure('TfrmProcVentaRapida.RxSpeedButton1Click');
  if (rxVenta.recordcount = 0) then exit;
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
    ProcesandoVenta := False;
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
    //t label25.Font.Color   := clBlack;
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

    if (GlbNumVtaPOS > 0) then
    dmcalculos.ProcDeletePosExtraDet(GlbNumVtaPOS);
    GlbNumVtaPOS:=-1;
    GlbNumeroTrn:=-1;
    xCodProd:=-1;
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
  LogProcedure('TfrmProcVentaRapida.MaestroInventario1Click');
   dmInventario.tblInventarioProd.Close;//dmInventario.tblInventarioProd.selectSQL.TEXT
   dmInventario.tblInventarioProd.Filtered:=False;
   dmInventario.tblInventarioProd.SelectSQL.Text := dmInventario.qryInvProd_Base.Sql.Text;
   dmInventario.tblInventarioProd.Params[0].Value:=glbCia_Key;

  frmInventarioProd:=TfrmInventarioProd.Create(Nil);
  try
    dmUsuarios.qryRoles.Close;
    dmUsuarios.qryRoles.Params[0].Value:= VarUsuarioGlb;
    dmUsuarios.qryRoles.Open;
    dmUsuarios.qryRoles.First;
    While Not dmUsuarios.qryRoles.Eof Do
    begin
      ActivaPermiso(TForm(frmInventarioProd), 1000, dmUsuarios.qryRolesID_ROL.Value, 0);//menu principal: 1000 debe estar en la tabla PROCESOS
      dmUsuarios.qryRoles.Next;
    end;
      
    frmInventarioProd.PageControl1.TabIndex:=0;
    dmInventario.tblInventarioProd.DisableControls;
    if not dmInventario.tblInventarioProd.Locate('codigo', rxVentaCodArticulo.Value,[]) then
    dmInventario.tblInventarioProd.Locate('codigo_texto', rxVentaCodArticulo.Value,[]);
    dmInventario.tblInventarioProd.EnableControls;
    frmInventarioProd.ShowModal;
  finally
  frmInventarioProd.Free;
  frmInventarioProd:=Nil;
  end;
  dmVentas.qryPrecioMaxInv.Close;
  dmVentas.qryPrecioMaxInv.Params[0].Value:= GlbCia_Key;
  dmVentas.qryPrecioMaxInv.Open;
  sqlAsignado:=false;
  AsignarSqlText('','','');
  qryInventario.Close;
  qryInventario.Params[0].Value := glbCia_Key;
  qryInventario.Params[0].Value:=glbCia_Key;
  qryInventario.Open;

  //qryProductos.Close;
  //qryProductos.Params[1].Value:=glbCia_Key;
  //qryProductos.Open;
  
end;

procedure TfrmProcVentaRapida.ImprimirFactura(Avance: Integer);

var
  DeviceMode: THandle;
  Device, Driver, Port: array[0..1023] of char;
  ms: Integer; //margen superior
  nLineas: Integer;

   procedure SaltarLinea;
   begin
  LogProcedure('TfrmProcVentaRapida.ImprimirFactura');
      ms := ms + 100;
   end;
   procedure ImprimirLinea(Linea: String);
   begin
  LogProcedure('ImprimirLinea');
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
  //LogProcedure('TfrmProcVentaRapida.cboxTipoUnidadEnter');
  if (cboxTipoUnidad.Text = '') then
  BEGIN
    cboxTipoUnidad.Text:='UNIDAD';
    GlbTipoUnidad := 1;   
    CantUnidad:= 1;
  END;
  panel2.Height:=87;
  panel2.Visible := False;
  if glbUsaescalaPrecio = 0 then
  panelTempPrecioLevels.Visible:= False;
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
  dbedit3.Color:= clWindow;
  if not Self.Visible or not isShowing then Exit;
  //LogProcedure('TfrmProcVentaRapida.DBEdit3Exit');

  if rxVenta.Modified then
  LogInfoLoop('rxVenta.Modified=True');
  if rxVentaCodArticulo.IsNull then exit;
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
  LogProcedure('TfrmProcVentaRapida.RxDBGrid2Enter');
  GlbNumero:= rxVentaSerie.Value;
end;

procedure TfrmProcVentaRapida.RxDBGrid2Exit(Sender: TObject);
begin
  //LogProcedure('TfrmProcVentaRapida.RxDBGrid2Exit');
  GlbNumero:= rxVentaSerie.Value;
  if (rxLoteLotNum.IsNull) then
  begin
    rxLote.Close;
    rxLote.Open;
    rxLote.Insert;
    rxLoteLotNum.Value:= qryProductosLOTE_NUM.Value;
    rxLote.Post;
  end;
  if rxVenta.State in [dsEdit,dsInsert] then
  begin
    if rxVentaTipoUnidad.IsNull then
    begin
      rxVentaTipoUnidad.Value:=1;
      GlbTipoUnidad := 1;
      CantUnidad:= 1;
    end;
  end; //aqui aqui aqui es verifica qrytipounidad
  if (dmInventario.qryTipoUnidad.State = dsInactive) then
  AbrirUnidades;
  
  if Not dmInventario.qryTipoUnidad.Locate('IDUNIDAD', rxVentaTipoUnidad.Value, []) then
  begin  //dmInventario.qryTipoUnidad.params[0].value
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
    end;// else
    //MessageDlg('Unidad no encontrada, verifique.', mtError, [mbOk], 0);
  end else
  begin
    GlbTipoUnidad := dmInventario.qryTipoUnidadIDUNIDAD.Value;
    CantUnidad:= dminventario.qryTipoUnidadCANTIDAD.Value;
    cboxTipoUnidad.Text := dmInventario.qryTipoUnidadDESCRIPCION.Value;
  end;
  if GlbUsaPUnidadStd = 1 then
  begin
    if isShowing then
    SafeSetFocus(rxdblookupTipoUnidad) //elexitoesparteintegraldemiesencia
  end else
  //DBEdit1.SetFocus;
  edtCodigoExit(Self); 
  if glbUsaescalaPrecio = 0 then
  panelTempPrecioLevels.Visible:=False;
end;

procedure TfrmProcVentaRapida.ProcActTipoUnidad;
begin
  //LogProcedure('TfrmProcVentaRapida.ProcActTipoUnidad');
  dmVentas.qryPrecioUnidadSurt.Close;
  dmVentas.qryPrecioUnidadSurt.Params[0].Value:=rxVentaCodArticulo.Value;
  dmVentas.qryPrecioUnidadSurt.Open;

  if Not rxVentaTipoUnidad.IsNull then
  if dmVentas.qryPrecioUnidadSurt.Locate('IDUNIDAD', rxVentaTipoUnidad.Value,[]) then
  CantUnidad:=dmVentas.qryPrecioUnidadSurtCANTIDAD.Value
  else
  begin
    if rxVenta.state in [dsEdit, dsInsert] then
    begin
      if rxVentaTipoUnidad.IsNull then
         rxVentaTipoUnidad.Value:=1;
    end;
    GlbTipoUnidad:=1;
    if dmVentas.qryPrecioUnidadSurt.Locate('IDUNIDAD', rxVentaTipoUnidad.Value,[]) then
    begin
      CantUnidad:=dmVentas.qryPrecioUnidadSurtCANTIDAD.Value;
      cboxTipoUnidad.Text := 'UNIDAD';
    end else
    CantUnidad:=1;
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
  if (dmInventario.qryTipoUnidad.State = dsInactive) then
  AbrirUnidades;

  if Not dmInventario.qryTipoUnidad.Locate('IDUNIDAD', rxVentaTipoUnidad.Value, []) then
  begin
    GlbTipoUnidad := 1;//dmInventario.qryTipoUnidadIDUNIDAD.Value;
    CantUnidad    := 1;//dminventario.qryTipoUnidadCANTIDAD.Value;
    cboxTipoUnidad.Text := 'UNIDAD';dmInventario.qryTipoUnidadDESCRIPCION.Value;
    cboxTipoUnidad.BringToFront;
    cboxTipoUnidad.Enabled:=True;
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
    qryProdPorProveedor.Params[1].Value:= glbCia_Key;
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
  //LogProcedure('TfrmProcVentaRapida.ConsultaGeneral1Click');
  frmConsultaInventario:=TfrmConsultaInventario.Create(Nil);
  try
    if frmConsultaInventario.Showmodal = mrOk then
    begin
      edtCodigo.Text:= frmConsultaInventario.ibquery1codigo.AsString;
      xCodProd := frmConsultaInventario.ibquery1codigo.Value;
      edtCodigoExit(Self);
      DBEdit2Exit(Self);
      if isShowing then
      DBEdit1.SetFocus;
      PostMessage(DBEdit1.Handle, WM_SETFOCUS, 0, 0);
    end;
    panel2.Height:=87;
    panel2.Visible:=False;
    if glbUsaescalaPrecio = 0 then
    panelTempPrecioLevels.Visible:= False;
  finally
  frmConsultaInventario.Free;
  frmConsultaInventario:=Nil;
  end;
  Panel2.Visible:=false;
  if glbUsaescalaPrecio = 0 then
  panelTempPrecioLevels.Visible:= False;
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
  LogProcedure('TfrmProcVentaRapida.BitBtn17Click');
  BitBtn34Click(Self);
end;

procedure TfrmProcVentaRapida.CargarPreventa;
begin
  LogProcedure('TfrmProcVentaRapida.CargarPreventa');
  rxVentaSerie.Value := frmConsultaPreVenta.qryPreventaDetSerie.Value;
  rxVentaFecha.Value := ExtraerFecha(GlbFechaTrnDiaria);
  rxVentaCant.Value  := frmConsultaPreVenta.qryPreventaDetCANTIDAD.Value;
  rxVentaPrecio.Value:= frmConsultaPreVenta.qryPreventaDetPRECIO.Value;
  rxVentaItbi.Value  := frmConsultaPreVenta.qryPreventaDetITBI_DET.Value;
  rxVentaTipoUnidad.Value := frmConsultaPreVenta.qryPreventaDetTIPO_UNIDAD.Value;
  rxVentaPorcDescItem.Value:=frmConsultaPreVenta.qryPreventaDetPORC_DESC_DET.Value;
  //rxVentaporc_desc.Value   := frmConsultaPreVenta.qryPreventaDetPORC_DESC_DET.Value;
  rxVentaDescripcion.Value := frmConsultaPreVenta.qryPreventaDetDESCRIPCION.Value;
  qryProductos.DisableControls;
  if qryProductos.Locate('CODIGO',frmConsultaPreVenta.qryPreventaDetCODIGO_PROD.Value,[]) then
  begin
    _UsarLevelPrecio:= qryProductosUSARLEVELPRECIO.Value;
    panelTempPrecioLevels.Visible:=true;
    rxVentaCodTexto.Value   := qryProductosCODIGO_TEXTO.Value;
    rxVentaMonedaBase.Value := GetMonedaProducto(qryProductosCODIGO.AsInteger);
    if not GlbFactRecurrente then
    rxVentaDescripcionEspecial.Value := qryProductosDESCRIPCIONADICIONAL.Value;
    rxVentaCostoProducto.Value       := qryProductosPRECIO_COMPRA.Value;
  end;
  rxVentaReferencia.Value := qryProductosREFERENCIA.Value;
  rxVentaInvetariar.Value := qryProductosINVENTARIAR.Value;
  rxVentaCodArticulo.Value:= frmConsultaPreVenta.qryPreventaDetCODIGO_PROD.AsInteger;
  FGlbPorcItbi(ExtraerFecha(rxVentaFecha.Value), rxVentaCodArticulo.Value);
  
  if (GlbIgI = 1) and (GlbCalcItbis = 0) then
  rxVentaIDTasaITBIS.Value := 1
  else
  rxVentaIDTasaITBIS.Value := GlbIDTasa;

  rxVentaRutaImagen.Value := BuscarRutaImagen(frmConsultaPreVenta.qryPreventaDetCODIGO_PROD.AsInteger);
  rxVentaMonedaBase.Value := GetMonedaProducto(qryProductosCODIGO.AsInteger);
  rxVentamonto_tasa.Value := GlbMontoTasa(rxVentaMonedaBase.Value);
  rxVentaCodUsuario.Value := frmConsultaPreVenta.qryPreventaMasterCODIGO_VENDEDOR.Value;
  rxVentaloteNum.Value    := frmConsultaPreVenta.qryPreventaDetLOTE_NUM.Value;
  qryProductos.EnableControls;
  DBEdit1Exit(Self);
end;

procedure TfrmProcVentaRapida.ActualizarPreventa;
begin
  LogProcedure('TfrmProcVentaRapida.ActualizarPreventa');
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
  LogProcedure('TfrmProcVentaRapida.InsertaTransCafeteria');
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
    if (rxVentaTipoUnidad.Value = 1) Or (rxVentaTipoUnidad.Value = 0) then
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
  LogProcedure('TfrmProcVentaRapida.Label26Click');
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
  //LogProcedure('TfrmProcVentaRapida.SpeedButton1Click');
  qryCliente.Close;
  qryCliente.Open;

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
        if (tablaPropietarioCodigoPropietario.Value > 0) then
        begin
          if qryCliente.Locate('CODIGO_CTE', tablaPropietarioCodigoPropietario.Value, []) then
          lblRNC.Caption:= 'RNC =>' +qryclienternc_numero.Value
          else
          lblRNC.Caption :='';
        end;
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
        if (tablaPropietarioCodigoPropietario.Value > 0) then
        begin
          if qryCliente.Locate('CODIGO_CTE', tablaPropietarioCodigoPropietario.Value, []) then
          lblRNC.Caption:= 'RNC =>' +qryclienternc_numero.Value
          else
          lblRNC.Caption :='';
        end;      
    end;
  finally
  frmBuscarEstudiantes.Free;
  frmBuscarEstudiantes:=Nil;
  end;
  end;
  ProcSetNCFCliente;
end;

procedure TfrmProcVentaRapida.rdgFactServicioClick(Sender: TObject);
begin
  //LogProcedure('TfrmProcVentaRapida.rdgFactServicioClick');
  panelDescripcionServ.Visible:=True;
  if rxVenta.RecordCount = 0 then exit;
  if CheckBox2.Checked then
  CheckBox3.Checked:=False;
  rxVenta.Edit;

end;

procedure TfrmProcVentaRapida.rdgFactVentaProductoClick(Sender: TObject);
begin
  //LogProcedure('TfrmProcVentaRapida.rdgFactVentaProductoClick');
  //panelDescripcionServ.Visible:=False;
  if rxVenta.RecordCount = 0 then exit;
  if CheckBox2.Checked then
  CheckBox3.Checked:=False;
  rxVenta.Edit;

end;

procedure TfrmProcVentaRapida.ProcInsertarRecoverData;
begin
  //LogProcedure('TfrmProcVentaRapida.ProcInsertarRecoverData');
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
  //LogProcedure('TfrmProcVentaRapida.ProcRecoverData');
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
  if (GlbNumVtaPOS < 0) then
  GlbNumVtaPOS:= GetRandomNumber(VarUsuarioGlb);

  While Not tblRecovertrans.Eof Do
  begin
    //WriteToLog('Recover data rxVenta - Line 6390');
    rxVenta.Append;
    esInsertando:=True;
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
    RxSpinEdit1.AsInteger := tblRecovertransPRECIO_LEVEL.Value;
    rxVenta.Post;
    //WriteToLog('Post rxVenta - Line 6420');
    tblRecovertrans.Next;
  end;
end;

procedure TfrmProcVentaRapida.ActualizarRecoverData;
begin
  //LogProcedure('TfrmProcVentaRapida.ActualizarRecoverData');
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
  //LogProcedure('TfrmProcVentaRapida.DBMemo1Exit');
  if rxVenta.State In [dsEdit, dsInsert] then
  rxVenta.Post;
  //WriteToLog('Post rxVenta - Line 6455');
end;

procedure TfrmProcVentaRapida.RecuperarTransacciones1Click(
  Sender: TObject);
begin
  //LogProcedure('TfrmProcVentaRapida.RecuperarTransacciones1Click');
  recuperando := true;
  ProcRecoverData(true);
  recuperando := false;
end;

procedure TfrmProcVentaRapida.EliminarRecoverData;
begin
  //LogProcedure('TfrmProcVentaRapida.EliminarRecoverData');
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
  //LogProcedure('TfrmProcVentaRapida.EliminarRecoverDataAll');
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
  _ptmp : Currency;
begin
  if (RxSpinEdit1.Tag = 77) then exit;
  if ((rxVentaCodArticulo.Value = 0) or (rxVentaCodArticulo.IsNull))
     then Exit;

  _ptmp:=0;

  if (_ptmp <> rxVentaPrecio.Value) then
  FUpdating:=True;
  if not FUpdating then Exit;
  if rxVentaSerie.IsNull then Exit;
  if GlbUsaPUnidadLevel = 1 then
      SetPrecioPorCantidad
  else
  begin
    _ptmp:= GetNivelPrecioStandar(rxVentaCodArticulo.Value,RxSpinEdit1.AsInteger);
    if (_ptmp = 0 )then
    begin
      MessageDlg('Nivel precio no existe: '+IntToStr(RxSpinEdit1.AsInteger)+ ', verifique.',mtError,[mbok],0);
      RxSpinEdit1.SetFocus;
      exit;
    end;
  end;
  dmCalculos.esFeedback:=False;
  GlbCalculado:= False;
  esEditando  := True;
  GlbAlreadyCld  := False;
  CalcYaEjecutado:=False;
  procCalc   := True;
  esEditando := True;
  CalculoPendiente := True;
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
  FUpdating := True;

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

  TotalesDiferencia.Value:=
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
  if (rxVenta.State = dsBrowse) then
  rxVenta.Edit;
end;

procedure TfrmProcVentaRapida.CheckBox3Exit(Sender: TObject);
begin
  if rxVenta.RecordCount = 0 then exit;
  rxVenta.Edit;
end;

procedure TfrmProcVentaRapida.BitBtn19Click(Sender: TObject);
var
  nF : integer;
begin
  nF := StrtoInt(InputBox('Re-Imprimir Factura','Entre #Factura',''));
  UImpresionVentas.ImpFacturaservicio(nf,True);
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
      if dmFactura.qryVentaFacturaFORMA_PAGO.Value in [7,8] then
      _SolicitaCodCte:=1
      else
      begin
        _SolicitaCodCte:=0;
        if MessageDlg('Esta factura es a Crédito, si el monto tendrá un cambio,'+LF+CR+
        ' la recomendación es crear una devolución y hacer otra venta. Continuar?',
           mtWarning,[mbyes, mbno],0) = mrno  then
        exit;
      end;
      if (dmFactura.qryVentaFacturaSTATUS.Value[1] in ['C','R']) then
      begin
        MessageDlg('Factura no está activa, no puede ser modificada.', mtInformation,[mbok],0);
        FreeAndNil(frmConsultaFacturas);
        exit;
      end;
      //if VerificaClave then
      if VerificaHuellas then 
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
        //if rxVenta.State = dsBrowse then rxVenta.Edit;
        //DBEdit10Exit(Self);
        ActivarBotonesEnModifica;
        EsConduce:= CheckIfEsConduce(dmFactura.qryVentaFacturaNumero.Value);
        GlbNumeroTrn:=dmFactura.qryVentaFacturaNumero.Value;

        dmfactura.qryVtaConDeliveryTrn.Close;
        dmfactura.qryVtaConDeliveryTrn.Params[0].Value:= GlbNumeroTrn;
        dmfactura.qryVtaConDeliveryTrn.Open;
        edtCodigo.SetFocus;
      end;
    end;
  finally
  frmConsultaFacturas.Free;
  frmConsultaFacturas:= Nil;
  end;
  BitBtn7.Enabled:=True;
  Refresh;
end;

procedure TfrmProcVentaRapida.CargarDatosAModificar;
var
  xDesc : String;
  x: integer;
begin
  if (Totalesmontorecibido.Value > 0) And (rxVenta.RecordCount > 0) then
  begin
    MessageDlg('Favor procesar o cancelar venta en progreso', mtInformation, [mbOK], 0);
    Exit;
  end;
    totales.Close;
    totales.Open;
    Edit1.Text:='';
    Totales.Close;
    Totales.Open;
    Totales.Insert;
    TotalesTipoDeIngreso.Value:='01';
    if (GlbFactRecurrente) then
    TotalesPreAbono.Value:=_MontoPrepago;

    TotalesFechaIniciaPoliza.Value:=dmFactura.qryVentaFacturaFechaIniciaPoliza.Value;
    TotalesMoneda.Value := Trim(dmFactura.qryVentaFacturaMONEDA.Value); // IntToStr(GlbMonedaBase);

    if Not dmFactura.qryVentaFacturaTIPONCFIFISCAL.IsNull then
    AsignaNCFCFinalX(dmFactura.qryVentaFacturaTIPO_NCF.Value, dmFactura.qryVentaFacturaTIPONCFIFISCAL.Value);

    TotalesSubTotal.Value := 0;
    TotalesSubTotalScreen.Value := 0;
    Totalesitbis.Value    := 0;
    Totalesmontodesc.Value:= 0;
    Totalestotalneto.Value:= 0;
    Totalesmontorecibido.Value:= 0;
    Totalesdevolucion.Value   := 0;
    Totalesmontorecibido.Value:= dmFactura.qryVentaFacturaMONTO_PAGADO.Value;
    TotalesFechaVence.Value   := dmFactura.qryVentaFacturaFechaVence.Value;
    TotalesPropina.Value      := dmFactura.qryVentaFacturaPROPINA.Value;
    TotalesPropinaLegal.Value := dmFactura.qryVentaFacturaPROPINALEGAL.Value;
    TotalesidNumeroDVeh.Value := dmFactura.qryVentaFacturaIDNUMERODVEH.Value;

    if Not dmFactura.qryVentaFacturaTIPONCFIFISCAL.IsNull then
    AsignaNCFCFinalX(dmFactura.qryVentaFacturaTIPO_NCF.Value, dmFactura.qryVentaFacturaTIPONCFIFISCAL.Value);
    if not LlenandoDatos then
    Totales.Post;
    lblProcDev.Visible := False;
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
  UImpresionVentas.ProcSetPathlogoTipoServicio(dmReportes.qryViewVentasMastTIPO_AFILIADO.Value);

  dmFactura.qryGetNcfAsignado.Close;
  if esContado then //contado
     dmFactura.qryGetNcfAsignado.SQL.Text:= dmFactura.qryGeNcfAsignado_1.SQL.Text
  else
  dmFactura.qryGetNcfAsignado.SQL.Text:= dmFactura.qryGetNcfAsignado_0.SQL.Text;
  dmFactura.qryGetNcfAsignado.Params[0].Value:= numerodocReimp;

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
    if (GlbActivaIFiscal = 0) then
    RxSpeedButton1.Visible:= False;

    with frmConsultaFacturas.RxDBGrid2.DataSource.DataSet do
    begin
      For x := 0 to frmConsultaFacturas.RxDBGrid2.SelectedRows.Count-1 do
      begin
        GotoBookmark(Pointer(frmConsultaFacturas.RxDBGrid2.SelectedRows.Items[x]));
        qryProductos.DisableControls;
        if not qryProductos.Locate('Codigo', dmFactura.qryVentaFacturaDetCODIGO_PROD.Value,[]) then
        begin
          MessageDlg(Format('Codigo producto %s no encontrado, verifique.',[dmFactura.qryVentaFacturaDetCODIGO_PROD.AsString]),mtError,[mbOk], 0);
        end;
       qryProductos.EnableControls;
       rxVenta.Append;
       esInsertando:=True;
       rxVentaglbcodVendedor.Value := qryClienteCOD_VENDEDOR.Value;
       rxVentaItbi.Value := 0;   dmFactura.qryVentaFacturaDetserie.value;
       rxVentaLevelPrecio.Value:=dmFactura.qryVentaFacturaDetLEVEL_PRECIO_VENTA.Value;
       RxSpinEdit1.Value :=rxVentaLevelPrecio.Value;

       if esContado then
          rxVentaNumeroFactura.Value  := dmFactura.qryVentaFacturaNUMERO.AsInteger
       else
       rxVentaNumeroFactura.Value  := dmFactura.qryVentaFacturaNUMERO_FACTURA.Value;

       if dmFactura.qryVentaFacturaDetSTATUS_DET.IsNull then
       rxVentaStatus.Value        := 'A' else
       rxVentaStatus.Value        := dmFactura.qryVentaFacturaDetSTATUS_DET.Value;

       //if qryProductos.Locate('CODIGO',dmFactura.qryVentaFacturaDetCODIGO_PROD.Value,[]) then
       rxVentaCodTexto.Value      := qryProductosCODIGO_TEXTO.Value;
       rxVentaCostoProducto.Value := dmfactura.qryVentaFacturadetPrecio_Compra.Value;
       rxVentaCodArticulo.Value   := dmFactura.qryVentaFacturaDetCODIGO_PROD.AsInteger;
       rxVentaFecha.Value := dmFactura.qryVentaFacturaFECHA.Value;
       FGlbPorcItbi(ExtraerFecha(rxVentaFecha.Value), rxVentaCodArticulo.Value);
       if (GlbIgI = 1) and (GlbCalcItbis = 0) then
       rxVentaIDTasaITBIS.Value := 1
       else
       rxVentaIDTasaITBIS.Value := GlbIDTasa;

       rxVentaSerieOriginal.Value := dmFactura.qryVentaFacturaDetSERIE.Value;
       rxVentaNumeroTrnOriginal.Value := dmFactura.qryVentaFacturaNUMERO.Value;

       rxVentaSerie.Value := dmFactura.qryVentaFacturaDetSERIE.Value;

       rxVentaMonedaBase.Value :=  GetMonedaProducto(qryProductosCODIGO.Value);

       rxVentamonto_tasa.Value := GlbMontoTasa(rxVentaMonedaBase.Value);
       rxVentaNCF.Value := dmFactura.qryVentaFacturaNUMERO_NCF.Value;

       rxVentaCant.Value  := Abs(dmFactura.qryVentaFacturaDetCANTIDAD.Value);
       rxVentaCantPax.Value  := Abs(dmFactura.qryVentaFacturaDetCANT_VIAJES.AsInteger);
       rxVentaPrecio.Value:= Abs(dmFactura.qryVentaFacturaDetPRECIO.Value);
       rxVentaporc_desc.Value      := Abs(dmFactura.qryVentaFacturaDetPORC_DESC_DET.Value);
       if dmFactura.qryVentaFacturaDetCODIGO_VENDEDOR.IsNull then
       rxVentaglbcodVendedor.Value := dmFactura.qryVentaFacturaCODIGO_VENDEDOR.Value
       else
       rxVentaglbcodVendedor.Value := dmFactura.qryVentaFacturaDetCODIGO_VENDEDOR.value;
       rxVentaPorcDescItem.Value   := Abs(dmFactura.qryVentaFacturaDetPORC_DESC_ITEM.Value);
       rxVentaMontoDescItem.Value  := Abs(dmFactura.qryVentaFacturaDetMONTO_DESC_ITEM.Value);
       rxVentaDescripcion.Value := dmFactura.qryVentaFacturaDetDESCRIPCION.Value;
       if not GlbFactRecurrente then
       rxVentaDescripcionEspecial.Value := dmFactura.qryVentaFacturaDetDESCRIPCIONPRODUCTO.Value;
       rxVentaTipoVenta.Value   := dmFactura.qryVentaFacturaDetTIPO_VENTA.Value;
       rxVentaTipoUnidad.Value  := dmFactura.qryVentaFacturaDetTIPO_UNIDAD.Value;
       rxVentaFICHA_VEH.Value   := dmFactura.qryVentaFacturaDetFICHA_VEH.Value;
       rxVentaNUM_CONDUCE_CTE.Value := dmFactura.qryVentaFacturaDetNUM_CONDUCE_CTE.Value;
       rxVentaNUM_IDENT.Value   := dmFactura.qryVentaFacturaDetNUM_IDENT.Value;

       if rxVentaTipoUnidad.IsNull then
       rxVentaTipoUnidad.Value:=1;
       if GlBExpert = 0 then
       begin
       xDesc := StringReplace(rxVentaDescripcionEspecial.Value, rxVentaDescripcion.Value, '',
                             [rfReplaceAll, rfIgnoreCase]);
       if (Length(xDesc) > 4) then
       begin
         if not GlbFactRecurrente then
         rxVentaDescripcionEspecial.Value := xDesc
       end  else
       rxVentaDescripcionEspecial.Value := '';
       end;
       rxVentaItbisExento.Value:=Abs(dmfactura.qryVentaFacturaDetITBIS_EXENTO.Value);// qryProductosPAGA_ITBI.Value;

       rxVentaReferencia.Value := qryProductosREFERENCIA.Value;
       if Totales.State = dsBrowse then
       begin
         Totales.AutoCalcFields:=False;
         Totales.Edit;
       end;
       if GLBEsFastFood then
       if ABS(dmFactura.qryVentaFacturaPROPINALEGAL.Value) = 0 then
       chkNoLeyPropina.Checked:=True
       else chkNoLeyPropina.Checked:= False;
           
       if Totales.State = dsBrowse then
       Totales.Edit;
       
       TotalesCodCliente.Value:=dmFactura.qryVentaFacturaCODIGO_CTE.Value;
       TotalesComentario.Value := dmfactura.qryVentaFacturaCOMENTARIO.Value;

       TotalesPorcDesAdicional.Value:= dmFactura.qryVentaFacturaPORC_DESCUENTO.Value;
       if TotalesPorcDesAdicional.Value > 0 then
       chKDescuentoGlobal.Checked:=True;

       if Totales.State = dsBrowse then
       Totales.Edit;
       TotalesRecargo.Value := dmFactura.qryVentaFacturaMONTO_RECARGO.Value;

       if (EsDevolucion) then
       TotalesRecargo.Value := TotalesRecargo.Value * 1;//-1;

       TotalesMontoDescAdicional.Value := dmFactura.qryVentaFacturaMONTO_DESCUENTO.Value;
       if Totales.State = dsBrowse then
          Totales.Edit;
       if not dmFactura.qryGetNcfAsignadoTIPO_NCF.IsNull and
       TotalesTipoNCF.IsNull then
       TotalesTipoNCF.Value:= dmFactura.qryGetNcfAsignadoTIPO_NCF.Value;

       RxDBLookupCombo3.Visible:=True;
       if dmFactura.ibQryViewNCF.Locate('TIPO_CF', TotalesTipoNCF.Value,[]) then
         TotalesTipoNCFIFiscal.Value := dmFactura.ibQryViewNCFTIPO_NCF_IFISCAL.Value
       else
       TotalesTipoNCFIFiscal.AsVariant := null;
       if not LlenandoDatos then
       Totales.Post;

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

       if dmInventario.qryTipoUnidad.State = dsInactive then
       AbrirUnidades;

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

       Totales.AutoCalcFields:=True;

       CheckBox2Exit(Self);              
       DBEdit2Exit(Self);
       GlbCalculado:=False;
       if rxVenta.State In [dsInsert,dsEdit] then
          rxVenta.Post;

       tablaPropietario.Edit;
       tablaPropietarioCodigoPropietario.Value:=
       dmFactura.qryVentaFacturaCODIGO_CTE.Value;
       tablaPropietario.Post;
       dmVentas.qryPrecioUnidadSurt.Close;
       dmVentas.qryPrecioUnidadSurt.Params[0].Value:=rxVentaCodArticulo.Value;
       dmVentas.qryPrecioUnidadSurt.Open;
      end
   end;
  end;
  GlbCalculado:=False;//aqui voy
  EsEditando :=True;
  dmCalculos.DatCambio :=True;
  CalcularTotalesInterno;
  qryProductos.Close;
  qryProductos.Open;
  if not rxVentaCodTexto.IsNull then
  begin
    qryProductos.DisableControls;
    if qryProductos.Locate('codigo_Texto', rxVentaCodTexto.Value,[]) then
    begin
      panelTempPrecioLevels.Visible:= True;
    end;
    qryProductos.EnableControls;
  end;
  Refresh;
end;

procedure TfrmProcVentaRapida.ActualizaVentaDet;
begin
  //LogProcedure('TfrmProcVentaRapida.ActualizaVentaDet');
  if (rxVentaStatus.Value = 'C') or (rxVentaCodArticulo.Value = 0) then
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

    stpUpdateVentaDetU1.Params[28].Value := rxVentaItbi.Value; //rxVentaMontoDescuento.Value;
    stpUpdateVentaDetU1.Params[29].Value := rxVentaIDTasaITBIS.Value;
    stpUpdateVentaDetU1.Params[30].Value := rxVentaMontoItbisRecargo.Value;
    stpUpdateVentaDetU1.Params[31].Value := rxVentaMoneda.Value;
    stpUpdateVentaDetU1.Params[32].Value := rxVentamonto_tasa.Value;
    stpUpdateVentaDetU1.Params[33].Value := rxVentaCantPax.Value;

    stpUpdateVentaDetU1.Params[34].Value := rxVentaDC_ITBIS_CLD.Value;
    stpUpdateVentaDetU1.Params[35].Value := rxVentaTC_MONTOITBISRECARGO_GLB.Value;
    stpUpdateVentaDetU1.Params[36].Value := rxVentaTC_MONTOITBISRECARGO_ITM.Value;
    if not rxVentaglbcodVendedor.IsNull then
    stpUpdateVentaDetU1.Params[37].Value := rxVentaglbcodVendedor.Value
    else
    stpUpdateVentaDetU1.Params[37].Value := GlbcodVendedor;

    stpUpdateVentaDetU1.ExecProc;
    if Not stpUpdateVentaDetU1.Transaction.InTransaction then
       stpUpdateVentaDetU1.Transaction.StartTransaction;
    try
      stpUpdateVentaDetU1.Transaction.CommitRetaining;
    except
    stpUpdateVentaDetU1.Transaction.RollbackRetaining;
    end;
  end;
  //Application.ProcessMessages;
end;

procedure TfrmProcVentaRapida.ActualizaVentaMaster(fpago : String;serieNcfAsignado :integer);
begin
  //LogProcedure('TfrmProcVentaRapida.ActualizaVentaMaster');
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

  stpProc_UpdateVENTAS_MAST_U1.Params[6].Value    := dmfactura.qryVentaFacturaOBSERVACION.Value;// 'Venta a Credito';
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
  stpProc_UpdateVENTAS_MAST_U1.Params[20].Value:= Totalestotalneto.Value;
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
  stpProc_UpdateVENTAS_MAST_U1.Params[34].Value:= TotalesPropina.Value;
  stpProc_UpdateVENTAS_MAST_U1.Params[35].Value:= GlbPorcPropina;
  stpProc_UpdateVENTAS_MAST_U1.Params[36].Value:= TotalesPropinaLegal.Value;
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
  //Application.ProcessMessages;
end;

procedure TfrmProcVentaRapida.ActualizaFactura;
begin
  LogProcedure('TfrmProcVentaRapida.ActualizaFactura');
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
  LogProcedure('TfrmProcVentaRapida.ActualizaTransCxc');
  if dmfactura.qryDatosTrncxcSERIE.Value = 0 then
  begin
   Exit;   
  end;
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

procedure TfrmProcVentaRapida.ActualizaBalanceCteCxc;
begin
  LogProcedure('TfrmProcVentaRapida.ActualizaBalanceCteCxc');
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
  LogProcedure('TfrmProcVentaRapida.ActualizaFactPendiente');
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
  flag :boolean;
  cantAnt : Currency;
begin
 // LogProcedure('TfrmProcVentaRapida.bitBtnEditarFactClick');
  flag:=false;
  cantAnt:=0;
  GlbEsCopia:=True;
  //Revisar proceso de modificar venta al contado Marzo 14 2024
  if (TotalesSubTotal.Value <= 0) then
  begin
    MessageDlg('Total venta no puede ser cero, verifique.', mtError, [mbOk], 0);
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

  if (EsDevolucion) And (rxVenta.RecordCount > 0) then
  begin
    MessageDlg('Estas en modo devolución, transacción no puede '#13'ser procesada como venta, verifique.', mtInformation, [mbok], 0);
    Exit;
  end;

  if tablaPropietario.State In [dsEdit, dsInsert] then
  tablaPropietario.Post;
  if (tablaPropietario.RecordCount = 0) or (tablaPropietarioCodigoPropietario.Value = 0)
     and (_SolicitaCodCte = 1) then
  begin
    MessageDlg('Favor seleccionar cliente', mtInformation, [mbOK], 0);
    if isShowing then
    rxdbLookupCte.SetFocus;
    BitBtn6.Enabled:=True;
    Exit;
  end;

  if not ValidaSubTotal then Exit;

  bitBtnEditarFact.Enabled:=False;
  reciboImpreso:=True;
  //Llamar actualizar
  if _SolicitaCodCte = 0 then
  ProcActualizarPagos(rxVentaNumeroFactura.Value,1);//1-Trans Ventas;
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

   if not LlenandoDatos then
   Totales.Post;

   rxVenta.First;

  //Actualizar Ventas_Mast con cambios
  //if dmfactura.qryVentaFacturaFORMA_PAGO.Value =
  ActualizaVentaMaster(dmfactura.qryVentaFacturaFORMA_PAGO.AsString,dmFactura.qryVentaFacturaSERIE_NCF_ASIGNADO.Value);
  //Cargar rxDataAnt
  ReversaCantInventario(GlbNumeroTrn);

  rxventa.First;
  //Actualiza tabla FACTURA
  ActualizaFactura;

  //Actualiza Factura Pendiente
  ActualizaFactPendiente;

  //Actualiza Trans CXC
  ActualizaTransCxc;

  //Balance Cliente CXC
  ActualizaBalanceCteCxc;

  bitBtnEditarFact.Visible := False;
  bitBtnEditarFact.SendToBack;
  EsModificandoFactura := False;
  ActivarBotonesEnModifica;
  label36.Visible := False;
  Label36.caption := '';
  numF := dmFactura.qryVentaFacturaNUMERO_FACTURA.Value;
  dmFactura.qryVentaFactura.Close;
  dmfactura.qryVentaFacturaDet.Close;

  dmfactura.qryDatosTrncxc.Close;

  dmfactura.qryFactReimpMaster.Close;
  dmfactura.qryFactReimpMaster.Params[0].Value:=numF;

   dmfactura.qryFactReimpDet.Close;
   dmfactura.qryFactReimpDet.Params[0].Value  :=numF;
   dmfactura.qryFactReimpDet.Open;
   dmfactura.qryFactReimpDet.Last;
   dmfactura.qryFactReimpDet.Close;

   dmfactura.qryFactReimpMaster.Open;
   
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
   EsConduce:= CheckIfEsConduce(numF);
    dmfactura.qryFactReimpMaster.Open;
    frmConsultaFacturas:=TfrmConsultaFacturas.Create(Nil);
    try
      frmConsultaFacturas.rdgCredito.Checked := True;
      frmConsultaFacturas.EditN1.SetInteger(dmfactura.qryFactReimpMaster.Params[0].Value);
      //frmConsultaFacturas.edtCodCte.SetInteger(tablaPropietarioCodigoPropietario.Value);
      frmConsultaFacturas.BitBtn1Click(Self);
      if dmFactura.qryVentaFactura.RecordCount = 0 then
      begin
        frmConsultaFacturas.rdgContado.Checked := True;
        frmConsultaFacturas.BitBtn1Click(Self);
      end;
    finally
    if Assigned(frmConsultaFacturas) then
    frmConsultaFacturas.Free;
    frmConsultaFacturas:=Nil;
    end;
    if dmFactura.qryVentaFactura.State = dsInactive then
    dmFactura.qryVentaFactura.Open;

    if dmFactura.qryVentaFactura.RecordCount = 0 then
    begin
       MessageDlg('Factura no encontrada, favor verificar.',mtWarning,[mbok],0);
       Exit;
    end;

    if (GlbActivaIFiscal = 1 ) then
    begin
      ProcesaEstadoImpresora(numeroTrnVta);
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
    EsConduce:= CheckIfEsConduce(dmFactura.qryVentaFacturaNumero.Value);
    UImpresionVentas.ImprimirEdicionFactura;
   //***************************** end ************************************
  //end;
  bitBtnEditarFact.Enabled  := True;
  
  lblFechaCotizacion.Visible:= False;
  dbFechaCotizacion.Visible := False;
  Label36.Visible := False;
  Label36.caption:='';
  if not GLBEsFastFood then
  begin
    label29.Top:= 413;
    dbTextMontoExoneraITBIS.Top := 410;
  end;
  label41.Visible := False;
  DBText15.Visible:= True;  
  rdgFactServicio.Checked := False;
  GlbUsandoCotiza:= False;
  esContado :=False;
  Totales.Close;
  Totales.Open;

  Refresh;
  numerodocReimp := -1;
  if (GlbNumVtaPOS > 0) then
  dmcalculos.ProcDeletePosExtraDet(GlbNumVtaPOS);
  GlbNumVtaPOS := -1;
  GlbNumeroTrn:=-1;
  xCodProd:=-1;
  Application.ProcessMessages;
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
  BackGround := $000080FF
  else
  if (Field.FieldName = 'CantExcedeInv') And (rxVentaCantExcedeInv.Value = 1) then
  BackGround := $00FAE1D3;
  //if (Field.FieldName = 'Serie') then
  //    RxSpinEdit1.Value:=rxVentaLevelPrecio.Value;
end;

procedure TfrmProcVentaRapida.BitBtn6MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
//  LogProcedure('TfrmProcVentaRapida.BitBtn6MouseMove');
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
  //LogProcedure('TfrmProcVentaRapida.ActivarBotonesEnModifica');
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


procedure TfrmProcVentaRapida.Label37Click(Sender: TObject);
var
  numFcta :Integer;
begin
  LogProcedure('TfrmProcVentaRapida.Label37Click');
  stpProcBuscarUltNum.ExecProc;
  frmGetNumFactExpExcel:=TfrmGetNumFactExpExcel.Create(nil);
  try
    frmGetNumFactExpExcel.edtNumFactura.SetInteger(stpProcBuscarUltNum.params[1].AsInteger);
    if frmGetNumFactExpExcel.Showmodal = mrOk then
    begin
       //numFcta := frmGetNumFactExpExcel.edtNumFactura.;
       UImpresionVentas.ImpFacturaservicio(frmGetNumFactExpExcel.edtNumFactura.ValueInteger,true);
    end;
  finally
  frmGetNumFactExpExcel.free;
  frmGetNumFactExpExcel:= nil;
  end;
end;

procedure TfrmProcVentaRapida.BitBtn21Click(Sender: TObject);
var
   LN : smallint;
begin
 // LogProcedure('TfrmProcVentaRapida.BitBtn21Click');
  if (rxVenta.recordcount = 0) then Exit;
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
  LogProcedure('TfrmProcVentaRapida.DBEdit7Exit');
  if totales.State in [dsEdit, dsInsert] then
  if not LlenandoDatos then
  totales.Post;
  DBStatusLabel1.Visible:=False;
end;

procedure TfrmProcVentaRapida.BitBtn22Click(Sender: TObject);
var
  nf:integer;
  tipoConduce : smallint;
  numTrnV : integer;
begin
  //LogProcedure('TfrmProcVentaRapida.BitBtn22Click');
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
        //Seleccionar aqui el tipo de conduce
        //TODO
//==============
      if GlbFormatoConduce = 444 then
      begin
        //qckRepConduce
        qckRepConduce:=tqckRepConduce.Create(Nil);
        try

        if (GlbImpReciboSinPreg = 1) then
           qckRepConduce.Print
        else
        begin
          ProgressBar1.Visible:= False;
          frmImprimir:=TfrmImprimir.Create(nil);
          try
            if frmImprimir.Showmodal = mrOk then
            begin
              if frmImprimir.RadioGroup1.ItemIndex = 0 then
              qckRepConduce.Page.PaperSize := Letter;

              if frmImprimir.RadioButton1.Checked then
              begin
                qckRepConduce.PrinterSetup;
                qckRepConduce.Print;
              end else
              qckRepConduce.Preview;
            end;
          finally
          frmImprimir.Free;
          frmImprimir:=Nil;
          end;
        end;
        if (GlbImpReciboSinPreg = 0) then
        if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
        begin
          qckRepConduce.Preview;
        end;
        if GlbImpPDF then
        if not dmFactura.qryVentaFacturaNUMERO_FACTURA.IsNull then
        ReportExportPDF(qckRepConduce,GlbRutaFacturas+'\ConduceF'+IntToStr(nF)+'.pdf')
        else
        if not dmFactura.qryVentaFacturaNUMERO_DOC_PAGO.IsNull then
        ReportExportPDF(qckRepConduce,GlbRutaFacturas+'\ConduceF'+IntToStr(nF)+'.pdf')
      finally
      qckRepConduce.Free;
      qckRepConduce:=Nil;
      end;
      end else
      begin
      QCKFactRepuesto8x5_5Conduce:=TQCKFactRepuesto8x5_5Conduce.Create(Nil);
      try
        if GlbEsCopia then
        QCKFactRepuesto8x5_5Conduce.xtipoVenta := TipoVenta +' (Copia)'
        else QCKFactRepuesto8x5_5Conduce.xtipoVenta := TipoVenta;
        QCKFactRepuesto8x5_5Conduce.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;
        if (GlbImpReciboSinPreg = 1) then
           QCKFactRepuesto8x5_5Conduce.Print
        else
        begin
          ProgressBar1.Visible:= False;
          frmImprimir:=TfrmImprimir.Create(nil);
          try
            if frmImprimir.Showmodal = mrOk then
            begin
              if frmImprimir.RadioGroup1.ItemIndex = 0 then
              QCKFactRepuesto8x5_5Conduce.Page.PaperSize := Letter;

              if frmImprimir.RadioButton1.Checked then
              begin
                QCKFactRepuesto8x5_5Conduce.PrinterSetup;
                QCKFactRepuesto8x5_5Conduce.Print;
              end else
              QCKFactRepuesto8x5_5Conduce.Preview;
            end;
          finally
          frmImprimir.Free;
          frmImprimir:=Nil;
          end;
        end;

        if (GlbImpReciboSinPreg = 0) then
        if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
        begin
          QCKFactRepuesto8x5_5Conduce.Preview;
        end;
        if GlbImpPDF then
        if not dmFactura.qryVentaFacturaNUMERO_FACTURA.IsNull then
        ReportExportPDF(QCKFactRepuesto8x5_5Conduce,GlbRutaFacturas+'\ConduceF'+IntToStr(nF)+'.pdf')
        else
        if not dmFactura.qryVentaFacturaNUMERO_DOC_PAGO.IsNull then
        ReportExportPDF(QCKFactRepuesto8x5_5Conduce,GlbRutaFacturas+'\ConduceF'+IntToStr(nF)+'.pdf')

      finally
      QCKFactRepuesto8x5_5Conduce.Free;
      QCKFactRepuesto8x5_5Conduce:=Nil;
      end;
      end;
    end else
    begin

//===================
        qckFactServIngeservis_NConduce:=TqckFactServIngeservis_NConduce.Create(Nil);
        try
          qckFactServIngeservis_NConduce.Preview;
        if frmConsultaFacturas.chkExportaPDF.Checked then
        ReportExport(qckFactServIngeservis_NConduce,GlbRutaInformes+'\ConduceF'+IntToStr(nF)+'.pdf');
          
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
        if GlbImpFormatoPDF = 1 then
        ReportExport(qckCotiServIngeservis_NConduce,GlbRutaCotizaciones+'\ConduceCotizacion'+IntToStr(nF)+'.pdf')
        else
        qckCotiServIngeservis_NConduce.Preview;
      finally
      qckCotiServIngeservis_NConduce.Free;
      qckCotiServIngeservis_NConduce:=Nil;
      end;
    end;
  end;
  EsConduce:=False;  
end;

procedure TfrmProcVentaRapida.RxDBGrid1Enter(Sender: TObject);
begin
  //LogProcedure('TfrmProcVentaRapida.RxDBGrid1Enter');
  ActiveControl := rxDBGrid1;
  GlbNumero:= rxVentaSerie.Value;
  rxVenta.EnableControls;
  if not (rxVentaLevelPrecio.IsNull) and (rxVentaLevelPrecio.Value > 0) then
  RxSpinEdit1.AsInteger:= rxVentaLevelPrecio.Value;
  RxDBGrid1.EnableScroll;
end;

procedure TfrmProcVentaRapida.RxDBGrid1Exit(Sender: TObject);
begin
  LogProcedure('TfrmProcVentaRapida.RxDBGrid1Exit');
  GlbNumero:= rxVentaSerie.Value;
  RxDBGrid1.EnableScroll;
  rxVenta.EnableControls;
end;


procedure TfrmProcVentaRapida.CrearNCreditoEnDevolucion;
begin
  LogProcedure('TfrmProcVentaRapida.CrearNCreditoEnDevolucion');
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
  LogProcedure('TfrmProcVentaRapida.ActualizaCotizacionMaster');
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
  ibstpUpdateCotizaMaster.Params[23].Value    := Totalesitbis.Value;//montototalitbis
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
  if chKDescuentoGlobal.Checked then
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
  ibstpUpdateCotizaMaster.Params[39].Value     := GlbPorcPropina;
  ibstpUpdateCotizaMaster.Params[40].Value     := TotalesPropina.Value;
  ibstpUpdateCotizaMaster.Params[41].Value     := TotalesPropinaLegal.Value;

  ibstpUpdateCotizaMaster.ExecProc;

  if Not ibstpUpdateCotizaMaster.Transaction.InTransaction then
  ibstpUpdateCotizaMaster.Transaction.StartTransaction;
  try
    ibstpUpdateCotizaMaster.Transaction.CommitRetaining;
  except
  ibstpUpdateCotizaMaster.Transaction.RollbackRetaining;
  end;
  ProcUpdateItbiRecargoCotizaMast(rxVentaNumeroCotiza.Value);

end;

procedure TfrmProcVentaRapida.InsertarCotizacionDetUpd(numero,
  serie: Integer);
begin
  LogProcedure('TfrmProcVentaRapida.InsertarCotizacionDetUpd');
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
  stpProcUpdteCotDet.Params[26].Value    := rxVentaCantPax.Value;
  stpProcUpdteCotDet.Params[27].Value    := rxVentaLevelPrecio.Value;
  stpProcUpdteCotDet.ExecProc;
end;

procedure TfrmProcVentaRapida.ReImprimeFacturaContado1Click(
  Sender: TObject);
begin
  GlbEsCopia:=True;
  UImpresionVentas.ReImprimeFacturaContado;
  EsDevolucion := False;
  GlbEsCopia:=False;
end;

procedure TfrmProcVentaRapida.dbFechaCotizacionClick(Sender: TObject);
begin
  LogProcedure('TfrmProcVentaRapida.dbFechaCotizacionClick');
  Totales.Edit;
end;

procedure TfrmProcVentaRapida.dbFechaCotizacionExit(Sender: TObject);
begin
  //LogProcedure('TfrmProcVentaRapida.dbFechaCotizacionExit');
  dbFechaCotizacion.Color:= clWindow;
  if Totales.State in [dsEdit] then
  if not LlenandoDatos then
  Totales.Post;
end;

procedure TfrmProcVentaRapida.dbFechaCotizacionEnter(Sender: TObject);
begin
  //LogProcedure('TfrmProcVentaRapida.dbFechaCotizacionEnter');
  dbFechaCotizacion.Color:= clYellow;
  Totales.Edit;
end;                  

procedure TfrmProcVentaRapida.ProcInsertarVtaMastEnDevolucion(Serie_asignadoncf : Integer;numerotrnorigen:integer);
begin
  //LogProcedure('TfrmProcVentaRapida.ProcInsertarVtaMastEnDevolucion');
  if (GlbUsaFctMexico = 1) and (not TotalesFechaIniciaPoliza.IsNull) and (GLBSAM = 1) then
  ipStpInsertVentMast.Params[1].Value := ExtraerFecha(TotalesFechaIniciaPoliza.Value)
  else
  ipStpInsertVentMast.Params[1].Value := ExtraerFecha(GlbFechaTrnDiaria);
  //ipStpInsertVentMast.Params[1].Value:= GlbFechaTrnDiaria;
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
  //if TotalesMontoDescAdicional.Value > 0 then
  //ipStpInsertVentMast.Params[19].Value:= TotalesMontoDescAdicional.Value
  //else
  if Abs(TotalesMontoDescItems.Value) > 0 then
  ipStpInsertVentMast.Params[19].Value:= TotalesMontoDescItems.Value * -1 //TotalesMontoDescAdicional.Value  * -1;
  else
  if ABS(TotalesMontoDescAdicional.Value) > 0 then
  ipStpInsertVentMast.Params[19].Value:= TotalesMontoDescAdicional.Value
  else
  ipStpInsertVentMast.Params[19].Value:= 0;
  ipStpInsertVentMast.Params[20].Value:= abs(Totalestotalneto.value)*-1;//Totalesmontorecibido.Value;
  ipStpInsertVentMast.Params[21].Value:= Totalesdevolucion.Value;
  ipStpInsertVentMast.Params[22].Value:= Totalesitbis.Value * -1;
  ipStpInsertVentMast.Params[23].Value:= abs(Totalestotalneto.value)*-1;//Totalesmontorecibido.Value;
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
  ipStpInsertVentMast.Params[38].Value:= 0;//aqui juan
    ipStpInsertVentMast.Params[39].Value:= TotalesPropina.Value;
  ipStpInsertVentMast.Params[40].Value:= GlbPorcPropina;
  ipStpInsertVentMast.Params[41].Value:= TotalesPropinaLegal.Value;
  if not rxPreventaticket_id.IsNull then
  ipStpInsertVentMast.Params[42].Value:= rxPreventaticket_id.Value //ticket fast food limao
  else
  ipStpInsertVentMast.Params[42].Value:= null;

  if (rxCoberturaMontoCobertura.Value > 0) then
  ipStpInsertVentMast.Params[43].Value:= 1
  else
  ipStpInsertVentMast.Params[43].Value:= 0;

  ipStpInsertVentMast.Params[44].Value:= Null;
  ipStpInsertVentMast.Params[45].Value:= Null;

  if (GLBSAM = 1) then
  begin
    if not TotalesFechaIniciaPoliza.IsNull then
    ipStpInsertVentMast.Params[44].Value:= TotalesFechaIniciaPoliza.AsDateTime;
    if not TotalesTipoAfiliado.IsNull then
    ipStpInsertVentMast.Params[45].Value:= TotalesTipoAfiliado.Value;
  end;
  ipStpInsertVentMast.Params[46].Value:= TotalesidNumeroDVeh.Value;

  if Totalestipodeingreso.IsNull then
  ipStpInsertVentMast.Params[47].Value:= 1
  else
  ipStpInsertVentMast.Params[47].Value:= Totalestipodeingreso.AsInteger;

  if (GlbActivaECF = 1) and (Totalestipodeingreso.IsNull or
  (Totalestipodeingreso.Value = '0') or (Totalestipodeingreso.Value = '')) then
  ipStpInsertVentMast.Params[47].Value:=1;

  Try
    ipStpInsertVentMast.ExecProc; //3 devolucion
    Totales.Edit;
    TotalesVentaGuardada.Value:=1;
    Totales.Post;    
    isMasterSave:=True;
  except on E : Exception do
    begin
      Totales.Edit;
      TotalesVentaGuardada.Value := 0;
      Totales.Post;    
      if ipStpInsertVentMast.Transaction.InTransaction then
      begin
        try
        ipStpInsertVentMast.Transaction.Rollback;
        except
        end;
      end;
      MessageDlg('Error guardando en master:'+e.Message,mtError,[mbok],0);
      LogInformacionTxt('Error guardando en master, Devolución (NCR):'+e.Message);
      Exit;
    end;
  end;

  numeroTrnVta:= ipStpInsertVentMast.Params[0].Value;
  if Not ipStpInsertVentMast.Transaction.InTransaction then
  ipStpInsertVentMast.Transaction.StartTransaction;
  try
    ipStpInsertVentMast.Transaction.CommitRetaining;
  except
  ipStpInsertVentMast.Transaction.RollbackRetaining;
  end;
  dmfactura.tbltrnventasmastupd.Close;
  dmfactura.tbltrnventasmastupd.Params[0].Value:=numeroTrnVta;
  dmfactura.tbltrnventasmastupd.Open;
  if not dmfactura.tbltrnventasmastupdNUMERO.IsNull then
  begin
    dmfactura.tbltrnventasmastupd.Edit;
    dmfactura.tbltrnventasmastupdREF_TRN_ORIGEN.Value:= numerotrnorigen;
    GlbSalvarQuery(dmfactura.tbltrnventasmastupd);
  end;
  //t ProcUpdateCtrlNumVta(numeroTrnVta);
  ProcGuardarDatosCoti(numeroTrnVta);

  if TotalesPreAbono.Value > 0 then
  ProcActualizarStadoPrepP(tablaPropietarioCodigoPropietario.Value,numeroTrnVta);

  ProcUpdateNumDLinea(GlbNumVtaPOS,numeroTrnVta,1);
  Totales.Tag:=numeroTrnVta;
  DatosVocado(numeroTrnVta,ipStpInsertVentMast.Params[5].Value);
  ProcUpdateItbiRecargoVtaMast(numeroTrnVta);

  if (TotalesTipoNCF.Value = '15') OR (TotalesTipoNCF.Value = '14') then
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
  if (GlbPorcPropina > 0) then
  ActFastFoodTicket(NumTicketFFood);
  numeroTrnVta:= ipStpInsertVentMast.Params[0].Value;
   ProcGuardarDatosCoti(numeroTrnVta);

  ActualizaCodUsrCaja(numeroTrnVta);

  ProcUpdateItbiRecargoVtaMast(numeroTrnVta);

  if (GlbActivaIFiscal = 1 ) then
  FInsertarDatosCtrlNIF(numerotrnvta);  
end;

procedure TfrmProcVentaRapida.ReImprimeDevolucion1Click(Sender: TObject);
begin
  UImpresionVentas.ReImprimeDevolucion;
  EsDevolucion := False;
  GlbEsCopia:=False;
end;

procedure TfrmProcVentaRapida.BitBtn4Exit(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmProcVentaRapida.RegistroServicioTaller1Click(
  Sender: TObject);
begin
  LogProcedure('TfrmProcVentaRapida.RegistroServicioTaller1Click');
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
  LogProcedure('TfrmProcVentaRapida.BitBtn24Click');

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
//  LogProcedure('TfrmProcVentaRapida.TotalesAfterScroll');
 if (TotalesMoneda.Value = '') then Exit;
  PAbrirtablaMoneda(TotalesMoneda.Value,GlbFechaTrnDiaria);
  lblTasa.Caption:=Concat('1 =',SimboloMoneda(rxVentaMonedaBase.Value))+dmdatos.qryTasaVALORMONEDA.AsString;
  Totalestotalneto.DisplayFormat:=Concat(SimboloMoneda(TotalesMoneda.Value),',0.00');
end;

procedure TfrmProcVentaRapida.ProcCalculoDivisa;
var
  guardarRec : TBookMark;
begin
  //LogProcedure('TfrmProcVentaRapida.ProcCalculoDivisa');
  if not esEditando then exit;
  guardarRec := rxVenta.GetBookmark;
  try
  if rxVenta.RecordCount > 0 then
  begin
    if rxVenta.State = dsBrowse then
    begin
      rxVenta.First;
      rxVenta.AutoCalcFields := False;
      While Not rxVenta.Eof Do
      begin
        rxVenta.Edit;
        rxVentaMoneda.Value := totalesmoneda.Value;
        rxVenta.Post;
        rxVenta.Next;
      end;
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
    rxVenta.Post;
    CalcularMontoBrutoXMoneda;
  end;
  finally
    if Assigned(guardarRec) then
    begin
      rxVenta.GotoBookmark(guardarRec);
      rxventa.FreeBookmark(guardarRec);
    end;
  end;
end;

procedure TfrmProcVentaRapida.RxDBLookupCombo2Change(Sender: TObject);
begin
  LogProcedure('TfrmProcVentaRapida.RxDBLookupCombo2Change');
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
  LogProcedure('TfrmProcVentaRapida.RxDBLookupCombo2Enter');
  if Totales.State = dsBrowse then
  Totales.Edit;
end;

procedure TfrmProcVentaRapida.RxDBLookupCombo2Exit(Sender: TObject);
begin
  LogProcedure('TfrmProcVentaRapida.RxDBLookupCombo2Exit');
  if rxVentaCodArticulo.IsNull then exit;
  if not esEditando then exit;
  GlbMoneda:= TotalesMoneda.AsInteger;

  if Totales.State in [dsInsert, dsEdit] then
  if not LlenandoDatos then
  Totales.Post;
  if Totales.State = dsBrowse then
  Totales.Edit;
  dmCalculos.EsProcCalc:=True;rxVenta.RecordCount;
  LogEventoVenta('CALL ProcesaCalculos', 'TfrmProcVentaRapida.RxDBLookupCombo2Exit(Sender: TObject);');
  EnProcesoCalculo:=False;
  dmCalculos.ProcesaCalculos;

  dmCalculos.EsProcCalc:=False;
  if esEditando then
  ProcCalculoDivisa;

  Totalestotalneto.DisplayFormat:=Concat(SimboloMoneda(TotalesMoneda.Value),',0.00');
end;

procedure TfrmProcVentaRapida.RxDBLookupCombo2Click(Sender: TObject);
begin
  //LogProcedure('TfrmProcVentaRapida.RxDBLookupCombo2Click');
  if Totales.State = dsBrowse then
  Totales.Edit;
end;

procedure TfrmProcVentaRapida.tblMonedaAfterScroll(DataSet: TDataSet);
begin
  //LogProcedure('TfrmProcVentaRapida.tblMonedaAfterScroll');
  GlbMoneda := tblMonedaCODIGO.AsInteger;
end;

function TfrmProcVentaRapida.BuscarRutaImagen(
  codProducto: Integer): String;
begin
  //LogProcedure('TfrmProcVentaRapida.BuscarRutaImagen');
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
  //LogProcedure('TfrmProcVentaRapida.ValidarDobleRegPago');
  result:=true;
  if rxpagos.State = dsBrowse then
  begin
    if rxpagos.RecordCount > 0 then
    begin
      if MessageDlg('La distribución de pago previa '+LF+CR+
      'será eliminada, continuar?',mtinformation,[mbyes,mbno],0) = mryes then
      begin
        rxpagos.first;
        dmPagosTarjeta.tblDetPagosRevisar.close;
        dmPagosTarjeta.tblDetPagosRevisar.params[0].value:=ExtraerFecha(GlbFechaTrnDiaria);
        dmPagosTarjeta.tblDetPagosRevisar.Open;
        while not rxPagos.eof do
        begin
          if dmPagosTarjeta.tblDetPagosRevisar.locate('serie',rxPagosSerie.Value,[]) then
          dmPagosTarjeta.tblDetPagosRevisar.delete;
          rxPagos.Next;//voy por aqui jun 15 2020
        end;
        GlbSalvarQuery(dmPagosTarjeta.tblDetPagosRevisar);
        result:=True;
      end else
      result:=false;
    end;
  end;
end;

procedure TfrmProcVentaRapida.BitBtn25Click(Sender: TObject);
var
  mmonto : extended;
begin
  //LogProcedure('TfrmProcVentaRapida.BitBtn25Click');
  EsPagoExacto:=False;
  if rxVenta.RecordCount = 0 then Exit;
  if not ValidaSubTotal then exit;
  if valPgoARS then
  begin
    if not ValidarDobleRegPago then exit;
  end;
  SetMontoNotaCredito;
  dmPagosTarjeta.tblDetallePagos.Close;
  dmPagosTarjeta.tblDetallePagos.Params[0].Value:=0;//
  dmPagosTarjeta.tblDetallePagos.Params[1].Value:=1;//Ventas
  dmPagosTarjeta.tblDetallePagos.Open;
          
  //Usado para aceptar pagos combinados.
  //Para ventas Area Trans = 1
  //Para Cobro facturas Area Trans = 2
  //Para Nota Crédito Area Trans = 3
  if not Assigned(frmPagosCombinados) then
  frmPagosCombinados:=TfrmPagosCombinados.Create(Nil);
  try
    frmPagosCombinados._TienepagoTarjeta:=False;
    if frmPagosCombinados.rxCobros.State = dsInactive then
    frmPagosCombinados.rxCobros.Open;
    frmPagosCombinados.areaTrans:=1;//Ventas;
    if frmPagosCombinados.rxCobros.RecordCount = 0 then
    begin
      frmPagosCombinados.rxCobros.Insert;
      frmPagosCombinados.rxCobrostotalNeto.Value:=Totalestotalneto.Value;
      frmPagosCombinados.rxCobrosEfectivo.Value:=0;
      frmPagosCombinados.rxCobrosTarjeta.Value :=0;
      frmPagosCombinados.rxCobrosCheque.Value  :=0;
      frmPagosCombinados.rxCobrosCoberturaARS.Value:=0;
      frmPagosCombinados.rxCobrosBono.Value:=0;
    end;
    if frmPagosCombinados.rxPagos.state = dsInactive then
    frmPagosCombinados.rxPagos.open;

    //Procesar Pago y Cxc a ARS
    //Inicio
  if rxCobertura.RecordCount > 0 then
  begin
    dmPagosTarjeta.tblDetallePagos.Append;
    if (GlbUsaFctMexico = 1) and (not TotalesFechaIniciaPoliza.IsNull) then
    dmPagosTarjeta.tblDetallePagosFECHA.Value:= ExtraerFecha(TotalesFechaIniciaPoliza.Value)
    else
    dmPagosTarjeta.tblDetallePagosFECHA.Value:= ExtraerFecha(GlbFechaTrnDiaria);

    dmPagosTarjeta.tblDetallePagosGlbNumVtaPOS.Value  := GlbNumVtaPOS;
    dmPagosTarjeta.tblDetallePagosAREA_TRANS.Value := frmPagosCombinados.areaTrans;
    dmPagosTarjeta.tblDetallePagosTIPO_PAGO.Value:=18; //Cobertura ARS
    dmPagosTarjeta.tblDetallePagosMONTO_PAGADO.Value:= rxCoberturaMontoCobertura.Value;

    dmPagosTarjeta.tblDetallePagosPAGO.Value:=0;

    if (dmPagosTarjeta.tblDetallePagosMONTO_PAGADO.Value < 0) then
    dmPagosTarjeta.tblDetallePagosMONTO_PAGADO.Value:=0;
    frmPagosCombinados.BitBtn19Click(Self);
  end;

  frmPagosCombinados.ShowModal;
  _TienepagoTarjeta:= frmPagosCombinados._TienepagoTarjeta;
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
  frmPagosCombinados.rxCobrosCoberturaARS.Value +
  frmPagosCombinados.rxCobrosBono.Value;
  Edit1.Text := Format('%8.2f',[mmonto]);
  finally

  end;
  if frmProcVentaRapida.showing then
  Edit1.SetFocus;
  BitBtn2Click(Self);
  Edit1Exit(Self);
  if frmProcVentaRapida.showing then
  if frmProcVentaRapida.BitBtn4.Enabled then
  if isShowing then
  frmProcVentaRapida.BitBtn4.SetFocus;
  valPgoARS:=True;
end;

procedure TfrmProcVentaRapida.ProcInsertarDetPagos(numtrn : integer);
begin
  LogProcedure('TfrmProcVentaRapida.ProcInsertarDetPagos');
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

  dmcxc.tblDetallePagosGlbNumVtaPOS.Value  := GlbNumVtaPOS;

  if Not dmcxc.rxIngresoEnTarjetaMONTOAUTORIZADO.IsNull then
  dmcxc.tblDetallePagosTIPO_PAGO.Value        := 2;//tarjeta

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
  except
  dmcxc.tblDetallePagos.Transaction.RollbackRetaining;
  end;  

end;

procedure TfrmProcVentaRapida.ProcInsertarDetBono(numtrn: integer);
begin
  LogProcedure('TfrmProcVentaRapida.ProcInsertarDetBono');
  if dmcxc.rxIngresoEnBonosNumero.IsNull then exit;
  dmcxc.tblDetallePagos.Close;
  dmcxc.tblDetallePagos.Open;
  dmcxc.tblDetallePagos.Append;
  dmcxc.tblDetallePagosFECHA.Value              :=GlbFechaTrnDiaria;
  dmcxc.tblDetallePagosTIPO.Value             := 1;//contado

  dmcxc.tblDetallePagosTIPO_PAGO.Value        := 9; //bono - cupon

  dmcxc.tblDetallePagosSERIE_TRN.Value        := numtrn;
  dmcxc.tblDetallePagosGlbNumVtaPOS.Value  := GlbNumVtaPOS;
  dmcxc.tblDetallePagosAREA_TRANS.Value       := 1;//Ventas
  dmcxc.tblDetallePagosNUMERO_CUPON.value     := dmcxc.rxIngresoEnBonosNumero.AsInteger;
  dmcxc.tblDetallePagos.Post;

  dmcxc.tblDetallePagos.ApplyUpdates;
  if not dmcxc.tblDetallePagos.Transaction.InTransaction then
  dmcxc.tblDetallePagos.Transaction.StartTransaction;
  try
    dmcxc.tblDetallePagos.Transaction.CommitRetaining;
  except
  dmcxc.tblDetallePagos.Transaction.RollbackRetaining;
  end;

end;

procedure TfrmProcVentaRapida.ProcInsertarDetCheque(numtrn: integer);
begin
  LogProcedure('TfrmProcVentaRapida.ProcInsertarDetCheque');
  if dmcxc.rxIngChequeDetCodigo_Banco.IsNull then exit;
  dmcxc.tblDetallePagos.Close;
  dmcxc.tblDetallePagos.Open;
  dmcxc.tblDetallePagos.Append;
  dmcxc.tblDetallePagosFECHA.Value :=GlbFechaTrnDiaria;

  dmcxc.tblDetallePagosTIPO.Value             := 1;//CONTADO
  dmcxc.tblDetallePagosMONTO_PAGADO.Value     :=  dmcxc.rxIngChequeDetMonto_Cheque.Value;
  dmcxc.tblDetallePagosTIPO_PAGO.Value        := 3; //Cheque

  dmcxc.tblDetallePagosNUMERO_CHEQUE.Value    := dmcxc.rxIngChequeDetNumero_Cheque.Value;
  dmcxc.tblDetallePagosCOD_BANCO_CHEQUE.Value := dmcxc.rxIngChequeDetCodigo_Banco.Value;
  dmcxc.tblDetallePagosSERIE_TRN.Value        := numtrn;

  dmcxc.tblDetallePagosGlbNumVtaPOS.Value  := GlbNumVtaPOS;
  dmcxc.tblDetallePagosAREA_TRANS.Value       := 1;//Ventas
  //dmcxc.tblDetallePagosNUMERO_CUPON.value     := dmcxc.rxIngresoEnBonosNumero.AsInteger;
  dmcxc.tblDetallePagos.Post;
  dmcxc.tblDetallePagos.ApplyUpdates;
  if not dmcxc.tblDetallePagos.Transaction.InTransaction then
  dmcxc.tblDetallePagos.Transaction.StartTransaction;
  try
    dmcxc.tblDetallePagos.Transaction.CommitRetaining;
  except
  dmcxc.tblDetallePagos.Transaction.RollbackRetaining;
  end;

end;

procedure TfrmProcVentaRapida.Poliza1Click(Sender: TObject);
begin
  LogProcedure('TfrmProcVentaRapida.Poliza1Click');
  MessageDlg('Ventana Inactiva temporalmente.', mtinformation,[mbok],0);
end;


procedure TfrmProcVentaRapida.DescargaNotaCredito;
var
  resto : Currency;
begin
  LogProcedure('TfrmProcVentaRapida.DescargaNotaCredito');
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
  LogProcedure('TfrmProcVentaRapida.CheckBox4Click');
  Edit1.Text:='';
  if Not CheckBox4.Checked then
  begin
    Totales.Edit;
    TotalesMontoNotaCredito.Value := 0;
    TotalesMontoNCRAplicado.Value := 0;

    Totalesdevolucion.Value := 0;
    if not LlenandoDatos then
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
    if not LlenandoDatos then
    Totales.Post;
  end;
end;

procedure TfrmProcVentaRapida.SetMontoNotaCredito;
begin
  LogProcedure('TfrmProcVentaRapida.SetMontoNotaCredito');
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
  //LogProcedure('TfrmProcVentaRapida.BitBtn26Click');
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
  //LogProcedure('TfrmProcVentaRapida.rxVentaBeforeInsert');
  if rxVenta.State = dsBrowse then  if Not rxVentaSerie.IsNull then
 // if not rxVenta.BOF then
 // rxVenta.Last;
  if rxVenta.State in [dsInsert] then
  begin
    if (rxVentaTipoUnidad.IsNull) or (rxVentaTipoUnidad.Value = 0) then
    begin
      if dmInventario.qryTipoUnidad.Locate('DESCRIPCION', 'UNIDAD', []) then
      begin
        GlbTipoUnidad := dmInventario.qryTipoUnidadIDUNIDAD.Value;
        if rxVenta.State in [dsEdit,dsInsert] then
           rxVentaTipoUnidad.Value:= GlbTipoUnidad;
           CantUnidad:= dminventario.qryTipoUnidadCANTIDAD.Value;
           cboxTipoUnidad.Text := dminventario.qryTipoUnidadDESCRIPCION.Value;
      end;
    end;
   if VerificaVentaExisteRX(rxVentaSerie.Value) then
   Exit;
  end;
  if rxVenta.State in [dsedit, dsInsert] then
  rxVenta.Post;
  if EsModificandoFactura then exit;

  procCalc:=True;
end;
///Precio unidad por cantidad * precio
procedure TfrmProcVentaRapida.SetPrecioPorCantidad;
begin
  //LogProcedure('TfrmProcVentaRapida.SetPrecioPorCantidad');
  if GlbFactRecurrente then Exit; //Ya el precio viene asignado
  //LogInfoLoop('TfrmProcVentaRapida.SetPrecioPorCantidad');
  if rxVenta.State = dsBrowse then
  rxVenta.Edit;
  dmVentas.qryPrecioUnidadSurt.Close;
  dmVentas.qryPrecioUnidadSurt.Params[0].Value:=rxVentaCodArticulo.Value;
  dmVentas.qryPrecioUnidadSurt.Open;
  if (GlbUsaPUnidadLevel = 0) and (glbUsaescalaPrecio = 0) then
  exit;

  if GlbUsaPUnidadLevel = 1 then
  begin
    dmVentas.qryPrecioUnidadSurt.Close;
    dmVentas.qryPrecioUnidadSurt.Params[0].Value:=rxVentaCodArticulo.Value;
    dmVentas.qryPrecioUnidadSurt.Open;
    DSQryPrecios.DataSet := dmVentas.qryPrecioUnidadSurt;
    if dmVentas.qryPrecioUnidadSurt.Locate('COD_PRODUCTO;IDUNIDAD',
    VarArrayOf([rxVentaCodArticulo.Value,GlbTipoUnidad]),[]) then
    begin
      cboxTipoUnidad.Text:=dmVentas.qryPrecioUnidadSurtDESCRIPCION.Value;
      if (RxSpinEdit1.AsInteger = 5) then
      begin
        rxVentaLevelPrecio.Value:=5;
      end else
      begin
      case RxSpinEdit1.AsInteger Of
      1: begin
           if dmVentas.qryPrecioUnidadSurtPRECIOVENTA1.Value > 0 then
           begin
             rxVentaPrecio.Value := dmVentas.qryPrecioUnidadSurtPRECIOVENTA1.Value;
             rxVentaLevelPrecio.Value:=1;
           end;
         end;
      2: begin
          if dmVentas.qryPrecioUnidadSurtPRECIOVENTA2.Value > 0 then
          begin
            rxVentaPrecio.Value := dmVentas.qryPrecioUnidadSurtPRECIOVENTA2.Value;
            rxVentaLevelPrecio.Value:=2;
          end;
         end;
      3:begin
          if dmVentas.qryPrecioUnidadSurtPRECIOVENTA3.Value > 0 then
          begin
            rxVentaPrecio.Value := dmVentas.qryPrecioUnidadSurtPRECIOVENTA3.Value;
            rxVentaLevelPrecio.Value:=3;
          end;
        end;
      4: begin
           if dmVentas.qryPrecioUnidadSurtPRECIOVENTA4.Value > 0 then
           begin
             rxVentaPrecio.Value := dmVentas.qryPrecioUnidadSurtPRECIOVENTA4.Value;
             rxVentaLevelPrecio.Value:=4;
           end;
        end;
      end;//case
      end;
    end;
  end else
  begin
  //p1 p3 p3 p4
  QryPrecios.Close;
  QryPrecios.Params[0].Value:=rxVentaCodArticulo.Value;
  QryPrecios.Open;
  if QryPrecios.Locate('Codigo', rxVentaCodArticulo.Value,[]) then
  begin
    if (RxSpinEdit1.AsInteger = 5) then
    begin
      rxVentaLevelPrecio.Value:=5;
    end else
    begin
    case RxSpinEdit1.AsInteger Of
    1: begin
         if QryPreciosPRECIOVENTA1.Value > 0 then
         begin
           rxVentaPrecio.Value := QryPreciosPRECIOVENTA1.Value;
           rxVentaLevelPrecio.Value:=1;
         end;
       end;
    2: begin
        if QryPreciosPRECIOVENTA2.Value > 0 then
        begin
          rxVentaPrecio.Value := QryPreciosPRECIOVENTA2.Value;
          rxVentaLevelPrecio.Value:=2;
        end;
       end;
    3:begin
        if QryPreciosPRECIOVENTA3.Value > 0 then
        begin
          rxVentaPrecio.Value := QryPreciosPRECIOVENTA3.Value;
          rxVentaLevelPrecio.Value:=3;
        end;
      end;
    4: begin
         if QryPreciosPRECIOVENTA4.Value > 0 then
         begin
           rxVentaPrecio.Value := QryPreciosPRECIOVENTA4.Value;
           rxVentaLevelPrecio.Value:=4;
         end;
      end;
    end;//case
    end;
  end;
  end;
  if (rxVentaPrecio.Value = 0) then
  begin
    MessageDlg('Precio por niveles no esta configurado verifique.',mterror,[mbok],0);
    rxVenta.Cancel;
  end;
end;

procedure TfrmProcVentaRapida.BitBtn1Enter(Sender: TObject);
begin
  //LogProcedure('TfrmProcVentaRapida.BitBtn1Enter');
  BitBtn1.Font.Color := clRed;
  edtCodigo.Text:='';  
end;

function TfrmProcVentaRapida.VerificaRecordsVenta: boolean;
var
  guardaR : TBookmark;
begin
  LogProcedure('TfrmProcVentaRapida.VerificaRecordsVenta');
  result:=False;
  guardaR := rxVenta.GetBookmark;
  try
  rxVenta.First;
  rxVenta.disablecontrols;
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
  rxVenta.enableControls;
  finally
  rxventa.GotoBookmark(guardaR);
  rxventa.FreeBookmark(guardaR);
  end;
end;

procedure TfrmProcVentaRapida.BitBtn1Exit(Sender: TObject);
begin
  LogProcedure('TfrmProcVentaRapida.BitBtn1Exit');
  BitBtn1.Font.Color := clBlack;
end;

procedure TfrmProcVentaRapida.DBRadioGroup1Enter(Sender: TObject);
begin
//  LogProcedure('TfrmProcVentaRapida.DBRadioGroup1Enter');
  if (rxVenta.RecordCount > 0) then
  if rxVenta.State in [dsEdit, dsInsert] then
  begin
    rxVenta.Edit;
  end;
end;

procedure TfrmProcVentaRapida.DBRadioGroup1Exit(Sender: TObject);
begin
  //LogProcedure('TfrmProcVentaRapida.DBRadioGroup1Exit');
  if frmProcVentaRapida.Showing then
  dbedit2.SetFocus;
end;

procedure TfrmProcVentaRapida.PrepararInfoFiscal(numerotrn: integer);
begin
  //LogProcedure('TfrmProcVentaRapida.PrepararInfoFiscal');
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
  //LogProcedure('TfrmProcVentaRapida.Button1Click');
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

    PrepararInfoFiscal(NumeroTrn);

    GlbNombreFiletoPrint:= Format('%s%s%s%s%s%s%s',[dmReportes.qryDatosCajaImpUserRUTA_TICKET.Value,'\Recibo',Trim(GlbCodSucursal),Trim(GlbModeloImpresora),
    IntToStr(VarUsuarioGlb),StrLeftPad(IntToStr(dmReportes.qryDatosVentaMasterNUMERO.Value),8),'.txt']);

    dmreportes.qryNCFAfectado.Close;
    dmreportes.qryNCFAfectado.Params[0].Value:= dmReportes.qryDatosVentaMasterSERIE_NCF_ASIGNADO.Value;
    dmreportes.qryNCFAfectado.Open;

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

procedure TfrmProcVentaRapida.VerificaImpresoraFiscalM;
var
  archivo : String;
  tHoras : integer;
begin
  LogProcedure('TfrmProcVentaRapida.VerificaImpresoraFiscalM');
  try
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
    if (TotalHorasCierreZ(Date) >=26) and (GlbActivaIFiscal = 1) then
    begin
      MessageDlg('Es necesario realizar cierre Z', mtInformation,[mbok],0);
      BitBtn1.Enabled := False;
    end;
  end;
   except on E : Exception do
     WriteToLog (E.ClassName+' TfrmProcVentaRapida.VerificaImpresoraFiscalM: '+E.Message);
  end;
end;

procedure TfrmProcVentaRapida.qryVenceAfterClose(DataSet: TDataSet);
 var  x : Smallint;
begin
  LogProcedure('TfrmProcVentaRapida.qryVenceAfterClose');
   x:=7;
end;

procedure TfrmProcVentaRapida.qryVenceBeforeClose(DataSet: TDataSet);
 var  x : Smallint;
begin
  LogProcedure('TfrmProcVentaRapida.qryVenceBeforeClose');
   x:=7;
end;

procedure TfrmProcVentaRapida.DBEdit5Enter(Sender: TObject);
begin
  LogProcedure('TfrmProcVentaRapida.DBEdit5Enter');
  if Totales.State = dsBrowse then
  EsBrowsing := True
  else EsBrowsing:=False;
end;

procedure TfrmProcVentaRapida.ReImprimeDocFiscal1Click(Sender: TObject);
begin
  LogProcedure('TfrmProcVentaRapida.ReImprimeDocFiscal1Click');
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
      //if VerificaClave then
      if VerificaHuellas then
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

  dmfactura.qryVtaConDeliveryTrn.Close;
  dmfactura.qryVtaConDeliveryTrn.Params[0].Value:= dmFactura.qryVentaFacturaNUMERO.Value;;
  dmfactura.qryVtaConDeliveryTrn.Open;

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
  IntToStr(VarUsuarioGlb),StrLeftPad(IntToStr(dmreportes.qryDatosVentaMasterNUMERO.Value),8),'.txt']);

  frmBuscarNIF:=TfrmBuscarNIF.Create(Nil);
  try
    if frmBuscarNIF.Showmodal = mrok then
    begin
      if (dmReportes.qryDatosReimpDocFiscal.RecordCount > 0) then
      begin
                              //Re-Imprime
      frmTestImpresoraFiscal:=TfrmTestImpresoraFiscal.Create(Nil);
      try
        //frmTestImpresoraFiscal.Button1Click(Self);
       frmTestImpresoraFiscal.EsDevolucion:= EsDevolucion;
       frmTestImpresoraFiscal.LCantCopias := rxspinImpCantCopias.Text;
       ProcReImpDocFiscal(dmReportes.qryDatosReimpDocFiscalNUMERO.Value,
       dmReportes.qryDatosReimpDocFiscalFECHA.Value);
        frmTestImpresoraFiscal.btnReimprimirdocFiscalClick(Self);//Button1Click(Self);
        frmTestImpresoraFiscal.Button3Click(Self);
        repeat
           ProcReImpDocFiscal(dmReportes.qryDatosReimpDocFiscalNUMERO.Value,
          dmReportes.qryDatosReimpDocFiscalFECHA.Value);
        until  not GlbImprimiendo;
      finally
      frmTestImpresoraFiscal.Free;
      frmTestImpresoraFiscal:=Nil;
      end;
      //Delay(1000);
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
  LogProcedure('TfrmProcVentaRapida.Cancelar1Click');
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
  ProcesaEstadoImpresora(numeroTrnVta);
  if GlbActivaIFiscal = 0 then exit;
  ProcActualizaMsg;
end;

procedure TfrmProcVentaRapida.CirreZ1Click(Sender: TObject);
var
  buttonSelected : Integer;
begin
  LogProcedure('TfrmProcVentaRapida.CirreZ1Click');
  frmCierreJornada:=TfrmCierreJornada.Create(nil);
  try
    frmCierreJornada.Showmodal;
  finally
  frmCierreJornada.Free;
  frmCierreJornada:=Nil;
  end;

  ProcesaEstadoImpresora(numeroTrnVta);
end;

procedure TfrmProcVentaRapida.CierreX1Click(Sender: TObject);
var
  cmd : String;
begin
  LogProcedure('TfrmProcVentaRapida.CierreX1Click');
  if (GlbActivaIFiscal = 0 ) then exit;
  frmCierreJornada:=TfrmCierreJornada.Create(nil);
  try
    frmCierreJornada.Showmodal;
  finally
  frmCierreJornada.free;
  frmCierreJornada:=nil;
  end;
  ProcesaEstadoImpresora(-1);
end;

procedure TfrmProcVentaRapida.ProcesaEstadoImpresora(xNumeroTrn:Integer);
begin
  LogProcedure('TfrmProcVentaRapida.ProcesaEstadoImpresora');
  if (GlbActivaIFiscal = 0 ) then exit;
  if GlbImprimiendo then Exit;
  //poner aqui control para controlar mensaje de error
  {if (rxVenta.RecordCount >0) then
  begin
    dmFactura.tblFiscalStatusTicket.Close;
    dmFactura.tblFiscalStatusTicket.Params[0].Value := xNumeroTrn;
    dmFactura.tblFiscalStatusTicket.Open;
    //if dmFactura.tblFiscalStatusTicket.RecordCount = 0 then Exit;
    //Totales.Tag
    if dmFactura.tblFiscalStatusTicketIMPRIMIENDO.Value = 1 then
    begin
      GlbImprimiendo :=True;
      Exit;
    end;
  end;   }
  
  //tabla FISCALSTATUS_TICKET
  if GlbPuerto = 4 then
  begin
    FiscalPrinter.CommPort:= $00000003;
  end;
  if GlbBaudRate = 9600 then
  FiscalPrinter.BaudRate:= $00000003;

  //if not GLBIFiscalBusy and not  GLBIFiscalOnline then
  //begin
    AbrirPuerto;
    //temporal hoy 4/27/2018 StatusBar.Panels[0].Text:='Printer: ' + GetFiscalStatus;
    //temporal hoy 4/27/2018 StatusBar.Panels[1].Text:='Status: ' + GetFiscalError;
  //  end;
  //end else
  //begin
  //  StatusBar.Panels[1].Text:='Status: ' + GetFiscalError;
  //  StatusBar.Panels[0].Text:='Printer: ' + GetFiscalStatus;
  //end;
  if (GlbIFiscalError <> 'Puerto en uso') And
     (GlbIFiscalError <> '') And
     (GlbIFiscalError <> 'Ready') And
     (GlbIFiscalError <> 'Listo') and (8=3) then //temporal
     if not GlbImprimiendo then
  MessageDlg('Impresora fiscal esta offline. '#13'Verifique que no esta apagada, desconectada o '#13'que no exista un documento abierto.',mtInformation,[mbOk],0)
  else
  begin
    StatusBar.Panels[0].Text:='Printer: ' + 'OnLine';//esto temporal 
    StatusBar.Panels[1].Text:='Status: ' + '';
  end;
  CerrarPuerto;
end;

procedure TfrmProcVentaRapida.Estatus1Click(Sender: TObject);
begin
  LogProcedure('TfrmProcVentaRapida.Estatus1Click');
  if (GlbActivaIFiscal = 1 ) then
  ProcesaEstadoImpresora(numeroTrnVta);
end;

procedure TfrmProcVentaRapida.DBEdit10Exit(Sender: TObject);
begin
  //LogProcedure('TfrmProcVentaRapida.DBEdit10Exit');
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
    //RxDBLookupCombo3Exit(self);
      // ?? Esta parte es clave:
  dmCalculos.EsProcCalc:=True;
  if rxVenta.RecordCount > 1 then
  begin
    if rxVenta.state in [dsedit, dsinsert] then
    rxVenta.Post;
    rxVenta.first;
    RxDBGrid1.DisableScroll;
    while not rxVenta.Eof do
    begin
      rxVenta.edit;
      LogEventoVenta('CALL ProcesaCalculos', 'TfrmProcVentaRapida.DBEdit10Exit(Sender: TObject);');
      EnProcesoCalculo:=False;
      dmCalculos.ProcesaCalculos;
      if rxVenta.state in [dsedit, dsInsert] then
      rxVenta.post;
      rxVenta.next;
    end;
    RxDBGrid1.EnableScroll;
  end else
  begin
    LogEventoVenta('CALL ProcesaCalculos', 'TfrmProcVentaRapida.DBEdit10Exit(Sender: TObject);');
    EnProcesoCalculo:=False;
    dmCalculos.ProcesaCalculos;
  end;
        
    if rxVenta.State in [dsEdit, dsInsert] then
    rxVenta.Post;
    //t if not CalcYaEjecutado or rxVenta.Modified then
    //t begin
    //t   GlbCalculado := False;
    //t   DiferirCalculoTotales;
    //t end;
    //t BitBtn27Click(Self);
  end;

  Refresh;
end;

procedure TfrmProcVentaRapida.RxDBLookupCombo3Exit(Sender: TObject);
var
  xpos : integer;
begin
  //LogProcedure('TfrmProcVentaRapida.RxDBLookupCombo3Exit');
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

  if (tablaPropietarioCodigoPropietario.Value > 0) then
  begin
    if qryCliente.Locate('CODIGO_CTE', tablaPropietarioCodigoPropietario.Value, []) then
    lblRNC.Caption:= 'RNC =>' +qryclienternc_numero.Value
    else
    lblRNC.Caption :='';
  end;
  if Totales.State = dsBrowse Then Totales.Edit;
  if Totales.State In [dsEdit, dsInsert] Then
  begin
    if (TotalesTipoNCF.IsNull) And (Not TotalesTipoNCFIFiscal.IsNull) then
    TotalesTipoNCF.Value := dmFactura.ibQryViewNCFTIPO_CF.Value
    else
    if (TotalesTipoNCF.Value <> dmFactura.ibQryViewNCFTIPO_CF.Value) then
    TotalesTipoNCF.Value := dmFactura.ibQryViewNCFTIPO_CF.Value;

     TotalesMontoExoneraITBIS.Value:= 0;  //Factura.ibQryViewNCFTIPO_NCF_IFISCAL.Value
     if Not dmFactura.ibQryViewNCF.Locate('TIPO_CF',
     VarArrayOf([TotalesTipoNCF.Value]), []) then
     begin
       TotalesTipoNCF.AsVariant := null;
       TotalesTipoNCFIFiscal.AsVariant := null;;
     end;

     label29.Caption := 'Sub-Total Indirecto';

  end;
  ProcItbisExonerado;
    // ?? Esta parte es clave:
  if rxVenta.State in [dsEdit, dsInsert] then
    rxVenta.Post;
  //t BitBtn27Click(Self);
  if not GlbCalculado then
    CalcularTotalesInterno;
  if qryEmpleado.State = dsInactive then
  qryEmpleado.Open;

  Refresh;
end;


procedure TfrmProcVentaRapida.PrepararInfoFiscalNCR(numerotrn: integer);
begin
  //LogProcedure('TfrmProcVentaRapida.PrepararInfoFiscalNCR');
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
  LogProcedure('TfrmProcVentaRapida.chKDescuentoGlobalClick');
  esEditando:=True;
  if not chKDescuentoGlobal.Checked then
  begin
    Totales.Edit;
    TotalesPorcDesAdicional.Value:=0;
  end;
  procCalc := True;
  GlbCalculado:=False;
  if entraDessGlb and LlenandoDatos then exit;//probando velocidad;

  if TotalesPorcDesAdicional.IsNull then
  begin
    ProvVerDatosDescGlb;
    exit;
  end;

  DBEdit10Exit(Self);
  DBEdit17Exit(Self);
  ProvVerDatosDescGlb;
  Refresh;
end;

{
procedure TfrmProcVentaRapida.DBEdit11Change(Sender: TObject);
begin
  //LogProcedure('TfrmProcVentaRapida.DBEdit11Change');
  EnProcesoCalculo:=True;
  if frmProcVentaRapida.Totales.Tag = 609 then exit;
  if LlenandoDatos then exit;

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
  DBEdit17Exit(Self);
end;}

procedure TfrmProcVentaRapida.DBEdit11Change(Sender: TObject);
begin
  if EnProcesoCalculo or LlenandoDatos or (Totales.Tag = 609) then Exit;
  
  if Totales.Tag = 601 then Exit; // Estoy editando
  
  ProvVerDatosDescGlb;
  if LlenandoDatos then Exit;
  esEditando:=True;
  DatosModificados := True;
  GlbCalculado := False;
  procCalc := True;
end;

procedure TfrmProcVentaRapida.ImprimeFiscalContado(xNumeroTrn:Integer);
var
  xexiste:boolean;
begin
  LogProcedure('TfrmProcVentaRapida.ImprimeFiscalContado');
  reciboImpreso := False;
  dmReportes.qryViewVentasMast.Close;
  dmReportes.qryViewVentasMast.Params[0].Value := xNumeroTrn;
  dmReportes.qryViewVentasMast.Open;
  ProcSetPathlogoTipoServicio(dmReportes.qryViewVentasMastTIPO_AFILIADO.Value);
  ProcActualizaMsg;
    if (xNumeroTrn <= 0) then
    begin
      if not InputQuery('Entre número transacción','Indique número',_ulttrnImp) then
      exit
      else
      if (_ulttrnImp <> '') then 
      xNumeroTrn:= StrtoInt(_ulttrnImp);
    end;
    dmdatos.qryConfCajaXusuario.Close;
    dmdatos.qryConfCajaXusuario.Open;
    dmdatos.qryConfCajaXusuario.Locate('COD_EMPLEADO', VarUsuarioGlb,[]);

    dmReportes.qryDatosVentaMaster.Close;
    dmReportes.qryDatosVentaMaster.Params[0].Value:= xNumeroTrn; //dmFactura.qryVentaFacturaNumero.Value;
    dmReportes.qryDatosVentaMaster.Open;

    dmReportes.qryDatosCajaImpUser.Close;
    dmReportes.qryDatosCajaImpUser.Params[0].Value:= VarUsuarioGlb;
    dmReportes.qryDatosCajaImpUser.Open;
    dmReportes.qryDatosCajaImpUser.Last;
    dmReportes.qryDatosCajaImpUser.RecordCount;

    GlbNombreFiletoPrint:= Format('%s%s%s%s%s%s%s',[dmReportes.qryDatosCajaImpUserRUTA_TICKET.Value,'\Recibo',Trim(GlbCodSucursal),Trim(GlbModeloImpresora),
    IntToStr(VarUsuarioGlb),StrLeftPad(IntToStr(dmreportes.qryDatosVentaMasterNUMERO.Value),8),'.txt']);
    PrepararInfoFiscal(xNumeroTrn);

    GlbImprimiendo:=False;
    xexiste:=False;         //alcontado
    frmTestImpresoraFiscal:=TfrmTestImpresoraFiscal.Create(Nil);
    try
      frmTestImpresoraFiscal.LCantCopias := rxspinImpCantCopias.Text;
      frmTestImpresoraFiscal.Button1Click(Self);

      ProcInsFiscalCtrl(dmReportes.qryDatosReimpDocFiscalNUMERO.Value,
      dmReportes.qryDatosReimpDocFiscalFECHA.Value,xexiste);

      frmTestImpresoraFiscal.btnImprimeReciboClick(Self);//Button1Click(Self);
      Sleep(500);//antes 4000
      repeat
         ProcInsFiscalCtrl(dmReportes.qryDatosReimpDocFiscalNUMERO.Value,
         dmReportes.qryDatosReimpDocFiscalFECHA.Value,xexiste);
      until not GlbImprimiendo;
    finally
    frmTestImpresoraFiscal.Free;
    frmTestImpresoraFiscal:=Nil;
    end;
    //Delay(5000);
    reciboImpreso := True;
end;

procedure TfrmProcVentaRapida.FormClick(Sender: TObject);
begin
  LogProcedure('TfrmProcVentaRapida.FormClick');
  //frmProcVentaRapida.Width :=969;
  //frmProcVentaRapida.Height:=751;
  refresh;
end;

procedure TfrmProcVentaRapida.RecuperaTicketfiscal1Click(Sender: TObject);
begin
  LogProcedure('TfrmProcVentaRapida.RecuperaTicketfiscal1Click');
  if (GlbActivaIFiscal = 1) then
  begin 
     dmReportes.qryTicket_params.Close;
     dmReportes.qryTicket_params.Open;
     dmReportes.qryTicket_params.First;
     if dmReportes.qryTicket_params.RecordCount > 0 then
     begin
       if MessageDlg('Desea reimprimir los '+IntToStr(dmReportes.qryTicket_params.RecordCount) + ' pendiente?',mtInformation,[mbyes, mbno], 0) = mryes then
      While not dmReportes.qryTicket_params.Eof do
      begin
        if MessageDlg('Imprimir transacción número '+dmReportes.qryTicket_paramsNUMERO_TRN.AsString+'?',mtInformation,[mbyes, mbno], 0) = mrno then
        Break;
        ShellExecute(0, 'Open', PChar(dmReportes.qryTicket_paramsarchivo.Value), PChar(dmReportes.qryTicket_paramsPARAMETROS.Value), PChar(''), SW_Hide);

        if (GlbEsDebugFiscal = 1) then
        begin
          LogInformacionTxt('dmReportes.qryTicket_paramsarchivo.Value:'+dmReportes.qryTicket_paramsarchivo.Value);
          LogInformacionTxt('dmReportes.qryTicket_paramsPARAMETROS.Value: '+dmReportes.qryTicket_paramsPARAMETROS.Value);
        end;

        Delay(3000);
        dmReportes.qryTicket_params.Next;
      end;

     dmReportes.qryTicket_params.Close;
     dmReportes.qryTicket_params.Open;

    if (dmReportes.qryTicket_params.RecordCount > 0) then
    begin
      MessageDlg('Existe '+
      IntToStr(dmReportes.qryTicket_params.RecordCount)
      +' más de un record(s) pendiente impresión ticket, '#13' NO DEBE GENERAR MAS VENTAS.',mtError,[mbok], 0);
    end;
    dmReportes.qryTicket_params.Close;
    RxSpeedButton1.Visible:=False;
    CheckBox2.Visible:=False;
    CheckBox3.Visible:=False;
    BitBtn19.Visible:=False;
    BitBtn18.Visible:=False;
    BitBtn23.Visible:=False;
    if (GLBSAM = 0) then
    begin
      label20.Caption :='Nombre Cliente Generico';
      cboxUseLogo.Visible:=False;
      cboxUseLogo.BringToFront;
    end;
    rdgFactServicio.Visible := False;
    rdgFactVentaProducto.Visible := False;
    ProcActualizaMsg;

    Exit;
      //no es necesario corer el codigo que sigue.
    end;
       
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
      if MessageDlg('Desea reimprimir los '+IntToStr(qryVerificaReciboPdte.RecordCount) + ' pendiente?',mtInformation,[mbyes, mbno], 0) = mryes then
      begin
        qryVerificaReciboPdte.First;
        While Not qryVerificaReciboPdte.Eof Do
        begin
          if MessageDlg('Imprimir transacción número '+qryVerificaReciboPdteNUMERO.AsString+'?',mtInformation,[mbyes, mbno], 0) = mrno then
          break;

          ImprimeFiscalContado(qryVerificaReciboPdteNUMERO.Value);
          //Delay(5000);
          if Not reciboImpreso then
          begin
            if MessageDlg('Ticket pendiente '+qryVerificaReciboPdteNUMERO.AsString+' no pudo ser impreso, desea continuar?',mtInformation,[mbyes, mbno], 0) = mrno then
            break;
          end;
          if qryVerificaReciboPdte.recordCount > 1 then
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
    if (GlbSam = 1 ) then
    begin
      label20.Caption :='Tipo Afiliación';
      cboxUseLogo.Visible:=True;
      cboxUseLogo.BringToFront;
    end;
    BitBtn23.Visible:=False;
    rdgFactServicio.Visible := False;
    rdgFactVentaProducto.Visible := False;
    ProcActualizaMsg;
  end;
end;

procedure TfrmProcVentaRapida.DBEdit11Exit(Sender: TObject);
begin 
  if not Visible or not isShowing then Exit;
  if Totales.Tag = 601 then Exit;              // sigue respetando tu bloqueo
  if rxVentaCodTexto.Value = '' then Exit;

  if (TotalesPorcDesAdicional.Value = 0) then
  chKDescuentoGlobal.Checked:=False
  else
  Edit1Enter(Self);

  // Actualiza flags de estado que uses
  entraDessGlb   := False;
  GlbAlreadyCld  := False;

  // 1) Guarda el nuevo porcentaje en Totales
  Totales.Edit;
  // Convierte el texto del DBEdit a número de forma segura
  TotalesPorcDesAdicional.Value :=
      StrToFloatDef(DBEdit11.Text, 0);
  Totales.Post;

  // 2) Pide un único recálculo
  SolicitarCalculoTotales(tcDescuento);

  rxVenta.EnableControls;
  RxDBGrid1.EnableScroll;

  // 3) UI: devuelve el foco
  if isShowing and not EsModificandoCotiza then
    edtCodigo.SetFocus;
  chKDescuentoGlobalClick(Self);    
end;


procedure TfrmProcVentaRapida.DBEdit10Enter(Sender: TObject);
begin
  LogProcedure('TfrmProcVentaRapida.DBEdit10Enter');
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
  LogProcedure('TfrmProcVentaRapida.rxVentaBeforeEdit');
  if not GlbUsandoCotiza then
  ProcItbisExonerado;
  procCalc:=True;
  esEditando:= true;
  dmCalculos.avoidLoopExtra:=False;
end;

procedure TfrmProcVentaRapida.ReactivarValores;
begin
  LogProcedure('TfrmProcVentaRapida.ReactivarValores');
  flagSolLote:=false;
  rxVenta.EmptyTable;
  Edit1.Text      := '';
  DescFactRecurrente:='';
  xCodProd:=-1;
  edtCodigo.Text  := '';
  BitBtn4.Enabled := False;
  ProcesandoVenta := False;
  Totales.EmptyTable;
  rxPagos.EmptyTable;

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

  EsFactura := False;

  tablaPropietario.EmptyTable;

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
  edtMontoInicial.Text:='';
  edtCodProdFinanc.Text:='';
          
  //Delay(3000);
  if (GlbActivaIFiscal = 1 ) then
  begin
    ProcesaEstadoImpresora(numeroTrnVta);
    ProcGlbSecuenciaNCF;
  end;                
  rxdbLookupCteChange(Self);
  Refresh;
  //Application.ProcessMessages;
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
  GlbNumVtaPOS:=-1;
  xCodProd:=-1;
  GlbNumVtaPOSTmp:=-1;
  label41.Visible := False;
  DBText15.Visible:= True;
  if (GlbNumVtaPOS > 0) then
  dmcalculos.ProcDeletePosExtraDet(GlbNumVtaPOS);
  GlbNumVtaPOS:=-1;
  procCalc:=True;
  EsModificandoFactura:=False;
  GlbAlreadyCld := False;
  CalcYaEjecutado:=False;
  procCalc := True;
  esEditando := False;
  GlbCalculado:=False;
end;

procedure TfrmProcVentaRapida.DBEdit11Enter(Sender: TObject);
begin
  LogProcedure('TfrmProcVentaRapida.DBEdit11Enter');
  LlenandoDatos:=True;
  entraDessGlb := True;
  if not chKDescuentoGlobal.Checked then
  chKDescuentoGlobal.Checked:= True; 
end;

procedure TfrmProcVentaRapida.Label5Click(Sender: TObject);
begin
  LogProcedure('TfrmProcVentaRapida.Label5Click');
  frmVerCalcVenta :=TfrmVerCalcVenta.Create(Nil);
  try
    frmVerCalcVenta.ShowModal;
  finally
  frmVerCalcVenta.free;
  frmVerCalcVenta:= Nil;
  end;
  Refresh;
end;


procedure TfrmProcVentaRapida.BitBtn28Click(Sender: TObject);
begin
  LogProcedure('TfrmProcVentaRapida.BitBtn28Click');
  if Assigned(frmTemporalForm) then
  frmTemporalForm.Show;
end;

procedure TfrmProcVentaRapida.ConciliarNIF1Click(Sender: TObject);
begin
  LogProcedure('TfrmProcVentaRapida.ConciliarNIF1Click');
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
  LogProcedure('TfrmProcVentaRapida.CancelarTicket1Click');
  if GlbActivaIFiscal = 0 then Exit;

  Archivo := GlbExeIFiscal;
  ShellExecute(0, 'Open', PChar(archivo), PChar(Format('/PortComm=%s /Baudrate=%s /TipoDoc=DVFN /Status=not /Cancelar=True /CierreZ=False /ImprimeZ=0 /CierreX=False',[IntToStr(GlbPuerto),IntToStr(GlbBaudRate)])), PChar(''), SW_Hide);
  
  dmCalculos.qryVentas.Close;
  dmCalculos.qryVentas.Open;
  frmCancelaVta:=TfrmCancelaVta.Create(Nil);
  try
    if frmCancelaVta.ShowModal = mrOk then
    begin
      if MessageDlg('Desea cancelar venta #'+ dmcalculos.qryVentasNUMERO.AsString,mtwarning,[mbyes, mbno],0) = mryes then
      begin
        dmcalculos.ibSQLCancelaVta.Params[0].Value:= dmCalculos.qryVentasNUMERO.Value;
        dmcalculos.ibSQLCancelaVta.ExecQuery;
        if not dmcalculos.ibSQLCancelaVta.Transaction.InTransaction then
        dmcalculos.ibSQLCancelaVta.Transaction.StartTransaction;
        try
         dmcalculos.ibSQLCancelaVta.Transaction.CommitRetaining;
        except
        dmcalculos.ibSQLCancelaVta.Transaction.RollbackRetaining;
        end;
      end;
    end;
  finally
  frmCancelaVta.free;
  frmCancelaVta:=nil;
  end;
  ProcActualizaMsg;
end;

procedure TfrmProcVentaRapida.ProcEntradaCliente;
begin
  LogProcedure('TfrmProcVentaRapida.ProcEntradaCliente');
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
    frmClientes.rncRequerido:=True;
    frmClientes.btnInsertarClick(Self);
    frmClientes.PageControl1.ActivePageIndex:=0;
    frmClientes.Showmodal;
    frmClientes.rncRequerido:=false;
    qryCliente.Close;
    qryCliente.Open;
    frmClientes.rncRequerido:=False;
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

//procedure TfrmProcVentaRapida.ImprimeDocumento(serieDoc:integer);
//begin
//end;

procedure TfrmProcVentaRapida.ProcActualizaMsg;
var
  sqlQuery : TIBQuery;
begin
  LogProcedure('TfrmProcVentaRapida.ProcActualizaMsg');
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
  //LogProcedure('TfrmProcVentaRapida.ProcGetUltNcf');
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
  //LogProcedure('TfrmProcVentaRapida.RxDBLookupCombo3Change');
  RxDBLookupCombo3.Tag:=0;
  EnProcesoCalculo:=True;
  esEditando:=True;
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
  LogProcedure('TfrmProcVentaRapida.StatusBarClick');
  ProcActualizaMsg;
  RxDBLookupCombo3Change(Self);
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
end;

procedure TfrmProcVentaRapida.ProcGetDatosDevparaNotaCR;
begin
  LogProcedure('TfrmProcVentaRapida.ProcGetDatosDevparaNotaCR');
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
      _abortar:=False;       //verificar si tiene una devolucion
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
      dmFactura.qryLookDev.close;
      dmFactura.qryLookDev.params[0].value:= dmFactura.qryVentaFacturanumero.Value;
      dmFactura.qryLookDev.Open;
      if not dmFactura.qryLookDevNUM_DOC.IsNull then
      begin
        if MessageDlg('ATENCION: Venta, ya tiene una devolución anterior, ¿Desea continuar?',mtError,[mbno, mbyes],0) = mrno then
        begin
          FreeAndNil(frmConsultaFacturas);
          exit;
        end;
      end;
      //if VerificaClave then
      if VerificaHuellas then
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
        Edit1Enter(Self);
        DBEdit10Exit(Self);
        if rxVenta.State = dsBrowse then
        rxVenta.Edit;
        DBEdit1Exit(Self);
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
  LogProcedure('TfrmProcVentaRapida.VerDetalleVenta1Click');
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
  LogProcedure('TfrmProcVentaRapida.FormClose');
  {if Assigned(frmRegServicioTaller) then
  begin
    frmRegServicioTaller.Show;
    exit;
  end;}//temporal
  if Assigned(frmVerDet) then
  begin
    FreeAndNil(frmVerDet);
  end;
  dmCalculos.qryPosExtraDet.Close;
  if (GlbNumVtaPOS > 0) then
  dmcalculos.ProcDeletePosExtraDet(GlbNumVtaPOS);
  GlbNumeroTrn:=-1;
    try
    if Assigned(frmSelNCF) then
    begin
      frmSelNCF.Free;
      frmSelNCF:=nil;
    end;
  except
  end;
    dmInventario.tblInventarioProd.Close;//dmInventario.tblInventarioProd.selectSQL.TEXT
    dmInventario.tblInventarioProd.Filtered:=False;
    dmInventario.tblInventarioProd.SelectSQL.Text := dmInventario.qryInvProd_Base.Sql.Text;
    dmInventario.tblInventarioProd.Params[0].Value:=glbCia_Key;  
end;

procedure TfrmProcVentaRapida.CheckBox1Click(Sender: TObject);
begin
  //LogProcedure('TfrmProcVentaRapida.CheckBox1Click');
  if CheckBox1.Checked then
  Label46.Font.Color:= clRed
  else Label46.Font.Color:= clBlack;
  if Totales.State = dsInactive then exit;
  if Not CheckBox1.Checked then
  begin
    if (Totales.State = dsBrowse) then
    Totales.Edit;
    TotalesTipoNCFIFiscal.AsVariant := Null;

    TotalesTipoNCF.AsVariant := Null;
    if (Totales.State In [dsEdit, dsInsert]) then
    Totales.Post;
  end;
  ProcSetBtnConduce;
end;

procedure TfrmProcVentaRapida.ProcSetBtnConduce;
begin
  //LogProcedure('TfrmProcVentaRapida.ProcSetBtnConduce');
  if checkBox1.Checked then
  begin
    if GlbActivaECF = 0 then
    GlbIgI := 0;
    BitBtn13.Font.Style:= [];
    BitBtn13.Font.Color:=clblack;
  end else
  begin
    GlbIgI := 1;
    BitBtn13.Font.Style:= [fsBold];
    BitBtn13.Font.Color:=clRed;
  end;
end;

{procedure TfrmProcVentaRapida.ReimprimirFacturaNoFiscal(numTRN : Integer);
var
  tRecordsDet : integer;
  ImpPDF, flag : boolean;

  pulgadaInc : Real;
begin
end;}

procedure TfrmProcVentaRapida.BitBtn15Click(Sender: TObject);
begin
  //LogProcedure('TfrmProcVentaRapida.BitBtn15Click');
  esContado:=False;
  ReimprimirFacturaNoFiscal(0);
end;

procedure TfrmProcVentaRapida.VerTipoComprobantes1Click(Sender: TObject);
begin
  //LogProcedure('TfrmProcVentaRapida.VerTipoComprobantes1Click');
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

procedure TfrmProcVentaRapida.tablaPropietarioAfterOpen(DataSet: TDataSet);
begin
  LogProcedure('TfrmProcVentaRapida.tablaPropietarioAfterOpen');
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
  //LogProcedure('TfrmProcVentaRapida.rxVentaAfterClose');
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
  panelTempPrecioLevels.Visible:=false; 
end;

procedure TfrmProcVentaRapida.ListarPuertosCom1Click(Sender: TObject);
begin
  LogProcedure('TfrmProcVentaRapida.ListarPuertosCom1Click');
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
  LogProcedure('TfrmProcVentaRapida.CheckPortComDisponible');
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
  //LogProcedure('TfrmProcVentaRapida.ReImprimeDevolucionsinFact1Click');
  _xflag := True;
  if UProcesarDevolucion.numeroFactura > 0 then
  ReImpDevolucion(UProcesarDevolucion.numeroFactura,_xflag);
  //ReImprimeDevolucion1Click(Self);
end;

procedure TfrmProcVentaRapida.ReImpDevolucion(numDev : Integer;var _flag : boolean);
var
  flag : Boolean;
begin
   flag:=false;
  if (rxVenta.RecordCount > 0) And (Not EsDevolucion) then
  begin
    MessageDlg('Terminar o cancelar transacción en curso.', mtInformation, [mbok], 0);
    exit;
  end;
    UImpresionVentas.ReImpDevolucion(numDev, flag);
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
    Totales.EmptyTable;
    rxPagos.EmptyTable;
    lblProcDev.Visible := False;
    UProcesarDevolucion.numeroFactura := 0;
    dmFactura.qryVentaFactura.Close;
    dmFactura.qryDatosTrncxc.Close;
    dmfactura.qryFactReimpDet.Close
end;

//Procesar Devolución Ventas Cash sin Cliente


procedure TfrmProcVentaRapida.ProcInsertarVtaMastCashEnDev(var NumTrnGen : Integer; var NumOrden : Integer);
begin
  //LogProcedure('TfrmProcVentaRapida.ProcInsertarVtaMastCashEnDev');
  if (GlbActivaIFiscal = 1 ) then Exit;
  
  if (GlbUsaFctMexico = 1) and (not TotalesFechaIniciaPoliza.IsNull) and (GLBSam =1) then
  ipStpInsertVentMast.Params[1].Value := ExtraerFecha(TotalesFechaIniciaPoliza.Value)
  else
  ipStpInsertVentMast.Params[1].Value := ExtraerFecha(GlbFechaTrnDiaria);

  //ipStpInsertVentMast.Params[1].Value:= GlbFechaTrnDiaria;
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
  if abs(TotalesMontoDescAdicional.Value) > 0 then
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
  ipStpInsertVentMast.Params[39].Value:= TotalesPropina.Value;
  ipStpInsertVentMast.Params[40].Value:= GlbPorcPropina;
  ipStpInsertVentMast.Params[41].Value:= TotalesPropinaLegal.Value;
    if not rxPreventaticket_id.IsNull then
  ipStpInsertVentMast.Params[42].Value:= rxPreventaticket_id.Value //ticket fast food limao
  else
  ipStpInsertVentMast.Params[42].Value:= null;

  if (rxCoberturaMontoCobertura.Value > 0) then
  ipStpInsertVentMast.Params[43].Value:= 1
  else
  ipStpInsertVentMast.Params[43].Value:= 0;

  ipStpInsertVentMast.Params[44].Value:= Null;
  ipStpInsertVentMast.Params[45].Value:= Null;
  if GLBSAM = 1 then
  begin
    if not TotalesFechaIniciaPoliza.IsNull then
    ipStpInsertVentMast.Params[44].Value:= TotalesFechaIniciaPoliza.AsDateTime;
    if not TotalesTipoAfiliado.IsNull then
    ipStpInsertVentMast.Params[45].Value:= TotalesTipoAfiliado.Value;
  end;   
  ipStpInsertVentMast.Params[46].Value:= TotalesidNumeroDVeh.Value;
  if Totalestipodeingreso.IsNull then
  ipStpInsertVentMast.Params[47].Value:= 1
  else
  ipStpInsertVentMast.Params[47].Value:= Totalestipodeingreso.AsInteger;


  if (GlbActivaECF = 1) and (Totalestipodeingreso.IsNull or
  (Totalestipodeingreso.Value = '0') or (Totalestipodeingreso.Value = '')) then
  ipStpInsertVentMast.Params[47].Value:=1;
  
  Try
    ipStpInsertVentMast.ExecProc; //4 devolucion
    Totales.Edit;
    TotalesVentaGuardada.Value:=1;
    Totales.Post;    
    isMasterSave:=True;
  except on E : Exception do
    begin
      Totales.Edit;
      TotalesVentaGuardada.Value := 0;
      Totales.Post;    
      if ipStpInsertVentMast.Transaction.InTransaction then
      begin
        try
        ipStpInsertVentMast.Transaction.Rollback;
        except
        end;
      end;
      MessageDlg('Error guardando en master:'+e.Message,mtError,[mbok],0);
      LogInformacionTxt('Error guardando en master, Devolución (NCR):'+e.Message);
      Exit;
    end;
  end;

  numeroTrnVta:= ipStpInsertVentMast.Params[0].Value;
  //t ProcUpdateCtrlNumVta(numeroTrnVta);
  ProcGuardarDatosCoti(numeroTrnVta);
  
  if TotalesPreAbono.Value > 0 then
  ProcActualizarStadoPrepP(tablaPropietarioCodigoPropietario.Value,numeroTrnVta);

  ProcUpdateNumDLinea(GlbNumVtaPOS,numeroTrnVta,1);
  Totales.Tag:=numeroTrnVta;
  DatosVocado(numeroTrnVta,ipStpInsertVentMast.Params[5].Value);
  if (TotalesTipoNCF.Value = '15') OR (TotalesTipoNCF.Value = '14') then
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

  ActualizaCodUsrCaja(numeroTrnVta);

  if (GlbPorcPropina > 0) then
  ActFastFoodTicket(NumTicketFFood);
  NumTrnGen:= ipStpInsertVentMast.Params[0].Value;
  ProcUpdateItbiRecargoVtaMast(ipStpInsertVentMast.Params[0].Value);
end;

procedure TfrmProcVentaRapida.InsertarDetDevolucionCash(numero: Integer);
begin
  LogProcedure('TfrmProcVentaRapida.InsertarDetDevolucionCash');
  if (dmcalculos.qryDatosItbPosExtra.Params[0].Value <> dmcalculos.qryConsultaPosExtraDetNUMERO.Value) then
  begin
    dmcalculos.qryDatosItbPosExtra.Close;
    dmcalculos.qryDatosItbPosExtra.Params[0].Value:= dmcalculos.qryConsultaPosExtraDetNUMERO.Value;
    dmcalculos.qryDatosItbPosExtra.Open;
  end;

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

  if (Abs(rxVentaMontoDescItem.Value) > 0) then
  ibStpInsertVentaDet.Params[27].Value := rxVentaMontoDescItem.Value
  else
  ibStpInsertVentaDet.Params[27].Value := rxVentaMontoDesGlobal.Value;

  ibStpInsertVentaDet.Params[28].Value := rxVentaItbi.Value;//rxVentaMontoDescuento.Value;
  ibStpInsertVentaDet.Params[29].Value := rxVentaIDTasaITBIS.Value;
  ibStpInsertVentaDet.Params[30].Value := rxVentaMontoItbisRecargo.Value;
  ibStpInsertVentaDet.Params[31].Value := rxVentaMoneda.Value;
  ibStpInsertVentaDet.Params[32].Value := rxVentamonto_tasa.Value;
  ibStpInsertVentaDet.Params[33].Value := rxVentaCantPax.Value;
  //if dmcalculos.qryDatosItbPosExtra.state = dsInactive then
  begin
    dmcalculos.qryDatosItbPosExtra.OPEN;
    dmcalculos.qryDatosItbPosExtra.Params[0].Value:= GlbNumVtaPOS;
    dmcalculos.qryDatosItbPosExtra.Open;
  end;

  if dmcalculos.qryDatosItbPosExtra.locate('serie',rxVentaserie.value,[]) then
  begin
    ibStpInsertVentaDet.Params[34].Value := dmcalculos.qryDatosItbPosExtraDC_ITBIS_CLD.Value;
    ibStpInsertVentaDet.Params[35].Value := dmcalculos.qryDatosItbPosExtraTC_MONTOITBISRECARGO_GLB.Value;
    ibStpInsertVentaDet.Params[36].Value := dmcalculos.qryDatosItbPosExtraTC_MONTOITBISRECARGO_ITM.Value;
  end else
  begin
    ibStpInsertVentaDet.Params[34].Value := 0;
    ibStpInsertVentaDet.Params[35].Value := 0;
    ibStpInsertVentaDet.Params[36].Value := 0;
  end;
  ibStpInsertVentaDet.Params[37].Value := rxVentaNUM_CONDUCE_CTE.Value;

  if GlbMutur = 1 then
  ibStpInsertVentaDet.Params[38].Value := numero
  else
  ibStpInsertVentaDet.Params[38].Value := rxVentaNUM_IDENT.Value;
  ibStpInsertVentaDet.Params[39].Value := rxVentaFICHA_VEH.Value;
  ibStpInsertVentaDet.Params[40].Value := null;//poner aqui el num_lote

  if not rxVentaGlbcodVendedor.IsNull then
  ibStpInsertVentaDet.Params[41].Value := rxVentaglbcodVendedor.Value
  else
  ibStpInsertVentaDet.Params[41].Value := GlbcodVendedor;

  ibStpInsertVentaDet.Params[42].Value := rxVentaLevelPrecio.Value;
  
  tblProductoSerie.close;
  tblProductoSerie.Params[0].Value := rxVentaSerieProd.Value;
  tblProductoSerie.Open;

  if (tblProductoSerie.RecordCount = 1) then
  begin
    tblProductoSerie.Edit;
    tblProductoSerieSTATUS.Value:='A';
    tblProductoSerieSTATUS_EQUIPO.Value :=1;
    tblProductoSerieCODIGO_CTE.AsVariant:=null;
    GlbSalvarQuery(tblProductoSerie);
  end;
  if (not rxVentaloteNum.IsNull) then
  begin
    ibstpUpdateLote.Params[0].Value:= rxVentaCodArticulo.Value;
    ibstpUpdateLote.Params[1].Value:= rxVentaloteNum.Value;
    ibstpUpdateLote.Params[2].Value:= rxVentaCant.Value*-1;
    try
    ibstpUpdateLote.ExecProc;
    if Not ibstpUpdateLote.Transaction.InTransaction then
    ibstpUpdateLote.Transaction.StartTransaction;

      ibstpUpdateLote.Transaction.CommitRetaining;
    except
    ibstpUpdateLote.Transaction.RollbackRetaining;
    end;
  end;
  ibStpInsertVentaDet.ExecProc;
  //devoluciones
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
  LogProcedure('TfrmProcVentaRapida.UpdateServINFO');
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

procedure TfrmProcVentaRapida.Alquiler1Click(Sender: TObject);
begin
  LogProcedure('TfrmProcVentaRapida.Alquiler1Click');
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
    dmInventario.tblInventarioProd.SelectSQL.Text := dmInventario.qryInvProd_Base.Sql.Text;    
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
  //LogProcedure('TfrmProcVentaRapida.RxSpinEdit1Exit');
  rxspinedit1.Color:= clWindow;
  if not esEditando then exit;
  if not Self.Visible or not isShowing then Exit;
  DBEdit2Exit(Self);
  if RestoreGridFocus then
    ProcRestaurarFocoDbgrid;

  //BitBtn27Click(Self);

  if rxVenta.State in [dsEdit, dsInsert] then
  rxVenta.Post;
  SolicitarCalculoTotales(tcrxspin); 
end;

procedure TfrmProcVentaRapida.UpdateServAlquiler(numVta: integer);
begin
  //LogProcedure('TfrmProcVentaRapida.UpdateServAlquiler');
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
          dmInventario.tblInventarioProd.SelectSQL.Text := dmInventario.qryInvProd_Base.Sql.Text;
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
           dmInventario.tblInventarioProd.SelectSQL.Text := dmInventario.qryInvProd_Base.Sql.Text;
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
  LogProcedure('TfrmProcVentaRapida.tablaPropietarioBeforePost');
  xx:=0;
end;

procedure TfrmProcVentaRapida.Lavanderia1Click(Sender: TObject);
begin
  LogProcedure('TfrmProcVentaRapida.Lavanderia1Click');
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
  LogProcedure('TfrmProcVentaRapida.LavanderiaEntrada1Click');
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
  LogProcedure('TfrmProcVentaRapida.Costura1Click');
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
  LogProcedure('TfrmProcVentaRapida.CosturaEntrada1Click');
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
  LogProcedure('TfrmProcVentaRapida.BitBtn29Click');
  BitBtn9Click(Self);
end;

procedure TfrmProcVentaRapida.btnPagoExactoClick(Sender: TObject);
begin
  //LogProcedure('TfrmProcVentaRapida.btnPagoExactoClick');
  EsPagoExacto:=True;
  if (rxVenta.recordcount = 0) then exit;
  if not ValidaSubTotal then
  begin
    Raise Exception.Create('Favor verificar cálculos.');
    exit;
  end;

  if (Totalestotalneto.Value > 0) then
  begin
    Edit1.Text:=Format('%8.2f', [Totalestotalneto.Value]);
    Edit1Exit(Self);
    EsPagoExacto:=True;
  end;
end;


procedure TfrmProcVentaRapida.DBEdit10Change(Sender: TObject);
begin
  if EnProcesoCalculo then
    Exit;

  if LlenandoDatos then
    Exit;

  LogProcedure('TfrmProcVentaRapida.DBEdit10Change');

  dmCalculos.esFeedback := False;
  GlbAlreadyCld := False;
  GlbCalculado := False;
  procCalc := True;
  //CalculoPendiente := True;
end;

procedure TfrmProcVentaRapida.chkNoLeyPropinaClick(Sender: TObject);
begin
  //LogProcedure('TfrmProcVentaRapida.chkNoLeyPropinaClick');
  //if chkNoLeyPropina.Checked then
  //begin
   GlbCalculado:=False;
  //t BitBtn27Click(Self);
  //t if not GlbCalculado then
  //t CalcularTotalesInterno;
  //end;
end;

procedure TfrmProcVentaRapida.NotificaErrorByEmail(sms:string);
var
   c,t,rnc,email:string;
begin
  LogProcedure('TfrmProcVentaRapida.NotificaErrorByEmail');
  dmCompania.qryEmailProceso.Close;
  dmCompania.qryEmailProceso.Open;
  c:='';t:='';rnc:='';email:='';
  if not dmCompania.tblCompaniaCIUDAD.IsNull then
  c:=dmCompania.tblCompaniaCIUDAD.AsString;
  if not dmCompania.tblCompaniaTELEFONO.IsNull then
  t:= dmCompania.tblCompaniaTELEFONO.Value;
  if not dmCompania.tblCompaniaRNC_NUMERO.IsNull then
  rnc:= dmCompania.tblCompaniaRNC_NUMERO.Value;
  if dmCompania.tblCompaniaEMAIL.IsNull then
  email:= dmCompania.tblCompaniaEMAIL.Value;

  if dmCompania.qryEmailProceso.Locate('IDTIPO',900,[]) then
  begin
    ProcLogTrackingEmailAviso(900,dmCompania.qryEmailProcesoEMAIL_SERVER.Value,
    dmCompania.qryEmailProcesoPORT.AsString,dmCompania.qryEmailProcesoUSER_EMAIL.Value,
    Desencriptar(dmCompania.qryEmailProcesoUSER_PASSWORD.Value,2005),
    Now,'divison@gmail.com',dmCompania.qryEmailProcesoFROMEMAIL.Value,
    dmCompania.qryEmailProcesoSUBJECT.Value+' -CIA:'+
    dmCompania.tblCompaniaNOMBRE.Value + CR+LF + 'Sucursal : ' + c + ' ' + FormatDateTime('dd/mm/yyyy hh:mm a/p', Now),
    CR+LF +'Telef: ' + t +
    CR+LF+ 'RNC: ' + rnc +
    'Email: ' + email + CR+LF +
    sms + CR+LF,
    {dmCompania.tblCompaniaNOMBRE.Value+
    ''#13#10'Sucursal : '+c+' '+FormatDateTime('dd/mm/yyyy hh:mm a/p',now),
    '#13#10''Telef:'+t+
    '#13#10''RNC:'+rnc+
    'Email: '+email + ''#13#10''+
    sms+ ''#13#10'',
    }
    //xVersion + ''#13'Cantidad de veces de uso disponible: '+IntToStr(qtyCorr),
  VarUsuarioGlb,'A','', Now, StrUserName, FormatDateTime('dd/mm/yyyy hh:mm a/p', Now),StrUserName,'',
  dmCompania.tblCompaniaNOMBRE.Value);
  end;
end;

procedure TfrmProcVentaRapida.ActFastFoodTicket(numTicket:Integer);
begin
  LogProcedure('TfrmProcVentaRapida.ActFastFoodTicket');
  if (Not GLBEsFastFood) then Exit;
  if (numTicket <= 0) then Exit;
  dmFastfood.tblAdoTicketUpdate.Close;
  dmFastfood.tblAdoTicketUpdate.Parameters[0].Value:= numTicket;
  dmFastfood.tblAdoTicketUpdate.Open;
  //dmFastfood.tblAdoTicketUpdate.First;
  if (dmFastfood.tblAdoTicketUpdateTicket_ID.Value = numTicket) then
  begin
    dmFastfood.tblAdoTicketUpdate.Edit;
    dmFastfood.tblAdoTicketUpdateProcessFiscalYN.Value:='Y';
  dmFastfood.tblAdoTicketUpdate.Post;
  end;
  dmFastfood.tblAdoTicketUpdate.Close;
  dmFastfood.tblAdoTicketUpdate.Parameters[0].Value:= numTicket;
  dmFastfood.tblAdoTicketUpdate.Open;
  if (dmFastfood.tblAdoTicketUpdateTicket_ID.Value = numTicket) then
  begin
    if (uppercase(dmFastfood.tblAdoTicketUpdateProcessFiscalYN.Value) <> 'Y') then
    begin
      dmFastfood.tblAdoTicketUpdate.Edit;
      dmFastfood.tblAdoTicketUpdateProcessFiscalYN.Value:='Y';
      dmFastfood.tblAdoTicketUpdate.Post;
    end;
  end;
end;

procedure TfrmProcVentaRapida.AbrirDatosParaTicket(
          CheckBox1_Checked:Boolean;
          rdgCredito_Checked:boolean;
          edtCodCte_Text:String;
          EditN1_ValueInteger:integer;
          DateTimePicker1_Date:TDateTime
          );
begin
  //LogProcedure('TfrmProcVentaRapida.AbrirDatosParaTicket');

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
      dmFactura.qryVentaFactura.Open;
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
        dmFactura.qryVentaFactura.Open;
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
        dmFactura.qryVentaFactura.Open;//dmFactura.qryVentaFactura.sql.text
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
      dmFactura.qryVentaFactura.Open;
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
      dmFactura.qryVentaFactura.Open;
    end;
  end;

end;

procedure TfrmProcVentaRapida.AbrirUnidades;
begin
  //LogProcedure('TfrmProcVentaRapida.AbrirUnidades');
  dmInventario.qryTipoUnidad.Close;
  if GlbUsaPUnidadLevel = 1 then
  begin
    dmInventario.qryTipoUnidad.Params[0].Value:=2
  end else
  dmInventario.qryTipoUnidad.Params[0].Value  :=1;
  dmInventario.qryTipoUnidad.Open;
  if (dmInventario.qryTipoUnidad.Params[0].Value = 2) then
  begin
    dmInventario.qryTipoUnidad.last;
    if (dmInventario.qryTipoUnidad.RecordCount = 0) then
    begin
      MessageDlg('No has configurado los precios por unidad, verifique.', mtWarning, [mbOk], 0);
    end;
  end;
end;

procedure TfrmProcVentaRapida.rxdblookupTipoUnidadChange(Sender: TObject);
var
  xFlag : boolean;
begin
  LogProcedure('TfrmProcVentaRapida.rxdblookupTipoUnidadChange');
  if EnProcesoCalculo then
     Exit;

  if LlenandoDatos then
     Exit;

  procCalc  := True;
  esEditando:= True;
  GlbCalculado:=False;
  CalculoPendiente := True;

  frmLogError.LogMarca(GlbNumVtaPOS,rxVentaSerie.Value,now,now,'OnChangeUnit',1);
  if (rxdblookupTipoUnidad.Tag < 0) and
  (rxVenta.State = dsInsert) then exit
  else
  rxdblookupTipoUnidad.Tag:=0;
  GlbTipoUnidad := dmVentas.qryPrecioUnidadSurtIDUNIDAD.Value;
  CantUnidad:= dmVentas.qryPrecioUnidadSurtCANTIDAD.Value;

  if ((rxVentaCant.Value * CantUnidad) > qryProductosCANTIDAD.Value) And (GlbPermiteVentaInv0 = 0) then
  begin
    if (not GlbFactRecurrente) then
    begin
      MessageDlg('Cantidad venta es mayor que existencia inventario.', mtWarning, [mbOk], 0);
      if rxVenta.State in [dsEdit, dsInsert] then
      rxVenta.Cancel;
    end;
    if isShowing then
    edtCodigo.Setfocus;
  end;

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
  LogProcedure('TfrmProcVentaRapida.rxdblookupTipoUnidadEnter');
  rxdblookupTipoUnidad.Color:= clYellow;
  LogInfoLoop('TfrmProcVentaRapida.rxdblookupTipoUnidadEnter(');
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
  panel2.Height:=87;
  panel2.Visible := False;
  if glbUsaescalaPrecio = 0 then
  panelTempPrecioLevels.Visible:= False;
  dmVentas.qryPrecioUnidadSurt.first;
  if dmVentas.qryPrecioUnidadSurt.recordCount > 0 then
  ProcActTipoUnidad else
  begin
    rxdblookupTipoUnidad.SendToBack;
    rxdblookupTipoUnidad.Visible:=False;
    cboxTipoUnidad.Visible:=True;
    cboxTipoUnidad.BringToFront;
    cboxTipoUnidad.Enabled:=True;
    cboxTipoUnidad.Text:='UNIDAD';
  end;
end;

procedure TfrmProcVentaRapida.ProcMostrarVersion;
var
  VInfo: TVersionInfo;
  FAppVer, FAppBuild : String;
begin
  LogProcedure('TfrmProcVentaRapida.ProcMostrarVersion');
  if (GlbActivaIFiscal = 0) and (GlbActivaECF = 0) then
  begin
    Version.Caption:='';
    exit;
  end;
  VInfo := TVersionInfo.Create(ParamStr(0));
  try
    FAppVer := VInfo.FileVersion;
    if trim(FAppVer)='' then FAppVer := '?.?';

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
  LogProcedure('TfrmProcVentaRapida.BuscarRNCDGII1Click');
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
          dmClientes.tblClientes.Append;
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
          rxdbLookupCteChange(Self);
        end;
      end;
    end;
  finally
  frmBuscarRNC.Free;
  frmBuscarRNC:=Nil;
  end;
end;

procedure TfrmProcVentaRapida.DetallePosExtra1Click(Sender: TObject);
begin
  LogProcedure('TfrmProcVentaRapida.DetallePosExtra1Click');
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
  //LogProcedure('TfrmProcVentaRapida.rxVentaAfterInsert');
  
  if tablaPropietarioCodigoPropietario.IsNull then
  begin
    if tablaPropietario.State = dsBrowse then
    tablaPropietario.Edit;
    tablaPropietarioCodigoPropietario.Value:=0;
  end;
  dmCalculos.avoidLoopExtra:=False;
  if (GlbMonedaBase > 0) then
  rxVentaMoneda.Value   := IntToStr(GlbMonedaBase)
  else
  rxVentaMoneda.Value   := '1';

  if glbMutur = 1 then
  begin
    if TotalesidNumeroDVeh.IsNull or (TotalesidNumeroDVeh.Value = 0) then
    begin
      dmvehiculo.qryEsVeh.Close;
      dmvehiculo.qryEsVeh.Params[0].value:= qryProductoscodigo.Value;
      dmvehiculo.qryEsVeh.Open;
      if (dmvehiculo.qryEsVeh.RecordCount > 0) then
      btnAsignarVehClick(Self);
    end;
  end;

  if (not rxVentaLevelPrecio.IsNull and (RxSpinEdit1.Value <> rxVentaLevelPrecio.Value)) then
  begin
    FUpdating:=False;
    RxSpinEdit1.Value:= rxVentaLevelPrecio.Value;
  end;
  if not procCalc then exit;
  if GlbNumVtaPOS > 0 then
  if dmCalculos.qryConsultaPosExtraDet.Tag = 0 then
  begin
    frmLogError.CurrenLN:= 18762;
      if GlbCalculado then
      dmCalculos.Pos_UpdateTotales(GlbNumVtaPOS);
  end;
  if rxVenta.State = dsBrowse then
  if Not rxVentaSerie.IsNull then
  if not rxVenta.BOF then
  rxVenta.Last;
end;

procedure TfrmProcVentaRapida.TotalesAfterPost(DataSet: TDataSet);
begin
  MostrarTasa;
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
  //LogProcedure('TfrmProcVentaRapida.ProcChequeaOtrasVtasCte');
  if Totalestotalneto.Value > 0 then exit;
  if BitBtn13.Visible then
  begin
    qryCteTieneVta.Close;
    qryCteTieneVta.Params[0].Value:= tablaPropietarioCodigoPropietario.AsInteger;
    qryCteTieneVta.Params[1].Value:= ExtraerFecha(rxVentaFecha.Value);
    qryCteTieneVta.Open;
    qryCteTieneVta.First;
    if (qryCteTieneVta.RecordCount >= 1) then
    begin
      while Not qryCteTieneVta.Eof do
      begin
        if (qryCteTieneVtaVALOR_TOTAL_DET.Value = Totalestotalneto.Value) then
        begin
          lblAvisoCte.Visible:=True;
        end;
        qryCteTieneVta.Next;
      end;
    end;
  end;
end;
procedure TfrmProcVentaRapida.rxVentaBeforeDelete(DataSet: TDataSet);
begin
  //LogProcedure('TfrmProcVentaRapida.rxVentaBeforeDelete');
  dmcalculos.ProcDelRecPosExtraDet(rxVentaSerie.Value);
end;


procedure TfrmProcVentaRapida.TotalesBeforePost(DataSet: TDataSet);
begin
  if rxVenta.State = dsInactive then exit;
  //LogProcedure('TfrmProcVentaRapida.TotalesBeforePost');
  //if rxVentaserie.IsNull then exit;
  if TotalesTipoNCFIFiscal.IsNull then
  TotalesTipoNCFIFiscal.Value:= 0;

  if glbActivaECf = 1 then
  begin
    if Totalestipodeingreso.IsNull then
    TotalesTipoDeIngreso.Value:='01';
  end;
  if TotalesTipoNCF.IsNull or (TotalesTipoNCF.Value = '') then
  begin
    if GlbActivaECF = 1 then
    TotalesTipoNCF.Value:='02' //Consumidor Final
    else TotalesTipoNCF.Value:='32';
  end;
  if Abs(TotalesMontoExoneraITBIS.Value) > 0 then
  if Abs(TotalesMontoExoneraITBIS.Value) > Abs(TotalesItbis.Value) then
  TotalesMontoExoneraITBIS.Value:=TotalesItbis.Value;
end;

procedure TfrmProcVentaRapida.rxVentaAfterEdit(DataSet: TDataSet);
begin
  //LogProcedure('TfrmProcVentaRapida.rxVentaAfterEdit');
  procCalc:=True;
  CalcYaEjecutado:=False;
  esEditando:= true;
  dmCalculos.datCambio :=esEditando;
end;

procedure TfrmProcVentaRapida.ProcItbisExonerado;
var
  xpos : integer;
begin
//  LogProcedure('TfrmProcVentaRapida.ProcItbisExonerado');
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
  //LogProcedure('TfrmProcVentaRapida.rxVentaAfterDelete');
  GlbCalculado:=False;
  dmCalculos.avoidLoopExtra:=False;
  dmCalculos.Pos_UpdateTotales(GlbNumVtaPOS);
end;

procedure TfrmProcVentaRapida.chkNoLeyPropinaExit(Sender: TObject);
begin
  //LogProcedure('TfrmProcVentaRapida.chkNoLeyPropinaExit');
  ProcItbisExonerado;
end;

procedure TfrmProcVentaRapida.ProcInsFiscalCtrl(ntrn: integer;vtaFecha:TDateTime;var trnExiste:Boolean);
begin
  //LogProcedure('TfrmProcVentaRapida.ProcInsFiscalCtrl');
  trnExiste := False;
  GlbImprimiendo:=False;
  dmFactura.tblFiscalStatusTicket.Close;
  dmFactura.tblFiscalStatusTicket.Params[0].Value:=ntrn;
  dmFactura.tblFiscalStatusTicket.Open;
  if (dmFactura.tblFiscalStatusTicket.RecordCount = 0) then
  begin
    dmFactura.tblFiscalStatusTicket.Append;
    dmFactura.tblFiscalStatusTicketNUMERO_TRN.Value:=ntrn;
    dmFactura.tblFiscalStatusTicketFECHA.Value:= ExtraerFecha(vtaFecha);
    dmFactura.tblFiscalStatusTicketACTIVO.Value:=0; //inicia
    GlbSalvarQuery(dmFactura.tblFiscalStatusTicket);
  end else
  if dmFactura.tblFiscalStatusTicketIMPRIMIENDO.Value = 1 then
  begin
    trnExiste := True;
    GlbImprimiendo :=True;
  end;
  //Totales.Tag
end;


procedure TfrmProcVentaRapida.ProcReImpDocFiscal(ntrn: integer;vtaFecha:TDateTime);
begin
  //LogProcedure('TfrmProcVentaRapida.ProcReImpDocFiscal');
  GlbImprimiendo := False;
  dmcotizafiscal.tblctrlImpNVtaFiscal.Close;
  dmcotizafiscal.tblctrlImpNVtaFiscal.Params[0].Value:= ntrn;
  dmcotizafiscal.tblctrlImpNVtaFiscal.Open;
  dmcotizafiscal.tblctrlImpNVtaFiscal.Last;
  if dmcotizafiscal.tblctrlImpNVtaFiscal.RecordCount = 0 then
  begin
    dmcotizafiscal.tblctrlImpNVtaFiscal.Append;
    dmcotizafiscal.tblctrlImpNVtaFiscalNUMERO_TRN.Value := ntrn;
    dmcotizafiscal.tblctrlImpNVtaFiscalFECHA.Value      := ExtraerFecha(vtaFecha);
    GlbSalvarQuery(dmcotizafiscal.tblctrlImpNVtaFiscal);
  end else
  begin
    if dmcotizafiscal.tblctrlImpNVtaFiscalIMPRIMIENDO.Value = 1 then
    begin
      GlbImprimiendo := True;
    end;
  end;
end;

procedure TfrmProcVentaRapida.ProvVerDatosDescGlb;
begin
  //LogProcedure('TfrmProcVentaRapida.ProvVerDatosDescGlb');
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
  //LogProcedure('TfrmProcVentaRapida.SetPrecioPorCantidadMay');
  LogInfoLoop('TfrmProcVentaRapida.SetPrecioPorCantidadMay');
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
           begin
             rxVentaPrecio.Value := dmVentas.qryPrecioUnidadSurtPRECIOVENTA1.Value;
             rxVentaLevelPrecio.Value:=1;
           end;
         end;
      2: begin
          if dmVentas.qryPrecioUnidadSurtPRECIOVENTA2.Value > 0 then
          begin
            rxVentaPrecio.Value := dmVentas.qryPrecioUnidadSurtPRECIOVENTA2.Value;
            rxVentaLevelPrecio.Value:=2;
          end;
         end;
      3:begin
          if dmVentas.qryPrecioUnidadSurtPRECIOVENTA3.Value > 0 then
          begin
            rxVentaPrecio.Value := dmVentas.qryPrecioUnidadSurtPRECIOVENTA3.Value;
            rxVentaLevelPrecio.Value:=3;
          end;
        end;
      4: begin
           if dmVentas.qryPrecioUnidadSurtPRECIOVENTA4.Value > 0 then
           begin
             rxVentaPrecio.Value := dmVentas.qryPrecioUnidadSurtPRECIOVENTA4.Value;
             rxVentaLevelPrecio.Value:=4;
           end;
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
         begin
           rxVentaPrecio.Value := QryPreciosPRECIOVENTA1.Value;
           rxVentaLevelPrecio.Value:=1;
         end;
       end;
    2: begin
        if QryPreciosPRECIOVENTA2.Value > 0 then
        begin
          rxVentaPrecio.Value := QryPreciosPRECIOVENTA2.Value;
          rxVentaLevelPrecio.Value:=2;
        end;
       end;
    3:begin
        if QryPreciosPRECIOVENTA3.Value > 0 then
        begin
          rxVentaPrecio.Value := QryPreciosPRECIOVENTA3.Value;
          rxVentaLevelPrecio.Value:=3;
        end;
      end;
    4: begin
         if QryPreciosPRECIOVENTA4.Value > 0 then
         begin
           rxVentaPrecio.Value := QryPreciosPRECIOVENTA4.Value;
           rxVentaLevelPrecio.Value:=4;
         end;
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
  rxdblookupTipoUnidad.Color:= clWindow;
  if not Self.Visible or not isShowing then Exit;
  //LogProcedure('TfrmProcVentaRapida.rxdblookupTipoUnidadExit');
  rxdblookupTipoUnidad.Tag:=0;
  if rxVenta.Modified then
  begin
    //GlbCalculado := False;
    //DiferirCalculoTotales;
    if rxVenta.State in [dsEdit, dsInsert] then
    rxVenta.Post;
    if DatosModificados then
    SolicitarCalculoTotales(tcUnidad);
  end;
end;

procedure TfrmProcVentaRapida.rxVentaAfterOpen(DataSet: TDataSet);
begin
  //LogProcedure('TfrmProcVentaRapida.rxVentaAfterOpen');
  lblTotalItem.Caption:='Total Items:'+IntToStr(0);
  rxBckVta.Close;
  rxBckVta.Open;
end;

procedure TfrmProcVentaRapida.CerrarPuertoImpF;
begin
  //LogProcedure('TfrmProcVentaRapida.CerrarPuertoImpF');
  if (GlbActivaIFiscal = 0 ) then exit;
  if GlbImprimiendo then Exit;
  try
    if GlbPuerto = 4 then
    begin
      FiscalPrinter.CommPort:= $00000003;
    end;
    if GlbBaudRate = 9600 then
    FiscalPrinter.BaudRate:= $00000003;

    CerrarPuerto;
    except
  end;
end;

procedure TfrmProcVentaRapida.DBEdit12Change(Sender: TObject);
begin
  if EnProcesoCalculo or LlenandoDatos then Exit;
  DatosModificados := True;
  esEditando:=True;
  procCalc := True;
end;

procedure TfrmProcVentaRapida.ProcModFactCantXUnidad(_codProd:integer;_idUnidad:integer);
var
  xflag:boolean;
begin
  //LogProcedure('TfrmProcVentaRapida.ProcModFactCantXUnidad');

  xflag:=False;

  dmVentas.qryPrecioUnidadSurt.Close;
  dmVentas.qryPrecioUnidadSurt.Params[0].Value:=_codProd;
  dmVentas.qryPrecioUnidadSurt.Open;
  if (dmInventario.qryTipoUnidad.State = dsInactive) then
  AbrirUnidades;

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
    DSQryPrecios.DataSet := dmVentas.qryPrecioUnidadSurt;
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

procedure TfrmProcVentaRapida.BitBtn13Click(Sender: TObject);
var
  fSalir : boolean;
begin
  LogProcedure('TfrmProcVentaRapida.BitBtn13Click');
  {
  if (GLBNumConduceCte = 1) and (rxVenta.RecordCount > 0) then
  begin
    frmDatosAdicConduce:=TfrmDatosAdicConduce.Create(nil);
    try
      frmDatosAdicConduce.Showmodal;
    finally
    frmDatosAdicConduce.free;
    frmDatosAdicConduce:=nil;
    end;
    exit;
  end;
  }
  fSalir:=False;
  if EsModificandoFactura and not reimpConduce then
  begin
    MessageDlg('No puede usar esta opción modificando transacción.',mtInformation,[mbok],0);
    exit;
  end;

  if not reimpConduce and (tablaPropietarioCodigoPropietario.IsNull or (tablaPropietarioCodigoPropietario.Value = 0)) then
  begin
    MessageDlg('Favor indicar cliente.',mtInformation,[mbok],0);
    Exit;
  end;
  reimpConduce:=True;
  if BitBtn13.Visible and not reimpConduce then
  begin
    qryCteTieneVta.Close;
    qryCteTieneVta.Params[0].Value:= tablaPropietarioCodigoPropietario.AsInteger;
    qryCteTieneVta.Params[1].Value:= ExtraerFecha(rxVentaFecha.Value);
    qryCteTieneVta.Open;
    qryCteTieneVta.First;
    if (qryCteTieneVta.RecordCount >= 1) then
    begin
      while Not qryCteTieneVta.Eof do
      begin
        if (qryCteTieneVtaVALOR_TOTAL_DET.Value = Totalestotalneto.Value) then
        begin
          if MessageDlg('Cliente tiene otra venta con el mismo valor, desea continuar?',mtWarning,[mbYes,mbNo],0) = mrNo then
          begin
            fSalir := true;
            break;
          end;
        end;
        qryCteTieneVta.Next;
      end;
      if fSalir then exit;
    end;
  end;
  if not ValidaSubTotal then exit;

  frmFormaPagoVRep:=TfrmFormaPagoVRep.Create(Nil);
  try
    dmfactura.qryVentaFactura.close;
    frmFormaPagoVRep.setEfectivo := 1;
    frmFormaPagoVRep.soloEfeYCred:= 1;

    if (Totalestotalneto.Value > 0) then
    begin
      if (Edit1.Text = '') then
      Edit1.Text:= Format('%8.2f', [Totalestotalneto.Value]);
      if Totales.State = dsBrowse then
      Totales.Edit;
      Totalesmontorecibido.AsString := Edit1.Text;
      Totalesdevolucion.Value :=0;
      Totales.Post;
    end;

    if rxVenta.RecordCount = 0 then
    begin
      GlbEsCopia:=True;
      EsConduce := True;
      fSalir:=False;
      GlbEsCopia:=True;
      ImprimirVentaRepuestoConduce;
    end else
    if frmFormaPagoVRep.ShowModal = mrOk then
    begin
      EsConduce := True;

      if frmFormaPagoVRep.codigo_fpago = 7 then
      begin
        fSalir:=False;
        if (Totalesitbis.Value > 0) then
        begin
          if MessageDlg('Factura tiene itbis, continuar generando conduce?',mtwarning,[mbyes, mbno],0) = mrNo then
          fSalir:=true;
        end;
        if not fSalir then
        begin
          if rxVenta.RecordCount = 0 then
          begin
            GlbEsCopia:=True;
            BitBtn15Click(Self);
          end else
          BitBtn6Click(Self);
        end;
      end else
      if frmFormaPagoVRep.codigo_fpago = 1 then
      begin
        if rxVenta.RecordCount > 0 then
        begin
          GlbEsCopia := False;
          BitBtn4Click(Self);
        end else
        begin
          GlbEsCopia:=True;
          ImprimirVentaRepuestoConduce;
        end;
      end;
    end;
  finally
  frmFormaPagoVRep.Free;
  frmFormaPagoVRep:=Nil;
  end;
  reimpConduce:=False;
  //EsConduce:=False;
end;
//FORMAREPUESTO

procedure TfrmProcVentaRapida.BitBtn31Click(Sender: TObject);
begin
  LogProcedure('TfrmProcVentaRapida.BitBtn31Click');
  GlbEsPrecuenta := True;
  BitBtn8Click(Self);
end;

procedure TfrmProcVentaRapida.ProcUpdateNumDLinea(numPos:integer; numeroTrnVta:integer; tipo:Smallint);
begin
  LogProcedure('TfrmProcVentaRapida.ProcUpdateNumDLinea');
  if tipo = 2 then
  begin
    dmVentas.tblLineaComentario.Close;
    dmVentas.tblLineaComentario.Params[0].Value:= numPOS;
    dmVentas.tblLineaComentario.Open;
    dmVentas.tblLineaComentario.First;
    While Not dmVentas.tblLineaComentario.Eof do
    begin
      dmVentas.tblLineaComentario.Edit;
      dmVentas.tblLineaComentarioNUMERO_TRN.Value:=numeroTrnVta;
      dmVentas.tblLineaComentariotipo_ope.Value:= tipo;
      GlbSalvarQuery(dmVentas.tblLineaComentario);
      dmVentas.tblLineaComentario.Next;
    end;
    Exit;
  end;
  dmVentas.tblLineaComentario.Close;
  dmVentas.tblLineaComentario.Params[0].Value:= numPOS;
  dmVentas.tblLineaComentario.Open;
  dmVentas.tblLineaComentario.First;
  While Not dmVentas.tblLineaComentario.Eof do
  begin
    dmVentas.tblLineaComentario.Edit;
    dmVentas.tblLineaComentarioNUMERO_TRN.Value:=numeroTrnVta;
    dmVentas.tblLineaComentariotipo_ope.Value:= tipo;
    GlbSalvarQuery(dmVentas.tblLineaComentario);
    dmVentas.tblLineaComentario.Next;
  end;
end;

procedure TfrmProcVentaRapida.Log1Click(Sender: TObject);
begin
  LogProcedure('TfrmProcVentaRapida.Log1Click');
  if Assigned(frmLogError) then
  frmLogError.show else
  begin
    frmLogError:=TfrmLogError.Create(nil);
    frmLogError.show;
  end;
end;

procedure TfrmProcVentaRapida.DesactivarSkin1Click(Sender: TObject);
begin
  LogProcedure('TfrmProcVentaRapida.DesactivarSkin1Click');
  //SkinData1.Active:= not SkinData1.Active;
end;

procedure TfrmProcVentaRapida.ImprimirVentaRepuestoConduce;
var
  tRecordsDet : Integer;
  pulgadaInc : Real;
  flag : boolean;
  cRc : Integer;
begin
  LogProcedure('TfrmProcVentaRapida.ImprimirVentaRepuestoConduce');
  dmCompania.tblCompania.Close;
  dmCompania.tblCompania.Open;
  dmCompania.tblCompania.Locate('codigo', glbCia_Key, []);
  dmfactura.qryFactReimpMaster.close;
  dmfactura.qryVentaFactura.Close;
  dmreportes.qryViewVentasMast.Close;

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

    dmfactura.qryVtaConDeliveryTrn.Close;
    dmfactura.qryVtaConDeliveryTrn.Params[0].Value:= dmFactura.qryVentaFacturaNUMERO.Value;
    dmfactura.qryVtaConDeliveryTrn.Open;

    dmReportes.qryViewVentasMast.Close;
    dmReportes.qryViewVentasMast.Params[0].Value:=dmFactura.qryVentaFacturaNUMERO.Value;
    dmReportes.qryViewVentasMast.Open;

    ProcSetPathlogoTipoServicio(dmReportes.qryViewVentasMastTIPO_AFILIADO.Value);

    dmfactura.qryFactReimpMaster.Close;
    dmfactura.qryFactReimpMaster.Params[0].Value := -1;
    dmfactura.qryFactReimpMaster.Params[0].Value := NumeroTrn;
    dmfactura.qryFactReimpDet.Close;
    dmfactura.qryFactReimpDet.Params[0].Value := dmfactura.qryFactReimpMaster.Params[0].Value;
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

    qryCtes.Close;
    qryCtes.Open;
    if qryCtes.Locate('CODIGO_CTE', dmfactura.qryFactReimpMasterCODIGO_CTE.Value,[]) then
    glbcodVendedor:=qryCtesCOD_VENDEDOR.Value
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
  //if (UpperCase(GLBFormatoFactura) = 'FORMAFACOCO') then
  //begin
    if (TipoVenta = 'CONTADO') then
    ImprimirFacturaRepuestoConduce(dmfactura.qryVentaFacturaNUMERO.Value)
    else
  UImpresionVentas.ImprimirFacturaRepuesto(dmfactura.qryVentaFacturaNUMERO.Value)
  //end;
end;

procedure TfrmProcVentaRapida.BitBtn32Click(Sender: TObject);
begin
  LogProcedure('TfrmProcVentaRapida.BitBtn32Click');
  dmCalculos.qryPosExtraDet.Close;
  dmCalculos.qryPosExtraDet.Params[0].Value:= GlbNumVtaPOS;;
  dmCalculos.qryPosExtraDet.Open;
  DetallePosExtra1Click(Self);
end;

procedure TfrmProcVentaRapida.edtCodigoChange(Sender: TObject);
begin
  //LogProcedure('TfrmProcVentaRapida.edtCodigoChange');
  //GlbCalculado
  if qryVence.State = dsInactive then
  begin
    qryVence.Close;
    qryVence.Open
  end;
  EnProcesoCalculo:=True;

  if rxVenta.State = dsBrowse then  if Not rxVentaSerie.IsNull then
  if not rxVenta.BOF then
  rxVenta.Last;
  procCalc := True;
  rxLabelVence.Visible:= False;
  if LectorCodBarra1.Checked then Exit;
  BuscandoPorDesc:=False;
  if (dmInventario.qryTipoUnidad.State = dsInactive) then
  AbrirUnidades;
  LogInfoLoop('TfrmProcVentaRapida.edtCodigoChange');
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
      panelTempPrecioLevels.Visible:=true;
      qryProdPorProveedor.Close; //qryProductosCodigo.value
      qryProdPorProveedor.Params[0].Value:= qryProductosCODIGO.Value;
      qryProdPorProveedor.Params[1].Value:= glbCia_Key;
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
      //RxDBGrid2.Align:= alClient;
      try
      panel2.Visible := True;
      panelTempPrecioLevels.Visible:= True;
      panel2.Height:=170;

      panel2.BringToFront;
      except
      LogInformacionTxt('Error');
      end;
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
      panelTempPrecioLevels.Visible:=true;
      qryProdPorProveedor.Close;
      qryProdPorProveedor.Params[0].Value:= qryProductosCODIGO.Value;
      qryProdPorProveedor.Params[1].Value:= glbCia_Key;
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
      //RxDBGrid2.Align:= alClient;
      try
      panel2.Visible := True;
      panelTempPrecioLevels.Visible:= True;
      panel2.BringToFront;
      panel2.Height:=170;
      except
      LogInformacionTxt('Error');
      end;
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
  var
  guardarRec : TBookMark;
begin
  if (rxVentaMontoNeto.value = 0) and (rxVentaPrecio.value > 0) then
  begin
    EnProcesoCalculo:=False;
    dmCalculos.ProcesaCalculos;
  end;                             
  rxVenta.EnableControls;
  Totales.EnableControls;
  if imbBarcode.Visible and (rxVenta.State in [dsEdit, dsInsert]) then
  begin
    if not rxVentaMontoBruto.IsNull
    and not rxVentaCant.IsNull
    and not rxVentaPrecio.IsNull then
    begin
      //ToDO
    end;
  end;

  if (Totales.State = dsInactive) then
  begin
    Totales.Close;
    Totales.Open;
  end;
  //LogProcedure('TfrmProcVentaRapida.edtCodigoEnter');
  IF qryCliente.State = dsInactive then
  qryCliente.Open;
  {DEBUG try
    if label53.Visible then
    t:= SecondsBetween(StrToDateTime(label52.Caption),StrToDateTime(label51.Caption));
    label53.Caption:=IntToStr(t);
  except
  end;  }
  //sender.ClassName
  if (rxVenta.RecordCount > 0) and (abs(rxVentaCant.Value) > 0)
  and (rxVentaMontoNeto.Value = 0) then
  begin
    EsEditando:=True; rxVentaSerie.value;
    DBEdit2Exit(Self);
  end;
  EsEditando:=False;
  EntManual:=True;
  panel2.Height:=87;
  panel2.Visible:=False;
  if glbUsaescalaPrecio = 0 then
  panelTempPrecioLevels.Visible:= False;
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
  if (GlbActivaIFiscal = 1 ) then
  begin
    ProcesaEstadoImpresora(numeroTrnVta);
    if (GlbIFiscalError <> '') and  (Pos('Ready',GlbIFiscalError) < 0) then
    MessageDlg(GlbIFiscalError, mtInformation, [mbOk], 0)
    else
    if GLBIFiscalBusy Or Not GLBIFiscalOnline then
    begin
      if GlbActivaIFiscal = 1 then
      Delay(1000);
    end;
  end;

  dmCalculos.esFeedback := True;
  panel2.Visible := False;
  if glbUsaescalaPrecio = 0 then
  panelTempPrecioLevels.Visible:= False;
  panel2.Height:=87;
  panel2.SendToBack;
  edtCodigo.Enabled:=True;
  edtCodigo.Color  :=clWindow;

end;

procedure TfrmProcVentaRapida.edtCodigoExit(Sender: TObject);
var
  numero : Integer;
  FExiste : Boolean;
begin
  //LogProcedure('TfrmProcVentaRapida.edtCodigoExit');
  if qryVence.State = dsInactive then
  begin
    qryVence.Close;
    qryVence.Open
  end;  
  if Totales.State = dsInactive then
  Totales.Open;
  if tbltipoDeIngresos.State = dsInactive then
  tbltipoDeIngresos.Open;
  if rxVenta.RecordCount > 0 then
  lblTotalItem.Caption:='Total Items:'+IntToStr(rxVenta.RecordCount);
  label51.Caption:=formatDateTime('hh:mm:ss',now);

  if (edtCodigo.Text = '') then Exit;

  LimpiarRestauracionGrid;
  
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
          if (Glbcuadros = 1) then
          begin
            if isShowing then
            DBEdit1.setFocus;
          end else
          if isShowing then
          begin
            edtCodigo.SetFocus;
            PostMessage(edtCodigo.Handle, WM_SETFOCUS, 0, 0);
          end;
        end;
    Exit;
  end;
  MontoItbisEnPrecio:=0;
  if (edtCodigo.Text = '') then Exit;
  Edit1.Text  := '';
  edtReferencia.Text:='';
  PrecioCambio:= False;
  if reciboImpreso then
  Totales.EmptyTable;
  rxPagos.EmptyTable;
  reciboImpreso := False;

  if BuscandoPorDesc then
  begin
    //RxDBGrid2.Align:= alClient;
    try
    Panel2.Visible := True;
    panelTempPrecioLevels.Visible:= True;
    Panel2.Top := 170;
    Panel2.BringToFront;
    except
      LogInformacionTxt('Error');
    end;
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
      if (qryProductosPrecio.Value = 0) then
      begin
          MessageDlg('Precio de producto: "'+qryProductoscodigo.AsString+'-'+qryProductosDescripcion.Value+'" tiene valor cero, verifique', mtWarning, [mbOk], 0);
          if rxVenta.State in [dsEdit, dsInsert] then
          rxVenta.Cancel;
          edtCodigo.Text:='';
          if isShowing then
          edtCodigo.Setfocus;
          Exit;
      end;
      if (qryProductosCANTIDAD.Value <=0 ) And (GlbPermiteVentaInv0 = 0) then
      begin
        if (not GlbFactRecurrente) then
        begin
          MessageDlg('Cantidad venta es mayor que existencia inventario.', mtWarning, [mbOk], 0);
          if rxVenta.State in [dsEdit, dsInsert] then
          rxVenta.Cancel;
          edtCodigo.Text:='';
          if isShowing then
          edtCodigo.Setfocus;
          Exit;
        end;
      end;

      _UsarLevelPrecio:= qryProductosUSARLEVELPRECIO.Value;
      qryProdPorProveedor.Close;
      qryProdPorProveedor.Open;
      if (dmInventario.qryTipoUnidad.State = dsInactive) then
      AbrirUnidades;

      //t LlenarTipoUnidadBox(qryProductosTipo_Unidad.Value);
      if (qryProductosTipo_Unidad.value > 0) or (Not qryProductosTipo_Unidad.IsNull) then
      begin
        if not dmInventario.qryTipoUnidad.Locate('IDUNIDAD',qryProductosTipo_Unidad.value,[]) then
        begin
          cboxTipoUnidad.Text:='UNIDAD';
          GlbTipoUnidad:=1;
        end else
        begin
          cboxTipoUnidad.Text:=dmInventario.qryTipoUnidadDescripcion.Value;
          GlbTipoUnidad:=qryProductosTipo_Unidad.value;
        end;
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
      //RxDBGrid2.Align:= alClient;
      try
      panel2.Visible := True;
      panelTempPrecioLevels.Visible:= True;
      panel2.Height:=170;
      panel2.BringToFront;
      except
        LogInformacionTxt('Error');
      end;
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
        if (not GlbFactRecurrente) then
        begin

        MessageDlg('Cantidad venta es mayor que existencia inventario.', mtWarning, [mbOk], 0);
        if rxVenta.State in [dsEdit, dsInsert] then
        rxVenta.Cancel;
        edtCodigo.Text:='';
        if isShowing then
        edtCodigo.Setfocus;
        Exit;
        end;
      end;
      _UsarLevelPrecio:= qryProductosUSARLEVELPRECIO.Value;
      qryProdPorProveedor.Close;
      qryProdPorProveedor.Params[0].Value:= qryProductosCODIGO.Value;
      qryProdPorProveedor.Params[1].Value:= glbCia_Key;
      qryProdPorProveedor.Open;
      if (dmInventario.qryTipoUnidad.State = dsInactive) then
      AbrirUnidades;
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
      //RxDBGrid2.Align:= alClient;
      try
      panel2.Visible:=True;
      panelTempPrecioLevels.Visible:= True;
      panel2.Height:=170;
      panel2.BringToFront;
      except
      LogInformacionTxt('Error');
      end;
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
      if (not GlbFactRecurrente) then
      begin

      MessageDlg('Cantidad venta es mayor que existencia inventario, verifique.', mtWarning, [mbok], 0);
      if rxVenta.State In [dsEdit, dsInsert] then
      rxVenta.Cancel;
      edtCodigo.Text:='';
      if isShowing then
      edtCodigo.SetFocus;
      Exit;
      end;
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
        panel2.Height:=87;
        Panel2.Visible := False;
        if glbUsaescalaPrecio = 0 then
        panelTempPrecioLevels.Visible:= False;
        Exit;
      end;
    end;
    if qryInventario.state =dsInactive then
    qryInventario.Open;
    qryInventario.Locate('CODIGO', edtCodigo.Text,[loCaseInsensitive]);
    //nuevo
	{
      Protección crítica:
      Si el usuario está entrando otro código y la línea actual quedó en Edit/Insert,
      primero cerramos la línea anterior si ya tiene datos válidos.
      De lo contrario, edtCodigoExit no hará Append y terminará sobrescribiendo
      el item actual con el nuevo producto.
    }
    if rxVenta.State in [dsEdit, dsInsert] then
    begin
      if (not rxVentaCodArticulo.IsNull) and
         (rxVentaCodArticulo.Value > 0) and
         (not rxVentaCant.IsNull) and
         (Abs(rxVentaCant.Value) > 0) and
         (not rxVentaPrecio.IsNull) and
         (rxVentaPrecio.Value > 0) then
      begin
        LogEventoVenta('edtCodigoExit', 'Post linea anterior antes de insertar nuevo item');
        rxVenta.Post;
      end
      else
      begin
        if rxVentaCodArticulo.IsNull and
           rxVentaCant.IsNull and
           rxVentaPrecio.IsNull then
        begin
          LogEventoVenta('edtCodigoExit', 'Cancel linea vacia antes de insertar nuevo item');
          rxVenta.Cancel;
        end;
      end;
    end;
    //nuevo
    if rxVenta.State = dsBrowse then
    begin
      rxVenta.DisableControls;

      if (rxVenta.RecordCount > 0) then
      begin
        rxVenta.Last;
        numero := rxVentaSerie.Value + 1;
      end else numero := 1;

      rxVenta.EnableControls;
      
      recuperando := False;
      rxVenta.Last;
      if (GlbNumVtaPOS < 0) then
      GlbNumVtaPOS:= GetRandomNumber(VarUsuarioGlb);

      rxVenta.Append;
      esInsertando:=True;
      //Asegurarse que simpre se asigne precio
      if qryProductosPRECIO.Value > 0 then
      if rxVentaPrecio.IsNull then
      rxVentaPrecio.Value  := qryProductosPRECIO.Value;
      precioMinimo := qryProductosPRECIO_MINIMO.Value;

      rxVentaSerie.Value := numero;

      SerieLineaActiva := rxVentaSerie.Value;
      
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

      rxVentaSerie.Value := Numero;
      SerieLineaActiva := rxVentaSerie.Value;
      rxVentaFecha.Value := ExtraerFecha(GlbFechaTrnDiaria);
      if (GlbcodVendedor > 0) then
      rxVentaCodUsuario.Value := GlbcodVendedor
      else
      rxVentaCodUsuario.Value := VarUsuarioGlb;
    end;
    if rxVenta.State In [dsInsert, dsEdit] then
    begin
      if not GlbFactRecurrente then
      begin
        rxVentaDescripcion.Value:= qryProductosDESCRIPCION.Value;
      end;
      if rxVentaDescripcion.IsNull then
      rxVentaDescripcion.Value:= qryProductosDESCRIPCION.Value;
      if not GlbFactRecurrente then
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
      RxSpinEdit1.Value:=qryClienteUSARLEVELPRECIO.Value //rxspinedit1
      else
      if not qryProductosUSARLEVELPRECIO.IsNull then
      RxSpinEdit1.Value:=qryProductosUSARLEVELPRECIO.Value
      else
      if (tablaPropietarioCodigoPropietario.IsNull Or
         (tablaPropietarioCodigoPropietario.Value = 0)) then
      RxSpinEdit1.Value:=1
      else
      RxSpinEdit1.Value:=qryClienteUSARLEVELPRECIO.Value;//rxspinedit1

      rxVentaCodArticulo.Value:= qryProductoscodigo.Value;
      if qryProductosPORC_DESCUENTO.Value > 0 then
      rxVentaPorcDescItem.Value:=qryProductosPORC_DESCUENTO.Value;
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

       if (qryClasifPrecioCOD_PRODUCTO.Value <> qryProductosCODIGO.Value) then
       ProcFAplicaPrecioMayorista(qryProductosCODIGO.Value);

        if FAplicaPrecioMayorista and not GlbUsandoCotiza then
        rxVentaPrecio.Value  := qryClasifPrecioPRECIO_VENTA.Value
        else
        if (GlbUsaescalaPrecio =1) and (not GlbUsandoCotiza or ( rxVentaStatus.Value = 'I') ) then
        begin
          if not GlbFactRecurrente then
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

          if rxVenta.State in [dsEdit, dsInsert] then
          rxVentaLevelPrecio.Value := RxSpinEdit1.AsInteger;
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
          if not GlbFactRecurrente then
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

      //Determinar precio servicios Cuadros
      if rxVenta.State in [dsEdit, dsInsert] then
      begin
        if GlBCuadros = 1 then
        begin
          if (not GlbFactRecurrente) then
          begin
            RxSpinEdit1.Value:=GetNivelPrecioCuadros(tablaPropietarioCodigoPropietario.Value);

            if RxSpinEdit1.Value > 0 then
            rxVentaPrecio.Value :=
            GetPrecioNivelCuadros(qryProductoscodigo.Value,RxSpinEdit1.AsInteger);
          end else
          if EntManual then
          begin
            RxSpinEdit1.Value:=GetNivelPrecioCuadros(tablaPropietarioCodigoPropietario.Value);

            if RxSpinEdit1.Value > 0 then
            rxVentaPrecio.Value :=
            GetPrecioNivelCuadros(qryProductoscodigo.Value,RxSpinEdit1.AsInteger);
            EntManual:=False;
          end;
        end;// else
        //rxVentaLevelPrecio.Value := RxSpinEdit1.AsInteger;
      end;

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
        dmInventario.qryLote.first;
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
        end else
        begin
          if rxVenta.State in [dsBrowse] then rxVenta.Edit;
          if not dmInventario.qryLoteLOTE_NUM.IsNull then
          rxVentaloteNum.Value:= dmInventario.qryLoteLOTE_NUM.Value;
        end;
      end;
    end  else
    ProcesaNuevo;
  end;

  ProcSetNCFCliente;

  panel2.Visible:=MostrarVistaproductos1.Checked;
  if glbUsaescalaPrecio = 0 then
  panelTempPrecioLevels.Visible:= panel2.Visible;
  if LectorCodBarra1.Checked And (rxVentaPrecio.Value > 0) then
  begin
    DBEdit1Enter(Self);
    DBEdit1Exit(Self);
    if isShowing then
      if not EsModificandoCotiza then
      begin
        if (Glbcuadros = 1) then
        begin
          DBEdit1.SetFocus;
        end else
        edtCodigo.SetFocus;
        PostMessage(edtCodigo.Handle, WM_SETFOCUS, 0, 0);
      end;
  end;
  if (Glbcuadros = 1) then
  begin
    DBEdit1.SetFocus;
  end else
  if (GlbUsaPUnidadLevel = 0) and (esEditando) then
  DBEdit1.SetFocus;
  edtCodigo.Color  :=clSilver;
  if (rxVentaMontoNeto.value = 0) and (rxVentaPrecio.value > 0) then
  begin
    EnProcesoCalculo:=False;
    dmCalculos.ProcesaCalculos;
  end;
  if (Abs(rxVentaCant.Value) > 0) and (Abs(rxVentaPrecio.Value) > 0) and (totalestotalneto.Value = 0) then
  CalcularTotalesInterno;
  RestaurarLineaActiva;
end;

procedure TfrmProcVentaRapida.InactivaReciboFarmacia1Click(
  Sender: TObject);
begin
  LogProcedure('TfrmProcVentaRapida.InactivaReciboFarmacia1Click');
  if not InactivaReciboFarmacia1.Checked then
  GlbFarmacia:=1 else
  begin
    GlbFarmacia:=0;
    InactivaReciboFarmacia1.Checked:=True;
  end;
end;

function TfrmProcVentaRapida.VerificaVentaExisteRX(serie: integer):boolean;
begin
  LogProcedure('TfrmProcVentaRapida.VerificaVentaExisteRX');
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
  LogProcedure('TfrmProcVentaRapida.DataSource1StateChange');
  check:=0;
end;

procedure TfrmProcVentaRapida.ProcUpdateItbiRecargoVtaMast(numeroTrnVta:integer);
begin
  LogProcedure('TfrmProcVentaRapida.ProcUpdateItbiRecargoVtaMast');
  dmcalculos.qryGetTotalItbis.close;
  dmcalculos.qryGetTotalItbis.params[0].Value:= GlbNumVtaPOS;
  dmcalculos.qryGetTotalItbis.Open;
  try
    dmcalculos.ibSqlUpdateVtaMast.ParamByName('montototalitbis').Value:=
    dmcalculos.qryGetTotalItbisSUBTOTALITBIS.Value;
    dmcalculos.ibSqlUpdateVtaMast.ParamByName('numero').Value:=numeroTrnVta;
    dmcalculos.ibSqlUpdateVtaMast.ExecQuery;
    if Not dmcalculos.ibSqlUpdateVtaMast.Transaction.InTransaction then
    dmcalculos.ibSqlUpdateVtaMast.Transaction.StartTransaction;
    try
      dmcalculos.ibSqlUpdateVtaMast.Transaction.CommitRetaining;
    except
    dmcalculos.ibSqlUpdateVtaMast.Transaction.RollbackRetaining;
    end;
  except
  end;
end;

procedure TfrmProcVentaRapida.ProcUpdateItbiRecargoCotizaMast(
  numeroTrnVta: Integer);
begin
  LogProcedure('TfrmProcVentaRapida.ProcUpdateItbiRecargoCotizaMast');
  dmcalculos.qryGetTotalItbis.close;
  dmcalculos.qryGetTotalItbis.params[0].Value:= GlbNumVtaPOS;
  dmcalculos.qryGetTotalItbis.Open;
  try
    dmcalculos.ibSqlUpdateVtaMast.ParamByName('montototalitbis').Value:=
    dmcalculos.qryGetTotalItbisSUBTOTALITBIS.Value;
    dmcalculos.ibSqlUpdateVtaMast.ParamByName('numero').Value:=numeroTrnVta;
    dmcalculos.ibSqlUpdateVtaMast.ExecQuery;
    if Not dmcalculos.ibSqlUpdateVtaMast.Transaction.InTransaction then
    dmcalculos.ibSqlUpdateVtaMast.Transaction.StartTransaction;
    try
      dmcalculos.ibSqlUpdateVtaMast.Transaction.CommitRetaining;
    except
    dmcalculos.ibSqlUpdateVtaMast.Transaction.RollbackRetaining;
    end;
  except
  end;
end;

procedure TfrmProcVentaRapida.FormResize(Sender: TObject);
begin
  LogProcedure('TfrmProcVentaRapida.FormResize');
  refresh;
end;

procedure TfrmProcVentaRapida.ImprimirOrdenEntrega1Click(Sender: TObject);
var flag : boolean;
begin
  LogProcedure('TfrmProcVentaRapida.ImprimirOrdenEntrega1Click');
  frmConsultaFacturas:=TfrmConsultaFacturas.Create(Nil);
  try

    dmfactura.qryVtaConDeliveryTrn.Close;
    dmfactura.qryVtaConDeliveryTrn.Params[0].Value:= dmFactura.qryVentaFacturaNUMERO.Value;
    dmfactura.qryVtaConDeliveryTrn.Open;

    frmConsultaFacturas.BitBtn2.Caption := '&Aceptar';
    if frmConsultaFacturas.Showmodal = mrOK then
    begin
      dmVentas.qryRepOrdenConduce.Close;
      dmVentas.qryRepOrdenConduce.Params[0].Value:= dmFactura.qryVentaFacturaNUMERO.Value;
      dmVentas.qryRepOrdenConduce.Open;//dmVentas.qryRepOrdenConduce.sql.text

      if not dmVentas.qryRepOrdenConduce.Locate('NUM_TRN', dmFactura.qryVentaFacturaNUMERO.Value,[]) then
      MessageDlg('Transacción seleccionada no encontrado, verifique.', mtInformation,[mbok],0)
      else
      if (GlbFOrdDespAlmcenPOS = 1) then
      begin
        qckRepOrdenAlmacenPOS:=TqckRepOrdenAlmacenPOS.Create(Nil);
        try
          dmDatos.qryImpresoras.Close;
          dmDatos.qryImpresoras.Open;
          if dmDatos.qryImpresoras.Locate('IDMODULO;IDREPORTE',
          VarArrayOf([1,1]),[]) then //Orden Despacho Almacen
          qckRepOrdenAlmacenPOS.PrinterSettings.PrinterIndex:=
          GetImpresora(dmDatos.qryImpresorasNOMBRE_IMPRESORA.Value);

        if dmFactura.qryVentaFacturaDet.RecordCount = 1 then
        qckRepOrdenAlmacenPOS.Page.Length:=4.344
        else
        if dmFactura.qryVentaFacturaDet.RecordCount >= 2 then
        qckRepOrdenAlmacenPOS.Page.Length:= qckRepOrdenAlmacenPOS.Page.Length +
        (dmFactura.qryVentaFacturaDet.RecordCount - 1 ) * 0.25;

        flag:=true;
        qckRepOrdenAlmacenPOS.Prepare;
        if ((dmFactura.qryVentaFacturaDet.RecordCount >= 1) and
           ((dmFactura.qryVentaFacturaDet.RecordCount < 10)
            or (qckRepOrdenAlmacenPOS.PageNumber = 2))) then
        begin
          ProgressBar1.Visible:=true;
          ProgressBar1.Position:=0;
          ProgressBar1.Max:=dmFactura.qryVentaFacturaDet.RecordCount;
          if (GlbIncLargoPapel = 1) then
          begin
            repeat
              begin
                ProgressBar1.StepIt;
                if (qckRepOrdenAlmacenPOS.PageNumber > 1) then
                begin
                  qckRepOrdenAlmacenPOS.Page.Length:=qckRepOrdenAlmacenPOS.Page.Length + 0.26;
                  qckRepOrdenAlmacenPOS.Prepare;
                  flag:=False;
                end else
                if (qckRepOrdenAlmacenPOS.PageNumber = 1) then
                break;
                if (qckRepOrdenAlmacenPOS.PageNumber = 1) then
                   break;
              end;
            until flag = true;
          end;
        end;
        ProgressBar1.Visible:= False;
        qckRepOrdenAlmacenPOS.Prepare;
        frmImprimir:=TfrmImprimir.Create(nil);
        try
          if frmImprimir.Showmodal = mrOk then
          begin
            if frmImprimir.RadioGroup1.ItemIndex = 0 then
               qckRepOrdenAlmacenPOS.Page.PaperSize := Letter;
              if frmImprimir.RadioButton1.Checked then
              begin
                qckRepOrdenAlmacenPOS.PrinterSetup;
                qckRepOrdenAlmacenPOS.Print;
              end else
              qckRepOrdenAlmacenPOS.Preview;
            end;
          finally
          frmImprimir.Free;
          frmImprimir:=Nil;
          end;
        finally
        qckRepOrdenAlmacenPOS.Free;
        qckRepOrdenAlmacenPOS:=Nil;
        end;
      end else
      begin
        dmFactura.qryVentaFacturaDet.Close;
        dmFactura.qryVentaFacturaDet.Params[0].Value:= dmVentas.qryRepOrdenConduceNUM_TRN.Value;
        dmFactura.qryVentaFacturaDet.Open;

        qckRepOrdenAlmacen:=TqckRepOrdenAlmacen.Create(Nil);
        try

          dmDatos.qryImpresoras.Close;
          dmDatos.qryImpresoras.Open;
          if dmDatos.qryImpresoras.Locate('IDMODULO;IDREPORTE',
          VarArrayOf([1,1]),[]) then //Orden Despacho Almacen
          qckRepOrdenAlmacen.PrinterSettings.PrinterIndex:=
          GetImpresora(dmDatos.qryImpresorasNOMBRE_IMPRESORA.Value);
          ProgressBar1.Visible:= False;
          frmImprimir:=TfrmImprimir.Create(nil);
          try
            if frmImprimir.Showmodal = mrOk then
            begin
              if frmImprimir.RadioGroup1.ItemIndex = 0 then
              qckRepOrdenAlmacen.Page.PaperSize := Letter;
              if frmImprimir.RadioButton1.Checked then
              begin
                qckRepOrdenAlmacen.PrinterSetup;
                qckRepOrdenAlmacen.Print;
              end else
              qckRepOrdenAlmacen.Preview;
            end;
          finally
          frmImprimir.Free;
          frmImprimir:=Nil;
          end;
        finally
        qckRepOrdenAlmacen.Free;
        qckRepOrdenAlmacen:=Nil;
        end;
      end;
    end;
  finally
  frmConsultaFacturas.Free;
  frmConsultaFacturas:= Nil;
  end;
end;

procedure TfrmProcVentaRapida.ActualizaConduce1Click(Sender: TObject);
begin
  LogProcedure('TfrmProcVentaRapida.ActualizaConduce1Click');
  if EsConduce then
  begin
      dmVentas.tblDatosConduce.Close;
      dmVentas.tblDatosConduce.Params[0].Value:= ipStpInsertVentMast.Params[0].Value;
      dmVentas.tblDatosConduce.Open;
      if dmVentas.tblDatosConduce.Locate('NUM_TRN',ipStpInsertVentMast.Params[0].Value,[]) then
      begin
      frmDatosOrdConduce:=TfrmDatosOrdConduce.Create(nil);
      try
        frmDatosOrdConduce.cerrarAlImp:= True;
        frmDatosOrdConduce.showmodal;
      finally
      frmDatosOrdConduce.free;
      frmDatosOrdConduce:=nil;
      end;
      end;
      //aqui deberia ir el codigo para imprimir el conduce
      //EsConduce:=False;
  end else
  begin
  frmConsultaFacturas:=TfrmConsultaFacturas.Create(Nil);
  try
    frmConsultaFacturas.BitBtn2.Caption := '&Aceptar';
    if frmConsultaFacturas.Showmodal = mrOK then
    begin
      dmVentas.tblDatosConduce.Close;
      dmVentas.tblDatosConduce.Params[0].Value:= dmFactura.qryVentaFacturaNUMERO.Value;
      dmVentas.tblDatosConduce.Open;

      dmfactura.qryVtaConDeliveryTrn.Close;
      dmfactura.qryVtaConDeliveryTrn.Params[0].Value:= dmFactura.qryVentaFacturaNUMERO.Value;
      dmfactura.qryVtaConDeliveryTrn.Open;

      if dmVentas.tblDatosConduce.Locate('NUM_TRN',dmFactura.qryVentaFacturaNUMERO.Value,[]) then
      begin
        frmDatosOrdConduce:=TfrmDatosOrdConduce.Create(nil);
        try
          frmDatosOrdConduce.showmodal;
        finally
        frmDatosOrdConduce.free;
        frmDatosOrdConduce:=nil;
        end;
      end;
    end;
  finally
  frmConsultaFacturas.free;
  frmConsultaFacturas:=nil;
  end;
  end;
end;

procedure TfrmProcVentaRapida.ConfirmarConduce2Click(Sender: TObject);
begin
  LogProcedure('TfrmProcVentaRapida.ConfirmarConduce2Click');
  frmConfirmaConduce:=TfrmConfirmaConduce.Create(Nil);
  try
    frmConfirmaConduce.Showmodal;
  finally
  frmConfirmaConduce.Free;
  frmConfirmaConduce:=Nil;
  end;
end;

procedure TfrmProcVentaRapida.DatosVocado(numtrn:integer;fpago:integer);
begin
  LogProcedure('TfrmProcVentaRapida.DatosVocado');
  if (GlBLimao = 0) And (GlBInMobi= 0) then Exit;

  if Not (fpago  in [7,8]) then Exit;

  dmVentas.tblVentaVocados.Close;
  dmVentas.tblVentaVocados.Params[0].Value:= numtrn;
  dmVentas.tblVentaVocados.Open;

  if dmVentas.tblVentaVocadosNUMERO_TRN.Isnull then
  begin
    dmVentas.tblVentaVocados.Append;
    dmVentas.tblVentaVocadosNUMERO_TRN.Value:= numtrn;
    dmVentas.tblVentaVocadosCOD_PRODUCTO.Value:=rxVentaCodArticulo.Value; 
  end;
  frmVocadoDet:=TfrmVocadoDet.Create(Nil);
  try
  frmVocadoDet.ShowModal;
  finally
  frmVocadoDet.Free;
  frmVocadoDet:=Nil;
  end;
end;

procedure TfrmProcVentaRapida.ReImprimeFactRest1Click(Sender: TObject);
var
  tRecordsDet : Integer;
  pulgadaInc : Real;
  flag : boolean;
  cRc : Integer;
begin
  LogProcedure('TfrmProcVentaRapida.ReImprimeFactRest1Click');
  dmCompania.tblCompania.Close;
  dmCompania.tblCompania.Open;
  dmCompania.tblCompania.Locate('codigo', glbCia_Key, []);
  dmfactura.qryFactReimpMaster.close;
  dmfactura.qryVentaFactura.Close;
  dmreportes.qryViewVentasMast.Close;

  frmConsultaFacturas:=TfrmConsultaFacturas.Create(Nil);
  try
    frmConsultaFacturas.BitBtn2.Caption := '&Re-Imprimir';
    if frmConsultaFacturas.Showmodal = mrOK then
    begin
      if frmConsultaFacturas.rdgContado.Checked then
         esContado:=True
      else esContado:=False;

      dmfactura.qryVtaConDeliveryTrn.Close;
      dmfactura.qryVtaConDeliveryTrn.Params[0].Value:= dmFactura.qryVentaFacturaNUMERO.Value;
      dmfactura.qryVtaConDeliveryTrn.Open;

      if not dmFactura.qryVentaFacturaNUMERO_DOC_PAGO.IsNull then
      NumeroTrn := dmFactura.qryVentaFacturaNUMERO_DOC_PAGO.AsInteger
      else
      NumeroTrn := dmFactura.qryVentaFacturaNUMERO_Factura.Value;
    end else Exit;

    if frmConsultaFacturas.rdgNotaCR.Checked then//devolucion -NCR
    begin
      UProcesarDevolucion.SolNum:=False;
      UProcesarDevolucion.numeroFactura :=NumeroTrn;
      ReImprimeDevolucion1Click(self);
      UProcesarDevolucion.SolNum:=True;
      try
      if Assigned(frmConsultaFacturas) then
      begin
        frmConsultaFacturas.Free;
        frmConsultaFacturas:= Nil;
      end;
      except
      end;
      Exit;
    end;

    dmReportes.qryViewVentasMast.Close;
    dmReportes.qryViewVentasMast.Params[0].Value:=dmFactura.qryVentaFacturaNUMERO.Value;
    dmReportes.qryViewVentasMast.Open;

    ProcSetPathlogoTipoServicio(dmReportes.qryViewVentasMastTIPO_AFILIADO.Value);

    dmfactura.qryFactReimpMaster.Close;
    dmfactura.qryFactReimpMaster.Params[0].Value := -1;
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

    qryCtes.Close;
    qryCtes.Open;
    if qryCtes.Locate('CODIGO_CTE', dmfactura.qryFactReimpMasterCODIGO_CTE.Value,[]) then
    glbcodVendedor:=qryCtesCOD_VENDEDOR.Value
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
    dmVentas.qryVentaVocados.Close;
    dmVentas.qryVentaVocados.Params[0].Value:= dmFactura.qryVentaFacturaNUMERO.Value;
    dmVentas.qryVentaVocados.Open;

      dmreportes.qryViewVentasMast.Close;
      dmreportes.qryViewVentasMast.Params[0].Value:= dmfactura.qryVentaFacturaNUMERO.Value;
      dmreportes.qryViewVentasMast.Open;
      ProcSetPathlogoTipoServicio(dmReportes.qryViewVentasMastTIPO_AFILIADO.Value);
      if dmreportes.qryViewVentasMastFORMA_PAGO.Value = 7 then
      begin
        qckFacturaLimao01:=TqckFacturaLimao01.Create(Nil);
        try
          if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
          begin
            qckFacturaLimao01.PrinterSetup;
            qckFacturaLimao01.Print;
          end else
          qckFacturaLimao01.Preview;

          if (GlbImpReciboSinPreg = 0) then
          if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
          begin
            qckFacturaLimao01.Preview;
          end;
          if GlbImpPDF then
          if not dmFactura.qryVentaFacturaNUMERO_FACTURA.IsNull then
          ReportExportPDF(qckFacturaLimao01,GlbRutaFacturas+'\Facturas'+IntToStr(dmFactura.qryVentaFacturaNUMERO_FACTURA.Value)+'.pdf');
          finally
          qckFacturaLimao01.Free;
          qckFacturaLimao01:=Nil;
          end;
      end;
end;


procedure TfrmProcVentaRapida.ProcInsertarDetEfectivo(numtrn: integer;fpago:integer);
begin
  LogProcedure('TfrmProcVentaRapida.ProcInsertarDetEfectivo');
  dmcxc.tblDetallePagos.Close;
  dmcxc.tblDetallePagos.Params[0].Value:=numtrn;
  dmcxc.tblDetallePagos.Params[1].Value:=1;//area trans
  dmcxc.tblDetallePagos.Open;

  if (dmcxc.tblDetallePagos.RecordCount > 0) and EsPagoExacto then Exit;
  
  if (dmcxc.tblDetallePagosTIPO_PAGO.Value = fpago) and
     (dmcxc.tblDetallePagos.RecordCount > 0) then Exit;

  dmcxc.tblDetallePagos.Append;
  dmcxc.tblDetallePagosFECHA.Value := GlbFechaTrnDiaria;
  dmcxc.tblDetallePagosTIPO.Value        := 1;//CONTADO
  dmcxc.tblDetallePagosTIPO_PAGO.Value   := fpago; //Efectivo
  dmcxc.tblDetallePagosSERIE_TRN.Value   := numtrn;

  dmcxc.tblDetallePagosGlbNumVtaPOS.Value  := GlbNumVtaPOS;
  dmcxc.tblDetallePagosAREA_TRANS.Value  := 1;//Ventas
  if (GlbActivaIFiscal = 1) then
  dmcxc.tblDetallePagosMonto_Pagado.Value:= Totalesmontorecibido.Value
  else
  dmcxc.tblDetallePagosMonto_Pagado.Value:= Totalestotalneto.Value;
  dmcxc.tblDetallePagos.Post;
  dmcxc.tblDetallePagos.ApplyUpdates;
  if not dmcxc.tblDetallePagos.Transaction.InTransaction then
  dmcxc.tblDetallePagos.Transaction.StartTransaction;
  try
    dmcxc.tblDetallePagos.Transaction.CommitRetaining;
  except
  dmcxc.tblDetallePagos.Transaction.RollbackRetaining;
  end;
end;

procedure TfrmProcVentaRapida.ImprimirTicketVtaAgua(numtrn:integer);
begin
  LogProcedure('TfrmProcVentaRapida.ImprimirTicketVtaAgua');
  try
  qckTicketVta:=TqckTicketVta.Create(nil);
  
  dmDatos.qryImpresoras.Close;
  dmDatos.qryImpresoras.Open;
  if dmDatos.qryImpresoras.Locate('IDMODULO;IDREPORTE',
  VarArrayOf([1,11]),[]) then     //Ticket especial
  qckTicketVta.PrinterSettings.PrinterIndex:=
  GetImpresora(dmDatos.qryImpresorasNOMBRE_IMPRESORA.Value);
  except
  end;

  try
    qckTicketVta.qryDatosVenta.Close;
    qckTicketVta.qryDatosVenta.Params[0].Value:= numtrn;
    qckTicketVta.qryDatosVenta.Open;
    if MessageDlg('Imprimir Ticket Vta?', mtInformation, [mbYes, mbNo], 0) = mrYes then
    begin
      qckTicketVta.PrinterSetup;
      qckTicketVta.Print;
    end else
    qckTicketVta.Preview;
  finally
  qckTicketVta.free;
  qckTicketVta:=nil;
  end;
end;

procedure TfrmProcVentaRapida.ReImprimeTicketVta1Click(Sender: TObject);
var
  tRecordsDet : Integer;
  pulgadaInc : Real;
  flag : boolean;
  cRc : Integer;
begin
  //LogProcedure('TfrmProcVentaRapida.ReImprimeTicketVta1Click');
  dmCompania.tblCompania.Close;
  dmCompania.tblCompania.Open;
  dmCompania.tblCompania.Locate('codigo', glbCia_Key, []);
  dmfactura.qryFactReimpMaster.close;
  dmfactura.qryVentaFactura.Close;
  dmreportes.qryViewVentasMast.Close;

  frmConsultaFacturas:=TfrmConsultaFacturas.Create(Nil);
  try
    frmConsultaFacturas.BitBtn2.Caption := '&Re-Imprimir';
    if frmConsultaFacturas.Showmodal = mrOK then
    begin
      if frmConsultaFacturas.rdgContado.Checked then
         esContado:=True
      else esContado:=False;

      //if not dmFactura.qryVentaFacturaNUMERO_DOC_PAGO.IsNull then
      //NumeroTrn := dmFactura.qryVentaFacturaNUMERO_DOC_PAGO.AsInteger
      //else
      NumeroTrn := dmFactura.qryVentaFacturaNumero.Value;
      dmfactura.qryVtaConDeliveryTrn.Close;
      dmfactura.qryVtaConDeliveryTrn.Params[0].Value:= dmFactura.qryVentaFacturaNUMERO.Value;
      dmfactura.qryVtaConDeliveryTrn.Open;      
      ImprimirTicketVtaAgua(NumeroTrn);
    end else Exit;

    finally
    try
      if Assigned(frmConsultaFacturas) then
      begin
        frmConsultaFacturas.Free;
        frmConsultaFacturas:= Nil;
      end;
    except
    end;
  end;
end;

procedure TfrmProcVentaRapida.ReversaCantInventario(numtrn: integer);
begin
  LogProcedure('TfrmProcVentaRapida.ReversaCantInventario');
  dmInventario.tblInventarioProd.Close;
  dmInventario.tblInventarioProd.SelectSQL.Text := dmInventario.qryInvProd_Base.Sql.Text;
  dmInventario.tblInventarioProd.Params[0].Value:=glbCia_Key;
  dmInventario.tblInventarioProd.Open;
  dmVentas.tblVentasDet.Close;
  dmVentas.tblVentasDet.Params[0].Value := numtrn;
  dmVentas.tblVentasDet.Open;
  dmVentas.tblVentasDet.First;
  rxDataAnt.Close;
  rxDataAnt.EmptyTable;
  rxDataAnt.Open;
  While Not dmVentas.tblVentasDet.Eof Do
  begin
    if (dmVentas.tblVentasDetSTATUS_DET.Value = 'A') then
    begin
      rxDataAnt.Append;
      rxDataAntSerie.Value:= dmVentas.tblVentasDetSERIE.Value;
      rxDataAntCant.Value := dmVentas.tblVentasDetCANTIDAD.Value;
      rxDataAntCodigoProd.Value:= dmVentas.tblVentasDetCODIGO_PROD.AsInteger;
      rxDataAntCantNueva.Value := 0;
      rxDataAnt.Post;
    end;
    dmVentas.tblVentasDet.Next;
  end;
  rxVenta.First;
  While not rxVenta.Eof do
  begin
    ProcModFactCantXUnidad(rxVentaCodArticulo.Value, rxVentaTipoUnidad.Value);

    if rxDataAnt.Locate('serie;codigoprod',vararrayof([rxVentaSerie.Value,
    rxVentaCodArticulo.Value]),[]) then
    begin
      rxDataAnt.Edit;
      rxDataAntCantNueva.Value:= rxVentaCant.Value;
      if (rxVentaStatus.Value = 'C') then
      rxDataAntCantNueva.Value:=0;
      rxDataAnt.Post;
    end else
    begin
      rxDataAnt.Append;
      rxDataAntSerie.Value:= rxVentaSERIE.Value;
      rxDataAntCant.Value := 0;
      rxDataAntCantNueva.Value := rxVentaCant.Value;
      rxDataAntCodigoProd.Value:= rxVentaCodArticulo.Value;
      rxDataAnt.Post;
    end;
    rxDataAnt.Edit;
    if dmInventario.tblInventarioProd.Locate('codigo',rxVentaCodArticulo.Value,[]) then
    rxDataAntCantFinal.Value:=dmInventario.tblInventarioProdCANTIDAD.Value +
    (rxDataAntCant.Value * CantUnidad) - (rxDataAntCantNueva.Value*CantUnidad);
    rxDataAnt.Post;
    if dmInventario.tblInventarioProd.Locate('codigo',rxDataAntCodigoProd.Value,[]) then
    begin
      dmInventario.tblInventarioProd.Edit;
      if rxDataAntCantFinal.Value >=0 then
      dmInventario.tblInventarioProdCANTIDAD.Value:=rxDataAntCantFinal.Value
      else
      begin
        NotificaErrorByEmail('Intento de Actualizar Inv con Negativo. Cant:'+rxDataAntCantFinal.AsString+
        ' #Trn '+IntToStr(numtrn));
      end;
      GlbSalvarQuery(dmInventario.tblInventarioProd);
    end;
    
    ActualizaVentaDet;
    try
      ActualizaInvAlmacen;//Actualiza Division Inventario
    except on E : Exception do
    begin
      NotificaErrorByEmail('Actualizando Cant Inventario (stpMantInvAlmacen.ExecProc;):'+rxDataAntCantFinal.AsString+
      ' #Trn '+IntToStr(NumeroTrn)+LF+CR+e.Message);
      WriteToLog('Actualizando Cant Inventario (stpMantInvAlmacen.ExecProc;):'+rxDataAntCantFinal.AsString+
      ' #Trn '+IntToStr(NumeroTrn)+LF+CR+e.Message);
    end;
    end;
    rxVenta.Next;
  end;
  //RxDBGrid4.Visible:= True;
  //RxDBGrid4.BringToFront;
end;

procedure TfrmProcVentaRapida.ReImprimeConduce1Click(Sender: TObject);
begin
  LogProcedure('TfrmProcVentaRapida.ReImprimeConduce1Click');
  reimpConduce:=True;
  GlbEsCopia:=True;
  BitBtn13Click(Self);
end;

procedure TfrmProcVentaRapida.ImprimirFacturaAgua(numstr: integer);
begin
  LogProcedure('TfrmProcVentaRapida.ImprimirFacturaAgua');
  GlbEsCopia:=False;
  dmCompania.tblCompania.Close;
  dmCompania.tblCompania.Open;
  dmCompania.tblCompania.Locate('codigo', glbCia_Key,[]);
  dmfactura.qryFactReimpMaster.Close;
  if (numstr = 0) then
  begin
    dmfactura.qryFactReimpMaster.Params[0].Value:= StrToInt(InputBox('Re-Imprimir factura de','Entre número',''));
    GlbEsCopia:=True;
  end else
  if esContado then
  dmfactura.qryFactReimpMaster.Params[0].Value:=numstr
  else
  dmfactura.qryFactReimpMaster.Params[0].Value:=numstr;

  dmfactura.qryFactReimpMaster.Open;
  dmfactura.qryFactReimpDet.Close;
  dmfactura.qryFactReimpDet.Params[0].Value:=dmfactura.qryFactReimpMaster.Params[0].Value;
  dmfactura.qryFactReimpDet.Open;//dmfactura.qryFactReimpDet.sql.text
  dmfactura.qryFactReimpDet.Last;

  dmfactura.qryFactReimpMaster.Open;

  qryCtes.Close;
  qryCtes.Open;//dmfactura.qryFactReimpMaster.recordcount
  if qryCtes.Locate('CODIGO_CTE', dmfactura.qryFactReimpMasterCODIGO_CTE.Value,[]) then
  glbcodVendedor:=qryCtesCOD_VENDEDOR.Value
  else
  glbcodVendedor:= VarUsuarioGlb;
  LlenarrxSolDatoscte(dmFactura.qryVentaFacturaCODIGO_CTE.Value);


  dmreportes.qryViewVentasMast.Close;
  dmreportes.qryViewVentasMast.Params[0].Value:= dmfactura.qryVentaFacturaNUMERO.Value;
  dmreportes.qryViewVentasMast.Open;

  if GlbFormatoConduce = 444 then
  begin
   qckFactServ8_5Agua:=TqckFactServ8_5Agua.Create(Nil);
   try
     if GlbEsCopia then
     qckFactServ8_5Agua.xtipoVenta := TipoVenta +' (Copia)'
     else qckFactServ8_5Agua.xtipoVenta := TipoVenta;
     qckFactServ8_5Agua.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;
     if (GlbImpReciboSinPreg = 1) then
     qckFactServ8_5Agua.Print
     else
     begin
       ProgressBar1.Visible:= False;
       frmImprimir:=TfrmImprimir.Create(nil);
       try
         if frmImprimir.Showmodal = mrOk then
         begin
           if frmImprimir.RadioGroup1.ItemIndex = 0 then
           qckFactServ8_5Agua.Page.PaperSize := Letter;
           if frmImprimir.RadioButton1.Checked then
           begin
             qckFactServ8_5Agua.PrinterSetup;
             qckFactServ8_5Agua.Print;
           end else
           qckFactServ8_5Agua.Preview;
         end;
       finally
       frmImprimir.Free;
       frmImprimir:=Nil;
       end;
     end;

     if (GlbImpReciboSinPreg = 0) then
     if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
     begin
       qckFactServ8_5Agua.Preview;
     end;
     if GlbImpPDF then
     if not dmFactura.qryVentaFacturaNUMERO_FACTURA.IsNull then
        ReportExportPDF(qckFactServ8_5Agua,GlbRutaFacturas+'\Facturas'+IntToStr(dmFactura.qryVentaFacturaNUMERO_FACTURA.Value)+'.pdf')
     else
     if not dmFactura.qryVentaFacturaNUMERO_DOC_PAGO.IsNull then
        ReportExportPDF(qckFactServ8_5Agua,GlbRutaFacturas+'\Facturas'+IntToStr(dmFactura.qryVentaFacturaNUMERO_DOC_PAGO.AsInteger)+'.pdf')

   finally
   qckFactServ8_5Agua.Free;
   qckFactServ8_5Agua:=Nil;
   end;
   end;
   if GlbImpTicketVtaAgua = 1 then
   ImprimirTicketVtaAgua(dmFactura.qryVentaFacturaNUMERO.Value);
end;

procedure TfrmProcVentaRapida.TotalesAfterClose(DataSet: TDataSet);
begin
  //LogProcedure('TfrmProcVentaRapida.TotalesAfterClose');
  lblAvisoCte.Visible:=False;
  NCFCTeNotSetup:=False;
  rxCobertura.Close;
  rxCobertura.EmptyTable;
  rxCobertura.Open;
  Label60.Caption:='';
end;

function TfrmProcVentaRapida.ValidaSubTotal: Boolean;
begin
  //LogProcedure('TfrmProcVentaRapida.ValidaSubTotal');
  if (GlbNumVtaPOS > 0) and (rxVenta.RecordCount > 0) then
  begin
    qryValidaPosExtra.Close;
    qryValidaPosExtra.params[0].Value:= GlbNumVtaPOS;
    qryValidaPosExtra.Open;
    if rxPrepagoAplicadoMonto.isNull then
    begin
      rxPrepagoAplicado.close;
      rxPrepagoAplicado.Open;
      rxPrepagoAplicado.Insert;
      rxPrepagoAplicadoNumero.Value:= 0;
      rxPrepagoAplicadoMonto.Value := 0;
      rxPrepagoAplicado.Post;
    end;
    //if (qryValidaPosExtraVALOR.Value - TotalesSubTotalScreen.Value) > 1 then
    //begin
      if ((rxVenta.RecordCount > 0) and (abs(rxVentaCant.Value) > 0)
      and (rxVentaMontoNeto.Value = 0)) or ((Totalesitbis.Value=0) and (Abs(rxVentaitbi.value) > 0)) then
      begin
         EsEditando:=True;
         DBEdit2Exit(Self);
      end;
    //end;
    if ((Totalestotalneto.Value+rxPrepagoAplicadoMonto.Value+TotalesMontoDescItems.Value
         +TotalesMontoDescAdicional.value) < TotalesSubTotalScreen.Value) and
          (ABS((Totalestotalneto.Value+rxPrepagoAplicadoMonto.Value+TotalesMontoDescItems.Value+TotalesMontoDescAdicional.value)
         - TotalesSubTotalScreen.Value) > 1) and
       (Totalesitbis.Value = 0) or ((Totalesitbis.Value=0) and (Abs(rxVentaitbi.value) > 0)) then
    begin
      GlbCalculado:=False;
      LogEventoVenta('CALL ProcesaCalculos', 'TfrmProcVentaRapida.ValidaSubTotal: Boolean;');
      EnProcesoCalculo:=False;
      dmCalculos.ProcesaCalculos;
      GlbCalculado:=True;
    end;
    if Totales.state = dsBrowse then Totales.Edit;

    if ((Totalestotalneto.Value+rxPrepagoAplicadoMonto.Value+TotalesMontoDescItems.Value
         +TotalesMontoDescAdicional.value) < TotalesSubTotalScreen.Value) and
        (ABS((Totalestotalneto.Value+rxPrepagoAplicadoMonto.Value+TotalesMontoDescItems.Value+TotalesMontoDescAdicional.value) - TotalesSubTotalScreen.Value) > 1) and
       (Totalesitbis.Value = 0) or ((Totalesitbis.Value=0) and (Abs(rxVentaitbi.value) > 0)) then
       begin
         //MessageDlg('Total Neto:'+Totalestotalneto.AsString+
         //           '. Sub-Total:'+TotalesSubTotalScreen.AsString+
         //           '. Itbis:'+rxVentaitbi.AsString+
         //           '. Prepago Aplicado:'+rxPrepagoAplicadoMonto.AsString,mtError,[mbOk],0);
         result:=False;
         if ((Totalestotalneto.Value +TotalesMontoDescItems.Value+rxPrepagoAplicadoMonto.Value) = TotalesSubTotalScreen.Value) then
         begin
           result:=true;
         end;
       end
    else
    if (qryValidaPosExtraVALOR.Value - TotalesSubTotalScreen.Value) > 1 then
    begin
      MessageDlg('Favor validar total neto.',mtError,[mbOk],0);
      NotificaErrorByEmail(
      'Usuario:'+GlbUsuarioLogueado+
      LF+CR+'Total Items:'+lblTotalItem.Caption+
      LF+CR+'Transacción no cuadra.' +
      LF+CR+'Cliente: '+qryClienteCODIGO_CTE.AsString+'-'+qryClienteNOMBRE_FACTURAR.Value+ ' '+
      LF+CR+'Monto Pantalla: '+
      TotalesSubTotalScreen.AsString+' Monto Calculado PosExtraDet:'+qryValidaPosExtraVALOR.AsString);
      result:=False;
    end else result:=true; BitBtn6.Enabled
  end else result :=true;

  if (rxventaMontoBruto.value > TotalesSubTotalScreen.Value) and (rxVenta.RecordCount = 1)
  and (GlbMSubTotalSinITBIS = 0) then
  begin
      MessageDlg('Favor validar total neto.',mtError,[mbOk],0);
      NotificaErrorByEmail(
      'Usuario:'+GlbUsuarioLogueado+
      LF+CR+'Total Items:'+lblTotalItem.Caption+
      LF+CR+'Transacción no cuadra.' +
      LF+CR+'Cliente: '+qryClienteCODIGO_CTE.AsString+'-'+qryClienteNOMBRE_FACTURAR.Value+ ' '+
      LF+CR+'Monto Bruto: '+rxventaMontoBruto.AsString+
      LF+CR+'Monto Pantalla: '+
      TotalesSubTotalScreen.AsString+' Monto Calculado PosExtraDet:'+qryValidaPosExtraVALOR.AsString
      +LF+CR+'RxSpinEdit1 = '+FloatToStr(RxSpinEdit1.Value)+' '
      +LF+CR+'Precio = '+rxVentaPrecio.AsSTring);
      result:=False;
  end;
  if (rxVenta.RecordCount = 1) then
  begin
    if ((Totalesitbis.Value=0) and (Abs(rxVentaitbi.value) > 0)) then
    begin
      //MessageDlg('Itbis recalculado, click en Devolucion nuevamente.',mtError,[mbOk],0);
      GlbCalculado:=False;
      DBEdit2Exit(Self);
      Result:=False;
    end else
    if Abs(abs(rxVentaMontoNeto.Value+Abs(TotalesRecargo.Value)) - Abs(Totalestotalneto.Value)) > 1 then
    begin
      GlbCalculado:=False;
      DBEdit2Exit(Self);
      if Abs(abs(rxVentaMontoNeto.Value) - Abs(Totalestotalneto.Value)) > 1 then
      begin
      MessageDlg('Favor validar total neto.',mtError,[mbOk],0);
      NotificaErrorByEmail(
      'Usuario:'+GlbUsuarioLogueado+
      LF+CR+'Total rxVentaMontoNeto.Value:'+rxVentaMontoNeto.Asstring+
      LF+CR+'Total Items:'+lblTotalItem.Caption+
      LF+CR+'Transacción no cuadra.' +
      LF+CR+'Cliente: '+qryClienteCODIGO_CTE.AsString+'-'+qryClienteNOMBRE_FACTURAR.Value+ ' '+
      LF+CR+'Monto Bruto: '+rxventaMontoBruto.AsString+
      LF+CR+'Monto Pantalla: '+
      TotalesSubTotalScreen.AsString+' Monto Calculado PosExtraDet:'+qryValidaPosExtraVALOR.AsString
      +LF+CR+'RxSpinEdit1 = '+FloatToStr(RxSpinEdit1.Value)+' '
      +LF+CR+'Precio = '+rxVentaPrecio.AsSTring);
      result:=False;
      end;
    end else
    if panelTempPrecioLevels.Visible then
    begin
      {case RxSpinEdit1.AsInteger of
      1: begin
           if (rxVentaLevelPrecio.Value <> 1) then
           begin
             MessageDlg('Favor verificar precio y nivel.',mtError,[mbOk],0);
             result:=False;
           end;
         end;
      2: begin
           if (rxVentaLevelPrecio.Value <> 2) then
           begin
             MessageDlg('Favor verificar precio y nivel.',mtError,[mbOk],0);
             result:=False;
           end;
         end;
      3: begin
           if (rxVentaLevelPrecio.Value <> 3) then
           begin
             MessageDlg('Favor verificar precio y nivel.',mtError,[mbOk],0);
             result:=False;
           end;
         end;
      4: begin
           if (rxVentaLevelPrecio.Value <> 4) then
           begin
             MessageDlg('Favor verificar precio y nivel.',mtError,[mbOk],0);
             result:=False;
           end;
         end;
      end;}
    end;//if panelTempPrecioLevels.Visible then
  end;
end;

procedure TfrmProcVentaRapida.MedicamentosControlados1Click(
  Sender: TObject);
begin
  //LogProcedure('TfrmProcVentaRapida.MedicamentosControlados1Click');
  frmMedicamentoDNCD:=TfrmMedicamentoDNCD.Create(nil);
  try
    frmMedicamentoDNCD.ShowModal;
  finally
  frmMedicamentoDNCD.free;
  frmMedicamentoDNCD:=Nil;
  end;
end;

procedure TfrmProcVentaRapida.Cobertura1Click(Sender: TObject);
begin
  //LogProcedure('TfrmProcVentaRapida.Cobertura1Click');
  frmCoberturaVtaARS:=TfrmCoberturaVtaARS.Create(Nil);
  try
    if rxCobertura.State = dsInactive then
    rxCobertura.Open;

    frmCoberturaVtaARS.Showmodal;
  finally
  frmCoberturaVtaARS.free;
  frmCoberturaVtaARS:=nil;
  end;
end;

procedure TfrmProcVentaRapida.ProcInsertarDatosVtaSeguro(numtrn:integer);
begin
  //LogProcedure('TfrmProcVentaRapida.ProcInsertarDatosVtaSeguro');
  if rxCobertura.state = dsInactive then exit;
  if rxCobertura.recordCount = 0 then exit;
  rxCobertura.First;
  dmventas.tblVentasARS.close;
  dmventas.tblVentasARS.params[0].value:= ExtraerFecha(GlbFechaTrnDiaria);
  dmventas.tblVentasARS.open;
  while not rxCobertura.eof do
  begin
    dmventas.tblVentasARS.Append;
    dmventas.tblVentasARSNUMERO_TRN.Value:= numtrn;
    dmventas.tblVentasARSIDARS.Value     := rxCoberturaIDARS.Value;
    dmventas.tblVentasARSFECHA.Value     := ExtraerFecha(GlbFechaTrnDiaria);
    dmventas.tblVentasARSNOMBRE_MEDICO.Value   := rxCoberturaNombre_Medico.Value;
    dmventas.tblVentasARSNUM_AUTORIZACION.Value:= rxCoberturaNum_Autorizacion.Value;
    dmventas.tblVentasARSAFILIADO.Value        := rxCoberturaAfiliado.Value;
    //dmventas.tblVentasARSCONTACTO
    dmventas.tblVentasARSESPECIALIDAD.Value    := rxCoberturaEspecialidad.Value;
    dmventas.tblVentasARSDIAGNOSTICO.Value     := rxCoberturaDiagnostico.Value;
    dmventas.tblVentasARSMONTO_COBERTURA.Value := rxCoberturaMontoCobertura.Value;
    dmventas.tblVentasARSMONTO_RECLAMADO.Value := rxCoberturaMontoTotal.Value;
    dmventas.tblVentasARSPorc_Cobertura.Value  :=rxCoberturaAplicaDesc.Value;
    dmventas.tblVentasARSPAGO_AFILIADO.Value :=  rxCoberturaMontoAsegurado.Value;

    dmventas.tblVentasARSEXEQUATUR.Value  := rxCoberturaExequatur.Value;
    dmventas.tblVentasARSSTATUS.Value     := 'A';
    dmventas.tblVentasARS.Post;
    dmventas.tblVentasARS.ApplyUpdates;
    if not dmventas.tblVentasARS.Transaction.InTransaction then
    dmventas.tblVentasARS.Transaction.StartTransaction;
    try
      dmventas.tblVentasARS.Transaction.CommitRetaining;
    except
    dmventas.tblVentasARS.Transaction.RollbackRetaining;
    end;
    rxCobertura.Next;
  end;
end;

procedure TfrmProcVentaRapida.BitBtn33Click(Sender: TObject);
begin
  //LogProcedure('TfrmProcVentaRapida.BitBtn33Click');
  if (rxVenta.recordcount = 0) then exit;
  if tablaPropietarioCodigoPropietario.IsNull or
  (tablaPropietarioCodigoPropietario.Value = 0) then
  begin
    MessageDlg('Favor indicar cliente.', mtError, [mbOK], 0);
    if isShowing then
    rxdbLookupCte.SetFocus;
    Exit;
  end;

  if not ValidarDobleRegPago then exit;
  valPgoARS:=True;
  if rxCobertura.Recordcount > 0 then
  rxCobertura.EmptyTable;
  frmCoberturaVtaARS:=TfrmCoberturaVtaARS.Create(Nil);
  try
    if rxCobertura.State = dsInactive then
    rxCobertura.Open;
    if rxCobertura.Recordcount = 0 then
    rxCobertura.Append
    else
    rxCobertura.Edit;
    if not qryClienteNSS.IsNull then
    rxCoberturaAfiliado.Value  := qryClienteNSS.Value;
    rxCoberturaMontoTotal.Value:= Totalestotalneto.Value;

    frmCoberturaVtaARS.Showmodal;
    if frmProcVentaRapida.rxCobertura.State in [dsEdit, dsInsert] then
    frmProcVentaRapida.rxCobertura.Post;
    valPgoARS:=False;
  finally
  frmCoberturaVtaARS.Free;
  frmCoberturaVtaARS:=Nil;
  end;
  BitBtn25Click(Self);
  valPgoARS:=True;
  //Final

  //Edit1.Text:= rxCoberturaMontoTotal.AsString;
  //BitBtn2Click(Self);
  //Edit1Exit(Self);
end;

procedure TfrmProcVentaRapida.rxCoberturaMontoCoberturaChange(
  Sender: TField);
begin
  //LogProcedure('TfrmProcVentaRapida.rxCoberturaMontoCoberturaChange');
  rxCoberturaMontoAsegurado.Value:=
  rxCoberturaMontoTotal.Value  -
  rxCoberturaMontoCobertura.Value;
end;
procedure TfrmProcVentaRapida.InsertaBalanceARS(monto: Real;tDoc:smallint;codcte:integer);
begin
  //LogProcedure('TfrmProcVentaRapida.InsertaBalanceARS');
  if dmcxc.qryBalanceCtes.state = dsInactive then
  dmcxc.qryBalanceCtes.Open;

  if not dmcxc.QrybalanceCtes.Locate('CODIGO;SERVICIO;MONEDA',
     VarArrayOf([codcte, 0, 1]),[]) then
  Begin
  dmcxc.qryBalanceCtes.Append;
  dmcxc.qryBalanceCtesCODIGO.Value   := codcte;
  dmcxc.qryBalanceCtesSERVICIO.Value := 0;
  if TotalesMoneda.isNull then
  dmcxc.qryBalanceCtesMONEDA.Value   := '1'
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
  dmcxc.qryBalanceCtesFECHA_BCE.Value := ExtraerFecha(GlbFechaTrnDiaria);//dmCxc.qryProcServfecha.Value;
  dmcxc.qryBalanceCtesFECHA_IN.Value  := Now;
  dmcxc.qryBalanceCtesIN_POR.Value    := StrUserName;
  if (tDoc = 1) or (tDoc = 3) then
  begin
   dmcxc.qryBalanceCtesBALANCE_ACT.Value:= Monto;
   dmcxc.qryBalanceCtesDEBITO_MES.Value := Monto;
   dmcxc.qryBalanceCtesDEBITO_ACM.Value := Monto;
  end else
  if (tDoc = 2) Or (tDoc = 4) or (tDoc = 5) then
  begin
    if (tDoc = 4) And ((tDoc = 1) ) then
    begin
      dmcxc.qryBalanceCtesBALANCE_ACT.Value:= Monto;
      dmcxc.qryBalanceCtesDEBITO_MES.Value := Monto;
      dmcxc.qryBalanceCtesDEBITO_ACM.Value := Monto;
    end else
    begin
      dmcxc.qryBalanceCtesBALANCE_ACT.Value:=
      dmcxc.qryBalanceCtesBALANCE_ACT.Value - monto;
      dmcxc.qryBalanceCtesCREDITO_MES.Value:= monto;
      dmcxc.qryBalanceCtesCREDITO_ACM.Value:= monto;
      dmcxc.qryBalanceCtesFECHA_ULT_PAGO.Value:= now;
    end;
  end;
  end else //edit balance cte
  begin
    dmcxc.qryBalanceCtes.Edit;
    dmcxc.qryBalanceCtesFECHA_BCE.Value  := ExtraerFecha(GlbFechaTrnDiaria);
    dmcxc.qryBalanceCtesBALANCE_ANT.Value:=dmcxc.qryBalanceCtesBALANCE_ACT.Value;
    dmcxc.qryBalanceCtesBALANCE_ACT.Value:=//+
    dmcxc.qryBalanceCtesBALANCE_ACT.Value + Monto;//dmCxc.tblTransCxcVALOR_DOCUMENTO.Value;
    dmcxc.qryBalanceCtesDEBITO_MES.Value:=//+
    dmcxc.qryBalanceCtesDEBITO_MES.Value + Monto;//dmCxc.tblTransCxcvalor_documento.Value;
    dmcxc.qryBalanceCtesDEBITO_ACM.Value:=//+
    dmcxc.qryBalanceCtesDEBITO_ACM.Value + Monto;//dmCxc.tblTransCxcvalor_documento.Value;
    dmcxc.qryBalanceCtesFECHA_MOD.Value := now;
    dmcxc.qryBalanceCtesMOD_POR.Value := strusername;
  end;

  GlbSalvarQuery(dmcxc.qryBalanceCtes);
  if Not dmcxc.qryBalanceCtes.Transaction.InTransaction then
  dmcxc.qryBalanceCtes.Transaction.StartTransaction;
  try
    dmcxc.qryBalanceCtes.Transaction.CommitRetaining;
  except
  dmcxc.qryBalanceCtes.Transaction.RollbackRetaining;
  end;
end;

function TfrmProcVentaRapida.ChequeaSecuencia: Boolean;
begin
  //LogProcedure('TfrmProcVentaRapida.ChequeaSecuencia');
  if GlbSecIgualesCashCredito = 0 then
  begin
    result:=true;
    exit;
  end;
  try
    result:=True;
    qryChequeaSec.close;
    qryChequeaSec.open;
    if (((qryChequeaSecSEC_CACH.Value = 0) or
       (qryChequeaSecSEC_CREDITO.Value = 0)) and
       (not qryChequeaSecmax_numero_master.IsNull)) then
    begin
       MessageDlg('Antes de facturar, favor verificar secuencia'+LF+CR+'para factura al contado y credito',mtError,[mbok],0);
       WriteToLog('Favor verifique secuencia factura contado y a credito.');
       result := False;
    end else
    result:=true;
  except on E : Exception do
      begin
        if GlbEsDebugFiscal = 1 then
        WriteToLog('Favor verifique secuencia factura contado y a credito.'+ e.Message);
      end;
    end;
end;

procedure TfrmProcVentaRapida.btnVerSecCertificadosClick(Sender: TObject);
begin
  //LogProcedure('TfrmProcVentaRapida.btnVerSecCertificadosClick');
  if tablaPropietarioCodigoPropietario.IsNull then
  begin
    MessageDlg('Favor asignar cliente?', mtInformation, [mbok],0);
    Exit;
  end;
  frmInvCertificados:=TfrmInvCertificados.Create(Nil);
  try
    frmInvCertificados.chkBoxAsignarCte.Visible:=True;
    frmInvCertificados.edtCodCliente.Text:=tablaPropietarioCodigoPropietario.AsString;
    frmInvCertificados.edtCodClienteExit(Self);
    frmInvCertificados.btnAsignarSec.Visible:= True;
    frmInvCertificados.chkBoxAsignarCte.Checked:= True;
    if frmInvCertificados.ShowModal = mrOk then
    begin
      if Totales.State = dsBrowse then Totales.Edit;
      TotalesReferenciaCte.Value:= IntToStr(frmInvCertificados._secCert);
      if frmInvCertificados.chkBoxAsignarCte.Checked then
      ProcAsignarClienteACert(StrToInt(frmInvCertificados.edtCodCliente.Text))
      else
      ProcAsignarClienteACert(tablaPropietarioCodigoPropietario.Value);
    end;
  finally
  frmInvCertificados.Free;
  frmInvCertificados:= Nil;
  end;
end;

procedure TfrmProcVentaRapida.DBEdit8Exit(Sender: TObject);
begin
  //LogProcedure('TfrmProcVentaRapida.DBEdit8Exit');
  if (TotalesReferenciaCte.Value = '') OR
     (TotalesReferenciaCte.IsNull) then Exit;
  if GLBSAM = 1 then
  begin
    frmInvCertificados:=TfrmInvCertificados.Create(Nil);
    try
      frmInvCertificados.btnAsignarSec.Visible:=True;
      if (TotalesReferenciaCte.AsInteger >
      frmInvCertificados.tblInvCertificadosSECUENCIA_FINAL.Value) then
      begin
        MessageDlg('Secuencia actual excede limite permitido, verifique.', mtInformation, [mbOk], 0);
        DBEdit8.SetFocus;
      end else
      if (TotalesReferenciaCte.AsInteger <
      frmInvCertificados.tblInvCertificadosSECUENCIA_INICIAL.Value) then
      begin
        MessageDlg('Secuencia actual excede limite permitido, verifique.', mtInformation, [mbOk], 0);
        DBEdit8.SetFocus;
      end;
    finally
    frmInvCertificados.free;
    frmInvCertificados:=nil;
    end;
  end;
end;

procedure TfrmProcVentaRapida.ProcActualizaSecCertSAM(sec: integer);
begin
  //LogProcedure('TfrmProcVentaRapida.ProcActualizaSecCertSAM');
  GlbModeEdit:=True;
  frmInvCertificados:=TfrmInvCertificados.Create(Nil);
  try
    rxCertificados.First;
    while not rxCertificados.Eof do
    begin
      frmInvCertificados.tblInvCertCodcte.Close;
      frmInvCertificados.tblInvCertCodcte.Params[0].Value:= rxCertificadosNumeroCerf.Value;
      frmInvCertificados.tblInvCertCodcte.Open;
      frmInvCertificados.tblInvCertCodcte.First;
      if frmInvCertificados.tblInvCertCodcte.RecordCount = 1 then
      begin
        frmInvCertificados.tblInvCertCodcte.Edit;
        frmInvCertificados.tblInvCertCodcteCODIGO_CLIENTE.Value:=rxCertificadosCodigoCte.Value;
        frmInvCertificados.tblInvCertCodcteFECHA_MOD.Value:=now;
        frmInvCertificados.tblInvCertCodcteMOD_POR.Value:= strusername;
        
        GlbSalvarQuery(frmInvCertificados.tblInvCertCodcte);
      end;

      rxCertificados.Next;
    end;

    frmInvCertificados.qryBuscarSec.Close;
    frmInvCertificados.qryBuscarSec.Params[0].value:= TotalesReferenciaCte.AsInteger;
    frmInvCertificados.qryBuscarSec.Open;
    frmInvCertificados.tblInvCert.Close;
    frmInvCertificados.tblInvCert.Open;
    if frmInvCertificados.tblInvCert.Locate('CODIGO',
    frmInvCertificados.qryBuscarSecCODIGO.Value,[]) then
    begin
      frmInvCertificados.tblInvCert.Edit;
      frmInvCertificados.tblInvCertSECUENCIA_ACTUAL.Value:=
      frmInvCertificados.tblInvCertSECUENCIA_ACTUAL.Value + 1;
      GlbSalvarQuery(frmInvCertificados.tblInvCert);
    end;
  finally
  frmInvCertificados.free;
  frmInvCertificados:=Nil;
  end;
  GlbModeEdit:=False;
end;

procedure TfrmProcVentaRapida.ProcAsignarClienteACert(codte: integer);
var
  x: Integer;
  sCert : String;
begin
  //LogProcedure('TfrmProcVentaRapida.ProcAsignarClienteACert');
  if frmInvCertificados.RxDBGrid2.SelectedRows.Count > 0 then
  begin
    rxCertificados.Close;
    rxCertificados.Open;
    with frmInvCertificados.RxDBGrid2.DataSource.DataSet do
    begin
      For x := 0 to frmInvCertificados.RxDBGrid2.SelectedRows.Count - 1 do
      begin
        GotoBookmark(Pointer(frmInvCertificados.RxDBGrid2.SelectedRows.Items[x]));
        rxCertificados.Append;
        rxCertificadosCodigoCte.Value := codte;
        rxCertificadosNumeroCerf.Value:= frmInvCertificados.tblInvCertificadosDetNUMERO_CERTIFICADO.Value;
        rxCertificados.Post;
        if (x = 0) then
        sCert:=rxCertificadosNumeroCerf.AsSTring
        else
        sCert:=sCert + ','+ rxCertificadosNumeroCerf.AsString;
        //rxVentaDescripcionEspecial.Value:=
      end;
    end;
    rxVenta.Edit;
    DBMemo1.Lines.Add('Certificados:'+sCert);
    rxVenta.Post;
    rxCertificados.First;
    if (not rxCertificadosNumeroCerf.IsNull) then
    begin
      if Totales.State = dsBrowse then
      begin
        Totales.Edit;
        TotalesReferenciaCte.Value:= rxCertificadosNumeroCerf.AsString;
        Totales.Post;
      end else
      if Totales.State = dsEdit then
      TotalesReferenciaCte.Value:=rxCertificadosNumeroCerf.AsString;
    end;
  end;
end;

procedure TfrmProcVentaRapida.DBEdit6DblClick(Sender: TObject);
var
  guardarRec : TBookMark;
begin
//  LogProcedure('TfrmProcVentaRapida.DBEdit6DblClick');
  guardarRec := qryCliente.GetBookmark;
  qryCliente.Close;
  qryCliente.EnableControls;
  qryCliente.Open;
  if Assigned(guardarRec) then
  begin
    qryCliente.GotoBookmark(guardarRec);
    qryCliente.FreeBookmark(guardarRec);
  end;
  //if tablapropietarioCodigoPropietario.IsNull or
  //   (tablapropietarioCodigoPropietario.Value = 0) then
     MaestroCliente1Click(Self);  
end;

Function TfrmProcVentaRapida.VerificaNIFTExiste : Boolean;
begin
  //LogProcedure('TfrmProcVentaRapida.VerificaNIFTExiste');
  IF GlbActivaIFiscal = 0 then result:= false;
  dmventas.qryNIFCtrlConT.Close;
  dmventas.qryNIFCtrlConT.Open;
  dmventas.qryNIFCtrlConT.first;
  if dmventas.qryNIFCtrlConT.RecordCount > 0 then
  result:= True
  else result:= False;
end;

procedure TfrmProcVentaRapida.Label22Click(Sender: TObject);
begin
  LogProcedure('TfrmProcVentaRapida.Label22Click');
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
  LogProcedure('TfrmProcVentaRapida.InsertarPolizaCliente');
  try
    if (rxVentaNUM_IDENT.Value = '') or (rxVentaNUM_IDENT.IsNull) then exit;
  if tblPolizaCte.State = dsInactive then tblPolizaCte.Open;
  if (tablaPropietarioCodigoPropietario.Value > 0) and
     (not rxVentaNUM_IDENT.IsNull) then
  begin
    if not tblPolizaCte.Locate('CODIGO_CTE;NUM_POL',vararrayof([tablaPropietarioCodigoPropietario.Value,
    rxVentaNUM_IDENT.AsInteger]),[]) then
    begin
      tblPolizaCte.Append;
      tblPolizaCteCODIGO_CTE.Value:= tablaPropietarioCodigoPropietario.Value;
      tblPolizaCteNUM_POL.Value   := rxVentaNUM_IDENT.AsInteger;
      tblPolizaCteSTATUS.Value    := 'A';
      GlbSalvarQuery(tblPolizaCte);
    end;
  end;
  except
  end;

end;

procedure TfrmProcVentaRapida.ProcesaDatosVehiculoPoliza(_existe:boolean);
begin
  LogProcedure('TfrmProcVentaRapida.ProcesaDatosVehiculoPoliza');
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

    dmClientes.tblClientes.Tag := -1;
    dmClientes.tblClientes.DisableControls;
    if not dmClientes.tblClientes.Locate('codigo_cte', tablaPropietarioCodigoPropietario.Value,[]) then
    begin
      MessageDlg('Cliente no encontrado verifique codigo.', mtInformation, [mbOK], 0);
      FreeAndNil(frmClientes);
      Exit;
    end;

    dmClientes.tblDatosVehiculo.Close;
    dmClientes.tblDatosVehiculo.Params[0].Value:=dmclientes.tblClientesCODIGO_CTE.Value;
    dmClientes.tblDatosVehiculo.open;
    frmClientes.PageControl1.ActivePageIndex:=4;
    if not _existe then
    begin
      frmclientes.RxDBGrid1.Enabled:=False;
      dmClientes.tblDatosVehiculo.Append;//tablaPropietarioCodigoPropietario.Value;
      dmClientes.tblDatosVehiculoCODIGO_CTE.Value:= tablaPropietarioCodigoPropietario.Value;
      dmClientes.tblDatosVehiculoNUMPOL.Value := rxVentaNUM_IDENT.AsInteger;
      dmClientes.tblDatosVehiculoFECHA_IN.Value:=now;
      dmClientes.tblDatosVehiculoTIPO_AFILIADO.Value:= TotalesTipoAfiliado.Value;
      dmClientes.tblDatosVehiculoIN_POR.Value:=trim(strusername);

      dmClientes.tblDatosVehiculoFECHA_VENCE_SEGURO.Value:= IncDay(TotalesFechaIniciaPoliza.Value,365);
      if (dmClientes.tblClientescodigo_cte.Value <> tablaPropietarioCodigoPropietario.Value) then
      dmClientes.tblClientes.Locate('codigo_cte', tablaPropietarioCodigoPropietario.Value,[]);
    end else
    begin
      if dmClientes.tblDatosVehiculo.Locate('NUMPOL',rxVentaNUM_IDENT.AsInteger,[]) then
      dmClientes.tblDatosVehiculo.Edit;
    end;
    frmClientes.Showmodal;
    if Totales.state = dsBrowse then Totales.Edit;
    TotalesidNumeroDVeh.Value:=dmClientes.tblDatosVehiculoNUMERO.Value;
  finally
  frmClientes.Free;
  frmClientes:=Nil;
  end;

  dmClientes.tblClientes.EnableControls;
  dmClientes.tblClientes.Tag := 0;
end;

procedure TfrmProcVentaRapida.dbFechaIniciaPolizaExit(Sender: TObject);
var
  nT : boolean;
begin
  LogProcedure('TfrmProcVentaRapida.dbFechaIniciaPolizaExit');
  if GLBSAM = 0 then Exit;
  if (rxVentaNUM_IDENT.Value = '') or (rxVentaNUM_IDENT.IsNull) then exit;
  dmventas.qryDatosVehPolizas.Close;
  if tablaPropietarioCodigoPropietario.Value > 0 then
  begin
    dmventas.qryDatosVehPolizas.Params[0].Value:=tablaPropietarioCodigoPropietario.Value;
    dmventas.qryDatosVehPolizas.Open;
    if not dmventas.qryDatosVehPolizas.Locate('NUMPOL',rxVentaNUM_IDENT.AsInteger,[]) then
    nT:=False;
    if not nT then
    if not dmventas.qryDatosVehPolizas.Locate('NUMPOL',rxVentaNUM_IDENT.AsInteger,[]) then
    nT:=False;
  end;
  if not Nt then
  begin
    if (not TotalesFechaIniciaPoliza.IsNull) then
    ProcesaDatosVehiculoPoliza(nT);
  end else
  begin
    if (GlbUsaFctMexico = 1) then
    begin
    if Not rxVentaNUM_IDENT.IsNull then
    begin
      frmConsultaCertAvanzada:=TfrmConsultaCertAvanzada.Create(nil);
      try
        if Totales.State = dsBrowse then
        Totales.Edit;
        frmConsultaCertAvanzada._usesqlBase1:= true;
        frmConsultaCertAvanzada.edtCodCte.SetInteger(tablaPropietarioCodigoPropietario.Value);
        frmConsultaCertAvanzada.BitBtn3Click(Self);
        frmConsultaCertAvanzada.qryDatos.Locate('IDNUMERODVEH', rxVentaNUM_IDENT.Value,[]);
        frmConsultaCertAvanzada.qryDatos.Locate('NUMERO_CERTIFICADO', rxVentaNUM_IDENT.Value,[]);
        if frmConsultaCertAvanzada.ShowModal = mrOk then
        begin
          TotalesidNumeroDVeh.Value:=frmConsultaCertAvanzada.qryDatosIDNUMERODVEH.Value;
          TotalesTipoAfiliado.Value:=frmConsultaCertAvanzada.qryDatosTIPO_AFILIADO.Value;
        end else
        TotalesidNumeroDVeh.AsVariant:=null;
      finally
      frmConsultaCertAvanzada.free;
      frmConsultaCertAvanzada:=nil;
      end;
    end;
    end;
  end;
end;

procedure TfrmProcVentaRapida.DBEdit16Change(Sender: TObject);
begin
  LogProcedure('TfrmProcVentaRapida.DBEdit16Change');
  if (rxVentaNUM_IDENT.Value = '') or (rxVentaNUM_IDENT.IsNull) then exit;
  if TotalesFechaIniciaPoliza.IsNull then Exit;
    
  if ((rxVentaNUM_IDENT.AsInteger) > 0)  then
  dbFechaIniciaPolizaExit(Self);
end;

procedure TfrmProcVentaRapida.cboxUseLogoChange(Sender: TObject);
begin
  LogProcedure('TfrmProcVentaRapida.cboxUseLogoChange');
  if (GlbSam = 0) then exit;
  if qryLogoTipoAfiliado.Locate('DESCRIPCION', cboxUseLogo.Text,[]) then
  begin
    GlbLogoServSam:=qryLogoTipoAfiliadoruta_logo.value;
    if Totales.State = dsBrowse then
    begin
      Totales.Edit;
      TotalesTipoAfiliado.Value:=qryLogoTipoAfiliadoIDTIPO.Value;
      Totales.Post;
    end else
    if Totales.State in [dsInsert, dsEdit] then
    TotalesTipoAfiliado.Value:=qryLogoTipoAfiliadoIDTIPO.Value;
  end;
end;

{procedure TfrmProcVentaRapida.ProcSetPathlogoTipoServicio(tipo:smallint);
begin
  LogProcedure('TfrmProcVentaRapida.ProcSetPathlogoTipoServicio');
  if (GLBSAM = 0) then Exit;
  if qryLogoTipoAfiliado.Locate('IDTIPO', tipo,[]) then
  GlbLogoServSam:=qryLogoTipoAfiliadoruta_logo.Value
  else
  if qryLogoTipoAfiliado.Locate('IDTIPO', 1,[]) then
  GlbLogoServSam:=qryLogoTipoAfiliadoruta_logo.Value;
end;}

procedure TfrmProcVentaRapida.edtCodigoDblClick(Sender: TObject);
begin
  LogProcedure('TfrmProcVentaRapida.edtCodigoDblClick');
  ConsultaGeneral1Click(Self);
end;

procedure TfrmProcVentaRapida.ProcFacturaRecurrente(_codCte: Integer;
  Fecha: TDateTime; _numTrn: Integer;_numfact:integer;_ruta:string;_xnumprogrec:integer);
begin
  LogProcedure('TfrmProcVentaRapida.ProcFacturaRecurrente');
  dmFactura.tblFactRecurrentes.Close;
  dmFactura.tblFactRecurrentes.Params[0].Value:= ExtraerFecha(fecha);
  dmFactura.tblFactRecurrentes.Params[1].Value:= ExtraerFecha(fecha);
  dmFactura.tblFactRecurrentes.Open;
  if not dmFactura.tblFactRecurrentes.Locate('NUMERO_TRN;CODIGO_CTE',
  VarArrayOf([_numTrn,_codCte]),[]) then
  begin
    dmFactura.tblFactRecurrentes.Append;
    dmFactura.tblFactRecurrentesFECHA_GENERADA.Value:= ExtraerFecha(fecha);
    dmFactura.tblFactRecurrentesCODIGO_CTE.Value := _codCte;
    dmFactura.tblFactRecurrentesNUMERO_FACT.Value:= _numfact;
    dmFactura.tblFactRecurrentesNUMERO_TRN.Value := _numTrn;
    dmFactura.tblFactRecurrentesRUTA.Value       := _ruta;
    dmFactura.tblFactRecurrentesSTATUS.Value := 'A';
    dmFactura.tblFactRecurrentesNUMERO_PROG.Value:= _xnumprogrec;
    GlbSalvarQuery(dmFactura.tblFactRecurrentes);
  end;
end;

procedure TfrmProcVentaRapida.edtObservacionDblClick(Sender: TObject);
begin
  LogProcedure('TfrmProcVentaRapida.edtObservacionDblClick');
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

procedure TfrmProcVentaRapida.DescargarVehiculoDev(numerotrn: integer);
//var
  //stpProcDevVeh: TIBStoredProc;
begin
  LogProcedure('TfrmProcVentaRapida.DescargarVehiculoDev');
  //if not Assigned(stpProcDevVeh) then
  //stpProcDevVeh:= TIBStoredProc.Create(nil);
  //stpProcDevVeh.Database:=dmConectar.IBDatabase1;
  //stpProcDevVeh.StoredProcName :='PROC_DEVOLUCIONMUTUR';
  stpProcDevVeh.Close;
  stpProcDevVeh.params[0].Value:=numerotrn;
  stpProcDevVeh.ExecProc;
  if not stpProcDevVeh.Transaction.InTransaction then
  stpProcDevVeh.Transaction.StartTransaction;
  try
    stpProcDevVeh.Transaction.CommitRetaining;
  except
  stpProcDevVeh.Transaction.RollbackRetaining;
  end;
end;

procedure TfrmProcVentaRapida.CerrarPrograma1Click(Sender: TObject);
begin
  LogProcedure('TfrmProcVentaRapida.CerrarPrograma1Click');
  if rxVenta.RecordCount = 0 then
  Application.Terminate;
end;

procedure TfrmProcVentaRapida.ImprimirEnFormatoPDF(idmodulo:integer;idreporte:integer);
begin
  LogProcedure('TfrmProcVentaRapida.ImprimirEnFormatoPDF');
  GlbMuestraPDF:=False;
  dmDatos.qryImpresoras.Close;
  dmDatos.qryImpresoras.Open;
  if dmDatos.qryImpresoras.Locate('IDMODULO;IDREPORTE',
  VarArrayOf([idmodulo,idreporte]),[]) then     //Factura/Recibo Punto Venta
  //VarArrayOf([1,6]),[]) then     //Factura/Recibo Punto Venta
  GlbNombreImpresora:=dmDatos.qryImpresorasNOMBRE_IMPRESORA.Value
  else
  GlbNombreImpresora:= ImpresoraDefecto;

  if (GlbNombreImpresora = '') then
  GlbNombreImpresora:= ImpresoraDefecto;

  if (GlbImpReciboSinPreg = 1) and (GlbImprimeReciboFact = 1) then
  begin
    GLBMostrarArchivo:=False;
    ReportExportPDF(qckRepReciboReimpTicketSurtidoraNew,GlbRutaRecibos+IntToStr(dmReportes.qryViewVentasMastNUMERO.Value)+'.pdf');

    Parametros:=PChar(Format('/PRINTERNAME="%s" /FILENAME=%s ',[GlbNombreImpresora,GlbNombreArchivo]));
    WriteToLog('Parametro: ' +GlbIdesiPrint + ' '+Parametros);
    ExecuteResult := ShellExecute(0, nil, PChar(GlbIdesiPrint), PChar(parametros), nil, SW_HIDE);
    if ExecuteResult <= 32 then
    begin
      WriteToLog('Error: ' + IntToStr(ExecuteResult));
      WriteToLog('Verifique ejecutable IdesiPrint: ' + IntToStr(ExecuteResult));
      WriteToLog('Parametros:'+Parametros);
    end;
  end
  else
  if MessageDlg('Imprimir?',mtInformation, [mbYes, mbNo], 0)=mryes then   //Aqui revisar impresion factura larga
  begin
    if (GlbImprimeReciboFact = 1) then
    begin
      GLBMostrarArchivo:=False;
      ReportExportPDF(qckRepReciboReimpTicketSurtidoraNew,GlbRutaRecibos+IntToStr(dmReportes.qryViewVentasMastNUMERO.Value)+'.pdf');
      Parametros:=PChar(Format('/PRINTERNAME="%s" /FILENAME=%s ',[GlbNombreImpresora,GlbNombreArchivo]));
      WriteToLog('Parametro: ' +GlbIdesiPrint + ' '+Parametros);
      ExecuteResult := ShellExecute(0, nil, PChar(GlbIdesiPrint), PChar(parametros), nil, SW_HIDE);
      if ExecuteResult <= 32 then
      begin
        WriteToLog('Error: ' + IntToStr(ExecuteResult));
        WriteToLog('Verifique ejecutable IdesiPrint: ' + IntToStr(ExecuteResult));
        WriteToLog('Parametros:'+Parametros);
      end;
    end;
  end else
  qckRepReciboReimpTicketSurtidoraNew.Preview;

  reciboImpreso:=True;
  GlbMuestraPDF:=True;
end;

procedure TfrmProcVentaRapida.btnAsignarVehClick(Sender: TObject);
begin
  LogProcedure('TfrmProcVentaRapida.btnAsignarVehClick');
  //if (GlbSolicitaDVeh = 1) then
  //begin
  if (rxVenta.recordcount = 0) then exit;
  if (EsDevolucion) then exit;//no se necesita
    if GlbMutur = 1 then
    begin
      if tablaPropietarioCodigoPropietario.IsNull or
      (tablaPropietarioCodigoPropietario.Value = 0 ) then
      begin
        MessageDlg('Favor indicar el cliente debes indicar el cliente',mtWarning,[mbok],0);
        rxdbLookupCte.SetFocus;
        exit;
      end;
      GlbTipoTransMotores:=1;
      frmBuscarMotor:=TfrmBuscarMotor.Create(Nil);
      try
        frmBuscarMotor._Tipo := 1;
        frmBuscarMotor.EsVenta:=1;

        if (xCodProd > 0) then
        frmBuscarMotor.CodProd:= xCodProd
        else
        if not rxVentaCodArticulo.IsNull then
        frmBuscarMotor.CodProd:= rxVentaCodArticulo.Value
        else if (edtCodigo.Text <> '') then
        begin
          try
            frmBuscarMotor.CodProd:= StrToInt(edtCodigo.Text);
          except
          end;
        end;
        //ShowMessage('Codigo Prod:'+IntToStr(xCodProd)+ ' ' + IntToStr(frmBuscarMotor.CodProd));
        frmBuscarMotor.RadioGroup1.ItemIndex := 6;
        frmBuscarMotor.EsVenta:=1; //EsVenta
        frmBuscarMotor.BitBtn1Click(Self);
        if frmBuscarMotor.ShowModal = mrOk then
        begin
          _chassisVeh:=frmBuscarMotor.qryMotoresEntradaCHASIS.Value;
          Totales.Edit;
          TotalesidNumeroDVeh.Value:= frmBuscarMotor.qryMotoresEntradaIDNUMEROVEH.Value;
          Label59.Caption:='Chassis:' + frmBuscarMotor.qryMotoresEntradaCHASIS.Value +
          ' Color:'+frmBuscarMotor.qryMotoresEntradaCOLOR.Value +
          ' Modelo:'+frmBuscarMotor.qryMotoresEntradaMODELO.Value;
          Totales.Post;
        end;
      finally
      frmBuscarMotor.Free;
      frmBuscarMotor:= Nil;
      end;
    end;
  //end;
end;

procedure TfrmProcVentaRapida.ConsultaPreventa;
var
  inicia,pflag : boolean;

begin
  LogProcedure('TfrmProcVentaRapida.ConsultaPreventa');
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
    TotalesTipoDeIngreso.Value:='01';
    if (GlbFactRecurrente) then
    TotalesPreAbono.Value:=_MontoPrepago;    
    TotalesSubTotal.Value:=0;
    Totalesitbis.Value   :=0;
    Totalesmontodesc.Value:=0;
    Totalestotalneto.Value:=0;
    Totalesmontorecibido.Value:=0;
    Totalesdevolucion.Value   :=0;
    if (GlbMonedaBase > 0) then
    TotalesMoneda.Value   := IntToStr(GlbMonedaBase)
    else
    TotalesMoneda.Value   := '1';
    Totales.Post;
    lblProcDev.Visible := False;
  end;
  frmConsultaPreVenta:=TfrmConsultaPreVenta.Create(Nil);
  try
    inicia:=False;
    if frmConsultaPreVenta.Showmodal = mrOk then
    begin
      if inicia = false then  //evitar doble carga
      begin
      inicia:=True;
      rxVenta.Close;
      rxVenta.Open;
      frmConsultaPreVenta.qryPreventaDet.First;
      edtObservacion.Text:=frmConsultaPreVenta.qryPreventaMasterNOMBRE_CLIENTE_GENERAL.Value;
      rxPreventa.Close;
      rxPreventa.Open;
      //open qryproductos
      AsignarSqlText('','','');
      pflag:=false;
      esCargaDatosFFood:=frmConsultaPreVenta.esCargaDatosFFood;
      if frmConsultaPreVenta.NumTicketFFood > 0 then
      NumTicketFFood:=frmConsultaPreVenta.NumTicketFFood;

      While Not frmConsultaPreVenta.qryPreventaDet.Eof do
      begin
        if (frmConsultaPreVenta.qryPreventaDetCANTIDAD.Value > 0)
        And (frmConsultaPreVenta.qryPreventaDetSTATUS_DET.Value = 'A') then
        begin
          rxVenta.Append;
          esInsertando:=True;
          rxVentaMoneda.Value:='1';
          RxSpeedButton1.Visible := True;
          CargarPreventa;
          if rxVenta.State In [dsInsert,dsEdit] then
          rxVenta.Post;
          tablaPropietario.Edit;
          tablaPropietarioCodigoPropietario.Value:= frmConsultaPreVenta.qryPreventaMasterCODIGO_CTE.Value;
          tablaPropietario.Post;
        end;
        pflag:=true;
        frmConsultaPreVenta.qryPreventaDet.Next;
      end;
      if pflag then
      begin
        if rxPreventa.state = dsInactive then
        rxPreventa.Open;
        frmConsultaPreVenta.qryPreventaDet.first;
        While Not frmConsultaPreVenta.qryPreventaDet.Eof Do
        begin
          rxPreventa.Append;
          rxPreventaNumero.Value   := frmConsultaPreVenta.qryPreventaMasterNUMERO.Value;
          rxPreventaSerie.Value    := frmConsultaPreVenta.qryPreventaDetSerie.Value;
          rxPreventaticket_id.Value:= frmConsultaPreVenta.qryPreventaMasterNUMERO.Value;
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
      end;//inicia
    end;
  finally
  frmConsultaPreVenta.Free;
  frmConsultaPreVenta:=Nil;
  end;
end;

procedure TfrmProcVentaRapida.BitBtn34Click(Sender: TObject);
begin
  LogProcedure('TfrmProcVentaRapida.BitBtn34Click');
  ConsultaPreventa;
end;

function TfrmProcVentaRapida.SetCantUnidad(codProd,
  _TipoUnidad: integer): Integer;
begin             
  LogProcedure('TfrmProcVentaRapida.SetCantUnidad');
  try
  qryLookCantXUnidad.Close;
  qryLookCantXUnidad.Params[0].Value:=_TipoUnidad;
  qryLookCantXUnidad.Open;
  qryLookCantXUnidad.first;
  if qryLookCantXUnidadCANTIDAD.Value > 0 then
  Result:=qryLookCantXUnidadCANTIDAD.Value
  else
  Result:=1;  
  except
  result:=1;
  end;  
end; 

procedure TfrmProcVentaRapida.ProcInsertarDetEfectivoC(numtrn,
  fpago: integer; monto: currency);
begin
  LogProcedure('TfrmProcVentaRapida.ProcInsertarDetEfectivoC');
  //Exit;//Se esta realizando como un abono a Cxc
  if (monto = 0) then exit;
  dmcxc.tblDetallePagos.Close;
  dmcxc.tblDetallePagos.Open;
  dmcxc.tblDetallePagos.Append;
  dmcxc.tblDetallePagosFECHA.Value :=GlbFechaTrnDiaria;
  dmcxc.tblDetallePagosTIPO.Value             := 1;//CONTADO
  dmcxc.tblDetallePagosTIPO_PAGO.Value        := fpago; //Efectivo
  dmcxc.tblDetallePagosSERIE_TRN.Value        := numtrn;

  dmcxc.tblDetallePagosGlbNumVtaPOS.Value  := GlbNumVtaPOS;
  dmcxc.tblDetallePagosAREA_TRANS.Value       := 1;//Ventas

  dmcxc.tblDetallePagosMonto_Pagado.Value     := monto;
  dmcxc.tblDetallePagos.Post;
  dmcxc.tblDetallePagos.ApplyUpdates;
  if not dmcxc.tblDetallePagos.Transaction.InTransaction then
  dmcxc.tblDetallePagos.Transaction.StartTransaction;
  try
    dmcxc.tblDetallePagos.Transaction.CommitRetaining;
  except
  dmcxc.tblDetallePagos.Transaction.RollbackRetaining;
  end;
end;

procedure TfrmProcVentaRapida.ProcGuardarDatosCoti(numeroTrnVta: integer);
begin
  //LogProcedure('TfrmProcVentaRapida.ProcGuardarDatosCoti');
  if (GlbFactRecurrente) then
  begin
    if (numeroTrnVta = 0) then exit;
    if dmPanaderia.tblPrecioCuadros.State in [dsEdit, dsBrowse] then
    begin
        dmPanaderia.tblPrecioCuadros.Edit;
        dmPanaderia.tblPrecioCuadrosNUMERO_TRN_VTA.Value:= numeroTrnVta;
        GlbSalvarQuery(dmPanaderia.tblPrecioCuadros);
    end;
  end;
end;

procedure TfrmProcVentaRapida.BitBtn35Click(Sender: TObject);
begin
  //LogProcedure('TfrmProcVentaRapida.BitBtn35Click');
  if dmCompania.tblCompania.State = dsInactive then
  dmCompania.tblCompania.open;
   try
  frmProcesarPrepago:=TfrmProcesarPrepago.Create(nil);
  try
    frmProcesarPrepago._codigoCte:= tablaPropietarioCodigoPropietario.Value;
    dmFactura.tblPrepagoCte.Close;
    dmFactura.tblPrepagoCte.Params[0].Value:= frmProcesarPrepago._codigoCte;
    dmFactura.tblPrepagoCte.Open;
      dmFactura.tblPrepagoCte.Append;
      dmFactura.tblPrepagoCteCODIGO_USR_CAJA.Value:= VarUsuarioGlb;
      dmFactura.tblPrepagoCteCODIGO_CTE.Value:=frmProcesarPrepago._codigoCte;
      dmFactura.tblPrepagoCteFECHA.Value := ExtraerFecha(GlbFechaTrnDiaria);

      dmFactura.tblPrepagoCteFPAGO.Value := 1;
      dmFactura.tblPrepagoCteSTATUS.Value:='A';
    frmProcesarPrepago.ShowModal;
  finally
  frmProcesarPrepago.free;
  frmProcesarPrepago:=Nil;
  end;
  except
  end;
  //t BitBtn27Click(Self);
  if not GlbCalculado then
   CalcularTotalesInterno;  
end;

function TfrmProcVentaRapida.GetNivelPrecioCuadros(
  codcte: integer): smallint;
begin
  LogProcedure('TfrmProcVentaRapida.GetNivelPrecioCuadros');
  qryLevelCPrecioCteC.close;
  qryLevelCPrecioCteC.open;
  if qryLevelCPrecioCteC.Locate('CODIGO_CTE',codcte,[]) then
  result := qryLevelCPrecioCteCUSARLEVELPRECIO.Value
  else result := 0;
end;

function TfrmProcVentaRapida.GetPrecioNivelCuadros(codProd: Integer;
  t: smallint): Currency;
begin
  LogProcedure('TfrmProcVentaRapida.GetPrecioNivelCuadros');
  QryPreciosC.Close;
  QryPreciosC.Params[0].Value:= codProd;
  QryPreciosC.Open;
  if QryPreciosC.Locate('Codigo', codProd,[]) then
  begin
    case t Of
    1: begin
         if QryPreciosCPRECIOVENTA1.Value > 0 then
         result := QryPreciosCPRECIOVENTA1.Value;
       end;
    2: begin
        if QryPreciosCPRECIOVENTA2.Value > 0 then
        result := QryPreciosCPRECIOVENTA2.Value;
       end;
    3:begin
        if QryPreciosCPRECIOVENTA3.Value > 0 then
        result := QryPreciosCPRECIOVENTA3.Value;
      end;
    4: begin
         if QryPreciosCPRECIOVENTA4.Value > 0 then
         result := QryPreciosCPRECIOVENTA4.Value;
      end;
    end;//case
  end;
end;

procedure TfrmProcVentaRapida.DBEdit18DblClick(Sender: TObject);
begin
  LogProcedure('TfrmProcVentaRapida.DBEdit18DblClick');
  FrmBuscarClientesPersonas:=TFrmBuscarClientesPersonas.Create(nil);
  try
    FrmBuscarClientesPersonas.CodigoCliente := -1;
    if FrmBuscarClientesPersonas.Showmodal = mrOk then
    begin
      if rxVenta.State In [dsBrowse] then
      rxVenta.Edit;
      rxVentaNUM_CONDUCE_CTE.AsVariant :=FrmBuscarClientesPersonas.CodigoCliente;
    end;
  finally
  FrmBuscarClientesPersonas.Free;
  FrmBuscarClientesPersonas:=Nil;
  end;
end;

procedure TfrmProcVentaRapida.DBEdit18Exit(Sender: TObject);
begin
  LogProcedure('TfrmProcVentaRapida.DBEdit18Exit');
  if (rxVentaNUM_CONDUCE_CTE.Value <> '') then
  begin
    BitBtn12.Visible:= True;
    BitBtn12.Enabled:=True;
    BitBtn12.bringtofront;
  end;
end;

procedure TfrmProcVentaRapida.ProcFactCrearFctFinanciamiento(
  codcte: integer);
var
 serieDoc:Integer;
 frecuencia:string;
 ValorNCF : String;
 serie_asignadoncf : Integer;
 xgenNcf : Boolean;
begin
  LogProcedure('TfrmProcVentaRapida.ProcFactCrearFctFinanciamiento');
  if rxVenta.recordcount = 0 then exit; //out of here
  if (rdgFactServicio.Checked and rdgFactVentaProducto.Checked)
  And (rxventa.RecordCount > 0) then
  begin
    MessageDlg('Favor indicar tipo de Operación', mtInformation, [mbOK], 0);
    if isShowing then
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
  if xGenNCf and CheckBox1.checked then
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
    TotalesCodCliente.Value:= codcte;

    qryCliente.Locate('CODIGO_CTE',codcte,[]);
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

    ProcesaFacturar(1, serieDoc, codcte);//xcodigocte);

    RxDBGrid1.EnableScroll;
    if not Assigned(frmFinanciamiento) then
    frmFinanciamiento:=TfrmFinanciamiento.Create(nil);
    if frmFinanciamiento.rxDatosFinanc.State = dsBrowse then
      frmFinanciamiento.rxDatosFinanc.Edit;
      frmFinanciamiento.rxDatosFinancNumeroFactura.Value:=serieDoc;
      //Aqui voy
      frmFinanciamiento.xNumeroTrn := rxVentaNumeroRecibo.Value;//aqui numero ventas master
      frmFinanciamiento.rxDatosFinanc.Post;
      frmFinanciamiento.ProcInsertarDatos;

      ProcFactCrearFctFinanciamiento(codcte);
      ProcFactCrarFctFincImprimir(serieDoc);

        if Totales.State = dsBrowse then
        begin
          Totales.Edit;
          TotalesPorcientoInteres.Value:= frmFinanciamiento.rxDatosFinancPorcInteres.Value;
          Totales.Post;
        end else
        if Totales.State in [dsEdit, dsInsert] then
        TotalesPorcientoInteres.Value:= frmFinanciamiento.rxDatosFinancPorcInteres.Value;
        Totalestotalneto.Value;
    frmFinanciamiento.Free;
    frmFinanciamiento:=Nil;
              
  rxVenta.EmptyTable;
  lblTotalItem.Caption:='Total Items:'+IntToStr(rxVenta.RecordCount);  
  Edit1.Text      := '';
  edtCodigo.Text  := '';
  pesoProd := '';
  BitBtn4.Enabled := False;
  ProcesandoVenta := False;
  Totales.EmptyTable;
  rxPagos.EmptyTable;
  if not edtCodigo.Focused then
    if not EsModificandoCotiza then
    begin
      if isShowing then
      begin
        edtCodigo.SetFocus;
        PostMessage(edtCodigo.Handle, WM_SETFOCUS, 0, 0);
      end;
    end;
  ActualizarPreventa;
  qryProdPorProveedor.Close;
  pnlPrecioProv.Visible:=False;
end;

procedure TfrmProcVentaRapida.ProcFactCrarFctFincImprimir(numfct: integer);
begin
  LogProcedure('TfrmProcVentaRapida.ProcFactCrarFctFincImprimir');
  dmFactura.qryVentaFactura.Close;
  dmfactura.qryVentaFacturaDet.Close;

  dmfactura.qryDatosTrncxc.Close;

  dmfactura.qryFactReimpMaster.Close;
  dmfactura.qryFactReimpMaster.Params[0].Value:=numfct;

   dmfactura.qryFactReimpDet.Close;
   dmfactura.qryFactReimpDet.Params[0].Value  :=numfct;
   dmfactura.qryFactReimpDet.Open;
   dmfactura.qryFactReimpDet.Last;
   dmfactura.qryFactReimpDet.Close;

   dmfactura.qryFactReimpMaster.Open;

   dmCompania.tblCompania.Close;
   dmCompania.tblCompania.Open;
   dmCompania.tblCompania.Locate('codigo',glbCia_Key,[]);

   ImprimeFactura8_5Farmacia(ipStpInsertVentMast.Params[0].Value,TipoVenta,'','Facturas');
end;

procedure TfrmProcVentaRapida.ImprimeFactraCXCFinc(numtrn: integer;tipo:string);
begin
  LogProcedure('TfrmProcVentaRapida.ImprimeFactraCXCFinc');
  frmConsultaFacturas:=TfrmConsultaFacturas.Create(Nil);
  try
    frmConsultaFacturas.rdgCredito.Checked := True;
    frmConsultaFacturas.EditN1.SetInteger(numtrn);

    frmConsultaFacturas.BitBtn1Click(Self);
    if dmFactura.qryVentaFactura.RecordCount = 0 then
    begin
      frmConsultaFacturas.rdgContado.Checked := True;
      frmConsultaFacturas.BitBtn1Click(Self);
    end;
    finally
    if Assigned(frmConsultaFacturas) then
    frmConsultaFacturas.Free;
    frmConsultaFacturas:=Nil;
    end;
    if dmFactura.qryVentaFactura.State = dsInactive then
    dmFactura.qryVentaFactura.Open;   

    if dmFactura.qryVentaFactura.RecordCount = 0 then
    begin
       MessageDlg('Factura no encontrada, favor verificar.',mtWarning,[mbok],0);
       Exit;
    end;
   ImprimeFactura8_5Farmacia(numtrn,tipo,'','Facturas');
end;

procedure TfrmProcVentaRapida.edtMontoInicialExit(Sender: TObject);
begin
  //LogProcedure('TfrmProcVentaRapida.edtMontoInicialExit');
  if (edtMontoInicial.Text <> '') and (btnFactCxcTercero.Visible) then
  BitBtn4.Enabled:= True;
end;

procedure TfrmProcVentaRapida.edtCodProdFinancDblClick(Sender: TObject);
begin
  LogProcedure('TfrmProcVentaRapida.edtCodProdFinancDblClick');
frmConsultaInventario:=TfrmConsultaInventario.Create(Nil);
  try
    if frmConsultaInventario.Showmodal = mrOk then
    edtCodProdFinanc.Text:= frmConsultaInventario.ibquery1codigo.AsString;
  finally
  frmConsultaInventario.Free;
  frmConsultaInventario:=Nil;
  end;
end;

procedure TfrmProcVentaRapida.ProcVerificaActInventario(
  codigoProd: integer; cant: real;CantidadAnterior:real;numtrn:integer);
  var
    NuevoBalance:Real;
begin
  LogProcedure('TfrmProcVentaRapida.ProcVerificaActInventario');
  NuevoBalance:=CantidadAnterior - cant;
  //begin
      qryVerificaInv.Close;
      qryVerificaInv.Params[0].Value:= codigoProd;
      qryVerificaInv.Open;
      WriteToLog(' ');
      WriteToLog('****************************************');
      WriteToLog('Numero Trn Venta:' + IntToStr(numtrn));
      WriteToLog('Codigo Producto:'  + qryVerificaInv.Params[0].AsString);
      WriteToLog('Cant antes venta: '+ FloatToStr(CantidadAnterior));
      WriteToLog('Cant en vendida: ' + FloatToStr(cant));

      WriteToLog('Nuevo Balance: '+FloatToStr(qryVerificaInvCANTIDAD.Value));
      if (qryVerificaInvCANTIDAD.Value = NuevoBalance) then
      WriteToLog('Inventario fue actualizado.')
      else
      if (qryVerificaInvCANTIDAD.Value > NuevoBalance) then
      begin
        WriteToLog('Inventario no fue actualizado');
        //MessageDlg('Inventario no fue actualizado, verifique',mtError,[mbok],0);
      end;
      WriteToLog('****************************************');
      WriteToLog(' ');
    //end;
end;

procedure TfrmProcVentaRapida.rxdbLookupCteExit(Sender: TObject);
begin
  //LogProcedure('TfrmProcVentaRapida.rxdbLookupCteExit');
  if (GlbPrecioMayRegOrden = 1) then
  AbrirClasifPrecio;
  if qryCliente.State = dsInactive then
  qryCliente.Open;
  CheckTipoNCFCte;
  if not rxVentaglbcodVendedor.IsNull then
  glbcodVendedor := rxVentaglbcodVendedor.Value;
  //temporal 9 Agosto 2023 - RxDBLookupCombo1Change(Self);

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

  if (RxSpinEdit1.Value <= 0)  then
  begin
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
    if (_UsarLevelPrecio > 0) and (_UsarLevelPrecio <=5) then
    RxSpinEdit1.Value:= _UsarLevelPrecio;

    if rxVenta.State in [dsEdit, dsInsert] then
    rxVentaLevelPrecio.Value := RxSpinEdit1.AsInteger;
  end;
  if Not tablaPropietarioCodigoPropietario.IsNull then
  if qryClienteCOD_VENDEDOR.Value > 0 then
    GlbCodVendedor :=qryClienteCOD_VENDEDOR.Value
  else
  GlbCodVendedor := -1;
  //qryClienteRNC_NUMERO
  if (rxVenta.RecordCount > 0) then
  begin
    //marzo 17 2015 ProcesarSumaTotal;
    //t BitBtn27Click(Self);
  if not GlbCalculado then
   CalcularTotalesInterno;
    
    rxVenta.EnableControls;
    rxdbgrid2.EnableScroll;
  end;
                                                       
  ProcSetNCFCliente;
  Refresh;
end;

procedure TfrmProcVentaRapida.rxdbLookupCteEnter(Sender: TObject);
begin
  //LogProcedure('TfrmProcVentaRapida.rxdbLookupCteEnter');
  tablaPropietario.Edit;
end;

procedure TfrmProcVentaRapida.rxdbLookupCteChange(Sender: TObject);
var
  sDesc : String;
begin
  //LogProcedure('TfrmProcVentaRapida.rxdbLookupCteChange');
   if tablaPropietario.State = dsBrowse then
   tablaPropietario.Edit;
  if (rxdbLookupCte.Value <> '') then
  begin
    tablaPropietarioCodigoPropietario.Value:=StrToInt(rxdbLookupCte.Value);
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
  if (GlbActivaECF = 1) and (rxVenta.RecordCount > 0) and ((
  TotalesTipoNCF.Value ='31') or (TotalesTipoNCF.Value ='33') or
  (TotalesTipoNCF.Value ='34') or (TotalesTipoNCF.Value ='45')) then
  begin
    qryVerecfTerrCte.close;
    qryVerecfTerrCte.Params[0].Value:= tablaPropietarioCodigoPropietario.Value;
    qryVerecfTerrCte.open;
    qryVerecfTerrCte.first;
    if qryVerecfTerrCteID_PROVINCIA.IsNull or qryVerecfTerrCteID_MUNICIPIO.IsNull then
    begin
      //MessageDlg('Tienes que configurar la Provincia y el Municipio del Cliente.', mtError, [mbok], 0);
      dmClientes.tblClienteTerritorio.Close;
      dmClientes.tblClienteTerritorio.Params[0].Value:= tablaPropietarioCodigoPropietario.Value;
      dmClientes.tblClienteTerritorio.Open;

      ProcAsignarProvMunc;

      qryVerecfTerrCte.close;
      qryVerecfTerrCte.Params[0].Value:= tablaPropietarioCodigoPropietario.Value;
      qryVerecfTerrCte.open;
      qryVerecfTerrCte.first;
      if qryVerecfTerrCteID_MUNICIPIO.IsNull or
      qryVerecfTerrCteID_PROVINCIA.IsNull then
      begin
        MessageDlg('Tienes que configurar la Provincia y el Municipio del Cliente.'#10#13'Actualice los campos desde la ventana de clientes.', mtError, [mbok], 0);
      end;

      BitBtn4.Enabled:= True;
      if qryEmpleado.State = dsInactive then
      qryEmpleado.Open;

      Exit;
    end;
  end;
end;

procedure TfrmProcVentaRapida.ProcAsignaNumLote(codProd: string);
begin
  //LogProcedure('TfrmProcVentaRapida.ProcAsignaNumLote');
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
  //LogProcedure('TfrmProcVentaRapida.rxVentaAfterScroll');
  if not rxVentaCodArticulo.IsNull then
  begin
    if (GlbUsaPUnidadLevel = 1) and (rxVentaCodArticulo.Value > 0) then
    begin
      dmVentas.qryPrecioUnidadSurt.Close;
      dmVentas.qryPrecioUnidadSurt.Params[0].Value:=rxVentaCodArticulo.Value;
      dmVentas.qryPrecioUnidadSurt.Open;
      DSQryPrecios.DataSet := dmVentas.qryPrecioUnidadSurt;
    end else
    begin
      QryPrecios.Close;
      QryPrecios.Params[0].Value:=rxVentaCodArticulo.Value;
      QryPrecios.Open;//QryPrecios.sql.text
      DSQryPrecios.DataSet := QryPrecios;
    end;
    RxSpinEdit1.Tag:=77;
    RxSpinEdit1.Value:= rxVentaLevelPrecio.Value;
    RxSpinEdit1.Tag:=0;
  end;
end;

procedure TfrmProcVentaRapida.ProcActualizarPagos(numtrn: integer;
  areatrans: smallint);
begin
  LogProcedure('TfrmProcVentaRapida.ProcActualizarPagos');
  dmPagosTarjeta.tblDetallePagos.Close;
  dmPagosTarjeta.tblDetallePagos.params[0].value:= numtrn;
  dmPagosTarjeta.tblDetallePagos.params[1].value:= areatrans;
  dmPagosTarjeta.tblDetallePagos.Open;
  dmPagosTarjeta.tblDetallePagos.First;
  if dmPagosTarjeta.tblDetallePagos.RecordCount > 0 then
  begin
    frmPagosCombinados:=TfrmPagosCombinados.Create(Nil);
    try
      frmPagosCombinados.Showmodal;
    finally
    frmPagosCombinados.free;
    frmPagosCombinados:=Nil;
    end;
  end;  
end;

//refactorizado evitar duplicidad en ventas
procedure TfrmProcVentaRapida.ProcInsertCtrlNumVta;
begin
  //LogProcedure('TfrmProcVentaRapida.ProcInsertCtrlNumVta');
  tblctrlvtatmp.Close;
  tblctrlvtatmp.Params[0].Value:=VarUsuarioGlb;
  tblctrlvtatmp.Open;
  tblctrlvtatmp.Insert;
  tblctrlvtatmpID.Value:=FsqlMaxNumeroFactura('gen_ctrl_secvta');
  tblctrlvtatmpFECHA_IN.Value:=now;
  tblctrlvtatmpCOD_USR_CAJA.Value:=VarUsuarioGlb;
  GlbNumVtaPOSTmp:=tblctrlvtatmpID.Value;
  GlbSalvarQuery(tblctrlvtatmp);
end;

procedure TfrmProcVentaRapida.ProcUpdateCtrlNumVta(numvta : Integer);
begin
  //LogProcedure('TfrmProcVentaRapida.ProcUpdateCtrlNumVta');
  if (GlbNumVtaPOSTmp < 0) then exit;
  tblctrlvtatmp.Close;
  tblctrlvtatmp.Params[0].Value:=VarUsuarioGlb;
  tblctrlvtatmp.Open;
  if tblctrlvtatmp.Locate('ID',GlbNumVtaPOSTmp,[]) then
  begin
    tblctrlvtatmp.Edit;
    tblctrlvtatmpFECHA_FIN.Value     := Now;
    tblctrlvtatmpNUMERO_TRN_VTA.Value:= numvta;
    tblctrlvtatmpCOD_USR_CAJA.Value  := VarUsuarioGlb;
    GlbSalvarQuery(tblctrlvtatmp);
  end;
end;
procedure TfrmProcVentaRapida.EstatusCierreZ1Click(Sender: TObject);
begin
  LogProcedure('TfrmProcVentaRapida.EstatusCierreZ1Click');
  if (GlbActivaIFiscal = 1) then
  begin
    if not ProcedVerificaCierreZ then
    begin
      rxlblAvisoCierreZ.BringToFront;
      rxlblAvisoCierreZ.Visible:=true;
    end                             
    else rxlblAvisoCierreZ.Visible:=false;
  end;
end;

procedure TfrmProcVentaRapida.rxVentaPrecioChange(Sender: TField);
begin
  LogProcedure('TfrmProcVentaRapida.rxVentaPrecioChange');
  FUpdating:=True;
end;

function TfrmProcVentaRapida.GetNivelPrecioStandar(codProd: Integer;
  t: smallint): currency;
begin
  //LogProcedure('TfrmProcVentaRapida.GetNivelPrecioStandar');
  //p1 p3 p3 p4
  QryPrecios.Close;
  QryPrecios.Params[0].Value:=codProd;
  QryPrecios.Open;
  if QryPrecios.Locate('Codigo', codProd,[]) then
  begin
    case t Of
    1: begin
         if QryPreciosPRECIOVENTA1.Value > 0 then
         begin
           result := QryPreciosPRECIOVENTA1.Value;
         end;
       end;
    2: begin
        if QryPreciosPRECIOVENTA2.Value > 0 then
        begin
          result := QryPreciosPRECIOVENTA2.Value;
        end;
       end;
    3:begin
        if QryPreciosPRECIOVENTA3.Value > 0 then
        begin
          result := QryPreciosPRECIOVENTA3.Value;
        end;
      end;
    4: begin
         if QryPreciosPRECIOVENTA4.Value > 0 then
         begin
           result := QryPreciosPRECIOVENTA4.Value;
         end;
      end;
    5: begin
         result := rxVentaPrecio.Value;
       end;
    end;//case
  end;
end;


function TfrmProcVentaRapida.EsControlEntradaDetalle(AControl: TWinControl): Boolean;
begin
  Result :=
    (AControl = DBEdit9) or       // Porc. descuento
    (AControl = DBEdit1) or       // Cantidad
    (AControl = DBEdit2) or       // Precio
    (AControl = RxSpinEdit1) or   // Nivel precio
    (AControl = cboxTipoUnidad) or
    (AControl = RxDBLookupTipoUnidad);
end;

procedure TfrmProcVentaRapida.DBEdit9Change(Sender: TObject);
begin
  LogEventoVenta('DBEdit9Change', 'Inicio');

  if LlenandoDatos then Exit;
  if EnProcesoCalculo then Exit;

  dmCalculos.esFeedback := False;
  GlbAlreadyCld := False;
  GlbCalculado := False;
  procCalc := True;
  esEditando := True;
  DatosModificados := True;
  CalculoPendiente := True;
  LogEventoVenta('DBEdit9Change', 'Fin');
end;

procedure TfrmProcVentaRapida.DBEdit9Enter(Sender: TObject);
begin
  LogEventoVenta('DBEdit9Enter', 'Inicio');
  DBEdit9.Color := clYellow;
  DBEdit9.Modified := False;
  LogEventoVenta('DBEdit9Enter', 'Fin');
end;

{
procedure TfrmProcVentaRapida.DBEdit9Exit(Sender: TObject);
begin
  LogEventoVenta('DBEdit9Exit', 'Inicio');

  if LlenandoDatos then Exit;

  DBEdit9.Color := clWindow;


  if not Self.Visible or not isShowing then Exit;

  if rxVentaCodArticulo.IsNull or (rxVentaCodArticulo.Value <= 0) then Exit;
  if rxVentaCant.IsNull or (Abs(rxVentaCant.Value) <= 0) then Exit;
  if rxVentaPrecio.IsNull or (rxVentaPrecio.Value <= 0) then Exit;

  if rxVenta.State in [dsEdit, dsInsert] then
  begin
    LogEventoVenta('DBEdit9Exit', 'Antes rxVenta.Post');
    rxVenta.Post;
    LogEventoVenta('DBEdit9Exit', 'Despues rxVenta.Post');
  end;

  DatosModificados := True;
  GlbCalculado := False;
  procCalc := True;

  LogEventoVenta('DBEdit9Exit', 'Solicita calculo por descuento');
  SolicitarCalculoTotales(tcDescuento);

  DBEdit9.Modified := False;

  LogEventoVenta('DBEdit9Exit', 'Fin');
end;   }

procedure TfrmProcVentaRapida.RxSpinEdit1Enter(Sender: TObject);
begin
  RxSpinEdit1.Tag:=0;
  //LogProcedure('TfrmProcVentaRapida.RxSpinEdit1Enter');
  rxspinedit1.Color:= clYellow;
end;

procedure TfrmProcVentaRapida.DBEdit3Enter(Sender: TObject);
begin
  LogProcedure('TfrmProcVentaRapida.DBEdit3Enter');
  dbedit3.Color:= clYellow;
end;

procedure TfrmProcVentaRapida.RxSpinEdit1Click(Sender: TObject);
begin
  if Assigned(rxDBGrid1.SelectedField) and
     (rxDBGrid1.SelectedField.FieldName = 'LevelPrecio') then
  begin
    SavedRecNo := rxVenta.RecNo;

    if not rxVentaSerie.IsNull then
      SavedSerieLinea := rxVentaSerie.Value
    else
      SavedSerieLinea := -1;

    SavedColIndex := rxDBGrid1.SelectedIndex;
    RestoreGridFocus := True;
  end
  else
  begin
    LimpiarRestauracionGrid;
  end;
end;

procedure TfrmProcVentaRapida.RxSpinEdit1KeyPress(Sender: TObject;
  var Key: Char);
begin
  //LogProcedure('TfrmProcVentaRapida.RxSpinEdit1KeyPress');
  if (Key = #13) and RestoreGridFocus then
  begin
    ProcRestaurarFocoDbgrid;
  end;
end;

procedure TfrmProcVentaRapida.ProcRestaurarFocoDbgrid;
begin
  RestoreGridFocus := False;

  try
    if (SavedSerieLinea > 0) and rxVenta.Active and (rxVenta.RecordCount > 0) then
      rxVenta.Locate('Serie', SavedSerieLinea, [])
    else
    if (SavedRecNo > 0) and rxVenta.Active and (rxVenta.RecordCount >= SavedRecNo) then
      rxVenta.RecNo := SavedRecNo;

    if rxDBGrid1.CanFocus then
      rxDBGrid1.SetFocus;

    if (SavedColIndex >= 0) and (SavedColIndex < rxDBGrid1.Columns.Count) then
      rxDBGrid1.SelectedIndex := SavedColIndex;
  except
  end;

  SavedRecNo := -1;
  SavedSerieLinea := -1;
  SavedColIndex := -1;
end;

procedure TfrmProcVentaRapida.CargarSimulacionDesdeExcel(
  const ArchivoExcel: string; SheetIndex: Integer; var rxVenta, Totales: TRxMemoryData);
var
  ExcelApp, Workbook, Worksheet: OleVariant;
  Row: Integer;
begin
  ExcelApp := CreateOleObject('Excel.Application');
  try
    ExcelApp.Visible := False;
    Workbook := ExcelApp.Workbooks.Open(ArchivoExcel);
    Worksheet := Workbook.Worksheets[SheetIndex];

    // Cargar totales desde fila 3
    Totales.Close;
    Totales.Open;
    Totales.Append;
    Totales.FieldByName('TipoNCF').AsString := Worksheet.Cells[3, 1].Value;
    GlbTransparentaITBI := Worksheet.Cells[3, 2].Value;
    Totales.FieldByName('PROPINA').AsFloat := Worksheet.Cells[3, 3].Value;
    Totales.FieldByName('PorcDesAdicional').AsFloat := Worksheet.Cells[3, 4].Value;
    Totales.FieldByName('Recargo').AsFloat := Worksheet.Cells[3, 5].Value;
    Totales.Post;

    // Cargar detalle desde fila 8
    rxVenta.Close;
    rxVenta.Open;
    Row := 8;
    if Not sqlAsignado then
    AsignarSqlText('','','');
    if qryProductos.State = dsInactive then
    qryProductos.Open;

    imbBarcode.Visible:=True;
    while not VarIsEmpty(Worksheet.Cells[Row, 1].Value) do
    begin
      edtCodigo.Text:= IntToStr(Worksheet.Cells[Row, 1].Value);
      edtCodigoExit(self);
      if RxDBGrid2.Visible then
      RxDBGrid2DblClick(Self);
      //ProcesaNuevo;
      if rxVenta.State = dsBrowse then rxVenta.Edit;

      rxVenta.FieldByName('CodArticulo').AsInteger := Worksheet.Cells[Row, 1].Value;
      qryProductos.Locate('codigo', rxVenta.FieldByName('CodArticulo').AsInteger, []);
      rxVentaCodTexto.Value:=qryProductosCODIGO_TEXTO.Value;
      rxVentaCostoProducto.Value:=qryProductosPRECIO_COMPRA.Value;
      rxVentaCodUsuario.Value:=VarUsuarioGlb;
      rxVenta.FieldByName('Descripcion').AsString := Worksheet.Cells[Row, 2].Value;
      rxVenta.FieldByName('Cant').AsFloat := Worksheet.Cells[Row, 3].Value;
      rxVenta.FieldByName('Precio').AsFloat := Worksheet.Cells[Row, 4].Value;
      rxVenta.FieldByName('IDTasaITBIS').AsInteger := Worksheet.Cells[Row, 5].Value;
      rxVenta.FieldByName('PorcDescItem').AsFloat := Worksheet.Cells[Row, 6].Value;
      rxVenta.FieldByName('TipoVenta').AsInteger := Worksheet.Cells[Row, 7].Value;
      rxVenta.FieldByName('levelprecio').AsInteger := 1;
      rxVenta.FieldByName('Moneda').AsString:='1';
      rxVentaTipoUnidad.Value:=1;
      rxVentaFecha.Value:=ExtraerFecha(GlbFechaTrnDiaria);
      rxVentaMonedaBase.Value := GetMonedaProducto(qryProductosCODIGO.AsInteger);
      rxVenta.FieldByName('MonedaBase').AsInteger:= GlbMonedaBase;

      if rxVenta.State in [dsEdit, dsInsert] then
      rxVenta.Post;
      edtCodigo.SetFocus;
      Inc(Row);
    end;
    dmCalculos.Pos_UpdateTotales(GlbNumVtaPOS);
    QryPrecios.Close;
    QryPrecios.Params[0].Value:=rxVentaCodArticulo.Value;
    QryPrecios.Open;
    QryPrecios.Locate('Codigo', rxVentaCodArticulo.Value,[]);

    Workbook.Close(False);
  finally
    ExcelApp.Quit;
    ExcelApp := Unassigned;
  end;
end;

procedure TfrmProcVentaRapida.SafeSetFocus(AControl: TWinControl);
begin
  if Assigned(AControl)
     and AControl.CanFocus  {˜ Visible, Enabled, Handle<>0, etc.}
  then
    AControl.SetFocus;
end;

procedure TfrmProcVentaRapida.CargarTest1Click(Sender: TObject);
var
  FormSheet: TForm;
  BtnCargar: TButton;
begin
  if not VerificaHuellas then
  begin
    MessageDlg('Clave incorrecta, verifique',mtWarning,[mbok],0);
    exit;
  end else
  exit;
  FormSheet := TForm.Create(nil);
  try
    FormSheet.Width := 300;
    FormSheet.Height := 150;
    FormSheet.Position := poScreenCenter;
    FormSheet.Caption := 'Seleccionar Hoja de Factura';

    SheetEditRef := TEdit.Create(FormSheet);
    SheetEditRef.Parent := FormSheet;
    SheetEditRef.Left := 30;
    SheetEditRef.Top := 30;
    SheetEditRef.Width := 100;
    SheetEditRef.Text := '1';

    BtnCargar := TButton.Create(FormSheet);
    BtnCargar.Parent := FormSheet;
    BtnCargar.Left := 30;
    BtnCargar.Top := 70;
    BtnCargar.Width := 100;
    BtnCargar.Caption := 'Cargar';
    BtnCargar.OnClick := BtnCargarClick;

    FormSheet.ShowModal;
    EnProcesoCalculo:=True;
    dmCalculos.DatCambio:=True;
    //t BitBtn27Click(Self);
    if not GlbCalculado then
    CalcularTotalesInterno;    
  finally
    FormSheet.Free;
  end;
end;

procedure TfrmProcVentaRapida.BtnCargarClick(Sender: TObject);
var
  SheetIndex: Integer;
begin
  if TryStrToInt(SheetEditRef.Text, SheetIndex) then
  begin
    CargarSimulacionDesdeExcel(
      'C:\Temp\erp\Simulacion_7_Facturas_Extendida.xlsx',
      SheetIndex,
      rxVenta,
      Totales
    );
  end
  else
    ShowMessage('Debe ingresar un número de hoja válido.');
end;

function TfrmProcVentaRapida.ExistePosextraDetParaVenta(NumVenta: Integer): Boolean;
begin
  with TIBQuery.Create(nil) do
  try
    Database := dmConectar.IBDatabase1;
    Transaction := dmConectar.IBTransaction1;
    SQL.Text := 'SELECT COUNT(*) FROM pos_extra_det WHERE numero = :Num';
    Params[0].AsInteger := NumVenta;
    Open;
    Result := Fields[0].AsInteger > 0;
  finally
    Free;
  end;
end;

procedure TfrmProcVentaRapida.CargarTesttxt1Click(Sender: TObject);
begin
  TestForm:=TTestForm.Create(Nil);
  try
    TestForm.Show;
    LlenandoDatos:=True;
    TestForm.btnRunTestClick(Self);
    LlenandoDatos:=False;
  except
  TestForm.free;
  TestForm:=Nil;
  end;
end;

procedure TfrmProcVentaRapida.Edit1Click(Sender: TObject);
begin
  if (Totalesitbis.Value = 0) and (rxVenta.RecordCount > 0) then
  begin
    DBEdit10Exit(Self);
  end;
end;        

procedure TfrmProcVentaRapida.DgiiSolicitareCF(numerotrn: integer);
var
  _smg: string;
  RunRes: TFacturaTxtEcfResult;
  OutputDir: string;
begin
  _smg := '';

  if (GlbValidarECF = 0) or (not CheckBox1.Checked) then
    Exit;

  // Carpeta donde quieres generar Factura.txt
  OutputDir := IncludeTrailingPathDelimiter('C:\Electronico')+'factura_txt';

  if GlbUsarFacturaTxtECF = 1 then
  begin
    try
      if not EjecutarFacturaTxtECF(
      GlbRutaEcf,
      numerotrn,
      OutputDir,
      dmConectar.IBDatabase1,
      dmConectar.IBTransaction1,
      RunRes) then
      begin
        if Trim(RunRes.OutputText) <> '' then
          MessageBox(0, PChar(RunRes.OutputText), 'Facturación Electrónica', MB_ICONERROR or MB_OK)
        else
        MessageBox(0, 'El proceso de facturación electrónica terminó con error, pero no devolvió detalle.',
        'Facturación Electrónica', MB_ICONERROR or MB_OK);
        Exit;
      end;

      // opcional:
      if GlbEsDebugFiscal = 1 then
      begin
       if Trim(RunRes.OutputText) <> '' then
         MessageBox(0, PChar(RunRes.OutputText), 'Facturación Electrónica', MB_ICONINFORMATION or MB_OK);
      end;
    except             
    on E: Exception do
      MessageBox(0, PChar(E.Message), 'Facturación Electrónica', MB_ICONERROR or MB_OK);
    end;
   Exit;
end;

  // Ruta normal actual, intacta
  if not CheckBox1.Checked then exit;
  if not UUtilecf.EjecutarECF_y_Mostrar(GlbRutaEcf, IntToStr(numerotrn), _smg) then
    MessageBox(0, PChar(_smg), 'Facturación Electrónica', MB_ICONERROR or MB_OK);
end;

function TfrmProcVentaRapida.FSolicitarMotivoNCR:smallint;
var
  motivo: Integer;
begin
  motivo := 1; // sugerido por defecto (Error en precios o cantidades)

  try
  if TfrmMotivoNCR.ExecuteForECF('E34', Motivo) then
  //if TfrmMotivoNCR.Execute(motivo, 4, 'Motivo de Nota de Crédito/Débito') then
  begin
    // Guardar en tu flujo:
    // vm.iddgii_motivo_ncr := motivo;  // 1..5
    // Ejemplo con query:
    // qry.ParamByName('iddgii_motivo_ncr').AsInteger := motivo;
    result:=motivo;
    //ShowMessage(Format('Motivo seleccionado: %d', [motivo]));
  end
  else
  begin
    result:=-1;
    // Cancelado por el usuario
  end;
  finally
    
  end;
end;

//inicio xx
//Si no hay ventas en rxVenta, entonces mostrar ventana de consultas
//Si el usuario selecciona el boton de NCR entonces
//regresar a la ventana frmProcVentaRapida,
//Si el usuario vuelve y hace click en el boton BitBtn7 y
//rxVenta tiene datos, entonces crear la nota de credito
procedure TfrmProcVentaRapida.BitBtn7Click(Sender: TObject);
var
  x : Integer;
  NumTrnGen : Integer;
  NumOrden : Integer;
  _flag : Boolean;
  ncfGenYaGen, ncfGen,flag : boolean;
  xexiste,xContinua : boolean;
  xcte : integer;
begin
  //if FProcesandoDevolucion then Exit;    // ? BLOQUEA REENTRADA
  //FProcesandoDevolucion := True;
  BitBtn7.Enabled := False;              // ? DESHABILITA INMEDIATO
  if TotalesVentaGuardada.Value = 1 then
  begin
    MessageDlg('Devolucion ya fue guardada, verifique...',mtWarning,[mbok],0);
    Exit;
  end;
  dmDatos.qryImpresoras.Close;
  dmDatos.qryImpresoras.Open;

  if (GlbActivaIFiscal = 1) then
  if VerificaNIFTExiste then
  begin
    MessageDlg('TIENES UNA VENTA CON NIF EN T, NO PUEDES HACER MAS VENTAS.'
    +LF+CR+'PUEDES CONVERTIR ESTA VENTA COMO COTIZACION Y LUEGO LA PUEDES USAR.',mtError,[mbok],0);
    exit;
  end;

  xexiste:=false;
  EsReimp:=False;
  ncfGenYaGen:=False;
  ncfGen:=False;
  dmclientes.tblClientes.Close;
  dmclientes.tblClientes.Open;
  if tablaPropietarioCodigoPropietario.IsNull then
  begin
    tablaPropietario.Edit;
    tablaPropietarioCodigoPropietario.Value:=0;
    tablaPropietario.Post;
  end;

  if tablaPropietarioCodigoPropietario.IsNull then
  begin
    MessageDlg('Indique codigo de cliente', mtError, [mbOk], 0);
    if isShowing then
    rxdbLookupCte.SetFocus;
    Exit;
  end;

  if not dmclientes.tblClientes.Locate('CODIGO_CTE', tablaPropietarioCodigoPropietario.Value,[]) then
  begin
    try
      xcte:=1;
      if not dmclientes.tblClientes.Locate('CODIGO_CTE', xcte,[]) then
      begin
        tablaPropietario.Edit;
        tablaPropietarioCodigoPropietario.Value:=0;
        tablaPropietario.Post;
      end;
    except
    end;
  end;
  
  numeroTrnVta:= 0;
  //TotalesTipoNCFIFiscal.Value;
  //TotalesTipoNCF.Value;
  if EsModificandoCotiza then Exit;

  //Procesar Devolucion 
  if (rxVenta.RecordCount > 0) And (Not EsDevolucion) then
  begin
    MessageDlg('Proceso no disponible.', mtWarning, [mbOk], 0);
    BitBtn7.Enabled:=True;
    Exit;
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
      if isShowing then
      rxdbLookupCte.SetFocus;
      Exit;
    end;

    if TotalesTipoNCF.IsNull And (GlbActivaIFiscal = 1 ) then
    begin
      MessageDlg('Favor indicar Tipo Comprobante.', mtInformation, [mbok],0);
      if isShowing then
      RxDBLookupCombo3.SetFocus;
      Exit;
    end;

    if EsModificandoFactura then
    begin
      if (dmFactura.qryFactTieneDevolucion.RecordCount = 1) then
      begin
        MessageDlg('Factura tiene una devolución previa, verifique ',mtInformation,[mbok],0);
        Exit;
      end;
      if TotalesMoneda.IsNull then
      begin
        MessageDlg('Favor indicar moneda.', mtInformation, [mbok],0);
        Exit;
      end;

      if MessageDlg('Continuar con devolución factura, NCR será creada?', mtWarning,[mbYes, mbNo],0) = mrNo then
      Exit;

      if (not TotalesTipoNCF.IsNull) and (GlbActivaECF = 0) then
      begin
        if (TotalesTipoNCFIFiscal.Value = -1) then
        begin
          Totales.Edit;
          TotalesTipoNCFIFiscal.Value:= 2;//2;
          if not LlenandoDatos then
          Totales.Post;
        end else
        if (TotalesTipoNCFIFiscal.Value = 0) then
        begin
          Totales.Edit;
          TotalesTipoNCFIFiscal.Value:=dmFactura.ibQryViewNCFTIPO_NCFNCR.Value;//2;
          if not LlenandoDatos then
          Totales.Post;
        end else
        if (TotalesTipoNCFIFiscal.Value = 1) then
        begin
          Totales.Edit;
          TotalesTipoNCFIFiscal.Value:=dmFactura.ibQryViewNCFTIPO_NCFNCR.Value;//3;
          if not LlenandoDatos then
          Totales.Post;
        end else
        if (TotalesTipoNCFIFiscal.Value = 5) then
        begin
          Totales.Edit;
          TotalesTipoNCFIFiscal.Value:=dmFactura.ibQryViewNCFTIPO_NCFNCR.Value;
          if not LlenandoDatos then
          Totales.Post;
        end else
        if (TotalesTipoNCFIFiscal.Value = 4) then
        begin
          Totales.Edit;
          TotalesTipoNCFIFiscal.Value:=dmFactura.ibQryViewNCFTIPO_NCFNCR.Value;
          if not LlenandoDatos then
          Totales.Post;
        end else
        begin
          MessageDlg('No permitido', mtInformation, [mbok],0);
          Exit;
        end;
      end;//if (not TotalesTipoNCF.IsNull..

      if (GlbActivaECF = 1) then
      begin
        Totales.Edit;
        TotalesTipoNCFIFiscal.Value:=4;
        if not LlenandoDatos then
        Totales.Post;
      end;
    //Exit;//Temporal
    if CheckBox1.Checked then
    UProcesarDevolucion.GeneraNCF := True
    else UProcesarDevolucion.GeneraNCF := False;
    //Crear Nota Credito
    if Not TotalesTipoNCF.IsNull then
    begin
      if GlbActivaECF = 1 then
      UProcesarDevolucion.tipoCF    := '34'
      else
      UProcesarDevolucion.tipoCF    := '04';
      UProcesarDevolucion.GeneraNCF := True;
    end
    else
    begin

      UProcesarDevolucion.tipoCF := '-1';
      UProcesarDevolucion.GeneraNCF := False;
    end;
      if dmFactura.qryVentaFacturaCODIGO_CTE.Value > 0 then
      begin
        tablaPropietario.Edit;
        tablaPropietarioCodigoPropietario.Value:= dmFactura.qryVentaFacturaCODIGO_CTE.Value;
        tablaPropietario.Post;
      end else
      begin
        tablaPropietario.Edit;
        tablaPropietarioCodigoPropietario.Value:= 0;
        tablaPropietario.Post;
      end;

    UProcesarDevolucion.fechaTrn  := rxVentaFecha.Value;
    UProcesarDevolucion.codigo_cte:= tablaPropietarioCodigoPropietario.Value;
    if tablaPropietarioCodigoPropietario.Value > 0 then
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
    if CheckBox1.Checked then
    UProcesarDevolucion.GeneraNCF:= True;

    if dmFactura.qryVentaFacturaFORMA_PAGO.Value in [7,8,15] then
    UProcesarDevolucion.UpdateBLCCXC  := True
    else
    UProcesarDevolucion.UpdateBLCCXC  := False;
    BitBtn7.Enabled:=False;//Evitar duplicar devolucion por varios click
    if GlbActivaECF = 1 then
    begin
      if UProcesarDevolucion.GeneraNCF then
        UProcesarDevolucion.Ejecutar('34', TotalesTipoNCFIFiscal.Value, dmFactura.qryVentaFacturaNUMERO.Value) //Comprobante Fiscal Nota de Credito
    end else
    begin
      if UProcesarDevolucion.GeneraNCF then
      begin
        if GlbActivaECF = 0 then
        UProcesarDevolucion.Ejecutar('04', TotalesTipoNCFIFiscal.Value, dmFactura.qryVentaFacturaNUMERO.Value) //Comprobante Fiscal Nota de Credito
        else
        UProcesarDevolucion.Ejecutar('34', TotalesTipoNCFIFiscal.Value, dmFactura.qryVentaFacturaNUMERO.Value) //Comprobante Fiscal Nota de Credito

      end
      else
      UProcesarDevolucion.Ejecutar(' ', -1, dmFactura.qryVentaFacturaNUMERO.Value);
    end;
    rxVenta.DisableControls; //dmFactura.qryVentaFacturaNUMERO_NCF.Value
    rxVenta.First;
    if rxVentaglbcodVendedor.Value > 0 then
    GlbcodVendedor:= rxVentaglbcodVendedor.Value;
    //ActualizaVentaMaster('6', UProcesarDevolucion.seriencfasignado);//Devolucion
    ProcInsertarVtaMastEnDevolucion(UProcesarDevolucion.seriencfasignado,dmFactura.qryVentaFacturaNUMERO.Value);
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

      if Not ibStpActualizaInvProd.Transaction.InTransaction then
      ibStpActualizaInvProd.Transaction.StartTransaction;
      try
        ibStpActualizaInvProd.Transaction.CommitRetaining;
      except
      ibStpActualizaInvProd.Transaction.RollbackRetaining;
      end;

      InsertarDetDevolucion(ipStpInsertVentMast.Params[0].Value);
      //ActualizaInvAlmacen;

      rxVenta.Next;
    end;
    //6	Devolucion
    if (GlbMutur = 1) then
    DescargarVehiculoDev(dmFactura.qryVentaFacturaNUMERO.Value);
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
        dmFactura.qryVentaFacturaNUMERO_FACTURA.Value;
      end;

      GlbNombreFiletoPrint:= Format('%s%s%s%s%s%s%s',[dmReportes.qryDatosCajaImpUserRUTA_TICKET.Value,'\NotaCredito',Trim(GlbCodSucursal),Trim(GlbModeloImpresora),
      IntToStr(VarUsuarioGlb),StrLeftPad(IntToStr(dmFactura.qryVentaFacturaNUMERO.Value),8),'.txt']);
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

      //Solicitar ecf a la DGII
      if (GlbActivaECF = 1) and (5=5) and (CheckBox1.Checked) then //temporal
      begin
        if (ipStpInsertVentMast.Params[0].Value > 0) then
        DgiiSolicitareCF(ipStpInsertVentMast.Params[0].Value);
      end;

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

          ProcInsFiscalCtrl(dmReportes.qryViewVentasMastNUMERO.Value,
          dmReportes.qryViewVentasMastFECHA.Value,xexiste);

          frmTestImpresoraFiscal.btnImprimeReciboClick(Self);
          Sleep(4000);
          repeat
            ProcInsFiscalCtrl(dmReportes.qryViewVentasMastNUMERO.Value,
            dmReportes.qryViewVentasMastFECHA.Value,xexiste);
          until not GlbImprimiendo;

        finally
        frmTestImpresoraFiscal.Free;
        frmTestImpresoraFiscal:= Nil;

        if (GlbNumVtaPOS > 0) then
        dmcalculos.ProcDeletePosExtraDet(GlbNumVtaPOS);
        GlbNumVtaPOS:=-1;

        ReactivarValores;
      end;
      exit;
   end;//fin activa fiscal
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
      GlbNumeroTrn:=-1;
      lblFechaCotizacion.Visible:= False;
      dbFechaCotizacion.Visible := False;
      Label36.Visible := False;
      Label36.caption:='';
      BitBtn7.Enabled:=True;
      FProcesandoDevolucion:=False;
    label41.Visible := False;
    DBText15.Visible:= True;
    if (GlbNumVtaPOS > 0) then
    dmcalculos.ProcDeletePosExtraDet(GlbNumVtaPOS);
    GlbNumVtaPOS:=-1;
    procCalc:=True;
    EsModificandoFactura:=False;
    GlbAlreadyCld := False;
    CalcYaEjecutado:=False;
    procCalc := True;
    esEditando := False;
    GlbCalculado:=False;
      
    //Application.ProcessMessages;
    end else  //imprimir devolucion
    begin
      if (GlbActivaECF = 1) and (5=5) and (CheckBox1.Checked) then //Devoluciones
      begin
        if (dmFactura.qryVentaFacturaNUMERO.Value > 0) then
        DgiiSolicitareCF(dmFactura.qryVentaFacturaNUMERO.Value);
      end;
      
      if (dmFactura.qryVentaFacturaTIPO_FACTURA.Value = 6 ) or
      (dmFactura.formaPago = 6 ) then
      begin
        LlenarrxSolDatoscte(dmFactura.qryVentaFacturaCODIGO_CTE.Value);
        if (UpperCase(GLBFormatoFactura) = 'FORMAFACOCO') then
           UImpresionVentas.ImprimirFacturaRepuesto(dmfactura.qryFactReimpMaster.Params[0].Value)
         ELSE
         UPrintDevolucion.ImprimirDevolucion;//codigo de tipo de reportes
      end;
    end;
   end else
    begin
      if (GlbActivaECF = 1) and (5=5) and (CheckBox1.Checked) then //temporal
      begin
        if (dmfactura.qryFactReimpMasterNumero.Value > 0) then
        DgiiSolicitareCF(dmfactura.qryFactReimpMasterNumero.AsVariant);
      end;
      UImpresionVentas.ImpFacturaservicio(dmfactura.qryFactReimpMaster.Params[0].Value, True);
    end;
 //t end;

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
    BitBtn7.Enabled    := True;
    try
      Totales.EmptyTable;
      rxPagos.EmptyTable;
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
    //temporal label29.Top:= 413;
    label29.Top:= 371;
    //temporal dbTextMontoExoneraITBIS.Top := 410;
    label41.Visible := False;
    DBText15.Visible:= True;
    if (GlbNumVtaPOS > 0) then
    dmcalculos.ProcDeletePosExtraDet(GlbNumVtaPOS);
    GlbNumVtaPOS:=-1;
    procCalc:=True;
    EsModificandoFactura:=False;
    GlbAlreadyCld := False;
    CalcYaEjecutado:=False;
    procCalc := True;
    esEditando := False;
    GlbCalculado:=False;
    if (GlbNumVtaPOS > 0) then
    dmcalculos.ProcDeletePosExtraDet(GlbNumVtaPOS);
    GlbNumVtaPOS:=-1;
    Exit;
   //end; //FIN MODIFICAR FACTURA
  end; //[IF] Fin: (rxVenta.RecordCount > 0) And (Not EsDevolucion)

  //***********************************PROCESO DEVOLUCION PARCIAL *************
  //Inicio -cuando la venta ya existe
  if (EsDevolucion) And (rxVenta.RecordCount > 0) then
  begin
    if dmFactura.qryVentaFactura.State = dsInactive then
    begin
      MessageDlg('Transacción no puede ser procesada como devolución, verifique.', mtInformation, [mbok], 0);
      Exit;
    end;
    //{Inicio Temporal   ----VOLVER AQUI CON LA DEVOLUCION
    //cambios aqui
    //t if (GlbActivaIFiscal = 0) And (tablaPropietarioCodigoPropietario.IsNull Or
    //t    (tablaPropietarioCodigoPropietario.Value = 0)) and
    //t    (dmFactura.qryVentaFacturaNumero_ncf.Value <> '')  then

    if (GlbActivaIFiscal = 0)  then
    Begin
      if (dmFactura.qryVentaFacturaNumero_ncf.Value <> '') and (GlbActivaECF = 0) then
      begin
        ncfGen := True;
        if (TotalesTipoNCFIFiscal.Value = -1) then
        begin
          Totales.Edit;
          //TotalesTipoNCFIFiscal.Value
          TotalesTipoNCFIFiscal.Value:= 2;//2;
          if not LlenandoDatos then
            Totales.Post;
        end else
        if (TotalesTipoNCFIFiscal.Value = 0) then
        begin
          Totales.Edit;
          TotalesTipoNCFIFiscal.Value:=dmFactura.ibQryViewNCFTIPO_NCFNCR.Value;//2;
          if not LlenandoDatos then
          Totales.Post;
        end else
        if (TotalesTipoNCFIFiscal.Value = 1) then
        begin
          Totales.Edit;
          TotalesTipoNCFIFiscal.Value:=dmFactura.ibQryViewNCFTIPO_NCFNCR.Value;//3;
          if not LlenandoDatos then
          Totales.Post;
        end else
        if (TotalesTipoNCFIFiscal.Value = 5) then
        begin
          //MessageDlg('No permitido', mtInformation, [mbok],0);
          //Exit;
          Totales.Edit;
          TotalesTipoNCFIFiscal.Value:=dmFactura.ibQryViewNCFTIPO_NCFNCR.Value;
          if not LlenandoDatos then
          Totales.Post;
        end else
        if (TotalesTipoNCFIFiscal.Value = 4) then
        begin
          Totales.Edit;
          TotalesTipoNCFIFiscal.Value:=dmFactura.ibQryViewNCFTIPO_NCFNCR.Value;
          if not LlenandoDatos then
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
        if not LlenandoDatos then
        Totales.Post;
      end;

    if TotalesMoneda.IsNull then
    begin
      MessageDlg('Favor indicar moneda.', mtInformation, [mbok], 0);
      Exit;
    end;
    if MessageDlg('Desea procesar transacción como devolución?', mtWarning, [mbYes, mbNo],0)= mrYes then
    begin
      //Crear Nota Credito

      xContinua:=False;
      UProcesarDevolucion.CancelaProceso := False;

      if GlbActivaECF = 1 then
      UProcesarDevolucion.tipoCF    := '34'
      else
      UProcesarDevolucion.tipoCF    := '04';

      UProcesarDevolucion.fechaTrn  := rxVentaFecha.Value;
      if dmFactura.qryVentaFacturaCODIGO_CTE.Value > 0 then
      begin
        tablaPropietario.Edit;
        tablaPropietarioCodigoPropietario.Value:= dmFactura.qryVentaFacturaCODIGO_CTE.Value;
        tablaPropietario.Post;
      end else
      begin
        tablaPropietario.Edit;
        tablaPropietarioCodigoPropietario.Value:= 0;
        tablaPropietario.Post;
      end;
      if tablaPropietarioCodigoPropietario.Value > 0 then
      begin
        UProcesarDevolucion.codigo_cte:= tablaPropietarioCodigoPropietario.Value;
        if tablaPropietarioCodigoPropietario.Value > 0 then
        UProcesarDevolucion.nombrecompleto :=qryClienteNOMBRE_FACTURAR.Value;
        begin
          if Not qryClienteRNC_NUMERO.IsNull then
          UProcesarDevolucion.cedula   := qryClienteRNC_NUMERO.Value
          else
          UProcesarDevolucion.cedula   := qryClienteCEDULA.Value;
          UProcesarDevolucion.direccion:= qryClienteDIRECCION_CONT.Value;
          UProcesarDevolucion.ciudad   := qryClienteCIUDAD.Value;// '';
        end;
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
      UProcesarDevolucion.GeneraNCF:= False;
      if TotalesTipoNCFIFiscal.IsNull then
      UProcesarDevolucion.GeneraNCF:= False
      else if CheckBox1.Checked then
      UProcesarDevolucion.GeneraNCF:= True;

      if dmFactura.qryVentaFacturaFORMA_PAGO.Value in [7,8,15] then
      UProcesarDevolucion.UpdateBLCCXC  := True
      else
      UProcesarDevolucion.UpdateBLCCXC := False;

      if UProcesarDevolucion.GeneraNCF then
      begin
        dmfactura.ibqryViewNCF.Close;
        if dmFactura.ibQryViewNCF.Prepared then
        dmFactura.ibQryViewNCF.UnPrepare;
        dmFactura.ibQryViewNCF.SQL.Text := dmFactura.ibQryViewNCF_0.SQL.Text;
        ProcAsignaQuery;
        dmfactura.ibqryViewNCF.Open;
        if GlbActivaECF = 1 then
        UProcesarDevolucion.Ejecutar('34', TotalesTipoNCFIFiscal.Value, dmFactura.qryVentaFacturaNUMERO.Value)//Comprogante Fiscal Nota de Credito
        else
        UProcesarDevolucion.Ejecutar('04', TotalesTipoNCFIFiscal.Value, dmFactura.qryVentaFacturaNUMERO.Value)
      end else
      UProcesarDevolucion.Ejecutar('', -1, dmFactura.qryVentaFacturaNUMERO.Value);

      //ActualizaVentaMaster('6', UProcesarDevolucion.seriencfasignado);//Devolucion
      if UProcesarDevolucion.CancelaProceso then
      exit;
      ProcInsertarVtaMastEnDevolucion(UProcesarDevolucion.seriencfasignado,dmFactura.qryVentaFacturaNUMERO.Value);
      //Capturar motivo de la devolucon para eCF
      if (GlbActivaECF = 1) and CheckBox1.Checked then
      begin
        try
          if (ipStpInsertVentMast.Params[0].Value > 0) then
              ProcUpdateMotivo(ipStpInsertVentMast.Params[0].Value,FSolicitarMotivoNCR,
              dmFactura.qryVentaFacturaNUMERO_NCF.Value);
        except
        end;
      end;
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
        ncfGenYaGen := True;
        rxVenta.Next;
      end;
      xContinua:=False;
      ncfGenYaGen:=True;
      //No es necesario, probar y eliminar en caso de no.
      //ProcesarDevolucion;
       //ncfGenYaGen
      //aqui control para evitar duplisidad
    //end;

    end else
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

      if Not ipStpInsertVentMast.Transaction.InTransaction then
      ipStpInsertVentMast.Transaction.StartTransaction;
      try
       ipStpInsertVentMast.Transaction.CommitRetaining;
      except
      ipStpInsertVentMast.Transaction.RollbackRetaining;
      end;
      if NumTrnGen > 0 then
      begin
      dmfactura.tbltrnventasmastupd.Close;
      dmfactura.tbltrnventasmastupd.Params[0].Value:=NumTrnGen;
      dmfactura.tbltrnventasmastupd.Open;
      if not dmfactura.tbltrnventasmastupdNUMERO.IsNull then
      begin
        dmfactura.tbltrnventasmastupd.Edit;
        dmfactura.tbltrnventasmastupdREF_TRN_ORIGEN.Value:= dmFactura.qryVentaFacturaNUMERO.Value;
        GlbSalvarQuery(dmfactura.tbltrnventasmastupd);
      end;
      end;
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

        if Not ibStpActualizaInvProd.Transaction.InTransaction then
        ibStpActualizaInvProd.Transaction.StartTransaction;
        try
         ibStpActualizaInvProd.Transaction.CommitRetaining;
        except
        ibStpActualizaInvProd.Transaction.RollbackRetaining;
        end;

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
          except on E : Exception do
          begin
            NotificaErrorByEmail('Actualizando Cant Inventario (stpMantInvAlmacen.ExecProc;):'+rxDataAntCantFinal.AsString+
            ' #Trn '+IntToStr(NumeroTrn)+LF+CR+e.Message);
            WriteToLog('Actualizando Cant Inventario (stpMantInvAlmacen.ExecProc;):'+rxDataAntCantFinal.AsString+
           ' #Trn '+IntToStr(NumeroTrn)+LF+CR+e.Message);
         end;
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
      rxventa.EmptyTable;
      lblTotalItem.Caption:='Total Items:'+IntToStr(rxVenta.RecordCount);
      rxSolDatoscte.EmptyTable;
      lblProcDev.Caption  :='Proceso Venta';
      EsModificandoFactura:=False;
      qryInventario.Close;
      qryInventario.Open;
      qryProductos.Close;
      qryProductos.Open;
      numeroTrnVta  := 0;
      GlbcodVendedor:=-1;

      rxventa.EnableControls;
      Refresh;
      lblProcDev.Visible := False;
      if (GlbNumVtaPOS > 0) then
      dmcalculos.ProcDeletePosExtraDet(GlbNumVtaPOS);
      GlbNumVtaPOS:=-1;
      Exit;
    end;
    //Final Temporal
    //debe entrar aqui para venta cash no fiscal
    if (dmFactura.qryVentaFacturaNumero_ncf.Value <> '') and (not ncfGen)  then
    begin
      if (TotalesTipoNCFIFiscal.Value = -1) then
      begin
        Totales.Edit;
        TotalesTipoNCFIFiscal.Value:= 2;//2;
      end else
      if (TotalesTipoNCFIFiscal.Value = 0) then
      begin
        Totales.Edit;
        TotalesTipoNCFIFiscal.Value:=dmFactura.ibQryViewNCFTIPO_NCFNCR.Value;//2;
      end else
      if (TotalesTipoNCFIFiscal.Value = 1) then
      begin
        Totales.Edit;
        TotalesTipoNCFIFiscal.Value:=dmFactura.ibQryViewNCFTIPO_NCFNCR.Value;//3;
      end else
      if (TotalesTipoNCFIFiscal.Value = 5) then
      begin
        //MessageDlg('No permitido', mtInformation, [mbok],0);
        //Exit;
        Totales.Edit;
        TotalesTipoNCFIFiscal.Value:=dmFactura.ibQryViewNCFTIPO_NCFNCR.Value;
      end else
      if (TotalesTipoNCFIFiscal.Value = 4) then
      begin
        Totales.Edit;
        TotalesTipoNCFIFiscal.Value:=dmFactura.ibQryViewNCFTIPO_NCFNCR.Value;
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
    if not LlenandoDatos then
    if Totales.state = dsEdit then
    Totales.Post;

    if TotalesMoneda.IsNull then
    begin
      MessageDlg('Favor indicar moneda.', mtInformation, [mbok], 0);
      Exit;
    end;
    //t if MessageDlg('Desea procesar transacción como devolución?', mtWarning, [mbYes, mbNo],0)= mrYes then
    //xContinua:=True;//revisar aqui para evitar Duplicidad
    if (not ncfGen) and  (xContinua) then
    begin
      //Crear Nota Credito
      //UProcesarDevolucion.tipoCF    := '04';
      if GlbActivaECF = 1 then
      UProcesarDevolucion.tipoCF    := '34'
      else
      UProcesarDevolucion.tipoCF    := '04';

      UProcesarDevolucion.fechaTrn  := rxVentaFecha.Value;
      UProcesarDevolucion.codigo_cte:= tablaPropietarioCodigoPropietario.Value;
      if tablaPropietarioCodigoPropietario.Value > 0 then
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
              //totalesTipoNCFIFiscal.value
      if UProcesarDevolucion.GeneraNCF then
      begin
        dmfactura.ibqryViewNCF.Close;
        if dmFactura.ibQryViewNCF.Prepared then
        dmFactura.ibQryViewNCF.UnPrepare;
        dmFactura.ibQryViewNCF.SQL.Text := dmFactura.ibQryViewNCF_0.SQL.Text;
        ProcAsignaQuery;
        dmfactura.ibqryViewNCF.Open;  //por aqui voy procesando devolucion
        if GlbActivaECF = 0 then
        UProcesarDevolucion.Ejecutar('04', TotalesTipoNCFIFiscal.Value, dmFactura.qryVentaFacturaNUMERO.Value)//Comprogante Fiscal Nota de Credito
        else
        UProcesarDevolucion.Ejecutar('34', TotalesTipoNCFIFiscal.Value, dmFactura.qryVentaFacturaNUMERO.Value);
      end else
      UProcesarDevolucion.Ejecutar('', -1, dmFactura.qryVentaFacturaNUMERO.Value);

      if (GlbMutur = 1) then
      DescargarVehiculoDev(dmFactura.qryVentaFacturaNUMERO.Value);

      //ActualizaVentaMaster('6', UProcesarDevolucion.seriencfasignado);//Devolucion
      ProcInsertarVtaMastEnDevolucion(UProcesarDevolucion.seriencfasignado,dmFactura.qryVentaFacturaNUMERO.Value);
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
      IntToStr(VarUsuarioGlb),StrLeftPad(IntToStr(ipStpInsertVentMast.Params[0].Value),8),'.txt']);

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

      begin

        frmTestImpresoraFiscal:= TfrmTestImpresoraFiscal.Create(Nil);
        try
          frmTestImpresoraFiscal.ncfAfectado := dmReportes.qryViewVentasMastNUMERO_NCF.Value;
          frmTestImpresoraFiscal.LCantCopias := rxspinImpCantCopias.Text;
          frmTestImpresoraFiscal.BitBtn1Click(Self);

          ProcInsFiscalCtrl(dmReportes.qryViewVentasMastNUMERO.Value,
          dmReportes.qryViewVentasMastFECHA.Value,xexiste);

          frmTestImpresoraFiscal.btnImprimeReciboClick(Self);
          Sleep(2000);
          repeat
          ProcInsFiscalCtrl(dmReportes.qryViewVentasMastNUMERO.Value,
          dmReportes.qryViewVentasMastFECHA.Value,xexiste);
          until not GlbImprimiendo;

        finally
        frmTestImpresoraFiscal.Free;
        frmTestImpresoraFiscal:= Nil;
        end;
        Delay(1000);
        if (GlbNumVtaPOS > 0) then
        dmcalculos.ProcDeletePosExtraDet(GlbNumVtaPOS);
        GlbNumVtaPOS:=-1;

        ReactivarValores;
      end;  
    end else //No Fiscal
    begin
      if (GlbActivaECF = 1) and (5=5) and (CheckBox1.Checked) then //Validar Devoluciones
      begin
        if (ipStpInsertVentMast.Params[0].Value > 0) then
        DgiiSolicitareCF(ipStpInsertVentMast.Params[0].Value);
      end;
      ReImprimeDevolucionsinFact1Click(Self);//imprimir devolucion
    end;

    end;//pregunta si desea continuar con la devolucion
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
  lblTotalItem.Caption:='Total Items:'+IntToStr(rxVenta.RecordCount);
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
  bitBtnEditarFact.Visible := False;
  label41.Visible := False;
  DBText15.Visible:= True;
  if (GlbNumVtaPOS > 0) then
  dmcalculos.ProcDeletePosExtraDet(GlbNumVtaPOS);
  GlbNumVtaPOS:=-1;
  xCodProd:=-1;
  GlbNumVtaPOSTmp:=-1;
  BitBtn7.Enabled:=True;
  exit;//evitar duplicar devolucion
  end;

 //---EN PRUEBA RE-hABILITAR PARA CONTINUAR
 //
  EsDevolucion := Not EsDevolucion;
  lblProcDev.Visible := EsDevolucion;
  if lblProcDev.Visible = false then
  lblProcDev.SendToBack else
  lblProcDev.BringToFront;
  lblProcDev.Left:= 192;
  //For x:=1 To 50 Do
  //begin
  //  lblProcDev.Left:=lblProcDev.Left - 1;
    //Application.ProcessMessages;
  //end;
  lblProcDev.Left:=lblProcDev.Left - 50;
  BitBtn4.Enabled    := True;
  ProcesandoVenta := False;
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
    rxPagos.EmptyTable;
    lblProcDev.Visible := False;
    tablaPropietario.Close;
    tablaPropietario.Open;
    rxventa.EmptyTable;
    lblTotalItem.Caption:='Total Items:'+IntToStr(rxVenta.RecordCount);    
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
  GlbCalculado:=False;
  procCalc := False;

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
  if not GLBEsFastFood then
  begin
    label29.Top:= 413;
    dbTextMontoExoneraITBIS.Top := 410;
  end;
  label41.Visible := False;
  DBText15.Visible:= True;
  if (GlbNumVtaPOS > 0) then
  dmcalculos.ProcDeletePosExtraDet(GlbNumVtaPOS);
  GlbNumVtaPOS:=-1;
  xCodProd:=-1;
  GlbNumVtaPOSTmp:=-1;
  dmVentas.qryPrecioMaxInv.Close;
  dmVentas.qryPrecioMaxInv.Params[0].Value:= GlbCia_Key;
  dmVentas.qryPrecioMaxInv.Open;
  BitBtn7.Enabled:=True;
  rxVenta.EnableControls;
  RxDBGrid1.EnableScroll;
  Refresh;
  //Application.ProcessMessages;
end;//Final BitBtn7

procedure TfrmProcVentaRapida.DBEdit3Change(Sender: TObject);
begin
  GlbCalculado:=false;
end;

procedure TfrmProcVentaRapida.ProcUpdateMotivo(numtrn: integer;motivo:smallint;ncfRef:string);
begin
  dmVentas.tblVtaMast.Close;
  dmVentas.tblVtaMast.Params[0].Value:=numtrn;
  dmVentas.tblVtaMast.Open;
  dmVentas.tblVtaMast.First;
  if not dmVentas.tblVtaMastNUMERO.IsNull then
  begin
    dmVentas.tblVtaMast.Edit;
    dmVentas.tblVtaMastIDDGII_MOTIVO_NCR.Value:=motivo;
    GlbSalvarQuery(dmVentas.tblVtaMast);
    dmVentas.tblncfasignado.close;
    dmVentas.tblncfasignado.Params[0].value:=dmVentas.tblVtaMastSERIE_NCF_ASIGNADO.Value;
    dmVentas.tblncfasignado.open;
    dmVentas.tblncfasignado.first;
    if not dmVentas.tblncfasignadoNUMERO_NCF.IsNull then
    begin
      dmVentas.tblncfasignado.Edit;
      dmVentas.tblncfasignadoNUMERO_NCF_REFERENCIA.Value:=ncfRef;
      GlbSalvarQuery(dmVentas.tblncfasignado);
    end;
    dmVentas.tblVtaMast.Close;
  end;
end;

procedure TfrmProcVentaRapida.ConciliareCF1Click(Sender: TObject);
begin
  frmConciliareCFConDGII:=TfrmConciliareCFConDGII.Create(Nil);
  try
    frmConciliareCFConDGII.Showmodal;
  finally                           
  FreeAndNil(frmConciliareCFConDGII);  
  end;
end;
procedure TfrmProcVentaRapida.Label46Click(Sender: TObject);
begin  
  if dmFactura.ibQryViewNCF.State = dsBrowse then exit;
    dmFactura.ibQryViewNCF.Close;
    if dmFactura.ibQryViewNCF.Prepared then
    dmFactura.ibQryViewNCF.UnPrepare;
    ProcAsignaQuery;
    label46.Visible:= True;
    RxDBLookupCombo3.Visible:= True;
    if Not dmFactura.ibQryViewNCF.Prepared then
    dmFactura.ibQryViewNCF.Prepare;
    dmFactura.ibQryViewNCF.Open;           
end;

procedure TfrmProcVentaRapida.DBEdit6Exit(Sender: TObject);
begin
  if qryCliente.State = dsInactive then
  qryCliente.Open;
  if not tablaPropietarioCodigoPropietario.IsNull then
  ProcSetNCFCliente;
  rxdbLookupCteExit(Self);
  //RxDBLookupCombo3Exit(Self);
end;

procedure TfrmProcVentaRapida.DBEdit2Click(Sender: TObject);
begin
  exDBEdit2ONClick:=True;
end;

function TfrmProcVentaRapida.VerificaHuellas: boolean;
var u, far: Integer;
begin
  if GlbUsaHuellas = 0 then
  begin
    if VerificaClave then
    result:=true else result:=false;
    Exit;
  end;
  try
    if HuellaEnroladaIBX(dmconectar.IBDatabase1, u, far) then
    begin
     // OK: existe huella enrolada y coincide
     // u = USUARIO.NUMERO del dueño de la huella
     result:=True;
    end
    else
    begin
      // NO: no coincide / cancelado / no hay huellas enroladas
      LogInformacionTxt('NO: no coincide / cancelado / no hay huellas enroladas');
      result:=False;
      if VerificaClave then
      result:=true else result:=false;
    end;
  except on E : Exception do
  begin
    if VerificaClave then
    result:=true else result:=false;
    LogInformacionTxt(e.Message);
  end;
  end;
end;
procedure TfrmProcVentaRapida.RxDBLookupCombo3Click(Sender: TObject);
begin
  if dmFactura.ibQryViewNCF.State = dsInactive then
  begin
    dmFactura.ibQryViewNCF.Open;
    dmFactura.ibQryViewNCF.EnableControls;
    if tbltipoDeIngresos.State = dsInactive then
    tbltipoDeIngresos.Open;
  end;
end;

procedure TfrmProcVentaRapida.TotalesMonedaChange(Sender: TField);
begin
  MostrarTasa;
end;

procedure TfrmProcVentaRapida.MostrarTasa;
begin
  try
  if (TotalesMoneda.Value <> '1') then
  begin
    lblTasa.Caption:=Concat('1 = ',InsertarComa(FloatToStr(GlbMontoTasa(TotalesMoneda.Value))));
    Label60.Caption:=SimboloMoneda('1')+InsertarComa(Format('%8.2f', [Totalestotalneto.Value * GlbMontoTasa(TotalesMoneda.Value)]));
    if (lblTasa.Caption <> '') then lblTasa.Visible:=True;
  end;  
  except
  end;
end;

procedure TfrmProcVentaRapida.ReEnviaFacturatxt1Click(Sender: TObject);
begin
   frmConsultaFacturas:=TfrmConsultaFacturas.Create(Nil);
   frmConsultaFacturas.BitBtn2.Caption := '&Re-Imprimir';
   if frmConsultaFacturas.Showmodal = mrOK then
   begin
     if frmConsultaFacturas.rdgContado.Checked then
        frmProcVentaRapida.esContado:=True
     else frmProcVentaRapida.esContado:=False;

     frmProcVentaRapida.NumeroTrn := dmFactura.qryVentaFacturaNumero.AsInteger;
     if (GlbActivaECF = 1) and (GlbValidarECF = 1) and (CheckBox1.Checked) then 
     begin
       DgiiSolicitareCF(frmProcVentaRapida.NumeroTrn);
     end;
   end else Exit;
end;

procedure TfrmProcVentaRapida.ProcAsignarProvMunc;
begin
  if tablaPropietarioCodigoPropietario.IsNull
  or (tablaPropietarioCodigoPropietario.Value = 0) then exit;

  qryVerecfTerrCte.close;
  qryVerecfTerrCte.Params[0].Value:= tablaPropietarioCodigoPropietario.Value;
  qryVerecfTerrCte.open;
  qryVerecfTerrCte.first;
  if Not qryVerecfTerrCteID_MUNICIPIO.IsNull and
  not qryVerecfTerrCteID_PROVINCIA.IsNull then
  exit;                          
            
  dmClientes.tblClienteTerritorio.Close;
  dmClientes.tblClienteTerritorio.Params[0].Value:= tablaPropietarioCodigoPropietario.Value;
  dmClientes.tblClienteTerritorio.Open;

  frmEditProvinciaMunicipio:=TfrmEditProvinciaMunicipio.Create(nil);  
  try
    if dmClientes.tblClienteTerritorio.State = dsInactive then
    begin
      dmClientes.tblClienteTerritorio.Close;
      dmClientes.tblClienteTerritorio.Params[0].Value:= tablaPropietarioCodigoPropietario.Value;
      dmClientes.tblClienteTerritorio.Open;
    end;
    if not dmCompania.tblCompaniaID_PROVINCIA.IsNull then
    frmEditProvinciaMunicipio.idProv:= qryClienteID_PROVINCIA.Value;
                                       
    frmEditProvinciaMunicipio.ShowModal;
  finally                                           
  frmEditProvinciaMunicipio.Free;         
  frmEditProvinciaMunicipio:=Nil;
  end;
end;              

procedure TfrmProcVentaRapida.RxDBLookupCombo4Click(Sender: TObject);
begin
  if qryEmpleado.State = dsInactive then
  qryEmpleado.Open;                                   
end;                         

procedure TfrmProcVentaRapida.RxDBLookupCombo4MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   if qryEmpleado.state = dsInactive then qryEmpleado.Open;
end;

procedure TfrmProcVentaRapida.qryEmpleadoBeforeClose(DataSet: TDataSet);
begin
  if qryEmpleado.State = dsInactive then
  LogInformacionTxt('qryEmpleado.state es inactive');
end;

procedure TfrmProcVentaRapida.tbltipoDeIngresosBeforeClose(
  DataSet: TDataSet);
begin
  if tbltipoDeIngresos.State = dsInactive then
  LogInformacionTxt('tbltipoDeIngresos.state es inactive');
end;

//Rutina Calculos Inicio

procedure TfrmProcVentaRapida.Edit1Enter(Sender: TObject);
  procedure MantenerFocoEnEdit1;
  begin
    if isShowing and Edit1.CanFocus then
      PostMessage(Edit1.Handle, WM_SETFOCUS, 0, 0);
  end;
begin
  if TotalesTipoNCF.isnull then
  AsignaNCFCFinal;  //TotalesPropinaLegal.value
  if not TotalesMoneda.IsNull then
  begin
    if TotalesMoneda.IsNull then
    begin
      Totales.Edit;
      TotalesMoneda.Value := IntToStr(GlbMonedaBase);
      if not LlenandoDatos then
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
  panel2.Height:=87;
  panel2.Visible := False;
  //Esto estaba sacando el cursor del campo, impidiendo que el usuario digite
  //if EnProcesoCalculo then
  //Edit1Exit(Self);
  //DBEdit1Exit(Self);//Probando

  if (rxVentaMontoNeto.Value = 0) then
  begin
    GlbCalculado:=False;
    EnProcesoCalculo:=False;
    LogEventoVenta('CALL ProcesaCalculos', 'TfrmProcVentaRapida.Edit1Enter(Sender: TObject);');
    dmCalculos.ProcesaCalculos;
  end;
  if glbUsaescalaPrecio = 0 then
  panelTempPrecioLevels.Visible:= False; //debe ponerser invisible venaqui
  if not GlbUsandoCotiza then
  ProcItbisExonerado;
  if not ValidaSubTotal then exit;
  if (GlbActivaECF = 1) and ( not EsModificandoCotiza)  then
  begin
    if (TotalesTipoNCF.Value = '31') or (TotalesTipoNCF.Value = '45')
      or (TotalesTipoNCF.Value = '47') then
    begin
      qryCliente.Close;
      qryCliente.Open;
      qryCliente.Locate('CODIGO_CTE',tablaPropietarioCodigoPropietario.Value,[]);
      if qryClienteRNC_NUMERO.IsNull then
      begin
        MessageDlg('Cliente no tiene RNC/Cédula, verifique.',mtError, [mbOK], 0);
        Exit;
      end;
      if (qryClienteRNC_CED_ACTIVO.Value = 0) or (qryClienteRNC_CED_ACTIVO.IsNull )then
      begin
        if not CheckRNCEdActivoenDGII(qryClienteRNC_NUMERO.Value) then
        begin
          MessageDlg('RNC/Cédula del cliente indicado no está ACTIVO en DGII.'#13'Debe usar un eNCF de Consumo.',mtError, [mbOK], 0);
          exit;
        end;
      end
    end;
  end;
  ///*
  //  Último refuerzo:
  //  Si algún método interno intentó mover el foco, lo devolvemos a Edit1.
  //*/
  MantenerFocoEnEdit1;  
end;

procedure TfrmProcVentaRapida.BitBtn14Click(Sender: TObject);
begin
  //LogProcedure('TfrmProcVentaRapida.BitBtn14Click');
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
  guardarRec : TBookmark;
  porcdes : Extended;
  diff : Currency;
  cambioValido : Boolean;
  precioUsado: Currency;
  nivel: Smallint;
  nivelDetectado: Smallint;
  precioDetectado: Currency;
  aPrecioLocal,
  cPrecioLocal,
  precioMinimo : Currency;

  function IgualConTol(const A, B: Currency; const Tol: Currency = 0.01): Boolean;
  begin
    Result := Abs(A - B) <= Tol;
  end;

  function DetectarNivelPrecio(const APrecio: Currency; out PrecioNivel: Currency): Smallint;
  begin
    // Default: nivel libre (5)
    Result := 5;
    PrecioNivel := APrecio;

    if IgualConTol(APrecio, qryProductosPRECIOVENTA1.Value) then
    begin
      Result := 1; PrecioNivel := qryProductosPRECIOVENTA1.Value; Exit;
    end;

    if IgualConTol(APrecio, qryProductosPRECIOVENTA2.Value) then
    begin
      Result := 2; PrecioNivel := qryProductosPRECIOVENTA2.Value; Exit;
    end;

    if IgualConTol(APrecio, qryProductosPRECIOVENTA3.Value) then
    begin
      Result := 3; PrecioNivel := qryProductosPRECIOVENTA3.Value; Exit;
    end;

    if IgualConTol(APrecio, qryProductosPRECIOVENTA4.Value) then
    begin
      Result := 4; PrecioNivel := qryProductosPRECIOVENTA4.Value; Exit;
    end;
    // si no calza con ninguno, queda nivel = 5 (precio manual)
  end;

begin
  DBEdit2.Color:= clWindow;
  LogEventoVenta('DBEdit2Exit', 'Inicio');
  exDBEdit2ONClick:=False;
  if GlbCalculado then  //nuevo ultimo
  begin
     if isShowing then
     begin
       edtCodigo.SetFocus;
       PostMessage(edtCodigo.Handle, WM_SETFOCUS, 0, 0);
       exit;
     end;
  end;
  if LlenandoDatos then
  begin
    LogEventoVenta('DBEdit2Exit', 'Abortado por LlenandoDatos');
    Exit;
  end;

  if not Self.Visible or not isShowing or LlenandoDatos then Exit;
  
  if not Self.Visible or not isShowing then
  begin
    LogEventoVenta('DBEdit2Exit', 'Abortado por formulario no visible');
    Exit;
  end;
  
  if rxVentaCodArticulo.IsNull then Exit;
  yNumSerie:= rxVentaSerie.Value;

  // Sincronización inicial de nivel si usuario tocó precio (con tu método)
  if rxVenta.State in [dsEdit, dsInsert] then
  begin
    if (RxSpinEdit1.AsInteger = 5) then
    begin
      rxVentaLevelPrecio.Value := 5
    end;
    if rxVentaPrecio.IsNull then
      rxVentaPrecio.Value := 0
    else
    if GlbUsaPUnidadLevel = 1 then
    begin
      nivel := dmCalculos.GetNivelPrecioXUnidad(
                 rxVentaCodArticulo.Value,
                 rxVentaTipoUnidad.Value,
                 rxVentaPrecio.Value, 0.05);  // ejemplo
      if (rxVentaLevelPrecio.Value <> nivel) then
      begin
        rxVenta.Edit;
        rxVentaLevelPrecio.Value := nivel;
        RxSpinEdit1.Value := nivel;
      end;
    end;
  end
  else
  begin
    if (rxVentaLevelPrecio.Value <> RxSpinEdit1.AsInteger) then
    begin
      rxVenta.Edit;
      rxVentaLevelPrecio.Value := RxSpinEdit1.AsInteger;
    end
    else
    begin
      // validar precio level aqui (queda como en tu código original)
    end;
  end;

  DBEdit2.Color:= clWindow;
  cambioValido := False;
  cPrecio:= rxVentaPrecio.Value;

  if rxVenta.State in [dsEdit, dsInsert] then
  begin
    if (cPrecio < aPrecio) and (cPrecio < qryProductosPRECIO_MINIMO.Value) then
    begin
      if (not GlbFactRecurrente) and (GLBMotor = 0) then
      begin
        if not EsModificandoFactura then
        begin
          if not VerificaHuellas then
          begin
            MessageDlg('Precio no será cambiado', mtWarning, [mbOk], 0);
            rxVentaPrecio.Value := aPrecio;
          end
          else
            cambioValido:=True;
        end;
      end;
      if (GLBMotor = 1) then cambioValido:=True;
     end;
   end;

  if (aPrecio <> cPrecio) then
    PrecioCambio:=True
  else
    PrecioCambio:=False;

  DBEdit2.ReadOnly:=True;
  if PrecioCambio then
    dmCalculos.esFeedbackExtra:=False;

  //inicia lineas nuevas para recalcular
  if not dmCalculos.esFeedbackExtra then
  if not rxVentaMoneda.IsNull then
  if dmCalculos.qryConsultaPosExtraDet.Tag <> 99 then
  if procCalc  then
  begin
    dmCalculos.ProcInsertUpdatePosExtraDet(GlbNumVtaPOS);
    dmCalculos.Pos_UpdateTotales(GlbNumVtaPOS);
    GlbCalculado:=False; rxVentaSerie.Value;
  end;
  //end nuevo

  if not GlbCalculado then
    CalcularTotalesInterno;

  rxVenta.RecordCount;
  if rxVenta.State = dsBrowse then
  if (rxVentaSerie.Value <> yNumSerie) then
    rxVenta.Locate('Serie', yNumSerie,[]);

  if rxVentaCodTexto.Value = '' then Exit;

  if qryInventario.State = dsInactive then
    qryInventario.Open;

  if Not qryInventario.Locate('CODIGO_TEXTO', rxVentaCodTexto.Value,[]) then
    MessageDlg('codigo ' + rxVentaCodTexto.Value + ' no encontrado en inventario, verifique', mtError, [mbOK], 0)
  else
  begin //chequear precio
    diff := rxVentaPrecio.Value - qryProductosPRECIO_MINIMO.Value;
    if qryProductos.State = dsInactive then
    AsignarSqlText('','','');
    qryProductos.DisableControls;
    qryProductos.Locate('CODIGO', qryInventariocODIGO.Value,[]);
    qryProductos.EnableControls;
    panelTempPrecioLevels.Visible:=True;

    if rxVentaLevelPrecio.Value > 0 then
      _UsarLevelPrecio:=rxVentaLevelPrecio.Value
    else
      _UsarLevelPrecio:= qryProductosUSARLEVELPRECIO.Value;

    if (Not FAplicaPrecioMayorista)
      And ((rxVentaPrecio.Value < qryProductosPRECIO_MINIMO.Value) and (ABS(diff) > 2))
      And (glbUsaescalaPrecio = 0)
      And (Not cambioValido)
      And (not EsModificandoFactura)
      And (not GLBEsFastFood) then
    begin
      if (rxVenta.State = dsBrowse) then
        rxVenta.Edit;
      if not GlbFactRecurrente then
        rxVentaPrecio.Value := aPrecio;

      if rxVenta.State in [dsEdit, dsInsert] then
      begin
        LogEventoVenta('DBEdit2Exit', 'Antes rxVenta.Post');
        rxVenta.Post;
        LogEventoVenta('DBEdit2Exit', 'Despues rxVenta.Post');
      end;

      if (not GlbFactRecurrente) and  (GlbUsaPUnidadLevel = 0) and (Not EsModificandoFactura)
         and (GLBMotor = 0) then
      if MessageDlg('Precio es menor que el minimo, continuar?', mtError, [mbYes,mbNo], 0) = mrno then
      begin
        DBEdit2.ReadOnly := False;
        if isShowing then
          DBEdit2.SetFocus;
        //if Assigned(guardarRec) then
        //begin
        //  rxVenta.GotoBookmark(guardarRec);
        //  rxVenta.FreeBookmark(guardarRec);
        //end;
        Exit;
      end;
    end;
  end;

  DBEdit2.ReadOnly := True;
  dmCalculos.EsProcCalc:=True;
  dmCalculos.EsProcCalc:=False;

  if rxVenta.State in [dsEdit, dsInsert] then
    rxVenta.Post;

  if isShowing then
  if not edtCodigo.Focused then
    if not EsModificandoCotiza then
    begin
      edtCodigo.SetFocus;
      PostMessage(edtCodigo.Handle, WM_SETFOCUS, 0, 0);
    end;

  rxVenta.EnableControls;
  RxDBGrid1.EnableScroll;
  label52.Caption:=FormatDateTime('hh:mm:ss',Now);

  if isShowing then
  begin
    edtCodigo.SetFocus;
    PostMessage(edtCodigo.Handle, WM_SETFOCUS, 0, 0);
  end;

  edtCodigo.Color  :=clWindow;

  if (not dmVentas.qryPrecioMaxInvPRECIOMAX.IsNull) and (rxVentaPrecio.Value > dmVentas.qryPrecioMaxInvPRECIOMAX.Value) then
  begin
    if MessageDlg('¿Precio es mayor a '+InsertarComa(dmVentas.qryPrecioMaxInvPRECIOMAX.AsString)+'?',mtWarning,[mbno, mbyes],0) = mrno then
    begin
      if IsShowing then
        DBEdit2.SetFocus;
    end;
  end;

  // === SELECCIÓN DEL PRECIO POR NIVEL (FIX) ===
  if GlbUsaPUnidadLevel = 1 then
  begin
    DSQryPrecios.DataSet := dmVentas.qryPrecioUnidadSurt;
    SetPrecioPorCantidad;  // tu lógica existente
  end
  else
  begin
    // Detectar nivel real según rxVentaPrecio.Value (con tolerancia)
    nivelDetectado := DetectarNivelPrecio(rxVentaPrecio.Value, precioDetectado);

    // Reflejar nivel detectado en dataset y UI
    if rxVenta.State = dsBrowse then rxVenta.Edit;
    rxVentaLevelPrecio.Value := nivelDetectado;
    rxVenta.Post;
    RxSpinEdit1.AsInteger := nivelDetectado;

    if (nivelDetectado = 5) then
    begin
      // Precio manual: conserva el precio actual
      precioUsado := rxVentaPrecio.Value;
    end
    else
    begin
      // Precio del nivel detectado (1..4)
      precioUsado := precioDetectado;

      // Si el usuario movió manualmente el spinner, respetar su selección explícita
      if (RxSpinEdit1.AsInteger in [1..4]) then
      begin
        case RxSpinEdit1.AsInteger of
          1: precioUsado := qryProductosPRECIOVENTA1.Value;
          2: precioUsado := qryProductosPRECIOVENTA2.Value;
          3: precioUsado := qryProductosPRECIOVENTA3.Value;
          4: precioUsado := qryProductosPRECIOVENTA4.Value;
        end;
      end;

      // Si difiere más de 1.00 del precio actual, corrige y avisa
      if (Abs(rxVentaPrecio.Value - precioUsado) > 1) and (GLBMotor = 0) then
      begin
        if rxVenta.State = dsBrowse then rxVenta.Edit;
        rxVentaPrecio.Value := precioUsado;
  if rxVenta.State in [dsEdit, dsInsert] then
  begin
    LogEventoVenta('DBEdit2Exit', 'Antes rxVenta.Post');
    rxVenta.Post;
    LogEventoVenta('DBEdit2Exit', 'Despues rxVenta.Post');
  end;
        MessageDlg('Verifica level precio', mtWarning, [mbok], 0);
        if isShowing then
          PostMessage(Handle, WM_NEXTDLGCTL, WPARAM(RxSpinEdit1.Handle), 1);
      end;
    end;
  end;
  if TotalesTipoNCF.IsNull then
  begin
    if Totales.State = dsBrowse then
    Totales.Edit;
    if GlbActivaECF = 1 then
    TotalesTipoNCF.Value:='32'
    else TotalesTipoNCF.Value:='02';
  end;

  SolicitarCalculoTotales(tcPrecio);

  LogEventoVenta('DBEdit2Exit', 'Fin');

  if Assigned(guardarRec) then
  begin
    rxVenta.GotoBookmark(guardarRec);
    rxVenta.FreeBookmark(guardarRec);
  end;
end;
procedure TfrmProcVentaRapida.DBEdit2Enter(Sender: TObject);
begin
  DBEdit2.Color:= clYellow;
  
  if rxVentaCodArticulo.IsNull then exit;

  RestaurarLineaActiva;

  frmLogError.Cant := rxVentaCant.value;  rxVentaSerie.Value;
  frmLogError.LogMarca(GlbNumVtaPOS,rxVentaSerie.Value,now,now,'OnEnterPrecio',1);
  edtCodigo.Text := '';
  pesoProd := '';

  DBEdit2.SelectAll;
  DBEdit2.Color:= clYellow;
  panel2.Height:=87;
  Panel2.Visible:=False;
  if glbUsaescalaPrecio = 0 then
  panelTempPrecioLevels.Visible:= False;

  if (rxVentaPrecio.Value = 0) then
  begin
    DBEdit2.ReadOnly:=False;
  end;
  aPrecio:= rxVentaPrecio.Value;

  if esEditando and imbBarcode.Visible then
  begin
    if rxVenta.State in [dsEdit, dsInsert] then
    begin
      if (not rxVentaCodArticulo.IsNull) and
         (rxVentaCodArticulo.Value > 0) and
         (not rxVentaCant.IsNull) and
         (Abs(rxVentaCant.Value) > 0) and
         (not rxVentaPrecio.IsNull) and
         (rxVentaPrecio.Value > 0) then
      begin
        LogEventoVenta('DBEdit2Enter', 'Post linea completa antes de retornar a edtCodigo');
        rxVenta.Post;
      end;
    end;

    esEditando := False;

    if isShowing then
    begin
      if not exDBEdit2ONClick then
      begin
        if edtCodigo.CanFocus then
        begin
          edtCodigo.SetFocus;
          PostMessage(edtCodigo.Handle, WM_SETFOCUS, 0, 0);
        end;
      end;
    end;

    Exit;
  end;
end;
procedure TfrmProcVentaRapida.WMCalcularTotales(var Msg: TMessage);
var
  guardarRec: TBookmark;
begin
  guardarRec:=rxVenta.GetBookmark;
  try
  BitBtn27Click(Self);  // O mejor: CalcularTotalesInterno;
  finally
  rxVenta.GotoBookmark(guardarRec);
  rxVenta.FreeBookmark(guardarRec);
  end;
end;

procedure TfrmProcVentaRapida.DBEdit12Exit(Sender: TObject);
begin
  if not Self.Visible or not isShowing then Exit;
  if rxVenta.Modified then
  begin
    GlbCalculado := False;
    DiferirCalculoTotales;
  end;
end;

procedure TfrmProcVentaRapida.DBEdit17Exit(Sender: TObject);
begin
  // ?? Esta parte es clave:
  if rxVenta.State in [dsEdit, dsInsert] then
    rxVenta.Post;
end;

procedure TfrmProcVentaRapida.SolicitarCalculoTotales(Origen: TTipoCambio);
begin
  LogEventoVenta('SolicitarCalculoTotales', TipoCambioTexto(Origen));

  if LlenandoDatos then
  begin
    LogEventoVenta('SolicitarCalculoTotales', 'Abortado por LlenandoDatos');
    Exit;
  end;

  if not Assigned(rxVenta) or not rxVenta.Active then
  begin
    LogEventoVenta('SolicitarCalculoTotales', 'Abortado por rxVenta inactivo');
    Exit;
  end;

  if rxVenta.RecordCount = 0 then
  begin
    LogEventoVenta('SolicitarCalculoTotales', 'Abortado sin detalle');
    Exit;
  end;

  {
    Si el motor está calculando, no relances ni postees otro WM.
    Solo deja marcada la intención real del usuario.
  }
  if EnProcesoCalculo then
  begin
    DatosModificados := True;
    GlbCalculado := False;
    procCalc := True;
    LogEventoVenta('SolicitarCalculoTotales',
      'Marcado pendiente por EnProcesoCalculo=True');
    Exit;
  end;

  {
    Para cambios de detalle, no dispares cálculo si la línea aún no está lista.
    Esto evita ruido cuando el usuario está en Insert y todavía no hay precio.
  }
  if Origen in [tcCantidad, tcPrecio, tcDescuento, tcUnidad, tcrxspin] then
  begin
    if rxVentaCodArticulo.IsNull or (rxVentaCodArticulo.Value <= 0) then
    begin
      LogEventoVenta('SolicitarCalculoTotales', 'Abortado sin CodArticulo');
      Exit;
    end;

    if rxVentaCant.IsNull or (Abs(rxVentaCant.Value) <= 0) then
    begin
      LogEventoVenta('SolicitarCalculoTotales', 'Abortado sin Cant');
      Exit;
    end;

    if rxVentaPrecio.IsNull or (rxVentaPrecio.Value <= 0) then
    begin
      LogEventoVenta('SolicitarCalculoTotales', 'Abortado sin Precio');
      Exit;
    end;
  end;

  {
    Para cambios globales como recargo/moneda, basta con que exista detalle.
  }
  UltimaVariableModificada := Origen;
  DatosModificados := True;
  GlbCalculado := False;
  procCalc := True;

  if not CalculoPendiente then
    CalculoPendiente := True;

  DiferirCalculoTotales;
end;

procedure TfrmProcVentaRapida.DiferirCalculoTotales;
begin
  LogEventoVenta('DiferirCalculoTotales', 'Inicio');

  if LlenandoDatos then Exit;
  if EnProcesoCalculo then Exit;
  if not CalculoPendiente then Exit;

  if CalculoMsgPendiente then
  begin
    LogEventoVenta('DiferirCalculoTotales', 'Ya existe mensaje pendiente');
    Exit;
  end;

  CalculoMsgPendiente := True;
  PostMessage(Handle, WM_CALCULAR_TOTALES, 0, 0);
  LogEventoVenta('DiferirCalculoTotales', 'PostMessage enviado');
end;

procedure TfrmProcVentaRapida.EjecutarCalculoTotales;
var
  guardarRec: TBookmark;
begin
  try
    if rxVenta.State in [dsEdit, dsInsert] then
      rxVenta.Post;

    guardarRec := rxVenta.GetBookmark;
    try
      dmCalculos.ProcInsertUpdatePosExtraDet(GlbNumVtaPOS);
      dmCalculos.Pos_UpdateTotales(GlbNumVtaPOS);
    finally
      if rxVenta.BookmarkValid(guardarRec) then
        rxVenta.GotoBookmark(guardarRec);
      rxVenta.FreeBookmark(guardarRec);
    end;
  finally

    if CalculoPendiente then
    begin
      //CalculoPendiente := False;
      EjecutarCalculoTotales; // solo 1 re-ejecución si hubo cambios durante el cálculo
    end;
  end;
end;
//nueva
procedure TfrmProcVentaRapida.WMDiferirCalculoTotales(var Msg: TMessage);
begin
  LogEventoVenta('WMDiferirCalculoTotales', 'Inicio');

  CalculoMsgPendiente := False;

  if LlenandoDatos then Exit;
  if not CalculoPendiente and not DatosModificados then Exit;

  if EnProcesoCalculo then
  begin
    LogEventoVenta('WMDiferirCalculoTotales', 'Reentrada ignorada');
    Exit;
  end;

  EnProcesoCalculo := True;
  try
    { Consumir el lote actual }
    DatosModificados := False;
    CalculoPendiente := False;

    if rxVenta.State in [dsEdit, dsInsert] then
    begin
      LogEventoVenta('WMDiferirCalculoTotales', 'Antes rxVenta.Post');
      rxVenta.Post;
      LogEventoVenta('WMDiferirCalculoTotales', 'Despues rxVenta.Post');
    end;

    LogEventoVenta('WMDiferirCalculoTotales', 'Antes ProcesaCalculos');
    dmCalculos.ProcesaCalculos;
    LogEventoVenta('WMDiferirCalculoTotales', 'Despues ProcesaCalculos');

  finally
    EnProcesoCalculo := False;
  end;

  { Si durante el cálculo hubo cambios nuevos, reagendar 1 vez más }
  if DatosModificados then
  begin
    CalculoPendiente := True;
    DiferirCalculoTotales;
  end
  else
  begin
    CalculoPendiente := False;
    CalculoMsgPendiente := False;
    GlbCalculado := True;
    procCalc := False;
  end;

  LogEventoVenta('WMDiferirCalculoTotales', 'Fin');
end;

procedure TfrmProcVentaRapida.DBEdit9Exit(Sender: TObject);
begin
  LogEventoVenta('DBEdit9Exit', 'Inicio');

  if LlenandoDatos then Exit;

  DBEdit9.Color := clWindow;


  if not Self.Visible or not isShowing then Exit;

  if rxVentaCodArticulo.IsNull or (rxVentaCodArticulo.Value <= 0) then Exit;
  if rxVentaCant.IsNull or (Abs(rxVentaCant.Value) <= 0) then Exit;
  if rxVentaPrecio.IsNull or (rxVentaPrecio.Value <= 0) then Exit;

  DatosModificados := True;
  GlbCalculado := False;
  procCalc := True;

  if rxVenta.State in [dsEdit, dsInsert] then
  begin
    LogEventoVenta('DBEdit9Exit', 'Antes rxVenta.Post');
    rxVenta.Post;
    LogEventoVenta('DBEdit9Exit', 'Despues rxVenta.Post');
  end;

  LogEventoVenta('DBEdit9Exit', 'Solicita calculo por descuento');
  SolicitarCalculoTotales(tcDescuento);

  DBEdit9.Modified := False;

  LogEventoVenta('DBEdit9Exit', 'Fin');
end;

procedure TfrmProcVentaRapida.cbMonedaCambioChange(Sender: TObject);
begin
  SolicitarCalculoTotales(tcMonedaCambio);
end; 
procedure TfrmProcVentaRapida.DBEdit17Change(Sender: TObject);
begin
  if EnProcesoCalculo or LlenandoDatos then Exit;
  //EnProcesoCalculo:=True;
  DatosModificados := True;
  esEditando:=True;
end;

procedure TfrmProcVentaRapida.DBEdit13Change(Sender: TObject);
begin
  if EnProcesoCalculo or LlenandoDatos then Exit;
  DatosModificados := True;
end;

procedure TfrmProcVentaRapida.CalcularTotalesInterno;
begin
  if (rxVentaCant.Value = 0) and
     (rxVentaPrecio.Value = 0) and
     (rxVentaMontoBruto.Value = 0) then Exit;

  if TotalesPreAbono.IsNull or (TotalesPreAbono.Value = 0) then
    ProcVerificaPreAbono;

  dmCalculos.CalcPropinaLegal := not chkNoLeyPropina.Checked;

  if EsEditando or dmCalculos.DatCambio then
    dmCalculos.Pos_UpdateTotales(GlbNumVtaPOS);

  if dmCalculos.qryConsultaPosExtraDet.Tag = 0 then
  begin
    if rxVenta.State in [dsEdit, dsInsert] then
    begin
      rxVenta.Tag := 27;
      rxVenta.Post;
    end;

    if RxDBLookupCombo3.Tag = 0 then
    begin
      ProcItbisExonerado;
      RxDBLookupCombo3.Tag := 77;
    end;

    if not GlbUsandoCotiza then
    begin
      if Totalestotalneto.Value = 0 then GlbCalculado := False;
      if not GlbCalculado then
        dmCalculos.Pos_UpdateTotales(GlbNumVtaPOS);
    end;

    CalcYaEjecutado := True;
    procCalc := False;
  end
  else if PrecioCambio or not GlbCalculado then
  begin
    dmCalculos.Pos_UpdateTotales(GlbNumVtaPOS);
    CalcYaEjecutado := True;
  end;

  esEditando := False;
end;

procedure TfrmProcVentaRapida.BitBtn27Click(Sender: TObject);
begin
  if not EnProcesoCalculo then Exit;

  try
    if rxVenta.Modified then
      LogInfoLoop('rxVenta.Modified=True');

    EsEditando := True;
    dmCalculos.DatCambio := True;

    CalcularTotalesInterno;
  finally

  end;
end;

procedure TfrmProcVentaRapida.DBEdit1Change(Sender: TObject);
begin
  if EnProcesoCalculo or LlenandoDatos then Exit;
  
  if (DBEdit1.Text <> '') and (Length(DBEdit1.Text) > 5) then
  begin
    DBEdit1.Text := '';
    Exit;
  end;
  CalculoPendiente := True;
  DatosModificados := True;
  GlbCalculado := False;
  procCalc := True;
end;

procedure TfrmProcVentaRapida.DBEdit2Change(Sender: TObject);
begin
  if EnProcesoCalculo or LlenandoDatos then Exit;
  esEditando:=True;
  DatosModificados := True;
  GlbCalculado := False;
  CalculoPendiente := True;
  procCalc := True;
end;

procedure TfrmProcVentaRapida.ValidarCalculos1Click(Sender: TObject);
var
  guardarRec: TBookmark;
begin
  guardarRec := nil;

  if rxVenta.Active and (not rxVenta.IsEmpty) then
    guardarRec := rxVenta.GetBookmark;

  try
    try
      dmInventario.tblTasaITBIS.Close;
      dmInventario.tblTasaITBIS.Open;

      frmValidaFactura := TfrmValidaFactura.Create(nil);
      try
        frmValidaFactura.NCF := UpperCase(Copy(Trim(TotalesTipoNCF.Value), 1, 2));
        frmValidaFactura.TRANS_ITBIS := GlbTransparentaITBI;
        frmValidaFactura.PROPINA_ADICIONAL := TotalesPropina.Value;
        frmValidaFactura.PorcDesAdicional := TotalesPorcDesAdicional.Value;
        frmValidaFactura.MONTORECARGO := TotalesRecargo.Value;

        if (GlbPorcPropina > 0) then
          frmValidaFactura.PROPINA_LEY := GlbPorcPropina
        else
          frmValidaFactura.PROPINA_LEY := 0.0;

        frmValidaFactura.ValidarFactura(rxVenta, Totales);
        frmValidaFactura.ShowModal;
      finally
        FreeAndNil(frmValidaFactura);
      end;

    except
      on E: Exception do
        WriteToLog(E.Message);
    end;

  finally
    if guardarRec <> nil then
    begin
      try
        if rxVenta.Active and rxVenta.BookmarkValid(guardarRec) then
          rxVenta.GotoBookmark(guardarRec);
      finally
        if rxVenta.Active then
          rxVenta.FreeBookmark(guardarRec);
        guardarRec := nil;
      end;
    end;
  end;
end;

//rutina calculos final

procedure TfrmProcVentaRapida.MarcarLineaActiva;
begin
  if (rxVenta <> nil) and rxVenta.Active and (rxVenta.RecordCount > 0) and
     (not rxVentaSerie.IsNull) and (rxVentaSerie.Value > 0) then
    SerieLineaActiva := rxVentaSerie.Value
  else
    SerieLineaActiva := -1;
end;

procedure TfrmProcVentaRapida.RestaurarLineaActiva;
begin
  if RestaurandoLineaActiva then
    Exit;

  if SerieLineaActiva <= 0 then
    Exit;

  if (rxVenta = nil) or (not rxVenta.Active) or (rxVenta.RecordCount = 0) then
    Exit;

  if (not rxVentaSerie.IsNull) and (rxVentaSerie.Value = SerieLineaActiva) then
    Exit;

  RestaurandoLineaActiva := True;
  try
    rxVenta.DisableControls;
    try
      rxVenta.Locate('Serie', SerieLineaActiva, []);
    finally
      rxVenta.EnableControls;
    end;
  finally
    RestaurandoLineaActiva := False;
  end;
end;

procedure TfrmProcVentaRapida.LimpiarRestauracionGrid;
begin
  RestoreGridFocus := False;
  SavedRecNo := -1;
  SavedSerieLinea := -1;
  SavedColIndex := -1;
end;

end.



