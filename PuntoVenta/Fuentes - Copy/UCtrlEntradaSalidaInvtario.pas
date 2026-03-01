unit UCtrlEntradaSalidaInvtario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RxLookup, ExtCtrls, Grids, DBGrids, DBCtrls, StdCtrls, Buttons,
  db, Mask, rxToolEdit, RXDBCtrl, RXCtrls, ComCtrls, WinSkinData, GetAnyDate,
  RxDBComb, RxMemDS;

type
  TfrmCtrlEntSalInv = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBStatusLabel1: TDBStatusLabel;
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
    BitBtn14: TBitBtn;
    BitBtn15: TBitBtn;
    BitBtn16: TBitBtn;
    GetAnyDate1: TGetAnyDate;
    BitBtn17: TBitBtn;
    DBDateEdit2: TDBDateEdit;
    Label10: TLabel;
    Label11: TLabel;
    DBEdit4: TDBEdit;
    Label19: TLabel;
    RxDBComboBox1: TRxDBComboBox;
    rxTotales: TRxMemoryData;
    rxTotalesMonto: TCurrencyField;
    Label12: TLabel;
    DataSource1: TDataSource;
    DBText1: TDBText;
    DBEdit5: TDBEdit;
    Label13: TLabel;
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
    procedure BitBtn17Click(Sender: TObject);
    procedure PageControl1Enter(Sender: TObject);
    procedure TabSheet1Enter(Sender: TObject);
    procedure DBEdit4Exit(Sender: TObject);
    procedure DBEdit5Exit(Sender: TObject);
  private
    { Private declarations }
    procedure Imprimir(tipo : smallint);
    procedure ImprimePOS(tipo : smallint);
    procedure ActualizaInventario(tipo:Smallint);
    procedure ActualizaKardex(tipo:smallint;cant:integer);
    procedure ProcSumar;
  public
    { Public declarations }
    tripoTrn : smallint;
    tipoOpe  : smallint;
    esEntrada : boolean;
  end;

var
  frmCtrlEntSalInv: TfrmCtrlEntSalInv;

implementation

uses UDatModInventario, qckRepReparacionRecibo, uglobal,
  UBuscarProveedores, UConsultaInventario, //URepComprobante,
  UDatModReportes, qckRepLavanderiaRecibo, UDatosVentas;

{$R *.dfm}

procedure TfrmCtrlEntSalInv.BitBtn10Click(Sender: TObject);
begin
  dmInventario.tblReparacionesMaster.Prior;
  ProcSumar;
end;

procedure TfrmCtrlEntSalInv.BitBtn11Click(Sender: TObject);
begin
  dmInventario.tblReparacionesMaster.Next;
  ProcSumar;
end;

procedure TfrmCtrlEntSalInv.BitBtn12Click(Sender: TObject);
begin
  dmInventario.tblReparacionesMaster.Last;
  ProcSumar;
end;

procedure TfrmCtrlEntSalInv.BitBtn9Click(Sender: TObject);
begin
  dmInventario.tblReparacionesMaster.First;
  ProcSumar;
end;

procedure TfrmCtrlEntSalInv.btnCancelarClick(Sender: TObject);
begin
  if dmInventario.tblReparacionesDet.State in [dsEdit, dsInsert] then
  dmInventario.tblReparacionesDet.cancel;
  if dmInventario.tblReparacionesMaster.State in [dsEdit, dsInsert] then
  dmInventario.tblReparacionesMaster.Cancel;
end;

procedure TfrmCtrlEntSalInv.btnCerarAbrirresClick(Sender: TObject);
begin
  if dmInventario.tblReparacionesMaster.State In [dsBrowse, dsInactive] then
  begin
    dmInventario.tblReparacionesMaster.Close;
    dmInventario.tblReparacionesMaster.Open;
  end;
end;

