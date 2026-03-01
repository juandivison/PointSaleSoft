unit UCtrlAlquiler;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RxLookup, ExtCtrls, Grids, DBGrids, DBCtrls, StdCtrls, Buttons,
  db, Mask, rxToolEdit, RXDBCtrl, RXCtrls, ComCtrls, WinSkinData, GetAnyDate,
  IBCustomDataSet, IBStoredProc, Menus, RxDBComb, IBTable;

type
  TfrmAlquiler = class(TForm)
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
    TabSheet2: TTabSheet;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit3: TDBEdit;
    RxDBLookupCombo3: TRxDBLookupCombo;
    Label8: TLabel;
    DBStatusLabel3: TDBStatusLabel;
    DBStatusLabel2: TDBStatusLabel;
    Edit1: TEdit;
    SkinData1: TSkinData;
    DBMemo1: TDBMemo;
    Shape1: TShape;
    BitBtn8: TBitBtn;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;
    BitBtn15: TBitBtn;
    BitBtn16: TBitBtn;
    GetAnyDate1: TGetAnyDate;
    Label10: TLabel;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    Label11: TLabel;
    Label12: TLabel;
    DBEdit7: TDBEdit;
    DBMemo2: TDBMemo;
    dsqryClientes: TDataSource;
    DBEdit2: TDBEdit;
    Label13: TLabel;
    DBEdit9: TDBEdit;
    Label15: TLabel;
    Label16: TLabel;
    DBText1: TDBText;
    Panel1: TPanel;
    RxDBGrid1: TRxDBGrid;
    Shape2: TShape;
    RxLabel1: TRxLabel;
    DBDateEdit2: TDBDateEdit;
    Label17: TLabel;
    DBDateEdit3: TDBDateEdit;
    Label18: TLabel;
    BitBtn17: TBitBtn;
    ibstpProcSecuencia: TIBStoredProc;
    PopupMenu1: TPopupMenu;
    EliminarDetalle1: TMenuItem;
    Label19: TLabel;
    RxDBComboBox1: TRxDBComboBox;
    ibStpActualizaInvProd: TIBStoredProc;
    Label20: TLabel;
    DBEdit10: TDBEdit;
    BitBtn18: TBitBtn;
    lblTasa: TLabel;
    tblMoneda: TIBTable;
    tblMonedaCODIGO: TIBStringField;
    tblMonedaDESCRIPCION: TIBStringField;
    tblMonedaFECHA_IN: TDateTimeField;
    tblMonedaFECHA_UPCAMPO_FECHA_HORA: TDateTimeField;
    tblMonedaMODIFICADO_POR: TIBStringField;
    tblMonedaSIMBOLO: TIBStringField;
    dstblMoneda: TDataSource;
    RxDBLookupCombo4: TRxDBLookupCombo;
    Label40: TLabel;
    BitBtn19: TBitBtn;
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
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure DBEdit4Exit(Sender: TObject);
    procedure RxDBLookupCombo3Exit(Sender: TObject);
    procedure RxDBGrid1GetCellProps(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor);
    procedure BitBtn17Click(Sender: TObject);
    procedure DBDateEdit3Exit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBDateEdit2Enter(Sender: TObject);
    procedure DBDateEdit1Exit(Sender: TObject);
    procedure EliminarDetalle1Click(Sender: TObject);
    procedure DBDateEdit2Exit(Sender: TObject);
    procedure BitBtn18Click(Sender: TObject);
    procedure BitBtn19Click(Sender: TObject);
  private
    { Private declarations }
    //procedure Imprimir(tipo : smallint);
    procedure ImprimePOS(tipo : smallint);
    procedure ProcesarEntrada;
    //procedure InsertarVentaMast;
    //procedure InsertarVentaDetalle;

    Procedure PostearEnVentas;
    Procedure ActualizaInventario;
  public
    { Public declarations }
    tripoTrn : smallint;
    tipoOpe : smallint;
    procedure ProcAbrir;
  end;

var
  frmAlquiler: TfrmAlquiler;
  MontoPrecio : Extended;
  monedaBase : string;
implementation

uses UDatModInventario, qckRepReparacionRecibo, uglobal,
  UBuscarProveedores, UConsultaInventario, //URepComprobante,
  UDatModReportes, qckRepCompAlquiler, UBuscarClientesPersonasP,
  UDatModClientes, DateUtils, UProcVentaRapida, UDatosVentas,
  UDatModCalculos, UFormConsServXTipo, UQckRepServXTipo,
  UFormConsServXTipoBuscar;


{$R *.dfm}

procedure TfrmAlquiler.BitBtn10Click(Sender: TObject);
begin
  dmInventario.tblAlquilerMaster.Prior;
end;

procedure TfrmAlquiler.BitBtn11Click(Sender: TObject);
begin
  dmInventario.tblAlquilerMaster.Next;
end;

procedure TfrmAlquiler.BitBtn12Click(Sender: TObject);
begin
  dmInventario.tblAlquilerMaster.Last;
end;

procedure TfrmAlquiler.BitBtn9Click(Sender: TObject);
begin
  dmInventario.tblAlquilerMaster.First;
end;

