unit UFormMostrarTodoInventario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, RXDBCtrl;

type
  TfrmMostrarTodo = class(TForm)
    RxDBGrid1: TRxDBGrid;
    BitBtn1: TBitBtn;
    procedure RxDBGrid1ColEnter(Sender: TObject);
    procedure RxDBGrid1CellClick(Column: TColumn);
    procedure RxDBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMostrarTodo: TfrmMostrarTodo;

implementation

uses UConsultaPrecio;

{$R *.dfm}

procedure TfrmMostrarTodo.RxDBGrid1ColEnter(Sender: TObject);
begin
  frmConsultaPrecio.Panel1.Visible:=true;
end;

procedure TfrmMostrarTodo.RxDBGrid1CellClick(Column: TColumn);
begin
  frmConsultaPrecio.Panel1.Visible:=true;
end;

procedure TfrmMostrarTodo.RxDBGrid1DblClick(Sender: TObject);
begin
  frmConsultaPrecio.Panel1.Visible:=true;
  close;
end;

end.
