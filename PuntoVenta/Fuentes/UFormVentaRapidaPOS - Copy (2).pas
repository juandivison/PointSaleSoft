unit UFormVentaRapidaPOS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, RXDBCtrl, DBCtrls,
  Printers, DB, Mask, RxMemDS, EditNew, IBCustomDataSet, IBQuery, WinSkinData, Menus,
  ShellApi, RXCtrls, IBStoredProc, IBSQL, RxLookup, RXSpin, OleServer,
  RxVerInf, RxGIF, ExcelXP, comObj, rxToolEdit, RxDBComb, IBTable, ComCtrls;

type
  TfrmProcVentaRapidaPOS = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBText1: TDBText;
    Label5: TLabel;
    Label6: TLabel;
    RxSpeedButton5: TRxSpeedButton;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Shape4: TShape;
    Label16: TLabel;
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
    Label24: TLabel;
    Label25: TLabel;
    RxSpeedButton1: TRxSpeedButton;
    Label26: TLabel;
    SpeedButton1: TSpeedButton;
    Label28: TLabel;
    Shape1: TShape;
    DBText9: TDBText;
    DBText10: TDBText;
    DBText11: TDBText;
    DBText12: TDBText;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    DBStatusLabel1: TDBStatusLabel;
    lblFechaCotizacion: TLabel;
    Label40: TLabel;
    lblTasa: TLabel;
    Label42: TLabel;
    lblStatusImpFiscal: TLabel;
    Label43: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    imbBarcode: TImage;
    lblRNC: TLabel;
    Label48: TLabel;
    ProductName: TLabel;
    Version: TLabel;
    rxdbgridTestTipofiscal: TRxDBGrid;
    CheckBox2: TCheckBox;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    RxDBGrid3: TRxDBGrid;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn16: TBitBtn;
    BitBtn25: TBitBtn;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    RxDBGrid1: TRxDBGrid;
    DBEdit3: TDBEdit;
    edtCodigo: TEditN;
    CheckBox1: TCheckBox;
    Panel2: TPanel;
    RxDBGrid2: TRxDBGrid;
    BitBtn10: TBitBtn;
    RxDBLookupCombo1: TRxDBLookupCombo;
    DBEdit6: TDBEdit;
    edtReferencia: TEditN;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;
    edtObservacion: TEdit;
    chkDisplay: TCheckBox;
    SecretPanel1: TSecretPanel;
    cboxTipoUnidad: TComboBox;
    BitBtn17: TBitBtn;
    CheckBox3: TCheckBox;
    panelDescripcionServ: TPanel;
    Label27: TLabel;
    DBMemo1: TDBMemo;
    RxSpinEdit1: TRxSpinEdit;
    rdgFactServicio: TRadioButton;
    rdgFactVentaProducto: TRadioButton;
    BitBtn18: TBitBtn;
    BitBtn19: TBitBtn;
    pnlPrecioProv: TPanel;
    DBText13: TDBText;
    Label34: TLabel;
    Label35: TLabel;
    DBText14: TDBText;
    BitBtn20: TBitBtn;
    DBEdit7: TDBEdit;
    BitBtn21: TBitBtn;
    dbFechaCotizacion: TDBDateEdit;
    BitBtn23: TBitBtn;
    BitBtn24: TBitBtn;
    RxDBLookupCombo2: TRxDBLookupCombo;
    BitBtn26: TBitBtn;
    DBEdit8: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    Button2: TButton;
    Button1: TButton;
    DBEdit9: TDBEdit;
    Panel3: TPanel;
    Label45: TLabel;
    rxspinImpCantCopias: TRxSpinEdit;
    chboxSelTipoNCF: TCheckBox;
    StatusBar: TStatusBar;
    RxDBLookupCombo3: TRxDBLookupCombo;
    chKDescuentoGlobal: TCheckBox;
    DBEdit11: TDBEdit;
    BitBtn27: TBitBtn;
    BitBtn28: TBitBtn;
    DBEdit12: TDBEdit;
    RxDBLookupCombo5: TRxDBLookupCombo;
    DataSource1: TDataSource;
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
    PopupMenu1: TPopupMenu;
    BuscarRNCDGII1: TMenuItem;
    Alquiler1: TMenuItem;
    Lavanderia1: TMenuItem;
    Costura1: TMenuItem;
    RegistroServicioTaller1: TMenuItem;
    RecuperarTransacciones1: TMenuItem;
    MaestroCliente1: TMenuItem;
    Cotizar1: TMenuItem;
    ConsultaGeneral1: TMenuItem;
    Inventario1: TMenuItem;
    MaestroInventario1: TMenuItem;
    LectorCodBarra1: TMenuItem;
    CuadreCaja1: TMenuItem;
    ImprimirRecibo1: TMenuItem;
    NotaDebito1: TMenuItem;
    NotaCrdito1: TMenuItem;
    Devolucin1: TMenuItem;
    ModificarFactura1: TMenuItem;
    ReImprimeDocFiscal1: TMenuItem;
    ReImprimirRecibo1: TMenuItem;
    ReImprimeFacturaContado1: TMenuItem;
    ReImprimeDevolucion1: TMenuItem;
    ReImprimeDevolucionsinFact1: TMenuItem;
    ImpFiscal1: TMenuItem;
    Cancelar1: TMenuItem;
    CancelarTicket1: TMenuItem;
    Estatus1: TMenuItem;
    RecuperaTicketfiscal1: TMenuItem;
    CierreX1: TMenuItem;
    CirreZ1: TMenuItem;
    ConciliarNIF1: TMenuItem;
    NCFSinValorFiscal1: TMenuItem;
    MostrarVistaproductos1: TMenuItem;
    Seguros1: TMenuItem;
    Poliza1: TMenuItem;
    NoGenerarNCF1: TMenuItem;
    ImprimirLabel1: TMenuItem;
    BuscarCliente1: TMenuItem;
    NoMostrarProdVencidos1: TMenuItem;
    Ayuda1: TMenuItem;
    ListarPuertosCom1: TMenuItem;
    ipStpInsertVentMast: TIBStoredProc;
    ipStpInsertCotizaMast: TIBStoredProc;
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
    qryInventarioREFERENCIA: TIBStringField;
    qryInventarioPRECIO_TIPO_UNIDAD: TFloatField;
    qryInventarioTIPO_UNIDAD: TIntegerField;
    qryInventarioPRECIOVENTA1: TFloatField;
    qryInventarioPRECIOVENTA2: TFloatField;
    qryInventarioPRECIOVENTA3: TFloatField;
    qryInventarioPRECIOVENTA4: TFloatField;
    qryInventarioUSARLEVELPRECIO: TSmallintField;
    qryInventarioPORCITBIS: TFloatField;
    qryInventarioDESCRIPCIONADICIONAL: TMemoField;
    qryInventarioCOD_MONEDA: TIBStringField;
    qryInventarioRUTAIMAGEN: TIBStringField;
    ibStpActualizaInvProd: TIBStoredProc;
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
    qryClienteCANT_DIAS_CREDITO: TSmallintField;
    qryClienteCIA_KEY: TIntegerField;
    qryClienteUSARLEVELPRECIO: TSmallintField;
    qryClienteCOD_VENDEDOR: TIntegerField;
    qryClienteTIPO_CF: TIBStringField;
    dsqryCliente: TDataSource;
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
    rxqryInv: TRxMemoryData;
    rxqryInvCODIGO: TIntegerField;
    rxqryInvCODIGO_TEXTO: TStringField;
    rxqryInvDESCRIPCION: TStringField;
    rxqryInvPRECIO: TCurrencyField;
    rxqryInvREFERENCIA: TStringField;
    rxqryInvPAGA_ITBI: TSmallintField;
    rxqryInvPRECIO_MINIMO: TCurrencyField;
    rxqryInvCANTIDAD: TCurrencyField;
    rxqryInvINVENTARIAR: TIntegerField;
    rxqryInvPORC_DESCUENTO: TCurrencyField;
    rxqryInvPrecioXTipoUnidad: TCurrencyField;
    rxqryInvTipoUnidad: TIntegerField;
    dsrxqryInv: TDataSource;
    ibsqlVerificaSerie: TIBSQL;
    qryPrecioXTipoUnidad: TIBQuery;
    qryPrecioXTipoUnidadID_PROD: TIntegerField;
    qryPrecioXTipoUnidadID_UNIDAD: TIntegerField;
    qryPrecioXTipoUnidadPRECIO: TFloatField;
    DataSource3: TDataSource;
    rxPreventa: TRxMemoryData;
    rxPreventaSerie: TIntegerField;
    rxPreventaNumero: TIntegerField;
    ibsqlDeletePreventaDet: TIBSQL;
    ibsqlDeletePreventaMaster: TIBSQL;
    SkinData1: TSkinData;
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
    tblRecovertransID: TIntegerField;
    tblRecovertransCOD_USUARIO: TIntegerField;
    ibsqlGetPorcDescFctSvr: TIBSQL;
    qryProdPorProveedor: TIBQuery;
    qryProdPorProveedorFECHA: TDateTimeField;
    qryProdPorProveedorCODIGO_PROV: TSmallintField;
    qryProdPorProveedorNOMBREPROVEEDOR: TIBStringField;
    qryProdPorProveedorPRECIO: TFloatField;
    qryProdPorProveedorTELEFONO: TIBStringField;
    qryProdPorProveedorEMAIL: TIBStringField;
    dsqryProdPorProveedor: TDataSource;
    ibStpInsertVentaDet: TIBStoredProc;
    stpUpdateVentaDetU1: TIBStoredProc;
    stpProc_UpdateVENTAS_MAST_U1: TIBStoredProc;
    stpProcUpdateFactU1: TIBStoredProc;
    stpProcUpdateTrnCxcU1: TIBStoredProc;
    stpProcUpdateBlcCteCxc: TIBStoredProc;
    stpProcUpdateFActPendu1: TIBStoredProc;
    ibstpUpdateCotizaMaster: TIBStoredProc;
    stpProcUpdteCotDet: TIBStoredProc;
    ibsqlDeleteSerieCotizaDet: TIBSQL;
    tblMoneda: TIBTable;
    tblMonedaCODIGO: TIBStringField;
    tblMonedaDESCRIPCION: TIBStringField;
    tblMonedaFECHA_IN: TDateTimeField;
    tblMonedaFECHA_UPCAMPO_FECHA_HORA: TDateTimeField;
    tblMonedaMODIFICADO_POR: TIBStringField;
    tblMonedaSIMBOLO: TIBStringField;
    dstblMoneda: TDataSource;
    qryInvRutaImg: TIBQuery;
    qryInvRutaImgCODIGO: TIntegerField;
    qryInvRutaImgCODIGO_BARRA: TIBStringField;
    qryInvRutaImgCODIGO_TEXTO: TIBStringField;
    qryInvRutaImgRUTAIMAGEN: TIBStringField;
    QryPrecios: TIBQuery;
    QryPreciosCODIGO: TIntegerField;
    QryPreciosPRECIOVENTA1: TFloatField;
    QryPreciosPRECIOVENTA2: TFloatField;
    QryPreciosPRECIOVENTA3: TFloatField;
    QryPreciosPRECIOVENTA4: TFloatField;
    DSQryPrecios: TDataSource;
    rxPagos: TRxMemoryData;
    rxPagosSerie: TIntegerField;
    ibslqlUpdatetrnpagos: TIBSQL;
    stpProcRecDatosReimpfiscal: TIBStoredProc;
    qryVerificaReciboPdte: TIBQuery;
    qryVerificaReciboPdteNIF_IMPRESO: TSmallintField;
    qryVerificaReciboPdteNUMERO: TIntegerField;
    qryVerificaReciboPdteFORMA_PAGO: TSmallintField;
    qryVerificaReciboPdteNUMERO_FACTURA: TIntegerField;
    qryVerificaReciboPdteNUMERO_DOC_PAGO: TIBStringField;
    ibStpInsertCotizaDet: TIBStoredProc;
    tblnif_ctrl: TIBDataSet;
    tblnif_ctrlNUMERO_TRN: TIntegerField;
    tblnif_ctrlNIF: TIBStringField;
    tblnif_ctrlFECHA_IN: TDateTimeField;
    tblnif_ctrlFECHA_UPDATE: TDateTimeField;
    tblnif_ctrlSTATUS: TIBStringField;
    PopupMenu2: TPopupMenu;
    VerDetalleVenta1: TMenuItem;
    IBQuery1: TIBQuery;
    PopupMenu3: TPopupMenu;
    VerTipoComprobantes1: TMenuItem;
    updTipoRetencionVta: TIBSQL;
    qryCheckDetVta: TIBQuery;
    dsqryPrecioUnidadSurt: TDataSource;
    tblPOSTotales: TIBDataSet;
    tblPOSTotalesNUMERO: TIntegerField;
    tblPOSTotalesFECHA: TDateTimeField;
    tblPOSTotalesSUBTOTAL: TFloatField;
    tblPOSTotalesITBIS: TFloatField;
    tblPOSTotalesMONTODESC: TFloatField;
    tblPOSTotalesTOTALNETO: TFloatField;
    tblPOSTotalesMONTORECIBIDO: TFloatField;
    tblPOSTotalesDEVOLUCION: TFloatField;
    tblPOSTotalesCODCLIENTE: TIntegerField;
    tblPOSTotalesNOMBRECLIENTE: TIBStringField;
    tblPOSTotalesDIRECCION: TIBStringField;
    tblPOSTotalesTELEFONO: TIBStringField;
    tblPOSTotalesPORCDESADICIONAL: TFloatField;
    tblPOSTotalesMONTODESCADICIONAL: TFloatField;
    tblPOSTotalesNCF_NUMERO: TIBStringField;
    tblPOSTotalesMONTOINTERES: TFloatField;
    tblPOSTotalesPORCIENTOINTERES: TFloatField;
    tblPOSTotalesQRLABELNCFDESC: TIBStringField;
    tblPOSTotalesRNC_NUMERO: TIBStringField;
    tblPOSTotalesFECHAVENCE: TDateTimeField;
    tblPOSTotalesMONTODESCGASTOSADMIN: TFloatField;
    tblPOSTotalesMONTODESCITBISGASTOSADMIN: TFloatField;
    tblPOSTotalesMONTODESCTRANSP: TFloatField;
    tblPOSTotalesMONTODESCDIRTECNICA: TFloatField;
    tblPOSTotalesMONTODESCITBISDIRTECNICA: TFloatField;
    tblPOSTotalesMONTODESCIMPREVISTO: TFloatField;
    tblPOSTotalesMONTODESCITBISIMPREVISTO: TFloatField;
    tblPOSTotalesPORCGADMIN: TIBStringField;
    tblPOSTotalesPORCITBISGADMIN: TIBStringField;
    tblPOSTotalesPORCTRANS: TIBStringField;
    tblPOSTotalesPORCDIRTEC: TIBStringField;
    tblPOSTotalesPORCITBISDIRTEC: TIBStringField;
    tblPOSTotalesPORCIMPREVISTO: TIBStringField;
    tblPOSTotalesPORCITBISIMPREVISTO: TIBStringField;
    tblPOSTotalesTPORCGADMIN: TFloatField;
    tblPOSTotalesTPORCITBISGADMIN: TFloatField;
    tblPOSTotalesTPORCTRANS: TFloatField;
    tblPOSTotalesTPORCDIRTEC: TFloatField;
    tblPOSTotalesTPORCITBISDIRTEC: TFloatField;
    tblPOSTotalesTPORCIMPREVISTO: TFloatField;
    tblPOSTotalesTPORCITBISIMPREVISTO: TFloatField;
    tblPOSTotalesCOMENTARIO: TIBStringField;
    tblPOSTotalesFECHACOTIZACION: TDateTimeField;
    tblPOSTotalesMONEDA: TIBStringField;
    tblPOSTotalesMONTOENTARJETA: TFloatField;
    tblPOSTotalesMONTOENEFECTIVO: TFloatField;
    tblPOSTotalesMONTOENCHEQUE: TFloatField;
    tblPOSTotalesMONTOENBONOS: TFloatField;
    tblPOSTotalesDIFERENCIA: TFloatField;
    tblPOSTotalesMONTONOTACREDITO: TFloatField;
    tblPOSTotalesMONTONCRAPLICADO: TFloatField;
    tblPOSTotalesREFERENCIACTE: TIBStringField;
    tblPOSTotalesNUMEROTRN: TIntegerField;
    tblPOSTotalesMONTODESCITEMS: TFloatField;
    tblPOSTotalesRECARGO: TFloatField;
    tblPOSTotalesTIPONCF: TIBStringField;
    tblPOSTotalesTIPONCFIFISCAL: TIntegerField;
    tblPOSTotalesMONTOEXONERAITBIS: TFloatField;
    tblPOSTotalesMONTOITBISRECARGO: TFloatField;
    tblPOSTotalesMONTOITBRECITMCONDESC: TFloatField;
    tblPOSTotalesMONTODESCGLBITBIS: TFloatField;
    tblPOSTotalesPROPINA: TFloatField;
    tblPOSTotalesPROPINALEGAL: TFloatField;
    dstblPOSTotales: TDataSource;
    tblPOSVentadet: TIBDataSet;
    tblPOSVentadetSERIE: TIntegerField;
    tblPOSVentadetNUMERO: TIntegerField;
    tblPOSVentadetFECHA: TDateTimeField;
    tblPOSVentadetCANT: TFloatField;
    tblPOSVentadetPRECIO: TFloatField;
    tblPOSVentadetMONTOBRUTO: TFloatField;
    tblPOSVentadetDESCRIPCION: TIBStringField;
    tblPOSVentadetDEVOLUCION: TFloatField;
    tblPOSVentadetMONTONETO: TFloatField;
    tblPOSVentadetCODUSUARIO: TIntegerField;
    tblPOSVentadetCODARTICULO: TIntegerField;
    tblPOSVentadetNUMERORECIBO: TIntegerField;
    tblPOSVentadetCODTEXTO: TIBStringField;
    tblPOSVentadetNCF: TIBStringField;
    tblPOSVentadetNUMEROTRN: TIntegerField;
    tblPOSVentadetPORC_DESC: TFloatField;
    tblPOSVentadetITBI: TFloatField;
    tblPOSVentadetMONTODESCUENTO: TFloatField;
    tblPOSVentadetSERIEPROD: TIBStringField;
    tblPOSVentadetNUMEROFACTURA: TIntegerField;
    tblPOSVentadetINVETARIAR: TSmallintField;
    tblPOSVentadetLOTENUM: TIBStringField;
    tblPOSVentadetMONTOITBISENPRECIO: TFloatField;
    tblPOSVentadetREFERENCIA: TIBStringField;
    tblPOSVentadetNUMERODOC: TIntegerField;
    tblPOSVentadetTIPOUNIDAD: TIntegerField;
    tblPOSVentadetDESCUNIDADMEDIDA: TIBStringField;
    tblPOSVentadetITBISEXENTO: TSmallintField;
    tblPOSVentadetTIPOVENTA: TIntegerField;
    tblPOSVentadetDESCRIPCIONESPECIAL: TMemoField;
    tblPOSVentadetMONTODESGASTOADMIN: TFloatField;
    tblPOSVentadetMONTODESCITBISGASTOSADMIN: TFloatField;
    tblPOSVentadetMONTODESCTRANSP: TFloatField;
    tblPOSVentadetMONTODESCDIRTECNICA: TFloatField;
    tblPOSVentadetMONTODESCITBISDIRTEC: TFloatField;
    tblPOSVentadetMONTODESCIMPREVISTO: TFloatField;
    tblPOSVentadetMONTODESCITBISIMPREVISTO: TFloatField;
    tblPOSVentadetSERIEORIGINAL: TIntegerField;
    tblPOSVentadetNUMEROTRNORIGINAL: TIntegerField;
    tblPOSVentadetNUMEROCOTIZA: TIntegerField;
    tblPOSVentadetMONEDA: TIBStringField;
    tblPOSVentadetMONEDABASE: TIBStringField;
    tblPOSVentadetRUTAIMAGEN: TIBStringField;
    tblPOSVentadetCOSTOPRODUCTO: TFloatField;
    tblPOSVentadetGLBCODVENDEDOR: TIntegerField;
    tblPOSVentadetPORCDESCITEM: TFloatField;
    tblPOSVentadetMONTODESCITEM: TFloatField;
    tblPOSVentadetRECARGO: TFloatField;
    tblPOSVentadetMONTOTRANSPITBIS: TFloatField;
    tblPOSVentadetMONTOITBISRECARGO: TFloatField;
    tblPOSVentadetMONTODESGLOBAL: TFloatField;
    tblPOSVentadetIDTASAITBIS: TIntegerField;
    tblPOSVentadetMONTOITBRECITMCONDESC: TFloatField;
    tblPOSVentadetMONTODESCGLBDIST: TFloatField;
    tblPOSVentadetMONTO_TASA: TFloatField;
    tblPOSVentadetCANTPAX: TIntegerField;
    tblPOSVentadetFECHA_IN: TDateTimeField;
    tblPOSVentadetCOD_USUARIO: TIntegerField;
    tblPOSVentadetSTATUS: TIBStringField;
    qryPosCtrlSecuencia: TIBDataSet;
    qryPosCtrlSecuenciaFECHA: TDateTimeField;
    qryPosCtrlSecuenciaCOD_USUARIO: TIntegerField;
    qryPosCtrlSecuenciaNUMERO: TIntegerField;
    qryPosCtrlSecuenciaSTATUS: TIBStringField;
    tblPOSVentasMast: TIBDataSet;
    tblPOSVentasMastNUMERO: TIntegerField;
    tblPOSVentasMastFECHA: TDateTimeField;
    tblPOSVentasMastCIA_KEY: TIntegerField;
    tblPOSVentasMastCODIGO_CTE: TIntegerField;
    tblPOSVentasMastCODIGO_VENDEDOR: TIntegerField;
    tblPOSVentasMastFORMA_PAGO: TSmallintField;
    tblPOSVentasMastOBSERVACION: TIBStringField;
    tblPOSVentasMastMONEDA: TIBStringField;
    tblPOSVentasMastVALOR_TOTAL_DET: TFloatField;
    tblPOSVentasMastSTATUS: TIBStringField;
    tblPOSVentasMastFECHA_IN: TDateTimeField;
    tblPOSVentasMastIN_POR: TIBStringField;
    tblPOSVentasMastFECHA_MOD: TDateTimeField;
    tblPOSVentasMastMOD_POR: TIBStringField;
    tblPOSVentasMastNUMERO_FACTURA: TIntegerField;
    tblPOSVentasMastNUMERO_DOC_PAGO: TIBStringField;
    tblPOSVentasMastSERIE_NCF_ASIGNADO: TIntegerField;
    tblPOSVentasMastMONTO_BRUTO: TFloatField;
    tblPOSVentasMastPORC_DESCUENTO: TIntegerField;
    tblPOSVentasMastMONTO_DESCUENTO: TFloatField;
    tblPOSVentasMastMONTO_INICIAL: TFloatField;
    tblPOSVentasMastNOMBRE_CLIENTE_GENERAL: TIBStringField;
    tblPOSVentasMastMONTO_PAGADO: TFloatField;
    tblPOSVentasMastMONTO_CAMBIO: TFloatField;
    tblPOSVentasMastMONTO_TOTAL_ITBIS: TFloatField;
    tblPOSVentasMastMONTODESCGASTOSADMIN: TFloatField;
    tblPOSVentasMastMONTODESCITBISGASTOSADMIN: TFloatField;
    tblPOSVentasMastMONTODESCTRANSP: TFloatField;
    tblPOSVentasMastMONTODESCDIRTECNICA: TFloatField;
    tblPOSVentasMastMONTODESCITBISDIRTECNICA: TFloatField;
    tblPOSVentasMastMONTODESCIMPREVISTO: TFloatField;
    tblPOSVentasMastMONTODESCITBISIMPREVISTO: TFloatField;
    tblPOSVentasMastDESC_MONTO_COMBUSTIBLE: TFloatField;
    tblPOSVentasMastDESC_MONTO_PRESTAMO: TFloatField;
    tblPOSVentasMastDESC_MONTO_SINDICATO: TFloatField;
    tblPOSVentasMastDESC_IMP_SOBRE_RENTA: TFloatField;
    tblPOSVentasMastDESC_OTROS: TFloatField;
    tblPOSVentasMastPORC_DESC_SINDICATO: TIBBCDField;
    tblPOSVentasMastPORC_DESC_IMP_SOBRE_RENTA: TIBBCDField;
    tblPOSVentasMastDESC_RUTA: TFloatField;
    tblPOSVentasMastOTROS_DESCUENTOS_2: TFloatField;
    tblPOSVentasMastOTROS_DESCUENTOS_3: TFloatField;
    tblPOSVentasMastMONTO_DESC_CHOFER: TFloatField;
    tblPOSVentasMastTIPO_VENTA: TSmallintField;
    tblPOSVentasMastCOMENTARIO: TIBStringField;
    tblPOSVentasMastCOTIZACION_ORIGEN: TIntegerField;
    tblPOSVentasMastREFERENCIACTE: TIBStringField;
    tblPOSVentasMastMONTO_RECARGO: TFloatField;
    tblPOSVentasMastTIPONCFIFISCAL: TIntegerField;
    tblPOSVentasMastMONTO_EXONERADO_ITBIS: TFloatField;
    tblPOSVentasMastNIF_IMPRESO: TSmallintField;
    tblPOSVentasMastIDRETENCION: TIntegerField;
    tblPOSVentasMastPORCPROPINALEGAL: TFloatField;
    tblPOSVentasMastPROPINA: TFloatField;
    tblPOSVentasMastPROPINALEGAL: TFloatField;
    tblPOSVentasMastMONTONCRAPLICADO: TFloatField;
    tblPOSVentasMastFECHACOTIZACION: TDateTimeField;
    tblPOSVentasMastMontoSubTotalIndirectos: TCurrencyField;
    tblPOSVentasMastDiferencia: TCurrencyField;
    tblPOSVentasMastTOTALNETO: TFloatField;
    tblPOSVentasMastPORCDESADICIONAL: TFloatField;
    tblPOSVentasMastTIPONCF: TIBStringField;
    tblPOSVentasMastMONTOEXONERAITBIS: TFloatField;
    DBStatusLabel2: TDBStatusLabel;
    dstblPOSVentasMast: TDataSource;
    tblPOSVentasMastNOTACREDITO: TFloatField;
    tblPOSVentasMastDEVOLUCION: TFloatField;
    BitBtn6: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    BitBtn15: TBitBtn;
    bitBtnEditarFact: TBitBtn;
    BitBtn22: TBitBtn;
    BitBtn29: TBitBtn;
    btnPagoExacto: TBitBtn;
    Label4: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText5: TDBText;
    DBText7: TDBText;
    DBText6: TDBText;
    Label17: TLabel;
    DBText8: TDBText;
    Label29: TLabel;
    DBText15: TDBText;
    Label41: TLabel;
    Label44: TLabel;
    dbTextMontoExoneraITBIS: TDBText;
    Edit1: TEdit;
    chkExento: TCheckBox;
    DBEdit10: TDBEdit;
    panelFastFood: TPanel;
    DBText17: TDBText;
    Label49: TLabel;
    Label50: TLabel;
    DBEdit13: TDBEdit;
    chkNoLeyPropina: TCheckBox;
    CheckBox4: TCheckBox;
    DBText18: TDBText;
    DBText19: TDBText;
    tblPOSVentadetSERIE_COTIZA: TIntegerField;
    DBText16: TDBText;
    DBText4: TDBText;
    tblPOSTotalesMontoSubTotalIndirectos: TCurrencyField;
    DBStatusLabel3: TDBStatusLabel;
    qryTotalTbis: TIBQuery;
    qryTotalTbisITBI_TOTAL: TFloatField;
    qryPROC_POSRecalcVtaDet: TIBQuery;
    tblPOSTotalesSUBTOTALCLD: TFloatField;
    tblPOSVentadetMONBTOBRUTOCLD: TFloatField;
    tblPOSVentadetMONTODESCITEMCLD: TFloatField;
    tblPOSVentadetFMONTODESCNIVELITEMCLD: TFloatField;
    tblPOSVentadetITBIS_TOTAL: TFloatField;
    tblPOSTotalesDifereciaCldo: TCurrencyField;
    datosVtatest: TMenuItem;
    qryPosCtrlSecuenciaNUMERO_TRN_DET: TIntegerField;
    qryPROC_POSRecalcVtaDetFECHA: TDateTimeField;
    qryPROC_POSRecalcVtaDetSERIE: TSmallintField;
    qryPROC_POSRecalcVtaDetNUMERO: TSmallintField;
    qryPROC_POSRecalcVtaDetCANT: TFloatField;
    qryPROC_POSRecalcVtaDetPRECIO: TFloatField;
    qryPROC_POSRecalcVtaDetCANTPAX: TSmallintField;
    qryPROC_POSRecalcVtaDetMONTOBRUTO: TFloatField;
    qryPROC_POSRecalcVtaDetPORCDESCITEM: TFloatField;
    qryPROC_POSRecalcVtaDetMONTODESCITEM: TFloatField;
    qryPROC_POSRecalcVtaDetPORC_DESC: TFloatField;
    qryPROC_POSRecalcVtaDetTIPOVENTA: TSmallintField;
    qryPROC_POSRecalcVtaDetIDTASAITBIS: TSmallintField;
    qryPROC_POSRecalcVtaDetTASAITBIS: TFloatField;
    qryPROC_POSRecalcVtaDetITBI: TFloatField;
    qryPROC_POSRecalcVtaDetMONTOITEBISRECARGO: TFloatField;
    qryPROC_POSRecalcVtaDetMONTODESCGLOBAL: TFloatField;
    qryPROC_POSRecalcVtaDetSTATUS: TIBStringField;
    qryPROC_POSRecalcVtaDetMONTO_RECARGO_GLB: TFloatField;
    qryPROC_POSRecalcVtaDetSUBTOTAL: TFloatField;
    qryPROC_POSRecalcVtaDetDESCMONTOITEBISRECARGO: TFloatField;
    qryPROC_POSRecalcVtaDetFMONTODESCNIVELITEM: TFloatField;
    qryPROC_POSRecalcVtaDetITBIS_TOTAL: TFloatField;
    tblPOSTotalesTOTALITBI_CLD: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure NoGenerarNCF1Click(Sender: TObject);
    procedure LectorCodBarra1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn4Click(Sender: TObject);
    procedure btnPagoExactoClick(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure BitBtn25Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure edtCodigoExit(Sender: TObject);
    procedure edtCodigoChange(Sender: TObject);
    procedure FormClick(Sender: TObject);
    procedure RxDBLookupCombo3Exit(Sender: TObject);
    procedure RxSpeedButton1Click(Sender: TObject);
    procedure BuscarRNCDGII1Click(Sender: TObject);
    procedure Alquiler1Click(Sender: TObject);
    procedure Lavanderia1Click(Sender: TObject);
    procedure Costura1Click(Sender: TObject);
    procedure RegistroServicioTaller1Click(Sender: TObject);
    procedure RecuperarTransacciones1Click(Sender: TObject);
    procedure MaestroCliente1Click(Sender: TObject);
    procedure Cotizar1Click(Sender: TObject);
    procedure ConsultaGeneral1Click(Sender: TObject);
    procedure Inventario1Click(Sender: TObject);
    procedure MaestroInventario1Click(Sender: TObject);
    procedure CuadreCaja1Click(Sender: TObject);
    procedure ImprimirRecibo1Click(Sender: TObject);
    procedure NotaDebito1Click(Sender: TObject);
    procedure NotaCrdito1Click(Sender: TObject);
    procedure Devolucin1Click(Sender: TObject);
    procedure ListarPuertosCom1Click(Sender: TObject);
    procedure Ayuda1Click(Sender: TObject);
    procedure NoMostrarProdVencidos1Click(Sender: TObject);
    procedure ImprimirLabel1Click(Sender: TObject);
    procedure Seguros1Click(Sender: TObject);
    procedure ConciliarNIF1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SpeedButton1Click(Sender: TObject);
    procedure RxDBLookupCombo1Change(Sender: TObject);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure edtCodigoEnter(Sender: TObject);
    procedure BuscarCliente1Click(Sender: TObject);
    procedure DBEdit1Enter(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure RxDBGrid2DblClick(Sender: TObject);
    procedure RxDBGrid2Exit(Sender: TObject);
    procedure RxDBGrid2GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure RxDBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RxDBGrid2KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit2Exit(Sender: TObject);
    procedure BitBtn27Click(Sender: TObject);
    procedure RxDBGrid2Enter(Sender: TObject);
    procedure RxDBLookupCombo5Change(Sender: TObject);
    procedure RxDBLookupCombo5Enter(Sender: TObject);
    procedure DBEdit12Exit(Sender: TObject);
    procedure RxSpinEdit1Exit(Sender: TObject);
    procedure RxSpinEdit1Change(Sender: TObject);
    procedure DBEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit2Enter(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure RxDBLookupCombo2Change(Sender: TObject);
    procedure RxDBLookupCombo2Click(Sender: TObject);
    procedure RxDBLookupCombo2Enter(Sender: TObject);
    procedure RxDBLookupCombo2Exit(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure DBEdit9Exit(Sender: TObject);
    procedure DBRadioGroup1Click(Sender: TObject);
    procedure RxDBGrid3DblClick(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure DBEdit10Enter(Sender: TObject);
    procedure DBEdit10Exit(Sender: TObject);
    procedure tblPOSVentasMastBeforePost(DataSet: TDataSet);
    procedure tblPOSVentadetAfterPost(DataSet: TDataSet);
    procedure RxDBLookupCombo3Change(Sender: TObject);
    procedure DBRadioGroup1Enter(Sender: TObject);
    procedure DBRadioGroup1Exit(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure DBEdit11Change(Sender: TObject);
    procedure DBEdit11Enter(Sender: TObject);
    procedure DBEdit11Exit(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure DBEdit5Exit(Sender: TObject);
    procedure DBEdit5Enter(Sender: TObject);
    procedure BitBtn29Click(Sender: TObject);
    procedure BitBtn22Click(Sender: TObject);
    procedure bitBtnEditarFactClick(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure chkNoLeyPropinaClick(Sender: TObject);
    procedure cboxTipoUnidadChange(Sender: TObject);
    procedure cboxTipoUnidadEnter(Sender: TObject);
    procedure cboxTipoUnidadExit(Sender: TObject);
    procedure dbFechaCotizacionClick(Sender: TObject);
    procedure dbFechaCotizacionEnter(Sender: TObject);
    procedure dbFechaCotizacionExit(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure BitBtn20Click(Sender: TObject);
    procedure tblPOSVentadetAfterDelete(DataSet: TDataSet);
    procedure DBEdit1Change(Sender: TObject);
    procedure DBEdit2Change(Sender: TObject);
    procedure RxDBLookupCombo5Exit(Sender: TObject);
    procedure tblPOSTotalesCalcFields(DataSet: TDataSet);
    procedure tblPOSTotalesAfterScroll(DataSet: TDataSet);
    procedure CheckBox1Click(Sender: TObject);
    procedure tblPOSTotalesBeforePost(DataSet: TDataSet);
    procedure chKDescuentoGlobalClick(Sender: TObject);
    procedure tblPOSVentadetBeforePost(DataSet: TDataSet);
    procedure BitBtn28Click(Sender: TObject);
    procedure tblPOSVentadetAfterScroll(DataSet: TDataSet);
    procedure Estatus1Click(Sender: TObject);
    procedure RecuperaTicketfiscal1Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure ReImprimirRecibo1Click(Sender: TObject);
    procedure datosVtatestClick(Sender: TObject);
    procedure tblPOSVentadetAfterInsert(DataSet: TDataSet);
    procedure tblPOSVentadetBeforeClose(DataSet: TDataSet);
    procedure tblPOSTotalesBeforeClose(DataSet: TDataSet);
    procedure tblPOSVentasMastBeforeClose(DataSet: TDataSet);
    procedure RxDBGrid1Exit(Sender: TObject);
    procedure RxDBGrid1Enter(Sender: TObject);
    procedure tblPOSVentadetNUMEROValidate(Sender: TField);
    procedure DBEdit9Enter(Sender: TObject);
    procedure DBEdit10Change(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure tblPOSTotalesAfterOpen(DataSet: TDataSet);
    procedure DBEdit7Exit(Sender: TObject);
    procedure tblPOSVentasMastAfterScroll(DataSet: TDataSet);
  private
    procedure ActualizaBalanceCteCxc;  
    procedure ActualizaFactura;
    procedure ActualizaFactPendiente;
    procedure ActualizaTransCxc;
    procedure ActualizaVentaDet;
    procedure ActualizaVentaMaster(fpago : String;serieNcfAsignado: Integer);
    procedure ImpFacturaservicio(numerotrn:Integer;EsReimpresion:Boolean);
    procedure ExportarGridExcel;
    Procedure ImprimeDocumento(serieDoc:integer);
    procedure ReactivarValores;
    procedure ProcesaFacturar(tipo : smallint;numdoc:integer;codcte:integer);
    procedure ProcVentaConNCF(tiponcf:String; Var valorNCF:String; Var seriedoc:Integer; Var serie_asignadoncf : Integer);
    procedure ProcVenta(valorNCF:String; Serie_Asignadoncf:Integer; Var serieDoc:Integer);
    Procedure PrepararInfoFiscal(numerotrn:integer);
    procedure InsertarCotizacionDet(numero : Integer);
    procedure ActualizaCotizacionMaster;
    function VerificaRecordsVenta:boolean;
    procedure ActualizarPreventa;  
    procedure Finalizardisplay;
    procedure ActualizaInvAlmacen;
    Procedure InsertaTransCafeteria(numTrn : Integer;codigoP:Integer;cantP:Real);
    procedure InsertarDet(numero : Integer);
    procedure ProcInsertarDetCheque(numtrn : integer);
    procedure ProcInsertarDetPagos(numtrn : integer);
    procedure ProcInsertarDetBono(numtrn : integer);
    
    Procedure FInsertarDatosCtrlNIF(_numerotrnvta:Integer);
    Procedure ProcGetUltNcf(tipo:string);
    procedure ProcesaNuevo;
    Function VerificaClave:Boolean;
    procedure ImprimeFiscalContado(xNumeroTrn:Integer);
    procedure AsignarSqlText(campo:String; valor:string; OrderBy : String);
    procedure ProcActUltTrn;
    procedure ActivarBotonesEnModifica;
    Procedure ProcesaEstadoImpresora;

    procedure ProcMostrarVersion;
    procedure AbrirUnidades;
    procedure NotificaErrorByEmail(sms:string);
    Procedure ProcActualizaMsg;
    procedure InicializaOtrosDesc;

    procedure AbrirClasifPrecio;
    procedure AplicaPrecioMayorista;
    procedure AsignaNCFCFinalX(TIPO_NCF_IFISCAL: integer);

    procedure ProcEntradaCliente;
    Function BuscarRutaImagen(codProducto : Integer):String;
    Procedure SetPrecioPorCantidad;
    Function precioXUnidad(idTipoUnidad:Integer;idProducto: Integer): Extended;
    procedure ProcCalculoDivisa;
    Procedure PosVentaDetRefrescar(tipo:smallint);
    procedure POSTotales_Data;
    procedure ProcNCFExoNCFVisible;

    procedure DescargaNotaCredito;
    procedure CrearNCreditoEnDevolucion;
    procedure UpdateServINFO(numVta : integer);
    procedure UpdateServAlquiler(numVta : integer);
    Procedure AbrirDatosParaTicket(
              CheckBox1_Checked:Boolean;
              rdgCredito_Checked:boolean;
              edtCodCte_Text:String;
              EditN1_ValueInteger:integer;
              DateTimePicker1_Date:TDateTime);
    procedure InsertarCotizacionDetUpd(numero, serie: Integer);
  public

    NoTieneCredito :  boolean;
    NumTrnServ : integer;
    NumTrnServAlq : integer;
    sumarDatos  : Boolean;
    AbortarPostServTaller : boolean;
    canCloseAlquiler: boolean;
    NumTicketFFood: integer;
    
    procedure LlenarrxSolDatoscte(codCte:integer);
    Function CheckPortComDisponible:boolean;
    Function VerificaLimiteCredito(codigocte:integer;MontoVenta:Real):Boolean;
    procedure AsignaNCFCFinal;
    procedure ActFastFoodTicket(numTicket:Integer);
    Function GetNumSecuenciaVta(codUsuario:integer;fecha:TDateTime):Integer;
    Procedure VerificaSiExisteVta;
    procedure ProcGuardarDetalle;
    procedure ProcSetNCFCliente;
    procedure PosDescItemGlb;
  end;

Const
  FormaPagoNotaDebito = 6;//Devolucion
  TipoPagoFactura = 7;//Factura-Credito
  //PORC_TRANSP_ITBIS = 16/1.16;//13.79;
var

  NCFCambio,recuperando : Boolean;
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
  NumeroTrn : Integer;
  _abortar, EsBrowsing, EsEditando : Boolean;
  LlenandoDatos : Boolean;
  precioSum : Currency;
  procCalc,EsProdVencido : Boolean;
  _ulttrnImp : string;
  pesoProd: String;
  entraDessGlb, EsReimp, esCargaDatosFFood : boolean;
  serieBooked, numRecoverMaster : integer;

  frmProcVentaRapidaPOS: TfrmProcVentaRapidaPOS;

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
  UProcCierreJornada, UDatModCalculos, UTemporalVtaFormPos,
  UFormConsultaDatosVenta, UConciliarNIF, UActivapermisos,
  UFormVerDetalleVta, UQckFactCredArtioffice8_5_F_1Std,
  URepRecibo8_5_11DevolREspinal, URepRecibo8_5_11REspinalReimp,
  frmVerComprobantes, UFormPuertosLibres, UQckCotiza8_5_FormG,
  UCtrlAlquiler, URepComprobanteDevol, UCtrlEnvioaLavanderia,
  URepComprobanteReimp, UQckCotiza8_5_F_1ByMPrefact, UQckFactServ8_5BB,
  UQckFactServ8_5Ayaco, URepComprobanteDevol_3Pulg, UDatModFastFood,
  URepReimpFastFoodPOS, URepReimpTicketSurtidora, UBuscarRazonSocialDBDgii,
  UDatModDGII, UFormTestDatosVta;

{$R *.dfm}

  function esNumero(valor:String):Boolean;
  begin
    if (Valor[1] =  '0') or (Valor[1] =  '1') or (Valor[1] =  '2')
    or (Valor[1] =  '3') or (Valor[1] =  '4') or (Valor[1] =  '5')
    or (Valor[1] =  '6') or (Valor[1] =  '7')
    or (Valor[1] =  '8') or (Valor[1] =  '9') then
    result:= True else result:= False;
  end;

procedure TfrmProcVentaRapidaPOS.POSTotales_Data;
begin
  if (tblPOSVentadetNUMERO.Value = 0) or
  tblPOSVentadetNUMERO.IsNull then exit;
  if tblPOSTotales.State = dsinactive then
  begin
    tblPOSTotales.Params[0].value:=
    tblPOSVentadetNUMERO.Value;
    tblPOSTotales.Open;
    tblPOSTotales.First;
    if tblPOSTotales.RecordCount = 0 then
    begin
      tblPOSTotales.Insert;
      tblPOSTotalesTOTALNETO.Value:=0;
      tblPOSTotalesSubTotal.Value :=0;
      tblPOSTotalesRecargo.Value  :=0;
      tblPOSTotalesMontoDescItems.value     :=0;
      tblPOSTotalesMontoDescAdicional.Value :=0;
      tblPOSTotalesPropina.Value      :=0;
      tblPOSTotalesPropinaLegal.Value :=0;

      tblPOSTotalesNUMERO.Value:=
      tblPOSVentadetNUMERO.Value;
      tblPOSTotalesFECHA.Value:=
      tblPOSVentadetFECHA.Value;
    end;
  end else
  if tblPOSTotales.State = dsBrowse then
  begin
    tblPOSTotales.Edit;
    tblPOSTotalesNUMERO.Value:=
    tblPOSVentadetNUMERO.Value;
    tblPOSTotalesFECHA.Value:=
    tblPOSVentadetFECHA.Value;
    tblPOSTotales.Params[0].Value:=
    tblPOSVentadetNUMERO.Value;
  end;
  GlbSalvarQuery(tblPOSTotales);
end;

procedure TfrmProcVentaRapidaPOS.FormCreate(Sender: TObject);
begin
  if tblPOSVentaDet.State = dsInactive then
  tblPOSVentaDet.Open;
  
  VerificaSiExisteVta;

  numRecoverMaster:=-1;
  StatusImpFiscal:=False;
  if isShowing then
  edtCodigo.SetFocus;
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
  ProcActualizaMsg;   //1x
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
    

    //ActualizarRecoverData;
    EsModificandoFactura := False;
    GlbUsandoCotiza      := False;
    bitBtnEditarFact.Visible := False;
    bitBtnEditarFact.Top := 475;
    bitBtnEditarFact.SendToBack;
    Label36.Visible:=False;
    ActivarBotonesEnModifica;
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

    dmCompania.tblCompania.Close;
    dmCompania.tblCompania.Open;
    dmCompania.tblCompania.Locate('codigo', glbCia_Key,[]);
    Label10.Caption:= DateToStr(GlbFechaTrnDiaria);
    dmUsuarios.qryEmpleados.Close;
    dmUsuarios.qryEmpleados.Open;
    dmUsuarios.qryEmpleados.Locate('CODIGO', VarUsuarioGlb,[]);
    Label12.Caption:= dmUsuarios.qryEmpleadosNOMBRE.Value;
    //if (GlbMonedaBase > 0) then
    //TotalesMoneda.Value   := IntToStr(GlbMonedaBase)
    //else
    //TotalesMoneda.Value   := '1';

    CheckBox4.Checked := False;
    lblProcDev.Visible := False;

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

procedure TfrmProcVentaRapidaPOS.AbrirUnidades;
begin
  dmInventario.qryTipoUnidad.Close;
  if GlbUsaPUnidadLevel = 1 then
  begin
    dmInventario.qryTipoUnidad.Params[0].Value:=2
  end else
  dmInventario.qryTipoUnidad.Params[0].Value:=1;
  dmInventario.qryTipoUnidad.Open;
end;

procedure TfrmProcVentaRapidaPOS.ActFastFoodTicket(numTicket: Integer);
begin

end;

procedure TfrmProcVentaRapidaPOS.NotificaErrorByEmail(sms: string);
begin

end;

procedure TfrmProcVentaRapidaPOS.ProcMostrarVersion;
begin

end;

function TfrmProcVentaRapidaPOS.VerificaLimiteCredito(codigocte: integer;
  MontoVenta: Real): Boolean;
begin

end;

procedure TfrmProcVentaRapidaPOS.ProcActualizaMsg;
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

procedure TfrmProcVentaRapidaPOS.InicializaOtrosDesc;
begin
  dmfactura.stpInsertPorcOtrosCargosFServ.Params[1].Value := 0;
  dmfactura.stpInsertPorcOtrosCargosFServ.Params[2].Value := 0;
  dmfactura.stpInsertPorcOtrosCargosFServ.Params[3].Value := 0;
  dmfactura.stpInsertPorcOtrosCargosFServ.Params[4].Value := 0;
  dmfactura.stpInsertPorcOtrosCargosFServ.Params[5].Value := 0;
  dmfactura.stpInsertPorcOtrosCargosFServ.Params[6].Value := 0;
end;

procedure TfrmProcVentaRapidaPOS.NoGenerarNCF1Click(Sender: TObject);
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

function TfrmProcVentaRapidaPOS.CheckPortComDisponible: boolean;
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

procedure TfrmProcVentaRapidaPOS.ProcesaEstadoImpresora;
begin
  if StatusImpFiscal then exit;
  if GlbPuerto = 4 then
  begin
    FiscalPrinter.CommPort:= $00000003;
  end;
  if GlbBaudRate = 9600 then
  FiscalPrinter.BaudRate:= $00000003;

  AbrirPuerto;
  StatusBar.Panels[0].Text:='Printer: ' + GetFiscalStatus;
  StatusBar.Panels[1].Text:='Status: ' + GetFiscalError;

  if (GlbIFiscalError <> 'Puerto en uso') And
     (GlbIFiscalError <> '') And
     (GlbIFiscalError <> 'Ready') And
     (GlbIFiscalError <> 'Listo') then
  MessageDlg('Impresora fiscal esta offline. '#13'Verifique que no esta apagada, desconectada o '#13'que no exista un documento abierto.',mtInformation,[mbOk],0);
  CerrarPuerto;
end;

procedure TfrmProcVentaRapidaPOS.ActivarBotonesEnModifica;
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
  Refresh;
end;

procedure TfrmProcVentaRapidaPOS.ProcActUltTrn;
begin
  stpProcBuscarUltNum.Params[2].Value := glbCia_Key;
  stpProcBuscarUltNum.ExecProc;
  RxLabel1.Caption:='Ult. #Fact:'+ stpProcBuscarUltNum.params[1].AsString;
  RxLabel2.Caption:='Ult. #Trans:'+ stpProcBuscarUltNum.params[0].AsString;
end;

procedure TfrmProcVentaRapidaPOS.LectorCodBarra1Click(Sender: TObject);
begin
  LectorCodBarra1.Checked:= Not LectorCodBarra1.Checked;
  if lectorcodbarra1.Checked then
  edtCodigo.Hint:='Enter - para buscar codigo barra. F10-on/off'
  else edtCodigo.Hint:= '';
  imbBarcode.Visible := LectorCodBarra1.Checked;
end;


procedure TfrmProcVentaRapidaPOS.AsignarSqlText(campo, valor,
  OrderBy: String);
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

procedure TfrmProcVentaRapidaPOS.ImprimeFiscalContado(xNumeroTrn: Integer);
begin

end;

procedure TfrmProcVentaRapidaPOS.FormShow(Sender: TObject);
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
  try
    dmCalculos.POSProcesaCalculos;
    //exito pos dmCalculos.PosSumatotal;
  except
  end;
end;

procedure TfrmProcVentaRapidaPOS.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
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
    if tblPOSVentadet.State = dsBrowse then
    begin
      item:=InputBox('Borrar un item','Entre número item a eliminar','');
      if tblPOSVentadet.Locate('Serie', strToInt(item),[]) then
      tblPOSVentadet.Delete;
      GlbSalvarQuery(tblPOSVentadet);
      if not tblPOSVentadetSerie.IsNull then
      GlbNumeroSerie := tblPOSVentadetSerie.Value
      else GlbNumeroSerie := -1;
    end;
  end else
  if (key = 119) then //F8
  btnPagoExactoClick(Self);
end;                     


procedure TfrmProcVentaRapidaPOS.BitBtn4Click(Sender: TObject);
var
  serie_asignadoncf : integer;
  valorNCF : String;
  showNcfwindows : Boolean;
  genNcf : Boolean;
  flag : Boolean;
  pulgadaInc : Real;
  nTrn : integer;
begin
  showNcfwindows:=false;
  esContado:=True;
  BitBtn4.Enabled:=False;
  if (tblPOSTotalesdevolucion.Value > 2000) then
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
      
  if (tblPOSTotalesSubTotal.Value <= 0) then
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

  if tblPOSVentasMast.State in [dsInsert, dsEdit] then
  GlbSalvarQuery(tblPOSVentasMast);

  //TEMPORAL PARA PROBAR PRECIO
  //GlbActivaIFiscal := 1;
  //TEMPORAL
  if (GlbActivaIFiscal <> 1 ) And (CheckBox1.Checked) then
  begin
    if tblPOSTotalesTipoNCF.IsNull then
    begin
      MessageDlg('Favor indicar tipo comprobante', mtWarning, [mbOk], 0);
      BitBtn4.Enabled:= True;
      Exit;
    end;
    if ((tblPOSVentasMast.RecordCount = 0) Or (tblPOSVentasMastCodigo_cte.Value = 0)
     Or (tblPOSVentasMastcodigo_cte.IsNull)) And
        (tblPOSTotalesTipoNCFIFiscal.Value In [1,4,5]) then
    begin
      MessageDlg('Favor asignar cliente', mtInformation, [mbOk], 0);
      BitBtn4.Enabled:= True;
      Exit;
    end;
  end;

  if (tblPOSTotalesTipoNCFIFiscal.Value < 0) then
  begin
    MessageDlg('Verifique tipo NCF', mtError, [mbOk], 0);
    BitBtn4.Enabled:= True;
    Exit;
  end;
  AbortarPostServTaller:=False;
  if (GlbActivaIFiscal = 1 ) then 
  begin
    if ((tblPOSVentasMast.RecordCount = 0) Or (tblPOSVentasMastCodigo_cte.Value = 0)) And
        (tblPOSTotalesTipoNCFIFiscal.Value In [1,4,5]) then
    begin
      if MessageDlg('Cliente no asignado, desea crearlo?', mtInformation, [mbYes,mbNo], 0)=mrYes then
      begin
        if (GlbActivaIFiscal = 1) And (tblPOSVentasMastCodigo_cte.IsNull) then
        begin
          ProcEntradaCliente;
          if tblPOSVentasMastCodigo_cte.IsNull then
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

  if (GlbActivaIFiscal = 1) And (tblPOSVentasMastCodigo_cte.IsNull) then
  begin
    ProcEntradaCliente;
    if tblPOSVentasMastCodigo_cte.IsNull then
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

  if not tblPOSVentasMastCodigo_cte.IsNull then
  if qryClienteCOD_VENDEDOR.Value > 0 then
    GlbCodVendedor :=qryClienteCOD_VENDEDOR.Value
  else
  GlbCodVendedor := -1;

  //Aplicar nota de credito abiertas
  //if CheckBox4.Checked then
  if tblPOSTotalesMontoNCRAplicado.Value > 0 then
  DescargaNotaCredito;

  //if CheckBox1.Checked then
  //begin
    frmSelNCF:=TfrmSelNCF.Create(Self);
    try
      if Not EsDevolucion then
      begin
        if RxDBLookupCombo3.Visible then
           dmFactura.ibQryViewNCF.Locate('TIPO_CF', tblPOSTotalesTipoNCF.Value,[])
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

           if tblPOSTotalesTipoNCF.IsNull then
           begin
             MessageDlg('Favor indicar tipo comprobante.', mtInformation, [mbok],0);
             if isShowing then
             RxDBLookupCombo3.SetFocus;
             BitBtn4.Enabled:= True;
             Exit;
           end else
           begin
             if tblPOSVentasMastCodigo_cte.IsNull then
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
          dmFactura.ibQryViewNCF.Locate('TIPO_CF',tblPOSTotalesTipoNCF.Value,[]);
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

     tblPOSTotalesTipoNCF.Value;
     tblPOSTotalesTipoNCFIFiscal.Value;
     dmFactura.ibQryViewNCFTIPO_NCF_IFISCAL.Value;
     if showNcfwindows then
     begin
       if dmFactura.ibQryViewNCF.Locate('TIPO_CF;tipo_ncf_ifiscal',
       VarArrayOf([tblPOSTotalesTipoNCF.Value,tblPOSTotalesTipoNCFIFiscal.Value]), []) then
       if (GlbNCFConfFinal = 0) And (tblPOSTotalesTipoNCF.IsNull) then
       begin
         if frmSelNCF.ShowModal = mrok then
         genNcf:= True
         else
         begin
           genNcf:= False;
           tblPOSTotales.Edit;
           tblPOSTotalesTipoNCF.AsVariant:= null;
           tblPOSTotalesTipoNCFIFiscal.AsVariant:= null;
           GlbSalvarQuery(tblPOSTotales);
         end;
       end else genNcf:= true;
     end else
     if Not showNcfwindows And (GlbActivaIFiscal = 0) then
     begin
       if RxDBLookupCombo3.Visible then
       dmFactura.ibQryViewNCF.Locate('TIPO_CF', tblPOSTotalesTipoNCF.Value,[]);

       if frmSelNCF.ShowModal = mrok then
       begin
         genNcf:= True;
         if tblPOSTotales.State = dsBrowse then
         begin
           tblPOSTotales.Edit;
           tblPOSTotalesTipoNCF.Value := dmFactura.ibQryViewNCFTIPO_CF.Value;
           tblPOSTotalesTipoNCFIFiscal.Value := dmFactura.ibQryViewNCFTIPO_NCF_IFISCAL.Value;
           GlbSalvarQuery(tblPOSTotales);
         end;
       end else
       begin
         genNcf:= False;
         tblPOSTotales.Edit;
         tblPOSTotalesTipoNCF.AsVariant:= null;
         tblPOSTotalesTipoNCFIFiscal.AsVariant:= null;
         GlbSalvarQuery(tblPOSTotales);
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

         frmAsignarNCFVenta.IBDataSet1NUMERO_NCF.Value := frmAsignarNCFVenta.ncfGenerado;//tblPOSVentadetNCF.Value;
         frmAsignarNCFVenta.IBDataSet1MONTO.Value      := tblPOSTotalestotalneto.Value; //StrToFloat(EditN1.Text);

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
         if tblPOSTotales.State = dsBrowse then
         tblPOSTotales.Edit;

         if tblPOSTotales.State In [dsInsert, dsEdit] then
         begin
           tblPOSTotales.Edit;
           tblPOSTotalesncf_numero.Value := valorNCF;
           tblPOSTotalesqrLabelNcfDesc.Value:=GlbDescNCF;
           //GlbDescNCF:='';
           GlbSalvarQuery(tblPOSTotales);
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
  if tblPOSVentasMastCodigo_cte.IsNull then
  ipStpInsertVentMast.Params[3].Value := 0//generico
  else ipStpInsertVentMast.Params[3].Value:= tblPOSVentasMastCodigo_cte.Value;
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

  if not tblPOSTotalesMoneda.isNull then
  ipStpInsertVentMast.Params[7].Value    := tblPOSTotalesMoneda.Value
  else
  ipStpInsertVentMast.Params[7].Value    := '1';
  ipStpInsertVentMast.Params[8].Value    := tblPOSTotalestotalneto.Value; //EditN1.Text;
  ipStpInsertVentMast.Params[9].Value    := 'A';
  ipStpInsertVentMast.Params[10].Value   := Now;
  ipStpInsertVentMast.Params[11].Value   := Null;
  ipStpInsertVentMast.Params[12].Value   := Null;
  ipStpInsertVentMast.Params[13].Value   := Null;
  ipStpInsertVentMast.Params[14].Value   := Null;
  ipStpInsertVentMast.Params[15].Value   := ibstpProcSecuencia.Params[0].Value;

  ipStpInsertVentMast.Params[17].Value   := tblPOSTotalesSubTotal.Value;
  ipStpInsertVentMast.Params[18].Value   := tblPOSTotalesPorcDesAdicional.Value;
  if Abs(tblPOSTotalesMontoDescAdicional.Value) > 0 then
  ipStpInsertVentMast.Params[19].Value   := tblPOSTotalesMontoDescAdicional.Value
  else
  ipStpInsertVentMast.Params[19].Value   := tblPOSTotalesMontoDescItems.Value;
  ipStpInsertVentMast.Params[20].Value   := tblPOSTotalesmontorecibido.Value;
  ipStpInsertVentMast.Params[21].Value   := tblPOSTotalesdevolucion.Value;
  ipStpInsertVentMast.Params[22].Value:= tblPOSTotalesitbis.Value;
  ipStpInsertVentMast.Params[23].Value:= 0;//chequear para financiamiento
  ipStpInsertVentMast.Params[24].Value:= edtObservacion.Text;
  ipStpInsertVentMast.Params[25].Value:= tblPOSTotalesMontoDescGastosAdmin.Value;
  ipStpInsertVentMast.Params[26].Value:= tblPOSTotalesMontoDescItbisGastosAdmin.Value;
  ipStpInsertVentMast.Params[27].Value:= tblPOSTotalesMontoDescTransp.Value;
  ipStpInsertVentMast.Params[28].Value:= tblPOSTotalesMontoDescDirtecnica.Value;
  ipStpInsertVentMast.Params[29].Value:= tblPOSTotalesMontoDescItbisDirTecnica.Value;
  ipStpInsertVentMast.Params[30].Value:= tblPOSTotalesMontoDescImprevisto.Value;
  ipStpInsertVentMast.Params[31].Value:= tblPOSTotalesMontoDescItbisImprevisto.Value;
  ipStpInsertVentMast.Params[32].Value:= tblPOSTotalesComentario.Value;
  ipStpInsertVentMast.Params[33].Value:= tblPOSVentadetNumeroCotiza.Value;
  ipStpInsertVentMast.Params[34].Value:= tblPOSTotalesReferenciaCte.Value;
  ipStpInsertVentMast.Params[35].Value:= tblPOSTotalesRecargo.Value;

  ipStpInsertVentMast.Params[37].Value:= tblPOSTotalesMontoExoneraITBIS.Value;
  ipStpInsertVentMast.Params[38].Value:= 0;

  if Serie_asignadoncf > 0 then
  begin
    ipStpInsertVentMast.Params[16].Value  := Serie_asignadoncf;
      ipStpInsertVentMast.Params[36].Value:= tblPOSTotalesTipoNCFIFiscal.Value;
  end else
  begin
    ipStpInsertVentMast.Params[16].Value:= Null;
    ipStpInsertVentMast.Params[36].Value:= Null;
  end;

  ipStpInsertVentMast.Params[39].Value:= tblPOSTotalesPropina.Value;
  ipStpInsertVentMast.Params[40].Value:= GlbPorcPropina;
  ipStpInsertVentMast.Params[41].Value:= tblPOSTotalesPropinaLegal.Value;

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
  if (tblPOSTotalesTipoNCF.Value = '15') OR (tblPOSTotalesTipoNCF.Value = '14') then
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

  tblPOSVentadet.DisableControls;
  tblPOSVentadet.First;
  RxDBGrid1.DisableScroll;
  While Not tblPOSVentadet.Eof do
  begin
    InsertarDet(ipStpInsertVentMast.Params[0].Value);
    ibStpActualizaInvProd.Params[0].Value:= tblPOSVentadetCodArticulo.Value;
    if (GlbUsaPUnidadLevel = 0) then
    begin
      if (tblPOSVentadetTipoUnidad.Value = 3) Or (tblPOSVentadetTipoUnidad.Value = 0) then
      ibStpActualizaInvProd.Params[1].Value:= tblPOSVentadetCant.Value
      else
      begin
        ibStpActualizaInvProd.Params[1].Value:= tblPOSVentadetCant.Value * CantUnidad;
      end;
    end else
    ibStpActualizaInvProd.Params[1].Value:= tblPOSVentadetCant.Value * CantUnidad;
    
    if Not EsDevolucion then
    ibStpActualizaInvProd.Params[2].Value     := 0  //tipoTrn
    else ibStpActualizaInvProd.Params[2].Value:= 1; //ingresar al inventario
    ibStpActualizaInvProd.Params[3].Value     := 1; //porCodigo
    if (tblPOSVentadetInvetariar.Value <> 0) And (GlbCodDivInventario = 1 ) then
    ibStpActualizaInvProd.ExecProc;   //ctualiza inventario

    if (tblPOSVentadetTipoVenta.Value = 0) Or (tblPOSVentadetTipoVenta.IsNull ) then //Item de Venta
    begin
      try
        ActualizaInvAlmacen;//Actualiza Division Inventario
      except
      end;
    end;
    tblPOSVentadet.Next;
  end;
  //tblPOSVentadet.First;

  //RxDBGrid2.DisableScroll;
  sumarDatos:=False;
  //RxDBGrid2.Visible:= False;
  tblPOSVentadet.AutoCalcFields:=False;
{pos exito  While not tblPOSVentadet.Eof do
  begin
    tblPOSVentadet.Edit;
    tblPOSVentadetNumeroRecibo.Value := ipStpInsertVentMast.Params[0].Value;
    tblPOSVentadetNumeroDoc.Value := ipStpInsertVentMast.Params[15].Value;
    tblPOSVentadet.Post;
    //WriteToLog('Post tblPOSVentadet - Line 1051');
    tblPOSVentadet.Next;
  end;}

  sqlIBSQEjecutar('update POS_VENTA_DET set NumeroDoc ='+
  ipStpInsertVentMast.Params[15].AsString+
  ', NumeroRecibo ='+ ipStpInsertVentMast.Params[0].AsString+
  ' Where numero ='+tblPOSVentaDetNumero.AsString);

  RxDBGrid1.EnableScroll;
  //RxDBGrid2.EnableScroll;
  tblPOSVentadet.EnableControls;
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
    RxDBGrid1.DataSource:= datasource3;
    dbtext1.DataField:='';
    dbtext1.DataSource:= datasource3;
    dbedit1.DataField:='';
    dbedit1.DataSource:= datasource3;
    dbedit2.DataField:='';
    dbedit2.DataSource:= datasource3;
    dbedit3.DataField:='';
    dbedit3.DataSource:= datasource3;
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
        if (tblPOSVentasMastCODIGO_CTE.value > 0) then
        begin
          qckRepReciboReimpTicketSurtidora.qrLabelRNC.Caption:='RNC-' + qryClienteRNC_NUMERO.Value;
          qckRepReciboReimpTicketSurtidora.nombreCteGenerico:= qryClienteNOMBRE_CTE.Value;
        end
        else qckRepReciboReimpTicketSurtidora.qrLabelRNC.Caption:='';
        qckRepReciboReimpTicketSurtidora.xtipoVenta := TipoVenta;
        qckRepReciboReimpTicketSurtidora.valorNCF   := valorNCF;
        pulgadaInc:=0.86;

        if tblPOSVentadet.RecordCount = 1 then
        qckRepReciboReimpTicketSurtidora.Page.Length:= 5
        else
        if tblPOSVentadet.RecordCount >= 2 then
        qckRepReciboReimpTicketSurtidora.Page.Length:= qckRepReciboReimpTicketSurtidora.Page.Length +
        (tblPOSVentadet.RecordCount - 1 ) * 0.25;

        flag:=true;
        qckRepReciboReimpTicketSurtidora.Prepare;
        tblPOSVentadet.DisableControls;
        rxdbgrid1.Enabled:=False;
        if (tblPOSVentadet.RecordCount > 1) or (qckRepReciboReimpTicketSurtidora.PageNumber > 1) then
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
        tblPOSVentadet.EnableControls;
        rxdbgrid1.Enabled:=True;

        dmreportes.qryViewVentasMast.Close;
        dmreportes.qryViewVentasMast.Params[0].Value:= ipStpInsertVentMast.Params[0].Value;
        dmreportes.qryViewVentasMast.Open;

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
        if (tblPOSVentasMastCODIGO_CTE.value > 0) then
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
        if tblPOSVentadet.RecordCount >= 2 then
        qckRepReciboReimpFFoodPOS.Page.Length:= qckRepReciboReimpFFoodPOS.Page.Length +
        (tblPOSVentadet.RecordCount - 1 ) * 0.25;

        flag:=true;
        qckRepReciboReimpFFoodPOS.Prepare;
        tblPOSVentadet.DisableControls;
        rxdbgrid1.Enabled:=False;
        if (tblPOSVentadet.RecordCount > 1) or (qckRepReciboReimpFFoodPOS.PageNumber > 1) then
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
        tblPOSVentadet.EnableControls;
        rxdbgrid1.Enabled:=True;

        dmreportes.qryViewVentasMast.Close;
        dmreportes.qryViewVentasMast.Params[0].Value:= ipStpInsertVentMast.Params[0].Value;
        dmreportes.qryViewVentasMast.Open;

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
      dmVentas.qryPOSTotales.Close;
      dmVentas.qryPOSTotales.Params[0].Value:= tblPOSVentadetNumero.Value;
      dmVentas.qryPOSTotales.Open;
      qckRepRecibo:=TqckRepRecibo.Create(Nil);
      try
        if GlbImpCodProducto = 0 then
        begin
          qckRepRecibo.qckRepComprobante.Height := 20;
          qckRepRecibo.QRLabel26.Enabled  := False;
          qckRepRecibo.QRDBText20.Enabled := False;
        end;

        qckRepRecibo.ncfDesc := GlbDescNCF;
        if Length(edtObservacion.Text) > 0 then
        qckRepRecibo.nombreCteGenerico:=edtObservacion.Text;
        if (tblPOSVentasMastCODIGO_CTE.value > 0) then
        begin
          qckRepRecibo.qrLabelRNC.Caption:='RNC-' + qryClienteRNC_NUMERO.Value;
          qckRepRecibo.nombreCteGenerico:= qryClienteNOMBRE_CTE.Value;
        end
        else qckRepRecibo.qrLabelRNC.Caption:='';
        qckRepRecibo.xtipoVenta := TipoVenta;
        qckRepRecibo.valorNCF:= valorNCF;
        pulgadaInc:=0.86;

        if tblPOSVentadet.RecordCount = 1 then
        qckRepRecibo.Page.Length:= 5
        else
        if tblPOSVentadet.RecordCount >= 2 then
        qckRepRecibo.Page.Length:= qckRepRecibo.Page.Length +
        (tblPOSVentadet.RecordCount - 1 ) * 0.25;

        flag:=true;
        qckRepRecibo.Prepare;
        tblPOSVentadet.DisableControls;
        rxdbgrid1.Enabled:=False;
        if (tblPOSVentadet.RecordCount > 1) or (qckRepRecibo.PageNumber > 1) then
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
      tblPOSVentadet.EnableControls;
      rxdbgrid1.Enabled:=True;

      dmreportes.qryViewVentasMast.Close;
      dmreportes.qryViewVentasMast.Params[0].Value:= ipStpInsertVentMast.Params[0].Value;
      dmreportes.qryViewVentasMast.Open;

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
  //tblPOSVentadet.EmptyTable;
  nTrn:=tblPOSVentadetNUMERO.Value;
  dmCalculos.ProcDeleteDetVta(nTrn);
  dmCalculos.ProcDeleteVtaMaster(nTrn);
  tblPOSVentadet.Close;
  tblPOSVentadet.Open;
  if chkDisplay.Checked then
  Finalizardisplay;
  BitBtn1.Enabled:=True;
  BitBtn4.Enabled:=True;
  //tablaPropietario.EmptyTable;
  //tablaPropietario.Edit;
  //tablaPropietarioCodigoPropietario.AsVariant := null;
  //tablaPropietario.Post;

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

procedure TfrmProcVentaRapidaPOS.btnPagoExactoClick(Sender: TObject);
begin
  //
end;

procedure TfrmProcVentaRapidaPOS.Edit1Exit(Sender: TObject);
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
  svalue := Format('%8.2f', [tblPOSTotalestotalneto.Value]);
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
  tblPOSTotales.Edit;
  tblPOSTotalesDevolucion.Value := 0;
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
  tblPOSTotalesmontorecibido.AsString := Edit1.Text;
  if (x > 0) then
  tblPOSTotalesdevolucion.Value := x;
  GlbSalvarQuery(tblPOSTotales);

  BitBtn4.Enabled := True;
 if isShowing then
  BitBtn4.SetFocus;
end;

procedure TfrmProcVentaRapidaPOS.BitBtn2Click(Sender: TObject);
begin
  if GlbModoHistorico then
  begin
    MessageDlg('Operacion no permitida en MODO HISTORICO.',mtError,[mbok],0);
  end;
  BitBtn10Click(Self);

  TipoVenta:='CONTADO';
  if tblPosVentaDet.State In [dsInsert, dsEdit] Then
  begin
    if Not tblPOSTotalesMoneda.IsNull then
    tblPosVentaDetMoneda.Value:= tblPOSTotalesMoneda.Value;

    if tblPosVentaDetCodArticulo.IsNull Or tblPosVentaDetCant.IsNull Or tblPosVentaDetPrecio.IsNull then
    tblPosVentaDet.Cancel else
    GlbSalvarQuery(tblPosVentaDet);
    //WriteToLog('Post rxVenta - Line 2102');
  end;
  if (tblPosVentaDetMoneda.IsNull) then
  begin
    MessageDlg('Favor indicar tipo moneda.',mtError,[mbok],0);
    RxDBLookupCombo2.SetFocus;
  end;
  
  //exito pos dmCalculos.PosSumatotal;

  if tblPosVentaDet.RecordCount > 0 then
  //  if frmProcVentaRapida.Showing then
  if frmProcVentaRapidaPOS.Showing then
  Edit1.SetFocus;

  //ActualizarRecoverData;
end;

procedure TfrmProcVentaRapidaPOS.BitBtn7Click(Sender: TObject);
begin
  //
end;

procedure TfrmProcVentaRapidaPOS.BitBtn16Click(Sender: TObject);
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

procedure TfrmProcVentaRapidaPOS.BitBtn25Click(Sender: TObject);
begin
  if tblPoSVentaDEt.RecordCount = 0 then Exit;
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
    if tblPosTotales.State = dsBrowse then
    tblPosTotales.Edit;
    if tblPosTotalesMoneda.IsNull then
    tblPosTotalesMoneda.Value := IntToStr(GlbMonedaBase);
    tblPosTotalesMontoNotaCredito.Value:=
    frmDistribuirPgoVenta.GetMontoNotaCreditoPendiente(tblPosTotalesMoneda.Value, tblPOSVentasMastCODIGO_CTE.Value);
    frmDistribuirPgoVenta.Label11.Caption:=tblPosTotalesMontoNotaCredito.AsString;
    tblPOSTotales.Post;
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
  tblPosTotalesMontoEnEfectivo.Value +
  tblPosTotalesMontoEnTarjeta.Value +
  tblPosTotalesMontoEnCheque.Value +
  tblPosTotalesMontoEnBonos.Value+
  tblPosTotalesMontoNCRAplicado.Value]);
  Edit1Exit(Self);
end;

procedure TfrmProcVentaRapidaPOS.BitBtn3Click(Sender: TObject);
begin
  if tblPOSVentadet.State in [dsEdit, dsInsert] then
  begin
    tblPOSVentadet.Cancel;
  end;
  if tblPOSVentadet.RecordCount > 0 then
  begin
    if VerificaClave then
    begin
      if MessageDlg('Cancelar transacción?', mtInformation, [mbYes, mbNo], 0)= mrYes then
      begin
        lblProcDev.Visible := False;
        dmCalculos.ProcDeleteVtaMaster(tblPOSVentadetNUMERO.Value);

        dmCalculos.ProcDeleteDetVta(tblPOSVentadetNUMERO.Value);
        tblPOSVentadet.Close;
        tblPOSVentadet.Open;

        EsModificandoFactura:= False;
        lblProcDev.Visible  := EsDevolucion;

        GlbUsandoCotiza := False;
        GlbUsandoCotiza := False;
        tblPOSVentadet.Close;
        //tblPOSVentadet.EmptyTable;
        tblPOSVentadet.Open;

        if tblPOSVentadetNUMERO.IsNull then
        begin
          tblPosTotales.Delete;
          GlbSalvarQuery(tblPosTotales);
          tblPosTotales.params[0].Value:=0;
        end;
        
        //dmCalculos.POSTotalesIni(tblPOSVentadetNUMERO.Value(;
        //ActualizarRecoverData;

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

        lblFechaCotizacion.Visible:=False;
        dbFechaCotizacion.Visible:=False;
        EsModificandoCotiza:=False;
        _NumeroCotiza:=-1;
        glbcodVendedor := -1;
        AbortarPostServTaller := True;

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

procedure TfrmProcVentaRapidaPOS.BitBtn5Click(Sender: TObject);
begin
  EsModificandoFactura:= Label36.Visible;
  if tblPOSVentadet.State = dsbrowse then
  begin
    if (EsModificandoCotiza) then
    begin
      if (tblPOSVentadetStatus.Value = 'I') then
      begin
        tblPOSVentadet.Delete;
        GlbSalvarQuery(tblPOSVentadet);
        GlbNumeroSerie := tblPOSVentadetSerie.Value;
        BitBtn27Click(Self);
      end else
      begin
        tblPOSVentadet.Edit;
        tblPOSVentadetStatus.Value:='C';
        GlbSalvarQuery(tblPOSVentadet);
        GlbNumeroSerie := tblPOSVentadetSerie.Value;
        //WriteToLog('Post rxVenta - Line 2357');
        //marzo 17 2015 ProcesarSumaTotal;
        BitBtn27Click(Self);
      end;
    end else
    if EsModificandoFactura then
    begin
      if (tblPOSVentadetStatus.Value = 'I') then
      begin
        tblPOSVentadet.Delete;
        GlbSalvarQuery(tblPOSVentadet);
        GlbNumeroSerie := tblPOSVentadetSerie.Value;
        BitBtn27Click(Self);
      end else
      begin
        tblPOSVentadet.Edit;
        tblPOSVentadetStatus.Value:='C';
        GlbSalvarQuery(tblPOSVentadet);
        GlbNumeroSerie := tblPOSVentadetSerie.Value;
        //WriteToLog('Post rxVenta - Line 2372');
        //marzo 17 2015 ProcesarSumaTotal;
        BitBtn27Click(Self);
      end;
    end else
    if EsModificandoFactura then
    begin
      if VerificaClave then
      begin
        if MessageDlg('Borrar item No.' + tblPOSVentadetSerie.AsString + '?', mtWarning, [mbYes, mbNO], 0)= mrYes then
        begin
          //EliminarRecoverData;
          tblPOSVentadet.Delete;
          GlbSalvarQuery(tblPOSVentaDet);
        //marzo 17 2015 ProcesarSumaTotal;
        BitBtn27Click(Self);
        end;
      end;
    end else
    begin
      if MessageDlg('Borrar item No.' + tblPOSVentadetSerie.AsString + '?', mtWarning, [mbYes, mbNO], 0)= mrYes then
      begin
        //EliminarRecoverData;
        tblPOSVentadet.Delete;
        GlbSalvarQuery(tblPOSVentaDet);
        BitBtn27Click(Self);
      end;
    end;
  end;
end;

procedure TfrmProcVentaRapidaPOS.BitBtn1Click(Sender: TObject);
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
  edtCodigo.SetFocus;
end;

procedure TfrmProcVentaRapidaPOS.edtCodigoExit(Sender: TObject);
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
    if Not Assigned(frmProcVentaRapidaPOS) Then
      if isShowing then
    edtCodigo.SetFocus;
    Exit;
  end;
  MontoItbisEnPrecio:=0;
  if (edtCodigo.Text = '') then Exit;
  Edit1.Text  := '';
  PrecioCambio:= False;

  reciboImpreso := False;
  //tttt if panel2.Visible  then
  //tttt edtCodigo.Text := qryProductosCodigo_Texto.Value;
  if BuscandoPorDesc then
  begin
    Panel2.BringToFront;
    Panel2.Visible := True;
    Panel2.Height  := 152;
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
      Panel2.Height  := 152;
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
      Panel2.Height  := 152;
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
      if MessageDlg('Producto vencido, cancelar?', mtWarning,[mbyes, mbno],0)=mryes then
      begin
        edtCodigo.Text := '';
        edtCodigo.SetFocus;
        rxLabelVence.Visible:= False;
        Panel2.Visible      := False;
        Exit;
      end;
    end;
    qryInventario.Locate('CODIGO_TEXTO', edtCodigo.Text,[loCaseInsensitive]);

    if tblPOSVentaDet.State = dsBrowse then
    begin
      tblPOSVentaDet.EnableControls;
      recuperando := False;

      tblPOSVentaDet.Insert;
      tblPOSVentaDetFecha.Value := ExtraerFecha(GlbFechaTrnDiaria);
      tblPOSVentadetTIPOVENTA.Value:=0;
      if not tblPOSVentasMastNumero.IsNull then
      tblPOSVentadetNUMERO.Value:= tblPOSVentasMastNumero.Value
      else
      tblPOSVentadetNUMERO.Value:= GetNumSecuenciaVta(VarUsuarioGlb,ExtraerFecha(GlbFechaTrnDiaria));
      tblPOSVentaDet.params[0].value:=tblPOSVentadetNUMERO.Value;
      tblPOSVentadetSTATUS.Value:= 'A';
      tblPOSVentaDetMoneda.Value:= tblPOSVentasMastmoneda.Value;

      tblPOSVentaDetglbcodVendedor.Value := qryClienteCOD_VENDEDOR.Value;
      tblPOSVentaDetItbi.Value := 0;

     //_NumeroCotiza := -1;
      if (tblPOSVentaDet.State In [dsInsert]) and (not EsModificandoCotiza)
      and (not EsModificandoFactura) then
      begin
        if ((UpperCase(edtcodigo.Text) = 'RECARGO') Or (UPPERCASE(qryProductosDESCRIPCION.Value) = 'RECARGO')) then
        tblPOSVentaDetTipoVenta.Value := 3
        else
        if ((UpperCase(edtcodigo.Text) = 'DESCUENTO') Or (UPPERCASE(qryProductosDESCRIPCION.Value) = 'DESCUENTO')) then
        tblPOSVentaDetTipoVenta.Value := 2
        else
        tblPOSVentaDetTipoVenta.Value := 0;//Item venta;
      end;
      if EsModificandoCotiza then
      begin
        tblPOSVentaDetNumeroCotiza.Value:=_NumeroCotiza;
        tblPOSVentaDetStatus.Value:= 'I';
      end;

      if EsModificandoFactura then
      tblPOSVentaDetStatus.Value:= 'I';
      if (GlbActivaIFiscal = 0) then
      RxSpeedButton1.Visible    := True;
      tblPOSVentaDetCant.Value  := 1;
      tblPOSVentaDetInvetariar.Value:= qryProductosINVENTARIAR.Value;
      //tblPOSVentaDetSerie.Value := Numero;

      if (GlbcodVendedor > 0) then
      tblPOSVentaDetCodUsuario.Value := GlbcodVendedor
      else
      tblPOSVentaDetCodUsuario.Value := VarUsuarioGlb;
    end;
    if tblPOSVentaDet.State In [dsInsert, dsEdit] then
    begin
      tblPOSVentaDetDescripcion.Value         := qryProductosDESCRIPCION.Value;
      tblPOSVentaDetDescripcionEspecial.Value := qryProductosDESCRIPCIONADICIONAL.Value;
      tblPOSVentaDetItbisExento.Value:= qryProductosPAGA_ITBI.Value;

      tblPOSVentaDetReferencia.Value := qryProductosREFERENCIA.Value;
      if (qryClienteUSARLEVELPRECIO.IsNull) or (qryClienteUSARLEVELPRECIO.Value <= 0) then
      RxSpinEdit1.Value:=qryProductosUSARLEVELPRECIO.AsInteger
      else
      RxSpinEdit1.Value:=qryClienteUSARLEVELPRECIO.Value;

      tblPOSVentaDetCodArticulo.Value:= qryProductoscodigo.Value;
      tblPOSVentaDetRutaImagen.Value := BuscarRutaImagen(qryProductosCodigo.Value);
      tblPOSVentaDetMonedaBase.Value := GetMonedaProducto(qryProductosCODIGO.Value);
      tblPOSVentaDetmonto_tasa.Value := GlbMontoTasa(tblPOSVentaDetMonedaBase.Value);

      tblPOSVentaDetCodTexto.Value   := qryProductosCODIGO_TEXTO.Value; //edtCodigo.Text;
      tblPOSVentaDetCostoProducto.Value := qryProductosPRECIO_COMPRA.Value;

        if FAplicaPrecioMayorista and not GlbUsandoCotiza then
        tblPOSVentaDetPrecio.Value  := qryClasifPrecioPRECIO_VENTA.Value
        else
        if (GlbUsaescalaPrecio =1) and (not GlbUsandoCotiza or ( tblPOSVentaDetStatus.Value = 'I') ) then
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

          if (GlbTipoUnidad = 1) and (not GlbUsandoCotiza or (tblPOSVentaDetStatus.Value = 'I')) then
          tblPOSVentaDetPrecio.Value  := qryProductosPRECIO.Value //hoy es el dia de la salvacion
          else
          if  (precioXUnidad(GlbTipoUnidad,qryProductoscodigo.Value) > 0) and Not GlbUsandoCotiza then  // qryProductosPRECIO_TIPO_UNIDAD.Value > 0 then
          tblPOSVentaDetPrecio.Value  := precioXUnidad(GlbTipoUnidad,qryProductoscodigo.Value)
          else
          begin
           if not GlbUsandoCotiza Or ( tblPOSVentaDetStatus.Value = 'I')  then
            tblPOSVentaDetPrecio.Value := qryProductosPRECIO.Value;
            cboxTipoUnidad.ItemIndex:=0;
            //MessageDlg('Precio no configurado para tipo unidad, verifique', mtError, [mbok],0);
          end;
        end;
        if (Length(pesoProd) > 0) then
        tblPOSVentaDetCant.Value := StrTofloat(pesoProd);
        tblPOSVentaDetMontoItbisenPrecio.Value:=0;
        MontoItbisEnPrecio:=0;
       //tj end;

      tblPOSVentadetInvetariar.Value:= qryProductosINVENTARIAR.Value;
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
          tblPOSVentadetSerieProd.Value:= qryProdSerieSERIE.Value
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
            tblPOSVentaDetloteNum.Value:= dmInventario.qryLoteLOTE_NUM.Value;
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
  if LectorCodBarra1.Checked And (tblPOSVentaDetPrecio.Value > 0) then
  begin
    DBEdit1Enter(Self);
    DBEdit1Exit(Self);
      if isShowing then
    edtCodigo.SetFocus;
  end;
end;

procedure TfrmProcVentaRapidaPOS.DBEdit1Enter(Sender: TObject);
begin
  Refresh;
  yNumSerie:= tblPOSVentaDetSerie.Value;
  if not tblPOSVentaDetCant.IsNull then
  auxiCant:= tblPOSVentaDetCant.Value
  else
  auxiCant:= -1;
  if Not Prod_existe and ((tblPOSVentaDet.State in [dsEdit, dsInsert]) or (tblPOSVentaDet.RecordCount > 0)) then
  begin
    if qryProductos.Locate('codigo_Texto', tblPOSVentaDetCodTexto.Value,[]) then
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

procedure TfrmProcVentaRapidaPOS.edtCodigoChange(Sender: TObject);
begin
  if tblPOSVentadet.State = dsBrowse then
  if Not tblPOSVentadetNumero.IsNull then
  tblPOSVentadet.Last;

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
            rxLabelVence.Font.Color:=clGreen;
          end else rxLabelVence.Visible:=False;
        end;
      end else rxLabelVence.Visible:=False;
      //panel2.Top := edtcodigo.Top + 30;
      panel2.Left:= edtcodigo.Left;
      panel2.Visible := True;
      Panel2.Height  := 152;
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
      Panel2.Height  := 152;
      panel2.BringToFront;
      noExiste:= False;
    end else noExiste:= True;
  end;
  if qryProdPorProveedor.RecordCount > 0 then
  pnlPrecioProv.Visible:=True else
  pnlPrecioProv.Visible:=False;
end;

procedure TfrmProcVentaRapidaPOS.FormClick(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmProcVentaRapidaPOS.RxDBLookupCombo3Exit(Sender: TObject);
var
  xpos : integer;
begin
  //chkExentoExit(Self);   1,4,5,
  if tblPOSVentaDetSerie.IsNull then Exit;
  //if NCFCambio then
  //GlbSalvarQuery(tblPOSVentaDet);
  NCFCambio:=False;
  if tblPOSTotales.State = dsBrowse Then tblPOSTotales.Edit;
  if tblPOSTotales.State In [dsEdit, dsInsert] Then
  begin
    if (tblPOSTotalesTipoNCF.IsNull) And (Not tblPOSTotalesTipoNCFIFiscal.IsNull) then
    tblPOSTotalesTipoNCF.Value := dmFactura.ibQryViewNCFTIPO_CF.Value
    else
    if (tblPOSTotalesTipoNCF.Value <> dmFactura.ibQryViewNCFTIPO_CF.Value) then
    tblPOSTotalesTipoNCF.Value := dmFactura.ibQryViewNCFTIPO_CF.Value;

     tblPOSTotalesMontoExoneraITBIS.Value:= 0;
     if Not dmFactura.ibQryViewNCF.Locate('TIPO_CF;tipo_ncf_ifiscal',
     VarArrayOf([tblPOSTotalesTipoNCF.Value,tblPOSTotalesTipoNCFIFiscal.Value]), []) then
     begin
       tblPOSTotalesTipoNCF.AsVariant := null;
       tblPOSTotalesTipoNCFIFiscal.AsVariant := null;;
     end;

     label29.Caption := 'Sub-Total Indirecto';
    //TotalesTipoNCFIFiscal.Value := dmFactura.ibQryViewNCFTIPO_NCF_IFISCAL.AsInteger;
    ProcNCFExoNCFVisible;
  end;
  if tblPOSTotales.State In [dsEdit, dsInsert] then
  GlbSalvarQuery(tblPOSTotales);
  BitBtn27Click(Self);
  if (tblPOSTotalesTipoNCFIFiscal.Value In [1,4,5]) And
  (tblPOSVentasMastCODIGO_CTE.IsNull or (tblPOSVentasMastCODIGO_CTE.Value = 0)) then
  begin
    ProcEntradaCliente;
  end;
  RxDBLookupCombo3Change(Self);
  Refresh;
end;

procedure TfrmProcVentaRapidaPOS.ProcNCFExoNCFVisible;
var
  xpos :integer;
begin
  if (not tblPOSTotalesTipoNCF.IsNull) Or (tblPOSTotalesTipoNCF.Value <> '') then
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
      tblPOSTotalesMontoExoneraITBIS.Value  := tblPOSTotalesitbis.Value;
    end else
    begin
      tblPOSTotalesMontoExoneraITBIS.Value:= 0;
      label29.Caption := 'Sub-Total Indirecto';
    end;
   end;
end;

procedure TfrmProcVentaRapidaPOS.ProcEntradaCliente;
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
    tblPOSVentasMast.Edit;
    tblPOSVentasMastCODIGO_CTE.AsVariant := dmClientes.tblClientesCODIGO_CTE.Value;

    GlbSalvarQuery(tblPOSVentasMast);

    qryCliente.Close;
    qryCliente.Open;
    if tblPOSVentasMast.State = dsInactive then
    tblPOSVentasMast.Open;
    
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
    if (xCodigoCte =0) And (tblPOSVentasMastCODIGO_CTE.Value > 0) then
        xCodigoCte := tblPOSVentasMastCODIGO_CTE.Value;

  finally
  frmClientes.Free;
  frmClientes:=Nil;
  end;
end;
procedure TfrmProcVentaRapidaPOS.RxSpeedButton1Click(Sender: TObject);
begin
  //
end;

procedure TfrmProcVentaRapidaPOS.BuscarCliente1Click(Sender: TObject);
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

procedure TfrmProcVentaRapidaPOS.BuscarRNCDGII1Click(Sender: TObject);
begin
 //
end;

procedure TfrmProcVentaRapidaPOS.Alquiler1Click(Sender: TObject);
begin
 //
end;

procedure TfrmProcVentaRapidaPOS.Lavanderia1Click(Sender: TObject);
begin
  //
end;

procedure TfrmProcVentaRapidaPOS.Costura1Click(Sender: TObject);
begin
  //
end;

procedure TfrmProcVentaRapidaPOS.RegistroServicioTaller1Click(
  Sender: TObject);
begin
  //
end;

procedure TfrmProcVentaRapidaPOS.RecuperarTransacciones1Click(
  Sender: TObject);
begin
  //
end;

procedure TfrmProcVentaRapidaPOS.MaestroCliente1Click(Sender: TObject);
begin
  //
end;

procedure TfrmProcVentaRapidaPOS.Cotizar1Click(Sender: TObject);
begin
  //
end;

procedure TfrmProcVentaRapidaPOS.ConsultaGeneral1Click(Sender: TObject);
begin
  //
end;

procedure TfrmProcVentaRapidaPOS.Inventario1Click(Sender: TObject);
begin
  //
end;

procedure TfrmProcVentaRapidaPOS.MaestroInventario1Click(Sender: TObject);
begin
 //
end;

procedure TfrmProcVentaRapidaPOS.CuadreCaja1Click(Sender: TObject);
begin
  //
end;

procedure TfrmProcVentaRapidaPOS.ImprimirRecibo1Click(Sender: TObject);
begin
  //
end;

procedure TfrmProcVentaRapidaPOS.NotaDebito1Click(Sender: TObject);
begin
  //
end;

procedure TfrmProcVentaRapidaPOS.NotaCrdito1Click(Sender: TObject);
begin
  //
end;

procedure TfrmProcVentaRapidaPOS.Devolucin1Click(Sender: TObject);
begin
  //
end;

procedure TfrmProcVentaRapidaPOS.ListarPuertosCom1Click(Sender: TObject);
begin
  frmPuertosLibres:=TfrmPuertosLibres.Create(nil);
  try
    frmPuertosLibres.Showmodal;
  finally
  frmPuertosLibres.free;
  frmPuertosLibres:=nil;
  end;
end;

procedure TfrmProcVentaRapidaPOS.Ayuda1Click(Sender: TObject);
begin
  ShellExecute(frmProcVentaRapidaPOS.Handle,nil,PChar('C:\Proyectos\PointSaleSoftGold\PuntoVenta\ManualOnline.html'),'','',SW_SHOWNORMAL);
end;

procedure TfrmProcVentaRapidaPOS.NoMostrarProdVencidos1Click(
  Sender: TObject);
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

procedure TfrmProcVentaRapidaPOS.ImprimirLabel1Click(Sender: TObject);
begin
  //
end;

procedure TfrmProcVentaRapidaPOS.Seguros1Click(Sender: TObject);
begin
  //
end;

procedure TfrmProcVentaRapidaPOS.ConciliarNIF1Click(Sender: TObject);
begin
  frmConciliarNIFvsVenta:=TfrmConciliarNIFvsVenta.Create(Nil);
  try
    frmConciliarNIFvsVenta.Showmodal;
  finally
  frmConciliarNIFvsVenta.Free;
  frmConciliarNIFvsVenta:=Nil;
  end;
end;

procedure TfrmProcVentaRapidaPOS.FormClose(Sender: TObject;
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

procedure TfrmProcVentaRapidaPOS.FormCloseQuery(Sender: TObject;
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
  if (tblPOSVentadet.RecordCount > 0) then
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
       if tblPOSVentadetNUMERO.IsNull then
       begin
         tblPosTotales.Delete;
         GlbSalvarQuery(tblPOsTotales);
         tblPosTotales.params[0].Value:=0;
       end;
    end;// else CanClose:= False;
  end;
end;

function TfrmProcVentaRapidaPOS.VerificaClave: Boolean;
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

procedure TfrmProcVentaRapidaPOS.SpeedButton1Click(Sender: TObject);
begin
  if (GlbColegio = 0) then
  begin
  FrmBuscarClientesPersonas:=TFrmBuscarClientesPersonas.Create(nil);
  try
    FrmBuscarClientesPersonas.CodigoCliente := -1;
    if FrmBuscarClientesPersonas.Showmodal = mrOk then
    begin
      if dmventas.tblPOSTotales.State In [dsBrowse] then
      dmventas.tblPOSTotales.Edit;
      dmventas.tblPOSTotalesCODCLIENTE.Value:=FrmBuscarClientesPersonas.CodigoCliente;
      tblPOSVentasMast.Edit;
      tblPOSVentasMastCODIGO_CTE.Value:= dmventas.tblPOSTotalesCODCLIENTE.Value;
      GlbSalvarQuery(tblPOSVentasMast);
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
      if dmventas.tblPOSTotales.State In [dsBrowse] then
      dmventas.tblPOSTotales.Edit;
      dmventas.tblPOSTotalesCODCLIENTE.Value:=frmBuscarEstudiantes.CodigoCliente;
      tblPOSVentasMast.Edit;
      tblPOSVentasMastCODIGO_CTE.Value:= dmventas.tblPOSTotalesCODCLIENTE.Value;
      GlbSalvarQuery(tblPOSVentasMast);      
    end;
  finally
  frmBuscarEstudiantes.Free;
  frmBuscarEstudiantes:=Nil;
  end;
  end;
end;

procedure TfrmProcVentaRapidaPOS.RxDBLookupCombo1Change(Sender: TObject);
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
  if (tblPOSVentasMastCODIGO_CTE.IsNull) or
  (tblPOSVentasMastCODIGO_CTE.Value = 0) then
  lblRNC.Caption:=''
  else
  lblRNC.Caption:= sDesc +qryclienternc_numero.Value; 
end;

procedure TfrmProcVentaRapidaPOS.AbrirClasifPrecio;
begin
  if tblPOSVentadet.state = dsInactive then Exit;
  if tblPOSVentadet.RecordCount = 0 then Exit;
  qryClasifPrecio.Close;
  qryClasifPrecio.Params[0].Value := tblPOSVentasMastCODIGO_CTE.Value;// qryClientePRECIO_ID.Value;
  qryClasifPrecio.Open;
  if qryClasifPrecio.RecordCount > 0 then
  DBEdit6.Color:=clGreen
  else
  DBEdit6.Color:=clWindow;
end;

procedure TfrmProcVentaRapidaPOS.AplicaPrecioMayorista;
begin
  if tblPOSVentadet.state = dsInactive then Exit;
  if tblPOSVentadet.RecordCount = 0 then Exit;
  sumarDatos:=False;
  qryClasifPrecio.Close;
  qryClasifPrecio.Params[0].Value := tblPOSVentasMastCODIGO_CTE.Value;//qryClientePRECIO_ID.Value;
  qryClasifPrecio.Open;
 // tblPOSVentadet.AutoCalcFields := False;
  //tblPOSVentadet.First;
  //While Not tblPOSVentadet.Eof Do
  //begin
 //   if (tblPOSVentadetStatus.Value = 'C') then
 //   begin
 //     tblPOSVentadet.Next;
  //    continue;
  //  end;
    PosVentaDetRefrescar(1);
    if not sqlIBSQEjecutar('Execute Procedure PROC_POSSetPrecioMay('+tblPOSVentadetNUMERO.AsString+');') then
    WriteToLog('Error actualizando precios mayoristas en tabla Pos_venta_det.');
    //if qryClasifPrecio.Locate('COD_PRODUCTO', tblPOSVentadetCodArticulo.Value,[]) then
    //begin
      //tblPOSVentadet.Edit;
      //tblPOSVentadetPrecio.Value  := qryClasifPrecioPRECIO_VENTA.Value;
    //  dmCalculos.ProcUpdateDetVta(tblPOSVentadetNUMERO.Value,
    //                              tblPOSVentaDetserie.Value,'Precio',
    //                              qryClasifPrecioPRECIO_VENTA.Value);
    //end;
    //if (tblPOSVentadetSerie.Value = 0) then Break;

    //if tblPOSVentadet.State In [dsEdit, dsInsert] then
    //tblPOSVentadet.Post;

  //  tblPOSVentadet.Next;
  //end;
  PosVentaDetRefrescar(0);
  sumarDatos:=True;
  //tblPOSVentadet.AutoCalcFields := False;
end;

procedure TfrmProcVentaRapidaPOS.RxDBLookupCombo1Exit(Sender: TObject);
begin
  RxDBLookupCombo1Change(Self);

  if tblPOSVentadet.RecordCount = 0 then exit;
  AbrirClasifPrecio;

  AplicaPrecioMayorista;

  if qryClienteUSARLEVELPRECIO.Value > 0 then
  RxSpinEdit1.Value:= qryClienteUSARLEVELPRECIO.Value;
                     
  if Not tblPOSVentasMastCODIGO_CTE.IsNull then
  if qryClienteCOD_VENDEDOR.Value > 0 then
    GlbCodVendedor :=qryClienteCOD_VENDEDOR.Value
  else
  GlbCodVendedor := -1;

  ProcSetNCFCliente;

  Refresh;
end;

procedure TfrmProcVentaRapidaPOS.ProcSetNCFCliente;
begin
  if Not tblPOSTotalesTipoNCFIFiscal.IsNull then Exit;
  if (tblPOSVentasMastCODIGO_CTE.Value > 0) then
  begin
    if qryCliente.Locate('CODIGO_CTE', tblPOSVentasMastCODIGO_CTE.Value, []) then
    begin
      if (qryClienteTIPO_CF.Value <> '') then
      begin
        if dmFactura.ibQryViewNCF.Locate('TIPO_CF', qryClienteTIPO_CF.Value, []) then
        begin
          GlbDescNCF := dmFactura.ibQryViewNCFDESCRIPCION.Value;
          if dmFactura.ibQryViewNCF.Locate('TIPO_CF', qryClienteTIPO_CF.Value, []) then
          begin
            if tblPOSTotales.State = dsBrowse then
            tblPOSTotales.Edit
            else
            if tblPOSTotales.State = dsInactive then
            dmcalculos.POSTotalesIni(tblPOSVentasMastNumero.Value);
            //TotalesTipoNCFIFiscal.Value := dmFactura.ibQryViewNCFTIPO_NCF_IFISCAL.Value;
            //TotalesTipoNCF.Value := dmFactura.ibQryViewNCFTIPO_CF.Value;
            tblPOSTotalesTIPONCFIFISCAL.Value := dmFactura.ibQryViewNCFTIPO_NCF_IFISCAL.Value;
            tblPOSTotalesTipoNCF.Value := dmFactura.ibQryViewNCFTIPO_CF.Value;
          end else
          begin
            AsignaNCFCFinal;
          end;
          //RxDBLookupCombo3Change(Self);
        end;
      end;
    end;
  end else
  begin
    AsignaNCFCFinal;
  end;
end;
procedure TfrmProcVentaRapidaPOS.AsignaNCFCFinal;
begin
  if dmFactura.ibQryViewNCF.State = dsInactive then
  dmFactura.ibQryViewNCF.Open;
  if dmFactura.ibQryViewNCF.Locate('TIPO_CF', '02', []) then
    begin
      if tblPOSVentasMast.State = dsBrowse then
         tblPOSVentasMast.Edit;
      if (CheckBox1.Checked) then
      begin
        tblPOSVentasMastTipoNCFIFiscal.Value := dmFactura.ibQryViewNCFTIPO_NCF_IFISCAL.Value;
        tblPOSVentasMastTipoNCF.Value := dmFactura.ibQryViewNCFTIPO_CF.Value;
      end else if (GlbActivaIFiscal = 0) then
      begin
        tblPOSVentasMastTipoNCFIFiscal.AsVariant := null;
        tblPOSVentasMastTipoNCF.AsVariant := null;
      end;


      if tblPOSTotales.State = dsBrowse then
         tblPOSTotales.Edit;
      if (CheckBox1.Checked) then
      begin
        tblPOSTotalesTipoNCFIFiscal.Value := dmFactura.ibQryViewNCFTIPO_NCF_IFISCAL.Value;
        tblPOSTotalesTipoNCF.Value := dmFactura.ibQryViewNCFTIPO_CF.Value;
      end else if (GlbActivaIFiscal = 0) then
      begin
        tblPOSTotalesTipoNCFIFiscal.AsVariant := null;
        tblPOSTotalesTipoNCF.AsVariant := null;
      end;

    end;
end;
procedure TfrmProcVentaRapidaPOS.AsignaNCFCFinalX(TIPO_NCF_IFISCAL : integer);
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
    if tblPOSTotales.State = dsBrowse then
       tblPOSTotales.Edit;
    if (CheckBox1.Checked) then
    begin
      tblPOSTotalesTipoNCFIFiscal.Value := dmFactura.ibQryViewNCFTIPO_NCF_IFISCAL.Value;
      tblPOSTotalesTipoNCF.Value := dmFactura.ibQryViewNCFTIPO_CF.Value;
    end else if (GlbActivaIFiscal = 0) then
    begin
      tblPOSTotalesTipoNCFIFiscal.AsVariant := null;
      tblPOSTotalesTipoNCF.AsVariant := null;
    end;
  end;
end;

procedure TfrmProcVentaRapidaPOS.ProcesaNuevo;
var
  numero : Integer;
begin
  if (edit1.Text <> '') And (tblPOSVentadet.RecordCount = 0) then
  begin
    edit1.Text:='';
    GlbUsandoCotiza:= False;
    GlbUsandoCotiza := False;
    if tblPOSVentadet.State = dsInactive then
    begin
      tblPOSVentadet.Open;
      
    end;

    EsModificandoFactura    := False;
    bitBtnEditarFact.Visible:= False;
    bitBtnEditarFact.SendToBack;
    Label36.Visible:=False;
    label36.Caption:='';
    label29.Top:= 413;
    dbTextMontoExoneraITBIS.Top := 410;
    label41.Visible := True;
    DBText15.Visible:= True;
    ActivarBotonesEnModifica;
    lblFechaCotizacion.Visible:=False;
    dbFechaCotizacion.Visible:=False;
    EsModificandoCotiza:=False;
    _NumeroCotiza  := -1;
    glbcodVendedor := -1;
  end;

  if tblPOSVentadet.State In [dsInsert] then
  tblPOSVentadetTipoVenta.Value := 0;//Item venta;

  if tblPOSVentadet.State In [dsInsert, dsEdit] then
  begin
    if (tblPOSVentadetCodArticulo.IsNull) OR (tblPOSVentadetCant.IsNull) OR (tblPOSVentadetPrecio.IsNull) then
    begin
      if isShowing then
      begin
        edtCodigo.SetFocus;
        Exit;
      end;
    end else
    GlbSalvarQuery(tblPOSVentadet);
    GlbNumeroSerie := tblPOSVentadetSerie.Value;
    //tblPOSVentadet.Post;
  end;

  tblPOSVentadet.EnableControls;
  recuperando := False;

  tblPOSVentadet.Append;
  tblPOSVentadetglbcodVendedor.Value := qryClienteCOD_VENDEDOR.Value;
  if not tblPOSVentasMastNumero.IsNull then
  tblPOSVentadetNUMERO.Value:= tblPOSVentasMastNumero.Value
  else
  tblPOSVentadetNUMERO.Value         := GetNumSecuenciaVta(VarUsuarioGlb,GlbFechaTrnDiaria);
  Numero:= tblPOSVentadetNUMERO.Value;
  tblPOSVentadetItbi.Value:=0;

  if EsModificandoFactura then
  tblPOSVentadetStatus.Value := 'I';
  if (GlbActivaIFiscal = 0) then
  RxSpeedButton1.Visible:= True;
  tblPOSVentadetCant.Value  := 1;
  //tblPOSVentadetSerie.Value := Numero;
  tblPOSVentadetFecha.Value := ExtraerFecha(GlbFechaTrnDiaria);

  if (GlbcodVendedor > 0) then
  tblPOSVentadetCodUsuario.Value := GlbcodVendedor
  else
  tblPOSVentadetCodUsuario.Value := VarUsuarioGlb;
end;

function TfrmProcVentaRapidaPOS.GetNumSecuenciaVta(codUsuario: integer;
  fecha: TDateTime): Integer;
  procedure UpdDatos(n:integer);
  begin
    tblPOSVentasMastNUMERO.Value := n;
    tblPOSVentasMastFECHA.Value  := ExtraerFecha(GlbFechaTrnDiaria);
    tblPOSVentasMastCIA_KEY.Value:= glbCia_Key;
    tblPOSVentasMastFECHA_IN.Value  := Now;
    tblPOSVentasMastIN_POR.Value    := strUserName;
    tblPOSVentasMastCODIGO_CTE.Value:=0;
  end;
begin
  result:=0;
  if (not tblPOSVentasMastNUMERO.IsNull) then
  begin
    if tblPosVentaDet.State = dsInsert then
    tblPOSVentadetNUMERO.Value:=tblPOSVentasMastNUMERO.Value;
    Exit;
  end else
  begin
    if not tblPOSVentadetNUMERO.IsNull then
    begin
      if tblPOSVentasMast.State = dsInactive then
      begin
        tblPOSVentasMast.Params[0].Value := tblPOSVentadetNUMERO.Value;
        tblPOSVentasMast.Open;
        tblPOSVentasMast.First;
        if tblPOSVentasMast.RecordCount = 0 then
        begin
          tblPOSVentasMast.Insert;
          UpdDatos(tblPOSVentadetNUMERO.Value);
        end;
      end else
      if tblPOSVentasMast.State In [dsInsert, dsEdit] then      
      UpdDatos(tblPOSVentadetNUMERO.Value);
      Exit;
    end;
  end;
  qryPosCtrlSecuencia.Close;
  qryPosCtrlSecuencia.Params[0].Value:=codUsuario;
  qryPosCtrlSecuencia.Params[1].Value:=ExtraerFecha(Fecha);
  qryPosCtrlSecuencia.Open;
  qryPosCtrlSecuencia.First;
  if qryPosCtrlSecuencia.RecordCount = 0 then
  begin
    qryPosCtrlSecuencia.Insert;
    qryPosCtrlSecuenciaSTATUS.Value:= 'A';
    qryPosCtrlSecuenciaNUMERO.Value:= 1;
    qryPosCtrlSecuenciaCOD_USUARIO.Value :=VarUsuarioGlb;
    qryPosCtrlSecuenciaFECHA.Value := ExtraerFecha(Fecha);
    GlbSalvarQuery(qryPosCtrlSecuencia);
    result:=qryPosCtrlSecuenciaNUMERO.Value;
  end else   
  if (qryPosCtrlSecuenciaSTATUS.Value = 'A') then
  begin
    result:=qryPosCtrlSecuenciaNUMERO.Value+1;
    qryPosCtrlSecuencia.Edit;
    qryPosCtrlSecuenciaNUMERO.Value := result;
    qryPosCtrlSecuenciaSTATUS.Value := 'R';
    GlbSalvarQuery(qryPosCtrlSecuencia);    
  end else
  begin
    result:=qryPosCtrlSecuenciaNUMERO.Value + 1;
    qryPosCtrlSecuencia.Edit;
    qryPosCtrlSecuenciaNUMERO.Value := result;
    qryPosCtrlSecuenciaSTATUS.Value := 'R';
    GlbSalvarQuery(qryPosCtrlSecuencia);
  end;
  if tblPOSVentasMast.State = dsInactive then
  begin
    tblPOSVentasMast.Params[0].Value := result;
    tblPOSVentasMast.Open;
    tblPOSVentasMast.Insert;
    UpdDatos(result);
  end else
  begin
    if (tblPOSVentasMast.Params[0].Value <> result) then
    begin
      tblPOSVentasMast.Close;
      tblPOSVentasMast.Params[0].Value := result;
      tblPOSVentasMast.Open;
      if tblPOSVentasMast.RecordCount = 0 then
      tblPOSVentasMast.Insert
      else 
      tblPOSVentasMast.Edit;
      UpdDatos(result);
    end else
    if (tblPosVentasMastNumero.IsNull) then
    begin
      if tblPosVentasMast.State = dsBrowse then
      tblPosVentasMast.Edit;
      UpdDatos(result);
    end;
  end;
  dmCalculos.POSTotalesIni(tblPOSVentasMast.Params[0].Value);
end;

function TfrmProcVentaRapidaPOS.BuscarRutaImagen(
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

procedure TfrmProcVentaRapidaPOS.SetPrecioPorCantidad;
begin
  if tblPOSVentadet.State = dsBrowse then
  tblPOSVentadet.Edit;
  dmVentas.qryPrecioUnidadSurt.Close;
  dmVentas.qryPrecioUnidadSurt.Params[0].Value:= tblPOSVentadetCodArticulo.Value;
  dmVentas.qryPrecioUnidadSurt.Open;
  
  if GlbUsaPUnidadLevel = 1 then
  begin
    dmVentas.qryPrecioUnidadSurt.Close;
    dmVentas.qryPrecioUnidadSurt.Params[0].Value:=tblPOSVentadetCodArticulo.Value;
    dmVentas.qryPrecioUnidadSurt.Open;
    if dmVentas.qryPrecioUnidadSurt.Locate('COD_PRODUCTO;IDUNIDAD',
    VarArrayOf([tblPOSVentadetCodArticulo.Value,GlbTipoUnidad]),[]) then
    begin
      cboxTipoUnidad.Text:=dmVentas.qryPrecioUnidadSurtDESCRIPCION.Value;
      case RxSpinEdit1.AsInteger Of
      1: begin
           if dmVentas.qryPrecioUnidadSurtPRECIOVENTA1.Value > 0 then
           tblPOSVentadetPrecio.Value := dmVentas.qryPrecioUnidadSurtPRECIOVENTA1.Value;
         end;
      2: begin
          if dmVentas.qryPrecioUnidadSurtPRECIOVENTA2.Value > 0 then
          tblPOSVentadetPrecio.Value := dmVentas.qryPrecioUnidadSurtPRECIOVENTA2.Value;
         end;
      3:begin
          if dmVentas.qryPrecioUnidadSurtPRECIOVENTA3.Value > 0 then
          tblPOSVentadetPrecio.Value := dmVentas.qryPrecioUnidadSurtPRECIOVENTA3.Value;
        end;
      4: begin
           if dmVentas.qryPrecioUnidadSurtPRECIOVENTA4.Value > 0 then
           tblPOSVentadetPrecio.Value := dmVentas.qryPrecioUnidadSurtPRECIOVENTA4.Value;
        end;
      end;//case
    end;
  end else
  begin
  QryPrecios.Close;
  QryPrecios.Params[0].Value:=tblPOSVentadetCodArticulo.Value;
  QryPrecios.Open;
  if QryPrecios.Locate('Codigo', tblPOSVentadetCodArticulo.Value,[]) then
  begin
    case RxSpinEdit1.AsInteger Of
    1: begin
         if QryPreciosPRECIOVENTA1.Value > 0 then
         tblPOSVentadetPrecio.Value := QryPreciosPRECIOVENTA1.Value;
       end;
    2: begin
        if QryPreciosPRECIOVENTA2.Value > 0 then
        tblPOSVentadetPrecio.Value := QryPreciosPRECIOVENTA2.Value;
       end;
    3:begin
        if QryPreciosPRECIOVENTA3.Value > 0 then
        tblPOSVentadetPrecio.Value := QryPreciosPRECIOVENTA3.Value;
      end;
    4: begin
         if QryPreciosPRECIOVENTA4.Value > 0 then
         tblPOSVentadetPRECIO.Value := QryPreciosPRECIOVENTA4.Value;
      end;
    end;//case
  end;
  end;
  if (tblPOSVentadetPrecio.Value = 0) then
  begin
    MessageDlg('Precio por niveles no esta configurado verifique.',mterror,[mbok],0);
  end;
end;

function TfrmProcVentaRapidaPOS.precioXUnidad(idTipoUnidad,
  idProducto: Integer): Extended;
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
      result:=tblPosVentadetPrecio.Value;
    end;
  end;
  end;

procedure TfrmProcVentaRapidaPOS.edtCodigoEnter(Sender: TObject);
begin
  if tblPOSVentasMast.State = dsInactive then
  tblPOSVentasMast.Open;
  if dmFactura.ibQryViewNCF.State = dsInactive then
  dmFactura.ibQryViewNCF.Open;
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

  if (tblPOSVentadetPORCDESCITEM.Value > 0) and (tblPosTotalesMontoDescAdicional.IsNull or
  (tblPosTotalesMontoDescAdicional.Value = 0)) then
  begin
    qryPROC_POSRecalcVtaDet.close;
    qryPROC_POSRecalcVtaDet.Params[0].Value:=tblPosVentaDetNumero.Value;
    qryPROC_POSRecalcVtaDet.Open;
    tblPosTotales.close;
    tblPosTotales.open;
    PosDescItemGlb;
  end;
end;

procedure TfrmProcVentaRapidaPOS.DBEdit1Exit(Sender: TObject);
begin
  if tblPOSVentadet.State In [dsInsert, dsEdit] then
  begin
    tblPOSVentaDetDescUnidadMedida.Value:=cboxTipoUnidad.Text;
    if (tblPOSVentadetCant.Value > qryProductosCANTIDAD.Value) And (GlbPermiteVentaInv0 = 0) then
    begin
      MessageDlg('Cantidad venta es mayor que existencia inventario', mtWarning, [mbOK], 0);
      DBEdit1.SetFocus;
      exit;
    end;

    if (tblPOSVentadetCant.Value < 0) then
    begin
      MessageDlg('Cantidad no puede ser número negativo, verifique',mtError, [mbOK], 0);
      DBEdit1.SetFocus;
      exit;
    end;
    tblPOSVentadetMontoBruto.Value:= tblPOSVentadetCant.Value * tblPOSVentadetPrecio.Value;
    if (tblPOSVentadetCantPax.Value > 0) then
    tblPOSVentadetMontoBruto.Value:= (tblPOSVentadetCant.Value * tblPOSVentadetPrecio.Value) *
    tblPOSVentadetCantPax.Value;

    if EsDevolucion then
    tblPOSVentadetMontoBruto.Value:=(tblPOSVentadetCant.Value * tblPOSVentadetPrecio.Value) * -1;

    tblPOSVentadetMontoDescItem.Value:= tblPOSVentadetMontoBruto.Value * tblPOSVentadetPorcDescItem.Value / 100;
    tblPOSVentadetMontoDesGlobal.Value := tblPOSVentadetMontoBruto.Value * (tblPOSVentasMastPorcDesAdicional.Value / 100);
  end;

  if (auxiCant > 0) And (auxiCant <> tblPOSVentadetCant.Value) then
  PrecioCambio:= True;

  if tblPOSVentadet.State In [dsInsert] Then
  begin
    if (tblPOSVentadetSerie.IsNull Or (tblPOSVentadetSerie.value = 0)) then
    tblPOSVentadetSerie.Value := FsqlMaxNumero('POS_VENTA_DET','SERIE');
    if (tblPOSVentadetSerie.IsNull or (tblPOSVentadetSerie.value = 0)) then
    tblPOSVentadetSerie.Value := 1;
    GlbNumeroSerie:= tblPOSVentadetSerie.Value;
  end;
  if tblPOSVentadetNumero.IsNull then
  tblPOSVentadetNumero.Value:= GetNumSecuenciaVta(VarUsuarioGlb,ExtraerFecha(GlbFechaTrnDiaria));
  GlbNumeroSerie:= tblPOSVentadetserie.value;

  if tblPOSVentadetFEcha.IsNull then
  tblPOSVentadetFecha.Value :=  ExtraerFecha(GlbFechaTrnDiaria);

  //if tblPOSVentadet.State In [dsInsert, dsEdit] Then
  //GlbSalvarQuery(tblPOSVentadet);
  GlbNumeroSerie := tblPOSVentadetSerie.Value;
  //tblPOSVentadet.Post;
  //tblPOSVentasMastMonto_Bruto.Value
  //ProcesaNuevo;
  edtCodigo.SelectAll;
  edtCodigo.ClearSelection;

  //if isShowing then
  //edtCodigo.SetFocus;

  panel2.Visible := False;

  if isShowing then
  if (not GlbPermiteCambioPrecio) then //Adm
  begin
    dmcalculos.POSProcesaCalculos;
    //exito pos dmCalculos.PosSumatotal;
    DBEdit2.ReadOnly := False;
    DBEdit2.SetFocus;
  end else
  begin
    DBEdit2.ReadOnly := False;
    DBEdit2.SetFocus;
  end;

  Refresh
end;
procedure TfrmProcVentaRapidaPOS.RxDBGrid2DblClick(Sender: TObject);
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
  if Assigned(frmProcVentaRapidaPOS) Then
  if (showing) then
  if cboxTipoUnidad.Enabled then
  cboxTipoUnidad.SetFocus;
  Panel2.Visible := False;
  edtCodigoExit(Self);
end;

procedure TfrmProcVentaRapidaPOS.RxDBGrid2Exit(Sender: TObject);
begin
  if Not dmInventario.qryTipoUnidad.Locate('IDUNIDAD', tblPOSVentaDetTipoUnidad.Value, []) then
  begin
    if (tblPOSVentaDetTipoUnidad.Value = 0) then
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
  Panel2.Visible:=False;
  GlbNumeroSerie:= tblPosVentaDetSerie.Value;  
end;

procedure TfrmProcVentaRapidaPOS.RxDBGrid2GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if qryProductosCANTIDAD.Value <=5 then
  begin
    BackGround := clYellow;
    aFont.Color := clblack;
  end;
end;

procedure TfrmProcVentaRapidaPOS.RxDBGrid2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = 13 then
  RxDBGrid2DblClick(Self);
end;

procedure TfrmProcVentaRapidaPOS.RxDBGrid2KeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = '#13' then
  RxDBGrid2DblClick(Self);
end;

procedure TfrmProcVentaRapidaPOS.DBEdit2Exit(Sender: TObject);
var
  porcdes : Extended;
  diff : Currency;
  cambioValido : Boolean;
begin
  cambioValido:=False;
   cPrecio:= tblPosVentaDetPrecio.Value;
   if tblPosVentaDet.State in [dsEdit, dsInsert] then
   begin
     if (cPrecio < aPrecio) or (cPrecio < qryProductosPRECIO_MINIMO.Value) and (not EsDevolucion) then
     begin
       if (not VerificaClave) then
       begin
         MessageDlg('Precio no será cambiado', mtWarning, [mbOk], 0);
         tblPosVentaDetPrecio.Value := aPrecio;
       end else cambioValido:=True;
     end;
   end;
  if (aPrecio <> cPrecio) then
  PrecioCambio:=True else PrecioCambio:=False;

  BitBtn27Click(Self);

  if tblPosVentaDet.State In [dsInsert, dsEdit] Then
  GlbSalvarQuery(tblPOSVentadet);
  GlbNumeroSerie:= tblPOSVentadetSerie.Value;
  if tblPosVentaDet.State = dsBrowse then
  tblPosVentaDet.Locate('Serie', yNumSerie,[]);
  if tblPosVentaDetCodTexto.Value = '' then Exit;

  if Not qryInventario.Locate('CODIGO_TEXTO', tblPosVentaDetCodTexto.Value,[]) then
  MessageDlg('codigo ' + tblPosVentaDetCodTexto.Value + ' no encontrado en inventario, verifique', mtError, [mbOK], 0)
  else
  begin
    diff := tblPosVentaDetPrecio.Value - qryProductosPRECIO_MINIMO.Value;
    qryProductos.Locate('CODIGO',qryInventariocODIGO.Value,[]);
    if (Not FAplicaPrecioMayorista) And ((tblPosVentaDetPrecio.Value < qryProductosPRECIO_MINIMO.Value) and
    (ABS(diff) > 2)) And (glbUsaescalaPrecio = 0) And (Not cambioValido)
    And (not GLBEsFastFood) //temporal hasta probar version Limao
     then
    begin
      tblPosVentaDet.Edit;
      tblPosVentaDetPrecio.Value := aPrecio;
      GlbSalvarQuery(tblPOSVentadet);
      GlbNumeroSerie:= tblPOSVentadetSerie.Value;
      if (GlbUsaPUnidadLevel = 0) then
      if MessageDlg('Precio es menor que el minimo, continuar?', mtError, [mbYes,mbNo], 0) = mrno then
      begin
        DBEdit2.ReadOnly := False;
        DBEdit2.SetFocus;
        Exit;
      end;
    end;
  end;

  DBEdit2.ReadOnly := True;

  //Ejecutar stored procedure
  //Select * from Proc_PosCalcVtaDet(:numero_in)
  //DBEdit1Exit(Self);
  //Proc_POSEjecutaCalculosDet;
  if tblPOSVentadet.State = dsBrowse then
  tblPOSVentadet.Edit;
  if tblPOSVentadet.State In [dsInsert, dsEdit] Then
  GlbSalvarQuery(tblPOSVentadet);
  GlbNumeroSerie := tblPOSVentadetSerie.Value;

  dmcalculos.POSProcesaCalculos;
  //exito pos dmCalculos.PosSumatotal;
  if isShowing then
  edtCodigo.SetFocus;
end;

procedure TfrmProcVentaRapidaPOS.BitBtn27Click(Sender: TObject);
begin
  if tblPOSVentadetFecha.IsNull then exit;
  if tblPOSVentadet.State = dsBrowse then
  tblPOSVentadet.Edit;
  if tblPOSVentadet.State In [dsInsert, dsEdit] Then
  GlbSalvarQuery(tblPOSVentadet);
  GlbNumeroSerie := tblPOSVentadetSerie.Value;

  dmCalculos.CheckBox2Checked :=CheckBox2.Checked;
  dmCalculos.chkExentoChecked :=chkExento.Checked;
  dmCalculos.rdgFactServicioChecked :=rdgFactServicio.Checked;
  dmCalculos.CheckBox3Checked :=CheckBox3.Checked;
  dmCalculos.EsFactura := EsFactura;
  dmCalculos.EsFinanciamiento := EsFinanciamiento;
  dmCalculos.CheckBox4Checked := CheckBox4.Checked;
  dmCalculos.xCodigoPropietario := tblPOSVentasMastCODIGO_CTE.Value;
  dmCalculos.chKDescuentoGlobalChecked := chKDescuentoGlobal.Checked;

  dmcalculos.POSProcesaCalculos;
  dmcalculos.PosSumatotal;
end;

procedure TfrmProcVentaRapidaPOS.RxDBGrid2Enter(Sender: TObject);
begin
  GlbNumeroSerie:= tblPOSVentaDetSerie.Value;
end;

procedure TfrmProcVentaRapidaPOS.RxDBLookupCombo5Change(Sender: TObject);
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
        tblPOSVentaDetPrecio.Value  := precioXUnidad(GlbTipoUnidad, qryProductoscodigo.value); //qryProductosPRECIO_TIPO_UNIDAD.Value;
        if (tblPOSVentaDetprecio.Value = 0) And (Not PrecioCambio )then
        begin
          if (GlbUsaescalaPrecio = 1) And (Not GlbUsandoCotiza Or ( tblPOSVentadetSTATUS.Value = 'I') ) then
          begin
            SetPrecioPorCantidad;//case
          end;
        end;
      end;
    end;
  end;
  procCalC:=true;
end;

procedure TfrmProcVentaRapidaPOS.RxDBLookupCombo5Enter(Sender: TObject);
begin
  dmVentas.qryPrecioUnidadSurt.Close;
  dmVentas.qryPrecioUnidadSurt.Params[0].Value:= tblPOSVentaDetCodArticulo.Value;
  dmVentas.qryPrecioUnidadSurt.Open;
  panel2.Visible := False;
end;

procedure TfrmProcVentaRapidaPOS.DBEdit12Exit(Sender: TObject);
begin
  //if tblPOSVentaDetIDTasaITBIS.IsNull Or (tblPOSVentaDetIDTasaITBIS.Value = 0) then
  //DBRadioGroup1Click(Self);//no se usa
  dmcalculos.POSProcesaCalculos;
  //exito pos dmCalculos.PosSumatotal;  
end;

procedure TfrmProcVentaRapidaPOS.RxSpinEdit1Exit(Sender: TObject);
begin
  BitBtn27Click(Self);
  dmcalculos.POSProcesaCalculos;
  //exito pos dmCalculos.PosSumatotal;  
end;

procedure TfrmProcVentaRapidaPOS.RxSpinEdit1Change(Sender: TObject);
var
  guardarRec : TBookMark;
begin
  //guardarRec := tblPOSVentadet.GetBookmark;
  if tblPOSVentaDet.State = dsBrowse then
  tblPOSVentaDet.Edit;
  if tblPOSVentaDetCodArticulo.IsNull then Exit;
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

  if tblPOSVentaDet.state = dsbrowse then
  tblPOSVentaDet.Edit;
  DBEdit1Change(Self);
  procCalC:=true;               
  //rxVenta.GotoBookmark(guardarRec);
  //rxventa.FreeBookmark(guardarRec);
end;

procedure TfrmProcVentaRapidaPOS.DBEdit2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
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
    if tblPOSVentaDet.State = dsBrowse then
    begin
      item:=InputBox('Borrar un item','Entre número item a eliminar','');
      if tblPOSVentaDet.Locate('Serie', strToInt(item),[]) then
      tblPOSVentaDet.Delete;
      GlbSalvarQuery(tblPosVentaDET);
      //temp Marzo-17-2015 ProcesarSumaTotal;
      BitBtn27Click(Self);
    end;
  end else
  if (key = 119) then //F8
  btnPagoExactoClick(Self);
end;

procedure TfrmProcVentaRapidaPOS.DBEdit2Enter(Sender: TObject);
begin
  edtCodigo.Text := '';
  pesoProd := '';
  if (GlbNumeroSerie > 0) then
  if tblPOSVentadet.State = dsbrowse then
  tblPOSVentadet.Locate('Serie', GlbNumeroSerie,[]);
  DBEdit2.SelectAll;
  aPrecio:= tblPOSVentadetPrecio.Value;
end;

procedure TfrmProcVentaRapidaPOS.DBEdit3Exit(Sender: TObject);
begin
  if (tblPosVentaDetMontoBruto.Value = 0) or (tblPosVentaDetMontoBruto.IsNull) then
  edtCodigo.SetFocus;
end;

procedure TfrmProcVentaRapidaPOS.RxDBLookupCombo2Change(Sender: TObject);
begin
  //glbMoneda:= TotalesMoneda.AsInteger;
  GlbMoneda := tblMonedaCODIGO.AsInteger;
  if tblPOSVentasMast.State = dsBrowse then
  tblPOSVentasMast.Edit;
  if tblPOSVentadet.State In [dsBrowse] Then
  if tblPOSVentadet.RecordCount > 0 then
  begin
    tblPOSVentadet.Edit;
    ProcCalculoDivisa;
  end;
  Refresh;
end;

procedure TfrmProcVentaRapidaPOS.RxDBLookupCombo2Click(Sender: TObject);
begin
  if tblPOSVentasMast.State = dsBrowse then
  tblPOSVentasMast.Edit;
end;

procedure TfrmProcVentaRapidaPOS.RxDBLookupCombo2Enter(Sender: TObject);
begin
  if tblPOSVentasMast.State = dsBrowse then
  tblPOSVentasMast.Edit;
end;

procedure TfrmProcVentaRapidaPOS.RxDBLookupCombo2Exit(Sender: TObject);
begin
  GlbMoneda:= tblPOSVentasMastMoneda.AsInteger;
  if tblPOSVentasMast.State in [dsInsert, dsEdit] then
  tblPOSVentasMast.Post;
  if tblPOSVentasMast.State = dsBrowse then
  tblPOSVentasMast.Edit;
  ProcCalculoDivisa;

  if tblPOSVentadet.State = dsBrowse then
  tblPOSVentadet.Edit;
  if tblPOSVentadet.State In [dsInsert, dsEdit] Then
  GlbSalvarQuery(tblPOSVentadet);
  GlbNumeroSerie := tblPOSVentadetSerie.Value;

  dmcalculos.POSProcesaCalculos;
  //exito pos dmCalculos.PosSumatotal;  
  tblPOSVentasMasttotalneto.DisplayFormat:=Concat(SimboloMoneda(tblPOSVentasMastMoneda.Value),',0.00');

end;

procedure TfrmProcVentaRapidaPOS.ProcCalculoDivisa;
var
  guardarRec : TBookMark;
begin
  if tblPOSVentaDet.RecordCount > 0 then
  begin
    if tblPOSVentaDet.State = dsBrowse then
    begin
      guardarRec := tblPOSVentaDet.GetBookmark;
      //tblPOSVentaDet.First;
      //tblPOSVentaDet.AutoCalcFields := False;
      //While Not tblPOSVentaDet.Eof Do
      //begin
        tblPOSVentaDet.Edit;
        tblPOSVentaDetMoneda.Value := tblPOSVentasMastmoneda.Value;
        sqlIBSQEjecutar('update POS_VENTA_DET set MONEDA='+chr(39)+
        tblPOSVentasMastmoneda.Value+chr(39)+ ' Where numero ='+tblPOSVentaDetNumero.AsString);
        GlbSalvarQuery(tblPOSVentadet);
        GlbNumeroSerie:= tblPOSVentadetSerie.Value;
        tblPOSVentadet.Close;
        tblPOSVentadet.Open;
        //WriteToLog('Post rxVenta - Line 8055');
      //  tblPOSVentaDet.Next;
      //end;
      tblPOSVentaDet.GotoBookmark(guardarRec);
      tblPOSVentaDet.FreeBookmark(guardarRec);
      tblPOSVentaDet.AutoCalcFields:=True;
    end else
    begin
      if tblPOSVentadet.State In [dsBrowse] Then
      tblPOSVentadet.Edit;
      tblPOSVentadetMoneda.Value := tblPOSVentasMastmoneda.Value;
    end;
    if tblPOSVentadet.State In [dsBrowse] Then
       tblPOSVentadet.Edit;

    if tblPOSVentadet.State In [dsInsert, dsEdit] Then
    begin
       GlbSalvarQuery(tblPOSVentadet);
       GlbNumeroSerie:= tblPOSVentadetSerie.Value;
       //WriteToLog('Post rxVenta - Line 8075');
    end;
  end;
end;

procedure TfrmProcVentaRapidaPOS.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if (tblPOSVentaDetStatus.Value = 'C') then
  Background := clGray
  else
  if (tblPOSVentaDetStatus.Value = 'I') then
  Background := clGreen;
end;

procedure TfrmProcVentaRapidaPOS.DBEdit9Exit(Sender: TObject);
begin
  if tblPOSVentaDETIDTasaITBIS.IsNull Or (tblPOSVentaDETIDTasaITBIS.Value = 0) then
  DBRadioGroup1Click(Self);
  dmcalculos.POSProcesaCalculos;
  qryPROC_POSRecalcVtaDet.Close;
  qryPROC_POSRecalcVtaDet.Params[0].Value:=tblPosVentaDetNumero.Value;

  tblPostotales.Refresh;
  tblPOSVentaDET.Refresh;

end;

procedure TfrmProcVentaRapidaPOS.RxDBGrid3DblClick(Sender: TObject);
begin
  RxDBGrid3.Visible := False;
end;

procedure TfrmProcVentaRapidaPOS.DBRadioGroup1Click(Sender: TObject);
begin
  //
end;
procedure TfrmProcVentaRapidaPOS.FormHide(Sender: TObject);
begin
  isShowing:=False;
end;

procedure TfrmProcVentaRapidaPOS.FormActivate(Sender: TObject);
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

procedure TfrmProcVentaRapidaPOS.BitBtn9Click(Sender: TObject);
begin
  if (rdgFactServicio.Checked And rdgFactVentaProducto.Checked)
  And (tblPOSVentaDet.RecordCount > 0) Then
  begin
    MessageDlg('Favor indicar tipo de Operación', mtInformation, [mbOK], 0);
    rdgFactServicio.SetFocus;
    Exit;
  end;
  if (tblPOSVentasMastMONTO_PAGADO.Value > 0) and (tblPOSVentaDet.RecordCount > 0) then
  begin
    MessageDlg('Favor procesar o cancelar venta en progreso', mtInformation, [mbOK], 0);
    Exit;
  end;
  dmCalculos.datosSetDataDone:=False;
  dmCalculos.datosCargados:=False;
  LlenandoDatos:=True;

  frmCotizaciones:=TfrmCotizaciones.Create(Nil);
  try
    frmCotizaciones.BitBtn4Click(Self);
    if frmCotizaciones.Showmodal = mrOk then
    begin
      GlbUsandoCotiza:= True;
      frmCotizaciones.ibqryCotizacionDet.First;
      LlenandoDatos:=True;
      dmVentas.stpProcPosCotMast.Params[1].Value:= frmCotizaciones.ibqryCotizacionMasterNumero.Value;
      dmVentas.stpProcPosCotMast.Params[2].Value:= VarUsuarioGlb;
      dmVentas.stpProcPosCotMast.Params[3].Value:= extraerFecha(GlbFechaTrnDiaria);
      dmVentas.stpProcPosCotMast.ExecProc;
      if not dmVentas.stpProcPosCotMast.Transaction.InTransaction then
      dmVentas.stpProcPosCotMast.Transaction.StartTransaction;
      try
        dmVentas.stpProcPosCotMast.Transaction.CommitRetaining;
      except
      dmVentas.stpProcPosCotMast.Transaction.RollbackRetaining;
      end;

      tblPOSVentasMast.Params[0].Value:= dmVentas.stpProcPosCotMast.params[0].AsInteger;

      dmVentas.stpProcPosCotDet.Close;
      dmVentas.stpProcPosCotDet.Params[0].Value:= frmCotizaciones.ibqryCotizacionMasterNumero.Value;
      dmVentas.stpProcPosCotDet.Params[1].Value:= VarUsuarioGlb;
      dmVentas.stpProcPosCotDet.Params[2].Value:= ExtraerFecha(GlbFechaTrnDiaria);
      dmVentas.stpProcPosCotDet.Open;
      if not dmVentas.stpProcPosCotDet.Transaction.InTransaction then
      dmVentas.stpProcPosCotDet.Transaction.StartTransaction;
      try
        dmVentas.stpProcPosCotDet.Transaction.CommitRetaining;
      except
      dmVentas.stpProcPosCotDet.Transaction.RollbackRetaining;
      end;
      tblPOSTotales.Close;
      tblPOSTotales.Params[0].Value:=dmVentas.stpProcPosCotDetNUM_TRN.Value;
      tblPOSTotales.Open;

      tblPOSVentasMast.Close;
      tblPOSVentasMast.Params[0].Value:= dmVentas.stpProcPosCotDetNUM_TRN.Value;
      tblPOSVentasMast.Open;
      
      tblPOSVentadet.Close;
      tblPOSVentadet.Params[0].Value:= dmVentas.stpProcPosCotDetNUM_TRN.Value; //dmVentas.stpProcPosCotDet.Params[0].Value;
      tblPOSVentadet.Open;


      Application.ProcessMessages;
      if tblPOSVentasMast.State = dsInactive then
      tblPOSVentasMast.Open;
      tblPOSVentasMast.Edit;
      tblPOSVentasMastCIA_KEY.Value:=frmCotizaciones.ibqryCotizacionMasterCIA_KEY.Value;
      if tblPOSVentasMastCIA_KEY.IsNull then
      tblPOSVentasMastCIA_KEY.Value:= glbCia_Key;
      tblPOSVentasMastComentario.Value := frmCotizaciones.ibqryCotizacionMasterCOMENTARIO.Value;
      tblPOSVentasMastMonto_Recargo.Value    := frmCotizaciones.ibqryCotizacionMasterMONTO_RECARGO.Value;
      tblPOSVentasMastMontoExoneraITBIS.Value := frmCotizaciones.ibqryCotizacionMasterMONTO_EXONERADO_ITBIS.Value;
      tblPOSVentasMastTipoNCFIFiscal.Value    := frmCotizaciones.ibqryCotizacionMasterTIPONCFIFISCAL.Value;
      tblPOSVentasMastMONTO_TOTAL_ITBIS.Value             := frmCotizaciones.ibqryCotizacionMasterMONTO_TOTAL_ITBIS.Value;
      tblPOSVentasMastPorcDesAdicional.Value  :=
      frmCotizaciones.ibqryCotizacionMasterPORC_DESCUENTO.Value;
      tblPOSVentasMastTIPONCF.Value:='01';

      if tblPOSVentasMastPorcDesAdicional.Value > 0 then
      chKDescuentoGlobal.Checked := True else
      chKDescuentoGlobal.Checked := False;

      AsignaNCFCFinal;

      if tblPOSVentasMast.State = dsEdit then
      GlbSalvarQuery(tblPOSVentasMast);

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
      if  tblPOStotalesnumero.IsNull then
      dmCalculos.POSTotalesIni(dmVentas.stpProcPosCotDetNUM_TRN.Value);
      tblPOStotales.edit;
      GlbSalvarQuery(tblPOStotales);
      tblPOStotales.Refresh;
    end;
  finally
  frmCotizaciones.Free;
  frmCotizaciones:=Nil;
  end;
  procCalc:=True;

  DBEdit10Exit(Self);
  LlenandoDatos:=false;
  dmCalculos.esFeedback := True;
  BitBtn27Click(Self);

  Application.ProcessMessages;

  //rxVenta.EnableControls;
  tblPOSVentadet.EnableControls;
  RxDBGrid1.EnableScroll;
  Refresh;
end;

procedure TfrmProcVentaRapidaPOS.Edit1Enter(Sender: TObject);
begin
  if not tblPOSTotalesMoneda.IsNull then
  begin
    if tblPOSTotalesMoneda.IsNull then
    begin
      tblPOSTotales.Edit;
      tblPOSTotalesMoneda.Value := IntToStr(GlbMonedaBase);
      GlbSalvarQuery(tblPOSTotales);
      if (tblPOSVentadet.RecordCount > 0) And (tblPOSVentadetMoneda.IsNull) then
      tblPOSVentadet.Edit;
      tblPOSVentadetMoneda.Value:= tblPOSVentasMastMoneda.Value;
      if tblPOSVentadet.State in [dsEdit, dsInsert] then
      GlbSalvarQuery(tblPOSVentadet);
      GlbNumeroSerie:= tblPOSVentadetSerie.Value;
    end;
  end;

  if (tblPOSTotalestotalneto.Value < 0) and (not EsDevolucion) then
  begin
    MessageDlg('Total neto no puede ser negativo, verifique',mtError, [mbOK], 0);
    exit;
  end;
  panel2.Visible := False;
end;

procedure TfrmProcVentaRapidaPOS.DBEdit10Enter(Sender: TObject);
begin
  if tblPOSTotalesTipoNCFIFiscal.IsNull then
  begin
    MessageDlg('Favor indicar tipo comprobante fiscal.',mtInformation,[mbok], 0);
    RxDBLookupCombo3.SetFocus;
    Exit;
  end;
  DBEdit10.SelectAll;
end;

procedure TfrmProcVentaRapidaPOS.DBEdit10Exit(Sender: TObject);
begin
  if (tblPOSVentadet.RecordCount > 0) and (tblPOSVentadet.State = dsBrowse) then
  tblPOSVentadet.Edit;
  GlbAlreadyCld := True;
  //Diciembre 11 del 2017
  //probemas con calculot monto itbis recargo
  //temporal juan ramon divison chkExento.Checked := True;
  //chkExentoExit(Self);
  chkExento.Checked := False;
  RxDBLookupCombo3Exit(self);
  //t BitBtn27Click(Self);
  //Refresh;
end;

procedure TfrmProcVentaRapidaPOS.PosVentaDetRefrescar(tipo:smallint);
begin
  if (tipo = 1) then
  serieBooked :=tblPOSVentadetSERIE.Value
  else
  if (serieBooked > 0) then
  begin
    tblPosVentaDet.Close;
    tblPosVentaDet.Open;
    tblPosVentaDet.locate('serie',serieBooked,[]);    
  end;
  serieBooked := -1;
end;

procedure TfrmProcVentaRapidaPOS.tblPOSVentasMastBeforePost(
  DataSet: TDataSet);
begin
  if tblPOSVentasMastNumero.IsNull or (tblPOSVentasMastNumero.Value=0) then
  begin
    if (tblPOSTotalesNUMERO.IsNull) Or (tblPOSTotalesNUMERO.Value = 0)  then
    tblPOSVentasMastNumero.Value:= GetNumSecuenciaVta(VarUsuarioGlb,ExtraerFecha(GlbFechaTrnDiaria))
    else
    tblPOSVentasMastNumero.Value:= tblPOSTotalesNUMERO.Value;
  end;
  try
  tblPOSVentasMastMontoSubTotalIndirectos.Value  :=
  tblPOSVentasMastMontoDescGastosAdmin.Value      +
  tblPOSVentasMastMontoDescItbisGastosAdmin.Value +
  tblPOSVentasMastMontoDescTransp.Value           +
  tblPOSVentasMastMontoDescDirtecnica.Value       +
  tblPOSVentasMastMontoDescItbisDirTecnica.Value  +
  tblPOSVentasMastMontoDescImprevisto.Value       +
  tblPOSVentasMastMontoDescItbisImprevisto.Value;

  tblPOSVentasMastDiferencia.Value:=
  tblPOSVentasMasttotalneto.Value -
  (tblPOSTotalesMontoEnEfectivo.Value +
  tblPOSTotalesMontoEnTarjeta.Value   +
  tblPOSTotalesMontoEnCheque.Value    +
  tblPOSTotalesMontoEnBonos.Value     +
  tblPOSTotalesMontoNCRAplicado.Value
  );
  except
  end;
end;

procedure TfrmProcVentaRapidaPOS.tblPOSVentadetAfterPost(
  DataSet: TDataSet);
begin
    if tblPOSVentadetMONBTOBRUTOCLD.Value = 0 then
    begin
      tblPOSVentadet.Disablecontrols;
      tblPOSVentadet.Close;
      tblPOSVentadet.Open;
      tblPOSVentadet.Last;
      tblPOSVentadet.Enablecontrols;
    end;
     if tblPOSTotales.State in [dsInactive] then
  begin
    tblPOSTotales.Close;
    tblPOSTotales.params[0].Value:= tblPOSVentadetNUMERO.Value;
    tblPOSTotales.Open;
  end else
  if (tblPOSTotales.params[0].Value <> tblPOSVentadetNUMERO.Value) then
  begin
    tblPOSTotales.Close;
    tblPOSTotales.params[0].Value:= tblPOSVentadetNUMERO.Value;
    tblPOSTotales.Open;  
  end;
    if tblPOSTotales.state = dsbrowse then
    tblPOSTotales.edit;

    tblPOSTotalesSUBTOTAL.Value:=
    tblPOSVentadetMONBTOBRUTOCLD.Value;

    tblPOSTotalesMONTODESCITEMS.Value:=
    tblPOSVentadetMONTODESCITEMCLD.Value;

    if not tblPOSVentadetITBIS_TOTAL.IsNull then
    tblPOSTotalesITBIS.Value:= tblPOSVentadetITBIS_TOTAL.Value;

    if (tblPOSTotalesMONTOEXONERAITBIS.Value > 0) then
    tblPOSTotalesMONTOEXONERAITBIS.Value:=tblPOSVentadetITBIS_TOTAL.Value;
    GlbSalvarQuery(tblPOSTotales);
    dmCalculos.PosSumatotal;
    tblPOSTotales.Close;
    tblPOSTotales.Open;
  //end;
  //else

  if procCalC then
  begin
    qryPROC_POSRecalcVtaDet.close;
    //if tblPOSTotalesPorcDesAdicional.Value > 0 then
    //begin
    //  qryPROC_POSRecalcVtaDet.Params[0].Value:=2;
    //  qryPROC_POSRecalcVtaDet.Params[1].Value:=tblPosVentaDetNumero.Value;
    //end else
    //begin
    //  qryPROC_POSRecalcVtaDet.Params[0].Value:=1;
      qryPROC_POSRecalcVtaDet.Params[0].Value:=tblPosVentaDetNumero.Value;
    //end;
    qryPROC_POSRecalcVtaDet.Open;
    procCalC:=false;
  end;

  tblPOSTotales.Refresh;
  //1-Desc Nivel Item
  //2-Desc Global

  //'Select sum(r.ITBIS_TOTAL) ITBI_Total From Proc_CalcPosDet(:tipo, 11) r');
  if GlbNumeroSerie > 0 then
  begin
    RxDBGrid1.DisableScroll;
    tblPOSVentadet.DisableControls;
    tblPOSVentadet.Locate('serie',GlbNumeroSerie,[]);
    tblPOSVentadet.EnableControls;
    RxDBGrid1.EnableScroll;
  end;
end;


procedure TfrmProcVentaRapidaPOS.RxDBLookupCombo3Change(Sender: TObject);
begin
  if not tblPOStotalesTipoNCF.IsNull then
  ProcGetUltNcf(tblPOStotalesTipoNCF.Value);
  NCFCambio:= True;
end;

procedure TfrmProcVentaRapidaPOS.ProcGetUltNcf(tipo: string);
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

procedure TfrmProcVentaRapidaPOS.DBRadioGroup1Enter(Sender: TObject);
begin
  if (tblPOSVentaDet.RecordCount > 0) then
  if tblPOSVentaDet.State In [dsEdit, dsInsert] then
  begin
    tblPOSVentaDet.Edit;
  end;
end;

procedure TfrmProcVentaRapidaPOS.DBRadioGroup1Exit(Sender: TObject);
begin
  if frmProcVentaRapidaPOS.Showing then
  dbedit2.SetFocus;
  dmcalculos.POSProcesaCalculos;
end;

procedure TfrmProcVentaRapidaPOS.CheckBox4Click(Sender: TObject);
begin
  Edit1.Text:='';
  if Not CheckBox4.Checked then
  begin
    tblPOStotales.Edit;
    tblPOSTotalesMONTONOTACREDITO.Value := 0;
    tblPOStotalesMontoNCRAplicado.Value := 0;

    tblPOStotalesDevolucion.Value := 0;
    GlbSalvarQuery(tblPOStotales);

    if tblPOSVentaDet.State In [dsInsert, dsEdit] Then
    begin
      GlbSalvarQuery(tblPOSVentaDet);
      GlbNumeroSerie:= tblPOSVentadetSerie.Value;
    end;
  end else
  if CheckBox4.Checked then
  begin
    tblPOStotales.Edit;
    tblPOStotalesDevolucion.Value := 0;
    GlbSalvarQuery(tblPOStotales);
  end;
end;

procedure TfrmProcVentaRapidaPOS.DBEdit11Change(Sender: TObject);
begin
  if LlenandoDatos then exit;
  GlbAlreadyCld := False;
  procCalC:=true;
  //t BitBtn10Click(Self);
  //t DBEdit5Exit(Self);
end;

procedure TfrmProcVentaRapidaPOS.DBEdit11Enter(Sender: TObject);
begin
  LlenandoDatos:=True;
  entraDessGlb := True;
  if not chKDescuentoGlobal.Checked then
  chKDescuentoGlobal.Checked:= True;
end;

procedure TfrmProcVentaRapidaPOS.DBEdit11Exit(Sender: TObject);
begin
  if entraDessGlb and LlenandoDatos then
  LlenandoDatos:=False;

  GlbAlreadyCld := False;
  GlbSalvarQuery(tblPostotales);
  GlbSalvarQuery(tblPOSVentaDet);
  tblPOSVentaDET.Refresh;
  if tblPostotalesPorcDesAdicional.value > 0 then
  dmcalculos.ProcUpdateDetVta(tblPOSVentadetNUMERO.Value,tblPOSVentaDetSerie.Value,
  'PorcDescItem',0);
  tblPostotales.Refresh;
  tblPOSVentaDET.Refresh;
  tblPOSVentaDET.Edit;

  dmcalculos.POSProcesaCalculos;//tblPOSTotalesMontoDescAdicional.Value
  if entraDessGlb then
  begin
    qryPROC_POSRecalcVtaDet.close;
    qryPROC_POSRecalcVtaDet.Params[0].Value:=tblPosVentaDetNumero.Value;
    qryPROC_POSRecalcVtaDet.Open;
    tblPostotales.Refresh;
    tblPOSVentaDET.Refresh;
  end;
  entraDessGlb:=False;//frmProcVentaRapidaPOS.tblPOSTotalesPorcDesAdicional.Value
  BitBtn10Click(Self);
  DBEdit5Exit(Self);
end;

procedure TfrmProcVentaRapidaPOS.BitBtn10Click(Sender: TObject);
begin
  if (tblPOSVentaDET.RecordCount >  0) then
  begin
    if tblPOSVentasMast.State = dsBrowse then
    begin                              //tblPOSVentaDETnumero.value
      tblPOSVentasMast.Edit;           //tblPOSTotalesnumero.value
      GlbSalvarQuery(tblPOSVentasMast);//tblPOSTotalesTOTALNETO.Value;
    end;
    if tblPOSVentaDET.State = dsBrowse then
    begin
      tblPOSVentaDET.Edit;
      GlbSalvarQuery(tblPOSVentaDET);
    end;    
    if tblPOSTotales.State = dsBrowse then
    begin
      tblPOSTotales.Edit;
      GlbSalvarQuery(tblPOSTotales);
    end;
  end;
end;

procedure TfrmProcVentaRapidaPOS.DBEdit5Exit(Sender: TObject);
begin
  if tblPOSTotales.State in [dsedit, dsinsert] then
  begin
    EsEditando := True;

    if tblPOSTotales.State in [dsedit, dsinsert] then
    GlbSalvarQuery(tblPOSTotales);
  end;
end;

procedure TfrmProcVentaRapidaPOS.DBEdit5Enter(Sender: TObject);
begin
  if tblPOSTotales.State = dsBrowse then
  EsBrowsing := True
  else EsBrowsing:=False;
end;

procedure TfrmProcVentaRapidaPOS.BitBtn29Click(Sender: TObject);
begin
 //
end;

procedure TfrmProcVentaRapidaPOS.BitBtn22Click(Sender: TObject);
begin
 //
end;

procedure TfrmProcVentaRapidaPOS.bitBtnEditarFactClick(Sender: TObject);
var
  numF : integer;
  tRecordsDet : integer;
  flag :boolean;
begin
  esContado:=False;
  if (tblPOSTotalesSubTotal.Value <= 0) then
  begin
    MessageDlg('Total venta no puede ser cero , verifique.', mtError, [mbOk], 0);
    Exit;
  end;
   if not VerificaRecordsVenta then
   begin
     MessageDlg('Debe existir al menos un record activo, verifique.',mtInformation,[mbok],0);
     Exit;
   end;
   if tblPOSVentadet.RecordCount = 0 then
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

    if (tblPOSTotalesTipoNCFIFiscal.Value < 0) then
    begin
      MessageDlg('Verifique tipo NCF', mtError, [mbOk], 0);
      Exit;
    end;

  { if not VerificaLimiteCredito(tblPOSTotalesCodCliente.Value,tblPOSTotalesTotalNeto.Value) then
   begin
     if NoTieneCredito then
     MessageDlg('Cliente no tiene crédito...', mtWarning, [mbOK], 0)
     else
     MessageDlg('Monto contrato excede limite de crédito, depositar diferencia...',mtWarning, [mbOK], 0);
     Exit;
   end;
  }
     if tblPOSVentasMast.State In [dsEdit, dsInsert] then
  tblPOSVentasMast.Post;
  if (tblPOSVentasMast.RecordCount = 0) or (tblPOSVentasMastCODIGO_CTE.Value = 0) then
  begin
    MessageDlg('Favor seleccionar cliente', mtInformation, [mbOK], 0);
    RxDBLookupCombo1.SetFocus;
    BitBtn6.Enabled:=True;
    Exit;
  end;
  bitBtnEditarFact.Enabled:=False;
   qryCliente.Locate('CODIGO_CTE',tblPOSVentasMastCODIGO_CTE.Value,[]);
   if not qryClienteCOD_VENDEDOR.IsNull then
   glbcodVendedor:=qryClienteCOD_VENDEDOR.Value
   else
   glbcodVendedor:= VarUsuarioGlb;

   tblPOSTotales.Edit; 
   tblPOSTotalesNombreCliente.Value := qryClienteNOMBRE_CTE.Value;
   tblPOSTotalesDireccion.Value     := qryClienteDIRECCION_CONT.Value;
   tblPOSTotalesTelefono.Value      := qryClienteTELEF_CONTACTO.Value;
   tblPOSTotalesCodCliente.Value    := qryClienteCODIGO_CTE.Value;
   tblPOSTotalesRNC_NUMERO.Value    := qryClienteRNC_NUMERO.Value;
   if (Not qryClienteCANT_DIAS_CREDITO.IsNull) And (qryClienteCANT_DIAS_CREDITO.Value > 0) Then
   tblPOSTotalesFechaVence.Value    := GlbFechaTrnDiaria + qryClienteCANT_DIAS_CREDITO.Value
   else
   tblPOSTotalesFechaVence.Value    := GlbFechaTrnDiaria + 15;//Default
   tblPOSTotales.Post;

   tblPOSVentadet.First;

  //Actualizar Ventas_Mast con cambios
  ActualizaVentaMaster(dmfactura.qryVentaFacturaFORMA_PAGO.AsString,dmFactura.qryVentaFacturaSERIE_NCF_ASIGNADO.Value);
  tblPOSVentadet.first;
  While Not tblPOSVentadet.Eof do
  begin
    if (tblPOSVentadetStatus.Value = 'C') then
    begin
      //Pendiente
      //Re-Ingresar producto a inventario;
      ibStpActualizaInvProd.Params[0].Value:= tblPOSVentadetCodArticulo.Value;
      if (GlbUsaPUnidadLevel = 1) then
      begin
        ibStpActualizaInvProd.Params[1].Value:= tblPOSVentadetCant.Value * CantUnidad;
      end else
      begin
        if (tblPOSVentadetTipoUnidad.Value = 3) Or (tblPOSVentadetTipoUnidad.Value = 0) then
           ibStpActualizaInvProd.Params[1].Value:= tblPOSVentadetCant.Value
        else
        begin
          ibStpActualizaInvProd.Params[1].Value:= tblPOSVentadetCant.Value * CantUnidad;
        end;
      end;
      //if Not EsDevolucion then
      //ibStpActualizaInvProd.Params[2].Value     := 0//tipoTrn
      //else
      ibStpActualizaInvProd.Params[2].Value:= 1;//0;//Actualiza Inventario
      ibStpActualizaInvProd.Params[3].Value     := 1;//porCodigo
      if (tblPOSVentadetInvetariar.Value <> 0) And (GlbCodDivInventario = 1 ) then
      ibStpActualizaInvProd.ExecProc;
      ActualizaVentaDet;//Elimina record de la tabla ventas_Det
      tblPOSVentadet.Next;
      continue;
    end;// else
    //ActualizaVentaDet;

    if (tblPOSVentadetStatus.Value = 'A') and (dmfactura.qryVentaFacturaDet.Locate('SERIE', tblPOSVentadetSerieOriginal.Value, []))
      and (tblPOSVentadetCant.Value < dmfactura.qryVentaFacturaDetCANTIDAD.Value) then
    begin
      ibStpActualizaInvProd.Params[0].Value:= tblPOSVentadetCodArticulo.Value;
      if (GlbUsaPUnidadLevel = 1) then
      begin
        //ibStpActualizaInvProd.Params[1].Value:= tblPOSVentadetCant.Value * CantUnidad;
        ibStpActualizaInvProd.Params[1].Value:= (dmfactura.qryVentaFacturaDetCANTIDAD.Value - tblPOSVentadetCant.Value) * CantUnidad;
      end else
      if (tblPOSVentadetTipoUnidad.Value = 3) Or (tblPOSVentadetTipoUnidad.Value = 0) then
         ibStpActualizaInvProd.Params[1].Value:=
         dmfactura.qryVentaFacturaDetCANTIDAD.Value - tblPOSVentadetCant.Value
      else
      begin
        ibStpActualizaInvProd.Params[1].Value:= (dmfactura.qryVentaFacturaDetCANTIDAD.Value - tblPOSVentadetCant.Value) * CantUnidad;
      end;
      //if Not EsDevolucion then
      ibStpActualizaInvProd.Params[2].Value     := 1;//tipoTrn
      //else
      //ibStpActualizaInvProd.Params[2].Value:= 1;//ingresar al inventario
      ibStpActualizaInvProd.Params[3].Value     := 1;//porCodigo
      if (tblPOSVentadetInvetariar.Value <> 0) And (GlbCodDivInventario = 1 ) then
         ibStpActualizaInvProd.ExecProc;
    end else
    if (tblPOSVentadetStatus.Value = 'A') and (dmfactura.qryVentaFacturaDet.Locate('SERIE', tblPOSVentadetSerieOriginal.Value, []))
      and (tblPOSVentadetCant.Value > dmfactura.qryVentaFacturaDetCANTIDAD.Value) then
    begin
      ibStpActualizaInvProd.Params[0].Value:= tblPOSVentadetCodArticulo.Value;
      if (GlbUsaPUnidadLevel = 1) then
      begin
        //ibStpActualizaInvProd.Params[1].Value:= tblPOSVentadetCant.Value * CantUnidad;
        ibStpActualizaInvProd.Params[1].Value:= (dmfactura.qryVentaFacturaDetCANTIDAD.Value - tblPOSVentadetCant.Value) * CantUnidad;
      end else
      if (tblPOSVentadetTipoUnidad.Value = 3) Or (tblPOSVentadetTipoUnidad.Value = 0) then
         ibStpActualizaInvProd.Params[1].Value:=
         tblPOSVentadetCant.Value - dmfactura.qryVentaFacturaDetCANTIDAD.Value
      else
      begin
        ibStpActualizaInvProd.Params[1].Value:= (tblPOSVentadetCant.Value - dmfactura.qryVentaFacturaDetCANTIDAD.Value) * CantUnidad;
      end;
      //if Not EsDevolucion then
      ibStpActualizaInvProd.Params[2].Value     := 0;//Disminuye Inventario
      //else
      //ibStpActualizaInvProd.Params[2].Value:= 1;//ingresar al inventario
      ibStpActualizaInvProd.Params[3].Value     := 1;//porCodigo
      if (tblPOSVentadetInvetariar.Value <> 0) And (GlbCodDivInventario = 1 ) then
         ibStpActualizaInvProd.ExecProc;
    end else
    if (tblPOSVentadetStatus.Value = 'I') then
    begin
      ibStpActualizaInvProd.Params[0].Value:= tblPOSVentadetCodArticulo.Value;
      if (GlbUsaPUnidadLevel = 1) then
      begin
        ibStpActualizaInvProd.Params[1].Value:= tblPOSVentadetCant.Value * CantUnidad;
        //ibStpActualizaInvProd.Params[1].Value:= (dmfactura.qryVentaFacturaDetCANTIDAD.Value - tblPOSVentadetCant.Value) * CantUnidad;
      end else
      if (tblPOSVentadetTipoUnidad.Value = 3) Or (tblPOSVentadetTipoUnidad.Value = 0) then
         ibStpActualizaInvProd.Params[1].Value:= tblPOSVentadetCant.Value
      else
      begin
        ibStpActualizaInvProd.Params[1].Value:= tblPOSVentadetCant.Value * CantUnidad;
      end;
      //if Not EsDevolucion then
      ibStpActualizaInvProd.Params[2].Value     := 0;//Add to inventario
      //else
      //ibStpActualizaInvProd.Params[2].Value:= 1;//ingresar al inventario
      ibStpActualizaInvProd.Params[3].Value     := 1;//porCodigo
      if (tblPOSVentadetInvetariar.Value <> 0) And (GlbCodDivInventario = 1 ) then
         ibStpActualizaInvProd.ExecProc;
    end;    
    ActualizaVentaDet;
    try
    ActualizaInvAlmacen;//Actualiza Division Inventario
    except
    end;
    tblPOSVentadet.Next;
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
  //tblPOSTotales.EmptyTable;
  //tblPOSTotales.Close;
  //tblPOSTotales.Open;

  tblPOSVentadet.Close;
  tblPOSVentadet.Open;
  tblPOSVentasMast.Close;
  tblPOSVentasMast.Open;
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
      //frmConsultaFacturas.edtCodCte.SetInteger(tblPOSVentasMastCODIGO_CTE.Value);
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
            tblPOSVentadet.DisableControls;
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
            tblPOSVentadet.EnableControls;
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
  tblPOSTotales.Close;
  tblPOSTotales.Open;

  Refresh;
  numerodocReimp := -1;

  Application.ProcessMessages;
end;

procedure TfrmProcVentaRapidaPOS.BitBtn8Click(Sender: TObject);
begin
   if tblPOSVentadet.RecordCount = 0 then
   begin
     MessageDlg('No puedes guardar sin detalle, verifique.',mtInformation,[mbok],0);
     Exit;
   end;
   if not VerificaRecordsVenta then
   begin
     MessageDlg('Debe existir al menos un record activo, verifique.',mtInformation,[mbok],0);
     Exit;
   end;    
   if tblPOSVentasMast.State In [dsEdit, dsInsert] then
   tblPOSVentasMast.Post;
   if (tblPOSVentasMast.RecordCount = 0) or (tblPOSVentasMastCodigo_cte.Value = 0) then
   begin
     MessageDlg('Favor seleccionar cliente', mtInformation, [mbOK], 0);
     RxDBLookupCombo1.SetFocus;
     BitBtn6.Enabled:=True;
     Exit;
   end;
   if Not tblPOSVentadetNumeroCotiza.IsNull then
   begin
     GlbUsandoCotiza:=False;

     if ((tblPOSVentadetCantPax.Value > 0) or (UpperCase(GLBFormatoFactura) = 'BYMSERVICIOS'))
        And (Edit1.Text = '') then
     begin
       MessageDlg('Indique monto Depósito o entre valor 0(cero)',mtInformation,[mbYes, mbNo],0);
       Edit1.SetFocus;
     end;
     if MessageDlg('Mantener número cotización?', mtInformation,[mbYes, mbNo], 0)=mrYes then
     begin
       ActualizaCotizacionMaster;
       tblPOSVentadet.First;
       RxDBGrid1.DisableScroll;
       While Not tblPOSVentadet.Eof Do
       begin
         if (tblPOSVentadetStatus.Value = 'C') then
         begin
           //if ibsqlDeleteSerieCotizaDet.Open then
           //ibsqlDeleteSerieCotizaDet.Close;
           ibsqlDeleteSerieCotizaDet.Params[0].Value:=tblPOSVentadetSerie.Value;
           ibsqlDeleteSerieCotizaDet.Params[1].Value:=tblPOSVentadetNumeroCotiza.Value;
           ibsqlDeleteSerieCotizaDet.ExecQuery;
         end else
        if (tblPOSVentadetStatus.Value = 'I') then
        InsertarCotizacionDet(_NumeroCotiza)
        else
        InsertarCotizacionDetUpd(ibstpUpdateCotizaMaster.Params[33].Value,
        tblPOSVentadetSerie.Value);
        tblPOSVentadet.Next;
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
  dmCalculos.ProcDeleteDetVta(tblPOSVentadetNUMERO.Value);
  tblPOSVentadet.Close;
  tblPOSVentadet.Open;
  Edit1.Text      := '';
  edtCodigo.Text  := '';
  pesoProd := '';
  BitBtn4.Enabled := False;
  if isShowing then
  BitBtn1.SetFocus;
  dmCalculos.ProcDeleteVtaMaster(tblPOSVentadetNUMERO.Value);
  //tblPOSVentasMast.Edit;
  //tblPOSVentasMastCodigo_cte.AsVariant := null;
  //blPOSVentasMast.Post;
  if isShowing then  
  edtCodigo.SetFocus;
  edtObservacion.Text := '';
  xCodigoCte:=0;
  //ActualizarRecoverData;
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

  if (tblPOSVentasMastCodigo_cte.IsNull) then
  begin
    MessageDlg('Antes debe indicar el cliente, verifique.', mtInformation, [mbOK], 0);
    Exit;
  end;
  if (rdgFactServicio.Checked and rdgFactVentaProducto.Checked)
  And (tblPOSVentadet.RecordCount > 0) then
  begin
    MessageDlg('Favor indicar tipo de Operacion', mtInformation, [mbOK], 0);
    rdgFactServicio.SetFocus;
    exit;
  end;
//tj   if Not Entro And GlbPermiteCambioPrecio then
//tj   begin
//tj     BitBtn10Click(Self);
//tj     tblPOSVentadetPrecio.Value:= rxqryInvPRECIO.Value;
//tj     DBEdit5Exit(Self);
//tj   end;
        if (xCodigoCte =0) And (tblPOSVentasMastCodigo_cte.Value > 0) then
        xCodigoCte := tblPOSVentasMastCodigo_cte.Value;

        if tblPOSTotales.State = dsbrowse then tblPOSTotales.Edit;
        tblPOSTotalesCodCliente.Value:= xCodigoCte;
        if xCodigoCte > 0 then
        begin
          qryCliente.Locate('CODIGO_CTE', xCodigoCte,[]);
          tblPOSTotalesNombreCliente.Value := qryClienteNOMBRE_CTE.Value;
          tblPOSTotalesDireccion.Value     := qryClienteDIRECCION_CONT.Value;
          tblPOSTotalesTelefono.Value      := qryClienteTELEF_CONTACTO.Value;
          tblPOSTotalesCodCliente.Value    := qryClienteCODIGO_CTE.Value;
          tblPOSTotalesRNC_NUMERO.Value    := qryClienteRNC_NUMERO.Value;
          GlbSalvarQuery(tblPOSTotales);
        end;

  CheckBox1.Checked := True;
  ipStpInsertCotizaMast.Params[1].Value:= GlbFechaTrnDiaria;
  ipStpInsertCotizaMast.Params[2].Value:= GlbFechaTrnDiaria+30;//fecha vence
  if qryClienteCOD_VENDEDOR.Value > 0 then
  GlbcodVendedor:= qryClienteCOD_VENDEDOR.Value
  else
  GlbcodVendedor:= VarUsuarioGlb;
  if not tblPOSVentasMastCodigo_cte.IsNull then
  ipStpInsertCotizaMast.Params[3].Value:= tblPOSVentasMastCodigo_cte.Value
  else
  ipStpInsertCotizaMast.Params[3].Value:= 0;//codigo cliente generico mientras tanto
  if (GlbcodVendedor > 0) then
  ipStpInsertCotizaMast.Params[4].Value:= GlbcodVendedor else
  ipStpInsertCotizaMast.Params[4].Value:= VarUsuarioGlb;
  ipStpInsertCotizaMast.Params[5].Value:= 'Cotizacion';
  if not tblPOSTotalesMoneda.isNull then
  ipStpInsertCotizaMast.Params[6].Value:=  tblPOSTotalesMoneda.Value
  else
  ipStpInsertCotizaMast.Params[6].Value:=  '1';
  ipStpInsertCotizaMast.Params[7].Value:= tblPOSTotalestotalneto.Value;//EditN1.Text;
  ipStpInsertCotizaMast.Params[8].Value   := 'A';
  ipStpInsertCotizaMast.Params[9].Value   := Now;
  ipStpInsertCotizaMast.Params[10].AsString := Trim(StrUserName);
  ipStpInsertCotizaMast.Params[11].Value    := Null;
  ipStpInsertCotizaMast.Params[12].Value    := Null;
  ipStpInsertCotizaMast.Params[13].Value    := null;
  ipStpInsertCotizaMast.Params[14].Value    := null;
  ipStpInsertCotizaMast.Params[15].Value    := null;
  ipStpInsertCotizaMast.Params[16].Value    := tblPOSTotalesSubTotal.Value;
  ipStpInsertCotizaMast.Params[17].Value    := tblPOSTotalesPorcDesAdicional.Value;
  if tblPOSTotalesMontoDescAdicional.Value > 0 then
  ipStpInsertCotizaMast.Params[18].Value    := tblPOSTotalesMontoDescAdicional.Value
  else
  ipStpInsertCotizaMast.Params[18].Value    := tblPOSTotalesMontoDescItems.Value;

  if ((tblPOSVentadetCantPax.Value >0) or (UpperCase(GLBFormatoFactura) = 'BYMSERVICIOS'))
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
  ipStpInsertCotizaMast.Params[23].Value    := tblPOSTotalesitbis.Value;//montototalitbis
  ipStpInsertCotizaMast.Params[24].Value    := tblPOSTotalesMontoDescGastosAdmin.Value;
  ipStpInsertCotizaMast.Params[25].Value    := tblPOSTotalesMontoDescItbisGastosAdmin.Value;
  ipStpInsertCotizaMast.Params[26].Value    := tblPOSTotalesMontoDescTransp.Value;
  ipStpInsertCotizaMast.Params[27].Value    := tblPOSTotalesMontoDescDirtecnica.Value;
  ipStpInsertCotizaMast.Params[28].Value    := tblPOSTotalesMontoDescItbisDirTecnica.Value;
  ipStpInsertCotizaMast.Params[29].Value    := tblPOSTotalesMontoDescImprevisto.Value;
  ipStpInsertCotizaMast.Params[30].Value    := tblPOSTotalesMontoDescItbisImprevisto.Value;

  if rdgFactServicio.Checked then
  ipStpInsertCotizaMast.Params[31].Value     := 0 //Tipo_factura
  else ipStpInsertCotizaMast.Params[31].Value:= 1;

  ipStpInsertCotizaMast.Params[32].Value     := null;
  if CheckBox2.Checked then
  ipStpInsertCotizaMast.Params[32].Value     := 1 //aplica_tipodesc
  else
  if CheckBox3.Checked then
  ipStpInsertCotizaMast.Params[32].Value     := 2;
  
  ipStpInsertCotizaMast.Params[33].Value := tblPOSTotalesComentario.AsVariant;
  ipStpInsertCotizaMast.Params[34].Value     := tblPOSTotalesReferenciaCte.Value;
  ipStpInsertCotizaMast.Params[35].Value     := tblPOSTotalesRecargo.Value;
  ipStpInsertCotizaMast.Params[36].Value     := tblPOSTotalesTIPONCFIFiscal.Value;
  ipStpInsertCotizaMast.Params[37].Value     := tblPOSTotalesMontoExoneraITBIS.Value;
  ipStpInsertCotizaMast.Params[38].Value     := GlbPorcPropina;
  ipStpInsertCotizaMast.Params[39].Value     := tblPOSTotalesPropina.Value;
  ipStpInsertCotizaMast.Params[40].Value     := tblPOSTotalesPropinaLegal.Value;
  ipStpInsertCotizaMast.ExecProc;

  if Not ipStpInsertCotizaMast.Transaction.InTransaction then
  ipStpInsertCotizaMast.Transaction.StartTransaction;
  try
    ipStpInsertCotizaMast.Transaction.CommitRetaining;
  except
  ipStpInsertCotizaMast.Transaction.RollbackRetaining;
  end;

  dmfactura.ibstpInsertarPorcOtrosCargosCotiza.Params[0].Value:= ipStpInsertCotizaMast.Params[0].Value;
  dmfactura.ibstpInsertarPorcOtrosCargosCotiza.Params[1].Value:= tblPOSTotalesTPorcGAdmin.Value;
  dmfactura.ibstpInsertarPorcOtrosCargosCotiza.Params[2].Value:= tblPOSTotalesTPorcItbisGAdmin.Value;
  dmfactura.ibstpInsertarPorcOtrosCargosCotiza.Params[3].Value:= tblPOSTotalesTPorcTrans.Value;
  dmfactura.ibstpInsertarPorcOtrosCargosCotiza.Params[4].Value:= tblPOSTotalesTPorcDirTec.Value;
  dmfactura.ibstpInsertarPorcOtrosCargosCotiza.Params[5].Value:= tblPOSTotalesTPorcItbisDirTec.Value;
  dmfactura.ibstpInsertarPorcOtrosCargosCotiza.Params[6].Value:= tblPOSTotalesTPorcImprevisto.Value;
  dmfactura.ibstpInsertarPorcOtrosCargosCotiza.Params[7].Value:= tblPOSTotalesTPorcItbisImprevisto.Value;
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

  tblPOSVentadet.DisableControls;
  tblPOSVentadet.First;
  tblPOSVentadet.RecordCount;
  While Not tblPOSVentadet.Eof Do
  begin
    if (tblPOSVentadetStatus.Value = 'C') then
    begin
      tblPOSVentadet.Next;
      continue;
    end;
    InsertarCotizacionDet(ipStpInsertCotizaMast.Params[0].Value);
    tblPOSVentadet.Next;
  end;

  //tblPOSVentadet.First;
  //RxDBGrid1.DisableScroll;
  {pos exito While Not tblPOSVentadet.Eof Do
  begin
    tblPOSVentadet.Edit;
    tblPOSVentadetNumeroRecibo.Value := ipStpInsertCotizaMast.Params[0].Value;
    tblPOSVentadet.Post;
    //WriteToLog('Post tblPOSVentadet - Line 3221');
    tblPOSVentadet.Next;
  end;
  }
  //tblPOSVentadet.EnableControls;
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
  //tblPOSVentadet.EmptyTable;
  dmCalculos.ProcDeleteDetVta(tblPOSVentadetNUMERO.Value);
  tblPOSVentadet.Close;
  tblPOSVentadet.Open;  
  Edit1.Text    := '';
  edtCodigo.Text := '';
  pesoProd := '';
  BitBtn4.Enabled := False;
  if isShowing then
  BitBtn1.SetFocus;
  //Totales.EmptyTable;
  dmcalculos.ProcDeleteVtaMaster(tblPOSVentasMastNumero.Value);
  //tblPOSVentasMast.Edit;
  //tblPOSVentasMastCodigo_cte.AsVariant := null;
  //tblPOSVentasMast.Post;
  if isShowing then  
  edtCodigo.SetFocus;
  edtObservacion.Text := '';
  xCodigoCte:=0;
  //ActualizarRecoverData;
  qryProdPorProveedor.Close;
  pnlPrecioProv.Visible:=False;
  _NumeroCotiza := -1;
  EsModificandoCotiza := False;
  Label6.Refresh;
  Refresh;
  Application.ProcessMessages;
end;

procedure TfrmProcVentaRapidaPOS.chkNoLeyPropinaClick(Sender: TObject);
begin
  if chkNoLeyPropina.Checked then
  begin
    BitBtn27Click(Self);
  end;
end;

procedure TfrmProcVentaRapidaPOS.cboxTipoUnidadChange(Sender: TObject);
var
  xflag:boolean;
begin
  if tblPOSVentadet.State In [dsBrowse] Then
  tblPOSVentadet.Edit;
  xflag:=False;
  dmVentas.qryPrecioUnidadSurt.Close;
  dmVentas.qryPrecioUnidadSurt.Params[0].Value:=tblPOSVentadetCodArticulo.Value;
  dmVentas.qryPrecioUnidadSurt.Open;

  xflag:=True;
  if GlbUsaPUnidadLevel = 1 then
  if not dmVentas.qryPrecioUnidadSurt.Locate('COD_PRODUCTO;DESCRIPCION',
  VarArrayOf([tblPOSVentadetCodArticulo.Value,cboxTipoUnidad.Text]),[]) then
  begin
    MessageDlg('Unidad no encontrada, verifique.', mtError, [mbOk], 0);
    xflag:=False;
  end else
  begin
    GlbTipoUnidad := dmVentas.qryPrecioUnidadSurtIDUNIDAD.Value;
    CantUnidad:= dmVentas.qryPrecioUnidadSurtCANTIDAD.Value;
    tblPOSVentadetTipoUnidad.Value:= GlbTipoUnidad;
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
    tblPOSVentadetTipoUnidad.Value:= GlbTipoUnidad;
  end;

  if xFlag then;
  begin
    if not qryProductoscodigo.Isnull And (Not PrecioCambio ) then
    begin
      if GlbUsaPUnidadLevel = 1 then
      begin
        SetPrecioPorCantidad;
      end else
      begin
        if (GlbUsaEscalaPrecio = 0) and (GlbTipoUnidad <> 3) then
        tblPOSVentadetPrecio.Value  := precioXUnidad(GlbTipoUnidad, qryProductoscodigo.value); //qryProductosPRECIO_TIPO_UNIDAD.Value;
        if (tblPOSVentadetprecio.Value = 0) And (Not PrecioCambio )then
        begin
          if (GlbUsaescalaPrecio = 1) And (Not GlbUsandoCotiza Or ( tblPOSVentadetStatus.Value = 'I') ) then
          begin
            SetPrecioPorCantidad;//case
          end;
        end;
      end;
    end;
  end;

  if tblPOSVentadet.State In [dsBrowse] Then
  tblPOSVentadet.Edit;

  tblPOSVentadetDescUnidadMedida.Value:=cboxTipoUnidad.Text;

  if tblPOSVentadet.State In [dsInsert, dsEdit] Then
  GlbSalvarQuery(tblPOSVentadet);
  //tblPOSVentadet.Post;
end;

procedure TfrmProcVentaRapidaPOS.cboxTipoUnidadEnter(Sender: TObject);
begin
  panel2.Visible := False;
  if (not tblPOSVentadetCodArticulo.IsNull) then
  if (GlbUsaPUnidadLevel = 1) then
  begin
    dminventario.qryTipoUnidad.Filtered:=False;
    dmInventario.xcodProducto := tblPOSVentadetCodArticulo.AsInteger;
    dminventario.qryTipoUnidad.Filtered:=True;
    cboxTipoUnidad.Clear;
    While Not dmInventario.qryTipoUnidad.Eof Do
    begin
      cboxTipoUnidad.Items.Add(dmInventario.qryTipoUnidadDESCRIPCION.Value);
      dmInventario.qryTipoUnidad.Next;
    end;
  end;
end;

procedure TfrmProcVentaRapidaPOS.cboxTipoUnidadExit(Sender: TObject);
begin
  if tblPOSVentadetCodTexto.IsNull then Exit;
  if tblPOSVentadetDescUnidadMedida.isNull or (tblPOSVentadetDescUnidadMedida.Value = '') then
  begin
    if tblPOSVentadet.State = dsBrowse then tblPOSVentadet.Edit;
    tblPOSVentadetDescUnidadMedida.Value:=cboxTipoUnidad.Text;
  end;
  cboxTipoUnidadChange(Self);
  if tblPOSVentadet.State = dsBrowse then tblPOSVentadet.Edit;

  //if (GlbTipoUnidad = 0) then GlbTipoUnidad= 1;

  if tblPOSVentadet.State In [dsedit,dsInsert] then
  tblPOSVentadetTipoUnidad.Value:=GlbTipoUnidad;
  panel2.Visible := False;
  dmcalculos.POSProcesaCalculos;
end;

procedure TfrmProcVentaRapidaPOS.dbFechaCotizacionClick(Sender: TObject);
begin
  tblPOSVentasMast.Edit;
end;

procedure TfrmProcVentaRapidaPOS.dbFechaCotizacionEnter(Sender: TObject);
begin
  tblPOSVentasMast.Edit;
end;

procedure TfrmProcVentaRapidaPOS.dbFechaCotizacionExit(Sender: TObject);
begin
  if tblPOSVentasMast.State in [dsEdit] then
  tblPOSVentasMast.Post;
end;

procedure TfrmProcVentaRapidaPOS.Button2Click(Sender: TObject);
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
    frmPagosCombinados.rxCobrostotalNeto.Value:=tblPOSTotalestotalneto.Value;
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
  if frmProcVentaRapidaPOS.showing then
  Edit1.SetFocus;
  BitBtn2Click(Self);
  Edit1Exit(Self);
  if frmProcVentaRapidaPOS.showing then
  if frmProcVentaRapidaPOS.BitBtn4.Enabled then
  frmProcVentaRapidaPOS.BitBtn4.SetFocus;
end;

procedure TfrmProcVentaRapidaPOS.BitBtn20Click(Sender: TObject);
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

procedure TfrmProcVentaRapidaPOS.VerificaSiExisteVta;
begin
  qryPosCtrlSecuencia.Close;
  qryPosCtrlSecuencia.Params[0].Value:=VarUsuarioGlb;
  qryPosCtrlSecuencia.Params[1].Value:=ExtraerFecha(GlbFechaTrnDiaria);
  qryPosCtrlSecuencia.Open;
  qryPosCtrlSecuencia.First;

  //si no existe en pos_venta_det salir
  if qryPosCtrlSecuenciaNUMERO_TRN_DET.IsNull then exit;

  if qryPosCtrlSecuencia.RecordCount = 1 then
  begin
    tblPOSVentasMast.Close;
    tblPOSVentasMast.Params[0].Value:= qryPosCtrlSecuenciaNUMERO.Value;
    tblPOSVentasMast.Open;

    tblPOSVentadet.Close;
    tblPOSVentadet.Params[0].Value:= qryPosCtrlSecuenciaNUMERO.Value;
    tblPOSVentadet.Open;tblPOSVentadet.recordCount
  end;
  if tblPOSTotales.State = dsInactive then
  POSTotales_Data;
  dmCalculos.POSTotalesIni(tblPOSVentasMast.Params[0].Value);

end;

procedure TfrmProcVentaRapidaPOS.tblPOSVentadetAfterDelete(
  DataSet: TDataSet);
begin
// Proc_POSEjecutaCalculosDet
end;

procedure TfrmProcVentaRapidaPOS.DBEdit1Change(Sender: TObject);
begin
  if tblPOSVentadet.state in [dsEdit, dsInsert] then
  begin
    tblPOSVentadetMontoBruto.Value:= tblPOSVentadetCant.Value * tblPOSVentadetPrecio.Value;
    if (tblPOSVentadetCantPax.Value > 0) then
    tblPOSVentadetMontoBruto.Value:= (tblPOSVentadetCant.Value * tblPOSVentadetPrecio.Value) *
    tblPOSVentadetCantPax.Value;
    procCalC:=true;
  end;
end;

procedure TfrmProcVentaRapidaPOS.DBEdit2Change(Sender: TObject);
begin
  DBEdit1Change(Self);
  procCalC:=true;
end;
                
procedure TfrmProcVentaRapidaPOS.ProcGuardarDetalle;
begin
  if tblPOSVentadetPRECIO.IsNull or
     tblPOSVentadetMONTOBRUTO.IsNull or
     tblPOSVentadetCANT.IsNull then exit; 
  if tblPOSVentaDet.State in [dsEdit, dsInsert] then
  begin
    if tblPOSVentadetStatus.isnull then
    tblPOSVentadetStatus.value:='A';
    if not tblPOSVentaDet.Transaction.InTransaction then
    tblPOSVentaDet.Transaction.CommitRetaining;
    tblPOSVentaDet.Post;
    tblPOSVentaDet.ApplyUpdates;
    try
      tblPOSVentaDet.Transaction.CommitRetaining;
    except
    tblPOSVentaDet.Transaction.RollbackRetaining;
    end;
    tblPOSVentaDet.Refresh;
  end;
end;

procedure TfrmProcVentaRapidaPOS.RxDBLookupCombo5Exit(Sender: TObject);
begin
  dmcalculos.POSProcesaCalculos;
end;

procedure TfrmProcVentaRapidaPOS.tblPOSTotalesCalcFields(
  DataSet: TDataSet);
begin
  try

  tblPOSTotalesMontoSubTotalIndirectos.Value  :=
  tblPOSTotalesMontoDescGastosAdmin.Value  +
  tblPOSTotalesMontoDescItbisGastosAdmin.Value +
  tblPOSTotalesMontoDescTransp.Value   +
  tblPOSTotalesMontoDescDirtecnica.Value +
  tblPOSTotalesMontoDescItbisDirTecnica.Value +
  tblPOSTotalesMontoDescImprevisto.Value      +
  tblPOSTotalesMontoDescItbisImprevisto.Value;

  if (tblPOSTotalesMontoEnEfectivo.Value = 0) and
  (tblPOSTotalesMontoEnTarjeta.Value  = 0) and
  (tblPOSTotalesMontoEnCheque.Value  = 0) and
  (tblPOSTotalesMontoEnBonos.Value  = 0) and
  (tblPOSTotalesMontoNCRAplicado.Value = 0) then
  tblPOSTotalesDifereciaCldo.AsVariant := null
  else 
  tblPOSTotalesDifereciaCldo.Value:=
  tblPOSTotalestotalneto.Value -
  (tblPOSTotalesMontoEnEfectivo.Value +
  tblPOSTotalesMontoEnTarjeta.Value +
  tblPOSTotalesMontoEnCheque.Value +
  tblPOSTotalesMontoEnBonos.Value +
  tblPOSTotalesMontoNCRAplicado.Value
  );
  except
  end;

end;

procedure TfrmProcVentaRapidaPOS.tblPOSTotalesAfterScroll(
  DataSet: TDataSet);
begin
  if tblPOSTotales.State = dsInactive then exit;
 if (tblPOSTotalesMoneda.Value = '') then Exit;
  PAbrirtablaMoneda(tblPOSTotalesMoneda.Value,GlbFechaTrnDiaria);

  tblPOSTotalestotalneto.DisplayFormat:=Concat(SimboloMoneda(tblPOSTotalesMoneda.Value),',0.00');
end;

procedure TfrmProcVentaRapidaPOS.CheckBox1Click(Sender: TObject);
begin
  if Not CheckBox1.Checked then
  begin
    if (tblPOSTotales.State = dsBrowse) then
    tblPOSTotales.Edit;
    tblPOSTotalesTipoNCFIFiscal.AsVariant := Null;

    tblPOSTotalesTipoNCF.AsVariant := Null;
    if (tblPOSTotales.State In [dsEdit, dsInsert]) then
    GlbSalvarQuery(tblPOSTotales);
  end;
end;

procedure TfrmProcVentaRapidaPOS.tblPOSTotalesBeforePost(
  DataSet: TDataSet);
begin
  if tblPOSVentasMastNumero.IsNull then
  begin
    if tblPOSVentasMast.State = dsInactive then
    tblPOSVentasMast.Open;

    if tblPOSVentasMast.State = dsBrowse then
    tblPOSVentasMast.Edit;

    tblPOSVentasMastNumero.Value:= GetNumSecuenciaVta(VarUsuarioGlb,ExtraerFecha(GlbFechaTrnDiaria));
  end;
  if qryTotalTbis.params[0].IsNull then
  begin
    qryTotalTbis.params[0].Value := tblPOSTotalesNumero.Value;
  end;
  if qryTotalTbis.State = dsBrowse then
  qryTotalTbis.Close;
  qryTotalTbis.Open;
  if tblPOSTotales.State in [dsEdit] then
  if tblPOSVentadet.RecordCount > 0 then
  tblPOSTotalesITBIS.Value:= qryTotalTbisITBI_TOTAL.Value;

  if tblPOSTotales.State in [dsInsert,dsEdit] then
  begin
    if tblPOSTotales.State in [dsInsert] then
    begin
      if tblPOSTotalesNumero.IsNull then
      begin
      tblPOSTotalesNumero.Value := tblPosVentasMastNumero.Value;
      tblPOSTotalesFECHA.Value  := tblPOSVentasMastFECHA.Value;
      end;
    end;
    if tblPOSTotalesTIPONCF.IsNull then
    AsignaNCFCFinal;
    ProcNCFExoNCFVisible;
   end;
   PosDescItemGlb;
   if (tblPOSTotalesSUBTOTAL.Value < tblPOSVentadetMONTOBRUTO.Value)
      and (tblPOSVentadet.RecordCount = 1) then
   begin
     MessageDlg('Error en calculo',mterror,[mbok],0);
   end;
   if (tblPOSTotalesPorcDesAdicional.Value > 0) then
   if tblPOSTotalesMontoDescAdicional.IsNull or (tblPOSTotalesMontoDescAdicional.Value = 0) then
   tblPOSTotalesMontoDescAdicional.Value:=
   tblPOSTotalesSUBTOTAL.Value * tblPOSTotalesPorcDesAdicional.Value/100;
end;

procedure TfrmProcVentaRapidaPOS.chKDescuentoGlobalClick(Sender: TObject);
var
  guardarRec : TBookMark;
  nstr : integer;
begin
  PosDescItemGlb;  
  exit;
  if tblPOSTotalesPorcDesAdicional.IsNull then
  begin
    DBEdit11.Visible:= True;
    tblPOSTotales.Edit;
    DBEdit11.SetFocus;
    DBEdit11.SelectAll;
    Exit;
  end;

  tblPOSTotales.AutoCalcFields:=False;
  if chKDescuentoGlobal.Checked then
  begin
     Label44.Caption := 'Monto Desc. Global';
     DBText4.Visible    := True;
     DBText4.BringToFront;
     Label47.Visible := True;
     DBEdit11.Visible:= True;
     GlbSalvarQuery(tblPOSVentaDET);
     guardarRec:= tblPOSVentaDet.GetBookmark;
     tblPOSVentaDet.First;
     sumarDatos := False;
     //tblPosVentaDet.DisableControls;
     //RxDBGrid1.DisableScroll;
     {
     While Not tblPOSVentaDet.Eof do
     begin
       tblPOSVentaDet.Edit;
       tblPOSVentaDetPorcDescItem.Value := 0;
       tblPOSVentaDet.Post;
       tblPOSVentaDet.Next;
     end;
     }
    tblPOSVentaDET.Refresh;
    dmcalculos.ProcUpdateDetVta(tblPOSVentadetNUMERO.Value,tblPOSVentaDetSerie.Value,'PorcDescItem',0);

    tblPOSVentaDET.Refresh;

     sumarDatos := True;
     GlbSalvarQuery(tblPOSVentaDet);

     tblPOSVentaDet.GotoBookmark(guardarRec);
     tblPOSVentaDet.FreeBookmark(guardarRec);
     tblPOSVentaDet.EnableControls;
     DBEdit9.Enabled := false;
     DBEdit11.Visible:= True;
     DBEdit11.SetFocus;
  end else
  begin
    tblPOSTotales.Edit;
    tblPOSTotalesPorcDesAdicional.Value:=0;
    if tblPOSTotales.State = dsEdit then
    GlbSalvarQuery(tblPOSTotales);
    DBEdit9.Enabled := True;
    DBEdit9.Enabled := True;
    Label47.Visible := False;
    DBEdit11.Visible:= False;
    Label44.Caption := 'Monto Desc. Items';
    DBText4.Visible:=False;
    DBText4.SendToBack;
  end;
  tblPOSTotales.AutoCalcFields:=True;
  tblPOSTotales.Refresh;
  //Refresh;
  DBEdit10Exit(Self);
  nstr:= tblposventadetnumero.Value;
  //if not chKDescuentoGlobal.Checked then
  //begin
    qryPROC_POSRecalcVtaDet.close;
    //if tblPOSTotalesPorcDesAdicional.Value > 0 then
    //begin
      //qryPROC_POSRecalcVtaDet.Params[0].Value:=2;
    //  qryPROC_POSRecalcVtaDet.Params[0].Value:=tblPosVentaDetNumero.Value;
    //end else
    //begin
      //qryPROC_POSRecalcVtaDet.Params[0].Value:=1;
    qryPROC_POSRecalcVtaDet.Params[0].Value:=tblPosVentaDetNumero.Value;
    //end;
    //exito temporal qryPROC_POSRecalcVtaDet.Open;
    tblPostotales.Refresh;
    tblPOSVentaDET.Close;
    tblPOSVentaDET.open;
    tblPOSVentaDET.Locate('numero',nstr,[]);
    tblPOSVentaDET.Refresh;
  //end;
  //Refresh;
end;

procedure TfrmProcVentaRapidaPOS.tblPOSVentadetBeforePost(
  DataSet: TDataSet);
begin
  if tblPOSVentadetFecha.IsNull then exit;
  if tblPOSVentasMastNUMERO.IsNull then
  if tblPOSVentasMast.State = dsBrowse then
  begin
    tblPOSVentasMast.Edit;
    tblPOSVentasMastNUMERO.Value := GetNumSecuenciaVta(VarUsuarioGlb,ExtraerFecha(GlbFechaTrnDiaria));
  end;
  if tblPOSVentadetNUMERO.IsNull then
  tblPOSVentadetNUMERO.Value := tblPOSVentasMastNUMERO.Value;
  tblPOSVentadetMontoBruto.Value:= tblPOSVentadetCant.Value * tblPOSVentadetPrecio.Value;
  if (tblPOSVentadetCantPax.Value > 0) then
  tblPOSVentadetMontoBruto.Value:= (tblPOSVentadetCant.Value * tblPOSVentadetPrecio.Value) *
  tblPOSVentadetCantPax.Value;
end;

procedure TfrmProcVentaRapidaPOS.BitBtn28Click(Sender: TObject);
begin
  if Not Assigned(frmTemporalFormPOS) then
  frmTemporalFormPOS:=TfrmTemporalFormPOS.Create(Nil);

  if Assigned(frmTemporalFormPOS) then
  frmTemporalFormPOS.Show;
end;

procedure TfrmProcVentaRapidaPOS.PosDescItemGlb;
begin
  if chKDescuentoGlobal.Checked or (tblPOSTotalesPorcDesAdicional.Value > 0) then
  begin
     Label44.Caption := 'Monto Desc. Global';
     DBText4.Visible    := True;
     DBText4.BringToFront;
     Label47.Visible := True;
     DBEdit11.Visible:= True;
     sumarDatos := False;
     DBEdit9.Enabled := false;

  end else
  begin
    DBEdit9.Enabled := True;
    Label47.Visible := False;
    DBEdit11.Visible:= False;
    Label44.Caption := 'Monto Desc. Items';
    DBText4.Visible:=False;
    DBText4.SendToBack;
  end;
end;

procedure TfrmProcVentaRapidaPOS.tblPOSVentadetAfterScroll(
  DataSet: TDataSet);
begin
  //PosDescItemGlb;
end;

procedure TfrmProcVentaRapidaPOS.DescargaNotaCredito;
var
  resto : Currency;
begin
  if (tblPOSTotalesMontoNCRAplicado.Value > 0) then
  begin
    dmDatos.tblDevolucionAbierta.First;
    resto:=tblPOSTotalesMontoNCRAplicado.Value;
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

procedure TfrmProcVentaRapidaPOS.CrearNCreditoEnDevolucion;
begin
  exit;//de forma temporal hasta que analice bien
  frmTransCxcProc_R:=TfrmTransCxcProc_R.Create(Nil);
  try
    frmTransCxcProc_R.CodCte := FrmBuscarClientesPersonas.CodigoCliente;
    frmTransCxcProc_R.Pagecontrol1.ActivePage := frmTransCxcProc_R.TabSheet1;
    frmTransCxcProc_R.Pagecontrol1.ActivePageIndex:=0;
    frmTransCxcProc_R.edtMontoAcobrar.SetFloat(Abs(tblPOSTotalestotalneto.Value));
    frmTransCxcProc_R.Showmodal;
  finally
  frmTransCxcProc_R.Free;
  frmTransCxcProc_R:=Nil;
  end;
end;

procedure TfrmProcVentaRapidaPOS.UpdateServINFO(numVta: integer);
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

procedure TfrmProcVentaRapidaPOS.UpdateServAlquiler(numVta: integer);
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

procedure TfrmProcVentaRapidaPOS.FInsertarDatosCtrlNIF(
  _numerotrnvta: Integer);
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

procedure TfrmProcVentaRapidaPOS.ProcInsertarDetCheque(numtrn: integer);
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

procedure TfrmProcVentaRapidaPOS.ProcInsertarDetPagos(numtrn: integer);
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

procedure TfrmProcVentaRapidaPOS.ProcInsertarDetBono(numtrn: integer);
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

procedure TfrmProcVentaRapidaPOS.InsertarDet(numero: Integer);
begin
  ibStpInsertVentaDet.Params[0].Value  := Numero;
  ibStpInsertVentaDet.Params[1].Value  := tblPOSVentadetCodArticulo.Value;
  ibStpInsertVentaDet.Params[2].Value  := Null;
  ibStpInsertVentaDet.Params[3].Value  := tblPOSVentadetDescripcion.Value;
  if (tblPOSVentadetTipoVenta.Value in [1,4,5])  then //Item de Venta
  begin
    ibStpInsertVentaDet.Params[4].Value  := tblPOSVentadetCant.Value * -1;
    ibStpInsertVentaDet.Params[5].Value  := tblPOSVentadetPrecio.Value * -1;
    ibStpInsertVentaDet.Params[6].Value  := tblPOSVentadetporc_desc.Value * -1;//descuento
    ibStpInsertVentaDet.Params[7].Value  := tblPOSVentadetItbi.Value * -1;//itbi_det
    ibStpInsertVentaDet.Params[8].Value  := tblPOSVentadetMontoBruto.Value * -1;
    ibStpInsertVentaDet.Params[9].Value  := tblPOSVentadetMontoNeto.Value * -1;
    //ibStpInsertVentaDet.Params[27].Value := tblPOSVentadetMontoDescItem.Value * -1;
    if (tblPOSVentadetMontoDescItem.Value > 0) then
    ibStpInsertVentaDet.Params[27].Value := tblPOSVentadetMontoDescItem.Value * -1
    else
    ibStpInsertVentaDet.Params[27].Value := tblPOSVentadetMontoDesGlobal.Value * -1;
    ibStpInsertVentaDet.Params[28].Value := tblPOSVentadetMontoDescuento.Value * -1;
    ibStpInsertVentaDet.Params[29].Value := tblPOSVentadetIDTasaITBIS.Value;
    ibStpInsertVentaDet.Params[30].Value := tblPOSVentadetMontoItbisRecargo.Value*-1;
  end else
  begin
    ibStpInsertVentaDet.Params[4].Value  := tblPOSVentadetCant.Value;
    ibStpInsertVentaDet.Params[5].Value  := tblPOSVentadetPrecio.Value;
    ibStpInsertVentaDet.Params[6].Value  := tblPOSVentadetporc_desc.Value;//descuento
    ibStpInsertVentaDet.Params[7].Value  := tblPOSVentadetItbi.Value;//itbi_det
    ibStpInsertVentaDet.Params[8].Value  := tblPOSVentadetMontoBruto.Value;
    ibStpInsertVentaDet.Params[9].Value  := tblPOSVentadetMontoNeto.Value;
    //ibStpInsertVentaDet.Params[27].Value := tblPOSVentadetMontoDescItem.Value;
    if (tblPOSVentadetMontoDescItem.Value > 0) then
    ibStpInsertVentaDet.Params[27].Value := tblPOSVentadetMontoDescItem.Value * -1
    else
    ibStpInsertVentaDet.Params[27].Value := tblPOSVentadetMontoDesGlobal.Value * -1;
    ibStpInsertVentaDet.Params[28].Value := tblPOSVentadetMontoDescuento.Value * -1;
    ibStpInsertVentaDet.Params[29].Value := tblPOSVentadetIDTasaITBIS.Value;
    ibStpInsertVentaDet.Params[30].Value := tblPOSVentadetMontoItbisRecargo.Value * -1;
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
  ibStpInsertVentaDet.Params[20].Value := tblPOSVentadetSerieProd.Value;
  ibStpInsertVentaDet.Params[21].Value := tblPOSVentadetTipoUnidad.Value;
  if (ABS(tblPOSTotalesMontoExoneraITBIS.Value) > 0) then
  ibStpInsertVentaDet.Params[22].Value := 1
  else  
  ibStpInsertVentaDet.Params[22].Value := tblPOSVentadetItbisExento.Value;
  ibStpInsertVentaDet.Params[23].Value := tblPOSVentadetTipoVenta.Value;//Item de Venta
  ibStpInsertVentaDet.Params[24].Value := tblPOSVentadetDescripcionEspecial.Value;//Item de Venta
  ibStpInsertVentaDet.Params[25].Value := tblPOSVentadetCostoProducto.Value;
  ibStpInsertVentaDet.Params[26].Value := tblPOSVentadetPorcDescItem.Value;
  if (tblPOSVentadetMontoDescItem.Value > 0) then
     ibStpInsertVentaDet.Params[27].Value := tblPOSVentadetMontoDescItem.Value
  else
    ibStpInsertVentaDet.Params[27].Value := tblPOSVentadetMontoDesGlobal.Value;

  //ibStpInsertVentaDet.Params[28].Value := tblPOSVentadetMontoDescuento.Value;
  ibStpInsertVentaDet.Params[29].Value := tblPOSVentadetIDTasaITBIS.Value;
  //ibStpInsertVentaDet.Params[30].Value := tblPOSVentadetMontoItbisRecargo.Value;
  ibStpInsertVentaDet.Params[31].Value := tblPOSVentadetMoneda.Value;
  ibStpInsertVentaDet.Params[32].Value := tblPOSVentadetmonto_tasa.Value;
  ibStpInsertVentaDet.Params[33].Value := tblPOSVentadetCantPax.Value;
  tblProductoSerie.close;
  tblProductoSerie.Params[0].Value := tblPOSVentadetSerieProd.Value;
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
  if (not tblPOSVentadetloteNum.IsNull) then
  begin
    ibstpUpdateLote.Params[0].Value:= tblPOSVentadetCodArticulo.Value;
    ibstpUpdateLote.Params[1].Value:= tblPOSVentadetloteNum.Value;
    ibstpUpdateLote.Params[2].Value:= tblPOSVentadetCant.Value;
    ibstpUpdateLote.ExecProc;
  end;
  ibStpInsertVentaDet.params[31].Value:= tblPOSVentadetMoneda.Value;
  ibStpInsertVentaDet.params[32].Value:= tblPOSVentadetmonto_tasa.Value;
  ibStpInsertVentaDet.Params[33].Value := tblPOSVentadetCantPax.Value;  
  ibStpInsertVentaDet.ExecProc;

  if (GlbActivaCafeteria = 1) then
  begin
    dmVentas.qryIngredienteCaf.Close;
    dmVentas.qryIngredienteCaf.Params[0].Value:=tblPOSVentadetCodArticulo.Value;
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

procedure TfrmProcVentaRapidaPOS.InsertaTransCafeteria(numTrn,
  codigoP: Integer; cantP: Real);
begin
  dmVentas.tblTransCafeteria.Append;
  dmVentas.tblTransCafeteriaSERIE.Value :=FsqlMaxNumero('trans_cafeteria','serie');
  dmVentas.tblTransCafeteriaNUMERO.Value:= numTrn;
  dmVentas.tblTransCafeteriaCODIGO_PROD.Value:= codigoP;
  dmVentas.tblTransCafeteriaCANT.Value:= cantP;
  dmVentas.tblTransCafeteriaCOD_USUARIO.Value:= VarUsuarioGlb;
  dmVentas.tblTransCafeteriaFECHA_IN.Value   := now;
  dmVentas.tblTransCafeteriaIN_POR.Value     := strUserName;
  dmVentas.tblTransCafeteriaSTATUS.Value     :='A';
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
    if (tblPOSVentaDetTipoUnidad.Value = 3) Or (tblPOSVentaDetTipoUnidad.Value = 0) then
    ibStpActualizaInvProd.Params[1].Value:= tblPOSVentaDetCant.Value * cantP
    else
    begin
      ibStpActualizaInvProd.Params[1].Value:= tblPOSVentaDetCant.Value * cantP;
    end;
  end else
  ibStpActualizaInvProd.Params[1].Value:= tblPOSVentaDetCant.Value * cantP;

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

procedure TfrmProcVentaRapidaPOS.ActualizaInvAlmacen;
begin
  stpMantInvAlmacen.Params[0].Value := tblPOSVentaDetCodArticulo.Value;//codigo inventario
  stpMantInvAlmacen.Params[1].Value := GlbCodDivInventario;//inventario_id
  if EsDevolucion then
  begin
    stpMantInvAlmacen.Params[2].Value := tblPOSVentaDetCant.Value;
    if (tblPOSVentaDetTipoUnidad.Value = 3) or (tblPOSVentaDetTipoUnidad.Value = 0)  then
      stpMantInvAlmacen.Params[2].Value:= tblPOSVentaDetCant.Value
    else
    begin
      stpMantInvAlmacen.Params[2].Value:= tblPOSVentaDetCant.Value * CantUnidad;
    end;
  end else
  begin
    //stpMantInvAlmacen.Params[2].Value := rxVentaCant.Value * -1;
    if (tblPOSVentaDetTipoUnidad.Value = 3) Or (tblPOSVentaDetTipoUnidad.Value = 0) then
      stpMantInvAlmacen.Params[2].Value:= tblPOSVentaDetCant.Value * -1
    else
    begin
      stpMantInvAlmacen.Params[2].Value:= tblPOSVentaDetCant.Value * CantUnidad *-1;
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

procedure TfrmProcVentaRapidaPOS.Estatus1Click(Sender: TObject);
begin
  if (GlbActivaIFiscal = 1 ) then
  ProcesaEstadoImpresora;
end;

procedure TfrmProcVentaRapidaPOS.RecuperaTicketfiscal1Click(
  Sender: TObject);
begin
 if (GlbActivaIFiscal = 1) then
  begin
    //Delay(2000);
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
          Delay(4000);
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

procedure TfrmProcVentaRapidaPOS.LlenarrxSolDatoscte(codCte: integer);
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

   if tblPOSTotales.State = dsbrowse then tblPOSTotales.Edit;
      tblPOSTotalesCodCliente.Value:= codCte;

   tblPOSTotalesNombreCliente.Value := qryClienteNOMBRE_CTE.Value;
   tblPOSTotalesDireccion.Value     := qryClienteDIRECCION_CONT.Value;
   tblPOSTotalesTelefono.Value      := qryClienteTELEF_CONTACTO.Value;
   tblPOSTotalesCodCliente.Value    := qryClienteCODIGO_CTE.Value;
   tblPOSTotalesRNC_NUMERO.Value    := qryClienteRNC_NUMERO.Value;
   if (Not qryClienteCANT_DIAS_CREDITO.IsNull) And (qryClienteCANT_DIAS_CREDITO.Value > 0) Then
      tblPOSTotalesFechaVence.Value    := GlbFechaTrnDiaria + qryClienteCANT_DIAS_CREDITO.Value
   else
   tblPOSTotalesFechaVence.Value    := GlbFechaTrnDiaria + 15;//Default
   tblPOSTotales.Post;

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

procedure TfrmProcVentaRapidaPOS.AbrirDatosParaTicket(CheckBox1_Checked,
  rdgCredito_Checked: boolean; edtCodCte_Text: String;
  EditN1_ValueInteger: integer; DateTimePicker1_Date: TDateTime);
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
end;

procedure TfrmProcVentaRapidaPOS.Finalizardisplay;
begin

end;

procedure TfrmProcVentaRapidaPOS.ActualizarPreventa;
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

function TfrmProcVentaRapidaPOS.VerificaRecordsVenta: boolean;
var
  guardaR : TBookmark;
begin
  result:=True;
{  result:=False;
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
  rxventa.FreeBookmark(guardaR);}
end;

procedure TfrmProcVentaRapidaPOS.ActualizaCotizacionMaster;
begin
 if not tblPOSTotalesFechaCotizacion.IsNull then
  ibstpUpdateCotizaMaster.Params[1].Value:= tblPOSTotalesFechaCotizacion.Value //GlbFechaTrnDiaria;
  else
  ibstpUpdateCotizaMaster.Params[1].Value:= ExtraerFecha(tblPOSVentadetFecha.Value); //GlbFechaTrnDiaria;
  ibstpUpdateCotizaMaster.Params[2].Value:= ibstpUpdateCotizaMaster.Params[1].Value + 30;//GlbFechaTrnDiaria+30;//fecha vence
  if qryClienteCOD_VENDEDOR.Value > 0 then
  GlbcodVendedor:= qryClienteCOD_VENDEDOR.Value
  else
  GlbcodVendedor:= VarUsuarioGlb;
  if not tblPOSVentasMastCODIGO_CTE.IsNull then
  ibstpUpdateCotizaMaster.Params[3].Value:= tblPOSVentasMastCODIGO_CTE.Value
  else
  ibstpUpdateCotizaMaster.Params[3].Value:= 0;//codigo cliente generico mientras tanto
  if (GlbcodVendedor > 0) then
  ibstpUpdateCotizaMaster.Params[4].Value:= GlbcodVendedor else
  ibstpUpdateCotizaMaster.Params[4].Value:= VarUsuarioGlb;
  ibstpUpdateCotizaMaster.Params[5].Value:= 'Cotización';
  if tblPOSTotalesMoneda.IsNull then
  ibstpUpdateCotizaMaster.Params[6].Value:= '1'
  else
  ibstpUpdateCotizaMaster.Params[6].Value:=tblPOSTotalesMoneda.Value;
  
  ibstpUpdateCotizaMaster.Params[7].Value:= tblPOSTotalestotalneto.Value;//EditN1.Text;
  ibstpUpdateCotizaMaster.Params[8].Value   := 'A';
  ibstpUpdateCotizaMaster.Params[9].Value   := Now;
  ibstpUpdateCotizaMaster.Params[10].AsString := Trim(StrUserName);
  ibstpUpdateCotizaMaster.Params[11].Value    := Null;
  ibstpUpdateCotizaMaster.Params[12].Value    := Null;
  ibstpUpdateCotizaMaster.Params[13].Value    := null;
  ibstpUpdateCotizaMaster.Params[14].Value    := null;
  ibstpUpdateCotizaMaster.Params[15].Value    := null;
  ibstpUpdateCotizaMaster.Params[16].Value    := tblPOSTotalesSubTotal.Value;
  ibstpUpdateCotizaMaster.Params[17].Value    := tblPOSTotalesPorcDesAdicional.Value;
  if tblPOSTotalesMontoDescAdicional.Value > 0 then
  ibstpUpdateCotizaMaster.Params[18].Value    := tblPOSTotalesMontoDescAdicional.Value
  else
  ibstpUpdateCotizaMaster.Params[18].Value    := tblPOSTotalesMontoDescItems.Value;//tblPOSTotalesMontoDescAdicional.Value;//tblPOSTotalesmontodesc.value;

  if ((tblPOSVentadetCantPax.Value >0) or (UpperCase(GLBFormatoFactura) = 'BYMSERVICIOS'))
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
  ibstpUpdateCotizaMaster.Params[23].Value    := tblPOSTotalesitbis.Value;//montototalitbis
  ibstpUpdateCotizaMaster.Params[24].Value    := tblPOSTotalesMontoDescGastosAdmin.Value;
  ibstpUpdateCotizaMaster.Params[25].Value    := tblPOSTotalesMontoDescItbisGastosAdmin.Value;
  ibstpUpdateCotizaMaster.Params[26].Value    := tblPOSTotalesMontoDescTransp.Value;
  ibstpUpdateCotizaMaster.Params[27].Value    := tblPOSTotalesMontoDescDirtecnica.Value;
  ibstpUpdateCotizaMaster.Params[28].Value    := tblPOSTotalesMontoDescItbisDirTecnica.Value;
  ibstpUpdateCotizaMaster.Params[29].Value    := tblPOSTotalesMontoDescImprevisto.Value;
  ibstpUpdateCotizaMaster.Params[30].Value    := tblPOSTotalesMontoDescItbisImprevisto.Value;

  if rdgFactServicio.Checked then
  ibstpUpdateCotizaMaster.Params[31].Value     := 0 //Tipo_factura
  else ibstpUpdateCotizaMaster.Params[31].Value:= 1;

  ibstpUpdateCotizaMaster.Params[32].Value     := null;
  if CheckBox2.Checked then
  ibstpUpdateCotizaMaster.Params[32].Value     := 1 //aplica_tipodesc
  else
  if CheckBox3.Checked then
  ibstpUpdateCotizaMaster.Params[32].Value     := 2;

  ibstpUpdateCotizaMaster.Params[33].Value     := tblPOSVentadetNumeroCotiza.Value;//Numero_Cotiza
  ibstpUpdateCotizaMaster.Params[34].Value     := tblPOSTotalesComentario.Value;//Numero_Cotiza
  ibstpUpdateCotizaMaster.Params[35].Value     := tblPOSTotalesReferenciaCte.Value;//Numero_Cotiza
  ibstpUpdateCotizaMaster.Params[36].Value     := tblPOSTotalesRecargo.Value;
  ibstpUpdateCotizaMaster.Params[37].Value     := tblPOSTotalesTipoNCFIFiscal.Value;
  ibstpUpdateCotizaMaster.Params[38].Value     := tblPOSTotalesMontoExoneraITBIS.Value;
  ibstpUpdateCotizaMaster.Params[39].Value     := GlbPorcPropina;
  ibstpUpdateCotizaMaster.Params[40].Value     := tblPOSTotalesPropina.Value;
  ibstpUpdateCotizaMaster.Params[41].Value     := tblPOSTotalesPropinaLegal.Value;
  
  ibstpUpdateCotizaMaster.ExecProc;

  if Not ibstpUpdateCotizaMaster.Transaction.InTransaction then
  ibstpUpdateCotizaMaster.Transaction.StartTransaction;
  try
    ibstpUpdateCotizaMaster.Transaction.CommitRetaining;
  except
  ibstpUpdateCotizaMaster.Transaction.RollbackRetaining;
  end;
end;

procedure TfrmProcVentaRapidaPOS.InsertarCotizacionDetUpd(numero,serie: Integer);
begin
  stpProcUpdteCotDet.Params[1].Value  := Numero;
  stpProcUpdteCotDet.Params[2].Value  := tblPOSVentadetCodArticulo.Value;
  stpProcUpdteCotDet.Params[3].Value  := Null;
  stpProcUpdteCotDet.Params[4].Value  := tblPOSVentadetDescripcion.Value;
  stpProcUpdteCotDet.Params[5].Value  := tblPOSVentadetDescripcionEspecial.Value;
  stpProcUpdteCotDet.Params[6].Value  := tblPOSVentadetCant.Value;
  stpProcUpdteCotDet.Params[7].Value  := tblPOSVentadetPrecio.Value;
  stpProcUpdteCotDet.Params[8].Value  := 0;
  stpProcUpdteCotDet.Params[9].Value  := tblPOSVentadetItbi.Value; //Itbis
  stpProcUpdteCotDet.Params[10].Value := tblPOSVentadetMontoBruto.Value;
  stpProcUpdteCotDet.Params[11].Value := tblPOSVentadetMontoNeto.Value;//tblPOSVentadetMontoBruto.Value;
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
  stpProcUpdteCotDet.Params[17].Value   := tblPOSVentadetTipoUnidad.Value;
  if (ABS(tblPOSTotalesMontoExoneraITBIS.Value) > 0) then
  stpProcUpdteCotDet.Params[18].Value := 1
  else
  stpProcUpdteCotDet.Params[18].Value   := tblPOSVentadetItbisExento.Value;
  stpProcUpdteCotDet.Params[19].Value   := tblPOSVentadetTipoVenta.Value;
  stpProcUpdteCotDet.Params[20].Value   := serie;
  stpProcUpdteCotDet.Params[21].Value   := tblPOSVentadetPorcDescItem.Value;
  if tblPOSVentadetMontoDescItem.Value > 0 then
  stpProcUpdteCotDet.Params[22].Value   := tblPOSVentadetMontoDescItem.Value
  else
  stpProcUpdteCotDet.Params[22].Value   := tblPOSVentadetMontoDesGlobal.Value;

  stpProcUpdteCotDet.Params[23].Value    := tblPOSVentadetMoneda.Value;
  stpProcUpdteCotDet.Params[24].Value    := tblPOSVentadetmonto_tasa.Value;
  stpProcUpdteCotDet.Params[25].Value    := tblPOSVentadetIDTasaITBIS.Value;
  stpProcUpdteCotDet.Params[26].Value    := tblPOSVentadetCantPax.Value;
  stpProcUpdteCotDet.ExecProc;
end;

procedure TfrmProcVentaRapidaPOS.InsertarCotizacionDet(numero: Integer);
begin
  //ibStpInsertCotizaDet.Params[0].Value := Numero;
  ibStpInsertCotizaDet.Params[1].Value    := Numero;    //Numero
  ibStpInsertCotizaDet.Params[2].Value    := tblPOSVentaDetCodArticulo.Value; //Codigo_Prod
  ibStpInsertCotizaDet.Params[3].Value    := Null;    //codigo_barra
  ibStpInsertCotizaDet.Params[4].Value    := tblPOSVentaDetDescripcion.Value; //Descripcion
  ibStpInsertCotizaDet.Params[5].Value    := tblPOSVentaDetDescripcionEspecial.Value;//DescripcionEspecial
  ibStpInsertCotizaDet.Params[6].Value    := tblPOSVentaDetCant.Value;        //Cantidad
  ibStpInsertCotizaDet.Params[7].Value    := tblPOSVentaDetPrecio.Value;      //Precio
  ibStpInsertCotizaDet.Params[8].Value    := 0;                        //Porc_desc_det
  ibStpInsertCotizaDet.Params[9].Value    := tblPOSVentaDetItbi.Value;        //Itbi_det
  ibStpInsertCotizaDet.Params[10].Value   := tblPOSVentaDetMontoBruto.Value;  //Valor_servicio_det
  ibStpInsertCotizaDet.Params[11].Value   := tblPOSVentaDetMontoNeto.Value;   //Valor_Total_Det
  ibStpInsertCotizaDet.Params[12].Value   := 'A';                      //Status_det
  ibStpInsertCotizaDet.Params[13].Value   := Now;                      //Fecha_in
  ibStpInsertCotizaDet.Params[14].Value   := Null;        //In_Por
  ibStpInsertCotizaDet.Params[15].Value   := Null;                      //Fecha_mod
  ibStpInsertCotizaDet.Params[16].AsString:= Trim(StrUserName);        //Mod_por
  ibStpInsertCotizaDet.Params[17].Value   := tblPOSVentaDetTipoUnidad.Value;  //Tipo_Unidad
  if (ABS(tblPOSTotalesMontoExoneraITBIS.Value) > 0) then
  ibStpInsertCotizaDet.Params[18].Value := 1
  else
  ibStpInsertCotizaDet.Params[18].Value   := tblPOSVentaDetItbisExento.Value; //Itbis_Exento
  ibStpInsertCotizaDet.Params[19].Value   := tblPOSVentaDetTipoVenta.Value;   //Tipo_Venta
  ibStpInsertCotizaDet.Params[20].Value   := tblPOSVentaDetPorcDescItem.Value;//Porc_Desc_Item
  if (tblPOSVentaDetMontoDescItem.Value > 0) then
  ibStpInsertCotizaDet.Params[21].Value    := tblPOSVentaDetMontoDescItem.Value //Monto_Desc_Item
  else
  ibStpInsertCotizaDet.Params[21].Value    := tblPOSVentaDetMontoDesGlobal.Value;

  ibStpInsertCotizaDet.Params[22].Value    := tblPOSVentaDetMoneda.Value;
  ibStpInsertCotizaDet.Params[23].Value    := tblPOSVentaDetmonto_tasa.Value;
  ibStpInsertCotizaDet.Params[24].Value    := tblPOSVentaDetIDTasaITBIS.Value;
  ibStpInsertCotizaDet.Params[25].Value    := tblPOSVentaDetCantPax.Value;
  //ibStpInsertCotizaDet.Params[21].Value := rxVentaMontoDescItem.Value;
  ibStpInsertCotizaDet.ExecProc;
end;

procedure TfrmProcVentaRapidaPOS.BitBtn6Click(Sender: TObject);
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
  if tblPOSVentadet.RecordCount = 0 then
  begin
    MessageDlg('No puedes guardar sin detalle, verifique.',mtInformation,[mbok],0);
    BitBtn6.Enabled := True;
    Exit;
  end;

  if (tblPOSTotalesTipoNCFIFiscal.Value < 0) then
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

  if Not tblPOSVentadetNumeroCotiza.IsNull then
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
  if tblPOSVentasMast.State In [dsEdit, dsInsert] then
     tblPOSVentasMast.Post;
  if (tblPOSVentasMast.RecordCount = 0) Or (tblPOSVentasMastCODIGO_CTE.Value = 0) then
  begin
    if MessageDlg('Cliente no asignado, desea crearlo?', mtInformation, [mbyes,mbno], 0)=mryes then
    begin
      if (GlbActivaIFiscal = 1) And (tblPOSVentasMastCODIGO_CTE.IsNull) then
      begin
        ProcEntradaCliente;
        if tblPOSVentasMastCODIGO_CTE.IsNull then
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

  if Not tblPOSVentasMastCODIGO_CTE.IsNull then
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
    xCodigoCte := tblPOSVentasMastCODIGO_CTE.Value; //FrmBuscarClientesPersonas.CodigoCliente;
    if (xCodigoCte <= 0) Then Exit;
    if Not  xSalir Then
    begin
      if xCodigoCte > 0 then
      begin
        if tblPOSTotales.State = dsbrowse then tblPOSTotales.Edit;
        tblPOSTotalesCodCliente.Value:= xCodigoCte;

        qryCliente.Locate('CODIGO_CTE',xCodigoCte,[]);
        tblPOSTotalesNombreCliente.Value := qryClienteNOMBRE_CTE.Value;
        tblPOSTotalesDireccion.Value     := qryClienteDIRECCION_CONT.Value;
        tblPOSTotalesTelefono.Value      := qryClienteTELEF_CONTACTO.Value;
        tblPOSTotalesCodCliente.Value    := qryClienteCODIGO_CTE.Value;
        tblPOSTotalesRNC_NUMERO.Value    := qryClienteRNC_NUMERO.Value;
        if (Not qryClienteCANT_DIAS_CREDITO.IsNull) And (qryClienteCANT_DIAS_CREDITO.Value > 0) Then
        tblPOSTotalesFechaVence.Value    := GlbFechaTrnDiaria + qryClienteCANT_DIAS_CREDITO.Value
        else
        tblPOSTotalesFechaVence.Value    := GlbFechaTrnDiaria + 15;//Default
        tblPOSTotales.Post;

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

        if not VerificaLimiteCredito(xCodigoCte,tblPOSTotalesTotalNeto.Value) then
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
         if tblPOSTotalesTipoNCF.IsNull then
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
            dmFactura.ibQryViewNCF.Locate('TIPO_CF',tblPOSTotalesTipoNCF.Value,[]);
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
            if tblPOSTotalesMontoNCRAplicado.Value > 0 then
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
              if tblPOSTotalesMontoNCRAplicado.Value > 0 then
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

                frmAsignarNCFVenta.IBDataSet1NUMERO_NCF.Value := frmAsignarNCFVenta.ncfGenerado;//tblPOSVentadetNCF.Value;
                frmAsignarNCFVenta.IBDataSet1MONTO.Value      := tblPOSTotalestotalneto.Value; //StrToFloat(EditN1.Text);

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
                  
                if tblPOSTotales.State = dsBrowse then
                tblPOSTotales.Edit;

                if tblPOSTotales.State In [dsInsert, dsEdit] then
                begin
                  tblPOSTotales.Edit;
                  tblPOSTotalesncf_numero.Value := valorNCF;
                  tblPOSTotalesqrLabelNcfDesc.Value:=GlbDescNCF;
                  //GlbDescNCF:='';
                  tblPOSTotales.Post;
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
end;

procedure TfrmProcVentaRapidaPOS.ProcVentaConNCF(tiponcf: String;
  var valorNCF: String; var seriedoc, serie_asignadoncf: Integer);
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
      frmAsignarNCFVenta.IBDataSet1MONTO.Value      := tblPOSTotalestotalneto.Value; //StrToFloat(EditN1.Text);

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

      if tblPOSTotales.State = dsBrowse then
      tblPOSTotales.Edit;

      if tblPOSTotales.State In [dsInsert, dsEdit] then
      begin
        tblPOSTotales.Edit;
        tblPOSTotalesncf_numero.Value := valorNCF;
        tblPOSTotalesqrLabelNcfDesc.Value:=GlbDescNCF;
        GlbSalvarQuery(tblPOSTotales);
      end;
    finally
    frmAsignarNCFVenta.free;
    frmAsignarNCFVenta:=nil;
    end;
  end;//Fin if CheckBox1.Checked then
end;

procedure TfrmProcVentaRapidaPOS.ProcVenta(valorNCF: String;
  Serie_Asignadoncf: Integer; var serieDoc: Integer);
begin
  if (seriedoc <= 0 ) then
  begin
    serieDoc:= FsqlMaxNumeroFactura('gen_num_factura');//FsqlMaxNumero('facturas','numero');
    if (serieDoc = 0) then
    serieDoc :=1;
  end;
  ipStpInsertVentMast.Params[1].Value:= GlbFechaTrnDiaria;
  ipStpInsertVentMast.Params[2].Value:= GlbCodigoCia;
  if Not tblPOSVentasMastCODIGO_CTE.IsNull then
  ipStpInsertVentMast.Params[3].Value      := tblPOSVentasMastCODIGO_CTE.Value
  else ipStpInsertVentMast.Params[3].Value := 0;//Generico
  if (GlbcodVendedor > 0) then
  ipStpInsertVentMast.Params[4].Value    := GlbcodVendedor
  else
  ipStpInsertVentMast.Params[4].Value    := VarUsuarioGlb;
  //Asignar tipo Venta
  ipStpInsertVentMast.Params[5].Value    := 7;//Credito Normal

  ipStpInsertVentMast.Params[6].Value    := 'Venta a Credito';

  if tblPOSTotalesMoneda.IsNull then
  ipStpInsertVentMast.Params[7].Value    := '1'
  else
  ipStpInsertVentMast.Params[7].Value    := tblPOSTotalesMoneda.Value;
  
  ipStpInsertVentMast.Params[8].AsString := tblPOSTotalestotalneto.AsString; //EditN1.Text;
  ipStpInsertVentMast.Params[9].Value    := 'A';
  ipStpInsertVentMast.Params[10].Value   := Now;
  ipStpInsertVentMast.Params[11].Value   := Null;
  ipStpInsertVentMast.Params[12].Value   := Null;
  ipStpInsertVentMast.Params[13].Value   := Null;
  ipStpInsertVentMast.Params[14].Value   := SerieDoc;//Numero Factura
  ipStpInsertVentMast.Params[15].Value   := Null; //yo soy inteligencia divina
  //ver mas abajo
  //ipStpInsertVentMast.Params[16].Value:= Serie_Asignadoncf;
  ipStpInsertVentMast.Params[17].Value:= tblPOSTotalesSubTotal.Value;
  ipStpInsertVentMast.Params[18].Value:= tblPOSTotalesPorcDesAdicional.Value;
  if tblPOSTotalesMontoDescAdicional.Value > 0 then
  ipStpInsertVentMast.Params[19].Value:= tblPOSTotalesMontoDescAdicional.Value
  else
  ipStpInsertVentMast.Params[19].Value:= tblPOSTotalesMontoDescItems.Value;
  ipStpInsertVentMast.Params[20].Value:= tblPOSTotalesmontorecibido.Value;
  ipStpInsertVentMast.Params[21].Value:= tblPOSTotalesdevolucion.Value;
  ipStpInsertVentMast.Params[22].Value:= tblPOSTotalesitbis.Value;
  ipStpInsertVentMast.Params[23].Value:= tblPOSTotalesmontorecibido.Value;
  ipStpInsertVentMast.Params[24].Value:= edtObservacion.Text;
  ipStpInsertVentMast.Params[25].Value:= tblPOSTotalesMontoDescGastosAdmin.Value;
  ipStpInsertVentMast.Params[26].Value:= tblPOSTotalesMontoDescItbisGastosAdmin.Value;
  ipStpInsertVentMast.Params[27].Value:= tblPOSTotalesMontoDescTransp.Value;
  ipStpInsertVentMast.Params[28].Value:= tblPOSTotalesMontoDescDirtecnica.Value;
  ipStpInsertVentMast.Params[29].Value:= tblPOSTotalesMontoDescItbisDirTecnica.Value;
  ipStpInsertVentMast.Params[30].Value:= tblPOSTotalesMontoDescImprevisto.Value;
  ipStpInsertVentMast.Params[31].Value:= tblPOSTotalesMontoDescItbisImprevisto.Value;
  ipStpInsertVentMast.Params[32].Value:= tblPOSTotalesComentario.Value;
  ipStpInsertVentMast.Params[33].Value:= tblPOSVentaDetNumeroCotiza.Value;
  ipStpInsertVentMast.Params[34].Value:= tblPOStotalesReferenciaCte.Value;
  ipStpInsertVentMast.Params[35].Value:= tblPOSTotalesRecargo.Value;
  ipStpInsertVentMast.Params[36].Value:= tblPOSTotalesTipoNCFIFiscal.Value;
  ipStpInsertVentMast.Params[37].Value:= tblPOSTotalesMontoExoneraITBIS.Value;
  ipStpInsertVentMast.Params[38].Value:= 0;
      
  if Serie_asignadoncf > 0 then
  ipStpInsertVentMast.Params[16].Value     := Serie_Asignadoncf
  else ipStpInsertVentMast.Params[16].Value:= Null;
  //serie_ncf_asignado
  ipStpInsertVentMast.Params[39].Value:= tblPOSTotalesPropina.Value;
  ipStpInsertVentMast.Params[40].Value:= GlbPorcPropina;
  ipStpInsertVentMast.Params[41].Value:= tblPOSTotalesPropinaLegal.Value;

  ipStpInsertVentMast.ExecProc;
  numeroTrnVta:= ipStpInsertVentMast.Params[0].Value;
  if (tblPOSTotalesTipoNCF.Value = '15') OR (tblPOSTotalesTipoNCF.Value = '14') then
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
  
  //rxVenta.DisableControls;
  tblPOSVentaDet.First;
  While not tblPOSVentaDet.Eof do
  begin
    if (tblPOSVentaDetStatus.Value = 'C') then
    begin
      tblPOSVentaDet.Next;
      continue;
    end;  
    InsertarDet(ipStpInsertVentMast.Params[0].Value);
    ibStpActualizaInvProd.Params[0].Value:= tblPOSVentaDetCodArticulo.Value;
    if (GlbUsaPUnidadLevel = 0) then
    ibStpActualizaInvProd.Params[1].Value:= tblPOSVentaDetCant.Value
    else
    ibStpActualizaInvProd.Params[1].Value:= tblPOSVentaDetCant.Value * CantUnidad;
    ibStpActualizaInvProd.Params[2].Value:= 0;//tipoTrn
    ibStpActualizaInvProd.Params[3].Value:= 1;//porCodigo
    if (tblPOSVentaDetInvetariar.Value <> 0) And  (GlbCodDivInventario = 1 ) then
    ibStpActualizaInvProd.ExecProc;

    if (tblPOSVentaDetTipoVenta.Value = 0) or (tblPOSVentaDetTipoVenta.IsNull )  then //Item de Venta
    begin
      try
      ActualizaInvAlmacen;
      except
      end;
    end;

    tblPOSVentaDet.Next;
  end;
  tblPOSVentaDet.First;
  //PoS Exito
  {
  While Not rxVenta.Eof Do
  begin
    tblPOSVentaDet.Edit;
    tblPOSVentaDetNumeroRecibo.Value  := ipStpInsertVentMast.Params[0].Value;
    tblPOSVentaDetNumeroFactura.Value := SerieDoc;
    tblPOSVentaDetNumeroDoc.Value     := SerieDoc;
    GlbSalvarQuery(tblPOSVentaDet);
    tblPOSVentaDet.Next;
    //WriteToLog('Post rxVenta - Line 5225');
  end;}
  sqlIBSQEjecutar('update POS_VENTA_DET set NumeroDoc ='+IntToStr(SerieDoc)+
  ', NumeroRecibo ='+ IntToStr(SerieDoc)+
  ', NumeroFactura ='+ ipStpInsertVentMast.Params[0].AsString+
  ' Where numero ='+tblPOSVentaDetNumero.AsString);
  tblPOSVentaDet.EnableControls;

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
      AbrirDatosParaTicket(false,false,tblPOSVentasMastCodigo_Cte.AsString,numeroTrnVta,tblPOSVentaDetFecha.Value);
      //else
      //if (TipoVenta = 'CREDITO') then
      //AbrirDatosParaTicket(false,true,tablaPropietarioCodigoPropietario,dmReportes.qryViewVentasMastNUMERO_FACTURA.AsInteger,
      //dmReportes.qryViewVentasMastFECHA.Value);
            
        qckRepReciboReimpFFoodPOS:=TqckRepReciboReimpFFoodPOS.Create(Nil);
        try
          qckRepReciboReimpFFoodPOS.xtipoVenta := TipoVenta;
          qckRepReciboReimpFFoodPOS.valorNCF   := valorNCF;
          qckRepReciboReimpFFoodPOS.ncfDesc    := GlbDescNCF;
          if tblPOSVentaDet.RecordCount > 2 then
             qckRepReciboReimpFFoodPOS.Page.Length:= qckRepReciboReimpFFoodPOS.Page.Length +
             (tblPOSVentaDet.RecordCount - 2 ) * 0.63;
          if ImprimirRecibo1.Checked then
             qckRepReciboReimpFFoodPOS.Print else
            qckRepReciboReimpFFoodPOS.Preview;
        finally
        qckRepReciboReimpFFoodPOS.Free;
        qckRepReciboReimpFFoodPOS:=Nil;
        end;
      end else
      begin
      dmVentas.qryPOSTotales.Close;
      if tblPOSVentadetNUMERO.IsNull then
      dmVentas.qryPOSTotales.Params[0].Value:= dmReportes.qryDatosVentaMasterNUMERO.Value
      else
      dmVentas.qryPOSTotales.Params[0].Value:= tblPOSVentadetNUMERO.Value;
      dmVentas.qryPOSTotales.Open;

      qckRepRecibo:=TqckRepRecibo.Create(Nil);
      try
        qckRepRecibo.xtipoVenta := TipoVenta;
        qckRepRecibo.valorNCF:= valorNCF;
        qckRepRecibo.ncfDesc := GlbDescNCF;
        if tblPOSVentaDet.RecordCount > 2 then
           qckRepRecibo.Page.Length:= qckRepRecibo.Page.Length +
           (tblPOSVentaDet.RecordCount - 2 ) * 0.63;
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

procedure TfrmProcVentaRapidaPOS.ProcesaFacturar(tipo: smallint; numdoc,
  codcte: integer);
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
  if not tblPOSTotalesMoneda.IsNull then
  dmfactura.IBDataSetFacturasMONEDA.Value := tblPOSTotalesMoneda.Value
  else
  dmfactura.IBDataSetFacturasMONEDA.Value  := '1';

  dmfactura.IBDataSetFacturasTIPO.Value   := 2;
  dmfactura.IBDataSetFacturasCODIGO_CTE.Value := codcte;
  dmfactura.IBDataSetFacturasFECHA.Value      := ExtraerFecha(GlbFechatrndiaria);
  dmfactura.IBDataSetFacturasDESCRIPCION.Value:= 'Venta';
  dmfactura.IBDataSetFacturasMONTO_FACT.Value := tblPOSTotalestotalNeto.Value;
  dmfactura.IBDataSetFacturasRCXC.Value       := 'R';
  dmfactura.IBDataSetFacturasSTATUS.Value     := 'P';
  dmfactura.IBDataSetFacturasFECHA_IN.Value   := Now;
  dmfactura.IBDataSetFacturasFECHA_VENCE.Value:= tblPOSTotalesFechaVence.Value;
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
  dmfactura.stpInsertPorcOtrosCargosFServ.Params[1].Value := tblPOSTotalesTPorcGAdmin.Value;
  dmfactura.stpInsertPorcOtrosCargosFServ.Params[2].Value := tblPOSTotalesTPorcItbisGAdmin.Value;
  dmfactura.stpInsertPorcOtrosCargosFServ.Params[3].Value := tblPOSTotalesTPorcTrans.Value;
  dmfactura.stpInsertPorcOtrosCargosFServ.Params[4].Value := tblPOSTotalesTPorcDirTec.Value;
  dmfactura.stpInsertPorcOtrosCargosFServ.Params[5].Value := tblPOSTotalesTPorcItbisDirTec.Value;
  dmfactura.stpInsertPorcOtrosCargosFServ.Params[6].Value := tblPOSTotalesTPorcImprevisto.Value;
  dmfactura.stpInsertPorcOtrosCargosFServ.Params[7].Value := tblPOSTotalesTPorcItbisImprevisto.Value;
  if (dmfactura.stpInsertPorcOtrosCargosFServ.Params[0].Value > 0) then
  //dmfactura.stpInsertPorcOtrosCargosFServ.Params[7].Value := TotalesPorcItbisImprevisto.Value;
  dmfactura.stpInsertPorcOtrosCargosFServ.ExecProc;

  //Inserta factura en tabla factura_pendiente y pone status factura igual a F donde
  //status igual a P
  dmfactura.stpProcInsFactPendiente.Params[0].Value:= ExtraerFecha(GlbFechatrndiaria);
  dmfactura.stpProcInsFactPendiente.Params[1].Value:= ExtraerFecha(GlbFechatrndiaria);
  if not tblPOSTotalesMoneda.IsNull then
  begin
  dmfactura.stpProcInsFactPendiente.Params[2].Value:= tblPOSTotalesMoneda.Value;
  dmfactura.stpProcInsFactPendiente.Params[3].Value:= tblPOSTotalesMoneda.Value;
  end else
  begin
    dmfactura.stpProcInsFactPendiente.Params[2].Value:= '1';
    dmfactura.stpProcInsFactPendiente.Params[3].Value:= '1';
  end;
  dmfactura.stpProcInsFactPendiente.ExecProc;

  tblPOSVentaDet.First;
  //While Not rxVenta.Eof Do
  //begin
  if (tblPOSTotalestotalneto.Value > 0 ) then
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
    if not tblPOSTotalesMoneda.IsNull then
    dmCxc.tblTransCxcmoneda.Value  := tblPOSTotalesMoneda.Value
    else
    dmCxc.tblTransCxcmoneda.Value  := '1';
    dmCxc.tblTransCxcfecha.Value   := ExtraerFecha(GlbFechatrndiaria);

    dmCxc.tblTransCxccodigo_cliente.Value := tblPOSTotalesCodCliente.Value;
    dmCxc.tblTransCxccodigo_serv.Value    := 0;
    dmCxc.tblTransCxcNUMERO_DOC.Value     := Numdoc;

    dmCxc.tblTransCxcvalor_documento.Value:= tblPOSTotalestotalNeto.Value;
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
end;

procedure TfrmProcVentaRapidaPOS.ReactivarValores;
begin
  //rxVenta.EmptyTable;
  Edit1.Text      := '';
  edtCodigo.Text  := '';
  BitBtn4.Enabled := False;
  //Totales.EmptyTable;
  CheckBox1.Checked := False;
  EsDevolucion      := False;
  GlbDescNCF        := '';
  edtCodigo.SetFocus;

  //NoGenerarNCF1Click(Self);
  EsFactura := False;
  //tablaPropietario.Edit;
  dmCalculos.ProcDeleteVtaMaster(tblPOSVentasMastNumero.Value);
  //tablaPropietario.EmptyTable;
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

procedure TfrmProcVentaRapidaPOS.ImprimeDocumento(serieDoc: integer);
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
            tblPOSVentadet.DisableControls;
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
            tblPOSVentadet.EnableControls;
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
        //frmConsultaFacturas.edtCodCte.SetInteger(tblPOSVentasMastCODIGO_CTE.Value);
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
          //frmConsultaFacturas.edtCodCte.SetInteger(tblPOSVentasMastCODIGO_CTE.Value);
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
            tblPOSVentadet.DisableControls;
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
            tblPOSVentadet.EnableControls;
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

procedure TfrmProcVentaRapidaPOS.PrepararInfoFiscal(numerotrn: integer);
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
  dmreportes.qryDatosReimpDocFiscal.Open;//dmreportes.qryDatosReimpDocFiscal.Sql.Text;
end;

procedure TfrmProcVentaRapidaPOS.ImpFacturaservicio(numerotrn: Integer;
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

procedure TfrmProcVentaRapidaPOS.ExportarGridExcel;
begin
  if (tblPOSVentaDetStatus.Value = 'C') then //eliminar
  begin
    dmfactura.ibsqlEliminarSerieVentaDet.Params[0].Value:=tblPOSVentaDetSerieOriginal.Value;
    dmfactura.ibsqlEliminarSerieVentaDet.ExecQuery;
    if Not dmfactura.ibsqlEliminarSerieVentaDet.Transaction.InTransaction then
    dmfactura.ibsqlEliminarSerieVentaDet.Transaction.StartTransaction;
    try
      dmfactura.ibsqlEliminarSerieVentaDet.Transaction.CommitRetaining;
    except
    dmfactura.ibsqlEliminarSerieVentaDet.Transaction.RollbackRetaining;
  end;
  end else
  if (tblPOSVentaDetStatus.Value = 'I') then //record nuevo
  InsertarDet(dmfactura.qryVentaFacturaDetNUMERO.Value)
  else
  begin
    stpUpdateVentaDetU1.Params[0].Value := tblPOSVentaDetSerieOriginal.Value;
    stpUpdateVentaDetU1.Params[1].Value := tblPOSVentaDetNumeroTrnOriginal.Value;
    stpUpdateVentaDetU1.Params[2].Value := tblPOSVentaDetCodArticulo.Value;
    stpUpdateVentaDetU1.Params[3].Value := null;
    stpUpdateVentaDetU1.Params[4].Value := tblPOSVentaDetDescripcion.Value;
    stpUpdateVentaDetU1.Params[5].Value := tblPOSVentaDetCant.Value;
    stpUpdateVentaDetU1.Params[6].Value := tblPOSVentaDetPrecio.Value;
    stpUpdateVentaDetU1.Params[7].Value := tblPOSVentaDetporc_desc.Value;
    stpUpdateVentaDetU1.Params[8].Value := tblPOSVentaDetItbi.Value;
    stpUpdateVentaDetU1.Params[9].Value := tblPOSVentaDetMontoBruto.Value;
    stpUpdateVentaDetU1.Params[10].Value:= tblPOSVentaDetMontoNeto.Value;
    stpUpdateVentaDetU1.Params[11].Value:= tblPOSVentaDetNumeroFactura.Value;
    stpUpdateVentaDetU1.Params[12].Value:= tblPOSVentaDetStatus.Value;
    stpUpdateVentaDetU1.Params[13].Value:= NOW;
    stpUpdateVentaDetU1.Params[14].Value:= strUserName;
    stpUpdateVentaDetU1.Params[15].Value:= null;
    stpUpdateVentaDetU1.Params[16].Value:= null;
    stpUpdateVentaDetU1.Params[17].Value:= null;
    stpUpdateVentaDetU1.Params[18].Value:= null;
    stpUpdateVentaDetU1.Params[19].Value:= tblPOSVentaDetSerieProd.Value;
    stpUpdateVentaDetU1.Params[20].Value:= null;
    stpUpdateVentaDetU1.Params[21].Value:= tblPOSVentaDetTipoUnidad.Value;
    stpUpdateVentaDetU1.Params[22].Value:= tblPOSVentaDetItbisExento.Value;
    stpUpdateVentaDetU1.Params[23].Value:= tblPOSVentaDetTipoVenta.Value;
    stpUpdateVentaDetU1.Params[24].Value:= tblPOSVentaDetDescripcionEspecial.Value;
    stpUpdateVentaDetU1.Params[25].Value:= tblPOSVentaDetCostoProducto.Value;
    stpUpdateVentaDetU1.Params[26].Value:= tblPOSVentaDetPorcDescItem.Value;
    //stpUpdateVentaDetU1.Params[27].Value:= rxVentaMontoDescItem.Value;
    if (tblPOSVentaDetMontoDescItem.Value > 0) then
    stpUpdateVentaDetU1.Params[27].Value := tblPOSVentaDetMontoDescItem.Value
    else
    stpUpdateVentaDetU1.Params[27].Value := tblPOSVentaDetMontoDesGlobal.Value;

    stpUpdateVentaDetU1.Params[28].Value := tblPOSVentaDetMontoDescuento.Value;
    stpUpdateVentaDetU1.Params[29].Value := tblPOSVentaDetIDTasaITBIS.Value;
    stpUpdateVentaDetU1.Params[30].Value := tblPOSVentaDetMontoItbisRecargo.Value;
    stpUpdateVentaDetU1.Params[31].Value := tblPOSVentaDetMoneda.Value;
    stpUpdateVentaDetU1.Params[32].Value := tblPOSVentaDetmonto_tasa.Value;
    stpUpdateVentaDetU1.Params[33].Value := tblPOSVentaDetCantPax.Value;

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

procedure TfrmProcVentaRapidaPOS.ActualizaVentaMaster(fpago: String;
  serieNcfAsignado: Integer);
begin
  stpProc_UpdateVENTAS_MAST_U1.Params[0].Value:= dmfactura.qryVentaFacturaNUMERO.Value;
  stpProc_UpdateVENTAS_MAST_U1.Params[1].Value:= dmfactura.qryVentaFacturaFECHA.Value;
  stpProc_UpdateVENTAS_MAST_U1.Params[2].Value:= dmfactura.qryVentaFacturaCIA_KEY.Value;//GlbCodigoCia;
  if Not tblPOSVentasMastCODIGO_CTE.IsNull then
  stpProc_UpdateVENTAS_MAST_U1.Params[3].Value      := tblPOSVentasMastCODIGO_CTE.Value
  else stpProc_UpdateVENTAS_MAST_U1.Params[3].Value := 0;//Generico

      if GlbcodVendedor > 0 then
    stpProc_UpdateVENTAS_MAST_U1.Params[4].Value    := GlbcodVendedor
    else
  stpProc_UpdateVENTAS_MAST_U1.Params[4].Value    := VarUsuarioGlb;
  //Asignar tipo Venta
  stpProc_UpdateVENTAS_MAST_U1.Params[5].Value    := fpago;dmfactura.qryVentaFacturaFORMA_PAGO.Value;//Credito Normal

  stpProc_UpdateVENTAS_MAST_U1.Params[6].Value    := 'Venta a Credito';
  stpProc_UpdateVENTAS_MAST_U1.Params[7].Value    := dmfactura.qryVentaFacturaMONEDA.Value;
  stpProc_UpdateVENTAS_MAST_U1.Params[8].AsString := tblPOSTotalestotalneto.AsString; //EditN1.Text;
  stpProc_UpdateVENTAS_MAST_U1.Params[9].Value    := 'A';
  stpProc_UpdateVENTAS_MAST_U1.Params[10].Value   := Now;
  stpProc_UpdateVENTAS_MAST_U1.Params[11].Value   := strusername;
  stpProc_UpdateVENTAS_MAST_U1.Params[12].Value   := dmfactura.qryVentaFacturaNUMERO_FACTURA.Value;
  stpProc_UpdateVENTAS_MAST_U1.Params[13].Value:= dmfactura.qryVentaFacturaNUMERO_DOC_PAGO.Value;
  stpProc_UpdateVENTAS_MAST_U1.Params[14].Value:= serieNcfAsignado; //dmfactura.qryVentaFacturaSERIE_NCF_ASIGNADO.Value;
  stpProc_UpdateVENTAS_MAST_U1.Params[15].Value:= tblPOSTotalesSubTotal.Value;
  stpProc_UpdateVENTAS_MAST_U1.Params[16].Value:= tblPOSTotalesPorcientoInteres.Value;
  if tblPOSTotalesMontoDescAdicional.Value > 0 then
  stpProc_UpdateVENTAS_MAST_U1.Params[17].Value:= tblPOSTotalesMontoDescAdicional.Value
  else
  stpProc_UpdateVENTAS_MAST_U1.Params[17].Value:= tblPOSTotalesMontoDescItems.Value;
  stpProc_UpdateVENTAS_MAST_U1.Params[18].Value:= 0;//Null;//tblPOSTotalesmontorecibido.Value;//monto inicial
  stpProc_UpdateVENTAS_MAST_U1.Params[19].Value:= edtObservacion.Text;
  //stpProc_UpdateVENTAS_MAST_U1.Params[19].Value:= tblPOSTotalesNombreCliente.Value;// tblPOSTotalesMontoDescAdicional.Value;
  stpProc_UpdateVENTAS_MAST_U1.Params[20].Value:= tblPOSTotalesmontorecibido.Value;
  stpProc_UpdateVENTAS_MAST_U1.Params[21].Value:= tblPOSTotalesdevolucion.Value;
  stpProc_UpdateVENTAS_MAST_U1.Params[22].Value:= tblPOSTotalesitbis.Value;
  stpProc_UpdateVENTAS_MAST_U1.Params[23].Value:= tblPOSTotalesMontoDescGastosAdmin.Value;
  stpProc_UpdateVENTAS_MAST_U1.Params[24].Value:= tblPOSTotalesMontoDescItbisGastosAdmin.Value;
  stpProc_UpdateVENTAS_MAST_U1.Params[25].Value:= tblPOSTotalesMontoDescTransp.Value;
  stpProc_UpdateVENTAS_MAST_U1.Params[26].Value:= tblPOSTotalesMontoDescDirtecnica.Value;
  stpProc_UpdateVENTAS_MAST_U1.Params[27].Value:= tblPOSTotalesMontoDescItbisDirTecnica.Value;
  stpProc_UpdateVENTAS_MAST_U1.Params[28].Value:= tblPOSTotalesMontoDescImprevisto.Value;
  stpProc_UpdateVENTAS_MAST_U1.Params[29].Value:= tblPOSTotalesMontoDescItbisImprevisto.Value;
  stpProc_UpdateVENTAS_MAST_U1.Params[30].Value:= tblPOSTotalesComentario.Value;
  stpProc_UpdateVENTAS_MAST_U1.Params[31].Value:= tblPOSVentadetNumeroCotiza.Value;
  stpProc_UpdateVENTAS_MAST_U1.Params[32].Value:= tblPOSTotalesRecargo.Value;
  stpProc_UpdateVENTAS_MAST_U1.Params[33].Value:= tblPOSTotalesMontoExoneraITBIS.Value;
  stpProc_UpdateVENTAS_MAST_U1.Params[34].Value:= tblPOSTotalesPropina.Value;
  stpProc_UpdateVENTAS_MAST_U1.Params[35].Value:= GlbPorcPropina;
  stpProc_UpdateVENTAS_MAST_U1.Params[36].Value:= tblPOSTotalesPropinaLegal.Value;
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

procedure TfrmProcVentaRapidaPOS.ActualizaVentaDet;
begin
  if (tblPOSVentadetStatus.Value = 'C') then //eliminar
  begin
    dmfactura.ibsqlEliminarSerieVentaDet.Params[0].Value:=tblPOSVentadetSerieOriginal.Value;
    dmfactura.ibsqlEliminarSerieVentaDet.ExecQuery;
    if Not dmfactura.ibsqlEliminarSerieVentaDet.Transaction.InTransaction then
    dmfactura.ibsqlEliminarSerieVentaDet.Transaction.StartTransaction;
    try
      dmfactura.ibsqlEliminarSerieVentaDet.Transaction.CommitRetaining;
    except
    dmfactura.ibsqlEliminarSerieVentaDet.Transaction.RollbackRetaining;
  end;
  end else
  if (tblPOSVentadetStatus.Value = 'I') then //record nuevo
  InsertarDet(dmfactura.qryVentaFacturaDetNUMERO.Value)
  else
  begin
    stpUpdateVentaDetU1.Params[0].Value := tblPOSVentadetSerieOriginal.Value;
    stpUpdateVentaDetU1.Params[1].Value := tblPOSVentadetNumeroTrnOriginal.Value;
    stpUpdateVentaDetU1.Params[2].Value := tblPOSVentadetCodArticulo.Value;
    stpUpdateVentaDetU1.Params[3].Value := null;
    stpUpdateVentaDetU1.Params[4].Value := tblPOSVentadetDescripcion.Value;
    stpUpdateVentaDetU1.Params[5].Value := tblPOSVentadetCant.Value;
    stpUpdateVentaDetU1.Params[6].Value := tblPOSVentadetPrecio.Value;
    stpUpdateVentaDetU1.Params[7].Value := tblPOSVentadetporc_desc.Value;
    stpUpdateVentaDetU1.Params[8].Value := tblPOSVentadetItbi.Value;
    stpUpdateVentaDetU1.Params[9].Value := tblPOSVentadetMontoBruto.Value;
    stpUpdateVentaDetU1.Params[10].Value:= tblPOSVentadetMontoNeto.Value;
    stpUpdateVentaDetU1.Params[11].Value:= tblPOSVentadetNumeroFactura.Value;
    stpUpdateVentaDetU1.Params[12].Value:= tblPOSVentadetStatus.Value;
    stpUpdateVentaDetU1.Params[13].Value:= NOW;
    stpUpdateVentaDetU1.Params[14].Value:= strUserName;
    stpUpdateVentaDetU1.Params[15].Value:= null;
    stpUpdateVentaDetU1.Params[16].Value:= null;
    stpUpdateVentaDetU1.Params[17].Value:= null;
    stpUpdateVentaDetU1.Params[18].Value:= null;
    stpUpdateVentaDetU1.Params[19].Value:= tblPOSVentadetSerieProd.Value;
    stpUpdateVentaDetU1.Params[20].Value:= null;
    stpUpdateVentaDetU1.Params[21].Value:= tblPOSVentadetTipoUnidad.Value;
    stpUpdateVentaDetU1.Params[22].Value:= tblPOSVentadetItbisExento.Value;
    stpUpdateVentaDetU1.Params[23].Value:= tblPOSVentadetTipoVenta.Value;
    stpUpdateVentaDetU1.Params[24].Value:= tblPOSVentadetDescripcionEspecial.Value;
    stpUpdateVentaDetU1.Params[25].Value:= tblPOSVentadetCostoProducto.Value;
    stpUpdateVentaDetU1.Params[26].Value:= tblPOSVentadetPorcDescItem.Value;
    //stpUpdateVentaDetU1.Params[27].Value:= tblPOSVentadetMontoDescItem.Value;
    if (tblPOSVentadetMontoDescItem.Value > 0) then
    stpUpdateVentaDetU1.Params[27].Value := tblPOSVentadetMontoDescItem.Value
    else
    stpUpdateVentaDetU1.Params[27].Value := tblPOSVentadetMontoDesGlobal.Value;

    stpUpdateVentaDetU1.Params[28].Value := tblPOSVentadetMontoDescuento.Value;
    stpUpdateVentaDetU1.Params[29].Value := tblPOSVentadetIDTasaITBIS.Value;
    stpUpdateVentaDetU1.Params[30].Value := tblPOSVentadetMontoItbisRecargo.Value;
    stpUpdateVentaDetU1.Params[31].Value := tblPOSVentadetMoneda.Value;
    stpUpdateVentaDetU1.Params[32].Value := tblPOSVentadetmonto_tasa.Value;
    stpUpdateVentaDetU1.Params[33].Value := tblPOSVentadetCantPax.Value;
    
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

procedure TfrmProcVentaRapidaPOS.ActualizaFactPendiente;
begin
  if dmfactura.qryVentaFacturaforma_pago.value in [1,6] then exit;
  stpProcUpdateFActPendu1.Params[0].Value:= 2;//dmfactura.qryVentaFacturaTIPO_FACTURA.Value;
  stpProcUpdateFActPendu1.Params[1].Value:= dmfactura.qryVentaFacturaMONEDA.Value;
  stpProcUpdateFActPendu1.Params[2].Value:= dmfactura.qryVentaFacturaNUMERO_FACTURA.Value;
  stpProcUpdateFActPendu1.Params[3].Value:= tblPOSTotalestotalneto.Value;
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

procedure TfrmProcVentaRapidaPOS.ActualizaFactura;
begin
  if dmfactura.qryVentaFacturaNUMEROFACTURA.Value = 0 then exit;
  stpProcUpdateFactU1.Params[0].Value := dmfactura.qryVentaFacturaSERIEFACTURA.Value;
  stpProcUpdateFactU1.Params[1].Value := dmfactura.qryVentaFacturaNUMEROFACTURA.Value;
  stpProcUpdateFactU1.Params[2].Value := dmfactura.qryVentaFacturaMONEDAFACTURA.Value;
  stpProcUpdateFactU1.Params[3].Value := dmfactura.qryVentaFacturaTIPOFACTURA.Value;
  stpProcUpdateFactU1.Params[4].Value := dmfactura.qryVentaFacturaCODIGO_CTE.Value;
  stpProcUpdateFactU1.Params[5].Value := dmfactura.qryVentaFacturaFECHA.Value;
  stpProcUpdateFactU1.Params[6].Value := dmfactura.qryVentaFacturaOBSERVACION.Value;
  stpProcUpdateFactU1.Params[7].Value := tblPOSTotalestotalneto.Value;
  stpProcUpdateFactU1.Params[8].Value := Null;
  stpProcUpdateFactU1.Params[9].Value := Null;
  stpProcUpdateFactU1.Params[10].Value :=Null;
  stpProcUpdateFactU1.Params[11].Value :=Now;
  stpProcUpdateFactU1.Params[12].Value :=StrUserName;
  stpProcUpdateFactU1.Params[13].Value := tblPOsTotalesFechaVence.Value;
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

procedure TfrmProcVentaRapidaPOS.ActualizaTransCxc;
begin
  if dmfactura.qryDatosTrncxcSERIE.Value = 0 then Exit;
  stpProcUpdateTrnCxcU1.Params[0].Value:= dmfactura.qryDatosTrncxcSERIE.Value;
  stpProcUpdateTrnCxcU1.Params[1].Value:= glbCia_Key;
  stpProcUpdateTrnCxcU1.Params[2].Value:= dmfactura.qryDatosTrncxcTIPO_DOC.Value;
  stpProcUpdateTrnCxcU1.Params[3].Value:= dmfactura.qryDatosTrncxcMONEDA.Value;
  stpProcUpdateTrnCxcU1.Params[4].Value:= dmfactura.qryDatosTrncxcFECHA.Value;
  stpProcUpdateTrnCxcU1.Params[5].Value:= dmfactura.qryDatosTrncxcNUM_DOC.Value;
  stpProcUpdateTrnCxcU1.Params[6].Value:= tblPOSVentasMastCODIGO_CTE.Value;
  stpProcUpdateTrnCxcU1.Params[7].Value:= null;
  stpProcUpdateTrnCxcU1.Params[8].Value:= dmfactura.qryDatosTrncxcCONCEPTO.Value;
  stpProcUpdateTrnCxcU1.Params[9].Value:= tblPOStotalestotalneto.Value;
  stpProcUpdateTrnCxcU1.Params[10].Value:= Now;
  stpProcUpdateTrnCxcU1.Params[11].Value:= strusername;
  stpProcUpdateTrnCxcU1.Params[12].Value:= tblPOSVentaDetSerieOriginal.Value;

  stpProcUpdateTrnCxcU1.ExecProc;
  if Not stpProcUpdateTrnCxcU1.Transaction.InTransaction then
  stpProcUpdateTrnCxcU1.Transaction.StartTransaction;
  try
    stpProcUpdateTrnCxcU1.Transaction.CommitRetaining;
  except
  stpProcUpdateTrnCxcU1.Transaction.RollbackRetaining;
  end;
end;

procedure TfrmProcVentaRapidaPOS.ActualizaBalanceCteCxc;
begin
  if esContado then exit;

  stpProcUpdateBlcCteCxc.Params[0].Value:= 0;//anular cargo anterior;
  stpProcUpdateBlcCteCxc.Params[1].Value:= tblPOSTotalesCodCliente.Value;
  stpProcUpdateBlcCteCxc.Params[2].Value:= 0;
  if tblPOSTotalesMoneda.IsNull then
  stpProcUpdateBlcCteCxc.Params[3].Value:= '1' //pesos
  else
  stpProcUpdateBlcCteCxc.Params[3].Value:= tblPOSTotalesMoneda.Value;
  
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
  stpProcUpdateBlcCteCxc.Params[1].Value:= tblPOSTotalesCodCliente.Value;
  stpProcUpdateBlcCteCxc.Params[2].Value:= 0;
  if tblPOSTotalesMoneda.IsNull then
  stpProcUpdateBlcCteCxc.Params[3].Value:= '1'//pesos
  else
  stpProcUpdateBlcCteCxc.Params[3].Value:= tblPOSTotalesMoneda.Value;

  stpProcUpdateBlcCteCxc.Params[4].Value:= tblPOSTotalestotalneto.Value;
  stpProcUpdateBlcCteCxc.Params[5].Value:= null;
  stpProcUpdateBlcCteCxc.Params[6].Value:= tblPOSTotalestotalneto.Value;
  stpProcUpdateBlcCteCxc.Params[7].Value:= tblPOSTotalestotalneto.Value;
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


procedure TfrmProcVentaRapidaPOS.ReImprimirRecibo1Click(Sender: TObject);
begin
  //frmProcVentaRapida.Hide;
  if tblPOSVentaDet.RecordCount > 0 then
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

procedure TfrmProcVentaRapidaPOS.datosVtatestClick(Sender: TObject);
begin
  if not Assigned(frmDatosVtaTest) then
  frmDatosVtaTest:=TfrmDatosVtaTest.Create(self);
  try
    frmDatosVtaTest.Show;
  except
  end;
end;

procedure TfrmProcVentaRapidaPOS.tblPOSVentadetAfterInsert(
  DataSet: TDataSet);
  var
    sNtr : integer;
begin
  if tblPOSVentasMastNumero.IsNull then
  begin
    sNtr:= GetNumSecuenciaVta(VarUsuarioGlb,ExtraerFecha(GlbFechaTrnDiaria));
  end;
end;

procedure TfrmProcVentaRapidaPOS.tblPOSVentadetBeforeClose(
  DataSet: TDataSet);
begin
  GlbSalvarQuery(tblPOSVentadet);
end;

procedure TfrmProcVentaRapidaPOS.tblPOSTotalesBeforeClose(
  DataSet: TDataSet);
begin
  tblPOSTotales.DisableControls;
  if tblPOSTotales.UpdatesPending then
  GlbSalvarQuery(tblPOSTotales);
end;

procedure TfrmProcVentaRapidaPOS.tblPOSVentasMastBeforeClose(
  DataSet: TDataSet);
begin
  GlbSalvarQuery(tblPOSVentasMast);
end;

procedure TfrmProcVentaRapidaPOS.RxDBGrid1Exit(Sender: TObject);
begin
  GlbNumeroSerie:= tblPOSVentadetSerie.Value;
end;

procedure TfrmProcVentaRapidaPOS.RxDBGrid1Enter(Sender: TObject);
begin
  GlbNumeroSerie:= tblPOSVentadetSerie.Value;
end;

procedure TfrmProcVentaRapidaPOS.tblPOSVentadetNUMEROValidate(
  Sender: TField);
begin
{ if (Sender = nil) then exit;
 if (Sender.Value = 0) or (Sender.IsNull) then
 if not tblPOSVentasMastNUMERO.IsNull then
 Sender.Value:= tblPOSVentasMastNUMERO.Value
 else Sender.Value := null;} 
end;

procedure TfrmProcVentaRapidaPOS.DBEdit9Enter(Sender: TObject);
begin
  if (tblPOSTotalesPorcDesAdicional.Value = 0) or
  (tblPOSTotalesPorcDesAdicional.IsNull) then
  DBEdit9.Enabled := True;
end;

procedure TfrmProcVentaRapidaPOS.DBEdit10Change(Sender: TObject);
begin
  procCalC:=true;
end;

procedure TfrmProcVentaRapidaPOS.BitBtn14Click(Sender: TObject);
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

procedure TfrmProcVentaRapidaPOS.tblPOSTotalesAfterOpen(DataSet: TDataSet);
begin
  tblPOSTotales.EnableControls;
  if tblPOSVentasMastPorcDesAdicional.Value > 0 then
  chKDescuentoGlobal.Checked := True else
  chKDescuentoGlobal.Checked := False;
  if chKDescuentoGlobal.Checked then
  DBEdit11.Visible:=True;
end;

procedure TfrmProcVentaRapidaPOS.DBEdit7Exit(Sender: TObject);
begin
  if tblPOStotales.State in [dsEdit, dsInsert] then
  begin
    procCalC:=False;
    GlbSalvarQuery(tblPOSTotales);
    //DBStatusLabel1.Visible:=False;
  end;
end;

procedure TfrmProcVentaRapidaPOS.tblPOSVentasMastAfterScroll(
  DataSet: TDataSet);
begin
  if tblPOSTotales.State = dsInactive then
  begin
    tblPOSTotales.Params[0].Value:= tblPOSVentasMastNUMERO.Value;
    tblPOSTotales.Open;
  end;
end;

end.

