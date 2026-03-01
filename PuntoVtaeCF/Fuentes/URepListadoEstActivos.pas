unit URepListadoEstActivos;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckRepEstActivos = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRSysData1: TQRSysData;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    ColumnHeaderBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText9: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText10: TQRDBText;
    QRGroup1: TQRGroup;
    QRDBText6: TQRDBText;
    QRBand2: TQRBand;
    QRLabel1: TQRLabel;
    SummaryBand1: TQRBand;
    QRSysData2: TQRSysData;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRLabel1Print(sender: TObject; var Value: String);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText6Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  qckRepEstActivos: TqckRepEstActivos;
  cantEst : Integer;

implementation

uses UDatModReportes;

{$R *.DFM}

procedure TqckRepEstActivos.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  cantEst:=0;
end;

procedure TqckRepEstActivos.QRLabel1Print(sender: TObject;
  var Value: String);
begin
  Value:='Cant Est. en : ' + dmReportes.qryRepEstudiantesActivosDESCRIPCION_CURSOS.Value+' - '+IntToStr(cantEst);
  cantEst:=0;
end;

procedure TqckRepEstActivos.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  cantEst:=cantEst + 1;
end;

procedure TqckRepEstActivos.QRDBText6Print(sender: TObject;
  var Value: String);
begin
  Value := TRIM(dmReportes.qryRepEstudiantesActivosDESC_SECCION.Value) + '-'+TRIM(Value); 
end;

end.
