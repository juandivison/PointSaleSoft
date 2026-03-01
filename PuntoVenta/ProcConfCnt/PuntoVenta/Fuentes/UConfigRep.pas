unit UConfigRep;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  FileCtrl, Inifiles, StdCtrls, Buttons, ExtCtrls ;

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
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure DatosConfiguracion;
    procedure ProcGuardarDatos;
    
  end;

var
  frmConfReporte: TfrmConfReporte;

implementation
uses uglobal;
{$R *.dfm}

{ TForm1 }

procedure TfrmConfReporte.DatosConfiguracion;
var
  Ini: TIniFile;
  NombArchivo : String;
  x: integer;
begin
  NombArchivo := ExtractFilePath(Application.ExeName)+'\'+'repconf_cr.ini';
  Ini := TIniFile.Create(NombArchivo );
  try
    GlbImpReciboSinPreg:= Ini.ReadInteger( 'Recibo', 'GlbImpReciboSinPreg',0 );
    
    GlbImpCodProducto := Ini.ReadInteger( 'Recibo', 'GlbImpCodProducto',0 );

    GlbActF10CodBarra := Ini.ReadInteger( 'Venta', 'GlbActF10CodBarra',0 );

    GlbSizeFact8x11 := Ini.ReadInteger( 'factura', 'fsizeFact8x11',0 );
    GlbSizeCotiza8x11 := Ini.ReadInteger( 'factura', 'fsizeCotiza8x11', 0);

    GlbRec3Pulg  := Ini.ReadInteger( 'Recibo', 'rtipo3_pulg', 0 );
    GlbRec55Pulg := Ini.ReadInteger( 'Recibo', 'rtipo5_5pulg',0 );

    GlbNCFConfFinal:=Ini.ReadInteger( 'recibo', 'ncfConsFinal',0 );

    GlbFact3Pulg := Ini.ReadInteger( 'factura', 'ftipo3_pulg', 0 );
    GlbFact55Pulg:= Ini.ReadInteger( 'factura', 'ftipo5_5pulg',0 );
    GlbCot3Pulg  := Ini.ReadInteger( 'cotiza', 'ctipo3_pulg', 0 );
    GlbCot55Pulg := Ini.ReadInteger( 'cotiza', 'ctipo5_5pulg',0 );

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
    GlbCorriendo := Ini.ReadInteger('Aplicacion', 'GlbCorriendo', 0);

    GlbVenderDesdeAlmacenP := Ini.ReadInteger('Venta', 'GlbVenderDesdeAlmacenP', 0);

    if GlbCorriendo = 0 then
    Ini.WriteInteger('Aplicacion', 'GlbCorriendo', 1);
  finally
  Ini.Free;
  end;

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
  chboxPermiteUnaInstancia.Checked:=true
  else chboxPermiteUnaInstancia.Checked:=False;
end;

procedure TfrmConfReporte.ProcGuardarDatos;
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(ExtractFilePath(Application.ExeName)+'\'+'repconf_cr.ini' );
  try

  if rdgImprimirReciboSinPreguntar.ItemIndex = 0 then
    Ini.WriteInteger( 'Recibo', 'GlbImpReciboSinPreg', 1)
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

end.
