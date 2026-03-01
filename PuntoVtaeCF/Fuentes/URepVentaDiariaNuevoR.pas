unit URepVentaDiariaNuevoR;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  db, StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, QRExport;

type
  TqckRepVentaDiariaNuevoRev = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    qrTpaginas: TQRLabel;
    QRDBText9: TQRDBText;
    QRBand2: TQRBand;
    QRLabel1: TQRLabel;
    QRTARIFA: TQRLabel;
    QRExpr1: TQRExpr;
    QRBand3: TQRBand;
    qrFechaTrn: TQRDBText;
    QRDBText8: TQRDBText;
    QRBand5: TQRBand;
    QRExpr3: TQRExpr;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel17: TQRLabel;
    QRSysData3: TQRSysData;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRBand4: TQRBand;
    QRExpr2: TQRExpr;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    ChildBand1: TQRChildBand;
    QRLabel20: TQRLabel;
    qrTotalEfectivo: TQRLabel;
    QRLabel21: TQRLabel;
    qrTotalCredito: TQRLabel;
    QRLabel22: TQRLabel;
    qrTotalCxc: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    qrTotalDevolucion: TQRLabel;
    QRLabel16: TQRLabel;
    qrTotalG: TQRLabel;
    qrTotal: TQRLabel;
    QRLabel23: TQRLabel;
    qrTotalIngXFinanc: TQRLabel;
    QRLabel25: TQRLabel;
    qrTotalVtaXFinanc: TQRLabel;
    QRLabel24: TQRLabel;
    QRExpr4: TQRExpr;
    QRDBText15: TQRDBText;
    QRLabel26: TQRLabel;
    qrTotalIngXTransf: TQRLabel;
    QRLabel27: TQRLabel;
    qrTotalTarjeta: TQRLabel;
    lblDescuento: TQRLabel;
    qrMONTO_DESC_ITEM: TQRLabel;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    QRBand7: TQRBand;
    QRExpr14: TQRExpr;
    QRExpr6: TQRExpr;
    QRLabel28: TQRLabel;
    QRGroup3: TQRGroup;
    QRLabel5: TQRLabel;
    drpagolbl: TQRLabel;
    QRExpr5: TQRExpr;
    procedure QRLabel3Print(sender: TObject; var Value: String);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRDBText10Print(sender: TObject; var Value: String);
    procedure QRDBText11Print(sender: TObject; var Value: String);
    procedure QRDBText12Print(sender: TObject; var Value: String);
    procedure QRDBText8Print(sender: TObject; var Value: String);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRLabel2Print(sender: TObject; var Value: String);
    procedure QRExpr1Print(sender: TObject; var Value: String);
    procedure QRBand3AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand7BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText7Print(sender: TObject; var Value: String);
  private
    procedure ProcTotal;
  public

  end;

var
  qckRepVentaDiariaNuevoRev: TqckRepVentaDiariaNuevoRev;
  ContDet : integer;

implementation

uses UDatModReportes, UDebitosycreditosaplicados, UDatModCxc, UGlobal,
  Math, UDatModCompania;

{$R *.DFM}

procedure TqckRepVentaDiariaNuevoRev.QRLabel3Print(sender: TObject;
  var Value: String);
begin
  Value := FormatDatetime(Shortdateformat,dmReportes.qryDatosRepVentaDiariaNew.Params[0].Value)+
                          ' al '+FormatDatetime(Shortdateformat,
                          dmReportes.qryDatosRepVentaDiariaNew.Params[1].Value);
end;

procedure TqckRepVentaDiariaNuevoRev.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  qckRepVentaDiariaNuevoRev.AllDataSets.Add(dmreportes.qryFPagoTicketV2);
  if dmCompania.tblCompania.State = dsInactive then
  dmCompania.tblCompania.Open;
  ContDet:=0;
end;

procedure TqckRepVentaDiariaNuevoRev.QRDBText10Print(sender: TObject;
  var Value: String);
begin
  if value = '0.00' then value :='';
end;

procedure TqckRepVentaDiariaNuevoRev.QRDBText11Print(sender: TObject;
  var Value: String);
begin
  if value = '0.00' then value :='';
end;

procedure TqckRepVentaDiariaNuevoRev.QRDBText12Print(sender: TObject;
  var Value: String);