procedure TfrmAlquiler.btnCancelarClick(Sender: TObject);
begin
  if (dmInventario.tblAlquilerMaster.State = dsBrowse) and
     (dmInventario.tblAlquilerMasterStatus.Value = 'A') then
  begin
    if MessageDlg('Desea eliminar record?', mtWarning,[mbYes,mbNo],0) = mrYes then
    begin
      dmInventario.tblAlquilerDet.first;
      While Not dmInventario.tblAlquilerDet.Eof Do
      begin
        if dmInventario.tblAlquilerDet.RecordCount > 0 then
        dmInventario.tblAlquilerDet.Delete;
        dmInventario.tblAlquilerDet.Next;
      end;
      dmInventario.tblAlquilerMaster.Delete;
      GlbSalvarQuery(dmInventario.tblAlquilerMaster);
      GlbSalvarQuery(dmInventario.tblAlquilerDet);
    end;
    exit;
  end;
  if dmInventario.tblAlquilerMaster.State in [dsEdit, dsInsert] then
  dmInventario.tblAlquilerMaster.Cancel;
  if dmInventario.tblAlquilerDet.State in [dsEdit, dsInsert] then
  dmInventario.tblAlquilerDet.Cancel;
end;

procedure TfrmAlquiler.btnCerarAbrirresClick(Sender: TObject);
begin
  if dmInventario.tblAlquilerMaster.State In [dsBrowse, dsInactive] then
  begin
    dmInventario.tblAlquilerDet.Close;
    dmInventario.tblAlquilerMaster.Close;
    dmInventario.tblAlquilerMaster.Open;
  end;
end;

procedure TfrmAlquiler.btnInsertarClick(Sender: TObject);
begin
  dmreportes.qryConfReportes.Close;
  dmreportes.qryConfReportes.Params[0].Value:=2;//Comprobante Alquiler
  dmreportes.qryConfReportes.Open;

  if dmInventario.tblAlquilerMaster.State = dsBrowse then
  begin
    dmInventario.tblAlquilerMaster.Insert;
    dmInventario.tblAlquilerMasterMONEDA.Value :='1';
    dmInventario.tblAlquilerMasterCOD_PROD_ALQ.Value := 
    dmreportes.qryConfReportesCODIGO_PROD.Value;
    dmInventario.tblAlquilerMasterTIPO_OPE.Value := 1;
    dmInventario.tblAlquilerMasterSTATUS.Value  := 'A';
    dmInventario.tblAlquilerMasterTIPOTRN.Value:= tripoTrn;
    dmInventario.tblAlquilerMasterFECHA.Value := ExtraerFecha(GlbFechaTrnDiaria);
    //dmInventario.tblAlquilerMasterFECHA_ENT_ESTIMADA.Value := ExtraerFecha(GlbFechaTrnDiaria)+3;
    dmInventario.tblAlquilerMasterFECHA_IN.Value := Now;
    dmInventario.tblAlquilerMasterIN_POR.Value   := StrUserName;
    dmInventario.tblAlquilerMasterCODIGO_USUARIO.Value:= VarUsuarioGlb;
    if dmInventario.tblAlquilerDet.State = dsBrowse then
    begin
      dmInventario.tblAlquilerDet.Insert;
      dmInventario.tblAlquilerDetFECHA_IN.Value:= now;
      Edit1.enabled:=true;
      dmInventario.tblAlquilerDetSTATUS.Value := 'A';
      dmInventario.tblAlquilerDetCODIGO_USUARIO.Value:= VarUsuarioGlb;
      dmInventario.tblAlquilerDetMONEDA.Value := dmInventario.tblAlquilerMasterMONEDA.Value;
      DBDateEdit1.SetFocus;
    end;
    BitBtn1.Enabled:=true;
    RxDBLookupCombo1.SetFocus;
  end;
end;

procedure TfrmAlquiler.btnModificarClick(Sender: TObject);
begin
  if dmInventario.tblAlquilerMaster.State = dsBrowse then
  dmInventario.tblAlquilerMaster.Edit;
end;

procedure TfrmAlquiler.btnSalvarClick(Sender: TObject);
begin
  if dmInventario.tblAlquilerMaster.State in [dsEdit, dsInsert] then
  begin
    if dmInventario.tblAlquilerMasterFECHA_ENT_ESTIMADA.IsNull then
    begin
      DBDateEdit2.SetFocus;
      raise Exception.Create('Favor indicar fecha estimada de devolución/entrega.');
      Exit;
    end;
    dmInventario.tblAlquilerMaster.Post;
    dmInventario.tblAlquilerMaster.ApplyUpdates;
    if not dmInventario.tblAlquilerMaster.Transaction.InTransaction then
    dmInventario.tblAlquilerMaster.Transaction.StartTransaction;
    try
      dmInventario.tblAlquilerMaster.Transaction.CommitRetaining;
    except
    dmInventario.tblAlquilerMaster.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmAlquiler.BitBtn1Click(Sender: TObject);
begin
  if dmInventario.tblAlquilerDet.State = dsBrowse then
  begin
    if (dmInventario.tblAlquilerDet.RecordCount = 1) then
    begin
      MessageDlg('Solo se permite una prenda por registro, verifique', mtInformation, [mbOK], 0);
      Exit;
    end;
    dmInventario.tblAlquilerDet.Insert;
    dmInventario.tblAlquilerDetCODIGO_USUARIO.Value:= VarUsuarioGlb;
    dmInventario.tblAlquilerDetFECHA_IN.Value:= Now;
    dmInventario.tblAlquilerDetIN_POR.Value  := StrUserName;
    Edit1.enabled:= True;
    dmInventario.tblAlquilerDetSTATUS.Value := 'A';
    DBDateEdit1.SetFocus;
  end;
end;

procedure TfrmAlquiler.BitBtn2Click(Sender: TObject);
begin
  if dmInventario.tblAlquilerDet.State = dsBrowse then
  dmInventario.tblAlquilerDet.Edit;
