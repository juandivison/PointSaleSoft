unit UTestImpFiscal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  ShellApi, Dialogs, DB, Grids, DBGrids, RXDBCtrl, StdCtrls, WinSkinData,
  Buttons;

type
  TfrmTestImpresoraFiscal = class(TForm)
    dsqryDatosVentaMaster: TDataSource;
    dsqryDatosVentaDetalle: TDataSource;
    dsqryDatosCajaImpUser: TDataSource;
    RxDBGrid1: TRxDBGrid;
    RxDBGrid2: TRxDBGrid;
    RxDBGrid3: TRxDBGrid;
    Button1: TButton;
    Button2: TButton;
    btnImprimeRecibo: TButton;
    btnReimprimirdocFiscal: TButton;
    RxDBGrid4: TRxDBGrid;
    dsqryDatosReimpdocFiscalDet: TDataSource;
    Button3: TButton;
    SkinData1: TSkinData;
    BitBtn1: TBitBtn;
    btnreimprimeNotadeCredito: TButton;
    dsqryDetItbisFastFood: TDataSource;
    btnImprDocFactElectronica: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btnImprimeReciboClick(Sender: TObject);
    procedure btnReimprimirdocFiscalClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnreimprimeNotadeCreditoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnImprDocFactElectronicaClick(Sender: TObject);

  private
    { Private declarations }
    procedure procDatosOKI;
    procedure procDatosOKI_DBCR;
    procedure procDatosReimOKI;
    Procedure ProcesaEstadoImpresora(numeroTrnVta:Integer);
    Procedure ProcTicketAImprimir(numstr:integer;fpago:integer);

  public
    { Public declarations }
    EsDevolucion : Boolean;
    LCantCopias : String;
    ncfAfectado : String;
    numStrTicket:integer;
    fpago:integer;
    nombreEmpReimp: string;
  end;

var
  frmTestImpresoraFiscal: TfrmTestImpresoraFiscal;
  montoPrecio : Currency;
  aborta : boolean;
  strReimpNCR : string;
  nombreCteImpFiscal:string[30];
implementation

uses UDatModReportes, UGlobal, UDatModCompania, UDatModCxc, UCoreOCXFiscal,
  UVerDataImpIFiscal, UDatmodDatosGenerales, UProcVentaRapida,
  UDatModUsuarios, FacturaElectronicaUnit, UDatModFactura;

{$R *.dfm}
{
    const GLBFACTCONSUMIDORFINAL =  0; //	Factura a consumidor final
    const GLBFACTCREDITOFISCAL   =  1;  //	Factura con derecho a credito fiscal
    const GLBNOTACREDITOCONSFINAL=  2;  //	Nota de credito a consumidor final
    const GLBNOTACREDITOCONCRFISCAL= 3;  //	Nota de credito con derecho a credito fiscal
    const GLBFACTCONSUMIDORFEXONERITBIS =  4;  //	Factura a consumidor final con exoneracion de ITBIS
    const GLBFACTCONDERECHOFISCALEXONERITBIS=  5;  //	Factura con derecho fiscal con exoneracion de ITBIS

}

procedure TfrmTestImpresoraFiscal.Button1Click(Sender: TObject);
 var
   myFile : TextFile;
   text   : string;
   strValor: String;
   xValor : string[4];
   Count, X : Integer;
   cantLCmt : integer;
   ln_added : boolean;
   contCantPagos, CantPagos :integer;
   trnExiste : Boolean;
begin
  if dmReportes.qryDatosVentaMaster.RecordCount = 0 then
  begin
    Exit;
  end;

  if dmReportes.qryDatosVentaMasterNUMERO.IsNull then Exit;

  if dmReportes.qryDatosVentaMasterTIPO_NCF.IsNull then
  begin
    MessageDlg('Trn No. '+dmReportes.qryDatosVentaMasterNUMERO.AsString + '. Venta no tiene asignado tipo NCF, verifique',mtInformation,[mbok], 0);
    exit;
  end;
  
  numStrTicket:=dmReportes.qryDatosVentaMasterNUMERO.Value;
  fpago:=dmReportes.qryDatosVentaMasterFORMA_PAGO.Value;

  frmProcVentaRapida.ProcInsFiscalCtrl(dmReportes.qryDatosVentaMasterNUMERO.Value,
  dmReportes.qryDatosVentaMasterFECHA.Value, trnExiste);
  if trnExiste then
  begin
    //raise Exception.Create('Trn #'+dmReportes.qryDatosVentaMasterNUMERO.AsSTring+'. Venta existe como procesada, verifque ');
    Exit;
  end;
  cantLCmt:=0;
  contCantPagos:=0;
  CantPagos:=0;

  ln_added:=False;
  if (dmReportes.qryDatosVentaMasterTIPONCFIFISCAL.Value < 0) then
  begin
    raise Exception.Create('Tipo NCF no indicado, verifique.');
    Exit;
  end;

  dmreportes.qryTipoIFiscal.Close;
  dmreportes.qryTipoIFiscal.Params[0].Value:= dmReportes.qryDatosVentaMasterTIPO_NCF.Value;
  dmreportes.qryTipoIFiscal.Params[1].Value:= dmReportes.qryDatosVentaMasterTIPONCFIFISCAL.Value;
  dmreportes.qryTipoIFiscal.Open;
  if (GlbNombreFiletoPrint = '') then
  begin
    raise Exception.Create('Archivo para impresión ticket no ha sido configurado , verifique.');
    Exit;
  end;
   if (GlbModeloImpresora = GLBIFISCALOKI407FP) then
   begin
     procDatosOKI;
     exit;
   end;
   AssignFile(myFile, GlbNombreFiletoPrint);
   ReWrite(myFile);

   //Parametros para abrir Documento Fiscal
   strValor := 'OPEN_CF';
   Write(myFile, trim(strValor)+'|');//TIPO DOC

   strValor := 'EXTENSION';
   Write(myFile, Trim(dmreportes.qryTipoIFiscalTIPO_NCF_IFISCAL.AsString)+'|');

   strValor := '';
   Write(myFile, Trim(strValor)+'|');//Logo

   strValor := '';
   Write(myFile, Trim(strValor)+'|');//Densidad

   strValor := InsertaCeroIzq(4, trim(GlbCodSucursal))+'|';//Sucursal
   Write(myFile, Trim(strValor));

   strValor := InsertaCeroIzq(4,dmReportes.qryDatosCajaImpUserCOD_CAJA.AsString)+'|';//Caja
   Write(myFile, Trim(strValor));

   if (not dmReportes.qryDatosVentaMasterNUMERO_NCF.IsNull) then
   begin
     strValor := dmReportes.qryDatosVentaMasterNUMERO_NCF.Value;

     if (length(strValor) = 11) then
     begin
       strValor:= '00000000'+strValor+'|';
     end else strValor:= strValor+'|';
   end
   else strValor := '|';

   Write(myFile, Trim(strValor));//NCF

   if (dmReportes.qryDatosVentaMasterFORMA_PAGO.Value = 6) then //devolucion
   begin
     if Not dmreportes.qryNCFAfectadoNUMERO_NCF.IsNull then
     begin
       strValor :=  dmreportes.qryNCFAfectadoNUMERO_NCF.Value;

       if (length(strValor) = 11) then
       begin
         strValor:= '00000000'+strValor+'|'
       end else strValor:= strValor+'|';
     end;
   end else
   strValor := '|';

   Write(myFile, Trim(strValor));//NCF Afectado

   if dmReportes.qryDatosVentaMasterCODIGO_CTE.Value = 0 then
   nombreCteImpFiscal:=''
   else
   if (Not dmReportes.qryDatosVentaMasterNOMBRE_CTE.IsNull) then
   nombreCteImpFiscal:= dmReportes.qryDatosVentaMasterNOMBRE_CTE.Value
   else
   if dmReportes.qryDatosVentaMasterNOMBRE_FACTURAR.IsNull then
   nombreCteImpFiscal:= '' else
   nombreCteImpFiscal:= dmReportes.qryDatosVentaMasterNOMBRE_FACTURAR.Value;
   //strValor:= RemoverPuntoYComa(strValor);

   if (UpperCase(nombreCteImpFiscal) = 'GENERICO') then
   strValor:=''
   else
   if ((UpperCase(nombreCteImpFiscal) = 'GENERICO') or (Pos('GENERICO',UpperCase(nombreCteImpFiscal)) > 0)) THEN
   nombreCteImpFiscal:='';

   if (nombreCteImpFiscal = '') and
   (dmReportes.qryDatosVentaMasterNOMBRE_CLIENTE_GENERAL.Value <> '') then
   nombreCteImpFiscal:=dmReportes.qryDatosVentaMasterNOMBRE_CLIENTE_GENERAL.Value;
   
   strValor:=nombreCteImpFiscal;

   if (UpperCase(strValor) = 'GENERICO') then
   strValor:=''
   else
   if ((UpperCase(strValor) = 'GENERICO') or (Pos('GENERICO',UpperCase(strValor)) > 0)) THEN
   strValor:='';

   //dmReportes.qryDatosVentaMasterNOMBRE_COMPLETO.Value;
   Write(myFile, trim(strValor)+'|');//Razon Social
   if (dmReportes.qryDatosVentaMasterRNC.IsNull) or (Length(dmReportes.qryDatosVentaMasterRNC.Value) =0 ) then
   strValor:='' else
   strValor:= StringReplace(dmReportes.qryDatosVentaMasterRNC.Value,'-','',[rfReplaceAll]);//RNC Cliente
   Write(myFile,Trim(strValor)+'|');    //dmReportes.qryDatosVentaMasterNumero.value
   strValor:=LCantCopias;
   WriteLn(myFile,Trim(strValor));

   dmreportes.qryDescLineasDocF.Close;
   dmreportes.qryDescLineasDocF.Params[0].Value:= 1;
   dmreportes.qryDescLineasDocF.Open;
   //Parametros para Item Documento Fiscal
   While Not dmreportes.qryDatosVentaDetalle.Eof Do
   Begin
     if dmreportes.qryDatosVentaDetalleTIPO_VENTA.Value = 3 then
     strValor:= 'RECARGO_ITEM'
     else
     if dmreportes.qryDatosVentaDetalleTIPO_VENTA.Value = 2 then
     strValor:= 'DESCUENTO_ITEM'
     else
     strValor:= 'ITEM_CF';
     Write(myFile, Trim(strValor)+'|');//Item cf

     strValor:= dmreportes.qryDatosVentaDetalleTIPO_VENTA.AsString;//Tipo Venta
     strValor:= RemoverPuntoYComa(strValor); //(  strValor);
     Write(myFile, Trim(strValor)+'|');//Descripcion Item

     if dmreportes.qryDescLineasDocF.Locate('Item',1,[]) then
     strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
     else strValor:= '';
     Write(myFile, Trim(strValor)+'|');//Descripcion Extra #1
     if dmreportes.qryDescLineasDocF.Locate('Item',2,[]) then
     strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
     else strValor:= '';
     Write(myFile, Trim(strValor)+'|');//Descripcion Extra #2
     if dmreportes.qryDescLineasDocF.Locate('Item',3,[]) then
     strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
     else strValor:= '';
     Write(myFile, Trim(strValor)+'|');//Descripcion Extra #3
     if dmreportes.qryDescLineasDocF.Locate('Item',4,[]) then
     strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
     else strValor:= '';
     Write(myFile, Trim(strValor)+'|');//Descripcion Extra #4
     if dmreportes.qryDescLineasDocF.Locate('Item',5,[]) then
     strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
     else strValor:= '';
     Write(myFile, Trim(strValor)+'|');//Descripcion Extra #5
     if dmreportes.qryDescLineasDocF.Locate('Item',6,[]) then
     strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
     else strValor:= '';
     Write(myFile, Trim(strValor)+'|');//Descripcion Extra #6
     if dmreportes.qryDescLineasDocF.Locate('Item',7,[]) then
     strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
     else strValor:= '';
     Write(myFile, Trim(strValor)+'|');//Descripcion Extra #7
     if dmreportes.qryDescLineasDocF.Locate('Item',8,[]) then
     strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
     else strValor:= '';
     Write(myFile, Trim(strValor)+'|');//Descripcion Extra #8

     if dmreportes.qryDescLineasDocF.Locate('Item',9,[]) then
     strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
     else strValor:= '';
     Write(myFile, Trim(strValor)+'|');//Descripcion Extra #9
     //recargoItm := False;
     //if (dmreportes.qryDatosVentaDetalleTIPO_VENTA.Value = 3) then
     //recargoItm := True;

     strValor:= dmreportes.qryDatosVentaDetalleDESCRIPCION.Value;
     //strValor:= RemoverPuntoYComa(strValor); //(  strValor);
     
     Write(myFile, Trim(strValor)+'|');//Descripcion Item

     //strValor:= dmreportes.qryDatosVentaDetalleCANTIDAD.AsString+'000';

     {antes
     if (dmreportes.qryDatosVentaDetalleCANTIDAD.Value - trunc(dmreportes.qryDatosVentaDetalleCANTIDAD.Value)) > 0 then
       begin
         strValor:=
         '00'+ExtraerEnteroString(DecimalSeparator,dmreportes.qryDatosVentaDetalleCANTIDAD.AsString)+
         ExtraerDecimalString(dmreportes.qryDatosVentaDetalleCANTIDAD.AsFloat)+'0'; //entero
       end else
       strValor:=dmreportes.qryDatosVentaDetalleCANTIDAD.AsString+'000';
      }//fin antes

      if (Abs(dmreportes.qryDatosVentaDetalleCANTIDAD.Value) - trunc(dmreportes.qryDatosVentaDetalleCANTIDAD.Value)) > 0 then
       begin
         strValor:= FloatToStr(dmreportes.qryDatosVentaDetalleCANTIDAD.AsFloat * 1000);
       end else
       strValor:=dmreportes.qryDatosVentaDetalleCANTIDAD.AsString+'000';

     Write(myFile, Trim(strValor)+'|');//Descripcion Cantidad

     montoPrecio := GlbCalcularPrecio(dmReportes.qryDatosVentaDetallePRECIO.Value,
     dmreportes.qryDatosVentaDetalleCODIGO_PROD.AsInteger);

     if (ABS(montoPrecio) = 0 ) then
     montoPrecio:= dmReportes.qryDatosVentaDetallePRECIO.Value;

     strValor:= Format('%8.2f', [Abs(montoPrecio)]);
     strValor:= RemoverPuntoYComa(strValor);
     Write(myFile, Trim(strValor)+'|');//Descripcion Precio
     if (dmreportes.qryDatosVentaDetalleITBI_DET.Value > 0) then
     begin
       strValor :=Format('%8.2f', [FGlbPorcItbi(ExtraerFecha(dmReportes.qryDatosVentaMasterFECHA.Value),dmreportes.qryDatosVentaDetalleCODIGO_PROD.AsInteger)]);
       strValor:=RemoverPuntoYComa(strValor);
       xValor:=PadLeftCharacter(4, StrToFloat(strValor),'0');
       strValor:= xvalor;
     end else strValor:='0';

     WriteLn(myFile, strValor);//Descripcion Tasa ITBIS

     //Descuento a nivel de Item
     //*********************************begin descuento a nivel de item***********
     if (dmreportes.qryDatosVentaDetallePORC_DESC_ITEM.Value > 0) then
     begin
       strValor:= 'DESCUENTO_ITEM';
       //strValor:= 'DESC_ITEM_CF';
       Write(myFile, Trim(strValor)+'|');//Item cf

       strValor:= '2';//Tipo Venta
       strValor:= RemoverPuntoYComa(strValor); //(  strValor);
       Write(myFile, Trim(strValor)+'|');//Descripcion Item

       if dmreportes.qryDescLineasDocF.Locate('Item',1,[]) then
          strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
       else strValor:= '';
       Write(myFile, Trim(strValor)+'|');//Descripcion Extra #1
       if dmreportes.qryDescLineasDocF.Locate('Item',2,[]) then
          strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
       else strValor:= '';
       Write(myFile, Trim(strValor)+'|');//Descripcion Extra #2
       if dmreportes.qryDescLineasDocF.Locate('Item',3,[]) then
          strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
       else strValor:= '';
       Write(myFile, Trim(strValor)+'|');//Descripcion Extra #3
       if dmreportes.qryDescLineasDocF.Locate('Item',4,[]) then
          strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
       else strValor:= '';
            Write(myFile, Trim(strValor)+'|');//Descripcion Extra #4
       if dmreportes.qryDescLineasDocF.Locate('Item',5,[]) then
          strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
       else strValor:= '';
       Write(myFile, Trim(strValor)+'|');//Descripcion Extra #5
       if dmreportes.qryDescLineasDocF.Locate('Item',6,[]) then
          strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
       else strValor:= '';
       Write(myFile, Trim(strValor)+'|');//Descripcion Extra #6
       if dmreportes.qryDescLineasDocF.Locate('Item',7,[]) then
          strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
       else strValor:= '';
       Write(myFile, Trim(strValor)+'|');//Descripcion Extra #7
       if dmreportes.qryDescLineasDocF.Locate('Item',8,[]) then
       strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
       else strValor:= '';
       Write(myFile, Trim(strValor)+'|');//Descripcion Extra #8

       if dmreportes.qryDescLineasDocF.Locate('Item',9,[]) then
       strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
       else strValor:= '';
       Write(myFile, Trim(strValor)+'|');//Descripcion Extra #9

       strValor:= dmreportes.qryDatosVentaDetalleDESCRIPCION.Value;
       //strValor:= RemoverPuntoYComa(strValor); //(  strValor);
       Write(myFile, Trim(strValor)+'|');//Descripcion Item

       //La impresora fiscal recibe los decimales: 3.43 = 003430

       { antes
       if (dmreportes.qryDatosVentaDetalleCANTIDAD.Value - trunc(dmreportes.qryDatosVentaDetalleCANTIDAD.Value)) > 0 then
       begin
         strValor:=
         '00'+ExtraerEnteroString(DecimalSeparator,dmreportes.qryDatosVentaDetalleCANTIDAD.AsString)+
         //DecimalSeparator+
         ////dmreportes.qryDatosVentaDetalleCANTIDAD.AsString+'000'
         //else
         ExtraerDecimalString(dmreportes.qryDatosVentaDetalleCANTIDAD.AsFloat)+'0'; //entero
       end else
       strValor:=dmreportes.qryDatosVentaDetalleCANTIDAD.AsString+'000';
       }//fin antes

      if (Abs(dmreportes.qryDatosVentaDetalleCANTIDAD.Value) - trunc(dmreportes.qryDatosVentaDetalleCANTIDAD.Value)) > 0 then
       begin
         strValor:= FloatToStr(dmreportes.qryDatosVentaDetalleCANTIDAD.AsFloat * 1000);
       end else
       strValor:=dmreportes.qryDatosVentaDetalleCANTIDAD.AsString+'000';

       Write(myFile, Trim(strValor)+'|');//Descripcion Cantidad

       montoPrecio := GlbCalcularPrecio(dmReportes.qryDatosVentaDetallePRECIO.Value,
       dmreportes.qryDatosVentaDetalleCODIGO_PROD.AsInteger);

     //if (dmReportes.qryDatosVentaDetalleMONEDA.Value <> '1') then
     //begin
     //  if (dmreportes.qryDatosVentaDetalleMONTO_TASA.Value > 0) then
     //  montoPrecio := dmReportes.qryDatosVentaDetallePRECIO.Value * dmreportes.qryDatosVentaDetalleMONTO_TASA.Value
     //  else
     //  montoPrecio := dmReportes.qryDatosVentaDetallePRECIO.Value * GlbMontoTasa(dmreportes.qryDatosVentaDetalleCODIGO_PROD.Value);
     //end;
     if (ABS(montoPrecio) = 0 ) then
     montoPrecio:= dmReportes.qryDatosVentaDetallePRECIO.Value;

       strValor:= Format('%8.2f', [Abs((montoPrecio) * dmreportes.qryDatosVentaDetallePORC_DESC_ITEM.Value /100)]);

       strValor:= RemoverPuntoYComa(strValor);
       Write(myFile, Trim(strValor)+'|');//Descripcion Precio
       if (dmreportes.qryDatosVentaDetalleITBI_DET.Value > 0) then
       begin
         strValor :=Format('%8.2f', [FGlbPorcItbi(ExtraerFecha(dmReportes.qryDatosVentaMasterFECHA.Value),dmreportes.qryDatosVentaDetalleCODIGO_PROD.AsInteger)]);
         strValor:=RemoverPuntoYComa(strValor);
         xValor:=PadLeftCharacter(4,StrToFloat(strValor),'0');
         strValor:= xvalor;
       end else strValor:='0';

       WriteLn(myFile, strValor);//Descripcion Tasa ITBIS
     end;
     //*********************************end descuento a nivel de item ************
     dmreportes.qryDatosVentaDetalle.Next;
   end;
     
   if (dmReportes.qryDatosVentaMasterMONTO_DESCUENTO.Value > 0) And
      (dmReportes.qryDatosVentaMasterPORC_DESCUENTO.Value > 0) then
   begin

     //WriteLn(myFile, Trim(strValor));//0

     strValor:= 'ITEM_CF'+'|';
     Write(myFile, Trim(strValor));//0

     strValor:= '3';//Descuento por Item
     //strValor:= RemoverPuntoYComa(strValor); //(  strValor);
     Write(myFile, strValor+'|');//1
     Write(myFile, '|');//DESCEXTRA2
     Write(myFile, '|');//DESCEXTRA3
     Write(myFile, '|');//DESCEXTRA4
     Write(myFile, '|');//DESCEXTRA5
     Write(myFile, '|');//DESCEXTRA6
     Write(myFile, '|');//DESCEXTRA7
     Write(myFile, '|');//DESCEXTRA8
     Write(myFile, '|');//DESCEXTRA9
     Write(myFile, '|');//DESCEXTRA10     
     strValor:= 'Monto Descuento';//Descripcion Item
     strValor:= RemoverPuntoYComa(strValor); //(  strValor);
     Write(myFile, Trim(strValor)+'|');//Descripcion Item 11

     strValor:= '1';
     Write(myFile, Trim(strValor)+'|');//Descripcion Cantidad -12

     strValor:= Format('%8.2f', [dmreportes.qryDatosVentaMasterMONTO_DESCUENTO.Value]);
     strValor:= RemoverPuntoYComa(strValor);
     Write(myFile, Trim(strValor)+'|');//Descripcion Precio 13
     //if dmreportes.qryDatosVentaMaster
     //Verificar porciento de itbis
     strValor :=Format('%8.2f', [FGlbPorcItbi(ExtraerFecha(dmReportes.qryDatosVentaMasterFECHA.Value),dmreportes.qryDatosVentaDetalleCODIGO_PROD.AsInteger)]);
     strValor:=RemoverPuntoYComa(strValor);
     WriteLn(myFile, Trim(strValor));//Descripcion Tasa ITBIS -14
   end;
   if (dmReportes.qryDatosVentaMasterMONTO_RECARGO.Value > 0) then
   begin
     //WriteLn(myFile, Trim(strValor));//0

     strValor:= 'ITEM_CF'+'|';
     Write(myFile, Trim(strValor));//0

     strValor:= '3';//Descuento por Item
     //strValor:= RemoverPuntoYComa(strValor); //(  strValor);
     Write(myFile, strValor+'|');//1
     Write(myFile, '|');//DESCEXTRA2
     Write(myFile, '|');//DESCEXTRA3
     Write(myFile, '|');//DESCEXTRA4
     Write(myFile, '|');//DESCEXTRA5
     Write(myFile, '|');//DESCEXTRA6
     Write(myFile, '|');//DESCEXTRA7
     Write(myFile, '|');//DESCEXTRA8
     Write(myFile, '|');//DESCEXTRA9
     Write(myFile, '|');//DESCEXTRA10     
     strValor:= 'Monto Recargo';//Descripcion Item
     //strValor:= RemoverPuntoYComa(strValor); //(  strValor);
     Write(myFile, Trim(strValor)+'|');//Descripcion Item 11

     strValor:= '1';
     Write(myFile, Trim(strValor)+'|');//Descripcion Cantidad -12

     strValor:= Format('%8.2f', [dmreportes.qryDatosVentaMasterMONTO_RECARGO.Value]);
     strValor:= RemoverPuntoYComa(strValor);
     Write(myFile, Trim(strValor)+'|');//Descripcion Precio 13
     //if dmreportes.qryDatosVentaMaster
     //Verificar porciento de itbis
     strValor :=Format('%8.2f', [FGlbPorcItbi(ExtraerFecha(dmReportes.qryDatosVentaMasterFECHA.Value),dmreportes.qryDatosVentaDetalleCODIGO_PROD.AsInteger)]);
     strValor:=RemoverPuntoYComa(strValor);
     WriteLn(myFile, Trim(strValor));//Descripcion Tasa ITBIS -14
   end;

   if (dmReportes.qryDatosVentaMasterPROPINA.Value > 0) AND (GLBEsFastFood) then
   begin
     strValor:= 'PROPINA_CF'+'|';
     Write(myFile, Trim(strValor));//0

     strValor:= Format('%8.2f', [dmreportes.qryDatosVentaMasterPROPINA.Value]);
     strValor:= RemoverPuntoYComa(strValor);
     Write(myFile, Trim(strValor));
   end;

   //Parametros para Pago Documento Fiscal

   dmreportes.qryDescLineasDocF.Close;
   dmreportes.qryDescLineasDocF.Params[0].Value:=2;
   dmreportes.qryDescLineasDocF.Open;

   dmreportes.qryDetallePagos.Close;
   dmreportes.qryDetallePagos.Params[0].Value:=dmReportes.qryDatosVentaMasterNUMERO.Value;
   dmreportes.qryDetallePagos.Open;
   dmreportes.qryDetallePagos.First;
   if dmReportes.qryDatosVentaMasterFORMA_PAGO.Value = 7 then
   begin
       strValor:= 'PAGO_CF';
       Write(myFile,Trim(strValor)+'|');//Tipo
       strValor:= '1';//Efectivo
       if (dmReportes.qryDatosVentaMasterFORMA_PAGO.Value in [7,8,15,16]) then
       strValor:= '7'; //Otros 1
       //strValor:= '7'; //Otros

       Write(myFile,Trim(strValor)+'|');//Tipo
       //strValor:= Format('%8.2f', [dmReportes.qryDatosVentaMasterMONTO_PAGADO.Value]);
       if (dmReportes.qryDatosVentaMasterMONTO_PAGADO.Value = 0) And
       (dmReportes.qryDatosVentaMasterFORMA_PAGO.Value in [7,8]) then //credito normal o directo
       strValor:= Format('%8.2f', [abs(dmReportes.qryDatosVentaMasterVALOR_TOTAL_DET.Value)])
       else                            
       strValor:= Format('%8.2f', [Abs(dmReportes.qryDatosVentaMasterMONTO_PAGADO.Value)]);
       strValor:= Trim(RemoverPuntoYComa(strValor));
       Write(myFile,strValor+'|');//Monto

       strValor := dmReportes.qryDatosVentaMasterNUMERO.AsString;//'NUMEROTRN';
       Write(myFile, trim(strValor)+'|');//NUMERO TRANSACCION

       if dmreportes.qryDescLineasDocF.Locate('Item',1,[]) then
          strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
       else strValor:= '';

       //if (dmReportes.qryDatosVentaMasterFORMA_PAGO.Value in [7,8]) then
       //strValor:='Venta a Crédito';

       Write(myFile,Trim(strValor)+'|');//Descripcion Extra #1
       if dmreportes.qryDescLineasDocF.Locate('Item',2,[]) then
          strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
       else strValor:= '';

       //if (dmReportes.qryDatosVentaMasterFORMA_PAGO.Value in [7,8]) then
       //strValor:='Número Factura: '+dmReportes.qryDatosVentaMasterNUMERO_FACTURA.AsString;

       Write(myFile,Trim(strValor)+'|');//Descripcion Extra #2
       if dmreportes.qryDescLineasDocF.Locate('Item',3,[]) then
          strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
       else strValor:= '';

       //strValor:='Número Trns: '+dmReportes.qryDatosVentaMasterNUMERO.AsString;
       //Para permitir anexar cometnario con un maximo de 40 lineas
       //       WriteLn(myFile,Trim(strValor));//Descripcion Extra #3
       Write(myFile,Trim(strValor));//Descripcion Extra #3   
   end else
   if (dmreportes.qryDetallePagos.RecordCount  = 0) then
   begin
       strValor:= 'PAGO_CF';
       Write(myFile,Trim(strValor)+'|');//Tipo
       strValor:= '1';//Efectivo
       if (dmReportes.qryDatosVentaMasterFORMA_PAGO.Value in [7,8,15,16]) then
       strValor:= '7'; //Otros 1
       //strValor:= '7'; //Otros

       Write(myFile,Trim(strValor)+'|');//Tipo
       //strValor:= Format('%8.2f', [dmReportes.qryDatosVentaMasterMONTO_PAGADO.Value]);
       if (dmReportes.qryDatosVentaMasterMONTO_PAGADO.Value = 0) And
       (dmReportes.qryDatosVentaMasterFORMA_PAGO.Value in [7,8]) then //credito normal o directo
       strValor:= Format('%8.2f', [abs(dmReportes.qryDatosVentaMasterVALOR_TOTAL_DET.Value)])
       else                            
       strValor:= Format('%8.2f', [Abs(dmReportes.qryDatosVentaMasterMONTO_PAGADO.Value)]);
       strValor:= Trim(RemoverPuntoYComa(strValor));
       Write(myFile,strValor+'|');//Monto

       strValor := dmReportes.qryDatosVentaMasterNUMERO.AsString;//'NUMEROTRN';
       Write(myFile, trim(strValor)+'|');//NUMERO TRANSACCION

       if dmreportes.qryDescLineasDocF.Locate('Item',1,[]) then
          strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
       else strValor:= '';

       //if (dmReportes.qryDatosVentaMasterFORMA_PAGO.Value in [7,8]) then
       //strValor:='Venta a Crédito';

       Write(myFile,Trim(strValor)+'|');//Descripcion Extra #1
       if dmreportes.qryDescLineasDocF.Locate('Item',2,[]) then
          strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
       else strValor:= '';

       //if (dmReportes.qryDatosVentaMasterFORMA_PAGO.Value in [7,8]) then
       //strValor:='Número Factura: '+dmReportes.qryDatosVentaMasterNUMERO_FACTURA.AsString;

       Write(myFile,Trim(strValor)+'|');//Descripcion Extra #2
       if dmreportes.qryDescLineasDocF.Locate('Item',3,[]) then
          strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
       else strValor:= '';

       //strValor:='Número Trns: '+dmReportes.qryDatosVentaMasterNUMERO.AsString;
       //Para permitir anexar cometnario con un maximo de 40 lineas
       //       WriteLn(myFile,Trim(strValor));//Descripcion Extra #3
       Write(myFile,Trim(strValor));//Descripcion Extra #3
   end else
   begin
     dmreportes.qryDetallePagos.Last;

     CantPagos := dmreportes.qryDetallePagos.RecordCount;
     contCantPagos:=0;
     dmreportes.qryDetallePagos.First;
     While Not dmreportes.qryDetallePagos.Eof do
     begin
       contCantPagos:=contCantPagos + 1; //dmreportes.qryDetallePagos.Sql.Text
       strValor:= 'PAGO_CF';
       Write(myFile,Trim(strValor)+'|');//Tipo

       strValor:= dmreportes.qryDetallePagosIFISCAL_TPAGO.AsString;
       Write(myFile,Trim(strValor)+'|');//Tipo

       strValor:= Format('%8.2f', [abs(dmreportes.qryDetallePagosMONTO_PAGADO.Value)]);
       strValor:= Trim(RemoverPuntoYComa(strValor));
       Write(myFile,strValor+'|');//Monto

       strValor := dmReportes.qryDatosVentaMasterNUMERO.AsString;//'NUMEROTRN';
       Write(myFile, trim(strValor)+'|');//NUMERO TRANSACCION

       if dmreportes.qryDescLineasDocF.Locate('Item',1,[]) then
          strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
       else strValor:= '';
       Write(myFile,Trim(strValor)+'|');//Descripcion Extra #1
       if dmreportes.qryDescLineasDocF.Locate('Item',2,[]) then
          strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
       else strValor:= '';
       Write(myFile,Trim(strValor)+'|');//Descripcion Extra #2
       if dmreportes.qryDescLineasDocF.Locate('Item',3,[]) then
          strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
       else strValor:= '';
       //Para permitir anexar cometnario con un maximo de 40 lineas

       if (contCantPagos < CantPagos) then
       WriteLn(myFile,Trim(strValor)) //Descripcion Extra #3
       else
       Write(myFile,Trim(strValor));//Descripcion Extra #3
       dmreportes.qryDetallePagos.Next;
     end;
   end;

   //T strValor := dmReportes.qryDatosVentaMasterNUMERO.AsString;//'NUMEROTRN';
   //T Write(myFile,Trim(strValor)+'|');  //Desc Trailer #3
   
   //Parametros para Pago Documento Fiscal
   dmreportes.qryDescLineasDocF.Close;
   dmreportes.qryDescLineasDocF.Params[0].Value:=4;
   dmreportes.qryDescLineasDocF.Open;
   dmreportes.qryDescLineasDocF.Last;
   X := 1;
   Count := dmreportes.qryDescLineasDocF.RecordCount;
   dmreportes.qryDescLineasDocF.First;

   if (dmreportes.qryDescLineasDocF.RecordCount = 0) then
   begin
     WriteLN(myFile,'');
   end else
   Write(myFile,'|');
   
   //Se aceptan hasta 40 lineas
   dmreportes.qryLComentario.Close;
   dmreportes.qryLComentario.Params[0].Value := dmreportes.qryDatosVentaMasterNUMERO.Value;
   dmreportes.qryLComentario.Params[1].Value := 1;
   dmreportes.qryLComentario.Open;

   if (dmreportes.qryDescLineasDocF.RecordCount > 0) and (
      dmreportes.qryDescLineasDocF.RecordCount <= 40) then
   begin
     //strValor:= 'COMENTARIOCIERRE';
     //Write(myFile,Trim(strValor)+'|');//CLOSE
     strValor:='';//inicio comentario
     //Write(myFile,strValor+'|');
     While Not dmreportes.qryDescLineasDocF.Eof Do
     begin
       if (dmreportes.qryDescLineasDocFSTATUS.Value = 'I') then
       begin
         X := X + 1;
         dmreportes.qryDescLineasDocF.Next;
         continue;
       end;
       if  x < count then
       begin
         if not dmreportes.qryDescLineasDocFDESCRIPCION.IsNull then
         strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
         else strValor:= '';

         if dmreportes.qryLComentario.Locate('NUMLIN',x,[]) then
         strValor:=dmreportes.qryLComentarioLINEA.Value;

         Write(myFile,Trim(strValor)+'|');//Descripcion Cola Reemplazo #x
         Inc(cantLCmt);
       end;

       if X = Count then
       begin
         if Not dmreportes.qryDescLineasDocFDESCRIPCION.IsNull then
         strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
         else strValor := '';
         if dmreportes.qryLComentario.Locate('NUMLIN',x,[]) then
         strValor:=dmreportes.qryLComentarioLINEA.Value;

         Write(myFile,Trim(strValor));
         Inc(cantLCmt);
         WriteLn(myFile, '|'+IntToStr(cantLCmt));
         ln_added:=True;
       end;
       X := X + 1;
       dmreportes.qryDescLineasDocF.Next;
     end;
   end;
   //WriteLn(myFile, '|'+IntToStr(cantLCmt));
   if not ln_added then
   WriteLn(myFile,'');//CLOSE
          
   //Parametros para Pago Documento Fiscal
   dmreportes.qryDescLineasDocF.Close;
   dmreportes.qryDescLineasDocF.Params[0].Value:=3;
   dmreportes.qryDescLineasDocF.Open;
    
   strValor:= 'CLOSE_CF';
   Write(myFile,Trim(strValor)+'|');//CLOSE
   strValor:='';

   if dmreportes.qryDescLineasDocF.Locate('Item',1,[]) then
     strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
     else strValor:= '';
     Write(myFile,Trim(strValor)+'|');//Descripcion Cola Reemplazo #1

     strValor:= '';
     Write(myFile,Trim(strValor)+'|');//Desc trailer #1
     if dmreportes.qryDescLineasDocF.Locate('Item',2,[]) then
     strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
     else strValor:= '';
     Write(myFile,Trim(strValor)+'|');//Desc Cola #2
     strValor:= '';
     Write(myFile,Trim(strValor)+'|');//Desc Trailer #2

     if dmreportes.qryDescLineasDocF.Locate('Item',3,[]) then
     strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
     else strValor:= '';
     if (strValor = '') then
     strValor:='Usr: ' +VarNombreUsuario;
     Write(myFile,Trim(strValor)+'|');//Desc Cola #3
     
     strValor:= '';
     Write(myFile,Trim(strValor)+'|');  //Desc Trailer #3

     strValor := dmReportes.qryDatosVentaMasterNUMERO.AsString;//'NUMEROTRN';
     WriteLn(myFile, Trim(strValor));//NUMERO TRANSACCION

     CloseFile(myFile);
   //Reset(myFile);

   //While Not Eof(myFile) Do
   //begin
   //  ReadLn(myFile, text);
   //  ShowMessage(text);
   //end;
   //CloseFile(myFile);
   //WinExec('COMMAND.COM C\ DIR',SW_SHOWNORMAL);
