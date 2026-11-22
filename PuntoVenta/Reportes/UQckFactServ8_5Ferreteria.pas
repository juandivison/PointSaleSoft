unit UQckFactServ8_5Ferreteria;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  db, StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, jpeg, RxMemDS;

type
  TqckFact8_5Ferreteria = class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    ChildBand1: TQRChildBand;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel4: TQRLabel;
    QRShape3: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    ChildBand2: TQRChildBand;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    ChildBand3: TQRChildBand;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRDBText7: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText15: TQRDBText;
    QRLabel23: TQRLabel;
    QRBand1: TQRBand;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel22: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBRichText1: TQRDBRichText;
    QRDBText16: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRExpr1: TQRExpr;
    QRDBText24: TQRDBText;
    QRSubDetail1: TQRSubDetail;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRSysData3: TQRSysData;
    TPag: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText30: TQRDBText;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRExpr5: TQRExpr;
    QRDBText2: TQRDBText;
    QRShape18: TQRShape;
    QRLabel3: TQRLabel;
    QRExpr6: TQRExpr;
    QRLabel1: TQRLabel;
    QRDBText11: TQRDBText;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRShape16: TQRShape;
    ChildBand4: TQRChildBand;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText18: TQRDBText;
    QRExpr7: TQRExpr;
    QRDBText23: TQRDBText;
    QRDBText22: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText29: TQRDBText;
    qrLablNCFAfectado: TQRLabel;
    ChildBand5: TQRChildBand;
    QRDBText31: TQRDBText;
    QRDBText17: TQRDBText;
    QRLabel21: TQRLabel;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    rxValorDivisa: TRxMemoryData;
    rxValorDivisaMontoTotal: TCurrencyField;
    QRImage2: TQRImage;
    QRLabel30: TQRLabel;
    qrCodigoSegecf: TQRLabel;
    QRLabel31: TQRLabel;
    qrFechaFDigital: TQRLabel;
    QRDBText35: TQRDBText;
    QRImage1: TQRImage;
    QRShape24: TQRShape;
    QRLabel35: TQRLabel;
    QRLabel34: TQRLabel;
    QRShape23: TQRShape;
    QRMemo1: TQRMemo;
    QRLabel26: TQRLabel;
    QRShape17: TQRShape;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRLabel23Print(sender: TObject; var Value: String);
    procedure QRDBText22Print(sender: TObject; var Value: String);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSysData3Print(sender: TObject; var Value: String);
    procedure ColumnHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText9Print(sender: TObject; var Value: String);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText23Print(sender: TObject; var Value: String);
    procedure QRDBText29Print(sender: TObject; var Value: String);
    procedure QRDBText11Print(sender: TObject; var Value: String);
    procedure QRExpr6Print(sender: TObject; var Value: String);
    procedure QRExpr5Print(sender: TObject; var Value: String);
    procedure QRExpr3Print(sender: TObject; var Value: String);
    procedure QRExpr4Print(sender: TObject; var Value: String);
    procedure QRDBText2Print(sender: TObject; var Value: String);
    procedure QRDBText25Print(sender: TObject; var Value: String);
    procedure QRDBText27Print(sender: TObject; var Value: String);
    procedure QRExpr7Print(sender: TObject; var Value: String);
    procedure ChildBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText32Print(sender: TObject; var Value: String);
    procedure QRLabel4Print(sender: TObject; var Value: String);
    procedure QRLabel2Print(sender: TObject; var Value: String);
    //procedure SetParameterValues;
  private
    FAlturaBancoOriginal: Integer;
    procedure PrepararCuentasBancarias;

  public
     xtipoVenta : string;
     valorNCF : string;
     strCopia : string;
  end;

var
  qckFact8_5Ferreteria: TqckFact8_5Ferreteria;

implementation
uses UDatModCompania, UDatModClientes, UGlobal,
  UDatmodDatosGenerales, UTestImpFiscal,  URepComprobante,{ UDatModFactura, }UDatModReportes, UQckFactServ8_5BB,
  UDatModFactura, UQrJpgHelper, UUtilecftimbre, UCuentasBancoFactura;

{$R *.DFM}