end;

procedure TfrmAlquiler.BitBtn4Click(Sender: TObject);
begin
  if dmInventario.tblAlquilerDet.State in [dsEdit, dsInsert] then
  dmInventario.tblAlquilerDet.cancel;
end;

procedure TfrmAlquiler.BitBtn5Click(Sender: TObject);
begin
  if dmInventario.tblAlquilerMaster.State in [dsEdit, dsInsert] then
  begin
    btnSalvarClick(Self);
  end;
  if dmInventario.tblAlquilerDet.State in [dsBrowse] then
  if (dmInventario.tblAlquilerDetIDSERIE.Value = 0) then
  dmInventario.tblAlquilerDet.edit;

  if dmInventario.tblAlquilerDet.State in [dsEdit, dsInsert] then
  begin
    if dmInventario.tblAlquilerDet.State = dsInsert then
    begin
      dmInventario.tblAlquilerDetIDSERIE.Value:=
      dmInventario.tblAlquilerMasteridserie.Value;
    end;
    if (dmInventario.tblAlquilerDetIDSERIE.Value = 0) then
    dmInventario.tblAlquilerMasteridserie.Value;

    dmInventario.tblAlquilerDet.Post;
    dmInventario.tblAlquilerDet.ApplyUpdates;
    if not dmInventario.tblAlquilerDet.Transaction.InTransaction then
    dmInventario.tblAlquilerDet.Transaction.StartTransaction;
    try
      dmInventario.tblAlquilerDet.Transaction.CommitRetaining;
    except
    dmInventario.tblAlquilerDet.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmAlquiler.BitBtn6Click(Sender: TObject);
begin
  if dmInventario.tblAlquilerDet.State in [dsInactive, dsBrowse] then
  begin
    dmInventario.tblAlquilerDet.Close;
    dmInventario.tblAlquilerDet.Open;
  end;
end;

procedure TfrmAlquiler.FormCreate(Sender: TObject);
begin
  tblMoneda.Close;
  tblMoneda.Open;
  dmInventario.qryInvAlquiler.Close;
  dmInventario.qryInvAlquiler.Open;
  dmInventario.tblTipoTrn.Close;
  dmInventario.tblTipoTrn.Open;
  dmInventario.qryProveedores.Close;
  dmInventario.qryProveedores.Filtered:=False;
  dmInventario.qryProveedores.Tag:=glbCia_Key;
  //dmInventario.qryProveedores.Filtered:=True;
  //dmInventario.qryProveedores.Params[0].Value:=glbCia_Key;
  dmInventario.qryProveedores.Open;
  dmInventario.tblInventarioProd.Close;
  dmInventario.tblInventarioProd.SelectSQL.Text := dmInventario.qryInvProd_Base.Sql.Text;  
  dmInventario.tblInventarioProd.Params[0].Value:=glbCia_Key;
  dmInventario.tblInventarioProd.Open;
  dmclientes.qryclientes.Close;
  dmclientes.qryclientes.Open;
  ProcAbrir;  
end;

procedure TfrmAlquiler.Edit1Exit(Sender: TObject);
begin
  if (edit1.Text = '') then exit;
  if Not dmInventario.tblInventarioProd.Locate('codigo', strToInt(edit1.Text),[]) then
  MessageDlg('Codigo no encontrado, verifique', mtInformation, [mbOK], 0)
  else
  begin
    if dmInventario.tblAlquilerDet.state in [dsedit, dsinsert] then
    dmInventario.tblAlquilerDetCOD_PRODUCTO.Value:= StrToInt(edit1.Text);
  end;
end;

procedure TfrmAlquiler.RxDBLookupCombo3Change(Sender: TObject);
begin
  if (dmInventario.tblAlquilerMasterSTATUS.Value = 'R') then Exit;
  edit1.Text := dmInventario.qryInvAlquilerCODIGO.AsString;
  if dmInventario.tblAlquilerDet.State = dsInsert then
    if dmInventario.tblAlquilerDetCantidad.IsNull then
       dmInventario.tblAlquilerDetCantidad.Value:=1;

  MontoPrecio:= dmInventario.qryInvAlquilerPRECIO_ALQUILER.Value;
  dmInventario.tblAlquilerDetPRECIO_XDIA.Value        := MontoPrecio;
  if (monedaBase = '') then
  monedaBase := GetMonedaProducto(dmInventario.tblAlquilerDetCOD_PRODUCTO.Value);
  dmInventario.tblAlquilerDetPRECIO_XDIA.DisplayFormat:= Concat(SimboloMoneda(monedaBase), ',0.00');
end;
procedure TfrmAlquiler.BitBtn8Click(Sender: TObject);
begin
  ImprimePOS(0);
end;
{
procedure TfrmAlquiler.Imprimir(tipo: smallint);
begin                                                    //tipo = 1 = re-imprimir
  if (Not dmInventario.tblAlquilerMasteridserie.IsNull) And (tipo = 0) then
  begin
    dmInventario.qryRepRepMaster.Close;
    dmInventario.qryRepRepMaster.Params[0].Value :=
    dmInventario.tblAlquilerMasteridserie.Value;
    dmInventario.qryRepRepMaster.Open;
  end else
  begin
    dmInventario.qryRepRepMaster.Close;
    dmInventario.qryRepRepMaster.Params[0].Value :=
    StrToInt(Inputbox('Re-imprimir comprobante','Entre número',''));
    dmInventario.qryRepRepMaster.Open;
  end;
end; }

