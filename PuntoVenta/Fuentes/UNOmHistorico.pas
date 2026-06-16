unit UNOmHistorico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, ComBoxMeses, ComCtrls, Buttons, EditNew, Db, DBTables,
  Grids, DBGrids, IBCustomDataSet, IBQuery;

type
  TfrmNOmHistorico = class(TForm)
    Panel1: TPanel;
    dtpkFechaIni: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    dtpkFechaFin: TDateTimePicker;
    BitBtn1: TBitBtn;
    EdtCodEmp: TEditN;
    Label3: TLabel;
    qryHistoNomina: TIBQuery;
    qryHistoNominaCODIGO: TIntegerField;
    qryHistoNominaNOMBRE: TStringField;
    qryHistoNominaAPELLIDO: TStringField;
    qryHistoNominaFECHA_NOMINA: TDateTimeField;
    qryHistoNominaSALARIO_BRUTO: TFloatField;
    qryHistoNominaIDSS: TFloatField;
    qryHistoNominaCOOPERATIVA: TFloatField;
    qryHistoNominaBMI: TFloatField;
    qryHistoNominaISR: TFloatField;
    qryHistoNominaOTROS_INGRESOS: TFloatField;
    qryHistoNominaOTRAS_DEDUCCIONES: TFloatField;
    qryHistoNominaSALARIO_NETO: TFloatField;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Panel2: TPanel;
    qryTotalNom: TIBQuery;
    DBGrid2: TDBGrid;
    DataSource2: TDataSource;
    qryTotalNomSBRUTO: TFloatField;
    qryTotalNomIDSS: TFloatField;
    qryTotalNomCOOP: TFloatField;
    qryTotalNomSEGMED: TFloatField;
    qryTotalNomISR: TFloatField;
    qryTotalNomOING: TFloatField;
    qryTotalNomODED: TFloatField;
    qryTotalNomSNETO: TFloatField;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNOmHistorico: TfrmNOmHistorico;

implementation
uses UDatModConectar, UGlobal;
{$R *.DFM}

procedure TfrmNOmHistorico.BitBtn1Click(Sender: TObject);
begin
  qryHistoNomina.Close;
  qryTotalNom.close;
  qryHistoNomina.params[0].Value := ExtraerFecha(dtpkFechaIni.Date);
  qryHistoNomina.params[1].Value := ExtraerFecha(dtpkFechaFin.date);
  qryTotalNom.Params[0].Value :=  ExtraerFecha(dtpkFechaIni.Date);
  qryTotalNom.Params[1].Value :=  ExtraerFecha(dtpkFechaFin.Date);
  if EdtCodEmp.ValueInteger > 0 then
  begin
    qryHistoNomina.Filtered:=false;
    qryHistoNomina.Filter:='codigo = '+ EdtCodEmp.Text;
    qryHistoNomina.Filtered:=true;
    qryTotalNom.Params[2].Value :=  EdtCodEmp.ValueInteger;
    qryTotalNom.Params[3].Value :=  EdtCodEmp.ValueInteger;
  end else
  begin
    qryHistoNomina.Filtered:=false;
    qryTotalNom.Params[2].Value :=  0;
    qryTotalNom.Params[3].Value :=  999;    
  end;
  qryHistoNomina.Open;
  qryTotalNom.Open;  
end;

procedure TfrmNOmHistorico.FormCreate(Sender: TObject);
begin
  dtpkFechaIni.DateTime:=EncodeDate(StrToInt(FormatDatetime('yyyy',Date)),1,1);
  dtpkFechaFin.DateTime:=EncodeDate(
  StrToInt(FormatDatetime('yyyy',Date)),
  StrToInt(FormatDatetime('mm',Date)),
  DiasEnElMes(StrToInt(FormatDatetime('yyyy',Date)),
              StrToInt(FormatDatetime('mm',Date))));
end;

end.
