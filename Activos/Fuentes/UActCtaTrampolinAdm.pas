unit UActCtaTrampolinAdm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  db, ExtCtrls, DBCtrls, StdCtrls, Mask, Grids, DBGrids, RXCtrls, RXDBCtrl,
  Buttons, ComCtrls, DBTables, EditNew;

type
  TfrmActCtaTrampAdm = class(TForm)
    PageControl1: TPageControl;
    tabCtaTrampoln: TTabSheet;
    tabGrupo: TTabSheet;
    tabTipo: TTabSheet;
    TabSheet3: TTabSheet;
    Label3: TLabel;
    DBStatusLabel1: TDBStatusLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    dbgridCtaTramp: TDBGrid;
    DBEdit5: TDBEdit;
    DBNavigator2: TDBNavigator;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    DBLookupComboBox3: TDBLookupComboBox;
    BitBtn2: TBitBtn;
    Label5: TLabel;
    DBStatusLabel2: TDBStatusLabel;
    Label6: TLabel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    DBGrid1: TDBGrid;
    DBEdit1: TDBEdit;
    DBNavigator1: TDBNavigator;
    BitBtn5: TBitBtn;
    Label9: TLabel;
    DBStatusLabel3: TDBStatusLabel;
    Label10: TLabel;
    BitBtn6: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    DBGrid2: TDBGrid;
    DBEdit2: TDBEdit;
    DBNavigator3: TDBNavigator;
    BitBtn12: TBitBtn;
    Label13: TLabel;
    DBStatusLabel4: TDBStatusLabel;
    Label14: TLabel;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;
    BitBtn15: TBitBtn;
    DBGrid3: TDBGrid;
    DBEdit3: TDBEdit;
    DBNavigator4: TDBNavigator;
    BitBtn16: TBitBtn;
    DBEdit4: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    BitBtn17: TBitBtn;
    BitBtn18: TBitBtn;
    BitBtn19: TBitBtn;
    BitBtn20: TBitBtn;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    Label11: TLabel;
    DBLookupComboBox4: TDBLookupComboBox;
    BitBtn23: TBitBtn;
    Label15: TLabel;
    EditN1: TEditN;
    BitBtn25: TBitBtn;
    DBLookupComboBox5: TDBLookupComboBox;
    Label16: TLabel;
    Label17: TLabel;
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn20Click(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure BitBtn18Click(Sender: TObject);
    procedure BitBtn19Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn22Click(Sender: TObject);
    procedure BitBtn21Click(Sender: TObject);
    procedure BitBtn23Click(Sender: TObject);
    procedure BitBtn24Click(Sender: TObject);
    procedure BitBtn25Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmActCtaTrampAdm: TfrmActCtaTrampAdm;

implementation

uses UDatmodAdm, UDatModuloActivos;

{$R *.DFM}

procedure TfrmActCtaTrampAdm.BitBtn7Click(Sender: TObject);
begin
  if Dm.qryCtasTramp.state = dsBrowse then
  Dm.qryCtasTramp.insert;
end;

procedure TfrmActCtaTrampAdm.BitBtn9Click(Sender: TObject);
begin
  if Dm.qryCtasTramp.state in [dsedit,dsInsert] then
  begin
    dm.qryCtasTramp.Post;
    dm.qryCtasTramp.ApplyUpdates;
  end;
  if not dm.qryCtasTramp.Transaction.InTransaction then
  dm.qryCtasTramp.Transaction.StartTransaction;
  try
    dm.qryCtasTramp.Transaction.CommitRetaining;
  except
  dm.qryCtasTramp.Transaction.RollbackRetaining;
  end;
end;

procedure TfrmActCtaTrampAdm.BitBtn8Click(Sender: TObject);
begin
  if Dm.qryCtasTramp.state = dsBrowse then
  Dm.qryCtasTramp.Edit;
end;

procedure TfrmActCtaTrampAdm.BitBtn2Click(Sender: TObject);
begin
  if Dm.qryCtasTramp.state in [dsBrowse,dsInactive] then
  begin
    Dm.qryCtasTramp.close;
    Dm.qryCtasTramp.open;
  end;
end;

procedure TfrmActCtaTrampAdm.BitBtn13Click(Sender: TObject);
begin
  if dtAdm.tClase_cuentas_adm.state = dsBrowse then
  dtAdm.tClase_cuentas_adm.Insert;
  DBEdit3.setfocus;
  DBEdit3.SelectAll;
end;

procedure TfrmActCtaTrampAdm.BitBtn14Click(Sender: TObject);
begin
  if dtAdm.tClase_cuentas_adm.state = dsBrowse then
  dtAdm.tClase_cuentas_adm.Edit;
end;

procedure TfrmActCtaTrampAdm.BitBtn15Click(Sender: TObject);
begin
  if dtAdm.tClase_cuentas_adm.state in [dsEdit,dsInsert] then
  begin
    try
    dtAdm.tClase_cuentas_adm.post;
    if not dtAdm.tClase_cuentas_adm.Transaction.InTransaction then
    dtAdm.tClase_cuentas_adm.Transaction.StartTransaction;
    dtAdm.tClase_cuentas_adm.Transaction.CommitRetaining;
    except
    dtAdm.tClase_cuentas_adm.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmActCtaTrampAdm.BitBtn16Click(Sender: TObject);
begin
  dtAdm.tClase_cuentas_adm.close;
  dtAdm.tClase_cuentas_adm.open;
end;

procedure TfrmActCtaTrampAdm.BitBtn6Click(Sender: TObject);
begin
  if dtAdm.tTipoClase_Ctas_adm.state = dsBrowse then
  dtAdm.tTipoClase_Ctas_adm.Insert;
end;

procedure TfrmActCtaTrampAdm.BitBtn10Click(Sender: TObject);
begin
  if dtAdm.tTipoClase_Ctas_adm.state = dsBrowse then
  dtAdm.tTipoClase_Ctas_adm.Edit;
end;

procedure TfrmActCtaTrampAdm.BitBtn11Click(Sender: TObject);
begin
  if dtAdm.tTipoClase_Ctas_adm.state in [dsEdit,dsInsert] then
  begin
    try
    dtAdm.tTipoClase_Ctas_adm.Post;
    if not dtAdm.tTipoClase_Ctas_adm.Transaction.InTransaction then
    dtAdm.tTipoClase_Ctas_adm.Transaction.StartTransaction;
    dtAdm.tTipoClase_Ctas_adm.Transaction.CommitRetaining;
    except
    dtAdm.tTipoClase_Ctas_adm.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmActCtaTrampAdm.BitBtn12Click(Sender: TObject);
begin
  dtAdm.tTipoClase_Ctas_adm.close;
  dtAdm.tTipoClase_Ctas_adm.open;
end;

procedure TfrmActCtaTrampAdm.BitBtn1Click(Sender: TObject);
begin
  if dtAdm.tClasif_cuentas.state = dsBrowse then
  dtAdm.tClasif_cuentas.Insert;
end;

procedure TfrmActCtaTrampAdm.BitBtn3Click(Sender: TObject);
begin
  if dtAdm.tClasif_cuentas.state = dsBrowse then
  dtAdm.tClasif_cuentas.Edit;
end;

procedure TfrmActCtaTrampAdm.BitBtn4Click(Sender: TObject);
begin
  if dtAdm.tClasif_cuentas.state in [dsEdit,dsInsert] then
  begin
    try
    dtAdm.tClasif_cuentas.Post;
    if not dtAdm.tClasif_cuentas.Transaction.InTransaction then
    dtAdm.tClasif_cuentas.Transaction.StartTransaction;
    dtAdm.tClasif_cuentas.Transaction.CommitRetaining;
    except
    dtAdm.tClasif_cuentas.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmActCtaTrampAdm.BitBtn5Click(Sender: TObject);
begin
  dtAdm.tClasif_cuentas.close;
  dtAdm.tClasif_cuentas.open;
end;

procedure TfrmActCtaTrampAdm.BitBtn20Click(Sender: TObject);
begin
  if Dm.qryCtasTramp.State = dsInsert  then
  begin
    dm.qryCtasTramp.delete;
    dm.qryCtasTramp.ApplyUpdates;
  end;
    if not dm.qryCtasTramp.Transaction.InTransaction then
    dm.qryCtasTramp.Transaction.StartTransaction;
    try
    dm.qryCtasTramp.Transaction.CommitRetaining;
    except
    dm.qryCtasTramp.Transaction.RollbackRetaining;
    end;
end;
procedure TfrmActCtaTrampAdm.BitBtn17Click(Sender: TObject);
begin
  if dtAdm.tClasif_cuentas.State = dsBrowse then
  begin
    dtAdm.tClasif_cuentas.Delete;
    if not dtAdm.tClasif_cuentas.Transaction.InTransaction then
    dtAdm.tClasif_cuentas.Transaction.StartTransaction;
    try
    dtAdm.tClasif_cuentas.Transaction.CommitRetaining;
    except
    dtAdm.tClasif_cuentas.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmActCtaTrampAdm.BitBtn18Click(Sender: TObject);
begin
  if dtAdm.tTipoClase_Ctas_adm.State = dsBrowse then
  begin
    dtAdm.tTipoClase_Ctas_adm.Delete;
  end;
    if not dtAdm.tTipoClase_Ctas_adm.Transaction.InTransaction then
    dtAdm.tTipoClase_Ctas_adm.Transaction.StartTransaction;
    try
    dtAdm.tTipoClase_Ctas_adm.Transaction.CommitRetaining;
    except
    dtAdm.tTipoClase_Ctas_adm.Transaction.RollbackRetaining;
    end;
end;

procedure TfrmActCtaTrampAdm.BitBtn19Click(Sender: TObject);
begin
  if dtAdm.tClase_cuentas_adm.state = dsBrowse then
  begin
    dtAdm.tClase_cuentas_adm.Delete;
    if not dtAdm.tClase_cuentas_adm.Transaction.InTransaction then
    dtAdm.tClase_cuentas_adm.Transaction.StartTransaction;
    try
    dtAdm.tClase_cuentas_adm.Transaction.CommitRetaining;
    except
    dtAdm.tClase_cuentas_adm.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmActCtaTrampAdm.FormCreate(Sender: TObject);
begin
  dtAdm.tDgIIAnexoB.Close;
  dtAdm.tDgIIAnexoB.Open;
  //dtadm.tClaseCostos.close;
  //dtadm.tClaseCostos.open;
end;

procedure TfrmActCtaTrampAdm.BitBtn22Click(Sender: TObject);
begin
//  if not qryConceptos.Locate('codigo',edtBuscar.ValueInteger,[]) then
//  begin
//    MessageDlg('Código no existe',mtInformation,[mbok],0);
//  end;
end;

procedure TfrmActCtaTrampAdm.BitBtn21Click(Sender: TObject);
begin
  //panelConceptos.Visible:=False;
  //panelConceptos.SendToBack;
  //qryConceptos.close;
end;

procedure TfrmActCtaTrampAdm.BitBtn23Click(Sender: TObject);
begin
  //panelConceptos.BringToFront;
  //panelConceptos.Visible:=True;
  //qryConceptos.Close;
  //qryConceptos.open;
end;

procedure TfrmActCtaTrampAdm.BitBtn24Click(Sender: TObject);
begin
{  qckRepConpto:=TqckRepConpto.Create(nil);
  try
    if messageDlg('Imprimir?',mtinformation,[mbyes,mbno],0)= mryes then
    begin
      qckRepConpto.PrinterSetup;
      qckRepConpto.print;
    end else
    qckRepConpto.Preview;
  finally
  qckRepConpto.Free;
  qckRepConpto:=nil;
  end;  }
end;

procedure TfrmActCtaTrampAdm.BitBtn25Click(Sender: TObject);
begin
  if not dtAdm.tClase_cuentas_adm.Locate('codigo',EditN1.ValueInteger,[]) then
  begin
    MessageDlg('Código no existe',mtInformation,[mbok],0);
  end;
end;

end.