procedure TqckFact8_5Ferreteria.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  if dmDatos.qryMembrete.state = dsInactive then
  begin
    dmDatos.qryMembrete.Close;
    dmDatos.qryMembrete.Params[0].Value:= glbCia_Key;
    dmDatos.qryMembrete.Open;
  end;                                
  qckFact8_5Ferreteria.AllDataSets.Add(dmCompania.tblCompania);
  qckFact8_5Ferreteria.AllDataSets.Add(dmDatos.qryMembrete);
end;

procedure TqckFact8_5Ferreteria.QRLabel23Print(sender: TObject;
  var Value: String);
begin
  Value:=VarNombreUsuario;
end;

procedure TqckFact8_5Ferreteria.QRDBText22Print(sender: TObject;
  var Value: String);
begin
  if (Value <> '') then
  Value:='NCF: '+Value;
end;

procedure TqckFact8_5Ferreteria.ChildBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  TPag.Caption:= IntToStr(qckFact8_5Ferreteria.PageNumber);
end;

procedure TqckFact8_5Ferreteria.QRSysData3Print(sender: TObject;
  var Value: String);
begin
  Value:=Value +' de ';
end;

procedure TqckFact8_5Ferreteria.ColumnHeaderBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
  var
    _xImagen : String;
begin
  begin
    if SetLogoCia(_ximagen) then
    if (_ximagen <> '') then
    begin
      QRImage1.Picture.LoadFromFile(_ximagen);
      QRImage1.Enabled:=True;
      QRImage1.Visible:=True;
      QRImage1.BringToFront;           
    end;
    LogInformacionTxt('GlbCodigoCia = '+IntToStr(GlbCodigoCia));
    LogInformacionTxt('Ruta Imagen logo:'+_ximagen);
    if (dmReportes.qryViewVentasMastFORMA_PAGO.Value = 6) then
    QRDBText23.Caption:='DEVOLUCION'
    ELSE
    if dmReportes.qryViewVentasMastDESC_TIPONCF.IsNull then
    QRDBText23.Caption:='FACTURA';
    dmCompania.tblCompania.close;
    dmCompania.tblcompania.open;
    dmCompania.tblCompania.Locate('codigo', glbCia_Key, []);
  end;
end;

procedure TqckFact8_5Ferreteria.QRDBText9Print(sender: TObject;
  var Value: String);
begin
  if Length(dmReportes.qryViewVentasMastNOMBRE_CLIENTE_GENERAL.Value) > 0  then
  Value:=dmReportes.qryViewVentasMastNOMBRE_CLIENTE_GENERAL.Value;
end;

procedure TqckFact8_5Ferreteria.QRSubDetail1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
  var
  valor : string;
begin
  if (dmReportes.qryViewVentasMastSHOWPRECIOCONITBIS.Value = 1) then
  begin
    QRDBText35.Enabled:=False;
    QRDBText25.Enabled:=True;
    //qrlblItbisenPrecio.Enabled:=True;
  end else
  begin
    QRDBText35.Enabled:=True;//dmReportes.qryViewVentasDetPRECIOSINITBIS.Value
    QRDBText25.Enabled:=False;//dmReportes.qryViewVentasDetPrecio.Value
    //qrlblItbisenPrecio.Enabled:=False;
  end;

  Valor:= dmReportes.qryViewVentasDetDescripcion.value;
  if (dmReportes.qryViewVentasDetDESCRIPCIONPRODUCTO.IsNull) or (
  (Length(dmReportes.qryViewVentasDetDESCRIPCIONPRODUCTO.Value) = 0)) then
  begin
    QRSubDetail1.HasChild := False;
  end;
end;

procedure TqckFact8_5Ferreteria.QRDBText23Print(sender: TObject;
  var Value: String);
begin
  dmreportes.qryNCFAfectado.Close;
  dmreportes.qryNCFAfectado.Params[0].Value:= dmReportes.qryViewVentasMastSERIE_NCF_ASIGNADO.Value;
  dmreportes.qryNCFAfectado.Open;
  dmreportes.qryNCFAfectado.First;
  if (dmReportes.qryViewVentasMastFORMA_PAGO.Value = 6) then
  begin
    QRDBText29.Enabled:=False;
    if Not dmreportes.qryNCFAfectadoNUMERO_NCF.IsNull then
    begin
      qrLablNCFAfectado.Caption:='NCF modificado:'+
      dmreportes.qryNCFAfectadoNUMERO_NCF.Value;
      qrLablNCFAfectado.Enabled:=True;
    end else
    qrLablNCFAfectado.Enabled:=False;
  end else
  qrLablNCFAfectado.Enabled:=False;
