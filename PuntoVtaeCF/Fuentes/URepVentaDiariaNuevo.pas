unit URepVentaDiariaNuevo;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  db, StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, QRExport;

type
  TqckRepVentaDiariaNuevo = class(TQuickRep)
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
    QRLabel7: TQRLabel;
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
    QRBand6: TQRBand;
    QRExpr5: TQRExpr;
    QRLabel9: TQRLabel;
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
    ChildBand2: TQRChildBand;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRExpr4: TQRExpr;
    QRDBText15: TQRDBText;
    QRLabel26: TQRLabel;
    qrTotalIngXTransf: TQRLabel;
    QRLabel27: TQRLabel;
    qrTotalTarjeta: TQRLabel;
    lblDescuento: TQRLabel;
    qrMONTO_DESC_ITEM: TQRLabel;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    QRGroup4: TQRGroup;
    QRBand7: TQRBand;
    QRExpr14: TQRExpr;
    QRExpr6: TQRExpr;
    QRLoopBand1: TQRLoopBand;
    QRDBText29: TQRDBText;
    QRDBText1: TQRDBText;
    QRLabel28: TQRLabel;
    QRLabel5: TQRLabel;
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
    procedure QRLoopBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRGroup4AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand3AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand7BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    procedure ProcTotal;
  public

  end;

var
  qckRepVentaDiariaNuevo: TqckRepVentaDiariaNuevo;
  ContDet : integer;

implementation

uses UDatModReportes, UDebitosycreditosaplicados, UDatModCxc, UGlobal,
  Math, UDatModCompania;

{$R *.DFM}

procedure TqckRepVentaDiariaNuevo.QRLabel3Print(sender: TObject;
  var Value: String);
begin
  Value := FormatDatetime(Shortdateformat,dmReportes.qryDatosRepVentaDiariaNew.Params[0].Value)+
                          ' al '+FormatDatetime(Shortdateformat,
                          dmReportes.qryDatosRepVentaDiariaNew.Params[1].Value);
end;

procedure TqckRepVentaDiariaNuevo.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  qckRepVentaDiariaNuevo.AllDataSets.Add(dmreportes.qryFPagoTicket);
  if dmCompania.tblCompania.State = dsInactive then
  dmCompania.tblCompania.Open;
  ContDet:=0;
end;

procedure TqckRepVentaDiariaNuevo.QRDBText10Print(sender: TObject;
  var Value: String);
begin
  if value = '0.00' then value :='';
end;

procedure TqckRepVentaDiariaNuevo.QRDBText11Print(sender: TObject;
  var Value: String);
begin
  if value = '0.00' then value :='';
end;

procedure TqckRepVentaDiariaNuevo.QRDBText12Print(sender: TObject;
  var Value: String);
begin
  if value = '0.00' then value :='';
end;

procedure TqckRepVentaDiariaNuevo.QRDBText8Print(sender: TObject;
  var Value: String);
begin
  if value = '0.00' then value :='';
end;

procedure TqckRepVentaDiariaNuevo.ChildBand1BeforePrint(Sender: TQRCustomBand;
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

procedure TqckRepVentaDiariaNuevo.ProcTotal;
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
    
  dmcxc.qryTipoMvtoIngreso.Close;
  dmcxc.qryTipoMvtoIngreso.Params[0].Value := ExtraerFecha(dmReportes.qryDatosRepVentaDiariaNew.Params[0].Value);
  dmcxc.qryTipoMvtoIngreso.Params[1].Value := ExtraerFecha(dmReportes.qryDatosRepVentaDiariaNew.Params[1].Value);
  dmcxc.qryTipoMvtoIngreso.Params[2].Value := glbCia_Key;
  dmcxc.qryTipoMvtoIngreso.Params[3].Value := dmReportes.qryDatosRepVentaDiariaNewMONEDA.Value;
  dmcxc.qryTipoMvtoIngreso.ExecQuery;

  //SELECT tipo_documento, Tipo_doc, SUM(DEBITO+CREDITO) monto
  qrTotalG.Caption       :='';
  qrTotalEfectivo.Caption:='';
  qrTotalCxc.Caption     :='';
  qrTotalCredito.Caption :='';
  qrTotalDevolucion.Caption :='';
  qrTotalVtaXFinanc.Caption :='';
  qrTotalIngXFinanc.Caption :='';
  total:=0;
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
        _qrTotalDevolucion:=_qrTotalDevolucion + Total;
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

procedure TqckRepVentaDiariaNuevo.QRBand3BeforePrint(Sender: TQRCustomBand;
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

procedure TqckRepVentaDiariaNuevo.QRLabel2Print(sender: TObject;
  var Value: String);
begin
  if (glbcolegio = 1) then
  Value:='Venta Servicios'; 
end;

procedure TqckRepVentaDiariaNuevo.QRExpr1Print(sender: TObject;
  var Value: String);
begin
  if (Value = '1') then
  Value:='PESOS' else
  if (Value = '2') then
  Value:='DOLLAR' else
  if (Value = '3') then
  Value:='EURO';
end;

procedure TqckRepVentaDiariaNuevo.QRLoopBand1AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  dmreportes.qryFPagoTicket.Next;
end;

procedure TqckRepVentaDiariaNuevo.QRGroup4AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  dmreportes.qryFPagoTicket.Close;
  dmreportes.qryFPagoTicket.Params[0].Value:= dmReportes.qryDatosRepVentaDiariaNewNUMERO_TRN.Value;
  dmreportes.qryFPagoTicket.Open;
  dmreportes.qryFPagoTicket.Last;
  QRLoopBand1.PrintCount:=dmreportes.qryFPagoTicket.RecordCount;
  dmreportes.qryFPagoTicket.First;
  if dmreportes.qryFPagoTicket.RecordCount = 1 then
  begin
    QRLoopBand1.Enabled:=false;
    QRLoopBand1.Height:=0;
  end else
  begin
    QRLoopBand1.Enabled:=True;
    QRLoopBand1.Height:=23;
  end;
end;

procedure TqckRepVentaDiariaNuevo.QRBand3AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  ContDet:=ContDet+1
end;

procedure TqckRepVentaDiariaNuevo.QRBand7BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if ContDet > 1 then
  PrintBand:=True
  else PrintBand:=False;
end;

end.
