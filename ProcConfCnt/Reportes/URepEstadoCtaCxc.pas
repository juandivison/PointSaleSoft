unit URepEstadoCtaCxc;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, RxMemDS;

type
  TqckRepXServ = class(TQuickRep)
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
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    rxNoRecord: TRxMemoryData;
    rxNoRecordDescripcion: TStringField;
    ChildBand1: TQRChildBand;
    QRLabel7: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrTpaginasPrint(sender: TObject; var Value: String);
    procedure QRLabel3Print(sender: TObject; var Value: String);
    procedure QRDBText2Print(sender: TObject; var Value: String);
    procedure QRDBText8Print(sender: TObject; var Value: String);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public

  end;

var
  qckRepXServ: TqckRepXServ;

implementation

uses UDatModCompania, uglobal, UDatModConectar,
  UDatModCxc;

{$R *.DFM}

procedure TqckRepXServ.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QRBand3.HasChild:=false;
  qckRepXServ.AllDataSets.Add(dmCompania.tblCompania);
  if rxNoRecord.RecordCount > 0 then
  begin
    qckRepXServ.DataSet:=rxNoRecord;
    QRBand1.HasChild:=True;
  end;
end;

procedure TqckRepXServ.qrTpaginasPrint(sender: TObject; var Value: String);
begin
  Value := ' de '+IntToStr(glbTPag);
end;

procedure TqckRepXServ.QRLabel3Print(sender: TObject; var Value: String);
begin
  Value := FormatDatetime(Shortdateformat,glbfechainicial)+' al '+FormatDatetime(Shortdateformat,glbfechafinal);
end;

procedure TqckRepXServ.QRDBText2Print(sender: TObject; var Value: String);
begin
  if Value = '0.00' then Value:='';
end;

procedure TqckRepXServ.QRDBText8Print(sender: TObject; var Value: String);
begin
  if Value = '0.00' then Value:='';
end;

procedure TqckRepXServ.ChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLabel7.Caption := rxNoRecordDescripcion.Value;
end;

procedure TqckRepXServ.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if dmCxc.qryRepServMONEDA_DET.IsNull then
  PrintBand:=False;
end;

end.
