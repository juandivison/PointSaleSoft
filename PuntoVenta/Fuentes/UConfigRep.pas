unit UConfigRep;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   DialogS, Inifiles, StdCtrls, Buttons, ExtCtrls,  ComCtrls ;

type
  TfrmConfReporte = class(TForm)
    rdgRecibo: TRadioGroup;
    rdgFactura: TRadioGroup;
    rdgCotizacion: TRadioGroup;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    rdgSolDatosCliente: TRadioGroup;
    rdgImpNCFConsFinal: TRadioGroup;
    edtPiedePaginaFactura: TEdit;
    Label1: TLabel;
    rdgSolicitaDatosVeh: TRadioGroup;
    rdgFechaVenc: TRadioGroup;
    rdgMostrarPrecCodigo: TRadioGroup;
    rdgModificaPrecio: TRadioGroup;
    rdImpFact8x11: TRadioGroup;
    rdImpCotiza8x11: TRadioGroup;
    rdgVentaConCodBarra: TRadioGroup;
    chkBoxGlbImpCodProducto: TCheckBox;
    rdgIncluirITBISenPrecioLabel: TRadioGroup;
    rdgPrecioMayRegOrden: TRadioGroup;
    rdgPermiteVentaInv0: TRadioGroup;
    chboxPermiteUnaInstancia: TCheckBox;
    rdgImprimirReciboSinPreguntar: TRadioGroup;
    rdgVenderDesdeAlmacenP: TRadioGroup;
    rdgSolicitaNumLote: TRadioGroup;
    rdgFacturaLicoreria: TRadioGroup;
    rdgAplicaTransparentaitbi: TRadioGroup;
    rdgImprimeReciboFact: TRadioGroup;
    rdgGlbFirmaCajero: TRadioGroup;
    edtIdAlmacen: TEdit;
    Label2: TLabel;
    BitBtn3: TBitBtn;
    Label3: TLabel;
    rdgImpTipoUnidadRecibo: TRadioGroup;
    chkActivaMenuPan: TCheckBox;
    chkActivaCafeteria: TCheckBox;
    chkColegio: TCheckBox;
    Label4: TLabel;
    dtpkCobroMensualidad: TDateTimePicker;
    rdgMuestraInteresFactfina: TRadioGroup;
    rdgUsaEscalaPrecio: TRadioGroup;
    chboxLavanderia: TCheckBox;
    CheckBox1: TCheckBox;
    edtAncho: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    edtAlto: TEdit;
    chboxServicioComisionable: TCheckBox;
    rdgActivaIFiscal: TRadioGroup;
    rdgConduce: TRadioGroup;
    chkImpBoucher: TCheckBox;
    edtIFistaltool: TEdit;
    Label7: TLabel;
    edtEmailTool: TEdit;
    Label8: TLabel;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    chkGuardaPDF: TCheckBox;
    rdgPUnidadLevel: TRadioGroup;
    rdgPrecioMayoristaXUnidad: TRadioGroup;
    rcgActivaSecNCF_B: TRadioGroup;
    rdgImpReciboPdf: TRadioGroup;
    rdgAvisoProdVencido: TRadioGroup;
    rdgInfoProvCosto: TRadioGroup;
    rdgMuestraCodCteFct: TRadioGroup;
    rdgAplicaOferta: TRadioGroup;
    edtFConduce: TEdit;
    Label9: TLabel;
    rdgFomatoOrdDespAlmc: TRadioGroup;
    frgFormatoCuadre: TRadioGroup;
    chkCalcComisionXCanVta: TCheckBox;
    chkImpTicketVenta: TCheckBox;
    rdgCalItbis: TRadioGroup;
    edtFormatoCoti: TEdit;
    Label10: TLabel;
    rdgConduceCte: TRadioGroup;
    edtDiasSinVtas: TEdit;
    Label11: TLabel;
    cboxFarmacia: TCheckBox;
    edtPorcVenta: TEdit;
    Label12: TLabel;
    rdgActivaInmobiliaria: TRadioGroup;
    rdgFactSeguro: TRadioGroup;
    chkboxUsaFctMexico: TCheckBox;
    Label13: TLabel;
    edtRutaWisPro: TEdit;
    rdgShowLIneaReciboVenta: TRadioGroup;
    rdgECom: TRadioGroup;
    rdgReciboCxc: TRadioGroup;
    rdgMutur: TRadioGroup;
    rdgGlbImpFormatoPDF: TRadioGroup;
    rdgSurtidoraColmado: TRadioGroup;
    chkActivaProduccion: TCheckBox;
    rdgTicketPtoVta1pag: TRadioGroup;
    edtCopiasTicket: TEdit;
    Label14: TLabel;
    edtRutaFormatoLabel: TEdit;
    Label15: TLabel;
    edtCiaLabel: TEdit;
    Label16: TLabel;
    rdgImpEncuesta: TRadioGroup;
    edtMontoMaxVta: TEdit;
    Label17: TLabel;
    chkLabelZPL: TCheckBox;
    rdgDealer: TRadioGroup;
    chkboxeCF: TCheckBox;
    edtEcfRuta: TEdit;
    Label18: TLabel;
    Label19: TLabel;
    edtrutaqrecf: TEdit;
    chkboxGlbValidarECF: TCheckBox;
    RadioGroup3: TRadioGroup;
    chkGlbImprimeCustom: TCheckBox;
    edtcajaecf: TEdit;
    Label20: TLabel;
    chkActivaFinger: TCheckBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
    procedure chkGuardaPDFClick(Sender: TObject);
    procedure rdgPUnidadLevelClick(Sender: TObject);
    procedure rdgPrecioMayoristaXUnidadClick(Sender: TObject);
    procedure rdgImpReciboPdfClick(Sender: TObject);
    procedure rdgFactSeguroClick(Sender: TObject);
    procedure rdgEComClick(Sender: TObject);
    procedure cboxFarmaciaClick(Sender: TObject);
    procedure cboxFarmaciaExit(Sender: TObject);
    procedure rdgMuturClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rdgGlbImpFormatoPDFClick(Sender: TObject);
    procedure rdgSurtidoraColmadoClick(Sender: TObject);
    procedure rdgTicketPtoVta1pagClick(Sender: TObject);
    procedure rdgImpEncuestaClick(Sender: TObject);
    procedure rdgDealerClick(Sender: TObject);
    procedure edtEcfRutaExit(Sender: TObject);
    procedure RadioGroup3Click(Sender: TObject);
  private
    //procedure WMDisplayChange(var Message: TWMDisplayChange);
    { Private declarations }
  public
    { Public declarations }
    procedure DatosConfiguracion;
    procedure ProcGuardarDatos;
    procedure SetIDInventarioProd;

  end;

var
  frmConfReporte: TfrmConfReporte;

implementation
uses uglobal, USelInventario;
{$R *.dfm}

{ TForm1 }

//procedure TfrmConfReporte.WMDisplayChange(var Message: TWMDisplayChange);
//begin
//  if (edtAncho.Text = '') then
//  edtAncho.Text := IntToStr(Message.Width);

//  if (edtAlto.Text = '') then
//  edtAlto.Text  := IntToStr(Message.Height);
  //Message.BitsPerPixe
//end;
procedure TfrmConfReporte.DatosConfiguracion;
var
  Ini: TIniFile;
  NombArchivo : String;
  x: Integer;
