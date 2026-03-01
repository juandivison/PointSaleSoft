unit UCatalogo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, Buttons, RXCtrls, ExtCtrls, ComCtrls, Grids,
  DBGrids, RXDBCtrl, Mask, ToolEdit, Menus, DB, WinSkinData;

type
  TfrmCatalogo = class(TForm)
    Panel2: TPanel;
    RxSpeedButton18: TRxSpeedButton;
    btnSalvar: TBitBtn;
    btnCerarAbrirres: TBitBtn;
    btnModificar: TBitBtn;
    btnCancelar: TBitBtn;
    btnInsertar: TBitBtn;
    BitBtn3: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    RxDBGrid1: TRxDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label10: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label13: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    DBRadioGroup2: TDBRadioGroup;
    DBRadioGroup3: TDBRadioGroup;
    Label3: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    Label4: TLabel;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit14: TDBEdit;
    DBDateEdit1: TDBDateEdit;
    DBDateEdit2: TDBDateEdit;
    DBDateEdit3: TDBDateEdit;
    PopupMenu1: TPopupMenu;
    ConValores1: TMenuItem;
    SinValores1: TMenuItem;
    SumaControles1: TMenuItem;
    dsTblCatalogo: TDataSource;
    DBStatusLabel1: TDBStatusLabel;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    SkinData1: TSkinData;
    procedure btnInsertarClick(Sender: TObject);
    procedure btnCerarAbrirresClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnModificarClick(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure ConValores1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCatalogo: TfrmCatalogo;

implementation

uses UDatModCatalogo, Uglobal;//, URepCatalogo;

{$R *.dfm}

procedure TfrmCatalogo.btnInsertarClick(Sender: TObject);
begin
  if dmcatalogo.tblqryCatalogo.State = dsBrowse then
  begin
    dmcatalogo.tblqryCatalogo.Insert;
    dmcatalogo.tblqryCatalogoSTATUS.Value:='A';
    dmcatalogo.tblqryCatalogoFECHA_APE.Value:=ExtraerFecha(date);
    dmcatalogo.tblqryCatalogoBALANCE_ACT.Value:=0;
    dmcatalogo.tblqryCatalogoBALANCE_ANT.Value:=0;
    DBEdit1.SetFocus;
  end;
end;

procedure TfrmCatalogo.btnCerarAbrirresClick(Sender: TObject);
begin
  dmCatalogo.tblqryCatalogo.Close;
  dmCatalogo.tblqryCatalogo.Filtered:=False;
  dmCatalogo.tblqryCatalogo.Params[0].Value := 1;//cia_key  
  dmCatalogo.tblqryCatalogo.Open;
end;

procedure TfrmCatalogo.btnSalvarClick(Sender: TObject);
begin
  if dmcatalogo.tblqryCatalogo.State in [dsInsert,dsEdit] then
  begin
    if dmcatalogo.tblqryCatalogoTIPO_CTA.IsNull or
    dmcatalogo.tblqryCatalogoSIGNO_CTA.IsNull or
    dmcatalogo.tblqryCatalogoNIVEL_CTA.IsNull or
    dmcatalogo.tblqryCatalogoCUENTA1.IsNull or
    dmcatalogo.tblqryCatalogoCUENTA2.IsNull or
    dmcatalogo.tblqryCatalogoCUENTA3.IsNull then
    begin
       MessageDlg('Favor completar los datos',mtInformation, [mbOK], 0);
       DBEdit1.SetFocus;
       Exit;
    end;
    dmCatalogo.tblqryCatalogo.Post;
    dmCatalogo.tblqryCatalogo.ApplyUpdates;
    if not dmCatalogo.tblqryCatalogo.Transaction.InTransaction then
    dmCatalogo.tblqryCatalogo.Transaction.StartTransaction;
    try
      dmCatalogo.tblqryCatalogo.Transaction.CommitRetaining;
    except
    dmCatalogo.tblqryCatalogo.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmCatalogo.btnCancelarClick(Sender: TObject);
begin
  if dmcatalogo.tblqryCatalogo.State in [dsInsert,dsEdit] then
  dmcatalogo.tblqryCatalogo.Cancel;
end;

procedure TfrmCatalogo.btnModificarClick(Sender: TObject);
begin
  if dmcatalogo.tblqryCatalogo.State in [dsInactive,dsBrowse] then
  dmcatalogo.tblqryCatalogo.Edit;
end;

procedure TfrmCatalogo.BitBtn9Click(Sender: TObject);
begin
  dmCatalogo.tblqryCatalogo.First;
end;

procedure TfrmCatalogo.BitBtn10Click(Sender: TObject);
begin
  dmCatalogo.tblqryCatalogo.Prior;
end;

procedure TfrmCatalogo.BitBtn11Click(Sender: TObject);
begin
  dmCatalogo.tblqryCatalogo.Next;
end;

procedure TfrmCatalogo.BitBtn12Click(Sender: TObject);
begin
  dmCatalogo.tblqryCatalogo.Last;
end;

procedure TfrmCatalogo.ConValores1Click(Sender: TObject);
begin
  {qckRepCatalogo:=TqckRepCatalogo.Create(nil);
  try
    qckRepCatalogo.Preview;
  finally
  qckRepCatalogo.free;
  qckRepCatalogo:=nil;
  end;}
end;

procedure TfrmCatalogo.FormCreate(Sender: TObject);
begin
  dmCatalogo.tblTipocuenta.Close;
  dmCatalogo.tblTipocuenta.Open;
  dmCatalogo.tblqryCatalogo.Close;
  dmCatalogo.tblqryCatalogo.Filtered:=False;
  dmCatalogo.tblqryCatalogo.Params[0].Value := 1;//cia_key
  dmCatalogo.tblqryCatalogo.Open;
end;

end.
