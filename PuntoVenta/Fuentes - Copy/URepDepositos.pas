unit URepDepositos;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckRepDeposito = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRSysData4: TQRSysData;
    QRSysData5: TQRSysData;
    QRSysData1: TQRSysData;
    qrtpag: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel2: TQRLabel;
    QRBand2: TQRBand;
    QRGroup1: TQRGroup;
    QRSubDetail1: TQRSubDetail;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRBand3: TQRBand;
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel13: TQRLabel;
    QRBand4: TQRBand;
    QRDBText10: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRBand5: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel14: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRBand6: TQRBand;
    QRExpr2: TQRExpr;
    QRLabel12: TQRLabel;
    QRDBText15: TQRDBText;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrtpagPrint(sender: TObject; var Value: String);
    procedure QRLabel2Print(sender: TObject; var Value: String);
    procedure QRBand3AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private

  public

  end;

var
  qckRepDeposito: TqckRepDeposito;
  auxiTipoDet : Integer;
  flag : boolean;
implementation

uses UDatModCompania, UGlobal, UDatModReportes;

{$R *.DFM}

procedure TqckRepDeposito.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  flag:=false;
  qckRepDeposito.AllDataSets.Add(dmCompania.tblCompania);
end;

procedure TqckRepDeposito.qrtpagPrint(sender: TObject; var Value: String);
begin
  Value := IntToStr(glbTPag);
end;

procedure TqckRepDeposito.QRLabel2Print(sender: TObject;
  var Value: String);
begin
  Value:= FormatDateTime('dd-mmm-yyyy',dmreportes.qryRepDepositos.Params[0].Value)
  + ' al ' + FormatDateTime('dd-mmm-yyyy',dmreportes.qryRepDepositos.Params[1].Value);
end;

procedure TqckRepDeposito.QRBand3AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  flag :=False;
end;
end.