procedure TfrmCtrlEntSalInv.btnInsertarClick(Sender: TObject);
begin
  esEntrada:=False;
  if dmInventario.tblReparacionesMaster.State = dsBrowse then
  begin
    rxTotales.Close;
    rxTotales.Open;
    dmInventario.tblReparacionesMaster.Insert;
    dmInventario.tblReparacionesMastertipo_ope.Value := tipoOpe;
    dmInventario.tblReparacionesMasterSTATUS.Value  := 'A';
    dmInventario.tblReparacionesMasterTIPO_TRN.Value:= tripoTrn;
    dmInventario.tblReparacionesMasterFECHA.Value := ExtraerFecha(GlbFechaTrnDiaria);
    //dmInventario.tblReparacionesMasterFECHA_IN.Value:= Now;
    //dmInventario.tblReparacionesMasterIN_POR.Value  := StrUserName;
    //DBLookupComboBox3.SetFocus;
    if dmInventario.tblReparacionesDet.State = dsBrowse then
    begin
      dmInventario.tblReparacionesDet.Insert;
      dmInventario.tblReparacionesDetCANTIDAD.Value:=1;
      dmInventario.tblReparacionesDetFECHA_IN.Value:= now;
      Edit1.enabled:=true;
      dmInventario.tblReparacionesDetSTATUS.Value := 'A';
      DBDateEdit1.SetFocus;
    end;
    BitBtn1.Enabled:=true;
    RxDBLookupCombo1.SetFocus;
  end;
end;

procedure TfrmCtrlEntSalInv.btnModificarClick(Sender: TObject);
begin
  if dmInventario.tblReparacionesMaster.State = dsBrowse then
  dmInventario.tblReparacionesMaster.Edit;
end;

procedure TfrmCtrlEntSalInv.btnSalvarClick(Sender: TObject);
var
  actInv : boolean;
  esSalida : boolean;
begin
  //if dmInventario.tblReparacionesMaster.State In [dsInsert] then
  //esSalida := True else esSalida := False;
  esSalida:=False;esEntrada:=False;
  if dmInventario.tblReparacionesMasterTIPO_TRN.Value = 1 then //SALIDA
  esSalida:=True else
    if dmInventario.tblReparacionesMasterTIPO_TRN.Value = 2 then //SALIDA
  esEntrada:=True;

  if dmInventario.tblReparacionesMaster.State In [dsEdit, dsInsert] then
  begin
    if (dmInventario.tblReparacionesMasterINV_UPD.Value = 'A') Or
    (dmInventario.tblReparacionesMasterINV_UPD.IsNull) then
    begin
      actInv:=True;
      dmInventario.tblReparacionesMasterINV_UPD.Value := 'R';
    end else actInv:=False;
    dmInventario.tblReparacionesMaster.Post;
    dmInventario.tblReparacionesMaster.ApplyUpdates;
    if not dmInventario.tblReparacionesMaster.Transaction.InTransaction then
    dmInventario.tblReparacionesMaster.Transaction.StartTransaction;
    try
      dmInventario.tblReparacionesMaster.Transaction.CommitRetaining;
    except
    dmInventario.tblReparacionesMaster.Transaction.RollbackRetaining;
    end;
    if actInv then
    begin
      if esSalida then
      ActualizaInventario(1) //salida
      else if esEntrada then
      ActualizaInventario(2); //entrada
    end;
    esEntrada:=false;
    esSalida:=False;
  end;
end;

procedure TfrmCtrlEntSalInv.BitBtn1Click(Sender: TObject);
begin
  if dmInventario.tblReparacionesDet.State = dsBrowse then
  begin
    dmInventario.tblReparacionesDet.Insert;
    dmInventario.tblReparacionesDetFECHA_IN.Value:= Now;
    Edit1.enabled:=true;
    dmInventario.tblReparacionesDetSTATUS.Value := 'A';
    DBDateEdit1.SetFocus;
  end;
end;

procedure TfrmCtrlEntSalInv.BitBtn2Click(Sender: TObject);
begin
  if dmInventario.tblReparacionesDet.State = dsBrowse then
  dmInventario.tblReparacionesDet.Edit;
end;

procedure TfrmCtrlEntSalInv.BitBtn4Click(Sender: TObject);
begin
  if dmInventario.tblReparacionesDet.State in [dsEdit, dsInsert] then
  dmInventario.tblReparacionesDet.cancel;
  ProcSumar;  
end;

procedure TfrmCtrlEntSalInv.BitBtn5Click(Sender: TObject);
begin
  if dmInventario.tblReparacionesMaster.State in [dsEdit, dsInsert] then
  begin
    btnSalvarClick(Self);
  end;

  if dmInventario.tblReparacionesDet.State In [dsEdit, dsInsert] then
  begin
    if dmInventario.tblReparacionesDet.State = dsInsert then
    begin
      dmInventario.tblReparacionesDetNUMERO.Value:=
      dmInventario.tblReparacionesMasterNUMERO.Value;
    end;
    dmInventario.tblReparacionesDet.Post;
    dmInventario.tblReparacionesDet.ApplyUpdates;
    if not dmInventario.tblReparacionesDet.Transaction.InTransaction then
    dmInventario.tblReparacionesDet.Transaction.StartTransaction;
    try
      dmInventario.tblReparacionesDet.Transaction.CommitRetaining;
    except
    dmInventario.tblReparacionesDet.Transaction.RollbackRetaining;
    end;
  end;
  ProcSumar;  
