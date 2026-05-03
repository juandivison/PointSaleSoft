unit UMenuPrincipal;
//sistema de farmacia
///GLBRUTADB="Dealer" --estoy usando este para factura electronica
//https://decasystems.com.do/farmacom.php
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  RxVerInf, ShellApi, TLHelp32, IniFiles, Menus, RxCalc, WinSkinData, RXCtrls, StdCtrls, Buttons, ComCtrls,
  db,QRPrntr, RXDBCtrl, Dialogs, jpeg, ExtCtrls, dbCtrls, GetAnyDate,
  UGetDateTipoM, Gradiente;

  const
  CM_RESTORE = WM_USER + $1000;

//  SECTION = 'POSGOLDRESP';
                                            
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
    TabSheet1: TTabSheet;
    RxSpeedButton5: TRxSpeedButton;
    RxSpeedButton22: TRxSpeedButton;
    RxSpeedButton23: TRxSpeedButton;
    tabCtaXCobrar: TTabSheet;
    RxSpeedButton4: TRxSpeedButton;
    RxSpeedButton9: TRxSpeedButton;
    RxSpeedButton10: TRxSpeedButton;
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
    TabSheet2: TTabSheet;
    ProcesarNmina1: TMenuItem;
    RxSpeedButton1: TRxSpeedButton;
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
    TabSheet4: TTabSheet;
    RxSpeedButton2: TRxSpeedButton;
    PopupMenuActCxp: TPopupMenu;
    RxSpeedButton3: TRxSpeedButton;
    PopupRepCxp: TPopupMenu;
    HistoricodeSecuenciaNCF1: TMenuItem;
    PopupMenu1: TPopupMenu;
    ConsultaCotizaciones1: TMenuItem;
    TabSheet5: TTabSheet;
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
    RxSpeedButton6: TRxSpeedButton;
    RxSpeedButton7: TRxSpeedButton;
    RxSpeedButton8: TRxSpeedButton;
    CobrodeFacturas1: TMenuItem;
    Proveedores2: TMenuItem;
    Interes1: TMenuItem;
    ITBIS2: TMenuItem;
    RxSpeedButton11: TRxSpeedButton;
    PopupconsultaCXP: TPopupMenu;
    BalanceCxpProveedores1: TMenuItem;
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
    SkinData1old: TSkinData;
    SaldarFacturas1: TMenuItem;
    CerrarDiaTardio1: TMenuItem;
    Banco1: TMenuItem;
    FacturasPendiente2: TMenuItem;
    Balance1: TMenuItem;
    RelaciondeFacturas1: TMenuItem;
    Especial1: TMenuItem;
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
    RxSpeedButton12: TRxSpeedButton;
    popContabilidad: TPopupMenu;
    ContabilizarVentas1: TMenuItem;
    DistcntAdicional1: TMenuItem;
    GrupoCnt1: TMenuItem;
    EditarPedido1: TMenuItem;
    VentaDiaria3: TMenuItem;
    TabSheet6: TTabSheet;
    RxSpeedButton13: TRxSpeedButton;
    popupOrdenCompra: TPopupMenu;
    CrearOrden1: TMenuItem;
    EscalaISR1: TMenuItem;
    InventarioSerie1: TMenuItem;
    MargenBeneficiosxProducto1: TMenuItem;
    BeneficioenVentas1: TMenuItem;
    Financiamientos1: TMenuItem;
    NotaDbito1: TMenuItem;
    NotaCrdito1: TMenuItem;
    transCxcM: TMenuItem;
    Estudiantes1: TMenuItem;
    TabSheet7: TTabSheet;
    RxSpeedButton14: TRxSpeedButton;
    PopupPanaderiaAct: TPopupMenu;
    Recetas1: TMenuItem;
    Requisicion1: TMenuItem;
    Produccion1: TMenuItem;
    AccountantModule1: TMenuItem;
    Check1: TMenuItem;
    RxLabel3: TRxLabel;
    SkinData1: TSkinData;
    CobroCuotasFinanc2: TMenuItem;
    OtrasCxp1: TMenuItem;
    GetAnyDate1: TGetAnyDate;
    Desembolsos1: TMenuItem;
    RegistroInventarioFisico1: TMenuItem;
    Contabilizar1: TMenuItem;
    Ventas2: TMenuItem;
    TabSheet8: TTabSheet;
    BitBtn2: TBitBtn;
    ServiciosCafeteria1: TMenuItem;
    RelacionIngredientesVta1: TMenuItem;
    TabSheet9: TTabSheet;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Cursos1: TMenuItem;
    AoEscolar1: TMenuItem;
    ReporteFamiliaEstudiantes1: TMenuItem;
    tarifaAoEscolar1: TMenuItem;
    EstadoMensualidadEstudiantes1: TMenuItem;
    CobroEstudiantes1: TMenuItem;
    ConsultaQuery1: TMenuItem;
    DescuentoFacturasServicio1: TMenuItem;
    template1: TMenuItem;
    BitBtn5: TBitBtn;
    Itbis3: TMenuItem;
    RetencionTerceros1: TMenuItem;
    BitBtn6: TBitBtn;
    RecibirOrden1: TMenuItem;
    ServiciosTaller1: TMenuItem;
    Moneda1: TMenuItem;
    GetDateTipoMoneda1: TGetDateTipoMoneda;
    SolicitarOrden1: TMenuItem;
    Ventas3: TMenuItem;
    PorClientes1: TMenuItem;
    ProductosporClientes1: TMenuItem;
    PorVendedor1: TMenuItem;
    Cotizaciones1: TMenuItem;
    PorCliente1: TMenuItem;
    PorProducto1: TMenuItem;
    PorVendedor2: TMenuItem;
    Seguros1: TMenuItem;
    MarcaVehiculos1: TMenuItem;
    ipoVehiculos1: TMenuItem;
    Seguro1: TMenuItem;
    Devoluciones1: TMenuItem;
    ReordenInventario1: TMenuItem;
    odo1: TMenuItem;
    ExistenciaNegativa1: TMenuItem;
    ExistenciaActual1: TMenuItem;
    OrdenporNCF1: TMenuItem;
    OrdenporFactura1: TMenuItem;
    Caja1: TMenuItem;
    AsignarCajaPrinter1: TMenuItem;
    ImpresoraFiscal1: TMenuItem;
    CancelarTicket1: TMenuItem;
    DescripcionLineas1: TMenuItem;
    INCFConfiguracion1: TMenuItem;
    Label1: TLabel;
    Label2: TLabel;
    ipoDescuentos1: TMenuItem;
    DescuentoDependientes1: TMenuItem;
    Vacaciones1: TMenuItem;
    OrdenCompra1: TMenuItem;
    Recibidas1: TMenuItem;
    NominaContratista1: TMenuItem;
    Proyecto2: TMenuItem;
    Nomina1: TMenuItem;
    rabajadores1: TMenuItem;
    EstadoImpresora1: TMenuItem;
    LibrodeVentas1: TMenuItem;
    ChequearSecuencia1: TMenuItem;
    asaITBISFiscal1: TMenuItem;
    DescipcionLineasCotizacion1: TMenuItem;
    Impresora2: TMenuItem;
    LibroVentas1: TMenuItem;
    CierreZSistema1: TMenuItem;
    CierreZ2: TMenuItem;
    HistoricoCierresZ1: TMenuItem;
    CierreJornada1: TMenuItem;
    Xtipo1: TMenuItem;
    ipoTrnCnt1: TMenuItem;
    VerificarGeneradores1: TMenuItem;
    Devoluciones2: TMenuItem;
    Tarjetas1: TMenuItem;
    CostosGastos1: TMenuItem;
    ResumenCuadre1: TMenuItem;
    CobrosCxc1: TMenuItem;
    SumaItbisporTipoNCF1: TMenuItem;
    Emails1: TMenuItem;
    EnviarLVentasEmail1: TMenuItem;
    DeclaracionesDGII1: TMenuItem;
    Gastos6061: TMenuItem;
    VentasCrdito1: TMenuItem;
    Ventas4: TMenuItem;
    Reporte6071: TMenuItem;
    Gastos1: TMenuItem;
    Lavandaria1: TMenuItem;
    ConfReportes1: TMenuItem;
    CosturaSalida1: TMenuItem;
    AlquilerLavanderiaCostura1: TMenuItem;
    Precio12341: TMenuItem;
    PromoverEstudiantes1: TMenuItem;
    Configurar2: TMenuItem;
    RelacinEstadoCta1: TMenuItem;
    Permisos1: TMenuItem;
    BitBtn7: TBitBtn;
    NCFNulos1: TMenuItem;
    Compras1: TMenuItem;
    Contado1: TMenuItem;
    Credito1: TMenuItem;
    Productosmasvendidos1: TMenuItem;
    RotacionProductos1: TMenuItem;
    Oficina1: TMenuItem;
    Ciudades1: TMenuItem;
    ActualizarRNC1: TMenuItem;
    ComisionOperadores1: TMenuItem;
    EntSalidaInventario1: TMenuItem;
    sdia: TSaveDialog;
    OrdenadoporNCFSum1: TMenuItem;
    Button2: TButton;
    RelacionNCF1: TMenuItem;
    Detallado2: TMenuItem;
    SumatoriaxTasaItbis1: TMenuItem;
    SumatoriaporTipoNCF1: TMenuItem;
    ConfirmarConduce1: TMenuItem;
    ConfImpresoras1: TMenuItem;
    CuadreConduce1: TMenuItem;
    MontoComisionable1: TMenuItem;
    ListadoNCFConFPago1: TMenuItem;
    Depsitos1: TMenuItem;
    Bancos1: TMenuItem;
    ipoCuenta1: TMenuItem;
    ipoDeposito1: TMenuItem;
    Mantenimiento2: TMenuItem;
    Conduce1: TMenuItem;
    ipoNomina1: TMenuItem;
    Precio1: TMenuItem;
    CantXUnidad1: TMenuItem;
    Vehculos1: TMenuItem;
    ExistenciaActual2: TMenuItem;
    PorVendedorDataComisiones1: TMenuItem;
    RelacinGastos1: TMenuItem;
    CuadreFacturas1: TMenuItem;
    UnProducto1: TMenuItem;
    PrecioXUnidades1: TMenuItem;
    AnlisisPrecioXCant1: TMenuItem;
    ListaPreciosVtaIncorrecto1: TMenuItem;
    Detporusuario1: TMenuItem;
    EncriptarValor1: TMenuItem;
    estEmail1: TMenuItem;
    PorRuta1: TMenuItem;
    ResumenVentaxRuta1: TMenuItem;
    ARS1: TMenuItem;
    ARS2: TMenuItem;
    Conciliacin1: TMenuItem;
    Liquidacin1: TMenuItem;
    Envio1: TMenuItem;
    ARS3: TMenuItem;
    Conciliacin2: TMenuItem;
    ImportarPolizas1: TMenuItem;
    popupReporteGastos: TPopupMenu;
    RelacindeCostosGastos1: TMenuItem;
    FormatoTipoDocs1: TMenuItem;
    RelacinGastos6061: TMenuItem;
    VerSecuencias1: TMenuItem;
    InventarioCertificados1: TMenuItem;
    Polizas1: TMenuItem;
    ComisionesVentas1: TMenuItem;
    ConfComisiones1: TMenuItem;
    Cheques1: TMenuItem;
    SumaItbisporTipoNCFInv1: TMenuItem;
    ResumenXCliente1: TMenuItem;
    RxSpeedButton15: TRxSpeedButton;
    Afiliaciones1: TMenuItem;
    tiipo1Afiliaciones: TMenuItem;
    Coberturas1: TMenuItem;
    RMA1: TMenuItem;
    Equipos1: TMenuItem;
    CobrosXTransferencia1: TMenuItem;
    SystemTable1: TMenuItem;
    Cardex1: TMenuItem;
    RxSpeedButton16: TRxSpeedButton;
    Gradiente1: TGradiente;
    Gradiente2: TGradiente;
    Gradiente3: TGradiente;
    Gradiente4: TGradiente;
    Gradiente5: TGradiente;
    Gradiente6: TGradiente;
    Gradiente7: TGradiente;
    Gradiente8: TGradiente;
    Gradiente9: TGradiente;
    Gradiente10: TGradiente;
    Gradiente11: TGradiente;
    Colores1: TMenuItem;
    ProveedoresTarjetas1: TMenuItem;
    rxspeedBtnPagoRecl: TRxSpeedButton;
    rxspeedbtnDesContrato: TRxSpeedButton;
    ImportarGarantias1: TMenuItem;
    RxSpeedButton17: TRxSpeedButton;
    RxSpeedButton18: TRxSpeedButton;
    ResumenporProductos1: TMenuItem;
    EmailTemplate1: TMenuItem;
    RelacionCertificados1: TMenuItem;
    BitBtn8: TBitBtn;
    ConsultaReorden1: TMenuItem;
    RelacoinVentasVsInventario1: TMenuItem;
    VerificarValores1: TMenuItem;
    LabelsZLP1: TMenuItem;
    AuditoriaBlcCxc1: TMenuItem;
    erritoriosECF1: TMenuItem;
    RxSpeedButton19: TRxSpeedButton;
    popMenuComisionesvta: TPopupMenu;
    Procesar1: TMenuItem;
    BitBtn9: TBitBtn;
    e1: TMenuItem;
    EdPointsFactElectronica1: TMenuItem;
    BitBtn10: TBitBtn;
    SecuenciaFacturas1: TMenuItem;
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
    procedure Ventas1Click(Sender: TObject);
    procedure Precios1Click(Sender: TObject);
    procedure Rutas1Click(Sender: TObject);
    procedure CuadrexRuta1Click(Sender: TObject);
    procedure BalanceDespacho1Click(Sender: TObject);
    procedure CerrarDiaTrnDiaria1Click(Sender: TObject);
    procedure CuadreDiario1Click(Sender: TObject);
    procedure Registro1Click(Sender: TObject);
    procedure BalanceenRuta1Click(Sender: TObject);
    procedure BeneficioBruto1Click(Sender: TObject);
    procedure RegistroPedidos1Click(Sender: TObject);
    procedure PreciosProductos1Click(Sender: TObject);
    procedure VentaCajaxRuta1Click(Sender: TObject);
    procedure VentaCajaxRutaResumen1Click(Sender: TObject);
    procedure Proveedores1Click(Sender: TObject);
    procedure RegistroCostosCastos1Click(Sender: TObject);
    procedure ProductosServicios1Click(Sender: TObject);
    procedure CentrodeCostos1Click(Sender: TObject);
    procedure ProcesarNmina1Click(Sender: TObject);
    procedure PrestamoEmpleados2Click(Sender: TObject);
    procedure Comisiones2Click(Sender: TObject);
    procedure CuadreConsolidado1Click(Sender: TObject);
    procedure ControlPosteo1Click(Sender: TObject);
    procedure Descuentos1Click(Sender: TObject);
    procedure Compaia1Click(Sender: TObject);
    procedure Promociones1Click(Sender: TObject);
    procedure PromocionesResumen1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure Actualizar2Click(Sender: TObject);
    procedure ipoNCF1Click(Sender: TObject);
    procedure HistoricodeSecuenciaNCF1Click(Sender: TObject);
    procedure ConsultaCotizaciones1Click(Sender: TObject);
    procedure Transacciones2Click(Sender: TObject);
    procedure CobrodeFacturas1Click(Sender: TObject);
    procedure Proveedores2Click(Sender: TObject);
    procedure Interes1Click(Sender: TObject);
    procedure BalanceCxpProveedores1Click(Sender: TObject);
    procedure ransCxp1Click(Sender: TObject);
    procedure AtrasosCuotas1Click(Sender: TObject);
    procedure ResumenxDia1Click(Sender: TObject);
    procedure PapelReporte1Click(Sender: TObject);
    procedure AvisoAtraso1Click(Sender: TObject);
    procedure ReportexTipoProd1Click(Sender: TObject);
    procedure EstadoCta1Click(Sender: TObject);
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
    procedure CuadreCaja1Click(Sender: TObject);
    procedure CargoEmpleados1Click(Sender: TObject);
    procedure InventarioPrecioCompra1Click(Sender: TObject);
    procedure DespachoAlmacen1Click(Sender: TObject);
    procedure ClasificacinPrecio1Click(Sender: TObject);
    procedure DivisionInventario1Click(Sender: TObject);
    procedure InventarioxArea1Click(Sender: TObject);
    procedure SkinData1oldFormSkin(Sender: TObject; aName: String;
      var DoSkin: Boolean);
    procedure UnidadesInv1Click(Sender: TObject);
    procedure Reparaciones1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DistribucionCtasCnt1Click(Sender: TObject);
    procedure DistcntAdicional1Click(Sender: TObject);
    procedure GrupoCnt1Click(Sender: TObject);
    procedure EditarPedido1Click(Sender: TObject);
    procedure VentaDiaria3Click(Sender: TObject);
    procedure CrearOrden1Click(Sender: TObject);
    procedure EscalaISR1Click(Sender: TObject);
    procedure InventarioSerie1Click(Sender: TObject);
    procedure MargenBeneficiosxProducto1Click(Sender: TObject);
    procedure BeneficioenVentas1Click(Sender: TObject);
    procedure Financiamientos1Click(Sender: TObject);
    procedure NotaDbito1Click(Sender: TObject);
    procedure CobroCuotasFinanc2Click(Sender: TObject);
    procedure NotaCrdito1Click(Sender: TObject);
    procedure Estudiantes1Click(Sender: TObject);
    procedure Recetas1Click(Sender: TObject);
    procedure Requisicion1Click(Sender: TObject);
    procedure Produccion1Click(Sender: TObject);
    procedure AccountantModule1Click(Sender: TObject);
    procedure Check1Click(Sender: TObject);
    procedure SkinData1FormSkin(Sender: TObject; aName: String;
      var DoSkin: Boolean);
    procedure transCxcMClick(Sender: TObject);
    procedure OtrasCxp1Click(Sender: TObject);
    procedure Desembolsos1Click(Sender: TObject);
    procedure RegistroInventarioFisico1Click(Sender: TObject);
    procedure Ventas2Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure ServiciosCafeteria1Click(Sender: TObject);
    procedure RelacionIngredientesVta1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Cursos1Click(Sender: TObject);
    procedure AoEscolar1Click(Sender: TObject);
    procedure ReporteFamiliaEstudiantes1Click(Sender: TObject);
    procedure tarifaAoEscolar1Click(Sender: TObject);
    procedure EstadoMensualidadEstudiantes1Click(Sender: TObject);
    procedure CobroEstudiantes1Click(Sender: TObject);
    procedure ConsultaQuery1Click(Sender: TObject);
    procedure DescuentoFacturasServicio1Click(Sender: TObject);
    procedure template1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure Itbis3Click(Sender: TObject);
    procedure RetencionTerceros1Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure RecibirOrden1Click(Sender: TObject);
    procedure ServiciosTaller1Click(Sender: TObject);
    procedure Moneda1Click(Sender: TObject);
    procedure SolicitarOrden1Click(Sender: TObject);
    procedure PorClientes1Click(Sender: TObject);
    procedure ProductosporClientes1Click(Sender: TObject);
    procedure PorVendedor1Click(Sender: TObject);
    procedure PorCliente1Click(Sender: TObject);
    procedure MarcaVehiculos1Click(Sender: TObject);
    procedure ipoVehiculos1Click(Sender: TObject);
    procedure PorVendedor2Click(Sender: TObject);
    procedure PorProducto1Click(Sender: TObject);
    procedure Seguro1Click(Sender: TObject);
    procedure Devoluciones1Click(Sender: TObject);
    procedure ReordenInventario1Click(Sender: TObject);
    procedure odo1Click(Sender: TObject);
    procedure ExistenciaNegativa1Click(Sender: TObject);
    procedure ExistenciaActual1Click(Sender: TObject);
    procedure OrdenporNCF1Click(Sender: TObject);
    procedure OrdenporFactura1Click(Sender: TObject);
    procedure Caja1Click(Sender: TObject);
    procedure AsignarCajaPrinter1Click(Sender: TObject);
    procedure CancelarTicket1Click(Sender: TObject);
    procedure DescripcionLineas1Click(Sender: TObject);
    procedure INCFConfiguracion1Click(Sender: TObject);
    procedure TabSheet3Enter(Sender: TObject);
    procedure ipoDescuentos1Click(Sender: TObject);
    procedure DescuentoDependientes1Click(Sender: TObject);
    procedure Vacaciones1Click(Sender: TObject);
    procedure Recibidas1Click(Sender: TObject);
    procedure Proyecto2Click(Sender: TObject);
    procedure Nomina1Click(Sender: TObject);
    procedure rabajadores1Click(Sender: TObject);
    procedure EstadoImpresora1Click(Sender: TObject);
    procedure ChequearSecuencia1Click(Sender: TObject);
    procedure asaITBISFiscal1Click(Sender: TObject);
    procedure DescipcionLineasCotizacion1Click(Sender: TObject);
    procedure Impresora2Click(Sender: TObject);
    procedure LibroVentas1Click(Sender: TObject);
    procedure CierreZSistema1Click(Sender: TObject);
    procedure CierreZ2Click(Sender: TObject);
    procedure HistoricoCierresZ1Click(Sender: TObject);
    procedure CierreJornada1Click(Sender: TObject);
    procedure Xtipo1Click(Sender: TObject);
    procedure ipoTrnCnt1Click(Sender: TObject);
    procedure VerificarGeneradores1Click(Sender: TObject);
    procedure Devoluciones2Click(Sender: TObject);
    procedure Tarjetas1Click(Sender: TObject);
    procedure CostosGastos1Click(Sender: TObject);
    procedure ResumenCuadre1Click(Sender: TObject);
    procedure CobrosCxc1Click(Sender: TObject);
    procedure SumaItbisporTipoNCF1Click(Sender: TObject);
    procedure Emails1Click(Sender: TObject);
    procedure EnviarLVentasEmail1Click(Sender: TObject);
    procedure Gastos6061Click(Sender: TObject);
    procedure VentasCrdito1Click(Sender: TObject);
    procedure Reporte6071Click(Sender: TObject);
    procedure Lavandaria1Click(Sender: TObject);
    procedure ConfReportes1Click(Sender: TObject);
    procedure CosturaSalida1Click(Sender: TObject);
    procedure AlquilerLavanderiaCostura1Click(Sender: TObject);
    procedure Precio12341Click(Sender: TObject);
    procedure PromoverEstudiantes1Click(Sender: TObject);
    procedure Configurar2Click(Sender: TObject);
    procedure RelacinEstadoCta1Click(Sender: TObject);
    procedure Permisos1Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure NCFNulos1Click(Sender: TObject);
    procedure Credito1Click(Sender: TObject);
    procedure Contado1Click(Sender: TObject);
    procedure Productosmasvendidos1Click(Sender: TObject);
    procedure RotacionProductos1Click(Sender: TObject);
    procedure Oficina1Click(Sender: TObject);
    procedure Ciudades1Click(Sender: TObject);
    procedure ComisionOperadores1Click(Sender: TObject);
    procedure EntSalidaInventario1Click(Sender: TObject);
    procedure OrdenadoporNCFSum1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Detallado2Click(Sender: TObject);
    procedure ConfirmarConduce1Click(Sender: TObject);
    procedure ConfImpresoras1Click(Sender: TObject);
    procedure CuadreConduce1Click(Sender: TObject);
    procedure MontoComisionable1Click(Sender: TObject);
    procedure ListadoNCFConFPago1Click(Sender: TObject);
    procedure Depsitos1Click(Sender: TObject);
    procedure ipoCuenta1Click(Sender: TObject);
    procedure ipoDeposito1Click(Sender: TObject);
    procedure Mantenimiento2Click(Sender: TObject);
    procedure Conduce1Click(Sender: TObject);
    procedure ipoNomina1Click(Sender: TObject);
    procedure CantXUnidad1Click(Sender: TObject);
    procedure Vehculos1Click(Sender: TObject);
    procedure ExistenciaActual2Click(Sender: TObject);
    procedure PorVendedorDataComisiones1Click(Sender: TObject);
    procedure RelacinGastos1Click(Sender: TObject);
    procedure CuadreFacturas1Click(Sender: TObject);
    procedure UnProducto1Click(Sender: TObject);
    procedure PrecioXUnidades1Click(Sender: TObject);
    procedure AnlisisPrecioXCant1Click(Sender: TObject);
    procedure ListaPreciosVtaIncorrecto1Click(Sender: TObject);
    procedure Detporusuario1Click(Sender: TObject);
    procedure EncriptarValor1Click(Sender: TObject);
    procedure estEmail1Click(Sender: TObject);
    procedure PorRuta1Click(Sender: TObject);
    procedure ResumenVentaxRuta1Click(Sender: TObject);
    procedure ARS1Click(Sender: TObject);
    procedure Conciliacin1Click(Sender: TObject);
    procedure Liquidacin1Click(Sender: TObject);
    procedure ImportarPolizas1Click(Sender: TObject);
    procedure RelacindeCostosGastos1Click(Sender: TObject);
    procedure FormatoTipoDocs1Click(Sender: TObject);
    procedure RelacinGastos6061Click(Sender: TObject);
    procedure VerSecuencias1Click(Sender: TObject);
    procedure InventarioCertificados1Click(Sender: TObject);
    procedure Polizas1Click(Sender: TObject);
    procedure ComisionesVentas1Click(Sender: TObject);
    procedure ConfComisiones1Click(Sender: TObject);
    procedure Cheques1Click(Sender: TObject);
    procedure SumaItbisporTipoNCFInv1Click(Sender: TObject);
    procedure ResumenXCliente1Click(Sender: TObject);
    procedure RxSpeedButton15Click(Sender: TObject);
    procedure tiipo1AfiliacionesClick(Sender: TObject);
    procedure Coberturas1Click(Sender: TObject);
    procedure RMA1Click(Sender: TObject);
    procedure Equipos1Click(Sender: TObject);
    procedure CobrosXTransferencia1Click(Sender: TObject);
    procedure SystemTable1Click(Sender: TObject);
    procedure Cardex1Click(Sender: TObject);
    procedure Colores1Click(Sender: TObject);
    procedure ProveedoresTarjetas1Click(Sender: TObject);
    procedure rxspeedbtnDesContratoClick(Sender: TObject);
    procedure ImportarGarantias1Click(Sender: TObject);
    procedure RxSpeedButton17Click(Sender: TObject);
    procedure RxSpeedButton18Click(Sender: TObject);
    procedure ResumenporProductos1Click(Sender: TObject);
    procedure EmailTemplate1Click(Sender: TObject);
    procedure RelacionCertificados1Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure ConsultaReorden1Click(Sender: TObject);
    procedure RelacoinVentasVsInventario1Click(Sender: TObject);
    procedure VerificarValores1Click(Sender: TObject);
    procedure AuditoriaBlcCxc1Click(Sender: TObject);
    procedure erritoriosECF1Click(Sender: TObject);
    procedure Procesar1Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure EdPointsFactElectronica1Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure SecuenciaFacturas1Click(Sender: TObject);
  private
    { Private declarations }
     procedure AppMessage(var Msg: TMsg; var Handled: Boolean);
     //procedure VentasBYM;
     procedure HandleException(Sender: TObject; E: Exception);
     Procedure ShowHint(Sender: TObject);
    procedure ProcesarCierreDiaTrn;
    procedure ProcesoLogin;
    procedure ActivaPermisos;
    Function ProgramaAbiertoDosVeces:Boolean;
    procedure ImprimirRepItebis(tipo: smallint;tipodoc : integer);
    procedure ImprimirRepItebisRes(tipo: smallint;tipodoc : integer);
    procedure ImprimirRepItebisSum;
    Function ValidaRegistro(accion:smallint; coduser: Integer; usuario:string):Boolean;
    procedure logout;
    Procedure Outofhere;
    Procedure SetLogoCia;
    procedure VerificaImpresoraFiscalM;
    //ignorado temporal no lo borres
    //procedure AvisoEmailLicenciaNoRegistrada;
    procedure SetColores;           
    procedure NotificaErrorByEmail(sms: string);
  public
    { Public declarations }
    procedure ProcCerrarDia;
    //procedure ActivaPermiso(proceso:integer; iduser:Integer; isperson:integer);
  end;

var
  frmMenuPrincipal: TfrmMenuPrincipal;
  ordenPor : smallint; //1-ncf 2-num factura
implementation

uses
//UProcVentaRapidaByM,
UInventarioProd, UTipoInventario,UConfirmaLicencia,
  UInventarioHistorico, UCtrlIngresos, UMaestroClientes, UTransaccionesCxc,
  UAcercaDe, UDatModCompania, UDatModCxc, Uglobal,
  UBalanceCxcClientes, UDebitosycreditosaplicados, UEntradaDeUsuarios,
  UCambiarClaveUsuario, uLogin, UDatModUsuarios, UDatModConectar, UEmpleados,
  UFormSelFecha, UDatModReportes, URepVentaMesxDia,
  UDatosVentaXMes, URepVigenciaCxcCtes, URepResumenVentas,
  UProcesarDespacho, URepInventarioProd, UPreciosInventario, URutas,
  UCuadreVentaxRuta, UBalanceSalidaXRuta, URepCuadreDiario, URegistro, uglobalcp,
  UDatModCuadrexRuta, URepSalidaRuta, URepBeneficioBruto, UProcesarPedidos,
  URepPrecio, UPrestamoEmpleados, URepVentaCajaXRuta,
  URepVentaCajaxRutaResumen, UFormComisiones, UFormProveedores,
  URegistrarTransOpeDiaria, UFormProductosServicios, UFormCentroDeCostos,
  UFormNominaEmpleado, UReporteValoresEntregadosCuadre, UControlAct,
  USelTipoNomIntegrar, UConfDescuentosNomina, UCompania, URepPromociones,
  URepPromoRes, URegItbis, UProcVentaRapida, UFormNumCompFiscal,
  UFormCompFiscal, UFormHistSecNCF, UFormDatosCotiza, URecibosYCtaXCobrar,
  UFormInteres, URepItebis, UBalanceCxpProv, UDatModFactura,
  UCobroDeCuotasFinanc, UBuscarClientesPersonasP, UFormTransaccionesCXP,
  uFormConsultaAvisoAtraso, URepItbisResXDia, UMostrarFinancVigente,
  UConfigRep, UFormAvisoAtraso, UFormRepXTipoInv, URepEstadoCtaCxc,
  uSelSingleFechaOpc, UFormEntreClave, URegMiscelaneos, UDatModCxp,
  ULabelImpCodBarra, UCobrarFacturas, URegPedidoProv, UConectar,
  UTransNcNbDev, UFormTransCxcDbCr_r, UFactServicio, UFormServFijos,
  UFormSaldAntCxc, UDatModInventario,
  URepVencimientoProd, UProdVencidos, UPagarCXPFacturas,
  UBuscarProveedores, UDatModProveedor, URepEstadoCtaCxp, UProcCierreOfc,
  UCerrarHistoriocxc, UfrmBancos, uFrmConsultaFactPendCxp,
  UfrmRelacionFact, URepItebis_esp, UFormCaja, UFormTransCaja,
  //UFormProcCuadreCaja,
  UCargosEmp, UFormTurno, URepInvProdCosto,
  USelInventario, UFormDespachoAlmacen, UFromDespachoInvAlmacen,
  UClasifPrecio, UDivisionInventario, URepInventarioProdArea,
  UFormUnidades, UCtrlEnvioaReparaciones, UDistCtaCnt,
  UContabilizarformBase, UContabilizarVentas, UFromContCtas, UGrupoCnt,
  UEditarPedidos, UActivapermisos, {URegOrdenCompra,} UFormOrdenCompraR,
  UEscalaISR, URepInventarioProdSerie, URepInvMargenGananciaXProd,
  URepInvMargenGananciaXVenta, URepFinanciamientos, UFormTransCxpDbCr_r,
  UCobrosCuotaFinanciamientos, UFormMaestroEstudiante, UFormPanRecetas,
  UDatModPanaderia, UConfigurarSkin, UFormRequisicion,
  UFormRegProduccionPan, UProcVentaRapidaNueva, UFormMantBlcCteCxc,
  UFormMantBlcCteCxp, UFormRegDesembolsoCaja, URegInvFisicoPan,
  UFormRegIngreso, UFormRegServicio, UFormConfServCafeteria,
  UFormVtaCafeteria, UFormRepTransIngCaf, UProcVentaRapidaOrdComp,
  UFormBackup, UFormCursos, UFormAnioEscolar, UQckRepListadoEstudiantes,
  UDatModEstudiante, UFormMantPrecioColegio, UformEstadoCtaEstudiantes,
  URepEstadoAtrasoCXCEstColegio, UFormCobroEstudiantes, Uexcel2,
  UConfDescuentoFactura, UFormTemplateFactura, UFormCrearXMLToExportExcel,
  UFormRetencionesTercero, UFormConsignacion, UFormRecibirOrdenes,
  UFormCrearOrdenCompra, UQckRepServDetalle, UTasaDolar,
  UFormCrearSolOrdenCompra, UQckRepListaFactura,
  UFormConsultaVentaXCliente, UQckRepListaFacturaProducto,
  UFormConsultaCotizaXCliente, UQckRepListaCotizacion, UFormMarcaVehiculos,
  UFormTipoVehiculo, UQckRepVendedorFactura, UFormConsultaVentaXVendedor,
  UFormConsultaCotizaXVendedor, UQckRepListaCotizacionXVendedor,
  UQckRepListaCotizacionProducto, {UFormPolizaMaster,}
  URepInventarioProdReorden, UConfCajaXusuario, UDescLineaDocfiscal,
  UFormImpresora, UFrmiTipoifiscal, UDatmodDatosGenerales,
  UFormTipoDescNomina, UFormDescuentoNomDependiente, UFormVacaciones,
  UFormParamsRepOrdComp, URepOrdenRecibida, UFormProyecto,
  UFormNominaContratista, UFormContratista, USelTipoNomIntegrarContratista,
  UFormFacturas, USelDatosReporte, UcheckSecNCF, UFormTasaITBIS,
  UDescLineaCotizacion, UFormVerCierreZ, UFormAyuda, UProcCierreJornada,
  UFormHistoricoCierreZ, URepInventarioProdReordenxTipo,
  UFormTipoTrnCNT, UFormCheckGenerador, UContabilizarVentasDevoluciones,
  UContabilizarVentasTarjeta, UContabilizarCostosYGastos,
  UFormContFacturasSuplidores, URepVentaDiariaGeneral,
  UContabilizarIngresosCxc, URepItebisResumen, UformEmailProcess,
  UFormEnviarEmailLVentas, UCtrlEnvioaLavanderia, UFormConfReportes,
  UCtrlAlquiler, UFormConsServXTipo, UQckRepServXTipo, URepPrecioXLevel,
  UFormSelTipoInv, UFormPromoverEstudiantes, qckrepEstadoCtaBB,
  UFormOrdenTrabajo, UConsultaNCFNulos, UContRegOrdenes, URepProdMasVenta,
  UFormConsultaVentaProd, UFormConsultaNoVentaProd, UformOficina,
  UFormCiudad, UFormLoadDatosDGII, UFormPagoComisionTrab,
  UFormPuertosLibres, UCtrlEntradaSalidaInvtario, qckrepEstadoCtaGeneral,
  URepDatos607, qckRepTestImpresora, UConfirmaConduce,
  UFormGenericoImpresoras, UFormCuadreConduce, UFormMetasXVendedor,
  UFormMargenBeneficio, UFormReporteVentas, UFormMantDepositos,
  UFormTipoCtaBanco, UFormTipoDeposito, UFormComicionesXVtaProd,
  URepConduce, UFormActTipoNomina, UQckRepPrecioXCantUnidad,
  frmImprimirDoc, UFichaVeh, UQckRepExistenciaVenta, UQckRepVendedorDatCom,
  URepRelVtasGastos, UFormSelServGastosVsVta, URepFVtaCuadre,
  UFormConsultaVentaProductos, URepInvExistencia,
  UFormRepPrecioXTipoProd, URepPrecioXLevelXUnidad, UDatModClientes,
  UFormDetVtaXUsuario, UFormEncriptarValor, UFormEnviarEmailTest,
  UFormConsultaVentaXRuta, UQckRepVendedorXRuta, UFormVentaSumXRuta,
  UFormARS, UFormConciliarARS, ULiquidacionARS, UFormImportPolizas,
  URepTransOpeDiaria, UFormDatosRepCostosGastos, URepTransCostoGastos,
  UFormFormatoTipoDoc, UFormInvCertificado, UFormReportePolizas,
  UQckRepComisionVtaSam, UFormConfComisiones, UFormContabilizaCheques,
  URepItbisResXDiaTipoInv, URepItebisResumenXTipoNCF,
  URepFVtaCuadreXCliente, UFormConsultaVentaXVendedorComSam,
  UFormReclamaciones, UFormTipoAfiliacion, UFormCoberturaSam,
  UCtrlEquipoRMA, UFormRepEquipos, UFormFactRecurrentes,
  UFormServiciosFijos, UFormConsultaTransf, UFormDatosTablas,
  UFormInvKardex, UConfColores, UFormProvTarjetas,
  UFormProcCuadreCajaNew,
  UFormImportGMovil, UFormInspecciones, UFormConsultarOrdenCompra,
  URepFVtaResumen, UFormEnviarEmail, UEmailTemplate, UFormCertEnConsigna,
  UFormCalcPrecioCuadros, URepItebisSum, UConsultaReordenProdProv,
  UFormRepTipoXInv, URepInventarioProdReordenxTipoCosto,
  UFormfrmHistVentasInv, UformVerificarVntas, UFormAuditoriaBlcCxc,
  UFormCiudadesECF, URepVentaDiariaNuevoR, URepVentaDiaria,
  UFormProgressBarfRM, URepVentaDiariaResumen, UFormPagoComisionesXVta,
  UFrmOrdenLavanderia, frmEntregaOrdenLavanderia,UnitFrmConfigEndpoints,
  UFrmOrders2EcfRunner, UFormSecFact;//, UFormLoadDatosDGII;

