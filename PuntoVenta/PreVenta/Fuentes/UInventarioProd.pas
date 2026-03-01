unit UInventarioProd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  db, Dialogs, DBCtrls, RXToolEdit, RXDBCtrl, StdCtrls, Mask, Buttons, Grids,
  DBGrids, ExtCtrls, RXCtrls, ComCtrls, Menus, RxLookup, ExtDlgs, ImgList,
  DBActns, ActnList, EditNew, WinSkinData, IBTable, IBCustomDataSet;

type
  TfrmInventarioProd = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBStatusLabel4: TDBStatusLabel;
    Shape1: TShape;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    RxDBGrid4: TRxDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    DBEdit2: TDBEdit;
    DBDateEdit1: TDBDateEdit;
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    PopupMenu1: TPopupMenu;
    ipoInventario1: TMenuItem;
    Label17: TLabel;
    edtCodBarra: TEdit;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    RxDBLookupCombo1: TRxDBLookupCombo;
    DBImage1: TDBImage;
    SpeedButton1: TSpeedButton;
    OpenPictureDialog1: TOpenPictureDialog;
    Label8: TLabel;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    ActionList1: TActionList;
    DataSetFirst1: TDataSetFirst;
    DataSetPrior1: TDataSetPrior;
    DataSetNext1: TDataSetNext;
    DataSetLast1: TDataSetLast;
    ImageList1: TImageList;
    DBEdit6: TDBEdit;
    Label9: TLabel;
    RxLabel1: TRxLabel;
    RxLabel2: TRxLabel;
    Label10: TLabel;
    Label11: TLabel;
    DBEdit7: TDBEdit;
    Label12: TLabel;
    DBEdit8: TDBEdit;
    Label13: TLabel;
    DBEdit9: TDBEdit;
    Label14: TLabel;
    BitBtn13: TBitBtn;
    DBEdit10: TDBEdit;
    Label15: TLabel;
    DBRadioGroup1: TDBRadioGroup;
    Label16: TLabel;
    DBEdit11: TDBEdit;
    Label18: TLabel;
    DBEdit12: TDBEdit;
    Label19: TLabel;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    Label20: TLabel;
    TabSheet2: TTabSheet;
    RxDBGrid1: TRxDBGrid;
    Label21: TLabel;
    DBEdit15: TDBEdit;
    Label22: TLabel;
    DBEdit16: TDBEdit;
    DBStatusLabel1: TDBStatusLabel;
    BitBtn14: TBitBtn;
    BitBtn15: TBitBtn;
    BitBtn16: TBitBtn;
    BitBtn17: TBitBtn;
    BitBtn18: TBitBtn;
    BitBtn19: TBitBtn;
    BitBtn22: TBitBtn;
    BitBtn23: TBitBtn;
    BitBtn24: TBitBtn;
    BitBtn25: TBitBtn;
    DBText1: TDBText;
    SkinData1: TSkinData;
    BitBtn20: TBitBtn;
    DBDateEdit2: TDBDateEdit;
    Label23: TLabel;
    DBRadioGroup2: TDBRadioGroup;
    qryClasifPrecio: TIBDataSet;
    qryClasifPrecioCOD_PRODUCTO: TIntegerField;
    qryClasifPrecioPRECIO_ID: TIntegerField;
    qryClasifPrecioPRECIO_VENTA: TFloatField;
    qryClasifPrecioCOD_USUARIO: TIntegerField;
    qryClasifPrecioSTATUS: TIBStringField;
    qryClasifPrecioIN_POR: TIBStringField;
    qryClasifPrecioFECHA_IN: TDateTimeField;
    qryClasifPrecioMOD_POR: TIBStringField;
    qryClasifPrecioFECHA_MOD: TDateTimeField;
    qryClasifPrecioMargenG: TCurrencyField;
    dsqryClasifPrecio: TDataSource;
    tblTipoPrecio: TIBTable;
    tblTipoPrecioPRECIO_ID: TIntegerField;
    tblTipoPrecioDESCRIPCION: TIBStringField;
    dstblTipoPrecio: TDataSource;
    panelClasifPrecio: TPanel;
    DBStatusLabel2: TDBStatusLabel;
    Label31: TLabel;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    BitBtn21: TBitBtn;
    BitBtn26: TBitBtn;
    BitBtn27: TBitBtn;
    BitBtn28: TBitBtn;
    DBEdit17: TDBEdit;
    Label24: TLabel;
    RxDBLookupCombo5: TRxDBLookupCombo;
    Label25: TLabel;
    BitBtn29: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure ipoInventario1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn8Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ActionList1Execute(Action: TBasicAction;
      var Handled: Boolean);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBEdit8Exit(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure BitBtn18Click(Sender: TObject);
    procedure BitBtn22Click(Sender: TObject);
    procedure BitBtn23Click(Sender: TObject);
    procedure BitBtn24Click(Sender: TObject);
    procedure BitBtn25Click(Sender: TObject);
    procedure BitBtn20Click(Sender: TObject);
    procedure DBEdit7Change(Sender: TObject);
    procedure RxDBGrid4GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tblTipoPrecioAfterScroll(DataSet: TDataSet);
    procedure BitBtn28Click(Sender: TObject);
    procedure BitBtn26Click(Sender: TObject);
    procedure BitBtn27Click(Sender: TObject);
    procedure BitBtn21Click(Sender: TObject);
    procedure qryClasifPrecioCalcFields(DataSet: TDataSet);
    procedure BitBtn29Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInventarioProd: TfrmInventarioProd;

implementation

uses UDatModInventario, uglobal, UTipoInventario, UCambiarPrecios,
  UDatModReportes, URepInventarioProd, UDatModConectar,
  UPrecioProdXUnidad;

{$R *.dfm}

procedure TfrmInventarioProd.BitBtn1Click(Sender: TObject);
begin
  if dmInventario.tblInventarioProd.State = dsBrowse then
  begin
    dmInventario.tblInventarioProd.Insert;
    dmInventario.tblInventarioProdSTATUS.Value:='A';
    dmInventario.tblInventarioProdFECHA.Value :=ExtraerFecha(Date);
    dmInventario.tblInventarioProdBLCE_CANT_ENTRADA.Value:= 0;
    dmInventario.tblInventarioProdBLCE_CANT_SALIDA.Value := 0;
    dmInventario.tblInventarioProdPAGA_ITBI.Value        := 0;
    dmInventario.tblInventarioProdPORC_DESCUENTO.Value   := 0;
    DBDateEdit1.SetFocus;
  end;
end;

procedure TfrmInventarioProd.BitBtn2Click(Sender: TObject);
begin
 if dmInventario.tblInventarioProd.State = dsBrowse then
  begin
    dmInventario.tblInventarioProd.Edit;
  end;
end;

procedure TfrmInventarioProd.BitBtn3Click(Sender: TObject);
begin
  if dmInventario.tblInventarioProd.State in [dsEdit,dsInsert] then
  begin
    dmInventario.tblInventarioProd.Cancel;
  end else
  if MessageDlg('Borrar artículo de inventario?', mtWarning,[mbYes, mbNo],0) = mrYes then
  begin
    dmInventario.tblInventarioProd.Delete;
    if Not dmInventario.tblInventarioProd.Transaction.InTransaction then
    dmInventario.tblInventarioProd.Transaction.StartTransaction;
    try
      dmInventario.tblInventarioProd.Transaction.CommitRetaining;
    except
    dmInventario.tblInventarioProd.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmInventarioProd.BitBtn4Click(Sender: TObject);
begin
  if dmInventario.tblInventarioProd.State in [dsEdit,dsInsert] then
  begin
    dmInventario.tblInventarioProd.Post;
    dmInventario.tblInventarioProd.ApplyUpdates;
    if not dmInventario.tblInventarioProd.Transaction.InTransaction then
    dmInventario.tblInventarioProd.Transaction.StartTransaction;
    try
      dmInventario.tblInventarioProd.Transaction.CommitRetaining;
    except
    dmInventario.tblInventarioProd.Transaction.RollbackRetaining;
    end;
    //Si codigo texto es nulo
    if dmInventario.tblInventarioProdCodigo_texto.IsNull then
    begin
      dmInventario.tblInventarioProd.Edit;
      //codigo_texto
      dmInventario.tblInventarioProdCodigo_texto.Value:=
      dmInventario.tblInventarioProdCodigo.AsString;
      //codigo_barra
      if dmInventario.tblInventarioProdCODIGO_BARRA.IsNull then
      dmInventario.tblInventarioProdCODIGO_BARRA.Value:=
      dmInventario.tblInventarioProdCodigo_texto.Value;
      dmInventario.tblInventarioProd.Post;
      dmInventario.tblInventarioProd.ApplyUpdates;
      if not dmInventario.tblInventarioProd.Transaction.InTransaction then
      dmInventario.tblInventarioProd.Transaction.StartTransaction;
      try
        dmInventario.tblInventarioProd.Transaction.CommitRetaining;
      except
      dmInventario.tblInventarioProd.Transaction.RollbackRetaining;
      end;
    end;
    edtCodBarra.SetFocus;
    edtCodBarra.SelectAll;
  end;
end;

procedure TfrmInventarioProd.BitBtn5Click(Sender: TObject);
begin
  if dmInventario.tblInventarioProd.State in [dsInactive, dsBrowse] then
  begin
    dmInventario.tblInventarioProd.Close;
    dmInventario.tblInventarioProd.Open;
    tblTipoPrecio.Close;
    tblTipoPrecio.Open;
  end;
end;

procedure TfrmInventarioProd.ipoInventario1Click(Sender: TObject);
begin
  frmTipoInventario:=TfrmTipoInventario.Create(nil);
  try
    frmTipoInventario.Showmodal;
  finally
  frmTipoInventario.free;
  frmTipoInventario:=nil;
  end;
end;

procedure TfrmInventarioProd.FormCreate(Sender: TObject);
begin
  dmInventario.qryTipoUnidad.Close;
  dmInventario.qryTipoUnidad.Open;
  tblTipoPrecio.Close;
  tblTipoPrecio.Open;
  dmInventario.qryValorLetras.Close;
  dmInventario.qryValorLetras.Open;
  dmInventario.tblTipoInventario.Close;
  dmInventario.tblTipoInventario.Open;
  BitBtn5Click(Self);
  dmInventario.qryValorEnInventario.Close;
  if not dmInventario.qryValorEnInventario.Prepared then
  dmInventario.qryValorEnInventario.Prepare;
  dmInventario.qryValorEnInventario.ExecQuery;
  dmInventario.qryValorEnInventario.CheckOpen;
  if dmInventario.qryValorEnInventario.Open then
  begin
    //Label10.Caption:= dmInventario.qryValorEnInventario.fieldbyname('CantidadProductos').AsString;  
    Label10.Caption:= dmInventario.qryValorEnInventario.Current.Vars[0].AsString;
    Label11.Caption:= Format('%8.2f',[dmInventario.qryValorEnInventario.Current.Vars[1].AsDouble]);

  end;
  {procedure TForm .ButtonClick(Sender: TObject);
   begin
     IBSQL .SQL.Clear;
     IBSQL .SQL.Add('execute procedure new_key');
     IBSQL .ExecQuery;
     Form.Caption := IBSQL.Current.Vars ;0].AsString;
   end;}
  if GlbPrecioMayRegOrden = 1 then
  BitBtn28.Visible:=False
  else
  BitBtn28.Visible:=True;
