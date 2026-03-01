unit UFormEstatusContratos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBTable, WinSkinData, StdCtrls, Mask,
  DBCtrls, Buttons, Grids, DBGrids, RxDBCtrl;

type
  TfrmEstadoWisPro = class(TForm)
    SkinData1: TSkinData;
    tblWisproStatus: TIBTable;
    tblWisproStatusDIAS_ATRASO_INI: TIntegerField;
    tblWisproStatusDIAS_ATRASO_FIN: TIntegerField;
    tblWisproStatusESTADO: TIBStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DataSource1: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    btnInsertar: TBitBtn;
    btnSalvar: TBitBtn;
    btnCerarAbrirres: TBitBtn;
    BitBtn2: TBitBtn;
    RxDBGrid1: TRxDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure btnInsertarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCerarAbrirresClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEstadoWisPro: TfrmEstadoWisPro;

implementation

uses UDatModConectar, UGlobal;

{$R *.dfm}

procedure TfrmEstadoWisPro.FormCreate(Sender: TObject);
begin
  tblWisproStatus.close;
  tblWisproStatus.Open;
end;

procedure TfrmEstadoWisPro.btnInsertarClick(Sender: TObject);
begin
  if tblWisproStatus.State in [dsEdit, dsInsert] then
  tblWisproStatus.Append;
end;

procedure TfrmEstadoWisPro.btnSalvarClick(Sender: TObject);
begin
  if tblWisproStatus.State in [dsEdit, dsInsert] then
  begin
    tblWisproStatus.Post;
    tblWisproStatus.ApplyUpdates;

    if tblWisproStatus.Transaction.InTransaction then
       tblWisproStatus.Transaction.StartTransaction;
    try
      tblWisproStatus.Transaction.CommitRetaining;
    except
    tblWisproStatus.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmEstadoWisPro.btnCerarAbrirresClick(Sender: TObject);
begin
  tblWisproStatus.close;
  tblWisproStatus.Open;
end;

end.