begin
  if value = '0.00' then value :='';
end;

procedure TqckRepVentaDiariaNuevoRev.QRDBText8Print(sender: TObject;
  var Value: String);
begin
  if value = '0.00' then value :='';
end;

procedure TqckRepVentaDiariaNuevoRev.ChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrTotalVtaXFinanc.Caption:='';
  qrTotalIngXTransf.Caption:='';
  qrTotalEfectivo.Caption:='';
  qrTotalCredito.Caption:='';
  qrTotalIngXFinanc.Caption:='';
  qrTotalIngXTransf.Caption:='';
  qrTotalVtaXFinanc.Caption:='';
  qrTotalCxc.Caption:='';
  qrTotalDevolucion.Caption:='';
  qrTotalG.Caption:='';
  
  ProcTotal;

end;

procedure TqckRepVentaDiariaNuevoRev.ProcTotal;
var
  Suma, Total : Real;
  _qrTotalEfectivo : Currency;
  _qrTotalCxc : Currency;
  _qrTotalCredito : Currency;
  _qrTotalDevolucion : Currency;
  _qrTotalVtaXFinanc : Currency;
  _qrTotalIngXFinanc : Currency;
  _qrTotalIngXTransf : Currency;
  _qrTotaltarjeta : Currency;
  _qrMONTO_DESC_ITEM : Currency;
