unit UFormServFijos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  db, Dialogs, RXCtrls, RXDBCtrl, StdCtrls, Buttons, Grids, DBGrids, Mask,
  DBCtrls, WinSkinData, RxLookup;

type
  TfrmServiciosReg = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    DBStatusLabel1: TDBStatusLabel;
    SkinData1: TSkinData;
    Label6: TLabel;
    RxDBLookupCombo3: TRxDBLookupCombo;
    BitBtn15: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmServiciosReg: TfrmServiciosReg;

implementation
uses UDatModFactura, UGlobal, UDatModInventario, UConsultaInventario;
{$R *.dfm}

procedure TfrmServiciosReg.BitBtn1Click(Sender: TObject);
begin
  if dmFactura.tblServProgIguala.State = dsBrowse then
  begin
    dmFactura.tblServProgIguala.Insert;
    //dmFactura.tblServProgIgualasSTATUS.Value := 'A';
    DBEdit2.SetFocus;
  end;
end;

procedure TfrmServiciosReg.BitBtn2Click(Sender: TObject);
begin
  if dmFactura.tblServProgIguala.State = dsBrowse then
  dmFactura.tblServProgIguala.Edit;
end;

procedure TfrmServiciosReg.BitBtn3Click(Sender: TObject);
begin
  if dmFactura.tblServProgIguala.State in [dsEdit, dsInsert] then
  dmFactura.tblServProgIguala.cancel;
end;

procedure TfrmServiciosReg.BitBtn4Click(Sender: TObject);
begin
  if dmFactura.tblServProgIguala.State in [dsEdit, dsInsert] then
  begin
    if dmFactura.tblServProgIguala.State = dsInsert then
    begin
      dmFactura.tblServProgIgualaCODIGO.Value := FsqlMaxNumero('SERV_PROG_IGUALAS','Codigo');
      if dmFactura.tblServProgIgualaCODIGO.IsNull Or (dmFactura.tblServProgIgualaCODIGO.Value = 0) then
      dmFactura.tblServProgIgualaCODIGO.Value := 1;
    end;
    
    dmFactura.tblServProgIguala.Post;
    dmFactura.tblServProgIguala.ApplyUpdates;
    if not dmFactura.tblServProgIguala.Transaction.InTransaction then
    dmFactura.tblServProgIguala.Transaction.StartTransaction;
    try
      dmFactura.tblServProgIguala.Transaction.CommitRetaining;
    except
    dmFactura.tblServProgIguala.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmServiciosReg.BitBtn5Click(Sender: TObject);
begin
  if dmFactura.tblServProgIguala.State in [dsInactive, dsBrowse] then
  begin
    dmFactura.tblServProgIguala.Close;
    dmFactura.tblServProgIguala.Open;
  end;
end;

procedure TfrmServiciosReg.FormCreate(Sender: TObject);
begin
  dmFactura.tblServProgIguala.Close;
  dmFactura.tblServProgIguala.Open;
  dmInventario.tblInventarioProd.Close;//dmInventario.tblInventarioProd.selectSQL.TEXT
  dmInventario.tblInventarioProd.Filtered:=False;
  dmInventario.tblInventarioProd.Params[0].Value:=glbCia_Key;
  dmInventario.tblInventarioProd.Open;
end;

procedure TfrmServiciosReg.BitBtn15Click(Sender: TObject);
begin
  frmConsultaInventario:=TfrmConsultaInventario.Create(Nil);
  try
    if frmConsultaInventario.Showmodal = mrOk then
    begin
      if dmFactura.tblServProgIguala.State in [dsEdit, dsInsert] then
      begin
        dmFactura.tblServProgIgualaCODIGO_PRODUCTO.Value := frmConsultaInventario.ibquery1codigo.Value;
        dmFactura.tblServProgIgualaDESCRIPCION.Value:=dmInventario.tblInventarioProdDESCRIPCION.Value;
      end else
      dmFactura.tblServProgIguala.Locate('CODIGO_PRODUCTO',frmConsultaInventario.ibquery1codigo.Value,[]);
    end;
  finally
  frmConsultaInventario.Free;
  frmConsultaInventario:=Nil;
  end;
end;

end.