end;

procedure TfrmCtrlEntSalInv.BitBtn6Click(Sender: TObject);
begin
  if dmInventario.tblReparacionesDet.State in [dsInactive, dsBrowse] then
  begin
    dmInventario.tblReparacionesDet.Close;
    dmInventario.tblReparacionesDet.Open;
    ProcSumar;
  end;
end;

procedure TfrmCtrlEntSalInv.FormCreate(Sender: TObject);
begin
  dmInventario.tblTipoTrn.Close;
  dmInventario.tblTipoTrn.Open;
  dmInventario.qryProveedores.Close;
  dmInventario.qryProveedores.Filtered:=False;
  dmInventario.qryProveedores.Tag:=glbCia_Key;
  //dmInventario.qryProveedores.Filtered:=True;
  //dmInventario.qryProveedores.Params[0].Value:=glbCia_Key;
  dmInventario.qryProveedores.Open;

  dmInventario.tblReparacionesMaster.Close;
  dmInventario.tblReparacionesMaster.Params[0].AsDate:= ExtraerFecha(GlbFechaTrnDiaria) - 30;
  dmInventario.tblReparacionesMaster.Params[1].AsDate := ExtraerFecha(GlbFechaTrnDiaria);
  dmInventario.tblReparacionesMaster.Params[2].Value:= tipoOpe;
  dmInventario.tblReparacionesMaster.Params[3].Value:= tipoOpe;
  dmInventario.tblReparacionesMaster.Open;
  dmInventario.tblInventarioProd.Close;
  dmInventario.tblInventarioProd.SelectSQL.Text := dmInventario.qryInvProd_Base.Sql.Text;
  dmInventario.tblInventarioProd.Params[0].Value:=glbCia_Key;
  dmInventario.tblInventarioProd.Open; 
end;

procedure TfrmCtrlEntSalInv.Edit1Exit(Sender: TObject);
begin
  if (edit1.Text = '') then exit;
  if Not dmInventario.tblInventarioProd.Locate('codigo', strToInt(edit1.Text),[]) then
  MessageDlg('Codigo no encontrado, verifique', mtInformation, [mbOK], 0)
  else
  begin
    if dmInventario.tblReparacionesDet.state in [dsedit, dsinsert] then
    dmInventario.tblReparacionesDetCOD_PRODUCTO.Value:= StrToInt(edit1.Text);
  end;
end;

procedure TfrmCtrlEntSalInv.RxDBLookupCombo3Change(Sender: TObject);
begin
  Edit1.Text := dmInventario.tblInventarioProdCODIGO.AsString;
  //if (GlBCuadros = 1) then
  if dmInventario.tblReparacionesDet.State in [dsEdit, dsInsert] then
  begin
    dmInventario.tblReparacionesDetPRECIO.Value:= dmInventario.tblInventarioProdPRECIO_COMPRA.Value;
    dmInventario.tblReparacionesDetMONTO_SERVICIO.Value:=
    dmInventario.tblReparacionesDetCANTIDAD.Value * dmInventario.tblReparacionesDetPRECIO.Value;
  end;
end;

procedure TfrmCtrlEntSalInv.BitBtn8Click(Sender: TObject);
begin
  ImprimePOS(0);
end;

procedure TfrmCtrlEntSalInv.Imprimir(tipo: smallint);
begin                                                    //tipo = 1 = re-imprimir
  if (not dmInventario.tblReparacionesMasterNUMERO.IsNull) And (tipo = 0) then
  begin
    dmInventario.qryRepRepMaster.Close;
    dmInventario.qryRepRepMaster.Params[0].Value :=
    dmInventario.tblReparacionesMasterNUMERO.Value;
    dmInventario.qryRepRepMaster.Open;
  end else
  begin
    dmInventario.qryRepRepMaster.Close;
    dmInventario.qryRepRepMaster.Params[0].Value :=
    StrToInt(Inputbox('Re-imprimir Comprobante','Entre número',''));
    dmInventario.qryRepRepMaster.Open;
  end;
  qckReciboLavanderia:=TqckReciboLavanderia.create(nil);
  try
  qckReciboLavanderia.Preview;
  finally
  qckReciboLavanderia.Free;
  qckReciboLavanderia:=Nil;
  end;