begin
  Suma:=0;

  _qrTotalEfectivo   :=0;
  _qrTotalCxc        :=0;
  _qrTotalCredito    :=0;
  _qrTotalDevolucion :=0;
  _qrTotalVtaXFinanc :=0;
  _qrTotalIngXFinanc :=0;
  _qrTotalIngXTransf :=0;
  _qrTotaltarjeta    :=0;
  _qrMONTO_DESC_ITEM :=0;     


  //SELECT tipo_documento, Tipo_doc, SUM(DEBITO+CREDITO) monto
  qrTotalG.Caption       :='';
  qrTotalEfectivo.Caption:='';
  qrTotalCxc.Caption     :='';
  qrTotalCredito.Caption :='';
  qrTotalDevolucion.Caption :='';
  qrTotalVtaXFinanc.Caption :='';
  qrTotalIngXFinanc.Caption :='';
  total:=0;

  dmcxc.qryTipoMvtoIngreso.Close;
  dmcxc.qryTipoMvtoIngreso.Params[0].Value := ExtraerFecha(dmReportes.qryDatosRepVentaDiariaNew.Params[0].Value);
  dmcxc.qryTipoMvtoIngreso.Params[1].Value := ExtraerFecha(dmReportes.qryDatosRepVentaDiariaNew.Params[1].Value);
  dmcxc.qryTipoMvtoIngreso.Params[2].Value := glbCia_Key;
  dmcxc.qryTipoMvtoIngreso.Params[3].Value := dmReportes.qryDatosRepVentaDiariaNewMONEDA.Value;
  dmcxc.qryTipoMvtoIngreso.ExecQuery;

  if dmcxc.qryTipoMvtoIngreso.open then
  begin
    While Not dmcxc.qryTipoMvtoIngreso.Eof do
    begin
      if (dmcxc.qryTipoMvtoIngreso.FieldByName('tipo_doc').AsInteger = 1)
         and (dmcxc.qryTipoMvtoIngreso.FieldByName('ESCXC').AsInteger = 1) then
      begin
        total:= dmcxc.qryTipoMvtoIngreso.FieldByName('Monto').AsFloat;
        _qrTotalCxc := _qrTotalCxc + total
      end else  
      if (dmcxc.qryTipoMvtoIngreso.FieldByName('tipo_doc').AsInteger = 1)  and
         (dmcxc.qryTipoMvtoIngreso.FieldByName('ESCXC').AsInteger = 0)
         and (UpperCase(TRIM(dmcxc.qryTipoMvtoIngreso.FieldByName('tipo_documento').AsString)) <> 'TRANSFERENCIA') then
      begin
        total:= dmcxc.qryTipoMvtoIngreso.FieldByName('Monto').AsFloat;
        _qrTotalEfectivo:=_qrTotalEfectivo + Total;
      end else
      if (dmcxc.qryTipoMvtoIngreso.FieldByName('tipo_doc').AsInteger = 2) then
      begin
        total:= dmcxc.qryTipoMvtoIngreso.FieldByName('Monto').AsFloat;
        _qrTotaltarjeta:=_qrTotaltarjeta + Total;
      end else
      if (dmcxc.qryTipoMvtoIngreso.FieldByName('tipo_doc').AsInteger = 6) then
      begin
        total:= dmcxc.qryTipoMvtoIngreso.FieldByName('Monto').AsFloat;
        _qrTotalDevolucion:=_qrTotalDevolucion + Abs(Total)*-1;
      end else
      if (dmcxc.qryTipoMvtoIngreso.FieldByName('tipo_doc').AsInteger = 7) then
      begin
        total:= dmcxc.qryTipoMvtoIngreso.FieldByName('Monto').AsFloat;
        _qrTotalCredito:= _qrTotalCredito + Total;
      end else
      if (dmcxc.qryTipoMvtoIngreso.FieldByName('tipo_doc').AsInteger = 15) then
      begin
        total:= dmcxc.qryTipoMvtoIngreso.FieldByName('Monto').AsFloat;
        _qrTotalIngXFinanc:=_qrTotalIngXFinanc + Total;
      end else
      if (dmcxc.qryTipoMvtoIngreso.FieldByName('tipo_doc').AsInteger = 16) then
      begin
        total:= dmcxc.qryTipoMvtoIngreso.FieldByName('Monto').AsFloat;
        _qrTotalVtaXFinanc:=_qrTotalVtaXFinanc + Total;
      end else
      if (dmcxc.qryTipoMvtoIngreso.FieldByName('tipo_doc').AsInteger = 20) or
      (UpperCase(TRIM(dmcxc.qryTipoMvtoIngreso.FieldByName('tipo_documento').AsString)) = 'TRANSFERENCIA') then
      begin
        total:= dmcxc.qryTipoMvtoIngreso.FieldByName('Monto').AsFloat;
        _qrTotalIngXTransf:=_qrTotalIngXTransf + Total;
      end;

      if (not dmcxc.qryTipoMvtoIngreso.FieldByName('MONTO_DESC_ITEM').IsNull) then
      _qrMONTO_DESC_ITEM:=_qrMONTO_DESC_ITEM + dmcxc.qryTipoMvtoIngreso.FieldByName('MONTO_DESC_ITEM').Value;

      Suma:=Suma + total;
      total:=0;
      dmcxc.qryTipoMvtoIngreso.Next;
    end;
    qrTotalEfectivo.Caption   :=Format('%*.*m', [10,2,_qrTotalEfectivo]);
    qrTotalCxc.Caption        :=Format('%*.*m', [10,2,_qrTotalCxc]);
    qrTotalCredito.Caption    :=Format('%*.*m', [10,2,_qrTotalCredito]);
    qrTotalDevolucion.Caption :=Format('%*.*m', [10,2,_qrTotalDevolucion]);
    qrTotalVtaXFinanc.Caption :=Format('%*.*m', [10,2,_qrTotalVtaXFinanc]);
    qrTotalIngXFinanc.Caption :=Format('%*.*m', [10,2,_qrTotalIngXFinanc]);
    qrTotalIngXTransf.Caption :=Format('%*.*m', [10,2,_qrTotalIngXTransf]);
    qrTotaltarjeta.Caption    :=Format('%*.*m', [10,2,_qrTotaltarjeta]);
    qrMONTO_DESC_ITEM.Caption :=Format('%*.*m', [10,2,_qrMONTO_DESC_ITEM]);
    //qrTotalG.Caption := Format('%*.*m', [10,2,Suma - _qrMONTO_DESC_ITEM]);
    qrTotalG.Caption := Format('%*.*m', [10,2,Suma]);
  end;
end;