end;

procedure TfrmInventarioProd.BitBtn7Click(Sender: TObject);
begin
  if edtCodBarra.Text = '' then Exit;
  
  if Not dmInventario.tblInventarioProd.Locate('codigo_barra', edtCodBarra.Text,[]) then
  begin
    dmInventario.tblInventarioProd.Insert;
    dmInventario.tblInventarioProdCODIGO_BARRA.Value := edtCodBarra.Text;
    dmInventario.tblInventarioProdCODIGO_TEXTO.Value := edtCodBarra.Text;
    dmInventario.tblInventarioProdSTATUS.Value := 'A';
    dmInventario.tblInventarioProdFECHA.Value  := Now;
    RxDBLookupCombo1.SetFocus;
  end else
  MessageDlg('Codigo ya fue registrado', mtInformation, [mbOK], 0);
end;

procedure TfrmInventarioProd.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if dmInventario.tblInventarioProd.State in [dsEdit,dsInsert] then
  begin
    Messagedlg('Hay una transaccion pendiente, verifique', mtWarning,[mbok],0);
    CanClose:=False;
  end else CanClose:=True;
end;

procedure TfrmInventarioProd.BitBtn8Click(Sender: TObject);
begin
  frmCambiarPrecio:=TfrmCambiarPrecio.Create(nil);
  try
    frmCambiarPrecio.showmodal;
  finally
  frmCambiarPrecio.free;
  frmCambiarPrecio:=nil;
  end;
