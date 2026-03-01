unit UEmpleados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DBActns, ActnList, ExtDlgs, Grids, DBGrids, RXDBCtrl,
  DBCtrls, StdCtrls, Mask, RXCtrls, ComCtrls, Buttons, ExtCtrls, DB,
  RXToolEdit, ImgList;

type
  TfrmEmpleados = class(TForm)
    Panel1: TPanel;
    RxSpeedButton1: TRxSpeedButton;
    btnInsertar: TBitBtn;
    btnModificar: TBitBtn;
    btnSalvar: TBitBtn;
    btnCancelar: TBitBtn;
    btnCerarAbrirres: TBitBtn;
    BitBtn2: TBitBtn;
    PageControl1: TPageControl;
    tabEmpleados: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    DBStatusLabel2: TDBStatusLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label20: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBImage1: TDBImage;
    BitBtn1: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    tabExaminar: TTabSheet;
    RxDBGrid1: TRxDBGrid;
    PopupMenu1: TPopupMenu;
    OpenPictureDialog1: TOpenPictureDialog;
    ActionList1: TActionList;
    DataSetFirst1: TDataSetFirst;
    DataSetPrior1: TDataSetPrior;
    DataSetNext1: TDataSetNext;
    DataSetLast1: TDataSetLast;
    dstblEmpleados: TDataSource;
    DBDateEdit1: TDBDateEdit;
    ImageList1: TImageList;
    DBEdit4: TDBEdit;
    Label4: TLabel;
    DBEdit6: TDBEdit;
    DBEdit12: TDBEdit;
    Label16: TLabel;
    GroupBox1: TGroupBox;
    DBCheckBox1: TDBCheckBox;
    DBRadioGroup1: TDBRadioGroup;
    DBEdit16: TDBEdit;
    Label17: TLabel;
    procedure btnInsertarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnCerarAbrirresClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnModificarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure RxSpeedButton1Click(Sender: TObject);
    procedure dstblEmpleadosStateChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEmpleados: TfrmEmpleados;

implementation

uses UDatModEmpleados;

{$R *.dfm}

procedure TfrmEmpleados.btnInsertarClick(Sender: TObject);
begin
  if dmEmpleados.tblEmpleados.State in [dsBrowse] then
  begin
    dmEmpleados.tblEmpleados.Insert;
    dmEmpleados.tblEmpleadosFECHA_IN.Value:=now;
    dmEmpleados.tblEmpleadosCODIGO_CIA.Value:=1;
    dmEmpleados.tblEmpleadosSTATUS.Value    :='A';
    DBEdit2.SetFocus;
    DBEdit2.SelectAll;
  end;
end;

procedure TfrmEmpleados.btnSalvarClick(Sender: TObject);
begin
  if dmEmpleados.tblEmpleados.State in [dsEdit,dsInsert] then
  begin
    dmEmpleados.tblEmpleados.Post;
    dmEmpleados.tblEmpleados.ApplyUpdates;
    if Not dmEmpleados.tblEmpleados.Transaction.InTransaction then
    dmEmpleados.tblEmpleados.Transaction.StartTransaction;
    try
      dmEmpleados.tblEmpleados.Transaction.CommitRetaining;
    except
    dmEmpleados.tblEmpleados.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmEmpleados.BitBtn1Click(Sender: TObject);
begin
  if OpenPictureDialog1.Execute then
  begin
    if dmEmpleados.tblEmpleados.State = dsBrowse then
    dmEmpleados.tblEmpleados.Edit;
    dmEmpleados.tblEmpleadosFOTO.LoadFromFile(OpenPictureDialog1.FileName);
  end;
end;

procedure TfrmEmpleados.btnCerarAbrirresClick(Sender: TObject);
begin
  dmEmpleados.tblEmpleados.Close;
  dmEmpleados.tblEmpleados.Open;
end;

procedure TfrmEmpleados.FormCreate(Sender: TObject);
begin
  dmEmpleados.tblEmpleados.Close;
  dmEmpleados.tblEmpleados.Open;
end;

procedure TfrmEmpleados.btnModificarClick(Sender: TObject);
begin
  if dmEmpleados.tblEmpleados.State in [dsBrowse] then
  dmEmpleados.tblEmpleados.Edit;
end;

procedure TfrmEmpleados.btnCancelarClick(Sender: TObject);
begin
  if dmEmpleados.tblEmpleados.State in [dsInsert, dsEdit] then
  begin
     dmEmpleados.tblEmpleados.Cancel;
  end else
  if dmEmpleados.tblEmpleados.State in [dsBrowse] then
  begin
    if MessageDlg('Borrar Record?',mtWarning, [mbyes,mbno], 0)=mryes then
    begin
      dmEmpleados.tblEmpleados.Delete;
      dmEmpleados.tblEmpleados.ApplyUpdates;
      if Not dmEmpleados.tblEmpleados.Transaction.InTransaction then
      dmEmpleados.tblEmpleados.Transaction.StartTransaction;
      try
        dmEmpleados.tblEmpleados.Transaction.CommitRetaining;
      except
      dmEmpleados.tblEmpleados.Transaction.RollbackRetaining;
      end;
    end;
  end;
end;

procedure TfrmEmpleados.RxSpeedButton1Click(Sender: TObject);
begin
  MessageDlg('Opcion en construccion',mtInformation, [mbOK], 0);
end;

procedure TfrmEmpleados.dstblEmpleadosStateChange(Sender: TObject);
begin
  if dmEmpleados.tblEmpleados.State in [dsBrowse] then
  btnCancelar.Caption:='&Borrar'
  else btnCancelar.Caption:='&Cancelar';
end;

end.