end;

procedure TqckFact8_5Ferreteria.QRDBText29Print(sender: TObject;
  var Value: String);
begin
  if not dmReportes.qryViewVentasMastFECHA_VENCE.IsNull then
  Value:='Válida hasta:'+Value
  else Value:='';
end;

procedure TqckFact8_5Ferreteria.QRDBText11Print(sender: TObject;
  var Value: String);
begin
Value:=StringReplace(value,'-','',[]);
end;

procedure TqckFact8_5Ferreteria.QRExpr6Print(sender: TObject;
  var Value: String);
begin
  Value:=StringReplace(value,'-','',[]);
end;

procedure TqckFact8_5Ferreteria.QRExpr5Print(sender: TObject;
  var Value: String);
begin
  Value:=StringReplace(value,'-','',[]);
end;

procedure TqckFact8_5Ferreteria.QRExpr3Print(sender: TObject;
  var Value: String);
begin
  Value:=StringReplace(value,'-','',[]);
end;

procedure TqckFact8_5Ferreteria.QRExpr4Print(sender: TObject;
  var Value: String);
begin
  Value:=StringReplace(value,'-','',[]);
end;

procedure TqckFact8_5Ferreteria.QRDBText2Print(sender: TObject;
  var Value: String);
begin
  Value:=StringReplace(value,'-','',[]);
end;

procedure TqckFact8_5Ferreteria.QRDBText25Print(sender: TObject;
  var Value: String);
begin
  Value:=StringReplace(value,'-','',[]);
end;

procedure TqckFact8_5Ferreteria.QRDBText27Print(sender: TObject;
  var Value: String);
begin
  Value:=StringReplace(value,'-','',[]);
end;

procedure TqckFact8_5Ferreteria.QRExpr7Print(sender: TObject;
  var Value: String);
  var MontoDivisa:Currency;
  tasaMoneda:Currency;
  xlbl:string;
begin
  Value:=SimboloMoneda(dmReportes.qryViewVentasMastMONEDA.Value)+Value;
  Value:=StringReplace(value,'-','',[]);
  try
    rxValorDivisa.close;
    rxValorDivisa.open;
    rxValorDivisa.Insert;
    tasaMoneda:=GlbMontoTasaByFecha('2',ExtraerFecha(dmReportes.qryViewVentasMastFecha.Value));//US
    if (tasaMoneda > 0) then
    MontoDivisa:= dmReportes.qryViewVentasMastValor_Total_det.value / tasaMoneda
    else
    MontoDivisa:= 0;

    xlbl:=QRLabel26.Caption;
    rxValorDivisaMontoTotal.Value:=MontoDivisa;
    rxValorDivisa.Post;
    if (GlbMonedaBase = 1) then
    QRLabel26.Caption := StringReplace(xlbl,'[valortasa]',InsertarComa(Format('%8.2f', [tasaMoneda])),[rfIgnoreCase])
    else
    begin
      QRLabel26.Enabled := False;
      //QRDBText34.Enabled:= False;
    end;
  except
  end;
end;

procedure TqckFact8_5Ferreteria.PrepararCuentasBancarias;
var AlturaLineas: Integer;
begin
  //if FAlturaBancoOriginal = 0 then FAlturaBancoOriginal := ChildBand4.Height;
  //ChildBand4.Height := FAlturaBancoOriginal;
  //QRMemo1.Lines.Clear; QRMemo2.Lines.Clear;
  //QRMemo3.Lines.Clear; QRMemo4.Lines.Clear;
  //QRMemo1.Enabled := False; QRMemo1.Visible := False;
  //QRMemo2.Enabled := False; QRMemo2.Visible := False;
  //QRMemo3.Enabled := False; QRMemo3.Visible := False;
  //QRMemo4.Enabled := False; QRMemo4.Visible := False;

  //if (GlBAyaco <> 1) and (GlBTapiceria <> 1) then Exit;
  //if not dmReportes.qryViewVentasMast.Active or dmReportes.qryViewVentasMast.IsEmpty then Exit;
  //if not (dmReportes.qryViewVentasMastFORMA_PAGO.AsInteger in [7, 8]) then Exit;
  //if dmReportes.qryViewVentasMastCIA_KEY.AsInteger <= 0 then
  //  raise Exception.Create('La factura no tiene empresa valida para consultar las cuentas bancarias.');

  // La consulta ya filtra CIA_KEY y ACTIVAENFCT=1. Refrescar para cada factura.
  //dmFactura.qryctabcofact.Close;
  //dmFactura.qryctabcofact.ParamByName('ciakey').AsInteger :=
  //  dmReportes.qryViewVentasMastCIA_KEY.AsInteger;
  //dmFactura.qryctabcofact.Open;
  //CargarLineasCuentasBanco(dmFactura.qryctabcofact, QRMemo1.Lines);
  //if QRMemo1.Lines.Count = 0 then Exit;

  //QRMemo1.Top := QRMemo2.Top;
  //QRMemo1.AutoSize := False;
  //QRMemo1.AutoStretch := True;
  //QRMemo1.WordWrap := True;
  //AlturaLineas := QRMemo1.Lines.Count * (Abs(QRMemo1.Font.Height) + 3) + 4;
  //QRMemo1.Height := AlturaLineas;
  //if QRMemo1.Top + AlturaLineas + 4 > ChildBand4.Height then
  //  ChildBand4.Height := QRMemo1.Top + AlturaLineas + 4;
  //QRMemo1.Enabled := True;
  //QRMemo1.Visible := True;