end;

procedure TfrmInventarioProd.FormShow(Sender: TObject);
begin
  if dmInventario.tblInventarioProd.State = dsInsert then
  RxDBLookupCombo1.SetFocus else edtCodBarra.SetFocus;
end;

procedure TfrmInventarioProd.ActionList1Execute(Action: TBasicAction;
  var Handled: Boolean);
begin
  if dmInventario.tblInventarioProd.State in [dsEdit, dsInsert] then
  Handled:=False;
end;

procedure TfrmInventarioProd.SpeedButton1Click(Sender: TObject);
begin
  if OpenPictureDialog1.Execute then
  begin
    if dmInventario.tblInventarioProd.State = dsBrowse then
    dmInventario.tblInventarioProd.Edit;
    dmInventario.tblInventarioProdFOTO.LoadFromFile(OpenPictureDialog1.FileName);
  end;
end;

procedure TfrmInventarioProd.DBEdit8Exit(Sender: TObject);
begin
 if dmInventario.tblInventarioProd.State in [dsEdit, dsInsert] then
 dmInventario.tblInventarioProdPRECIO.Value :=
 PrecioCodigo(Trim(dmInventario.tblInventarioProdcodigo_precio.Value), dmInventario.QryValorLetras);
end;

procedure TfrmInventarioProd.BitBtn13Click(Sender: TObject);
begin
  {dmReportes.qryDatosRepInventario.Close;
  dmReportes.qryDatosRepInventario.Open;}
  dmReportes.qryRepInventarioProdMasBclRuta.close;
  if GlbVenderDesdeAlmacenP = 1 then
  dmReportes.qryRepInventarioProdMasBclRuta.SQL.Text := 'Select * from PROC_DATOS_REP_INVENTARIO_P'
  else
  dmReportes.qryRepInventarioProdMasBclRuta.SQL.Text := 'Select * from PROC_DATOS_REP_INVENTARIO';
  
  dmReportes.qryRepInventarioProdMasBclRuta.Open;
  qckRepDatosInventario:=TqckRepDatosInventario.Create(nil);
  try
    qckRepDatosInventario.Prepare;
    qckRepDatosInventario.qrTpaginas.Caption:= ' de '+IntToStr(qckRepDatosInventario.PageNumber);
    qckRepDatosInventario.Preview;
  finally
  qckRepDatosInventario.Free;
  qckRepDatosInventario:=Nil;
  end;