end;

procedure TfrmCtrlEntSalInv.BitBtn13Click(Sender: TObject);
begin
  ImprimePOS(1);
end;

procedure TfrmCtrlEntSalInv.BitBtn14Click(Sender: TObject);
begin
  frmProcBuscarProv:=TfrmProcBuscarProv.Create(Nil);
  try
    if frmProcBuscarProv.Showmodal = mrOk then
    begin
      if dmInventario.tblReparacionesMaster.State In [dsEdit, dsInsert] then
      dmInventario.tblReparacionesMasterCOD_PROVEEDOR.Value := frmProcBuscarProv.xCodigoCte;
    end;
  finally
  frmProcBuscarProv.Free;
  frmProcBuscarProv:=Nil;
  end;
end;

procedure TfrmCtrlEntSalInv.BitBtn15Click(Sender: TObject);
begin
  frmConsultaInventario:=TfrmConsultaInventario.Create(Nil);
  try
    if frmConsultaInventario.Showmodal = mrOk then
    begin
      if dmInventario.tblReparacionesDet.State in [dsEdit, dsInsert] then
      begin
        edit1.Text := frmConsultaInventario.ibquery1codigo.AsString;
        if dmInventario.tblInventarioProd.Locate('codigo', strToInt(edit1.Text),[]) then
        begin
          if dmInventario.tblReparacionesDet.State in [dsEdit, dsInsert] then
          begin
            dmInventario.tblReparacionesDetCOD_PRODUCTO.Value:=frmConsultaInventario.ibquery1codigo.Value;
            dmInventario.tblReparacionesDetPRECIO.Value:= dmInventario.tblInventarioProdPRECIO_COMPRA.Value;
            dmInventario.tblReparacionesDetMONTO_SERVICIO.Value:=
            dmInventario.tblReparacionesDetCANTIDAD.Value * dmInventario.tblReparacionesDetPRECIO.Value;
          end;
        end;
      end;
    end;
  finally
  frmConsultaInventario.Free;
  frmConsultaInventario:= nil;
  end;
end;

procedure TfrmCtrlEntSalInv.ImprimePOS(tipo: smallint);
var
  Flag : boolean;
begin
  //GlbEsRecibo:=True;
  dmreportes.qryConfReportes.Close;
  dmreportes.qryConfReportes.Params[0].Value:=tipoope;
  dmreportes.qryConfReportes.Open;
  if (not dmInventario.tblReparacionesMasterNUMERO.IsNull) And (tipo = 0) then
  begin
    dmInventario.qryRepRepMaster.Close;
    dmInventario.qryRepRepMaster.Params[0].Value :=
    dmInventario.tblReparacionesMasterNUMERO.Value;
    dmInventario.qryRepRepMaster.Open;
  end else
  begin
    dmInventario.qryRepRepMaster.Close;
    dmInventario.qryRepRepMaster.Params[0].Value :=
    StrToInt(Inputbox('Re-imprimir comprobante','Entre número',''));
    dmInventario.qryRepRepMaster.Open;
  end;
    
  //Para futura configuracion tamaño reporte
  //if (dmreportes.qryConfReportesSIZE_REP.Value = 1) then
  //begin
    qckReciboLavanderia:=TqckReciboLavanderia.Create(nil);
    try
      //ActivaCampos;
      //if not dmreportes.qryConfReportesNOTA_PIE_PAGINA.IsNull then
      //qckReciboLavanderia.QRLabel27.Caption:= dmreportes.qryConfReportesNOTA_PIE_PAGINA.Value;
      if dmreportes.qryRepRepMaster.RecordCount = 1 then
      qckReciboLavanderia.Page.Length:= 5
      else
      if dmInventario.qryRepRepMaster.RecordCount >= 2 then
      qckReciboLavanderia.Page.Length:= qckReciboLavanderia.Page.Length +
      (dmInventario.qryRepRepMaster.RecordCount - 1 ) * 0.25;

      flag:=true;
      qckReciboLavanderia.Prepare;
      dmreportes.qryRepRepMaster.DisableControls;
      //rxdbgrid1.Enabled:=False;
      if (dmreportes.qryRepRepMaster.RecordCount > 1) or (qckReciboLavanderia.PageNumber > 1) then
      begin
        repeat
          begin
            if (qckReciboLavanderia.PageNumber > 1) then
            begin
              qckReciboLavanderia.Page.Length:=qckReciboLavanderia.Page.Length + 0.25;
              qckReciboLavanderia.Prepare;
              flag:=False;
            end else break;
          end;
        until flag = true;
      end;
      dmreportes.qryRepRepMaster.EnableControls;

      qckReciboLavanderia.TPag.Caption:=  IntToStr(qckReciboLavanderia.PageNumber);
      if (dmreportes.qryConfReportesImpReciboSinPreg.Value = 1) then
      begin
        qckReciboLavanderia.PrinterSetup;
        qckReciboLavanderia.Print;
        dmInventario.tblReparacionesMaster.Edit;
        dmInventario.tblReparacionesMasterSTATUS.Value:='R';
      end else
      if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0)=mryes then
      begin
        //if (GlbImprimeReciboFact = 1) then
        //begin
          qckReciboLavanderia.PrinterSetup;
          qckReciboLavanderia.Print;
          dmInventario.tblReparacionesMaster.Edit;
          dmInventario.tblReparacionesMasterSTATUS.Value:='R';
        //end;
      end else
      begin
        qckReciboLavanderia.Preview;
        dmInventario.tblReparacionesMaster.Edit;
        dmInventario.tblReparacionesMasterSTATUS.Value:='R';        
      end;
      //reciboImpreso:=True;
      if (dmreportes.qryConfReportesENVIAR_EMAIL.Value = 1) or (GlbLogRecibos = 1) then
      begin
        if dmreportes.esReimpreso then
        ReportExport(qckReciboLavanderia,GlbRutaInformes+'\Re_Comprobante' + 'Num'+dmInventario.qryRepRepMaster.Params[0].AsString+'TrnNum'+dmInventario.qryRepRepMasterNUMERO.AsString+'.pdf')
        else
        ReportExport(qckReciboLavanderia,GlbRutaInformes+'\Re_Comprobante' + 'Num'+dmInventario.qryRepRepMaster.Params[0].AsString+'TrnNum_'+dmInventario.qryRepRepMasterNUMERO.AsString+'.pdf');
      end;
    finally
    qckReciboLavanderia.Free;
    qckReciboLavanderia:=Nil;
    end;
    btnSalvarClick(Self);
