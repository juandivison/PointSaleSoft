unit UFormReclamaciones;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, StdCtrls, DBCtrls, Mask, ExtCtrls, IBQuery,
  RxLookup, Buttons, Menus, RxCtrls, RxDBCtrl, EditNew, Grids, DBGrids,
  ShellApi, RxToolEdit, IBStoredProc, RxDBComb, WinSkinData, ComCtrls,
  IBSQL;

type
  TfrmReclamaciones = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    SpeedButton1: TSpeedButton;
    Shape1: TShape;
    SpeedButton2: TSpeedButton;
    DBStatusLabel1: TDBStatusLabel;
    RxLabel1: TRxLabel;
    Label8: TLabel;
    Label1: TLabel;
    SpeedButton3: TSpeedButton;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label26: TLabel;
    DBEdit3: TDBEdit;
    DBMemo1: TDBMemo;
    DBEdit6: TDBEdit;
    DBEdit8: TDBEdit;
    DBRadioGroup2: TDBRadioGroup;
    DBRadioGroup3: TDBRadioGroup;
    RxDBLookupCombo1: TRxDBLookupCombo;
    RxDBLookupCombo2: TRxDBLookupCombo;
    Panel1: TPanel;
    Label10: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    edtPoliza: TEditN;
    BitBtn1: TBitBtn;
    CheckBox1: TCheckBox;
    edtFechaIni: TDateEdit;
    edtFechaFin: TDateEdit;
    RadioGroup1: TRadioGroup;
    rdgEstado: TRadioGroup;
    Excel: TBitBtn;
    chkboxEmail: TCheckBox;
    RxDBGrid1: TRxDBGrid;
    DBRadioGroup1: TDBRadioGroup;
    RxDBLookupCombo3: TRxDBLookupCombo;
    DBDateEdit1: TDBDateEdit;
    BitBtn2: TBitBtn;
    RxDBLookupCombo4: TRxDBLookupCombo;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    RxDBComboBox1: TRxDBComboBox;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Panel2: TPanel;
    Label19: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    Label20: TLabel;
    Label21: TLabel;
    DBText3: TDBText;
    Label22: TLabel;
    DBText4: TDBText;
    Label23: TLabel;
    Label24: TLabel;
    RxDBLookupCombo5: TRxDBLookupCombo;
    BitBtn5: TBitBtn;
    tblReclamaciones: TIBDataSet;
    tblReclamacionesIDRECLAMACION: TIntegerField;
    tblReclamacionesFECHA: TDateTimeField;
    tblReclamacionesNUMPOL: TIntegerField;
    tblReclamacionesCODIGO_CTE: TIntegerField;
    tblReclamacionesCODIGO_ASESOR: TIntegerField;
    tblReclamacionesFALLAMECANICA: TMemoField;
    tblReclamacionesKILOMETRAJE: TIntegerField;
    tblReclamacionesTALLERRECMOTORTRANS: TSmallintField;
    tblReclamacionesGARANTIAPAGADA: TSmallintField;
    tblReclamacionesNOTA1: TMemoField;
    tblReclamacionesNOTA2: TMemoField;
    tblReclamacionesNOTA3: TMemoField;
    tblReclamacionesPROCEDE: TSmallintField;
    tblReclamacionesCODIGO_USUARIO: TIntegerField;
    tblReclamacionesFECHA_IN: TDateTimeField;
    tblReclamacionesIN_POR: TIBStringField;
    tblReclamacionesFECHA_MOD: TDateTimeField;
    tblReclamacionesMOD_POR: TIBStringField;
    tblReclamacionesSTATUS: TIBStringField;
    tblReclamacionesTIPO_AFILIADO: TSmallintField;
    tblReclamacionesCODIGO_PROV: TIntegerField;
    tblReclamacionesMONTO_COTIZADO: TFloatField;
    tblReclamacionesMONTO_CLIENTE: TFloatField;
    tblReclamacionesMONTO_APAGAR: TFloatField;
    tblReclamacionesESTADO: TSmallintField;
    tblReclamacionesCODIGO_CANAL: TIntegerField;
    tblReclamacionesCANTYEARVEH: TFloatField;
    tblReclamacionesMONTOCOBERTURAAPLICA: TFloatField;
    tblReclamacionesPORCAPLICA: TFloatField;
    tblReclamacionesCOD_CANAL_DIST: TIntegerField;
    tblReclamacionesESTATUSPOLIZA: TSmallintField;
    tblReclamacionesNUMERO_TRN_GASTOS: TIntegerField;
    DataSource1: TDataSource;
    qryCliente: TIBQuery;
    qryClienteCODIGO_CTE: TIntegerField;
    qryClienteCIA_KEY: TIntegerField;
    qryClienteTIPO_CLIENTE: TSmallintField;
    qryClienteNOMBRE_CTE: TIBStringField;
    qryClienteNOMBRE_FACTURAR: TIBStringField;
    qryClienteEMAIL: TIBStringField;
    qryClienteRNC_NUMERO: TIBStringField;
    qryClienteCODIGO_CTE_RECL: TIntegerField;
    dsqryCliente: TDataSource;
    qryEmpCodV: TIBQuery;
    qryEmpCodVCODIGO: TIntegerField;
    qryEmpCodVNOMBRE: TIBStringField;
    qryEmpCodVAPELLIDO: TIBStringField;
    qryEmpCodVNOMBRECOMPLETO: TIBStringField;
    dsqryEmpCodV: TDataSource;
    MainMenu1: TMainMenu;
    Insertar1: TMenuItem;
    Modificar1: TMenuItem;
    Cancelar1: TMenuItem;
    Eliminar1: TMenuItem;
    Refrescar1: TMenuItem;
    Guardar1: TMenuItem;
    Coberturas1: TMenuItem;
    Reportes1: TMenuItem;
    ExportarExcel1: TMenuItem;
    Pdf1: TMenuItem;
    odos1: TMenuItem;
    Cerrar1: TMenuItem;
    qryBuscarCobertura: TIBQuery;
    qryBuscarCoberturaIDCOBERTURA: TIntegerField;
    qryBuscarCoberturaCANTYEARVEH: TIntegerField;
    qryBuscarCoberturaIDTIPO: TIntegerField;
    qryBuscarCoberturaDESCRIPCION: TIBStringField;
    qryBuscarCoberturaMONTOCOBERTURA: TFloatField;
    qryBuscarCoberturaDIASDECARENCIA: TIntegerField;
    qryBuscarCoberturaYEARANTIGUEDAD: TIntegerField;
    qryBuscarCoberturaSTATUS: TIBStringField;
    qryBuscarCoberturaKM_INI: TIntegerField;
    qryBuscarCoberturaKM_FIN: TIntegerField;
    qryBuscarCoberturaYEAR_INI: TIntegerField;
    qryBuscarCoberturaYEAR_FIN: TIntegerField;
    qryBuscarCoberturaIDCOBERTURA1: TIntegerField;
    qryBuscarCoberturaIDTIPO1: TIntegerField;
    qryBuscarCoberturaFECHA_INI: TDateTimeField;
    qryBuscarCoberturaFECHA_FIN: TDateTimeField;
    qryBuscarCoberturaPORC_INDEMNIZACION: TFloatField;
    qryBuscarCoberturaYEARANTIGUEDAD1: TIntegerField;
    qryBuscarCoberturaFECHA_APERTURA: TDateTimeField;
    qryBuscarCoberturaFECHA_VENCE_SEGURO: TDateTimeField;
    qryBuscarCoberturaPOLIZAVIGENTE: TIntegerField;
    qryBuscarCoberturaDIASTRANSCURRIDOS: TFloatField;
    qryDatosVeh: TIBQuery;
    qryDatosVehANO_VEH: TIntegerField;
    qryDatosVehCHASSIS: TIBStringField;
    qryDatosVehCODIGO_CTE: TIntegerField;
    qryDatosVehCOLOR: TIBStringField;
    qryDatosVehMODELO: TIBStringField;
    qryDatosVehNUM_CERTIFICADO: TIntegerField;
    qryDatosVehNUMPOL: TIntegerField;
    qryDatosVehPLACA: TIBStringField;
    qryDatosVehSTATUSCXC: TIBStringField;
    qryDatosVehTIPO_AFILIADO: TSmallintField;
    stpProcActBalanceProvcxp: TIBStoredProc;
    ibstpProc_ConvierteCteEnProvNotInUse: TIBStoredProc;
    qryProductosCxp: TIBQuery;
    qryProductosCxpCODIGO: TIntegerField;
    qryProductosCxpDESCRIPCION: TIBStringField;
    qryCentroCostos: TIBQuery;
    qryCentroCostosCODIGO: TIntegerField;
    qryCentroCostosNOMBRE: TIBStringField;
    qryProveedores: TIBQuery;
    qryProveedoresCODIGO_CTE: TIntegerField;
    qryProveedoresDESCRIPCION: TIBStringField;
    qryProveedoresEMAIL: TIBStringField;
    qryProveedoresRNC_PROVEEDOR: TIBStringField;
    qryProveedoresCIA_KEY: TIntegerField;
    qryProveedoresLIMITE_CREDITO: TFloatField;
    qryProveedoresCOD_VENDEDOR: TIntegerField;
    qryProveedoresCONDICION: TIntegerField;
    qryProveedoresCANT_DIAS_CREDITO: TSmallintField;
    qryProveedoresIDTIPO_PROV: TIntegerField;
    qryProveedoresTIPODOC: TSmallintField;
    qryGen: TIBQuery;
    qryGenNUMFCT: TIntegerField;
    dsqryProveedores: TDataSource;
    dsqryBuscarCobertura: TDataSource;
    qryDealer: TIBQuery;
    qryDealerCODIGO_DEALER: TIntegerField;
    qryDealerDESCRIPCION: TIBStringField;
    dsqryDealer: TDataSource;
    qryRepReclamacion: TIBQuery;
    qryRepReclamacion_Base: TIBQuery;
    SkinData1: TSkinData;
    qryTieneRcl: TIBQuery;
    qryTieneRclFECHA: TDateTimeField;
    qryTieneRclCANTDIAS: TFloatField;
    Label25: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    DBMemo5: TDBMemo;
    DBMemo6: TDBMemo;
    DBMemo7: TDBMemo;
    TabSheet3: TTabSheet;
    Label12: TLabel;
    RxDBComboBox3: TRxDBComboBox;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    RxDBGrid2: TRxDBGrid;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    tblReclamacionesDocs: TIBDataSet;
    tblReclamacionesDocsID: TIntegerField;
    tblReclamacionesDocsCODIGO: TIntegerField;
    tblReclamacionesDocsTIPO_DOC: TSmallintField;
    tblReclamacionesDocsRUTA_FOTO: TIBStringField;
    DataSource2: TDataSource;
    SpeedButton4: TSpeedButton;
    OpenDialog1: TOpenDialog;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    DBRadioGroup4: TDBRadioGroup;
    DBRadioGroup5: TDBRadioGroup;
    Label11: TLabel;
    DBDateEdit2: TDBDateEdit;
    Label29: TLabel;
    DBText5: TDBText;
    qryBuscarCoberturaNUMERO: TIntegerField;
    qryBuscarCoberturaMARCA: TIBStringField;
    qryBuscarCoberturaMODELO: TIBStringField;
    qryBuscarCoberturaTELEFONO: TIBStringField;
    DBText6: TDBText;
    Label30: TLabel;
    Label31: TLabel;
    DBText7: TDBText;
    Label32: TLabel;
    Label33: TLabel;
    DBText8: TDBText;
    Label34: TLabel;
    DBText9: TDBText;
    qryBuscarCoberturaEMAIL: TIBStringField;
    tblReclamacionesGRUA_ENVIADA: TSmallintField;
    tblReclamacionesGRUA_SAM_AUTORIZA: TSmallintField;
    tblReclamacionesGRUA_FECHA_ENVIADA: TDateTimeField;
    ComboBox1: TComboBox;
    Label35: TLabel;
    qryEstadosReclam: TIBQuery;
    qryEstadosReclamCODIGO: TSmallintField;
    qryEstadosReclamDESCRIPCION: TIBStringField;
    qryEstadosReclamCODIGO_ANTERIOR: TIntegerField;
    ListBox1: TListBox;
    qryCountEstados: TIBQuery;
    qryCountEstadosCANT: TIntegerField;
    qryCountEstadosDESCESTADORECLAMACION: TIBStringField;
    Label36: TLabel;
    DBStatusLabel2: TDBStatusLabel;
    qryBuscarCoberturaANO_VEH: TIntegerField;
    Label37: TLabel;
    DBText10: TDBText;
    qryBuscarCoberturaCHASSIS: TIBStringField;
    qryDatosVehPOLIZAVIGENTE: TIntegerField;
    qryCountEstadosBase: TIBQuery;
    IntegerField1: TIntegerField;
    IBStringField1: TIBStringField;
    qryMontoRecdoUlt: TIBQuery;
    qryMontoRecdoUltMONTO: TFloatField;
    Label38: TLabel;
    dsqryMontoRecdoUlt: TDataSource;
    DBText11: TDBText;
    SpeedButton5: TSpeedButton;
    qryHistRecxNumPol: TIBQuery;
    qryHistRecxNumPolFECHA_RECLAMACION: TDateTimeField;
    qryHistRecxNumPolCHASSIS: TIBStringField;
    qryHistRecxNumPolNUMERO_CERTIFICADO: TIntegerField;
    qryHistRecxNumPolFECHA_APERTURA: TDateTimeField;
    qryHistRecxNumPolFECHA_VENCE: TDateTimeField;
    qryHistRecxNumPolCANTMESESRECL: TFloatField;
    qryHistRecxNumPolMONTO: TFloatField;
    qryHistRecxNumPolDESCESTADO: TIBStringField;
    BitBtn15: TBitBtn;
    BitBtn16: TBitBtn;
    BitBtn19: TBitBtn;
    BitBtn52: TBitBtn;
    BitBtn17: TBitBtn;
    BitBtn18: TBitBtn;
    qryRepReclamacionIDRECLAMACION: TIntegerField;
    qryRepReclamacionFECHA: TDateTimeField;
    qryRepReclamacionNUMPOL: TIntegerField;
    qryRepReclamacionTIPO_AFILIADO: TSmallintField;
    qryRepReclamacionDESC_TIPOAFILIADO: TIBStringField;
    qryRepReclamacionCODIGO_CTE: TIntegerField;
    qryRepReclamacionDESCCLIENTE: TIBStringField;
    qryRepReclamacionTELEF_CONTACTO: TIBStringField;
    qryRepReclamacionESTADO: TSmallintField;
    qryRepReclamacionMODELOMARCAYEAR: TIBStringField;
    qryRepReclamacionMONTO_COTIZADO: TFloatField;
    qryRepReclamacionMONTO_CLIENTE: TFloatField;
    qryRepReclamacionMONTO_APAGAR: TFloatField;
    qryRepReclamacionDESC_ESTADO: TIBStringField;
    qryRepReclamacionDESCASESOR: TIBStringField;
    qryRepReclamacionCODIGO_PROV: TIntegerField;
    qryRepReclamacionDESC_PROVEEDOR: TIBStringField;
    qryRepReclamacionCANAL_DEALER: TIBStringField;
    qryRepReclamacionCODIGO_ASESOR: TIntegerField;
    qryRepReclamacionCODIGO_CANAL: TIntegerField;
    qryRepReclamacionFALLAMECANICA: TMemoField;
    qryRepReclamacionKILOMETRAJE: TIntegerField;
    qryRepReclamacionTALLERRECMOTORTRANS: TSmallintField;
    qryRepReclamacionGARANTIAPAGADA: TSmallintField;
    qryRepReclamacionNOTA1: TMemoField;
    qryRepReclamacionNOTA2: TMemoField;
    qryRepReclamacionNOTA3: TMemoField;
    qryRepReclamacionPROCEDE: TSmallintField;
    qryRepReclamacionCODIGO_USUARIO: TIntegerField;
    qryRepReclamacionFECHA_IN: TDateTimeField;
    qryRepReclamacionIN_POR: TIBStringField;
    qryRepReclamacionFECHA_MOD: TDateTimeField;
    qryRepReclamacionMOD_POR: TIBStringField;
    qryRepReclamacionSTATUS: TIBStringField;
    Label39: TLabel;
    Label40: TLabel;
    qryBuscarCoberturaCON_CARENCIA: TSmallintField;
    DBText12: TDBText;
    Label41: TLabel;
    DBRadioGroup6: TDBRadioGroup;
    DataSource3: TDataSource;
    RxDBGrid3: TRxDBGrid;
    Label42: TLabel;
    DBEdit4: TDBEdit;
    Label43: TLabel;
    DBEdit5: TDBEdit;
    Label44: TLabel;
    DBEdit7: TDBEdit;
    tblReclamacionesDESCUENTOAFILIADO: TFloatField;
    tblReclamacionesMONTOCONDESCAPLICADO: TFloatField;
    tblReclamacionesMONTONOCUBIERTO: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure edtPolizaChange(Sender: TObject);
    procedure Cerrar1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Insertar1Click(Sender: TObject);
    procedure Modificar1Click(Sender: TObject);
    procedure Eliminar1Click(Sender: TObject);
    procedure Refrescar1Click(Sender: TObject);
    procedure Guardar1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Cancelar1Click(Sender: TObject);
    procedure DBEdit6Change(Sender: TObject);
    procedure Coberturas1Click(Sender: TObject);
    procedure RxDBGrid1TitleClick(Column: TColumn);
    procedure BitBtn2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure tblReclamacionesAfterScroll(DataSet: TDataSet);
    procedure BitBtn3Click(Sender: TObject);
    procedure ExportarExcel1Click(Sender: TObject);
    procedure ExcelClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure chkboxEmailClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tblReclamacionesAfterClose(DataSet: TDataSet);
    procedure tblReclamacionesAfterPost(DataSet: TDataSet);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure RxDBGrid2CellClick(Column: TColumn);
    procedure BitBtn11Click(Sender: TObject);
    procedure RxDBGrid2DblClick(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure tblReclamacionesBeforePost(DataSet: TDataSet);
    procedure ListBox1Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure qryMontoRecdoUltAfterOpen(DataSet: TDataSet);
    procedure tblReclamacionesFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure DBEdit5Exit(Sender: TObject);
    procedure DBEdit7Exit(Sender: TObject);
  private
    procedure AbrirReclamaciones;
    procedure AbrirReclamacionesOrder(fName:string);
    procedure ProcInsertarMasterGasto(codProv:Integer);
    procedure ProcInsertarCXP(monto : Real; serieDoc:Integer;codProveedor:Integer; tipo:smallint;concepto:string);
    procedure ProcLlenarEstadosCount;
    procedure ProcMostrarVigencia(_numPol: integer);
    procedure ProcShowMontoUltConsumo(chasis:string);
    procedure CalcularMontos;
    { Private declarations }
  public
    { Public declarations }
    procedure ProcBuscarCobertura;
  end;

var
  frmReclamaciones: TfrmReclamaciones;
  sortOrder : string;
  esRevertir : boolean;
  numFactRecl : Integer;
  _CodigoEstado : smallint;

implementation
 uses UDatModConectar, UGlobal, UBuscarClientesPersonasP, UFormPolizasCXC,
  UFormCoberturaSam, UDatModCobertura, UDatModCxp, UDatModRegOpeDiaria,
  UFormProveedores, UQckReclamaciones, UFormEnviarEmail, UDatModCompania,
  UMaestroClientes, UDatModUsuarios, UFormHistReclUnaPoliza,
  frmMostrarDatosCoberturaRecl;
 
{$R *.dfm}

procedure TfrmReclamaciones.FormCreate(Sender: TObject);
begin
  edtFechaIni.Date:= GlbPrimerDiaMes(GlbFechaTrnDiaria);
  edtFechaFin.Date:= GlbUltimoDiaMes(now);
  dmUsuarios.qryEmpleados.Close;
  dmUsuarios.qryEmpleados.Open;
  qryDealer.Close;
  qryDealer.Open;
  dmCobertura.tblTipoAfiliadoLookup.close;
  dmCobertura.tblTipoAfiliadoLookup.open;
  qryEmpCodV.Close;
  qryEmpCodV.Open;
  qryCliente.Close;
  qryCliente.Open;
  qryProveedores.Close;
  qryProveedores.Open;
  qryEstadosReclam.Close;
  qryEstadosReclam.Open;
  ComboBox1.Clear;
  ComboBox1.Items.Add('No Asignado');
  while not qryEstadosReclam.eof do
  begin
    ComboBox1.Items.Add(qryEstadosReclamDESCRIPCION.Value);
    qryEstadosReclam.next;
  end;
  qryEstadosReclam.First;
  ComboBox1.Items.Add('Todos');
  ComboBox1.Text:='Todos';
  ComboBox1Change(Self);
  AbrirReclamaciones;
  ProcLlenarEstadosCount;
  Height:= 792;
end;

procedure TfrmReclamaciones.ProcLlenarEstadosCount;
var
  xCondicion : string;
begin
  ListBox1.Clear;
  qryCountEstados.Close;

  if (RadioGroup1.ItemIndex = 1) then
  begin
    xCondicion:= ' Where fecha between '+chr(39)+FormatDateTime('mm/dd/yyyy', edtFechaIni.Date)+chr(39)+
    ' and '+chr(39)+FormatDateTime('mm/dd/yyyy',edtFechaFin.Date)+chr(39);
    qryCountEstados.SQL.Text:= StringReplace(qryCountEstadosBase.SQL.Text,':condicion',xCondicion,[]);
  end else
  begin
    qryCountEstados.SQL.Text:= StringReplace(qryCountEstadosBase.SQL.Text,':condicion','',[]);
  end;
  qryCountEstados.Open;
  qryCountEstados.First;
  while not qryCountEstados.Eof do
  begin
    ListBox1.Items.Add(qryCountEstadosCANT.AsString+'-'+qryCountEstadosDESCESTADORECLAMACION.Value);
    qryCountEstados.Next;
  end;
end;

procedure TfrmReclamaciones.AbrirReclamaciones;
var
  _estadosql : string;
begin
  _estadosql:='';
  case _CodigoEstado of
  0:begin  //No Asignado
      _estadosql:= ' and estado = 0';
    end;
  1:begin //En Revision
      _estadosql:= ' and estado = 1';
    end;
  2:begin //Inspeccion
      _estadosql:= ' and estado = 2';
    end;
  3:begin //en Transito
      _estadosql:= ' and estado = 3';
    end;
  4:begin //Evaluacion Taller
      _estadosql:= ' and estado = 4';
    end;
  5:begin //Evaluaion Desarme
      _estadosql:= ' and estado = 5';
    end;
  6:begin //Autorisacion Desarme
      _estadosql:= ' and estado = 6';
    end;
  7:begin //Evaluacion y aprobacion Cotizacion
      _estadosql:= ' and estado = 7';
    end;
  8:begin //Autorizacion Inicio Labores
      _estadosql:= ' and estado = 8';
    end;
  9:begin //Evaluacion Calidad
      _estadosql:= ' and estado = 9';
    end;
  10:begin //Denegada
      _estadosql:= ' and estado = 10';
    end;
  11:begin //Denegada
      _estadosql:= ' and estado = 11';
    end;
  12:begin //Pagada
      _estadosql:= ' and estado = 12';
    end;
  end;
  case RadioGroup1.ItemIndex of
  0:begin
      tblReclamaciones.Close;
      if (edtPoliza.Text <> '') then
      begin
        tblReclamaciones.SelectSQL.Text:=
        'Select * From RECLAMACION Where numpol = '+ edtPoliza.Text +//_estadosql+
        ' Order by fecha, idreclamacion';
      end else
      tblReclamaciones.SelectSQL.Text:=
        'Select * From RECLAMACION Order by fecha, idreclamacion';

      tblReclamaciones.Open;
  end;
  1:begin
      tblReclamaciones.Close;
        tblReclamaciones.SelectSQL.Text:=
        'select * From RECLAMACION Where fecha between '+chr(39)+FormatDateTime('mm/dd/yyyy', edtFechaIni.Date)+chr(39)+
        ' and '+chr(39)+FormatDateTime('mm/dd/yyyy', edtFechaFin.Date)+chr(39)+_estadosql+
        ' order by fecha, idreclamacion';
        tblReclamaciones.Open;
  end;
  2:begin
      tblReclamaciones.Close;
        if (_estadosql <> '') then
        tblReclamaciones.SelectSQL.Text:=
        'select * from RECLAMACION'+StringReplace(_estadosql,'and',' where ',[rfIgnoreCase,rfReplaceAll])
        +' order by fecha, idreclamacion'
        else
        tblReclamaciones.SelectSQL.Text:= 'select * from RECLAMACION'+
        ' order by fecha, idreclamacion';

        tblReclamaciones.Open;
  end;
  end;
end;

procedure TfrmReclamaciones.SpeedButton1Click(Sender: TObject);
begin
  FrmBuscarClientesPersonas:=TFrmBuscarClientesPersonas.Create(Nil);
  try
    if FrmBuscarClientesPersonas.showmodal = mrOk then
    begin
      if tblReclamaciones.state = dsBrowse then
      begin
        if not tblReclamaciones.Locate('codigo_cte', FrmBuscarClientesPersonas.CodigoCliente,[]) then
        MessageDlg('Cliente no encontrado verifique codigo.', mtInformation, [mbOK], 0);
      end else
      if tblReclamaciones.state in [dsInsert, dsEdit] then
      begin
        tblReclamacionesCODIGO_CTE.Value:= FrmBuscarClientesPersonas.CodigoCliente;
      end;
    end;
  finally
  FrmBuscarClientesPersonas.Free;
  FrmBuscarClientesPersonas:=Nil;
  end;
  refresh;
end;

procedure TfrmReclamaciones.edtPolizaChange(Sender: TObject);
begin
  if length(edtPoliza.Text) > 0 then
  begin
    if CheckBox1.Checked then
    begin
      tblReclamaciones.Filtered:=False;
      tblReclamaciones.Filtered:=True;
    end else
    tblReclamaciones.Locate('NUMPOL',edtPoliza.Text,[loPartialKey]);
    //edtPoliza.Text;
  end;
end;

procedure TfrmReclamaciones.Cerrar1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmReclamaciones.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if tblReclamaciones.State in [dsEdit, dsInsert] then
  begin
    if MessageDlg('Hay una transacción pendiente, verifique. Aún desea salir?',mtwarning,[mbYes, mbNo],0) = mrYes then
    CanClose:=True else
    CanClose:=False;
  end;
end;

procedure TfrmReclamaciones.Insertar1Click(Sender: TObject);
begin
  if tblReclamaciones.State in [dsBrowse] then
  begin
    tblReclamaciones.Append;
    tblReclamacionesFECHA.Value   := ExtraerFecha(now);
    tblReclamacionesIN_POR.Value  := trim(strusername);
    tblReclamacionesFECHA_IN.Value:= Now;
    tblReclamacionesCODIGO_USUARIO.Value:= VarUsuarioGlb;
    tblReclamacionesSTATUS.Value  := 'A';
    tblReclamacionesPROCEDE.Value := 0;
    tblReclamacionesGARANTIAPAGADA.Value:=0;
    tblReclamacionesESTADO.Value  := 1;
    Panel2.Visible:=False;
  end;
end;

procedure TfrmReclamaciones.Modificar1Click(Sender: TObject);
begin
  if tblReclamaciones.State in [dsBrowse] then
  begin
    tblReclamaciones.Edit;
    tblReclamacionesFECHA_MOD.Value:=ExtraerFecha(now);
    tblReclamacionesMOD_POR.Value :=Trim(strusername);
    tblReclamacionesCODIGO_USUARIO.Value:= VarUsuarioGlb;
  end;
  if not tblReclamacionesKILOMETRAJE.IsNull then
  ProcBuscarCobertura;
end;

procedure TfrmReclamaciones.Eliminar1Click(Sender: TObject);
begin
 if tblReclamaciones.State in [dsBrowse] then
 begin
   if (tblReclamacionesESTADO.Value = 0) or (tblReclamacionesESTADO.Value = 1) then
   begin
     if MessageDlg('Desea eliminar record?',mtWarning,[mbyes, mbno],0) = mryes then
     begin
       tblReclamaciones.Delete;
       GlbSalvarQuery(tblReclamaciones);
     end;
   end else
   MessageDlg('No se permite eliminar record, verifique.',mtWarning,[mbok],0);
 end;
end;

procedure TfrmReclamaciones.Refrescar1Click(Sender: TObject);
begin
  if tblReclamaciones.State in [dsBrowse,dsInactive] then
  begin
    tblReclamaciones.Close;
    tblReclamaciones.Open;
  end;
end;

procedure TfrmReclamaciones.Guardar1Click(Sender: TObject);
begin
  if tblReclamaciones.State in [dsInsert, dsEdit] then
  GlbSalvarQuery(tblReclamaciones);
  ProcLlenarEstadosCount;
  refresh;
end;

procedure TfrmReclamaciones.SpeedButton2Click(Sender: TObject);
var
  numCertPol : Integer;
begin
  frmPolizasCxc:=TfrmPolizasCxc.Create(nil);
  try
    if frmPolizasCxc.ShowModal = mrOk then
    begin

      if frmPolizasCxc.qryDatosVehiculosNUM_CERTIFICADO.Value > 0 then
      numCertPol:= frmPolizasCxc.qryDatosVehiculosNUM_CERTIFICADO.Value
      else
      numCertPol:= frmPolizasCxc.qryDatosVehiculosNUMPOL.Value;

      //buscar sumatoria de consumos en los ultimos 12 meses
      ProcShowMontoUltConsumo(frmPolizasCxc.qryDatosVehiculosCHASSIS.Value);

      if (tblReclamaciones.RecordCount = 0) And
         (tblReclamaciones.State = dsBrowse) then
      Insertar1Click(Self);

      if tblReclamaciones.State = dsBrowse then
      begin
        if (tblReclamacionesGARANTIAPAGADA.Value = 1) then
        begin
          MessageDlg('Reclamación tiene estatus de pagada, no puedes modificarla.', mtInformation, [mbOK], 0);
          refresh;
          Exit;
        end;
        //if not tblReclamaciones.Locate('codigo_cte', frmPolizasCxc.qryDatosVehiculosCODIGO_CTE.Value,[]) then
        //MessageDlg('Cliente no encontrado verifique codigo.', mtInformation, [mbOK], 0);
      end else
      if tblReclamaciones.State = dsInsert then
      begin
        tblReclamacionestipo_afiliado.Value:=  frmPolizasCxc.qryDatosVehiculosTIPO_Afiliado.Value;
        tblReclamacionesNUMPOL.Value:= numCertPol;
        tblReclamacionesCODIGO_CTE.Value:= frmPolizasCxc.qryDatosVehiculosCODIGO_CTE.Value;
        if frmPolizasCxc.qryCliente.Locate('CODIGO_CTE',frmPolizasCxc.qryDatosVehiculosCODIGO_CTE.Value,[]) then
        tblReclamacionesCODIGO_ASESOR.Value:= frmPolizasCxc.qryClienteCOD_VENDEDOR.Value;
        tblReclamacionesFECHA_IN.Value:= Now;
        tblReclamacionesIN_POR.Value  := Trim(StrUserName);
        tblReclamacionesCODIGO_USUARIO.Value:= VarUsuarioGlb;
        qryDatosVeh.Close;
        qryDatosVeh.Params[0].Value:= tblReclamacionesNUMPOL.Value;
        qryDatosVeh.Params[1].Value:= tblReclamacionesNUMPOL.Value;
        qryDatosVeh.Open;
        if not tblReclamacionesKILOMETRAJE.IsNull then
        ProcBuscarCobertura else
        begin
          if not tblReclamacionesTIPO_AFILIADO.IsNull then
          begin
            qryBuscarCobertura.Close;
            qryBuscarCobertura.Params[0].Value:= numCertPol;
            qryBuscarCobertura.Params[1].Value:= numCertPol;
            qryBuscarCobertura.Params[2].Value:= 1;
            qryBuscarCobertura.Params[3].Value:= frmPolizasCxc.qryDatosVehiculosTIPO_Afiliado.Value;
            qryBuscarCobertura.Open;
            if qryBuscarCobertura.RecordCount > 0 then
            Panel2.Visible:=True;
          end;
         end;
        end;
      end else
      begin
        if (tblReclamacionesGARANTIAPAGADA.Value < 1) then
        begin
          tblReclamaciones.Edit;
          tblReclamacionestipo_afiliado.Value:=  frmPolizasCxc.qryDatosVehiculosTIPO_Afiliado.Value;
          tblReclamacionesNUMPOL.Value:= numCertPol;
          tblReclamacionesCODIGO_CTE.Value:= frmPolizasCxc.qryDatosVehiculosCODIGO_CTE.Value;
          if not tblReclamacionesKILOMETRAJE.IsNull then
          ProcBuscarCobertura;
        end;      
    end;
  finally
  FreeAndNil(frmPolizasCxc);
  end;
  refresh;
end;

procedure TfrmReclamaciones.Cancelar1Click(Sender: TObject);
begin
  if tblReclamaciones.State in [dsInsert, dsEdit] then
  tblReclamaciones.Cancel;
end;

procedure TfrmReclamaciones.ProcBuscarCobertura;
//var
  //valDiaActiva : boolean;
begin
  if tblReclamacionesKILOMETRAJE.IsNull then exit;
  qryBuscarCobertura.Close;
  qryBuscarCobertura.Params[0].Value:= tblReclamacionesnumpol.Value;
  qryBuscarCobertura.Params[1].Value:= tblReclamacionesnumpol.Value;
  qryBuscarCobertura.Params[2].Value:= tblReclamacionesKILOMETRAJE.Value;
  qryBuscarCobertura.Params[3].Value:= tblReclamacionesTIPO_AFILIADO.Value;
  //qryBuscarCobertura.Params[4].Value:= qryDatosVehTIPO_AFILIADO.Value;
  qryBuscarCobertura.Open; //qryBuscarCobertura.sql.text
  qryBuscarCobertura.First;

  if (qryBuscarCobertura.RecordCount > 1) then
  begin
    MessageDlg('Verificar configuración, búsqueda reporta varios records.', mtInformation,[mbok],0);
    frmMostrarDatosdupCob:=TfrmMostrarDatosdupCob.Create(nil);
    try
      frmMostrarDatosdupCob.showmodal;
    finally
    frmMostrarDatosdupCob.free;
    frmMostrarDatosdupCob:=nil;
    end;
    Exit;
  end;

  //if (qryBuscarCoberturaDIASPOLIZAACTIVA.Value < qryBuscarCoberturaDIASDECARENCIA.Value) then
  //valDiaActiva:=False
  //else
  //valDiaActiva:=True;

  if tblReclamaciones.State in [dsInsert] then
  begin
    tblReclamacionesCANTYEARVEH.Value:= qryBuscarCoberturaCANTYEARVEH.Value;
    if qryMontoRecdoUltMONTO.Value > 0 then
    tblReclamacionesMONTOCOBERTURAAPLICA.Value:=
    (qryBuscarCoberturaMONTOCOBERTURA.Value - qryMontoRecdoUltMONTO.Value)
    else
    tblReclamacionesMONTOCOBERTURAAPLICA.Value:= qryBuscarCoberturaMONTOCOBERTURA.Value;

    tblReclamacionesPORCAPLICA.Value:= qryBuscarCoberturaPORC_INDEMNIZACION.Value;
    tblReclamacionesESTATUSPOLIZA.Value:= qryBuscarCoberturaPOLIZAVIGENTE.Value;
  end;

  if tblReclamaciones.State in [dsEdit, dsInsert] then
  begin
    if (qryBuscarCoberturaMONTOCOBERTURA.Value > 0) then
    begin
      if qryMontoRecdoUltMONTO.Value > 0 then
         tblReclamacionesMONTOCOBERTURAAPLICA.Value:=
        (qryBuscarCoberturaMONTOCOBERTURA.Value - qryMontoRecdoUltMONTO.Value)
      else
      tblReclamacionesMONTOCOBERTURAAPLICA.Value:= qryBuscarCoberturaMONTOCOBERTURA.Value;

      CalcularMontos;

      if tblReclamacionesESTATUSPOLIZA.Value = 1 then
      tblReclamacionesPROCEDE.Value:= 1
      else
      tblReclamacionesPROCEDE.Value:= 0;
    end else
    begin
      tblReclamacionesPROCEDE.Value      :=0;
      tblReclamacionesMONTO_APAGAR.Value :=0;
      tblReclamacionesMONTO_CLIENTE.Value:=tblReclamacionesMONTO_COTIZADO.Value;
    end;
  end;
  ProcMostrarVigencia(tblReclamacionesnumpol.Value);
  Panel2.Visible:=True;
end;

procedure TfrmReclamaciones.ProcMostrarVigencia(_numPol:integer);
begin
  qryDatosVeh.Close;
  qryDatosVeh.Params[0].Value:= _numPol;
  qryDatosVeh.Params[1].Value:= _numPol;
  qryDatosVeh.Open;
  qryDatosVeh.last;
  if (qryDatosVeh.RecordCount = 0) then
  begin
    Label24.Visible:=false;
  end;
  if (qryDatosVehPOLIZAVIGENTE.Value = 0) then
  begin
    Label24.Caption:='Vencido';
    Label24.Visible:=True;
    Label24.Color  :=$008CFFFF;
    Label24.Font.Color:=clred;
    BitBtn2.Enabled:=False;
  end else
  begin
    Label24.Caption:='Activo';
    Label24.Visible:=True;
    Label24.Color  :=clBtnFace;
    Label24.Font.Color:=clBlack;
  end;
end;
procedure TfrmReclamaciones.DBEdit6Change(Sender: TObject);
begin
  ProcBuscarCobertura;
end;

procedure TfrmReclamaciones.Coberturas1Click(Sender: TObject);
begin
  frmCobertura:=TfrmCobertura.Create(Nil);
  try
    frmCobertura.ShowModal;
  finally
  frmCobertura.Free;
  frmCobertura:=Nil;
  end;
  dmConectar.IBDatabase1.Close;
  dmConectar.IBDatabase1.Open;
  FormCreate(Self);
  ComboBox1Change(Self);
end;


procedure TfrmReclamaciones.RxDBGrid1TitleClick(Column: TColumn);
{$J+}
 const PreviousColumnIndex : integer = 1;
{$J-}
begin
  if rxDBGrid1.DataSource.DataSet is TIBDataSet then
  With TibDataSet(rxDBGrid1.DataSource.DataSet) do
  begin
    try
      rxDBGrid1.Columns[PreviousColumnIndex].title.Font.Style :=
      rxDBGrid1.Columns[PreviousColumnIndex].title.Font.Style - [fsBold];
    except
    end;

    if (sortOrder = ' DESC') then
    sortOrder := ' ASC'
    else
    sortOrder := ' DESC';
    Column.title.Font.Style :=
    Column.title.Font.Style + [fsBold];
    PreviousColumnIndex := Column.Index;

    AbrirReclamacionesOrder(Column.Field.FieldName + sortOrder);
    {
     tblReclamaciones.DisableControls;
     tblReclamaciones.Close;
     tblReclamaciones.SelectSQL.Text:= 'Select * From RECLAMACION ' + ' Order By '+ Column.Field.FieldName + sortOrder;
     tblReclamaciones.Open;
     tblReclamaciones.EnableControls;
    }
  end;
end;

procedure TfrmReclamaciones.BitBtn2Click(Sender: TObject);
var
  xxxx,yy : string;
begin
  if tblReclamaciones.State in [dsInsert, dsEdit] then
  begin
    MessageDlg('Tienes una transacción activa, verifique.',mtwarning,[],0);
    exit;
  end;
  
   //xxxx := PadLeftCharacter(2,6,'0');
   //yy   := PadLeftCharacter(2,235,'0');
  //MessageDlg('En desarrollo.',mtInformation,[mbok],0);
  //exit;
  if (tblReclamacionesESTADO.Value = 12) then
  begin
    MessageDlg('Reclamación ya ha sido pagada.',mtInformation,[mbok],0);
    Exit;
  end;

  if (tblReclamacionesESTADO.Value <> 8) then
  begin
    MessageDlg('Reclamación no ha sido autorizada para inicio labores.',mtInformation,[mbok],0);
    Exit;
  end;
  {if (tblReclamacionesESTADO.Value <> 3) then
  begin
    MessageDlg('Reclamación no ha sido autorizada.',mtInformation,[mbok],0);
    Exit;
  end;}

  if (tblReclamacionesMONTO_APAGAR.IsNull) Or
  (tblReclamacionesMONTO_APAGAR .Value = 0) then Exit;

  ProcInsertarMasterGasto(tblReclamacionesCODIGO_PROV.Value);

  ProcInsertarCXP(tblReclamacionesMONTO_APAGAR.Value,  //monto
  tblReclamacionesIDRECLAMACION.Value, //serieDoc
  tblReclamacionesCODIGO_PROV.Value,//CodProveedor
  2, //Tipo
  'RECLAMACION POLIZA'+tblReclamacionesNUMPOL.AsString);//Concepto
  refresh;
end;

procedure TfrmReclamaciones.ProcInsertarCXP(monto: Real; serieDoc,
  codProveedor: Integer; tipo: smallint; concepto: string);
begin
  if (monto = 0) then exit;
  if dmCxp.tblTransCxp.State = dsInactive then
  begin
    dmCxp.tblTransCxp.Close;
    dmCxp.tblTransCxp.Params[0].Value:=ExtraerFecha(tblReclamacionesFecha.Value);
    dmCxp.tblTransCxp.Params[1].Value:=ExtraerFecha(tblReclamacionesFecha.Value);
    dmCxp.tblTransCxp.Open;
  end;

    dmCxp.tblTransCxp.Insert;
    dmCxp.tblTransCxpserieTRNCOSTO.Value := serieDoc;
    dmCxp.tblTransCxpCODIGO_USUARIO.Value:= VarUsuarioGlb;
    dmCxp.tblTransCxpCIA_KEY.Value := GlbCia_Key;

    dmCxp.tblTransCxpSTATUS.Value  :='A';
    //dmCxc.tblTransCxcconcepto.Value  := 'Pago cuota';
    //if (tipo = 1) then
    //begin
    dmCxp.tblTransCxpTIPO_DOC.Value := tipo;//1; //Factura
    dmCxp.tblTransCxpconcepto.Value := Concepto;//'Servicio Transporte';
    //end else dmCxp.tblTransCxpTIPO_DOC.Value := 2; //Recibo
    dmCxp.tblTransCxpmoneda.Value   := '1';//pesos
    dmCxp.tblTransCxpfecha.Value    := ExtraerFecha(GlbFechatrndiaria);

    dmCxp.tblTransCxpcodigo_cliente.Value := codProveedor;//rxViajesCodPropietario.Value;
    dmCxp.tblTransCxpcodigo_serv.Value    := 0;
    
    dmCxp.tblTransCxpNUMERO_DOC.Value     := numFactRecl;

    dmCxp.tblTransCxpvalor_documento.Value:= monto;
    //rxViajesMONTO_CXP.Value - rxViajesMontoTotalRetenciones.Value;
    if tipo = 2 then
    dmCxp.tblTransCxptipo_tranf.Value     := 1 //1-Debito; 2-Credito
    else
    dmCxp.tblTransCxptipo_tranf.Value     := 2;

    dmCxp.tblTransCxptipo_serv.Value      := 0;
    dmCxp.tblTransCxpfecha_in.Value       := Now;
    dmCxp.tblTransCxpIN_POR.Value         := StrUserName;
    dmCxp.tblTransCxp.Post;
    dmCxp.tblTransCxp.ApplyUpdates;

    if Not dmCxp.tblTransCxp.Transaction.InTransaction then
    dmCxp.tblTransCxp.Transaction.StartTransaction;
    try
      dmCxp.tblTransCxp.Transaction.CommitRetaining;
    except
    dmCxp.tblTransCxp.Transaction.RollbackRetaining;
    end;
    //Insertar Factura pendiente de pago
    //PARA LOS GASTOS NO ES NECESARIO, YA QUE SE APLICA DIRECTO AL CXP PROVEEDORES
    if (dmCxp.tblTransCxptipo_tranf.Value = 1) then //factura
    begin
      dmcxp.stpInsFactPendiente.Params[0].Value := codProveedor;
      dmcxp.stpInsFactPendiente.Params[1].Value := 0;
      dmcxp.stpInsFactPendiente.Params[2].Value := '1';
      dmcxp.stpInsFactPendiente.Params[3].Value := dtmTransOpeDiaria.tblRegTransOpeDiariaMastNUMERO.Value;
      dmcxp.stpInsFactPendiente.Params[4].Value := Monto;
      dmcxp.stpInsFactPendiente.Params[5].Value := ExtraerFecha(dmCxp.tblTransCxpFECHA.Value);
      //if Not dtmTransOpeDiaria.tblRegTransOpeDiariaMastTIPO_CF.IsNull then
      //dmcxp.stpInsFactPendiente.Params[6].Value := dtmTransOpeDiaria.tblRegTransOpeDiariaMastTIPO_CF.Value
      //else
      dmcxp.stpInsFactPendiente.Params[6].Value := null;
      dmcxp.stpInsFactPendiente.Params[7].Value := ExtraerFecha(now)+30;//tblReclamacionesFECHA_VENCE.Value);
      dmcxp.stpInsFactPendiente.Params[8].Value := '#IDRecl.'+tblReclamacionesIDRECLAMACION.AsString;
      dmcxp.stpInsFactPendiente.ExecProc;
    end;
    if Not dmCxp.stpInsFactPendiente.Transaction.InTransaction then
    dmCxp.stpInsFactPendiente.Transaction.StartTransaction;
    try
      dmCxp.stpInsFactPendiente.Transaction.CommitRetaining;
    except
    dmCxp.stpInsFactPendiente.Transaction.RollbackRetaining;
    end;
    //stpProcActBalanceProvcxp.Params[0].Value -return Valor_Pendiente
    //Actualiza factura pendiente y balance cxp a proveedor
    stpProcActBalanceProvcxp.Params[1].Value := dmCxp.tblTransCxpCODIGO_SERV.Value;
    stpProcActBalanceProvcxp.Params[2].Value := dmCxp.tblTransCxpMONEDA.Value;
    stpProcActBalanceProvcxp.Params[3].Value := dmCxp.tblTransCxpNUMERO_DOC.Value;// tipo;//1;
    stpProcActBalanceProvcxp.Params[4].Value := dmCxp.tblTransCxpVALOR_DOCUMENTO.Value;
    stpProcActBalanceProvcxp.Params[5].Value := 'A';
    if (Tipo = 2) then
    stpProcActBalanceProvcxp.Params[6].Value := -1//add balance
    else
    stpProcActBalanceProvcxp.Params[6].Value := 1;//update balance
    stpProcActBalanceProvcxp.Params[7].Value := codProveedor;
    stpProcActBalanceProvcxp.Params[8].Value := dmCxp.tblTransCxpFECHA.Value;
    stpProcActBalanceProvcxp.Params[9].Value := dmCxp.tblTransCxpSERIE.Value;
    stpProcActBalanceProvcxp.ExecProc;

    if Not stpProcActBalanceProvcxp.Transaction.InTransaction then
    stpProcActBalanceProvcxp.Transaction.StartTransaction;
    try
      stpProcActBalanceProvcxp.Transaction.CommitRetaining;
    except
    stpProcActBalanceProvcxp.Transaction.RollbackRetaining;
    end;
end;

procedure TfrmReclamaciones.ProcInsertarMasterGasto(codProv:Integer);
var d,m, y : word;
begin
  qryProveedores.Close;
  qryProveedores.Open;
  dtmTransOpeDiaria.tblTipoCompra.Close;
  dtmTransOpeDiaria.tblTipoCompra.Open;
  dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Close;
  dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Open;
  dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Insert;
  dtmTransOpeDiaria.tblRegTransOpeDiariaMastCIA_KEY.Value := glbCia_Key;

  dtmTransOpeDiaria.tblRegTransOpeDiariaMastFECHA.Value   := ExtraerFecha(date);
  dtmTransOpeDiaria.tblRegTransOpeDiariaMastSTATUS.Value  := 'R';
  dtmTransOpeDiaria.tblRegTransOpeDiariaMastCOD_PROVEEDOR.Value:= codProv;

  dtmTransOpeDiaria.tblRegTransOpeDiariaMastIDCODIGO_TPAGODGII.Value := 2;//CHEQUE/TRANSFERENCIAS/DEPOSITO
  dtmTransOpeDiaria.tblRegTransOpeDiariaMastFPAGO.Value   := 2;//Credito

  dtmTransOpeDiaria.tblRegTransOpeDiariaMastFECHA_IN.Value:= ExtraerFecha(Date);
  dtmTransOpeDiaria.tblRegTransOpeDiariaMastIN_POR.Value  := StrUserName;

  //if dtmTransOpeDiaria.tblTipoCompra.Locate('DESCRIPCION','RECLAMACIONES',[]) then
  dtmTransOpeDiaria.tblRegTransOpeDiariaMastIDTIPO_COMPRA.Value:= 2;//GASTOS POR TRABAJOS, SUMINISTROS Y SERVICIOS
  //dtmTransOpeDiaria.tblTipoCompraTIPO.Value;
  if dtmTransOpeDiaria.tblRegTransOpeDiariaDet.State = dsInactive then
  dtmTransOpeDiaria.tblRegTransOpeDiariaDet.Open;
  
  dtmTransOpeDiaria.tblRegTransOpeDiariaDet.Append;
  dtmTransOpeDiaria.tblRegTransOpeDiariaDetCANTIDAD.Value:=1;
  dtmTransOpeDiaria.tblRegTransOpeDiariaDetPRECIO.Value  :=tblReclamacionesMONTO_APAGAR.Value;
  dtmTransOpeDiaria.tblRegTransOpeDiariaDetVALOR.Value   :=tblReclamacionesMONTO_APAGAR.Value;
  dtmTransOpeDiaria.tblRegTransOpeDiariaDetMONTO_ITBIS.Value:=0;
  dtmTransOpeDiaria.tblRegTransOpeDiariaDetSTATUS.Value     :='A';
  dtmTransOpeDiaria.tblRegTransOpeDiariaDetIDTASAITBIS.Value:= 1;
  dtmTransOpeDiaria.qryDeptos.close;
  dtmTransOpeDiaria.qryDeptos.Open;
  if dtmTransOpeDiaria.qryDeptos.Locate('NOMBRE','OPERACIONES',[]) then
  dtmTransOpeDiaria.tblRegTransOpeDiariaDetDEPARTAMENTO.Value:=
  dtmTransOpeDiaria.qryDeptosCODIGO.Value;

  qryCentroCostos.Close;
  qryCentroCostos.Params[0].Value:= 'RECLAMACIONES';
  qryCentroCostos.Open;
  if qryCentroCostos.RecordCount > 0 then
  dtmTransOpeDiaria.tblRegTransOpeDiariaDetCOD_CTA_CONCEPTO.Value:=qryCentroCostosCODIGO.Value;

  //qryProductosCxp.Close;
  //qryProductosCxp.Params[0].Value:= 'RECLAMACIONES';
  //qryProductosCxp.Open;
  //if qryProductosCxp.RecordCount > 0 then
  dtmTransOpeDiaria.tblRegTransOpeDiariaDetCOD_SERV_PROD.Value:= 0;//No aplica

  DecodeDate(now,y,m,d);
  qryGen.Close;
  qryGen.Open;
  dtmTransOpeDiaria.tblRegTransOpeDiariaDetNUMERO_FACTURA.Value:=
  StrToInt(PadLeftCharacter(2,m,'0')+PadLeftCharacter(2,qryGenNUMFCT.AsInteger,'0'));
  //PAGO RECLAMACIONES
  numFactRecl:=dtmTransOpeDiaria.tblRegTransOpeDiariaDetNUMERO_FACTURA.Value;

  dtmTransOpeDiaria.tblRegTransOpeDiariaDetIN_POR.Value   := StrUserName;
  dtmTransOpeDiaria.tblRegTransOpeDiariaDetFECHA_IN.Value := Now;
  dtmTransOpeDiaria.tblRegTransOpeDiariaDetSTATUS.Value   := 'A';

  if not dtmTransOpeDiaria.tblRegTransOpeDiariaMastCOD_PROVEEDOR.IsNull then
  if not qryProveedoresCANT_DIAS_CREDITO.IsNull then
  dtmTransOpeDiaria.tblRegTransOpeDiariaMastFECHA_VENCE.Value :=
  dtmTransOpeDiaria.tblRegTransOpeDiariaMastFECHA.Value +
  qryProveedoresCANT_DIAS_CREDITO.Value
  else
    dtmTransOpeDiaria.tblRegTransOpeDiariaMastFECHA_VENCE.Value :=
  dtmTransOpeDiaria.tblRegTransOpeDiariaMastFECHA.Value + 30;

  GlbSalvarQuery(dtmTransOpeDiaria.tblRegTransOpeDiariaMast);
  dtmTransOpeDiaria.tblRegTransOpeDiariaDetNUMERO.Value:=dtmTransOpeDiaria.tblRegTransOpeDiariaMastNUMERO.Value;

  GlbSalvarQuery(dtmTransOpeDiaria.tblRegTransOpeDiariaDet);
  tblReclamaciones.Edit;
  tblReclamacionesNUMERO_TRN_GASTOS.Value := dtmTransOpeDiaria.tblRegTransOpeDiariaMastNUMERO.Value;
  GlbSalvarQuery(tblReclamaciones);
end;

procedure TfrmReclamaciones.SpeedButton3Click(Sender: TObject);
begin
  frmProveedores:=TfrmProveedores.Create(nil);
  try
    frmProveedores.ShowModal;
  finally
  frmProveedores.free;
  frmProveedores:=nil;
  end;
  refresh;
end;

procedure TfrmReclamaciones.tblReclamacionesAfterScroll(DataSet: TDataSet);
begin
  //if tblReclamacionesESTADO.Value in [0,1,2,3,4,5,6,10] then
  //begin
    BitBtn2.Enabled:=False;
  //end else
  if tblReclamacionesESTADO.Value in [4,5,6,7,8,9,10] then
  BitBtn2.Enabled:=True;

  if tblReclamacionesNUMERO_TRN_GASTOS.Value > 0 then
  begin
    BitBtn2.Caption:='Enviada a Cxp';
    BitBtn2.Enabled:=False;
  end else
  BitBtn2.Caption:='Enviar a Cxp';
  
  qryBuscarCobertura.Close;
  qryBuscarCobertura.Params[0].Value:= tblReclamacionesnumpol.Value;
  qryBuscarCobertura.Params[1].Value:= tblReclamacionesnumpol.Value;
  qryBuscarCobertura.Params[2].Value:= tblReclamacionesKILOMETRAJE.Value;
  qryBuscarCobertura.Params[3].Value:= tblReclamacionesTIPO_AFILIADO.Value;

  //qryBuscarCobertura.Params[4].Value:= qryDatosVehTIPO_AFILIADO.Value;
  qryBuscarCobertura.Open;
  qryBuscarCobertura.Last;

  if (qryBuscarCobertura.RecordCount = 0) then
  begin
    Label24.Visible:=false;
  end else
  if qryBuscarCoberturaPOLIZAVIGENTE.Value = 0 then
  begin
    Label24.Caption:='Vencido';
    Label24.Visible:=True;
    Label24.Color  :=$008CFFFF;
    Label24.Font.Color:=clred;
    BitBtn2.Enabled:=False;
  end else
  begin
    Label24.Caption:='Activo';
    Label24.Visible:=True;
    Label24.Color  :=clBtnFace;
    Label24.Font.Color:=clBlack;
  end;
  label39.Visible:=false;
  label40.Visible:=false;
  if (qryBuscarCoberturaCON_CARENCIA.IsNull or (qryBuscarCoberturaCON_CARENCIA.Value = 0)) then
  begin
    if (qryBuscarCoberturaDIASTRANSCURRIDOS.Value < qryBuscarCoberturaDIASDECARENCIA.Value) then
    begin
      label39.Visible:=true;
      label40.Visible:=true;
      label40.Caption:=' < '+qryBuscarCoberturaDIASDECARENCIA.AsString;
    end;
  end;
  tblReclamacionesDocs.Close;
  tblReclamacionesDocs.params[0].value:=tblReclamacionesIDRECLAMACION.Value;
  tblReclamacionesDocs.open;
  if not qryBuscarCoberturaCHASSIS.IsNull then
  ProcShowMontoUltConsumo(qryBuscarCoberturaCHASSIS.Value);
end;

procedure TfrmReclamaciones.BitBtn3Click(Sender: TObject);
begin
  qckReclamacion:=TqckReclamacion.Create(Nil);
  try
    qckReclamacion.qryRepReclamacion.Close;
    qckReclamacion.qryRepReclamacion.Params[0].Value:= tblReclamacionesIDRECLAMACION.Value;
    qckReclamacion.qryRepReclamacion.Open;
    qckReclamacion.Preview;

    if GlbEnviaEmail then
  begin
    GlbEnviaEmail:= chkboxEmail.Checked;
    GLBMostrarArchivo:=True;
    ReportExportPDF(qckReclamacion,GlbRutaInformes+'\ReclamacionNumPol'+qckReclamacion.qryRepReclamacionNUMPOL.AsString+'.pdf');
    if not FileExists(glbZipFile) then exit;
    frmEnviarEmail:=TfrmEnviarEmail.Create(Nil);
    try
      GlbIDTipoEmail := 100; //Estandar
      GlbEnviaEmail:= chkboxEmail.Checked;
      if dmCompania.tblCompania.State = dsInactive then
         dmCompania.tblCompania.Open;
         dmCompania.tblCompania.Locate('codigo', glbCia_Key,[]);
         frmEnviarEmail._cmdminio:= dmCompania.tblCompaniaNOMBRE.Value;
         frmEnviarEmail.edtDestinatario.Text := dmCompania.tblCompaniaEMAIL.Value;
         frmEnviarEmail.edtTema.Text         := 'Reclamaciones Póliza Número: '+qckReclamacion.qryRepReclamacionNUMPOL.AsString;
         frmEnviarEmail.memMensaje.Lines.Clear;
         frmEnviarEmail.memMensaje.Lines.Add('Reclamación');
         frmEnviarEmail.memMensaje.Lines.Add('');
         frmEnviarEmail.memMensaje.Lines.Add('');
         frmEnviarEmail.memMensaje.Lines.Add('');
         frmEnviarEmail.Showmodal;
    finally
    frmEnviarEmail.Free;
    frmEnviarEmail:= Nil;
    end;
  end;
  GlbEnviaEmail:= False;
  GLBMostrarArchivo:=False;
  finally
  qckReclamacion.free;
  qckReclamacion:=Nil;
  end;
  refresh; 
end;

procedure TfrmReclamaciones.ExportarExcel1Click(Sender: TObject);
var
  _estadosql : string;
begin
  _estadosql:='';
  case _CodigoEstado of
  0:begin  //Cotización
      _estadosql:= ' and r.estado = 0';
    end;
  1:begin //Denegada
      _estadosql:= ' and r.estado = 1';
    end;
  2:begin //Autorizada
      _estadosql:= ' and r.estado = 2';
    end;
  3:begin //Pagada
      _estadosql:= ' and r.estado = 3';
    end;
  4:begin //Todo
      _estadosql:= ' and r.estado = 4';
    end;
  5:begin //Todo
      _estadosql:= ' and r.estado = 5';
    end;
  6:begin //Todo
      _estadosql:= ' and r.estado = 6';
    end;
  7:begin //Todo
      _estadosql:= ' and r.estado = 7';
    end;
  8:begin //Todo
      _estadosql:= ' and r.estado = 8';
    end;
  9:begin //Todo
      _estadosql:= ' and r.estado = 9';
    end;
  10:begin //Todo
      _estadosql:= ' and r.estado = 10';
    end;
  11:begin //Todo
      _estadosql:= ' and r.estado = 11';
    end;
  12:begin //Todo
      _estadosql:= ' and r.estado = 12';
    end;
  end;

  case RadioGroup1.ItemIndex of
  0:begin
      if (edtPoliza.Text <> '') then
      begin
        qryRepReclamacion.Close;
        qryRepReclamacion.Sql.Text:=qryRepReclamacion_Base.Sql.Text +
        ' Where r.numpol = '+ edtPoliza.Text+_estadosql;
        tblReclamaciones.Open;
      end;
  end;
  1:begin
      qryRepReclamacion.Close;
      qryRepReclamacion.Sql.Text:=qryRepReclamacion_Base.Sql.Text +
      ' Where r.fecha Between '+chr(39)+FormatDateTime('mm/dd/yyyy', edtFechaIni.Date)+chr(39)+
      ' and '+chr(39)+FormatDateTime('mm/dd/yyyy', edtFechaFin.Date)+chr(39)+_estadosql;
      tblReclamaciones.Open;
  end;
  2:begin
      qryRepReclamacion.Close;
      if (_estadosql <> '') then
      qryRepReclamacion.Sql.Text:=qryRepReclamacion_Base.Sql.Text +
      StringReplace(_estadosql,'and',' where ',[rfIgnoreCase,rfReplaceAll])
      else
      qryRepReclamacion.Sql.Text:=qryRepReclamacion_Base.Sql.Text +
      ' Where r.fecha Between '+chr(39)+FormatDateTime('mm/dd/yyyy', edtFechaIni.Date)+chr(39)+
      ' and '+chr(39)+FormatDateTime('mm/dd/yyyy', edtFechaFin.Date)+chr(39)+_estadosql;
  end;
  end;
  {
  qryRepReclamacion.Close;
  qryRepReclamacion.Params[0].Value:= ExtraerFecha(edtFechaIni.Date);
  qryRepReclamacion.Params[1].Value:= ExtraerFecha(edtFechaFin.Date);
  qryRepReclamacion.SQL.Text       := qryRepReclamacion_Base.SQL.Text;
  }
  qryRepReclamacion.Open;
  if qryRepReclamacion.RecordCount = 0 then
  begin
    MessageDlg('No hay datos, revise criterio.',mtInformation,[mbok],0);
    Exit;
  end;
  GlbEnviaEmail:= chkboxEmail.Checked;
  GLBMostrarArchivo:=True;
  ExporToExcel(qryRepReclamacion,GlbRutaInformes+'ListaReclamaciones',true);
  if FileExists(glbZipFile) and (GlbEnviaEmail) then
  begin
    frmEnviarEmail:=TfrmEnviarEmail.Create(Nil);
    try
      GlbIDTipoEmail := 100; //Estandar
      GlbEnviaEmail:= chkboxEmail.Checked;
      if dmCompania.tblCompania.State = dsInactive then
         dmCompania.tblCompania.Open;
         dmCompania.tblCompania.Locate('codigo', glbCia_Key,[]);
         frmEnviarEmail._cmdminio:= dmCompania.tblCompaniaNOMBRE.Value;
         frmEnviarEmail.edtDestinatario.Text := dmCompania.tblCompaniaEMAIL.Value;
         frmEnviarEmail.edtTema.Text         := 'Listado de Reclamaciones';
         frmEnviarEmail.memMensaje.Lines.Clear;
         frmEnviarEmail.memMensaje.Lines.Add('Relación de Reclamaciones');
         frmEnviarEmail.memMensaje.Lines.Add('');
         frmEnviarEmail.memMensaje.Lines.Add('');
         frmEnviarEmail.memMensaje.Lines.Add('');
         frmEnviarEmail.Showmodal;
    finally
    frmEnviarEmail.Free;
    frmEnviarEmail:= Nil;
    end;
  end;
  GlbEnviaEmail:= False;
  GLBMostrarArchivo:=False;
end;

procedure TfrmReclamaciones.ExcelClick(Sender: TObject);
begin
  Excel.Enabled:=False;
  ExportarExcel1Click(Self);
  Excel.Enabled:=True;
  Refresh;
end;

procedure TfrmReclamaciones.BitBtn4Click(Sender: TObject);
begin
  frmClientes:=TfrmClientes.Create(Nil);
  try
    frmClientes.PageControl1.ActivePageIndex:=0;
    frmClientes.Showmodal;
  finally
  frmClientes.Free;
  frmClientes:=Nil;
  end;
  refresh;
end;

procedure TfrmReclamaciones.DBEdit3Exit(Sender: TObject);
begin
  if tblReclamacionesNUMPOL.IsNull then exit;
  if tblReclamaciones.State = dsInsert then
  begin
    qryTieneRcl.Close;
    qryTieneRcl.Params[0].Value:= tblReclamacionesNUMPOL.Value;
    qryTieneRcl.Open;
    if qryTieneRcl.RecordCount > 0 then
    begin
      if qryTieneRclCANTDIAS.Value < 30 then
      begin
        if MessageDlg('Esta póliza ('+tblReclamacionesNUMPOL.AsString+' tiene una reclamación en los últimos 30 días.',mtInformation,[mbYes, mbNo],0) = mrno then
        tblReclamaciones.Cancel;
      end;
    end;
  end else
  begin
    qryDatosVeh.Close;
    qryDatosVeh.Params[0].Value:= tblReclamacionesNUMPOL.Value;
    qryDatosVeh.Params[1].Value:= tblReclamacionesNUMPOL.Value;
    qryDatosVeh.Open;
  end;
end;

procedure TfrmReclamaciones.BitBtn5Click(Sender: TObject);
begin
  frmProveedores:=TfrmProveedores.Create(Nil);
  try
    frmProveedores.Showmodal;
  finally
  frmProveedores.Free;
  frmProveedores:=Nil;
  end;
  refresh;
end;

procedure TfrmReclamaciones.chkboxEmailClick(Sender: TObject);
begin
  if chkboxEmail.Checked then
  GlbEnviaEmail:=True else GlbEnviaEmail:=False;
end;

procedure TfrmReclamaciones.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  GlbEnviaEmail:=False;
  qryCentroCostos.close;
  qryCliente.Close;
  qryTieneRcl.Close;
  qryRepReclamacion.Close;
  qryDatosVeh.Close;
  qryProveedores.Close;
  qryEmpCodV.Close;
  qryBuscarCobertura.Close;
  tblReclamaciones.Close;  
end;

procedure TfrmReclamaciones.tblReclamacionesAfterClose(DataSet: TDataSet);
begin
  Panel2.Visible:=False;
end;

procedure TfrmReclamaciones.tblReclamacionesAfterPost(DataSet: TDataSet);
begin
  Panel2.Visible:=True;
end;

procedure TfrmReclamaciones.AbrirReclamacionesOrder(fName: string);
var
  _estadosql : string;
begin
  _estadosql:='';
  case _CodigoEstado of
  0:begin  //Cotización
      _estadosql:= ' and estado = 0';
    end;
  1:begin //Denegada
      _estadosql:= ' and estado = 1 ';
    end;
  2:begin //Autorizada
      _estadosql:= ' and estado = 2 ';
    end;
  3:begin //Pagada
      _estadosql:= ' and estado = 3 ';
    end;
  4:begin //Todo
      _estadosql:= ' and estado = 4 ';
    end;
  5:begin //Todo
      _estadosql:= ' and estado = 5 ';
    end;
  6:begin //Todo
      _estadosql:= ' and estado = 6 ';
    end;
  7:begin //Todo
      _estadosql:= ' and estado = 7 ';
    end;
  8:begin //Todo
      _estadosql:= ' and estado = 8 ';
    end;
  9:begin //Todo
      _estadosql:= ' and estado = 9 ';
    end;
  10:begin //Denegada
      _estadosql:= ' and estado = 10 ';
    end;
  11:begin //Pagada
      _estadosql:= ' and estado = 11 ';
    end;
  12:begin //Pagada
      _estadosql:= ' and estado = 12 ';
    end;
  end;

  case RadioGroup1.ItemIndex of
  0:begin
      if (edtPoliza.Text <> '') then
      begin
        tblReclamaciones.Close;
        tblReclamaciones.SelectSQL.Text:=
        'select * from RECLAMACION Where numpol = '+ edtPoliza.Text+_estadosql+
        ' order by '+fName;
        tblReclamaciones.Open;
      end;
  end;
  1:begin
      tblReclamaciones.Close;
        tblReclamaciones.SelectSQL.Text:=
        'select * from RECLAMACION Where fecha between '+chr(39)+FormatDateTime('mm/dd/yyyy', edtFechaIni.Date)+chr(39)+
        ' and '+chr(39)+FormatDateTime('mm/dd/yyyy', edtFechaFin.Date)+chr(39)+_estadosql+
        ' order by '+fName;
        tblReclamaciones.Open;
  end;
  2:begin
      tblReclamaciones.Close;
        if (_estadosql <> '') then
        tblReclamaciones.SelectSQL.Text:=
        'select * from RECLAMACION'+StringReplace(_estadosql,'and',' where ',[rfIgnoreCase,rfReplaceAll])
        +' order by '+fName
        else
        tblReclamaciones.SelectSQL.Text:= 'select * from RECLAMACION'+
        ' order by '+fName;

        tblReclamaciones.Open;
  end;
  end;

end;

procedure TfrmReclamaciones.BitBtn6Click(Sender: TObject);
begin
  if tblReclamacionesDocs.State in [dsBrowse] then
  begin
    tblReclamacionesDocs.Append;
    tblReclamacionesDocsTIPO_DOC.Value:=1;
    tblReclamacionesDocsCODIGO.Value:=tblReclamacionesIDRECLAMACION.Value;
  end;
end;

procedure TfrmReclamaciones.BitBtn7Click(Sender: TObject);
begin
  if tblReclamacionesDocs.State in [dsBrowse] then
  begin
    tblReclamacionesDocs.Edit;
  end;
end;

procedure TfrmReclamaciones.BitBtn8Click(Sender: TObject);
begin
  if tblReclamacionesDocs.State in [dsInsert,dsEdit] then
  begin
    if tblReclamacionesDocsTIPO_DOC.IsNull then
    begin
      MessageDlg('Debe indicar el tipo de documento.', mtInformation,[mbyes, mbno],0);
      Exit;
    end;
    if  tblReclamacionesDocsID.IsNull then
    tblReclamacionesDocsCODIGO.Value:=tblReclamacionesIDRECLAMACION.Value;
    GlbSalvarQuery(tblReclamacionesDocs);
  end;
end;

procedure TfrmReclamaciones.BitBtn9Click(Sender: TObject);
begin
  if tblReclamacionesDocs.State in [dsBrowse] then
  begin
    if tblReclamacionesDocs.State in [dsInsert, dsEdit] then
    begin
      tblReclamacionesDocs.cancel;
    end;
  end;
end;

procedure TfrmReclamaciones.BitBtn10Click(Sender: TObject);
begin
  if tblReclamacionesDocs.State in [dsBrowse] then
  begin
    tblReclamacionesDocs.close;
    tblReclamacionesDocs.Open;
  end;
end;

procedure TfrmReclamaciones.SpeedButton4Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    tblReclamacionesDocs.Edit;
    tblReclamacionesDocsRUTA_FOTO.Value:=OpenDialog1.FileName;
    tblReclamacionesDocsRUTA_FOTO.Value:= ExtractFileName(OpenDialog1.FileName);

    if not DirectoryExists(GlbReposDocs+'Reclamaciones') then
    if not ForceDirectories(GlbReposDocs+'Reclamaciones') then
    begin
      LogInformacionTxt('Log Reclamaciones. '+strUserName+ '. Usuario : '+
      VarNombreUsuario+ '. Fecha :'+DateTimeToStr(now)+'. Error creando directorio: '+
      GlbReposDocs+'Reclamaciones');
    end;

    tblReclamacionesDocsRUTA_FOTO.Value:= GlbReposDocs+'Reclamaciones\'+ 'Recl'+
    tblReclamacionesDocsCODIGO.AsString+'_'+tblReclamacionesDocsRUTA_FOTO.Value;

    if Not CopyFile(PAnsiChar(OpenDialog1.FileName), PAnsiChar(tblReclamacionesDocsRUTA_FOTO.Value),True) then
    begin
      if MessageDlg('Archivo no puede ser copiado, re-intentarlo?', mtInformation,[mbyes, mbno],0) = mrYes then
      if not CopyFile(PAnsiChar(OpenDialog1.FileName),PAnsiChar(tblReclamacionesDocsRUTA_FOTO.Value),false) then
      MessageDlg('Archivo no puede ser copiado, verifique', mtInformation,[mbyes, mbno],0);
    end;
    BitBtn8Click(Self);
  end;
end;

procedure TfrmReclamaciones.RxDBGrid2CellClick(Column: TColumn);
begin
  BitBtn11Click(Self);
end;

procedure TfrmReclamaciones.BitBtn11Click(Sender: TObject);
begin
  if not tblReclamacionesDocsRUTA_FOTO.IsNull then
  ShellExecute(0, 'Open', PChar(tblReclamacionesDocsRUTA_FOTO.Value), PChar(''), PChar(''), SW_SHOWNORMAL);
end;

procedure TfrmReclamaciones.RxDBGrid2DblClick(Sender: TObject);
begin
  BitBtn11Click(Self);
end;

procedure TfrmReclamaciones.BitBtn12Click(Sender: TObject);
begin
  if tblReclamacionesDocs.State in [dsBrowse] then
  begin
    if MessageDlg('¿Desea eliminar enlace a documento?',mtInformation,[mbyes,mbno],0)=mryes then
    begin
      tblReclamacionesDocs.Delete;
      GlbSalvarQuery(tblReclamacionesDocs);
    end;
  end;
end;

procedure TfrmReclamaciones.ComboBox1Change(Sender: TObject);
begin
  if tblReclamaciones.State in [dsInsert, dsEdit] then
  begin
    MessageDlg('Tienes una transacción activa, verifique.',mtwarning,[],0);
    exit;
  end;
  if qryEstadosReclam.Locate('descripcion',ComboBox1.Text,[]) then
  _CodigoEstado:=qryEstadosReclamCODIGO.Value
  else
  _CodigoEstado:=-1;
  AbrirReclamaciones;
  if (edtPoliza.Text <> '') then
  if not tblReclamaciones.Locate('NUMPOL',edtPoliza.Text,[loPartialKey]) then
  MessageDlg('Número póliza no encontrada, verifique.',mtInformation,[mbok],0);
  ProcLlenarEstadosCount;
  refresh;
end;

procedure TfrmReclamaciones.tblReclamacionesBeforePost(DataSet: TDataSet);
begin
  ProcLlenarEstadosCount;
end;

procedure TfrmReclamaciones.ListBox1Click(Sender: TObject);
var
   x : string;
   v : TStringList;
begin
 try
  x:= ListBox1.Items[listbox1.ItemIndex];
  x:=x;
  v := TStringList.Create();
  v:= Split('-',x);
  if (v.Count=2) then
  begin
    if (v[1] <> '') then
    begin
      ComboBox1.Text:=v[1];
      ComboBox1Change(Self);
    end;
  end;
  except
  end;
end;

procedure TfrmReclamaciones.ProcShowMontoUltConsumo(chasis: string);
begin
  try
  if (chasis = '') then exit;
  qryMontoRecdoUlt.Close;
  qryMontoRecdoUlt.params[0].Value:= chasis;
  qryMontoRecdoUlt.Open;   //qryMontoRecdoUlt.sql.text
  qryMontoRecdoUlt.first;
  if not qryMontoRecdoUltMONTO.IsNull then
  begin
    Label38.Visible :=true;
    DBText11.Visible:=true;
  end else
  begin
    Label38.Visible :=false;
    DBText11.Visible:=false;
  end;
  //SpeedButton5.Visible:=DBText11.Visible;
  qryHistRecxNumPol.first;
  except
  end;
  //if qryHistRecxNumPol.RecordCount > 0 then
  //SpeedButton5.Visible:= true;
end;

procedure TfrmReclamaciones.SpeedButton5Click(Sender: TObject);
begin
  if (tblReclamacionesNUMPOL.IsNull) then
  begin
    MessageDlg('Transacción no tiene poliza asignada, verifique.',mtwarning,[mbok],0);
    exit;
  end;
  frmHistReclPoliza:=TfrmHistReclPoliza.Create(nil);
  try
    qryHistRecxNumPol.close;
    qryHistRecxNumPol.params[0].Value:=tblReclamacionesNUMPOL.Value;
    qryHistRecxNumPol.open;
    frmHistReclPoliza.showmodal;
    qryHistRecxNumPol.close;
  finally
  frmHistReclPoliza.free;
  frmHistReclPoliza:=nil;
  end;
end;

procedure TfrmReclamaciones.qryMontoRecdoUltAfterOpen(DataSet: TDataSet);
begin
  if (tblReclamacionesNUMPOL.IsNull) then exit;
  qryHistRecxNumPol.close;
  qryHistRecxNumPol.params[0].Value:=tblReclamacionesNUMPOL.Value;
  qryHistRecxNumPol.open;
end;

procedure TfrmReclamaciones.tblReclamacionesFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept:= DataSet['NUMPOL'] = edtPoliza.Text;
end;

procedure TfrmReclamaciones.DBEdit5Exit(Sender: TObject);
begin
  if tblReclamaciones.State in [dsEdit,dsInsert] then
  CalcularMontos;
end;


procedure TfrmReclamaciones.CalcularMontos;
begin

  tblReclamacionesMONTO_APAGAR.Value:=
  tblReclamacionesMONTO_COTIZADO.Value *
  qryBuscarCoberturaPORC_INDEMNIZACION.Value / 100;

  //Si monto a pagar es mayor que la cobertua
  if tblReclamacionesMONTO_COTIZADO.Value <= qryBuscarCoberturaMONTOCOBERTURA.Value then
  begin
     tblReclamacionesMONTO_APAGAR.Value:=qryBuscarCoberturaMONTOCOBERTURA.Value *
     qryBuscarCoberturaPORC_INDEMNIZACION.Value / 100;

     tblReclamacionesMONTO_CLIENTE.Value:= tblReclamacionesMONTO_COTIZADO.Value *
     (1 - (qryBuscarCoberturaPORC_INDEMNIZACION.Value / 100)) +
     tblReclamacionesMONTONOCUBIERTO.Value;

     tblReclamacionesMONTO_APAGAR.Value:= tblReclamacionesMONTOCONDESCAPLICADO.Value
     - tblReclamacionesMONTO_CLIENTE.Value;

  end
  else
  begin
     tblReclamacionesMONTO_CLIENTE.Value:= tblReclamacionesMONTO_COTIZADO.Value *
     (1 - (qryBuscarCoberturaPORC_INDEMNIZACION.Value / 100)) +
     tblReclamacionesMONTONOCUBIERTO.Value;

     tblReclamacionesMONTO_APAGAR.Value:= tblReclamacionesMONTOCONDESCAPLICADO.Value
     - tblReclamacionesMONTO_CLIENTE.Value;

    //tblReclamacionesMONTO_CLIENTE.Value:= tblReclamacionesMONTONOCUBIERTO.Value;
    //tblReclamacionesMONTO_APAGAR.Value:= tblReclamacionesMONTOCONDESCAPLICADO.Value
    //- tblReclamacionesMONTO_CLIENTE.Value;
  end;

  //tblReclamacionesMONTO_CLIENTE.Value:= (tblReclamacionesMONTO_COTIZADO.Value -
  //tblReclamacionesMONTO_APAGAR.Value) + (tblReclamacionesMONTONOCUBIERTO.Value);

  {
  propuesta
  //Si monto a pagar es mayor que la cobertua
  if tblReclamacionesMONTO_COTIZADO.Value > qryBuscarCoberturaMONTOCOBERTURA.Value then
  tblReclamacionesMONTOCONDESCAPLICADO.Value:= tblReclamacionesMONTOCONDESCAPLICADO.Value *
     qryBuscarCoberturaPORC_INDEMNIZACION.Value / 100
  else
  if (tblReclamacionesMONTO_APAGAR.Value > tblReclamacionesMONTOCONDESCAPLICADO.Value) then
     tblReclamacionesMONTO_APAGAR.Value:= tblReclamacionesMONTOCONDESCAPLICADO.Value *
     qryBuscarCoberturaPORC_INDEMNIZACION.Value / 100
  else
     tblReclamacionesMONTO_APAGAR.Value:= tblReclamacionesMONTO_COTIZADO.Value *
     qryBuscarCoberturaPORC_INDEMNIZACION.Value / 100;

  tblReclamacionesMONTO_CLIENTE.Value:= tblReclamacionesMONTO_COTIZADO.Value *
  (1 - qryBuscarCoberturaPORC_INDEMNIZACION.Value / 100) +
  tblReclamacionesMONTONOCUBIERTO.Value;

  tblReclamacionesMONTO_APAGAR.Value:=tblReclamacionesMONTOCONDESCAPLICADO.Value -
  tblReclamacionesMONTO_CLIENTE.Value;
   }
end;

{
procedure TfrmReclamaciones.CalcularMontos;
begin

***********************Antes************************
      tblReclamacionesMONTO_APAGAR.Value:=
      tblReclamacionesMONTO_COTIZADO.Value *
      qryBuscarCoberturaPORC_INDEMNIZACION.Value / 100;
      //Si monto a pagar es mayor que la cobertua
      if tblReclamacionesMONTO_COTIZADO.Value > qryBuscarCoberturaMONTOCOBERTURA.Value then
      tblReclamacionesMONTO_APAGAR.Value:=qryBuscarCoberturaMONTOCOBERTURA.Value *
      qryBuscarCoberturaPORC_INDEMNIZACION.Value / 100
      else
      if (tblReclamacionesMONTO_APAGAR.Value > qryBuscarCoberturaMONTOCOBERTURA.Value) then
      tblReclamacionesMONTO_APAGAR.Value:= qryBuscarCoberturaMONTOCOBERTURA.Value *
      qryBuscarCoberturaPORC_INDEMNIZACION.Value / 100
      else
      tblReclamacionesMONTO_APAGAR.Value:= tblReclamacionesMONTO_COTIZADO.Value *
      qryBuscarCoberturaPORC_INDEMNIZACION.Value / 100;

      tblReclamacionesMONTO_CLIENTE.Value:= tblReclamacionesMONTO_COTIZADO.Value -
      tblReclamacionesMONTO_APAGAR.Value;
***********************Antes************************

  tblReclamacionesMONTO_APAGAR.Value:=
  tblReclamacionesMONTO_COTIZADO.Value *
  qryBuscarCoberturaPORC_INDEMNIZACION.Value / 100;

  //tblReclamacionesMONTOCONDESCAPLICADO.Value := tblReclamacionesMONTO_COTIZADO.Value -
  //tblReclamacionesDESCUENTOAFILIADO.Value;

  //Si monto a pagar es mayor que la cobertua
  if tblReclamacionesMONTO_COTIZADO.Value > tblReclamacionesMONTOCONDESCAPLICADO.Value then
  //qryBuscarCoberturaMONTOCOBERTURA.Value then
  tblReclamacionesMONTO_APAGAR.Value:= tblReclamacionesMONTOCONDESCAPLICADO.Value *
  qryBuscarCoberturaPORC_INDEMNIZACION.Value / 100
  else
  if (tblReclamacionesMONTO_APAGAR.Value > tblReclamacionesMONTOCONDESCAPLICADO.Value) then
  //qryBuscarCoberturaMONTOCOBERTURA.Value) then
  tblReclamacionesMONTO_APAGAR.Value:= tblReclamacionesMONTOCONDESCAPLICADO.Value *
  qryBuscarCoberturaPORC_INDEMNIZACION.Value / 100
  else
  tblReclamacionesMONTO_APAGAR.Value:= tblReclamacionesMONTO_COTIZADO.Value *
  qryBuscarCoberturaPORC_INDEMNIZACION.Value / 100;


  tblReclamacionesMONTO_CLIENTE.Value:= tblReclamacionesMONTO_COTIZADO.Value *
  (1 - qryBuscarCoberturaPORC_INDEMNIZACION.Value / 100) +
  tblReclamacionesMONTONOCUBIERTO.Value;

  tblReclamacionesMONTO_APAGAR.Value:=tblReclamacionesMONTOCONDESCAPLICADO.Value -
  tblReclamacionesMONTO_CLIENTE.Value;

end;
}
procedure TfrmReclamaciones.DBEdit7Exit(Sender: TObject);
begin
  if tblReclamaciones.State in [dsEdit,dsInsert] then
  CalcularMontos;
end;

end.