end;

procedure TfrmInventarioProd.BitBtn14Click(Sender: TObject);
begin
  if dmInventario.tblInventarioSERIE.State in [dsBrowse] then
  begin
    dmInventario.tblInventarioSERIE.Insert;
    dmInventario.tblInventarioSERIECODIGO.Value:=
    dmInventario.tblInventarioProdCODIGO.Value;
    dmInventario.tblInventarioSERIESTATUS.Value:='A';
    dbedit15.setfocus;
  end;
end;

procedure TfrmInventarioProd.BitBtn15Click(Sender: TObject);
begin
  if dmInventario.tblInventarioSERIE.State in [dsBrowse] then
  dmInventario.tblInventarioSERIE.Edit;
end;

procedure TfrmInventarioProd.BitBtn16Click(Sender: TObject);
begin
  if dmInventario.tblInventarioSERIE.State in [dsInsert, dsEdit] then
  dmInventario.tblInventarioSERIE.Cancel
  else
  begin
    if MessageDlg('Eliminar record?',mtInformation, [mbyes,mbno], 0)=mryes then
    begin
      dmInventario.tblInventarioSERIE.Delete;
      dmInventario.tblInventarioSERIE.Post;
      dmInventario.tblInventarioSERIE.ApplyUpdates;
      try
        dmInventario.tblInventarioSERIE.Transaction.CommitRetaining;
      except
        dmInventario.tblInventarioSERIE.Transaction.RollbackRetaining;
      end;      
    end;
  end;

