unit URepFVtaCuadre;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TQckRepFVtaCuadre = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    qrTpaginas: TQRLabel;
    QRDBText9: TQRDBText;
    QRBand2: TQRBand;
    QRLabel1: TQRLabel;
    QRTARIFA: TQRLabel;
    QRBand3: TQRBand;
    QRDBText4: TQRDBText;
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
    QRDBText12: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    procedure QRLabel3Print(sender: TObject; var Value: String);
    procedure qrTpaginasPrint(sender: TObject; var Value: String);
  private

  public

  end;

var
  QckRepFVtaCuadre: TQckRepFVtaCuadre;

implementation

uses UDatModCuadrexRuta, uglobal;

{$R *.DFM}

procedure TQckRepFVtaCuadre.QRLabel3Print(sender: TObject;
  var Value: String);
begin
  Value := FormatDatetime(Shortdateformat,
  dmCuadrexRuta.qryRepFactCuadre.Params[0].Value)+' al '+FormatDatetime(Shortdateformat,
  dmCuadrexRuta.qryRepFactCuadre.Params[1].Value);
  dmCuadrexRuta.qryRepFactCuadre.Params[2].Value:=glbCia_Key;
end;

procedure TQckRepFVtaCuadre.qrTpaginasPrint(sender: TObject;
  var Value: String);
begin
  Value := ' de '+IntToStr(glbTPag);
end;

end.
