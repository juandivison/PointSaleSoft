unit UFactLimao01;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  DB, StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, jpeg, RxMemDS;

type
  TqckFacturaLimao01 = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRImage1: TQRImage;
    ChildBand1: TQRChildBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText23: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel6: TQRLabel;
    ChildBand2: TQRChildBand;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    ChildBand3: TQRChildBand;
    QRLabel12: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRDBText7: TQRDBText;
    QRDBText5: TQRDBText;
    QRBand1: TQRBand;
    QRLabel15: TQRLabel;
    QRExpr5: TQRExpr;
    QRLabel16: TQRLabel;
    QRDBText17: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText6: TQRDBText;
    ChildBand4: TQRChildBand;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRDBText11: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText21: TQRDBText;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    rxData: TRxMemoryData;
    rxDataMontoTotal: TCurrencyField;
    rxDataItbis: TCurrencyField;
    rxDataValorFinal: TCurrencyField;
    QRDBText4: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRDBText14: TQRDBText;
    rxDataItbisAPagar: TCurrencyField;
    QRDBText18: TQRDBText;
    QRDBText24: TQRDBText;
    QRLabel22: TQRLabel;
    QRDBText25: TQRDBText;
    ChildBand5: TQRChildBand;
    QRDBText8: TQRDBText;
    QRDBText26: TQRDBText;
    QRLabel23: TQRLabel;
    QRDBText27: TQRDBText;
    procedure QRDBText23Print(sender: TObject; var Value: String);
    procedure QRDBText1Print(sender: TObject; var Value: String);
    procedure PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRDBText13Print(sender: TObject; var Value: String);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public

  end;

var
  qckFacturaLimao01: TqckFacturaLimao01;

implementation
uses UDatModCompania, UDatModClientes, UGlobal,
  UDatmodDatosGenerales, URepComprobante, UDatModReportes, UDatModFactura,
  UDatosVentas;

{$R *.DFM}

procedure TqckFacturaLimao01.QRDBText23Print(sender: TObject;
  var Value: String);
begin                       
  ProcNCFAfectado(dmReportes.qryViewVentasMastSERIE_NCF_ASIGNADO.Value);
  dmreportes.qryNCFAfectado.First;
end;

procedure TqckFacturaLimao01.QRDBText1Print(sender: TObject;
  var Value: String);
begin
  //Value:='Válida hasta:' + Value;
  //if not dmfactura.qryVentaFacturaFECHAVENCENCF.IsNull then
  Value := 'Válida Hasta:'+FormatDatetime('dd/mm/yyyy',dmfactura.qryVentaFacturaFECHAVENCENCF.Value)
  //else
  //Value:='Fecha Vence: '+Value;
end;

procedure TqckFacturaLimao01.PageHeaderBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
 var
    _xImagen : String;
begin
  if SetLogoCia(_ximagen) then
  if (_ximagen <> '') then
  QRImage1.Picture.LoadFromFile(_ximagen);
  
  if (dmFactura.qryVentaFacturaTIPONCFIFISCAL.Value = 0) or
    (dmFactura.qryVentaFacturaTIPONCFIFISCAL.Value = 2) then
  begin
    QRDBText1.Enabled:=False;
  end;
end;

procedure TqckFacturaLimao01.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
  var
    porc : Real;
begin
  if dmVentas.qryVentaVocados.state  = dsInactive then
  begin
    dmVentas.qryVentaVocados.Close;
    dmVentas.qryVentaVocados.Params[0].Value:= dmFactura.qryVentaFacturaNUMERO.Value;
    dmVentas.qryVentaVocados.Open;
  end;
  rxData.close;
  rxData.Open;
  rxData.Append;
  
  if Not dmVentas.qryVentaVocadosPAGA_PORC_ITBIS.IsNull then
  porc:=dmVentas.qryVentaVocadosPAGA_PORC_ITBIS.Value
  else porc:=1;

  rxDataMontoTotal.Value:= dmFactura.qryVentaFacturaVALOR_TOTAL_DET.Value -
  dmFactura.qryVentaFacturaMONTO_TOTAL_ITBIS.Value;
  rxDataItbis.Value := dmFactura.qryVentaFacturaMONTO_TOTAL_ITBIS.Value;
  if porc > 0 then
  rxDataValorFinal.Value:=rxDataMontoTotal.Value +
  (rxDataItbis.Value * porc)/100
  else
  rxDataValorFinal.Value:=rxDataMontoTotal.Value;

  rxDataItbisAPagar.Value:= (rxDataItbis.Value *
                             porc)/100;
  rxData.Post;
  if dmDatos.qryMembrete.state = dsInactive then
  begin
    dmDatos.qryMembrete.Close;
    dmDatos.qryMembrete.Params[0].Value:= glbCia_Key;
    dmDatos.qryMembrete.Open;
  end;
  dmVentas.qryVentaVocados.Close;
  dmVentas.qryVentaVocados.Params[0].Value:=dmReportes.qryViewVentasMastNUMERO.Value;
  dmVentas.qryVentaVocados.Open;
  qckFacturaLimao01.AllDataSets.Add(dmVentas.qryVentaVocados);
  qckFacturaLimao01.AllDataSets.Add(dmDatos.qryMembrete);
end;

procedure TqckFacturaLimao01.QRDBText13Print(sender: TObject;
  var Value: String);
begin
  Value:='RNC: '+Value;
end;

procedure TqckFacturaLimao01.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if dmFactura.qryVentaFacturaDetDESCRIPCIONADICIONAL.IsNull then
  QRSubDetail1.HasChild:=False;
end;

end.