procedure TfrmAlquiler.BitBtn13Click(Sender: TObject);
begin
  ImprimePOS(1);
end;

procedure TfrmAlquiler.BitBtn14Click(Sender: TObject);
begin
  FrmBuscarClientesPersonas:=TFrmBuscarClientesPersonas.Create(nil);
  try
    FrmBuscarClientesPersonas.CodigoCliente := -1;
    if FrmBuscarClientesPersonas.Showmodal = mrOk then
    begin
      if dmInventario.tblAlquilerMaster.State In [dsBrowse] then
      dmInventario.tblAlquilerMaster.Edit;
      if (dmInventario.tblAlquilerMasterSTATUS.Value = 'A') then
      dmInventario.tblAlquilerMasterCOD_CLIENTE.Value :=FrmBuscarClientesPersonas.CodigoCliente;
    end;
  finally
  FrmBuscarClientesPersonas.Free;
  FrmBuscarClientesPersonas:=Nil;
  end;
end;

procedure TfrmAlquiler.BitBtn15Click(Sender: TObject);
begin
  frmConsultaInventario:=TfrmConsultaInventario.Create(Nil);
  try
    if frmConsultaInventario.Showmodal = mrOk then
    edit1.Text := frmConsultaInventario.ibquery1codigo.AsString;

    MontoPrecio :=  frmConsultaInventario.IBQuery1PRECIO_Alquiler.Value;
    Edit1Exit(Self);
  finally
  frmConsultaInventario.Free;
  frmConsultaInventario:=Nil;
  end;
end;

procedure TfrmAlquiler.ImprimePOS(tipo: smallint);
var
  Flag : boolean;
begin
  //GlbEsRecibo:=True;
  dmreportes.qryConfReportes.Close;
  dmreportes.qryConfReportes.Params[0].Value:=2;//Comprobante Alquiler
  dmreportes.qryConfReportes.Open;
   
  if (not dmInventario.tblAlquilerMasteridserie.IsNull) And (tipo = 0) then
  begin
    dmInventario.qryRepAlquilerMaster.Close;
    dmInventario.qryRepAlquilerMaster.Params[0].Value :=
    dmInventario.tblAlquilerMasteridserie.Value;
    dmInventario.qryRepAlquilerMaster.Open;
  end else
  begin
    dmInventario.qryRepAlquilerMaster.Close;
    dmInventario.qryRepAlquilerMaster.Params[0].Value :=
    StrToInt(Inputbox('Re-imprimir comprobante','Entre número', dmInventario.tblAlquilerDetIDSERIE.AsString));
    dmInventario.qryRepAlquilerMaster.Open;
  end;
    
  //Para futura configuracion tamaño reporte
  //if (dmreportes.qryConfReportesSIZE_REP.Value = 1) then
  //begin
  try
    qckCompAlquiler:=TqckCompAlquiler.Create(nil);
    try
      //ActivaCampos;
     if not dmreportes.qryConfReportesNOTA_PIE_PAGINA.IsNull then
     qckCompAlquiler.QRMemo1.Lines.Add(dmreportes.qryConfReportesDESCRIPCION.Value);
      if dmInventario.qryRepAlquilerMaster.RecordCount = 1 then
      qckCompAlquiler.Page.Length:= 5
      else
      if dmInventario.qryRepAlquilerMaster.RecordCount >= 2 then
      qckCompAlquiler.Page.Length:= qckCompAlquiler.Page.Length +
      (dmInventario.qryRepAlquilerMaster.RecordCount - 1 ) * 0.25;

      flag:= True;
      dmInventario.qryRepAlquilerMaster.DisableControls;
      try
        qckCompAlquiler.Prepare;
      except
      end;
      //rxdbgrid1.Enabled:=False;
      if (dmInventario.qryRepAlquilerMaster.RecordCount > 1) or (qckCompAlquiler.PageNumber > 1) then
      begin
        repeat
          begin
            if (qckCompAlquiler.PageNumber > 1) then
            begin
              qckCompAlquiler.Page.Length:=qckCompAlquiler.Page.Length + 0.25;
              qckCompAlquiler.Prepare;
              flag:=False;
            end else break;
          end;
        until flag = true;
      end;
      dmInventario.qryRepAlquilerMaster.EnableControls;

      qckCompAlquiler.TPag.Caption:=  IntToStr(qckCompAlquiler.PageNumber);
      if (dmreportes.qryConfReportesImpReciboSinPreg.Value = 1) then
      qckCompAlquiler.Print
      else
      if MessageDlg('Imprimir?',mtInformation, [mbYes, mbNo], 0)=mryes then
      begin
        //if (GlbImprimeReciboFact = 1) then
        //begin
          qckCompAlquiler.PrinterSetup;
          qckCompAlquiler.Print;
        //end;
      end else
      qckCompAlquiler.Preview;

      if ((dmInventario.tblAlquilerMasterINV_UPD.Value = 'A') OR
         (dmInventario.tblAlquilerMasterINV_UPD.AsVariant = null )) then
      begin
        ActualizaInventario;
        dmInventario.tblAlquilerMaster.Edit;
        dmInventario.tblAlquilerMasterINV_UPD.Value:='R';
        GlbSalvarQuery(dmInventario.tblAlquilerMaster);
      end;
      //reciboImpreso:=True;
      if (dmreportes.qryConfReportesENVIAR_EMAIL.Value = 1) or (GlbLogRecibos = 1) then
      begin
        if dmreportes.esReimpreso then
        ReportExport(qckCompAlquiler,GlbRutaInformes+'\Re_Alquiler' + 'Num'+dmInventario.qryRepAlquilerMaster.Params[0].AsString+'TrnNum'+dmInventario.qryRepAlquilerMasterIDSERIE.AsString+'.pdf')
        else
        ReportExport(qckCompAlquiler,GlbRutaInformes+'\Re_Alquiler' + 'Num'+dmInventario.qryRepAlquilerMaster.Params[0].AsString+'TrnNum_'+dmInventario.qryRepAlquilerMasterIDSERIE.AsString+'.pdf');
      end;
    finally
    qckCompAlquiler.Free;
    qckCompAlquiler:=Nil;
    end;
  Except
  end;
