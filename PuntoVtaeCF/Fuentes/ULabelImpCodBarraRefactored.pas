unit ULabelImpCodBarraRefactored;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, RXDBCtrl, IBCustomDataSet, IBQuery,
  IBEvents, IBDatabaseInfo, IBDatabase, StdCtrls, Buttons, ExtCtrls,
  Printers, DSim, EditNew, IBTable, RxMemDS, WinSkinData, RXSpin, Barcode,
  Inifiles, ComCtrls, Mask;

type
  TfrmCodigoBarraNew = class(TForm)
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
    Label3: TLabel;
    ComboBox1: TComboBox;
    cboxImpresoraName: TComboBox;
    Label1: TLabel;
    edtCia: TEdit;
    Label2: TLabel;
    ProgressBar1: TProgressBar;
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
    rxDatosDescProducto: TStringField;
    rxDatosNumeroFactProv: TStringField;
    rxDatosCodProveedor: TStringField;
    chkUsarNuevoformato: TCheckBox;
    BitBtn3: TBitBtn;
    qryInvTunidad: TIBQuery;
    qryInvTunidadCODIGO: TIntegerField;
    qryInvTunidadDESCTIPOUNIDAD: TIBStringField;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure EditN2Change(Sender: TObject);
    procedure EditN3Change(Sender: TObject);
    procedure EditN3Exit(Sender: TObject);
    procedure EditN2Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure cboxImpresoraNameChange(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);

  private
    { Private declarations }
    procedure PrepararDatos;
    procedure PrepararDatosSeleccion;
    Function PrecioLetra(const precio :String):String;


    Function codigoProv(codProd:Integer):Integer;

  public
    { Public declarations }
    desctuni:AnsiString;
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
  frmCodigoBarraNew: TfrmCodigoBarraNew;
  pageNo : Integer;

implementation

uses UDatModConectar, uGlobal, UDatModCompania, UQckRepCodigoBarras,
  UImprimirzebralabel;

{$R *.dfm}

procedure TfrmCodigoBarraNew.BitBtn2Click(Sender: TObject);
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

procedure TfrmCodigoBarraNew.FormCreate(Sender: TObject);
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
  edtCia.Text :=GlbCiaNamelabel;
  if (edtCia.Text = '') then
  edtCia.Text := tblCompaniaNOMBRE.Value;

  ComboBox1.Text := Default_Code39;
  //cboxFont.Items := Printer.Fonts;

  EditN1.SetInteger(0);

end;

procedure TfrmCodigoBarraNew.Button1Click(Sender: TObject);
var
  m : word;
  x : integer;
begin
  if sTest then exit;
  ProgressBar1.Position:=0;
  ProgressBar1.Max:=editn1.ValueInteger;
  //ReplicarRecord(EditN1.ValueInteger);
  rxDatos.Close;
  rxDatos.EmptyTable;
  rxDatos.Open;

  if (EditN1.ValueInteger = 0) or (EditN1.Text = '')
  then
  begin
    MessageDlg('Favor indicar cantidad de labels.', mtInformation, [mbOK], 0);
    Exit;
  end;

  if RxDBGrid1.SelectedRows.Count > 0 then
  PrepararDatosSeleccion else PrepararDatos;
  pageNo:=0;
  ProgressBar1.Visible:=True;

  if (chkUsarNuevoformato.Checked) then
  begin
    qryInvTunidad.Close;
    qryInvTunidad.Params[0].Value:= rxDatosCodigoProd.Value;
    qryInvTunidad.Open;
    if (not qryInvTunidadDESCTIPOUNIDAD.IsNull or (qryInvTunidadDESCTIPOUNIDAD.Value <> '')) then
    desctuni:=qryInvTunidadDESCTIPOUNIDAD.Value
    else desctuni
    :='UNIDAD';

    frmImpZebraLabel:=TfrmImpZebraLabel.Create(nil);
    try
      frmImpZebraLabel.CargarConfLabel;//Asigna valor a Memo1 y Memo2
    For x:=1 To editn1.ValueInteger Do
    begin
      ProgressBar1.StepIt;
      Inc(pageNo);
      frmImpZebraLabel.EjemploImprimirLabel(edtCia.Text,
              dmCompania.tblCompaniaTelefono.Value,
              rxDatosDescProducto.Value,
              InsertarComa(rxDatosPrecioVenta.AsString), // precioprod:AnsiString;
              rxDatosCodigoProd.AsString,
              cboxImpresoraName.Text,
              desctuni);

      Button1.Caption:='Imp...'+IntToStr(PageNo);
    end;
    Button1.Caption:='Imprimir';
    ProgressBar1.Visible:=False;
    finally
    freeandNil(frmImpZebraLabel);
    end;

    exit;
  end;

  RxDBGrid1.SelectedRows.Clear;
end;

procedure TfrmCodigoBarraNew.EditN2Change(Sender: TObject);
begin
  qryInv.Locate('codigo_texto', editN2.Text,[loCaseInsensitive,loPartialKey])
end;

procedure TfrmCodigoBarraNew.EditN3Change(Sender: TObject);
begin
  qryInv.Locate('Descripcion', editN3.Text,[loCaseInsensitive, loPartialKey]);
end;

procedure TfrmCodigoBarraNew.EditN3Exit(Sender: TObject);
begin
  editN3.Text := qryInvDESCRIPCION.Value;
end;

procedure TfrmCodigoBarraNew.EditN2Exit(Sender: TObject);
begin
  editN2.Text := qryInvCODIGO_TEXTO.Value;
end;

procedure TfrmCodigoBarraNew.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmCodigoBarraNew.PrepararDatos;
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

procedure TfrmCodigoBarraNew.PrepararDatosSeleccion;
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

function TfrmCodigoBarraNew.PrecioLetra(const Precio: String): String;
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


procedure TfrmCodigoBarraNew.cboxImpresoraNameChange(Sender: TObject);
var
  i : Integer;
begin
  i:=Printer.Printers.IndexOf(cboxImpresoraName.Text);
  printer.PrinterIndex:=i;
  //cboxFont.Items := Printer.Fonts;
end;


function TfrmCodigoBarraNew.codigoProv(codProd: Integer): Integer;
begin
  qryProv.Close;
  qryProv.Params[0].Value:= codProd;
  qryProv.Open;
  if Length(qryProvCODIGOPROVEEDOR.AsString) > 0 then
    Result:=qryProvCODIGOPROVEEDOR.Value
  else Result:=-1;
end;

procedure TfrmCodigoBarraNew.BitBtn3Click(Sender: TObject);
begin
  frmImpZebraLabel:=TfrmImpZebraLabel.Create(nil);
  try
    frmImpZebraLabel.CargarConfLabel;//Asigna valor a Memo1 y Memo2
    frmImpZebraLabel.Showmodal;
  finally
  end;
end;

end.
