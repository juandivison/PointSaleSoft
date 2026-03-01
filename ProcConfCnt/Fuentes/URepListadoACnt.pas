unit URepListadoACnt;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TqckListadoAcnt = class(TQuickRep)
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
    QRBand3: TQRBand;
    QRExpr1: TQRExpr;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRBand4: TQRBand;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRLabel10: TQRLabel;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    procedure qrNoPaginaPrint(sender: TObject; var Value: String);
    procedure qrFechaPrint(sender: TObject; var Value: String);
    procedure QRDBText2Print(sender: TObject; var Value: String);
    procedure QRDBText3Print(sender: TObject; var Value: String);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public

  end;

var
  qckListadoAcnt: TqckListadoAcnt;

implementation
uses UDatModcxc,UDatModCxP, uglobal, UDatModCompania;
{$R *.DFM}

procedure TqckListadoAcnt.qrNoPaginaPrint(sender: TObject;
  var Value: String);
begin
  Value:='de '+InttoStr(glbTPag);
end;

procedure TqckListadoAcnt.qrFechaPrint(sender: TObject;
  var Value: String);
begin
  Value:=FormatDateTime('yyyy-mm-dd',glbfechainicial)+ ' a '+
  FormatDateTime('yyyy-mm-dd',glbfechaFinal);
end;

procedure TqckListadoAcnt.QRDBText2Print(sender: TObject;
  var Value: String);
begin
  if value = '0.00' then value:='';
end;

procedure TqckListadoAcnt.QRDBText3Print(sender: TObject;
  var Value: String);
begin
  if value = '0.00' then value:='';
end;

procedure TqckListadoAcnt.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  qckListadoAcnt.AllDataSets.Add(dmCompania.tblCompania);
end;

procedure TqckListadoAcnt.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if (dmcxc.rxTranCntrxCuenta1.Value = '999') then
  PrintBand:=False;
end;

end.