begin
  NombArchivo := ExtractFilePath(Application.ExeName)+'\'+'repconf_cr.ini';
  Ini := TIniFile.Create(NombArchivo );

  //0: MODO 0 – convertir la misma venta, E32 ? E31 (sin duplicar venta).
  //1: MODO 1 – nueva venta E31 copiando ítems, más una Nota de Crédito E34 que anula la E32.

  GlbCajaeCF:=UpperCase(Ini.ReadString('Recibo','GlbCajaeCF',''));
  edtcajaecf.Text := GlbCajaeCF;
  GlbUsaHuellas:= Ini.ReadInteger('Venta','GlbUsaHuellas',0);
  if GlbUsaHuellas = 1 then
  chkActivaFinger.Checked:=True
  else
  chkActivaFinger.Checked:=False;

  GlbImprimeTicketCustom:=Ini.ReadInteger('Recibo','GlbImprimeTicketCustom',0);
  if GlbImprimeTicketCustom = 1 then
  chkGlbImprimeCustom.Checked:=True
  else chkGlbImprimeCustom.Checked:=False;
  
  GlbModoConsumoToCredito:=Ini.ReadInteger('IFiscal','GlbModoConsumoToCredito',0);
  RadioGroup3.ItemIndex := GlbModoConsumoToCredito;

  GlbRutaEcf:= Ini.ReadString('IFiscal','GlbRutaEcf','');
  edtEcfRuta.Text:=GlbRutaEcf;

  GlbRutaQREcf:=Ini.ReadString('IFiscal','GlbRutaQREcf','');
  edtrutaqrecf.Text:= GlbRutaQREcf;

  GlbLabelZPL:=Ini.ReadInteger('Label','GlbLabelZPL',1);
  if GlbLabelZPL = 1 then
  chkLabelZPL.Checked:=True
  else
  chkLabelZPL.Checked:=False;
  GlbComerEs1ro:=Ini.ReadInteger('Recibo','GlbComerEs1ro',0);
  GlbColmado:= Ini.ReadInteger('Recibo','GlbColmado',0);
  GlbImpQREncuesta:= Ini.ReadInteger('Recibo','GlbImpQREncuesta',0);
  if GlbImpQREncuesta = 1 then
     rdgImpEncuesta.ItemIndex := 0
  else
     rdgImpEncuesta.ItemIndex := 1;

  GlbCiaNamelabel:=Ini.ReadString('Label','GlbCiaNamelabel','EL TEJEDOR');
  edtCiaLabel.Text:=GlbCiaNamelabel;
  glbQckUnaPagina:=Ini.ReadInteger('Recibo','glbQckUnaPagina',0);
  if (glbQckUnaPagina = 0) then
     rdgTicketPtoVta1pag.ItemIndex := 1
  else
  rdgTicketPtoVta1pag.ItemIndex := 0;

  GlbCantCopias:=Ini.ReadInteger('Recibo','GlbCantCopias',1);
  edtCopiasTicket.Text:=IntToStr(GlbCantCopias);
  
  //Determinar licencia de uso de este SoftWare
  GLBIDClienteIDESI:= Ini.ReadInteger('Aplicacion','GLBIDClienteIDESI',0);

  if GlbColmado = 1 then
  rdgSurtidoraColmado.ItemIndex:=0
  else
  rdgSurtidoraColmado.ItemIndex:=1;
  
  glbQckUnaPagina := Ini.ReadInteger('Recibo','glbQckUnaPagina',0);

  GlbImpFormatoPDF:= Ini.ReadInteger('Recibo','GlbImpFormatoPDF',0);
  if (GlbImpFormatoPDF = 1) then
  rdgGlbImpFormatoPDF.ItemIndex:=0
  else
  rdgGlbImpFormatoPDF.ItemIndex:=1;

  GlbActivaECF:=Ini.ReadInteger('Venta','GlbActivaECF',0);
  if GlbActivaECF = 1 then
  chkboxeCF.Checked:=True
  else chkboxeCF.Checked:=False;

  GlbValidarECF:=Ini.ReadInteger('Venta','GlbValidarECF',0);
  if GlbValidarECF = 1 then
  chkboxGlbValidarECF.Checked:=True
  else chkboxGlbValidarECF.Checked:=False;

  GlbIdesiPrint:=Ini.ReadString('Venta','GlbIdesiPrint','');
  GLBRecCxcPOS:= Ini.ReadInteger('Recibo','GLBRecCxcPOS',0);
  rdgReciboCxc.ItemIndex := GLBRecCxcPOS;

  GlBInMobi := Ini.ReadInteger('Venta','GlBInMobi',0);
  if GlbInMobi = 1 then
  rdgActivaInmobiliaria.ItemIndex:= 0
  else
  rdgActivaInmobiliaria.ItemIndex:= 1;

  GlBTapiceria:=Ini.ReadInteger('Venta','GlBTapiceria',0);
  GLBECOM := Ini.ReadInteger('Venta','GLBECOM',0);
  GLBSAM  := Ini.ReadInteger('Venta','GLBSAM',0);
  GLBMutur:= Ini.ReadInteger('Venta','GLBMutur',0);
  GlBCuadros:= Ini.ReadInteger('Recibo','GlBCuadros',0);
  GLBImpComAdic:=Ini.ReadInteger('Recibo','GLBImpComAdic',0);

  if GLBMutur = 1 then
  rdgMutur.ItemIndex:=0
  else rdgMutur.ItemIndex:=1;
  
  IF GLBECOM = 1 then
  rdgECom.ItemIndex := 0
  else
  rdgECom.ItemIndex := 1;

  if (GLBSAM = 1) then
  rdgFactSeguro.ItemIndex:=0
  else
  rdgFactSeguro.ItemIndex:=1;

  if GlbEcom = 1 then
  begin
    GlbRutaWisPro := Ini.ReadString('WisPro','RutaIdesiWisProCloudClient','');
  end;
  GLBNumConduceCte:= Ini.ReadInteger('Venta','GLBNumConduceCte',0);
  if GLBNumConduceCte = 1 then
  rdgConduceCte.ItemIndex:=0
  else
  rdgConduceCte.ItemIndex:=1;
  
  GlbImpTicketVtaAgua:= Ini.ReadInteger('Venta','GlbImpTicketVtaAgua',0);

  if GlbImpTicketVtaAgua = 1 then
  chkImpTicketVenta.Checked := True
  else
  chkImpTicketVenta.Checked := False;

  if (edtFormatoCoti.Text <> '') then
  GLBCOTI55EST:= Ini.ReadString('Venta','GLBCOTI55EST','COTI5.5EST');
  edtFormatoCoti.Text:=GLBCOTI55EST;
  
  GlbMargenPorcPrecioVta:= Ini.ReadInteger('Venta','GlbMargenPorcPrecioVta',0);
  edtPorcVenta.Text:=IntToStr(GlbMargenPorcPrecioVta);

  GlbTipoComision := Ini.ReadInteger('Venta','GlbTipoComision',2);
  if GlbTipoComision = 2 then
  chkCalcComisionXCanVta.Checked:=True
  else
  chkCalcComisionXCanVta.Checked:=False;

  GlbDiasSinVenta:= Ini.ReadInteger('Venta','GlbDiasSinVenta',7);
  edtDiasSinVtas.Text:= IntToStr(GlbDiasSinVenta);

  //Permite calcular siempre el itbis
  GlbCalcItbis := Ini.ReadInteger('Venta','GlbCalcItbis',0);
  if GlbCalcItbis = 0 then
  rdgCalItbis.ItemIndex:=1 else
  rdgCalItbis.ItemIndex:=0;
  
  GlbRepCuadrePos := Ini.ReadInteger('Venta','GlbRepCuadrePos',0);
  if GlbRepCuadrePos = 1 then
  frgFormatoCuadre.ItemIndex := 0
  else
  frgFormatoCuadre.ItemIndex := 1;

  GlbFOrdDespAlmcenPOS := Ini.ReadInteger('Venta','GlbFOrdDespAlmcenPOS',1);
  if GlbFOrdDespAlmcenPOS = 1 then
  rdgFomatoOrdDespAlmc.ItemIndex:=0
  else
  rdgFomatoOrdDespAlmc.ItemIndex:=1;

  edtFConduce.Text := Ini.ReadString('Venta','GlbFormatoConduce','');
  if (edtFConduce.Text <> '') then
  GlbFormatoConduce:=StrToInt(edtFConduce.Text)
  else
  GlbFormatoConduce:= -1;

  try
   GlbIgI:= Ini.ReadInteger('Extra','GlbIgI', 0);

   GlbIncLargoPapel := Ini.ReadInteger('Venta','GlbIncLargoPapel', 1);
   
   GLBCodigoCteFct := Ini.ReadInteger('Venta','GLBCodigoCteFct', 0);
   if GLBCodigoCteFct = 1 then
   rdgMuestraCodCteFct.ItemIndex := 0
   else
   rdgMuestraCodCteFct.ItemIndex := 1; 

   GlbAplicaOfertas := Ini.ReadInteger('Venta','GlbAplicaOfertas', 0);
   if GlbAplicaOfertas = 1 then
   rdgAplicaOferta.ItemIndex:=0
   else rdgAplicaOferta.ItemIndex:=1;
   
   GLBMuestraInfoProv := Ini.ReadInteger('Venta','GLBMuestraInfoProv', 0);
   if GLBMuestraInfoProv = 1 then
   rdgInfoProvCosto.ItemIndex:=0
   else rdgInfoProvCosto.ItemIndex:=1;

   GlbAvisoProdVence := Ini.ReadInteger('Venta','GlbAvisoProdVence', 0);
   if GlbAvisoProdVence = 1 then
   rdgAvisoProdVencido.ItemIndex:=0
   else rdgAvisoProdVencido.ItemIndex:=1;

   GlbImpEnPDF:= Ini.ReadInteger('Venta', 'GlbImpEnPDF', 0);
   if GlbImpEnPDF = 1 then
   rdgImpReciboPdf.ItemIndex:=0
   else
   rdgImpReciboPdf.ItemIndex:=1;
  
   GlbUsaSecNCF2018 := Ini.ReadInteger('Venta','GlbUsaSecNCF2018', 1);

   if GlbUsaSecNCF2018 = 1 then
   rcgActivaSecNCF_B.ItemIndex := 0
   else
   rcgActivaSecNCF_B.ItemIndex := 1;

   GLBPrecioMayUnidad := Ini.ReadInteger('Venta','GLBPrecioMayUnidad', 0);
   if GLBPrecioMayUnidad = 1 then
   rdgPrecioMayoristaXUnidad.ItemIndex:= 0
   else
   rdgPrecioMayoristaXUnidad.ItemIndex:= 1;

   //if GlbImpPDF then
   GlbImpPDF := Ini.ReadInteger('Venta','GlbImpPDF',0) = 1;
   chkGuardaPDF.Checked:=GlbImpPDF;

   GlbEsDebugFiscal:= Ini.ReadInteger('Debug','GlbEsDebugFiscal', 0);
   if (GLBImpBoucher = 1) then
   chkImpBoucher.Checked:=False
   else
   chkImpBoucher.Checked:=False;
   GLBImpBoucher:= Ini.ReadInteger('Venta','GLBImpBoucher', 0);

   GlbTipoConduce:=Ini.ReadInteger('Venta','GlbTipoConduce', 0);

   GlbUsaPUnidadStd:=Ini.ReadInteger('Venta', 'GlbUsaPUnidadStd', 0);
   
   if (GlbUsaPUnidadStd = 1) then
   RadioGroup2.ItemIndex:=0
   else
   RadioGroup2.ItemIndex:=1;

   //GlbRutaDB :=Ini.ReadInteger('DataBase','GLBRUTADB','');

   rdgConduce.ItemIndex:= GlbTipoConduce;
   GlbPermiteVtaServicioAdc := Ini.ReadInteger('Venta', 'GlbPermiteVtaServicioAdc',0 );

    if (GlbPermiteVtaServicioAdc = 1) then
    chboxServicioComisionable.Checked := True
    else
    chboxServicioComisionable.Checked := False;

   GlbActivaIFiscal :=  Ini.ReadInteger('Venta', 'GlbActivaIFiscal', 0);

   if GlbActivaIFiscal = 1 then
   GlbIgI:=0;

    GlbIDAlmacenProd := -1;
    GlbIDAlmacenProd := Ini.ReadInteger('Inventario', 'GlbIDAlmacenProd',0 );
    if (GlbIDAlmacenProd >=0) then
    edtIdAlmacen.Text:=IntToStr(GlbIDAlmacenProd)
    else edtIdAlmacen.Text:='';

    CheckBox1.Checked := Ini.ReadBool('MenuPrincipal','GlbScaledform', false);
    GlbScaledform  := CheckBox1.Checked;
    
    edtAncho.Text := Ini.ReadString('MenuPrincipal','GlbScreenWith', '');
    if (edtAncho.Text <> '') then
    GlbScreenWith := StrToInt(edtAncho.Text);
    
    edtAlto.Text := Ini.ReadString('MenuPrincipal','GlbScreenHeight', '');
    if (edtAlto.Text <> '') then
    GlbScreenHeight:= StrToInt(edtAlto.Text);
     try
    dtpkCobroMensualidad.DateTime := Ini.ReadDate('Recibo', 'GlbDiaFactMensualidad', Now);
    GlbDiaFactMensualidad := dtpkCobroMensualidad.DateTime;
    except
    dtpkCobroMensualidad.DateTime := now;
    end;
    GlbActivaLavanderia :=Ini.ReadInteger( 'MenuPrincipal', 'GlbActivaLavanderia',0 );
    if (GlbActivaLavanderia = 0) then
    chboxLavanderia.Checked := False
    else
    chboxLavanderia.Checked := True;

    GlbActivaFarmacia:=Ini.ReadInteger( 'MenuPrincipal', 'GlbActivaFarmacia',0 );
    if (GlbActivaFarmacia= 0) then
    cboxFarmacia.Checked := False
    else
    cboxFarmacia.Checked := True;

    cboxFarmaciaClick(Self);

    GlbActivaPanificadora:= Ini.ReadInteger( 'MenuPrincipal', 'GlbActivaPanificadora',0 );

    if (GlbActivaPanificadora = 0) then
    chkActivaMenuPan.Checked:=False
    else chkActivaMenuPan.Checked:=True;

    GlbColorUno := Ini.ReadString('MenuPrincipal', 'GlbColorUno', 'clBtnFace');
    GlbColorDos := Ini.ReadString('MenuPrincipal', 'GlbColorDos', 'clBtnFace');

    GLBShowLineaVta:= Ini.ReadInteger('Recibo','GLBShowLineaVta',0);
    if GLBShowLineaVta = 1 then
    rdgShowLIneaReciboVenta.ItemIndex := 0
    else
    rdgShowLIneaReciboVenta.ItemIndex := 1;

    GlbImpReciboSinPreg:= Ini.ReadInteger( 'Recibo', 'GlbImpReciboSinPreg',0 );

    GlbColegio :=  Ini.ReadInteger('MenuPrincipal','GlbColegio', 0);
    if GlbColegio = 1 then
    chkColegio.Checked:=True
    else
    chkColegio.Checked:=False;
    
    GlbImpCodProducto := Ini.ReadInteger( 'Recibo', 'GlbImpCodProducto',0 );

    GlbActF10CodBarra := Ini.ReadInteger( 'Venta', 'GlbActF10CodBarra',0 );

    GlbSizeFact8x11 := Ini.ReadInteger( 'factura', 'fsizeFact8x11',0 );
    GlbSizeCotiza8x11 := Ini.ReadInteger( 'factura', 'fsizeCotiza8x11', 0);

    GlbRec3Pulg  := Ini.ReadInteger( 'Recibo', 'rtipo3_pulg', 0 );
    GlbRec55Pulg := Ini.ReadInteger( 'Recibo', 'rtipo5_5pulg',0 );

    GlbNCFConfFinal:=Ini.ReadInteger( 'recibo', 'ncfConsFinal',0 );

    GlbMuestraInteresFactFinac := Ini.ReadInteger( 'factura', 'GlbMuestraInteresFactFinac',0 );

    if GlbMuestraInteresFactFinac = 1 then
    rdgMuestraInteresFactfina.ItemIndex := 1
    else rdgMuestraInteresFactfina.ItemIndex := 0;

    GlbFacturaLicoreria:=Ini.ReadInteger('factura', 'GlbFacturaLicoreria',0 );

    GlbFact3Pulg := Ini.ReadInteger('factura', 'ftipo3_pulg', 0 );
    GlbFact55Pulg:= Ini.ReadInteger('factura', 'ftipo5_5pulg',0 );
    GlbCot3Pulg  := Ini.ReadInteger('cotiza', 'ctipo3_pulg', 0 );
    GlbCot55Pulg := Ini.ReadInteger('cotiza', 'ctipo5_5pulg',0 );

    GlbValorMaxVtaWarning:=Ini.ReadFloat('factura', 'GlbValorMaxVtaWarning', 100000 );
    
    if GlbValorMaxVtaWarning > 0 then
    edtMontoMaxVta.Text:=FloatToStr(GlbValorMaxVtaWarning);

    GlbImpTUnidadEnRcbo := Ini.ReadInteger('Venta', 'glbImpTUnidadEnRcbo',0 );

    GlbSolicitaDVeh := Ini.ReadInteger('SolDatosVehiculo', 'SSolDatosVehiculo',0 );

    if (Ini.ReadInteger( 'SolDatosCteVC', 'SDatosCteVC', 0) = 1) then
    GlbSolDCteVCash := 1 else GlbSolDCteVCash := 0;

    GlbPiedePaginaFactura := Ini.ReadString('factura', 'PieDePagina','');
    edtPiedePaginaFactura.Text := GlbPiedePaginaFactura;

    GlbPrecioCodificado := Ini.ReadInteger('Label', 'PrecioCodificado', 1);
    GlbFechaVencProducto:= Ini.ReadInteger('Label', 'FechaVencProducto', 1);
    GlbInluirPrecioItbisenLabel:= Ini.ReadInteger('Label', 'GlbInluirPrecioItbisenLabel', 1);


    GlbRutaConfZPL:=Ini.ReadString('Label', 'GlbRutaConfZPL','LabelZPLDefault.zpl');
    edtRutaFormatoLabel.Text:=GlbRutaConfZPL;
    
    GlbPrecioMayRegOrden :=Ini.ReadInteger('RegOrden', 'GlbPrecioMayRegOrden', 1);

    x := Ini.ReadInteger('Venta', 'GlbPermiteCambioPrecio',0);
    if x = 1 then
    GlbPermiteCambioPrecio := true
    else
    GlbPermiteCambioPrecio := False;

    GlbPermiteVentaInv0 := Ini.ReadInteger('Venta', 'GlbPermiteVentaInv0',0);
    GlbPermiteUnaInstancia := Ini.ReadInteger('Aplicacion', 'GlbPermiteUnaInstancia', 0);
    GlbEmailTool := Ini.ReadString('Aplicacion', 'GlbEmailTool', '');
    GLBUseCustomEmailServer :=Ini.ReadInteger('Aplicacion', 'GLBUseCustomEmailServer', 0);
    edtEmailTool.Text :=GlbEmailTool;

    GlbCorriendo := Ini.ReadInteger('Aplicacion', 'GlbCorriendo', 0);

    GlbVenderDesdeAlmacenP := Ini.ReadInteger('Venta', 'GlbVenderDesdeAlmacenP', 0);
    GlbSolicitaNumLote := Ini.ReadInteger('Venta', 'GlbSolicitaNumLote', 0);
    GlbTransparentaITBI := Ini.ReadInteger('Venta','GlbTransparentaITBI', 0);
    GlbImprimeReciboFact:= Ini.ReadInteger('Venta','GlbImprimeReciboFact', 0);
    GlbFirmaCajero:=Ini.ReadInteger('Venta','GlbFirmaCajero', 0);

    chkActivaCafeteria.Checked :=  Ini.ReadInteger('Venta','GlbActivaCafeteria', 1) = 1;
    chkActivaProduccion.Checked:=  Ini.ReadInteger('Venta','GlbActivaProduccion', 0) = 1;
    glbUsaescalaPrecio := Ini.ReadInteger('Venta','glbUsaescalaPrecio', 1);

    GlbUsaPUnidadLevel := Ini.ReadInteger('Venta','GlbUsaPUnidadLevel', 0);

   edtRutaWisPro.Text:= Ini.ReadString('Tool','GlbToolWisPro','');

   if (GLBECOM = 1) then
   begin
     if (edtRutaWisPro.Text <> '') then
     begin
       if FileExists(edtRutaWisPro.Text) then
       GlbToolWisPro:=edtRutaWisPro.Text
       else MessageDlg('Ejecutable herramienta WisPro no existe, verifique',mtError,[mbOk],0);
     end else
     GlbToolWisPro:='';
   end;

    if GlbSam = 0 then
    chkboxUsaFctMexico.Visible:=False
    else
    begin
      GlbUsaFctMexico:=Ini.ReadInteger('Venta','GlbUsaFctMexico', 0);
      chkboxUsaFctMexico.Checked:= GlbUsaFctMexico = 1;
    end;

    if (GLBSAM = 1) or (GLBSam = 1) then
    rdgFactSeguro.ItemIndex:=0
    else
    rdgFactSeguro.ItemIndex:=1;
    
    if GlbUsaPUnidadLevel = 1 then
    RadioGroup1.ItemIndex:=0
    else RadioGroup1.ItemIndex:=1;

    GLBAplicaITBISLevel:= Ini.ReadInteger('Venta','GLBAplicaITBISLevel', 0);

    if GLBAplicaITBISLevel = 1 then
    rdgPUnidadLevel.ItemIndex:=0
    else rdgPUnidadLevel.ItemIndex:=1;

    GlbExeIFiscal :=  Ini.ReadString('IFiscal','RutaIFiscal','');
    edtIFistaltool.Text := GlbExeIFiscal;
    if glbUsaescalaPrecio = 1 then
    rdgUsaEscalaPrecio.ItemIndex := 0
    else rdgUsaEscalaPrecio.ItemIndex := 1;

    if chkActivaProduccion.Checked then
    GlbActivaProduccion:=1
    else GlbActivaProduccion:=0;

    if chkActivaCafeteria.Checked then
    GlbActivaCafeteria:=1
    else GlbActivaCafeteria:=0;

    //Coneccion para version FastFood Limao
    GlbAccessDBConn:=Ini.ReadString('DBAccess','Ruta', '');
    GlbDBIIDBConn:=Ini.ReadString('DBDGII','Ruta', '');
    GlbBaseUrlRNC:=Ini.ReadString('DBDGII','GlbBaseUrlRNC', 'http://62.146.171.39:8086');
    GlbBaseUrlRNCEndPoint:=Ini.ReadString('DBDGII','GlbBaseUrlRNCEndPoint', '/api/DGII');

    if GlbCorriendo = 0 then
    Ini.WriteInteger('Aplicacion', 'GlbCorriendo', 1);

    GlbRutaFacturas:= Ini.ReadString('REPORTS','Facturas','');
    GlbRutaRecibos := Ini.ReadString('REPORTS','Recibos', '');
    GlbRutaCotizaciones:= Ini.ReadString('REPORTS','Cotizaciones','');
    GlbRutaInformes:= Ini.ReadString('REPORTS','Informes','');
    GLbDevoluciones:= Ini.ReadString('REPORTS','Devoluciones','');

    if (Trim(GlbRutaFacturas) = '') then
    GlbRutaFacturas:= GetRutaPrograma+'Facturas';
    if (Trim(GlbRutaRecibos) = '') then

    if (Trim(GlbRutaRecibos) = '') then
    GlbRutaRecibos:= GetRutaPrograma+'Recibos';

    if (Trim(GlbRutaCotizaciones) = '') then
    GlbRutaCotizaciones:= GetRutaPrograma+'Cotizaciones';

    if (Trim(GlbRutaInformes) = '') then
    GlbRutaInformes:= GetRutaPrograma+'Informes';

    if (Trim(GLbDevoluciones) = '') then
    GLbDevoluciones:= GetRutaPrograma+'Devoluciones';


  finally
  Ini.Free;
  end;
  if GlbFirmaCajero = 1 then
  rdgGlbFirmaCajero.ItemIndex:=0
  else
  rdgGlbFirmaCajero.ItemIndex:=1;
  
  if (GlbImprimeReciboFact = 1) then
  rdgImprimeReciboFact.ItemIndex:= 0
  else
  rdgImprimeReciboFact.ItemIndex:= 1;
  
  //GlbImprimeReciboFact:= Ini.ReadInteger('Venta','GlbImprimeReciboFact', 0);

  if GlbImpTUnidadEnRcbo = 1 then
  rdgImpTipoUnidadRecibo.ItemIndex:=0
  else
  rdgImpTipoUnidadRecibo.ItemIndex:=1;
  
  if (GlbTransparentaITBI = 1) then
  rdgAplicaTransparentaitbi.ItemIndex:=0
  else
  rdgAplicaTransparentaitbi.ItemIndex:=1;

  if GlbFacturaLicoreria = 1 then
  rdgFacturaLicoreria.ItemIndex :=0
  else
  rdgFacturaLicoreria.ItemIndex :=1;

  if GlbSolicitaNumLote = 1 then
  rdgSolicitaNumLote.ItemIndex:=0
  else
  rdgSolicitaNumLote.ItemIndex:=1;
  
  if GlbVenderDesdeAlmacenP = 1 then
  rdgVenderDesdeAlmacenP.ItemIndex:=0
  else
  rdgVenderDesdeAlmacenP.ItemIndex:= 1;

  if GlbImpReciboSinPreg = 1 then
  rdgImprimirReciboSinPreguntar.ItemIndex:= 0
  else
  rdgImprimirReciboSinPreguntar.ItemIndex:= 1;

  if GlbInluirPrecioItbisenLabel = 1 then
  rdgIncluirITBISenPrecioLabel.ItemIndex := 0
  else
  rdgIncluirITBISenPrecioLabel.ItemIndex := 1;

  if GlbImpCodProducto = 1 then
  chkBoxGlbImpCodProducto.Checked:=true
  else chkBoxGlbImpCodProducto.Checked:=false;

  if GlbActF10CodBarra = 1 then
  rdgVentaConCodBarra.ItemIndex:=0
  else
  rdgVentaConCodBarra.ItemIndex:=1;

  if GlbSizeFact8x11 = 1 then
  rdImpFact8x11.ItemIndex:=0
  else
    rdImpFact8x11.ItemIndex:=1;

  if GlbSizeCotiza8x11 = 1 then
  rdImpCotiza8x11.ItemIndex:=0
  else
    rdImpCotiza8x11.ItemIndex:=1;


  if GlbFechaVencProducto = 1 then
  rdgFechaVenc.ItemIndex:= 0
  else
  rdgFechaVenc.ItemIndex:= 1;

  if GlbPrecioCodificado = 1 then
  rdgMostrarPrecCodigo.ItemIndex:= 0
  else
  rdgMostrarPrecCodigo.ItemIndex:= 1;

  if GlbSolicitaDVeh = 1 then
  rdgSolicitaDatosVeh.ItemIndex:= 0
  else
  rdgSolicitaDatosVeh.ItemIndex:= 1;


  if GlbRec3Pulg = 1 then
  rdgrecibo.ItemIndex := 0
  else rdgrecibo.ItemIndex := 1;

  //rdgrecibo.ItemIndex := GlbRec55Pulg,
  if GlbFact3Pulg = 1 then
  rdgFactura.ItemIndex:= 0
  else rdgFactura.ItemIndex:= 1;

  //  GlbFact55Pulg,
  if GlbCot3Pulg = 1 then
  rdgCotizacion.ItemIndex:= 0
  else rdgCotizacion.ItemIndex := 1;
  //  GlbCot55Pulg
  if GlbSolDCteVCash = 1 then
  rdgSolDatosCliente.ItemIndex := 0
  else rdgSolDatosCliente.ItemIndex := 1;
  if GlbNCFConfFinal = 1 then
  rdgImpNCFConsFinal.ItemIndex := 0
  else
  rdgImpNCFConsFinal.ItemIndex := 1;

  if (GlbPermiteCambioPrecio) then
  rdgModificaPrecio.ItemIndex := 0
  else rdgModificaPrecio.ItemIndex := 1;

  if (GlbPrecioMayRegOrden = 1) then
  rdgPrecioMayRegOrden.ItemIndex := 0
  else rdgPrecioMayRegOrden.ItemIndex := 1;

  if GlbPermiteVentaInv0 = 1 then
  rdgPermiteVentaInv0.ItemIndex := 0 else
  rdgPermiteVentaInv0.ItemIndex := 1;

  if GlbPermiteUnaInstancia = 1 then
  chboxPermiteUnaInstancia.Checked:= True
  else chboxPermiteUnaInstancia.Checked:= False;

  if (GlbActivaIFiscal = 1) then
  rdgActivaIFiscal.ItemIndex:= 0
  else
  rdgActivaIFiscal.ItemIndex:= 1;