end;

procedure TqckFact8_5Ferreteria.ChildBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
   codseg,femision,rutaqr,urlimage: string;
begin
  urlimage:='';
  if GlbActivaECF = 0 then
  begin
    QRImage2.Enabled:= False;
    QRLabel30.Enabled:= False;
    QRLabel31.Enabled:= False;
    qrCodigoSegecf.Enabled:= False;
    qrFechaFDigital.Enabled:= False;
  end else
  begin
    urlimage:=GetUrlImageTimbre(dmFactura.qryVentaFacturaNUMERO.Value,codseg,femision);
    if (urlimage <> '') then
    begin
       SetQrUrlAsJpgToQRImage(
       urlImage,
       QRImage2,
       45,  // mm (ajústalo si quieres más grande/pequeño)
       qckFact8_5Ferreteria.PrinterSettings.PrinterIndex );

       QRImage2.Enabled:= True;
       QRLabel30.Enabled:= True;
       QRLabel31.Enabled:= True;
       qrCodigoSegecf.Enabled:= True;
       qrFechaFDigital.Enabled:= True;
       //QRImage2.Picture.LoadFromFile(rutaqr);
       qrCodigoSegecf.Caption :=codseg;
       qrFechaFDigital.Caption:=femision;
    end
    else
    begin
      rutaqr:=UUtilecftimbre.GetRutaTimbre(dmReportes.qryViewVentasMastNUMERO.Value,codseg,femision);
      if FileExists(rutaqr) then
      begin
        QRImage2.Enabled:= True;
        QRLabel30.Enabled:= True;
        QRLabel31.Enabled:= True;
        qrCodigoSegecf.Enabled:= True;
        qrFechaFDigital.Enabled:= True;
        QRImage2.Picture.LoadFromFile(rutaqr);
        qrCodigoSegecf.Caption :=codseg;
        qrFechaFDigital.Caption:=femision;
      end else
      begin
        QRImage2.Enabled:= False;
        QRLabel30.Enabled:= False;
        QRLabel31.Enabled:= False;
        qrCodigoSegecf.Enabled:= False;
        qrFechaFDigital.Enabled:= False;
        QRImage2.Visible:= False;
        QRLabel30.Visible:= False;
        QRLabel31.Visible:= False;
        qrCodigoSegecf.Visible:= False;
        qrFechaFDigital.Visible:= False;
      end;
    end;
  end;

  PrepararCuentasBancarias;
end;

procedure TqckFact8_5Ferreteria.QRDBText32Print(sender: TObject;
  var Value: String);
begin
  if (Value = '0.00') then
  Value:='' else  
  Value:=StringReplace(value,'-','',[]);
end;
                        
procedure TqckFact8_5Ferreteria.QRLabel4Print(sender: TObject;
  var Value: String);
begin
  if (strCopia = '') and GlbEsCopia then
  Value:= Value+(' (Copia)') else
  Value:= Value+strCopia;
end;

procedure TqckFact8_5Ferreteria.QRLabel2Print(sender: TObject;
  var Value: String);
begin
   if (dmReportes.qryViewVentasMastMONEDA.Value <> '1') then
   Value:=SimboloMoneda(dmReportes.qryViewVentasMastMONEDA.Value);
end;

end.