end;

procedure TfrmAlquiler.BitBtn16Click(Sender: TObject);
begin
  GetAnyDate1.FechaCierre:= ExtraerFecha(GlbFechaTrnDiaria);
  if GetAnyDate1.Execute then
  begin
    dmInventario.tblAlquilerDet.Close;
    dmInventario.tblAlquilerMaster.Close;
    dmInventario.tblAlquilerMaster.Params[0].AsDate:= ExtraerFecha(GetAnyDate1.Fecha);
    dmInventario.tblAlquilerMaster.Params[1].AsDate:= ExtraerFecha(GetAnyDate1.FechaFinal);
    dmInventario.tblAlquilerMaster.Params[2].AsInteger:= tripoTrn;
    dmInventario.tblAlquilerMaster.Params[3].AsInteger:= tripoTrn;
    dmInventario.tblAlquilerMaster.Open;
  end;
end;

procedure TfrmAlquiler.DBEdit4Exit(Sender: TObject);
begin
  if dmInventario.tblAlquilerDet.state in [dsbrowse, dsInactive] then Exit;
  if (dmInventario.tblAlquilerDetMONEDA.Value = '') then exit;
  if (dmInventario.tblAlquilerDetMONEDA.IsNull) then exit;

  if dmInventario.tblInventarioProd.Locate('codigo',
     dmInventario.tblAlquilerDetCOD_PRODUCTO.Value,[]) then
  begin
    dmInventario.tblAlquilerDetMONEDA.Value:=dmInventario.tblInventarioProdCOD_MONEDA.Value;
    MontoPrecio:= dmInventario.tblInventarioProdprecio_alquiler.Value;
  end else raise Exception.Create('Codigo producto no existe, verifique');

  dmInventario.tblAlquilerDetPRECIO_XDIA.Value := MontoPrecio;
  dmInventario.tblAlquilerDetMONTO.Value:=
  (dmInventario.tblAlquilerDetCANT_DIAS.Value * dmInventario.tblAlquilerDetPRECIO_XDIA.Value)*
  dmInventario.tblAlquilerDetcantidad.Value;
  //dmInventario.tblAlquilerDetMONTO_SEGURO.Value :=
  //dmInventario.tblAlquilerDetMONTO.Value;{ *
  //(dmInventario.tblAlquilerDetPORC_SEGURO.Value/100)};

  monedaBase := GetMonedaProducto(dmInventario.tblAlquilerDetCOD_PRODUCTO.Value);

  dmInventario.tblAlquilerDetVALOR_TASA.Value := GlbMontoTasa(dmInventario.tblAlquilerDetMONEDA.Value);
  if Not dmInventario.tblAlquilerMasterMONEDA.IsNull then
    begin
      if (MonedaBase<> dmInventario.tblAlquilerMasterMONEDA.Value) then
      if ((MonedaBase<> '') And (dmInventario.tblAlquilerDetMONEDA.Value <> '')) then
      begin
        dmInventario.tblAlquilerDetValor_Tasa.Value:= GlbMontoTasa(MonedaBase);
        dmInventario.tblAlquilerDetMONTO.Value:= dmInventario.tblAlquilerDetMONTO.Value * dmInventario.tblAlquilerDetValor_Tasa.Value;

        //GlbMontoTasa(rxVentaMonedaBase.Value);
        lblTasa.Caption:=Concat('Tasa 1 = ', InsertarComa(FloatToStr(GlbMontoTasa(MonedaBase))));
        dmInventario.tblAlquilerDetMonto.DisplayFormat:=Concat(SimboloMoneda('1'), ',0.00');
        lblTasa.Visible:=True;
      end;
    end;
  if dmInventario.tblAlquilerDet.State in [dsInsert] then Exit;
end;

procedure TfrmAlquiler.RxDBLookupCombo3Exit(Sender: TObject);
begin
  DBEdit4Exit(Self);
end;

procedure TfrmAlquiler.RxDBGrid1GetCellProps(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor);
begin
  if (Field.fieldName = 'R') then
  Panel1.Caption := 'RECORD CERRADO'
  else if (Field.fieldName = 'A') then
  Panel1.Caption := 'RECORD ABIERTO';
  if (dmInventario.tblAlquilerMasterSTATUS.Value = 'R') then
  begin
    Background := $00F9FAD1;
  end else
  if (dmInventario.tblAlquilerMasterSTATUS.Value = 'C') then
  Background := clSilver;
end;

