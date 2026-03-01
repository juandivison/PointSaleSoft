unit Uutilprocesaventadiaria;

interface
    procedure ProcFacturaRecurrente(_codCte: Integer;
    Fecha: TDateTime; _numTrn: Integer;_numfact:integer;_ruta:string;_xnumprogrec:integer);
    procedure ImprimirFacturaRepuesto(numTran: Integer);


 var
     TipoVenta : string;
     reimpConduce : Boolean;    

implementation
  uses UDatModFactura, uglobal,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, RXDBCtrl, DBCtrls,
  Printers, DB, Mask, RxMemDS, EditNew, IBCustomDataSet, IBQuery, WinSkinData, Menus,
  ShellApi, RXCtrls, IBStoredProc, IBSQL, RxLookup, RXSpin, OleServer,
  RxVerInf, RxGIF, ExcelXP, comObj, rxToolEdit, RxDBComb, IBTable, ComCtrls,
  QRPrntr,URepRecibo8x5_5,frmImprimirDoc,URepConduceECom, UDatModCompania,UDatModEmpleados, UDatModClientes, UDatModReportes, UFactFormatoECom;


procedure ImprimirFacturaRepuesto(numTran: Integer);
begin
  reimpConduce:=True;
  //ImpPDF := False;
  GlbEsCopia:=False;
  dmEmpleados.qryEmpleados.Close;
  dmEmpleados.qryEmpleados.Open;
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


  dmclientes.qryClientes.Close;
  dmclientes.qryClientes.Open;

  if dmclientes.qryClientes.Locate('CODIGO_CTE;CIA_KEY',
     VarArrayOf([dmFactura.qryVentaFacturaCODIGO_CTE.Value,dmFactura.qryVentaFacturaCIA_KEY.Value]),[]) then
     glbcodVendedor:=dmclientes.qryClientesCOD_VENDEDOR.Value
  else
    glbcodVendedor:= VarUsuarioGlb;

    //t LlenarrxSolDatoscte(dmFactura.qryVentaFacturaCODIGO_CTE.Value);
    begin //dmfactura.qryVentaFactura.sql.text
      dmreportes.qryViewVentasMast.Close;
      dmreportes.qryViewVentasMast.Params[0].Value:= dmfactura.qryVentaFacturaNUMERO.Value;
      dmreportes.qryViewVentasMast.Open;

      //t ProcSetPathlogoTipoServicio(dmReportes.qryViewVentasMastTIPO_AFILIADO.Value);
      //preguntar aqui tipo de factura a imprimir
      if GlbFactRecurrente and (GLBECOM = 1) then
      begin
          QckFactServ_8_5ECom:=TQckFactServ_8_5ECom.Create(Nil);
          try
            QckFactServ_8_5ECom.rxVendedor.Close;
            QckFactServ_8_5ECom.rxVendedor.Open;
            if dmreportes.qryCantVendedoresSamCANTVENDEDORES.Value = 1 then
            begin
              if dmEmpleados.qryEmpleados.Locate('codigo', dmreportes.qryViewVentasDetCodigo_Vendedor.Value,[]) then
              begin
                QckFactServ_8_5ECom.rxVendedor.Append;
                QckFactServ_8_5ECom.rxVendedorNombreVendedor.Value:=
                dmEmpleados.qryEmpleadosNOMBREVENDEDOR.Value;
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
              if dmEmpleados.qryEmpleados.Locate('codigo', dmreportes.qryViewVentasDetCodigo_Vendedor.Value,[]) then
              begin
                QckFactServ_8_5ECom.rxVendedor.Append;
                QckFactServ_8_5ECom.rxVendedorNombreVendedor.Value:=
                dmEmpleados.qryEmpleadosNOMBREVENDEDOR.Value;
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
      end;
      //end;

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
          //ProgressBar1.Visible:= False;
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
end;

procedure ProcFacturaRecurrente(_codCte: Integer;
  Fecha: TDateTime; _numTrn: Integer;_numfact:integer;_ruta:string;_xnumprogrec:integer);
begin
  dmFactura.tblFactRecurrentes.Close;
  dmFactura.tblFactRecurrentes.Params[0].Value:= ExtraerFecha(fecha);
  dmFactura.tblFactRecurrentes.Params[1].Value:= ExtraerFecha(fecha);
  dmFactura.tblFactRecurrentes.Open;
  if not dmFactura.tblFactRecurrentes.Locate('NUMERO_TRN;CODIGO_CTE',
  VarArrayOf([_numTrn,_codCte]),[]) then
  begin
    dmFactura.tblFactRecurrentes.Append;
    dmFactura.tblFactRecurrentesFECHA_GENERADA.Value:= ExtraerFecha(fecha);
    dmFactura.tblFactRecurrentesCODIGO_CTE.Value := _codCte;
    dmFactura.tblFactRecurrentesNUMERO_FACT.Value:= _numfact;
    dmFactura.tblFactRecurrentesNUMERO_TRN.Value := _numTrn;
    dmFactura.tblFactRecurrentesRUTA.Value       := _ruta;
    dmFactura.tblFactRecurrentesSTATUS.Value := 'A';
    dmFactura.tblFactRecurrentesNUMERO_PROG.Value:= _xnumprogrec;
    GlbSalvarQuery(dmFactura.tblFactRecurrentes);
  end;
end;

end.
