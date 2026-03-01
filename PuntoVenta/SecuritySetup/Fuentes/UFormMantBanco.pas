unit UFormMantBanco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RxLookup, ToolEdit, RXDBCtrl, Grids, DBGrids, StdCtrls, Mask,
  DBCtrls, RXCtrls, ExtCtrls, ComCtrls, Buttons, DB, WinSkinData;

type
  TfrmBanco = class(TForm)
    dstblBancoMaster: TDataSource;
    Panel2: TPanel;
    btnSalvar: TBitBtn;
    btnCerarAbrirres: TBitBtn;
    btnModificar: TBitBtn;
    btnCancelar: TBitBtn;
    btnInsertar: TBitBtn;
    DBNavigator2: TDBNavigator;
    BitBtn3: TBitBtn;
    PageControl1: TPageControl;
    tabRecord: TTabSheet;
    ScrollBox1: TScrollBox;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label3: TLabel;
    Splitter1: TSplitter;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DBStatusLabel3: TDBStatusLabel;
    DBStatusLabel4: TDBStatusLabel;
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    RxDBGrid1: TRxDBGrid;
    btnInsertarTarifa: TBitBtn;
    btnmodtarifa: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    DBEdit2: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit8: TDBEdit;
    tabExaminar: TTabSheet;
    RxDBGrid2: TRxDBGrid;
    DBDateEdit3: TDBDateEdit;
    DBDateEdit4: TDBDateEdit;
    RxDBLookupCombo1: TRxDBLookupCombo;
    dstblBancoDetalle: TDataSource;
    dstblTipoCtaBanco: TDataSource;
    RxDBLookupCombo2: TRxDBLookupCombo;
    Label8: TLabel;
    tblMoneda: TDataSource;
    SkinData1: TSkinData;
    procedure btnInsertarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnCerarAbrirresClick(Sender: TObject);
    procedure btnModificarClick(Sender: TObject);
    procedure btnInsertarTarifaClick(Sender: TObject);
    procedure btnmodtarifaClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBanco: TfrmBanco;

implementation

uses UDatModBanco, UGlobal;

{$R *.dfm}

procedure TfrmBanco.btnInsertarClick(Sender: TObject);
begin
  if dmBanco.tblBancoMaster.State in [dsEdit, dsInsert] then
  begin
    dmBanco.tblBancoMaster.Insert;
  end;
end;

procedure TfrmBanco.btnSalvarClick(Sender: TObject);
begin
  if dmBanco.tblBancoMaster.State in [dsEdit, dsInsert] then
  begin
    dmBanco.tblBancoMasterCODIGO.Value := FsqlMaxNumero('Bancos','codigo');
    dmBanco.tblBancoMaster.Post;
    dmBanco.tblBancoMaster.ApplyUpdates;
    if Not dmBanco.tblBancoMaster.Transaction.InTransaction then
    dmBanco.tblBancoMaster.Transaction.StartTransaction;
    try
      dmBanco.tblBancoMaster.Transaction.CommitRetaining;
    except
    dmBanco.tblBancoMaster.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmBanco.btnCancelarClick(Sender: TObject);
begin
  if dmBanco.tblBancoMaster.State in [dsEdit, dsInsert] then
  dmBanco.tblBancoMaster.Cancel;
end;

procedure TfrmBanco.btnCerarAbrirresClick(Sender: TObject);
begin
  if dmBanco.tblBancoMaster.State in [dsBrowse, dsInactive] then
  begin
    dmBanco.tblBancoMaster.Close;
    dmBanco.tblBancoMaster.Open;
  end;
end;

procedure TfrmBanco.btnModificarClick(Sender: TObject);
begin
  if dmBanco.tblBancoMaster.State In [dsBrowse, dsInactive] then
  begin
    dmBanco.tblBancoMaster.Close;
    dmBanco.tblBancoMaster.Open;
  end;
end;

procedure TfrmBanco.btnInsertarTarifaClick(Sender: TObject);
begin
  if dmBanco.tblBancoDetalle.State in [dsBrowse] then
  begin
    dmBanco.tblBancoDetalle.Insert;
    dmBanco.tblBancoDetalleSTATUS.Value:='A';
    dmBanco.tblBancoDetalleFECHA_APERTURA.Value:=Date;
    DBEdit6.SetFocus;
  end;
end;

procedure TfrmBanco.btnmodtarifaClick(Sender: TObject);
begin
  if dmBanco.tblBancoDetalle.State in [dsBrowse] then
  begin
    dmBanco.tblBancoDetalle.Edit;
  end;
end;

procedure TfrmBanco.BitBtn4Click(Sender: TObject);
begin
  if dmBanco.tblBancoDetalle.State in [dsEdit, dsInsert] then
  begin
    dmBanco.tblBancoDetalleSerie.Value := FsqlMaxNumero('Bancos_Det','Codigo');
    dmBanco.tblBancoDetalleCODIGO.Value := dmBanco.tblBancoMasterCODIGO.Value;
    dmBanco.tblBancoDetalle.Post;
    dmBanco.tblBancoDetalle.ApplyUpdates;
    if Not dmBanco.tblBancoDetalle.Transaction.InTransaction then
    dmBanco.tblBancoDetalle.Transaction.StartTransaction;
    try
      dmBanco.tblBancoDetalle.Transaction.CommitRetaining;
    except
    dmBanco.tblBancoDetalle.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmBanco.BitBtn5Click(Sender: TObject);
begin
  if dmBanco.tblBancoDetalle.State in [dsEdit, dsInsert] then
  dmBanco.tblBancoDetalle.Cancel;
end;

procedure TfrmBanco.FormCreate(Sender: TObject);
begin
  dmBanco.tblTipoCtaBanco.Close;
  dmBanco.tblTipoCtaBanco.Open;
  dmBanco.tblBancoMaster.Close;
  dmBanco.tblBancoMaster.Open;
  dmBanco.tblMoneda.Close;
  dmBanco.tblMoneda.Open;
  //Pago AES Factua Electrica Casa, con tarjeta Orbis Popular
  //Judith Duran Caja #22
  //Autorizacion R45241
end;

end.