end;

procedure TfrmTestImpresoraFiscal.Button2Click(Sender: TObject);
var
  sei: TShellExecuteInfo;
  archivo : String;
begin
  //inherited;
  ZeroMemory(@sei, sizeof(sei));
  With sei do
  begin
    cbSize := SizeOf(sei);
    fMask := SEE_MASK_INVOKEIDLIST;
    Wnd := handle;
    lpVerb := 'open';
    archivo:='C:\Proyectos\IFiscal\VB\IdesiEpsonFiscaltool\IdesiEpsonFiscaltool\bin\Release\if.bat - Shortcut';
    //archivo:=GlbExeIFiscal;
    lpFile := PChar(archivo);
    lpDirectory := PChar('C:\');
    nShow := SW_HIDE;
  end;
  ShellExecuteEX(@sei);
end;

function ExeAndWait(ExeNameAndParams: string; ncmdShow: Integer = SW_SHOWNORMAL): Integer;
var
    StartupInfo: TStartupInfo;
    ProcessInformation: TProcessInformation;
    Res: Bool;
    lpExitCode: DWORD;
begin
    with StartupInfo do //you can play with this structure
    begin
        cb := SizeOf(TStartupInfo);
        lpReserved := nil;
        lpDesktop := nil;
        lpTitle := nil;
        dwFlags := STARTF_USESHOWWINDOW;
        wShowWindow := ncmdShow;
        cbReserved2 := 0;
        lpReserved2 := nil;
    end;
    Res := CreateProcess(nil, PChar(ExeNameAndParams), nil, nil, True,
        CREATE_DEFAULT_ERROR_MODE
        or NORMAL_PRIORITY_CLASS, nil, nil, StartupInfo, ProcessInformation);
    while True do
    begin
        GetExitCodeProcess(ProcessInformation.hProcess, lpExitCode);
        if lpExitCode <> STILL_ACTIVE then
            Break;
        Application.ProcessMessages;
    end;
    Result := Integer(lpExitCode);
end;

procedure TfrmTestImpresoraFiscal.btnImprimeReciboClick(Sender: TObject);
var
  archivo : String;
  parameters : String;
  strPLey : string;
  ExecuteResult: integer;
  Path: string;
begin
  if aborta then exit;
  //Temoral jrd

  if Not (FileExists(GlbNombreFiletoPrint)) then
  begin
    MessageDlg(Format('Archivo %s a imprimir no existe, verifique', [GlbNombreFiletoPrint]), mtError,[mbok],0);
    Exit;
  end;
  if (Abs(dmReportes.qryDatosVentaMasterPROPINALEGAL.Value) = 0) then
     strPLey :='N'
  else
  strPLey :='Y';

  if (GlbModeloImpresora = GLBIFISCALOKI407FP) then
  begin
    archivo:='C:\Proyectos\PointSaleSoftFiscal\PuntoVenta\Bin\epsSpoolerVmax.exe'; // if.bat - Shortcut';
    ShellExecute(0, 'Open', PChar(archivo), PChar(''), PChar(''),SW_Hide);
    Exit;
  end else
  if (GlbModeloImpresora = GLBIFISCALEPSONTMT881V) then
  begin
    archivo:=GlbExeIFiscal;
    GLBEsImp:=True;
    Path := IncludeTrailingPathDelimiter(ExtractFilePath(archivo));

    parameters:=Format('/PortComm=%s /Baudrate=%s /TipoDoc=DVF /ReporteZ=xPOR_DIA_IMP /Status=ifOnlineN /Cancelar=false /ImprimeZ=0 /CierreX=False /CierreZ=False /Cierre=XX /ImpCierreX=0 /ConfFile=DatosConfIFiscal.dat /FileToPrint=%s /FastFood=%s  /pagaPropinaLey=%s',
    [IntToStr(GlbPuerto),IntToStr(GlbBaudRate),GlbNombreFiletoPrint,GLBEsFastFoodString,strPLey]);
    {
    if MessageDlg('Salir para debug reimpresion desde VB', mtInformation,[mbYes, mbNo],0) = mrYes then
     begin
      Exit;
    end;  }
     //prueba

     //if (GlbEsDebugFiscal = 1) then
     //if MessageDlg('Msg temporal: Continua con impresion doc fiscal?', mtWarning,[mbyes, mbno],0) = mrno then
     //exit;
     
     try
       ProcTicketAImprimir(numStrTicket,fpago);
       if dmReportes.tblTicket_params.State in [dsEdit, dsInsert] then
       begin
         dmReportes.tblTicket_paramsPARAMETROS.Value:= Parameters;
         dmReportes.tblTicket_paramsSTATUS.Value    := 'A';
         dmReportes.tblTicket_paramsORIGEN.Value:='ORIGINAL';
         dmReportes.tblTicket_paramsarchivo.Value:=archivo;
         GlbSalvarQuery(dmReportes.tblTicket_params);
       end;
     except on E : Exception do
     begin
       ShowMessage('Error: '+e.Message);
       LogInformacionTxt('Error guardando ticket_params tabla:'+e.Message);
     end;
    end;
    if (GlbEsDebugFiscal = 1) then
    begin
      LogInformacionTxt('dmReportes.qryTicket_paramsarchivo.Value:'+dmReportes.qryTicket_paramsarchivo.Value);
      LogInformacionTxt('dmReportes.qryTicket_paramsPARAMETROS.Value: '+dmReportes.qryTicket_paramsPARAMETROS.Value);
    end;

    //t ShellExecute(0, 'Open', PChar(archivo), PChar(parameters), PChar(''), SW_Hide);

    ExecuteResult := ShellExecute(0, nil, PChar(Path +ExtractFileName(archivo)), PChar(parameters), nil, SW_HIDE);
    if ExecuteResult <= 32 then
    begin
      WriteToLog('Error: ' + IntToStr(ExecuteResult));
      ShowMessage('Error: ' + IntToStr(ExecuteResult));
    end ;
    Sleep(3000);
  end;
end;

procedure TfrmTestImpresoraFiscal.Button3Click(Sender: TObject);
var
  archivo : String;
  parameters : String;
  strPLey : string;
  ExecuteResult: integer;
  Path: string;
begin
  if aborta then exit;
   //if (GlbEsDebugFiscal = 1) then
   //if MessageDlg('Continua con reimpresion doc fiscal?',mtWarning,[mbyes, mbno],0) = mrno then exit;
   //if MessageDlg('Salir para debug reimpresion desde VB', mtInformation,[mbYes, mbNo],0) = mrYes then
   //begin
   //  Exit;
   //end;
   if (GlbModeloImpresora = GLBIFISCALOKI407FP) then
   begin
     archivo:= 'C:\Proyectos\PointSaleSoftFiscal\PuntoVenta\Bin\epsSpoolerVmax.exe'; // if.bat - Shortcut';
     ShellExecute(0, 'Open', PChar(archivo), PChar(''), PChar(''), SW_Hide);
     Exit;
   end;

   if (GlbNombreFiletoPrint = '') then
   begin
     MessageDlg('Archivo salida sin nombre, verifique.', mtInformation,[mbYes, mbNo],0);
     Exit;
   end;

   archivo:=GlbExeIFiscal;
   //falta crear campo de propinalegal en cotizacion
   if (Abs(dmReportes.qryDatosVentaMasterPROPINALEGAL.Value) = 0) then
   strPLey :='N'
   else
   strPLey :='Y';

   if (dmReportes.qryDatosVentaMasterFORMA_PAGO.Value  = 6) then //Devolucion -NCR
   strReimpNCR:='1'
   else
   strReimpNCR:='0';
   GLBEsImp:=True;
   Path := IncludeTrailingPathDelimiter(ExtractFilePath(archivo));
   parameters:= Format(' /PortComm=%s /Baudrate=%s /TipoDoc=DSVF /Status=ifOnlineN /CierreZ=False,89 /ImprimeZ=1 /CierreX=False /Cierre=XX /ImpCierreX=0 /Cancelar=False /ConfFile=DatosConfIFiscal.dat /Encabezado0="%s" /FileToPrint=%s /FastFood=%s /pagaPropinaLey=%s /ReimpNCR=%s',
   [IntToStr(GlbPuerto),IntToStr(GlbBaudRate),GlbEncabezadoIFiscal,GlbNombreFiletoPrint,GLBEsFastFoodString,strPLey,strReimpNCR]);

   if (GlbEsDebugFiscal = 1) then
   if MessageDlg('Msg temporal: Continua con impresion doc fiscal?', mtWarning,[mbyes, mbno],0) = mrno then
   exit;

   ProcTicketAImprimir(numStrTicket,fpago);
   if dmReportes.tblTicket_params.State in [dsEdit, dsInsert] then
   Begin
     dmReportes.tblTicket_paramsPARAMETROS.Value:= Parameters;
     dmReportes.tblTicket_paramsSTATUS.Value    := 'A';
     dmReportes.tblTicket_paramsORIGEN.Value    := 'COPIA';
     dmReportes.tblTicket_paramsarchivo.Value   := archivo;
     GlbSalvarQuery(dmReportes.tblTicket_params);
   end;
   //ShellExecute(0, 'Open', PChar(archivo), PChar(parameters), PChar(''), SW_Hide);
   ExecuteResult := ShellExecute(0, nil, PChar(Path +ExtractFileName(archivo)), PChar(parameters), nil, SW_HIDE);
   if ExecuteResult <= 32 then
   begin
     WriteToLog('Error: ' + IntToStr(ExecuteResult));
     ShowMessage('Error: ' + IntToStr(ExecuteResult));
   end ;
   Sleep(2000);
end;

//Imprime documento fiscal en formato libre
//usado para reimprimir
procedure TfrmTestImpresoraFiscal.btnReimprimirdocFiscalClick(Sender: TObject);
var
   myFile : TextFile;
   text   : string;
   strValor: String;
   cnt,tipoD : Integer;
   SubMontoItbis : Currency;
   xPorcItbis : Currency;
   montoDestItem : Currency;
   x, count, cantLCmt : integer;
   ln_added : boolean;
   xItbiDet: Currency;
begin
  xItbiDet:=0;
  ln_added := False;
  dmDatos.qryMembrete.Close;
  dmDatos.qryMembrete.Params[0].Value:= glbCia_Key;
  dmDatos.qryMembrete.Open;
  SubMontoItbis:=0;
  montoDestItem :=0;
  numStrTicket:=dmReportes.qryDatosVentaMasterNUMERO.Value;
  fpago:=dmReportes.qryDatosVentaMasterFORMA_PAGO.Value;

  if (GlbNombreFiletoPrint = '') then
  begin
    raise Exception.Create('Archivo para impresión ticket no ha sido configurado , verifique.');
    Exit;
  end;
   if (GlbModeloImpresora = GLBIFISCALOKI407FP) then
   begin
     procDatosReimOKI;
     Exit;
   end;

   dmUsuarios.qryUsuarios.Close;
   dmUsuarios.qryUsuarios.Open;
   nombreEmpReimp:='';
   if dmUsuarios.qryUsuarios.Locate('CODIGO_EMPLEADO',dmReportes.qryDatosVentaMasterCOD_USR_CAJA.Value,[]) then
   begin
     nombreEmpReimp:=dmUsuarios.qryUsuariosNOMBRECOMPLETO.Value;
   end;

   AssignFile(myFile, GlbNombreFiletoPrint);
   ReWrite(myFile);

   dmReportes.qryDatosReimpDocFiscal.First;
   //Parametros para abrir Documento Fiscal

   Write(myFile, 'Encabezado0'+'|');//Encabezado
   //WriteLn(myFile, Trim(RemoverPuntoYComa(GlbEncabezadoIFiscal)));
   WriteLn(myFile, Trim(GlbEncabezadoIFiscal));

   Write(myFile, 'Encabezado1'+'|');
   if not dmDatos.qryMembreteLINEA1.IsNull then
   WriteLn(myFile, dmDatos.qryMembreteLINEA1.Value)
   else
   WriteLn(myFile, '');

   Write(myFile, 'Encabezado2'+'|');
   if not dmDatos.qryMembreteLINEA2.IsNull then
   Write(myFile, dmDatos.qryMembreteLINEA2.Value)
   else
   WriteLn(myFile, '');

   if not dmDatos.qryMembreteLINEA3.IsNull then
   WriteLn(myFile, dmDatos.qryMembreteLINEA3.Value)
   else
   WriteLn(myFile, '');

   strValor := 'CIA';
   Write(myFile, trim(strValor)+'|');//CIA
   strValor := dmCompania.tblCompaniaNOMBRE.Value;
   Write(myFile, trim(strValor)+'|');

   strValor := dmCompania.tblCompaniaRNC_NUMERO.Value;
   Write(myFile, Trim(strValor)+'|');

   strValor := 'COMPROBANTE AUTORIZADO POR DGII';
   Write(myFile, Trim(strValor)+'|');

   strValor :=FormatDateTime('dd/mm/yyyy', dmReportes.qryDatosReimpDocFiscalFECHA.Value);
   Write(myFile, Trim(strValor));
   if dmReportes.qryDatosReimpDocFiscalFECHAHORA.IsNull then
   strValor :=' ' + FormatDateTime('HH:MM:SS', time)+'|'
   else
   strValor :=' ' + FormatDateTime('HH:MM:SS', dmReportes.qryDatosReimpDocFiscalFECHAHORA.Value)+'|';
   Write(myFile, strValor);

   //dmReportes.qryDatosReimpDocFiscalFORMA_PAGO.Value

   strValor := dmReportes.qryDatosReimpDocFiscalNIF.Value;
   Write(myFile, Trim(strValor)+'|');//NIF

   if (Not dmreportes.qryNCFAfectadoNUMERO_NCF.IsNull) then
   begin
     strValor := dmreportes.qryNCFAfectadoNUMERO_NCF.Value;
     if (length(strValor) = 11) then
     begin
       strValor:= '00000000'+strValor;
     end;
   end
   else strValor := '';
   WriteLN(myFile, Trim(strValor));//NCF AFECTADO

   //Fin cia
   strValor := 'OPEN_CF';
   Write(myFile, Trim(strValor)+'|');//TIPO DOC

   strValor := 'EXTENSION';
   tipoD := dmReportes.qryDatosVentaMasterTIPONCFIFISCAL.Value;// -1;
   if (tipoD < 0) then
   tipoD := 0;
   //dmreportes.qryDatosReimpDocFiscalTIPO.Value - 1;

   Write(myFile, Trim(intToStr(tipoD))+'|');

   strValor := '';
   Write(myFile, Trim(strValor)+'|');//Logo

   strValor := '';
   Write(myFile, Trim(strValor)+'|');//Densidad

   strValor := InsertaCeroIzq(4, trim(GlbCodSucursal))+'|';//Sucursal
   Write(myFile, Trim(strValor));

   strValor := InsertaCeroIzq(4, dmReportes.qryDatosCajaImpUserCOD_CAJA.AsString)+'|';//Caja
   Write(myFile, Trim(strValor));

   if (not dmReportes.qryDatosReimpDocFiscalNUMERO_NCF.IsNull) then
   begin
     strValor := dmReportes.qryDatosReimpDocFiscalNUMERO_NCF.Value;
     if (length(strValor) = 11) then
     begin
       strValor:= '00000000'+strValor+'|';
     end else strValor:= strValor+'|';
   end else strValor := '|';


   Write(myFile, Trim(strValor));//NCF

   if (dmReportes.qryDatosVentaMasterFORMA_PAGO.Value = 6) then //'devolucion
   begin
     if Not dmreportes.qryNCFAfectadoNUMERO_NCF.IsNull then
     begin
       strValor :=  dmreportes.qryNCFAfectadoNUMERO_NCF.Value;

       if (length(strValor) = 11) then
       begin
         strValor:= '00000000'+strValor+'|';
       end else strValor:= strValor+'|';
     end;
   end else
   strValor := '|';
                                        
   Write(myFile, Trim(strValor));//NCF Afectado
   //dmReportes.qryDatosReimpDocFiscaln
   if (Not dmReportes.qryDatosReimpDocFiscalNombrecliente.IsNull) then
   strValor:= dmReportes.qryDatosReimpDocFiscalNombrecliente.Value;
   //else
   if dmReportes.qryDatosReimpDocFiscalNombrecliente.IsNull then
   strValor:= '' else 
   //else //no debe imprimir nada si es generico
   //strValor:= 'Cliente Generico' else

   strValor:= dmReportes.qryDatosReimpDocFiscalNombrecliente.Value;

   if (dmReportes.qryDatosReimpDocFiscalCODIGO_CTE.Value = 0) Or
   (dmReportes.qryDatosReimpDocFiscalCODIGO_CTE.IsNull) then
   strValor:='';

   if (trim(strValor)= '') and
   (dmReportes.qryDatosReimpDocFiscalNOMBRE_CLIENTE_GENERAL.Value <> '') then
   strValor:=dmReportes.qryDatosReimpDocFiscalNOMBRE_CLIENTE_GENERAL.Value;

   if (strValor = '') and (not dmReportes.qryDatosReimpDocFiscalNOMBRE_CTE.IsNull) then
   strValor:=dmReportes.qryDatosReimpDocFiscalNOMBRE_CTE.Value;

   if (UpperCase(strValor) = 'GENERICO') then
   strValor:=''
   else
   if ((UpperCase(strValor) = 'GENERICO') or (Pos('GENERICO',UpperCase(strValor)) > 0)) THEN
   strValor:= '';

   //strValor:= RemoverPuntoYComa(strValor);

   //dmReportes.qryDatosVentaMasterNOMBRE_COMPLETO.Value;
   Write(myFile, trim(strValor)+'|');//Razon Social

   if (dmReportes.qryDatosReimpDocFiscalRNC.IsNull) or (Length(dmReportes.qryDatosReimpDocFiscalRNC.Value) =0 ) then
   strValor:='';
   if Length(dmReportes.qryDatosReimpDocFiscalRNC.Value) > 0  then
   strValor:= StringReplace(dmReportes.qryDatosReimpDocFiscalRNC.Value,'-','',[rfReplaceAll]) //RNC Cliente
   else
   if not dmReportes.qryDatosReimpDocFiscalRNC_NUMERO.IsNull then
   strValor:=dmReportes.qryDatosReimpDocFiscalRNC_NUMERO.Value;

   if (Pos('GENERICO',UpperCase(dmReportes.qryDatosReimpDocFiscalNOMBRE_CTE.Value)) > 0) then
   strValor:='';

   strValor:= StringReplace(strValor,'-','',[rfReplaceAll]); //RNC Cliente

   Write(myFile,Trim(strValor));
   //Copias
   WriteLn(myFile,'|1');

   dmreportes.qryDescLineasDocF.Close;
   dmreportes.qryDescLineasDocF.Params[0].Value:= 1;
   dmreportes.qryDescLineasDocF.Open;

   if (dmreportes.qryDatosReimpdocFiscalDet.Params[0].Value = 0) then
   begin
     dmreportes.qryDatosReimpdocFiscalDet.Close;
     dmreportes.qryDatosReimpdocFiscalDet.Params[0].Value:= dmreportes.qryDatosReimpDocFiscalNUMERO.Value;
     dmreportes.qryDatosReimpdocFiscalDet.Open;
   end;
   //Parametros para Item Documento Fiscal
   dmreportes.qryDatosReimpdocFiscalDet.Last;
   aborta:=False;
   if (dmreportes.qryDatosReimpdocFiscalDet.RecordCount > 100) then
   begin
     MessageDlg('Se permite un total de 100 lineas en doc no fiscal, verifique',mterror,[mbok],0);
     aborta:=true;
     exit;
   end;
   dmreportes.qryDatosReimpdocFiscalDet.First;
   SubMontoItbis:=0;
   While Not dmreportes.qryDatosReimpdocFiscalDet.Eof Do
   Begin
     //TT if dmreportes.qryDatosReimpdocFiscalDetITBIS_FISCAL_DET.Value > 0 then
     //TT SubMontoItbis:=SubMontoItbis + dmreportes.qryDatosReimpdocFiscalDetITBIS_FISCAL_DET.Value
     //TT else
     //TT SubMontoItbis:=SubMontoItbis + dmreportes.qryDatosReimpdocFiscalDetITBI_DET.Value;

     if (dmReportes.qryDatosReimpdocFiscalDetTIPO_VENTA.Value = 2) then
     SubMontoItbis:=SubMontoItbis - dmreportes.qryDatosReimpdocFiscalDetITBI_DET.Value;

     if (dmReportes.qryDatosReimpdocFiscalDetTIPO_VENTA.Value = 3) then //RECARGO
     strValor:= 'RECARGO_ITEM'
     else
     strValor:= 'ITEM_CF';
     Write(myFile, Trim(strValor)+'|');//Descripcion Extra #1
     strValor:='0';
     if Not dmReportes.qryDatosReimpdocFiscalDetTIPO_VENTA.IsNull then
     strValor:=dmReportes.qryDatosReimpdocFiscalDetTIPO_VENTA.AsString;
     Write(myFile, Trim(strValor)+'|');//Tipo Venta

     strValor:= '';
     if dmreportes.qryDescLineasDocF.Locate('Item',1,[]) then
     strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
     else strValor:= '';
     //vuelve aqui

     Write(myFile, Trim(strValor)+'|');//Descripcion Extra #1
     if dmreportes.qryDescLineasDocF.Locate('Item',2,[]) then
     strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
     else strValor:= '';
     Write(myFile, Trim(strValor)+'|');//Descripcion Extra #2
     if dmreportes.qryDescLineasDocF.Locate('Item',3,[]) then
     strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
     else strValor:= '';
     Write(myFile, Trim(strValor)+'|');//Descripcion Extra #3
     if dmreportes.qryDescLineasDocF.Locate('Item',4,[]) then
     strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
     else strValor:= '';
     Write(myFile, Trim(strValor)+'|');//Descripcion Extra #4
     if dmreportes.qryDescLineasDocF.Locate('Item',5,[]) then
     strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
     else strValor:= '';
     Write(myFile, Trim(strValor)+'|');//Descripcion Extra #5
     if dmreportes.qryDescLineasDocF.Locate('Item',6,[]) then
     strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
     else strValor:= '';
     Write(myFile, Trim(strValor)+'|');//Descripcion Extra #6
     if dmreportes.qryDescLineasDocF.Locate('Item',7,[]) then
     strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
     else strValor:= '';
     Write(myFile, Trim(strValor)+'|');//Descripcion Extra #7
     if dmreportes.qryDescLineasDocF.Locate('Item',8,[]) then
     strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
     else strValor:= '';
     Write(myFile, Trim(strValor)+'|');//Descripcion Extra #8
     strValor:='';
     if dmreportes.qryDescLineasDocF.Locate('Item',9,[]) then
     strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
     else strValor:= '';
     Write(myFile, Trim(strValor)+'|');//Descripcion Extra #9
          
     {Write(myFile, Trim(strValor)+'|');//Descripcion Extra #2
     Write(myFile, Trim(strValor)+'|');//Descripcion Extra #3
     Write(myFile, Trim(strValor)+'|');//Descripcion Extra #4
     Write(myFile, Trim(strValor)+'|');//Descripcion Extra #5
     Write(myFile, Trim(strValor)+'|');//Descripcion Extra #6
     Write(myFile, Trim(strValor)+'|');//Descripcion Extra #7
     Write(myFile, Trim(strValor)+'|');//Descripcion Extra #8
     Write(myFile, Trim(strValor)+'|');//Descripcion Extra #9}
     //Verificar aqui valores precio y monto
     strValor:= dmreportes.qryDatosReimpdocFiscalDetDESCRIPCION.Value;
     strValor:= RemoverPuntoYComa(strValor); //(  strValor);
     Write(myFile, Trim(strValor)+'|');//Descripcion Item

     //anterior strValor:= dmreportes.qryDatosReimpdocFiscalDetCANTIDAD.AsString+'000';

     if (Abs(dmreportes.qryDatosReimpdocFiscalDetCANTIDAD.Value) - trunc(Abs(dmreportes.qryDatosReimpdocFiscalDetCANTIDAD.Value))) > 0 then
       begin
         strValor:= FloatToStr(Abs(dmreportes.qryDatosReimpdocFiscalDetCANTIDAD.AsFloat) * 1000);
       end else
       strValor:=dmreportes.qryDatosReimpdocFiscalDetCANTIDAD.AsString+'000';

     strValor:= StringReplace(strValor,'-','',[]);
     strValor:= StringReplace(strValor,'.','',[]);
     Write(myFile, Trim(strValor)+'|');//Descripcion Cantidad

     montoPrecio := GlbCalcularPrecio(dmreportes.qryDatosReimpdocFiscalDetPRECIO.Value,
     dmreportes.qryDatosVentaDetalleCODIGO_PROD.AsInteger);
     if (ABS(montoPrecio) =0 ) then
     montoPrecio := dmreportes.qryDatosReimpdocFiscalDetPRECIO.Value;

     if (dmreportes.qryDatosReimpdocFiscalDetCANTIDAD.Value > 1) then
     strValor:= Format('%8.2f', [1 *
                                 montoPrecio])
     else
     strValor:= Format('%8.2f', [montoPrecio]);

     strValor:= StringReplace(strValor,'-','',[]);
     strValor:= RemoverPuntoYComa(strValor);//dmreportes.qryDatosReimpdocFiscalDet.sql.text
     Write(myFile, Trim(strValor)+'|');//Descripcion Precio
     GlbSimboloTasaITBIS := '';
     if (Abs(dmreportes.qryDatosReimpdocFiscalDetITBI_DET.Value) > 0) or
        (Abs(dmreportes.qryDatosReimpdocFiscalDetITBIS_FISCAL_DET.Value) > 0) then
     begin
       //t dmreportes.qryDatosReimpdocFiscalDetCANTIDAD.Value * dmreportes.qryDatosReimpdocFiscalDetPRECIO.Value
       xPorcItbis := FGlbPorcItbi(ExtraerFecha(dmReportes.qryDatosReimpDocFiscalFECHA.Value),dmreportes.qryDatosReimpdocFiscalDetCODIGO_PROD.AsInteger);

       if (xPorcItbis > 0) then
       begin
         xItbiDet := ((dmreportes.qryDatosReimpdocFiscalDetCANTIDAD.Value *
                   montoPrecio) *
                   (xPorcItbis / (1 + xPorcItbis/100))) / 100;
         strValor := Format('%8.2f', [xItbiDet]);

       end else
       strValor := '0';
       if (xPorcItbis > 0) then
       SubMontoItbis := SubMontoItbis + ((dmreportes.qryDatosReimpdocFiscalDetCANTIDAD.Value *
                   montoPrecio) *
                   (xPorcItbis / (1 + xPorcItbis/100))) / 100;
       //t if (dmreportes.qryDatosReimpdocFiscalDetITBIS_FISCAL_DET.Value > 0) then
       //t strValor := Format('%8.2f', [dmreportes.qryDatosReimpdocFiscalDetITBIS_FISCAL_DET.Value])
       //t else
       //t strValor := Format('%8.2f', [dmreportes.qryDatosReimpdocFiscalDetITBI_DET.Value]);

       strValor := RemoverPuntoYComa(strValor);
       Write(myFile, Trim(strValor)+'|');
       strValor :=Format('%8.2f', [FGlbPorcItbi(ExtraerFecha(dmReportes.qryDatosReimpDocFiscalFECHA.Value),dmreportes.qryDatosReimpdocFiscalDetCODIGO_PROD.AsInteger)]);
       strValor:=RemoverPuntoYComa(strValor);
     end else
     begin
       strValor := Format('%8.2f', [0.00]);
       strValor:= RemoverPuntoYComa(strValor);
       Write(myFile, Trim(strValor)+'|');
       strValor:='0';
     end;
     Write(myFile, Trim(strValor)+'|');//Descripcion Tasa ITBIS
     if (GlbSimboloTasaITBIS <> '') then
     WriteLn(myFile, Trim(GlbSimboloTasaITBIS))
     else
     WriteLn(myFile, 'E');

     //**********************begin descuento a nivel de item
     if (Abs(dmreportes.qryDatosReimpdocFiscalDetPORC_DESC_ITEM.Value) > 0) then
     begin
       strValor:= 'DESCUENTO_ITEM';
       Write(myFile, Trim(strValor)+'|');//Descripcion Extra #1
       strValor:='0';
       //if Not dmReportes.qryDatosReimpdocFiscalDetTIPO_VENTA.IsNull then
       strValor:='2';//dmReportes.qryDatosReimpdocFiscalDetTIPO_VENTA.AsString;
       Write(myFile, Trim(strValor)+'|');//Tipo Venta

       strValor:= '';
       if dmreportes.qryDescLineasDocF.Locate('Item',1,[]) then
          strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
       else strValor:= '';
       Write(myFile, Trim(strValor)+'|');//Descripcion Extra #1
       if dmreportes.qryDescLineasDocF.Locate('Item',2,[]) then
          strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
       else strValor:= '';
       Write(myFile, Trim(strValor)+'|');//Descripcion Extra #2
       if dmreportes.qryDescLineasDocF.Locate('Item',3,[]) then
          strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
       else strValor:= '';
        Write(myFile, Trim(strValor)+'|');//Descripcion Extra #3
        if dmreportes.qryDescLineasDocF.Locate('Item',4,[]) then
        strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
        else strValor:= '';
        Write(myFile, Trim(strValor)+'|');//Descripcion Extra #4
        if dmreportes.qryDescLineasDocF.Locate('Item',5,[]) then
           strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
        else strValor:= '';
        Write(myFile, Trim(strValor)+'|');//Descripcion Extra #5
        if dmreportes.qryDescLineasDocF.Locate('Item',6,[]) then
        strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
        else strValor:= '';
        Write(myFile, Trim(strValor)+'|');//Descripcion Extra #6
        if dmreportes.qryDescLineasDocF.Locate('Item',7,[]) then
        strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
        else strValor:= '';
        Write(myFile, Trim(strValor)+'|');//Descripcion Extra #7
        if dmreportes.qryDescLineasDocF.Locate('Item',8,[]) then
        strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
        else strValor:= '';
        Write(myFile, Trim(strValor)+'|');//Descripcion Extra #8
        strValor:='';
        if dmreportes.qryDescLineasDocF.Locate('Item',9,[]) then
        strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
        else strValor:= '';
        Write(myFile, Trim(strValor)+'|');//Descripcion Extra #9

        strValor:= dmreportes.qryDatosReimpdocFiscalDetDESCRIPCION.Value;
        strValor:= RemoverPuntoYComa(strValor); //(  strValor);
        Write(myFile, Trim(strValor)+'|');//Descripcion Item

        //strValor:= dmreportes.qryDatosReimpdocFiscalDetCANTIDAD.AsString+'000';

       if (Abs(dmreportes.qryDatosReimpdocFiscalDetCANTIDAD.Value) - trunc(Abs(dmreportes.qryDatosReimpdocFiscalDetCANTIDAD.Value))) > 0 then
       begin
         strValor:= FloatToStr(dmreportes.qryDatosReimpdocFiscalDetCANTIDAD.AsFloat * 1000);
       end else
       strValor:=dmreportes.qryDatosReimpdocFiscalDetCANTIDAD.AsString+'000';

        strValor:= StringReplace(strValor,'-','',[]);
        strValor:= StringReplace(strValor,'.','',[]);//dmreportes.qryDatosReimpdocFiscalDet.sql.text
        Write(myFile, Trim(strValor)+'|');//Descripcion Cantidad
        montoDestItem:=montoDestItem + dmreportes.qryDatosReimpdocFiscalDetMONTO_DESC_ITEM.Value/dmreportes.qryDatosReimpdocFiscalDetCANTIDAD.Value;
        strValor:= Format('%8.2f', [dmreportes.qryDatosReimpdocFiscalDetMONTO_DESC_ITEM.Value/dmreportes.qryDatosReimpdocFiscalDetCANTIDAD.Value]);
        strValor:= StringReplace(strValor,'-','',[]);
        strValor:= RemoverPuntoYComa(strValor);
        Write(myFile, Trim(strValor)+'|');//Descripcion Precio
        GlbSimboloTasaITBIS := '';

       xPorcItbis := FGlbPorcItbi(ExtraerFecha(dmReportes.qryDatosReimpDocFiscalFECHA.Value),dmreportes.qryDatosReimpdocFiscalDetCODIGO_PROD.AsInteger);

       if (xPorcItbis > 0) then
       strValor := Format('%8.2f', [(dmreportes.qryDatosReimpdocFiscalDetMONTO_DESC_ITEM.Value * (xPorcItbis/(1+xPorcItbis/100))/100)])
       else
       strValor := '0';
       strValor := RemoverPuntoYComa(strValor);
       Write(myFile, Trim(strValor)+'|');
       strValor :=Format('%8.2f', [FGlbPorcItbi(ExtraerFecha(dmReportes.qryDatosReimpDocFiscalFECHA.Value),dmreportes.qryDatosReimpdocFiscalDetCODIGO_PROD.AsInteger)]);
       strValor:=RemoverPuntoYComa(strValor);

     Write(myFile, Trim(strValor)+'|');//Descripcion Tasa ITBIS
     if (GlbSimboloTasaITBIS <> '') then
     WriteLn(myFile, Trim(GlbSimboloTasaITBIS))
     else
     WriteLn(myFile, 'E');
     end;
     //**********************end descuento a nivel de item
     dmreportes.qryDatosReimpdocFiscalDet.Next;
   end;

   strValor:= 'SUBTOTAL_CF';
   Write(myFile, Trim(strValor)+'|');

   if (SubMontoItbis <> dmReportes.qryDatosReimpDocFiscalMONTO_TOTAL_ITBIS.Value) then
   if (dmReportes.qryDatosReimpDocFiscalPORC_DESCUENTO.Value = 0) then
   if (dmReportes.qryDatosReimpDocFiscalMONTO_RECARGO.Value = 0) then
   SubMontoItbis :=dmreportes.qryDatosReimpDocFiscalMONTO_ITBIS.Value;
   //antes dmReportes.qryDatosReimpDocFiscalMONTO_TOTAL_ITBIS.Value;

   if (dmreportes.qryDatosReimpDocFiscalSUB_TOTALITBIS.Value > 0) then
   if (dmReportes.qryDatosReimpDocFiscalMONTO_DESCUENTO.Value = 0)
   And (dmReportes.qryDatosReimpDocFiscalPORC_DESCUENTO.Value = 0) then //descuento global
   SubMontoItbis := dmreportes.qryDatosReimpDocFiscalSUB_TOTALITBIS.Value;

   strValor:= Format('%8.2f', [SubMontoItbis]);
   strValor:= StringReplace(strValor,'-','',[]);
   strValor:= RemoverPuntoYComa(strValor);
   Write(myFile, Trim(strValor)+'|');

   if (dmReportes.qryDatosReimpDocFiscalMONTO_DESCUENTO.Value > 0)
   And (dmReportes.qryDatosReimpDocFiscalPORC_DESCUENTO.Value = 0) then //descuento global
   strValor:= Format('%8.2f', [dmreportes.qryDatosReimpDocFiscalTOTAL_BRUTO.Value])
   else
   strValor:= Format('%8.2f', [dmreportes.qryDatosReimpDocFiscalMONTO_BRUTO.Value]);

   if (dmReportes.qryDatosReimpDocFiscalMONTO_DESCUENTO.Value > 0) and
      (dmReportes.qryDatosReimpDocFiscalPORC_DESCUENTO.Value = 0)  then //descuento a nivel de item
   strValor:= Format('%8.2f', [dmreportes.qryDatosReimpDocFiscalMONTO_BRUTO.Value]);

   //strValor:= Format('%8.2f', [dmreportes.qryDatosReimpDocFiscalMONTO_BRUTO.Value - montoDestItem]);
    //- dmreportes.qryDatosReimpDocFiscalMONTO_DESCUENTO.Value]);
   strValor:= RemoverPuntoYComa(strValor);
   WriteLN(myFile, Trim(strValor));

   if (dmReportes.qryDatosReimpDocFiscalMONTO_DESCUENTO.Value > 0)
   And (dmReportes.qryDatosReimpDocFiscalPORC_DESCUENTO.Value > 0) then
   begin
     strValor:= 'DESCUENTO_CF'+'|';
     Write(myFile, Trim(strValor));//Descripcion Extra #1

     strValor:= '3';//Descuento por Item
     strValor:= RemoverPuntoYComa(strValor); //(  strValor);
     Write(myFile, Trim(strValor)+'|');//Descripcion Item

     strValor:= 'Descuento normal';
     strValor:= RemoverPuntoYComa(strValor); //(  strValor);
     Write(myFile, Trim(strValor)+'|');//Descripcion Item

     strValor:= '';
     Write(myFile, Trim(strValor)+'|');//Descripcion Cantidad
     strValor:= Format('%8.2f', [dmreportes.qryDatosReimpDocFiscalMONTO_TOTAL_ITBIS.Value]);
     strValor:= RemoverPuntoYComa(strValor); //(  strValor);
     Write(myFile, Trim(strValor)+'|');//Monto bruto itbis

     strValor:= Format('%8.2f', [dmreportes.qryDatosReimpDocFiscalMONTO_DESCUENTO.Value]);
     strValor:= RemoverPuntoYComa(strValor);
     Write(myFile, Trim(strValor)+'|');//Descripcion Precio

     if (dmreportes.qryDatosReimpdocFiscalDetITBI_DET.Value = 0) then
     WriteLn(myFile, '0')
     else
     begin
       strValor :=Format('%8.2f', [FGlbPorcItbi(ExtraerFecha(dmReportes.qryDatosReimpDocFiscalFECHA.Value),dmreportes.qryDatosReimpdocFiscalDetCODIGO_PROD.AsInteger)]);
       strValor:=RemoverPuntoYComa(strValor);
       WriteLn(myFile, Trim(strValor));//Descripcion Tasa ITBIS
     end;
   end;
   if (Abs(dmReportes.qryDatosReimpDocFiscalMONTO_RECARGO.Value) > 0) then
   begin

     strValor:= 'RECARGO_CF'+'|';
     Write(myFile, Trim(strValor));//0

     strValor:= '3';
     strValor:= RemoverPuntoYComa(strValor); //(  strValor);
     Write(myFile, Trim(strValor)+'|');//Descripcion Item

     strValor:= 'Monto Recargo';
     strValor:= RemoverPuntoYComa(strValor); //(  strValor);
     Write(myFile, Trim(strValor)+'|');//Descripcion Item

     strValor:= '';
     Write(myFile, Trim(strValor)+'|');//Descripcion Cantidad
     strValor:= Format('%8.2f', [0.0]);
     strValor:= RemoverPuntoYComa(strValor); //(  strValor);
     Write(myFile, Trim(strValor)+'|');//Monto bruto itbis

     strValor:= Format('%8.2f', [dmreportes.qryDatosReimpDocFiscalMONTO_RECARGO.Value]);
     strValor:= StringReplace(strValor,'-','',[]);
     strValor:= RemoverPuntoYComa(strValor);
     Write(myFile, Trim(strValor)+'|');//Descripcion Precio

     strValor :='0';
     WriteLn(myFile, Trim(strValor));
   end;

   dmReportes.qryDetItbisFastFood.Close;
   dmReportes.qryDetItbisFastFood.Params[0].Value:= dmreportes.qryDatosReimpDocFiscalNUMERO.Value;
   dmReportes.qryDetItbisFastFood.Open;
   dmReportes.qryDetItbisFastFood.First;

   cnt:=0;
   While Not dmReportes.qryDetItbisFastFood.Eof Do
   begin
     strValor:= 'ITBISDET_CF'+IntToStr(cnt)+'|';
     Write(myFile, Trim(strValor));//0

     strValor:= Format('%d', [dmreportes.qryDetItbisFastFoodPORC_ITBIS.AsInteger]);
     strValor:= RemoverPuntoYComa(strValor);
     Write(myFile, Trim(strValor)+'%|');
     if (Abs(dmreportes.qryDetItbisFastFoodMONTO_ITBISFOOD.Value) > 0) then
     strValor:= Format('%8.2f', [dmreportes.qryDetItbisFastFoodMONTO_ITBISFOOD.Value])
     else
     strValor:= Format('%8.2f', [dmreportes.qryDetItbisFastFoodMONTO_ITBIS.Value]);     
     strValor:= RemoverPuntoYComa(strValor);
     WriteLn(myFile, Trim(strValor));
     inc(cnt);
     dmReportes.qryDetItbisFastFood.Next;
   end;
   if (dmReportes.qryDatosReimpDocFiscalPROPINA.Value > 0) AND (GLBEsFastFood) then
   begin
     strValor:= 'PROPINA_CF'+'|';
     Write(myFile, Trim(strValor));//0

     strValor:= Format('%8.2f', [dmreportes.qryDatosReimpDocFiscalPROPINA.Value]);
     strValor:= RemoverPuntoYComa(strValor);
     Write(myFile, Trim(strValor));
   end;

   strValor:= 'TOTAL_CF';
   Write(myFile, Trim(strValor)+'|');//dmreportes.qryDatosReimpDocFiscal.sql.text;
   strValor:= Format('%8.2f', [dmreportes.qryDatosReimpDocFiscalMONTO_ITBIS.Value]);
   strValor:= RemoverPuntoYComa(strValor);
   //1
   Write(myFile, Trim(strValor)+'|');

   //strValor:= 'PROPINALEGAL';
   //Write(myFile, Trim(strValor)+'|');
   //2
   if (Not dmReportes.qryDatosVentaMasterPROPINALEGAL.IsNull) then
   begin
     strValor:= Format('%8.2f', [dmReportes.qryDatosVentaMasterPROPINALEGAL.Value]);

     strValor:= RemoverPuntoYComa(strValor);
     Write(myFile, Trim(strValor),'|');
   end else
   begin
     strValor:= Format('%8.2f', [0.00]);

     strValor:= RemoverPuntoYComa(strValor);
     Write(myFile, Trim(strValor),'|');
   end;
   //TOTAL
   //3
   if (dmreportes.qryDatosReimpDocFiscalMONTO_EXONERADO_ITBIS.Value = 0)
   AND (dmreportes.qryDatosReimpDocFiscalMONTO_RECARGO.Value = 0)
   AND (dmReportes.qryDatosReimpDocFiscalMONTO_DESCUENTO.Value = 0) then
    strValor:= Format('%8.2f', [dmreportes.qryDatosReimpDocFiscalTOTAL_BRUTO.Value])
   else
   if (Abs(dmreportes.qryDatosReimpDocFiscalMONTO_EXONERADO_ITBIS.Value) > 0)
   OR (Abs(dmreportes.qryDatosReimpDocFiscalMONTO_RECARGO.Value) > 0)
   OR (Abs(dmReportes.qryDatosReimpDocFiscalMONTO_DESCUENTO.Value) > 0) then
   begin
     //t if (not GLBEsFastFood) then
     strValor:= Format('%8.2f', [dmreportes.qryDatosReimpDocFiscalTOTAL_BRUTO.Value])
     //t else
     //t strValor:= Format('%8.2f', [dmreportes.qryDatosReimpDocFiscalTOTAL_NETO.Value])
   end
   else
   strValor:= Format('%8.2f', [dmreportes.qryDatosReimpDocFiscalTOTAL_BRUTO.Value]);

   strValor:= RemoverPuntoYComa(strValor);
   WriteLN(myFile, Trim(strValor));

   if (Abs(dmreportes.qryDatosReimpDocFiscalMONTO_EXONERADO_ITBIS.Value) > 0) then
   begin
     strValor:= 'EXONERAITBIS_CF';
     Write(myFile, Trim(strValor)+'|');

     strValor:= Format('%8.2f', [Abs(dmreportes.qryDatosReimpDocFiscalMONTO_EXONERADO_ITBIS.Value)]);
     strValor:= RemoverPuntoYComa(strValor);
     WriteLn(myFile, Trim(strValor));

     strValor:= 'TOTALNETO_CF';
     Write(myFile, Trim(strValor)+'|');
     if (GLBEsFastFood) And (Abs(dmreportes.qryDatosReimpDocFiscalMONTO_EXONERADO_ITBIS.Value) > 0) then
     strValor:= Format('%8.2f', [Abs(dmreportes.qryDatosReimpDocFiscalTOTAL_BRUTO.Value) - Abs(dmreportes.qryDatosReimpDocFiscalMONTO_EXONERADO_ITBIS.Value)])
     else 
     if (GLBEsFastFood) then
     strValor:= Format('%8.2f', [Abs(dmreportes.qryDatosReimpDocFiscalTOTAL_NETO.Value)-abs(dmreportes.qryDatosReimpDocFiscalMONTO_EXONERADO_ITBIS.Value)])
     else
     strValor:= Format('%8.2f', [Abs(dmreportes.qryDatosReimpDocFiscalTOTAL_NETO.Value)]);
     strValor:= RemoverPuntoYComa(strValor);
     WriteLN(myFile, Trim(strValor));

   end;
   dmreportes.qryDescLineasDocF.Close;
   dmreportes.qryDescLineasDocF.Params[0].Value:= 2;
   dmreportes.qryDescLineasDocF.Open;
        
   //Parametros para Pago Documento Fiscal
   dmreportes.qryDetallePagos.Close;
   dmreportes.qryDetallePagos.Params[0].Value:=dmReportes.qryDatosVentaMasterNUMERO.Value;
   dmreportes.qryDetallePagos.Open;
   dmreportes.qryDetallePagos.First;

   if (dmReportes.qryDatosVentaMasterFORMA_PAGO.Value = 7) then
   begin
       strValor:= 'PAGO_CF';
       Write(myFile,Trim(strValor)+'|');//Tipo
       strValor:= '1';//Efectivo
       if (dmReportes.qryDatosVentaMasterFORMA_PAGO.Value in [7,8,15,16]) then
       strValor:= '7'; //Otros 1
       Write(myFile,Trim(strValor)+'|');//Tipo
         
       //strValor:= Format('%8.2f', [dmReportes.qryDatosVentaMasterMONTO_PAGADO.Value]);
       if (dmReportes.qryDatosVentaMasterMONTO_PAGADO.Value = 0) And
       (dmReportes.qryDatosVentaMasterFORMA_PAGO.Value in [7,8,15,16]) then //credito normal o directo
       strValor:= Format('%8.2f', [dmReportes.qryDatosVentaMasterVALOR_TOTAL_DET.Value])
       else
       strValor:= Format('%8.2f', [dmReportes.qryDatosVentaMasterMONTO_PAGADO.Value]);
       strValor:= Trim(RemoverPuntoYComa(strValor));
       Write(myFile,strValor+'|');//Monto

       strValor := dmReportes.qryDatosVentaMasterNUMERO.AsString;//'NUMEROTRN';
       Write(myFile, trim(strValor)+'|');//NUMERO TRANSACCION

       if dmreportes.qryDescLineasDocF.Locate('Item',1,[]) then
          strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
       else strValor:= '';
       Write(myFile,Trim(strValor)+'|');//Descripcion Extra #1
       if dmreportes.qryDescLineasDocF.Locate('Item',2,[]) then
          strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
       else strValor:= '';
       Write(myFile,Trim(strValor)+'|');//Descripcion Extra #2
       if dmreportes.qryDescLineasDocF.Locate('Item',3,[]) then
          strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
       else strValor:= '';
       WriteLn(myFile,Trim(strValor));//Descripcion Extra #3
   end else
   if (dmreportes.qryDetallePagos.RecordCount  = 0) then
   begin
       strValor:= 'PAGO_CF';
       Write(myFile,Trim(strValor)+'|');//Tipo
       strValor:= '1';//Efectivo
       if (dmReportes.qryDatosVentaMasterFORMA_PAGO.Value in [7,8,15,16]) then
       strValor:= '7'; //Otros 1
       Write(myFile,Trim(strValor)+'|');//Tipo
         
       //strValor:= Format('%8.2f', [dmReportes.qryDatosVentaMasterMONTO_PAGADO.Value]);
       if (dmReportes.qryDatosVentaMasterMONTO_PAGADO.Value = 0) And
       (dmReportes.qryDatosVentaMasterFORMA_PAGO.Value in [7,8,15,16]) then //credito normal o directo
       strValor:= Format('%8.2f', [dmReportes.qryDatosVentaMasterVALOR_TOTAL_DET.Value])
       else
       strValor:= Format('%8.2f', [dmReportes.qryDatosVentaMasterMONTO_PAGADO.Value]);
       strValor:= Trim(RemoverPuntoYComa(strValor));
       Write(myFile,strValor+'|');//Monto

       strValor := dmReportes.qryDatosVentaMasterNUMERO.AsString;//'NUMEROTRN';
       Write(myFile, trim(strValor)+'|');//NUMERO TRANSACCION

       if dmreportes.qryDescLineasDocF.Locate('Item',1,[]) then
          strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
       else strValor:= '';
       Write(myFile,Trim(strValor)+'|');//Descripcion Extra #1
       if dmreportes.qryDescLineasDocF.Locate('Item',2,[]) then
          strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
       else strValor:= '';
       Write(myFile,Trim(strValor)+'|');//Descripcion Extra #2
       if dmreportes.qryDescLineasDocF.Locate('Item',3,[]) then
          strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
       else strValor:= '';
       WriteLn(myFile,Trim(strValor));//Descripcion Extra #3
   end else
   begin
     While Not dmreportes.qryDetallePagos.Eof do
     begin
       strValor:= 'PAGO_CF';
       Write(myFile,Trim(strValor)+'|');//Tipo
       
       strValor:= dmreportes.qryDetallePagosIFISCAL_TPAGO.AsString;
       Write(myFile,Trim(strValor)+'|');//Tipo
       //strValor:= Format('%8.2f', [dmReportes.qryDatosVentaMasterMONTO_PAGADO.Value]);
       strValor:= Format('%8.2f', [dmreportes.qryDetallePagosMONTO_PAGADO.Value]);
       strValor:= Trim(RemoverPuntoYComa(strValor));
       Write(myFile,strValor+'|');//Monto

       strValor := dmReportes.qryDatosVentaMasterNUMERO.AsString;//'NUMEROTRN';
       Write(myFile, trim(strValor)+'|');//NUMERO TRANSACCION

       if dmreportes.qryDescLineasDocF.Locate('Item',1,[]) then
          strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
       else strValor:= '';
       Write(myFile,Trim(strValor)+'|');//Descripcion Extra #1
       if dmreportes.qryDescLineasDocF.Locate('Item',2,[]) then
          strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
       else strValor:= '';
       Write(myFile,Trim(strValor)+'|');//Descripcion Extra #2
       if dmreportes.qryDescLineasDocF.Locate('Item',3,[]) then
          strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
       else strValor:= '';
       WriteLn(myFile,Trim(strValor));//Descripcion Extra #3
       ln_added:=True;
       dmreportes.qryDetallePagos.Next;
     end;
   end;

   if Not ln_added then
   WriteLn(myFile,'');

   dmreportes.qryDescLineasDocF.Close;
   dmreportes.qryDescLineasDocF.Params[0].Value:=3;
   dmreportes.qryDescLineasDocF.Open;

   //Parametros para Pago Documento Fiscal
   strValor:= 'CLOSE_CF';
   Write(myFile,Trim(strValor)+'|');//CLOSE
   strValor:='';

   if dmreportes.qryDescLineasDocF.Locate('Item',1,[]) then
   strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
   else strValor:= '';
   Write(myFile,Trim(strValor)+'|');//Descripcion Cola Reemplazo #1
   strValor:= '';
   Write(myFile,Trim(strValor)+'|');//Desc trailer #1
   if dmreportes.qryDescLineasDocF.Locate('Item',2,[]) then
   strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
   else strValor:= '';
   Write(myFile,Trim(strValor)+'|');//Desc Cola #2
   strValor:= '';
   Write(myFile,Trim(strValor)+'|');//Desc Trailer #2
   if dmreportes.qryDescLineasDocF.Locate('Item',3,[]) then
   strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
   else strValor:= '';
   if (strValor = '') then
   begin
     if (nombreEmpReimp = '') then
     strValor:='Usr: ' +VarNombreUsuario
     else
     strValor:='Usr: ' +nombreEmpReimp;
   end;
   Write(myFile,Trim(strValor)+'|');//Desc Cola #3

   strValor:= '';

   if (dmReportes.qryDatosVentaMasterFORMA_PAGO.Value = 6) then
   strValor:='Devolución';
   Write(myFile,Trim(strValor)+'|');//Desc Trailer #3
      
   strValor:= dmReportes.qryDatosReimpDocFiscalNIF.Value;
   Write(myFile, trim(strValor)+'|');//NIF
   strValor:= Format('%8.2f', [dmReportes.qryDatosReimpDocFiscalTOTAL_BRUTO.Value]);
   Write(myFile, trim(strValor)+'|');//TOTAL_BRUTO

   strValor:= Format('%8.2f', [dmReportes.qryDatosReimpDocFiscalMONTO_ITBIS.Value]);
   Write(myFile, trim(strValor)+'|');//MONTO_ITBIS

   strValor:= Format('%8.2f', [dmReportes.qryDatosReimpDocFiscalTOTAL_NETO.Value]);
   Write(myFile, trim(strValor)+'|');//TOTAL_NETO

   strValor:= Format('%8.2f', [dmReportes.qryDatosReimpDocFiscalMONTO_PAGADO.Value]);
   Write(myFile, trim(strValor)+'|');//Monto_Pagado

   strValor:= Format('%8.2f', [dmReportes.qryDatosReimpDocFiscalMONTO_CAMBIO.Value]);
   Write(myFile, trim(strValor));//Monto_Pagado 

   dmreportes.qryDescLineasDocF.Close;
   dmreportes.qryDescLineasDocF.Params[0].Value:=4;
   dmreportes.qryDescLineasDocF.Open;
   dmreportes.qryDescLineasDocF.Last;

   //Se aceptan hasta 40 lineas
   dmreportes.qryLComentario.Close;
   dmreportes.qryLComentario.Params[0].Value := dmreportes.qryDatosVentaMasterNUMERO.Value;
   dmreportes.qryLComentario.Open;

   X := 1;
   Count := dmreportes.qryDescLineasDocF.RecordCount;
   dmreportes.qryDescLineasDocF.First;

   if (dmreportes.qryDescLineasDocF.RecordCount = 0) then
   begin
     WriteLn(myFile,'');
   end else
   Write(myFile,'|');
   
   //Se aceptan hasta 40 lineas
   if (dmreportes.qryDescLineasDocF.RecordCount > 0) and (
      dmreportes.qryDescLineasDocF.RecordCount <= 40) then
   begin
     //strValor:= 'COMENTARIOCIERRE';
     //Write(myFile,Trim(strValor)+'|');//CLOSE
     strValor:='';
     While Not dmreportes.qryDescLineasDocF.Eof Do
     begin
       if (dmreportes.qryDescLineasDocFSTATUS.Value = 'I') then
       begin
         X := X + 1;
         dmreportes.qryDescLineasDocF.Next;
         continue;
       end;
       if  x < count then
       begin
         if not dmreportes.qryDescLineasDocFDESCRIPCION.IsNull then
         strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
         else strValor:= '';

         if dmreportes.qryLComentario.Locate('NUMLIN',x,[]) then
         strValor:=dmreportes.qryLComentarioLINEA.Value;

         Write(myFile,Trim(strValor)+'|');//Descripcion Cola Reemplazo #x
         Inc(cantLCmt);
       end;

       if X = Count then
       begin
         if Not dmreportes.qryDescLineasDocFDESCRIPCION.IsNull then
         strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
         else strValor := '';

         if dmreportes.qryLComentario.Locate('NUMLIN',x,[]) then
         strValor:=dmreportes.qryLComentarioLINEA.Value;

         Write(myFile,Trim(strValor));
         Inc(cantLCmt);
         WriteLn(myFile, '|'+IntToStr(cantLCmt));
       end;
       X := X + 1;
       dmreportes.qryDescLineasDocF.Next;
     end;
   end;
   //WriteLn(myFile, ')');
   CloseFile(myFile);
end;
//Nota de Credito - Devolución
procedure TfrmTestImpresoraFiscal.BitBtn1Click(Sender: TObject);
var
   myFile : TextFile;
   text   : string;
   strValor: String;
   cant : Extended;
   xValor : String[4];
   montoDestItem : CURRENCY;
   X, Count : Integer;
   contCantPagos, CantPagos :integer;
   trnExiste : boolean;
begin
  montoDestItem :=0;
  contCantPagos:=0;
  CantPagos:=0;  
  //T frmInfoParaTicketFiscal.Showmodal;
  if dmreportes.qryDatosVentaDetalle.RecordCount = 0 then
  begin
    MessageDlg('Error, qryDatosVentaDetalle no tiene record, verifique',mtInformation,[mbok],0);
    exit;
  end;
  if (dmReportes.qryDatosVentaMaster.params[0].Value = 0) then
  begin
    dmReportes.qryDatosVentaMaster.Close;
    dmReportes.qryDatosVentaMaster.params[0].Value := dmreportes.qryDatosVentaDetallenumero.Value;
    dmReportes.qryDatosVentaMaster.Open;
  end;
  numStrTicket:=dmReportes.qryDatosVentaMasterNUMERO.Value;
  fpago:=dmReportes.qryDatosVentaMasterFORMA_PAGO.Value;

  frmProcVentaRapida.ProcInsFiscalCtrl(dmReportes.qryDatosVentaMasterNUMERO.Value,
  dmReportes.qryDatosVentaMasterFECHA.Value,
  trnExiste);
  if trnExiste then
  begin
    //raise Exception.Create('Trn #'+dmReportes.qryDatosVentaMasterNUMERO.AsSTring+'. Venta existe como procesada, verifque ');
    Exit;
  end;

  dmreportes.qryTipoIFiscal.Close;
  dmreportes.qryTipoIFiscal.Params[0].Value:= dmReportes.qryDatosVentaMasterTIPO_NCF.Value;
  dmreportes.qryTipoIFiscal.Params[1].Value:= dmReportes.qryDatosVentaMasterTIPONCFIFISCAL.Value;
  dmreportes.qryTipoIFiscal.Open;

  if (GlbNombreFiletoPrint = '') then
  begin
    raise Exception.Create('Archivo para impresión NCR no ha sido configurado, verifique.');
    Exit;
  end;
  
   if (GlbModeloImpresora = GLBIFISCALOKI407FP) then
   begin
     procDatosOKI_DBCR;
     Exit;
   end;
   AssignFile(myFile, GlbNombreFiletoPrint);
   ReWrite(myFile);

   //Parametros para abrir Documento Fiscal
   strValor := 'OPEN_CF';
   Write(myFile, trim(strValor)+'|');//TIPO DOC

   strValor := 'EXTENSION';
   //Write(myFile, Trim(dmreportes.qryTipoIFiscalTIPO_NCF_IFISCAL.AsString)+'|');
   //IF (dmreportes.qryDatosVentaMasterTIPO_NCF.Value = '14') then
   Write(myFile, Trim(dmReportes.qryDatosVentaMasterTIPONCFIFISCAL.AsString)+'|');

   strValor := '';
   Write(myFile, Trim(strValor)+'|');//Logo

   strValor := '';
   Write(myFile, Trim(strValor)+'|');//Densidad

   strValor := InsertaCeroIzq(4, trim(GlbCodSucursal))+'|';//Sucursal
   Write(myFile, Trim(strValor));

   strValor := InsertaCeroIzq(4,dmReportes.qryDatosCajaImpUserCOD_CAJA.AsString)+'|';//Caja
   Write(myFile, Trim(strValor));

   if (Not dmReportes.qryDatosVentaMasterNUMERO_NCF.IsNull) then
   begin
     strValor := dmReportes.qryDatosVentaMasterNUMERO_NCF.Value;

     if (length(strValor) = 11) then
     begin
       strValor:= '00000000'+strValor+'|';
     end else strValor:= strValor+'|';

   end
   else strValor := '|';

   Write(myFile, Trim(strValor));//NCF

   strValor := '';
   //dmreportes.qryNCFAfectadoNUMERO_NCF.Value;
   //ncfAfectado:= dmfacturas.qryGetNcfAsignadoNUMERO_NCF_AFECTADO.Value;
   //if (Not dmReportes.qryDatosRepTranscxcIFiscalNUMERO_NCF.IsNull) then
   if (ncfAfectado <> '') then
   begin  //dmreportes.qryNCFAfectado.params[0].value
     strValor := ncfAfectado;

     if (length(strValor) = 11) then
     begin
       strValor:= '00000000'+strValor+'|';
     end else strValor:= strValor+'|';
   end else
   strValor :=  ncfAfectado+'|';

   Write(myFile, Trim(strValor));//NCF AFECTADO

   if (dmReportes.qryDatosVentaMasterCODIGO_CTE.Value = 0) then
   nombreCteImpFiscal:=''
   else
   if (Not dmReportes.qryDatosVentaMasterNOMBRE_CTE.IsNull) then
   nombreCteImpFiscal:= dmReportes.qryDatosVentaMasterNOMBRE_CTE.Value
   else
   if dmReportes.qryDatosVentaMasterNOMBRE_FACTURAR.IsNull then
   nombreCteImpFiscal:= '' else
   nombreCteImpFiscal:= dmReportes.qryDatosVentaMasterNOMBRE_FACTURAR.Value;
   nombreCteImpFiscal:= RemoverPuntoYComa(nombreCteImpFiscal);

   if (nombreCteImpFiscal = '') and
   (dmReportes.qryDatosVentaMasterNOMBRE_CLIENTE_GENERAL.Value <> '') then
   nombreCteImpFiscal:=dmReportes.qryDatosVentaMasterNOMBRE_CLIENTE_GENERAL.Value;

   strValor:=nombreCteImpFiscal;

   if (UpperCase(strValor) = 'GENERICO') then
   strValor:=''
   else
   if ((UpperCase(strValor) = 'GENERICO') or (Pos('GENERICO',UpperCase(strValor)) > 0)) THEN
   strValor:= '';

   //dmReportes.qryDatosVentaMasterNOMBRE_COMPLETO.Value;
   Write(myFile, trim(strValor)+'|');//Razon Social
   if (dmReportes.qryDatosVentaMasterRNC.IsNull) or
      (Length(dmReportes.qryDatosVentaMasterRNC.Value) =0 ) then
   strValor:='' else
   strValor:= StringReplace(dmReportes.qryDatosVentaMasterRNC.Value,'-','',[rfReplaceAll]);//RNC Cliente
   Write(myFile,Trim(strValor)+'|');
   strValor:=LCantCopias;
   WriteLn(myFile,Trim(strValor));

   dmreportes.qryDescLineasDocF.Close;
   dmreportes.qryDescLineasDocF.Params[0].Value:= 1;
   dmreportes.qryDescLineasDocF.Open;
   //Parametros para Item Documento Fiscal
   dmreportes.qryDatosRepTranscxcIFiscal.First;
   dmreportes.qryDatosVentaDetalle.First;
   //While Not dmreportes.qryDatosRepTranscxcIFiscal.Eof Do
   While not dmreportes.qryDatosVentaDetalle.Eof do
   Begin
     if dmreportes.qryDatosVentaDetalleTIPO_VENTA.Value = 3 then
     strValor:= 'RECARGO_ITEM'
     else
     strValor:= 'ITEM_CF';
   
     //strValor:= 'ITEM_CF';
     Write(myFile, Trim(strValor)+'|');//Item cf

     strValor:= dmreportes.qryDatosVentaDetalleTIPO_VENTA.AsString;//Tipo Venta
     strValor:= RemoverPuntoYComa(strValor); //(  strValor);
     Write(myFile, Trim(strValor)+'|');//Descripcion Item
	
     if dmreportes.qryDescLineasDocF.Locate('Item',1,[]) then
     strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
     else strValor:= '';
     Write(myFile, Trim(strValor)+'|');//Descripcion Extra #1
     if dmreportes.qryDescLineasDocF.Locate('Item',2,[]) then
     strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
     else strValor:= '';
     Write(myFile, Trim(strValor)+'|');//Descripcion Extra #2
     if dmreportes.qryDescLineasDocF.Locate('Item',3,[]) then
     strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
     else strValor:= '';
     Write(myFile, Trim(strValor)+'|');//Descripcion Extra #3
     if dmreportes.qryDescLineasDocF.Locate('Item',4,[]) then
     strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
     else strValor:= '';
     Write(myFile, Trim(strValor)+'|');//Descripcion Extra #4
     if dmreportes.qryDescLineasDocF.Locate('Item',5,[]) then
     strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
     else strValor:= '';
     Write(myFile, Trim(strValor)+'|');//Descripcion Extra #5
     if dmreportes.qryDescLineasDocF.Locate('Item',6,[]) then
     strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
     else strValor:= '';
     Write(myFile, Trim(strValor)+'|');//Descripcion Extra #6
     if dmreportes.qryDescLineasDocF.Locate('Item',7,[]) then
     strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
     else strValor:= '';
     Write(myFile, Trim(strValor)+'|');//Descripcion Extra #7
     if dmreportes.qryDescLineasDocF.Locate('Item',8,[]) then
     strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
     else strValor:= '';
     Write(myFile, Trim(strValor)+'|');//Descripcion Extra #8

     if dmreportes.qryDescLineasDocF.Locate('Item',9,[]) then
     strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
     else strValor:= '';
     Write(myFile, Trim(strValor)+'|');//Descripcion Extra #9

	   strValor:= dmreportes.qryDatosVentaDetalleDESCRIPCION.Value;
     strValor:= RemoverPuntoYComa(strValor); //(  strValor);
     Write(myFile, Trim(strValor)+'|');//Descripcion Item

     strValor:= dmreportes.qryDatosVentaDetalleCANTIDAD.AsString;
     {Antes
     if (dmreportes.qryDatosVentaDetalleCANTIDAD.Value - trunc(dmreportes.qryDatosVentaDetalleCANTIDAD.Value)) > 0 then
       begin
         strValor:=
         '00'+ExtraerEnteroString(DecimalSeparator,dmreportes.qryDatosVentaDetalleCANTIDAD.AsString)+
         ExtraerDecimalString(dmreportes.qryDatosVentaDetalleCANTIDAD.AsFloat)+'0'; //entero
       end else
       strValor:=dmreportes.qryDatosVentaDetalleCANTIDAD.AsString+'000';
      }//antes
      
      if (Abs(dmreportes.qryDatosVentaDetalleCANTIDAD.Value) - trunc(Abs(dmreportes.qryDatosVentaDetalleCANTIDAD.Value))) > 0 then
       begin
         strValor:= FloatToStr(Abs(dmreportes.qryDatosVentaDetalleCANTIDAD.AsFloat) * 1000);
       end else
       strValor:=dmreportes.qryDatosVentaDetalleCANTIDAD.AsString+'000';

     strValor:= RemoverPuntoYComa(strValor);
     strValor := StringReplace(strValor,'-','',[]);
     //StrValor:= StrValor + '000';
     Write(myFile, Trim(strValor)+'|');//Descripcion Cantidad

     montoPrecio := GlbCalcularPrecio(Abs(dmReportes.qryDatosVentaDetallePRECIO.Value), dmreportes.qryDatosVentaDetalleCODIGO_PROD.AsInteger);

     if (ABS(montoPrecio) = 0 ) then
     montoPrecio:= Abs(dmReportes.qryDatosVentaDetallePRECIO.Value);

     //if (dmReportes.qryDatosVentaDetalleMONEDA.Value <> '1') then
     //begin
     //  if (dmreportes.qryDatosVentaDetalleMONTO_TASA.Value > 0) then
     //  montoPrecio := dmReportes.qryDatosVentaDetallePRECIO.Value * dmreportes.qryDatosVentaDetalleMONTO_TASA.Value
     //  else
     //  montoPrecio := dmReportes.qryDatosVentaDetallePRECIO.Value * GlbMontoTasa(dmreportes.qryDatosVentaDetalleCODIGO_PROD.Value);
     //end;
     
     if (ABS(montoPrecio) = 0 ) then
     montoPrecio:= Abs(dmReportes.qryDatosVentaDetallePRECIO.Value);

     strValor:= Format('%8.2f', [Abs(montoPrecio)]);
     strValor:= RemoverPuntoYComa(strValor);
     Write(myFile, Trim(strValor)+'|');//Descripcion Precio
     if (Abs(dmreportes.qryDatosVentaDetalleITBI_DET.Value) > 0) then
     begin
       strValor :=Format('%8.2f', [FGlbPorcItbi(ExtraerFecha(dmReportes.qryDatosVentaMasterFECHA.Value),dmreportes.qryDatosVentaDetalleCODIGO_PROD.AsInteger)]);
       strValor:=RemoverPuntoYComa(strValor);
       xValor:=PadLeftCharacter(4,StrToFloat(strValor),'0');
       strValor:= xvalor;
     end else
     begin
       strValor:='0000';
       //strValor := PadLeftCharacter(4,StrToFloat(strValor),'0');
     end;

     WriteLn(myFile, Trim(strValor));//Descripcion Tasa ITBIS

     //Descuento a nivel de Item
     //*********************************begin descuento a nivel de item***********
     if (dmreportes.qryDatosVentaDetallePORC_DESC_ITEM.Value > 0) then
     begin
       strValor:= 'DESCUENTO_ITEM';
       Write(myFile, Trim(strValor)+'|');//Item cf

       strValor:= '2';//Tipo Venta
       strValor:= RemoverPuntoYComa(strValor); //(  strValor);
       Write(myFile, Trim(strValor)+'|');//Descripcion Item

       if dmreportes.qryDescLineasDocF.Locate('Item',1,[]) then
          strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
       else strValor:= '';
       Write(myFile, Trim(strValor)+'|');//Descripcion Extra #1
       if dmreportes.qryDescLineasDocF.Locate('Item',2,[]) then
          strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
       else strValor:= '';
       Write(myFile, Trim(strValor)+'|');//Descripcion Extra #2
       if dmreportes.qryDescLineasDocF.Locate('Item',3,[]) then
          strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
       else strValor:= '';
       Write(myFile, Trim(strValor)+'|');//Descripcion Extra #3
       if dmreportes.qryDescLineasDocF.Locate('Item',4,[]) then
          strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
       else strValor:= '';
            Write(myFile, Trim(strValor)+'|');//Descripcion Extra #4
       if dmreportes.qryDescLineasDocF.Locate('Item',5,[]) then
          strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
       else strValor:= '';
       Write(myFile, Trim(strValor)+'|');//Descripcion Extra #5
       if dmreportes.qryDescLineasDocF.Locate('Item',6,[]) then
          strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
       else strValor:= '';
       Write(myFile, Trim(strValor)+'|');//Descripcion Extra #6
       if dmreportes.qryDescLineasDocF.Locate('Item',7,[]) then
          strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
       else strValor:= '';
       Write(myFile, Trim(strValor)+'|');//Descripcion Extra #7
       if dmreportes.qryDescLineasDocF.Locate('Item',8,[]) then
       strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
       else strValor:= '';
       Write(myFile, Trim(strValor)+'|');//Descripcion Extra #8

       if dmreportes.qryDescLineasDocF.Locate('Item',9,[]) then
       strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
       else strValor:= '';
       Write(myFile, Trim(strValor)+'|');//Descripcion Extra #9

       strValor:= dmreportes.qryDatosVentaDetalleDESCRIPCION.Value;
       strValor:= RemoverPuntoYComa(strValor); //(  strValor);
       Write(myFile, Trim(strValor)+'|');//Descripcion Item

       strValor:= dmreportes.qryDatosVentaDetalleCANTIDAD.AsString;

      {if (dmreportes.qryDatosVentaDetalleCANTIDAD.Value - trunc(dmreportes.qryDatosVentaDetalleCANTIDAD.Value)) > 0 then
       begin
         strValor:= FloatToStr(dmreportes.qryDatosVentaDetalleCANTIDAD.AsFloat * 1000);
       end else
       strValor:=dmreportes.qryDatosVentaDetalleCANTIDAD.AsString+'000';
       }
       if (Abs(dmreportes.qryDatosVentaDetalleCANTIDAD.Value) - trunc(Abs(dmreportes.qryDatosVentaDetalleCANTIDAD.Value))) > 0 then
       begin
         strValor:= FloatToStr(Abs(dmreportes.qryDatosVentaDetalleCANTIDAD.AsFloat) * 1000);
       end else
       strValor:=dmreportes.qryDatosVentaDetalleCANTIDAD.AsString+'000';
               
       strValor:= RemoverPuntoYComa(strValor);
       strValor := StringReplace(strValor,'-','',[]);
       //ttttt StrValor:= StrValor + '000';
       Write(myFile, Trim(strValor)+'|');//Descripcion Cantidad

       montoPrecio := GlbCalcularPrecio(dmReportes.qryDatosVentaDetallePRECIO.Value, dmreportes.qryDatosVentaDetalleCODIGO_PROD.AsInteger);

       if (ABS(montoPrecio) = 0 ) then
       montoPrecio:= dmReportes.qryDatosVentaDetallePRECIO.Value;

     {if (dmReportes.qryDatosVentaDetalleMONEDA.Value <> '1') then
     begin
       if (dmreportes.qryDatosVentaDetalleMONTO_TASA.Value > 0) then
       montoPrecio := dmReportes.qryDatosVentaDetallePRECIO.Value * dmreportes.qryDatosVentaDetalleMONTO_TASA.Value
       else
       montoPrecio := dmReportes.qryDatosVentaDetallePRECIO.Value * GlbMontoTasa(dmreportes.qryDatosVentaDetalleCODIGO_PROD.Value);
     end;
     }
     if (ABS(montoPrecio) = 0 ) then
     montoPrecio:= dmReportes.qryDatosVentaDetallePRECIO.Value;

       montoDestItem := montoDestItem + Abs((montoPrecio) * dmreportes.qryDatosVentaDetallePORC_DESC_ITEM.Value /100);
       strValor:= Format('%8.2f', [Abs((montoPrecio) * dmreportes.qryDatosVentaDetallePORC_DESC_ITEM.Value /100)]);

       strValor:= RemoverPuntoYComa(strValor);
       Write(myFile, Trim(strValor)+'|');//Descripcion Precio
       if (Abs(dmreportes.qryDatosVentaDetalleITBI_DET.Value) > 0) then
       begin
         strValor :=Format('%8.2f', [FGlbPorcItbi(ExtraerFecha(dmReportes.qryDatosVentaMasterFECHA.Value),dmreportes.qryDatosVentaDetalleCODIGO_PROD.AsInteger)]);
         strValor:=RemoverPuntoYComa(strValor);
         xValor:=PadLeftCharacter(4,StrToFloat(strValor),'0');
         strValor:= xvalor;
       end else strValor:='0';

       WriteLn(myFile, strValor);//Descripcion Tasa ITBIS
     end;
     dmreportes.qryDatosVentaDetalle.Next;
    //dmreportes.qryDatosRepTranscxcIFiscal.Next;
   end;
   //if (Abs(dmReportes.qryDatosVentaMasterMONTO_DESCUENTO.Value) > 0) then
   if (Abs(dmReportes.qryDatosVentaMasterMONTO_DESCUENTO.Value) > 0) And
      (Abs(dmReportes.qryDatosVentaMasterPORC_DESCUENTO.Value)  > 0) then
   begin

     strValor:= 'ITEM_CF'+'|';
     Write(myFile, Trim(strValor));//0

     strValor:= '3';//Descuento por Item
     strValor:= RemoverPuntoYComa(strValor); //(  strValor);
     Write(myFile, strValor+'|');//1
     Write(myFile, '|');//DESCEXTRA2
     Write(myFile, '|');//DESCEXTRA3
     Write(myFile, '|');//DESCEXTRA4
     Write(myFile, '|');//DESCEXTRA5
     Write(myFile, '|');//DESCEXTRA6
     Write(myFile, '|');//DESCEXTRA7
     Write(myFile, '|');//DESCEXTRA8
     Write(myFile, '|');//DESCEXTRA9
     Write(myFile, '|');//DESCEXTRA10     
     strValor:= 'Monto Descuento';//Descripcion Item
     strValor:= RemoverPuntoYComa(strValor); //(  strValor);
     Write(myFile, Trim(strValor)+'|');//Descripcion Item 11

     strValor:= '1';
     Write(myFile, Trim(strValor)+'|');//Descripcion Cantidad -12

     strValor:= Format('%8.2f', [Abs(dmreportes.qryDatosVentaMasterMONTO_DESCUENTO.Value)]);
     strValor:= RemoverPuntoYComa(strValor);
     Write(myFile, Trim(strValor)+'|');//Descripcion Precio 13
     //if dmreportes.qryDatosVentaMaster
     //Verificar porciento de itbis
     strValor :=Format('%8.2f', [FGlbPorcItbi(ExtraerFecha(dmReportes.qryDatosVentaMasterFECHA.Value),dmreportes.qryDatosVentaDetalleCODIGO_PROD.AsInteger)]);
     strValor:=RemoverPuntoYComa(strValor);
     WriteLn(myFile, Trim(strValor));//Descripcion Tasa ITBIS -14
   end;

   if (Abs(dmReportes.qryDatosVentaMasterMONTO_RECARGO.Value) > 0) then
   begin

     strValor:= 'ITEM_CF'+'|';
     Write(myFile, Trim(strValor));//0

     strValor:= '3';//Descuento por Item
     strValor:= RemoverPuntoYComa(strValor); //(  strValor);
     Write(myFile, strValor+'|');//1
     Write(myFile, '|');//DESCEXTRA2
     Write(myFile, '|');//DESCEXTRA3
     Write(myFile, '|');//DESCEXTRA4
     Write(myFile, '|');//DESCEXTRA5
     Write(myFile, '|');//DESCEXTRA6
     Write(myFile, '|');//DESCEXTRA7
     Write(myFile, '|');//DESCEXTRA8
     Write(myFile, '|');//DESCEXTRA9
     Write(myFile, '|');//DESCEXTRA10     
     strValor:= 'Monto Recargo';//Descripcion Item
     strValor:= RemoverPuntoYComa(strValor); //(  strValor);
     Write(myFile, Trim(strValor)+'|');//Descripcion Item 11

     strValor:= '1';
     Write(myFile, Trim(strValor)+'|');//Descripcion Cantidad -12

     strValor:= Format('%8.2f', [Abs(dmreportes.qryDatosVentaMasterMONTO_RECARGO.Value)]);
     strValor:= RemoverPuntoYComa(strValor);
     Write(myFile, Trim(strValor)+'|');//Descripcion Precio 13
     //if dmreportes.qryDatosVentaMaster
     //Verificar porciento de itbis
     strValor :=Format('%8.2f', [FGlbPorcItbi(ExtraerFecha(dmReportes.qryDatosVentaMasterFECHA.Value),dmreportes.qryDatosVentaDetalleCODIGO_PROD.AsInteger)]);
     strValor:=RemoverPuntoYComa(strValor);
     WriteLn(myFile, Trim(strValor));//Descripcion Tasa ITBIS -14
   end;

   if (dmReportes.qryDatosVentaMasterPROPINA.Value > 0) AND (GLBEsFastFood) then
   begin
     strValor:= 'PROPINA_CF'+'|';
     Write(myFile, Trim(strValor));//0

     strValor:= Format('%8.2f', [dmreportes.qryDatosVentaMasterPROPINA.Value]);
     strValor:= RemoverPuntoYComa(strValor);
     Write(myFile, Trim(strValor));
   end;

   //Parametros para Pago Documento Fiscal

   dmreportes.qryDescLineasDocF.Close;
   dmreportes.qryDescLineasDocF.Params[0].Value:=2;
   dmreportes.qryDescLineasDocF.Open;

   strValor:= 'PAGO_CF'+'|';
   Write(myFile,Trim(strValor));//Tipo

   //t IF (dmreportes.qryDatosVentaMasterTIPO_NCF.Value = '04') then
   strValor:= ''; //Nota de Credito
   //t ? else strValor:= '13';//Nota de Credito

   Write(myFile,Trim(strValor)+'|');//Tipo

   strValor:= Format('%8.2f', [Abs(dmReportes.qryDatosVentaMasterMonto_bruto.Value)]);// [dmReportes.qryDatosRepTranscxcIFiscalVALOR_DOCUMENTO.Value]);
   strValor:= Trim(RemoverPuntoYComa(strValor));
   Write(myFile,strValor+'|');//Monto

   strValor := dmReportes.qryDatosVentaMasterNumero.AsString;//dmReportes.qryDatosRepTranscxcIFiscalSERIE.AsString;//'NUMEROTRN';
   Write(myFile, trim(strValor)+'|');//NUMERO TRANSACCION

   if dmreportes.qryDescLineasDocF.Locate('Item',1,[]) then
   strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
   else strValor:= '';
   Write(myFile,Trim(strValor)+'|');//Descripcion Extra #1
   if dmreportes.qryDescLineasDocF.Locate('Item',2,[]) then
   strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
   else strValor:= '';
   Write(myFile,Trim(strValor)+'|');//Descripcion Extra #2
   if dmreportes.qryDescLineasDocF.Locate('Item',3,[]) then
   strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
   else strValor:= '';
   WriteLn(myFile,Trim(strValor));//Descripcion Extra #3

   {Las notas de credito no necesita Forma de pago
   }

   //Parametros para Pago Documento Fiscal
   dmreportes.qryDescLineasDocF.Close;
   dmreportes.qryDescLineasDocF.Params[0].Value:=4;
   dmreportes.qryDescLineasDocF.Open;
   strValor:= 'CLOSE_CF';
   Write(myFile,Trim(strValor)+'|');//CLOSE
   strValor:='';
   dmreportes.qryDescLineasDocF.Last;
   X := 1;
   Count := dmreportes.qryDescLineasDocF.RecordCount;
   dmreportes.qryDescLineasDocF.First;

   //Se aceptan hasta 40 lineas
   While Not dmreportes.qryDescLineasDocF.Eof Do
   begin
     if (dmreportes.qryDescLineasDocFSTATUS.Value = 'I') then
     begin
       X := X + 1;
       dmreportes.qryDescLineasDocF.Next;
       continue;
     end;
     if  x < count then
     begin
       if not dmreportes.qryDescLineasDocFDESCRIPCION.IsNull then
       strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
       else strValor:= '';
       Write(myFile,Trim(strValor)+'|');//Descripcion Cola Reemplazo #x
     end;

     if X = Count then
     begin
       if Not dmreportes.qryDescLineasDocFDESCRIPCION.IsNull then
       strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
       else strValor := '';
       WriteLn(myFile,Trim(strValor));
     end;
     X := X + 1;
     dmreportes.qryDescLineasDocF.Next;
   end;
   dmreportes.qryDescLineasDocF.Close;
   dmreportes.qryDescLineasDocF.Params[0].Value:= 3;
   dmreportes.qryDescLineasDocF.Open;

   if dmreportes.qryDescLineasDocF.Locate('Item',1,[]) then
   strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
   else strValor:= '';
   Write(myFile,Trim(strValor)+'|');//Descripcion Cola Reemplazo #1
   strValor:= '';
   Write(myFile,Trim(strValor)+'|');//Desc trailer #1
   if dmreportes.qryDescLineasDocF.Locate('Item',2,[]) then
   strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
   else strValor:= '';
   Write(myFile,Trim(strValor)+'|');//Desc Cola #2
   strValor:= '';
   Write(myFile,Trim(strValor)+'|');//Desc Trailer #2
   if dmreportes.qryDescLineasDocF.Locate('Item',3,[]) then
   strValor := dmReportes.qryDatosVentaMasterOBSERVACION.Value// dmreportes.qryDatosRepTranscxcIFiscalCONCEPTO.Value
   else strValor:= '';
     if (strValor = '') then
     strValor:='Usr: ' +VarNombreUsuario;   
   Write(myFile,Trim(strValor)+'|');//Desc Cola #3
   strValor:= '';
   Write(myFile,Trim(strValor));  //Desc Trailer #3

   strValor:= '';
   Write(myFile,Trim(strValor)+'|');  //Desc Trailer #3

   strValor := dmReportes.qryDatosVentaMasterNUMERO.AsString;//'NUMEROTRN';
   WriteLn(myFile, Trim(strValor));//NUMERO TRANSACCION

   CloseFile(myFile);
end;

procedure TfrmTestImpresoraFiscal.procDatosOKI;
 var
   myFile : TextFile;
   text   : string;
   strValor: String;
   cant : integer;
   mto : real;
begin
  //<ABRIR_CF,”1 TIPO”,”2 CANT. COPIAS”,”3 LOGO”,”4 SUCURSAL”,”5 CAJA”,”6 NCF”,"7
  //RAZON SOCIAL","8 RNC",”9 RNC REFERENCIA”>

  AssignFile(myFile, ExtractFilePath(Application.ExeName)+'Files/Recibo'+
                      {dmReportes.qryDatosVentaMasterNUMERO.AsString+}'.txt');
   ReWrite(myFile);

   //Parametros para abrir Documento Fiscal
   strValor := '<ABRIR_CF';
   Write(myFile, trim(strValor)+'|');//abrir

   strValor := 'EXTENSION'; //1- tipo
   Write(myFile, Trim(dmreportes.qryTipoIFiscalTIPO_NCF_IFISCAL.AsString)+'|');

   strValor := '0';//2- cant copias
   Write(myFile, Trim(strValor+'|'));

   strValor := '0';
   Write(myFile, Trim(strValor)+'|');//3-Logo

   //strValor := '';
   //Write(myFile, Trim(strValor)+'|');//Densidad

   strValor := InsertaCeroIzq(4, trim(GlbCodSucursal))+'|';//4-Sucursal
   Write(myFile, Trim(strValor));

   strValor := InsertaCeroIzq(4,dmReportes.qryDatosCajaImpUserCOD_CAJA.AsString)+'|';//5-Caja
   Write(myFile, Trim(strValor));

   if (not dmReportes.qryDatosVentaMasterNUMERO_NCF.IsNull) then
   begin
     strValor := dmReportes.qryDatosVentaMasterNUMERO_NCF.Value; //6-ncf

     if (length(strValor) = 11) then
     begin
       strValor:= '00000000'+strValor+'|';
     end else strValor:= strValor+'|';

   end
   else strValor := '';   

   Write(myFile, Trim(strValor));//NCF

   //strValor := ',';
   //Write(myFile, Trim(strValor));//NCF Afectado

   if (Not dmReportes.qryDatosVentaMasterNOMBRE_CTE.IsNull) then
   nombreCteImpFiscal:= dmReportes.qryDatosVentaMasterNOMBRE_CTE.Value
   else
   if dmReportes.qryDatosVentaMasterNOMBRE_FACTURAR.IsNull then
   nombreCteImpFiscal:= ' ' else
   nombreCteImpFiscal:= dmReportes.qryDatosVentaMasterNOMBRE_FACTURAR.Value;
   nombreCteImpFiscal:= RemoverPuntoYComa(nombreCteImpFiscal); //7-razon social
   //dmReportes.qryDatosVentaMasterNOMBRE_COMPLETO.Value;

   strValor:= nombreCteImpFiscal;

   if Length(trim(strValor)) = 0 then
   Write(myFile, ' ,') else
   Write(myFile, trim(strValor)+'|');//Razon Social
   
   if (dmReportes.qryDatosVentaMasterRNC.IsNull) Or (Length(dmReportes.qryDatosVentaMasterRNC.Value) =0 ) then
   strValor:='' else
   strValor:= StringReplace(dmReportes.qryDatosVentaMasterRNC.Value,'-','',[rfReplaceAll])+'|';//8-RNC Cliente

   if Length(trim(strValor)) = 0 then
   Write(myFile, ' ,') else
   Write(myFile,Trim(strValor));//9-NCF Referencia

   WriteLn(myFile, ' >');
  //<ITEM_CF,”1 TIPO”,"2 DESC 1","3 DESC 2","4 DESC 3","5 DESC 4","6 DESC 5","7
  //DESC 6"," 8 DESC 7","9 DESC 8","10 DESC 9","11 DESC ITEM","12 CANT","13
  //MONTO","14 TASA">

  //<ITEM_CF,”1 TIPO”,"2 DESC 1","3 DESC 2","4 DESC 3","5 DESC 4","6 DESC 5","7
  //DESC 6"," 8 DESC 7","9 DESC 8","10 DESC 9","11 DESC ITEM","12 CANT","13
  //MONTO","14 TASA">

   dmreportes.qryDescLineasDocF.Close;
   dmreportes.qryDescLineasDocF.Params[0].Value:= 1;
   dmreportes.qryDescLineasDocF.Open;
   //Parametros para Item Documento Fiscal
   dmreportes.qryDatosVentaDetalle.First;
   //Tipo de operación:‘0’ – Ítem de venta.‘1’ – Anulación de ítem de venta.‘2’ – Descuento por ítem.
   //‘3’ – Recargo por ítem. ‘4’ – Ítem de retorno. ‘5’ – Anulación de ítem de retorno.
   While Not dmreportes.qryDatosVentaDetalle.Eof Do
   Begin

     strValor:= '<ITEM_CF';
     Write(myFile, Trim(strValor)+'|');//Item cf
     strValor:='0';//Item de venta.
     
     //if EsDevolucion then
     //  strValor:= '4' //‘4’ – Ítem de retorno.
     //else
     //if dmreportes.qryDatosVentaDetallePRECIO.Value >= 0 then//Venta
     //begin
     //  strValor:= '0';//1 -Item de Venta
     //end;{ else
     //if dmreportes.qryDatosVentaDetallePRECIO.Value < 0  then//Venta
     //begin
     //  strValor:= '1';//1 -Anulacoin item de venta
     //end;}
     //aqui voy 1
     if Not dmReportes.qryDatosVentaDetalleTIPO_VENTA.IsNull then
     strValor:=dmReportes.qryDatosVentaDetalleTIPO_VENTA.AsString;
     
     Write(myFile, Trim(strValor)+'|');//Item cf

     strValor:= dmreportes.qryDatosVentaDetalleDESCRIPCION.Value;
     strValor:= RemoverPuntoYComa(strValor); //(  strValor);
     if Length(trim(strValor)) = 0 then
     Write(myFile,' ,') else
     Write(myFile, Trim(strValor)+'|');//11- Descripcion Item
     
     if dmreportes.qryDescLineasDocF.Locate('Item',1,[]) then
     strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
     else strValor:= ' ';
     if Length(trim(strValor)) = 0 then
     Write(myFile,' ,') else
     Write(myFile, Trim(strValor)+'|');//2- Descripcion Extra #1

     if dmreportes.qryDescLineasDocF.Locate('Item',2,[]) then
     strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
     else strValor:= ' ';
     if Length(trim(strValor)) = 0 then
     Write(myFile,' ,') else
     Write(myFile, Trim(strValor)+'|');//3- Descripcion Extra #2

     if dmreportes.qryDescLineasDocF.Locate('Item',3,[]) then
     strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
     else strValor:= ' ';
     
     if Length(trim(strValor)) = 0 then
     Write(myFile,' ,') else
     Write(myFile, Trim(strValor)+'|');//4- Descripcion Extra #3

     if dmreportes.qryDescLineasDocF.Locate('Item',4,[]) then
     strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
     else strValor:= ' ';
     if Length(trim(strValor)) = 0 then
     Write(myFile,' ,') else
     Write(myFile, Trim(strValor)+'|');//5- Descripcion Extra #4

     if dmreportes.qryDescLineasDocF.Locate('Item',5,[]) then
     strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
     else strValor:= ' ';
     if Length(trim(strValor)) = 0 then
     Write(myFile,' ,') else
     Write(myFile, Trim(strValor)+'|');//6- Descripcion Extra #5

     if dmreportes.qryDescLineasDocF.Locate('Item',6,[]) then
     strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
     else strValor:= ' ';

     if Length(trim(strValor)) = 0 then
     Write(myFile,' ,') else
     Write(myFile, Trim(strValor)+'|');//7- Descripcion Extra #6

     if dmreportes.qryDescLineasDocF.Locate('Item',7,[]) then
     strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
     else strValor:= ' ';

     if Length(trim(strValor)) = 0 then
     Write(myFile,' ,') else
     Write(myFile, Trim(strValor)+'|');//8- Descripcion Extra #7

     if dmreportes.qryDescLineasDocF.Locate('Item',8,[]) then
     strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
     else strValor:= ' ';
     if Length(trim(strValor)) = 0 then
     Write(myFile,' ,') else
     Write(myFile, Trim(strValor)+'|');//9 -Descripcion Extra #8

     //if dmreportes.qryDescLineasDocF.Locate('Item',9,[]) then
     //strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
     //else strValor:= ' ';

     //if Length(trim(strValor)) = 0 then
     //Write(myFile,' ,') else
     //Write(myFile, Trim(strValor)+'|');//10- Descripcion Extra #9

     if EsDevolucion then
     cant := dmreportes.qryDatosVentaDetalleCANTIDAD.AsInteger * -1
     else
     cant:= dmreportes.qryDatosVentaDetalleCANTIDAD.AsInteger;

     strValor:= 'Cant. *' + IntToStr(cant)+'*';
     Write(myFile, Trim(strValor)+'|');//13- Cantidad

     //strValor:= IntToStr(cant)+'000';
     if (dmreportes.qryDatosVentaDetalleCANTIDAD.Value - Trunc(dmreportes.qryDatosVentaDetalleCANTIDAD.Value)) > 0 then
     begin
       strValor:= FloatToStr(dmreportes.qryDatosVentaDetalleCANTIDAD.AsFloat * 1000);
     end else
     strValor:=dmreportes.qryDatosVentaDetalleCANTIDAD.AsString+'000';

     {if (dmreportes.qryDatosVentaDetalleCANTIDAD.Value - trunc(dmreportes.qryDatosVentaDetalleCANTIDAD.Value)) > 0 then
       begin
         strValor:=
         '00'+ExtraerEnteroString(DecimalSeparator,dmreportes.qryDatosVentaDetalleCANTIDAD.AsString)+
         ExtraerDecimalString(dmreportes.qryDatosVentaDetalleCANTIDAD.AsFloat)+'0'; //entero
       end else
       strValor:=dmreportes.qryDatosVentaDetalleCANTIDAD.AsString+'000';}

     Write(myFile, Trim(strValor)+'|');//13- Cantidad

     montoPrecio := GlbCalcularPrecio(dmReportes.qryDatosVentaDetallePRECIO.Value, dmreportes.qryDatosVentaDetalleCODIGO_PROD.AsInteger);

     if (ABS(montoPrecio) = 0 ) then
     montoPrecio:= dmReportes.qryDatosVentaDetallePRECIO.Value;

     {
     if (dmReportes.qryDatosVentaDetalleMONEDA.Value <> '1') then
     begin
       if (dmreportes.qryDatosVentaDetalleMONTO_TASA.Value > 0) then
       montoPrecio := dmReportes.qryDatosVentaDetallePRECIO.Value * dmreportes.qryDatosVentaDetalleMONTO_TASA.Value
       else
       montoPrecio := dmReportes.qryDatosVentaDetallePRECIO.Value * GlbMontoTasa(dmreportes.qryDatosVentaDetalleCODIGO_PROD.Value);
     end;
     }
     if (ABS(montoPrecio) = 0 ) then
     montoPrecio:= dmReportes.qryDatosVentaDetallePRECIO.Value;

     strValor:= Format('%8.2f', [Abs(montoPrecio)]);
     strValor:= RemoverPuntoYComa(strValor);
     Write(myFile, Trim(strValor)+'|');//12- Descripcion Precio

     if (Abs(dmreportes.qryDatosVentaDetalleITBI_DET.Value) > 0) then
     begin
       strValor :=Format('%8.2f', [FGlbPorcItbi(ExtraerFecha(dmReportes.qryDatosVentaMasterFECHA.Value),dmreportes.qryDatosVentaDetalleCODIGO_PROD.AsInteger)]);
       strValor:=RemoverPuntoYComa(strValor);
     end else strValor:='0';

     Write(myFile, Trim(strValor));//14- Descripcion Tasa ITBIS
     WriteLn(myFile, ' >');
     dmreportes.qryDatosVentaDetalle.Next;
   end;

   //<DESC_REC_CF,”1 MODO, 2 DESCRIPCION”,”3 MONTO”>

   if (dmReportes.qryDatosVentaMasterMONTO_DESCUENTO.Value > 0) then
   begin
     strValor:= '<DESC_REC_CF';
     Write(myFile, Trim(strValor)+'|');//Descripcion Extra #1

     strValor:= '0';//1-Descuento por Item
     //strValor:= RemoverPuntoYComa(strValor); //(  strValor);
     Write(myFile, Trim(strValor)+'|');//Descripcion Item

     strValor:= 'Descuento ';
     strValor:= RemoverPuntoYComa(strValor); //(  strValor);
     Write(myFile, Trim(strValor)+'|');//2-Descripcion Item

     //strValor:= '';
     //Write(myFile, Trim(strValor)+'|');//Descripcion Cantidad

     strValor:= Format('%8.2f', [dmreportes.qryDatosVentaMasterMONTO_DESCUENTO.Value]);
     strValor:= RemoverPuntoYComa(strValor);
     Write(myFile, Trim(strValor));//3-Descripcion Precio
     WriteLn(myFile, ',0 >');
     WriteLn(myFile, '<SUBTOTAL_CF>');
     //if dmreportes.qryDatosVentaMaster
     //strValor :=Format('%8.2f', [FGlbPorcItbi(ExtraerFecha(dmReportes.qryDatosVentaMasterFECHA.Value))]);
     //strValor:=RemoverPuntoYComa(strValor);
     //WriteLn(myFile, Trim(strValor));//Descripcion Tasa ITBIS
   end;

  //<SUBTOTAL_CF>

  //<DESC_REC_CF,”1 MODO, 2 DESCRIPCION”,”3 MONTO”>
  //<DESC_REC_CF,”1 MODO, 2 DESCRIPCION”,”3 MONTO DESCUENTO EXENTO”,”4 MONTO DESCUENTO GRAVADO”>

  //<PAGO_CF,”1 MODO”,”2 TIPO”,"3 MONTO", “4 DESC 1” , “5 DESC 2” , “6 DESC 3”>
//Parametros para Pago Documento Fiscal

   dmreportes.qryDescLineasDocF.Close;
   dmreportes.qryDescLineasDocF.Params[0].Value:=2;
   dmreportes.qryDescLineasDocF.Open;

   dmreportes.qryDetallePagos.Close;
   dmreportes.qryDetallePagos.Params[0].Value:=dmReportes.qryDatosVentaMasterNUMERO.Value;
   dmreportes.qryDetallePagos.Open;
   dmreportes.qryDetallePagos.First;
   if (dmreportes.qryDetallePagos.RecordCount  = 0) then
   begin
       strValor:= '<PAGO_CF';
       Write(myFile,Trim(strValor)+'|');//Tipo
       
       //if EsDevolucion then
       //strValor:= '0' else
       //strValor:= '1';

       if dmreportes.qryDetallePagosPAGO.IsNull then
       strValor:= '0'
       else strValor:= dmreportes.qryDetallePagosPAGO.AsString;
       
       Write(myFile,Trim(strValor)+'|');//1-Pago

       if dmReportes.qryDatosVentaMasterFORMA_PAGO.Value = 7 then
       strValor:= '8' else
       if dmReportes.qryDatosVentaMasterFORMA_PAGO.Value = 8 then
       strValor:= '9'
       else strValor:= '1';//Efectivo
       
       Write(myFile,Trim(strValor)+'|');//2-Tipo

       if (dmReportes.qryDatosVentaMasterMONTO_PAGADO.Value = 0) And
       (dmReportes.qryDatosVentaMasterFORMA_PAGO.Value in [7,8]) then //credito normal o directo
       strValor:= Format('%8.2f', [Abs(dmReportes.qryDatosVentaMasterVALOR_TOTAL_DET.Value)])
       else
       strValor:= Format('%8.2f', [Abs(dmReportes.qryDatosVentaMasterMONTO_PAGADO.Value)]);
       strValor:= Trim(RemoverPuntoYComa(strValor));
       Write(myFile,strValor+'|');//3-Monto

       strValor:='';
       if dmreportes.qryDescLineasDocF.Locate('Item',1,[]) then
          strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
       else strValor:= '';

       if Length(trim(strValor)) = 0 then
       Write(myFile,' ,') else
       Write(myFile,Trim(strValor)+'|');//4- Descripcion Extra #1

       if dmreportes.qryDescLineasDocF.Locate('Item',2,[]) then
          strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
       else strValor:= '';

       if Length(trim(strValor)) = 0 then
       Write(myFile,' ,') else
       Write(myFile,Trim(strValor)+'|');//5- Descripcion Extra #2

       if dmreportes.qryDescLineasDocF.Locate('Item',3,[]) then
          strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
       else strValor:= '';

       if Length(trim(strValor)) = 0 then
       Write(myFile,' ,') else
       Write(myFile,Trim(strValor));//6- Descripcion Extra #3
       WriteLn(myFile, ' >');
   end else
   begin
     While Not dmreportes.qryDetallePagos.Eof do
     begin
       strValor:= '<PAGO_CF';
       Write(myFile,Trim(strValor)+'|');
       if dmreportes.qryDetallePagosPAGO.IsNull then
       strValor:= '0'
       else strValor:= dmreportes.qryDetallePagosPAGO.AsString;

       Write(myFile,Trim(strValor)+'|');//1-Modo

       strValor:= dmreportes.qryDetallePagosIFISCAL_TPAGO.AsString;
       Write(myFile,Trim(strValor)+'|');//2- Tipo Pago
       //strValor:= Format('%8.2f', [dmReportes.qryDatosVentaMasterMONTO_PAGADO.Value]);
       strValor:= Format('%8.2f', [dmreportes.qryDetallePagosMONTO_PAGADO.Value]);
       strValor:= Trim(RemoverPuntoYComa(strValor));
       Write(myFile,strValor+'|');//3- Monto
       //usado para amarrar la transaccion con datos pago
       //t strValor := dmReportes.qryDatosVentaMasterNUMERO.AsString;//'NUMEROTRN';
       //t Write(myFile, trim(strValor)+'|');//NUMERO TRANSACCION

       if dmreportes.qryDescLineasDocF.Locate('Item',1,[]) then
          strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
       else strValor:= '';

       if Length(trim(strValor)) = 0 then
       Write(myFile,' ,') else
       Write(myFile,Trim(strValor)+'|');//4- Descripcion Extra #1

       if dmreportes.qryDescLineasDocF.Locate('Item',2,[]) then
          strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
       else strValor:= '';

       if Length(trim(strValor)) = 0 then
       Write(myFile,' ,') else
       Write(myFile,Trim(strValor)+'|');//5- Descripcion Extra #2

       if dmreportes.qryDescLineasDocF.Locate('Item',3,[]) then
          strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
       else strValor:= '';

       if Length(trim(strValor)) = 0 then
       Write(myFile,' ,') else
       Write(myFile,Trim(strValor));//6- Descripcion Extra #3
       
       WriteLn(myFile, ' >');
       dmreportes.qryDetallePagos.Next;
     end;
   end;
   //<CERRAR_CF,”1 MODIFICADOR, 2 NUM LINEA1”, ”3 DESC LINEA1”, ”4 NUM LINEA2”,
   //”5 DESC LINEA2”, ”6 NUM LINEA3”, ”7 DESC LINEA3”>

   strValor:= '<INFO_PAGOS_CF>';
   WriteLn(myFile,Trim(strValor));//
   if Not dmReportes.qryDatosVentaMasterNUMERO_FACTURA.IsNull then
   begin
     //Writeln(myFile,'<AVANZA_PAPEL, 1000>');
     Write(myFile,'<TEXTO_CF, Factura No.: ');
     strValor:= dmReportes.qryDatosVentaMasterNUMERO_FACTURA.AsString;
     WriteLn(myFile, strValor+'>');
   end else
   if Not dmReportes.qryDatosVentaMasterNUMERO_DOC_PAGO.IsNull then
   begin
     //Writeln(myFile,'<AVANZA_PAPEL, 1000>');
     Write(myFile,'<TEXTO_CF,Factura No.: ');
     strValor:= dmReportes.qryDatosVentaMasterNUMERO_DOC_PAGO.AsString;
     WriteLn(myFile, strValor+'>');
   end;
   strValor:='';
   //Parametros para Pago Documento Fiscal
   dmreportes.qryDescLineasDocF.Close;
   dmreportes.qryDescLineasDocF.Params[0].Value:=3;
   dmreportes.qryDescLineasDocF.Open;

   strValor := '<TEXTO_CF, Nro. trn: ' + dmreportes.qryDatosVentaMasterNUMERO.AsString;
   WriteLn(myFile,strValor+'>' );//Numero transaccion ventas master

   strValor:= '<CERRAR_CF';
   Write(myFile,Trim(strValor)+'|');//CLOSE
   strValor:= '1';//cortar papel
   Write(myFile,Trim(strValor)+'|');//1- Modificador

   strValor:='';
   if dmreportes.qryDescLineasDocF.Locate('Item',1,[]) then
   strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
   else strValor:= '';
   //Write(myFile,Trim(strValor)+'|');//2- Descripcion Cola Reemplazo #1
   if Length(strValor) > 0 then
   begin
     Write(myFile,Trim('100,'));
     Write(myFile,Trim(strValor)+'|');
   end else
   begin
     Write(myFile,Trim('000,'));//3-Desc Trailer #2
     Write(myFile,' ,');
   end;

   if dmreportes.qryDescLineasDocF.Locate('Item',2,[]) then
   strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
   else strValor:= '';

   if Length(strValor) > 0 then
   begin
     Write(myFile,Trim('200,'));
     Write(myFile,Trim(strValor)+'|');
   end else
   begin
     Write(myFile,Trim('000,'));//5-Desc Trailer #2
     Write(myFile,' ,');
   end;
   strValor:='';

   if dmreportes.qryDescLineasDocF.Locate('Item',3,[]) then
   strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
   else strValor:= '';

   if Length(strValor) > 0 then
   begin
     Write(myFile,Trim('300,'));//6- Desc Cola #3
     Write(myFile,Trim(strValor)+'|');
   end
   else
   begin
     Write(myFile,Trim('000,'));
     Write(myFile,' ');//6- Desc Cola #3
   end;
   strValor:= '';
   WriteLn(myFile, ' >');

   //linea comentario adicional
   //<TEXTO_CF,"1 LINEA">
   CloseFile(myFile);

end;

//Reimprimir documento fiscal para impresora  OKI
procedure TfrmTestImpresoraFiscal.procDatosReimOKI;
var
   myFile : TextFile;
   text   : string;
   strValor: String;
   tipoD : Integer;
   MontoTotalBruto,
   MontoItbis,
   MontoNeto,
   montoPagado,
   MontoCambio : Extended;
begin
   AssignFile(myFile, ExtractFilePath(Application.ExeName)+'Files/Recibo'+
                      {dmReportes.qryDatosVentaMasterNUMERO.AsString+}'.txt');
   ReWrite(myFile);

   dmReportes.qryDatosReimpDocFiscalOKI.First;
   //Parametros para abrir Documento Fiscal

   strValor := '<ABRIR_DNF>';
   WriteLn(myFile, trim(strValor));
   strValor := '<TEXTO_DNF, '+' ****** COPIA DE DOCUMENTO FISCAL ******';
   WriteLn(myFile, trim(strValor)+'>');
   strValor := '<TEXTO_DNF,'+' RNC: '+dmCompania.tblCompaniaRNC_NUMERO.Value;
   WriteLn(myFile, trim(strValor)+'>');

   strValor := '<TEXTO_DNF, '+dmCompania.tblCompaniaNOMBRE.Value;
   WriteLn(myFile, trim(strValor)+'>');

   strValor := '<TEXTO_DNF,'+' COMPROBANTE AUTORIZADO POR DGII'+'>';
   WriteLn(myFile,strValor);
   WriteLn(myFile,'<TEXTO_DNF, ' + '--------------------------------------'+'>'); 

   strValor :='<TEXTO_DNF,'+FormatDateTime(' dd/mm/yyyy', Date);
   Write(myFile, trim(strValor));
   strValor :=' '+FormatDateTime('HH:MM:SS', time)+'>';
   WriteLn(myFile, strValor);

   if (Not dmReportes.qryDatosReimpDocFiscalOKINUMERO_NCF.IsNull) Then
   strValor := dmReportes.qryDatosReimpDocFiscalOKINUMERO_NCF.Value;

   if (length(strValor) > 0) then
   WriteLn(myFile, '<TEXTO_DNF,' + ' NCF :' + Trim(strValor) + '>');//NCF

   if (dmReportes.qryDatosReimpDocFiscalOKIRNC.IsNull) or (Length(dmReportes.qryDatosReimpDocFiscalOKIRNC.Value) =0 ) then
   strValor:='' else
   strValor:=StringReplace(dmReportes.qryDatosReimpDocFiscalOKIRNC.Value,'-','',[rfReplaceAll]);//RNC Cliente

   if (length(strValor) > 0) then
   WriteLn(myFile,'<TEXTO_DNF, RNC : ' + Trim(strValor)+'>');

   if (Not dmReportes.qryDatosReimpDocFiscalOKINombrecliente.IsNull) then
   strValor:= dmReportes.qryDatosReimpDocFiscalOKINombrecliente.Value
   else
   if dmReportes.qryDatosReimpDocFiscalOKINombrecliente.IsNull then
   //strValor:= 'Cliente Generico' else
   strValor:= '' else
   strValor:= dmReportes.qryDatosReimpDocFiscalOKINombrecliente.Value;

   if (UpperCase(strValor) = 'GENERICO') then
   strValor:=''
   else
   if ((UpperCase(strValor) = 'GENERICO') or (Pos('GENERICO',UpperCase(strValor)) > 0)) THEN
   strValor:='';   
   strValor:= RemoverPuntoYComa(strValor);

   if (length(strValor) > 0) then
   WriteLn(myFile,'<TEXTO_DNF, ' + Trim(strValor)+'>');//Razon Social

   WriteLn(myFile,'<TEXTO_DNF,' + ' --------------------------------------'+'>');
   WriteLn(myFile,'<TEXTO_DNF,' + '      ' + dmReportes.qryDatosReimpDocFiscalOKIDESCDOCUMENTOFISCAL.Value+'>');
   WriteLn(myFile,'<TEXTO_DNF,' + ' --------------------------------------'+'>');
   //WriteLn(myFile,'<TEXTO_DNF,' + 'DESCRIPCION         ITBIS       VALOR '+'>');
   WriteLn(myFile,'<TEXTO_DNF, ' + Format('%s %14s %11s', ['DESCRIPCION','ITBIS','VALOR'])+'>');
   WriteLn(myFile,'<TEXTO_DNF, ' + '--------------------------------------'+'>');

   MontoTotalBruto:= 0;
   MontoItbis := 0;
   MontoNeto:= 0;
   montoPagado:= 0;
   MontoCambio := 0;

   //Parametros para Item Documento Fiscal
   dmreportes.qryDatosReimpdocFiscalDet.First;
   While Not dmreportes.qryDatosReimpdocFiscalDet.Eof Do
   Begin
     montoPrecio := GlbCalcularPrecio(dmreportes.qryDatosReimpdocFiscalDetPRECIO.Value,
                                      dmreportes.qryDatosReimpdocFiscalDetCODIGO_PROD.AsInteger);

     if (ABS(montoPrecio) = 0 ) then
     montoPrecio:= dmreportes.qryDatosReimpdocFiscalDetPRECIO.Value;

     strValor:= dmreportes.qryDatosReimpdocFiscalDetDESCRIPCION.Value;
     strValor:= RemoverPuntoYComa(strValor); //(  strValor);
     WritelN(myFile, '<TEXTO_DNF, ' + Trim(strValor)+'>');//Descripcion Item

     strValor:= Format('%10f X %11f', [dmreportes.qryDatosReimpdocFiscalDetCANTIDAD.Value,
                                     montoPrecio]);

     if (dmreportes.qryDatosReimpdocFiscalDetITBI_DET.Value = 0) then
     strValor:=strValor + '   E';

     WriteLN(myFile, '<TEXTO_DNF, ' +Trim(strValor)+'>');//Descripcion Cantidad

     strValor := Format('<TEXTO_DNF, Cant *%f* %14f %10f',
                        [dmreportes.qryDatosReimpdocFiscalDetCANTIDAD.Value,
                         dmreportes.qryDatosReimpdocFiscalDetITBI_DET.Value,
                         dmreportes.qryDatosReimpdocFiscalDetVALOR_SERVICIO_DET.Value]);

     WriteLn(myFile,strValor+'>');
     MontoTotalBruto:= MontoTotalBruto + dmreportes.qryDatosReimpdocFiscalDetVALOR_SERVICIO_DET.Value;
     MontoItbis := MontoItbis + dmreportes.qryDatosReimpdocFiscalDetITBI_DET.Value;
     MontoNeto := MontoNeto + dmreportes.qryDatosReimpdocFiscalDetVALOR_TOTAL_DET.Value;
     //MontoNeto,
     //montoPagado,
     //MontoCambio : Currency;

     dmreportes.qryDatosReimpdocFiscalDet.Next;
   end;
   if (dmreportes.qryDatosVentaMasterMONTO_DESCUENTO.Value > 0 ) then
   //if (dmReportes.qryDatosReimpDocFiscalMONTO_DESCUENTO.Value > 0) then
   begin
     WriteLn(myFile,'<TEXTO_DNF, ' + '--------------------------------------'+'>');   
     strValor := Format('<TEXTO_DNF, %-9s %16f %10f',['SUBTOTAL',MontoItbis,MontoTotalBruto]);
     WriteLn(myFile, strValor+'>');//Monto

     //strValor:= '<TEXTO_DNF,';

     //strValor:= '<TEXTO_DNF, Descuento ';
     //WriteLn(myFile, Trim(strValor)+'>');//Descripcion Item
     strValor := Format('%-9s %27f',['DESCUENTO',dmreportes.qryDatosVentaMasterMONTO_DESCUENTO.Value]);
     //strValor:= RemoverPuntoYComa(strValor);
     WriteLn(myFile, '<TEXTO_DNF, '+Trim(strValor)+'>');//Descripcion Precio
     MontoTotalBruto:= MontoTotalBruto - dmreportes.qryDatosVentaMasterMONTO_DESCUENTO.Value;
     //MontoNeto := MontoNeto - dmreportes.qryDatosVentaMasterMONTO_DESCUENTO.Value;
     //strValor := Format('<TEXTO_DNF, %-9s %16n %10n',['SUBTOTAL', MontoItbis, MontoTotalBruto]);
     //WriteLn(myFile, strValor+'>');//Monto

   end;
   WriteLn(myFile,'<TEXTO_DNF, ' + '--------------------------------------'+'>');
   strValor := Format('<TEXTO_DNF, %-9s %16f %10f',['SUBTOTAL',MontoItbis,MontoTotalBruto]);
   WriteLn(myFile, strValor+'>');//Monto

   strValor := Format('<TEXTO_DNF, %-9s %23f',['TOTAL A PAGAR',MontoNeto]);
   WriteLn(myFile,strValor+'>' );//Cambio

   strValor:='';
   dmreportes.qryDescLineasDocF.Close;
   dmreportes.qryDescLineasDocF.Params[0].Value:=2;
   dmreportes.qryDescLineasDocF.Open;

   dmreportes.qryDetallePagos.Close;
   dmreportes.qryDetallePagos.Params[0].Value:=dmReportes.qryDatosVentaMasterNUMERO.Value;
   dmreportes.qryDetallePagos.Open;
   dmreportes.qryDetallePagos.First;
   if (dmreportes.qryDetallePagos.RecordCount  = 0) then
   begin
       //strValor:= 'PAGO_CF';
       //Write(myFile,Trim(strValor)+'|');//Tipo
       //strValor:= '1';//Efectivo
       //Write(myFile,Trim(strValor)+'|');//Tipo

       //Write(myFile,'<TEXTO_DNF, ' + dmreportes.qryDetallePagosDESCRIPCION.Value + '     ');

       if dmReportes.qryDatosVentaMasterFORMA_PAGO.Value = 7 then
       strValor := Format('<TEXTO_DNF, %-9s %27f',['OTROS 1',dmReportes.qryDatosVentaMasterMONTO_PAGADO.Value])
        else
       if dmReportes.qryDatosVentaMasterFORMA_PAGO.Value = 8 then
       strValor := Format('<TEXTO_DNF, %-9s %27f',['OTROS 2',dmReportes.qryDatosVentaMasterMONTO_PAGADO.Value])
       else
       strValor := Format('<TEXTO_DNF, %-9s %27f',['EFECTIVO',dmReportes.qryDatosVentaMasterMONTO_PAGADO.Value]);

       //if (dmReportes.qryDatosVentaMasterMONTO_PAGADO.Value = 0) And
       //(dmReportes.qryDatosVentaMasterFORMA_PAGO.Value in [7,8]) then //credito normal o directo
       //strValor:= Format('%8.2m', [dmReportes.qryDatosVentaMasterVALOR_TOTAL_DET.Value])
       //else
       //strValor:= Format('%8.2m', [dmReportes.qryDatosVentaMasterMONTO_PAGADO.Value]);

       //strValor:= Trim(RemoverPuntoYComa(strValor));
       WriteLn(myFile,strValor+'>');//Monto

       if dmreportes.qryDescLineasDocF.Locate('Item',1,[]) then
          strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
       else strValor:= '';
       if length(strValor) > 0 then
       WriteLn(myFile,'<TEXTO_DNF, ' + Trim(strValor)+'>');//Descripcion Extra #1

       if dmreportes.qryDescLineasDocF.Locate('Item',2,[]) then
          strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
       else strValor:= '';
       if length(strValor) > 0 then
       WriteLn(myFile,'<TEXTO_DNF, ' + Trim(strValor)+'>');//Descripcion Extra #2

       if dmreportes.qryDescLineasDocF.Locate('Item',3,[]) then
          strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
       else strValor:= '';

       if length(strValor) > 0 then
       WriteLn(myFile,'<TEXTO_DNF, ' + Trim(strValor)+'>');//Descripcion Extra #3      
   end else
   begin
     While Not dmreportes.qryDetallePagos.Eof do
     begin
       //strValor:= dmreportes.qryDetallePagosDESCRIPCION.Value;
       strValor:= Trim(RemoverPuntoYComa(strValor));
       strValor := Format('<TEXTO_DNF, %-9s %21f',
       [RemoverPuntoYComa(dmreportes.qryDetallePagosDESCRIPCION.Value),dmreportes.qryDetallePagosMONTO_PAGADO.Value]);
       WriteLn(myFile, strValor+'>');

       if dmreportes.qryDescLineasDocF.Locate('Item',1,[]) then
          strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
       else strValor:= '';
       if length(strValor) > 0 then
       WriteLn(myFile,'<TEXTO_DNF, ' + Trim(strValor)+'>');//Descripcion Extra #1

       if dmreportes.qryDescLineasDocF.Locate('Item',2,[]) then
          strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
       else strValor:= '';
       if length(strValor) > 0 then
       WriteLn(myFile,'<TEXTO_DNF, ' + Trim(strValor)+'>');//Descripcion Extra #2

       if dmreportes.qryDescLineasDocF.Locate('Item',3,[]) then
          strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
       else strValor:= '';

       if length(strValor) > 0 then
       WriteLn(myFile,'<TEXTO_DNF, ' + Trim(strValor)+'>');//Descripcion Extra #3
       dmreportes.qryDetallePagos.Next;
     end;
   end;
   strValor:='';
   if dmreportes.qryDatosVentaMasterMONTO_CAMBIO.Value > 0 then
   begin
     strValor := Format('<TEXTO_DNF, %-9s %27n',['CAMBIO',dmreportes.qryDatosVentaMasterMONTO_CAMBIO.Value]);
     WriteLn(myFile,strValor+'>' );//Cambio
   end;
   strValor:='';

   WriteLn(myFile,'<TEXTO_DNF, ' + '--------------------------------------'+'>');
   if Not dmReportes.qryDatosVentaMasterNUMERO_FACTURA.IsNull then
   begin
     //Writeln(myFile,'<AVANZA_PAPEL, 1000>');
     Write(myFile,'<TEXTO_DNF, Factura No.: ');
     strValor:= dmReportes.qryDatosVentaMasterNUMERO_FACTURA.AsString;
     WriteLn(myFile, strValor+'>');
   end else
   if Not dmReportes.qryDatosVentaMasterNUMERO_DOC_PAGO.IsNull then
   begin
     //Writeln(myFile,'<AVANZA_PAPEL, 1000>');
     Write(myFile,'<TEXTO_DNF, Factura No.: ');
     strValor:= dmReportes.qryDatosVentaMasterNUMERO_DOC_PAGO.AsString;
     WriteLn(myFile, strValor+'>');
   end;

   strValor := '<TEXTO_DNF, Nro. trn: '+dmreportes.qryDatosVentaMasterNUMERO.AsString;
   WriteLn(myFile,strValor+'>' );//Numero transaccion ventas master
   strValor:= '<CERRAR_DNF>';
   WriteLn(myFile,Trim(strValor));//CLOSE

   //Parametros para Pago Documento Fiscal

  //WriteLn(myfile,Format('%s %10n', ['Data driven', 1234.0]));
  //WriteLn(myfile,Format('%s %10n', ['Data driven', 234.486]));
  //WriteLn(myfile,Format('%s %10n', ['Data driven', 34.0]));
  CloseFile(myFile);

end;

procedure TfrmTestImpresoraFiscal.procDatosOKI_DBCR;
 var
   myFile : TextFile;
   text   : string;
   strValor: String;
   cant : integer;
   mto : real;
begin
  //<ABRIR_CF,”1 TIPO”,”2 CANT. COPIAS”,”3 LOGO”,”4 SUCURSAL”,”5 CAJA”,”6 NCF”,"7
  //RAZON SOCIAL","8 RNC",”9 RNC REFERENCIA”>

  AssignFile(myFile, ExtractFilePath(Application.ExeName)+'Files/Recibo'+
                      {dmReportes.qryDatosVentaMasterNUMERO.AsString+}'.txt');
   ReWrite(myFile);

   //Parametros para abrir Documento Fiscal
   strValor := '<ABRIR_CF';
   Write(myFile, trim(strValor)+'|');//abrir

   strValor := 'EXTENSION'; //1- tipo
   //qryDatosNCFTIPO_CF
   //‘4’ – Factura consumidor final exonera ITBIS.
   //‘5’ – Factura derecho crédito fiscal exonera ITBIS
   //  15	5	COMPROBANTE GUBERNAMENTAL
   //  14	5	REGISTRO REGIMEN ESPECIAL


   if (GlbTFiscalNCR = '14') or ((GlbTFiscalNCR = '15'))then
   strValor:='5' else
   strValor:='3'; 
   Write(myFile, strValor + ',');

   strValor := '0';//2- cant copias
   Write(myFile, Trim(strValor+'|'));

   strValor := '0';
   Write(myFile, Trim(strValor)+'|');//3-Logo

   //strValor := '';
   //Write(myFile, Trim(strValor)+'|');//Densidad

   strValor := InsertaCeroIzq(4, trim(GlbCodSucursal))+'|';//4-Sucursal
   Write(myFile, Trim(strValor));

   strValor := InsertaCeroIzq(4,dmReportes.qryDatosCajaImpUserCOD_CAJA.AsString)+'|';//5-Caja
   Write(myFile, Trim(strValor));

   if (Not dmReportes.qryDatosRepTranscxcIFiscalNUMERO_NCF.IsNull) then
   begin
     strValor := dmReportes.qryDatosRepTranscxcIFiscalNUMERO_NCF.Value; //6-ncf

     if (Length(strValor) = 11) then
     begin
       strValor:= '00000000'+strValor+'|';
     end else strValor:= strValor+'|';

   end else strValor := '';

   Write(myFile, Trim(strValor));//NCF

   if (Not dmReportes.qryDatosRepTranscxcIFiscalNOMBRE_CTE.IsNull) then
   nombreCteImpFiscal:= dmReportes.qryDatosRepTranscxcIFiscalNOMBRE_CTE.Value
   else
   if dmReportes.qryDatosRepTranscxcIFiscalNOMBRE_FACTURAR.IsNull then
   nombreCteImpFiscal:= ' ' else
   nombreCteImpFiscal:= dmReportes.qryDatosRepTranscxcIFiscalNOMBRE_FACTURAR.Value;
   nombreCteImpFiscal:= RemoverPuntoYComa(nombreCteImpFiscal); //7-razon social

   strValor:= nombreCteImpFiscal;

   if (UpperCase(strValor) = 'GENERICO') then
   strValor:=''
   else
   if ((UpperCase(strValor) = 'GENERICO') or (Pos('GENERICO',UpperCase(strValor)) > 0)) THEN
   strValor:= '';

   if Length(trim(strValor)) = 0 then
   Write(myFile, ' ,') else
   Write(myFile, trim(strValor)+'|');//Razon Social

   if (dmReportes.qryDatosRepTranscxcIFiscalRNC_NUMERO.IsNull) Or (Length(dmReportes.qryDatosRepTranscxcIFiscalRNC_NUMERO.Value) =0 ) then
   strValor:='' else
   strValor:= dmReportes.qryDatosRepTranscxcIFiscalRNC_NUMERO.Value+'|';//8-RNC Cliente

   //if Length(trim(strValor)) = 0 then
   //Write(myFile, ' ,') else

   strValor:= dmReportes.qryDatosRepTranscxcIFiscalNUM_NCF_AFECTADO.Value+'|';//8-RNC Cliente
   Write(myFile,Trim(strValor));//9-NCF Referencia
   WriteLn(myFile, ' >');
  //<ITEM_CF,”1 TIPO”,"2 DESC 1","3 DESC 2","4 DESC 3","5 DESC 4","6 DESC 5","7
  //DESC 6"," 8 DESC 7","9 DESC 8","10 DESC 9","11 DESC ITEM","12 CANT","13
  //MONTO","14 TASA">

  //<ITEM_CF,”1 TIPO”,"2 DESC 1","3 DESC 2","4 DESC 3","5 DESC 4","6 DESC 5","7
  //DESC 6"," 8 DESC 7","9 DESC 8","10 DESC 9","11 DESC ITEM","12 CANT","13
  //MONTO","14 TASA">

   dmreportes.qryDescLineasDocF.Close;
   dmreportes.qryDescLineasDocF.Params[0].Value:= 1;
   dmreportes.qryDescLineasDocF.Open;
   //Parametros para Item Documento Fiscal
   //dmreportes.qryDatosVentaDetalle.First;
   //Tipo de operación:‘0’ – Ítem de venta.‘1’ – Anulación de ítem de venta.‘2’ – Descuento por ítem.
   //‘3’ – Recargo por ítem. ‘4’ – Ítem de retorno. ‘5’ – Anulación de ítem de retorno.
   //While Not dmreportes.qryDatosVentaDetalle.Eof Do
   //Begin

     strValor:= '<ITEM_CF';
     Write(myFile, Trim(strValor)+'|');//Item cf
     strValor:='5';//Item de venta.

     if Not dmReportes.qryDatosRepTranscxcIFiscalTIPO_DOC.IsNull then //qryDatosVentaDetalleTIPO_VENTA.IsNull then
     strValor:=dmReportes.qryDatosRepTranscxcIFiscalTIPO_DOC.AsString;

     Write(myFile, Trim(strValor)+'|');//Item cf

     strValor:= dmReportes.qryDatosRepTranscxcIFiscalCONCEPTO.Value;
     strValor:= RemoverPuntoYComa(strValor); //(  strValor);
     if Length(trim(strValor)) = 0 then
     Write(myFile,' ,') else
     Write(myFile, Trim(strValor)+'|');//11- Descripcion Item
     
     if dmreportes.qryDescLineasDocF.Locate('Item',1,[]) then
     strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
     else strValor:= ' ';
     if Length(trim(strValor)) = 0 then
     Write(myFile,' ,') else
     Write(myFile, Trim(strValor)+'|');//2- Descripcion Extra #1

     if dmreportes.qryDescLineasDocF.Locate('Item',2,[]) then
     strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
     else strValor:= ' ';
     if Length(trim(strValor)) = 0 then
     Write(myFile,' ,') else
     Write(myFile, Trim(strValor)+'|');//3- Descripcion Extra #2

     if dmreportes.qryDescLineasDocF.Locate('Item',3,[]) then
     strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
     else strValor:= ' ';
     
     if Length(trim(strValor)) = 0 then
     Write(myFile,' ,') else
     Write(myFile, Trim(strValor)+'|');//4- Descripcion Extra #3

     if dmreportes.qryDescLineasDocF.Locate('Item',4,[]) then
     strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
     else strValor:= ' ';
     if Length(trim(strValor)) = 0 then
     Write(myFile,' ,') else
     Write(myFile, Trim(strValor)+'|');//5- Descripcion Extra #4

     if dmreportes.qryDescLineasDocF.Locate('Item',5,[]) then
     strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
     else strValor:= ' ';
     if Length(trim(strValor)) = 0 then
     Write(myFile,' ,') else
     Write(myFile, Trim(strValor)+'|');//6- Descripcion Extra #5

     if dmreportes.qryDescLineasDocF.Locate('Item',6,[]) then
     strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
     else strValor:= ' ';

     if Length(trim(strValor)) = 0 then
     Write(myFile,' ,') else
     Write(myFile, Trim(strValor)+'|');//7- Descripcion Extra #6

     if dmreportes.qryDescLineasDocF.Locate('Item',7,[]) then
     strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
     else strValor:= ' ';

     if Length(trim(strValor)) = 0 then
     Write(myFile,' ,') else
     Write(myFile, Trim(strValor)+'|');//8- Descripcion Extra #7

     if dmreportes.qryDescLineasDocF.Locate('Item',8,[]) then
     strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
     else strValor:= ' ';
     if Length(trim(strValor)) = 0 then
     Write(myFile,' ,') else
     Write(myFile, Trim(strValor)+'|');//9 -Descripcion Extra #8

     if EsDevolucion then
     cant := dmreportes.qryDatosVentaDetalleCANTIDAD.AsInteger * -1
     else
     cant:= dmreportes.qryDatosVentaDetalleCANTIDAD.AsInteger;

     strValor:= 'Cant. *' + IntToStr(cant)+'*';
     Write(myFile, Trim(strValor)+'|');//13- Cantidad
     if (dmreportes.qryDatosVentaDetalleCANTIDAD.Value - Trunc(dmreportes.qryDatosVentaDetalleCANTIDAD.Value)) > 0 then
     begin
       strValor:= FloatToStr(dmreportes.qryDatosVentaDetalleCANTIDAD.AsFloat * 1000);
     end else
     strValor:=dmreportes.qryDatosVentaDetalleCANTIDAD.AsString+'000';

     {if (dmreportes.qryDatosVentaDetalleCANTIDAD.Value - trunc(dmreportes.qryDatosVentaDetalleCANTIDAD.Value)) > 0 then
       begin
         strValor:=
         '00'+ExtraerEnteroString(DecimalSeparator,dmreportes.qryDatosVentaDetalleCANTIDAD.AsString)+
         ExtraerDecimalString(dmreportes.qryDatosVentaDetalleCANTIDAD.AsFloat)+'0'; //entero
       end else
       strValor:=dmreportes.qryDatosVentaDetalleCANTIDAD.AsString+'000';}

     //strValor:= IntToStr(cant)+'000';
     Write(myFile, Trim(strValor)+'|');//13- Cantidad

     strValor:= Format('%8.2f', [Abs(dmreportes.qryDatosRepTranscxcIFiscalVALOR_DOCUMENTO.Value)]);
     strValor:= RemoverPuntoYComa(strValor);
     Write(myFile, Trim(strValor)+'|');//12- Descripcion Precio

     if (GlbTFiscalNCR = '14') or ((GlbTFiscalNCR = '15'))then
     strValor:='0' else
     begin
       strValor :=Format('%8.2f', [FGlbPorcItbi(ExtraerFecha(dmReportes.qryDatosRepTranscxcIFiscalFECHA.Value),dmreportes.qryDatosVentaDetalleCODIGO_PROD.AsInteger)]);
       strValor:=RemoverPuntoYComa(strValor);
     end;

     Write(myFile, Trim(strValor));//14- Descripcion Tasa ITBIS
     WriteLn(myFile, ' >');
     //dmreportes.qryDatosVentaDetalle.Next;
   //end;

   //<DESC_REC_CF,”1 MODO, 2 DESCRIPCION”,”3 MONTO”>
   {
   if (dmReportes.qryDatosVentaMasterMONTO_DESCUENTO.Value > 0) then
   begin
     strValor:= '<DESC_REC_CF';
     Write(myFile, Trim(strValor)+'|');//Descripcion Extra #1

     strValor:= '0';//1-Descuento por Item
     //strValor:= RemoverPuntoYComa(strValor); //(  strValor);
     Write(myFile, Trim(strValor)+'|');//Descripcion Item

     strValor:= 'Descuento ';
     strValor:= RemoverPuntoYComa(strValor); //(  strValor);
     Write(myFile, Trim(strValor)+'|');//2-Descripcion Item

     strValor:= Format('%8.2f', [dmreportes.qryDatosVentaMasterMONTO_DESCUENTO.Value]);
     strValor:= RemoverPuntoYComa(strValor);
     Write(myFile, Trim(strValor));//3-Descripcion Precio
     WriteLn(myFile, ',0 >');
     WriteLn(myFile, '<SUBTOTAL_CF>');

   end;  }

  //<SUBTOTAL_CF>

  //<DESC_REC_CF,”1 MODO, 2 DESCRIPCION”,”3 MONTO”>
  //<DESC_REC_CF,”1 MODO, 2 DESCRIPCION”,”3 MONTO DESCUENTO EXENTO”,”4 MONTO DESCUENTO GRAVADO”>

  //<PAGO_CF,”1 MODO”,”2 TIPO”,"3 MONTO", “4 DESC 1” , “5 DESC 2” , “6 DESC 3”>
//Parametros para Pago Documento Fiscal

   dmreportes.qryDescLineasDocF.Close;
   dmreportes.qryDescLineasDocF.Params[0].Value:=2;
   dmreportes.qryDescLineasDocF.Open;

   //dmreportes.qryDetallePagos.Close;
   //dmreportes.qryDetallePagos.Params[0].Value:=dmReportes.qryDatosVentaMasterNUMERO.Value;
   //dmreportes.qryDetallePagos.Open;
   //dmreportes.qryDetallePagos.First;
   //if (dmreportes.qryDetallePagos.RecordCount  = 0) then
   //begin
       strValor:= '<PAGO_CF';
       Write(myFile,Trim(strValor)+'|');//Tipo
       
       //if EsDevolucion then
       //strValor:= '0' else
       //strValor:= '1';

       //if dmreportes.qryDetallePagosPAGO.IsNull then
       strValor:= '0';
       //else strValor:= dmreportes.qryDetallePagosPAGO.AsString;

       Write(myFile,Trim(strValor)+'|');//1-Pago

       //if dmReportes.qryDatosVentaMasterFORMA_PAGO.Value = 7 then
       //strValor:= '8' else
       //if dmReportes.qryDatosVentaMasterFORMA_PAGO.Value = 8 then
       //strValor:= '9'
       //else strValor:= '1';//Efectivo
       strValor:= '5'; //nota credito
       Write(myFile,Trim(strValor)+'|');//2-Tipo

       //if (dmReportes.qryDatosVentaMasterMONTO_PAGADO.Value = 0) And
       //(dmReportes.qryDatosVentaMasterFORMA_PAGO.Value in [7,8]) then //credito normal o directo
       //strValor:= Format('%8.2f', [Abs(dmReportes.qryDatosVentaMasterVALOR_TOTAL_DET.Value)])
       //else
       //strValor:= Format('%8.2f', [Abs(dmReportes.qryDatosVentaMasterMONTO_PAGADO.Value)]);

       strValor:= Format('%8.2f', [dmReportes.qryDatosRepTranscxcIFiscalVALOR_DOCUMENTO.Value]);
       strValor:= Trim(RemoverPuntoYComa(strValor));
       Write(myFile,strValor+'|');//3-Monto

       strValor:='';
       if dmreportes.qryDescLineasDocF.Locate('Item',1,[]) then
          strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
       else strValor:= '';

       if Length(trim(strValor)) = 0 then
       Write(myFile,' ,') else
       Write(myFile,Trim(strValor)+'|');//4- Descripcion Extra #1

       if dmreportes.qryDescLineasDocF.Locate('Item',2,[]) then
          strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
       else strValor:= '';

       if Length(trim(strValor)) = 0 then
       Write(myFile,' ,') else
       Write(myFile,Trim(strValor)+'|');//5- Descripcion Extra #2

       if dmreportes.qryDescLineasDocF.Locate('Item',3,[]) then
          strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
       else strValor:= '';

       if Length(trim(strValor)) = 0 then
       Write(myFile,' ,') else
       Write(myFile,Trim(strValor));//6- Descripcion Extra #3
       WriteLn(myFile, ' >');
   //end else
   {begin
     While Not dmreportes.qryDetallePagos.Eof do
     begin
       strValor:= '<PAGO_CF';
       Write(myFile,Trim(strValor)+'|');
       if dmreportes.qryDetallePagosPAGO.IsNull then
       strValor:= '0'
       else strValor:= dmreportes.qryDetallePagosPAGO.AsString;

       Write(myFile,Trim(strValor)+'|');//1-Modo

       strValor:= dmreportes.qryDetallePagosIFISCAL_TPAGO.AsString;
       Write(myFile,Trim(strValor)+'|');//2- Tipo Pago
       //strValor:= Format('%8.2f', [dmReportes.qryDatosVentaMasterMONTO_PAGADO.Value]);
       strValor:= Format('%8.2f', [dmreportes.qryDetallePagosMONTO_PAGADO.Value]);
       strValor:= Trim(RemoverPuntoYComa(strValor));
       Write(myFile,strValor+'|');//3- Monto
       //usado para amarrar la transaccion con datos pago
       //t strValor := dmReportes.qryDatosVentaMasterNUMERO.AsString;//'NUMEROTRN';
       //t Write(myFile, trim(strValor)+'|');//NUMERO TRANSACCION

       if dmreportes.qryDescLineasDocF.Locate('Item',1,[]) then
          strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
       else strValor:= '';

       if Length(trim(strValor)) = 0 then
       Write(myFile,' ,') else
       Write(myFile,Trim(strValor)+'|');//4- Descripcion Extra #1

       if dmreportes.qryDescLineasDocF.Locate('Item',2,[]) then
          strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
       else strValor:= '';

       if Length(trim(strValor)) = 0 then
       Write(myFile,' ,') else
       Write(myFile,Trim(strValor)+'|');//5- Descripcion Extra #2

       if dmreportes.qryDescLineasDocF.Locate('Item',3,[]) then
          strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
       else strValor:= '';

       if Length(trim(strValor)) = 0 then
       Write(myFile,' ,') else
       Write(myFile,Trim(strValor));//6- Descripcion Extra #3
       
       WriteLn(myFile, ' >');
       dmreportes.qryDetallePagos.Next;
     end;
   end;}
   //<CERRAR_CF,”1 MODIFICADOR, 2 NUM LINEA1”, ”3 DESC LINEA1”, ”4 NUM LINEA2”,
   //”5 DESC LINEA2”, ”6 NUM LINEA3”, ”7 DESC LINEA3”>

   strValor:= '<INFO_PAGOS_CF>';
   WriteLn(myFile,Trim(strValor));//
   if Not dmReportes.qryDatosRepTranscxcIFiscalNUMERO_FACT.IsNull then
   begin
     //Writeln(myFile,'<AVANZA_PAPEL, 1000>');
     Write(myFile,'<TEXTO_CF, Factura No.: ');
     strValor:= dmReportes.qryDatosRepTranscxcIFiscalNUMERO_FACT.AsString;
     WriteLn(myFile, strValor+'>');
   end;// else
   {if Not dmReportes.qryDatosVentaMasterNUMERO_DOC_PAGO.IsNull then
   begin
     //Writeln(myFile,'<AVANZA_PAPEL, 1000>');
     Write(myFile,'<TEXTO_CF,Factura No.: ');
     strValor:= dmReportes.qryDatosVentaMasterNUMERO_DOC_PAGO.AsString;
     WriteLn(myFile, strValor+'>');
   end;}
   
   strValor:='';
   //Parametros para Pago Documento Fiscal
   dmreportes.qryDescLineasDocF.Close;
   dmreportes.qryDescLineasDocF.Params[0].Value:=3;
   dmreportes.qryDescLineasDocF.Open;

   strValor := '<TEXTO_CF, Nro. Serie: ' + dmReportes.qryDatosRepTranscxcIFiscalSERIE.AsString; //dmreportes.qryDatosVentaMasterNUMERO.AsString;
   WriteLn(myFile,strValor+'>' );//Numero transaccion ventas master

   strValor:= '<CERRAR_CF';
   Write(myFile,Trim(strValor)+'|');//CLOSE
   strValor:= '1';//cortar papel
   Write(myFile,Trim(strValor)+'|');//1- Modificador

   strValor:='';
   if dmreportes.qryDescLineasDocF.Locate('Item',1,[]) then
   strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
   else strValor:= '';
   //Write(myFile,Trim(strValor)+'|');//2- Descripcion Cola Reemplazo #1
   if Length(strValor) > 0 then
   begin
     Write(myFile,Trim('100,'));
     Write(myFile,Trim(strValor)+'|');
   end else
   begin
     Write(myFile,Trim('000,'));//3-Desc Trailer #2
     Write(myFile,' ,');
   end;

   if dmreportes.qryDescLineasDocF.Locate('Item',2,[]) then
   strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
   else strValor:= '';

   if Length(strValor) > 0 then
   begin
     Write(myFile,Trim('200,'));
     Write(myFile,Trim(strValor)+'|');
   end else
   begin
     Write(myFile,Trim('000,'));//5-Desc Trailer #2
     Write(myFile,' ,');
   end;
   strValor:='';

   if dmreportes.qryDescLineasDocF.Locate('Item',3,[]) then
   strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
   else strValor:= '';

   if Length(strValor) > 0 then
   begin
     Write(myFile,Trim('300,'));//6- Desc Cola #3
     Write(myFile,Trim(strValor)+'|');
   end
   else
   begin
     Write(myFile,Trim('000,'));
     Write(myFile,' ');//6- Desc Cola #3
   end;
   strValor:= '';
   WriteLn(myFile, ' >');
   CloseFile(myFile);
end;

procedure TfrmTestImpresoraFiscal.btnreimprimeNotadeCreditoClick(Sender: TObject);
var
   myFile : TextFile;
   text   : string;
   strValor: String;
   tipoD : Integer;
   X, Count:Integer;
begin
  numStrTicket:=dmReportes.qryDatosVentaMasterNUMERO.Value;
  fpago:=dmReportes.qryDatosVentaMasterFORMA_PAGO.Value;

  if aborta then exit;
   if (GlbModeloImpresora = GLBIFISCALOKI407FP) then
   begin
     procDatosReimOKI;
     Exit;
   end;

   dmUsuarios.qryUsuarios.Close;
   dmUsuarios.qryUsuarios.Open;
   nombreEmpReimp:='';
   if dmUsuarios.qryUsuarios.Locate('CODIGO_EMPLEADO',dmReportes.qryDatosVentaMasterCOD_USR_CAJA.Value,[]) then
   begin
     nombreEmpReimp:=dmUsuarios.qryUsuariosNOMBRECOMPLETO.Value;
   end;
   AssignFile(myFile, GlbNombreFiletoPrint);
   ReWrite(myFile);

   dmReportes.qryDatosReimpDocFiscal.First;
   //Parametros para abrir Documento Fiscal
   if dmCompania.tblCompania.State = dsInactive then
   dmCompania.tblCompania.Open;

   Write(myFile, 'Encabezado0'+'|');//Encabezado
   WriteLn(myFile, Trim(RemoverPuntoYComa(GlbEncabezadoIFiscal)));

   Write(myFile, 'Encabezado1'+'|');
   if not dmDatos.qryMembreteLINEA1.IsNull then
   WriteLn(myFile, RemoverPuntoYComa(dmDatos.qryMembreteLINEA1.Value))
   else
   WriteLn(myFile, '');

   Write(myFile, 'Encabezado2'+'|');
   if not dmDatos.qryMembreteLINEA2.IsNull then
   Write(myFile, RemoverPuntoYComa(dmDatos.qryMembreteLINEA2.Value))
   else
   WriteLn(myFile, '');

   if not dmDatos.qryMembreteLINEA3.IsNull then
   WriteLn(myFile, RemoverPuntoYComa(dmDatos.qryMembreteLINEA3.Value))
   else
   WriteLn(myFile, '');

   strValor := 'CIA';
   Write(myFile, trim(strValor)+'|');//CIA
   strValor := dmCompania.tblCompaniaNOMBRE.Value;
   Write(myFile, trim(strValor)+'|');

   strValor := dmCompania.tblCompaniaRNC_NUMERO.Value;
   Write(myFile, trim(strValor)+'|');

   strValor := 'COMPROBANTE AUTORIZADO POR DGII';
   Write(myFile, trim(strValor)+'|');
   //dmcxc.qryRepTransCxcNDB_NCR
   strValor :=FormatDateTime('dd/mm/yyyy', dmcxc.qryRepTransCxcNDB_NCRFECHA.Value);
   Write(myFile, trim(strValor));
   strValor :=' '+FormatDateTime('HH:MM:SS', time)+'|';
   Write(myFile, strValor);

   strValor:= dmReportes.qryDatosReimpDocFiscalNIF.Value;
   Write(myFile, trim(strValor)+'|');//NIF

   if (Not dmcxc.qryRepTransCxcNDB_NCRNUM_NCF_AFECTADO.IsNull) then
   strValor := dmcxc.qryRepTransCxcNDB_NCRNUM_NCF_AFECTADO.Value + ','
   else strValor := '';
   WriteLN(myFile, Trim(strValor));//NCF AFECTADO

   //Fin cia
   strValor := 'OPEN_CF';
   Write(myFile, trim(strValor)+'|');//TIPO DOC

   strValor := 'EXTENSION';
   //tipoD := dmreportes.qryDatosReimpDocFiscalTIPO.Value - 1;
   //Write(myFile, Trim(dmreportes.qryTipoIFiscalTIPO_NCF_IFISCAL.AsString)+'|');
   Write(myFile, Trim(dmreportes.qryDatosVentaMasterTIPONCFIFISCAL.AsString)+'|');
   strValor := '';
   Write(myFile, Trim(strValor)+'|');//Logo

   strValor := '';
   Write(myFile, Trim(strValor)+'|');//Densidad

   strValor := InsertaCeroIzq(4, trim(GlbCodSucursal))+'|';//Sucursal
   Write(myFile, Trim(strValor));

   strValor := InsertaCeroIzq(4,dmReportes.qryDatosCajaImpUserCOD_CAJA.AsString)+'|';//Caja
   Write(myFile, Trim(strValor));

   if (Not dmcxc.qryRepTransCxcNDB_NCRNUMERO_NCF.IsNull) then
   begin
     strValor := dmcxc.qryRepTransCxcNDB_NCRNUMERO_NCF.Value;

     if (length(strValor) = 11) then
     begin
       strValor:= '00000000'+strValor+'|';
     end else strValor:= strValor+'|';

   end else strValor := '';

   Write(myFile, Trim(strValor));//NCF

   if (dmReportes.qryDatosVentaMasterFORMA_PAGO.Value = 6) then //'devolucion
   begin
     if Not dmreportes.qryNCFAfectadoNUMERO_NCF.IsNull then
     begin
       strValor :=  dmreportes.qryNCFAfectadoNUMERO_NCF.Value;
      if (length(strValor) = 11) then
      begin
        strValor:= '00000000'+strValor+'|';
      end else strValor:= strValor+'|';
     end;
   end else
   strValor := '';


   Write(myFile, Trim(strValor));//NCF AFECTADO

   if (Not dmcxc.qryRepTransCxcNDB_NCRNOMBRE_CTE.IsNull) then
   strValor:= dmcxc.qryRepTransCxcNDB_NCRNOMBRE_CTE.Value;
   strValor:= RemoverPuntoYComa(strValor);

   if (dmcxc.qryRepTransCxcNDB_NCRCODIGO_CLIENTE.Value = 0) Or
   (dmcxc.qryRepTransCxcNDB_NCRCODIGO_CLIENTE.IsNull) then
   strValor:='';

   if (strValor = '') and
   (dmReportes.qryDatosVentaMasterNOMBRE_CLIENTE_GENERAL.Value <> '') then
   strValor:=dmReportes.qryDatosVentaMasterNOMBRE_CLIENTE_GENERAL.Value;
   
   //dmReportes.qryDatosVentaMasterNOMBRE_COMPLETO.Value;
   if ((UpperCase(strValor) = 'GENERICO') or (Pos('GENERICO', UpperCase(strValor)) > 0)
   or (Pos('GENERICO',UpperCase(dmReportes.qryDatosVentaMasterNOMBRE_CLIENTE_GENERAL.Value)) > 0)) THEN
   strValor:='';

   Write(myFile, trim(strValor)+'|');//Razon Social
   if (dmcxc.qryRepTransCxcNDB_NCRRNC_NUMERO.IsNull) or
      (Length(dmcxc.qryRepTransCxcNDB_NCRRNC_NUMERO.Value) =0 ) then
   strValor:='' else
   strValor:= dmcxc.qryRepTransCxcNDB_NCRRNC_NUMERO.Value;//RNC Cliente

   if (Pos('GENERICO',UpperCase(dmReportes.qryDatosVentaMasterNOMBRE_CLIENTE_GENERAL.Value)) > 0) then
   strValor:='';

   Write(myFile,Trim(strValor));
   strValor:='|0';
   WriteLn(myFile,Trim(strValor));

   dmreportes.qryDescLineasDocF.Close;
   dmreportes.qryDescLineasDocF.Params[0].Value:= 1;
   dmreportes.qryDescLineasDocF.Open;
   //Parametros para Item Documento Fiscal
   //dmreportes.qryDatosVentaDetalle.First;
   dmcxc.qryRepTransCxcNDB_NCR.First;
   While Not dmcxc.qryRepTransCxcNDB_NCR.Eof Do
   Begin
     strValor:= 'ITEM_CF';
     Write(myFile, Trim(strValor)+'|');//Item cf
     strValor:= '0';//tipo
     Write(myFile, Trim(strValor)+'|');//Descripcion Item
     if dmreportes.qryDescLineasDocF.Locate('Item',1,[]) then
     strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
     else strValor:= '';
     Write(myFile, Trim(strValor)+'|');//Descripcion Extra #1
     if dmreportes.qryDescLineasDocF.Locate('Item',2,[]) then
     strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
     else strValor:= '';
     Write(myFile, Trim(strValor)+'|');//Descripcion Extra #2
     if dmreportes.qryDescLineasDocF.Locate('Item',3,[]) then
     strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
     else strValor:= '';
     Write(myFile, Trim(strValor)+'|');//Descripcion Extra #3
     if dmreportes.qryDescLineasDocF.Locate('Item',4,[]) then
     strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
     else strValor:= '';
     Write(myFile, Trim(strValor)+'|');//Descripcion Extra #4
     if dmreportes.qryDescLineasDocF.Locate('Item',5,[]) then
     strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
     else strValor:= '';
     Write(myFile, Trim(strValor)+'|');//Descripcion Extra #5
     if dmreportes.qryDescLineasDocF.Locate('Item',6,[]) then
     strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
     else strValor:= '';
     Write(myFile, Trim(strValor)+'|');//Descripcion Extra #6
     if dmreportes.qryDescLineasDocF.Locate('Item',7,[]) then
     strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
     else strValor:= '';
     Write(myFile, Trim(strValor)+'|');//Descripcion Extra #7
     if dmreportes.qryDescLineasDocF.Locate('Item',8,[]) then
     strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
     else strValor:= '';
     Write(myFile, Trim(strValor)+'|');//Descripcion Extra #8

     if dmreportes.qryDescLineasDocF.Locate('Item',9,[]) then
     strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
     else strValor:= '';
     Write(myFile, Trim(strValor)+'|');//Descripcion Extra #9

     strValor:= dmcxc.qryRepTransCxcNDB_NCRCONCEPTO.Value; //descripcion
     strValor:= RemoverPuntoYComa(strValor); //(  strValor);
     Write(myFile, Trim(strValor)+'|');//Descripcion Item

     strValor:= '1000';//cantidad 1 para nota credito o debito
     Write(myFile, Trim(strValor)+'|');//Descripcion Cantidad

     strValor:= Format('%8.2f', [dmcxc.qryRepTransCxcNDB_NCRVALOR_DOCUMENTO.Value]);//Precio
     strValor:= RemoverPuntoYComa(strValor);
     Write(myFile, Trim(strValor)+'|');//Descripcion Precio
     //qryDatosRepTranscxcIFiscal            

     if (GlbTFiscalNCR = '14') or ((GlbTFiscalNCR = '15'))then
     strValor:='0' else
     begin
       strValor :=Format('%8.2f', [FGlbPorcItbi(ExtraerFecha(dmcxc.qryRepTransCxcNDB_NCRFECHA.Value),-1)]);
       strValor:=RemoverPuntoYComa(strValor);
     end;

     WriteLn(myFile, Trim(strValor));//Descripcion Tasa ITBIS
     dmcxc.qryRepTransCxcNDB_NCR.Next;
   end;
   
   dmreportes.qryDescLineasDocF.Close;
   dmreportes.qryDescLineasDocF.Params[0].Value:=2;
   dmreportes.qryDescLineasDocF.Open;

   strValor:= 'PAGO_CF'+'|';
   Write(myFile,Trim(strValor));//Tipo

   //strValor:= '10';//otro
   //antes strValor:= '13';//nota credito
   strValor:= '';//nota credito
   Write(myFile,Trim(strValor)+'|');//Tipo

   strValor:= Format('%8.2f', [dmcxc.qryRepTransCxcNDB_NCRVALOR_DOCUMENTO.Value]);
   strValor:= Trim(RemoverPuntoYComa(strValor));
   Write(myFile,strValor+'|');//Monto

   strValor := dmcxc.qryRepTransCxcNDB_NCRNUM_DOC.AsString;//'NUMEROTRN';
   Write(myFile, trim(strValor)+'|');//NUMERO TRANSACCION

   if dmreportes.qryDescLineasDocF.Locate('Item',1,[]) then
   strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
   else strValor:= '';
   Write(myFile,Trim(strValor)+'|');//Descripcion Extra #1
   if dmreportes.qryDescLineasDocF.Locate('Item',2,[]) then
   strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
   else strValor:= '';
   Write(myFile,Trim(strValor)+'|');//Descripcion Extra #2
   if dmreportes.qryDescLineasDocF.Locate('Item',3,[]) then
   strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
   else strValor:= '';
   WriteLn(myFile,Trim(strValor));//Descripcion Extra #3

   //Parametros para Pago Documento Fiscal
   dmreportes.qryDescLineasDocF.Close;
   dmreportes.qryDescLineasDocF.Params[0].Value:=3;
   dmreportes.qryDescLineasDocF.Open;
   strValor:= 'CLOSE_CF';
   Write(myFile,Trim(strValor)+'|');//CLOSE
   strValor:='';
   if dmreportes.qryDescLineasDocF.Locate('Item',1,[]) then
   strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
   else strValor:= '';
   Write(myFile,Trim(strValor)+'|');//Descripcion Cola Reemplazo #1
   strValor:= '';
   Write(myFile,Trim(strValor)+'|');//Desc trailer #1
   if dmreportes.qryDescLineasDocF.Locate('Item',2,[]) then
   strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
   else strValor:= '';
   Write(myFile,Trim(strValor)+'|');//Desc Cola #2
   strValor:= '';
   Write(myFile,Trim(strValor)+'|');//Desc Trailer #2
   if dmreportes.qryDescLineasDocF.Locate('Item',3,[]) then
   strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
   else strValor:= '';

   //if (strValor = '') then
   //strValor:='Usr: ' +VarNombreUsuario;

   if (strValor = '') then
   begin
     if (nombreEmpReimp = '') then
     strValor:='Usr: ' +VarNombreUsuario
     else
     strValor:='Usr: ' +nombreEmpReimp;
   end;

   Write(myFile,Trim(strValor)+'|');//Desc Cola #3
   strValor:= '';   
   Write(myFile,Trim(strValor));  //Desc Trailer #3
       
   dmreportes.qryDescLineasDocF.Close;
   dmreportes.qryDescLineasDocF.Params[0].Value:=4;
   dmreportes.qryDescLineasDocF.Open;

   dmreportes.qryDescLineasDocF.Last;

   if dmreportes.qryDescLineasDocF.RecordCount = 0 then
   WriteLn(myFile,'')
   else
   Write(myFile,'|');

   if (dmreportes.qryDescLineasDocF.recordcount > 0) then
   begin
     //strValor:= 'COMENTARIOCIERRE';
     //Write(myFile,Trim(strValor)+'|');//CLOSE
     strValor:='';

     dmreportes.qryDescLineasDocF.Last;
     X := 1;
     Count := dmreportes.qryDescLineasDocF.RecordCount;
     dmreportes.qryDescLineasDocF.First;

     //Se aceptan hasta 40 lineas
     While Not dmreportes.qryDescLineasDocF.Eof Do
     begin
       if (dmreportes.qryDescLineasDocFSTATUS.Value = 'I') then
       begin
         X := X + 1;
         dmreportes.qryDescLineasDocF.Next;
         continue;
       end;
       if  x < count then
       begin
         if not dmreportes.qryDescLineasDocFDESCRIPCION.IsNull then
         strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
         else strValor:= '';
         Write(myFile,Trim(strValor)+'|');//Descripcion Cola Reemplazo #x
       end;

       if X = Count then
       begin
         if Not dmreportes.qryDescLineasDocFDESCRIPCION.IsNull then
         strValor := dmreportes.qryDescLineasDocFDESCRIPCION.Value
         else strValor := '';
         WriteLn(myFile,Trim(strValor));
       end;
       X := X + 1;
       dmreportes.qryDescLineasDocF.Next;
     end;
   end;

   CloseFile(myFile);
end;

procedure TfrmTestImpresoraFiscal.ProcesaEstadoImpresora(numeroTrnVta:Integer);
begin
  if (GlbActivaIFiscal = 0 ) then exit;
  if GlbPuerto = 4 then
  begin
    FiscalPrinter.CommPort:= $00000003;
  end;
  if GlbBaudRate = 9600 then
  FiscalPrinter.BaudRate:= $00000003;

  if not GLBIFiscalBusy and not  GLBIFiscalOnline then
  begin
    if FiscalPrinter.OpenPort then
    //StatusBar.Panels[0].Text:='Printer: ' + GetFiscalStatus
    //else
    begin
      //StatusBar.Panels[1].Text:='Status: ' + GetFiscalError;
      //StatusBar.Panels[0].Text:='Printer: ' + GetFiscalStatus;
    end;
  end else
  begin
    //StatusBar.Panels[1].Text:='Status: ' + GetFiscalError;
    //StatusBar.Panels[0].Text:='Printer: ' + GetFiscalStatus;
  end;
  CerrarPuerto;
end;

procedure TfrmTestImpresoraFiscal.FormCreate(Sender: TObject);
begin
  nombreEmpReimp:='';
  aborta:=False;
  dmDatos.qryMembrete.Close;
  dmDatos.qryMembrete.Params[0].Value:= glbCia_Key;
  dmDatos.qryMembrete.Open;
  if Assigned(frmProcVentaRapida) then
  frmProcVentaRapida.CerrarPuertoImpF;
end;

procedure TfrmTestImpresoraFiscal.ProcTicketAImprimir(numstr,
  fpago: integer);
begin
  dmreportes.tblTicket_params.Close;
  dmreportes.tblTicket_params.Open;
  if not dmreportes.tblTicket_params.Locate('FPAGO;NUMERO_TRN',
  vararrayof([fpago,numstr]),[]) then
  begin
    dmreportes.tblTicket_params.Insert;
    dmreportes.tblTicket_paramsFPAGO.Value:=fpago;
    dmreportes.tblTicket_paramsNUMERO_TRN.Value:=numstr;
  end;
end;

procedure TfrmTestImpresoraFiscal.btnImprDocFactElectronicaClick(Sender: TObject);
var
  Factura: TFacturaElectronica;
  Detalle: TDetalleFactura;
  ITBIS, Total: Currency;
  trnExiste : Boolean;
begin
  if dmReportes.qryDatosVentaMaster.RecordCount = 0 then
  begin
    Exit;
  end;

  if dmReportes.qryDatosVentaMasterNUMERO.IsNull then Exit;

  if dmReportes.qryDatosVentaMasterTIPO_NCF.IsNull then
  begin
    MessageDlg('Trn No. '+dmReportes.qryDatosVentaMasterNUMERO.AsString + '. Venta no tiene asignado tipo NCF, verifique',mtInformation,[mbok], 0);
    exit;
  end;

  frmProcVentaRapida.ProcInsFiscalCtrl(dmReportes.qryDatosVentaMasterNUMERO.Value,
  dmReportes.qryDatosVentaMasterFECHA.Value, trnExiste);
  if trnExiste then
  begin
    //raise Exception.Create('Trn #'+dmReportes.qryDatosVentaMasterNUMERO.AsSTring+'. Venta existe como procesada, verifque ');
    Exit;
  end;

  if (dmReportes.qryDatosVentaMasterTIPONCFIFISCAL.Value < 0) then
  begin
    raise Exception.Create('Tipo NCF no indicado, verifique.');
    Exit;
  end;

  // Crear una instancia de la factura
  Factura := TFacturaElectronica.Create;
  try
    // Asignar valores a las propiedades de TFacturaElectronica
    Factura.Comentarios := '';//'Comentarios AQUI';
    Factura.Condiciones := 5;
    Factura.Descuento   := dmFactura.qryVentaFacturaPORC_DESCUENTO.Value;
    Factura.FechaEmision:= ExtraerFecha(dmFactura.qryVentaFacturaFECHA.Value);
    Factura.FechaVencimientoSecuencia:=ExtraerFecha(dmFactura.qryVentaFacturaFECHAVENCENCF.Value);
    if dmFactura.qryVentaFacturaMONTO_TOTAL_ITBIS.Value > 0 then
    Factura.IndicadorMontoGravado:=1 else Factura.IndicadorMontoGravado:=0;
    Factura.Municipio:='Santo Domingo';
    Factura.NCF      :=dmFactura.qryVentaFacturaNUMERO_NCF.Value;
    Factura.NCFReferencia:='';
    if dmFactura.qryVentaFacturaFORMA_PAGO.Value = 7 then
    Factura.PagoACredito :=dmFactura.qryVentaFacturaVALOR_TOTAL_DET.Value
    else Factura.PagoACredito :=0;
    Factura.PagoBonosOCertificados:=0;
    Factura.PagoChequeTransferenciaDeposito:=0
    Factura.PagoEfectivo   :=
    Factura.PagoNotaCredito:=0;
    Factura.PagoOtros  :=0;
    Factura.PagoPermuta:=0;
    Factura.PagoTarjetaDebitoCredito:=0;
    Factura.Propina:=0;
    Factura.Provincia:='Distrito Nacional';
    Factura.RazonSocialDelComprador:='Empresa ABC S.A.';
    Factura.Recargo:=0;
    Factura.RNCDelComprador:=dmFactura.qryVentaFacturaRNC.Value;
    Factura.TipoDeFactura:=1;  // 1: Crédito fiscal
    Factura.TipoDeIngreso:=1;  // 1: Venta de bienes

    try
      // Crear una instancia del detalle de la factura
      dmReportes.qryDatosVentaDetalle.first;
      while not dmReportes.qryDatosVentaDetalle.Eof do
      begin
        Detalle := TDetalleFactura.Create(2,1,dmReportes.qryDatosVentaDetalleDESCRIPCION.Value,dmReportes.qryDatosVentaDetallePRECIO.Value,
        dmReportes.qryDatosVentaDetalleIDTASAITBIS.AsInteger,'1235','UNIDAD');
        Factura.AgregarDetalle(Detalle);
        Factura.GuardarFacturaEnArchivo('ejemploECF.txt');
        dmReportes.qryDatosVentaDetalle.Next;
      end;
    finally
      Detalle.Free;  // Liberar memoria del detalle
    end;

  finally
    Factura.Free;  // Liberar memoria de la factura
  end;
end;

end.
