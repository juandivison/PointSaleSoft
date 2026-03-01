unit UPrestamoEmpleados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ImgList, DBActns, ActnList, StdCtrls, Buttons, RXCtrls,
  RXDBCtrl, ComCtrls, Grids, DBGrids, DBCtrls, rxToolEdit, Mask, Menus,
  ExtCtrls, WinSkinData, RxLookup;

type
  TfrmPrestamos = class(TForm)
    ActionList1: TActionList;
    DataSetFirst1: TDataSetFirst;
    DataSetPrior1: TDataSetPrior;
    DataSetNext1: TDataSetNext;
    DataSetLast1: TDataSetLast;
    ImageList1: TImageList;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBStatusLabel3: TDBStatusLabel;
    btnNuevo: TBitBtn;
    btnModificar: TBitBtn;
    btnCancelar: TBitBtn;
    btnRefrescar: TBitBtn;
    BitBtn12: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn1: TBitBtn;
    TabSheet2: TTabSheet;
    DBGrid1: TDBGrid;
    dstblPrestamo: TDataSource;
    Label3: TLabel;
    DBDateEdit1: TDBDateEdit;
    Label4: TLabel;
    Label5: TLabel;
    ComboBox1: TComboBox;
    Label6: TLabel;
    DBEdit3: TDBEdit;
    Label7: TLabel;
    DBEdit4: TDBEdit;
    Label10: TLabel;
    DBEdit6: TDBEdit;
    DBGrid2: TDBGrid;
    dstblTipoPrestamo: TDataSource;
    dstblQryEmpleados: TDataSource;
    PopupMenu1: TPopupMenu;
    VerListadoEmpleados1: TMenuItem;
    Shape1: TShape;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    DBLookupComboBox3: TDBLookupComboBox;
    Label12: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    Edit2: TEdit;
    Label13: TLabel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    BitBtn5: TBitBtn;
    SkinData1: TSkinData;
    RxDBLookupCombo1: TRxDBLookupCombo;
    procedure btnNuevoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure btnRefrescarClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure VerListadoEmpleados1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure dstblPrestamoDataChange(Sender: TObject; Field: TField);
    procedure Edit2Change(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure DBLookupComboBox3Click(Sender: TObject);
    procedure btnModificarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrestamos: TfrmPrestamos;

implementation

uses UDatModPrestamo, UGlobal, USeleccionaEmpleadoPrestamo,
  UDatModEmpleados;

{$R *.dfm}

procedure TfrmPrestamos.btnNuevoClick(Sender: TObject);
begin
  if dmPrestamo.tblPrestamo.State In [dsBrowse] then
  begin
    dmPrestamo.tblPrestamo.Insert;
    dmPrestamo.tblPrestamoSTATUS.Value     := 'A';
    //dmPrestamo.tblPrestamoCODIGO_EMP.Value := dmprestamo.qryEmpleadoCODIGO.Value;
    dmPrestamo.tblPrestamoFECHA.Value      := ExtraerFecha(GlbFechaTrnDiaria);
    dmPrestamo.tblPrestamoIN_POR.Value     := StrUserName;
    dmPrestamo.tblPrestamoFECHA_IN.Value   := Now;
    dmPrestamo.tblPrestamoRUTA.Value       := 0; 
    DBLookupComboBox3.SetFocus;
  end;
end;

procedure TfrmPrestamos.btnCancelarClick(Sender: TObject);
begin
  if dmPrestamo.tblPrestamo.State In [dsInsert, dsEdit] then
  dmPrestamo.tblPrestamo.Cancel else
  begin
    if MessageDlg('Cancelar record?', mtInformation, [mbYes, mbNo], 0) = mrYes then
    begin
      dmPrestamo.tblPrestamo.Edit;
      dmPrestamo.tblPrestamoSTATUS.Value:= 'C';
      GlbSalvarQuery(dmPrestamo.tblPrestamo);
    end;
  end;
end;

procedure TfrmPrestamos.BitBtn4Click(Sender: TObject);
begin
  if dmPrestamo.tblPrestamo.State in [dsEdit, dsInsert] then
  begin
    if dmPrestamo.tblPrestamoRuta.IsNull then
    dmPrestamo.tblPrestamoRuta.Value := 0;
    if dmPrestamo.tblPrestamoCODIGO_EMP.IsNull then
    begin
      MessageDlg('Faor indique codigo empleado.', mtInformation, [mbOK], 0);
      Exit;
    end;
   { if dmPrestamo.tblPrestamoruta.IsNull then
    begin
      MessageDlg('Falta número de ruta, verifique',mtInformation, [mbOK], 0);
      dbedit2.SetFocus;
      Exit;
    end;}
    GlbSalvarQuery(dmPrestamo.tblPrestamo);
  end;
end;

procedure TfrmPrestamos.btnRefrescarClick(Sender: TObject);
begin
  if dmPrestamo.tblPrestamo.State in [dsBrowse, dsInactive] then
  begin
    dmPrestamo.tblPrestamo.Close;
    dmPrestamo.tblPrestamo.Open;
  end;
end;

procedure TfrmPrestamos.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (dmPrestamo.tblPrestamo.State In [dsEdit, dsInsert]) or
     (dmPrestamo.tblPrestamo.UpdatesPending ) then
  begin
    MessageDlg('Hay una transacción pendiente, verifique',mtInformation, [mbOK], 0);
    CanClose:=False;
  end else CanClose:=True;
end;

procedure TfrmPrestamos.FormCreate(Sender: TObject);
begin
  dmPrestamo.tblTipoPrestamo.Close;
  dmPrestamo.tblTipoPrestamo.Open;
  dmPrestamo.qryEmpleado.Close;
  dmPrestamo.qryEmpleado.Open;
  btnRefrescarClick(Self);
end;

procedure TfrmPrestamos.VerListadoEmpleados1Click(Sender: TObject);
begin
  frmSelEmpParaPrestamo:=TfrmSelEmpParaPrestamo.Create(nil);
  try
    if frmSelEmpParaPrestamo.showmodal = mrOk then
    begin
      btnNuevoClick(Self);
    end;
  finally
  frmSelEmpParaPrestamo.Free;
  frmSelEmpParaPrestamo:=Nil;
  end;
end;

procedure TfrmPrestamos.BitBtn3Click(Sender: TObject);
begin
  if Not dmPrestamo.tblPrestamo.Locate('CODIGO_EMP',Edit2.Text,[]) then
  MessageDlg('Codigo no encontrado en archivo de prestamo, verifique',mtInformation, [mbOK], 0);
end;

procedure TfrmPrestamos.ComboBox1Change(Sender: TObject);
begin
  if dmPrestamo.tblPrestamo.State in [dsEdit, dsInsert] then
  dmPrestamo.tblPrestamoCUOTAS.Value:=StrToInt(combobox1.Text);
end;

procedure TfrmPrestamos.Edit1Change(Sender: TObject);
begin
  if dmPrestamo.qryEmpleado.Locate('CEDULA',Edit2.Text,[loCaseInsensitive, loPartialKey]) then
  begin
    DBText1.Visible:= True;
    DBText2.Visible:= True;
    DBText3.Visible:= True;
  end else
  begin
    DBText1.Visible:= False;
    DBText2.Visible:= False;
    DBText3.Visible:= False;
  end;
end;

procedure TfrmPrestamos.dstblPrestamoDataChange(Sender: TObject;
  Field: TField);
begin
  if not dmPrestamo.tblPrestamoCUOTAS.IsNull then
  combobox1.Text:= dmPrestamo.tblPrestamoCUOTAS.AsString;
end;

procedure TfrmPrestamos.Edit2Change(Sender: TObject);
begin
  if dmPrestamo.qryEmpleado.Locate('Codigo_emp',Edit2.Text,[loCaseInsensitive, loPartialKey]) then
  begin
    DBText1.Visible:= True;
    DBText2.Visible:= True;
    DBText3.Visible:= True;
  end else
  begin
    DBText1.Visible:= False;
    DBText2.Visible:= False;
    DBText3.Visible:= False;
  end;
end;

procedure TfrmPrestamos.BitBtn5Click(Sender: TObject);
begin
  if dmPrestamo.tblPrestamo.State In [dsBrowse] then
  begin
    if (dmPrestamo.tblPrestamo.RecordCount > 0) then
    begin
      if (dmPrestamo.tblPrestamoMONTO_PAGADO.Value > 0) then
      begin
        MessageDlg('Prestamo ya tiene cobros realizados, verifique.', mtError, [mbOk], 0);
        exit;
      end;
      if MessageDlg('Eliminar record?', mtInformation, [mbYes, mbNo], 0) = mrYes then
      begin
        dmPrestamo.tblPrestamo.Delete;
        GlbSalvarQuery(dmPrestamo.tblPrestamo);
      end;
    end;
  end;
end;

procedure TfrmPrestamos.DBLookupComboBox3Click(Sender: TObject);
begin
{  DBText1.Visible:=True;
  DBText2.Visible:=True;
  DBText3.Visible:=True;}
end;

procedure TfrmPrestamos.btnModificarClick(Sender: TObject);
begin
  if dmPrestamo.tblPrestamo.State In [dsBrowse] then
  dmPrestamo.tblPrestamo.Edit;
end;

end.
