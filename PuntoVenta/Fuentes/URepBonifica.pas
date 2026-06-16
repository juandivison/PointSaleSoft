unit URepBonifica;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  Tqckboni = class(TQuickRep)
    QRBand1: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRExpr1: TQRExpr;
    QRDBText1: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRBand2: TQRBand;
    QRDBText9: TQRDBText;
    QRBand3: TQRBand;
    QRLabel9: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel1: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRLabel12: TQRLabel;
    QRBand4: TQRBand;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRGroup1: TQRGroup;
    QRBand5: TQRBand;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    QRLabel17: TQRLabel;
    QRDBText14: TQRDBText;
    QRExpr12: TQRExpr;
    QRExpr13: TQRExpr;
    QRLabel18: TQRLabel;
    QRDBText15: TQRDBText;
    QRSysData3: TQRSysData;
    procedure QRDBText13Print(sender: TObject; var Value: String);
    procedure QRExpr10Print(sender: TObject; var Value: String);
    procedure QRExpr11Print(sender: TObject; var Value: String);
    procedure QRExpr12Print(sender: TObject; var Value: String);
    procedure QRDBText14Print(sender: TObject; var Value: String);
    procedure QRExpr13Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  qckboni: Tqckboni;

implementation
  Uses UCalculoBonificaciones;
{$R *.DFM}

procedure Tqckboni.QRDBText13Print(sender: TObject; var Value: String);
begin
  if Value  = '0.00' then Value := '';
end;

procedure Tqckboni.QRExpr10Print(sender: TObject; var Value: String);
begin
  if Value  = '0.00' then Value := '';
end;

procedure Tqckboni.QRExpr11Print(sender: TObject; var Value: String);
begin
  if Value  = '0.00' then Value := '';
end;

procedure Tqckboni.QRExpr12Print(sender: TObject; var Value: String);
begin
  if Value  = '0.00' then Value := '';
end;

procedure Tqckboni.QRDBText14Print(sender: TObject; var Value: String);
begin
  if Value  = '0.00' then Value := '';
end;

procedure Tqckboni.QRExpr13Print(sender: TObject; var Value: String);
begin
  if Value  = '0.00' then Value := ''; 
end;

end.
