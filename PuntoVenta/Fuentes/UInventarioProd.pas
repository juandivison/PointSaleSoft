unit UInventarioProd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  db, Dialogs, DBCtrls, rxToolEdit, RXDBCtrl, StdCtrls, Mask, Buttons, Grids,
  DBGrids, ExtCtrls, RXCtrls, ComCtrls, Menus, RxLookup, ExtDlgs, ImgList,
  DBActns, ActnList, EditNew, WinSkinData, IBTable, IBCustomDataSet,
  IBQuery, RxDBComb, RxMemDS, RxDBFilter, IBSQL;

type
  TfrmInventarioProd = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBStatusLabel4: TDBStatusLabel;
    Shape1: TShape;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    RxDBGrid4: TRxDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    DBEdit2: TDBEdit;
    DBDateEdit1: TDBDateEdit;
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    PopupMenu1: TPopupMenu;
    ipoInventario1: TMenuItem;
    Label17: TLabel;
    edtCodBarra: TEdit;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    RxDBLookupCombo1: TRxDBLookupCombo;
    DBImage1: TDBImage;
    SpeedButton1: TSpeedButton;
    OpenPictureDialog1: TOpenPictureDialog;
    Label8: TLabel;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    ActionList1: TActionList;
    DataSetFirst1: TDataSetFirst;
    DataSetPrior1: TDataSetPrior;
    DataSetNext1: TDataSetNext;
    DataSetLast1: TDataSetLast;
    ImageList1: TImageList;
    DBEdit6: TDBEdit;
    Label9: TLabel;
    RxLabel1: TRxLabel;
    RxLabel2: TRxLabel;
    Label10: TLabel;
    Label11: TLabel;
    DBEdit7: TDBEdit;
    Label12: TLabel;
    DBEdit8: TDBEdit;
    Label13: TLabel;
    DBEdit9: TDBEdit;
    Label14: TLabel;
    BitBtn13: TBitBtn;
    DBEdit10: TDBEdit;
    Label15: TLabel;
    DBRadioGroup1: TDBRadioGroup;
    Label16: TLabel;
    DBEdit11: TDBEdit;
    Label18: TLabel;
    DBEdit12: TDBEdit;
    Label19: TLabel;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    Label20: TLabel;
    TabSheet2: TTabSheet;
    RxDBGrid1: TRxDBGrid;
    Label21: TLabel;
    DBEdit15: TDBEdit;
    Label22: TLabel;
    DBEdit16: TDBEdit;
    DBStatusLabel1: TDBStatusLabel;
    BitBtn14: TBitBtn;
    BitBtn15: TBitBtn;
    BitBtn16: TBitBtn;
    BitBtn17: TBitBtn;
    BitBtn18: TBitBtn;
    BitBtn19: TBitBtn;
    BitBtn22: TBitBtn;
    BitBtn23: TBitBtn;
    BitBtn24: TBitBtn;
    BitBtn25: TBitBtn;
    DBText1: TDBText;
    SkinData1: TSkinData;
    BitBtn20: TBitBtn;
    DBDateEdit2: TDBDateEdit;
    Label23: TLabel;
    DBRadioGroup2: TDBRadioGroup;
    qryClasifPrecio: TIBDataSet;
    qryClasifPrecioCOD_PRODUCTO: TIntegerField;
    qryClasifPrecioPRECIO_ID: TIntegerField;
    qryClasifPrecioPRECIO_VENTA: TFloatField;
    qryClasifPrecioCOD_USUARIO: TIntegerField;
    qryClasifPrecioSTATUS: TIBStringField;
    qryClasifPrecioIN_POR: TIBStringField;
    qryClasifPrecioFECHA_IN: TDateTimeField;
    qryClasifPrecioMOD_POR: TIBStringField;
    qryClasifPrecioFECHA_MOD: TDateTimeField;
    qryClasifPrecioMargenG: TCurrencyField;
    dsqryClasifPrecio: TDataSource;
    tblTipoPrecio: TIBTable;
    tblTipoPrecioPRECIO_ID: TIntegerField;
    tblTipoPrecioDESCRIPCION: TIBStringField;
    dstblTipoPrecio: TDataSource;
    panelClasifPrecio: TPanel;
    DBStatusLabel2: TDBStatusLabel;
    Label31: TLabel;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    BitBtn21: TBitBtn;
    BitBtn26: TBitBtn;
    BitBtn27: TBitBtn;
    BitBtn28: TBitBtn;
    RxDBLookupCombo5: TRxDBLookupCombo;
    Label25: TLabel;
    BitBtn29: TBitBtn;
    Label26: TLabel;
    DBEdit18: TDBEdit;
    Label27: TLabel;
    DBEdit19: TDBEdit;
    Label28: TLabel;
    DBEdit20: TDBEdit;
    Label29: TLabel;
    DBEdit21: TDBEdit;
    StaticText1: TStaticText;
    Label30: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    DBEdit22: TDBEdit;
    DBEdit23: TDBEdit;
    DBEdit24: TDBEdit;
    DBEdit25: TDBEdit;
    StaticText2: TStaticText;
    DBEdit26: TDBEdit;
    DBEdit27: TDBEdit;
    DBEdit28: TDBEdit;
    DBEdit29: TDBEdit;
    Shape2: TShape;
    DBRadioGroup3: TDBRadioGroup;
    RxDBLookupCombo2: TRxDBLookupCombo;
    RxDBLookupCombo3: TRxDBLookupCombo;
    RxDBLookupCombo4: TRxDBLookupCombo;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    RxDBLookupCombo6: TRxDBLookupCombo;
    qryProdPorProveedor: TIBQuery;
    qryProdPorProveedorFECHA: TDateTimeField;
    qryProdPorProveedorCODIGO_PROV: TSmallintField;
    qryProdPorProveedorNOMBREPROVEEDOR: TIBStringField;
    qryProdPorProveedorPRECIO: TFloatField;
    qryProdPorProveedorTELEFONO: TIBStringField;
    qryProdPorProveedorEMAIL: TIBStringField;
    BitBtn30: TBitBtn;
    Label39: TLabel;
    DBMemo1: TDBMemo;
    DBMemo2: TDBMemo;
    Label40: TLabel;
    BitBtn31: TBitBtn;
    BitBtn32: TBitBtn;
    DBEdit31: TDBEdit;
    Label41: TLabel;
    rxdbboxmoneda: TRxDBComboBox;
    Label42: TLabel;
    CheckBox1: TCheckBox;
    ConsultaGeneral1: TMenuItem;
    BitBtn33: TBitBtn;
    RxDBLookupCombo7: TRxDBLookupCombo;
    Label38: TLabel;
    dstblTasaItbisLookup: TDataSource;
    Filtrarportipo1: TMenuItem;
    RxLabel3: TRxLabel;
    FiltrarporTipoInv1: TMenuItem;
    ClonarRecord1: TMenuItem;
    rxInv: TRxMemoryData;
    DBEdit30: TDBEdit;
    Label43: TLabel;
    TabSheet3: TTabSheet;
    Panel1: TPanel;
    qryStatusAlquiler: TIBQuery;
    qryStatusAlquiler_Base: TIBQuery;
    edtFechaIni: TDateEdit;
    Label44: TLabel;
    RxDBGrid2: TRxDBGrid;
    dsqryStatusAlquiler: TDataSource;
    qryStatusAlquilerNOMBRE_CTE: TIBStringField;
    qryStatusAlquilerDESCRIPCION: TIBStringField;
    qryStatusAlquilerIDSERIE: TIntegerField;
    qryStatusAlquilerTIPOTRN: TIntegerField;
    qryStatusAlquilerFECHA: TDateTimeField;
    qryStatusAlquilerFECHA_ENTRADA: TDateTimeField;
    qryStatusAlquilerFECHA_ENT_ESTIMADA: TDateTimeField;
    qryStatusAlquilerCOD_CLIENTE: TIntegerField;
    qryStatusAlquilerNUMERO_FACTURA: TIntegerField;
    qryStatusAlquilerMONTO_TOTAL: TFloatField;
    qryStatusAlquilerOBSERVACION: TMemoField;
    qryStatusAlquilerSTATUS: TIBStringField;
    qryStatusAlquilerFECHA_IN: TDateTimeField;
    qryStatusAlquilerIN_POR: TIBStringField;
    qryStatusAlquilerFECHA_MOD: TDateTimeField;
    qryStatusAlquilerMOD_POR: TIBStringField;
    qryStatusAlquilerCODIGO_USUARIO: TIntegerField;
    qryStatusAlquilerNUM_TRNVENTA: TIntegerField;
    qryStatusAlquilerTIPO_OPE: TSmallintField;
    qryStatusAlquilerINV_UPD: TIBStringField;
    qryStatusAlquilerCOD_PROD_ALQ: TIntegerField;
    qryStatusAlquilerSERIE: TIntegerField;
    qryStatusAlquilerIDSERIE1: TIntegerField;
    qryStatusAlquilerCOD_PRODUCTO: TIntegerField;
    qryStatusAlquilerSERIE_TRN: TIntegerField;
    qryStatusAlquilerSTATUS1: TIBStringField;
    qryStatusAlquilerFECHA_IN1: TDateTimeField;
    qryStatusAlquilerIN_POR1: TIBStringField;
    qryStatusAlquilerFECHA_MOD1: TDateTimeField;
    qryStatusAlquilerMOD_POR1: TIBStringField;
    qryStatusAlquilerCODIGO_USUARIO1: TIntegerField;
    qryStatusAlquilerCANT_DIAS: TFloatField;
    qryStatusAlquilerPRECIO_XDIA: TFloatField;
    qryStatusAlquilerMONTO: TFloatField;
    qryStatusAlquilerDESCRIPCIONSERVICIO: TMemoField;
    qryStatusAlquilerPORC_SEGURO: TFloatField;
    qryStatusAlquilerMONTO_SEGURO: TFloatField;
    qryStatusAlquilerCANTIDAD: TIntegerField;
    rdgTipoOpe: TRadioGroup;
    rdgFecha: TRadioGroup;
    BitBtn34: TBitBtn;
    edtFechaFin: TDateEdit;
    Label45: TLabel;
    rdgRecibidos: TRadioGroup;
    Categorias1: TMenuItem;
    SubCategoria1: TMenuItem;
    AutoActualizaTablaUnidadPrecio1: TMenuItem;
    ProgressBar1: TProgressBar;
    AutoInsertaEnPXU: TMenuItem;
    BitBtn35: TBitBtn;
    Image1: TImage;
    asaItbis1: TMenuItem;
    FiltrarTasaItbisConVentas1: TMenuItem;
    ibsqlUpdateIdTasa: TIBSQL;
    DBRadioGroup4: TDBRadioGroup;
    TabSheet4: TTabSheet;
    Panel2: TPanel;
    Label24: TLabel;
    Label46: TLabel;
    FechaInicialStatusEquipo: TDateEdit;
    RadioGroup2: TRadioGroup;
    BitBtn36: TBitBtn;
    FechaFinalStatusEquipo: TDateEdit;
    rdgEstatus: TRadioGroup;
    RxDBGrid3: TRxDBGrid;
    qryStatusEquipo_Base: TIBQuery;
    qryStatusEquipo: TIBQuery;
    dsqryStatusEquipo: TDataSource;
    DBRadioGroup5: TDBRadioGroup;
    qryStatusEquipo_BaseRMA: TIBQuery;
    BitBtn37: TBitBtn;
    Label47: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    AplicaPorcentajeUtilidadXDefault1: TMenuItem;
    CheckBox2: TCheckBox;
    MantenimientoLotes1: TMenuItem;
    PorcodigoProd1: TMenuItem;
    PorProveedor1: TMenuItem;
    qryCheckDesc: TIBQuery;
    qryCheckDescEXISTE: TIntegerField;
    qryCheckDescDESCRIPCION: TIBStringField;
    TabSheet5: TTabSheet;
    qryDupCodBarra: TIBQuery;
    qryDupDescripcion: TIBQuery;
    RxDBGrid5: TRxDBGrid;
    RadioGroup1: TRadioGroup;
    dsVerDuplicados: TDataSource;
    tblInventarioDup: TIBDataSet;
    tblInventarioDupCODIGO: TIntegerField;
    tblInventarioDupCODIGO_TEXTO: TIBStringField;
    tblInventarioDupFECHA: TDateTimeField;
    tblInventarioDupCODIGO_BARRA: TIBStringField;
    tblInventarioDupTIPO: TIntegerField;
    tblInventarioDupDESCRIPCION: TIBStringField;
    tblInventarioDupDESCRIPCIONADICIONAL: TMemoField;
    tblInventarioDupCANTIDAD_REORDEN: TIntegerField;
    tblInventarioDupPRECIO_ANT: TFloatField;
    tblInventarioDupCANTIDAD: TFloatField;
    tblInventarioDupPRECIO: TFloatField;
    tblInventarioDupBLCE_CANT_ENTRADA: TFloatField;
    tblInventarioDupBLCE_CANT_SALIDA: TFloatField;
    tblInventarioDupFECHA_ULTIMA_TRN: TDateTimeField;
    tblInventarioDupSTATUS: TIBStringField;
    tblInventarioDupPORC_DESCUENTO: TFloatField;
    tblInventarioDupFOTO: TBlobField;
    tblInventarioDupPAGA_ITBI: TSmallintField;
    tblInventarioDupCODIGO_PRECIO: TIBStringField;
    tblInventarioDupUNIDAD: TFloatField;
    tblInventarioDupPRECIO_COMPRA: TFloatField;
    tblInventarioDupPRECIO_MINIMO: TFloatField;
    tblInventarioDupREFERENCIA: TIBStringField;
    tblInventarioDupFECHA_VENCIMIENTO: TDateTimeField;
    tblInventarioDupINVENTARIAR: TSmallintField;
    tblInventarioDupPRECIO_TIPO_UNIDAD: TFloatField;
    tblInventarioDupTIPO_UNIDAD: TIntegerField;
    tblInventarioDupORIGEN: TIntegerField;
    tblInventarioDupUBICACION: TIBStringField;
    tblInventarioDupREFERENCIA_ALTERNA: TIBStringField;
    tblInventarioDupMARCA: TIBStringField;
    tblInventarioDupMODELO: TIBStringField;
    tblInventarioDupPRECIOVENTA1: TFloatField;
    tblInventarioDupPRECIOVENTA2: TFloatField;
    tblInventarioDupPRECIOVENTA3: TFloatField;
    tblInventarioDupPRECIOVENTA4: TFloatField;
    tblInventarioDupPORCUTILIDAD1: TFloatField;
    tblInventarioDupPORCUTILIDAD2: TFloatField;
    tblInventarioDupPORCUTILIDAD3: TFloatField;
    tblInventarioDupPORCUTILIDAD4: TFloatField;
    tblInventarioDupUSARLEVELPRECIO: TSmallintField;
    tblInventarioDupCIA_KEY: TIntegerField;
    tblInventarioDupSITUACIONPROD: TSmallintField;
    tblInventarioDupAPLICAIMPTOCOMPRA: TSmallintField;
    tblInventarioDupCODFABRICANTE: TIntegerField;
    tblInventarioDupCTAINVENTARIO: TIBStringField;
    tblInventarioDupCTAVENTA: TIBStringField;
    tblInventarioDupCTACOMPRA: TIBStringField;
    tblInventarioDupCODSUBCATEGORIA: TIntegerField;
    tblInventarioDupCODCATEGORIA: TIntegerField;
    tblInventarioDupPORCITBIS: TFloatField;
    tblInventarioDupCOD_MONEDA: TIBStringField;
    tblInventarioDupKILOMETROS: TFloatField;
    tblInventarioDupRUTAIMAGEN: TIBStringField;
    tblInventarioDupIDTASAITBIS: TSmallintField;
    tblInventarioDupPRECIO_ALQUILER: TFloatField;
    tblInventarioDupPAGACOMISION: TSmallintField;
    BitBtn38: TBitBtn;
    dsTblInvDup: TDataSource;
    RxDBGrid6: TRxDBGrid;
    BitBtn39: TBitBtn;
    BitBtn40: TBitBtn;
    DBStatusLabel3: TDBStatusLabel;
    qryDupCodBarraCODIGO: TIntegerField;
    qryDupCodBarraCODIGO_BARRA: TIBStringField;
    qryDupCodBarraCANTIDAD: TFloatField;
    qryDupCodBarraPRECIO: TFloatField;
    qryDupCodBarraFECHAINSERTADO: TDateTimeField;
    qryDupCodBarraFECHA_ULTIMA_TRN: TDateTimeField;
    qryDupCodBarraDESCRIPCION: TIBStringField;
    qryDupDescripcionCODIGO: TIntegerField;
    qryDupDescripcionCODIGO_BARRA: TIBStringField;
    qryDupDescripcionFECHA_ULTIMA_TRN: TDateTimeField;
    qryDupDescripcionCANTIDAD: TFloatField;
    qryDupDescripcionPRECIO: TFloatField;
    qryDupDescripcionFECHAINSERTADO: TDateTimeField;
    qryDupDescripcionDESCRIPCION: TIBStringField;
    qryCheckCodBarra: TIBQuery;
    qryCheckCodBarraEXISTE: TIntegerField;
    qryCheckCodBarraCODIGO_BARRA: TIBStringField;
    RxDBGrid7: TRxDBGrid;
    Label48: TLabel;
    qryVentasTrn: TIBQuery;
    dsqryVentasTrn: TDataSource;
    qryVentasTrnSERIE: TIntegerField;
    qryVentasTrnNUMERO: TIntegerField;
    qryVentasTrnCODIGO_PROD: TIBStringField;
    qryVentasTrnCODIGO_BARRA: TIBStringField;
    qryVentasTrnDESCRIPCION: TIBStringField;
    qryVentasTrnCANTIDAD: TFloatField;
    qryVentasTrnFECHA_IN: TDateTimeField;
    qryVentasTrnIN_POR: TIBStringField;
    Label49: TLabel;
    DimensionProductos1: TMenuItem;
    BitBtn41: TBitBtn;
    qrytipoInvLookupC: TIBQuery;
    qrytipoInvLookupCCODIGO: TSmallintField;
    qrytipoInvLookupCDESCRIPCION: TIBStringField;
    FiltrarTipoUnidadNull1: TMenuItem;
    AsignaUnidad1: TMenuItem;
    AuditoriaPrecios1: TMenuItem;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    dsqryInvOtro_Ruta: TDataSource;
    DBText2: TDBText;
    Autitoria1: TMenuItem;
    FiltrarPagaItbis1: TMenuItem;
    FiltrarNoPagaItbis1: TMenuItem;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure ipoInventario1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn8Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ActionList1Execute(Action: TBasicAction;
      var Handled: Boolean);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBEdit8Exit(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure BitBtn18Click(Sender: TObject);
    procedure BitBtn22Click(Sender: TObject);
    procedure BitBtn23Click(Sender: TObject);
    procedure BitBtn24Click(Sender: TObject);
    procedure BitBtn25Click(Sender: TObject);
    procedure BitBtn20Click(Sender: TObject);
    procedure DBEdit7Change(Sender: TObject);
    procedure RxDBGrid4GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tblTipoPrecioAfterScroll(DataSet: TDataSet);
    procedure BitBtn28Click(Sender: TObject);
    procedure BitBtn26Click(Sender: TObject);
    procedure BitBtn27Click(Sender: TObject);
    procedure BitBtn21Click(Sender: TObject);
    procedure qryClasifPrecioCalcFields(DataSet: TDataSet);
    procedure BitBtn29Click(Sender: TObject);
    procedure DBEdit26Exit(Sender: TObject);
    procedure DBEdit27Exit(Sender: TObject);
    procedure DBEdit28Exit(Sender: TObject);
    procedure DBEdit29Exit(Sender: TObject);
    procedure BitBtn30Click(Sender: TObject);
    procedure DBEdit11Exit(Sender: TObject);
    procedure DBMemo1DblClick(Sender: TObject);
    procedure BitBtn31Click(Sender: TObject);
    procedure BitBtn32Click(Sender: TObject);
    procedure DBEdit31DblClick(Sender: TObject);
    procedure DBEdit31Click(Sender: TObject);
    procedure RxDBGrid4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit22Exit(Sender: TObject);
    procedure DBEdit23Exit(Sender: TObject);
    procedure DBEdit24Exit(Sender: TObject);
    procedure DBEdit25Exit(Sender: TObject);
    procedure ConsultaGeneral1Click(Sender: TObject);
    procedure BitBtn33Click(Sender: TObject);
    procedure DBEdit11Enter(Sender: TObject);
    procedure DBEdit13Enter(Sender: TObject);
    procedure FiltrarporTipoInv1Click(Sender: TObject);
    procedure ClonarRecord1Click(Sender: TObject);
    procedure BitBtn34Click(Sender: TObject);
    procedure RxDBGrid2GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure RxDBGrid2DblClick(Sender: TObject);
    procedure Categorias1Click(Sender: TObject);
    procedure SubCategoria1Click(Sender: TObject);
    procedure AutoActualizaTablaUnidadPrecio1Click(Sender: TObject);
    procedure AutoInsertaEnPXUClick(Sender: TObject);
    procedure BitBtn35Click(Sender: TObject);
    procedure RxDBGrid4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure RxDBGrid4TitleClick(Column: TColumn);
    procedure asaItbis1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FiltrarTasaItbisConVentas1Click(Sender: TObject);
    procedure DBEdit11Change(Sender: TObject);
    procedure BitBtn36Click(Sender: TObject);
    procedure TabSheet2Enter(Sender: TObject);
    procedure rdgEstatusClick(Sender: TObject);
    procedure BitBtn37Click(Sender: TObject);
    procedure DBRadioGroup5Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure AplicaPorcentajeUtilidadXDefault1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CheckBox2Click(Sender: TObject);
    procedure PorcodigoProd1Click(Sender: TObject);
    procedure PorProveedor1Click(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure BitBtn39Click(Sender: TObject);
    procedure BitBtn40Click(Sender: TObject);
    procedure qryDupCodBarraAfterScroll(DataSet: TDataSet);
    procedure DBEdit6Exit(Sender: TObject);
    procedure qryDupDescripcionAfterScroll(DataSet: TDataSet);
    procedure TabSheet5Exit(Sender: TObject);
    procedure tblInventarioDupAfterScroll(DataSet: TDataSet);
    procedure DimensionProductos1Click(Sender: TObject);
    procedure BitBtn41Click(Sender: TObject);
    procedure FiltrarTipoUnidadNull1Click(Sender: TObject);
    procedure AsignaUnidad1Click(Sender: TObject);
    procedure AuditoriaPrecios1Click(Sender: TObject);
    procedure Autitoria1Click(Sender: TObject);
    procedure FiltrarPagaItbis1Click(Sender: TObject);
    procedure FiltrarNoPagaItbis1Click(Sender: TObject);
  private
    { Private declarations }
    Procedure CalcularPrecio(idx:smallint;porcValue:Extended);
    Procedure CalcularPorcentaje(idx:smallint;Precio:Extended);
    Function AsignarValorMinimo:Extended;
    Function ValidaPorcUtilidad:boolean;
    procedure ProcIniciaDatos(xCodB: string);
    procedure CheckcodBarra;
    procedure AbrirDDup;
    Function GetPrecioMinimo(p1:currency;p2:currency;p3:currency;p4:currency):Currency;
  public
    { Public declarations }
  end;

var
  frmInventarioProd: TfrmInventarioProd;
  AplicandoPorc, SalirEscape : boolean;

implementation

uses UDatModInventario, uglobal, UTipoInventario, UCambiarPrecios,
  UDatModReportes, URepInventarioProd, ULabelImpCodBarraRefactored, UDatModConectar,
  UPrecioProdXUnidad, UDatModCompania, UFormPrecioProdPorProveedor,
  UFormDescAdicional, ImageWin, UConsultaInventario, UFormShowImagen,
  UFormTasaITBIS, UFormFiltrarTipoInv, UCategoriaInventario,
  UInventarioSubCategoria, UFormPrecioXUnidadNivel, UFormOfertas,
  UFormFiltrarTasaItbis, URegistro, UFormLote, UFormDimensionProd,
  UDatModPanaderia, UfrmInvPrecioAudit, UFormAuditoriaInv,
  ULabelImpCodBarra;

{$R *.dfm}

procedure TfrmInventarioProd.BitBtn1Click(Sender: TObject);
begin
  if dmInventario.tblInventarioProd.State = dsBrowse then
  begin
    RxDBGrid4.SelectedRows.Clear;
    dmInventario.tblInventarioProd.Insert;
    ProcIniciaDatos('');
    DBEdit2.SetFocus;
  end;
end;

procedure TfrmInventarioProd.ProcIniciaDatos(xCodB:string);
begin
    dmInventario.tblInventarioProdCIA_KEY.Value:= GLBCODIGO_CIA;
    dmInventario.tblInventarioProdSTATUS.Value:='A';
    if (xCodB <> '') then
    begin    
      dmInventario.tblInventarioProdCODIGO_BARRA.Value := xCodB;
      dmInventario.tblInventarioProdCODIGO_TEXTO.Value := xCodB;
    end;
    if (GlBCuadros = 1) then
    begin
      dmInventario.tblInventarioProdIDTASAITBIS.Value:=1;//exonerado
      qrytipoInvLookupC.close;
      qrytipoInvLookupC.DisableControls;
      qrytipoInvLookupC.open;
      if qrytipoInvLookupC.Locate('DESCRIPCION','INGREDIENTE',[loCaseInsensitive]) then
      dmInventario.tblInventarioProdTIPO.Value:=qrytipoInvLookupCCODIGO.Value;
      qrytipoInvLookupC.EnableControls;
    end;
    dmInventario.tblInventarioProdFECHA.Value :=ExtraerFecha(Date);
    dmInventario.tblInventarioProdBLCE_CANT_ENTRADA.Value:= 0;
    dmInventario.tblInventarioProdBLCE_CANT_SALIDA.Value := 0;
    dmInventario.tblInventarioProdPAGA_ITBI.Value        := 1;
    dmInventario.tblInventarioProdTIPO_UNIDAD.Value      := 1;
    dmInventario.tblInventarioProdPORC_DESCUENTO.Value   := 0;
    dmInventario.tblInventarioProdINVENTARIAR.Value      := 1;
    dmInventario.tblInventarioProdCOD_MONEDA.Value       := '1';
    dmInventario.tblInventarioProdPAGACOMISION.Value     := 0;
    if (glbUsaescalaPrecio = 1) then
    begin
      dmInventario.tblInventarioProdPORCUTILIDAD1.Value:= frmtrgtr.tRegistroPORC_UTILIDAD1.Value;
      dmInventario.tblInventarioProdPORCUTILIDAD2.Value:= frmtrgtr.tRegistroPORC_UTILIDAD2.Value;
      dmInventario.tblInventarioProdPORCUTILIDAD3.Value:= frmtrgtr.tRegistroPORC_UTILIDAD3.Value;
      dmInventario.tblInventarioProdPORCUTILIDAD4.Value:= frmtrgtr.tRegistroPORC_UTILIDAD4.Value;
    end;
end;

procedure TfrmInventarioProd.BitBtn2Click(Sender: TObject);
begin
 if dmInventario.tblInventarioProd.State = dsBrowse then
  begin
    //dmInventario.tblInventarioProdPRECIO_MINIMO.ReadOnly:=True;
    dmInventario.tblInventarioProd.Edit;
  end;
end;

procedure TfrmInventarioProd.BitBtn3Click(Sender: TObject);
begin
  if dmInventario.tblInventarioProd.State in [dsEdit,dsInsert] then
  begin
    dmInventario.tblInventarioProd.Cancel;
  end else
  if MessageDlg('Borrar artículo de inventario?', mtWarning,[mbYes, mbNo],0) = mrYes then
  begin
    dmInventario.tblInventarioProd.Delete;
    GlbSalvarQuery(dmInventario.tblInventarioProd);
  end;
end;

function TfrmInventarioProd.ValidaPorcUtilidad: boolean;
begin
  if(GlBCuadros = 1 ) then exit;
    if not dminventario.tblInventarioProdPORCUTILIDAD1.IsNull then
    begin
      if (dminventario.tblInventarioProdPORCUTILIDAD1.Value < 0) or
         (dminventario.tblInventarioProdPORCUTILIDAD1.Value > 1000 ) then
      begin
        MessageDlg('Verifique porciento utilidad .', mtInformation, [mbOK], 0);
        result:=False;
      end;
    end;
        if not dminventario.tblInventarioProdPORCUTILIDAD2.IsNull then
    begin
      if (dminventario.tblInventarioProdPORCUTILIDAD2.Value < 0) or
      (dminventario.tblInventarioProdPORCUTILIDAD2.Value > 1000 ) then
      begin
        MessageDlg('Verifique porciento utilidad .', mtInformation, [mbOK], 0);
        result:=False;
      end;
    end;
        if not dminventario.tblInventarioProdPORCUTILIDAD3.IsNull then
    begin
      if (dminventario.tblInventarioProdPORCUTILIDAD3.Value < 0) or
      (dminventario.tblInventarioProdPORCUTILIDAD3.Value > 1000 ) then
      begin
        MessageDlg('Verifique porciento utilidad .', mtInformation, [mbOK], 0);
        result:=False;
      end;
    end;
        if not dminventario.tblInventarioProdPORCUTILIDAD4.IsNull then
    begin
      if (dminventario.tblInventarioProdPORCUTILIDAD4.Value < 0) or
      (dminventario.tblInventarioProdPORCUTILIDAD4.Value > 1000 ) then
      begin
        MessageDlg('Verifique porciento utilidad .', mtInformation, [mbOK], 0);
        result:=False;
      end;
    end;
end;
procedure TfrmInventarioProd.BitBtn4Click(Sender: TObject);
var
  _codProd, _idTasa : integer;
begin
  _codProd:=-1;
  if dmInventario.tblInventarioProd.State in [dsEdit,dsInsert] then
  begin
    if not ValidaPorcUtilidad then exit;
    if dmInventario.tblInventarioProdTIPO_UNIDAD.IsNull then
    begin
      MessageDlg('Favor indicar tipo unidad', mtInformation, [mbOK], 0);
      RxDBLookupCombo5.SetFocus;
      Exit;
    end;
    if (dmInventario.tblInventarioProdPRECIO_COMPRA.Value <= 0) or
       (dmInventario.tblInventarioProdPRECIO_COMPRA.IsNull) then
    begin
      MessageDlg('Favor indicar costo del producto.',mtwarning,[mbok],0);
      if showing then
      DBEdit11.SetFocus;
      exit;
    end;
    if dmInventario.tblInventarioProdTIPO.IsNull then
    begin
      MessageDlg('Favor indicar tipo inventario.', mtInformation, [mbOK], 0);
      RxDBLookupCombo1.SetFocus;
      Exit;
    end;
    if dmInventario.tblInventarioProdIDTASAITBIS.IsNull then
    begin
      MessageDlg('Favor indicar tasa itbis aplica para producto.', mtInformation, [mbOK], 0);
      RxDBLookupCombo7.SetFocus;
      Exit;
    end;

    if (dmInventario.tblInventarioProdDESCRIPCION.IsNull) or
       (dmInventario.tblInventarioProdDESCRIPCION.Value = '') then
    begin
      MessageDlg('Favor indicar descripción del producto.', mtError, [mbOK], 0);
      exit;
    end;

     if dmInventario.tblInventarioProd.State in [dsInsert] then
     begin
       if (dmInventario.tblInventarioProdPRECIOVENTA1.Value > 0) then
       begin
         if (dmInventario.tblInventarioProdPRECIO_MINIMO.Value >
         dmInventario.tblInventarioProdPRECIOVENTA1.Value) then
         dmInventario.tblInventarioProdPRECIO_MINIMO.Value:=
         dmInventario.tblInventarioProdPRECIOVENTA1.Value;
       end;
       if (dmInventario.tblInventarioProdPRECIOVENTA4.Value > 0) then
       begin
         if (dmInventario.tblInventarioProdPRECIO.Value <
         dmInventario.tblInventarioProdPRECIOVENTA4.Value) then
         dmInventario.tblInventarioProdPRECIO.Value:=
         dmInventario.tblInventarioProdPRECIOVENTA4.Value;
       end;
     end;
     if (GlbCuadros = 1) and (dmInventario.tblInventarioProdPRECIOVENTA1.Value > 0) then
     dmInventario.tblInventarioProdPRECIO_MINIMO.Value:=  GetPrecioMinimo(
     dmInventario.tblInventarioProdPRECIOVENTA1.Value,
     dmInventario.tblInventarioProdPRECIOVENTA2.Value,
     dmInventario.tblInventarioProdPRECIOVENTA3.Value,
     dmInventario.tblInventarioProdPRECIOVENTA4.Value);

    if (dmInventario.tblInventarioProdPRECIO.Value <=
        dmInventario.tblInventarioProdPRECIO_COMPRA.Value) and (dmInventario.tblInventarioProdTIPO.Value <> 2) then
    begin
      MessageDlg('Precio Detalle no puede ser menor o igual a precio compra, verifique.', mtInformation, [mbOK], 0);
      Exit;
    end;
    if (dmInventario.tblInventarioProdPRECIO_MINIMO.Value <=
        dmInventario.tblInventarioProdPRECIO_COMPRA.Value) and (dmInventario.tblInventarioProdTIPO.Value <> 2) then
    begin
      MessageDlg('Precio Detalle no puede ser menor o igual a precio compra, verifique.', mtInformation, [mbOK], 0);
      Exit;
    end;
    if dmInventario.tblInventarioProdPRECIO.IsNull then
    begin
      MessageDlg('Favor indicar precio', mtInformation, [mbOK], 0);
      exit;
    end;

    if ((dmInventario.tblInventarioProdPRECIOVENTA1.Value > 0) and
        (dmInventario.tblInventarioProdPRECIOVENTA2.Value > 0) ) then
    begin
    if Abs(dmInventario.tblInventarioProdPRECIO_MINIMO.Value - AsignarValorMinimo) > 0.10 then
    begin
      MessageDlg('Verifica que el precio minimo "'+InsertarComa(dmInventario.tblInventarioProdPRECIO_MINIMO.AsString)+'" '#13#10' no sea mayor a uno de los precios 1..4.', mtInformation, [mbOK], 0);
      DBEdit13.SetFocus;
      exit;
    end;
    end;
    if (dmInventario.tblInventarioProdCOD_MONEDA.IsNull) then
    begin
      MessageDlg('Favor indicar codigo moneda', mtInformation, [mbOK], 0);
      exit;
    end;

    {if (dmInventario.tblInventarioProdPRECIOVENTA1.Value > 0) and
       (dmInventario.tblInventarioProdPRECIOVENTA4.Value > 0) then
    begin
      dmInventario.tblInventarioProdPRECIO_MINIMO.Value:=
      dmInventario.tblInventarioProdPRECIOVENTA1.Value;
      dmInventario.tblInventarioProdPRECIO.Value:=
      dmInventario.tblInventarioProdPRECIOVENTA4.Value;
    end;}
    _idTasa:=dmInventario.tblInventarioProdIDTASAITBIS.Value;
    if dmInventario.tblInventarioProd.state = dsEdit then
    _codProd:= dmInventario.tblInventarioProdCODIGO.Value;
    
    GlbSalvarQuery(dmInventario.tblInventarioProd);
    edtCodBarra.Clear;
    //update
    //IDTASAITBIS  =:idtasa
    //from INVENTARIO_PRODUCTO
    //where codigo =:codigo
    ibsqlUpdateIdTasa.Params[0].Value:= _idtasa;
    ibsqlUpdateIdTasa.Params[1].Value:= _codProd;
    if _codProd > 0 then
    begin
      ibsqlUpdateIdTasa.ExecQuery;
      if not ibsqlUpdateIdTasa.Transaction.InTransaction then
      ibsqlUpdateIdTasa.Transaction.StartTransaction;
      try
        ibsqlUpdateIdTasa.Transaction.CommitRetaining;
      except
      ibsqlUpdateIdTasa.Transaction.RollbackRetaining;
      end;
    end;
    //Si codigo texto es nulo
    if dmInventario.tblInventarioProdCodigo_texto.IsNull then
    begin
      dmInventario.tblInventarioProd.Edit;
      //codigo_texto
      dmInventario.tblInventarioProdCodigo_texto.Value:=
      dmInventario.tblInventarioProdCodigo.AsString;
      //codigo_barra
      if dmInventario.tblInventarioProdCODIGO_BARRA.IsNull then
      dmInventario.tblInventarioProdCODIGO_BARRA.Value:=
      dmInventario.tblInventarioProdCodigo_texto.Value;
      dmInventario.tblInventarioProd.Post;
      dmInventario.tblInventarioProd.ApplyUpdates;
      if not dmInventario.tblInventarioProd.Transaction.InTransaction then
      dmInventario.tblInventarioProd.Transaction.StartTransaction;
      try
        dmInventario.tblInventarioProd.Transaction.CommitRetaining;
      except
      dmInventario.tblInventarioProd.Transaction.RollbackRetaining;
      end;
      edtCodBarra.Clear; 
    end;
    edtCodBarra.SetFocus;
    edtCodBarra.SelectAll;
  end;
end;

procedure TfrmInventarioProd.BitBtn5Click(Sender: TObject);
begin
  if dmInventario.tblInventarioProd.State in [dsInactive, dsBrowse] then
  begin
    dmInventario.tblInventarioProd.Close;//dmInventario.tblInventarioProd.selectSQL.TEXT
    dmInventario.tblInventarioProd.Filtered:=False;
    RxLabel3.Caption:='';
    dmInventario.tblInventarioProd.SelectSQL.Text := dmInventario.qryInvProd_Base.Sql.Text;
    dmInventario.tblInventarioProd.Params[0].Value:=glbCia_Key;
    dmInventario.tblInventarioProd.Open;
    tblTipoPrecio.Close;
    tblTipoPrecio.Open;
    dmInventario.tblTasaItbisLookup.Close;
    dmInventario.tblTasaItbisLookup.Open;
  end;
end;

procedure TfrmInventarioProd.ipoInventario1Click(Sender: TObject);
begin
  frmTipoInventario:=TfrmTipoInventario.Create(Nil);
  try
    frmTipoInventario.Showmodal;
  finally
  frmTipoInventario.Free;
  frmTipoInventario:=Nil;
  end;
end;

procedure TfrmInventarioProd.FormCreate(Sender: TObject);
begin
  if (GlbUsaescalaPrecio = 0) then
  begin
    CheckBox1.Enabled:=False;
    DBEdit26.Enabled:=False;
    DBEdit27.Enabled:=False;
    DBEdit28.Enabled:=False;
    DBEdit29.Enabled:=False;
    DBEdit22.Enabled:=False;
    DBEdit23.Enabled:=False;
    DBEdit24.Enabled:=False;
    DBEdit25.Enabled:=False;
  end;
  SalirEscape:=false;
  AplicandoPorc:=false;
  try
  frmtrgtr:=Tfrmtrgtr.Create(Nil);
  frmtrgtr.tRegistro.Close;
  frmtrgtr.tRegistro.Open;
  except
  end;
  if GlbUsaPUnidadStd = 0 then
  begin
    AutoActualizaTablaUnidadPrecio1.Visible:= False;
    AutoInsertaEnPXU.Visible:= False;
  end else
  begin
    AutoActualizaTablaUnidadPrecio1.Visible:= true;
    AutoInsertaEnPXU.Visible:= True;
  end;
  RxLabel3.Caption:='';
  dmInventario.tblInventarioProd.Filtered:=False;
  dmInventario.tblInvSubCategoria.Close;
  dmInventario.tblInvSubCategoria.Open;
  dmInventario.tblInvCategoria.Close;
  dmInventario.tblInvCategoria.Open;
  dmInventario.qryProveedores.Close;
  dmInventario.qryProveedores.Filtered:=False;
  dmInventario.qryProveedores.Tag:=glbCia_Key;
  //dmInventario.qryProveedores.Filtered:=True;
  //dmInventario.qryProveedores.Params[0].Value:=glbCia_Key;
  dmInventario.qryProveedores.Open;
  dmInventario.qryTipoUnidad.Close;
  dmInventario.qryTipoUnidad.params[0].Value:=1;
  dmInventario.qryTipoUnidad.Open;
  tblTipoPrecio.Close;
  tblTipoPrecio.Open;
  dmInventario.qryValorLetras.Close;
  dmInventario.qryValorLetras.Open;
  dmInventario.tblTipoInventario.Close;
  dmInventario.tblTipoInventario.Open;
  dmInventario.tblTasaItbisLookup.Close;
  dmInventario.tblTasaItbisLookup.Open;
  BitBtn5Click(Self);
  if (varTipousuario = 0) then
  begin
  dmInventario.qryValorEnInventario.Close;
  dmInventario.qryValorEnInventario.Params[0].Value:=glbCia_Key;
  if not dmInventario.qryValorEnInventario.Prepared then
  dmInventario.qryValorEnInventario.Prepare;
  dmInventario.qryValorEnInventario.ExecQuery;
  dmInventario.qryValorEnInventario.CheckOpen;
  if dmInventario.qryValorEnInventario.Open then
  begin
    //Label10.Caption:= dmInventario.qryValorEnInventario.fieldbyname('CantidadProductos').AsString;
    Label10.Caption:= dmInventario.qryValorEnInventario.Current.Vars[0].AsString;
    Label11.Caption:= Format('%8.2f',[dmInventario.qryValorEnInventario.Current.Vars[1].AsDouble]);
  end;
  end else
  begin
    RxLabel1.Visible:=False;
    RxLabel2.Visible:=False;
    Label10.Visible:=False;
    Label11.Visible:=False;
  end;
  {procedure TForm .ButtonClick(Sender: TObject);
   begin
     IBSQL .SQL.Clear;
     IBSQL .SQL.Add('execute procedure new_key');
     IBSQL .ExecQuery;
     Form.Caption := IBSQL.Current.Vars ;0].AsString;
   end;}
  if GlbPrecioMayRegOrden = 1 then
  BitBtn28.Visible:=False
  else
  BitBtn28.Visible:=True;
  edtFechaIni.Date := ExtraerFecha(GlbFechaTrnDiaria);
  edtFechaFin.Date := ExtraerFecha(GlbFechaTrnDiaria);
  FechaInicialStatusEquipo.Date := ExtraerFecha(GlbFechaTrnDiaria)-30;
  FechaFinalStatusEquipo.Date := ExtraerFecha(GlbFechaTrnDiaria);
  if GlbAplicaOfertas = 1 then
  BitBtn8.Enabled := True
  else BitBtn8.Enabled := False;

  if (UpperCase(GLBFormatoFactura) <> 'MAISONMARIE') then
  begin
    //TabSheet3.Visible:=False;
    PageControl1.Pages[2].TabVisible := False;
  end;
  if (GLBECOM = 0) then
  begin
    PageControl1.Pages[3].TabVisible := False;
  end;
  if (GlBCuadros = 1) then
  begin
    BitBtn41.Visible:=true;
    BitBtn41.BringToFront;
  end;
end;

procedure TfrmInventarioProd.BitBtn7Click(Sender: TObject);
begin
  if edtCodBarra.Text = '' then Exit;
  RxDBGrid4.SelectedRows.Clear;
  dmInventario.tblInventarioProd.AutoCalcFields:=False;
  //dmInventario.tblInventarioProd.DisableControls;
  if Not dmInventario.tblInventarioProd.Locate('codigo_barra', edtCodBarra.Text,[]) then
  begin
    dmInventario.tblInventarioProd.Insert;
    ProcIniciaDatos(edtCodBarra.Text);
    RxDBLookupCombo1.SetFocus;
  end else
  MessageDlg('Codigo ya fue registrado', mtInformation, [mbOK], 0);
  //dmInventario.tblInventarioProd.EnableControls;
  dmInventario.tblInventarioProd.AutoCalcFields:=True;
  Refresh;
end;

procedure TfrmInventarioProd.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if dmInventario.tblInventarioProd.State in [dsEdit,dsInsert] then
  begin
    Messagedlg('Hay una transacción pendiente, verifique', mtWarning,[mbok],0);
    CanClose:=False;
  end else CanClose:=True;
  dmInventario.tblInventarioProd.Filtered:=False;
end;

procedure TfrmInventarioProd.BitBtn8Click(Sender: TObject);
begin
  frmOfertas:=TfrmOfertas.Create(nil);
  try
    frmOfertas.xCodP:=dminventario.tblInventarioProdCODIGO.Value;
    frmOfertas.AbrirDatos(1,dminventario.tblInventarioProdCODIGO.Value);
    frmOfertas.Showmodal;
  finally
  frmOfertas.Free;
  frmOfertas:=Nil;
  end;
{  frmCambiarPrecio:=TfrmCambiarPrecio.Create(nil);
  try
    frmCambiarPrecio.showmodal;
  finally
  frmCambiarPrecio.free;
  frmCambiarPrecio:=nil;
  end;}
end;

procedure TfrmInventarioProd.FormShow(Sender: TObject);
begin
  if dmInventario.tblInventarioProd.State = dsInsert then
  RxDBLookupCombo1.SetFocus else edtCodBarra.SetFocus;
  FiltrarporTipoInv1.Enabled:=True;
  FiltrarporTipoInv1.Visible:=True;
  AutoInsertaEnPXU.Enabled:=True;
  AutoInsertaEnPXU.Enabled:=True;
  if GlbUsaPUnidadStd = 0 then
  begin
    AutoActualizaTablaUnidadPrecio1.Visible:= False;
    AutoInsertaEnPXU.Visible:= False;
  end else
  begin
    AutoActualizaTablaUnidadPrecio1.Visible:= True;
    AutoInsertaEnPXU.Visible:= True;
  end;
  dmInventario.tblInventarioProd.Next;
  dmInventario.tblInventarioProd.Prior;
  if (GlBCuadros = 1) then
  begin
    DBEdit22.Hint:='Al portador';
    DBEdit23.Hint:='Aficionado';
    DBEdit24.Hint:='Fotografo';
    DBEdit25.Hint:='Otros';
  end;
end;

procedure TfrmInventarioProd.ActionList1Execute(Action: TBasicAction;
  var Handled: Boolean);
begin
  if dmInventario.tblInventarioProd.State in [dsEdit, dsInsert] then
  Handled:=False;
end;

procedure TfrmInventarioProd.SpeedButton1Click(Sender: TObject);
begin
  if OpenPictureDialog1.Execute then
  begin
    if dmInventario.tblInventarioProd.State = dsBrowse then
    dmInventario.tblInventarioProd.Edit;
    dmInventario.tblInventarioProdFOTO.LoadFromFile(OpenPictureDialog1.FileName);
  end;
end;

procedure TfrmInventarioProd.DBEdit8Exit(Sender: TObject);
begin
  dbedit13.Color:= clWindow;
  if dmInventario.tblInventarioProd.State In [dsEdit, dsInsert] then
  begin
    if Not dmInventario.tblInventarioProdcodigo_precio.IsNull then
    dmInventario.tblInventarioProdPRECIO.Value :=
    PrecioCodigo(Trim(dmInventario.tblInventarioProdcodigo_precio.Value), dmInventario.QryValorLetras);
  end;
end;

procedure TfrmInventarioProd.BitBtn13Click(Sender: TObject);
begin
  {
    dmReportes.qryDatosRepInventario.Close;
    dmReportes.qryDatosRepInventario.Open;
  }
  dmReportes.qryRepInventarioProdMasBclRuta.close;
  if GlbVenderDesdeAlmacenP = 1 then
  dmReportes.qryRepInventarioProdMasBclRuta.SQL.Text := 'Select * from PROC_DATOS_REP_INVENTARIO_P'
  else
  dmReportes.qryRepInventarioProdMasBclRuta.SQL.Text := 'Select * from PROC_DATOS_REP_INVENTARIO';
  dmReportes.qryRepInventarioProdMasBclRuta.SQL.Add(' where cia_key ='+IntToStr(glbCia_Key));
  dmReportes.qryRepInventarioProdMasBclRuta.Open;
  qckRepDatosInventario:=TqckRepDatosInventario.Create(Nil);
  try
    qckRepDatosInventario.Prepare;
    qckRepDatosInventario.qrTpaginas.Caption:= ' de '+IntToStr(qckRepDatosInventario.PageNumber);
    qckRepDatosInventario.Preview;
  finally
  qckRepDatosInventario.Free;
  qckRepDatosInventario:=Nil;
  end;
end;

procedure TfrmInventarioProd.BitBtn14Click(Sender: TObject);
begin
  if dmInventario.tblInventarioSERIE.State in [dsBrowse] then
  begin
    dmInventario.tblInventarioSERIE.Append;
    dmInventario.tblInventarioSERIECODIGO.Value:=
    dmInventario.tblInventarioProdCODIGO.Value;
    dmInventario.tblInventarioSERIESTATUS.Value:='A';
    dmInventario.tblInventarioSERIESTATUS_EQUIPO.Value:=1;
    dbedit15.setfocus;
  end;
end;

procedure TfrmInventarioProd.BitBtn15Click(Sender: TObject);
begin
  if dmInventario.tblInventarioSERIE.State in [dsBrowse] then
  dmInventario.tblInventarioSERIE.Edit;
end;

procedure TfrmInventarioProd.BitBtn16Click(Sender: TObject);
begin
  if dmInventario.tblInventarioSERIE.State In [dsInsert, dsEdit] then
  dmInventario.tblInventarioSERIE.Cancel
  else
  begin
    if MessageDlg('Eliminar record?', mtInformation, [mbyes,mbno], 0)= mrYes then
    begin
      dmInventario.tblInventarioSERIE.Delete;
      dmInventario.tblInventarioSERIE.Post;
      dmInventario.tblInventarioSERIE.ApplyUpdates;
      try
        dmInventario.tblInventarioSERIE.Transaction.CommitRetaining;
      except
        dmInventario.tblInventarioSERIE.Transaction.RollbackRetaining;
      end;      
    end;
  end;
end;

procedure TfrmInventarioProd.BitBtn17Click(Sender: TObject);
begin
  if dmInventario.tblInventarioSERIE.State in [dsInsert, dsEdit] then
  begin
    dmInventario.tblInventarioSERIE.Post;
    dmInventario.tblInventarioSERIE.ApplyUpdates;
    try
      dmInventario.tblInventarioSERIE.Transaction.CommitRetaining;
    except
    dmInventario.tblInventarioSERIE.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmInventarioProd.BitBtn18Click(Sender: TObject);
begin
  if dmInventario.tblInventarioSERIE.State in [dsBrowse, dsInactive] then
  begin
    dmInventario.tblInventarioSERIE.Close;
    dmInventario.tblInventarioSERIE.Params[0].Value := dmInventario.tblInventarioProdCODIGO.Value;
    dmInventario.tblInventarioSERIE.Open;
  end;
end;

procedure TfrmInventarioProd.BitBtn22Click(Sender: TObject);
begin
  dmInventario.tblInventarioSERIE.First;
end;
procedure TfrmInventarioProd.BitBtn23Click(Sender: TObject);
begin
  dmInventario.tblInventarioSERIE.prior;
end;

procedure TfrmInventarioProd.BitBtn24Click(Sender: TObject);
begin
  dmInventario.tblInventarioSERIE.next;
end;

procedure TfrmInventarioProd.BitBtn25Click(Sender: TObject);
begin
  dmInventario.tblInventarioSERIE.last;
end;


procedure TfrmInventarioProd.BitBtn20Click(Sender: TObject);
begin
//https://labelary.com/viewer.html
  if GlbLabelZPL = 1 then
  begin
  frmCodigoBarraNew:=TfrmCodigoBarraNew.Create(Nil);
  try
    if frmCodigoBarraNew.qryInv.State = dsBrowse then
    begin
      if Not frmCodigoBarraNew.qryInv.Locate('codigo', dmInventario.tblInventarioProdCodigo.Value, []) then
      MessageDlg('Codigo no encontrado en tabla inventario.', mtInformation, [mbOK], 0);
    end;
    frmCodigoBarraNew.ShowModal;
  finally
  frmCodigoBarraNew.Free;
  frmCodigoBarraNew:= Nil;
  end;
  end else
  begin
  frmCodigoBarra:=TfrmCodigoBarra.Create(Nil);
  try
    if frmCodigoBarra.qryInv.state = dsInactive then
    frmCodigoBarra.qryInv.Open;
    frmCodigoBarra.chkUsarNuevoformato.Checked:=False;
    if not frmCodigoBarra.qryInv.Locate('codigo', dmInventario.tblInventarioProdCodigo.Value,[]) then
    MessageDlg('Codigo no encontrado en tabla inventario.', mtInformation, [mbOK], 0);
    frmCodigoBarra.ShowModal;
  finally
  frmCodigoBarra.Free;
  frmCodigoBarra:= Nil;
  end;
  end;
  //WinExec(PChar('CodBarra.exe'), SW_SHOWNORMAL); {Ejecuta modulo impresion labels}
end;

procedure TfrmInventarioProd.DBEdit7Change(Sender: TObject);
begin
  if dmInventario.tblInventarioProdCODIGO_TEXTO.Value = '' then exit;
  dmInventario.qryPrecioCompraArti.Close;
  dmInventario.qryPrecioCompraArti.Params[0].Value:= dmInventario.tblInventarioProdcodigo.Value;//tblInventarioProdCODIGO_TEXTO.Value;
  dmInventario.qryPrecioCompraArti.Open;
  if (dmInventario.tblInventarioSERIE.State In [dsBrowse, dsInactive] ) then
  begin
    dmInventario.tblInventarioSERIE.Close;
    dmInventario.tblInventarioSERIE.Params[0].Value := dmInventario.tblInventarioProdCODIGO.Value;
    dmInventario.tblInventarioSERIE.Open;
  end;
end;

procedure TfrmInventarioProd.RxDBGrid4GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  //if dmInventario.tblInventarioProdTIENEVENTAS.IsNull then
  //Background:=clCream
  //else
  if dmInventario.tblInventarioProdINVENTARIAR.Value = 0 then
  Background:=clGreen //$0000FF80
  else
  if dmInventario.tblInventarioProdTIPO_UNIDAD.IsNull then
  Background:=clYellow;
end;

procedure TfrmInventarioProd.tblTipoPrecioAfterScroll(DataSet: TDataSet);
begin
  qryClasifPrecio.Close;
  qryClasifPrecio.Params[0].Value := dmInventario.tblInventarioProdCODIGO.Value;
  qryClasifPrecio.Params[1].Value := tblTipoPrecioPRECIO_ID.Value;
  qryClasifPrecio.Open;
end;

procedure TfrmInventarioProd.BitBtn28Click(Sender: TObject);
begin
  if GlbPrecioMayRegOrden = 1 then
  panelClasifPrecio.Visible := True;
  tblTipoPrecio.Close;
  tblTipoPrecio.Open;
  tblTipoPrecio.First;
end;

procedure TfrmInventarioProd.BitBtn26Click(Sender: TObject);
begin
  panelClasifPrecio.Visible := false;
end;

procedure TfrmInventarioProd.BitBtn27Click(Sender: TObject);
begin
  if qryClasifPrecio.State = dsBrowse then
  begin
    if qryClasifPrecio.RecordCount = 0  then
    begin
      qryClasifPrecio.Insert;
      qryClasifPrecioCOD_PRODUCTO.Value:= dmInventario.tblInventarioProdCODIGO.Value;;
      qryClasifPrecioPRECIO_ID.Value   := tblTipoPrecioPRECIO_ID.Value;
      qryClasifPrecioIN_POR.Value      := StrUserName;
      qryClasifPrecioFECHA_IN.Value    := Now;
      DBGrid2.SetFocus;
    end else
    begin
      qryClasifPrecio.Edit;
      qryClasifPrecioMOD_POR.Value:= strUserName;
      qryClasifPrecioFECHA_MOD.Value:= ExtraerFecha(Date);
    end;
  end;
end;

procedure TfrmInventarioProd.BitBtn21Click(Sender: TObject);
begin
  if qryClasifPrecio.State In [dsEdit, dsInsert] then
  begin
    qryClasifPrecio.Post;
    qryClasifPrecio.ApplyUpdates;
    if Not qryClasifPrecio.Transaction.InTransaction then
    qryClasifPrecio.Transaction.StartTransaction;
    try
      qryClasifPrecio.Transaction.CommitRetaining;
    except
    qryClasifPrecio.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmInventarioProd.qryClasifPrecioCalcFields(DataSet: TDataSet);
begin
  if dmInventario.tblInventarioProdPRECIO_COMPRA.Value > 0 then
  qryClasifPrecioMargenG.Value :=
 ((qryClasifPrecioPRECIO_VENTA.Value - dmInventario.tblInventarioProdPRECIO_COMPRA.Value) /
   dmInventario.tblInventarioProdPRECIO_COMPRA.Value) * 100;
end;

procedure TfrmInventarioProd.BitBtn29Click(Sender: TObject);
var
  xProd : integer;
begin
  if (dmInventario.tblInventarioProdPRECIO_COMPRA.Value <= 0) then
  begin
    MessageDlg('Favor indicar costo del producto.',mtwarning,[mbok],0);
    if showing then
    DBEdit11.SetFocus;
    exit;                      
  end;
  if (GLBPrecioMayUnidad = 1) then
  begin
    xProd := dmInventario.tblInventarioProdCodigo.Value;
    frmPrecioUnidadNivel:=TfrmPrecioUnidadNivel.Create(Nil);
    try
      frmPrecioUnidadNivel.xProd := xProd;
      frmPrecioUnidadNivel.buscarCodigo(xProd);

      if (xProd <> dmInventario.tblInventarioProdCODIGO.Value) then
      begin
        dmInventario.tblInventarioProd.DisableControls;
        dmInventario.tblInventarioProd.Locate('CODIGO',xProd,[]);
        dmInventario.tblInventarioProd.EnableControls;
      end;
      
      frmPrecioUnidadNivel.Showmodal;
      if dmInventario.tblInventarioProdPRECIO.Value <>
      dmInventario.tblPrecioUnidadXNivelPRECIOVENTA1.Value then
      begin
         dmInventario.tblInventarioProd.Edit;
         dmInventario.tblInventarioProdPRECIO.Value:=dmInventario.tblPrecioUnidadXNivelPRECIOVENTA1.Value;
         dmInventario.tblInventarioProdPRECIO_MINIMO.Value:=dmInventario.tblPrecioUnidadXNivelPRECIOVENTA1.Value;
         BitBtn4Click(Self);
      end;

    finally
    frmPrecioUnidadNivel.Free;
    frmPrecioUnidadNivel:=Nil;
    end;
  end else
  if GlbUsaPUnidadLevel = 1 then
  begin
    xProd := dmInventario.tblInventarioProdCodigo.Value;
    frmPrecioUnidadNivel:=TfrmPrecioUnidadNivel.Create(Nil);
    try
      frmPrecioUnidadNivel.xProd := xProd;
      frmPrecioUnidadNivel.buscarCodigo(xProd);
      if (xProd <> dmInventario.tblInventarioProdCODIGO.Value) then
      begin
        dmInventario.tblInventarioProd.DisableControls;
        dmInventario.tblInventarioProd.Locate('CODIGO',xProd,[]);
        dmInventario.tblInventarioProd.EnableControls;
      end;
     
      frmPrecioUnidadNivel.Showmodal;
    finally
    frmPrecioUnidadNivel.Free;
    frmPrecioUnidadNivel:=Nil;
    end;
  end else
  begin
    frmPrecioProdXUnidad:=TfrmPrecioProdXUnidad.Create(nil);
    try
      frmPrecioProdXUnidad.buscarCodigo(dmInventario.tblInventarioProdCodigo.Value);
      frmPrecioProdXUnidad.Showmodal;
    finally
    frmPrecioProdXUnidad.Free;
    frmPrecioProdXUnidad:=Nil;
    end;
  end;
end;

procedure TfrmInventarioProd.CalcularPrecio(idx:smallint;porcValue:Extended);
begin    //corregir
  //if not CheckBox1.Checked then exit;
  if (GlbUsaescalaPrecio = 0) then exit;
  if (porcValue = 0) then exit;
  if dmInventario.tblInventarioProd.State in [dsBrowse,dsInactive] then exit;
  case idx of
  1:begin
   //if dmInventario.tblInventarioProdPORCUTILIDAD1.Value > 0 then
      dmInventario.tblInventarioProdPRECIOVENTA1.Value:=
    (1 + porcValue / 100) *
    dmInventario.tblInventarioProdPRECIO_COMPRA.Value;
    end;
  2:begin
     //if dmInventario.tblInventarioProdPORCUTILIDAD2.Value > 0 then
     dmInventario.tblInventarioProdPRECIOVENTA2.Value:=
     (1 + porcValue / 100) *
     dmInventario.tblInventarioProdPRECIO_COMPRA.Value;
    end;
  3:begin
     //if dmInventario.tblInventarioProdPORCUTILIDAD3.Value > 0 then
     dmInventario.tblInventarioProdPRECIOVENTA3.Value:=
     (1 + porcValue / 100) *
     dmInventario.tblInventarioProdPRECIO_COMPRA.Value;
    end;

  4:begin
     //if dmInventario.tblInventarioProdPORCUTILIDAD4.Value > 0 then
     dmInventario.tblInventarioProdPRECIOVENTA4.Value:=
     (1 + porcValue / 100) *
     dmInventario.tblInventarioProdPRECIO_COMPRA.Value;
    end;
  end;//case
  
  if dmInventario.tblInventarioProdPRECIOVENTA4.Value > 0 then
  dmInventario.tblInventarioProdPRECIO_MINIMO.Value:=
  dmInventario.tblInventarioProdPRECIOVENTA4.Value;

  if dmInventario.tblInventarioProdPRECIOVENTA1.Value > 0 then
  dmInventario.tblInventarioProdPRECIO.Value:=
  dmInventario.tblInventarioProdPRECIOVENTA1.Value;
end;

procedure TfrmInventarioProd.DBEdit26Exit(Sender: TObject);
begin
  //t if not CheckBox1.Checked then exit;
  if length(DBEdit26.Text) = 0 then
  DBEdit26.Text:='0';
  CalcularPrecio(1,StrToFloat(DBEdit26.Text));
end;

procedure TfrmInventarioProd.DBEdit27Exit(Sender: TObject);
begin
  //t if not CheckBox1.Checked then exit;
  if length(DBEdit27.Text) = 0 then
  DBEdit27.Text:='0';
  CalcularPrecio(2,StrToFloat(DBEdit27.Text));
end;

procedure TfrmInventarioProd.DBEdit28Exit(Sender: TObject);
begin
  //t if not CheckBox1.Checked then exit;
  if length(DBEdit28.Text) = 0 then
  DBEdit28.Text:='0';
  CalcularPrecio(3,StrToFloat(DBEdit28.Text));
end;

procedure TfrmInventarioProd.DBEdit29Exit(Sender: TObject);
begin
  //t if not CheckBox1.Checked then exit;
  if length(DBEdit29.Text) = 0 then
  DBEdit29.Text:='0';
  CalcularPrecio(4,StrToFloat(DBEdit29.Text));
end;

procedure TfrmInventarioProd.BitBtn30Click(Sender: TObject);
begin
  frmListadoCostoProdProveedor:=TfrmListadoCostoProdProveedor.Create(Nil);
  try
    frmListadoCostoProdProveedor.AbrirQuery(dmInventario.tblInventarioProdCodigo.value);
    frmListadoCostoProdProveedor.Showmodal;
  finally
  frmListadoCostoProdProveedor.Free;
  frmListadoCostoProdProveedor:=Nil;
  end;
end;

procedure TfrmInventarioProd.DBEdit11Exit(Sender: TObject);
begin
  DBEdit11.Color := clWindow;

  DBEdit11Change(Self);
  DBEdit26Exit(Self);
  DBEdit27Exit(Self);
  DBEdit28Exit(Self);
  DBEdit29Exit(Self);
  if dmInventario.tblInventarioProd.State in [dsEdit, dsInsert] then
  begin
    if GlbUsaescalaPrecio = 1 then
     dmInventario.tblInventarioProdPrecio_Minimo.Value:= AsignarValorMinimo;
  end;
end;

procedure TfrmInventarioProd.DBMemo1DblClick(Sender: TObject);
begin
  frmDescripcionAdicional:=tfrmDescripcionAdicional.Create(Nil);
  try
   frmDescripcionAdicional.Showmodal;
  finally
  frmDescripcionAdicional.Free;
  frmDescripcionAdicional:=Nil;
  end;
end;

procedure TfrmInventarioProd.BitBtn31Click(Sender: TObject);
begin
  DBMemo1DblClick(Self);
end;

procedure TfrmInventarioProd.BitBtn32Click(Sender: TObject);
begin
  if Length(dmInventario.tblInventarioProdRUTAIMAGEN.Value) > 0 then
  begin
    Image1.Picture.LoadFromFile(dmInventario.tblInventarioProdRUTAIMAGEN.Value);
    Image1.Visible:=True;
  end else Image1.Visible:=False;

  frmShowImages:=TfrmShowImages.Create(Nil);
  try
    if not dmInventario.tblInventarioProdRUTAIMAGEN.IsNull then
    begin
      frmShowImages.FDirectory:= dmInventario.tblInventarioProdRUTAIMAGEN.Value;
    end;
    frmShowImages.LoadImageData;
    frmShowImages.ShowModal;
  finally
  frmShowImages.free;
  frmShowImages:=nil;
  end;
end;

procedure TfrmInventarioProd.DBEdit31DblClick(Sender: TObject);
begin
  if OpenPictureDialog1.Execute then
  begin
    if dmInventario.tblInventarioProd.State = dsBrowse then
    dmInventario.tblInventarioProd.Edit;
    dmInventario.tblInventarioProdrutaimagen.value := ExtractFilePath(OpenPictureDialog1.FileName);
  end;
end;

procedure TfrmInventarioProd.DBEdit31Click(Sender: TObject);
begin
  if dmInventario.tblInventarioProdRUTAIMAGEN.IsNull then
  begin
    if dmInventario.tblInventarioProd.State = dsBrowse then
    dmInventario.tblInventarioProd.Edit;
    dmInventario.tblInventarioProdRUTAIMAGEN.Value := GlbRootImg + '\' + dmInventario.tblInventarioProdCODIGO.AsString;
  end;
end;

procedure TfrmInventarioProd.RxDBGrid4KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if AplicandoPorc then exit;
  if (Key = VK_DOWN) then
  begin
    dmInventario.tblInventarioProd.DisableControls;
    dmInventario.tblInventarioProd.Next;
    if dmInventario.tblInventarioProd.Eof then
      Key := 0
    else
      dmInventario.tblInventarioProd.Prior;
    dmInventario.tblInventarioProd.EnableControls;
  end;
end;

procedure TfrmInventarioProd.CalcularPorcentaje(idx: smallint;
  Precio: Extended);
begin
  if not CheckBox1.Checked then exit;
  //MU = (Precio de Venta - Costo) / Precio de Venta obtenemos:
  if dmInventario.tblInventarioProd.State in [dsBrowse,dsInactive] then Exit; 
  case idx of
  1:begin
   //if dmInventario.tblInventarioProdPORCUTILIDAD1.Value > 0 then
   if dmInventario.tblInventarioProdPRECIOVENTA1.Value > 0 then
   if dmInventario.tblInventarioProdPRECIO_COMPRA.Value > 0 then
      dmInventario.tblInventarioProdPORCUTILIDAD1.Value:=
      ((dmInventario.tblInventarioProdPRECIOVENTA1.Value - dmInventario.tblInventarioProdPRECIO_COMPRA.Value)/
      dmInventario.tblInventarioProdPRECIO_COMPRA.Value)*100;
    end;
  2:begin
      //if dmInventario.tblInventarioProdPORCUTILIDAD2.Value > 0 then
      if dmInventario.tblInventarioProdPRECIOVENTA2.Value > 0 then
      if dmInventario.tblInventarioProdPRECIO_COMPRA.Value > 0 then
      dmInventario.tblInventarioProdPORCUTILIDAD2.Value:=
      ((dmInventario.tblInventarioProdPRECIOVENTA2.Value - dmInventario.tblInventarioProdPRECIO_COMPRA.Value)/
      dmInventario.tblInventarioProdPRECIO_COMPRA.Value)*100;
    end;
  3:begin
     //if dmInventario.tblInventarioProdPORCUTILIDAD3.Value > 0 then
      if dmInventario.tblInventarioProdPRECIOVENTA3.Value > 0   then
      if dmInventario.tblInventarioProdPRECIO_COMPRA.Value > 0 then
      dmInventario.tblInventarioProdPORCUTILIDAD3.Value:=  ((dmInventario.tblInventarioProdPRECIOVENTA3.Value -
      dmInventario.tblInventarioProdPRECIO_COMPRA.Value)/
      dmInventario.tblInventarioProdPRECIO_COMPRA.Value)*100;
    end;

  4:begin
     //if dmInventario.tblInventarioProdPORCUTILIDAD4.Value > 0 then
      if dmInventario.tblInventarioProdPRECIOVENTA4.Value > 0  then
      if dmInventario.tblInventarioProdPRECIO_COMPRA.Value > 0 then
      dmInventario.tblInventarioProdPORCUTILIDAD4.Value:=  ((dmInventario.tblInventarioProdPRECIOVENTA4.Value -
      dmInventario.tblInventarioProdPRECIO_COMPRA.Value)/
      dmInventario.tblInventarioProdPRECIO_COMPRA.Value)*100;
    end;
  end;//case
  if (dmInventario.tblInventarioProdPRECIOVENTA1.Value > 0) and
     (dmInventario.tblInventarioProdPRECIOVENTA4.Value > 0) then
  begin
    if idx = 4 then
    dmInventario.tblInventarioProdPRECIO_MINIMO.Value:=
    dmInventario.tblInventarioProdPRECIOVENTA4.Value;
    if idx = 1 then
    begin
      dmInventario.tblInventarioProdPRECIO.Value:=
      dmInventario.tblInventarioProdPRECIOVENTA1.Value;
      //dmInventario.qryPrecioCompraArtiCalcFields(dmInventario.qryPrecioCompraArti);
    end;
  end;
end;

procedure TfrmInventarioProd.DBEdit22Exit(Sender: TObject);
begin
  if (DBEdit22.Text <> '') then
  CalcularPorcentaje(1,dmInventario.tblInventarioProdPRECIOVENTA1.Value);
  if (dmInventario.tblInventarioProd.State in [dsInsert, dsEdit]) then
  dmInventario.tblInventarioProdPRECIO.Value:= dmInventario.tblInventarioProdPRECIOVENTA1.Value;
end;

procedure TfrmInventarioProd.DBEdit23Exit(Sender: TObject);
begin
  if (DBEdit23.Text <> '') then
  CalcularPorcentaje(2,dmInventario.tblInventarioProdPRECIOVENTA2.Value);
end;

procedure TfrmInventarioProd.DBEdit24Exit(Sender: TObject);
begin
  if (GlbCuadros = 1) and (dmInventario.tblInventarioProdPRECIOVENTA1.Value > 0) then
  if dmInventario.tblInventarioProd.State in [dsEdit, dsInsert] then
  dmInventario.tblInventarioProdPRECIO_MINIMO.Value:=  GetPrecioMinimo(
  dmInventario.tblInventarioProdPRECIOVENTA1.Value,
  dmInventario.tblInventarioProdPRECIOVENTA2.Value,
  dmInventario.tblInventarioProdPRECIOVENTA3.Value,
  dmInventario.tblInventarioProdPRECIOVENTA4.Value);

  if (DBEdit24.Text <> '') then
  CalcularPorcentaje(3,dmInventario.tblInventarioProdPRECIOVENTA3.Value);
end;

procedure TfrmInventarioProd.DBEdit25Exit(Sender: TObject);
begin
  if (GlbCuadros = 1) and (dmInventario.tblInventarioProdPRECIOVENTA1.Value > 0) then
  if dmInventario.tblInventarioProd.State in [dsEdit, dsInsert] then
  dmInventario.tblInventarioProdPRECIO_MINIMO.Value:=  GetPrecioMinimo(
  dmInventario.tblInventarioProdPRECIOVENTA1.Value,
  dmInventario.tblInventarioProdPRECIOVENTA2.Value,
  dmInventario.tblInventarioProdPRECIOVENTA3.Value,
  dmInventario.tblInventarioProdPRECIOVENTA4.Value);


  if (DBEdit25.Text <> '') then
  CalcularPorcentaje(4,dmInventario.tblInventarioProdPRECIOVENTA4.Value);
end;

procedure TfrmInventarioProd.ConsultaGeneral1Click(Sender: TObject);
begin
  frmConsultaInventario:=TfrmConsultaInventario.Create(Nil);
  try
    if frmConsultaInventario.Showmodal = mrOk then
    begin
      dmInventario.tblInventarioProd.DisableControls;
      dmInventario.tblInventarioProd.locate('codigo',frmConsultaInventario.ibquery1codigo.Value,[]);
      dmInventario.tblInventarioProd.EnableControls;
    end;
  finally
  frmConsultaInventario.Free;
  frmConsultaInventario:=Nil;
  end;
end;

procedure TfrmInventarioProd.BitBtn33Click(Sender: TObject);
begin
  frmTasaITBIS:=TfrmTasaITBIS.Create(Nil);
  try
    frmTasaITBIS.ShowModal;
  finally
  frmTasaITBIS.Free;
  frmTasaITBIS:=Nil;
  end;
end;

procedure TfrmInventarioProd.DBEdit11Enter(Sender: TObject);
begin
  DBEdit11.Color := clYellow;
end;

procedure TfrmInventarioProd.DBEdit13Enter(Sender: TObject);
begin
  dbedit13.Color:= clYellow; 
end;

procedure TfrmInventarioProd.FiltrarporTipoInv1Click(Sender: TObject);
begin
  if FiltrarporTipoInv1.Checked then
  begin
    dmInventario.tblInventarioProd.Filtered:= False;
    FiltrarporTipoInv1.Checked := False;
    RxLabel3.Caption:='';
    RxLabel3.Color:= clBtnFace;
  end else
  begin
    frmFiltrarInv:=TfrmFiltrarInv.Create(Nil);
    try
      if frmFiltrarInv.Showmodal = mrOk then
      begin
        dmInventario.tblInventarioProd.Filtered:=False;
        dmInventario.filterTipoInv := frmFiltrarInv.qryTipoInvCodigo.Value;
        dmInventario.tblInventarioProd.Filtered:=True;
        RxDBLookupCombo1.Color := clGreen;
        RxLabel3.Caption :='Filtro Aplicado';
        FiltrarporTipoInv1.Checked := True;
        RxLabel3.Color:= clRed;
      end else
      begin
        RxLabel3.Caption:='';
        RxLabel3.Color:= clBtnFace;
        FiltrarporTipoInv1.Checked := False;        
        dmInventario.tblInventarioProd.Filtered:=False;
      end;
    finally
    frmFiltrarInv.Free;
    frmFiltrarInv:=Nil;
    end;
  end;
end;

procedure TfrmInventarioProd.ClonarRecord1Click(Sender: TObject);
var
   i : integer;
begin
  rxInv.Close;
  rxInv.Open;
  rxInv.Insert;
  For i:=0 To dmInventario.tblInventarioProd.Fields.Count - 1 Do
  begin
    try
      if dmInventario.tblInventarioProd.Fields.Fields[i].FieldKind in [fkData] then
         rxInv.FieldByName(dmInventario.tblInventarioProd.Fields.Fields[i].FieldName).Value :=
         dmInventario.tblInventarioProd.Fields.Fields[i].Value;
    except
    end;
  end;
  dmInventario.tblInventarioProd.Append;
  dmInventario.tblInventarioProd.AutoCalcFields:=True;
  dmInventario.tblInventarioProd.EnableControls;
  For i:=0 To rxInv.Fields.Count - 1 Do
  begin
    try
    if dmInventario.tblInventarioProd.Fields.Fields[i].FieldKind in [fkData] then
       dmInventario.tblInventarioProd.FieldByName(rxInv.Fields.Fields[i].FieldName).Value :=
       rxInv.Fields.Fields[i].Value;
    except
    end;
  end;
  dmInventario.tblInventarioProdCODIGO.AsVariant := Null;
  dmInventario.tblInventarioProdCODIGO_BARRA.AsVariant := Null;
  dmInventario.tblInventarioProdCODIGO_TEXTO.AsVariant := Null;
  dmInventario.tblInventarioProdDESCRIPCION.AsVariant:= Null;
  dmInventario.tblInventarioProdDESCRIPCIONADICIONAL.AsVariant:= Null;
  dmInventario.tblInventarioProdPRECIO.AsVariant := null;
  dmInventario.tblInventarioProdPRECIO_MINIMO.AsVariant:= Null;
  dmInventario.tblInventarioProdPAGACOMISION.Value     := 0;
  if (glbUsaescalaPrecio = 1) then
  begin
    if GlbFarmacia = 1 then
    begin
      try
      dmInventario.tblInventarioProdPORCUTILIDAD1.Value:= frmtrgtr.tRegistroPORC_UTILIDAD1.Value;
      dmInventario.tblInventarioProdPORCUTILIDAD2.Value:= frmtrgtr.tRegistroPORC_UTILIDAD2.Value;
      dmInventario.tblInventarioProdPORCUTILIDAD3.Value:= frmtrgtr.tRegistroPORC_UTILIDAD3.Value;
      dmInventario.tblInventarioProdPORCUTILIDAD4.Value:= frmtrgtr.tRegistroPORC_UTILIDAD4.Value;
      except
      end;
    end else
    begin
      dmInventario.tblInventarioProdPORCUTILIDAD1.Value:= 50;
      dmInventario.tblInventarioProdPORCUTILIDAD2.Value:= 45;
      dmInventario.tblInventarioProdPORCUTILIDAD3.Value:= 40;
      dmInventario.tblInventarioProdPORCUTILIDAD4.Value:= 35;
    end;
  end;
  if dmInventario.tblInventarioProd.State in [dsInsert, dsEdit] then
  begin
    DBEdit2.SetFocus;
  end;
end;

procedure TfrmInventarioProd.BitBtn34Click(Sender: TObject);
var
    strCond : String;
begin
  qryStatusAlquiler.Close;
  strCond:='';
  case rdgTipoOpe.ItemIndex of
  0:begin
      strCond := ' And r.tipo_ope = 1 ';
    end;
  1:begin
       strCond := ' And r.tipo_ope = 2 ';
    end;
  2:begin
      strCond := ' And r.tipo_ope = 3 ';
    end;
  end;

  Case rdgFecha.ItemIndex Of
  0:begin
      strCond := strCond + ' And r.fecha Between '+chr(39)+
      FormatDateTime('mm/dd/yyyy', edtFechaIni.Date)+chr(39)+
      ' and ' +chr(39)+
      FormatDateTime('mm/dd/yyyy', edtFechaFin.Date)+chr(39);
    end;
  1:begin
      strCond := strCond + ' And r.fecha_Entrada Between '+chr(39)+
      FormatDateTime('mm/dd/yyyy', edtFechaIni.Date)+chr(39)+
      ' and ' +chr(39)+
      FormatDateTime('mm/dd/yyyy', edtFechaFin.Date)+chr(39);
    end;
  2:begin
      strCond := strCond + ' And r.FECHA_ENT_ESTIMADA Between '+chr(39)+
      FormatDateTime('mm/dd/yyyy', edtFechaIni.Date)+chr(39)+
      ' and ' +chr(39)+
      FormatDateTime('mm/dd/yyyy', edtFechaFin.Date)+chr(39);
    end;
  end;
  case rdgRecibidos.ItemIndex of
  0:begin
      strCond := strCond + ' And r.fecha_Entrada is not null ';
    end;
  1:begin
       strCond :=strCond + ' And r.fecha_Entrada is null ';
    end;
  end;
  qryStatusAlquiler.SQL.Text := qryStatusAlquiler_Base.SQL.Text +
  strCond+' order by r.idserie desc';
  qryStatusAlquiler.Open;
end;

procedure TfrmInventarioProd.RxDBGrid2GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if (Field.Name = 'status') then
  Background := $00F9FAD1;
end;

procedure TfrmInventarioProd.RxDBGrid2DblClick(Sender: TObject);
begin
  dmInventario.tblInventarioProd.DisableControls;
  if dmInventario.tblInventarioProd.Locate('CODIGO', qryStatusAlquilerCOD_PRODUCTO.Value,[]) then
  PageControl1.TabIndex:=0;
  dmInventario.tblInventarioProd.EnableControls;
end;

procedure TfrmInventarioProd.Categorias1Click(Sender: TObject);
begin
  frmCategoriaInv:=tfrmCategoriaInv.Create(Nil);
  try
    frmCategoriaInv.ShowModal;
  finally
  frmCategoriaInv.Free;
  frmCategoriaInv:=Nil;
  end;
end;

procedure TfrmInventarioProd.SubCategoria1Click(Sender: TObject);
begin
  frmSubCategoriaInv:=tfrmSubCategoriaInv.Create(Nil);
  try
    frmSubCategoriaInv.ShowModal;
  finally
  frmSubCategoriaInv.Free;
  frmSubCategoriaInv:=Nil;
  end;
end;

procedure TfrmInventarioProd.AutoActualizaTablaUnidadPrecio1Click(
  Sender: TObject);
  var
    p1: Currency;
begin
  if GlbUsaPUnidadStd = 0 then Exit;
  ProgressBar1.Visible:= True;
  dmInventario.tblInventarioProd.Last;  
  ProgressBar1.Max:=dmInventario.tblInventarioProd.recordcount;
  ProgressBar1.Position:=0;
  dmInventario.qryLookupUnidad.Close;
  dmInventario.qryLookupUnidad.Open;

  dmInventario.tblInventarioProd.First;
  dmInventario.tblInventarioProd.DisableControls;
  RxDBGrid4.DisableScroll;
  While Not dmInventario.tblInventarioProd.Eof Do
  begin
    Application.ProcessMessages;
    ProgressBar1.StepIt;
    dmInventario.tblPrecioUnidadXNivel.Close;
    dmInventario.tblPrecioUnidadXNivel.Params[0].Value:=dmInventario.tblInventarioProdCODIGO.Value;
    dmInventario.tblPrecioUnidadXNivel.Open;
    dmInventario.qryLookupUnidad.First;
    While Not dmInventario.qryLookupUnidad.Eof do
    begin
      //dmInventario.tblPrecioUnidadXNivel
      if (dmInventario.tblInventarioProdPRECIO_TIPO_UNIDAD.Value = 0) and
         (dmInventario.tblInventarioProdTIPO_UNIDAD.Value > 1) then
      begin
        dmInventario.qryLookupUnidad.Next;
        continue;
      end;

      dmInventario.tblPrecioUnidadXNivel.DisableControls;
      if not dmInventario.tblPrecioUnidadXNivel.Locate('IDUNIDAD;COD_PRODUCTO',
      VarArrayOf([dmInventario.qryLookupUnidadIdUnidad.Value,
      dmInventario.tblInventarioProdCODIGO.Value]),[]) then
      begin
        if (dmInventario.qryLookupUnidadIdUnidad.Value <>
           dmInventario.tblInventarioProdTIPO_UNIDAD.Value) then
           begin
             dmInventario.qryLookupUnidad.Next;
             continue;
           end;

        dmInventario.tblPrecioUnidadXNivel.Append;
        dmInventario.tblPrecioUnidadXNivelIDUNIDAD.Value    := dmInventario.qryLookupUnidadidunidad.value;
        dmInventario.tblPrecioUnidadXNivelCOD_PRODUCTO.Value:= dmInventario.tblInventarioProdCODIGO.Value;
        dmInventario.tblPrecioUnidadXNivelCANTIDAD.Value    := dmInventario.qryLookupUnidadCANTIDAD.Value;

        if dmInventario.qryLookupUnidadIDUNIDAD.Value = 1 then
        dmInventario.tblPrecioUnidadXNivelPRECIOVENTA1.Value:=
        dmInventario.tblInventarioProdPRECIO.Value
        else
        dmInventario.tblPrecioUnidadXNivelPRECIOVENTA1.Value:=
        dmInventario.tblInventarioProdPRECIO_TIPO_UNIDAD.Value;

        p1:=dmInventario.tblInventarioProdPRECIO_COMPRA.Value *
        dmInventario.qryLookupUnidadCANTIDAD.Value;

        if (p1 > 0) then
        dmInventario.tblPrecioUnidadXNivelPORCUTILIDAD1.Value:=
        (dmInventario.tblPrecioUnidadXNivelPRECIOVENTA1.Value -
         p1)/p1*100;
         dmInventario.tblPrecioUnidadXNivelCOD_USUARIO_IN.Value:=VarUsuarioGlb;
         dmInventario.tblPrecioUnidadXNivelFECHA_IN.Value:=now;
         GlbSalvarQuery(dmInventario.tblPrecioUnidadXNivel);
         dmInventario.tblPrecioUnidadXNivel.EnableControls;
      end;
      dmInventario.qryLookupUnidad.Next;
    end;
    dmInventario.tblInventarioProd.Next;
  end;
  ProgressBar1.visible:=False;
  dmInventario.tblInventarioProd.EnableControls;
  dmInventario.tblPrecioUnidadXNivel.EnableControls;
  RxDBGrid4.EnableScroll;
  beep;  
end;

procedure TfrmInventarioProd.AutoInsertaEnPXUClick(Sender: TObject);
var
    p1 : Currency;
    tUniAuxi:integer;
    PrecioCompraAuxi:Currency;
begin
  if GlbUsaPUnidadStd = 0 then Exit;
  if (GLBPrecioMayUnidad <> 1) or (GlbUsaPUnidadLevel <> 1) then
  begin
    MessageDlg('Solo aplica para Precios x Unidad',mtInformation,[mbOk],0);
    exit;
  end;
  ProgressBar1.Visible:= True;
  if not dmInventario.Proc_ViewInvSinPrecioXUnidad then
  begin
    MessageDlg('Todos los productos fueron encontrado en tabla precio x unidad',mtInformation,[mbOk],0);
  end else
  begin
    dmInventario.QryViewInvSinPrecXUni.Last;
    if not MessageDlg(IntToStr(dmInventario.QryViewInvSinPrecXUni.RecordCount)+ ' sin valor en tabla precio x unidad, continuar?',mtInformation,[mbyes,mbno],0) = mryes then
    exit;
  end;
  dmInventario.QryViewInvSinPrecXUni.Last;
  ProgressBar1.Max:=dmInventario.QryViewInvSinPrecXUni.Recordcount;
  ProgressBar1.Position:=0;
  dmInventario.qryLookupUnidad.Close;
  dmInventario.qryLookupUnidad.Open;

  dmInventario.QryViewInvSinPrecXUni.First;
  dmInventario.QryViewInvSinPrecXUni.DisableControls;
  RxDBGrid4.DisableScroll;

  if not MessageDlg('Insertar Productos en tabla precio x unidad?',mtInformation,[mbYes, mbno],0) = mryes then
  exit;
  //if (GLBPrecioMayUnidad = 1) or (GlbUsaPUnidadLevel = 1) then
  //if dmInventario.Proc_ViewInvSinPrecioXUnidad then
  begin
    dmInventario.QryViewInvSinPrecXUni.First;
    while not dmInventario.QryViewInvSinPrecXUni.Eof do
    begin
      begin
        Application.ProcessMessages;
        ProgressBar1.StepIt;
        if dmInventario.QryViewInvSinPrecXUniDESCRIPCION.IsNull then
        begin
          dmInventario.QryViewInvSinPrecXUni.next;
          continue;
        end;
        dmInventario.tblPrecioUnidadXNivel.Close;
        dmInventario.tblPrecioUnidadXNivel.Params[0].Value:= dmInventario.QryViewInvSinPrecXUniCODIGO.Value;
        dmInventario.tblPrecioUnidadXNivel.Open;
        dmInventario.qryLookupUnidad.First;
        While Not dmInventario.qryLookupUnidad.Eof do
        begin                                                      
          if dmInventario.QryViewInvSinPrecXUniPRECIO_COMPRA.IsNull or
          (dmInventario.QryViewInvSinPrecXUniPRECIO_COMPRA.Value = 0) then
          PrecioCompraAuxi:=dmInventario.QryViewInvSinPrecXUniPRECIO.Value -
          (dmInventario.QryViewInvSinPrecXUniPRECIO.Value / 2)
          ELSE
          PrecioCompraAuxi:=dmInventario.QryViewInvSinPrecXUniPRECIO_COMPRA.Value;
          
          //dmInventario.tblPrecioUnidadXNivel
          if (dmInventario.QryViewInvSinPrecXUniPRECIO_TIPO_UNIDAD.Value = 0) and
             (dmInventario.QryViewInvSinPrecXUniTIPO_UNIDAD.Value > 1) then
          begin
            dmInventario.qryLookupUnidad.Next;
            continue;
          end;
          try
          if Not dmInventario.tblPrecioUnidadXNivel.Locate('IDUNIDAD;COD_PRODUCTO',
          VarArrayOf([dmInventario.qryLookupUnidadIdUnidad.Value,
          dmInventario.QryViewInvSinPrecXUniCODIGO.Value]),[]) then
          begin
            if (dmInventario.qryLookupUnidadIdUnidad.Value <>
            dmInventario.QryViewInvSinPrecXUniTIPO_UNIDAD.Value) then
            begin
              dmInventario.qryLookupUnidad.Next;
              continue;
            end;

            dmInventario.tblPrecioUnidadXNivel.Append;
            dmInventario.tblPrecioUnidadXNivelIDUNIDAD.Value    := dmInventario.qryLookupUnidadidunidad.value;
            dmInventario.tblPrecioUnidadXNivelCOD_PRODUCTO.Value:= dmInventario.QryViewInvSinPrecXUniCODIGO.Value;
            dmInventario.tblPrecioUnidadXNivelCANTIDAD.Value    := dmInventario.qryLookupUnidadCANTIDAD.Value;

            if dmInventario.qryLookupUnidadIDUNIDAD.Value = 1 then
            dmInventario.tblPrecioUnidadXNivelPRECIOVENTA1.Value:=
            dmInventario.tblInventarioProdPRECIO.Value
            else
            dmInventario.tblPrecioUnidadXNivelPRECIOVENTA1.Value:=
            dmInventario.tblInventarioProdPRECIO_TIPO_UNIDAD.Value;

            p1:=PrecioCompraAuxi *
            dmInventario.qryLookupUnidadCANTIDAD.Value;
            if ((dmInventario.tblPrecioUnidadXNivelPRECIOVENTA1.Value -
            p1)/p1*100) <= 0 then
            begin
              dmInventario.tblPrecioUnidadXNivel.Cancel;
              dmInventario.qryLookupUnidad.Next;
              Continue;
            end;
            if (p1 > 0) then
            dmInventario.tblPrecioUnidadXNivelPORCUTILIDAD1.Value:=
            (dmInventario.tblPrecioUnidadXNivelPRECIOVENTA1.Value -
            p1)/p1*100;
            dmInventario.tblPrecioUnidadXNivelCOD_USUARIO_IN.Value:=VarUsuarioGlb;
            dmInventario.tblPrecioUnidadXNivelFECHA_IN.Value:=now;
            try
            GlbSalvarQuery(dmInventario.tblPrecioUnidadXNivel);
            except
            end;
          end;
          except
            LogInformacionTxt('Error frmInventario act precio x cant');
          end;
          dmInventario.qryLookupUnidad.Next;
        end;
      end;
      dmInventario.QryViewInvSinPrecXUni.Next;
    end;
  end;
  dmInventario.QryViewInvSinPrecXUni.EnableControls;
  ProgressBar1.visible:=False;
  dmInventario.tblInventarioProd.EnableControls;
  RxDBGrid4.EnableScroll;
  beep;  
end;

procedure TfrmInventarioProd.BitBtn35Click(Sender: TObject);
begin
  frmConsultaInventario:=TfrmConsultaInventario.Create(Nil);
  try
    if frmConsultaInventario.Showmodal = mrOk then
    begin
      dmInventario.tblInventarioProd.AutoCalcFields:=False;
      dmInventario.tblInventarioProd.DisableControls;
      dmInventario.tblInventarioProd.locate('codigo',frmConsultaInventario.ibquery1codigo.Value,[]);
      dmInventario.tblInventarioProd.AutoCalcFields:=True;
      dmInventario.tblInventarioProd.EnableControls;
    end;
  finally
  frmConsultaInventario.Free;
  frmConsultaInventario:=Nil;
  end;
  Refresh;
end;

procedure TfrmInventarioProd.RxDBGrid4MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
pt: TGridcoord;
begin
  pt:= rxDBGrid4.MouseCoord(x, y);
  if pt.y=0 then
     rxDBGrid4.Cursor:=crHandPoint
  else
  rxDBGrid4.Cursor:=crDefault;
end;

procedure TfrmInventarioProd.RxDBGrid4TitleClick(Column: TColumn);
{$J+}
const PreviousColumnIndex : integer = -1;
{$J-}
var   Sort : String;
sortOrder : string;
begin
  //dm.tblVendor.

  if rxDBGrid4.DataSource.DataSet is TIBDataSet then
  With TibDataSet(rxDBGrid4.DataSource.DataSet) do

  //if rxDBGrid1.DataSource.DataSet is TCustomADODataSet then
  //With TCustomADODataSet(rxDBGrid1.DataSource.DataSet) do
  begin
    try
      rxDBGrid4.Columns[PreviousColumnIndex].title.Font.Style :=
      rxDBGrid4.Columns[PreviousColumnIndex].title.Font.Style - [fsBold]; 
    except
    end;

    if (sortOrder = ' DESC') then
    sortOrder := ' ASC'
    else
    sortOrder := ' DESC';
    Column.title.Font.Style :=
    Column.title.Font.Style + [fsBold];
    PreviousColumnIndex := Column.Index;

    dmInventario.tblInventarioProd.DisableControls;
    dmInventario.tblInventarioProd.Close;
    dmInventario.tblInventarioProd.SelectSQL.Text := dmInventario.qryInvProd_Base.Sql.Text
    + ' Order By '+Column.FieldName +' '+ sortOrder;
    dmInventario.tblInventarioProd.Params[0].Value := glbCia_Key;
    dmInventario.tblInventarioProd.Open;
    dmInventario.tblInventarioProd.EnableControls;
  end;
  
end;

procedure TfrmInventarioProd.asaItbis1Click(Sender: TObject);
begin
  dmInventario._conVtas:= false;
  if asaItbis1.Checked then
  begin
    dmInventario.tblInventarioProd.Filtered:= False;
    asaItbis1.Checked := False;
    RxLabel3.Caption:='';
    RxLabel3.Color:= clBtnFace;
  end else
  begin
  frmFiltrarTasaItbis:=TfrmFiltrarTasaItbis.Create(Nil);
  try
    if frmFiltrarTasaItbis.ShowModal = mrOk then
    begin
      dmInventario.tblInventarioProd.Filtered:=False;
      dmInventario._idtasa:= frmFiltrarTasaItbis._idtasa;
      dmInventario.tblInventarioProd.Filtered:=True;
      asaitbis1.Checked:=True;

      RxDBLookupCombo7.Color := clGreen;
      RxLabel3.Caption :='Filtro Aplicado';
      asaItbis1.Checked := True;
      RxLabel3.Color:= clRed;      
    end else
    begin
        RxLabel3.Caption:='';
        dmInventario._idtasa:=-1;
        RxLabel3.Color:= clBtnFace;
        asaItbis1.Checked := False;
        dmInventario.tblInventarioProd.Filtered:=False;
        RxDBLookupCombo7.Color:= clBtnFace;
    end;
  finally
  FreeAndNil(frmFiltrarTasaItbis);
  end;
  end;
end;

procedure TfrmInventarioProd.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmInventario.tblInventarioProd.Filtered:=False;
  dmInventario._idtasa:=-1;
  try
  frmtrgtr.free;
  frmtrgtr:=nil;
  except
  end;
end;

procedure TfrmInventarioProd.FiltrarTasaItbisConVentas1Click(
  Sender: TObject);
begin
  dmInventario._conVtas:=true;
  if FiltrarporTipoInv1.Checked then
  begin
    dmInventario.tblInventarioProd.Filtered:= False;
    asaItbis1.Checked := False;
    RxLabel3.Caption:='';
    RxLabel3.Color:= clBtnFace;
  end else
  begin
  frmFiltrarTasaItbis:=TfrmFiltrarTasaItbis.Create(Nil);
  try
    if frmFiltrarTasaItbis.ShowModal = mrOk then
    begin
      dmInventario.tblInventarioProd.Filtered:=False;
      dmInventario._idtasa:= frmFiltrarTasaItbis._idtasa;
      dmInventario.tblInventarioProd.Filtered:=True;
      asaitbis1.Checked:=True;

      RxDBLookupCombo7.Color := clGreen;
      RxLabel3.Caption :='Filtro Aplicado';
      FiltrarporTipoInv1.Checked := True;
      RxLabel3.Color:= clRed;      
    end else
    begin
        RxLabel3.Caption:='';
        dmInventario._idtasa:=-1;
        RxLabel3.Color:= clBtnFace;
        asaItbis1.Checked := False;
        dmInventario.tblInventarioProd.Filtered:=False;
        RxDBLookupCombo7.Color:= clBtnFace;
    end;
  finally
  FreeAndNil(frmFiltrarTasaItbis);
  end;
  end;
end;

procedure TfrmInventarioProd.DBEdit11Change(Sender: TObject);
begin
  if dmInventario.tblInventarioProd.State in [dsEdit, dsInsert] then
  begin
    if (GlbMargenPorcPrecioVta > 0) then
    begin
      dmInventario.tblInventarioProdPRECIO.Value:=
      dmInventario.tblInventarioProdPRECIO_COMPRA.Value *
      (1 + (GlbMargenPorcPrecioVta / 100));
      dmInventario.tblInventarioProdPRECIO_MINIMO.Value:=
      dmInventario.tblInventarioProdPRECIO_COMPRA.Value *
      (1 + (GlbMargenPorcPrecioVta / 100));
    end;
  end;
end;

procedure TfrmInventarioProd.BitBtn36Click(Sender: TObject);
var
    strCond : String;
begin
  qryStatusEquipo.Close;
  strCond:='';
  case rdgEstatus.ItemIndex of
  0:begin
      strCond := ' Where s.STATUS_EQUIPO = 1 ';   //disponible
    end;
  1:begin
       strCond := ' Where s.STATUS_EQUIPO = 2 '; //asignado
    end;
  3:begin
       strCond := ''; //Asignado
    end;
  2:begin
      strCond := ' Where s.STATUS_EQUIPO = 3 '; //RMA
      Case rdgFecha.ItemIndex Of
      0:begin
          strCond := strCond + ' And r.fecha Between '+chr(39)+
          FormatDateTime('mm/dd/yyyy', FechaInicialStatusEquipo.Date)+chr(39)+
          ' and ' +chr(39)+
          FormatDateTime('mm/dd/yyyy', FechaFinalStatusEquipo.Date)+chr(39);
      end;
      1:begin
         strCond := strCond + ' And r.fecha_Entrada Between '+chr(39)+
         FormatDateTime('mm/dd/yyyy', FechaInicialStatusEquipo.Date)+chr(39)+
         ' and ' +chr(39)+
         FormatDateTime('mm/dd/yyyy', FechaFinalStatusEquipo.Date)+chr(39);
      end;
      2:begin
          strCond := strCond + ' And r.FECHA_ENT_ESTIMADA Between '+chr(39)+
          FormatDateTime('mm/dd/yyyy', FechaInicialStatusEquipo.Date)+chr(39)+
          ' and ' +chr(39)+
          FormatDateTime('mm/dd/yyyy', FechaFinalStatusEquipo.Date)+chr(39);
       end;
      end;
    end;
  end;

  if rdgEstatus.ItemIndex = 2 then
  qryStatusEquipo.SQL.Text := qryStatusEquipo_BaseRMA.SQL.Text +
  strCond+' order by i.codigo'
  else
  qryStatusEquipo.SQL.Text := qryStatusEquipo_Base.SQL.Text +
  strCond+' order by i.codigo';

  qryStatusEquipo.Open;
end;

procedure TfrmInventarioProd.TabSheet2Enter(Sender: TObject);
begin
  if (dmInventario.tblInventarioSERIE.State In [dsBrowse, dsInactive] ) then
  begin
    dmInventario.tblInventarioSERIE.Close;
    dmInventario.tblInventarioSERIE.Params[0].Value := dmInventario.tblInventarioProdCODIGO.Value;
    dmInventario.tblInventarioSERIE.Open;
  end;
end;

procedure TfrmInventarioProd.rdgEstatusClick(Sender: TObject);
begin
  if rdgEstatus.ItemIndex < 2 then
  RadioGroup2.Enabled:=False else
  RadioGroup2.Enabled:=True;
end;

procedure TfrmInventarioProd.BitBtn37Click(Sender: TObject);
begin
  GLBMostrarArchivo:=True;
  ExporToExcel(qryStatusEquipo, ExtractFilePath(Application.ExeName)+
  'Informes\EstatusEquipos_'+FormatDateTime('ddmmyyyy',now),false);
  GLBMostrarArchivo:=False;
end;

procedure TfrmInventarioProd.DBRadioGroup5Click(Sender: TObject);
begin
  if dmInventario.tblInventarioSERIESTATUS_EQUIPO.Value = 3 then
  begin
    if dmInventario.tblInventarioSERIE.State = dsEdit then
    begin
      MessageDlg('Use la opcion indicada para RMA',mtWarning,[mbok],0);
      dmInventario.tblInventarioSERIE.Cancel;
    end;
    if dmInventario.tblInventarioSERIE.State = dsInsert then
    begin
      MessageDlg('Estatus Asignado/RMA no permitido por esta via.',mtError,[mbok],0);
      dmInventario.tblInventarioSERIESTATUS_EQUIPO.Value:=1;
    end;
  end;
end;

procedure TfrmInventarioProd.Edit1Change(Sender: TObject);
begin
  if dmInventario.tblInventarioSERIE.State = dsBrowse then
  dmInventario.tblInventarioSERIE.Locate('SERIE',Edit1.Text,[loCaseInsensitive,loPartialKey]);
end;

procedure TfrmInventarioProd.AplicaPorcentajeUtilidadXDefault1Click(
  Sender: TObject);
  var
      i, j: Integer;
      DataSet : TDataSet;
      guardarRec : TBookMark;
      utilidadTest : real;
      PrecioAct : real;
begin
  guardarRec := dmInventario.tblInventarioProd.GetBookmark;
  try
  if dmInventario.tblInventarioProd.State in [dsEdit, dsInsert] then exit;
  if (glbUsaescalaPrecio = 1) then
  begin
    if MessageDlg('¿Desea aplicar porc utilidad a producto(s) seleccionado(s)?', mtWarning,[mbYes, mbNo],0) = mrNo then exit;
    AplicandoPorc:=True;
    //dmInventario.tblInventarioProd.First;
    
    if RxDBGrid4.SelectedRows.Count>0 then
    begin

      DataSet := RxDBGrid4.DataSource.DataSet;
        with RxDBGrid4.DataSource.DataSet do
    for i:=0 to RxDBGrid4.SelectedRows.Count-1 do
    begin
       if SalirEscape then break;
       DataSet.GotoBookmark(Pointer(rxDBGrid4.SelectedRows.Items[i]));
       PrecioAct:=0;
       PrecioAct:=dmInventario.tblInventarioProdPRECIO.Value;
       utilidadTest:=0;
       dmInventario.tblInventarioProd.Edit;

       if (dmInventario.tblInventarioProdPRECIO.Value >0 ) and
          (dmInventario.tblInventarioProdPRECIO_COMPRA.Value > 0)
          and ((dmInventario.tblInventarioProdPORCUTILIDAD1.Value = 0) or
               (dmInventario.tblInventarioProdPORCUTILIDAD1.IsNull))
          and ((dmInventario.tblInventarioProdPRECIOVENTA1.Value = 0) or
               (dmInventario.tblInventarioProdPRECIOVENTA1.IsNull)) then
       utilidadTest := ((dmInventario.tblInventarioProdPRECIO.Value -
                     dmInventario.tblInventarioProdPRECIO_COMPRA.Value)/
                     dmInventario.tblInventarioProdPRECIO_COMPRA.Value)*100;

      if (dmInventario.tblInventarioProdPRECIO_COMPRA.IsNull) or (
      dmInventario.tblInventarioProdPRECIO_COMPRA.Value = 0) then
      begin
        if ((dmInventario.tblInventarioProdPRECIO_COMPRA.Value = 0) or
            (dmInventario.tblInventarioProdprecio_compra.IsNull)) and
            (dmInventario.tblInventarioProdPRECIO.Value > 0) then
             dmInventario.tblInventarioProdPRECIO_COMPRA.Value:=
             dmInventario.tblInventarioProdPRECIO.Value /
            (1 + (frmtrgtr.tRegistroPORC_UTILIDAD1.Value/100));
      end;
      if (dmInventario.tblInventarioProdPRECIO_COMPRA.IsNull) or (
      dmInventario.tblInventarioProdPRECIO_COMPRA.Value = 0) or (
      Length(Trim(dmInventario.tblInventarioProdDESCRIPCION.Value)) = 0 ) then
      begin
        dmInventario.tblInventarioProd.Next;
        continue;
      end;

      if (dmInventario.tblInventarioProdPORCUTILIDAD1.Value = 0) or
         (dmInventario.tblInventarioProdPORCUTILIDAD1.IsNull) then
      begin
        if (frmtrgtr.tRegistroPORC_UTILIDAD1.Value > 0) then
        dmInventario.tblInventarioProdPRECIO_COMPRA.Value:=
        dmInventario.tblInventarioProdPRECIO.Value /
        (1 + (frmtrgtr.tRegistroPORC_UTILIDAD1.Value/100));
      end;

      if frmtrgtr.tRegistroPORC_UTILIDAD1.Value > 0 then
      begin
        if ((dmInventario.tblInventarioProdPRECIO_COMPRA.Value = 0) or
          (dmInventario.tblInventarioProdprecio_compra.IsNull)) and
          (dmInventario.tblInventarioProdPRECIO.Value > 0) then
          dmInventario.tblInventarioProdPRECIO_COMPRA.Value:=
          dmInventario.tblInventarioProdPRECIO.Value /
          (1 + (frmtrgtr.tRegistroPORC_UTILIDAD1.Value/100));

        dmInventario.tblInventarioProdPORCUTILIDAD1.Value:= frmtrgtr.tRegistroPORC_UTILIDAD1.Value;
      end;
      if frmtrgtr.tRegistroPORC_UTILIDAD2.Value > 0 then
      dmInventario.tblInventarioProdPORCUTILIDAD2.Value:= frmtrgtr.tRegistroPORC_UTILIDAD2.Value;
      if frmtrgtr.tRegistroPORC_UTILIDAD3.Value > 0 then
      dmInventario.tblInventarioProdPORCUTILIDAD3.Value:= frmtrgtr.tRegistroPORC_UTILIDAD3.Value;
      if frmtrgtr.tRegistroPORC_UTILIDAD4.Value > 0 then
      dmInventario.tblInventarioProdPORCUTILIDAD4.Value:= frmtrgtr.tRegistroPORC_UTILIDAD4.Value;

      CalcularPrecio(1,dmInventario.tblInventarioProdPORCUTILIDAD1.Value);
      CalcularPrecio(2,dmInventario.tblInventarioProdPORCUTILIDAD2.Value);
      CalcularPrecio(3,dmInventario.tblInventarioProdPORCUTILIDAD3.Value);
      CalcularPrecio(4,dmInventario.tblInventarioProdPORCUTILIDAD4.Value);

      if dmInventario.tblInventarioProd.State = dsEdit then
      GlbSalvarQuery(dmInventario.tblInventarioProd);

      //PrecioAct:=dmInventario.tblInventarioProdPRECIO.Value;

      dmInventario.tblInventarioProd.Next;
    end;
    end;
  end;
  DataSet.EnableControls;
  except on E : Exception do
      LogInformacionTxt(E.ClassName+' Error. Mensaje: '+E.Message);
  end;

  dmInventario.tblInventarioProd.GotoBookmark(guardarRec);
  dmInventario.tblInventarioProd.FreeBookmark(guardarRec);
end;

procedure TfrmInventarioProd.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 27) then
  SalirEscape:=True
  else
  SalirEscape:=false;
end;

procedure TfrmInventarioProd.CheckBox2Click(Sender: TObject);
begin
  if CheckBox2.Checked then
  RxDBGrid4.SelectAll
  else RxDBGrid4.UnselectAll;
end;

procedure TfrmInventarioProd.PorcodigoProd1Click(Sender: TObject);
begin
  frmLotes:=TfrmLotes.Create(nil);
  try
    frmLotes.codProv:= -1;
    frmLotes.codProd:=dmInventario.tblInventarioProdcodigo.Value;
    frmLotes.AbrirDatos;
    frmLotes.showmodal;
  finally
  frmLotes.Free;
  frmLotes:=Nil;
  end;
end;

procedure TfrmInventarioProd.PorProveedor1Click(Sender: TObject);
begin
  frmLotes:=TfrmLotes.Create(nil);
  try
    frmLotes.codProv:=dmInventario.tblInventarioProdCODFABRICANTE.Value;
    frmLotes.codProd:=-1;
    frmLotes.AbrirDatos;
    frmLotes.showmodal;
  finally
  frmLotes.Free;
  frmLotes:=Nil;
  end;
end;

procedure TfrmInventarioProd.DBEdit2Exit(Sender: TObject);
begin
  exit;
  if dmInventario.tblInventarioProd.State in [dsInsert] then
  begin
    dmInventario.tblInventarioProdDESCRIPCION.Value:=
    Trim(dmInventario.tblInventarioProdDESCRIPCION.Value);
    qryCheckDesc.Close;
    qryCheckDesc.Params[0].Value:=Trim(dmInventario.tblInventarioProdDESCRIPCION.Value);
    qryCheckDesc.Open;
    qryCheckDesc.First;
    if (qryCheckDesc.RecordCount >= 1) and
       (not qryCheckDescDESCRIPCION.IsNull) then
    begin
      if MessageDlg('Existe un producto con esta descripción verifique, cancelar transacción?', mtWarning,[mbyes,mbno],0) = mryes then
      dmInventario.tblInventarioProd.Cancel
      else
      if showing then
      begin
        DBEdit2.SelectAll;
        DBEdit2.SetFocus;
      end;
    end;
  end;
end;

procedure TfrmInventarioProd.DBEdit3Exit(Sender: TObject);
begin
  if dmInventario.tblInventarioProd.State in [dsEdit, dsInsert] then
  begin
    if GlbUsaescalaPrecio = 1 then
     dmInventario.tblInventarioProdPrecio_Minimo.Value:= AsignarValorMinimo;

   if (dmInventario.tblInventarioProdPrecio_Minimo.Value = 0) or
      (dmInventario.tblInventarioProdPrecio_Minimo.IsNull) then
       dmInventario.tblInventarioProdPrecio_Minimo.Value:=
       dmInventario.tblInventarioProdPrecio.Value;
  end;
end;

procedure TfrmInventarioProd.RadioGroup1Click(Sender: TObject);
begin
  case RadioGroup1.ItemIndex of
  0 : begin
        qryDupCodBarra.Close;
        dsVerDuplicados.DataSet:=qryDupCodBarra;
        qryDupCodBarra.open;
        tblInventarioDup.Close;
        tblInventarioDup.SelectSQL.Text:= 'select * from INVENTARIO_PRODUCTO ' +
        'where codigo_barra =:codigobarra';
        tblInventarioDup.params[0].Value:= qryDupDescripcionCODIGO_BARRA.Value;
        tblInventarioDup.Open;
      end;
  1 : begin
        qryDupDescripcion.close;
        dsVerDuplicados.DataSet:=qryDupDescripcion;
        qryDupDescripcion.open;
        tblInventarioDup.close;
        tblInventarioDup.SelectSQL.Text:= 'select * from INVENTARIO_PRODUCTO ' +
        'where descripcion =:descripcion';
        tblInventarioDup.params[0].Value:= qryDupDescripcionDESCRIPCION.Value;
        tblInventarioDup.Open;

      end;
  end;
end;

procedure TfrmInventarioProd.BitBtn39Click(Sender: TObject);
begin
  GlbSalvarQuery(tblInventarioDup);
end;

procedure TfrmInventarioProd.BitBtn40Click(Sender: TObject);
begin
  if tblInventarioDup.state in [dsBrowse, dsInactive] then
  begin
    tblInventarioDup.close;
    tblInventarioDup.Open;
  end;
end;

procedure TfrmInventarioProd.qryDupCodBarraAfterScroll(DataSet: TDataSet);
begin
  AbrirDDup;
end;

procedure TfrmInventarioProd.CheckcodBarra;
begin
  if dmInventario.tblInventarioProd.State in [dsInsert] then
  begin
    qryCheckCodBarra.close;
    qryCheckCodBarra.params[0].Value:=Trim(dmInventario.tblInventarioProdcodigo_barra.Value);
    qryCheckCodBarra.open;
    qryCheckCodBarra.First;
    if (qryCheckCodBarra.RecordCount >= 1) and
       (not qryCheckCodBarraCodigo_barra.IsNull) then
    begin
      if MessageDlg('Codigo de Barra ya existe con otro producto, verifique, cancelar transacción?', mtWarning,[mbyes,mbno],0) = mryes then
      dmInventario.tblInventarioProd.Cancel
      else
      if showing then
      begin
        DBEdit6.SelectAll;
        DBEdit6.SetFocus;
      end;
    end;
  end;
end;

procedure TfrmInventarioProd.DBEdit6Exit(Sender: TObject);
begin
  CheckcodBarra;
end;

procedure TfrmInventarioProd.AbrirDDup;
begin
  case RadioGroup1.ItemIndex of
  0 : begin
        tblInventarioDup.Close;
        tblInventarioDup.SelectSQL.Text:= 'select * from INVENTARIO_PRODUCTO ' +
        'where codigo_barra =:codigobarra';
        tblInventarioDup.params[0].Value:= qryDupCodBarraCODIGO_BARRA.Value;
        tblInventarioDup.Open;
      end;
  1 : begin
        tblInventarioDup.close;
        tblInventarioDup.SelectSQL.Text:= 'select * from INVENTARIO_PRODUCTO ' +
        'where descripcion =:descripcion';
        tblInventarioDup.params[0].Value:= qryDupDescripcionDESCRIPCION.Value;
        tblInventarioDup.Open;
      end;
  end;
  dmInventario.tblInventarioProd.Locate('codigo',tblInventarioDupcodigo.Value,[]);
end;

procedure TfrmInventarioProd.qryDupDescripcionAfterScroll(
  DataSet: TDataSet);
begin
  AbrirDDup;
end;

procedure TfrmInventarioProd.TabSheet5Exit(Sender: TObject);
begin
  dmInventario.tblInventarioProd.Locate('codigo',tblInventarioDupcodigo.Value,[]);
end;

procedure TfrmInventarioProd.tblInventarioDupAfterScroll(
  DataSet: TDataSet);
begin
  qryVentasTrn.close;
  qryVentasTrn.params[0].value:=tblInventarioDupCODIGO.Value;
  qryVentasTrn.open;
end;

procedure TfrmInventarioProd.DimensionProductos1Click(Sender: TObject);
begin
  if not Assigned(dmPanaderia) then
  dmPanaderia:=TdmPanaderia.Create(nil);
  frmDimensionProd:=TfrmDimensionProd.Create(nil);
  try
    dmPanaderia.tblDimensionProd.close;
    dmPanaderia.tblDimensionProd.params[0].Value:= dmInventario.tblInventarioProdCodigo.Value;
    dmPanaderia.tblDimensionProd.open;
    dmPanaderia.tblDimensionProd.First;
    if dmPanaderia.tblDimensionProd.RecordCount = 0 then
    begin
      dmPanaderia.tblDimensionProd.Insert;
      dmPanaderia.tblDimensionProdDESC_UNIDAD.Value:='Pulgadas';
      dmPanaderia.tblDimensionProdDESCUNIABREV.Value:='Pul';
      dmPanaderia.tblDimensionProdCODIGO_PROD.Value:=dmInventario.tblInventarioProdCodigo.Value;
    end else
    dmPanaderia.tblDimensionProd.Edit;
    if frmDimensionProd.ShowModal = mrOk then
    GlbSalvarQuery(dmPanaderia.tblDimensionProd);
  finally
  frmDimensionProd.free;
  frmDimensionProd:=Nil;
  end;
end;

procedure TfrmInventarioProd.BitBtn41Click(Sender: TObject);
begin
  DimensionProductos1Click(Self);
end;

function TfrmInventarioProd.GetPrecioMinimo(p1, p2, p3, p4: currency):Currency;
begin
  if ((p1+p2+p3+p4) <= 0.10) then
  begin
    Result :=0;
    Exit;
  end;
  if (p4 > 0) then
  begin
    if (p1 < p2) and (p1 < p3) and (p1 < p4) then
    result := p1 else
    if (p2 < p1) and (p2 < p3) and (p2 < p4) then
    result := p2 else
    if (p3 < p1) and (p3 < p2) and (p3 < p4) then
    result := p3
    else
    result := p4;
  end else
  if (p3 > 0) then
  begin
    if (p1 < p2) and (p1 < p3) then
    result := p1 else
    if (p2 < p1) and (p2 < p3) then
    result := p2 else
    result := p3;
  end else
  if (p2 > 0) then
    begin
      if (p1 < p2) then
      result := p1 else
      result := p2;
    end;
end;

procedure TfrmInventarioProd.FiltrarTipoUnidadNull1Click(Sender: TObject);
begin
  FiltrarTipoUnidadNull1.Checked:= not FiltrarTipoUnidadNull1.Checked;
  if not FiltrarTipoUnidadNull1.Checked then
  begin
    dmInventario.tblInventarioProd.Filtered:=False;
    exit;
  end;
  dmInventario.tblInventarioProd.Filtered:=False;
  dmInventario.filterTipoUnidadNull:=true;
  dmInventario.tblInventarioProd.Filtered:=True;
  RxDBLookupCombo5.Color:= clGreen;
  RxLabel3.Caption :='Filtro Aplicado';
  RxLabel3.Color:= clRed;
end;

procedure TfrmInventarioProd.AsignaUnidad1Click(Sender: TObject);
var
  tipo : integer;
begin
  dmInventario.tblInventarioProd.First;
  if dmInventario.qryTipoUnidad.Locate('DESCRIPCION', 'UNIDAD', []) then
  tipo := dmInventario.qryTipoUnidadIDUNIDAD.Value
  else
  tipo:=1;
  ProgressBar1.Visible:=True;
  ProgressBar1.BringToFront;
  ProgressBar1.Max :=dmInventario.tblInventarioProd.RecordCount;
  while not dmInventario.tblInventarioProd.Eof do
  begin
    if SalirEscape then break;
    if dmInventario.tblInventarioProdDESCRIPCION.IsNull then
    begin
      ProgressBar1.StepIt;
      dmInventario.tblInventarioProd.Next;
      continue;
    end;
    dmInventario.tblInventarioProd.Edit;
    if dmInventario.tblInventarioProdTIPO_UNIDAD.IsNull then
    dmInventario.tblInventarioProdTIPO_UNIDAD.Value:=1;
    ProgressBar1.StepIt;
    dmInventario.tblInventarioProd.Next;
  end;
  GlbSalvarQuery(dmInventario.tblInventarioProd);
end;

procedure TfrmInventarioProd.AuditoriaPrecios1Click(Sender: TObject);
begin
  frmInvPrecioAudit:=TfrmInvPrecioAudit.Create(Nil);
  try
    frmInvPrecioAudit.Showmodal;
  finally
  FreeAndNil(frmInvPrecioAudit);
  end;
end;

function TfrmInventarioProd.AsignarValorMinimo: Extended;
var
  MinValue: Extended;
begin
  // Asignar el valor mínimo a MinValue

  MinValue := GetPrecioMinimo(dmInventario.tblInventarioProdPRECIOVENTA1.Value,
                        dmInventario.tblInventarioProdPRECIOVENTA2.Value,
                        dmInventario.tblInventarioProdPRECIOVENTA3.Value,
                        dmInventario.tblInventarioProdPRECIOVENTA4.Value);

  // Asignar MinValue a dmInventario.tblInventarioProdPrecio_Minimo.Value

  result:=MinValue;
end;

procedure TfrmInventarioProd.Autitoria1Click(Sender: TObject);
begin
  frmAuditoriaInv:=TfrmAuditoriaInv.Create(nil);
  try
    frmAuditoriaInv.Showmodal;
  finally
  frmAuditoriaInv:=nil;
  end;
end;

procedure TfrmInventarioProd.FiltrarPagaItbis1Click(Sender: TObject);
begin
  FiltrarTipoUnidadNull1.Checked:= not FiltrarTipoUnidadNull1.Checked;
  if not FiltrarTipoUnidadNull1.Checked then
  begin
    dmInventario.tblInventarioProd.Filtered:=False;
    exit;
  end;
  dmInventario.tblInventarioProd.Filtered:=False;
  dmInventario.filterPagaItbis:=true;      //filterNoPagaItbis, filterPagaItbis
  dmInventario.tblInventarioProd.Filtered:=True;
  RxDBLookupCombo5.Color:= clGreen;
  RxLabel3.Caption :='Filtro Aplicado';
  RxLabel3.Color:= clRed;
end;

procedure TfrmInventarioProd.FiltrarNoPagaItbis1Click(Sender: TObject);
begin
  FiltrarTipoUnidadNull1.Checked:= not FiltrarTipoUnidadNull1.Checked;
  if not FiltrarTipoUnidadNull1.Checked then
  begin
    dmInventario.tblInventarioProd.Filtered:=False;
    exit;
  end;
  dmInventario.tblInventarioProd.Filtered:=False;
  dmInventario.filterNoPagaItbis         :=True;
  dmInventario.tblInventarioProd.Filtered:=True;
  RxDBLookupCombo5.Color:= clGreen;
  RxLabel3.Caption :='Filtro Aplicado';
  RxLabel3.Color:= clRed;
end;

end.

