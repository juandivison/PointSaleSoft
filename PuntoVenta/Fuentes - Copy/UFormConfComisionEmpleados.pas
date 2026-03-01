unit UFormConfComisionEmpleados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WinSkinData, StdCtrls, Buttons, Grids, DBGrids, RxDBCtrl, Mask,
  DB, DBCtrls, RxCtrls, RxLookup, IBCustomDataSet, IBTable, IBQuery;

type
  TfrmConfComEmpleado = class(TForm)
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton1: TSpeedButton;
    DBStatusLabel1: TDBStatusLabel;
    RxDBGrid1: TRxDBGrid;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    SkinData1: TSkinData;
    Label1: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    RxDBLookupCombo2: TRxDBLookupCombo;
    Label2: TLabel;
    tblEmpLookup: TIBTable;
    tblEmpLookupCODIGO: TIntegerField;
    tblEmpLookupNOMBRE: TIBStringField;
    tblEmpLookupAPELLIDO: TIBStringField;
    dstblEmpLookup: TDataSource;
    tblConfComisionesLook: TIBTable;
    tblConfComisionesLookCODIGO: TIntegerField;
    tblConfComisionesLookCANT_META: TIntegerField;
    tblConfComisionesLookFECHA_PAGO: TDateTimeField;
    tblConfComisionesLookPORC_COMISION: TFloatField;
    tblConfComisionesLookESDEALEAR: TSmallintField;
    tblConfComisionesLookESOFICINA: TSmallintField;
    tblConfComisionesLookSTATUS: TIBStringField;
    tblConfComisionesLookDESCRIPCION: TIBStringField;
    dstblConfComisionesLook: TDataSource;
    SpeedButton4: TSpeedButton;
    Label3: TLabel;
    RxDBLookupCombo3: TRxDBLookupCombo;
    tblConfComisionesLookIDCATEGORIA: TIntegerField;
    qryInvCategoria: TIBQuery;
    dsqryInvCategoria: TDataSource;
    qryInvCategoriaCODCATEGORIA: TIntegerField;
    qryInvCategoriaDESCRIPCION: TIBStringField;
    chboxFilter: TCheckBox;
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure chboxFilterClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfComEmpleado: TfrmConfComEmpleado;

implementation
  uses UGlobal, UDatmodDatosGenerales, UFormConfComisiones,UDatModConectar;
{$R *.dfm}

procedure TfrmConfComEmpleado.BitBtn10Click(Sender: TObject);
begin
  dmDatos.tblConfComEmp.prior;
end;

procedure TfrmConfComEmpleado.BitBtn11Click(Sender: TObject);
begin
  dmDatos.tblConfComEmp.next;
end;

procedure TfrmConfComEmpleado.BitBtn12Click(Sender: TObject);
begin
  dmDatos.tblConfComEmp.Last;
end;

procedure TfrmConfComEmpleado.BitBtn9Click(Sender: TObject);
begin
  dmDatos.tblConfComEmp.first;
end;

procedure TfrmConfComEmpleado.SpeedButton1Click(Sender: TObject);
var
  bookMark : TBookMark;
begin
  if dmDatos.tblConfComEmp.State in [dsinsert, dsEdit] then
  begin
    GlbSalvarQuery(dmDatos.tblConfComEmp);
    bookMark:= dmDatos.tblConfComEmp.GetBookmark;
    dmDatos.tblConfComEmp.Close;
    dmDatos.tblConfComEmp.Open;
    dmDatos.tblConfComEmp.GotoBookmark(bookMark);
    dmDatos.tblConfComEmp.FreeBookmark(bookMark);
    dmDatos.tblConfComEmp.Refresh;
  end;
end;

procedure TfrmConfComEmpleado.SpeedButton2Click(Sender: TObject);
begin
  if dmDatos.tblConfComEmp.State = dsBrowse then
  begin
    dmDatos.tblConfComEmp.Append;
    if chboxFilter.Checked then
    begin
      dmDatos.tblConfComEmpIDCATEGORIA.Value:= dmdatos.codCatSel;
      RxDBLookupCombo2.SetFocus;
    end else RxDBLookupCombo3.SetFocus;
  end;
end;

procedure TfrmConfComEmpleado.SpeedButton3Click(Sender: TObject);
begin
  if dmDatos.tblConfComEmp.State in [dsinsert, dsEdit] then
  begin
    dmDatos.tblConfComEmp.Cancel;
  end;
end;

procedure TfrmConfComEmpleado.FormCreate(Sender: TObject);
begin
  tblEmpLookup.Close;
  tblEmpLookup.Open;
  tblConfComisionesLook.Close;
  tblConfComisionesLook.Open;
  dmDatos.tblConfComEmp.Close;
  dmDatos.tblConfComEmp.Open;
  if dmDatos.codCatSel > 0 then
  dmDatos.tblConfComEmp.Filtered:=True;
  qryInvCategoria.Close;
  qryInvCategoria.Open;
end;

procedure TfrmConfComEmpleado.SpeedButton4Click(Sender: TObject);
begin
  if dmDatos.tblConfComEmp.State in [dsBrowse] then
  begin
    if MessageDlg('Eliminar record?',mtWarning,[mbYes,mbNo],0) = mryes then
    Begin
      dmDatos.tblConfComEmp.Delete;
      GlbSalvarQuery(dmDatos.tblConfComEmp);
    end;
  end;
end;

procedure TfrmConfComEmpleado.chboxFilterClick(Sender: TObject);
begin
  if not frmConfComEmpleado.chboxFilter.checked then
  begin
    dmDatos.tblConfComEmp.Filtered:=False;
    frmConfComEmpleado.chboxFilter.Color:=clBtnFace;
  end;
end;

procedure TfrmConfComEmpleado.FormShow(Sender: TObject);
begin
  if dmDatos.tblConfComEmp.Filtered then
  begin
    //RxDBGrid1.Color := clMoneyGreen;
  end;
end;

end.
