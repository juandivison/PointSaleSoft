unit UCatalogo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, Buttons, RXCtrls, ExtCtrls, ComCtrls, Grids,
  DBGrids, RXDBCtrl, Mask, Menus, DB, WinSkinData, RxLookup,
  RxToolEdit;

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
    RxDBLookupCombo1: TRxDBLookupCombo;
    RxDBLookupCombo2: TRxDBLookupCombo;
    Label11: TLabel;
    PopupMenu2: TPopupMenu;
    Activos1: TMenuItem;
    Pasivos1: TMenuItem;
    Patrimonio1: TMenuItem;
    Gastos1: TMenuItem;
    Costos1: TMenuItem;
    OtrosIngresos1: TMenuItem;
    OtrosGastos1: TMenuItem;
    OtrasCuetnas1: TMenuItem;
    SkinData1: TSkinData;
    Label16: TLabel;
    SinCtaControl1: TMenuItem;
    RxDBGrid2: TRxDBGrid;
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
    procedure SinValores1Click(Sender: TObject);
    procedure SumaControles1Click(Sender: TObject);
    procedure DBEdit7Exit(Sender: TObject);
    procedure DBEdit10Exit(Sender: TObject);
    procedure DBEdit13Exit(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure SinCtaControl1Click(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  frmCatalogo: TfrmCatalogo;

implementation

uses UDatModCatalogo, Uglobal, URepValoresCatalogo, URepCuentasCatalogo,
  URepCtaCtrl;//, URepCatalogo;

{$R *.dfm}

procedure TfrmCatalogo.btnInsertarClick(Sender: TObject);
begin
  if dmcatalogo.tblqryCatalogo.State = dsBrowse then
  begin
    dmcatalogo.tblqryCatalogo.Insert;
    dmcatalogo.tblqryCatalogoCIA_KEY.Value:= GlbCodOficina;
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
  dmCatalogo.tblqryCatalogo.params[0].Value:=GlbCodigoCia;  
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
       MessageDlg('Favor compleatar los datos',mtInformation, [mbOK], 0);
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
  dmcatalogo.qrycatalogo.Close;
  dmcatalogo.qrycatalogo.Params[0].Value:=GlbCodigoCia;
  dmcatalogo.qrycatalogo.Open;
  qckCatConValores:= TqckCatConValores.Create(nil);
  try
    qckCatConValores.preview;
  finally
  qckCatConValores.free;
  qckCatConValores:=nil;
  end;
end;

procedure TfrmCatalogo.FormCreate(Sender: TObject);
begin
  dmCatalogo.qryAfectaCta.Close;
  dmCatalogo.qryAfectaCta.Open;
  dmCatalogo.qryAfectaCta.RecordCount;
  dmCatalogo.tblTipocuenta.Close;
  dmCatalogo.tblTipocuenta.Open;
  dmCatalogo.tblqryCatalogo.Close;
  dmCatalogo.tblqryCatalogo.params[0].Value:=GlbCodigoCia;
  dmCatalogo.tblqryCatalogo.Filtered:=False;
  dmCatalogo.tblqryCatalogo.Open;
  //TranslateComponent(Self);
end;

procedure TfrmCatalogo.SinValores1Click(Sender: TObject);
begin
  dmcatalogo.qrycatalogo.Close;
  dmCatalogo.qryCatalogo.params[0].Value:=GlbCodigoCia;
  dmcatalogo.qrycatalogo.Open;
  if not Assigned(qckRepCtaCatalogo) then
  qckRepCtaCatalogo:=TqckRepCtaCatalogo.Create(nil);
  try
    if messageDlg('Imprimir?',mtinformation,[mbyes,mbno],0) = mryes then
    begin
      qckRepCtaCatalogo.printersetup;
      qckRepCtaCatalogo.print;
    end else
    qckRepCtaCatalogo.preview;
  finally
  qckRepCtaCatalogo.free;
  qckRepCtaCatalogo:=nil;
  end;
end;

procedure TfrmCatalogo.SumaControles1Click(Sender: TObject);
begin
  dmcatalogo.qrycatalogo.Close;
  dmCatalogo.qryCatalogo.Params[0].Value:= GlbCodigoCia;
  dmcatalogo.qrycatalogo.Open;
  dmcatalogo.qrycatalogo.Filtered:=False;
  //dmcatalogo.qrycatalogo.strFilterField1  :='(Balance_Act <> 0) or (Balance_Ant <> 0)';
  dmcatalogo.qrycatalogo.Filtered:=True;
  qckRepCtasCtrls:=TqckRepCtasCtrls.Create(nil);
  try
    qckRepCtasCtrls.preview;
  finally
  qckRepCtasCtrls.free;
  qckRepCtasCtrls:=nil;
  end;
  dmcatalogo.qrycatalogo.Filtered:=False;
end;

procedure TfrmCatalogo.DBEdit7Exit(Sender: TObject);
begin
  if (dmCatalogo.tblqryCatalogoCTA_CTRL1.AsString = '000') then exit;
  if not CtaExiste(dmCatalogo.tblqryCatalogoCTA_CTRL1.AsString,
  dmCatalogo.tblqryCatalogoCTA_CTRL2.AsString,
  dmCatalogo.tblqryCatalogoCTA_CTRL3.AsString, true) then
  DBEdit5.SetFocus;
end;

procedure TfrmCatalogo.DBEdit10Exit(Sender: TObject);
begin
  if (dmCatalogo.tblqryCatalogoCTACIE1.AsString = '000') then exit;
  if not CtaExiste(dmCatalogo.tblqryCatalogoCTACIE1.AsString,
  dmCatalogo.tblqryCatalogoCTACIE2.AsString,
  dmCatalogo.tblqryCatalogoCTACIE3.AsString, true) then
  DBEdit8.SetFocus;
end;

procedure TfrmCatalogo.DBEdit13Exit(Sender: TObject);
begin
  if (dmCatalogo.tblqryCatalogoCTA_CONS1.AsString = '000') then exit;
  if not CtaExiste(dmCatalogo.tblqryCatalogoCTA_CONS1.AsString,
  dmCatalogo.tblqryCatalogoCTA_CONS2.AsString,
  dmCatalogo.tblqryCatalogoCTA_CONS3.AsString, true) then
  DBEdit11.SetFocus;
end;

procedure TfrmCatalogo.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if (dmCatalogo.tblqryCatalogoTIPO_CTA.Value = 'C') then
  begin
    BackGround := clSkyBlue;
  end;
 { if (dmCatalogo.tblqryCatalogoNoExiste.Value = 0) then
  begin
    background := clSilver;
    Label16.Visible:=true;
    Label16.Font.Color:=clRed;
  end else
  Label16.Visible:=False;}
end;

procedure TfrmCatalogo.SinCtaControl1Click(Sender: TObject);
begin
  dmCatalogo.strSinControl := '1';
  dmCatalogo.tblqryCatalogo.Filtered:=False;
  dmCatalogo.tblqryCatalogo.Filtered:=True;
end;

end.
