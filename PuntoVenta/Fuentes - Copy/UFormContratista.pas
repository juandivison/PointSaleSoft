unit UFormContratista;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DBActns, ActnList, ExtDlgs, Grids, DBGrids, RXDBCtrl,
  DBCtrls, StdCtrls, Mask, RXCtrls, ComCtrls, Buttons, ExtCtrls, DB,
  rxToolEdit, ImgList, RxLookup, WinSkinData;

type
  TfrmContratistas = class(TForm)
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
    dstblContratistas: TDataSource;
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
    Label17: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    SpeedButton3: TSpeedButton;
    RxDBLookupCombo3: TRxDBLookupCombo;
    RxDBLookupCombo4: TRxDBLookupCombo;
    RxDBLookupCombo5: TRxDBLookupCombo;
    SkinData1: TSkinData;
    DBCheckBox2: TDBCheckBox;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label18: TLabel;
    procedure btnInsertarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnCerarAbrirresClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnModificarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure RxSpeedButton1Click(Sender: TObject);
    procedure dstblContratistasStateChange(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    procedure ResizeBMP(b: TBitmap; NewWidth, NewHeight: integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmContratistas: TfrmContratistas;

implementation

uses UDatModEmpleados, UClasificacionN, UDatModNomina, uglobal;

{$R *.dfm}

procedure TfrmContratistas.btnInsertarClick(Sender: TObject);
begin
  if dmNomina.tblContratistas.State in [dsBrowse] then
  begin
    dmNomina.tblContratistas.Insert;
    dmNomina.tblContratistasPAGA_AFP.Value:= 0;
    dmNomina.tblContratistasPAGA_TSS.Value:= 0;
    dmNomina.tblContratistasPAGA_RETENCION.Value:= 1;
    dmNomina.tblContratistasPAIS.Value:='REPUBLICA DOMINICANA';
    dmNomina.tblContratistasCIUDAD.Value:='SANTO DOMINGO';
    dmNomina.tblContratistasIN_POR.Value:=StrUserName;
    dmNomina.tblContratistasFECHA_IN.Value:= Now;
    dmNomina.tblContratistasCIA_KEY.Value:= GlbCodigoCia;
    dmNomina.tblContratistasSTATUS.Value    :='A';
    DBEdit2.SetFocus;
    DBEdit2.SelectAll;
  end;
end;

procedure TfrmContratistas.btnSalvarClick(Sender: TObject);
begin
  if dmNomina.tblContratistas.State in [dsEdit,dsInsert] then
  begin
    dmNomina.tblContratistasCODIGO.Value := FsqlMaxNumero('CONTRATISTAS','codigo');
    IF dmNomina.tblContratistasCODIGO.IsNull OR
    (dmNomina.tblContratistasCODIGO.Value = 0 ) THEN
    dmNomina.tblContratistasCODIGO.Value:=1;
    GlbSalvarQuery(dmNomina.tblContratistas);
  end;
end;

procedure TfrmContratistas.BitBtn1Click(Sender: TObject);
//var
//  Jpgf : TJPEGImage;
begin
//92x97
  if OpenPictureDialog1.Execute then
  begin
    if dmNomina.tblContratistas.State = dsBrowse then
    dmNomina.tblContratistas.Edit;

    {Jpgf := TJPEGImage.Create;
    Bmp := TBitmap.Create;
    Jpgf.LoadFromFile(OpenPictureDialog1.FileName);
    // Copy JPEG to bitmap:
    Bmp.Width := Jpgf.Width;
    Bmp.Height := Jpgf.Height;
    Bmp.Canvas.Draw(0,0,Jpgf);
    // Resize Bitmap
    ResizeBMP(Bmp,[newsizeW],[newsizeh]);
    // Copy BMP back to JPG
    Jpgf.Assign(Bmp);
    Jpgf.Free;
    Bmp.Free; }

    dmNomina.tblContratistasFOTO.LoadFromFile(OpenPictureDialog1.FileName);
  end;
end;

procedure TfrmContratistas.btnCerarAbrirresClick(Sender: TObject);
begin
  dmNomina.qryProyectos.Close;
  dmNomina.qryProyectos.Open;
  dmNomina.tblContratistas.Close;
  dmNomina.tblContratistas.Open;
end;

procedure TfrmContratistas.FormCreate(Sender: TObject);
begin
  dmNomina.qryProyectos.Close;
  dmNomina.qryProyectos.Open;
  dmNomina.tblContratistas.Close;
  dmNomina.tblContratistas.Open;
  dmnomina.tDeptosEmp.Close;
  dmnomina.tDeptosEmp.Open;
  dmnomina.tCargosEmp.Close;
  dmnomina.tCargosEmp.Open;
  dmnomina.tDeptoSeccion.Close;
  dmnomina.tDeptoSeccion.Open;
  //dmnom.qryPersonal.Close;
  //dmnom.qryPersonal.Filtered:=False;
  //dmnom.qrypersonal.Sql.clear;
  //dmnom.qrypersonal.Sql.Add('SELECT * FROM EMPLEADOS Empleados order by CODIGO');
  //if not dmnom.qrypersonal.Prepared then
  //dmnom.qrypersonal.Prepare;
  //dmnom.qryPersonal.Open;
  //dm.tCompania.Open;
  dmnomina.QryDepto.Close;
  dmnomina.QryDepto.Open;
  dmnomina.tDepartamentos.Open;
  dmnomina.QryTipoNom.Close;
  dmnomina.QryTipoNom.Open;
  dmnomina.QryTipoEmp.Close;
  dmnomina.QryTipoEmp.Open;
  //dm.QryclasifCta.Close;
  //dm.QryclasifCta.Open;
  //DmNom.tsub_tipo_cta.close;
  //DmNom.tsub_tipo_cta.open;
end;

procedure TfrmContratistas.btnModificarClick(Sender: TObject);
begin
  if dmNomina.tblContratistas.State in [dsBrowse] then
  dmNomina.tblContratistas.Edit;
end;

procedure TfrmContratistas.btnCancelarClick(Sender: TObject);
begin
  if dmNomina.tblContratistas.State in [dsInsert, dsEdit] then
  begin
     dmNomina.tblContratistas.Cancel;
  end else
  if dmNomina.tblContratistas.State in [dsBrowse] then
  begin
    if MessageDlg('Borrar Record?',mtWarning, [mbyes,mbno], 0)=mryes then
    begin
      dmNomina.tblContratistas.Delete;
      dmNomina.tblContratistas.ApplyUpdates;
      if Not dmNomina.tblContratistas.Transaction.InTransaction then
      dmNomina.tblContratistas.Transaction.StartTransaction;
      try
        dmNomina.tblContratistas.Transaction.CommitRetaining;
      except
      dmNomina.tblContratistas.Transaction.RollbackRetaining;
      end;
    end;
  end;
end;

procedure TfrmContratistas.RxSpeedButton1Click(Sender: TObject);
begin
  MessageDlg('Opcion en construccion',mtInformation, [mbOK], 0);
end;

procedure TfrmContratistas.dstblContratistasStateChange(Sender: TObject);
begin
  if dmNomina.tblContratistas.State in [dsBrowse] then
  btnCancelar.Caption:='&Borrar'
  else btnCancelar.Caption:='&Cancelar';
end;

procedure TfrmContratistas.SpeedButton3Click(Sender: TObject);
begin
  frmClasifNomina:=TfrmClasifNomina.Create(nil);
  try
    frmClasifNomina.PageControl1.ActivePage:= frmClasifNomina.tabCargos; 
    frmClasifNomina.ShowModal;
  finally
  frmClasifNomina.Free;
  frmClasifNomina:=Nil;
  end;
end;

procedure TfrmContratistas.ResizeBMP(b : TBitmap; NewWidth, NewHeight : integer);
var
tbmp : TBitmap;
begin
  tbmp := TBitmap.Create;
  tbmp.Width := b.Width;
  tbmp.Height := b.Height;
  BitBlt(tbmp.Canvas.Handle,0,0,tbmp.Width,tbmp.Height,
  b.Canvas.Handle,0,0,SRCCOPY);
  b.Width := NewWidth;
  b.Height := NewHeight;
  StretchBlt(b.Canvas.Handle,0,0,b.Width,b.Height,tbmp.Canvas.Handle,
  0,0,tbmp.Width,tbmp.Height,SRCCOPY);
  tbmp.Free;
end;

end.
