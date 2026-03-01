unit URepEstadoCtaCxp;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, RxMemDS;

type
  TqckRepXServCxp = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    qrTpaginas: TQRLabel;
    QRExpr4: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRBand2: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel8: TQRLabel;
    QRTARIFA: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel13: TQRLabel;
    QRBand3: TQRBand;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText8: TQRDBText;
    QRExpr5: TQRExpr;
    QRDBText1: TQRDBText;
    QRBand5: TQRBand;
    QRExpr2: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr3: TQRExpr;
    QRLabel12: TQRLabel;
    QRGroup1: TQRGroup;
    QRExpr1: TQRExpr;
    QRDBText5: TQRDBText;
    QRLabel10: TQRLabel;
    ChildBand1: TQRChildBand;
    QRLabel7: TQRLabel;
    rxNoRecord: TRxMemoryData;
    rxNoRecordDescripcion: TStringField;
    procedure QRLabel3Print(sender: TObject; var Value: String);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrTpaginasPrint(sender: TObject; var Value: String);
  private

  public

  end;

var
  qckRepXServCxp: TqckRepXServCxp;

implementation

uses UDatModCompania, uglobal, UDatModConectar,
  UDatModCxp;

{$R *.DFM}

procedure TqckRepXServCxp.QRLabel3Print(sender: TObject;
  var Value: String);
begin
  Value := FormatDatetime(Shortdateformat,glbfechainicial)+' al '+FormatDatetime(Shortdateformat,glbfechafinal);
end;

procedure TqckRepXServCxp.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QRBand3.HasChild:=false;
  qckRepXServCxp.AllDataSets.Add(dmCompania.tblCompania);
  if rxNoRecord.RecordCount > 0 then
  begin
    qckRepXServCxp.DataSet:=rxNoRecord;
    QRBand1.HasChild:=True;
  end;
end;

procedure TqckRepXServCxp.ChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLabel7.Caption := rxNoRecordDescripcion.Value;
end;

procedure TqckRepXServCxp.qrTpaginasPrint(sender: TObject;
  var Value: String);
begin
  Value := ' de '+IntToStr(glbTPag);
end;

end.