procedure TfrmAlquiler.ProcAbrir;
begin
  dmInventario.tblAlquilerDet.Close;
  dmInventario.tblAlquilerMaster.Close;
  dmInventario.tblAlquilerMaster.Params[0].AsDate:= ExtraerFecha(GlbFechaTrnDiaria) - 30;
  dmInventario.tblAlquilerMaster.Params[1].AsDate:= ExtraerFecha(GlbFechaTrnDiaria);
  dmInventario.tblAlquilerMaster.Params[2].AsInteger:= tripoTrn;
  dmInventario.tblAlquilerMaster.Params[3].AsInteger:= tripoTrn;
  dmInventario.tblAlquilerMaster.Open;
  dmInventario.tblAlquilerMaster.Next;
  dmInventario.tblAlquilerMaster.Prior;
end;

procedure TfrmAlquiler.BitBtn17Click(Sender: TObject);
begin
  if (dmInventario.tblAlquilerMasterSTATUS.Value = 'R') then
  begin
    raise Exception.Create('Transacción fue procesada en venta, verifique.');
    exit;
  end;

  if (dmInventario.tblAlquilerDetPRECIO_XDIA.Value <= 0) then
  begin
    raise Exception.Create('Favor indicar precio.');
    Exit;
  end;

  if (dmInventario.tblAlquilerMasterNUM_TRNVENTA.Value > 0) then
  begin
    raise Exception.Create('Transaccion fue cerrada, veririque.');
    Exit;
  end;

  if (dmInventario.tblAlquilerMaster.State = dsBrowse) then
  begin
    {t dmInventario.tblAlquilerMaster.Edit;
    dmInventario.tblAlquilerMasterFECHA_ENTRADA.Value := ExtraerFecha(GlbFechaTrnDiaria);
    dmInventario.tblAlquilerMasterFECHA_MOD.Value := Now;
    dmInventario.tblAlquilerMasterMOD_POR.Value   := strUserName;
    //dmInventario.tblAlquilerMasterSTATUS.Value  := 'R';
    dmInventario.tblAlquilerDet.Edit;
    t}
    {dmInventario.tblAlquilerDetCANT_DIAS.Value  := DaysBetween(
    dmInventario.tblAlquilerMasterFECHA_ENTRADA.Value,
    dmInventario.tblAlquilerMasterFecha.Value)+1;}
    Panel1.Caption := 'PROCESAR ENTRADA ALQUILER';
    BitBtn5Click(Self);
    ProcesarEntrada;

    frmProcVentaRapida.NumTrnServ    := 0;
    frmProcVentaRapida.NumTrnServAlq := dmInventario.tblAlquilerMasterIDSERIE.Value;
    frmProcVentaRapida.BitBtn27Click(Self);//Calculo
    frmProcVentaRapida.canCloseAlquiler:=False;
    frmProcVentaRapida.Show;
    frmProcVentaRapida.rxVenta.EnableControls;
    
    frmProcVentaRapida.Refresh;
  end;
end;

procedure TfrmAlquiler.DBDateEdit3Exit(Sender: TObject);
begin
  {if dmInventario.tblAlquilerDet.state = dsInactive then exit;
  if dmInventario.tblAlquilerDet.State = dsbrowse then
   dmInventario.tblAlquilerDet.Edit;
   if (not dmInventario.tblAlquilerMasterFECHA_ENTRADA.IsNull) then
   dmInventario.tblAlquilerDetCANT_DIAS.Value:= DaysBetween(
   dmInventario.tblAlquilerMasterFECHA_ENTRADA.Value,
   dmInventario.tblAlquilerMasterFecha.Value)+1
   else
   if (Not dmInventario.tblAlquilerMasterFECHA_ENT_ESTIMADA.IsNull) then
   dmInventario.tblAlquilerDetCANT_DIAS.Value:= DaysBetween(
   dmInventario.tblAlquilerMasterFECHA_ENT_ESTIMADA.Value,
   dmInventario.tblAlquilerMasterFecha.Value)+1;}
end;

procedure TfrmAlquiler.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if Assigned(frmProcVentaRapida) then
  begin
    CanClose:=True;
    //Hide;
    frmProcVentaRapida.canCloseAlquiler := True;
    frmProcVentaRapida.Show;
  end;
end;

procedure TfrmAlquiler.DBDateEdit2Enter(Sender: TObject);
begin
  if dmInventario.tblAlquilerMasterFECHA_ENT_ESTIMADA.IsNull then
  dmInventario.tblAlquilerMasterFECHA_ENT_ESTIMADA.Value := ExtraerFecha(GlbFechaTrnDiaria)+1;
end;

procedure TfrmAlquiler.DBDateEdit1Exit(Sender: TObject);
begin
  if (Not dmInventario.tblAlquilerMasterFECHA_ENT_ESTIMADA.IsNull) then
  begin
    {if not dmInventario.tblAlquilerDetCANT_DIAS.IsNull then
    begin
      if dmInventario.tblAlquilerDet.State = dsbrowse then
      dmInventario.tblAlquilerDet.Edit;
      dmInventario.tblAlquilerDetCANT_DIAS.Value:= DaysBetween(
      dmInventario.tblAlquilerMasterFECHA_ENT_ESTIMADA.Value,
      dmInventario.tblAlquilerMasterFecha.Value)+1;
    end;
    }
  end;
end;


procedure TfrmAlquiler.PostearEnVentas;
var
  xserie : Integer;
  porItbi : Currency;
