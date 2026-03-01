unit qckRepLavanderiaRecibo;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckReciboLavanderia = class(TQuickRep)
    QRBand4: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRExpr1: TQRExpr;
    QRDBText5: TQRDBText;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel2: TQRLabel;
    QRSysData3: TQRSysData;
    QRBand3: TQRBand;
    QRBand6: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRDBText7: TQRDBText;
    QRBand5: TQRBand;
    QRExpr2: TQRExpr;
    QRLabel6: TQRLabel;
    QRLabel9: TQRLabel;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRLabel10: TQRLabel;
    QRBand1: TQRBand;
    QRLabel13: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel16: TQRLabel;
    c: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText8: TQRDBText;
    QRExpr5: TQRExpr;
    ChildBand1: TQRChildBand;
    QRDBText9: TQRDBText;
    TPag: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRLabel15Print(sender: TObject; var Value: String);
    procedure QRSysData3Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  qckReciboLavanderia: TqckReciboLavanderia;

implementation

uses UDatModInventario, UDatModCompania, Uglobal;

{$R *.DFM}

procedure TqckReciboLavanderia.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  dmCompania.tblCompania.Close;
  dmCompania.tblCompania.Open;
  qckReciboLavanderia.AllDataSets.Add(dmCompania.tblCompania);
end;

procedure TqckReciboLavanderia.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  xGrafico : String;
begin
  //xGrafico:=FileToUse('Grafico','Logo.jpg');
  //if (xGrafico <> '') then
  //QRImage1.Picture.LoadFromFile(xGrafico);
  QRLabel2.Caption := FormatDateTime('dd-mmm-yyyy',
  ExtraerFecha(dmInventario.qryRepRepMasterFECHA.Value));
end;

procedure TqckReciboLavanderia.QRLabel15Print(sender: TObject;
  var Value: String);
begin
{  if (dmInventario.qryRepRepMasterTIPO_OPE.Value = 1) then
  Value := 'Tipo Ope: '+dmInventario.qryRepRepMasterTIPO_TRNDESC.Value +' a lavanderia'
  else
  if (dmInventario.qryRepRepMasterTIPO_OPE.Value = 3) then
  Value := 'Tipo Ope: '+dmInventario.qryRepRepMasterTIPO_TRNDESC.Value +' a costura'
  else
  if (dmInventario.qryRepRepMasterTIPO_OPE.Value = 4) then
  Value := 'Tipo Ope: '+dmInventario.qryRepRepMasterTIPO_TRNDESC.Value +' Accesorio(s)';}
  Value:= 'Tipo Ope: ' + dmInventario.qryRepRepMasterDescTipopOpe.Value;

end;

procedure TqckReciboLavanderia.QRSysData3Print(sender: TObject;
  var Value: String);
begin
  Value:= Value +' '+TPag.Caption;
  TPag.Enabled:=False;
end;

end.
