unit UQckReporteFacturaCuadre;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckFacturaCuadre = class(TQuickRep)
    QRBand3: TQRBand;
    QRBand4: TQRBand;
    QRBand5: TQRBand;
    QRBand6: TQRBand;
    QRSubDetail1: TQRSubDetail;
    QRDBText1: TQRDBText;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRExpr2: TQRExpr;
    QRLabel6: TQRLabel;
    QRLabel9: TQRLabel;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRLabel10: TQRLabel;
    TPag: TQRLabel;
    QRSysData3: TQRSysData;
    QRLabel11: TQRLabel;
    QRBand1: TQRBand;
    QRLabel13: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRExpr3Print(sender: TObject; var Value: String);
    procedure QRDBText10Print(sender: TObject; var Value: String);
    procedure QRDBText9Print(sender: TObject; var Value: String);
    procedure QRLabel2Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  qckFacturaCuadre: TqckFacturaCuadre;

implementation

uses UDatosVentas, UDatModCompania, UDatModClientes, UDatModDespacho,
  UDatModCuadrexRuta, UQckReporteFactura;

{$R *.DFM}

procedure TqckFacturaCuadre.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  qckFacturaCuadre.AllDataSets.Add(dmCompania.tblCompania);
  qckFacturaCuadre.AllDataSets.Add(dmVentas.qryClientes);
end;

procedure TqckFacturaCuadre.QRExpr3Print(sender: TObject; var Value: String);
begin
  if Value = '0.00' then value:='';
end;

procedure TqckFacturaCuadre.QRDBText10Print(sender: TObject; var Value: String);
begin
  if value = '0.00' then value:='';
end;

procedure TqckFacturaCuadre.QRDBText9Print(sender: TObject; var Value: String);
begin
  if value = '0.00' then value:='';
end;

procedure TqckFacturaCuadre.QRLabel2Print(sender: TObject;
  var Value: String);
begin
  Value := 'Fecha Cuadre: '+FormatDateTime(shortDateFormat,dmCuadrexRuta.tblCuadrerutaFECHA.Value);
end;

end.
