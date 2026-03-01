unit URepFVtaCuadreXCliente;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TQckRepFVtaCuadreXCte = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    qrTpaginas: TQRLabel;
    QRDBText9: TQRDBText;
    QRBand2: TQRBand;
    QRTARIFA: TQRLabel;
    QRBand3: TQRBand;
    QRDBText8: TQRDBText;
    QRBand5: TQRBand;
    QRExpr3: TQRExpr;
    QRDBText3: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText11: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRLabel9: TQRLabel;
    QRDBText10: TQRDBText;
    procedure QRLabel3Print(sender: TObject; var Value: String);
    procedure qrTpaginasPrint(sender: TObject; var Value: String);
    procedure QRDBText2Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  QckRepFVtaCuadreXCte: TQckRepFVtaCuadreXCte;

implementation

uses UDatModCuadrexRuta, uglobal;

{$R *.DFM}

procedure TQckRepFVtaCuadreXCte.QRLabel3Print(sender: TObject;
  var Value: String);
begin
  Value := FormatDatetime(Shortdateformat,
  dmCuadrexRuta.qryRepFactCuadreXCte.Params[0].Value)+' al '+FormatDatetime(Shortdateformat,
  dmCuadrexRuta.qryRepFactCuadreXCte.Params[1].Value);
  dmCuadrexRuta.qryRepFactCuadreXCte.Params[2].Value:=glbCia_Key;
end;

procedure TQckRepFVtaCuadreXCte.qrTpaginasPrint(sender: TObject;
  var Value: String);
begin
  Value := ' de '+IntToStr(glbTPag);
end;

procedure TQckRepFVtaCuadreXCte.QRDBText2Print(sender: TObject;
  var Value: String);
begin
  if (Value = '0.00') then Value:=''
end;

end.
