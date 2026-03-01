unit URepClientesDatosVeh;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckRepDatosVehClientes = class(TQuickRep)
    QRBand2: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRBand3: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRBand4: TQRBand;
    QRSysData1: TQRSysData;
    QRBand5: TQRBand;
    QRLabel12: TQRLabel;
    QRSysData2: TQRSysData;
    QRDBText1: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    QRGroup1: TQRGroup;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRDBText12Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  qckRepDatosVehClientes: TqckRepDatosVehClientes;

implementation

uses UDatModCompania, UDatModReportes;

{$R *.DFM}

procedure TqckRepDatosVehClientes.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  qckRepDatosVehClientes.AllDataSets.Add(dmCompania.tblCompania);
end;

procedure TqckRepDatosVehClientes.QRDBText12Print(sender: TObject;
  var Value: String);
begin
  if dmReportes.qryRepDatosCteVehFECHA_VENCE_SEGURO.IsNull then
  Value:=''; 
end;

end.