end;

procedure TfrmCtrlEntSalInv.BitBtn16Click(Sender: TObject);
begin
  GetAnyDate1.FechaCierre:= ExtraerFecha(GlbFechaTrnDiaria);
  if GetAnyDate1.Execute then
  begin
    dmInventario.tblReparacionesMaster.Close;
    dmInventario.tblReparacionesMaster.Params[0].AsDate:= ExtraerFecha(GetAnyDate1.Fecha);
    dmInventario.tblReparacionesMaster.Params[1].AsDate:= ExtraerFecha(GetAnyDate1.FechaFinal);
    dmInventario.tblReparacionesMaster.Params[2].Value:= 0;
    dmInventario.tblReparacionesMaster.Params[3].Value:= 100;
    dmInventario.tblReparacionesMaster.Open;
  end;
end;

procedure TfrmCtrlEntSalInv.BitBtn17Click(Sender: TObject);
begin
  if Not dmInventario.tblReparacionesMasterFECHA_ENTRADA.IsNull then Exit;

  if dmInventario.tblReparacionesMasterNUMERO.IsNull then Exit;
  if dmInventario.tblReparacionesMaster.State in [dsInsert] then Exit;
  if dmInventario.tblReparacionesMasterFECHA_ENTRADA.IsNull then
  begin
    dmInventario.tblReparacionesMaster.Edit;
    dmInventario.tblReparacionesMasterFECHA_ENTRADA.Value := ExtraerFecha(GlbFechaTrnDiaria);
    esEntrada:= True;
    DBDateEdit2.SetFocus;
  end;
end;

