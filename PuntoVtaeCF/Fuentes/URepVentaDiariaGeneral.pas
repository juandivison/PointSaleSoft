unit URepVentaDiariaGeneral;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  db,StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, QRExport;

type
  TqckRepVentaDiariaGeneral = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    qrTpaginas: TQRLabel;
    QRDBText9: TQRDBText;
    QRBand2: TQRBand;
    QRExpr1: TQRExpr;
    QRBand3: TQRBand;
    QRDBText8: TQRDBText;
    QRBand5: TQRBand;
    QRLabel4: TQRLabel;
    QRBand4: TQRBand;
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
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    qrTotalDevolucion: TQRLabel;
    QRLabel16: TQRLabel;
    qrTotalG: TQRLabel;
    qrTotal: TQRLabel;
    qrTotalIngXFinanc: TQRLabel;
    QRLabel25: TQRLabel;
    qrTotalVtaXFinanc: TQRLabel;
    QRLabel24: TQRLabel;
    ChildBand2: TQRChildBand;
    QRCSVFilter1: TQRCSVFilter;
    QRExpr4: TQRExpr;
    QRDBText17: TQRDBText;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    qrTotalCardnet: TQRLabel;
    qrTotalVisaNet: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel1: TQRLabel;
    qrTotalAzul: TQRLabel;
    QRLabel26: TQRLabel;
    qrTotalIngXTransf: TQRLabel;
    QRLabel6: TQRLabel;
    qrTotalTarjeta: TQRLabel;
    QRExpr9: TQRExpr;
    qrMONTO_DESC_ITEM: TQRLabel;
    QRLabel5: TQRLabel;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    QRGroup3: TQRGroup;
    procedure QRLabel3Print(sender: TObject; var Value: String);
    procedure QRDBText10Print(sender: TObject; var Value: String);
    procedure QRDBText11Print(sender: TObject; var Value: String);
    procedure QRDBText12Print(sender: TObject; var Value: String);
    procedure QRDBText8Print(sender: TObject; var Value: String);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRLabel2Print(sender: TObject; var Value: String);
    procedure QRExpr1Print(sender: TObject; var Value: String);
    procedure QRExpr4Print(sender: TObject; var Value: String);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRLabel12Print(sender: TObject; var Value: String);
  private
    procedure ProcTotal;
    procedure ProcesaCobroVisaNetCardNet;
  public

  end;

var
  qckRepVentaDiariaGeneral: TqckRepVentaDiariaGeneral;

implementation

uses UDatModReportes, UDebitosycreditosaplicados, UDatModCxc, UGlobal,
  Math, UDatModCompania;

{$R *.DFM}

procedure TqckRepVentaDiariaGeneral.QRLabel3Print(sender: TObject;
  var Value: String);
begin
  Value := FormatDatetime(Shortdateformat,dmReportes.qryDatosRepVentaDiariaRes.Params[0].Value)+
                          ' al '+FormatDatetime(Shortdateformat,
                          dmReportes.qryDatosRepVentaDiariaRes.Params[1].Value);
end;

procedure TqckRepVentaDiariaGeneral.QRDBText10Print(sender: TObject;
  var Value: String);
begin
  if value = '0.00' then value :='';
end;

procedure TqckRepVentaDiariaGeneral.QRDBText11Print(sender: TObject;
  var Value: String);
begin
  if Value = '0.00' then value :='';
end;

procedure TqckRepVentaDiariaGeneral.QRDBText12Print(sender: TObject;
  var Value: String);
begin
  if Value = '0.00' then value :='';
end;

procedure TqckRepVentaDiariaGeneral.QRDBText8Print(sender: TObject;
  var Value: String);
begin
  if Value = '0.00' then value :='';
end;

procedure TqckRepVentaDiariaGeneral.ChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrTotalVtaXFinanc.Caption:='';
  ProcTotal;
  ProcesaCobroVisaNetCardNet;
  if varTipousuario >= 2 then
  PrintBand:=False
  else PrintBand:=True;  
end;

procedure TqckRepVentaDiariaGeneral.ProcTotal;
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
  _qrMONTO_DESC_ITEM: Currency;
begin
  Suma:=0;

  _qrTotalEfectivo :=0;
  _qrTotalCxc :=0;
  _qrTotalCredito :=0;
  _qrTotalDevolucion :=0;
  _qrTotalVtaXFinanc :=0;
  _qrTotalIngXFinanc :=0;
  _qrTotalIngXTransf :=0;
  _qrTotaltarjeta :=0;
  _qrMONTO_DESC_ITEM:=0;

  dmcxc.qryTipoMvtoIngreso.Close;
  dmcxc.qryTipoMvtoIngreso.Params[0].Value := ExtraerFecha(dmReportes.qryDatosRepVentaDiariaRes.Params[0].Value);
  dmcxc.qryTipoMvtoIngreso.Params[1].Value := ExtraerFecha(dmReportes.qryDatosRepVentaDiariaRes.Params[1].Value);
  dmcxc.qryTipoMvtoIngreso.Params[2].Value := glbCia_Key;
  dmcxc.qryTipoMvtoIngreso.Params[3].Value := dmReportes.qryDatosRepVentaDiariaResMONEDA.Value;
  dmcxc.qryTipoMvtoIngreso.ExecQuery;

  //SELECT tipo_documento, Tipo_doc, SUM(DEBITO+CREDITO) monto
  qrTotalG.Caption          :='';
  qrTotalEfectivo.Caption   :='';
  qrTotalCxc.Caption        :='';
  qrTotalCredito.Caption    :='';
  qrTotalDevolucion.Caption :='';
  qrTotalVtaXFinanc.Caption :='';
  qrTotalIngXFinanc.Caption :='';
  qrTotalIngXTransf.Caption :='';
  qrTotalTarjeta.Caption :='';
  qrMONTO_DESC_ITEM.Caption :='';

  if dmcxc.qryTipoMvtoIngreso.Open then
  begin
    While Not dmcxc.qryTipoMvtoIngreso.Eof Do
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
        _qrTotalDevolucion:=_qrTotalDevolucion + (Total)*-1;
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
    //antes qrTotalG.Caption := Format('%*.*m', [10,2,Suma-_qrMONTO_DESC_ITEM]);
    qrTotalG.Caption := Format('%*.*m', [10,2,Suma]);
  end;
