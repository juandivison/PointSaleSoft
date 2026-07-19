unit UGlobal;

interface
 Uses Forms,Dbtables, db, Sysutils, windows, Dialogs, Controls,Printers,Classes,
    ShellApi, DateUtils, Messages, Graphics,IniFiles, Variants, IBCustomDataSet,
    StrUtils,IBQuery, IBSQL, ExtCtrls, QuickRpt, QRCtrls,Grids, Shlobj, Excel97,
    Math, VCLUnZip,WinInet,  VCLZip, StdCtrls, Registry, OleServer, ExcelXP, comObj, ComCtrls;
 const
    {C1 y C2 are used for encryption of Master Password string}
    {C1 y C2 aon usadas para encriptar la cadena de la clave}
        C1 = 52845;
        C2 = 11719;
     LF    = #10;
     TAB   = #9;
     CR    = #13;
     BLANK = #32;


     BreakingLine = '//----------------------------------------------------------------------------//';

    type  TDocumentos = (
      dcPendiente = 0,
      dcCedula,
      dcPasaporte,
      dcRNC,
      dcConducir,
      dcArmaFuego
    );

 var

    NombreMes : Array[1..12] of String;
    NombreDia : Array[1..7] of String;
    GlbNumVtaPOS : integer;
    GlbImpQREncuesta : Integer;
    GlbNumVtaPOSTmp : Integer;
    GLBMuestraInfoProv, GlbCantCorridas : Integer;
    GlbMuestraPDF : Boolean;
    GlbCerrandoSistema: Boolean;
    glbContImpCks:Boolean;
    GlbMuestraMensajeEmail : Boolean;
    GlbImpPDF : Boolean;
    GlbImpFormatoPDF : Smallint;
    glbQckUnaPagina : Smallint;
    GlbImpEnPDF: Smallint;
    GlbFactCxcATercero: Smallint;
    GlbSecIgualesCashCredito : Smallint;
    GlbMontoTarjetaCuadre : Smallint;
    GlbSkinPath : String;
    glbZipFile : String;
    strUserName : String;
    glbLogueado : smallint;
    GlbProcede, GlbIsAutenticado : Boolean;
    GlbEncabezadoIFiscal: string[40];
    vUserName   : String[12];
    GlbClaveSup : String;
    GlbClavePrecios : String;
    GlbIgI, GlbCalcItbis : smallint;
    GlbAvisoProdVence : smallint;
    GlbFormatoConduce : integer;
    NCFCTeNotSetup : Boolean;
    GlbFOrdDespAlmcenPOS : smallint;
    GlbDocStandar : smallint;
    GlbEsPrecuenta,glbStatusCksNormal : Boolean;
    GlbShowCtaBanco: smallint;
    GlbClaveSupEncrypted : String;
    strUsuarioID: String;
    GlbIncLargoPapel : smallint;
    //strAppPath  : String;
    DateCurr    : string;
    Size        : DWord;
    StatusGlb   : String = 'A';
    GlbLetrero  : String;
    GlbSimboloMoneda : String;
    GlbCodCiudad : Integer;
    GlbRutaLogoDoc: string;
    glbCia_Key : Integer;
    glbSubTipo, glbTipocks : Smallint;
    GLBCodigoCteFct : Integer;
    //glbFechaNom : TDateTime;
    GlbCantMesProy  : Real;
    GlbFechaPagoCks : TDatetime;
    GlbFechaInicial : TDatetime;
    GlbTipoComision : smallint = 2;
    glbFechaFinal   : TDatetime;
    GlbRepCuadrePos : integer;
    GlbFechaTrnDiaria: TDatetime;
    GlbIdesiPrint : string;
    GLBIDClienteIDESI : smallint;
    GlbExtraUpdate: Boolean = False;
    GlbAlreadyCld : Boolean = False;
    PideFecha  : Boolean = True;
    GlbEsRecibo: Boolean = True;
    GlbLogRecibos: Smallint = 1;
    GlbRutaWisPro : String;
    GlbEditar : Boolean;
    EsCuadre   :Boolean = False;
    GlbImpTicketVtaAgua : smallint = 0;
    EsDevolucion : Boolean = False;
    EsProcBlcCte     : Boolean;
    glbTPag :  Integer;
    GlbCampoFilterCte : String;
    GlbRutaFacturas,GlbRutaInformes,
    GlbRutaRecibos,GLBRutaImpGarantia,
    GlbRutaCotizaciones:String;
    GlbOrderBy  : String;
    glbValueFilterCte : String;
    GlbModeEdit : boolean;
    GlbInsertarEnLoan : Smallint;
    GlBExpert, GlBAyaco,GlBInveraf, Glbcolmado : smallint;
    GlBTapiceria:Smallint;
    GLBProsesur:Smallint;
    GLBMTEGroup :Smallint;
    GlBCuadros : smallint;
    GLBImpComAdic : smallint;
    GLBSAM : Smallint;
    GlbTipoTransMotores: smallint;
    GLBMutur: smallint;
    GLBECOM : smallint;
    GLBMotor : smallint;
    GLBRecCxcPOS : smallint;
    glbNumcks, glbnumfact:LongInt;
    GLBShowLineaVta : smallint;
    GlbToolWisPro : string;
    //GlbUsuarioPassword : string;
    GlbUsaFctMexico : smallint;
    GlbLogoServSam : string;
    GlbReposDocs : string;
    GlbFarmacia:smallint;
    // 0 = Cambiar E32 -> E31 en la misma venta
    // 1 = Crear nueva venta E31 + Nota de Crédito E34 que anula la E32
    GlbModoConsumoToCredito: Integer = 0;
    GLbDevoluciones : string;
    GlBLimao, GlBInMobi, GlBBurgos : smallint;
    GlbCalculado,GlbError: Boolean;
    glbMoneda       : Smallint;
    GlbMonedaBase   : Smallint;
    GlbNumero       : Integer;
    GlbNumeroTrn    : Integer;
    GlbRutaFactRecurr:String;
    GLBCOTI55EST    : String;
    GLBNumConduceCte:Integer;
    CodServicioGlb  : Integer;
    GlbCodigoCia    : Integer;
    GlbNombreCia    : String;
    GlbSolicitaNumLote : Integer;
    GLBUseCustomEmailServer : smallint;
    GlbNombreImpresora : string;
    GlbImprimeTicketCustom: Smallint;
    GlbUsaHuellas : smallint;
    GlbContError:Integer=0;
    GlbNombreCampo : String;
    GlbDiasSinVenta : Integer;
    GlbColorUno : string;
    GlbColorDos : string;
    GlbActivaFarmacia :Integer;
    GlbMargenPorcPrecioVta: Integer;
    GlbCampoInt : Integer;
    GlbEntradoAvta : Boolean;
    GlbAplicaOfertas : Smallint;
    GlbCampoStr : String;
    Glblineacodigo: String;
    GlbSalirFiltro: Boolean;
    varTipousuario,VarUsuarioGlb:Integer;
    FechaIniGlb : TDate;
    GlbTipoUnidad : Integer;
    GlbIncItbisPvta : Integer;
    GlbMSubTotalSinITBIS : smallint;
    glbTipoNom : Integer;
    glbDNomina : Real;
    GlbUsaSecNCF2018: smallint;
    glbImpTUnidadEnRcbo : Smallint;
    GlbFacturaArtioffice : Smallint;
    GlbcodVendedor : Integer;
    FechaFinGlb : TDate;
    HoraIniGlb  : TTime;
    HoraFinGlb  : TTime;
    GlbUsaPUnidadStd : Smallint;
    GlbUsaPUnidadLevel : Smallint;
    GLBPrecioMayUnidad : smallint;
    GLBAplicaITBISLevel:smallint;
    GlbBalanceAnt  : Real;
    GlbFechaNomina : TDate;
    GlbPrecioMayRegOrden: Integer;
    GlbCodOficina  : Integer;
    GlbMontoInteresMoraPgdo : Real;
    GlbFinanciamiento : Boolean = false;
    GlbModoHistorico : Boolean = false;
    GlbMuestraInteresFactFinac : Integer;
    GlbPermiteCambioPrecio : Boolean = false;
    GlbPermiteVtaServicioAdc : Smallint = 0;
    repIngTodo : Boolean = False;
    repIngEfe  : Boolean = False;
    repIngCxc  : Boolean = False;
    GlbDescNCF : String;
    GlbEsDebugEntradas : Integer;
    GlbSubject : string;
    VarNombreUsuario:String;
    GlbValorMaxVtaWarning : Currency;
    NombreMesCorto : Array[1..12] Of string = ('ENE','FEB','MAR','ABR','MAY','JUN',
                                               'JUL','AGO','SEP','OCT','NOV','DIC');

    GlbPuerto : Smallint;
    GlbBaudRate : Smallint;
    GlbSizeFact8x11,
    GlbSizeCotiza8x11,
    GlbActF10CodBarra,
    GlbImpCodProducto,
    GlbSolDCteVCash,
    GlbRec3Pulg,
    GlbRec55Pulg,
    GlbFact3Pulg,
    GlbFact55Pulg,
    GlbCot3Pulg,
    GlbCot55Pulg,
    GlbFirmaCajero,
    GlbTipoConduce,
    GlbNCFConfFinal : Integer;
    GlbPiedePaginaFactura: String;
    GlbSolicitaDVeh : Integer;
    //GlbNoGeneraNCF  : Boolean;
    GlbCodDivInventario : Integer;
    GlbAlmacen : STRING;
    GlbPermiteVentaInv0 : Integer;
    GlbPrecioCodificado : Smallint;
    GlbFechaVencProducto: Smallint;
    GlbInluirPrecioItbisenLabel : Smallint;
    GlbRutaConfZPL : String;
    GlbLabelZPL : Smallint;
    GlbCiaNamelabel:String;
    GlbPermiteUnaInstancia : Integer;
    glbNombreCta    : String;
    GlbUsuarioLogueado : String;
    glbCredito      : Real;
    GlbPrueba       : Boolean;
    glbDebito       : Real;
    glbBalanceIni   : Real = 0;
    GlbDif          : Real;
    GlbCorriendo    : Integer;
    GlbCorriendoII  : Smallint;
    GlbImpReciboSinPreg : Smallint;
    SISTEMA_CNT     : Smallint;
    GlbCantCopias : Smallint;
    SUBSISTEMA_CNT  : Smallint;
    GLBCODIGO_CIA   : Smallint;
    Actualizar:Boolean  = False;
    GLBImpBoucher : Smallint;
    EsReporte : Boolean = False;
    glbCheckNomina, glbBancos : Integer;
    GlbDescTipoCNT  : String;
    GlbVenderDesdeAlmacenP : Smallint;
    GlbIDAlmacenProd : Smallint;
    GLBMODULO_CNT : Integer;
    TIPO_DOCUMENTO_CNT : Smallint = 0;
    GlbDiaActualizado  : Smallint;
    GlbFacturaLicoreria  : Integer;
    GlbTransparentaITBI  : Integer;
    GlbSHOWPRICEWITHITBIS:smallint;
    GlbUsaescalaPrecio   : Integer;
    GlbUsandoCotiza : boolean;
    GlbImprimeReciboFact : Integer;
    GlbActivaPanificadora: Integer;
    GlbActivaLavanderia: Integer;
    GlbActivaNomina:smallint;
    GlbActivaCafeteria   : Integer;
    GlbActivaProduccion : Integer;
    GlbRegistrado : Boolean;
    GLBPORC_ATRASOCXC : Real;
    GLBRUTADBINI : String;
    GLBRUTABDGIITXT : String;
    GlbUsaBalanza : integer;
    GLBRUTADBDGII : String;
    GLBRUTADBLOAN : String;
    GlbAccessDBConn : String;
    GlbDBIIDBConn: string;
    GLBRUTADB,GLBRUTADB2 : String;
    GlbRutaDBActual,GlbRutaDBActual2 : String;
    GlbColegio : Integer;
    GLBIDAnioEscolar : Integer;
    GlbDiaFactMensualidad : TDateTime;
    Ancho : Integer = 1366;//1280; // Ancho del diseño
    Alto : Integer =  768;//720;  // Alto del diseño
    GlbScaledform : Boolean;
    GlbScreenWith, GlbScreenHeight : Integer;
    GlbRootImg : String;
    GLBFormatoFactura : String;
    //GlbUsandoCotiza : Boolean;
    GlbPorcPropina : Real;
    GlbrangoFecha : String;
    GlbFactRecurrente, GLBEsFastFood, GlbPagaITbis : Boolean;
    GlbRutaEcf,GlbRuta2Ecf, GlbRutaQREcf : string;
    GLBEsFastFoodString : string[1];
    GLBFORMATOFACTPREIMP : Smallint;
    GlbPuertoDisponible : Boolean;
    GlbPuetoCerrado, GLBIFiscalBusy, GLBIFiscalOpeAbierta,
    GLBIFiscalOnline : Boolean;
    GlbRutaExeLIbroVenta : String;
    GlbRutaLibroVentas : String;
    GlbEsCopia : Boolean;
    GlbIFiscalError : String;
    GlbBaseUrlRNC, GlbBaseUrlRNCEndPoint:String;
    GlbActivaIFiscal, GlbComerEs1ro: Integer;
    GlbUsarFacturaTxtECF, GlbActivaECF, GlbValidarECF:Integer;//Factura Electronica
    GlbSecECFGenerada:boolean;
    GlbCajaeCF:String;
    GlbCodSucursal: String;
    GlbImpresoraFOnline: Boolean;
    GlbImprimiendo: Boolean;
    GLBEsImp : boolean;
    GlbUsrAutenticado : Boolean;
    GlbPorcItbis: Real;
    GlbModeloImpresora : String;
    GlbNombreFiletoPrint : String;
    GlbNombreArchivo: String;
    GlbServerConfigID: String;
    GlbTIPOAFILIADO: string;
    GlbNombreArchivoRev:String;
    GlbCartaPresenta:String;
    GlbExeIFiscal : String;//Tiene el nombre del executable en VB = IdesiEpsonFiscaltool.exe
    GlbStatusFiscalError : String;
    GlbEsDebugFiscal : smallint;
    GlbTFiscalNCR : String;
    GlbSimboloTasaITBIS : String;
    GlbIDTasa : Integer;
    GLBMostrarArchivo : Boolean = false;
    GlbEnviaEmail : Boolean;
    GlbEnviaEmailDirecto : Boolean;
    GlbIDTipoEmail : integer;
    GlbEmailTool : String;
    GlbEmailToolGSAM : String;
    Hoja: _WorkSheet;
    Excel: TExcelApplication;
    
    const GLBFACTCONSUMIDORFINAL =  0; //	Factura a consumidor final
    const GLBFACTCREDITOFISCAL   =  1;  //	Factura con derecho a credito fiscal
    const GLBNOTACREDITOCONSFINAL=  2;  //	Nota de credito a consumidor final
    const GLBNOTACREDITOCONCRFISCAL= 3;  //	Nota de credito con derecho a credito fiscal
    const GLBFACTCONSUMIDORFEXONERITBIS =  6;  //	Factura a consumidor final con exoneracion de ITBIS
    const GLBFACTCONDERECHOFISCALEXONERITBIS=  7;  //	Factura con derecho fiscal con exoneracion de ITBIS

    const GLBIFISCALEPSONTMH6 =  'TM-H60000iii';
    const GLBIFISCALOKI407FP = 'OKI407FP';
    const GLBIFISCALEPSONTMT881V =  'TM-T88IV';

   FUNCTION emailValido(CONST Value: String): boolean;
   Procedure ProcPrepNeCF(tipo:string);
   Procedure LeerDatosIni;
   procedure ConvertANSIFileToUTF8File(AInputFileName, AOutputFileName: TFileName);
   procedure VerificaImpresoraFiscal;
   //Nuevo
   Procedure PreparaArchivoEmail(smtpserver:string;
   smtpport:string;
   smtpuser:string;
   smtppassword:string;
   FECHA :TDateTime;
   TOEMAIL: string;
   FROMEMAIL: string;
   SUBJECT: string;
   var _body : string;
   CCopy : String;
   nombrearchivo:string;
   replayto:string;var nFileEmail:String;DisPlayNameFrom:String);overload;

   Procedure PreparaArchivoEmail(smtpserver:string;
  smtpport:string;
  smtpuser:string;
  smtppassword:string;
  FECHA :TDateTime;
  TOEMAIL: string;
  FROMEMAIL: string;
  SUBJECT: string;
  _body : string;
  CCopy : String;
  nombrearchivo:string;
  replayto:string;var nFileEmail:String);overload;

   Procedure ProcLogTrackingEmail(
   IDTIPO :integer;
   smtpserver:string;
   smtpport:string;
   smtpuser:string;
   smtppassword:string;
   FECHA :TDateTime;
   TOEMAIL: string;
   FROMEMAIL: string;
   SUBJECT: string;
   _body : string;
   COD_USER :integer;
   STATUS : string;
   ERRORMESSAGE : string;
   FECHAIN : TDateTime;
   IN_POR : string;
   FECHA_UPDATE: string;
   UPD_POR :string;
   nombrearchivo:string;
  replayto:string;
  DisPlayNameFrom:string);

  procedure ProcLogTrackingEmailAviso(IDTIPO :integer;
  smtpserver:string;
  smtpport:string;
  smtpuser:string;
  smtppassword:string;
  FECHA :TDateTime;
  TOEMAIL: string;
  FROMEMAIL: string;
  SUBJECT: string;
  _body : string;
  COD_USER :integer;
  STATUS : string;
  ERRORMESSAGE : string;
  FECHAIN : TDateTime;
  IN_POR : string;
  FECHA_UPDATE: string;
  UPD_POR :string;
  nombrearchivo:string;
  DisPlayNameFrom:string);

  procedure ProcLogTrackingEmailAvisoDir(
  smtpserver:string;
  smtpport:string;
  smtpuser:string;
  smtppassword:string;
  FECHA :TDateTime;
  TOEMAIL: string;
  FROMEMAIL: string;
  SUBJECT: string;
  _body : string;
  COD_USER :integer;
  STATUS : string;
  ERRORMESSAGE : string;
  FECHAIN : TDateTime;
  IN_POR : string;
  FECHA_UPDATE: string;
  UPD_POR :string;
  nombrearchivo:string);
  
   Function GetNombreImpresoras:TStringList;
   Function ImpresoraDefecto : string;
   Procedure SizePapelPrinter;
   procedure ScaleForm(F: TForm; ScreenWidth, ScreenHeight: LongInt);
   Function  InsertarComa(fuente:string):String;

   Procedure PAbrirtablaMoneda(CodMoneda:String;Fecha:TDatetime);
   Function GlbMontoTasa(codigo : String): Real;
   Function GlbMontoTasaByFecha(codigo : String;fecha:TDateTime): Real;
   Function  SimboloMoneda(codigo:String):String;
   Function  IdiomadeWindows:string;
   Function  sqlNombreAbr(vCodigo:Integer): String;
   Function FRangoFechaNomina(Fecha : TDatetime; Var FechaNom:TDatetime):String;
   Function GlbRangoFechaNomina(Fecha : TDatetime; Var FechaIni:TDatetime;Var Fechafin:TDatetime): Boolean;
   Function FRangoFechaNominaContratista(Fecha : TDatetime; Var FechaNom:TDatetime):String;

   Procedure ReportExport(aReport: TQuickRep; const aFileName: TFileName);
   Procedure ReportExportPDF(aReport: TQuickRep; const aFileName: TFileName);
   Procedure ReportExportEstandar(aReport: TQuickRep; const aFileName: TFileName; subject:string; comprimir:boolean;
   email:string);
   Procedure ReportExportEstandarGSam(aReport: TQuickRep;aReport2: TQuickRep; const aFileName: TFileName);
   Procedure ReportExportEstandarG(aReport: TQuickRep; const aFileName: TFileName);
   //Procedure ReportExportEstandarGC(aReport: TQRCompositeReport; const aFileName: TFileName);
   //NombreArchivo:string);
   Procedure LogInformacionTxt(linea:String);
   Procedure LogInfoLoop(linea:String);
   Procedure IniciaTransaccion(data:TIBDataSet);
   Procedure GuardarIbDataset(data:TIBDataSet);
   Function GlbCalcularPrecio(Precio: Currency; codProducto: Integer): Currency;

   Function InsertaCeroIzq(Longitud:Smallint;Valor:String):String;
   function StrLeftPad(Valor:String;Longitud:Smallint):String;
   Function RemoverCaracter(valor : String; dato:String):String;
   Procedure ProcFechaIniComNomina(Var xFechaIni: TDatetime);
   Procedure GlbAsignaCuenta(cuenta:String;var cta1:String;var cta2:String;var cta3:String);
   Function PrecioEnLetra(precio : Real;DataSet : TIBQuery):Real;
   Function PrecioCodigo(strCodigo:String;DataSet : TIBQuery):Real;
   FuncTion DiasEnElMes(anio : Integer; Mes : Integer) : Smallint;
   FuncTion GlbUltimoDiaMesAnt(glbfechaInicial:TDatetime): TDatetime;
   FuncTion GlbPrimerDiaMes(glbfechaInicial:TDatetime): TDatetime;
   FuncTion GlbUltimoDiaMes(glbfechaInicial:TDatetime): TDatetime;
   Function GlbPermiteDato(sistema:integer;subsistema:integer;ciakey:Integer;Fecha:TDateTime): Boolean;
   Function ExtraerFecha(Fecha : TDatetime) : TDatetime;

   Function ExtraerHora(Hora: TDateTime) : TDatetime;
   Function CtaExiste(cuenta1:String;cuenta2:String;cuenta3:String;Error:Boolean):Boolean;
   function RemoverPuntoYComa(valor:String):String;
   procedure Delay(msecs: Longint);
   procedure UpdateCierreZ(accion:smallint; fecha:TDatetime);
   Function ProcedeCierreZ(fecha:TDatetime) : Boolean;
   Function ProcedVerificaCierreZ:Boolean;
   Function TotalHorasCierreZ(fecha:TDateTime):Integer;

   Function  MyStrCopyCta(Fuente:String;Desde:Integer;Hasta:Integer):String;
   Function  MyStrCopyRango(Fuente:String;Desde:Integer;Hasta:Integer):String;

   Function IsNumerico(const S: string):Boolean;
   Function  GetNumConsignacion(numTrn:Integer):Integer;
   //Function  FGlbPorcItbi(fecha:TDateTime):Real;
   function FGlbPorcItbi(Fecha:TDateTime; xcodprod :integer):Real;
   Function  FGlbPorcItbiXID(Fecha:TDateTime; idTasa:integer):Real;
   Function  FsqlMaxNumero(tabla:string;campo:string): Integer;
   function ExtraerDecimalString(valor:Real): String;
   function ExtraerEnteroString(SeparadorDecimal: String; CadenaFloat: String): String;
   Function FsqlMaxNumeroFactura(Generador:string): Integer;
   {Function IsLastRecord(ADataSet:TIBDataSet): Boolean;overload
   Function IsLastRecord(ADataSet:TIBQuery): Boolean;overload;}
   Function SetLogoCia(var _imagen:String):Boolean;
   //function Encriptar(const S: String; Key: Integer): String;
   function Encriptar(const S: String; Key: Int64): String;
   function Desencriptar(const S: String; Key: Int64): String;
   procedure PatchINT3;
   function generanumerocks: LongInt;
   function generaproxnumcks: LongInt;
   function GetRandomNumber(pref_num:integer):integer;
   Function glbProcActNumcks(nombproc:string;tipo:smallint):LongInt;//ultimo numero de cheque
   Function glbProcGetNumcks(nombproc:string;tipo:smallint;codbanco:integer):LongInt;//ultimo numero de cheque
   procedure GlbSalvarQuery(Tabla:TIBDataSet);
   Function  sqlConsulta(tabla:string;campo:string;condicion:string;valor:String): Boolean;
   Function sqlUpdate(tabla:string;campo:string;condicion:string;valorOld:String;nuevoValor:string): Boolean;
   Function CalCHora(horai : TDatetime;horaf : TDatetime):Integer;
   procedure ActualizaCodUsrCaja(numeroTrnVta:integer);
   Function VerificaCierreDia(Sistema:Integer;SubSistema:Integer;
                              CiaKey:Integer;Fecha:TDateTime; Var FechaAct:TDatetime):Boolean;
   Function PadLeftCharacter(Longitud:Smallint;Valor:Real;strFill:Char):String;
   Function PadLeftCharacterStr(Longitud:Smallint;Valor:string;strFill:Char):String;
   //Function LeftPad(value: string; length:integer=8; pad:char='0'): string;
   Function FileToUse(folder:string; xfile:string):String;
   Function GetCommandParam(const Key:string; Deflt:string=''):string;
   function GlbBuscarCodigoVendedor(cod : integer):String;
   function RightPad(S: string; Ch: Char; Len: Integer): string;
   function LeerPalabraMotorola( F: TFileStream ): Word;
   procedure DimensionJPG( sArchivo: string; var wAncho, wAlto: Word );
   procedure DimensionPNG( sArchivo: string; var wAncho, wAlto: Word );
   procedure DimensionGIF( sArchivo: string; var wAncho, wAlto: Word );

   // Procedure for appending a Message to an existing logfile with current Date and Time **
   procedure WriteToLog(aLogMessage:String);
   procedure ExporNCFListToExcel(mTabla : TIBQuery; NombreArchivo : String);
   procedure ExporNCFListToExcelFPago(mTabla : TIBQuery; NombreArchivo : String);
   procedure ExporToExcel(mTabla : TIBQuery; NombreArchivo : String;addFechaF:Boolean);overload;
   procedure ExporToExcel(mTabla : TIBQuery; NombreArchivo : String;addFechaF:Boolean;emailAuto:Boolean);overload;

   procedure ExporToExcelCert(mTabla : TIBDataSet; NombreArchivo : String);
   procedure ExporToExcelCertQ(mTabla : TIBQuery; NombreArchivo : String);

   procedure ExporToExcelARSFact(mTablaMaster : TIBQuery; mTabla : TIBQuery; NombreArchivo : String;rangoF:string);
   Function ProcZipFile(_path : String;var targetFile:string) : Boolean;
   procedure GenerarQRCode(OrdenID: Integer; Fecha: TDateTime; Image: TImage);
   Procedure ExporToExcelFCTCuadre(mTabla : TIBQuery; NombreArchivo : String);
   //Formato HTMl
   Procedure ExporToExcelInvReorden(mTabla : TIBQuery; NombreArchivo : String; ZipFile:boolean);

   //En revision -Necesita excel intalado
   Procedure ExporToExcelInvReordenEXCEL(mTabla : TIBQuery; NombreArchivo : String);
   function SetMergeCells (sheet:variant;cel1:variant;cel2:variant;
    MergeCells:boolean):boolean;

   procedure WriteToLogTag(aLogMessage:String);
   //** This procedure just creates a new Logfile an appends when it was created **
   procedure CreateLogfile;
   //
   procedure ProcGlbSecuenciaNCF;
   Function GetFormatoTipoDoc(tipo:Smallint; var rutaLogo : string):Boolean;
   Function CheckIfEsConduce(numstr:Integer):Boolean;
   Procedure VerificaValorTrn;
   Procedure RegistrarLogError(Modulo:String;Unidad:String;Descripcion:String);

   Function FCtaTipo(cuenta1:String;cuenta2:String;cuenta3:String;Error:Boolean):Integer;//retorna -> debito o credito

   Function GlbVerificaControl(sistema:integer;subsistema:integer;ciakey:Integer;Fecha:TDateTime;var cfecha:tdatetime;cstatus:string):Boolean;
   function GetMonedaProducto(codigo: Integer):String;
   Function GetNombreCuenta(cuentaNo:STring):String;
   //valida cedula o rnc
   function DocumentoValido(Const Tipo:TDocumentos; Documento:string):boolean;
   function PuertoCommOcupado(Puerto: String): Boolean;
   procedure GetPortList(List: TStringList);

   //codeverge.com/embarcadero.delphi.vcl.using/create-edit-and-onkeypress-run-t/1077707#sthash.Uj28uYNx.dpuf
   procedure MyKeyPress(Sender: TObject; var Key: Char);
   //procedure MyKeyPress(Self: Pointer; Sender: TObject; var Key: Char);

   function GLBObtenerCodigoProdEAN13(txtEAN13:String; var pesoProd:string):String;
   function GetOSVersion:string;
   procedure ProcCopiarFolder(pfrom:string;pTo:string);
   function CantDiasDom(AnioAct : Word; mes2 : word; dia2 : word; dias : integer): integer;
   Function MontoIsrADeducir(Salario:Real):Real;
Procedure CalculaTiempoT(AnioIn:Integer;MesIn:Integer;DiaIn:Integer;
AnioOut:Integer;MesOut:Integer;DiaOut:Integer;
var TAnio:Integer;Var TMes:Integer;Var TDia:Integer);

   Procedure GlbRemoveDirectory(const Dir: String);
   Function Split(Delimiter: Char;enumeracion : string): TStringList;
   function GetSpecialFolderPath(CSIDLFolder: Integer): string;
   function GlbRutaMisDocumentos : String;
   function GetRutaPrograma: String;
   function GetPersonalFolder(H: HWND): string;
   function HtmlEncode(const S: string): string;
   Function GetImpresora(Impre:String):Integer;
   Function GetImpresoraRpt(id:smallint;tiporpt:smallint):Integer;
   function MesEsFolder(const dt: TDateTime): string;
   function GetPCName: string;
   function GetComputerNameStr: string;
   Procedure ExportToHTMLCambioPrecios(mTabla: TIBQuery; NombreArchivo: String);
   function CheckRNCEdActivoenDGII(iddoc:string):boolean;
   function QuitarCaracteresEspeciales(const Texto: string): string;
   function CheckInternetWithRetries: Boolean;
   procedure MarcarCambioPreciosEnviados(AQuery: TIBDataSet; AFechaIni, AFechaFin: TDateTime);
   //procedure EjecutarFormatearExcelYEsperar(fechaini:string;fechafin:string;ciakey:integer;const NombreArchivoExcel: string;nombreExe: string);
   function EjecutarFormatearExcelYEsperar(
   const FormatearExcelExe, FechaIni, FechaFin, CiaKey, NombreArchivo: string;
   var Output: string): Integer;

implementation

uses UDatModConectar, UDatModCheques,UDatosVentas, UDatModCompania, UDatModControl,UcheckSecNCF,DelphiZXingQRCode, UDgiiRncClient,
specialfolders, UDatModFactura, UDatmodPerm, UDatModReportes, UDatamodulocnt, UDatModInventario, UDatmodDatosGenerales, SynPdf, UDatModNomina;


procedure MarcarCambioPreciosEnviados(AQuery: TIBDataSet; AFechaIni, AFechaFin: TDateTime);
begin
  AQuery.Close;
  {AQuery.SQL.Clear;
  AQuery.SQL.Add('UPDATE AUD_CAMBIO_PRECIO');
  AQuery.SQL.Add('SET ENVIADO = 1, FECHA_ENVIO = CURRENT_TIMESTAMP');
  AQuery.SQL.Add('WHERE FECHA_CAMBIO >= :FECHAINI');
  AQuery.SQL.Add('  AND FECHA_CAMBIO < :FECHAFIN');
  AQuery.SQL.Add('  AND COALESCE(ENVIADO, 0) = 0');}
  AQuery.ParamByName('FECHAINI').AsDate:= AFechaIni;
  AQuery.ParamByName('FECHAFIN').AsDate := AFechaFin+1;
  AQuery.ParamByName('STATUS').AsInteger:= 0;
  AQuery.Open;
  AQuery.first;
  while not AQuery.Eof do
  begin
    AQuery.Edit;
    AQuery.FieldByName('Enviado').AsInteger:=1;
    AQuery.Post;
    AQuery.Next;
  end;
  try
    AQuery.ApplyUpdates;
    if not AQuery.Transaction.InTransaction then
    AQuery.Transaction.StartTransaction;
    AQuery.Transaction.CommitRetaining;
  except
  AQuery.Transaction.RollbackRetaining;
  end;
  AQuery.Close;