procedure TfrmCtrlEntSalInv.ActualizaInventario(tipo:Smallint);
begin
  dmInventario.tblInventarioProd.Close;
  dmInventario.tblInventarioProd.SelectSQL.Text := dmInventario.qryInvProd_Base.Sql.Text;
  dmInventario.tblInventarioProd.Params[0].Value:=glbCia_Key;
  dmInventario.tblInventarioProd.Open;
  if dmInventario.tblInventarioProd.Locate('CODIGO', dmInventario.tblReparacionesDetCOD_PRODUCTO.Value,[]) then
  begin
    dmInventario.tblInventarioProd.Edit;
    dmInventario.tblInventarioProdFECHA_ULTIMA_TRN.Value:=ExtraerFecha(Date);
    if (tipo = 1) then
    begin
      dmInventario.tblInventarioProdCANTIDAD.Value:=
      dmInventario.tblInventarioProdCANTIDAD.Value - dmInventario.tblReparacionesDetCantidad.Value;
      ActualizaKardex(1,dmInventario.tblReparacionesDetCantidad.Value);
    end else
    begin
      dmInventario.tblInventarioProdCANTIDAD.Value:=
      dmInventario.tblInventarioProdCANTIDAD.Value + dmInventario.tblReparacionesDetCantidad.Value;
      ActualizaKardex(2,dmInventario.tblReparacionesDetCantidad.Value);
    end;
    GlbSalvarQuery(dmInventario.tblInventarioProd);

    dmInventario.tblInventarioProd.Close;
    dmInventario.tblInventarioProd.SelectSQL.Text := dmInventario.qryInvProd_Base.Sql.Text;
    dmInventario.tblInventarioProd.Params[0].Value:=glbCia_Key;
    dmInventario.tblInventarioProd.Open;
  end;
end;

procedure TfrmCtrlEntSalInv.ActualizaKardex(tipo:smallint;cant:integer);
begin
  try
    if dmInventario.tblInventarioProdINVENTARIAR.Value = 1 then

    dmVentas.Proc_InsertarKardexDet(
    glbCia_Key,
    tipo, //TIPO SMALLINT,  --1-Entradas 2-Salida
    7, //TIPO_OPE SMALLINT,--1-Orden Compra 2-Venta 3-Devolucion 4-Transferencia 5-Dañado 6-Donacion 7-Otro
    now,
    dmInventario.tblInventarioProdCODIGO.Value, //CODIGO_PRODUCTO :integer;
    cant,
    dmInventario.tblInventarioProdPRECIO_COMPRA.Value, //COSTO_PRODUCTO :real;
    dmInventario.tblInventarioProdPRECIO.Value, // PRECIO_VENTA :real;
    VarUsuarioGlb, //CODIGO_USUARIO :integer;
    0,//Numero trn despacho
    'A' //STATUS :string;
    ,'Entrada/Salida No Venta');
  except
  end;
  end;

procedure TfrmCtrlEntSalInv.ProcSumar;
  var
      xbook : TBookmark;
begin
  if dmInventario.tblReparacionesDet.RecordCount = 0 then exit;
  if dmInventario.tblReparacionesDet.State in [dsEdit, dsInsert] then exit;
  rxTotales.Close;
  rxTotales.Open;
  rxTotales.Insert;
  rxTotalesMonto.Value:=0;
  rxTotales.Post;
  dmInventario.tblReparacionesDet.DisableControls;
  xbook := dmInventario.tblReparacionesDet.GetBookmark;
  dmInventario.tblReparacionesDet.First;
  while not dmInventario.tblReparacionesDet.Eof do
  begin
    rxTotales.Edit;
    if not dmInventario.tblReparacionesDetMONTO_SERVICIO.IsNull then
    rxTotalesMonto.Value:=rxTotalesMonto.Value + dmInventario.tblReparacionesDetMONTO_SERVICIO.Value;
    rxTotales.Post;
    dmInventario.tblReparacionesDet.Next;
  end;
  dmInventario.tblReparacionesDet.GotoBookmark(xbook);
  dmInventario.tblReparacionesDet.FreeBookmark(xbook);
  dmInventario.tblReparacionesDet.EnableControls;
end;

procedure TfrmCtrlEntSalInv.PageControl1Enter(Sender: TObject);
begin
  ProcSumar;
end;

procedure TfrmCtrlEntSalInv.TabSheet1Enter(Sender: TObject);
begin
  ProcSumar;
end;

procedure TfrmCtrlEntSalInv.DBEdit4Exit(Sender: TObject);
begin
  if dmInventario.tblReparacionesDet.State in [dsEdit,dsInsert] then
  dmInventario.tblReparacionesDetMONTO_SERVICIO.Value:=
    dmInventario.tblReparacionesDetCANTIDAD.Value * dmInventario.tblReparacionesDetPRECIO.Value;
end;

procedure TfrmCtrlEntSalInv.DBEdit5Exit(Sender: TObject);
begin
  if dmInventario.tblReparacionesDet.State in [dsEdit,dsInsert] then
  dmInventario.tblReparacionesDetMONTO_SERVICIO.Value:=
  dmInventario.tblReparacionesDetCANTIDAD.Value * dmInventario.tblReparacionesDetPRECIO.Value;
end;

end.
