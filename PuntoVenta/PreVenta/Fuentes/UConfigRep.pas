unit UConfigRep;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  FileCtrl, Inifiles, StdCtrls, Buttons, ExtCtrls, WinSkinData, ComCtrls ;

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
    SkinData1: TSkinData;
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
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    procedure WMDisplayChange(var Message: TWMDisplayChange);
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

procedure TfrmConfReporte.WMDisplayChange(var Message: TWMDisplayChange);
begin
  if (edtAncho.Text = '') then
  edtAncho.Text := IntToStr(Message.Width);
  
  if (edtAlto.Text = '') then
  edtAlto.Text  := IntToStr(Message.Height);
  //Message.BitsPerPixe
end;
procedure TfrmConfReporte.DatosConfiguracion;
var
  Ini: TIniFile;
  NombArchivo : String;
  x: integer;
begin
  NombArchivo := ExtractFilePath(Application.ExeName)+'\'+'repconf_cr.ini';
  Ini := TIniFile.Create(NombArchivo );
  try
    GlbEsDebugFiscal:= Ini.ReadInteger('Debug','GlbEsDebugFiscal', 0);
    if (GLBImpBoucher = 1) then
    chkImpBoucher.Checked:=False
    else
    chkImpBoucher.Checked:=False;
    GLBImpBoucher:= Ini.ReadInteger('Venta','GLBImpBoucher', 0);
    
    GlbTipoConduce:=Ini.ReadInteger('Venta','GlbTipoConduce', 0);

    //GlbRutaDB :=Ini.ReadInteger('DataBase','GLBRUTADB','');

    rdgConduce.ItemIndex:= GlbTipoConduce;

    GlbPermiteVtaServicioAdc := Ini.ReadInteger('Venta', 'GlbPermiteVtaServicioAdc',0 );
    GlbActivaIFiscal :=  Ini.ReadInteger('Venta', 'GlbActivaIFiscal', 0);
    if (GlbPermiteVtaServicioAdc = 1) then
    chboxServicioComisionable.Checked := True
    else
    chboxServicioComisionable.Checked := False;

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

    dtpkCobroMensualidad.DateTime := Ini.ReadDate('Recibo', 'GlbDiaFactMensualidad', Now);
    GlbDiaFactMensualidad := dtpkCobroMensualidad.DateTime;

    GlbActivaLavanderia :=Ini.ReadInteger( 'MenuPrincipal', 'GlbActivaLavanderia',0 );
    if (GlbActivaLavanderia = 0) then
    chboxLavanderia.Checked := False
    else
    chboxLavanderia.Checked := True;

    GlbActivaPanificadora:= Ini.ReadInteger( 'MenuPrincipal', 'GlbActivaPanificadora',0 );
    if (GlbActivaPanificadora = 0) then
    chkActivaMenuPan.Checked:=False
    else chkActivaMenuPan.Checked:=True;

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

    GlbFacturaLicoreria:=Ini.ReadInteger( 'factura', 'GlbFacturaLicoreria',0 );

    GlbFact3Pulg := Ini.ReadInteger( 'factura', 'ftipo3_pulg', 0 );
    GlbFact55Pulg:= Ini.ReadInteger( 'factura', 'ftipo5_5pulg',0 );
    GlbCot3Pulg  := Ini.ReadInteger( 'cotiza', 'ctipo3_pulg', 0 );
    GlbCot55Pulg := Ini.ReadInteger( 'cotiza', 'ctipo5_5pulg',0 );

    GlbImpTUnidadEnRcbo := Ini.ReadInteger( 'Venta', 'glbImpTUnidadEnRcbo',0 );

    GlbSolicitaDVeh := Ini.ReadInteger( 'SolDatosVehiculo', 'SSolDatosVehiculo',0 );

    if (Ini.ReadInteger( 'SolDatosCteVC', 'SDatosCteVC', 0) = 1) then
    GlbSolDCteVCash := 1 else GlbSolDCteVCash := 0;

    GlbPiedePaginaFactura := Ini.ReadString('factura', 'PieDePagina','');
    edtPiedePaginaFactura.Text := GlbPiedePaginaFactura;

    GlbPrecioCodificado := Ini.ReadInteger('Label', 'PrecioCodificado', 1);
    GlbFechaVencProducto:= Ini.ReadInteger('Label', 'FechaVencProducto', 1);
    GlbInluirPrecioItbisenLabel:= Ini.ReadInteger('Label', 'GlbInluirPrecioItbisenLabel', 1);

    GlbPrecioMayRegOrden :=Ini.ReadInteger('RegOrden', 'GlbPrecioMayRegOrden', 1);

    x := Ini.ReadInteger('Venta', 'GlbPermiteCambioPrecio',0);
    if x = 1 then
    GlbPermiteCambioPrecio := true
    else
    GlbPermiteCambioPrecio := False;

    GlbPermiteVentaInv0 := Ini.ReadInteger('Venta', 'GlbPermiteVentaInv0',0);
    GlbPermiteUnaInstancia := Ini.ReadInteger('Aplicacion', 'GlbPermiteUnaInstancia', 0);
    GlbEmailTool := Ini.ReadString('Aplicacion', 'GlbEmailTool', '');
    
    GlbCorriendo := Ini.ReadInteger('Aplicacion', 'GlbCorriendo', 0);

    GlbVenderDesdeAlmacenP := Ini.ReadInteger('Venta', 'GlbVenderDesdeAlmacenP', 0);
    GlbSolicitaNumLote := Ini.ReadInteger('Venta', 'GlbSolicitaNumLote', 0);
    GlbTransparentaITBI := Ini.ReadInteger('Venta','GlbTransparentaITBI', 0);
    GlbImprimeReciboFact:= Ini.ReadInteger('Venta','GlbImprimeReciboFact', 0);
    GlbFirmaCajero:=Ini.ReadInteger('Venta','GlbFirmaCajero', 0);

    chkActivaCafeteria.Checked :=  Ini.ReadInteger('Venta','GlbActivaCafeteria', 1) = 1;
    glbUsaescalaPrecio := Ini.ReadInteger('Venta','glbUsaescalaPrecio', 1);

    GlbExeIFiscal :=  Ini.ReadString('IFiscal','RutaIFiscal','');
    edtIFistaltool.Text := GlbExeIFiscal;
    if glbUsaescalaPrecio = 1 then
    rdgUsaEscalaPrecio.ItemIndex := 0
    else rdgUsaEscalaPrecio.ItemIndex := 1;

    if chkActivaCafeteria.Checked then
    GlbActivaCafeteria:=1
    else GlbActivaCafeteria:=0;
    
    if GlbCorriendo = 0 then
    Ini.WriteInteger('Aplicacion', 'GlbCorriendo', 1);
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

