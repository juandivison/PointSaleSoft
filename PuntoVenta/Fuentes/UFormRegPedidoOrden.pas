unit UFormRegPedidoOrden;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Mask, DBCtrls, RxLookup, rxToolEdit, RXDBCtrl,
  IBCustomDataSet, IBQuery, Grids, DBGrids, ExtCtrls, ComCtrls, WinSkinData,
  Buttons, RXCtrls, GetAnyDate;

type
  TfrmPedidosProveedores = class(TForm)
    dstblDespachoMaster: TDataSource;
    dstblDespachoDet: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label2: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label3: TLabel;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit23: TDBEdit;
    DBDateEdit1: TDBDateEdit;
    RxDBLookupCombo3: TRxDBLookupCombo;
    DBEdit2: TDBEdit;
    Shape1: TShape;
    RxDBGrid1: TRxDBGrid;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    Label9: TLabel;
    DBEdit6: TDBEdit;
    Label10: TLabel;
    DBEdit9: TDBEdit;
    Label11: TLabel;
    DBEdit10: TDBEdit;
    Label12: TLabel;
    DBEdit11: TDBEdit;
    Label13: TLabel;
    DBEdit12: TDBEdit;
    qryInventario: TIBQuery;
    qryInventarioPRECIO: TFloatField;
    qryInventarioPAGA_ITBI: TSmallintField;
    qryInventarioDESC_TIPOINV: TIBStringField;
    qryInventarioTIPO: TIntegerField;
    qryInventarioPORC_DESCUENTO: TFloatField;
    qryInventarioCODIGO_TEXTO: TIBStringField;
    qryInventarioCODIGO: TIntegerField;
    qryInventarioCANTIDAD: TFloatField;
    qryInventarioREFERENCIA: TIBStringField;
    qryInventarioPRECIO_COMPRA: TFloatField;
    qryInventarioFECHA_VENCIMIENTO: TDateTimeField;
    qryInventarioPRECIOVENTA1: TFloatField;
    qryInventarioPRECIOVENTA2: TFloatField;
    qryInventarioPRECIOVENTA3: TFloatField;
    qryInventarioPRECIOVENTA4: TFloatField;
    qryInventarioPORCUTILIDAD1: TFloatField;
    qryInventarioPORCUTILIDAD2: TFloatField;
    qryInventarioPORCUTILIDAD3: TFloatField;
    qryInventarioPORCUTILIDAD4: TFloatField;
    qryInventarioDESCRIPCION: TIBStringField;
    dsqryInventario: TDataSource;
    SkinData1: TSkinData;
    RxDBGrid2: TRxDBGrid;
    DBStatusLabel1: TDBStatusLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    DBStatusLabel2: TDBStatusLabel;
    BitBtn7: TBitBtn;
    RxDBLookupCombo4: TRxDBLookupCombo;
    Label34: TLabel;
    GetAnyDate1: TGetAnyDate;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    BitBtn8: TBitBtn;
    RxDBLookupCombo2: TRxDBLookupCombo;
    dsTblFormaPago: TDataSource;
    dstblInventarioProd: TDataSource;
    BitBtn13: TBitBtn;
    Panel1: TPanel;
    Label20: TLabel;
    DBEdit18: TDBEdit;
    Label15: TLabel;
    Shape2: TShape;
    Label18: TLabel;
    DBEdit13: TDBEdit;
    Label19: TLabel;
    DBEdit15: TDBEdit;
    DBText1: TDBText;
    Label21: TLabel;
    DBEdit19: TDBEdit;
    BitBtn35: TBitBtn;
    CheckBox1: TCheckBox;
    TabSheet3: TTabSheet;
    RxDBGrid3: TRxDBGrid;
    qryDatosConsulta: TIBQuery;
    qryDatosConsultaNUMERO_TRN: TIntegerField;
    qryDatosConsultaSERIE_TRN: TIntegerField;
    qryDatosConsultaCODIGO_PROD: TIntegerField;
    qryDatosConsultaCODIGO_TEXTO: TIBStringField;
    qryDatosConsultaCODIGO_BARRA: TIBStringField;
    qryDatosConsultaCODIGO_PROV: TIntegerField;
    qryDatosConsultaDESC_PROVEEDOR: TIBStringField;
    qryDatosConsultaRNC_PROVEEDOR: TIBStringField;
    qryDatosConsultaFECHA: TDateTimeField;
    qryDatosConsultaINVENTARIO_ID: TIntegerField;
    qryDatosConsultaFORMADEPAGO: TIBStringField;
    qryDatosConsultaTIPOPAGO: TSmallintField;
    qryDatosConsultaNUMERO_FACTURA: TIntegerField;
    qryDatosConsultaNCF: TIBStringField;
    qryDatosConsultaMONTO_TOTAL: TFloatField;
    qryDatosConsultaDESCTIPOTRN: TIBStringField;
    qryDatosConsultaTIPO_TRN: TSmallintField;
    qryDatosConsultaDESCRIPCION: TIBStringField;
    qryDatosConsultaDESCTIPOUNIDAD: TIBStringField;
    qryDatosConsultaLOTE_NUM: TIBStringField;
    qryDatosConsultaFECHA_VENCEPROD: TDateTimeField;
    qryDatosConsultaCANT_UNIDADES: TFloatField;
    qryDatosConsultaCANTIDAD: TFloatField;
    qryDatosConsultaCANT_OFERTA: TIntegerField;
    qryDatosConsultaPRECIO_COMPRA: TFloatField;
    qryDatosConsultaVALOR_BRUTO: TFloatField;
    qryDatosConsultaVALOR_TOTAL_DET: TFloatField;
    qryDatosConsultaITBI_DET: TFloatField;
    qryDatosConsultaSTATUS_DET: TIBStringField;
    dsqryDatosConsulta: TDataSource;
    BitBtn14: TBitBtn;
    CheckBox2: TCheckBox;
    dtpkFechaIni: TDateTimePicker;
    dtpkFechaFin: TDateTimePicker;
    Label24: TLabel;
    Label25: TLabel;
    RadioGroup1: TRadioGroup;
    BitBtn15: TBitBtn;
    qryDatosConsulta_Base: TIBQuery;
    ComboBox1: TComboBox;
    Label26: TLabel;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    tblLote: TIBDataSet;
    tblLoteCODIGO: TIntegerField;
    tblLoteLOTE_NUM: TIBStringField;
    tblLoteCODIGO_PROV: TIntegerField;
    tblLoteFECHA: TDateTimeField;
    tblLoteCANT_IN: TIntegerField;
    tblLoteCANT_OUT: TIntegerField;
    tblLoteFECHA_VENCIMIENTO: TDateTimeField;
    tblInv: TIBDataSet;
    tblInvCODIGO: TIntegerField;
    tblInvCODFABRICANTE: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure DBEdit3Change(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn35Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure qryDatosConsultaFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure BitBtn15Click(Sender: TObject);
    procedure TabSheet3Enter(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
  private
    { Private declarations }
    procedure GuardarOrden;
    procedure ProcesaCalcular;
    procedure ProcActualizaLote;
  public
    { Public declarations }
  end;

var
  frmPedidosProveedores: TfrmPedidosProveedores;
  ejeScroll : Boolean;
  edtCodProv : string;
  xcondicion : string;
  esEditando : boolean;
  xCodProvAnt: integer;

implementation

 uses UDatModDespacho, UGlobal, UDatosVentas, UDatModInventario,
  UDatModConectar, URegFpago, UDatModCxp,
  UInventarioProd, UQckReporteFactura, UDatModEmpleados,
  UDatModCompania, UPrecioProdXUnidad, UConsultaInventario,
  UDatModReportes;


{$R *.dfm}

{ TForm1 }

procedure TfrmPedidosProveedores.GuardarOrden;
begin

end;

procedure TfrmPedidosProveedores.FormCreate(Sender: TObject);
begin
  ejeScroll := False;
  dmVentas.tblDespachoMaster.Close;
  dmVentas.tblDespachoMaster.Params[0].Value:=ExtraerFecha(GlbFechaTrnDiaria - 15);
  dmVentas.tblDespachoMaster.Params[1].Value:=ExtraerFecha(GlbFechaTrnDiaria + 15);
  dmVentas.tblDespachoMaster.Open;

  dmVentas.tblDespachoMaster.Next;
  qryInventario.Close;
  qryInventario.Open;
  dmVentas.tblFormaPago.Close;
  dmVentas.tblFormaPago.Open;
  dmInventario.tblInventarioProd.Close;
  dmInventario.tblInventarioProd.SelectSQL.Text := dmInventario.qryInvProd_Base.Sql.Text;
  dmInventario.tblInventarioProd.Params[0].Value := glbCia_Key;
  dmInventario.tblInventarioProd.Open;
  BitBtn10Click(Self);
  BitBtn11Click(Self);
  ejeScroll:=True;

  dmreportes.qryProvInvLook.Close;
  dmreportes.qryProvInvLook.Open;
  dmreportes.qryProvInvLook.First;
  ComboBox1.Clear;
  ComboBox1.Text:='';
  While not dmreportes.qryProvInvLook.Eof do
  begin
    ComboBox1.Items.Add(dmreportes.qryProvInvLookDESCRIPCION.Value);
    dmreportes.qryProvInvLook.Next;
  end;
  ComboBox1Change(Self);

end;

procedure TfrmPedidosProveedores.BitBtn1Click(Sender: TObject);
begin
  if dmVentas.tblDespachoMaster.State = dsBrowse then
  begin
    dmVentas.tblDespachoMaster.Insert;
    //DBEdit2.SetFocus;
  end;
end;

procedure TfrmPedidosProveedores.BitBtn2Click(Sender: TObject);
begin
  if dmVentas.tblDespachoMaster.State = dsBrowse then
  begin
    dmVentas.tblDespachoMaster.Edit;
    xCodProvAnt:= dmVentas.tblDespachoMasterCODIGO_PROV.Value;
    esEditando:=True;
  end;
end;

procedure TfrmPedidosProveedores.BitBtn3Click(Sender: TObject);
begin
  if dmVentas.tblDespachoMaster.State in [dsEdit, dsInsert] then
  dmVentas.tblDespachoMaster.cancel
  else if dmVentas.tblDespachoDet.State in [dsEdit, dsInsert] then
  dmVentas.tblDespachoDet.Cancel
  else if (dmVentas.tblDespachoDetSTATUS_DET.Value = 'A') then
  begin
    if MessageDlg('Eliminar record detalle?', mtWarning,[mbyes,mbno],0) = mryes then
    begin
      dmVentas.tblDespachoDet.Delete;
      GlbSalvarQuery(dmVentas.tblDespachoDet);
    end;
  end;
  if (dmVentas.tblDespachoDet.RecordCount = 0) and (dmVentas.tblDespachoMasterSTATUS.Value = 'A') then
  begin
    if MessageDlg('Eliminar record master?', mtWarning,[mbyes,mbno],0) = mryes then
    begin
      dmVentas.tblDespachoMaster.Delete;
      GlbSalvarQuery(dmVentas.tblDespachoMaster);
    end;
  end;
  GlbSalvarQuery(dmVentas.tblDespachoMaster);
  GlbSalvarQuery(dmVentas.tblDespachoDet);  
  xCodProvAnt:= -1;
  esEditando:=False;
end;

procedure TfrmPedidosProveedores.BitBtn4Click(Sender: TObject);
begin
  if dmVentas.tblDespachoMaster.State in [dsEdit] then
  esEditando:=True
  else esEditando:=False;
  if dmVentas.tblDespachoMaster.State in [dsEdit, dsInsert] then
  GlbSalvarQuery(dmVentas.tblDespachoMaster);

  if (dmVentas.tblDespachoDet.State In [dsEdit, dsInsert]) then
  begin
    if dmVentas.tblDespachoDetNUMERO.IsNull then
    dmVentas.tblDespachoDetNUMERO.Value :=dmVentas.tblDespachoMasterNUMERO.Value;
    GlbSalvarQuery(dmVentas.tblDespachoDet)
  end;
  if esEditando then
  begin
    ProcActualizaLote;
  end;
  xCodProvAnt:= -1;
  esEditando:=False;
end;

procedure TfrmPedidosProveedores.BitBtn5Click(Sender: TObject);
begin
  dmVentas.tblFormaPago.Close;
  dmVentas.tblFormaPago.Open;
  if dmVentas.tblDespachoMaster.State In [dsInactive, dsBrowse] then
  begin
    GetAnyDate1.FechaCierre:=ExtraerFecha(GlbFechaTrnDiaria);
    if GetAnyDate1.Execute then
    begin
      dmVentas.tblDespachoMaster.Close;
      dmVentas.tblDespachoMaster.Params[0].Value:=ExtraerFecha(GetAnyDate1.Fecha);
      dmVentas.tblDespachoMaster.Params[1].Value:=ExtraerFecha(GetAnyDate1.FechaFinal);
      dmVentas.tblDespachoMaster.Open;
      dmInventario.tblInventarioProd.Close;
      dmInventario.tblInventarioProd.SelectSQL.Text := dmInventario.qryInvProd_Base.Sql.Text;
      dmInventario.tblInventarioProd.Params[0].Value := glbCia_Key;      
      dmInventario.tblInventarioProd.Filtered:=False;
      dmInventario.tblInventarioProd.Open;
      BitBtn10Click(Self);
      BitBtn11Click(Self);      
    end;
  end;
  xCodProvAnt:= -1;
  esEditando:=False;
end;

procedure TfrmPedidosProveedores.BitBtn7Click(Sender: TObject);
begin
  if (dmVentas.tblDespachoDet.State In [dsBrowse]) then
  begin
    dmVentas.tblDespachoDet.Insert;
    dmVentas.tblDespachoDetNUMERO.Value    := dmVentas.tblDespachoMasterNUMERO.Value;
    dmVentas.tblDespachoDetSTATUS_DET.Value:= 'A';
    dmVentas.tblDespachoDetFECHA_IN.Value  := Now;
    dmVentas.tblDespachoDetIN_POR.Value    := StrUserName;
  end;
end;

procedure TfrmPedidosProveedores.ProcesaCalcular;
begin
  if dmVentas.tblDespachoDet.state in [dsInactive,dsBrowse] then Exit;

  dmVentas.tblDespachoDetVALOR_BRUTO.Value:=
  dmVentas.tblDespachoDetPRECIO.Value * dmVentas.tblDespachoDetCantidad.Value;

  //dmVentas.tblDespachoDetMontoDescuento.Value:= dmVentas.tblDespachoDetValor_Bruto.Value * dmVentas.tblDespachoDetporc_desc.Value/100;
  if qryInventarioPAGA_ITBI.Value = 1 then
  dmVentas.tblDespachoDetitbi_det.Value:= (dmVentas.tblDespachoDetValor_Bruto.Value -
                     (dmVentas.tblDespachoDetvalor_bruto.Value * dmVentas.tblDespachoDetPORC_DESC_DET.Value/100)) *
  FGlbPorcItbi(ExtraerFecha(dmVentas.tblDespachoMasterFecha.Value),dmVentas.tblDespachoDetCODIGO_PROD.Value) / 100;
  dmVentas.tblDespachoDetVALOR_TOTAL_DET.Value:= (dmVentas.tblDespachoDetvalor_bruto.Value -
                           (dmVentas.tblDespachoDetvalor_bruto.Value * dmVentas.tblDespachoDetPORC_DESC_DET.Value/100))
                                              + dmVentas.tblDespachoDetitbi_Det.Value;
  //rxDataCodEmp.Value:=dmDespacho.qryEmpleadosCODIGO.Value;
  //rxDataNuevoBalance.Value:= dmVentas.tblDespachoDetCantidad.Value + rxDataBalanceAct.Value;
end;

procedure TfrmPedidosProveedores.BitBtn9Click(Sender: TObject);
begin
  dmVentas.tblDespachoMaster.First;
end;

procedure TfrmPedidosProveedores.BitBtn10Click(Sender: TObject);
begin
  dmVentas.tblDespachoMaster.Prior;
end;

procedure TfrmPedidosProveedores.BitBtn11Click(Sender: TObject);
begin
  dmVentas.tblDespachoMaster.Next;
end;

procedure TfrmPedidosProveedores.BitBtn12Click(Sender: TObject);
begin
  dmVentas.tblDespachoMaster.Last;
end;

procedure TfrmPedidosProveedores.DBEdit3Change(Sender: TObject);
begin
  ProcesaCalcular;
end;

procedure TfrmPedidosProveedores.BitBtn13Click(Sender: TObject);
begin
  frmInventarioProd:=TfrmInventarioProd.Create(Nil);
  try
    dmInventario.tblInventarioProd.Locate('codigo', qryInventarioCODIGO.Value, []);
    frminventarioprod.ShowModal;
  finally
  frmInventarioProd.Free;
  frmInventarioProd:=Nil;
  end;
end;

procedure TfrmPedidosProveedores.BitBtn35Click(Sender: TObject);
begin
  frmConsultaInventario:=TfrmConsultaInventario.Create(Nil);
  try
    if frmConsultaInventario.Showmodal = mrOk then
    begin
      dmVentas.tblDespachoDet.Locate('CODIGO_PROD',frmConsultaInventario.ibquery1codigo.Value,[]);
      dmVentas.xcodProd := frmConsultaInventario.ibquery1codigo.Value;
      if CheckBox1.Checked then
      dmVentas.tblDespachoDet.Filtered:=True;
    end;
  finally
  frmConsultaInventario.Free;
  frmConsultaInventario:=Nil;
  end;
end;

procedure TfrmPedidosProveedores.CheckBox1Click(Sender: TObject);
begin
   if not CheckBox1.Checked then
   dmVentas.tblDespachoDet.Filtered:=False;
end;

procedure TfrmPedidosProveedores.BitBtn14Click(Sender: TObject);
begin
  frmConsultaInventario:=TfrmConsultaInventario.Create(Nil);
  try
    if frmConsultaInventario.Showmodal = mrOk then
    begin
      qryDatosConsulta.close;
      qryDatosConsulta.open;
      qryDatosConsulta.Filtered:=false;
      if qryDatosConsulta.RecordCount > 0 then
      begin
        qryDatosConsulta.Locate('CODIGO_PROD',frmConsultaInventario.ibquery1codigo.Value,[]);
        qryDatosConsulta.Filtered:= True;
        CheckBox2.Checked:= True;
      end;
    end;
  finally
  frmConsultaInventario.Free;
  frmConsultaInventario:=Nil;
  end;
end;

procedure TfrmPedidosProveedores.qryDatosConsultaFilterRecord(
  DataSet: TDataSet; var Accept: Boolean);
begin
  accept:= Dataset['codigo_prod'] =  qryDatosConsultaCODIGO_PROD.Value; 
end;

procedure TfrmPedidosProveedores.BitBtn15Click(Sender: TObject);
begin
  qryDatosConsulta.DisableControls;
  qryDatosConsulta.close;
  qryDatosConsulta.Filtered:=False;
  CheckBox1.Checked:=False;

  case RadioGroup1.ItemIndex of
  0: begin
       qryDatosConsulta.SQL.Clear;
       qryDatosConsulta.SQL.Text:= qryDatosConsulta_Base.SQL.Text;
       qryDatosConsulta.SQL.Add(Format(' where fecha between %s and %s',
       [chr(39)+FormatDateTime('mm/dd/yyyy',dtpkFechaIni.DateTime)+chr(39),
       chr(39)+FormatDateTime('mm/dd/yyyy',dtpkFechaFin.DateTime)+chr(39)]));
       xcondicion:='_'+FormatDateTime('ddmmmyyyy',dtpkFechaIni.DateTime)+'_'+
       FormatDateTime('ddmmmyyyy',dtpkFechaIni.DateTime)
     end;
  1: begin
       ComboBox1Change(Self);
       qryDatosConsulta.SQL.Clear;
       qryDatosConsulta.SQL.Text:= qryDatosConsulta_Base.SQL.Text;
       qryDatosConsulta.SQL.Add(Format(' where m.codigo_prov =  %s',[edtCodProv]));
       xcondicion:='_'+'Proveedor'+ComboBox1.text;

     end;
  2: begin
       qryDatosConsulta.SQL.Clear;
       qryDatosConsulta.SQL.Text:= qryDatosConsulta_Base.SQL.Text;
       xcondicion:='';
     end;
  end;
  qryDatosConsulta.open;
  qryDatosConsulta.EnableControls;
  qryDatosConsulta.First;
  if CheckBox3.Checked and (qryDatosConsulta.RecordCount > 0) then
  begin
    GLBMostrarArchivo := True;
    GlbEnviaEmail:=True;
    
    ExporToExcel(qryDatosConsulta,GlbRutaInformes+'RelacionDePedidosRegistrados_'+xcondicion+'.xls',false);
  end;
end;

procedure TfrmPedidosProveedores.TabSheet3Enter(Sender: TObject);
begin
  dtpkFechaIni.Date:=date;
  dtpkFechaFin.Date:=date;
end;

procedure TfrmPedidosProveedores.ComboBox1Change(Sender: TObject);
begin
  if dmreportes.qryProvInvLook.Locate('DESCRIPCION',ComboBox1.Text,[]) then
  edtCodProv:=dmreportes.qryProvInvLookCODIGO_CTE.AsString;
end;

procedure TfrmPedidosProveedores.CheckBox2Click(Sender: TObject);
begin
  if checkbox2.Checked then
  checkbox2.Checked:=False;
end;

procedure TfrmPedidosProveedores.ProcActualizaLote;
begin
  tblLote.Close;
  tblLote.Params[0].Value:= ExtraerFecha(dmVentas.tblDespachoMasterFECHA.Value);
  tblLote.Open;
  tblInv.Close;
  tblInv.Params[0].Value := glbCia_Key;
  tblInv.Open;
  dmVentas.tblDespachoDet.first;
  while not dmVentas.tblDespachoDet.eof do
  begin
    if esEditando then
    begin
      if tblLote.Locate('CODIGO;CODIGO_PROV', vararrayof([
      dmVentas.tblDespachoDetCODIGO_PROD.Value,
      xCodProvAnt]),[]) then
      begin
        tblLote.Edit;
        tblLoteCODIGO_PROV.Value:= dmVentas.tblDespachoMasterCODIGO_PROV.Value;
        GlbSalvarQuery(tblLote);
        if tblInv.Locate('codigo',dmVentas.tblDespachoDetCODIGO_PROD.Value,[]) then
        begin
          tblInv.edit;
          tblInvCODFABRICANTE.Value:=tblLoteCODIGO_PROV.Value;
          GlbSalvarQuery(tblInv);
        end;
      end;
    end else
    begin

    end;
    dmVentas.tblDespachoDet.Next;
  end;
end;

end.
