unit UFormVocadosDet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WinSkinData, StdCtrls, Buttons, Grids, DBGrids, RxDBCtrl, Mask,
  DBCtrls, RxCtrls, RxLookup, DB;

type
  TfrmVocadoDet = class(TForm)
    Label2: TLabel;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton1: TSpeedButton;
    DBStatusLabel1: TDBStatusLabel;
    DBEdit2: TDBEdit;
    RxDBGrid1: TRxDBGrid;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    SkinData1: TSkinData;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label1: TLabel;
    RxDBLookupCombo2: TRxDBLookupCombo;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    Label4: TLabel;
    dsqryInv: TDataSource;
    BitBtn1: TBitBtn;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    Label7: TLabel;
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure RxDBLookupCombo2Change(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure RxDBLookupCombo1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVocadoDet: TfrmVocadoDet;

implementation
  uses UDatosVentas, UConsultaInventario, UGlobal,
  UBuscarClientesPersonasP;
{$R *.dfm}

procedure TfrmVocadoDet.BitBtn10Click(Sender: TObject);
begin
  dmVentas.tblVentaVocados.prior;
end;

procedure TfrmVocadoDet.BitBtn11Click(Sender: TObject);
begin
  dmVentas.tblVentaVocados.next;
end;

procedure TfrmVocadoDet.BitBtn12Click(Sender: TObject);
begin
  dmVentas.tblVentaVocados.Last;
end;

procedure TfrmVocadoDet.BitBtn9Click(Sender: TObject);
begin
  dmVentas.tblVentaVocados.first;
end;

procedure TfrmVocadoDet.SpeedButton1Click(Sender: TObject);
begin
  if dmVentas.tblVentaVocados.State in [dsinsert, dsEdit] then
  begin
    //dmVentas.tblVentaVocadosIDTIPOVEH.Value:= FsqlMaxNumero('tipo_vehiculo','IDTIPOVEH');
    dmVentas.tblVentaVocados.Post;
    dmVentas.tblVentaVocados.ApplyUpdates;
    if not dmVentas.tblVentaVocados.Transaction.InTransaction then
    dmVentas.tblVentaVocados.Transaction.StartTransaction;
    try
      dmVentas.tblVentaVocados.Transaction.CommitRetaining;
    except
    dmVentas.tblVentaVocados.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmVocadoDet.SpeedButton2Click(Sender: TObject);
begin

  if dmVentas.tblVentaVocados.State = dsBrowse then
  begin
    dmVentas.tblVentaVocados.Insert;
    DBEdit2.SetFocus;
  end;
end;

procedure TfrmVocadoDet.SpeedButton3Click(Sender: TObject);
begin
  if dmVentas.tblVentaVocados.State in [dsinsert, dsEdit] then
  begin
    dmVentas.tblVentaVocados.Cancel;
  end;
end;

procedure TfrmVocadoDet.FormCreate(Sender: TObject);
begin
  dmVentas.qryClientes.Close;
  dmVentas.qryClientes.Open;
  dmVentas.qryInv.Close;
  dmVentas.qryInv.Open;
end;

procedure TfrmVocadoDet.BitBtn1Click(Sender: TObject);
begin
  if dmVentas.tblVentaVocados.State in [dsBrowse] then
  dmVentas.tblVentaVocados.Edit;
end;

procedure TfrmVocadoDet.RxDBLookupCombo2Change(Sender: TObject);
begin
  dmVentas.tblVentaVocadosDESCRIPCION.Value:= dmVentas.qryInv.fieldbyname('Descripcion').Value;
end;

procedure TfrmVocadoDet.BitBtn2Click(Sender: TObject);
begin
  frmConsultaInventario:=TfrmConsultaInventario.Create(Nil);
  try
    if frmConsultaInventario.Showmodal = mrOk then
    begin
      if dmVentas.tblVentaVocados.state = dsBrowse then
      dmVentas.tblVentaVocados.Edit;
      dmVentas.tblVentaVocadosCOD_PRODUCTO.Value:=frmConsultaInventario.ibquery1codigo.Value;
    end;

  finally
  frmConsultaInventario.Free;
  frmConsultaInventario:=Nil;
  end;
end;

procedure TfrmVocadoDet.BitBtn3Click(Sender: TObject);
begin
  if dmVentas.tblVentaVocados.State in [dsBrowse] then
  begin
    dmVentas.tblVentaVocados.Delete;
    GlbSalvarQuery(dmVentas.tblVentaVocados);
  end;
end;

procedure TfrmVocadoDet.BitBtn4Click(Sender: TObject);
begin
  FrmBuscarClientesPersonas:=TFrmBuscarClientesPersonas.Create(nil);
  try
    FrmBuscarClientesPersonas.CodigoCliente := -1;
    if FrmBuscarClientesPersonas.Showmodal = mrOk then
    begin
      if dmVentas.tblVentaVocados.State in [dsBrowse] then
      dmVentas.tblVentaVocados.Edit;
      dmVentas.tblVentaVocadosCOD_SUBCLIENTE.Value:=FrmBuscarClientesPersonas.CodigoCliente;
    end;
  finally
  FrmBuscarClientesPersonas.Free;
  FrmBuscarClientesPersonas:=Nil;
  end;
end;

procedure TfrmVocadoDet.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  SpeedButton1Click(Self);
end;

procedure TfrmVocadoDet.RxDBLookupCombo1Change(Sender: TObject);
begin
  dmVentas.tblVentaVocadosNOMBRESUBCLIENTE.Value:=
  dmVentas.qryClientesNOMBRE_FACTURAR.Value;
  dmVentas.tblVentaVocadosDIRECCIONSUBCTE.Value:=
  dmVentas.qryClientesDIRECCION_CONT.Value;
end;

end.
