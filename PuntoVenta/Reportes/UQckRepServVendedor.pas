unit UQckRepServVendedor;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckListaServtXVendedor = class(TQuickRep)
    QRBand1: TQRBand;
    qrtipoVenta: TQRLabel;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText11: TQRDBText;
    QRSysData1: TQRSysData;
    QRLabel14: TQRLabel;
    qrLabelCriterioDatos: TQRLabel;
    QRGroup1: TQRGroup;
    QRLabel9: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText9: TQRDBText;
    QRExpr1: TQRExpr;
    QRDBText4: TQRDBText;
    QRSubDetail1: TQRSubDetail;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText3: TQRDBText;
    SummaryBand1: TQRBand;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRLabel1: TQRLabel;
    QRBand2: TQRBand;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    ChildBand1: TQRChildBand;
    QRLabel3: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText5: TQRDBText;
    QRBand3: TQRBand;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRLabel13: TQRLabel;
    procedure QRDBText6Print(sender: TObject; var Value: String);
    procedure QRDBText9Print(sender: TObject; var Value: String);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public

  end;

var
  qckListaServtXVendedor: TqckListaServtXVendedor;

implementation

uses UDatModReportes, uGlobal;

{$R *.DFM}

procedure TqckListaServtXVendedor.QRDBText6Print(sender: TObject;
  var Value: String);
begin
  if not dmReportes.qryRepServTallerDetDESCRIPCIONESPECIAL.IsNull then
  Value := Value + ' ' +
  dmReportes.qryRepServTallerDetDESCRIPCIONESPECIAL.Value;
end;

procedure TqckListaServtXVendedor.QRDBText9Print(sender: TObject;
  var Value: String);
begin
  Value := dmReportes.qryRepServTallerMCODIGO_EMP.AsString + ')' + Value;
end;

procedure TqckListaServtXVendedor.QRSubDetail1BeforePrint(
 Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if (varTipousuario > 0) then
  begin
    QRDBText8.Enabled := False;
    QRDBText10.Enabled := False;
    QRExpr2.Enabled := False;
    QRExpr3.Enabled := False;
    QRExpr4.Enabled := False;
    QRExpr5.Enabled := False;
    QRExpr6.Enabled := False;
    QRExpr7.Enabled := False;
  end;
end;

end.
