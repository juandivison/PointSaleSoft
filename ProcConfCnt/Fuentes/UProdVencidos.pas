unit UProdVencidos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, Grids, DBGrids, RXDBCtrl, DB,
  RXSpin;

type
  TfrmProdVencidos = class(TForm)
    DataSource1: TDataSource;
    RxDBGrid1: TRxDBGrid;
    BitBtn1: TBitBtn;
    RadioGroup1: TRadioGroup;
    BitBtn2: TBitBtn;
    RxSpinEdit1: TRxSpinEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProdVencidos: TfrmProdVencidos;

implementation

uses UDatModInventario, URepVencimientoProd;

{$R *.dfm}

procedure TfrmProdVencidos.BitBtn1Click(Sender: TObject);
begin
  dmInventario.qryRepProdVence.Filtered := False;
  if (RadioGroup1.ItemIndex = 0) then
  begin
    dmInventario.DiasxVencidos := 0;
    dmInventario.DiasxVencer   := 0;
    dmInventario.qryRepProdVence.Close;
    dmInventario.qryRepProdVence.SQL.Text := dmInventario.qryTodo.SQL.Text;
    dmInventario.qryRepProdVence.Open;
  end else
  if (RadioGroup1.ItemIndex = 1) then
  begin
    if RxSpinEdit1.AsInteger = 0 then
    begin
      MessageDlg('Favor indicar cantidad de dias',mterror, [mbOK], 0);
      RxSpinEdit1.SetFocus;
      Exit;
    end;
    dmInventario.DiasxVencidos := 0;
    dmInventario.DiasxVencer   := RxSpinEdit1.AsInteger;
    dmInventario.qryRepProdVence.Filtered := false;
    dmInventario.qryRepProdVence.Close;
    dmInventario.qryRepProdVence.SQL.Text := dmInventario.qryVencido.SQL.Text;
    dmInventario.qryRepProdVence.params[0].Value:=RxSpinEdit1.AsInteger;
    dmInventario.qryRepProdVence.Open;
  end else
  if (RadioGroup1.ItemIndex = 2) then
  begin
    if RxSpinEdit1.AsInteger = 0 then
    begin
      MessageDlg('Favor indicar cantidad de dias',mterror, [mbOK], 0);
      RxSpinEdit1.SetFocus;
      Exit;
    end;

    dmInventario.DiasxVencidos := RxSpinEdit1.AsInteger;
    dmInventario.DiasxVencer   := 0;
    dmInventario.qryRepProdVence.Filtered := false;
    dmInventario.qryRepProdVence.Close;
    dmInventario.qryRepProdVence.SQL.Text := dmInventario.qryXVencer.SQL.Text;
    dmInventario.qryRepProdVence.params[0].Value:=RxSpinEdit1.AsInteger;
    dmInventario.qryRepProdVence.Open;
  end;

end;

procedure TfrmProdVencidos.BitBtn2Click(Sender: TObject);
begin
  qckRepVencimientoProd :=tqckRepVencimientoProd.Create(nil);
  try
    qckRepVencimientoProd.Todo:=false;
    qckRepVencimientoProd.TipoReporte:='';
    if radiogroup1.ItemIndex = 1 then
     qckRepVencimientoProd.TipoReporte:='Por vencer'
     else if radiogroup1.ItemIndex = 2 then
     qckRepVencimientoProd.TipoReporte:='Vencidos'
     else
     qckRepVencimientoProd.Todo:=true;
    qckRepVencimientoProd.Preview;
  finally
  qckRepVencimientoProd.free;
  qckRepVencimientoProd:=nil;
  end;
end;

end.
