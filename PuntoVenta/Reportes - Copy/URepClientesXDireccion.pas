unit URepClientesXDireccion;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckRepClientesXDireccion = class(TQuickRep)
    QRBand2: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRBand3: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRBand4: TQRBand;
    QRSysData1: TQRSysData;
    QRBand5: TQRBand;
    QRLabel12: TQRLabel;
    QRSysData2: TQRSysData;
    QRDBText1: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRGroup1: TQRGroup;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRGroup2: TQRGroup;
    QRDBText13: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText14: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand3AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRSysData1Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  qckRepClientesXDireccion: TqckRepClientesXDireccion;
  cont : integer;

implementation

uses UDatModCompania, UDatModReportes;

{$R *.DFM}

procedure TqckRepClientesXDireccion.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  cont:=0;
  qckRepClientesXDireccion.AllDataSets.Add(dmCompania.tblCompania);
end;

procedure TqckRepClientesXDireccion.QRBand3AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  inc(cont);
end;

procedure TqckRepClientesXDireccion.QRSysData1Print(sender: TObject;
  var Value: String);
begin
  Value:='Total Record '+IntToStr(cont);
end;

end.