end;

function HtmlEncode(const S: string): string;
begin
  Result := Trim(S);

  Result := StringReplace(Result, '&', '&amp;', [rfReplaceAll]);
  Result := StringReplace(Result, '<', '&lt;', [rfReplaceAll]);
  Result := StringReplace(Result, '>', '&gt;', [rfReplaceAll]);
  Result := StringReplace(Result, '"', '&quot;', [rfReplaceAll]);

  { Caracteres comunes del español }
  Result := StringReplace(Result, 'á', '&aacute;', [rfReplaceAll]);
  Result := StringReplace(Result, 'é', '&eacute;', [rfReplaceAll]);
  Result := StringReplace(Result, 'í', '&iacute;', [rfReplaceAll]);
  Result := StringReplace(Result, 'ó', '&oacute;', [rfReplaceAll]);
  Result := StringReplace(Result, 'ú', '&uacute;', [rfReplaceAll]);

  Result := StringReplace(Result, 'Á', '&Aacute;', [rfReplaceAll]);
  Result := StringReplace(Result, 'É', '&Eacute;', [rfReplaceAll]);
  Result := StringReplace(Result, 'Í', '&Iacute;', [rfReplaceAll]);
  Result := StringReplace(Result, 'Ó', '&Oacute;', [rfReplaceAll]);
  Result := StringReplace(Result, 'Ú', '&Uacute;', [rfReplaceAll]);

  Result := StringReplace(Result, 'ñ', '&ntilde;', [rfReplaceAll]);
  Result := StringReplace(Result, 'Ñ', '&Ntilde;', [rfReplaceAll]);

  Result := StringReplace(Result, 'ü', '&uuml;', [rfReplaceAll]);
  Result := StringReplace(Result, 'Ü', '&Uuml;', [rfReplaceAll]);

  Result := StringReplace(Result, '¿', '&iquest;', [rfReplaceAll]);
  Result := StringReplace(Result, '¡', '&iexcl;', [rfReplaceAll]);
end;

function GetTablaOrigenDisplay(const AValue: string): string;
begin
  if SameText(Trim(AValue), 'INVENTARIO_PRODUCTO') then
    Result := 'INVENTARIO'
  else if SameText(Trim(AValue), 'PRECIO_UNIDADSURTIDORA') then
    Result := 'PRECIO X UNIDAD'
  else
    Result := Trim(AValue);
end;

function GetClaseFilaPrecio(ATabla: TDataSet): string;
var
  PrecioAnterior: Double;
  PrecioNuevo: Double;
begin
  Result := '';

  PrecioAnterior := 0;
  PrecioNuevo := 0;

  if ATabla.FindField('PRECIO_ANTERIOR') <> nil then
    PrecioAnterior := ATabla.FieldByName('PRECIO_ANTERIOR').AsFloat;

  if ATabla.FindField('PRECIO_NUEVO') <> nil then
    PrecioNuevo := ATabla.FieldByName('PRECIO_NUEVO').AsFloat;

  if PrecioNuevo < PrecioAnterior then
    Result := ' class="price-down"';
end;

function GetUsuariosResumen(ATabla: TDataSet): string;
var
  Bmk: TBookmark;
  Lista: TStringList;
  Item: string;
  I: Integer;
begin
  Result := '';

  if (ATabla = nil) or (not ATabla.Active) or ATabla.IsEmpty then
    Exit;

  Lista := TStringList.Create;
  try
    Lista.Sorted := True;
    Lista.Duplicates := dupIgnore;

    Bmk := ATabla.GetBookmark;
    try
      ATabla.DisableControls;
      try
        ATabla.First;
        while not ATabla.Eof do
        begin
          Item := Trim(ATabla.FieldByName('nombre_usuario').AsString);

          if Trim(ATabla.FieldByName('nombre_pc').AsString) <> '' then
            Item := Item + ' / ' + Trim(ATabla.FieldByName('nombre_pc').AsString);

          if Trim(Item) <> '' then
            Lista.Add(Item);

          ATabla.Next;
        end;
      finally
        ATabla.EnableControls;
      end;

      ATabla.GotoBookmark(Bmk);
    finally
      ATabla.FreeBookmark(Bmk);
    end;

    for I := 0 to Lista.Count - 1 do
    begin
      if Result <> '' then
        Result := Result + ' | ';

      Result := Result + HtmlEncode(Lista[I]);
    end;
  finally
    Lista.Free;
  end;
end;

