unit UQckCotizacionOrdenTrab;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckRepOrdenComp = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRSubDetail1: TQRSubDetail;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel1: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText11: TQRDBText;
    ChildBand3: TQRChildBand;
    QRDBText14: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel11: TQRLabel;
    QRExpr1: TQRExpr;
    QRDBText13: TQRDBText;
    QRLabel12: TQRLabel;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    PageFooterBand1: TQRBand;
    QRDBText4: TQRDBText;
    QRBand1: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRBand2: TQRBand;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRLabel1Print(sender: TObject; var Value: String);
    procedure QRLabel2Print(sender: TObject; var Value: String);
    procedure QRDBText9Print(sender: TObject; var Value: String);
    procedure ChildBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText2Print(sender: TObject; var Value: String);
    procedure QRDBText3Print(sender: TObject; var Value: String);
    procedure QRLabel13Print(sender: TObject; var Value: String);
    procedure QRDBText4Print(sender: TObject; var Value: String);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure ColumnHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText5Print(sender: TObject; var Value: String);
    procedure QRDBText1Print(sender: TObject; var Value: String);
    procedure QRBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRDBText16Print(sender: TObject; var Value: String);
    procedure QRLabel15Print(sender: TObject; var Value: String);
    procedure QRDBText15Print(sender: TObject; var Value: String);
  private

  public
     hCImpreso : boolean;
  end;

var
  qckRepOrdenComp: TqckRepOrdenComp;

   
implementation
uses UDatModPanaderia, UDatModCompania, UGlobal;
{$R *.DFM}

procedure TqckRepOrdenComp.ChildBand1BeforePrint(Sender: TQRCustomBand;
 var PrintBand: Boolean);
begin
  if dmPanaderia.qryRepOrdenTrabDetDESC_UNIDAD.IsNull then
  PrintBand:=False else PrintBand:=True;
end;

procedure TqckRepOrdenComp.QRLabel1Print(sender: TObject;
  var Value: String);
begin
  if dmPanaderia.qryRepOrdenTrabNOMBRECLIENTE.IsNull then
  Value:='Ciente: '+dmPanaderia.qryRepOrdenTrabNOMBRECTEREGISTRADO.Value
  else Value:='Ciente: '+dmPanaderia.qryRepOrdenTrabNOMBRECLIENTE.Value;
end;

procedure TqckRepOrdenComp.QRLabel2Print(sender: TObject;
  var Value: String);
begin
  Value:='Tamaño: '+dmPanaderia.qryRepOrdenTrabALTO.AsString + ' X '+
  dmPanaderia.qryRepOrdenTrabANCHO.AsString;
end;

procedure TqckRepOrdenComp.QRDBText9Print(sender: TObject;
  var Value: String);
begin
 Value :='RNC-'+VALUE;
end;

procedure TqckRepOrdenComp.ChildBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if dmPanaderia.qryRepOrdenTrabCOMENTARIO.IsNull then
  begin
    PrintBand:=False;
    ChildBand3.Height:=0;
  end
  else PrintBand:=True;
  if hCImpreso then
  PrintBand:=False
end;

procedure TqckRepOrdenComp.PageHeaderBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if hCImpreso then
  PrintBand:=False
  else
  PrintBand:=True;
end;

procedure TqckRepOrdenComp.QRDBText2Print(sender: TObject;
  var Value: String);
begin
  if not dmPanaderia.qryRepOrdenTrabDetDESCUNIABREV.IsNull then
  Value:=Value + ' '+LowerCase(dmPanaderia.qryRepOrdenTrabDetDESCUNIABREV.Value);
end;

procedure TqckRepOrdenComp.QRDBText3Print(sender: TObject;
  var Value: String);
begin
  if not dmPanaderia.qryRepOrdenTrabDetDESCUNIABREV.IsNull then
  Value:=Value + ' '+LowerCase(dmPanaderia.qryRepOrdenTrabDetDESCUNIABREV.Value);
end;

procedure TqckRepOrdenComp.QRLabel13Print(sender: TObject;
  var Value: String);
begin
  if not dmPanaderia.qryRepOrdenTrabNOMBREUSUARIOREG.IsNull then
  Value:= 'Pc: '+strUserName+'::'+dmPanaderia.qryRepOrdenTrabNOMBREUSUARIOREG.Value
  else Value:= 'Pc: '+strUserName;
end;

procedure TqckRepOrdenComp.QRDBText4Print(sender: TObject;
  var Value: String);
begin
  Value:='Celular: '+Value;
end;

procedure TqckRepOrdenComp.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  hCImpreso:=False;
  qckRepOrdenComp.AllDataSets.Add(dmCompania.tblCompania);
end;

procedure TqckRepOrdenComp.ColumnHeaderBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if hCImpreso then
  PrintBand:=False else PrintBand:=True;
end;

procedure TqckRepOrdenComp.QRDBText5Print(sender: TObject;
  var Value: String);
begin
  Value:='Prod: '+Value;
end;

procedure TqckRepOrdenComp.QRDBText1Print(sender: TObject;
  var Value: String);
begin
  if not dmPanaderia.qryRepOrdenTrabDetNUM_CANUELA.IsNull then
  Value:=Value + ' ' +dmPanaderia.qryRepOrdenTrabDetNUM_CANUELA.AsString;
end;

procedure TqckRepOrdenComp.QRBand1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  hCImpreso:=True;
end;

procedure TqckRepOrdenComp.QRDBText16Print(sender: TObject;
  var Value: String);
begin
  if not dmPanaderia.qryRepOrdenTrabFECHAENTREGA.IsNull then
  Value:='Fecha Entrega: '+Value else Value:='';
end;

procedure TqckRepOrdenComp.QRLabel15Print(sender: TObject;
  var Value: String);
begin
  if dmPanaderia.qryRepOrdenTrabDOBLEPASTATU.Value = 1 then
  Value:='*DOBLE PASTATU' else Value:='';  
end;

procedure TqckRepOrdenComp.QRDBText15Print(sender: TObject;
  var Value: String);
begin
  Value:='Fecha: '+Value;
end;

end.
