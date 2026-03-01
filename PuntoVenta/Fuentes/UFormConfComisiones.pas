unit UFormConfComisiones;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, WinSkinData, StdCtrls, Buttons, Grids,
  DBGrids, RxDBCtrl, Mask, DBCtrls, RxCtrls, ExtCtrls, RxToolEdit, IBTable,
  RxLookup, Menus;

type
  TfrmConfComisiones = class(TForm)
    tblConfComisiones: TIBDataSet;
    Label2: TLabel;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton1: TSpeedButton;
    DBStatusLabel1: TDBStatusLabel;
    DBEdit2: TDBEdit;
    RxDBGrid1: TRxDBGrid;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    SkinData1: TSkinData;
    dstblConfComisiones: TDataSource;
    tblConfComisionesCODIGO: TIntegerField;
    tblConfComisionesCANT_META: TIntegerField;
    tblConfComisionesFECHA_PAGO: TDateTimeField;
    tblConfComisionesPORC_COMISION: TFloatField;
    tblConfComisionesESDEALEAR: TSmallintField;
    tblConfComisionesESOFICINA: TSmallintField;
    tblConfComisionesSTATUS: TIBStringField;
    tblConfComisionesFECHA_IN: TDateTimeField;
    tblConfComisionesIN_POR: TIBStringField;
    tblConfComisionesFECHA_MOD: TDateTimeField;
    tblConfComisionesMOD_POR: TIBStringField;
    Label1: TLabel;
    DBDateEdit1: TDBDateEdit;
    DBRadioGroup1: TDBRadioGroup;
    DBRadioGroup2: TDBRadioGroup;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    tblConfComisionesDESCRIPCION: TIBStringField;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    tblConfComisionesCANT_META_FIN: TIntegerField;
    tblConfComisionesPORC_COM_EXTRA: TFloatField;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    tblConfComisionesIDCATEGORIA: TIntegerField;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label7: TLabel;
    RxSpeedButton1: TRxSpeedButton;
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure RxSpeedButton1Click(Sender: TObject);
    procedure tblConfComisionesFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfComisiones: TfrmConfComisiones;

implementation
uses UDatModInventario, uglobal,registry, UDatModConectar, UFormConfComisionEmpleados,
  UFormFiltrarCatInv, UDatmodDatosGenerales;

{$R *.dfm}

procedure TfrmConfComisiones.BitBtn10Click(Sender: TObject);
begin
  tblConfComisiones.prior;
end;

procedure TfrmConfComisiones.BitBtn11Click(Sender: TObject);
begin
  tblConfComisiones.next;
end;

procedure TfrmConfComisiones.BitBtn12Click(Sender: TObject);
begin
  tblConfComisiones.Last;
end;

procedure TfrmConfComisiones.BitBtn9Click(Sender: TObject);
begin
  tblConfComisiones.first;
end;

procedure TfrmConfComisiones.SpeedButton1Click(Sender: TObject);
begin
  if tblConfComisiones.State in [dsinsert, dsEdit] then
  begin
    if tblConfComisiones.State in [dsInsert] then
    tblConfComisionesCodigo.Value:= FsqlMaxNumero('conf_comision','codigo');

    if tblConfComisiones.State in [dsEdit] then
    begin
      tblConfComisionesFECHA_MOD.Value := now;
      tblConfComisionesMOD_POR.Value   := StrUserName;
    end;

    GlbSalvarQuery(tblConfComisiones);
  end;
end;

procedure TfrmConfComisiones.SpeedButton2Click(Sender: TObject);
 begin
  if tblConfComisiones.State = dsBrowse then
  begin
    tblConfComisiones.Insert;
    tblConfComisionesSTATUS.Value:='A';
    tblConfComisionesFECHA_IN.Value:=now;
    tblConfComisionesFECHA_PAGO.Value := GlbUltimoDiaMes(now);
    tblConfComisionesIN_POR.Value:=StrUserName;
    DBEdit2.SetFocus;
  end;