end;

procedure TqckRepVentaDiariaGeneral.QRLabel2Print(sender: TObject;
  var Value: String);
begin
  if (glbcolegio = 1) then
  Value:='Venta Servicios';
end;

procedure TqckRepVentaDiariaGeneral.QRExpr1Print(sender: TObject;
  var Value: String);
begin
  if (Value = '1') then
  Value:='PESOS' else
  if (Value = '2') then
  Value:='DOLLAR' else
  if (Value = '3') then
  Value:='EURO';
end;

procedure TqckRepVentaDiariaGeneral.QRExpr4Print(sender: TObject;
  var Value: String);
begin
  Value:='Usuario: '+Value;
end;

procedure TqckRepVentaDiariaGeneral.ProcesaCobroVisaNetCardNet;
begin
  dmcxc.qryCobrosConTarjetaCuadreG.Close;
  dmcxc.qryCobrosConTarjetaCuadreG.Params[0].Value:= ExtraerFecha(dmReportes.qryDatosRepVentaDiariaRes.Params[0].Value);
  dmcxc.qryCobrosConTarjetaCuadreG.Params[1].Value:= ExtraerFecha(dmReportes.qryDatosRepVentaDiariaRes.Params[1].Value);
  if (not dmReportes.qryDatosRepVentaDiariaResMoneda.IsNull) and (dmReportes.qryDatosRepVentaDiariaResMoneda.Value <> '') then
  begin
    dmcxc.qryCobrosConTarjetaCuadreG.Params[2].Value:= dmReportes.qryDatosRepVentaDiariaResMoneda.Value;
    dmcxc.qryCobrosConTarjetaCuadreG.Params[3].Value:= dmReportes.qryDatosRepVentaDiariaResMONEDA.Value;
  end else
  begin
    dmcxc.qryCobrosConTarjetaCuadreG.Params[2].Value:= dmReportes.qryDatosRepVentaDiariaRes.Params[2].Value;
    dmcxc.qryCobrosConTarjetaCuadreG.Params[3].Value:= dmReportes.qryDatosRepVentaDiariaRes.Params[3].Value;
  end;
  dmcxc.qryCobrosConTarjetaCuadreG.Open;

  dmcxc.qryCobrosConTarjetaCuadreG.First;

  qrTotalCardnet.Caption := Format('%*.*m', [10,2, 0.0]);
  qrTotalVisaNet.Caption := Format('%*.*m', [10,2, 0.0]);
  qrTotalAzul.Caption := Format('%*.*m', [10,2, 0.0]);

  While Not dmcxc.qryCobrosConTarjetaCuadreG.Eof Do
  begin
    //1-visanet 2-CarNET 3-Azul
    if dmcxc.qryCobrosConTarjetaCuadreGCODIGO_PROVEEDOR.Value = 3 then
    qrTotalAzul.Caption := Format('%*.*m', [10,2, dmcxc.qryCobrosConTarjetaCuadreGMONTO.Value])
    else
    if dmcxc.qryCobrosConTarjetaCuadreGCODIGO_PROVEEDOR.Value = 2 then
    qrTotalCardnet.Caption := Format('%*.*m', [10,2, dmcxc.qryCobrosConTarjetaCuadreGMONTO.Value])
    else
    if dmcxc.qryCobrosConTarjetaCuadreGCODIGO_PROVEEDOR.Value = 1 then
    qrTotalVisaNet.Caption := Format('%*.*m', [10,2, dmcxc.qryCobrosConTarjetaCuadreGMONTO.Value]);
    
    dmcxc.qryCobrosConTarjetaCuadreG.Next;
  end;
end;

procedure TqckRepVentaDiariaGeneral.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  if dmCompania.tblCompania.state = dsInactive then
  begin
    dmCompania.tblCompania.Open;
    dmCompania.tblCompania.Locate('codigo',glbCia_Key,[]);
    GlbNombreCia := UpperCase(dmCompania.tblCompaniaNOMBRE.Value);
  end;
end;

procedure TqckRepVentaDiariaGeneral.QRLabel12Print(sender: TObject;
  var Value: String);
begin
  Value:=Value+': '+dmReportes.QryRepVtaMasterNumero_trn.AsString;
end;

end.
