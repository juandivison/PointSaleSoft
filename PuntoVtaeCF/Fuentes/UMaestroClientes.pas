unit UMaestroClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, Menus, Grids, DBGrids, RXDBCtrl, DBCtrls,
  ShellApi,StdCtrls, ExtCtrls, Mask, RXCtrls, ComCtrls, Buttons, ExtDlgs, DBActns,
  ActnList, WinSkinData, RxLookup, rxToolEdit, RxDBComb, GetAnyDate;

type
  TfrmClientes = class(TForm)
    Panel1: TPanel;
    btnInsertar: TBitBtn;
    btnModificar: TBitBtn;
    btnSalvar: TBitBtn;
    btnCancelar: TBitBtn;
    btnCerarAbrirres: TBitBtn;
    BitBtn2: TBitBtn;
    PageControl1: TPageControl;
    tabClientes: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    DBStatusLabel2: TDBStatusLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit15: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    tabExaminar: TTabSheet;
    RxDBGrid1: TRxDBGrid;
    tabClasifiCte: TTabSheet;
    Label16: TLabel;
    Label17: TLabel;
    DBStatusLabel3: TDBStatusLabel;
    Label18: TLabel;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBGrid1: TDBGrid;
    DBNavigator2: TDBNavigator;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    DBEdit18: TDBEdit;
    dtSource: TDataSource;
    PopupMenu1: TPopupMenu;
    Todos1: TMenuItem;
    dstblTipoCliente: TDataSource;
    DBLookupComboBox2: TDBLookupComboBox;
    Label4: TLabel;
    dstblMoneda: TDataSource;
    DBImage1: TDBImage;
    Label20: TLabel;
    BitBtn1: TBitBtn;
    OpenPictureDialog1: TOpenPictureDialog;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    ActionList1: TActionList;
    DataSetFirst1: TDataSetFirst;
    DataSetPrior1: TDataSetPrior;
    DataSetNext1: TDataSetNext;
    DataSetLast1: TDataSetLast;
    Label21: TLabel;
    DBEdit4: TDBEdit;
    Label27: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    DBComboBox1: TDBComboBox;
    labelCantDias: TLabel;
    Label28: TLabel;
    DBEdit6: TDBEdit;
    dstblCondicionVenta: TDataSource;
    BitBtn7: TBitBtn;
    RxDBLookupCombo2: TRxDBLookupCombo;
    Label22: TLabel;
    TabSheet1: TTabSheet;
    Panel5: TPanel;
    BitBtn8: TBitBtn;
    RxDBGrid2: TRxDBGrid;
    SkinData1: TSkinData;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;
    Button1: TButton;
    RxDBLookupCombo3: TRxDBLookupCombo;
    Label19: TLabel;
    DBEdit19: TDBEdit;
    Label24: TLabel;
    DBEdit20: TDBEdit;
    Label25: TLabel;
    DBRadioGroup3: TDBRadioGroup;
    RxDBLookupCombo4: TRxDBLookupCombo;
    Label23: TLabel;
    TabSheet2: TTabSheet;
    DataSource1: TDataSource;
    Label30: TLabel;
    DBEdit23: TDBEdit;
    Label31: TLabel;
    Label32: TLabel;
    DBEdit25: TDBEdit;
    Label33: TLabel;
    DBEdit26: TDBEdit;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    DBEdit30: TDBEdit;
    DBDateEdit1: TDBDateEdit;
    RxDBLookupCombo5: TRxDBLookupCombo;
    BitBtn15: TBitBtn;
    BitBtn16: TBitBtn;
    BitBtn17: TBitBtn;
    BitBtn18: TBitBtn;
    RxDBGrid3: TRxDBGrid;
    DBStatusLabel1: TDBStatusLabel;
    Button2: TButton;
    Button3: TButton;
    RxDBComboBox1: TRxDBComboBox;
    DBText1: TDBText;
    GetAnyDate1: TGetAnyDate;
    BitBtn19: TBitBtn;
    DBDateEdit2: TDBDateEdit;
    Label26: TLabel;
    Button4: TButton;
    BitBtn21: TBitBtn;
    BitBtn22: TBitBtn;
    BitBtn23: TBitBtn;
    BitBtn24: TBitBtn;
    BitBtn26: TBitBtn;
    RxDBLookupCombo6: TRxDBLookupCombo;
    Label29: TLabel;
    RxDBLookupCombo7: TRxDBLookupCombo;
    DBEdit14: TDBEdit;
    lblCiudad: TLabel;
    PopupMenu2: TPopupMenu;
    ReporteCliente1: TMenuItem;
    ReporteXVendedor1: TMenuItem;
    ReporteXCiudad1: TMenuItem;
    XRutaVenta1: TMenuItem;
    RxSpeedButton1: TRxSpeedButton;
    RxDBLookupCombo8: TRxDBLookupCombo;
    Label38: TLabel;
    BitBtn20: TBitBtn;
    BitBtn27: TBitBtn;
    dsqryEmpVentas: TDataSource;
    ExportarXLS1: TMenuItem;
    BitBtn28: TBitBtn;
    dsQrySectores: TDataSource;
    BitBtn29: TBitBtn;
    FiltrarSinVendedor1: TMenuItem;
    RxLabel1: TRxLabel;
    ClientesSinVentas1: TMenuItem;
    XCalle1: TMenuItem;
    DBEdit21: TDBEdit;
    Label39: TLabel;
    DBEdit22: TDBEdit;
    Label40: TLabel;
    Label42: TLabel;
    DBEdit24: TDBEdit;
    BitBtn30: TBitBtn;
    DBEdit27: TDBEdit;
    Label41: TLabel;
    Certificado1: TMenuItem;
    Label43: TLabel;
    RxDBLookupCombo9: TRxDBLookupCombo;
    RxDBLookupCombo10: TRxDBLookupCombo;
    Label44: TLabel;
    DBEdit28: TDBEdit;
    Label45: TLabel;
    DBEdit31: TDBEdit;
    Label46: TLabel;
    DBEdit32: TDBEdit;
    Label47: TLabel;
    dsqryAgencia: TDataSource;
    dsqryDearler: TDataSource;
    BitBtn31: TBitBtn;
    BitBtn32: TBitBtn;
    BitBtn33: TBitBtn;
    DBEdit33: TDBEdit;
    Label48: TLabel;
    CheckBox1: TCheckBox;
    CumpleaosClientes1: TMenuItem;
    ExportarXLSCtesTaller1: TMenuItem;
    BitBtn25: TBitBtn;
    RxDBComboBox2: TRxDBComboBox;
    Label49: TLabel;
    BitBtn34: TBitBtn;
    RxDBLookupCombo11: TRxDBLookupCombo;
    DBRadioGroup1: TDBRadioGroup;
    Label50: TLabel;
    BitBtn35: TBitBtn;
    BitBtn36: TBitBtn;
    RxDBLookupCombo12: TRxDBLookupCombo;
    Label51: TLabel;
    BitBtn37: TBitBtn;
    BitBtn38: TBitBtn;
    DBDateEdit3: TDBDateEdit;
    DuplicarCliente1: TMenuItem;
    BitBtn39: TBitBtn;
    TabSheet3: TTabSheet;
    Label52: TLabel;
    Label54: TLabel;
    Label56: TLabel;
    Label58: TLabel;
    DBText2: TDBText;
    Label60: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    DBEdit29: TDBEdit;
    DBEdit34: TDBEdit;
    DBDateEdit4: TDBDateEdit;
    BitBtn40: TBitBtn;
    BitBtn41: TBitBtn;
    BitBtn42: TBitBtn;
    BitBtn43: TBitBtn;
    RxDBLookupCombo14: TRxDBLookupCombo;
    DBEdit39: TDBEdit;
    BitBtn44: TBitBtn;
    BitBtn46: TBitBtn;
    DBEdit40: TDBEdit;
    CheckBox2: TCheckBox;
    RxDBComboBox4: TRxDBComboBox;
    BitBtn47: TBitBtn;
    RxDBLookupCombo16: TRxDBLookupCombo;
    DBRadioGroup2: TDBRadioGroup;
    DBDateEdit5: TDBDateEdit;
    dstblGarantiaMovil: TDataSource;
    Label53: TLabel;
    DBDateEdit6: TDBDateEdit;
    Label55: TLabel;
    DBEdit35: TDBEdit;
    Label57: TLabel;
    DBEdit36: TDBEdit;
    Label59: TLabel;
    DBEdit41: TDBEdit;
    Label61: TLabel;
    DBMemo1: TDBMemo;
    Label68: TLabel;
    DBEdit42: TDBEdit;
    RxDBGrid4: TRxDBGrid;
    BitBtn45: TBitBtn;
    BitBtn48: TBitBtn;
    BitBtn49: TBitBtn;
    BitBtn50: TBitBtn;
    BitBtn51: TBitBtn;
    Label62: TLabel;
    DBEdit37: TDBEdit;
    Label63: TLabel;
    DBEdit38: TDBEdit;
    DBStatusLabel4: TDBStatusLabel;
    HistoricodeRenovaciones1: TMenuItem;
    HistoricodeRenovacionesTodos1: TMenuItem;
    HistoricoRennovGarantias1: TMenuItem;
    HistoricoRenovGarantiasTodos1: TMenuItem;
    Label67: TLabel;
    Label69: TLabel;
    BitBtn52: TBitBtn;
    BitBtn53: TBitBtn;
    EliminarRecord1: TMenuItem;
    btnDuplicados: TSpeedButton;
    DBRadioGroup4: TDBRadioGroup;
    DBComboBox2: TDBComboBox;
    Label70: TLabel;
    procedure btnInsertarClick(Sender: TObject);
    procedure btnModificarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnCerarAbrirresClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure BitBtn18Click(Sender: TObject);
    procedure TabSheet2Enter(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure DBEdit23Exit(Sender: TObject);
    procedure tabClientesExit(Sender: TObject);
    procedure BitBtn19Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure DBEdit4Exit(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn26Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ReporteXVendedor1Click(Sender: TObject);
    procedure ReporteCliente1Click(Sender: TObject);
    procedure ReporteXCiudad1Click(Sender: TObject);
    procedure BitBtn20Click(Sender: TObject);
    procedure XRutaVenta1Click(Sender: TObject);
    procedure BitBtn27Click(Sender: TObject);
    procedure ExportarXLS1Click(Sender: TObject);
    procedure BitBtn28Click(Sender: TObject);
    procedure DBEdit6Exit(Sender: TObject);
    procedure BitBtn29Click(Sender: TObject);
    procedure Todos1Click(Sender: TObject);
    procedure FiltrarSinVendedor1Click(Sender: TObject);
    procedure ClientesSinVentas1Click(Sender: TObject);
    procedure XCalle1Click(Sender: TObject);
    procedure BitBtn30Click(Sender: TObject);
    procedure RxDBLookupCombo7Change(Sender: TObject);
    procedure Certificado1Click(Sender: TObject);
    procedure BitBtn31Click(Sender: TObject);
    procedure BitBtn32Click(Sender: TObject);
    procedure BitBtn33Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CumpleaosClientes1Click(Sender: TObject);
    procedure ExportarXLSCtesTaller1Click(Sender: TObject);
    procedure BitBtn25Click(Sender: TObject);
    procedure BitBtn34Click(Sender: TObject);
    procedure BitBtn35Click(Sender: TObject);
    procedure BitBtn36Click(Sender: TObject);
    procedure DBRadioGroup1Click(Sender: TObject);
    procedure DBRadioGroup1Exit(Sender: TObject);
    procedure BitBtn37Click(Sender: TObject);
    procedure BitBtn38Click(Sender: TObject);
    procedure DuplicarCliente1Click(Sender: TObject);
    procedure BitBtn39Click(Sender: TObject);
    procedure BitBtn45Click(Sender: TObject);
    procedure BitBtn48Click(Sender: TObject);
    procedure BitBtn51Click(Sender: TObject);
    procedure BitBtn49Click(Sender: TObject);
    procedure BitBtn50Click(Sender: TObject);
    procedure TabSheet3Enter(Sender: TObject);
    procedure tabClientesEnter(Sender: TObject);
    procedure HistoricodeRenovaciones1Click(Sender: TObject);
    procedure HistoricodeRenovacionesTodos1Click(Sender: TObject);
    procedure HistoricoRennovGarantias1Click(Sender: TObject);
    procedure HistoricoRenovGarantiasTodos1Click(Sender: TObject);
    procedure BitBtn46Click(Sender: TObject);
    procedure BitBtn47Click(Sender: TObject);
    procedure RxDBGrid3GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure RxDBGrid4GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure BitBtn21Click(Sender: TObject);
    procedure BitBtn22Click(Sender: TObject);
    procedure BitBtn23Click(Sender: TObject);
    procedure BitBtn24Click(Sender: TObject);
    procedure BitBtn40Click(Sender: TObject);
    procedure BitBtn41Click(Sender: TObject);
    procedure BitBtn42Click(Sender: TObject);
    procedure BitBtn43Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure DBEdit31Exit(Sender: TObject);
    procedure DBEdit33Exit(Sender: TObject);
    procedure BitBtn52Click(Sender: TObject);
    procedure BitBtn53Click(Sender: TObject);
    procedure EliminarRecord1Click(Sender: TObject);
    procedure btnDuplicadosClick(Sender: TObject);
    procedure btnDuplicadosDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure InsertarClienteEnWisPro(Codigocte:integer);
    procedure InsertarContratoWisPro(Codigocte:integer);
    procedure RepHistoricoVeh(tipo: smallint);
    procedure RepHisotoricoGarantia(tipo: Smallint);
    procedure VerificaNumPol(_numpol: integer);
    procedure ActivaBotonEliminar(_numpol:integer);

  public
    { Public declarations }
    rncRequerido:boolean;
    procedure ActivaPermiso(proceso:integer);

  end;

var
  frmClientes: TfrmClientes;

  //procedure creaMensaje (cont : string); stdcall external 'IdesiWisProApiDll.dll';
implementation

uses UDatModClientes, UDatModReportes, URepClientes, UDatModCompania,
  UBuscarClientesPersonasP, UDatModUsuarios, UGlobal,
  UFormReferenciaClientes, URegContactoCtes, UFormDatosFamilia,
  UDatmodDatosGenerales,UDatModEstudiante, UFormRetencionesTercero, UDatModFactura,
  URepClientesDatosVeh, USelClienteRepXVendedor, URepClientesCumple,
  UBuscarRazonSocialDBDgii, UDatModDGII, UFormSectores,
  USelClienteRepXRuta, UFormCiudad, UFormRutaVentas,
  URepClientesXDireccion, UFormConsultaCteXManzana, URepClientesXManzana,
  UFormTipoCliente, UFormARS, qckRepCertificadoSAM, UFormAgencias, UFormDealers,
  UFormConsultaCertificados, URepCumpleanioCte, DateUtils,
  UFormReportePolizas, UFormPolizasCXC, UFormContractWisPro,
  UFormCambiarCtePoliza, UFormConsultaCertificadosGM,
  UFormConsultaGarantias, UGarantiasEliminadas;


{$R *.dfm}

procedure TfrmClientes.btnInsertarClick(Sender: TObject);
begin
  if Pagecontrol1.ActivePage = tabClientes then
  begin
    if dmClientes.tblClientes.State in [dsBrowse] then
    begin
      dmClientes.tblClientes.Insert;
      dmClientes.tblClientesMONEDA_FACT.Value := '1';
      dmClientes.tblClientesCIUDAD.Value      := '';
      dmClientes.tblClientesFECHA_INSERTADO.Value:= now;
      dmClientes.tblClientesINSERTADO_POR.Value  := strusername;
      dmClientes.tblClientesCIA_KEY.Value:= glbCia_Key;
      dmClientes.tblClientesTipo_cliente.Value := 1;
      dmClientes.tblClientesUSARLEVELPRECIO.Value:=1;
      dmClientes.tblClientesSTATUS_CLIENTE.Value:='A';
      if (GlBCuadros = 1) then
      dmClientes.tblClientesPORC_BENEFICIO.Value:=10;
      
      if (frmClientes.Showing) then
      begin
        DBEdit2.SetFocus;
        DBEdit2.SelectAll;
      end;
    end;
  end;
end;

procedure TfrmClientes.btnModificarClick(Sender: TObject);
begin
  if Pagecontrol1.ActivePage = tabClientes then
  begin
    if dmClientes.tblClientes.State in [dsBrowse] then
    dmClientes.tblClientes.Edit;
      if (GlBCuadros = 1) and (dmClientes.tblClientesPORC_BENEFICIO.IsNull) then
      begin
        dmClientes.tblClientesPORC_BENEFICIO.Value:=10;
      end;
  end;
end;

procedure TfrmClientes.btnSalvarClick(Sender: TObject);
var
  esIns : boolean;
  esUpd : boolean;
  ExecuteResult : Integer;
  Parametros : String;
begin
  esIns:=False;
  if Pagecontrol1.ActivePage = tabClientes then
  begin
    if dmClientes.tblclientes.state in [dsEdit,dsInsert] then
    begin
      if dmClientes.tblclientes.state in [dsInsert] then
      esIns:=True;

      if dmClientes.tblclientes.state in [dsEdit] then
      esUpd:=True;

      if esIns and (GLBECOM = 1) then
      begin   
        if dmClientes.tblClientesPLAN_ID.IsNull then
        begin
          MessageDlg('Favor indicar Plan', mtError,[mbok],0);
          RxDBLookupCombo12.SetFocus;
          RxDBLookupCombo12.Color:=clYellow;
          Exit;
        end;
      end;
      if (Length(dmClientes.tblClientesNOMBRE_FACTURAR.Value) = 0) then
      begin
        MessageDlg('Favor indicar nombre a facturar',mtError,[mbok],0);
        DBEdit15.SetFocus;
        Exit;
      end;
      if dmClientes.tblClientesNOMBRE_CTE.IsNull then
      begin
        MessageDlg('Favor indicar nombre cliente', mtError,[mbOk],0);
        DBEdit2.SetFocus;
        Exit;
      end;

      //if (GlBCuadros = 1) and (dmClientes.tblClientesPORC_BENEFICIO.IsNull) then
      //begin
      //  MessageDlg('Favor indique porciento de beneficio.', mtError,[mbOk],0);
      //  DBComboBox2.SetFocus;
      //  Exit;
      //end;
      
      if dmClientes.tblClientesNOMBRE_ABREV.IsNull then
      begin
        dmClientes.tblClientesNOMBRE_ABREV.Value:='';
        //MessageDlg('Favor indicar nombre cliente abreviado', mtError,[mbOk],0);
        //DBEdit3.SetFocus;
        //Exit;
      end;
      if not dmClientes.tblClientesRNC_NUMERO.IsNull then
      dmClientes.tblClientesRNC_NUMERO.Value:=
      StringReplace(dmClientes.tblClientesRNC_NUMERO.Value,'-','',[rfReplaceAll]);

      GlbSalvarQuery(dmClientes.tblClientes);

      //test
      //esIns:= true;
      if esUpd and (GLBECOM = 1) and (GlbRutaWisPro <>'') then
      begin
        dmClientes.tblContractWisPro.close;
        dmClientes.tblContractWisPro.Open;
        if dmClientes.tblContractWisPro.Locate('CODIGO_CTE',dmClientes.tblClientesCODIGO_CTE.Value,[]) then
        begin
        //WinExec(PChar('WisProClient/IdesiWisProCloudClient.exe'+Format(' /USERNAME=%s /USERAUTENTICATED=%s /ACCION=%s /CUSTOMID%s',
        //[GlbUsuarioLogueado,'1','80',dmClientes.tblContractWisProCLIENTID.Value])), SW_HIDE);

        Parametros:=PChar(Format(' /USERNAME=%s /USERAUTENTICATED=%s /ACCION=%s /CUSTOMID=%s /AUTO=1',
        [GlbUsuarioLogueado,'1','80',dmClientes.tblContractWisProCLIENTID.Value]));

        ExecuteResult := ShellExecute(0, nil, PChar(GlbRutaWisPro), PChar(parametros), nil, SW_HIDE);
        if ExecuteResult <= 32 then
        begin
        WriteToLog('Error: ' + IntToStr(ExecuteResult));
        WriteToLog('Verifique ejecutable wispro: ' + IntToStr(ExecuteResult));
        WriteToLog('Parametros:'+Parametros);
        end;
      end

      end;
      
      if esIns and (GLBECOM = 1) then
      begin
        try
          BitBtn38Click(Self);
        except
        end;
      end;
      if assigned(frmARS) then
      close;
    end;
  end;
end;

procedure TfrmClientes.PageControl1Change(Sender: TObject);
begin
  if Pagecontrol1.ActivePage <> tabClientes then
  begin
    //Panel1.Enabled := False;
    Panel1.Color   := clGray;
  end else
  begin
    //Panel1.Enabled := True;
    Panel1.Color   := clBtnFace;
  end;
  if dmClientes.tblDatosVehiculo.State in [dsEdit, dsInsert] then exit;
  if (dmClientes.tblDatosVehiculo.Params[0].Value <> dmclientes.tblClientesCODIGO_CTE.Value) then
  begin
    dmClientes.tblDatosVehiculo.Close;
    dmClientes.tblDatosVehiculo.Params[0].Value:=dmclientes.tblClientesCODIGO_CTE.Value;
    dmClientes.tblDatosVehiculo.Open;
  end;
end;

procedure TfrmClientes.btnCancelarClick(Sender: TObject);
begin
  if dmClientes.tblDatosVehiculo.state in [dsedit, dsinsert] then Exit;
  
  if dmClientes.tblclientes.State In [dsEdit,dsInsert] then
  dmClientes.tblclientes.Cancel else
  begin
    if MessageDlg('¿Desea borrar cliente?',mtWarning,[mbYes, mbNo],0) = mryes then
    begin
      dmClientes.qryCteFacturas.Close;
      dmClientes.qryCteFacturas.Params[0].Value:=dmClientes.tblClientesCODIGO_CTE.Value;
      dmClientes.qryCteFacturas.Open;
      if dmClientes.qryCteFacturas.RecordCount > 0 then
      begin
        MessageDlg('Cliente tiene cuenta por cobrar, no será eliminado.', mtError,[mbNo],0);
      end else
      dmClientes.tblclientes.Delete;
      dmClientes.tblClientes.ApplyUpdates;
      if Not dmClientes.tblClientes.Transaction.InTransaction then
      dmClientes.tblClientes.Transaction.StartTransaction;
      try
        dmClientes.tblClientes.Transaction.CommitRetaining;
      except
      dmClientes.tblClientes.Transaction.RollbackRetaining;
      end;      
      //btnSalvarClick(Self);
    end;
  end;
end;

procedure TfrmClientes.btnCerarAbrirresClick(Sender: TObject);
begin
  if dmClientes.tblclientes.State In [dsBrowse, dsInactive] then
  begin
    dmClientes.tblclientes.Close;
    dmClientes.tblclientes.Open;
    dmClientes.qryAgencia.close;
    dmClientes.qryAgencia.Open;
    dmClientes.qryDearler.Close;
    dmClientes.qryDearler.Open;
    dmClientes.tblclientes.Filtered:=False;
    RxLabel1.Visible := False;    
  end;
end;

procedure TfrmClientes.FormCreate(Sender: TObject);
begin
  if (glbEcom = 1) and (glbSam = 1) then
  begin
    MessageDlg('Error de configuración. Verifique parametros para SAM y ECOM',mtError,[mbok],0);
  end;
  dmClientes.qryPlanesWisPro.Close;
  dmClientes.qryPlanesWisPro.Open;
  dmUsuarios.qryEmpVentas.Close;
  dmUsuarios.qryEmpVentas.Open;
  dmClientes.tblSectores.Close;
  dmClientes.tblSectores.Open;
  dmClientes.tblRutaVta.Close;
  dmClientes.tblRutaVta.Open;
  dmClientes.tblCiudades.Close;
  dmClientes.tblCiudades.Open;
  dmClientes.qryTipoAfiliado.Close;
  dmClientes.qryTipoAfiliado.Open;
  dmUsuarios.qryEmpleados.Close;
  dmUsuarios.qryEmpleados.Open;
  dmClientes.tblClientes.Close;
  dmClientes.tblClientes.Open;

  dmClientes.tblTipoCliente.Close;
  dmClientes.tblTipoCliente.Open;
  dmClientes.tblMoneda.Close;
  dmClientes.tblMoneda.Open;
  dmClientes.tblTipoPrecio.Close;
  dmClientes.tblTipoPrecio.Open;
  dmClientes.tblCondicionVenta.Close;
  dmClientes.tblCondicionVenta.Open;
  if GlbColegio = 1 then
  BitBtn14.Visible:= True
  else
  BitBtn14.Visible:= False;
  dmfactura.tblTipoCF.Close;
  dmfactura.tblTipoCF.Open;
  GetAnyDate1.Fecha:=GlbFechaTrnDiaria;
  GetAnyDate1.FechaFinal  := GlbFechaTrnDiaria+30;
  GetAnyDate1.FechaCierre := GlbFechaTrnDiaria;

  if GLBECOM = 1 then
  begin
    Label51.Visible:=True;
    RxDBLookupCombo12.Visible:=True;
    BitBtn37.Visible:=true;
    BitBtn37.Enabled:=True;
    BitBtn38.Visible:=true;
    BitBtn38.Enabled:=True;
  end;
  if GLBSAM = 1 then
  begin
    HistoricodeRenovaciones1.Visible:=true;
    HistoricodeRenovacionesTodos1.Visible:=true;
    HistoricoRennovGarantias1.Visible:=true;
    HistoricoRenovGarantiasTodos1.Visible:=true;
  end;
  if (GLBSAM = 0) and (GLBMotor = 0) then
  begin
    PageControl1.Pages[4].TabVisible := False;
    PageControl1.Pages[5].TabVisible := False;
  end else
  begin
    dmClientes.qryAgencia.close;
    dmClientes.qryAgencia.Open;
    dmClientes.qryDearler.Close;
    dmClientes.qryDearler.Open;
    if dmclientes.tblDatosVehiculo.State in [dsInactive,dsBrowse] then
    begin
      dmClientes.tblDatosVehiculo.Close;
      dmClientes.tblDatosVehiculo.Params[0].Value:=dmclientes.tblClientesCODIGO_CTE.Value;
      dmClientes.tblDatosVehiculo.Open;
      dmDatos.tblMarcaVehiculo.Close;
      dmDatos.tblMarcaVehiculo.Open;
    end;
  end;
  dmclientes.qryNumPolDup.close;
  dmclientes.qryNumPolDup.open;
  if dmclientes.qryNumPolDup.RecordCount > 1 then
  btnDuplicados.Visible:=True
  else btnDuplicados.Visible:=False;
end;

procedure TfrmClientes.BitBtn1Click(Sender: TObject);
begin
  if OpenPictureDialog1.Execute then
  begin
    if dmClientes.tblClientes.State = dsBrowse then
    dmClientes.tblClientes.Edit;
    dmClientes.tblClientesFOTO.LoadFromFile(OpenPictureDialog1.FileName);
  end;
end;

procedure TfrmClientes.BitBtn3Click(Sender: TObject);
begin
  if dmClientes.tblTipoCliente.State = dsBrowse then
  begin
    dmClientes.tblTipoCliente.Insert;
    DBEdit16.SetFocus;
  end;
end;

procedure TfrmClientes.BitBtn4Click(Sender: TObject);
begin
  if dmClientes.tblTipoCliente.State = dsBrowse then
  begin
    dmClientes.tblTipoCliente.Edit;
    DBEdit17.SetFocus;
  end;
end;

procedure TfrmClientes.BitBtn5Click(Sender: TObject);
begin
  if dmClientes.tblTipoCliente.State in [dsInsert, dsEdit] then
  begin
    dmClientes.tblTipoCliente.Post;
  end;
end;

procedure TfrmClientes.BitBtn6Click(Sender: TObject);
begin
  if dmClientes.tblTipoCliente.State in [dsInactive, dsBrowse] then
  begin
    dmClientes.tblTipoCliente.close;
    dmClientes.tblTipoCliente.open;
  end;
end;

procedure TfrmClientes.BitBtn7Click(Sender: TObject);
begin
  if dmclientes.tblDatosVehiculo.State in [dsInsert, dsEdit] then Exit;
  
  FrmBuscarClientesPersonas:=TFrmBuscarClientesPersonas.Create(Nil);
  try
    if FrmBuscarClientesPersonas.showmodal = mrOk then
    begin
      dmClientes.tblClientes.DisableControls;
      dmClientes.tblClientes.Tag := -1;
      if not dmClientes.tblClientes.Locate('codigo_cte', FrmBuscarClientesPersonas.CodigoCliente,[]) then
      MessageDlg('Cliente no encontrado verifique codigo.', mtInformation, [mbOK], 0);
      dmClientes.tblClientes.EnableControls;
      dmClientes.tblClientes.Tag := 0;
      dmClientes.tblDatosVehiculo.Close;
      dmClientes.tblDatosVehiculo.Params[0].Value:=dmclientes.tblClientesCODIGO_CTE.Value;
      dmClientes.tblDatosVehiculo.open;
    end;
  finally
  FrmBuscarClientesPersonas.Free;
  FrmBuscarClientesPersonas:=Nil;
  end;
end;

procedure TfrmClientes.ActivaPermiso(proceso: integer);
var
  X, y, z:integer;
begin
  dmusuarios.stpBuscarPermisos.Close;
  //dmusuarios.stpBuscarPermisos.Params[0].Value:=  //Out
  //dmusuarios.stpBuscarPermisos.Params[1].Value:=  //Out
  //dmusuarios.stpBuscarPermisos.Params[2].Value:=  //Out
  dmusuarios.stpBuscarPermisos.Params[0].Value:=  VarUsuarioGlb;//In
  dmusuarios.stpBuscarPermisos.Open;

  For x:=0 To frmClientes.controlcount -1 Do
  begin
    if frmClientes.controls[x].Tag > 0 then
    begin
    if dmusuarios.stpBuscarPermisos.Locate('procesoid;tareaid', Vararrayof([proceso,
    frmClientes.controls[x].Tag]),[]) then
    begin
      if dmusuarios.stpBuscarPermisos.FieldByName('status').Value = 1 then
      frmClientes.controls[x].Enabled:=True
      else
      begin
        frmClientes.controls[x].Enabled:=False;
        if dmusuarios.stpBuscarPermisosVISIBLE.Value = 0 then
        frmClientes.controls[x].Visible:=false;
      end
    end else
    begin
      frmClientes.controls[x].Enabled:=False;
      if dmusuarios.stpBuscarPermisosVISIBLE.Value = 0 then
      frmClientes.controls[x].Visible:=false;
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

    //TPanel
    if (Components[x] is TPanel) then
    begin
      //for y:=0 to TPanel(Components[x])do
      //begin
        if TPanel(Components[x]).Tag > 0 then
        begin
          if dmusuarios.stpBuscarPermisos.Locate('procesoid;tareaid', Vararrayof([proceso,
          TPanel(Components[x]).Tag]),[]) then
          begin
            if dmusuarios.stpBuscarPermisos.FieldByName('status').Value = 1 then
            TPanel(Components[x]).Enabled:=True
            else
            begin
              TPanel(Components[x]).Enabled:=False;
              if dmusuarios.stpBuscarPermisos.FieldByName('status').Value = 1 then
              TPanel(Components[x]).Visible:=False;
            end;
            end else
            begin
              TPanel(Components[x]).Enabled:=False;
              if dmusuarios.stpBuscarPermisos.FieldByName('status').Value = 1 then
              TPanel(Components[x]).Visible:=False;
            end;
          end;
      //  end;
    end;
    //TPanel

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
end;

procedure TfrmClientes.BitBtn8Click(Sender: TObject);
begin
  frmReferenciaClientes:=TfrmReferenciaClientes.Create(nil);
  try
    dmClientes.tblCteReferenciaMaster.Close;
    dmClientes.tblCteReferenciaMaster.Params[0].Value:=dmclientes.tblClientesCODIGO_CTE.Value;
    dmClientes.tblCteReferenciaMaster.Open;
    dmClientes.qryReferenciacliente.Close;
    dmClientes.qryReferenciacliente.Params[0].Value:= dmclientes.tblClientesCODIGO_CTE.Value;
    dmClientes.qryReferenciacliente.Open;
    frmReferenciaClientes.Showmodal;
  finally
  frmReferenciaClientes.Free;
  frmReferenciaClientes:=Nil;
  end;
  dmClientes.qryReferenciacliente.Close;
  dmClientes.qryReferenciacliente.Params[0].Value:= dmclientes.tblClientesCODIGO_CTE.Value;
  dmClientes.qryReferenciacliente.Open;
end;

procedure TfrmClientes.BitBtn13Click(Sender: TObject);
begin
  frmRegContactos:=TfrmRegContactos.Create(nil);
  try
    frmRegContactos.showmodal;
  finally
  frmRegContactos.free;
  frmRegContactos:=nil;
  end;
end;

procedure TfrmClientes.BitBtn14Click(Sender: TObject);
begin
  if GlbColegio = 1 then
  begin
    frmFamila:=TfrmFamila.Create(Nil);
    try
      dmEstudiante.tblFamilia.Close;
      dmEstudiante.tblFamilia.Params[0].Value:= dmclientes.tblClientesCODIGO_CTE.Value;
      dmEstudiante.tblFamilia.Open;
      frmFamila.Showmodal;
    finally
    frmFamila.Free;
    frmFamila:=Nil;
    end;
  end;
end;

procedure TfrmClientes.Button1Click(Sender: TObject);
begin
  frmRetencionestercero:=TfrmRetencionestercero.Create(Nil);
  try
    if not frmRetencionestercero.BuscarCliente(dmClientes.tblClientesCODIGO_CTE.Value) then
    begin
      frmRetencionestercero.codCte := dmClientes.tblClientesCODIGO_CTE.Value;
      frmRetencionestercero.SpeedButton5Click(Self);
    end;
    frmRetencionestercero.Showmodal;
  finally
  frmRetencionestercero.Free;
  frmRetencionestercero:=Nil;
  end;
end;

procedure TfrmClientes.BitBtn15Click(Sender: TObject);
begin
  if dmClientes.tblDatosVehiculo.State = dsBrowse then
  begin
    dmClientes.tblDatosVehiculo.Insert;//41758
    dmClientes.tblDatosVehiculoCODIGO_CTE.Value:= dmClientes.tblClientesCODIGO_CTE.Value;
    dmClientes.tblDatosVehiculoFECHA_IN.Value  := Now;
    dmClientes.tblDatosVehiculoIN_POR.Value:= StrUserName;
    dmClientes.tblDatosVehiculoSTATUSCXC.Value:='R';
    DBEdit23.SetFocus;
    DBEdit23.Color:= clYellow;
  end;
end;

procedure TfrmClientes.BitBtn16Click(Sender: TObject);
begin
  dmClientes.tblDatosVehiculo.edit;
end;

procedure TfrmClientes.BitBtn17Click(Sender: TObject);
begin

  VerificaNumPol(dmClientes.tblDatosVehiculoNUM_CERTIFICADO.Value);

  if dmClientes.tblDatosVehiculo.state in [dsedit, dsinsert] then
  begin
    if (dmClientes.tblDatosVehiculoPOLIZA_ESPECIAL.Value = 1) and
       ((dmClientes.tblDatosVehiculoRUTA_FILEAUTH.IsNull) or
        (dmClientes.tblDatosVehiculoRUTA_FILEAUTH.Value = '')) then
    begin
      MessageDlg('Debe asignar documento de aprobación.',mtWarning,[mbok],0);
      exit;      
    end;
    if dmClientes.tblDatosVehiculoCODIGO_CTE.IsNull then
    begin
      dmClientes.tblDatosVehiculoCODIGO_CTE.Value:=  dmClientes.tblClientesCODIGO_CTE.Value;
      dmClientes.tblDatosVehiculoFECHA_IN.Value:= Now;
      dmClientes.tblDatosVehiculoIN_POR.Value:= StrUserName;
    end;
    if dmClientes.tblDatosVehiculo.state = dsinsert then
    begin
      dmClientes.tblDatosVehiculoNUMERO.Value:= FsqlMaxNumero('DatosVehiculo','numero');
      if dmClientes.tblDatosVehiculoNUMERO.IsNull or
      (dmClientes.tblDatosVehiculoNUMERO.Value = 0) then
      dmClientes.tblDatosVehiculoNUMERO.Value:=1;
    end;
    RxDBGrid1.Enabled:=True;
    Panel1.Enabled:=True;
    GlbSalvarQuery(dmClientes.tblDatosVehiculo);
  end;
end;

procedure TfrmClientes.BitBtn18Click(Sender: TObject);
begin
  dmClientes.qryTipoAfiliado.Close;
  dmClientes.qryTipoAfiliado.Open;

  if dmclientes.tblDatosVehiculo.State in [dsInsert, dsEdit] then Exit;

  dmClientes.tblDatosVehiculo.Close;
  dmClientes.tblDatosVehiculo.Params[0].Value:=dmclientes.tblClientesCODIGO_CTE.Value;
  dmClientes.tblDatosVehiculo.open;
  Panel1.Enabled:=True;
end;

procedure TfrmClientes.TabSheet2Enter(Sender: TObject);
begin
  //Panel1.Enabled:=False;
  if dmClientes.tblDatosVehiculo.state in [dsedit, dsinsert] then exit;
  
  dmClientes.tblDatosVehiculo.Close;
  dmClientes.tblDatosVehiculo.Params[0].Value:=dmclientes.tblClientesCODIGO_CTE.Value;
  dmClientes.tblDatosVehiculo.open;
  if dmClientes.tblDatosVehiculoNOTIFY_EMAIL.IsNull or (dmclientes.tblDatosVehiculoNOTIFY_EMAIL.Value = 0) then
  Label67.Visible:=false else Label67.Visible:=true;
  if dmClientes.tblDatosVehiculoNUM_CERTIFICADO.Value > 0 then
  ActivaBotonEliminar(dmClientes.tblDatosVehiculoNUM_CERTIFICADO.Value)
  else
  if dmClientes.tblDatosVehiculoNUMPOL.Value > 0 then
  ActivaBotonEliminar(dmClientes.tblDatosVehiculoNUM_CERTIFICADO.Value);
  if not  dmClientes.ibsqlDatosVehEliminado.fieldbyname('cant').IsNull then
  BitBtn53.Caption:='Recuperar ('+dmClientes.ibsqlDatosVehEliminado.fieldbyname('cant').AsString+')'
  else BitBtn53.Caption:='Recuperar';
end;

procedure TfrmClientes.Button2Click(Sender: TObject);
begin
  if GetAnyDate1.Execute then
  begin
    dmreportes.qryRepDatosCteVeh.Close;
    dmreportes.qryRepDatosCteVeh.Params[0].Value:= StrToInt( FormatDateTime('mm', GetAnyDate1.Fecha));
    dmreportes.qryRepDatosCteVeh.Params[1].Value:= StrToInt(FormatDateTime('mm', GetAnyDate1.FechaFinal));
    dmreportes.qryRepDatosCteVeh.Open;
    qckRepDatosVehClientes:=TqckRepDatosVehClientes.Create(Nil);
    try
      qckRepDatosVehClientes.Preview;
    finally
    qckRepDatosVehClientes.Free;
    qckRepDatosVehClientes:=Nil;
    end;
  end;
end;

procedure TfrmClientes.Button3Click(Sender: TObject);
begin
  if GetAnyDate1.Execute then
  begin
  dmreportes.qryRepDatosCteVeh.Close;
  dmreportes.qryRepDatosCteVeh.Params[0].Value:= StrToInt( FormatDateTime('mm', GetAnyDate1.Fecha));
  dmreportes.qryRepDatosCteVeh.Params[1].Value:= StrToInt(FormatDateTime('mm', GetAnyDate1.FechaFinal));
  dmreportes.qryRepDatosCteVeh.Open;
  qckRepDatosVehClientes:=TqckRepDatosVehClientes.Create(nil);
  try
    ReportExport(qckRepDatosVehClientes,GlbRutaInformes+'\ListaCteConSeguro.pdf');
    MessageDlg('Pdf Generado', mtInformation, [mbOk],0);
  finally
  qckRepDatosVehClientes.Free;
  qckRepDatosVehClientes:=Nil;
  end;
  end;
end;

procedure TfrmClientes.DBEdit23Exit(Sender: TObject);
begin
    DBEdit23.Color:=clWhite;
end;

procedure TfrmClientes.tabClientesExit(Sender: TObject);
begin
  if dmClientes.tblclientes.state in [dsEdit,dsInsert] then
  begin
    if (dmClientes.tblClientesNOMBRE_CTE.IsNull or
    dmClientes.tblClientesDIRECCION_CONT.IsNull) and (GlbActivaIFiscal = 0) then
    begin
      //t MessageDlg('Favor guardar datos generales del cliente.', mtWarning,[mbok],0);
      PageControl1.ActivePage:=tabClientes;
    end;
  end;// else
  //Panel1.Enabled:=False;
end;

procedure TfrmClientes.BitBtn19Click(Sender: TObject);
begin
  if dmClientes.tblDatosVehiculo.State In [dsEdit, dsInsert] then
  begin
    dmClientes.tblDatosVehiculo.Cancel;
    RxDBGrid1.Enabled:=True;
    Panel1.Enabled:=True;
  end;
end;

procedure TfrmClientes.Button4Click(Sender: TObject);
begin
//dmReportes.sqlScriptDatosCte.ExecStatement(0);
  dmReportes.qryDatosRepClientesCumple.Filtered := False;
  dmReportes.qryDatosRepClientesCumple.Close;
  if GetAnyDate1.Execute then
  begin
    qckRepClientesCumple:=TqckRepClientesCumple.Create(Nil);
    try
      dmReportes.qryDatosRepClientesCumple.Filtered := True;
      if (GetAnyDate1.Fecha = GetAnyDate1.FechaFinal) then
      begin
        dmReportes.rango:= False;
        dmReportes.mesCumple:= StrToInt(FormatDateTime('mm', GetAnyDate1.Fecha));
      end else
      begin
        dmReportes.rango:= True;
        dmReportes.mesCumpleIni:= StrToInt(FormatDateTime('mm', GetAnyDate1.Fecha));
        dmReportes.mesCumpleFin:= StrToInt(FormatDateTime('mm', GetAnyDate1.FechaFinal));
      end;
      dmReportes.qryDatosRepClientesCumple.Open;
      dmReportes.qryDatosRepClientesCumple.Filtered:=True;

      dmCompania.tblCompania.Close;
      dmCompania.tblCompania.Open;
      dmCompania.tblCompania.Locate('Codigo', GlbCia_Key,[]);
      qckRepClientesCumple.Preview;
    finally
    qckRepClientesCumple.Free;
    qckRepClientesCumple:=Nil;
    end;
  end;
end;

procedure TfrmClientes.DBEdit4Exit(Sender: TObject);
var
 tmp : string[13];
begin
  if (GlbActivaIFiscal = 1)  And (Length(dmClientes.tblClientesRNC_NUMERO.Value) > 0) then
  begin
    tmp:= StringReplace(dmClientes.tblClientesRNC_NUMERO.Value,'-','',[rfReplaceAll]);
    if (Length(tmp) <> 9) and
       (Length(tmp) <> 11) then
    begin
      Messagedlg('Favor indicar número cédula o Rnc correcto.',mtInformation,[mbok],0);
      dmClientes.tblClientesRNC_NUMERO.AsVariant:= null;
      dbedit4.SetFocus;
      Exit;
    end;
  end;
  if (dmClientes.tblClientesCODIGO_CTE.Value > 0) And (Length(dmClientes.tblClientesRNC_NUMERO.Value) > 0) then
  begin
    tmp:= StringReplace(dmClientes.tblClientesRNC_NUMERO.Value,'-','',[rfReplaceAll]);
    if (Length(tmp) = 11) then
    begin
      if Not (DocumentoValido(dcCedula,tmp)) then
      begin
        if dmClientes.tblClientes.State in [dsEdit, dsInsert] then
        begin
          Messagedlg('Numero Documento es inválido, verifique.',mtInformation,[mbok],0);
          dmClientes.tblClientesRNC_NUMERO.AsVariant:= null;
          dbedit4.SetFocus;
        end;
        Exit;
      end;
    end else
    begin
      if Not (DocumentoValido(dcRNC,tmp)) then
        if dmClientes.tblClientes.State in [dsEdit, dsInsert] then
        begin
          Messagedlg('Favor indicar #RNC que sea válido.',mtInformation,[mbok],0);
          dmClientes.tblClientesRNC_NUMERO.AsVariant:= null;
          dbedit4.SetFocus;
        end;
        Exit;
    end;
  end;
  //MessageDlg(valida_cedula(dmClientes.tblClientesRNC_NUMERO.Value),mtInformation,[mbok],0);
end;

procedure TfrmClientes.DBEdit2Exit(Sender: TObject);
begin
  if dmClientes.tblClientes.State = dsInsert then
  begin
    dmclientes.tblClientesNOMBRE_FACTURAR.Value :=
    dmclientes.tblClientesNOMBRE_CTE.Value;
  end;
end;

procedure TfrmClientes.FormShow(Sender: TObject);
begin
  if (GlBCuadros = 1) then
  begin
    DBComboBox2.Visible:= True;
    Label70.Visible := True;
  end;
  if showing  And (dmclientes.tblClientes.State = dsInsert) then
  DBEdit2.SetFocus;
end;

procedure TfrmClientes.BitBtn26Click(Sender: TObject);
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
        dmClientes.tblClientes.DisableControls;
        dmClientes.tblClientes.Tag := -1;
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
          DBEdit4Exit(Self);
          if Length(dmClientes.tblClientesNOMBRE_FACTURAR.Value) = 0 then
          dmClientes.tblClientes.Cancel
          else 
          GlbSalvarQuery(dmClientes.tblClientes);
        end;
        dmClientes.tblClientes.EnableControls;
        dmClientes.tblClientes.Tag := 0;
      end;
    end;
  finally
  frmBuscarRNC.Free;
  frmBuscarRNC:=Nil;
  end;
end;

procedure TfrmClientes.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if rncRequerido then
  begin
    if dmclientes.tblClientesRNC_NUMERO.IsNull then
    begin
      Messagedlg('RNC/Cedula es requerido, verifique',mtWarning,[mbok],0);
      DBEdit4.SetFocus;
      CanClose:=False;
    end else
    begin
      CanClose:=True;
      rncRequerido:=False;
    end;
  end;
end;

procedure TfrmClientes.ReporteXVendedor1Click(Sender: TObject);
begin
  frmSelRepXVendedor:=TfrmSelRepXVendedor.Create(nil);
  try
    dmreportes.tipRptCte:=1;
    frmSelRepXVendedor.ShowModal;
  finally
  frmSelRepXVendedor.free;
  frmSelRepXVendedor:=nil;
  end;
end;

procedure TfrmClientes.ReporteCliente1Click(Sender: TObject);
begin
  dmReportes.qryDatosRepClientes.Filtered:=False;
  dmReportes.qryDatosRepClientes.Close;
  dmReportes.qryDatosRepClientes.SQL.Text:=
  dmReportes.qryDatosRepClientesBase.SQL.Text;

  dmReportes.qryDatosRepClientes.SQL.Add('ORDER by C.TIPO_CLIENTE, C.RUTA, c.CODZONA');
  dmReportes.qryDatosRepClientes.Open;
  dmCompania.tblCompania.Close;
  dmCompania.tblCompania.Open;
  dmCompania.tblCompania.Locate('codigo', glbCia_Key,[]);
  qckRepClientes:=TQckRepClientes.Create(Nil);
  try
    if Messagedlg('Imprimir?', mtInformation,[mbYes, mbNo],0) = mrYes then
    begin
      qckRepClientes.Printersetup;
      qckRepClientes.Print;
    end else qckRepClientes.Preview;
  finally
  qckRepClientes.Free;
  qckRepClientes:=Nil;
  end;
end;

procedure TfrmClientes.ReporteXCiudad1Click(Sender: TObject);
begin
//dmReportes.sqlScriptDatosCte.ExecStatement(0);
  frmSelRepXVendedor:=TfrmSelRepXVendedor.Create(nil);
  try
    dmreportes.codCiudad:=0;
    frmSelRepXVendedor.ShowModal;
  finally
  frmSelRepXVendedor.free;
  frmSelRepXVendedor:=nil;
  end;
end;

procedure TfrmClientes.BitBtn20Click(Sender: TObject);
begin
  frmSectores :=TfrmSectores.Create(nil);
  try
    frmSectores.ShowModal;
  finally
  frmSectores.free;
  frmSectores:=nil;
  end;
end;

procedure TfrmClientes.XRutaVenta1Click(Sender: TObject);
begin
  frmSelRepXRuta:=TfrmSelRepXRuta.Create(Nil);
  try
    dmreportes.tipRptCte:=3;
    frmSelRepXRuta.ShowModal;
  finally
  frmSelRepXRuta.free;
  frmSelRepXRuta:=nil;
  end;
end;

procedure TfrmClientes.BitBtn27Click(Sender: TObject);
begin
  frmCiudades:=TfrmCiudades.Create(Nil);
  try
    frmCiudades.Showmodal;
  finally
  frmCiudades.Free;
  frmCiudades:= Nil;
  end;
end;

procedure TfrmClientes.ExportarXLS1Click(Sender: TObject);
begin
  if (Not DirectoryExists('Informes')) then
  CreateDir('Informes');
  dmReportes.qryDatosRepClientes.Filtered:=False;
  dmReportes.qryDatosRepClientes.Close;

//dmReportes.qryDatosRepClientes.SQL.Text:=dmReportes.sqlScriptDatosCte.SQLActual;
  dmReportes.qryDatosRepClientes.Open;
  dmCompania.tblCompania.Close;
  dmCompania.tblCompania.Open;
  dmCompania.tblCompania.Locate('codigo',glbCia_Key,[]);
  GLBMostrarArchivo:=True;
  ExporToExcel(dmReportes.qryDatosRepClientes, ExtractFilePath(Application.ExeName)+
  'Informes\RelacionClientes'+
  FormatDateTime('ddmmyyyy',now)+'_'
  +FormatDateTime('hhmmss',now),false);
  GLBMostrarArchivo:=False;
end;

procedure TfrmClientes.BitBtn28Click(Sender: TObject);
begin
  frmRutasVentas:=TfrmRutasVentas.Create(nil);
  try
    frmRutasVentas.Showmodal;
  finally
  frmRutasVentas.free;
  frmRutasVentas:=nil;
  end;
end;

procedure TfrmClientes.DBEdit6Exit(Sender: TObject);
begin
  if (dmClientes.tblclientesLIMITE_CREDITO.Value > 0) then
  begin
    if (dmClientes.tblClientesCIUDAD.IsNull)
       or (dmClientes.tblClientesCIUDAD.Value = '') then
    begin
      Messagedlg('Favor indicar datos generales del cliente.(Ciudad)', mtWarning,[mbok],0);
      DBEdit14.SetFocus;
    end;
    if (dmClientes.tblClientesTELEF_CONTACTO.IsNull)
       or (dmClientes.tblClientesTELEF_CONTACTO.Value = '') then
    begin
      Messagedlg('Favor indicar datos generales del cliente.(Telefono)', mtWarning,[mbok],0);
      DBEdit8.SetFocus;
    end;
        if (dmClientes.tblClientesDIRECCION_CONT.IsNull)
       or (dmClientes.tblClientesDIRECCION_CONT.Value = '') then
    begin
      Messagedlg('Favor indicar datos generales del cliente.(Direccion)', mtWarning,[mbok],0);
      DBEdit7.SetFocus;
    end;
  end;
end;

procedure TfrmClientes.BitBtn29Click(Sender: TObject);
begin
  if dmClientes.tblClientes.State = dsBrowse then
  begin
    dmClientes.tblClientes.Edit;
    dmClientes.tblClientesTIPO_CF.AsVariant:=null;
    btnSalvarClick(Self);
  end else
  if dmClientes.tblClientes.State in [dsEdit, dsInsert] then
  begin
    dmClientes.tblClientesTIPO_CF.AsVariant:=null;
    btnSalvarClick(Self);
  end;
end;

procedure TfrmClientes.Todos1Click(Sender: TObject);
begin
  dmClientes.tblclientes.Filtered:=False;
  RxLabel1.Visible := False;
end;

procedure TfrmClientes.FiltrarSinVendedor1Click(Sender: TObject);
begin
  dmClientes.tblclientes.Filtered:=True;
  RxLabel1.Visible := dmClientes.tblclientes.Filtered;
end;

procedure TfrmClientes.ClientesSinVentas1Click(Sender: TObject);
begin
  dmreportes.xCantDiasSinVenta := 1;
//dmReportes.sqlScriptDatosCte.ExecStatement(0);
  dmReportes.qryDatosRepClientes.Filtered:=False;
  dmReportes.qryDatosRepClientes.Close;
   dmReportes.qryDatosRepClientes.SQL.Text:=
  dmReportes.qryDatosRepClientesBase.SQL.Text;

  dmReportes.qryDatosRepClientes.SQL.Add('ORDER by C.TIPO_CLIENTE, C.RUTA, c.CODZONA');
  dmReportes.qryDatosRepClientes.Open;
  dmReportes.qryDatosRepClientes.Filtered:=True;
  dmCompania.tblCompania.Close;
  dmCompania.tblCompania.Open;
  dmCompania.tblCompania.Locate('codigo',glbCia_Key,[]);
  qckRepClientes:=TqckRepClientes.Create(Nil);
  try
    qckRepClientes.QRDBText12.enabled:=False;
    qckRepClientes.QRLabel1.Caption:='Dias Sin Vta';
    qckRepClientes.QRDBText14.Enabled:=True;
    qckRepClientes.QRLabel12.Caption:='ALERTA Clientes con '+IntToStr(GlbDiasSinVenta)+' días o mas sin VENTAS';
    if Messagedlg('Imprimir?',mtInformation,[mbYes,mbNo],0 )= mrYes then
    begin
      qckRepClientes.PrinterSetUp;
      qckRepClientes.Print;
    end else qckRepClientes.Preview;
  finally
  qckRepClientes.Free;
  qckRepClientes:=Nil;
  end;
  dmreportes.xCantDiasSinVenta:= -1;
end;

procedure TfrmClientes.XCalle1Click(Sender: TObject);
begin
  frmListadoClientesDireccion:=TfrmListadoClientesDireccion.Create(nil);
  try
    dmReportes.qryDatosRepClientes.Filtered:=False;
    dmReportes.qryDatosRepClientes.Close;
    dmReportes.qryDatosRepClientes.SQL.Text:=
    dmReportes.qryDatosRepClientesBase.SQL.Text;

    dmReportes.qryDatosRepClientes.SQL.Add('ORDER by C.TIPO_CLIENTE, C.RUTA, c.calle, c.manzana, c.edificio');
    dmReportes.qryDatosRepClientes.Open;
    dmCompania.tblCompania.Close;
    dmCompania.tblCompania.Open;
    dmCompania.tblCompania.Locate('codigo', glbCia_Key,[]);
    qckRepClientesXDirCalleMEdif:=TqckRepClientesXDirCalleMEdif.Create(Nil);
    try
      if Messagedlg('Imprimir?', mtInformation,[mbYes, mbNo],0) = mrYes then
      begin
        qckRepClientesXDirCalleMEdif.PrinterSetUp;
        qckRepClientesXDirCalleMEdif.Print;
      end else qckRepClientesXDirCalleMEdif.Preview;
    finally
    qckRepClientesXDirCalleMEdif.Free;
    qckRepClientesXDirCalleMEdif:= Nil;
    end;
  except
  FreeAndNil(frmListadoClientesDireccion);
  end;
end;

procedure TfrmClientes.BitBtn30Click(Sender: TObject);
begin
  frmTipoCliente:=TfrmTipoCliente.Create(nil);
  try
    frmTipoCliente.Showmodal;
  finally
  frmTipoCliente.free;
  frmTipoCliente:=nil;
  end;
end;

procedure TfrmClientes.RxDBLookupCombo7Change(Sender: TObject);
begin
  if dmClientes.tblClientes.State in [dsEdit, dsInsert] then
  dmClientes.tblClientesCIUDAD.Value:= dmClientes.tblCiudadesDESCRIPCION.Value;
end;

procedure TfrmClientes.Certificado1Click(Sender: TObject);
begin
  frmConsultaCertificados:=TfrmConsultaCertificados.Create(nil);
  try
    if not dmClientes.tblClientesCODIGO_CTE.IsNull then
    begin
      frmConsultaCertificados.edtCodCte.SetInteger(dmClientes.tblClientesCODIGO_CTE.Value);
      frmConsultaCertificados.RadioGroup1.ItemIndex:=0;
    end;
    frmConsultaCertificados.ShowModal;
  finally
  frmConsultaCertificados.free;
  frmConsultaCertificados:=nil;
  end;
end;

procedure TfrmClientes.BitBtn31Click(Sender: TObject);
begin
  frmDealers:=TfrmDealers.Create(nil);
  try
    frmDealers.ShowModal;
  finally
  frmDealers.free;
  frmDealers:=nil;
  end;
  dmClientes.qryDearler.Close;
  dmClientes.qryDearler.Open;
end;

procedure TfrmClientes.BitBtn32Click(Sender: TObject);
begin
  frmAgencias:=TfrmAgencias.Create(nil);
  try
    frmAgencias.ShowModal;
  finally
  frmAgencias.free;
  frmAgencias:=nil;
  end;
end;

procedure TfrmClientes.BitBtn33Click(Sender: TObject);
begin
  if (GlbCartaPresenta <> '') then
  begin
    if Not FileExists(GlbCartaPresenta) then
    MessageDlg('Carta Presentación no existe, verifique.' + '#13#10' + GlbCartaPresenta,mtwarning,[mbok],0);
  end;
  if dmClientes.tblDatosVehiculo.State in [dsEdit, dsInsert] then exit;
  Certificado1Click(Self);
end;

procedure TfrmClientes.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
  begin
    CheckBox1.Color:=clGreen;
    dmClientes.tblDatosVehiculo.Filtered:=True;
  end else
  begin
    CheckBox1.Color:=clBtnFace;
    dmClientes.tblDatosVehiculo.Filtered:=False;
  end;
end;

procedure TfrmClientes.CumpleaosClientes1Click(Sender: TObject);
var
  sqlText: String;
begin
  dmCompania.tblCompania.close;
  dmCompania.tblCompania.open;
  dmclientes.qryRepCumpleanioCte.Close;

  //sqlText:= dmclientes.qryRepCumpleanioCte.SQL.Text;
  //dmclientes.qryRepCumpleanioCte.SQL.Clear;
  //dmclientes.qryRepCumpleanioCte.SQL.Add(
  //'select CODIGO, FECHA_NACIMIENTO, APELLIDO, DIRECCION_LOCAL, EMAIL, NOMBRE, TELEFONO_LOCAL from CLIENTES');
  //dmclientes.qryRepCumpleanioCte.SQL.Add('ORDER BY Fecha_Nacimiento');
  GetAnyDate1.Fecha:=now;
  GetAnyDate1.FechaFinal:=now;
  if GetAnyDate1.Execute then
  begin
    dmclientes.qryRepCumpleanioCte.params[0].Value:= MonthOf(GetAnyDate1.Fecha);
    dmclientes.qryRepCumpleanioCte.params[1].Value:= MonthOf(GetAnyDate1.FechaFinal);

    dmclientes.qryRepCumpleanioCte.Open;
    qckListadoCumpleAnio:=TqckListadoCumpleAnio.Create(Nil);
    try
      if MessageDlg('Imprimir?',mtInformation, [mbYes, mbNo], 0)= mrOk then
    begin
      qckListadoCumpleAnio.PrinterSetup;
      qckListadoCumpleAnio.Print;
    end else
    qckListadoCumpleAnio.Preview;
    finally
    qckListadoCumpleAnio.free;
    qckListadoCumpleAnio:=nil;
    end;
  end;
  //dmclientes.qryRepCumpleanioCte.close;
  //dmclientes.qryRepCumpleanioCte.SQL.Text:=sqlText; 
end;

procedure TfrmClientes.ExportarXLSCtesTaller1Click(Sender: TObject);
begin
  if (Not DirectoryExists('Informes')) then
  CreateDir('Informes');
  dmClientes.qryCteExp.Close;
  dmClientes.qryCteExp.Open;
  dmClientes.qryCteExp.First;
  GLBMostrarArchivo:=True;
  if dmClientes.qryCteExp.recordcount > 0 then
  begin
  ExporToExcel(dmClientes.qryCteExp, ExtractFilePath(Application.ExeName)+
  'Informes\RelacionClientesTaller'+
  FormatDateTime('ddmmyyyy',now)+'_'
  +FormatDateTime('hhmmss',now),false);
  GLBMostrarArchivo:=False;
  MessageDlg('Archivo de clientes exportado a excel:'#13#10' '+GlbNombreArchivo, mtInformation,[mbok], 0);
  end else
  MessageDlg('No existe datos para exportar, verifique.', mtInformation,[mbok], 0);
end;

procedure TfrmClientes.BitBtn25Click(Sender: TObject);
begin
  frmReportesPoliza:=TfrmReportesPoliza.Create(nil);
  try
    frmReportesPoliza.showmodal;
  finally
  frmReportesPoliza.free;
  frmReportesPoliza:=nil;
  end;
end;

procedure TfrmClientes.BitBtn34Click(Sender: TObject);
begin
  if dmClientes.tblDatosVehiculo.State in [dsEdit, dsInsert] then exit;
  frmPolizasCxc:=TfrmPolizasCxc.Create(nil);
  try
    frmPolizasCxc.edtCodCte.SetInteger(dmClientes.tblDatosVehiculo.Params[0].Value);
    frmPolizasCxc.BitBtn3Click(Self);
    if frmPolizasCxc.ShowModal = mrOk then
    begin
      dmClientes.tblClientes.DisableControls;
      dmClientes.tblClientes.Tag := -1;

      if dmClientes.tblClientes.Locate('codigo_cte', frmPolizasCxc.qryDatosVehiculosCODIGO_CTE.Value,[]) then
      begin
        dmClientes.tblDatosVehiculo.Close;
        dmClientes.tblDatosVehiculo.Params[0].Value:=frmPolizasCxc.qryDatosVehiculosCODIGO_CTE.Value;
        dmClientes.tblDatosVehiculo.open;

  case frmPolizasCxc.RadioGroup1.ItemIndex of
  0: begin
       dmClientes.tblDatosVehiculo.Locate('CODIGO_CTE',frmPolizasCxc.edtCodCte.ValueInteger,[]);
     end;
  1: begin
       dmClientes.tblDatosVehiculo.Locate('CODIGO_AGENCIA',frmPolizasCxc.edtCodigoAgencia.ValueInteger,[]);
     end;
  2: begin
       dmClientes.tblDatosVehiculo.Locate('CODIGO_DEALER',frmPolizasCxc.edtCodigoDealer.ValueInteger,[]);
     end;
  3: begin
       dmClientes.tblDatosVehiculo.Locate('NUMPOL',frmPolizasCxc.edtNumPoliza.ValueInteger,[]);
     end;
  4: begin
       //
     end;

  end;

      end else
      MessageDlg('Cliente no encontrado verifique codigo.', mtInformation, [mbOK], 0);
    end;
  finally
  FreeAndNil(frmPolizasCxc);
  end;
  dmClientes.tblClientes.EnableControls;
  dmClientes.tblClientes.Tag := 0;
  if not  dmClientes.ibsqlDatosVehEliminado.fieldbyname('cant').IsNull then
  BitBtn53.Caption:='Recuperar ('+dmClientes.ibsqlDatosVehEliminado.fieldbyname('cant').AsString+')'
  else BitBtn53.Caption:='Recuperar';  
end;

procedure TfrmClientes.BitBtn35Click(Sender: TObject);
var
  selectedFile: string;
  dlg: TOpenDialog;
begin
  if dmClientes.tblDatosVehiculo.State = dsBrowse then Exit;
  selectedFile := '';
  dlg := TOpenDialog.Create(nil);
  try
    dlg.InitialDir := GlbRutaMisDocumentos;
    dlg.Filter := 'All files (*.*)|*.*|Doc|*.doc|PDF|*.pdf|Excel|*.xls*';
    dlg.FilterIndex := 2;
    
    if dlg.Execute() then
      selectedFile := dlg.FileName;
  finally
    dlg.Free;
  end;

  if (selectedFile <> '') then
  begin
    if (GlbReposDocs = '') then
    dmClientes.tblDatosVehiculoRUTA_FILEAUTH.Value:=selectedFile
    else
    begin
      if not DirectoryExists(ExtractFilePath(selectedFile)) then
      if not ForceDirectories(ExtractFilePath(selectedFile)) then
      begin
        MessageDlg('Directorio destino no existe, verifique.',mtError,[mbok],0);
        exit;
      end; 
      dmClientes.tblDatosVehiculoRUTA_FILEAUTH.Value:=
      GlbReposDocs+ExtractFileName(selectedFile);
      CopyFile(PAnsiChar(selectedFile),PAnsiChar(dmClientes.tblDatosVehiculoRUTA_FILEAUTH.Value),false);
      dmClientes.tblDatosVehiculoPOLIZA_ESPECIAL.Value:=1;
      if dmClientes.tblDatosVehiculo.State In [dsEdit] then
      GlbSalvarQuery(dmClientes.tblDatosVehiculo);
    end;
  end;
end;

procedure TfrmClientes.BitBtn36Click(Sender: TObject);
begin
  if (dmClientes.tblDatosVehiculoPOLIZA_ESPECIAL.Value = 0) or
  (dmClientes.tblDatosVehiculoPOLIZA_ESPECIAL.IsNull) then exit;
  if (FileExists(dmClientes.tblDatosVehiculoRUTA_FILEAUTH.Value)) then
    ShellExecute(0,'open',PChar(dmClientes.tblDatosVehiculoRUTA_FILEAUTH.Value), '','',SW_SHOWNORMAL)
  else MessageDlg('Documento no existe, favor cargar de nuevo.', mtinformation,[mbok],0);
end;

procedure TfrmClientes.DBRadioGroup1Click(Sender: TObject);
begin
  if dmClientes.tblDatosVehiculo.State In [dsEdit, dsInsert] then
  begin
    if (dmClientes.tblDatosVehiculoPOLIZA_ESPECIAL.Value = 0) or (DBRadioGroup1.ItemIndex = 1) or
       (dmClientes.tblDatosVehiculoPOLIZA_ESPECIAL.IsNull) then
    begin
      dmClientes.tblDatosVehiculoRUTA_FILEAUTH.AsVariant := null;
    end else
    if ((dmClientes.tblDatosVehiculoRUTA_FILEAUTH.IsNull) or
        (dmClientes.tblDatosVehiculoRUTA_FILEAUTH.Value = '')) And
    ((dmClientes.tblDatosVehiculoPOLIZA_ESPECIAL.Value = 1) or (DBRadioGroup1.ItemIndex = 0)) then
    begin
      BitBtn35Click(Self);
      if (dmClientes.tblDatosVehiculoRUTA_FILEAUTH.IsNull) Or
      (dmClientes.tblDatosVehiculoRUTA_FILEAUTH.Value = '') then
      begin
        MessageDlg('Es obligatorio cargar documento de autorización.',mtwarning,[mbok],0);
        dmClientes.tblDatosVehiculoPOLIZA_ESPECIAL.Value:=0;
        if dmClientes.tblDatosVehiculo.State In [dsEdit] then
        GlbSalvarQuery(dmClientes.tblDatosVehiculo);
      end else
      begin
        if FileExists(dmClientes.tblDatosVehiculoRUTA_FILEAUTH.Value) then
        begin
          if MessageDlg('Archivo ya fue cagado, desea reemplazarlo?',mtwarning,[mbyes, mbno],0) = mryes then
          BitBtn35Click(Self);
        end;
      end;
    end else
    begin
    end;
  end;
end;

procedure TfrmClientes.DBRadioGroup1Exit(Sender: TObject);
begin
 if (dmClientes.tblDatosVehiculoPOLIZA_ESPECIAL.Value = 1) then
 begin
   BitBtn35Click(Self);
 end;
end;

procedure TfrmClientes.BitBtn37Click(Sender: TObject);
begin
  BitBtn37.Enabled:=False;
  WinExec(PChar(GlbToolWisPro+Format(' /username=%s /userAutenticated=%s /accion=%s',
  [GlbUsuarioLogueado,'1','1'])), SW_SHOWNORMAL);
  BitBtn37.Enabled:=True;
end;

procedure TfrmClientes.InsertarClienteEnWisPro(Codigocte: integer);
begin
  try
    dmClientes.stpProcInsertClientWP.params[0].Value := null;
    dmClientes.stpProcInsertClientWP.params[1].Value := dmclientes.tblClientesCODIGO_CTE.Value;
    dmClientes.stpProcInsertClientWP.ExecProc;

    if not dmClientes.stpProcInsertClientWP.Transaction.InTransaction then
    dmClientes.stpProcInsertClientWP.Transaction.StartTransaction;
    try
      dmClientes.stpProcInsertClientWP.Transaction.CommitRetaining;
    except
    dmClientes.stpProcInsertClientWP.Transaction.RollbackRetaining;
    end;
  except
  end;
  //WinExec(PChar(GlbToolWisPro+Format(' /username=%s /userAutenticated=%s /accion=%s  /customid=%s',
  //[GlbUsuarioLogueado,'1','20',inttostr(codigocte)])), SW_SHOWNORMAL);
end;

procedure TfrmClientes.InsertarContratoWisPro(Codigocte: integer);
begin
  //se manega en el trigger CT_CLIENTWISPRO
end;

procedure TfrmClientes.BitBtn38Click(Sender: TObject);
begin
  frmContractosWisPro:=TfrmContractosWisPro.Create(Nil);
  try
    if dmClientes.tblClientesCODIGO_CTE.Value > 0 then
    begin
      if not dmClientes.tblContractWisPro.Locate('CODIGO_CTE',
      dmClientes.tblClientesCODIGO_CTE.Value,[]) then
      frmContractosWisPro.btnInsertarClick(Self);
    end;
    if dmclientes.tblContractWisPro.State in [dsBrowse] then
    dmClientes.tblContractWisPro.Locate('CODIGO_CTE',dmClientes.tblClientesCODIGO_CTE.Value,[]);
    frmContractosWisPro.ShowModal;
  finally
  frmContractosWisPro.Free;
  frmContractosWisPro:=Nil;
  end;
end;

procedure TfrmClientes.DuplicarCliente1Click(Sender: TObject);
begin
  dmClientes.ibsqlDupCliente.Params[0].Value:= dmclientes.tblClientesCODIGO_CTE.Value;
  dmClientes.ibsqlDupCliente.ExecQuery;
  try
    if not dmClientes.ibsqlDupCliente.Transaction.InTransaction then
    dmClientes.ibsqlDupCliente.Transaction.StartTransaction;
    dmClientes.ibsqlDupCliente.Transaction.CommitRetaining;
  except
  dmClientes.ibsqlDupCliente.Transaction.RollbackRetaining;
  end;
  dmClientes.tblclientes.Close;
  dmClientes.tblclientes.Filtered:=False;
  dmClientes.tblclientes.Open;
  dmClientes.tblclientes.Last;
  if Showing then
  DBEdit4.SetFocus;
end;

procedure TfrmClientes.BitBtn39Click(Sender: TObject);
begin
  frmCambiarCtePoliza:=TfrmCambiarCtePoliza.Create(nil);
  try
    if frmCambiarCtePoliza.ShowModal = mrOk then
    begin
      if not frmCambiarCtePoliza.rxClientecodigo.IsNull then
      begin
        if (frmCambiarCtePoliza.rxClientecodigo.Value > 0) then
        begin
          dmClientes.tblDatosVehiculo.Edit;
          dmClientes.tblDatosVehiculoCODIGO_CTE.Value:=
          frmCambiarCtePoliza.rxClientecodigo.Value;
          GlbSalvarQuery(dmClientes.tblDatosVehiculo);
          dmClientes.tblClientes.DisableControls;
          dmClientes.tblClientes.Tag := -1;
          dmclientes.tblClientes.Locate('CODIGO_CTE',frmCambiarCtePoliza.rxClientecodigo.Value,[]);
          dmClientes.tblClientes.EnableControls;
          dmClientes.tblClientes.Tag := 0;
        end;
      end;
    end;
  finally
  frmCambiarCtePoliza:=nil;
  frmCambiarCtePoliza.free;
  end;
end;

procedure TfrmClientes.BitBtn45Click(Sender: TObject);
begin
  if dmClientes.tblGarantiaMovil.state = dsBrowse then
  begin
    //Panel1.Enabled:=False;
    dmClientes.tblGarantiaMovil.Append;
    dmClientes.tblGarantiaMovilCODIGO_CLIENTE.Value:= dmclientes.tblClientesCODIGO_CTE.Value;
    dmClientes.tblGarantiaMovilCODIGO_DEALER.Value:= dmclientes.tblClientesCODIGO_AGENCIA.Value;
    dmClientes.tblGarantiaMovilFECHA.value:= ExtraerFecha(now);
    dmClientes.tblGarantiaMovilSTATUSCXC.Value:='R';
    dmClientes.tblGarantiaMovilCEDULA_PASSPORT.Value:= dmclientes.tblClientesCEDULA.Value;
    dmClientes.tblGarantiaMovilStatus.Value:='A';
  end;
end;

procedure TfrmClientes.BitBtn48Click(Sender: TObject);
begin
  if dmClientes.tblGarantiaMovil.state = dsBrowse then
  dmClientes.tblGarantiaMovil.Edit;
end;

procedure TfrmClientes.BitBtn51Click(Sender: TObject);
begin
  if dmClientes.tblGarantiaMovil.state = dsBrowse then
  begin
    dmClientes.tblGarantiaMovil.Edit;
    if (dmClientes.tblGarantiaMovilstatus.value = 'C') then
    dmClientes.tblGarantiaMovilstatus.value:='A'
    else
    dmClientes.tblGarantiaMovilstatus.value:='C';
  end else
  if dmClientes.tblGarantiaMovil.state in [dsEdit, dsInsert] then
  dmClientes.tblGarantiaMovil.Cancel;
end;

procedure TfrmClientes.BitBtn49Click(Sender: TObject);
begin
  if dmClientes.tblGarantiaMovil.state in [dsEdit, dsInsert] then
  GlbSalvarQuery(dmClientes.tblGarantiaMovil);
end;

procedure TfrmClientes.BitBtn50Click(Sender: TObject);
begin
  if dmClientes.tblGarantiaMovil.state in [dsBrowse] then
  begin
    dmClientes.tblGarantiaMovil.Close;
    dmClientes.tblGarantiaMovil.params[0].Value:= dmclientes.tblClientesCODIGO_CTE.Value;
    dmClientes.tblGarantiaMovil.Open;
  end;
end;

procedure TfrmClientes.TabSheet3Enter(Sender: TObject);
begin
  if dmClientes.qryDearler.state = dsInactive then
  dmClientes.qryDearler.Open;
  dmClientes.tblGarantiaMovil.Close;
  dmClientes.tblGarantiaMovil.params[0].Value:= dmclientes.tblClientesCODIGO_CTE.Value;
  dmClientes.tblGarantiaMovil.open;
  if dmClientes.tblGarantiaMovilNOTIFY_EMAIL.IsNull or (dmclientes.tblGarantiaMovilNOTIFY_EMAIL.Value = 0) then
  Label67.Visible:=false else Label67.Visible:=true;  
end;

procedure TfrmClientes.tabClientesEnter(Sender: TObject);
begin
  Panel1.Enabled:=True;
end;

procedure TfrmClientes.HistoricodeRenovaciones1Click(Sender: TObject);
begin
  RepHistoricoVeh(0);
end;

procedure TfrmClientes.RepHistoricoVeh(tipo:smallint);
begin
  dmclientes.qryProc_DatosRepHistRenovPol.close;
  if tipo = 0 then
  begin
    dmclientes.qryProc_DatosRepHistRenovPol.params[0].value:= dmClientes.tblclientescodigo_cte.Value;
    dmclientes.qryProc_DatosRepHistRenovPol.params[1].value:= dmClientes.tblclientescodigo_cte.Value;
  end else
  begin
    dmclientes.qryProc_DatosRepHistRenovPol.params[0].value:= 0;
    dmclientes.qryProc_DatosRepHistRenovPol.params[1].value:= 999999;
  end;
  dmclientes.qryProc_DatosRepHistRenovPol.open;
  GLBMostrarArchivo:=True;
  if tipo = 0 then
  ExporToExcel(dmclientes.qryProc_DatosRepHistRenovPol, ExtractFilePath(Application.ExeName)+
  'Informes\'+dmClientes.tblClientesNOMBRE_FACTURAR.Value+'_HistRenovGarantias'+
  FormatDateTime('ddmmyyyy',now),false)
  else
  ExporToExcel(dmclientes.qryProc_DatosRepHistRenovPol, ExtractFilePath(Application.ExeName)+
  'Informes\'+'Listado_HistoricoDeRenovDeGarantias'+
  FormatDateTime('ddmmyyyy',now),false);

  GLBMostrarArchivo:=False;
end;

procedure TfrmClientes.HistoricodeRenovacionesTodos1Click(Sender: TObject);
begin
  RepHistoricoVeh(1);
end;

procedure TfrmClientes.HistoricoRennovGarantias1Click(Sender: TObject);
begin
  RepHisotoricoGarantia(0);
end;

procedure TfrmClientes.RepHisotoricoGarantia(tipo:Smallint);
begin
  dmclientes.qryProcDatosRepHistRenoGarantia.close;
  if tipo = 0 then
  begin
    dmclientes.qryProcDatosRepHistRenoGarantia.params[0].value:= dmClientes.tblclientescodigo_cte.Value;
    dmclientes.qryProcDatosRepHistRenoGarantia.params[1].value:= dmClientes.tblclientescodigo_cte.Value;
  end else
  begin
    dmclientes.qryProcDatosRepHistRenoGarantia.params[0].value:= 0;
    dmclientes.qryProcDatosRepHistRenoGarantia.params[1].value:= 999999;
  end;
  dmclientes.qryProcDatosRepHistRenoGarantia.open;
  GLBMostrarArchivo:=True;
  if tipo = 0 then
  ExporToExcel(dmclientes.qryProcDatosRepHistRenoGarantia, ExtractFilePath(Application.ExeName)+
  'Informes\'+dmClientes.tblClientesNOMBRE_FACTURAR.Value+'_HistRenovGarantiasMovil'+
  FormatDateTime('ddmmyyyy',now),false)
  else
  ExporToExcel(dmclientes.qryProcDatosRepHistRenoGarantia, ExtractFilePath(Application.ExeName)+
  'Informes\'+'Listado_HistoricoDeRenovDeGarantiasMovil'+
  FormatDateTime('ddmmyyyy',now),false);

  GLBMostrarArchivo:=False;
end;

procedure TfrmClientes.HistoricoRenovGarantiasTodos1Click(Sender: TObject);
begin
  RepHisotoricoGarantia(1);
end;

procedure TfrmClientes.BitBtn46Click(Sender: TObject);
begin
  if (GlbCartaPresenta <> '') then
  begin
    if Not FileExists(GlbCartaPresenta) then
    MessageDlg('Carta Presentación no existe, verifique.' + '#13#10' + GlbCartaPresenta,mtwarning,[mbok],0);
  end;
  if dmClientes.tblGarantiaMovil.State in [dsEdit, dsInsert] then exit;
  frmConsultaCertificadosGMovil:=TfrmConsultaCertificadosGMovil.Create(nil);
  try
    //frmConsultaCertificados.
    if not dmClientes.tblClientesCODIGO_CTE.IsNull then
    begin
      frmConsultaCertificadosGMovil.edtCodCte.SetInteger(dmClientes.tblClientesCODIGO_CTE.Value);
      frmConsultaCertificadosGMovil.RadioGroup1.ItemIndex:=0;
    end;
    frmConsultaCertificadosGMovil.ShowModal;
  finally
  frmConsultaCertificadosGMovil.free;
  frmConsultaCertificadosGMovil:=nil;
  end;
end;

procedure TfrmClientes.BitBtn47Click(Sender: TObject);
var
  ccte : integer;
begin
  try
    frmConsultaGarantias:=TfrmConsultaGarantias.Create(nil);
    if frmConsultaGarantias.ShowModal = mrOk then
    begin
      if frmConsultaGarantias.AbrirDatos(ccte) then
      begin
        dmClientes.tblClientes.DisableControls;
        dmClientes.tblClientes.Tag := -1;

        if Not dmClientes.tblClientes.Locate('codigo_cte', ccte,[]) then
        MessageDlg('Cliente no encontrado, verifique codigo.', mtInformation, [mbOK], 0)
        else
        begin
          dmClientes.tblGarantiaMovil.Close;
          dmClientes.tblGarantiaMovil.params[0].Value:= dmclientes.tblClientesCODIGO_CTE.Value;
          dmClientes.tblGarantiaMovil.open;
          if dmClientes.tblGarantiaMovil.RecordCount = 0 then
          MessageDlg('Cliente no encontrado en Garantia Movil', mtInformation, [mbOK], 0);
        end;
        dmClientes.tblClientes.EnableControls;
        dmClientes.tblClientes.Tag := 0;
      end;
    end;
  finally
  frmConsultaGarantias.free;
  frmConsultaGarantias:=nil;
  end;
end;

procedure TfrmClientes.RxDBGrid3GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if  (dmClientes.tblDatosVehiculoNOTIFY_EMAIL.Value = 1) then
  begin
    AFont.Color:= clMaroon;  BackGround:= $00C8F9B0; Highlight:=True;
  end;
end;

procedure TfrmClientes.RxDBGrid4GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if  (dmClientes.tblGarantiaMovilNOTIFY_EMAIL.Value = 1) then
  begin
    aFont.Color:= clMaroon;  BackGround:= $00C8F9B0; Highlight:=True;
  end;
end;

procedure TfrmClientes.BitBtn21Click(Sender: TObject);
begin
  dtSource.DataSet.First;
  if dmClientes.tblDatosVehiculoNOTIFY_EMAIL.IsNull or (dmclientes.tblDatosVehiculoNOTIFY_EMAIL.Value = 0) then
  Label67.Visible:=false else Label67.Visible:=true;

  if dmClientes.tblDatosVehiculoNUM_CERTIFICADO.Value > 0 then
  ActivaBotonEliminar(dmClientes.tblDatosVehiculoNUM_CERTIFICADO.Value)
  else
  if dmClientes.tblDatosVehiculoNUMPOL.Value > 0 then
  ActivaBotonEliminar(dmClientes.tblDatosVehiculoNUM_CERTIFICADO.Value);
  if not  dmClientes.ibsqlDatosVehEliminado.fieldbyname('cant').IsNull then
  BitBtn53.Caption:='Recuperar ('+dmClientes.ibsqlDatosVehEliminado.fieldbyname('cant').AsString+')'
  else BitBtn53.Caption:='Recuperar';  

end;

procedure TfrmClientes.BitBtn22Click(Sender: TObject);
begin
    dtSource.DataSet.Prior;
  if dmClientes.tblDatosVehiculoNOTIFY_EMAIL.IsNull or (dmclientes.tblDatosVehiculoNOTIFY_EMAIL.Value = 0) then
  Label67.Visible:=false else Label67.Visible:=true;
  if dmClientes.tblDatosVehiculoNUM_CERTIFICADO.Value > 0 then
  ActivaBotonEliminar(dmClientes.tblDatosVehiculoNUM_CERTIFICADO.Value)
  else
  if dmClientes.tblDatosVehiculoNUMPOL.Value > 0 then
  ActivaBotonEliminar(dmClientes.tblDatosVehiculoNUM_CERTIFICADO.Value);
  if not  dmClientes.ibsqlDatosVehEliminado.fieldbyname('cant').IsNull then
  BitBtn53.Caption:='Recuperar ('+dmClientes.ibsqlDatosVehEliminado.fieldbyname('cant').AsString+')'
  else BitBtn53.Caption:='Recuperar';
end;

procedure TfrmClientes.BitBtn23Click(Sender: TObject);
begin
    dtSource.DataSet.Next;
  if dmClientes.tblDatosVehiculoNOTIFY_EMAIL.IsNull or (dmclientes.tblDatosVehiculoNOTIFY_EMAIL.Value = 0) then
  Label67.Visible:=false else Label67.Visible:=true;
  if dmClientes.tblDatosVehiculoNUM_CERTIFICADO.Value > 0 then
  ActivaBotonEliminar(dmClientes.tblDatosVehiculoNUM_CERTIFICADO.Value)
  else
  if dmClientes.tblDatosVehiculoNUMPOL.Value > 0 then
  ActivaBotonEliminar(dmClientes.tblDatosVehiculoNUM_CERTIFICADO.Value);
  if not  dmClientes.ibsqlDatosVehEliminado.fieldbyname('cant').IsNull then
  BitBtn53.Caption:='Recuperar ('+dmClientes.ibsqlDatosVehEliminado.fieldbyname('cant').AsString+')'
  else BitBtn53.Caption:='Recuperar';
end;

procedure TfrmClientes.BitBtn24Click(Sender: TObject);
begin
  dtSource.DataSet.Last;
  if dmClientes.tblDatosVehiculoNOTIFY_EMAIL.IsNull or (dmclientes.tblDatosVehiculoNOTIFY_EMAIL.Value = 0) then
  Label67.Visible:=false else Label67.Visible:=true;
  if dmClientes.tblDatosVehiculoNUM_CERTIFICADO.Value > 0 then
  ActivaBotonEliminar(dmClientes.tblDatosVehiculoNUM_CERTIFICADO.Value)
  else
  if dmClientes.tblDatosVehiculoNUMPOL.Value > 0 then
  ActivaBotonEliminar(dmClientes.tblDatosVehiculoNUM_CERTIFICADO.Value);
  if not  dmClientes.ibsqlDatosVehEliminado.fieldbyname('cant').IsNull then
  BitBtn53.Caption:='Recuperar ('+dmClientes.ibsqlDatosVehEliminado.fieldbyname('cant').AsString+')'
  else BitBtn53.Caption:='Recuperar';
end;

procedure TfrmClientes.BitBtn40Click(Sender: TObject);
begin
    dtSource.DataSet.first;
  if dmClientes.tblDatosVehiculoNOTIFY_EMAIL.IsNull or (dmclientes.tblDatosVehiculoNOTIFY_EMAIL.Value = 0) then
  Label67.Visible:=false else Label67.Visible:=true;
end;

procedure TfrmClientes.BitBtn41Click(Sender: TObject);
begin
  dtSource.DataSet.prior;
  if dmClientes.tblDatosVehiculoNOTIFY_EMAIL.IsNull or (dmclientes.tblDatosVehiculoNOTIFY_EMAIL.Value = 0) then
  Label67.Visible:=false else Label67.Visible:=true;
end;

procedure TfrmClientes.BitBtn42Click(Sender: TObject);
begin
  dtSource.DataSet.next;
  if dmClientes.tblDatosVehiculoNOTIFY_EMAIL.IsNull or (dmclientes.tblDatosVehiculoNOTIFY_EMAIL.Value = 0) then
  Label67.Visible:=false else Label67.Visible:=true;
end;

procedure TfrmClientes.BitBtn43Click(Sender: TObject);
begin
  dtSource.DataSet.Last;
  if dmClientes.tblDatosVehiculoNOTIFY_EMAIL.IsNull or (dmclientes.tblDatosVehiculoNOTIFY_EMAIL.Value = 0) then
  Label67.Visible:=false else Label67.Visible:=true;
end;

procedure TfrmClientes.BitBtn9Click(Sender: TObject);
begin
  dtSource.DataSet.first;
end;

procedure TfrmClientes.BitBtn10Click(Sender: TObject);
begin
  dtSource.DataSet.prior;
end;

procedure TfrmClientes.BitBtn11Click(Sender: TObject);
begin
  dtSource.DataSet.Next;
end;

procedure TfrmClientes.BitBtn12Click(Sender: TObject);
begin
  dtSource.DataSet.Last;
end;

procedure TfrmClientes.DBEdit31Exit(Sender: TObject);
begin
  if (dmClientes.tblDatosVehiculoNUM_CERTIFICADO.Value > 0) then
  VerificaNumPol(dmClientes.tblDatosVehiculoNUM_CERTIFICADO.Value);
end;

procedure TfrmClientes.VerificaNumPol(_numpol:integer);
begin
  if (dmClientes.tblDatosVehiculo.State in [dsInactive, dsBrowse, dsEdit])
  then exit;
  if (dmClientes.tblDatosVehiculoNUM_CERTIFICADO.Value = 0) or
  (dmClientes.tblDatosVehiculoNUM_CERTIFICADO.IsNull ) then
  exit;
  dmclientes.qryCheckNumpolExiste.Close;
  dmclientes.qryCheckNumpolExiste.Params[0].Value:=_numpol;
  dmclientes.qryCheckNumpolExiste.Open;
  if dmclientes.qryCheckNumpolExiste.RecordCount > 0 then
  begin
    MessageDlg('Número certificado existe, verifique.',mtError,[mbOk],0);
  end;
end;

procedure TfrmClientes.DBEdit33Exit(Sender: TObject);
begin
  if (dmClientes.tblDatosVehiculoNUM_CERTIFICADO.Value > 0) then
  VerificaNumPol(dmClientes.tblDatosVehiculoNUM_CERTIFICADO.Value);
end;

procedure TfrmClientes.BitBtn52Click(Sender: TObject);
begin
 if Messagedlg('¿Desea eliminar garantia?',mtWarning,[mbyes,mbno],0) = mryes then
 begin
   if dmClientes.tblDatosVehiculo.RecordCount > 1 then
   dmClientes.tblDatosVehiculo.Delete;
   GlbSalvarQuery(dmClientes.tblDatosVehiculo);
 end;
end;

procedure TfrmClientes.BitBtn53Click(Sender: TObject);
begin
  frmRecuperaGEliminada:=TfrmRecuperaGEliminada.Create(Nil);
  try
    frmRecuperaGEliminada.tblGarantiasEliminadas.Close;
    frmRecuperaGEliminada.tblGarantiasEliminadas.Params[0].Value:= dmClientes.tblClientesCODIGO_CTE.Value;
    frmRecuperaGEliminada.tblGarantiasEliminadas.Open;
    if frmRecuperaGEliminada.Showmodal = mrok then
    begin
      frmRecuperaGEliminada.ProcElimina(frmRecuperaGEliminada.tblGarantiasEliminadasNumero.Value);
      dmClientes.tblClientes.Prior;
      dmClientes.tblClientes.Next;
    end;
  finally
  frmRecuperaGEliminada.Free;
  frmRecuperaGEliminada:=Nil;
  end;
  if not  dmClientes.ibsqlDatosVehEliminado.fieldbyname('cant').IsNull then
  BitBtn53.Caption:='Recuperar ('+dmClientes.ibsqlDatosVehEliminado.fieldbyname('cant').AsString+')'
  else BitBtn53.Caption:='Recuperar';  
end;

procedure TfrmClientes.ActivaBotonEliminar(_numpol:integer);
begin
  dmclientes.qryCheckNumpolExiste.Close;
   dmclientes.qryCheckNumpolExiste.Params[0].Value:=_numpol;
   dmclientes.qryCheckNumpolExiste.Open;
   if dmclientes.qryCheckNumpolExiste.RecordCount > 1 then
   begin
     BitBtn52.Enabled:=True
   end else
   BitBtn52.Enabled:=false;
end;

procedure TfrmClientes.EliminarRecord1Click(Sender: TObject);
begin
  if Messagedlg('¿Desea eliminar garantia?',mtWarning,[mbyes,mbno],0) = mryes then
  begin
    dmClientes.tblDatosVehiculo.Delete;
    GlbSalvarQuery(dmClientes.tblDatosVehiculo);
  end;
end;

procedure TfrmClientes.btnDuplicadosClick(Sender: TObject);
begin
  dmClientes.tblDatosVehiculo.Locate('numero',dmclientes.qryNumPolDupNUMERO.Value,[]);
  dmclientes.qryNumPolDup.Next;
end;

procedure TfrmClientes.btnDuplicadosDblClick(Sender: TObject);
begin
  dmclientes.qryNumPolDup.first;
end;

end.
