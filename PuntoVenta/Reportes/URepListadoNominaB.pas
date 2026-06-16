unit URepListadoNominaB;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TqckListadoNominaB = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRBand2: TQRBand;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRBand3: TQRBand;
    QRDBText2: TQRDBText;
    QRBand4: TQRBand;
    QRDBText7: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRShape1: TQRShape;
    QRGroup1: TQRGroup;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel3: TQRLabel;
    QRBand5: TQRBand;
    QRLabel4: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText30: TQRDBText;
    procedure QRDBText5Print(sender: TObject; var Value: String);
    procedure QRLabel4Print(sender: TObject; var Value: String);
    procedure QRBand3AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private

  public

  end;

var
  qckListadoNominaB: TqckListadoNominaB;
  xCont:Integer =0;
implementation
uses UDatModNomina;

{$R *.DFM}

procedure TqckListadoNominaB.QRDBText5Print(sender: TObject;
  var Value: String);
begin
  if Value = 'No Aplica' then value := '';
end;

procedure TqckListadoNominaB.QRLabel4Print(sender: TObject;
  var Value: String);
begin
  Value:='Sub-Total Depto '+InttoStr(xCont);
  xCont:=0;
end;

procedure TqckListadoNominaB.QRBand3AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  Inc(xCont);
  //If DmNom.QryRepListNombNomCODIGO_1.Value
end;

end.
