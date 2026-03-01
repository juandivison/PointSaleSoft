unit URepIngCobroMensualidadEst;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  db, StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckRepIngCobroMensEst = class(TQuickRep)
    QRBand4: TQRBand;
    QRDBText1: TQRDBText;
    QRSysData1: TQRSysData;
    QRDBText11: TQRDBText;
    QRSysData2: TQRSysData;
    QRSysData3: TQRSysData;
    QRLabel14: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    qrLabelReimprimir: TQRLabel;
    LabelNombUser: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel8: TQRLabel;
    QRExpr4: TQRExpr;
    QRLabel29: TQRLabel;
    QRDBText24: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel11: TQRLabel;
    ChildBand2: TQRChildBand;
    QRLabel12: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel9: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText3: TQRDBText;
    QRBand1: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel25: TQRLabel;
    ChildBand1: TQRChildBand;
    ChildBand3: TQRChildBand;
    QRLabel19: TQRLabel;
    QRLabel21: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel13: TQRLabel;
    QRLabel24: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel26: TQRLabel;
    QRDBText16: TQRDBText;
    qrLabelMesPagado: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRLabel26Print(sender: TObject; var Value: String);
    procedure QRDBText4Print(sender: TObject; var Value: String);
    procedure QRDBText11Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  qckRepIngCobroMensEst: TqckRepIngCobroMensEst;

implementation
uses UDatModConectar, UDatModIngresos, UDatModCompania, UGlobal;

{$R *.DFM}

procedure TqckRepIngCobroMensEst.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  if dmcompania.tblCompania.State = dsInactive then
  dmcompania.tblCompania.Open;
  dmCompania.tblCompania.Locate('codigo',glbCia_Key,[]);  
  qckRepIngCobroMensEst.AllDataSets.Add(dmcompania.tblCompania);
  qckRepIngCobroMensEst.AllDataSets.Add(dmIngresos.qryRepIngMaster);
end;

procedure TqckRepIngCobroMensEst.QRLabel26Print(sender: TObject;
  var Value: String);
begin
  If dmIngresos.qryRepIngMasterOBSERVACION.IsNull then
  Value:='';
end;

procedure TqckRepIngCobroMensEst.QRDBText4Print(sender: TObject;
  var Value: String);
  var
  x: Integer;
begin
  qrLabelMesPagado.Caption := NombreMes[StrToInt(FormatDateTime('mm',dmIngresos.qryRepIngDetalleMES_PAGADO.Value))];
  {if (Value <> '') then
  begin
    x:=Pos('(',value);
    qrLabelMesPagado.Caption := Copy(value,x,length(value));
    value:=Copy(value,1,x-1);
  end;}
end;

procedure TqckRepIngCobroMensEst.QRDBText11Print(sender: TObject;
  var Value: String);
begin
  if (Value <> '') then
  Value:='RNC :' + Value;
end;

end.
