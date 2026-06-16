unit UEmpleados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DBActns, ActnList, ExtDlgs, Grids, DBGrids, RXDBCtrl,
  DBCtrls, StdCtrls, Mask, RXCtrls, ComCtrls, Buttons, ExtCtrls, DB,
  rxToolEdit, ImgList, RxLookup, WinSkinData;

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
    Label17: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    RxDBLookupCombo1: TRxDBLookupCombo;
    RxDBLookupCombo2: TRxDBLookupCombo;
    RxDBLookupCombo3: TRxDBLookupCombo;
    RxDBLookupCombo4: TRxDBLookupCombo;
    RxDBLookupCombo5: TRxDBLookupCombo;
    SkinData1: TSkinData;
    Label18: TLabel;
    DBEdit16: TDBEdit;
    Label19: TLabel;
    DBEdit17: TDBEdit;
    Image1: TImage;
    RxSpeedButton2: TRxSpeedButton;
    PopupMenuBuscar: TPopupMenu;
    Codigo1: TMenuItem;
    Compaa1: TMenuItem;
    Nombre1: TMenuItem;
    Apellido1: TMenuItem;
    Nomina1: TMenuItem;
    TipoEmpleado1: TMenuItem;
    Departamento1: TMenuItem;
    Seccion1: TMenuItem;
    Status1: TMenuItem;
    Todos1: TMenuItem;
    DBEdit18: TDBEdit;
    Label21: TLabel;
    DBDateEdit2: TDBDateEdit;
    Label22: TLabel;
    RxDBLookupCombo6: TRxDBLookupCombo;
    Label23: TLabel;
    dstblTipoIngEmp: TDataSource;
    procedure btnInsertarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnCerarAbrirresClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnModificarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure RxSpeedButton1Click(Sender: TObject);
    procedure dstblEmpleadosStateChange(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBEdit1Change(Sender: TObject);
    procedure Codigo1Click(Sender: TObject);
    procedure Compaa1Click(Sender: TObject);
    procedure Nombre1Click(Sender: TObject);
    procedure Apellido1Click(Sender: TObject);
    procedure Nomina1Click(Sender: TObject);
    procedure TipoEmpleado1Click(Sender: TObject);
    procedure Status1Click(Sender: TObject);
    procedure Todos1Click(Sender: TObject);
    procedure RxDBLookupCombo5Exit(Sender: TObject);
  private
    procedure ResizeBMP(b: TBitmap; NewWidth, NewHeight: integer);
    { Private declarations }
  public
    { Public declarations }
    procedure FiltrarEmpleado(strCampo: string;strcriterio:string);
  end;

var
  frmEmpleados: TfrmEmpleados;

implementation

uses UDatModEmpleados, UClasificacionN, UDatModNomina, uglobal;

{$R *.dfm}

procedure TfrmEmpleados.btnInsertarClick(Sender: TObject);
begin
  if dmEmpleados.tblEmpleados.State in [dsBrowse] then
  begin
    dmEmpleados.tblEmpleados.Insert;
    dmEmpleados.tblEmpleadosFECHA_IN.Value:=now;
    dmEmpleados.tblEmpleadosCODIGO_CIA.Value:=1;
    dmEmpleados.tblEmpleadosSTATUS.Value    :='A';
    dmEmpleados.tblEmpleadosTIPO_ING.Value  :=1;//Normal
    DBEdit2.SetFocus;
    DBEdit2.SelectAll;
  end;
end;

procedure TfrmEmpleados.btnSalvarClick(Sender: TObject);
begin
  if dmEmpleados.tblEmpleados.State in [dsEdit,dsInsert] then
  begin
    GlbSalvarQuery(dmEmpleados.tblEmpleados);
    if dmEmpleados.tblEmpleados.State in [dsEdit] then
    begin
      
    end;
  end;
end;

procedure TfrmEmpleados.BitBtn1Click(Sender: TObject);
//var
//  Jpgf : TJPEGImage;
begin
//92x97
  if OpenPictureDialog1.Execute then
  begin
    if dmEmpleados.tblEmpleados.State = dsBrowse then
    dmEmpleados.tblEmpleados.Edit;
    dmEmpleados.tblEmpleadosPATH_FOTO_EMP.Value:=OpenPictureDialog1.FileName;
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

procedure TfrmEmpleados.SpeedButton3Click(Sender: TObject);
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

procedure TfrmEmpleados.SpeedButton2Click(Sender: TObject);
begin
  frmClasifNomina:=TfrmClasifNomina.Create(nil);
  try
    frmClasifNomina.PageControl1.ActivePage:= frmClasifNomina.tabSeccion;
    frmClasifNomina.ShowModal;
  finally
  frmClasifNomina.Free;
  frmClasifNomina:=Nil;
  end;
end;

procedure TfrmEmpleados.SpeedButton1Click(Sender: TObject);
begin
  frmClasifNomina:=TfrmClasifNomina.Create(nil);
  try
    frmClasifNomina.PageControl1.ActivePage:= frmClasifNomina.tabSeccion;
    frmClasifNomina.ShowModal;
  finally
  frmClasifNomina.Free;
  frmClasifNomina:=Nil;
  end;
end;

procedure TfrmEmpleados.ResizeBMP(b : TBitmap; NewWidth, NewHeight : integer);
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

procedure TfrmEmpleados.DBEdit1Change(Sender: TObject);
begin
  if not dmEmpleados.tblEmpleadosPATH_FOTO_EMP.IsNull then
  begin
    if FileExists(dmEmpleados.tblEmpleadosPATH_FOTO_EMP.Value) then
    begin
      Image1.BringToFront;
      Image1.Picture.LoadFromFile(dmEmpleados.tblEmpleadosPATH_FOTO_EMP.Value);
    end;
  end;
end;

procedure TfrmEmpleados.Codigo1Click(Sender: TObject);
var strFiltro : String;
begin
  strFiltro:=InputBox('Buscar por empleado','Entre código empleado','');
  if not dmEmpleados.tblEmpleados.Locate('Codigo',StrToInt(strFiltro),[]) then
  MessageDlg('Codigo "'+strFiltro+'", no existe.',mtinformation,[mbok],0);
end;

procedure TfrmEmpleados.FiltrarEmpleado(strCampo: string;strcriterio:string);
var
  strFiltro:String;
begin
  strFiltro:=InputBox('Filtrar Datos Empleados','Entre valor para '+strcriterio,'');
  dmEmpleados.tblEmpleados.Filtered  := False;
  dmEmpleados.strFilterField:= StrCampo;
  dmEmpleados.ValuetoFilter          := StrFiltro;
  dmEmpleados.tblEmpleados.Filtered  := True;
end;

procedure TfrmEmpleados.Compaa1Click(Sender: TObject);
begin
  if Compaa1.Checked then
  begin
    dmEmpleados.tblEmpleados.Filtered:=False;
    Compaa1.Checked:=False;
    exit;
  end else
  FiltrarEmpleado('CODIGO_CIA',' por codigo compañia.');
  Compaa1.Checked :=True;
end;

procedure TfrmEmpleados.Nombre1Click(Sender: TObject);
begin
  if Nombre1.Checked then
  begin
    dmEmpleados.tblEmpleados.Filtered:=False;
    Nombre1.Checked:=False;
    exit;
  end else
  FiltrarEmpleado('nombre',' por nombre empleado.');
  Nombre1.Checked :=True;
end;

procedure TfrmEmpleados.Apellido1Click(Sender: TObject);
begin
  if Nombre1.Checked then
  begin
    dmEmpleados.tblEmpleados.Filtered:=False;
    Apellido1.Checked:=False;
    exit;
  end else
  FiltrarEmpleado('apellido',' por apellido empleado.');
  Apellido1.Checked :=True;
end;

procedure TfrmEmpleados.Nomina1Click(Sender: TObject);
begin
  if Nombre1.Checked then
  begin
    dmEmpleados.tblEmpleados.Filtered:=False;
    Nomina1.Checked:=False;
    exit;
  end else
  FiltrarEmpleado('TIPO_NOMINA',' por tipo Nómina.');
  Nomina1.Checked :=True;
end;

procedure TfrmEmpleados.TipoEmpleado1Click(Sender: TObject);
begin
  if TipoEmpleado1.Checked then
  begin
    dmEmpleados.tblEmpleados.Filtered:=False;
    TipoEmpleado1.Checked:=False;
    Exit;
  end else
  FiltrarEmpleado('TIPO_EMPLEADO',' por tipo empleado.');
  TipoEmpleado1.Checked :=True;
end;

procedure TfrmEmpleados.Status1Click(Sender: TObject);
begin
  if Status1.Checked then
  begin
    dmEmpleados.tblEmpleados.Filtered:=False;
    Status1.Checked:=False;
    Exit;
  end else
  FiltrarEmpleado('STATUS',' por estatus empleado.');
  Status1.Checked :=True;
end;

procedure TfrmEmpleados.Todos1Click(Sender: TObject);
begin
  dmEmpleados.tblEmpleados.Filtered:=False;
end;


procedure TfrmEmpleados.RxDBLookupCombo5Exit(Sender: TObject);
begin
  if dmEmpleados.tblEmpleados.state in [dsBrowse, dsInactive] then exit;
  if dmEmpleados.tblEmpleadosTIPO_EMPLEADO.Value = 2 then
  dmEmpleados.tblEmpleadosTIPO_ING.Value:=2;
end;

end.