begin
  xserie := 0;

  xserie := 0;
  if not Assigned(frmProcVentaRapida) then
  raise Exception.Create('Debe salir al menu principal y regresar.');
  dmCalculos.esFeedback := False;//autoriza ejecuta calculos
  frmProcVentaRapida.sumarDatos := false;
  frmProcVentaRapida.tablaPropietario.Close;
  frmProcVentaRapida.tablaPropietario.Open;
  frmProcVentaRapida.tablaPropietario.Insert;
  frmProcVentaRapida.tablaPropietarioCodigoPropietario.Value := dmInventario.tblAlquilerMasterCOD_CLIENTE.Value;
  //frmProcVentaRapida.tablaPropietarioCodigoPropietario.ReadOnly:=true;
  frmProcVentaRapida.tablaPropietario.Post;
  dmInventario.qryInvLookup.Close;
  dmInventario.qryInvLookup.Open;

  dmInventario.tblAlquilerDet.First;
  While Not dmInventario.tblAlquilerDet.Eof Do
  begin
    //InsertarVentaDetalle;
    Inc(xserie);
    frmProcVentaRapida.rxVenta.Append;

    frmProcVentaRapida.rxVentaTipoVenta.Value := 0;//Item venta;
    if (GlbcodVendedor > 0) then
    frmProcVentaRapida.rxVentaCodUsuario.Value:= GlbcodVendedor
    else
    frmProcVentaRapida.rxVentaCodUsuario.Value := VarUsuarioGlb;

    frmProcVentaRapida.rxVentaglbcodVendedor.Value := frmProcVentaRapida.rxVentaCodUsuario.Value;
    frmProcVentaRapida.rxVentaFecha.Value := ExtraerFecha(GlbFechaTrnDiaria);
    frmProcVentaRapida.rxVentaSerie.Value := xserie;

    //dmInventario.tblAlquilerDetCOD_PRODUCTO.Value;
    frmProcVentaRapida.rxVentaCodUsuario.Value := VarUsuarioGlb;
    frmProcVentaRapida.rxVentaCodArticulo.Value:= dmInventario.tblAlquilerMasterCOD_PROD_ALQ.Value;
    frmProcVentaRapida.rxVentaCodTexto.Value   := dmInventario.tblAlquilerMasterCOD_PROD_ALQ.AsString;

    if dmInventario.qryInvLookup.Locate('codigo', dmInventario.tblAlquilerMasterCOD_PROD_ALQ.Value,[]) then
    begin
      frmProcVentaRapida.rxVentaDescripcion.Value:= dmInventario.qryInvLookupDESCRIPCION.Value;
      frmProcVentaRapida.rxVentaMonedaBase.Value := GetMonedaProducto(frmProcVentaRapida.rxVentaCodArticulo.Value);
      frmProcVentaRapida.rxVentamonto_tasa.Value := GlbMontoTasa(frmProcVentaRapida.rxVentaMonedaBase.Value);

      porItbi := FGlbPorcItbi(ExtraerFecha(frmProcVentaRapida.rxVentaFecha.Value), frmProcVentaRapida.rxVentaCodArticulo.Value);
      frmProcVentaRapida.rxVentaIDTasaITBIS.Value  := GlbIDTasa;

      frmProcVentaRapida.rxVentaCostoProducto.Value:= dmInventario.qryInvLookupprecio_compra.Value;
    end;

    frmProcVentaRapida.rxVentaCant.Value     := dminventario.tblAlquilerDetCANT_DIAS.Value *
    dminventario.tblAlquilerDetCANTIDAD.Value;
    frmProcVentaRapida.rxVentaPrecio.Value   := dminventario.tblAlquilerDetPRECIO_XDIA.Value;
    frmProcVentaRapida.rxVentaporc_desc.Value:= 0;
    //frmProcVentaRapida.rxVentaRecargo.Value  :=  dminventario.tblAlquilerDetMONTO_SEGURO.Value;
    frmProcVentaRapida.rxVentaRecargo.Value  :=  0;
    frmProcVentaRapida.rxVentaStatus.Value:='A';

    frmProcVentaRapida.rxVentaDescripcionEspecial.Value :=
    dmInventario.tblAlquilerDetCOD_PRODUCTO.AsString+'-'+
    frmProcVentaRapida.rxVentaDescripcion.Value+chr(10)+
    'Cantidad de articulos en Alquiler: '+dminventario.tblAlquilerDetcantidad.AsString+'.'+chr(10);

    if dmInventario.qryInvLookup.Locate('codigo', dmInventario.tblAlquilerDetCOD_PRODUCTO.Value,[]) then
    begin
      //frmProcVentaRapida.rxVentaDescripcionEspecial.Value :=
      //frmProcVentaRapida.rxVentaDescripcionEspecial.Value+
      //dmInventario.qryInvLookupDESCRIPCION.Value+chr(10);
      frmProcVentaRapida.rxVentaDescripcion.Value:=dmInventario.qryInvLookupDESCRIPCION.Value;
    end;
    if (dminventario.tblAlquilerDet.Bof) And (frmProcVentaRapida.rxVenta.RecordCount > 0) then
    begin
      dmCalculos.esFeedback := False;
      frmProcVentaRapida.sumarDatos := True;
    end;

    if frmProcVentaRapida.rxVenta.State In [dsEdit, dsInsert] then
    frmProcVentaRapida.rxVenta.Post;

    frmProcVentaRapida.DBEdit1Exit(Self);

    dminventario.tblAlquilerDet.Next;
  end;
  if frmProcVentaRapida.Totales.State = dsBrowse then
  frmProcVentaRapida.Totales.Edit;
  frmProcVentaRapida.TotalesComentario.Value := dmInventario.tblAlquilerMasterOBSERVACION.Value;
  //frmProcVentaRapida.TotalesRecargo.Value := dminventario.tblAlquilerDetMONTO_SEGURO.Value;
  frmProcVentaRapida.AsignaNCFCFinal;

  frmProcVentaRapida.RxDBGrid1.EnableScroll;

