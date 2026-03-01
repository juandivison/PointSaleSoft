unit UFormTemplateFactura;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Mask, DBCtrls, Grids, DBGrids, RXDBCtrl,
  db, ExtCtrls, Buttons, RXCtrls, RxLookup, WinSkinData, RxDBComb;

type
  TfrmTemplateExcel = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    RxDBGrid1: TRxDBGrid;
    RxDBGrid3: TRxDBGrid;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    Label14: TLabel;
    DBEdit14: TDBEdit;
    Shape1: TShape;
    RxDBGrid2: TRxDBGrid;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton1: TSpeedButton;
    DBStatusLabel1: TDBStatusLabel;
    SpeedButton4: TSpeedButton;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    DBStatusLabel2: TDBStatusLabel;
    SpeedButton8: TSpeedButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    SpeedButton9: TSpeedButton;
    DBStatusLabel3: TDBStatusLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    DBRadioGroup1: TDBRadioGroup;
    SkinData1: TSkinData;
    RxDBComboBox1: TRxDBComboBox;
    RadioGroup1: TRadioGroup;
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTemplateExcel: TfrmTemplateExcel;

implementation

uses UDatModFactura, uglobal;

{$R *.dfm}

procedure TfrmTemplateExcel.SpeedButton2Click(Sender: TObject);
begin
  if dmFactura.tblTemplateTipoDoc.State = dsBrowse then
  begin
    dmFactura.tblTemplateTipoDoc.Insert;
    dmFactura.tblTemplateTipoDocSTATUS.Value := 'A';
    DBEdit2.SetFocus;
  end;
end;

procedure TfrmTemplateExcel.SpeedButton3Click(Sender: TObject);
begin
  if dmFactura.tblTemplateTipoDoc.State in [dsInsert,dsEdit] then
  dmFactura.tblTemplateTipoDoc.Cancel;
end;

procedure TfrmTemplateExcel.SpeedButton4Click(Sender: TObject);
begin
  dmFactura.tblTemplateTipoDoc.Delete;
end;

procedure TfrmTemplateExcel.SpeedButton1Click(Sender: TObject);
begin
  if dmFactura.tblTemplateTipoDoc.State in [dsInsert,dsEdit] then
  begin
    if dmFactura.tblTemplateTipoDoc.State in [dsInsert] then
    dmFactura.tblTemplateTipoDocIDDOC.Value:= FsqlMaxNumero('TEMPLATE_XLS_DOC','IDDOC');
    dmFactura.tblTemplateTipoDoc.Post;
    dmFactura.tblTemplateTipoDoc.ApplyUpdates;
    if not dmFactura.tblTemplateTipoDoc.Transaction.InTransaction then
    dmFactura.tblTemplateTipoDoc.Transaction.StartTransaction;
    try
      dmFactura.tblTemplateTipoDoc.Transaction.CommitRetaining;
    except
    dmFactura.tblTemplateTipoDoc.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmTemplateExcel.SpeedButton7Click(Sender: TObject);
begin
  if dmFactura.tblTemplateMaster.State in [dsInsert,dsEdit] then
  begin
    if dmFactura.tblTemplateMaster.State in [dsInsert] then
    dmFactura.tblTemplateMasterNUMEROID.Value:= FsqlMaxNumero('TEMPLATE_XLS_MASTER','NUMEROID');
    dmFactura.tblTemplateMaster.Post;
    dmFactura.tblTemplateMaster.ApplyUpdates;
    if not dmFactura.tblTemplateMaster.Transaction.InTransaction then
    dmFactura.tblTemplateMaster.Transaction.StartTransaction;
    try
      dmFactura.tblTemplateMaster.Transaction.CommitRetaining;
    except
    dmFactura.tblTemplateMaster.Transaction.RollbackRetaining;
    end;
  end;

  if dmFactura.tblTemplateDet.State in [dsInsert,dsEdit] then
  begin
    if dmFactura.tblTemplateDet.State in [dsInsert] then
    dmFactura.tblTemplateDetSERIEID.Value:= FsqlMaxNumero('TEMPLATE_XLS','SERIEID');
    
    dmFactura.tblTemplateDetNUMEROID.Value:= dmFactura.tblTemplateMasterNUMEROID.Value;
    dmFactura.tblTemplateDet.Post;
    dmFactura.tblTemplateDet.ApplyUpdates;
    if not dmFactura.tblTemplateDet.Transaction.InTransaction then
    dmFactura.tblTemplateDet.Transaction.StartTransaction;
    try
      dmFactura.tblTemplateDet.Transaction.CommitRetaining;
    except
    dmFactura.tblTemplateDet.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmTemplateExcel.SpeedButton9Click(Sender: TObject);
