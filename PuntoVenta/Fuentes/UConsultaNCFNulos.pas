unit UConsultaNCFNulos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, rxToolEdit, ExtCtrls, Grids, DBGrids,
  RXDBCtrl, DB;

type
  TfrmConsultaNCF = class(TForm)
    dsqryNCFNull: TDataSource;
    RxDBGrid1: TRxDBGrid;
    Panel1: TPanel;
    DateEdit1: TDateEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    lblRangoFecha: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
    procedure SetLabelFecha;
  public
    { Public declarations }
  end;

var
  frmConsultaNCF: TfrmConsultaNCF;

implementation

uses UDatModReportes, Uglobal;

{$R *.dfm}

procedure TfrmConsultaNCF.FormCreate(Sender: TObject);
begin
  DateEdit1.Date:= Now;
  dmreportes.qryNCFNull.Close;
  dmreportes.qryNCFNull.Params[0].Value:= GlbPrimerDiaMes(DateEdit1.Date);
  dmreportes.qryNCFNull.Params[1].Value:= GlbUltimoDiaMes(DateEdit1.Date);
  dmreportes.qryNCFNull.Open;
  SetLabelFecha;
end;

procedure TfrmConsultaNCF.SpeedButton1Click(Sender: TObject);
begin
  dmreportes.qryNCFNull.Close;
  DateEdit1.Date:=DateEdit1.Date -1;
  dmreportes.qryNCFNull.Params[0].Value:= ExtraerFecha(DateEdit1.Date);
  dmreportes.qryNCFNull.Params[1].Value:= ExtraerFecha(DateEdit1.Date);
  dmreportes.qryNCFNull.Open;
  SetLabelFecha;
end;

procedure TfrmConsultaNCF.SpeedButton2Click(Sender: TObject);
begin
  dmreportes.qryNCFNull.Close;
  DateEdit1.Date:=DateEdit1.Date +1;
  dmreportes.qryNCFNull.Params[0].Value:= ExtraerFecha(DateEdit1.Date);
  dmreportes.qryNCFNull.Params[1].Value:= ExtraerFecha(DateEdit1.Date);
  dmreportes.qryNCFNull.Open;
  SetLabelFecha;
end;

procedure TfrmConsultaNCF.BitBtn1Click(Sender: TObject);
begin
  dmreportes.qryNCFNull.Close;
  DateEdit1.Date:=DateEdit1.Date +1;
  dmreportes.qryNCFNull.Params[0].Value:= ExtraerFecha(DateEdit1.Date);
  dmreportes.qryNCFNull.Params[1].Value:= ExtraerFecha(DateEdit1.Date);
  dmreportes.qryNCFNull.Open;
  SetLabelFecha;
end;

procedure TfrmConsultaNCF.BitBtn2Click(Sender: TObject);
begin
  dmreportes.qryNCFNull.Close;
  dmreportes.qryNCFNull.Params[0].Value:= GlbPrimerDiaMes(DateEdit1.Date);
  dmreportes.qryNCFNull.Params[1].Value:= GlbUltimoDiaMes(DateEdit1.Date);
  dmreportes.qryNCFNull.Open;
  SetLabelFecha;
end;

procedure TfrmConsultaNCF.SetLabelFecha;
begin
  if (dmreportes.qryNCFNull.RecordCount = 0) then
  lblRangoFecha.Caption:='No Datos'
  else
  begin
    lblRangoFecha.Caption:=FormatDatetime('dd/mm/yyyy',dmreportes.qryNCFNull.Params[0].AsDateTime)+' a '+
    FormatDatetime('dd/mm/yyyy',dmreportes.qryNCFNull.Params[1].AsDateTime);
  end;
end;

end.