procedure TfrmConfReporte.ProcGuardarDatos;
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(ExtractFilePath(Application.ExeName)+'\'+'repconf_cr.ini' );
  try

  if chkImpBoucher.Checked then
  GLBImpBoucher := 1
  else
  GLBImpBoucher := 0;
  Ini.WriteInteger('Venta','GLBImpBoucher',GLBImpBoucher);

  if chboxServicioComisionable.Checked then
  Ini.WriteInteger('Venta','GlbPermiteVtaServicioAdc',1)
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

    if rdgMuestraInteresFactfina.ItemIndex = 0 then
    begin
      GlbMuestraInteresFactFinac:=1;
      Ini.WriteInteger( 'factura', 'GlbMuestraInteresFactFinac',1);
    end else
    begin
      GlbMuestraInteresFactFinac:=0;
      Ini.WriteInteger( 'factura', 'GlbMuestraInteresFactFinac',0);
    end;

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

    if (edtPiedePaginaFactura.Text <> '') then
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

procedure TfrmConfReporte.BitBtn1Click(Sender: TObject);
begin
  ProcGuardarDatos;
end;

procedure TfrmConfReporte.FormCreate(Sender: TObject);
begin
  DatosConfiguracion;
end;

procedure TfrmConfReporte.BitBtn3Click(Sender: TObject);
begin
  frmSelInventario:=TfrmSelInventario.Create(nil);
  try
    //frmSelInventario.EsPanaderia:=True;
    //frmSelInventario.LlenarComboBox;
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

end.
