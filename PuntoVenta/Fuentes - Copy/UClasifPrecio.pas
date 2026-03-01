unit UClasifPrecio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, Grids, DBGrids, StdCtrls, Mask, DBCtrls,
  Buttons;

type
  TfrmTipoPrecio = class(TForm)
    tblTipoPrecio: TIBDataSet;
    tblTipoPrecioPRECIO_ID: TIntegerField;
    tblTipoPrecioDESCRIPCION: TIBStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DataSource1: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTipoPrecio: TfrmTipoPrecio;

implementation

uses UDatModConectar, UGlobal;

{$R *.dfm}

procedure TfrmTipoPrecio.BitBtn1Click(Sender: TObject);
begin
  if tblTipoPrecio.State = dsBrowse then
  tblTipoPrecio.Insert;
end;

procedure TfrmTipoPrecio.BitBtn2Click(Sender: TObject);
begin
  if tblTipoPrecio.State = dsBrowse then
  tblTipoPrecio.Edit;
end;

procedure TfrmTipoPrecio.BitBtn3Click(Sender: TObject);
begin
  if tblTipoPrecio.State in [dsEdit, dsInsert] then
  tblTipoPrecio.cancel;
end;

procedure TfrmTipoPrecio.BitBtn4Click(Sender: TObject);
begin
  if tblTipoPrecio.State In [dsEdit, dsInsert] then
  begin
    if tblTipoPrecio.State = dsInsert then
    begin
      tblTipoPrecioPRECIO_ID.Value:= FsqlMaxNumero('tipo_precio','precio_id');
      if (tblTipoPrecioPRECIO_ID.Value = 0) then
      tblTipoPrecioPRECIO_ID.Value := 1;
    end;
    tblTipoPrecio.Post;
    tblTipoPrecio.ApplyUpdates;
    if not tblTipoPrecio.Transaction.InTransaction then
    tblTipoPrecio.Transaction.StartTransaction;
    try
      tblTipoPrecio.Transaction.CommitRetaining;
    except
    tblTipoPrecio.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmTipoPrecio.BitBtn5Click(Sender: TObject);
begin
  if tblTipoPrecio.State in [dsInactive, dsBrowse] then
  begin
    tblTipoPrecio.Close;
    tblTipoPrecio.Open;
  end;
end;

procedure TfrmTipoPrecio.FormCreate(Sender: TObject);
begin
  tblTipoPrecio.close;
  tblTipoPrecio.Open; 
end;

end.