procedure TqckRepVentaDiariaNuevoRev.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  //dmReportes.qryDatosRepVentaDiariaSubDetail.Filtered:=False;
  dmReportes.filtrarNUMERO_TRN := dmReportes.qryDatosRepVentaDiariaNewNUMERO_TRN.Value;
  //dmReportes.qryDatosRepVentaDiariaSubDetail.Filtered:=True;
  QRLabel23.Visible := False;
  QRLabel23.Caption := '';
  if (dmReportes.qryDatosRepVentaDiariaNewNUMERO_DOCUMENTO.IsNull) then
  begin
    QRLabel23.Visible := True;
    QRLabel23.BringToFront;
    if dmReportes.qryDatosRepVentaDiariaNewNUMERO_FACTURA.IsNull then
    QRLabel23.Caption := dmReportes.qryDatosRepVentaDiariaNewNUMERO_TRN.AsString
    else
    QRLabel23.Caption := dmReportes.qryDatosRepVentaDiariaNewNUMERO_FACTURA.AsString;
  end else
  QRLabel23.Caption := dmReportes.qryDatosRepVentaDiariaNewNUMERO_DOCUMENTO.AsString;
end;

procedure TqckRepVentaDiariaNuevoRev.QRLabel2Print(sender: TObject;
  var Value: String);
begin
  if (glbcolegio = 1) then
  Value:='Venta Servicios'; 
end;

procedure TqckRepVentaDiariaNuevoRev.QRExpr1Print(sender: TObject;
  var Value: String);
begin
  if (Value = '1') then
  Value:='PESOS' else
  if (Value = '2') then
  Value:='DOLLAR' else
  if (Value = '3') then
  Value:='EURO';
end;

procedure TqckRepVentaDiariaNuevoRev.QRBand3AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  ContDet:=ContDet+1
end;

procedure TqckRepVentaDiariaNuevoRev.QRBand7BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if ContDet > 1 then
  PrintBand:=True
  else PrintBand:=False;
end;

procedure TqckRepVentaDiariaNuevoRev.QRGroup3BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
  var
     strpagos:string;
     tPagado:Currency;
     _countR : Integer;
begin
  //dmreportes.qryFPagoTicket.Close;
  dmreportes.qryFPagoTicketV2.Filtered:=false;
  if not dmReportes.qryDatosRepVentaDiariaNewNUMERO_TRN.IsNull then
  dmreportes.strnumerotrn :=dmReportes.qryDatosRepVentaDiariaNewNUMERO_TRN.AsString
  else
  dmreportes.strnumerotrn := '-1';
  
  dmreportes.qryFPagoTicketV2.Filtered:=True;
  //if dmreportes.qryFPagoTicketV2Numero.IsNull or (dmreportes.qryFPagoTicketV2.RecordCount <=1) then
  //  PrintBand:=False
  //else
  begin
    PrintBand:=True;
    tPagado:=0;
    _countR:=0;
    strpagos:='';
    While Not dmreportes.qryFPagoTicketV2.Eof do
    begin
      tPagado:=tPagado + dmReportes.qryFPagoTicketV2MONTOPAGADODET.Value;
      strpagos :=strpagos + Trim(dmReportes.qryFPagoTicketV2DESCRIPCION.Value) +': '+
      InsertarComa(Format('%8.2f', [dmReportes.qryFPagoTicketV2MONTOPAGADODET.Value]))+' ';
      _countR:=_countR + 1;
      dmreportes.qryFPagoTicketV2.Next;
    end;
    if (strpagos = '') then
    PrintBand:=False;
    dmreportes.qryFPagoTicketV2.Filtered:=False;
    dmreportes.qryFPagoTicketV2.First;
    if _countR <=1 then
    PrintBand:=False;
  end;
  if (strpagos <> '') then
  drpagolbl.Caption:=strpagos+' Total Pagado: '+InsertarComa(Format('%8.2f', [tPagado]));
end;

procedure TqckRepVentaDiariaNuevoRev.QRDBText7Print(sender: TObject;
  var Value: String);
begin
  if (Value = '') and (dmReportes.qryDatosRepVentaDiariaNewESCXC.Value = 1 ) then
    Value:='. Fact. No. '+dmReportes.qryDatosRepVentaDiariaNewNUMERO_FACTURA.AsString
  else
  if (dmReportes.qryDatosRepVentaDiariaNewESCXC.Value = 1) then
  Value:=Trim(Value) + '. Fact. No. '+dmReportes.qryDatosRepVentaDiariaNewNUMERO_FACTURA.AsString;
  dmReportes.qryDatosRepVentaDiariaNewVALOR_VENTA_DET.Value;
end;

end.
