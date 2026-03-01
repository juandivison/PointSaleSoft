unit UImprimeCotizaFiscal;

interface
 Uses Forms,Dbtables, db, Sysutils, windows, Dialogs, Controls,Printers,Classes,
    ShellAPI, DateUtils, Messages, Graphics,IniFiles, Variants, IBCustomDataSet,
    IBQuery, IBSQL, ExtCtrls, QuickRpt, QRCtrls,Grids;

    var

      xNumCotizacion : Integer;

      Procedure ImprimircotizaFiscal;
      Procedure PreparaDatosCotiza;
      procedure ImprimeDoc;
      procedure ProcUpdateNumDLinea(numPos:integer; numeroTrnVta:integer; tipo:Smallint);

implementation
  uses UDatModReportes, UDatModCotizafiscal,
   UGlobal, UDatModCompania, UDatModCxc, UCoreOCXFiscal,
   UDatosVentas,UVerDataImpIFiscal,UDatmodDatosGenerales;

Procedure ProcUpdateNumDLinea(numPos:integer; numeroTrnVta:integer; tipo:Smallint);
begin
  dmVentas.tblLineaComentario.Close;
  dmVentas.tblLineaComentario.Params[0].Value:= numPOS;
  dmVentas.tblLineaComentario.Open;
  dmVentas.tblLineaComentario.First;
  While Not dmVentas.tblLineaComentario.Eof do
  begin
    dmVentas.tblLineaComentario.Edit;
    dmVentas.tblLineaComentarioNUMERO_TRN.Value:=numeroTrnVta;
    dmVentas.tblLineaComentariotipo_ope.Value:= tipo;
    GlbSalvarQuery(dmVentas.tblLineaComentario);
    dmVentas.tblLineaComentario.Next;
  end;
end;

procedure Imprimedoc;
var
  archivo : String;
  parameters : String;
    strPLey : string;  
begin
  //Temoral jrd
  {
  if MessageDlg('Continua con impresion Cotizacion doc no fiscal?', mtWarning,[mbYes, mbNo],0) = mrno then
  exit; }
   if (GlbModeloImpresora = GLBIFISCALOKI407FP) then
   begin
     archivo:='C:\Proyectos\PointSaleSoftFiscal\PuntoVenta\Bin\epsSpoolerVmax.exe'; // if.bat - Shortcut';
     ShellExecute(0, 'Open', PChar(archivo), PChar(''), PChar(''), SW_Hide);
     Exit;
   end;
  archivo:=GlbExeIFiscal;
  if (Abs(dmcotizafiscal.qryDatosCotizaMasterPROPINALEGAL.Value) > 0) then
  strPLey :='Y'
  else strPLey :='N';
  GLBEsImp:=True;
  parameters:=Format('/PortComm=%s /Baudrate=%s /TipoDoc=DSVF /Status=ifOnlineN /CierreZ=False,89 /CierreX=False /Cierre=XX /ImprimeZ=0 /ImpCierreX=0 /Cancelar=False /ConfFile=DatosConfIFiscal.dat /FileToPrint=%s  /Encabezado0="%s" /FastFood=%s /pagaPropinaLey=%s',
  [IntToStr(GlbPuerto),IntToStr(GlbBaudRate),GlbNombreFiletoPrint,GlbEncabezadoIFiscal,GLBEsFastFoodString,strPLey]);
  ShellExecute(0, 'Open', PChar(archivo), PChar(parameters), PChar(''), SW_Hide);
  //Delay(6000)
end;

Procedure ImprimircotizaFiscal;
begin
  dmcotizafiscal.qryDatosCotizaMaster.Close;
  dmcotizafiscal.qryDatosCotizaMaster.Params[0].Value:= xNumCotizacion;
  dmcotizafiscal.qryDatosCotizaMaster.Open;

  dmcotizafiscal.qryDatosReimpDocFiscal.Close;
  dmcotizafiscal.qryDatosReimpDocFiscal.Params[0].Value:= xNumCotizacion;
  dmcotizafiscal.qryDatosReimpDocFiscal.Open;

  dmdatos.qryConfCajaXusuario.Close;
  dmdatos.qryConfCajaXusuario.Open;
  dmdatos.qryConfCajaXusuario.Locate('COD_EMPLEADO',VarUsuarioGlb,[]);

  dmReportes.qryDatosCajaImpUser.close;
  dmReportes.qryDatosCajaImpUser.Params[0].Value:= VarUsuarioGlb;
  dmReportes.qryDatosCajaImpUser.Open;
  dmReportes.qryDatosCajaImpUser.Last;
  dmReportes.qryDatosCajaImpUser.RecordCount;
  GlbNombreFiletoPrint:= Format('%s%s%s%s%s%s%s',[dmReportes.qryDatosCajaImpUserRUTA_TICKET.Value,'\Cotizacion',Trim(GlbCodSucursal),Trim(GlbModeloImpresora),
  IntToStr(VarUsuarioGlb), StrLeftPad(IntToStr(xNumCotizacion),8),'.txt']);
  if (dmcotizafiscal.qryDatosCotizaMaster.RecordCount = 1) then
  PreparaDatosCotiza else
  MessageDlg('Cotización '+IntToStr(xNumCotizacion)+' no encontrada, verifique.', mtWarning, [mbok],0);
