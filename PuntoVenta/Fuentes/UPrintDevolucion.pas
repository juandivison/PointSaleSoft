unit UPrintDevolucion;

interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, RXDBCtrl, DBCtrls,
  Printers, DB, Mask, RxMemDS, EditNew, IBCustomDataSet, IBQuery, WinSkinData, Menus,
  ShellApi, RXCtrls, IBStoredProc, IBSQL, RxLookup, RXSpin, OleServer,
  RxVerInf, RxGIF, ExcelXP, comObj, rxToolEdit, RxDBComb, IBTable, ComCtrls,
  QRPrntr;

var
  AumeroFactura: Integer;
  ANCF: string;
  ATipoVenta: string;

  procedure ImprimirDevolucion;

implementation

uses UDatModConectar, UGlobal, UDatModCompania,UDatModReportes,UProcVentaRapida,
UDatModClientes,UDatModFactura,URFacturaStandar, URFactura,UImpresionVentas,
UDatmodDatosGenerales, URepRecibo8_5_11REspinalReimp,URepRecibo8_5_11REspinal,
URepComprobanteDevol_3Pulg,UQckFactServ8_5_Standar,URepConduceECom,
UFactFormatoECom,UQckFactServ8_5_SAMNewMuturs,UQckFactServ8_5_SAMNewM,
UQckFactServ8_5_SAM,UQckFactServ8_5_SAMNew,UQckFactServ8_5Ayaco,
UQckFactServ8_5BB,UQckFactServArtioficce8_5,UQckFactCredArtioffice8_5_F_1;

procedure ImprimirDevolucion;
var
  Flag : Boolean;
begin
        if ((UpperCase(GLBFormatoFactura) = 'CASANDRA2') or (UpperCase(GLBFormatoFactura) = 'FORMATOGENERAL'))
        and ((GlBAyaco = 0) and (GlBBurgos = 0)) and ((GlbRec3Pulg = 0) or (GlbFact55Pulg = 1))then
        begin
          qckRepRecibo8_5_11REspReimp :=TqckRepRecibo8_5_11REspReimp.Create(Nil);
          try
            qckRepRecibo8_5_11REspReimp.Prepare;
            glbTPag := qckRepRecibo8_5_11REspReimp.PageNumber;

            if EsDevolucion then
            begin
              qckRepRecibo8_5_11REspReimp.xtipoVenta:= ATipoVenta;
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
          //EsModificandoCotiza:= False;
          frmProcVentaRapida.label36.Caption    := '';
          frmProcVentaRapida.NoTieneCredito     := False;
          //Refresh;
          EsDevolucion       := False;
          frmProcVentaRapida.BitBtn6.Enabled := True;
          frmProcVentaRapida.BitBtn6.BringToFront;
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
              if frmProcVentaRapida.ImprimirRecibo1.Checked then
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

          if Length(frmProcVentaRapida.TotalesNombreCliente.Value) > 0 then
          frmProcVentaRapida.totales.RecordCount;
          if dmFactura.qryVentaFacturaNOMBRE_FACTURAR.IsNull then
          qckRepReciboDevol3Pulg.nombreCteGenerico := dmFactura.qryVentaFacturaNOMBRE_CLIENTE_GENERAL.Value
          else
          qckRepReciboDevol3Pulg.nombreCteGenerico := dmFactura.qryVentaFacturaNOMBRE_FACTURAR.Value;
          if Length(frmProcVentaRapida.edtObservacion.Text) > 0 then
          qckRepReciboDevol3Pulg.nombreCteGenerico := frmProcVentaRapida.edtObservacion.Text;

          qckRepReciboDevol3Pulg.xtipoVenta:= ATipoVenta;
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
          QckFactServ_8_5ECom.xtipoVenta := ATipoVenta;
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
              qckFactServ_8_5SAMNewMuturs.xtipoVenta := ATipoVenta;
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
              qckFactServ_8_5SAMNewM.xtipoVenta := ATipoVenta;
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
      if (GlBAyaco = 1) or (GlbSizeFact8x11 = 1) or (GlBTapiceria = 1) or (GlBInveraf =1) then
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
            ReportExportPDF(qckFactServ8_5Ayaco,GLbDevoluciones+'\Devolucion'+IntToStr(dmReportes.qryViewVentasMastNUMERO_DOC_PAGO.AsInteger)+'.pdf')
            else
            ReportExportPDF(qckFactServ8_5Ayaco,GLbDevoluciones+'\Devolucion'+IntToStr(dmReportes.qryViewVentasMastNumeroDocCldo.AsInteger)+'.pdf')
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
                qckFactCredArtioffice8_5_F_1.qrLabelFactOrigen.Caption:='#Factura: ' + IntToStr(AumeroFactura);

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
      end;// else
      //begin
      //UImpresionVentas.ImpFacturaservicio(dmfactura.qryFactReimpMaster.Params[0].Value, True);
end.