end;

procedure TfrmConfReporte.BitBtn1Click(Sender: TObject);
begin
  ProcGuardarDatos;
end;

procedure TfrmConfReporte.ProcGuardarDatos;
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(ExtractFilePath(Application.ExeName)+'\'+'repconf_cr.ini' );
  try
  {
  GlbRepCuadrePos := Ini.ReadInteger('Venta','GlbRepCuadrePos',0);
  if GlbRepCuadrePos = 1 then
  frgFormatoCuadre.ItemIndex := 0
  else
  frgFormatoCuadre.ItemIndex := 1;
  }

  if chkActivaFinger.Checked then
  begin
    Ini.WriteInteger('Venta','GlbUsaHuellas',1);
    GlbUsaHuellas:=1;
  end else
  begin
    Ini.WriteInteger('Venta','GlbUsaHuellas',0);
    GlbUsaHuellas:=0;
  end;

  //if GlbImprimeTicketCustom = 1 then
  if chkGlbImprimeCustom.Checked then
  begin
    GlbImprimeTicketCustom := 1;
    Ini.WriteInteger('Recibo','GlbImprimeTicketCustom',1);
  end else
  begin
    chkGlbImprimeCustom.Checked:=False;
    Ini.WriteInteger('Recibo','GlbImprimeTicketCustom',0);
    GlbImprimeTicketCustom:=0;
  end;

  if (edtcajaecf.Text <> '') then
  begin
    GlbCajaeCF:=UpperCase(edtcajaecf.Text);
    Ini.WriteString('Recibo','GlbCajaeCF',GlbCajaeCF);
  end else
  begin
    GlbCajaeCF:='';
    Ini.WriteString('Recibo','GlbCajaeCF',GlbCajaeCF);
  end;

  if RadioGroup3.ItemIndex = 0 then
  begin
    Ini.WriteInteger('IFiscal','GlbModoConsumoToCredito',0);
    GlbModoConsumoToCredito:=0;
  end else
  begin
    Ini.WriteInteger('IFiscal','GlbModoConsumoToCredito',1);
    GlbModoConsumoToCredito:=1;
  end;

  Ini.WriteString('IFiscal','GlbRutaQREcf',edtrutaqrecf.Text);
  GlbRutaQREcf:=edtrutaqrecf.Text;

  Ini.WriteString('IFiscal','GlbRutaEcf',edtEcfRuta.Text);
  GlbRutaEcf:=edtEcfRuta.Text;

  if chkboxeCF.Checked then
  begin
    Ini.WriteInteger('Venta','GlbActivaECF',1);
    GlbActivaECF:=1;
  end else
  begin
    Ini.WriteInteger('Venta','GlbActivaECF',0);
    GlbActivaECF:=0;
  end;

  if chkboxGlbValidarECF.Checked then
  begin
    Ini.WriteInteger('Venta','GlbValidarECF',1);
    GlbValidarECF:=1;
  end else
  begin
    Ini.WriteInteger('Venta','GlbValidarECF',0);
    GlbValidarECF:=0;
  end;


  if (GlbRutaEcf = '') and (GlbActivaECF = 1) then
  begin
    MessageBox(0, PChar('Debes configurar ruta de libreria para emitir eCF.'), 'Facturación Electrónica', MB_ICONERROR or MB_OK);
    edtEcfRuta.Color:= clYellow;
  end;

  if chkLabelZPL.Checked then
  begin
    Ini.WriteInteger('Label','GlbLabelZPL',1);
    GlbLabelZPL:=1;
  end else
  begin
    Ini.WriteInteger('Label','GlbLabelZPL',0);
    GlbLabelZPL:=1;
  end;

  if rdgImpEncuesta.ItemIndex = 0 then
  begin
     Ini.WriteInteger('Recibo','GlbImpQREncuesta',1);
     GlbImpQREncuesta:=1;
  end else
  begin
    Ini.WriteInteger('Recibo','GlbImpQREncuesta',0);
    GlbImpQREncuesta:=0;
  end;

  GlbCiaNamelabel:=edtCiaLabel.Text;
  Ini.WriteString('Label','GlbCiaNamelabel',edtCiaLabel.Text);
  if (edtRutaFormatoLabel.Text <> '') then
  begin
    Ini.WriteString('Label','GlbRutaConfZPL',edtRutaFormatoLabel.Text);
    GlbRutaConfZPL:=edtRutaFormatoLabel.Text;
  end else
  begin
    GlbRutaConfZPL:= 'LabelZPLDefault.zpl';
  end;
  if (edtCopiasTicket.Text <> '') then
  begin
    Ini.WriteInteger('Recibo','GlbCantCopias',StrToInt(edtCopiasTicket.Text));
    GlbCantCopias:= StrToInt(edtCopiasTicket.Text);
  end else
  begin
    Ini.WriteInteger('Recibo','GlbCantCopias',1);
    GlbCantCopias:= 1;
  end;
  if rdgTicketPtoVta1pag.ItemIndex = 0 then
  begin
    Ini.WriteInteger('Recibo','glbQckUnaPagina',1);
    glbQckUnaPagina:=1;
  end
  else
  begin
    Ini.WriteInteger('Recibo','glbQckUnaPagina',0);
    glbQckUnaPagina:=0;
  end;
  if rdgSurtidoraColmado.ItemIndex = 0 then
  begin
    Ini.WriteInteger('Recibo','GlbColmado',1);
    GlbColmado:=1;
  end else
  begin
    Ini.WriteInteger('Recibo','GlbColmado',0);
    GlbColmado:=0;
  end;
  if rdgGlbImpFormatoPDF.ItemIndex = 0 then
  begin
    GlbImpFormatoPDF:=1;
    Ini.WriteInteger('Recibo','GlbImpFormatoPDF',1);
  end else
  begin
    Ini.WriteInteger('Recibo','GlbImpFormatoPDF',0);
    GlbImpFormatoPDF:=0;
  end;

  if rdgReciboCxc.ItemIndex = 0 then
  begin
    Ini.WriteInteger('Recibo','GLBRecCxcPOS',0);
    GLBRecCxcPOS:= 0;
  end else
  begin
    Ini.WriteInteger('Recibo','GLBRecCxcPOS',1);
    GLBRecCxcPOS:= 1;
  end;

  if rdgMutur.ItemIndex = 0 then
  Ini.WriteInteger('Venta','GLBMutur',1)
  else
  Ini.WriteInteger('Venta','GLBMutur',0);

  if rdgFactSeguro.ItemIndex = 0 then
  Ini.WriteInteger('Venta','GLBSAM',1)
  else
  Ini.WriteInteger('Venta','GLBSAM',0);

  IF rdgECom.ItemIndex = 0 then
  Ini.WriteInteger('Venta','GLBECOM', 1)
  else
  Ini.WriteInteger('Venta','GLBECOM', 0);

  GLBNumConduceCte:=0;
  if rdgConduceCte.ItemIndex = 0  then
  begin
    Ini.WriteInteger('Venta','GLBNumConduceCte',1);
    GLBNumConduceCte:=1;
  end else
  Ini.WriteInteger('Venta','GLBNumConduceCte',0);

  GlbInMobi:=0;
  if (rdgActivaInmobiliaria.ItemIndex = 0) then
  begin
    Ini.WriteInteger('Venta','GlBInMobi',1);
    GlbInMobi:=1;
  end else
  Ini.WriteInteger('Venta','GlBInMobi',0);

  if chkboxUsaFctMexico.Checked then
  begin
    Ini.WriteInteger('Venta','GlbUsaFctMexico', 1);
    GlbUsaFctMexico:=0;
  end else
  begin
    Ini.WriteInteger('Venta','GlbUsaFctMexico', 0);
    GlbUsaFctMexico:=1;
  end;

  if (edtRutaWisPro.Text <> '') then
  Ini.WriteString('Tool','GlbToolWisPro',edtRutaWisPro.Text);

  if (edtFormatoCoti.Text <> '') then
  Ini.WriteString('Venta','GLBCOTI55EST',edtFormatoCoti.Text);

  GLBCOTI55EST := edtFormatoCoti.Text;

  Ini.WriteInteger('Venta','GlbMargenPorcPrecioVta',StrToInt(edtPorcVenta.Text));
  GlbMargenPorcPrecioVta := StrToInt(edtPorcVenta.Text);

  GlbDiasSinVenta := StrToInt(edtDiasSinVtas.Text);
  Ini.WriteInteger('Venta','GlbDiasSinVenta', GlbDiasSinVenta);
  
  GlbActivaFarmacia := 0;
  if cboxFarmacia.Checked then
  begin
    Ini.WriteInteger( 'MenuPrincipal', 'GlbActivaFarmacia', 1);
    GlbActivaFarmacia:=1;
  end
  else
  Ini.WriteInteger( 'MenuPrincipal', 'GlbActivaFarmacia', 0);
     
  if chkImpTicketVenta.Checked then
  GlbImpTicketVtaAgua := 1
  else
  GlbImpTicketVtaAgua := 0;

  Ini.WriteInteger('Venta','GlbImpTicketVtaAgua',GlbImpTicketVtaAgua);

  if chkActivaProduccion.Checked then
  Ini.WriteInteger('Venta','GlbActivaProduccion', 1)
  else
  Ini.WriteInteger('Venta','GlbActivaProduccion', 0);

  if chkCalcComisionXCanVta.Checked then
  GlbTipoComision:=2
  else GlbTipoComision:=1;

  Ini.WriteInteger('Venta','GlbTipoComision',GlbTipoComision);

  if frgFormatoCuadre.ItemIndex = 0 then
  GlbRepCuadrePos:=1
  else
  GlbRepCuadrePos:=0;

  Ini.WriteInteger('Venta','GlbRepCuadrePos',GlbRepCuadrePos);

    if rdgCalItbis.ItemIndex = 0 then
    GlbCalcItbis:=1
    else GlbCalcItbis:=0;
    Ini.WriteInteger('Venta','GlbCalcItbis',GlbCalcItbis);

  if rdgFomatoOrdDespAlmc.ItemIndex = 0 then
  GlbFOrdDespAlmcenPOS:=1 else
  GlbFOrdDespAlmcenPOS:=0;
  
  Ini.WriteInteger('Venta','GlbFOrdDespAlmcenPOS',GlbFOrdDespAlmcenPOS);

  if rdgImpReciboPdf.ItemIndex = 0 then
  GlbImpEnPDF:=1
  else
  GlbImpEnPDF:=0;

  Ini.WriteInteger('Venta','GlbImpEnPDF', GlbImpEnPDF);

  if (edtFConduce.Text <> '') then
  Ini.WriteString('Venta','GlbFormatoConduce',edtFConduce.Text)
  else
  Ini.WriteString('Venta','GlbFormatoConduce','');

  if rdgAplicaOferta.ItemIndex = 0 then
  Ini.WriteInteger('Venta','GlbAplicaOfertas', 1)
  else
  Ini.WriteInteger('Venta','GlbAplicaOfertas', 0);

  if rdgMuestraCodCteFct.ItemIndex = 0 then
  Ini.WriteInteger('Venta','GLBCodigoCteFct',1)
  else
  Ini.WriteInteger('Venta','GLBCodigoCteFct',0);

  if rdgInfoProvCosto.ItemIndex = 0 then
  Ini.WriteInteger('Venta','GLBMuestraInfoProv',1)
  else
  Ini.WriteInteger('Venta','GLBMuestraInfoProv',0);

  if rdgAvisoProdVencido.ItemIndex = 0 then
   Ini.WriteInteger('Venta','GlbAvisoProdVence',1)
  else
  Ini.WriteInteger('Venta','GlbAvisoProdVence',0);

  if rcgActivaSecNCF_B.ItemIndex = 0 then
   Ini.WriteInteger('Venta','GlbUsaSecNCF2018',1)
  else
  Ini.WriteInteger('Venta','GlbUsaSecNCF2018',0);

  if rdgPrecioMayoristaXUnidad.ItemIndex = 0 then
   Ini.WriteInteger('Venta','GLBPrecioMayUnidad',1)
  else
  Ini.WriteInteger('Venta','GLBPrecioMayUnidad',0);

  if chkGuardaPDF.Checked then
  GlbImpPDF:=True
  else
  GlbImpPDF:=False;
  if GlbImpPDF then
  Ini.WriteInteger('Venta','GlbImpPDF',1)
  else
  Ini.WriteInteger('Venta','GlbImpPDF',0);

  if chkImpBoucher.Checked then
  GLBImpBoucher := 1
  else
  GLBImpBoucher := 0;
  Ini.WriteInteger('Venta','GLBImpBoucher',GLBImpBoucher);

  GlbPermiteVtaServicioAdc:=0;
  if chboxServicioComisionable.Checked then
  begin
    Ini.WriteInteger('Venta','GlbPermiteVtaServicioAdc',1);
    GlbPermiteVtaServicioAdc:=1;
  end
  else
    Ini.WriteInteger('Venta','GlbPermiteVtaServicioAdc',0);
    
  if CheckBox1.Checked then
  Ini.WriteBool('MenuPrincipal','GlbScaledform', true)
  else
  Ini.WriteBool('MenuPrincipal','GlbScaledform', false);

  Ini.WriteString('IFiscal','RutaIFiscal', edtIFistaltool.Text);
  GlbExeIFiscal := edtIFistaltool.Text;

  Ini.WriteString('MenuPrincipal','GlbScreenWith', edtAncho.Text);

  Ini.WriteString('MenuPrincipal','GlbScreenHeight', edtAlto.Text);

  if (GlbImprimeReciboFact = 1) then
  rdgImprimeReciboFact.ItemIndex:= 0
  else
  rdgImprimeReciboFact.ItemIndex:= 1;

  if chboxLavanderia.Checked then
  GlbActivaLavanderia:=1
  else GlbActivaLavanderia:=0;

  if chkActivaMenuPan.Checked then
  GlbActivaPanificadora:= 1
  else
  GlbActivaPanificadora:= 0;

  if rdgShowLIneaReciboVenta.ItemIndex = 0 then
  Ini.WriteInteger('Recibo','GLBShowLineaVta',1)
  else
  Ini.WriteInteger('Recibo','GLBShowLineaVta',0);

  Ini.WriteDate ('Recibo','GlbDiaFactMensualidad', dtpkCobroMensualidad.DateTime);


  if chkColegio.Checked then
  begin
    GlbColegio:=1;
    Ini.WriteInteger('MenuPrincipal','GlbColegio', GlbColegio);
  end else
  begin
    GlbColegio:=0;
    Ini.WriteInteger('MenuPrincipal','GlbColegio', GlbColegio);
  end;

  Ini.WriteInteger('MenuPrincipal','GlbActivaLavanderia',GlbActivaLavanderia);
  Ini.WriteInteger('MenuPrincipal','GlbActivaPanificadora', GlbActivaPanificadora);

  if rdgUsaEscalaPrecio.ItemIndex = 0 then
  Ini.WriteInteger('Venta','glbUsaescalaPrecio', 1)
  else
  Ini.WriteInteger('Venta','glbUsaescalaPrecio', 0);


  if (edtIdAlmacen.Text <> '') then
  begin
    GlbIDAlmacenProd:= StrToInt(edtIdAlmacen.Text);
    Ini.WriteInteger('Inventario','GlbIDAlmacenProd', GlbIDAlmacenProd);
  end;

  if rdgImpTipoUnidadRecibo.ItemIndex = 0 then
  Ini.WriteInteger('Venta','glbImpTUnidadEnRcbo', 1)
  else
  Ini.WriteInteger('Venta','glbImpTUnidadEnRcbo', 0);


  if rdgGlbFirmaCajero.ItemIndex = 0 then
  Ini.WriteInteger('Venta','GlbFirmaCajero', 1)
  else
  Ini.WriteInteger('Venta','GlbFirmaCajero', 0);

  if rdgImprimeReciboFact.ItemIndex = 0 then
  Ini.WriteInteger('Venta', 'GlbImprimeReciboFact', 1)
  else
  Ini.WriteInteger('Venta', 'GlbImprimeReciboFact', 0);

  if rdgImprimirReciboSinPreguntar.ItemIndex = 0 then
    Ini.WriteInteger('Recibo', 'GlbImpReciboSinPreg', 1)
  else
  Ini.WriteInteger( 'Recibo', 'GlbImpReciboSinPreg', 0);

    if chkBoxGlbImpCodProducto.Checked then
    Ini.WriteInteger( 'Recibo', 'GlbImpCodProducto', 1)
    else
    Ini.WriteInteger( 'Recibo', 'GlbImpCodProducto', 0);

    if rdgVentaConCodBarra.ItemIndex = 0 then
    begin
      Ini.WriteInteger( 'Venta', 'GlbActF10CodBarra', 1);
    end else
    begin
      Ini.WriteInteger( 'Venta', 'GlbActF10CodBarra', 0);
    end;

    if rdgPUnidadLevel.ItemIndex = 0 then
    Ini.WriteInteger('Venta','GLBAplicaITBISLevel', 1)
    else
    Ini.WriteInteger('Venta','GLBAplicaITBISLevel', 0);

    if rdgRecibo.ItemIndex = 0 then
    begin
      Ini.WriteInteger( 'Recibo', 'rtipo3_pulg', 1);
      Ini.WriteInteger( 'Recibo', 'rtipo5_5pulg',0 );
    end else
    if rdgRecibo.ItemIndex = 1 then
    begin
      Ini.WriteInteger( 'Recibo', 'rtipo3_pulg', 0);
      Ini.WriteInteger( 'Recibo', 'rtipo5_5pulg',1 );
    end;

    if rdImpFact8x11.ItemIndex = 0 then
    begin
      Ini.WriteInteger( 'factura', 'fsizeFact8x11', 1);
    end else
    Ini.WriteInteger( 'factura', 'fsizeFact8x11',0 );

    if rdImpCotiza8x11.ItemIndex = 0 then
    begin
      Ini.WriteInteger( 'factura', 'fsizeCotiza8x11', 1);
    end else
    Ini.WriteInteger( 'factura', 'fsizeCotiza8x11',0 );

    if (edtMontoMaxVta.Text <> '') then
    begin
      Ini.WriteFloat('factura', 'GlbValorMaxVtaWarning', StrToFloat(edtMontoMaxVta.Text));
      GlbValorMaxVtaWarning:=StrToFloat(edtMontoMaxVta.Text);
    end;
    if rdgMuestraInteresFactfina.ItemIndex = 0 then
    begin
      GlbMuestraInteresFactFinac:=1;
      Ini.WriteInteger( 'factura', 'GlbMuestraInteresFactFinac',1);
    end else
    begin
      GlbMuestraInteresFactFinac:=0;
      Ini.WriteInteger( 'factura', 'GlbMuestraInteresFactFinac',0);
    end;

    if rdgFactura.ItemIndex = 0 then
    begin
      Ini.WriteInteger( 'factura', 'ftipo5_5pulg',0 );
      GlbFact55Pulg:=0;
    end else
    begin
      Ini.WriteInteger( 'factura', 'ftipo5_5pulg',1 );
      GlbFact55Pulg:=1;
    end;
    if RadioGroup1.ItemIndex = 0 then
    GlbUsaPUnidadLevel:=1
    else
    GlbUsaPUnidadLevel:=0;
    Ini.WriteInteger('Venta', 'GlbUsaPUnidadLevel', GlbUsaPUnidadLevel);

    if RadioGroup2.ItemIndex = 0 then
    GlbUsaPUnidadStd:=1
    else
    GlbUsaPUnidadStd:=0;

    Ini.WriteInteger('Venta', 'GlbUsaPUnidadStd', GlbUsaPUnidadStd);

    if rdgConduce.ItemIndex = 0 then
    begin
      GlbTipoConduce := 0; //Facturas
      Ini.WriteInteger('Venta','GlbTipoConduce', GlbTipoConduce);
    end else
    begin
      GlbTipoConduce := 1; //Cotizacion
      Ini.WriteInteger('Venta','GlbTipoConduce', GlbTipoConduce);
    end;

    if rdgfactura.ItemIndex = 0 then
    begin
      Ini.WriteInteger( 'factura', 'ftipo3_pulg', 1);
      Ini.WriteInteger( 'factura', 'ftipo5_5pulg',0 );
    end else
    if rdgfactura.ItemIndex = 1 then
    begin
      Ini.WriteInteger( 'factura', 'ftipo3_pulg', 0);
      Ini.WriteInteger( 'factura', 'ftipo5_5pulg',1 );
    end;

    if rdgFacturaLicoreria.ItemIndex = 1 then
    Ini.WriteInteger( 'factura', 'GlbFacturaLicoreria', 0)
    else
    Ini.WriteInteger( 'factura', 'GlbFacturaLicoreria', 1);

    if (rdgImpNCFConsFinal.ItemIndex = 0) then
    Ini.WriteInteger( 'recibo', 'ncfConsFinal', 1 )
    else Ini.WriteInteger( 'recibo', 'ncfConsFinal', 0);

    if (rdgPrecioMayRegOrden.ItemIndex = 0) then
    Ini.WriteInteger( 'RegOrden', 'GlbPrecioMayRegOrden', 1 )
    else Ini.WriteInteger( 'RegOrden', 'GlbPrecioMayRegOrden', 0);

    if (chboxPermiteUnaInstancia.Checked) then
    Ini.WriteInteger('Aplicacion', 'GlbPermiteUnaInstancia', 1)
    else
    Ini.WriteInteger('Aplicacion', 'GlbPermiteUnaInstancia', 0);

    {
    if GlbNCFConfFinal = 1 then
    rdgImpNCFConsFinal.ItemIndex := 0
    else rdgImpNCFConsFinal.ItemIndex := 1;
    }

    //GlbNCFConfFinal:=Ini.ReadInteger( 'Recibo', 'ncfConsFinal',0 );

    if rdgCotizacion.ItemIndex = 0 then
    begin
      Ini.WriteInteger( 'cotiza', 'ctipo3_pulg', 1);
      Ini.WriteInteger( 'cotiza', 'ctipo5_5pulg',0 );
    end else
    if rdgCotizacion.ItemIndex = 1 then
    begin
      Ini.WriteInteger( 'cotiza', 'ctipo3_pulg', 0);
      Ini.WriteInteger( 'cotiza', 'ctipo5_5pulg',1 );
    end;

    if rdgSolDatosCliente.ItemIndex = 0 then
    Ini.WriteInteger( 'SolDatosCteVC', 'SDatosCteVC', 1)
    else Ini.WriteInteger( 'SolDatosCteVC', 'SDatosCteVC', 0);

    if rdgSolicitaDatosVeh.ItemIndex = 0 then
    Ini.WriteInteger( 'SolDatosVehiculo', 'SSolDatosVehiculo', 1)
    else Ini.WriteInteger( 'SolDatosVehiculo', 'SSolDatosVehiculo', 0);
    
    Ini.WriteString('factura', 'PieDePagina',edtPiedePaginaFactura.Text);

    if (rdgMostrarPrecCodigo.ItemIndex = 0) Then
    Ini.WriteInteger('Label', 'PrecioCodificado',1)
    else
    Ini.WriteInteger('Label', 'PrecioCodificado',0);

    if (rdgFechaVenc.ItemIndex = 0) then
    Ini.WriteInteger('Label', 'FechaVencProducto',1)
    else
    Ini.WriteInteger('Label', 'FechaVencProducto',0);

    if (rdgIncluirITBISenPrecioLabel.ItemIndex = 0) then
    Ini.WriteInteger('Label', 'GlbInluirPrecioItbisenLabel', 1)
    else
    Ini.WriteInteger('Label', 'GlbInluirPrecioItbisenLabel',0);

    if (rdgModificaPrecio.ItemIndex = 0 ) then
    Ini.WriteInteger('Venta', 'GlbPermiteCambioPrecio',1)
    else
    Ini.WriteInteger('Venta', 'GlbPermiteCambioPrecio',0);

    if (rdgPermiteVentaInv0.ItemIndex = 0 ) then
    Ini.WriteInteger('Venta', 'GlbPermiteVentaInv0',1)
    else
    Ini.WriteInteger('Venta', 'GlbPermiteVentaInv0',0);

    if rdgVenderDesdeAlmacenP.ItemIndex = 0 then
    Ini.WriteInteger('Venta', 'GlbVenderDesdeAlmacenP',1)
    else
    Ini.WriteInteger('Venta', 'GlbVenderDesdeAlmacenP',0);

    if rdgSolicitaNumLote.ItemIndex = 0 then
    Ini.WriteInteger('Venta','GlbSolicitaNumLote',1)
    else
    Ini.WriteInteger('Venta','GlbSolicitaNumLote',0);

    if (rdgAplicaTransparentaitbi.ItemIndex = 0) then
    Ini.WriteInteger('Venta', 'GlbTransparentaITBI', 1)
    else
    Ini.WriteInteger('Venta', 'GlbTransparentaITBI', 0);

    if (chkActivaCafeteria.Checked) then
    Ini.WriteInteger('Venta', 'GlbActivaCafeteria', 1)
    else
    Ini.WriteInteger('Venta', 'GlbActivaCafeteria', 0);

    if (rdgActivaIFiscal.ItemIndex = 0) then
    Ini.WriteInteger('Venta', 'GlbActivaIFiscal', 1)
    else
    Ini.WriteInteger('Venta', 'GlbActivaIFiscal', 0);

    if (edtEmailTool.Text <> '') then
    Ini.WriteString('Aplicacion', 'GlbEmailTool', edtEmailTool.Text);
  finally
  Ini.Free;
  end;
end;

procedure TfrmConfReporte.FormCreate(Sender: TObject);
begin
  if (trim(GlbUsuarioLogueado) = 'SOPORTE') Or
     (trim(GlbUsuarioLogueado) = 'DIVISON') Or
     (trim(GlbUsuarioLogueado) = 'DEMO')    Or
     (trim(GlbUsuarioLogueado) = 'ADMIN')   Or
     (trim(GlbUsuarioLogueado) = 'MARIANO') then
  rdgMutur.Visible:=True;
  DatosConfiguracion;
  refresh;
end;

procedure TfrmConfReporte.BitBtn3Click(Sender: TObject);
begin
  frmSelInventario:=TfrmSelInventario.Create(nil);
  try
    frmSelInventario.EsPanaderia:=True;
    frmSelInventario.LlenarComboBox;
    if frmSelInventario.ShowModal = mrOk then
    begin
      edtIdAlmacen.Text:= frmSelInventario.tblDivInventarioINVENTARIO_ID.AsString;
      label3.Caption   := frmSelInventario.tblDivInventarioDescripcion.Value;
      label3.Visible   := True;      
    end else
    begin
      edtIdAlmacen.Text:= '';
      label3.Caption   := '';
      label3.Visible   := False;
    end;
  finally
  frmSelInventario.free;
  frmSelInventario:=nil;
  end;
end;

procedure TfrmConfReporte.SetIDInventarioProd;
begin
  GlbIDAlmacenProd := StrToInt(edtIdAlmacen.Text);
end;

procedure TfrmConfReporte.RadioGroup1Click(Sender: TObject);
begin
  if RadioGroup1.ItemIndex = 0 then
  GlbUsaPUnidadLevel:=1
  else
  GlbUsaPUnidadLevel:=0;
end;

procedure TfrmConfReporte.RadioGroup2Click(Sender: TObject);
begin
  if RadioGroup2.ItemIndex = 0 then
  GlbUsaPUnidadStd:=1
  else
  GlbUsaPUnidadStd:=0;
end;

procedure TfrmConfReporte.chkGuardaPDFClick(Sender: TObject);
begin
  if chkGuardaPDF.Checked then
  GlbImpPDF:=True
  else
  GlbImpPDF:=False;
end;

procedure TfrmConfReporte.rdgPUnidadLevelClick(Sender: TObject);
begin
  if rdgPUnidadLevel.ItemIndex = 0 then
  GLBAplicaITBISLevel := 1
  else
  GLBAplicaITBISLevel := 0;
end;

procedure TfrmConfReporte.rdgPrecioMayoristaXUnidadClick(Sender: TObject);
begin
  if rdgPrecioMayoristaXUnidad.ItemIndex = 0 then
  GLBPrecioMayUnidad := 1
  else
  GLBPrecioMayUnidad:= 0;
end;

procedure TfrmConfReporte.rdgImpReciboPdfClick(Sender: TObject);
begin
  if rdgImpReciboPdf.ItemIndex = 0 then
  GlbImpEnPDF:=1
  else
  GlbImpEnPDF:=0;
end;

procedure TfrmConfReporte.rdgFactSeguroClick(Sender: TObject);
begin
  if rdgFactSeguro.ItemIndex = 0 then
  GLBSAM := 1 else
  GLBSAM := 0;
  
  if GLBSAM = 1 then
  begin
    rdgECom.ItemIndex:=1;
    rdgEComClick(Self);
    cboxFarmacia.Checked:=false;
  end;
end;

procedure TfrmConfReporte.rdgEComClick(Sender: TObject);
begin
  if rdgECom.ItemIndex = 0 then
  GLBECOM:= 1 else
  GLBECOM:= 0;

  if GLBECOM = 1 then
  begin
    GLBSAM := 0;
    rdgFactSeguro.ItemIndex := 1;
    rdgFactSeguroClick(self);
    cboxFarmacia.Checked:=False;
  end;
end;

procedure TfrmConfReporte.cboxFarmaciaClick(Sender: TObject);
begin
  if cboxFarmacia.Checked then
  begin
    rdgFactSeguro.ItemIndex:= 1;
    rdgECom.ItemIndex      := 1;
    rdgEComClick(Self);
    rdgFactSeguroClick(Self);
  end;
end;

procedure TfrmConfReporte.cboxFarmaciaExit(Sender: TObject);
begin
  if cboxFarmacia.Checked then
  begin
    rdgFactSeguroClick(Self);
    rdgEComClick(Self);
  end;
end;

procedure TfrmConfReporte.rdgMuturClick(Sender: TObject);
begin
  if rdgMutur.ItemIndex = 0 then
  begin
    GLBMutur:= 1;
    rdgFactSeguro.ItemIndex := 1;
    cboxFarmacia.Checked    := False;
    rdgActivaInmobiliaria.ItemIndex:= 1;
    chkboxUsaFctMexico.Checked     := False;
    GLBSAM :=0;
    GLBECOM:=0;
    GLBMTEGroup:=1;
    rdgDealer.ItemIndex:=0;
    Exit;
  end else
  begin
    GLBMutur:= 0;
    rdgDealer.ItemIndex:=1;
  end;
end;

procedure TfrmConfReporte.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //
end;

procedure TfrmConfReporte.rdgGlbImpFormatoPDFClick(Sender: TObject);
begin
  if rdgGlbImpFormatoPDF.ItemIndex = 0 then
  GlbImpFormatoPDF:=1
  else GlbImpFormatoPDF:=0;
end;

procedure TfrmConfReporte.rdgSurtidoraColmadoClick(Sender: TObject);
begin
  if rdgSurtidoraColmado.ItemIndex = 0 then
  GlbColmado:=1
  else GlbColmado:=0;
end;

procedure TfrmConfReporte.rdgTicketPtoVta1pagClick(Sender: TObject);
begin
  if rdgTicketPtoVta1pag.ItemIndex = 0 then
  glbQckUnaPagina :=1
  else glbQckUnaPagina:=0;
end;

procedure TfrmConfReporte.rdgImpEncuestaClick(Sender: TObject);
begin
  if rdgImpEncuesta.ItemIndex = 0 then
  GlbImpQREncuesta:=1
  else GlbImpQREncuesta:=0;
end;

procedure TfrmConfReporte.rdgDealerClick(Sender: TObject);
begin
  if rdgDealer.ItemIndex = 0 then
  begin
    GLBMutur:= 1;
    rdgFactSeguro.ItemIndex := 1;
    cboxFarmacia.Checked    := False;
    rdgActivaInmobiliaria.ItemIndex:= 1;
    chkboxUsaFctMexico.Checked := False;
    GLBSAM :=0;
    GLBECOM:=0;
    GLBMTEGroup:=1;
    Exit;
  end;
end;

procedure TfrmConfReporte.edtEcfRutaExit(Sender: TObject);
begin
  edtEcfRuta.Color:= clWindow;
end;

procedure TfrmConfReporte.RadioGroup3Click(Sender: TObject);
begin
  if RadioGroup3.ItemIndex = 0 then
  GlbModoConsumoToCredito:=0
  else GlbModoConsumoToCredito:=1;
end;

end.
