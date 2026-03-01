unit URepbleGrl;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  Dialogs,StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables;

type
  TqckBceGral = class(TQuickRep)
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRExpr1: TQRExpr;
    QRDBText1: TQRDBText;
    QRBand4: TQRBand;
    QRShape1: TQRShape;
    QRBand5: TQRBand;
    QRSysData2: TQRSysData;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRSysData3: TQRSysData;
    QRSysData4: TQRSysData;
    QRSysData5: TQRSysData;
    QRLabel8: TQRLabel;
    QRDBText4: TQRDBText;
    QRSysData1: TQRSysData;
    qrtpag: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    procedure qrtpagPrint(sender: TObject; var Value: String);
    procedure QRDBText2Print(sender: TObject; var Value: String);
    procedure QRDBText3Print(sender: TObject; var Value: String);
  private

  public
  end;

var
  qckBceGral: TqckBceGral;

implementation
Uses UDmRep,Uglobal, UDatModCompania;
{$R *.DFM}


procedure TqckBceGral.qrtpagPrint(sender: TObject; var Value: String);
begin
  Value := IntToStr(glbTPag);
end;

procedure TqckBceGral.QRDBText2Print(sender: TObject; var Value: String);
begin
  if value  = '0.00' then value :='';
end;

procedure TqckBceGral.QRDBText3Print(sender: TObject; var Value: String);
begin
  if value  = '0.00' then value :='';
end;

end.