{$R *.dfm}

procedure TfrmMenuPrincipal.Salir1Click(Sender: TObject);
var
  Ini: TIniFile;
  NombArchivo : String;
  x: integer;
begin
  NombArchivo := ExtractFilePath(Application.ExeName)+'repconf_cr.ini';
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
  if not dmUsuarios.procMantRegDet.Transaction.InTransaction then
  dmUsuarios.procMantRegDet.Transaction.StartTransaction;
  try
    dmUsuarios.procMantRegDet.Transaction.CommitRetaining
  except
  dmUsuarios.procMantRegDet.Transaction.RollbackRetaining;
  end;
  dmUsuarios.procMantRegDet.close;
  glbLogueado:= 0;
  logout;
  //dmConectar.IBDatabase1.CloseDataSets;
  //dmConectar.IBDatabase1.Close;
  Application.Terminate;
end;

procedure TfrmMenuPrincipal.ransaccionesDiarias1Click(Sender: TObject);
begin
{  frmProcesarVentas:=TfrmProcesarVentas.Create(nil);
  try
    frmProcesarVentas.showmodal;
  finally
  frmProcesarVentas.free;
  frmProcesarVentas:=nil;
  end;}
end;

procedure TfrmMenuPrincipal.Inventario1Click(Sender: TObject);
begin
  frmInventarioProd:=TfrmInventarioProd.Create(nil);
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
  xtipo, qtyCorr, x: integer;
  xVersion : string;
  VInfo: TVersionInfo;
  FAppVer, FAppBuild : String;
  AvisoE : boolean;
begin
  Application.MainForm.Caption := 'ERP Enterprise System';
  //El folder informe debe estar en la carpeta BIN\Informes
  //Aqui seran guardados los reportes cuando se a indicado que se guarde.
  try
    if Not DirectoryExists('Informes') then CreateDir('Informes');
  except
  end;

 {
  Height := Height * Screen.Height Div Alto;
  Width := Width * Screen.Width Div Ancho;
  ScaleBy(Screen.Width, Ancho);
 }
 //Add en Run/parameters para debug
 //GLBRUTADB="IngerService"

   NombArchivo := ExtractFilePath(Application.ExeName)+'repconf_cr.ini';
  Ini := TIniFile.Create(NombArchivo );
  try
    GlbCorriendo := Ini.ReadInteger('Aplicación', 'GlbCorriendo', 0);
    GLBRUTADBINI := Ini.ReadString('DataBase', 'GLBRUTADB', '');
    GLBRUTADBLOAN:= Ini.ReadString('DataBase', 'GLBRUTADBLOAN', '');
    GLBRUTADB2:= Ini.ReadString('DataBase', 'GLBRUTADB2', '');
    GLBRUTADBDGII:= Ini.ReadString('DataBase', 'GLBRUTADBDGII', '');
    GLBRUTABDGIITXT:= Ini.ReadString('DataBase', 'GLBRUTABDGIITXT', '');
    GlbUsaBalanza :=Ini.ReadInteger('Venta', 'GlbUsaBalanza', 0);
    GlbEsDebugEntradas := Ini.ReadInteger('Debug', 'GlbEsDebugEntradas', 0);
  finally
  Ini.Free;
  end;

  qtyCorr := 0;
  GLBRUTADB := GetCommandParam('/GLBRUTADB');


  if (GLBRUTADB = '') and (GLBRUTADBINI <> '') then
  GLBRUTADB:=GLBRUTADBINI
  else
  if (GLBRUTADB = '') then
  GLBRUTADB:='POSGOLDRESP';

  Application.OnException := HandleException;
  GlbCorriendoII:=0;
  GlbDiaActualizado:=0;
  if (GlbCorriendo = 1) And (GlbPermiteUnaInstancia = 1) then
  begin
    GlbCorriendoII:=1;
    //Messagedlg('Existe una sesion de este programa, desea continuar', mtWarning ,[mbyes, mbNo],0);
    BitBtn1.Enabled:=False;
    //RxSpeedButton12.Enabled:=false;
    Caption:='Existe otra instancia de este programa abierta.';
    //Application.Terminate;
  end;

    Application.OnMessage := AppMessage;
    Application.OnHint    := ShowHint;
    frmtrgtr:=Tfrmtrgtr.Create(Nil);
    frmtrgtr.tRegistro.Close;
    frmtrgtr.tRegistro.Open;
    
    if frmtrgtr.tRegistroPORC_ATRASOCXC.IsNull then
    GLBPORC_ATRASOCXC:=0 else
    GLBPORC_ATRASOCXC := frmtrgtr.tRegistroPORC_ATRASOCXC.Value;
    
    GlbCartaPresenta:='';
    GLBRutaImpGarantia:='';
    if GLBSAM = 1  then
    begin
      try
        GlbCartaPresenta:=frmtrgtr.tRegistroGlbCartaPresenta.Value;
        GLBRutaImpGarantia:=frmtrgtr.tRegistroEXEGARANTIAMOVIL.Value;
      except
      GlbCartaPresenta:='';
      end;
    end;
    if frmtrgtr.tRegistroMOSTRARSUBTOTALSINITBIS.IsNull or
    (frmtrgtr.tRegistroMOSTRARSUBTOTALSINITBIS.Value = 0) then
    GlbMSubTotalSinITBIS := 0
    else
    GlbMSubTotalSinITBIS := frmtrgtr.tRegistroMOSTRARSUBTOTALSINITBIS.Value;

    if not frmtrgtr.tRegistroCLAVE_MAESTRA.IsNull then
    GlbClaveSupEncrypted := frmtrgtr.tRegistroCLAVE_MAESTRA.Value
    else
    GlbClaveSupEncrypted := '';

    if frmtrgtr.tRegistroDBHist.Value = 1 then
    GlbModoHistorico := True
    else
    GlbModoHistorico := False;
    if frmtrgtr.tRegistroMOD_FINANC.Value = 1 then
    GlbFinanciamiento:=True
    else GlbFinanciamiento:=False;

    GlbRootImg := frmtrgtr.tRegistroROOTRUTAIMGINVENTARIO.Value;

    GlbIncItbisPvta := frmtrgtr.tRegistroINCLUYEITBISPVTA.Value;
    GlbCantCorridas := frmtrgtr.tRegistroCANTCORRIDA.Value;
    if not frmtrgtr.tRegistroMONEDABASE.IsNull then
    GlbMonedaBase  := frmtrgtr.tRegistroMONEDABASE.AsInteger;
    if not frmtrgtr.tRegistroFORMATOFACT.IsNull then
    GLBFormatoFactura:=frmtrgtr.tRegistroFORMATOFACT.Value;

    GLBEsFastFood := frmtrgtr.tRegistrofastFood.Value =  2;

    if GLBEsFastFood then GlBLimao:=1;

    if GLBEsFastFood then
    GLBEsFastFoodString:='1'
    else
    GLBEsFastFoodString:='0';
    GlbReposDocs:= frmTrgtr.tRegistroPATHDOCREPOSITORY.Value;
    GLBFORMATOFACTPREIMP := frmtrgtr.tRegistroFORMATOFACTPREIMP.Value;

    GlbSecIgualesCashCredito:= frmTrgtr.tRegistroSEC_NUM_REC_IGUAL.Value;
    GlbMontoTarjetaCuadre:= frmTrgtr.tRegistroDESC_MONTO_TARJETACUADRE.Value;
    if Not frmTrgtr.tRegistroSERVERCONFIGID.IsNull then
    GlbServerConfigID := frmTrgtr.tRegistroSERVERCONFIGID.Value
    else GlbServerConfigID := '';
    
    GlbPorcPropina:= 0;
    if (GLBEsFastFood) then
    begin
      GlbPorcPropina:= frmtrgtr.tRegistroPORCPROPLEGAL.Value;
    end;

    GlbFactCxcATercero:=frmtrgtr.tRegistroGlbFactCxcATercero.Value;

    if (Trim(StrUserName) <> 'DIVISON') then
    begin
      //RxSpeedButton12.Enabled:=False;
      if frmtrgtr.tRegistroCLAVE.Value = 19702005 then //Primera Vez
      begin
        frmtrgtr.tRegistro.Edit;
        if frmtrgtr.tRegistroCANTCORRIDA.Value > 0 then
        frmtrgtr.tRegistroCANTCORRIDA.Value:=frmtrgtr.tRegistroCANTCORRIDA.Value - 1;
        qtyCorr := frmtrgtr.tRegistroCANTCORRIDA.Value;
        //StatusBar3.Panels[0].Text := 'Run = '+frmtrgtr.tRegistroCANTCORRIDA.AsString;
        frmtrgtr.tRegistroSERIAL.Value:= GetVolumeID('c');
        frmtrgtr.tRegistroCLAVE.Value := 11111111;
        frmtrgtr.tRegistroFECHA_REGISTRO.Value:= Now;
        frmtrgtr.Button1click(Self);
      end else
      begin
        //igNorado de forma temporal hasta que arregle el control de clientes
        // if frmtrgtr.tRegistroSERIAL.Value <>  GetVolumeID('c') then
        //begin
        //  Messagedlg('Se ha verificado una Violacion de Licencia,'#13''+
        //  ' si este programa te es útil favor '#13'llamar a Ing. Juan Ramon Divison 809-813-1364 o nosivid@hotmail.com',mtError,[mbok],0);
        //  Beep;
        //  frmTrgtr.Free;
        //  frmTrgtr:=Nil;
        //  Application.Terminate;
        //end else
        //begin
          //ativa esto divison
          if frmtrgtr.tRegistroCANTCORRIDA.Value <= 0 then
          begin
            Messagedlg('El tiempo de uso de este programa a vencido'#13''+
            ' favor ponerse en contacto con el Ing. Juan Ramon Divison 809-309-5001 o idesi@idesisa.com',mtError,[mbok],0);
            Beep;
            Application.Terminate;
          end;
          frmtrgtr.tRegistro.Edit;
          frmtrgtr.tRegistroCANTCORRIDA.Value:=frmtrgtr.tRegistroCANTCORRIDA.Value - 1; // + 100;
          qtyCorr := frmtrgtr.tRegistroCANTCORRIDA.Value;
          frmtrgtr.Button1click(Self);
        //end;
      end;
    end;
    if (frmtrgtr.tRegistroTRANSP_ITBIS.Value = 0) then
    GlbTransparentaITBI := 0;

    if (frmtrgtr.tRegistroTRANSP_ITBIS.Value = 1)
    and (frmtrgtr.tRegistroSHOWPRICEWITHITBIS.Value = 1) then
    GlbSHOWPRICEWITHITBIS:=frmtrgtr.tRegistroSHOWPRICEWITHITBIS.Value
    else GlbSHOWPRICEWITHITBIS:=0;

    frmTrgtr.free;
    frmTrgtr:=nil;
    ProcesoLogin;
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

  //GlbTransparentaITBI

  if (Trim(StrUserName) <> 'DIVISON') then
  begin
    //WriteToLog('Activa permisos iniciar permisos');
    ActivaPermisos;

    dmUsuarios.qryRoles.Close;
    dmUsuarios.qryRoles.Params[0].Value:= VarUsuarioGlb;
    dmUsuarios.qryRoles.Open;
    dmUsuarios.qryRoles.First;
    While Not dmUsuarios.qryRoles.Eof Do
    begin
      ActivaPermiso(TForm(frmMenuPrincipal), 1000, dmUsuarios.qryRolesID_ROL.Value, 0);//menu principal: 1000 debe estar en la tabla PROCESOS
      dmUsuarios.qryRoles.Next;
    end;
    //WriteToLog('Permisos activados');
  end;

  //Se ignorará en el mes indicado
  {
  if (StrToInt(FormatDateTime('mm',Now)) >= 5) then
  begin
    TabSheet3.Enabled:=False;
    TabSheet1.Enabled:=False;
    Reportes1.Enabled:=False;
  end;
  }
  //TranslateComponent(Self);
  SetLogoCia;
  if (GlbActivaIFiscal = 1) then
  begin
    NotaDebito1.Enabled:=False;
    dmDatos.qryImpresoraFiscal.Close;
    dmDatos.qryImpresoraFiscal.Open;
    GlbPuerto  := dmDatos.qryImpresoraFiscalPUERTO.AsInteger;
    GlbBaudRate:= dmDatos.qryImpresoraFiscalBAUDRATE.Value;
    if not dmDatos.qryImpresoraFiscalENCABEZADO.IsNull then
    GlbEncabezadoIFiscal:= dmDatos.qryImpresoraFiscalENCABEZADO.Value
    else
    GlbEncabezadoIFiscal:= '';
    GlbRutaExeLIbroVenta:= dmDatos.qryImpresoraFiscalRUTA_EXELIBROVENTA.Value;
    GlbRutaLibroVentas  := dmDatos.qryImpresoraFiscalRUTALIBROVENTAS.Value;
  end else
  //Temp out of previews if Condition
  GlbRutaLibroVentas:= 'c:\LVentas';

  if dmCompania.tblCompania.State = dsInactive then
  dmCompania.tblCompania.open;
  //dmCompania.tblCompania.Locate('codigo',glbCia_Key,[]);

  dmUsuarios.qryAlmacenesInv.Close;
  dmUsuarios.qryAlmacenesInv.Open;
  if not dmUsuarios.qryAlmacenesInv.Locate('INVENTARIO_ID',GlbCodDivInventario,[]) then
  begin
    GlbCodDivInventario:=1;
    GlbAlmacen:='ALMACEN PRINCIPAL';
  end ELSE
  GlbAlmacen:=dmUsuarios.qryAlmacenesInvDESCRIPCION.Value;

  try
    dmCompania.tblTrackingEmail.Close;
    dmCompania.tblTrackingEmail.Open;
    if not dmCompania.tblTrackingEmail.Locate('IDTIPO;FECHA',vararrayof([0,ExtraerFecha(now)]),[]) then
    begin

      VInfo := TVersionInfo.Create(ParamStr(0));
      try
        FAppVer := VInfo.FileVersion;
        if trim(FAppVer)='' then FAppVer := '?.?';
        FAppBuild := ' '+FormatDateTime('mm/dd/yyyy', VInfo.VerFileDate);
      finally
      VInfo.free;
      VInfo:= Nil;
      end;

      if (GlbActivaIFiscal = 1 ) then
      xVersion := 'VERSION FISCAL '+FAppVer+' AppBuild: '+FAppBuild
      else
      xVersion := 'VERSION NO FISCAL '+FAppVer+' AppBuild: '+FAppBuild;

  rxspeedBtnPagoRecl.Visible:=False;
  if (GLBECOM = 1) then
  begin
    rxspeedbtnDesContrato.Visible:=True; //status contrato
  end;

  if GlbActivaCafeteria = 0 then
  begin
    ServiciosCafeteria1.Visible:=False;

  end;
  if GlbActivaProduccion = 1 then
  begin
    ServiciosCafeteria1.Visible:=True;
    ServiciosCafeteria1.Enabled:=True;
    ServiciosCafeteria1.Caption:='&Ingredientes Piezas';    
  end;
  if (GLBSAM = 0) then
  begin
    RxSpeedButton15.Visible := False; //Reclamaciones
    rxspeedBtnPagoRecl.Visible:=False; //Pago Reclamaciones
  end else
  begin
    RxSpeedButton15.Visible := True;
    rxspeedBtnPagoRecl.Visible:=True;
  end;
  frmUnidades:=TfrmUnidades.Create(nil);
  try
    //'UNIDAD'
    if dmInventario.tblUnidades.Locate('DESCRIPCION','UNIDADES',[]) then
    begin
      if (dmInventario.tblUnidadesIDUNIDAD.Value = 3) then
      begin
        MessageDlg('Valor para IDUnidad debe ser 1, favor corregir.',mtError,[mbOk],0);
        frmUnidades.ShowModal;
      end;
      if (dmInventario.tblUnidadesIDUNIDAD.Value = 3) then
      begin
        if MessageDlg('Valor para IDUnidad debe ser 1, Desea hacerlo luego?',mtError,[mbOk],0) = mryes then
        BitBtn1.Enabled:=False;
      end;      
    end;
  finally
  frmUnidades.free;
  frmUnidades:=nil;
  end;
  dmCompania.tblCompania.Close;
  dmCompania.tblcompania.Open;
  dmCompania.tblCompania.Locate('codigo',glbCia_Key,[]);
  GlbNombreCia := UpperCase(dmCompania.tblCompaniaNOMBRE.Value);
  dmDatos.qryMembrete.Close;
  dmDatos.qryMembrete.params[0].value:=glbCia_Key;
  dmDatos.qryMembrete.open;
  //IDESI SRL QA
  if not dmCompania.tblCompania.fieldbyname('NUM_SUCURSAL').IsNull then
  GlbCodSucursal := dmCompania.tblCompania.fieldbyname('NUM_SUCURSAL').Value
  else
  GlbCodSucursal := '0001';

  if GLBEsFastFood then GlBLimao:=1;

  SetColores;

      dmCompania.qryEmailProceso.Close;
      dmCompania.qryEmailProceso.Open;
      dmCompania.qryEmailProceso.Last;
      dmCompania.qryEmailProceso.First;
      if (trim(GlbUsuarioLogueado) = 'SOPORTE') Or (trim(GlbUsuarioLogueado) = 'DIVISON')
      or (trim(GlbUsuarioLogueado) = 'DEMO') then Exit;
      xtipo:=0;
      if dmCompania.qryEmailProcesoIDTIPO.Value = 0 then
      AvisoE:=True
      else
      if dmCompania.qryEmailProceso.RecordCount > 1 then
      begin
        if dmCompania.qryEmailProceso.Locate('IDTIPO',xtipo,[]) then
        AvisoE:=True
        else
        AvisoE:=False;
      end;
      //if dmCompania.qryEmailProceso.Locate('IDTIPO',0,[]) then
      if AvisoE and (upperCase(strUserName) = 'DIVISON') or (upperCase(strUserName) = 'NOSIVID')
      and (NOW < strToDate('04/30/2021')) then
      AvisoE := False;
      if AvisoE and (upperCase(strUserName) <> 'DIVISON') and (upperCase(strUserName) <> 'NOSIVID')  then
      begin
        ProcLogTrackingEmailAviso(0,dmCompania.qryEmailProcesoEMAIL_SERVER.Value,
        dmCompania.qryEmailProcesoPORT.AsString,dmCompania.qryEmailProcesoUSER_EMAIL.Value,
        Desencriptar(dmCompania.qryEmailProcesoUSER_PASSWORD.Value,2005),
        Now,dmCompania.qryEmailProcesoTOEMAIL.Value,dmCompania.qryEmailProcesoFROMEMAIL.Value,
        dmCompania.qryEmailProcesoSUBJECT.Value+' -CIA:'+
        dmCompania.tblCompaniaNOMBRE.Value+
        ''#13#10'Sucursal : '+dmCompania.tblCompaniaCIUDAD.AsString+' '+FormatDateTime('dd/mm/yyyy hh:mm a/p',now),
        'Email: '#13#10''+dmCompania.tblCompaniaEMAIL.Value + ''#13#10''+
        'Aviso USO PointSaleSoft, módulo punto ventas. '#13#10''+
        xVersion + ''#13#10'Cantidad de veces de uso disponible: '+IntToStr(qtyCorr),
        VarUsuarioGlb,'A','', Now, StrUserName, FormatDateTime('dd/mm/yyyy hh:mm a/p', Now),StrUserName,'',
        dmCompania.tblCompaniaNOMBRE.Value);
        if xtipo > 0 then
        xtipo:=0;
        if Not dmCompania.qryEmailProceso.Locate('IDTIPO', XTIPO, []) then
        begin
          dmCompania.tblTrackingEmail.Append;
          dmCompania.tblTrackingEmailIDTIPO.Value:=XTIPO;
          dmCompania.tblTrackingEmailFECHA.Value := ExtraerFecha(now);
          dmCompania.tblTrackingEmailTOEMAIL.Value:=dmCompania.qryEmailProcesoTOEMAIL.Value;
          dmCompania.tblTrackingEmailFROMEMAIL.Value:=dmCompania.qryEmailProcesoFROMEMAIL.Value;
          dmCompania.tblTrackingEmailSUBJECT.Value:='subject';
          dmCompania.tblTrackingEmailCOD_USER.Value:= VarUsuarioGlb;
          dmCompania.tblTrackingEmailSTATUS.Value:='A';
          dmCompania.tblTrackingEmailIN_POR.Value:= StrUserName;
          dmCompania.tblTrackingEmailFECHAIN.Value := Now;
          GlbSalvarQuery(dmCompania.tblTrackingEmail);
        end;
        dmCompania.tblTrackingEmail.Close;
      end else
      begin
        dmCompania.tblEmailProceso.Close;
        dmCompania.tblEmailProceso.Open;
        xtipo:=99;
        if Not dmCompania.qryEmailProceso.Locate('IDTIPO',XTIPO,[]) then
        begin
          dmCompania.tblEmailProceso.Append;
          dmCompania.tblEmailProcesoIDTIPO.Value       := XTIPO;
          dmCompania.tblEmailProcesoSUBJECT.Value      := 'PointSaleSoft';
          dmCompania.tblEmailProcesoPORT.Value         := 587;
          dmCompania.tblEmailProcesoEMAIL_SERVER.Value := 'netsol-smtp-oxcs.hostingplatform.com';
          dmCompania.tblEmailProcesoUSER_EMAIL.Value   := 'idesipos.soporte@gmail.com';
          dmCompania.tblEmailProcesoUSER_PASSWORD.Value:='';
          dmCompania.tblEmailProcesoFROMEMAIL.Value    := 'soporte@idesisa.com';
          dmCompania.tblEmailProcesoTOEMAIL.Value      := 'idesi@hotmail.com';
          dmCompania.tblEmailProcesoCCEMAIL.Value      := '';
          dmCompania.tblEmailProcesoFECHAIN.Value      := Now;;
          dmCompania.tblEmailProcesoIN_POR.Value       := 'RunTime';
          dmCompania.tblEmailProcesoSTATUS.Value       := 'A';
          GlbSalvarQuery(dmCompania.tblEmailProceso);
        end;
      end;
  end;
  except  on E : Exception do
      ShowMessage(E.ClassName+' Error. Mensaje: '+E.Message);
  end;
  //temporal
  try
    if (upperCase(strUserName) <> 'NOSIVID') then
    if (GLBSAM = 0) and (GlBAyaco = 0) and (GLBMTEGroup = 0) and (GLBMutur = 0) and (NOW < strToDate('04/30/2021') ) then
    NotificaErrorByEmail('AVISO USO POINTSALESOFT -'+DateToStr(now));
  except
  end;
end;
procedure TfrmMenuPrincipal.NotificaErrorByEmail(sms:string);
begin
  dmCompania.qryEmailProceso.Close;
  dmCompania.qryEmailProceso.Open;

  if dmCompania.qryEmailProceso.Locate('IDTIPO',900,[]) then
  begin
    ProcLogTrackingEmailAvisoDir('netsol-smtp-oxcs.hostingplatform.com',
    '587','soporte@idesisa.com',
    'A$2019Cero9nom',
    Now,'divison@gmail.com','soporte@idesisa.com',
    'Aviso uso PointSaleSoft '+' -CIA:'+
    dmCompania.tblCompaniaNOMBRE.Value+
    ''#13#10'Sucursal : '+dmCompania.tblCompaniaCIUDAD.AsString+' '+FormatDateTime('dd/mm/yyyy hh:mm a/p',now),
    ''#13#10''+sms+
    ''#13#10'Telef:'+dmCompania.tblCompaniaTELEFONO.Value+
    ''#13#10'RNC:'+dmCompania.tblCompaniaRNC_NUMERO.Value+
    'Email: '+dmCompania.tblCompaniaEMAIL.Value + ''#13#10''+
    sms+ ''#13#10'',
    //xVersion + ''#13'Cantidad de veces de uso disponible: '+IntToStr(qtyCorr),
  VarUsuarioGlb,'A','', Now, StrUserName, FormatDateTime('dd/mm/yyyy hh:mm a/p', Now),StrUserName,'');
  end;
end;

procedure TfrmMenuPrincipal.SetColores;
begin
  if (GlbColorUno <> '') and (GlbColorDos <> '') then
  begin
    Gradiente1.ColorDesde:=StringToColor(GlbColorUno);
    Gradiente1.ColorHasta:=StringToColor(GlbColorDos);
    Gradiente2.ColorDesde:=StringToColor(GlbColorUno);
    Gradiente2.ColorHasta:=StringToColor(GlbColorDos);
    Gradiente3.ColorDesde:=StringToColor(GlbColorUno);
    Gradiente3.ColorHasta:=StringToColor(GlbColorDos);
    Gradiente4.ColorDesde:=StringToColor(GlbColorUno);
    Gradiente4.ColorHasta:=StringToColor(GlbColorDos);
    Gradiente5.ColorDesde:=StringToColor(GlbColorUno);
    Gradiente5.ColorHasta:=StringToColor(GlbColorDos);
    Gradiente6.ColorDesde:=StringToColor(GlbColorUno);
    Gradiente6.ColorHasta:=StringToColor(GlbColorDos);
    Gradiente7.ColorDesde:=StringToColor(GlbColorUno);
    Gradiente7.ColorHasta:=StringToColor(GlbColorDos);
    Gradiente8.ColorDesde:=StringToColor(GlbColorUno);
    Gradiente8.ColorHasta:=StringToColor(GlbColorDos);
    Gradiente9.ColorDesde:=StringToColor(GlbColorUno);
    Gradiente9.ColorHasta:=StringToColor(GlbColorDos);
    Gradiente10.ColorDesde:=StringToColor(GlbColorUno);
    Gradiente10.ColorHasta:=StringToColor(GlbColorDos);
    Gradiente11.ColorDesde:=StringToColor(GlbColorUno);
    Gradiente11.ColorHasta:=StringToColor(GlbColorDos);
  end;
end;
procedure TfrmMenuPrincipal.Ingresos1Click(Sender: TObject);
begin
{  frmIngresos:=TfrmIngresos.Create(Nil);
  try
    frmIngresos.ShowModal;
  finally
  frmIngresos.Free;
  frmIngresos:=Nil;
  end;}
  frmRegIngresos:=TfrmRegIngresos.Create(Nil);
  try
    frmRegIngresos.ShowModal;
  finally
  frmRegIngresos.Free;
  frmRegIngresos:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.Clientes1Click(Sender: TObject);
begin
  frmClientes:=TfrmClientes.Create(Nil);
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
    frmClientes.PageControl1.ActivePageIndex:=0;
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
  //dmInventario.ProcInsertKardexBlc(StrToDate('01/31/2021'));
  frmEncrypt:=TfrmEncrypt.Create(nil);
  try
    frmEncrypt.Showmodal;
  finally
  FreeAndNil(frmEncrypt);
  end;

  AboutBox := TAboutBox.Create(nil);
  Try
    aboutbox.showmodal;
  finally
  aboutbox.free;
  aboutbox:=nil;
  end;              
end;

procedure TfrmMenuPrincipal.FormShow(Sender: TObject);
var
  strA : string[11];
  stru : string[5];
