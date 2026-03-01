unit UCtrlEquipoRMA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RxLookup, ExtCtrls, Grids, DBGrids, DBCtrls, StdCtrls, Buttons,
  db, Mask, rxToolEdit, RXDBCtrl, RXCtrls, ComCtrls, WinSkinData,
  USelFechaCnt, RxDBComb, IBCustomDataSet, IBQuery;

type
  TfrmRMA = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label9: TLabel;
    DBDateEdit1: TDBDateEdit;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    DBEdit1: TDBEdit;
    DBEdit6: TDBEdit;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    btnSalvar: TBitBtn;
    btnCerarAbrirres: TBitBtn;
    btnModificar: TBitBtn;
    btnCancelar: TBitBtn;
    btnInsertar: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    RxDBLookupCombo1: TRxDBLookupCombo;
    RxDBLookupCombo2: TRxDBLookupCombo;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    TabSheet2: TTabSheet;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit3: TDBEdit;
    RxDBLookupCombo3: TRxDBLookupCombo;
    Label8: TLabel;
    DBStatusLabel3: TDBStatusLabel;
    DBStatusLabel2: TDBStatusLabel;
    DBGrid2: TDBGrid;
    Edit1: TEdit;
    SkinData1: TSkinData;
    DBMemo1: TDBMemo;
    Shape1: TShape;
    BitBtn8: TBitBtn;
    BitBtn13: TBitBtn;
    SelectRangoFecha: TSelFechaCnt;
    Label10: TLabel;
    DBDateEdit2: TDBDateEdit;
    Label19: TLabel;
    RxDBComboBox1: TRxDBComboBox;
    BitBtn15: TBitBtn;
    RxDBLookupCombo4: TRxDBLookupCombo;
    Label11: TLabel;
    dsqryEmpleado: TDataSource;
    qryEmpleado: TIBQuery;
    qryEmpleadoNOMBREVENDEDOR: TIBStringField;
    qryEmpleadoCODIGO: TIntegerField;
    BitBtn14: TBitBtn;
    DBEdit4: TDBEdit;
    Label12: TLabel;
    BitBtn16: TBitBtn;
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnCerarAbrirresClick(Sender: TObject);
    procedure btnInsertarClick(Sender: TObject);
    procedure btnModificarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure RxDBLookupCombo3Change(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
  private
    { Private declarations }
    procedure Imprimir(tipo : smallint);
  public
    { Public declarations }
    tripoTrn : smallint;
    tipoOpe  : smallint;
    esEntrada : boolean;
  end;

var
  frmRMA: TfrmRMA;

implementation

uses UDatModInventario, qckRepReparacionRecibo, uglobal,
  qckRepREMAComprobante, UConsultaInventario, UFormSelSerieProd,
  UFormBuscarSerie, UFormRepEquipos, UDatModReportes;

{$R *.dfm}

procedure TfrmRMA.BitBtn10Click(Sender: TObject);
begin
  dmInventario.tblEquipoMaster.Prior;
end;

procedure TfrmRMA.BitBtn11Click(Sender: TObject);
begin
  dmInventario.tblEquipoMaster.Next;
end;

procedure TfrmRMA.BitBtn12Click(Sender: TObject);
begin
  dmInventario.tblEquipoMaster.Last;
end;

procedure TfrmRMA.BitBtn9Click(Sender: TObject);
begin
  dmInventario.tblEquipoMaster.First;
end;

procedure TfrmRMA.btnCancelarClick(Sender: TObject);
begin
  if dmInventario.tblEquipoMaster.State in [dsEdit, dsInsert] then
  dmInventario.tblEquipoMaster.Cancel;
end;

procedure TfrmRMA.btnCerarAbrirresClick(Sender: TObject);
begin
  SelectRangoFecha.Fecha:= ExtraerFecha(GlbFechaTrnDiaria) - 30;
  SelectRangoFecha.FechaFinal := ExtraerFecha(Now);
  if dmInventario.tblEquipoMaster.State In [dsBrowse, dsInactive] then
  begin
    if SelectRangoFecha.Execute then
    begin
      dmInventario.tblEquipoMaster.Close;
      dmInventario.tblEquipoMaster.Params[0].Value:= ExtraerFecha(GlbFechaTrnDiaria);
      dmInventario.tblEquipoMaster.Params[1].Value:= ExtraerFecha(GlbFechaTrnDiaria);
      dmInventario.tblEquipoMaster.Params[2].Value:= tipoOpe;
      dmInventario.tblEquipoMaster.Params[3].Value:= tipoOpe;
      dmInventario.tblEquipoMaster.Open;
    end;
  end;
end;

procedure TfrmRMA.btnInsertarClick(Sender: TObject);
begin
  if dmInventario.tblEquipoMaster.State = dsBrowse then
  begin
    dmInventario.tblEquipoMaster.Append;
    dmInventario.tblEquipoMasterFECHA.Value   := ExtraerFecha(GlbFechaTrnDiaria);
    dmInventario.tblEquipoMasterTIPO_OPE.Value:= tipoOpe;//RMA
    dmInventario.tblEquipoMasterSTATUS.Value  := 'A';
    //dmInventario.tblEquipoMasterFECHA_IN.Value:= Now;
    //dmInventario.tblEquipoMasterIN_POR.Value  := StrUserName;
    RxDBLookupCombo1.SetFocus;
    BitBtn1.Enabled:=true;
  end;
end;

procedure TfrmRMA.btnModificarClick(Sender: TObject);
begin
  if dmInventario.tblEquipoMaster.State = dsBrowse then
  dmInventario.tblEquipoMaster.Edit;
end;

procedure TfrmRMA.btnSalvarClick(Sender: TObject);
begin
  if dmInventario.tblEquipoMaster.State in [dsEdit, dsInsert] then
  GlbSalvarQuery(dmInventario.tblEquipoMaster);
end;

procedure TfrmRMA.BitBtn1Click(Sender: TObject);
begin
  if dmInventario.tblEquipoDet.State = dsBrowse then
  begin
    dmInventario.tblEquipoDet.Append;
    Edit1.Enabled:=true;
    dmInventario.tblEquipoDetCOD_USUARIO.Value   := VarUsuarioGlb;
    dmInventario.tblEquipoDetFECHA_IN.Value      := Now;
    dmInventario.tblEquipoDetINSERTADO_POR.Value := StrUserName;
    dmInventario.tblEquipoDetSTATUS.Value        := 'A';
    RxDBLookupCombo3.SetFocus;
  end;
end;

procedure TfrmRMA.BitBtn2Click(Sender: TObject);
begin
  if dmInventario.tblEquipoDet.State = dsBrowse then
  dmInventario.tblEquipoDet.Edit;
end;

procedure TfrmRMA.BitBtn4Click(Sender: TObject);
begin
  if dmInventario.tblEquipoDet.State in [dsEdit, dsInsert] then
  dmInventario.tblEquipoDet.cancel;
end;

procedure TfrmRMA.BitBtn5Click(Sender: TObject);
begin
  if dmInventario.tblEquipoMaster.State in [dsEdit, dsInsert] then
  begin
    btnSalvarClick(Self);
  end;

  if dmInventario.tblEquipoDet.State in [dsEdit, dsInsert] then
  begin
    if dmInventario.tblEquipoDet.State = dsInsert then
    begin
      dmInventario.tblEquipoDetNUMERO.Value:=
      dmInventario.tblEquipoMasterNUMERO.Value;
    end;
    GlbSalvarQuery(dmInventario.tblEquipoDet);
    if not dmInventario.tblEquipoDetCOD_PRODUCTO.IsNull then
    begin
      dmInventario.tblInventarioSERIE.Close;
      dmInventario.tblInventarioSERIE.Params[0].Value:= dmInventario.tblEquipoDetCOD_PRODUCTO.Value;
      dmInventario.tblInventarioSERIE.Open;
      if not dmInventario.tblInventarioSERIESERIE.IsNull then
      begin
        dmInventario.tblInventarioSERIE.Edit;
        dmInventario.tblInventarioSERIEStatus_equipo.Value:=3;
        {
        1-Disponible
        2-Asignado a:
        3-Rma (reparación)
        }
        GlbSalvarQuery(dmInventario.tblInventarioSERIE);
      end;
    end;
  end;
end;

procedure TfrmRMA.BitBtn6Click(Sender: TObject);
begin
  if dmInventario.tblEquipoDet.State in [dsInactive, dsBrowse] then
  begin
    dmInventario.tblEquipoDet.Close;
    dmInventario.tblEquipoDet.Open;
  end;
end;

procedure TfrmRMA.FormCreate(Sender: TObject);
begin
  dmInventario.tblTipoTrn.Close;
  dmInventario.tblTipoTrn.Open;
  dmInventario.qryProveedores.Close;
  dmInventario.qryProveedores.Filtered:=False;
  dmInventario.qryProveedores.Tag:=glbCia_Key;
  //dmInventario.qryProveedores.Filtered:=True;
  //dmInventario.qryProveedores.Params[0].Value:=glbCia_Key;
  dmInventario.qryProveedores.Open;
  dmInventario.tblEquipoMaster.Close;
  dmInventario.tblEquipoMaster.Params[0].Value:= ExtraerFecha(GlbFechaTrnDiaria);
  dmInventario.tblEquipoMaster.Params[1].Value:= ExtraerFecha(GlbFechaTrnDiaria);
  dmInventario.tblEquipoMaster.Params[2].Value:= 0;
  dmInventario.tblEquipoMaster.Params[3].Value:= 10;
  dmInventario.tblEquipoMaster.Open;
  dmInventario.tblInventarioProd.Close;
  dmInventario.tblInventarioProd.SelectSQL.Text := dmInventario.qryInvProd_Base.Sql.Text;
  dmInventario.tblInventarioProd.Params[0].Value:=glbCia_Key;
  dmInventario.tblInventarioProd.Open;
  qryEmpleado.Close;
  qryEmpleado.Open;
end;

procedure TfrmRMA.Edit1Exit(Sender: TObject);
begin
  if (edit1.Text = '') then exit;
  if Not dmInventario.tblInventarioProd.Locate('codigo', strToInt(edit1.Text),[]) then
  MessageDlg('Codigo no encontrado, verifique', mtInformation, [mbOK], 0)
  else
  begin
    if dmInventario.tblEquipoDet.state in [dsedit, dsinsert] then
    dmInventario.tblEquipoDetCOD_PRODUCTO.Value:= StrToInt(edit1.Text);
  end;
end;

procedure TfrmRMA.RxDBLookupCombo3Change(Sender: TObject);
begin
  if dmInventario.tblEquipoDet.State in [dsEdit, dsBrowse] then exit;
  Edit1.Text := dmInventario.tblInventarioProdCODIGO.AsString;

  frmBuscarSerie:=TfrmBuscarSerie.Create(Nil);
  try
    frmBuscarSerie.qryProdSerie.close;
    frmBuscarSerie.qryProdSerie.Params[0].Value:= dmInventario.tblInventarioProdCODIGO.Value;
    frmBuscarSerie.qryProdSerie.Open;
     if frmBuscarSerie.qryProdSerie.RecordCount > 0 then
     begin
       if frmBuscarSerie.Showmodal = mrOk then
      begin
        dmInventario.tblEquipoDetSERIE_EQUIPO.Value:= frmBuscarSerie.qryProdSerieSERIE.Value;
      end;
     end;
    finally
    frmBuscarSerie.Free;
    frmBuscarSerie:= Nil;
    end;
end;

procedure TfrmRMA.BitBtn8Click(Sender: TObject);
begin
  Imprimir(0);
end;

procedure TfrmRMA.Imprimir(tipo: smallint);
begin                                                    //tipo = 1 = re-imprimir
  if (not dmInventario.tblEquipoMasterNUMERO.IsNull) And (tipo = 0) then
  begin
    dmInventario.qryEquiposEnRMA.Close;
    dmInventario.qryEquiposEnRMA.Params[0].Value :=
    dmInventario.tblEquipoMasterNUMERO.Value;
    dmInventario.qryEquiposEnRMA.Open;
  end else
  begin
    dmInventario.qryEquiposEnRMA.Close;
    dmInventario.qryEquiposEnRMA.Params[0].Value :=
    StrToInt(Inputbox('Re-imprimir comprobante','Entre número',''));
    dmInventario.qryEquiposEnRMA.Open;
  end;
  qckRMAComprobante:=TqckRMAComprobante.Create(Nil);
  try
  qckRMAComprobante.Preview;
  finally
  qckRMAComprobante.free;
  qckRMAComprobante:=nil;
  end;
end;

procedure TfrmRMA.BitBtn13Click(Sender: TObject);
begin
  Imprimir(1);
end;

procedure TfrmRMA.BitBtn15Click(Sender: TObject);
begin
  frmConsultaInventario:=TfrmConsultaInventario.Create(Nil);
  try
    if frmConsultaInventario.Showmodal = mrOk then
    edit1.Text := frmConsultaInventario.ibquery1codigo.AsString;
    Edit1Exit(Self);
  finally
  frmConsultaInventario.Free;
  frmConsultaInventario:=Nil;
  end;
end;

procedure TfrmRMA.BitBtn14Click(Sender: TObject);
begin
  frmReporteEquipos:=TfrmReporteEquipos.Create(nil);
  try
    if frmReporteEquipos.ShowModal = mrOk then
    begin
      frmReporteEquipos.BitBtn5.Visible:=True;
      frmReporteEquipos.BitBtn1.Enabled :=False;
      frmReporteEquipos.BitBtn37.Enabled:=False;
      frmReporteEquipos.RxDBGrid1.Options  :=
      frmReporteEquipos.RxDBGrid1.Options+ [dgRowSelect];

      dmInventario.tblEquipoMaster.Close;
      dmInventario.tblEquipoMaster.Params[0].Value:= ExtraerFecha(dmReportes.qryRepEquiposFECHASALIDARMA.Value);
      dmInventario.tblEquipoMaster.Params[1].Value:= ExtraerFecha(dmReportes.qryRepEquiposFECHASALIDARMA.Value);
      dmInventario.tblEquipoMaster.Params[2].Value:= tipoOpe;
      dmInventario.tblEquipoMaster.Params[3].Value:= tipoOpe;
      dmInventario.tblEquipoMaster.Open;
      if not dmInventario.tblEquipoMaster.Locate('NUMERO;SERIE_EQUIPO',
      VarArrayOf([dmReportes.qryRepEquiposNUMERO.Value,
                  dmReportes.qryRepEquiposSERIE_EQUIPO.Value]),[]) then
      MessageDlg('No encontrado, verifique.',mtInformation,[mbok],0);
    end;
  finally
  frmReporteEquipos.free;
  frmReporteEquipos:=nil;
  end;
end;

procedure TfrmRMA.BitBtn16Click(Sender: TObject);
begin
  if MessageDlg('Desea cambiar el numeor de serie?', mtInformation, [mbYes,mbNo],0) = mrNo then
  Exit;
  dmInventario.tblEquipoDet.Edit;
  frmBuscarSerie:=TfrmBuscarSerie.Create(Nil);
  try
    frmBuscarSerie.qryProdSerie.close;
    frmBuscarSerie.qryProdSerie.Params[0].Value:= dmInventario.tblInventarioProdCODIGO.Value;
    frmBuscarSerie.qryProdSerie.Open;
     if frmBuscarSerie.qryProdSerie.RecordCount > 0 then
     begin
       if frmBuscarSerie.Showmodal = mrOk then
      begin
        dmInventario.tblEquipoDetSERIE_EQUIPO.Value:= frmBuscarSerie.qryProdSerieSERIE.Value;
        BitBtn5Click(Self)//guardar
      end else
      dmInventario.tblEquipoDet.Cancel;
     end;
  finally
  frmBuscarSerie.Free;
  frmBuscarSerie:= Nil;
  end;
end;

end.
