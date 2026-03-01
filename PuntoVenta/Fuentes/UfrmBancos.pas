unit UfrmBancos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, StdCtrls, Mask, DBCtrls, Grids, DBGrids,
  Buttons, WinSkinData, RXCtrls, RXDBCtrl, rxToolEdit, RxLookup, IBTable,
  ComCtrls, ExtCtrls;

type
  TfrmBancos = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBStatusLabel1: TDBStatusLabel;
    DBStatusLabel2: TDBStatusLabel;
    RxLabel1: TRxLabel;
    Label7: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    DBDateEdit1: TDBDateEdit;
    DBDateEdit2: TDBDateEdit;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    RxDBLookupCombo1: TRxDBLookupCombo;
    tblBanco: TIBDataSet;
    tblBancoCODIGO: TSmallintField;
    tblBancoCIA_KEY: TIntegerField;
    tblBancoDESCRIPCION: TIBStringField;
    tblBancoCODIGO_ABR: TIBStringField;
    DataSource1: TDataSource;
    tblBancoDet: TIBDataSet;
    tblBancoDetSERIE: TFloatField;
    tblBancoDetCODIGO: TSmallintField;
    tblBancoDetTIPO: TIBStringField;
    tblBancoDetCUENTA_BANCO: TIBStringField;
    tblBancoDetMONEDA: TIBStringField;
    tblBancoDetCUENTA1: TIBStringField;
    tblBancoDetCUENTA2: TIBStringField;
    tblBancoDetCUENTA3: TIBStringField;
    tblBancoDetSTATUS: TIBStringField;
    tblBancoDetFECHA_APERTURA: TDateTimeField;
    tblBancoDetFECHA_CANCELADA: TDateTimeField;
    tblBancoDetCKS_CLASIFICACION: TSmallintField;
    DataSource2: TDataSource;
    RxDBLookupCombo2: TRxDBLookupCombo;
    Label8: TLabel;
    tblTipoCuentabco: TIBTable;
    tblTipoCuentabcoCODIGO: TIntegerField;
    tblTipoCuentabcoDESCRIPCION: TIBStringField;
    dbtblTipoCuentabco: TDataSource;
    DBGrid2: TDBGrid;
    tblBancoCHEQUES_BANCO_INI: TIBStringField;
    SkinData1: TSkinData;
    tblBancoDetCIA_KEY: TIntegerField;
    tblBancoDetFECHA_ULT_TRN: TDateTimeField;
    tblBancoDetDEBITO_ACM: TFloatField;
    tblBancoDetCREDITO_ACM: TFloatField;
    tblBancoDetBALANCEANT: TFloatField;
    tblBancoDetBALANCEACT: TFloatField;
    tblBancoDetCTA_DEFAULT: TSmallintField;
    tblBancoDetBALANCE: TFloatField;
    tblBancoDetTIPO_CUENTA: TSmallintField;
    tblBancoDetACTIVAENFCT: TSmallintField;
    DBRadioGroup1: TDBRadioGroup;
    tblBancoDetFACT_DESCBANCO: TIBStringField;
    tblBancoDetFACT_TITLAR: TIBStringField;
    tblBancoDetFACT_DESCNUMCTA: TIBStringField;
    Label9: TLabel;
    DBEdit5: TDBEdit;
    Label10: TLabel;
    DBEdit6: TDBEdit;
    Label11: TLabel;
    DBEdit7: TDBEdit;
    RxLabel2: TRxLabel;
    procedure tblBancoAfterScroll(DataSet: TDataSet);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBancos: TfrmBancos;

implementation

uses UDatModConectar, UDatModCompania, UGlobal;

{$R *.dfm}

procedure TfrmBancos.tblBancoAfterScroll(DataSet: TDataSet);
begin
  if tblBancoDet.State In [dsInactive, dsBrowse] then
  begin
    tblBancoDet.Close;
    tblBancoDet.Params[0].Value:= tblbancocodigo.Value;
    tblBancoDet.Open;
  end;
end;

procedure TfrmBancos.BitBtn7Click(Sender: TObject);
begin
  if tblBanco.state = dsBrowse then
  begin
    tblBanco.Insert;
    tblBancoDetACTIVAENFCT.Value:=1;
    DBEdit2.SetFocus;
  end;
end;

procedure TfrmBancos.BitBtn1Click(Sender: TObject);
begin
  if tblBancoDet.state = dsBrowse then
  begin
    tblBancoDet.Insert;
    tblBancoDetTipo.Value   :='1';
    tblBancoDetMONEDA.Value :='1';
    tblBancoDetCUENTA1.Value:='113';
    tblBancoDetCUENTA2.Value:='02';
    tblBancoDetCUENTA3.Value:='01';
    tblBancoDetSTATUS.Value := 'A';
    tblBancoDetACTIVAENFCT.Value:=1;
    DBEdit4.SetFocus;
  end;
end;

procedure TfrmBancos.BitBtn2Click(Sender: TObject);
begin
  if tblBancoDet.state = dsBrowse then
  begin
    tblBancoDet.Edit;
    tblBanco.Edit;
  end;

end;

procedure TfrmBancos.BitBtn3Click(Sender: TObject);
begin
  if tblBancoDet.state in [dsInsert, dsEdit] then
  tblBancoDet.Cancel;
  if tblBanco.state in [dsInsert, dsEdit] then
  tblBanco.Cancel
end;

procedure TfrmBancos.BitBtn4Click(Sender: TObject);
begin
  if tblBanco.state in [dsInsert, dsEdit] then
  begin
    tblBanco.Post;
    tblBanco.ApplyUpdates;
    if not tblBanco.Transaction.InTransaction then
    tblBanco.Transaction.StartTransaction;
    try
      tblBanco.Transaction.CommitRetaining;
    except
    tblBanco.Transaction.RollbackRetaining;
    end;
  end;
  if tblBancoDet.state in [dsInsert, dsEdit] then
  begin
    if tblBancoDetCODIGO.IsNull then
    tblBancoDetCODIGO.Value:= tblBancocodigo.Value;
    tblBancoDet.Post;
    tblBancoDet.ApplyUpdates;
    if not tblBancoDet.Transaction.InTransaction then
    tblBancoDet.Transaction.StartTransaction;
    try
      tblBancoDet.Transaction.CommitRetaining;
    except
    tblBancoDet.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmBancos.BitBtn5Click(Sender: TObject);
begin
  dmCompania.tblCompania.close;
  dmCompania.tblCompania.Open;
  dmCompania.tblCompania.Locate('codigo',glbCia_Key,[]);
  if tblBanco.State in [dsBrowse, dsInactive] then
  begin
    tblBanco.Close;
    tblBanco.Params[0].Value:=glbCia_Key;
    tblBanco.Open;
  end;
end;

procedure TfrmBancos.FormCreate(Sender: TObject);
begin
  tblTipoCuentabco.Close;
  tblTipoCuentabco.OPEN;
  BitBtn5Click(Self);
end;

procedure TfrmBancos.BitBtn8Click(Sender: TObject);
begin
  tblBanco.First;
end;

procedure TfrmBancos.BitBtn9Click(Sender: TObject);
begin
  tblBanco.Prior;
end;

procedure TfrmBancos.BitBtn10Click(Sender: TObject);
begin
  tblBanco.next;
end;

procedure TfrmBancos.BitBtn11Click(Sender: TObject);
begin
  tblBanco.Last;
end;

end.
