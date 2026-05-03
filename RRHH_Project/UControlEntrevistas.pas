unit UControlEntrevistas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, Grids, DBGrids, StdCtrls, DBCtrls,
  ExtCtrls, ShellAPI,
  IBUpdateSQL;

type
  TfrmControlEntrevistas = class(TForm)
    DBGrid1: TDBGrid;
    PanelDetalle: TPanel;
    btnVerCV: TButton;
    DBMemo1: TDBMemo;
    Label1: TLabel;
    qEntrevistas: TIBQuery;
    dsEntrevistas: TDataSource;
    btnGuardar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnVerCVClick(Sender: TObject);
    procedure btnGuardarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmControlEntrevistas: TfrmControlEntrevistas;

implementation

uses UDataModule;

{$R *.dfm}

procedure TfrmControlEntrevistas.FormCreate(Sender: TObject);
begin
  qEntrevistas.Open;
end;

procedure TfrmControlEntrevistas.btnVerCVClick(Sender: TObject);
var
  Ruta: string;
begin
  Ruta := qEntrevistas.FieldByName('RUTA_CV').AsString;
  if (Ruta <> '') and FileExists(Ruta) then
    ShellExecute(Handle, 'open', PChar(Ruta), nil, nil, SW_SHOWNORMAL)
  else
    ShowMessage('El archivo no se encuentra en la ruta especificada.');
end;

procedure TfrmControlEntrevistas.btnGuardarClick(Sender: TObject);
begin
  if qEntrevistas.State in [dsEdit, dsInsert] then
  begin
    qEntrevistas.Post;
    qEntrevistas.Transaction.CommitRetaining;
  end;
end;

end.
