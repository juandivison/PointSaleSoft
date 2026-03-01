//Si no hay ventas en rxVenta, entonces mostrar ventana de consultas
//Si el usuario selecciona el boton de NCR entonces
//regresar a la ventana frmProcVentaRapida,
//Si el usuario vuelve y hace click en el boton BitBtn7 y
//rxVenta tiene datos, entonces crear la nota de credito
procedure TfrmProcVentaRapida.BitBtn7Click(Sender: TObject);
var
  x : Integer;
  NumTrnGen : Integer;
  NumOrden : Integer;
  _flag : Boolean;
  ncfGenYaGen, ncfGen,flag : boolean;
  xexiste,xContinua : boolean;
  xcte : integer;
begin
  if FProcesandoDevolucion then Exit;    // ? BLOQUEA REENTRADA
  FProcesandoDevolucion := True;
  BitBtn7.Enabled := False;              // ? DESHABILITA INMEDIATO

  dmDatos.qryImpresoras.Close;
  dmDatos.qryImpresoras.Open;

  if (GlbActivaIFiscal = 1) then
  if VerificaNIFTExiste then
  begin
    MessageDlg('TIENES UNA VENTA CON NIF EN T, NO PUEDES HACER MAS VENTAS.'
    +LF+CR+'PUEDES CONVERTIR ESTA VENTA COMO COTIZACION Y LUEGO LA PUEDES USAR.',mtError,[mbok],0);
    exit;
  end;

  xexiste:=false;
  EsReimp:=False;
  ncfGenYaGen:=False;
  ncfGen:=False;
  dmclientes.tblClientes.Close;
  dmclientes.tblClientes.Open;
  if tablaPropietarioCodigoPropietario.IsNull then
  begin
    tablaPropietario.Edit;
    tablaPropietarioCodigoPropietario.Value:=0;
    tablaPropietario.Post;
  end;

  if tablaPropietarioCodigoPropietario.IsNull then
  begin
    MessageDlg('Indique codigo de cliente', mtError, [mbOk], 0);
    if isShowing then
    rxdbLookupCte.SetFocus;
    Exit;
  end;

  if not dmclientes.tblClientes.Locate('CODIGO_CTE', tablaPropietarioCodigoPropietario.Value,[]) then
  begin
    try
      xcte:=1;
      if not dmclientes.tblClientes.Locate('CODIGO_CTE', xcte,[]) then
      begin
        tablaPropietario.Edit;
        tablaPropietarioCodigoPropietario.Value:=0;
        tablaPropietario.Post;
      end;
    except
    end;
  end;
  
  numeroTrnVta:= 0;
  TotalesTipoNCFIFiscal.Value;
  TotalesTipoNCF.Value;
  if EsModificandoCotiza then Exit;

  if (rxVenta.RecordCount > 0) And (Not EsDevolucion) then
  begin
    if (TotalesSubTotal.Value <= 0) then
    begin
      MessageDlg('Total venta no puede ser cero, verifique.', mtError, [mbOk], 0);
      Exit;
    end;

    if Not tablaPropietarioCodigoPropietario.IsNull then
    GlbcodVendedor:= qryClienteCOD_VENDEDOR.Value
    else
    begin
      MessageDlg('Favor indicar cliente.', mtInformation, [mbOk],0);
      if isShowing then
      rxdbLookupCte.SetFocus;
      Exit;
    end;

    if TotalesTipoNCF.IsNull And (GlbActivaIFiscal = 1 ) then
    begin
      MessageDlg('Favor indicar Tipo Comprobante.', mtInformation, [mbok],0);
      if isShowing then
      RxDBLookupCombo3.SetFocus;
      Exit;
    end;

    if EsModificandoFactura then
    begin
      if (dmFactura.qryFactTieneDevolucion.RecordCount = 1) then
      begin
        MessageDlg('Factura tiene una devolución previa, verifique ',mtInformation,[mbok],0);
        Exit;
      end;
      if TotalesMoneda.IsNull then
      begin
        MessageDlg('Favor indicar moneda.', mtInformation, [mbok],0);
        Exit;
      end;

      if MessageDlg('Continuar con devolución factura, NCR será creada?', mtWarning,[mbYes, mbNo],0) = mrNo then
      Exit;

      if (not TotalesTipoNCF.IsNull) and (GlbActivaECF = 0) then
      begin
        if (TotalesTipoNCFIFiscal.Value = -1) then
        begin
          Totales.Edit;
          TotalesTipoNCFIFiscal.Value:= 2;//2;
          if not LlenandoDatos then
          Totales.Post;
        end else
        if (TotalesTipoNCFIFiscal.Value = 0) then
        begin
          Totales.Edit;
          TotalesTipoNCFIFiscal.Value:=dmFactura.ibQryViewNCFTIPO_NCFNCR.Value;//2;
          if not LlenandoDatos then
          Totales.Post;
        end else
        if (TotalesTipoNCFIFiscal.Value = 1) then
        begin
          Totales.Edit;
          TotalesTipoNCFIFiscal.Value:=dmFactura.ibQryViewNCFTIPO_NCFNCR.Value;//3;
          if not LlenandoDatos then
          Totales.Post;
        end else
        if (TotalesTipoNCFIFiscal.Value = 5) then
        begin
          Totales.Edit;
          TotalesTipoNCFIFiscal.Value:=dmFactura.ibQryViewNCFTIPO_NCFNCR.Value;
          if not LlenandoDatos then
          Totales.Post;
        end else
        if (TotalesTipoNCFIFiscal.Value = 4) then
        begin
          Totales.Edit;
          TotalesTipoNCFIFiscal.Value:=dmFactura.ibQryViewNCFTIPO_NCFNCR.Value;
          if not LlenandoDatos then
          Totales.Post;
        end else
        begin
          MessageDlg('No permitido', mtInformation, [mbok],0);
          Exit;
        end;
      end;
      if (GlbActivaECF = 1) then
      begin
        Totales.Edit;
        TotalesTipoNCFIFiscal.Value:=4;
        if not LlenandoDatos then
        Totales.Post;
      end;
    //Exit;//Temporal

    UProcesarDevolucion.GeneraNCF := True;
    //Crear Nota Credito
    if Not TotalesTipoNCF.IsNull then
    begin
      if GlbActivaECF = 1 then
      UProcesarDevolucion.tipoCF    := '34'
      else 
      UProcesarDevolucion.tipoCF    := '04';
      UProcesarDevolucion.GeneraNCF := True;
    end
    else
    begin

      UProcesarDevolucion.tipoCF := '-1';
      UProcesarDevolucion.GeneraNCF := False;
    end;
      if dmFactura.qryVentaFacturaCODIGO_CTE.Value > 0 then
      begin
        tablaPropietario.Edit;
        tablaPropietarioCodigoPropietario.Value:= dmFactura.qryVentaFacturaCODIGO_CTE.Value;
        tablaPropietario.Post;
      end else
      begin
        tablaPropietario.Edit;
        tablaPropietarioCodigoPropietario.Value:= 0;
        tablaPropietario.Post;
      end;

    UProcesarDevolucion.fechaTrn  := rxVentaFecha.Value;
    UProcesarDevolucion.codigo_cte:= tablaPropietarioCodigoPropietario.Value;
    if tablaPropietarioCodigoPropietario.Value > 0 then
    begin
      UProcesarDevolucion.nombrecompleto :=qryClienteNOMBRE_FACTURAR.Value;

    if Not qryClienteRNC_NUMERO.IsNull then
    UProcesarDevolucion.cedula   := qryClienteRNC_NUMERO.Value
    else
    UProcesarDevolucion.cedula   := qryClienteCEDULA.Value;

    UProcesarDevolucion.direccion:= qryClienteDIRECCION_CONT.Value;
    UProcesarDevolucion.ciudad   := qryClienteCIUDAD.Value;// '';
    end;
    UProcesarDevolucion.monto    := Totalestotalneto.Value;
    UProcesarDevolucion.status   := 'A';

    UProcesarDevolucion.codig_usuario := VarUsuarioGlb;
    UProcesarDevolucion.fechaInsert   := Now;;
    UProcesarDevolucion.fechaUpdate   := Now ;
    UProcesarDevolucion.codigousuarioupd := VarUsuarioGlb;
    UProcesarDevolucion.tipodoc := 5; //Nota Credito
    UProcesarDevolucion.Moneda  := Trim(TotalesMoneda.Value);
    UProcesarDevolucion.numeroFactura := rxVentaNumeroFactura.Value;

    //if (not TotalesTipoNCF.IsNull) then
    if TotalesTipoNCFIFiscal.IsNull then
    UProcesarDevolucion.GeneraNCF:= False
    else
    UProcesarDevolucion.GeneraNCF:= True;

    if dmFactura.qryVentaFacturaFORMA_PAGO.Value in [7,8,15] then
    UProcesarDevolucion.UpdateBLCCXC  := True
    else
    UProcesarDevolucion.UpdateBLCCXC  := False;
    BitBtn7.Enabled:=False;//Evitar duplicar devolucion por varios click
    if GlbActivaECF = 1 then
    begin
      if UProcesarDevolucion.GeneraNCF then
        UProcesarDevolucion.Ejecutar('34', TotalesTipoNCFIFiscal.Value, dmFactura.qryVentaFacturaNUMERO.Value) //Comprobante Fiscal Nota de Credito
    end else
    begin
      if UProcesarDevolucion.GeneraNCF then
      UProcesarDevolucion.Ejecutar('04', TotalesTipoNCFIFiscal.Value, dmFactura.qryVentaFacturaNUMERO.Value) //Comprobante Fiscal Nota de Credito
      else
      UProcesarDevolucion.Ejecutar(' ', -1, dmFactura.qryVentaFacturaNUMERO.Value);
    end;
    rxVenta.DisableControls; //dmFactura.qryVentaFacturaNUMERO_NCF.Value
    rxVenta.First;
    if rxVentaglbcodVendedor.Value > 0 then
    GlbcodVendedor:= rxVentaglbcodVendedor.Value;
    //ActualizaVentaMaster('6', UProcesarDevolucion.seriencfasignado);//Devolucion
    ProcInsertarVtaMastEnDevolucion(UProcesarDevolucion.seriencfasignado);
    rxVenta.First;
    While Not rxVenta.Eof Do
    begin
      ibStpActualizaInvProd.Params[0].Value:= rxVentaCodArticulo.Value;
      if (GlbUsaPUnidadLevel = 1) then
      ibStpActualizaInvProd.Params[1].Value:= rxVentaCant.Value * CantUnidad
      else
      ibStpActualizaInvProd.Params[1].Value:= rxVentaCant.Value;
      ibStpActualizaInvProd.Params[2].Value:= 1;//tipoTrn
      ibStpActualizaInvProd.Params[3].Value:= 1;//porCodigo

      if (rxVentaInvetariar.Value <> 0) And (GlbCodDivInventario = 1) then
      ibStpActualizaInvProd.ExecProc;

      if Not ibStpActualizaInvProd.Transaction.InTransaction then
      ibStpActualizaInvProd.Transaction.StartTransaction;
      try
        ibStpActualizaInvProd.Transaction.CommitRetaining;
      except
      ibStpActualizaInvProd.Transaction.RollbackRetaining;
      end;

      InsertarDetDevolucion(ipStpInsertVentMast.Params[0].Value);
      //ActualizaInvAlmacen;

      rxVenta.Next;
    end;
    //6	Devolucion
    if (GlbMutur = 1) then
    DescargarVehiculoDev(dmFactura.qryVentaFacturaNUMERO.Value);
   //Usado para filtrar dmfactura.qryventafactura
   dmFactura.formaPago := 6;//Devolucion
              
   dmCompania.tblCompania.Close;
   dmCompania.tblCompania.Open;
   dmCompania.tblCompania.Locate('codigo', glbCia_Key,[]);
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
      ' and VENTAS_MAST.Codigo_cte =:codcte  And ventas_mast.cia_key =:ciakey' +
      ' and ventas_mast.FORMA_PAGO = 6' ;

      dmFactura.qryVentaFactura.Params[0].AsInteger := UProcesarDevolucion.numeroFactura;
      dmFactura.qryVentaFactura.Params[1].AsInteger := UProcesarDevolucion.codigo_cte;
      dmFactura.qryVentaFactura.Params[2].AsInteger := glbCia_Key;
      dmFactura.qryVentaFactura.Open;
      frmConsultaFacturas.rdgCredito.Checked := false;
      frmConsultaFacturas.EditN1.SetInteger(UProcesarDevolucion.numeroFactura);

      frmConsultaFacturas.BitBtn1Click(Self);
      dmFactura.qryDatosTrncxc.Close;  //dmFactura.qryVentaFactura.RecordCount;
      //t dmFactura.qryDatosTrncxc.Params[0].AsInteger:= dmFactura.qryVentaFacturaNUMERO_FACTURA.Value;
      //t dmFactura.qryDatosTrncxc.Params[1].AsInteger:= glbCia_Key;

      if esContado then
      dmFactura.qryDatosTrncxc.Params[0].AsInteger:= 2
      else
      dmFactura.qryDatosTrncxc.Params[0].AsInteger:= 1;
      dmFactura.qryDatosTrncxc.Params[1].AsInteger:= dmFactura.qryVentaFacturaNUMERO_FACTURA.Value;
      dmFactura.qryDatosTrncxc.Open;

      dmReportes.qryDatosVentaMaster.Close;
      dmReportes.qryDatosVentaMaster.Params[0].Value:= numeroTrnVta; //dmFactura.qryVentaFacturaNumero.Value;
      dmReportes.qryDatosVentaMaster.Open;

    finally              

    if Assigned(frmConsultaFacturas) then
    frmConsultaFacturas.Free;
    frmConsultaFacturas:=Nil;
    end;

    if (GlbActivaIFiscal = 1 ) then
    begin
      dmdatos.qryConfCajaXusuario.Close;
      dmdatos.qryConfCajaXusuario.Open;
      dmdatos.qryConfCajaXusuario.Locate('COD_EMPLEADO', VarUsuarioGlb,[]);

      dmReportes.qryDatosCajaImpUser.Close;
      dmReportes.qryDatosCajaImpUser.Params[0].Value:= VarUsuarioGlb;
      dmReportes.qryDatosCajaImpUser.Open;
      dmReportes.qryDatosCajaImpUser.Last;
      dmReportes.qryDatosCajaImpUser.RecordCount;

      if (dmFactura.qryVentaFacturaFORMA_PAGO.Value in [7,8]) then
      begin
         dmFactura.qryVentaFacturaNUMERO_FACTURA.Value
      end;

      GlbNombreFiletoPrint:= Format('%s%s%s%s%s%s%s',[dmReportes.qryDatosCajaImpUserRUTA_TICKET.Value,'\NotaCredito',Trim(GlbCodSucursal),Trim(GlbModeloImpresora),
      IntToStr(VarUsuarioGlb),StrLeftPad(IntToStr(dmFactura.qryVentaFacturaNUMERO.Value),8),'.txt']);
      //Chequear parametros para nota de credito
      //dmFactura.qryDatosTrncxcNUM_DOC.Value
      dmdatos.qryConfCajaXusuario.Close;
      dmdatos.qryConfCajaXusuario.Open;
      dmdatos.qryConfCajaXusuario.Locate('COD_EMPLEADO',VarUsuarioGlb,[]);

      dmReportes.qryDatosCajaImpUser.close;
      dmReportes.qryDatosCajaImpUser.Params[0].Value:= VarUsuarioGlb;
      dmReportes.qryDatosCajaImpUser.Open;
      dmReportes.qryDatosCajaImpUser.Last;
      dmReportes.qryDatosCajaImpUser.RecordCount;

      PrepararInfoFiscalNCR(numeroTrnVta);
      if (dmFactura.qryDatosTrncxcNOMBRE_FACTURAR.IsNull) then
      begin
        MessageDlg('Se requiere Razon Social para Nota de Crédito, verifique.', mtError, [mbOk], 0);
        Exit;
      end;

      dmFactura.qryGetNcfAsignado.Close;
      if esContado then //contado
      dmFactura.qryGetNcfAsignado.SQL.Text:=dmFactura.qryGeNcfAsignado_1.SQL.Text
      else
      dmFactura.qryGetNcfAsignado.SQL.Text:=dmFactura.qryGetNcfAsignado_0.SQL.Text;
      //if esContado then
      dmFactura.qryGetNcfAsignado.Params[0].Value:= dmReportes.qryViewVentasMastNUMERO.Value;
      //else
      //dmFactura.qryGetNcfAsignado.Params[0].Value:= dmFactura.qryVentaFacturaNUMERO.Value;
      //USADO PARA VER VALORES PARA TICKET FISCAL
      dmFactura.qryGetNcfAsignado.Open;
      dmFactura.qryVentaFactura.Last;

      dmreportes.qryNCFAfectado.Close;
      dmreportes.qryNCFAfectado.Params[0].Value:= dmReportes.qryViewVentasMastSERIE_NCF_ASIGNADO.Value;
      dmreportes.qryNCFAfectado.Open;
      //t frmInfoParaTicketFiscal.Showmodal;

      if (dmReportes.qryViewVentasMastNUMERO_NCF.Isnull) then
      begin
        MessageDlg('Se requiere NCF afectado para Nota de Crédito, verifique.', mtError, [mbOk], 0);
        Exit;
      end;
      if (dmfactura.qryDatosTrncxc.State = dsInactive) then
      begin
        dmFactura.qryDatosTrncxc.Params[0].AsInteger:= 1;
        dmFactura.qryDatosTrncxc.Params[1].AsInteger:= dmReportes.qryViewVentasMastNUMERO_FACTURA.Value;
        dmFactura.qryDatosTrncxc.Open;
      end;
      if (dmfactura.qryDatosTrncxc.RecordCount = 0) then
      begin
        MessageDlg('Nota de Crédito no disponible para impresión, verifique.', mtError, [mbOk], 0);
        Exit;
      end else
      begin
        frmTestImpresoraFiscal:= TfrmTestImpresoraFiscal.Create(Nil);
        try
          frmTestImpresoraFiscal.ncfAfectado := dmReportes.qryViewVentasMastNUMERO_NCF.Value;
          frmTestImpresoraFiscal.LCantCopias := rxspinImpCantCopias.Text;
          frmTestImpresoraFiscal.BitBtn1Click(Self);

          ProcInsFiscalCtrl(dmReportes.qryViewVentasMastNUMERO.Value,
          dmReportes.qryViewVentasMastFECHA.Value,xexiste);

          frmTestImpresoraFiscal.btnImprimeReciboClick(Self);
          Sleep(4000);
          repeat
            ProcInsFiscalCtrl(dmReportes.qryViewVentasMastNUMERO.Value,
            dmReportes.qryViewVentasMastFECHA.Value,xexiste);
          until not GlbImprimiendo;

        finally
        frmTestImpresoraFiscal.Free;
        frmTestImpresoraFiscal:= Nil;
      
        if (GlbNumVtaPOS > 0) then
        dmcalculos.ProcDeletePosExtraDet(GlbNumVtaPOS);
        GlbNumVtaPOS:=-1;

        ReactivarValores;
        end;
      end;
      BitBtn17.Enabled:=True;
      BitBtn11.Enabled:=True;
      BitBtn15.Enabled:=True;
      BitBtn18.Enabled:=True;
      BitBtn19.Enabled:=True;
      EsModificandoFactura    :=False;
      GlbUsandoCotiza :=False;
      bitBtnEditarFact.Visible:=False;
      bitBtnEditarFact.Top := BitBtn6.Top;
      bitBtnEditarFact.SendToBack;
      Label36.Visible:=False;
      ActivarBotonesEnModifica;
      tablaPropietario.Close;
      tablaPropietario.Open;
      lblFechaCotizacion.Visible:=False;
      dbFechaCotizacion.Visible:=False;
      EsModificandoCotiza:=False;
      EsDevolucion := False;
     _NumeroCotiza:=-1;
      glbcodVendedor := -1;
      GlbNumeroTrn:=-1;
      lblFechaCotizacion.Visible:= False;
      dbFechaCotizacion.Visible := False;
      Label36.Visible := False;
      Label36.caption:='';
      BitBtn7.Enabled:=True;
      FProcesandoDevolucion:=False
      Application.ProcessMessages;
    end else  //imprimir devolucion
    begin
      if (dmFactura.qryVentaFacturaTIPO_FACTURA.Value = 6 ) or
      (dmFactura.formaPago = 6 ) then
      begin
        LlenarrxSolDatoscte(dmFactura.qryVentaFacturaCODIGO_CTE.Value);
       if (UpperCase(GLBFormatoFactura) = 'FORMAFACOCO') then
       UImpresionVentas.ImprimirFacturaRepuesto(dmfactura.qryFactReimpMaster.Params[0].Value)
       ELSE
        if ((UpperCase(GLBFormatoFactura) = 'CASANDRA2') or (UpperCase(GLBFormatoFactura) = 'FORMATOGENERAL'))
        and ((GlBAyaco = 0) and (GlBBurgos = 0)) and ((GlbRec3Pulg = 0) or (GlbFact55Pulg = 1))then
        begin
          qckRepRecibo8_5_11REspReimp :=TqckRepRecibo8_5_11REspReimp.Create(Nil);
          try
            qckRepRecibo8_5_11REspReimp.Prepare;
            glbTPag := qckRepRecibo8_5_11REspReimp.PageNumber;

            if EsDevolucion then
            begin
              qckRepRecibo8_5_11REspReimp.xtipoVenta:= TipoVenta;
            end;
            qckRepRecibo8_5_11REspReimp.QRLabel28.Enabled:=False;
            qckRepRecibo8_5_11REspReimp.QRDBText23.Enabled:=False;
            qckRepRecibo8_5_11REspReimp.QRDBText11.Enabled:=False;

            if not dmReportes.qryViewVentasMastNUMERO_NCF.IsNull then
            qckRepRecibo8_5_11REspReimp.valorNCF:= qckRepRecibo8_5_11REspReimp.valorNCF
            else
            qckRepRecibo8_5_11REspReimp.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;
            //qckRepRecibo8_5_11REspReimp.qrtipoVenta.Caption:= 'NOTA CREDITO';
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
          EsModificandoCotiza:= False;
          label36.Caption    := '';
          NoTieneCredito     := False;
          //Refresh;
          EsDevolucion       := False;
          BitBtn6.Enabled := True;
          BitBtn6.BringToFront;
        end else
        if (GlbFacturaLicoreria =1) then
        begin
          //qckRepRecibo8_5_11REsp:=TqckRepRecibo8_5_11REsp.Create(Nil); //ANTERIOR SEP 13 2015
          qckRepRecibo8_5_11REsp := TqckRepRecibo8_5_11REsp.Create(Nil);
          try
            if GlbSizeFact8x11 = 1 then
            qckRepRecibo8_5_11REsp.Page.Length := 11;
            qckRepRecibo8_5_11REsp.xtipoVenta := 'NOTA CREDITO';
            qckRepRecibo8_5_11REsp.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;

            qckRepRecibo8_5_11REsp.Prepare;
            glbTPag := qckRepRecibo8_5_11REsp.PageNumber;
            if (GlbImprimeReciboFact = 1) then
            begin
              if ImprimirRecibo1.Checked then
              begin
                qckRepRecibo8_5_11REsp.PrinterSetup;
                qckRepRecibo8_5_11REsp.Print;
              end else
              qckRepRecibo8_5_11REsp.Preview;
            end;
          finally
          qckRepRecibo8_5_11REsp.Free;
          qckRepRecibo8_5_11REsp:=Nil;
          end;
        end else
        begin
          //if GlbRec3Pulg = 1 then
          //begin
            //put here
          //end else
        TipoVenta:= 'Devolución';
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

          if Length(TotalesNombreCliente.Value) > 0 then
          totales.RecordCount;
          if dmFactura.qryVentaFacturaNOMBRE_FACTURAR.IsNull then
          qckRepReciboDevol3Pulg.nombreCteGenerico := dmFactura.qryVentaFacturaNOMBRE_CLIENTE_GENERAL.Value
          else
          qckRepReciboDevol3Pulg.nombreCteGenerico := dmFactura.qryVentaFacturaNOMBRE_FACTURAR.Value;
          if Length(edtObservacion.Text) > 0 then
          qckRepReciboDevol3Pulg.nombreCteGenerico := edtObservacion.Text;

          qckRepReciboDevol3Pulg.xtipoVenta:= TipoVenta;
          qckRepReciboDevol3Pulg.valorNCF  := dmFactura.qryVentaFacturaNUMERO_NCF.Value;

          //qckRepReciboDevol3Pulg.qrLabelRNC.Caption := dmFactura.qryVentaFacturaRNC_NUMERO.Value;

          if rxVenta.RecordCount = 1 then
          qckRepReciboDevol3Pulg.Page.Length:= 5
          else
          if rxVenta.RecordCount >= 2 then
          qckRepReciboDevol3Pulg.Page.Length:= qckRepReciboDevol3Pulg.Page.Length +
          (rxVenta.RecordCount - 1 ) * 0.25;

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
      if (UpperCase(GLBFormatoFactura) = 'FORMAEXPLODISMAR') then
      begin
        UImpresionVentas.ImprimeFacturaEXDMAR(0,'DEVOLUCION',dmFactura.qryVentaFacturaNUMERO_NCF.Value,'Devolucin');
      end else
      if (GlbDocStandar = 1) then
      begin
        //qckFactServ_8_5SAM
        dmreportes.qryViewVentasMast.Close;
        dmreportes.qryViewVentasMast.Params[0].Value:= dmFactura.qryVentaFacturaNUMERO.Value;
        dmreportes.qryViewVentasMast.Open;

        UImpresionVentas.ProcSetPathlogoTipoServicio(dmReportes.qryViewVentasMastTIPO_AFILIADO.Value);

        qckFactServ_8_5Standard:=TqckFactServ_8_5Standard.Create(Nil);
           try
             //qckFactServ8_5SAM.TPag.Caption:=IntToStr(TqckFactServ8_5SAM.PageNumber);
             qckFactServ_8_5Standard.xtipoVenta := 'Devolucion';
             qckFactServ_8_5Standard.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;
             if (GlbImpReciboSinPreg = 1) then
                qckFactServ_8_5Standard.Print
              else
              if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
              begin
 //               qckFactServ_8_5Standard.QRImage2.Enabled:= False;
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
            if not dmReportes.qryViewVentasMastNUMERO_DOC_PAGO.IsNull then
            ReportExportPDF(qckFactServ_8_5Standard,GlbRutaFacturas+'\Devolucion'+IntToStr(dmReportes.qryViewVentasMastNUMERO_DOC_PAGO.AsInteger)+'.pdf')
            else
            ReportExportPDF(qckFactServ_8_5Standard,GlbRutaFacturas+'\Devolucion'+IntToStr(dmReportes.qryViewVentasMastNumeroDocCldo.AsInteger)+'.pdf')
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
            if qryEmpleado.Locate('codigo', dmreportes.qryViewVentasDetCodigo_Vendedor.Value,[]) then
            begin
              QckFactServ_8_5ECom.rxVendedor.Append;
              QckFactServ_8_5ECom.rxVendedorNombreVendedor.Value:=
              qryEmpleadoNOMBREVENDEDOR.Value;
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
              if qryEmpleado.Locate('codigo', dmreportes.qryViewVentasDetCodigo_Vendedor.Value,[]) then
              begin
                qckFactServ_8_5SAMNewMuturs.rxVendedor.Append;
                qckFactServ_8_5SAMNewMuturs.rxVendedorNombreVendedor.Value:=
                qryEmpleadoNOMBREVENDEDOR.Value;
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
            UImpresionVentas.ProcSetPathlogoTipoServicio(dmReportes.qryViewVentasMastTIPO_AFILIADO.Value);
        if (GlbUsaFctMexico = 1) then
        begin
          qckFactServ_8_5SAMNewM:=TqckFactServ_8_5SAMNewM.Create(Nil);
          try
            qckFactServ_8_5SAMNewM.rxVendedor.Close;
            qckFactServ_8_5SAMNewM.rxVendedor.Open;
            if dmreportes.qryCantVendedoresSamCANTVENDEDORES.Value = 1 then
            begin
              if qryEmpleado.Locate('codigo', dmreportes.qryViewVentasDetCodigo_Vendedor.Value,[]) then
              begin
                qckFactServ_8_5SAMNewM.rxVendedor.Append;
                qckFactServ_8_5SAMNewM.rxVendedorNombreVendedor.Value:=
                qryEmpleadoNOMBREVENDEDOR.Value;
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
            if qryEmpleado.Locate('codigo', dmreportes.qryViewVentasDetCodigo_Vendedor.Value,[]) then
            begin
              qckFactServ_8_5SAM.rxVendedor.Append;
              qckFactServ_8_5SAM.rxVendedorNombreVendedor.Value:=
              qryEmpleadoNOMBREVENDEDOR.Value;
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
            ReportExportPDF(qckFactServ_8_5SAM,GlbRutaFacturas+'\Devolucion'+IntToStr(dmReportes.qryViewVentasMastNUMERO_DOC_PAGO.AsInteger)+'.pdf')
            else
            ReportExportPDF(qckFactServ_8_5SAM,GlbRutaFacturas+'\Devolucion'+IntToStr(dmReportes.qryViewVentasMastNumeroDocCldo.AsInteger)+'.pdf')
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
            if qryEmpleado.Locate('codigo', dmreportes.qryViewVentasDetCodigo_Vendedor.Value,[]) then
            begin
              qckFactServ_8_5SAMNew.rxVendedor.Append;
              qckFactServ_8_5SAMNew.rxVendedorNombreVendedor.Value:= qryEmpleadoNOMBREVENDEDOR.Value;
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
             qckFactServ_8_5SAMNew.xtipoVenta := 'Devolucion';
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
              qckFactServ_8_5SAMnew.Preview;

            if (GlbImpReciboSinPreg = 0) then
            if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
            begin
              qckFactServ_8_5SAMnew.Preview;
            end;
            if GlbImpPDF then
            begin
            if not dmReportes.qryViewVentasMastNUMERO_DOC_PAGO.IsNull then
            ReportExportPDF(qckFactServ_8_5SAMnew,GlbRutaFacturas+'\Devolucion'+IntToStr(dmReportes.qryViewVentasMastNUMERO_DOC_PAGO.AsInteger)+'.pdf')
            else
            ReportExportPDF(qckFactServ_8_5SAMnew,GlbRutaFacturas+'\Devolucion'+IntToStr(dmReportes.qryViewVentasMastNumeroDocCldo.AsInteger)+'.pdf')
            end;
        finally
        qckFactServ_8_5SAMnew.Free;
        qckFactServ_8_5SAMNew:=Nil;
        end;
        end;
      end else
      if (GlBAyaco = 1) or (GlbSizeFact8x11 = 1) or (GlBTapiceria = 1) then
         begin
           qckFactServ8_5Ayaco:=TqckFactServ8_5Ayaco.Create(Nil);
           try
             //qckFactServ8_5Ayaco.PrinterSettings.PrinterIndex:=GetImpresorarpt(2,12);
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
            if GlbImpPDF then
            begin
            if not dmReportes.qryViewVentasMastNUMERO_DOC_PAGO.IsNull then
            ReportExportPDF(qckCotServ8_5Ayaco,GLbDevoluciones+'\Devolucion'+IntToStr(dmReportes.qryViewVentasMastNUMERO_DOC_PAGO.AsInteger)+'.pdf')
            else
            ReportExportPDF(qckCotServ8_5Ayaco,GLbDevoluciones+'\Devolucion'+IntToStr(dmReportes.qryViewVentasMastNumeroDocCldo.AsInteger)+'.pdf')
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
        qckFactServ8_5BB:=TqckFactServ8_5BB.Create(Nil);
        try
          //qckFactServ8_5BB.TPag.Caption:=
          //IntToStr(qckFactServ8_5BB.PageNumber);
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
              //qckFactServArtioffice8_5
              qckFactServArtioffice8_5.Preview;
            end;
         end;
         reciboImpreso := True;
         finally
         qckFactServArtioffice8_5.Free;
         qckFactServArtioffice8_5:=Nil;
         end;
      end
      else
          begin
            qckFactCredArtioffice8_5_F_1:=TqckFactCredArtioffice8_5_F_1.Create(nil);
            try
              qckFactCredArtioffice8_5_F_1.qrLabelFactOrigen.Caption:='';
              if EsDevolucion then
              begin
                //if EsModificandoFactura then
                qckFactCredArtioffice8_5_F_1.qrLabelFactOrigen.Caption:='#Factura: ' + IntToStr(UProcesarDevolucion.numeroFactura);

                qckFactCredArtioffice8_5_F_1.QRLabel4.Caption := 'NOTA CREDITO';
              end;
              qckFactCredArtioffice8_5_F_1.strtipodoc := 'NOTA CREDITO';
              qckFactCredArtioffice8_5_F_1.Preview;
            finally
            qckFactCredArtioffice8_5_F_1.free;
            qckFactCredArtioffice8_5_F_1:=nil;
            end;
          end;
        end;
      end else
      begin
        UImpresionVentas.ImpFacturaservicio(dmfactura.qryFactReimpMaster.Params[0].Value, True);
      end;
    end;

    Label36.Visible:=False;
    Label36.caption:='';
    rdgFactServicio.Checked:=False;
    Application.ProcessMessages;
    qryInventario.Close;
    qryInventario.Open;
    qryProductos.Close;
    qryProductos.Open;
    qryCliente.Close;
    qryCliente.Open;
    lblFechaCotizacion.Visible:= False;
    dbFechaCotizacion.Visible := False;
    Label36.Visible    := False;
    glbcodVendedor     := -1;
    EsModificandoCotiza:= False;
    label36.Caption    := '';
    NoTieneCredito     := False;
    Refresh;
    EsDevolucion       := False;
    BitBtn7.Enabled    := True;
    try
      Totales.EmptyTable;
      rxPagos.EmptyTable;
      Totales.Close;
      Totales.Open;
    Except
    end;
    lblProcDev.Visible := False;
    tablaPropietario.Close;
    tablaPropietario.Open;
    rxventa.EnableControls;
    rxventa.Close;
    rxventa.Open;
    tablaPropietario.EmptyTable;
    EsModificandoFactura:= False;
    lblProcDev.Visible  := EsDevolucion;
    if lblProcDev.Visible = false then
    lblProcDev.SendToBack else
    lblProcDev.BringToFront;
    BitBtn6.Enabled := True;
    BitBtn6.BringToFront;
    //temporal label29.Top:= 413;
    label29.Top:= 371;
    //temporal dbTextMontoExoneraITBIS.Top := 410;
    label41.Visible := False;
    DBText15.Visible:= True;
    if (GlbNumVtaPOS > 0) then
    dmcalculos.ProcDeletePosExtraDet(GlbNumVtaPOS);
    GlbNumVtaPOS:=-1;
    Exit;
  end; //FIN MODIFICAR FACTURA
  end;
  //***********************************PROCESO DEVOLUCION PARCIAL *************
  //Inicio 
  if (EsDevolucion) And (rxVenta.RecordCount > 0) then
  begin
    if dmFactura.qryVentaFactura.State = dsInactive then
    begin
      MessageDlg('Transacción no puede ser procesada como devolución, verifique.', mtInformation, [mbok], 0);
      Exit;
    end;
    //{Inicio Temporal   ----VOLVER AQUI CON LA DEVOLUCION
    //cambios aqui
    if (GlbActivaIFiscal = 0) And (tablaPropietarioCodigoPropietario.IsNull Or
       (tablaPropietarioCodigoPropietario.Value = 0)) and
       (dmFactura.qryVentaFacturaNumero_ncf.Value <> '')  then
    Begin
    if (dmFactura.qryVentaFacturaNumero_ncf.Value <> '') and (GlbActivaECF = 0) then
    begin
      ncfGen := True;
      if (TotalesTipoNCFIFiscal.Value = -1) then
      begin
        Totales.Edit;
        //TotalesTipoNCFIFiscal.Value
        TotalesTipoNCFIFiscal.Value:= 2;//2;
        if not LlenandoDatos then
        Totales.Post;
      end else
      if (TotalesTipoNCFIFiscal.Value = 0) then
      begin
        Totales.Edit;
        TotalesTipoNCFIFiscal.Value:=dmFactura.ibQryViewNCFTIPO_NCFNCR.Value;//2;
        if not LlenandoDatos then
        Totales.Post;
      end else
      if (TotalesTipoNCFIFiscal.Value = 1) then
      begin
        Totales.Edit;
        TotalesTipoNCFIFiscal.Value:=dmFactura.ibQryViewNCFTIPO_NCFNCR.Value;//3;
        if not LlenandoDatos then
        Totales.Post;
      end else
      if (TotalesTipoNCFIFiscal.Value = 5) then
      begin
        //MessageDlg('No permitido', mtInformation, [mbok],0);
        //Exit;
        Totales.Edit;
        TotalesTipoNCFIFiscal.Value:=dmFactura.ibQryViewNCFTIPO_NCFNCR.Value;
        if not LlenandoDatos then
        Totales.Post;
      end else
      if (TotalesTipoNCFIFiscal.Value = 4) then
      begin
        Totales.Edit;
        TotalesTipoNCFIFiscal.Value:=dmFactura.ibQryViewNCFTIPO_NCFNCR.Value;
        if not LlenandoDatos then
        Totales.Post;
      end else
      begin
        MessageDlg('No permitido', mtInformation, [mbok],0);
        Exit;
      end;
      end else
      begin
        Totales.Edit;
        TotalesTipoNCFIFiscal.AsVariant:= null;
        TotalesTipoNCF.AsVariant := null;
        if not LlenandoDatos then
        Totales.Post;
      end;                          

    if TotalesMoneda.IsNull then
    begin
      MessageDlg('Favor indicar moneda.', mtInformation, [mbok], 0);
      Exit;
    end;
    //if MessageDlg('Desea procesar transacción como devolución?', mtWarning, [mbYes, mbNo],0)= mrYes then
    //begin
      //Crear Nota Credito

      UProcesarDevolucion.CancelaProceso := False;

      if GlbActivaECF = 1 then
      UProcesarDevolucion.tipoCF    := '34'
      else
      UProcesarDevolucion.tipoCF    := '04';

      UProcesarDevolucion.fechaTrn  := rxVentaFecha.Value;
      if dmFactura.qryVentaFacturaCODIGO_CTE.Value > 0 then
      begin
        tablaPropietario.Edit;
        tablaPropietarioCodigoPropietario.Value:= dmFactura.qryVentaFacturaCODIGO_CTE.Value;
        tablaPropietario.Post;
      end else
      begin
        tablaPropietario.Edit;
        tablaPropietarioCodigoPropietario.Value:= 0;
        tablaPropietario.Post;
      end;
      if tablaPropietarioCodigoPropietario.Value > 0 then
      begin
        UProcesarDevolucion.codigo_cte:= tablaPropietarioCodigoPropietario.Value;
        if tablaPropietarioCodigoPropietario.Value > 0 then
        UProcesarDevolucion.nombrecompleto :=qryClienteNOMBRE_FACTURAR.Value;
        begin
          if Not qryClienteRNC_NUMERO.IsNull then
          UProcesarDevolucion.cedula   := qryClienteRNC_NUMERO.Value
          else
          UProcesarDevolucion.cedula   := qryClienteCEDULA.Value;
          UProcesarDevolucion.direccion:= qryClienteDIRECCION_CONT.Value;
          UProcesarDevolucion.ciudad   := qryClienteCIUDAD.Value;// '';
        end;
      end;
      
      UProcesarDevolucion.monto    := Totalestotalneto.Value;
      UProcesarDevolucion.status   := 'A';
      UProcesarDevolucion.Moneda   := Trim(TotalesMoneda.Value);
      UProcesarDevolucion.codig_usuario := VarUsuarioGlb;
      UProcesarDevolucion.fechaInsert   := Now;;
      UProcesarDevolucion.fechaUpdate   := Now ;
      UProcesarDevolucion.codigousuarioupd := VarUsuarioGlb;
      UProcesarDevolucion.tipodoc := 5; //Nota Credito
      UProcesarDevolucion.numeroFactura := rxVentaNumeroFactura.Value;
      if TotalesTipoNCFIFiscal.IsNull then
      UProcesarDevolucion.GeneraNCF:= False
      else
      UProcesarDevolucion.GeneraNCF:= True;

      if dmFactura.qryVentaFacturaFORMA_PAGO.Value in [7,8,15] then
      UProcesarDevolucion.UpdateBLCCXC  := True
      else
      UProcesarDevolucion.UpdateBLCCXC := False;

      if UProcesarDevolucion.GeneraNCF then
      begin
        dmfactura.ibqryViewNCF.Close;
        dmFactura.ibQryViewNCF.Close;
        if dmFactura.ibQryViewNCF.Prepared then
        dmFactura.ibQryViewNCF.UnPrepare;
        dmFactura.ibQryViewNCF.SQL.Text := dmFactura.ibQryViewNCF_0.SQL.Text;
        ProcAsignaQuery;
        dmfactura.ibqryViewNCF.Open;
        if GlbActivaECF = 1 then
        UProcesarDevolucion.Ejecutar('34', TotalesTipoNCFIFiscal.Value, dmFactura.qryVentaFacturaNUMERO.Value)//Comprogante Fiscal Nota de Credito
        else
        UProcesarDevolucion.Ejecutar('04', TotalesTipoNCFIFiscal.Value, dmFactura.qryVentaFacturaNUMERO.Value)
      end else
      UProcesarDevolucion.Ejecutar('', -1, dmFactura.qryVentaFacturaNUMERO.Value);
      //ActualizaVentaMaster('6', UProcesarDevolucion.seriencfasignado);//Devolucion
      if UProcesarDevolucion.CancelaProceso then
      exit;
      ProcInsertarVtaMastEnDevolucion(UProcesarDevolucion.seriencfasignado);
      rxVenta.First;
      While Not rxVenta.Eof Do
      begin
        ibStpActualizaInvProd.Params[0].Value:= rxVentaCodArticulo.Value;
        if (GlbUsaPUnidadLevel = 0) then
           ibStpActualizaInvProd.Params[1].Value:= rxVentaCant.Value
        else
        ibStpActualizaInvProd.Params[1].Value:= rxVentaCant.Value * CantUnidad;
        ibStpActualizaInvProd.Params[2].Value:= 1;//tipoTrn
        ibStpActualizaInvProd.Params[3].Value:= 1;//porCodigo
        if (rxVentaInvetariar.Value <> 0) And  (GlbCodDivInventario = 1 ) then
           ibStpActualizaInvProd.ExecProc;

        InsertarDetDevolucion(ipStpInsertVentMast.Params[0].Value);
        //ActualizaInvAlmacen;
        ncfGenYaGen := True;
        rxVenta.Next;
      end;
      //No es necesario, probar y eliminar en caso de no.
      //ProcesarDevolucion;
       //ncfGenYaGen
      //aqui control para evitar duplisidad
    //end;

    end else
    if (GlbActivaIFiscal = 0) And (tablaPropietarioCodigoPropietario.IsNull Or
       (tablaPropietarioCodigoPropietario.Value = 0)) then
    Begin
      rxVenta.DisableControls;
      rxVenta.First;
      if rxVentaglbcodVendedor.Value > 0 then
         GlbcodVendedor:= rxVentaglbcodVendedor.Value;
      //ActualizaVentaMaster('6', UProcesarDevolucion.seriencfasignado);//Devolucion
      //ProcInsertarVtaMastEnDevolucion(UProcesarDevolucion.seriencfasignado);
      NumTrnGen := -1;
      NumOrden  := -1;
      ProcInsertarVtaMastCashEnDev(NumTrnGen,NumOrden);
      rxVenta.First;
      While Not rxVenta.Eof Do
      begin
        ibStpActualizaInvProd.Params[0].Value:= rxVentaCodArticulo.Value;
        if (GlbUsaPUnidadLevel = 1) then
        ibStpActualizaInvProd.Params[1].Value:= rxVentaCant.Value * CantUnidad
        else
        ibStpActualizaInvProd.Params[1].Value:= rxVentaCant.Value;
        ibStpActualizaInvProd.Params[2].Value:= 1;//tipoTrn
        ibStpActualizaInvProd.Params[3].Value:= 1;//porCodigo

        if (rxVentaInvetariar.Value <> 0) And (GlbCodDivInventario = 1) then
        ibStpActualizaInvProd.ExecProc;

        if Not ibStpActualizaInvProd.Transaction.InTransaction then
        ibStpActualizaInvProd.Transaction.StartTransaction;
        try
         ibStpActualizaInvProd.Transaction.CommitRetaining;
        except
        ibStpActualizaInvProd.Transaction.RollbackRetaining;
        end;

        InsertarDetDevolucionCash(ipStpInsertVentMast.Params[0].Value);

        ibStpActualizaInvProd.Params[0].Value:= rxVentaCodArticulo.Value;
        if (GlbUsaPUnidadLevel = 1) then
        ibStpActualizaInvProd.Params[1].Value:= rxVentaCant.Value * CantUnidad
        else
        begin
          if (rxVentaTipoUnidad.Value = 3) Or (rxVentaTipoUnidad.Value = 0) then
          ibStpActualizaInvProd.Params[1].Value:= rxVentaCant.Value
          else
          begin
            ibStpActualizaInvProd.Params[1].Value:= rxVentaCant.Value * CantUnidad;
          end;
        end;
        if (rxVentaTipoVenta.Value = 0) Or (rxVentaTipoVenta.IsNull ) then //Item de Venta
        begin
          try
            ActualizaInvAlmacen;//Actualiza Division Inventario
          except on E : Exception do
          begin
            NotificaErrorByEmail('Actualizando Cant Inventario (stpMantInvAlmacen.ExecProc;):'+rxDataAntCantFinal.AsString+
            ' #Trn '+IntToStr(NumeroTrn)+LF+CR+e.Message);
            WriteToLog('Actualizando Cant Inventario (stpMantInvAlmacen.ExecProc;):'+rxDataAntCantFinal.AsString+
           ' #Trn '+IntToStr(NumeroTrn)+LF+CR+e.Message);
         end;
         end;
        end;
        //ActualizaInvAlmacen;
        rxVenta.Next;
      end;
      //ProcDevoluconCash;
      rxVenta.EnableControls;
      //ReImprimeDevolucionsinFact1Click(Self);
      ReImpDevolucion(NumOrden,_flag);
      UProcesarDevolucion.numeroFactura :=-1;
      ProcActualizaMsg;
      EsModificandoCotiza:= False;
      label36.Caption    := '';
      NoTieneCredito     := False;
      //Refresh;
      EsDevolucion       := False;
      //EsDevolucion := Not EsDevolucion;
      lblProcDev.Visible := EsDevolucion;
      if lblProcDev.Visible = false then
      lblProcDev.SendToBack else
      lblProcDev.BringToFront;
      lblProcDev.Left:= 192;
      rxventa.EmptyTable;
      lblTotalItem.Caption:='Total Items:'+IntToStr(rxVenta.RecordCount);      
      rxSolDatoscte.EmptyTable;
      lblProcDev.Caption  :='Proceso Venta';
      EsModificandoFactura:=False;
      qryInventario.Close;
      qryInventario.Open;
      qryProductos.Close;
      qryProductos.Open;
      numeroTrnVta:= 0;
      GlbcodVendedor:=-1;

      rxventa.EnableControls;
      Refresh;
      lblProcDev.Visible := False;
      if (GlbNumVtaPOS > 0) then
      dmcalculos.ProcDeletePosExtraDet(GlbNumVtaPOS);
      GlbNumVtaPOS:=-1;
      Exit;
    end;
    //Final Temporal
    //debe entrar aqui para venta cash no fiscal
    if (dmFactura.qryVentaFacturaNumero_ncf.Value <> '') and (not ncfGen)  then
    begin
      if (TotalesTipoNCFIFiscal.Value = -1) then
      begin
        Totales.Edit;
        TotalesTipoNCFIFiscal.Value:= 2;//2;
      end else
      if (TotalesTipoNCFIFiscal.Value = 0) then
      begin
        Totales.Edit;
        TotalesTipoNCFIFiscal.Value:=dmFactura.ibQryViewNCFTIPO_NCFNCR.Value;//2;
      end else
      if (TotalesTipoNCFIFiscal.Value = 1) then
      begin
        Totales.Edit;
        TotalesTipoNCFIFiscal.Value:=dmFactura.ibQryViewNCFTIPO_NCFNCR.Value;//3;
      end else
      if (TotalesTipoNCFIFiscal.Value = 5) then
      begin
        //MessageDlg('No permitido', mtInformation, [mbok],0);
        //Exit;
        Totales.Edit;
        TotalesTipoNCFIFiscal.Value:=dmFactura.ibQryViewNCFTIPO_NCFNCR.Value;
      end else
      if (TotalesTipoNCFIFiscal.Value = 4) then
      begin
        Totales.Edit;
        TotalesTipoNCFIFiscal.Value:=dmFactura.ibQryViewNCFTIPO_NCFNCR.Value;
      end else
      begin
        MessageDlg('No permitido', mtInformation, [mbok],0);
        Exit;
      end;
      end else
      begin
        Totales.Edit;
        TotalesTipoNCFIFiscal.AsVariant:= null;
        TotalesTipoNCF.AsVariant := null;
        Totales.Post;
      end;
    if not LlenandoDatos then
    if Totales.state = dsEdit then
    Totales.Post;

    if TotalesMoneda.IsNull then
    begin
      MessageDlg('Favor indicar moneda.', mtInformation, [mbok], 0);
      Exit;
    end;
    if MessageDlg('Desea procesar transacción como devolución?', mtWarning, [mbYes, mbNo],0)= mrYes then
    xContinua:=True;
    if (not ncfGen) and  (xContinua) then
    begin
      //Crear Nota Credito
      //UProcesarDevolucion.tipoCF    := '04';
      if GlbActivaECF = 1 then
      UProcesarDevolucion.tipoCF    := '34'
      else 
      UProcesarDevolucion.tipoCF    := '04';
      
      UProcesarDevolucion.fechaTrn  := rxVentaFecha.Value;
      UProcesarDevolucion.codigo_cte:= tablaPropietarioCodigoPropietario.Value;
      if tablaPropietarioCodigoPropietario.Value > 0 then
      begin
        UProcesarDevolucion.nombrecompleto :=qryClienteNOMBRE_FACTURAR.Value;
        if Not qryClienteRNC_NUMERO.IsNull then
          UProcesarDevolucion.cedula   := qryClienteRNC_NUMERO.Value
        else
        UProcesarDevolucion.cedula   := qryClienteCEDULA.Value;
        UProcesarDevolucion.direccion:= qryClienteDIRECCION_CONT.Value;
        UProcesarDevolucion.ciudad   := qryClienteCIUDAD.Value;// '';
      end;
      UProcesarDevolucion.monto    := Totalestotalneto.Value;
      UProcesarDevolucion.status   := 'A';
      UProcesarDevolucion.Moneda   := Trim(TotalesMoneda.Value);
      UProcesarDevolucion.codig_usuario := VarUsuarioGlb;
      UProcesarDevolucion.fechaInsert   := Now;;
      UProcesarDevolucion.fechaUpdate   := Now ;
      UProcesarDevolucion.codigousuarioupd := VarUsuarioGlb;
      UProcesarDevolucion.tipodoc := 5; //Nota Credito
      UProcesarDevolucion.numeroFactura := rxVentaNumeroFactura.Value;
      if TotalesTipoNCFIFiscal.IsNull then
      UProcesarDevolucion.GeneraNCF:= False
      else
      UProcesarDevolucion.GeneraNCF:= True;
      //UProcesarDevolucion.UpdateBLCCXC := dmFactura.qryVentaFacturaNUMEROFACTURA.Value > 0;
      if dmFactura.qryVentaFacturaFORMA_PAGO.Value in [7,8,15] then
      UProcesarDevolucion.UpdateBLCCXC  := True

      else
      UProcesarDevolucion.UpdateBLCCXC := False;
              //totalesTipoNCFIFiscal.value
      if UProcesarDevolucion.GeneraNCF then
      begin
        dmfactura.ibqryViewNCF.Close;
        dmFactura.ibQryViewNCF.Close;
        if dmFactura.ibQryViewNCF.Prepared then
        dmFactura.ibQryViewNCF.UnPrepare;
        dmFactura.ibQryViewNCF.SQL.Text := dmFactura.ibQryViewNCF_0.SQL.Text;
        ProcAsignaQuery;
        dmfactura.ibqryViewNCF.Open;  //por aqui voy procesando devolucion
        UProcesarDevolucion.Ejecutar('04', TotalesTipoNCFIFiscal.Value, dmFactura.qryVentaFacturaNUMERO.Value)//Comprogante Fiscal Nota de Credito
      end else
      UProcesarDevolucion.Ejecutar('', -1, dmFactura.qryVentaFacturaNUMERO.Value);
      if (GlbMutur = 1) then
      DescargarVehiculoDev(dmFactura.qryVentaFacturaNUMERO.Value);

      //ActualizaVentaMaster('6', UProcesarDevolucion.seriencfasignado);//Devolucion
      ProcInsertarVtaMastEnDevolucion(UProcesarDevolucion.seriencfasignado);
      rxVenta.First;
      While Not rxVenta.Eof Do
      begin
      ibStpActualizaInvProd.Params[0].Value:= rxVentaCodArticulo.Value;
      if (GlbUsaPUnidadLevel = 0) then
      ibStpActualizaInvProd.Params[1].Value:= rxVentaCant.Value
      else
      ibStpActualizaInvProd.Params[1].Value:= rxVentaCant.Value * CantUnidad;
      ibStpActualizaInvProd.Params[2].Value:= 1;//tipoTrn
      ibStpActualizaInvProd.Params[3].Value:= 1;//porCodigo
      if (rxVentaInvetariar.Value <> 0) And  (GlbCodDivInventario = 1 ) then
         ibStpActualizaInvProd.ExecProc;

      InsertarDetDevolucion(ipStpInsertVentMast.Params[0].Value);
      //ActualizaInvAlmacen;
      rxVenta.Next;
      end;
      //No es necesario, probar y eliminar en caso de no.
      //ProcesarDevolucion;
    end;
    if (GlbActivaIFiscal = 1 ) then
    begin
      dmdatos.qryConfCajaXusuario.Close;
      dmdatos.qryConfCajaXusuario.Open;
      dmdatos.qryConfCajaXusuario.Locate('COD_EMPLEADO',VarUsuarioGlb,[]);

      dmReportes.qryDatosCajaImpUser.Close;
      dmReportes.qryDatosCajaImpUser.Params[0].Value:= VarUsuarioGlb;
      dmReportes.qryDatosCajaImpUser.Open;
      dmReportes.qryDatosCajaImpUser.Last;
      dmReportes.qryDatosCajaImpUser.RecordCount;
      dmFactura.qryDatosTrncxc.Close;
                 
      dmFactura.qryDatosTrncxc.Params[0].AsInteger:= 1;

      dmFactura.qryDatosTrncxc.Params[1].AsInteger:= UProcesarDevolucion.numeroFactura;
      dmFactura.qryDatosTrncxc.Open;

      GlbNombreFiletoPrint:= Format('%s%s%s%s%s%s%s',[dmReportes.qryDatosCajaImpUserRUTA_TICKET.Value,'\NotaCredito',Trim(GlbCodSucursal),Trim(GlbModeloImpresora),
      IntToStr(VarUsuarioGlb),StrLeftPad(IntToStr(ipStpInsertVentMast.Params[0].Value),8),'.txt']);

      dmReportes.qryDatosVentaMaster.Close;

      dmReportes.qryDatosVentaMaster.Params[0].Value:= numeroTrnVta; //dmFactura.qryVentaFacturaNumero.Value;
      dmReportes.qryDatosVentaMaster.Open;


      PrepararInfoFiscalNCR(dmFactura.qryDatosTrncxcNUM_DOC.Value);
      dmReportes.qryDatosRepTranscxcIFiscal.Last;
      dmReportes.qryDatosRepTranscxcIFiscal.First;

      dmFactura.qryGetNcfAsignado.Close;

      if esContado then //contado
      dmFactura.qryGetNcfAsignado.SQL.Text:=dmFactura.qryGeNcfAsignado_1.SQL.Text
      else
      dmFactura.qryGetNcfAsignado.SQL.Text:=dmFactura.qryGetNcfAsignado_0.SQL.Text;
      //if esContado then
      dmFactura.qryGetNcfAsignado.Params[0].Value:= dmReportes.qryViewVentasMastNUMERO.Value;
      //else
      //dmFactura.qryGetNcfAsignado.Params[0].Value:= dmFactura.qryVentaFacturaNUMERO.Value;

      dmFactura.qryGetNcfAsignado.Open;
      dmFactura.qryVentaFactura.Last;

      dmreportes.qryNCFAfectado.Close;
      dmreportes.qryNCFAfectado.Params[0].Value:= dmReportes.qryViewVentasMastSERIE_NCF_ASIGNADO.Value;
      dmreportes.qryNCFAfectado.Open;

      if (dmReportes.qryViewVentasMastNUMERO_NCF.Isnull) then
      begin
        MessageDlg('Se requiere NCF afectado para Nota de Crédito, verifique.', mtError, [mbOk], 0);
        Exit;
      end;
      if (dmfactura.qryDatosTrncxc.State = dsInactive) then
      begin

        dmFactura.qryDatosTrncxc.Params[0].AsInteger:= 1;
        dmFactura.qryDatosTrncxc.Params[1].AsInteger:= dmReportes.qryViewVentasMastNUMERO_FACTURA.Value;

        dmFactura.qryDatosTrncxc.Open;
      end;

      begin

        frmTestImpresoraFiscal:= TfrmTestImpresoraFiscal.Create(Nil);
        try
          frmTestImpresoraFiscal.ncfAfectado := dmReportes.qryViewVentasMastNUMERO_NCF.Value;
          frmTestImpresoraFiscal.LCantCopias := rxspinImpCantCopias.Text;
          frmTestImpresoraFiscal.BitBtn1Click(Self);

          ProcInsFiscalCtrl(dmReportes.qryViewVentasMastNUMERO.Value,
          dmReportes.qryViewVentasMastFECHA.Value,xexiste);

          frmTestImpresoraFiscal.btnImprimeReciboClick(Self);
          Sleep(2000);
          repeat
          ProcInsFiscalCtrl(dmReportes.qryViewVentasMastNUMERO.Value,
          dmReportes.qryViewVentasMastFECHA.Value,xexiste);
          until not GlbImprimiendo;

        finally
        frmTestImpresoraFiscal.Free;
        frmTestImpresoraFiscal:= Nil;
        end;
        Delay(1000);
        if (GlbNumVtaPOS > 0) then
        dmcalculos.ProcDeletePosExtraDet(GlbNumVtaPOS);
        GlbNumVtaPOS:=-1;

        ReactivarValores;
      end;
    end else //No Fiscal
    ReImprimeDevolucionsinFact1Click(Self);

    UProcesarDevolucion.numeroFactura :=-1;
    ProcActualizaMsg;
    EsModificandoCotiza:= False;
    label36.Caption    := '';
    NoTieneCredito     := False;

    //Refresh;
    EsDevolucion       := False;
    //EsDevolucion := Not EsDevolucion;
  lblProcDev.Visible := EsDevolucion;
  if lblProcDev.Visible = false then
  lblProcDev.SendToBack else
  lblProcDev.BringToFront;
  lblProcDev.Left:= 192;
  rxventa.EmptyTable;
  lblTotalItem.Caption:='Total Items:'+IntToStr(rxVenta.RecordCount);
  rxSolDatoscte.EmptyTable;
  lblProcDev.Caption  :='Proceso Venta';
  EsModificandoFactura:=False;
  qryInventario.Close;
  qryInventario.Open;
  qryProductos.Close;
  qryProductos.Open;
  numeroTrnVta:= 0;
  GlbcodVendedor:=-1;
  rxventa.EnableControls;
  Refresh;
  lblProcDev.Visible := False;
  bitBtnEditarFact.Visible := False;
  exit;
  end;

 //---EN PRUEBA RE-hABILITAR PARA CONTINUAR
 // }
  EsDevolucion := Not EsDevolucion;
  lblProcDev.Visible := EsDevolucion;
  if lblProcDev.Visible = false then
  lblProcDev.SendToBack else
  lblProcDev.BringToFront;
  lblProcDev.Left:= 192;
  For x:=1 To 50 Do
  begin
    lblProcDev.Left:=lblProcDev.Left - 1;
    //Application.ProcessMessages;
  end;
  BitBtn4.Enabled    := True;
  BitBtn6.Enabled    := True;
  EsNotaCRParcial    := False;
  if EsDevolucion then
  begin
    lblProcDev.Caption:='Procesando Devolución';
    ProcGetDatosDevparaNotaCR;//Cargar datos
    EsNotaCRParcial:=True;
    if not _abortar then
    Exit;
  end
  else
  lblProcDev.Caption:='Proceso Venta';

  EsModificandoFactura:=False;
  qryInventario.Close;
  qryInventario.Open;
  qryProductos.Close;
  qryProductos.Open;
  numeroTrnVta:= 0;
  GlbcodVendedor:=-1;
  rxventa.EnableControls;
  Refresh;
  //if rxventa.Recordcount = 0 then Exit;
    Label36.Visible:=False;
    Label36.caption:='';
    rdgFactServicio.Checked:=False;
    Application.ProcessMessages;
    qryInventario.Close;
    qryInventario.Open;
    qryProductos.Close;
    qryProductos.Open;
    qryCliente.Close;
    qryCliente.Open;
    lblFechaCotizacion.Visible:= False;
    dbFechaCotizacion.Visible := False;
    Label36.Visible    := False;
    glbcodVendedor     := -1;
    EsModificandoCotiza:= False;
    label36.Caption    := '';
    NoTieneCredito     := False;
    Refresh;
    EsDevolucion       := False;
    rxventa.EnableControls;
    try
    Totales.EmptyTable;
    rxPagos.EmptyTable;
    lblProcDev.Visible := False;
    tablaPropietario.Close;
    tablaPropietario.Open;
    rxventa.EmptyTable;
    lblTotalItem.Caption:='Total Items:'+IntToStr(rxVenta.RecordCount);    
    except
    end;
  EsModificandoFactura    :=False;
  GlbUsandoCotiza :=False;
  bitBtnEditarFact.Visible:=False;
  bitBtnEditarFact.Top := 475;
  bitBtnEditarFact.SendToBack;
  Label36.Visible:=False;
  ActivarBotonesEnModifica;
  tablaPropietario.Close;
  tablaPropietario.Open;
  lblFechaCotizacion.Visible := False;
  dbFechaCotizacion.Visible  := False;
  EsModificandoCotiza := False;

  _NumeroCotiza  := -1;
  glbcodVendedor := -1;

  numerodocReimp := -1;
  tblMoneda.Close;
  tblMoneda.Open;
  sqlAsignado:=False;
  sumarDatos:=True;
  GlbImprimeReciboFact := 1;
  InactivaImprecibo    := False;
  EsModificandoFactura := False;
  cboxTipoUnidad.Clear;
  bitBtnEditarFact.Visible := False;

  lblProcDev.Visible := False;
  UProcesarDevolucion.numeroFactura := 0;
  dmFactura.qryVentaFactura.Close;
  dmFactura.qryDatosTrncxc.Close;
  dmfactura.qryFactReimpDet.Close;
  if not GLBEsFastFood then
  begin
    label29.Top:= 413;
    dbTextMontoExoneraITBIS.Top := 410;
  end;
  label41.Visible := False;
  DBText15.Visible:= True;
  if (GlbNumVtaPOS > 0) then
  dmcalculos.ProcDeletePosExtraDet(GlbNumVtaPOS);
  GlbNumVtaPOS:=-1;
  xCodProd:=-1;
  GlbNumVtaPOSTmp:=-1;
  dmVentas.qryPrecioMaxInv.Close;
  dmVentas.qryPrecioMaxInv.Params[0].Value:= GlbCia_Key;
  dmVentas.qryPrecioMaxInv.Open;
  
  Refresh;
  //Application.ProcessMessages;
end;