Procedure ExportToHTMLCambioPrecios(mTabla: TIBQuery; NombreArchivo: String);
var
  SL: TStringList;
  HtmlBody: string;
  HtmlFile: string;
  DirOut: string;
  UsuariosResumen: string;


  function FieldStr(const AFieldName: string): string;
  begin
    if mTabla.FindField(AFieldName) = nil then
      Result := ''
    else if mTabla.FieldByName(AFieldName).IsNull then
      Result := ''
    else
      Result := HtmlEncode(mTabla.FieldByName(AFieldName).AsString);
  end;

  function FieldFloatStr(const AFieldName: string): string;
  begin
    if mTabla.FindField(AFieldName) = nil then
      Result := ''
    else if mTabla.FieldByName(AFieldName).IsNull then
      Result := ''
    else
      Result := FormatFloat('#,##0.00', mTabla.FieldByName(AFieldName).AsFloat);
  end;

  function FieldPercentStr(const AFieldName: string): string;
  begin
    if mTabla.FindField(AFieldName) = nil then
      Result := 'N/A'
    else if mTabla.FieldByName(AFieldName).IsNull then
      Result := 'N/A'
    else
      Result := FormatFloat('#,##0.00', mTabla.FieldByName(AFieldName).AsFloat) + '%';
  end;

  function FieldDateTimeStr(const AFieldName: string): string;
  begin
    if mTabla.FindField(AFieldName) = nil then
      Result := ''
    else if mTabla.FieldByName(AFieldName).IsNull then
      Result := ''
    else
      Result := FormatDateTime('dd/mm/yyyy hh:mm a/p', mTabla.FieldByName(AFieldName).AsDateTime);
  end;

  function BuildHtmlFileName(const ABaseName: string): string;
  begin
    Result := Trim(ABaseName);
    Result := StringReplace(Result, '\\', '\', [rfReplaceAll]);

    if ExtractFileExt(Result) = '' then
      Result := Result + '.html'
    else if UpperCase(ExtractFileExt(Result)) <> '.HTML' then
      Result := ChangeFileExt(Result, '.html');
  end;
  function GetTablaOrigenDisplay(const AValue: string): string;
begin
  if SameText(Trim(AValue), 'INVENTARIO_PRODUCTO') then
    Result := 'INVENTARIO'
  else if SameText(Trim(AValue), 'PRECIO_UNIDADSURTIDORA') then
    Result := 'PRECIO X UNIDAD'
  else
    Result := Trim(AValue);
end;

begin
  NombreArchivo := StringReplace(NombreArchivo, '\\', '\', [rfReplaceAll]);
  HtmlFile := BuildHtmlFileName(NombreArchivo);

  DirOut := ExtractFileDir(HtmlFile);
  if (DirOut <> '') and (not DirectoryExists(DirOut)) then
    ForceDirectories(DirOut);

  if (mTabla = nil) or (not mTabla.Active) or mTabla.IsEmpty then
    Exit;

  SL := TStringList.Create;
  try
    UsuariosResumen := GetUsuariosResumen(mTabla);

    SL.Add('<!DOCTYPE html>');
    SL.Add('<html>');
    SL.Add('<head>');
    SL.Add('<meta http-equiv="Content-Type" content="text/html; charset=utf-8">');
    SL.Add('<meta charset="utf-8">');
    SL.Add('<meta name="viewport" content="width=device-width, initial-scale=1.0">');

    SL.Add('<style>');
    SL.Add('body{margin:0;padding:0;background:#edf2f7;font-family:Arial,Helvetica,sans-serif;color:#1f2933;}');
    SL.Add('.wrapper{width:100%;background:#edf2f7;padding:10px 0;}');

    SL.Add('.container{width:100%;max-width:1200px;margin:0 auto;background:#ffffff;border-radius:12px;overflow:hidden;border:1px solid #cbd5e1;box-shadow:0 8px 22px rgba(15,61,94,.10);}');

    SL.Add('.header{background:#0f3d5e;color:#ffffff;padding:18px 18px;text-align:center;}');
    SL.Add('.header h1{margin:0;font-size:21px;line-height:25px;font-weight:bold;letter-spacing:.4px;}');
    SL.Add('.header p{margin:6px 0 0 0;font-size:13px;line-height:17px;color:#e0f2fe;}');

    SL.Add('.summary{padding:14px 18px;font-size:13px;line-height:18px;background:#f0f9ff;border-bottom:1px solid #cbd5e1;}');
    SL.Add('.summary b{color:#0f3d5e;}');
    SL.Add('.usuarios{margin-top:9px;padding:9px 11px;background:#e0f2fe;border:1px solid #bae6fd;border-radius:8px;font-size:12px;color:#0c4a6e;}');
    SL.Add('.legend{margin-top:8px;font-size:11px;color:#64748b;}');
    SL.Add('.legend span{display:inline-block;width:10px;height:10px;background:#fee2e2;border:1px solid #fca5a5;border-radius:2px;margin-right:5px;vertical-align:-1px;}');

    SL.Add('table{width:100%;border-collapse:collapse;table-layout:fixed;border:1px solid #cbd5e1;}');
    SL.Add('th{background:#d9eaf7;color:#102a43;font-size:12px;text-align:left;padding:8px 7px;border:1px solid #b6c7d6;line-height:14px;}');
    SL.Add('td{font-size:12px;padding:8px 7px;border:1px solid #d7e0ea;vertical-align:top;line-height:15px;background:#ffffff;}');
    SL.Add('tbody tr:nth-child(even) td{background:#f8fafc;}');
    SL.Add('tbody tr:hover td{background:#eef6ff;}');

    SL.Add('tr.price-up td{background:#fee2e2 !important;border-color:#fca5a5;color:#7f1d1d;}');
    SL.Add('tr.price-up td.num{font-weight:bold;}');

    SL.Add('.fecha{width:88px;white-space:normal;}');
    SL.Add('.codigo{width:92px;white-space:normal;}');
    SL.Add('.producto{width:235px;word-break:normal;overflow-wrap:break-word;}');
    SL.Add('.campo{width:175px;word-break:normal;overflow-wrap:break-word;}');
    SL.Add('.num{text-align:right;white-space:nowrap;}');
    SL.Add('.colnum{width:58px;}');
    SL.Add('.colbenef{width:74px;}');

    SL.Add('.tag{display:inline-block;padding:2px 6px;border-radius:10px;background:#e0f2fe;color:#075985;font-size:11px;line-height:13px;margin-top:3px;border:1px solid #bae6fd;}');
    SL.Add('.field-name{font-weight:bold;color:#0f172a;}');
    SL.Add('.footer{font-size:11px;color:#52606d;padding:12px 18px;line-height:16px;background:#f8fafc;border-top:1px solid #e2e8f0;}');

    SL.Add('.m-label{display:none;}');

SL.Add('@media only screen and (max-width:700px){');
SL.Add('  .wrapper{padding:0;background:#ffffff;}');
SL.Add('  .container{width:100%;max-width:100%;border-radius:0;border-left:0;border-right:0;box-shadow:none;}');
SL.Add('  .header{padding:15px 12px;}');
SL.Add('  .header h1{font-size:18px;line-height:22px;}');
SL.Add('  .header p{font-size:12px;line-height:16px;}');
SL.Add('  .summary{padding:12px;font-size:12px;line-height:16px;}');
SL.Add('  .usuarios{font-size:11px;line-height:15px;padding:8px;margin-top:8px;}');
SL.Add('  .legend{font-size:11px;line-height:15px;}');

SL.Add('  table,thead,tbody,tr,th,td{display:block;width:auto;}');
SL.Add('  table{border:0;background:#ffffff;}');
SL.Add('  thead{display:none;}');

SL.Add('  tr{border:1px solid #cbd5e1;border-radius:10px;margin:10px 8px;padding:0;background:#ffffff;overflow:hidden;box-shadow:0 2px 8px rgba(15,61,94,.08);}');
SL.Add('  td{border:0;border-bottom:1px solid #e2e8f0;padding:7px 12px;font-size:12px;line-height:16px;background:#ffffff;}');
SL.Add('  td:last-child{border-bottom:0;}');

SL.Add('  .m-label{display:block;font-size:11px;line-height:14px;font-weight:bold;color:#0f3d5e;margin-bottom:2px;text-transform:uppercase;letter-spacing:.2px;}');
SL.Add('  .m-value{display:block;color:#1f2933;}');

SL.Add('  .fecha,.codigo,.producto,.campo,.num{text-align:left;white-space:normal;width:auto;}');
SL.Add('  .producto{font-size:13px;font-weight:bold;color:#0f172a;}');
SL.Add('  .campo{color:#334155;}');
SL.Add('  .num{font-weight:bold;}');

SL.Add('  .c1{background:#f0f9ff !important;}');
SL.Add('  .c3{background:#f8fafc !important;}');
SL.Add('  .tag{font-size:11px;line-height:13px;margin-top:3px;}');

SL.Add('  tr.price-up{background:#fee2e2;border-color:#fca5a5;}');
SL.Add('  tr.price-up td{background:#fee2e2 !important;}');
SL.Add('  tr.price-up .m-label{color:#991b1b;}');
SL.Add('}');

SL.Add('@media print{');
SL.Add('  body{background:#ffffff;margin:0;padding:0;-webkit-print-color-adjust:exact;print-color-adjust:exact;}');
SL.Add('  .wrapper{padding:0;background:#ffffff;}');
SL.Add('  .container{width:100%;max-width:none;border:0;border-radius:0;box-shadow:none;}');
SL.Add('  .header{padding:8px 10px;}');
SL.Add('  .header h1{font-size:16px;line-height:19px;}');
SL.Add('  .header p{font-size:11px;line-height:14px;}');
SL.Add('  .summary{padding:7px 8px;font-size:10px;line-height:13px;}');
SL.Add('  .usuarios{font-size:10px;padding:5px 7px;margin-top:5px;}');
SL.Add('  table{width:100%;table-layout:fixed;border-collapse:collapse;}');
SL.Add('  th{font-size:9px;padding:4px 3px;line-height:11px;}');
SL.Add('  td{font-size:9px;padding:4px 3px;line-height:11px;}');
SL.Add('.fecha{width:92px;white-space:normal;}');
SL.Add('.codigo{width:96px;white-space:normal;}');
SL.Add('.producto{width:270px;word-break:normal;overflow-wrap:break-word;}');
SL.Add('.campo{width:190px;word-break:normal;overflow-wrap:break-word;}');
SL.Add('.num{text-align:right;white-space:nowrap;}');
SL.Add('.colnum{width:64px;}');
SL.Add('.colbenef{width:82px;}');
SL.Add('  .colnum{width:52px;}');
SL.Add('  .colbenef{width:64px;}');
SL.Add('  .tag{font-size:8px;line-height:10px;padding:1px 3px;}');
SL.Add('  .footer{font-size:9px;padding:7px 8px;}');
SL.Add('  tr{page-break-inside:avoid;}');
SL.Add('}');
    SL.Add('@page{');
    SL.Add('  size:landscape;');
    SL.Add('  margin:8mm;');
    SL.Add('}');
    SL.Add('</style>');
                                        
    SL.Add('</head>');
    SL.Add('<body>');
    SL.Add('<div class="wrapper">');
    SL.Add('<div class="container">');

    SL.Add('<div class="header">');
    SL.Add('<h1>' + HtmlEncode(dmCompania.tblCompaniaNombre.Value) + '</h1>');
    SL.Add('<p>Reporte diario de cambios de precios</p>');
    SL.Add('</div>');

    SL.Add('<div class="summary">');
    SL.Add('<b>Fecha de generaci&oacute;n:</b> ' + FormatDateTime('dd/mm/yyyy hh:mm a/p', Now) + '<br>');
    SL.Add('<b>Nota:</b> Este reporte muestra cada modificaci&oacute;n de precio registrada durante el d&iacute;a.');

    if Trim(UsuariosResumen) <> '' then
      SL.Add('<div class="usuarios"><b>Usuario(s) / PC:</b> ' + UsuariosResumen + '</div>');

    SL.Add('<div class="legend"><span></span>Las filas resaltadas en rojo indican disminuci&oacute;n de precio.</div>');
    SL.Add('</div>');

    SL.Add('<table>');
    SL.Add('<thead>');
    SL.Add('<tr>');
    SL.Add('<th class="fecha">Fecha/Hora</th>');
    SL.Add('<th class="codigo">C&oacute;digo</th>');
    SL.Add('<th class="producto">Producto</th>');
    SL.Add('<th class="campo">Campo</th>');
    SL.Add('<th class="num colnum">Anterior</th>');
    SL.Add('<th class="num colnum">Nuevo</th>');
    SL.Add('<th class="num colnum">Dif.</th>');
    SL.Add('<th class="num colnum">%Dif.</th>');
    SL.Add('<th class="num colbenef">%Bfcio</th>');
    SL.Add('</tr>');
    SL.Add('</thead>');
    SL.Add('<tbody>');

    mTabla.First;
    while not mTabla.Eof do
    begin
      SL.Add('<tr' + GetClaseFilaPrecio(mTabla) + '>');

      SL.Add('<td class="c1 fecha">' +
        FieldDateTimeStr('FECHA_CAMBIO') +
        '</td>');

      SL.Add('<td class="c2 codigo">' +
        FieldStr('COD_PRODUCTO') +
        '<br><span class="tag">' + FieldStr('CODIGO_BARRA') + '</span>' +
        '</td>');

      SL.Add('<td class="c3 producto">' +
        FieldStr('DESCRIPCION') +
        '</td>');

      SL.Add('<td class="c4 campo">' +
        HtmlEncode(GetTablaOrigenDisplay(mTabla.FieldByName('TABLA_ORIGEN').AsString)) +
        '<br><span class="field-name">' + FieldStr('CAMPO_PRECIO') + '</span>' +
        '</td>');

      SL.Add('<td class="c5 num colnum">' +
        FieldFloatStr('PRECIO_ANTERIOR') +
        '</td>');

      SL.Add('<td class="c6 num colnum">' +
        FieldFloatStr('PRECIO_NUEVO') +
        '</td>');

      SL.Add('<td class="c7 num colnum">' +
        FieldFloatStr('DIFERENCIA') +
        '</td>');

      SL.Add('<td class="c8 num colnum">' +
        FieldPercentStr('PORC_DIFERENCIA') +
        '</td>');

      SL.Add('<td class="c9 num colbenef">' +
        FieldPercentStr('PORC_BENEFICIO_NUEVO') +
        '</td>');

      SL.Add('</tr>');

      mTabla.Next;
      Application.ProcessMessages;

      if GlbCerrandoSistema then
        Break;
    end;

    SL.Add('</tbody>');
    SL.Add('</table>');

    SL.Add('<div class="footer">');
    SL.Add('Reporte generado autom&aacute;ticamente por el sistema. Valores expresados en RD$.');
    SL.Add('</div>');

    SL.Add('</div>');
    SL.Add('</div>');
    SL.Add('</body>');
    SL.Add('</html>');

    HtmlBody := SL.Text;
    SL.SaveToFile(HtmlFile);
  finally
    SL.Free;
  end;

  dmdatos.qryEmailProceso.Close;
  dmdatos.qryEmailProceso.Params[0].Value := GlbIDTipoEmail;
  dmdatos.qryEmailProceso.Open;
  dmdatos.qryEmailProceso.First;

  if dmdatos.qryEmailProcesoSTATUS.Value = 'A' then
  begin
    if GlbEnviaEmail then
    begin
      if dmdatos.qryEmailProceso.RecordCount = 1 then
      begin
        if dmCompania.tblCompania.State = dsInactive then
          dmCompania.tblCompania.Open;

        dmCompania.tblCompania.Locate('codigo', glbCia_Key, []);
        GlbMuestraMensajeEmail:=False;
        ProcLogTrackingEmail(
          glbidtipoemail,
          dmdatos.qryEmailProcesoEMAIL_SERVER.Value,
          dmdatos.qryEmailProcesoPORT.AsString,
          dmdatos.qryEmailProcesoUSER_EMAIL.Value,
          Desencriptar(dmdatos.qryEmailProcesoUSER_PASSWORD.Value, 2005),
          Now,
          dmdatos.qryEmailProcesoTOEMAIL.Value,
          dmdatos.qryEmailProcesoFROMEMAIL.Value,
          dmdatos.qryEmailProcesoSUBJECT.Value + ' -CIA:' +
          dmCompania.tblCompaniaNOMBRE.Value +
          ' Sucursal : ' + dmCompania.tblCompaniaNUM_SUCURSAL.AsString + ' ' +
          FormatDateTime('dd/mm/yyyy hh:mm a/p', Now),
          HtmlBody,
          VarUsuarioGlb,
          'A',
          '',
          Now,
          strusername,
          FormatDateTime('dd/mm/yyyy hh:mm a/p', Now),
          strusername,
          '',
          dmCompania.tblCompaniaEMAIL.Value,
          dmCompania.tblCompaniaNOMBRE.Value
        );
      end;

      GlbEnviaEmail := False;
    end;
  end;

  Application.ProcessMessages;
end;

Procedure CalculaTiempoT(AnioIn:Integer;MesIn:Integer;DiaIn:Integer;
AnioOut:Integer;MesOut:Integer;DiaOut:Integer;
var TAnio:Integer;Var TMes:Integer;Var TDia:Integer);
begin
  if DiaOut < DiaIn then
  begin
    Inc(DiaOut,DiasEnElmes(AnioOut,MesOut));
    Dec(MesOut);
  end;
  if MesOut < MesIn then
  begin
    Dec(AnioOut);
    Inc(MesOut,12);
  end;
  TAnio:= AnioOut - AnioIn;
  Tmes := MesOut - MesIn;
  TDia := DiaOut - DiaIn;
  if TDia >= 30 then
  begin
    TDia:=0;
    Inc(TMes);
  end;
  if tmes >=12 then
  begin
    Inc(TAnio);
    Tmes:=0;
  end;  
end;


Function MontoIsrADeducir(Salario:Real):Real;
  Function ValorEscala(Indice:Integer):Real;
  begin
    if dmdatos.qryEscalaIsr.Locate('CODIGO_ESCALA',Indice,[]) then
    Result:=dmdatos.qryEscalaIsrESCALA_RETENCION.Value else Result:=0;
  end;
  Function ValorExento(Indice:Integer):Real;
  begin
    if dmdatos.qryEscalaIsr.Locate('CODIGO_ESCALA',Indice,[]) then
    Result:=dmdatos.qryEscalaIsrTASA_EXENTO.Value else Result:=0;
  end;
  Function ValorExedente(Indice:Integer):Real;
  begin
    if dmdatos.qryEscalaIsr.Locate('CODIGO_ESCALA',Indice,[]) then
    Result:=dmdatos.qryEscalaIsrEXCEDENTE.Value else Result:=0;
  end;
  Function ValorTasa(Indice:Integer):Real;
  begin
    if dmdatos.qryEscalaIsr.Locate('CODIGO_ESCALA',Indice,[]) then
    Result:=dmdatos.qryEscalaIsrTASA_EXENTO.Value else Result:=0;
  end;
begin
  if (Salario > ValorEscala(1)) and (Salario < ValorEscala(2)) then
  begin
    Result:= (Salario - ValorEscala(1)) * ValorTasa(1);
  end else
  if (Salario > ValorEscala(2)) and (Salario < ValorEscala(3)) then
  begin
    Result:= (Salario - ValorEscala(2)) * ValorTasa(2) + ValorExedente(2);
  end else
  if (Salario > ValorEscala(3)) then
  begin
    Result:= (Salario - ValorEscala(3)) * ValorTasa(3) + ValorExedente(3);
  end else Result:=0;
end;

function CantDiasDom(AnioAct : Word; mes2 : word; dia2 : word; dias : integer): integer;
var
  fecha : TDatetime;
  x:integer;
begin
  fecha:=EncodeDate(AnioAct,mes2,dia2);
  Result := 0;
  for x:= 1 to dias do
  Begin
    if DayOfWeek(fecha) = 1 then
    Begin
      Result := Result + 1;
    end;
    fecha := fecha + 1;
  end;  
end;

function CheckInternetWithRetries: Boolean;
var
  dwFlags: DWORD;
  Attempts: Integer;
begin
  Result := False;
  Attempts := 0;

  // Intentar hasta 3 veces
  while (Attempts < 3) and (not Result) do
  begin
    // InternetGetConnectedState verifica si hay una configuración de red activa
    if InternetGetConnectedState(@dwFlags, 0) then
    begin
      Result := True;
      Break; // Salir del bucle si hay conexión
    end;

    Attempts := Attempts + 1;
    
    // Si no es el último intento y no hubo conexión, esperar 5 segundos
    if (Attempts < 3) and (not Result) then
    begin
      // Sleep detiene el hilo actual. 5000 milisegundos = 5 segundos
      Sleep(5000);
    end;
  end;
end;

function CheckRNCEdActivoenDGII(iddoc:string):boolean;
var
  Info   : TDgiiRncInfo;
  Error  : string;
  EsActivo: Boolean;
  Rnc    : string;
begin
  Rnc := Trim(iddoc);        // el RNC escrito por el usuario
  if (Rnc = '') then exit;
  EsActivo := DGIIRncEstaActivo(
                GlbBaseUrlRNC,  // Base URL
                GlbBaseUrlRNCEndPoint,                  // Endpoint
                Rnc,                          // RNC o cédula SIN guiones
                Info,                         // salida: datos del contribuyente
                Error                         // salida: mensaje de error si aplica
              );

  if EsActivo then
  begin
    // Aquí decides qué hacer cuando está ACTIVO en DGII
    //if Trim(edtNombre.Text) = '' then
    //  edtNombre.Text := Info.NombreCompleto;

    //if Trim(edtNombreComercial.Text) = '' then
    //  edtNombreComercial.Text := Info.NombreComercial;

    //ShowMessage('Contribuyente ACTIVO en DGII.');
    sqlUpdate('clientes','rnc_ced_activo','rnc_numero=',iddoc,'1');
    result:=True;
    // También puedes poner un Label en verde, etc.
  end
  else
  begin
    sqlUpdate('clientes','rnc_ced_activo','rnc_numero=',iddoc,'0');
    if Error <> '' then
      ShowMessage('No ACTIVO / no encontrado en DGII: ' + Error)
    else
      ShowMessage('No ACTIVO en DGII.');
    result:=False;
  end;
end;

function QuitarCaracteresEspeciales(const Texto: string): string;
var
  i: Integer;
  c: Char;
  UltimoFueEspacio: Boolean;
begin
  Result := '';
  UltimoFueEspacio := False;

  for i := 1 to Length(Texto) do
  begin
    c := Texto[i];

    case c of
      'á', 'à', 'ä', 'â', 'ã': c := 'a';
      'Á', 'À', 'Ä', 'Â', 'Ã': c := 'A';

      'é', 'è', 'ë', 'ê': c := 'e';
      'É', 'È', 'Ë', 'Ê': c := 'E';

      'í', 'ì', 'ï', 'î': c := 'i';
      'Í', 'Ì', 'Ï', 'Î': c := 'I';

      'ó', 'ò', 'ö', 'ô', 'õ': c := 'o';
      'Ó', 'Ò', 'Ö', 'Ô', 'Õ': c := 'O';

      'ú', 'ù', 'ü', 'û': c := 'u';
      'Ú', 'Ù', 'Ü', 'Û': c := 'U';

      'ñ': c := 'n';
      'Ñ': c := 'N';

      'ç': c := 'c';
      'Ç': c := 'C';
    end;

    if c in ['A'..'Z', 'a'..'z', '0'..'9'] then
    begin
      Result := Result + c;
      UltimoFueEspacio := False;
    end
    else if c = ' ' then
    begin
      if not UltimoFueEspacio then
      begin
        Result := Result + c;
        UltimoFueEspacio := True;
      end;
    end;
  end;

  Result := Trim(Result);
end;

function EjecutarFormatearExcelYEsperar(
  const FormatearExcelExe, FechaIni, FechaFin, CiaKey, NombreArchivo: string;
  var Output: string
): Integer;
var
  StartInfo: TStartupInfo;
  ProcInfo: TProcessInformation;
  Security: TSecurityAttributes;
  ReadPipe, WritePipe: THandle;
  Buffer: array[0..255] of AnsiChar;
  BytesRead: DWORD;
  CmdLine: string;
  ExitCode: DWORD;
  S: TStringStream;
begin
  Result := -1;
  Output := '';
  GlbNombreArchivo:=NombreArchivo;
  FillChar(Security, SizeOf(Security), 0);
  Security.nLength := SizeOf(Security);
  Security.bInheritHandle := True;
  Security.lpSecurityDescriptor := nil;

  if not CreatePipe(ReadPipe, WritePipe, @Security, 0) then
    RaiseLastOSError;

  FillChar(StartInfo, SizeOf(StartInfo), 0);
  StartInfo.cb := SizeOf(StartInfo);
  StartInfo.dwFlags := STARTF_USESHOWWINDOW or STARTF_USESTDHANDLES;
  StartInfo.wShowWindow := SW_SHOWNORMAL;
  StartInfo.hStdOutput := WritePipe;
  StartInfo.hStdError := WritePipe;
  StartInfo.hStdInput := GetStdHandle(STD_INPUT_HANDLE);

  CmdLine := Format('"%s" "%s" "%s" "%s" "%s"', [
    FormatearExcelExe, FechaIni, FechaFin, CiaKey, NombreArchivo]);

  if CreateProcess(
    nil, PChar(CmdLine), nil, nil, True, 0, nil, nil, StartInfo, ProcInfo
  ) then
  begin
    CloseHandle(WritePipe); // Solo leeremos
    try
      S := TStringStream.Create('');
      try
        repeat
          BytesRead := 0;
          if ReadFile(ReadPipe, Buffer, SizeOf(Buffer)-1, BytesRead, nil) and (BytesRead > 0) then
          begin
            Buffer[BytesRead] := #0;
            S.WriteString(Buffer);
          end;
        until (BytesRead = 0);
        Output := S.DataString;
      finally
        S.Free;
      end;

      // Espera a que termine el proceso
      WaitForSingleObject(ProcInfo.hProcess, INFINITE);
      GetExitCodeProcess(ProcInfo.hProcess, ExitCode);
      Result := ExitCode;
    finally
      CloseHandle(ReadPipe);
      CloseHandle(ProcInfo.hProcess);
      CloseHandle(ProcInfo.hThread);
    end;
  end
  else
    RaiseLastOSError;
end;



function GetPCName: string;
var
  Buffer: array[0..MAX_COMPUTERNAME_LENGTH] of Char;
  Size: Cardinal;
begin
  FillChar(Buffer,Sizeof(Buffer),0);
  Size:= Sizeof(Buffer);
  if GetComputerName(Buffer,Size) then
    Result:= String(PChar(@Buffer))
  else
    Result:= '';
end;

function GetComputerNameStr: string;
var
  Buffer: array[0..MAX_COMPUTERNAME_LENGTH] of Char;
  Size: DWORD;
begin
  Size := MAX_COMPUTERNAME_LENGTH + 1;
  if Windows.GetComputerName(Buffer, Size) then
    Result := StrPas(Buffer)
  else
    Result := '';
end;



function MesEsFolder(const dt: TDateTime): string;
var
  m: Integer;
  s: string;
begin
  m := MonthOf(dt);
  s := Trim(NombreMes[m]); // UGlobal: meses en español
  if s = '' then s := FormatDateTime('mm', dt); // fallback
  // TitleCase: "marzo" -> "Marzo"
  s := AnsiUpperCase(Copy(s, 1, 1)) + Copy(s, 2, MaxInt);
  Result := s;
end;

Function GetImpresoraRpt(id:smallint;tiporpt:smallint):Integer;
Var
  nCont:Integer;
  lSearch:Boolean;
  cNewLIne:String;
  Impre:string;
begin
  dmDatos.qryImpresoras.Close;
  dmDatos.qryImpresoras.Open;
  if dmDatos.qryImpresoras.Locate('IDMODULO;IDREPORTE',
    VarArrayOf([id,tiporpt]),[]) then     //Factura/Recibo Punto Venta
    Impre:=dmDatos.qryImpresorasNOMBRE_IMPRESORA.Value;

  lSearch:=False;
  cNewLine:=Chr(10)+Chr(13);

  if (Impre = '') then result:= -1;

  For nCont:=0 to Printer.Printers.Count - 1 do
  //buscamos la impresora en la lista del sistema
  begin
    if Pos(impre, Printer.Printers[nCont]) <> 0 then
    begin
      lSearch:=True;
      Result:=nCont;
      Break;
    end;
  end;

  if lSearch = False then
  begin
    //ShowMessage('Impresora no encontrada. '+impre+cNewLine+' Se utilizará la predeterminda.');
    Result:= -1;
  end;
end;

Function GetImpresora(Impre:String):Integer;
Var
  nCont:Integer;
  lSearch:Boolean;
  cNewLIne:String;
begin
  lSearch:=False;
  cNewLine:=Chr(10)+Chr(13);

  if (Impre = '') then result:= -1;

  For nCont:=0 to Printer.Printers.Count - 1 do
  //buscamos la impresora en la lista del sistema
  begin
    if Pos(impre, Printer.Printers[nCont]) <> 0 then
    begin
      lSearch:=True;
      Result:=nCont;
      Break;
    end;
  end;

  if lSearch = False then
  begin
    //ShowMessage('Impresora no encontrada. '+impre+cNewLine+' Se utilizará la predeterminda.');
    Result:= -1;
  end;
end;

function GetRutaPrograma: String;
begin
  result:= ExtractFilePath(Application.ExeName);
end;
function GetPersonalFolder(H: HWND): string;
var
  PI: PItemIDList;
  A: array[0..MAX_PATH-1] of Char;
  s: string;
  i,L: integer;
begin
  SHGetSpecialFolderLocation(H, CSIDL_PERSONAL, PI);
  SHGetPathFromIDList(PI, A);
  s := StrPas(A);
  L := Length(s);
  i := L;
  while s[i] <> '\' do
    i := Pred(i);
  Result := Copy(s,1,L-i);
end;

function GetSpecialFolderPath(CSIDLFolder: Integer): string;
var
   FilePath: array [0..MAX_PATH] of char;
begin
  getWinSpecialFolder(CSIDLFolder);
  Result := FilePath;
end;

function GlbRutaMisDocumentos : String;
begin
  result := GetPersonalFolder(0);
end;

Procedure LogInfoLoop(linea:String);
var
  F: TFileStream;
  s: AnsiString;
begin
  if Not FileExists(ExtractFilePath( Application.ExeName )+'\'+ExtractFileName(Application.ExeName) + 'loop_log.txt') then

  begin
    F := TFileStream.Create(ExtractFilePath( Application.ExeName )+'\'+ExtractFileName(Application.ExeName) + 'loop_log.txt', fmCreate);
    F.Free;
  end;
  F := TFileStream.Create(ExtractFilePath( Application.ExeName )+'\'+ExtractFileName(Application.ExeName) + 'loop_log.txt', fmOpenWrite);
  F.Position := F.Size;
  s :=DateToStr(now)+' -' +Linea +LF;
  F.Write( s[1], Length( s ) );
  F.Free;
end;

procedure LogInformacionTxt(linea:String);
var
  F: TFileStream;
  s: AnsiString;
begin
  if Not FileExists(ExtractFilePath( Application.ExeName )+'\'+ExtractFileName(Application.ExeName) + '_log.txt') then

  begin
    F := TFileStream.Create(ExtractFilePath( Application.ExeName )+'\'+ExtractFileName(Application.ExeName) + '_log.txt', fmCreate);
    F.Free;
  end;
  F := TFileStream.Create(ExtractFilePath( Application.ExeName )+'\'+ExtractFileName(Application.ExeName) + '_log.txt', fmOpenWrite);
  F.Position := F.Size;
  s := FormatDatetime('yyyy-mm-dd hh:mm:ss',now)+'|'+'PC: '+'|'+strUserName
  +'|'+GlbUsuarioLogueado+'|Codigo User:' +IntToStr(VarUsuarioGlb)+ LF+CR
  + linea +LF;
  F.Write( s[1], Length( s ) );
  F.Free;
end;



function GetRandomNumber(pref_num:integer):integer;
var
  s1,s2:string;
begin
   Randomize;
   s1:= inttostr(pref_num);
   s2:=inttostr(RandomRange(1000, 999999));
  result:= StrToInt(s1+s2);
end;

function Split(Delimiter: Char;enumeracion : string): TStringList;
var
        Aux : String;
        i : integer;
        Lista :TStringList;
begin
        enumeracion := trim(enumeracion);
        Lista := TStringList.create;
        Aux := '';
        i:=1;
        while i <= length(Enumeracion) do begin
                if enumeracion[i] <> Delimiter then begin
                        Aux := Aux + enumeracion[i];
                end;
                if enumeracion[i] = Delimiter then begin
                        Lista.Add(trim(Aux));
                        Aux := '';
                end;
                inc(i);
        end;
        if Aux <> '' then begin
              Lista.Add(trim(Aux));
        end;
        result := lista;
end;

Procedure GlbRemoveDirectory(const Dir: String);
var
  sDir: String;
  Rec: TSearchRec;
begin
  sDir := IncludeTrailingPathDelimiter(Dir);
  if FindFirst(sDir + '*.*', faAnyFile, Rec) = 0 then
  try
    repeat
      if (Rec.Attr and faDirectory) = faDirectory then
      begin
        if (Rec.Name <> '.') and (Rec.Name <> '..') then
          GlbRemoveDirectory(sDir + Rec.Name);
      end else
      begin
        DeleteFile(PAnsichar(sDir + Rec.Name));
      end;
    until FindNext(Rec) <> 0;
  finally
    FindClose(Rec.FindHandle);
  end;
  RemoveDir(sDir);
end;

procedure ProcCopiarFolder(pfrom:string;pTo:string);
   var
  Action: TSHFileOpStruct;
begin
  begin
    Action.Wnd := Application.Handle;
    Action.wFunc := FO_COPY;
    Action.pFrom := PAnsichar(pfrom);//('C:\TEMP\Test\*.hlp'#0'C:\TEMP\Test\Core*.*'#0#0); // #0#0 required to signal end of filelist. Use single #0 to seperate multiple
    Action.pTo := PAnsichar(pTo);//('C:\TEMP\Testje\Test\This\Folder\Does\Not\Exist\'); // Does not exist!
    Action.fFlags := FOF_NOCONFIRMMKDIR or FOF_NOCONFIRMATION or FOF_SILENT;
    if (SHFileOperation(Action) = 0) then ShowMessage('Error copiando archivos libro de venta a temp folder, verifique');
    if Action.fAnyOperationsAborted then ShowMessage('Aborted.');
  end;
end;


function GetOSVersion:String;
var
  VersionInfo: TOSVersionInfo;
  Platform: string;
  MajorVersion,MinorVersion,Build: DWORD;
begin
  VersionInfo.dwOSVersionInfoSize := SizeOf(VersionInfo);
  GetVersionEx(VersionInfo);

  with VersionInfo do
  begin
  case dwPlatformId of
   VER_PLATFORM_WIN32s:        Platform := 'Windows 3x';
   VER_PLATFORM_WIN32_WINDOWS: Platform := 'Windows 95';
   VER_PLATFORM_WIN32_NT:      Platform := 'Windows NT';
  end;

  MajorVersion := dwMajorVersion;
  MinorVersion := dwMinorVersion;
  Build := dwBuildNumber;
  result := IntToStr(Build);// + Platform;
  end;
end;

procedure MyKeyPress(Sender: TObject; var Key: Char);
begin

end;

function GLBObtenerCodigoProdEAN13(txtEAN13:String; var pesoProd:string):String;
//var
  //_pesoProd : string;
begin
  //_pesoProd:= copy(txtEAN13, 8, 10 - 5);
  result :=   copy (txtEAN13, 3, 5);
  pesoProd   := copy(txtEAN13,8,3)+'.'+copy(txtEAN13,11,2);
end;

{
procedure TformObtenerDatosEAN.bObtenerEAN13Click(Sender: TObject);
var
  ean13 : string;
  numDigEmpresa : Integer;
begin
  numDigEmpresa := StrToInt (txtNumDigEmpresa.text);//valor default 5
  if numDigEmpresa > 8 then
    MessageDlg('El número de dígitos máximo para la empresa es de 8.',
        mtWarning, [mbok], 0)
  else
  begin
    if numDigEmpresa < 5 then
      MessageDlg('El número de dígitos mínimo para la empresa es de 5.',
          mtWarning, [mbok], 0)
    else
    begin
      ean13 := txtEAN13.Text;
      txtOrganizacion.Text := copy (ean13, 1, 2);
      txtEmpresa.Text := copy (ean13, 3, numDigEmpresa);
      txtProducto.Text := copy (ean13, 8, 10 - numDigEmpresa);
      txtDC.Text := copy (ean13, 13, 1);
    end;
  end;
end;
}

procedure GetPortList(List: TStringList);
var
  i: integer;
begin
  List.Clear;
  with TRegistry.Create do
  try
    RootKey:= HKEY_LOCAL_MACHINE;
    Access:= KEY_READ;
    if OpenKey('HARDWARE\DEVICEMAP\SERIALCOMM',FALSE) then
    begin
      GetValueNames(List);
      for i:= List.Count - 1 downto 0 do
        List[i]:= ReadString(List[i]);
      CloseKey;
    end;
  finally
    Free;
  end;
end;

function PuertoCommOcupado(Puerto: String): Boolean;
var
  Handle: THandle;
begin
  Handle:= CreateFile(PChar('\\.\' + Puerto),GENERIC_READ or GENERIC_WRITE,0,
    nil,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,0);
  if Handle <> INVALID_HANDLE_VALUE then
  begin
    CloseHandle(Handle);
    Result:= FALSE;
  end else
    Result:= TRUE;
end;


function DocumentoValido(Const Tipo:TDocumentos; Documento:string):boolean;
var
    multiplica,longitud:smallInt;
    resto, digito, valor, suma,  i :integer;
    t:string;
const
    peso    :array[0..7] of integer = (7,9,8,6,5,4,3,2);
    remp    :string='-';
begin
 
    t:=documento;

    documento:=trim(StringReplace(documento,remp,'',[rfReplaceAll]));

    if (documento='') then
    begin
      result  :=  false;
      exit;
    end;
    longitud:=length(documento);
 
    //Inicializar la variable suma
    suma:=0;
    case tipo of
    dcCedula, dcConducir, dcArmaFuego: //Es un numero de cedula o su equivalente
        begin
            {La actual cedula electora dominicana usa un digito verificador
            calculado por modulo 10}
            for i:=0 to longitud-2 do
            begin
                if i mod 2= 0 then
                    multiplica:=1
                else multiplica:=2;
 
                valor:=strtoIntDef(documento[i+1],-1)*multiplica;
 
                //Si el digito que se encontro no es numerico.
                if valor < 0 then break;
 
                if valor>9 then
                    valor:=strToIntDef(copy(intTostr(valor),1,1),0)
                        +strToIntDef(copy(intTostr(valor),2,1),0);

                suma:=suma+valor;
            end;
 
            //ahora  la variable Valor toma el digito verificador
            valor:= strToIntDef(copy(documento,longitud,1),0);
 
            //Comprar el resultado
            result:=valor= (10-(suma mod 10)) mod 10;
 
        end;
    dcRNC:  //Asumimos como valor de RNC con 9 caracteres
        begin
            {Calculo del R N C  modulo 11}
            for i:=0 to longitud-2 do
            begin
                multiplica:=peso[i];
 
                valor:=strtoIntDef(documento[i+1],-1)*multiplica;
 
                //Si el digito que se encontro no es numerico.
                if valor < 0 then break;
 
                suma:=suma+valor;
            end;
 
            //ahora  la variable Valor toma el digito verificador
            valor:= strToIntDef(copy(documento,longitud,1),0);
 
            resto   :=  trunc(suma - (integer(trunc(suma / 11)) * 11));
 
            case resto of
            0:digito:=2;
            1:digito:=1;
            else digito:=11-resto;
            end;
 
            //result  :=  valor= (11-(suma mod 11)) mod 11;
            result  :=  valor= digito;
        end;
    else
      result:= documento <> ''; 
    end;
end;


Function GlbVerificaControl(sistema:integer;subsistema:integer;ciakey:Integer;Fecha:TDateTime;var cfecha:tdatetime;cstatus:string):Boolean;
var
  sqlQuery : TIBQuery;
  tFecha :TDatetime;
begin
  sqlQuery:=TIBQuery.Create(nil);
  sqlQuery.Database:= dmConectar.IBDatabase1;
  sqlQuery.Sql.Clear;
  sqlQuery.Sql.Text :='Select sistema, fecha_Act, status  '+
  ' From control '+
  ' where sistema = :sistema '+
  ' and sub_sistema = :subsistema '+
  ' and cod_cia = :ciakey';
  sqlQuery.Prepare;
  sqlQuery.Params[0].ParamType := ptInput;
  sqlQuery.Params[0].AsInteger    := sistema;
  sqlQuery.Params[1].ParamType := ptInput;
  sqlQuery.Params[1].AsInteger := subsistema;
  sqlQuery.Params[2].ParamType := ptInput;
  sqlQuery.Params[2].AsInteger := ciakey;
  sqlQuery.Open;

  if sqlQuery.RecordCount = 1 then
  begin
    tfecha:=sqlquery.fieldbyname('fecha_Act').Value+1;
    if (sqlquery.fieldbyname('Status').Value = 'F') or
       (tfecha <> Fecha) then Result := False else Result:=True;
    cFecha:= sqlquery.fieldbyname('fecha_Act').Value;
    cStatus:=sqlquery.fieldbyname('Status').Value;
  end else Result := false;
  sqlQuery.free;
  sqlQuery:=nil;
end;

Function GetNombreCuenta(cuentaNo:STring):String;
var
  cta1, cta2,cta3 : String;
begin
  result:='';
  if  (cuentaNo <> '') then
  begin
    GlbAsignaCuenta(cuentaNO, cta1, cta2, cta3);
    if CtaExiste(cta1, cta2, cta3, false) then
       result:= GlbNombreCta;
  end;
end;

Function FCtaTipo(cuenta1:String;cuenta2:String;cuenta3:String;Error:Boolean):Integer;
var
  sqlQuery : TIBQuery;
begin
  sqlQuery:=TIBQuery.Create(nil);
  sqlQuery.Database:= dmConectar.IBDatabase1;
  sqlQuery.Sql.Clear;
  sqlQuery.Sql.Text :='Select SIGNO_CTA'+
  ' from catalogo '+
  ' where cuenta1 = :cuenta1 '+
  ' and   cuenta2 = :cuenta2 '+
  ' and   cuenta3 = :cuenta3 ';
  sqlQuery.prepare;
  sqlQuery.Params[0].ParamType := ptInput;
  sqlQuery.Params[0].AsString  := cuenta1;
  sqlQuery.Params[1].ParamType := ptInput;
  sqlQuery.Params[1].AsString  := cuenta2;
  sqlQuery.Params[2].ParamType := ptInput;
  sqlQuery.Params[2].AsString  := cuenta3;
  sqlQuery.Open;
  //SIGNO_CTA ----> 1-DEBITO 2-CREDITO
  if sqlquery.RecordCount > 0 then
  Result := sqlQuery.FieldByName('SIGNO_CTA').Value  else
  begin
    Result := 0;
    if error then
    MessageDlg('Cuenta no existe', mtError,[mbOk],0);
  end;
  sqlQuery.Close;
  sqlQuery.Free;
  sqlQuery:=Nil;
end;

Function CheckIfEsConduce(numstr:Integer):Boolean;
var
  sqlQuery : TIBQuery;
begin
  sqlQuery:=TIBQuery.Create(Nil);
  sqlQuery.Database:= dmConectar.IBDatabase1;
  sqlQuery.Sql.Clear;
  sqlQuery.Sql.Text :='Select numero'+
  ' from VENTAS_DET_CONDUCE '+
  ' where numero = :numero ';
  sqlQuery.prepare;
  sqlQuery.Params[0].ParamType := ptInput;
  sqlQuery.Params[0].AsInteger  := numstr;
  sqlQuery.Open;

  if sqlquery.RecordCount > 0 then
  begin
    if (sqlQuery.FieldByName('numero').Value > 0) then
    Result := True;
  end else
  begin
    Result := false;
  end;
  sqlQuery.Close;
  sqlQuery.Free;
  sqlQuery:=Nil;
end;

Function GetFormatoTipoDoc(tipo:Smallint; var rutaLogo : string):Boolean;
var
  sqlQuery : TIBQuery;
begin
  rutaLogo:='';
  sqlQuery:=TIBQuery.Create(nil);
  sqlQuery.Database:= dmConectar.IBDatabase1;
  sqlQuery.Sql.Clear;
  sqlQuery.Sql.Text :='Select idreporte, rutaLogo '+
  ' from FormatoReporte '+
  ' where TIPO_DOC = :TIPO_DOC and status = ' + chr(39)+'A'+chr(39);
  sqlQuery.prepare;
  sqlQuery.Params[0].ParamType := ptInput;
  sqlQuery.Params[0].AsInteger  := tipo;
  sqlQuery.Open;

  if sqlquery.RecordCount > 0 then
  begin
    if (sqlQuery.FieldByName('idreporte').Value > 0) then
    begin
      Result := True;
      rutaLogo := sqlQuery.FieldByName('rutaLogo').Value;
    end;
  end else
  begin
    Result := false;
  end;
  sqlQuery.Close;
  sqlQuery.Free;
  sqlQuery:=Nil;
end;

Procedure RegistrarLogError(Modulo:String;
Unidad:string;Descripcion:String);
begin
  if dmPerm.qryLogErrores.State = dsInactive then
  dmPerm.qryLogErrores.Open;
  if dmPerm.qryLogErrores.State = DsBrowse then
  begin
    dmPerm.qryLogErrores.Insert;
    dmPerm.qryLogErroresSERIE.Value  := FsqlMaxNumero('LOG_ERRORES','SERIE');
    dmPerm.qryLogErroresFECHA.Value  := Now;
    dmPerm.qryLogErroresUSUARIO.Value:= strusername;
    dmPerm.qryLogErroresMODULO.Value := modulo;
    dmPerm.qryLogErroresUNIDAD.Value := unidad;
    dmPerm.qryLogErroresDESCRIPCION.Value:=descripcion;
    glbSalvarQuery(dmPerm.qryLogErrores);
  end;
end;

Procedure VerificaValorTrn;
var
   strV1,strv2:String;
   strv3:String;
   diferencia : Real;
begin
  if (dmCnt.qrymastertrncnt.RecordCount > 0 ) and (dmCnt.qryDetTrnCnt.RecordCount > 0 ) then
  begin
    dmCnt.qrydettrncnt.DisableControls;
    dmCnt.qrydettrncnt.First;
    glbCredito:=0;
    glbDebito:=0;
    While Not dmCnt.qrydettrncnt.Eof do
    begin
      glbCredito:= glbCredito + dmCnt.qryDetTrnCntCREDITO_TRN.Value;
      glbDebito := glbDebito +  dmCnt.qryDetTrnCntDebito_TRN.Value;
      dmCnt.qrydettrncnt.Next;
    end;
    diferencia:= Abs(glbdebito - glbcredito);
    dmCnt.rxtotales.Close;
    dmCnt.rxtotales.EmptyTable;
    dmCnt.rxtotales.open;
    strV1:=Format('%8.2f', [glbCredito]);
    strV2:=Format('%8.2f', [glbDebito]);
    dmCnt.rxtotales.insert;
    dmCnt.rxtotalesdebito.value:=StrToFloat(strV1);
    dmCnt.rxtotalescredito.value:=StrToFloat(StrV2);
    dmCnt.rxtotales.post;
    dmCnt.qrydettrncnt.EnableControls;
    GlbProcede:=true;
    if strv1 <> Strv2 then
    begin
      if diferencia > 0.05 then
      begin
        MessageDlg('Transaccion no cuadra verifique',mtError,[mbOk],0);
        //t RegistrarLogError('Transacciones cnt','utransaccionescnt','Trn #'+dmCnt.qryDetTrnCntNUMERO.AsString+' no cuadra');
        GlbProcede:=false;
        GlbEditar := True;
      end;
    end;
    strV3:=Format('%8.2f', [dmCnt.qryMastertrncntMONTO.Value]);
    if (strV1 <> strv3) or
       (strV2 <> strv3) then
    begin
      GlbDif:= StrToFloat(strv1) - StrToFloat(strv3);
      if GlbDif > 0.01 then
      Begin
        GlbProcede:=false;
        GlbEditar := True;
        MessageDlg('Transaccion no cuadra verifique',mtError,[mbOk],0);
        RegistrarLogError('Transacciones cnt','utransaccionescnt','Trn #'+dmCnt.qryDetTrnCntNUMERO.AsString+' no cuadra');
      end;
    end;
  end;
end;

procedure VerificaImpresoraFiscal;
var
  archivo : String;
  tHoras : integer;
  parameters : String;

begin
  if GlbActivaIFiscal = 0 then
  begin
    GlbImpresoraFOnline := True;
    exit;
  end;

  dmDatos.qryImpresoraFiscalActiva.Close;
  dmDatos.qryImpresoraFiscalActiva.Open;

  archivo:=GlbExeIFiscal;
  Delay(2000);
  try
    parameters :=format('/PortComm=%s /Baudrate=%s /TipoDoc=DVFNs /ReporteZ=xPOR_DIA_IMP /Status=ifOnline /Cancelar=false /ImprimeZ=0 /CierreX=False /CierreZ=False /Cierre=XX /ImpCierreX=0 /ConfFile=DatosConfIFiscal.dat /FileToPrint=',
    [IntToStr(GlbPuerto),IntToStr(GlbBaudRate)]);
    //ShellExecute(0, 'Open', PChar(archivo), PChar(parameter), PChar(''), SW_HIDE);
    ShellExecute(0, 'Open', PChar(archivo), PChar(parameters), PChar(''), SW_Hide);
   except on E : Exception do
     WriteToLog (E.ClassName+' Error. Mensaje: '+E.Message);
     end;
  Delay(3000);
  dmReportes.qryStatusImpresora.Close;
  dmReportes.qryStatusImpresora.Params[0].Value:='%Fiscal: C0 80  Printer:  00 00%';
  dmReportes.qryStatusImpresora.Open;

  if dmReportes.qryStatusImpresora.RecordCount = 0 then
  begin
    dmReportes.qryStatusImpresora.Close;
    dmReportes.qryStatusImpresora.Params[0].Value:='%Campo Agregado con exito%';
    dmReportes.qryStatusImpresora.Open;
  end;//dmReportes.qryStatusImpresora.Sql.Text

  if dmReportes.qryStatusImpresora.RecordCount > 0 then
  begin
    GlbImpresoraFOnline:=True;
  end else
  begin
    GlbImpresoraFOnline:=False;
    RegistrarLogError('Punto Venta','','****** IMPRESORA FUERA DE LINEA, VERIFIQUE');
    RegistrarLogError('','','PUERTO = '+IntToStr(GlbPuerto)+ ' BaudRate='+IntToStr(GlbBaudRate));
  end;
end;

Function ImpresoraDefecto : string;
begin
  if (Printer.PrinterIndex > 0) then
    result := Printer.Printers [Printer.PrinterIndex]
  else
    Result := '';
end;

Function GetNombreImpresoras:TStringList;
var
  s : TStringList;
begin
  //
end;


function RemoverPuntoYComa(valor:String):String;
begin
  valor:=StringReplace(valor,',','',[rfReplaceAll ,rfIgnoreCase]);
  valor:=StringReplace(valor,'.','',[rfReplaceAll, rfIgnoreCase]);
  valor:=StringReplace(valor,'"','',[rfReplaceAll, rfIgnoreCase]);
  result:=valor;
end;
procedure Delay(msecs: Longint);
var
  targettime: Longint;
  Msg: TMsg;
begin
  targettime := GetTickCount + msecs;
  while targettime > GetTickCount do
    if PeekMessage(Msg, 0, 0, 0, PM_REMOVE) then
    begin
      if Msg.message = WM_QUIT then
      begin
        PostQuitMessage(Msg.wParam);
        Break;
      end;
      TranslateMessage(Msg);
      DispatchMessage(Msg);
    end;
end;
Function  TotalHorasCierreZ(fecha:TDateTime):Integer;
var
xdiaSemana: byte;
  hora : string;
begin
  xdiasemana := DayOfWeek(now);
  hora := formatdatetime('HH',now);
  dmControl.qryCierreZ.Close;
  dmControl.qryCierreZ.Params[0].Value:=20;
  dmControl.qryCierreZ.Params[1].Value:=0;
  dmControl.qryCierreZ.Params[2].Value:=1;
  dmControl.qryCierreZ.Open;
  if (dmControl.qryCierreZ.RecordCount = 1) and (dmControl.qryCierreZSTATUS.Value = 'A') then
  begin
    result := HoursBetween(Now, dmControl.qryCierreZFECHA_ULT_CIERREZ.Value);
    if (xdiasemana = 2) and (StrToInt(hora) < 21) then
    result:= 20;
  end else result := 0;
end;

Function ProcedVerificaCierreZ:boolean;
begin
  dmControl.qryVerificaCierreZ.close;
  dmControl.qryVerificaCierreZ.Params[0].Value := 20;
  dmControl.qryVerificaCierreZ.Params[1].Value := 0;
  dmControl.qryVerificaCierreZ.Params[2].Value := 1;
  dmControl.qryVerificaCierreZ.Open;
  if dmControl.qryVerificaCierreZHORAS_TRANSCURRIDAS.Value > 20 then
  begin
    MessageDlg('El último cierre Z, tiene mas de 20 horas ('+
    FormatDatetime('yyyy-mm-dd hh:mm:ss',dmControl.qryVerificaCierreZFECHA_ULT_CIERREZ.Value)+').'+
    chr(13)+'Verifica si es necesario realizarlo.',
    mtWarning,[mbOk],0);
    result:=false;
  end else result:=true;
end;

Function ProcedeCierreZ(fecha:TDatetime) : Boolean;
begin
  dmControl.tblControlCierreZ.Close;
  dmControl.tblControlCierreZ.Params[0].Value := 20;
  dmControl.tblControlCierreZ.Params[1].Value := 0;
  dmControl.tblControlCierreZ.Params[2].Value := 1;
  dmControl.tblControlCierreZ.Open;
                             //'10/22/2024' '10/23/2024'
  if (ExtraerFecha(dmControl.tblControlCierreZFECHA_ACT.Value) >= ExtraerFecha(fecha)) then
  Result:= False
  else Result:= True;
end;


procedure UpdateCierreZ(accion:smallint; fecha:TDatetime);
begin
  dmControl.tblControlCierreZ.Close;
  dmControl.tblControlCierreZ.Params[0].Value := 20;
  dmControl.tblControlCierreZ.Params[1].Value := 0;
  dmControl.tblControlCierreZ.Params[2].Value := 1;
  dmControl.tblControlCierreZ.Open;

  case accion of
  0:begin
     //if (dmControl.tblControlCierreZSTATUS.Value = 'A') then
     //begin
       dmControl.tblControlCierreZ.Edit;
       dmControl.tblControlCierreZSTATUS.Value := 'A';
       dmControl.tblControlCierreZFECHA_ACT.Value := ExtraerFecha(fecha);
       dmControl.tblControlCierreZFECHA_ULT_CIERREZ.Value := ExtraerFecha(fecha) + ExtraerHora(Now);
     //end;
  end;
  1:begin
      dmControl.tblControlCierreZ.Edit;
      dmControl.tblControlCierreZSTATUS.Value := 'A';
      dmControl.tblControlCierreZFECHA_ACT.Value:=fecha;
      dmControl.tblControlCierreZFECHA_ULT_CIERREZ.Value :=
      ExtraerFecha(fecha) + ExtraerHora(Now);
    end;
  end;//case          
  if dmControl.tblControlCierreZ.state in [dsedit] then
  begin
    dmControl.tblControlCierreZ.Post;
    dmControl.tblControlCierreZ.Applyupdates;
    if Not dmControl.tblControlCierreZ.Transaction.InTransaction then
    dmControl.tblControlCierreZ.Transaction.StartTransaction;
    try
      dmControl.tblControlCierreZ.Transaction.CommitRetaining;
    except
    dmControl.tblControlCierreZ.Transaction.RollbackRetaining;
    end;
  end;

end;

Procedure ReportExportPDF(aReport: TQuickRep; const aFileName: TFileName);
var Pdf: TPdfDocument;
     aMeta: TMetaFile;
     i: integer;
     descX : String;
     DestFile : string;
begin
  if not Assigned(aReport) then
  begin
    ShowMessage('Favor comunicarte con soporte para corregir un error en este proceso. ');
    LogInformacionTxt('El objeto aReport no ha sido instanciado. '+strUserName+ '. Usuario : '+VarNombreUsuario+ '. Fecha :'+DateTimeToStr(now)+'. Error creando directorio: '+ExtractFileDir(aFileName));
    Exit;
  end;
  if ((Pos('\',aFileName) > 0) or (Pos('/',aFileName) > 0)) then
  begin
  if not DirectoryExists(ExtractFilePath(aFileName)) then
  if not ForceDirectories(ExtractFilePath(aFileName)) then
  begin
    LogInformacionTxt('Log recibos/Facturas.'+strUserName+ '. Usuario : '+VarNombreUsuario+ '. Fecha :'+DateTimeToStr(now)+'. Error creando directorio: '+ExtractFileDir(aFileName));
    exit;
  end;
  end;
  DestFile:=ExtractFilePath(aFileName)+'\'+ExtractFileName(aFileName);
  Pdf := TPdfDocument.Create;
  try
    aReport.Prepare;
    for i := 1 to aReport.QRPrinter.PageCount do begin
      aMeta := aReport.QRPrinter.GetPage(i);
      try
        Pdf.DefaultPageWidth := MulDiv(aMeta.Width,72,Pdf.ScreenLogPixels);
        Pdf.DefaultPageHeight := MulDiv(aMeta.Height,72,Pdf.ScreenLogPixels);
        Pdf.AddPage;
        // draw the page content
        Pdf.Canvas.RenderMetaFile(aMeta,1,0,0);
      finally
        aMeta.Free;
      end;
    end;
    DestFile:=StringReplace(DestFile,'\\','\',[]);
    Pdf.SaveToFile(DestFile);

    if GlbFactRecurrente then
    GlbRutaFactRecurr := DestFile;
    GlbNombreArchivo:=DestFile;
    GlbNombreArchivo:=StringReplace(GlbNombreArchivo,'\\','\',[]);
    GlbNombreArchivo:=StringReplace(GlbNombreArchivo,'//','/',[]);
    DestFile:=StringReplace(DestFile,'\\','\',[]);
    glbZipFile := DestFile;
  finally
    Pdf.free;
  end;
  if GLBMostrarArchivo then
  begin
    GlbNombreArchivo:=DestFile;
    if (FileExists(DestFile)) then
    ShellExecute(0,'open',PChar(DestFile), '','',SW_SHOWNORMAL);
  end else
  if (GlbImpEnPDF = 1) and (not GlbFactRecurrente) then
  if (GlbMuestraPDF) then
  ShellExecute(0, 'open', 'acrord32', PChar('/p /h ' + DestFile), nil, SW_HIDE);
end;



Procedure ReportExportEstandarG(aReport: TQuickRep; const aFileName: TFileName);
//NombreArchivo:string);

var Pdf: TPdfDocument;
     aMeta: TMetaFile;
     i: integer;
     DestFile,descX : String;
begin
  try
    if not DirectoryExists(ExtractFilePath(aFileName)) then
    if not ForceDirectories(ExtractFilePath(aFileName)) then
    begin
      LogInformacionTxt('Certificados. '+strUserName+ '. Usuario : '+VarNombreUsuario+ '. Fecha :'+DateTimeToStr(now)+'. Error creando directorio: '+ExtractFileDir(aFileName));
      MessageDlg('Error creando directorio:'+ExtractFilePath(aFileName),mtInformation,[mbok],0);
      exit;
    end;
  Except
  on E : Exception do
  begin
    WriteToLog(E.ClassName+' error raised, with message : '+E.Message);
    MessageDlg(E.ClassName+' error raised, with message : '+E.Message,mtInformation,[mbok],0);
    exit;
  end;
  end;
  //DestFile :=ExtractFilePath( Application.ExeName )+'\Informes\'+ExtractFileName(aFileName);
  DestFile := aFileName;

  Pdf := TPdfDocument.Create;
  try
    aReport.Prepare;
    for i := 1 to aReport.QRPrinter.PageCount do begin
      aMeta := aReport.QRPrinter.GetPage(i);
      try
        Pdf.DefaultPageWidth := MulDiv(aMeta.Width,72,Pdf.ScreenLogPixels);
        Pdf.DefaultPageHeight := MulDiv(aMeta.Height,72,Pdf.ScreenLogPixels);
        Pdf.AddPage;
        // draw the page content
        Pdf.Canvas.RenderMetaFile(aMeta,1,0,0);
      finally
        aMeta.Free;
      end;
    end;
    Pdf.SaveToFile(DestFile);
    //if comprimir then
    glbZipFile := DestFile
    //else glbZipFile := False;
  finally
    Pdf.free;
  end;
  //Application.ProcessMessages;
  if GLBMostrarArchivo then
  begin
    if (FileExists(DestFile)) then
    ShellExecute(0,'open',PChar(DestFile), '','',SW_SHOWNORMAL);
  end;
end;

Procedure ReportExportEstandarGSam(aReport: TQuickRep;aReport2: TQuickRep; const aFileName: TFileName);
//NombreArchivo:string);

var Pdf: TPdfDocument;
     aMeta: TMetaFile;
     i: integer;
     DestFile,descX : String;
begin
  try
    if not DirectoryExists(ExtractFilePath(aFileName)) then
    if not ForceDirectories(ExtractFilePath(aFileName)) then
    begin
      LogInformacionTxt('Certificados. '+strUserName+ '. Usuario : '+VarNombreUsuario+ '. Fecha :'+DateTimeToStr(now)+'. Error creando directorio: '+ExtractFileDir(aFileName));
      MessageDlg('Error creando directorio:'+ExtractFilePath(aFileName),mtInformation,[mbok],0);
      exit;
    end;
  Except
  on E : Exception do
  begin
    WriteToLog(E.ClassName+' error raised, with message : '+E.Message);
    MessageDlg(E.ClassName+' error raised, with message : '+E.Message,mtInformation,[mbok],0);
    exit;
  end;
  end;
  //DestFile :=ExtractFilePath( Application.ExeName )+'\Informes\'+ExtractFileName(aFileName);
  DestFile := aFileName;

  Pdf := TPdfDocument.Create;
  try
    aReport.Prepare;
    for i := 1 to aReport.QRPrinter.PageCount do begin
      aMeta := aReport.QRPrinter.GetPage(i);
      try
        Pdf.DefaultPageWidth := MulDiv(aMeta.Width,72,Pdf.ScreenLogPixels);
        Pdf.DefaultPageHeight := MulDiv(aMeta.Height,72,Pdf.ScreenLogPixels);
        Pdf.AddPage;
        // draw the page content
        Pdf.Canvas.RenderMetaFile(aMeta,1,0,0);
      finally
        aMeta.Free;
      end;
    end;

    aReport2.Prepare;
    for i := 1 to aReport2.QRPrinter.PageCount do begin
      aMeta := aReport2.QRPrinter.GetPage(i);
      try
        Pdf.DefaultPageWidth := MulDiv(aMeta.Width,72,Pdf.ScreenLogPixels);
        Pdf.DefaultPageHeight := MulDiv(aMeta.Height,72,Pdf.ScreenLogPixels);
        Pdf.AddPage;
        // draw the page content
        Pdf.Canvas.RenderMetaFile(aMeta,1,0,0);
      finally
        aMeta.Free;
      end;
    end;

    Pdf.SaveToFile(DestFile);
    //if comprimir then
    glbZipFile := DestFile
    //else glbZipFile := False;
  finally
    Pdf.free;
    Pdf:=nil;
  end;

  FreeObjectInstance(Pdf);
  //Application.ProcessMessages;
  if GLBMostrarArchivo then
  begin
    if (FileExists(DestFile)) then
    ShellExecute(0,'open',PChar(DestFile), '','',SW_SHOWNORMAL);
  end;
  if Assigned(aReport) then
  FreeAndNil(aReport);
    if Assigned(aReport2) then
  FreeAndNil(aReport2);
end;

Procedure ReportExportEstandar(aReport: TQuickRep; const aFileName: TFileName; subject:string; comprimir:boolean;
email:string);
var Pdf: TPdfDocument;
     aMeta: TMetaFile;
     i: integer;
     DestFile,descX : String;
begin
  try
    if not DirectoryExists(ExtractFilePath(aFileName)) then
    if not ForceDirectories(ExtractFilePath(aFileName)) then
    begin
      LogInformacionTxt('Exportar a PDF:  '+strUserName+ '. Usuario : '+VarNombreUsuario+ '. Fecha :'+DateTimeToStr(now)+'. Error creando directorio: '+ExtractFileDir(aFileName));
      MessageDlg('Error creando directorio:'+ExtractFilePath(aFileName),mtInformation,[mbok],0);
      exit;
    end;
  Except
  on E : Exception do
  begin
    WriteToLog(E.ClassName+' error raised, with message : '+E.Message);
    MessageDlg(E.ClassName+' error raised, with message : '+E.Message,mtInformation,[mbok],0);
    exit;
  end;
  end;
  //DestFile :=ExtractFilePath( Application.ExeName )+'\Informes\'+ExtractFileName(aFileName);
  DestFile := aFileName;

  Pdf := TPdfDocument.Create;
  try
    aReport.Prepare;
    for i := 1 to aReport.QRPrinter.PageCount do begin
      aMeta := aReport.QRPrinter.GetPage(i);
      try
        Pdf.DefaultPageWidth := MulDiv(aMeta.Width,72,Pdf.ScreenLogPixels);
        Pdf.DefaultPageHeight := MulDiv(aMeta.Height,72,Pdf.ScreenLogPixels);
        Pdf.AddPage;
        // draw the page content
        Pdf.Canvas.RenderMetaFile(aMeta,1,0,0);
      finally
        aMeta.Free;
      end;
    end;
    Pdf.SaveToFile(DestFile);
    //if comprimir then
    glbZipFile := DestFile
    //else glbZipFile := False;
  finally
    Pdf.free;
  end;
  Application.ProcessMessages;
  dmdatos.qryEmailProceso.Close;
  dmdatos.qryEmailProceso.Params[0].Value := 100;//Estandar
  dmdatos.qryEmailProceso.Open;
  dmdatos.qryEmailProceso.First;
  if dmdatos.qryEmailProceso.RecordCount = 0 then
  begin
    MessageDlg('Formato envio email estandar (100) '#13#10'no ha sido configurado, verifique',mtError,[mbok],0);
    exit;
  end;
  if dmdatos.qryEmailProceso.RecordCount = 1 then
  begin
    if (dmdatos.qryEmailProcesoSTATUS.Value = 'A') then
    begin
      if comprimir then
      ProcZipFile(glbZipFile, glbZipFile);
      
      if (GlbNombreArchivoRev = '') then
      GlbNombreArchivoRev:=glbZipFile;

      if (GlbEnviaEmail and (email <> '')) then
      begin
        if FileExists(glbZipFile) then
        begin
          if dmCompania.tblCompania.State = dsInactive then
          dmCompania.tblCompania.open;
          dmCompania.tblCompania.Locate('codigo',glbCia_Key,[]);
          if GlbEnviaEmailDirecto then
          ProcLogTrackingEmail(100, dmdatos.qryEmailProcesoEMAIL_SERVER.Value,
          dmdatos.qryEmailProcesoPORT.AsString, dmdatos.qryEmailProcesoUSER_EMAIL.Value,
          Desencriptar(dmdatos.qryEmailProcesoUSER_PASSWORD.Value,2005),
          now,email, dmdatos.qryEmailProcesoFROMEMAIL.Value,
          subject +
          dmCompania.tblCompaniaNOMBRE.Value + ' -'+FormatDateTime('dd/mm/yy HH:MM',now),
          descX,
          VarUsuarioGlb,'A','', Now,strusername,FormatDateTime('dd/mm/yyyy hh:mm a/p',now),strusername,glbZipFile,dmCompania.tblCompaniaEMAIL.Value,dmCompania.tblCompaniaNOMBRE.Value);
        end;
        GlbEnviaEmail:=False;
      end;
    end;
  end;
end;

Procedure ReportExport(aReport: TQuickRep; const aFileName: TFileName);
var Pdf: TPdfDocument;
     aMeta: TMetaFile;
     i: integer;
     DestFile,descX : String;
     xObs : string;
begin
  if (GlbIDTipoEmail = 4) then
  descX := 'Resumen Venta X Mes'
  else
  if GlbIDTipoEmail = 100 then
  descX := 'Reporte' else
  descX := 'Res vtas Tipo NCF';
  if (GlbSubject <> '') then
  descX:=GlbSubject;
  
  if not DirectoryExists(ExtractFilePath(aFileName)) then
  if not ForceDirectories(ExtractFilePath(aFileName)) then
  begin
    LogInformacionTxt('UGlobal ReportExport.'+strUserName+ '. Usuario : '+VarNombreUsuario+ '. Fecha :'+DateTimeToStr(now)+'. Error creando directorio: '+ExtractFileDir(aFileName));
    exit;
  end;
  //DestFile :=ExtractFilePath( Application.ExeName )+'\Informes\'+ExtractFileName(aFileName);
  DestFile := aFileName;
               
  Pdf := TPdfDocument.Create;
  try
    aReport.Prepare;
    for i := 1 to aReport.QRPrinter.PageCount do begin
      aMeta := aReport.QRPrinter.GetPage(i);
      try
        Pdf.DefaultPageWidth := MulDiv(aMeta.Width,72,Pdf.ScreenLogPixels);
        Pdf.DefaultPageHeight := MulDiv(aMeta.Height,72,Pdf.ScreenLogPixels);
        Pdf.AddPage;
        // draw the page content
        Pdf.Canvas.RenderMetaFile(aMeta,1,0,0);
      finally
        aMeta.Free;
      end;
    end;
    Pdf.SaveToFile(DestFile);
    glbZipFile := DestFile;
  finally
    Pdf.free;
  end;
  Application.ProcessMessages;
  dmdatos.qryEmailProceso.Close;
  dmdatos.qryEmailProceso.Params[0].Value := GlbIDTipoEmail;
  dmdatos.qryEmailProceso.Open;
  dmdatos.qryEmailProceso.First;
  if dmdatos.qryEmailProceso.RecordCount = 1 then
  begin
    if (dmdatos.qryEmailProcesoSTATUS.Value = 'A') then
    begin
      if (GlbEnviaEmail) then
      begin
        //if ProcZipFile(aFileName, targetFile) then
        if FileExists(glbZipFile) then
        begin
          if dmCompania.tblCompania.State = dsInactive then
          dmCompania.tblCompania.open;
          dmCompania.tblCompania.Locate('codigo',glbCia_Key,[]);

          if (GlbSubject <> '') then
          xObs := GlbSubject
          else xObs:=dmdatos.qryEmailProcesoSUBJECT.Value;
          
          ProcLogTrackingEmail(glbidtipoemail, dmdatos.qryEmailProcesoEMAIL_SERVER.Value,
          dmdatos.qryEmailProcesoPORT.AsString, dmdatos.qryEmailProcesoUSER_EMAIL.Value,
          Desencriptar(dmdatos.qryEmailProcesoUSER_PASSWORD.Value,2005),
          now,dmdatos.qryEmailProcesoTOEMAIL.Value, dmdatos.qryEmailProcesoFROMEMAIL.Value,
          xObs + '-'+
          dmCompania.tblCompaniaNOMBRE.Value +
          ' Sucursal: '+dmCompania.tblCompaniaNUM_SUCURSAL.AsString+' '+FormatDateTime('dd/mm/yy HH:MM',now),
          descX,
          VarUsuarioGlb,'A','', Now,strusername,FormatDateTime('dd/mm/yyyy hh:mm a/p',now),strusername,glbZipFile,dmCompania.tblCompaniaEMAIL.Value,dmCompania.tblCompaniaNOMBRE.Value);
        end;
        GlbEnviaEmail:=False;
      end;
    end;
  end;
end;

Procedure PAbrirtablaMoneda(CodMoneda:String;Fecha:TDatetime);
begin
  CodMoneda:=Trim(CodMoneda);
  if (CodMoneda = '') then exit;
  GlbMoneda:=StrToInt(codMoneda);
  if (Fecha <> 0) then
  begin
    dmDatos.qryTasa.Close;           //dmIng.qryServR
    dmDatos.qryTasa.Params[0].Value := CodMoneda;
    dmDatos.qryTasa.Params[1].Value := ExtraerFecha(Fecha);
    dmDatos.qryTasa.Open; {
    if dmDatos.qryTasa.RecordCount = 0 then
    MessageDlg('No se encuentra Valor de la Tasa para esta fecha, verifique',mtError,[mbok],0);
    }
  end;
end;
Function  SimboloMoneda(codigo:String):String;
begin
  Codigo:=Trim(Codigo);
  if (Codigo = '') then Exit;
  //if not dmdatos.qrytasa.Active then
  //begin
    PAbrirtablaMoneda(codigo,GlbFechaTrnDiaria);
    //dmdatos.qrytasa.Open;
  //end;
  //if dmdatos.qrytasa.Locate('CODIGO', codigo,[]) then
  if not dmdatos.qrytasaSIMBOLO.IsNull then
  Result := trim(dmdatos.qrytasaSIMBOLO.Value)
  else Result := '';
  GlbSimboloMoneda:=Trim(dmdatos.qrytasaSIMBOLO.Value);
end;

Function GlbMontoTasa(codigo : String): Real;
begin
  Codigo:=Trim(Codigo);
  if (Codigo = '') then Exit;
  //if not dmdatos.qrytasa.Active then
  //begin
    PAbrirtablaMoneda(codigo,GlbFechaTrnDiaria);
    //dmdatos.qrytasa.Open;
  //end;

  if dmdatos.qryTasa.State = dsBrowse then
  begin
    //if dmdatos.qryTasa.Locate('CODIGO', codigo, []) then
    if Not dmdatos.qrytasaSIMBOLO.IsNull then
    Result := dmdatos.qryTasaVALORMONEDA.Value
    else Result := 1;
  end;
end;

Function GlbMontoTasaByFecha(codigo : String;fecha:TDateTime): Real;
begin
  Codigo:=Trim(Codigo);
  if (Codigo = '') then Exit;
     PAbrirtablaMoneda(codigo,fecha);

  if dmdatos.qryTasa.State = dsBrowse then
  begin
    if Not dmdatos.qrytasaSIMBOLO.IsNull then
    Result := dmdatos.qryTasaVALORMONEDA.Value
    else Result := 1;
  end;
end;


function GlbBuscarCodigoVendedor(cod : integer):String;
var
  sqlQuery : TIBQuery;
begin
  sqlQuery:=TIBQuery.Create(Nil);
  sqlQuery.Database:= dmconectar.IBDatabase1;
  sqlQuery.Sql.Clear;
  sqlQuery.Sql.Text :='SELECT codigo, NOMBRE||" "|| apellido nombre '+
  ' From EMPLEADO  '+
  ' Where codigo = :codigo ';
  sqlQuery.prepare;
  sqlQuery.Params[0].ParamType := ptInput;
  sqlQuery.Params[0].AsInteger:= cod;
  sqlQuery.Open;

  if sqlquery.RecordCount > 0 then
  result:=sqlQuery.FieldByName('nombre').Value
  else
  result:='Sin Vendedor';
  sqlQuery.Close;
  sqlQuery.Free;
  sqlQuery:=Nil;
end;

function RightPad(S: string; Ch: Char; Len: Integer): string;
var
  RestLen: Integer;
begin
  Result  := S;
  RestLen := Len - Length(s);
  if RestLen < 1 then Exit;
  Result := StringOfChar(Ch, RestLen) + S;
end;

Function InsertaCeroIzq(Longitud:Smallint;Valor:String):String;
begin
  result := Format('%.'+IntToStr(Longitud)+'d', [StrToInt(Valor)]); { Will generate 0005 }
end;
function StrLeftPad(Valor:String;Longitud:Smallint):String;
begin
  result := Format('%.'+IntToStr(Longitud)+'d', [StrToInt(Valor)]); { Will generate 0005 }
end;

Function RemoverCaracter(valor : String; dato:String):String;
begin
  Delete(valor,Length(valor),1);
  Result:=Valor;
end;

function GetCommandParam(const Key:string; Deflt:string=''):string;
var
   iPos:integer;
   i : integer;
begin
   Result := '';
   iPos := Pos(Key, Uppercase(CmdLine) );
   if iPos > 0 then begin
       for i := 1 to ParamCount do begin
           if Uppercase(copy(ParamStr(i), 1, Length(Key))) = Key then begin
               Result := Trim(copy(ParamStr(i), Length(Key)+2, Length(ParamStr(i))-Length(Key)-1));
               Break;
           end;
       end
   end
   else
       Result := Deflt;
end;

Procedure GlbAsignaCuenta(cuenta:String;var cta1:String;var cta2:String;var cta3:String);
begin
  cta1:=MyStrCopyCta(cuenta,1,3);
  cta2:=MyStrCopyCta(cuenta,4,5);
  cta3:=MyStrCopyCta(cuenta,6,7);
end;

procedure LeerDatosIni;
var
  Ini: TIniFile;
  clave : String;
begin
  Ini := TIniFile.Create( ChangeFileExt( Application.ExeName, '.INI' ) );
  try
    if (GlbClaveSupEncrypted = '') then
    GlbClaveSup := Ini.ReadString('Clave', 'Maestra', '')
    else
    GlbClaveSup := GlbClaveSupEncrypted;
  finally
  Ini.Free;
  end;
end;

//verificar secuencias ncf
procedure ProcGlbSecuenciaNCF;
begin
  if Not Assigned(frmCheckNCFSec) Then
  frmCheckNCFSec:=TfrmCheckNCFSec.Create(Nil);
  if Not frmCheckNCFSec.VerificaStatus Then
  begin
    try
      if (not frmCheckNCFSec.VerificaStatus) then
      frmCheckNCFSec.ShowModal;
    finally
    frmCheckNCFSec.Free;
    frmCheckNCFSec:= Nil;
    end;
  end;
end;

{
Function PadLeftCharacter(Longitud:Smallint;Valor:Real;strFill:Char):String;
var
   strValor : String;
  strResult : String[28];
  strMonto  : String;
  LongitudA,LongitudB,x,y:Integer;
begin  //Format('%8.2f', [123.456])
  SetLength(strResult, Longitud);
  FillChar(strResult,Longitud,strFill);
  strValor:=Format('%9.0f', [Valor]);
  strValor:=Trim(strValor);
  LongitudA:=Length(Trim(strValor));
  LongitudB:=Longitud - LongitudA;
  For x:=1 to LongitudB do
  strResult[x]:='0';
  y:=1;
  Inc(LongitudB);
  for x:=LongitudB to Longitud do
  begin
    strResult[x]:=strValor[y];
    Inc(y);
 end;
 Result:=trim(strResult);
end;  }

Function PadLeftCharacterStr(Longitud:Smallint;Valor:string;strFill:Char):String;
var
  strValor  : String;
  strResult : String[6];
  strMonto  : String;
  LongitudA,LongitudB,x,y:Integer;
begin  //Format('%8.2f', [123.456])
  SetLength(strResult, Longitud);
  FillChar(strResult,SizeOf(strResult),strFill);
  strResult:='';
  strValor:=Valor;
  strValor:=Trim(strValor);
  LongitudA:=Length(Trim(strValor));
  LongitudB:=Longitud - LongitudA;
  For x:=1 to LongitudB do
  strResult[x]:='0';
  y:=1;
  Inc(LongitudB);
  for x:=LongitudB to Longitud do
  begin
    strResult[x]:=strValor[y];
    Inc(y);
 end;
  Result:=strResult;
end;

Function PadLeftCharacter(Longitud:Smallint;Valor:Real;strFill:Char):String;
var
  strValor  : String;
  strResult : String[25];
  strMonto  : String;
  LongitudA,LongitudB,x,y:Integer;
begin  //Format('%8.2f', [123.456])
  SetLength(strResult, Longitud);
  FillChar(strResult,SizeOf(strResult),strFill);
  strValor:=Format('%9.0f', [Valor]);
  strValor:=Trim(strValor);
  LongitudA:=Length(Trim(strValor));
  LongitudB:=Longitud - LongitudA;
  For x:=1 to LongitudB do
  strResult[x]:='0';
  y:=1;
  Inc(LongitudB);
  for x:=LongitudB to Longitud do
  begin
    strResult[x]:=strValor[y];
    Inc(y);
 end;
 if (Length(strResult) > Longitud) then
  Result:=Copy(Trim(strResult),0,Longitud)
  else Result:=Trim(strResult);
end;

//function LeftPad(value: string; length:integer=8; pad:char='0'): string;
//begin
//   result := RightStr(StringOfChar(pad,length) + value, length );
//end;

Function IsNumerico(const S: string):Boolean;
var
  P : Pchar;
begin
  P := PChar(S);
  Result := False;
  while P^ <> #0 do
  begin
    if not (p^ in ['0'..'9']) then exit;
    Inc(p)
  end;
  Result:=True;
end;

Function FileToUse(folder:string; xfile:string):String;
var
   x : String;
begin
  if FileExists(xfile) then
  result:=xfile
  else
  x:=StringReplace(ExtractFilePath(Application.ExeName),'bin',folder,[rfIgnoreCase]) + xfile;
  if FileExists(x) then
  Result:= x else Result:='';
end;

procedure IniciaTransaccion(data:TIBDataSet);
Begin
  if Not data.Transaction.InTransaction then
  data.Transaction.StartTransaction;
end;

procedure GuardarIbDataset(data:TIBDataSet);
begin
  Data.ApplyUpdates;
  try
    data.Transaction.Commit;
  except
  Data.Transaction.Rollback;
  end;
end;

function GetMonedaProducto(codigo: Integer):String;
begin
  dmVentas.qryBuscarMonedaProd.Close;
  dmVentas.qryBuscarMonedaProd.Params[0].Value:= codigo;
  dmVentas.qryBuscarMonedaProd.Open;
  if dmVentas.qryBuscarMonedaProdCOD_MONEDA.IsNull then
  result:='1'
  else
  result:= dmVentas.qryBuscarMonedaProdCOD_MONEDA.AsSTring;
end;

function GlbCalcularPrecio(Precio: Currency; codProducto: Integer): Currency;
var
  tasa : Currency;
begin
  tasa := GlbMontoTasa(GetMonedaProducto(codProducto));
  if (tasa > 0) then
  result := Precio * tasa
  else result := precio;
end;

Function PrecioCodigo(strCodigo:String;DataSet : TIBQuery):Real;
var
  x : Integer;
  strValor : String;
begin
  StrValor:='';
  for x:=1 to Length(strcodigo) do
  begin
    if DataSet.Locate('codigo',strCodigo[x],[]) then
    StrValor:=StrValor + Dataset.Fieldbyname('valor').AsString
    else
    begin
      MessageDlg('Letra -'+strCodigo[x]+'- no es válida, verifique ',mtInformation, [mbOK], 0);
      strvalor:='';
      Break;
    end;
  end;
  if (StrValor <> '') then
  result:=StrToFloat(StrValor);
end;

Function PrecioEnLetra(precio : Real;DataSet : TIBQuery):Real;
var
  x : Integer;
  strValor : String;
begin
{  StrValor:='';
  for x:=1 to Length(strcodigo) do
  begin
    if DataSet.Locate('codigo', strCodigo[x],[]) then
    StrValor:=StrValor + Dataset.Fieldbyname('valor').AsString
    else
    begin
      MessageDlg('Letra -'+strCodigo[x]+'- no es válida, verifique ', mtInformation, [mbOK], 0);
      strvalor:='';
      Break;
    end;
  end;
  if StrValor <> '' then
  result:=StrToFloat(StrValor); }
end;

FuncTion  GlbUltimoDiaMes(glbfechaInicial:TDatetime):TDatetime;
var
  a,m,d:Word;
begin
  DecodeDate(glbfechainicial,a,m,d);
  //if (m = 1) then
  //begin
  //  m:=12;
  //  Dec(a);
  //end else Dec(m);
  Result:=EncodeDate(a,m,DiasEnElMes(a,m));
end;

FuncTion  GlbUltimoDiaMesAnt(glbfechaInicial:TDatetime):TDatetime;
var
  a,m,d:Word;
begin
  DecodeDate(glbfechainicial,a,m,d);
  if (m = 1) then
  begin
    m:=12;
    Dec(a);
  end else Dec(m);
  Result:=EncodeDate(a,m,DiasEnElMes(a,m));
end;

FuncTion  GlbPrimerDiaMes(glbfechaInicial:TDatetime):TDatetime;
var
  a,m,d:Word;
begin
  DecodeDate(glbfechainicial,a,m,d);
  //t if (m = 1) then
  //t begin
  //t   m:=12;
  //t   Dec(a);
  //t end else Dec(m);
  Result:=EncodeDate(a,m,1);
end;


Function CtaExiste(cuenta1:String;cuenta2:String;cuenta3:String;Error:Boolean):Boolean;
var
  sqlQuery : TIBQuery;
begin
  if (cuenta1 = '9999999') or (cuenta1 = '999') then
  begin
    glbNombreCta:='';
    exit;
  end;
  sqlQuery:=TIBQuery.Create(Nil);
  //sqlQuery.Database.DatabaseName := dmCon.IBDatabase1.DatabaseName;
  sqlQuery.Database:= dmconectar.IBDatabase1;
  sqlQuery.Sql.Clear;
  sqlQuery.Sql.Text :='Select nombre_cta '+
  ' From catalogo '+
  ' Where cuenta1 = :cuenta1 '+
  ' And cuenta2   = :cuenta2 '+
  ' And cuenta3   = :cuenta3 ';
  sqlQuery.prepare;
  sqlQuery.Params[0].ParamType := ptInput;
  sqlQuery.Params[0].AsString  := cuenta1;
  sqlQuery.Params[1].ParamType := ptInput;
  sqlQuery.Params[1].AsString  := cuenta2;
  sqlQuery.Params[2].ParamType := ptInput;
  sqlQuery.Params[2].AsString  := cuenta3;
  sqlQuery.Open;
  if not sqlQuery.FieldByName('nombre_cta').IsNull then
  glbNombreCta:=sqlQuery.FieldByName('nombre_cta').Value
  else
  glbNombreCta:='Cuenta '+cuenta1+'-'+cuenta2+'-'+cuenta3+'-'+'no existe';
  
  if sqlquery.RecordCount > 0 then
  Result := True else
  begin
    Result := False;
    if error then
    MessageDlg('Cuenta '+cuenta1+'-'+cuenta2+'-'+cuenta3+'-'+'no existe',mtError,[mbOk],0);
  end;
  sqlQuery.Close;
  sqlQuery.Free;
  sqlQuery:=Nil;
end;

Function  GetNumConsignacion(numTrn:Integer):Integer;
var
  sqlQuery : TIBQuery;
begin
  sqlQuery:=TIBQuery.Create(Nil);
  sqlQuery.Database:= dmconectar.IBDatabase1;
  sqlQuery.Sql.Clear;
  sqlQuery.Sql.Text :='Select numero_factura'+
  ' From ventas_mast_consigna '+
  ' Where numero = :numtrn ';
  sqlQuery.prepare;
  sqlQuery.Params[0].ParamType := ptInput;
  sqlQuery.Params[0].AsInteger := numTrn;
  sqlQuery.Open;
  if sqlQuery.FieldByName('numero_factura').IsNull then
  result := -1 else
  result:=sqlQuery.FieldByName('numero_factura').AsInteger;
  sqlQuery.Close;
  sqlQuery.Free;
  sqlQuery:=Nil;
end;
Function GlbPermiteDato(sistema:integer;subsistema:integer;ciakey:Integer;Fecha:TDateTime):Boolean;
var
  sqlQuery : TIBSQL;
  tFecha :Tdatetime;
  tanio,tmes,tdia:word;
  anio,mes,dia:word;
  auxi:integer;
  Error:Boolean;
  AnioPeriodoF : Word;
begin
  Result:=False;
  sqlQuery:= TIBSQL.Create(Nil);
  sqlQuery.Database:= dmConectar.IBDatabase1;
  sqlQuery.Sql.Clear;
  sqlQuery.Sql.Text :='Select sistema, fecha_Act, status  '+
  ' From control '+
  ' Where sistema = :sistema '+
  ' And sub_sistema = :subsistema '+
  ' And cod_cia = :ciakey';
  if not sqlQuery.prepared then
  sqlQuery.Prepare;
  sqlQuery.Params[0].AsInteger    := sistema;
  sqlQuery.Params[1].AsInteger := subsistema;
  sqlQuery.Params[2].AsInteger := ciakey;
  sqlQuery.ExecQuery;
  sqlQuery.CheckOpen;
  if sqlQuery.Open then
  begin
  error:=false;
  if sqlQuery.RecordCount = 1 then
  begin
    DecodeDate(sqlquery.fieldbyname('fecha_Act').Value,tanio,tmes,tdia);
    DecodeDate(Fecha,anio,mes,dia);
    Result:=True;
    if (tmes = mes) and (sqlquery.Fieldbyname('Status').Value = 'R') then
    begin
      Messagedlg('Mes Cerrado, verifique',mtError,[mbok],0);
      Error := true;
      Result := False;
      Inc(GlbContError);
    end;
    if dmCompania.tblCompania.State = dsInactive then
    dmCompania.tblCompania.open;
    dmCompania.tblCompania.Locate('codigo',glbCia_Key,[]);    
    AnioPeriodoF:=StrToInt(FormatDateTime('yyyy',dmCompania.tblCompaniaFECHAI_ACT.Value));
    auxi:=tmes;
    if auxi = 12 then auxi:=1;
    if (auxi > mes) And (AnioPeriodoF = Anio) then
    begin
      Messagedlg('Mes es menor que el último mes cerrado, verifique',mterror,[mbok],0);
      Result := False;
      Error:=true;
      Inc(GlbContError);
    end;
    if (DiasEnElMes(tanio,tmes) = tdia) and
       (sqlquery.Fieldbyname('Status').Value = 'R') then
    Begin
      Inc(tmes);
      tdia:=1;
    end;
    if (tmes = mes ) And (tdia > dia) then
    Begin
      Messagedlg('Dia es menor que el último dia posteado, verifique',mterror,[mbok],0);
      Error := True;
      Inc(GlbContError);
    end;
    if (anio <> AnioPeriodoF) and (sistema = 1) and (subsistema = 0) then
    begin
      Result := False;
      Error:=True;
      Messagedlg('Año difiere de período fiscal, verifique',mtError,[mbok],0);
      Inc(GlbContError);
    end;
    dmControl.qryControlDet.Close;
    dmControl.qryControlDet.Filtered:=false;
    dmControl.qryControlDet.params[0].value := sistema;
    dmControl.qryControlDet.params[1].value := subsistema;
    dmControl.qryControlDet.params[2].value := ciakey;
    dmControl.qryControlDet.open;
    if dmControl.qryControlDet.Locate('FECHA_ACT',ExtraerFecha(fecha),[]) then
    begin
      Messagedlg('Dia posteado, verifique',mtError,[mbok],0);
      Result := false;
      Inc(GlbContError);
    end else Result := true;
    if Error then
    Result := False;
    dmControl.qryControlDet.Close;
  end else
  Begin
    Messagedlg('Sistema ='+InttoStr(sistema)+' SubSistema ='+InttoStr(SubSistema)+' Cia'+InttoStr(ciakey)+'no contemplado en Control, verifique',mterror,[mbok],0);
    Result := False;
    Inc(GlbContError);
  end;
  end;
  sqlQuery.Free;
  sqlQuery:=Nil;
end;


FuncTion DiasEnElMes(anio : Integer; Mes : Integer):Smallint;
var
  a : string;
begin
  Result := MonthDays[IsLeapYear(anio), mes];
  a:='string';
end;

Function  FGlbPorcItbiXID(Fecha:TDateTime; idTasa:integer):Real;
begin
  dmVentas.qryBuscarTasaItbis.Close;
  dmVentas.qryBuscarTasaItbis.Params[0].Value := ExtraerFecha(Fecha);
  dmVentas.qryBuscarTasaItbis.Open;
  if dmVentas.qryBuscarTasaItbis.Locate('IDTASAITBIS',idTasa,[]) then
  begin
    GlbSimboloTasaITBIS := dmVentas.qryBuscarTasaItbisSIMBOLO_TASA.Value;
    GlbIDTasa := dmVentas.qryBuscarTasaItbisIDTASAITBIS.Value;
    Result:= dmVentas.qryBuscarTasaItbisPORCIENTO.Value;
  end else
  begin
    GlbSimboloTasaITBIS := 'E';
    GlbIDTasa := 0;
    Result:= 0;
  end;
end;

Function  FGlbPorcItbi(Fecha:TDateTime; xcodprod :integer):Real;
begin
  if (xcodprod < 0) then
  begin
    dmVentas.QryBuscarITBIGlobal.Close;
    dmVentas.QryBuscarITBIGlobal.Params[0].Value:=ExtraerFecha(Fecha);
    dmVentas.QryBuscarITBIGlobal.Open;
    GlbSimboloTasaITBIS := '';
    Result:=dmVentas.QryBuscarITBIGlobalPORCIENTO.Value;
    dmventas.qryTasaItbis.Close;
    dmventas.qryTasaItbis.Open;
    if dmventas.qryTasaItbis.Locate('PORCIENTO',dmVentas.QryBuscarITBIGlobalPORCIENTO.Value, []) then
    begin
      GlbIDTasa := dmventas.qryTasaItbisIDTASAITBIS.Value;
      GlbSimboloTasaITBIS := dmventas.qryTasaItbisSIMBOLO_TASA.Value;
      GlbPorcItbis := dmventas.qryTasaItbisPORCIENTO.Value;
    end else GlbIDTasa:=0;
  end else
  begin
    dmVentas.qryitbi.Close;
    dmVentas.qryitbi.Params[0].Value:=xCodProd;
    dmVentas.qryitbi.Params[1].Value:=ExtraerFecha(Fecha);
    dmVentas.qryitbi.Open;
    GlbSimboloTasaITBIS := dmVentas.qryitbiSIMBOLO_TASA.Value;
    GlbIDTasa := dmVentas.qryitbiIDTASAITBIS.Value;
    Result:=dmVentas.qryitbiPORCIENTO.Value;
    GlbPorcItbis := dmVentas.qryitbiPORCIENTO.Value;
  end;
end;


procedure PatchINT3;
var
  NOP : Byte;
  NTDLL: THandle;
  BytesWritten: DWORD;
  Address: Pointer;

begin
  if Win32Platform <> VER_PLATFORM_WIN32_NT then Exit;
  NTDLL := GetModuleHandle('NTDLL.DLL');
  if NTDLL = 0 then Exit;
  Address := GetProcAddress(NTDLL, 'DbgBreakPoint');
  if Address = nil then Exit;
  try
    if Char(Address^) <> #$CC then Exit;

    NOP := $90;
    if WriteProcessMemory(GetCurrentProcess, Address, @NOP, 1, BytesWritten) and
      (BytesWritten = 1) then
      FlushInstructionCache(GetCurrentProcess, Address, 1);
  except
    //Do not panic if you see an EAccessViolation here, it is perfectly harmless!
    on EAccessViolation do ;
    else raise;
  end;
end;

{ Standard Encryption algorithm - Copied from Borland}


{
function Encriptar(const S: String; Key: Integer): String;
var
  I: byte;
begin
  SetLength(Result,Length(S));
  for I := 1 to Length(S) do
  begin
    Result[I] := char(byte(S[I]) xor (Key shr 8));
    Key := (byte(Result[I]) + Key) * C1 + C2;
  end;
end; }

//C1 = 52845;
//C2 = 11719;
function Encriptar(const S: String; Key: Int64): String;
var
  I: Integer;
begin
  SetLength(Result, Length(S));
  for I := 1 to Length(S) do
  begin
    Result[I] := Char(Byte(S[I]) xor ((Key shr 8) and $FF));
    Key := ((Byte(Result[I]) + Key) * C1 + C2) mod $7FFFFFFF;
  end;
end;

function Desencriptar(const S: String; Key: Int64): String;//Word
var
  I: byte;
begin
  if (s = '') then result:='';
  SetLength(Result,Length(S));
  for I := 1 to Length(S) do
  begin
    Result[I] := char(byte(S[I]) xor (Key shr 8));
    Key := (byte(S[I]) + Key) * C1 + C2;
  end;
end;



// Por ejemplo, para encriptar el texto de Label1:
// Label1.Caption:= Encrypt(Label1.Caption,6474);
// Y para desencriptarla:
// Label1.Caption:= Decrypt(Label1.Caption,6474);


Function VerificaCierreDia(Sistema:Integer;SubSistema:Integer;
                            CiaKey:Integer;Fecha:TDateTime; Var FechaAct:TDatetime):Boolean;
var
  sqlQuery : TIBSQL;
  tFecha :TDatetime;
begin
  sqlQuery:=TIBSQL.Create(Nil);
  if not  dmConectar.IBTransaction1.Active then
  dmConectar.IBTransaction1.Active:=true;
  sqlQuery.Transaction:=dmConectar.IBTransaction1;
  sqlQuery.Database:= dmConectar.IBDatabase1;
  sqlQuery.Sql.Clear;
  sqlQuery.Sql.Text :='Select sistema, fecha_Act, status  '+
  ' From control '+
  ' where sistema = :sistema '+
  ' and sub_sistema = :subsistema '+
  ' and cod_cia = :ciakey';
  sqlQuery.Params[0].AsInteger := sistema;
  sqlQuery.Params[1].AsInteger := subsistema;
  sqlQuery.Params[2].AsInteger := ciakey;
  sqlQuery.prepare;
  sqlQuery.ExecQuery;
  sqlQuery.CheckOpen;
  if sqlQuery.Open then
  begin
  if sqlQuery.RecordCount = 1 then
  begin
    tfecha  := sqlquery.fieldbyname('fecha_Act').Value;
    FechaAct:= sqlquery.fieldbyname('fecha_Act').Value;
    if (fecha > tFecha) then Result := True else Result:=False;
  end else
  begin
    ShowMessage(IntToStr(sistema)+' sistema no encontrado en tabla control, verifique');
    Result := False;
  end;
  end;
  sqlQuery.Free;
  sqlQuery:=Nil;
end;

function generanumerocks: LongInt;
begin
  dmcks.stpnumcks.close;
  dmcks.stpnumcks.params[0].Value:=1; // glbTipoCks;
  dmcks.stpnumcks.params[1].Value:='sec_num_cks';//tabla
  dmcks.stpnumcks.Params[2].Value:=glbNumcks;//asigna numero inicia cheque
  dmcks.stpnumcks.Params[3].Value:=glbBancos;
  dmcks.stpnumcks.ExecProc;
  Result:=dmcks.stpnumcks.params[4].Value;//numero cheque
end;

function generaproxnumcks: LongInt;
begin
  dmcks.stpnumcks.close;
  dmcks.stpnumcks.params[0].Value:=1; //glbTipoCks;
  dmcks.stpnumcks.params[1].Value:='sec_num_cks';//tabla
  dmcks.stpnumcks.Params[2].Value:=0;//incrementa numero de ck
  dmcks.stpnumcks.Params[3].Value:=glbBancos;
  dmcks.stpnumcks.ExecProc;
  Result:=dmcks.stpnumcks.params[4].Value;//numero cheque
end;

Function glbProcGetNumcks(nombproc:string;tipo:smallint;codbanco:integer):LongInt;//ultimo numero de cheque
begin
  dmcks.stpNumcks.close;
  dmcks.stpNumcks.params[0].Value:=tipo;
  dmcks.stpNumcks.params[1].Value:='SEC_NUM_CKS';
  dmcks.stpNumcks.params[2].Value:=-1;//devuelve el numero actual
  dmcks.stpnumcks.Params[3].Value := codbanco;//codigo banco  
  dmcks.stpNumcks.ExecProc;
  Result:=dmcks.stpNumcks.params[4].Value+1;//le suma uno al numero actual
end;

Function glbProcActNumcks(nombproc:string;tipo:smallint):LongInt;//ultimo numero de cheque
begin
  dmcks.stpNumcks.close;
  dmcks.stpNumcks.params[0].Value:=tipo;
  dmcks.stpNumcks.params[1].Value:='SEC_NUM_CKS';
  dmcks.stpNumcks.params[2].Value:=0;//incrementa numero actual
  dmcks.stpNumcks.ExecProc;
  Result:=dmcks.stpNumcks.params[3].Value;
end;

procedure GlbSalvarQuery(Tabla:TIBDataSet);
begin
  if tabla.State in [dsEdit,dsInsert] then
  begin
    if not tabla.Transaction.InTransaction then
    tabla.Transaction.StartTransaction;
    tabla.Post;
    if  tabla.UpdatesPending then
    begin
      tabla.applyupdates;
    end;
    try
      tabla.Transaction.CommitRetaining;
    except
      tabla.Transaction.RollbackRetaining;
    end;
  end;
  if  tabla.UpdatesPending then
  begin
    if not tabla.Transaction.InTransaction then
    tabla.Transaction.StartTransaction;
    tabla.ApplyUpdates;
    try
      tabla.Transaction.CommitRetaining;
    except
      tabla.Transaction.RollbackRetaining;
    end;
  end;
end;

//Inserta una coma Eje.: 5450426 = 5,450,426
Function InsertarComa(fuente:String):String;
 var
   ContC,x,y,z :Integer;
   auxi  :string;
   Inicia:boolean;
   ControlaSigno:string;
begin
  y:=-1;
  z:=0;
  ContC:=0;
  Fuente:=Trim(fuente);
  z:=Length(fuente);
  if z <= 4 then
  begin
    Result:= fuente;
    exit;
  end;
  z:=0;
  for x:=Length(fuente) downto 1  do
  begin
     if fuente[x] = '.' then
    Inicia := true;
    Auxi:=Auxi + Fuente[x];
    if Inicia then
    y:=0;
    if y = 0 then
    Inc(z) else z:=0;
    if z = 4 then
    begin
      Inc(ContC);
      if x > 1 then
      auxi:= auxi+',';
      if contc > 0   then
      z:=1 else z:=0;
    end;
  end;
  Result:='';
  z:=0;
  for x:=Length(auxi) downto 1 do
  begin
    Inc(z);
    if z = 1 then
    ControlaSigno:= auxi[x];
    if (controlaSigno = '-') and (z = 2) and (auxi[x] = ',') then
    y:=0 else
    Result:=Result+ auxi[x];
  end;
end;

Function IdiomadeWindows:string;
var
  ID:LangID;
  Language: array [0..100] of char;
begin
  ID:=GetSystemDefaultLangID;
  VerLanguageName(ID,Language,100);
  Result:=String(Language);
end;

//Long1 = 0 para copiar desde el Inicio
//Long2 = indica cuantos caracteres se copiaran
Function  MyStrCopyRango(Fuente:String;Desde:Integer;Hasta:Integer):String;
var x :Integer;
begin
  Result:='';
  for x:=1 To Length(Fuente) Do
  begin
    if Desde <= Hasta then
    begin
      Result:=Result + fuente[Desde];
      Inc(Desde);
    end else exit;
  end;
end;

Function  MyStrCopyCta(Fuente:String;Desde:Integer;Hasta:Integer):String;
var x :Integer;
begin
  Result:='';
  for x:=1 To Length(Fuente) Do
  begin
    if Desde <= Hasta then
    begin
      Result:=Result + fuente[Desde];
      Inc(Desde);
    end else exit;
  end;
end;

function CalCHora(horai, horaf: TDatetime): Integer;
var
    hora1, min1, sec1,mil1 :word;
    hora2, min2, sec2,mil2 :word;
    YearI, MonthI, DayI,
    Year1, Month1, Day1:word;
    x:Integer;
begin
  //1-23
  //1-11 AM
  //12-23PM
  //horai = 15    06
  //horaf = 02    10
  // 2-3 3-4 4-5 5-6 6-7 7-8 8-9 9-10
  //10-11 11-12 12-1 1-2
  Decodetime(Horai,Hora1,min1,sec1,mil1);
  Decodetime(Horaf,Hora2,min2,sec2,mil2);
  DecodeDate(Horai, YearI, MonthI, DayI);
  DecodeDate(horaf, Year1, Month1, Day1);
  if (MonthI = 12) and (Month1 = 1) then
     Result := 24 - hora1+ hora2
    else if Month1 > MonthI then
    Result := 24 - hora1 + hora2
    else if (hora2 <= 12)  and (day1 > dayI) then
    Result := 24 - hora1 + hora2
    else if ( Day1 = DayI ) then
    Result := hora2 - hora1 else
    Result := 24 - hora1 + hora2;
end;


procedure  ActualizaCodUsrCaja(numeroTrnVta:integer);
begin
  dmventas.tblVtaMast.Close;
  dmventas.tblVtaMast.Params[0].Value:= numeroTrnVta;
  dmventas.tblVtaMast.Open;
  if (dmventas.tblVtaMast.RecordCount = 1) And
  (dmventas.tblVtaMastCOD_USR_CAJA.IsNull) then
  begin
    dmventas.tblVtaMast.Edit;
    dmventas.tblVtaMastCOD_USR_CAJA.Value:= VarUsuarioGlb;
    GlbSalvarQuery(dmventas.tblVtaMast);
  end;
end;

Function sqlNombreAbr(vCodigo:Integer): String;
Function Palabras(Cadena:string):integer;
var
   n:integer;
   AntEspacio:boolean;
begin
  AntEspacio:=FALSE;
  if Cadena='' then Result:=0 else Result:=1;
  for n:=1 to Length(Cadena) do
  begin
    if AntEspacio and  (Cadena[n]<>' ') then Inc(Result);
       AntEspacio:=(Cadena[n]=' ');
  end;
end;
//**
var
  S,R: String;
  Count,X,Y,Z: Integer;
  qryEmp : TIBQuery;
begin
  qryEmp := TIBQuery.Create(nil);
  qryEmp.Database := dmconectar.IBDatabase1;
  qryEmp.sql.clear;
  qryEmp.sql.add('SELECT * FROM EMPLEADO Empleados');
  qryEmp.sql.add('Where Codigo =:vCodigo');
  qryEmp.Params[0].ParamType := ptInput;
  qryEmp.Params[0].DataType  := ftInteger;
  qryEmp.Params[0].Value     := vCodigo;
  qryEmp.Open;
  if qryEmp.fieldbyname('Nombre').IsNull then
  begin
    result:='';
    exit;
  end;
  S:=qryEmp.fieldbyname('Nombre').Value;
  count := pos(' ',S);
  Z := Palabras(S);
  if Z >= 2 Then
     begin
       while count > 0 do
         Begin
           X := count + 2;
           delete(S,X,30);
           Break;
         End;
         R:= S + '. ';
     End
  Else
  if Z < 2 Then
     Begin
       while count > 0 do
         Begin
           X := count + 1;
           delete(S,X,30);
           Break;
         End;
         R:= S+' ';
     End;
  if qryEmp.fieldbyname('Apellido').IsNull then
  Result:=R + ' *** '
  else
  Result := R + qryEmp.fieldbyname('Apellido').Value;
End;

Function FRangoFechaNominaContratista(Fecha : TDatetime; Var FechaNom:TDatetime):String;
var
  Ano, Mes, Dia : Word;
  StrFechaIni, StrFechaFin : String;
begin
  dmControl.qryControl.Close;
  dmControl.qryControl.Open;
  if dmControl.qryControl.Locate('SISTEMA;SUB_SISTEMA;COD_CIA',
                          VarArrayOf([5, 6, GlbCodigoCia]),[]) then
  begin
    Fecha:=ExtraerFecha(dmControl.qryControlFECHA_ACT.Value) + 15;
    FechaNom:=Fecha;
    DecodeDate(dmControl.qryControlFECHA_ACT.Value, Ano, Mes, Dia);
    StrFechaIni := 'Del '+FormatDateTime('dd', dmControl.qryControlFECHA_ACT.Value + 1);
    DecodeDate(Fecha, Ano, Mes, Dia);
    StrFechaFin := FormatDateTime('dd', Fecha) + ' ' +
    NombreMesCorto[StrToInt(FormatDateTime('mm', Fecha))]+', '+
                            FormatDateTime('YYYY', Fecha);
    Result:=StrFechaIni + ' al ' + StrFechaFin;
  end else
  begin
    MessageDlg('Sistema 5 and sub_sistema 6, no ha sido configurado, verifique.',mtWarning,[mbok],0);
  end;
end;

Function GlbRangoFechaNomina(Fecha : TDatetime; Var FechaIni:TDatetime;Var Fechafin:TDatetime): Boolean;
var
  Ano, Mes, Dia : Word;
  test:string;
begin
  test:='Fecha='+DateToStr(fecha);
  dmControl.qryControl.Close;
  dmControl.qryControl.Open;
  if dmControl.qryControl.Locate('SISTEMA;SUB_SISTEMA;COD_CIA',
                          VarArrayOf([5,1,GlbCodigoCia]),[]) then
  begin
    Fecha:=ExtraerFecha(Fecha);
    DecodeDate(Fecha, Ano, Mes, Dia);
    if (glbDNomina = 2) and (Dia = 15)  then
    FechaIni:= EncodeDate(Ano,Mes,1)
    else
    if (glbDNomina = 2) and (Dia = 30)  then
    FechaIni:= EncodeDate(Ano,Mes,16);

    //if (glbDNomina = 2) and (Dia = 15)  then
    Fechafin:=EncodeDate(Ano,Mes,Dia);
    test:=test+ ' FechaIni ='+DateToStr(FechaIni)+' FechaFin ='+DateToStr(Fechafin);
    Result:=true;
  end else
  begin
    Result:=False;
    MessageDlg('Sistema 5 and sub_sistema 1, no ha sido configurado, verifique.',mtWarning,[mbok],0);
  end;

end;

Function FRangoFechaNomina(Fecha : TDatetime; Var FechaNom:TDatetime):String;
var
  Ano, Mes, Dia : Word;
  StrFechaIni, StrFechaFin : String;
begin
  dmControl.qryControl.Close;
  dmControl.qryControl.Open;
  if dmControl.qryControl.Locate('SISTEMA;SUB_SISTEMA;COD_CIA',
                          VarArrayOf([5,1,GlbCodigoCia]),[]) then
  begin
    Fecha:=ExtraerFecha(dmControl.qryControlFECHA_ACT.Value)+15;
    FechaNom:=Fecha;
    DecodeDate(dmControl.qryControlFECHA_ACT.Value, Ano, Mes, Dia);
    StrFechaIni := 'Del '+FormatDateTime('dd', dmControl.qryControlFECHA_ACT.Value + 1);
    DecodeDate(Fecha, Ano, Mes, Dia);
    StrFechaFin := FormatDateTime('dd', Fecha) + ' '+
    NombreMesCorto[StrToInt(FormatDateTime('mm', Fecha))]+', '+
                                           FormatDateTime('YYYY', Fecha);
    Result:=StrFechaIni + ' al ' + StrFechaFin;
  end else
  begin
    MessageDlg('Sistema 5 and sub_sistema 1, no ha sido configurado, verifique.',mtWarning,[mbok],0);
  end;
end;

Procedure ProcFechaIniComNomina(Var xFechaIni: TDatetime);
var
  Ano, Mes, Dia : Word;
  StrFechaIni, StrFechaFin : String;
begin
  dmControl.qryControl.Close;
  dmControl.qryControl.Open;
  if dmControl.qryControl.Locate('SISTEMA;SUB_SISTEMA;COD_CIA',
                          VarArrayOf([5,1,GlbCodigoCia]),[]) then
  begin
    xFechaIni:=ExtraerFecha(dmControl.qryControlFECHA_ACT.Value)+1;
  end else
  begin
    MessageDlg('Sistema 5 and sub_sistema 1, no ha sido configurado, verifique.',mtWarning,[mbok],0);
  end;
end;

Function sqlConsulta(tabla:string;campo:string;condicion:string;valor:String): Boolean;
var
  qry : TIBSQL;
begin
  qry := TIBSQL.create(nil);
  qry.Database:= dmConectar.IBDatabase1;
  qry.sql.Clear;
  qry.SQL.Text :='Select '+campo+' from '+tabla+' where '+campo+' '+condicion+' '+chr(39)+valor+chr(39);
  qry.ExecQuery;
  qry.CheckOpen;
  if qry.open then
  begin
  If qry.RecordCount > 0 then
  Result := true
  else Result := False;
  end;
  qry.Close;
  qry.free;
end;

Function sqlUpdate(tabla:string;campo:string;condicion:string;valorOld:String;nuevoValor:string): Boolean;
var
  qry : TIBSQL;
begin
  qry := TIBSQL.create(nil);
  qry.Database:= dmConectar.IBDatabase1;
  qry.sql.Clear;
  qry.SQL.Text :='Update '+Tabla+' set '+campo+'='+nuevovalor+
                ' Where '+Condicion+Chr(39)+valorOld+Chr(39);
  qry.ExecQuery;
  //qry.CheckOpen;
  if not qry.Transaction.InTransaction then
  qry.Transaction.StartTransaction;
  try
    qry.Transaction.Commit;
  except
  qry.Transaction.Rollback;
  end;
  qry.free;
end;

Function ExtraerFecha(Fecha : TDatetime) : TDatetime;
begin
  Result := StrToDate(FormatDatetime(ShortDateFormat, fecha));
end;

{
Para utilizarla basta con:
  if emailValido ('ajpdsoft@ajpdsoft.com') then
    showmessage('El E-Mail es correcto')
  else
    showmessage('El E-Mail NO es correcto');
}
FUNCTION emailValido(CONST Value: String): boolean;
  FUNCTION CheckAllowed(CONST s: String): boolean;
  VAR i: Integer;
  BEGIN
  Result:= False;
  FOR i:= 1 TO Length(s) DO // illegal char in s -> no valid address
  IF NOT (s[i] IN ['a'..'z','A'..'Z','0'..'9','_','-','.']) THEN Exit;
  Result:= true;
  END;
VAR
  i,len: Integer;
  namePart, serverPart: String;
BEGIN // of IsValidEmail
  Result:= False;
  i:= Pos('@', Value);
  IF (i=0) OR (Pos('..',Value) > 0) THEN Exit;
  namePart:= Copy(Value, 1, i - 1);
  serverPart:= Copy(Value,i+1,Length(Value));
  len:=Length(serverPart);
  // must have dot and at least 3 places from end, 2 places from begin
  IF (len<4) OR
     (Pos('.',serverPart)=0) OR
     (serverPart[1]='.') OR
     (serverPart[len]='.') OR
     (serverPart[len-1]='.') THEN Exit;
  Result:= CheckAllowed(namePart) AND CheckAllowed(serverPart);
END;

Function ExtraerHora(Hora: TDatetime) : TDateTime;
begin
  Result := StrToTime(FormatDatetime('hh:mm:ss',hora));
end;

Function FsqlMaxNumeroFactura(Generador:string): Integer;
var
  qryMax : TIBQuery;
begin
  //Select Gen_id(GEN_NUM_COTIZA_MAST,1) From rdb$database
  qryMax := TIBQuery.create(nil);
  qryMax.Database:= dmConectar.IBDatabase1;
  qryMax.Sql.Clear;
  qryMax.SQL.Text:='Select Gen_id('+generador+',1) NumMax'+' From rdb$database';
  qryMax.Open;
  Result := qryMax.fieldbyname('NumMax').AsInteger;
  qryMax.Close;
  qryMax.free;
end;

Function FsqlMaxNumero(tabla:string;campo:string): Integer;
var
  qryMax : TIBQuery;
begin
  qryMax := TIBQuery.create(nil);
  qryMax.Database:= dmConectar.IBDatabase1;
  qryMax.Sql.Clear;
  qryMax.SQL.Text:='Select max('+campo+') NumMax'+' from '+tabla;
  qryMax.Open;
  Result := qryMax.fieldbyname('NumMax').AsInteger + 1;
  qryMax.Close;
  qryMax.free;
end;

Function SetLogoCia(var _imagen:String):Boolean;
var
  xGrafico : String;
begin
  result := False;
  if dmCompania.tblCompania.State = dsInactive then
  dmCompania.tblCompania.Open;
  if dmCompania.tblCompania.Locate('codigo', GlbCodigoCia,[]) then
  begin
    if FileExists(dmCompania.tblCompaniaLOGOCIA.Value) then
    begin
      if (Length(dmCompania.tblCompaniaLOGOCIA.Value) > 0) then
      begin
        _imagen:=dmCompania.tblCompaniaLOGOCIA.Value;
        result := True;
      end;
    end else
    begin
      xGrafico:=FileToUse('Grafico','Logo.jpg');
      if (xGrafico <> '') then
      begin
        _imagen := xGrafico;
        result := True;
      end else
      begin
        xGrafico:=FileToUse('Grafico','LogoNoSetup.jpg');
        _imagen := xGrafico;
        result := True;
      end;
    end;
  end;
end;

//Leer las dimensiones de imágenes JPG, PNG y GIF
//Si estáis pensando en crear un visor de fotografías aquí os traigo tres procedimientos que leen al ancho y alto de imagenes con extensión JPG, PNG y GIF leyendo los bytes de su cabecera. No hay para BMP ya que se puede hacer con un componente TImage.

//Antes de nada hay que incluir una función que lee los enteros almacenados en formato del procesador motorola, que guarda los formatos enteros en memoria al contrario de los procesadores Intel/AMD:

function LeerPalabraMotorola( F: TFileStream ): Word;
type
  TPalabraMotorola = record
    case Byte of
      0: ( Value: Word );
      1: ( Byte1, Byte2: Byte );
  end;
var
  MW: TPalabraMotorola;
begin
  F.Read( MW.Byte2, SizeOf( Byte ) );
  F.Read( MW.Byte1, SizeOf( Byte ) );
  Result := MW.Value;
end;
//El siguiente procedimiento toma como parámetros la ruta y nombre de una imagen JPG, y dos variales enteras donde se almacenará el ancho y alto de la imagen:

procedure DimensionJPG( sArchivo: string; var wAncho, wAlto: Word );
const
  ValidSig: array[0..1] of Byte = ($FF, $D8);
  Parameterless = [$01, $D0, $D1, $D2, $D3, $D4, $D5, $D6, $D7];
var
  Sig: array[0..1] of byte;
  F: TFileStream;
  x: integer;
  Seg: byte;
  Dummy: array[0..15] of byte;
  Len: word;
  iLongitudLinea: LongInt;
begin
  FillChar( Sig, SizeOf( Sig ), #0 );

  F := TFileStream.Create( sArchivo, fmOpenRead );
  try
    iLongitudLinea := F.Read( Sig[0], SizeOf( Sig ) );

    for x := Low( Sig ) to High( Sig ) do
      if Sig[x] <> ValidSig[x] then
        iLongitudLinea := 0;

    if iLongitudLinea > 0 then
    begin
      iLongitudLinea := F.Read( Seg, 1 );

      while ( Seg = $FF ) and ( iLongitudLinea > 0 ) do
      begin
        iLongitudLinea := F.Read( Seg, 1 );

        if Seg <> $FF then
        begin
          if ( Seg = $C0 ) or ( Seg = $C1 ) then
          begin
            iLongitudLinea := F.Read( Dummy[0], 3 ); // Nos saltamos estos bytes
            wAlto := LeerPalabraMotorola( F );
            wAncho  := LeerPalabraMotorola( F );
          end
          else
          begin
            if not ( Seg in Parameterless ) then
            begin
              Len := LeerPalabraMotorola( F );
              F.Seek( Len - 2, 1 );
              F.read( Seg, 1 );
            end
            else
              Seg := $FF; { Fake it to keep looping. }
          end;
        end;
      end;
    end;
  finally
    F.Free;
  end;
end;

//Lo mismo para una imagen PNG:

procedure DimensionPNG( sArchivo: string; var wAncho, wAlto: Word );
type
  TPNGSig = array[0..7] of Byte;
const
  ValidSig: TPNGSig = (137,80,78,71,13,10,26,10);
var
  Sig: TPNGSig;
  F: TFileStream;
  x: Integer;
begin
  FillChar( Sig, SizeOf( Sig ), #0 );
  F := TFileStream.Create( sArchivo, fmOpenRead );
  try
    F.read( Sig[0], SizeOf( Sig ) );

    for x := Low( Sig ) to High( Sig ) do
      if Sig[x] <> ValidSig[x] then
        Exit;

    F.Seek( 18, 0 );
    wAncho := LeerPalabraMotorola( F );
    F.Seek( 22, 0 );
    wAlto := LeerPalabraMotorola( F );
  finally
    F.Free;
  end;
end;

//Y para una imagen GIF:

procedure DimensionGIF( sArchivo: string; var wAncho, wAlto: Word );
type
  TCabeceraGIF = record
    Sig: array[0..5] of char;
    ScreenWidth, ScreenHeight: Word;
    Flags, Background, Aspect: Byte;
  end;

  TBloqueImagenGIF = record
    Left, Top, Width, Height: Word;
    Flags: Byte;
  end;
var
  F: file;
  Cabecera: TCabeceraGIF;
  BloqueImagen: TBloqueImagenGIF;
  iResultado: Integer;
  x: Integer;
  c: char;
  bEncontradasDimensiones: Boolean;
begin
  wAncho  := 0;
  wAlto := 0;

  if sArchivo = '' then
    Exit;

  {$I-}
  FileMode := 0;   // Sólo lectura
  AssignFile( F, sArchivo );
  Reset( F, 1);
  if IOResult <> 0 then
    Exit;

  // Lee la cabecera y se asegura de que sea un archivo válido
  BlockRead( F, Cabecera, SizeOf( TCabeceraGIF ), iResultado );

  if ( iResultado <> SizeOf( TCabeceraGIF ) ) or ( IOResult <> 0 ) or
     ( StrLComp( 'GIF', Cabecera.Sig, 3 ) <> 0 ) then
  begin
    Close( F );
    Exit;
  end;

  { Skip color map, if there is one }
  if ( Cabecera.Flags and $80 ) > 0 then
  begin
    x := 3 * ( 1 shl ( ( Cabecera.Flags and 7 ) + 1 ) );
    Seek( F, x );
    if IOResult <> 0 then
    begin
      Close( F );
      Exit;
    end;
  end;

  bEncontradasDimensiones := False;
  FillChar( BloqueImagen, SizeOf( TBloqueImagenGIF ), #0 );

  BlockRead( F, c, 1, iResultado );
  while ( not EOF( F ) ) and ( not bEncontradasDimensiones ) do
  begin
    case c of
      ',': // Encontrada imagen
        begin
          BlockRead( F, BloqueImagen, SizeOf( TBloqueImagenGIF ), iResultado );
          if iResultado <> SizeOf( TBloqueImagenGIF ) then
          begin
            Close( F );
            Exit;
          end;

          wAncho := BloqueImagen.Width;
          wAlto := BloqueImagen.Height;
          bEncontradasDimensiones := True;
        end;
       
      'ÿ': // esquivar esto
        begin
          // Nada
        end;

      // No hacer nada, ignorar
    end;

    BlockRead( F, c, 1, iResultado );
  end;

  Close( F );
  {$I+}
end;

Procedure PreparaArchivoEmail(smtpserver:string;
  smtpport:string;
  smtpuser:string;
  smtppassword:string;
  FECHA :TDateTime;
  TOEMAIL: string;
  FROMEMAIL: string;
  SUBJECT: string;
  _body : string;
  CCopy : String;
  nombrearchivo:string;
  replayto:string;var nFileEmail:String);
var
  fName : string;
  myFile : TextFile;
begin
  //crear archivo para email
  fName:= ExtractFilePath(Application.ExeName)+'EmailFile'+IntToStr(GetRandomNumber(VarUsuarioGlb))+'.dat';
  nFileEmail := fName;
  
  AssignFile(myFile, fName);
  ReWrite(myFile);
 
  Writeln(myFile,'smtpserver|'+smtpserver);
  Writeln(myFile,'smtpport|'+smtpport);
  Writeln(myFile,'smtpuser|'+smtpuser);
  Writeln(myFile,'smtppassword|'+smtppassword);
  Writeln(myFile,'FECHA|'+DateToStr(FECHA));
  Writeln(myFile,'TOEMAIL|'+TOEMAIL);
  Writeln(myFile,'FROMEMAIL|'+FROMEMAIL);
  Writeln(myFile,'SUBJECT|'+SUBJECT);
  Writeln(myFile,'BODY|'+_body);
  Writeln(myFile,'nombrearchivo|'+nombrearchivo);
  Writeln(myFile,'CCopy|'+CCopy);
  Writeln(myFile,'REPLAYTO|'+replayto);

  CloseFile(myFile);
end;

Procedure PreparaArchivoEmail(smtpserver:string;
  smtpport:string;
  smtpuser:string;
  smtppassword:string;
  FECHA :TDateTime;
  TOEMAIL: string;
  FROMEMAIL: string;
  SUBJECT: string;
  var _body : string;
  CCopy : String;
  nombrearchivo:string;
  replayto:string;var nFileEmail:String;
  DisPlayNameFrom:string);
var
  fName : string;
  myFile, myFileB : TextFile;
  fbody : string;
begin
  //crear archivo para email
  fName:= ExtractFilePath(Application.ExeName)+'EmailFile'+IntToStr(GetRandomNumber(VarUsuarioGlb))+'.dat';
  nFileEmail := fName;
  fbody:=ExtractFilePath(Application.ExeName)+'EmailFileBody'+IntToStr(GetRandomNumber(VarUsuarioGlb))+'.dat';
  AssignFile(myFile, fName);
  ReWrite(myFile);

  AssignFile(myFileB, fbody);
  ReWrite(myFileB);

  Writeln(myFile,'smtpserver|'+smtpserver);
  Writeln(myFile,'smtpport|'+smtpport);
  Writeln(myFile,'smtpuser|'+smtpuser);
  Writeln(myFile,'smtppassword|'+smtppassword);
  Writeln(myFile,'FECHA|'+DateToStr(FECHA));
  Writeln(myFile,'TOEMAIL|'+TOEMAIL);
  Writeln(myFile,'FROMEMAIL|'+FROMEMAIL);
  Writeln(myFile,'SUBJECT|'+SUBJECT);
  Writeln(myFile,'BODY|'+fbody);
  Writeln(myFile,'nombrearchivo|'+nombrearchivo);
  Writeln(myFile,'CCopy|'+CCopy);
  Writeln(myFile,'REPLAYTO|'+replayto);
  Writeln(myFile,'DisPlayNameFrom|'+DisPlayNameFrom);

  Writeln(myFileB,_body);
  _body:=fbody;
  CloseFile(myFile);
  CloseFile(myFileB);
end;

procedure ProcLogTrackingEmail(IDTIPO :integer;
  smtpserver:string;
  smtpport:string;
  smtpuser:string;
  smtppassword:string;
  FECHA :TDateTime;
  TOEMAIL: string;
  FROMEMAIL: string;
  SUBJECT: string;
  _body : string;
  COD_USER :integer;
  STATUS : string;
  ERRORMESSAGE : string;
  FECHAIN : TDateTime;
  IN_POR : string;
  FECHA_UPDATE: string;
  UPD_POR :string;
  nombrearchivo:string;
  replayto:string;
  DisPlayNameFrom:string);
  var
    parametros : string;
    fEmailOut : string;
    ExecuteResult: integer;
    Path: string;
    bodyoutfname:string;
begin
  //GlbEmailTool = se localiza en ini file: repconf_cr.ini
  try
    //if (GlbNombreArchivoRev <> '') then
    //GlbNombreArchivoRev:=','+GlbNombreArchivoRev;
    if (replayto = '') then
    replayto := 'soporte@idesisa.com';

    fEmailOut:='';
    bodyoutfname:=_body;
    PreparaArchivoEmail(
    smtpserver,smtpport,smtpuser,smtppassword,FECHA,
    TOEMAIL, FROMEMAIL, SUBJECT, bodyoutfname,'', nombrearchivo, replayto, fEmailOut,DisPlayNameFrom);
    parametros := '/MailFile='+chr(34)+fEmailOut+chr(34)+' /MailBody='+bodyoutfname;
               
    //fEmailOut:='';
    //PreparaArchivoEmail(
    //smtpserver,smtpport,smtpuser,smtppassword,FECHA,
    //TOEMAIL,FROMEMAIL,SUBJECT,_body,'',nombrearchivo,replayto,fEmailOut);

    //parametros := '/MailFile='+chr(34)+fEmailOut+chr(34);
    //Delay(3000);
    //if GlbEsDebugFiscal = 1 then
    //WriteToLog('Parametros enviar email:'+parametros );
    //t ShellExecute(0, 'Open', PChar(GlbEmailTool), PChar(parametros), PChar(''), SW_HIDE);

    Path := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName));
    if (IDTIPO = 101) or (IDTIPO = 102) and (GlbSAM = 1) then
    ExecuteResult := ShellExecute(0, nil, PChar(GlbEmailToolGSAM), PChar(parametros), nil, SW_HIDE)
    else
    ExecuteResult := ShellExecute(0, nil, PChar(Path + GlbEmailTool), PChar(parametros), nil, SW_HIDE);
    if ExecuteResult <= 32 then
    begin
      WriteToLog('Error: ' + IntToStr(ExecuteResult));
      ShowMessage('Verifique ejecutable para envio de email : ' + IntToStr(ExecuteResult));
    end else
    if (GlbMuestraMensajeEmail) OR (GlbUsuarioLogueado = 'DIVISON') then
    MessageDlg('Datos reporte enviados por email correctamente.', mtInformation,[mbOk], 0);
  except
  WriteToLog('Error cargando herramienta envio de email');
  //raise Exception.Create('Error cargando herramienta envio de email');
  end;

  dmDatos.stpInsEmailTracking.Params[0].Value:= null;//no se usa
  dmDatos.stpInsEmailTracking.Params[1].Value:= IDTIPO;  //idtipo
  dmDatos.stpInsEmailTracking.Params[2].Value:= fecha;  //fecha_timestamp
  dmDatos.stpInsEmailTracking.Params[3].Value:= toemail;  //toemail
  dmDatos.stpInsEmailTracking.Params[4].Value:= fromemail;  //fromemail
  dmDatos.stpInsEmailTracking.Params[5].Value:= subject;  //subject
  dmDatos.stpInsEmailTracking.Params[6].Value:= VarUsuarioGlb;  //cod_user
  dmDatos.stpInsEmailTracking.Params[7].Value:= 'A';  //status
  dmDatos.stpInsEmailTracking.Params[8].Value:=  errormessage; //fecha_in
  dmDatos.stpInsEmailTracking.Params[9].Value:=  fechain; //in_por
  dmDatos.stpInsEmailTracking.Params[10].Value:= in_por; //fecha_update
  dmDatos.stpInsEmailTracking.Params[11].Value:= null; //upd_por
  dmDatos.stpInsEmailTracking.Params[12].Value:= null; //
  try
  dmDatos.stpInsEmailTracking.ExecProc;
  if not dmDatos.stpInsEmailTracking.Transaction.InTransaction then
  dmDatos.stpInsEmailTracking.Transaction.StartTransaction;
  try
    dmDatos.stpInsEmailTracking.Transaction.CommitRetaining;
  Except
  dmDatos.stpInsEmailTracking.Transaction.RollbackRetaining;
  end;
  except
  end;
  {
  IDTIPO integer,    FECHA timestamp,TOEMAIL varchar(200),FROMEMAIL varchar(200),
  SUBJECT varchar(80),COD_USER integer,STATUS char(1),ERRORMESSAGE varchar(200),
  FECHAIN timestamp,IN_POR varchar(12),FECHA_UPDATE timestamp,UPD_POR varchar(12)
  }
end;


procedure ConvertANSIFileToUTF8File(AInputFileName, AOutputFileName: TFileName);
var
  Strings: TStrings;
begin
  Strings := TStringList.Create;
  try
    Strings.LoadFromFile(AInputFileName);
    Strings.Text := UTF8Encode(Strings.Text);
    Strings.SaveToFile(AOutputFileName);
  finally
    Strings.Free;
  end;
end;

Procedure ProcPrepNeCF(tipo:string);
begin
  dmFactura.ibQryViewNCF.Close;
  if dmFactura.ibQryViewNCF.Prepared then
    dmFactura.ibQryViewNCF.UnPrepare;
  dmFactura.ibQryViewNCF.SQL.Text := dmFactura.ibQryViewNCF_0.SQL.Text;
  if GlbActivaECF = 1 then
    begin
      dmFactura.ibQryViewNCF.SQL.Add(' and v.TIPO_CF >'+chr(39)+'29'+chr(39));
      dmFactura.ibQryViewNCF.SQL.Add('order by v.TIPO_CF, n.tipo_ncfNCR desc');
    end else
    begin
      dmFactura.ibQryViewNCF.SQL.Add(' and v.TIPO_CF <'+chr(39)+'17'+chr(39));
      dmFactura.ibQryViewNCF.SQL.Add('order by v.TIPO_CF, n.tipo_ncfNCR desc');
    end;  
  if Not dmFactura.ibQryViewNCF.Prepared then
    dmFactura.ibQryViewNCF.Prepare;
  dmFactura.ibQryViewNCF.Open;
end;

procedure ProcLogTrackingEmailAvisoDir(
  smtpserver:string;
  smtpport:string;
  smtpuser:string;
  smtppassword:string;
  FECHA :TDateTime;
  TOEMAIL: string;
  FROMEMAIL: string;
  SUBJECT: string;
  _body : string;
  COD_USER :integer;
  STATUS : string;
  ERRORMESSAGE : string;
  FECHAIN : TDateTime;
  IN_POR : string;
  FECHA_UPDATE: string;
  UPD_POR :string;
  nombrearchivo:string);
  var
    parametros : string;
    fEmailOut : string;
    ExecuteResult: integer;
    Path: string;
    replayto : string;  
begin
  //GlbEmailTool = se localiza en ini file: repconf_cr.ini
  if (smtpserver = '') then exit;
  replayto := '';

  try  
	if (replayto = '') then
    replayto := 'soporte@idesisa.com';
    fEmailOut:='';
    PreparaArchivoEmail(
    smtpserver,smtpport,smtpuser,smtppassword,FECHA,
    TOEMAIL,FROMEMAIL,SUBJECT,_body,'',nombrearchivo,replayto,fEmailOut);

    parametros := '/MailFile='+chr(34)+fEmailOut+chr(34);

    //if GlbEsDebugFiscal = 1 then
    //WriteToLog('Paramétros enviar email:'+parametros );

    Path := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName));
    ExecuteResult := ShellExecute(0, nil, PChar(Path  + GlbEmailTool), PChar(parametros), nil, SW_HIDE);
    if ExecuteResult <= 32 then
    begin
      //WriteToLog('Error: ' + IntToStr(ExecuteResult));
      //ShowMessage('Error: ' + IntToStr(ExecuteResult));
    end;// else
    //MessageDlg('Datos reporte enviados por email correctamente.', mtInformation,[mbOk], 0);
  except
  //WriteToLog('Error cargando herramienta envio de email');
  end;
end;

procedure ProcLogTrackingEmailAviso(IDTIPO :integer;
  smtpserver:string;
  smtpport:string;
  smtpuser:string;
  smtppassword:string;
  FECHA :TDateTime;
  TOEMAIL: string;
  FROMEMAIL: string;
  SUBJECT: string;
  _body : string;
  COD_USER :integer;
  STATUS : string;
  ERRORMESSAGE : string;
  FECHAIN : TDateTime;
  IN_POR : string;
  FECHA_UPDATE: string;
  UPD_POR :string;
  nombrearchivo:string;
  DisPlayNameFrom:string);
  var
    parametros : string;
    fEmailOut : string;
    ExecuteResult: integer;
    Path: string;
    replayto : string;
    bodyoutfname:string;
begin
  //GlbEmailTool = se localiza en ini file: repconf_cr.ini
  if (smtpserver = '') then exit;
  if (_body = '') then exit;
  replayto := '';

  try  
	if (replayto = '') then
    replayto := 'soporte@idesisa.com';
    fEmailOut:='';

    bodyoutfname:=_body;
    PreparaArchivoEmail(
    smtpserver,smtpport,smtpuser,smtppassword,FECHA,
    TOEMAIL, FROMEMAIL, SUBJECT, bodyoutfname,'', nombrearchivo, replayto, fEmailOut,DisPlayNameFrom);
    parametros := '/MailFile='+chr(34)+fEmailOut+chr(34)+' /MailBody='+bodyoutfname;

    //parametros := '/MailFile='+chr(34)+fEmailOut+chr(34);

    if GlbEsDebugFiscal = 1 then
    WriteToLog('Paramétros enviar email:'+parametros );

    Path := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName));
    ExecuteResult := ShellExecute(0, nil, PChar(Path  + GlbEmailTool), PChar(parametros), nil, SW_HIDE);

    if ExecuteResult <= 32 then
    begin
      WriteToLog('Error: ' + IntToStr(ExecuteResult));
      ShowMessage('Error '+ GlbEmailTool+' no existe. ' + IntToStr(ExecuteResult));
    end;// else
    //MessageDlg('Datos reporte enviados por email correctamente.', mtInformation,[mbOk], 0);
  except
  WriteToLog('Error cargando herramienta envio de email');
  end;
end;


procedure SizePapelPrinter;
var
   Device : array[0..255] of char;
   Driver : array[0..255] of char;
   Port   : array[0..255] of char;
   hDMode : THandle;
   PDMode : PDEVMODE;
begin
  Printer.PrinterIndex := Printer.PrinterIndex;
  Printer.GetPrinter(Device, Driver, Port, hDMode);
  if hDMode <> 0 then begin
     pDMode := GlobalLock(hDMode);
     if pDMode <> nil then begin

    {Set to legal}
     pDMode^.dmFields := pDMode^.dmFields Or dm_PaperSize;
     pDMode^.dmPaperSize := DMPAPER_LEGAL;

    {Set to custom size}
     pDMode^.dmFields := pDMode^.dmFields or
                          DM_PAPERSIZE or
                         DM_PAPERWIDTH or
                         DM_PAPERLENGTH;
     pDMode^.dmPaperSize := DMPAPER_USER;
     pDMode^.dmPaperWidth := 212 {SomeValueInTenthsOfAMillimeter};
     pDMode^.dmPaperLength := 92 {SomeValueInTenthsOfAMillimeter};

    {Set the bin to use}
     pDMode^.dmFields := pDMode^.dmFields or DMBIN_MANUAL;
     pDMode^.dmDefaultSource := DMBIN_MANUAL;

     GlobalUnlock(hDMode);
   end;
  end;
end;

//** This procedure just creates a new Logfile an appends when it was created **
procedure CreateLogfile;
var
  F:TextFile;
FN:String;
begin
  //Exit;//Configurar aqui para usar Parametro
  // Getting the filename for the logfile (In this case the Filename is 'application-exename.log'
  FN := ChangeFileExt(Application.Exename, '.log');
  // Assigns Filename to variable F

  AssignFile(F, FN);

  if FileExists(FN) then   // Open file for appending
  Append(f)
  else
  Rewrite(F);
  // Write text to Textfile F
  WriteLn(F, BreakingLine);
  WriteLn(F, 'This Logfile was created on ' + DateTimeToStr(Now));
  WriteLn(F, BreakingLine);
  WriteLn(F, '');
  // finally close the file
  CloseFile(F);
end;

procedure WriteToLogTag(aLogMessage:String);
var
  T:TextFile;
FN:String;
begin
  //Exit;//Configurar aqui para usar Parametro

  // Getting the filename for the logfile (In this case the Filename is 'application-exename.log'
  FN := ChangeFileExt(Application.Exename, '.tag');

  //Checking for file
  if (not FileExists(FN)) then
  begin
    // if file is not available then create a new file
    CreateLogFile;
  end;

  // Assigns Filename to variable F
  AssignFile(T, FN);
  // start appending text
  Append(T);
  //Write a new line with current date and message to the file
  WriteLn(T, DateTimeToStr(Now) + ': ' + aLogMessage);
  // Close file
  CloseFile(T)
end;

// Procedure for appending a Message to an existing logfile with current Date and Time **
procedure WriteToLog(aLogMessage:String);
var
  T:TextFile;
FN:String;
begin
  //Exit;//Configurar aqui para usar Parametro
  if GlbEsDebugEntradas = 0 then exit;
  // Getting the filename for the logfile (In this case the Filename is 'application-exename.log'
  FN := ChangeFileExt(Application.Exename, '.log');

  //Checking for file
  if (not FileExists(FN)) then
  begin
    // if file is not available then create a new file
    CreateLogFile;
  end;

  // Assigns Filename to variable F  
  AssignFile(T, FN);
  // start appending text
  Append(T);
  WriteLn(T, DateTimeToStr(Now) + ': ' + aLogMessage);
  //Write a new line with current date and message to the file
  CloseFile(T)
  // Close file
end;

procedure ExporToExcelARSFact(mTablaMaster : TIBQuery; mTabla : TIBQuery; NombreArchivo : String;rangoF:string);
const
  xlWBATWorksheet = -4167;
var
  rangoExcel : Variant;
  i, fila : integer;
  mMarcador : Tbookmarkstr;
  AplicacionExcel : Olevariant;
  frm: TForm;
  ProgressBar1: TProgressBar;
  ProgressBar2: TProgressBar;
//  targetFile : string;
begin
  NombreArchivo:=StringReplace(NombreArchivo,'\\','\',[]);
  rangoExcel:= ExcelXp.xlRange;
  aplicacionExcel := CreateOleObject('Excel.Application');
  aplicacionExcel.Visible:= false;
  aplicacionExcel.workbooks.add(xlWBATWorksheet);
  rangoExcel := aplicacionExcel.ActiveCell;

  frm := TForm.Create(Nil);
  //frm.OnKeyPress := my;
  ProgressBar1:= TProgressBar.Create(Nil);
  ProgressBar2:= TProgressBar.Create(Nil);
  try
  With Frm Do
  begin
    Frm.Color := clCream;
    Frm.Position:= poOwnerFormCenter;
    Frm.BorderStyle := bsNone;
    Caption:= 'Creado en ejecución';
    Height:= 100;
    Width := 800;
    With TLabel.Create(Nil) Do
    begin
      Caption:='Generando reporte...espere.';
      Left:= 8;
      Top:= 8;
      Height:= 25;
      Width:= 200;
      Parent:= Frm;
    end;

    //With TProgressBar.Create(Nil) Do
    //begin
      ProgressBar1.Left:= 8;
      ProgressBar1.Top := 22;
      ProgressBar1.width:= 600;
      ProgressBar1.Max:= mTabla.RecordCount;
      ProgressBar1.StepBy(1);
      ProgressBar1.Position:=0;
      ProgressBar1.Parent:= Frm;

      ProgressBar2.Left:= 8;
      ProgressBar2.Top := 56;
      ProgressBar2.width:= 600;
      ProgressBar2.Max:=  mTabla.Fields.Count;
      ProgressBar2.StepBy(1);
      ProgressBar2.Parent:= Frm;
    //end;
  fila:=2;
  rangoExcel := AplicacionExcel.Range['E' + IntToStr(fila), 'E' + IntToStr(fila)];
  rangoExcel.Value := dmCompania.tblCompaniaNOMBRE.Value;
  rangoExcel := rangoExcel.Next;

  Inc(fila);
  rangoExcel := AplicacionExcel.Range['E' + IntToStr(fila), 'E' + IntToStr(fila)];
  rangoExcel.Value := dmCompania.tblCompaniaCALLEYNUMERO.Value+ ','+dmCompania.tblCompaniaTELEFONO.Value;
  rangoExcel := rangoExcel.Next;

  Inc(fila);
  rangoExcel := AplicacionExcel.Range['E' + IntToStr(fila), 'E' + IntToStr(fila)]; 
  rangoExcel.Value :='RNC: '+ dmCompania.tblCompaniaRNC_NUMERO.Value+'('+dmCompania.tblCompaniaNOMBRE.Value+')'+ '        '+mTablaMaster.FieldByName('NOMBRE_DEPENDIENTE').Value;
  rangoExcel := rangoExcel.Next;

  Inc(fila);
  rangoExcel := AplicacionExcel.Range['A' + IntToStr(fila), 'A' + IntToStr(fila)];
  rangoExcel.Value := '';
  rangoExcel := rangoExcel.Next;

  Inc(fila);
  rangoExcel := AplicacionExcel.Range['A' + IntToStr(fila), 'A' + IntToStr(fila)];
  rangoExcel.Value := '';
  rangoExcel := rangoExcel.Next;

  Inc(fila);
  rangoExcel := AplicacionExcel.Range['A' + IntToStr(fila), 'A' + IntToStr(fila)];
  rangoExcel.Value := '';
  rangoExcel := rangoExcel.Next;

  Inc(fila);
  rangoExcel := AplicacionExcel.Range['A' + IntToStr(fila), 'A' + IntToStr(fila)];
  rangoExcel.Value := mTablaMaster.FieldByName('NOMBRE').Value;
  rangoExcel := rangoExcel.Next;
     
  Inc(fila);
  rangoExcel := AplicacionExcel.Range['A' + IntToStr(fila), 'A' + IntToStr(fila)];
  rangoExcel.Value := rangoF+'    '+'Reporte de Conciliación de Facturas Reclamaciones Farmacéuticas';
  rangoExcel := rangoExcel.Next;

  Inc(fila);
  rangoExcel := AplicacionExcel.Range['A' + IntToStr(fila), 'A' + IntToStr(fila)];
  rangoExcel.Value := '';
  rangoExcel := rangoExcel.Next;

  Inc(fila);
  rangoExcel := AplicacionExcel.Range['A' + IntToStr(fila), 'A' + IntToStr(fila)];
  For i:= 0 To mTabla.Fields.Count - 1 Do
  begin
    rangoExcel.Value := mTabla.Fields[i].DisplayLabel;
    rangoExcel := rangoExcel.Next;
  end;

  Inc(fila);
  mTabla.DisableControls;
  try
    mMarcador := mTabla.Bookmark;
    try
      mTabla.Last;
      ProgressBar1.Max:= mTabla.RecordCount;
      mTabla.First;
      ProgressBar1.Position:= 0;
      ProgressBar1.Step    := 1;
      //fila := 2;
      frm.Show;

      While Not mTabla.Eof do
      begin
        //ProgressBar1.StepBy(1);
        rangoExcel := AplicacionExcel.Range['A' + IntToStr(fila), 'A' + IntToStr(fila)];
        ProgressBar2.Position:=0;
        for i := 0 to mTabla.Fields.Count - 1 do
        begin
          rangoExcel.Value := mTabla.Fields[i].AsString;
          rangoExcel := rangoExcel.Next;
          ProgressBar2.StepIt;
          //Application.ProcessMessages;
        end;
        ProgressBar1.StepIt;
        mTabla.Next;
        Inc(fila);
        Application.ProcessMessages;

      end;
      finally
        mTabla.Bookmark := mMarcador;
      end;
    finally
    end;
  end;
  finally
  frm.Hide;
  FreeAndNil(frm);
  end;
  mTabla.EnableControls;

  //NombreArchivo:=ExtractFilePath(NombreArchivo)+'\'+StringReplace(ExtractFileName(NombreArchivo),ExtractFileExt(NombreArchivo),'',[rfReplaceAll]) +FormatDateTime('ddmmyyyy',Now)+'.xls';
  GlbNombreArchivo := NombreArchivo;
  GlbNombreArchivo:=StringReplace(GlbNombreArchivo,'\\','\',[]);
  GlbNombreArchivo:=StringReplace(GlbNombreArchivo,'//','/',[]);

  if GlbEsDebugEntradas = 1 then
  LogInformacionTxt('Nombre archivo final:'+GlbNombreArchivo);
  AplicacionExcel.Workbooks[1].SaveAs(NombreArchivo);

  AplicacionExcel.Quit;
  if GLBMostrarArchivo then
  begin
    if (FileExists(NombreArchivo)) then
    ShellExecute(0,'open',PChar(NombreArchivo), '','',SW_SHOWNORMAL);
    GLBMostrarArchivo:=False;
  end;
  //Application.ProcessMessages;
end;


procedure ExporToExcelCert(mTabla : TIBDataSet; NombreArchivo : String);
const
  xlWBATWorksheet = -4167;
var
  rangoExcel : Variant;
  i, fila : integer;
  mMarcador : Tbookmarkstr;
  AplicacionExcel : Olevariant;
  frm: TForm;
  ProgressBar1: TProgressBar;
  ProgressBar2: TProgressBar;
//  targetFile : string;
begin
  NombreArchivo:=StringReplace(NombreArchivo,'\\','\',[]);
  rangoExcel:= ExcelXp.xlRange;
  aplicacionExcel := CreateOleObject('Excel.Application');
  aplicacionExcel.Visible:= false;
  aplicacionExcel.workbooks.add(xlWBATWorksheet);
  rangoExcel := aplicacionExcel.ActiveCell;

  frm := TForm.Create(Nil);
  //frm.OnKeyPress := my;
  ProgressBar1:= TProgressBar.Create(Nil);
  ProgressBar2:= TProgressBar.Create(Nil);
  try
  With Frm Do
  begin
    Frm.Color := clCream;
    Frm.Position:= poOwnerFormCenter;
    Frm.BorderStyle := bsNone;
    Caption:= 'Creado en ejecución';
    Height:= 100;
    Width := 800;
    With TLabel.Create(Nil) Do
    begin
      Caption:='Generando reporte...espere.';
      Left:= 8;
      Top:= 8;
      Height:= 25;
      Width:= 200;
      Parent:= Frm;
    end;

    //With TProgressBar.Create(Nil) Do
    //begin
      ProgressBar1.Left:= 8;
      ProgressBar1.Top := 22;
      ProgressBar1.width:= 600;
      ProgressBar1.Max:= mTabla.RecordCount;
      ProgressBar1.StepBy(1);
      ProgressBar1.Position:=0;
      ProgressBar1.Parent:= Frm;

      ProgressBar2.Left:= 8;
      ProgressBar2.Top := 56;
      ProgressBar2.width:= 600;
      ProgressBar2.Max:=  mTabla.Fields.Count;
      ProgressBar2.StepBy(1);
      ProgressBar2.Parent:= Frm;
    //end;

  For i:= 0 To mTabla.Fields.Count - 1 Do
  begin
    rangoExcel.Value := mTabla.Fields[i].DisplayLabel;
    rangoExcel := rangoExcel.Next;
  end;

  mTabla.DisableControls;
  try
    mMarcador := mTabla.Bookmark;
    try
      mTabla.Last;
      ProgressBar1.Max:= mTabla.RecordCount;
      mTabla.First;
      ProgressBar1.Position:= 0;
      ProgressBar1.Step    := 1;
      fila := 2;
      frm.Show;

      While Not mTabla.Eof do
      begin
        rangoExcel := AplicacionExcel.Range['A' + IntToStr(fila), 'A' + IntToStr(fila)];
        ProgressBar2.Position:=0;
        for i := 0 to mTabla.Fields.Count - 1 do
        begin                 
          rangoExcel.Value := mTabla.Fields[i].AsString;
          rangoExcel := rangoExcel.Next;
          ProgressBar2.StepIt;
        end;
        ProgressBar1.StepIt;
        mTabla.Next;
        Inc(fila);
        //Application.ProcessMessages;
      end;
      finally
        mTabla.Bookmark := mMarcador;
      end;
    finally
    end;
  end;
  finally
  frm.Hide;
  FreeAndNil(frm);
  end;
  mTabla.EnableControls;

  NombreArchivo:=NombreArchivo +FormatDateTime('ddmmyy_hhmm',Now)+'.xls';
  GlbNombreArchivo:=StringReplace(NombreArchivo,'\\','\',[]);
  GlbNombreArchivo:=StringReplace(GlbNombreArchivo,'//','/',[]);

  AplicacionExcel.Workbooks[1].SaveAs(GlbNombreArchivo);
  glbZipFile:= GlbNombreArchivo;
  AplicacionExcel.Quit;
  if GLBMostrarArchivo then
  begin
    if (FileExists(NombreArchivo)) then
    ShellExecute(0,'open',PChar(NombreArchivo), '','',SW_SHOWNORMAL);
    GLBMostrarArchivo:=False;
  end;
  //Application.ProcessMessages;
end;

procedure ExporToExcelCertQ(mTabla : TIBQuery; NombreArchivo : String);
const
  xlWBATWorksheet = -4167;
var
  rangoExcel : Variant;
  i, fila : integer;
  mMarcador : Tbookmarkstr;
  AplicacionExcel : Olevariant;
  frm: TForm;
  ProgressBar1: TProgressBar;
  ProgressBar2: TProgressBar;
//  targetFile : string;
begin
  NombreArchivo:=StringReplace(NombreArchivo,'\\','\',[]);
  rangoExcel:= ExcelXp.xlRange;
  aplicacionExcel := CreateOleObject('Excel.Application');
  aplicacionExcel.Visible:= false;
  aplicacionExcel.workbooks.add(xlWBATWorksheet);
  rangoExcel := aplicacionExcel.ActiveCell;

  frm := TForm.Create(Nil);
  //frm.OnKeyPress := my;
  ProgressBar1:= TProgressBar.Create(Nil);
  ProgressBar2:= TProgressBar.Create(Nil);
  try
  With Frm Do
  begin
    Frm.Color := clCream;
    Frm.Position:= poOwnerFormCenter;
    Frm.BorderStyle := bsNone;
    Caption:= 'Creado en ejecución';
    Height:= 100;
    Width := 800;
    With TLabel.Create(Nil) Do
    begin
      Caption:='Generando reporte...espere.';
      Left:= 8;
      Top:= 8;
      Height:= 25;
      Width:= 200;
      Parent:= Frm;
    end;

    //With TProgressBar.Create(Nil) Do
    //begin
      ProgressBar1.Left:= 8;
      ProgressBar1.Top := 22;
      ProgressBar1.width:= 600;
      ProgressBar1.Max:= mTabla.RecordCount;
      ProgressBar1.StepBy(1);
      ProgressBar1.Position:=0;
      ProgressBar1.Parent:= Frm;

      ProgressBar2.Left:= 8;
      ProgressBar2.Top := 56;
      ProgressBar2.width:= 600;
      ProgressBar2.Max:=  mTabla.Fields.Count;
      ProgressBar2.StepBy(1);
      ProgressBar2.Parent:= Frm;
    //end;

  For i:= 0 To mTabla.Fields.Count - 1 Do
  begin
    rangoExcel.Value := mTabla.Fields[i].DisplayLabel;
    rangoExcel := rangoExcel.Next;
  end;

  mTabla.DisableControls;
  try
    mMarcador := mTabla.Bookmark;
    try
      mTabla.Last;
      ProgressBar1.Max:= mTabla.RecordCount;
      mTabla.First;
      ProgressBar1.Position:= 0;
      ProgressBar1.Step    := 1;
      fila := 2;
      frm.Show;

      While Not mTabla.Eof do
      begin
        rangoExcel := AplicacionExcel.Range['A' + IntToStr(fila), 'A' + IntToStr(fila)];
        ProgressBar2.Position:=0;
        for i := 0 to mTabla.Fields.Count - 1 do
        begin                 
          rangoExcel.Value := mTabla.Fields[i].AsString;
          rangoExcel := rangoExcel.Next;
          ProgressBar2.StepIt;
        end;
        ProgressBar1.StepIt;
        mTabla.Next;
        Inc(fila);
        Application.ProcessMessages;
      end;
      finally
        mTabla.Bookmark := mMarcador;
      end;
    finally
    end;
  end;
  finally
  frm.Hide;
  FreeAndNil(frm);
  end;
  mTabla.EnableControls;

  NombreArchivo:=NombreArchivo +FormatDateTime('ddmmyy_hhmm',Now)+'.xls';
  GlbNombreArchivo:=StringReplace(NombreArchivo,'\\','\',[]);
  GlbNombreArchivo:=StringReplace(GlbNombreArchivo,'//','/',[]);

  AplicacionExcel.Workbooks[1].SaveAs(GlbNombreArchivo);
  glbZipFile:= GlbNombreArchivo;
  AplicacionExcel.Quit;
  if GLBMostrarArchivo then
  begin
    if (FileExists(NombreArchivo)) then
    ShellExecute(0,'open',PChar(NombreArchivo), '','',SW_SHOWNORMAL);
    GLBMostrarArchivo:=False;
  end;
  //Application.ProcessMessages;
end;

procedure ExporToExcel(mTabla : TIBQuery; NombreArchivo : String;addFechaF:Boolean;emailAuto:Boolean);
const
  xlWBATWorksheet = -4167;
var
  rangoExcel : Variant;
  i, fila : integer;
  mMarcador : Tbookmarkstr;
  AplicacionExcel : Olevariant;
  frm: TForm;
  ProgressBar1: TProgressBar;
  ProgressBar2: TProgressBar;
  targetFile : string;
//  targetFile : string;
begin
  NombreArchivo:=StringReplace(NombreArchivo,'\\','\',[]);
  rangoExcel:= ExcelXp.xlRange;
  aplicacionExcel := CreateOleObject('Excel.Application');
  aplicacionExcel.Visible:= false;
  aplicacionExcel.workbooks.add(xlWBATWorksheet);
  rangoExcel := aplicacionExcel.ActiveCell;

  frm := TForm.Create(Nil);
  //frm.OnKeyPress := my;
  ProgressBar1:= TProgressBar.Create(Nil);
  ProgressBar2:= TProgressBar.Create(Nil);
  try
  With Frm Do
  begin
    Frm.Color := clCream;
    Frm.Position:= poOwnerFormCenter;
    Frm.BorderStyle := bsNone;
    Caption:= 'Creado en ejecución';
    Height:= 100;
    Width := 800;
    With TLabel.Create(Nil) Do
    begin
      Caption:='Generando reporte...espere.';
      Left:= 8;
      Top:= 8;
      Height:= 25;
      Width:= 200;
      Parent:= Frm;
    end;

    //With TProgressBar.Create(Nil) Do
    //begin
      ProgressBar1.Left:= 8;
      ProgressBar1.Top := 22;
      ProgressBar1.width:= 600;
      ProgressBar1.Max:= mTabla.RecordCount;
      ProgressBar1.StepBy(1);
      ProgressBar1.Position:=0;
      ProgressBar1.Parent:= Frm;

      ProgressBar2.Left:= 8;
      ProgressBar2.Top := 56;
      ProgressBar2.width:= 600;
      ProgressBar2.Max:=  mTabla.Fields.Count;
      ProgressBar2.StepBy(1);
      ProgressBar2.Parent:= Frm;
    //end;

  For i:= 0 To mTabla.Fields.Count - 1 Do
  begin
    rangoExcel.Value := mTabla.Fields[i].DisplayLabel;
    rangoExcel := rangoExcel.Next;
  end;

  mTabla.DisableControls;
  try
    mMarcador := mTabla.Bookmark;
    try
      mTabla.Last;
      ProgressBar1.Max:= mTabla.RecordCount;
      mTabla.First;
      ProgressBar1.Position:= 0;
      ProgressBar1.Step    := 1;
      fila := 2;
      frm.Show;

      While Not mTabla.Eof do
      begin
        rangoExcel := AplicacionExcel.Range['A' + IntToStr(fila), 'A' + IntToStr(fila)];
        ProgressBar2.Position:=0;
        for i := 0 to mTabla.Fields.Count - 1 do
        begin
          try
            rangoExcel.Value := mTabla.Fields[i].AsString;
          except on E : Exception do
          begin
            WriteToLog(E.ClassName+' Error. Mensaje: '+E.Message);
            WriteToLog('Campo: '+mTabla.Fields[i].DisplayLabel);
            rangoExcel.Value := '';
          end;
          end;
          rangoExcel := rangoExcel.Next;
          ProgressBar2.StepIt;
        end;
        ProgressBar1.StepIt;
        mTabla.Next;
        Inc(fila);
        Application.ProcessMessages;
      end;
      finally
        mTabla.Bookmark := mMarcador;
      end;
    finally
    end;
  end;
  finally
  frm.Hide;
  FreeAndNil(frm);
  end;
  mTabla.EnableControls;
  if addFechaF then
  NombreArchivo:=NombreArchivo +FormatDateTime('ddmmyy_hhmm',Now)+'.xls';
  GlbNombreArchivo := NombreArchivo;
  if not DirectoryExists(ExtractFilePath(NombreArchivo)) then
  if not ForceDirectories(ExtractFilePath(NombreArchivo)) then
  begin
    LogInformacionTxt('Log recibos/Facturas.'+strUserName+ '. Usuario : '+VarNombreUsuario+ '. Fecha :'+DateTimeToStr(now)+'. Error creando directorio: '+ExtractFileDir(NombreArchivo));
    exit;
  end;

  AplicacionExcel.Workbooks[1].SaveAs(NombreArchivo);
  glbZipFile:= GlbNombreArchivo;
  AplicacionExcel.Quit;
  if GLBMostrarArchivo then
  begin
    if (FileExists(NombreArchivo)) then
    ShellExecute(0,'open',PChar(NombreArchivo), '','',SW_SHOWNORMAL);
    GLBMostrarArchivo:=False;
  end;

  if (GlbEnviaEmail and emailAuto) then
  begin
  dmdatos.qryEmailProceso.Close;
  dmdatos.qryEmailProceso.Params[0].Value := GlbIDTipoEmail;
  dmdatos.qryEmailProceso.Open;
  dmdatos.qryEmailProceso.First;
  if (dmdatos.qryEmailProcesoSTATUS.Value = 'A') then
  begin
      if ProcZipFile(NombreArchivo, targetFile) then
      begin
        if dmdatos.qryEmailProceso.RecordCount = 1 then
        begin
          if dmCompania.tblCompania.State = dsInactive then
          dmCompania.tblCompania.open;
          dmCompania.tblCompania.Locate('codigo',glbCia_Key,[]);

          ProcLogTrackingEmail(glbidtipoemail,dmdatos.qryEmailProcesoEMAIL_SERVER.Value,
          dmdatos.qryEmailProcesoPORT.AsString,dmdatos.qryEmailProcesoUSER_EMAIL.Value,
          Desencriptar(dmdatos.qryEmailProcesoUSER_PASSWORD.Value,2005),
          now,dmdatos.qryEmailProcesoTOEMAIL.Value,dmdatos.qryEmailProcesoFROMEMAIL.Value,
          dmdatos.qryEmailProcesoSUBJECT.Value+' -CIA:'+
          dmCompania.tblCompaniaNOMBRE.Value+
          ''#13#10'Sucursal : '+dmCompania.tblCompaniaNUM_SUCURSAL.AsString+' '+FormatDateTime('dd/mm/yyyy hh:mm a/p',now),
          ''#13#10'Reporte',
          VarUsuarioGlb,'A','',now,strusername,FormatDateTime('dd/mm/yyyy hh:mm a/p',now),strusername,targetFile,dmCompania.tblCompaniaEMAIL.Value,dmCompania.tblCompaniaNOMBRE.Value);
        end;
      end;
      GlbEnviaEmail:=False;

  end;
  end;

  //Application.ProcessMessages;
end;


procedure ExporToExcel(mTabla : TIBQuery; NombreArchivo : String;addFechaF:Boolean);
const
  xlWBATWorksheet = -4167;
var
  rangoExcel : Variant;
  i, fila : integer;
  mMarcador : Tbookmarkstr;
  AplicacionExcel : Olevariant;
  frm: TForm;
  ProgressBar1: TProgressBar;
  ProgressBar2: TProgressBar;
  targetFile : string;
//  targetFile : string;
begin
  NombreArchivo:=StringReplace(NombreArchivo,'\\','\',[]);
  rangoExcel:= ExcelXp.xlRange;
  aplicacionExcel := CreateOleObject('Excel.Application');
  aplicacionExcel.Visible:= false;
  aplicacionExcel.workbooks.add(xlWBATWorksheet);
  rangoExcel := aplicacionExcel.ActiveCell;

  frm := TForm.Create(Nil);
  //frm.OnKeyPress := my;
  ProgressBar1:= TProgressBar.Create(Nil);
  ProgressBar2:= TProgressBar.Create(Nil);
  try
  With Frm Do
  begin
    Frm.Color := clCream;
    Frm.Position:= poOwnerFormCenter;
    Frm.BorderStyle := bsNone;
    Caption:= 'Creado en ejecución';
    Height:= 100;
    Width := 800;
    With TLabel.Create(Nil) Do
    begin
      Caption:='Generando reporte...espere.';
      Left:= 8;
      Top:= 8;
      Height:= 25;
      Width:= 200;
      Parent:= Frm;
    end;

    //With TProgressBar.Create(Nil) Do
    //begin
      ProgressBar1.Left:= 8;
      ProgressBar1.Top := 22;
      ProgressBar1.width:= 600;
      ProgressBar1.Max:= mTabla.RecordCount;
      ProgressBar1.StepBy(1);
      ProgressBar1.Position:=0;
      ProgressBar1.Parent:= Frm;

      ProgressBar2.Left:= 8;
      ProgressBar2.Top := 56;
      ProgressBar2.width:= 600;
      ProgressBar2.Max:=  mTabla.Fields.Count;
      ProgressBar2.StepBy(1);
      ProgressBar2.Parent:= Frm;
    //end;

  For i:= 0 To mTabla.Fields.Count - 1 Do
  begin
    rangoExcel.Value := mTabla.Fields[i].DisplayLabel;
    rangoExcel := rangoExcel.Next;
  end;

  mTabla.DisableControls;
  try
    mMarcador := mTabla.Bookmark;
    try
      mTabla.Last;
      ProgressBar1.Max:= mTabla.RecordCount;
      mTabla.First;
      ProgressBar1.Position:= 0;
      ProgressBar1.Step    := 1;
      fila := 2;
      frm.Show;
      Application.ProcessMessages;
      While Not mTabla.Eof do
      begin
        rangoExcel := AplicacionExcel.Range['A' + IntToStr(fila), 'A' + IntToStr(fila)];
        ProgressBar2.Position:=0;
        for i := 0 to mTabla.Fields.Count - 1 do
        begin
          try
            rangoExcel.Value := mTabla.Fields[i].AsString;
          except on E : Exception do
          begin
            WriteToLog(E.ClassName+' Error. Mensaje: '+E.Message);
            WriteToLog('Campo: '+mTabla.Fields[i].DisplayLabel);
            rangoExcel.Value := '';
          end;
          end;
          rangoExcel := rangoExcel.Next;
          ProgressBar2.StepIt;
        end;
        ProgressBar1.StepIt;
        mTabla.Next;
        Inc(fila);
        Application.ProcessMessages;
      end;
      finally
        mTabla.Bookmark := mMarcador;
      end;
    finally
    end;
  end;
  finally
  frm.Hide;
  FreeAndNil(frm);
  end;
  mTabla.EnableControls;
  if addFechaF then
  NombreArchivo:=NombreArchivo +FormatDateTime('ddmmyy_hhmm',Now)+'.xls';
  GlbNombreArchivo := NombreArchivo;
  if not DirectoryExists(ExtractFilePath(NombreArchivo)) then
  if not ForceDirectories(ExtractFilePath(NombreArchivo)) then
  begin
    LogInformacionTxt('Log recibos/Facturas.'+strUserName+ '. Usuario : '+VarNombreUsuario+ '. Fecha :'+DateTimeToStr(now)+'. Error creando directorio: '+ExtractFileDir(NombreArchivo));
    exit;
  end;

  AplicacionExcel.Workbooks[1].SaveAs(NombreArchivo);
  glbZipFile:= GlbNombreArchivo;
  AplicacionExcel.Quit;
  if GLBMostrarArchivo then
  begin
    if (FileExists(NombreArchivo)) then
    ShellExecute(0,'open',PChar(NombreArchivo), '','',SW_SHOWNORMAL);
    GLBMostrarArchivo:=False;
  end;

  if (GlbEnviaEmail) then
  begin
  dmdatos.qryEmailProceso.Close;
  dmdatos.qryEmailProceso.Params[0].Value := GlbIDTipoEmail;
  dmdatos.qryEmailProceso.Open;
  dmdatos.qryEmailProceso.First;
  if (dmdatos.qryEmailProcesoSTATUS.Value = 'A') then
  begin
      if ProcZipFile(NombreArchivo, targetFile) then
      begin
        if dmdatos.qryEmailProceso.RecordCount = 1 then
        begin
          if dmCompania.tblCompania.State = dsInactive then
          dmCompania.tblCompania.open;
          dmCompania.tblCompania.Locate('codigo',glbCia_Key,[]);

          ProcLogTrackingEmail(glbidtipoemail,dmdatos.qryEmailProcesoEMAIL_SERVER.Value,
          dmdatos.qryEmailProcesoPORT.AsString,dmdatos.qryEmailProcesoUSER_EMAIL.Value,
          Desencriptar(dmdatos.qryEmailProcesoUSER_PASSWORD.Value,2005),
          now,dmdatos.qryEmailProcesoTOEMAIL.Value,dmdatos.qryEmailProcesoFROMEMAIL.Value,
          dmdatos.qryEmailProcesoSUBJECT.Value+' -CIA:'+
          dmCompania.tblCompaniaNOMBRE.Value+
          ''#13#10'Sucursal : '+dmCompania.tblCompaniaNUM_SUCURSAL.AsString+' '+FormatDateTime('dd/mm/yyyy hh:mm a/p',now),
          ''#13#10'Reporte',
          VarUsuarioGlb,'A','',now,strusername,FormatDateTime('dd/mm/yyyy hh:mm a/p',now),strusername,targetFile,dmCompania.tblCompaniaEMAIL.Value,dmCompania.tblCompaniaNOMBRE.Value);
        end;
      end;
      GlbEnviaEmail:=False;

  end;
  end;

  //Application.ProcessMessages;
end;

procedure ExporNCFListToExcel(mTabla : TIBQuery; NombreArchivo : String);
const
  xlWBATWorksheet = -4167;
var
  rangoExcel : Variant;
  i, fila : integer;
  mMarcador : Tbookmarkstr;
  AplicacionExcel : Olevariant;
  frm: TForm;
  ProgressBar1: TProgressBar;
  ProgressBar2: TProgressBar;
  targetFile : string;
begin
  rangoExcel:= ExcelXp.xlRange;
  aplicacionExcel := CreateOleObject('Excel.Application');
  aplicacionExcel.Visible:= false;
  aplicacionExcel.workbooks.add(xlWBATWorksheet);
  rangoExcel := aplicacionExcel.ActiveCell;

  frm := TForm.Create(Nil);
  //frm.OnKeyPress := my;
  ProgressBar1:= TProgressBar.Create(Nil);
  ProgressBar2:= TProgressBar.Create(Nil);
  try
    With Frm Do
    begin
      Frm.Color := clCream;
      Frm.Position:= poOwnerFormCenter;
      Frm.BorderStyle := bsNone;
      Caption:= 'Creado en ejecución';
      Height:= 100;
      Width := 800;
      With TLabel.Create(Nil) Do
      begin
        Caption:='Generando reporte...espere.';
        Left:= 8;
        Top:= 8;
        Height:= 25;
        Width:= 200;
        Parent:= Frm;
      end;

    //With TProgressBar.Create(Nil) Do
    //begin
      ProgressBar1.Left:= 8;
      ProgressBar1.Top := 22;
      ProgressBar1.width:= 600;
      ProgressBar1.Max:= mTabla.RecordCount;
      ProgressBar1.StepBy(1);
      ProgressBar1.Position:=0;
      ProgressBar1.Parent:= Frm;

      ProgressBar2.Left:= 8;
      ProgressBar2.Top := 56;
      ProgressBar2.width:= 600;
      ProgressBar2.Max:=  mTabla.Fields.Count;
      ProgressBar2.StepBy(1);
      ProgressBar2.Parent:= Frm;
    //end;

  For i:= 0 To mTabla.Fields.Count - 1 Do
  begin
    rangoExcel.Value := mTabla.Fields[i].DisplayLabel;
    rangoExcel := rangoExcel.Next;
  end;

  mTabla.DisableControls;
  try
    mMarcador := mTabla.Bookmark;
    try
      mTabla.Last;
      ProgressBar1.Max:= mTabla.RecordCount;
      mTabla.First;
      ProgressBar1.Position:= 0;
      ProgressBar1.Step    := 1;
      fila := 2;
      frm.Show;

      While Not mTabla.Eof do
      begin
        //ProgressBar1.StepBy(1);
        rangoExcel := AplicacionExcel.Range['A' + IntToStr(fila), 'A' + IntToStr(fila)];
        ProgressBar2.Position:=0;
        for i := 0 to mTabla.Fields.Count - 1 do
        begin
          rangoExcel.Value := mTabla.Fields[i].AsString;
          rangoExcel := rangoExcel.Next;
          ProgressBar2.StepIt;
          //Application.ProcessMessages;
        end;
        ProgressBar1.StepIt;
        mTabla.Next;
        Inc(fila);
        Application.ProcessMessages;
      end;
      finally
      mTabla.Bookmark := mMarcador;
      end;
    finally
    end;
  end;
  finally
  frm.Hide;
  FreeAndNil(frm);
  end;
  mTabla.EnableControls;

  NombreArchivo:=NombreArchivo+FormatDateTime('ddmmyy_hhmm',Now)+'.xls';
  AplicacionExcel.Workbooks[1].SaveAs(NombreArchivo);

  AplicacionExcel.Quit;
  if GLBMostrarArchivo then
  begin
    if (FileExists(NombreArchivo)) then
    ShellExecute(0,'open',PChar(NombreArchivo), '','',SW_SHOWNORMAL);
    GLBMostrarArchivo:=False;
  end; 

  dmdatos.qryEmailProceso.Close;
  dmdatos.qryEmailProceso.Params[0].Value := GlbIDTipoEmail;
  dmdatos.qryEmailProceso.Open;
  dmdatos.qryEmailProceso.First;
  if (dmdatos.qryEmailProcesoSTATUS.Value = 'A') then
  begin
    if (GlbEnviaEmail) then
    begin
      if ProcZipFile(NombreArchivo, targetFile) then
      begin
        if dmdatos.qryEmailProceso.RecordCount = 1 then
        begin
          if dmCompania.tblCompania.State = dsInactive then
          dmCompania.tblCompania.open;
          dmCompania.tblCompania.Locate('codigo',glbCia_Key,[]);

          ProcLogTrackingEmail(glbidtipoemail,dmdatos.qryEmailProcesoEMAIL_SERVER.Value,
          dmdatos.qryEmailProcesoPORT.AsString,dmdatos.qryEmailProcesoUSER_EMAIL.Value,
          Desencriptar(dmdatos.qryEmailProcesoUSER_PASSWORD.Value,2005),
          now,dmdatos.qryEmailProcesoTOEMAIL.Value,dmdatos.qryEmailProcesoFROMEMAIL.Value,
          dmdatos.qryEmailProcesoSUBJECT.Value+' -CIA:'+
          dmCompania.tblCompaniaNOMBRE.Value+
          ''#13#10'Sucursal : '+dmCompania.tblCompaniaNUM_SUCURSAL.AsString+' '+FormatDateTime('dd/mm/yyyy hh:mm a/p',now),
          ''#13#10'Detalle de Ventas con NCF generado',
          VarUsuarioGlb,'A','',now,strusername,FormatDateTime('dd/mm/yyyy hh:mm a/p',now),strusername,targetFile,dmCompania.tblCompaniaEMAIL.Value,dmCompania.tblCompaniaNOMBRE.Value);
        end;
      end;
      GlbEnviaEmail:=False;
    end;
  end;
    //Application.ProcessMessages;
end;

Function SetMergeCells(sheet:variant;cel1:variant;cel2:variant;
MergeCells:boolean):boolean;
begin
  SetMergeCells:=true;
  try
    Hoja.Range[cel1, cel2].Merge(MergeCells);
    Hoja.Range[cel1, cel2].HorizontalAlignment := xlCenter;
  except
  SetMergeCells:=False;
  end;
End;


Procedure ExporToExcelInvReorden(mTabla : TIBQuery; NombreArchivo : String; ZipFile:boolean);
var
  SL: TStringList;
  targetFile: string;
  ExcelFile: string;
  DirOut: string;

  function HtmlEncode(const S: string): string;
  begin
    Result := S;
    Result := StringReplace(Result, '&', '&amp;', [rfReplaceAll]);
    Result := StringReplace(Result, '<', '&lt;', [rfReplaceAll]);
    Result := StringReplace(Result, '>', '&gt;', [rfReplaceAll]);
    Result := StringReplace(Result, '"', '&quot;', [rfReplaceAll]);
  end;

  function FieldStr(const AFieldName: string): string;
  begin
    if mTabla.FindField(AFieldName) = nil then
      Result := ''
    else if mTabla.FieldByName(AFieldName).IsNull then
      Result := ''
    else
      Result := HtmlEncode(mTabla.FieldByName(AFieldName).AsString);
  end;

  function FieldFloatStr(const AFieldName: string): string;
  begin
    if mTabla.FindField(AFieldName) = nil then
      Result := '0.00'
    else if mTabla.FieldByName(AFieldName).IsNull then
      Result := '0.00'
    else
      Result := FormatFloat('#,##0.00', mTabla.FieldByName(AFieldName).AsFloat);
  end;

  function FieldDateStr(const AFieldName: string): string;
  begin
    if mTabla.FindField(AFieldName) = nil then
      Result := ''
    else if mTabla.FieldByName(AFieldName).IsNull then
      Result := ''
    else
      Result := FormatDateTime('dd/mm/yyyy', mTabla.FieldByName(AFieldName).AsDateTime);
  end;

  function BuildExcelFileName(const ABaseName: string): string;
  begin
    Result := Trim(ABaseName);
    Result := StringReplace(Result, '\\', '\', [rfReplaceAll]);

    if ExtractFileExt(Result) = '' then
      Result := Result + '.xls'
    else if UpperCase(ExtractFileExt(Result)) <> '.XLS' then
      Result := ChangeFileExt(Result, '.xls');
  end;

begin
  targetFile := '';
  NombreArchivo := StringReplace(NombreArchivo, '\\', '\', [rfReplaceAll]);
  ExcelFile := BuildExcelFileName(NombreArchivo);

  DirOut := ExtractFileDir(ExcelFile);
  if (DirOut <> '') and (not DirectoryExists(DirOut)) then
    ForceDirectories(DirOut);

  SL := TStringList.Create;
  try
    SL.Add('<html>');
    SL.Add('<head>');
    SL.Add('<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">');
    SL.Add('<style>');
    SL.Add('body { font-family: Arial; font-size: 10pt; }');
    SL.Add('table { border-collapse: collapse; }');
    SL.Add('th { background-color: #D9EAF7; font-weight: bold; text-align: center; border: 1px solid #808080; }');
    SL.Add('td { border: 1px solid #808080; padding: 3px; }');
    SL.Add('.titulo { font-size: 14pt; font-weight: bold; text-align: center; }');
    SL.Add('.subtitulo { font-size: 12pt; font-weight: bold; text-align: center; }');
    SL.Add('.num { text-align: right; mso-number-format:"#,##0.00"; }');
    SL.Add('.fecha { text-align: center; mso-number-format:"dd/mm/yyyy"; }');
    SL.Add('</style>');
    SL.Add('</head>');
    SL.Add('<body>');

    SL.Add('<table>');
    SL.Add('<tr><td colspan="11" class="titulo">' + HtmlEncode(dmCompania.tblCompaniaNombre.Value) + '</td></tr>');
    SL.Add('<tr><td colspan="11" class="subtitulo">INVENTARIO EN PUNTO DE REORDEN</td></tr>');
    SL.Add('<tr><td colspan="11" class="subtitulo">' + HtmlEncode(UpperCase(GlbrangoFecha)) + '</td></tr>');
    SL.Add('<tr><td colspan="11" class="subtitulo">Valores en RD$</td></tr>');
    SL.Add('<tr><td colspan="11">&nbsp;</td></tr>');

    SL.Add('<tr>');
    SL.Add('<th>Código</th>');
    SL.Add('<th>Código Barra</th>');
    SL.Add('<th>Descripción</th>');
    SL.Add('<th>Proveedor</th>');
    SL.Add('<th>Teléfono Prov.</th>');
    SL.Add('<th>Email Proveedor</th>');
    SL.Add('<th>Última Venta</th>');
    SL.Add('<th>Costo</th>');
    SL.Add('<th>Precio Venta</th>');
    SL.Add('<th>Existencia</th>');
    SL.Add('<th>Punto Reorden</th>');
    SL.Add('</tr>');

    mTabla.First;
    while not mTabla.Eof do
    begin
      SL.Add('<tr>');
      SL.Add('<td>' + FieldStr('CODIGO') + '</td>');
      SL.Add('<td>' + FieldStr('CODIGO_BARRA') + '</td>');
      SL.Add('<td>' + FieldStr('DESCRIPCION') + '</td>');
      SL.Add('<td>' + FieldStr('DESCPROVEEDOR') + '</td>');
      SL.Add('<td>' + FieldStr('TELF_PROV') + '</td>');
      SL.Add('<td>' + FieldStr('EMAILPROVEEDOR') + '</td>');
      SL.Add('<td class="fecha">' + FieldDateStr('FECHAULTVENTA') + '</td>');
      SL.Add('<td class="num">' + FieldFloatStr('PRECIOCOSTO') + '</td>');
      SL.Add('<td class="num">' + FieldFloatStr('PRECIOVENTA') + '</td>');
      SL.Add('<td class="num">' + FieldFloatStr('CANTIDAD') + '</td>');
      SL.Add('<td class="num">' + FieldFloatStr('CANTIDAD_REORDEN') + '</td>');
      SL.Add('</tr>');

      mTabla.Next;
      Application.ProcessMessages;
      if GlbCerrandoSistema then
        Break;
    end;

    SL.Add('</table>');
    SL.Add('</body>');
    SL.Add('</html>');

    SL.SaveToFile(ExcelFile);
  finally
    SL.Free;
  end;

  if not FileExists(ExcelFile) then
    raise Exception.Create('No se pudo generar el archivo Excel: ' + ExcelFile);

  if GLBMostrarArchivo then
    GlbRutaExeLIbroVenta := ExcelFile;

  dmdatos.qryEmailProceso.Close;
  dmdatos.qryEmailProceso.Params[0].Value := GlbIDTipoEmail;
  dmdatos.qryEmailProceso.Open;
  dmdatos.qryEmailProceso.First;

  if dmdatos.qryEmailProcesoSTATUS.Value = 'A' then
  begin
    if GlbEnviaEmail then
    begin
      if ZipFile then
      begin
        ProcZipFile(ExcelFile, targetFile);

        if Trim(targetFile) = '' then
          raise Exception.Create('ProcZipFile no retornó el archivo destino.');

        if not FileExists(targetFile) then
          raise Exception.Create('No existe el archivo ZIP generado: ' + targetFile);
      end
      else
        targetFile := ExcelFile;

      if Trim(targetFile) = '' then
        raise Exception.Create('La ruta del archivo adjunto está vacía.');

      if not FileExists(targetFile) then
        raise Exception.Create('No existe el archivo adjunto: ' + targetFile);

      if dmdatos.qryEmailProceso.RecordCount = 1 then
      begin
        if dmCompania.tblCompania.State = dsInactive then
          dmCompania.tblCompania.Open;

        dmCompania.tblCompania.Locate('codigo', glbCia_Key, []);

        ProcLogTrackingEmail(
          glbidtipoemail,
          dmdatos.qryEmailProcesoEMAIL_SERVER.Value,
          dmdatos.qryEmailProcesoPORT.AsString,
          dmdatos.qryEmailProcesoUSER_EMAIL.Value,
          Desencriptar(dmdatos.qryEmailProcesoUSER_PASSWORD.Value, 2005),
          Now,
          dmdatos.qryEmailProcesoTOEMAIL.Value,
          dmdatos.qryEmailProcesoFROMEMAIL.Value,
          dmdatos.qryEmailProcesoSUBJECT.Value + ' -CIA:' +
          dmCompania.tblCompaniaNOMBRE.Value +
          ' Sucursal : ' + dmCompania.tblCompaniaNUM_SUCURSAL.AsString + ' ' +
          FormatDateTime('dd/mm/yyyy hh:mm a/p', Now),
          'Inventario en reorden.',
          VarUsuarioGlb,
          'A',
          '',
          Now,
          strusername,
          FormatDateTime('dd/mm/yyyy hh:mm a/p', Now),
          strusername,
          targetFile,
          dmCompania.tblCompaniaEMAIL.Value,
          dmCompania.tblCompaniaNOMBRE.Value
        );
      end;

      GlbEnviaEmail := False;
    end;
  end;

  Application.ProcessMessages;
  if GlbCerrandoSistema then
    Exit;
end;

Procedure ExporToExcelInvReordenEXCEL(mTabla : TIBQuery; NombreArchivo : String);
Var
  fila : Integer;
  frm: TForm;
  ProgressBar1: TProgressBar;
  ProgressBar2: TProgressBar;
  targetFile : string;
  fIni : Integer;
  fFin : Integer;
begin
  NombreArchivo := StringReplace(NombreArchivo, '\\', '\', []);

  frm := TForm.Create(nil);
  ProgressBar1 := TProgressBar.Create(nil);
  ProgressBar2 := TProgressBar.Create(nil);

  try
    With Frm Do
    begin
      Frm.Color := clCream;
      Frm.Position := poOwnerFormCenter;
      Frm.BorderStyle := bsNone;
      Caption := 'Creado en ejecución';
      Height := 100;
      Width := 800;

      With TLabel.Create(nil) Do
      begin
        Caption := 'Generando reporte...espere.';
        Left := 8;
        Top := 8;
        Height := 25;
        Width := 300;
        Parent := Frm;
      end;

      ProgressBar1.Left := 8;
      ProgressBar1.Top := 22;
      ProgressBar1.Width := 600;
      ProgressBar1.Max := mTabla.RecordCount;
      ProgressBar1.Position := 0;
      ProgressBar1.Parent := Frm;

      ProgressBar2.Left := 8;
      ProgressBar2.Top := 56;
      ProgressBar2.Width := 600;
      ProgressBar2.Max := 11;
      ProgressBar2.Position := 0;
      ProgressBar2.Parent := Frm;
    end;

    frm.Show;
    Application.ProcessMessages;

    Excel := TExcelApplication.Create(nil);
    Excel.Connect;

    Excel.Workbooks.Add(NULL, 0);

    Hoja := Excel.Worksheets.Item[1] as _WorkSheet;
    Hoja.Name := 'Inv. Reorden';

    { Encabezado principal }
    Hoja.Range['A1', 'K1'].MergeCells := True;
    Hoja.Range['A2', 'K2'].MergeCells := True;
    Hoja.Range['A3', 'K3'].MergeCells := True;
    Hoja.Range['A4', 'K4'].MergeCells := True;

    Hoja.Range['A1', 'A1'].Value2 := dmCompania.tblCompaniaNombre.Value;
    Hoja.Range['A2', 'A2'].Value2 := 'INVENTARIO EN PUNTO DE REORDEN';
    Hoja.Range['A3', 'A3'].Value2 := UpperCase(GlbrangoFecha);
    Hoja.Range['A4', 'A4'].Value2 := 'Valores en RD$';

    Hoja.Range['A1', 'K4'].Font.Bold := True;
    Hoja.Range['A1', 'K4'].HorizontalAlignment := xlCenter;

    { Titulos }
    fila := 7;
    fIni := fila + 1;

    Hoja.Range['A' + IntToStr(fila), 'A' + IntToStr(fila)].Value2 := 'Código';
    Hoja.Range['B' + IntToStr(fila), 'B' + IntToStr(fila)].Value2 := 'Código Barra';
    Hoja.Range['C' + IntToStr(fila), 'C' + IntToStr(fila)].Value2 := 'Descripción';
    Hoja.Range['D' + IntToStr(fila), 'D' + IntToStr(fila)].Value2 := 'Proveedor';
    Hoja.Range['E' + IntToStr(fila), 'E' + IntToStr(fila)].Value2 := 'Teléfono Prov.';
    Hoja.Range['F' + IntToStr(fila), 'F' + IntToStr(fila)].Value2 := 'Email Proveedor';
    Hoja.Range['G' + IntToStr(fila), 'G' + IntToStr(fila)].Value2 := 'Última Venta';
    Hoja.Range['H' + IntToStr(fila), 'H' + IntToStr(fila)].Value2 := 'Costo';
    Hoja.Range['I' + IntToStr(fila), 'I' + IntToStr(fila)].Value2 := 'Precio Venta';
    Hoja.Range['J' + IntToStr(fila), 'J' + IntToStr(fila)].Value2 := 'Existencia';
    Hoja.Range['K' + IntToStr(fila), 'K' + IntToStr(fila)].Value2 := 'Punto Reorden';

    Hoja.Range['A' + IntToStr(fila), 'K' + IntToStr(fila)].Font.Bold := True;
    Hoja.Range['A' + IntToStr(fila), 'K' + IntToStr(fila)].HorizontalAlignment := xlCenter;

    Inc(fila);

    mTabla.First;

    While Not mTabla.Eof do
    begin
      ProgressBar2.Position := 0;

      Hoja.Range['A' + IntToStr(fila), 'A' + IntToStr(fila)].Value2 :=
        mTabla.FieldByName('CODIGO').AsString;
      ProgressBar2.StepIt;

      Hoja.Range['B' + IntToStr(fila), 'B' + IntToStr(fila)].Value2 :=
        mTabla.FieldByName('CODIGO_BARRA').AsString;
      ProgressBar2.StepIt;

      Hoja.Range['C' + IntToStr(fila), 'C' + IntToStr(fila)].Value2 :=
        mTabla.FieldByName('DESCRIPCION').AsString;
      ProgressBar2.StepIt;

      Hoja.Range['D' + IntToStr(fila), 'D' + IntToStr(fila)].Value2 :=
        mTabla.FieldByName('DESCPROVEEDOR').AsString;
      ProgressBar2.StepIt;

      Hoja.Range['E' + IntToStr(fila), 'E' + IntToStr(fila)].Value2 :=
        mTabla.FieldByName('TELF_PROV').AsString;
      ProgressBar2.StepIt;

      Hoja.Range['F' + IntToStr(fila), 'F' + IntToStr(fila)].Value2 :=
        mTabla.FieldByName('EMAILPROVEEDOR').AsString;
      ProgressBar2.StepIt;

      if not mTabla.FieldByName('FECHAULTVENTA').IsNull then
        Hoja.Range['G' + IntToStr(fila), 'G' + IntToStr(fila)].Value2 :=
          FormatDateTime('dd/mm/yyyy', mTabla.FieldByName('FECHAULTVENTA').AsDateTime)
      else
        Hoja.Range['G' + IntToStr(fila), 'G' + IntToStr(fila)].Value2 := '';
      ProgressBar2.StepIt;

      Hoja.Range['H' + IntToStr(fila), 'H' + IntToStr(fila)].Value2 :=
        mTabla.FieldByName('PRECIOCOSTO').AsFloat;
      ProgressBar2.StepIt;

      Hoja.Range['I' + IntToStr(fila), 'I' + IntToStr(fila)].Value2 :=
        mTabla.FieldByName('PRECIOVENTA').AsFloat;
      ProgressBar2.StepIt;

      Hoja.Range['J' + IntToStr(fila), 'J' + IntToStr(fila)].Value2 :=
        mTabla.FieldByName('CANTIDAD').AsFloat;
      ProgressBar2.StepIt;

      Hoja.Range['K' + IntToStr(fila), 'K' + IntToStr(fila)].Value2 :=
        mTabla.FieldByName('CANTIDAD_REORDEN').AsFloat;
      ProgressBar2.StepIt;

      ProgressBar1.StepIt;

      mTabla.Next;
      Inc(fila);

      Application.ProcessMessages;
    end;

    fFin := fila - 1;

    { Formato columnas }
    Hoja.Range['A:A', 'A:A'].ColumnWidth := 12;
    Hoja.Range['B:B', 'B:B'].ColumnWidth := 18;
    Hoja.Range['C:C', 'C:C'].ColumnWidth := 45;
    Hoja.Range['D:D', 'D:D'].ColumnWidth := 35;
    Hoja.Range['E:E', 'E:E'].ColumnWidth := 18;
    Hoja.Range['F:F', 'F:F'].ColumnWidth := 35;
    Hoja.Range['G:G', 'G:G'].ColumnWidth := 14;
    Hoja.Range['H:H', 'I:I'].ColumnWidth := 14;
    Hoja.Range['J:J', 'K:K'].ColumnWidth := 14;

    if fFin >= fIni then
    begin
      Hoja.Range['H' + IntToStr(fIni), 'I' + IntToStr(fFin)].NumberFormat := '#,##0.00';
      Hoja.Range['J' + IntToStr(fIni), 'K' + IntToStr(fFin)].NumberFormat := '#,##0.00';
      Hoja.Range['G' + IntToStr(fIni), 'G' + IntToStr(fFin)].NumberFormat := 'dd/mm/yyyy';

      Hoja.Range['A7', 'K' + IntToStr(fFin)].Borders.LineStyle := xlContinuous;
      Hoja.Range['A7', 'K' + IntToStr(fFin)].VerticalAlignment := xlCenter;
    end;

    { Congelar encabezado visualmente no siempre funciona igual en Delphi 7 COM,
      por eso no se fuerza aquí para evitar errores por versión de Excel. }

    Excel.ActiveWorkbook.SaveAs(
      NombreArchivo + '.xls',
      EmptyParam, EmptyParam, EmptyParam,
      EmptyParam, EmptyParam, xlNoChange,
      EmptyParam, EmptyParam, EmptyParam,
      EmptyParam, EmptyParam, 0
    );

    Excel.Quit;
    Excel.Disconnect;

  finally
    FreeAndNil(Excel);
    frm.Hide;
    FreeAndNil(frm);
  end;

  if GLBMostrarArchivo then
  begin
    if FileExists(NombreArchivo + '.xls') then
    begin
      GlbRutaExeLIbroVenta := NombreArchivo + '.xls';
    end;
  end;

  dmdatos.qryEmailProceso.Close;
  dmdatos.qryEmailProceso.Params[0].Value := GlbIDTipoEmail;
  dmdatos.qryEmailProceso.Open;
  dmdatos.qryEmailProceso.First;

  if (dmdatos.qryEmailProcesoSTATUS.Value = 'A') then
  begin
    if (GlbEnviaEmail) then
    begin
      if ProcZipFile(NombreArchivo, targetFile) then
      begin
        if dmdatos.qryEmailProceso.RecordCount = 1 then
        begin
          if dmCompania.tblCompania.State = dsInactive then
            dmCompania.tblCompania.Open;

          dmCompania.tblCompania.Locate('codigo', glbCia_Key, []);

          ProcLogTrackingEmail(
            glbidtipoemail,
            dmdatos.qryEmailProcesoEMAIL_SERVER.Value,
            dmdatos.qryEmailProcesoPORT.AsString,
            dmdatos.qryEmailProcesoUSER_EMAIL.Value,
            Desencriptar(dmdatos.qryEmailProcesoUSER_PASSWORD.Value, 2005),
            Now,
            dmdatos.qryEmailProcesoTOEMAIL.Value,
            dmdatos.qryEmailProcesoFROMEMAIL.Value,
            dmdatos.qryEmailProcesoSUBJECT.Value + ' -CIA:' +
            dmCompania.tblCompaniaNOMBRE.Value +
            ' Sucursal : ' + dmCompania.tblCompaniaNUM_SUCURSAL.AsString + ' ' +
            FormatDateTime('dd/mm/yyyy hh:mm a/p', Now),
            'Inventario en reorden.',
            VarUsuarioGlb,
            'A',
            '',
            Now,
            strusername,
            FormatDateTime('dd/mm/yyyy hh:mm a/p', Now),
            strusername,
            targetFile,
            dmCompania.tblCompaniaEMAIL.Value,
            dmCompania.tblCompaniaNOMBRE.Value
          );
        end;
      end;

      GlbEnviaEmail := False;
    end;
  end;

  Application.ProcessMessages;
end;

Procedure ExporToExcelFCTCuadre(mTabla : TIBQuery; NombreArchivo : String);

  Var fila : Integer;
  rangoExcel : OleVariant;
  frm: TForm;
  ProgressBar1: TProgressBar;
  ProgressBar2: TProgressBar;
  targetFile : string;
  i : Integer;
  fIni : integer;
  fFin : Integer;
begin
  NombreArchivo:=StringReplace(NombreArchivo,'\\','\',[]);
  frm := TForm.Create(Nil);
  //frm.OnKeyPress := my;
  ProgressBar1:= TProgressBar.Create(Nil);
  ProgressBar2:= TProgressBar.Create(Nil);
  try
  With Frm Do
  begin
    Frm.Color := clCream;
    Frm.Position:= poOwnerFormCenter;
    Frm.BorderStyle := bsNone;
    Caption:= 'Creado en ejecución';
    Height:= 100;
    Width := 800;
    With TLabel.Create(Nil) Do
    begin
      Caption:='Generando reporte...espere.';
      Left:= 8;
      Top:= 8;
      Height:= 25;
      Width:= 200;
      Parent:= Frm;
    end;

    //With TProgressBar.Create(Nil) Do
    //begin
      ProgressBar1.Left:= 8;
      ProgressBar1.Top := 22;
      ProgressBar1.width:= 600;
      ProgressBar1.Max  := mTabla.RecordCount;
      ProgressBar1.StepBy(1);
      ProgressBar1.Position:=0;
      ProgressBar1.Parent  := Frm;

      ProgressBar2.Left:= 8;
      ProgressBar2.Top := 56;
      ProgressBar2.width:= 600;
      ProgressBar2.Max  :=  mTabla.Fields.Count;
      ProgressBar2.StepBy(1);
      ProgressBar2.Parent:= Frm;
  end;

  //Abrimos excel
  Excel:= TExcelApplication.Create(nil);
  Excel.Connect;

  // Creamos un nuevo libro con tres hojas (predeterminado)
  Excel.Workbooks.Add( NULL, 0 );

  //3º A la primera hoja del libro la llamamos Presupuesto:

  // Apuntamos a la primera hoja y le cambiamos el nombre
  Hoja := Excel.Worksheets.Item[1] as _WorkSheet;
  Hoja.Name := 'Sheet1';

  //4º Creamos los títulos de las columnas:
  //Encabezado
  // Títulos de los datos
  //Hoja.Range['A1','A4'].ColumnWidth := 64;
  Hoja.Range['A1','A1'].Value2 := dmCompania.tblCompaniaNombre.Value  ;
  Hoja.Range['A2','A2'].Value2 := 'CUADRE DIARIO DE VENTAS POR FACTURAS';

  Hoja.Range['A3','A3'].Value2 :=  UpperCase(GlbrangoFecha);
  Hoja.Range['A4','A4'].Value2 := 'Valores en RD$';

  //Hoja.Range['A7','A7'].Value2 := 'INGRESOS';
  //Hoja.Range['B7','B7'].Value2 := 'MONTO';
  Hoja.Range['A1','B4'].Font.Bold := True;

  //t SetMergeCells(Hoja.Name,'A1','B4',True);
  //5º Introducimos los datos dentro de las columnas:
  fila := 7;
  mTabla.first;
  fIni:=fila;
  rangoExcel := Hoja.Range['A' + IntToStr(fila), 'A' + IntToStr(fila)];
  for i := 0 to mTabla.Fields.Count - 1 do
  begin
    //IF (uPPERCASE(mTabla.Fields[i].FieldName) = 'TRANS') then
    //continue;
    rangoExcel.Value := mTabla.Fields[i].FieldName;
    rangoExcel := rangoExcel.Next;
    ProgressBar2.StepIt;
  end;
  Inc(fila,1);
  //'INGRESOS'
  While Not mTabla.Eof do
  begin
    {if uppercase(TRIM(mTabla.FieldByName('TRANS').AsString)) = 'GASTOS' then
    begin
      mTabla.Next;
      Continue;
    end;  }
    rangoExcel := Hoja.Range['A' + IntToStr(fila), 'A' + IntToStr(fila)];

    ProgressBar2.Position:=0;
    for i := 0 to mTabla.Fields.Count - 1 do
    begin
      //IF (uPPERCASE(mTabla.Fields[i].FieldName) = 'TRANS') then
      //continue;
      rangoExcel.Value := mTabla.Fields[i].AsString;
      rangoExcel := rangoExcel.Next;
      ProgressBar2.StepIt;
    end;
    ProgressBar1.StepIt;
    mTabla.Next;
    Inc(fila);
    Application.ProcessMessages;
  end;
  rangoExcel.Value := '';
  rangoExcel := rangoExcel.Next;
  rangoExcel.Value := '';
  rangoExcel := rangoExcel.Next;
  //Hoja.Range['B2','B2'].Formula := '=A2*C2';
  fFin:=Fila;
  //Hoja.Range['A' + IntToStr(fila+1), 'A' + IntToStr(fila+1)].Value2 := 'Total Ingresos';
  //Hoja.Range['D' + '8', 'D' + InttoStr(fila+1)].NumberFormat := '0,00';
  //Hoja.Range['D' + IntToStr(fila+1), 'D' + IntToStr(fila+1)].Formula := '=sum(D'+inttostr(fini)+':D'+inttostr(ffin)+')';
  //Hoja.Range['D' + IntToStr(fila+1), 'G' + IntToStr(fila+1)].Font.Bold := True;

  Inc(fila,0);

  //7º Damos formato decimal a las columnas del precio y los totales y para ésta última columna le cambiamos los colores:

  // Formato decimal
  fFin := fila;
  Hoja.Range['E' + IntToStr(fila+1), 'E' + IntToStr(fila+1)].ColumnWidth:=40;
  Hoja.Range['D' + IntToStr(fila+1), 'D' + IntToStr(fila+1)].ColumnWidth:=10;
  Hoja.Range['b' + IntToStr(fila+1), 'b' + IntToStr(fila+1)].ColumnWidth:=11;
  Hoja.Range['D' + IntToStr(fila+1), 'D' + IntToStr(fila+1)].Value2 := 'TOTALES';
  Hoja.Range['F' + '8', 'H' +InttoStr(fila+1)].NumberFormat := '#,##0.00';
  Hoja.Range['F' + IntToStr(fila+1), 'F' + IntToStr(fila+1)].Formula := '=sum(F'+inttostr(fini)+':F'+inttostr(ffin)+')';
  Hoja.Range['G' + IntToStr(fila+1), 'G' + IntToStr(fila+1)].Formula := '=sum(G'+inttostr(fini)+':G'+inttostr(ffin)+')';
  Hoja.Range['H' + IntToStr(fila+1), 'H' + IntToStr(fila+1)].Formula := '=sum(H'+inttostr(fini)+':H'+inttostr(ffin)+')';
  Hoja.Range['D' + IntToStr(fila+1), 'H' + IntToStr(fila+1)].Font.Bold := True;
  
  //8º Por último guardamos la hoja de cálculo y desconectamos de Excel:

  // Lo primero que hacemos es guardarlo
  Excel.ActiveWorkbook.SaveAs(NombreArchivo+'.xls',
  EmptyParam, EmptyParam, EmptyParam,
  EmptyParam, EmptyParam, xlNoChange,
  EmptyParam, EmptyParam, EmptyParam,
  EmptyParam, EmptyParam, 0);

  Excel.Quit;
  Excel.Disconnect;
  finally
  FreeAndNil(Excel);
  frm.Hide;
  FreeAndNil(frm);
  end;
  if GLBMostrarArchivo then
  //ShellExecute(0, 'open', PChar(NombreArchivo) ,nil ,nil, SW_SHOW);
  if (FileExists(NombreArchivo+'.xls')) then
  Begin
    //ShellExecute(0,'open',PChar(NombreArchivo), '','',SW_SHOWNORMAL);
    
    GlbRutaExeLIbroVenta:= NombreArchivo+'.xls';
  end;
end;

procedure ExporNCFListToExcelFPago(mTabla : TIBQuery; NombreArchivo : String);
const
  xlWBATWorksheet = -4167;

var
  rangoExcel : Variant;
  i, fila : integer;
  mMarcador : Tbookmarkstr;
  AplicacionExcel : Olevariant;
  frm: TForm;
  ProgressBar1: TProgressBar;
  ProgressBar2: TProgressBar;
  targetFile : string;
begin
  rangoExcel:= ExcelXp.xlRange;
  aplicacionExcel := CreateOleObject('Excel.Application');
  aplicacionExcel.Visible:= false;
  aplicacionExcel.workbooks.add(xlWBATWorksheet);
  rangoExcel := aplicacionExcel.ActiveCell;

  frm := TForm.Create(Nil);
  //frm.OnKeyPress := my;
  ProgressBar1:= TProgressBar.Create(Nil);
  ProgressBar2:= TProgressBar.Create(Nil);
  try
  With Frm Do
  begin
    Frm.Color := clCream;
    Frm.Position:= poOwnerFormCenter;
    Frm.BorderStyle := bsNone;
    Caption:= 'Creado en ejecución';
    Height:= 100;
    Width := 800;
    With TLabel.Create(Nil) Do
    begin
      Caption:='Generando reporte...espere.';
      Left:= 8;
      Top:= 8;
      Height:= 25;
      Width:= 200;
      Parent:= Frm;
    end;

    //With TProgressBar.Create(Nil) Do
    //begin
      ProgressBar1.Left:= 8;
      ProgressBar1.Top := 22;
      ProgressBar1.width:= 600;
      ProgressBar1.Max:= mTabla.RecordCount;
      ProgressBar1.StepBy(1);
      ProgressBar1.Position:=0;
      ProgressBar1.Parent:= Frm;

      ProgressBar2.Left:= 8;
      ProgressBar2.Top := 56;
      ProgressBar2.width:= 600;
      ProgressBar2.Max:=  mTabla.Fields.Count;
      ProgressBar2.StepBy(1);
      ProgressBar2.Parent:= Frm;
    //end;

  For i:= 0 To mTabla.Fields.Count - 1 Do
  begin
    rangoExcel.Value := mTabla.Fields[i].DisplayLabel;
    rangoExcel := rangoExcel.Next;
  end;

  mTabla.DisableControls;
  try
    mMarcador := mTabla.Bookmark;
    try
      mTabla.Last;
      ProgressBar1.Max:= mTabla.RecordCount;
      mTabla.First;
      ProgressBar1.Position:= 0;
      ProgressBar1.Step    := 1;
      fila := 2;
      frm.Show;

      While Not mTabla.Eof do
      begin
        //ProgressBar1.StepBy(1);
        rangoExcel := AplicacionExcel.Range['A' + IntToStr(fila), 'A' + IntToStr(fila)];
        ProgressBar2.Position:=0;
        for i := 0 to mTabla.Fields.Count - 1 do
        begin
          rangoExcel.Value := mTabla.Fields[i].AsString;
          rangoExcel := rangoExcel.Next;
          ProgressBar2.StepIt;
          //Application.ProcessMessages;
        end;
        ProgressBar1.StepIt;
        mTabla.Next;
        Inc(fila);
        Application.ProcessMessages;

      end;
      finally
        mTabla.Bookmark := mMarcador;
      end;
    finally
    end;
  end;
  finally
  frm.Hide;
  FreeAndNil(frm);
  end;
  mTabla.EnableControls;

  NombreArchivo:=NombreArchivo +FormatDateTime('ddmmyy_hhmm',Now)+'.xls';
  AplicacionExcel.Workbooks[1].SaveAs(NombreArchivo);

  AplicacionExcel.Quit;
  if GLBMostrarArchivo then
  begin
    if (FileExists(NombreArchivo)) then
    ShellExecute(0,'open',PChar(NombreArchivo), '','',SW_SHOWNORMAL);
    GLBMostrarArchivo:=False;
  end;


  dmdatos.qryEmailProceso.Close;
  dmdatos.qryEmailProceso.Params[0].Value := GlbIDTipoEmail;
  dmdatos.qryEmailProceso.Open;
  dmdatos.qryEmailProceso.First;
  if (dmdatos.qryEmailProcesoSTATUS.Value = 'A') then
  begin
    if (GlbEnviaEmail) then
    begin
      if ProcZipFile(NombreArchivo, targetFile) then
      begin
        if dmdatos.qryEmailProceso.RecordCount = 1 then
        begin
          if dmCompania.tblCompania.State = dsInactive then
          dmCompania.tblCompania.open;
          dmCompania.tblCompania.Locate('codigo',glbCia_Key,[]);

          ProcLogTrackingEmail(glbidtipoemail,dmdatos.qryEmailProcesoEMAIL_SERVER.Value,
          dmdatos.qryEmailProcesoPORT.AsString,dmdatos.qryEmailProcesoUSER_EMAIL.Value,
          Desencriptar(dmdatos.qryEmailProcesoUSER_PASSWORD.Value,2005),
          now,dmdatos.qryEmailProcesoTOEMAIL.Value,dmdatos.qryEmailProcesoFROMEMAIL.Value,
          dmdatos.qryEmailProcesoSUBJECT.Value+' -CIA:'+
          dmCompania.tblCompaniaNOMBRE.Value+
          ' Sucursal : '+dmCompania.tblCompaniaNUM_SUCURSAL.AsString+' '+FormatDateTime('dd/mm/yyyy hh:mm a/p',now),
          'Detalle de Ventas con Forma Pago y NCF generado',
          VarUsuarioGlb,'A','',now,strusername,FormatDateTime('dd/mm/yyyy hh:mm a/p',now),strusername,targetFile,dmCompania.tblCompaniaEMAIL.Value,dmCompania.tblCompaniaNOMBRE.Value);

        end;
      end;
      GlbEnviaEmail:=False;
    end;
  end;
    Application.ProcessMessages;
end;

function ExtraerEnteroString(SeparadorDecimal: String; CadenaFloat: String): String;
begin
  result:= Copy(CadenaFloat,0,pos(SeparadorDecimal,CadenaFloat)-1)
end;

function ExtraerDecimalString(valor:Real): String;
var
  FracPart: Real;
begin
  FracPart := valor - Trunc(valor);
  Result:=FloatToStr(FracPart);
//result:=RightStr(Texto,lenght(l)-pos(SeparadorDecimal,Texto));
end;


Function ProcZipFile(_path : String; var targetFile : String) : Boolean;
var
  flag : boolean;
  VCLZip1 :TVCLZip;
begin
  flag:= True;
  try
    targetFile := ExtractFilePath(_path)+ExtractFileName(_path)+'.zip';
    VCLZip1:= TVCLZip.Create(Nil);
    VCLZip1.ZipName := targetFile;//'C:\Proyectos\LoanProcessCE\Bin\CobrosTestVcZip.zip';
    VCLZip1.FilesList.Add(_path);
    VCLZip1.Zip;
  except
  flag:=False;
  end;
  result:=flag;
end;


procedure GenerarQRCode(OrdenID: Integer; Fecha: TDateTime; Image: TImage);
var
  QRCode: TDelphiZXingQRCode;
  BMP: TBitmap;
  TextoQR: string;
  x, y: Integer;
begin
  TextoQR := Format('ORDEN:%d|FECHA:%s', [OrdenID, FormatDateTime('yyyymmdd-hhnn', Fecha)]);

  QRCode := TDelphiZXingQRCode.Create;
  try
    QRCode.Data := TextoQR;
    QRCode.Encoding := TQRCodeEncoding(qrAuto);
    QRCode.QuietZone := 4;

    BMP := TBitmap.Create;
    try
      BMP.Width := QRCode.Rows * 4;
      BMP.Height := QRCode.Columns * 4;
      BMP.Canvas.Brush.Color := clWhite;
      BMP.Canvas.FillRect(Rect(0, 0, BMP.Width, BMP.Height));

      for y := 0 to QRCode.Rows - 1 do
        for x := 0 to QRCode.Columns - 1 do
          if QRCode.IsBlack[y, x] then
            BMP.Canvas.FillRect(Rect(x * 4, y * 4, (x + 1) * 4, (y + 1) * 4));

      Image.Picture.Bitmap := BMP;
    finally
      BMP.Free;
    end;
  finally
    QRCode.Free;
  end;
end;

procedure ScaleForm(F: TForm; ScreenWidth, ScreenHeight: LongInt) ;
begin
   F.Scaled := True;
   F.AutoScroll := False;
   F.Position := poScreenCenter;
   F.Font.Name := 'Arial';
   if (Screen.Width <> ScreenWidth) then begin
     F.Height :=
         LongInt(F.Height) * LongInt(Screen.Height)
         div ScreenHeight;
     F.Width :=
         LongInt(F.Width) * LongInt(Screen.Width)
         div ScreenWidth;
     F.ScaleBy(Screen.Width,ScreenWidth) ;
   end;
end;
Begin
  NombreMes[1] :='Enero';
  NombreMes[2] :='Febrero';
  NombreMes[3] :='Marzo';
  NombreMes[4] :='Abril';
  NombreMes[5] :='Mayo';
  NombreMes[6] :='Junio';
  NombreMes[7] :='Julio';
  NombreMes[8] :='Agosto';
  NombreMes[9] :='Septiembre';
  NombreMes[10]:='Octubre';
  NombreMes[11]:='Noviembre';
  NombreMes[12]:='Diciembre';
  NombreDia[1] :='Lun';
  NombreDia[2] :='Mar';
  NombreDia[3] :='Mie';
  NombreDia[4] :='Jue';
  NombreDia[5] :='Vie';
  NombreDia[6] :='Sab';
  NombreDia[7] :='Dom';
  VarUsuarioGlb:=-1;
  Size := 128;
  SetLength ( strUsername, Size);
  GetUserName (Pchar(strUserName),size);
  vUserName   := strUserName;
  strUserName := vUserName;
  dateCurr:=FormatDatetime('yyyy-mm-dd', Date);
  GlbMontoInteresMoraPgdo := 0;
  GlbDescNCF := '';
  GlbImpReciboSinPreg:=0;
  GlbIsAutenticado   := False;
  //GlbNoGeneraNCF   := False;
  GlbRegistrado      := True;
  GlbAccessDBConn    := '';
  GlbNumVtaPOS  := -1;
  GlbPorcItbis  := 0;
  GlbImprimiendo := False;
  GlbEntradoAvta := False;
  GlbEsPrecuenta := False;
  NCFCTeNotSetup := False;
  GlbDiasSinVenta:= 7;
  GlBLimao  := 0;
  GlBInMobi := 0;
  GlbEnviaEmailDirecto:= True;
  GlbLogoServSam      := '';
  GlbFactRecurrente   := False;
  GlbReposDocs        := '';
  GlbModeEdit:=False;
  GlbCartaPresenta:='';
  GlbMutur:=0;
  GlbTipoTransMotores:=1;
  GlbMuestraPDF:=True;
  GLBIDClienteIDESI:=1;
  GlbSubject:='';
  GlbMuestraMensajeEmail:=True;
  GlbNumVtaPOSTmp:=-1;
  GlbValorMaxVtaWarning:=250000;
  //strAppPath:=
  GlbShowCtaBanco:=0;
  GlbImprimeTicketCustom:=0;
  GlbProsesur := 0;
  GlbActivaNomina:=1;
  GlbSecECFGenerada:=False;
  //GlbUsuarioPassword  := '';
end.