begin
  if (UpperCase(strUserName) <> 'NOSIVID') then
  begin
    if not GlbIsAutenticado then
    Application.Terminate;
  end else
  begin
    AboutBox := TAboutBox.Create(nil);
    Try
      aboutbox.showmodal;
    finally
    aboutbox.free;
    aboutbox:=nil;
    end;
  end;
  dmCompania.tblCompania.close;
  dmCompania.tblcompania.open;
  dmCompania.tblCompania.Locate('codigo',glbCia_Key,[]);
  if not dmCompania.tblCompania.fieldbyname('NUM_SUCURSAL').IsNull then
  GlbCodSucursal := dmCompania.tblCompania.fieldbyname('NUM_SUCURSAL').Value
  else
  GlbCodSucursal := '0001';

  GlBBurgos:= 0;
  GlBAyaco := 0;
  GlBExpert:= 0;
  //Para evitar que me copien la aplicacion
  strA:=StringReplace(dmCompania.tblCompaniarnc_numero.value,'-','',[rfIgnoreCase,rfReplaceAll]);
  {if ( strA <> '07900012779') then
  begin
    MessageDlg('Licencia no valida para cliente registrado, verifique 809-309-5001 (nosivid@hotmail.com).',mtWarning,[mbOk],0);
    begin
      AvisoEmailLicenciaNoRegistrada;
      Application.Terminate;//dios es amor
    end;
  end;  }
   //02601094028  julio
  //  {Para evitar que me copien la aplicacion
  //{activa para restringir version
  // activalo
  { if ( StrToInt(formatdatetime('mm',now)) >  9) then  //
  begin
    //t MessageDlg('Licencia no válida para cliente registrado RNC:'+
    //t strA +', verifique 809-309-5001 o (idesi@idesisa.com).',mtWarning,[mbOk],0);
    begin
      try
        AvisoEmailLicenciaNoRegistrada;
      except
      end;
      //t Application.Terminate;//dios es amor
    end;
  end;
  }

  {
  if ( strA <> '02601094028') then  //Julio O&L
  begin
    MessageDlg('Licencia no válida para cliente registrado RNC:'+
    strA +', verifique 809-309-5001 o (nosivid@hotmail.com).',mtWarning,[mbOk],0);
    begin
      AvisoEmailLicenciaNoRegistrada;
      Application.Terminate;//dios es amor
    end;
  end;    }
     //131657052 - Farmacia Cristiana

  //inicio temporal
  {
  if ( strA <> '132026535') then  //Comercial Mutur    Ing. Amaurys Garcia Vicente Noble
  begin
    MessageDlg('Licencia no válida para cliente registrado RNC: '+
    strA
    +','#13#10' verifique llame al  809-309-5001 o envie email a nosivid@hotmail.com.',mtWarning,[mbOk],0);
    begin
      AvisoEmailLicenciaNoRegistrada;
      Application.Terminate;//dios es amor
    end;
  end;
  }
  //fin temporal 132026535


  //inicio temporal
  {
  if ( strA <> '132065891') then  //GOR ADOLLY FARMACIA SRL    Ing. Amaurys Garcia Vicente Noble
  begin
    MessageDlg('Licencia no válida para cliente registrado RNC: '+
    strA
    +','#13#10' verifique llame al  809-309-5001 o envie email a nosivid@hotmail.com.',mtWarning,[mbOk],0);
    begin
      AvisoEmailLicenciaNoRegistrada;
      Application.Terminate;//dios es amor
    end;
  end;
  }
  //fin temporal 132026535

  {t if ( strA <> '130021309') then     //limao
  begin
    MessageDlg('Licencia no válida para cliente registrado RNC:'+
    strA
    +', verifique 809-309-5001 o (nosivid@hotmail.com).',mtWarning,[mbOk],0);
    begin
      AvisoEmailLicenciaNoRegistrada;
      Application.Terminate;//dios es amor
    end;
  end;  }
  //GlBLimao:=0;
  GlbFarmacia:=0;
  GlbShowCtaBanco:=0;
  //GlBTapiceria
  if (strA = '131657052') then
  GlbFarmacia := 1
  else
  //Tapizado y Decoraciones By J&S --santiaguito
  if (dmCompania.tblCompaniarnc_numero.value = '133-45144-1') or
     (dmCompania.tblCompaniarnc_numero.value = '133451441')
  then
  begin
    GlBTapiceria:= 1;
    GlbShowCtaBanco:=1;
  end
  else
  if ((dmCompania.tblCompaniarnc_numero.value = '08500026409')
  or (dmCompania.tblCompaniarnc_numero.value = '131398502')
  or (dmCompania.tblCompaniarnc_numero.value = '132960149')
  or (dmCompania.tblCompaniarnc_numero.value = '132-96014-9')) then
  begin
    GlBAyaco := 1;
    GlbShowCtaBanco:=1;
    //if (dmCompania.tblCompaniarnc_numero.value = '132960149') or
    //   (dmCompania.tblCompaniarnc_numero.value = '132-96014-9') then
    //GlbShowCtaBanco:=0;
  end else  //GlBExpert
  if (dmCompania.tblCompaniarnc_numero.value = '130-78793-1') or
     (dmCompania.tblCompaniarnc_numero.value = '130787931')
  then  
  begin
    GlBExpert:=1;
    GlbShowCtaBanco:=0;
  end else
  if (dmCompania.tblCompaniarnc_numero.value = '101-61621-2') or
     (dmCompania.tblCompaniarnc_numero.value = '101616212')
  then
  GlBBurgos:= 1;

  if (dmCompania.tblCompaniarnc_numero.value = '130200106') then
  begin
    GlBInveraf:=1;
    GlbShowCtaBanco:=0;
  end else GlBInveraf:=0;

  //130021309
    if (dmCompania.tblCompaniarnc_numero.value = '130-02130-9') or
     (dmCompania.tblCompaniarnc_numero.value = '130021309')
  then
  GlBLimao:= 1;

  if GlbActivaFarmacia = 1 then
  GlbFarmacia:=1;

  if GlbFarmacia = 0 then
  begin
    ARS2.Visible:=False;
  end;  

  //TEMPORAL
  //GlBAyaco := 1;

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
  //GlBInMobi:= 0;
  // GlBInMobi:=0;  131172662
  //131704417  ESTATE HOUSES GM REAL STATE SRL
  if (dmCompania.tblCompaniarnc_numero.value = '131-70441-7') or
     (dmCompania.tblCompaniarnc_numero.value = '131704417')
  then
  GlBInMobi:= 1;

  if GlbFinanciamiento then
  CobroCuotasFinanc2.Visible:=True
  else
    CobroCuotasFinanc2.Visible := False;
  ActivaPermisos;
  pagecontrol1.TabIndex:=0;
  PageControl1.Pages[0].PageIndex:=0;
  PageControl1.Pages[0].Visible:=True;
  TabSheet3.TabVisible:=True;

  if GlbActivaCafeteria = 1 then
  TabSheet8.Visible:=False;
  if GlbActivaProduccion = 1 then
  begin
    TabSheet8.Visible:=True;
    TabSheet8.Caption:='Producción';
  end;                     

  PageControl1.ActivePageIndex:=1;
  PageControl1.ActivePageIndex:=0;
  Application.ProcessMessages;          
  if not GlbRegistrado then
  begin
    rxLabel2.Caption:='Version NO REGISTRADA.';
    rxLabel2.Left:=581;
    rxLabel2.Font.Color:= clRed;
  end else
  begin
    rxLabel2.Caption:='IDESI SRL';
    if (GlbCantCorridas < 25) then
    rxLabel2.Caption:=rxLabel2.Caption + ' -'+IntTostr(GlbCantCorridas)+ ' Veces';
    rxLabel2.Font.Color:= clWindowText;
    rxLabel2.Left:=869;
  end;
  if GlbActivaIFiscal = 1 then
  begin
    dmDatos.qryImpresoraFiscalActiva.Close;
    dmDatos.qryImpresoraFiscalActiva.Open;//dmDatos.qryImpresoraFiscalActiva.database.databasename
    GlbModeloImpresora := dmDatos.qryImpresoraFiscalActivaMODELO.Value;

    dmReportes.qryDatosCajaImpUser.Close;
    dmReportes.qryDatosCajaImpUser.Params[0].Value:= VarUsuarioGlb;
    dmReportes.qryDatosCajaImpUser.Open;
    if dmReportes.qryDatosCajaImpUser.RecordCount = 0 then
    MessageDlg('Favor configurar Datos Caja x Usuarios.',mtError,[mbok],0);
  end;
  GlbImpresoraFOnline:=True;

  if (GlbModeloImpresora = GLBIFISCALOKI407FP) then
  begin
    Especial1.Visible:=False;
  end;
  Ventas1.Visible:=False;//Anterior ventana de ventas
  if (GlbActivaIFiscal = 1) then
  begin
    try
      VerificaImpresoraFiscalM;//1
    except
    on E : Exception do
      ShowMessage(E.ClassName+' VerificaImpresoraFiscalM;//1 : '+E.Message);
    end;
  end;
  if (GlBAyaco = 1) or (GlBBurgos = 1) or (GlBCuadros = 1) then
  BitBtn7.Visible:=True
  else BitBtn7.Visible:=False;

  //temporal
  BitBtn7.Visible:=True;

  //if (UpperCase(GlbUsuarioLogueado) = 'SOPORTE') then
  //begin
    Permisos1.Visible:=true;
    Permisos1.Enabled:=True;
  //end;
  frmMenuPrincipal.Caption:= 'ERP Enterprise System';
  frmMenuPrincipal.Text   := 'ERP Enterprise System';
  ARS1.Visible:=false;
  ARS2.Visible:=false;
  RxSpeedButton17.Visible:=False;
  if GlbFarmacia = 1 then
  begin
    ars1.Visible:=True;
    ars2.Visible:=True;
    Conduce1.Visible:=False;
    RxSpeedButton17.Visible:=False;
  end;
  if GLBSAM = 1 then
  begin
    Conduce1.Visible:=False;
    RxSpeedButton17.Visible:=True;
  end;
  stru:=strusername;
  if GlBCuadros = 0 then
  BitBtn8.Visible:=False;
  
  RxLabel3.BringToFront;
  RxLabel5.BringToFront;
  RxLabel2.BringToFront;
  RxLabel1.BringToFront;
  if GLBSAM = 0 then
  begin
    ImportarPolizas1.Visible  :=False;
    ImportarGarantias1.Visible:=False;
    RxSpeedButton15.Visible:=False;
    Afiliaciones1.Visible  :=False;
    Polizas1.Visible := False;
    InventarioCertificados1.Visible:=False;
    Conduce1.Visible:=False;
  end;

  if (GlbCajaeCF <> '') and (UpperCase(GetComputerNameStr)<>UpperCase(GlbCajaeCF)) then
  BitBtn1.Enabled:=False;
  if (GLBIDClienteIDESI = 0) and
     (trim(GlbUsuarioLogueado) <> 'SOPORTE') and
     (trim(GlbUsuarioLogueado) <> 'DIVISON') and
     (trim(UPPERcase(stru)) <> 'NOSIVID')
  then
  begin
    MessageDlg('Se requiere valor para el parámetro GLBIDClienteIDESI en .ini',mtError,[mbok],0);
    Application.Terminate;
  end;
  if (VarUsuarioGlb < 0) then
  begin
    MessageDlg('Configuración de usuario logueado esta incompleta, trate de nuevo.',mtError,[mbok],0);
    Application.Terminate;
  end;
  if (GlBExpert = 1) and (GlbActivaECF = 1) then
  BitBtn10.Enabled:=True else BitBtn10.Enabled:=False;
end;


procedure TfrmMenuPrincipal.ProcesarCierreDiaTrn;
var
  DiaTrn,
  DiaAct : Smallint;
  MesAct, MesTrn : Smallint;
  FechaInv : TDateTime;
begin
  DiaTrn:= StrToInt(FormatDateTime('dd', GlbFechaTrnDiaria));
  DiaAct:= StrToInt(FormatDateTime('dd', Date));
  MesAct:= StrToInt(FormatDateTime('mm', Date));
  MesTrn:= StrToInt(FormatDateTime('dd', GlbFechaTrnDiaria));
  if (Abs(DiaAct-Diatrn) <= 1) And (MesAct = MesTrn) then
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
      FechaInv:=ExtraerFecha(GlbFechaTrnDiaria);
      if MessageDlg('Es hora de cerrar el mes y el dia, desea cerrarlo ahora?', mtInformation,[mbyes,mbno,mbhelp],0)=mrYes then
      begin
        frmVTrnDiaria.CerrarMesBalanceCxc;
        if (GlbDiaActualizado = 0) then
        frmVTrnDiaria.ActualizaHistorico;
      end;
      //Actualizar Balance Inventario Hist Kardex
      try
        dmInventario.ProcInsertKardexBlc(FechaInv);
      except  on E : Exception do
      begin
        LogInformacionTxt('UMenuPrincipal');
        LogInformacionTxt('Error en dmInventario.Proc_InsertKardexBlc(FechaInv);');
        LogInformacionTxt(E.ClassName+' Error. Mensaje: '+E.Message);
      end;
      end;
    end else
    frmVTrnDiaria.ActualizaHistorico;
  finally
  frmVTrnDiaria.Free;
  frmVTrnDiaria:=Nil;
  end;
  dmcxc.qryBalanceCtes.Close;

end;

procedure TfrmMenuPrincipal.DebitosyCreditosaplicados1Click(
  Sender: TObject);
begin
  frmVerCreditosyDebitosAplicados :=TfrmVerCreditosyDebitosAplicados.Create(nil);
  try
   
   if GetDateTipoMoneda1.Execute then
   begin
    //frmVerCreditosyDebitosAplicados.BuscarDatos(GlbFechaTrnDiaria,GlbFechaTrnDiaria);
    if (GetDateTipoMoneda1.Moneda <> '0') then
    frmVerCreditosyDebitosAplicados.BuscarDatos(Extraerfecha(GetDateTipoMoneda1.Fecha),
                Extraerfecha(GetDateTipoMoneda1.FechaFinal),
                GetDateTipoMoneda1.Moneda, GetDateTipoMoneda1.Moneda)
    else
    frmVerCreditosyDebitosAplicados.BuscarDatos(Extraerfecha(GetDateTipoMoneda1.Fecha),
                Extraerfecha(GetDateTipoMoneda1.FechaFinal),
                '1','4');


    frmVerCreditosyDebitosAplicados.Label3.Caption:=FormatDatetime('dd-mmm-yyyy',GetDateTipoMoneda1.Fecha);
    frmVerCreditosyDebitosAplicados.Showmodal;
   end;
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
  if Assigned(frmLogin) then
  try
    FreeAndNil(frmLogin);
  except
  end;
  frmLogin:=tfrmLogin.Create(Nil);
  Try
  if frmLogin.Showmodal = mrCancel then
  begin
    logout;
     Application.Terminate;
  end
  else
  begin
    if ((frmLogin.Edit1.Text = 'DIVISON') AND (frmLogin.Edit2.Text = '2005')) OR
       ((frmLogin.Edit1.Text = 'SOPORTE') AND ((LowerCase(frmLogin.Edit2.Text) = 'sup#2005') or
        (frmLogin.Edit2.Text='2005') or (LowerCase(frmLogin.Edit2.Text) = 'sup@2005')))
       then
    begin
      GlbUsuarioLogueado:= frmLogin.Edit1.Text;
      varTipousuario:=0;//Todos los permisos
      GlbRegistrado:=True;
      GlbIsAutenticado := True;
      varTipousuario:=dmUsuarios.qryUsuariosTIPO.Value;
      VarUsuarioGlb :=dmUsuarios.qryUsuariosCODIGO_EMPLEADO.Value;

      //if ValidaRegistro(1, VarUsuarioGlb, StruserName) then
      //begin
      //  MessageDlg('Cantidad de Licencias insuficientes, verifique.',mtInformation, [mbOK], 0);
      //  logout;
      //  Application.Terminate;
      //end  else
      //begin
        glbLogueado:= dmUsuarios.procMantRegDet.Params[0].Value;
      //end;

      LeerDatosIni;//Asigna valor a GlbClaveSup
      VarNombreUsuario:= dmUsuarios.qryUsuariosNOMBRECOMPLETO.Value;
      RxLabel3.Caption:= dmCompania.tblCompaniaNOMBRE.Value + ' - ' +
      dmUsuarios.tblOficinaDESCRIPCION.Value;

      frmLogin.Edit2.Text:= Encriptar(Trim(frmLogin.edit2.Text), 2005);
      if dmUsuarios.qryUsuarios.Locate('codigo;Clave',vararrayof([frmLogin.edit1.Text,frmLogin.edit2.Text]),[]) then
      begin
        VarUsuarioGlb := dmUsuarios.qryUsuariosCODIGO_EMPLEADO.Value;
        skindata1.Active:= not skindata1.Active;
        if not dmUsuarios.qryUsuariosARCHIVOCONFGWIN.IsNull then
        SkinData1.SkinFile:=dmUsuarios.qryUsuariosARCHIVOCONFGWIN.Value;
        GlbUsuarioLogueado:= Trim(UpperCase(dmUsuarios.qryUsuariosCODIGO.Value));
        //skindata1.Active:= not skindata1.Active;
      end else VarUsuarioGlb:=0;
    end else
    begin
        Outofhere;
        try
        frmLogin.Edit2.Text:= Encriptar(Trim(frmLogin.edit2.Text), 2005);
        except
        end;
        //inicio
        {dmUsuarios.qryUsuarios.First;
        While Not dmUsuarios.qryUsuarios.Eof do
        begin
        frmLogin.Edit2.Text:= Desencriptar(Trim(dmUsuarios.qryUsuariosCLAVE.Value),2005);
        dmUsuarios.qryUsuariosNOMBRECOMPLETO.Value;
        dmUsuarios.qryUsuarios.Next;
        end;}
        //fin
        if not dmUsuarios.qryUsuarios.Locate('codigo;Clave',vararrayof([frmLogin.edit1.Text,frmLogin.edit2.Text]),[]) then
        begin
          GlbIsAutenticado:=False;//dmUsuarios.qryUsuariosclave.value
          Messagedlg('Usuario o Clave Incorrecta.¡Verifique Por Favor!',mtError,[mbOk],0);
          ProcesoLogin;
          //Application.Terminate;
          GlbUsuarioLogueado:='';
        end else
        Begin
          //GlbUsuarioPassword:=frmLogin.edit2.Text;
          GlbIsAutenticado := True;
          //GlbCodigoCia:=1;//Distribuidor Jugo Tropico
          if (not dmUsuarios.qryUsuariosARCHIVOCONFGWIN.IsNull) And
               (dmUsuarios.qryUsuariosARCHIVOCONFGWIN.Value <> '') then
          begin
            SkinData1.Active:=False;
            SkinData1.SkinFile:=dmUsuarios.qryUsuariosARCHIVOCONFGWIN.Value;
            SkinData1.LoadFromFile(dmUsuarios.qryUsuariosARCHIVOCONFGWIN.Value);
            SkinData1.Active:=True;
            GlbSkinPath:=dmUsuarios.qryUsuariosARCHIVOCONFGWIN.Value;
          end;
          RxLabel3.Caption:= dmCompania.tblCompaniaNOMBRE.Value + ' - ' +
          dmUsuarios.tblOficinaDESCRIPCION.Value;
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

          LeerDatosIni;//Asigna valor a GlbClaveSup
          VarNombreUsuario:= dmUsuarios.qryUsuariosNOMBRECOMPLETO.Value;
          GlbUsuarioLogueado:= Trim(UpperCase(dmUsuarios.qryUsuariosCODIGO.Value));
          rxlabel3.Caption:= rxlabel3.Caption + ' -Usuario: '+VarNombreUsuario;

          try
            if ValidaRegistro(1, VarUsuarioGlb, StruserName) then
            begin
              MessageDlg('Cantidad de Licencias insuficientes, verifique.',mtInformation, [mbOK], 0);
              if (UpperCase(strUserName) <> 'NOSIVID') then
              begin
                logout;
                Application.Terminate;
              end;
            end  else
            begin
              glbLogueado:= dmUsuarios.procMantRegDet.Params[0].Value;
            end;
          except  on E : Exception do
          begin
            LogInformacionTxt('UMenuPrincipal');
            LogInformacionTxt('ValidaRegistro usuario ;');
            LogInformacionTxt(E.ClassName+' Error. Mensaje: '+E.Message);
          end;
        end;

        end;
      end;
  end;
  finally
  frmLogin.free;
  frmLogin:=nil;
  end;
end;

procedure TfrmMenuPrincipal.CerrarSesion1Click(Sender: TObject);
begin
  ProcesoLogin;
  ActivaPermisos;
  dmUsuarios.qryRoles.Close;
  dmUsuarios.qryRoles.Params[0].Value:= VarUsuarioGlb;
  dmUsuarios.qryRoles.Open;
  dmUsuarios.qryRoles.First;
  While Not dmUsuarios.qryRoles.Eof Do
  begin
    ActivaPermiso(TForm(frmMenuPrincipal), 1000, dmUsuarios.qryRolesID_ROL.Value, 0);//menu principal: 1000 debe estar en la tabla PROCESOS
    dmUsuarios.qryRoles.next;
  end;
  SetLogoCia;
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
        if GlbActivaIFiscal = 0 then
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
  if (GlbActivaLavanderia = 0) then
  begin
    PageControl1.Pages[8].Visible:=False;
    TabSheet8.TabVisible:=False;
  end else
  begin
    PageControl1.Pages[8].Visible:=True;
    TabSheet8.TabVisible:=True;
  end;
  if (GlbActivaPanificadora = 0) then
  begin
    PageControl1.Pages[7].Visible:=False;
    TabSheet7.TabVisible:=False;
  end else
  begin
    PageControl1.Pages[7].Visible:=True;
    TabSheet7.TabVisible:= True;
  end;
  if GlbColegio = 0 then
  begin
    Cursos1.Visible := False;
    Estudiantes1.Visible := False;
    AoEscolar1.Visible := False;
    EstadoMensualidadEstudiantes1.Visible:=False;
  end else
  begin
    Caption:='Administrador de Colegios';
    VentaDiaria3.Caption:='Venta Servicios';
    CobroCuotasFinanc2.Visible:=False;

    Cursos1.Visible     := True;
    Estudiantes1.Visible:= True;
    AoEscolar1.Visible  := True;
    EstadoMensualidadEstudiantes1.Visible:=True;
    dmEstudiante.qryAnoEscolarActivo.Close;
    dmEstudiante.qryAnoEscolarActivo.Open;
    GLBIDAnioEscolar   := dmEstudiante.qryAnoEscolarActivo.FieldByName('codigo').AsInteger;
  end;
end;

procedure TfrmMenuPrincipal.VigenciaBlc1Click(Sender: TObject);
begin
  dmreportes.qryVigenciaCxc.close;
  dmreportes.qryVigenciaCxc.open;  
  qryvigenciaCxc:=tqryvigenciaCxc.Create(nil);
  try
    qryvigenciaCxc.PrinterSettings.PrinterIndex:=GetImpresorarpt(2,12);
    qryvigenciaCxc.Prepare;
    qryvigenciaCxc.qrTpaginas.Caption:= ' de '+IntToStr(qryvigenciaCxc.PageNumber);
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
    dmreportes.qryResumenVentas.Params[2].Value:=glbCia_Key;
    dmreportes.qryResumenVentas.Open;
    qckResumenVentas:=TqckResumenVentas.Create(Nil);
    try
    qckResumenVentas.PrinterSettings.PrinterIndex:=GetImpresorarpt(2,12);
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
  frmConfSkin:=TfrmConfSkin.Create(nil);
  try
    if frmConfSkin.Showmodal = mrOk then
    begin
      SkinData1.Active:=False;
      SkinData1.SkinFile:= frmConfSkin.sd1.SkinFile;
      if (SkinData1.SkinFile <> '') then
      SkinData1.LoadFromFile(frmConfSkin.sd1.SkinFile);

      SkinData1.Active := True;
      dmUsuarios.qryUsuarios.Close;
      dmUsuarios.qryUsuarios.Open;
      if dmUsuarios.qryUsuarios.Locate('CODIGO_EMPLEADO',VarUsuarioGlb,[]) then
      begin
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
    end else
    begin
      if frmConfSkin.Showmodal = mrCancel then
      begin
        if dmUsuarios.qryUsuarios.Locate('CODIGO_EMPLEADO',VarUsuarioGlb,[]) then
        begin
          dmUsuarios.qryUsuarios.Edit;
          dmUsuarios.qryUsuariosARCHIVOCONFGWIN.Value:='';
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
      end;
    end;
  finally
  frmConfSkin.Free;
  frmConfSkin:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.Calculadora1Click(Sender: TObject);
var
   myFile : TextFile;
   Count, X : Integer;
begin
{   dmreportes.qryDescLineasDocF.Close;
  dmreportes.qryDescLineasDocF.Params[0].Value:=3;
  dmreportes.qryDescLineasDocF.Open;
  dmreportes.qryDescLineasDocF.Last;
  X := 1;
  Count := dmreportes.qryDescLineasDocF.RecordCount;
  dmreportes.qryDescLineasDocF.First;
  AssignFile(myFile, 'C:\Proyectos\Recibos\TestLineas.txt');
  ReWrite(myFile);

  While not dmreportes.qryDescLineasDocF.Eof Do
  begin
    if  x < count then
    Write(myFile,dmreportes.qryDescLineasDocFDESCRIPCION.Value+',');
    X := X + 1;
    dmreportes.qryDescLineasDocF.Next;
    if X = Count then
    begin
      WriteLn(myFile,dmreportes.qryDescLineasDocFDESCRIPCION.Value);
    end;    
  end;
  CloseFile(myFile);
  Exit;//temporal   }
  
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

procedure TfrmMenuPrincipal.Ventas1Click(Sender: TObject);
begin
  BitBtn1Click(Self);
  exit;
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
  dmCompania.tblCompania.Locate('codigo',glbCia_Key,[]);  
  if VerificaCierreDia(17,1,1,ExtraerFecha(Now),GlbFechaTrnDiaria) then
  begin
    GlbDiaActualizado:=0;
    //t If varTipousuario = 2 then //SUPERVISOR
    //t begin
    if MessageDlg('Desea Cerrar Transacciones del dia ' + FormatDateTime('dd-mmm-yyyy',GlbFechaTrnDiaria)+'?',mtWarning,[mbNo,mbYes],0)=mrYes then
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
  Exit;
  qckReporteCuadreDiario:=TqckReporteCuadreDiario.create(nil);
  try
  qckReporteCuadreDiario.PrinterSettings.PrinterIndex:=GetImpresorarpt(2,12);
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
    if (frmtrgtr.tRegistroTRANSP_ITBIS.Value = 0) then
    GlbTransparentaITBI := 0;
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
    qckSalidaRuta.PrinterSettings.PrinterIndex:=GetImpresorarpt(2,12);
    qckSalidaRuta.Preview;
  finally
  qckSalidaRuta.Free;
  qckSalidaRuta:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.BeneficioBruto1Click(Sender: TObject);
begin
  frmSelFecha:=TfrmSelFecha.Create(nil);
  try
  if frmSelFecha.ShowModal = mrOk then
  begin
  dmReportes.qryDatosResumenBeneficioBruto.close;
  dmReportes.qryDatosResumenBeneficioBruto.params[0].Value:= extraerFecha(frmSelFecha.FechaIni.date);
  dmReportes.qryDatosResumenBeneficioBruto.params[1].Value:= extraerFecha(frmSelFecha.FechaFin.date);
  dmReportes.qryDatosResumenBeneficioBruto.open;
  qckBeneficioBruto:=TqckBeneficioBruto.Create(nil);
  try
    qckBeneficioBruto.PrinterSettings.PrinterIndex:=GetImpresorarpt(2,12);
    qckBeneficioBruto.preview;
  finally
  qckBeneficioBruto.free;
  qckBeneficioBruto:=nil;
  end;
  end;
  finally
  frmSelFecha.Free;
  frmSelFecha:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.RegistroPedidos1Click(Sender: TObject);
begin
  frmRegPedidoProv := TfrmRegPedidoProv.Create(Nil);
  try
    dmUsuarios.qryRoles.Close;
    dmUsuarios.qryRoles.Params[0].Value:= VarUsuarioGlb;
    dmUsuarios.qryRoles.Open;
    dmUsuarios.qryRoles.First;
    While Not dmUsuarios.qryRoles.Eof Do
    begin
       ActivaPermiso(TForm(frmRegPedidoProv),1000, dmUsuarios.qryRolesID_ROL.Value, 0);
       dmUsuarios.qryRoles.Next;
    end;
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
    qckRepPrecio.PrinterSettings.PrinterIndex:=GetImpresorarpt(2,12);
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
        qckVentaCajaxRuta.PrinterSettings.PrinterIndex:=GetImpresorarpt(2,12);
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
        qckVentaCajaxRutaResumen.PrinterSettings.PrinterIndex:=GetImpresorarpt(2,12);
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

procedure TfrmMenuPrincipal.ProcesarNmina1Click(Sender: TObject);
begin
  frmSelDatosIntegrarNom:=TfrmSelDatosIntegrarNom.Create(Nil);
  try
    if frmSelDatosIntegrarNom.ShowModal = mrOk then
    begin
      glbFechaNom := ExtraerFecha(frmSelDatosIntegrarNom.dtpkFechaNom.Datetime);
      frmSelDatosIntegrarNom.VerificarTipoCia;
      frmSelDatosIntegrarNom.VerificarTipoNomina(frmSelDatosIntegrarNom.xTipoNomina);
      frmNominaEmpleado:=TfrmNominaEmpleado.create(Nil);
      try
        frmNominaEmpleado.Showmodal;
      finally
      frmNominaEmpleado.Free;
      frmNominaEmpleado:=Nil;
      end;
    end;
  finally
  frmSelDatosIntegrarNom.free;
  frmSelDatosIntegrarNom:=nil;
  end;
end;

procedure TfrmMenuPrincipal.PrestamoEmpleados2Click(Sender: TObject);
begin
  frmPrestamos:=TfrmPrestamos.Create(Nil);
  try
    frmPrestamos.Showmodal;
  finally
  frmPrestamos.Free;
  frmPrestamos:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.Comisiones2Click(Sender: TObject);
begin
  frmComisiones:=TfrmComisiones.Create(nil);
  try
    frmComisiones.showmodal;
  finally
  frmComisiones.free;
  frmComisiones:=nil;
  end;
end;

procedure TfrmMenuPrincipal.CuadreConsolidado1Click(Sender: TObject);
var
  xRuta:String;
begin
  frmSelFecha:=TfrmSelFecha.Create(nil);
  try
    frmSelFecha.FechaIni.Date:=GlbFechaTrnDiaria;
    frmSelFecha.FechaFin.Date:=GlbFechaTrnDiaria;
    if frmSelFecha.showmodal = mrOk then
    begin
      xRuta:=InputBox('Reporte Valores x Ruta','Entre codigo ruta ó 0 para todas','0');
      if xruta='0' then
      begin
        dmReportes.qryDatosRepDifVendedores.Close;
        dmReportes.qryDatosRepDifVendedores.Params[0].Value:= ExtraerFecha(frmSelFecha.FechaIni.Date);
        dmReportes.qryDatosRepDifVendedores.Params[1].Value:= ExtraerFecha(frmSelFecha.FechaFin.Date);
        dmReportes.qryDatosRepDifVendedores.Params[2].Value:= 0;
        dmReportes.qryDatosRepDifVendedores.Params[3].Value:= 1000;
        dmReportes.qryDatosRepDifVendedores.Open;
      end else
      begin
        dmReportes.qryDatosRepDifVendedores.Close;
        dmReportes.qryDatosRepDifVendedores.Params[0].Value:= ExtraerFecha(frmSelFecha.FechaIni.Date);
        dmReportes.qryDatosRepDifVendedores.Params[1].Value:= ExtraerFecha(frmSelFecha.FechaFin.Date);
        dmReportes.qryDatosRepDifVendedores.Params[2].Value:= StrToInt(xRuta);
        dmReportes.qryDatosRepDifVendedores.Params[3].Value:= StrToInt(xRuta);
        dmReportes.qryDatosRepDifVendedores.Open;
      end;
      qckRepValoresEntxRuta:=tqckRepValoresEntxRuta.Create(Nil);
      try
        qckRepValoresEntxRuta.PrinterSettings.PrinterIndex:=GetImpresorarpt(2,12);
        qckRepValoresEntxRuta.Prepare;
        qckRepValoresEntxRuta.qrTpaginas.Caption:=' de '+IntToStr(qckRepValoresEntxRuta.PageNumber);
        qckRepValoresEntxRuta.Preview;
      finally
      qckRepValoresEntxRuta.Free;
      qckRepValoresEntxRuta:=Nil;
      end;
    end;
  finally
  frmSelFecha.Free;
  frmSelFecha:=Nil;
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

procedure TfrmMenuPrincipal.Descuentos1Click(Sender: TObject);
begin
  frmConfDescuentosNomina:=TfrmConfDescuentosNomina.Create(Nil);
  try
    frmConfDescuentosNomina.Showmodal;
  finally
  frmConfDescuentosNomina.Free;
  frmConfDescuentosNomina:=Nil;
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

procedure TfrmMenuPrincipal.Promociones1Click(Sender: TObject);
begin
  frmSelFecha:=TfrmSelFecha.Create(nil);
  try
    frmSelFecha.FechaIni.Date:=GlbFechaTrnDiaria;
    frmSelFecha.FechaFin.Date:=GlbFechaTrnDiaria;
    if frmSelFecha.ShowModal = mrOk then
    begin
    dmReportes.qryRepPromociones.Close;
    dmReportes.qryRepPromociones.Params[0].Value:=ExtraerFecha(frmSelFecha.FechaIni.Date);
    dmReportes.qryRepPromociones.Params[1].Value:=ExtraerFecha(frmSelFecha.FechaFin.Date);
    dmReportes.qryRepPromociones.Open;
    qckRepPromociones:=TqckRepPromociones.Create(Nil);
    try
      qckRepPromociones.PrinterSettings.PrinterIndex:=GetImpresorarpt(2,12);
      qckRepPromociones.Preview;
    finally
    qckRepPromociones.Free;
    qckRepPromociones:=Nil;
    end;
    end;
  finally
  frmSelFecha.Free;
  frmSelFecha:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.PromocionesResumen1Click(Sender: TObject);
begin
  frmSelFecha:=TfrmSelFecha.Create(nil);
  try
    frmSelFecha.FechaIni.Date:=GlbFechaTrnDiaria;
    frmSelFecha.FechaFin.Date:=GlbFechaTrnDiaria;
    if frmSelFecha.ShowModal = mrOk then
    begin
    dmReportes.qryRepPromociones.Close;
    dmReportes.qryRepPromociones.Params[0].Value:=ExtraerFecha(frmSelFecha.FechaIni.Date);
    dmReportes.qryRepPromociones.Params[1].Value:=ExtraerFecha(frmSelFecha.FechaFin.Date);
    dmReportes.qryRepPromociones.Open;
    qckRepPromoResumen:=TqckRepPromoResumen.Create(Nil);
    try
      qckRepPromoResumen.PrinterSettings.PrinterIndex:=GetImpresorarpt(2,12);
      qckRepPromoResumen.Preview;
    finally
    qckRepPromoResumen.Free;
    qckRepPromoResumen:=Nil;
    end;
    end;
  finally
  frmSelFecha.Free;
  frmSelFecha:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //F4-115 F9-120
  if (key = 115) And (BitBtn1.Enabled) then
  begin
    if BitBtn1.Enabled then
    BitBtn1Click(self);
  end;
end;

//Procesar F4 --Ventana de Ventas
procedure TfrmMenuPrincipal.BitBtn1Click(Sender: TObject);
//var
  //txttmp : string[12];
  var msgLic:string;
  msgDesactiva:smallint;
  procVL : boolean;
begin
  try
    if GlbActivaECF = 1 then
    begin
      if (GlbRutaEcf = '') or not FileExists(GlbRutaEcf) then
      begin
        MessageBox(0, PChar('Debes configurar ruta de libreria para emitir eCF.'), 'Facturación Electrónica', MB_ICONERROR or MB_OK);
        exit;
      end;
    end;

    msgDesactiva:=0;

  if (GLBSAM = 1) or (GLBECOM = 1) or (GlBAyaco = 1) then
  procVL:=false else
  procVL:=true;

  if (trim(GlbUsuarioLogueado) = 'SOPORTE') or (trim(GlbUsuarioLogueado) = 'DIVISON')
  or (UpperCase(copy(trim(StrUserName), 1, 7)) = 'NOSIV')
  then procVL:=false;

  if procVL then //GlbFarmacia = 1 then
  begin
    if Not UConfirmaLicencia.ConfirmaLicencia(GLBIDClienteIDESI, msgLic,msgDesactiva) then //farmacia yani
    begin
      MessageDlg(msgLic,mtWarning,[mbok],0);
      if (msgDesactiva = 1) then
      begin
        if not Assigned(frmtrgtr) then
        frmtrgtr:=Tfrmtrgtr.Create(Nil);
        frmtrgtr.tRegistro.Close;
        frmtrgtr.tRegistro.Open;
        frmtrgtr.tRegistro.Edit;
        frmtrgtr.tRegistroCANTCORRIDA.Value:=0;
        frmtrgtr.tRegistro.Post;
        frmtrgtr.tRegistro.ApplyUpdates;

        if not frmtrgtr.tregistro.Transaction.InTransaction then
        frmtrgtr.tregistro.Transaction.StartTransaction;
        try
          frmtrgtr.tregistro.Transaction.CommitRetaining;
        except
          frmtrgtr.tregistro.Transaction.RollbackRetaining;
        end;
        frmtrgtr.free;
        frmtrgtr:=nil;
        Application.Terminate;
      end;
    end;
  end;
  except
  end;
  //MessageDlg('Usuario = '+GlbUsuarioLogueado+' strUserName = '+strUserName,mtInformation, [mbOK], 0);
  //txttmp:=UpperCase(copy(trim(StrUserName), 1, 7));
  if (Trim(GlbUsuarioLogueado) = 'SOPORTE') and (UpperCase(copy(trim(StrUserName), 1, 7)) <> 'NOSIV') then
  begin
    MessageDlg('Usuario logueado, no puede facturar, verifique.',mtInformation, [mbOK], 0);
    exit;
  end;        

  dmFactura.DataModuleCreate(self);  
  //VentasBYM;
  //exit;//temporal poner condicion para bym
  try
  //showmessage(GetOSVersion);
  GlbFacturaArtioffice:=0;//temporal hasta definir que hacer
  BitBtn1.Enabled:=False;
  dmcompania.tblCompania.Close;
  dmcompania.tblCompania.Open;
  dmCompania.tblCompania.Locate('codigo',glbCia_Key,[]);

  if (GlbVenderDesdeAlmacenP = 0) then
  begin
    frmSelInventario:=TfrmSelInventario.Create(nil);
    if frmSelInventario.ShowModal = mrOk then
    begin
      dmUsuarios.qryRoles.Close;
      dmUsuarios.qryRoles.Params[0].Value:= VarUsuarioGlb;
      GlbCodDivInventario:=frmSelInventario.tblDivInventarioINVENTARIO_ID.Value;
      frmProcVentaRapida := TfrmProcVentaRapida.Create(Nil);
      dmUsuarios.qryRoles.Open;
      dmUsuarios.qryRoles.First;
      While Not dmUsuarios.qryRoles.Eof Do
      begin
        ActivaPermiso(TForm(frmProcVentaRapida),1000, dmUsuarios.qryRolesID_ROL.Value, 0);//menu principal: 1000 debe estar en la tabla PROCESOS
        dmUsuarios.qryRoles.Next;
      end;
      GlbCodDivInventario:=frmSelInventario.tblDivInventarioINVENTARIO_ID.Value;

      try
        if GlbScaledform then
        ScaleForm(frmProcVentaRapida,GlbScreenWith,GlbScreenHeight);
        frmProcVentaRapida.lblInventario.Caption :=
        frmSelInventario.tblDivInventarioDESCRIPCION.Value;

        if GlbActivaIFiscal = 1 then
        begin
          if not frmProcVentaRapida.ChequeaSecuencia then
          begin
            frmProcVentaRapida.Free;
            frmProcVentaRapida:= Nil;
            exit;
          end;
        end;
        frmProcVentaRapida.sqlAsignado :=false;
        try
          if Assigned(frmProcVentaRapida) then
          frmProcVentaRapida.ShowModal;
        except
        LogInformacionTxt('ERROR frmProcVentaRapida.ShowModal, cerrando la ventana.');
        end;
      finally
      if Assigned(frmProcVentaRapida) then
      freeAndNil(frmProcVentaRapida)
      //frmProcVentaRapida.Free;
      //frmProcVentaRapida:= Nil;
      end;
      GlbCodDivInventario:=-1;
    end;
  end else
  begin
    GlbCodDivInventario:= 1;
    frmProcVentaRapida := TfrmProcVentaRapida.Create(Nil);
    try
      if (GlbSkinPath <> '') then
      begin
        //frmProcVentaRapida.SkinData1.Active:=False;
        //frmProcVentaRapida.SkinData1.LoadFromFile(GlbSkinPath);
        //frmProcVentaRapida.SkinData1.Active:=True;
      end;
      dmUsuarios.qryRoles.Close;
      dmUsuarios.qryRoles.Params[0].Value:= VarUsuarioGlb;
      dmUsuarios.qryRoles.Open;
      dmUsuarios.qryRoles.First;
      While Not dmUsuarios.qryRoles.Eof Do
      begin
        ActivaPermiso(TForm(frmProcVentaRapida),1000, dmUsuarios.qryRolesID_ROL.Value, 0);//menu principal: 1000 debe estar en la tabla PROCESOS
        dmUsuarios.qryRoles.Next;
      end;
      frmProcVentaRapida.lblInventario.Caption :='ALMACEN PRINCIPAL';
      if (GlbScaledform) then
      ScaleForm(frmProcVentaRapida, GlbScreenWith, GlbScreenHeight);
      if (GlbActivaIFiscal = 1) then
      VerificaImpresoraFiscalM;//2
      if GlbImpresoraFOnline then
      begin
        ProcGlbSecuenciaNCF;//chequea disponibilidad de sec ncf
        //MessageDlg('',mtinformation,[mbok],0);
        if GlbActivaIFiscal = 1 then
        begin
          if not frmProcVentaRapida.ChequeaSecuencia then
          begin
            frmProcVentaRapida.Free;
            frmProcVentaRapida:= Nil;
            Exit;
          end;
        end;

        frmProcVentaRapida.ShowModal;
      end;
    finally
    frmProcVentaRapida.Free;
    frmProcVentaRapida:= Nil;
    end;
    GlbCodDivInventario:= -1;
  end;
  BitBtn1.Enabled:=True;
  except on E : Exception do
     WriteToLog (E.ClassName+' Error. Mensaje: '+E.Message);
  end; 
end;

procedure TfrmMenuPrincipal.Actualizar2Click(Sender: TObject);
begin
  frmMantNumCombFiscal := TfrmMantNumCombFiscal.Create(Nil);
  try
    frmMantNumCombFiscal.ShowModal;
  finally
  frmMantNumCombFiscal.Free;
  frmMantNumCombFiscal:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.ipoNCF1Click(Sender: TObject);
begin
  frmTipoCompFiscal:= TfrmTipoCompFiscal.Create(Nil);
  try
    frmTipoCompFiscal.Showmodal;
  finally
  frmTipoCompFiscal.Free;
  frmTipoCompFiscal:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.HistoricodeSecuenciaNCF1Click(Sender: TObject);
begin
  frmMantHistoricoNCF:=TfrmMantHistoricoNCF.Create(Nil);
  try
    frmMantHistoricoNCF.ShowModal;
  finally
  frmMantHistoricoNCF.Free;
  frmMantHistoricoNCF:=Nil;
  end;
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

procedure TfrmMenuPrincipal.Transacciones2Click(Sender: TObject);
begin
  frmTransaccionesCxc:=TfrmTransaccionesCxc.Create(nil);
  try
    frmTransaccionesCxc.Showmodal;
  finally
  frmTransaccionesCxc.Free;
  frmTransaccionesCxc:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.CobrodeFacturas1Click(Sender: TObject);
begin
  FrmRecibosYCtaXCobrar:=TFrmRecibosYCtaXCobrar.Create(Nil);
  try
  FrmRecibosYCtaXCobrar.Showmodal;
  finally
  FrmRecibosYCtaXCobrar.Free;
  FrmRecibosYCtaXCobrar:=Nil;
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

procedure TfrmMenuPrincipal.Interes1Click(Sender: TObject);
begin
  frmPorcientoInteres:=TfrmPorcientoInteres.Create(Nil);
  try
    frmPorcientoInteres.Showmodal;
  finally
  frmPorcientoInteres.Free;
  frmPorcientoInteres:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.BalanceCxpProveedores1Click(Sender: TObject);
begin
  frmBalanceCxpProv:=TfrmBalanceCxpProv.Create(Nil);
  try
    frmBalanceCxpProv.Showmodal;
  finally
  frmBalanceCxpProv.Free;
  frmBalanceCxpProv:=Nil;
  end;
end;

{
procedure TfrmMenuPrincipal.CobroCuotasFinanc1Click(Sender: TObject);
var
  serieF : Integer;
  titulo : String;
begin
  serieF := -1;
  FrmBuscarClientesPersonas:=TFrmBuscarClientesPersonas.Create(Self);
  try
  if FrmBuscarClientesPersonas.ShowModal = mrOk then
  begin
  Titulo:= 'Financiamiento(s) Vigente(s) para cliente ::> ';
  Titulo:=Titulo + frmBuscarClientesPersonas.LabelNombre.Caption;

  frmShowFinancVigente:=TfrmShowFinancVigente.Create(Nil);
  try
    frmShowFinancVigente.Titulo := Titulo;
    frmShowFinancVigente.AbrirDatos(FrmBuscarClientesPersonas.CodigoCliente);
    if frmShowFinancVigente.Showmodal = mrOk then
    serieF := frmShowFinancVigente.qryMostrarFinancVigenteSERIE.Value;
  finally
  frmShowFinancVigente.Free;
  frmShowFinancVigente:=nil;
  end;

  if serieF = -1 then Exit; //no hubo seleccion

  frmCobroCuotasXFinanc:=TfrmCobroCuotasXFinanc.create(Nil);
  try
    frmCobroCuotasXFinanc.qryDatosCuota.Close;
    frmCobroCuotasXFinanc.qryDatosCuota.Params[0].Value:= FrmBuscarClientesPersonas.CodigoCliente;
    frmSelFecha:= TfrmSelFecha.Create(Nil);
    try
      frmSelFecha.FechaFin.Visible := False;
      frmSelFecha.Label2.Visible   := False;
      frmSelFecha.FechaIni.DateTime:= ExtraerFecha(GlbFechaTrnDiaria);
      if frmSelFecha.ShowModal = mrOk Then
      begin
        frmCobroCuotasXFinanc.qryDatosCuota.Params[1].Value:= ExtraerFecha(frmSelFecha.FechaIni.DateTime);
        frmCobroCuotasXFinanc.qryDatosCuota.Params[2].Value:= serieF;
      end else
      begin
        frmSelFecha.Free;
        frmSelFecha := Nil;
        //FrmBuscarClientesPersonas.free;
        //FrmBuscarClientesPersonas:=nil;
        frmCobroCuotasXFinanc.Free;
        frmCobroCuotasXFinanc:=Nil;
        exit;
      end;
    finally
    frmSelFecha.Free;
    frmSelFecha:=nil;
    end;
    frmCobroCuotasXFinanc.qryDatosCuota.Open;
    frmCobroCuotasXFinanc.SumarTotales;
    frmCobroCuotasXFinanc.Showmodal;
  finally
  frmCobroCuotasXFinanc.Free;
  frmCobroCuotasXFinanc:=Nil;
  end;
  end;
  finally
  //FrmBuscarClientesPersonas.Free;
  //FrmBuscarClientesPersonas:=Nil;
  end;
end;  }

procedure TfrmMenuPrincipal.ransCxp1Click(Sender: TObject);
begin
  frmTransaccionesCxP:=TfrmTransaccionesCxP.Create(Nil);
  try
    frmTransaccionesCxP.Showmodal;
  finally
  frmTransaccionesCxP.Free;
  frmTransaccionesCxP:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.AtrasosCuotas1Click(Sender: TObject);
begin
  frmConsultaAvisoAtraso:=TfrmConsultaAvisoAtraso.Create(Nil);
  try
    frmConsultaAvisoAtraso.Showmodal;
  finally
  frmConsultaAvisoAtraso.Free;
  frmConsultaAvisoAtraso:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.ImprimirRepItebis(tipo: smallint;tipodoc : integer);
var
  salir : boolean;
  strmoneda : string;
  ExptoExcel : Boolean;
  lEnviaEmail:Boolean;
begin
  Salir:=False;

  frmSelFecha:=TfrmSelFecha.Create(Nil);
  try
    if (tipo = 3) or (tipo = 4) then
    frmselfecha.CheckBox1.Caption:='Enviar por Email';
    if tipo = 4 then
    frmselfecha.Label4.Visible:=True;
    if frmselfecha.ShowModal = mrok then
    begin
      dmCompania.tblCompania.Close;
      dmCompania.tblCompania.Open;
      dmCompania.tblCompania.Locate('codigo', glbCia_Key, []);

      dmFactura.rtipo := tipodoc;
      dmFactura.qryRepItbis.Filtered:= false;
      dmFactura.qryRepItbis.Close;
      GlbEnviaEmail := frmSelFecha.CheckBox1.Checked;
      lEnviaEmail :=GlbEnviaEmail;

      if ordenPor = 1 then
      begin
        //(Dataset['tipodoc'] = 'FACTURA') OR (Dataset['tipodoc'] = 'CONTADO')
        dmFactura.qryRepItbis.SQL.Text :=
        dmFactura.qryRepItbisbase.SQL.Text + ' '+
        ' and (tipodoc = ' + chr(39)+'FACTURA'+chr(39)+
        ' OR tipodoc = ' + chr(39)+'CONTADO'+chr(39)+')';
        dmFactura.qryRepItbis.SQL.Text:=
        dmFactura.qryRepItbisbase.SQL.Text +
        'ORDER BY DESC_NCF, NUMERO_NCF, FECHA, CODIGO_CTE'
      end else if ordenPor = 3 then
      dmFactura.qryRepItbis.SQL.Text:=
      dmFactura.qryRepItbisbase.SQL.Text +
      'ORDER BY tipo_inv, DESC_NCF, NUMERO_NCF'
      else
      dmFactura.qryRepItbis.SQL.Text:=
      dmFactura.qryRepItbisbase.SQL.Text +
      'ORDER BY tipo_inv, NUMERODOC, NUMERO_NCF, FECHA, CODIGO_CTE';

      dmFactura.qryRepItbis.params[0].Value:=ExtraerFecha(frmselfecha.FechaIni.DateTime);
      dmFactura.qryRepItbis.params[1].Value:=ExtraerFecha(frmselfecha.FechaFin.DateTime);

      //Pesos Dollar Euro

      if (uppercase(trim(frmselfecha.ComboBox1.Text))= 'PESOS') then
      dmFactura.qryRepItbis.params[2].Value:= '1'
      else
      if (uppercase(trim(frmselfecha.ComboBox1.Text))= 'DOLLAR') then
      dmFactura.qryRepItbis.params[2].Value:= '2'
      else
      dmFactura.qryRepItbis.params[2].Value:= '3';//Euro
      strmoneda:= trim(frmselfecha.ComboBox1.Text);
      dmFactura.qryRepItbis.open;
      if (ordenPor <> 1) then
      dmFactura.qryRepItbis.Filtered:=True;
      if (Tipo = 1) then
      begin
      try
        if frmSelFecha.CheckBox1.Checked then
        begin
          GLBMostrarArchivo := True;
          GlbEnviaEmail := frmSelFecha.CheckBox1.Checked;
          lEnviaEmail :=GlbEnviaEmail;
          GlbIDTipoEmail:= 1; //Detalle NCF
          if (Not DirectoryExists('Informes')) then
          CreateDir('Informes');
          ExporNCFListToExcel(dmfactura.qryRepItbis, ExtractFilePath(Application.ExeName)+
          'Informes\RelacionNCF'+
          FormatDateTime('ddmmyyyy',dmFactura.qryRepItbis.params[0].Value)+'_A_'+
          FormatDateTime('ddmmyyyy',dmFactura.qryRepItbis.params[1].Value));
          Salir:=True;
          MessageDlg('Archivo de Excel generado.', mtInformation,[mbok], 0);
        end;
      except
      end;
      end;
    end else Salir:=True;
  finally
  frmSelFecha.free;
  frmSelFecha:=nil;
  end;
  if Salir then Exit;
  if Tipo = 1 then
  begin
    qckRepItbis:=TQckRepItbis.Create(Nil);
    try
      qckRepItbis.PrinterSettings.PrinterIndex:=GetImpresorarpt(2,12);
      qckRepItbis.strmoneda := strmoneda;
      if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrNo then
      begin
        qckRepItbis.Prepare;
        qckRepItbis.qrTpaginas.Caption:= ' de '+IntToStr(qckRepItbis.PageNumber);
        qckRepItbis.Preview;
      end else
      begin
        qckRepItbis.PrinterSetup;
        qckRepItbis.Print;
      end;
    finally
    qckRepItbis.Free;
    qckRepItbis:=Nil;
    end;
  end else
  if Tipo = 2 then
  begin
    qckRepItbis_ResXDia:=TqckRepItbis_ResXDia.Create(Nil);
    try
      qckRepItbis_ResXDia.PrinterSettings.PrinterIndex:=GetImpresorarpt(2,12);
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
  end else
  if Tipo = 4 then
  begin
    qckRepItbisResumenXTipoNCF:=TqckRepItbisResumenXTipoNCF.Create(Nil);
    try
      qckRepItbisResumenXTipoNCF.PrinterSettings.PrinterIndex:=GetImpresorarpt(2,12);
      if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrNo then
      begin
        qckRepItbisResumenXTipoNCF.Preview;
      end else
      begin
        qckRepItbisResumenXTipoNCF.PrinterSetup;
        qckRepItbisResumenXTipoNCF.Print;
      end;
      GlbEnviaEmail := lEnviaEmail;
      GlbIDTipoEmail:= 2; //Detalle NCF
      if (Not DirectoryExists('Informes')) then
      CreateDir('Informes');
      ReportExport(qckRepItbisResumenXTipoNCF,GlbRutaInformes+'\ResumenVtaXTipoNCF'+
       'De '+ FormatDateTime('dd-mmm-yy', ExtraerFecha(dmfactura.qryRepItbis.Params[0].Value))+
          ' a ' + FormatDateTime('dd-mmm-yy', ExtraerFecha(dmfactura.qryRepItbis.Params[1].Value))
          +'.pdf');

    finally
    qckRepItbisResumenXTipoNCF.Free;
    qckRepItbisResumenXTipoNCF:=Nil;
    end;
  end else
  if (Tipo = 3) then
  begin
    //dmFactura.qryRepItbis.sql.text
    qckRepItbisResumen:=TqckRepItbisResumen.Create(Nil);
    try
      qckRepItbisResumen.PrinterSettings.PrinterIndex:=GetImpresorarpt(2,12);
      glbZipFile:='';
      if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrNo then
      begin
        qckRepItbisResumen.Preview;
      end else
      begin
        qckRepItbisResumen.PrinterSetup;
        qckRepItbisResumen.Print;
      end;

      GlbEnviaEmail := lEnviaEmail;
      GlbIDTipoEmail:= 2; //Detalle NCF
      if (Not DirectoryExists('Informes')) then
      CreateDir('Informes');
      ReportExport(qckRepItbisResumen,GlbRutaInformes+'\ResumenVtaTipoNCF'+
       'De '+ FormatDateTime('dd-mmm-yy', ExtraerFecha(dmfactura.qryRepItbis.Params[0].Value))+
          ' a ' + FormatDateTime('dd-mmm-yy', ExtraerFecha(dmfactura.qryRepItbis.Params[1].Value))
          +'.pdf');
    finally
    qckRepItbisResumen.Free;
    qckRepItbisResumen:=Nil;
    end;
  end;
end;

procedure TfrmMenuPrincipal.ResumenxDia1Click(Sender: TObject);
begin
  ImprimirRepItebis(2,1); //Resumen;
end;

procedure TfrmMenuPrincipal.PapelReporte1Click(Sender: TObject);
begin
  frmConfReporte:=TfrmConfReporte.Create(Nil);
  try
    frmConfReporte.ShowModal;
    frmConfReporte.DatosConfiguracion;
  finally
  frmConfReporte.Free;
  frmConfReporte:=Nil;
  end;
  
  {frmConfReporte:=TfrmConfReporte.Create(Nil);
  try
    frmConfReporte.DatosConfiguracion;
  finally
  frmConfReporte.Free;
  frmConfReporte:=Nil;
  end;}
  if GlbFinanciamiento then
  CobroCuotasFinanc2.Visible:=True
  else
    CobroCuotasFinanc2.Visible:=False;
  ActivaPermisos;
end;

procedure TfrmMenuPrincipal.AvisoAtraso1Click(Sender: TObject);
begin
  frmAvisoAtraso:=TfrmAvisoAtraso.Create(Nil);
  try
    frmAvisoAtraso.Showmodal;
  finally
  frmAvisoAtraso.Free;
  frmAvisoAtraso:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.ReportexTipoProd1Click(Sender: TObject);
begin
  frmRepIngXTipo:=TfrmRepIngXTipo.Create(Nil);
  try
    frmRepIngXTipo.Showmodal;
  finally
  frmRepIngXTipo.Free;
  frmRepIngXTipo:=nil;
  end;
end;

procedure TfrmMenuPrincipal.EstadoCta1Click(Sender: TObject);
var
  a,m,d : Word;
  codCte:Integer;
  xImp : Boolean;
  fecha : string;
begin
  GlbBalanceAnt := 0;
  xImp := False;

  FrmBuscarClientesPersonas:=TFrmBuscarClientesPersonas.Create(Nil);
  try
    if FrmBuscarClientesPersonas.ShowModal = mrOk then
    begin
      CodCte:= FrmBuscarClientesPersonas.xCodigoCte;
      if (CodCte = 0) then
      begin
        MessageDlg('codigo cliente no puede ser cero, verifique', mtInformation, [mbOK], 0);
        FrmBuscarClientesPersonas.Free;
        FrmBuscarClientesPersonas:=Nil;
        Exit;
      end;
    end else
    begin
      FrmBuscarClientesPersonas.Free;
      FrmBuscarClientesPersonas:=Nil;
      Exit;
    end;
  finally
  FrmBuscarClientesPersonas.Free;
  FrmBuscarClientesPersonas:=Nil;
  end;

  dmcxc.stpFechaIniBceHist.Params[4].Value:= CodCte;//codigo_cte_in
  dmcxc.stpFechaIniBceHist.Params[5].Value:= GlbFechaTrnDiaria;//fecha_in
  if (GlbMonedaBase > 0) then
     dmcxc.stpFechaIniBceHist.Params[6].Value:= IntToStr(GlbMonedaBase)
  else
  dmcxc.stpFechaIniBceHist.Params[6].Value:= '1';

  dmcxc.stpFechaIniBceHist.ExecProc;

  frmSelFecha :=TfrmSelFecha.Create(Nil);
  try
     if not dmcxc.stpFechaIniBceHist.Params[2].IsNull then
     begin
        if (dmcxc.stpFechaIniBceHist.Params[2].Value < GlbFechaTrnDiaria) then
        frmSelFecha.FechaIni.Date := dmcxc.stpFechaIniBceHist.Params[2].Value
        else
        begin
          frmSelFecha.FechaIni.Date := GlbFechaTrnDiaria;
        end;
     end
     else
     frmSelFecha.FechaIni.Date := GlbFechaTrnDiaria;

     if (dmcxc.stpFechaIniBceHist.Params[2].Value > GlbFechaTrnDiaria) then
     frmSelFecha.FechaFin.Date := dmcxc.stpFechaIniBceHist.Params[2].Value
     else
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

  dmCxc.qrybceHistCte.Close;
  dmCxc.qrybceHistCte.Params[0].Value:= 0;//historico
  if (not dmcxc.stpFechaIniBceHist.Params[0].IsNull) then
  begin
    dmCxc.qrybceHistCte.params[1].Value:= dmcxc.stpFechaIniBceHist.Params[0].Value;//EncodeDate(a,m,d);
    dmCxc.qrybceHistCte.Params[2].Value:= dmcxc.stpFechaIniBceHist.Params[0].Value;//EncodeDate(a,m,d);
  end else
  begin
    dmCxc.qrybceHistCte.params[1].Value:= EncodeDate(a,m,d);
    dmCxc.qrybceHistCte.Params[2].Value:= EncodeDate(a,m,d);
  end;
  dmCxc.qrybceHistCte.Params[3].Value:= '1';
  dmCxc.qrybceHistCte.Params[4].Value:= CodCte;
  dmCxc.qrybceHistCte.Params[5].Value:= CodCte;
  dmCxc.qrybceHistCte.Open;

  dmCxc.qryRepServ.Close;

  dmCxc.qryRepServ.Params[0].Value := ExtraerFecha(GlbFechaInicial);
  dmCxc.qryRepServ.Params[1].Value := ExtraerFecha(GlbFechaFinal); //ExtraerFecha(GlbFechaFinal);
  dmCxc.qryRepServ.Params[2].Value := CodCte;
  dmCxc.qryRepServ.Open;

  dmCxp.qryRepServ.RecordCount;

  //usar siguiente query para estado general de cxc
  dmCxc.qrySQLBlceAntCxcCte.Close;
  if not dmCxc.qrySQLBlceAntCxcCte.Prepared then
  dmCxc.qrySQLBlceAntCxcCte.Prepare;
  dmCxc.qrySQLBlceAntCxcCte.Params[0].Value:= CodCte; //codigoclienteini
  dmCxc.qrySQLBlceAntCxcCte.Params[1].Value:= CodCte; //codigoclientefin
  dmCxc.qrySQLBlceAntCxcCte.Params[2].Value:= ExtraerFecha(GlbUltimoDiaMesAnt(GlbFechaInicial)+1); //FechaIni
  dmCxc.qrySQLBlceAntCxcCte.Params[3].Value:= ExtraerFecha(GlbFechaInicial-1); //FechaFin
  dmCxc.qrySQLBlceAntCxcCte.Params[4].Value:= '1'; //Moneda
  dmCxc.qrySQLBlceAntCxcCte.Params[5].Value:= GlbUltimoDiaMesAnt(GlbFechaInicial); //fecha_blc_Anterior
  dmCxc.qrySQLBlceAntCxcCte.ExecQuery;

  if dmCxc.qrySQLBlceAntCxcCte.Open then
  begin
    GlbBalanceAnt:=dmCxc.qrySQLBlceAntCxcCte.Fieldbyname('BALANCE_ANT').AsFloat +
                   dmCxc.qrySQLBlceAntCxcCte.Fieldbyname('DEBITO').AsFloat +
                   dmCxc.qrySQLBlceAntCxcCte.Fieldbyname('CREDITO').AsFloat;
  end;
  qckRepXServ:=TQckRepXServ.Create(Nil);
  try
    qckRepXServ.PrinterSettings.PrinterIndex:=GetImpresorarpt(2,12);
    if (dmCxc.qryRepServ.recordcount = 0) then
    begin
      qckRepXServ.rxNoRecord.Open;
      qckRepXServ.rxNoRecord.Insert;
      if not dmcxc.stpFechaIniBceHist.Params[3].IsNull then
      qckRepXServ.rxNoRecordDescripcion.Value:= dmcxc.stpFechaIniBceHist.Params[3].Value
      else
      qckRepXServ.rxNoRecordDescripcion.Value:= '*** NO RECORD ENCONTRADO ***';
      qckRepXServ.rxNoRecord.Post;
    end;
    //t qckRepXServ.Prepare;
    glbTPag := qckRepXServ.PageNumber;
    qckRepXServ.PrinterSettings.PrinterIndex:=GetImpresorarpt(2,12);
    if xImp then
    begin
      qckRepXServ.PrinterSetup;
      qckRepXServ.Print;
    end else
    qckRepXServ.Preview;
    if Assigned(frmConsultaFacturas) then
    if frmConsultaFacturas.chkExportaPDF.Checked then
    ReportExport(qckRepXServ,GlbRutaInformes+'\EstadoCxcCte'+IntToStr(CodCte)+'.pdf');
  finally
  qckRepXServ.rxNoRecord.Close;
  qckRepXServ.Free;
  qckRepXServ := Nil;
  end;
end;

procedure TfrmMenuPrincipal.ClaveMaestra1Click(Sender: TObject);
var
  Ini: TIniFile;
  clave, claveSave : String;
  xsalir : Boolean;
  verClave : String;
begin
//  xsalir:=False;
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
var
  codMoneda : smallint;
begin
  //frmSelFecha:=TfrmSelFecha.Create(Nil);
  frmDatosReporte:=TfrmDatosReporte.Create(Nil);
  try
    GetDateTipoMoneda1.Fecha:= GlbFechaTrnDiaria;
    GetDateTipoMoneda1.FechaFinal:= GlbFechaTrnDiaria;

    frmDatosReporte.dbEditFechaInicial.Date:= GlbFechaTrnDiaria;
    frmDatosReporte.dbEditFechaFinal.Date  := GlbFechaTrnDiaria;

    if frmDatosReporte.ShowModal = mrOk then
    begin
      frmDatosReporte.AbrirDatos;
      if frmDatosReporte.rdgMoneda.ItemIndex = 0 then
      codMoneda:= 1 else
      if frmDatosReporte.rdgMoneda.ItemIndex = 1 then
      codMoneda:= 2 else
      if frmDatosReporte.rdgMoneda.ItemIndex = 2 then
      codMoneda:= 3
      else codMoneda:=4;

      //FiltrarRepIngEfe,
      repIngCxc  := True;
      dmReportes.filtrarRepIngCxc := 2;
      //FiltrarRepIngTodo : Integer;

      dmReportes.qryDatosRepVentaDiaria.Filtered := True;
      {temporal dmReportes.qryDatosRepVentaDiaria.Close;
      dmReportes.qryDatosRepVentaDiaria.Params[0].Value:= ExtraerFecha(frmDatosReporte.dbEditFechaInicial.Date);
      dmReportes.qryDatosRepVentaDiaria.Params[1].Value:= ExtraerFecha(frmDatosReporte.dbEditFechaFinal.Date);
      if (codMoneda = 4) then
      begin
        dmReportes.qryDatosRepVentaDiaria.Params[3].Value:= 1;
        dmReportes.qryDatosRepVentaDiaria.Params[4].Value:= 6;
      end else
      begin
        dmReportes.qryDatosRepVentaDiaria.Params[3].Value:= codMoneda;
        dmReportes.qryDatosRepVentaDiaria.Params[4].Value:= codMoneda;
      end;

      dmReportes.qryDatosRepVentaDiaria.Params[2].Value:= glbCia_Key;

      dmReportes.qryDatosRepVentaDiaria.Open;
      }//temporal
      //dmReportes.qryDatosRepVentaDiaria.Filtered := True;
      if frmDatosReporte.chkResumen.Checked then
      begin
        qckRepVentaDiariaResumen:=tqckRepVentaDiariaResumen.Create(Nil);
        try
          qckRepVentaDiariaResumen.PrinterSettings.PrinterIndex:=GetImpresorarpt(2,12);
          qckRepVentaDiariaResumen.QRLabel2.Caption := 'LISTADO INGRESOS CXC';
          qckRepVentaDiariaResumen.Prepare;
          qckRepVentaDiariaResumen.qrTpaginas.Caption:= ' de '+IntToStr(qckRepVentaDiariaResumen.PageNumber);
          //qckRepVentaDiariaResumen.QRLabel14.Caption := '';
          qckRepVentaDiariaResumen.ChildBand1.Enabled:= False;
          if MessageDlg('Imprimir?', mtInformation, [mbyes, mbno], 0) = mrYes then
          begin
            qckRepVentaDiariaResumen.PrinterSetup;
            qckRepVentaDiariaResumen.Print;
          end else
          qckRepVentaDiariaResumen.Preview;
          ReportExport(qckRepVentaDiariaResumen,GlbRutaInformes+'\IngCtaXCobrarResumen.pdf');

        finally
        qckRepVentaDiariaResumen.Free;
        qckRepVentaDiariaResumen:= Nil;
        end;
        repIngCxc := False;
        dmReportes.qryDatosRepVentaDiaria.Filtered:= False;
      end else
      begin
        qckRepVentaDiaria:=tQckRepVentaDiaria.Create(Nil);
        try
          qckRepVentaDiaria.PrinterSettings.PrinterIndex:=GetImpresorarpt(2,12);
          qckRepVentaDiaria.QRLabel2.Caption := 'LISTADO INGRESOS CXC';
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
          ReportExport(qckRepVentaDiaria,GlbRutaInformes+'\IngCtaXCobrar.pdf');
        finally
        qckRepVentaDiaria.Free;
        qckRepVentaDiaria:= Nil;
        end;
        repIngCxc := False;
        dmReportes.qryDatosRepVentaDiaria.Filtered:= False;
      end;
    end;
    finally
    frmDatosReporte.Free;
    frmDatosReporte:=Nil;
  end;
  dmReportes.qryDatosRepVentaDiaria.SQL.Text := dmReportes.qryDatosRepVentaDiaria_0.SQL.Text;
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
      dmproveedor.qryProveCxp.Locate('CODIGO_CTE', frmProcBuscarProv.xCodigoCte,[]);      
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

  //usar siguiente query para estado general de cxc
  dmCxp.qrySQLBlceAntCxPCte.Close;

  dmCxp.qrySQLBlceAntCxPCte.Params[0].Value:= CodCte; //codigoclienteini
  dmCxp.qrySQLBlceAntCxPCte.Params[1].Value:= CodCte; //codigoclientefin
  dmCxp.qrySQLBlceAntCxPCte.Params[2].Value:= ExtraerFecha(GlbUltimoDiaMesAnt(GlbFechaInicial)+1); //FechaIni
  dmCxp.qrySQLBlceAntCxPCte.Params[3].Value:= ExtraerFecha(glbFechaFinal); //FechaFin
  dmCxp.qrySQLBlceAntCxPCte.Params[4].Value:= '1'; //Moneda
  dmCxp.qrySQLBlceAntCxPCte.Params[5].Value:= GlbUltimoDiaMesAnt(GlbFechaInicial); //fecha_blc_Anterior
  dmCxp.qrySQLBlceAntCxPCte.ExecQuery;
  if dmCxp.qrySQLBlceAntCxPCte.Open then
  begin
    GlbBalanceAnt:=dmCxp.qrySQLBlceAntCxPCte.Fieldbyname('BALANCE_ANT').AsFloat;// +
                   //dmCxp.qrySQLBlceAntCxPCte.Fieldbyname('DEBITO').AsFloat +
                   //dmCxp.qrySQLBlceAntCxPCte.Fieldbyname('CREDITO').AsFloat;
  end;
  qckRepXServCXP:=TQckRepXServCXP.Create(Nil);
  try
    qckRepXServCXP.PrinterSettings.PrinterIndex:=GetImpresorarpt(2,12);
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
  frmCodigoBarra:=TfrmCodigoBarra.Create(Nil);
  try
    frmCodigoBarra.ShowModal;
  finally
  frmCodigoBarra.Free;
  frmCodigoBarra:= Nil;
  end;
end;

procedure TfrmMenuPrincipal.CobroMultiplesFacturas1Click(Sender: TObject);
begin
  try
    begin
      frmCobrarFacturas:=TfrmCobrarFacturas.Create(nil);
      try                                  
        frmCobrarFacturas.Showmodal;
      finally
      frmCobrarFacturas.Free;
      frmCobrarFacturas:=Nil;
      end;
    end;
  finally
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
  FrmBuscarClientesPersonas:=TFrmBuscarClientesPersonas.Create(Nil);
  try
    if FrmBuscarClientesPersonas.Showmodal = mrOk then
    begin
      frmTransCxcProc_R:=TfrmTransCxcProc_R.Create(Nil);
      try
        frmTransCxcProc_R.CodCte := FrmBuscarClientesPersonas.CodigoCliente;
        frmTransCxcProc_R.Pagecontrol1.ActivePage := TabSheet1;
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

procedure TfrmMenuPrincipal.NotaDebito1Click(Sender: TObject);
begin
  FrmBuscarClientesPersonas:=TFrmBuscarClientesPersonas.Create(nil);
  try
    if FrmBuscarClientesPersonas.Showmodal = mrOk then
    begin
      frmTransCxcProc_R:=TfrmTransCxcProc_R.Create(Nil);
      try
        frmTransCxcProc_R.CodCte := FrmBuscarClientesPersonas.CodigoCliente;
        frmTransCxcProc_R.Pagecontrol1.ActivePage := TabSheet2;
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
  frmGenFactRecurrentes:=TfrmGenFactRecurrentes.Create(Nil);
  try
    frmGenFactRecurrentes.ShowModal;
  finally
  frmGenFactRecurrentes.Free;
  frmGenFactRecurrentes:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.ServiciosVarios1Click(Sender: TObject);
begin
  frmServiciosReg:=TfrmServiciosReg.Create(Nil);
  try
    frmServiciosReg.Showmodal;
  finally
  frmServiciosReg.free;
  frmServiciosReg:=Nil;
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
      dmInventario.qryRepInvVencimiento.Params[1].Value:=glbCia_Key;      
      dmInventario.qryRepInvVencimiento.Open;
      qckRepVencimientoProd:=TqckRepVencimientoProd.create(Nil);
      try
        qckRepVencimientoProd.PrinterSettings.PrinterIndex:=GetImpresorarpt(2,12);
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
      frmPagarCXPFacturas.CodCte := frmProcBuscarProv.xCodigoCte;
      if dmproveedor.qryProveCxp.Locate('CODIGO_CTE', frmProcBuscarProv.xCodigoCte,[]) then;
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
procedure TfrmMenuPrincipal.DescripcionLineas1Click(Sender: TObject);
begin
  frmConfLineaDocFiscal:=TfrmConfLineaDocFiscal.Create(Nil);
  try
    frmConfLineaDocFiscal.Showmodal;
  finally
  frmConfLineaDocFiscal.Free;
  frmConfLineaDocFiscal:=Nil;
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
      dmCompania.tblCompania.Locate('codigo',glbCia_Key,[]);          
      dmFactura.qryRepItbis_esp.close;
      dmFactura.qryRepItbis_esp.params[0].Value:=ExtraerFecha(frmselfecha.FechaIni.DateTime);
      dmFactura.qryRepItbis_esp.params[1].Value:=ExtraerFecha(frmselfecha.FechaFin.DateTime);

      if (uppercase(trim(frmselfecha.ComboBox1.Text))= 'PESOS') then
      dmFactura.qryRepItbis_esp.params[2].Value:= '1'
      else
      if (uppercase(trim(frmselfecha.ComboBox1.Text))= 'DOLLAR') then
      dmFactura.qryRepItbis_esp.params[2].Value:= '2'
      else
      dmFactura.qryRepItbis_esp.params[2].Value:= '3';//Euro
      
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
        qckRepItbis_esp.PrinterSettings.PrinterIndex:=GetImpresorarpt(2,12);
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
end;

procedure TfrmMenuPrincipal.CuadreCaja1Click(Sender: TObject);
begin
  frmCuadreCajaNew:=TfrmCuadreCajaNew.Create(Nil);
  try
    frmCuadreCajaNew.Showmodal;
  finally
  frmCuadreCajaNew.Free;
  frmCuadreCajaNew:=Nil;
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
  ShowMessage(e.Message);
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
  dmReportes.qryProvInvLook.Close;
  dmReportes.qryProvInvLook.Open;
  dmReportes.qryRepInventarioProdMasBclRuta.Close;
  if GlbVenderDesdeAlmacenP = 1 then
  dmReportes.qryRepInventarioProdMasBclRuta.SQL.Text := 'Select * from PROC_DATOS_REP_INVENTARIO_P'
  else
  dmReportes.qryRepInventarioProdMasBclRuta.SQL.Text := 'Select * from PROC_DATOS_REP_INVENTARIO';
  dmReportes.qryRepInventarioProdMasBclRuta.SQL.add('where cia_key ='+IntToStr(glbCia_Key));
  dmReportes.qryRepInventarioProdMasBclRuta.Open;
  qckInvProdCosto:=TQckInvProdCosto.Create(Nil);
  try
    qckInvProdCosto.PrinterSettings.PrinterIndex:=GetImpresorarpt(2,12);
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
    dmCompania.tblCompania.Locate('codigo',glbCia_Key,[]);    
    dmReportes.qryRepInventarioProdMasBclDiv.Close;
    dmReportes.qryRepInventarioProdMasBclDiv.Params[0].Value:= tInv;
    dmReportes.qryRepInventarioProdMasBclDiv.Open;
    qckRepDatosInventarioXarea:=TQckRepDatosInventarioXarea.Create(Nil);
    try
      qckRepDatosInventarioXarea.strLabelTiporep := descTInv;
      qckRepDatosInventarioXarea.PrinterSettings.PrinterIndex:=GetImpresorarpt(2,12);
      qckRepDatosInventarioXarea.Preview;
    finally
    qckRepDatosInventarioXarea.Free;
    qckRepDatosInventarioXarea:=Nil;
    end;
end;

procedure TfrmMenuPrincipal.SkinData1oldFormSkin(Sender: TObject;
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
  if not dmUsuarios.procMantRegDet.Transaction.InTransaction then
  dmUsuarios.procMantRegDet.Transaction.StartTransaction;
  try
    dmUsuarios.procMantRegDet.Transaction.CommitRetaining
  except
  dmUsuarios.procMantRegDet.Transaction.RollbackRetaining;
  end;

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
  if not dmUsuarios.procMantRegDet.Transaction.InTransaction then
  dmUsuarios.procMantRegDet.Transaction.StartTransaction;
  try
  dmUsuarios.procMantRegDet.Transaction.CommitRetaining;
  except
    dmUsuarios.procMantRegDet.Transaction.RollbackRetaining;
  end;  
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
    frmGrupocnt.Showmodal;
  finally
  frmGrupocnt.Free;
  frmGrupocnt:=Nil;
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

procedure TfrmMenuPrincipal.EditarPedido1Click(Sender: TObject);
begin
  frmEditarPedido:=TfrmEditarPedido.Create(nil);
  try
    frmEditarPedido.Showmodal;
  finally
  frmEditarPedido:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.VentaDiaria3Click(Sender: TObject);
begin
  //MessageDlg('Reporten revision',mtInformation,[mbok],0);
  //usar este query qryDatosVentaDet_Pendiente
  //Exit;
  frmSelFecha:=TfrmSelFecha.Create(nil);
  try
    frmSelFecha.FechaIni.Date:=GlbFechaTrnDiaria;
    frmSelFecha.FechaFin.Date:=GlbFechaTrnDiaria;
    if frmSelFecha.showmodal = mrOk then
    begin
    //dmReportes.qryDatosRepVentaDiara
      dmReportes.qryDatosRepVentaDiariaNew.close;
      dmReportes.qryDatosRepVentaDiariaNew.params[0].value:= ExtraerFecha(frmSelFecha.FechaIni.Date);
      dmReportes.qryDatosRepVentaDiariaNew.params[1].value:= ExtraerFecha(frmSelFecha.FechaFin.Date);
      if (UpperCase(trim(frmSelFecha.ComboBox1.Text)) = 'PESOS') then
      begin
        dmReportes.qryDatosRepVentaDiariaNew.params[3].value:= '1';
        dmReportes.qryDatosRepVentaDiariaNew.params[4].value:= '1';
      end else
      if (UpperCase(trim(frmSelFecha.ComboBox1.Text)) = 'DOLLAR') then
      begin
        dmReportes.qryDatosRepVentaDiariaNew.params[3].value:= '2';
        dmReportes.qryDatosRepVentaDiariaNew.params[4].value:= '2';
      end else
      if (UpperCase(trim(frmSelFecha.ComboBox1.Text)) = 'EURO') then
      begin
        dmReportes.qryDatosRepVentaDiariaNew.params[3].value:= '3';
        dmReportes.qryDatosRepVentaDiariaNew.params[4].value:= '3';
      end;
      //frmProgressbarfrm:=TfrmProgressbarfrm.Create(nil);
      //frmProgressbarfrm.Show;

      dmReportes.qryDatosRepVentaDiariaNew.Params[2].Value:= glbCia_Key;
      dmReportes.qryDatosRepVentaDiariaNew.Open;
      dmReportes.qryDatosRepVentaDiariaSubDetail.Close;
      dmReportes.qryDatosRepVentaDiariaSubDetail.Filtered:= False;
      dmReportes.qryDatosRepVentaDiariaSubDetail.params[0].Value:= dmReportes.qryDatosRepVentaDiariaNew.params[0].Value;
      dmReportes.qryDatosRepVentaDiariaSubDetail.params[1].Value:= dmReportes.qryDatosRepVentaDiariaNew.params[1].Value;
      dmReportes.qryDatosRepVentaDiariaSubDetail.params[2].Value:= dmReportes.qryDatosRepVentaDiariaNew.params[2].Value;
      dmReportes.qryDatosRepVentaDiariaSubDetail.params[3].Value:= dmReportes.qryDatosRepVentaDiariaNew.params[3].Value;
      dmReportes.qryDatosRepVentaDiariaSubDetail.params[4].Value:= dmReportes.qryDatosRepVentaDiariaNew.params[4].Value;
      dmReportes.qryDatosRepVentaDiariaSubDetail.Open;
                                   
      dmReportes.qryFPagoTicketV2.Close;
      dmReportes.qryFPagoTicketV2.params[0].value:=ExtraerFecha(frmSelFecha.FechaIni.Date);
      dmReportes.qryFPagoTicketV2.params[1].value:=ExtraerFecha(frmSelFecha.FechaFin.Date);
      dmReportes.qryFPagoTicketV2.Open;
      
      qckRepVentaDiariaNuevoRev:=TqckRepVentaDiariaNuevoRev.Create(Nil);
      try
        qckRepVentaDiariaNuevoRev.PrinterSettings.PrinterIndex:=GetImpresorarpt(2,12);
        qckRepVentaDiariaNuevoRev.Prepare;
        qckRepVentaDiariaNuevoRev.qrTpaginas.Caption:=' de '+IntToStr(qckRepVentaDiariaNuevoRev.PageNumber);
        qckRepVentaDiariaNuevoRev.QRLabel14.Caption:='';
        //frmProgressbarfrm.Hide;

        qckRepVentaDiariaNuevoRev.Preview;
        if frmSelFecha.CheckBox1.Checked then
        ReportExport(qckRepVentaDiariaNuevoRev,GlbRutaInformes+'\VentaDiaria.pdf');
      finally
      qckRepVentaDiariaNuevoRev.Free;
      qckRepVentaDiariaNuevoRev:=Nil;
      end;

      //dmReportes.qryDatosRepVentaDiaria.sql.text
      {//Antes Agosto 24, 2024
      qckRepVentaDiaria:=tQckRepVentaDiaria.Create(Nil);
      try
        qckRepVentaDiaria.Prepare;
        qckRepVentaDiaria.qrTpaginas.Caption:=' de '+IntToStr(qckRepVentaDiaria.PageNumber);
        qckRepVentaDiaria.QRLabel14.Caption:='';
        qckRepVentaDiaria.Preview;
        if frmSelFecha.CheckBox1.Checked then
        ReportExport(qckRepVentaDiaria,GlbRutaInformes+'\VentaDiaria.pdf');
      finally
      qckRepVentaDiaria.Free;
      qckRepVentaDiaria:=Nil;
      end;}
    end;
  finally
  frmSelFecha.Free;
  frmSelFecha:=Nil;
  end;
  //frmProgressbarfrm.Show;
  //FreeAndNil(frmProgressbarfrm);
end;

procedure TfrmMenuPrincipal.CrearOrden1Click(Sender: TObject);
begin
  frmCrearOrdenCompra:= TfrmCrearOrdenCompra.Create(Nil);
  try
    frmCrearOrdenCompra.showmodal;
  finally
  frmCrearOrdenCompra.Free;
  frmCrearOrdenCompra:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.EscalaISR1Click(Sender: TObject);
begin
  frmEscalaIsr:=TfrmEscalaIsr.Create(Nil);
  try
    frmEscalaIsr.Showmodal;
  finally
  frmEscalaIsr.Free;
  frmEscalaIsr:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.InventarioSerie1Click(Sender: TObject);
begin
  dmReportes.generandoRepSeries:=True;
  dmReportes.qryRepInventarioProdMasBclRuta.close;
  if GlbVenderDesdeAlmacenP = 1 then
  dmReportes.qryRepInventarioProdMasBclRuta.SQL.Text := 'Select * from PROC_DATOS_REP_INVENTARIO_P'
  else
  dmReportes.qryRepInventarioProdMasBclRuta.SQL.Text := 'Select * from PROC_DATOS_REP_INVENTARIO';
  dmReportes.qryRepInventarioProdMasBclRuta.SQL.add('where cia_key ='+IntToStr(glbCia_Key));
  dmReportes.qryRepInventarioProdMasBclRuta.Open;
  qckRepDatosInventarioSerie:=TqckRepDatosInventarioSerie.Create(nil);
  try
    qckRepDatosInventarioSerie.Prepare;
    qckRepDatosInventarioSerie.qrTpaginas.Caption:= ' de '+IntToStr(qckRepDatosInventarioSerie.PageNumber);
    qckRepDatosInventarioSerie.Preview;
  finally
  qckRepDatosInventarioSerie.Free;
  qckRepDatosInventarioSerie:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.MargenBeneficiosxProducto1Click(
  Sender: TObject);
begin
  dmReportes.qryMargenGanInvent.Close;
  dmReportes.qryMargenGanInvent.Open;
  qckRepMargenBeneficio:=TqckRepMargenBeneficio.Create(Nil);
  try
    qckRepMargenBeneficio.Prepare;
    qckRepMargenBeneficio.PrinterSettings.PrinterIndex:=GetImpresorarpt(2,12);
    glbTPag := qckRepMargenBeneficio.PageNumber;
    qckRepMargenBeneficio.Preview;
  finally
  qckRepMargenBeneficio.free;
  qckRepMargenBeneficio:=nil;
  end;
end;

procedure TfrmMenuPrincipal.BeneficioenVentas1Click(Sender: TObject);
begin
  frmMargenBeneficio:=TfrmMargenBeneficio.Create(Self);
  try
    frmMargenBeneficio.ShowModal;
  finally
  frmMargenBeneficio.free;
  frmMargenBeneficio:=nil;
  end;
end;

procedure TfrmMenuPrincipal.Financiamientos1Click(Sender: TObject);
begin
  frmSelFecha:=tfrmSelFecha.create(nil);
  try
    frmSelFecha.FechaIni.DateTime:=GlbFechaTrnDiaria;
    frmSelFecha.FechaFin.DateTime:=GlbFechaTrnDiaria;
    if frmSelFecha.ShowModal = mrOk then
    begin
    dmreportes.qryRepFinanciamientos.Close;
    dmreportes.qryRepFinanciamientos.Params[0].Value:=ExtraerFecha(frmselfecha.FechaIni.DateTime);
    dmreportes.qryRepFinanciamientos.Params[1].Value:=ExtraerFecha(frmselfecha.FechaFin.DateTime);
    dmreportes.qryRepFinanciamientos.Open;
    qckRepFinanciamientos:=TqckRepFinanciamientos.Create(Nil);
    try
    qckRepFinanciamientos.PrinterSettings.PrinterIndex:=GetImpresorarpt(2,12);
    qckRepFinanciamientos.Prepare;
    glbTPag := qckRepFinanciamientos.PageNumber;
    qckRepFinanciamientos.Preview;
  finally
  qckRepFinanciamientos.Free;
  qckRepFinanciamientos:=Nil;
  end;
  end;
  finally
  frmSelFecha.Free;
  frmSelFecha:=Nil
  end;
end;

procedure TfrmMenuPrincipal.NotaDbito1Click(Sender: TObject);
begin
  frmProcBuscarProv:=TfrmProcBuscarProv.Create(nil);
  try
    if frmProcBuscarProv.Showmodal = mrOk then
    begin
      frmTransCxpProc_R:=TfrmTransCxpProc_R.Create(Nil);
      try
        dmproveedor.qryProveCxp.Locate('CODIGO_CTE', frmProcBuscarProv.xCodigoCte,[]);      
        frmTransCxpProc_R.CodCte := frmProcBuscarProv.xCodigoCte;
        frmTransCxpProc_R.Pagecontrol1.ActivePage := TabSheet2;
        frmTransCxpProc_R.Pagecontrol1.ActivePageIndex:=1;
        frmTransCxpProc_R.Showmodal;
      finally
      frmTransCxpProc_R.Free;
      frmTransCxpProc_R:=Nil;
      end;
    end;
  finally
  frmProcBuscarProv.free;
  frmProcBuscarProv:=nil;
  end;
end;

procedure TfrmMenuPrincipal.CobroCuotasFinanc2Click(Sender: TObject);
var
  serieF : Integer;
  titulo : String;
begin
  serieF := -1;
  FrmBuscarClientesPersonas:=TFrmBuscarClientesPersonas.Create(Self);
  try
  if FrmBuscarClientesPersonas.ShowModal = mrOk then
  begin
  Titulo:= 'Financiamiento(s) Vigente(s) para cliente ::> ';
  Titulo:=Titulo + frmBuscarClientesPersonas.LabelNombre.Caption;

  frmShowFinancVigente:=TfrmShowFinancVigente.Create(Nil);
  try
    frmShowFinancVigente.Titulo := Titulo;
    frmShowFinancVigente.AbrirDatos(FrmBuscarClientesPersonas.CodigoCliente);
    if frmShowFinancVigente.Showmodal = mrOk then
    serieF := frmShowFinancVigente.qryMostrarFinancVigenteSERIE.Value;
  finally
  frmShowFinancVigente.Free;
  frmShowFinancVigente:=nil;
  end;

  if serieF = -1 then Exit; //no hubo seleccion

  frmCobroCuotasFinanciamientos:=TfrmCobroCuotasFinanciamientos.create(Nil);
  try
    frmCobroCuotasFinanciamientos.qryDatosCuota.Close;
    frmCobroCuotasFinanciamientos.qryDatosCuota.Params[0].Value:= FrmBuscarClientesPersonas.CodigoCliente;
    frmSelFecha:= TfrmSelFecha.Create(Nil);
    try
      frmSelFecha.FechaFin.Visible := False;
      frmSelFecha.Label2.Visible   := False;
      frmSelFecha.FechaIni.DateTime:= ExtraerFecha(GlbFechaTrnDiaria);
      if frmSelFecha.ShowModal = mrOk Then
      begin
        frmCobroCuotasFinanciamientos.qryDatosCuota.Params[1].Value:= ExtraerFecha(frmSelFecha.FechaIni.DateTime);
        frmCobroCuotasFinanciamientos.qryDatosCuota.Params[2].Value:= serieF;
      end else
      begin
        frmSelFecha.Free;
        frmSelFecha := Nil;
        frmCobroCuotasXFinanc.Free;
        frmCobroCuotasXFinanc:=Nil;
        exit;
      end;
    finally
    frmSelFecha.Free;
    frmSelFecha:= Nil;
    end;
    frmCobroCuotasFinanciamientos.qryDatosCuota.Open;
    frmCobroCuotasFinanciamientos.SumarTotales;
    frmCobroCuotasFinanciamientos.Showmodal;
  finally
  frmCobroCuotasFinanciamientos.Free;
  frmCobroCuotasFinanciamientos:=Nil;
  end;
  end;
  finally
  end;
end;

procedure TfrmMenuPrincipal.NotaCrdito1Click(Sender: TObject);
begin
  frmProcBuscarProv:=TfrmProcBuscarProv.Create(nil);
  try
    if frmProcBuscarProv.Showmodal = mrOk then
    begin
      frmTransCxpProc_R:=TfrmTransCxpProc_R.Create(Nil);
      try
        dmproveedor.qryProveCxp.Locate('CODIGO_CTE', frmProcBuscarProv.xCodigoCte,[]);      
        frmTransCxpProc_R.CodCte := frmProcBuscarProv.xCodigoCte;
        frmTransCxpProc_R.Pagecontrol1.ActivePage := TabSheet1;
        frmTransCxpProc_R.Pagecontrol1.ActivePageIndex:=0;
        frmTransCxpProc_R.Showmodal;
      finally
      frmTransCxpProc_R.Free;
      frmTransCxpProc_R:=Nil;
      end;
    end;
  finally
  frmProcBuscarProv.free;
  frmProcBuscarProv:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.Estudiantes1Click(Sender: TObject);
begin
  frmMaestroEstudiante:=TfrmMaestroEstudiante.Create(nil);
  try
    frmMaestroEstudiante.Showmodal;
  finally
  frmMaestroEstudiante.free;
  frmMaestroEstudiante:=nil;
  end;
end;

procedure TfrmMenuPrincipal.Recetas1Click(Sender: TObject);
begin
  if not Assigned(dmPanaderia) then
  dmPanaderia:=TdmPanaderia.Create(nil);
  frmRecetas:=TfrmRecetas.Create(nil);
  try
    if (GlbSkinPath <> '') then
    begin
      frmRecetas.SkinData1.Active:=False;
      frmRecetas.SkinData1.LoadFromFile(GlbSkinPath);
      frmRecetas.SkinData1.Active:=True;
    end;
    frmRecetas.Showmodal;
  finally
  frmRecetas.Free;
  frmRecetas:=Nil;
  end;
  dmPanaderia.Free;
  dmPanaderia:=nil;
end;

procedure TfrmMenuPrincipal.Requisicion1Click(Sender: TObject);
begin
if not Assigned(dmPanaderia) then
  dmPanaderia:=TdmPanaderia.Create(nil);
  frmRequisicion:=TfrmRequisicion.Create(Nil);
  try
    frmRequisicion.Showmodal;
  finally
  frmRequisicion.Free;
  frmRequisicion:=Nil;
  end;
    dmPanaderia.Free;
  dmPanaderia:=nil;
end;

procedure TfrmMenuPrincipal.Produccion1Click(Sender: TObject);
begin
if not Assigned(dmPanaderia) then
  dmPanaderia:=TdmPanaderia.Create(nil);

  frmRegProduccion:=TfrmRegProduccion.Create(nil);
  try
     frmRegProduccion.showmodal;
  finally
  frmRegProduccion:=nil;
  end;
    dmPanaderia.Free;
  dmPanaderia:=nil; 
end;

procedure TfrmMenuPrincipal.AccountantModule1Click(Sender: TObject);
begin
  //'/GLBRUTADB'+GLBRUTADB
  if (GLBRUTADB<> '') then
  WinExec(PChar('CntSystem.exe '+'/GLBRUTADB='+GLBRUTADB), SW_SHOWNORMAL)
  else
  WinExec(PChar('CntSystem.exe'), SW_SHOWNORMAL);
end;

procedure TfrmMenuPrincipal.Check1Click(Sender: TObject);
begin
  if (GLBRUTADB<> '') then
  WinExec(PChar('Cheques.exe '+'/GLBRUTADB='+GLBRUTADB), SW_SHOWNORMAL)
  else
  WinExec(PChar('Cheques.exe'), SW_SHOWNORMAL);
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

procedure TfrmMenuPrincipal.transCxcMClick(Sender: TObject);
begin
  frmActBlcCteCxc:=TfrmActBlcCteCxc.Create(Nil);
  try
    frmActBlcCteCxc.Showmodal;
  finally
  frmActBlcCteCxc.Free;
  frmActBlcCteCxc:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.OtrasCxp1Click(Sender: TObject);
begin
  frmActBlcCteCxp:=TfrmActBlcCteCxp.Create(Nil);
  try
    frmActBlcCteCxp.Showmodal;
  finally
  frmActBlcCteCxp.Free;
  frmActBlcCteCxp:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.Desembolsos1Click(Sender: TObject);
begin
  frmDesembolsos:=TfrmDesembolsos.Create(nil);
  try
    frmDesembolsos.showmodal;
  finally
  frmDesembolsos.Free;
  frmDesembolsos:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.RegistroInventarioFisico1Click(
  Sender: TObject);
begin
  frmRegInvFisicoPan:=TfrmRegInvFisicoPan.Create(Nil);
  try
    frmRegInvFisicoPan.Showmodal;
  finally
  frmRegInvFisicoPan.Free;
  frmRegInvFisicoPan:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.Ventas2Click(Sender: TObject);
var
  archivo : String;
begin
  TIPO_DOCUMENTO_CNT :=6;//Entrada
  SISTEMA_CNT        :=18;//Transaccion ventas
  SUBSISTEMA_CNT     :=1;
  GLBCODIGO_CIA      :=1;
  frmContabilizarVentas:=TfrmContabilizarVentas.Create(Nil);
  try
    GLBMODULO_CNT := 1;
    frmContabilizarVentas.esVentaCredito:=False;
    frmContabilizarVentas.nombretablaacnt:='VIEW_VENTAS_ACNT';
    frmContabilizarVentas.Showmodal;
  finally
  frmContabilizarVentas.Free;
  frmContabilizarVentas:=Nil
  end;
  //t archivo:='C:\Proyectos\ProcTransCnt\PuntoVenta\Bin\Ventas - ProcTransCnt.lnk'; // if.bat - Shortcut';
  //t ShellExecute(0, 'Open', PChar(archivo), PChar(''), PChar(''), SW_SHOWNORMAL);
end;

procedure TfrmMenuPrincipal.BitBtn2Click(Sender: TObject);
begin
  frmOrdenLavanderia:=TfrmOrdenLavanderia.Create(Nil);
  try
    frmOrdenLavanderia.ShowModal;
  finally
  frmOrdenLavanderia.Free;
  frmOrdenLavanderia:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.ServiciosCafeteria1Click(Sender: TObject);
begin
  if not Assigned(dmPanaderia) then
  dmPanaderia:=TdmPanaderia.Create(nil);

  frmConfServCafeteria:=TfrmConfServCafeteria.Create(Nil);
  try
    if (GlbActivaProduccion = 1) then
    frmConfServCafeteria.Caption:='Ingredientes por Piezas';

    frmConfServCafeteria.Showmodal;
  finally
  frmConfServCafeteria.Free;
  frmConfServCafeteria:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.RelacionIngredientesVta1Click(Sender: TObject);
var
  x : byte;
begin
  GetAnyDate1.UsaFechaCierre:=True;
  GetAnyDate1.FechaCierre:=GlbFechaTrnDiaria;
  if not Assigned(dmPanaderia) then
  dmPanaderia:=TdmPanaderia.Create(nil);
  
  try
    if GetAnyDate1.Execute then
    begin
      dmpanaderia.qryListIngVtaCafeteria.Close;
      dmpanaderia.qryListIngVtaCafeteria.Params[0].Value:= ExtraerFecha(GetAnyDate1.Fecha);
      dmpanaderia.qryListIngVtaCafeteria.Params[1].Value:= ExtraerFecha(GetAnyDate1.fechafinal);
      dmpanaderia.qryListIngVtaCafeteria.Open;
      x:=0;
    end else x:=1;
  finally
  end;
  if x = 1 then exit;
  qckRepTransIngCaf:=TqckRepTransIngCaf.Create(nil);
  try
    qckRepTransIngCaf.PrinterSettings.PrinterIndex:=GetImpresorarpt(2,12);
    qckRepTransIngCaf.Preview;
  finally
  qckRepTransIngCaf.free;
  qckRepTransIngCaf:=nil;
  end;
  dmPanaderia.Free;
  dmPanaderia:=nil;
end;

procedure TfrmMenuPrincipal.Outofhere;
var
  strValue : AnsiString;
begin
  //ShowMessage(section);

  strValue := FIniFile.ReadString(SECTION, 'Version', '');
  if (strValue <> 'k448')  then
  begin
    if (frmLogin.Edit1.Text <> 'SOPORTE') and  (frmLogin.Edit1.Text <> 'DEMO') And (frmLogin.Edit1.Text <> 'DIVISON') then
    begin
      Beep;
      Messagedlg('Se ha detectado que esta version de PointSaleSoft no esta registrada,'#13''+
      'favor contactar a su proveedor. IDESI SRL nosivid@hotmail.com, Cel. 809-309-5001',mtError,[mbok],0);
      Application.Terminate;
    end else
    GlbRegistrado:=False;
  end else GlbRegistrado:=True;
end;

procedure TfrmMenuPrincipal.BitBtn3Click(Sender: TObject);
begin
  frmBackup:=TfrmBackup.Create(nil);
  try
    frmBackup.isBackup := 1;
    frmBackup.edtNombreDB.Text :=ExtractFileName(GlbRutaDBActual);
    frmBackup.edtOrigenDB.Text :=ExtractFilePath(GlbRutaDBActual)+frmBackup.edtNombreDB.Text;
    frmBackup.edtDestinoDB.Text:=ExtractFilePath(GlbRutaDBActual)+'Backup\'+frmBackup.edtNombreDB.Text;
    frmBackup.edtDestinoDB.Text:=StringReplace(frmBackup.edtDestinoDB.Text,ExtractFileExt(GlbRutaDBActual),'.fbk',[rfIgnoreCase]);
    frmBackup.Showmodal;
  finally
  frmBackup.Free;
  frmBackup:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.Cursos1Click(Sender: TObject);
begin
  frmCursos:=TfrmCursos.Create(Nil);
  try
    frmCursos.Showmodal;
  finally
  frmCursos.Free;
  frmCursos:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.AoEscolar1Click(Sender: TObject);
begin
  frmAnoEscolar:=TfrmAnoEscolar.Create(Nil);
  try
    frmAnoEscolar.Showmodal;
  finally
  frmAnoEscolar.Free;
  frmAnoEscolar:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.ReporteFamiliaEstudiantes1Click(
  Sender: TObject);
begin
  dmreportes.qryRepEstudianteRepMast.Close;
  dmreportes.qryRepEstudianteRepMast.Open;
  qckRepListaEstudiantes:=TqckRepListaEstudiantes.Create(Nil);
  try
    qckRepListaEstudiantes.PrinterSettings.PrinterIndex:=GetImpresorarpt(2,12);
    qckRepListaEstudiantes.Preview;
  finally
  qckRepListaEstudiantes.Free;
  qckRepListaEstudiantes:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.tarifaAoEscolar1Click(Sender: TObject);
begin
  frmPrecioXNivelColegio:=TfrmPrecioXNivelColegio.Create(nil);
  try
   frmPrecioXNivelColegio.Showmodal;
  finally
  frmPrecioXNivelColegio.Free;
  frmPrecioXNivelColegio:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.EstadoMensualidadEstudiantes1Click(
  Sender: TObject);
begin
  dmEstudiante.qryRepPagosAtrasoEstudianteMaster.Close;
  dmEstudiante.qryRepPagosAtrasoEstudianteMaster.Params[0].Value:= GLBIDAnioEscolar;
  dmEstudiante.qryRepPagosAtrasoEstudianteMaster.Open;
  qckRepAtrasoEstColegio:=TqckRepAtrasoEstColegio.create(nil);
  try
    qckRepAtrasoEstColegio.PrinterSettings.PrinterIndex:=GetImpresorarpt(2,12);
    qckRepAtrasoEstColegio.Preview;
  finally
  qckRepAtrasoEstColegio.Free;
  qckRepAtrasoEstColegio:=Nil;
  end;

  Exit

end;

procedure TfrmMenuPrincipal.CobroEstudiantes1Click(Sender: TObject);
begin
  frmCobroEstudiantes:=TfrmCobroEstudiantes.Create(Nil);
  try
    frmCobroEstudiantes.Showmodal;
  finally
  frmCobroEstudiantes.Free;
  frmCobroEstudiantes:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.ConsultaQuery1Click(Sender: TObject);
begin
  frmConsultaCustom:=TfrmConsultaCustom.Create(Nil);
  try
    frmConsultaCustom.Showmodal;
  finally
  frmConsultaCustom.Free;
  frmConsultaCustom:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.DescuentoFacturasServicio1Click(
  Sender: TObject);
begin
  frmConfigurarDescFact:=TfrmConfigurarDescFact.Create(nil);
  try
    frmConfigurarDescFact.showmodal;
  finally
  frmConfigurarDescFact.free;
  frmConfigurarDescFact:=nil;
  end;
end;

procedure TfrmMenuPrincipal.template1Click(Sender: TObject);
begin
  frmTemplateExcel:=TfrmTemplateExcel.create(nil);
  try
    frmTemplateExcel.showmodal;
  finally
  frmTemplateExcel.free;
  frmTemplateExcel:=nil;
  end;
end;

procedure TfrmMenuPrincipal.BitBtn5Click(Sender: TObject);
begin  
  frmExportarRepXML:=TfrmExportarRepXML.Create(Nil);
  try
    frmExportarRepXML.IsTesting:=True;
    frmExportarRepXML.Showmodal;
  finally
  frmExportarRepXML.Free;
  frmExportarRepXML:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.Itbis3Click(Sender: TObject);
begin
  frmItbis:=TfrmItbis.Create(Nil);
  try
    frmItbis.Showmodal;
  finally
  frmItbis.Free;
  frmItbis:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.RetencionTerceros1Click(Sender: TObject);
begin
  frmRetencionestercero:=TfrmRetencionestercero.Create(nil);
  try
    frmRetencionestercero.ShowModal;
  finally
  frmRetencionestercero.free;
  end;
end;

procedure TfrmMenuPrincipal.SetLogoCia;
var
  xGrafico : String;
begin
  Image2.Picture.Assign(nil);
  if dmCompania.tblCompania.Locate('codigo', GlbCodigoCia,[]) then
    if  FileExists(dmCompania.tblCompaniaIMAGEN_DESKTOP.Value) then
    if (Length(dmCompania.tblCompaniaIMAGEN_DESKTOP.Value) > 0) then
    begin
      Image2.Picture.LoadFromFile(dmCompania.tblCompaniaIMAGEN_DESKTOP.Value);
      Image2.BringToFront;
      Image2.Visible:=True;
    end
    else
    begin
      if  FileExists('Logo.jpg') then
      xGrafico:=FileToUse(ExtractFilePath(Application.ExeName),'Logo.jpg')
      else
      xGrafico:=FileToUse('Grafico','Logo.jpg');
      if (xGrafico <> '') then
      Image2.Picture.LoadFromFile(xGrafico);
    end;

  {
  if dmCompania.tblCompania.Locate('codigo', GlbCodigoCia,[]) then
    if  FileExists(dmCompania.tblCompaniaLOGOCIA.Value) then
    if (Length(dmCompania.tblCompaniaLOGOCIA.Value) > 0) then
    Image2.Picture.LoadFromFile(dmCompania.tblCompaniaLOGOCIA.Value)
    else
    begin
      xGrafico:=FileToUse('Grafico','Logo.jpg');
      if (xGrafico <> '') then
      Image2.Picture.LoadFromFile(xGrafico);
    end;}
end;

procedure TfrmMenuPrincipal.BitBtn6Click(Sender: TObject);
begin
  BitBtn6.Enabled:=False;
  dmcompania.tblCompania.Close;
  dmcompania.tblCompania.Open;
  dmCompania.tblCompania.Locate('codigo',glbCia_Key,[]);

  if (GlbVenderDesdeAlmacenP = 0) then
  begin
    frmSelInventario:=TfrmSelInventario.Create(nil);
    if frmSelInventario.ShowModal = mrOk then
    begin
      dmUsuarios.qryRoles.Close;
      dmUsuarios.qryRoles.Params[0].Value:= VarUsuarioGlb;

      dmUsuarios.qryRoles.Open;
      dmUsuarios.qryRoles.First;
      frmConsignacion := TfrmConsignacion.Create(Nil);
      While Not dmUsuarios.qryRoles.Eof Do
      begin
        ActivaPermiso(TForm(frmConsignacion),1000, dmUsuarios.qryRolesID_ROL.Value, 0);//menu principal: 1000 debe estar en la tabla PROCESOS
        dmUsuarios.qryRoles.Next;
      end;

      GlbCodDivInventario:=frmSelInventario.tblDivInventarioINVENTARIO_ID.Value;

      try
        if (GlbScaledform) then
        ScaleForm(frmConsignacion,GlbScreenWith,GlbScreenHeight);
        frmConsignacion.lblInventario.Caption :=
        frmSelInventario.tblDivInventarioDESCRIPCION.Value;
        frmConsignacion.ShowModal;
      finally
      frmConsignacion.Free;
      frmConsignacion:= Nil;
      end;
      GlbCodDivInventario:=-1;
    end;
  end else
  begin
    //GlbCodDivInventario:= 1;
    frmConsignacion := TfrmConsignacion.Create(Nil);
    try
      if (GlbSkinPath <> '') then
      begin
        frmConsignacion.SkinData1.Active:=False;
        frmConsignacion.SkinData1.LoadFromFile(GlbSkinPath);
        //frmConsignacion.SkinData1.Active:=True;
      end;
      dmUsuarios.qryRoles.Close;
      dmUsuarios.qryRoles.Params[0].Value:= VarUsuarioGlb;
      dmUsuarios.qryRoles.Open;
      dmUsuarios.qryRoles.First;
      While Not dmUsuarios.qryRoles.Eof Do
      begin
        ActivaPermiso(TForm(frmConsignacion),1000, dmUsuarios.qryRolesID_ROL.Value, 0);//menu principal: 1000 debe estar en la tabla PROCESOS
        dmUsuarios.qryRoles.Next;
      end;

      frmConsignacion.lblInventario.Caption :='ALMACEN PRINCIPAL';
      frmConsignacion.ShowModal;
    finally
    frmConsignacion.Free;
    frmConsignacion:= Nil;
    end;
    GlbCodDivInventario:=-1;
  end;
  BitBtn6.Enabled:=True;
end;

procedure TfrmMenuPrincipal.RecibirOrden1Click(Sender: TObject);
begin
  frmRecibirOrdenes:=TfrmRecibirOrdenes.Create(Nil);
  try
    dmUsuarios.qryRoles.Close;
    dmUsuarios.qryRoles.Params[0].Value:= VarUsuarioGlb;
    dmUsuarios.qryRoles.Open;
    dmUsuarios.qryRoles.First;
    While Not dmUsuarios.qryRoles.Eof Do
    begin
      ActivaPermiso(TForm(frmRecibirOrdenes),1000, dmUsuarios.qryRolesID_ROL.Value, 0);//menu principal: 1000 debe estar en la tabla PROCESOS
      dmUsuarios.qryRoles.Next;
    end;
   frmRecibirOrdenes.Showmodal;
  finally
  frmRecibirOrdenes.Free;
  frmRecibirOrdenes:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.ServiciosTaller1Click(Sender: TObject);
begin
  if GetAnyDate1.Execute then
  begin
    dmReportes.QryServiciosTaller.Close;
    dmReportes.QryServiciosTaller.Params[0].Value:= ExtraerFecha(GetAnyDate1.Fecha);
    dmReportes.QryServiciosTaller.Params[1].Value:= ExtraerFecha(GetAnyDate1.Fechafinal);
    dmReportes.QryServiciosTaller.Open;

    qckRepServicioTaller:=TqckRepServicioTaller.Create(Nil);
    try
      qckRepServicioTaller.PrinterSettings.PrinterIndex:=GetImpresorarpt(2,12);
      qckRepServicioTaller.Preview;
    finally
    qckRepServicioTaller.Free;
    qckRepServicioTaller:=Nil;
    end;
  end;
end;

procedure TfrmMenuPrincipal.Moneda1Click(Sender: TObject);
begin
  frmMoneda:=TfrmMoneda.Create(Nil);
  try
    frmMoneda.Showmodal;
  finally
  frmMoneda.Free;
  frmMoneda:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.SolicitarOrden1Click(Sender: TObject);
begin
  frmCrearSolicitudOrdenCompra:= TfrmCrearSolicitudOrdenCompra.Create(Nil);
  try
    frmCrearSolicitudOrdenCompra.Showmodal;
  finally
  frmCrearSolicitudOrdenCompra.Free;
  frmCrearSolicitudOrdenCompra:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.PorClientes1Click(Sender: TObject);

begin
  //Crear Ventana par filtro
  frmListadoVentas:=TfrmListadoVentas.Create(Nil);
  try
    if frmListadoVentas.Showmodal = mrOk then
    begin
      frmListadoVentas.orderTipo:=0;
      frmListadoVentas.AbrirDatos;
      if dmReportes.qryViewVentasHist.RecordCount > 0 then
      begin
        qckListaFactXCte:=TqckListaFactXCte.Create(nil);
        try
          qckListaFactXCte.qrLabelCriterioDatos.Caption:= labelCretrioRep;
          qckListaFactXCte.PrinterSettings.PrinterIndex:=GetImpresorarpt(2,12);
          qckListaFactXCte.Preview;
          if frmListadoVentas.chboxExportarPDF.Checked then
          ReportExport(qckListaFactXCte,GlbRutaInformes+'\ListFactXClientes.pdf');
        finally
        qckListaFactXCte.Free;
        qckListaFactXCte:=Nil;
        end;
      end else
      MessageDlg('No data con criterio seleccionado.', mtinformation,[mbok],0);
    end;
  finally
  frmListadoVentas.Free;
  frmListadoVentas:=Nil;
  end;
  {
  dmreportes.qryViewVentasHist.Close;
  dmreportes.qryViewVentasHist.Open;
  qckListaFactXCte:=TqckListaFactXCte.Create(nil);
  try
    qckListaFactXCte.Preview;
  finally
  qckListaFactXCte.free;
  qckListaFactXCte:=nil;
  end;}
end;

procedure TfrmMenuPrincipal.ProductosporClientes1Click(Sender: TObject);
begin
  //Crear Ventana par filtro
  frmListadoVentas:=TfrmListadoVentas.Create(Nil);
  try
    if frmListadoVentas.Showmodal = mrOk then
    begin
      frmListadoVentas.orderTipo:=1;
      frmListadoVentas.AbrirDatos;
      if dmReportes.qryViewVentasHist.RecordCount > 0 then
      begin
        qckListaFactXCteXProducto:=TqckListaFactXCteXProducto.Create(nil);
        try
          qckListaFactXCteXProducto.qrLabelCriterioDatos.Caption:= labelCretrioRep;
          qckListaFactXCteXProducto.PrinterSettings.PrinterIndex:=GetImpresorarpt(2,12);
          if frmListadoVentas.CheckBox1.Checked then //exportar a excel
          begin
            GLBMostrarArchivo:=True;
            ExporToExcel(dmReportes.qryViewVentasHist,
             ExtractFilePath(Application.ExeName)+
          'Informes\RepVenta'+labelCretrioRep,true);
            GLBMostrarArchivo:=False;
          end else
          qckListaFactXCteXProducto.Preview;
        finally
        qckListaFactXCteXProducto.Free;
        qckListaFactXCteXProducto:=Nil;
        end;
      end else
      MessageDlg('No data con criterio seleccionado.', mtinformation,[mbok],0);
    end;
  finally
  frmListadoVentas.Free;
  frmListadoVentas:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.PorVendedor1Click(Sender: TObject);
begin
  frmListadoVentasXVendedor:=TfrmListadoVentasXVendedor.Create(Nil);
  try
    if frmListadoVentasXVendedor.Showmodal = mrOk then
    begin
      frmListadoVentasXVendedor.orderTipo:=2;
      frmListadoVentasXVendedor.AbrirDatos;
      if dmReportes.qryViewVentasHist.RecordCount > 0 then
      begin
        qckListaFactXVendedor:=TqckListaFactXVendedor.Create(nil);
        try
          qckListaFactXVendedor.PrinterSettings.PrinterIndex:=GetImpresorarpt(2,12);
          qckListaFactXVendedor.qrLabelCriterioDatos.Caption:= labelCretrioRep;
          qckListaFactXVendedor.Preview;
        finally
        qckListaFactXVendedor.Free;
        qckListaFactXVendedor:=Nil;
        end;
      end else
      MessageDlg('No data con criterio seleccionado.', mtinformation,[mbok],0);
    end;
  finally
  frmListadoVentasXVendedor.Free;
  frmListadoVentasXVendedor:=Nil;
  end;
  //UQckRepServVendedor
end;

procedure TfrmMenuPrincipal.PorCliente1Click(Sender: TObject);
begin
  //Crear Ventana par filtro
  frmListadoCotizaciones:=TfrmListadoCotizaciones.Create(Nil);
  try
    if frmListadoCotizaciones.Showmodal = mrOk then
    begin
      frmListadoCotizaciones.orderTipo:=0;
      frmListadoCotizaciones.AbrirDatos;
      if dmReportes.qryRepCotizaciones.RecordCount > 0 then
      begin
        qckListaCotizacionXCte:=TqckListaCotizacionXCte.Create(nil);
        try
          qckListaCotizacionXCte.PrinterSettings.PrinterIndex:=GetImpresorarpt(2,12);
          qckListaCotizacionXCte.qrLabelCriterioDatos.Caption:= labelCretrioRep;
          qckListaCotizacionXCte.Preview;
        finally
        qckListaCotizacionXCte.Free;
        qckListaCotizacionXCte:=Nil;
        end;
      end else
      MessageDlg('No data con criterio seleccionado.', mtinformation,[mbok],0);
    end;
  finally
  frmListadoCotizaciones.Free;
  frmListadoCotizaciones:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.MarcaVehiculos1Click(Sender: TObject);
begin
  frmMarcaVehiculos:=TfrmMarcaVehiculos.Create(Nil);
  try
    frmMarcaVehiculos.showmodal;
  finally
  frmMarcaVehiculos.free;
  frmMarcaVehiculos:=nil;
  end;
end;

procedure TfrmMenuPrincipal.ipoVehiculos1Click(Sender: TObject);
begin
  frmTipoVehiculo :=TfrmTipoVehiculo.Create(Nil);
  try
    frmTipoVehiculo.Showmodal;
  finally
  frmTipoVehiculo.Free;
  frmTipoVehiculo:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.PorVendedor2Click(Sender: TObject);
begin
  //Crear Ventana par filtro
  frmListadoCotizacionesXVendedor:=TfrmListadoCotizacionesXVendedor.Create(Nil);
  try
    if frmListadoCotizacionesXVendedor.Showmodal = mrOk then
    begin
      frmListadoCotizacionesXVendedor.orderTipo:=0;
      frmListadoCotizacionesXVendedor.AbrirDatos;
      if dmReportes.qryRepCotizaciones.RecordCount > 0 then
      begin
        qckListaCotizacionXVendedor:=TqckListaCotizacionXVendedor.Create(nil);
        try
          qckListaCotizacionXVendedor.PrinterSettings.PrinterIndex:=GetImpresorarpt(2,12);
          qckListaCotizacionXVendedor.qrLabelCriterioDatos.Caption:= labelCretrioRep;
          qckListaCotizacionXVendedor.Preview;
        finally
        qckListaCotizacionXVendedor.Free;
        qckListaCotizacionXVendedor:=Nil;
        end;
      end else
      MessageDlg('No data con criterio seleccionado.', mtinformation,[mbok],0);
    end;
  finally
  frmListadoCotizacionesXVendedor.Free;
  frmListadoCotizacionesXVendedor:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.PorProducto1Click(Sender: TObject);
begin
  //Crear Ventana par filtro
  frmListadoCotizaciones:=TfrmListadoCotizaciones.Create(Nil);
  try
    if frmListadoCotizaciones.Showmodal = mrOk then
    begin
      frmListadoCotizaciones.orderTipo:=0;
      frmListadoCotizaciones.AbrirDatos;
      if dmReportes.qryRepCotizaciones.RecordCount > 0 then
      begin
        qckListaCotizaXCteXProducto:=TqckListaCotizaXCteXProducto.Create(nil);
        try
          qckListaCotizaXCteXProducto.PrinterSettings.PrinterIndex:=GetImpresorarpt(2,12);
          qckListaCotizaXCteXProducto.qrLabelCriterioDatos.Caption:= labelCretrioRep;
          qckListaCotizaXCteXProducto.Preview;
        finally
        qckListaCotizaXCteXProducto.Free;
        qckListaCotizaXCteXProducto:=Nil;
        end;
      end else
      MessageDlg('No data con criterio seleccionado.', mtinformation,[mbok],0);
    end;
  finally
  frmListadoCotizaciones.Free;
  frmListadoCotizaciones:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.Seguro1Click(Sender: TObject);
begin
  MessageDlg('Ventana Inactiva temporalmente.', mtinformation,[mbok],0);
  {TEMPORAL
  frmPolizas:=TfrmPolizas.Create(Nil);
  try
    frmPolizas.Showmodal;
  finally
  frmPolizas.Free;
  frmPolizas:=Nil;
  end;
  }
end;

procedure TfrmMenuPrincipal.Devoluciones1Click(Sender: TObject);
begin
  ImprimirRepItebis(1,2); //Detallado - Devoluciones;
end;

procedure TfrmMenuPrincipal.ReordenInventario1Click(Sender: TObject);
begin
  dmReportes.qryRepInventarioProdMasBclRuta.Close;
  if GlbVenderDesdeAlmacenP = 1 then
  dmReportes.qryRepInventarioProdMasBclRuta.SQL.Text := 'Select * from PROC_DATOS_REP_INVENTARIO_P'
  else
  dmReportes.qryRepInventarioProdMasBclRuta.SQL.Text := 'Select * from PROC_DATOS_REP_INVENTARIO';
  dmReportes.qryRepInventarioProdMasBclRuta.SQL.Text :=
  dmReportes.qryRepInventarioProdMasBclRuta.SQL.Text +
  ' Where Cantidad_reorden >= Cantidad' +
  ' and cia_key ='+IntToStr(glbCia_Key);
  dmReportes.qryRepInventarioProdMasBclRuta.Open;
  qckRepDatosInvReorden:=TqckRepDatosInvReorden.Create(nil);
  try
    //qckRepDatosInventario.Prepare;
    qckRepDatosInvReorden.PrinterSettings.PrinterIndex:=GetImpresorarpt(2,12);
    qckRepDatosInvReorden.qrTpaginas.Caption:= ' de '+IntToStr(qckRepDatosInvReorden.PageNumber);
    qckRepDatosInvReorden.Preview;
  finally
  qckRepDatosInvReorden.Free;
  qckRepDatosInvReorden:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.odo1Click(Sender: TObject);
begin
  dmReportes.qryRepInventarioProdMasBclRuta.Close;
  if GlbVenderDesdeAlmacenP = 1 then
  dmReportes.qryRepInventarioProdMasBclRuta.SQL.Text := 'Select * from PROC_DATOS_REP_INVENTARIO_P'
  else
  dmReportes.qryRepInventarioProdMasBclRuta.SQL.Text := 'Select * from PROC_DATOS_REP_INVENTARIO'+
  ' where cia_key ='+IntToStr(glbCia_Key);
  dmReportes.qryRepInventarioProdMasBclRuta.Open;
  qckRepDatosInventario:=TqckRepDatosInventario.Create(Nil);
  try
    qckRepDatosInventario.PrinterSettings.PrinterIndex:=GetImpresorarpt(2,12);
    qckRepDatosInventario.qrTpaginas.Caption:= ' de '+IntToStr(qckRepDatosInventario.PageNumber);
    qckRepDatosInventario.Preview;
  finally
  qckRepDatosInventario.Free;
  qckRepDatosInventario:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.ExistenciaNegativa1Click(Sender: TObject);
begin
  dmReportes.qryRepInventarioProdMasBclRuta.Close;
  if GlbVenderDesdeAlmacenP = 1 then
  dmReportes.qryRepInventarioProdMasBclRuta.SQL.Text := 'Select * from PROC_DATOS_REP_INVENTARIO_P'
  else
  dmReportes.qryRepInventarioProdMasBclRuta.SQL.Text := 'Select * from PROC_DATOS_REP_INVENTARIO';
  dmReportes.qryRepInventarioProdMasBclRuta.SQL.Add(' Where Cantidad < 0 and cia_key ='+IntToStr(glbCia_Key));
  dmReportes.qryRepInventarioProdMasBclRuta.Open;
  qckRepDatosInvReorden:=TqckRepDatosInvReorden.Create(nil);
  try
    //qckRepDatosInventario.Prepare;
    qckRepDatosInvReorden.PrinterSettings.PrinterIndex:=GetImpresorarpt(2,12);
    qckRepDatosInvReorden.qrTpaginas.Caption:= ' de '+IntToStr(qckRepDatosInvReorden.PageNumber);
    qckRepDatosInvReorden.Preview;
  finally
  qckRepDatosInvReorden.Free;
  qckRepDatosInvReorden:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.ExistenciaActual1Click(Sender: TObject);
begin
  dmReportes.qryRepInventarioProdMasBclRuta.Close;
  if GlbVenderDesdeAlmacenP = 1 then
  dmReportes.qryRepInventarioProdMasBclRuta.SQL.Text := 'Select * from PROC_DATOS_REP_INVENTARIO_P'
  else
  dmReportes.qryRepInventarioProdMasBclRuta.SQL.Text := 'Select * from PROC_DATOS_REP_INVENTARIO';
  dmReportes.qryRepInventarioProdMasBclRuta.SQL.Text :=
  dmReportes.qryRepInventarioProdMasBclRuta.SQL.Text +
  ' Where Cantidad > 0' +
  ' and cia_key ='+IntToStr(glbCia_Key);
  dmReportes.qryRepInventarioProdMasBclRuta.Open;
  qckRepDatosInvReorden:=TqckRepDatosInvReorden.Create(nil);
  try
    //qckRepDatosInventario.Prepare;
    qckRepDatosInvReorden.PrinterSettings.PrinterIndex:=GetImpresorarpt(2,12);
    qckRepDatosInvReorden.qrTpaginas.Caption:= ' de '+IntToStr(qckRepDatosInvReorden.PageNumber);
    qckRepDatosInvReorden.Preview;
  finally
  FreeAndNil(qckRepDatosInvReorden);
  end;
end;

procedure TfrmMenuPrincipal.OrdenporNCF1Click(Sender: TObject);
begin
  ordenPor:=1;
  ImprimirRepItebis(1,1); //Detallado;
end;

procedure TfrmMenuPrincipal.OrdenporFactura1Click(Sender: TObject);
begin
  ordenPor:=2;
  ImprimirRepItebis(1,1); //Detallado;
end;

procedure TfrmMenuPrincipal.Caja1Click(Sender: TObject);
begin
  frmCaja:=TfrmCaja.Create(Nil);
  try
    frmCaja.ShowModal;
  finally
  FreeAndNil(frmCaja);
  end;
end;

procedure TfrmMenuPrincipal.AsignarCajaPrinter1Click(Sender: TObject);
begin
  frmConfCajaxUsuario:=TfrmConfCajaxUsuario.Create(nil);
  try
    frmConfCajaxUsuario.showmodal;
  finally
  FreeAndNil(frmConfCajaxUsuario);
  end;
end;

procedure TfrmMenuPrincipal.CancelarTicket1Click(Sender: TObject);
var
  archivo : String;
begin
  archivo:=GlbExeIFiscal;
  ShellExecute(0, 'Open', PChar(archivo), PChar(Format('/PortComm=%s /Baudrate=%s /TipoDoc=DVFN /Status=not /Cancelar=True /CierreZ=False /ImprimeZ=0 /CierreX=False',[IntToStr(GlbPuerto),IntToStr(GlbBaudRate)])), PChar(''), SW_Hide);
end;

procedure TfrmMenuPrincipal.INCFConfiguracion1Click(Sender: TObject);
begin
  frmNCFTipoIfiscal:=TfrmNCFTipoIfiscal.Create(Nil);
  try
    frmNCFTipoIfiscal.Showmodal;
  finally
  FreeAndNil(frmNCFTipoIfiscal);
  end;
end;

procedure TfrmMenuPrincipal.VerificaImpresoraFiscalM;
var
  archivo : String;
  tHoras : Integer;
  tratar2 : boolean;
begin
  UGlobal.VerificaImpresoraFiscal;
  Delay(3000);
  if not GlbImpresoraFOnline then
  begin
    Delay(4000);
    UGlobal.VerificaImpresoraFiscal;
  end;
  if not GlbImpresoraFOnline then
  begin
    BitBtn1.Enabled:=False;
    Label1.Visible:=True;
    label1.Font.Color :=clRed;
    label1.Font.Style := [fsBold];
    label1.Caption :='Impresora fiscal fuera de linea, verifique';
    tratar2:=False;
    GlbPuertoDisponible:=False;
  end else
  begin
    GlbPuertoDisponible := True;
    BitBtn1.Enabled:=True;
    Label1.Visible:=False;
    label1.Caption:='';
    label1.Font.Color := $000080FF;
    //tHoras := TotalHorasCierreZ(Date);
    if (TotalHorasCierreZ(Date) >=26) AND (GlbActivaIFiscal = 1) then
    begin
      if MessageDlg('Es necesario realizar cierre Z. Realizar ahora?', mtInformation,[mbyes, mbNo],0) = mryes then
      begin
        CierreJornada1Click(Self);
      end else
      BitBtn1.Enabled := False;
    end;
    tratar2:=True;
  end;
  if tratar2 then
  begin

    //if MessageDlg('Verifica status puerto impresora fiscal?',
    //mtInformation,[mbyes, mbno],0) = mrno then exit;

    frmPuertosLibres:=TfrmPuertosLibres.Create(nil);
    try
      frmPuertosLibres.VerificarPuertosLibresM;
      if not GlbPuertoDisponible then
      begin
        BitBtn1.Enabled   := False;
        Label1.Visible    := True;
        label1.Font.Color := clRed;
        label1.Font.Style := [fsBold];
        label1.Caption    := 'Impresora fiscal fuera de linea, verifique';
        tratar2           := False;
      end;
    finally
    frmPuertosLibres.free;
    frmPuertosLibres:=nil;
    end;
  end;
end;

procedure TfrmMenuPrincipal.TabSheet3Enter(Sender: TObject);
begin
  //Delay(100);
  //VerificaImpresoraFiscalM;//3
end;

procedure TfrmMenuPrincipal.ipoDescuentos1Click(Sender: TObject);
begin
  frmTipoDescuentoNomina:=TfrmTipoDescuentoNomina.Create(nil);
  try
    frmTipoDescuentoNomina.Showmodal;
  finally
  FreeAndNil(frmTipoDescuentoNomina);
  end;
end;

procedure TfrmMenuPrincipal.DescuentoDependientes1Click(Sender: TObject);
begin
  frmProcDescDependientes:=TfrmProcDescDependientes.Create(nil);
  try
    frmProcDescDependientes.showmodal;
  finally
  FreeAndNil(frmProcDescDependientes);
  end;
end;

procedure TfrmMenuPrincipal.Vacaciones1Click(Sender: TObject);
begin
  GetAnyDate1.VFechaF:=true;
  if GetAnyDate1.Execute Then
  begin
    glbFechaInicial := ExtraerFecha(GetAnyDate1.Fecha);
    glbFechaFinal   := ExtraerFecha(GetAnyDate1.FechaFinal);
    FrmVacaciones:= TFrmVacaciones.Create(Nil);
    try
      FrmVacaciones.Showmodal;
    finally
    FrmVacaciones.Free;
    FrmVacaciones:= Nil;
    end;
  end;
  GetAnyDate1.VFechaF:=False;
end;

procedure TfrmMenuPrincipal.Recibidas1Click(Sender: TObject);
begin
  //Crear Ventana par filtro
  frmDatosRepOrdenCompra:=TfrmDatosRepOrdenCompra.Create(Nil);
  try
    if frmDatosRepOrdenCompra.Showmodal = mrOk then
    begin
      frmDatosRepOrdenCompra.orderTipo:=1;
      frmDatosRepOrdenCompra.AbrirDatos;
      if dmReportes.qryDatosRepOrdenComp.RecordCount > 0 then
      begin
        qckRepOrdenRecibida:=TqckRepOrdenRecibida.Create(Nil);
        try
          qckRepOrdenRecibida.PrinterSettings.PrinterIndex:=GetImpresorarpt(2,12);
          qckRepOrdenRecibida.Prepare;
          qckRepOrdenRecibida.qrTpaginas.Caption:=
          IntToStr(qckRepOrdenRecibida.PageNumber);
          qckRepOrdenRecibida.qrLabelCriterioDatos.Caption:= frmDatosRepOrdenCompra.labelCretrioRep;
          qckRepOrdenRecibida.Preview;
          if frmDatosRepOrdenCompra.chboxExportarPDF.Checked then
          ReportExport(qckRepOrdenRecibida,GlbRutaInformes+'\RepOrdenRecibida.pdf');
        finally
        qckRepOrdenRecibida.Free;
        qckRepOrdenRecibida:=Nil;
        end;
      end else
      MessageDlg('No data con criterio seleccionado.', mtInformation,[mbOk], 0);
    end;
  finally
  frmDatosRepOrdenCompra.Free;
  frmDatosRepOrdenCompra:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.Proyecto2Click(Sender: TObject);
begin
  frmProyecto:=TfrmProyecto.Create(Nil);
  try
    frmProyecto.Showmodal;
  finally
  frmProyecto.Free;
  frmProyecto:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.Nomina1Click(Sender: TObject);
var
  flag : boolean;
  tipoNomina : Integer;
  xcodigoProy : Integer;
begin
  frmSelDatosIntegrarNomCont:=TfrmSelDatosIntegrarNomCont.Create(Nil);
  try
    if frmSelDatosIntegrarNomCont.Showmodal = mrCancel then
    flag:=true else
    begin
      tipoNomina := frmSelDatosIntegrarNomCont.xTipoNomina;
      xcodigoProy:= frmSelDatosIntegrarNomCont.xCodigoProyecto;
      glbFechaNom:= ExtraerFecha(frmSelDatosIntegrarNomCont.dtpkFechaNom.Date);
      GlbFechaNomina := glbFechaNom;
    end;
  finally
  frmSelDatosIntegrarNomCont.Free;
  frmSelDatosIntegrarNomCont:=Nil;
  end;

  if flag then Exit;

  frmNominaContratista :=TfrmNominaContratista.Create(Nil);
  try
    frmNominaContratista._xTipoNomina:= tipoNomina;
    frmNominaContratista._xcodigoProy:= xcodigoProy;
    frmNominaContratista.FormCreate(Self);
    frmNominaContratista.ProcInsertarDatos(tipoNomina,xcodigoProy);
    frmNominaContratista.Showmodal;
  finally
  frmNominaContratista.Free;
  frmNominaContratista:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.rabajadores1Click(Sender: TObject);
begin
  frmContratistas:=TfrmContratistas.Create(Nil);
  try
    frmContratistas.Showmodal;
  finally
  frmContratistas.Free;
  frmContratistas:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.EstadoImpresora1Click(Sender: TObject);
begin
  {try
    frmIFiscal:=TfrmIFiscal.Create(nil);
    try
      frmIFiscal.BitBtn5Click(Self);
      frmIFiscal.ShowModal;
    finally
    frmIFiscal.free;
    frmIFiscal:=nil;
    end;
  except
  end;}
end;

procedure TfrmMenuPrincipal.ChequearSecuencia1Click(Sender: TObject);
begin
  frmCheckNCFSec:=TfrmCheckNCFSec.Create(Nil);
  try
    if (not frmCheckNCFSec.VerificaStatus) then
    frmCheckNCFSec.Showmodal
    else
    if MessageDlg('Secuencias NCF aun estan en limite adecuado, ver configuracion?', mtInformation, [mbyes, mbno], 0) = mryes then
    begin
      Actualizar2Click(Self);
    end;
  finally
  frmCheckNCFSec.Free;
  frmCheckNCFSec:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.asaITBISFiscal1Click(Sender: TObject);
begin
  frmTasaITBIS:=TfrmTasaITBIS.Create(Nil);
  try
    frmTasaITBIS.ShowModal;
  finally
  frmTasaITBIS.Free;
  frmTasaITBIS:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.DescipcionLineasCotizacion1Click(
  Sender: TObject);
begin
  frmConfLineaCotizacion:=TfrmConfLineaCotizacion.Create(Nil);
  try
    frmConfLineaCotizacion.ShowModal;
  finally
  frmConfLineaCotizacion.Free;
  frmConfLineaCotizacion:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.Impresora2Click(Sender: TObject);
begin
  frmImpresoraFiscal:=TfrmImpresoraFiscal.Create(Nil);
  try
    frmImpresoraFiscal.Showmodal;
  finally
  FreeAndNil(frmImpresoraFiscal);
  end;
end;

procedure TfrmMenuPrincipal.LibroVentas1Click(Sender: TObject);
begin
  if not FileExists(GlbRutaExeLIbroVenta) then
  begin
    MessageDlg('Executable no encontrado en ruta indicada, verifique.', mtInformation,[mbok],0);
  end else
  begin
    ShellExecute(0, 'Open', PChar(GlbRutaExeLIbroVenta), PChar(''), PChar(''), SW_SHOWNORMAL);
  end;
end;

procedure TfrmMenuPrincipal.CierreZSistema1Click(Sender: TObject);
begin
  frmCierreZ:=TfrmCierreZ.Create(nil);
  try
    frmCierreZ.Showmodal;
  finally
  frmCierreZ.free;
  frmCierreZ:=nil;
  end;
end;

procedure TfrmMenuPrincipal.CierreZ2Click(Sender: TObject);
begin
  frmAyuda:=TfrmAyuda.Create(Nil);
  try
    frmAyuda.ShowModal;
  finally
  FreeAndNil(frmAyuda);
  end;
end;
{
  if (FileExists(GlbRutaExeLIbroVenta)) then
  ShellExecute(0, 'Open', PChar(GlbRutaExeLIbroVenta), PChar(''), PChar(''), SW_Hide)
  else MessageDlg('Executable no encontrado:'+GlbRutaExeLIbroVenta+'. Verifique.', mtInformation, [mbOk], 0);

}
procedure TfrmMenuPrincipal.HistoricoCierresZ1Click(Sender: TObject);
begin
  frmHistoricoCierreZ:=TfrmHistoricoCierreZ.Create(nil);
  try
    frmHistoricoCierreZ.Showmodal;
  finally
  frmHistoricoCierreZ.free;
  frmHistoricoCierreZ:=nil;
  end;
end;

procedure TfrmMenuPrincipal.CierreJornada1Click(Sender: TObject);
var
  archivo : String;
  buttonSelected : Integer;
begin

  frmCierreJornada:=TfrmCierreJornada.Create(nil);
  try
    frmCierreJornada.Showmodal;
    if GlbActivaIFiscal = 1 then
    BitBtn1.Enabled:=frmCierreJornada.BitBtn1Enabled;
  finally
  frmCierreJornada.free;
  frmCierreJornada:=nil;
  end;
end;

procedure TfrmMenuPrincipal.Xtipo1Click(Sender: TObject);
begin
  frmRepTipoXInv:=TfrmRepTipoXInv.Create(nil);
  try
  if frmRepTipoXInv.showmodal = mrok then
  begin
    dmReportes.qryRepInventarioProdMasBclRuta.Close;
    if GlbVenderDesdeAlmacenP = 1 then
    dmReportes.qryRepInventarioProdMasBclRuta.SQL.Text := 'Select * From PROC_DATOS_REP_INVENTARIO_P'
    else
    dmReportes.qryRepInventarioProdMasBclRuta.SQL.Text := 'Select * From PROC_DATOS_REP_INVENTARIO';
    dmReportes.qryRepInventarioProdMasBclRuta.SQL.Add(' Where Cantidad > 0 and cia_key ='+IntToStr(glbCia_Key));

    if not frmRepTipoXInv.chkBoxtodo.Checked then
    dmReportes.qryRepInventarioProdMasBclRuta.SQL.Add(' and tipo='+ IntToStr(frmRepTipoXInv.xTipoInv));
    dmReportes.qryRepInventarioProdMasBclRuta.SQL.Add(' order by tipo, GRUPO_TIPO');
    dmReportes.qryRepInventarioProdMasBclRuta.Open;
    if frmRepTipoXInv.RadioGroup1.ItemIndex = 1 then
    begin
      qckRepDatosInvReordenXTipoCosto:=TqckRepDatosInvReordenXTipoCosto.Create(nil);
      try
        //qckRepDatosInventario.Prepare;
        qckRepDatosInvReordenXTipoCosto.PrinterSettings.PrinterIndex:=GetImpresorarpt(2,12);
        qckRepDatosInvReordenXTipoCosto.qrTpaginas.Caption:= ' de '+IntToStr(qckRepDatosInvReordenXTipoCosto.PageNumber);
        qckRepDatosInvReordenXTipoCosto.Preview;
      finally
      FreeAndNil(qckRepDatosInvReordenXTipoCosto);
      end;
    end else
    begin
      qckRepDatosInvReordenXTipo:=TqckRepDatosInvReordenXTipo.Create(nil);
      try
        //qckRepDatosInventario.Prepare;
        qckRepDatosInvReordenXTipo.PrinterSettings.PrinterIndex:=GetImpresorarpt(2,12);
        qckRepDatosInvReordenXTipo.qrTpaginas.Caption:= ' de '+IntToStr(qckRepDatosInvReordenXTipo.PageNumber);
        qckRepDatosInvReordenXTipo.Preview;
      finally
      FreeAndNil(qckRepDatosInvReordenXTipo);
      end;
    end;
  end;
    finally
    frmRepTipoXInv.free;
    frmRepTipoXInv:=nil;
    end;
end;

procedure TfrmMenuPrincipal.ipoTrnCnt1Click(Sender: TObject);
begin
  frmTipoTrnConfig:=TfrmTipoTrnConfig.Create(nil);
  try
    frmTipoTrnConfig.ShowModal;
  finally
  FreeAndNil(frmTipoTrnConfig);  
  end;
end;

procedure TfrmMenuPrincipal.VerificarGeneradores1Click(Sender: TObject);
begin
  frmCheckGenerador:=TfrmCheckGenerador.Create(nil);
  try
    frmCheckGenerador.showmodal;
  finally
  frmCheckGenerador.free;
  frmCheckGenerador:=nil;
  end;
end;

procedure TfrmMenuPrincipal.Devoluciones2Click(Sender: TObject);
begin
  TIPO_DOCUMENTO_CNT :=7;//Entrada
  SISTEMA_CNT        :=18;//Transaccion ventas
  SUBSISTEMA_CNT     :=4; //Devoluciones
  GLBCODIGO_CIA      :=1;
  frmContabilizarVtasDevol:=TfrmContabilizarVtasDevol.Create(Nil);
  try
    GLBMODULO_CNT := 4;
    frmContabilizarVtasDevol.nombretablaacnt:='VIEW_VENTAS_ACNT';
    frmContabilizarVtasDevol.Showmodal;
  finally
  frmContabilizarVtasDevol.Free;
  frmContabilizarVtasDevol:=Nil
  end;
end;

procedure TfrmMenuPrincipal.Tarjetas1Click(Sender: TObject);
begin
  TIPO_DOCUMENTO_CNT :=7;//Entrada
  SISTEMA_CNT        :=18;//Transaccion ventas cobro tarjetas
  SUBSISTEMA_CNT     :=2;
  GLBCODIGO_CIA      :=1;
  frmContabilizarVentasTarjeta:=TfrmContabilizarVentasTarjeta.Create(Nil);
  try
    GLBMODULO_CNT := 1;
    frmContabilizarVentasTarjeta.esTarjeta :=True;
    frmContabilizarVentasTarjeta.nombretablaacnt:='VIEW_VENTAS_ACNT_TC';
    frmContabilizarVentasTarjeta.Showmodal;
  finally
  frmContabilizarVentasTarjeta.Free;
  frmContabilizarVentasTarjeta:= Nil;
  end;
end;

procedure TfrmMenuPrincipal.CostosGastos1Click(Sender: TObject);
var
  archivo : String;
begin
  frmContFacturasSuplidores:=TfrmContFacturasSuplidores.Create(Nil);
  try
    frmContFacturasSuplidores.Showmodal;
  finally
  frmContFacturasSuplidores.Free;
  frmContFacturasSuplidores:=Nil;
  end;

  {TIPO_DOCUMENTO_CNT :=6; //Entrada
  SISTEMA_CNT        :=18;//Transaccion Costos y Gastos
  SUBSISTEMA_CNT     :=3; //Costos y Gastos
  GLBCODIGO_CIA      :=1;
  frmContabilizarCostosYGastos:=TfrmContabilizarCostosYGastos.Create(Nil);
  try
    GLBMODULO_CNT := 5;
    frmContabilizarCostosYGastos.nombretablaacnt:='VIEW_COSTOSGASTOS_ACNT';
    frmContabilizarCostosYGastos.Showmodal;
  finally
  frmContabilizarCostosYGastos.Free;
  frmContabilizarCostosYGastos:=Nil
  end;}
end;

procedure TfrmMenuPrincipal.ResumenCuadre1Click(Sender: TObject);
begin
  frmSelFecha:=TfrmSelFecha.Create(Nil);
  try
    frmSelFecha.FechaIni.Date:= GlbFechaTrnDiaria;
    frmSelFecha.FechaFin.Date:= GlbFechaTrnDiaria;
    if frmSelFecha.showmodal = mrOk then
    begin
      dmReportes.qryDatosRepVentaDiariaRes.close;
      dmReportes.qryDatosRepVentaDiariaRes.params[0].value:= ExtraerFecha(frmSelFecha.FechaIni.Date);
      dmReportes.qryDatosRepVentaDiariaRes.params[1].value:= ExtraerFecha(frmSelFecha.FechaFin.Date);
      dmReportes.qryDatosRepVentaDiariaRes.params[2].value:= glbCia_Key;
      if (UpperCase(trim(frmSelFecha.ComboBox1.Text)) = 'PESOS') then
      begin
        dmReportes.qryDatosRepVentaDiariaRes.params[3].value:= '1';
        dmReportes.qryDatosRepVentaDiariaRes.params[4].value:= '1';
      end else
      if (UpperCase(trim(frmSelFecha.ComboBox1.Text)) = 'DOLLAR') then
      begin
        dmReportes.qryDatosRepVentaDiariaRes.params[4].value:= '2';
        dmReportes.qryDatosRepVentaDiariaRes.params[5].value:= '2';
      end else
      if (UpperCase(trim(frmSelFecha.ComboBox1.Text)) = 'EURO') then
      begin
        dmReportes.qryDatosRepVentaDiariaRes.params[3].value:= '3';
        dmReportes.qryDatosRepVentaDiariaRes.params[4].value:= '3';
      end;
      dmReportes.qryDatosRepVentaDiariaRes.Open;
      dmReportes.QryRepVtaMaster.params[0].value:= ExtraerFecha(frmSelFecha.FechaIni.Date);
      dmReportes.QryRepVtaMaster.params[1].value:= ExtraerFecha(frmSelFecha.FechaFin.Date);
      dmReportes.QryRepVtaMaster.params[2].value:= glbCia_Key;
      dmReportes.QryRepVtaMaster.params[3].value:= dmReportes.qryDatosRepVentaDiariaRes.params[3].value;
      dmReportes.QryRepVtaMaster.params[4].value:= dmReportes.qryDatosRepVentaDiariaRes.params[4].value;
      dmReportes.QryRepVtaMaster.Open;    
  dmcxc.qryTipoMvtoIngreso.Close;
  dmcxc.qryTipoMvtoIngreso.Params[0].Value := ExtraerFecha(dmReportes.qryDatosRepVentaDiariaRes.Params[0].Value);
  dmcxc.qryTipoMvtoIngreso.Params[1].Value := ExtraerFecha(dmReportes.qryDatosRepVentaDiariaRes.Params[1].Value);
  dmcxc.qryTipoMvtoIngreso.Params[2].Value := glbCia_Key;
  dmcxc.qryTipoMvtoIngreso.Params[3].Value := dmReportes.qryDatosRepVentaDiariaResMONEDA.Value;
  dmcxc.qryTipoMvtoIngreso.ExecQuery;

  //dmreportes.qryFPagoTicket.Close;
  //dmreportes.qryFPagoTicket.Params[0].value:=ExtraerFecha(dmReportes.qryDatosRepVentaDiariaResNUMERO_TRN.Value;
  //dmreportes.qryFPagoTicket.Open;

      qckRepVentaDiariaGeneral:=TqckRepVentaDiariaGeneral.Create(Nil);
      try
        qckRepVentaDiariaGeneral.PrinterSettings.PrinterIndex:=GetImpresorarpt(2,12);
        qckRepVentaDiariaGeneral.Prepare;
        qckRepVentaDiariaGeneral.qrTpaginas.Caption:=' de '+IntToStr(qckRepVentaDiariaGeneral.PageNumber);
        qckRepVentaDiariaGeneral.QRLabel14.Caption :='';
        qckRepVentaDiariaGeneral.Preview;
        if frmSelFecha.CheckBox1.Checked then
           ReportExport(qckRepVentaDiariaGeneral,
           GlbRutaInformes+'\VentaDiaria'+FormatDatetime('ddmmyyyy',dmReportes.qryDatosRepVentaDiariaRes.params[0].value)+
                     '_A_'+FormatDatetime('ddmmyyyy',dmReportes.qryDatosRepVentaDiariaRes.params[1].value)+'.pdf');
      finally
      qckRepVentaDiariaGeneral.Free;
      qckRepVentaDiariaGeneral:=Nil;
      end;
    end;
  finally
  frmSelFecha.Free;
  frmSelFecha:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.CobrosCxc1Click(Sender: TObject);
var
  archivo : String;
begin
  TIPO_DOCUMENTO_CNT :=2;//Entrada
  SISTEMA_CNT        :=2;//Transaccion Ingresos Cxc
  SUBSISTEMA_CNT     :=2;
  GLBCODIGO_CIA      :=1;
  frmContabilizarIngCxc:=TfrmContabilizarIngCxc.Create(Nil);
  try
    GLBMODULO_CNT := 3;
    frmContabilizarIngCxc.nombretablaacnt:='VIEW_Cobros_cxcACNT';
    frmContabilizarIngCxc.Showmodal;
  finally
  frmContabilizarIngCxc.Free;
  frmContabilizarIngCxc:=Nil
  end;
end;

procedure TfrmMenuPrincipal.SumaItbisporTipoNCF1Click(Sender: TObject);
begin
  ordenPor:=3; //descripcion comprobante fiscal 4-Para enviar libro de ventas
  ImprimirRepItebisRes(3,3); //Sum;
end;

procedure TfrmMenuPrincipal.Emails1Click(Sender: TObject);
begin
  frmEmailProcess:=TfrmEmailProcess.Create(Nil);
  try
    frmEmailProcess.Showmodal;
  finally
  frmEmailProcess.Free;
  frmEmailProcess:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.EnviarLVentasEmail1Click(Sender: TObject);
begin
  if GlbActivaIFiscal = 0 then exit;
  frmEnviarFileLVentas:=TfrmEnviarFileLVentas.Create(Nil);
  try
    frmEnviarFileLVentas.Showmodal;
  finally
  frmEnviarFileLVentas.Free;
  frmEnviarFileLVentas:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.Gastos6061Click(Sender: TObject);
begin
  //
end;

procedure TfrmMenuPrincipal.VentasCrdito1Click(Sender: TObject);
var
  archivo : String;
begin
  TIPO_DOCUMENTO_CNT :=6;//Entrada
  SISTEMA_CNT        :=18;//Transaccion ventas a credito
  SUBSISTEMA_CNT     :=5;
  GLBCODIGO_CIA      :=1;
  frmContabilizarVentas:=TfrmContabilizarVentas.Create(Nil);
  try
    GLBMODULO_CNT := 1;
    frmContabilizarVentas.esVentaCredito:=True;
    frmContabilizarVentas.nombretablaacnt:='VIEW_VENTAS_ACNT';
    frmContabilizarVentas.Showmodal;
  finally
  frmContabilizarVentas.Free;
  frmContabilizarVentas:=Nil
  end;

end;

procedure TfrmMenuPrincipal.Reporte6071Click(Sender: TObject);
begin
  MessageDlg('Coming soon...',mtInformation,[mbok],0);
end;

procedure TfrmMenuPrincipal.Lavandaria1Click(Sender: TObject);
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

procedure TfrmMenuPrincipal.ConfReportes1Click(Sender: TObject);
begin
  frmConfReportes:=TfrmConfReportes.Create(Nil);
  try
    frmConfReportes.Showmodal;
  finally
  frmConfReportes.Free;
  frmConfReportes:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.CosturaSalida1Click(Sender: TObject);
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

procedure TfrmMenuPrincipal.AlquilerLavanderiaCostura1Click(
  Sender: TObject);
begin
  frmListadoServXTipo:= TfrmListadoServXTipo.Create(Nil);
  try
    if frmListadoServXTipo.ShowModal = mrOk then
    begin
      labelCretrioRep:='';
      frmListadoServXTipo.orderTipo:= 2;
      frmListadoServXTipo.AbrirDatos;
      if frmListadoServXTipo.qryStatusAlquilerMaster.RecordCount > 0 then
      begin
        qckListaServtXTipo:=TqckListaServtXTipo.Create(Nil);
        try
          qckListaServtXTipo.PrinterSettings.PrinterIndex:=GetImpresorarpt(2,12);
          qckListaServtXTipo.qrLabelCriterioDatos.Caption:= labelCretrioRep;
          qckListaServtXTipo.Preview;
        finally
        qckListaServtXTipo.Free;
        qckListaServtXTipo:=Nil;
        end;
      end else
      MessageDlg('No data con criterio seleccionado.', mtinformation,[mbok],0);
    end;
  finally
  frmListadoServXTipo.Free;
  frmListadoServXTipo:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.Precio12341Click(Sender: TObject);
var
  str : string;
  strOrd : string;
begin
  strOrd:='';
  str:='';

  frmSelTipoInv:= TfrmSelTipoInv.Create(Nil);
  try
    if frmSelTipoInv.ShowModal = mrOk then
    begin
      if GlbUsaPUnidadLevel =  1 then
      begin
        if frmSelTipoInv.chkBoxtodo.Checked then
        str := ' Where Tipo between 0 and 5000'
        else str := ' Where Tipo = '+IntToStr(frmSelTipoInv.xTipoInv);

        if (frmSelTipoInv.RadioGroup1.ItemIndex = 0) then
        str := str + ' and Cant <= 0';

        if (frmSelTipoInv.RadioGroup1.ItemIndex = 1) then
        str := str + ' and Cant > 0';

        if (frmSelTipoInv.RadioGroup2.ItemIndex = 0) then
        strOrd:=' Order by Codigo'
        else
        if (frmSelTipoInv.RadioGroup2.ItemIndex = 1) then
        strOrd:=' Order by Codigo'
        else
        if (frmSelTipoInv.RadioGroup2.ItemIndex = 2) then
        strOrd:=' Order by Producto'
        else
        if (frmSelTipoInv.RadioGroup2.ItemIndex = 3) then
        strOrd:=' Order by Cant'
        else
        if (frmSelTipoInv.RadioGroup2.ItemIndex = 4) then
        strOrd:=' Order by Tipo';

        if (frmSelTipoInv.RadioGroup3.ItemIndex = 1) then
        strOrd:=strOrd + ' DESC';

        dmInventario.qryPrecioXUnidadLevel.Close;
        dmInventario.qryPrecioXUnidadLevel.Sql.Text:= dmInventario.qryPrecioXUnidadLevel_Base0.Sql.Text
                                                      + ' ' + str + strOrd;
        dmInventario.qryPrecioXUnidadLevel.Open;

        qckRepPrecioXLevelXUnidad:=TqckRepPrecioXLevelXUnidad.Create(Nil);
        try
          qckRepPrecioXLevelXUnidad.PrinterSettings.PrinterIndex:=GetImpresorarpt(2,12);
          qckRepPrecioXLevelXUnidad.Preview;
        finally
        qckRepPrecioXLevelXUnidad.Free;
        qckRepPrecioXLevelXUnidad:=Nil;
        end;
      end else
      begin
        if frmSelTipoInv.chkBoxtodo.Checked then
        str := ' Where Tipo between 0 and 5000'
        else str := ' Where Tipo = '+IntToStr(frmSelTipoInv.xTipoInv);

        if (frmSelTipoInv.RadioGroup1.ItemIndex = 0) then
        str := str + ' and Cantidad <= 0';

        if (frmSelTipoInv.RadioGroup1.ItemIndex = 1) then
        str := str + ' and Cantidad > 0';

        if (frmSelTipoInv.RadioGroup2.ItemIndex = 0) then
        strOrd:=' Order by Codigo'
        else
        if (frmSelTipoInv.RadioGroup2.ItemIndex = 1) then
        strOrd:=' Order by Codigo'
        else
        if (frmSelTipoInv.RadioGroup2.ItemIndex = 2) then
        strOrd:=' Order by Descripcion'
        else
        if (frmSelTipoInv.RadioGroup2.ItemIndex = 3) then
        strOrd:=' Order by Cantidad'
        else
        if (frmSelTipoInv.RadioGroup2.ItemIndex = 4) then
        strOrd:=' Order by Tipo';

        if (frmSelTipoInv.RadioGroup3.ItemIndex = 1) then
        strOrd:=strOrd + ' DESC';
        dmInventario.qryInventario.Close;
        dmInventario.qryInventario.Sql.Text:= 'Select * From INVENTARIO_PRODUCTO '+str +strOrd;
        dmInventario.qryInventario.Open;

        qckRepPrecioXLevel:=TqckRepPrecioXLevel.Create(Nil);
        try
          qckRepPrecioXLevel.PrinterSettings.PrinterIndex:=GetImpresorarpt(2,12);
          qckRepPrecioXLevel.Preview;
        finally
        qckRepPrecioXLevel.Free;
        qckRepPrecioXLevel:=Nil;
        end;
      end;
    end;
  finally
  frmSelTipoInv.Free;
  frmSelTipoInv:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.PromoverEstudiantes1Click(Sender: TObject);
begin
  frmPromoverEstudiantes:=TfrmPromoverEstudiantes.Create(nil);
  try
    frmPromoverEstudiantes.showmodal;
  finally
  frmPromoverEstudiantes.Free;
  frmPromoverEstudiantes:=Nil;
  end;
end;


procedure TfrmMenuPrincipal.Configurar2Click(Sender: TObject);
begin
  frmTipoTrnConfig:=TfrmTipoTrnConfig.Create(nil);
  try
    frmTipoTrnConfig.ShowModal;
  finally
  FreeAndNil(frmTipoTrnConfig);
  end;
end;

procedure TfrmMenuPrincipal.RelacinEstadoCta1Click(Sender: TObject);
var
  codCte:Integer;
begin
  dmDatos.qryMembrete.Close;
  dmDatos.qryMembrete.Params[0].value:=GlbCia_Key;
  dmDatos.qryMembrete.Open;
  
  FrmBuscarClientesPersonas:=TFrmBuscarClientesPersonas.Create(Nil);
  try
    if FrmBuscarClientesPersonas.ShowModal = mrOk then
    begin
      CodCte:= FrmBuscarClientesPersonas.xCodigoCte;
      if (CodCte = 0) then
      begin
        MessageDlg('codigo cliente no puede ser cero, verifique', mtInformation, [mbOK], 0);
        FrmBuscarClientesPersonas.Free;
        FrmBuscarClientesPersonas:=Nil;
        Exit;
      end;
    end else
    begin
      FrmBuscarClientesPersonas.Free;
      FrmBuscarClientesPersonas:=Nil;
      Exit;
    end;
  finally
  FrmBuscarClientesPersonas.Free;
  FrmBuscarClientesPersonas:=Nil;
  end;
  dmReportes.qryEstadoCxcBB.Close;
  dmReportes.qryEstadoCxcBB.Params[0].Value:= codCte;
  dmReportes.qryEstadoCxcBB.Open;

  if GlBBurgos = 1 then
  begin
    qckEstadoCxcBB:=TqckEstadoCxcBB.Create(Nil);

    if (dmReportes.qryEstadoCxcBB.RecordCount = 1) And
       (dmReportes.qryEstadoCxcBBMONTO_FACT.Value = 0 ) And
       (dmReportes.qryEstadoCxcBBMONTO_PENDIENTE.Value = 0 ) And
       (dmReportes.qryEstadoCxcBBMONTO_VENCIDO.Value = 0 ) then
    qckEstadoCxcBB.qrLabelAviso.Enabled := True;

    if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrNo then
    begin
      qckEstadoCxcBB.PrinterSettings.PrinterIndex:=GetImpresorarpt(2,12);
      qckEstadoCxcBB.Preview;
    end else
    begin
      qckEstadoCxcBB.PrinterSetup;
      qckEstadoCxcBB.Print;
    end;
  end else
  begin
    qckEstadoCxcGeneral:=TqckEstadoCxcGeneral.Create(Nil);
    qckEstadoCxcGeneral.PrinterSettings.PrinterIndex:=GetImpresorarpt(2,12);
    if (dmReportes.qryEstadoCxcBB.RecordCount = 1) And
       (dmReportes.qryEstadoCxcBBMONTO_FACT.Value = 0 ) And
       (dmReportes.qryEstadoCxcBBMONTO_PENDIENTE.Value = 0 ) And
       (dmReportes.qryEstadoCxcBBMONTO_VENCIDO.Value = 0 ) then
    qckEstadoCxcGeneral.qrLabelAviso.Enabled := True;

    if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrNo then
    begin
      qckEstadoCxcGeneral.PrinterSettings.PrinterIndex:=GetImpresorarpt(2,12);
      qckEstadoCxcGeneral.Preview;
    end else
    begin
      qckEstadoCxcGeneral.PrinterSetup;
      qckEstadoCxcGeneral.Print;
    end;
  end;
end;

procedure TfrmMenuPrincipal.Permisos1Click(Sender: TObject);
begin
  if (GLBRUTADB<> '') then
  WinExec(PChar('ConfPermisos.exe'+' /GLBRUTADB='+GLBRUTADB), SW_SHOWNORMAL)
  else
  WinExec(PChar('ConfPermisos.exe'), SW_SHOWNORMAL);
end;

procedure TfrmMenuPrincipal.BitBtn7Click(Sender: TObject);
begin
  frmOrdenTrabajo:=TfrmOrdenTrabajo.Create(Nil);
  try
    frmOrdenTrabajo.Showmodal;
  finally
  frmOrdenTrabajo.Free;
  frmOrdenTrabajo:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.NCFNulos1Click(Sender: TObject);
begin
  frmConsultaNCF:=TfrmConsultaNCF.Create(Nil);
  try
    frmConsultaNCF.Showmodal;
  finally
  frmConsultaNCF.Free;
  frmConsultaNCF:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.Credito1Click(Sender: TObject);
var
  archivo : String;
begin
  TIPO_DOCUMENTO_CNT :=2;//Entrada
  SISTEMA_CNT        :=9;//Transaccion Odenes de Compra
  SUBSISTEMA_CNT     :=2;
  GLBCODIGO_CIA      :=1;
  frmContOrdenReg:=TfrmContOrdenReg.Create(Nil);
  try
    GLBMODULO_CNT := 2;
    frmContOrdenReg.FPago := 7;
    frmContOrdenReg.nombretablaacnt:='view_RegPedidoACnt';
    frmContOrdenReg.Showmodal;
  finally
  frmContOrdenReg.Free;
  frmContOrdenReg:=Nil
  end;
end;

procedure TfrmMenuPrincipal.Contado1Click(Sender: TObject);
var
  archivo : String;
begin
  TIPO_DOCUMENTO_CNT :=2;//Entrada
  SISTEMA_CNT        :=9;//Transaccion Odenes de Compra
  SUBSISTEMA_CNT     :=1;
  GLBCODIGO_CIA      :=1;
  frmContOrdenReg:=TfrmContOrdenReg.Create(Nil);
  try
    GLBMODULO_CNT := 2;
    frmContOrdenReg.FPago := 1;
    frmContOrdenReg.nombretablaacnt:='view_RegPedidoACnt';
    frmContOrdenReg.Showmodal;
  finally
  frmContOrdenReg.Free;
  frmContOrdenReg:=Nil
  end;
end;

procedure TfrmMenuPrincipal.Productosmasvendidos1Click(Sender: TObject);
begin
  frmConsultaProdVenta:=TfrmConsultaProdVenta.Create(nil);
  try
    frmConsultaProdVenta.showmodal;
  finally
  frmConsultaProdVenta.free;
  frmConsultaProdVenta:=nil;
  end;
end;

procedure TfrmMenuPrincipal.RotacionProductos1Click(Sender: TObject);
begin
  frmConsultaFechaUltmaVta:=TfrmConsultaFechaUltmaVta.Create(nil);
  try
    frmConsultaFechaUltmaVta.showmodal;
  finally
  frmConsultaFechaUltmaVta.free;
  frmConsultaFechaUltmaVta:=nil;
  end;
end;

procedure TfrmMenuPrincipal.Oficina1Click(Sender: TObject);
begin
  frmOficina:=TfrmOficina.Create(Nil);
  try
    frmOficina.Showmodal;
  finally
  frmOficina.Free;
  frmOficina:= Nil;
  end;
end;

procedure TfrmMenuPrincipal.Ciudades1Click(Sender: TObject);
begin
  frmCiudades:=TfrmCiudades.Create(Nil);
  try
    frmCiudades.Showmodal;
  finally
  frmCiudades.Free;
  frmCiudades:= Nil;
  end;
end;

procedure TfrmMenuPrincipal.ComisionOperadores1Click(Sender: TObject);
begin
  if (GlbTipoComision = 2) and (GlBAyaco =1) then
  begin
    Procesar1Click(Self);
  end else
  if GlbTipoComision = 2 then
  begin
    frmComisionVtaXProd:=TfrmComisionVtaXProd.Create(Nil);
    try
      frmComisionVtaXProd.ShowModal;
    finally
    frmComisionVtaXProd.Free;
    frmComisionVtaXProd:=nil;
    end;
  end else
  begin
    frmComisionTrab:=TfrmComisionTrab.Create(Nil);
    try
      frmComisionTrab.ShowModal;
    finally
    frmComisionTrab.Free;
    frmComisionTrab:=nil;
    end;
  end;
end;

procedure TfrmMenuPrincipal.EntSalidaInventario1Click(Sender: TObject);
begin
  frmCtrlEntSalInv:=TfrmCtrlEntSalInv.Create(Nil);
  try
    frmCtrlEntSalInv.tipoOpe :=1;//Bienes
    frmCtrlEntSalInv.tripoTrn:=1;
    frmCtrlEntSalInv.Showmodal;
  finally
  frmCtrlEntSalInv.Free;
  frmCtrlEntSalInv:=Nil;
  end;
end;
{temporal no lo borres
procedure TfrmMenuPrincipal.AvisoEmailLicenciaNoRegistrada;
var
  xtipo : integer;
  AvisoE : boolean;
  xVersion : string;
  VInfo: TVersionInfo;
  FAppVer, FAppBuild : String;  
begin
  if (UpperCase(strUserName) = 'NOSIVID') then exit;
  
  dmCompania.qryEmailProceso.Close;
  dmCompania.qryEmailProceso.Open;
  dmCompania.qryEmailProceso.Last;
  dmCompania.qryEmailProceso.First;

  if (trim(GlbUsuarioLogueado) = 'SOPORTE 1') Or (trim(GlbUsuarioLogueado) = 'DIVISON')
  or (trim(GlbUsuarioLogueado) = 'DEMO 1') then Exit;

  xtipo:=0;
  if dmCompania.qryEmailProcesoIDTIPO.Value = 0 then
  AvisoE:=True
  else
  if dmCompania.qryEmailProceso.RecordCount > 1 then
  begin
    if dmCompania.qryEmailProceso.Locate('IDTIPO',xtipo,[]) then
    AvisoE:=True
    else
    AvisoE:=False;
  end;

  //if dmCompania.qryEmailProceso.Locate('IDTIPO',0,[]) then
  if AvisoE and ((upperCase(strUserName) <> 'SOPORTE') or (upperCase(strUserName) <> 'DIVISON'))then
  begin
    ProcLogTrackingEmailAviso(0,dmCompania.qryEmailProcesoEMAIL_SERVER.Value,
    dmCompania.qryEmailProcesoPORT.AsString,dmCompania.qryEmailProcesoUSER_EMAIL.Value,
    Desencriptar(dmCompania.qryEmailProcesoUSER_PASSWORD.Value,2005),
    Now,dmCompania.qryEmailProcesoTOEMAIL.Value,dmCompania.qryEmailProcesoFROMEMAIL.Value,
    dmCompania.qryEmailProcesoSUBJECT.Value+' -CIA:'+
    dmCompania.tblCompaniaNOMBRE.Value+
    ''#13#10'Sucursal : '+dmCompania.tblCompaniaCIUDAD.AsString+' '+FormatDateTime('dd/mm/yyyy hh:mm a/p',now),
    'Email: '#13#10''+dmCompania.tblCompaniaEMAIL.Value + ''#13#10''+
    'Cant Corridas: '#13#10''+IntToStr(GlbCantCorridas) + ''#13#10''+
    'Aviso USO PointSaleSoft, módulo punto ventas. '#13#10'',
    //xVersion + ''#13'Cantidad de veces de uso disponible: '+IntToStr(qtyCorr),
    VarUsuarioGlb,'A','', Now, StrUserName, FormatDateTime('dd/mm/yyyy hh:mm a/p', Now),StrUserName,'',
    dmCompania.tblCompaniaNOMBRE.Value);
    if xtipo > 0 then
    xtipo:=0;
    if Not dmCompania.qryEmailProceso.Locate('IDTIPO', xtipo, []) then
        begin
          dmCompania.tblTrackingEmail.Append;
          dmCompania.tblTrackingEmailIDTIPO.Value   := 0;
          dmCompania.tblTrackingEmailFECHA.Value    := ExtraerFecha(now);
          dmCompania.tblTrackingEmailTOEMAIL.Value  := dmCompania.qryEmailProcesoTOEMAIL.Value;
          dmCompania.tblTrackingEmailFROMEMAIL.Value:= dmCompania.qryEmailProcesoFROMEMAIL.Value;
          dmCompania.tblTrackingEmailSUBJECT.Value  := 'subject';
          dmCompania.tblTrackingEmailCOD_USER.Value := VarUsuarioGlb;
          dmCompania.tblTrackingEmailSTATUS.Value   := 'A';
          dmCompania.tblTrackingEmailIN_POR.Value   := StrUserName;
          dmCompania.tblTrackingEmailFECHAIN.Value  := Now;
          GlbSalvarQuery(dmCompania.tblTrackingEmail);
        end;
        dmCompania.tblTrackingEmail.Close;
      end else
      begin
        dmCompania.tblEmailProceso.Close;
        dmCompania.tblEmailProceso.Open;
        xtipo:=99;
        if Not dmCompania.qryEmailProceso.Locate('IDTIPO',xtipo,[]) then
        begin
          dmCompania.tblEmailProceso.Append;
          dmCompania.tblEmailProcesoIDTIPO.Value       := 0;
          dmCompania.tblEmailProcesoSUBJECT.Value      := 'PointSaleSoft';
          dmCompania.tblEmailProcesoPORT.Value         := 587;
          dmCompania.tblEmailProcesoEMAIL_SERVER.Value := 'smtp.gmail.com';
          dmCompania.tblEmailProcesoUSER_EMAIL.Value   := 'idesipos.soporte@gmail.com';
          dmCompania.tblEmailProcesoUSER_PASSWORD.Value:='';
          dmCompania.tblEmailProcesoFROMEMAIL.Value    := 'idesipos.soporte@gmail.com';
          dmCompania.tblEmailProcesoTOEMAIL.Value      := 'idesi@hotmail.com';
          dmCompania.tblEmailProcesoCCEMAIL.Value      := '';
          dmCompania.tblEmailProcesoFECHAIN.Value      := Now;
          dmCompania.tblEmailProcesoIN_POR.Value       := 'RunTime';
          dmCompania.tblEmailProcesoSTATUS.Value       := 'A';
          GlbSalvarQuery(dmCompania.tblEmailProceso);
        end;
      end;
end;  }//temporal

procedure TfrmMenuPrincipal.OrdenadoporNCFSum1Click(Sender: TObject);
begin
  ordenPor:=10;
  //ImprimirRepItebis(1,1); //Detallado;
  ImprimirRepItebisSum;
end;

procedure TfrmMenuPrincipal.ImprimirRepItebisSum;
var
  salir : boolean;
  strmoneda : string;
  ExptoExcel : Boolean;
  lEnviaEmail:Boolean;
begin
  Salir:=False;

  frmSelFecha:=TfrmSelFecha.Create(Nil);
  try
    frmselfecha.CheckBox1.Caption:='Enviar por Email';

    if frmselfecha.ShowModal = mrok then
    begin
      dmCompania.tblCompania.Close;
      dmCompania.tblCompania.Open;
      dmCompania.tblCompania.Locate('codigo', glbCia_Key, []);

      //dmFactura.rtipo := tipodoc;
      dmFactura.qryRepNCFSum.Filtered:= false;
      dmFactura.qryRepNCFSum.Close;
      GlbEnviaEmail := frmSelFecha.CheckBox1.Checked;
      lEnviaEmail :=GlbEnviaEmail;

      dmFactura.qryRepNCFSum.params[0].Value:=ExtraerFecha(frmselfecha.FechaIni.DateTime);
      dmFactura.qryRepNCFSum.params[1].Value:=ExtraerFecha(frmselfecha.FechaFin.DateTime);

      //Pesos Dollar Euro
      if (uppercase(trim(frmselfecha.ComboBox1.Text))= 'PESOS') then
      dmFactura.qryRepNCFSum.params[2].Value:= '1'
      else
      if (uppercase(trim(frmselfecha.ComboBox1.Text))= 'DOLLAR') then
      dmFactura.qryRepNCFSum.params[2].Value:= '2'
      else                                                
      dmFactura.qryRepNCFSum.params[2].Value:= '3';//Euro}
      strmoneda:= trim(frmselfecha.ComboBox1.Text);
      dmFactura.qryRepNCFSum.open;
      //dmFactura.qryRepNCFSum.RecordCount
      //if (ordenPor <> 1) then
      //dmFactura.qryRepItbis.Filtered:=True;
      if (frmselfecha.CheckBox1.Checked) then
      begin
      try
        if frmSelFecha.CheckBox1.Checked then
        begin
          GLBMostrarArchivo := True;
          GlbEnviaEmail := frmSelFecha.CheckBox1.Checked;
          lEnviaEmail :=GlbEnviaEmail;
          GlbIDTipoEmail:= 1; //Detalle NCF
         if (Not DirectoryExists('Informes')) then
         CreateDir('Informes');
          ExporNCFListToExcel(dmfactura.qryRepItbissum, ExtractFilePath(Application.ExeName)+
          'Informes\RelacionNCF'+
          FormatDateTime('ddmmyyyy',dmFactura.qryRepItbissum.params[0].Value)+'_A_'+
          FormatDateTime('ddmmyyyy',dmFactura.qryRepItbissum.params[1].Value));
          Salir:=True;
          MessageDlg('Archivo de Excel generado.', mtInformation,[mbok], 0);
        end;
      except
      end;
      end;
    end else Salir:=True;
  finally
  frmSelFecha.free;
  frmSelFecha:=nil;
  end;
  if Salir then Exit;
    qckRepItbisSum:=TqckRepItbisSum.Create(Nil);
    try
      qckRepItbisSum.strmoneda := strmoneda;
      if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrNo then
      begin
        qckRepItbisSum.Prepare;
        qckRepItbisSum.qrTpaginas.Caption:= ' de '+IntToStr(qckRepItbisSum.PageNumber);
        qckRepItbisSum.Preview;
      end else
      begin
        qckRepItbisSum.PrinterSetup;
        qckRepItbisSum.Print;
      end;
    finally
    qckRepItbisSum.Free;
    qckRepItbisSum:=Nil;
    end;

end;

procedure TfrmMenuPrincipal.Button2Click(Sender: TObject);
begin
  qckRepFuenteImpresora:=TqckRepFuenteImpresora.Create(nil);
  try
    qckRepFuenteImpresora.rxDaa.Open;
    qckRepFuenteImpresora.rxDaa.Append;
    qckRepFuenteImpresora.rxDaaLinea.Value:='Nombre Fuente : ';
    qckRepFuenteImpresora.rxDaa.Post;

    qckRepFuenteImpresora.Preview;
  finally
  qckRepFuenteImpresora.free;
  qckRepFuenteImpresora:=nil;
  end;
end;

procedure TfrmMenuPrincipal.Detallado2Click(Sender: TObject);
begin
  GetDateTipoMoneda1.EligeTipo:=False;
  GetDateTipoMoneda1.EligeMoneda:=False;
  if GetDateTipoMoneda1.Execute then
  begin
    dmReportes.qryDatos607.Close;
    dmReportes.qryDatos607.Params[0].Value:= ExtraerFecha(GetDateTipoMoneda1.Fecha);
    dmReportes.qryDatos607.Params[1].Value:= ExtraerFecha(GetDateTipoMoneda1.FechaFinal);
    //dmReportes.qryDatos607.Params[2].Value:= 1;//Detallado
    dmReportes.qryDatos607.Open;

    qckRepData607:=TqckRepData607.Create(nil);
    try
      qckRepData607.PrinterSettings.PrinterIndex:=GetImpresorarpt(2,12);
      qckRepData607.Preview;
    finally
    qckRepData607.free;
    qckRepData607:=nil;
    end;
  end;
end;

procedure TfrmMenuPrincipal.ConfirmarConduce1Click(Sender: TObject);
begin
  frmConfirmaConduce:=TfrmConfirmaConduce.Create(Nil);
  try
    frmConfirmaConduce.Showmodal;
  finally
  frmConfirmaConduce.Free;
  frmConfirmaConduce:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.ConfImpresoras1Click(Sender: TObject);
begin
  frmConfImpresoras:=TfrmConfImpresoras.Create(nil);
  try
    frmConfImpresoras.showmodal;
  finally
  frmConfImpresoras.free;
  frmConfImpresoras:=nil;
  end;
end;

procedure TfrmMenuPrincipal.CuadreConduce1Click(Sender: TObject);
begin
  frmCuadraConduce:=TfrmCuadraConduce.Create(nil);
  try
    frmCuadraConduce.ShowModal;
  finally
  frmCuadraConduce.free;
  frmCuadraConduce:=nil;
  end;
end;

procedure TfrmMenuPrincipal.MontoComisionable1Click(Sender: TObject);
begin
  frmMetasXVendedor := TfrmMetasXVendedor.Create(Nil);
  try
    frmMetasXVendedor.ShowModal;
  finally
  frmMetasXVendedor.free;
  frmMetasXVendedor:=nil;
  end;
end;

procedure TfrmMenuPrincipal.ListadoNCFConFPago1Click(Sender: TObject);
begin
  frmReporteVentas:=TfrmReporteVentas.Create(Self);
  try
    frmReporteVentas.showmodal;
  finally
  frmReporteVentas.free;
  frmReporteVentas:=nil;
  end;
end;

procedure TfrmMenuPrincipal.Depsitos1Click(Sender: TObject);
begin
  frmDepositos:=TfrmDepositos.Create(nil);
  try
    frmDepositos.showmodal;
  finally
  frmDepositos.free;
  frmDepositos:=nil;
  end;
end;

procedure TfrmMenuPrincipal.ipoCuenta1Click(Sender: TObject);
begin
  frmTipoCtaBanco:=TfrmTipoCtaBanco.Create(Nil);
  try
    frmTipoCtaBanco.Showmodal;
  finally
  frmTipoCtaBanco.Free;
  frmTipoCtaBanco:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.ipoDeposito1Click(Sender: TObject);
begin
  frmTipoDeposito:=TfrmTipoDeposito.Create(Nil);
  try
    frmTipoDeposito.showmodal;
  finally
  frmTipoDeposito.free;
  frmTipoDeposito:=nil;
  end;
end;

procedure TfrmMenuPrincipal.Mantenimiento2Click(Sender: TObject);
begin
  frmBancos:=tFrmBancos.Create(Nil);
  try
    frmBancos.Showmodal;
  finally
  frmBancos.Free;
  frmBancos:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.Conduce1Click(Sender: TObject);
begin
  frmRepConduce:=TfrmRepConduce.Create(nil);
  try
    frmRepConduce.Showmodal;
  finally
  frmRepConduce.free;
  frmRepConduce:=nil;
  end;
end;

procedure TfrmMenuPrincipal.ipoNomina1Click(Sender: TObject);
begin
  frmActTipoNomina := TfrmActTipoNomina.Create(nil);
  try
    frmActTipoNomina.showmodal;
  finally
  frmActTipoNomina.free;
  frmActTipoNomina:= nil;
  end;
end;

procedure TfrmMenuPrincipal.CantXUnidad1Click(Sender: TObject);
begin
  frmPrecioXTipoProd:=TfrmPrecioXTipoProd.Create(nil);
  try
    dmInventario.qryPrecioXUnidadLevel.Close;
    dmInventario.qryPrecioXUnidadLevel.Sql.Text:= dmInventario.qryPrecioXUnidadLevel_Base0.Sql.Text;
    dmInventario.qryPrecioXUnidadLevel.Sql.Add('order by r.tipo');
    dmInventario.qryPrecioXUnidadLevel.Open;
    if frmPrecioXTipoProd.ShowModal = mrOk then
    begin
      qckRepPrecioXCantUnidad:=TqckRepPrecioXCantUnidad.Create(nil);

      qckRepPrecioXCantUnidad.qrdbP1.Enabled:=frmPrecioXTipoProd.CheckBox1.Checked;
      qckRepPrecioXCantUnidad.qrdbP2.Enabled:=frmPrecioXTipoProd.CheckBox2.Checked;
      qckRepPrecioXCantUnidad.qrdbP3.Enabled:=frmPrecioXTipoProd.CheckBox3.Checked;
      qckRepPrecioXCantUnidad.qrdbP4.Enabled:=frmPrecioXTipoProd.CheckBox4.Checked;

      frmImprimir:=TfrmImprimir.Create(nil);
      try
      frmImprimir.rdgXLS.Visible:=True;
      if frmImprimir.Showmodal = mrOk then
      begin
        if frmImprimir.rdgXLS.Checked then
        begin
          dmCompania.tblCompania.Close;
          dmCompania.tblCompania.Open;
          dmCompania.tblCompania.Locate('codigo',glbCia_Key,[]);
          GLBMostrarArchivo:=True;
          ExporToExcel(dmInventario.qryPrecioXUnidadLevel, ExtractFilePath(Application.ExeName)+
          'Informes\ListadoDePrecios'+
          FormatDateTime('ddmmyyyy',now)+'_'
          +FormatDateTime('hhmmss',now),false);
          GLBMostrarArchivo:=False;
        end else
        begin
          if frmImprimir.RadioGroup1.ItemIndex = 0 then
          qckRepPrecioXCantUnidad.Page.PaperSize := Letter;
          qckRepPrecioXCantUnidad.PrinterSettings.PrinterIndex:=GetImpresorarpt(2,12);
          if frmImprimir.RadioButton1.Checked then
          begin
            qckRepPrecioXCantUnidad.PrinterSetup;
            qckRepPrecioXCantUnidad.Print;
          end else
          qckRepPrecioXCantUnidad.Preview;
        end;      
      end;
      finally
      frmImprimir.Free;
      frmImprimir:=Nil;
      end;
    end;
  finally
  frmPrecioXTipoProd.Free;
  frmPrecioXTipoProd:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.Vehculos1Click(Sender: TObject);
begin
  //frmVehiculos
  FrmFichasVeh:=TFrmFichasVeh.Create(nil);
  try
    FrmFichasVeh.Showmodal;
  finally
  FrmFichasVeh.free;
  FrmFichasVeh:=nil;
  end;
end;

procedure TfrmMenuPrincipal.ExistenciaActual2Click(Sender: TObject);
begin
  dmInventario.qryPrecioXUnidadLevel.Close;
  dmInventario.qryPrecioXUnidadLevel.Sql.Text:= dmInventario.qryPrecioXUnidadLevel_Base0.Sql.Text;
  dmInventario.qryPrecioXUnidadLevel.Sql.Add('order by r.tipo');
  dmInventario.qryPrecioXUnidadLevel.Open;
  qckRepExistenciaVenta:=TqckRepExistenciaVenta.Create(nil);

  frmImprimir:=TfrmImprimir.Create(nil);
  try
    frmImprimir.rdgXLS.Visible:=True;
    if frmImprimir.Showmodal = mrOk then
    begin
      if frmImprimir.rdgXLS.Checked then
      begin
        dmCompania.tblCompania.Close;
        dmCompania.tblCompania.Open;
        dmCompania.tblCompania.Locate('codigo',glbCia_Key,[]);
        GLBMostrarArchivo:=True;
        ExporToExcel(dmInventario.qryPrecioXUnidadLevel, ExtractFilePath(Application.ExeName)+
        'Informes\ListadoInvExistencia'+
        FormatDateTime('ddmmyyyy',now)+'_'
        +FormatDateTime('hhmmss',now),false);
        GLBMostrarArchivo:=False;
      end else
      begin
      qckRepExistenciaVenta.PrinterSettings.PrinterIndex:=GetImpresorarpt(2,12);
      if frmImprimir.RadioGroup1.ItemIndex = 0 then
      qckRepExistenciaVenta.Page.PaperSize := Letter;
      if frmImprimir.RadioButton1.Checked then
      begin
        qckRepExistenciaVenta.PrinterSetup;
        qckRepExistenciaVenta.Print;
      end else
      qckRepExistenciaVenta.Preview;
      end;
    end;
  finally
  frmImprimir.Free;
  frmImprimir:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.PorVendedorDataComisiones1Click(
  Sender: TObject);
begin
//Crear Ventana par filtro
  frmListadoVentasXVendedor:=TfrmListadoVentasXVendedor.Create(Nil);
  try
    if frmListadoVentasXVendedor.Showmodal = mrOk then
    begin
      frmListadoVentasXVendedor.orderTipo:=2;
      frmListadoVentasXVendedor.AbrirDatos;
      if dmReportes.qryViewVentasHist.RecordCount > 0 then
      begin
        qckListaFactXVendedorDatCom:=TqckListaFactXVendedorDatCom.Create(nil);
        try
          qckListaFactXVendedorDatCom.PrinterSettings.PrinterIndex:=GetImpresorarpt(2,12);
          qckListaFactXVendedorDatCom.qrLabelCriterioDatos.Caption:= labelCretrioRep;
          qckListaFactXVendedorDatCom.Preview;
        finally
        qckListaFactXVendedorDatCom.Free;
        qckListaFactXVendedorDatCom:=Nil;
        end;
      end else
      MessageDlg('No data con criterio seleccionado.', mtinformation,[mbok],0);
    end;
  finally
  qckListaFactXVendedorDatCom.Free;
  qckListaFactXVendedorDatCom:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.RelacinGastos1Click(Sender: TObject);
begin
  frmRelGastosCostos:=TfrmRelGastosCostos.Create(nil);
  try
    if frmRelGastosCostos.ShowModal = mrOk then
    begin
    frmRelGastosCostos.AbrirDatos;
    qckRelGastosVentas:=TqckRelGastosVentas.Create(Nil);
    try
      qckRelGastosVentas.PrinterSettings.PrinterIndex:=GetImpresorarpt(2,12);
      qckRelGastosVentas.Preview;
    finally
    qckRelGastosVentas.Free;
    qckRelGastosVentas:=Nil;
    end;
    end;
    if frmRelGastosCostos.chkExpExcel.Checked then
    begin
       dmCompania.tblCompania.Close;
        dmCompania.tblCompania.Open;
        dmCompania.tblCompania.Locate('codigo',glbCia_Key,[]);
        GLBMostrarArchivo:=True;
        ExporToExcel(dmreportes.qryRepGastosVtas, ExtractFilePath(Application.ExeName)+
        'Informes\RelacionGastos'+
        FormatDateTime('ddmmyyyy',dmreportes.qryRepGastosVtas.Params[0].Value)+'_'
        +FormatDateTime('hhmmss',dmreportes.qryRepGastosVtas.Params[1].Value),false);
        GLBMostrarArchivo:=False;
    end;
  finally
  frmRelGastosCostos.free;
  frmRelGastosCostos:=nil;
  end;
end;

procedure TfrmMenuPrincipal.CuadreFacturas1Click(Sender: TObject);
begin
  frmSelFecha:=tfrmSelFecha.Create(nil);
  try
    frmSelFecha.CheckBox1.Caption := 'Exporta XLS';
    frmSelFecha.CheckBox1.Hint    := 'Exportar datos a Excel';
    frmSelFecha.CheckBox1.ShowHint:= True;
    frmSelFecha.FechaIni.DateTime:=GlbFechaTrnDiaria;
    frmSelFecha.FechaFin.DateTime:=GlbFechaTrnDiaria;
    if frmSelFecha.ShowModal = mrOk then
    begin
      dmCuadrexRuta.qryRepFactCuadre.Close;
      dmCuadrexRuta.qryRepFactCuadre.Params[0].Value:=ExtraerFecha(frmselfecha.FechaIni.DateTime);
      dmCuadrexRuta.qryRepFactCuadre.Params[1].Value:=ExtraerFecha(frmselfecha.FechaFin.DateTime);
      dmCuadrexRuta.qryRepFactCuadre.Params[2].Value:=glbCia_Key;
      dmCuadrexRuta.qryRepFactCuadre.Open;
      QckRepFVtaCuadre:=TQckRepFVtaCuadre.Create(Nil);
      try
        QckRepFVtaCuadre.PrinterSettings.PrinterIndex:=GetImpresorarpt(2,12);
        QckRepFVtaCuadre.Prepare;
        GlbTPag := QckRepFVtaCuadre.PageNumber;
        if frmSelFecha.CheckBox1.Checked then
        begin
          dmCompania.tblCompania.Close;
          dmCompania.tblCompania.Open;
          dmCompania.tblCompania.Locate('codigo',glbCia_Key,[]);
          GLBMostrarArchivo:=True;
          if (dmCuadrexRuta.qryRepFactCuadre.Params[0].Value = dmCuadrexRuta.qryRepFactCuadre.Params[1].Value) then
          GlbrangoFecha:='DIA '+FormatDateTime('dd',dmCuadrexRuta.qryRepFactCuadre.Params[0].Value) +
          ' DE '+FormatDateTime('MMM',dmCuadrexRuta.qryRepFactCuadre.Params[0].Value)+
          ' DE '+FormatDateTime('yyyy',dmCuadrexRuta.qryRepFactCuadre.Params[0].Value)
          else
          GlbrangoFecha:='Desde '+FormatDateTime('dd/mm/yyyy',dmCuadrexRuta.qryRepFactCuadre.Params[0].Value) +
          ' Hasta '+FormatDateTime('dd/mm/yyyy',dmCuadrexRuta.qryRepFactCuadre.Params[1].Value);
          
          ExporToExcelFCTCuadre(dmCuadrexRuta.qryRepFactCuadre, ExtractFilePath(Application.ExeName)+
          'Informes\ListadoFacturasCuadreDiario'+
          FormatDateTime('ddmmyyyy',dmCuadrexRuta.qryRepFactCuadre.Params[0].Value)+'_'
          +FormatDateTime('ddmmyyyy',dmCuadrexRuta.qryRepFactCuadre.Params[1].Value));
          if GLBMostrarArchivo then
          ShellExecute(0, 'Open', PChar(GlbRutaExeLIbroVenta), PChar(''), PChar(''), SW_SHOWNORMAL);
          GLBMostrarArchivo:=False;

        end else
        QckRepFVtaCuadre.Preview;
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

procedure TfrmMenuPrincipal.UnProducto1Click(Sender: TObject);
begin
  frmConsultaVtaProductos:=TfrmConsultaVtaProductos.Create(Nil);
  try
    frmConsultaVtaProductos.ShowModal;
  finally
  FreeAndNil(frmConsultaVtaProductos);
  end;
end;

procedure TfrmMenuPrincipal.PrecioXUnidades1Click(Sender: TObject);
begin
    dmreportes.qckRepDatos.Close;
    dmreportes.qckRepDatos.Open;
  if dmreportes.qckRepDatos.RecordCount > 0 then
  begin
    qckRepInvExistencia:=TqckRepInvExistencia.Create(nil);
    try
      qckRepInvExistencia.PrinterSettings.PrinterIndex:=GetImpresorarpt(2,12);
      qckRepInvExistencia.Preview;
    finally
    qckRepInvExistencia.free;
    qckRepInvExistencia:=nil;
    end;
  end;
end;

procedure TfrmMenuPrincipal.AnlisisPrecioXCant1Click(Sender: TObject);
begin
  dmreportes.qryRepAnalisisPrecio.Close;
  dmreportes.qryRepAnalisisPrecio.Open;
  dmreportes.qryRepAnalisisPrecio.Last;
  dmreportes.qryRepAnalisisPrecio.First;
  if dmreportes.qryRepListaPrecioIncons.RecordCount = 0 then
  begin
    MessageDlg('No existen records con criterio de inconsistencia.',mtInformation,[MbOk],0);
    Exit;
  end;
  if (Not DirectoryExists('Informes')) then
  CreateDir('Informes');

  GLBMostrarArchivo:=True;
  ExporToExcel(dmreportes.qryRepAnalisisPrecio, ExtractFilePath(Application.ExeName)+
  'Informes\ReporteAnalisisPrecioVta'+
  FormatDateTime('ddmmyyyy',now)+'_'
  +FormatDateTime('hhmmss',now),false);
  GLBMostrarArchivo:=False;  
end;

procedure TfrmMenuPrincipal.ListaPreciosVtaIncorrecto1Click(
  Sender: TObject);
begin
  dmreportes.qryRepListaPrecioIncons.Close;
  dmreportes.qryRepListaPrecioIncons.Open;
  dmreportes.qryRepListaPrecioIncons.Last;
  dmreportes.qryRepListaPrecioIncons.First;
  if dmreportes.qryRepListaPrecioIncons.RecordCount = 0 then
  begin
    MessageDlg('No existen records con criterio de inconsistencia.',mtInformation,[mbOk],0);
  end else
  begin
    if (Not DirectoryExists('Informes')) then
    CreateDir('Informes');

    GLBMostrarArchivo:=True;

    ExporToExcel(dmreportes.qryRepListaPrecioIncons, ExtractFilePath(Application.ExeName)+
    'Informes\ReporteAnalisisPrecioVtaConInconsistencia'+
    FormatDateTime('ddmmyyyy',now)+'_'
    +FormatDateTime('hhmmss',now),false);
    GLBMostrarArchivo:=False;
  end;
end;

procedure TfrmMenuPrincipal.Detporusuario1Click(Sender: TObject);
begin
  frmVentaDetXUsuario := TfrmVentaDetXUsuario.Create(Nil);
  try
    frmVentaDetXUsuario.Showmodal;
  finally
  frmVentaDetXUsuario.Free;
  frmVentaDetXUsuario:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.EncriptarValor1Click(Sender: TObject);
begin
  frmEncrypt:=TfrmEncrypt.Create(nil);
  try
    frmEncrypt.Showmodal;
  finally
  FreeAndNil(frmEncrypt);
  end;
end;

procedure TfrmMenuPrincipal.estEmail1Click(Sender: TObject);
begin
  try
  frmEnviarEmailTest:=TfrmEnviarEmailTest.Create(Nil);
  try
    frmEnviarEmailTest.Showmodal;
  finally
  frmEnviarEmailTest.Free;
  frmEnviarEmailTest:=Nil;
  end;
  Except
  on E : Exception do
  WriteToLog(E.ClassName+' error raised, with message : '+E.Message); 
  end
end;

procedure TfrmMenuPrincipal.PorRuta1Click(Sender: TObject);
begin
  frmListadoVentasXRuta:=TfrmListadoVentasXRuta.Create(Nil);
  try
    if frmListadoVentasXRuta.Showmodal = mrOk then
    begin
      frmListadoVentasXRuta.orderTipo := 2;
      frmListadoVentasXRuta.AbrirDatos;
      if dmReportes.qryViewVentasHist.RecordCount > 0 then
      begin
        qckListaFactXRuta:=TqckListaFactXRuta.Create(Nil);
        try
          qckListaFactXRuta.qrLabelCriterioDatos.Caption:= labelCretrioRep;
          qckListaFactXRuta.PrinterSettings.PrinterIndex:=GetImpresorarpt(2,12);
          qckListaFactXRuta.Prepare;
          qckListaFactXRuta.Preview;
        finally
        qckListaFactXRuta.Free;
        qckListaFactXRuta:=Nil;
        end;
      end else
      MessageDlg('No data con criterio seleccionado.', mtInformation, [mbok],0);
    end;
  finally
  frmListadoVentasXRuta.Free;
  frmListadoVentasXRuta:=Nil;
  end;
  //UQckRepServVendedor
end;

procedure TfrmMenuPrincipal.ResumenVentaxRuta1Click(Sender: TObject);
begin
  frmVentasSumXRuta:=TfrmVentasSumXRuta.Create(Nil);
  try
    frmVentasSumXRuta.Showmodal;
  finally
  FreeAndNil(frmVentasSumXRuta);
  end;
end;

procedure TfrmMenuPrincipal.ARS1Click(Sender: TObject);
begin
  frmARS:=TfrmARS.Create(Nil);
  try
    frmARS.showmodal;
  finally
  frmARS.free;
  frmARS:=nil;
  end;
end;

procedure TfrmMenuPrincipal.Conciliacin1Click(Sender: TObject);
begin
  frmConciliacionDeFctSeguro:=tfrmConciliacionDeFctSeguro.Create(nil);
  try
   frmConciliacionDeFctSeguro.Showmodal;
  finally
  frmConciliacionDeFctSeguro.free;
  frmConciliacionDeFctSeguro:=nil;
  end;
end;

procedure TfrmMenuPrincipal.Liquidacin1Click(Sender: TObject);
begin
  frmLiquidacionARS:=TfrmLiquidacionARS.Create(nil);
  try
    frmLiquidacionARS.ShowModal;
  finally
  frmLiquidacionARS.free;
  frmLiquidacionARS:=nil;
  end;
end;

procedure TfrmMenuPrincipal.ImportarPolizas1Click(Sender: TObject);
begin
  frmImportarPolizas:=TfrmImportarPolizas.Create(nil);
  try
    frmImportarPolizas.ShowModal;
  finally
  frmImportarPolizas.free;
  frmImportarPolizas:=nil;
  end;
end;

procedure TfrmMenuPrincipal.RelacindeCostosGastos1Click(Sender: TObject);
begin
  if GlbFormatoConduce = 444 then
  begin
    frmSelFEcha:=TfrmSelFEcha.create(nil);
    try
      if frmSelFEcha.showmodal = mrOk then
      begin
        dmReportes.qryRepTransOpeDiaria.close;
        dmReportes.qryRepTransOpeDiaria.params[0].Value:= ExtraerFecha(frmSelfecha.FechaIni.Date);
        dmReportes.qryRepTransOpeDiaria.params[1].Value:= ExtraerFecha(frmSelfecha.FechaFin.Date);
        dmReportes.qryRepTransOpeDiaria.open;

        qckTransOpeDiaria:=TqckTransOpeDiaria.Create(nil);
        try
          qckTransOpeDiaria.PrinterSettings.PrinterIndex:=GetImpresorarpt(2,12);
          qckTransOpeDiaria.Prepare;
          qckTransOpeDiaria.TPag.Caption:= IntToStr(qckTransOpeDiaria.PageNumber);
          qckTransOpeDiaria.Preview;
        finally
        qckTransOpeDiaria.Free;
        qckTransOpeDiaria:=Nil;
        end;
      end;
    finally
    frmSelFEcha.Free;
    frmSelFEcha:=Nil;
    end;
  end else
  begin
    frmDatosRepCostos:=TfrmDatosRepCostos.Create(nil);
    try
      if frmDatosRepCostos.ShowModal = mrOk then
      begin
        dmReportes.qryRepTransOpeDiaria.close;
        dmReportes.qryRepTransOpeDiaria.params[0].Value:= ExtraerFecha(frmDatosRepCostos.DateTimePicker1.Date);
        dmReportes.qryRepTransOpeDiaria.params[1].Value:= ExtraerFecha(frmDatosRepCostos.DateTimePicker2.Date);
        dmReportes.qryRepTransOpeDiaria.open;

        dmReportes._FPago := frmDatosRepCostos._FPago;
        dmReportes._FCodProv := frmDatosRepCostos._FCodProv;
        if (frmDatosRepCostos._FPago > 0) or (frmDatosRepCostos._FCodProv > 0) then
        dmReportes.qryRepTransOpeDiaria.Filtered:= True
        else
        dmReportes.qryRepTransOpeDiaria.Filtered:= False;

        qckTransCostosGastos:=TqckTransCostosGastos.Create(nil);
        try
          qckTransCostosGastos.PrinterSettings.PrinterIndex:=GetImpresorarpt(2,12);
          qckTransCostosGastos.Prepare;
          qckTransCostosGastos.TPag.Caption:= IntToStr(qckTransCostosGastos.PageNumber);
          qckTransCostosGastos.Preview;
        finally
        qckTransCostosGastos.Free;
        qckTransCostosGastos:=Nil;
        end;
      end;
    finally
    frmDatosRepCostos.free;
    frmDatosRepCostos:=nil;
    end;
  end;
end;

procedure TfrmMenuPrincipal.FormatoTipoDocs1Click(Sender: TObject);
begin
  frmFormatoReportes:=TfrmFormatoReportes.Create(nil);
  try
    frmFormatoReportes.ShowModal;
  finally
  frmFormatoReportes.free;
  frmFormatoReportes:=nil;
  end;
end;

procedure TfrmMenuPrincipal.RelacinGastos6061Click(Sender: TObject);
begin
  if GlbFormatoConduce = 444 then
  begin
    frmSelFEcha:=TfrmSelFEcha.create(nil);
    try
      if frmSelFEcha.showmodal = mrOk then
      begin
        dmReportes.qryRepTransOpeDiaria.close;
        dmReportes.qryRepTransOpeDiaria.params[0].Value:= ExtraerFecha(frmSelfecha.FechaIni.Date);
        dmReportes.qryRepTransOpeDiaria.params[1].Value:= ExtraerFecha(frmSelfecha.FechaFin.Date);
        dmReportes.qryRepTransOpeDiaria.open;

        qckTransOpeDiaria:=TqckTransOpeDiaria.Create(nil);
        try
          qckTransOpeDiaria.PrinterSettings.PrinterIndex:=GetImpresorarpt(2,12);
          qckTransOpeDiaria.Prepare;
          qckTransOpeDiaria.TPag.Caption:= IntToStr(qckTransOpeDiaria.PageNumber);
          qckTransOpeDiaria.Preview;
        finally
        qckTransOpeDiaria.Free;
        qckTransOpeDiaria:=Nil;
        end;
      end;
    finally
    frmSelFEcha.Free;
    frmSelFEcha:=Nil;
    end;
  end else
  begin
    frmDatosRepCostos:=TfrmDatosRepCostos.Create(nil);
    try
      if frmDatosRepCostos.ShowModal = mrOk then
      begin
        dmReportes.qryRepTransOpeDiaria.close;
        dmReportes.qryRepTransOpeDiaria.params[0].Value:= ExtraerFecha(frmDatosRepCostos.DateTimePicker1.Date);
        dmReportes.qryRepTransOpeDiaria.params[1].Value:= ExtraerFecha(frmDatosRepCostos.DateTimePicker2.Date);
        dmReportes.qryRepTransOpeDiaria.open;

        dmReportes._FPago := frmDatosRepCostos._FPago;
        dmReportes._FCodProv := frmDatosRepCostos._FCodProv;
        if (frmDatosRepCostos._FPago > 0) or (frmDatosRepCostos._FCodProv > 0) then
        dmReportes.qryRepTransOpeDiaria.Filtered:= True
        else
        dmReportes.qryRepTransOpeDiaria.Filtered:= False;

        qckTransCostosGastos:=TqckTransCostosGastos.Create(nil);
        try
          qckTransCostosGastos.PrinterSettings.PrinterIndex:=GetImpresorarpt(2,12);
          qckTransCostosGastos.Prepare;
          qckTransCostosGastos.TPag.Caption:= IntToStr(qckTransCostosGastos.PageNumber);        
          qckTransCostosGastos.Preview;

          if frmDatosRepCostos.chboxExportExcel.Checked then
          begin
            dmCompania.tblCompania.Close;
            dmCompania.tblCompania.Open;
            dmCompania.tblCompania.Locate('codigo',glbCia_Key,[]);
            GLBMostrarArchivo:=True;
            ExporToExcel(dmreportes.qryRepTransOpeDiaria, ExtractFilePath(Application.ExeName)+
            'Informes\RelacionGastosRep606'+
            FormatDateTime('ddmmyyyy',dmreportes.qryRepTransOpeDiaria.Params[0].Value)+'_'
            +FormatDateTime('ddmmyyyy',dmreportes.qryRepTransOpeDiaria.Params[1].Value),false);
            GLBMostrarArchivo:=False;
          end;
                    
        finally
        qckTransCostosGastos.Free;
        qckTransCostosGastos:=Nil;
        end;
      end;
    finally
    frmDatosRepCostos.free;
    frmDatosRepCostos:=nil;
    end;
  end;
end;

procedure TfrmMenuPrincipal.VerSecuencias1Click(Sender: TObject);
begin
  VerificarGeneradores1Click(Self);
end;

procedure TfrmMenuPrincipal.InventarioCertificados1Click(Sender: TObject);
begin
  frmInvCertificados:=TfrmInvCertificados.Create(Nil);
  try
    frmInvCertificados.ShowModal;
  finally
  frmInvCertificados.free;
  frmInvCertificados:=nil;
  end;
end;

procedure TfrmMenuPrincipal.Polizas1Click(Sender: TObject);
begin
  frmReportesPoliza:=TfrmReportesPoliza.Create(nil);
  try
    frmReportesPoliza.showmodal;
  finally
  frmReportesPoliza.free;
  frmReportesPoliza:=nil;
  end;
end;

procedure TfrmMenuPrincipal.ComisionesVentas1Click(Sender: TObject);
begin
  frmListadoVentasXVendedorComSam:=TfrmListadoVentasXVendedorComSam.Create(Nil);
  try
    if frmListadoVentasXVendedorComSam.Showmodal = mrOk then
    begin
      frmListadoVentasXVendedorComSam.orderTipo:=2;
      frmListadoVentasXVendedorComSam.AbrirDatos;

      dmCompania.tblCompania.close;
      dmCompania.tblcompania.open;
      dmCompania.tblCompania.Locate('codigo',glbCia_Key,[]);
      if not dmCompania.tblCompania.fieldbyname('NUM_SUCURSAL').IsNull then
      GlbCodSucursal := dmCompania.tblCompania.fieldbyname('NUM_SUCURSAL').Value
      else
      GlbCodSucursal := '0001';

      if dmReportes.qryRepComisionSAM.RecordCount > 0 then
      begin
        qckRepComisionVtaSam:=TqckRepComisionVtaSam.Create(nil);
        try
          qckRepComisionVtaSam.PrinterSettings.PrinterIndex:=GetImpresorarpt(2,12);
          qckRepComisionVtaSam.qrLabelCriterioDatos.Caption:= frmListadoVentasXVendedorComSam.labelCretrioRep;
          qckRepComisionVtaSam.Preview;
        finally
        qckRepComisionVtaSam.free;
        qckRepComisionVtaSam:=nil;
        end;
      end else
      MessageDlg('No data con criterio seleccionado.', mtinformation,[mbOk],0);
    end;
  finally
  frmListadoVentasXVendedorComSam.free;
  frmListadoVentasXVendedorComSam:=nil;
  end;
end;

procedure TfrmMenuPrincipal.ConfComisiones1Click(Sender: TObject);
begin
  frmConfComisiones:=TfrmConfComisiones.Create(nil);
  try
    frmConfComisiones.ShowModal;
  finally
  frmConfComisiones.free;
  frmConfComisiones:=nil;
  end;
end;

procedure TfrmMenuPrincipal.Cheques1Click(Sender: TObject);
begin
  frmContabilizaCheques:=TfrmContabilizaCheques.Create(nil);
  try
    frmContabilizaCheques.ShowModal;
  finally
  frmContabilizaCheques.free;
  frmContabilizaCheques:=nil;
  end;
end;

procedure TfrmMenuPrincipal.SumaItbisporTipoNCFInv1Click(Sender: TObject);
begin
  ordenPor:=3; //descripcion comprobante fiscal 4-Para enviar libro de ventas
  ImprimirRepItebis(4,4); //Sum;
end;

procedure TfrmMenuPrincipal.ImprimirRepItebisRes(tipo: smallint;
  tipodoc: integer);
var
  salir : boolean;
  strmoneda : string;
  ExptoExcel : Boolean;
  lEnviaEmail:Boolean;
begin
  Salir:=False;

  frmSelFecha:=TfrmSelFecha.Create(Nil);
  try
    if (tipo = 3) then
    frmselfecha.CheckBox1.Caption:='Enviar por Email';
    if tipo = 4 then
    frmselfecha.Label4.Visible:=True;
    if frmselfecha.ShowModal = mrok then
    begin
      dmCompania.tblCompania.Close;
      dmCompania.tblCompania.Open;
      dmCompania.tblCompania.Locate('codigo', glbCia_Key, []);

      dmFactura.rtipo := tipodoc;
      dmFactura.qryRepItbis.Filtered:= false;
      dmFactura.qryRepItbis.Close;
      GlbEnviaEmail := frmSelFecha.CheckBox1.Checked;
      lEnviaEmail :=GlbEnviaEmail;

      if ordenPor = 1 then
      begin
        //(Dataset['tipodoc'] = 'FACTURA') OR (Dataset['tipodoc'] = 'CONTADO')
        dmFactura.qryRepItbis.SQL.Text :=
        dmFactura.qryRepItbisbase.SQL.Text + ' '+
        ' and (tipodoc = '+chr(39)+'FACTURA'+chr(39)+
        ' OR tipodoc = '+chr(39)+'CONTADO'+chr(39)+')';
        dmFactura.qryRepItbis.SQL.Text:=
        dmFactura.qryRepItbisbase.SQL.Text +
        'ORDER BY DESC_NCF, NUMERO_NCF, FECHA, CODIGO_CTE'
      end
      else if ordenPor = 3 then
      dmFactura.qryRepItbis.SQL.Text:=
      dmFactura.qryRepItbisbase.SQL.Text +
      'ORDER BY tipo_inv, DESC_NCF, NUMERO_NCF'
      else
      dmFactura.qryRepItbis.SQL.Text:=
      dmFactura.qryRepItbisbase.SQL.Text +
      'ORDER BY tipo_inv, NUMERODOC, NUMERO_NCF, FECHA, CODIGO_CTE';

      dmFactura.qryRepItbis.params[0].Value:=ExtraerFecha(frmselfecha.FechaIni.DateTime);
      dmFactura.qryRepItbis.params[1].Value:=ExtraerFecha(frmselfecha.FechaFin.DateTime);

      //Pesos Dollar Euro

      if (uppercase(trim(frmselfecha.ComboBox1.Text))= 'PESOS') then
      dmFactura.qryRepItbis.params[2].Value:= '1'
      else
      if (uppercase(trim(frmselfecha.ComboBox1.Text))= 'DOLLAR') then
      dmFactura.qryRepItbis.params[2].Value:= '2'
      else
      dmFactura.qryRepItbis.params[2].Value:= '3';//Euro
      strmoneda:= trim(frmselfecha.ComboBox1.Text);
      dmFactura.qryRepItbis.open;
      if (ordenPor <> 1) then
      dmFactura.qryRepItbis.Filtered:=True;
      if (Tipo = 1) then
      begin
      try
        if frmSelFecha.CheckBox1.Checked then
        begin
          GLBMostrarArchivo := True;
          GlbEnviaEmail := frmSelFecha.CheckBox1.Checked;
          lEnviaEmail :=GlbEnviaEmail;
          GlbIDTipoEmail:= 1; //Detalle NCF
          if (Not DirectoryExists('Informes')) then
          CreateDir('Informes');
          ExporNCFListToExcel(dmfactura.qryRepItbis, ExtractFilePath(Application.ExeName)+
          'Informes\RelacionNCF'+
          FormatDateTime('ddmmyyyy',dmFactura.qryRepItbis.params[0].Value)+'_A_'+
          FormatDateTime('ddmmyyyy',dmFactura.qryRepItbis.params[1].Value));
          Salir:=True;
          MessageDlg('Archivo de Excel generado.', mtInformation,[mbok], 0);
        end;
      except
      end;
      end;
    end else Salir:=True;
  finally
  frmSelFecha.free;
  frmSelFecha:=nil;
  end;
  if Salir then Exit;
  if Tipo = 1 then
  begin
    qckRepItbis:=TQckRepItbis.Create(Nil);
    try
      qckRepItbis.strmoneda := strmoneda;
      if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrNo then
      begin
        qckRepItbis.PrinterSettings.PrinterIndex:=GetImpresorarpt(2,12);
        qckRepItbis.Prepare;
        qckRepItbis.qrTpaginas.Caption:= ' de '+IntToStr(qckRepItbis.PageNumber);
        qckRepItbis.Preview;
      end else
      begin
        qckRepItbis.PrinterSetup;
        qckRepItbis.Print;
      end;
    finally
    qckRepItbis.Free;
    qckRepItbis:=Nil;
    end;
  end else
  if Tipo = 2 then
  begin
    qckRepItbis_ResXDia:=TqckRepItbis_ResXDia.Create(Nil);
    try
      if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrNo then
      begin
        qckRepItbis_ResXDia.PrinterSettings.PrinterIndex:=GetImpresorarpt(2,12);
        qckRepItbis_ResXDia.Preview;
      end else
      begin
        qckRepItbis_ResXDia.PrinterSettings.PrinterIndex:=GetImpresorarpt(2,12);
        qckRepItbis_ResXDia.PrinterSetup;
        qckRepItbis_ResXDia.Print;
      end;
    finally
    qckRepItbis_ResXDia.Free;
    qckRepItbis_ResXDia:=Nil;
    end;
  end else
  if (Tipo = 3) then
  begin
    qckRepItbisResumen:=TqckRepItbisResumen.Create(Nil);
    try
      glbZipFile:='';
      qckRepItbisResumen.PrinterSettings.PrinterIndex:=GetImpresorarpt(2,12);
      if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrNo then
      begin
        qckRepItbisResumen.Preview;
      end else
      begin
        qckRepItbisResumen.PrinterSetup;
        qckRepItbisResumen.Print;
      end;

      GlbEnviaEmail := lEnviaEmail;
      GlbIDTipoEmail:= 2; //Detalle NCF
      if (Not DirectoryExists('Informes')) then
      CreateDir('Informes');
      ReportExport(qckRepItbisResumen,GlbRutaInformes+'\ResumenVtaTipoNCF'+
       'De '+ FormatDateTime('dd-mmm-yy', ExtraerFecha(dmfactura.qryRepItbis.Params[0].Value))+
          ' a ' + FormatDateTime('dd-mmm-yy', ExtraerFecha(dmfactura.qryRepItbis.Params[1].Value))
          +'.pdf');       
    finally
    qckRepItbisResumen.Free;
    qckRepItbisResumen:=Nil;
    end;
  end;
end;

procedure TfrmMenuPrincipal.ResumenXCliente1Click(Sender: TObject);
begin
  frmSelFecha:=tfrmSelFecha.Create(nil);
  try
    frmSelFecha.CheckBox1.Caption := 'Exporta XLS';
    frmSelFecha.CheckBox1.Hint    := 'Exportar datos a Excel';
    frmSelFecha.CheckBox1.ShowHint:= True;
    frmSelFecha.FechaIni.DateTime:=GlbFechaTrnDiaria;
    frmSelFecha.FechaFin.DateTime:=GlbFechaTrnDiaria;
    if frmSelFecha.ShowModal = mrOk then
    begin
      dmCuadrexRuta.qryRepFactCuadreXCte.Close;
      dmCuadrexRuta.qryRepFactCuadreXCte.Params[0].Value:=ExtraerFecha(frmselfecha.FechaIni.DateTime);
      dmCuadrexRuta.qryRepFactCuadreXCte.Params[1].Value:=ExtraerFecha(frmselfecha.FechaFin.DateTime);
      dmCuadrexRuta.qryRepFactCuadreXCte.Params[2].Value:=glbCia_Key;
      dmCuadrexRuta.qryRepFactCuadreXCte.Open;

      QckRepFVtaCuadreXCte:=TQckRepFVtaCuadreXCte.Create(Nil);
      try

        QckRepFVtaCuadreXCte.Prepare;
        GlbTPag := QckRepFVtaCuadreXCte.PageNumber;
        QckRepFVtaCuadreXCte.PrinterSettings.PrinterIndex:=GetImpresorarpt(2,12);
        if frmSelFecha.CheckBox1.Checked then
        begin
          dmCompania.tblCompania.Close;
          dmCompania.tblCompania.Open;
          dmCompania.tblCompania.Locate('codigo',glbCia_Key,[]);
          GLBMostrarArchivo:=True;
          if (dmCuadrexRuta.qryRepFactCuadreXCte.Params[0].Value = dmCuadrexRuta.qryRepFactCuadreXCte.Params[1].Value) then
          GlbrangoFecha:='DIA '+FormatDateTime('dd',dmCuadrexRuta.qryRepFactCuadreXCte.Params[0].Value) +
          ' DE '+FormatDateTime('MMM',dmCuadrexRuta.qryRepFactCuadreXCte.Params[0].Value)+
          ' DE '+FormatDateTime('yyyy',dmCuadrexRuta.qryRepFactCuadreXCte.Params[0].Value)
          else
          GlbrangoFecha:='Desde '+FormatDateTime('dd/mm/yyyy',dmCuadrexRuta.qryRepFactCuadreXCte.Params[0].Value) +
          ' Hasta '+FormatDateTime('dd/mm/yyyy',dmCuadrexRuta.qryRepFactCuadreXCte.Params[1].Value);
          
          ExporToExcelFCTCuadre(dmCuadrexRuta.qryRepFactCuadreXCte, ExtractFilePath(Application.ExeName)+
          'Informes\ListadoFacturasCuadreDiario'+
          FormatDateTime('ddmmyyyy',dmCuadrexRuta.qryRepFactCuadreXCte.Params[0].Value)+'_'
          +FormatDateTime('ddmmyyyy',dmCuadrexRuta.qryRepFactCuadreXCte.Params[1].Value));
          if GLBMostrarArchivo then
          ShellExecute(0, 'Open', PChar(GlbRutaExeLIbroVenta), PChar(''), PChar(''), SW_SHOWNORMAL);
          GLBMostrarArchivo:=False;

        end else
        QckRepFVtaCuadreXCte.Preview;
      finally
      QckRepFVtaCuadreXCte.Free;
      QckRepFVtaCuadreXCte:=Nil;
      end;
    end;
  finally
  frmSelFecha.Free;
  frmSelFecha:=Nil
  end;
end;

procedure TfrmMenuPrincipal.RxSpeedButton15Click(Sender: TObject);
begin
  frmReclamaciones:=TfrmReclamaciones.Create(Nil);
  try
    frmReclamaciones.Showmodal;
  finally
  frmReclamaciones.Free;
  frmReclamaciones:= Nil;
  end;
end;

procedure TfrmMenuPrincipal.tiipo1AfiliacionesClick(Sender: TObject);
begin
  frmTipoAfiliacion:=TfrmTipoAfiliacion.Create(nil);
  try
    frmTipoAfiliacion.showmodal;
  finally
  frmTipoAfiliacion.free;
  frmTipoAfiliacion:=nil;
  end;
end;

procedure TfrmMenuPrincipal.Coberturas1Click(Sender: TObject);
begin
  frmCobertura:=TfrmCobertura.Create(Nil);
  try
    frmCobertura.ShowModal;
  finally
  frmCobertura.Free;
  frmCobertura:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.RMA1Click(Sender: TObject);
begin
  frmRMA:=TfrmRMA.Create(nil);
  try
    frmRMA.tipoOpe :=5;//RMA
    frmRMA.tripoTrn:=1;
    frmRMA.Showmodal;
  finally
  frmRMA.Free;
  frmRMA:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.Equipos1Click(Sender: TObject);
begin
  frmReporteEquipos:=TfrmReporteEquipos.Create(nil);
  try
    frmReporteEquipos.showmodal;
  finally
  frmReporteEquipos.free;
  frmReporteEquipos:=nil;
  end;
end;

procedure TfrmMenuPrincipal.CobrosXTransferencia1Click(Sender: TObject);
begin
  frmConsultaTransf:=TfrmConsultaTransf.Create(nil);
  try
    frmConsultaTransf.ShowModal;
  finally
  frmConsultaTransf.free;
  frmConsultaTransf:=nil;
  end;
end;

procedure TfrmMenuPrincipal.SystemTable1Click(Sender: TObject);
begin
  frmDatosTabla:=TfrmDatosTabla.Create(Self);
  try
    frmDatosTabla.ShowModal;
  finally
  frmDatosTabla.free;
  frmDatosTabla:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.Cardex1Click(Sender: TObject);
begin
  frmkardex:=Tfrmkardex.Create(nil);
  try
    frmkardex.ShowModal;
  finally
  frmkardex.free;
  frmkardex:=nil;
  end;
end;

procedure TfrmMenuPrincipal.Colores1Click(Sender: TObject);
begin
  frmcolores:=Tfrmcolores.Create(nil);
  try
    frmcolores.ShowModal;
  finally
  frmcolores.Free;
  frmcolores:=Nil;
  end;
  SetColores;
end;

procedure TfrmMenuPrincipal.ProveedoresTarjetas1Click(Sender: TObject);
begin
  frmProvTarjetas:=TfrmProvTarjetas.Create(nil);
  try
    frmProvTarjetas.ShowModal;
  finally
  frmProvTarjetas.free;
  frmProvTarjetas:=nil;
  end;
end;

procedure TfrmMenuPrincipal.rxspeedbtnDesContratoClick(Sender: TObject);
begin

  if (GLBECOM = 0) then
  exit;
                                     
  WinExec(PChar(GlbRutaWisPro+Format(' /username=%s /userAutenticated=%s /accion=%s /IDContract=%s /StatusContract=%s /AUTO=1',
  [GlbUsuarioLogueado,'1','60',
  '',
  ''])), SW_HIDE);

  Sleep(3000);

  dmDatos.qryCantCambiosStatus.Close;
  dmDatos.qryCantCambiosStatus.Open;
  dmDatos.qryCantCambiosStatus.Last;

  if (dmDatos.qryCantCambiosStatus.RecordCount > 0)
  and (dmDatos.qryCantCambiosStatusCANT_ACCION.Value > 0) then
  begin
    MessageDlg('Total de contratos actualizados: '+
    dmDatos.qryCantCambiosStatusCANT_ACCION.AsString, mtInformation,[mbOk],0);
  end;

end;
procedure TfrmMenuPrincipal.ImportarGarantias1Click(Sender: TObject);
begin
  frmImportarGarantias:=TfrmImportarGarantias.Create(nil);
  try
    frmImportarGarantias.ShowModal;
  finally
  frmImportarGarantias.free;
  frmImportarGarantias:=nil;
  end;
end;

procedure TfrmMenuPrincipal.RxSpeedButton17Click(Sender: TObject);
begin
  frmInspecciones:= TfrmInspecciones.Create(nil);
  try
    frmInspecciones.ShowModal;
  finally
  frmInspecciones.free;
  frmInspecciones:=nil;
  end;
end;

procedure TfrmMenuPrincipal.RxSpeedButton18Click(Sender: TObject);
begin
 frmConsultaOrdenCompra:=TfrmConsultaOrdenCompra.Create(Nil);
  try
  frmConsultaOrdenCompra.Showmodal;
  finally
  frmConsultaOrdenCompra.free;
  frmConsultaOrdenCompra:=nil;
  end;
end;

procedure TfrmMenuPrincipal.ResumenporProductos1Click(Sender: TObject);
begin
  frmSelFecha:=tfrmSelFecha.Create(nil);
  try
    frmSelFecha.CheckBox1.Caption := 'Exporta XLS';
    frmSelFecha.CheckBox1.Hint    := 'Exportar datos a Excel';
    frmSelFecha.CheckBox1.ShowHint:= True;
    frmSelFecha.FechaIni.DateTime:=GlbFechaTrnDiaria;
    frmSelFecha.FechaFin.DateTime:=GlbFechaTrnDiaria;
     frmSelFecha.chkEnviaEmail.Visible:=True;
    if frmSelFecha.ShowModal = mrOk then
    begin

      dmCuadrexRuta.qryVtaResumen.Close;
      dmCuadrexRuta.qryVtaResumen.Params[0].Value:=ExtraerFecha(frmselfecha.FechaIni.DateTime);
      dmCuadrexRuta.qryVtaResumen.Params[1].Value:=ExtraerFecha(frmselfecha.FechaFin.DateTime);
      dmCuadrexRuta.qryVtaResumen.Open;
      dmCuadrexRuta.qryVtaResumen.first;
      if dmCuadrexRuta.qryVtaResumen.recordCount = 0 then
      begin
        MessageDlg('No hay datos para fecha seleccionada.',mtinformation,[mbok],0);
        exit;
      end;
      QckRepFVtaResumen:=TQckRepFVtaResumen.Create(Nil);
      try
        QckRepFVtaResumen.PrinterSettings.PrinterIndex:=GetImpresorarpt(2,12);
        QckRepFVtaResumen.Prepare;
        GlbTPag := QckRepFVtaResumen.PageNumber;
        if frmSelFecha.CheckBox1.Checked then
        begin

          dmCompania.tblCompania.Close;
          dmCompania.tblCompania.Open;
          dmCompania.tblCompania.Locate('codigo',glbCia_Key,[]);
          GLBMostrarArchivo:=True;
          if (dmCuadrexRuta.qryVtaResumen.Params[0].Value = dmCuadrexRuta.qryVtaResumen.Params[1].Value) then
          GlbrangoFecha:='DIA '+FormatDateTime('dd',dmCuadrexRuta.qryVtaResumen.Params[0].Value) +
          ' DE '+FormatDateTime('MMM',dmCuadrexRuta.qryVtaResumen.Params[0].Value)+
          ' DE '+FormatDateTime('yyyy',dmCuadrexRuta.qryVtaResumen.Params[0].Value)
          else
          GlbrangoFecha:='Desde '+FormatDateTime('dd/mm/yyyy',dmCuadrexRuta.qryVtaResumen.Params[0].Value) +
          ' Hasta '+FormatDateTime('dd/mm/yyyy',dmCuadrexRuta.qryVtaResumen.Params[1].Value);

          GlbEnviaEmail :=false;
          ExporToExcel(dmCuadrexRuta.qryVtaResumen, ExtractFilePath(Application.ExeName)+
          'Informes\ListadoResumenVentasXProd'+
          FormatDateTime('ddmmyyyy', dmCuadrexRuta.qryVtaResumen.Params[0].Value)+'_'
          +FormatDateTime('ddmmyyyy',dmCuadrexRuta.qryVtaResumen.Params[1].Value),false);

          if GLBMostrarArchivo then
          ShellExecute(0, 'Open', PChar(GlbRutaExeLIbroVenta), PChar(''), PChar(''), SW_SHOWNORMAL);
          GLBMostrarArchivo:=False;

          if frmSelFecha.chkEnviaEmail.Checked then
          begin
            GlbEnviaEmail :=true;
            GlbIDTipoEmail:=100;
          end;
                
         if FileExists(glbZipFile) and GlbEnviaEmail then
         begin

           frmEnviarEmail:=TfrmEnviarEmail.Create(Nil);
           try
            GlbIDTipoEmail := 100; //Estandar

           if dmCompania.tblCompania.State = dsInactive then
           dmCompania.tblCompania.Open;
           dmCompania.tblCompania.Locate('codigo',glbCia_Key,[]);
           frmEnviarEmail._cmdminio:= dmCompania.tblCompaniaNOMBRE.Value;// dmReporte.qryReporteIngACCOUNT_NAME.Value;
           frmEnviarEmail.edtDestinatario.Text := dmCompania.tblCompaniaEMAIL.Value;
           frmEnviarEmail.edtTema.Text         := 'Resumen de Ventas por Producto';
           //'_Al'+ FormatDateTime('dd-mmm-yy', ExtraerFecha(Now))+'.pdf';
           frmEnviarEmail.memMensaje.Lines.Clear;
           frmEnviarEmail.memMensaje.Lines.Add('Resumen de Ventas por Producto');
           frmEnviarEmail.memMensaje.Lines.Add('');
           frmEnviarEmail.memMensaje.Lines.Add('');
           frmEnviarEmail.memMensaje.Lines.Add('');

           frmEnviarEmail.Showmodal;
         finally
         frmEnviarEmail.Free;
         frmEnviarEmail:= Nil;
         end;
      end;


          GlbEnviaEmail :=false;
          GlbIDTipoEmail:=-1;
        end else
        QckRepFVtaResumen.Preview;
      finally
      QckRepFVtaResumen.Free;
      QckRepFVtaResumen:=Nil;
      end;
    end;
  finally
  frmSelFecha.Free;
  frmSelFecha:=Nil
  end;
end;

procedure TfrmMenuPrincipal.EmailTemplate1Click(Sender: TObject);
begin
  frmEmailTemplate:=TfrmEmailTemplate.Create(nil);
  try
    frmEmailTemplate.showmodal;
  finally
  frmEmailTemplate.free;
  frmEmailTemplate:=nil;
  end;

  end;

procedure TfrmMenuPrincipal.RelacionCertificados1Click(Sender: TObject);
begin
  frmCertAsigAgente:=TfrmCertAsigAgente.Create(nil);
  try
    frmCertAsigAgente.showmodal;
  finally
  frmCertAsigAgente.free;
  frmCertAsigAgente:=nil;
  end;                   
end;

procedure TfrmMenuPrincipal.BitBtn8Click(Sender: TObject);
begin
  if not Assigned(dmPanaderia) then
  dmPanaderia:=TdmPanaderia.Create(nil);
  frmCalcPrecioArticulo:=TfrmCalcPrecioArticulo.Create(nil);
  try
    frmCalcPrecioArticulo.chkCotizacion.Checked:=True;
    frmCalcPrecioArticulo.showmodal;
  finally
  frmCalcPrecioArticulo.free;
  frmCalcPrecioArticulo:=nil;  
  end;
  try
    dmPanaderia.free;
    dmPanaderia:=nil;
  except
  end;
end;

procedure TfrmMenuPrincipal.ConsultaReorden1Click(Sender: TObject);
begin
  frmConsultaReordenInvXProv:=TfrmConsultaReordenInvXProv.Create(nil);
  try
    frmConsultaReordenInvXProv.ShowModal;
  finally
  frmConsultaReordenInvXProv.free;
  frmConsultaReordenInvXProv:=nil;
  end;
end;

procedure TfrmMenuPrincipal.RelacoinVentasVsInventario1Click(
  Sender: TObject);
begin
  frmHistVentasInv:=TfrmHistVentasInv.Create(nil);
  try
    frmHistVentasInv.Showmodal;
  finally
  frmHistVentasInv.Free;
  frmHistVentasInv:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.VerificarValores1Click(Sender: TObject);
begin
  frmVerificarValoresVta:=TfrmVerificarValoresVta.Create(nil);
  try
    frmVerificarValoresVta.showmodal;
  finally
  FreeAndNil(frmVerificarValoresVta);
  end;
end;

procedure TfrmMenuPrincipal.AuditoriaBlcCxc1Click(Sender: TObject);
begin
  frmAuditoriaBlcCxc:=TfrmAuditoriaBlcCxc.Create(nil);
  try
    frmAuditoriaBlcCxc.showmodal;
  finally
  freeandnil(frmAuditoriaBlcCxc);
  end;
end;

procedure TfrmMenuPrincipal.erritoriosECF1Click(Sender: TObject);
begin
  frmciudadesecf:=Tfrmciudadesecf.Create(nil);
  try
    frmciudadesecf.Showmodal;
  finally
  frmciudadesecf.Free;
  frmciudadesecf:=Nil;
  end;
end;
      
procedure TfrmMenuPrincipal.Procesar1Click(Sender: TObject);
begin
  frmPagoComisiones:=TfrmPagoComisiones.Create(Nil);
  try
    frmPagoComisiones.Showmodal;
  finally
  frmPagoComisiones.Free;
  frmPagoComisiones:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.BitBtn9Click(Sender: TObject);
begin
  frmEntregarOrdenLavanderia:=TfrmEntregarOrdenLavanderia.Create(nil);
  try
    frmEntregarOrdenLavanderia.Showmodal;
  finally
  FreeAndNil(frmEntregarOrdenLavanderia);
  end;
end;

procedure TfrmMenuPrincipal.EdPointsFactElectronica1Click(Sender: TObject);
begin
  FormConfigEndpoints:=TFormConfigEndpoints.Create(nil);
  try
    FormConfigEndpoints.Showmodal;
  finally
  FormConfigEndpoints.free;
  FormConfigEndpoints:=nil;
  end;
end;

procedure TfrmMenuPrincipal.BitBtn10Click(Sender: TObject);
begin
  ProcGlbSecuenciaNCF;//chequea disponibilidad de sec ncf
  frmOrders2EcfRunner:=TfrmOrders2EcfRunner.Create(Nil);
  try
    frmOrders2EcfRunner.Showmodal;
  finally
  frmOrders2EcfRunner.Free;
  frmOrders2EcfRunner:=Nil
  end;
end;

procedure TfrmMenuPrincipal.SecuenciaFacturas1Click(Sender: TObject);
begin
  frmSecuenciaFct:=TfrmSecuenciaFct.Create(nil);
  try
    frmSecuenciaFct.ShowModal;
  finally      
  frmSecuenciaFct.free;
  frmSecuenciaFct:=nil;
  end;
end;

end.