end;

procedure TfrmAlquiler.ProcesarEntrada;
var
  guardarRec : TBookMark;
begin
  guardarRec:= dmInventario.tblAlquilerMaster.GetBookmark;
  PostearEnVentas;

  dmInventario.tblAlquilerMaster.GotoBookmark(guardarRec);
  dmInventario.tblAlquilerMaster.FreeBookmark(guardarRec);
  if Assigned(frmProcVentaRapida) then
  begin
    frmProcVentaRapida.SumarDatos := True;
    dmCalculos.esFeedback := True;
    //t frmProcVentaRapida.BitBtn27Click(Self);
  end;
end;

procedure TfrmAlquiler.EliminarDetalle1Click(Sender: TObject);
begin
  if dmInventario.tblAlquilerDet.State in [dsBrowse] then
  begin
    if (dmInventario.tblAlquilerMasterSTATUS.Value = 'A') then
    begin
      if MessageDlg('Eliminar record?',mtWarning,[mbYes,mbNo],0) = mryes then
      begin
        dmInventario.tblAlquilerDet.Delete;
        GlbSalvarQuery(dmInventario.tblAlquilerDet);
      end;
    end;
  end;
end;

procedure TfrmAlquiler.DBDateEdit2Exit(Sender: TObject);
begin
  DBDateEdit3Exit(Self);
end;

procedure TfrmAlquiler.ActualizaInventario;
begin
  ibStpActualizaInvProd.Params[0].Value:= dmInventario.tblAlquilerDetCOD_PRODUCTO.Value;
  ibStpActualizaInvProd.Params[1].Value:= dmInventario.tblAlquilerDetCANTIDAD.Value;
  ibStpActualizaInvProd.Params[2].Value:= 0;//tipoTrn
  ibStpActualizaInvProd.Params[3].Value:= 1;//porCodigo
  if
    //(rxVentaInvetariar.Value <> 0) And
    (GlbCodDivInventario = 1 ) then
    ibStpActualizaInvProd.ExecProc;
    if not ibStpActualizaInvProd.Transaction.InTransaction then
    ibStpActualizaInvProd.Transaction.StartTransaction;
    try
      ibStpActualizaInvProd.Transaction.CommitRetaining;
    except
    ibStpActualizaInvProd.Transaction.RollbackRetaining;
    end;
    //if (rxVentaTipoVenta.Value = 0) or (rxVentaTipoVenta.IsNull )  then //Item de Venta
    //ActualizaInvAlmacen;
end;

procedure TfrmAlquiler.BitBtn18Click(Sender: TObject);
begin
  frmListadoServXTipo:= TfrmListadoServXTipo.Create(Nil);
  try
    if frmListadoServXTipo.ShowModal = mrOk then
    begin
      labelCretrioRep:='';
      frmListadoServXTipo.orderTipo:= 2;
      frmListadoServXTipo.AbrirDatos;
      if frmListadoServXTipo.qryStatusAlquilerMaster.RecordCount > 0 then
      begin
        qckListaServtXTipo:=TqckListaServtXTipo.Create(Nil);
        try
          qckListaServtXTipo.qrLabelCriterioDatos.Caption:= labelCretrioRep;
          qckListaServtXTipo.Preview;
        finally
        qckListaServtXTipo.Free;
        qckListaServtXTipo:=Nil;
        end;
      end else
      MessageDlg('No existe data con criterio seleccionado.', mtInformation,[mbOk],0);
    end;
  finally
  frmListadoServXTipo.Free;
  frmListadoServXTipo:=Nil;
  end;
end;

procedure TfrmAlquiler.BitBtn19Click(Sender: TObject);
begin
  frmListadoServXTipoBuscar:= TfrmListadoServXTipoBuscar.Create(Nil);
  try
    if frmListadoServXTipoBuscar.ShowModal = mrOk then
    begin
      labelCretrioRep:='';
      frmListadoServXTipoBuscar.orderTipo:= 2;
      //frmListadoServXTipoBuscar.AbrirDatos;
      if frmListadoServXTipoBuscar.qryStatusAlquilerMaster.RecordCount > 0 then
      begin
        dmInventario.tblAlquilerDet.Close;
        dmInventario.tblAlquilerMaster.Close;
        dmInventario.tblAlquilerMaster.Params[0].AsDate:=
        ExtraerFecha(frmListadoServXTipoBuscar.qryStatusAlquilerMasterFECHA.Value);
        dmInventario.tblAlquilerMaster.Params[1].AsDate:=
        ExtraerFecha(frmListadoServXTipoBuscar.qryStatusAlquilerMasterFECHA.Value);
        dmInventario.tblAlquilerMaster.Params[2].AsInteger:=
        frmListadoServXTipoBuscar.qryStatusAlquilerMasterTIPOTRN.Value;
        dmInventario.tblAlquilerMaster.Params[3].AsInteger:=
        frmListadoServXTipoBuscar.qryStatusAlquilerMasterTIPOTRN.Value;
        dmInventario.tblAlquilerMaster.Open;
        dmInventario.tblAlquilerMaster.Locate('IDSERIE',
        frmListadoServXTipoBuscar.qryStatusAlquilerMasterIDSERIE.Value,[]);
      end else
      MessageDlg('No existe data con criterio seleccionado.', mtinformation,[mbok],0);
    end;
  finally
  frmListadoServXTipoBuscar.Free;
  frmListadoServXTipoBuscar:=Nil;
  end;
end;

end.