end;

procedure TfrmInventarioProd.BitBtn17Click(Sender: TObject);
begin
  if dmInventario.tblInventarioSERIE.State in [dsInsert, dsEdit] then
  begin
    dmInventario.tblInventarioSERIE.Post;
    dmInventario.tblInventarioSERIE.ApplyUpdates;
    try
      dmInventario.tblInventarioSERIE.Transaction.CommitRetaining;
    except
        dmInventario.tblInventarioSERIE.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmInventarioProd.BitBtn18Click(Sender: TObject);
begin
  if dmInventario.tblInventarioSERIE.State in [dsBrowse, dsInactive] then
  begin
    dmInventario.tblInventarioSERIE.Close;
    dmInventario.tblInventarioSERIE.Open;
  end;
end;

procedure TfrmInventarioProd.BitBtn22Click(Sender: TObject);
begin
  dmInventario.tblInventarioSERIE.First;
end;
procedure TfrmInventarioProd.BitBtn23Click(Sender: TObject);
begin
  dmInventario.tblInventarioSERIE.prior;
end;

procedure TfrmInventarioProd.BitBtn24Click(Sender: TObject);
begin
  dmInventario.tblInventarioSERIE.next;
end;

procedure TfrmInventarioProd.BitBtn25Click(Sender: TObject);
begin
  dmInventario.tblInventarioSERIE.last;
end;


procedure TfrmInventarioProd.BitBtn20Click(Sender: TObject);
begin
 { frmCodigoBarra:=TfrmCodigoBarra.Create(Nil);
  try
    if frmCodigoBarra.qryInv.State = dsBrowse then
    begin
      if Not frmCodigoBarra.qryInv.Locate('codigo', dmInventario.tblInventarioProdCodigo.Value, []) then
      MessageDlg('Codigo no encontrado en tabla inventario.', mtInformation, [mbOK], 0);
    end;
    frmCodigoBarra.ShowModal;
  finally
  frmCodigoBarra.Free;
  frmCodigoBarra:= Nil;
  end;}
  //WinExec(PChar('CodBarra.exe'), SW_SHOWNORMAL); {Ejecuta modulo impresion labels}
end;