end;

procedure TfrmConfComisiones.SpeedButton3Click(Sender: TObject);
var
  sFilter:boolean;
begin
  sFilter:=tblConfComisiones.Filtered;
  if tblConfComisiones.State in [dsinsert, dsEdit] then
  begin
    tblConfComisiones.Cancel;
  end else
  begin
    if MessageDlg('Desea eliminar record?', mtWarning,[mbYes, mbNo],0) = mryes then
    begin
      tblConfComisiones.Delete;
      GlbSalvarQuery(tblConfComisiones);
    end;
  end;
  tblConfComisiones.Filtered:=False;  
  tblConfComisiones.Filtered:=sFilter;
end;

procedure TfrmConfComisiones.FormCreate(Sender: TObject);
begin
  tblConfComisiones.Close;
  tblConfComisiones.Open;
  dmInventario.tblInvCategoria.Close;
  dmInventario.tblInvCategoria.Open;
end;

procedure TfrmConfComisiones.BitBtn1Click(Sender: TObject);
begin
  if tblConfComisiones.State = dsBrowse then
  begin
    tblConfComisiones.Close;
    tblConfComisiones.Open;
    dmInventario.tblInvCategoria.Close;
    dmInventario.tblInvCategoria.Open;
  end;
end;

procedure TfrmConfComisiones.BitBtn2Click(Sender: TObject);
begin
  dmDatos.codCatSel:=tblConfComisionesIDCATEGORIA.Value;
  dmDatos.tblConfComEmp.Filtered:=False;
  frmConfComEmpleado:=TfrmConfComEmpleado.Create(Nil);
  try
    dmDatos.tblConfComEmp.Filtered:=True;
    frmConfComEmpleado.chboxFilter.Caption:='Filtrado';
    frmConfComEmpleado.chboxFilter.Color:=clMoneyGreen;
    frmConfComEmpleado.chboxFilter.checked:=true;
    frmConfComEmpleado.Showmodal;
  finally
  frmConfComEmpleado.free;
  frmConfComEmpleado:=Nil;
  end;
end;

procedure TfrmConfComisiones.RxSpeedButton1Click(Sender: TObject);
begin
  if RxSpeedButton1.Flat then
  begin
    RxSpeedButton1.Flat:=False;
    RxSpeedButton1.Hint:= 'Click para filtrar';
    tblConfComisiones.Filtered:=False;
    RxSpeedButton1.GrayedInactive:=False;
    RxSpeedButton1.Down:=False;
  end else
  begin
  frmFiltrarCategoriaInv:=TfrmFiltrarCategoriaInv.Create(Nil);
  try
    if frmFiltrarCategoriaInv.ShowModal = mrOk then
    begin
          RxSpeedButton1.Hint:= 'Click para quitar filtro';
      tblConfComisiones.Filtered:=True;
      RxSpeedButton1.GrayedInactive:=True;
      RxSpeedButton1.Flat:=True;
      RxSpeedButton1.Down:=True;
    end else
    begin
      tblConfComisiones.Filtered:=False;
      RxSpeedButton1.Flat:=False;
      RxSpeedButton1.Hint:= 'Click para filtrar';
      tblConfComisiones.Filtered:=False;
      RxSpeedButton1.GrayedInactive:=False;
      RxSpeedButton1.Down:=False;
    end;
  finally
  frmFiltrarCategoriaInv.free;
  frmFiltrarCategoriaInv:=nil;
  end;
  end;
end;

procedure TfrmConfComisiones.tblConfComisionesFilterRecord(
  DataSet: TDataSet; var Accept: Boolean);
begin
  if assigned(frmFiltrarCategoriaInv) then
  Accept:= DataSet['IDCATEGORIA'] = frmFiltrarCategoriaInv.codCatSel;
end;

end.
