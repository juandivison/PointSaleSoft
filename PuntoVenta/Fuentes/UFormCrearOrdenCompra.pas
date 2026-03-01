unit UFormCrearOrdenCompra;
//UFormConsignacion

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, RXDBCtrl, DBCtrls,
  Printers, DB, Mask, RxMemDS, EditNew, IBCustomDataSet, IBQuery, WinSkinData, Menus,
  ShellApi, RXCtrls, IBStoredProc, IBSQL, RxLookup, RXSpin, OleServer,
  ExcelXP, comObj;

type
  TfrmCrearOrdenCompra = class(TForm)
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
    qryProv: TIBQuery;
    qryProvCODIGO_CTE: TIntegerField;
    qryProvTIPO_CLIENTE: TIntegerField;
    qryProvDESCRIPCION: TIBStringField;
    qryProvCONTACTO: TIBStringField;
    qryProvPAIS: TIBStringField;
    qryProvESTADO: TIBStringField;
    qryProvCIUDAD: TIBStringField;
    qryProvCALYYNUM: TIBStringField;
    qryProvTELEFONO: TIBStringField;
    qryProvFAX: TIBStringField;
    qryProvCODIGOPOSTAL: TIBStringField;
    qryProvEMAIL: TIBStringField;
    qryProvDIRECCIONWEB: TIBStringField;
    qryProvSTATUS: TIBStringField;
    qryProvFECHA_IN: TDateTimeField;
    qryProvIN_POR: TIBStringField;
    qryProvFECHA_MOD: TDateTimeField;
    qryProvMOD_POR: TIBStringField;
    qryProvRNC_PROVEEDOR: TIBStringField;
    dsqryProv: TDataSource;
    rxVentaCostoProducto: TCurrencyField;
    ModificarOrden1: TMenuItem;
    TotalesMoneda: TStringField;
    qryProductosDESCRIPCIONADICIONAL: TMemoField;
    qryProvNOMBRE_ABR: TIBStringField;
    qryProvMOVIL1: TIBStringField;
    qryProvMOVIL2: TIBStringField;
    qryProvTELEFONO2: TIBStringField;
    qryProvTELEFONO3: TIBStringField;
    qryProvEXTENSIONES: TIBStringField;
    qryProvCIA_KEY: TIntegerField;
    qryProvCOD_VENDEDOR: TIntegerField;
    qryProvCONDICION: TIntegerField;
    qryProvCANT_DIAS_CREDITO: TSmallintField;
    qryProvLIMITE_CREDITO: TFloatField;
    imbBarcode: TImage;
    RxDBLookupCombo5: TRxDBLookupCombo;
    dsqryPrecioUnidadSurt: TDataSource;
    rxVentaPorcTasaItbisCld: TStringField;
    rxVentaIDTasaItbis: TIntegerField;
    qryProductosIDTASAITBIS: TSmallintField;
    qryInventarioIDTASAITBIS: TSmallintField;
    qryProductosCODIGO_BARRA: TIBStringField;
    qryInventarioCODIGO_BARRA: TIBStringField;
    BitBtn9: TBitBtn;
    qryVenceDESCRIPCION_PRODUCTO: TIBStringField;
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
    procedure BitBtn9Click(Sender: TObject);
    procedure MaestroCliente1Click(Sender: TObject);
    procedure RxDBGrid2DblClick(Sender: TObject);
    procedure DBEdit1Enter(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure DBEdit5Exit(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure MostrarVistaproductos1Click(Sender: TObject);
    procedure edtReferenciaChange(Sender: TObject);
    procedure edtReferenciaExit(Sender: TObject);
    procedure NotaCrdito1Click(Sender: TObject);
    procedure NotaDebito1Click(Sender: TObject);
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
    procedure ModificarOrden1Click(Sender: TObject);
    procedure RxDBLookupCombo5Change(Sender: TObject);
    procedure rxVentaCalcFields(DataSet: TDataSet);
    procedure RxDBLookupCombo1KeyPress(Sender: TObject; var Key: Char);
    procedure FormResize(Sender: TObject);
    procedure FormClick(Sender: TObject);
  private
    procedure AbrirUnidades;
    procedure LimpiarDatos;
    procedure ActivarBotonesEnModifica;
    procedure CargarDatosAModificar;
    procedure ProcesarSumaTotal;
    procedure CalcularDescIndirecto;
    procedure ProcesaNuevo;
    procedure InsertarDet(numero : Integer);
    procedure InsertarCotizacionDet(numero : Integer);
    procedure ProcesaCalculos;
    procedure ProcCargaDatosCotizacion;

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
    Function VerificaLimiteCredito(codigocte:integer;MontoVenta:Real):Boolean;
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
    procedure ActualizaVentaMaster;
    procedure ActualizaFactura;
    procedure ActualizaFactPendiente;
    procedure ActualizaTransCxc;
    procedure ActualizaBalanceCteCxc;
    procedure InicializaOtrosDesc;
    procedure CrearNCreditoEnDevolucion;

    procedure ProcInsDetalleOrden(num :integer);
    procedure ProcCargarDatosOrden;
    
  public
  end;

Const
  FormaPagoNotaDebito = 6;//Devolucion
  TipoPagoFactura = 7;//Factura-Credito
  //PORC_TRANSP_ITBIS = 16/1.16;//13.79;
var
  frmCrearOrdenCompra: TfrmCrearOrdenCompra;
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
  NoTieneCredito :  boolean = False;
  CantUnidad : Real;
  InactivaImprecibo : Boolean;
  noExiste : Boolean;
  sqlAsignado : Boolean;
  PrecioCambio : Boolean;
  cPrecio, aPrecio, PORC_TRANSP_ITBIS : Extended;
  EsModificandoFactura : boolean;
  ExpExcel : Boolean;
  EsReimprimirContado : Boolean;
  strCodAuxi:string;
  presEnter : Boolean;
  xCodSel : integer;
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
  UQckFactCredArtioffice8_5_F_1, UFormTransCxcDbCr_r,
  UDatmodDatosGenerales, uSelSingleFechaOpc,
  UFormImpordenCompras, UFormConsultaOrden, UFormRecibirOrdenes,
  UBuscarProveedores, UDatModProveedor, UFormProveedores,
  UDatModRegOpeDiaria, USetClaveMaestra;

{$R *.dfm}

  function esNumero(valor:String):Boolean;
  begin
    if (Valor[1] =  '0') or (Valor[1] =  '1') or (Valor[1] =  '2')
    or (Valor[1] =  '3') or (Valor[1] =  '4') or (Valor[1] =  '5')
    or (Valor[1] =  '6') or (Valor[1] =  '7')
    or (Valor[1] =  '8') or (Valor[1] =  '9') then
    result:= True else result:= False;
  end;

procedure TfrmCrearOrdenCompra.BitBtn4Click(Sender: TObject);
var
 informa : boolean;
begin
 informa:=false;
 if (rxVenta.RecordCount = 0) then exit;
 if tablaPropietarioCodigoPropietario.IsNull And (rxVenta.RecordCount >0) then
 begin
   MessageDlg('Favor indicar Proveedor.', mtError, [mbOk], 0);
   Exit;
 end;

  if EsModificandoFactura then
  begin
    dmdatos.qryOrdenMaster.Close;
    dmdatos.qryOrdenMaster.Params[0].Value := ExtraerFecha(dmdatos.qryViewOrdenCompMastFECHA.Value);
    dmdatos.qryOrdenMaster.Params[1].Value := ExtraerFecha(dmdatos.qryViewOrdenCompMastFECHA.Value);
    dmdatos.qryOrdenMaster.Open;
    if dmdatos.qryOrdenMaster.Locate('NUM_ORDEN;NUMERO',varArrayOf([
    dmdatos.qryViewOrdenCompMastNUM_ORDEN.Value,dmdatos.qryViewOrdenCompMastNUMERO.Value]),[]) then
    begin
      dmdatos.qryOrdenMaster.Edit;
      dmdatos.qryOrdenMasterFECHA_MOD.Value := Now;
      dmdatos.qryOrdenMasterMOD_POR.Value   := strUserName;
      //dmdatos.qryOrdenMasterSTATUS.Value :=
      dmdatos.qryOrdenMasterOBSERVACION.Value:= TotalesComentario.Value;
      dmdatos.qryOrdenMasterMONTO.Value := Totalestotalneto.Value;

      //Asignar valores a estos campos
      {
      dmdatos.qryOrdenMasterserie_tipotrncnt.Value:=  null;//serie tipotrncnt
      dmdatos.qryOrdenMastertasa_itbis.Value:=  null;//tasa itbis
      dmdatos.qryOrdenMastertasa_isr.Value:=  null;//tasa isr
      dmdatos.qryOrdenMastermonto_retener_isr.Value:=  null;//monto retener isr
      dmdatos.qryOrdenMastermonto_retener_itbis.Value:=  null;//monto retener itbis
      }
      
      GlbSalvarQuery(dmdatos.qryOrdenMaster);
      rxVenta.First;
      While Not rxVenta.Eof Do
      begin
        //rxVentaSerieOriginal.Value := dmdatos.qryViewOrdenCompDetSERIE.AsInteger;
        //rxVentaNumeroTrnOriginal.Value := dmdatos.qryViewOrdenCompDetNUMERO.Value;
       if (rxVentaStatus.Value = 'C') then
       begin
         if dmdatos.qryOrdenDet.Locate('SERIE;numero',VarArrayOf([rxVentaSerieOriginal.Value,rxVentaNumeroTrnOriginal.Value]),[]) then
         begin
           dmdatos.qryOrdenDet.Delete;
           GlbSalvarQuery(dmdatos.qryOrdenDet);
         end;
       end else
       if (rxVentaStatus.Value = 'I') then
       begin
         ProcInsDetalleOrden(dmdatos.qryViewOrdenCompMastNUMERO.Value);
       end else
       begin
        if dmdatos.qryOrdenDet.Locate('SERIE;numero',VarArrayOf([rxVentaSerieOriginal.Value,rxVentaNumeroTrnOriginal.Value]),[]) then
        begin
          informa:=true;
          dmdatos.qryOrdenDet.Edit;
          dmdatos.qryOrdenDetCOD_SERV_PROD.Value:= rxVentaCodArticulo.Value;
          dmdatos.qryOrdenDetCANTIDAD.Value := rxVentaCant.Value;
          dmdatos.qryOrdenDetVALOR.Value    := rxVentaMontoBruto.Value;
          dmdatos.qryOrdenDetSTATUS.Value   := rxVentaStatus.Value;
          dmdatos.qryOrdenDetMOD_POR.Value  := strusername;
          dmdatos.qryOrdenDetFECHA_MOD.Value:= now;
          dmdatos.qryOrdenDetIDUNIDAD.Value := rxVentaTipoUnidad.Value;
          dmdatos.qryOrdenDetITBI_DET.Value := rxVentaItbi.Value;
          dmdatos.qryOrdenDetPRECIO.Value   := rxVentaPrecio.Value;
          dmdatos.qryOrdenDetPORC_DESC_DET.Value   := rxVentaporc_desc.Value;
          dmdatos.qryOrdenDetCOD_USUARIO_CREA.Value:= VarUsuarioGlb;
          dmdatos.qryOrdenDetMONTO_DESCUENTO.Value := rxVentaMontoDescuento.Value;
          GlbSalvarQuery(dmdatos.qryOrdenDet);
        end;
       end;
       rxVenta.Next;
      end;
    end;
    LimpiarDatos;
    if informa then
    Messagedlg('Orden Modificada.', mtinformation,[mbok],0);
    Exit;
  end;//fin modificar orden

  if rxVenta.RecordCount = 0 then
  begin
    Messagedlg('No hay datos para guardar',mtinformation,[mbok],0);
    exit;
  end;
  //dmdatos.stpInsOrdenMast.Params[0].Value:= //out NUMERO
  dmdatos.stpInsOrdenMast.Params[1].Value:= tablaPropietarioCodigoPropietario.Value; //CODIGO PROVEEDOR
  dmdatos.stpInsOrdenMast.Params[2].Value:= ExtraerFecha(rxVentaFecha.Value);//FECHA
  dmdatos.stpInsOrdenMast.Params[3].Value:= null;//FPAGO
  dmdatos.stpInsOrdenMast.Params[4].Value:= null;//COD_CAJA_CHICA
  dmdatos.stpInsOrdenMast.Params[5].Value:= null;//CODIGO BANCO
  dmdatos.stpInsOrdenMast.Params[6].Value:= null;//CTA BANCO
  dmdatos.stpInsOrdenMast.Params[7].Value:= 'ORDEN PEDIDO'; //OBSERVACION
  dmdatos.stpInsOrdenMast.Params[8].Value:= TotalestotalNeto.Value; //MONTO
  dmdatos.stpInsOrdenMast.Params[9].Value:= 'A'; //STATUS
  dmdatos.stpInsOrdenMast.Params[10].Value:= StrUserName; //IN POR
  dmdatos.stpInsOrdenMast.Params[11].Value:= Now;//FECHA IN
  dmdatos.stpInsOrdenMast.Params[12].Value:= null;//MODNPOR
  dmdatos.stpInsOrdenMast.Params[13].Value:= null;//FECJA_MOD
  dmdatos.stpInsOrdenMast.Params[14].Value:= null;//TIPO_INV
  dmdatos.stpInsOrdenMast.Params[15].Value:= null;//STATUS_cnt
  dmdatos.stpInsOrdenMast.Params[16].Value:= null;//NUM_ORDEN
  dmdatos.stpInsOrdenMast.Params[17].Value:= null;//STATUS_ORDEN
  dmdatos.stpInsOrdenMast.Params[18].Value:= null;//AREA_ORDEN
  dmdatos.stpInsOrdenMast.Params[19].Value:= qryProvCOD_VENDEDOR.Value;//AREA_ORDEN

  //Pendiente: Procesar valores
  dmdatos.stpInsOrdenMast.Params[20].Value:=  null;//serie tipotrncnt
  dmdatos.stpInsOrdenMast.Params[21].Value:=  null;//tasa itbis
  dmdatos.stpInsOrdenMast.Params[22].Value:=  null;//tasa isr
  dmdatos.stpInsOrdenMast.Params[23].Value:=  null;//monto retener isr
  dmdatos.stpInsOrdenMast.Params[24].Value:=  null;//monto retener itbis
  dmdatos.stpInsOrdenMast.ExecProc;

  if not dmdatos.stpInsOrdenMast.Transaction.InTransaction then
  dmdatos.stpInsOrdenMast.Transaction.StartTransaction;
  try
    dmdatos.stpInsOrdenMast.Transaction.CommitRetaining;
  except
  dmdatos.stpInsOrdenMast.Transaction.RollbackRetaining;
  end;        
  rxVenta.First;
  While not rxVenta.Eof Do
  begin
    ProcInsDetalleOrden(dmdatos.stpInsOrdenMast.Params[0].Value);
    rxVenta.Next;
  end;

  //if not dmdatos.stpInsOrdenMast.

  BitBtn16Click(Self);
  Totales.Close;
  Totales.Open;
  tablaPropietario.Close;
  tablaPropietario.Open;
  Refresh;
  Application.ProcessMessages;
end;



procedure TfrmCrearOrdenCompra.ProcActUltTrn;
begin
  stpProcBuscarUltNum.Params[2].Value := glbCia_Key; 
  stpProcBuscarUltNum.ExecProc;
  RxLabel1.Caption:='Ult. #Fact:'+ stpProcBuscarUltNum.params[1].AsString;
  RxLabel2.Caption:='Ult. #Trans:'+ stpProcBuscarUltNum.params[0].AsString;
end;

procedure TfrmCrearOrdenCompra.FormCreate(Sender: TObject);
begin
  //Ancho := 800;//1366;//1280; // Ancho del diseño
  //Alto  := 600;//768
{  Height := Height * Screen.Height Div Alto;
  Width := Width * Screen.Width Div Ancho;
  ScaleBy(Screen.Width, Ancho);
 }
  strCodAuxi:='';
  if GlbActF10CodBarra = 1 then
  begin
    imbBarcode.Visible := True;
    LectorCodBarra1.Checked := imbBarcode.Visible;
  end else
  begin
    imbBarcode.Visible := False;
    LectorCodBarra1.Checked := imbBarcode.Visible;
  end;
  qryProv.Close;
  qryProv.Open;
  sqlAsignado:=False;
  sumarDatos :=True;
  GlbImprimeReciboFact:=1;
  InactivaImprecibo   :=False;
  cboxTipoUnidad.Clear;
  AbrirUnidades;
  {
  dmInventario.qryTipoUnidad.close;
  dmInventario.qryTipoUnidad.Open;
  dmInventario.qryTipoUnidad.First;
  While Not dmInventario.qryTipoUnidad.Eof Do
  begin
    cboxTipoUnidad.Items.Add(dmInventario.qryTipoUnidadDESCRIPCION.Value);
    dmInventario.qryTipoUnidad.Next;
  end;   }
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
  dmUsuarios.qryEmpleados.Locate('CODIGO',GlbcodVendedor,[]);
  Label12.Caption:= dmUsuarios.qryEmpleadosNOMBRE.Value;
  Totales.Close;
  Totales.Open;
  Totales.Insert;
  TotalesSubTotal.Value:=0;
  Totalesitbis.Value:=0;
  Totalesmontodesc.Value:=0;
  Totalestotalneto.Value:=0;
  Totalesmontorecibido.Value:=0;
  Totalesdevolucion.Value:=0;
  Totales.Post;
  lblProcDev.Visible := False;

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
      try
      SecretPanel1.Lines.Add(qryVenceDESCRIPCION_PRODUCTO.Value+' - '+
      qryVenceDIASPORVENCER.AsString);
      except
      end;
      qryVence.Next;
    end;
    SecretPanel1.Visible:=True;
    SecretPanel1.Active :=True;
  end;
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
end;
procedure TfrmCrearOrdenCompra.InicializaOtrosDesc;
begin
  dmfactura.stpInsertPorcOtrosCargosFServ.Params[1].Value := 0;
  dmfactura.stpInsertPorcOtrosCargosFServ.Params[2].Value := 0;
  dmfactura.stpInsertPorcOtrosCargosFServ.Params[3].Value := 0;
  dmfactura.stpInsertPorcOtrosCargosFServ.Params[4].Value := 0;
  dmfactura.stpInsertPorcOtrosCargosFServ.Params[5].Value := 0;
  dmfactura.stpInsertPorcOtrosCargosFServ.Params[6].Value := 0;
end;

procedure TfrmCrearOrdenCompra.edtCodigoChange(Sender: TObject);
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
      qryProdPorProveedor.params[1].Value:= glbCia_Key;
      qryProdPorProveedor.Open;
      dmInventario.qryTipoUnidad.Close;
      dmInventario.qryTipoUnidad.Open;
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
      qryProdPorProveedor.params[1].Value:= glbCia_Key;
      qryProdPorProveedor.Open;    
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

procedure TfrmCrearOrdenCompra.edtCodigoExit(Sender: TObject);
var
  numero : Integer;
  FExiste : Boolean;
begin
  if (edtcodigo.Text = '') then Exit;
  if (Length(edtcodigo.Text) > 0) And (qryProductosCodigo_Texto.Value <> edtCodigo.Text) And ( noExiste ) then
  begin
    MessageDlg('Código producto no encontrado, verifique', mtInformation, [mbOK], 0);
  if Not Assigned(frmCrearOrdenCompra) Then
    edtCodigo.SetFocus;
    Exit;
  end;
  MontoItbisEnPrecio:=0;
  if (edtCodigo.Text = '') then Exit;
  Edit1.Text:='';
  PrecioCambio:=False;
  if reciboImpreso then
  Totales.EmptyTable;

  reciboImpreso :=False;
  //if panel2.Visible  then
  //edtCodigo.Text := qryProductosCodigo_Texto.Value;
  if BuscandoPorDesc then
  begin
    Panel2.BringToFront;
    Panel2.Visible:=True;
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
      qryProdPorProveedor.params[1].Value:= glbCia_Key;
      qryProdPorProveedor.Open;

      //Temp LlenarTipoUnidadBox(qryProductosTipo_Unidad.Value);

      if (qryProductosTipo_Unidad.value >0) or (Not qryProductosTipo_Unidad.IsNull) then
      begin
        dmInventario.qryTipoUnidad.Locate('IDUNIDAD', qryProductosTipo_Unidad.value,[]);
        cboxTipoUnidad.Text := dmInventario.qryTipoUnidadDescripcion.value;
      end;

      if qryVence.Locate('codigo_texto', qryProductosCodigo_Texto.Value,[loCaseInsensitive]) then
      begin
        rxLabelVence.Visible:= true;
        rxLabelVence.Caption:='Vence en ' + qryVenceDIASPORVENCER.AsString;
      end else rxLabelVence.Visible:= False;

      //panel2.Top := edtcodigo.Top + 30;
      panel2.Left:= edtcodigo.Left;
      panel2.Visible := True;
      panel2.BringToFront;
    end
  end else
  begin
    BuscandoPorDesc:= True;
    sqlAsignado    := False;
    AsignarSqlText('descripcion',chr(39) + edtCodigo.Text +'%'+chr(39),'');
    if qryProductos.Locate('Descripcion',edtCodigo.Text,[loCaseInsensitive, loPartialKey]) then
    begin
      qryProdPorProveedor.Close;
      qryProdPorProveedor.Params[0].Value:= qryProductosCODIGO.Value;
      qryProdPorProveedor.params[1].Value:= glbCia_Key;
      qryProdPorProveedor.Open;
      //LlenarTipoUnidadBox(qryProductosTipo_Unidad.Value);
      dmInventario.qryTipoUnidad.Locate('IDUNIDAD',qryProductosTipo_Unidad.value,[]);
      cboxTipoUnidad.Text:=dmInventario.qryTipoUnidadDescripcion.value;

      if qryVence.Locate('Codigo_Texto',qryProductosCodigo_Texto.Value,[loCaseInsensitive]) then
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
    if imbBarcode.Visible then
    if Not qryProductos.Locate('codigo_barra', edtCodigo.Text,[loCaseInsensitive]) then
    Prod_existe:= False;
    if not Prod_existe then
    if qryProductos.Locate('codigo', edtCodigo.Text,[loCaseInsensitive]) then
    Prod_existe:= True;
  end else
  begin
    if imbBarcode.Visible then
    if Not qryProductos.Locate('codigo_barra', edtCodigo.Text,[loCaseInsensitive]) then
    Prod_existe:= False;
    if not Prod_existe then    
    if qryProductos.Locate('codigo_Texto', edtCodigo.Text,[loCaseInsensitive]) then
    Prod_existe:= False;//qryProductoscodigo_texto.value
  end;

  {if Not qryProductos.Locate('codigo_Texto', edtCodigo.Text,[]) then
  begin
    //MessageDlg('Codigo no encontrado, verifique', mtError, [mbOK], 0);
    //edtCodigo.SetFocus;
    Prod_existe:=False;
  end else
  }
  if Prod_existe then
  begin
    Prod_existe:= True;
    qryInventario.Locate('CODIGO', qryProductosCodigo.Value,[loCaseInsensitive]);

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
      recuperando:=False;
      rxVenta.Append;
      rxVentaStatus.Value:= 'A';
      rxVentaSerie.Value:=Numero;
      if EsModificandoFactura then
      rxVentaStatus.Value:='I';

      RxSpeedButton1.Visible:=True;
      rxVentaCant.Value := 1;
      rxVentaTipoUnidad.Value :=1;
      rxVentaInvetariar.Value :=qryProductosINVENTARIAR.Value;
      rxVentaIDTasaItbis.Value:=qryProductosidtasaitbis.value;
      rxVentaSerie.Value := Numero;
      rxVentaFecha.Value := ExtraerFecha(GlbFechaTrnDiaria);
      if (GlbcodVendedor > 0) then
      rxVentaCodUsuario.Value := GlbcodVendedor
      else
      rxVentaCodUsuario.Value := VarUsuarioGlb;
    end else
    begin
      if rxVentaSerie.Value = 0 then
      begin
        rxVentaSerie.Value:=1;
        numero := 1;
        recuperando:=False;
        rxVentaStatus.Value:= 'A';
        rxVentaSerie.Value:=Numero;
        if EsModificandoFactura then
        rxVentaStatus.Value:='I';

        RxSpeedButton1.Visible:=True;
        rxVentaCant.Value := 1;
        rxVentaTipoUnidad.Value:=1;
        rxVentaInvetariar.Value:= qryProductosINVENTARIAR.Value;
        rxVentaSerie.Value := Numero;
        rxVentaFecha.Value := ExtraerFecha(GlbFechaTrnDiaria);
        if (GlbcodVendedor > 0) then
        rxVentaCodUsuario.Value := GlbcodVendedor
        else
        rxVentaCodUsuario.Value := VarUsuarioGlb;
        end;
      end;

    if rxVenta.State In [dsInsert, dsEdit] then
    begin
      rxVentaDescripcion.Value:= qryProductosDESCRIPCION.Value;
      rxVentaItbisExento.Value:= qryProductosPAGA_ITBI.Value;
      rxVentaReferencia.Value := qryProductosREFERENCIA.Value;
      if (qryClienteUSARLEVELPRECIO.IsNull) or (qryClienteUSARLEVELPRECIO.Value <= 0) then
      RxSpinEdit1.Value:=qryProductosUSARLEVELPRECIO.AsInteger;
      rxVentaCodArticulo.Value:= qryProductoscodigo.Value;
      rxVentaCodTexto.Value   := edtCodigo.Text;

        rxVentaPrecio.Value:= qryProductosPRECIO_COMPRA.Value;
        //temporal dic 8 2017
        //if GlbTipoUnidad = 1 then
        //  rxVentaPrecio.Value  := qryProductosPRECIO_COMPRA.Value
        //  else
        //  if  precioXUnidad(GlbTipoUnidad,qryProductoscodigo.Value) > 0 then  // qryProductosPRECIO_TIPO_UNIDAD.Value > 0 then
        //  rxVentaPrecio.Value  := precioXUnidad(GlbTipoUnidad,qryProductoscodigo.Value)
        //  else
        //  begin
        //    rxVentaPrecio.Value  := qryProductosPRECIO_COMPRA.Value;
        //   cboxTipoUnidad.ItemIndex:=0;
            //MessageDlg('Precio no configurado para tipo unidad, verifique', mtError, [mbok],0);
        // end;


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

procedure TfrmCrearOrdenCompra.ProcesaNuevo;
var
  numero : Integer;
begin
  if rxVenta.State In [dsInsert, dsEdit] then
  begin
    if (rxVentaCodArticulo.IsNull) Or (rxVentaCant.IsNull) Or (rxVentaPrecio.IsNull) then
    begin
      //if frmProcVentaRapida.Showing then
      if isShowing then
      edtCodigo.SetFocus
    end else
    //Exit;
    if not rxVentaSerie.IsNull then
    rxVenta.Post;
  end;
  rxVenta.DisableControls;
  if (rxVenta.RecordCount > 0) then
  begin
    rxVenta.Last;
    numero := rxVentaSerie.Value + 1;
  end else numero:=1;
  rxVenta.EnableControls;
  recuperando:=False;
  rxVenta.Append;
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

procedure TfrmCrearOrdenCompra.BitBtn1Click(Sender: TObject);
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

procedure TfrmCrearOrdenCompra.BitBtn3Click(Sender: TObject);
begin
  if rxVenta.RecordCount > 0 then
  begin
    if VerificaClave then
    begin
      if MessageDlg('Cancelar Venta?', mtInformation, [mbYes, mbNo], 0)= mrYes then
      begin
        rxVenta.Close;
        rxVenta.EmptyTable;
        rxVenta.Open;
        imbBarcode.Visible    := LectorCodBarra1.Checked;
        Totales.EmptyTable;
        ActualizarRecoverData;
        EsModificandoFactura:=False;
        bitBtnEditarFact.Visible:=False;
        bitBtnEditarFact.SendToBack;
        Label36.Visible:=False;
        ActivarBotonesEnModifica;
        tablaPropietario.Close;
        tablaPropietario.Open;
      end;
    end;
  end;
end;

procedure TfrmCrearOrdenCompra.DBEdit1Exit(Sender: TObject);
//var
//  guardarRec : TBookMark;
begin
  if rxVenta.State In [dsInsert, dsEdit] then
  begin
    if rxVentaCant.IsNull then
    rxVentaCant.Value:=1;

    rxVentaDescUnidadMedida.Value:=cboxTipoUnidad.Text;
    {if (rxVentaCant.Value > qryProductosCANTIDAD.Value) and (GlbPermiteVentaInv0 = 0) then
    begin
      MessageDlg('Cantidad venta es mayor que existencia inventario', mtWarning, [mbOK], 0);
      DBEdit1.SetFocus;
      exit;
    end;
    }
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
      if not rxVentaSerie.IsNull then
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

procedure TfrmCrearOrdenCompra.BitBtn2Click(Sender: TObject);
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
    if rxVentaCodArticulo.IsNull Or rxVentaCant.IsNull Or rxVentaPrecio.IsNull then
    rxVenta.Cancel else
        if not rxVentaSerie.IsNull then
    rxVenta.Post;
  end;
  if rxVenta.RecordCount > 0 then
  //  if frmProcVentaRapida.Showing then
  if isShowing then
  Edit1.SetFocus;
  ActualizarRecoverData;
end;

procedure TfrmCrearOrdenCompra.rxVentaAfterPost(DataSet: TDataSet);
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
  strCodAuxi:='';
//  rxVenta.GotoBookmark(GuardarRec);
//  rxVenta.FreeBookmark(GuardarRec);
end;

procedure TfrmCrearOrdenCompra.ProcesarSumaTotal;
var
  monto:Extended;
  itbis, descuento, neto: Extended;
  puerto, linea1, linea2 : String;
begin
  if rxVenta.state <> dsBrowse then Exit;
  rxVenta.DisableControls;
  rxVenta.First;
  Monto:=0; Itbis:=0; Descuento:=0; Neto:=0;
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
    Monto := Monto + rxVentaMontoBruto.Value;
    Itbis := itbis + rxVentaItbi.Value;
    Descuento:= descuento + rxVentaMontoDescuento.Value;
    Neto     := Neto + rxVentaMontoNeto.Value;
    rxVenta.Next;
  end;
  rxVenta.EnableControls;
  Totales.Edit;

  TotalesSubTotal.Value     := Monto;

  Totalesitbis.Value        := Itbis;
  //Es Necesario ?
  //t Totalesmontodesc.Value    := Descuento;
  if EsFactura or EsFinanciamiento then
  begin
    if (Totalesmontorecibido.Value < Neto) then
    Totalestotalneto.Value := Neto - Totalesmontorecibido.Value +
    TotalesMontoInteres.Value +  TotalesMontoSubTotalIndirectos.Value
    else Totalestotalneto.Value   := Totalesmontorecibido.Value - Neto  +
    TotalesMontoInteres.Value +  TotalesMontoSubTotalIndirectos.Value;
  end else Totalestotalneto.Value := Neto + TotalesMontoSubTotalIndirectos.Value;

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

procedure TfrmCrearOrdenCompra.Edit1Exit(Sender: TObject);
var
  x,y : Real;
  //Activa : Boolean;
  svalue : String;
  xvalue : String;
begin

  //Activa:=True;
  if Edit1.text = '' then exit;
  x := StrToFloat(Edit1.Text);

  xvalue := Format('%8.2f', [StrToFloat(Edit1.Text)]);
  svalue := Format('%8.2f', [Totalestotalneto.Value]);
  x:= StrToFloat(xvalue);
  y:= StrToFloat(svalue);

  //if (xvalue = svalue) then
  //Activa:=True
  //else
  //if ((x - y) > 0 ) then
  //begin
  //  Activa := False;
  //end else Activa := True;

  x := StrToFloat(xvalue) - StrToFloat(svalue);
  Totales.Edit;
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

procedure TfrmCrearOrdenCompra.edtCodigoEnter(Sender: TObject);
begin
  edtCodigo.Enabled:=True;
  edtCodigo.SelectAll;
end;

procedure TfrmCrearOrdenCompra.FormKeyDown(Sender: TObject; var Key: Word;
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
  else if (key = 117) then //F6
  CheckBox1.checked:=  CheckBox1.checked;
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

procedure TfrmCrearOrdenCompra.rxVentaBeforePost(DataSet: TDataSet);
begin
  if rxVentaCant.IsNull or rxVentaPrecio.IsNull then
  begin
    if rxVentaCant.IsNull then
    rxVentaCant.Value:=1;
    if rxVentaPrecio.IsNull then
    rxVentaPrecio.Value:=0;
    DBEdit1Exit(Self);
  end;
end;

procedure TfrmCrearOrdenCompra.BitBtn5Click(Sender: TObject);
begin
  EsModificandoFactura:= Label36.Visible;
  if rxVenta.state = dsbrowse then
  begin
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
      end;
    end else
    //if VerificaClave then
    //begin
      if MessageDlg('Borrar item No.' + rxVentaSerie.AsString + '?', mtWarning, [mbYes, mbNO], 0)= mrYes then
      begin
        EliminarRecoverData;
        rxVenta.Delete;
        ProcesarSumaTotal;
      end;
    //end;
  end;
end;

procedure TfrmCrearOrdenCompra.Inventario1Click(Sender: TObject);
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

procedure TfrmCrearOrdenCompra.CuadreCaja1Click(Sender: TObject);
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

procedure TfrmCrearOrdenCompra.InsertarDet(numero : Integer);
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
end;

procedure TfrmCrearOrdenCompra.Ayuda1Click(Sender: TObject);
begin
  //ShellExecute(frmProcVentaRapida.Handle,nil,PChar('C:\Proyectos\PointSaleSoftGold\PuntoVenta\ManualOnline.html'),'','',SW_SHOWNORMAL);
end;

procedure TfrmCrearOrdenCompra.ImprimirRecibo1Click(Sender: TObject);
begin
  ImprimirRecibo1.Checked:= Not ImprimirRecibo1.Checked;
end;

procedure TfrmCrearOrdenCompra.BitBtn6Click(Sender: TObject);
  var
     Serie_Asignadoncf : Integer;
     serieDoc : Integer;
     valorNCF : String;
     ShowNcfVentana:Boolean;
begin
 
end;

procedure TfrmCrearOrdenCompra.BuscarCliente1Click(Sender: TObject);
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

procedure TfrmCrearOrdenCompra.InsertarCotizacionDet(numero: Integer);
begin

end;

procedure TfrmCrearOrdenCompra.ProcesaCalculos;
var
  porItbi: Real;
begin
  if (rxVentaStatus.Value = 'C') then exit;
  rxVenta.AutoCalcFields:=False;

  if (rxVentaCodArticulo.Value <> qryProductosCODIGO.Value) then
  qryproductos.Locate('codigo', rxVentaCodArticulo.Value,[]);
  qryInventario.Locate('CODIGO_TEXTO', qryProductosCODIGO_TEXTO.Value,[loCaseInsensitive]);

  if rxVenta.State In [dsEdit, dsInsert] then
  begin
    rxVentaMontoBruto.Value:= rxVentaCant.Value * rxVentaPrecio.Value;
    if EsDevolucion then
    rxVentaMontoBruto.Value:= rxVentaMontoBruto.Value * -1;

    porItbi := FGlbPorcItbi(ExtraerFecha(rxVentaFecha.Value), rxVentaCodArticulo.Value);
    if qryInventarioporcitbis.Value > 0 then
    porItbi:=qryInventarioporcitbis.Value;
    if chkExento.Checked then
    begin
      porItbi := 0;
      rxVentaItbisExento.Value := 1;
    end;

    if Not EsDevolucion then
    rxVentaPorc_Desc.Value := qryProductosPORC_DESCUENTO.Value;

    PORC_TRANSP_ITBIS := FGlbPorcItbi(ExtraerFecha(rxVentaFecha.Value), rxVentaCodArticulo.Value)/
                       (1+FGlbPorcItbi(ExtraerFecha(rxVentaFecha.Value),rxVentaCodArticulo.Value)/100);

    if qryInventarioporcitbis.Value > 0 then
    PORC_TRANSP_ITBIS := qryInventarioporcitbis.Value/
                       (1+qryInventarioporcitbis.Value/100);

    //Transparentar el ITBIS
    if (qryInventarioPAGA_ITBI.Value = 1) And
       ((rxVentaPorc_Desc.Value = 0) Or rxVentaPorc_Desc.IsNull ) And
       (GlbTransparentaITBI = 1) And
       (Not chkExento.Checked) Then
    rxVentaPorc_Desc.Value := PORC_TRANSP_ITBIS;
    //End transparentar itbis

    //t if rxVentaPorc_Desc.Value > 0 then
    rxVentaMontoDescuento.Value := (rxVentaMontoBruto.Value * rxVentaporc_desc.Value/100);
    //t else
    rxVentaMontoDescuento.Value := 0;

    //temporal esta linea es para probar devoluciones
    //if EsDevolucion then
    //rxVentaMontoDescuento.Value:= rxVentaMontoDescuento.Value * -1;
    //final - temporal esta linea es para probar devoluciones

    //t if (TotalesPorcDesAdicional.Value > 0) then
    //t TotalesMontoDescAdicional.Value:= (rxVentaMontoBruto.Value * TotalesPorcDesAdicional.Value / 100);

    rxVentaMontoNeto.Value := rxVentaMontoBruto.Value - rxVentaMontoDescuento.Value;
    //t - TotalesMontoDescAdicional.Value;
    rxVentaitbi.Value:=0;
    if (qryInventarioPAGA_ITBI.Value = 1) And (Not chkExento.Checked) then
    rxVentaitbi.Value:= (rxVentaMontoNeto.Value * porItbi / 100);

    //temporal esta linea es para probar devoluciones
    //if EsDevolucion then
    //rxVentaitbi.Value := rxVentaitbi.Value * -1;
    //temporal esta linea es para probar devoluciones
    if GlbTransparentaITBI = 0 then
    rxVentaMontoNeto.Value:=rxVentaMontoNeto.Value + rxVentaitbi.Value;
    rxVenta.Post;
  end;
  if (TotalesPorcDesAdicional.Value > 0) then
  begin
    Totales.Edit;
    TotalesMontoDescAdicional.Value:= (TotalesSubTotal.Value * TotalesPorcDesAdicional.Value / 100);
    Totales.Post;
    if rxVenta.State = dsBrowse then rxVenta.Edit;
    rxVentaMontoNeto.Value := rxVentaMontoBruto.Value - rxVentaMontoDescuento.Value
                                                  -  TotalesMontoDescAdicional.Value;

    rxVentaitbi.Value:=0;
    if (qryInventarioPAGA_ITBI.Value = 1) And (Not chkExento.Checked) then
    rxVentaitbi.Value:= (rxVentaMontoNeto.Value * porItbi / 100);
    if GlbTransparentaITBI = 0 then
    rxVentaMontoNeto.Value:=rxVentaMontoNeto.Value + rxVentaitbi.Value;
    rxVenta.Post;
  end;
  rxVenta.AutoCalcFields := False;
end;

procedure TfrmCrearOrdenCompra.BitBtn9Click(Sender: TObject);
begin
  frmRecibirOrdenes:=TfrmRecibirOrdenes.Create(Nil);
  try
   frmRecibirOrdenes.Showmodal;
  finally
  frmRecibirOrdenes.Free;
  frmRecibirOrdenes:=Nil;
  end;
  refresh;
  Application.ProcessMessages;
end;

procedure TfrmCrearOrdenCompra.ProcCargaDatosCotizacion;
begin
  rxVentaSerie.Value := frmCotizaciones.ibqryCotizacionDetSERIE.Value;
  rxVentaFecha.Value := ExtraerFecha(GlbFechaTrnDiaria);
  rxVentaCant.Value  := frmCotizaciones.ibqryCotizacionDetCANTIDAD.Value;
  rxVentaPrecio.Value:= frmCotizaciones.ibqryCotizacionDetPRECIO.Value;
  rxVentaporc_desc.Value := frmCotizaciones.ibqryCotizacionDetPORC_DESC_DET.Value;
  rxVentaDescripcion.Value := frmCotizaciones.ibqryCotizacionDetDESCRIPCION.Value;
  rxVentaDescripcionEspecial.Value := frmCotizaciones.ibqryCotizacionDetDescripcionEspecial.Value;
  rxVentaTipoVenta.Value:= frmCotizaciones.ibqryCotizacionDetTIPO_VENTA.Value;
  rxVentaTipoUnidad.Value:=frmCotizaciones.ibqryCotizacionDetTIPO_UNIDAD.Value;
                                
  if qryProductos.Locate('CODIGO',frmCotizaciones.ibqryCotizacionDetCODIGO_PROD.Value,[]) then
  rxVentaCodTexto.Value:= qryProductosCODIGO_TEXTO.Value;

  rxVentaItbisExento.Value:=qryProductosPAGA_ITBI.Value;

  rxVentaReferencia.Value := qryProductosREFERENCIA.Value;
  rxVentaInvetariar.Value:= qryProductosINVENTARIAR.Value;
  rxVentaCodArticulo.Value:= frmCotizaciones.ibqryCotizacionDetCODIGO_PROD.AsInteger;
  if (GlbcodVendedor > 0) then
  rxVentaCodUsuario.Value := GlbcodVendedor
  else
  rxVentaCodUsuario.Value := VarUsuarioGlb;
  ProcesaCalculos;
end;

procedure TfrmCrearOrdenCompra.ProcesaFacturar(tipo : smallint; numdoc:Integer; codcte:Integer);
begin

end;

procedure TfrmCrearOrdenCompra.ActBalaceCteP(operacion:smallint);
var
  Monto:Real;
begin

end;

procedure TfrmCrearOrdenCompra.EditarBalanceP(monto:Real);
begin
  
end;

procedure TfrmCrearOrdenCompra.EditarBalanceP(monto:Real;tipo:Integer);
begin

end;


procedure TfrmCrearOrdenCompra.InsertaBalanceP(monto:Real);
begin

end;

procedure TfrmCrearOrdenCompra.ProcVentaConNCF(tiponcf:String;var ValorNCF:String;var seriedoc:Integer; var serie_asignadoncf : Integer);
begin

end;

procedure TfrmCrearOrdenCompra.MaestroCliente1Click(Sender: TObject);
begin
  frmProveedores:=TfrmProveedores.Create(Self);
  try
    frmProveedores.Showmodal;
  finally
  frmProveedores.Free;
  frmProveedores:=Nil;
  end;
  dtmTransOpeDiaria.tblProveedores.Close;
  //dtmTransOpeDiaria.tblProveedores.params[0].Value:=glbCia_Key;  
  dtmTransOpeDiaria.tblProveedores.Open;
end;

procedure TfrmCrearOrdenCompra.RxDBGrid2DblClick(Sender: TObject);
begin
  //edtCodigo.Text:= frmProcVentaRapida.rxqryInvCodigo_texto.Value;
  edtCodigo.Text := qryProductosCodigo.AsString;
  panel2.Visible := False;
  Prod_existe    := True;
  BuscandoPorDesc:=false;
  //t DBEdit1.SetFocus;
  if Assigned(frmCrearOrdenCompra) Then
  RxDBLookupCombo5.SetFocus;
  //cboxTipoUnidad.SetFocus;
  edtCodigoExit(Self);
end;

procedure TfrmCrearOrdenCompra.DBEdit1Enter(Sender: TObject);
begin
  yNumSerie:= rxVentaSerie.Value;
  if Not Prod_existe and ((rxVenta.State in [dsEdit, dsInsert]) or (rxVenta.RecordCount > 0)) then
  begin
    if qryProductos.Locate('codigo_Texto', rxVentaCodTexto.Value,[loCaseInsensitive]) then
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

procedure TfrmCrearOrdenCompra.BitBtn10Click(Sender: TObject);
begin
  if (rxVenta.RecordCount >  0) then
  begin
    Totales.Edit;
    rxVenta.Edit;
    DBEdit5.SetFocus;
  end;
end;

procedure TfrmCrearOrdenCompra.DBEdit5Exit(Sender: TObject);
begin
  if Totales.State in [dsedit, dsinsert] then
  begin
    ProcesaCalculos;
    if Totales.State in [dsedit, dsinsert] then
    Totales.Post;
  end;

end;

procedure TfrmCrearOrdenCompra.BitBtn11Click(Sender: TObject);
var
  frecuencia:string;
  serieDoc:Integer;
  muestraVentana:boolean;
begin
  
end;

function TfrmCrearOrdenCompra.FncFrecuencia(Frec: Integer): String;
begin
  case Frec of
  30 : result:='Mes(es)';
  15 : result:='Quincena(s)';
  07 : result:='Semana(s)';
  01 : result:='Dia(s)';
  else Result:= 'tiempo ind';
  end;
end;

procedure TfrmCrearOrdenCompra.BitBtn12Click(Sender: TObject);
var
 serieDoc:Integer;
 frecuencia:string;
 ValorNCF : String;
 serie_asignadoncf : Integer;
 xgenNcf : Boolean;
begin
    
end;

procedure TfrmCrearOrdenCompra.MostrarVistaproductos1Click(Sender: TObject);
begin
  MostrarVistaproductos1.Checked := Not MostrarVistaproductos1.Checked;
end;

procedure TfrmCrearOrdenCompra.edtReferenciaChange(Sender: TObject);
begin
  if qryProductos.Locate('referencia', edtReferencia.Text, [loCaseInsensitive, loPartialKey]) then
  begin
    Prod_existe:= True;
    edtCodigo.Text := qryProductosCODIGO.AsSTring;
    //panel2.Top := edtcodigo.Top+30;
    panel2.Left:= edtcodigo.Left;
    panel2.Visible:=True;
    panel2.BringToFront;
  end
end;

procedure TfrmCrearOrdenCompra.edtReferenciaExit(Sender: TObject);
begin
  if Panel2.Visible then
  edtReferencia.Text := qryProductosCodigo_Texto.Value;

  qryProductos.Locate('Referencia', edtReferencia.Text, [loCaseInsensitive, loPartialKey])

end;

procedure TfrmCrearOrdenCompra.NotaCrdito1Click(Sender: TObject);
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

procedure TfrmCrearOrdenCompra.NotaDebito1Click(Sender: TObject);
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

procedure TfrmCrearOrdenCompra.BitBtn14Click(Sender: TObject);
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

procedure TfrmCrearOrdenCompra.DBEdit2Exit(Sender: TObject);
var
  guardarRec : TBookMark;
  porcdes : Extended;
begin
  if rxVenta.State in [dsEdit, dsInsert] then
  if rxVentaPrecio.IsNull then
  rxVentaPrecio.Value:=0;
   cPrecio:= rxVentaPrecio.Value;
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
  //tj   rxVentaPrecio.Value:=rxqryInvPRECIO.Value;
  //tj end; }
  if (aPrecio <> cPrecio) then
  PrecioCambio:=True else PrecioCambio:=False;

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
  if rxVentaCodTexto.Value = '' then Exit; //qryInventarioCODIGO_PROD.VALUE
  if not qryInventario.Locate('CODIGO', rxVentaCodArticulo.Value,[]) then
  MessageDlg('codigo ' + rxVentaCodTexto.Value + ' no encontrado en inventario, verifique', mtError, [mbOK], 0)
  else
  begin
    {
    if (Not FAplicaPrecioMayorista) And (rxVentaPrecio.Value < qryProductosPRECIO_MINIMO.Value)
    And (glbUsaescalaPrecio = 0) then
    begin
      if MessageDlg('Precio es menor que el minimo, continuar?', mtError, [mbYes,mbNo], 0) = mrno then
      begin
        DBEdit2.ReadOnly := False;
        DBEdit2.SetFocus;
        Exit;
      end;
    end;
    }
  end;

  DBEdit2.ReadOnly := True;
  //if frmProcVentaRapida.Showing then
  if isShowing then
  edtCodigo.SetFocus;
end;

function TfrmCrearOrdenCompra.VerificaClave: Boolean;
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
    //LogProcedure('Clave incorrecta: GlbClaveSup='+GlbClaveSup+'Input Clave='+Encriptar(Trim(clave), 2005));
    Result := False;
  end else Result := True;
end;

procedure TfrmCrearOrdenCompra.DBEdit2Enter(Sender: TObject);
begin
  if (GlbNumero > 0) then
  if rxVenta.State = dsbrowse then
  rxVenta.Locate('Serie', GlbNumero,[]);
  DBEdit2.SelectAll;
  aPrecio:= rxVentaPrecio.Value;
end;

procedure TfrmCrearOrdenCompra.chkExentoExit(Sender: TObject);
begin
  if (rxVenta.Recordcount > 1) then
  begin
    SumarDatos := False;
    rxVenta.EnableControls;
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
  end else
  begin
    rxVenta.Edit;
    ProcesaCalculos;
    //rxVenta.Post;
  end;
end;

procedure TfrmCrearOrdenCompra.RxDBGrid2KeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = '#13' then
  RxDBGrid2DblClick(Self);
end;

procedure TfrmCrearOrdenCompra.RxDBGrid2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = 13 then
  RxDBGrid2DblClick(Self);
end;

procedure TfrmCrearOrdenCompra.AsignarSqlText(campo, valor,
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

procedure TfrmCrearOrdenCompra.chkExentoEnter(Sender: TObject);
begin
  chkExento.SetFocus;
end;

procedure TfrmCrearOrdenCompra.RxDBGrid2GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if qryProductosCANTIDAD.Value <=5 then
  begin
    BackGround := clYellow;
    aFont.Color := clblack;
  end;
end;

procedure TfrmCrearOrdenCompra.BitBtn15Click(Sender: TObject);
var
  tRecordsDet : integer;
begin

end;

procedure TfrmCrearOrdenCompra.FormShow(Sender: TObject);
begin
  ProcActUltTrn;
  isShowing:=True;
  if (GlbActivaCafeteria = 1) or (GlbActivaProduccion = 1) then
  label26.Visible:=True
  else label26.Visible:=False;
  SkinData1.Active:=False;
  Application.ProcessMessages;
  SkinData1.Active:=True;
  edtCodigo.Enabled:=True;  
end;

procedure TfrmCrearOrdenCompra.RxLabel1Click(Sender: TObject);
begin
  ProcActUltTrn;
end;

procedure TfrmCrearOrdenCompra.ProcVenta(valorNCF:String;Serie_Asignadoncf:Integer; Var serieDoc:Integer);
begin

end;

procedure TfrmCrearOrdenCompra.LectorCodBarra1Click(Sender: TObject);
begin
  LectorCodBarra1.Checked:= Not LectorCodBarra1.Checked;
  if lectorcodbarra1.Checked then
  edtCodigo.Hint:='Enter - para buscar codigo barra. F10-on/off'
  else edtCodigo.Hint:= '';
  imbBarcode.Visible := LectorCodBarra1.Checked;  
end;

procedure TfrmCrearOrdenCompra.Edit1Enter(Sender: TObject);
begin
  if (Totalestotalneto.Value < 0) then
  begin
    MessageDlg('Total neto no puede ser negativo, verifique',mtError, [mbOK], 0);
    exit;
  end;
end;

procedure TfrmCrearOrdenCompra.ImprimirLabel1Click(Sender: TObject);
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

procedure TfrmCrearOrdenCompra.NoGenerarNCF1Click(Sender: TObject);
begin
  NoGenerarNCF1.Checked := not NoGenerarNCF1.Checked;
  if  NoGenerarNCF1.Checked then
  Label21.Visible := True else
  Label21.Visible := false;
  //CheckBox1.Visible := Not Label21.Visible;
end;

procedure TfrmCrearOrdenCompra.BitBtn16Click(Sender: TObject);
var
  flag:boolean;
  fecha:TDateTime;
  pantalla: Boolean;
begin
 flag:=false;
 frmSelSingleFechaOpc:=TfrmSelSingleFechaOpc.Create(Nil);
 frmSelSingleFechaOpc.FechaIni.DateTime:=GlbFechaTrnDiaria;
 if frmSelSingleFechaOpc.ShowModal = mrOk then
 begin
   fecha:=ExtraerFecha(frmSelSingleFechaOpc.FechaIni.DateTime);
   flag :=True;
   pantalla:=frmSelSingleFechaOpc.RadioButton1.Checked;
 end;
 if flag then
 begin
   frmImpOrden:=TfrmImpOrden.Create(Nil);
   try
     frmImpOrden.ImpPantalla:=pantalla;
     frmImpOrden.qryDatosOrdenAImp.Close;
     frmImpOrden.qryDatosOrdenAImp.Params[0].Value:=ExtraerFecha(fecha);
     frmImpOrden.qryDatosOrdenAImp.Open;
     frmImpOrden.Showmodal;
   finally
   frmImpOrden.Free;
   frmImpOrden:= Nil;
   BitBtn2.Enabled:= False;   
   end;
 end;
 rxVenta.EmptyTable;
 Application.ProcessMessages;
end;

procedure TfrmCrearOrdenCompra.Finalizardisplay;
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

procedure TfrmCrearOrdenCompra.ActualizaInvAlmacen;
begin
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

procedure TfrmCrearOrdenCompra.FormHide(Sender: TObject);
begin
  isShowing:=True;
end;

procedure TfrmCrearOrdenCompra.qryClienteAfterScroll(DataSet: TDataSet);
begin
  AbrirClasifPrecio;
end;

procedure TfrmCrearOrdenCompra.qryProductosAfterScroll(DataSet: TDataSet);
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

procedure TfrmCrearOrdenCompra.AbrirClasifPrecio;
begin
  qryClasifPrecio.Close;//tablaPropietario.RecordCount;
  qryClasifPrecio.Params[0].Value := tablaPropietarioCodigoPropietario.Value;// qryClientePRECIO_ID.Value;
  qryClasifPrecio.Open;
  if qryClasifPrecio.RecordCount > 0 then
  DBEdit6.Color:=clGreen
  else
  DBEdit6.Color:=clWindow;
end;

procedure TfrmCrearOrdenCompra.AplicaPrecioMayorista;
begin
  if rxVenta.state = dsInactive then exit;
  if rxVenta.RecordCount = 0 then exit;
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

    ProcesaCalculos;

    if rxVenta.state in [dsEdit, dsInsert] then
    rxVenta.Post;

    rxVenta.Next;
  end;

  sumarDatos:=True;
  rxVenta.AutoCalcFields := False;
end;

procedure TfrmCrearOrdenCompra.RxDBLookupCombo1Exit(Sender: TObject);
begin
  if xCodSel >= 0 then
  if tablaPropietario.State In [dsEdit, dsInsert] then
  tablaPropietarioCodigoPropietario.Value:=xCodSel;
  xCodSel:=-1; 
  if rxVenta.RecordCount = 0 then Exit;
  AbrirClasifPrecio;
  
  AplicaPrecioMayorista;
  if qryClienteUSARLEVELPRECIO.Value > 0 then
  RxSpinEdit1.Value:= qryClienteUSARLEVELPRECIO.Value;

  if not tablaPropietarioCodigoPropietario.IsNull then
    if qryClienteCOD_VENDEDOR.Value > 0 then
    GlbCodVendedor :=qryClienteCOD_VENDEDOR.Value
    else
    GlbCodVendedor := -1;
    
end;

function TfrmCrearOrdenCompra.VerificaLimiteCredito(codigocte: integer;
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

procedure TfrmCrearOrdenCompra.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (rxVenta.RecordCount > 0) then
  begin
    if VerificaClave then
    begin
      CanClose:= True;
    end;
  end;
end;

procedure TfrmCrearOrdenCompra.RxDBGrid3DblClick(Sender: TObject);
begin
  RxDBGrid3.Visible:=false;
end;

procedure TfrmCrearOrdenCompra.SecretPanel1DblClick(Sender: TObject);
begin
  RxDBGrid3.Visible:= True;
  SecretPanel1.Visible:=False;
end;

procedure TfrmCrearOrdenCompra.NoMostrarProdVencidos1Click(Sender: TObject);
begin
  NoMostrarProdVencidos1.Checked:= not NoMostrarProdVencidos1.Checked;
  if NoMostrarProdVencidos1.Checked then
  begin
    SecretPanel1.Visible:=True;
    SecretPanel1.Active :=True;
  end
  else SecretPanel1.Visible:=False;
end;

procedure TfrmCrearOrdenCompra.rxLabelVenceDblClick(Sender: TObject);
begin
  RxDBGrid3.Visible:= True;
end;




procedure TfrmCrearOrdenCompra.cboxTipoUnidadChange(Sender: TObject);
begin
  {if rxVenta.State In [dsBrowse] Then
  rxVenta.Edit;

  if Not dmInventario.qryTipoUnidad.Locate('DESCRIPCION', rxVentaTipoUnidad.Value, []) then
  begin
    MessageDlg('Unidad no encontrada, verifique.', mtError, [mbOk], 0);
    exit;
  end else
  begin
    //cboxTipoUnidad.Text:=dminventario.qryTipoUnidadDescripcion.Value;
    GlbTipoUnidad := dmInventario.qryTipoUnidadIDUNIDAD.Value;
    CantUnidad:= dminventario.qryTipoUnidadCANTIDAD.Value;
    rxVentaTipoUnidad.Value:= GlbTipoUnidad;

    rxVentaDescUnidadMedida.Value:=cboxTipoUnidad.Text;

    if not qryProductoscodigo.isnull And (Not PrecioCambio ) then
    if (glbUsaescalaPrecio = 0) then
    rxVentaPrecio.Value  := precioXUnidad(GlbTipoUnidad,qryProductoscodigo.value); //qryProductosPRECIO_TIPO_UNIDAD.Value;
    if (rxVentaprecio.Value = 0) And (Not PrecioCambio )then
    begin
      rxVentaPrecio.Value  := qryProductosPRECIO_COMPRA.Value;
      //cboxTipoUnidad.Text:=dminventario.qryTipoUnidadDescripcion.Value;
    end;
  end;
  }
  if rxVenta.State In [dsBrowse] Then
  rxVenta.Edit;

  ProcesaCalculos;

  if rxVenta.State In [dsInsert, dsEdit] Then
  rxVenta.Post;

end;

procedure TfrmCrearOrdenCompra.LlenarTipoUnidadBox(umedida:integer);
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

procedure TfrmCrearOrdenCompra.cboxTipoUnidadExit(Sender: TObject);
begin
  if rxVentaCodTexto.IsNull then exit;
  if not rxVentaDescUnidadMedida.IsNull then
  cboxTipoUnidad.Text := rxVentaDescUnidadMedida.Value;
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
end;

procedure TfrmCrearOrdenCompra.qryInventarioAfterScroll(DataSet: TDataSet);
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

function TfrmCrearOrdenCompra.precioXUnidad(idTipoUnidad:Integer;idProducto: Integer): Extended;
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
      result:=0;
    end;
  end;
end;

procedure TfrmCrearOrdenCompra.Label25Click(Sender: TObject);
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

procedure TfrmCrearOrdenCompra.RxSpeedButton1Click(Sender: TObject);
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

procedure TfrmCrearOrdenCompra.MaestroInventario1Click(Sender: TObject);
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

procedure TfrmCrearOrdenCompra.ImprimirFactura(Avance: Integer);

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


procedure TfrmCrearOrdenCompra.cboxTipoUnidadEnter(Sender: TObject);
begin
  panel2.Visible := False;
end;

procedure TfrmCrearOrdenCompra.DBEdit3Exit(Sender: TObject);
begin
  if (rxVentaMontoBruto.Value = 0) or (rxVentaMontoBruto.IsNull) then
  edtCodigo.SetFocus;
end;

procedure TfrmCrearOrdenCompra.RxDBGrid2Enter(Sender: TObject);
begin
  GlbNumero:= rxVentaSerie.Value;
end;

procedure TfrmCrearOrdenCompra.RxDBGrid2Exit(Sender: TObject);
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

procedure TfrmCrearOrdenCompra.rxVentaAfterScroll(DataSet: TDataSet);
begin
  if rxVentaTipoUnidad.IsNull then Exit;
  if rxVentaTipoUnidad.Value = 0 then exit;
  
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
    qryProdPorProveedor.params[1].Value:= glbCia_Key;
    qryProdPorProveedor.Open;

    if qryProdPorProveedor.RecordCount > 0 then
    pnlPrecioProv.Visible:= True else
    pnlPrecioProv.Visible:= False;
  end;
  //if (dmInventario.qryTipoUnidad.State = dsInactive) then
  AbrirUnidades;
end;

procedure TfrmCrearOrdenCompra.ConsultaGeneral1Click(Sender: TObject);
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

procedure TfrmCrearOrdenCompra.CargarPreventa;
begin
  rxVentaSerie.Value := frmConsultaPreVenta.qryPreventaDetSerie.Value;
  rxVentaFecha.Value := ExtraerFecha(GlbFechaTrnDiaria);
  rxVentaCant.Value  := frmConsultaPreVenta.qryPreventaDetCANTIDAD.Value;
  rxVentaPrecio.Value:= frmConsultaPreVenta.qryPreventaDetPRECIO.Value;
  rxVentaporc_desc.Value := frmConsultaPreVenta.qryPreventaDetPORC_DESC_DET.Value;
  rxVentaDescripcion.Value := frmConsultaPreVenta.qryPreventaDetDESCRIPCION.Value;

  if qryProductos.Locate('CODIGO',frmConsultaPreVenta.qryPreventaDetCODIGO_PROD.Value,[]) then
  rxVentaCodTexto.Value:= qryProductosCODIGO_TEXTO.Value;
  rxVentaReferencia.Value := qryProductosREFERENCIA.Value;
  rxVentaInvetariar.Value:= qryProductosINVENTARIAR.Value;
  rxVentaCodArticulo.Value:= frmConsultaPreVenta.qryPreventaDetCODIGO_PROD.AsInteger;
  rxVentaCodUsuario.Value := frmConsultaPreVenta.qryPreventaMasterCODIGO_VENDEDOR.Value;
  ProcesaCalculos;
end;

procedure TfrmCrearOrdenCompra.ActualizarPreventa;
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

procedure TfrmCrearOrdenCompra.InsertaTransCafeteria(numTrn : Integer;codigoP:Integer;cantP:Real);
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
  if (rxVentaTipoUnidad.Value = 1) Or (rxVentaTipoUnidad.Value = 0) then
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

procedure TfrmCrearOrdenCompra.Label26Click(Sender: TObject);
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

procedure TfrmCrearOrdenCompra.SpeedButton1Click(Sender: TObject);
begin
  if (GlbColegio = 0) then
  begin
    frmProcBuscarProv:=TfrmProcBuscarProv.Create(Nil);
    try
      if frmProcBuscarProv.Showmodal = mrOk then
      begin
        if tablaPropietario.State In [dsBrowse] then
           tablaPropietario.Edit;
        if dmproveedor.qryProveCxp.Locate('CODIGO_CTE', frmProcBuscarProv.xCodigoCte,[]) then
        tablaPropietarioCodigoPropietario.Value:=dmproveedor.qryProveCxpCODIGO_CTE.Value;
     end;
    finally
    frmProcBuscarProv.Free;
    frmProcBuscarProv:=Nil;
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

procedure TfrmCrearOrdenCompra.rdgFactServicioClick(Sender: TObject);
begin
  panelDescripcionServ.Visible:=True;
  if rxVenta.RecordCount = 0 then exit;
  if CheckBox2.Checked then
  CheckBox3.Checked:=False;
  rxVenta.Edit;
  ProcesaCalculos;
end;

procedure TfrmCrearOrdenCompra.rdgFactVentaProductoClick(Sender: TObject);
begin
  //panelDescripcionServ.Visible:=False;
  if rxVenta.RecordCount = 0 then exit;
  if CheckBox2.Checked then
  CheckBox3.Checked:=False;
  rxVenta.Edit;
  ProcesaCalculos;
end;

procedure TfrmCrearOrdenCompra.ProcInsertarRecoverData;
begin

end;

procedure TfrmCrearOrdenCompra.ProcRecoverData(showsms:boolean);
begin

end;

procedure TfrmCrearOrdenCompra.ActualizarRecoverData;
begin

end;

procedure TfrmCrearOrdenCompra.DBMemo1Exit(Sender: TObject);
begin
  if rxVenta.State In [dsEdit, dsInsert] then
  rxVenta.Post;
end;

procedure TfrmCrearOrdenCompra.RecuperarTransacciones1Click(
  Sender: TObject);
begin
  recuperando := true;
  ProcRecoverData(true);
  recuperando := false;
end;

procedure TfrmCrearOrdenCompra.EliminarRecoverData;
begin

end;

procedure TfrmCrearOrdenCompra.EliminarRecoverDataAll;
begin

end;

procedure TfrmCrearOrdenCompra.RxSpinEdit1Change(Sender: TObject);
var
  guardarRec : TBookMark;
begin
  guardarRec := rxVenta.GetBookmark;
  if rxVenta.State = dsBrowse then
  rxVenta.Edit;
  if rxVentaCodArticulo.IsNull then exit;
  {if GlbUsaescalaPrecio =1 then
  begin
    if qryProductos.Locate('Codigo', rxVentaCodArticulo.Value,[]) then
    begin
    case RxSpinEdit1.AsInteger of
         1: begin
              if qryProductosPRECIOVENTA1.Value > 0 then
              rxVentaPrecio.Value  := qryProductosPRECIOVENTA1.Value;
            end;
         2: begin
              if qryProductosPRECIOVENTA2.Value > 0 then
              rxVentaPrecio.Value  := qryProductosPRECIOVENTA2.Value;
            end;
         3:begin
             if qryProductosPRECIOVENTA3.Value > 0 then
             rxVentaPrecio.Value  := qryProductosPRECIOVENTA3.Value;
           end;
         4: begin
              if qryProductosPRECIOVENTA4.Value > 0 then
              rxVentaPrecio.Value  := qryProductosPRECIOVENTA4.Value;
            end;
    end;
    }//case
    //end else
    //MessageDlg('Codigo producto no existe, verifique.', mtError, [mbOk],0);
  //end;
  //if rxVenta.State = dsEdit then
  //rxVenta.Post;

  if rxVenta.state = dsbrowse then
  rxVenta.Edit;
  ProcesaCalculos;

  rxVenta.GotoBookmark(guardarRec);
  rxventa.FreeBookmark(guardarRec);
end;

procedure TfrmCrearOrdenCompra.CalcularDescIndirecto;
var
  x : Integer;
  porItbi : Real;
begin
 
end;

procedure TfrmCrearOrdenCompra.BitBtn18Click(Sender: TObject);
begin
  frmVerDescFactServicio:=TfrmVerDescFactServicio.Create(Nil);
  try
    frmVerDescFactServicio.ShowModal;
  finally
  frmVerDescFactServicio.Free;
  frmVerDescFactServicio:=Nil;
  end;
end;

procedure TfrmCrearOrdenCompra.TotalesCalcFields(DataSet: TDataSet);
begin
  TotalesMontoSubTotalIndirectos.Value  :=
  TotalesMontoDescGastosAdmin.Value  +
  TotalesMontoDescItbisGastosAdmin.Value +
  TotalesMontoDescTransp.Value   +
  TotalesMontoDescDirtecnica.Value +
  TotalesMontoDescItbisDirTecnica.Value +
  TotalesMontoDescImprevisto.Value      +
  TotalesMontoDescItbisImprevisto.Value;
end;

procedure TfrmCrearOrdenCompra.CheckBox2Exit(Sender: TObject);
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

procedure TfrmCrearOrdenCompra.CheckBox3Exit(Sender: TObject);
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

procedure TfrmCrearOrdenCompra.BitBtn19Click(Sender: TObject);
var
  nF : integer;
begin
  nF := StrtoInt(InputBox('Re-Imprimir Factura','Entre #Factura',''));
  ImpFacturaservicio(nf,true);
end;

procedure TfrmCrearOrdenCompra.ExportarGridExcel;
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

procedure TfrmCrearOrdenCompra.BitBtn20Click(Sender: TObject);
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

procedure TfrmCrearOrdenCompra.CargarDatosAModificar;
var
  xDesc : String;
begin
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
    TotalesSubTotal.Value:=0;
    Totalesitbis.Value:=0;
    Totalesmontodesc.Value:=0;
    Totalestotalneto.Value:=0;
    Totalesmontorecibido.Value:=0;
    Totalesdevolucion.Value:=0;
    Totales.Post;
    lblProcDev.Visible := False;
  //end;
  EsModificandoFactura:=True;
  bitBtnEditarFact.Visible := True;
  bitBtnEditarFact.BringToFront;
  Label36.Visible:=True;
  Label36.Caption:='Modificando Factura:'+dmFactura.qryVentaFacturaNUMERO_FACTURA.AsString;
  rxVenta.close;
  rxVenta.open;
  qryProductos.close;
  qryProductos.Open;
  AsignarSqlText('','','');
  dmFactura.qryVentaFacturaDet.First;
  While Not dmFactura.qryVentaFacturaDet.Eof do
  begin    
    if not qryProductos.Locate('Codigo',dmFactura.qryVentaFacturaDetCODIGO_PROD.Value,[]) then
    begin
      MessageDlg(Format('Codigo producto %s no encontrado, verifique.',[dmFactura.qryVentaFacturaDetCODIGO_PROD.AsString]),mtError,[mbOk], 0);
    end;
    rxVenta.Append;
    if dmFactura.qryVentaFacturaDetSTATUS_DET.IsNull then
    rxVentaStatus.Value:= 'A' else
    rxVentaStatus.Value:= dmFactura.qryVentaFacturaDetSTATUS_DET.Value;
    RxSpeedButton1.Visible:= True;
    //if qryProductos.Locate('CODIGO',dmFactura.qryVentaFacturaDetCODIGO_PROD.Value,[]) then
    rxVentaCodTexto.Value:= qryProductosCODIGO_TEXTO.Value;

    rxVentaCodArticulo.Value := dmFactura.qryVentaFacturaDetCODIGO_PROD.AsInteger;
    rxVentaSerieOriginal.Value := dmFactura.qryVentaFacturaDetSERIE.Value;
    rxVentaNumeroTrnOriginal.Value := dmFactura.qryVentaFacturaNUMERO.Value;
    rxVentaSerie.Value := dmFactura.qryVentaFacturaDetSERIE.Value;
    rxVentaFecha.Value := dmFactura.qryVentaFacturaFECHA.Value;
    rxVentaCant.Value  := dmFactura.qryVentaFacturaDetCANTIDAD.Value;
    rxVentaPrecio.Value:= dmFactura.qryVentaFacturaDetPRECIO.Value;
    rxVentaporc_desc.Value := dmFactura.qryVentaFacturaDetPORC_DESC_DET.Value;

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
    rxVentaInvetariar.Value:= qryProductosINVENTARIAR.Value;

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

procedure TfrmCrearOrdenCompra.ActualizaVentaDet;
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
  stpUpdateVentaDetU1.Params[0].Value:=rxVentaSerieOriginal.Value;
  stpUpdateVentaDetU1.Params[1].Value:=rxVentaNumeroTrnOriginal.Value;
  stpUpdateVentaDetU1.Params[2].Value:=rxVentaCodArticulo.Value;
  stpUpdateVentaDetU1.Params[3].Value:=null;
  stpUpdateVentaDetU1.Params[4].Value:=rxVentaDescripcion.Value;
  stpUpdateVentaDetU1.Params[5].Value:=rxVentaCant.Value;
  stpUpdateVentaDetU1.Params[6].Value:=rxVentaPrecio.Value;
  stpUpdateVentaDetU1.Params[7].Value:=rxVentaporc_desc.Value;
  stpUpdateVentaDetU1.Params[8].Value:=rxVentaItbi.Value;
  stpUpdateVentaDetU1.Params[9].Value:=rxVentaMontoBruto.Value;
  stpUpdateVentaDetU1.Params[10].Value:=rxVentaMontoNeto.Value;
  stpUpdateVentaDetU1.Params[11].Value:=rxVentaNumeroFactura.Value;
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

procedure TfrmCrearOrdenCompra.ActualizaVentaMaster;
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
  stpProc_UpdateVENTAS_MAST_U1.Params[5].Value    := dmfactura.qryVentaFacturaFORMA_PAGO.Value;//Credito Normal

  stpProc_UpdateVENTAS_MAST_U1.Params[6].Value    := 'Venta a Credito';
  stpProc_UpdateVENTAS_MAST_U1.Params[7].Value    := dmfactura.qryVentaFacturaMONEDA.Value;
  stpProc_UpdateVENTAS_MAST_U1.Params[8].AsString := Totalestotalneto.AsString; //EditN1.Text;
  stpProc_UpdateVENTAS_MAST_U1.Params[9].Value    := 'A';
  stpProc_UpdateVENTAS_MAST_U1.Params[10].Value   := Now;
  stpProc_UpdateVENTAS_MAST_U1.Params[11].Value   := strusername;
  stpProc_UpdateVENTAS_MAST_U1.Params[12].Value   := dmfactura.qryVentaFacturaNUMERO_FACTURA.Value;
  stpProc_UpdateVENTAS_MAST_U1.Params[13].Value:= dmfactura.qryVentaFacturaNUMERO_DOC_PAGO.Value;
  stpProc_UpdateVENTAS_MAST_U1.Params[14].Value:= dmfactura.qryVentaFacturaSERIE_NCF_ASIGNADO.Value;
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

procedure TfrmCrearOrdenCompra.ActualizaFactura;
begin

end;

procedure TfrmCrearOrdenCompra.ActualizaTransCxc;
begin

end;

procedure TfrmCrearOrdenCompra.ActualizaBalanceCteCxc;
begin

end;

procedure TfrmCrearOrdenCompra.ActualizaFactPendiente;
begin


end;

procedure TfrmCrearOrdenCompra.bitBtnEditarFactClick(Sender: TObject);
var
  numF : integer;
begin
   if not VerificaLimiteCredito(TotalesCodCliente.Value,TotalesTotalNeto.Value) then
   begin
     if NoTieneCredito then
     MessageDlg('Cliente no tiene crédito...', mtWarning, [mbOK], 0)
     else
     MessageDlg('Monto contrato excede limite de crédito, depositar diferencia...',mtWarning, [mbOK], 0);
     Exit;
   end;

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
  ActualizaVentaMaster;
  rxventa.first;
  While Not rxventa.Eof do
  begin
    if (rxVentaStatus.Value = 'C') then
    begin
      //Pendiente
      //Re-Ingresar producto a inventario;
      ibStpActualizaInvProd.Params[0].Value:= rxVentaCodArticulo.Value;
      if (rxVentaTipoUnidad.Value = 1) Or (rxVentaTipoUnidad.Value = 0) then
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
      if (rxVentaTipoUnidad.Value = 1) Or (rxVentaTipoUnidad.Value = 0) then
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
      if (rxVentaTipoUnidad.Value = 1) Or (rxVentaTipoUnidad.Value = 0) then
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
      if (rxVentaTipoUnidad.Value = 1) Or (rxVentaTipoUnidad.Value = 0) then
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
      frmConsultaFacturas.BitBtn1Click(Self);
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


end;
procedure TfrmCrearOrdenCompra.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if (rxVentaStatus.Value = 'C') then
  Background := clGray
  else
  if (rxVentaStatus.Value = 'I') then
  Background := clGreen
  else 
  if (rxVentaPrecio.Value <= 0) then
  Background := clYellow;
end;

procedure TfrmCrearOrdenCompra.BitBtn6MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if Label36.Visible then
  begin
    EsModificandoFactura:=True;
    bitBtnEditarFact.Visible:=True;
    bitBtnEditarFact.BringToFront;
  end;
end;

procedure TfrmCrearOrdenCompra.ActivarBotonesEnModifica;
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

procedure TfrmCrearOrdenCompra.ImpFacturaservicio(numerotrn: Integer;
  EsReimpresion: Boolean);
begin
  frmConsultaFacturas:=TfrmConsultaFacturas.Create(Nil);
  try
    if not EsReimprimirContado then
    frmConsultaFacturas.rdgCredito.Checked:=True;
    frmConsultaFacturas.EditN1.SetInteger(numerotrn);
    if not ExpExcel then
    begin
      frmConsultaFacturas.BitBtn1Click(Self);
      qckFactServIngeservis_N := TqckFactServIngeservis_N.Create(Nil);
      try
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

procedure TfrmCrearOrdenCompra.Label37Click(Sender: TObject);
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

procedure TfrmCrearOrdenCompra.BitBtn21Click(Sender: TObject);
begin
  totales.Edit;
end;

procedure TfrmCrearOrdenCompra.DBEdit7Exit(Sender: TObject);
begin
  if totales.State in [dsEdit, dsInsert] then
  totales.Post;
end;

procedure TfrmCrearOrdenCompra.BitBtn22Click(Sender: TObject);
var
  nf:integer;
begin
  nF := StrtoInt(InputBox('Imprimir conduce','Entre #Factura',stpProcBuscarUltNum.params[1].AsString));
 frmConsultaFacturas:=TfrmConsultaFacturas.Create(Nil);
  try
    frmConsultaFacturas.EditN1.SetInteger(nF);
    if not ExpExcel then
    begin
      frmConsultaFacturas.BitBtn1Click(Self);
      qckFactServIngeservis_NConduce:=TqckFactServIngeservis_NConduce.Create(Nil);
      try
        qckFactServIngeservis_NConduce.Preview;
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
end;

procedure TfrmCrearOrdenCompra.RxDBGrid1Enter(Sender: TObject);
begin
  GlbNumero:= rxVentaSerie.Value;
end;

procedure TfrmCrearOrdenCompra.RxDBGrid1Exit(Sender: TObject);
begin
  GlbNumero:= rxVentaSerie.Value;
end;

procedure TfrmCrearOrdenCompra.CrearNCreditoEnDevolucion;
begin
  exit;//de forma temporal hasta que analice bien
  frmTransCxcProc_R:=TfrmTransCxcProc_R.Create(Nil);
  try
    frmTransCxcProc_R.CodCte := FrmBuscarClientesPersonas.CodigoCliente;
    frmTransCxcProc_R.Pagecontrol1.ActivePage := frmTransCxcProc_R.TabSheet1;
    frmTransCxcProc_R.Pagecontrol1.ActivePageIndex:=0;
    frmTransCxcProc_R.edtMontoAcobrar.SetFloat(Abs(Totalestotalneto.Value));
    //frmTransCxcProc_R.Showmodal;
  finally
  frmTransCxcProc_R.Free;
  frmTransCxcProc_R:=Nil;
  end;
end;

procedure TfrmCrearOrdenCompra.ProcInsDetalleOrden(num : integer);
begin
  dmdatos.stpInsOrdenDet.Params[0].Value:= num;//dmdatos.stpInsOrdenMast.Params[0].Value;//NUMERO
  dmdatos.stpInsOrdenDet.Params[1].Value:= rxVentaCodArticulo.Value;//COD_SERV_PROD
  dmdatos.stpInsOrdenDet.Params[2].Value:= null;//DEPARTAMENTO
  if (rxVentaTipoUnidad.Value = 1) then
  dmdatos.stpInsOrdenDet.Params[3].Value:= rxVentaDescripcion.Value
  else
  dmdatos.stpInsOrdenDet.Params[3].Value:= rxVentaDescripcion.Value+' -'+rxVentaDescUnidadMedida.Value;//OBSERVACION
  dmdatos.stpInsOrdenDet.Params[4].Value:= rxVentaCant.Value;//CANTIDAD
  dmdatos.stpInsOrdenDet.Params[5].Value:= rxVentaMontoBruto.Value;//VALOR
  dmdatos.stpInsOrdenDet.Params[6].Value:= 'A';;//STATUS
  dmdatos.stpInsOrdenDet.Params[7].Value:= strusername;//IN POR
  dmdatos.stpInsOrdenDet.Params[8].Value:= Now;//FECHA IN
  dmdatos.stpInsOrdenDet.Params[9].Value:= null;//MOD POR
  dmdatos.stpInsOrdenDet.Params[10].Value:=null;//FECHA MOD
  dmdatos.stpInsOrdenDet.Params[11].Value:=null;// NUMERO DOC
  dmdatos.stpInsOrdenDet.Params[12].Value:=null;//NUMERO FACTURA
  dmdatos.stpInsOrdenDet.Params[13].Value:=null;// COD CTA CONCEPTO
  dmdatos.stpInsOrdenDet.Params[14].Value:=null;// TIPOSERVICIO
  dmdatos.stpInsOrdenDet.Params[15].Value:=null;//SUBTIPOSERV
  dmdatos.stpInsOrdenDet.Params[16].Value:=null;//NOSEIRE RES
  dmdatos.stpInsOrdenDet.Params[17].Value:=null;//CODIGO CONDUCTOR
  dmdatos.stpInsOrdenDet.Params[18].Value:=null;//CODIGO SERVCOSTO
  dmdatos.stpInsOrdenDet.Params[19].Value:=rxVentaPrecio.Value;//PRECIO
  dmdatos.stpInsOrdenDet.Params[20].Value:=Null;//AREA ORDEN
  dmdatos.stpInsOrdenDet.Params[21].Value:=rxVentaItbi.Value;//ITBI DET
  dmdatos.stpInsOrdenDet.Params[22].Value:=rxVentaporc_desc.Value;//PORC DESC DET
  dmdatos.stpInsOrdenDet.Params[23].Value:=rxVentaMontoDescuento.Value;//MONTO DESCUNEOT
  dmdatos.stpInsOrdenDet.Params[24].Value:=rxVentaTipoUnidad.Value;//MONTO DESCUNEOT
  dmdatos.stpInsOrdenDet.Params[25].Value:=null;//cod_usuario_recibe
  dmdatos.stpInsOrdenDet.Params[26].Value:=VarUsuarioGlb;//cod_usuario_crea
  dmdatos.stpInsOrdenDet.ExecProc;

  if not dmdatos.stpInsOrdenDet.Transaction.InTransaction then
  dmdatos.stpInsOrdenDet.Transaction.StartTransaction;
  try
    dmdatos.stpInsOrdenDet.Transaction.CommitRetaining;
  except
  dmdatos.stpInsOrdenDet.Transaction.RollbackRetaining;
  end;
end;

procedure TfrmCrearOrdenCompra.ModificarOrden1Click(Sender: TObject);
begin
  frmConsultaOrden:=TfrmConsultaOrden.Create(nil);
  try
    if frmConsultaOrden.showmodal = mrOk then
    begin
      ProcCargarDatosOrden;
    end;
  finally
  frmConsultaOrden.Free;
  frmConsultaOrden:=Nil;
  end;

end;

procedure TfrmCrearOrdenCompra.ProcCargarDatosOrden;
var
  xDesc : String;
begin
  if (Totalesmontorecibido.Value > 0) and(rxVenta.RecordCount > 0) then
  begin
    MessageDlg('Favor procesar o cancelar orden en progreso', mtInformation, [mbOK], 0);
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
    TotalesMoneda.Value := IntToStr(GlbMonedaBase); //Trim(dmdatos.qryViewOrdenCompMast.Value); // IntToStr(GlbMonedaBase);
    TotalesSubTotal.Value:=0;
    Totalesitbis.Value:=0;
    Totalesmontodesc.Value:=0;
    Totalestotalneto.Value:=0;
    Totalesmontorecibido.Value:=0;
    Totalesdevolucion.Value:=0;
    Totales.Post;
    lblProcDev.Visible := False;
  //end;
  EsModificandoFactura:=True;
  bitBtnEditarFact.Visible := True;
  bitBtnEditarFact.BringToFront;
  Label36.Visible:=True;
  Label36.Caption:='Modificando orden:'+dmdatos.qryviewOrdenCompMastNUM_ORDEN.AsString;
  rxVenta.close;
  rxVenta.open;
  qryProductos.close;
  qryProductos.Open;
  AsignarSqlText('','','');
  dmdatos.qryviewOrdenCompDet.First;
  While Not dmdatos.qryviewOrdenCompDet.Eof do
  begin    
    if not qryProductos.Locate('Codigo', dmdatos.qryViewOrdenCompDetCOD_SERV_PROD.Value,[]) then
    begin
      MessageDlg(Format('Codigo producto %s no encontrado, verifique.',[dmdatos.qryViewOrdenCompDetCOD_SERV_PROD.AsString]),mtError,[mbOk], 0);
    end;
    rxVenta.Append;
    rxVentaNumeroFactura.Value:=dmdatos.qryviewOrdenCompMastNUM_ORDEN.Value;
    if dmFactura.qryVentaFacturaDetSTATUS_DET.IsNull then
    rxVentaStatus.Value   := 'A' else
    rxVentaStatus.Value   := dmdatos.qryViewOrdenCompDetStatus.Value;
    RxSpeedButton1.Visible:= True;
    //if qryProductos.Locate('CODIGO',dmFactura.qryVentaFacturaDetCODIGO_PROD.Value,[]) then
    rxVentaCodTexto.Value      := qryProductosCODIGO_TEXTO.Value;
    rxVentaCostoProducto.Value := qryProductosPrecio_Compra.Value;
    rxVentaCodArticulo.Value   := dmdatos.qryViewOrdenCompDetCOD_SERV_PROD.AsInteger;
    rxVentaSerieOriginal.Value := dmdatos.qryViewOrdenCompDetSERIE.AsInteger;
    rxVentaNumeroTrnOriginal.Value := dmdatos.qryViewOrdenCompDetNUMERO.Value;
    rxVentaSerie.Value := dmdatos.qryViewOrdenCompDetSERIE.AsInteger;
    rxVentaFecha.Value := dmdatos.qryViewOrdenCompMastFECHA.Value;
    rxVentaCant.Value  := dmdatos.qryViewOrdenCompDetCANTIDAD.Value;
    rxVentaPrecio.Value:= dmdatos.qryViewOrdenCompDetPRECIO.Value;
    rxVentaporc_desc.Value := dmdatos.qryViewOrdenCompDetPORC_DESC_DET.Value;


    rxVentaDescripcion.Value := qryProductosDESCRIPCION.Value;
    rxVentaDescripcionEspecial.Value := qryProductosDESCRIPCIONADICIONAL.Value;
    xDesc := StringReplace(rxVentaDescripcionEspecial.Value, rxVentaDescripcion.Value, '',
                          [rfReplaceAll, rfIgnoreCase]);
    if (Length(xDesc) > 4) then
    rxVentaDescripcionEspecial.Value := xDesc
    else
    rxVentaDescripcionEspecial.Value := '';
    //rxVentaItbisExento.Value:=dmdatos.qryViewOrdenCompDeti ITBIS_EXENTO.Value;// qryProductosPAGA_ITBI.Value;

    rxVentaReferencia.Value := qryProductosREFERENCIA.Value;
    if Totales.State = dsBrowse then
    Totales.Edit;
    TotalesCodCliente.Value:=dmdatos.qryViewOrdenCompMastBaseCODIGO_PROVEE.Value;
    TotalesComentario.Value := dmdatos.qryViewOrdenCompMastOBSERVACION.Value;
    TotalesPorcDesAdicional.Value:= 0;
    TotalesMontoDescAdicional.Value :=  0;//dmdatos.qryViewOrdenCompMONTO_DESCUENTO.Value;

    rxVentaInvetariar.Value:= qryProductosINVENTARIAR.Value;

    if (rxVenta.State = dsBrowse) then
    rxVenta.Edit;

    //edtObservacion.Text := dmdatos.qryViewOrdenCompmastn NOMBRE_CLIENTE_GENERAL.Value;
    if GlbcodVendedor > 0 then
    rxVentaCodUsuario.Value := GlbcodVendedor
    else
    rxVentaCodUsuario.Value := VarUsuarioGlb;

    ProcesaCalculos;
    CheckBox2Exit(Self);
    DBEdit2Exit(Self);
    if rxVenta.State In [dsInsert,dsEdit] then
    rxVenta.Post;

    tablaPropietario.Edit;
    tablaPropietarioCodigoPropietario.Value:=
    dmdatos.qryViewOrdenCompMastCODIGO_PROVEE.Value;

    //dmdatos.qryViewOrdenCompMastCIA_KEY.Value;

    tablaPropietario.Post;
    dmdatos.qryViewOrdenCompDet.Next;
  end;
end;

procedure TfrmCrearOrdenCompra.LimpiarDatos;
begin
  rxVenta.Close;
  rxVenta.EmptyTable;
  rxVenta.Open;
  Totales.EmptyTable;
  //ActualizarRecoverData;
  imbBarcode.Visible    := LectorCodBarra1.Checked;
  EsModificandoFactura:=False;
  bitBtnEditarFact.Visible:=False;
  bitBtnEditarFact.SendToBack;
  Label36.Visible:=False;
  ActivarBotonesEnModifica;
  tablaPropietario.Close;
  tablaPropietario.Open;
  Application.ProcessMessages;
end;

procedure TfrmCrearOrdenCompra.AbrirUnidades;
begin
  dmInventario.qryTipoUnidad.Close;
  //En compra solo quiero mostrar los tipos de unidad
  dmInventario.qryTipoUnidad.Params[0].Value:=1;
  dmInventario.qryTipoUnidad.Open;
  dmInventario.qryTipoUnidad.First;
  cboxTipoUnidad.Items.Clear;
  While Not dmInventario.qryTipoUnidad.Eof Do
  begin
    cboxTipoUnidad.Items.Add(dmInventario.qryTipoUnidadDESCRIPCION.Value);
    dmInventario.qryTipoUnidad.Next;
  end;
  if rxVentaTipoUnidad.IsNull then
  cboxTipoUnidad.ItemIndex := 1
  else
  begin
    dmInventario.qryTipoUnidad.Locate('IDUNIDAD',rxVentaTipoUnidad.Value,[]);
    cboxTipoUnidad.Text:= dmInventario.qryTipoUnidadDESCRIPCION.Value;
  end;
end;

procedure TfrmCrearOrdenCompra.RxDBLookupCombo5Change(Sender: TObject);
begin
  cboxTipoUnidad.Text:= dmVentas.qryPrecioUnidadSurtDESCRIPCION.Value;
  GlbTipoUnidad := dmInventario.qryTipoUnidadIDUNIDAD.Value;
  CantUnidad:= dminventario.qryTipoUnidadCANTIDAD.Value;
end;

procedure TfrmCrearOrdenCompra.rxVentaCalcFields(DataSet: TDataSet);
begin
  case rxVentaIDTasaITBIS.Value of
  1:rxVentaPorcTasaItbisCld.Value:='0%';
  3:rxVentaPorcTasaItbisCld.Value:='8%';
  2:rxVentaPorcTasaItbisCld.Value:='11%';
  4:rxVentaPorcTasaItbisCld.Value:='13%';
  5:rxVentaPorcTasaItbisCld.Value:='16%';
  6:rxVentaPorcTasaItbisCld.Value:='18%';
  end;
end;

procedure TfrmCrearOrdenCompra.RxDBLookupCombo1KeyPress(Sender: TObject;
  var Key: Char);
  var xValor : string;
begin
  xCodSel:= qryProvCODIGO_CTE.Value;
  if xCodSel >= 0 then
  if tablaPropietario.State In [dsEdit, dsInsert] then
  tablaPropietarioCodigoPropietario.Value:=xCodSel;
  xCodSel:=-1;
end;

procedure TfrmCrearOrdenCompra.FormResize(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmCrearOrdenCompra.FormClick(Sender: TObject);
begin
  Refresh;
end;

end.
