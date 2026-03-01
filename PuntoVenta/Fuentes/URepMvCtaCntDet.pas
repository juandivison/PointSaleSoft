unit URepMvCtaCntDet;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TqckListMvCtacntDet = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel3: TQRLabel;
    qrFecha: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    qrNoPagina: TQRLabel;
    QRSysData2: TQRSysData;
    QRBand2: TQRBand;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
    QRBand3: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRDBText1: TQRDBText;
    QRBand4: TQRBand;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRLabel10: TQRLabel;
    QRGroup1: TQRGroup;
    QRExpr1: TQRExpr;
    QRDBText4: TQRDBText;
    QRBand5: TQRBand;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRLabel13: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText16: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText17: TQRDBText;
    QRLabel1: TQRLabel;
    QRDBText5: TQRDBText;
    procedure qrNoPaginaPrint(sender: TObject; var Value: String);
    procedure qrFechaPrint(sender: TObject; var Value: String);
    procedure QRDBText2Print(sender: TObject; var Value: String);
    procedure QRDBText3Print(sender: TObject; var Value: String);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRLabel3Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  qckListMvCtacntDet: TqckListMvCtacntDet;

implementation
uses UDatModcxc, uglobal, UDatModCompania;
{$R *.DFM}

procedure TqckListMvCtacntDet.qrNoPaginaPrint(sender: TObject;
  var Value: String);
begin
  Value:='de '+InttoStr(glbTPag);
end;

procedure TqckListMvCtacntDet.qrFechaPrint(sender: TObject;
  var Value: String);
begin
  Value:=FormatDateTime('yyyy-mm-dd',glbfechainicial)+ ' a '+
  FormatDateTime('yyyy-mm-dd',glbfechaFinal);
end;

procedure TqckListMvCtacntDet.QRDBText2Print(sender: TObject;
  var Value: String);
begin
  if value = '0.00' then value:='';
end;

procedure TqckListMvCtacntDet.QRDBText3Print(sender: TObject;
  var Value: String);
begin
  if value = '0.00' then value:='';
end;

procedure TqckListMvCtacntDet.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  qckListMvCtacntDet.AllDataSets.Add(dmCompania.tblCompania);
end;

procedure TqckListMvCtacntDet.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if (dmcxc.rxTranCntrxCuenta1.Value = '999') or
  (dmcxc.rxTranCntrxCuenta1.Value = '9999999') then
  PrintBand:=False;
end;

procedure TqckListMvCtacntDet.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if (dmcxc.rxTranCntrxCuenta1.Value = '999') or
  (dmcxc.rxTranCntrxCuenta1.Value = '9999999') then
  PrintBand:=False;
end;

procedure TqckListMvCtacntDet.QRLabel3Print(sender: TObject;
  var Value: String);
begin
  if (GlbDescTipoCNT <> '') then
  Value := GlbDescTipoCNT;
end;

end.
