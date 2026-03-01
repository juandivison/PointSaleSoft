unit UFormfrmHistVentasInv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Grids, DBGrids, RxDBCtrl, DB,
  IBCustomDataSet, IBQuery, Buttons;

type
  TfrmHistVentasInv = class(TForm)
    qryHistVentaDet: TIBQuery;
    qryHistVentaDetNUMERO: TIntegerField;
    qryHistVentaDetSERIE: TIntegerField;
    qryHistVentaDetFORMA_PAGO: TSmallintField;
    qryHistVentaDetFECHA: TDateTimeField;
    qryHistVentaDetCODIGO_BARRA: TIBStringField;
    qryHistVentaDetCODIGO_PROD: TIBStringField;
    qryHistVentaDetDESCRIPCION: TIBStringField;
    qryHistVentaDetUNIDAD: TIBStringField;
    qryHistVentaDetCANTUNIDAD: TIntegerField;
    qryHistVentaDetCANTIDAD: TFloatField;
    qryHistVentaDetCANTDEVOLUCION: TFloatField;
    qryHistVentaDetCANTVENTA: TFloatField;
    qryHistVentaDetPRECIO: TFloatField;
    qryHistVentaDetVALOR_TOTAL_DET: TFloatField;
    qryHistVentaDetLOT_NUM: TIntegerField;
    DataSource1: TDataSource;
    RxDBGrid1: TRxDBGrid;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    qryHistVentaDetBase: TIBQuery;
    tblInv: TIBDataSet;
    edtNuevaCant: TEdit;
    Label3: TLabel;
    BitBtn2: TBitBtn;
    tblInvCODIGO: TIntegerField;
    tblInvCODIGO_TEXTO: TIBStringField;
    tblInvFECHA: TDateTimeField;
    tblInvCODIGO_BARRA: TIBStringField;
    tblInvTIPO: TIntegerField;
    tblInvDESCRIPCION: TIBStringField;
    tblInvDESCRIPCIONADICIONAL: TMemoField;
    tblInvCANTIDAD_REORDEN: TIntegerField;
    tblInvPRECIO_ANT: TFloatField;
    tblInvCANTIDAD: TFloatField;
    tblInvPRECIO: TFloatField;
    tblInvBLCE_CANT_ENTRADA: TFloatField;
    tblInvBLCE_CANT_SALIDA: TFloatField;
    tblInvFECHA_ULTIMA_TRN: TDateTimeField;
    tblInvSTATUS: TIBStringField;
    tblInvPORC_DESCUENTO: TFloatField;
    tblInvFOTO: TBlobField;
    tblInvPAGA_ITBI: TSmallintField;
    tblInvCODIGO_PRECIO: TIBStringField;
    tblInvUNIDAD: TFloatField;
    tblInvPRECIO_COMPRA: TFloatField;
    tblInvPRECIO_MINIMO: TFloatField;
    tblInvREFERENCIA: TIBStringField;
    tblInvFECHA_VENCIMIENTO: TDateTimeField;
    tblInvINVENTARIAR: TSmallintField;
    tblInvPRECIO_TIPO_UNIDAD: TFloatField;
    tblInvTIPO_UNIDAD: TIntegerField;
    tblInvORIGEN: TIntegerField;
    tblInvUBICACION: TIBStringField;
    tblInvREFERENCIA_ALTERNA: TIBStringField;
    tblInvMARCA: TIBStringField;
    tblInvMODELO: TIBStringField;
    tblInvPRECIOVENTA1: TFloatField;
    tblInvPRECIOVENTA2: TFloatField;
    tblInvPRECIOVENTA3: TFloatField;
    tblInvPRECIOVENTA4: TFloatField;
    tblInvPORCUTILIDAD1: TFloatField;
    tblInvPORCUTILIDAD2: TFloatField;
    tblInvPORCUTILIDAD3: TFloatField;
    tblInvPORCUTILIDAD4: TFloatField;
    tblInvUSARLEVELPRECIO: TSmallintField;
    tblInvCIA_KEY: TIntegerField;
    tblInvSITUACIONPROD: TSmallintField;
    tblInvAPLICAIMPTOCOMPRA: TSmallintField;
    tblInvCODFABRICANTE: TIntegerField;
    tblInvCTAINVENTARIO: TIBStringField;
    tblInvCTAVENTA: TIBStringField;
    tblInvCTACOMPRA: TIBStringField;
    tblInvCODSUBCATEGORIA: TIntegerField;
    tblInvCODCATEGORIA: TIntegerField;
    tblInvPORCITBIS: TFloatField;
    tblInvCOD_MONEDA: TIBStringField;
    tblInvKILOMETROS: TFloatField;
    tblInvRUTAIMAGEN: TIBStringField;
    tblInvIDTASAITBIS: TSmallintField;
    tblInvPRECIO_ALQUILER: TFloatField;
    tblInvPAGACOMISION: TSmallintField;
    RxDBGrid2: TRxDBGrid;
    DataSource2: TDataSource;
    edtCodBarra: TEdit;
    Label4: TLabel;
    SpeedButton1: TSpeedButton;
    qryDiasConVentas: TIBQuery;
    qryDiasConVentasFECHA: TDateTimeField;
    DataSource3: TDataSource;
    Label59: TLabel;
    dtpkFechaConVentas: TDateTimePicker;
    Button1: TButton;
    Button2: TButton;
    qryVtaResBase: TIBQuery;
    qryVtaRes: TIBQuery;
    qryVtaResFORMA_PAGO: TSmallintField;
    qryVtaResLOT_NUM: TIntegerField;
    qryVtaResCODIGO_PROD: TIBStringField;
    qryVtaResDESCRIPCION: TIBStringField;
    qryVtaResUNIDAD: TIBStringField;
    qryVtaResCANTUNIDAD: TIntegerField;
    qryVtaResCANTIDAD: TFloatField;
    DataSource4: TDataSource;
    RxDBGrid3: TRxDBGrid;
    BitBtn35: TBitBtn;
    edtDesc: TEdit;
    Label5: TLabel;
    SpeedButton2: TSpeedButton;
    Label6: TLabel;
    edtBuscarDescVta: TEdit;
    chkInvFiltrado: TCheckBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    CheckBox1: TCheckBox;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    qryVtas: TIBQuery;
    qryVtasSERIE: TIntegerField;
    qryVtasNUMERO: TIntegerField;
    qryVtasCODIGO_PROD: TIBStringField;
    qryVtasCODIGO_BARRA: TIBStringField;
    qryVtasDESCRIPCION: TIBStringField;
    qryVtasCANTIDAD: TFloatField;
    qryVtasPRECIO: TFloatField;
    qryVtasPORC_DESC_DET: TFloatField;
    qryVtasITBI_DET: TFloatField;
    qryVtasVALOR_SERVICIO_DET: TFloatField;
    qryVtasVALOR_TOTAL_DET: TFloatField;
    qryVtasNUM_FACTURA: TFloatField;
    qryVtasSTATUS_DET: TIBStringField;
    qryVtasFECHA_IN: TDateTimeField;
    qryVtasIN_POR: TIBStringField;
    qryVtasFECHA_MOD: TDateTimeField;
    qryVtasMOD_POR: TIBStringField;
    qryVtasCANT_REGRESO: TFloatField;
    qryVtasCANT_PROMO: TFloatField;
    qryVtasMONTO_DIETA: TFloatField;
    qryVtasMONTO_AJUSTE: TFloatField;
    qryVtasSERIE_PROD: TIBStringField;
    qryVtasSTATUS_CNT: TIBStringField;
    qryVtasTIPO_UNIDAD: TIntegerField;
    qryVtasITBIS_EXENTO: TSmallintField;
    qryVtasTIPO_VENTA: TSmallintField;
    qryVtasDESCRIPCIONPRODUCTO: TMemoField;
    qryVtasCOD_EMPLEADO_CONDUCTOR: TFloatField;
    qryVtasPLACA_VEHICULO: TIBStringField;
    qryVtasMONEDA: TIBStringField;
    qryVtasMONTO_TASA: TFloatField;
    qryVtasCAPACIDAD: TFloatField;
    qryVtasCANT_VIAJES: TFloatField;
    qryVtasCANT_METROS_CUBICO: TFloatField;
    qryVtasFICHA_VEH: TIntegerField;
    qryVtasIDZONA_ORIGEN: TIntegerField;
    qryVtasIDZONA_DETALLE: TIntegerField;
    qryVtasPRECIO_COMPRA: TFloatField;
    qryVtasCANT_CONDUCE: TFloatField;
    qryVtasPORC_DESC_ITEM: TFloatField;
    qryVtasMONTO_DESC_ITEM: TFloatField;
    qryVtasITBIS_FISCAL_DET: TFloatField;
    qryVtasIDTASAITBIS: TFloatField;
    qryVtasMONTOIBISRECARGO: TFloatField;
    qryVtasDC_ITBIS_CLD: TFloatField;
    qryVtasTC_MONTOITBISRECARGO_GLB: TFloatField;
    qryVtasTC_MONTOITBISRECARGO_ITM: TFloatField;
    qryVtasNUM_CONDUCE_CTE: TIBStringField;
    qryVtasNUM_IDENT: TIBStringField;
    qryVtasLOT_NUM: TIntegerField;
    qryVtasCODIGO_VENDEDOR: TIntegerField;
    qryVtasLEVEL_PRECIO_VENTA: TSmallintField;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure BitBtn35Click(Sender: TObject);
    procedure edtDescChange(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure edtBuscarDescVtaChange(Sender: TObject);
    procedure chkInvFiltradoClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure RxDBGrid3CellClick(Column: TColumn);
    procedure RxDBGrid3DblClick(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure qryVtaResAfterScroll(DataSet: TDataSet);
    procedure RxDBGrid2DblClick(Sender: TObject);
  private
    { Private declarations }
    procedure procActDatos;
  public
    { Public declarations }
  end;

var
  frmHistVentasInv: TfrmHistVentasInv;
  NotExiste : boolean;

implementation

uses UDatModConectar, UGlobal, DateUtils, UConsultaInventario,
  UfrmVtasHistInv;

{$R *.dfm}

procedure TfrmHistVentasInv.FormCreate(Sender: TObject);
begin
  qryDiasConVentas.close;
  qryDiasConVentas.open;
  qryDiasConVentas.Last;
  qryDiasConVentas.First;
  tblInv.Close;
  tblInv.Open;
  dtpkFechaConVentas.DateTime:=qryDiasConVentasFECHA.Value;
  DateTimePicker1.Date:= ExtraerFecha(GlbFechaTrnDiaria);
  DateTimePicker2.Date:= ExtraerFecha(GlbFechaTrnDiaria);
end;

procedure TfrmHistVentasInv.BitBtn1Click(Sender: TObject);
begin
  qryVtaRes.Close;
  qryVtaRes.Sql.Text:=qryVtaResBase.Sql.Text;
  qryVtaRes.Sql.Add(' Where ventas_mast.fecha between :fechaini and :fechafin');
  qryVtaRes.Params[0].AsDate:= ExtraerFecha(DateTimePicker1.Date);
  qryVtaRes.Params[1].AsDate:= ExtraerFecha(DateTimePicker2.Date);
  qryVtaRes.Sql.Add('group by ');
  qryVtaRes.Sql.Add('VENTAS_MAST.FORMA_PAGO,');
  qryVtaRes.Sql.Add('VENTAS_DET.LOT_NUM,');
  qryVtaRes.Sql.Add('VENTAS_DET.CODIGO_PROD,');
  qryVtaRes.Sql.Add('VENTAS_DET.DESCRIPCION,');
  qryVtaRes.Sql.Add('UNIDADES.DESCRIPCION,');
  qryVtaRes.Sql.Add('UNIDADES.CANTIDAD');
  qryVtaRes.Sql.Add('Order by VENTAS_DET.Descripcion');
  qryVtaRes.Open;

end;

procedure TfrmHistVentasInv.BitBtn2Click(Sender: TObject);
begin
  if tblInv.Locate('codigo', qryHistVentaDetCODIGO_PROD.Value, []) then
  begin
    tblInv.Edit;
    tblInvFECHA_ULTIMA_TRN.Value:= ExtraerFecha(Now);
    tblInvCANTIDAD.Value:=StrToFloat(edtNuevaCant.Text);
    GlbSalvarQuery(tblInv);
  end;
end;

procedure TfrmHistVentasInv.SpeedButton1Click(Sender: TObject);
begin
  if (edtCodBarra.Text = '') then exit;
  {qryHistVentaDet.Close;
  qryHistVentaDet.SQL.Text:=qryHistVentaDetBase.Sql.Text;
  qryHistVentaDet.Sql.Add(' Where ventas_mast.fecha between :fechaini and :fechafin');
  qryHistVentaDet.Params[0].AsDate:= ExtraerFecha(DateTimePicker1.Date);
  qryHistVentaDet.Params[1].AsDate:= ExtraerFecha(DateTimePicker2.Date);
  qryHistVentaDet.SQL.Add(' and Ventas_Det.CODIGO_BARRA =:codbarra');
  qryHistVentaDet.Params[2].AsString :=edtCodBarra.Text;
  qryHistVentaDet.Open; }

  qryVtaRes.Close;
  qryVtaRes.Sql.Text:=qryVtaResBase.Sql.Text;
  qryVtaRes.Sql.Add(' Where ventas_mast.fecha between :fechaini and :fechafin');
  qryVtaRes.SQL.Add(' and Ventas_Det.CODIGO_BARRA =:codbarra');
  qryVtaRes.Params[0].AsDate:= ExtraerFecha(DateTimePicker1.Date);
  qryVtaRes.Params[1].AsDate:= ExtraerFecha(DateTimePicker2.Date);
  qryVtaRes.Params[2].AsString :=edtCodBarra.Text;
  qryVtaRes.Sql.Add('group by ');
  qryVtaRes.Sql.Add('VENTAS_MAST.FORMA_PAGO,');
  qryVtaRes.Sql.Add('VENTAS_DET.LOT_NUM,');
  qryVtaRes.Sql.Add('VENTAS_DET.CODIGO_PROD,');
  qryVtaRes.Sql.Add('VENTAS_DET.DESCRIPCION,');
  qryVtaRes.Sql.Add('UNIDADES.DESCRIPCION,');
  qryVtaRes.Sql.Add('UNIDADES.CANTIDAD');
  qryVtaRes.Sql.Add('Order by VENTAS_DET.CODIGO_PROD');

  qryVtaRes.Open;

end;

procedure TfrmHistVentasInv.Button1Click(Sender: TObject);
begin

  dtpkFechaConVentas.Date:=IncDay(dtpkFechaConVentas.Date,1);
  qryVtaRes.Close;
  qryVtaRes.Sql.Text:=qryVtaResBase.Sql.Text;
  qryVtaRes.Sql.Add(' Where ventas_mast.fecha between :fechaini and :fechafin');
  qryVtaRes.SQL.Add(' and Ventas_Det.CODIGO_BARRA =:codbarra');
  qryVtaRes.Params[0].AsDate:= ExtraerFecha(dtpkFechaConVentas.Date);
  qryVtaRes.Params[1].AsDate:= ExtraerFecha(dtpkFechaConVentas.Date);
  qryVtaRes.Params[2].AsString :=edtCodBarra.Text;
  qryVtaRes.Sql.Add('group by ');
  qryVtaRes.Sql.Add('VENTAS_MAST.FORMA_PAGO,');
  qryVtaRes.Sql.Add('VENTAS_DET.LOT_NUM,');
  qryVtaRes.Sql.Add('VENTAS_DET.CODIGO_PROD,');
  qryVtaRes.Sql.Add('VENTAS_DET.DESCRIPCION,');
  qryVtaRes.Sql.Add('UNIDADES.DESCRIPCION,');
  qryVtaRes.Sql.Add('UNIDADES.CANTIDAD');
  qryVtaRes.Sql.Add('Order by VENTAS_DET.CODIGO_PROD');

  qryVtaRes.Open;
{  qryHistVentaDet.Close;
  qryHistVentaDet.Sql.Text:=qryHistVentaDetBase.Sql.Text;
  qryHistVentaDet.Sql.Add(' Where ventas_mast.fecha between :fechaini and :fechafin');
  qryHistVentaDet.Params[0].AsDate:= ExtraerFecha(dtpkFechaConVentas.Date);
  qryHistVentaDet.Params[1].AsDate:= ExtraerFecha(dtpkFechaConVentas.Date);
  qryHistVentaDet.Open;
  }
  DateTimePicker1.DateTime:=dtpkFechaConVentas.DateTime;
  DateTimePicker2.DateTime:=dtpkFechaConVentas.DateTime;
end;

procedure TfrmHistVentasInv.Button2Click(Sender: TObject);
begin
  dtpkFechaConVentas.Date:=IncDay(dtpkFechaConVentas.Date,-1);
  qryHistVentaDet.Close;
  qryHistVentaDet.Sql.Text:=qryHistVentaDetBase.Sql.Text;
  qryHistVentaDet.Sql.Add(' Where ventas_mast.fecha between :fechaini and :fechafin');
  qryHistVentaDet.Params[0].AsDate:= ExtraerFecha(dtpkFechaConVentas.Date);
  qryHistVentaDet.Params[1].AsDate:= ExtraerFecha(dtpkFechaConVentas.Date);
  qryHistVentaDet.Open;
end;

procedure TfrmHistVentasInv.BitBtn35Click(Sender: TObject);
begin
  frmConsultaInventario:=TfrmConsultaInventario.Create(Nil);
  try
    if frmConsultaInventario.Showmodal = mrOk then
    begin
      RxDBGrid1.EnableScroll;
      RxDBGrid2.EnableScroll;
      qryVtaRes.DisableControls;
      qryHistVentaDet.DisableControls;
      tblInv.DisableControls;
      if not qryVtaRes.locate('CODIGO_PROD',frmConsultaInventario.ibquery1codigo.Value,[]) then
      MessageDlg('No econtrado en rango de fecha, verifique',mtInformation,[mbok],0);
      RxDBGrid1.DisableScroll;
      RxDBGrid2.DisableScroll;
      qryVtaRes.EnableControls;
      qryHistVentaDet.EnableControls;
      tblInv.EnableControls;
    end
  finally
  frmConsultaInventario.Free;
  frmConsultaInventario:=Nil;
  end;
end;

procedure TfrmHistVentasInv.edtDescChange(Sender: TObject);
begin
  tblInv.close;
  //tblInv.Locate('DESCRIPCION',edtDesc.Text,[loCaseInsensitive,loPartialKey]);
  tblInv.SelectSQL.Text:='Select i.* From INVENTARIO_PRODUCTO i';
  if RadioButton1.Checked then
  tblInv.SelectSQL.Add(format('Where upper(i.descripcion) like %s',[chr(39)+'%'+UpperCase(edtDesc.Text)+'%'+chr(39)]))
  else
  tblInv.SelectSQL.Add(format('Where upper(i.descripcion) like %s',[chr(39)+UpperCase(edtDesc.Text)+'%'+chr(39)]));
    
  tblInv.open;
  chkInvFiltrado.Checked:=True;
  chkInvFiltrado.Caption:='Filtrado';
end;

procedure TfrmHistVentasInv.SpeedButton2Click(Sender: TObject);
begin
  edtDescChange(Self);
  chkInvFiltrado.Checked:=True;
  chkInvFiltrado.Caption:='Filtrado';  
end;

procedure TfrmHistVentasInv.edtBuscarDescVtaChange(Sender: TObject);
begin
  //qryVtaRes.Locate('DESCRIPCION',edtBuscarDescVta.Text,[loCaseInsensitive,loPartialKey]);
  qryHistVentaDet.Close;
  qryHistVentaDet.Sql.Text:=qryHistVentaDetBase.Sql.Text;
  qryHistVentaDet.Sql.Add(' Where ventas_mast.fecha between :fechaini and :fechafin');
  if RadioButton1.Checked then
  qryHistVentaDet.Sql.Add(format(' and ventas_Det.descripcion like %s',[chr(39)+'%'+uppercase(edtBuscarDescVta.Text)+'%'+chr(39)]))
  else
  qryHistVentaDet.Sql.Add(format(' and upper(ventas_Det.descripcion) like %s',[chr(39)+uppercase(edtBuscarDescVta.Text)+'%'+chr(39)]));
  qryHistVentaDet.Sql.Add('Order by VENTAS_DET.Descripcion');
  qryHistVentaDet.Params[0].AsDate:= ExtraerFecha(DateTimePicker1.Date);
  qryHistVentaDet.Params[1].AsDate:= ExtraerFecha(DateTimePicker2.Date);
  qryHistVentaDet.Open;

  qryVtaRes.Close;
  qryVtaRes.Sql.Text:=qryVtaResBase.Sql.Text;
  qryVtaRes.Sql.Add(' Where ventas_mast.fecha between :fechaini and :fechafin');
  qryVtaRes.Params[0].AsDate:= ExtraerFecha(DateTimePicker1.Date);
  qryVtaRes.Params[1].AsDate:= ExtraerFecha(DateTimePicker2.Date);
  if RadioButton1.Checked then
  qryVtaRes.Sql.Add(format(' and ventas_Det.descripcion like %s',[chr(39)+'%'+uppercase(edtBuscarDescVta.Text)+'%'+chr(39)]))
  else
  qryVtaRes.Sql.Add(format(' and ventas_Det.descripcion like %s',[chr(39)+uppercase(edtBuscarDescVta.Text)+'%'+chr(39)]));
  qryVtaRes.Sql.Add('group by ');
  qryVtaRes.Sql.Add('VENTAS_MAST.FORMA_PAGO,');
  qryVtaRes.Sql.Add('VENTAS_DET.LOT_NUM,');
  qryVtaRes.Sql.Add('VENTAS_DET.CODIGO_PROD,');
  qryVtaRes.Sql.Add('VENTAS_DET.DESCRIPCION,');
  qryVtaRes.Sql.Add('UNIDADES.DESCRIPCION,');
  qryVtaRes.Sql.Add('UNIDADES.CANTIDAD');
  qryVtaRes.Sql.Add('Order by VENTAS_DET.Descripcion');
  qryVtaRes.Open;
  CheckBox1.Checked:=True;
  CheckBox1.Caption:='Filtrado';
end;

procedure TfrmHistVentasInv.chkInvFiltradoClick(Sender: TObject);
begin
  if not chkInvFiltrado.Checked then
  begin
    chkInvFiltrado.Caption:='Filtrar';
    tblInv.Close;
    tblInv.SelectSQL.Text:='Select i.* From INVENTARIO_PRODUCTO i';
    tblInv.SelectSQL.Add('Order by i.descripcion');
    tblInv.Open;
  end;
end;

procedure TfrmHistVentasInv.CheckBox1Click(Sender: TObject);
begin
  if not CheckBox1.Checked then
  begin
     BitBtn1Click(Self);    
  end;
end;

procedure TfrmHistVentasInv.RxDBGrid3CellClick(Column: TColumn);
begin
  procActDatos;
end;

procedure TfrmHistVentasInv.RxDBGrid3DblClick(Sender: TObject);
begin
  ProcActDatos;
end;

procedure TfrmHistVentasInv.BitBtn9Click(Sender: TObject);
begin
  qryVtaRes.First;
  procActDatos;
end;

procedure TfrmHistVentasInv.BitBtn10Click(Sender: TObject);
begin
  qryVtaRes.Prior;
  procActDatos;
end;

procedure TfrmHistVentasInv.BitBtn11Click(Sender: TObject);
begin
  qryVtaRes.Next;
  procActDatos;
end;

procedure TfrmHistVentasInv.BitBtn12Click(Sender: TObject);
begin
  qryVtaRes.Last;
  procActDatos;
end;

procedure TfrmHistVentasInv.procActDatos;
begin
  if chkInvFiltrado.Checked then
  begin
    chkInvFiltrado.Checked:=False;
    //chkInvFiltradoClick(Self);
  end;
  if //(qryHistVentaDetCODIGO_PROD.Value <> qryVtaResCODIGO_PROD.Value )
     //or
     (tblInvCODIGO.AsSTring <> qryVtaResCODIGO_PROD.AsSTring) then
  begin
    //qryHistVentaDet.Locate('CODIGO_PROD',qryVtaResCODIGO_PROD.Value,[]);
     if (tblInvCODIGO.AsSTring<> qryVtaResCODIGO_PROD.AsSTring) then
    if not tblInv.Locate('codigo', qryVtaResCODIGO_PROD.Value, []) then
    NotExiste:=True
    else NotExiste:=False;
  end;
end;

procedure TfrmHistVentasInv.qryVtaResAfterScroll(DataSet: TDataSet);
begin
  qryHistVentaDet.Close;
  qryHistVentaDet.Sql.Text:=qryHistVentaDetBase.Sql.Text;
  qryHistVentaDet.Sql.Add(' Where ventas_mast.fecha between :fechaini and :fechafin');
  qryHistVentaDet.Sql.Add(' and ventas_det.CODIGO_PROD =:codigoProd');
  qryHistVentaDet.Sql.Add('Order by VENTAS_DET.Descripcion');
  qryHistVentaDet.Params[0].AsDate:= ExtraerFecha(DateTimePicker1.Date);
  qryHistVentaDet.Params[1].AsDate:= ExtraerFecha(DateTimePicker2.Date);
  qryHistVentaDet.Params[2].AsString:=qryVtaResCODIGO_PROD.Value;
  qryHistVentaDet.Open;
end;

procedure TfrmHistVentasInv.RxDBGrid2DblClick(Sender: TObject);
begin
  qryVtas.Close;
  qryVtas.Params[0].Value:=tblInvCODIGO.Value;
  qryVtas.Open;
  frmVtasHistInv:=tfrmVtasHistInv.Create(nil);
  try
    frmVtasHistInv.Showmodal;
  finally
  frmVtasHistInv.free;
  frmVtasHistInv:=nil;
  end;
end;

end.
