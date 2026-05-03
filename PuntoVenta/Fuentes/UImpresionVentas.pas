unit UImpresionVentas;

interface
          
     procedure ReImprimeDevolucion;
     procedure ProcSetPathlogoTipoServicio(tipo:smallint);
     procedure ReimprimirFacturaNoFiscal(numTRN : Integer);
     procedure ImprimeFactura8_5Farmacia(num: integer;tventa: string;valorNCF:string;xdir:string);
     procedure ImprimirFacturaRepuestoConduce(numstr: integer);
     procedure ImprimirFacturaRepuesto(numTran: Integer);
     procedure ImprimirEdicionFactura;
     procedure ImprimeFacturaEXDMAR(num: integer;tventa: string;valorNCF:string;xdir:string);
     Procedure ImprimeDocumento(serieDoc:integer);
     Procedure ReImprimirRecibo;
     procedure ReImpDevolucion(numDev : Integer;var _flag : boolean);
     procedure ReImprimeFacturaContado;
     procedure ImpFacturaservicio(numerotrn: Integer;EsReimpresion: Boolean);


implementation
uses

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, RXDBCtrl, DBCtrls,
  Printers, DB, Mask, RxMemDS, EditNew, IBCustomDataSet, IBQuery, WinSkinData, Menus,
  ShellApi, RXCtrls, IBStoredProc, IBSQL, RxLookup, RXSpin, OleServer,
  RxVerInf, RxGIF, ExcelXP, comObj, rxToolEdit, RxDBComb, IBTable, ComCtrls,
  QRPrntr,UTicketCustomSize,UProcVentaRapida,
UDatModConectar, UGlobal, URepComprobante, UDatModCompania,UDatModReportes,
UDatModClientes,UDatModFactura,
  UProcMiniInventario, UFormSelFecha, URepVentaDiaria,
   USeleccionarNCF, uFormAsignarNCFVenta,
  UBuscarClientesPersonasP, UFormDatosCotiza, UDatModCxc,
  UMaestroClientes, URFacturaStandar, URFactura, UFormSelproducto,
  UFormFinanciamiento, URepCotizacionPapel8_55, URepRecibo8_5_11,
  USolDatos, UDistCuotasFinanc, UFormSelSerieProd, UInvXReferencia,
  UTransNcNbDev, UEdicionVenta, UFormProcDevolucion, UFormEntreClave, Math,
  URFacturaStandarReimp, UFormDatosVentaVeh, UDatModInventario,
  UIndicarLoteNum, ULabelImpCodBarra, UConsultaPrecio,
  URepFacturaPuntoVenta, UDatModUsuarios, URepRecibo8_5_11REspinal,
  URFacturaStandarReimpREsp, UInventarioProd, UConsultaInventario,
  UConsultaPreventa, URepComprobanteFix, UDatosVentas,
  UFormVerIngredientes, UFormBuscarDatosEstudiantes,
  UFormVerDescFacturaServicio,
  UFormPrecioProdPorProveedor, UFormFacturas, UQckFactServIngeservis8_5_N,
  UFormGetNumFctAExportarExcel, UQckFactServIngeservis8_5_NCotiza,
  UQckFactServIngeservis8_5_NConduce, UQckFactServArtioficce8_5,
  UQckFactServIngeservis8_5_NCotizaN, UQckCotiza8_5_F_1, UQckCotiza8_5_F_2,
  UQckFactCredArtioffice8_5_F_1, UFormTransCxcDbCr_r, UProcesarDevolucion,
  UFormRegServicioTaller, ImageWin, UDatmodDatosGenerales, UFormShowImagen,
  UFormDistribuirPgoVenta, UFormOperacionServicios, {UFormPolizaMaster,}
  UDatModPagoTarjeta, UFormPagosCombinados, UTestImpFiscal,
  UQckCotiServIngeservis8_5_NConduce, UFormSelTipoConduce,
  UFormGenerarConduce, UFormGenerarConduceFct,
  UQckFactCredArtioffice8_5_F_1_bym, UQckCotiza8_5_F_1ByM, UfrmBuscarNIF, UCoreOCXFiscal,
  UVerDataImpIFiscal, UFormSelTasaITBIS, UFormCalculosVentaActiva,UImprimeCotizaFiscal,
  UProcCierreJornada, UDatModCalculos, UTemporalVtaForm,
  UFormConsultaDatosVenta, UConciliarNIF, UActivapermisos,
  UFormVerDetalleVta, UQckFactCredArtioffice8_5_F_1Std,
  URepRecibo8_5_11DevolREspinal, URepRecibo8_5_11REspinalReimp,
  frmVerComprobantes, UFormPuertosLibres, UQckCotiza8_5_FormG,
  UCtrlAlquiler, URepComprobanteDevol, UCtrlEnvioaLavanderia,
  URepComprobanteReimp, UQckCotiza8_5_F_1ByMPrefact, UQckFactServ8_5BB,
  UQckFactServ8_5Ayaco, URepComprobanteDevol_3Pulg, UDatModFastFood,
  URepReimpFastFoodPOS, URepReimpTicketSurtidora, UBuscarRazonSocialDBDgii,
  UDatModDGII, UQckCotServ8_5Ayaco, UFormPosExtraDET,
  URepRecibo8_5_11REspinalReimpFFood, UQckFactServ8_5Limao,
  UQckFactServ8_5Surtidora, UDatModCotizafiscal, {URepReimpFastRetailPOS,}
  URepCotizacionPapel3Pulg, URepReimpTicketSurtidora_1,
  UReipReimpFastRetailPOS, URepRecibo8x5_5, UFormDatosVeh,
  URepRecibo8x5_5Conduce, frmImprimirDoc, UFormLog, DateUtils, URegFpago,
  URegFpagoVtaRep, UQckCotiza8_5_F_1BB, UQckCotServ8_5AyacoRep,
  UCancelaReinsertaVenta, UConfirmaConduce,
  UQckRepConduce, UQckRepOrdenAlmacen, UFormDatosOrdenConduce,
  UQckRepOrdenAlmacenPOS, UFormVocadosDet, UFactLimao01,
  UQckFactServ8_5EXDMar, UQckCotizaServ8_5EXDMar, URepTicketVta,
  UQckFactServ8_5Agua, UFormDetalleAdicionalVta, UFormDatosProdControlados,
  UFormCoberturaVtaARS, URepReimpTicketFarm_ARS, UQckFactServ8_5_SAM,
  UQckCotServ8_5SAM, UQckFactServ8_5_Standar, UQckCotServ8_5Standar,
  UFormInvCertificado, UQckFactServ8_5_SAMNew, UQckFactServ8_5_SAMNewM,
  URepConduceECom, UFactFormatoECom, UDatModIngresos, UFormCteDelivery,
  UFormConsultaCertAvanzado, UQckFactServ8_5_SAMNewMuturs,
  URepReimpTicketSurtidoraNew, UFormBuscarMotor, UDatModVehiculo,
  UQckFactServ8_5Farmacia, UQckCotServ8_5StandarFarmacia, UDatModPanaderia,
  UFormPrepago, UfrmValidaFactura,  TestMainUnit;

 var
   TipoVenta : String;
   esContado : boolean = true;
   numerodocReimp : integer;

procedure ReImpDevolucion(numDev : Integer;var _flag : boolean);
var
  flag : Boolean;
begin
  //Usado para filtrar dmfactura.qryventafactura
  UProcesarDevolucion.numeroFactura := numDev;
  EsDevolucion := True;
  dmFactura.formaPago := 6;//Devolucion
  if UProcesarDevolucion.numeroFactura <= 0 then
  UProcesarDevolucion.numeroFactura := StrToInt(InputBox('Re-Imprimir factura devolución','Entre número devolución',''));
  dmCompania.tblCompania.Close;
  dmCompania.tblCompania.Open;
  dmCompania.tblCompania.Locate('codigo', glbCia_Key, []);
  dmfactura.qryFactReimpMaster.Close;
  dmfactura.qryFactReimpMaster.SQL.Text := dmfactura.qryFactReimpMasterDevol.SQL.Text;
  dmfactura.qryFactReimpMaster.Params[0].AsInteger := UProcesarDevolucion.numeroFactura;
  dmfactura.qryFactReimpMaster.Params[1].AsSmallInt:= 6;//Devolucion
  if not dmfactura.qryFactReimpMaster.Prepared then
  dmfactura.qryFactReimpMaster.Prepare;
  dmfactura.qryFactReimpMaster.Open;
  _flag := True;
  if dmfactura.qryFactReimpMaster.RecordCount = 0 then
  begin
    MessageDlg('Número devolución no encontrada, verifique.',mtInformation,[mbok], 0);
    _flag := False;
    exit;
  end;
  dmreportes.qryViewVentasMast.Close;
  dmreportes.qryViewVentasMast.Params[0].Value:= dmfactura.qryFactReimpMasterNUMERO.Value;
  dmreportes.qryViewVentasMast.Open;

  ProcSetPathlogoTipoServicio(dmReportes.qryViewVentasMastTIPO_AFILIADO.Value);

  dmfactura.qryFactReimpDet.Close;
  dmfactura.qryFactReimpDet.Sql.Text := dmfactura.qryFactReimpDetDevol.Sql.Text;
  dmfactura.qryFactReimpDet.Params[0].Value:=dmfactura.qryFactReimpMasterNUMERO.Value;
  dmfactura.qryFactReimpDet.Open;
  dmfactura.qryFactReimpDet.Last;
  dmfactura.qryFactReimpDet.Close;

    frmConsultaFacturas:=TfrmConsultaFacturas.Create(Nil);
    try
      frmConsultaFacturas.rdgCredito.Checked := False;
      frmConsultaFacturas.EditN1.SetInteger(dmfactura.qryFactReimpMaster.Params[0].Value);
      dmFactura.qryVentaFactura.SQL.Text:=
      dmFactura.qryVentaFactDevolucion_base.SQL.Text +' Where VENTAS_MAST.NUMERO_doc_pago =:numero '+
      ' And ventas_mast.cia_key =:ciakey'+
      ' And ventas_mast.FORMA_PAGO = 6 ' +
      ' And ventas_mast.codigo_cte = '   + dmfactura.qryFactReimpMasterCODIGO_CTE.AsString;

      dmFactura.qryVentaFactura.Params[0].AsInteger := UProcesarDevolucion.numeroFactura;
      GlbcodVendedor:= dmFactura.qryVentaFacturaCODIGO_VENDEDOR.Value;
      dmFactura.qryVentaFactura.Params[1].AsInteger := glbCia_Key;
      dmFactura.qryVentaFactura.Open;
      if (dmFactura.qryVentaFactura.RecordCount = 0) And
      (dmfactura.qryFactReimpMasterCODIGO_CTE.IsNull or (dmfactura.qryFactReimpMasterCODIGO_CTE.Value = 0)) then
      begin
        dmFactura.qryVentaFactura.Close;
        dmFactura.qryVentaFactura.SQL.Text:=
        dmFactura.qryVentaFactDevolucion_base.SQL.Text +' Where VENTAS_MAST.NUMERO_doc_pago =:numero '+
        ' And ventas_mast.cia_key =:ciakey'+
        ' And ventas_mast.FORMA_PAGO = 6 ';// +
        //' And ventas_mast.codigo_cte = '   + dmfactura.qryFactReimpMasterCODIGO_CTE.AsString;
        dmFactura.qryVentaFactura.Params[0].AsInteger := UProcesarDevolucion.numeroFactura;
        dmFactura.qryVentaFactura.Params[1].AsInteger := glbCia_Key;
        dmFactura.qryVentaFactura.Open;
      end;             //Pendiente padar numero factura correcto hoy Mayo 6
      GlbcodVendedor:= dmFactura.qryVentaFacturaCODIGO_VENDEDOR.Value;
      if dmFactura.qryVentaFactura.RecordCount = 0 then
      begin
        _flag := False;
        MessageDlg('Record para devolución no encontrado',mtInformation,[mbok],0);
        Exit;
      end;
      dmFactura.qryDatosTrncxc.Close;  //dmFactura.qryVentaFactura.RecordCount;
      if esContado then
      dmFactura.qryDatosTrncxc.Params[0].AsInteger:= 2
      else
      dmFactura.qryDatosTrncxc.Params[0].AsInteger:= 1;
      dmFactura.qryDatosTrncxc.Params[1].AsInteger:= dmFactura.qryVentaFacturaNUMERO_DOC_PAGO.AsInteger;
      dmFactura.qryDatosTrncxc.Open;

      frmProcVentaRapida.LlenarrxSolDatoscte(dmFactura.qryVentaFacturaCODIGO_CTE.Value);
    finally
    if Assigned(frmConsultaFacturas) then
    frmConsultaFacturas.Free;
    frmConsultaFacturas:=Nil;
    end;

    if (dmFactura.qryVentaFacturaTIPO_FACTURA.Value = 6 ) then //
    begin
      if EsReimp then
      TipoVenta:= 'Devolución'+' (Re-Impresion)'
      else
      TipoVenta:= 'Devolución';

      GlbRutaLogoDoc:='';
      if GetFormatoTipoDoc(3,GlbRutaLogoDoc) then  //3 Devolucion 8.5 Estandar
      GlbDocStandar:=1
      else
      GlbDocStandar:=0;

      if (UpperCase(GLBFormatoFactura) = 'FORMAEXPLODISMAR') then
      ImprimeFacturaEXDMAR(0,'DEVOLUCION',dmFactura.qryVentaFacturaNUMERO_NCF.Value,'Devolucion')
      else
      if (UpperCase(GLBFormatoFactura) = 'FORMAFACOCO') then
      ImprimirFacturaRepuesto(dmfactura.qryFactReimpMaster.Params[0].Value)
      ELSE
      if (GLBMutur = 1) then
      begin
        dmreportes.qryViewVentasMast.Close;
        dmreportes.qryViewVentasMast.Params[0].Value:= dmfactura.qryVentaFacturaNUMERO.Value;
        dmreportes.qryViewVentasMast.Open;
        qckFactServ_8_5SAMNewMuturs:=TqckFactServ_8_5SAMNewMuturs.Create(Nil);
          try
            qckFactServ_8_5SAMNewMuturs.xtipoVenta:=TipoVenta;
            qckFactServ_8_5SAMNewMuturs.rxVendedor.Close;
            qckFactServ_8_5SAMNewMuturs.rxVendedor.Open;
            if dmreportes.qryCantVendedoresSamCANTVENDEDORES.Value = 1 then
            begin
              if frmProcVentaRapida.qryEmpleado.Locate('codigo', dmreportes.qryViewVentasDetCodigo_Vendedor.Value,[]) then
              begin
                qckFactServ_8_5SAMNewMuturs.rxVendedor.Append;
                qckFactServ_8_5SAMNewMuturs.rxVendedorNombreVendedor.Value:=
                frmProcVentaRapida.qryEmpleadoNOMBREVENDEDOR.Value;
                qckFactServ_8_5SAMNewMuturs.rxVendedor.Post;
              end;
            end else
            begin
              qckFactServ_8_5SAMNewMuturs.xtipoVenta := 'Devolución';
              qckFactServ_8_5SAMNewMuturs.rxVendedor.Close;
              qckFactServ_8_5SAMNewMuturs.rxVendedor.Open;
              qckFactServ_8_5SAMNewMuturs.rxVendedor.Append;
              qckFactServ_8_5SAMNewMuturs.rxVendedorNombreVendedor.Value:='';
              qckFactServ_8_5SAMNewMuturs.rxVendedor.Post;
              end;
              qckFactServ_8_5SAMNewMuturs.TPag.Caption:=
              IntToStr(qckFactServ_8_5SAMNewMuturs.PageNumber);
              qckFactServ_8_5SAMNewMuturs.xtipoVenta := TipoVenta;
              //qckFactServ_8_5SAMNewMuturs.valorNCF:= valorNCF;
              if dmReportes.qryViewVentasMastMONTO_EXONERADO_ITBIS.Value > 0 then
              begin
                qckFactServ_8_5SAMNewMuturs.QRLabel25.Caption :='ITBIS Exonerado';
              end  else
              qckFactServ_8_5SAMNewMuturs.QRLabel25.Caption :='ITBIS';

              if (GlbImpReciboSinPreg = 1) then
              qckFactServ_8_5SAMNewMuturs.Print
              else
              if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
              begin
                //qckFactServ_8_5SAMNewMuturs.QRImage2.Enabled:= False;
                qckFactServ_8_5SAMNewMuturs.PrinterSetup;
                qckFactServ_8_5SAMNewMuturs.Print;
              end else
              qckFactServ_8_5SAMNewMuturs.Preview;

              if (GlbImpReciboSinPreg = 0) then
              if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
              begin
                qckFactServ_8_5SAMNewMuturs.Preview;
              end;
             if GlbImpPDF then
             begin
               if not dmReportes.qryViewVentasMastNUMERO_FACTURA.IsNull then
               ReportExportPDF(qckFactServ_8_5SAMNewMuturs,GlbRutaRecibos+'\Recibos'+IntToStr(dmReportes.qryViewVentasMastNUMERO_FACTURA.Value)+'.pdf')
               else
               ReportExportPDF(qckFactServ_8_5SAMNewMuturs,GlbRutaRecibos+'\Recibos'+IntToStr(dmReportes.qryViewVentasMastNUMERO_DOC_PAGO.AsInteger)+'.pdf')
             end;
          finally
          qckFactServ_8_5SAMNewMuturs.Free;
          qckFactServ_8_5SAMNewMuturs:=Nil;
          end;
      end else
      if esContado and (GlBAyaco = 1) then
      begin
        qckRepReciboReimpTicketSurtidoraNew:=TqckRepReciboReimpTicketSurtidoraNew.Create(Nil);
      try
        if GlbImpQREncuesta = 0 then
        begin
          if (GlbImpQREncuesta = 0) then
          qckRepReciboReimpTicketSurtidoraNew.Height:=761;

          //qckRepReciboReimpTicketSurtidoraNew.Page.Length:=6.156; //sin encuesta
          qckRepReciboReimpTicketSurtidoraNew.ChildBand14.Height:=0;
          //qckRepReciboReimpTicketSurtidoraNew.ChildBand13.HasChild:=False;
        end;
        qckRepReciboReimpTicketSurtidoraNew.SetParameterValues;
        if  frmProcVentaRapida.rxspinImpCantCopias.Decimal > 0 then
        qckRepReciboReimpTicketSurtidoraNew.PrinterSettings.Copies:= StrToInt(frmProcVentaRapida.rxspinImpCantCopias.Text);
        if GlbEsCopia then
        qckRepReciboReimpTicketSurtidoraNew.strcopia :=' (COPIA)'
        else
        qckRepReciboReimpTicketSurtidoraNew.strcopia :='';

        //qckRepReciboReimpTicketSurtidoraNew.ncfDesc := GlbDescNCF;
        if Length(frmProcVentaRapida.edtObservacion.Text) > 0 then
        qckRepReciboReimpTicketSurtidoraNew.nombreCteGenerico:=frmProcVentaRapida.edtObservacion.Text;
        if (dmReportes.qryViewVentasMastCodigo_cte.value > 0) then
        begin
          qckRepReciboReimpTicketSurtidoraNew.qrLabelRNC.Caption:='RNC-' + frmProcVentaRapida.qryClienteRNC_NUMERO.Value;
          qckRepReciboReimpTicketSurtidoraNew.nombreCteGenerico:= frmProcVentaRapida.qryClienteNOMBRE_CTE.Value;
        end
        else qckRepReciboReimpTicketSurtidoraNew.qrLabelRNC.Caption:='';
        qckRepReciboReimpTicketSurtidoraNew.xtipoVenta := TipoVenta;
        //qckRepReciboReimpTicketSurtidoraNew.valorNCF   := valorNCF;
        qckRepReciboReimpTicketSurtidoraNew.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;
        //pulgadaInc:=0.86;
        dmFactura.qryVentaFacturaDet.Last;

      if (glbQckUnaPagina = 1) then
      begin
        if (dmFactura.qryVentaFacturaDet.RecordCount = 1) and
           (qckRepReciboReimpTicketSurtidoraNew.Page.Length < 6.65)  then
        qckRepReciboReimpTicketSurtidoraNew.Page.Length:=5.759
        else
        if dmFactura.qryVentaFacturaDet.RecordCount >= 2 then
        qckRepReciboReimpTicketSurtidoraNew.Page.Length:= qckRepReciboReimpTicketSurtidoraNew.Page.Length +
        (dmFactura.qryVentaFacturaDet.RecordCount - 1 ) * 0.25;

        flag:=true;
        dmFactura.qryVentaFacturaDet.First;
        //dmFactura.qryVentaFacturaDet.Last;
        if dmFactura.qryVentaFacturaDet.RecordCount > 25  then
        qckRepReciboReimpTicketSurtidoraNew.Page.Length:=23
        else
        if dmFactura.qryVentaFacturaDet.RecordCount > 29  then
        qckRepReciboReimpTicketSurtidoraNew.Page.Length:=26;

        qckRepReciboReimpTicketSurtidoraNew.Prepare;

        if ((dmFactura.qryVentaFacturaDet.RecordCount >= 1) and
           ((dmFactura.qryVentaFacturaDet.RecordCount < 10)
            or (qckRepReciboReimpTicketSurtidoraNew.PageNumber = 2))) then
        begin
          frmProcVentaRapida.ProgressBar1.Visible :=True;
          frmProcVentaRapida.ProgressBar1.Position:=0;
          frmProcVentaRapida.ProgressBar1.Max:=dmFactura.qryVentaFacturaDet.RecordCount;
          if (GlbIncLargoPapel = 1) then
          begin
          repeat
          begin
            frmProcVentaRapida.ProgressBar1.StepIt;  //revisar proceso octubre 10 2024
            //cRc:=cRc + 1;
            if (qckRepReciboReimpTicketSurtidoraNew.PageNumber > 1) then
            begin
              qckRepReciboReimpTicketSurtidoraNew.Page.Length:=qckRepReciboReimpTicketSurtidoraNew.Page.Length + 0.50;
              qckRepReciboReimpTicketSurtidoraNew.Prepare;
              flag:=False;
            end else
            if (qckRepReciboReimpTicketSurtidoraNew.PageNumber = 1) then
                break;
            if (qckRepReciboReimpTicketSurtidoraNew.PageNumber = 1) then
                break;
            end;
            until flag = true;
            end;
          end;
        end; //if (glbQckUnaPagina = 1) then
        frmProcVentaRapida.ProgressBar1.Visible:=False;
        dmFactura.qryVentaFacturaDet.last;
        if (dmFactura.qryVentaFacturaDet.RecordCount >15) and (GlbImpFormatoPDF = 1) then
        begin
          frmProcVentaRapida.ImprimirEnFormatoPDF(1,6);
        end else
        begin
          dmDatos.qryImpresoras.Close;
          dmDatos.qryImpresoras.Open;
          if dmDatos.qryImpresoras.Locate('IDMODULO;IDREPORTE',
          VarArrayOf([1,6]),[]) then     //Factura/Recibo Punto Venta
          qckRepReciboReimpTicketSurtidoraNew.PrinterSettings.PrinterIndex:=
          GetImpresora(dmDatos.qryImpresorasNOMBRE_IMPRESORA.Value);

          if (GlbImpReciboSinPreg = 1) and (GlbImprimeReciboFact = 1) then
          qckRepReciboReimpTicketSurtidoraNew.Print
          else
          if MessageDlg('Imprimir?',mtInformation, [mbYes, mbNo], 0)=mryes then
          begin
            if (GlbImprimeReciboFact = 1) then
            begin
              qckRepReciboReimpTicketSurtidoraNew.PrinterSetup;
              qckRepReciboReimpTicketSurtidoraNew.Print;
            end;
          end else
          qckRepReciboReimpTicketSurtidoraNew.Preview;
          reciboImpreso:=True;
        end;

        reciboImpreso:=True;
        //if GlbImpTicketVtaAgua = 1 then
        //ImprimirTicketVtaAgua(ipStpInsertVentMast.Params[0].Value);
      finally
      qckRepReciboReimpTicketSurtidoraNew.Free;
      qckRepReciboReimpTicketSurtidoraNew:=Nil;
      end; 
      exit;
      end else
      if (GlbSizeFact8x11 = 1) and ((GlBAyaco = 1) or (GlBTapiceria = 1) or (GlBInveraf =1) or (GlBExpert = 1)) then
          begin
            qckFactServ8_5Ayaco:=TqckFactServ8_5Ayaco.Create(Nil);
            try
             if dmFactura.qryVentaFacturaMONTO_EXONERADO_ITBIS.Value > 0 then
             begin
               //qckFactServ8_5Ayaco.QRLabel25.left:=505;
               qckFactServ8_5Ayaco.QRLabel25.Caption :='ITBIS Exonerado';
             end  else
             qckFactServ8_5Ayaco.QRLabel25.Caption :='ITBIS';
              qckFactServ8_5Ayaco.TPag.Caption:=
              IntToStr(qckFactServ8_5Ayaco.PageNumber);
              qckFactServ8_5Ayaco.xtipoVenta := 'Devolución';
              qckFactServ8_5Ayaco.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;
              if (GlbImpReciboSinPreg = 1) then
                 qckFactServ8_5Ayaco.Print
              else
              if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
              begin
                qckFactServ8_5Ayaco.PrinterSetup;
                qckFactServ8_5Ayaco.Print;
              end else
              qckFactServ8_5Ayaco.Preview;

              if (GlbImpReciboSinPreg = 0) then
              if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
              begin
                qckFactServ8_5Ayaco.Preview;
              end;
            finally
            qckFactServ8_5Ayaco.Free;
            qckFactServ8_5Ayaco:=Nil;
          end;
        end else
        if (GlBBurgos = 1) then
        begin
          qckFactServ8_5BB:=TqckFactServ8_5BB.Create(Nil);
          try
            //qckFactServ8_5BB.TPag.Caption:=IntToStr(qckFactServ8_5BB.PageNumber);
            qckFactServ8_5BB.xtipoVenta := 'Devolución';
            qckFactServ8_5BB.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;
            if (GlbImpReciboSinPreg = 1) then
            qckFactServ8_5BB.Print
            else
            if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
            begin
              qckFactServ8_5BB.PrinterSetup;
              qckFactServ8_5BB.Print;
            end else
            qckFactServ8_5BB.Preview;

            if (GlbImpReciboSinPreg = 0) then
            if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
            begin
              qckFactServ8_5BB.Preview;
            end;
          finally
          qckFactServ8_5BB.Free;
          qckFactServ8_5BB:=Nil;
          end;
        end else
          if (Glbcolmado = 1) then
  begin
    if esContado then
    begin
      //qckRepReciboReimpTicketSurtidora:=TqckRepReciboReimpTicketSurtidora.Create(Nil);
      qckRepReciboReimpTicketSurtidoraNew:=TqckRepReciboReimpTicketSurtidoraNew.Create(Nil);
      try
        if GlbImpQREncuesta = 0 then
        begin
          if (GlbImpQREncuesta = 0) then
          qckRepReciboReimpTicketSurtidoraNew.Height:=761;

          //qckRepReciboReimpTicketSurtidoraNew.Page.Length:=6.156; //sin encuesta
          qckRepReciboReimpTicketSurtidoraNew.ChildBand14.Height:=0;
          //qckRepReciboReimpTicketSurtidoraNew.ChildBand13.HasChild:=False;
        end;
        qckRepReciboReimpTicketSurtidoraNew.SetParameterValues;
        if  frmProcVentaRapida.rxspinImpCantCopias.Decimal > 0 then
        qckRepReciboReimpTicketSurtidoraNew.PrinterSettings.Copies:= StrToInt(frmProcVentaRapida.rxspinImpCantCopias.Text);
        if GlbEsCopia then
        qckRepReciboReimpTicketSurtidoraNew.strcopia :=' (COPIA)'
        else
        qckRepReciboReimpTicketSurtidoraNew.strcopia :='';

        //qckRepReciboReimpTicketSurtidoraNew.ncfDesc := GlbDescNCF;
        if Length(frmProcVentaRapida.edtObservacion.Text) > 0 then
        qckRepReciboReimpTicketSurtidoraNew.nombreCteGenerico:=frmProcVentaRapida.edtObservacion.Text;
        if (dmReportes.qryViewVentasMastCodigo_cte.value > 0) then
        begin
          qckRepReciboReimpTicketSurtidoraNew.qrLabelRNC.Caption:='RNC-' + frmProcVentaRapida.qryClienteRNC_NUMERO.Value;
          qckRepReciboReimpTicketSurtidoraNew.nombreCteGenerico:= frmProcVentaRapida.qryClienteNOMBRE_CTE.Value;
        end
        else qckRepReciboReimpTicketSurtidoraNew.qrLabelRNC.Caption:='';
        qckRepReciboReimpTicketSurtidoraNew.xtipoVenta := TipoVenta;
        //qckRepReciboReimpTicketSurtidoraNew.valorNCF   := valorNCF;
        qckRepReciboReimpTicketSurtidoraNew.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;
        //pulgadaInc:=0.86;
        dmFactura.qryVentaFacturaDet.Last;

      if (glbQckUnaPagina = 1) then
      begin
        if (dmFactura.qryVentaFacturaDet.RecordCount = 1) and
           (qckRepReciboReimpTicketSurtidoraNew.Page.Length < 6.65)  then
        qckRepReciboReimpTicketSurtidoraNew.Page.Length:=5.759
        else
        if dmFactura.qryVentaFacturaDet.RecordCount >= 2 then
        qckRepReciboReimpTicketSurtidoraNew.Page.Length:= qckRepReciboReimpTicketSurtidoraNew.Page.Length +
        (dmFactura.qryVentaFacturaDet.RecordCount - 1 ) * 0.25;

        flag:=true;
        dmFactura.qryVentaFacturaDet.First;
        //dmFactura.qryVentaFacturaDet.Last;
        if dmFactura.qryVentaFacturaDet.RecordCount > 25  then
        qckRepReciboReimpTicketSurtidoraNew.Page.Length:=23
        else
        if dmFactura.qryVentaFacturaDet.RecordCount > 29  then
        qckRepReciboReimpTicketSurtidoraNew.Page.Length:=26;

        qckRepReciboReimpTicketSurtidoraNew.Prepare;

        if ((dmFactura.qryVentaFacturaDet.RecordCount >= 1) and
           ((dmFactura.qryVentaFacturaDet.RecordCount < 10)
            or (qckRepReciboReimpTicketSurtidoraNew.PageNumber = 2))) then
        begin
          frmProcVentaRapida.ProgressBar1.Visible :=True;
          frmProcVentaRapida.ProgressBar1.Position:=0;
          frmProcVentaRapida.ProgressBar1.Max:=dmFactura.qryVentaFacturaDet.RecordCount;
          if (GlbIncLargoPapel = 1) then
          begin
          repeat
          begin
            frmProcVentaRapida.ProgressBar1.StepIt;  //revisar proceso octubre 10 2024
            //cRc:=cRc + 1;
            if (qckRepReciboReimpTicketSurtidoraNew.PageNumber > 1) then
            begin
              qckRepReciboReimpTicketSurtidoraNew.Page.Length:=qckRepReciboReimpTicketSurtidoraNew.Page.Length + 0.50;
              qckRepReciboReimpTicketSurtidoraNew.Prepare;
              flag:=False;
            end else
            if (qckRepReciboReimpTicketSurtidoraNew.PageNumber = 1) then
                break;
            if (qckRepReciboReimpTicketSurtidoraNew.PageNumber = 1) then
                break;
            end;
            until flag = true;
            end;
          end;
        end; //if (glbQckUnaPagina = 1) then
        frmProcVentaRapida.ProgressBar1.Visible:=False;
        dmFactura.qryVentaFacturaDet.last;
        if (dmFactura.qryVentaFacturaDet.RecordCount >15) and (GlbImpFormatoPDF = 1) then
        begin
          frmProcVentaRapida.ImprimirEnFormatoPDF(1,6);
        end else
        begin
          dmDatos.qryImpresoras.Close;
          dmDatos.qryImpresoras.Open;
          if dmDatos.qryImpresoras.Locate('IDMODULO;IDREPORTE',
          VarArrayOf([1,6]),[]) then     //Factura/Recibo Punto Venta
          qckRepReciboReimpTicketSurtidoraNew.PrinterSettings.PrinterIndex:=
          GetImpresora(dmDatos.qryImpresorasNOMBRE_IMPRESORA.Value);

          if (GlbImpReciboSinPreg = 1) and (GlbImprimeReciboFact = 1) then
          qckRepReciboReimpTicketSurtidoraNew.Print
          else
          if MessageDlg('Imprimir?',mtInformation, [mbYes, mbNo], 0)=mryes then
          begin
            if (GlbImprimeReciboFact = 1) then
            begin
              qckRepReciboReimpTicketSurtidoraNew.PrinterSetup;
              qckRepReciboReimpTicketSurtidoraNew.Print;
            end;
          end else
          qckRepReciboReimpTicketSurtidoraNew.Preview;
          reciboImpreso:=True;
        end;

        reciboImpreso:=True;
        //if GlbImpTicketVtaAgua = 1 then
        //ImprimirTicketVtaAgua(ipStpInsertVentMast.Params[0].Value);
      finally
      qckRepReciboReimpTicketSurtidoraNew.Free;
      qckRepReciboReimpTicketSurtidoraNew:=Nil;
      end; 
      exit;
    end  else
       if (GlbRec3Pulg = 1) then
      begin
        qckRepReciboDevol3Pulg:=TqckRepReciboDevol3Pulg.Create(Nil);
        try
          if GlbImpCodProducto = 1 then
          begin
            qckRepReciboDevol3Pulg.QRLabel27.Enabled := False;
            qckRepReciboDevol3Pulg.QRDBText5.Enabled:= False;
          end else
          begin
            qckRepReciboDevol3Pulg.QRLabel27.Enabled:= True;
            qckRepReciboDevol3Pulg.QRDBText5.Enabled:= True;
          end;

          if Length(frmProcVentaRapida.TotalesNombreCliente.Value) > 0 then
          frmProcVentaRapida.totales.RecordCount;
          if dmFactura.qryVentaFacturaNOMBRE_FACTURAR.IsNull then
          qckRepReciboDevol3Pulg.nombreCteGenerico := dmFactura.qryVentaFacturaNOMBRE_CLIENTE_GENERAL.Value
          else
          qckRepReciboDevol3Pulg.nombreCteGenerico := dmFactura.qryVentaFacturaNOMBRE_FACTURAR.Value;
          if Length(frmProcVentaRapida.edtObservacion.Text) > 0 then
          qckRepReciboDevol3Pulg.nombreCteGenerico := frmProcVentaRapida.edtObservacion.Text;

          qckRepReciboDevol3Pulg.xtipoVenta:= TipoVenta;
          qckRepReciboDevol3Pulg.valorNCF  := dmFactura.qryVentaFacturaNUMERO_NCF.Value;

          //qckRepReciboDevol3Pulg.qrLabelRNC.Caption := dmFactura.qryVentaFacturaRNC_NUMERO.Value;

          if frmProcVentaRapida.rxVenta.RecordCount = 1 then
          qckRepReciboDevol3Pulg.Page.Length:= 5
          else
          if frmProcVentaRapida.rxVenta.RecordCount >= 2 then
          qckRepReciboDevol3Pulg.Page.Length:= qckRepReciboDevol3Pulg.Page.Length +
          (frmProcVentaRapida.rxVenta.RecordCount - 1 ) * 0.25;

          flag:=True;
          repeat
          begin
            qckRepReciboDevol3Pulg.Prepare;
            if qckRepReciboDevol3Pulg.PageNumber > 1 then
            begin
              qckRepReciboDevol3Pulg.Page.Length := qckRepReciboDevol3Pulg.Page.Length + 1;
              qckRepReciboDevol3Pulg.Prepare;
              flag:=False;
            end else break;
          end;
          until flag = true;

        if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
        qckRepReciboDevol3Pulg.Print else
        qckRepReciboDevol3Pulg.Preview;
        finally
        qckRepReciboDevol3Pulg.Free;
        qckRepReciboDevol3Pulg:=Nil;
        end;
      end else
      if (UpperCase(GLBFormatoFactura) = 'CASANDRA2') then  //PENDIENTE DE ANALISIS
      begin
        qckRepRecibo8_5_11REspReimp :=TqckRepRecibo8_5_11REspReimp.Create(Nil);
        try
          qckRepRecibo8_5_11REspReimp.Prepare;
          glbTPag := qckRepRecibo8_5_11REspReimp.PageNumber;
          if EsDevolucion then
          begin
            qckRepRecibo8_5_11REspReimp.xtipoVenta:= 'Devolución';
          end;
          qckRepRecibo8_5_11REspReimp.QRLabel28.Enabled:=False;
          qckRepRecibo8_5_11REspReimp.QRDBText23.Enabled:=False;
          qckRepRecibo8_5_11REspReimp.QRDBText11.Enabled:=False;

          if not dmReportes.qryViewVentasMastNUMERO_NCF.IsNull then
          qckRepRecibo8_5_11REspReimp.valorNCF:= qckRepRecibo8_5_11REspReimp.valorNCF
          else
          qckRepRecibo8_5_11REspReimp.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;

          if (qckRepRecibo8_5_11REspReimp.valorNCF = '') then
          qckRepRecibo8_5_11REspReimp.valorNCF := dmFactura.qryVentaFacturaNUMERO_NCF.Value;

          qckRepRecibo8_5_11REspReimp.xtipoVenta:= 'NOTA CREDITO (Devolución)';
            dmDatos.qryImpresoras.Close;
            dmDatos.qryImpresoras.Open;
            if dmDatos.qryImpresoras.Locate('IDMODULO;IDREPORTE',
            VarArrayOf([1,5]),[]) then     //Factura/Recibo 8.5 x 5.5
            qckRepRecibo8_5_11REspReimp.PrinterSettings.PrinterIndex:=
            GetImpresora(dmDatos.qryImpresorasNOMBRE_IMPRESORA.Value);
          if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
          begin
            qckRepRecibo8_5_11REspReimp.PrinterSetup;
            qckRepRecibo8_5_11REspReimp.Print;
            end else
            qckRepRecibo8_5_11REspReimp.Preview;
          finally
          qckRepRecibo8_5_11REspReimp.Free;
          qckRepRecibo8_5_11REspReimp:= Nil;
          end;
        end else
        begin
          if (GlbDocStandar = 1) then
          begin
            dmReportes.qryViewVentasMast.Close;
            dmReportes.qryViewVentasMast.Params[0].Value:= dmFactura.qryVentaFacturanumero.value;
            dmReportes.qryViewVentasMast.Open;
            ProcSetPathlogoTipoServicio(dmReportes.qryViewVentasMastTIPO_AFILIADO.Value);

            qckFactServ_8_5Standard:=TqckFactServ_8_5Standard.Create(Nil);
            try
             if dmFactura.qryVentaFacturaMONTO_EXONERADO_ITBIS.Value > 0 then
             begin
               //qckFactServ8_5Ayaco.QRLabel25.left:=505;
               qckFactServ_8_5Standard.QRLabel25.Caption :='ITBIS Exonerado';
             end  else
             qckFactServ_8_5Standard.QRLabel25.Caption :='ITBIS';
              qckFactServ_8_5Standard.TPag.Caption:=
              IntToStr(qckFactServ_8_5Standard.PageNumber);
              qckFactServ_8_5Standard.xtipoVenta := 'Devolución';
              qckFactServ_8_5Standard.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;
              if (GlbImpReciboSinPreg = 1) then
                 qckFactServ_8_5Standard.Print
              else
              if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
              begin
                qckFactServ_8_5Standard.PrinterSetup;
                qckFactServ_8_5Standard.Print;
              end else
              qckFactServ_8_5Standard.Preview;

              if (GlbImpReciboSinPreg = 0) then
              if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
              begin
                qckFactServ_8_5Standard.Preview;
              end;
            finally
            qckFactServ_8_5Standard.Free;
            qckFactServ_8_5Standard:=Nil;
            end;
          end else
          if (GlBAyaco = 1) or (GlbSizeFact8x11 = 1) or (GlBTapiceria = 1) or (GlBInveraf =1) then
          begin
            qckFactServ8_5Ayaco:=TqckFactServ8_5Ayaco.Create(Nil);
            try
             if dmFactura.qryVentaFacturaMONTO_EXONERADO_ITBIS.Value > 0 then
             begin
               //qckFactServ8_5Ayaco.QRLabel25.left:=505;
               qckFactServ8_5Ayaco.QRLabel25.Caption :='ITBIS Exonerado';
             end  else
             qckFactServ8_5Ayaco.QRLabel25.Caption :='ITBIS';
              qckFactServ8_5Ayaco.TPag.Caption:=
              IntToStr(qckFactServ8_5Ayaco.PageNumber);
              qckFactServ8_5Ayaco.xtipoVenta := 'Devolución';
              qckFactServ8_5Ayaco.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;
              if (GlbImpReciboSinPreg = 1) then
                 qckFactServ8_5Ayaco.Print
              else
              if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
              begin
                qckFactServ8_5Ayaco.PrinterSetup;
                qckFactServ8_5Ayaco.Print;
              end else
              qckFactServ8_5Ayaco.Preview;

              if (GlbImpReciboSinPreg = 0) then
              if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
              begin
                qckFactServ8_5Ayaco.Preview;
              end;
            finally
            qckFactServ8_5Ayaco.Free;
            qckFactServ8_5Ayaco:=Nil;
          end;
        end else
        if (GlBBurgos = 1) then
        begin
          qckFactServ8_5BB:=TqckFactServ8_5BB.Create(Nil);
          try
            //qckFactServ8_5BB.TPag.Caption:=IntToStr(qckFactServ8_5BB.PageNumber);
            qckFactServ8_5BB.xtipoVenta := 'Devolución';
            qckFactServ8_5BB.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;
            if (GlbImpReciboSinPreg = 1) then
            qckFactServ8_5BB.Print
            else
            if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
            begin
              qckFactServ8_5BB.PrinterSetup;
              qckFactServ8_5BB.Print;
            end else
            qckFactServ8_5BB.Preview;

            if (GlbImpReciboSinPreg = 0) then
            if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
            begin
              qckFactServ8_5BB.Preview;
            end;
          finally
          qckFactServ8_5BB.Free;
          qckFactServ8_5BB:=Nil;
        end;
      end else
      if GlbFacturaArtioffice = 1 then
      begin
        qckFactServArtioffice8_5:=TqckFactServArtioffice8_5.Create(Nil);
        try
          qckFactServArtioffice8_5.TPag.Caption:=
          IntToStr(qckFactServArtioffice8_5.PageNumber);
        finally
        qckFactServArtioffice8_5.Free;
        qckFactServArtioffice8_5:=Nil;
        end;

        qckFactServArtioffice8_5:=TqckFactServArtioffice8_5.Create(Nil);
        try
          qckFactServArtioffice8_5.xtipoVenta := 'Devolución';
          qckFactServArtioffice8_5.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;;
          if (GlbImprimeReciboFact = 1) then
          begin
            if (GlbImpReciboSinPreg = 1) then
            qckFactServArtioffice8_5.Print
            else
            if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
            begin
              qckFactServArtioffice8_5.PrinterSetup;
              qckFactServArtioffice8_5.Print;
            end else
            qckFactServArtioffice8_5.Preview;

            if (GlbImpReciboSinPreg = 0) then
            if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
            begin
              qckFactServArtioffice8_5.Preview;
            end;
          end;
          reciboImpreso := True;
        finally
        qckFactServArtioffice8_5.Free;
        qckFactServArtioffice8_5:=Nil;
        end;
      end else
      begin
        qckFactCredArtioffice8_5_F_1:=TqckFactCredArtioffice8_5_F_1.Create(Nil);
        qckFactCredArtioffice8_5_F_1.Prepare;
        glbTPag := qckFactCredArtioffice8_5_F_1.PageNumber;
        try
          if (frmProcVentaRapida.rxVentaNumeroFactura.AsString <> '') then
             qckFactCredArtioffice8_5_F_1.qrLabelFactOrigen.Caption:='#Factura: '+frmProcVentaRapida.rxVentaNumeroFactura.AsString
          else
          qckFactCredArtioffice8_5_F_1.qrLabelFactOrigen.Caption:='';
          qckFactCredArtioffice8_5_F_1.QRLabel4.Caption:='DEVOLUCION';
          qckFactCredArtioffice8_5_F_1.Preview;
          finally
          qckFactCredArtioffice8_5_F_1.Free;
          qckFactCredArtioffice8_5_F_1:=Nil;
        end;
      end;
    end;
  end else
  begin
    ImpFacturaservicio(dmfactura.qryFactReimpMaster.Params[0].Value,True);
  end;
end;

end;
Procedure ReImprimirRecibo;
var
  flag : boolean;
begin

  if frmProcVentaRapida.rxVenta.RecordCount > 0 then
  begin
    MessageDlg('Terminar o cancelar transaccion en curso.',mtInformation,[mbok],0);
    exit;
  end;
  TipoVenta:='CONTADO';
  if (UpperCase(GLBFormatoFactura) = 'FORMAEXPLODISMAR') then
  //t ImprimeFacturaEXDMAR(0,TipoVenta,'','Recibos')
  else
  if (UpperCase(GLBFormatoFactura) = 'FORMAFACOCO') then
  ImprimirFacturaRepuesto(dmfactura.qryFactReimpMaster.Params[0].Value)
  else
  if (GlBAyaco = 1) or (GlbSizeFact8x11 = 1) or (GlBTapiceria = 1) or (GlBInveraf =1) then
      begin
        qckFactServ8_5Ayaco:=TqckFactServ8_5Ayaco.Create(Nil);
        try
          qckFactServ8_5Ayaco.TPag.Caption:=
          IntToStr(qckFactServ8_5Ayaco.PageNumber);
          qckFactServ8_5Ayaco.xtipoVenta := TipoVenta;
          qckFactServ8_5Ayaco.valorNCF:= dmReportes.qryViewVentasMastNUMERO_NCF.Value;
          if dmReportes.qryViewVentasMastMONTO_EXONERADO_ITBIS.Value > 0 then
          begin
            //qckFactServ8_5Ayaco.QRLabel25.left:=505;
            qckFactServ8_5Ayaco.QRLabel25.Caption :='ITBIS Exonerado';
          end  else
          qckFactServ8_5Ayaco.QRLabel25.Caption :='ITBIS';

          if (GlbImpReciboSinPreg = 1) then
            qckFactServ8_5Ayaco.Print
            else
            if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
            begin
              qckFactServ8_5Ayaco.PrinterSetup;
              qckFactServ8_5Ayaco.Print;
            end else
            qckFactServ8_5Ayaco.Preview;

            if (GlbImpReciboSinPreg = 0) then
            if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
            begin 
              qckFactServ8_5Ayaco.Preview;
            end;
            if GlbImpPDF then
            begin
        if not dmReportes.qryViewVentasMastNUMERO_FACTURA.IsNull then
        ReportExportPDF(qckCotServ8_5Ayaco,GlbRutaFacturas+'\Facturas'+IntToStr(dmReportes.qryViewVentasMastNUMERO_FACTURA.Value)+'.pdf')
        else
        ReportExportPDF(qckCotServ8_5Ayaco,GlbRutaFacturas+'\Facturas'+IntToStr(dmReportes.qryViewVentasMastNUMERO_DOC_PAGO.AsInteger)+'.pdf')
        end;
        finally
        qckFactServ8_5Ayaco.Free;
        qckFactServ8_5Ayaco:=Nil;
        end;
        exit;
      end else
      if (GlbDocStandar = 1) then
      begin
        qckFactServ_8_5Standard:=TqckFactServ_8_5Standard.Create(Nil);
        try
          qckFactServ_8_5Standard.TPag.Caption:=
          IntToStr(qckFactServ_8_5Standard.PageNumber);
          qckFactServ_8_5Standard.xtipoVenta := TipoVenta;
          qckFactServ_8_5Standard.valorNCF:= dmReportes.qryViewVentasMastNUMERO_NCF.Value;
          if dmReportes.qryViewVentasMastMONTO_EXONERADO_ITBIS.Value > 0 then
          begin
            qckFactServ_8_5Standard.QRLabel25.Caption :='ITBIS Exonerado';
          end  else
          qckFactServ_8_5Standard.QRLabel25.Caption :='ITBIS';

          if (GlbImpReciboSinPreg = 1) then
            qckFactServ_8_5Standard.Print
            else
            if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
            begin
              qckFactServ_8_5Standard.PrinterSetup;
              qckFactServ_8_5Standard.Print;
            end else
            qckFactServ_8_5Standard.Preview;

            if (GlbImpReciboSinPreg = 0) then
            if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
            begin 
              qckFactServ_8_5Standard.Preview;
            end;
            if (GlbImpPDF) then
            begin
              if not dmReportes.qryViewVentasMastNUMERO_FACTURA.IsNull then
              ReportExportPDF(qckFactServ_8_5Standard,GlbRutaRecibos+'\Recibos'+IntToStr(dmReportes.qryViewVentasMastNUMERO_FACTURA.Value)+'.pdf')
              else
              ReportExportPDF(qckFactServ_8_5Standard,GlbRutaRecibos+'\Recibos'+IntToStr(dmReportes.qryViewVentasMastNUMERO_DOC_PAGO.AsInteger)+'.pdf')
            end;
        finally
        qckFactServ_8_5Standard.Free;
        qckFactServ_8_5Standard:=Nil;
        end;
        exit;
      end else
      if (GLBECOM = 1) then   //Elias comunicaciones Santiago
      begin
        if (GlbFormatoConduce = 333) then //ECom
        begin
          qckRepConduceECom:=TqckRepConduceECom.Create(Nil);
          try
            qckRepConduceECom.Preview;
          finally
          qckRepConduceECom.free;
          qckRepConduceECom:=nil;
          end;
        end;
        QckFactServ_8_5ECom:=TQckFactServ_8_5ECom.Create(Nil);
        try
          QckFactServ_8_5ECom.rxVendedor.Close;
          QckFactServ_8_5ECom.rxVendedor.Open;
          if dmreportes.qryCantVendedoresSamCANTVENDEDORES.Value = 1 then
          begin
            if frmProcVentaRapida.qryEmpleado.Locate('codigo', dmreportes.qryViewVentasDetCodigo_Vendedor.Value,[]) then
            begin
              QckFactServ_8_5ECom.rxVendedor.Append;
              QckFactServ_8_5ECom.rxVendedorNombreVendedor.Value:=
              frmProcVentaRapida.qryEmpleadoNOMBREVENDEDOR.Value;
              QckFactServ_8_5ECom.rxVendedor.Post;
            end;
          end else
          begin
            QckFactServ_8_5ECom.rxVendedor.Close;
            QckFactServ_8_5ECom.rxVendedor.Open;
            QckFactServ_8_5ECom.rxVendedor.Append;
            QckFactServ_8_5ECom.rxVendedorNombreVendedor.Value:='';
            QckFactServ_8_5ECom.rxVendedor.Post;
          end;
          QckFactServ_8_5ECom.TPag.Caption:=
          IntToStr(QckFactServ_8_5ECom.PageNumber);
          QckFactServ_8_5ECom.xtipoVenta := TipoVenta;
          //QckFactServ_8_5ECom.valorNCF:= valorNCF;
          if dmReportes.qryViewVentasMastMONTO_EXONERADO_ITBIS.Value > 0 then
            begin
              //qckFactServ8_5Ayaco.QRLabel25.left:=505;
              QckFactServ_8_5ECom.QRLabel25.Caption :='ITBIS Exonerado';
            end  else
            QckFactServ_8_5ECom.QRLabel25.Caption :='ITBIS';

            if (GlbImpReciboSinPreg = 1) then
              QckFactServ_8_5ECom.Print
              else
            if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
            begin
              //QckFactServ_8_5ECom.QRImage2.Enabled:= False;
              QckFactServ_8_5ECom.PrinterSetup;
              QckFactServ_8_5ECom.Print;
            end else
            QckFactServ_8_5ECom.Preview;

            if (GlbImpReciboSinPreg = 0) then
            if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
            begin
              QckFactServ_8_5ECom.Preview;
            end;

            if GlbImpPDF then
            begin
              if not dmReportes.qryViewVentasMastNUMERO_FACTURA.IsNull then
              ReportExportPDF(QckFactServ_8_5ECom,GlbRutaRecibos+'\Recibos'+IntToStr(dmReportes.qryViewVentasMastNUMERO_FACTURA.Value)+'.pdf')
              else
              ReportExportPDF(QckFactServ_8_5ECom,GlbRutaRecibos+'\Recibos'+IntToStr(dmReportes.qryViewVentasMastNUMERO_DOC_PAGO.AsInteger)+'.pdf')
            end;
          finally
          QckFactServ_8_5ECom.Free;
          QckFactServ_8_5ECom:=Nil;
          end;
      end else
      if (GLBSAM = 1) then
      begin
        if (GlbUsaFctMexico = 1) then
        begin
          qckFactServ_8_5SAMNewM:=TqckFactServ_8_5SAMNewM.Create(Nil);
          try
            qckFactServ_8_5SAMNewM.rxVendedor.Close;
            qckFactServ_8_5SAMNewM.rxVendedor.Open;
            if dmreportes.qryCantVendedoresSamCANTVENDEDORES.Value = 1 then
            begin
              if frmProcVentaRapida.qryEmpleado.Locate('codigo', dmreportes.qryViewVentasDetCodigo_Vendedor.Value,[]) then
              begin
                qckFactServ_8_5SAMNewM.rxVendedor.Append;
                qckFactServ_8_5SAMNewM.rxVendedorNombreVendedor.Value:=
                frmProcVentaRapida.qryEmpleadoNOMBREVENDEDOR.Value;
                qckFactServ_8_5SAMNewM.rxVendedor.Post;
              end;
            end else
            begin
              qckFactServ_8_5SAMNewM.rxVendedor.Close;
              qckFactServ_8_5SAMNewM.rxVendedor.Open;
              qckFactServ_8_5SAMNewM.rxVendedor.Append;
              qckFactServ_8_5SAMNewM.rxVendedorNombreVendedor.Value:='';
              qckFactServ_8_5SAMNewM.rxVendedor.Post;
              end;
              qckFactServ_8_5SAMNewM.TPag.Caption:=
              IntToStr(qckFactServ_8_5SAMNewM.PageNumber);
              qckFactServ_8_5SAMNewM.xtipoVenta := TipoVenta;
              //qckFactServ_8_5SAMNewM.valorNCF:= valorNCF;
              if dmReportes.qryViewVentasMastMONTO_EXONERADO_ITBIS.Value > 0 then
              begin
                qckFactServ_8_5SAMNewM.QRLabel25.Caption :='ITBIS Exonerado';
              end  else
              qckFactServ_8_5SAMNewM.QRLabel25.Caption :='ITBIS';

              if (GlbImpReciboSinPreg = 1) then
              qckFactServ_8_5SAMNewM.Print
              else
              if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
              begin
                //qckFactServ_8_5SAMNewM.QRImage2.Enabled:= False;
                qckFactServ_8_5SAMNewM.PrinterSetup;
                qckFactServ_8_5SAMNewM.Print;
              end else
              qckFactServ_8_5SAMNewM.Preview;

              if (GlbImpReciboSinPreg = 0) then
              if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
              begin
                qckFactServ_8_5SAMNewM.Preview;
              end;
             if GlbImpPDF then
             begin
               if not dmReportes.qryViewVentasMastNUMERO_FACTURA.IsNull then
               ReportExportPDF(qckFactServ_8_5SAMNewM,GlbRutaRecibos+'\Recibos'+IntToStr(dmReportes.qryViewVentasMastNUMERO_FACTURA.Value)+'.pdf')
               else
               ReportExportPDF(qckFactServ_8_5SAMNewM,GlbRutaRecibos+'\Recibos'+IntToStr(dmReportes.qryViewVentasMastNUMERO_DOC_PAGO.AsInteger)+'.pdf')
             end;
          finally
          qckFactServ_8_5SAMNewM.Free;
          qckFactServ_8_5SAMNewM:=Nil;
          end;
        end else
        if (GLBFORMATOFACTPREIMP = 0) then
        begin
        qckFactServ_8_5SAM:=TqckFactServ_8_5SAM.Create(Nil);
        try
          qckFactServ_8_5SAM.rxVendedor.Close;
          qckFactServ_8_5SAM.rxVendedor.Open;
          if dmreportes.qryCantVendedoresSamCANTVENDEDORES.Value = 1 then
          begin
            if frmProcVentaRapida.qryEmpleado.Locate('codigo', dmreportes.qryViewVentasDetCodigo_Vendedor.Value,[]) then
            begin
              qckFactServ_8_5SAM.rxVendedor.Append;
              qckFactServ_8_5SAM.rxVendedorNombreVendedor.Value:=
              frmProcVentaRapida.qryEmpleadoNOMBREVENDEDOR.Value;
              qckFactServ_8_5SAM.rxVendedor.Post;
            end;
          end else
          begin
            //rxVendedorNombreVendedor
            qckFactServ_8_5SAM.rxVendedor.Close;
            qckFactServ_8_5SAM.rxVendedor.Open;
            qckFactServ_8_5SAM.rxVendedor.Append;
            qckFactServ_8_5SAM.rxVendedorNombreVendedor.Value:='';
            qckFactServ_8_5SAM.rxVendedor.Post;
          end;
          qckFactServ_8_5SAM.TPag.Caption:=
          IntToStr(qckFactServ_8_5SAM.PageNumber);
          qckFactServ_8_5SAM.xtipoVenta := TipoVenta;
          qckFactServ_8_5SAM.valorNCF:= dmReportes.qryViewVentasMastNUMERO_NCF.Value;
          if dmReportes.qryViewVentasMastMONTO_EXONERADO_ITBIS.Value > 0 then
          begin
            //qckFactServ8_5Ayaco.QRLabel25.left:=505;
            qckFactServ_8_5SAM.QRLabel25.Caption :='ITBIS Exonerado';
          end  else
          qckFactServ_8_5SAM.QRLabel25.Caption :='ITBIS';

          if (GlbImpReciboSinPreg = 1) then
            qckFactServ_8_5SAM.Print
            else
            if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
            begin
              qckFactServ_8_5SAM.QRImage2.Enabled:= False;
              qckFactServ_8_5SAM.PrinterSetup;
              qckFactServ_8_5SAM.Print;
            end else
            qckFactServ_8_5SAM.Preview;

            if (GlbImpReciboSinPreg = 0) then
            if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
            begin 
              qckFactServ_8_5SAM.Preview;
            end;
        if GlbImpPDF then
        begin
        if not dmReportes.qryViewVentasMastNUMERO_FACTURA.IsNull then
        ReportExportPDF(qckFactServ_8_5SAM,GlbRutaRecibos+'\Recibos'+IntToStr(dmReportes.qryViewVentasMastNUMERO_FACTURA.Value)+'.pdf')
        else
        ReportExportPDF(qckFactServ_8_5SAM,GlbRutaRecibos+'\Recibos'+IntToStr(dmReportes.qryViewVentasMastNUMERO_DOC_PAGO.AsInteger)+'.pdf')
        end;
        finally
        qckFactServ_8_5SAM.Free;
        qckFactServ_8_5SAM:=Nil;
        end;
        end else
        begin
          //formatosamnew
        qckFactServ_8_5SAMNew:=TqckFactServ_8_5SAMNew.Create(Nil);
        try
          qckFactServ_8_5SAMNew.rxVendedor.Close;
          qckFactServ_8_5SAMNew.rxVendedor.Open;
          if dmreportes.qryCantVendedoresSamCANTVENDEDORES.Value = 1 then
          begin
            if frmProcVentaRapida.qryEmpleado.Locate('codigo', dmreportes.qryViewVentasDetCodigo_Vendedor.Value,[]) then
            begin
              qckFactServ_8_5SAMNew.rxVendedor.Append;
              qckFactServ_8_5SAMNew.rxVendedorNombreVendedor.Value:=
              frmProcVentaRapida.qryEmpleadoNOMBREVENDEDOR.Value;
              qckFactServ_8_5SAMNew.rxVendedor.Post;
            end;
          end else
          begin
            //rxVendedorNombreVendedor
            qckFactServ_8_5SAMNew.rxVendedor.Close;
            qckFactServ_8_5SAMNew.rxVendedor.Open;
            qckFactServ_8_5SAMNew.rxVendedor.Append;
            qckFactServ_8_5SAMNew.rxVendedorNombreVendedor.Value:='';
            qckFactServ_8_5SAMNew.rxVendedor.Post;
          end;
          qckFactServ_8_5SAMNew.TPag.Caption:=
          IntToStr(qckFactServ_8_5SAMNew.PageNumber);
          qckFactServ_8_5SAMNew.xtipoVenta := TipoVenta;
          qckFactServ_8_5SAMNew.valorNCF:= dmReportes.qryViewVentasMastNUMERO_NCF.Value;
          if dmReportes.qryViewVentasMastMONTO_EXONERADO_ITBIS.Value > 0 then
          begin
            //qckFactServ8_5Ayaco.QRLabel25.left:=505;
            qckFactServ_8_5SAMNew.QRLabel25.Caption :='ITBIS Exonerado';
          end  else
          qckFactServ_8_5SAMNew.QRLabel25.Caption :='ITBIS';

          if (GlbImpReciboSinPreg = 1) then
            qckFactServ_8_5SAMNew.Print
            else
            if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
            begin
              qckFactServ_8_5SAMNew.QRImage2.Enabled:= False;
              qckFactServ_8_5SAMNew.PrinterSetup;
              qckFactServ_8_5SAMNew.Print;
            end else
            qckFactServ_8_5SAMNew.Preview;

            if (GlbImpReciboSinPreg = 0) then
            if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
            begin 
              qckFactServ_8_5SAMNew.Preview;
            end;
        if GlbImpPDF then
        begin
        if not dmReportes.qryViewVentasMastNUMERO_FACTURA.IsNull then
        ReportExportPDF(qckFactServ_8_5SAMNew,GlbRutaRecibos+'\Recibos'+IntToStr(dmReportes.qryViewVentasMastNUMERO_FACTURA.Value)+'.pdf')
        else
        ReportExportPDF(qckFactServ_8_5SAMNew,GlbRutaRecibos+'\Recibos'+IntToStr(dmReportes.qryViewVentasMastNUMERO_DOC_PAGO.AsInteger)+'.pdf')
        end;
        finally
        qckFactServ_8_5SAMNew.Free;
        qckFactServ_8_5SAMNew:=Nil;
        end;
        end;
        exit;
      end else
      if (GlBBurgos = 1) then
      begin
        qckFactServ8_5BB:=TqckFactServ8_5BB.Create(Nil);
        try
          //qckFactServ8_5BB.TPag.Caption:=
          //IntToStr(qckFactServ8_5BB.PageNumber);
          qckFactServ8_5BB.xtipoVenta:= TipoVenta;
          qckFactServ8_5BB.valorNCF:= dmReportes.qryViewVentasMastNUMERO_NCF.Value;
          if (GlbImpReciboSinPreg = 1) then
            qckFactServ8_5BB.Print
            else
            if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
            begin
              qckFactServ8_5BB.PrinterSetup;
              qckFactServ8_5BB.Print;
            end else
            qckFactServ8_5BB.Preview;

            if (GlbImpReciboSinPreg = 0) then
            if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
            begin
              qckFactServ8_5BB.Preview;
            end;
        finally
        qckFactServ8_5BB.Free;
        qckFactServ8_5BB:=Nil;
        end;
        exit;
      end else
  if (Glbcolmado = 1) then
  begin
    if esContado then
    begin
      //qckRepReciboReimpTicketSurtidora:=TqckRepReciboReimpTicketSurtidora.Create(Nil);
      if (GlbImprimeTicketCustom = 1) then
    begin
      //TTicketCustomSize.PrintTicketReimpSurtidoraESCPos(const APrinterName, ATipoVenta, AValorNCF,
      //ANombreCteGenerico, AStrCopia: string): Boolean;
      dmDatos.qryImpresoras.Close;
  		dmDatos.qryImpresoras.Open;
	  	if dmDatos.qryImpresoras.Locate('IDMODULO;IDREPORTE', VarArrayOf([1, 6]), []) then
      begin 
        if dmReportes.qryViewVentasMastCodigo_cte.Value > 0 then
		    begin
  		    //qckRepReciboReimpTicketSurtidoraNew.qrLabelRNC.Caption := 'RNC-' + qryClienteRNC_NUMERO.Value;
    		  //t _nombreGenerico:=qryClienteNOMBRE_CTE.Value;
  	  	end;
    		//else
   		  //qckRepReciboReimpTicketSurtidoraNew.qrLabelRNC.Caption := '';

        if not TTicketCustomSize.PrintTicketReimpSurtidoraESCPos(dmDatos.qryImpresorasNOMBRE_IMPRESORA.Value, TipoVenta, dmReportes.qryViewVentasMastNUMERO_NCF.Value,
        ''{_nombreGenerico}, '1') then
        MessageDlg('No fue posible imprimir el ticket, verifique.',mtWarning,[mbok],0);
      end else
      begin
        MessageDlg('Debes configurar el nombre de la impresora punto de venta.',mtError,[mbok],0);
      end;
    end else
    begin
      qckRepReciboReimpTicketSurtidoraNew:=TqckRepReciboReimpTicketSurtidoraNew.Create(Nil);
      try
        if GlbImpQREncuesta = 0 then
        begin
          if (GlbImpQREncuesta = 0) then
          qckRepReciboReimpTicketSurtidoraNew.Height:=761;

          //qckRepReciboReimpTicketSurtidoraNew.Page.Length:=6.156; //sin encuesta
          qckRepReciboReimpTicketSurtidoraNew.ChildBand14.Height:=0;
          //qckRepReciboReimpTicketSurtidoraNew.ChildBand13.HasChild:=False;
        end;
        qckRepReciboReimpTicketSurtidoraNew.SetParameterValues;
        if  frmProcVentaRapida.rxspinImpCantCopias.Decimal > 0 then
        qckRepReciboReimpTicketSurtidoraNew.PrinterSettings.Copies:= StrToInt(frmProcVentaRapida.rxspinImpCantCopias.Text);
        if GlbEsCopia then
        qckRepReciboReimpTicketSurtidoraNew.strcopia :=' (COPIA)'
        else
        qckRepReciboReimpTicketSurtidoraNew.strcopia :='';

        //qckRepReciboReimpTicketSurtidoraNew.ncfDesc := GlbDescNCF;
        if Length(frmProcVentaRapida.edtObservacion.Text) > 0 then
        qckRepReciboReimpTicketSurtidoraNew.nombreCteGenerico:=frmProcVentaRapida.edtObservacion.Text;
        if (dmReportes.qryViewVentasMastCodigo_cte.value > 0) then
        begin
          qckRepReciboReimpTicketSurtidoraNew.qrLabelRNC.Caption:='RNC-' + frmProcVentaRapida.qryClienteRNC_NUMERO.Value;
          qckRepReciboReimpTicketSurtidoraNew.nombreCteGenerico:= frmProcVentaRapida.qryClienteNOMBRE_CTE.Value;
        end
        else qckRepReciboReimpTicketSurtidoraNew.qrLabelRNC.Caption:='';
        qckRepReciboReimpTicketSurtidoraNew.xtipoVenta := TipoVenta;
        //qckRepReciboReimpTicketSurtidoraNew.valorNCF   := valorNCF;
        qckRepReciboReimpTicketSurtidoraNew.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;
        //pulgadaInc:=0.86;
        dmFactura.qryVentaFacturaDet.Last;

      if (glbQckUnaPagina = 1) then
      begin
        if (dmFactura.qryVentaFacturaDet.RecordCount = 1) and
           (qckRepReciboReimpTicketSurtidoraNew.Page.Length < 6.65)  then
        qckRepReciboReimpTicketSurtidoraNew.Page.Length:=5.759
        else
        if dmFactura.qryVentaFacturaDet.RecordCount >= 2 then
        qckRepReciboReimpTicketSurtidoraNew.Page.Length:= qckRepReciboReimpTicketSurtidoraNew.Page.Length +
        (dmFactura.qryVentaFacturaDet.RecordCount - 1 ) * 0.25;

        flag:=true;
        dmFactura.qryVentaFacturaDet.First;
        //dmFactura.qryVentaFacturaDet.Last;
        if dmFactura.qryVentaFacturaDet.RecordCount > 25  then
        qckRepReciboReimpTicketSurtidoraNew.Page.Length:=23
        else
        if dmFactura.qryVentaFacturaDet.RecordCount > 29  then
        qckRepReciboReimpTicketSurtidoraNew.Page.Length:=26;

        qckRepReciboReimpTicketSurtidoraNew.Prepare;

        if ((dmFactura.qryVentaFacturaDet.RecordCount >= 1) and
           ((dmFactura.qryVentaFacturaDet.RecordCount < 10)
            or (qckRepReciboReimpTicketSurtidoraNew.PageNumber = 2))) then
        begin
          frmProcVentaRapida.ProgressBar1.Visible :=True;
          frmProcVentaRapida.ProgressBar1.Position:=0;
          frmProcVentaRapida.ProgressBar1.Max:=dmFactura.qryVentaFacturaDet.RecordCount;
          if (GlbIncLargoPapel = 1) then
          begin
          repeat
          begin
            frmProcVentaRapida.ProgressBar1.StepIt;  //revisar proceso octubre 10 2024
            //cRc:=cRc + 1;
            if (qckRepReciboReimpTicketSurtidoraNew.PageNumber > 1) then
            begin
              qckRepReciboReimpTicketSurtidoraNew.Page.Length:=qckRepReciboReimpTicketSurtidoraNew.Page.Length + 0.50;
              qckRepReciboReimpTicketSurtidoraNew.Prepare;
              flag:=False;
            end else
            if (qckRepReciboReimpTicketSurtidoraNew.PageNumber = 1) then
                break;
            if (qckRepReciboReimpTicketSurtidoraNew.PageNumber = 1) then
                break;
            end;
            until flag = true;
            end;
          end;
        end; //if (glbQckUnaPagina = 1) then
        frmProcVentaRapida.ProgressBar1.Visible:=False;
        dmFactura.qryVentaFacturaDet.last;
        if (dmFactura.qryVentaFacturaDet.RecordCount >15) and (GlbImpFormatoPDF = 1) then
        begin
          frmProcVentaRapida.ImprimirEnFormatoPDF(1,6);
        end else
        begin
          dmDatos.qryImpresoras.Close;
          dmDatos.qryImpresoras.Open;
          if dmDatos.qryImpresoras.Locate('IDMODULO;IDREPORTE',
          VarArrayOf([1,6]),[]) then     //Factura/Recibo Punto Venta
          qckRepReciboReimpTicketSurtidoraNew.PrinterSettings.PrinterIndex:=
          GetImpresora(dmDatos.qryImpresorasNOMBRE_IMPRESORA.Value);

          if (GlbImpReciboSinPreg = 1) and (GlbImprimeReciboFact = 1) then
          qckRepReciboReimpTicketSurtidoraNew.Print
          else
          if MessageDlg('Imprimir?',mtInformation, [mbYes, mbNo], 0)=mryes then
          begin
            if (GlbImprimeReciboFact = 1) then
            begin
              qckRepReciboReimpTicketSurtidoraNew.PrinterSetup;
              qckRepReciboReimpTicketSurtidoraNew.Print;
            end;
          end else
          qckRepReciboReimpTicketSurtidoraNew.Preview;
          reciboImpreso:=True;
        end;

        reciboImpreso:=True;
        //if GlbImpTicketVtaAgua = 1 then
        //ImprimirTicketVtaAgua(ipStpInsertVentMast.Params[0].Value);
      finally
      qckRepReciboReimpTicketSurtidoraNew.Free;
      qckRepReciboReimpTicketSurtidoraNew:=Nil;
      end;
      end; 
      exit;
    end else
    if not esContado  then
    begin
      if Glbcolmado = 1 then
      begin
        dmreportes.qryViewVentasMast.Close;
        dmreportes.qryViewVentasMast.Params[0].Value:= dmFactura.qryVentaFacturaNUMERO.Value;
        dmreportes.qryViewVentasMast.Open;
      //qckRepReciboReimpTicketSurtidora:=TqckRepReciboReimpTicketSurtidora.Create(Nil);
      qckRepReciboReimpTicketSurtidoraNew:=TqckRepReciboReimpTicketSurtidoraNew.Create(Nil);
      try
        if GlbImpQREncuesta = 0 then
        begin
          if (GlbImpQREncuesta = 0) then
          qckRepReciboReimpTicketSurtidoraNew.Height:=761;

          //qckRepReciboReimpTicketSurtidoraNew.Page.Length:=6.156; //sin encuesta
          qckRepReciboReimpTicketSurtidoraNew.ChildBand14.Height:=0;
          //qckRepReciboReimpTicketSurtidoraNew.ChildBand13.HasChild:=False;
        end;
        qckRepReciboReimpTicketSurtidoraNew.SetParameterValues;
        if frmProcVentaRapida.rxspinImpCantCopias.Decimal > 0 then
        qckRepReciboReimpTicketSurtidoraNew.PrinterSettings.Copies:= StrToInt(frmProcVentaRapida.rxspinImpCantCopias.Text);
        if GlbEsCopia then
        qckRepReciboReimpTicketSurtidoraNew.strcopia :=' (COPIA)'
        else        
        qckRepReciboReimpTicketSurtidoraNew.strcopia :='';

//        qckRepReciboReimpTicketSurtidoraNew.ncfDesc := GlbDescNCF;
        if Length(frmProcVentaRapida.edtObservacion.Text) > 0 then
        qckRepReciboReimpTicketSurtidoraNew.nombreCteGenerico:=frmProcVentaRapida.edtObservacion.Text;
        if (dmReportes.qryViewVentasMastCodigo_cte.value > 0) then
        begin
          qckRepReciboReimpTicketSurtidoraNew.qrLabelRNC.Caption:='RNC-' + frmProcVentaRapida.qryClienteRNC_NUMERO.Value;
          qckRepReciboReimpTicketSurtidoraNew.nombreCteGenerico:= frmProcVentaRapida.qryClienteNOMBRE_CTE.Value;
        end
        else qckRepReciboReimpTicketSurtidoraNew.qrLabelRNC.Caption:='';
        qckRepReciboReimpTicketSurtidoraNew.xtipoVenta := TipoVenta;
        //qckRepReciboReimpTicketSurtidoraNew.valorNCF   := valorNCF;
        qckRepReciboReimpTicketSurtidoraNew.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;
        //pulgadaInc:=0.86;
        dmFactura.qryVentaFacturaDet.Last;
      if (glbQckUnaPagina = 1) then
      begin
        if (dmFactura.qryVentaFacturaDet.RecordCount = 1) and
           (qckRepReciboReimpTicketSurtidoraNew.Page.Length < 6.65)  then
        qckRepReciboReimpTicketSurtidoraNew.Page.Length:=5.759
        else
        if dmFactura.qryVentaFacturaDet.RecordCount >= 2 then
        qckRepReciboReimpTicketSurtidoraNew.Page.Length:= qckRepReciboReimpTicketSurtidoraNew.Page.Length +
        (dmFactura.qryVentaFacturaDet.RecordCount - 1 ) * 0.25;

        flag:=true;
        dmFactura.qryVentaFacturaDet.First;
        dmFactura.qryVentaFacturaDet.Last;
        if dmFactura.qryVentaFacturaDet.RecordCount > 25  then
        qckRepReciboReimpTicketSurtidoraNew.Page.Length:=23
        else
        if dmFactura.qryVentaFacturaDet.RecordCount > 29  then
        qckRepReciboReimpTicketSurtidoraNew.Page.Length:=26;

        qckRepReciboReimpTicketSurtidoraNew.Prepare;

        if ((dmFactura.qryVentaFacturaDet.RecordCount >= 1) and
           ((dmFactura.qryVentaFacturaDet.RecordCount < 10)
            or (qckRepReciboReimpTicketSurtidoraNew.PageNumber = 2))) then
        begin
          frmProcVentaRapida.ProgressBar1.Visible :=True;
          frmProcVentaRapida.ProgressBar1.Position:=0;
          frmProcVentaRapida.ProgressBar1.Max:=dmFactura.qryVentaFacturaDet.RecordCount;
          if (GlbIncLargoPapel = 1) then
          begin
          repeat
          begin
            frmProcVentaRapida.ProgressBar1.StepIt;
            //cRc:=cRc + 1;
            if (qckRepReciboReimpTicketSurtidoraNew.PageNumber > 1) then
            begin
              qckRepReciboReimpTicketSurtidoraNew.Page.Length:=qckRepReciboReimpTicketSurtidoraNew.Page.Length + 0.26;
              qckRepReciboReimpTicketSurtidoraNew.Prepare;
              flag:=False;
            end else
            if (qckRepReciboReimpTicketSurtidoraNew.PageNumber = 1) then
                break;
            if (qckRepReciboReimpTicketSurtidoraNew.PageNumber = 1) then
                break;
            end;
            until flag = true;
            end;
          end;
        end;//if (glbQckUnaPagina = 1) then
      
        frmProcVentaRapida.ProgressBar1.Visible:=False;
        dmFactura.qryVentaFacturaDet.last;
        if (dmFactura.qryVentaFacturaDet.RecordCount >15) and (GlbImpFormatoPDF = 1) then
        begin
          frmProcVentaRapida.ImprimirEnFormatoPDF(1,6);
        end else
        begin
          dmDatos.qryImpresoras.Close;
          dmDatos.qryImpresoras.Open;
          if dmDatos.qryImpresoras.Locate('IDMODULO;IDREPORTE',
          VarArrayOf([1,6]),[]) then     //Factura/Recibo Punto Venta
          qckRepReciboReimpTicketSurtidoraNew.PrinterSettings.PrinterIndex:=
          GetImpresora(dmDatos.qryImpresorasNOMBRE_IMPRESORA.Value);

          if (GlbImpReciboSinPreg = 1) and (GlbImprimeReciboFact = 1) then
          qckRepReciboReimpTicketSurtidoraNew.Print
          else
          if MessageDlg('Imprimir?',mtInformation, [mbYes, mbNo], 0)=mryes then
          begin
            if (GlbImprimeReciboFact = 1) then
            begin
              qckRepReciboReimpTicketSurtidoraNew.PrinterSetup;
              qckRepReciboReimpTicketSurtidoraNew.Print;
            end;
          end else
          qckRepReciboReimpTicketSurtidoraNew.Preview;
          reciboImpreso:=True;
        end;
         reciboImpreso:=True;
          //todo if GlbImpTicketVtaAgua = 1 then
          //todo ImprimirTicketVtaAgua(ipStpInsertVentMast.Params[0].Value);

        finally
        qckRepReciboReimpTicketSurtidoraNew.Free;
        qckRepReciboReimpTicketSurtidoraNew:=Nil;
        end;
      end;
      exit;
    END;
  END;
  ///****************************fin****************
  frmEdicionVenta:=TfrmEdicionVenta.Create(Nil);
  try
    frmEdicionVenta.tblDatosVenta.Close;
    if (GlbUsaFctMexico = 1) and (not frmProcVentaRapida.TotalesFechaIniciaPoliza.IsNull) then
    frmEdicionVenta.tblDatosVenta.Params[0].Value:= ExtraerFecha(frmProcVentaRapida.TotalesFechaIniciaPoliza.Value)
    else
    frmEdicionVenta.tblDatosVenta.Params[0].Value:= ExtraerFecha(GlbFechaTrnDiaria);

    frmEdicionVenta.tblDatosVenta.Open;

    if frmEdicionVenta.tblDatosVentaforma_pago.AsInteger = 1 then
    esContado :=True else esContado :=False;

    if esContado then
        numerodocReimp := frmEdicionVenta.tblDatosDetNUMERO.AsInteger
    else
        numerodocReimp := frmEdicionVenta.tblDatosVentaNUMERO_FACTURA.Value;

    if Not EsModificandoFactura and not esContado  And (numerodocReimp <= 0) then
    frmEdicionVenta.EditN1.Text:=InputBox('Re-Imprimir recibo','Entre número','')
    else frmEdicionVenta.EditN1.Text := IntToStr(numerodocReimp);
    frmEdicionVenta.Button1Click(nil);
    frmEdicionVenta.BitBtn3.Click;
    frmEdicionVenta.Caption := 'Procesa devolución';

    frmProcVentaRapida.rxSolDatoscte.Close;
    frmProcVentaRapida.rxSolDatoscte.Open;
    frmProcVentaRapida.rxSolDatoscte.Insert;
    frmProcVentaRapida.rxSolDatoscteNombre.Value    := frmEdicionVenta.qryClientesNOMBRE_CTE.Value;
    frmProcVentaRapida.rxSolDatoscteDireccion1.Value:= frmEdicionVenta.qryClientesDIRECCION_CONT.Value;
    frmProcVentaRapida.rxSolDatoscteDireccion2.Value:= '';
    frmProcVentaRapida.rxSolDatoscteCedula.Value    := frmEdicionVenta.qryClientesCEDULA.Value;
    frmProcVentaRapida.rxSolDatoscteCiudad.Value    := frmEdicionVenta.qryClientesCIUDAD.Value;
    frmProcVentaRapida.rxSolDatoscteTelefono.Value  := frmEdicionVenta.qryClientesTELEF_CONTACTO.Value;
    frmProcVentaRapida.rxSolDatoscte.Post;

    begin
      frmProcVentaRapidaEdicion:=TfrmProcVentaRapidaEdicion.Create(Nil);
      frmProcVentaRapidaEdicion.rxVenta.Close;
      frmProcVentaRapidaEdicion.rxVenta.Open;
      if frmProcVentaRapidaEdicion.tablaPropietario.State = dsBrowse then
      frmProcVentaRapidaEdicion.tablaPropietario.Edit;
      frmProcVentaRapidaEdicion.tablaPropietarioCodigoPropietario.Value:=
      frmEdicionVenta.qryClientesCODIGO_CTE.Value;
      frmProcVentaRapidaEdicion.tablaPropietario.Post;

      frmEdicionVenta.tblDatosDet.First;
      While Not frmEdicionVenta.tblDatosDet.Eof do
      begin
        //frmProcVentaRapidaEdicion.rxVenta.State;
        frmProcVentaRapidaEdicion.rxVenta.Append;
        frmProcVentaRapidaEdicion.rxVentaSerie.Value       := frmEdicionVenta.tblDatosDetSERIE.Value;
        frmProcVentaRapidaEdicion.rxVentaglbcodVendedor.Value := frmEdicionVenta.qryClientesCOD_VENDEDOR.Value;
        frmProcVentaRapidaEdicion.rxVentaItbi.Value:=0;

        frmProcVentaRapidaEdicion.rxVentaNumeroTrn.Value   := frmEdicionVenta.tblDatosDetNUMERO.Value;

        frmProcVentaRapidaEdicion.rxVentaNumeroRecibo.Value:= frmEdicionVenta.tblDatosVentaNUMERO_DOC_PAGO.AsInteger;
        if not frmEdicionVenta.tblDatosVentaNUMERO_DOC_PAGO.IsNull then
        frmProcVentaRapidaEdicion.rxVentaNumeroDoc.Value:=   frmEdicionVenta.tblDatosVentaNUMERO_DOC_PAGO.AsInteger
        else
        if not frmEdicionVenta.tblDatosVentaNUMERO_FACTURA.IsNull then
        frmProcVentaRapidaEdicion.rxVentaNumeroDoc.Value:= frmEdicionVenta.tblDatosVentaNUMERO_FACTURA.Value;
        
        frmProcVentaRapidaEdicion.rxVentaNumeroRecibo.Value:= frmEdicionVenta.tblDatosDetNUMERO.Value;
        frmProcVentaRapidaEdicion.rxVentaMoneda.Value      := frmEdicionVenta.tblDatosVentaMONEDA.Value;
        frmProcVentaRapidaEdicion.rxVentaMonedaBase.Value  := GetMonedaProducto(frmEdicionVenta.tblDatosDetCODIGO_PROD.AsInteger);
        frmProcVentaRapidaEdicion.rxVentamonto_tasa.Value := GlbMontoTasa(frmProcVentaRapidaEdicion.rxVentaMonedaBase.Value);

        frmProcVentaRapidaEdicion.rxVentaFecha.Value       := frmEdicionVenta.tblDatosVentaFECHA.Value;
        frmProcVentaRapidaEdicion.rxVentaCant.Value        := frmEdicionVenta.tblDatosDetCANTIDAD.Value;
        frmProcVentaRapidaEdicion.rxVentaPrecio.Value      := frmEdicionVenta.tblDatosDetPRECIO.Value;
        frmProcVentaRapidaEdicion.rxVentaMontoBruto.Value  := frmEdicionVenta.tblDatosDetVALOR_SERVICIO_DET.Value;
        frmProcVentaRapidaEdicion.rxVentaItbi.Value  :=  frmEdicionVenta.tblDatosDetITBI_DET.Value;
        frmProcVentaRapidaEdicion.rxVentaDescripcion.Value := frmEdicionVenta.tblDatosDetDESCRIPCION.Value;
        frmProcVentaRapidaEdicion.rxVentaMontoNeto.Value   := frmEdicionVenta.tblDatosDetVALOR_TOTAL_DET.Value;
        frmProcVentaRapidaEdicion.rxVentaCodArticulo.Value := frmEdicionVenta.tblDatosDetCODIGO_PROD.AsInteger;

        FGlbPorcItbi(ExtraerFecha(frmProcVentaRapidaEdicion.rxVentaFecha.Value),
        frmProcVentaRapidaEdicion.rxVentaCodArticulo.Value);
        frmProcVentaRapidaEdicion.rxVentaIDTasaITBIS.Value := GlbIDTasa;
        if (GlbIgI = 1) and (GlbCalcItbis = 0) then
        frmProcVentaRapidaEdicion.rxVentaIDTasaITBIS.Value := 1;

        frmProcVentaRapidaEdicion.rxVentaCodTexto.Value      := frmEdicionVenta.tblDatosDetCODIGO_PROD.Value;
        frmProcVentaRapidaEdicion.rxVentaCostoProducto.Value := frmEdicionVenta.tblDatosDetPrecio_Compra.Value;
        frmProcVentaRapidaEdicion.rxVentaRutaImagen.Value := frmProcVentaRapida.BuscarRutaImagen(frmEdicionVenta.tblDatosDetCODIGO_PROD.AsInteger);
        frmProcVentaRapidaEdicion.rxVentaporc_desc.Value   := frmEdicionVenta.tblDatosDetPORC_DESC_DET.Value;
        frmProcVentaRapidaEdicion.rxVentaSerieProd.Value   := frmEdicionVenta.tblDatosDetSERIE_PROD.Value;
        frmProcVentaRapidaEdicion.rxVentaTipoUnidad.Value  := frmEdicionVenta.tblDatosDetTIPO_UNIDAD.Value;

        if dmInventario.qryTipoUnidad.Locate('IDUNIDAD', frmEdicionVenta.tblDatosDetTIPO_UNIDAD.Value, []) then
        begin
          frmProcVentaRapidaEdicion.rxVentaDescUnidadMedida.Value:=
          dmInventario.qryTipoUnidadDESCRIPCION.Value;
        end;
        
        if not frmProcVentaRapidaEdicion.chkExento.Checked then
        frmProcVentaRapidaEdicion.rxVentaItbi.Value        := frmEdicionVenta.tblDatosDetITBI_DET.Value
        else frmProcVentaRapidaEdicion.rxVentaItbi.Value   := 0;
        frmProcVentaRapidaEdicion.rxVenta.Post;
        frmEdicionVenta.tblDatosDet.Next;
      end;

      frmProcVentaRapida.tblDatosVentaVehiculos.Close;
      frmProcVentaRapida.tblDatosVentaVehiculos.Params[0].Value := frmEdicionVenta.tblDatosDetNUMERO.Value;
      frmProcVentaRapida.tblDatosVentaVehiculos.Open;

      try
        frmProcVentaRapidaEdicion.BitBtn4.Enabled:=True;

        GlbDescNCF:= frmEdicionVenta.qryNCFDataDESCRIPCION.Value;
        if frmProcVentaRapidaEdicion.Totales.State = dsBrowse then
        frmProcVentaRapidaEdicion.Totales.Edit;
        frmProcVentaRapidaEdicion.TotalesqrLabelNcfDesc.Value:=GlbDescNCF;
        frmProcVentaRapidaEdicion.TotalesNombreCliente.Value :=
        frmEdicionVenta.tblDatosVentaNOMBRECLIENTE.Value;

        if frmProcVentaRapida.qryCliente.Locate('CODIGO_CTE',frmEdicionVenta.tblDatosVentaCODIGO_CTE.Value,[]) then
        begin
          frmProcVentaRapidaEdicion.TotalesNombreCliente.Value := frmProcVentaRapida.qryClienteNOMBRE_CTE.Value;
          frmProcVentaRapidaEdicion.TotalesDireccion.Value     := frmProcVentaRapida.qryClienteDIRECCION_CONT.Value;
          frmProcVentaRapidaEdicion.TotalesTelefono.Value      := frmProcVentaRapida.qryClienteTELEF_CONTACTO.Value;
          frmProcVentaRapidaEdicion.TotalesCodCliente.Value    := frmProcVentaRapida.qryClienteCODIGO_CTE.Value;
          frmProcVentaRapidaEdicion.TotalesRNC_NUMERO.Value    := frmProcVentaRapida.qryClienteRNC_NUMERO.Value;
        end;
        frmProcVentaRapidaEdicion.TotalesPorcDesAdicional.Value := frmEdicionVenta.tblDatosVentaPORC_DESCUENTO.Value;
        if frmProcVentaRapidaEdicion.Totales.State = dsBrowse then
        frmProcVentaRapidaEdicion.Totales.Edit;
        frmProcVentaRapidaEdicion.TotalesMontoDescAdicional.Value := frmEdicionVenta.tblDatosVentaMONTO_DESCUENTO.Value;
        if frmProcVentaRapidaEdicion.Totales.State In [dsEdit, dsInsert] then
        frmProcVentaRapidaEdicion.Totales.Post;

        frmProcVentaRapidaEdicion.BitBtn4Click(Nil);
      finally
      frmProcVentaRapidaEdicion.Free;
      frmProcVentaRapidaEdicion:=Nil;
      end;
    end;
  finally
  frmEdicionVenta.Free;
  frmEdicionVenta:=nil;
  end;
  frmProcVentaRapida.Show;
end;

Procedure ImprimeDocumento(serieDoc:Integer);
var
   tRecordsDet : Integer;
   flag : boolean;
begin
  GlbRutaLogoDoc:='';

  if GetFormatoTipoDoc(0,GlbRutaLogoDoc) then  //0	Factura Credito 8.5 Estandar
    GlbDocStandar:=1
  else
  GlbDocStandar:=0;
  if (GlBInMobi = 1) then
  begin
    frmConsultaFacturas:=TfrmConsultaFacturas.Create(Nil);
    try
      frmConsultaFacturas.rdgCredito.Checked := True;
      frmConsultaFacturas.EditN1.SetInteger(serieDoc);
      frmConsultaFacturas.BitBtn1Click(Nil);

      dmreportes.qryViewVentasMast.Close;
      dmreportes.qryViewVentasMast.Params[0].Value:= dmfactura.qryVentaFacturaNUMERO.Value;
      dmreportes.qryViewVentasMast.Open;
      ProcSetPathlogoTipoServicio(dmReportes.qryViewVentasMastTIPO_AFILIADO.Value);

      frmProcVentaRapida.LlenarrxSolDatoscte(dmFactura.qryVentaFacturaCODIGO_CTE.Value);

      if frmConsultaFacturas.rdgContado.Checked then
        esContado:= True
      else esContado:= False;

      if esContado then
        numerodocReimp := dmReportes.qryViewVentasMastNUMERO.AsInteger
      else
        numerodocReimp := dmReportes.qryViewVentasMastNUMERO_FACTURA.Value;
      
      if frmConsultaFacturas.rdgCredito.Checked then
      TipoVenta:='CREDITO'
      else
      tipoVenta:='CONTADO';
      dmVentas.qryVentaVocados.Close;
      dmVentas.qryVentaVocados.Params[0].Value:=dmReportes.qryViewVentasMastNUMERO.Value;
      dmVentas.qryVentaVocados.Open;
      if dmVentas.qryVentaVocados.RecordCount > 0 then
      begin
        qckFacturaLimao01:=TqckFacturaLimao01.Create(Nil);
        try
          if (GlbImpReciboSinPreg = 1) then
          qckFacturaLimao01.Print
          else
          if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
          begin
            qckFacturaLimao01.PrinterSetup;
            qckFacturaLimao01.Print;
          end else
          qckFacturaLimao01.Preview;
          if GlbImpPDF then
             ReportExport(qckFacturaLimao01,GlbRutaFacturas+'\Factura'+dmFactura.qryVentaFacturaNUMERO_FACTURA.AsString+'.pdf');

          if (GlbImpReciboSinPreg = 0) then
          if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
          begin
            qckFacturaLimao01.Preview;
          end;
        finally
        qckFacturaLimao01.Free;
        qckFacturaLimao01:=Nil;
        end;
      end;
    finally
    FreeAndNil(frmConsultaFacturas);
    end;
  end else
  if (UpperCase(GLBFormatoFactura) = 'FORMAFACOCO') and (GLBNumConduceCte = 1)then
  begin
      TipoVenta:='CONTADO';
      if dmfactura.qryVentaFacturaFORMA_PAGO.AsInteger in [7,8] then
      TipoVenta := 'CREDITO'
      else
      if dmfactura.qryVentaFacturaFORMA_PAGO.value = 1 then
      TipoVenta := 'CONTADO';

     frmConsultaFacturas:=TfrmConsultaFacturas.Create(Nil);
     try
       frmConsultaFacturas.rdgCredito.Checked := True;
       frmConsultaFacturas.EditN1.SetInteger(serieDoc);
       frmConsultaFacturas.BitBtn1Click(Nil);

       dmreportes.qryViewVentasMast.Close;
       dmreportes.qryViewVentasMast.Params[0].Value:= dmfactura.qryVentaFacturaNUMERO.Value;
       dmreportes.qryViewVentasMast.Open;
       ProcSetPathlogoTipoServicio(dmReportes.qryViewVentasMastTIPO_AFILIADO.Value);

       frmProcVentaRapida.LlenarrxSolDatoscte(dmFactura.qryVentaFacturaCODIGO_CTE.Value);
       if frmConsultaFacturas.rdgCredito.Checked then
          TipoVenta:='CREDITO'
       else
          tipoVenta:='CONTADO';

       //todo's ImprimirFacturaAgua(dmreportes.qryViewVentasMast.Params[0].Value);

       finally
       frmConsultaFacturas.free;
       frmConsultaFacturas:=nil;
     end;    
  end else
  if (UpperCase(GLBFormatoFactura) = 'FORMAFACOCO') and (EsConduce)then
  begin
      TipoVenta:='CONTADO';
      if dmfactura.qryVentaFacturaFORMA_PAGO.AsInteger in [7,8] then
      TipoVenta := 'CREDITO'
      else
      if dmfactura.qryVentaFacturaFORMA_PAGO.value = 1 then
      TipoVenta := 'CONTADO';

     frmConsultaFacturas:=TfrmConsultaFacturas.Create(Nil);
     try
       frmConsultaFacturas.rdgCredito.Checked := True;
       frmConsultaFacturas.EditN1.SetInteger(serieDoc);
       frmConsultaFacturas.BitBtn1Click(nil);

      dmreportes.qryViewVentasMast.Close;
      dmreportes.qryViewVentasMast.Params[0].Value:= dmfactura.qryVentaFacturaNUMERO.Value;
      dmreportes.qryViewVentasMast.Open;
      ProcSetPathlogoTipoServicio(dmReportes.qryViewVentasMastTIPO_AFILIADO.Value);

       frmProcVentaRapida.LlenarrxSolDatoscte(dmFactura.qryVentaFacturaCODIGO_CTE.Value);
       if frmConsultaFacturas.rdgCredito.Checked then
          TipoVenta:='CREDITO'
       else
          tipoVenta:='CONTADO';

     ImprimirFacturaRepuestoConduce(dmreportes.qryViewVentasMast.Params[0].Value);
     
     finally
     frmConsultaFacturas.free;
     frmConsultaFacturas:=nil;
     end;    
  end else
  if (UpperCase(GLBFormatoFactura) = 'FORMAFACOCO') then
  begin
      TipoVenta:='CONTADO';
      if dmfactura.qryVentaFacturaFORMA_PAGO.AsInteger in [7,8] then
      TipoVenta := 'CREDITO'
      else
      if dmfactura.qryVentaFacturaFORMA_PAGO.value = 1 then
      TipoVenta := 'CONTADO';

     frmConsultaFacturas:=TfrmConsultaFacturas.Create(Nil);
     try
       frmConsultaFacturas.rdgCredito.Checked := True;
       frmConsultaFacturas.EditN1.SetInteger(serieDoc);
       frmConsultaFacturas.BitBtn1Click(nil);

      dmreportes.qryViewVentasMast.Close;
      dmreportes.qryViewVentasMast.Params[0].Value:= dmfactura.qryVentaFacturaNUMERO.Value;
      dmreportes.qryViewVentasMast.Open;
      ProcSetPathlogoTipoServicio(dmReportes.qryViewVentasMastTIPO_AFILIADO.Value);

       frmProcVentaRapida.LlenarrxSolDatoscte(dmFactura.qryVentaFacturaCODIGO_CTE.Value);
       if frmConsultaFacturas.rdgCredito.Checked then
          TipoVenta:='CREDITO'
       else
          tipoVenta:='CONTADO';

     ImprimirFacturaRepuesto(dmreportes.qryViewVentasMast.Params[0].Value);
     
     finally
     frmConsultaFacturas.free;
     frmConsultaFacturas:=nil;
     end;
  end
  else
  if (UpperCase(GLBFormatoFactura) = 'FORMAEXPLODISMAR') then
  begin
    TipoVenta:='CONTADO';
    if dmfactura.qryVentaFacturaFORMA_PAGO.AsInteger in [7,8] then
       TipoVenta := 'CREDITO'
    else
    if dmfactura.qryVentaFacturaFORMA_PAGO.value = 1 then
    TipoVenta := 'CONTADO';

    frmConsultaFacturas:=TfrmConsultaFacturas.Create(Nil);
    try
     frmConsultaFacturas.rdgCredito.Checked := True;
     frmConsultaFacturas.EditN1.SetInteger(serieDoc);
     frmConsultaFacturas.BitBtn1Click(nil);

     dmreportes.qryViewVentasMast.Close;
     dmreportes.qryViewVentasMast.Params[0].Value:= dmfactura.qryVentaFacturaNUMERO.Value;
     dmreportes.qryViewVentasMast.Open;
     ProcSetPathlogoTipoServicio(dmReportes.qryViewVentasMastTIPO_AFILIADO.Value);
             
     frmProcVentaRapida.LlenarrxSolDatoscte(dmFactura.qryVentaFacturaCODIGO_CTE.Value);
     if frmConsultaFacturas.rdgCredito.Checked then
        TipoVenta:='CREDITO'
     else
        tipoVenta:='CONTADO';

     if (tipoVenta = 'CONTADO') then
        ImprimeFacturaEXDMAR(0,TipoVenta,'','Recibos')
     else
     ImprimeFacturaEXDMAR(0,TipoVenta,'','Facturas');
     FINALLY
     frmConsultaFacturas.Free;
     frmConsultaFacturas:=NIL;
     END;
    end else
    if (GlBAyaco= 1) or (GlbSizeFact8x11 = 1) or (GLBTapiceria = 1) or (GlBInveraf =1) then
    begin
      TipoVenta:='CONTADO';
      if dmfactura.qryVentaFacturaFORMA_PAGO.AsInteger in [7,8] then
      TipoVenta := 'CREDITO'
      else
      if dmfactura.qryVentaFacturaFORMA_PAGO.value = 1 then
      TipoVenta := 'CONTADO';

     frmConsultaFacturas:=TfrmConsultaFacturas.Create(Nil);
     try
       frmConsultaFacturas.rdgCredito.Checked := True;
       frmConsultaFacturas.EditN1.SetInteger(serieDoc);
       frmConsultaFacturas.BitBtn1Click(nil);

      if dmfactura.qryVentaFacturaNumero.value = 0 then
      Exit;

      dmreportes.qryViewVentasMast.Close;
      dmreportes.qryViewVentasMast.Params[0].Value:= dmfactura.qryVentaFacturaNUMERO.Value;
      dmreportes.qryViewVentasMast.Open;//dmreportes.qryViewVentasMast.sql.text
      ProcSetPathlogoTipoServicio(dmReportes.qryViewVentasMastTIPO_AFILIADO.Value);

       frmProcVentaRapida.LlenarrxSolDatoscte(dmFactura.qryVentaFacturaCODIGO_CTE.Value);
       if frmConsultaFacturas.rdgCredito.Checked then
          TipoVenta:='CREDITO'
       else
          tipoVenta:='CONTADO';

       qckFactServ8_5Ayaco:=TqckFactServ8_5Ayaco.Create(Nil);
       try
         qckFactServ8_5Ayaco.TPag.Caption:=
         IntToStr(qckFactServ8_5Ayaco.PageNumber);
         qckFactServ8_5Ayaco.xtipoVenta := TipoVenta;
         qckFactServ8_5Ayaco.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;

         if dmReportes.qryViewVentasMastMONTO_EXONERADO_ITBIS.Value > 0 then
         begin
           //qckFactServ8_5Ayaco.QRLabel25.left:=505;
           qckFactServ8_5Ayaco.QRLabel25.Caption :='ITBIS Exonerado';
         end else
         qckFactServ8_5Ayaco.QRLabel25.Caption :='ITBIS';
         if (GlbImpReciboSinPreg = 1) then
           qckFactServ8_5Ayaco.Print
           else
           if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
           begin
             qckFactServ8_5Ayaco.PrinterSetup;
             qckFactServ8_5Ayaco.Print;
           end else
           qckFactServ8_5Ayaco.Preview;
           if GlbImpPDF then
           ReportExport(qckFactServ8_5Ayaco,GlbRutaFacturas+'\Factura'+dmFactura.qryVentaFacturaNUMERO_FACTURA.AsString+'.pdf');

           if (GlbImpReciboSinPreg = 0) then
           if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
            begin
              qckFactServ8_5Ayaco.Preview;
            end;
        finally
        qckFactServ8_5Ayaco.Free;
        qckFactServ8_5Ayaco:=Nil;
        end;
        finally
        if Assigned(frmConsultaFacturas) then
           frmConsultaFacturas.Free;
           frmConsultaFacturas:=Nil;
       end;
    end else
    if (GlbFarmacia = 1) and (GlbFact55Pulg = 1) then
    begin
      ImprimeFactura8_5Farmacia(frmProcVentaRapida.ipStpInsertVentMast.Params[0].Value,TipoVenta,'','Facturas');
    end 
    else
    if (GlbColmado = 1 ) or (GlbFarmacia = 1 ) then
    begin
      frmConsultaFacturas:=TfrmConsultaFacturas.Create(Nil);
      try
        frmConsultaFacturas.rdgCredito.Checked := True;
        frmConsultaFacturas.EditN1.SetInteger(serieDoc);
        frmConsultaFacturas.BitBtn1Click(nil);

        dmreportes.qryViewVentasMast.Close;
        dmreportes.qryViewVentasMast.Params[0].Value:= dmfactura.qryVentaFacturaNUMERO.Value;
        dmreportes.qryViewVentasMast.Open;

        //ProcSetPathlogoTipoServicio(dmReportes.qryViewVentasMastTIPO_AFILIADO.Value);

        frmProcVentaRapida.LlenarrxSolDatoscte(dmFactura.qryVentaFacturaCODIGO_CTE.Value);
        if frmConsultaFacturas.rdgCredito.Checked then
        TipoVenta:='CREDITO'
        else
        tipoVenta:='CONTADO';

        //if (tipoVenta = 'CONTADO') then
        //ImprimeFacturaEXDMAR(0,TipoVenta,'','Recibos')
        //else
        //ImprimeFacturaEXDMAR(0,TipoVenta,'','Facturas');

      TipoVenta:='CONTADO';
      if dmReportes.qryViewVentasMastForma_pago.AsInteger in [7,8] then
      TipoVenta := 'CREDITO'
      else
      if dmReportes.qryViewVentasMastForma_pago.value = 1 then
      TipoVenta := 'CONTADO';

      if (TipoVenta = 'CONTADO') then
      frmProcVentaRapida.AbrirDatosParaTicket(false,false,dmReportes.qryViewVentasMastCODIGO_CTE.AsString,dmReportes.qryViewVentasMastNUMERO_DOC_PAGO.AsInteger,
      dmReportes.qryViewVentasMastFECHA.Value)
      else
      if (TipoVenta = 'CREDITO') then
      frmProcVentaRapida.AbrirDatosParaTicket(false,true,dmReportes.qryViewVentasMastCODIGO_CTE.AsString,dmReportes.qryViewVentasMastNUMERO_FACTURA.AsInteger,
      dmReportes.qryViewVentasMastFECHA.Value);

      //qckRepReciboReimpTicketSurtidora:=TqckRepReciboReimpTicketSurtidora.Create(Nil);
      qckRepReciboReimpTicketSurtidoraNew:=TqckRepReciboReimpTicketSurtidoraNew.Create(Nil);
      try
        if GlbImpQREncuesta = 0 then
        begin
          if (GlbImpQREncuesta = 0) then
          qckRepReciboReimpTicketSurtidoraNew.Height:=761;

          //qckRepReciboReimpTicketSurtidoraNew.Page.Length:=6.156; //sin encuesta
          qckRepReciboReimpTicketSurtidoraNew.ChildBand14.Height:=0;
          //qckRepReciboReimpTicketSurtidoraNew.ChildBand13.HasChild:=False;
        end;
        qckRepReciboReimpTicketSurtidoraNew.SetParameterValues;
        if frmProcVentaRapida.rxspinImpCantCopias.Decimal > 0 then
        qckRepReciboReimpTicketSurtidoraNew.PrinterSettings.Copies:= StrToInt(frmProcVentaRapida.rxspinImpCantCopias.Text);
        if GlbEsCopia then
        qckRepReciboReimpTicketSurtidoraNew.strcopia :=' (COPIA)'
        else        
        qckRepReciboReimpTicketSurtidoraNew.strcopia :='';

//        qckRepReciboReimpTicketSurtidoraNew.ncfDesc := GlbDescNCF;
        if Length(frmProcVentaRapida.edtObservacion.Text) > 0 then
        qckRepReciboReimpTicketSurtidoraNew.nombreCteGenerico:=frmProcVentaRapida.edtObservacion.Text;
        if (dmReportes.qryViewVentasMastCodigo_cte.value > 0) then
        begin
          qckRepReciboReimpTicketSurtidoraNew.qrLabelRNC.Caption:='RNC-' + frmProcVentaRapida.qryClienteRNC_NUMERO.Value;
          qckRepReciboReimpTicketSurtidoraNew.nombreCteGenerico:= frmProcVentaRapida.qryClienteNOMBRE_CTE.Value;
        end
        else qckRepReciboReimpTicketSurtidoraNew.qrLabelRNC.Caption:='';
        qckRepReciboReimpTicketSurtidoraNew.xtipoVenta := TipoVenta;
        qckRepReciboReimpTicketSurtidoraNew.valorNCF   := dmFactura.qryVentaFacturaNUMERO_NCF.Value;
        //pulgadaInc:=0.86;
        dmFactura.qryVentaFacturaDet.Last;
   if (glbQckUnaPagina = 1) then
   begin
        if dmFactura.qryVentaFacturaDet.RecordCount = 1 then
        qckRepReciboReimpTicketSurtidoraNew.Page.Length:=4.258
        else
        if dmFactura.qryVentaFacturaDet.RecordCount >= 2 then
        qckRepReciboReimpTicketSurtidoraNew.Page.Length:= qckRepReciboReimpTicketSurtidoraNew.Page.Length +
        (dmFactura.qryVentaFacturaDet.RecordCount - 1 ) * 0.25;

        flag:=true;
        dmFactura.qryVentaFacturaDet.First;
        dmFactura.qryVentaFacturaDet.Last;
        if dmFactura.qryVentaFacturaDet.RecordCount > 25  then
        qckRepReciboReimpTicketSurtidoraNew.Page.Length:=23
        else
        if dmFactura.qryVentaFacturaDet.RecordCount > 29  then
        qckRepReciboReimpTicketSurtidoraNew.Page.Length:=18;

        qckRepReciboReimpTicketSurtidoraNew.Prepare;
        dmFactura.qryVentaFacturaDet.Last;
        if ((dmFactura.qryVentaFacturaDet.RecordCount >= 1) and
           ((dmFactura.qryVentaFacturaDet.RecordCount < 10)
            or (qckRepReciboReimpTicketSurtidoraNew.PageNumber = 2))) then
        begin
          frmProcVentaRapida.ProgressBar1.Visible :=True;
          frmProcVentaRapida.ProgressBar1.Position:=0;
          frmProcVentaRapida.ProgressBar1.Max:=dmFactura.qryVentaFacturaDet.RecordCount;
          if (GlbIncLargoPapel = 1) then
          begin
          repeat
          begin
            frmProcVentaRapida.ProgressBar1.StepIt;
            //cRc:=cRc + 1;
            if (qckRepReciboReimpTicketSurtidoraNew.PageNumber > 1) then
            begin
              qckRepReciboReimpTicketSurtidoraNew.Page.Length:=qckRepReciboReimpTicketSurtidoraNew.Page.Length + 0.26;
              qckRepReciboReimpTicketSurtidoraNew.Prepare;
              flag:=False;
            end else
            if (qckRepReciboReimpTicketSurtidoraNew.PageNumber = 1) then
                break;
            if (qckRepReciboReimpTicketSurtidoraNew.PageNumber = 1) then
                break;
            end;
            until flag = true;
            end;
          end;
    end;//if (glbQckUnaPagina = 1) then
        frmProcVentaRapida.ProgressBar1.Visible:=False;
        dmFactura.qryVentaFacturaDet.Last;
        if (dmFactura.qryVentaFacturaDet.RecordCount >15) and (GlbImpFormatoPDF = 1) then
        begin
          frmProcVentaRapida.ImprimirEnFormatoPDF(1,6);
        end else
        begin
          dmDatos.qryImpresoras.Close;
          dmDatos.qryImpresoras.Open;
          if dmDatos.qryImpresoras.Locate('IDMODULO;IDREPORTE',
          VarArrayOf([1,6]),[]) then     //Factura/Recibo Punto Venta
          qckRepReciboReimpTicketSurtidoraNew.PrinterSettings.PrinterIndex:=
          GetImpresora(dmDatos.qryImpresorasNOMBRE_IMPRESORA.Value);

          if (GlbImpReciboSinPreg = 1) and (GlbImprimeReciboFact = 1) then
          qckRepReciboReimpTicketSurtidoraNew.Print
          else
          if MessageDlg('Imprimir?',mtInformation, [mbYes, mbNo], 0)=mryes then
          begin
            if (GlbImprimeReciboFact = 1) then
            begin
              qckRepReciboReimpTicketSurtidoraNew.PrinterSetup;
              qckRepReciboReimpTicketSurtidoraNew.Print;
            end;
          end else
          begin
            try
            qckRepReciboReimpTicketSurtidoraNew.Preview; //Factura Enmarcado Cuadros
            except
              WriteToLog('Error. Reporte factura a credito usado: qckRepReciboReimpTicketSurtidoraNew');
            end;
            //WriteToLog('Reporte factura a credito usado: qckRepReciboReimpTicketSurtidoraNew');
          end;
          reciboImpreso:=True;
        end;
        //t if GlbImpTicketVtaAgua = 1 then
        //t ImprimirTicketVtaAgua(frmProcVentaRapida.ipStpInsertVentMast.Params[0].Value);
        finally
        qckRepReciboReimpTicketSurtidoraNew.Free;
        qckRepReciboReimpTicketSurtidoraNew:=Nil;
        end;
      FINALLY
      frmConsultaFacturas.Free;
      frmConsultaFacturas:=NIL;
      END;
    end else
    if (GLBMutur = 1) then
    begin
      TipoVenta:='CONTADO';
      if dmfactura.qryVentaFacturaFORMA_PAGO.AsInteger in [7,8] then
      TipoVenta := 'CREDITO'
      else
      if dmfactura.qryVentaFacturaFORMA_PAGO.value = 1 then
      TipoVenta := 'CONTADO';

     frmConsultaFacturas:=TfrmConsultaFacturas.Create(Nil);
     try
       frmConsultaFacturas.rdgCredito.Checked := True;
       frmConsultaFacturas.EditN1.SetInteger(serieDoc);
       frmConsultaFacturas.BitBtn1Click(nil);

      dmreportes.qryViewVentasMast.Close;
      dmreportes.qryViewVentasMast.Params[0].Value:= dmfactura.qryVentaFacturaNUMERO.Value;
      dmreportes.qryViewVentasMast.Open;
      ProcSetPathlogoTipoServicio(dmReportes.qryViewVentasMastTIPO_AFILIADO.Value);

       frmProcVentaRapida.LlenarrxSolDatoscte(dmFactura.qryVentaFacturaCODIGO_CTE.Value);
       if frmConsultaFacturas.rdgCredito.Checked then
          TipoVenta:='CREDITO'
       else
          tipoVenta:='CONTADO';
       qckFactServ_8_5SAMNewMuturs:=TqckFactServ_8_5SAMNewMuturs.Create(Nil);
       try
          qckFactServ_8_5SAMNewMuturs.rxVendedor.Close;
          qckFactServ_8_5SAMNewMuturs.rxVendedor.Open;
          if dmreportes.qryCantVendedoresSamCANTVENDEDORES.Value = 1 then
          begin
            if frmProcVentaRapida.qryEmpleado.Locate('codigo', dmreportes.qryViewVentasDetCodigo_Vendedor.Value,[]) then
            begin
              qckFactServ_8_5SAMNewMuturs.rxVendedor.Append;
              qckFactServ_8_5SAMNewMuturs.rxVendedorNombreVendedor.Value:=
              frmProcVentaRapida.qryEmpleadoNOMBREVENDEDOR.Value;
              qckFactServ_8_5SAMNewMuturs.rxVendedor.Post;
            end;
          end else
          begin
            qckFactServ_8_5SAMNewMuturs.rxVendedor.Close;
            qckFactServ_8_5SAMNewMuturs.rxVendedor.Open;
              qckFactServ_8_5SAMNewMuturs.rxVendedor.Append;
              qckFactServ_8_5SAMNewMuturs.rxVendedorNombreVendedor.Value:='';
              qckFactServ_8_5SAMNewMuturs.rxVendedor.Post;
              end;
              qckFactServ_8_5SAMNewMuturs.TPag.Caption:=
              IntToStr(qckFactServ_8_5SAMNewMuturs.PageNumber);
              qckFactServ_8_5SAMNewMuturs.xtipoVenta := TipoVenta;
              //qckFactServ_8_5SAMNewM.valorNCF:= valorNCF;
              if dmReportes.qryViewVentasMastMONTO_EXONERADO_ITBIS.Value > 0 then
              begin
                qckFactServ_8_5SAMNewMuturs.QRLabel25.Caption :='ITBIS Exonerado';
              end  else
              qckFactServ_8_5SAMNewMuturs.QRLabel25.Caption :='ITBIS';

              if (GlbImpReciboSinPreg = 1) then
              qckFactServ_8_5SAMNewMuturs.Print
              else
              if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
              begin
                //qckFactServ_8_5SAMNewM.QRImage2.Enabled:= False;
                qckFactServ_8_5SAMNewMuturs.PrinterSetup;
                qckFactServ_8_5SAMNewMuturs.Print;
              end else
              qckFactServ_8_5SAMNewMuturs.Preview;

              if (GlbImpReciboSinPreg = 0) then
              if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
              begin
                qckFactServ_8_5SAMNewMuturs.Preview;
              end;
             if GlbImpPDF then
             begin
               if not dmReportes.qryViewVentasMastNUMERO_FACTURA.IsNull then
               ReportExportPDF(qckFactServ_8_5SAMNewMuturs,GlbRutaRecibos+'\Recibos'+IntToStr(dmReportes.qryViewVentasMastNUMERO_FACTURA.Value)+'.pdf')
               else
               ReportExportPDF(qckFactServ_8_5SAMNewMuturs,GlbRutaRecibos+'\Recibos'+IntToStr(dmReportes.qryViewVentasMastNUMERO_DOC_PAGO.AsInteger)+'.pdf')
             end;
          finally
          qckFactServ_8_5SAMNewMuturs.Free;
          qckFactServ_8_5SAMNewMuturs:=Nil;
          end;
       finally
       if assigned(frmConsultaFacturas) then
       begin
         frmConsultaFacturas.free;
         frmConsultaFacturas:=nil;
       end;
      end;
    end else
    //inicio SAM
    if (GlBSAM= 1) then
    begin
      TipoVenta:='CONTADO';
      if dmfactura.qryVentaFacturaFORMA_PAGO.AsInteger in [7,8] then
      TipoVenta := 'CREDITO'
      else
      if dmfactura.qryVentaFacturaFORMA_PAGO.value = 1 then
      TipoVenta := 'CONTADO';

     frmConsultaFacturas:=TfrmConsultaFacturas.Create(Nil);
     try
       frmConsultaFacturas.rdgCredito.Checked := True;
       frmConsultaFacturas.EditN1.SetInteger(serieDoc);
       frmConsultaFacturas.BitBtn1Click(nil);

      dmreportes.qryViewVentasMast.Close;
      dmreportes.qryViewVentasMast.Params[0].Value:= dmfactura.qryVentaFacturaNUMERO.Value;
      dmreportes.qryViewVentasMast.Open;
      ProcSetPathlogoTipoServicio(dmReportes.qryViewVentasMastTIPO_AFILIADO.Value);
             
       frmProcVentaRapida.LlenarrxSolDatoscte(dmFactura.qryVentaFacturaCODIGO_CTE.Value);
       if frmConsultaFacturas.rdgCredito.Checked then
          TipoVenta:='CREDITO'
       else
          tipoVenta:='CONTADO';
        if (GlbUsaFctMexico = 1) then
        begin
          qckFactServ_8_5SAMNewM:=TqckFactServ_8_5SAMNewM.Create(Nil);
          try
            qckFactServ_8_5SAMNewM.rxVendedor.Close;
            qckFactServ_8_5SAMNewM.rxVendedor.Open;
            if dmreportes.qryCantVendedoresSamCANTVENDEDORES.Value = 1 then
            begin
              if frmProcVentaRapida.qryEmpleado.Locate('codigo', dmreportes.qryViewVentasDetCodigo_Vendedor.Value,[]) then
              begin
                qckFactServ_8_5SAMNewM.rxVendedor.Append;
                qckFactServ_8_5SAMNewM.rxVendedorNombreVendedor.Value:=
                frmProcVentaRapida.qryEmpleadoNOMBREVENDEDOR.Value;
                qckFactServ_8_5SAMNewM.rxVendedor.Post;
              end;
            end else
            begin
              qckFactServ_8_5SAMNewM.rxVendedor.Close;
              qckFactServ_8_5SAMNewM.rxVendedor.Open;
              qckFactServ_8_5SAMNewM.rxVendedor.Append;
              qckFactServ_8_5SAMNewM.rxVendedorNombreVendedor.Value:='';
              qckFactServ_8_5SAMNewM.rxVendedor.Post;
              end;
              qckFactServ_8_5SAMNewM.TPag.Caption:=
              IntToStr(qckFactServ_8_5SAMNewM.PageNumber);
              qckFactServ_8_5SAMNewM.xtipoVenta := TipoVenta;
              //qckFactServ_8_5SAMNewM.valorNCF:= valorNCF;
              if dmReportes.qryViewVentasMastMONTO_EXONERADO_ITBIS.Value > 0 then
              begin
                qckFactServ_8_5SAMNewM.QRLabel25.Caption :='ITBIS Exonerado';
              end  else
              qckFactServ_8_5SAMNewM.QRLabel25.Caption :='ITBIS';

              if (GlbImpReciboSinPreg = 1) then
              qckFactServ_8_5SAMNewM.Print
              else
              if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
              begin
                //qckFactServ_8_5SAMNewM.QRImage2.Enabled:= False;
                qckFactServ_8_5SAMNewM.PrinterSetup;
                qckFactServ_8_5SAMNewM.Print;
              end else
              qckFactServ_8_5SAMNewM.Preview;

              if (GlbImpReciboSinPreg = 0) then
              if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
              begin
                qckFactServ_8_5SAMNewM.Preview;
              end;
             if GlbImpPDF then
             begin
               if not dmReportes.qryViewVentasMastNUMERO_FACTURA.IsNull then
               ReportExportPDF(qckFactServ_8_5SAMNewM,GlbRutaRecibos+'\Recibos'+IntToStr(dmReportes.qryViewVentasMastNUMERO_FACTURA.Value)+'.pdf')
               else
               ReportExportPDF(qckFactServ_8_5SAMNewM,GlbRutaRecibos+'\Recibos'+IntToStr(dmReportes.qryViewVentasMastNUMERO_DOC_PAGO.AsInteger)+'.pdf')
             end;
          finally
          qckFactServ_8_5SAMNewM.Free;
          qckFactServ_8_5SAMNewM:=Nil;
          end;
        end else
        if (GLBFORMATOFACTPREIMP = 0) then
        begin
       qckFactServ_8_5SAM:=TqckFactServ_8_5SAM.Create(Nil);
       try
          qckFactServ_8_5SAM.rxVendedor.Close;
          qckFactServ_8_5SAM.rxVendedor.Open;
          if dmreportes.qryCantVendedoresSamCANTVENDEDORES.Value = 1 then
          begin
            if frmProcVentaRapida.qryEmpleado.Locate('codigo', dmreportes.qryViewVentasDetCodigo_Vendedor.Value,[]) then
            begin
              qckFactServ_8_5SAM.rxVendedor.Append;
              qckFactServ_8_5SAM.rxVendedorNombreVendedor.Value:=
              frmProcVentaRapida.qryEmpleadoNOMBREVENDEDOR.Value;
              qckFactServ_8_5SAM.rxVendedor.Post;
            end;
          end else
          begin
            //rxVendedorNombreVendedor
            qckFactServ_8_5SAM.rxVendedor.Close;
            qckFactServ_8_5SAM.rxVendedor.Open;
            qckFactServ_8_5SAM.rxVendedor.Append;
            qckFactServ_8_5SAM.rxVendedorNombreVendedor.Value:='';
            qckFactServ_8_5SAM.rxVendedor.Post;
          end;
         qckFactServ_8_5SAM.TPag.Caption:=
         IntToStr(qckFactServ_8_5SAM.PageNumber);
         qckFactServ_8_5SAM.xtipoVenta := TipoVenta;
         qckFactServ_8_5SAM.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;

         if dmReportes.qryViewVentasMastMONTO_EXONERADO_ITBIS.Value > 0 then
         begin
           //qckFactServ8_5Ayaco.QRLabel25.left:=505;
           qckFactServ_8_5SAM.QRLabel25.Caption :='ITBIS Exonerado';
         end else
         qckFactServ_8_5SAM.QRLabel25.Caption :='ITBIS';
         if (GlbImpReciboSinPreg = 1) then
           qckFactServ_8_5SAM.Print
           else
           if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
           begin
             qckFactServ_8_5SAM.QRImage2.Enabled:= False;
             qckFactServ_8_5SAM.PrinterSetup;
             qckFactServ_8_5SAM.Print;
           end else
           qckFactServ_8_5SAM.Preview;
           if GlbImpPDF then
           ReportExport(qckFactServ_8_5SAM,GlbRutaFacturas+'\Factura'+dmFactura.qryVentaFacturaNUMERO_FACTURA.AsString+'.pdf');

           if (GlbImpReciboSinPreg = 0) then
           if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
            begin
              qckFactServ_8_5SAM.Preview;
            end;
        finally
        qckFactServ_8_5SAM.Free;
        qckFactServ_8_5SAM:=Nil;
        end;
        end else
        begin
          //formatosamnew;
          qckFactServ_8_5SAMNew:=TqckFactServ_8_5SAMNew.Create(Nil);
          try
            qckFactServ_8_5SAMNew.rxVendedor.Close;
            qckFactServ_8_5SAMNew.rxVendedor.Open;
            if dmreportes.qryCantVendedoresSamCANTVENDEDORES.Value = 1 then
            begin
              if frmProcVentaRapida.qryEmpleado.Locate('codigo', dmreportes.qryViewVentasDetCodigo_Vendedor.Value,[]) then
              begin
                qckFactServ_8_5SAMNew.rxVendedor.Append;
                qckFactServ_8_5SAMNew.rxVendedorNombreVendedor.Value:=
                frmProcVentaRapida.qryEmpleadoNOMBREVENDEDOR.Value;
                qckFactServ_8_5SAMNew.rxVendedor.Post;
              end;
            end else
            begin
              //rxVendedorNombreVendedor
              qckFactServ_8_5SAMNew.rxVendedor.Close;
              qckFactServ_8_5SAMNew.rxVendedor.Open;
              qckFactServ_8_5SAMNew.rxVendedor.Append;
              qckFactServ_8_5SAMNew.rxVendedorNombreVendedor.Value:='';
              qckFactServ_8_5SAMNew.rxVendedor.Post;
            end;
         qckFactServ_8_5SAMNew.TPag.Caption:=
         IntToStr(qckFactServ_8_5SAMNew.PageNumber);
         qckFactServ_8_5SAMNew.xtipoVenta := TipoVenta;
         qckFactServ_8_5SAMNew.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;

         if dmReportes.qryViewVentasMastMONTO_EXONERADO_ITBIS.Value > 0 then
         begin
           //qckFactServ8_5Ayaco.QRLabel25.left:=505;
           qckFactServ_8_5SAMNew.QRLabel25.Caption :='ITBIS Exonerado';
         end else
         qckFactServ_8_5SAMNew.QRLabel25.Caption :='ITBIS';
         if (GlbImpReciboSinPreg = 1) then
           qckFactServ_8_5SAMNew.Print
           else
           if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
           begin
             qckFactServ_8_5SAMNew.QRImage2.Enabled:= False;
             qckFactServ_8_5SAMNew.PrinterSetup;
             qckFactServ_8_5SAMNew.Print;
           end else
           qckFactServ_8_5SAMNew.Preview;
           if GlbImpPDF then
           ReportExport(qckFactServ_8_5SAMNew,GlbRutaFacturas+'\Factura'+dmFactura.qryVentaFacturaNUMERO_FACTURA.AsString+'.pdf');

           if (GlbImpReciboSinPreg = 0) then
           if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
            begin
              qckFactServ_8_5SAMNew.Preview;
            end;
        finally
        qckFactServ_8_5SAMNew.Free;
        qckFactServ_8_5SAMNew:=Nil;
        end;
        end;
        finally
        if Assigned(frmConsultaFacturas) then
           frmConsultaFacturas.Free;
           frmConsultaFacturas:=Nil;
       end;
    end else //final sam
   if (GlBBurgos = 1) then
   begin
     dmDatos.qryMembrete.Close;
     dmDatos.qryMembrete.Params[0].Value:= glbCia_Key;
     dmDatos.qryMembrete.Open;
      TipoVenta:='CONTADO';
      if dmfactura.qryVentaFacturaFORMA_PAGO.AsInteger in [7,8] then
      TipoVenta := 'CREDITO'
      else
      if dmfactura.qryVentaFacturaFORMA_PAGO.value = 1 then
      TipoVenta := 'CONTADO';

     frmConsultaFacturas:=TfrmConsultaFacturas.Create(Nil);
     try
       frmConsultaFacturas.rdgCredito.Checked := True;
       frmConsultaFacturas.EditN1.SetInteger(serieDoc);
       frmConsultaFacturas.BitBtn1Click(nil);

      dmreportes.qryViewVentasMast.Close;
      dmreportes.qryViewVentasMast.Params[0].Value:= dmfactura.qryVentaFacturaNUMERO.Value;
      dmreportes.qryViewVentasMast.Open;
      ProcSetPathlogoTipoServicio(dmReportes.qryViewVentasMastTIPO_AFILIADO.Value);
             
      frmProcVentaRapida.LlenarrxSolDatoscte(dmFactura.qryVentaFacturaCODIGO_CTE.Value);
      if frmConsultaFacturas.rdgCredito.Checked then
         TipoVenta:='CREDITO'
      else
         tipoVenta:='CONTADO';

      qckFactServ8_5BB:=TqckFactServ8_5BB.Create(Nil);
      try
        //qckFactServ8_5BB.TPag.Caption:=
        //IntToStr(qckFactServ8_5BB.PageNumber);
        qckFactServ8_5BB.xtipoVenta := TipoVenta;
        qckFactServ8_5BB.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;
        if (GlbImpReciboSinPreg = 1) then
           qckFactServ8_5BB.Print
        else
        if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
        begin
          qckFactServ8_5BB.PrinterSetup;
          qckFactServ8_5BB.Print;
        end else
        qckFactServ8_5BB.Preview;
        if (GlbImpReciboSinPreg = 0) then
           if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
            begin
              qckFactServ8_5BB.Preview;
            end;
            if GlbImpPDF then
            ReportExportPDF(qckFactServ8_5BB,GlbRutaFacturas+'\Factura'+dmFactura.qryVentaFacturaNUMERO_FACTURA.AsString+'.pdf');
        finally
        qckFactServ8_5BB.Free;
        qckFactServ8_5BB:=Nil;
        end;
      finally
      if Assigned(frmConsultaFacturas) then
         frmConsultaFacturas.Free;
         frmConsultaFacturas:=Nil;
     end;
    end else
    if (GlbFarmacia = 1) and (GlbFact55Pulg = 1) then
    begin
      ImprimeFactura8_5Farmacia(frmProcVentaRapida.ipStpInsertVentMast.Params[0].Value,TipoVenta,'','Facturas');
    if not frmProcVentaRapida.stpProc_InsertaVentaAuto.Params[0].isNull then
    begin
      //ImprimeFactraCXCFinc(stpProc_InsertaVentaAuto.Params[0].Value);
      //stpProc_InsertaVentaAuto.Close;
    end;

    end else
    if (GlbFarmacia = 1 ) then
    begin
      TipoVenta := 'CREDITO';

      if (TipoVenta = 'CREDITO') then
       frmProcVentaRapida.AbrirDatosParaTicket(false,false,frmProcVentaRapida.tablaPropietarioCodigoPropietario.AsString,numeroTrnVta,frmProcVentaRapida.rxVentaFecha.Value);
       dmReportes.qryViewVentasMast.Close;
       dmReportes.qryViewVentasMast.Params[0].Value:=frmProcVentaRapida.ipStpInsertVentMast.Params[0].Value;
       dmReportes.qryViewVentasMast.Open;
       dmFactura.qryVentaFacturaDet.Close;
       dmFactura.qryVentaFacturaDet.Params[0].Value:= frmProcVentaRapida.ipStpInsertVentMast.Params[0].Value;
       dmFactura.qryVentaFacturaDet.Open;

      qckRepReciboReimpTicketFarmaciaARS:=TqckRepReciboReimpTicketFarmaciaARS.Create(Nil);
      try
               dmDatos.qryImpresoras.Close;
               dmDatos.qryImpresoras.Open;
               if dmDatos.qryImpresoras.Locate('IDMODULO;IDREPORTE',
                  VarArrayOf([1,6]),[]) then     //Factura/Recibo Punto Venta
               qckRepReciboReimpTicketFarmaciaARS.PrinterSettings.PrinterIndex:=
               GetImpresora(dmDatos.qryImpresorasNOMBRE_IMPRESORA.Value);      
        if (dmFactura.qryDatosVtaARS.RecordCount = 0) then
        begin
          qckRepReciboReimpTicketFarmaciaARS.ChildBand10.Height:=0;
          qckRepReciboReimpTicketFarmaciaARS.ChildBand1.Height :=40;
          qckRepReciboReimpTicketFarmaciaARS.Page.Length:=
          qckRepReciboReimpTicketFarmaciaARS.Page.Length - 5;
        end else
        begin
          qckRepReciboReimpTicketFarmaciaARS.ChildBand1.Height:=95;
        end;

        if dmFactura.qryVtaConDeliveryTrn.RecordCount = 0 then
        begin
          qckRepReciboReimpTicketFarmaciaARS.ChildBand13.Height:=0;
          qckRepReciboReimpTicketFarmaciaARS.Page.Length:=
          qckRepReciboReimpTicketFarmaciaARS.Page.Length - 3.45;
        end;
        if GlbEsCopia then
        qckRepReciboReimpTicketSurtidoraNew.strcopia :=' (COPIA)'
        else
        qckRepReciboReimpTicketFarmaciaARS.strcopia :='';

        qckRepReciboReimpTicketFarmaciaARS.ncfDesc := GlbDescNCF;
        if Length(frmProcVentaRapida.edtObservacion.Text) > 0 then
        qckRepReciboReimpTicketFarmaciaARS.nombreCteGenerico:=frmProcVentaRapida.edtObservacion.Text;
        if (dmReportes.qryViewVentasMastCodigo_cte.value > 0) then
        begin
          qckRepReciboReimpTicketFarmaciaARS.qrLabelRNC.Caption:='RNC-' + frmProcVentaRapida.qryClienteRNC_NUMERO.Value;
          qckRepReciboReimpTicketFarmaciaARS.nombreCteGenerico:= frmProcVentaRapida.qryClienteNOMBRE_CTE.Value;
        end
        else
        qckRepReciboReimpTicketFarmaciaARS.qrLabelRNC.Caption:='';
        qckRepReciboReimpTicketFarmaciaARS.xtipoVenta := TipoVenta;
        //qckRepReciboReimpTicketFarmaciaARS.valorNCF   := valorNCF;
        //pulgadaInc:=0.86;
        dmFactura.qryVentaFacturaDet.Last;
        if (glbQckUnaPagina = 1) then
        begin
        if dmFactura.qryVentaFacturaDet.RecordCount = 1 then
        qckRepReciboReimpTicketFarmaciaARS.Page.Length:=5.258
        else
        if dmFactura.qryVentaFacturaDet.RecordCount >= 2 then
        qckRepReciboReimpTicketFarmaciaARS.Page.Length:= qckRepReciboReimpTicketFarmaciaARS.Page.Length +
        (dmFactura.qryVentaFacturaDet.RecordCount - 1 ) * 0.25;

        flag:=true;
        qckRepReciboReimpTicketFarmaciaARS.Prepare;
        dmFactura.qryVentaFacturaDet.Last;
        if ((dmFactura.qryVentaFacturaDet.RecordCount >= 1) and
           ((dmFactura.qryVentaFacturaDet.RecordCount < 10)
            or (qckRepReciboReimpTicketFarmaciaARS.PageNumber = 2))) then
        begin
          frmProcVentaRapida.ProgressBar1.Visible:=true;
          frmProcVentaRapida.ProgressBar1.Position:=0;
          frmProcVentaRapida.ProgressBar1.Max:=dmFactura.qryVentaFacturaDet.RecordCount;
          repeat
          begin
            frmProcVentaRapida.ProgressBar1.StepIt;
            //cRc:=cRc + 1;
            if (qckRepReciboReimpTicketFarmaciaARS.PageNumber > 1) then
            begin
              qckRepReciboReimpTicketFarmaciaARS.Page.Length:=qckRepReciboReimpTicketFarmaciaARS.Page.Length + 0.26;

              qckRepReciboReimpTicketFarmaciaARS.Prepare;
              flag:=False;
            end else
            if (qckRepReciboReimpTicketFarmaciaARS.PageNumber = 1) then
            break;
            if (qckRepReciboReimpTicketFarmaciaARS.PageNumber = 1) then
            break;
            end;
            until flag = true;
          end;
        end;
        frmProcVentaRapida.ProgressBar1.Visible:=False;
        dmFactura.qryVentaFacturaDet.First;
        if (GlbImpReciboSinPreg = 1) and (GlbImprimeReciboFact = 1) then
        qckRepReciboReimpTicketFarmaciaARS.Print
        else
        if MessageDlg('Imprimir?',mtInformation, [mbYes, mbNo], 0)=mryes then
        begin
          if (GlbImprimeReciboFact = 1) then
          begin
            qckRepReciboReimpTicketFarmaciaARS.PrinterSetup;
            qckRepReciboReimpTicketFarmaciaARS.Print;
          end;
        end else
        qckRepReciboReimpTicketFarmaciaARS.Preview;//verifivar error de overflow
        reciboImpreso:=True;
      finally
      qckRepReciboReimpTicketFarmaciaARS.Free;
      qckRepReciboReimpTicketFarmaciaARS:=Nil;
      end;
    end else
    if ((UpperCase(GLBFormatoFactura) = 'CASANDRA2') or (UpperCase(GLBFormatoFactura) = 'FORMATOGENERAL')) then  //PENDIENTE DE ANALISIS
    begin
      frmConsultaFacturas:=TfrmConsultaFacturas.Create(Nil);
      try
        frmConsultaFacturas.rdgCredito.Checked := True;
        frmConsultaFacturas.EditN1.SetInteger(serieDoc);
        frmConsultaFacturas.BitBtn1Click(nil);

        dmfactura.qryFactReimpMaster.Close;
        dmfactura.qryFactReimpMaster.Params[0].Value:=serieDoc;

        dmfactura.qryFactReimpDet.Close;
        dmfactura.qryFactReimpDet.Params[0].Value:=serieDoc;
        dmfactura.qryFactReimpDet.Open;
        dmfactura.qryFactReimpDet.Last;
        dmfactura.qryFactReimpDet.Close;

        dmfactura.qryFactReimpMaster.Open;

        frmProcVentaRapida.LlenarrxSolDatoscte(dmFactura.qryVentaFacturaCODIGO_CTE.Value);
        if frmConsultaFacturas.rdgCredito.Checked then
        TipoVenta:='CREDITO'
        else
        tipoVenta:='CONTADO';//dmFactura.qryFactReimpMaster.RecordCount

        if (GlbFact3Pulg = 1) then
        begin
          if (GlbActivaIFiscal = 0) and (GlbUsaPUnidadStd = 0) then
          begin
            qckRepFactPuntoVenta:=TqckRepFactPuntoVenta.Create(Nil);
            try
             qckRepFactPuntoVenta.QRLabel14.Enabled:=False;
            
            //pulgadaInc:=0.86;
            //temporal
            //{
            if dmFactura.qryVentaFacturaDet.RecordCount = 1 then
            qckRepFactPuntoVenta.Page.Length:= 5
            else
            if dmFactura.qryVentaFacturaDet.RecordCount >= 2 then
            qckRepFactPuntoVenta.Page.Length:= qckRepFactPuntoVenta.Page.Length +
            (dmFactura.qryVentaFacturaDet.RecordCount - 1 ) * 0.25;

            flag:=true;
            qckRepFactPuntoVenta.Prepare;
            frmProcVentaRapida.rxventa.DisableControls;
            frmProcVentaRapida.rxdbgrid1.Enabled:=False;
            if (dmFactura.qryVentaFacturaDet.RecordCount > 1) or (qckRepFactPuntoVenta.PageNumber > 1) then
            begin
              repeat
              begin
                if (qckRepFactPuntoVenta.PageNumber > 1) then
                begin
                  qckRepFactPuntoVenta.Page.Length:=qckRepFactPuntoVenta.Page.Length + 0.25;
                  qckRepFactPuntoVenta.Prepare;
                  flag:=False;
                end else break;
              end;
              until flag = true;
            end;
            frmProcVentaRapida.rxventa.EnableControls;
            frmProcVentaRapida.rxdbgrid1.Enabled:=True;
               if frmProcVentaRapida.ImprimirRecibo1.Checked then
               begin
                 qckRepFactPuntoVenta.PrinterSetup;
                 qckRepFactPuntoVenta.Print
               end else
               qckRepFactPuntoVenta.Preview;
              if GlbImpPDF then
               ReportExportPDF(qckRepFactPuntoVenta,GlbRutaFacturas+'\Factura'+dmFactura.qryVentaFacturaNUMERO_FACTURA.AsString+'.pdf');
            finally
            qckRepFactPuntoVenta.Free;
            qckRepFactPuntoVenta:=Nil;
            end;

          end else //garcia y surtidora
          if (GLBEsFastFood) And (GlbPorcPropina = 0) then //surtidora
          begin
            frmConsultaFacturas:=TfrmConsultaFacturas.Create(Nil);
            try
              frmConsultaFacturas.rdgCredito.Checked := True;
              frmConsultaFacturas.EditN1.SetInteger(serieDoc);
              frmConsultaFacturas.BitBtn1Click(nil);

              dmreportes.qryViewVentasMast.Close;
              dmreportes.qryViewVentasMast.Params[0].Value:= dmfactura.qryVentaFacturaNUMERO.Value;
              dmreportes.qryViewVentasMast.Open;
              ProcSetPathlogoTipoServicio(dmReportes.qryViewVentasMastTIPO_AFILIADO.Value);

               frmProcVentaRapida.LlenarrxSolDatoscte(dmFactura.qryVentaFacturaCODIGO_CTE.Value);
               if frmConsultaFacturas.rdgCredito.Checked then
                  TipoVenta:='CREDITO'
               else
                  tipoVenta:='CONTADO';

               qckFactServ8_5Surtidora:=TqckFactServ8_5Surtidora.Create(Nil);
               try
                 qckFactServ8_5Surtidora.TPag.Caption:=
                 IntToStr(qckFactServ8_5Surtidora.PageNumber);
                 qckFactServ8_5Surtidora.xtipoVenta := TipoVenta;
                 qckFactServ8_5Surtidora.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;
                 if (GlbImpReciboSinPreg = 1) then
                   qckFactServ8_5Surtidora.Print
                   else
                   if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
                   begin
                     qckFactServ8_5Surtidora.PrinterSetup;
                     qckFactServ8_5Surtidora.Print;
                   end else
                   qckFactServ8_5Surtidora.Preview;
                   //t if GlbImpTicketVtaAgua = 1 then
                   //t ImprimirTicketVtaAgua(frmProcVentaRapida.ipStpInsertVentMast.Params[0].Value);

                   if GlbImpPDF then
                   ReportExport(qckFactServ8_5Surtidora,GlbRutaFacturas+'\Factura'+dmFactura.qryVentaFacturaNUMERO_FACTURA.AsString+'.pdf');

                   if (GlbImpReciboSinPreg = 0) then
                   if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
                    begin
                      qckFactServ8_5Surtidora.Preview;
                    end;

                finally
                qckFactServ8_5Surtidora.Free;
                qckFactServ8_5Surtidora:=Nil;
                end;
                //t if GlbImpTicketVtaAgua = 1 then
                //t ImprimirTicketVtaAgua(frmProcVentaRapida.ipStpInsertVentMast.Params[0].Value);

                finally
                if Assigned(frmConsultaFacturas) then
                   frmConsultaFacturas.Free;
                   frmConsultaFacturas:=Nil;
               end;
          end;
        end else
    if (GlbDocStandar = 1) then //FORMATO STANDARD
    begin
      TipoVenta:='CONTADO';
      if dmfactura.qryVentaFacturaFORMA_PAGO.AsInteger in [7,8] then
      TipoVenta := 'CREDITO'
      else
      if dmfactura.qryVentaFacturaFORMA_PAGO.value = 1 then
      TipoVenta := 'CONTADO';

     frmConsultaFacturas:=TfrmConsultaFacturas.Create(Nil);
     try
       frmConsultaFacturas.rdgCredito.Checked := True;
       frmConsultaFacturas.EditN1.SetInteger(serieDoc);
       frmConsultaFacturas.BitBtn1Click(nil);

      dmreportes.qryViewVentasMast.Close;
      dmreportes.qryViewVentasMast.Params[0].Value:= dmfactura.qryVentaFacturaNUMERO.Value;
      dmreportes.qryViewVentasMast.Open;
      ProcSetPathlogoTipoServicio(dmReportes.qryViewVentasMastTIPO_AFILIADO.Value);
             
       frmProcVentaRapida.LlenarrxSolDatoscte(dmFactura.qryVentaFacturaCODIGO_CTE.Value);
       if frmConsultaFacturas.rdgCredito.Checked then
          TipoVenta:='CREDITO'
       else
          tipoVenta:='CONTADO';

       if dmfactura.qryVentaFacturaFORMA_PAGO.AsInteger in [7,8] then
       begin
         if GetFormatoTipoDoc(0,GlbRutaLogoDoc) then  //2	1	Factura Contado 8.5 Estandar
         GlbDocStandar:=1
         else
         GlbDocStandar:=0;
       end else
       if dmfactura.qryVentaFacturaFORMA_PAGO.AsInteger in [6] then
       begin
         if GetFormatoTipoDoc(3,GlbRutaLogoDoc) then  //2	1	Factura Contado 8.5 Estandar
         GlbDocStandar:=1
         else
         GlbDocStandar:=0;
       end else
       //if dmfactura.qryVentaFacturaFORMA_PAGO.AsInteger in [6] then
       begin
         if GetFormatoTipoDoc(1,GlbRutaLogoDoc) then  //2	1	Factura Contado 8.5 Estandar
         GlbDocStandar:=1
         else
         GlbDocStandar:=0;
       end;

       dmReportes.qryViewVentasMast.Close;
       dmReportes.qryViewVentasMast.Params[0].Value:= dmFactura.qryVentaFacturanumero.value;
       dmReportes.qryViewVentasMast.Open;
       ProcSetPathlogoTipoServicio(dmReportes.qryViewVentasMastTIPO_AFILIADO.Value);

       qckFactServ_8_5Standard:=TqckFactServ_8_5Standard.Create(Nil);
       try
         qckFactServ_8_5Standard.TPag.Caption:=
         IntToStr(qckFactServ_8_5Standard.PageNumber);
         qckFactServ_8_5Standard.xtipoVenta := TipoVenta;
         qckFactServ_8_5Standard.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;

         if dmReportes.qryViewVentasMastMONTO_EXONERADO_ITBIS.Value > 0 then
         begin
           //qckFactServ8_5Ayaco.QRLabel25.left:=505;
           qckFactServ_8_5Standard.QRLabel25.Caption :='ITBIS Exonerado';
         end else
         qckFactServ_8_5Standard.QRLabel25.Caption :='ITBIS';
         if (GlbImpReciboSinPreg = 1) then
           qckFactServ_8_5Standard.Print
           else
           if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
           begin
             //qckFactServ_8_5Standard.QRImage2.Enabled:= False;
             qckFactServ_8_5Standard.PrinterSetup;
             qckFactServ_8_5Standard.Print;
           end else
           qckFactServ_8_5Standard.Preview;
           if GlbImpPDF then
           ReportExport(qckFactServ_8_5Standard,GlbRutaFacturas+'\Factura'+dmFactura.qryVentaFacturaNUMERO_FACTURA.AsString+'.pdf');

           if (GlbImpReciboSinPreg = 0) then
           if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
            begin
              qckFactServ_8_5Standard.Preview;
            end;
        finally
        qckFactServ_8_5Standard.Free;
        qckFactServ_8_5Standard:=Nil;
        end;
        finally
        if Assigned(frmConsultaFacturas) then
           frmConsultaFacturas.Free;
           frmConsultaFacturas:=Nil;
       end;
    end else
    begin
          if (GLBEsFastFood) And (GlbPorcPropina = 0) and (GlbFormatoConduce <> 555) then //surtidora
          begin
            frmConsultaFacturas:=TfrmConsultaFacturas.Create(Nil);
            try
              frmConsultaFacturas.rdgCredito.Checked := True;
              frmConsultaFacturas.EditN1.SetInteger(serieDoc);
              frmConsultaFacturas.BitBtn1Click(nil);

              dmreportes.qryViewVentasMast.Close;
              dmreportes.qryViewVentasMast.Params[0].Value:= dmfactura.qryVentaFacturaNUMERO.Value;
              dmreportes.qryViewVentasMast.Open;
              ProcSetPathlogoTipoServicio(dmReportes.qryViewVentasMastTIPO_AFILIADO.Value);

               frmProcVentaRapida.LlenarrxSolDatoscte(dmFactura.qryVentaFacturaCODIGO_CTE.Value);
               if frmConsultaFacturas.rdgCredito.Checked then
                  TipoVenta:='CREDITO'
               else
                  tipoVenta:='CONTADO';

               qckFactServ8_5Surtidora:=TqckFactServ8_5Surtidora.Create(Nil);
               try
                 qckFactServ8_5Surtidora.TPag.Caption:=
                 IntToStr(qckFactServ8_5Surtidora.PageNumber);
                 qckFactServ8_5Surtidora.xtipoVenta := TipoVenta;
                 qckFactServ8_5Surtidora.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;
                 if (GlbImpReciboSinPreg = 1) then
                   qckFactServ8_5Surtidora.Print
                   else
                   if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
                   begin
                     qckFactServ8_5Surtidora.PrinterSetup;
                     qckFactServ8_5Surtidora.Print;
                   end else
                   qckFactServ8_5Surtidora.Preview;
                   //t if GlbImpTicketVtaAgua = 1 then
                   //t ImprimirTicketVtaAgua(frmProcVentaRapida.ipStpInsertVentMast.Params[0].Value);

                   if GlbImpPDF then
                   ReportExport(qckFactServ8_5Surtidora,GlbRutaFacturas+'\Factura'+dmFactura.qryVentaFacturaNUMERO_FACTURA.AsString+'.pdf');

                   if (GlbImpReciboSinPreg = 0) then
                   if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
                    begin
                      qckFactServ8_5Surtidora.Preview;
                    end;
                finally
                qckFactServ8_5Surtidora.Free;
                qckFactServ8_5Surtidora:=Nil;
                end;
                //t if GlbImpTicketVtaAgua = 1 then
                //t ImprimirTicketVtaAgua(frmProcVentaRapida.ipStpInsertVentMast.Params[0].Value);

                finally
                if Assigned(frmConsultaFacturas) then
                   frmConsultaFacturas.Free;
                   frmConsultaFacturas:=Nil;
               end;
          end
          else
          if ((GLBEsFastFood) and (GlbPorcPropina > 0)) or (GlbFormatoConduce = 555)
          or ((GlBInMobi = 1) or (GlbLimao = 1)) then
          begin
            frmConsultaFacturas:=TfrmConsultaFacturas.Create(Nil);
            try
              frmConsultaFacturas.rdgCredito.Checked := True;
              frmConsultaFacturas.EditN1.SetInteger(serieDoc);
              frmConsultaFacturas.BitBtn1Click(nil);

              dmreportes.qryViewVentasMast.Close;
              dmreportes.qryViewVentasMast.Params[0].Value:= dmfactura.qryVentaFacturaNUMERO.Value;
              dmreportes.qryViewVentasMast.Open;
              ProcSetPathlogoTipoServicio(dmReportes.qryViewVentasMastTIPO_AFILIADO.Value);

               frmProcVentaRapida.LlenarrxSolDatoscte(dmFactura.qryVentaFacturaCODIGO_CTE.Value);
               if frmConsultaFacturas.rdgCredito.Checked then
                  TipoVenta:='CREDITO'
               else
                  tipoVenta:='CONTADO';
               //TqckFacturaLimao01      GlbFormatoConduce
               dmVentas.qryVentaVocados.Close;
               dmVentas.qryVentaVocados.Params[0].Value:=dmReportes.qryViewVentasMastNUMERO.Value;
               dmVentas.qryVentaVocados.Open;
               if dmVentas.qryVentaVocados.RecordCount > 0 then
               begin
                 qckFacturaLimao01:=TqckFacturaLimao01.Create(Nil);
                 try
                   if (GlbImpReciboSinPreg = 1) then
                   qckFacturaLimao01.Print
                   else
                   if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
                   begin
                     qckFacturaLimao01.PrinterSetup;
                     qckFacturaLimao01.Print;
                   end else
                   qckFacturaLimao01.Preview;
                   if GlbImpPDF then
                   ReportExport(qckFacturaLimao01,GlbRutaFacturas+'\Factura'+dmFactura.qryVentaFacturaNUMERO_FACTURA.AsString+'.pdf');

                   if (GlbImpReciboSinPreg = 0) then
                   if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
                    begin
                      qckFacturaLimao01.Preview;
                    end;
                finally
                qckFacturaLimao01.Free;
                qckFacturaLimao01:=Nil;
                end;
               end else
               begin
               qckFactServ8_5Limao:=TQckFactServ8_5Limao.Create(Nil);
               try
                 qckFactServ8_5Limao.TPag.Caption:=
                 IntToStr(qckFactServ8_5Limao.PageNumber);
                 qckFactServ8_5Limao.xtipoVenta := TipoVenta;
                 qckFactServ8_5Limao.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;
                 if (GlbImpReciboSinPreg = 1) then
                   qckFactServ8_5Limao.Print
                   else
                   if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
                   begin
                     qckFactServ8_5Limao.PrinterSetup;
                     qckFactServ8_5Limao.Print;
                   end else
                   qckFactServ8_5Limao.Preview;
                   if GlbImpPDF then
                   ReportExport(qckFactServ8_5Limao,GlbRutaFacturas+'\Factura'+dmFactura.qryVentaFacturaNUMERO_FACTURA.AsString+'.pdf');

                   if (GlbImpReciboSinPreg = 0) then
                   if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
                    begin
                      qckFactServ8_5Limao.Preview;
                    end;
                finally
                qckFactServ8_5Limao.Free;
                qckFactServ8_5Limao:=Nil;
                end;
                end;
            finally
            if Assigned(frmConsultaFacturas) then
            frmConsultaFacturas.Free;
            frmConsultaFacturas:=Nil;
          end;
          //end;
          end
          else
          begin
            qckRepRecibo8_5_11REspReimp :=TqckRepRecibo8_5_11REspReimp.Create(nil);
            try
              qckRepRecibo8_5_11REspReimp.xtipoVenta:= TipoVenta;
              qckRepRecibo8_5_11REspReimp.Prepare;
              glbTPag := qckRepRecibo8_5_11REspReimp.PageNumber;
              qckRepRecibo8_5_11REspReimp.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;
              dmDatos.qryImpresoras.Close;
              dmDatos.qryImpresoras.Open;
              if dmDatos.qryImpresoras.Locate('IDMODULO;IDREPORTE',
              VarArrayOf([1,5]),[]) then     //Factura/Recibo 8.5 x 5.5
              qckRepRecibo8_5_11REspReimp.PrinterSettings.PrinterIndex:=
              GetImpresora(dmDatos.qryImpresorasNOMBRE_IMPRESORA.Value);

              if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
              begin
                qckRepRecibo8_5_11REspReimp.PrinterSetup;
                qckRepRecibo8_5_11REspReimp.Print;
              end else
              qckRepRecibo8_5_11REspReimp.Preview;
              finally
              qckRepRecibo8_5_11REspReimp.free;
              qckRepRecibo8_5_11REspReimp:=Nil;
              end;
            end;
          end;
          finally
          if Assigned(frmConsultaFacturas) then
          frmConsultaFacturas.Free;
          frmConsultaFacturas:=Nil;
          end;
    end else
    if (UpperCase(GLBFormatoFactura) = 'BYMSERVICIOS') then
    begin
      frmConsultaFacturas:=TfrmConsultaFacturas.Create(Nil);
      try
        frmConsultaFacturas.rdgCredito.Checked := True;
        frmConsultaFacturas.EditN1.SetInteger(serieDoc);
        //frmConsultaFacturas.edtCodCte.SetInteger(tablaPropietarioCodigoPropietario.Value);
        if not ExpExcel then
        begin
          frmConsultaFacturas.BitBtn1Click(nil);
          qckFactCredArtioffice8_5_F_1ByM:=TqckFactCredArtioffice8_5_F_1ByM.Create(nil);
          try
            qckFactCredArtioffice8_5_F_1ByM.Prepare;
            glbTPag := qckFactCredArtioffice8_5_F_1ByM.PageNumber;
            qckFactCredArtioffice8_5_F_1ByM.Preview;
          finally
          qckFactCredArtioffice8_5_F_1ByM.free;
          qckFactCredArtioffice8_5_F_1ByM:=nil;
          end;
        end else
        begin
          //Aqui Exportar a Excel
        end;
      finally
      if Assigned(frmConsultaFacturas) then
         frmConsultaFacturas.Free;
         frmConsultaFacturas:=Nil;
      end;
    end else
    if (((UpperCase(GLBFormatoFactura) = 'INGESERVIS')) OR
        ((UpperCase(GLBFormatoFactura) = 'ARTIOFFICE'))) then
    begin
      if frmProcVentaRapida.rdgFactServicio.Checked then
      begin
        ImpFacturaservicio(serieDoc,false);//Dios es Amor
      end else
      begin
        frmConsultaFacturas:=TfrmConsultaFacturas.Create(Nil);
        try
          frmConsultaFacturas.rdgCredito.Checked := True;
          frmConsultaFacturas.EditN1.SetInteger(serieDoc);
          //frmConsultaFacturas.edtCodCte.SetInteger(tablaPropietarioCodigoPropietario.Value);
          if not ExpExcel then
          begin
            frmConsultaFacturas.BitBtn1Click(nil);
            qckFactCredArtioffice8_5_F_1:=TqckFactCredArtioffice8_5_F_1.Create(nil);
            try
              qckFactCredArtioffice8_5_F_1.Prepare;
              glbTPag := qckFactCredArtioffice8_5_F_1.PageNumber;
              qckFactCredArtioffice8_5_F_1.Preview;
            finally
            qckFactCredArtioffice8_5_F_1.free;
            qckFactCredArtioffice8_5_F_1:=nil;
            end;
          end else
          begin
            //Aqui Exportar a Excel
          end;
      finally
        if Assigned(frmConsultaFacturas) then
        frmConsultaFacturas.Free;
        frmConsultaFacturas:=Nil;
      end;
    end;
  end else
  begin
    dmCompania.tblCompania.Close;
    dmCompania.tblCompania.Open;
    dmCompania.tblCompania.Locate('codigo', glbCia_Key,[]);
    dmfactura.qryFactReimpMaster.Close;
    dmfactura.qryFactReimpMaster.Params[0].Value:= serieDoc;

    dmfactura.qryFactReimpDet.Close;
    dmfactura.qryFactReimpDet.Params[0].Value:=dmfactura.qryFactReimpMaster.Params[0].Value;
    dmfactura.qryFactReimpDet.Open;
    dmfactura.qryFactReimpDet.Last;
    tRecordsDet := dmfactura.qryFactReimpDet.RecordCount;
    dmfactura.qryFactReimpDet.Close;

    dmfactura.qryFactReimpMaster.Open;
    frmConsultaFacturas:=TfrmConsultaFacturas.Create(Nil);
    try
      frmConsultaFacturas.rdgCredito.Checked:=True;
      frmConsultaFacturas.EditN1.SetInteger(dmfactura.qryFactReimpMaster.Params[0].Value);
      //frmConsultaFacturas.edtCodCte.SetInteger(dmfactura.qryFactReimpMasterCODIGO_CTE.Value);
      if not ExpExcel then
      begin
        frmConsultaFacturas.BitBtn1Click(nil);
      end else
      begin
        //Aqui Exportar a Excel
      end;
    finally
    if Assigned(frmConsultaFacturas) then
    frmConsultaFacturas.Free;
    frmConsultaFacturas:=Nil;
    end;

    dmclientes.tblClientes.Close;
    dmclientes.tblClientes.Open;
    if dmclientes.tblClientes.Locate('CODIGO_CTE', dmfactura.qryFactReimpMasterCODIGO_CTE.Value,[]) then
    glbcodVendedor:=dmclientes.tblClientesCOD_VENDEDOR.Value
    else
    glbcodVendedor:= VarUsuarioGlb;
      if dmfactura.qryFactReimpMaster.Recordcount > 0 then
      begin
        if (GlbFact55Pulg = 1) then
        begin
          if (GlbFacturaLicoreria =1) then
          begin
            qckRepFacturaEstandarNewReimpREsp:=TqckRepFacturaEstandarNewReimpREsp.Create(Nil);
            try
             if GlbSizeFact8x11 = 1 then
             qckRepFacturaEstandarNewReimpREsp.Page.Length := 11;
             qckRepFacturaEstandarNewReimpREsp.xtipoVenta := TipoVenta;
             qckRepFacturaEstandarNewReimpREsp.Prepare;
             glbTPag := qckRepFacturaEstandarNewReimpREsp.PageNumber;
             //qckRepRecibo8_5_11REsp.valorNCF:= GlbDescNCF;//valorNCF;
            if  frmProcVentaRapida.ImprimirRecibo1.Checked then
             begin
               qckRepFacturaEstandarNewReimpREsp.PrinterSetup;
               qckRepFacturaEstandarNewReimpREsp.Print;
             end else
             qckRepFacturaEstandarNewReimpREsp.Preview;
             finally
             qckRepFacturaEstandarNewReimpREsp.Free;
             qckRepFacturaEstandarNewReimpREsp:=Nil;
             end;
          end else
          begin
            if (GlbFarmacia = 1) and (GlbFact55Pulg = 1) then
            begin
              TipoVenta:='CONTADO';
              if dmfactura.qryVentaFacturaFORMA_PAGO.AsInteger in [7,8] then
              TipoVenta := 'CREDITO'
              else
              if dmfactura.qryVentaFacturaForma_pago.value = 1 then
              TipoVenta := 'CONTADO';

              ImprimeFactura8_5Farmacia(dmfactura.qryVentaFacturaNUMERO.Value,TipoVenta,'','Facturas');
            end else
            begin
            qckRepFacturaEstandarNewReimp:=TqckRepFacturaEstandarNewReimp.Create(Nil);
            try
              if GlbSizeFact8x11 = 1 then
              qckRepFacturaEstandarNewReimp.Page.Length := 11;

              qckRepFacturaEstandarNewReimp.Prepare;
              glbTPag := qckRepFacturaEstandarNewReimp.PageNumber;

              if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
              begin
                qckRepFacturaEstandarNewReimp.PrinterSetup;
                qckRepFacturaEstandarNewReimp.Print;
              end else
              qckRepFacturaEstandarNewReimp.Preview;
            finally
            qckRepFacturaEstandarNewReimp.Free;
            qckRepFacturaEstandarNewReimp:=Nil;
            end;
          end;
        end;
      end
      else
      begin //ver aqui posibilidad de impresora fiscal
        if (GlbActivaIFiscal = 0) then
        begin
          qckRepFactPuntoVenta:=TqckRepFactPuntoVenta.Create(Nil);
          try
            qckRepFactPuntoVenta.QRLabel14.Enabled:=False;
            qckRepFactPuntoVenta:=TqckRepFactPuntoVenta.Create(Nil);
            //pulgadaInc:=0.86;
            //temporal
            //{
            if dmFactura.qryVentaFacturaDet.RecordCount = 1 then
            qckRepFactPuntoVenta.Page.Length:= 5
            else
            if dmFactura.qryVentaFacturaDet.RecordCount >= 2 then
            qckRepFactPuntoVenta.Page.Length:= qckRepFactPuntoVenta.Page.Length +
            (dmFactura.qryVentaFacturaDet.RecordCount - 1 ) * 0.25;

            flag:=true;
            qckRepFactPuntoVenta.Prepare;
            frmProcVentaRapida.rxventa.DisableControls;
            frmProcVentaRapida.rxdbgrid1.Enabled:=False;
            if (dmFactura.qryVentaFacturaDet.RecordCount > 1) or (qckRepFactPuntoVenta.PageNumber > 1) then
            begin
              repeat
              begin
                if (qckRepFactPuntoVenta.PageNumber > 1) then
                begin
                  qckRepFactPuntoVenta.Page.Length:=qckRepFactPuntoVenta.Page.Length + 0.25;
                  qckRepFactPuntoVenta.Prepare;
                  flag:=False;
                end else break;
              end;
              until flag = true;
            end;
            frmProcVentaRapida.rxventa.EnableControls;
            frmProcVentaRapida.rxdbgrid1.Enabled:=True;
            if frmProcVentaRapida.ImprimirRecibo1.Checked then
            begin
              qckRepFactPuntoVenta.PrinterSetup;
              qckRepFactPuntoVenta.Print;
            end else
            qckRepFactPuntoVenta.Preview;
          finally
          qckRepFactPuntoVenta.Free;
          qckRepFactPuntoVenta:=Nil;
          end;
        end;
      end;
    end;
  end;
end;

procedure ImpFacturaservicio(numerotrn: Integer;EsReimpresion: Boolean);
begin
  frmConsultaFacturas:=TfrmConsultaFacturas.Create(Nil);
  try
    if not EsReimprimirContado then
    frmConsultaFacturas.rdgCredito.Checked:=True;
    frmConsultaFacturas.EditN1.SetInteger(numerotrn);
    if not ExpExcel then
    begin
      frmConsultaFacturas.BitBtn1Click(nil);
      ImprimeDocumento(numerotrn);
    end;
  finally
  if Assigned(frmConsultaFacturas) then
  frmConsultaFacturas.Free;
  frmConsultaFacturas:=Nil;
  end;

  dmFactura.qryTemplateFactura.Close;
  dmFactura.qryTemplateFactura.Params[0].Value := 1;//Factura Servicio
  dmFactura.qryTemplateFactura.Open;
  frmProcVentaRapida.ExportarGridExcel;
  ExpExcel:=False;  
end;     

procedure ImprimirEdicionFactura;
var
  TipoVenta:string;
  flag:Boolean;
begin
if (GlbFarmacia = 1) and (GlbRec55Pulg = 1) then
    begin
      TipoVenta:='CONTADO';
      if dmReportes.qryViewVentasMastForma_pago.AsInteger in [7,8] then
      TipoVenta := 'CREDITO'
      else
      if dmReportes.qryViewVentasMastForma_pago.value = 1 then
      TipoVenta := 'CONTADO';

      ImprimeFactura8_5Farmacia(dmReportes.qryViewVentasMastNumero.Value,TipoVenta,'','Recibos');
      if not frmProcVentaRapida.stpProc_InsertaVentaAuto.Params[0].isNull then
      begin
        //ImprimeFactraCXCFinc(stpProc_InsertaVentaAuto.Params[0].Value,TipoVenta);
        //stpProc_InsertaVentaAuto.Close;
      end;
    end else
    if (GlbFarmacia = 1 ) then  //Linea 15453
    begin
      dmFactura.qryDatosVtaARS.Close;
      dmFactura.qryDatosVtaARS.Params[0].Value := dmReportes.qryViewVentasMastNUMERO.Value;
      dmFactura.qryDatosVtaARS.Open;
      dmFactura.qryDatosVtaARS.First;

      TipoVenta:='CONTADO';
      if dmReportes.qryViewVentasMastForma_pago.AsInteger in [7,8] then
      TipoVenta := 'CREDITO'
      else
      if dmReportes.qryViewVentasMastForma_pago.value = 1 then
      TipoVenta := 'CONTADO';

      if (TipoVenta = 'CONTADO') then
      frmProcVentaRapida.AbrirDatosParaTicket(false,false,dmReportes.qryViewVentasMastCODIGO_CTE.AsString,dmReportes.qryViewVentasMastNUMERO_DOC_PAGO.AsInteger,
      dmReportes.qryViewVentasMastFECHA.Value)
      else
      if (TipoVenta = 'CREDITO') then
      frmProcVentaRapida.AbrirDatosParaTicket(false,true,dmReportes.qryViewVentasMastCODIGO_CTE.AsString,dmReportes.qryViewVentasMastNUMERO_FACTURA.AsInteger,
      dmReportes.qryViewVentasMastFECHA.Value);
      qckRepReciboReimpTicketFarmaciaARS:=TqckRepReciboReimpTicketFarmaciaARS.Create(Nil);
      try
        dmDatos.qryImpresoras.Close;
        dmDatos.qryImpresoras.Open;
        if dmDatos.qryImpresoras.Locate('IDMODULO;IDREPORTE',
        VarArrayOf([1,6]),[]) then     //Factura/Recibo Punto Venta
        qckRepReciboReimpTicketFarmaciaARS.PrinterSettings.PrinterIndex:=
        GetImpresora(dmDatos.qryImpresorasNOMBRE_IMPRESORA.Value);

        if (dmFactura.qryDatosVtaARS.RecordCount = 0) then
        begin
          qckRepReciboReimpTicketFarmaciaARS.ChildBand10.Height:=0;
          qckRepReciboReimpTicketFarmaciaARS.ChildBand1.Height :=40;
          qckRepReciboReimpTicketFarmaciaARS.Page.Length:=
          qckRepReciboReimpTicketFarmaciaARS.Page.Length - 5;
        end else
        begin
          qckRepReciboReimpTicketFarmaciaARS.ChildBand1.Height:=95;
        end;

        if dmFactura.qryVtaConDeliveryTrn.RecordCount = 0 then
        begin
          qckRepReciboReimpTicketFarmaciaARS.ChildBand13.Height:=0;
          qckRepReciboReimpTicketFarmaciaARS.Page.Length:=
          qckRepReciboReimpTicketFarmaciaARS.Page.Length - 3.45;
        end;
        if GlbEsCopia then
        qckRepReciboReimpTicketFarmaciaARS.strcopia :=' (COPIA)'
        else
        qckRepReciboReimpTicketFarmaciaARS.strcopia :='';

        qckRepReciboReimpTicketFarmaciaARS.ncfDesc := GlbDescNCF;
        if Length(frmProcVentaRapida.edtObservacion.Text) > 0 then
        qckRepReciboReimpTicketFarmaciaARS.nombreCteGenerico:=frmProcVentaRapida.edtObservacion.Text;
        if (dmReportes.qryViewVentasMastCodigo_cte.value > 0) then
        begin
          qckRepReciboReimpTicketFarmaciaARS.qrLabelRNC.Caption:='RNC-' + frmProcVentaRapida.qryClienteRNC_NUMERO.Value;
          qckRepReciboReimpTicketFarmaciaARS.nombreCteGenerico:= frmProcVentaRapida.qryClienteNOMBRE_CTE.Value;
        end
        else qckRepReciboReimpTicketFarmaciaARS.qrLabelRNC.Caption:='';
        qckRepReciboReimpTicketFarmaciaARS.xtipoVenta := TipoVenta;
        qckRepReciboReimpTicketFarmaciaARS.valorNCF   := dmReportes.qryViewVentasMastNUMERO_NCF.Value;

        //pulgadaInc:=0.86;

        dmFactura.qryVentaFacturaDet.Last;
        if (dmFactura.qryVentaFacturaDet.RecordCount = 1) and
        (qckRepReciboReimpTicketFarmaciaARS.Page.Length < 6.65)  then
        qckRepReciboReimpTicketFarmaciaARS.Page.Length:=5.759
        else
        if dmFactura.qryVentaFacturaDet.RecordCount >= 2 then
        qckRepReciboReimpTicketFarmaciaARS.Page.Length:= qckRepReciboReimpTicketFarmaciaARS.Page.Length +
        (dmFactura.qryVentaFacturaDet.RecordCount - 1 ) * 0.25;

        flag:=true;
        qckRepReciboReimpTicketFarmaciaARS.Prepare;
      if (glbQckUnaPagina = 1) then
      begin
        dmFactura.qryVentaFacturaDet.Last;
        if ((dmFactura.qryVentaFacturaDet.RecordCount >= 1) and
           ((dmFactura.qryVentaFacturaDet.RecordCount < 10)
            or (qckRepReciboReimpTicketFarmaciaARS.PageNumber = 2))) then
        begin
          frmProcVentaRapida.ProgressBar1.Visible:=true;
          frmProcVentaRapida.ProgressBar1.Position:=0;
          frmProcVentaRapida.ProgressBar1.Max:=dmFactura.qryVentaFacturaDet.RecordCount;
          repeat
          begin
            frmProcVentaRapida.ProgressBar1.StepIt;
            //cRc:=cRc + 1;
            if (qckRepReciboReimpTicketFarmaciaARS.PageNumber > 1) then
            begin
              qckRepReciboReimpTicketFarmaciaARS.Page.Length:=qckRepReciboReimpTicketFarmaciaARS.Page.Length + 0.50;

              qckRepReciboReimpTicketFarmaciaARS.Prepare;
              flag:=False;
            end else
            if (qckRepReciboReimpTicketFarmaciaARS.PageNumber = 1) then
                break;
            if (qckRepReciboReimpTicketFarmaciaARS.PageNumber = 1) then
                break;
            end;
            until flag = true;
        end;
      end;
        frmProcVentaRapida.ProgressBar1.Visible:=False;
        dmFactura.qryVentaFacturaDet.First;
        if (GlbImpReciboSinPreg = 1) and (GlbImprimeReciboFact = 1) then
        qckRepReciboReimpTicketFarmaciaARS.Print
        else
        if MessageDlg('Imprimir?',mtInformation, [mbYes, mbNo], 0)=mryes then
        begin
          if (GlbImprimeReciboFact = 1) then
          begin
              qckRepReciboReimpTicketFarmaciaARS.PrinterSetup;
              qckRepReciboReimpTicketFarmaciaARS.Print;
            //end;
          end;
        end else
        qckRepReciboReimpTicketFarmaciaARS.Preview;
        reciboImpreso:=True;
      finally
      qckRepReciboReimpTicketFarmaciaARS.Free;
      qckRepReciboReimpTicketFarmaciaARS:=Nil;
      end;
    end else
    if (GLBMutur = 1) then
      begin
        dmreportes.qryViewVentasMast.Close;
        dmreportes.qryViewVentasMast.Params[0].Value:= dmFactura.qryVentaFacturaNUMERO.Value;
        dmreportes.qryViewVentasMast.Open;
        qckFactServ_8_5SAMNewMuturs:=TqckFactServ_8_5SAMNewMuturs.Create(Nil);
          try
            qckFactServ_8_5SAMNewMuturs.rxVendedor.Close;
            qckFactServ_8_5SAMNewMuturs.rxVendedor.Open;
            if dmreportes.qryCantVendedoresSamCANTVENDEDORES.Value = 1 then
            begin
              if frmProcVentaRapida.qryEmpleado.Locate('codigo', dmreportes.qryViewVentasDetCodigo_Vendedor.Value,[]) then
              begin                                                       
                qckFactServ_8_5SAMNewMuturs.rxVendedor.Append;
                qckFactServ_8_5SAMNewMuturs.rxVendedorNombreVendedor.Value:=
                frmProcVentaRapida.qryEmpleadoNOMBREVENDEDOR.Value;
                qckFactServ_8_5SAMNewMuturs.rxVendedor.Post;
              end;
            end else
            begin
              qckFactServ_8_5SAMNewMuturs.rxVendedor.Close;
              qckFactServ_8_5SAMNewMuturs.rxVendedor.Open;
              qckFactServ_8_5SAMNewMuturs.rxVendedor.Append;
              qckFactServ_8_5SAMNewMuturs.rxVendedorNombreVendedor.Value:='';
              qckFactServ_8_5SAMNewMuturs.rxVendedor.Post;
              end;
              qckFactServ_8_5SAMNewMuturs.TPag.Caption:=
              IntToStr(qckFactServ_8_5SAMNewMuturs.PageNumber);
              qckFactServ_8_5SAMNewMuturs.xtipoVenta := TipoVenta;
              //qckFactServ_8_5SAMNewMuturs.valorNCF:= valorNCF;
              if dmReportes.qryViewVentasMastMONTO_EXONERADO_ITBIS.Value > 0 then
              begin
                qckFactServ_8_5SAMNewMuturs.QRLabel25.Caption :='ITBIS Exonerado';
              end  else
              qckFactServ_8_5SAMNewMuturs.QRLabel25.Caption :='ITBIS';

              if (GlbImpReciboSinPreg = 1) then
              qckFactServ_8_5SAMNewMuturs.Print
              else
              if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
              begin
                //qckFactServ_8_5SAMNewMuturs.QRImage2.Enabled:= False;
                qckFactServ_8_5SAMNewMuturs.PrinterSetup;
                qckFactServ_8_5SAMNewMuturs.Print;
              end else
              qckFactServ_8_5SAMNewMuturs.Preview;

              if (GlbImpReciboSinPreg = 0) then
              if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
              begin
                qckFactServ_8_5SAMNewMuturs.Preview;
              end;
             if GlbImpPDF then
             begin
               if not dmReportes.qryViewVentasMastNUMERO_FACTURA.IsNull then
               ReportExportPDF(qckFactServ_8_5SAMNewMuturs,GlbRutaRecibos+'\Recibos'+IntToStr(dmReportes.qryViewVentasMastNUMERO_FACTURA.Value)+'.pdf')
               else
               ReportExportPDF(qckFactServ_8_5SAMNewMuturs,GlbRutaRecibos+'\Recibos'+IntToStr(dmReportes.qryViewVentasMastNUMERO_DOC_PAGO.AsInteger)+'.pdf')
             end;
          finally
          qckFactServ_8_5SAMNewMuturs.Free;
          qckFactServ_8_5SAMNewMuturs:=Nil;
          end;
      end else
      if (GlbSAM = 1) then
      begin
        dmreportes.qryViewVentasMast.Close;
        dmreportes.qryViewVentasMast.Params[0].Value:= dmFactura.qryVentaFacturaNUMERO.Value;
        dmreportes.qryViewVentasMast.Open;
        ProcSetPathlogoTipoServicio(dmReportes.qryViewVentasMastTIPO_AFILIADO.Value);
        if (GlbUsaFctMexico = 1) then
        begin
          qckFactServ_8_5SAMNewM:=TqckFactServ_8_5SAMNewM.Create(Nil);
          try
            qckFactServ_8_5SAMNewM.rxVendedor.Close;
            qckFactServ_8_5SAMNewM.rxVendedor.Open;
            if dmreportes.qryCantVendedoresSamCANTVENDEDORES.Value = 1 then
            begin
              if frmProcVentaRapida.qryEmpleado.Locate('codigo', dmreportes.qryViewVentasDetCodigo_Vendedor.Value,[]) then
              begin
                qckFactServ_8_5SAMNewM.rxVendedor.Append;
                qckFactServ_8_5SAMNewM.rxVendedorNombreVendedor.Value:=
                frmProcVentaRapida.qryEmpleadoNOMBREVENDEDOR.Value;
                qckFactServ_8_5SAMNewM.rxVendedor.Post;
              end;
            end else
            begin
              qckFactServ_8_5SAMNewM.rxVendedor.Close;
              qckFactServ_8_5SAMNewM.rxVendedor.Open;
              qckFactServ_8_5SAMNewM.rxVendedor.Append;
              qckFactServ_8_5SAMNewM.rxVendedorNombreVendedor.Value:='';
              qckFactServ_8_5SAMNewM.rxVendedor.Post;
              end;
              qckFactServ_8_5SAMNewM.TPag.Caption:=
              IntToStr(qckFactServ_8_5SAMNewM.PageNumber);
              qckFactServ_8_5SAMNewM.xtipoVenta := TipoVenta;
              //qckFactServ_8_5SAMNewM.valorNCF:= valorNCF;
              if dmReportes.qryViewVentasMastMONTO_EXONERADO_ITBIS.Value > 0 then
              begin
                qckFactServ_8_5SAMNewM.QRLabel25.Caption :='ITBIS Exonerado';
              end  else
              qckFactServ_8_5SAMNewM.QRLabel25.Caption :='ITBIS';

              if (GlbImpReciboSinPreg = 1) then
              qckFactServ_8_5SAMNewM.Print
              else
              if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
              begin
                //qckFactServ_8_5SAMNewM.QRImage2.Enabled:= False;
                qckFactServ_8_5SAMNewM.PrinterSetup;
                qckFactServ_8_5SAMNewM.Print;
              end else
              qckFactServ_8_5SAMNewM.Preview;

              if (GlbImpReciboSinPreg = 0) then
              if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
              begin
                qckFactServ_8_5SAMNewM.Preview;
              end;
             if GlbImpPDF then
             begin
               if not dmReportes.qryViewVentasMastNUMERO_FACTURA.IsNull then
               ReportExportPDF(qckFactServ_8_5SAMNewM,GlbRutaRecibos+'\Recibos'+IntToStr(dmReportes.qryViewVentasMastNUMERO_FACTURA.Value)+'.pdf')
               else
               ReportExportPDF(qckFactServ_8_5SAMNewM,GlbRutaRecibos+'\Recibos'+IntToStr(dmReportes.qryViewVentasMastNUMERO_DOC_PAGO.AsInteger)+'.pdf')
             end;
          finally
          qckFactServ_8_5SAMNewM.Free;
          qckFactServ_8_5SAMNewM:=Nil;
          end;
        end else
        if (GLBFORMATOFACTPREIMP = 0) then
        begin
          qckFactServ_8_5SAM:=TqckFactServ_8_5SAM.Create(Nil);
          try
          qckFactServ_8_5SAM.rxVendedor.Close;
          qckFactServ_8_5SAM.rxVendedor.Open;
          if dmreportes.qryCantVendedoresSamCANTVENDEDORES.Value = 1 then
          begin
            if frmProcVentaRapida.qryEmpleado.Locate('codigo', dmreportes.qryViewVentasDetCodigo_Vendedor.Value,[]) then
            begin
              qckFactServ_8_5SAM.rxVendedor.Append;
              qckFactServ_8_5SAM.rxVendedorNombreVendedor.Value:=
              frmProcVentaRapida.qryEmpleadoNOMBREVENDEDOR.Value;
              qckFactServ_8_5SAM.rxVendedor.Post;
            end;
          end else
          begin
            //rxVendedorNombreVendedor
            qckFactServ_8_5SAM.rxVendedor.Close;
            qckFactServ_8_5SAM.rxVendedor.Open;
            qckFactServ_8_5SAM.rxVendedor.Append;
            qckFactServ_8_5SAM.rxVendedorNombreVendedor.Value:='';
            qckFactServ_8_5SAM.rxVendedor.Post;
          end;

             //qckFactServ8_5SAM.TPag.Caption:=IntToStr(TqckFactServ8_5SAM.PageNumber);
             qckFactServ_8_5SAM.xtipoVenta := 'Devolucion';
             qckFactServ_8_5SAM.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;

             if dmReportes.qryViewVentasMastMONTO_EXONERADO_ITBIS.Value > 0 then
             begin
               qckFactServ_8_5SAM.QRLabel25.Caption :='ITBIS Exonerado';
             end  else
             qckFactServ_8_5SAM.QRLabel25.Caption :='ITBIS';

             if (GlbImpReciboSinPreg = 1) then
                qckFactServ_8_5SAM.Print
              else
              if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
              begin
                qckFactServ_8_5SAM.QRImage2.Enabled:= False;
                qckFactServ_8_5SAM.PrinterSetup;
                qckFactServ_8_5SAM.Print;
              end else
              qckFactServ_8_5SAM.Preview;

            if (GlbImpReciboSinPreg = 0) then
            if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
            begin
              qckFactServ_8_5SAM.Preview;
            end;
            if GlbImpPDF then
            begin
            if not dmReportes.qryViewVentasMastNUMERO_DOC_PAGO.IsNull then
            ReportExportPDF(qckFactServ_8_5SAM,GlbRutaFacturas+'\FacturaModificada'+IntToStr(dmReportes.qryViewVentasMastNUMERO_DOC_PAGO.AsInteger)+'.pdf')
            else
            ReportExportPDF(qckFactServ_8_5SAM,GlbRutaFacturas+'\FacturaModificada'+IntToStr(dmReportes.qryViewVentasMastNumeroDocCldo.AsInteger)+'.pdf')
            end;
        finally
        qckFactServ_8_5SAM.Free;
        qckFactServ_8_5SAM:=Nil;
        end;
        end else
        begin
          //formatonuevoSAM
          qckFactServ_8_5SAMNew:=TqckFactServ_8_5SAMNew.Create(Nil);
          try
          qckFactServ_8_5SAMNew.rxVendedor.Close;
          qckFactServ_8_5SAMNew.rxVendedor.Open;
          if dmreportes.qryCantVendedoresSamCANTVENDEDORES.Value = 1 then
          begin
            if frmProcVentaRapida.qryEmpleado.Locate('codigo', dmreportes.qryViewVentasDetCodigo_Vendedor.Value,[]) then
            begin
              qckFactServ_8_5SAMNew.rxVendedor.Append;
              qckFactServ_8_5SAMNew.rxVendedorNombreVendedor.Value:= frmProcVentaRapida.qryEmpleadoNOMBREVENDEDOR.Value;
              qckFactServ_8_5SAMNew.rxVendedor.Post;
            end;
          end else
          begin
            //rxVendedorNombreVendedor
            qckFactServ_8_5SAMNew.rxVendedor.Close;
            qckFactServ_8_5SAMNew.rxVendedor.Open;
            qckFactServ_8_5SAMNew.rxVendedor.Append;
            qckFactServ_8_5SAMNew.rxVendedorNombreVendedor.Value:='';
            qckFactServ_8_5SAMNew.rxVendedor.Post;
          end;

             //qckFactServ8_5SAM.TPag.Caption:=IntToStr(TqckFactServ8_5SAM.PageNumber);
             qckFactServ_8_5SAMNew.xtipoVenta := 'Factura';
             qckFactServ_8_5SAMNew.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;

             if dmFactura.qryVentaFacturaMONTO_EXONERADO_ITBIS.Value > 0 then
             begin
               qckFactServ_8_5SAMNew.QRLabel25.Caption :='ITBIS Exonerado';
             end  else
             qckFactServ_8_5SAMNew.QRLabel25.Caption :='ITBIS';

             if (GlbImpReciboSinPreg = 1) then
                qckFactServ_8_5SAMNew.Print
              else
              if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
              begin
                qckFactServ_8_5SAMNew.QRImage2.Enabled:= False;
                qckFactServ_8_5SAMNew.PrinterSetup;
                qckFactServ_8_5SAMNew.Print;
              end else
              qckFactServ_8_5SAMnew.Preview;

            if (GlbImpReciboSinPreg = 0) then
            if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
            begin
              qckFactServ_8_5SAMnew.Preview;
            end;
            if GlbImpPDF then
            begin
            if not dmReportes.qryViewVentasMastNUMERO_DOC_PAGO.IsNull then
            ReportExportPDF(qckFactServ_8_5SAMnew,GlbRutaFacturas+'\FacturaModificada'+IntToStr(dmReportes.qryViewVentasMastNUMERO_DOC_PAGO.AsInteger)+'.pdf')
            else
            ReportExportPDF(qckFactServ_8_5SAMnew,GlbRutaFacturas+'\FacturaModificada'+IntToStr(dmReportes.qryViewVentasMastNumeroDocCldo.AsInteger)+'.pdf')
            end;
        finally
        qckFactServ_8_5SAMnew.Free;
        qckFactServ_8_5SAMNew:=Nil;
        end;
        end;
      end else
      if (GlBAyaco = 1) or (GlbSizeFact8x11 = 1) or (GlBTapiceria = 1) or (GlBInveraf =1) then
         begin
           qckFactServ8_5Ayaco:=TqckFactServ8_5Ayaco.Create(Nil);
           try
             qckFactServ8_5Ayaco.TPag.Caption:=
             IntToStr(qckFactServ8_5Ayaco.PageNumber);
             qckFactServ8_5Ayaco.xtipoVenta := 'Factura';
             qckFactServ8_5Ayaco.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;

             if dmFactura.qryVentaFacturaMONTO_EXONERADO_ITBIS.Value > 0 then
             begin
               qckFactServ8_5Ayaco.QRLabel25.Caption :='ITBIS Exonerado';
             end  else
             qckFactServ8_5Ayaco.QRLabel25.Caption :='ITBIS';

             if (GlbImpReciboSinPreg = 1) then
                qckFactServ8_5Ayaco.Print
              else
              if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
              begin
                qckFactServ8_5Ayaco.PrinterSetup;
                qckFactServ8_5Ayaco.Print;
              end else
              qckFactServ8_5Ayaco.Preview;

            if (GlbImpReciboSinPreg = 0) then
            if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
            begin 
              qckFactServ8_5Ayaco.Preview;
            end;
            if GlbImpPDF then
            begin
            if not dmReportes.qryViewVentasMastNUMERO_DOC_PAGO.IsNull then
            ReportExportPDF(qckFactServ8_5Ayaco,GlbRutaFacturas+'\FacturaModificada'+IntToStr(dmReportes.qryViewVentasMastNUMERO_DOC_PAGO.AsInteger)+'.pdf')
            else
            ReportExportPDF(qckFactServ8_5Ayaco,GlbRutaFacturas+'\FacturaModificada'+IntToStr(dmReportes.qryViewVentasMastNumeroDocCldo.AsInteger)+'.pdf')
            end;
        finally                            
        qckFactServ8_5Ayaco.Free;
        qckFactServ8_5Ayaco:=Nil;
        end;
      end else
    if (UpperCase(GLBFormatoFactura) = 'FORMAFACOCO') and (GLBNumConduceCte = 1)then
    begin
      TipoVenta:='CONTADO';
      if dmfactura.qryVentaFacturaFORMA_PAGO.AsInteger in [7,8] then
      TipoVenta := 'CREDITO'
      else
      if dmfactura.qryVentaFacturaFORMA_PAGO.value = 1 then
      TipoVenta := 'CONTADO';
      dmreportes.qryViewVentasMast.Close;
      dmreportes.qryViewVentasMast.Params[0].Value:= dmFactura.qryVentaFacturaNUMERO.Value;
      dmreportes.qryViewVentasMast.Open;
      ProcSetPathlogoTipoServicio(dmReportes.qryViewVentasMastTIPO_AFILIADO.Value);

      if GlbFormatoConduce = 444 then
      begin
        qckFactServ8_5Agua:=TqckFactServ8_5Agua.Create(Nil);
        try
          if GlbEsCopia then
          qckFactServ8_5Agua.xtipoVenta := TipoVenta +' (Copia)'
          else qckFactServ8_5Agua.xtipoVenta := TipoVenta;
          qckFactServ8_5Agua.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;
          if (GlbImpReciboSinPreg = 1) then
             qckFactServ8_5Agua.Print
          else
          begin
            frmProcVentaRapida.ProgressBar1.Visible:= False;
            frmImprimir:=TfrmImprimir.Create(nil);
            try
              if frmImprimir.Showmodal = mrOk then
              begin
                if frmImprimir.RadioGroup1.ItemIndex = 0 then
                qckFactServ8_5Agua.Page.PaperSize := Letter;
                if frmImprimir.RadioButton1.Checked then
                begin
                  qckFactServ8_5Agua.PrinterSetup;
                  qckFactServ8_5Agua.Print;
                end else
                qckFactServ8_5Agua.Preview;
              end;
            finally
            frmImprimir.Free;
            frmImprimir:=Nil;
            end;
          end;

          if (GlbImpReciboSinPreg = 0) then
          if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
          begin
            qckFactServ8_5Agua.Preview;
          end;
          if GlbImpPDF then
          begin
          if not dmFactura.qryVentaFacturaNUMERO_FACTURA.IsNull then
             ReportExportPDF(qckFactServ8_5Agua,GlbRutaFacturas+'\Facturas'+IntToStr(dmFactura.qryVentaFacturaNUMERO_FACTURA.Value)+'.pdf')
          else
          if not dmFactura.qryVentaFacturaNUMERO_DOC_PAGO.IsNull then
             ReportExportPDF(qckFactServ8_5Agua,GlbRutaFacturas+'\Facturas'+IntToStr(dmFactura.qryVentaFacturaNUMERO_DOC_PAGO.AsInteger)+'.pdf')
          end;
        finally
        qckFactServ8_5Agua.Free;
        qckFactServ8_5Agua:=Nil;
        end;
      end;
    end else  //if (UpperCase(GLBFormatoFactura) = 'FORMAFACOCO') and (GLBNumConduceCte = 1)then
    if EsConduce And (UpperCase(GLBFormatoFactura) = 'FORMAFACOCO') then  //en prueba
    begin
      ImprimirFacturaRepuestoConduce(dmfactura.qryFactReimpMaster.Params[0].Value)
    end else
   if (UpperCase(GLBFormatoFactura) = 'FORMAEXPLODISMAR') then
     ImprimeFacturaEXDMAR(0,TipoVenta,'','Recibos')
   else
    if (UpperCase(GLBFormatoFactura) = 'FORMAFACOCO') then
    ImprimirFacturaRepuesto(dmfactura.qryFactReimpMaster.Params[0].Value)
    ELSE
    if (UpperCase(GLBFormatoFactura) = 'BYMSERVICIOS') then
    begin
      qckFactCredArtioffice8_5_F_1ByM:=TqckFactCredArtioffice8_5_F_1ByM.Create(nil);
      try
        qckFactCredArtioffice8_5_F_1ByM.Preview;
      finally
      qckFactCredArtioffice8_5_F_1ByM.free;
      qckFactCredArtioffice8_5_F_1ByM:=nil;
      end;
    end else
      if (((UpperCase(GLBFormatoFactura) = 'INGESERVIS')) OR
    ((UpperCase(GLBFormatoFactura) = 'ARTIOFFICE'))) then
    begin
      if (dmFactura.qryVentaFacturaTIPO_FACTURA.Value = 1 ) then //
      begin
        qckFactCredArtioffice8_5_F_1:=TqckFactCredArtioffice8_5_F_1.Create(nil);
        try
          qckFactCredArtioffice8_5_F_1.Preview;
        finally
        qckFactCredArtioffice8_5_F_1.free;
        qckFactCredArtioffice8_5_F_1:=nil;
        end;
      end else
      begin
       ImpFacturaservicio(dmfactura.qryFactReimpMaster.Params[0].Value,True);
      end;
    end else
    if esContado then
    ReImprimirRecibo //1Click(nil)  frmProcVentaRapida.
    else
    begin
      //***************************** begin **********************************
      dmCompania.tblCompania.Close;
      dmCompania.tblCompania.Open;
      dmCompania.tblCompania.Locate('codigo',glbCia_Key,[]);
      dmfactura.qryFactReimpMaster.Close;
      dmfactura.qryFactReimpMaster.Params[0].Value:= dmfactura.qryFactReimpMaster.Params[0].Value;

      dmfactura.qryFactReimpDet.Close;
      dmfactura.qryFactReimpDet.Params[0].Value:=dmfactura.qryFactReimpMaster.Params[0].Value;
      dmfactura.qryFactReimpDet.Open;
      dmfactura.qryFactReimpDet.Last;
      //tRecordsDet := dmfactura.qryFactReimpDet.RecordCount;
      dmfactura.qryFactReimpDet.Close;

      dmfactura.qryFactReimpMaster.Open;

    dmclientes.tblClientes.Close;
    dmclientes.tblClientes.Open;
    if dmclientes.tblClientes.Locate('CODIGO_CTE', dmfactura.qryFactReimpMasterCODIGO_CTE.Value,[]) then
    glbcodVendedor:=dmclientes.tblClientesCOD_VENDEDOR.Value
    else
    glbcodVendedor:= VarUsuarioGlb;
    frmProcVentaRapida.LlenarrxSolDatoscte(dmFactura.qryVentaFacturaCODIGO_CTE.Value);
    if dmfactura.qryFactReimpMaster.Recordcount > 0 then
    Begin
      if (GlbFact55Pulg = 1) then  
      begin
        if (UpperCase(GLBFormatoFactura) = 'CASANDRA2') then  //PENDIENTE DE ANALISIS
        begin
          qckRepRecibo8_5_11REspReimp :=TqckRepRecibo8_5_11REspReimp.Create(nil);
          try
            qckRepRecibo8_5_11REspReimp.Prepare;
            glbTPag := qckRepRecibo8_5_11REspReimp.PageNumber;

            qckRepRecibo8_5_11REspReimp.xtipoVenta:= TipoVenta;
            qckRepRecibo8_5_11REspReimp.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;
            qckRepRecibo8_5_11REspReimp.qrtipoVenta.Caption:= '';

            //qckRepRecibo8_5_11REspReimp.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;
            dmDatos.qryImpresoras.Close;
            dmDatos.qryImpresoras.Open;
            if dmDatos.qryImpresoras.Locate('IDMODULO;IDREPORTE',
            VarArrayOf([1,5]),[]) then     //Factura/Recibo 8.5 x 5.5
            qckRepRecibo8_5_11REspReimp.PrinterSettings.PrinterIndex:=
            GetImpresora(dmDatos.qryImpresorasNOMBRE_IMPRESORA.Value);

            if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
            begin
              qckRepRecibo8_5_11REspReimp.PrinterSetup;
              qckRepRecibo8_5_11REspReimp.Print;
            end else            
            qckRepRecibo8_5_11REspReimp.Preview;
          finally
          qckRepRecibo8_5_11REspReimp.free;
          qckRepRecibo8_5_11REspReimp:=Nil;
          end;
        end;
      end else
      if GlbFacturaLicoreria =1 then
      begin
        qckRepFacturaEstandarNewReimpREsp:=TqckRepFacturaEstandarNewReimpREsp.Create(Nil);
        try
          if GlbSizeFact8x11 = 1 then
          qckRepFacturaEstandarNewReimpREsp.Page.Length := 11;
          qckRepFacturaEstandarNewReimpREsp.xtipoVenta := TipoVenta;
          qckRepFacturaEstandarNewReimpREsp.Prepare;
          glbTPag := qckRepFacturaEstandarNewReimpREsp.PageNumber;

          if frmProcVentaRapida.ImprimirRecibo1.Checked then
          begin
            qckRepFacturaEstandarNewReimpREsp.PrinterSetup;
            qckRepFacturaEstandarNewReimpREsp.Print;
          end else
          qckRepFacturaEstandarNewReimpREsp.Preview;
        finally
        qckRepFacturaEstandarNewReimpREsp.Free;
        qckRepFacturaEstandarNewReimpREsp:=Nil;
        end;
      end else
      begin
        qckRepFacturaEstandarNewReimp:=TqckRepFacturaEstandarNewReimp.Create(Nil);
        try
          if GlbSizeFact8x11 = 1 then
             qckRepFacturaEstandarNewReimp.Page.Length := 11;

          qckRepFacturaEstandarNewReimp.Prepare;
          glbTPag := qckRepFacturaEstandarNewReimp.PageNumber;

          if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
          begin
            qckRepFacturaEstandarNewReimp.PrinterSetup;
            qckRepFacturaEstandarNewReimp.Print;
          end else
          qckRepFacturaEstandarNewReimp.Preview;
        finally
        qckRepFacturaEstandarNewReimp.Free;
        qckRepFacturaEstandarNewReimp:=Nil;
        end;
      end;
    end
    else
    begin
      qckRepFactPuntoVenta:=TqckRepFactPuntoVenta.Create(Nil);
      try
        //qckRepFactPuntoVenta.QRLabel14.Enabled:=False;
            dmFactura.qryVentaFacturaDet.Last;
            if dmFactura.qryVentaFacturaDet.RecordCount = 1 then
            qckRepFactPuntoVenta.Page.Length:= 5
            else
            if dmFactura.qryVentaFacturaDet.RecordCount >= 2 then
            qckRepFactPuntoVenta.Page.Length:= qckRepFactPuntoVenta.Page.Length +
            (dmFactura.qryVentaFacturaDet.RecordCount - 1 ) * 0.25;

            flag:=true;
            qckRepFactPuntoVenta.Prepare;
            frmProcVentaRapida.rxventa.DisableControls;
            frmProcVentaRapida.rxdbgrid1.Enabled:=False;
            if (dmFactura.qryVentaFacturaDet.RecordCount > 1) or (qckRepFactPuntoVenta.PageNumber > 1) then
            begin
              repeat
              begin
                if (qckRepFactPuntoVenta.PageNumber > 1) then
                begin
                  qckRepFactPuntoVenta.Page.Length:=qckRepFactPuntoVenta.Page.Length + 0.25;
                  qckRepFactPuntoVenta.Prepare;
                  flag:=False;
                end else break;
              end;
              until flag = true;
            end;
            frmProcVentaRapida.rxventa.EnableControls;
            frmProcVentaRapida.rxdbgrid1.Enabled:=True;
        if frmProcVentaRapida.ImprimirRecibo1.Checked then
           qckRepFactPuntoVenta.Print else
           qckRepFactPuntoVenta.Preview;
      finally
      qckRepFactPuntoVenta.Free;
      qckRepFactPuntoVenta:=Nil;
      end;
    end;
   end;
end;



procedure ImprimeFacturaEXDMAR(num: integer;
  tventa: string;valorNCF:string;xdir:string);
begin
  if num > 0 then
  begin
    dmreportes.qryViewVentasMast.Close;
    dmreportes.qryViewVentasMast.Params[0].Value:= num;
    dmreportes.qryViewVentasMast.Open;
  end;
  qckFactServ8_5EXDMar:=TqckFactServ8_5EXDMar.Create(Nil);
  try
    //qckFactServ8_5EXDMar.TPag.Caption:=
    IntToStr(qckFactServ8_5EXDMar.PageNumber);
    qckFactServ8_5EXDMar.xtipoVenta := tventa;
    qckFactServ8_5EXDMar.valorNCF:= valorNCF;
    if dmReportes.qryViewVentasMastMONTO_EXONERADO_ITBIS.Value > 0 then
    begin
      //qckFactServ8_5Ayaco.QRLabel25.left:=505;
      qckFactServ8_5EXDMar.QRLabel25.Caption :='ITBIS Exonerado';
    end  else
    qckFactServ8_5EXDMar.QRLabel25.Caption :='ITBIS';

    if (GlbImpReciboSinPreg = 1) then
       qckFactServ8_5EXDMar.Print
    else
    if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
    begin
      qckFactServ8_5EXDMar.PrinterSetup;
      qckFactServ8_5EXDMar.Print;
    end else
    qckFactServ8_5EXDMar.Preview;

    if (GlbImpReciboSinPreg = 0) then
    if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
    begin
      qckFactServ8_5EXDMar.Preview;
    end;
    if GlbImpPDF then
    begin
    try
      if not dmReportes.qryViewVentasMastNUMERO_FACTURA.IsNull then
      ReportExportPDF(qckFactServ8_5EXDMar,GlbRutaFacturas+'\'+xdir+IntToStr(dmReportes.qryViewVentasMastNUMERO_FACTURA.Value)+'.pdf')
      else
      ReportExportPDF(qckFactServ8_5EXDMar,GlbRutaFacturas+'\'+xdir+IntToStr(dmReportes.qryViewVentasMastNUMERO_DOC_PAGO.AsInteger)+'.pdf')
    except
    end;
  end;
  finally
    qckFactServ8_5EXDMar.Free;
    qckFactServ8_5EXDMar:=Nil;
    end;

end;

procedure ReimprimirFacturaNoFiscal(numTRN : Integer);
var
  tRecordsDet : integer;
  ImpPDF, flag : boolean;
    
  pulgadaInc : Real;
begin  
  ImpPDF := False;
  dmCompania.tblCompania.Close;
  dmCompania.tblCompania.Open;
  dmCompania.tblCompania.Locate('codigo', GlbCia_Key,[]);
  dmfactura.qryFactReimpMaster.Close;
  if (numTRN = 0) then
  begin
    dmfactura.qryFactReimpMaster.Params[0].Value:= StrToInt(InputBox('Re-Imprimir factura a crédito','Entre número',''));
    GlbEsCopia:=True;
  end else
  dmfactura.qryFactReimpMaster.Params[0].Value:= numTRN;
  TipoVenta := 'CREDITO';

  dmfactura.qryFactReimpDet.Close;
  dmfactura.qryFactReimpDet.Params[0].Value:=dmfactura.qryFactReimpMaster.Params[0].Value;
  dmfactura.qryFactReimpDet.Open;
  dmfactura.qryFactReimpDet.Last;
  tRecordsDet := dmfactura.qryFactReimpDet.RecordCount;
  dmfactura.qryFactReimpDet.Close;

  dmfactura.qryFactReimpMaster.Open;

  frmProcVentaRapida.AbrirDatosParaTicket(false,true,dmfactura.qryFactReimpMasterCODIGO_CTE.AsString,
  dmfactura.qryFactReimpMaster.Params[0].Value,
  dmfactura.qryFactReimpMasterFECHA.Value);

    GlbRutaLogoDoc:='';
    if GetFormatoTipoDoc(1,GlbRutaLogoDoc) then  //2	1	Factura Contado 8.5 Estandar
    GlbDocStandar:=1
    else
    GlbDocStandar:=0;

    frmProcVentaRapida.qryCtes.Close;
    frmProcVentaRapida.qryCtes.Open;
    if frmProcVentaRapida.qryCtes.Locate('CODIGO_CTE', dmfactura.qryFactReimpMasterCODIGO_CTE.Value,[]) then
    glbcodVendedor:=frmProcVentaRapida.qryCtesCOD_VENDEDOR.Value
    else
    glbcodVendedor:= VarUsuarioGlb;

    frmProcVentaRapida.LlenarrxSolDatoscte(dmFactura.qryVentaFacturaCODIGO_CTE.Value);
    dmFactura.qryDatosVtaARS.Close;
    dmFactura.qryDatosVtaARS.Params[0].Value := dmReportes.qryViewVentasMastNUMERO.Value;
    dmFactura.qryDatosVtaARS.Open;
    dmFactura.qryDatosVtaARS.First;
    if (GLBEsFastFood) And (GlbPorcPropina = 0) then //surtidora
    begin
              dmreportes.qryViewVentasMast.Close;
              dmreportes.qryViewVentasMast.Params[0].Value:= dmfactura.qryVentaFacturaNUMERO.Value;
              dmreportes.qryViewVentasMast.Open;
              ProcSetPathlogoTipoServicio(dmReportes.qryViewVentasMastTIPO_AFILIADO.Value);
               qckFactServ8_5Surtidora:=TqckFactServ8_5Surtidora.Create(Nil);
               try
                 qckFactServ8_5Surtidora.TPag.Caption:=
                 IntToStr(qckFactServ8_5Surtidora.PageNumber);
                 if GlbEsCopia then
                 qckFactServ8_5Surtidora.xtipoVenta := TipoVenta + ' (Copia)'
                 else
                 qckFactServ8_5Surtidora.xtipoVenta := TipoVenta;
                 qckFactServ8_5Surtidora.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;
                 if (GlbImpReciboSinPreg = 1) then
                   qckFactServ8_5Surtidora.Print
                   else
                   if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
                   begin
                     qckFactServ8_5Surtidora.PrinterSetup;
                     qckFactServ8_5Surtidora.Print;
                   end else
                   qckFactServ8_5Surtidora.Preview;
                   //t if GlbImpTicketVtaAgua = 1 then
                   //t ImprimirTicketVtaAgua(ipStpInsertVentMast.Params[0].Value);

                   if GlbImpPDF then
                   ReportExport(qckFactServ8_5Surtidora,GlbRutaFacturas+'\Factura'+dmFactura.qryVentaFacturaNUMERO_FACTURA.AsString+'.pdf');

                   if (GlbImpReciboSinPreg = 0) then
                   if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
                    begin
                      qckFactServ8_5Surtidora.Preview;
                    end;
                finally
                qckFactServ8_5Surtidora.Free;
                qckFactServ8_5Surtidora:=Nil;
                end;
                //t if GlbImpTicketVtaAgua = 1 then
                //t ImprimirTicketVtaAgua(ipStpInsertVentMast.Params[0].Value);
          end
          else
       if (GlbRec3Pulg = 1) and (GLBEsFastFood) then
      begin
      dmreportes.qryViewVentasMast.Close;
      dmreportes.qryViewVentasMast.Params[0].Value:= dmfactura.qryVentaFacturaNUMERO.Value;
      dmreportes.qryViewVentasMast.Open;
      ProcSetPathlogoTipoServicio(dmReportes.qryViewVentasMastTIPO_AFILIADO.Value);
      
      qckFactServ8_5Limao:=TqckFactServ8_5Limao.Create(Nil);
      try
        qckFactServ8_5Limao.TPag.Caption:=
        IntToStr(qckFactServ8_5Limao.PageNumber);
        if GlbEsCopia then
        qckFactServ8_5Limao.xtipoVenta := TipoVenta + ' (Copia)'
        else
        qckFactServ8_5Limao.xtipoVenta := TipoVenta;
        qckFactServ8_5Limao.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;
        if (GlbImpReciboSinPreg = 1) then
           qckFactServ8_5Limao.Print
        else
        if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
        begin
          qckFactServ8_5Limao.PrinterSetup;
          qckFactServ8_5Limao.Print;
        end else
        qckFactServ8_5Limao.Preview;

        if GlbImpPDF then
        ReportExportPDF(qckFactServ8_5Limao,GlbRutaFacturas+'\Factura'+dmFactura.qryVentaFacturaNUMERO_FACTURA.AsString+'.pdf');

        if (GlbImpReciboSinPreg = 0) then
        if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
        begin
          qckFactServ8_5Limao.Preview;
        end;
        finally
        qckFactServ8_5Limao.Free;
        qckFactServ8_5Limao:=Nil;
        end;
      end else
      if (GlbRec3Pulg = 1) and (GlbLimao = 1) then
      begin
        frmProcVentaRapida.RxDBGrid1.DataSource:= frmProcVentaRapida.datasource3;
        frmProcVentaRapida.dbtext1.DataField:='';
        frmProcVentaRapida.dbtext1.DataSource:= frmProcVentaRapida.datasource3;
        frmProcVentaRapida.dbedit1.DataField:='';
        frmProcVentaRapida.dbedit1.DataSource:= frmProcVentaRapida.datasource3;
        frmProcVentaRapida.dbedit2.DataField:='';
        frmProcVentaRapida.dbedit2.DataSource:= frmProcVentaRapida.datasource3;
        frmProcVentaRapida.dbedit3.DataField:='';
        frmProcVentaRapida.dbedit3.DataSource:= frmProcVentaRapida.datasource3;
        dmreportes.qryViewVentasMast.Close;
        dmreportes.qryViewVentasMast.Params[0].Value:= dmfactura.qryVentaFacturaNUMERO.Value;
        dmreportes.qryViewVentasMast.Open;
        ProcSetPathlogoTipoServicio(dmReportes.qryViewVentasMastTIPO_AFILIADO.Value);

        dmVentas.qryVentaVocados.Close;
        dmVentas.qryVentaVocados.Params[0].Value:=dmReportes.qryViewVentasMastNUMERO.Value;
        dmVentas.qryVentaVocados.Open;
        if dmVentas.qryVentaVocados.RecordCount > 0 then
        begin
          qckFacturaLimao01:=TqckFacturaLimao01.Create(Nil);
          try
            if (GlbImpReciboSinPreg = 1) then
            qckFacturaLimao01.Print
            else
            if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
            begin
              qckFacturaLimao01.PrinterSetup;
              qckFacturaLimao01.Print;
            end else
            qckFacturaLimao01.Preview;
            if GlbImpPDF then
            ReportExport(qckFacturaLimao01,GlbRutaFacturas+'\Factura'+dmFactura.qryVentaFacturaNUMERO_FACTURA.AsString+'.pdf');

            if (GlbImpReciboSinPreg = 0) then
            if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
            begin
              qckFacturaLimao01.Preview;
            end;
            finally
            qckFacturaLimao01.Free;
            qckFacturaLimao01:=Nil;
            end;
            end else
            BEGIN
              qckFactServ8_5Limao:=TqckFactServ8_5Limao.Create(Nil);
              try
                qckFactServ8_5Limao.TPag.Caption:=
                IntToStr(qckFactServ8_5Limao.PageNumber);
                if GlbEsCopia then
                qckFactServ8_5Limao.xtipoVenta := TipoVenta + ' (Copia)'
                else
                qckFactServ8_5Limao.xtipoVenta := TipoVenta;
                qckFactServ8_5Limao.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;
                if (GlbImpReciboSinPreg = 1) then
                   qckFactServ8_5Limao.Print
                else
                if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
                begin
                  qckFactServ8_5Limao.PrinterSetup;
                  qckFactServ8_5Limao.Print;
                end else
                qckFactServ8_5Limao.Preview;

                if GlbImpPDF then
                ReportExportPDF(qckFactServ8_5Limao,GlbRutaFacturas+'\Factura'+dmFactura.qryVentaFacturaNUMERO_FACTURA.AsString+'.pdf');

                if (GlbImpReciboSinPreg = 0) then
                if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
                begin
                  qckFactServ8_5Limao.Preview;
                end;
              finally
              qckFactServ8_5Limao.Free;
              qckFactServ8_5Limao:=Nil;
              end;
            END;
          end else
    if (GlbFarmacia = 1) and (GlbFact55Pulg = 1) then
    begin
       TipoVenta:='CONTADO';
       if dmReportes.qryViewVentasMastFORMA_PAGO.AsInteger in [7,8] then
       TipoVenta := 'CREDITO'
       else
       if dmReportes.qryViewVentasMastForma_pago.value = 1 then
       TipoVenta := 'CONTADO';
       ImprimeFactura8_5Farmacia(dmReportes.qryViewVentasMastNUMERO.Value,TipoVenta,'','Facturas');
    end else

    if (GlbFarmacia = 1 ) then
    begin
      if dmFactura.qryDatosVtaARS.RecordCount = 0 then
      begin
        dmreportes.qryViewVentasMast.Close;
        dmreportes.qryViewVentasMast.Params[0].Value:= dmfactura.qryVentaFacturaNUMERO.Value;
        dmreportes.qryViewVentasMast.Open;

        frmProcVentaRapida.LlenarrxSolDatoscte(dmFactura.qryVentaFacturaCODIGO_CTE.Value);
        TipoVenta:='CONTADO';
        if dmReportes.qryViewVentasMastForma_pago.AsInteger in [7,8] then
        TipoVenta := 'CREDITO'
        else
        if dmReportes.qryViewVentasMastForma_pago.value = 1 then
        TipoVenta := 'CONTADO';
  
        if (TipoVenta = 'CONTADO') then
        frmProcVentaRapida.AbrirDatosParaTicket(false,false,dmReportes.qryViewVentasMastCODIGO_CTE.AsString,dmReportes.qryViewVentasMastNUMERO_DOC_PAGO.AsInteger,
        dmReportes.qryViewVentasMastFECHA.Value)
        else
        if (TipoVenta = 'CREDITO') then
        frmProcVentaRapida.AbrirDatosParaTicket(false,true,dmReportes.qryViewVentasMastCODIGO_CTE.AsString,dmReportes.qryViewVentasMastNUMERO_FACTURA.AsInteger,
        dmReportes.qryViewVentasMastFECHA.Value);

        //qckRepReciboReimpTicketSurtidora:=TqckRepReciboReimpTicketSurtidora.Create(Nil);
        qckRepReciboReimpTicketSurtidoraNew:=TqckRepReciboReimpTicketSurtidoraNew.Create(Nil);
        try
        if GlbImpQREncuesta = 0 then
        begin
          if (GlbImpQREncuesta = 0) then
          qckRepReciboReimpTicketSurtidoraNew.Height:=761;

          //qckRepReciboReimpTicketSurtidoraNew.Page.Length:=6.156; //sin encuesta
          qckRepReciboReimpTicketSurtidoraNew.ChildBand14.Height:=0;
          //qckRepReciboReimpTicketSurtidoraNew.ChildBand13.HasChild:=False;
        end;
        qckRepReciboReimpTicketSurtidoraNew.SetParameterValues;
        if frmProcVentaRapida.rxspinImpCantCopias.Decimal > 0 then
        qckRepReciboReimpTicketSurtidoraNew.PrinterSettings.Copies:= StrToInt(frmProcVentaRapida.rxspinImpCantCopias.Text);
        if GlbEsCopia then
        qckRepReciboReimpTicketSurtidoraNew.strcopia :=' (COPIA)'
        else        
        qckRepReciboReimpTicketSurtidoraNew.strcopia :='';

        //qckRepReciboReimpTicketSurtidoraNew.ncfDesc := GlbDescNCF;
        if Length(frmProcVentaRapida.edtObservacion.Text) > 0 then
        qckRepReciboReimpTicketSurtidoraNew.nombreCteGenerico:=frmProcVentaRapida.edtObservacion.Text;
        if (dmReportes.qryViewVentasMastCodigo_cte.value > 0) then
        begin
          qckRepReciboReimpTicketSurtidoraNew.qrLabelRNC.Caption:='RNC-' + frmProcVentaRapida.qryClienteRNC_NUMERO.Value;
          qckRepReciboReimpTicketSurtidoraNew.nombreCteGenerico:= frmProcVentaRapida.qryClienteNOMBRE_CTE.Value;
        end
        else qckRepReciboReimpTicketSurtidoraNew.qrLabelRNC.Caption:='';
        qckRepReciboReimpTicketSurtidoraNew.xtipoVenta := TipoVenta;
        qckRepReciboReimpTicketSurtidoraNew.valorNCF   := dmFactura.qryVentaFacturaNUMERO_NCF.Value;
        //pulgadaInc:=0.86;
        dmFactura.qryVentaFacturaDet.Last;
        if (glbQckUnaPagina = 1) then
        begin
        if dmFactura.qryVentaFacturaDet.RecordCount = 1 then
        qckRepReciboReimpTicketSurtidoraNew.Page.Length:=4.258
        else
        if dmFactura.qryVentaFacturaDet.RecordCount >= 2 then
        qckRepReciboReimpTicketSurtidoraNew.Page.Length:= qckRepReciboReimpTicketSurtidoraNew.Page.Length +
        (dmFactura.qryVentaFacturaDet.RecordCount - 1 ) * 0.25;

        flag:=true;
        dmFactura.qryVentaFacturaDet.First;
        dmFactura.qryVentaFacturaDet.Last;
        if dmFactura.qryVentaFacturaDet.RecordCount > 25  then
        qckRepReciboReimpTicketSurtidoraNew.Page.Length:=23
        else
        if dmFactura.qryVentaFacturaDet.RecordCount > 29  then
        qckRepReciboReimpTicketSurtidoraNew.Page.Length:=18;

        qckRepReciboReimpTicketSurtidoraNew.Prepare;
        dmFactura.qryVentaFacturaDet.Last;
        if ((dmFactura.qryVentaFacturaDet.RecordCount >= 1) and
           ((dmFactura.qryVentaFacturaDet.RecordCount < 10)
            or (qckRepReciboReimpTicketSurtidoraNew.PageNumber = 2))) then
        begin
          frmProcVentaRapida.ProgressBar1.Visible :=True;
          frmProcVentaRapida.ProgressBar1.Position:=0;
          frmProcVentaRapida.ProgressBar1.Max:=dmFactura.qryVentaFacturaDet.RecordCount;
          if (GlbIncLargoPapel = 1) then
          begin
          repeat
          begin
            frmProcVentaRapida.ProgressBar1.StepIt;
            //cRc:=cRc + 1;
            if (qckRepReciboReimpTicketSurtidoraNew.PageNumber > 1) then
            begin
              qckRepReciboReimpTicketSurtidoraNew.Page.Length:=qckRepReciboReimpTicketSurtidoraNew.Page.Length + 0.26;
              qckRepReciboReimpTicketSurtidoraNew.Prepare;
              flag:=False;
            end else
            if (qckRepReciboReimpTicketSurtidoraNew.PageNumber = 1) then
                break;
            if (qckRepReciboReimpTicketSurtidoraNew.PageNumber = 1) then
                break;
            end;
            until flag = true;
            end;
          end;
    end;//if (glbQckUnaPagina = 1) then
        frmProcVentaRapida.ProgressBar1.Visible:=False;
        dmFactura.qryVentaFacturaDet.Last;
        if (dmFactura.qryVentaFacturaDet.RecordCount >15) and (GlbImpFormatoPDF = 1) then
        begin
          frmProcVentaRapida.ImprimirEnFormatoPDF(1,6);
        end else
        begin
          dmDatos.qryImpresoras.Close;
          dmDatos.qryImpresoras.Open;
          if dmDatos.qryImpresoras.Locate('IDMODULO;IDREPORTE',
          VarArrayOf([1,6]),[]) then     //Factura/Recibo Punto Venta
          qckRepReciboReimpTicketSurtidoraNew.PrinterSettings.PrinterIndex:=
          GetImpresora(dmDatos.qryImpresorasNOMBRE_IMPRESORA.Value);

          if (GlbImpReciboSinPreg = 1) and (GlbImprimeReciboFact = 1) then
          qckRepReciboReimpTicketSurtidoraNew.Print
          else
          if MessageDlg('Imprimir?',mtInformation, [mbYes, mbNo], 0)=mryes then
          begin
            if (GlbImprimeReciboFact = 1) then
            begin
              qckRepReciboReimpTicketSurtidoraNew.PrinterSetup;
              qckRepReciboReimpTicketSurtidoraNew.Print;
            end;
          end else
          qckRepReciboReimpTicketSurtidoraNew.Preview;
          reciboImpreso:=True;
        end;
      //t if GlbImpTicketVtaAgua = 1 then
      //t ImprimirTicketVtaAgua(ipStpInsertVentMast.Params[0].Value);
      finally
      qckRepReciboReimpTicketSurtidoraNew.Free;
      qckRepReciboReimpTicketSurtidoraNew:=Nil;
      end;
      end else
      begin
      dmFactura.qryDatosVtaARS.Close;
      dmFactura.qryDatosVtaARS.Params[0].Value := dmReportes.qryViewVentasMastNUMERO.Value;
      dmFactura.qryDatosVtaARS.Open;
      dmFactura.qryDatosVtaARS.First;
      TipoVenta:='CONTADO';
      if dmReportes.qryViewVentasMastForma_pago.AsInteger in [7,8] then
      TipoVenta := 'CREDITO'
      else
      if dmReportes.qryViewVentasMastForma_pago.value = 1 then
      TipoVenta := 'CONTADO';

      if (TipoVenta = 'CONTADO') then
      frmProcVentaRapida.AbrirDatosParaTicket(false,false,dmReportes.qryViewVentasMastCODIGO_CTE.AsString,
      dmReportes.qryViewVentasMastNUMERO_DOC_PAGO.AsInteger,
      dmReportes.qryViewVentasMastFECHA.Value)
      else
      if (TipoVenta = 'CREDITO') then
      frmProcVentaRapida.AbrirDatosParaTicket(false,true,dmReportes.qryViewVentasMastCODIGO_CTE.AsString,
      dmReportes.qryViewVentasMastNUMERO_FACTURA.AsInteger,
      dmReportes.qryViewVentasMastFECHA.Value);
      if (GlbFarmacia = 1) and (GlbFact55Pulg = 1)  then
      begin
        ImprimeFactura8_5Farmacia(dmfactura.qryVentaFacturaNUMERO.Value,TipoVenta,'','Facturas');
      end else
      begin
      qckRepReciboReimpTicketFarmaciaARS:=TqckRepReciboReimpTicketFarmaciaARS.Create(Nil);
      try
               dmDatos.qryImpresoras.Close;
               dmDatos.qryImpresoras.Open;
               if dmDatos.qryImpresoras.Locate('IDMODULO;IDREPORTE',
                  VarArrayOf([1,6]),[]) then     //Factura/Recibo Punto Venta
               qckRepReciboReimpTicketFarmaciaARS.PrinterSettings.PrinterIndex:=
               GetImpresora(dmDatos.qryImpresorasNOMBRE_IMPRESORA.Value);
                     
        if (dmFactura.qryDatosVtaARS.RecordCount = 0) then
        begin
          qckRepReciboReimpTicketFarmaciaARS.ChildBand10.Height:=0;
          qckRepReciboReimpTicketFarmaciaARS.ChildBand1.Height :=40;
          qckRepReciboReimpTicketFarmaciaARS.Page.Length:=
          qckRepReciboReimpTicketFarmaciaARS.Page.Length - 5;
        end else
        begin
          qckRepReciboReimpTicketFarmaciaARS.ChildBand1.Height:=95;
        end;

        if dmFactura.qryVtaConDeliveryTrn.RecordCount = 0 then
        begin
          qckRepReciboReimpTicketFarmaciaARS.ChildBand13.Height:=0;
          qckRepReciboReimpTicketFarmaciaARS.Page.Length:=
          qckRepReciboReimpTicketFarmaciaARS.Page.Length - 3.45;
        end;
        if GlbEsCopia then
        qckRepReciboReimpTicketFarmaciaARS.strcopia :=' (COPIA)'
        else
        qckRepReciboReimpTicketFarmaciaARS.strcopia :='';

        qckRepReciboReimpTicketFarmaciaARS.ncfDesc := GlbDescNCF;
        if Length(frmProcVentaRapida.edtObservacion.Text) > 0 then
        qckRepReciboReimpTicketFarmaciaARS.nombreCteGenerico:=frmProcVentaRapida.edtObservacion.Text;
        if (dmReportes.qryViewVentasMastCodigo_cte.value > 0) then
        begin
          qckRepReciboReimpTicketFarmaciaARS.qrLabelRNC.Caption:='RNC-' + frmProcVentaRapida.qryClienteRNC_NUMERO.Value;
          qckRepReciboReimpTicketFarmaciaARS.nombreCteGenerico:= frmProcVentaRapida.qryClienteNOMBRE_CTE.Value;
        end
        else
        qckRepReciboReimpTicketFarmaciaARS.qrLabelRNC.Caption:='';
        qckRepReciboReimpTicketFarmaciaARS.xtipoVenta := TipoVenta;
        //qckRepReciboReimpTicketFarmaciaARS.valorNCF   := valorNCF;
        //pulgadaInc:=0.86;
        if (glbQckUnaPagina = 1) then
        begin
          if dmFactura.qryVentaFacturaDet.RecordCount = 1 then
          qckRepReciboReimpTicketFarmaciaARS.Page.Length:=5.258
          else
          if dmFactura.qryVentaFacturaDet.RecordCount >= 2 then
          qckRepReciboReimpTicketFarmaciaARS.Page.Length:= qckRepReciboReimpTicketFarmaciaARS.Page.Length +
          (dmFactura.qryVentaFacturaDet.RecordCount - 1 ) * 0.25;

          flag:=true;
          qckRepReciboReimpTicketFarmaciaARS.Prepare;
          dmFactura.qryVentaFacturaDet.Last;
          if ((dmFactura.qryVentaFacturaDet.RecordCount >= 1) and
             ((dmFactura.qryVentaFacturaDet.RecordCount < 10)
              or (qckRepReciboReimpTicketFarmaciaARS.PageNumber = 2))) then
          begin
            frmProcVentaRapida.ProgressBar1.Visible:=true;
            frmProcVentaRapida.ProgressBar1.Position:=0;
            frmProcVentaRapida.ProgressBar1.Max:=dmFactura.qryVentaFacturaDet.RecordCount;
            repeat
            begin
              frmProcVentaRapida.ProgressBar1.StepIt;
              //cRc:=cRc + 1;
              if (qckRepReciboReimpTicketFarmaciaARS.PageNumber > 1) then
              begin
                qckRepReciboReimpTicketFarmaciaARS.Page.Length:=qckRepReciboReimpTicketFarmaciaARS.Page.Length + 0.26;

                qckRepReciboReimpTicketFarmaciaARS.Prepare;
                flag:=False;
              end else
              if (qckRepReciboReimpTicketFarmaciaARS.PageNumber = 1) then
              break;
              if (qckRepReciboReimpTicketFarmaciaARS.PageNumber = 1) then
              break;
              end;
              until flag = true;
            end;
        end;
        frmProcVentaRapida.ProgressBar1.Visible:=False;
        dmFactura.qryVentaFacturaDet.First;
        if (GlbImpReciboSinPreg = 1) and (GlbImprimeReciboFact = 1) then
        qckRepReciboReimpTicketFarmaciaARS.Print
        else
        if MessageDlg('Imprimir?',mtInformation, [mbYes, mbNo], 0)=mryes then
        begin
          if (GlbImprimeReciboFact = 1) then
          begin
              qckRepReciboReimpTicketFarmaciaARS.PrinterSetup;
              qckRepReciboReimpTicketFarmaciaARS.Print;
            //end;
          end;
        end else
        qckRepReciboReimpTicketFarmaciaARS.Preview;
        reciboImpreso:=True;
      finally
      qckRepReciboReimpTicketFarmaciaARS.Free;
      qckRepReciboReimpTicketFarmaciaARS:=Nil;
      end;
      end;
      end;
    end else
    if (UpperCase(GLBFormatoFactura) = 'FORMAFACOCO') and (GLBNumConduceCte = 1)then
    begin
      TipoVenta:='CONTADO';
      if dmfactura.qryVentaFacturaFORMA_PAGO.AsInteger in [7,8] then
      TipoVenta := 'CREDITO'
      else
      if dmfactura.qryVentaFacturaFORMA_PAGO.value = 1 then
      TipoVenta := 'CONTADO';
      dmreportes.qryViewVentasMast.Close;
      dmreportes.qryViewVentasMast.Params[0].Value:= dmfactura.qryVentaFacturaNUMERO.Value;
      dmreportes.qryViewVentasMast.Open;
      ProcSetPathlogoTipoServicio(dmReportes.qryViewVentasMastTIPO_AFILIADO.Value);

      if GlbFormatoConduce = 444 then
      begin
       qckFactServ8_5Agua:=TqckFactServ8_5Agua.Create(Nil);
       try
        if GlbEsCopia then
        qckFactServ8_5Agua.xtipoVenta := TipoVenta +' (Copia)'
        else qckFactServ8_5Agua.xtipoVenta := TipoVenta;
       qckFactServ8_5Agua.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;
       if (GlbImpReciboSinPreg = 1) then
       qckFactServ8_5Agua.Print
       else
       begin
         frmProcVentaRapida.ProgressBar1.Visible:= False;
         frmImprimir:=TfrmImprimir.Create(nil);
         try
           if frmImprimir.Showmodal = mrOk then
           begin
             if frmImprimir.RadioGroup1.ItemIndex = 0 then
             qckFactServ8_5Agua.Page.PaperSize := Letter;
             if frmImprimir.RadioButton1.Checked then
             begin
               qckFactServ8_5Agua.PrinterSetup;
               qckFactServ8_5Agua.Print;
             end else
             qckFactServ8_5Agua.Preview;
           end;
         finally
         frmImprimir.Free;
         frmImprimir:=Nil;
         end;
       end;

       if (GlbImpReciboSinPreg = 0) then
       if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
       begin
         qckFactServ8_5Agua.Preview;
       end;
       if GlbImpPDF then
       begin
       if not dmFactura.qryVentaFacturaNUMERO_FACTURA.IsNull then
        ReportExportPDF(qckFactServ8_5Agua,GlbRutaFacturas+'\Facturas'+IntToStr(dmFactura.qryVentaFacturaNUMERO_FACTURA.Value)+'.pdf')
       else
       if not dmFactura.qryVentaFacturaNUMERO_DOC_PAGO.IsNull then
          ReportExportPDF(qckFactServ8_5Agua,GlbRutaFacturas+'\Facturas'+IntToStr(dmFactura.qryVentaFacturaNUMERO_DOC_PAGO.AsInteger)+'.pdf')
       end;
     finally
     qckFactServ8_5Agua.Free;
     qckFactServ8_5Agua:=Nil;
     end;
   end;
  end else
      if (GLBMutur = 1) then
      begin
        dmreportes.qryViewVentasMast.Close;
        dmreportes.qryViewVentasMast.Params[0].Value:= dmfactura.qryVentaFacturaNUMERO.Value;
        dmreportes.qryViewVentasMast.Open;
        qckFactServ_8_5SAMNewMuturs:=TqckFactServ_8_5SAMNewMuturs.Create(Nil);
          try
            qckFactServ_8_5SAMNewMuturs.rxVendedor.Close;
            qckFactServ_8_5SAMNewMuturs.rxVendedor.Open;
            if dmreportes.qryCantVendedoresSamCANTVENDEDORES.Value = 1 then
            begin
              if frmProcVentaRapida.qryEmpleado.Locate('codigo', dmreportes.qryViewVentasDetCodigo_Vendedor.Value,[]) then
              begin
                qckFactServ_8_5SAMNewMuturs.rxVendedor.Append;
                qckFactServ_8_5SAMNewMuturs.rxVendedorNombreVendedor.Value:=
                frmProcVentaRapida.qryEmpleadoNOMBREVENDEDOR.Value;
                qckFactServ_8_5SAMNewMuturs.rxVendedor.Post;
              end;
            end else
            begin
              qckFactServ_8_5SAMNewMuturs.rxVendedor.Close;
              qckFactServ_8_5SAMNewMuturs.rxVendedor.Open;
              qckFactServ_8_5SAMNewMuturs.rxVendedor.Append;
              qckFactServ_8_5SAMNewMuturs.rxVendedorNombreVendedor.Value:='';
              qckFactServ_8_5SAMNewMuturs.rxVendedor.Post;
              end;
              qckFactServ_8_5SAMNewMuturs.TPag.Caption:=
              IntToStr(qckFactServ_8_5SAMNewMuturs.PageNumber);
              qckFactServ_8_5SAMNewMuturs.xtipoVenta := TipoVenta;
              //qckFactServ_8_5SAMNewMuturs.valorNCF:= valorNCF;
              if dmReportes.qryViewVentasMastMONTO_EXONERADO_ITBIS.Value > 0 then
              begin
                qckFactServ_8_5SAMNewMuturs.QRLabel25.Caption :='ITBIS Exonerado';
              end  else
              qckFactServ_8_5SAMNewMuturs.QRLabel25.Caption :='ITBIS';

              if (GlbImpReciboSinPreg = 1) then
              qckFactServ_8_5SAMNewMuturs.Print
              else
              if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
              begin
                //qckFactServ_8_5SAMNewMuturs.QRImage2.Enabled:= False;
                qckFactServ_8_5SAMNewMuturs.PrinterSetup;
                qckFactServ_8_5SAMNewMuturs.Print;
              end else
              qckFactServ_8_5SAMNewMuturs.Preview;

              if (GlbImpReciboSinPreg = 0) then
              if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
              begin
                qckFactServ_8_5SAMNewMuturs.Preview;
              end;
             if GlbImpPDF then
             begin
               if not dmReportes.qryViewVentasMastNUMERO_FACTURA.IsNull then
               ReportExportPDF(qckFactServ_8_5SAMNewMuturs,GlbRutaRecibos+'\Recibos'+IntToStr(dmReportes.qryViewVentasMastNUMERO_FACTURA.Value)+'.pdf')
               else
               ReportExportPDF(qckFactServ_8_5SAMNewMuturs,GlbRutaRecibos+'\Recibos'+IntToStr(dmReportes.qryViewVentasMastNUMERO_DOC_PAGO.AsInteger)+'.pdf')
             end;
          finally
          qckFactServ_8_5SAMNewMuturs.Free;
          qckFactServ_8_5SAMNewMuturs:=Nil;
          end;
      end else
      if (GlBSAM = 1) then
      begin
        dmreportes.qryViewVentasMast.Close;
        dmreportes.qryViewVentasMast.Params[0].Value:= dmfactura.qryVentaFacturaNUMERO.Value;
        dmreportes.qryViewVentasMast.Open;
        ProcSetPathlogoTipoServicio(dmReportes.qryViewVentasMastTIPO_AFILIADO.Value);
        if (GlbUsaFctMexico = 1) then
        begin
          qckFactServ_8_5SAMNewM:=TqckFactServ_8_5SAMNewM.Create(Nil);
          try
            qckFactServ_8_5SAMNewM.rxVendedor.Close;
            qckFactServ_8_5SAMNewM.rxVendedor.Open;
            if dmreportes.qryCantVendedoresSamCANTVENDEDORES.Value = 1 then
            begin
              if frmProcVentaRapida.qryEmpleado.Locate('codigo', dmreportes.qryViewVentasDetCodigo_Vendedor.Value,[]) then
              begin
                qckFactServ_8_5SAMNewM.rxVendedor.Append;
                qckFactServ_8_5SAMNewM.rxVendedorNombreVendedor.Value:=
                frmProcVentaRapida.qryEmpleadoNOMBREVENDEDOR.Value;
                qckFactServ_8_5SAMNewM.rxVendedor.Post;
              end;
            end else
            begin
              qckFactServ_8_5SAMNewM.rxVendedor.Close;
              qckFactServ_8_5SAMNewM.rxVendedor.Open;
              qckFactServ_8_5SAMNewM.rxVendedor.Append;
              qckFactServ_8_5SAMNewM.rxVendedorNombreVendedor.Value:='';
              qckFactServ_8_5SAMNewM.rxVendedor.Post;
              end;
              qckFactServ_8_5SAMNewM.TPag.Caption:=
              IntToStr(qckFactServ_8_5SAMNewM.PageNumber);
              qckFactServ_8_5SAMNewM.xtipoVenta := TipoVenta;
              //qckFactServ_8_5SAMNewM.valorNCF:= valorNCF;
              if dmReportes.qryViewVentasMastMONTO_EXONERADO_ITBIS.Value > 0 then
              begin
                qckFactServ_8_5SAMNewM.QRLabel25.Caption :='ITBIS Exonerado';
              end  else
              qckFactServ_8_5SAMNewM.QRLabel25.Caption :='ITBIS';

              if (GlbImpReciboSinPreg = 1) then
              qckFactServ_8_5SAMNewM.Print
              else
              if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
              begin
                //qckFactServ_8_5SAMNewM.QRImage2.Enabled:= False;
                qckFactServ_8_5SAMNewM.PrinterSetup;
                qckFactServ_8_5SAMNewM.Print;
              end else
              qckFactServ_8_5SAMNewM.Preview;

              if (GlbImpReciboSinPreg = 0) then
              if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
              begin
                qckFactServ_8_5SAMNewM.Preview;
              end;
             if GlbImpPDF then
             begin
               if not dmReportes.qryViewVentasMastNUMERO_FACTURA.IsNull then
               ReportExportPDF(qckFactServ_8_5SAMNewM,GlbRutaRecibos+'\Recibos'+IntToStr(dmReportes.qryViewVentasMastNUMERO_FACTURA.Value)+'.pdf')
               else
               ReportExportPDF(qckFactServ_8_5SAMNewM,GlbRutaRecibos+'\Recibos'+IntToStr(dmReportes.qryViewVentasMastNUMERO_DOC_PAGO.AsInteger)+'.pdf')
             end;
          finally
          qckFactServ_8_5SAMNewM.Free;
          qckFactServ_8_5SAMNewM:=Nil;
          end;
        end else
        if (GLBFORMATOFACTPREIMP = 0) then
        begin
        qckFactServ_8_5SAM:=TqckFactServ_8_5SAM.Create(Nil);
        try
          qckFactServ_8_5SAM.rxVendedor.Close;
          qckFactServ_8_5SAM.rxVendedor.Open;
          if dmreportes.qryCantVendedoresSamCANTVENDEDORES.Value = 1 then
          begin
            if frmProcVentaRapida.qryEmpleado.Locate('codigo', dmreportes.qryViewVentasDetCodigo_Vendedor.Value,[]) then
            begin
              qckFactServ_8_5SAM.rxVendedor.Append;
              qckFactServ_8_5SAM.rxVendedorNombreVendedor.Value:=
              frmProcVentaRapida.qryEmpleadoNOMBREVENDEDOR.Value;
              qckFactServ_8_5SAM.rxVendedor.Post;
            end;
          end else
          begin
            //rxVendedorNombreVendedor
            qckFactServ_8_5SAM.rxVendedor.Close;
            qckFactServ_8_5SAM.rxVendedor.Open;
            qckFactServ_8_5SAM.rxVendedor.Append;
            qckFactServ_8_5SAM.rxVendedorNombreVendedor.Value:='';
            qckFactServ_8_5SAM.rxVendedor.Post;
          end;
          if dmReportes.qryViewVentasMastMONTO_EXONERADO_ITBIS.Value > 0 then
          begin
            //qckFactServ8_5Ayaco.QRLabel25.left:=505;
            qckFactServ_8_5SAM.QRLabel25.Caption :='ITBIS Exonerado';
          end  else
          qckFactServ_8_5SAM.QRLabel25.Caption :='ITBIS';
        //qckFactServ8_5SAM.TPag.Caption:=
        //IntToStr(qckFactServ8_5SAM.PageNumber);
        if GlbEsCopia then
        qckFactServ_8_5SAM.xtipoVenta := TipoVenta +' (Copia)'
        else qckFactServ_8_5SAM.xtipoVenta := TipoVenta;
        qckFactServ_8_5SAM.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;
        if (GlbImpReciboSinPreg = 1) then
           qckFactServ_8_5SAM.Print
        else
        if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
        begin
          qckFactServ_8_5SAM.QRImage2.Enabled:= False;
          qckFactServ_8_5SAM.PrinterSetup;
          qckFactServ_8_5SAM.Print;
        end else
        qckFactServ_8_5SAM.Preview;

        if (GlbImpReciboSinPreg = 0) then
        if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
        begin
          qckFactServ_8_5SAM.Preview;
        end;
        if GlbImpPDF then
        begin
        if not dmFactura.qryVentaFacturaNUMERO_FACTURA.IsNull then
        ReportExportPDF(qckFactServ_8_5SAM,GlbRutaFacturas+'\Facturas'+IntToStr(dmFactura.qryVentaFacturaNUMERO_FACTURA.Value)+'.pdf')
        else
        if not dmFactura.qryVentaFacturaNUMERO_DOC_PAGO.IsNull then
        ReportExportPDF(qckFactServ_8_5SAM,GlbRutaFacturas+'\Facturas'+IntToStr(dmFactura.qryVentaFacturaNUMERO_DOC_PAGO.AsInteger)+'.pdf')
        end;
        finally
        qckFactServ_8_5SAM.Free;
        qckFactServ_8_5SAM:=Nil;
        end;
        end else
        begin
          //formatosamenew
        qckFactServ_8_5SAMNew:=TqckFactServ_8_5SAMNew.Create(Nil);
        try
          qckFactServ_8_5SAMnew.rxVendedor.Close;
          qckFactServ_8_5SAMNew.rxVendedor.Open;
          if dmreportes.qryCantVendedoresSamCANTVENDEDORES.Value = 1 then
          begin
            if frmProcVentaRapida.qryEmpleado.Locate('codigo', dmreportes.qryViewVentasDetCodigo_Vendedor.Value,[]) then
            begin
              qckFactServ_8_5SAMnew.rxVendedor.Append;
              qckFactServ_8_5SAMNew.rxVendedorNombreVendedor.Value:=
              frmProcVentaRapida.qryEmpleadoNOMBREVENDEDOR.Value;
              qckFactServ_8_5SAMNew.rxVendedor.Post;
            end;
          end else
          begin
            //rxVendedorNombreVendedor
            qckFactServ_8_5SAMNew.rxVendedor.Close;
            qckFactServ_8_5SAMNew.rxVendedor.Open;
            qckFactServ_8_5SAMNew.rxVendedor.Append;
            qckFactServ_8_5SAMNew.rxVendedorNombreVendedor.Value:='';
            qckFactServ_8_5SAMNew.rxVendedor.Post;
          end;
          if dmReportes.qryViewVentasMastMONTO_EXONERADO_ITBIS.Value > 0 then
          begin
            //qckFactServ8_5Ayaco.QRLabel25.left:=505;
            qckFactServ_8_5SAMNew.QRLabel25.Caption :='ITBIS Exonerado';
          end  else
          qckFactServ_8_5SAMNew.QRLabel25.Caption :='ITBIS';
        //qckFactServ8_5SAM.TPag.Caption:=
        //IntToStr(qckFactServ8_5SAM.PageNumber);
        if GlbEsCopia then
        qckFactServ_8_5SAMNew.xtipoVenta := TipoVenta +' (Copia)'
        else qckFactServ_8_5SAMNew.xtipoVenta := TipoVenta;
        qckFactServ_8_5SAMNew.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;
        if (GlbImpReciboSinPreg = 1) then
           qckFactServ_8_5SAMNew.Print
        else
        if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
        begin
          qckFactServ_8_5SAMNew.QRImage2.Enabled:= False;
          qckFactServ_8_5SAMNew.PrinterSetup;
          qckFactServ_8_5SAMNew.Print;
        end else
        qckFactServ_8_5SAMNew.Preview;

        if (GlbImpReciboSinPreg = 0) then
        if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
        begin
          qckFactServ_8_5SAMNew.Preview;
        end;
        if GlbImpPDF then
        begin
        if not dmFactura.qryVentaFacturaNUMERO_FACTURA.IsNull then
        ReportExportPDF(qckFactServ_8_5SAMNew,GlbRutaFacturas+'\Facturas'+IntToStr(dmFactura.qryVentaFacturaNUMERO_FACTURA.Value)+'.pdf')
        else
        if not dmFactura.qryVentaFacturaNUMERO_DOC_PAGO.IsNull then
        ReportExportPDF(qckFactServ_8_5SAMNew,GlbRutaFacturas+'\Facturas'+IntToStr(dmFactura.qryVentaFacturaNUMERO_DOC_PAGO.AsInteger)+'.pdf')
        end;
        finally
        qckFactServ_8_5SAMNew.Free;
        qckFactServ_8_5SAMNew:=Nil;
        end;
        end;
      end else
    if (GlBAyaco= 1) or (GlbSizeFact8x11 = 1) or (GlBTapiceria = 1) or (GlBInveraf =1) then
    begin
      dmreportes.qryViewVentasMast.Close;
      dmreportes.qryViewVentasMast.Params[0].Value:= dmfactura.qryVentaFacturaNUMERO.Value;
      dmreportes.qryViewVentasMast.Open;
      ProcSetPathlogoTipoServicio(dmReportes.qryViewVentasMastTIPO_AFILIADO.Value);
      qckFactServ8_5Ayaco:=TqckFactServ8_5Ayaco.Create(Nil);
      try
          if dmReportes.qryViewVentasMastMONTO_EXONERADO_ITBIS.Value > 0 then
          begin
            //qckFactServ8_5Ayaco.QRLabel25.left:=505;
            qckFactServ8_5Ayaco.QRLabel25.Caption :='ITBIS Exonerado';
          end  else
          qckFactServ8_5Ayaco.QRLabel25.Caption :='ITBIS';
        qckFactServ8_5Ayaco.TPag.Caption:=
        IntToStr(qckFactServ8_5Ayaco.PageNumber);
        if GlbEsCopia then
        qckFactServ8_5Ayaco.xtipoVenta := TipoVenta +' (Copia)'
        else qckFactServ8_5Ayaco.xtipoVenta := TipoVenta;
        qckFactServ8_5Ayaco.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;
        if (GlbImpReciboSinPreg = 1) then
           qckFactServ8_5Ayaco.Print
        else
        if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
        begin
          qckFactServ8_5Ayaco.PrinterSetup;
          qckFactServ8_5Ayaco.Print;
        end else
        qckFactServ8_5Ayaco.Preview;

        if (GlbImpReciboSinPreg = 0) then
        if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
        begin
          qckFactServ8_5Ayaco.Preview;
        end;
        if GlbImpPDF then
        begin
        if not dmFactura.qryVentaFacturaNUMERO_FACTURA.IsNull then
        ReportExportPDF(qckFactServ8_5Ayaco,GlbRutaFacturas+'\Facturas'+IntToStr(dmFactura.qryVentaFacturaNUMERO_FACTURA.Value)+'.pdf')
        else
        if not dmFactura.qryVentaFacturaNUMERO_DOC_PAGO.IsNull then
        ReportExportPDF(qckFactServ8_5Ayaco,GlbRutaFacturas+'\Facturas'+IntToStr(dmFactura.qryVentaFacturaNUMERO_DOC_PAGO.AsInteger)+'.pdf')
        end;
        finally
        qckFactServ8_5Ayaco.Free;
        qckFactServ8_5Ayaco:=Nil;
        end;

      end else
    if (GlBBurgos = 1) then
    begin
      dmDatos.qryMembrete.Close;
      dmDatos.qryMembrete.Params[0].Value:= glbCia_Key;
      dmDatos.qryMembrete.Open;

      dmreportes.qryViewVentasMast.Close;
      dmreportes.qryViewVentasMast.Params[0].Value:= dmfactura.qryVentaFacturaNUMERO.Value;
      dmreportes.qryViewVentasMast.Open;
      ProcSetPathlogoTipoServicio(dmReportes.qryViewVentasMastTIPO_AFILIADO.Value);
      qckFactServ8_5BB:=TqckFactServ8_5BB.Create(Nil);
      try
        //qckFactServ8_5BB.TPag.Caption:=
        //IntToStr(qckFactServ8_5BB.PageNumber);
        if GlbEsCopia then
        qckFactServ8_5BB.xtipoVenta := TipoVenta + ' (Copia)'
        else
        qckFactServ8_5BB.xtipoVenta := TipoVenta;
        qckFactServ8_5BB.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;
        if (GlbImpReciboSinPreg = 1) then
           qckFactServ8_5BB.Print
        else
        if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
        begin
          qckFactServ8_5BB.PrinterSetup;
          qckFactServ8_5BB.Print;
        end else
        qckFactServ8_5BB.Preview;

        if (GlbImpReciboSinPreg = 0) then
        if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
        begin
          qckFactServ8_5BB.Preview;
        end;
        finally
        qckFactServ8_5BB.Free;
        qckFactServ8_5BB:=Nil;
        end;
      end else
if (GLBECOM = 1) then   //Elias comunicaciones Santiago
      begin
        if (GlbFormatoConduce = 333) then //ECom
        begin
          qckRepConduceECom:=TqckRepConduceECom.Create(Nil);
          try
            qckRepConduceECom.Preview;
          finally
          qckRepConduceECom.free;
          qckRepConduceECom:=nil;
          end;
        end;
        QckFactServ_8_5ECom:=TQckFactServ_8_5ECom.Create(Nil);
        try
          QckFactServ_8_5ECom.rxVendedor.Close;
          QckFactServ_8_5ECom.rxVendedor.Open;
          if dmreportes.qryCantVendedoresSamCANTVENDEDORES.Value = 1 then
          begin
            if frmProcVentaRapida.qryEmpleado.Locate('codigo', dmreportes.qryViewVentasDetCodigo_Vendedor.Value,[]) then
            begin
              QckFactServ_8_5ECom.rxVendedor.Append;
              QckFactServ_8_5ECom.rxVendedorNombreVendedor.Value:=
              frmProcVentaRapida.qryEmpleadoNOMBREVENDEDOR.Value;
              QckFactServ_8_5ECom.rxVendedor.Post;
            end;
          end else
          begin
            QckFactServ_8_5ECom.rxVendedor.Close;
            QckFactServ_8_5ECom.rxVendedor.Open;
            QckFactServ_8_5ECom.rxVendedor.Append;
            QckFactServ_8_5ECom.rxVendedorNombreVendedor.Value:='';
            QckFactServ_8_5ECom.rxVendedor.Post;
          end;
          QckFactServ_8_5ECom.TPag.Caption:=
          IntToStr(QckFactServ_8_5ECom.PageNumber);
          QckFactServ_8_5ECom.xtipoVenta := TipoVenta;
          //QckFactServ_8_5ECom.valorNCF:= valorNCF;
          if dmReportes.qryViewVentasMastMONTO_EXONERADO_ITBIS.Value > 0 then
            begin
              //qckFactServ8_5Ayaco.QRLabel25.left:=505;
              QckFactServ_8_5ECom.QRLabel25.Caption :='ITBIS Exonerado';
            end  else
            QckFactServ_8_5ECom.QRLabel25.Caption :='ITBIS';

            if (GlbImpReciboSinPreg = 1) then
              QckFactServ_8_5ECom.Print
              else
            if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
            begin
              //QckFactServ_8_5ECom.QRImage2.Enabled:= False;
              QckFactServ_8_5ECom.PrinterSetup;
              QckFactServ_8_5ECom.Print;
            end else
            QckFactServ_8_5ECom.Preview;

            if (GlbImpReciboSinPreg = 0) then
            if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
            begin
              QckFactServ_8_5ECom.Preview;
            end;

            if GlbImpPDF then
            begin
              if not dmReportes.qryViewVentasMastNUMERO_FACTURA.IsNull then
              ReportExportPDF(QckFactServ_8_5ECom,GlbRutaRecibos+'\Recibos'+IntToStr(dmReportes.qryViewVentasMastNUMERO_FACTURA.Value)+'.pdf')
              else
              ReportExportPDF(QckFactServ_8_5ECom,GlbRutaRecibos+'\Recibos'+IntToStr(dmReportes.qryViewVentasMastNUMERO_DOC_PAGO.AsInteger)+'.pdf')
            end;
          finally
          QckFactServ_8_5ECom.Free;
          QckFactServ_8_5ECom:=Nil;
          end;
      end else  
  if (GlbColmado = 1 ) then
    begin
      {frmConsultaFacturas:=TfrmConsultaFacturas.Create(Nil);
      try
        frmConsultaFacturas.rdgCredito.Checked := True;
        frmConsultaFacturas.EditN1.SetInteger(serieDoc);
        frmConsultaFacturas.BitBtn1Click(Self);
        }
        dmreportes.qryViewVentasMast.Close;
        dmreportes.qryViewVentasMast.Params[0].Value:= dmfactura.qryVentaFacturaNUMERO.Value;
        dmreportes.qryViewVentasMast.Open;

        //ProcSetPathlogoTipoServicio(dmReportes.qryViewVentasMastTIPO_AFILIADO.Value);

        frmProcVentaRapida.LlenarrxSolDatoscte(dmFactura.qryVentaFacturaCODIGO_CTE.Value);
        TipoVenta:='CONTADO';
        if dmReportes.qryViewVentasMastForma_pago.AsInteger in [7,8] then
        TipoVenta := 'CREDITO'
        else
        if dmReportes.qryViewVentasMastForma_pago.value = 1 then
        TipoVenta := 'CONTADO';

        if (TipoVenta = 'CONTADO') then
        frmProcVentaRapida.AbrirDatosParaTicket(false,false,dmReportes.qryViewVentasMastCODIGO_CTE.AsString,dmReportes.qryViewVentasMastNUMERO_DOC_PAGO.AsInteger,
        dmReportes.qryViewVentasMastFECHA.Value)
        else
        if (TipoVenta = 'CREDITO') then
        frmProcVentaRapida.AbrirDatosParaTicket(false,true,dmReportes.qryViewVentasMastCODIGO_CTE.AsString,dmReportes.qryViewVentasMastNUMERO_FACTURA.AsInteger,
        dmReportes.qryViewVentasMastFECHA.Value);

        //qckRepReciboReimpTicketSurtidora:=TqckRepReciboReimpTicketSurtidora.Create(Nil);
        qckRepReciboReimpTicketSurtidoraNew:=TqckRepReciboReimpTicketSurtidoraNew.Create(Nil);
        try
        if GlbImpQREncuesta = 0 then
        begin
          if (GlbImpQREncuesta = 0) then
          qckRepReciboReimpTicketSurtidoraNew.Height:=761;

          //qckRepReciboReimpTicketSurtidoraNew.Page.Length:=6.156; //sin encuesta
          qckRepReciboReimpTicketSurtidoraNew.ChildBand14.Height:=0;
          //qckRepReciboReimpTicketSurtidoraNew.ChildBand13.HasChild:=False;
        end;
        qckRepReciboReimpTicketSurtidoraNew.SetParameterValues;
          if frmProcVentaRapida.rxspinImpCantCopias.Decimal > 0 then
          qckRepReciboReimpTicketSurtidoraNew.PrinterSettings.Copies:= StrToInt(frmProcVentaRapida.rxspinImpCantCopias.Text);
          if GlbEsCopia then
             qckRepReciboReimpTicketSurtidoraNew.strcopia :=' (COPIA)'
          else
          qckRepReciboReimpTicketSurtidoraNew.strcopia :='';

          //qckRepReciboReimpTicketSurtidoraNew.ncfDesc := GlbDescNCF;
          if Length(frmProcVentaRapida.edtObservacion.Text) > 0 then
             qckRepReciboReimpTicketSurtidoraNew.nombreCteGenerico:=frmProcVentaRapida.edtObservacion.Text;
          if (dmReportes.qryViewVentasMastCodigo_cte.value > 0) then
          begin
            qckRepReciboReimpTicketSurtidoraNew.qrLabelRNC.Caption:='RNC-' + frmProcVentaRapida.qryClienteRNC_NUMERO.Value;
            qckRepReciboReimpTicketSurtidoraNew.nombreCteGenerico:= frmProcVentaRapida.qryClienteNOMBRE_CTE.Value;
          end
          else qckRepReciboReimpTicketSurtidoraNew.qrLabelRNC.Caption:='';
          qckRepReciboReimpTicketSurtidoraNew.xtipoVenta := TipoVenta;
          qckRepReciboReimpTicketSurtidoraNew.valorNCF   := dmFactura.qryVentaFacturaNUMERO_NCF.Value;
          //pulgadaInc:=0.86;
          dmFactura.qryVentaFacturaDet.Last;
          if (glbQckUnaPagina = 1) then
          begin
           if dmFactura.qryVentaFacturaDet.RecordCount = 1 then
              qckRepReciboReimpTicketSurtidoraNew.Page.Length:=4.258
           else
           if dmFactura.qryVentaFacturaDet.RecordCount >= 2 then
              qckRepReciboReimpTicketSurtidoraNew.Page.Length:= qckRepReciboReimpTicketSurtidoraNew.Page.Length +
           (dmFactura.qryVentaFacturaDet.RecordCount - 1 ) * 0.25;

        flag:=true;
        dmFactura.qryVentaFacturaDet.First;
        dmFactura.qryVentaFacturaDet.Last;
        if dmFactura.qryVentaFacturaDet.RecordCount > 25  then
        qckRepReciboReimpTicketSurtidoraNew.Page.Length:=23
        else
        if dmFactura.qryVentaFacturaDet.RecordCount > 29  then
        qckRepReciboReimpTicketSurtidoraNew.Page.Length:=18;

        qckRepReciboReimpTicketSurtidoraNew.Prepare;
        dmFactura.qryVentaFacturaDet.Last;
        if ((dmFactura.qryVentaFacturaDet.RecordCount >= 1) and
           ((dmFactura.qryVentaFacturaDet.RecordCount < 10)
            or (qckRepReciboReimpTicketSurtidoraNew.PageNumber = 2))) then
        begin
          frmProcVentaRapida.ProgressBar1.Visible :=True;
          frmProcVentaRapida.ProgressBar1.Position:=0;
          frmProcVentaRapida.ProgressBar1.Max:=dmFactura.qryVentaFacturaDet.RecordCount;
          if (GlbIncLargoPapel = 1) then
          begin
          repeat
          begin
            frmProcVentaRapida.ProgressBar1.StepIt;
            //cRc:=cRc + 1;
            if (qckRepReciboReimpTicketSurtidoraNew.PageNumber > 1) then
            begin
              qckRepReciboReimpTicketSurtidoraNew.Page.Length:=qckRepReciboReimpTicketSurtidoraNew.Page.Length + 0.26;
              qckRepReciboReimpTicketSurtidoraNew.Prepare;
              flag:=False;
            end else
            if (qckRepReciboReimpTicketSurtidoraNew.PageNumber = 1) then
                break;
            if (qckRepReciboReimpTicketSurtidoraNew.PageNumber = 1) then
                break;
            end;
            until flag = true;
            end;
          end;
    end;//if (glbQckUnaPagina = 1) then
        frmProcVentaRapida.ProgressBar1.Visible:=False;
        dmFactura.qryVentaFacturaDet.Last;
        if (dmFactura.qryVentaFacturaDet.RecordCount >15) and (GlbImpFormatoPDF = 1) then
        begin
          frmProcVentaRapida.ImprimirEnFormatoPDF(1,6);
        end else
        begin
          dmDatos.qryImpresoras.Close;
          dmDatos.qryImpresoras.Open;
          if dmDatos.qryImpresoras.Locate('IDMODULO;IDREPORTE',
          VarArrayOf([1,6]),[]) then     //Factura/Recibo Punto Venta
          qckRepReciboReimpTicketSurtidoraNew.PrinterSettings.PrinterIndex:=
          GetImpresora(dmDatos.qryImpresorasNOMBRE_IMPRESORA.Value);

          if (GlbImpReciboSinPreg = 1) and (GlbImprimeReciboFact = 1) then
          qckRepReciboReimpTicketSurtidoraNew.Print
          else
          if MessageDlg('Imprimir?',mtInformation, [mbYes, mbNo], 0)=mryes then
          begin
            if (GlbImprimeReciboFact = 1) then
            begin
              qckRepReciboReimpTicketSurtidoraNew.PrinterSetup;
              qckRepReciboReimpTicketSurtidoraNew.Print;
            end;
          end else
          qckRepReciboReimpTicketSurtidoraNew.Preview;
          reciboImpreso:=True;
        end;
      //t if GlbImpTicketVtaAgua = 1 then
      //t ImprimirTicketVtaAgua(ipStpInsertVentMast.Params[0].Value);
      finally
      qckRepReciboReimpTicketSurtidoraNew.Free;
      qckRepReciboReimpTicketSurtidoraNew:=Nil;
      end;
      //FINALLY
      //frmConsultaFacturas.Free;
      //frmConsultaFacturas:=NIL;
      //END;
    end else

    if (UpperCase(GLBFormatoFactura) = 'FORMAFACOCO') then
    begin
      if EsConduce then
      ImprimirFacturaRepuestoConduce(dmfactura.qryFactReimpMaster.Params[0].Value)
      else
      ImprimirFacturaRepuesto(dmfactura.qryFactReimpMaster.Params[0].Value);
    end else

    if (UpperCase(GLBFormatoFactura) = 'FORMAEXPLODISMAR') then
      begin
        ImprimeFacturaEXDMAR(dmfactura.qryVentaFacturaNUMERO.Value,TipoVenta,'','Facturas');
      end else
      if (GlbDocStandar = 1) then
      begin
        dmreportes.qryViewVentasMast.Close;
        dmreportes.qryViewVentasMast.Params[0].Value:= dmfactura.qryVentaFacturaNUMERO.Value;
        dmreportes.qryViewVentasMast.Open;
        ProcSetPathlogoTipoServicio(dmReportes.qryViewVentasMastTIPO_AFILIADO.Value);
        qckFactServ_8_5Standard:=TqckFactServ_8_5Standard.Create(Nil);
        try
          if dmReportes.qryViewVentasMastMONTO_EXONERADO_ITBIS.Value > 0 then
          begin
            //qckFactServ8_5Ayaco.QRLabel25.left:=505;
            qckFactServ_8_5Standard.QRLabel25.Caption :='ITBIS Exonerado';
          end  else
          qckFactServ_8_5Standard.QRLabel25.Caption :='ITBIS';
        //qckFactServ8_5SAM.TPag.Caption:=
        //IntToStr(qckFactServ8_5SAM.PageNumber);
        if GlbEsCopia then
        qckFactServ_8_5Standard.xtipoVenta := TipoVenta +' (Copia)'
        else qckFactServ_8_5Standard.xtipoVenta := TipoVenta;
        qckFactServ_8_5Standard.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;
        if (GlbImpReciboSinPreg = 1) then
           qckFactServ_8_5Standard.Print
        else
        if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
        begin
          //qckFactServ_8_5Standard.QRImage2.Enabled:= False;
          qckFactServ_8_5Standard.PrinterSetup;
          qckFactServ_8_5Standard.Print;
        end else
        qckFactServ_8_5Standard.Preview;

        if (GlbImpReciboSinPreg = 0) then
        if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
        begin
          qckFactServ_8_5Standard.Preview;
        end;
        if GlbImpPDF then
        begin
        if not dmFactura.qryVentaFacturaNUMERO_FACTURA.IsNull then
        ReportExportPDF(qckFactServ_8_5Standard,GlbRutaFacturas+'\Facturas'+IntToStr(dmFactura.qryVentaFacturaNUMERO_FACTURA.Value)+'.pdf')
        else
        if not dmFactura.qryVentaFacturaNUMERO_DOC_PAGO.IsNull then
        ReportExportPDF(qckFactServ_8_5Standard,GlbRutaFacturas+'\Facturas'+IntToStr(dmFactura.qryVentaFacturaNUMERO_DOC_PAGO.AsInteger)+'.pdf')
        end;
        finally
        qckFactServ_8_5Standard.Free;
        qckFactServ_8_5Standard:=Nil;
        end;
      end else
    if (UpperCase(GLBFormatoFactura) = 'CASANDRA2') or ((UpperCase(GLBFormatoFactura) = 'FORMATOGENERAL')) then  //PENDIENTE DE ANALISIS
    begin
    //if (UpperCase(GLBFormatoFactura) = 'CASANDRA2') then  //PENDIENTE DE ANALISIS
    if (GlbFact55Pulg = 1) and (not GLBEsFastFood)then 
    begin
      qckRepRecibo8_5_11REspReimp :=TqckRepRecibo8_5_11REspReimp.Create(nil);
      try
        qckRepRecibo8_5_11REspReimp.Prepare;
        glbTPag := qckRepRecibo8_5_11REspReimp.PageNumber;
        if GlbEsCopia then
          qckRepRecibo8_5_11REspReimp.xtipoVenta:= TipoVenta + ' (Copia)'
        else
        qckRepRecibo8_5_11REspReimp.xtipoVenta:= TipoVenta;
        qckRepRecibo8_5_11REspReimp.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;

        dmDatos.qryImpresoras.Close;
        dmDatos.qryImpresoras.Open;
        if dmDatos.qryImpresoras.Locate('IDMODULO;IDREPORTE',
        VarArrayOf([1,5]),[]) then     //Factura/Recibo 8.5 x 5.5
        qckRepRecibo8_5_11REspReimp.PrinterSettings.PrinterIndex:=
        GetImpresora(dmDatos.qryImpresorasNOMBRE_IMPRESORA.Value);

        if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
        begin
          qckRepRecibo8_5_11REspReimp.PrinterSetup;
          qckRepRecibo8_5_11REspReimp.Print;
        end else
        qckRepRecibo8_5_11REspReimp.Preview;
      finally
      qckRepRecibo8_5_11REspReimp.free;
      qckRepRecibo8_5_11REspReimp:=Nil;
      end;
    end else
      begin
        if dmFactura.qryVentaFactura.RecordCount = 1 then
        begin
          //Formato 5.5
          qckRepRecibo8_5_11REspReimp :=TqckRepRecibo8_5_11REspReimp.Create(nil);
          try
            qckRepRecibo8_5_11REspReimp.Prepare;
            glbTPag := qckRepRecibo8_5_11REspReimp.PageNumber;
            if EsDevolucion then
            begin
              qckRepRecibo8_5_11REspReimp.xtipoVenta:= TipoVenta + ' (Re-Impresion)';
            end;
            qckRepRecibo8_5_11REspReimp.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;
            qckRepRecibo8_5_11REspReimp.qrtipoVenta.Caption:= '';
            dmDatos.qryImpresoras.Close;
            dmDatos.qryImpresoras.Open;
            if dmDatos.qryImpresoras.Locate('IDMODULO;IDREPORTE',
            VarArrayOf([1,5]),[]) then     //Factura/Recibo 8.5 x 5.5
            qckRepRecibo8_5_11REspReimp.PrinterSettings.PrinterIndex:=
            GetImpresora(dmDatos.qryImpresorasNOMBRE_IMPRESORA.Value);
                        
            if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
            begin
              qckRepRecibo8_5_11REspReimp.PrinterSetup;
              qckRepRecibo8_5_11REspReimp.Print;
            end else
            qckRepRecibo8_5_11REspReimp.Preview;
          finally
          qckRepRecibo8_5_11REspReimp.free;
          qckRepRecibo8_5_11REspReimp:=Nil;
          end;
        end;
      end;
    end else
    if (GlbColmado = 1 ) then
    begin
      dmreportes.qryViewVentasMast.Close;
      dmreportes.qryViewVentasMast.Params[0].Value:= dmFactura.qryVentaFacturaNUMERO.Value;
      dmreportes.qryViewVentasMast.Open;

      TipoVenta:='CONTADO';
      if dmReportes.qryViewVentasMastForma_pago.AsInteger in [7,8] then
      TipoVenta := 'CREDITO'
      else
      if dmReportes.qryViewVentasMastForma_pago.value = 1 then
      TipoVenta := 'CONTADO';

      if (TipoVenta = 'CONTADO') then
      frmProcVentaRapida.AbrirDatosParaTicket(false,false,dmReportes.qryViewVentasMastCODIGO_CTE.AsString,dmReportes.qryViewVentasMastNUMERO_DOC_PAGO.AsInteger,
      dmReportes.qryViewVentasMastFECHA.Value)
      else
      if (TipoVenta = 'CREDITO') then
      frmProcVentaRapida.AbrirDatosParaTicket(false,true,dmReportes.qryViewVentasMastCODIGO_CTE.AsString,dmReportes.qryViewVentasMastNUMERO_FACTURA.AsInteger,
      dmReportes.qryViewVentasMastFECHA.Value);

      //qckRepReciboReimpTicketSurtidora:=TqckRepReciboReimpTicketSurtidora.Create(Nil);
      qckRepReciboReimpTicketSurtidoraNew:=TqckRepReciboReimpTicketSurtidoraNew.Create(Nil);
      try
        if GlbImpQREncuesta = 0 then
        begin
          if (GlbImpQREncuesta = 0) then
          qckRepReciboReimpTicketSurtidoraNew.Height:=761;

          //qckRepReciboReimpTicketSurtidoraNew.Page.Length:=6.156; //sin encuesta
          qckRepReciboReimpTicketSurtidoraNew.ChildBand14.Height:=0;
          //qckRepReciboReimpTicketSurtidoraNew.ChildBand13.HasChild:=False;
        end;
        qckRepReciboReimpTicketSurtidoraNew.SetParameterValues;
        if frmProcVentaRapida.rxspinImpCantCopias.Decimal > 0 then
        qckRepReciboReimpTicketSurtidoraNew.PrinterSettings.Copies:= StrToInt(frmProcVentaRapida.rxspinImpCantCopias.Text);
        qckRepReciboReimpTicketSurtidoraNew.strcopia :='';

        //qckRepReciboReimpTicketSurtidoraNew.ncfDesc := GlbDescNCF;
        if Length(frmProcVentaRapida.edtObservacion.Text) > 0 then
        qckRepReciboReimpTicketSurtidoraNew.nombreCteGenerico:=frmProcVentaRapida.edtObservacion.Text;
        if (dmReportes.qryViewVentasMastCodigo_cte.value > 0) then
        begin
          qckRepReciboReimpTicketSurtidoraNew.qrLabelRNC.Caption:='RNC-' + frmProcVentaRapida.qryClienteRNC_NUMERO.Value;
          qckRepReciboReimpTicketSurtidoraNew.nombreCteGenerico:= frmProcVentaRapida.qryClienteNOMBRE_CTE.Value;
        end
        else qckRepReciboReimpTicketSurtidoraNew.qrLabelRNC.Caption:='';
        qckRepReciboReimpTicketSurtidoraNew.xtipoVenta := TipoVenta;
        qckRepReciboReimpTicketSurtidoraNew.valorNCF   := dmFactura.qryVentaFacturaNUMERO_NCF.Value;
        //pulgadaInc:=0.86;
        dmFactura.qryVentaFacturaDet.Last;
  if (glbQckUnaPagina = 1) then
  begin
        if dmFactura.qryVentaFacturaDet.RecordCount = 1 then
        qckRepReciboReimpTicketSurtidoraNew.Page.Length:=4.258
        else
        if dmFactura.qryVentaFacturaDet.RecordCount >= 2 then
        qckRepReciboReimpTicketSurtidoraNew.Page.Length:= qckRepReciboReimpTicketSurtidoraNew.Page.Length +
        (dmFactura.qryVentaFacturaDet.RecordCount - 1 ) * 0.25;

        flag:=true;
        dmFactura.qryVentaFacturaDet.First;
        dmFactura.qryVentaFacturaDet.Last;
        if dmFactura.qryVentaFacturaDet.RecordCount > 40  then
        qckRepReciboReimpTicketSurtidoraNew.Page.Length:=23.1
        else
        if dmFactura.qryVentaFacturaDet.RecordCount > 29  then
        qckRepReciboReimpTicketSurtidoraNew.Page.Length:=18;

        qckRepReciboReimpTicketSurtidoraNew.Prepare;
        dmFactura.qryVentaFacturaDet.Last;
        if ((dmFactura.qryVentaFacturaDet.RecordCount >= 1) and
           ((dmFactura.qryVentaFacturaDet.RecordCount < 10)
            or (qckRepReciboReimpTicketSurtidoraNew.PageNumber = 2))) then
        begin
          frmProcVentaRapida.ProgressBar1.Visible :=True;
          frmProcVentaRapida.ProgressBar1.Position:=0;
          frmProcVentaRapida.ProgressBar1.Max:=dmFactura.qryVentaFacturaDet.RecordCount;
          if (GlbIncLargoPapel = 1) then
          begin
          repeat
          begin
            frmProcVentaRapida.ProgressBar1.StepIt;
            //cRc:=cRc + 1;
            if (qckRepReciboReimpTicketSurtidoraNew.PageNumber > 1) then

            begin
              qckRepReciboReimpTicketSurtidoraNew.Page.Length:=qckRepReciboReimpTicketSurtidoraNew.Page.Length + 0.26;
              qckRepReciboReimpTicketSurtidoraNew.Prepare;
              flag:=False;
            end else
            if (qckRepReciboReimpTicketSurtidoraNew.PageNumber = 1) then
                break;
            if (qckRepReciboReimpTicketSurtidoraNew.PageNumber = 1) then
                break;
            end;
            until flag = true;
            end;
          end;
    end;
        frmProcVentaRapida.ProgressBar1.Visible:=False;
        dmFactura.qryVentaFacturaDet.Last;
        if (dmFactura.qryVentaFacturaDet.RecordCount >15) and (GlbImpFormatoPDF = 1) then
        begin
          frmProcVentaRapida.ImprimirEnFormatoPDF(1,6);
        end else
        begin
          dmDatos.qryImpresoras.Close;
          dmDatos.qryImpresoras.Open;
          if dmDatos.qryImpresoras.Locate('IDMODULO;IDREPORTE',
          VarArrayOf([1,6]),[]) then     //Factura/Recibo Punto Venta
          qckRepReciboReimpTicketSurtidoraNew.PrinterSettings.PrinterIndex:=
          GetImpresora(dmDatos.qryImpresorasNOMBRE_IMPRESORA.Value);

          if (GlbImpReciboSinPreg = 1) and (GlbImprimeReciboFact = 1) then
          qckRepReciboReimpTicketSurtidoraNew.Print
          else
          if MessageDlg('Imprimir?',mtInformation, [mbYes, mbNo], 0)=mryes then
          begin
            if (GlbImprimeReciboFact = 1) then
            begin
              qckRepReciboReimpTicketSurtidoraNew.PrinterSetup;
              qckRepReciboReimpTicketSurtidoraNew.Print;
            end;
          end else
          qckRepReciboReimpTicketSurtidoraNew.Preview;
          reciboImpreso:=True;
        end;
      //Todo:traer meitod imprimirticketvtaagua  
      //t if GlbImpTicketVtaAgua = 1 then
      //t ImprimirTicketVtaAgua(ipStpInsertVentMast.Params[0].Value);
      finally
      qckRepReciboReimpTicketSurtidoraNew.Free;
      qckRepReciboReimpTicketSurtidoraNew:=Nil;
      end;
    end else
    if (UpperCase(GLBFormatoFactura) = 'CASANDRA2') then  //PENDIENTE DE ANALISIS
    begin
      qckRepRecibo8_5_11REspReimp :=TqckRepRecibo8_5_11REspReimp.Create(nil);
      try
        qckRepRecibo8_5_11REspReimp.Prepare;
        glbTPag := qckRepRecibo8_5_11REspReimp.PageNumber;
        if GlbEsCopia then
        qckRepRecibo8_5_11REspReimp.xtipoVenta:= TipoVenta + ' (Copia)'
        else
        qckRepRecibo8_5_11REspReimp.xtipoVenta:= TipoVenta;
        qckRepRecibo8_5_11REspReimp.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;
        dmDatos.qryImpresoras.Close;
        dmDatos.qryImpresoras.Open;
        if dmDatos.qryImpresoras.Locate('IDMODULO;IDREPORTE',
        VarArrayOf([1,5]),[]) then     //Factura/Recibo 8.5 x 5.5
        qckRepRecibo8_5_11REspReimp.PrinterSettings.PrinterIndex:=
        GetImpresora(dmDatos.qryImpresorasNOMBRE_IMPRESORA.Value);
        if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
        begin
          qckRepRecibo8_5_11REspReimp.PrinterSetup;
          qckRepRecibo8_5_11REspReimp.Print;
        end else
        qckRepRecibo8_5_11REspReimp.Preview;
      finally
      qckRepRecibo8_5_11REspReimp.free;
      qckRepRecibo8_5_11REspReimp:=Nil;
      end;
    end else
    begin
      if dmfactura.qryFactReimpMaster.Recordcount > 0 then
      begin
        if (GlbFact55Pulg = 1) then
        begin
          if GlbFacturaLicoreria =1 then
          begin
            qckRepFacturaEstandarNewReimpREsp:=TqckRepFacturaEstandarNewReimpREsp.Create(Nil);
            try
             if GlbSizeFact8x11 = 1 then
             qckRepFacturaEstandarNewReimpREsp.Page.Length := 11;
             qckRepFacturaEstandarNewReimpREsp.xtipoVenta := TipoVenta;
             qckRepFacturaEstandarNewReimpREsp.Prepare;
             glbTPag := qckRepFacturaEstandarNewReimpREsp.PageNumber;
             //qckRepRecibo8_5_11REsp.valorNCF:= GlbDescNCF;//valorNCF;
            if frmProcVentaRapida.ImprimirRecibo1.Checked then
             begin
               qckRepFacturaEstandarNewReimpREsp.PrinterSetup;
               qckRepFacturaEstandarNewReimpREsp.Print;
             end else
             qckRepFacturaEstandarNewReimpREsp.Preview;
            finally
            qckRepFacturaEstandarNewReimpREsp.Free;
            qckRepFacturaEstandarNewReimpREsp:=Nil;
            end;
          end else
          begin
            qckRepFacturaEstandarNewReimp:=TqckRepFacturaEstandarNewReimp.Create(Nil);
            try
              if GlbSizeFact8x11 = 1 then
              qckRepFacturaEstandarNewReimp.Page.Length := 11;

              qckRepFacturaEstandarNewReimp.Prepare;
              glbTPag := qckRepFacturaEstandarNewReimp.PageNumber;

              if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
              begin
                qckRepFacturaEstandarNewReimp.PrinterSetup;
                qckRepFacturaEstandarNewReimp.Print;
              end else
              qckRepFacturaEstandarNewReimp.Preview;
            finally
            qckRepFacturaEstandarNewReimp.Free;
            qckRepFacturaEstandarNewReimp:=Nil;
          end;
      end;
  end else
  begin
    qckRepFactPuntoVenta:=TqckRepFactPuntoVenta.Create(Nil);

    try
      qckRepFactPuntoVenta.QRLabel14.Enabled:=False;
      pulgadaInc:=0.86;
      if dmFactura.qryVentaFacturaDet.RecordCount = 1 then
      qckRepFactPuntoVenta.Page.Length:= 5
      else
      if dmFactura.qryVentaFacturaDet.RecordCount >= 2 then
      qckRepFactPuntoVenta.Page.Length:= qckRepFactPuntoVenta.Page.Length +
      (dmFactura.qryVentaFacturaDet.RecordCount - 1 ) * 0.25;

      flag:=true;
      qckRepFactPuntoVenta.Prepare;
      frmProcVentaRapida.rxventa.DisableControls;
      frmProcVentaRapida.rxdbgrid1.Enabled:=False;
      if (dmFactura.qryVentaFacturaDet.RecordCount > 1) or (qckRepFactPuntoVenta.PageNumber > 1) then
      begin
          flag:= True;
          qckRepFactPuntoVenta.Prepare;
          frmProcVentaRapida.rxventa.DisableControls;
          frmProcVentaRapida.rxdbgrid1.Enabled:= False;
          if (dmfactura.qryFactReimpDet.RecordCount > 1) Or (qckRepFactPuntoVenta.PageNumber > 1) then
          begin
            repeat
            begin
              if (qckRepFactPuntoVenta.PageNumber > 1) then
               begin
                 qckRepFactPuntoVenta.Page.Length:=qckRepFactPuntoVenta.Page.Length + 0.25;
                 qckRepFactPuntoVenta.Prepare;
                 flag:=False;
               end else break;
            end;
            until flag = true;
          end;
      end;
      frmProcVentaRapida.rxventa.EnableControls;
      frmProcVentaRapida.rxdbgrid1.Enabled:= True;
      if frmProcVentaRapida.ImprimirRecibo1.Checked then
      qckRepFactPuntoVenta.Print else
      qckRepFactPuntoVenta.Preview;
    finally
    qckRepFactPuntoVenta.Free;
    qckRepFactPuntoVenta:=Nil;
    end;
  end;// else
  //MessageDlg('Número factura no econtrado verifique',mtInformation, [mbOK], 0);
  end;
  end;
  GlbEsCopia:=False;
end;

procedure ImprimirFacturaRepuestoConduce(
  numstr: integer);
begin
  GlbEsCopia:=False;
  dmCompania.tblCompania.Close;
  dmCompania.tblCompania.Open;
  dmCompania.tblCompania.Locate('codigo', glbCia_Key,[]);
  dmfactura.qryFactReimpMaster.Close;
  if (numstr = 0) then
  begin
    dmfactura.qryFactReimpMaster.Params[0].Value:= StrToInt(InputBox('Re-Imprimir factura de','Entre número',''));
    GlbEsCopia:=True;
  end else
  if esContado then
  dmfactura.qryFactReimpMaster.Params[0].Value:=numstr
  else
  dmfactura.qryFactReimpMaster.Params[0].Value:=numstr;
  //numstr;dmfactura.qryFactReimpMaster.sql.text

  //dmfactura.qryFactReimpMaster.sql.text
  dmfactura.qryFactReimpMaster.Open;
  //TipoVenta := 'CREDITO';
  dmfactura.qryFactReimpDet.Close;
  dmfactura.qryFactReimpDet.Params[0].Value:=dmfactura.qryFactReimpMaster.Params[0].Value;
  dmfactura.qryFactReimpDet.Open;//dmfactura.qryFactReimpDet.sql.text
  dmfactura.qryFactReimpDet.Last;
  //tRecordsDet := dmfactura.qryFactReimpDet.RecordCount;
  //dmfactura.qryFactReimpDet.Close;

  dmfactura.qryFactReimpMaster.Open;

  frmProcVentaRapida.qryCtes.Close;
  frmProcVentaRapida.qryCtes.Open;//dmfactura.qryFactReimpMaster.recordcount
  if frmProcVentaRapida.qryCtes.Locate('CODIGO_CTE', dmfactura.qryFactReimpMasterCODIGO_CTE.Value,[]) then
  glbcodVendedor:=frmProcVentaRapida.qryCtesCOD_VENDEDOR.Value
  else
  glbcodVendedor:= VarUsuarioGlb;
                        //dmFactura.qryVentaFacturanumero.value
  frmProcVentaRapida.LlenarrxSolDatoscte(dmFactura.qryVentaFacturaCODIGO_CTE.Value);
  //INGESERVIS, ARTIOFFICE,MAISONMARIE,TRIPLETASSO,CASANDRA2
  //if (GlBAyaco= 1) then
    begin
      dmreportes.qryViewVentasMast.Close;
      dmreportes.qryViewVentasMast.Params[0].Value:= dmfactura.qryVentaFacturaNUMERO.Value;
      dmreportes.qryViewVentasMast.Open;

      ProcSetPathlogoTipoServicio(dmReportes.qryViewVentasMastTIPO_AFILIADO.Value);

      if (GlbFormatoConduce = 444) and (GlbActivaFarmacia = 1) then
      begin
      dmVentas.tblDatosConduce.Close;
      dmVentas.tblDatosConduce.Params[0].Value:= dmreportes.qryViewVentasMastNUMERO.Value;
      dmVentas.tblDatosConduce.Open;
      if dmVentas.tblDatosConduce.Locate('NUM_TRN', dmreportes.qryViewVentasMastNUMERO.Value,[]) then
      begin
      frmDatosOrdConduce:=TfrmDatosOrdConduce.Create(nil);
      try
        frmDatosOrdConduce.BitBtn4Click(nil);
        frmDatosOrdConduce.BitBtn4.Enabled:=False;
        frmDatosOrdConduce.cerrarAlImp:= True;
        frmDatosOrdConduce.showmodal;
      finally
      frmDatosOrdConduce.free;
      frmDatosOrdConduce:=nil;
      end;
      end;
      exit;

      end else
      if (GLBECOM = 1) then   //Elias comunicaciones Santiago
      begin
        if (GlbFormatoConduce = 333) then //ECom
        begin
          qckRepConduceECom:=TqckRepConduceECom.Create(Nil);
          try
            qckRepConduceECom.Preview;

            if GlbImpPDF then
            if not dmFactura.qryVentaFacturaNUMERO_FACTURA.IsNull then
            ReportExportPDF(qckRepConduceECom,GlbRutaFacturas+'\Conduce'+IntToStr(dmFactura.qryVentaFacturaNUMERO_FACTURA.Value)+'.pdf')
            else
            if not dmFactura.qryVentaFacturaNUMERO_DOC_PAGO.IsNull then
            ReportExportPDF(qckRepConduceECom,GlbRutaFacturas+'\Conduce'+IntToStr(dmFactura.qryVentaFacturaNUMERO_DOC_PAGO.AsInteger)+'.pdf')

          finally
          qckRepConduceECom.free;
          qckRepConduceECom:=nil;
          end;
        end;
        Exit;
      end;

      if GlbFormatoConduce = 444 then
      begin
        //qckRepConduce
        qckRepConduce:=tqckRepConduce.Create(Nil);
        try

        if (GlbImpReciboSinPreg = 1) then
           qckRepConduce.Print
        else
        begin
          frmProcVentaRapida.ProgressBar1.Visible:= False;
          frmImprimir:=TfrmImprimir.Create(nil);
          try
            if frmImprimir.Showmodal = mrOk then
            begin
              if frmImprimir.RadioGroup1.ItemIndex = 0 then
              qckRepConduce.Page.PaperSize := Letter;

              if frmImprimir.RadioButton1.Checked then
              begin
                qckRepConduce.PrinterSetup;
                qckRepConduce.Print;
              end else
              qckRepConduce.Preview;
            end;
          finally
          frmImprimir.Free;
          frmImprimir:=Nil;
          end;
        end;
        //end else
        //QCKFactRepuesto8x5_5Conduce.Preview;

        if (GlbImpReciboSinPreg = 0) then
        if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
        begin
          qckRepConduce.Preview;
        end;
        if GlbImpPDF then
        if not dmFactura.qryVentaFacturaNUMERO_FACTURA.IsNull then
        ReportExportPDF(qckRepConduce,GlbRutaFacturas+'\Conduce'+IntToStr(dmFactura.qryVentaFacturaNUMERO_FACTURA.Value)+'.pdf')
        else
        if not dmFactura.qryVentaFacturaNUMERO_DOC_PAGO.IsNull then
        ReportExportPDF(qckRepConduce,GlbRutaFacturas+'\Conduce'+IntToStr(dmFactura.qryVentaFacturaNUMERO_DOC_PAGO.AsInteger)+'.pdf')

      finally
      qckRepConduce.Free;
      qckRepConduce:=Nil;
      end;
      end else
      begin
      QCKFactRepuesto8x5_5Conduce:=TQCKFactRepuesto8x5_5Conduce.Create(Nil);
      try
        if GlbEsCopia then
        QCKFactRepuesto8x5_5Conduce.xtipoVenta := TipoVenta +' (Copia)'
        else QCKFactRepuesto8x5_5Conduce.xtipoVenta := TipoVenta;
        QCKFactRepuesto8x5_5Conduce.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;
        if (GlbImpReciboSinPreg = 1) then
           QCKFactRepuesto8x5_5Conduce.Print
        else
        begin
          frmProcVentaRapida.ProgressBar1.Visible:= False;
          frmImprimir:=TfrmImprimir.Create(nil);
          try
            if frmImprimir.Showmodal = mrOk then
            begin
              if frmImprimir.RadioGroup1.ItemIndex = 0 then
              QCKFactRepuesto8x5_5Conduce.Page.PaperSize := Letter;
              if frmImprimir.RadioButton1.Checked then
              begin
                QCKFactRepuesto8x5_5Conduce.PrinterSetup;
                QCKFactRepuesto8x5_5Conduce.Print;
              end else
              QCKFactRepuesto8x5_5Conduce.Preview;
            end;
          finally
          frmImprimir.Free;
          frmImprimir:=Nil;
          end;
        end;

        if (GlbImpReciboSinPreg = 0) then
        if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
        begin
          QCKFactRepuesto8x5_5Conduce.Preview;
        end;
        if GlbImpPDF then
        if not dmFactura.qryVentaFacturaNUMERO_FACTURA.IsNull then
        ReportExportPDF(QCKFactRepuesto8x5_5Conduce,GlbRutaFacturas+'\Facturas'+IntToStr(dmFactura.qryVentaFacturaNUMERO_FACTURA.Value)+'.pdf')
        else
        if not dmFactura.qryVentaFacturaNUMERO_DOC_PAGO.IsNull then
        ReportExportPDF(QCKFactRepuesto8x5_5Conduce,GlbRutaFacturas+'\Facturas'+IntToStr(dmFactura.qryVentaFacturaNUMERO_DOC_PAGO.AsInteger)+'.pdf')

      finally
      QCKFactRepuesto8x5_5Conduce.Free;
      QCKFactRepuesto8x5_5Conduce:=Nil;
      end;
      end;
    end;
    EsConduce:=False;
end;

procedure ReImprimeFacturaContado;
var
  tRecordsDet : Integer;
  pulgadaInc : Real;
  flag : boolean;
  cRc : Integer;
  ctrlLoop:Integer;
  pl : real;
begin
  if not Assigned(frmProcVentaRapida) then exit;
  ctrlLoop :=0;
  pl:=7.27;
  GlbEsCopia:=True;
  //reimprime factura aqui
  dmCompania.tblCompania.Close;
  dmCompania.tblCompania.Open;
  dmCompania.tblCompania.Locate('codigo', glbCia_Key, []);
  dmfactura.qryFactReimpMaster.close;
  dmfactura.qryVentaFactura.Close;
  dmreportes.qryViewVentasMast.Close;
                        
  frmConsultaFacturas:=TfrmConsultaFacturas.Create(Nil);
  try
    frmConsultaFacturas.BitBtn2.Caption := '&Re-Imprimir';
    if frmConsultaFacturas.Showmodal = mrOK then
    begin
      if frmConsultaFacturas.rdgContado.Checked then
         frmProcVentaRapida.esContado:=True
      else frmProcVentaRapida.esContado:=False;

      if not dmFactura.qryVentaFacturaNUMERO_DOC_PAGO.IsNull then
      frmProcVentaRapida.NumeroTrn := dmFactura.qryVentaFacturaNUMERO_DOC_PAGO.AsInteger
      else
      frmProcVentaRapida.NumeroTrn := dmFactura.qryVentaFacturaNUMERO_Factura.Value;
      dmfactura.qryVtaConDeliveryTrn.Close;
      dmfactura.qryVtaConDeliveryTrn.Params[0].Value:= dmFactura.qryVentaFacturaNUMERO.Value;
      dmfactura.qryVtaConDeliveryTrn.Open;
      if (dmFactura.qryVentaFacturaforma_pago.value = 6) then
      begin
        flag := False;
        ReImpDevolucion(dmFactura.qryVentaFacturaNUMERO_DOC_PAGO.AsInteger,flag);
        if not flag then
        MessageDlg('Factura no existe en devolución', mtInformation, [mbok], 0);
        Exit;
      end;
    end else Exit;

    if frmConsultaFacturas.rdgNotaCR.Checked then//devolucion -NCR
    begin
      UProcesarDevolucion.SolNum:=False;
      UProcesarDevolucion.numeroFactura :=frmProcVentaRapida.NumeroTrn;
      ReImprimeDevolucion;
      UProcesarDevolucion.SolNum:=True;
      try
      if Assigned(frmConsultaFacturas) then
      begin
        frmConsultaFacturas.Free;
        frmConsultaFacturas:= Nil;
      end;
      except
      end;
      Exit;
    end;

    dmReportes.qryViewVentasMast.Close;
    dmReportes.qryViewVentasMast.Params[0].Value:=dmFactura.qryVentaFacturaNUMERO.Value;
    dmReportes.qryViewVentasMast.Open;
    ProcSetPathlogoTipoServicio(dmReportes.qryViewVentasMastTIPO_AFILIADO.Value);

    dmfactura.qryFactReimpMaster.Close;
    dmfactura.qryFactReimpMaster.Params[0].Value := -1;
    dmfactura.qryFactReimpMaster.Params[0].Value:= frmProcVentaRapida.NumeroTrn;
    dmfactura.qryFactReimpDet.Close;  
    dmfactura.qryFactReimpDet.Params[0].Value:= dmfactura.qryFactReimpMaster.Params[0].Value;
    dmfactura.qryFactReimpDet.Open;
    dmfactura.qryFactReimpDet.Last;
    tRecordsDet := dmfactura.qryFactReimpDet.RecordCount;
    dmfactura.qryFactReimpDet.Close;

    dmfactura.qryFactReimpMaster.Open;

    frmConsultaFacturas.EsReimprimirContado:= frmProcVentaRapida.esContado;
    EsReimprimirContado:= frmProcVentaRapida.esContado;
    frmConsultaFacturas.rdgContado.Checked := frmProcVentaRapida.esContado;
    if frmProcVentaRapida.esContado then
    TipoVenta := 'CONTADO'
    else
    TipoVenta := 'CREDITO';

    if dmreportes.qryViewVentasMastFORMA_PAGO.Value IN [7,8,18] then
    begin
      TipoVenta:='FACTURA';
      GlbRutaLogoDoc:='';
      if GetFormatoTipoDoc(0,GlbRutaLogoDoc) then  //2	1	Factura Credito 8.5 Estandar
      GlbDocStandar:=1
      else
      GlbDocStandar:=0;
    end ELSE
    begin
      TipoVenta:='CONTADO';
      GlbRutaLogoDoc:='';
      if GetFormatoTipoDoc(1,GlbRutaLogoDoc) then  //2	1	Factura Contado 8.5 Estandar
      GlbDocStandar:=1
      else
      GlbDocStandar:=0;
    end;
    
    dmclientes.tblClientes.Close;
    dmclientes.tblClientes.Open;
    if dmclientes.tblClientes.Locate('CODIGO_CTE', dmfactura.qryFactReimpMasterCODIGO_CTE.Value,[]) then
    glbcodVendedor:=dmclientes.tblClientesCOD_VENDEDOR.Value
    else
    glbcodVendedor:= VarUsuarioGlb;

    if (TipoVenta = 'CREDITO') or (TipoVenta = 'FACTURA') then
    begin
      frmConsultaFacturas.rdgCredito.Checked := True;
      frmConsultaFacturas.EditN1.SetInteger(dmfactura.qryVentaFacturaNUMERO_FACTURA.VALUE);
    end else
    begin
      frmConsultaFacturas.rdgContado.Checked := True;
      frmConsultaFacturas.EditN1.SetInteger(frmProcVentaRapida.NumeroTrn);
    end;
    frmConsultaFacturas.BitBtn1Click(nil);
    finally
    if Assigned(frmConsultaFacturas) then
       frmConsultaFacturas.Free;
       frmConsultaFacturas:=Nil;
    end;
    frmProcVentaRapida.LlenarrxSolDatoscte(dmFactura.qryVentaFacturaCODIGO_CTE.Value);

    dmFactura.qryDatosVtaARS.Close;
    dmFactura.qryDatosVtaARS.Params[0].Value := dmFactura.qryVentaFacturaNUMERO.Value;
    dmFactura.qryDatosVtaARS.Open;
    dmFactura.qryDatosVtaARS.First;
    if (not frmProcVentaRapida.esContado) then
    ReimprimirFacturaNoFiscal(frmProcVentaRapida.NumeroTrn)
    else

        if GLBEsFastFood then
        begin
          if (TipoVenta = 'CONTADO') then
          begin
            qckRepReciboReimpFFoodPOS:=TqckRepReciboReimpFFoodPOS.Create(Nil);
            try
             qckRepReciboReimpFFoodPOS.strcopia :=' (COPIA)';
             if (dmFactura.qryVentaFacturaMONTO_EXONERADO_ITBIS.Value > 0) then
             begin
               //qckRepReciboReimpFRetailPOS.QRLabel17.Left:=13;
               qckRepReciboReimpFFoodPOS.QRLabel17.Caption:= 'ITBIS Exonerado'
             end;
             if GlbImpCodProducto = 0 then
             begin
               qckRepReciboReimpFFoodPOS.QRSubDetail1.Height := 20;
               qckRepReciboReimpFFoodPOS.QRLabel26.Enabled := False;
               qckRepReciboReimpFFoodPOS.QRDBText20.Enabled:= False;
             end;

             qckRepReciboReimpFFoodPOS.ncfDesc := GlbDescNCF;
             if Length(frmProcVentaRapida.edtObservacion.Text) > 0 then
             qckRepReciboReimpFFoodPOS.nombreCteGenerico:=frmProcVentaRapida.edtObservacion.Text;
             if (frmProcVentaRapida.tablaPropietarioCodigoPropietario.value > 0) then
             begin

             end;

            qckRepReciboReimpFFoodPOS.xtipoVenta := TipoVenta;
            qckRepReciboReimpFFoodPOS.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;
            pulgadaInc:=0.86;
            //temporal
            //{
            if dmFactura.qryVentaFacturaDet.RecordCount = 1 then
            qckRepReciboReimpFFoodPOS.Page.Length:= 5
            else
            if dmFactura.qryVentaFacturaDet.RecordCount >= 2 then
            qckRepReciboReimpFFoodPOS.Page.Length:= qckRepReciboReimpFFoodPOS.Page.Length +
            (dmFactura.qryVentaFacturaDet.RecordCount - 1 ) * 0.22;

            flag:=true;
            qckRepReciboReimpFFoodPOS.Prepare;
            frmProcVentaRapida.rxventa.DisableControls;
            frmProcVentaRapida.rxdbgrid1.Enabled:=False;
            if (dmFactura.qryVentaFacturaDet.RecordCount > 1) or (qckRepReciboReimpFFoodPOS.PageNumber > 1) then
            begin
              repeat
              begin
                if (qckRepReciboReimpFFoodPOS.PageNumber > 1) then
                begin
                  qckRepReciboReimpFFoodPOS.Page.Length:=qckRepReciboReimpFFoodPOS.Page.Length + 0.25;
                  qckRepReciboReimpFFoodPOS.Prepare;
                  flag:=False;
                end else break;
              end;
              until flag = true;
            end;
            frmProcVentaRapida.rxventa.EnableControls;
            frmProcVentaRapida.rxdbgrid1.Enabled:=True;
            dmreportes.qryViewVentasMast.Close;
            dmreportes.qryViewVentasMast.Params[0].Value:= dmFactura.qryVentaFacturaNUMERO.Value;
            dmreportes.qryViewVentasMast.Open;
            ProcSetPathlogoTipoServicio(dmReportes.qryViewVentasMastTIPO_AFILIADO.Value);

            frmProcVentaRapida.RxDBGrid1.DataSource:= frmProcVentaRapida.datasource1;
            frmProcVentaRapida.dbtext1.DataField:='Descripcion';
            frmProcVentaRapida.dbtext1.DataSource:= frmProcVentaRapida.datasource1;
            frmProcVentaRapida.dbedit1.DataSource:= frmProcVentaRapida.datasource1;
            frmProcVentaRapida.dbedit1.DataField:='Cant';
            frmProcVentaRapida.dbedit2.DataSource:= frmProcVentaRapida.datasource1;
            frmProcVentaRapida.dbedit2.DataField:='Precio';
            frmProcVentaRapida.dbedit3.DataSource:= frmProcVentaRapida.datasource1;
            frmProcVentaRapida.dbedit3.DataField:='MontoBruto';

            frmProcVentaRapida.RxDBGrid1.Visible:=True;
            //if ImprimirRecibo1.Checked then
            //begin
        dmDatos.qryImpresoras.Close;
        dmDatos.qryImpresoras.Open;
        if dmDatos.qryImpresoras.Locate('IDMODULO;IDREPORTE',
        VarArrayOf([1,6]),[]) then     //Factura/Recibo Punto Venta
        qckRepReciboReimpFFoodPOS.PrinterSettings.PrinterIndex:=
        GetImpresora(dmDatos.qryImpresorasNOMBRE_IMPRESORA.Value);
            if (GlbImpReciboSinPreg = 1) and (GlbImprimeReciboFact = 1) then
            qckRepReciboReimpFFoodPOS.Print
            else
            if MessageDlg('Imprimir?',mtInformation, [mbYes, mbNo], 0)=mryes then
            begin
              if (GlbImprimeReciboFact = 1) then
              begin
                qckRepReciboReimpFFoodPOS.PrinterSetup;
               qckRepReciboReimpFFoodPOS.Print;
              end;
            end else
            qckRepReciboReimpFFoodPOS.Preview;
            reciboImpreso:=True;
            finally
            qckRepReciboReimpFFoodPOS.Free;
            qckRepReciboReimpFFoodPOS:=Nil;
            end;
            //t if GlbImpTicketVtaAgua = 1 then
            //t ImprimirTicketVtaAgua(frmProcVentaRapida.ipStpInsertVentMast.Params[0].Value);
          end
          else
          if (TipoVenta = 'CREDITO') then
          begin
            qckRepFactPuntoVenta:=TqckRepFactPuntoVenta.Create(Nil);
            try
              qckRepFactPuntoVenta.QRLabel14.Enabled:=False;

            pulgadaInc:=0.86;
            //temporal
            //{
            if dmFactura.qryVentaFacturaDet.RecordCount = 1 then
            qckRepFactPuntoVenta.Page.Length:= 5
            else
            if dmFactura.qryVentaFacturaDet.RecordCount >= 2 then
            qckRepFactPuntoVenta.Page.Length:= qckRepFactPuntoVenta.Page.Length +
            (dmFactura.qryVentaFacturaDet.RecordCount - 1 ) * 0.25;

            flag:=true;
            qckRepFactPuntoVenta.Prepare;
            frmProcVentaRapida.rxventa.DisableControls;
            frmProcVentaRapida.rxdbgrid1.Enabled:=False;
            if (dmFactura.qryVentaFacturaDet.RecordCount > 1) or (qckRepFactPuntoVenta.PageNumber > 1) then
            begin
              repeat
              begin
                if (qckRepFactPuntoVenta.PageNumber > 1) then
                begin
                  qckRepFactPuntoVenta.Page.Length:=qckRepFactPuntoVenta.Page.Length + 0.25;
                  qckRepFactPuntoVenta.Prepare;
                  flag:=False;
                end else break;
              end;
              until flag = true;
            end;
            frmProcVentaRapida.rxventa.EnableControls;
            frmProcVentaRapida.rxdbgrid1.Enabled:=True;
            if frmProcVentaRapida.ImprimirRecibo1.Checked then
            begin
              qckRepFactPuntoVenta.Print;
            end else
            qckRepFactPuntoVenta.Preview;
            finally
            qckRepFactPuntoVenta.Free;
            qckRepFactPuntoVenta:=Nil;
            end;
          end;
        end else //recibo retail
    if (UpperCase(GLBFormatoFactura) = 'FORMAFACOCO') and (GLBNumConduceCte = 1)then
    begin
      TipoVenta:='CONTADO';
      if dmfactura.qryVentaFacturaFORMA_PAGO.AsInteger in [7,8] then
      TipoVenta := 'CREDITO'
      else
      if dmfactura.qryVentaFacturaFORMA_PAGO.value = 1 then
      TipoVenta := 'CONTADO';
      dmreportes.qryViewVentasMast.Close;
      dmreportes.qryViewVentasMast.Params[0].Value:= dmFactura.qryVentaFacturaNUMERO.Value;
      dmreportes.qryViewVentasMast.Open;
      ProcSetPathlogoTipoServicio(dmReportes.qryViewVentasMastTIPO_AFILIADO.Value);

      if GlbFormatoConduce = 444 then
      begin
        qckFactServ8_5Agua:=TqckFactServ8_5Agua.Create(Nil);
        try
          if GlbEsCopia then
          qckFactServ8_5Agua.xtipoVenta := TipoVenta +' (Copia)'
          else qckFactServ8_5Agua.xtipoVenta := TipoVenta;
          qckFactServ8_5Agua.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;
          if (GlbImpReciboSinPreg = 1) then
             qckFactServ8_5Agua.Print
          else
          begin
            frmProcVentaRapida.ProgressBar1.Visible:= False;
            frmImprimir:=TfrmImprimir.Create(nil);
            try
              if frmImprimir.Showmodal = mrOk then
              begin
                if frmImprimir.RadioGroup1.ItemIndex = 0 then
                qckFactServ8_5Agua.Page.PaperSize := Letter;
                if frmImprimir.RadioButton1.Checked then
                begin
                  qckFactServ8_5Agua.PrinterSetup;
                  qckFactServ8_5Agua.Print;
                end else
                qckFactServ8_5Agua.Preview;
              end;
            finally
            frmImprimir.Free;
            frmImprimir:=Nil;
            end;
          end;

          if (GlbImpReciboSinPreg = 0) then
          if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
          begin
            qckFactServ8_5Agua.Preview;
          end;
          if GlbImpPDF then
          begin
          if not dmFactura.qryVentaFacturaNUMERO_FACTURA.IsNull then
                 ReportExportPDF(qckFactServ8_5Agua,GlbRutaRecibos+'\Recibos'+IntToStr(dmFactura.qryVentaFacturaNUMERO_FACTURA.Value)+'.pdf')
          else
          if not dmFactura.qryVentaFacturaNUMERO_DOC_PAGO.IsNull then
                 ReportExportPDF(qckFactServ8_5Agua,GlbRutaRecibos+'\Recibos'+IntToStr(dmFactura.qryVentaFacturaNUMERO_DOC_PAGO.AsInteger)+'.pdf')
          end;
        finally
        qckFactServ8_5Agua.Free;
        qckFactServ8_5Agua:=Nil;
        end;
      end;
    end else  //if (UpperCase(GLBFormatoFactura) = 'FORMAFACOCO') and (GLBNumConduceCte = 1)then
    if (UpperCase(GLBFormatoFactura) = 'FORMAFACOCO') then
    ImprimirFacturaRepuesto(dmfactura.qryVentaFacturaNUMERO.Value)
    else
    if (UpperCase(GLBFormatoFactura) = 'FORMAEXPLODISMAR') then
    begin
      ImprimeFacturaEXDMAR(dmfactura.qryVentaFacturaNUMERO.Value,TipoVenta,'','Facturas');
    end else
    if (GlbDocStandar = 1) then
    begin
        dmreportes.qryViewVentasMast.Close;
        dmreportes.qryViewVentasMast.Params[0].Value:= dmfactura.qryVentaFacturaNUMERO.Value;
        dmreportes.qryViewVentasMast.Open;
        ProcSetPathlogoTipoServicio(dmReportes.qryViewVentasMastTIPO_AFILIADO.Value);
      if dmreportes.qryViewVentasMastFORMA_PAGO.Value IN [7,8,18] then
      begin
        TipoVenta:='FACTURA';
        GlbRutaLogoDoc:='';
        if GetFormatoTipoDoc(0,GlbRutaLogoDoc) then  //2	1	Factura Credito 8.5 Estandar
        GlbDocStandar:=1
        else
        GlbDocStandar:=0;
      end ELSE
      begin
        TipoVenta:='CONTADO';
        GlbRutaLogoDoc:='';
        if GetFormatoTipoDoc(1,GlbRutaLogoDoc) then  //2	1	Factura Contado 8.5 Estandar
        GlbDocStandar:=1
        else
        GlbDocStandar:=0;
      end;
      qckFactServ_8_5Standard:=TqckFactServ_8_5Standard.Create(Nil);
      try
        qckFactServ_8_5Standard.TPag.Caption:=
        IntToStr(qckFactServ_8_5Standard.PageNumber);
        qckFactServ_8_5Standard.xtipoVenta := TipoVenta;
        if not dmreportes.qryViewVentasMastNUMERO_NCF.IsNull then
        qckFactServ_8_5Standard.valorNCF:= dmreportes.qryViewVentasMastNUMERO_NCF.Value;
        if dmReportes.qryViewVentasMastMONTO_EXONERADO_ITBIS.Value > 0 then
        begin
          qckFactServ_8_5Standard.QRLabel25.Caption :='ITBIS Exonerado';
        end  else
        qckFactServ_8_5Standard.QRLabel25.Caption :='ITBIS';

        if (GlbImpReciboSinPreg = 1) then
        qckFactServ_8_5Standard.Print
        else
        if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
        begin
          qckFactServ_8_5Standard.PrinterSetup;
          qckFactServ_8_5Standard.Print;
        end else
        qckFactServ_8_5Standard.Preview;

        if (GlbImpReciboSinPreg = 0) then
        if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
        begin
          qckFactServ_8_5Standard.Preview;
        end;
        if (GlbImpPDF) then
        begin
          if not dmReportes.qryViewVentasMastNUMERO_FACTURA.IsNull then
          ReportExportPDF(qckFactServ_8_5Standard,GlbRutaRecibos+'\Recibos'+IntToStr(dmReportes.qryViewVentasMastNUMERO_FACTURA.Value)+'.pdf')
          else
          ReportExportPDF(qckFactServ_8_5Standard,GlbRutaRecibos+'\Recibos'+IntToStr(dmReportes.qryViewVentasMastNUMERO_DOC_PAGO.AsInteger)+'.pdf')
        end;
        finally
        qckFactServ_8_5Standard.Free;
        qckFactServ_8_5Standard:=Nil;
        end;
      end else
      if (GLBECOM = 1) then   //Elias comunicaciones Santiago
      begin
        if (GlbFormatoConduce = 333) then //ECom
        begin
          qckRepConduceECom:=TqckRepConduceECom.Create(Nil);
          try
            qckRepConduceECom.Preview;
          finally
          qckRepConduceECom.free;
          qckRepConduceECom:=nil;
          end;
        end;
        QckFactServ_8_5ECom:=TQckFactServ_8_5ECom.Create(Nil);
        try
          QckFactServ_8_5ECom.rxVendedor.Close;
          QckFactServ_8_5ECom.rxVendedor.Open;
          if dmreportes.qryCantVendedoresSamCANTVENDEDORES.Value = 1 then
          begin
            if frmProcVentaRapida.qryEmpleado.Locate('codigo', dmreportes.qryViewVentasDetCodigo_Vendedor.Value,[]) then
            begin
              QckFactServ_8_5ECom.rxVendedor.Append;
              QckFactServ_8_5ECom.rxVendedorNombreVendedor.Value:=
              frmProcVentaRapida.qryEmpleadoNOMBREVENDEDOR.Value;
              QckFactServ_8_5ECom.rxVendedor.Post;
            end;
          end else
          begin
            QckFactServ_8_5ECom.rxVendedor.Close;
            QckFactServ_8_5ECom.rxVendedor.Open;
            QckFactServ_8_5ECom.rxVendedor.Append;
            QckFactServ_8_5ECom.rxVendedorNombreVendedor.Value:='';
            QckFactServ_8_5ECom.rxVendedor.Post;
          end;
          QckFactServ_8_5ECom.TPag.Caption:=
          IntToStr(QckFactServ_8_5ECom.PageNumber);
          QckFactServ_8_5ECom.xtipoVenta := TipoVenta;
          //QckFactServ_8_5ECom.valorNCF:= valorNCF;
          if dmReportes.qryViewVentasMastMONTO_EXONERADO_ITBIS.Value > 0 then
            begin
              //qckFactServ8_5Ayaco.QRLabel25.left:=505;
              QckFactServ_8_5ECom.QRLabel25.Caption :='ITBIS Exonerado';
            end  else
            QckFactServ_8_5ECom.QRLabel25.Caption :='ITBIS';

            if (GlbImpReciboSinPreg = 1) then
              QckFactServ_8_5ECom.Print
              else
            if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
            begin
              //QckFactServ_8_5ECom.QRImage2.Enabled:= False;
              QckFactServ_8_5ECom.PrinterSetup;
              QckFactServ_8_5ECom.Print;
            end else
            QckFactServ_8_5ECom.Preview;

            if (GlbImpReciboSinPreg = 0) then
            if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
            begin
              QckFactServ_8_5ECom.Preview;
            end;

            if GlbImpPDF then
            begin
              if not dmReportes.qryViewVentasMastNUMERO_FACTURA.IsNull then
              ReportExportPDF(QckFactServ_8_5ECom,GlbRutaRecibos+'\Recibos'+IntToStr(dmReportes.qryViewVentasMastNUMERO_FACTURA.Value)+'.pdf')
              else
              ReportExportPDF(QckFactServ_8_5ECom,GlbRutaRecibos+'\Recibos'+IntToStr(dmReportes.qryViewVentasMastNUMERO_DOC_PAGO.AsInteger)+'.pdf')
            end;
          finally
          QckFactServ_8_5ECom.Free;
          QckFactServ_8_5ECom:=Nil;
          end;
      end else
   if (GlBMutur = 1) then
      begin
        dmreportes.qryViewVentasMast.Close;
        dmreportes.qryViewVentasMast.Params[0].Value:= dmfactura.qryVentaFacturaNUMERO.Value;
        dmreportes.qryViewVentasMast.Open;
        ProcSetPathlogoTipoServicio(dmReportes.qryViewVentasMastTIPO_AFILIADO.Value);
        if dmreportes.qryViewVentasMastFORMA_PAGO.Value IN [7,8,18] then
        TipoVenta:='FACTURA'
        ELSE TipoVenta:='CONTADO';
        //if dmreportes.qryViewVentasMastFORMA_PAGO.Value = 1 then
        //begin
        //if (GlbUsaFctMexico = 1) then
        //  begin
          qckFactServ_8_5SAMNewMuturs:=TqckFactServ_8_5SAMNewMuturs.Create(Nil);
          try
            qckFactServ_8_5SAMNewMuturs.rxVendedor.Close;
            qckFactServ_8_5SAMNewMuturs.rxVendedor.Open;
            if dmreportes.qryCantVendedoresSamCANTVENDEDORES.Value = 1 then
            begin
              if frmProcVentaRapida.qryEmpleado.Locate('codigo', dmreportes.qryViewVentasDetCodigo_Vendedor.Value,[]) then
              begin
                qckFactServ_8_5SAMNewMuturs.rxVendedor.Append;
                qckFactServ_8_5SAMNewMuturs.rxVendedorNombreVendedor.Value:=
                frmProcVentaRapida.qryEmpleadoNOMBREVENDEDOR.Value;
                qckFactServ_8_5SAMNewMuturs.rxVendedor.Post;
              end;
            end else
            begin
              qckFactServ_8_5SAMNewMuturs.rxVendedor.Close;
              qckFactServ_8_5SAMNewMuturs.rxVendedor.Open;
              qckFactServ_8_5SAMNewMuturs.rxVendedor.Append;
              qckFactServ_8_5SAMNewMuturs.rxVendedorNombreVendedor.Value:='';
              qckFactServ_8_5SAMNewMuturs.rxVendedor.Post;
              end;
              qckFactServ_8_5SAMNewMuturs.TPag.Caption:=
              IntToStr(qckFactServ_8_5SAMNewMuturs.PageNumber);
              qckFactServ_8_5SAMNewMuturs.xtipoVenta := TipoVenta;
              //qckFactServ_8_5SAMNewM.valorNCF:= valorNCF;
              if dmReportes.qryViewVentasMastMONTO_EXONERADO_ITBIS.Value > 0 then
              begin
                qckFactServ_8_5SAMNewMuturs.QRLabel25.Caption :='ITBIS Exonerado';
              end  else
              qckFactServ_8_5SAMNewMuturs.QRLabel25.Caption :='ITBIS';

              if (GlbImpReciboSinPreg = 1) then
              qckFactServ_8_5SAMNewMuturs.Print
              else
              if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
              begin
                //qckFactServ_8_5SAMNewM.QRImage2.Enabled:= False;
                qckFactServ_8_5SAMNewMuturs.PrinterSetup;
                qckFactServ_8_5SAMNewMuturs.Print;
              end else
              qckFactServ_8_5SAMNewMuturs.Preview;

              if (GlbImpReciboSinPreg = 0) then
              if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
              begin
                qckFactServ_8_5SAMNewMuturs.Preview;
              end;
             if GlbImpPDF then
             begin
               if not dmReportes.qryViewVentasMastNUMERO_FACTURA.IsNull then
               ReportExportPDF(qckFactServ_8_5SAMNewMuturs,GlbRutaRecibos+'\Recibos'+IntToStr(dmReportes.qryViewVentasMastNUMERO_FACTURA.Value)+'.pdf')
               else
               ReportExportPDF(qckFactServ_8_5SAMNewMuturs,GlbRutaRecibos+'\Recibos'+IntToStr(dmReportes.qryViewVentasMastNUMERO_DOC_PAGO.AsInteger)+'.pdf')
             end;
          finally
          qckFactServ_8_5SAMNewMuturs.Free;
          qckFactServ_8_5SAMNewMuturs:=Nil;
          end;
        end else
    if (GlBSAM = 1) then
      begin
        dmreportes.qryViewVentasMast.Close;
        dmreportes.qryViewVentasMast.Params[0].Value:= dmfactura.qryVentaFacturaNUMERO.Value;
        dmreportes.qryViewVentasMast.Open;
        ProcSetPathlogoTipoServicio(dmReportes.qryViewVentasMastTIPO_AFILIADO.Value);
        if dmreportes.qryViewVentasMastFORMA_PAGO.Value IN [7,8,18] then
        TipoVenta:='FACTURA'
        ELSE TipoVenta:='CONTADO';
        //if dmreportes.qryViewVentasMastFORMA_PAGO.Value = 1 then
        //begin
        if (GlbUsaFctMexico = 1) then
        begin
          qckFactServ_8_5SAMNewM:=TqckFactServ_8_5SAMNewM.Create(Nil);
          try
            qckFactServ_8_5SAMNewM.rxVendedor.Close;
            qckFactServ_8_5SAMNewM.rxVendedor.Open;
            if dmreportes.qryCantVendedoresSamCANTVENDEDORES.Value = 1 then
            begin
              if frmProcVentaRapida.qryEmpleado.Locate('codigo', dmreportes.qryViewVentasDetCodigo_Vendedor.Value,[]) then
              begin
                qckFactServ_8_5SAMNewM.rxVendedor.Append;
                qckFactServ_8_5SAMNewM.rxVendedorNombreVendedor.Value:=
                frmProcVentaRapida.qryEmpleadoNOMBREVENDEDOR.Value;
                qckFactServ_8_5SAMNewM.rxVendedor.Post;
              end;
            end else
            begin
              qckFactServ_8_5SAMNewM.rxVendedor.Close;
              qckFactServ_8_5SAMNewM.rxVendedor.Open;
              qckFactServ_8_5SAMNewM.rxVendedor.Append;
              qckFactServ_8_5SAMNewM.rxVendedorNombreVendedor.Value:='';
              qckFactServ_8_5SAMNewM.rxVendedor.Post;
              end;
              qckFactServ_8_5SAMNewM.TPag.Caption:=
              IntToStr(qckFactServ_8_5SAMNewM.PageNumber);
              qckFactServ_8_5SAMNewM.xtipoVenta := TipoVenta;
              //qckFactServ_8_5SAMNewM.valorNCF:= valorNCF;
              if dmReportes.qryViewVentasMastMONTO_EXONERADO_ITBIS.Value > 0 then
              begin
                qckFactServ_8_5SAMNewM.QRLabel25.Caption :='ITBIS Exonerado';
              end  else
              qckFactServ_8_5SAMNewM.QRLabel25.Caption :='ITBIS';

              if (GlbImpReciboSinPreg = 1) then
              qckFactServ_8_5SAMNewM.Print
              else
              if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
              begin
                //qckFactServ_8_5SAMNewM.QRImage2.Enabled:= False;
                qckFactServ_8_5SAMNewM.PrinterSetup;
                qckFactServ_8_5SAMNewM.Print;
              end else
              qckFactServ_8_5SAMNewM.Preview;

              if (GlbImpReciboSinPreg = 0) then
              if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
              begin
                qckFactServ_8_5SAMNewM.Preview;
              end;
             if GlbImpPDF then
             begin
               if not dmReportes.qryViewVentasMastNUMERO_FACTURA.IsNull then
               ReportExportPDF(qckFactServ_8_5SAMNewM,GlbRutaRecibos+'\Recibos'+IntToStr(dmReportes.qryViewVentasMastNUMERO_FACTURA.Value)+'.pdf')
               else
               ReportExportPDF(qckFactServ_8_5SAMNewM,GlbRutaRecibos+'\Recibos'+IntToStr(dmReportes.qryViewVentasMastNUMERO_DOC_PAGO.AsInteger)+'.pdf')
             end;
          finally
          qckFactServ_8_5SAMNewM.Free;
          qckFactServ_8_5SAMNewM:=Nil;
          end;
        end else
        if (GLBFORMATOFACTPREIMP = 0) then
        begin
          qckFactServ_8_5SAM:=TqckFactServ_8_5SAM.Create(Nil);
          try
            qckFactServ_8_5SAM.rxVendedor.Close;
            qckFactServ_8_5SAM.rxVendedor.Open;
            if dmreportes.qryCantVendedoresSamCANTVENDEDORES.Value = 1 then
            begin
              if frmProcVentaRapida.qryEmpleado.Locate('codigo', dmreportes.qryViewVentasDetCodigo_Vendedor.Value,[]) then
              begin
                qckFactServ_8_5SAM.rxVendedor.Append;
                qckFactServ_8_5SAM.rxVendedorNombreVendedor.Value:=
                frmProcVentaRapida.qryEmpleadoNOMBREVENDEDOR.Value;
                qckFactServ_8_5SAM.rxVendedor.Post;
              end;
            end else
            begin
            //rxVendedorNombreVendedor
            qckFactServ_8_5SAM.rxVendedor.Close;
            qckFactServ_8_5SAM.rxVendedor.Open;
            qckFactServ_8_5SAM.rxVendedor.Append;
            qckFactServ_8_5SAM.rxVendedorNombreVendedor.Value:='';
            qckFactServ_8_5SAM.rxVendedor.Post;
          end;
          if dmReportes.qryViewVentasMastMONTO_EXONERADO_ITBIS.Value > 0 then
          begin
            qckFactServ_8_5SAM.QRLabel25.Caption :='ITBIS Exonerado';
          end  else
          qckFactServ_8_5SAM.QRLabel25.Caption :='ITBIS';

          qckFactServ_8_5SAM.xtipoVenta := TipoVenta;//dmFactura.qryVentaFactura.sql.text
          if not dmFactura.qryVentaFacturaNUMERO_NCF.IsNull then
          qckFactServ_8_5SAM.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value
          else
          qckFactServ_8_5SAM.valorNCF:= '';

          if (GlbImpReciboSinPreg = 1) then
              qckFactServ_8_5SAM.Print
          else
          if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
          begin
            qckFactServ_8_5SAM.QRImage2.Enabled:= False;
            qckFactServ_8_5SAM.PrinterSetup;
            qckFactServ_8_5SAM.Print;
          end else
          qckFactServ_8_5SAM.Preview;

          if (GlbImpReciboSinPreg = 0) then
          if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
          begin
            qckFactServ_8_5SAM.Preview;
          end;
          if GlbImpPDF then
          begin
          if not dmFactura.qryVentaFacturaNUMERO_FACTURA.IsNull then
          ReportExportPDF(qckFactServ_8_5SAM,GlbRutaFacturas+'\Recibos'+IntToStr(dmFactura.qryVentaFacturaNUMERO_FACTURA.Value)+'.pdf');
          end;
          finally
          qckFactServ_8_5SAM.Free;
          qckFactServ_8_5SAM:=Nil;
          end;
        end else
        begin
          //formatosamnew;
          qckFactServ_8_5SAMNew:=TqckFactServ_8_5SAMNew.Create(Nil);
          try
            qckFactServ_8_5SAMNew.rxVendedor.Close;
            qckFactServ_8_5SAMNew.rxVendedor.Open;
            if dmreportes.qryCantVendedoresSamCANTVENDEDORES.Value = 1 then
            begin
              if frmProcVentaRapida.qryEmpleado.Locate('codigo', dmreportes.qryViewVentasDetCodigo_Vendedor.Value,[]) then
              begin
                qckFactServ_8_5SAMNew.rxVendedor.Append;
                qckFactServ_8_5SAMNew.rxVendedorNombreVendedor.Value:=
                frmProcVentaRapida.qryEmpleadoNOMBREVENDEDOR.Value;
                qckFactServ_8_5SAMNew.rxVendedor.Post;
              end;
            end else
            begin
            //rxVendedorNombreVendedor
            qckFactServ_8_5SAMNew.rxVendedor.Close;
            qckFactServ_8_5SAMNew.rxVendedor.Open;
            qckFactServ_8_5SAMNew.rxVendedor.Append;
            qckFactServ_8_5SAMNew.rxVendedorNombreVendedor.Value:='';
            qckFactServ_8_5SAMNew.rxVendedor.Post;
          end;
          if dmReportes.qryViewVentasMastMONTO_EXONERADO_ITBIS.Value > 0 then
          begin
            qckFactServ_8_5SAMNew.QRLabel25.Caption :='ITBIS Exonerado';
          end  else
          qckFactServ_8_5SAMNew.QRLabel25.Caption :='ITBIS';

          qckFactServ_8_5SAMNew.xtipoVenta := TipoVenta;//dmFactura.qryVentaFactura.sql.text
          if not dmFactura.qryVentaFacturaNUMERO_NCF.IsNull then
          qckFactServ_8_5SAMNew.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value
          else
          qckFactServ_8_5SAMNew.valorNCF:= '';

          if (GlbImpReciboSinPreg = 1) then
              qckFactServ_8_5SAMNew.Print
          else
          if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
          begin
            qckFactServ_8_5SAMNew.QRImage2.Enabled:= False;
            qckFactServ_8_5SAMNew.PrinterSetup;
            qckFactServ_8_5SAMNew.Print;
          end else
          qckFactServ_8_5SAMNew.Preview;

          if (GlbImpReciboSinPreg = 0) then
          if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
          begin
            qckFactServ_8_5SAMNew.Preview;
          end;
          if GlbImpPDF then
          begin
          if not dmFactura.qryVentaFacturaNUMERO_FACTURA.IsNull then
          ReportExportPDF(qckFactServ_8_5SAMNew,GlbRutaFacturas+'\Recibos'+IntToStr(dmFactura.qryVentaFacturaNUMERO_FACTURA.Value)+'.pdf');
          end;
          finally
          qckFactServ_8_5SAMNew.Free;
          qckFactServ_8_5SAMNew:=Nil;
          end;
        end;
          //end;
      end else
    if ((GlBAyaco= 1) or (GlbSizeFact8x11 = 1) or (GlBTapiceria = 1)) or (GlBInveraf =1) then
       //and (GlbRec3Pulg = 0) and (TipoVenta ='FACTURA') then
    begin
      dmreportes.qryViewVentasMast.Close;
      dmreportes.qryViewVentasMast.Params[0].Value:= dmfactura.qryVentaFacturaNUMERO.Value;
      dmreportes.qryViewVentasMast.Open;
      ProcSetPathlogoTipoServicio(dmReportes.qryViewVentasMastTIPO_AFILIADO.Value);
      if (dmreportes.qryViewVentasMastFORMA_PAGO.Value = 7) or ((GlbSizeFact8x11 = 1) and (GlbRec3Pulg = 0)) then
      begin
        qckFactServ8_5Ayaco:=TqckFactServ8_5Ayaco.Create(Nil);
        try
          if dmReportes.qryViewVentasMastMONTO_EXONERADO_ITBIS.Value > 0 then
          begin
            //qckFactServ8_5Ayaco.QRLabel25.left:=505;
            qckFactServ8_5Ayaco.QRLabel25.Caption :='ITBIS Exonerado';
          end  else
          qckFactServ8_5Ayaco.QRLabel25.Caption :='ITBIS';

          qckFactServ8_5Ayaco.TPag.Caption:=
          IntToStr(qckFactServ8_5Ayaco.PageNumber);
          qckFactServ8_5Ayaco.xtipoVenta := TipoVenta;//dmFactura.qryVentaFactura.sql.text
          qckFactServ8_5Ayaco.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;
          if (GlbImpReciboSinPreg = 1) then
              qckFactServ8_5Ayaco.Print
          else
          if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
          begin
            qckFactServ8_5Ayaco.PrinterSetup;
            qckFactServ8_5Ayaco.Print;
          end else
          qckFactServ8_5Ayaco.Preview;

          if (GlbImpReciboSinPreg = 0) then
          if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
          begin
            qckFactServ8_5Ayaco.Preview;
          end;
          if GlbImpPDF then
          if not dmFactura.qryVentaFacturaNUMERO_FACTURA.IsNull then
          ReportExportPDF(qckFactServ8_5Ayaco,GlbRutaFacturas+'\Facturas'+IntToStr(dmFactura.qryVentaFacturaNUMERO_FACTURA.Value)+'.pdf');
          finally
          qckFactServ8_5Ayaco.Free;
          qckFactServ8_5Ayaco:=Nil;
          end;
      end else
      begin
        qckRepReciboReimpTicketSurtidoraNew:=tqckRepReciboReimpTicketSurtidoraNew.Create(Nil);
        try
        if GlbImpQREncuesta = 0 then
        begin
          if (GlbImpQREncuesta = 0) then
          qckRepReciboReimpTicketSurtidoraNew.Height:=761;

          qckRepReciboReimpTicketSurtidoraNew.Page.Length:=6.156; //sin encuesta
          qckRepReciboReimpTicketSurtidoraNew.ChildBand14.Height:=0;
          //qckRepReciboReimpTicketSurtidoraNew.ChildBand13.HasChild:=True;
        end;
        qckRepReciboReimpTicketSurtidoraNew.SetParameterValues;
        if frmProcVentaRapida.rxspinImpCantCopias.Decimal > 0 then
        qckRepReciboReimpTicketSurtidoraNew.PrinterSettings.Copies:= StrToInt(frmProcVentaRapida.rxspinImpCantCopias.Text);
        qckRepReciboReimpTicketSurtidoraNew.strcopia :=' (COPIA)';

        if GlbImpCodProducto = 0 then
        begin
          qckRepReciboReimpTicketSurtidoraNew.QRSubDetail1.Height := 20;
        end;

//      qckRepReciboReimpTicketSurtidoraNew.ncfDesc := GlbDescNCF;
        if Length(frmProcVentaRapida.edtObservacion.Text) > 0 then
           qckRepReciboReimpTicketSurtidoraNew.nombreCteGenerico:=frmProcVentaRapida.edtObservacion.Text;
           if (dmReportes.qryViewVentasMastcodigo_cte.value > 0) then
           begin
             qckRepReciboReimpTicketSurtidoraNew.qrLabelRNC.Caption:='RNC-' + frmProcVentaRapida.qryClienteRNC_NUMERO.Value;
             qckRepReciboReimpTicketSurtidoraNew.nombreCteGenerico:= frmProcVentaRapida.qryClienteNOMBRE_CTE.Value;
           end
           else qckRepReciboReimpTicketSurtidoraNew.qrLabelRNC.Caption:='';
           qckRepReciboReimpTicketSurtidoraNew.xtipoVenta := TipoVenta;
           qckRepReciboReimpTicketSurtidoraNew.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;
           pulgadaInc:=0.86; 
           dmFactura.qryVentaFacturaDet.Last;

            if dmFactura.qryVentaFacturaDet.RecordCount >= 2 then
            qckRepReciboReimpTicketSurtidoraNew.Page.Length:= qckRepReciboReimpTicketSurtidoraNew.Page.Length +
            (dmFactura.qryVentaFacturaDet.RecordCount - 1 ) * 0.25
            else
            qckRepReciboReimpTicketSurtidoraNew.Page.Length:= qckRepReciboReimpTicketSurtidoraNew.Page.Length + 0.50;

            flag:=true;
            qckRepReciboReimpTicketSurtidoraNew.Prepare;
            frmProcVentaRapida.rxventa.DisableControls;
            frmProcVentaRapida.rxdbgrid1.Enabled:=False;

            frmProcVentaRapida.rxventa.EnableControls;
            frmProcVentaRapida.rxdbgrid1.Enabled:=True;
            dmreportes.qryViewVentasMast.Close;
            dmreportes.qryViewVentasMast.Params[0].Value:= dmFactura.qryVentaFacturaNUMERO.Value;
            dmreportes.qryViewVentasMast.Open;
            ProcSetPathlogoTipoServicio(dmReportes.qryViewVentasMastTIPO_AFILIADO.Value);

            frmProcVentaRapida.RxDBGrid1.DataSource:= frmProcVentaRapida.datasource1;
            frmProcVentaRapida.dbtext1.DataField:='Descripcion';
            frmProcVentaRapida.dbtext1.DataSource:= frmProcVentaRapida.datasource1;
            frmProcVentaRapida.dbedit1.DataSource:= frmProcVentaRapida.datasource1;
            frmProcVentaRapida.dbedit1.DataField:='Cant';
            frmProcVentaRapida.dbedit2.DataSource:= frmProcVentaRapida.datasource1;
            frmProcVentaRapida.dbedit2.DataField:='Precio';
            frmProcVentaRapida.dbedit3.DataSource:= frmProcVentaRapida.datasource1;
            frmProcVentaRapida.dbedit3.DataField:='MontoBruto';

            frmProcVentaRapida.RxDBGrid1.Visible:=True;

            DmFactura.qryVentaFacturaDet.Last;
            //cRc := dmFactura.qryVentaFacturaDet.RecordCount;
            dmFactura.qryVentaFacturaDet.First;
            //cRc:=0;

            if (glbQckUnaPagina = 1) then
            begin
              if (qckRepReciboReimpTicketSurtidoraNew.PageNumber >= 3) then
              qckRepReciboReimpTicketSurtidoraNew.Page.Length:=26;

              if ((dmFactura.qryVentaFacturaDet.RecordCount >= 1) and
                 ((dmFactura.qryVentaFacturaDet.RecordCount < 10)
                   or (qckRepReciboReimpTicketSurtidoraNew.PageNumber = 2))) then
              begin
                frmProcVentaRapida.ProgressBar1.Visible :=True;
                frmProcVentaRapida.ProgressBar1.Position:=0;
                frmProcVentaRapida.ProgressBar1.Max:=dmFactura.qryVentaFacturaDet.RecordCount;

                repeat
                  begin
                    frmProcVentaRapida.ProgressBar1.StepIt;
                    //cRc:=cRc + 1;
                    if (qckRepReciboReimpTicketSurtidoraNew.PageNumber > 1) then
                    begin
                      qckRepReciboReimpTicketSurtidoraNew.Page.Length:=qckRepReciboReimpTicketSurtidoraNew.Page.Length + 0.50;

                      qckRepReciboReimpTicketSurtidoraNew.Prepare;
                      flag:=False;
                    end else break;
                    if (qckRepReciboReimpTicketSurtidoraNew.PageNumber = 1) then
                       break;
                  end;
                until flag = true;
              end;
        end;//if (glbQckUnaPagina = 1) then
         frmProcVentaRapida.ProgressBar1.Visible:=False;
            dmFactura.qryVentaFacturaDet.Last;
        if (dmFactura.qryVentaFacturaDet.RecordCount >15) and (GlbImpFormatoPDF = 1) then
        begin
          frmProcVentaRapida.ImprimirEnFormatoPDF(1,6);
        end else
        begin
          dmDatos.qryImpresoras.Close;
          dmDatos.qryImpresoras.Open;
          if dmDatos.qryImpresoras.Locate('IDMODULO;IDREPORTE',
          VarArrayOf([1,6]),[]) then     //Factura/Recibo Punto Venta
          qckRepReciboReimpTicketSurtidoraNew.PrinterSettings.PrinterIndex:=
          GetImpresora(dmDatos.qryImpresorasNOMBRE_IMPRESORA.Value);

          if (GlbImpReciboSinPreg = 1) and (GlbImprimeReciboFact = 1) then
          qckRepReciboReimpTicketSurtidoraNew.Print
          else
          if MessageDlg('Imprimir?',mtInformation, [mbYes, mbNo], 0)=mryes then
          begin
            if (GlbImprimeReciboFact = 1) then
            begin
              qckRepReciboReimpTicketSurtidoraNew.PrinterSetup;
              qckRepReciboReimpTicketSurtidoraNew.Print;
            end;
          end else
          qckRepReciboReimpTicketSurtidoraNew.Preview;
          reciboImpreso:=True;
        end;
      //t if GlbImpTicketVtaAgua = 1 then
      //t ImprimirTicketVtaAgua(frmProcVentaRapida.ipStpInsertVentMast.Params[0].Value);
      finally
      qckRepReciboReimpTicketSurtidoraNew.Free;
      qckRepReciboReimpTicketSurtidoraNew:=Nil;
      end;
      end
      end else
    if (GlBBurgos = 1) then
    begin
      dmreportes.qryViewVentasMast.Close;
      dmreportes.qryViewVentasMast.Params[0].Value:= dmfactura.qryVentaFacturaNUMERO.Value;
      dmreportes.qryViewVentasMast.Open;
      ProcSetPathlogoTipoServicio(dmReportes.qryViewVentasMastTIPO_AFILIADO.Value);
      qckFactServ8_5BB:=TqckFactServ8_5BB.Create(Nil);
      try
        //qckFactServ8_5BB.TPag.Caption:=
        //IntToStr(qckFactServ8_5BB.PageNumber);
        qckFactServ8_5BB.xtipoVenta := TipoVenta;
        qckFactServ8_5BB.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;
        if (GlbImpReciboSinPreg = 1) then
           qckFactServ8_5BB.Print
        else
        if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
        begin
          qckFactServ8_5BB.PrinterSetup;
          qckFactServ8_5BB.Print;
        end else
        qckFactServ8_5BB.Preview;

        if (GlbImpReciboSinPreg = 0) then
        if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
        begin
          qckFactServ8_5BB.Preview;
        end;
        finally
        qckFactServ8_5BB.Free;
        qckFactServ8_5BB:=Nil;
        end;
      end else      //voyporaqui
      //if (GlbFarmacia = 1 ) and (dmFactura.qryDatosVtaARS.RecordCount > 0) then
      //begin

      //end else
    if (GlbFarmacia = 1) and (GlbFact55Pulg = 1) and (GlbRec3Pulg = 0) then
    begin
      TipoVenta:='CONTADO';
      if dmReportes.qryViewVentasMastForma_pago.AsInteger in [7,8] then
      TipoVenta := 'CREDITO'
      else
      if dmReportes.qryViewVentasMastForma_pago.value = 1 then
      TipoVenta := 'CONTADO';
      ImprimeFactura8_5Farmacia(dmReportes.qryViewVentasMastNumero.Value,TipoVenta,'','Recibos');
    end else
    if ((Glbcolmado = 1) Or (GlBCuadros = 1) Or (GlbFarmacia = 1)) And (dmFactura.qryDatosVtaARS.RecordCount = 0) then
    begin
      TipoVenta:='CONTADO';
      if dmReportes.qryViewVentasMastForma_pago.AsInteger in [7,8] then
      TipoVenta := 'CREDITO'
      else
      if dmReportes.qryViewVentasMastForma_pago.value = 1 then
      TipoVenta := 'CONTADO';
      
      if (TipoVenta = 'CONTADO') then
      frmProcVentaRapida.AbrirDatosParaTicket(false,false,dmReportes.qryViewVentasMastCODIGO_CTE.AsString,dmReportes.qryViewVentasMastNUMERO_DOC_PAGO.AsInteger,
      dmReportes.qryViewVentasMastFECHA.Value)
      else
      if (TipoVenta = 'CREDITO') then                                                                    
      frmProcVentaRapida.AbrirDatosParaTicket(false,true,dmReportes.qryViewVentasMastCODIGO_CTE.AsString,dmReportes.qryViewVentasMastNUMERO_FACTURA.AsInteger,
      dmReportes.qryViewVentasMastFECHA.Value);
      //Controlar aqui longitud de ticket
      //qckRepReciboReimpTicketSurtidora:=TqckRepReciboReimpTicketSurtidora.Create(Nil);
      if (GlbImprimeTicketCustom = 1) then
    begin
      //TTicketCustomSize.PrintTicketReimpSurtidoraESCPos(const APrinterName, ATipoVenta, AValorNCF,
      //ANombreCteGenerico, AStrCopia: string): Boolean;
      dmDatos.qryImpresoras.Close;
  		dmDatos.qryImpresoras.Open;
	  	if dmDatos.qryImpresoras.Locate('IDMODULO;IDREPORTE', VarArrayOf([1, 6]), []) then
      begin 
        if dmReportes.qryViewVentasMastCodigo_cte.Value > 0 then
		    begin
  		    //qckRepReciboReimpTicketSurtidoraNew.qrLabelRNC.Caption := 'RNC-' + qryClienteRNC_NUMERO.Value;
    		  //t _nombreGenerico:=qryClienteNOMBRE_CTE.Value;
  	  	end;
    		//else
   		  //qckRepReciboReimpTicketSurtidoraNew.qrLabelRNC.Caption := '';

        if not TTicketCustomSize.PrintTicketReimpSurtidoraESCPos(dmDatos.qryImpresorasNOMBRE_IMPRESORA.Value, TipoVenta, dmReportes.qryViewVentasMastNUMERO_NCF.Value,
        ''{_nombreGenerico}, '1') then
        MessageDlg('No fue posible imprimir el ticket, verifique.',mtWarning,[mbok],0);
      end else
      begin
        MessageDlg('Debes configurar el nombre de la impresora punto de venta.',mtError,[mbok],0);
      end;
    end else
    begin
      qckRepReciboReimpTicketSurtidoraNew:=TqckRepReciboReimpTicketSurtidoraNew.Create(Nil);
      try
        qckRepReciboReimpTicketSurtidoraNew.PrinterSettings.PrinterIndex:=GetImpresorarpt(1,6);
        if GlbImpQREncuesta = 0 then
        begin
          if (GlbImpQREncuesta = 0) then
          qckRepReciboReimpTicketSurtidoraNew.Height:=761;
          //qckRepReciboReimpTicketSurtidoraNew.Page.Length:=6.156; //sin encuesta
          qckRepReciboReimpTicketSurtidoraNew.ChildBand14.Height:=0;
          //qckRepReciboReimpTicketSurtidoraNew.ChildBand13.HasChild:=False;
        end;
        qckRepReciboReimpTicketSurtidoraNew.SetParameterValues;
        if frmProcVentaRapida.rxspinImpCantCopias.Decimal > 0 then
        qckRepReciboReimpTicketSurtidoraNew.PrinterSettings.Copies:= StrToInt(frmProcVentaRapida.rxspinImpCantCopias.Text);
        qckRepReciboReimpTicketSurtidoraNew.strcopia :='';

        //qckRepReciboReimpTicketSurtidoraNew.ncfDesc := GlbDescNCF;
        if Length(frmProcVentaRapida.edtObservacion.Text) > 0 then
        qckRepReciboReimpTicketSurtidoraNew.nombreCteGenerico:=frmProcVentaRapida.edtObservacion.Text;
        if (dmReportes.qryViewVentasMastCodigo_cte.value > 0) then
        begin
          qckRepReciboReimpTicketSurtidoraNew.qrLabelRNC.Caption:='RNC-' + frmProcVentaRapida.qryClienteRNC_NUMERO.Value;
          qckRepReciboReimpTicketSurtidoraNew.nombreCteGenerico:= frmProcVentaRapida.qryClienteNOMBRE_CTE.Value;
        end
        else qckRepReciboReimpTicketSurtidoraNew.qrLabelRNC.Caption:='';
        qckRepReciboReimpTicketSurtidoraNew.xtipoVenta := TipoVenta;
        if not dmFactura.qryVentaFacturaNUMERO_NCF.IsNull then
        qckRepReciboReimpTicketSurtidoraNew.valorNCF := dmFactura.qryVentaFacturaNUMERO_NCF.AsString; // valorNCF;
        //pulgadaInc:=0.86;
        dmFactura.qryVentaFacturaDet.Last;
      if (glbQckUnaPagina = 1) then
      begin
        if (dmFactura.qryVentaFacturaDet.RecordCount = 1) and
           (qckRepReciboReimpTicketSurtidoraNew.Page.Length < 6.65)  then
        qckRepReciboReimpTicketSurtidoraNew.Page.Length:=5.759
        else
        if dmFactura.qryVentaFacturaDet.RecordCount >= 2 then
        qckRepReciboReimpTicketSurtidoraNew.Page.Length:= qckRepReciboReimpTicketSurtidoraNew.Page.Length +
        (dmFactura.qryVentaFacturaDet.RecordCount - 1 ) * 0.25;

        flag:=true;
        dmFactura.qryVentaFacturaDet.First;
        dmFactura.qryVentaFacturaDet.Last;
        if dmFactura.qryVentaFacturaDet.RecordCount > 25  then
        qckRepReciboReimpTicketSurtidoraNew.Page.Length:=23.1
        else
        if dmFactura.qryVentaFacturaDet.RecordCount > 29  then
        qckRepReciboReimpTicketSurtidoraNew.Page.Length:=26;

        qckRepReciboReimpTicketSurtidoraNew.Prepare;
        dmFactura.qryVentaFacturaDet.Last;
        if ((dmFactura.qryVentaFacturaDet.RecordCount >= 1) and
           ((dmFactura.qryVentaFacturaDet.RecordCount < 10)
            or (qckRepReciboReimpTicketSurtidoraNew.PageNumber = 2))) then
        begin
          frmProcVentaRapida.ProgressBar1.Visible :=True;
          frmProcVentaRapida.ProgressBar1.Position:=0;
          frmProcVentaRapida.ProgressBar1.Max:=dmFactura.qryVentaFacturaDet.RecordCount;
          ctrlLoop:=0;
          if (GlbIncLargoPapel = 1) then
          begin
            pl:=7.27;
            repeat
                begin
                  frmProcVentaRapida.ProgressBar1.StepIt;
                  //cRc:=cRc + 1;
                  if (qckRepReciboReimpTicketSurtidoraNew.PageNumber > 1) then
                  begin
                    if dmFactura.qryVentaFacturaDet.RecordCount = 1 then
                    qckRepReciboReimpTicketSurtidoraNew.Page.Length:= qckRepReciboReimpTicketSurtidoraNew.Page.Length + 0.55
                    else
                    qckRepReciboReimpTicketSurtidoraNew.Page.Length:=qckRepReciboReimpTicketSurtidoraNew.Page.Length +
                    (dmFactura.qryVentaFacturaDet.RecordCount - 1 ) * 0.30;

                    qckRepReciboReimpTicketSurtidoraNew.Prepare;
                    flag:=False;
                  end else break;
                  if (qckRepReciboReimpTicketSurtidoraNew.PageNumber = 1) then
                  break;
                end;
            until flag = true;
            end;
          end;
        end; //if (glbQckUnaPagina = 1) then

        frmProcVentaRapida.ProgressBar1.Visible:=False;

        try

        dmFactura.qryVentaFacturaDet.Last;//dmFactura.qryVentaFacturaDet.params[0].value
        if (dmFactura.qryVentaFacturaDet.RecordCount >15) and (GlbImpFormatoPDF = 1) then
        begin
          frmProcVentaRapida.ImprimirEnFormatoPDF(1,6);
        end else
        begin
          dmDatos.qryImpresoras.Close;
          dmDatos.qryImpresoras.Open;
          if dmDatos.qryImpresoras.Locate('IDMODULO;IDREPORTE',
          VarArrayOf([1,6]),[]) then     //Factura/Recibo Punto Venta
          qckRepReciboReimpTicketSurtidoraNew.PrinterSettings.PrinterIndex:=
          GetImpresora(dmDatos.qryImpresorasNOMBRE_IMPRESORA.Value);

          if (GlbImpReciboSinPreg = 1) and (GlbImprimeReciboFact = 1) then
          begin
            qckRepReciboReimpTicketSurtidoraNew.Prepare;
            qckRepReciboReimpTicketSurtidoraNew.Print
          end else
          if MessageDlg('Imprimir?',mtInformation, [mbYes, mbNo], 0)=mryes then
          begin
            if (GlbImprimeReciboFact = 1) then
            begin
              qckRepReciboReimpTicketSurtidoraNew.PrinterSetup;
              qckRepReciboReimpTicketSurtidoraNew.Print;
            end;
          end else
          qckRepReciboReimpTicketSurtidoraNew.Preview;//cuadro
          if (glbCuadros = 1) and (GlbFactRecurrente)  then
          frmProcVentaRapida.CerrarVentana:=True;

          reciboImpreso:=True;
        end;

        except on E : Exception do
       begin
          MessageDlg('Error generando reporte, verifique.'+e.Message,mtError,[mbok],0);
          if (GlbEsDebugEntradas = 1) then
           WriteToLog('CodProd:'+frmProcVentaRapida.rxVentaCodArticulo.AsString+'.Actualizando Cant Inventario:'+frmProcVentaRapida.rxDataAntCantFinal.AsString+
          ' #Trn '+IntToStr(frmProcVentaRapida.NumeroTrn)+LF+CR+e.Message);
       end;
       end;//try
      //t if GlbImpTicketVtaAgua = 1 then
      //t ImprimirTicketVtaAgua(frmProcVentaRapida.ipStpInsertVentMast.Params[0].Value);
      finally
      qckRepReciboReimpTicketSurtidoraNew.Free;
      qckRepReciboReimpTicketSurtidoraNew:=Nil;
      end;
      end;
    end else
      if (GlbFarmacia = 1 ) then //qckRepReciboReimpTicketFarmacia
      begin
        dmFactura.qryDatosVtaARS.Close;
        dmFactura.qryDatosVtaARS.Params[0].Value := dmReportes.qryViewVentasMastNUMERO.Value;
        dmFactura.qryDatosVtaARS.Open;
        dmFactura.qryDatosVtaARS.First;

        if (TipoVenta = 'CONTADO') then
          begin
            qckRepReciboReimpTicketFarmaciaARS:=TqckRepReciboReimpTicketFarmaciaARS.Create(Nil);
            try
               dmDatos.qryImpresoras.Close;
               dmDatos.qryImpresoras.Open;
               if dmDatos.qryImpresoras.Locate('IDMODULO;IDREPORTE',
                  VarArrayOf([1,6]),[]) then     //Factura/Recibo Punto Venta
               qckRepReciboReimpTicketFarmaciaARS.PrinterSettings.PrinterIndex:=
               GetImpresora(dmDatos.qryImpresorasNOMBRE_IMPRESORA.Value);

              if (dmFactura.qryDatosVtaARS.RecordCount = 0) then
              begin
                qckRepReciboReimpTicketFarmaciaARS.ChildBand10.Height:=0;
                qckRepReciboReimpTicketFarmaciaARS.ChildBand1.Height :=40;
                qckRepReciboReimpTicketFarmaciaARS.Page.Length:=
                qckRepReciboReimpTicketFarmaciaARS.Page.Length - 5;
              end else
              begin
                qckRepReciboReimpTicketFarmaciaARS.ChildBand1.Height:=95;
              end;

             if dmFactura.qryVtaConDeliveryTrn.RecordCount = 0 then
             begin
                qckRepReciboReimpTicketFarmaciaARS.ChildBand13.Height:=0;
                qckRepReciboReimpTicketFarmaciaARS.Page.Length:=
                qckRepReciboReimpTicketFarmaciaARS.Page.Length - 1.45;
             end;
             qckRepReciboReimpTicketFarmaciaARS.strcopia :=' (COPIA)';
             if GlbImpCodProducto = 0 then
             begin
               qckRepReciboReimpTicketFarmaciaARS.QRSubDetail1.Height := 20;
             end;

             qckRepReciboReimpTicketFarmaciaARS.ncfDesc := GlbDescNCF;
             if Length(frmProcVentaRapida.edtObservacion.Text) > 0 then
             qckRepReciboReimpTicketFarmaciaARS.nombreCteGenerico:=frmProcVentaRapida.edtObservacion.Text;
             if (dmReportes.qryViewVentasMastcodigo_cte.value > 0) then
             begin
               qckRepReciboReimpTicketFarmaciaARS.qrLabelRNC.Caption:='RNC-' + frmProcVentaRapida.qryClienteRNC_NUMERO.Value;
               qckRepReciboReimpTicketFarmaciaARS.nombreCteGenerico:= frmProcVentaRapida.qryClienteNOMBRE_CTE.Value;
             end
             else qckRepReciboReimpTicketFarmaciaARS.qrLabelRNC.Caption:='';
            //RxDBGrid1.Visible:=False;
            //RxDBGrid1.DataSource:=DataSource2;
            qckRepReciboReimpTicketFarmaciaARS.xtipoVenta := TipoVenta;
            qckRepReciboReimpTicketFarmaciaARS.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;
            pulgadaInc:=0.86;
            //temporal
            //{ 01312021
            dmFactura.qryVentaFacturaDet.Last;
        if (glbQckUnaPagina = 1) then
        begin
            if (dmFactura.qryVentaFacturaDet.RecordCount = 1) and
             (dmFactura.qryDatosVtaARS.RecordCount > 0) then
            qckRepReciboReimpTicketFarmaciaARS.Page.Length:= 8.19
            else
            if dmFactura.qryVentaFacturaDet.RecordCount >= 2 then
            qckRepReciboReimpTicketFarmaciaARS.Page.Length:= qckRepReciboReimpTicketFarmaciaARS.Page.Length +
            ((dmFactura.qryVentaFacturaDet.RecordCount - 1 ) * 0.85); //antes 1.25);

            flag:=true;
            qckRepReciboReimpTicketFarmaciaARS.Prepare;
            dmFactura.qryVentaFacturaDet.Last;
            if (qckRepReciboReimpTicketFarmaciaARS.Page.Length > 4)
               and (dmFactura.qryVentaFacturaDet.RecordCount = 1) then
            qckRepReciboReimpTicketFarmaciaARS.Page.Length:=4;
            frmProcVentaRapida.rxventa.DisableControls;
            frmProcVentaRapida.rxdbgrid1.Enabled:=False;
            dmFactura.qryVentaFacturaDet.Last;
            if ((dmFactura.qryVentaFacturaDet.RecordCount >= 1) and
                ((dmFactura.qryVentaFacturaDet.RecordCount < 10)
                or (qckRepReciboReimpTicketFarmaciaARS.PageNumber = 3))) then
            begin
              frmProcVentaRapida.ProgressBar1.Max:=dmFactura.qryVentaFacturaDet.RecordCount;
              frmProcVentaRapida.ProgressBar1.Position:=0;
              frmProcVentaRapida.ProgressBar1.Visible:=True;
              repeat
              begin
                //cRc:=cRc + 1;
                frmProcVentaRapida.ProgressBar1.StepIt;
                if (qckRepReciboReimpTicketFarmaciaARS.PageNumber > 1) then
                begin
                  qckRepReciboReimpTicketFarmaciaARS.Page.Length:=qckRepReciboReimpTicketFarmaciaARS.Page.Length + 0.26;

                  qckRepReciboReimpTicketFarmaciaARS.Prepare;
                  flag:=False;
                end else break;
                if (qckRepReciboReimpTicketFarmaciaARS.PageNumber = 1) then
                break;
              end;
              until flag = true;
            end;
            end;
            frmProcVentaRapida.ProgressBar1.Visible:=False;
            frmProcVentaRapida.rxventa.EnableControls;
            frmProcVentaRapida.rxdbgrid1.Enabled:=True;
            dmreportes.qryViewVentasMast.Close;
            dmreportes.qryViewVentasMast.Params[0].Value:= dmFactura.qryVentaFacturaNUMERO.Value;
            dmreportes.qryViewVentasMast.Open;
            ProcSetPathlogoTipoServicio(dmReportes.qryViewVentasMastTIPO_AFILIADO.Value);
            frmProcVentaRapida.RxDBGrid1.DataSource:= frmProcVentaRapida.datasource1;
            frmProcVentaRapida.dbtext1.DataField:='Descripcion';
            frmProcVentaRapida.dbtext1.DataSource:= frmProcVentaRapida.datasource1;
            frmProcVentaRapida.dbedit1.DataSource:= frmProcVentaRapida.datasource1;
            frmProcVentaRapida.dbedit1.DataField:='Cant';
            frmProcVentaRapida.dbedit2.DataSource:= frmProcVentaRapida.datasource1;
            frmProcVentaRapida.dbedit2.DataField:='Precio';
            frmProcVentaRapida.dbedit3.DataSource:= frmProcVentaRapida.datasource1;
            frmProcVentaRapida.dbedit3.DataField:='MontoBruto';

            frmProcVentaRapida.RxDBGrid1.Visible:=True;
            //if ImprimirRecibo1.Checked then
            //begin

            if (GlbImpReciboSinPreg = 1) and (GlbImprimeReciboFact = 1) then
            qckRepReciboReimpTicketFarmaciaARS.Print
            else
            if MessageDlg('Imprimir?',mtInformation, [mbYes, mbNo], 0)=mryes then
            begin
              if (GlbImprimeReciboFact = 1) then
              begin
                qckRepReciboReimpTicketFarmaciaARS.PrinterSetup;
               qckRepReciboReimpTicketFarmaciaARS.Print;
              end;
            end else
            qckRepReciboReimpTicketFarmaciaARS.Preview;
            reciboImpreso:=True;
            finally
            qckRepReciboReimpTicketFarmaciaARS.Free;
            qckRepReciboReimpTicketFarmaciaARS:=Nil;
            end;
          end
          else
          if (TipoVenta = 'CREDITO') then
          begin
          //aqui es es
          if GlbUsaPUnidadLevel = 1 then
          begin
            qckRepReciboReimpTicketFarmaciaARS:=TqckRepReciboReimpTicketFarmaciaARS.Create(Nil);
            try
               dmDatos.qryImpresoras.Close;
               dmDatos.qryImpresoras.Open;
               if dmDatos.qryImpresoras.Locate('IDMODULO;IDREPORTE',
                  VarArrayOf([1,6]),[]) then     //Factura/Recibo Punto Venta
               qckRepReciboReimpTicketFarmaciaARS.PrinterSettings.PrinterIndex:=
               GetImpresora(dmDatos.qryImpresorasNOMBRE_IMPRESORA.Value);            
              if (dmFactura.qryDatosVtaARS.RecordCount = 0) then
              begin
                qckRepReciboReimpTicketFarmaciaARS.ChildBand10.Height:=0;
                qckRepReciboReimpTicketFarmaciaARS.ChildBand1.Height :=40;
                qckRepReciboReimpTicketFarmaciaARS.Page.Length:=
                qckRepReciboReimpTicketFarmaciaARS.Page.Length - 5;
              end else
              begin
                qckRepReciboReimpTicketFarmaciaARS.ChildBand1.Height:=95;
              end;
              
              if dmFactura.qryVtaConDeliveryTrn.RecordCount = 0 then
              begin
                qckRepReciboReimpTicketFarmaciaARS.ChildBand13.Height:=0;
                qckRepReciboReimpTicketFarmaciaARS.Page.Length:=
                qckRepReciboReimpTicketFarmaciaARS.Page.Length - 3.45;
              end;
              
             qckRepReciboReimpTicketFarmaciaARS.strcopia :=' (COPIA)';
             if GlbImpCodProducto = 0 then
             begin
               qckRepReciboReimpTicketFarmaciaARS.QRSubDetail1.Height := 20;
             end;

             qckRepReciboReimpTicketFarmaciaARS.ncfDesc := GlbDescNCF;
             if Length(frmProcVentaRapida.edtObservacion.Text) > 0 then
             qckRepReciboReimpTicketFarmaciaARS.nombreCteGenerico:=frmProcVentaRapida.edtObservacion.Text;
             if (dmReportes.qryViewVentasMastcodigo_cte.value > 0) then
             begin
               qckRepReciboReimpTicketFarmaciaARS.qrLabelRNC.Caption:='RNC-' + frmProcVentaRapida.qryClienteRNC_NUMERO.Value;
               qckRepReciboReimpTicketFarmaciaARS.nombreCteGenerico:= frmProcVentaRapida.qryClienteNOMBRE_CTE.Value;
             end
             else qckRepReciboReimpTicketFarmaciaARS.qrLabelRNC.Caption:='';

            qckRepReciboReimpTicketFarmaciaARS.xtipoVenta := TipoVenta;
            qckRepReciboReimpTicketFarmaciaARS.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;
            pulgadaInc:=0.86;
            //temporal
            //{
      if (glbQckUnaPagina = 1) then
      begin
            if dmFactura.qryVentaFacturaDet.RecordCount = 1 then
            qckRepReciboReimpTicketFarmaciaARS.Page.Length:= 4.258
            else
            if dmFactura.qryVentaFacturaDet.RecordCount >= 2 then
            qckRepReciboReimpTicketFarmaciaARS.Page.Length:= qckRepReciboReimpTicketFarmaciaARS.Page.Length +
            (dmFactura.qryVentaFacturaDet.RecordCount - 1 ) * 0.25;

            flag:=true;
            qckRepReciboReimpTicketFarmaciaARS.Prepare;
            dmFactura.qryVentaFacturaDet.Last;
            frmProcVentaRapida.rxventa.DisableControls;
            frmProcVentaRapida.rxdbgrid1.Enabled:=False;
            if ((dmFactura.qryVentaFacturaDet.RecordCount >= 1) and
                ((dmFactura.qryVentaFacturaDet.RecordCount < 10)
                or (qckRepReciboReimpTicketFarmaciaARS.PageNumber = 2))) then
            begin
              repeat
              begin
                //cRc:=cRc + 1;
                if (qckRepReciboReimpTicketFarmaciaARS.PageNumber > 1) then
                begin
                  qckRepReciboReimpTicketFarmaciaARS.Page.Length:=qckRepReciboReimpTicketFarmaciaARS.Page.Length + 0.26;

                  qckRepReciboReimpTicketFarmaciaARS.Prepare;
                  flag:=False;
                end else break;
                if (qckRepReciboReimpTicketFarmaciaARS.PageNumber = 1) then
                break;
              end;
              until flag = true;
            end;
      end;
            frmProcVentaRapida.rxventa.EnableControls;
            frmProcVentaRapida.rxdbgrid1.Enabled:=True;
            dmreportes.qryViewVentasMast.Close;
            dmreportes.qryViewVentasMast.Params[0].Value:= dmFactura.qryVentaFacturaNUMERO.Value;
            dmreportes.qryViewVentasMast.Open;
            ProcSetPathlogoTipoServicio(dmReportes.qryViewVentasMastTIPO_AFILIADO.Value);

            frmProcVentaRapida.RxDBGrid1.DataSource:= frmProcVentaRapida.datasource1;
            frmProcVentaRapida.dbtext1.DataField:='Descripcion';
            frmProcVentaRapida.dbtext1.DataSource:= frmProcVentaRapida.datasource1;
            frmProcVentaRapida.dbedit1.DataSource:= frmProcVentaRapida.datasource1;
            frmProcVentaRapida.dbedit1.DataField:='Cant';
            frmProcVentaRapida.dbedit2.DataSource:= frmProcVentaRapida.datasource1;
            frmProcVentaRapida.dbedit2.DataField:='Precio';
            frmProcVentaRapida.dbedit3.DataSource:= frmProcVentaRapida.datasource1;
            frmProcVentaRapida.dbedit3.DataField:='MontoBruto';

            frmProcVentaRapida.RxDBGrid1.Visible:=True;
            //if ImprimirRecibo1.Checked then
            //begin

            if (GlbImpReciboSinPreg = 1) and (GlbImprimeReciboFact = 1) then
            qckRepReciboReimpTicketFarmaciaARS.Print
            else
            if MessageDlg('Imprimir?',mtInformation, [mbYes, mbNo], 0)=mryes then
            begin
              if (GlbImprimeReciboFact = 1) then
              begin
                qckRepReciboReimpTicketFarmaciaARS.PrinterSetup;
               qckRepReciboReimpTicketFarmaciaARS.Print;
              end;
            end else
            qckRepReciboReimpTicketFarmaciaARS.Preview;
            reciboImpreso:=True;
            finally
            qckRepReciboReimpTicketFarmaciaARS.Free;
            qckRepReciboReimpTicketFarmaciaARS:=Nil;
            end;
          end;
          end;
    end else
    if (UpperCase(GLBFormatoFactura) = 'CASANDRA2') or ((UpperCase(GLBFormatoFactura) = 'FORMATOGENERAL')) then  //PENDIENTE DE ANALISIS
    begin
      if (GlbRec3Pulg = 1) then
      //and (8=9)) then //temporals
      begin
        frmProcVentaRapida.RxDBGrid1.DataSource:= frmProcVentaRapida.datasource3;
        frmProcVentaRapida.dbtext1.DataField:='';
        frmProcVentaRapida.dbtext1.DataSource:= frmProcVentaRapida.datasource3;
        frmProcVentaRapida.dbedit1.DataField:='';
        frmProcVentaRapida.dbedit1.DataSource:= frmProcVentaRapida.datasource3;
        frmProcVentaRapida.dbedit2.DataField:='';
        frmProcVentaRapida.dbedit2.DataSource:= frmProcVentaRapida.datasource3;
        frmProcVentaRapida.dbedit3.DataField:='';
        frmProcVentaRapida.dbedit3.DataSource:= frmProcVentaRapida.datasource3;
        if (Glbcolmado = 1) then
        begin
          if (TipoVenta = 'CONTADO') then
          begin
            qckRepReciboReimpTicketSurtidoraNew:=tqckRepReciboReimpTicketSurtidoraNew.Create(Nil);
            try
              if GlbImpQREncuesta = 0 then
              begin
                if (GlbImpQREncuesta = 0) then
                qckRepReciboReimpTicketSurtidoraNew.Height:=761;
              
                //qckRepReciboReimpTicketSurtidoraNew.Page.Length:=6.156; //sin encuesta
                qckRepReciboReimpTicketSurtidoraNew.ChildBand14.Height:=0;
                //qckRepReciboReimpTicketSurtidoraNew.ChildBand13.HasChild:=False;
              end;
             qckRepReciboReimpTicketSurtidoraNew.SetParameterValues; 
             if frmProcVentaRapida.rxspinImpCantCopias.Decimal > 0 then
             qckRepReciboReimpTicketSurtidoraNew.PrinterSettings.Copies:= StrToInt(frmProcVentaRapida.rxspinImpCantCopias.Text);
             qckRepReciboReimpTicketSurtidoraNew.strcopia :=' (COPIA)';
             if GlbImpCodProducto = 0 then
             begin
               qckRepReciboReimpTicketSurtidoraNew.QRSubDetail1.Height := 20;
             end;

             if Length(frmProcVentaRapida.edtObservacion.Text) > 0 then
             qckRepReciboReimpTicketSurtidoraNew.nombreCteGenerico:=frmProcVentaRapida.edtObservacion.Text;
             if (dmReportes.qryViewVentasMastcodigo_cte.value > 0) then
             begin
               qckRepReciboReimpTicketSurtidoraNew.qrLabelRNC.Caption:='RNC-' + frmProcVentaRapida.qryClienteRNC_NUMERO.Value;
               qckRepReciboReimpTicketSurtidoraNew.nombreCteGenerico:= frmProcVentaRapida.qryClienteNOMBRE_CTE.Value;
             end
             else qckRepReciboReimpTicketSurtidoraNew.qrLabelRNC.Caption:='';

            qckRepReciboReimpTicketSurtidoraNew.xtipoVenta := TipoVenta;
            qckRepReciboReimpTicketSurtidoraNew.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;
            pulgadaInc:=0.86;
            dmFactura.qryVentaFacturaDet.Last;
            dmFactura.qryVentaFacturaDet.First;
           if (glbQckUnaPagina = 1) then
           begin
              if dmFactura.qryVentaFacturaDet.RecordCount = 1 then
              qckRepReciboReimpTicketSurtidoraNew.Page.Length:= 4.258
              else
              if dmFactura.qryVentaFacturaDet.RecordCount >= 25 then
              qckRepReciboReimpTicketSurtidoraNew.Page.Length:=26
              else
              if dmFactura.qryVentaFacturaDet.RecordCount >= 2 then
              qckRepReciboReimpTicketSurtidoraNew.Page.Length:= qckRepReciboReimpTicketSurtidoraNew.Page.Length +
              (dmFactura.qryVentaFacturaDet.RecordCount - 2 ) * 0.25;

            flag:=true;
            qckRepReciboReimpTicketSurtidoraNew.Prepare;

            if (qckRepReciboReimpTicketSurtidoraNew.PageNumber >= 3) then
            qckRepReciboReimpTicketSurtidoraNew.Page.Length:=26;

            frmProcVentaRapida.rxventa.DisableControls;
            frmProcVentaRapida.rxdbgrid1.Enabled:=False;

            if ((dmFactura.qryVentaFacturaDet.RecordCount >= 1) and
                ((dmFactura.qryVentaFacturaDet.RecordCount < 10)
                or (qckRepReciboReimpTicketSurtidoraNew.PageNumber = 2))) then
            begin
              frmProcVentaRapida.ProgressBar1.Max:=dmFactura.qryVentaFacturaDet.RecordCount;
              frmProcVentaRapida.ProgressBar1.Position:=0;
              frmProcVentaRapida.ProgressBar1.Visible:=True;

              if (GlbIncLargoPapel = 1) then
              begin
                repeat
                begin
                  //cRc:=cRc + 1;
                  frmProcVentaRapida.ProgressBar1.StepIt;
                  if (qckRepReciboReimpTicketSurtidoraNew.PageNumber > 1) then
                  begin
                    qckRepReciboReimpTicketSurtidoraNew.Page.Length:=qckRepReciboReimpTicketSurtidoraNew.Page.Length + 0.26;
                    qckRepReciboReimpTicketSurtidoraNew.Prepare;
                    flag:=False;
                  end else break;
                  if (qckRepReciboReimpTicketSurtidoraNew.PageNumber = 1) then
                  break;
                end;
                until flag = true;
              end;
            end;
            end;//glbQckUnaPagina
            frmProcVentaRapida.ProgressBar1.Visible:=False;
            frmProcVentaRapida.rxventa.EnableControls;
            frmProcVentaRapida.rxdbgrid1.Enabled:=True;
            dmreportes.qryViewVentasMast.Close;
            dmreportes.qryViewVentasMast.Params[0].Value:= dmFactura.qryVentaFacturaNUMERO.Value;
            dmreportes.qryViewVentasMast.Open;
            ProcSetPathlogoTipoServicio(dmReportes.qryViewVentasMastTIPO_AFILIADO.Value);

            frmProcVentaRapida.RxDBGrid1.DataSource:= frmProcVentaRapida.datasource1;
            frmProcVentaRapida.dbtext1.DataField:='Descripcion';
            frmProcVentaRapida.dbtext1.DataSource:= frmProcVentaRapida.datasource1;
            frmProcVentaRapida.dbedit1.DataSource:= frmProcVentaRapida.datasource1;
            frmProcVentaRapida.dbedit1.DataField:='Cant';
            frmProcVentaRapida.dbedit2.DataSource:= frmProcVentaRapida.datasource1;
            frmProcVentaRapida.dbedit2.DataField:='Precio';
            frmProcVentaRapida.dbedit3.DataSource:= frmProcVentaRapida.datasource1;
            frmProcVentaRapida.dbedit3.DataField:='MontoBruto';

            frmProcVentaRapida.RxDBGrid1.Visible:=True;
            //if ImprimirRecibo1.Checked then
            //begin
            dmFactura.qryVentaFacturaDet.Last;
        if (dmFactura.qryVentaFacturaDet.RecordCount >15) and (GlbImpFormatoPDF = 1) then
        begin
          frmProcVentaRapida.ImprimirEnFormatoPDF(1,6);
        end else
        begin
          dmDatos.qryImpresoras.Close;
          dmDatos.qryImpresoras.Open;
          if dmDatos.qryImpresoras.Locate('IDMODULO;IDREPORTE',
          VarArrayOf([1,6]),[]) then     //Factura/Recibo Punto Venta
          qckRepReciboReimpTicketSurtidoraNew.PrinterSettings.PrinterIndex:=
          GetImpresora(dmDatos.qryImpresorasNOMBRE_IMPRESORA.Value);

          if (GlbImpReciboSinPreg = 1) and (GlbImprimeReciboFact = 1) then
          qckRepReciboReimpTicketSurtidoraNew.Print
          else
          if MessageDlg('Imprimir?',mtInformation, [mbYes, mbNo], 0)=mryes then
          begin
            if (GlbImprimeReciboFact = 1) then
            begin
              qckRepReciboReimpTicketSurtidoraNew.PrinterSetup;
              qckRepReciboReimpTicketSurtidoraNew.Print;
            end;
          end else
          qckRepReciboReimpTicketSurtidoraNew.Preview;
          reciboImpreso:=True;
        end;
      //t if GlbImpTicketVtaAgua = 1 then
      //t ImprimirTicketVtaAgua(frmProcVentaRapida.ipStpInsertVentMast.Params[0].Value);
      finally
      qckRepReciboReimpTicketSurtidoraNew.Free;
      qckRepReciboReimpTicketSurtidoraNew:=Nil;
      end;
          end
          else
          if (TipoVenta = 'CREDITO') then
          begin
            if Glbcolmado = 1 then
            begin
            qckRepReciboReimpTicketSurtidoraNew:=tqckRepReciboReimpTicketSurtidoraNew.Create(Nil);
            try
              if GlbImpQREncuesta = 0 then
              begin
                if (GlbImpQREncuesta = 0) then
                qckRepReciboReimpTicketSurtidoraNew.Height:=761;

                //qckRepReciboReimpTicketSurtidoraNew.Page.Length:=6.156; //sin encuesta
                qckRepReciboReimpTicketSurtidoraNew.ChildBand14.Height:=0;
                //qckRepReciboReimpTicketSurtidoraNew.ChildBand13.HasChild:=False;
              end;
              qckRepReciboReimpTicketSurtidoraNew.SetParameterValues;
              if frmProcVentaRapida.rxspinImpCantCopias.Decimal > 0 then
              qckRepReciboReimpTicketSurtidoraNew.PrinterSettings.Copies:= StrToInt(frmProcVentaRapida.rxspinImpCantCopias.Text);
             qckRepReciboReimpTicketSurtidoraNew.strcopia :=' (COPIA)';
             if GlbImpCodProducto = 0 then
             begin
               qckRepReciboReimpTicketSurtidoraNew.QRSubDetail1.Height := 20;
             end;

//             qckRepReciboReimpTicketSurtidoraNew.ncfDesc := GlbDescNCF;
             if Length(frmProcVentaRapida.edtObservacion.Text) > 0 then
             qckRepReciboReimpTicketSurtidoraNew.nombreCteGenerico:=frmProcVentaRapida.edtObservacion.Text;
             if (dmReportes.qryViewVentasMastcodigo_cte.value > 0) then
             begin
               qckRepReciboReimpTicketSurtidoraNew.qrLabelRNC.Caption:='RNC-' + frmProcVentaRapida.qryClienteRNC_NUMERO.Value;
               qckRepReciboReimpTicketSurtidoraNew.nombreCteGenerico:= frmProcVentaRapida.qryClienteNOMBRE_CTE.Value;
             end
             else qckRepReciboReimpTicketSurtidoraNew.qrLabelRNC.Caption:='';
            qckRepReciboReimpTicketSurtidoraNew.xtipoVenta := TipoVenta;
            qckRepReciboReimpTicketSurtidoraNew.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;
            pulgadaInc:=0.86;
           if (glbQckUnaPagina = 1) then
           begin
            if dmFactura.qryVentaFacturaDet.RecordCount = 1 then
            qckRepReciboReimpTicketSurtidoraNew.Page.Length:= 4.258
            else
            if dmFactura.qryVentaFacturaDet.RecordCount >= 2 then
            qckRepReciboReimpTicketSurtidoraNew.Page.Length:= qckRepReciboReimpTicketSurtidoraNew.Page.Length +
            (dmFactura.qryVentaFacturaDet.RecordCount - 1 ) * 0.25;

            flag:=true;
            qckRepReciboReimpTicketSurtidoraNew.Prepare;
            if (qckRepReciboReimpTicketSurtidoraNew.PageNumber >= 3) then
            qckRepReciboReimpTicketSurtidoraNew.Page.Length:=26;

            frmProcVentaRapida.rxventa.DisableControls;
            frmProcVentaRapida.rxdbgrid1.Enabled:=False;
            if ((dmFactura.qryVentaFacturaDet.RecordCount >= 1) and
                ((dmFactura.qryVentaFacturaDet.RecordCount < 10)
                or (qckRepReciboReimpTicketSurtidoraNew.PageNumber = 2))) then
            begin
              frmProcVentaRapida.ProgressBar1.Visible :=True;
              frmProcVentaRapida.ProgressBar1.Position:=0;
              frmProcVentaRapida.ProgressBar1.Max:=dmFactura.qryVentaFacturaDet.RecordCount;

              repeat
              begin
                frmProcVentaRapida.ProgressBar1.stepit;
                if (qckRepReciboReimpTicketSurtidoraNew.PageNumber > 1) then
                begin
                  qckRepReciboReimpTicketSurtidoraNew.Page.Length:=qckRepReciboReimpTicketSurtidoraNew.Page.Length + 0.26;

                  qckRepReciboReimpTicketSurtidoraNew.Prepare;
                  flag:=False;
                end else break;
                if (qckRepReciboReimpTicketSurtidoraNew.PageNumber = 1) then
                break;
              end;
              until flag = true;
            end;
        end;//  (glbQckUnaPagina = 1) then
            frmProcVentaRapida.ProgressBar1.Visible:=False;
            frmProcVentaRapida.rxventa.EnableControls;
            frmProcVentaRapida.rxdbgrid1.Enabled:=True;
            dmreportes.qryViewVentasMast.Close;
            dmreportes.qryViewVentasMast.Params[0].Value:= dmFactura.qryVentaFacturaNUMERO.Value;
            dmreportes.qryViewVentasMast.Open;
            ProcSetPathlogoTipoServicio(dmReportes.qryViewVentasMastTIPO_AFILIADO.Value);

            frmProcVentaRapida.RxDBGrid1.DataSource:= frmProcVentaRapida.datasource1;
            frmProcVentaRapida.dbtext1.DataField:='Descripcion';
            frmProcVentaRapida.dbtext1.DataSource:= frmProcVentaRapida.datasource1;
            frmProcVentaRapida.dbedit1.DataSource:= frmProcVentaRapida.datasource1;
            frmProcVentaRapida.dbedit1.DataField:='Cant';
            frmProcVentaRapida.dbedit2.DataSource:= frmProcVentaRapida.datasource1;
            frmProcVentaRapida.dbedit2.DataField:='Precio';
            frmProcVentaRapida.dbedit3.DataSource:= frmProcVentaRapida.datasource1;
            frmProcVentaRapida.dbedit3.DataField:='MontoBruto';

            frmProcVentaRapida.RxDBGrid1.Visible:=True;
            dmFactura.qryVentaFacturaDet.Last;
        if (dmFactura.qryVentaFacturaDet.RecordCount >15) and (GlbImpFormatoPDF = 1) then
        begin
          frmProcVentaRapida.ImprimirEnFormatoPDF(1,6);
        end else
        begin
          dmDatos.qryImpresoras.Close;
          dmDatos.qryImpresoras.Open;
          if dmDatos.qryImpresoras.Locate('IDMODULO;IDREPORTE',
          VarArrayOf([1,6]),[]) then     //Factura/Recibo Punto Venta
          qckRepReciboReimpTicketSurtidoraNew.PrinterSettings.PrinterIndex:=
          GetImpresora(dmDatos.qryImpresorasNOMBRE_IMPRESORA.Value);

          if (GlbImpReciboSinPreg = 1) and (GlbImprimeReciboFact = 1) then
          qckRepReciboReimpTicketSurtidoraNew.Print
          else
          if MessageDlg('Imprimir?',mtInformation, [mbYes, mbNo], 0)=mryes then
          begin
            if (GlbImprimeReciboFact = 1) then
            begin
              qckRepReciboReimpTicketSurtidoraNew.PrinterSetup;
              qckRepReciboReimpTicketSurtidoraNew.Print;
            end;
          end else
          qckRepReciboReimpTicketSurtidoraNew.Preview;
          reciboImpreso:=True;
        end;
      //t if GlbImpTicketVtaAgua = 1 then
      //t ImprimirTicketVtaAgua(frmProcVentaRapida.ipStpInsertVentMast.Params[0].Value);
      finally
      qckRepReciboReimpTicketSurtidoraNew.Free;
      qckRepReciboReimpTicketSurtidoraNew:=Nil;
      end;
          end                 
            else
            begin
            qckRepFactPuntoVenta:=TqckRepFactPuntoVenta.Create(Nil);
            try
              qckRepFactPuntoVenta.QRLabel14.Enabled:=False;

            pulgadaInc:=0.86;
            //temporal
            //{
            if dmFactura.qryVentaFacturaDet.RecordCount = 1 then
            qckRepFactPuntoVenta.Page.Length:= 5
            else
            if dmFactura.qryVentaFacturaDet.RecordCount >= 2 then
            qckRepFactPuntoVenta.Page.Length:= qckRepFactPuntoVenta.Page.Length +
            (dmFactura.qryVentaFacturaDet.RecordCount - 1 ) * 0.25;

            flag:=true;
            qckRepFactPuntoVenta.Prepare;
            frmProcVentaRapida.rxventa.DisableControls;
            frmProcVentaRapida.rxdbgrid1.Enabled:=False;
            if (dmFactura.qryVentaFacturaDet.RecordCount > 1) or (qckRepFactPuntoVenta.PageNumber > 1) then
            begin
              repeat
              begin
                if (qckRepFactPuntoVenta.PageNumber > 1) then
                begin
                  qckRepFactPuntoVenta.Page.Length:=qckRepFactPuntoVenta.Page.Length + 0.25;
                  qckRepFactPuntoVenta.Prepare;
                  flag:=False;
                end else break;
              end;
              until flag = true;
            end;
            frmProcVentaRapida.rxventa.EnableControls;
            frmProcVentaRapida.rxdbgrid1.Enabled:=True;
            if frmProcVentaRapida.ImprimirRecibo1.Checked then
            begin
              qckRepFactPuntoVenta.Print;
            end else
            qckRepFactPuntoVenta.Preview;
            finally
            qckRepFactPuntoVenta.Free;
            qckRepFactPuntoVenta:=Nil;
            end;
            end;
          end;//final surtidora
        end else
        begin
          dmreportes.qryViewVentasMast.Close;

          dmreportes.qryViewVentasMast.Params[0].Value:=dmFactura.qryVentaFacturaNUMERO.Value;
          
          dmreportes.qryViewVentasMast.Open;
          ProcSetPathlogoTipoServicio(dmReportes.qryViewVentasMastTIPO_AFILIADO.Value);

          if dmReportes.qryViewVentasMastNUMERO_DOC_PAGO.IsNull  then
          frmProcVentaRapida.AbrirDatosParaTicket(false,false,
          dmReportes.qryViewVentasMastCODIGO_CTE.AsString,
          dmReportes.qryViewVentasMastNUMERO_FACTURA.AsInteger,
          dmReportes.qryViewVentasMastFECHA.Value)
          else
          frmProcVentaRapida.AbrirDatosParaTicket(false,false,
          dmReportes.qryViewVentasMastCODIGO_CTE.AsString,
          dmReportes.qryViewVentasMastNUMERO_DOC_PAGO.AsInteger,
          dmReportes.qryViewVentasMastFECHA.Value);

        qckRepReciboReimp:=TqckRepReciboReimp.Create(Nil);
        try
        if GlbImpCodProducto = 0 then
        begin
          qckRepReciboReimp.QRSubDetail1.Height := 20;
          qckRepReciboReimp.QRLabel26.Enabled := False;
          qckRepReciboReimp.QRDBText20.Enabled:= False;
        end;

        //if (dmFactura.qryVentaFacturaMONTO_EXONERADO_ITBIS.Value > 0) then
        if ((dmFactura.qryVentaFacturaMONTO_EXONERADO_ITBIS.Value > 0) or
        (frmProcVentaRapida.TotalesMontoExoneraITBIS.Value > 0)) then
        begin
          //qckRepReciboReimp.QRLabel17.Left:=13;
          qckRepReciboReimp.QRLabel17.Caption:= 'ITBIS Exonerado'
        end;
        qckRepReciboReimp.ncfDesc := GlbDescNCF;
        if Length(frmProcVentaRapida.edtObservacion.Text) > 0 then
        qckRepReciboReimp.nombreCteGenerico:=frmProcVentaRapida.edtObservacion.Text;
        if (frmProcVentaRapida.tablaPropietarioCodigoPropietario.value > 0) then
        begin
          //qckRepReciboreimp.qrLabelRNC.Caption:='RNC-' + qryClienteRNC_NUMERO.Value;
          qckRepReciboreimp.nombreCteGenerico:= frmProcVentaRapida.qryClienteNOMBRE_CTE.Value;
        end;
        //else qckRepReciboreimp.qrLabelRNC.Caption:='';
        if not GlbEsCopia then
        qckRepReciboReimp.lblcopia:= ''
        else
        qckRepReciboReimp.lblcopia:=' (COPIA)';
        qckRepReciboReimp.xtipoVenta := TipoVenta;
        qckRepReciboReimp.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;
        pulgadaInc:=0.86;
        //temporal
        //{
        dmFactura.qryVentaFacturaDet.Last;
        if dmFactura.qryVentaFacturaDet.RecordCount = 1 then
        qckRepReciboReimp.Page.Length:= 5
        else
        if dmFactura.qryVentaFacturaDet.RecordCount >= 2 then
        qckRepReciboReimp.Page.Length:= qckRepReciboReimp.Page.Length +
        (dmFactura.qryVentaFacturaDet.RecordCount - 1 ) * 0.25;

        flag:=true;
        qckRepReciboReimp.Prepare;
      //rxventa.DisableControls;
        frmProcVentaRapida.rxdbgrid1.Enabled := False;
        if frmProcVentaRapida.rxVenta.RecordCount = 1 then
        qckRepReciboReimp.Page.Length:= 5
        else
        if dmFactura.qryVentaFacturaDet.RecordCount >= 2 then
        qckRepReciboReimp.Page.Length:= qckRepReciboReimp.Page.Length +
        (dmFactura.qryVentaFacturaDet.RecordCount - 1 ) * 0.25;

        flag:= True;
        qckRepReciboReimp.Prepare;
        if (dmFactura.qryVentaFacturaDet.RecordCount > 1) OR (qckRepReciboReimp.PageNumber > 1) then
        begin
          repeat
            begin
              if (qckRepReciboReimp.PageNumber > 1) then
              begin
                qckRepReciboReimp.Page.Length:=qckRepReciboReimp.Page.Length + 0.25;
                qckRepReciboReimp.Prepare;
                flag:=False;
              end else break;
            end;
          until flag = true;
        end;
        
        frmProcVentaRapida.rxventa.EnableControls;
        frmProcVentaRapida.rxdbgrid1.Enabled:=True;
        frmProcVentaRapida.rxdbgrid1.EnableScroll;
        frmProcVentaRapida.RxDBGrid1.DataSource:= frmProcVentaRapida.datasource1;
        frmProcVentaRapida.dbtext1.DataField:='Descripcion';
        frmProcVentaRapida.dbtext1.DataSource:= frmProcVentaRapida.datasource1;
        frmProcVentaRapida.dbedit1.DataSource:= frmProcVentaRapida.datasource1;
        frmProcVentaRapida.dbedit1.DataField:='Cant';
        frmProcVentaRapida.dbedit2.DataSource:= frmProcVentaRapida.datasource1;
        frmProcVentaRapida.dbedit2.DataField:='Precio';
        frmProcVentaRapida.dbedit3.DataSource:= frmProcVentaRapida.datasource1;
        frmProcVentaRapida.dbedit3.DataField:='MontoBruto';

        frmProcVentaRapida.RxDBGrid1.Visible:=True;
        //if ImprimirRecibo1.Checked then
        //begin

        if (GlbImpReciboSinPreg = 1) and (GlbImprimeReciboFact = 1) then
        qckRepReciboReimp.Print
        else
        if MessageDlg('Imprimir?',mtInformation, [mbYes, mbNo], 0)=mryes then
        begin
          if (GlbImprimeReciboFact = 1) then
          begin
            qckRepReciboReimp.PrinterSetup;
            qckRepReciboReimp.Print;
          end;
        end else
        qckRepReciboReimp.Preview;
        reciboImpreso:=True;
        finally
        qckRepReciboReimp.Free;
        qckRepReciboReimp:=Nil;
        end;
        end;
      end else
      begin
        if dmFactura.qryVentaFactura.RecordCount = 1 then
        begin
        //Formato 5.5
        qckRepRecibo8_5_11REspReimp :=TqckRepRecibo8_5_11REspReimp.Create(nil);
        try
          qckRepRecibo8_5_11REspReimp.Prepare;
          glbTPag := qckRepRecibo8_5_11REspReimp.PageNumber;
        
          if EsDevolucion then
          begin
            qckRepRecibo8_5_11REspReimp.xtipoVenta:= TipoVenta + ' (Re-Impresion)';
          end;
          qckRepRecibo8_5_11REspReimp.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;
          qckRepRecibo8_5_11REspReimp.qrtipoVenta.Caption:= '';

          dmDatos.qryImpresoras.Close;
          dmDatos.qryImpresoras.Open;
          if dmDatos.qryImpresoras.Locate('IDMODULO;IDREPORTE',
          VarArrayOf([1,5]),[]) then     //Factura/Recibo 8.5 x 5.5
          qckRepRecibo8_5_11REspReimp.PrinterSettings.PrinterIndex:=
          GetImpresora(dmDatos.qryImpresorasNOMBRE_IMPRESORA.Value);

          if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
          begin
            qckRepRecibo8_5_11REspReimp.PrinterSetup;
            qckRepRecibo8_5_11REspReimp.Print;
          end else
          qckRepRecibo8_5_11REspReimp.Preview;
        finally
        qckRepRecibo8_5_11REspReimp.free;
        qckRepRecibo8_5_11REspReimp:=Nil;
        end;
      end;
      end;
    end else
    if (GlbRec3Pulg = 1) And (Glbcolmado = 1) then
    begin
      frmProcVentaRapida.RxDBGrid1.DataSource:= frmProcVentaRapida.datasource3;
      frmProcVentaRapida.dbtext1.DataField:='';
      frmProcVentaRapida.dbtext1.DataSource:= frmProcVentaRapida.datasource3;
      frmProcVentaRapida.dbedit1.DataField:='';
      frmProcVentaRapida.dbedit1.DataSource:= frmProcVentaRapida.datasource3;
      frmProcVentaRapida.dbedit2.DataField:='';
      frmProcVentaRapida.dbedit2.DataSource:= frmProcVentaRapida.datasource3;
      frmProcVentaRapida.dbedit3.DataField:='';
      frmProcVentaRapida.dbedit3.DataSource:= frmProcVentaRapida.datasource3;
      dmreportes.qryViewVentasMast.Close;
      dmreportes.qryViewVentasMast.Params[0].Value:= dmFactura.qryVentaFacturaNUMERO.Value;
      dmreportes.qryViewVentasMast.Open;
      ProcSetPathlogoTipoServicio(dmReportes.qryViewVentasMastTIPO_AFILIADO.Value);

        frmProcVentaRapida.RxDBGrid1.DataSource:= frmProcVentaRapida.datasource1;
        frmProcVentaRapida.dbtext1.DataField:='Descripcion';
        frmProcVentaRapida.dbtext1.DataSource:= frmProcVentaRapida.datasource1;
        frmProcVentaRapida.dbedit1.DataSource:= frmProcVentaRapida.datasource1;
        frmProcVentaRapida.dbedit1.DataField:='frmProcVentaRapida.Cant';
        frmProcVentaRapida.dbedit2.DataSource:= frmProcVentaRapida.datasource1;
        frmProcVentaRapida.dbedit2.DataField:='Precio';
        frmProcVentaRapida.dbedit3.DataSource:= frmProcVentaRapida.datasource1;
        frmProcVentaRapida.dbedit3.DataField:='MontoBruto';
        frmProcVentaRapida.RxDBGrid1.Visible:=True;

      //if (GlbUsaPUnidadLevel = 1 ) then
      //begin
        TipoVenta:='CONTADO';
        if dmReportes.qryViewVentasMastForma_pago.AsInteger in [7,8] then
        TipoVenta := 'CREDITO'
        else
        if dmReportes.qryViewVentasMastForma_pago.value = 1 then
        TipoVenta := 'CONTADO';

        if (TipoVenta = 'CONTADO') then
        frmProcVentaRapida.AbrirDatosParaTicket(false,false,dmReportes.qryViewVentasMastCODIGO_CTE.AsString,dmReportes.qryViewVentasMastNUMERO_DOC_PAGO.AsInteger,
        dmReportes.qryViewVentasMastFECHA.Value)
        else
        if (TipoVenta = 'CREDITO') then     
        frmProcVentaRapida.AbrirDatosParaTicket(false,true,dmReportes.qryViewVentasMastCODIGO_CTE.AsString,dmReportes.qryViewVentasMastNUMERO_FACTURA.AsInteger,
        dmReportes.qryViewVentasMastFECHA.Value);
        qckRepReciboReimpTicketSurtidoraNew:=TqckRepReciboReimpTicketSurtidoraNew.Create(Nil);
        try
        if GlbImpQREncuesta = 0 then
        begin
          if (GlbImpQREncuesta = 0) then
          qckRepReciboReimpTicketSurtidoraNew.Height:=761;

          //qckRepReciboReimpTicketSurtidoraNew.Page.Length:=6.156; //sin encuesta
          qckRepReciboReimpTicketSurtidoraNew.ChildBand14.Height:=0;
          //qckRepReciboReimpTicketSurtidoraNew.ChildBand13.HasChild:=False;
        end;
        qckRepReciboReimpTicketSurtidoraNew.SetParameterValues;
          if frmProcVentaRapida.rxspinImpCantCopias.Decimal > 0 then
          qckRepReciboReimpTicketSurtidoraNew.PrinterSettings.Copies:= StrToInt(frmProcVentaRapida.rxspinImpCantCopias.Text);
          if GlbEsCopia then
          qckRepReciboReimpTicketSurtidoraNew.strcopia :=' (COPIA)'
          else 
          qckRepReciboReimpTicketSurtidoraNew.strcopia :='';
          if GlbImpCodProducto = 0 then
          begin

          end;

          if Length(frmProcVentaRapida.edtObservacion.Text) > 0 then
          qckRepReciboReimpTicketSurtidoraNew.nombreCteGenerico:=frmProcVentaRapida.edtObservacion.Text;
          if (dmReportes.qryViewVentasMastCodigo_cte.Value > 0) then
          begin
            qckRepReciboReimpTicketSurtidoraNew.qrLabelRNC.Caption:='RNC-' + frmProcVentaRapida.qryClienteRNC_NUMERO.Value;
            qckRepReciboReimpTicketSurtidoranew.nombreCteGenerico:= frmProcVentaRapida.qryClienteNOMBRE_CTE.Value;
          end
          else qckRepReciboReimpTicketSurtidoraNew.qrLabelRNC.Caption:='';
          qckRepReciboReimpTicketSurtidoraNew.xtipoVenta := TipoVenta;
          qckRepReciboReimpTicketSurtidoraNew.valorNCF   := dmReportes.qryViewVentasMastNUMERO_NCF.Value;// valorNCF;
          pulgadaInc:=0.86;
          dmFactura.qryVentaFacturaDet.Last;
          dmFactura.qryVentaFacturaDet.first;
    if (glbQckUnaPagina = 1) then
    begin
        if dmFactura.qryVentaFacturaDet.RecordCount > 20  then
        qckRepReciboReimpTicketSurtidoraNew.Page.Length:=15.1
        else
        if dmFactura.qryVentaFacturaDet.RecordCount > 29  then
        qckRepReciboReimpTicketSurtidoraNew.Page.Length:=24;

        qckRepReciboReimpTicketSurtidoraNew.Prepare;
        dmFactura.qryVentaFacturaDet.Last;

          flag:=true;

            if ((dmFactura.qryVentaFacturaDet.RecordCount >= 1) and
                ((dmFactura.qryVentaFacturaDet.RecordCount < 10)
                or (qckRepReciboReimpTicketSurtidoraNew.PageNumber >= 2))) then
            begin
              frmProcVentaRapida.ProgressBar1.Visible :=True;
              frmProcVentaRapida.ProgressBar1.Position:=0;
              frmProcVentaRapida.ProgressBar1.Max:=dmFactura.qryVentaFacturaDet.RecordCount;

              repeat
              begin
                frmProcVentaRapida.progressbar1.stepit;
                //cRc:=cRc + 1;
                if (qckRepReciboReimpTicketSurtidoraNew.PageNumber > 1) then
                begin
                  qckRepReciboReimpTicketSurtidoraNew.Page.Length:=qckRepReciboReimpTicketSurtidoraNew.Page.Length + 0.26;

                  qckRepReciboReimpTicketSurtidoraNew.Prepare;
                  flag:=False;
                end else break;
                if (qckRepReciboReimpTicketSurtidoraNew.PageNumber = 1) then
                break;
              end;
              until flag = true;
            end;

        end;//if (glbQckUnaPagina = 1) then

        frmProcVentaRapida.ProgressBar1.Visible:=False;
        dmFactura.qryVentaFacturaDet.Last;
        if (dmFactura.qryVentaFacturaDet.RecordCount >15) and (GlbImpFormatoPDF = 1) then
        begin
          frmProcVentaRapida.ImprimirEnFormatoPDF(1,6);
        end else
        begin
          dmDatos.qryImpresoras.Close;
          dmDatos.qryImpresoras.Open;
          if dmDatos.qryImpresoras.Locate('IDMODULO;IDREPORTE',
          VarArrayOf([1,6]),[]) then     //Factura/Recibo Punto Venta
          qckRepReciboReimpTicketSurtidoraNew.PrinterSettings.PrinterIndex:=
          GetImpresora(dmDatos.qryImpresorasNOMBRE_IMPRESORA.Value);

          if (GlbImpReciboSinPreg = 1) and (GlbImprimeReciboFact = 1) then
          qckRepReciboReimpTicketSurtidoraNew.Print
          else
          if MessageDlg('Imprimir?',mtInformation, [mbYes, mbNo], 0)=mryes then
          begin
            if (GlbImprimeReciboFact = 1) then
            begin
              qckRepReciboReimpTicketSurtidoraNew.PrinterSetup;
              qckRepReciboReimpTicketSurtidoraNew.Print;
            end;
          end else
          qckRepReciboReimpTicketSurtidoraNew.Preview;
          reciboImpreso:=True;
        end;
      //t if GlbImpTicketVtaAgua = 1 then
      //t ImprimirTicketVtaAgua(frmProcVentaRapida.ipStpInsertVentMast.Params[0].Value);
      finally
      qckRepReciboReimpTicketSurtidoraNew.Free;
      qckRepReciboReimpTicketSurtidoraNew:=Nil;
      end;
  end else
  begin
    if (GLBSam = 1) then
    begin
      ProcSetPathlogoTipoServicio(dmReportes.qryViewVentasMastTIPO_AFILIADO.Value);
    end;

    frmProcVentaRapida.AbrirDatosParaTicket(false,false,
    dmReportes.qryViewVentasMastCODIGO_CTE.AsString,
    dmReportes.qryViewVentasMastNUMERO_DOC_PAGO.AsInteger,
    dmReportes.qryViewVentasMastFECHA.Value);

    TipoVenta:='CONTADO';
    if dmReportes.qryViewVentasMastForma_pago.AsInteger in [7,8] then
      TipoVenta := 'CREDITO'
    else
    if dmReportes.qryViewVentasMastForma_pago.value = 1 then
      TipoVenta := 'CONTADO';

    if (TipoVenta = 'CONTADO') then
      frmProcVentaRapida.AbrirDatosParaTicket(false,false,dmReportes.qryViewVentasMastCODIGO_CTE.AsString,dmReportes.qryViewVentasMastNUMERO_DOC_PAGO.AsInteger,
      dmReportes.qryViewVentasMastFECHA.Value)
      else
      if (TipoVenta = 'CREDITO') then
      frmProcVentaRapida.AbrirDatosParaTicket(false,true,dmReportes.qryViewVentasMastCODIGO_CTE.AsString,dmReportes.qryViewVentasMastNUMERO_FACTURA.AsInteger,
      dmReportes.qryViewVentasMastFECHA.Value);
      qckRepReciboReimpTicketSurtidoraNew :=TqckRepReciboReimpTicketSurtidoraNew.Create(Nil);
      try
        if GlbImpQREncuesta = 0 then
        begin
          if (GlbImpQREncuesta = 0) then
          qckRepReciboReimpTicketSurtidoraNew.Height:=761;

          //qckRepReciboReimpTicketSurtidoraNew.Page.Length:=6.156; //sin encuesta
          qckRepReciboReimpTicketSurtidoraNew.ChildBand14.Height:=0;
          //qckRepReciboReimpTicketSurtidoraNew.ChildBand13.HasChild:=False;
        end;
        qckRepReciboReimpTicketSurtidoraNew.SetParameterValues;
        if frmProcVentaRapida.rxspinImpCantCopias.Decimal > 0 then
        qckRepReciboReimpTicketSurtidoraNew.PrinterSettings.Copies:= StrToInt(frmProcVentaRapida.rxspinImpCantCopias.Text);
        if GlbEsCopia then
          qckRepReciboReimpTicketSurtidoraNew.strcopia :=' (COPIA)'
        else qckRepReciboReimpTicketSurtidoraNew.strcopia :='';
        if GlbImpCodProducto = 0 then
        begin

        end;

//        qckRepReciboReimpTicketSurtidoraNew.ncfDesc := GlbDescNCF;
        if Length(frmProcVentaRapida.edtObservacion.Text) > 0 then
        qckRepReciboReimpTicketSurtidoraNew.nombreCteGenerico:=frmProcVentaRapida.edtObservacion.Text;
        if (dmReportes.qryViewVentasMastCodigo_cte.value > 0) then
        begin
          qckRepReciboReimpTicketSurtidoraNew.qrLabelRNC.Caption:='RNC-' + frmProcVentaRapida.qryClienteRNC_NUMERO.Value;
          qckRepReciboReimpTicketSurtidoraNew.nombreCteGenerico:= frmProcVentaRapida.qryClienteNOMBRE_CTE.Value;
        end
        else qckRepReciboReimpTicketSurtidoraNew.qrLabelRNC.Caption:='';
        qckRepReciboReimpTicketSurtidoraNew.xtipoVenta := TipoVenta;
        qckRepReciboReimpTicketSurtidoraNew.valorNCF   := dmReportes.qryViewVentasMastNUMERO_NCF.Value;
        //pulgadaInc:=0.86;

        dmFactura.qryVentaFacturaDet.Last;
        dmFactura.qryVentaFacturaDet.first;
      if (glbQckUnaPagina = 1) then
      begin
        if dmFactura.qryVentaFacturaDet.RecordCount = 1 then
        qckRepReciboReimpTicketSurtidoraNew.Page.Length:= 4.258
        else
        if dmFactura.qryVentaFacturaDet.RecordCount >= 2 then
        qckRepReciboReimpTicketSurtidoraNew.Page.Length:= qckRepReciboReimpTicketSurtidoraNew.Page.Length +
        (dmFactura.qryVentaFacturaDet.RecordCount - 1 ) * 0.45;

        flag:=true;
        qckRepReciboReimpTicketSurtidoraNew.Prepare;
        frmProcVentaRapida.rxventa.DisableControls;
        frmProcVentaRapida.rxdbgrid1.Enabled:=False;
        if (qckRepReciboReimpTicketSurtidoraNew.PageNumber = 2) then
        begin
          qckRepReciboReimpTicketSurtidoraNew.Page.Length:= 6.45;
        end else
        if (qckRepReciboReimpTicketSurtidoraNew.PageNumber > 2) then
        begin
          qckRepReciboReimpTicketSurtidoraNew.Page.Length:=
          qckRepReciboReimpTicketSurtidoraNew.PageNumber * 0.45;
        end;

        if (qckRepReciboReimpTicketSurtidoraNew.PageNumber >= 3) then
        qckRepReciboReimpTicketSurtidoraNew.Page.Length:=
        qckRepReciboReimpTicketSurtidoraNew.PageNumber * 8.66;

        qckRepReciboReimpTicketSurtidoraNew.Prepare;
         dmFactura.qryVentaFacturaDet.Last;
         if ((dmFactura.qryVentaFacturaDet.RecordCount >= 1) and
         ((dmFactura.qryVentaFacturaDet.RecordCount < 10)
         or (qckRepReciboReimpTicketSurtidoraNew.PageNumber = 2))) then
            begin
              frmProcVentaRapida.ProgressBar1.Visible :=True;
              frmProcVentaRapida.ProgressBar1.Position:=0;
              frmProcVentaRapida.ProgressBar1.Max:=dmFactura.qryVentaFacturaDet.RecordCount;

              repeat
              begin
                frmProcVentaRapida.progressbar1.stepit;
                //cRc:=cRc + 1;
                if (qckRepReciboReimpTicketSurtidoraNew.PageNumber > 1) then
                begin
                  qckRepReciboReimpTicketSurtidoraNew.Page.Length:=qckRepReciboReimpTicketSurtidoraNew.Page.Length + 0.26;

                  qckRepReciboReimpTicketSurtidoraNew.Prepare;
                  flag:=False;
                end else break;
                if (qckRepReciboReimpTicketSurtidoraNew.PageNumber = 1) then
                break;
              end;
              until flag = true;
            end;
      end;//if (glbQckUnaPagina = 1) then

        frmProcVentaRapida.ProgressBar1.Visible:=False;
        dmFactura.qryVentaFacturaDet.Last;
        if (dmFactura.qryVentaFacturaDet.RecordCount >15) and (GlbImpFormatoPDF = 1) then
        begin
          frmProcVentaRapida.ImprimirEnFormatoPDF(1,6);
        end else
        begin
          dmDatos.qryImpresoras.Close;
          dmDatos.qryImpresoras.Open;
          if dmDatos.qryImpresoras.Locate('IDMODULO;IDREPORTE',
          VarArrayOf([1,6]),[]) then  //Factura/Recibo Punto Venta
          qckRepReciboReimpTicketSurtidoraNew.PrinterSettings.PrinterIndex:=
          GetImpresora(dmDatos.qryImpresorasNOMBRE_IMPRESORA.Value);

          if (GlbImpReciboSinPreg = 1) and (GlbImprimeReciboFact = 1) then
             qckRepReciboReimpTicketSurtidoraNew.Print
          else
          if MessageDlg('Imprimir?',mtInformation, [mbYes, mbNo], 0)=mryes then
          begin
            if (GlbImprimeReciboFact = 1) then
            begin
              qckRepReciboReimpTicketSurtidoraNew.PrinterSetup;
              qckRepReciboReimpTicketSurtidoraNew.Print;
            end;
            end else
            qckRepReciboReimpTicketSurtidoraNew.Preview;
            reciboImpreso:=True;
          end;
          //t if GlbImpTicketVtaAgua = 1 then
          //t ImprimirTicketVtaAgua(frmProcVentaRapida.ipStpInsertVentMast.Params[0].Value);
          finally
          qckRepReciboReimpTicketSurtidoraNew.Free;
          qckRepReciboReimpTicketSurtidoraNew:=Nil;
        end;
      end;
end;


procedure ProcSetPathlogoTipoServicio(tipo:smallint);
begin
  if (GLBSAM = 0) then Exit;
  if frmProcVentaRapida.qryLogoTipoAfiliado.Locate('IDTIPO', tipo,[]) then
  GlbLogoServSam:=frmProcVentaRapida.qryLogoTipoAfiliadoruta_logo.Value
  else
  if frmProcVentaRapida.qryLogoTipoAfiliado.Locate('IDTIPO', 1,[]) then
  GlbLogoServSam:=frmProcVentaRapida.qryLogoTipoAfiliadoruta_logo.Value;
end;

procedure ImprimirFacturaRepuesto(numTran: Integer);
begin
  //ImpPDF := False;
  GlbEsCopia:=False;
  if dmFactura.qryVentaFactura.recordCount = 0 then
  begin
     MessageDlg('Numero trans '+inttostr(numtran)+' no encontrado, verifique.', mtInformation, [mbok], 0);
     Exit;
  end;
  dmCompania.tblCompania.Close;
  dmCompania.tblCompania.Open;
  dmCompania.tblCompania.Locate('codigo',glbCia_Key,[]);
  dmfactura.qryFactReimpMaster.Close;
  if (numTRaN = 0) then
  begin
    dmfactura.qryFactReimpMaster.Params[0].Value:= StrToInt(InputBox('Re-Imprimir factura de','Entre número',''));
    GlbEsCopia:=True;
  end else
  dmfactura.qryFactReimpMaster.Params[0].Value:= numTRaN;

  dmfactura.qryFactReimpMaster.Open;
  //TipoVenta := 'CREDITO';
  dmfactura.qryFactReimpDet.Close;
  dmfactura.qryFactReimpDet.Params[0].Value:=dmfactura.qryFactReimpMaster.Params[0].Value;
  dmfactura.qryFactReimpDet.Open;
  dmfactura.qryFactReimpDet.Last;
  //tRecordsDet := dmfactura.qryFactReimpDet.RecordCount;
  dmfactura.qryFactReimpDet.Close;

  dmfactura.qryFactReimpMaster.Open;
  if (Length(dmFactura.qryVentaFacturaNUMERO_NCF.Value) > 0) and
     (Length(dmFactura.qryVentaFacturaDESCRIPCION_NCF.Value) = 0) then
  begin
    dmFactura.qryVentaFactura.Close;
    dmFactura.qryVentaFactura.Open;
    //dmFactura.qryVentaFacturaDetDESC_TIPO_NCF.Value;
  end;

  frmProcVentaRapida.qryCtes.Close;
  frmProcVentaRapida.qryCtes.Open;

  if frmProcVentaRapida.qryCtes.Locate('CODIGO_CTE', dmFactura.qryVentaFacturaCODIGO_CTE.Value,[]) then
    glbcodVendedor:=frmProcVentaRapida.qryCtesCOD_VENDEDOR.Value
  else
  glbcodVendedor:= VarUsuarioGlb;

  frmProcVentaRapida.LlenarrxSolDatoscte(dmFactura.qryVentaFacturaCODIGO_CTE.Value);
  //begin //dmfactura.qryVentaFactura.sql.text
  dmreportes.qryViewVentasMast.Close;
    dmreportes.qryViewVentasMast.Params[0].Value:= dmfactura.qryVentaFacturaNUMERO.Value;
    dmreportes.qryViewVentasMast.Open;

    ProcSetPathlogoTipoServicio(dmReportes.qryViewVentasMastTIPO_AFILIADO.Value);
    //preguntar aqui tipo de factura a imprimir
    if GlbFactRecurrente and (GLBECOM = 1) then
    begin
      QckFactServ_8_5ECom:=TQckFactServ_8_5ECom.Create(Nil);
      try
        QckFactServ_8_5ECom.rxVendedor.Close;
        QckFactServ_8_5ECom.rxVendedor.Open;
        if dmreportes.qryCantVendedoresSamCANTVENDEDORES.Value = 1 then
        begin
          if frmProcVentaRapida.qryEmpleado.Locate('codigo', dmreportes.qryViewVentasDetCodigo_Vendedor.Value,[]) then
          begin
            QckFactServ_8_5ECom.rxVendedor.Append;
            QckFactServ_8_5ECom.rxVendedorNombreVendedor.Value:=
            frmProcVentaRapida.qryEmpleadoNOMBREVENDEDOR.Value;
            QckFactServ_8_5ECom.rxVendedor.Post;
          end;
          end else
          begin
            QckFactServ_8_5ECom.rxVendedor.Close;
            QckFactServ_8_5ECom.rxVendedor.Open;
            QckFactServ_8_5ECom.rxVendedor.Append;
            QckFactServ_8_5ECom.rxVendedorNombreVendedor.Value:='';
            QckFactServ_8_5ECom.rxVendedor.Post;
          end;
          QckFactServ_8_5ECom.TPag.Caption:=
          IntToStr(QckFactServ_8_5ECom.PageNumber);
          QckFactServ_8_5ECom.xtipoVenta := TipoVenta;
          //QckFactServ_8_5ECom.valorNCF:= valorNCF;
          if dmReportes.qryViewVentasMastMONTO_EXONERADO_ITBIS.Value > 0 then
          begin
            //qckFactServ8_5Ayaco.QRLabel25.left:=505;
            QckFactServ_8_5ECom.QRLabel25.Caption :='ITBIS Exonerado';
          end  else
          QckFactServ_8_5ECom.QRLabel25.Caption :='ITBIS';

          GLBMostrarArchivo:=False;
          if not dmReportes.qryViewVentasMastNUMERO_FACTURA.IsNull then
          ReportExportPDF(QckFactServ_8_5ECom,GlbRutaFacturas+'\Facturas'+IntToStr(dmReportes.qryViewVentasMastNUMERO_FACTURA.Value)+'.pdf')
          else
            ReportExportPDF(QckFactServ_8_5ECom,GlbRutaFacturas+'\Facturas'+IntToStr(dmReportes.qryViewVentasMastNUMERO_DOC_PAGO.AsInteger)+'.pdf')

      finally
      QckFactServ_8_5ECom.Free;
      QckFactServ_8_5ECom:=Nil;
      end;
      Exit;
    end else
    if (GLBECOM = 1) then   //Elias comunicaciones Santiago
    begin
      if (GlbFormatoConduce = 333) and (reimpConduce) then //ECom
      begin
        qckRepConduceECom:=TqckRepConduceECom.Create(Nil);
        try
          qckRepConduceECom.Preview;
        finally
        qckRepConduceECom.free;
        qckRepConduceECom:=nil;
        end;
        exit;//cuando es reimprime
      end;
      //end else
      begin
        QckFactServ_8_5ECom:=TQckFactServ_8_5ECom.Create(Nil);
          try
            QckFactServ_8_5ECom.rxVendedor.Close;
            QckFactServ_8_5ECom.rxVendedor.Open;
            if dmreportes.qryCantVendedoresSamCANTVENDEDORES.Value = 1 then
            begin
              if frmProcVentaRapida.qryEmpleado.Locate('codigo', dmreportes.qryViewVentasDetCodigo_Vendedor.Value,[]) then
              begin
                QckFactServ_8_5ECom.rxVendedor.Append;
                QckFactServ_8_5ECom.rxVendedorNombreVendedor.Value:=
                frmProcVentaRapida.qryEmpleadoNOMBREVENDEDOR.Value;
                QckFactServ_8_5ECom.rxVendedor.Post;
              end;
            end else
            begin
              QckFactServ_8_5ECom.rxVendedor.Close;
              QckFactServ_8_5ECom.rxVendedor.Open;
              QckFactServ_8_5ECom.rxVendedor.Append;
              QckFactServ_8_5ECom.rxVendedorNombreVendedor.Value:='';
              QckFactServ_8_5ECom.rxVendedor.Post;
            end;
            QckFactServ_8_5ECom.TPag.Caption:=
            IntToStr(QckFactServ_8_5ECom.PageNumber);
            QckFactServ_8_5ECom.xtipoVenta := TipoVenta;
            //QckFactServ_8_5ECom.valorNCF:= valorNCF;
            if dmReportes.qryViewVentasMastMONTO_EXONERADO_ITBIS.Value > 0 then
            begin
              //qckFactServ8_5Ayaco.QRLabel25.left:=505;
              QckFactServ_8_5ECom.QRLabel25.Caption :='ITBIS Exonerado';
            end  else
            QckFactServ_8_5ECom.QRLabel25.Caption :='ITBIS';

            if (GlbImpReciboSinPreg = 1) then
              QckFactServ_8_5ECom.Print
              else
            if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
            begin
              //QckFactServ_8_5ECom.QRImage2.Enabled:= False;
              QckFactServ_8_5ECom.PrinterSetup;
              QckFactServ_8_5ECom.Print;
            end else
            QckFactServ_8_5ECom.Preview;

            if (GlbImpReciboSinPreg = 0) then
            if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
            begin
              QckFactServ_8_5ECom.Preview;
            end;

            if GlbImpPDF then
            begin
              if not dmReportes.qryViewVentasMastNUMERO_FACTURA.IsNull then
              ReportExportPDF(QckFactServ_8_5ECom,GlbRutaRecibos+'\Recibos'+IntToStr(dmReportes.qryViewVentasMastNUMERO_FACTURA.Value)+'.pdf')
              else
              ReportExportPDF(QckFactServ_8_5ECom,GlbRutaRecibos+'\Recibos'+IntToStr(dmReportes.qryViewVentasMastNUMERO_DOC_PAGO.AsInteger)+'.pdf')
            end;
          finally
          QckFactServ_8_5ECom.Free;
          QckFactServ_8_5ECom:=Nil;
          end;
        end;
          exit;
        end;

      //depurado
      QCKFactRepuesto8x5_5:=TQCKFactRepuesto8x5_5.Create(Nil);
      try
        if GlbEsCopia then
        QCKFactRepuesto8x5_5.xtipoVenta := TipoVenta +' (Copia)'
        else QCKFactRepuesto8x5_5.xtipoVenta := TipoVenta;
        QCKFactRepuesto8x5_5.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;
        if (GlbImpReciboSinPreg = 1) then
           QCKFactRepuesto8x5_5.Print
        else
        begin
          frmProcVentaRapida.ProgressBar1.Visible:= False;
          frmImprimir:=TfrmImprimir.Create(nil);
          try
            if frmImprimir.Showmodal = mrOk then
            begin
              if frmImprimir.RadioGroup1.ItemIndex = 0 then
              QCKFactRepuesto8x5_5.Page.PaperSize := Letter;
              //if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
              if frmImprimir.RadioButton1.Checked then
              begin
                QCKFactRepuesto8x5_5.PrinterSetup;
                QCKFactRepuesto8x5_5.Print;
              end else
              QCKFactRepuesto8x5_5.Preview;
            end;
          finally
          frmImprimir.Free;
          frmImprimir:=Nil;
          end;
        end;
        if (GlbImpReciboSinPreg = 0) then
        if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
        begin
          QCKFactRepuesto8x5_5.Preview;
        end;
        if GlbImpPDF then
        if not dmFactura.qryVentaFacturaNUMERO_FACTURA.IsNull then
        ReportExportPDF(QCKFactRepuesto8x5_5,GlbRutaFacturas+'\Facturas'+IntToStr(dmFactura.qryVentaFacturaNUMERO_FACTURA.Value)+'.pdf')
        else
        if not dmFactura.qryVentaFacturaNUMERO_DOC_PAGO.IsNull then
        ReportExportPDF(QCKFactRepuesto8x5_5,GlbRutaFacturas+'\Facturas'+IntToStr(dmFactura.qryVentaFacturaNUMERO_DOC_PAGO.AsInteger)+'.pdf')

      finally
      QCKFactRepuesto8x5_5.Free;
      QCKFactRepuesto8x5_5:=Nil;
      end;       
      //en depurado

end;

procedure ReImprimeDevolucion;
var
  flag, _xflag : Boolean;

begin
  //Usado para filtrar dmfactura.qryventafactura
  GlbRutaLogoDoc:='';
  if GetFormatoTipoDoc(3,GlbRutaLogoDoc) then  //3	Devolucion Contado 8.5 Estandar
  GlbDocStandar:=1
  else
  GlbDocStandar:=0;

  if frmProcVentaRapida.rxVenta.RecordCount > 0 then
  begin
    MessageDlg('Terminar o cancelar transacción en curso.',mtInformation,[mbok],0);
    exit;
  end;
  EsReimp:=True;
  dmFactura.formaPago := 6;//Devolucion
  if UProcesarDevolucion.SolNum then
  UProcesarDevolucion.numeroFactura:=StrToInt(InputBox('Re-Imprimir Factura Devolución','Entre número devolución',''));
  dmCompania.tblCompania.Close;
  dmCompania.tblCompania.Open;
  dmCompania.tblCompania.Locate('codigo',glbCia_Key,[]);
  dmfactura.qryFactReimpMaster.Close;
  dmfactura.qryFactReimpMaster.Params[0].Value:=UProcesarDevolucion.numeroFactura;

  dmfactura.qryFactReimpDet.Close;
  dmfactura.qryFactReimpDet.Params[0].Value:=UProcesarDevolucion.numeroFactura;
  dmfactura.qryFactReimpDet.Open;
  dmfactura.qryFactReimpDet.Last;
  dmfactura.qryFactReimpDet.Close;

    dmfactura.qryFactReimpMaster.Open;
    frmConsultaFacturas:=TfrmConsultaFacturas.Create(Nil);
    try
      frmConsultaFacturas.rdgCredito.Checked := True;
      frmConsultaFacturas.EditN1.SetInteger(dmfactura.qryFactReimpMaster.Params[0].Value);
      dmFactura.qryVentaFactura.SQL.Text:=
      dmFactura.qryVentaFactura_0.SQL.Text + ' Where VENTAS_MAST.NUMERO_FACTURA =:numero '+
      ' And ventas_mast.cia_key =:ciakey' +
      ' And ventas_mast.FORMA_PAGO = 6' ;

      dmFactura.qryVentaFactura.Params[0].AsInteger := UProcesarDevolucion.numeroFactura;
      dmFactura.qryVentaFactura.Params[1].AsInteger := glbCia_Key;
      dmFactura.qryVentaFactura.Open;

      GlbcodVendedor:= dmFactura.qryVentaFacturaCODIGO_VENDEDOR.Value;
      if dmFactura.qryVentaFactura.RecordCount = 0 then
      begin
        if dmFactura.qryVentaFactura.RecordCount = 0 then
        begin
          _xflag := False;
          ReImpDevolucion(UProcesarDevolucion.numeroFactura,_xflag);
          if not _xflag then
          MessageDlg('Factura no existe en devolución', mtInformation, [mbok], 0);
          Exit;
        end;
      end;
      dmFactura.qryDatosTrncxc.Close;  //dmFactura.qryVentaFactura.RecordCount;
      if esContado then
      dmFactura.qryDatosTrncxc.Params[0].AsInteger:= 2
      else
      dmFactura.qryDatosTrncxc.Params[0].AsInteger:= 1;
      dmFactura.qryDatosTrncxc.Params[1].AsInteger:= dmFactura.qryVentaFacturaNUMERO_FACTURA.Value;
      //dmFactura.qryDatosTrncxc.Params[1].AsInteger:= glbCia_Key;
      dmFactura.qryDatosTrncxc.Open;//dmFactura.qryDatosTrncxc.RecordCount
      //frmConsultaFacturas.BitBtn1Click(Self);
    finally
    if Assigned(frmConsultaFacturas) then
    frmConsultaFacturas.Free;
    frmConsultaFacturas:=Nil;
    end;
      TipoVenta:= 'Devolución'+ ' (Re-Impreso)';
      if (UpperCase(GLBFormatoFactura) = 'FORMAFACOCO') then
      ImprimirFacturaRepuesto(dmfactura.qryVentaFacturaNUMERO.Value)
      else
      if (GlbDocStandar = 1) then
          begin
            dmReportes.qryViewVentasMast.Close;
            dmReportes.qryViewVentasMast.Params[0].Value:= dmFactura.qryVentaFacturanumero.value;
            dmReportes.qryViewVentasMast.Open;
            ProcSetPathlogoTipoServicio(dmReportes.qryViewVentasMastTIPO_AFILIADO.Value);
            qckFactServ_8_5Standard:=TqckFactServ_8_5Standard.Create(Nil);
            try
             if dmFactura.qryVentaFacturaMONTO_EXONERADO_ITBIS.Value > 0 then
             begin
               //qckFactServ8_5Ayaco.QRLabel25.left:=505;
               qckFactServ_8_5Standard.QRLabel25.Caption :='ITBIS Exonerado';
             end  else
             qckFactServ_8_5Standard.QRLabel25.Caption :='ITBIS';
              qckFactServ_8_5Standard.TPag.Caption:=
              IntToStr(qckFactServ_8_5Standard.PageNumber);
              qckFactServ_8_5Standard.xtipoVenta := 'Devolución';
              qckFactServ_8_5Standard.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;
              if (GlbImpReciboSinPreg = 1) then
                 qckFactServ_8_5Standard.Print
              else
              if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
              begin
                qckFactServ_8_5Standard.PrinterSetup;
                qckFactServ_8_5Standard.Print;
              end else
              qckFactServ_8_5Standard.Preview;

              if (GlbImpReciboSinPreg = 0) then
              if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
              begin
                qckFactServ_8_5Standard.Preview;
              end;
            finally
            qckFactServ_8_5Standard.Free;
            qckFactServ_8_5Standard:=Nil;
            end;
          end else
      if (GlbRec3Pulg = 1) then
      begin
        dmFactura.qryVentaFactura.Close;
        dmFactura.qryVentaFactura.Open;
        qckRepReciboDevol3Pulg:=TqckRepReciboDevol3Pulg.Create(Nil);
        try
          if GlbImpCodProducto = 1 then
          begin
            qckRepReciboDevol3Pulg.QRLabel27.Enabled := False;
            qckRepReciboDevol3Pulg.QRDBText5.Enabled:= False;
          end else
          begin
            qckRepReciboDevol3Pulg.QRLabel27.Enabled:= True;
            qckRepReciboDevol3Pulg.QRDBText5.Enabled:= True;
          end;

          if Length(frmProcVentaRapida.TotalesNombreCliente.Value) > 0 then
          frmProcVentaRapida.totales.RecordCount;
          if dmFactura.qryVentaFacturaNOMBRE_FACTURAR.IsNull then
          qckRepReciboDevol3Pulg.nombreCteGenerico := dmFactura.qryVentaFacturaNOMBRE_CLIENTE_GENERAL.Value
          else
          qckRepReciboDevol3Pulg.nombreCteGenerico := dmFactura.qryVentaFacturaNOMBRE_FACTURAR.Value;
          if Length(frmProcVentaRapida.edtObservacion.Text) > 0 then
          qckRepReciboDevol3Pulg.nombreCteGenerico := frmProcVentaRapida.edtObservacion.Text;

          qckRepReciboDevol3Pulg.xtipoVenta:= TipoVenta;
          qckRepReciboDevol3Pulg.valorNCF  := dmFactura.qryVentaFacturaNUMERO_NCF.Value;

          //qckRepReciboDevol3Pulg.qrLabelRNC.Caption := dmFactura.qryVentaFacturaRNC_NUMERO.Value;

          if frmProcVentaRapida.rxVenta.RecordCount = 1 then
          qckRepReciboDevol3Pulg.Page.Length:= 5
          else
          if frmProcVentaRapida.rxVenta.RecordCount >= 2 then
          qckRepReciboDevol3Pulg.Page.Length:= qckRepReciboDevol3Pulg.Page.Length +
          (frmProcVentaRapida.rxVenta.RecordCount - 1 ) * 0.25;

          flag:=True;
          repeat
          begin
            qckRepReciboDevol3Pulg.Prepare;
            if qckRepReciboDevol3Pulg.PageNumber > 1 then
            begin
              qckRepReciboDevol3Pulg.Page.Length := qckRepReciboDevol3Pulg.Page.Length + 0.25;
              qckRepReciboDevol3Pulg.Prepare;
              flag:=False;
            end else break;
          end;
        until flag = true;

        if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
        qckRepReciboDevol3Pulg.Print else
        qckRepReciboDevol3Pulg.Preview;
        finally
        qckRepReciboDevol3Pulg.Free;
        qckRepReciboDevol3Pulg:=Nil;
      end;
   end else
  if (dmFactura.qryVentaFacturaTIPO_FACTURA.Value = 1 ) then //
  begin
    qckFactCredArtioffice8_5_F_1:=TqckFactCredArtioffice8_5_F_1.Create(nil);
    try
      qckFactCredArtioffice8_5_F_1.Preview;
    finally
    qckFactCredArtioffice8_5_F_1.free;
    qckFactCredArtioffice8_5_F_1:=nil;
    end;
  end else
  begin
    ImpFacturaservicio(dmfactura.qryFactReimpMaster.Params[0].Value,True);
  end;
  frmProcVentaRapida.Label36.Visible:=False;
  frmProcVentaRapida.Label36.caption:='';
  frmProcVentaRapida.rdgFactServicio.Checked:=False;
end;

procedure ImprimeFactura8_5Farmacia(num: integer; tventa, valorNCF, xdir: string);
begin
  if num <= 0 then Exit;

  dmReportes.qryViewVentasMast.Close;
  if dmReportes.qryViewVentasMast.Params.Count > 0 then
    dmReportes.qryViewVentasMast.Params[0].Value := num;
  dmReportes.qryViewVentasMast.Open;

  qckFactServ8_5Farmacia := TqckFactServ8_5Farmacia.Create(nil);
  try
    qckFactServ8_5Farmacia.PrinterSettings.PrinterIndex := GetImpresorarpt(1,6);
    qckFactServ8_5Farmacia.xtipoVenta := tventa;
    qckFactServ8_5Farmacia.valorNCF := valorNCF;

    if (not dmReportes.qryViewVentasMast.IsEmpty) and
       (dmReportes.qryViewVentasMastMONTO_EXONERADO_ITBIS.Value > 0) then
      qckFactServ8_5Farmacia.QRLabel25.Caption := 'ITBIS Exonerado'
    else
      qckFactServ8_5Farmacia.QRLabel25.Caption := 'ITBIS';

    if GlbImpReciboSinPreg = 1 then
      qckFactServ8_5Farmacia.Print
    else if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
    begin
      qckFactServ8_5Farmacia.PrinterSetup;
      qckFactServ8_5Farmacia.Print;
    end
    else
      qckFactServ8_5Farmacia.Preview;

    if (GlbImpReciboSinPreg = 0) and
       (MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes) then
      qckFactServ8_5Farmacia.Preview;

    if GlbImpPDF then
    begin
      try
        if not dmReportes.qryViewVentasMastNUMERO_FACTURA.IsNull then
          ReportExportPDF(qckFactServ8_5Farmacia,
            GlbRutaFacturas + '\' + xdir +
            IntToStr(dmReportes.qryViewVentasMastNUMERO_FACTURA.Value) + '.pdf')
        else
          ReportExportPDF(qckFactServ8_5Farmacia,
            GlbRutaFacturas + '\' + xdir +
            IntToStr(dmReportes.qryViewVentasMastNUMERO_DOC_PAGO.AsInteger) + '.pdf');
      except
        on E: Exception do
          ShowMessage('Error exportando PDF: ' + E.Message);
      end;
    end;
  finally
    qckFactServ8_5Farmacia.Free;
    qckFactServ8_5Farmacia := nil;
  end;
end;
end.
