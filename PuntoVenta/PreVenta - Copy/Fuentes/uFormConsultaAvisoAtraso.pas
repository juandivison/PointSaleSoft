unit uFormConsultaAvisoAtraso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, RXDBCtrl, StdCtrls, Buttons, DBCtrls, Mask,
  ToolEdit, WinSkinData, ExtCtrls;

type
  TfrmConsultaAvisoAtraso = class(TForm)
    RxDBGrid1: TRxDBGrid;
    DataSource1: TDataSource;
    DBMemo1: TDBMemo;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    DateEdit1: TDateEdit;
    Label1: TLabel;
    BitBtn4: TBitBtn;
    SkinData1: TSkinData;
    RadioGroup1: TRadioGroup;
    procedure BitBtn4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaAvisoAtraso: TfrmConsultaAvisoAtraso;

implementation

uses UDatModPrestamo, UGlobal, uRepAvisoAtrasoPagoCuotaFinanc,
  UDatModCompania;
{$R *.dfm}

procedure TfrmConsultaAvisoAtraso.BitBtn4Click(Sender: TObject);
begin
  dmPrestamo.qryRepAvisoAtraso.Close;
  dmPrestamo.qryRepAvisoAtraso.Params[0].Value:= 0;//codigo_cte, no usado en sp
  dmPrestamo.qryRepAvisoAtraso.Params[1].Value:= ExtraerFecha(DateEdit1.Date);
  dmPrestamo.qryRepAvisoAtraso.Params[2].Value:= 0;
  dmPrestamo.qryRepAvisoAtraso.Params[3].Value:= 1000;
  dmPrestamo.qryRepAvisoAtraso.Open;
end;

procedure TfrmConsultaAvisoAtraso.FormCreate(Sender: TObject);
begin
  DateEdit1.Date:= GlbFechaTrnDiaria;
  dmcompania.tblCompania.Close;
  dmcompania.tblCompania.Open;
end;

procedure TfrmConsultaAvisoAtraso.BitBtn1Click(Sender: TObject);
begin
  qckRepAvisoAtraso:=TqckRepAvisoAtraso.Create(nil);
  try
    qckRepAvisoAtraso.Preview;
  finally
  qckRepAvisoAtraso.free;
  qckRepAvisoAtraso:=nil;
  end;
end;

procedure TfrmConsultaAvisoAtraso.BitBtn2Click(Sender: TObject);
begin
  qckRepAvisoAtraso:=TqckRepAvisoAtraso.Create(Nil);
  try
    qckRepAvisoAtraso.DataSet:=dmPrestamo.qryRepAvisoAtraso;
    qckRepAvisoAtraso.Preview;
  finally
  qckRepAvisoAtraso.Free;
  qckRepAvisoAtraso:=Nil;
  end;
end;

procedure TfrmConsultaAvisoAtraso.RadioGroup1Click(Sender: TObject);
begin
  dmPrestamo.qryRepAvisoAtraso.Close;
  dmPrestamo.qryRepAvisoAtraso.Params[0].Value:= 0;//codigo_cte, no usado en sp
  dmPrestamo.qryRepAvisoAtraso.Params[1].Value:= ExtraerFecha(DateEdit1.Date);
  dmPrestamo.qryRepAvisoAtraso.Params[2].Value:= RadioGroup1.ItemIndex+1;
  dmPrestamo.qryRepAvisoAtraso.Params[3].Value:= RadioGroup1.ItemIndex+1;
  dmPrestamo.qryRepAvisoAtraso.Open;
end;

end.
