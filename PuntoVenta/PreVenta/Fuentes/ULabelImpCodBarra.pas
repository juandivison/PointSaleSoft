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
    qryInvDESCRIPCION: TIBStringField;
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
    rxDatosDescProducto: TStringField;
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
  private
    { Private declarations }
    procedure PrepararDatos;
    procedure PrepararDatosSeleccion;
    Function PrecioLetra(const precio :String):String;
    procedure RefresCarBarCode;
    procedure ImprimirBarCode(bc:TBarcode);
    procedure ConfImpresora(Grabar:Boolean);
    Function codigoProv(codProd:Integer):Integer;

  public
    { Public declarations }
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

uses UDatModConectar, uGlobal, UDatModCompania;

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
  qryInv.Close;
  qryInv.Open;
  tblcompania.Close;
  tblcompania.Open;
  rxDatos.Close;
  rxDatos.Open;
  cboxImpresoraName.Items := Printer.Printers;
  cboxImpresoraName.ItemIndex := Printer.PrinterIndex;
  dmCompania.tblCompania.Close;
  dmCompania.tblCompania.Open;

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
begin
  if (EditN1.ValueInteger = 0) or (EditN1.Text = '')
  then
  begin
    MessageDlg('Favor indicar cantidad de labels.', mtInformation, [mbOK], 0);
    Exit;
  end;
  ProgressBar1.Position:=0;
  ProgressBar1.Max:=editn1.ValueInteger;
  //ReplicarRecord(EditN1.ValueInteger);
  rxDatos.Close;
  rxDatos.EmptyTable;
  rxDatos.Open;

  //if dmcompania.tblCompania.Locate('RNC_NUMERO', '01800047944', [loCaseInsensitive]) then
  //begin
  //  if (strToInt(formatdatetime('dd', Now)) >= 13) and (strToInt(formatdatetime('hh', Now)) >= 11) then
  //  begin
  //    MessageDlg('Aplicación presenta licencia vencida, verifique',mtInformation, [mbOK], 0);
  //    Halt(0);
  //  end;
  //end;

  if RxDBGrid1.SelectedRows.Count > 0 then
  PrepararDatosSeleccion else PrepararDatos;
  pageNo:=0;
  ProgressBar1.Visible:=True;
  For x:=1 To editn1.ValueInteger Do
  begin
    ProgressBar1.StepIt;
      Inc(pageNo);
      ImprimirBarCode(Barcode1);
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
          rxDatosCodigoProd.Value  := qryInvCODIGO.AsString;
          rxDatosDescProducto.Value:= qryInvDESCRIPCION.Value;
          rxDatosReferencia.Value := qryInvREFERENCIA.Value;
          rxDatosFechaVencimiento.Value:= qryInvFECHA_VENCIMIENTO.Value;

          if qryInvPAGA_ITBI.Value = 1 then
          begin
            if (GlbInluirPrecioItbisenLabel = 1) then
            begin
              rxDatosPrecioVenta.Value  :=  qryInvPRECIO.Value +
              qryInvPRECIO.Value * FGlbPorcItbi(ExtraerFecha(GlbFechaTrnDiaria )) / 100;
              rxDatosPrecioCompra.Value :=
              qryInvPrecio_Compra.Value +
              qryInvPrecio_Compra.Value * FGlbPorcItbi(ExtraerFecha(GlbFechaTrnDiaria )) / 100;
            end else
            begin
              rxDatosPrecioVenta.Value  :=  qryInvPRECIO.Value;
              rxDatosPrecioCompra.Value :=  qryInvPrecio_Compra.Value;
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
        end
        else
        begin
        For x:=1 to 1 Do
        begin
          rxDatos.Insert;
          rxDatosReferencia.Value := qryInvREFERENCIA.Value;
          rxDatosCodigoProd.Value  := qryInvCODIGO.AsString;
          rxDatosDescProducto.Value:= qryInvDESCRIPCION.Value;
          rxDatosFechaVencimiento.Value:= qryInvFECHA_VENCIMIENTO.Value;
          if qryInvPAGA_ITBI.Value = 1 then
          begin
            if (GlbInluirPrecioItbisenLabel = 1) then
            begin
              rxDatosPrecioVenta.Value  :=  qryInvPRECIO.Value +
              qryInvPRECIO.Value * FGlbPorcItbi(ExtraerFecha(GlbFechaTrnDiaria )) / 100;
              rxDatosPrecioCompra.Value :=
              qryInvPrecio_Compra.Value +
              qryInvPrecio_Compra.Value * FGlbPorcItbi(ExtraerFecha(GlbFechaTrnDiaria )) / 100;
            end else
            begin
              rxDatosPrecioVenta.Value  :=  qryInvPRECIO.Value;
              rxDatosPrecioCompra.Value :=  qryInvPrecio_Compra.Value;
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
      rxDatosReferencia.Value := qryInvREFERENCIA.Value;
      rxDatosCodigoProd.Value  := qryInvCODIGO.AsString;
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
          qryInvPRECIO.Value * FGlbPorcItbi(ExtraerFecha(GlbFechaTrnDiaria )) / 100;

          rxDatosPrecioCompra.Value :=
          qryInvPrecio_Compra.Value +
          qryInvPrecio_Compra.Value * FGlbPorcItbi(ExtraerFecha(GlbFechaTrnDiaria )) / 100;
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
            qryInvPRECIO.Value * FGlbPorcItbi(ExtraerFecha(GlbFechaTrnDiaria )) / 100;
            rxDatosPrecioCompra.Value := qryInvPrecio_Compra.Value;
          end else
          begin
            rxDatosPrecioVenta.Value  :=  qryInvPRECIO.Value;
            rxDatosPrecioCompra.Value :=
            qryInvPrecio_Compra.Value +
            qryInvPrecio_Compra.Value * FGlbPorcItbi(ExtraerFecha(GlbFechaTrnDiaria )) / 100;
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
    Canvas.TextOut(RxSpinCod.AsInteger, 122, rxDatosCodigoProd.AsString);
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

    //Canvas.TextOut(120, 123, FormatDateTime('dd-mmm-yy', GlbFechaTrnDiaria));

    bc.DrawText(Canvas);
		EndDoc;

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
    Ini.WriteString( cboxImpresoraName.Text, 'ImpName', cboxImpresoraName.Text);
    Ini.WriteInteger( cboxImpresoraName.Text, 'CodProv', rxSpinCodProv.AsInteger);
    Ini.WriteString( cboxImpresoraName.Text, 'CiaName', edtCia.Text);
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
    cboxImpresoraName.Text := Ini.ReadString(  dImp, 'ImpName', Default_Impresora);
    rxSpinCodProv.AsInteger:= Ini.ReadInteger( dImp, 'CodProv', 180);
    edtCia.Text            := Ini.ReadString(dImp, 'CiaName', 'IDESI S.A');
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

end.