end;

Procedure PreparaDatosCotiza;
var
   myFile : TextFile;
   text   : string;
   strValor: String;
   tipoD : Integer;
   SubMontoItbis : Currency;
   xPorcItbis: Currency;
   montoDestItem : Currency;
   montoPrecio : currency;
   x, count : integer;
   ln_added : boolean;
begin
  SubMontoItbis :=0;
  montoDestItem :=0;
  dmDatos.qryMembrete.Close;
  dmDatos.qryMembrete.Params[0].Value:= glbCia_Key;
  dmDatos.qryMembrete.Open;
  
  if (GlbNombreFiletoPrint = '') then
  begin
    raise Exception.Create('Archivo para impresión ticket no ha sido configurado, verifique.');
    Exit;
  end;
   if (GlbModeloImpresora = GLBIFISCALOKI407FP) then
   begin
     //procDatosReimOKI;
     Exit;
   end;
   AssignFile(myFile, GlbNombreFiletoPrint);
   ReWrite(myFile);

   dmcotizafiscal.qryDatosReimpDocFiscal.First;
   //Parametros para abrir Documento Fiscal

   Write(myFile, 'Encabezado0'+'|');//Encabezado
   WriteLn(myFile, Trim(RemoverPuntoYComa(GlbEncabezadoIFiscal)));

   Write(myFile, 'Encabezado1'+'|');
   if Not dmDatos.qryMembreteLINEA1.IsNull then
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
   strValor := RemoverPuntoYComa(dmCompania.tblCompaniaNOMBRE.Value);
   Write(myFile, trim(strValor)+'|');

   strValor := dmCompania.tblCompaniaRNC_NUMERO.Value;
   Write(myFile, trim(strValor)+'|');

   strValor := '****DOCUMENTO NO FISCAL****';
   Write(myFile, trim(strValor)+'|');

   strValor :=FormatDateTime('dd/mm/yyyy', dmcotizafiscal.qryDatosReimpDocFiscalFECHA.Value);
   Write(myFile, trim(strValor));
   strValor :=' '+FormatDateTime('HH:MM:SS', time)+'|';
   Write(myFile, strValor);

   strValor := '';//dmcotizafiscal.qryDatosReimpDocFiscalNIF.Value;
   WriteLn(myFile, trim(strValor)+'|');//NIF

   //Fin cia
   strValor := 'OPEN_CF';
   Write(myFile, trim(strValor)+'|');//TIPO DOC

   strValor := 'EXTENSION';
   tipoD := 99;//dmReportes.qryDatosCotizaMasterTIPONCFIFISCAL.Value;// -1;

   if (GlbEsPrecuenta) then
   tipoD := 88; //Precuenta

   if (tipoD < 0) then
   tipoD := 0;
   //dmcotizafiscal.qryDatosReimpDocFiscalTIPO.Value - 1;

   Write(myFile, Trim(intToStr(tipoD))+'|');

   strValor := '';
   Write(myFile, Trim(strValor)+'|');//Logo

   strValor := '';
   Write(myFile, Trim(strValor)+'|');//Densidad

   strValor := InsertaCeroIzq(4, trim(GlbCodSucursal))+'|';//Sucursal
   Write(myFile, Trim(strValor));

   strValor := InsertaCeroIzq(4,dmReportes.qryDatosCajaImpUserCOD_CAJA.AsString)+'|';//Caja
   Write(myFile, Trim(strValor));

   //if (not dmcotizafiscal.qryDatosReimpDocFiscalNUMERO_NCF.IsNull) then
   //strValor := dmcotizafiscal.qryDatosReimpDocFiscalNUMERO_NCF.Value+'|'
   //else
   strValor := '|';

   Write(myFile, Trim(strValor));//NCF

   strValor := '|';
   Write(myFile, Trim(strValor));//NCF Afectado

   if (Not dmcotizafiscal.qryDatosReimpDocFiscalNombrecliente.IsNull) then
   strValor:= RemoverPuntoYComa(dmcotizafiscal.qryDatosReimpDocFiscalNombrecliente.Value)
   else
   if dmcotizafiscal.qryDatosReimpDocFiscalNombrecliente.IsNull then
   strValor:= 'Al Portador' else
   strValor:= dmcotizafiscal.qryDatosReimpDocFiscalNombrecliente.Value;
   strValor:= RemoverPuntoYComa(strValor);


   Write(myFile, trim(strValor)+'|');//Razon Social

   if (dmcotizafiscal.qryDatosReimpDocFiscalRNC.IsNull) or (Length(dmcotizafiscal.qryDatosReimpDocFiscalRNC.Value) =0 ) then
   strValor:='' else
   strValor:= dmcotizafiscal.qryDatosReimpDocFiscalRNC.Value;//RNC Cliente
   Write(myFile,Trim(strValor));
   //Copias
   WriteLn(myFile,'|1');

   dmcotizafiscal.qryDescLineas.Close;
   dmcotizafiscal.qryDescLineas.Params[0].Value:= 1;
   dmcotizafiscal.qryDescLineas.Open;

   if (dmcotizafiscal.qryDatosReimpDocFiscalDet.Params[0].Value = 0) then
   begin
     dmcotizafiscal.qryDatosReimpDocFiscalDet.Close;
     dmcotizafiscal.qryDatosReimpDocFiscalDet.Params[0].Value:= dmcotizafiscal.qryDatosReimpDocFiscalNUMERO.Value;
     dmcotizafiscal.qryDatosReimpDocFiscalDet.Open;
   end;
   //Parametros para Item Documento Fiscal
   dmcotizafiscal.qryDatosReimpDocFiscalDet.First;
   While Not dmcotizafiscal.qryDatosReimpDocFiscalDet.Eof Do
   Begin
     //if dmcotizafiscal.qryDatosReimpDocFiscalDetITBIS_FISCAL_DET.Value > 0 then
     //SubMontoItbis:=SubMontoItbis + dmcotizafiscal.qryDatosReimpDocFiscalDetITBIS_FISCAL_DET.Value
     //else
     SubMontoItbis:=SubMontoItbis + dmcotizafiscal.qryDatosReimpDocFiscalDetITBI_DET.Value;

     if (dmcotizafiscal.qryDatosReimpDocFiscalDetTIPO_VENTA.Value = 2) then
     SubMontoItbis:=SubMontoItbis - dmcotizafiscal.qryDatosReimpDocFiscalDetITBI_DET.Value;

     if (dmcotizafiscal.qryDatosReimpDocFiscalDetTIPO_VENTA.Value = 3) then //RECARGO
     strValor:= 'RECARGO_ITEM'
     else
     strValor:= 'ITEM_CF';
     Write(myFile, Trim(strValor)+'|');//Descripcion Extra #1
     strValor:='0';
     if Not dmcotizafiscal.qryDatosReimpDocFiscalDetTIPO_VENTA.IsNull then
     strValor:=dmcotizafiscal.qryDatosReimpDocFiscalDetTIPO_VENTA.AsString;
     Write(myFile, Trim(strValor)+'|');//Tipo Venta

     strValor:= '';
     if dmcotizafiscal.qryDescLineas.Locate('Item',1,[]) then
     strValor := dmcotizafiscal.qryDescLineasDESCRIPCION.Value
     else strValor:= '';
     Write(myFile, Trim(strValor)+'|');//Descripcion Extra #1
     if dmcotizafiscal.qryDescLineas.Locate('Item',2,[]) then
     strValor := dmcotizafiscal.qryDescLineasDESCRIPCION.Value
     else strValor:= '';
     Write(myFile, Trim(strValor)+'|');//Descripcion Extra #2
     if dmcotizafiscal.qryDescLineas.Locate('Item',3,[]) then
     strValor := dmcotizafiscal.qryDescLineasDESCRIPCION.Value
     else strValor:= '';
     Write(myFile, Trim(strValor)+'|');//Descripcion Extra #3
     if dmcotizafiscal.qryDescLineas.Locate('Item',4,[]) then
     strValor := dmcotizafiscal.qryDescLineasDESCRIPCION.Value
     else strValor:= '';
     Write(myFile, Trim(strValor)+'|');//Descripcion Extra #4
     if dmcotizafiscal.qryDescLineas.Locate('Item',5,[]) then
     strValor := dmcotizafiscal.qryDescLineasDESCRIPCION.Value
     else strValor:= '';
     Write(myFile, Trim(strValor)+'|');//Descripcion Extra #5
     if dmcotizafiscal.qryDescLineas.Locate('Item',6,[]) then
     strValor := dmcotizafiscal.qryDescLineasDESCRIPCION.Value
     else strValor:= '';
     Write(myFile, Trim(strValor)+'|');//Descripcion Extra #6
     if dmcotizafiscal.qryDescLineas.Locate('Item',7,[]) then
     strValor := dmcotizafiscal.qryDescLineasDESCRIPCION.Value
     else strValor:= '';
     Write(myFile, Trim(strValor)+'|');//Descripcion Extra #7
     if dmcotizafiscal.qryDescLineas.Locate('Item',8,[]) then
     strValor := dmcotizafiscal.qryDescLineasDESCRIPCION.Value
     else strValor:= '';
     Write(myFile, Trim(strValor)+'|');//Descripcion Extra #8
     strValor:='';
     if dmcotizafiscal.qryDescLineas.Locate('Item',9,[]) then
     strValor := dmcotizafiscal.qryDescLineasDESCRIPCION.Value
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
     strValor:= dmcotizafiscal.qryDatosReimpDocFiscalDetDESCRIPCION.Value;
     strValor:= RemoverPuntoYComa(strValor); //(  strValor);
     Write(myFile, Trim(strValor)+'|');//Descripcion Item

     strValor:= dmcotizafiscal.qryDatosReimpDocFiscalDetCANTIDAD.AsString+'000';

     if (Abs(dmcotizafiscal.qryDatosReimpDocFiscalDetCANTIDAD.Value) - trunc(Abs(dmcotizafiscal.qryDatosReimpDocFiscalDetCANTIDAD.Value))) > 0 then
     begin
       strValor:= FloatToStr(Abs(dmcotizafiscal.qryDatosReimpDocFiscalDetCANTIDAD.AsFloat) * 1000);
     end else
     strValor:=dmcotizafiscal.qryDatosReimpDocFiscalDetCANTIDAD.AsString+'000';

     strValor:= StringReplace(strValor,'-','',[]);
     Write(myFile, Trim(strValor)+'|');//Descripcion Cantidad

     montoPrecio := GlbCalcularPrecio(dmcotizafiscal.qryDatosReimpDocFiscalDetPRECIO.Value,
     dmcotizafiscal.qryDatosReimpDocFiscalDetCODIGO_PROD.AsInteger);

     if (ABS(montoPrecio) = 0 ) then
     montoPrecio:= dmcotizafiscal.qryDatosReimpDocFiscalDetPRECIO.Value;

     if (dmcotizafiscal.qryDatosReimpDocFiscalDetCANTIDAD.Value > 1) then
     strValor:= Format('%8.2f', [1 *
                                 montoPrecio])
     else
     strValor:= Format('%8.2f', [montoPrecio]);

     strValor:= StringReplace(strValor,'-','',[]);
     strValor:= RemoverPuntoYComa(strValor);
     Write(myFile, Trim(strValor)+'|');//Descripcion Precio
     GlbSimboloTasaITBIS := '';
     if (Abs(dmcotizafiscal.qryDatosReimpDocFiscalDetITBI_DET.Value) > 0)
        //or (Abs(dmcotizafiscal.qryDatosReimpDocFiscalDetITBIS_FISCAL_DET.Value) > 0)
        then
     begin
       //t dmcotizafiscal.qryDatosReimpDocFiscalDetCANTIDAD.Value * dmcotizafiscal.qryDatosReimpDocFiscalDetPRECIO.Value
       xPorcItbis := FGlbPorcItbi(ExtraerFecha(dmcotizafiscal.qryDatosReimpDocFiscalFECHA.Value),dmcotizafiscal.qryDatosReimpDocFiscalDetCODIGO_PROD.AsInteger);

       montoPrecio := GlbCalcularPrecio(dmcotizafiscal.qryDatosReimpDocFiscalDetPRECIO.Value,
       dmcotizafiscal.qryDatosReimpDocFiscalDetCODIGO_PROD.AsInteger);

       if (ABS(montoPrecio) = 0 ) then
       montoPrecio:= dmcotizafiscal.qryDatosReimpDocFiscalDetPRECIO.Value;

       if (xPorcItbis > 0) then
       strValor := Format('%8.2f', [((dmcotizafiscal.qryDatosReimpDocFiscalDetCANTIDAD.Value * montoPrecio) *
                   (xPorcItbis / (1 + xPorcItbis/100))) / 100])
       else
       strValor := '0';

       //t if (dmcotizafiscal.qryDatosReimpDocFiscalDetITBIS_FISCAL_DET.Value > 0) then
       //t strValor := Format('%8.2f', [dmcotizafiscal.qryDatosReimpDocFiscalDetITBIS_FISCAL_DET.Value])
       //t else
       //t strValor := Format('%8.2f', [dmcotizafiscal.qryDatosReimpDocFiscalDetITBI_DET.Value]);

       strValor := RemoverPuntoYComa(strValor);
       Write(myFile, Trim(strValor)+'|');
       strValor :=Format('%8.2f', [FGlbPorcItbi(ExtraerFecha(dmcotizafiscal.qryDatosReimpDocFiscalFECHA.Value),dmcotizafiscal.qryDatosReimpDocFiscalDetCODIGO_PROD.AsInteger)]);
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
     if (Abs(dmcotizafiscal.qryDatosReimpDocFiscalDetPORC_DESC_ITEM.Value) > 0) then
     begin
       strValor:= 'DESCUENTO_ITEM';
       Write(myFile, Trim(strValor)+'|');//Descripcion Extra #1
       strValor:='0';
       //if Not dmcotizafiscal.qryDatosReimpDocFiscalDetTIPO_VENTA.IsNull then
       strValor:='2';//dmcotizafiscal.qryDatosReimpDocFiscalDetTIPO_VENTA.AsString;
       Write(myFile, Trim(strValor)+'|');//Tipo Venta

       strValor:= '';
       if dmcotizafiscal.qryDescLineas.Locate('Item',1,[]) then
          strValor := dmcotizafiscal.qryDescLineasDESCRIPCION.Value
       else strValor:= '';
       Write(myFile, Trim(strValor)+'|');//Descripcion Extra #1
       if dmcotizafiscal.qryDescLineas.Locate('Item',2,[]) then
          strValor := dmcotizafiscal.qryDescLineasDESCRIPCION.Value
       else strValor:= '';
       Write(myFile, Trim(strValor)+'|');//Descripcion Extra #2
       if dmcotizafiscal.qryDescLineas.Locate('Item',3,[]) then
          strValor := dmcotizafiscal.qryDescLineasDESCRIPCION.Value
       else strValor:= '';
        Write(myFile, Trim(strValor)+'|');//Descripcion Extra #3
        if dmcotizafiscal.qryDescLineas.Locate('Item',4,[]) then
        strValor := dmcotizafiscal.qryDescLineasDESCRIPCION.Value
        else strValor:= '';
        Write(myFile, Trim(strValor)+'|');//Descripcion Extra #4
        if dmcotizafiscal.qryDescLineas.Locate('Item',5,[]) then
           strValor := dmcotizafiscal.qryDescLineasDESCRIPCION.Value
        else strValor:= '';
        Write(myFile, Trim(strValor)+'|');//Descripcion Extra #5
        if dmcotizafiscal.qryDescLineas.Locate('Item',6,[]) then
        strValor := dmcotizafiscal.qryDescLineasDESCRIPCION.Value
        else strValor:= '';
        Write(myFile, Trim(strValor)+'|');//Descripcion Extra #6
        if dmcotizafiscal.qryDescLineas.Locate('Item',7,[]) then
        strValor := dmcotizafiscal.qryDescLineasDESCRIPCION.Value
        else strValor:= '';
        Write(myFile, Trim(strValor)+'|');//Descripcion Extra #7
        if dmcotizafiscal.qryDescLineas.Locate('Item',8,[]) then
        strValor := dmcotizafiscal.qryDescLineasDESCRIPCION.Value
        else strValor:= '';
        Write(myFile, Trim(strValor)+'|');//Descripcion Extra #8
        strValor:='';
        if dmcotizafiscal.qryDescLineas.Locate('Item',9,[]) then
        strValor := dmcotizafiscal.qryDescLineasDESCRIPCION.Value
        else strValor:= '';
        Write(myFile, Trim(strValor)+'|');//Descripcion Extra #9

        strValor:= dmcotizafiscal.qryDatosReimpDocFiscalDetDESCRIPCION.Value;
        strValor:= RemoverPuntoYComa(strValor); //(  strValor);
        Write(myFile, Trim(strValor)+'|');//Descripcion Item

        //strValor:= dmcotizafiscal.qryDatosReimpDocFiscalDetCANTIDAD.AsString+'000';

        if (Abs(dmcotizafiscal.qryDatosReimpDocFiscalDetCANTIDAD.Value) - trunc(Abs(dmcotizafiscal.qryDatosReimpDocFiscalDetCANTIDAD.Value))) > 0 then
        begin
          strValor:= FloatToStr(Abs(dmcotizafiscal.qryDatosReimpDocFiscalDetCANTIDAD.AsFloat) * 1000);
        end else
        strValor:=dmcotizafiscal.qryDatosReimpDocFiscalDetCANTIDAD.AsString+'000';

        strValor:= StringReplace(strValor,'-','',[]);
        Write(myFile, Trim(strValor)+'|');//Descripcion Cantidad
        montoDestItem:=montoDestItem + dmcotizafiscal.qryDatosReimpDocFiscalDetMONTO_DESC_ITEM.Value/dmcotizafiscal.qryDatosReimpDocFiscalDetCANTIDAD.Value;
        strValor:= Format('%8.2f', [dmcotizafiscal.qryDatosReimpDocFiscalDetMONTO_DESC_ITEM.Value/dmcotizafiscal.qryDatosReimpDocFiscalDetCANTIDAD.Value]);
        strValor:= StringReplace(strValor,'-','',[]);
        strValor:= RemoverPuntoYComa(strValor);
        Write(myFile, Trim(strValor)+'|');//Descripcion Precio
        GlbSimboloTasaITBIS := '';
     //if (dmcotizafiscal.qryDatosReimpDocFiscalDetITBI_DET.Value > 0) or
     //   (dmcotizafiscal.qryDatosReimpDocFiscalDetITBIS_FISCAL_DET.Value > 0) then
     //begin
       //if (dmcotizafiscal.qryDatosReimpDocFiscalDetITBIS_FISCAL_DET.Value > 0) then
       //strValor := Format('%8.2f', [dmcotizafiscal.qryDatosReimpDocFiscalDetITBIS_FISCAL_DET.Value])
       //else
       //t strValor := Format('%8.2f', [dmcotizafiscal.qryDatosReimpDocFiscalDetPORC_DESC_DET.Value -
       //t                              dmcotizafiscal.qryDatosReimpDocFiscalDetITBI_DET.Value]);

       xPorcItbis := FGlbPorcItbi(ExtraerFecha(dmcotizafiscal.qryDatosReimpDocFiscalFECHA.Value),dmcotizafiscal.qryDatosReimpDocFiscalDetCODIGO_PROD.AsInteger);

       if (xPorcItbis > 0) then
       strValor := Format('%8.2f', [(dmcotizafiscal.qryDatosReimpDocFiscalDetMONTO_DESC_ITEM.Value * (xPorcItbis/(1+xPorcItbis/100))/100)])
       else
       strValor := '0';
       strValor := RemoverPuntoYComa(strValor);
       Write(myFile, Trim(strValor)+'|');
       strValor :=Format('%8.2f', [FGlbPorcItbi(ExtraerFecha(dmcotizafiscal.qryDatosReimpDocFiscalFECHA.Value),dmcotizafiscal.qryDatosReimpDocFiscalDetCODIGO_PROD.AsInteger)]);
       strValor:=RemoverPuntoYComa(strValor);
      // end else
      // begin
      //   strValor := Format('%8.2f', [0.00]);
    //   strValor:= RemoverPuntoYComa(strValor);
    //   Write(myFile, Trim(strValor)+'|');
    //   strValor:='0';
    // end;
     Write(myFile, Trim(strValor)+'|');//Descripcion Tasa ITBIS
     if (GlbSimboloTasaITBIS <> '') then
     WriteLn(myFile, Trim(GlbSimboloTasaITBIS))
     else
     WriteLn(myFile, 'E');
     end;
     //**********************end descuento a nivel de item
     dmcotizafiscal.qryDatosReimpDocFiscalDet.Next;
   end;

   strValor:= 'SUBTOTAL_CF';
   Write(myFile, Trim(strValor)+'|');
   strValor:= Format('%8.2f', [SubMontoItbis]);
   strValor:= StringReplace(strValor,'-','',[]);
   strValor:= RemoverPuntoYComa(strValor);
   Write(myFile, Trim(strValor)+'|');

   strValor:= Format('%8.2f', [dmcotizafiscal.qryDatosReimpDocFiscalMONTO_BRUTO.Value - montoDestItem]);
    //- dmcotizafiscal.qryDatosReimpDocFiscalMONTO_DESCUENTO.Value]);

    if (dmcotizafiscal.qryDatosReimpDocFiscalMONTO_DESCUENTO.Value > 0)
   And (dmcotizafiscal.qryDatosReimpDocFiscalPORC_DESCUENTO.Value = 0) then //descuento global
   strValor:= Format('%8.2f', [dmcotizafiscal.qryDatosReimpDocFiscalTOTAL_BRUTO.Value])
   else
   strValor:= Format('%8.2f', [dmcotizafiscal.qryDatosReimpDocFiscalMONTO_BRUTO.Value]);

   if (dmcotizafiscal.qryDatosReimpDocFiscalMONTO_DESCUENTO.Value > 0) and
      (dmcotizafiscal.qryDatosReimpDocFiscalPORC_DESCUENTO.Value = 0)  then //descuento a nivel de item
   strValor:= Format('%8.2f', [dmcotizafiscal.qryDatosReimpDocFiscalMONTO_BRUTO.Value]);

   strValor:= RemoverPuntoYComa(strValor);
   WriteLN(myFile, Trim(strValor));

   if (dmcotizafiscal.qryDatosReimpDocFiscalMONTO_DESCUENTO.Value > 0)
   And (dmcotizafiscal.qryDatosReimpDocFiscalPORC_DESCUENTO.Value > 0) then
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
     strValor:= Format('%8.2f', [dmcotizafiscal.qryDatosReimpDocFiscalMONTO_TOTAL_ITBIS.Value]);
     strValor:= RemoverPuntoYComa(strValor); //(  strValor);
     Write(myFile, Trim(strValor)+'|');//Monto bruto itbis

     strValor:= Format('%8.2f', [dmcotizafiscal.qryDatosReimpDocFiscalMONTO_DESCUENTO.Value]);
     strValor:= RemoverPuntoYComa(strValor);
     Write(myFile, Trim(strValor)+'|');//Descripcion Precio

     if (dmcotizafiscal.qryDatosReimpDocFiscalDetITBI_DET.Value = 0) then
     WriteLn(myFile, '0')
     else
     begin
       strValor :=Format('%8.2f', [FGlbPorcItbi(ExtraerFecha(dmcotizafiscal.qryDatosReimpDocFiscalFECHA.Value),dmcotizafiscal.qryDatosReimpDocFiscalDetCODIGO_PROD.AsInteger)]);
       strValor:=RemoverPuntoYComa(strValor);
       WriteLn(myFile, Trim(strValor));//Descripcion Tasa ITBIS
     end;
   end;
   if (Abs(dmcotizafiscal.qryDatosReimpDocFiscalMONTO_RECARGO.Value) > 0) then
   begin
     //strValor:= 'SUBTOTAL_CF';
     //WriteLn(myFile, Trim(strValor));//0

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

     strValor:= Format('%8.2f', [dmcotizafiscal.qryDatosReimpDocFiscalMONTO_RECARGO.Value]);
     strValor:= StringReplace(strValor,'-','',[]);
     strValor:= RemoverPuntoYComa(strValor);
     Write(myFile, Trim(strValor)+'|');//Descripcion Precio

     strValor :='0';
     WriteLn(myFile, Trim(strValor));
   end;

   if (dmcotizafiscal.qryDatosCotizaMasterPROPINA.Value > 0) AND (GLBEsFastFood) then
   begin
     strValor:= 'PROPINA_CF'+'|';
     Write(myFile, Trim(strValor));//0

     strValor:= Format('%8.2f', [dmcotizafiscal.qryDatosCotizaMasterPropina.Value]);
     strValor:= RemoverPuntoYComa(strValor);
     Write(myFile, Trim(strValor));
   end;

   strValor:= 'TOTAL_CF';
   Write(myFile, Trim(strValor)+'|');
   strValor:= Format('%8.2f', [dmcotizafiscal.qryDatosReimpDocFiscalMONTO_ITBIS.Value]);
   strValor:= RemoverPuntoYComa(strValor);
   Write(myFile, Trim(strValor)+'|');

   if (Not dmcotizafiscal.qryDatosCotizaMasterPROPINALEGAL.IsNull) then
   begin
     strValor:= Format('%8.2f', [dmcotizafiscal.qryDatosCotizaMasterPROPINALEGAL.Value]);

     strValor:= RemoverPuntoYComa(strValor);
     Write(myFile, Trim(strValor),'|');
   end else
   begin
     strValor:= Format('%8.2f', [0.00]);

     strValor:= RemoverPuntoYComa(strValor);
     Write(myFile, Trim(strValor),'|');
   end;

   if (dmcotizafiscal.qryDatosReimpDocFiscalMONTO_EXONERADO_ITBIS.Value = 0)
   AND (dmcotizafiscal.qryDatosReimpDocFiscalMONTO_RECARGO.Value = 0)
   AND (dmcotizafiscal.qryDatosReimpDocFiscalMONTO_DESCUENTO.Value = 0) then
    strValor:= Format('%8.2f', [dmcotizafiscal.qryDatosReimpDocFiscalTOTAL_NETO.Value])
   else
   if (Abs(dmcotizafiscal.qryDatosReimpDocFiscalMONTO_EXONERADO_ITBIS.Value) > 0)
   OR (Abs(dmcotizafiscal.qryDatosReimpDocFiscalMONTO_RECARGO.Value) > 0)
   OR (Abs(dmcotizafiscal.qryDatosReimpDocFiscalMONTO_DESCUENTO.Value) >0) then
   begin
     if (dmcotizafiscal.qryDatosReimpDocFiscalMONTO_EXONERADO_ITBIS.Value = 0) then
     strValor:= Format('%8.2f', [dmcotizafiscal.qryDatosReimpDocFiscalTOTAL_NETO.Value])
     else
     strValor:= Format('%8.2f', [dmcotizafiscal.qryDatosReimpDocFiscalTOTAL_NETO.Value+dmcotizafiscal.qryDatosReimpDocFiscalMONTO_EXONERADO_ITBIS.Value])
   end
   else
   strValor:= Format('%8.2f', [dmcotizafiscal.qryDatosReimpDocFiscalTOTAL_NETO.Value]);

   strValor:= RemoverPuntoYComa(strValor);
   WriteLN(myFile, Trim(strValor));
   if (Abs(dmcotizafiscal.qryDatosReimpDocFiscalMONTO_EXONERADO_ITBIS.Value) > 0) then
   begin
     strValor:= 'EXONERAITBIS_CF';
     Write(myFile, Trim(strValor)+'|');

     strValor:= Format('%8.2f', [dmcotizafiscal.qryDatosReimpDocFiscalMONTO_EXONERADO_ITBIS.Value]);
     strValor:= RemoverPuntoYComa(strValor);
     WriteLn(myFile, Trim(strValor));

     strValor:= 'TOTALNETO_CF';
     Write(myFile, Trim(strValor)+'|');

     strValor:= Format('%8.2f', [dmcotizafiscal.qryDatosReimpDocFiscalTOTAL_NETO.Value]);
     strValor:= RemoverPuntoYComa(strValor);
     WriteLN(myFile, Trim(strValor));
   end;
   
   dmcotizafiscal.qryDescLineas.Close;
   dmcotizafiscal.qryDescLineas.Params[0].Value:=2;
   dmcotizafiscal.qryDescLineas.Open;

   //if GlbEsPrecuenta then

   dmcotizafiscal.qryDescLineas.Close;
   dmcotizafiscal.qryDescLineas.Params[0].Value:=3;
   dmcotizafiscal.qryDescLineas.Open;


    //Parametros para Pago Documento Fiscal
    strValor:= 'CLOSE_CF';
    Write(myFile,Trim(strValor)+'|');//CLOSE
    strValor:='';
    if GlbEsPrecuenta then
    begin
      Write(myFile,'|');//Descripcion Cola Reemplazo #1
      Write(myFile,'|');//Descripcion Cola Reemplazo #1
      strValor:= 'Numero :' +IntToStr(xNumCotizacion);
      Write(myFile,Trim(strValor)+'|');//Desc Cola #2
      strValor:= '';
      Write(myFile,'|');//Descripcion Cola Reemplazo #1
      Write(myFile,'|');//Descripcion Cola Reemplazo #1
    end else
    begin
      if dmcotizafiscal.qryDescLineas.Locate('Item',1,[]) then
      strValor := dmcotizafiscal.qryDescLineasDESCRIPCION.Value
      else strValor:= '';

      Write(myFile,Trim(strValor)+'|');//Descripcion Cola Reemplazo #1
      strValor:= '';
      Write(myFile,Trim(strValor)+'|');//Desc trailer #1

      if dmcotizafiscal.qryDescLineas.Locate('Item',2,[]) then
      strValor := dmcotizafiscal.qryDescLineasDESCRIPCION.Value
      else strValor:= '';

      strValor:= 'Numero :' +IntToStr(xNumCotizacion);

      Write(myFile,Trim(strValor)+'|');//Desc Cola #2
      strValor:= '';
      Write(myFile,Trim(strValor)+'|');//Desc Trailer #2

      if dmcotizafiscal.qryDescLineas.Locate('Item',3,[]) then
      strValor := dmcotizafiscal.qryDescLineasDESCRIPCION.Value
      else strValor:= '';
      Write(myFile,Trim(strValor)+'|');//Desc Cola #3
    end;//precuenta

   strValor:='';
   Write(myFile,Trim(strValor)+'|');//Desc Trailer #3
      
   strValor:= '';//dmcotizafiscal.qryDatosReimpDocFiscalNIF.Value;
   Write(myFile, trim(strValor)+'|');//NIF
   strValor:= Format('%8.2f', [dmcotizafiscal.qryDatosReimpDocFiscalTOTAL_BRUTO.Value]);
   Write(myFile, trim(strValor)+'|');//TOTAL_BRUTO

   strValor:= Format('%8.2f', [dmcotizafiscal.qryDatosReimpDocFiscalMONTO_ITBIS.Value]);
   Write(myFile, trim(strValor)+'|');//MONTO_ITBIS

   strValor:= Format('%8.2f', [dmcotizafiscal.qryDatosReimpDocFiscalTOTAL_NETO.Value]);
   Write(myFile, trim(strValor)+'|');//TOTAL_NETO

   strValor:= Format('%8.2f', [dmcotizafiscal.qryDatosReimpDocFiscalMONTO_PAGADO.Value]);
   Write(myFile, trim(strValor)+'|');//Monto_Pagado

   strValor:= Format('%8.2f', [dmcotizafiscal.qryDatosReimpDocFiscalMONTO_CAMBIO.Value]);
   Write(myFile, trim(strValor));//Monto_Pagado

   dmcotizafiscal.qryDescLineas.Close;
   if GlbEsPrecuenta then
   dmcotizafiscal.qryDescLineas.Params[0].Value:=5
   else
   dmcotizafiscal.qryDescLineas.Params[0].Value:=4;
   dmcotizafiscal.qryDescLineas.Open;
   dmcotizafiscal.qryDescLineas.Last;
   ln_added:=False;

   dmcotizafiscal.qryLComentarioCot.Close;
   dmcotizafiscal.qryLComentarioCot.Params[0].Value := dmcotizafiscal.qryDatosReimpDocFiscalNUMERO.Value;
   dmcotizafiscal.qryLComentarioCot.Params[1].Value := 2;
   dmcotizafiscal.qryLComentarioCot.Open;

   if (dmcotizafiscal.qryDescLineas.RecordCount > 0) then
   begin
     //Parametros para Pago Documento Fiscal
     //strValor:= 'COMENTARIOCIERRE';
     Write(myFile,'|');//CLOSE
     strValor:='';
     dmcotizafiscal.qryDescLineas.Last;
     X := 1;
     Count := dmcotizafiscal.qryDescLineas.RecordCount;
     dmcotizafiscal.qryDescLineas.First;

     dmcotizafiscal.qryLComentarioCot.First;
     while not dmcotizafiscal.qryLComentarioCot.Eof do
     begin
       if dmcotizafiscal.qryLComentarioCot.Locate('NUMLIN',x,[]) then
       strValor:=dmcotizafiscal.qryLComentarioCotLINEA.Value;
       Inc(x);
       Write(myFile,Trim(strValor)+'|');//Descripcion Cola Reemplazo #x
       dmcotizafiscal.qryLComentarioCot.Next;
     end;

     //Se aceptan hasta 40 lineas
     dmcotizafiscal.qryDescLineas.First;
     While Not dmcotizafiscal.qryDescLineas.Eof Do
     begin
       if (dmcotizafiscal.qryDescLineasSTATUS.Value = 'I') then
       begin
         X := X + 1;
         dmcotizafiscal.qryDescLineas.Next;
         continue;
       end;
       if  x < count then
       begin
         if not dmcotizafiscal.qryDescLineasDESCRIPCION.IsNull then
         strValor := dmcotizafiscal.qryDescLineasDESCRIPCION.Value
         else strValor:= '';
                  
         Write(myFile,Trim(strValor)+'|');//Descripcion Cola Reemplazo #x
       end;

       if X = Count then
       begin
         if Not dmcotizafiscal.qryDescLineasDESCRIPCION.IsNull then
         strValor := dmcotizafiscal.qryDescLineasDESCRIPCION.Value
         else strValor := '';
         WriteLn(myFile,Trim(strValor));
         ln_added :=True;
       end;
       X := X + 1;
       dmcotizafiscal.qryDescLineas.Next;
      end;
   end  else
   WriteLn(myFile, '');

   if not ln_added then
   WriteLn(myFile,'');//CLOSE

   CloseFile(myFile);
end;

end.