begin
  if dmFactura.tblTemplateMaster.State in [dsBrowse] then
  begin
    dmFactura.tblTemplateMaster.Insert;
    dmFactura.tblTemplateMasterFECHA.Value:=ExtraerFecha(now);
    dmFactura.tblTemplateMasterSTATUS.Value:='A';
    RxDBLookupCombo1.SetFocus;
  end;
end;

procedure TfrmTemplateExcel.SpeedButton5Click(Sender: TObject);
begin
  if dmFactura.tblTemplateDet.State in [dsBrowse] then
  begin
    dmFactura.tblTemplateDet.Insert;
    dmFactura.tblTemplateDetNUMEROID.Value:=dmFactura.tblTemplateMasterNUMEROID.Value;
    dmFactura.tblTemplateDetSTATUS.Value:='A';
    if RadioGroup1.ItemIndex = 0 then
    dmfactura.tblTemplateDetSECCION.Value:='HEADER'
    else
    if RadioGroup1.ItemIndex = 1 then
    dmfactura.tblTemplateDetSECCION.Value:='DETAIL'
    else
    if RadioGroup1.ItemIndex = 2 then
    dmfactura.tblTemplateDetSECCION.Value:='FOOTER';
    DBEdit10.SetFocus;
  end;
end;

procedure TfrmTemplateExcel.SpeedButton6Click(Sender: TObject);
begin
  if dmFactura.tblTemplateMaster.State in [dsInsert,dsEdit] then
  dmFactura.tblTemplateMaster.Cancel;

  if dmFactura.tblTemplateDet.State in [dsInsert,dsEdit] then
  dmFactura.tblTemplateDet.Cancel;
end;

procedure TfrmTemplateExcel.FormCreate(Sender: TObject);
begin
  dmFactura.tblTemplateMaster.Close;
  dmFactura.tblTemplateMaster.Open;
  
  dmFactura.tblTemplateTipoDoc.Close;
  dmFactura.tblTemplateTipoDoc.Open;
  dmFactura.tblTemplateTipoDocLookup.Close;
  dmFactura.tblTemplateTipoDocLookup.Open;
  //dmFactura.tblTemplateDet.Close;
  //dmFactura.tblTemplateDet.Open;
end;

procedure TfrmTemplateExcel.BitBtn3Click(Sender: TObject);
begin
  dmFactura.tblTemplateMaster.First;
end;

procedure TfrmTemplateExcel.BitBtn4Click(Sender: TObject);
begin
  dmFactura.tblTemplateMaster.Prior;
end;

procedure TfrmTemplateExcel.BitBtn1Click(Sender: TObject);
begin
  dmFactura.tblTemplateMaster.Next;
end;

procedure TfrmTemplateExcel.BitBtn2Click(Sender: TObject);
begin
  dmFactura.tblTemplateMaster.Last;
end;

procedure TfrmTemplateExcel.BitBtn9Click(Sender: TObject);
begin
  dmFactura.tblTemplateTipoDoc.Prior;
end;

procedure TfrmTemplateExcel.BitBtn10Click(Sender: TObject);
begin
  dmFactura.tblTemplateTipoDoc.Prior;
end;

procedure TfrmTemplateExcel.BitBtn11Click(Sender: TObject);
begin
  dmFactura.tblTemplateTipoDoc.Next;
end;

procedure TfrmTemplateExcel.BitBtn12Click(Sender: TObject);
begin
  dmFactura.tblTemplateTipoDoc.Last;
end;

procedure TfrmTemplateExcel.RadioGroup1Click(Sender: TObject);
begin
  dmFactura.tblTemplateDet.Filtered:=False;
  if RadioGroup1.ItemIndex = 0 then
  dmFactura.strFilterSeccion:='HEADER'
  else
  if RadioGroup1.ItemIndex = 1 then
    dmFactura.strFilterSeccion:='DETAIL'
  else
  if RadioGroup1.ItemIndex = 2 then
    dmFactura.strFilterSeccion:='FOOTER'
    else
  if RadioGroup1.ItemIndex = 3 then
  dmFactura.strFilterSeccion:='';
  dmFactura.tblTemplateDet.Filtered:=True;
  dmFactura.tblTemplateDet.Close;
  dmFactura.tblTemplateDet.Open;
end;

end.
