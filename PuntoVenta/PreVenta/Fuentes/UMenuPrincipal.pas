unit UMenuPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  TLHelp32, IniFiles, Menus, RxCalc, WinSkinData, RXCtrls, StdCtrls, Buttons, ComCtrls,
  db, RXDBCtrl, Dialogs, jpeg, ExtCtrls, dbCtrls;

  const
  CM_RESTORE = WM_USER + $1000;

type
  TfrmMenuPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Actualizar1: TMenuItem;
    ransaccionesDiarias1: TMenuItem;
    Inventario1: TMenuItem;
    Configurar1: TMenuItem;
    Reportes1: TMenuItem;
    Resumen1: TMenuItem;
    VentaDiaria2: TMenuItem;
    PorArticulos1: TMenuItem;
    Salir1: TMenuItem;
    Configuracion1: TMenuItem;
    ipoInventario1: TMenuItem;
    Consulta1: TMenuItem;
    InventarioHistorico1: TMenuItem;
    HistoricoInventario1: TMenuItem;
    Ingresos1: TMenuItem;
    Clientes1: TMenuItem;
    StatusBar1: TStatusBar;
    Ayuda1: TMenuItem;
    Acercade1: TMenuItem;
    DebitosyCreditosaplicados1: TMenuItem;
    CrearUsuario1: TMenuItem;
    CambiarClaveUsuario1: TMenuItem;
    CerrarSesion1: TMenuItem;
    Empleados1: TMenuItem;
    Administrativo1: TMenuItem;
    VentaMesxDia1: TMenuItem;
    Mantenimiento1: TMenuItem;
    Cxc1: TMenuItem;
    VigenciaBlc1: TMenuItem;
    VentaxDia1: TMenuItem;
    ManualOnline1: TMenuItem;
    AparienciaVentanas1: TMenuItem;
    RxCalculator1: TRxCalculator;
    Utilitario1: TMenuItem;
    Calculadora1: TMenuItem;
    DesactivarApariencia1: TMenuItem;
    Panel1: TPanel;
    PageControl1: TPageControl;
    PopupActOpe: TPopupMenu;
    Despacho1: TMenuItem;
    PopupReporte: TPopupMenu;
    Inventario2: TMenuItem;
    Ventas1: TMenuItem;
    Precios1: TMenuItem;
    Rutas1: TMenuItem;
    CuadrexRuta1: TMenuItem;
    BalanceDespacho1: TMenuItem;
    CerrarDiaTrnDiaria1: TMenuItem;
    CuadreDiario1: TMenuItem;
    Registro1: TMenuItem;
    BalanceenRuta1: TMenuItem;
    BeneficioBruto1: TMenuItem;
    RegistroPedidos1: TMenuItem;
    PreciosProductos1: TMenuItem;
    PopupMiscelaneo: TPopupMenu;
    RegistroCostosCastos1: TMenuItem;
    PopupMenuNomina: TPopupMenu;
    VentaCajaxRuta1: TMenuItem;
    VentaCajaxRutaResumen1: TMenuItem;
    Proveedores1: TMenuItem;
    ProductosServicios1: TMenuItem;
    CentrodeCostos1: TMenuItem;
    ProcesarNmina1: TMenuItem;
    PrestamoEmpleados2: TMenuItem;
    Comisiones2: TMenuItem;
    CuadreConsolidado1: TMenuItem;
    ControlPosteo1: TMenuItem;
    Descuentos1: TMenuItem;
    Compaia1: TMenuItem;
    Image1: TImage;
    Promociones1: TMenuItem;
    PromocionesResumen1: TMenuItem;
    TabSheet3: TTabSheet;
    BitBtn1: TBitBtn;
    Itbis1: TMenuItem;
    RxLabel5: TRxLabel;
    RxLabel2: TRxLabel;
    RxLabel1: TRxLabel;
    NCF1: TMenuItem;
    Actualizar2: TMenuItem;
    ipoNCF1: TMenuItem;
    PopupMenuActCxp: TPopupMenu;
    PopupRepCxp: TPopupMenu;
    HistoricodeSecuenciaNCF1: TMenuItem;
    PopupMenu1: TPopupMenu;
    ConsultaCotizaciones1: TMenuItem;
    popUpctaxCxcRep: TPopupMenu;
    BalanceClientes1: TMenuItem;
    OrdernadoxCte1: TMenuItem;
    OrdenadoPorServicio1: TMenuItem;
    ReporteClienteServicio1: TMenuItem;
    Historico3: TMenuItem;
    Balance8: TMenuItem;
    EnviarEstadoCxcviaEmail1: TMenuItem;
    popupConsultaCtaCxc: TPopupMenu;
    Balance4: TMenuItem;
    Historico2: TMenuItem;
    BalanceCliente1: TMenuItem;
    EstadoCuenta1: TMenuItem;
    FacturasPendiente1: TMenuItem;
    popupCtaXcxc: TPopupMenu;
    Transacciones2: TMenuItem;
    Balance2: TMenuItem;
    Balance5: TMenuItem;
    CobrodeFacturas1: TMenuItem;
    Proveedores2: TMenuItem;
    Interes1: TMenuItem;
    ITBIS2: TMenuItem;
    PopupconsultaCXP: TPopupMenu;
    BalanceCxpProveedores1: TMenuItem;
    CobroCuotasFinanc1: TMenuItem;
    ransCxp1: TMenuItem;
    AtrasosCuotas1: TMenuItem;
    Detallado1: TMenuItem;
    ResumenxDia1: TMenuItem;
    PapelReporte1: TMenuItem;
    Image2: TImage;
    AvisoAtraso1: TMenuItem;
    ReportexTipoProd1: TMenuItem;
    EstadoCta1: TMenuItem;
    ClaveMaestra1: TMenuItem;
    IngCuentasxCobrar1: TMenuItem;
    EstadoCta2: TMenuItem;
    Labels1: TMenuItem;
    CobroMultiplesFacturas1: TMenuItem;
    BasedeDatos1: TMenuItem;
    NotaCredito1: TMenuItem;
    NotaDebito1: TMenuItem;
    ServiciosFijos1: TMenuItem;
    ServiciosVarios1: TMenuItem;
    SaldoxAntCxc1: TMenuItem;
    VenceInventario1: TMenuItem;
    SkinData1: TSkinData;
    SaldarFacturas1: TMenuItem;
    CerrarDiaTardio1: TMenuItem;
    Banco1: TMenuItem;
    FacturasPendiente2: TMenuItem;
    Balance1: TMenuItem;
    RelaciondeFacturas1: TMenuItem;
    Especial1: TMenuItem;
    Button1: TButton;
    CuadreCaja1: TMenuItem;
    CargoEmpleados1: TMenuItem;
    InventarioPrecioCompra1: TMenuItem;
    DespachoAlmacen1: TMenuItem;
    ClasificacinPrecio1: TMenuItem;
    DivisionInventario1: TMenuItem;
    InventarioxArea1: TMenuItem;
    UnidadesInv1: TMenuItem;
    Reparaciones1: TMenuItem;
    DistribucionCtasCnt1: TMenuItem;
    popContabilidad: TPopupMenu;
    ContabilizarVentas1: TMenuItem;
    DistcntAdicional1: TMenuItem;
    GrupoCnt1: TMenuItem;
    EditarPedido1: TMenuItem;
    VentaDiaria3: TMenuItem;
    popupOrdenCompra: TPopupMenu;
    CrearOrden1: TMenuItem;
    EscalaISR1: TMenuItem;
    InventarioSerie1: TMenuItem;
    MargenBeneficiosxProducto1: TMenuItem;
    BeneficioenVentas1: TMenuItem;
    Financiamientos1: TMenuItem;
    procedure Salir1Click(Sender: TObject);
    procedure ransaccionesDiarias1Click(Sender: TObject);
    procedure Inventario1Click(Sender: TObject);
    procedure ipoInventario1Click(Sender: TObject);
    procedure HistoricoInventario1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Ingresos1Click(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure Acercade1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DebitosyCreditosaplicados1Click(Sender: TObject);
    procedure CrearUsuario1Click(Sender: TObject);
    procedure CambiarClaveUsuario1Click(Sender: TObject);
    procedure CerrarSesion1Click(Sender: TObject);
    procedure Empleados1Click(Sender: TObject);
    procedure VentaMesxDia1Click(Sender: TObject);
    procedure VigenciaBlc1Click(Sender: TObject);
    procedure VentaxDia1Click(Sender: TObject);
    procedure ManualOnline1Click(Sender: TObject);
    procedure AparienciaVentanas1Click(Sender: TObject);
    procedure Calculadora1Click(Sender: TObject);
    procedure DesactivarApariencia1Click(Sender: TObject);
    procedure Despacho1Click(Sender: TObject);
    procedure Inventario2Click(Sender: TObject);
    procedure Ventas1Click(Sender: TObject);
    procedure Precios1Click(Sender: TObject);
    procedure Rutas1Click(Sender: TObject);
    procedure CuadrexRuta1Click(Sender: TObject);
    procedure BalanceDespacho1Click(Sender: TObject);
    procedure CerrarDiaTrnDiaria1Click(Sender: TObject);
    procedure CuadreDiario1Click(Sender: TObject);
    procedure Registro1Click(Sender: TObject);
    procedure BalanceenRuta1Click(Sender: TObject);
    procedure RegistroPedidos1Click(Sender: TObject);
    procedure PreciosProductos1Click(Sender: TObject);
    procedure VentaCajaxRuta1Click(Sender: TObject);
    procedure VentaCajaxRutaResumen1Click(Sender: TObject);
    procedure Proveedores1Click(Sender: TObject);
    procedure RegistroCostosCastos1Click(Sender: TObject);
    procedure ProductosServicios1Click(Sender: TObject);
    procedure CentrodeCostos1Click(Sender: TObject);
    procedure ControlPosteo1Click(Sender: TObject);
    procedure Compaia1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure ConsultaCotizaciones1Click(Sender: TObject);
    procedure Proveedores2Click(Sender: TObject);
    procedure ClaveMaestra1Click(Sender: TObject);
    procedure IngCuentasxCobrar1Click(Sender: TObject);
    procedure EstadoCta2Click(Sender: TObject);
    procedure Labels1Click(Sender: TObject);
    procedure CobroMultiplesFacturas1Click(Sender: TObject);
    procedure BasedeDatos1Click(Sender: TObject);
    procedure NotaCredito1Click(Sender: TObject);
    procedure NotaDebito1Click(Sender: TObject);
    procedure ServiciosFijos1Click(Sender: TObject);
    procedure ServiciosVarios1Click(Sender: TObject);
    procedure SaldoxAntCxc1Click(Sender: TObject);
    procedure VenceInventario1Click(Sender: TObject);
    procedure SaldarFacturas1Click(Sender: TObject);
    procedure CerrarDiaTardio1Click(Sender: TObject);
    procedure Banco1Click(Sender: TObject);
    procedure FacturasPendiente2Click(Sender: TObject);
    procedure Balance1Click(Sender: TObject);
    procedure RelaciondeFacturas1Click(Sender: TObject);
    procedure Especial1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CuadreCaja1Click(Sender: TObject);
    procedure CargoEmpleados1Click(Sender: TObject);
    procedure InventarioPrecioCompra1Click(Sender: TObject);
    procedure DespachoAlmacen1Click(Sender: TObject);
    procedure ClasificacinPrecio1Click(Sender: TObject);
    procedure DivisionInventario1Click(Sender: TObject);
    procedure InventarioxArea1Click(Sender: TObject);
    procedure SkinData1FormSkin(Sender: TObject; aName: String;
      var DoSkin: Boolean);
    procedure UnidadesInv1Click(Sender: TObject);
    procedure Reparaciones1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DistribucionCtasCnt1Click(Sender: TObject);
    procedure ContabilizarVentas1Click(Sender: TObject);
    procedure DistcntAdicional1Click(Sender: TObject);
    procedure GrupoCnt1Click(Sender: TObject);
    procedure VentaDiaria3Click(Sender: TObject);
    procedure CrearOrden1Click(Sender: TObject);
  private
    { Private declarations }
     procedure AppMessage(var Msg: TMsg; var Handled: Boolean);
     procedure HandleException(Sender: TObject; E: Exception);
     Procedure ShowHint(Sender: TObject);
    procedure ProcesarCierreDiaTrn;
    procedure ProcesoLogin;
    procedure ActivaPermisos;
    Function ProgramaAbiertoDosVeces:Boolean;
    procedure ImprimirRepItebis(tipo : smallint);
    Function ValidaRegistro(accion:smallint; coduser: Integer; usuario:string):Boolean;
    procedure logout;
  public
    { Public declarations }
    procedure ProcCerrarDia;
    //procedure ActivaPermiso(proceso:integer; iduser:Integer; isperson:integer);
  end;

var
  frmMenuPrincipal: TfrmMenuPrincipal;

implementation

uses UProcesarVentas, UInventarioProd, UTipoInventario,
  UInventarioHistorico, UCtrlIngresos, UMaestroClientes, UTransaccionesCxc,
  UAcercaDe, UDatModCompania, UDatModCxc, Uglobal,
  UBalanceCxcClientes, UDebitosycreditosaplicados, UEntradaDeUsuarios,
  UCambiarClaveUsuario, uLogin, UDatModUsuarios, UDatModConectar, UEmpleados,
  URepVentaDiaria, UFormSelFecha, UDatModReportes, URepVentaMesxDia,
  UDatosVentaXMes, URepVigenciaCxcCtes, URepResumenVentas,
  UProcesarDespacho, URepInventarioProd, UPreciosInventario, URutas,
  UCuadreVentaxRuta, UBalanceSalidaXRuta, URepCuadreDiario, URegistro, uglobalcp,
  UDatModCuadrexRuta, URepSalidaRuta,
  URepPrecio, UPrestamoEmpleados, URepVentaCajaXRuta,
  URepVentaCajaxRutaResumen, UFormComisiones, UFormProveedores,
  URegistrarTransOpeDiaria, UFormProductosServicios, UFormCentroDeCostos,
  UControlAct,
  UCompania, UProcVentaRapida, UFormNumCompFiscal,
  UFormCompFiscal, UFormHistSecNCF, UFormDatosCotiza, URecibosYCtaXCobrar,
  UFormInteres, URepItebis, UBalanceCxpProv, UDatModFactura,
  UCobroDeCuotasFinanc, UBuscarClientesPersonasP,
  UConfigRep,
  uSelSingleFechaOpc, UFormEntreClave, URegMiscelaneos, UDatModCxp,
  UCobrarFacturas, URegPedidoProv, UConectar,
  UTransNcNbDev, UFormTransCxcDbCr_r, UFactServicio, UFormServFijos,
  UFormServiciosFijos, UFormSaldAntCxc, UDatModInventario,
  URepVencimientoProd, UProdVencidos, UPagarCXPFacturas,
  UBuscarProveedores, UDatModProveedor, URepEstadoCtaCxp, UProcCierreOfc,
  UCerrarHistoriocxc, UfrmBancos, uFrmConsultaFactPendCxp,
  UfrmRelacionFact, URepItebis_esp, UFormCaja, UFormTransCaja,
  UFormProcCuadreCaja, UCargosEmp, UFormTurno, URepInvProdCosto,
  USelInventario, UFormDespachoAlmacen, UFromDespachoInvAlmacen,
  UClasifPrecio, UDivisionInventario, URepInventarioProdArea,
  UFormUnidades, UCtrlEnvioaReparaciones, UDistCtaCnt,
  UContabilizarformBase, UContabilizarVentas, UFromContCtas, UGrupoCnt,
  UActivapermisos, {URegOrdenCompra,} UFormOrdenCompraR,
  UEscalaISR, URepInventarioProdSerie, URepInvMargenGananciaXProd,
  URepInvMargenGananciaXVenta, URepFinanciamientos;

{$R *.dfm}

procedure TfrmMenuPrincipal.Salir1Click(Sender: TObject);
var
  Ini: TIniFile;
  NombArchivo : String;
  x: integer;
begin
  NombArchivo := ExtractFilePath(Application.ExeName)+'\'+'repconf_cr.ini';
  Ini := TIniFile.Create(NombArchivo );
  try
    if (GlbCorriendoII = 0) then
    Ini.WriteInteger('Aplicacion', 'GlbCorriendo', 0);
  finally
  Ini.Free;
  end;

  //dmUsuarios.procMantRegDet.Params[0].Value:= //Permitido
  //dmUsuarios.procMantRegDet.Params[1].Value:= //Logueado
  dmUsuarios.procMantRegDet.Params[2].Value:= 0; //Accion
  dmUsuarios.procMantRegDet.Params[3].Value:= VarUsuarioGlb;//cod_usuario
  dmUsuarios.procMantRegDet.Params[4].Value:= StrUserName;//nombre_pc

  dmUsuarios.procMantRegDet.ExecProc;
  dmUsuarios.procMantRegDet.close;
  glbLogueado:= 0;
  logout;
  //dmConectar.IBDatabase1.CloseDataSets;
  //dmConectar.IBDatabase1.Close;
  Application.Terminate;
end;

procedure TfrmMenuPrincipal.ransaccionesDiarias1Click(Sender: TObject);
begin
  frmProcesarVentas:=TfrmProcesarVentas.Create(nil);
  try
    frmProcesarVentas.showmodal;
  finally
  frmProcesarVentas.free;
  frmProcesarVentas:=nil;
  end;
end;

procedure TfrmMenuPrincipal.Inventario1Click(Sender: TObject);
begin
  frmInventarioProd:=TfrmInventarioProd.Create(nil);
  try
    frmInventarioProd.Showmodal;
  finally
  frmInventarioProd.free;
  frmInventarioProd:=nil;
  end;
end;

procedure TfrmMenuPrincipal.ipoInventario1Click(Sender: TObject);
begin
  frmTipoInventario:=TfrmTipoInventario.Create(Nil);
  try
    frmTipoInventario.Showmodal;
  finally
  frmTipoInventario.Free;
  frmTipoInventario:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.HistoricoInventario1Click(Sender: TObject);
begin
  frmInventarioHist:=TfrmInventarioHist.Create(Nil);
  try
    frmInventarioHist.Showmodal;
  finally
  frmInventarioHist.Free;
  frmInventarioHist:=Nil;
  end;  
end;

procedure TfrmMenuPrincipal.AppMessage(var Msg: TMsg;
  var Handled: Boolean);
var
   actual: TWinControl;
begin
  if Msg.message = WM_KEYDOWN then
     if Msg.WParam = VK_RETURN then
        begin
          Actual := Screen.ActiveControl;
          if (actual is TButton) or (actual is TDBMemo) or (Actual is TRxDBGrid)
             or (actual is TMemo) then
             exit
          else
             Msg.wParam := VK_TAB;
        end;
end;

procedure TfrmMenuPrincipal.FormCreate(Sender: TObject);
var
  xGrafico : String;
  Ini: TIniFile;
  NombArchivo : String;
  x: integer;
begin
  GLBRUTADB := GetCommandParam('/GLBRUTADB');
  if (GLBRUTADB = '') then
  GLBRUTADB:='POSGOLDRESP';

  NombArchivo := ExtractFilePath(Application.ExeName)+'repconf_cr.ini';
  Ini := TIniFile.Create(NombArchivo );
  try
    GlbCorriendo := Ini.ReadInteger('Aplicacion', 'GlbCorriendo', 0);
  finally
  Ini.Free;
  end;

  Application.OnException := HandleException;
  GlbCorriendoII:=0;
  GlbDiaActualizado:=0;
  if (GlbCorriendo = 1) and (GlbPermiteUnaInstancia = 1) then
  begin
    GlbCorriendoII:=1;
    //Messagedlg('Existe una sesion de este programa, desea continuar', mtWarning ,[mbyes, mbNo],0);
    BitBtn1.Enabled:=False;

    Caption:='Existe otra instancia de este programa abierta, favor cerrar esta';
    //Application.Terminate;
  end;

  xGrafico:=FileToUse('Grafico','Logo.jpg');
  if (xGrafico <> '') then
  Image2.Picture.LoadFromFile(xGrafico);
  Application.OnMessage := AppMessage;
  Application.OnHint    := ShowHint;
    frmtrgtr:=Tfrmtrgtr.Create(Nil);
    frmtrgtr.tRegistro.Close;
    frmtrgtr.tRegistro.Open;
    if frmtrgtr.tRegistroMOD_FINANC.Value = 1 then
    GlbFinanciamiento:=True
    else GlbFinanciamiento:=False;

    if (Trim(StrUserName) <> 'DIVISON') then
    begin

      if frmtrgtr.tRegistroCLAVE.Value = 19702005 then //Primera Vez
      begin
        frmtrgtr.tRegistro.Edit;
        if frmtrgtr.tRegistroCANTCORRIDA.Value > 0 then
        frmtrgtr.tRegistroCANTCORRIDA.Value:=frmtrgtr.tRegistroCANTCORRIDA.Value - 1;
        //StatusBar3.Panels[0].Text := 'Run = '+frmtrgtr.tRegistroCANTCORRIDA.AsString;
        frmtrgtr.tRegistroSERIAL.Value:= GetVolumeID('c');
        frmtrgtr.tRegistroCLAVE.Value := 11111111;
        frmtrgtr.tRegistroFECHA_REGISTRO.Value:= Now;
        frmtrgtr.Button1click(Self);
      end else
      begin
        //ingorado de forma temporal hasta que arregle el control de clientes
        {t if frmtrgtr.tRegistroSERIAL.Value <>  GetVolumeID('c') then
        begin
          Messagedlg('Se ha verificado una Violacion de Licencia,'#13''+
          ' si este programa te es útil favor '#13'llamar a Ing. Juan Ramon Divison 809-813-1364 o nosivid@hotmail.com',mtError,[mbok],0);
          Beep;
          frmTrgtr.Free;
          frmTrgtr:=Nil;
          Application.Terminate;
        end else
        begin}
         {t ativa esto divison if frmtrgtr.tRegistroCANTCORRIDA.Value = 0 then
          begin
            Messagedlg('El tiempo de uso de este programa a vencido'#13''+
            ' favor ponerse en contacto con el Ing. Juan Ramon Divison 809-309-5001 o idesi@idesisa.com',mtError,[mbok],0);
            Beep;
            frmTrgtr.free;
            frmTrgtr:=Nil;
            Application.Terminate;
          end;}
          frmtrgtr.tRegistro.Edit;
          frmtrgtr.tRegistroCANTCORRIDA.Value:=frmtrgtr.tRegistroCANTCORRIDA.Value - 1; // + 100;
          frmtrgtr.Button1click(Self);
        //end;
      end;
    end;
    frmTrgtr.free;
    frmTrgtr:=nil;
  ProcesoLogin;
  ActivaPermisos;

  dmUsuarios.qryRoles.Close;
  dmUsuarios.qryRoles.Params[0].Value:= VarUsuarioGlb;
  //dmUsuarios.qryRoles.Open;
  //dmUsuarios.qryRolesID_ROL
  //dmUsuarios.qryRolesID_USUARIO
  if dmUsuarios.qryRoles.RecordCount > 0 then
  ActivaPermiso(TForm(frmMenuPrincipal), 1000,dmUsuarios.qryRolesID_ROL.Value, 0);//menu principal: 1000 debe estar en la tabla PROCESOS
  ActivaPermiso(TForm(frmMenuPrincipal), 1000, VarUsuarioGlb, 1);
end;

procedure TfrmMenuPrincipal.Ingresos1Click(Sender: TObject);
begin
  frmIngresos:=TfrmIngresos.Create(Nil);
  try
    frmIngresos.ShowModal;
  finally
  frmIngresos.Free;
  frmIngresos:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.Clientes1Click(Sender: TObject);
begin
  frmClientes:=TfrmClientes.Create(Nil);
  try
    dmUsuarios.qryRoles.Close;
    dmUsuarios.qryRoles.Params[0].Value:= VarUsuarioGlb;
    //dmUsuarios.qryRoles.Open; hay un conflicto con los permisos a roles y user
    
    if dmUsuarios.qryRoles.RecordCount > 0 then
    ActivaPermiso(TForm(frmClientes), 1003, dmUsuarios.qryRolesID_ROL.Value, 0);//menu principal: 1000 debe estar en la tabla PROCESOS
    ActivaPermiso(TForm(frmClientes), 1003, VarUsuarioGlb, 1);

    frmClientes.Showmodal;
  finally
  frmClientes.Free;
  frmClientes:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.ShowHint(Sender: TObject);
begin
  StatusBar1.Panels[0].Text := Application.Hint;
end;

procedure TfrmMenuPrincipal.Acercade1Click(Sender: TObject);
begin
 AboutBox := TAboutBox.Create(nil);
  Try
    aboutbox.showmodal;
  finally
  aboutbox.free;
  aboutbox:=nil;
  end;
end;

procedure TfrmMenuPrincipal.FormShow(Sender: TObject);
begin

  dmCompania.tblCompania.close;
  dmCompania.tblcompania.open;
  if VerificaCierreDia(17,1,1,ExtraerFecha(Now),GlbFechaTrnDiaria) then
  begin
    //If varTipousuario = 2 then //SUPERVISOR
    //begin
      if MessageDlg('Desea Cerrar Transacciones del dia '+FormatDateTime('dd-mmm-yyyy',GlbFechaTrnDiaria)+'?',mtWarning,[mbNo,mbYes],0)=mrYes then
      ProcesarCierreDiaTrn;
      if glbfechatrndiaria < Date then
      RxLabel5.Caption :='ATENCION: Ultimo dia cerrado es : '+FormatDatetime('dd/mmm/yyyy',glbfechatrndiaria)
      else RxLabel5.Caption:= FormatDatetime('dd/mmm/yyyy', glbfechatrndiaria);

    //end;
    //Transaccionescxc1Click(Self);
  end;
  frmConfReporte:=TfrmConfReporte.Create(Nil);
  try
    if Not FileExists('repconf_cr.ini') then
    begin
      frmConfReporte.ShowModal;
      frmConfReporte.DatosConfiguracion;
    end else
    frmConfReporte.DatosConfiguracion;
  finally
  frmConfReporte.Free;
  frmConfReporte:=Nil;
  end;
  if GlbFinanciamiento then
  CobroCuotasFinanc1.Visible:=True
  else
    CobroCuotasFinanc1.Visible:=False;
  BitBtn1Click(Self);
end;


procedure TfrmMenuPrincipal.ProcesarCierreDiaTrn;
var
  DiaTrn,
  DiaAct : Smallint;
  MesAct, MesTrn : Smallint;
begin
  DiaTrn:= StrToInt(FormatDateTime('dd', GlbFechaTrnDiaria));
  DiaAct:= StrToInt(FormatDateTime('dd', Date));
  MesAct:= StrToInt(FormatDateTime('mm', Date));
  MesTrn:= StrToInt(FormatDateTime('dd', GlbFechaTrnDiaria));
  if (Abs(DiaAct-Diatrn) <> 1) And (MesAct = MesTrn) then
  begin
    MessageDlg('Imposible cerrar dia '+FormatDateTime('dd-mmm-yyyy', GlbFechaTrnDiaria)+', verifique ',mtError, [mbOK], 0);
    Exit;
  end;

  dmcxc.qryBalanceCtes.Close;
  dmcxc.qryBalanceCtes.Filtered:=False;
  dmcxc.qryBalanceCtes.Open;
  frmVTrnDiaria:=TfrmVTrnDiaria.Create(Nil);
  try
    if StrToInt(FormatDateTime('dd',GlbFechaTrnDiaria)) = DiasEnElMes(StrToInt(FormatDateTime('yyyy',GlbFechaTrnDiaria)),
                                    StrToInt(FormatDateTime('mm',GlbFechaTrnDiaria))) then
    begin
      if MessageDlg('Es hora de cerrar el mes y el dia, desea cerrarlo ahora?', mtInformation,[mbyes,mbno,mbhelp],0)=mrYes then
      begin
        frmVTrnDiaria.CerrarMesBalanceCxc;
        if (GlbDiaActualizado = 0) then
        frmVTrnDiaria.ActualizaHistorico;
      end;
    end else
    frmVTrnDiaria.ActualizaHistorico;
  finally
  frmVTrnDiaria.Free;
  frmVTrnDiaria:=Nil;
  end;
  dmcxc.qryBalanceCtes.Close;
{
  dmcxP.qryBalanceProveedor .Close;
  dmcxP.qryBalanceProveedor.Filtered:=False;
  dmcxP.qryBalanceProveedor.Open;
  dmcxP.qryproveedor.Close;
  dmcxP.qryproveedor.Open;
  frmVTrnDiaria:=TfrmVTrnDiaria.Create(Nil);
  try
    if StrToInt(FormatDateTime('dd',GlbFechaTrnDiaria)) = DiasEnElMes(StrToInt(FormatDateTime('yyyy',GlbFechaTrnDiaria)),
                                       StrToInt(FormatDateTime('mm',GlbFechaTrnDiaria))) then
    begin
      if MessageDlg('Es hora de cerrar el mes y el dia, desea cerrarlo ahora?',mtInformation,[mbyes,mbno,mbhelp],0)=mrYes then
      frmVTrnDiaria.CerrarMesBalanceCxc;
    end else
    frmVTrnDiaria.ActualizaHistorico;
  finally
  frmVTrnDiaria.Free;
  frmVTrnDiaria:=Nil;
  end;
  dmcxp.qryBalanceProveedor.Close;
  }
end;

procedure TfrmMenuPrincipal.DebitosyCreditosaplicados1Click(
  Sender: TObject);
begin
  frmVerCreditosyDebitosAplicados :=TfrmVerCreditosyDebitosAplicados.Create(nil);
  try
    frmVerCreditosyDebitosAplicados.BuscarDatos(GlbFechaTrnDiaria,GlbFechaTrnDiaria);
    frmVerCreditosyDebitosAplicados.Label3.Caption:=FormatDatetime('dd-mmm-yyyy',GlbFechaTrnDiaria);
    frmVerCreditosyDebitosAplicados.Showmodal;
  finally
  frmVerCreditosyDebitosAplicados.Free;
  frmVerCreditosyDebitosAplicados:= Nil;
  end;
end;

procedure TfrmMenuPrincipal.CrearUsuario1Click(Sender: TObject);
begin
  frmEntradaUsuarios:=TfrmEntradaUsuarios.Create(Nil);
  try
    frmEntradaUsuarios.Showmodal;
  finally
  frmEntradaUsuarios.Free;
  frmEntradaUsuarios:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.CambiarClaveUsuario1Click(Sender: TObject);
begin
  frmCambiarClaveUsuario:=TfrmCambiarClaveUsuario.Create(Nil);
  try
    frmCambiarClaveUsuario.Showmodal;
  finally
  frmCambiarClaveUsuario.Free;
  frmCambiarClaveUsuario:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.ProcesoLogin;
begin
  frmLogin:=tfrmLogin.Create(Nil);
  Try
  if frmLogin.showmodal = mrCancel then
  begin
    logout;
     Application.Terminate;
  end
  else
  begin
    if (frmLogin.Edit1.Text = 'DIVISON') AND
       (frmLogin.Edit2.Text = '2005') then
    begin
      varTipousuario:=0;//Todos los permisos
      frmLogin.Edit2.Text:= Encriptar(Trim(frmLogin.edit2.Text), 2005);
      if dmUsuarios.qryUsuarios.Locate('codigo;Clave',vararrayof([frmLogin.edit1.Text,frmLogin.edit2.Text]),[]) then
      VarUsuarioGlb := dmUsuarios.qryUsuariosCODIGO_EMPLEADO.Value
      else VarUsuarioGlb:=0;
    end else
    begin
      frmLogin.Edit2.Text:= Encriptar(Trim(frmLogin.edit2.Text), 2005);
      //inicio
      //dmUsuarios.qryUsuarios.First;
      //While Not dmUsuarios.qryUsuarios.Eof do
      //begin
      //  frmLogin.Edit2.Text:= Desencriptar(Trim(dmUsuarios.qryUsuariosCLAVE.Value),2005);
      //  dmUsuarios.qryUsuariosNOMBRECOMPLETO.Value;
      //  dmUsuarios.qryUsuarios.Next;
      //end;
      //fin
      if not dmUsuarios.qryUsuarios.Locate('codigo;Clave',vararrayof([frmLogin.edit1.Text,frmLogin.edit2.Text]),[]) then
      begin

        Messagedlg('Usuario o Clave Incorrecta.¡Verifique Por Favor!',mtError,[mbOk],0);
        ProcesoLogin;
        //Application.Terminate;
      end else
      Begin

        GlbCodigoCia:=1;//Distribuidor Jugo Tropico
        if (not dmUsuarios.qryUsuariosARCHIVOCONFGWIN.IsNull) And
               (dmUsuarios.qryUsuariosARCHIVOCONFGWIN.Value <> '') then
        begin
          SkinData1.LoadFromFile(dmUsuarios.qryUsuariosARCHIVOCONFGWIN.Value);
        end;
        dmUsuarios.qryUsuarios.Edit;
        dmUsuarios.qryUsuariosFecha_Entrada.Value:=Now;
        dmUsuarios.qryUsuarios.Post;
        dmUsuarios.qryUsuarios.ApplyUpdates;
        if not dmUsuarios.qryUsuarios.Transaction.InTransaction then
        dmusuarios.qryUsuarios.Transaction.StartTransaction;
        try
          dmusuarios.qryUsuarios.Transaction.CommitRetaining;
        except
        dmusuarios.qryUsuarios.Transaction.RollbackRetaining;
        end;
        varTipousuario:=dmUsuarios.qryUsuariosTIPO.Value;
        VarUsuarioGlb :=dmUsuarios.qryUsuariosCODIGO_EMPLEADO.Value;

        if ValidaRegistro(1, VarUsuarioGlb, StruserName) then
        begin
           MessageDlg('Cantidad de Licencias insuficientes, verifique.',mtInformation, [mbOK], 0);
           logout;
           Application.Terminate;
        end  else
        begin
          glbLogueado:= dmUsuarios.procMantRegDet.Params[0].Value;
        end;

        LeerDatosIni;//Asigna valor a GlbClaveSup
        VarNombreUsuario:= dmUsuarios.qryUsuariosNOMBRECOMPLETO.Value;
      end;
    end;
  end;
  finally
  frmLogin.free;
  frmLogin:=nil;
  end;
  glbCia_Key:=1;
end;

procedure TfrmMenuPrincipal.CerrarSesion1Click(Sender: TObject);
begin
  ProcesoLogin;
  ActivaPermisos;
  dmUsuarios.qryRoles.Close;
  dmUsuarios.qryRoles.Params[0].Value:= VarUsuarioGlb;
  //dmUsuarios.qryRoles.Open;  hay un conflicto con los permisos a roles y user
  //dmUsuarios.qryRolesID_ROL
  //dmUsuarios.qryRolesID_USUARIO
  if dmUsuarios.qryRoles.RecordCount > 0 then
  ActivaPermiso(TForm(frmMenuPrincipal),1000,dmUsuarios.qryRolesID_ROL.Value, 0);//menu principal: 1000 debe estar en la tabla PROCESOS
  ActivaPermiso(TForm(frmMenuPrincipal),1000, VarUsuarioGlb, 1);
end;

procedure TfrmMenuPrincipal.Empleados1Click(Sender: TObject);
begin
  frmEmpleados:=TfrmEmpleados.Create(nil);
  try
    frmEmpleados.Showmodal;
  finally
  frmEmpleados.Free;
  frmEmpleados:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.VentaMesxDia1Click(Sender: TObject);
begin
  frmConsultaDatosVentaXMes:=TfrmConsultaDatosVentaXMes.Create(Nil);
  try
    frmConsultaDatosVentaXMes.showmodal;
  finally
  frmConsultaDatosVentaXMes.free;
  frmConsultaDatosVentaXMes:=nil;
  end;
end;

procedure TfrmMenuPrincipal.ActivaPermisos;
begin
case varTipousuario of
  0,2:begin
        reportes1.Enabled:=True;
        DebitosyCreditosaplicados1.Enabled:=True;
        //BalanceCxc1.Enabled:=True;
        Configuracion1.Enabled:= True;
        Especial1.Enabled     := True;
      end;
  else
  begin
    reportes1.Enabled:= False;
    DebitosyCreditosaplicados1.Enabled:= False;
    //BalanceCxc1.Enabled:=False;
    Configuracion1.Enabled:= False;
    Especial1.Enabled     := False;
  end;
  end;

end;

procedure TfrmMenuPrincipal.VigenciaBlc1Click(Sender: TObject);
begin
  dmreportes.qryVigenciaCxc.close;
  dmreportes.qryVigenciaCxc.open;  
  qryvigenciaCxc:=tqryvigenciaCxc.Create(nil);
  try
    qryvigenciaCxc.Preview;
  finally
  qryvigenciaCxc.Free;
  qryvigenciaCxc:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.VentaxDia1Click(Sender: TObject);
begin
  frmSelFecha:=tfrmSelFecha.create(nil);
  try
    frmSelFecha.FechaIni.DateTime:=GlbFechaTrnDiaria;
    frmSelFecha.FechaFin.DateTime:=GlbFechaTrnDiaria;
    if frmSelFecha.ShowModal = mrOk then
    begin
    dmreportes.qryResumenVentas.Close;
    dmreportes.qryResumenVentas.Params[0].Value:=ExtraerFecha(frmselfecha.FechaIni.DateTime);
    dmreportes.qryResumenVentas.Params[1].Value:=ExtraerFecha(frmselfecha.FechaFin.DateTime);
    dmreportes.qryResumenVentas.Open;
    qckResumenVentas:=TqckResumenVentas.Create(Nil);
    try
    qckResumenVentas.Prepare;
    glbTPag := qckResumenVentas.PageNumber;
    qckResumenVentas.Preview;
  finally
  qckResumenVentas.Free;
  qckResumenVentas:=Nil;
  end;
  end;
  finally
  frmSelFecha.Free;
  frmSelFecha:=Nil
  end;

end;

procedure TfrmMenuPrincipal.ManualOnline1Click(Sender: TObject);
begin
  Application.HelpFile := 'C:\Proyectos\PuntoVenta\Ayuda\puntoventa.hlp';
end;

procedure TfrmMenuPrincipal.AparienciaVentanas1Click(Sender: TObject);
begin
{  frmConfSkin:=TfrmConfSkin.Create(nil);
  try
    if frmConfSkin.Showmodal = mrOk then
    begin
      SkinData1.Active:=False;
      SkinData1.SkinFile:= frmConfSkin.sd1.SkinFile;
      SkinData1.Active:=True;
      dmUsuarios.qryUsuarios.Edit;
      dmUsuarios.qryUsuariosARCHIVOCONFGWIN.Value:=frmConfSkin.opd1.FileName;
      dmUsuarios.qryUsuarios.Post;
      dmUsuarios.qryUsuarios.ApplyUpdates;
      if not dmUsuarios.qryUsuarios.Transaction.InTransaction then
      dmusuarios.qryUsuarios.Transaction.StartTransaction;
      try
        dmusuarios.qryUsuarios.Transaction.CommitRetaining;
      except
      dmusuarios.qryUsuarios.Transaction.RollbackRetaining;
      end;
    end;
  finally
  frmConfSkin.Free;
  frmConfSkin:=Nil;
  end;}
end;

procedure TfrmMenuPrincipal.Calculadora1Click(Sender: TObject);
begin
  if RxCalculator1.Execute then
  RxCalculator1.Value:=0;
end;


procedure TfrmMenuPrincipal.DesactivarApariencia1Click(Sender: TObject);
begin
  DesactivarApariencia1.Checked:= not DesactivarApariencia1.Checked;
  skindata1.Active:= not skindata1.Active;
end;

procedure TfrmMenuPrincipal.Despacho1Click(Sender: TObject);
begin
  frmProcesarDespachoVendedores:=TfrmProcesarDespachoVendedores.Create(nil);
  try
    frmProcesarDespachoVendedores.showmodal;
  finally
  frmProcesarDespachoVendedores.free;
  frmProcesarDespachoVendedores:=nil;
  end;
end;

procedure TfrmMenuPrincipal.Inventario2Click(Sender: TObject);
begin
  dmReportes.qryRepInventarioProdMasBclRuta.Close;
  if GlbVenderDesdeAlmacenP = 1 then
  dmReportes.qryRepInventarioProdMasBclRuta.SQL.Text := 'Select * from PROC_DATOS_REP_INVENTARIO_P'
  else
  dmReportes.qryRepInventarioProdMasBclRuta.SQL.Text := 'Select * from PROC_DATOS_REP_INVENTARIO';
  dmReportes.qryRepInventarioProdMasBclRuta.Open;
  qckRepDatosInventario:=TqckRepDatosInventario.Create(nil);
  try
    qckRepDatosInventario.Prepare;
    qckRepDatosInventario.qrTpaginas.Caption:= ' de '+IntToStr(qckRepDatosInventario.PageNumber);
    qckRepDatosInventario.Preview;
  finally
  qckRepDatosInventario.Free;
  qckRepDatosInventario:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.Ventas1Click(Sender: TObject);
begin
  frmProcesarVentas:=TfrmProcesarVentas.Create(nil);
  try
    frmProcesarVentas.showmodal;
  finally
  frmProcesarVentas.free;
  frmProcesarVentas:=nil;
  end;
end;

procedure TfrmMenuPrincipal.Precios1Click(Sender: TObject);
begin
  frmPreciosInventario:=TfrmPreciosInventario.Create(nil);
  try
    frmPreciosInventario.Showmodal;
  finally
  frmPreciosInventario.Free;
  frmPreciosInventario:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.Rutas1Click(Sender: TObject);
begin
  frmRutas:=TfrmRutas.Create(nil);
  try
    frmRutas.showmodal;
  finally
  frmRutas.free;
  frmRutas:=nil;
  end;
end;

procedure TfrmMenuPrincipal.CuadrexRuta1Click(Sender: TObject);
begin
  frmCuadreXRuta:=TfrmCuadreXRuta.Create(nil);
  try
    frmCuadreXRuta.Showmodal;
  finally
  frmCuadreXRuta.Free;
  frmCuadreXRuta:=nil;
  end;
end;

procedure TfrmMenuPrincipal.BalanceDespacho1Click(Sender: TObject);
begin
  frmBalanceDespacho:=TfrmBalanceDespacho.Create(nil);
  try
    frmBalanceDespacho.showmodal;
  finally
  frmBalanceDespacho.free;
  frmBalanceDespacho:=nil;
  end;
end;

procedure TfrmMenuPrincipal.CerrarDiaTrnDiaria1Click(Sender: TObject);
begin
  dmCompania.tblCompania.close;
  dmCompania.tblcompania.open;
  if VerificaCierreDia(17,1,1,ExtraerFecha(Now),GlbFechaTrnDiaria) then
  begin
    GlbDiaActualizado:=0;
    //t If varTipousuario = 2 then //SUPERVISOR
    //t begin
    if MessageDlg('Desea Cerrar Transacciones del dia '+FormatDateTime('dd-mmm-yyyy',GlbFechaTrnDiaria)+'?',mtWarning,[mbNo,mbYes],0)=mrYes then
    ProcesarCierreDiaTrn;
    if glbfechatrndiaria < Date then
    RxLabel5.Caption :='ATENCION: Ultimo dia cerrado es : '+FormatDatetime('dd/mmm/yyyy',glbfechatrndiaria)
    else RxLabel5.Caption:= FormatDatetime('dd/mmm/yyyy', glbfechatrndiaria);

   //t end else
   //t if MessageDlg('Solo el supervisor puede cerrar el dia, verifique. '+FormatDateTime('dd-mmm-yyyy',GlbFechaTrnDiaria)+'?',mtWarning,[mbNo,mbYes],0)=mrYes then
    //Transaccionescxc1Click(Self);
  end;
end;

procedure TfrmMenuPrincipal.CuadreDiario1Click(Sender: TObject);
begin
  exit;
  qckReporteCuadreDiario:=TqckReporteCuadreDiario.create(nil);
  try
  qckReporteCuadreDiario.Preview;
  finally
  qckReporteCuadreDiario.Free;
  qckReporteCuadreDiario:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.Registro1Click(Sender: TObject);
begin
  frmtrgtr:=Tfrmtrgtr.create(nil);
  try
    frmtrgtr.ShowModal;
  finally
  frmtrgtr.free;
  frmtrgtr:=nil;
  end;
end;

procedure TfrmMenuPrincipal.BalanceenRuta1Click(Sender: TObject);
begin
  dmCuadrexRuta.qryDatosRepBlcDespacho.close;
  dmCuadrexRuta.qryDatosRepBlcDespacho.params[0].Value:= StrToInt(Inputbox('Reporte balance ruta','Entre ruta',''));
  dmCuadrexRuta.qryDatosRepBlcDespacho.open;
  qckSalidaRuta:=TqckSalidaRuta.Create(nil);
  try
    qckSalidaRuta.Preview;
  finally
  qckSalidaRuta.Free;
  qckSalidaRuta:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.RegistroPedidos1Click(Sender: TObject);
begin
  frmRegPedidoProv := TfrmRegPedidoProv.Create(Nil);
  try
    frmRegPedidoProv.Showmodal;
  finally
  frmRegPedidoProv.Free;
  frmRegPedidoProv := Nil;
  end;

  {
  frmRegistrarPedidos:=TfrmRegistrarPedidos.Create(nil);
  try
    frmRegistrarPedidos.BitBtn14Click(Self);
    //frmRegistrarPedidos.Showmodal;
  finally
  frmRegistrarPedidos.Free;
  frmRegistrarPedidos:=Nil;
  end;}
end;

procedure TfrmMenuPrincipal.PreciosProductos1Click(Sender: TObject);
begin
  dmReportes.qryPrecioInventario.Close;
  dmReportes.qryPrecioInventario.Open;
  qckRepPrecio:=TqckRepPrecio.Create(Nil);
  try
     qckRepPrecio.Preview;
  finally
  qckRepPrecio.Free;
  qckRepPrecio:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.VentaCajaxRuta1Click(Sender: TObject);
begin
  frmSelFecha:=TfrmSelFecha.Create(Nil);
  try
    if frmSelFecha.ShowModal = mrOk then
    begin
      dmreportes.qryDatosRepVxCajas.Close;
      dmreportes.qryDatosRepVxCajas.Params[0].Value:= ExtraerFecha(frmselfecha.FechaIni.Date);
      dmreportes.qryDatosRepVxCajas.Params[1].Value:= ExtraerFecha(frmselfecha.FechaFin.Date);
      dmreportes.qryDatosRepVxCajas.Open;
      qckVentaCajaxRuta:=TqckVentaCajaxRuta.Create(Nil);
      try
        qckVentaCajaxRuta.Preview;
      finally
      qckVentaCajaxRuta.Free;
      qckVentaCajaxRuta:=Nil;
      end;
    end;
  finally
  frmSelFecha.Free;
  frmSelFecha:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.VentaCajaxRutaResumen1Click(Sender: TObject);
begin
  frmSelFecha:=TfrmSelFecha.Create(Nil);
  try
    if frmSelFecha.ShowModal = mrOk then
    begin
      dmreportes.qryDatosRepVxCajasResumen.Close;
      dmreportes.qryDatosRepVxCajasResumen.Params[0].Value:= ExtraerFecha(frmselfecha.FechaIni.Date);
      dmreportes.qryDatosRepVxCajasResumen.Params[1].Value:= ExtraerFecha(frmselfecha.FechaFin.Date);
      dmreportes.qryDatosRepVxCajasResumen.Open;
      qckVentaCajaxRutaResumen:=TqckVentaCajaxRutaResumen.Create(Nil);
      try
        qckVentaCajaxRutaResumen.Preview;
      finally
      qckVentaCajaxRutaResumen.Free;
      qckVentaCajaxRutaResumen:=Nil;
      end;
    end;
  finally
  frmSelFecha.Free;
  frmSelFecha:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.Proveedores1Click(Sender: TObject);
begin
  frmProveedores:=TfrmProveedores.Create(Nil);
  try
    frmProveedores.Showmodal;
  finally
  frmProveedores.Free;
  frmProveedores:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.RegistroCostosCastos1Click(Sender: TObject);
begin
  frmRegTransOpeDiaria:=TfrmRegTransOpeDiaria.Create(Nil);
  try
    frmRegTransOpeDiaria.Showmodal;
  finally
  frmRegTransOpeDiaria.Free;
  frmRegTransOpeDiaria:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.ProductosServicios1Click(Sender: TObject);
begin
  frmProductosServ:=TfrmProductosServ.create(Nil);
  try
    frmProductosServ.Showmodal;
  finally
  frmProductosServ.Free;
  frmProductosServ:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.CentrodeCostos1Click(Sender: TObject);
begin
  frmCentroDeCostos:=TfrmCentroDeCostos.create(Nil);
  try
   frmCentroDeCostos.Showmodal;
  finally
  frmCentroDeCostos.Free;
  frmCentroDeCostos:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.ControlPosteo1Click(Sender: TObject);
begin
  frmControlSistema:=TfrmControlSistema.Create(Nil);
  try
    frmControlSistema.Showmodal;
  finally
  frmControlSistema.Free;
  frmControlSistema:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.Compaia1Click(Sender: TObject);
begin
  frmCompania:=TfrmCompania.create(nil);
  try
    frmCompania.Showmodal;
  finally
  frmCompania.Free;
  frmCompania:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //F4-115 F9-120
  if (key = 115) And (BitBtn1.Enabled) then
  begin
    BitBtn1Click(self);
  end;
end;

procedure TfrmMenuPrincipal.BitBtn1Click(Sender: TObject);
begin
  dmcompania.tblCompania.close;
  dmcompania.tblCompania.Open;
  //if dmcompania.tblCompania.Locate('RNC_NUMERO', '01800047944', [loCaseInsensitive]) then
  //begin
  //  if (strToInt(formatdatetime('dd', Now)) >= 13) and (strToInt(formatdatetime('hh', Now)) >= 11) then
  //  begin
  //    MessageDlg('Aplicacion presenta licencia vencida, verifique',mtInformation, [mbOK], 0);
  //    Halt(0);
  //  end;
  //end;
  if (GlbVenderDesdeAlmacenP = 0) then
  begin
    frmSelInventario:=TfrmSelInventario.Create(nil);
    if frmSelInventario.ShowModal = mrOk then
    begin
      dmUsuarios.qryRoles.Close;
      dmUsuarios.qryRoles.Params[0].Value:= VarUsuarioGlb;
      //dmUsuarios.qryRoles.Open;  hay un conflicto con los permisos a roles y user
      
      frmProcVentaRapida := TfrmProcVentaRapida.Create(Nil);
      if dmUsuarios.qryRoles.RecordCount > 0 then
      ActivaPermiso(TForm(frmProcVentaRapida),1000, dmUsuarios.qryRolesID_ROL.Value, 0);//menu principal: 1000 debe estar en la tabla PROCESOS
      ActivaPermiso(TForm(frmProcVentaRapida),1000, VarUsuarioGlb, 1);

      GlbCodDivInventario:=frmSelInventario.tblDivInventarioINVENTARIO_ID.Value;
      try
        frmProcVentaRapida.lblInventario.Caption :=
        frmSelInventario.tblDivInventarioDESCRIPCION.Value;
        frmProcVentaRapida.ShowModal;
      finally
      frmProcVentaRapida.Free;
      frmProcVentaRapida:= Nil;
      end;
      GlbCodDivInventario:=-1;
    end;
  end else
  begin
    GlbCodDivInventario:= 1;
    frmProcVentaRapida := TfrmProcVentaRapida.Create(Nil);
    try
      dmUsuarios.qryRoles.Close;
      dmUsuarios.qryRoles.Params[0].Value:= VarUsuarioGlb;
      //dmUsuarios.qryRoles.Open;  hay un conflicto con los permisos a roles y user
      
      if dmUsuarios.qryRoles.RecordCount > 0 then
      ActivaPermiso(TForm(frmProcVentaRapida),1000, dmUsuarios.qryRolesID_ROL.Value, 0);//menu principal: 1000 debe estar en la tabla PROCESOS
      ActivaPermiso(TForm(frmProcVentaRapida),1000, VarUsuarioGlb, 1);

      frmProcVentaRapida.lblInventario.Caption :='ALMACEN PRINCIPAL';
      frmProcVentaRapida.ShowModal;
    finally
    frmProcVentaRapida.Free;
    frmProcVentaRapida:= Nil;
    end;
    GlbCodDivInventario:=-1;
  end;
  Application.Terminate;
end;

procedure TfrmMenuPrincipal.ConsultaCotizaciones1Click(Sender: TObject);
begin
  frmCotizaciones:=TfrmCotizaciones.Create(nil);
  try
    frmCotizaciones.BitBtn4Click(Self);
    frmCotizaciones.Showmodal;
  finally
  frmCotizaciones.Free;
  frmCotizaciones:=nil;
  end;
end;

procedure TfrmMenuPrincipal.Proveedores2Click(Sender: TObject);
begin
  frmProveedores:=TfrmProveedores.create(nil);
  try
    frmProveedores.ShowModal;
  finally
  frmProveedores.Free;
  frmProveedores:=nil;
  end;
end;

procedure TfrmMenuPrincipal.ImprimirRepItebis(tipo: smallint);
begin

end;

procedure TfrmMenuPrincipal.ClaveMaestra1Click(Sender: TObject);
var
  Ini: TIniFile;
  clave, claveSave : String;
  xsalir : Boolean;
  verClave : String;
begin
  xsalir:=False;
  Ini := TIniFile.Create( ChangeFileExt( Application.ExeName, '.INI' ) );
  try
    frmentrreClave:=TfrmentrreClave.Create(Nil);
    if frmEntrreClave.showmodal=mrOk then
    Clave:= frmEntrreClave.Edit1.Text
    else xsalir := True;
    frmentrreClave.Free;
    frmentrreClave := Nil;
    ClaveSave:=Ini.ReadString('Clave','Maestra', '');
    xsalir:= False;
    verClave:= Encriptar(Trim(clave),2005);
    if Clave <> '' then
    if claveSave <> verClave then
    begin
      MessageDlg('Clave incorrecta, verifique',mtError, [mbOK], 0);
      xsalir:=True;
    end;
  finally
  Ini.Free;
  end;
  if xsalir then Exit;
  frmConfVarios:=TfrmConfVarios.Create(Nil);
  try
    frmConfVarios.Showmodal;
  finally
  frmConfVarios.Free;
  frmConfVarios:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.IngCuentasxCobrar1Click(Sender: TObject);
begin
  frmSelFecha:=TfrmSelFecha.Create(Nil);
  try
    frmSelFecha.FechaIni.Date := GlbFechaTrnDiaria;
    frmSelFecha.FechaFin.Date := GlbFechaTrnDiaria;
    if frmSelFecha.Showmodal   = mrOk then
    begin
      //FiltrarRepIngEfe,
      repIngCxc        := True;
      dmReportes.filtrarRepIngCxc := 2;
      //FiltrarRepIngTodo : Integer;

      dmReportes.qryDatosRepVentaDiaria.Filtered := True;
      dmReportes.qryDatosRepVentaDiaria.Close;
      dmReportes.qryDatosRepVentaDiaria.Params[0].Value:= ExtraerFecha(frmSelFecha.FechaIni.Date);
      dmReportes.qryDatosRepVentaDiaria.Params[1].Value:= ExtraerFecha(frmSelFecha.FechaFin.Date);
      dmReportes.qryDatosRepVentaDiaria.Open;

      qckRepVentaDiaria:=tQckRepVentaDiaria.Create(Nil);
      try
        qckRepVentaDiaria.Prepare;
        qckRepVentaDiaria.qrTpaginas.Caption:= ' de '+IntToStr(qckRepVentaDiaria.PageNumber);
        qckRepVentaDiaria.QRLabel14.Caption := '';
        qckRepVentaDiaria.ChildBand1.Enabled:= False;

        if MessageDlg('Imprimir?', mtInformation, [mbyes, mbno], 0) = mrYes then
        begin
          qckRepVentaDiaria.PrinterSetup;
          qckRepVentaDiaria.Print;
        end else
        qckRepVentaDiaria.Preview;
      finally
      qckRepVentaDiaria.Free;
      qckRepVentaDiaria:= Nil;
      repIngCxc := False;
      dmReportes.qryDatosRepVentaDiaria.Filtered:= False;
      end;
    end;
  finally
  frmSelFecha.Free;
  frmSelFecha:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.EstadoCta2Click(Sender: TObject);
var
  a,m,d : Word;
  codCte:Integer;
  xImp : Boolean;
begin
  GlbBalanceAnt := 0;
  xImp := False;
  //FrmBuscarClientesPersonas:=TFrmBuscarClientesPersonas.Create(Nil);
  frmProcBuscarProv :=TfrmProcBuscarProv.Create(Nil);
  try
    if frmProcBuscarProv.ShowModal = mrOk then
    begin
      CodCte:= frmProcBuscarProv.xCodigoCte;
    end else
    begin
      frmProcBuscarProv.Free;
      frmProcBuscarProv:=Nil;
      Exit;
    end;
  finally
  frmProcBuscarProv.Free;
  frmProcBuscarProv:=Nil;
  end;
  frmSelFecha :=TfrmSelFecha.Create(Nil);
  try
     frmSelFecha.FechaIni.Date := GlbFechaTrnDiaria;
     frmSelFecha.FechaFin.Date := GlbFechaTrnDiaria;
    if frmSelFecha.Showmodal = mrOk then
    begin
      GlbFechaInicial := ExtraerFecha(frmSelFecha.FechaIni.Date); //ExtraerFecha(ibsqlFechaMinPrestActivo.FieldByName('fmin').AsDateTime);
      GlbFechaFinal   := ExtraerFecha(frmSelFecha.FechaFin.Date);
    end;
  finally
  frmSelFecha.Free;
  frmSelFecha := Nil;
  end;

  DecodeDate(GlbFechaInicial,a,m,d);
  if (m = 1) and (d = 1 ) then
  begin
    M:=12;
    Dec(a);
  end;
  if (d = 1) then
  begin
    Dec(m);
    d:=DiasEnElMes(a,m)
  end else Dec(d);

  dmCxp.qryBceHistoricocxp.Close;
  dmCxp.qryBceHistoricocxp.Params[0].Value := 0;//Historico
  dmCxp.qryBceHistoricocxp.params[1].Value := EncodeDate(a,m,d);
  dmCxp.qryBceHistoricocxp.Params[2].Value := EncodeDate(a,m,d);
  dmCxp.qryBceHistoricocxp.Params[3].Value := '1';
  dmCxp.qryBceHistoricocxp.Params[4].Value := CodCte;
  dmCxp.qryBceHistoricocxp.Params[5].Value := CodCte;
  dmCxp.qryBceHistoricocxp.Open;

  dmCxp.qryRepServ.Close;
  dmCxp.qryRepServ.Params[0].Value := ExtraerFecha(GlbFechaInicial);
  dmCxp.qryRepServ.Params[1].Value := ExtraerFecha(GlbFechaFinal);
  dmCxp.qryRepServ.Params[2].Value := CodCte;
  dmCxp.qryRepServ.Open;

  //codCte:=edtCodCteRep.ValueInteger;

  //usar siguiente query para estado general de cxc
  dmCxp.qrySQLBlceAntCxPCte.Close;
  //if not dmCxc.qrySQLBlceAntCxPCte.Prepared then
  //dmCxp.qrySQLBlceAntCxPCte.Prepare;
  dmCxp.qrySQLBlceAntCxPCte.Params[0].Value:= CodCte; //codigoclienteini
  dmCxp.qrySQLBlceAntCxPCte.Params[1].Value:= CodCte; //codigoclientefin
  dmCxp.qrySQLBlceAntCxPCte.Params[2].Value:= ExtraerFecha(GlbUltimoDiaMesAnt(GlbFechaInicial)+1); //FechaIni
  dmCxp.qrySQLBlceAntCxPCte.Params[3].Value:= ExtraerFecha(glbFechaFinal); //FechaFin
  dmCxp.qrySQLBlceAntCxPCte.Params[4].Value:= '1'; //Moneda
  dmCxp.qrySQLBlceAntCxPCte.Params[5].Value:= GlbUltimoDiaMesAnt(GlbFechaInicial); //fecha_blc_Anterior
  dmCxp.qrySQLBlceAntCxPCte.ExecQuery;
  if dmCxp.qrySQLBlceAntCxPCte.Open then
  begin
    GlbBalanceAnt:=dmCxp.qrySQLBlceAntCxPCte.Fieldbyname('BALANCE_ANT').AsFloat +
                   dmCxp.qrySQLBlceAntCxPCte.Fieldbyname('DEBITO').AsFloat +
                   dmCxp.qrySQLBlceAntCxPCte.Fieldbyname('CREDITO').AsFloat;
  end;
  qckRepXServCXP:=TQckRepXServCXP.Create(Nil);
  try
    qckRepXServCXP.Prepare;
    glbTPag := qckRepXServCXP.PageNumber;

    if MessageDlg('Imprimir?',mtInformation, [mbYes, mbNo], 0)=mrYes then
    xImp:= True;
    
    if xImp then
    begin
      qckRepXServCXP.PrinterSetup;
      qckRepXServCXP.Print;
    end else
    qckRepXServCXP.Preview;
  finally
  qckRepXServCXP.Free;
  qckRepXServCXP := Nil;
  end;
end;

procedure TfrmMenuPrincipal.Labels1Click(Sender: TObject);
begin
  //WinExec(PChar('CodBarra.exe'), SW_SHOWNORMAL); {Ejecuta modulo cobro}
  //inherited;

end;

procedure TfrmMenuPrincipal.CobroMultiplesFacturas1Click(Sender: TObject);
begin
  FrmBuscarClientesPersonas:=TFrmBuscarClientesPersonas.Create(nil);
  try
    if FrmBuscarClientesPersonas.showmodal = mrOk then
    begin
      frmCobrarFacturas:=TfrmCobrarFacturas.Create(nil);
      try
        //frmCobrarFacturas.strNombreEmpresa :=FrmBuscarClientesPersonas.
        frmCobrarFacturas.CodCte:=FrmBuscarClientesPersonas.CodigoCliente;
        frmCobrarFacturas.Showmodal;
      finally
      frmCobrarFacturas.Free;
      frmCobrarFacturas:=Nil;
      end;
    end;
  finally
  FrmBuscarClientesPersonas.free;
  FrmBuscarClientesPersonas:=nil;
  end;
end;

procedure TfrmMenuPrincipal.BasedeDatos1Click(Sender: TObject);
begin
  frmInciaConeccion:=TfrmInciaConeccion.Create(Nil);
  try
    frmInciaConeccion.Showmodal;
  finally
  frmInciaConeccion.Free;
  frmInciaConeccion := Nil;
  end;
end;

procedure TfrmMenuPrincipal.NotaCredito1Click(Sender: TObject);
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
  FrmBuscarClientesPersonas:=TFrmBuscarClientesPersonas.Create(nil);
  try
    if FrmBuscarClientesPersonas.Showmodal = mrOk then
    begin
      frmTransCxcProc_R:=TfrmTransCxcProc_R.Create(Nil);
      try
        frmTransCxcProc_R.CodCte := FrmBuscarClientesPersonas.CodigoCliente;
        //frmTransCxcProc_R.Pagecontrol1.ActivePage := TabSheet1;
        frmTransCxcProc_R.Pagecontrol1.ActivePageIndex:=0;
        frmTransCxcProc_R.Showmodal;
      finally
      frmTransCxcProc_R.Free;
      frmTransCxcProc_R:=Nil;
      end;
    end;
  finally
  FrmBuscarClientesPersonas.free;
  FrmBuscarClientesPersonas:=nil;
  end;
end;

procedure TfrmMenuPrincipal.NotaDebito1Click(Sender: TObject);
begin
{ frmTransCxcNCdbDev:=TfrmTransCxcNCdbDev.Create(Nil);
  try
    frmTransCxcNCdbDev.RadioGroup1.ItemIndex:=1;
    frmTransCxcNCdbDev.Caption:='Nota de Débito';
    frmTransCxcNCdbDev.Showmodal;
  finally
  frmTransCxcNCdbDev.Free;
  frmTransCxcNCdbDev:=Nil;
  end;}
  
  FrmBuscarClientesPersonas:=TFrmBuscarClientesPersonas.Create(nil);
  try
    if FrmBuscarClientesPersonas.Showmodal = mrOk then
    begin
      frmTransCxcProc_R:=TfrmTransCxcProc_R.Create(Nil);
      try
        frmTransCxcProc_R.CodCte := FrmBuscarClientesPersonas.CodigoCliente;
        //frmTransCxcProc_R.Pagecontrol1.ActivePage := TabSheet2;
        frmTransCxcProc_R.Pagecontrol1.ActivePageIndex:=1;
        frmTransCxcProc_R.Showmodal;
      finally
      frmTransCxcProc_R.Free;
      frmTransCxcProc_R:=Nil;
      end;
    end;
  finally
  FrmBuscarClientesPersonas.free;
  FrmBuscarClientesPersonas:=nil;
  end;

end;

procedure TfrmMenuPrincipal.ServiciosFijos1Click(Sender: TObject);
begin
  frmProgServFijos:=TfrmProgServFijos.Create(Nil);
  try
    frmProgServFijos.Showmodal;
  finally
  frmProgServFijos.Free;
  frmProgServFijos:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.ServiciosVarios1Click(Sender: TObject);
begin
  frmServiciosReg:=TfrmServiciosReg.Create(nil);
  try
    frmServiciosReg.showmodal;
  finally
  frmServiciosReg.free;
  frmServiciosReg:=nil;
  end;
end;

procedure TfrmMenuPrincipal.SaldoxAntCxc1Click(Sender: TObject);
begin
  frmConsultaAntCxc:=TfrmConsultaAntCxc.Create(Nil);
  try
    frmConsultaAntCxc.Showmodal;
  finally
  frmConsultaAntCxc.Free;
  frmConsultaAntCxc:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.VenceInventario1Click(Sender: TObject);
begin
  frmProdVencidos:=TFrmProdVencidos.Create(Nil);
  try
    frmProdVencidos.ShowModal;
  finally
  frmProdVencidos.Free;
  frmProdVencidos:=Nil;
  end;

  Exit;

  dmInventario.qryRepInvVencimiento.Close;
  frmSelSingleFechaOpc:=TfrmSelSingleFechaOpc.Create(nil);
  try
    frmSelSingleFechaOpc.FechaIni.DateTime:= GlbFechaTrnDiaria;

    if frmSelSingleFechaOpc.ShowModal = mrok then
    begin
      dmInventario.qryRepInvVencimiento.Params[0].Value:=
      ExtraerFecha(frmSelSingleFechaOpc.FechaIni.DateTime);
      dmInventario.qryRepInvVencimiento.Open;
      qckRepVencimientoProd:=TqckRepVencimientoProd.create(Nil);
      try
        qckRepVencimientoProd.Preview;
      finally
      qckRepVencimientoProd.Free;
      qckRepVencimientoProd:=Nil;
      end;
    end;
  finally
  frmSelSingleFechaOpc.Free;
  frmSelSingleFechaOpc:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.SaldarFacturas1Click(Sender: TObject);
var
  x : boolean;
begin
  frmPagarCXPFacturas:=TfrmPagarCXPFacturas.Create(Nil);
  try
  frmProcBuscarProv:=TfrmProcBuscarProv.Create(Nil);
  try
    if frmProcBuscarProv.Showmodal = mrOk then
    begin
      frmPagarCXPFacturas.CodCte:=dmproveedor.qryProveCxpCODIGO_CTE.Value;
      frmPagarCXPFacturas.strNombreEmpresa:= dmproveedor.qryProveCxpDESCRIPCION.Value;
      x := true;
    end;
  finally
  frmProcBuscarProv.Free;
  frmProcBuscarProv:=Nil;
  end;
  if x then
  frmPagarCXPFacturas.Showmodal;
  finally
  frmPagarCXPFacturas.Free;
  frmPagarCXPFacturas:= Nil;
  end;
end;

procedure TfrmMenuPrincipal.ProcCerrarDia;
var
  x, y : string;
  z: Integer;
begin
  if VerificaCierreDia(17,1,1, ExtraerFecha(Now), GlbFechaTrnDiaria) then
  begin
    If (varTipousuario = 0) or (varTipousuario = 1) then
    begin
      if (Date - glbfechatrndiaria) > 1  then
      begin
        CerrarDiaTardio1Click(Self);
        Exit;
      end;
      if MessageDlg('Desea Cerrar Transacciones del dia '+FormatDateTime('dd-mmm-yyyy',GlbFechaTrnDiaria)+'?',mtWarning,[mbNo,mbYes],0)=mrYes then
      ProcesarCierreDiaTrn else
      begin
        x:= FormatDateTime('dd', GlbFechaTrnDiaria);
        y:= FormatDateTime('dd', Date);
        z:= StrToInt(x) - StrToInt(y);
        z:= Abs(z);
        {if (StrToInt(FormatDateTime('HH', Now)) >= 19) or (z >=1) then
        begin
          if Not VerificaAutorizacion then
          begin
            MessageDlg('Para poder trabajar con la fecha "'+FormatDateTime('dd-mmm-yyyy',GlbFechaTrnDiaria)+'", '#13''+'necesita una autorización, verifique',mtError,[mbOk],0);
            Application.Terminate;
          end;
        end;}
      end;
    end;
  end;
  if glbfechatrndiaria < Date then
  RxLabel5.Caption :='ATENCION: Ultimo dia cerrado es : '+FormatDatetime('dd/mmm/yyyy',glbfechatrndiaria)
  else RxLabel5.Caption:= FormatDatetime('dd/mmm/yyyy', glbfechatrndiaria);
end;

procedure TfrmMenuPrincipal.CerrarDiaTardio1Click(Sender: TObject);
begin
 frmProcCierreOfc:=TfrmProcCierreOfc.Create(Nil);
  try
    frmProcCierreOfc.ShowModal;
  finally
  frmProcCierreOfc.Free;
  frmProcCierreOfc:=Nil;
  end;
  if glbfechatrndiaria < Date then
  RxLabel5.Caption :='ATENCION: Ultimo dia cerrado es : '+FormatDatetime('dd/mmm/yyyy',glbfechatrndiaria)
  else RxLabel5.Caption:= FormatDatetime('dd/mmm/yyyy', glbfechatrndiaria);
end;

procedure TfrmMenuPrincipal.Banco1Click(Sender: TObject);
begin
  frmBancos:=TfrmBancos.Create(Nil);
  try
    frmBancos.Showmodal;
  finally
  frmBancos.Free;
  frmBancos:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.FacturasPendiente2Click(Sender: TObject);
begin
  frmFactCxpPendiente:=TfrmFactCxpPendiente.Create(nil);
  try
    frmFactCxpPendiente.ShowModal;
  finally
  frmFactCxpPendiente.free;
  frmFactCxpPendiente:=nil;
  end;
end;

procedure TfrmMenuPrincipal.Balance1Click(Sender: TObject);
begin
  frmBalanceCxcCtes:=TfrmBalanceCxcCtes.Create(Nil);
  try
   frmBalanceCxcCtes.Showmodal;
  finally
  frmBalanceCxcCtes.Free;
  frmBalanceCxcCtes:=Nil;
  end;
end;


function FindForm(s:string):TForm;
var i:integer;
begin
  result:=nil;
  for i:= 0 to screen.FormCount-1 do
  begin
    if screen.Forms[i].ClassName=s then
    begin
       result:=screen.Forms[i];
       break;
    end;
  end;
end;



procedure TfrmMenuPrincipal.RelaciondeFacturas1Click(Sender: TObject);
begin
  frmRelacionFact:=TfrmRelacionFact.Create(Nil);
  try
    frmrelacionfact.Showmodal;
  finally
  frmrelacionfact.Free;
  frmrelacionfact:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.Especial1Click(Sender: TObject);
var
  salir : boolean;
begin
  Salir:=False;
  frmSelFecha:=TfrmSelFecha.Create(Nil);
  try
    if frmselfecha.ShowModal = mrok then
    begin
      dmCompania.tblCompania.Close;
      dmCompania.tblCompania.Open;
      dmFactura.qryRepItbis_esp.close;
      dmFactura.qryRepItbis_esp.params[0].Value:=ExtraerFecha(frmselfecha.FechaIni.DateTime);
      dmFactura.qryRepItbis_esp.params[1].Value:=ExtraerFecha(frmselfecha.FechaFin.DateTime);
      dmFactura.qryRepItbis_esp.open;
    end else Salir:=True;
  finally
  frmSelFecha.free;
  frmSelFecha:=nil;
  end;
  if Salir then Exit;

    qckRepItbis_esp:=TQckRepItbis_esp.Create(Nil);
    try
      if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrNo then
      begin
        qckRepItbis_esp.Preview;
      end else
      begin
        qckRepItbis_esp.PrinterSetup;
        qckRepItbis_esp.Print;
      end;
    finally
    qckRepItbis_esp.Free;
    qckRepItbis_esp:=Nil;
    end;

  {else
  if Tipo = 2 then
  begin
    qckRepItbis_ResXDia:=TqckRepItbis_ResXDia.Create(Nil);
    try
      if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrNo then
      begin
        qckRepItbis_ResXDia.Preview;
      end else
      begin
        qckRepItbis_ResXDia.PrinterSetup;
        qckRepItbis_ResXDia.Print;
      end;
    finally
    qckRepItbis_ResXDia.Free;
    qckRepItbis_ResXDia:=Nil;
    end;
  end;}
end;

procedure TfrmMenuPrincipal.Button1Click(Sender: TObject);
begin
  //recibo para farmacia y mas
  //qckReciboPuntoVenta:=TqckReciboPuntoVenta.Create(Nil);
  //
end;

procedure TfrmMenuPrincipal.CuadreCaja1Click(Sender: TObject);
begin
  frmCuadreCaja:=TfrmCuadreCaja.Create(Nil);
  try
    frmCuadreCaja.Showmodal;
  finally
  frmCuadreCaja.Free;
  frmCuadreCaja:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.CargoEmpleados1Click(Sender: TObject);
begin
  frmCargo:=TfrmCargo.Create(Nil);
  try
    frmCargo.Showmodal;
  finally
  frmCargo.Free;
  frmCargo:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.HandleException(Sender: TObject; E: Exception);
var
 error : string;
begin
  error:='error';
end;

function TfrmMenuPrincipal.ProgramaAbiertoDosVeces: Boolean;
var
  Datos          :TProcessEntry32; {Estructura interna de datos de un proceso}
  hID            :DWord;           {identificador del proceso}
  Snap           :Integer;
  NombreArchivo  :String;    {path del archivo original}
  Repetido       :Boolean;   {true si el programa se ha abierto dos veces}
  Handle1        :Hwnd;      {thandle}
  Contador       :Integer;   {Contador de aperturas}

begin
  Contador:=0;
  NombreArchivo:=Application.Exename;
  Repetido:=False;
  GetWindowThreadProcessId(Handle1,@hID);
  Snap:=CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS,0);
  try
    Datos.dwSize:=SizeOf(Datos);
    if(Process32First(Snap,Datos))then
    begin
      repeat
        if NombreArchivo=StrPas(Datos.szExeFile) then
        begin
           Inc(contador);
           if Contador>=2 then Repetido:=true;
        end;
      until (not(Process32Next(Snap,Datos))) or (Repetido);
    end;
  finally
    Windows.CloseHandle(Snap);
  end;
  Result:=Repetido;
end;

procedure TfrmMenuPrincipal.InventarioPrecioCompra1Click(Sender: TObject);
begin
  dmReportes.qryRepInventarioProdMasBclRuta.Close;
  if GlbVenderDesdeAlmacenP = 1 then
  dmReportes.qryRepInventarioProdMasBclRuta.SQL.Text := 'Select * from PROC_DATOS_REP_INVENTARIO_P'
  else
  dmReportes.qryRepInventarioProdMasBclRuta.SQL.Text := 'Select * from PROC_DATOS_REP_INVENTARIO';
  dmReportes.qryRepInventarioProdMasBclRuta.Open;
  qckInvProdCosto:=TQckInvProdCosto.Create(Nil);
  try
    qckInvProdCosto.Preview;
  finally
  qckInvProdCosto.Free;
  qckInvProdCosto:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.DespachoAlmacen1Click(Sender: TObject);
begin
  {frmDespachoAlmacen:=TfrmDespachoAlmacen.Create(Nil);
  try
    frmDespachoAlmacen.Showmodal;
  finally
  frmDespachoAlmacen.Free;
  frmDespachoAlmacen:=Nil;
  end;}
  frmDespachoInvAlmacen:=TfrmDespachoInvAlmacen.Create(Nil);
  try
    frmDespachoInvAlmacen.Showmodal;
  finally
  frmDespachoInvAlmacen.Free;
  frmDespachoInvAlmacen:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.ClasificacinPrecio1Click(Sender: TObject);
begin
  frmTipoPrecio:=TfrmTipoPrecio.Create(Nil);
  try
    frmTipoPrecio.Showmodal
  finally
  frmTipoPrecio.Free;
  frmTipoPrecio:= Nil;
  end;
end;

procedure TfrmMenuPrincipal.DivisionInventario1Click(Sender: TObject);
begin
  frmDivisionInv:=TfrmDivisionInv.Create(Nil);
  try
    frmDivisionInv.Showmodal;
  finally
  frmDivisionInv.Free;
  frmDivisionInv:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.InventarioxArea1Click(Sender: TObject);
var
  tInv : integer;
  descTInv : String;
begin
  tInv:=-1;
  frmSelInventario:=TfrmSelInventario.Create(nil);
  try
    if frmSelInventario.ShowModal = mrOk then
    begin
      tInv:=frmSelInventario.tblDivInventarioINVENTARIO_ID.Value;
      descTInv:=frmSelInventario.tblDivInventarioDescripcion.Value;
    end else tInv:=-1;
  finally
  frmSelInventario.free;
  frmSelInventario:=nil;
  end;
  if (tInv < 0) then exit;
    dmCompania.tblCompania.close;
    dmCompania.tblCompania.Open;
    dmReportes.qryRepInventarioProdMasBclDiv.Close;
    dmReportes.qryRepInventarioProdMasBclDiv.Params[0].Value:= tInv;
    dmReportes.qryRepInventarioProdMasBclDiv.Open;
    qckRepDatosInventarioXarea:=TQckRepDatosInventarioXarea.Create(Nil);
    try
      qckRepDatosInventarioXarea.strLabelTiporep := descTInv;
      qckRepDatosInventarioXarea.Preview;
    finally
    qckRepDatosInventarioXarea.Free;
    qckRepDatosInventarioXarea:=Nil;
    end;
end;

procedure TfrmMenuPrincipal.SkinData1FormSkin(Sender: TObject;
  aName: String; var DoSkin: Boolean);
  var fm:TForm;
begin
  if (aname='TQRStandardPreview') then
  begin
    fm:= FindForm(aName);
    if fm<>nil then
    begin
      fm.Top:=0;
      fm.Left:=0;
      fm.Width:=screen.Width;
      fm.Height:=screen.Height;
    end;
  end;
end;

procedure TfrmMenuPrincipal.UnidadesInv1Click(Sender: TObject);
begin
  frmUnidades:=TfrmUnidades.Create(Nil);
  try
    frmUnidades.Showmodal;
  finally
  frmUnidades.Free;
  frmUnidades:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.Reparaciones1Click(Sender: TObject);
begin
  frmReparaciones:=TfrmReparaciones.Create(nil);
  try
    frmReparaciones.Showmodal;
  finally
  frmReparaciones.Free;
  frmReparaciones:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  Ini: TIniFile;
  NombArchivo : String;
  x: integer;
begin
  NombArchivo := ExtractFilePath(Application.ExeName)+'\'+'repconf_cr.ini';
  Ini := TIniFile.Create(NombArchivo );
  try
    if (GlbCorriendoII = 0) then
    Ini.WriteInteger('Aplicacion', 'GlbCorriendo', 0);
  finally
  Ini.Free;
  end;
  //dmUsuarios.procMantRegDet.Params[0].Value:= //Permitido
  //dmUsuarios.procMantRegDet.Params[1].Value:= //Logueado
  dmUsuarios.procMantRegDet.Params[2].Value:= 0; //Accion
  dmUsuarios.procMantRegDet.Params[3].Value:= VarUsuarioGlb;//cod_usuario
  dmUsuarios.procMantRegDet.Params[4].Value:= StrUserName;//nombre_pc

  dmUsuarios.procMantRegDet.ExecProc;

  glbLogueado:= 0;
end;

function TfrmMenuPrincipal.ValidaRegistro(accion: smallint;
  coduser: Integer; usuario: string): Boolean;
begin
  //dmUsuarios.procMantRegDet.Params[0].Value:= //Permitido
  //dmUsuarios.procMantRegDet.Params[1].Value:= //Logueado
  dmUsuarios.procMantRegDet.Params[2].Value:= accion; //Accion
  dmUsuarios.procMantRegDet.Params[3].Value:= coduser;//cod_usuario
  dmUsuarios.procMantRegDet.Params[4].Value:= usuario;//nombre_pc
  dmUsuarios.procMantRegDet.ExecProc;
  if (dmUsuarios.procMantRegDet.Params[0].Value = 0) then
  result:=True
  else result:=False;
end;

procedure TfrmMenuPrincipal.DistribucionCtasCnt1Click(Sender: TObject);
begin
  frmDistCtaCnt:=TfrmDistCtaCnt.Create(Nil);
  try
    frmDistCtaCnt.Showmodal;
  finally
  frmDistCtaCnt.Free;
  frmDistCtaCnt:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.ContabilizarVentas1Click(Sender: TObject);
begin
  TIPO_DOCUMENTO_CNT :=6;//Entrada
  SISTEMA_CNT        :=18;//Transaccion ventas
  SUBSISTEMA_CNT     :=1;
  GLBCODIGO_CIA      :=1;
  frmContabilizarVentas:=TfrmContabilizarVentas.Create(Nil);
  try
    GLBMODULO_CNT := 1;
    frmContabilizarVentas.nombretablaacnt:='VIEW_VENTAS_ACNT';
    frmContabilizarVentas.Showmodal;
  finally
  frmContabilizarVentas.Free;
  frmContabilizarVentas:=Nil
  end;
end;

procedure TfrmMenuPrincipal.DistcntAdicional1Click(Sender: TObject);
begin
  frmDistCtaCntNuevo:=TfrmDistCtaCntNuevo.create(Nil);
  try
    frmDistCtaCntNuevo.showmodal;
  finally
  frmDistCtaCntNuevo.Free;
  frmDistCtaCntNuevo:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.GrupoCnt1Click(Sender: TObject);
begin
  frmGrupocnt:=TfrmGrupocnt.Create(nil);
  try
    frmGrupocnt.showmodal;
  finally
  frmGrupocnt.free;
  frmGrupocnt:=nil;
  end;
end;

procedure TfrmMenuPrincipal.logout;
var
  Ini: TIniFile;
  NombArchivo : String;
  x: integer;
begin
  NombArchivo := ExtractFilePath(Application.ExeName)+'\'+'repconf_cr.ini';
  Ini := TIniFile.Create(NombArchivo );
  try
    if (GlbCorriendo = 0) then
    Ini.WriteInteger('Aplicacion', 'GlbCorriendo', 0);
  finally
  Ini.Free;
  end;
end;

procedure TfrmMenuPrincipal.VentaDiaria3Click(Sender: TObject);
begin
  frmSelFecha:=TfrmSelFecha.Create(nil);
  try
    frmSelFecha.FechaIni.Date:=GlbFechaTrnDiaria;
    frmSelFecha.FechaFin.Date:=GlbFechaTrnDiaria;
    if frmSelFecha.showmodal = mrOk then
    begin
      dmReportes.qryDatosRepVentaDiaria.close;
      dmReportes.qryDatosRepVentaDiaria.params[0].value:= ExtraerFecha(frmSelFecha.FechaIni.Date);
      dmReportes.qryDatosRepVentaDiaria.params[1].value:= ExtraerFecha(frmSelFecha.FechaFin.Date);
      dmReportes.qryDatosRepVentaDiaria.Open;

      qckRepVentaDiaria:=tQckRepVentaDiaria.Create(Nil);
      try
        qckRepVentaDiaria.Prepare;
        qckRepVentaDiaria.qrTpaginas.Caption:=' de '+IntToStr(qckRepVentaDiaria.PageNumber);
        qckRepVentaDiaria.QRLabel14.Caption:='';
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

{procedure TfrmMenuPrincipal.ActivaPermiso(proceso:integer; iduser:Integer; isperson:Integer);
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

  For x:=0 To frmMenuPrincipal.ControlCount - 1 Do
  begin
    if frmMenuPrincipal.controls[x].Tag > 0 then
    begin
    if dmusuarios.stpBuscarPermisos.Locate('procesoid;tareaid', Vararrayof([proceso,
    frmMenuPrincipal.controls[x].Tag]),[]) then
    begin
      if dmusuarios.stpBuscarPermisos.FieldByName('status').Value = 1 then
      frmMenuPrincipal.controls[x].Enabled:=True
      else
      begin
        frmMenuPrincipal.controls[x].Enabled:=False;
        if dmusuarios.stpBuscarPermisosVISIBLE.Value = 0 then
        frmMenuPrincipal.controls[x].Visible:=false;
      end
    end else
    begin
      frmMenuPrincipal.controls[x].Enabled:=False;
      if dmusuarios.stpBuscarPermisosVISIBLE.Value = 0 then
      frmMenuPrincipal.controls[x].Visible:=false;
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
end;    }

procedure TfrmMenuPrincipal.CrearOrden1Click(Sender: TObject);
begin
  {frmRegOrdenCompra:=TfrmRegOrdenCompra.Create(Nil);
  try
    frmRegOrdenCompra.Showmodal;
  finally
  frmRegOrdenCompra.Free;
  frmRegOrdenCompra:=nil;
  end;}

  frmOrdenCompraR:=TfrmOrdenCompraR.Create(Nil);
  try
    frmOrdenCompraR.showmodal;
  finally
  frmOrdenCompraR.Free;
  frmOrdenCompraR:=nil;
  end;
end;

end.