procedure TfrmInventarioProd.DBEdit7Change(Sender: TObject);
begin
  if dmInventario.tblInventarioProdCODIGO_TEXTO.Value = '' then exit;
  dmInventario.qryPrecioCompraArti.Close;
  dmInventario.qryPrecioCompraArti.Params[0].Value:= dmInventario.tblInventarioProdcodigo.Value;//tblInventarioProdCODIGO_TEXTO.Value;
  dmInventario.qryPrecioCompraArti.Open;
  if (dmInventario.tblInventarioSERIE.State In [dsBrowse, dsInactive] ) then
  begin
    dmInventario.tblInventarioSERIE.Close;
    dmInventario.tblInventarioSERIE.Params[0].Value := dmInventario.tblInventarioProdCODIGO.Value;
    dmInventario.tblInventarioSERIE.Open;
  end;
end;

procedure TfrmInventarioProd.RxDBGrid4GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if dmInventario.tblInventarioProdINVENTARIAR.Value = 0 then
  Background:=clGreen;//$0000FF80
end;

procedure TfrmInventarioProd.tblTipoPrecioAfterScroll(DataSet: TDataSet);
begin
  qryClasifPrecio.Close;
  qryClasifPrecio.Params[0].Value := dmInventario.tblInventarioProdCODIGO.Value;
  qryClasifPrecio.Params[1].Value := tblTipoPrecioPRECIO_ID.Value;
  qryClasifPrecio.Open;
end;

procedure TfrmInventarioProd.BitBtn28Click(Sender: TObject);
begin
  if GlbPrecioMayRegOrden = 1 then
  panelClasifPrecio.Visible := True;
  tblTipoPrecio.Close;
  tblTipoPrecio.Open;
  tblTipoPrecio.First;
end;

procedure TfrmInventarioProd.BitBtn26Click(Sender: TObject);
begin
  panelClasifPrecio.Visible := false;
end;

procedure TfrmInventarioProd.BitBtn27Click(Sender: TObject);
begin
  if qryClasifPrecio.State = dsBrowse then
  begin
    if qryClasifPrecio.RecordCount = 0  then
    begin
      qryClasifPrecio.Insert;
      qryClasifPrecioCOD_PRODUCTO.Value:= dmInventario.tblInventarioProdCODIGO.Value;;
      qryClasifPrecioPRECIO_ID.Value   := tblTipoPrecioPRECIO_ID.Value;
      qryClasifPrecioIN_POR.Value      := StrUserName;
      qryClasifPrecioFECHA_IN.Value    := Now;
      DBGrid2.SetFocus;
    end else
    begin
      qryClasifPrecio.Edit;
      qryClasifPrecioMOD_POR.Value:= strUserName;
      qryClasifPrecioFECHA_MOD.Value:= ExtraerFecha(Date);
    end;
  end;
end;

procedure TfrmInventarioProd.BitBtn21Click(Sender: TObject);
begin
  if qryClasifPrecio.State In [dsEdit, dsInsert] then
  begin
    qryClasifPrecio.Post;
    qryClasifPrecio.ApplyUpdates;
    if Not qryClasifPrecio.Transaction.InTransaction then
    qryClasifPrecio.Transaction.StartTransaction;
    try
      qryClasifPrecio.Transaction.CommitRetaining;
    except
    qryClasifPrecio.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmInventarioProd.qryClasifPrecioCalcFields(DataSet: TDataSet);
begin
  qryClasifPrecioMargenG.Value :=
 ((qryClasifPrecioPRECIO_VENTA.Value - dmInventario.tblInventarioProdPRECIO_COMPRA.Value) /
   dmInventario.tblInventarioProdPRECIO_COMPRA.Value) * 100;
end;

procedure TfrmInventarioProd.BitBtn29Click(Sender: TObject);
begin
  frmPrecioProdXUnidad:=TfrmPrecioProdXUnidad.Create(nil);
  try
    frmPrecioProdXUnidad.buscarCodigo(dmInventario.tblInventarioProdCodigo.Value);
    frmPrecioProdXUnidad.Showmodal;
  finally
  frmPrecioProdXUnidad.Free;
  frmPrecioProdXUnidad:=Nil;
  end;

end;

end.

