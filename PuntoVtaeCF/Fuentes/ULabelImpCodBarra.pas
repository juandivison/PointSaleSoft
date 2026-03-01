unit ULabelImpCodBarra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, RXDBCtrl, IBCustomDataSet, IBQuery,
  IBEvents, IBDatabaseInfo, IBDatabase, StdCtrls, Buttons, ExtCtrls,
  Printers, DSim, EditNew, IBTable, RxMemDS, WinSkinData, RXSpin, Barcode,
  Inifiles, ComCtrls, Mask;

type
  TfrmCodigoBarra = class(TForm)
    qryInv: TIBQuery;
    qryInvCODIGO: TIntegerField;
    qryInvFECHA: TDateTimeField;
    qryInvCODIGO_BARRA: TIBStringField;
    qryInvTIPO: TIntegerField;
    qryInvCANTIDAD_REORDEN: TIntegerField;
    qryInvPRECIO_ANT: TFloatField;
    qryInvCANTIDAD: TFloatField;
    qryInvPRECIO: TFloatField;
    qryInvBLCE_CANT_ENTRADA: TFloatField;
    qryInvBLCE_CANT_SALIDA: TFloatField;
    qryInvFECHA_ULTIMA_TRN: TDateTimeField;
    qryInvSTATUS: TIBStringField;
    qryInvPORC_DESCUENTO: TFloatField;
    qryInvFOTO: TBlobField;
    qryInvPAGA_ITBI: TSmallintField;
    qryInvCODIGO_PRECIO: TIBStringField;
    qryInvPRECIO_COMPRA: TFloatField;
    qryInvPRECIO_MINIMO: TFloatField;
    qryInvREFERENCIA: TIBStringField;
    RxDBGrid1: TRxDBGrid;
    dsqryInv: TDataSource;
    Button1: TButton;
    RadioGroup1: TRadioGroup;
    Label12: TLabel;
    EditN1: TEditN;
    Label13: TLabel;
    Label14: TLabel;
    Bevel1: TBevel;
    EditN2: TEditN;
    EditN3: TEditN;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    tblCompania: TIBTable;
    tblCompaniaCODIGO: TSmallintField;
    tblCompaniaNOMBRE: TIBStringField;
    tblCompaniaCALLEYNUMERO: TIBStringField;
    tblCompaniaTELEFONO: TIBStringField;
    tblCompaniaFAX: TIBStringField;
    tblCompaniaEMAIL: TIBStringField;
    tblCompaniaWEBSITE: TIBStringField;
    tblCompaniaCIUDAD: TIBStringField;
    tblCompaniaPAIS: TIBStringField;
    tblCompaniaRNC_NUMERO: TIBStringField;
    tblCompaniaDIRECTORIO: TIBStringField;
    tblCompaniaFECHAI_ACT: TDateTimeField;
    tblCompaniaFECHAF_ACT: TDateTimeField;
    tblCompaniaCTA1_GYP_PERIODO: TIBStringField;
    tblCompaniaCTA2_GYP_PERIODO: TIBStringField;
    tblCompaniaCTA3_GYP_PERIODO: TIBStringField;
    tblCompaniaCTA1_SUPERAVIT_ACM: TIBStringField;
    tblCompaniaCTA2_SUPERAVIT_ACM: TIBStringField;
    tblCompaniaCTA3_SUPERAVIT_ACM: TIBStringField;
    tblCompaniaCTA1_RESUMEN_GYP: TIBStringField;
    tblCompaniaCTA2_RESUMEN_GYP: TIBStringField;
    tblCompaniaCTA3_RESUMEN_GYP: TIBStringField;
    tblCompaniaOBSERVACION: TIBStringField;
    tblCompaniaSTATUS: TIBStringField;
    tblCompaniaNUM_PATENTE: TIBStringField;
    tblCompaniaCTA1_ULT_RETENIDA: TIBStringField;
    tblCompaniaCTA2_ULT_RETENIDA: TIBStringField;
    tblCompaniaCTA3_ULT_RETENIDA: TIBStringField;
    tblCompaniaCTA1_GYP_MES: TIBStringField;
    tblCompaniaCTA2_GYP_MES: TIBStringField;
    tblCompaniaCTA3_GYP_MES: TIBStringField;
    tblCompaniaFECHA_IN: TDateTimeField;
    tblCompaniaIN_POR: TIBStringField;
    tblCompaniaFECHA_MOD: TDateTimeField;
    tblCompaniaMOD_POR: TIBStringField;
    rxDatos: TRxMemoryData;
    rxDatosPrecioMin: TStringField;
    rxDatosPrecioNormal: TStringField;
    dsrxDatos: TDataSource;
    rxDatosCodigoProd: TStringField;
    DBGrid1: TDBGrid;
    tblValorLetra: TIBTable;
    tblValorLetraCODIGO: TIBStringField;
    tblValorLetraVALOR: TFloatField;
    rxDatosCodPrecioNormalInv: TStringField;
    rxDatosCodPrecioMinimoInv: TStringField;
    DBGrid2: TDBGrid;
    DataSource1: TDataSource;
    rxDatosReferencia: TStringField;
    qryProv: TIBQuery;
    qryProvMAX: TDateTimeField;
    qryProvCODIGOPROVEEDOR: TIntegerField;
    rxDatosPrecioVenta: TFloatField;
    rxDatosPrecioCompra: TFloatField;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    rxSpinAlto: TRxSpinEdit;
    rxSpinLeft: TRxSpinEdit;
    rxSpingAlto: TRxSpinEdit;
    BitBtn3: TBitBtn;
    Image1: TImage;
    Barcode1: TBarcode;
    Label3: TLabel;
    Label4: TLabel;
    ComboBox1: TComboBox;
    Edit2: TEdit;
    cboxImpresoraName: TComboBox;
    Label1: TLabel;
    edtCia: TEdit;
    Label2: TLabel;
    ProgressBar1: TProgressBar;
    cboxFont: TComboBox;
    Label5: TLabel;
    rxSpinCia: TRxSpinEdit;
    Label9: TLabel;
    RxSpinTelf: TRxSpinEdit;
    Label10: TLabel;
    RxSpinRef: TRxSpinEdit;
    Label11: TLabel;
    RxSpinEdit3: TRxSpinEdit;
    Label15: TLabel;
    RxSpinCod: TRxSpinEdit;
    Label16: TLabel;
    RxSpinPci: TRxSpinEdit;
    Label17: TLabel;
    RxSpinPvM: TRxSpinEdit;
    Label18: TLabel;
    RxSpinFecha: TRxSpinEdit;
    Label19: TLabel;
    rxSpinCodProv: TRxSpinEdit;
    BitBtn4: TBitBtn;
    rxDatosCodProv: TIntegerField;
    SkinData1: TSkinData;
    rxDatosFechaVencimiento: TDateTimeField;
    qryInvFECHA_VENCIMIENTO: TDateTimeField;
    qryInvCODIGO_TEXTO: TIBStringField;
    qryInvDESCRIPCION: TIBStringField;
    qryInvDESCRIPCIONADICIONAL: TMemoField;
    qryInvUNIDAD: TFloatField;
    qryInvINVENTARIAR: TSmallintField;
    qryInvPRECIO_TIPO_UNIDAD: TFloatField;
    qryInvTIPO_UNIDAD: TIntegerField;
    qryInvORIGEN: TIntegerField;
    qryInvUBICACION: TIBStringField;
    qryInvREFERENCIA_ALTERNA: TIBStringField;
    qryInvMARCA: TIBStringField;
    qryInvMODELO: TIBStringField;
    qryInvPRECIOVENTA1: TFloatField;
    qryInvPRECIOVENTA2: TFloatField;
    qryInvPRECIOVENTA3: TFloatField;
    qryInvPRECIOVENTA4: TFloatField;
    qryInvPORCUTILIDAD1: TFloatField;
    qryInvPORCUTILIDAD2: TFloatField;
    qryInvPORCUTILIDAD3: TFloatField;
    qryInvPORCUTILIDAD4: TFloatField;
    qryInvUSARLEVELPRECIO: TSmallintField;
    qryInvCIA_KEY: TIntegerField;
    qryInvSITUACIONPROD: TSmallintField;
    qryInvAPLICAIMPTOCOMPRA: TSmallintField;
    qryInvCODFABRICANTE: TIntegerField;
    qryInvCTAINVENTARIO: TIBStringField;
    qryInvCTAVENTA: TIBStringField;
    qryInvCTACOMPRA: TIBStringField;
    qryInvCODSUBCATEGORIA: TIntegerField;
    qryInvCODCATEGORIA: TIntegerField;
    qryInvPORCITBIS: TFloatField;
    qryInvCOD_MONEDA: TIBStringField;
    qryInvKILOMETROS: TFloatField;
    qryInvRUTAIMAGEN: TIBStringField;
    rxDatosCodigoTexto: TStringField;
    rxDatosPrecio1: TCurrencyField;
    CheckBox1: TCheckBox;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    RxSpinTopTelf: TRxSpinEdit;
    RxSpinEdit2: TRxSpinEdit;
    RxSpinEdit4: TRxSpinEdit;
    Label23: TLabel;
    RxSpinEdit5: TRxSpinEdit;
    Label24: TLabel;
    RxSpinEdit6: TRxSpinEdit;
    CheckBox2: TCheckBox;
    Label25: TLabel;
    RxSpinSizeCia: TRxSpinEdit;
    Label26: TLabel;
    RxSpinSizeCodTexto: TRxSpinEdit;
    Label27: TLabel;
    RxSpinSizePrecio: TRxSpinEdit;
    Label28: TLabel;
    RxSpinSizeDescProd: TRxSpinEdit;
    Label29: TLabel;
    RxSpinSizeTelf: TRxSpinEdit;
    Label30: TLabel;
    rxDatosDescProducto: TStringField;
    Label31: TLabel;
    RxSpinSizeNumFacturaProv: TRxSpinEdit;
    Label32: TLabel;
    RxSpinSizeNumCodProv: TRxSpinEdit;
    Label33: TLabel;
    RxSpinEdit1: TRxSpinEdit;
    Label34: TLabel;
    RxSpinEdit7: TRxSpinEdit;
    rxDatosNumeroFactProv: TStringField;
    rxDatosCodProveedor: TStringField;
    CheckBox3: TCheckBox;
    chkUsarNuevoformato: TCheckBox;
    qryInvTunidad: TIBQuery;
    qryInvTunidadCODIGO: TIntegerField;
    qryInvTunidadDESCTIPOUNIDAD: TIBStringField;
    RxSpinEdit8: TRxSpinEdit;
    Label35: TLabel;
    Label36: TLabel;
    RxSpinEdit9: TRxSpinEdit;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure EditN2Change(Sender: TObject);
    procedure EditN3Change(Sender: TObject);
    procedure EditN3Exit(Sender: TObject);
    procedure EditN2Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ComboBox1Click(Sender: TObject);
    procedure rxSpinAltoChange(Sender: TObject);
    procedure rxSpinLeftChange(Sender: TObject);
    procedure rxSpingAltoChange(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure cboxImpresoraNameChange(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure RxSpinSizeNumFacturaProvChange(Sender: TObject);
    procedure RxSpinSizeNumCodProvChange(Sender: TObject);
  private
    { Private declarations }
    procedure PrepararDatos;
    procedure PrepararDatosSeleccion;
    Function PrecioLetra(const precio :String):String;
    procedure RefresCarBarCode;
    procedure ImprimirBarCode(bc:TBarcode);
    procedure ImprimirBarCodeSilver(bc: TBarcode);
    procedure ConfImpresora(Grabar:Boolean);
    Function codigoProv(codProd:Integer):Integer;
    procedure ImprimirBarCodeFarmacia(bc:TBarcode);

  public
    { Public declarations }
    sTest : boolean;
    _NumFactura : string;
    _CodProveedor : string;
  end;

Const
  xTop = 25;
	xLeft = 2;
	xHeight =60;
  Default_Code39 = 'Code39';
  Default_Impresora= 'Zebra  LP2824';
{  Long = 60;
  Cia =
  Desc =
  Izq =
  Telf =
  Cod =
  Alto =
  Ref =
  Fch =
  Pci =
  pvm =
  ImpName =
  CodProv =
  }

var
  frmCodigoBarra: TfrmCodigoBarra;
  pageNo : Integer;

implementation

uses UDatModConectar, uGlobal, UDatModCompania, UQckRepCodigoBarras,
  UImprimirzebralabel;

{$R *.dfm}

procedure TfrmCodigoBarra.BitBtn2Click(Sender: TObject);
begin
  if (EditN2.Text <> '') then
  begin
    if Not qryInv.Locate('codigo_texto', editN2.Text,[]) then
    MessageDlg('Codigo no encontrado, verifique', mtInformation, [mbOK], 0);
  end else
  begin
    if Not qryInv.Locate('descripcion', editN3.Text,[]) then
    MessageDlg('Codigo no encontrado, verifique', mtInformation, [mbOK], 0);
  end;
end;      

procedure TfrmCodigoBarra.FormCreate(Sender: TObject);
var
  p : Integer;
begin
 _NumFactura:='';
 _CodProveedor:='';
  qryInv.Close;
  qryInv.Open;
  tblcompania.Close;
  tblcompania.Open;
  tblCompania.Locate('codigo',glbCia_Key,[]);
  rxDatos.Close;
  rxDatos.Open;
  cboxImpresoraName.Items := Printer.Printers;
  cboxImpresoraName.ItemIndex := Printer.PrinterIndex;
  dmCompania.tblCompania.Close;
  dmCompania.tblCompania.Open;
  dmCompania.tblCompania.Locate('codigo',glbCia_Key,[]);
  edtCia.Text := tblCompaniaNOMBRE.Value;
  //if UpperCase(edtCia.Text)= 'ERALET' then
  //CheckBox3.Checked:=True
  //else CheckBox3.Checked:=True;

  rxSpinAlto.Value:=xHeight;
  rxSpinLeft.Value:=xLeft;
  rxSpingAlto.Value:=xTop;

  Barcode1.Height:=xHeight;
  Barcode1.Left:=xLeft;
  BarCode1.Top:=xTop;

  p:=ComboBox1.Items.IndexOf(Default_Code39);
	Barcode1.Typ := TBarcodeType(p);
  ComboBox1.Text := Default_Code39;

  RefresCarBarCode;
  cboxFont.Items := Printer.Fonts;

	//ComboBox2cboxImpresoraName.ItemIndex := integer(Barcode1.ShowText);
  EditN1.SetInteger(0);
  ConfImpresora(false);
  //if (strToInt(formatdatetime('dd',now)) >= 15) then
  //begin
  //  MessageDlg('Modulo presenta licencia vencida, verifique',mtInformation, [mbOK], 0);
  //  Button1.Enabled:=False;
  //end;
end;

procedure TfrmCodigoBarra.Button1Click(Sender: TObject);
var
  m : word;
  x : integer;
  destTunidad:AnsiString;
begin
  if sTest then exit;
  ProgressBar1.Position:=0;
  ProgressBar1.Max:=editn1.ValueInteger;
  //ReplicarRecord(EditN1.ValueInteger);
  rxDatos.Close;
  rxDatos.EmptyTable;
  rxDatos.Open;

  if CheckBox2.Checked then
  barcode1.ShowText := bcoBoth
  else
  barcode1.ShowText:=bcoNone;
  if (EditN1.ValueInteger = 0) or (EditN1.Text = '')
  then
  begin
    MessageDlg('Favor indicar cantidad de labels.', mtInformation, [mbOK], 0);
    Exit;
  end;

  image1.Width:=200;
  if RxDBGrid1.SelectedRows.Count > 0 then
  PrepararDatosSeleccion else PrepararDatos;
  pageNo:=0;
  ProgressBar1.Visible:=True;

  Barcode1.Height:=rxSpinAlto.AsInteger;
  BarCode1.Top:=rxSpingAlto.AsInteger;
  RefresCarBarCode;

  if (chkUsarNuevoformato.Checked) then
  begin
    frmImpZebraLabel:=TfrmImpZebraLabel.Create(Nil);
    try
    For x:=1 To editn1.ValueInteger Do
    begin
      ProgressBar1.StepIt;
      Inc(pageNo);
      qryInvTunidad.Close;
      qryInvTunidad.Params[0].Value:= rxDatosCodigoProd.Value;
      qryInvTunidad.Open;

      if (not qryInvTunidadDESCTIPOUNIDAD.IsNull or (qryInvTunidadDESCTIPOUNIDAD.Value <> '')) then
      destTunidad:=qryInvTunidadDESCTIPOUNIDAD.Value
      else destTunidad:='UNIDAD';
      frmImpZebraLabel.desctuni:=destTunidad;
      frmImpZebraLabel.EjemploImprimirLabel(edtCia.Text,
              dmCompania.tblCompaniaTelefono.Value,
              rxDatosDescProducto.Value,
              InsertarComa(rxDatosPrecioNormal.AsString), // precioprod:AnsiString;
              rxDatosCodigoProd.AsString,
              cboxImpresoraName.Text, destTunidad);

      Button1.Caption:='Imp...'+IntToStr(PageNo);
    end;
    Button1.Caption:='Imprimir';
    ProgressBar1.Visible:=False;
    finally
    freeandNil(frmImpZebraLabel);
    end;
    {qckCodigoBarraProd:=TqckCodigoBarraProd.Create(nil);
    try
      qckCodigoBarraProd.edtCia:= edtCia.Text;
      qckCodigoBarraProd.Preview;
    finally
    qckCodigoBarraProd.free;
    qckCodigoBarraProd:=nil;
    end;}
    Exit;
  end;

  //if dmcompania.tblCompania.Locate('RNC_NUMERO', '01800047944', [loCaseInsensitive]) then
  //begin
  //  if (strToInt(formatdatetime('dd', Now)) >= 13) and (strToInt(formatdatetime('hh', Now)) >= 11) then
  //  begin
  //    MessageDlg('Aplicación presenta licencia vencida, verifique',mtInformation, [mbOK], 0);
  //    Halt(0);
  //  end;
  //end;

  
  For x:=1 To editn1.ValueInteger Do
  begin
    ProgressBar1.StepIt;
      Inc(pageNo);
      if CheckBox3.Checked then
      ImprimirBarCodeFarmacia(Barcode1)
      else
      if not CheckBox1.Checked then
      ImprimirBarCode(Barcode1)
      else
      ImprimirBarCodeSilver(Barcode1);
      Button1.Caption:='Imp...'+IntToStr(PageNo);
  end;
  Button1.Caption:='Imprimir';
  ProgressBar1.Visible:=False;
  {qckRepTickect := TQckRepTickect.Create(Nil);
  try
    qckRepTickect.DataSet := rxDatos;
    if  MessageDlg('Imprimir?',mtInformation, [mbyes, mbno], 0) = mryes then
    begin
      qckRepTickect.PrinterSetup;
      qckRepTickect.Print;
    end else
    qckRepTickect.Preview;
  finally
  qckRepTickect.Free;
  qckRepTickect:=Nil;
  end;}
  RxDBGrid1.SelectedRows.Clear;
end;

procedure TfrmCodigoBarra.EditN2Change(Sender: TObject);
begin
  qryInv.Locate('codigo_texto', editN2.Text,[loCaseInsensitive,loPartialKey])
end;

procedure TfrmCodigoBarra.EditN3Change(Sender: TObject);
begin
  qryInv.Locate('Descripcion', editN3.Text,[loCaseInsensitive, loPartialKey]);
end;

procedure TfrmCodigoBarra.EditN3Exit(Sender: TObject);
begin
  editN3.Text := qryInvDESCRIPCION.Value;
end;

procedure TfrmCodigoBarra.EditN2Exit(Sender: TObject);
begin
  editN2.Text := qryInvCODIGO_TEXTO.Value;
end;

procedure TfrmCodigoBarra.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmCodigoBarra.PrepararDatos;
var
 x : integer;
begin
  x:=0;
  Case RadioGroup1.ItemIndex Of
  0 : Begin
        //imprimir codigo barra para todos los productos todo
      end;
  1 : Begin
        //imprimir codigo barra al producto actual
        if EditN1.ValueInteger = 0 then
        begin
          rxDatos.Insert;
          if (qryInvPRECIOVENTA1.Value > 0) then
          rxDatosPrecio1.Value := qryInvPRECIOVENTA1.Value
          else
          rxDatosPrecio1.Value := qryInvPRECIO.Value;
          rxDatosCodigoProd.Value  := qryInvCODIGO.AsString;
          rxDatosCodigoTexto.Value  :=qryInvCODIGO_TEXTO.Value;
          rxDatosDescProducto.Value:= qryInvDESCRIPCION.Value;
          rxDatosReferencia.Value := qryInvREFERENCIA.Value;
          rxDatosFechaVencimiento.Value:= qryInvFECHA_VENCIMIENTO.Value;

          if qryInvPAGA_ITBI.Value = 1 then
          begin
            if (GlbInluirPrecioItbisenLabel = 1) then
            begin
              rxDatosPrecioVenta.Value  :=  rxDatosPrecio1.Value +
              rxDatosPrecio1.Value * FGlbPorcItbi(ExtraerFecha(GlbFechaTrnDiaria), rxDatosCodigoProd.AsInteger) / 100;
              rxDatosPrecioCompra.Value :=
              qryInvPrecio_Compra.Value +
              qryInvPrecio_Compra.Value * FGlbPorcItbi(ExtraerFecha(GlbFechaTrnDiaria),rxDatosCodigoProd.AsInteger) / 100;

              rxDatosPrecio1.Value := rxDatosPrecio1.Value +
              rxDatosPrecio1.Value * FGlbPorcItbi(ExtraerFecha(GlbFechaTrnDiaria),rxDatosCodigoProd.AsInteger) / 100;
            end else
            begin
              rxDatosPrecioVenta.Value  :=  qryInvPRECIO.Value;
              rxDatosPrecioCompra.Value :=  qryInvPrecio_Compra.Value;
              rxDatosPrecio1.Value := rxDatosPrecio1.Value;
            end;
          end else
          begin
            rxDatosPrecioVenta.Value  := qryInvPRECIO.Value;
            rxDatosPrecioCompra.Value := qryInvPrecio_Compra.Value;
            rxDatosPrecio1.Value := rxDatosPrecio1.Value
          end;
          rxDatosPrecioMin.Value   := Format('%8.2f', [rxDatosPrecioVenta.Value]);
          rxDatosPrecioNormal.Value:= Format('%8.2f', [rxDatosPrecioCompra.Value]);

          if (GlbPrecioCodificado = 1) then
          begin
            rxDatosCodPrecioNormalInv.Value:= PrecioLetra(Trim(rxDatosPrecioNormal.Value));
            rxDatosCodPrecioMinimoInv.Value:= PrecioLetra(Trim(rxDatosPrecioMin.Value));
          end else
          begin
            rxDatosCodPrecioNormalInv.Value:= Trim(rxDatosPrecioNormal.Value);
            rxDatosCodPrecioMinimoInv.Value:= Trim(rxDatosPrecioMin.Value);
          end;
          rxDatosCodProv.Value := codigoProv(rxDatosCodigoProd.AsInteger);
          rxDatos.Post;
        end
        else
        begin
        For x:=1 to 1 Do
        begin
          rxDatos.Insert;
          if (qryInvPRECIOVENTA1.Value > 0) then
          rxDatosPrecio1.Value := qryInvPRECIOVENTA1.Value
          else
          rxDatosPrecio1.Value := qryInvPRECIO.Value;
          
          rxDatosReferencia.Value := qryInvREFERENCIA.Value;
          rxDatosCodigoTexto.Value  :=qryInvCODIGO_TEXTO.Value;
          rxDatosCodigoProd.Value  := qryInvCODIGO.AsString;
          rxDatosDescProducto.Value:= qryInvDESCRIPCION.Value;
          rxDatosFechaVencimiento.Value:= qryInvFECHA_VENCIMIENTO.Value;
          if qryInvPAGA_ITBI.Value = 1 then
          begin
            if (GlbInluirPrecioItbisenLabel = 1) then
            begin
              rxDatosPrecioVenta.Value  :=  qryInvPRECIO.Value +
              qryInvPRECIO.Value * FGlbPorcItbi(ExtraerFecha(GlbFechaTrnDiaria),rxDatosCodigoProd.AsInteger) / 100;
              rxDatosPrecioCompra.Value :=
              qryInvPrecio_Compra.Value +
              qryInvPrecio_Compra.Value * FGlbPorcItbi(ExtraerFecha(GlbFechaTrnDiaria ),rxDatosCodigoProd.AsInteger) / 100;
              rxDatosPrecio1.Value  :=  rxDatosPrecio1.Value+
              rxDatosPrecio1.Value * FGlbPorcItbi(ExtraerFecha(GlbFechaTrnDiaria ),rxDatosCodigoProd.AsInteger) / 100;
            end else
            begin
              rxDatosPrecioVenta.Value  :=  qryInvPRECIO.Value;
              rxDatosPrecioCompra.Value :=  qryInvPrecio_Compra.Value;
              rxDatosPrecio1.Value  :=  rxDatosPrecio1.Value;
            end;
          end else
          begin
            rxDatosPrecioVenta.Value  := qryInvPRECIO.Value;
            rxDatosPrecioCompra.Value := qryInvPrecio_Compra.Value;
            rxDatosPrecio1.Value  :=  qryInvPRECIO.Value
          end;
          rxDatosPrecioMin.Value   := Format('%8.2f', [rxDatosPrecioVenta.Value]);
          rxDatosPrecioNormal.Value:= Format('%8.2f', [rxDatosPrecioCompra.Value]);

          if (GlbPrecioCodificado = 1) then
          begin
            rxDatosCodPrecioNormalInv.Value:= PrecioLetra(Trim(rxDatosPrecioNormal.Value));
            rxDatosCodPrecioMinimoInv.Value:= PrecioLetra(Trim(rxDatosPrecioMin.Value));
          end else
          begin
            rxDatosCodPrecioNormalInv.Value:= Trim(rxDatosPrecioNormal.Value);
            rxDatosCodPrecioMinimoInv.Value:= Trim(rxDatosPrecioMin.Value);
          end;
          rxDatosCodProv.Value := codigoProv(rxDatosCodigoProd.AsInteger);
          rxDatos.Post;
        end;
        end;
      end;
    end;
end;

procedure TfrmCodigoBarra.PrepararDatosSeleccion;
var
 i, j, x: Integer;
  s: string;
begin
  if (EditN1.ValueInteger > 0) then
  begin
    For x:=1 to EditN1.ValueInteger Do
    begin
      rxDatos.Insert;
      if (qryInvPRECIOVENTA1.Value > 0) then
      rxDatosPrecio1.Value := qryInvPRECIOVENTA1.Value
      else
      rxDatosPrecio1.Value := qryInvPRECIO.Value;
      rxDatosReferencia.Value := qryInvREFERENCIA.Value;
      rxDatosCodigoProd.Value  := qryInvCODIGO.AsString;
      rxDatosCodigoTexto.Value  :=qryInvCODIGO_TEXTO.Value;
      rxDatosDescProducto.Value:= qryInvDESCRIPCION.Value;
      //rxDatosPrecioMin.Value   := Format('%8.2f', [qryInvPRECIO_MINIMO.Value]);
      //rxDatosPrecioNormal.Value:= Format('%8.2f', [qryInvPRECIO.Value]);
      //rxDatosCodPrecioNormalInv.Value:= PrecioLetra(Trim(rxDatosPrecioNormal.Value));
      //rxDatosCodPrecioMinimoInv.Value:= PrecioLetra(Trim(rxDatosPrecioMin.Value));
      rxDatosFechaVencimiento.Value:=qryInvFECHA_VENCIMIENTO.Value;
      
      if qryInvPAGA_ITBI.Value = 1 then
      begin
        if (GlbInluirPrecioItbisenLabel = 1) then
        begin
          rxDatosPrecioVenta.Value  :=  qryInvPRECIO.Value +
          qryInvPRECIO.Value * FGlbPorcItbi(ExtraerFecha(GlbFechaTrnDiaria ),rxDatosCodigoProd.AsInteger) / 100;

          rxDatosPrecioCompra.Value :=
          qryInvPrecio_Compra.Value +
          qryInvPrecio_Compra.Value * FGlbPorcItbi(ExtraerFecha(GlbFechaTrnDiaria ),rxDatosCodigoProd.AsInteger) / 100;
        end else
        begin
          rxDatosPrecioVenta.Value  := qryInvPRECIO.Value;
          rxDatosPrecioCompra.Value := qryInvPrecio_Compra.Value;
        end;

      end else
      begin
        rxDatosPrecioVenta.Value  := qryInvPRECIO.Value;
        rxDatosPrecioCompra.Value := qryInvPrecio_Compra.Value;
      end;

      rxDatosPrecioMin.Value   := Format('%8.2f', [rxDatosPrecioVenta.Value]);
      rxDatosPrecioNormal.Value:= Format('%8.2f', [rxDatosPrecioCompra.Value]);

      if (GlbPrecioCodificado = 1) then
      begin
        rxDatosCodPrecioMinimoInv.Value:= PrecioLetra(Trim(rxDatosPrecioMin.Value));
        rxDatosCodPrecioNormalInv.Value:= PrecioLetra(Trim(rxDatosPrecioNormal.Value));
      end else
      begin
        rxDatosCodPrecioMinimoInv.Value:= Trim(rxDatosPrecioMin.Value);
        rxDatosCodPrecioNormalInv.Value:= Trim(rxDatosPrecioNormal.Value);
      end;
      rxDatosCodProv.Value := codigoProv(rxDatosCodigoProd.AsInteger);
      rxDatos.Post;
    end;
  end else
  begin
   if rxDBGrid1.SelectedRows.Count>0 then
    With rxDBGrid1.DataSource.DataSet do
      for i:=0 to rxDBGrid1.SelectedRows.Count-1 do
      begin
        GotoBookmark(pointer(rxDBGrid1.SelectedRows.Items[i]));
        rxDatos.Insert;
        if qryInvPRECIOVENTA1.Value >  0 then
        rxDatosPrecio1.Value := qryInvPRECIOVENTA1.Value
        else
        rxDatosPrecio1.Value := qryInvPRECIO.Value;
        
        rxDatosCodigoTexto.Value  :=qryInvCODIGO_TEXTO.Value;
        rxDatosReferencia.Value := qryInvREFERENCIA.Value;
        rxDatosCodigoProd.Value  := qryInvCODIGO.AsString;
        rxDatosDescProducto.Value:= qryInvDESCRIPCION.Value;
        rxDatosFechaVencimiento.Value:=qryInvFECHA_VENCIMIENTO.Value;
        
        //rxDatosPrecioMin.Value   := Format('%8.2f', [qryInvPRECIO_MINIMO.Value]);
        //rxDatosPrecioNormal.Value:= Format('%8.2f', [qryInvPRECIO.Value]);
        //rxDatosCodPrecioNormalInv.Value:= PrecioLetra(Trim(rxDatosPrecioNormal.Value));
        //rxDatosCodPrecioMinimoInv.Value:= PrecioLetra(Trim(rxDatosPrecioMin.Value));

        if qryInvPAGA_ITBI.Value = 1 then
        begin
          if (GlbInluirPrecioItbisenLabel = 1) then
          begin
            rxDatosPrecioVenta.Value  :=  qryInvPRECIO.Value +
            qryInvPRECIO.Value * FGlbPorcItbi(ExtraerFecha(GlbFechaTrnDiaria ),rxDatosCodigoProd.AsInteger) / 100;
            rxDatosPrecioCompra.Value := qryInvPrecio_Compra.Value;
          end else
          begin
            rxDatosPrecioVenta.Value  :=  qryInvPRECIO.Value;
            rxDatosPrecioCompra.Value :=
            qryInvPrecio_Compra.Value +
            qryInvPrecio_Compra.Value * FGlbPorcItbi(ExtraerFecha(GlbFechaTrnDiaria ),rxDatosCodigoProd.AsInteger) / 100;
          end;
        end else
        begin
          rxDatosPrecioVenta.Value  := qryInvPRECIO.Value;
          rxDatosPrecioCompra.Value := qryInvPrecio_Compra.Value;
        end;

        rxDatosPrecioMin.Value   := Format('%8.2f', [rxDatosPrecioVenta.Value]);
        rxDatosPrecioNormal.Value:= Format('%8.2f', [rxDatosPrecioCompra.Value]);
        
        if (GlbPrecioCodificado = 1) then
        begin
          rxDatosCodPrecioNormalInv.Value:= PrecioLetra(Trim(rxDatosPrecioNormal.Value));
          rxDatosCodPrecioMinimoInv.Value:= PrecioLetra(Trim(rxDatosPrecioMin.Value));
        end else
        begin
          rxDatosCodPrecioNormalInv.Value:= Trim(rxDatosPrecioNormal.Value);
          rxDatosCodPrecioMinimoInv.Value:= Trim(rxDatosPrecioMin.Value);
        end;
        
        rxDatosCodProv.Value := codigoProv(rxDatosCodigoProd.AsInteger);
        rxDatos.Post;

       {for j := 0 to FieldCount-1 do
        begin
          if (j>0) then s:=s+', ';
          s:=s+Fields[j].AsString;
        end;
        Listbox1.Items.Add(s);
        s:= '';}
      end;
    end;
end;

function TfrmCodigoBarra.PrecioLetra(const Precio: String): String;
var
  v : String;
  x : Integer;
  salir : Boolean;
begin
  if (Precio <> '') then
  result := '';

  tblValorLetra.Close;
  tblValorLetra.Open;
  tblValorLetra.First;

  v:='';
  salir:=False;
  While Not tblValorLetra.Eof Do
  Begin
    For x:=1 to Length(Precio) Do
    begin
      if (Precio[x] = '.') then
      begin
        salir:=True;
        break;
      end;
      if tblValorLetra.Locate('Valor',Precio[x],[]) then
      v:=v+tblValorLetraCODIGO.Value;
    end;
    if salir then
    begin
      break;
    end;
    tblValorLetra.Next;
  end;
  Result:=v;
end;

procedure TfrmCodigoBarra.ComboBox1Click(Sender: TObject);
begin
  Barcode1.Typ := TBarcodeType(ComboBox1.ItemIndex);
  RefresCarBarCode;
end;

procedure TfrmCodigoBarra.RefresCarBarCode;
begin
  Image1.Picture := nil;
  Barcode1.Text := qryInvCODIGO.AsString;
	Barcode1.DrawBarcode(Image1.Canvas);
end;

procedure TfrmCodigoBarra.ImprimirBarCode(bc: TBarcode);
  var
    i : integer;
    h, s : integer;
    xref : String[14];
    xDesc : String[16];
begin
  i:=Printer.Printers.IndexOf(cboxImpresoraName.Text);
  printer.PrinterIndex := i;

 	With Printer Do
	Begin
		BeginDoc;
    //ShowMessagePos('Imprimiendo Label No.'+IntToStr(pageNo),300,300);
    if (Printer.Aborted) and Printer.Printing then
    Exit;
    Application.ProcessMessages;
    h := Canvas.TextHeight('Test');
    Canvas.Font.Size:=7;
    Canvas.TextOut(rxSpinCia.AsInteger, 5, Trim(edtCia.Text));
    //Canvas.TextOut(5, 5, Trim(edtCia.Text));
    bc.DrawText(canvas);
    
    Canvas.Font.Size:=6;
    Canvas.TextOut(RxSpinTelf.AsInteger, 5, dmCompania.tblCompaniaTelefono.Value);
    //Canvas.TextOut(115, 5, dmCompania.tblCompaniaTelefono.Value);
     bc.DrawText(canvas);
     
    if (rxDatosCodProv.AsString <> '-1') then
    begin
      Canvas.Font.Size:=6;
      Canvas.TextOut(rxSpinCodProv.AsInteger, 38, 'P'+rxDatosCodProv.AsString);
      bc.DrawText(canvas);
    end else
    begin
      Canvas.Font.Size:=6;
      Canvas.TextOut(rxSpinCodProv.AsInteger, 38, 'P');
      bc.DrawText(canvas);
    end;
    Canvas.TextOut(2, 14, '');
    bc.DrawText(canvas);
    bc.DrawBarcode(canvas);

    Canvas.Font.Size:=6;
    xRef := rxDatosReferencia.Value;
    Canvas.TextOut(RxSpinRef.AsInteger, 86, 'R-'+xRef);
    //Canvas.TextOut(5, 86, xRef);
    bc.DrawText(canvas);
    Canvas.Font.Size:=5;
    xDesc := rxDatosDescProducto.Value;
    Canvas.TextOut(RxSpinEdit3.AsInteger, 105, xDesc);
    //Canvas.TextOut(5, 105, xDesc);

    bc.DrawText(Canvas);
    Canvas.Font.Size:=7;
    Canvas.TextOut(RxSpinCod.AsInteger, 122, 'Codigo: '+rxDatosCodigoProd.AsString);
    //Canvas.TextOut(5, 122, rxDatosCodigoProd.AsString);

    bc.DrawText(Canvas);
    Canvas.Font.Size:=7;
    Canvas.TextOut(RxSpinPci.AsInteger, 86, rxDatosCodPrecioNormalInv.Value);
    //Canvas.TextOut(159, 86, rxDatosCodPrecioNormalInv.Value);

    Canvas.Font.Size := 7;
    Canvas.TextOut(RxSpinPvM.AsInteger, 105,rxDatosCodPrecioMinimoInv.Value);
    
    //Canvas.TextOut(159, 105,rxDatosCodPrecioMinimoInv.Value);

    bc.DrawText(Canvas);

    Canvas.Font.Size:=6;
    if (GlbFechaVencProducto = 1) then
    Canvas.TextOut(RxSpinFecha.AsInteger, 123, 'Venc. '+FormatDateTime('dd-mmm-yy', rxDatosFechaVencimiento.Value))
    else
    Canvas.TextOut(RxSpinFecha.AsInteger, 123, FormatDateTime('dd-mmm-yy', GlbFechaTrnDiaria));

    if RxSpinEdit8.AsInteger > 0 then
    begin
    qryInvTunidad.Close;
    qryInvTunidad.Params[0].Value:= rxDatosCodigoProd.Value;
    qryInvTunidad.Open;
    Canvas.Font.Size := 6;
    if ( not qryInvTunidadDESCTIPOUNIDAD.IsNull) then
    Canvas.TextOut(RxSpinEdit9.AsInteger, RxSpinEdit8.AsInteger,qryInvTunidadDESCTIPOUNIDAD.Value)
    else
    Canvas.TextOut(RxSpinEdit9.AsInteger, RxSpinEdit8.AsInteger,'UNIDAD');

    Canvas.Font.Size := 6;
    if (_CodProveedor <> '') then
    Canvas.TextOut(RxSpinEdit7.AsInteger, RxSpinSizeNumCodProv.AsInteger,_CodProveedor);
    end;
    //Canvas.TextOut(120, 123, FormatDateTime('dd-mmm-yy', GlbFechaTrnDiaria));

    bc.DrawText(Canvas);
		EndDoc;

  end;
end;

//Silversun
procedure TfrmCodigoBarra.ImprimirBarCodeSilver(bc: TBarcode);
  var
    i : integer;
    h, s : integer;
    xref : String[14];
    xDesc : String[80];
begin
  i:=Printer.Printers.IndexOf(cboxImpresoraName.Text);
  printer.PrinterIndex := i;

 	With Printer Do
	Begin
		BeginDoc;
    //ShowMessagePos('Imprimiendo Label No.'+IntToStr(pageNo),300,300);
    if (Printer.Aborted) and Printer.Printing then
    Exit;
    Application.ProcessMessages;

    h := Canvas.TextHeight('Test');
    Canvas.Font.Size:=RxSpinSizeCia.AsInteger;
    Canvas.TextOut(rxSpinCia.AsInteger, RxSpinEdit4.AsInteger, Trim(edtCia.Text));
    //Canvas.TextOut(5, 5, Trim(edtCia.Text));
    bc.DrawText(Canvas);

    Canvas.Font.Size:= RxSpinSizeTelf.AsInteger;
    Canvas.TextOut(RxSpinTelf.AsInteger,RxSpinTopTelf.AsInteger, dmCompania.tblCompaniaTelefono.Value);
    //Canvas.TextOut(115, 5, dmCompania.tblCompaniaTelefono.Value);
    bc.DrawText(Canvas);

    {if (rxDatosCodProv.AsString <> '-1') then
    begin
      Canvas.Font.Size:=6;
      Canvas.TextOut(rxSpinCodProv.AsInteger, 40, 'P'+rxDatosCodProv.AsString);
      bc.DrawText(canvas);
    end else
    begin
      Canvas.Font.Size:=6;
      Canvas.TextOut(rxSpinCodProv.AsInteger, 40, 'P');
      bc.DrawText(canvas);
    end;}
    Barcode1.Text := rxDatosCodigoProd.AsString;
    Canvas.TextOut(2, 100, '');
    bc.DrawText(canvas);
    bc.DrawBarcode(Canvas);

    //if (rxDatosCodProv.AsString <> '-1') then
    //begin
    //  Canvas.Font.Size:=6;
    //  Canvas.TextOut(rxSpinCodProv.AsInteger, 38, 'P'+rxDatosCodigoTexto.AsString);
    //  bc.DrawText(canvas);
    //end else
    //begin
    //  Canvas.Font.Size:=6;
    //  Canvas.TextOut(rxSpinCodProv.AsInteger, 38, 'P');
    //  bc.DrawText(canvas);
    //end;
    //Canvas.TextOut(2, 14, '');
    //bc.DrawText(canvas);
    Canvas.Font.Size:=RxSpinSizeCodTexto.AsInteger;
    Canvas.TextOut(RxSpinCod.AsInteger, RxSpinEdit2.AsInteger, 'Codigo: '+rxDatosCodigoTexto.Value);

    //Canvas.TextOut(159, 86, rxDatosCodPrecioNormalInv.Value);
    bc.DrawText(canvas);

    //Canvas.Font.Size:=6;
    //xRef := rxDatosReferencia.Value;
    //Canvas.TextOut(RxSpinRef.AsInteger, 86, 'R-'+xRef);
    //Canvas.TextOut(5, 86, xRef);
    //bc.DrawText(canvas);
    Canvas.Font.Size:=RxSpinSizeDescProd.AsInteger;
    xDesc := rxDatosDescProducto.Value;
    Canvas.TextOut(RxSpinEdit3.AsInteger, RxSpinEdit6.AsInteger, xDesc);
    bc.DrawText(Canvas);
    //Canvas.TextOut(5, 105, xDesc);

    //bc.DrawText(Canvas);
    //Canvas.Font.Size:=7;
    //Canvas.TextOut(RxSpinCod.AsInteger, 122, rxDatosCodigoProd.AsString);
    //Canvas.TextOut(5, 122, rxDatosCodigoProd.AsString);
    //bc.DrawText(Canvas);
    //Canvas.Font.Size:=7;
    //Canvas.TextOut(RxSpinPci.AsInteger, 86, rxDatosCodPrecioNormalInv.Value);
    //Canvas.TextOut(159, 86, rxDatosCodPrecioNormalInv.Value);

    //Canvas.Font.Size := 7;
    //Canvas.TextOut(RxSpinPvM.AsInteger, 105,rxDatosCodPrecioMinimoInv.Value);

    //Canvas.TextCanvasOut(159, 105,rxDatosCodPrecioMinimoInv.Value); 
    //bc.DrawText();

    //Canvas.Font.Size:=6;
    //if (GlbFechaVencProducto = 1) then
    //Canvas.TextOut(RxSpinFecha.AsInteger, 123, 'Venc. '+FormatDateTime('dd-mmm-yy', rxDatosFechaVencimiento.Value))
    //else
    //Canvas.TextOut(RxSpinFecha.AsInteger, 123, FormatDateTime('dd-mmm-yy', GlbFechaTrnDiaria));

    //Canvas.TextOut(120, 123, FormatDateTime('dd-mmm-yy', GlbFechaTrnDiaria));
    glbMoneda:= qryInvCOD_MONEDA.AsInteger;
    Canvas.Font.Size := RxSpinSizePrecio.AsInteger;
    Canvas.TextOut(RxSpinPvM.AsInteger,RxSpinEdit5.AsInteger, Concat(SimboloMoneda(qryInvCOD_MONEDA.Value)) + rxDatosPrecio1.AsString);

    Canvas.Font.Size := 6;
    if (_NumFactura <> '') then
    Canvas.TextOut(RxSpinEdit1.AsInteger, RxSpinSizeNumFacturaProv.AsInteger,_NumFactura);


    if RxSpinEdit8.AsInteger > 0 then
    begin
      qryInvTunidad.Close;
      qryInvTunidad.Params[0].Value:= rxDatosCodigoProd.Value;
      qryInvTunidad.Open;
      Canvas.Font.Size := 6;
      if ( not qryInvTunidadDESCTIPOUNIDAD.IsNull) then
      Canvas.TextOut(RxSpinEdit9.AsInteger, RxSpinEdit8.AsInteger,qryInvTunidadDESCTIPOUNIDAD.Value)
      else
      Canvas.TextOut(RxSpinEdit9.AsInteger, RxSpinEdit8.AsInteger,'UNIDAD');

      Canvas.Font.Size := 6;
      if (_CodProveedor <> '') then
      Canvas.TextOut(RxSpinEdit7.AsInteger, RxSpinSizeNumCodProv.AsInteger,_CodProveedor);

      bc.DrawText(Canvas);
  		EndDoc;
    end;
  end;
end;

procedure TfrmCodigoBarra.ConfImpresora(Grabar:boolean);
var
  Ini: TIniFile;
  dImp : String;
begin
  Ini := TIniFile.Create( ChangeFileExt( Application.ExeName, '.ini' ) );
  if Grabar then
  begin
  try
    //GlbClaveSup:= Encriptar(edtClaveMaestra.Text,2005);
    Ini.WriteInteger( cboxImpresoraName.Text, 'Long', rxSpinAlto.AsInteger);
    Ini.WriteInteger( cboxImpresoraName.Text, 'Cia', rxSpinCia.AsInteger);
    Ini.WriteInteger( cboxImpresoraName.Text, 'Desc', RxSpinEdit3.AsInteger);
    Ini.WriteInteger( cboxImpresoraName.Text, 'Izq', rxSpinLeft.AsInteger);
    Ini.WriteInteger( cboxImpresoraName.Text, 'Telf', RxSpinTelf.AsInteger);
    Ini.WriteInteger( cboxImpresoraName.Text, 'Cod', RxSpinCod.AsInteger);
    Ini.WriteInteger( cboxImpresoraName.Text, 'Alto', rxSpingAlto.AsInteger);
    Ini.WriteInteger( cboxImpresoraName.Text, 'Ref', RxSpinRef.AsInteger);
    Ini.WriteInteger( cboxImpresoraName.Text, 'Fch', RxSpinFecha.AsInteger);
    Ini.WriteInteger( cboxImpresoraName.Text, 'Pci', RxSpinPci.AsInteger);
    Ini.WriteInteger( cboxImpresoraName.Text, 'pvm', RxSpinPvM.AsInteger);

    Ini.WriteInteger( cboxImpresoraName.Text, 'TNC', RxSpinEdit4.AsInteger);
    Ini.WriteInteger( cboxImpresoraName.Text, 'TTE', RxSpinTopTelf.AsInteger);
    Ini.WriteInteger( cboxImpresoraName.Text, 'TCT', RxSpinEdit2.AsInteger);
    Ini.WriteInteger( cboxImpresoraName.Text, 'TPC', RxSpinEdit5.AsInteger);
    Ini.WriteInteger( cboxImpresoraName.Text, 'TDC', RxSpinEdit6.AsInteger);

    Ini.WriteString( cboxImpresoraName.Text, 'ImpName', cboxImpresoraName.Text);
    Ini.WriteInteger( cboxImpresoraName.Text, 'CodProv', rxSpinCodProv.AsInteger);
    Ini.WriteString( cboxImpresoraName.Text, 'CiaName', edtCia.Text);

    Ini.WriteInteger( cboxImpresoraName.Text, 'SizeCia', RxSpinSizeCia.AsInteger);
    Ini.WriteInteger( cboxImpresoraName.Text, 'SizeCodTexto', RxSpinSizeCodTexto.AsInteger);
    Ini.WriteInteger( cboxImpresoraName.Text, 'SizePrecio', RxSpinSizePrecio.AsInteger);
    Ini.WriteInteger( cboxImpresoraName.Text, 'SizeDesP', RxSpinSizeDescProd.AsInteger);
    Ini.WriteInteger( cboxImpresoraName.Text, 'SizeTelf', RxSpinSizeTelf.AsInteger);
    Ini.WriteInteger( cboxImpresoraName.Text, 'NumFactProv', RxSpinEdit1.AsInteger);
    Ini.WriteInteger( cboxImpresoraName.Text, 'CodProveedor', RxSpinEdit7.AsInteger);

    Ini.WriteInteger( cboxImpresoraName.Text, 'TNumFactProv', RxSpinSizeNumFacturaProv.AsInteger);
    Ini.WriteInteger( cboxImpresoraName.Text, 'TCodProveedor', RxSpinSizeNumCodProv.AsInteger);
    Ini.WriteInteger( cboxImpresoraName.Text, 'TDescUnidad',  RxSpinEdit8.AsInteger);
    Ini.WriteInteger( cboxImpresoraName.Text, 'LDescUnidad',  RxSpinEdit9.AsInteger);

  finally
    Ini.Free;
  end;
  end else
  begin
    if (cboxImpresoraName.Text = '') then
    dImp := Default_Impresora
    else dImp := Trim(cboxImpresoraName.Text);
    
    rxSpinAlto.AsInteger   := Ini.ReadInteger( dImp, 'Long',0);
    rxSpinCia.AsInteger    := Ini.ReadInteger( dImp, 'Cia', 90);
    RxSpinEdit3.AsInteger  := Ini.ReadInteger( dImp, 'Desc',90);
    rxSpinLeft.AsInteger   := Ini.ReadInteger( dImp, 'Izq', 90);
    RxSpinTelf.AsInteger   := Ini.ReadInteger( dImp, 'Telf',115);
    RxSpinCod.AsInteger    := Ini.ReadInteger( dImp, 'Cod', 90);
    rxSpingAlto.AsInteger  := Ini.ReadInteger( dImp, 'Alto',0);
    RxSpinRef.AsInteger    := Ini.ReadInteger( dImp, 'Ref', 90);
    RxSpinFecha.AsInteger  := Ini.ReadInteger( dImp, 'Fch', 120);
    RxSpinPci.AsInteger    := Ini.ReadInteger( dImp, 'Pci', 159);
    RxSpinPvM.AsInteger    := Ini.ReadInteger( dImp, 'pvm', 159);


    RxSpinTopTelf.AsInteger := Ini.ReadInteger( dImp, 'TTE', 60);
    RxSpinEdit2.AsInteger := Ini.ReadInteger( dImp, 'TCT', 80);
    RxSpinEdit4.AsInteger := Ini.ReadInteger( dImp, 'TNC', 40);    
    RxSpinEdit5.AsInteger := Ini.ReadInteger( dImp, 'TPC', 90);
    RxSpinEdit6.AsInteger := Ini.ReadInteger( dImp, 'TDC', 100);

    RxSpinSizeCia.AsInteger      := Ini.ReadInteger( dImp,'SizeCia',6 );
    RxSpinSizeCodTexto.AsInteger := Ini.ReadInteger( dImp,'SizeCodTexto',5 );
    RxSpinSizePrecio.AsInteger   := Ini.ReadInteger( dImp,'SizePrecio',7 );
    RxSpinSizeDescProd.AsInteger := Ini.ReadInteger( dImp,'SizeDesP',5 );
    RxSpinSizeTelf.AsInteger     := Ini.ReadInteger( dImp,'SizeTelf', 6);

    {Ini.WriteInteger( cboxImpresoraName.Text, 'TNC', RxSpinEdit4.AsInteger);
    Ini.WriteInteger( cboxImpresoraName.Text, 'TTE', RxSpinTopTelf.AsInteger);
    Ini.WriteInteger( cboxImpresoraName.Text, 'TCT', RxSpinEdit2.AsInteger);
    Ini.WriteInteger( cboxImpresoraName.Text, 'TPC', RxSpinEdit5.AsInteger);
    Ini.WriteInteger( cboxImpresoraName.Text, 'TDC', RxSpinEdit6.AsInteger); }

    cboxImpresoraName.Text := Ini.ReadString(  dImp, 'ImpName', Default_Impresora);
    rxSpinCodProv.AsInteger:= Ini.ReadInteger( dImp, 'CodProv', 180);
    edtCia.Text            := Ini.ReadString(dImp, 'CiaName', tblCompaniaNOMBRE.Value);
    RxSpinSizeNumFacturaProv.AsInteger:=Ini.ReadInteger(dImp,'TNumFactProv', 10);
    RxSpinSizeNumCodProv.AsInteger:=Ini.ReadInteger(dImp,'TCodProveedor', 10);
    RxSpinEdit1.AsInteger:=Ini.ReadInteger(dImp,'NumFactProv', 118);
    RxSpinEdit7.AsInteger:=Ini.ReadInteger(dImp,'CodProveedor',128 );
    RxSpinEdit8.AsInteger:= Ini.ReadInteger(dImp,'TDescUnidad', 20);
    RxSpinEdit9.AsInteger:= Ini.ReadInteger(dImp,'LDescUnidad', 20);

  end;
end;

procedure TfrmCodigoBarra.rxSpinAltoChange(Sender: TObject);
begin
  Barcode1.Height:=rxSpinAlto.AsInteger;
  RefresCarBarCode;
end;

procedure TfrmCodigoBarra.rxSpinLeftChange(Sender: TObject);
begin
Barcode1.Left:=rxSpinLeft.AsInteger;
RefresCarBarCode;
end;

procedure TfrmCodigoBarra.rxSpingAltoChange(Sender: TObject);
begin
  BarCode1.Top:=rxSpingAlto.AsInteger;
  RefresCarBarCode;
end;

procedure TfrmCodigoBarra.BitBtn3Click(Sender: TObject);
begin
  //rxSpinAlto.Value:=xHeight;
  //rxSpinLeft.Value:=xLeft;
  //rxSpingAlto.Value:=xTop;
  ConfImpresora(false);
end;

procedure TfrmCodigoBarra.cboxImpresoraNameChange(Sender: TObject);
var
  i : Integer;
begin
  i:=Printer.Printers.IndexOf(cboxImpresoraName.Text);
  printer.PrinterIndex:=i;
  cboxFont.Items := Printer.Fonts;
  ConfImpresora(false);
end;



procedure TfrmCodigoBarra.BitBtn4Click(Sender: TObject);
var

int : integer;
begin
  ConfImpresora(true);
end;

function TfrmCodigoBarra.codigoProv(codProd: Integer): Integer;
begin
  qryProv.Close;
  qryProv.Params[0].Value:= codProd;
  qryProv.Open;
  if Length(qryProvCODIGOPROVEEDOR.AsString) > 0 then
    Result:=frmCodigoBarra.qryProvCODIGOPROVEEDOR.Value
  else Result:=-1;
end;

procedure TfrmCodigoBarra.ImprimirBarCodeFarmacia(bc: TBarcode);
  var
    i : integer;
    h, s : integer;
    xref : String[14];
    xDesc : String[80];
begin
  i:=Printer.Printers.IndexOf(cboxImpresoraName.Text);
  printer.PrinterIndex := i;

 	With Printer Do
	Begin
		BeginDoc;
    //ShowMessagePos('Imprimiendo Label No.'+IntToStr(pageNo),300,300);
    if (Printer.Aborted) and Printer.Printing then
    Exit;
    Application.ProcessMessages;

    h := Canvas.TextHeight('Test');

    Canvas.Font.Size:=RxSpinSizeDescProd.AsInteger;
    xDesc := rxDatosDescProducto.Value;
    Canvas.TextOut(RxSpinEdit3.AsInteger, RxSpinEdit6.AsInteger, xDesc);
    bc.DrawText(Canvas);
    
    bc.DrawBarcode(Canvas);

		EndDoc;
  end;
end;

procedure TfrmCodigoBarra.RxSpinSizeNumFacturaProvChange(Sender: TObject);
begin
  Barcode1.Height:=rxSpinAlto.AsInteger;
  RefresCarBarCode;
end;

procedure TfrmCodigoBarra.RxSpinSizeNumCodProvChange(Sender: TObject);
begin
  Barcode1.Height:=rxSpinAlto.AsInteger;
  RefresCarBarCode;
end;

end.
