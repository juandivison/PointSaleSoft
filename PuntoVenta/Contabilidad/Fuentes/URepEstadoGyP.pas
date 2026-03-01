unit URepEstadoGyP;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TqckEGyP = class(TQuickRep)
    QRBand2: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRExpr1: TQRExpr;
    QRBand3: TQRBand;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRBand4: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText1: TQRDBText;
    QRBand5: TQRBand;
    QRLabel5: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRSysData3: TQRSysData;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRExpr3: TQRExpr;
    procedure QRDBText2Print(sender: TObject; var Value: String);
    procedure QRDBText3Print(sender: TObject; var Value: String);
    procedure QRLabel5Print(sender: TObject; var Value: String);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public

  end;

var
  qckEGyP: TqckEGyP;

implementation
Uses UDmRep, uglobal;
{$R *.DFM}

procedure TqckEGyP.QRDBText2Print(sender: TObject; var Value: String);
begin
  If value = '0.00' then value :='';
end;

procedure TqckEGyP.QRDBText3Print(sender: TObject; var Value: String);
begin
  If value = '0.00' then value :='';
end;

procedure TqckEGyP.QRLabel5Print(sender: TObject; var Value: String);
begin
  if not Boo_auxiglb then
  Value := 'ESTADO DE G y P ACUMULADO'; 
end;

procedure TqckEGyP.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
//  dtmodrep.qryEGyP.
  if (dtmodrep.qryEGyPVALORC.Value = 0) and
     (dtmodrep.qryEGyPVALORD.Value = 0) then
     PrintBand := False else PrintBand:=true;
end;

end.
