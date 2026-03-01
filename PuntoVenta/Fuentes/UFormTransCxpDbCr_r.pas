unit UFormTransCxpDbCr_r;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, Grids, DBGrids, RXDBCtrl,
  WinSkinData, StdCtrls, EditNew, RxMemDS, Buttons, ExtCtrls, RXCtrls,
  IBStoredProc, Menus, RxLookup, IBSQL, DBCtrls, Mask, rxToolEdit, RxDBComb,
  ComCtrls, IBTable;

type
  TfrmTransCxpProc_R = class(TForm)
    qryFactPendiente: TIBQuery;
    qryFactPendienteCODIGO_CTE: TIntegerField;
    qryFactPendienteFECHA: TDateTimeField;
    qryFactPendienteNOMBRE_CTE: TIBStringField;
    qryFactPendienteNOMBRE_FACTURAR: TIBStringField;
    qryFactPendienteTIPO: TIntegerField;
    qryFactPendienteMONEDA: TIBStringField;
    qryFactPendienteNUMERO_FACT: TIntegerField;
    qryFactPendienteMONTO_PENDIENTE: TFloatField;
    qryFactPendienteSTATUS: TIBStringField;
    dsqryFactPendiente: TDataSource;
    rxFacturaACobrar: TRxMemoryData;
    rxFacturaACobrarCodCte: TIntegerField;
    rxFacturaACobrarNumFactura: TIntegerField;
    rxFacturaACobrarTipoCobro: TSmallintField;
    rxAcumulador: TRxMemoryData;
    rxAcumuladorMonto: TFloatField;
    dsrxFacturaACobrar: TDataSource;
    stp_UpdateCxp: TIBStoredProc;
    PopupMenu1: TPopupMenu;
    BuscarCliente1: TMenuItem;
    ReImprimirRecibo1: TMenuItem;
    rxFacturaACobrarTipoFactPend: TIntegerField;
    rxFacturaACobrarformaPago: TIntegerField;
    rxFormaPago: TRxMemoryData;
    rxFormaPagoformaPago: TSmallintField;
    rxFormaPagoNumeroDocumento: TStringField;
    rxFormaPagoNumeroTarjeta: TStringField;
    rxFormaPagoTipoTarjeta: TSmallintField;
    rxFormaPagoProveedorTarjeta: TSmallintField;
    rxFormaPagoNumeroAutorizacion: TStringField;
    rxFormaPagoMes: TSmallintField;
    rxFormaPagoAnio: TSmallintField;
    rxFormaPagoMONTOAUTORIZADO: TFloatField;
    dsrxFormaPago: TDataSource;
    stpactfctingresos: TIBStoredProc;
    RxLabel3: TRxLabel;
    ibsqlLastNum: TIBSQL;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label18: TLabel;
    Label3: TLabel;
    Label8: TLabel;
    Label4: TLabel;
    Label16: TLabel;
    Label5: TLabel;
    rxdbboxmoneda: TRxDBComboBox;
    RxDBComboBox1: TRxDBComboBox;
    RxDBLookupCombo4: TRxDBLookupCombo;
    DBDateEdit1: TDBDateEdit;
    DBEdit3: TDBEdit;
    DBEdit8: TDBEdit;
    RxDBGrid3: TRxDBGrid;
    BitBtn13: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    btnInsertar: TBitBtn;
    Label1: TLabel;
    Shape1: TShape;
    RxLabel1: TRxLabel;
    Label2: TLabel;
    RxLabel2: TRxLabel;
    RxSpeedButton5: TRxSpeedButton;
    Label15: TLabel;
    edtMontoAcobrar: TEditN;
    RxDBGrid2: TRxDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    edtDisponible: TEditN;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    RxDBGrid1: TRxDBGrid;
    BitBtn10: TBitBtn;
    ComboBox1: TComboBox;
    tblDocTransCxc: TIBTable;
    tblDocTransCxcCODIGO: TSmallintField;
    tblDocTransCxcDESCRIPCION: TIBStringField;
    dstblTipoTrnDoc: TDataSource;
    DBStatusLabel1: TDBStatusLabel;
    BitBtn12: TBitBtn;
    DBEdit1: TDBEdit;
    Label6: TLabel;
    qCodCte: TIBQuery;
    qCodCteCODIGO_CTE: TIntegerField;
    qCodCteNOMBRE_CTE: TIBStringField;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label9: TLabel;
    DSqCodCte: TDataSource;
    rxFacturaACobrarMontoAbonado: TCurrencyField;
    rxFacturaACobrarConcepto: TStringField;
    CheckBox1: TCheckBox;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    stpProcNumDoc: TIBStoredProc;
    ReImprimirNDB1: TMenuItem;
    lblMensagefact: TLabel;
    RxDBGrid4: TRxDBGrid;
    Label10: TLabel;
    SkinData1: TSkinData;
    procedure BitBtn1Click(Sender: TObject);
    procedure RxDBGrid1Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure edtMontoAcobrarChange(Sender: TObject);
    procedure ReImprimirRecibo1Click(Sender: TObject);
    procedure BuscarCliente1Click(Sender: TObject);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure btnInsertarClick(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn12Click(Sender: TObject);
    procedure RxDBGrid3GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure RxDBLookupCombo4Exit(Sender: TObject);
    procedure ReImprimirNDB1Click(Sender: TObject);
    procedure RxDBGrid1CellClick(Column: TColumn);
    procedure TabSheet2Enter(Sender: TObject);
    procedure RxDBGrid4CellClick(Column: TColumn);
  private
    { Private declarations }
    Procedure ProcInsertaFactura(x:smallint; y:smallint);
    Function TotalFacturas:Real;
    Procedure ProcSumar;
    Function SumarFactAcobrar:Real;
    Procedure ProcFacturasACxc(Serie_Asignadoncf: integer);
    procedure ProcUpdateFactPendiente;

    procedure ActBalaceCteP(operacion:smallint);
    procedure EditarBalanceP(monto : Real);
    procedure InsertaBalanceP(monto: Real);

    function FNumReciboMax : Integer;
    procedure ProcesaNCF(var serie_asignadoncf:Integer;var ncf:String; tipoNCF:string; Monto: Real);
  public
    { Public declarations }
    CodCte : Integer;
    strNombreEmpresa : String;
  end;

var
  frmTransCxpProc_R: TfrmTransCxpProc_R;
  cont : Integer;
  strNumero : String;
  ReNumDocumento : Integer;
  xnumfact : Integer;
implementation

uses UDatModConectar, UGlobal, UDatModIngresos,
  UDatModUsuarios, URepReciboAbonoCXC, UBuscarClientesPersonasP,
  UCobrarFacturas, URepIngresoDet, uFormAsignarNCFVenta, USeleccionarNCF,
  UDatModFactura, UDatModCxp, 
  URepPagoCxpDet, UBuscarProveedores, UDatModProveedor;

{$R *.dfm}

procedure TfrmTransCxpProc_R.BitBtn1Click(Sender: TObject);
begin
  ProcInsertaFactura(1{solo fact actual},1{Completa});
  BitBtn7Click(Self);
end;

procedure TfrmTransCxpProc_R.ProcInsertaFactura(x, y: smallint);
var i:integer;
    MontoDisponible : Real;
begin
  if rxfacturaacobrar.State = dsinactive then
  rxFacturaACobrar.Open;
  Case x Of
  2:begin //Solo factura seleccionada
    if (rxDBGrid1.SelectedRows.Count > 0) then
    with rxDBGrid1.DataSource.DataSet do
      for i:=0 to rxDBGrid1.SelectedRows.Count-1 do
      begin
        GotoBookmark(pointer(rxDBGrid1.SelectedRows.Items[i]));
        if not rxFacturaACobrar.locate('numfactura',qryFactPendienteNUMERO_FACT.Value,[]) then
        begin
          rxFacturaACobrar.Insert;
          rxFacturaACobrarTipoFactPend.Value := qryFactPendienteTIPO.Value;
          rxFacturaACobrarCodCte.Value       := qryFactPendienteCODIGO_CTE.Value;
          rxFacturaACobrarNumFactura.Value   := qryFactPendienteNUMERO_FACT.Value;
          rxFacturaACobrarTipoCobro.Value    := qryFactPendienteTIPO.Value;
          //MontoDisponible:=
          if edtMontoAcobrar.ValueFloat < qryFactPendienteMONTO_PENDIENTE.Value then
          begin
            rxFacturaACobrarMontoAbonado.Value := edtMontoAcobrar.ValueFloat;
            rxFacturaACobrarConcepto.Value:= 'Abono NC Factura';
          end else
          rxFacturaACobrarMontoAbonado.Value :=
          qryFactPendienteMONTO_PENDIENTE.Value;// - edtMontoAcobrar.ValueFloat;
          rxFacturaACobrarConcepto.Value:= 'Saldo NC Factura';
          rxFacturaACobrar.Post;
        end;
      end;
    end;
  1:begin //Facturas seleccionadas
    if (rxDBGrid1.SelectedRows.Count = 1) then
    with rxDBGrid1.DataSource.DataSet do
      for i:=0 to rxDBGrid1.SelectedRows.Count-1 do
      begin
        GotoBookmark(pointer(rxDBGrid1.SelectedRows.Items[i]));
        if not rxFacturaACobrar.locate('numfactura',qryFactPendienteNUMERO_FACT.Value,[]) then
        begin
          rxFacturaACobrar.Insert;
          rxFacturaACobrarTipoFactPend.Value := qryFactPendienteTIPO.Value;
          rxFacturaACobrarCodCte.Value       := qryFactPendienteCODIGO_CTE.Value;
          rxFacturaACobrarNumFactura.Value   := qryFactPendienteNUMERO_FACT.Value;
          rxFacturaACobrarTipoCobro.Value    := qryFactPendienteTIPO.Value;
          if qryFactPendienteMONTO_PENDIENTE.Value > edtMontoAcobrar.ValueFloat then
          //if qryFactPendienteMONTO_PENDIENTE.Value > edtDisponible.ValueFloat then
          begin
            rxFacturaACobrarMontoAbonado.Value := edtDisponible.ValueFloat;
          end else
          rxFacturaACobrarMontoAbonado.Value :=qryFactPendienteMONTO_PENDIENTE.Value;
          rxFacturaACobrar.Post;
        end;
      end;
    end;
  end;
end;

procedure TfrmTransCxpProc_R.RxDBGrid1Exit(Sender: TObject);
begin
  //if rxDBGrid1.SelectedRows.Count > 1 then
  //begin
  //  RadioButton1.Checked := True;
  //end;
  ProcSumar;
end;

procedure TfrmTransCxpProc_R.FormShow(Sender: TObject);
begin
  qryFactPendiente.Close;
  qryFactPendiente.Params[0].Value:= CodCte;
  qryFactPendiente.Open;
  //if frmTransCxcProc_R.Showing then
  //edtMontoAcobrar.SetFocus;
end;

procedure tfrmTransCxpProc_R.ProcesaNCF(var serie_asignadoncf:Integer;var ncf:String; tipoNCF:string; Monto: Real);

begin
  frmAsignarNCFVenta:=tfrmAsignarNCFVenta.Create(nil);
  try
    frmAsignarNCFVenta.IBDataSet1.Close;
      frmAsignarNCFVenta.IBDataSet1.Open;
      frmAsignarNCFVenta.IBDataSet1.Insert;
      frmAsignarNCFVenta.IBDataSet1FECHA_INSERT.Value := Now;
      frmAsignarNCFVenta.IBDataSet1FECHA.Value := ExtraerFEcha(GlbFechaTrnDiaria);
      frmAsignarNCFVenta.IBDataSet1CODIGO_USUARIO.Value := VarUsuarioGlb;
      frmAsignarNCFVenta.IBDataSet1STATUS.Value := 'A';

      frmAsignarNCFVenta.IBDataSet1TIPO_NCF.Value := tipoNCF;
      frmAsignarNCFVenta.BitBtn13Click(Self);

      frmAsignarNCFVenta.Asginarncf := frmAsignarNCFVenta.ncfGenerado;

      frmAsignarNCFVenta.IBDataSet1NUMERO_NCF.Value := frmAsignarNCFVenta.ncfGenerado;//rxVentaNCF.Value;
      frmAsignarNCFVenta.IBDataSet1MONTO.Value      := Monto;

      frmAsignarNCFVenta.BitBtn4Click(Self); //Guardar

      if (frmAsignarNCFVenta.ncfGenerado = '') then
      begin
        MessageDlg('NCF no fue generado, desea continuar?',mtWarning, [mbyes,mbno], 0);
        serie_asignadoncf:=-1;
        ncf:='';
      end else
      begin
        serie_asignadoncf := frmAsignarNCFVenta.IBDataSet1SERIE.Value;
        ncf:= frmAsignarNCFVenta.ncfGenerado;
      end;
     finally
    frmAsignarNCFVenta.free;
    frmAsignarNCFVenta:=nil;
    end;
end;

procedure TfrmTransCxpProc_R.BitBtn5Click(Sender: TObject);
var
   ValorNCF : String;
  Serie_Asignadoncf : Integer;
begin
  dmcxp.transCxpNotaCredito.Close;
  dmcxp.transCxpNotaCredito.Open;
  if (rxFacturaACobrar.State in [dsEdit, dsInsert]) then
  rxFacturaACobrar.Post;
  ComboBox1Change(Self);
  if SumarFactAcobrar <> (edtMontoAcobrar.ValueFloat) then
  begin
    MessageDlg('Favor verificar monto trans.', mtError, [mbOK], 0);
    Exit;
  end;
  if (tblDocTransCxcCODIGO.Value <> 5) then //Nota Credito
  begin
    MessageDlg('Solo se permite procesar Nota credito.', mtError, [mbOK], 0);
    Exit;
  end;
  if (edtDisponible.ValueFloat > 0) then
  begin
    MessageDlg('Monto pendiente debe ser igual a cero (0).', mtError, [mbOK], 0);
    Exit;
  end;

  ValorNCF:='';
  Serie_Asignadoncf:=-1;
  frmSelNCF:=TfrmSelNCF.Create(Nil);
  try
    if dmcxp.tblTransCxpTIPO_DOC.Value = 5 then
    dmFactura.ibQryViewNCF.Locate('TIPO_CF','04',[]);

    if (frmSelNCF.ShowModal = mrOK) then
    begin
      ProcesaNCF(Serie_Asignadoncf,ValorNCF,dmFactura.ibQryViewNCFTIPO_CF.Value,SumarFactAcobrar);
      if (GlbUsaSecNCF2018 = 0) then
      GlbDescNCF:=dmFactura.ibQryViewNCFDESCRIPCION.Value
      else
      GlbDescNCF:=dmFactura.ibQryViewNCFDESCRIPCION_2018.Value
    end;
    //aquissss ProcVentaConNCF(dmFactura.ibQryViewNCFTIPO_CF.Value, ValorNCF, serieDoc);
    finally
    frmSelNCF.Free;
    frmSelNCF:= Nil;
    end;
  ProcFacturasACxc(Serie_Asignadoncf);//Registrar pago en tabla trans_cxc

  //RxLabel3.Caption :='Ult. Recibo: '+InttoStr(FNumReciboMax);
  //ImprimirRecibo(0);
  rxFacturaACobrar.Close;
  rxFacturaACobrar.Open;
  edtDisponible.SetFloat(0);
  edtMontoAcobrar.SetFloat(0);
  BitBtn6Click(Self);
  //RxLabel3.Caption :='Ult. Recibo: '+InttoStr(FNumReciboMax);
  ReNumDocumento:=dmcxp.transCxpNotaCreditoNUM_DOC.Value;
  dmcxp.qryRepTransCxpNDB_NCR.Close;
  dmcxp.qryRepTransCxpNDB_NCR.Params[0].Value:= dmcxp.transCxpNotaCreditoNUM_DOC.Value;
  dmcxp.qryRepTransCxpNDB_NCR.Params[1].Value:= 5;//Nota Credito
  dmcxp.qryRepTransCxpNDB_NCR.Open;
  qckRepTransCxp:=TqckRepTransCxp.Create(Nil);
  try
    qckRepTransCxp.qrLabelDescTipoComp.Caption := GlbDescNCF;
    qckRepTransCxp.Preview;
  finally
  qckRepTransCxp.Free;
  qckRepTransCxp:=Nil;
  end;
end;

procedure TfrmTransCxpProc_R.FormCreate(Sender: TObject);
begin
  ReNumDocumento:=-1;
  qCodCte.Close;
  qCodCte.Open;
  rxAcumulador.Close;
  rxAcumulador.Open;
  cont:=0;
  CodCte:=0;
  rxFormaPago.Close;
  rxFormaPago.Open;
  rxFormaPago.Insert;
  rxFormaPago.Insert;
  dmingresos.tblIngresoMaster.Close;
  dmingresos.tblIngresoMaster.Open;
  //RxLabel3.Caption :='Ult. Recibo: '+InttoStr(FNumReciboMax);
  dmCxp.tblTransCxp.Close;
  dmCxp.tblTransCxp.Params[0].value:= GlbFechaTrnDiaria;
  dmCxp.tblTransCxp.Params[1].value:= GlbFechaTrnDiaria;
  dmCxp.tblTransCxp.Open;
  //dmIngresos.tblFormaPago.First;
  ComboBox1.Clear;

  dmCxp.tblTipoTrnDoc.Close;
  dmCxp.tblTipoTrnDoc.Open;
  
  tblDocTransCxc.Close;
  tblDocTransCxc.Open;
  While Not tblDocTransCxc.Eof do
  begin
    if tblDocTransCxcCodigo.Value = 5 then
    begin
      ComboBox1.Items.Add(tblDocTransCxcDESCRIPCION.Value);
      ComboBox1.Text:= tblDocTransCxcDESCRIPCION.Value;
    end;
    tblDocTransCxc.Next;
  end;
  xnumfact:=0;
end;

procedure TfrmTransCxpProc_R.BitBtn6Click(Sender: TObject);
begin
  rxAcumulador.Close;
  rxAcumulador.Open;
  rxFacturaACobrar.Close;
  rxFacturaACobrar.Open;
  qryfactpendiente.Close;
  qryfactpendiente.Open;
  BitBtn7Click(Self);
end;

function TfrmTransCxpProc_R.TotalFacturas: Real;
var
   monto : Real;
   i : integer;
begin
  monto:=0;
  if (rxDBGrid1.SelectedRows.Count > 0) then
  with rxDBGrid1.DataSource.DataSet do
  for i:=0 to rxDBGrid1.SelectedRows.Count-1 do
  begin
    GotoBookmark(pointer(rxDBGrid1.SelectedRows.Items[i]));
    monto := monto + qryFactPendienteMONTO_PENDIENTE.Value;
  end;
  result := monto;
end;

procedure TfrmTransCxpProc_R.ProcSumar;
  var
    x : Integer;
begin
  if Not Assigned(frmTransCxpProc_R) then Exit;

  if frmTransCxpProc_R.Showing then
  begin
    if rxAcumulador.recordcount = 0 then
    begin
      rxAcumulador.Insert;
      rxAcumuladorMonto.Value:=0;
      rxAcumulador.Post;
    end;
    rxAcumulador.Edit;
    rxAcumuladorMonto.Value:=edtMontoAcobrar.ValueFloat - SumarFactAcobrar;
    if (rxAcumuladorMonto.Text <> '') then
    begin
      try
        if (rxAcumuladorMonto.Value >= 0) then
        edtDisponible.SetFloat(rxAcumuladorMonto.Value);
      except
      end;
    end;
    if edtDisponible.ValueFloat < 0 then
       RxLabel1.Font.Color:=clRed else
    RxLabel1.Font.Color:= clWindowText;
    rxAcumulador.Post;
  end;
end;

procedure TfrmTransCxpProc_R.BitBtn7Click(Sender: TObject);
begin
  ProcSumar;
end;

procedure TfrmTransCxpProc_R.BitBtn3Click(Sender: TObject);
begin
  ProcInsertaFactura(2{solo fact actual},1{Completa});
  BitBtn7Click(Self);
end;

procedure TfrmTransCxpProc_R.BitBtn2Click(Sender: TObject);
begin
  if rxFacturaACobrar.RecordCount > 0 then
  rxFacturaACobrar.Delete;
  BitBtn7Click(Self);
end;

procedure TfrmTransCxpProc_R.BitBtn4Click(Sender: TObject);
begin
  if MessageDlg('Cancelar facturas seleccionadas?', mtInformation, [mbyes, mbno], 0)=mryes then
  begin
    rxFacturaACobrar.First;
    While Not rxFacturaACobrar.Eof Do
    begin
      rxFacturaACobrar.Delete;
    end;
  end;
  BitBtn7Click(Self);
end;


function TfrmTransCxpProc_R.SumarFactAcobrar: Real;
var
  t : Real;
begin
  t:=0;
  if rxFacturaACobrar.State = dsInactive then Exit;  
  rxFacturaACobrar.first;
  while not rxFacturaACobrar.eof do
  begin
    t:=t + rxFacturaACobrarMontoAbonado.Value;
    rxFacturaACobrar.Next;
  end;
  result := t;
  RxLabel2.Caption:= InsertarComa(FloatToStr(t));
  //if (edtMontoAcobrar.ValueFloat >= t) then
  //RadioButton1.Checked := true
  //else
  //if (edtMontoAcobrar.ValueFloat < t) then
  //RadioButton1.Checked:=True;
end;

procedure TfrmTransCxpProc_R.edtMontoAcobrarChange(Sender: TObject);
begin
  if edtMontoAcobrar.ValueFloat > 0 then
  begin
  BitBtn1.Enabled:=True;
  BitBtn2.Enabled:=True;
  BitBtn3.Enabled:=True;
  BitBtn4.Enabled:=True;
  end else
  begin
  BitBtn1.Enabled:=False;
  BitBtn2.Enabled:=False;
  BitBtn3.Enabled:=False;
  BitBtn4.Enabled:=False;
  end;
end;

procedure TfrmTransCxpProc_R.ProcFacturasACxc(Serie_Asignadoncf: integer);
var
  xNumDoc : Integer;
begin
  xNumDoc :=-1;
  if dmcxp.tblTransCxp.State = dsInactive then
  begin
    dmcxp.tblTransCxp.Close;
    dmcxp.tblTransCxp.Open;
  end;
  rxFacturaACobrar.First;
  While Not rxFacturaACobrar.Eof do
  begin
    dmcxp.tblTransCxp.Insert;
    dmcxp.tblTransCxpserie.Value := FsqlMaxNumero('TRANS_CXP','SERIE');
    if dmcxp.tblTransCxpserie.Value = 0 then
    dmcxp.tblTransCxpserie.Value          := 1;
    dmcxp.tblTransCxptipo_doc.Value       := tblDocTransCxcCODIGO.Value; //Recibo
    dmcxp.tblTransCxpmoneda.Value         := '1';
    dmcxp.tblTransCxpfecha.Value          := ExtraerFecha(GlbFechaTrnDiaria);
    dmcxp.tblTransCxpnumero_doc.Value     := rxFacturaACobrarNumFactura.Value;
    dmcxp.tblTransCxptipo_serv.Value      := 1;
    dmcxp.tblTransCxpcodigo_cliente.Value := rxFacturaACobrarCodCte.Value;
    dmcxp.tblTransCxpcodigo_serv.Value    := 0;
    dmcxp.tblTransCxpValor_documento.Value:= rxFacturaACobrarMontoAbonado.Value;
    if (tblDocTransCxcCODIGO.Value = 5) then //Nota Credito
    begin
      dmcxp.tblTransCxpTipo_tranf.Value   := 2;
      if rxFacturaACobrarConcepto.IsNull then
      dmcxp.tblTransCxpconcepto.Value     := 'Nota Crédito Fact. #' + rxFacturaACobrarNumFactura.AsString
      else
      dmcxp.tblTransCxpconcepto.Value     :=rxFacturaACobrarConcepto.Value;
    end;
    dmcxp.tblTransCxpStatus.Value         := 'R';
    dmcxp.tblTransCxp.Post;
    dmcxp.tblTransCxp.ApplyUpdates;
    if (xNumDoc < 0 ) then
    begin
      stpProcNumDoc.Params[1].Value:= 5;
      stpProcNumDoc.ExecProc;
      xNumDoc := stpProcNumDoc.Params[0].Value;
    end;
    //Actualizar trans_cxc_det - registra datos nota credito
    dmcxp.transCxpNotaCredito.Insert;
    dmcxp.transCxpNotaCreditoSERIE.Value   := dmcxp.tblTransCxpserie.AsInteger;
    dmcxp.transCxpNotaCreditoNUM_DOC.Value := xNumDoc;
    dmcxp.transCxpNotaCreditoNUMERO_FACT.Value:= rxFacturaACobrarNumFactura.Value;
    if (Serie_Asignadoncf > 0 ) then
    dmcxp.transCxpNotaCreditoSERIE_NCF_ASIGNADO.Value:=Serie_Asignadoncf;

    dmcxp.transCxpNotaCredito.Post;
    dmcxp.transCxpNotaCredito.ApplyUpdates;

    ProcUpdateFactPendiente;//Actualiza tabla factura pendiente

    rxFacturaACobrar.Next;
  end;

  if Not dmcxp.transCxpNotaCredito.Transaction.InTransaction then
  dmcxp.transCxpNotaCredito.transaction.StartTransaction;
  try
    dmcxp.transCxpNotaCredito.transaction.CommitRetaining;
  except
  dmcxp.transCxpNotaCredito.transaction.RollbackRetaining;
  end;

  if Not dmcxp.tblTransCxp.Transaction.InTransaction then
  dmcxp.tblTransCxp.transaction.StartTransaction;
  try
    dmcxp.tblTransCxp.transaction.CommitRetaining;
  except
  dmcxp.tblTransCxp.transaction.RollbackRetaining;
  end;

  if Not stp_UpdateCxp.Transaction.InTransaction then
  stp_UpdateCxp.transaction.StartTransaction;
  try
    stp_UpdateCxp.transaction.CommitRetaining;
  except
  stp_UpdateCxp.transaction.RollbackRetaining;
  end;
end;

procedure TfrmTransCxpProc_R.ProcUpdateFactPendiente;
begin
  //stp_UpdateCxc.Params[0].Value:= //Valor_Pendiente;
  stp_UpdateCxp.Params[1].Value:= 0;//tipo
  stp_UpdateCxp.Params[2].Value:= '1';//moneda
  stp_UpdateCxp.Params[3].Value:= rxFacturaACobrarNumFactura.Value;//numero_fact
  stp_UpdateCxp.Params[4].Value:= rxFacturaACobrarMontoAbonado.Value;//monto_pagado
  stp_UpdateCxp.Params[5].Value:= 'A';//status
  stp_UpdateCxp.Params[6].Value:= 1;//accion 1 = abono
  stp_UpdateCxp.Params[7].Value:= rxFacturaACobrarCodCte.Value;//CODIGO_CTE_IN
  stp_UpdateCxp.Params[8].Value:= GlbFechaTrnDiaria;
  stp_UpdateCxp.Params[9].Value:= dmcxp.tblTransCxpserie.Value;

  stp_UpdateCxp.ExecProc;    //UPDATE balance_cte, facturas_pendiente,
                             //TRANS_CXC = R
  if not stp_UpdateCxp.Transaction.InTransaction then
  stp_UpdateCxp.Transaction.StartTransaction;
  try
    stp_UpdateCxp.Transaction.CommitRetaining;
  except
  stp_UpdateCxp.Transaction.RollbackRetaining;
  end;
end;

procedure TfrmTransCxpProc_R.ReImprimirRecibo1Click(Sender: TObject);
begin
  if (ReNumDocumento < 0) then
  ReNumDocumento:=StrToInt(Inputbox('Re-Imprimir Nota Crédito','Entre número',''))
  else ReNumDocumento:=StrToInt(Inputbox('Re-Imprimir Nota Crédito','Entre número',InttoStr(ReNumDocumento)));
  if (ReNumDocumento > 0) then
  begin
  dmcxp.qryRepTransCxpNDB_NCR.Close;
  dmcxp.qryRepTransCxpNDB_NCR.Params[0].Value:= ReNumDocumento;
  dmcxp.qryRepTransCxpNDB_NCR.Params[1].Value:= 5;//Nota Credito
  dmcxp.qryRepTransCxpNDB_NCR.Open;
  qckRepTransCxp:=TqckRepTransCxp.Create(Nil);
  try
    qckRepTransCxp.qrLabelDescTipoComp.Caption := GlbDescNCF;
    qckRepTransCxp.Preview;
  finally
  qckRepTransCxp.Free;
  qckRepTransCxp:=Nil;
  end;
  end;
end;

procedure TfrmTransCxpProc_R.BuscarCliente1Click(Sender: TObject);
begin
  frmProcBuscarProv:=TfrmProcBuscarProv.Create(Nil);
  try
    if frmProcBuscarProv.ShowModal = mrOk then
    begin
      frmTransCxpProc_R.CodCte:=frmProcBuscarProv.xCodigoCte;
      dmproveedor.qryProveCxp.Locate('CODIGO_CTE', frmProcBuscarProv.xCodigoCte,[]);      
      //strNombreEmpresa:= frmProcBuscarProv.Nombrecliente;
      FormShow(Self);
    end;
  finally
  frmProcBuscarProv.free;
  frmProcBuscarProv:=nil;
  end;
end;

procedure TfrmTransCxpProc_R.RxDBLookupCombo1Exit(Sender: TObject);
begin
  if rxFormaPago.State in [dsEdit, dsInsert] then
  rxFormaPago.Post;
end;

function TfrmTransCxpProc_R.FNumReciboMax: Integer;
begin
  ibsqlLastNum.Close;
  ibsqlLastNum.ExecQuery;
  Result := ibsqlLastNum.FieldByName('numeromax').AsInteger;
end;

procedure TfrmTransCxpProc_R.BitBtn10Click(Sender: TObject);
begin
  if dmCxp.tblTransCxp.state in [dsEdit, dsInsert] then exit;
  dmCxp.tblTransCxp.Close;
  dmCxp.tblTransCxp.Params[0].value:= GlbFechaTrnDiaria;
  dmCxp.tblTransCxp.Params[1].value:= GlbFechaTrnDiaria;
  dmCxp.tblTransCxp.Open;
end;

procedure TfrmTransCxpProc_R.ComboBox1Change(Sender: TObject);
begin
  if Not tblDocTransCxc.Locate('DESCRIPCION', Combobox1.Text,[]) then
  MessageDlg('Tipo transacción no encontrada, verifique.', mtInformation, [mbOK], 0);
end;

procedure TfrmTransCxpProc_R.BitBtn9Click(Sender: TObject);
begin
  close;
end;

procedure TfrmTransCxpProc_R.btnInsertarClick(Sender: TObject);
begin
  if dmcxp.transCxpNotaCredito.State = dsInactive then
  begin
    dmcxp.transCxpNotaCredito.Close;
    dmcxp.transCxpNotaCredito.Open;
  end;
  
  if dmCxp.tblTransCxp.State = dsBrowse then
  begin
    dmCxp.tblTransCxp.Insert;
    dmCxp.tblTransCxpIN_POR.Value  :=StrUserName;
    dmCxp.tblTransCxpFECHA_IN.Value:= Now;
    dmCxp.tblTransCxpTIPO_SERV.value:=1;
    dmCxp.tblTransCxpMONEDA.Value:='1';
    dmCxp.tblTransCxpSTATUS.Value  :='A';
    dmCxp.tblTransCxpCODIGO_CLIENTE.Value := CodCte;
    dmCxp.tblTransCxpCODIGO_USUARIO.Value:=VarUsuarioGlb;
    dmCxp.tblTransCxpFECHA.Value:= ExtraerFecha(GlbFechaTrnDiaria);
    //t dmCxp.tblTransCxpCODIGO_VENDEDOR.Value:= VarUsuarioGlb;

    //dmCxp.tblTransCxpCONCEPTO.Value:='Nota Debito';
    dmcxp.tblTransCxpTIPO_DOC.Value:=3;
    RxDBLookupCombo4.SetFocus;
  end;
end;

procedure TfrmTransCxpProc_R.BitBtn8Click(Sender: TObject);
var
ValorNCF: String;
  Serie_Asignadoncf: Integer;
  xNumDoc : Integer;
begin
  xNumDoc:=-1;
  if lblMensagefact.Visible then
  begin
    MessageDlg('Favor seleccionar numero de factura',mterror,[mbok],0);
    Exit;
  end;
  if dmCxp.tblTransCxp.State in [dsInsert, dsEdit] then
  begin
    if dmCxp.tblTransCxp.State in [dsInsert] then
    begin
      stpProcNumDoc.Params[1].Value:= 3;
      stpProcNumDoc.ExecProc;
      xNumDoc := stpProcNumDoc.Params[0].Value;
      if xNumDoc  = 0 then
      xNumDoc :=1;
    end;

    if dmCxp.tblTransCxpCONCEPTO.Isnull then
    begin
      DBEdit3.setfocus;
      exit;
    end;
    dmCxp.tblTransCxpNUMERO_DOC.Value:=xnumfact;
    dmCxp.tblTransCxp.Post;
    dmCxp.tblTransCxp.ApplyUpdates;

  ValorNCF:='';
  Serie_Asignadoncf:=-1;
  frmSelNCF:=TfrmSelNCF.Create(Nil);
  try
    if dmcxp.tblTransCxpTIPO_DOC.Value = 3 then
    dmFactura.ibQryViewNCF.Locate('TIPO_CF','03',[])
    else
    dmFactura.ibQryViewNCF.Locate('TIPO_CF','04',[]);

    if (frmSelNCF.ShowModal = mrOK) then
    begin
      ProcesaNCF(Serie_Asignadoncf,ValorNCF,dmFactura.ibQryViewNCFTIPO_CF.Value,dmCxp.tblTransCxpVALOR_DOCUMENTO.Value);
      if (GlbUsaSecNCF2018 = 0) then
      GlbDescNCF:=dmFactura.ibQryViewNCFDESCRIPCION.Value
      else
      GlbDescNCF:=dmFactura.ibQryViewNCFDESCRIPCION_2018.Value;
    end;
    //aquissss ProcVentaConNCF(dmFactura.ibQryViewNCFTIPO_CF.Value, ValorNCF, serieDoc);
    finally
    frmSelNCF.Free;
    frmSelNCF:= Nil;
    end;


    //dmcxp.transCxpNotaCredito.State
    //Actualizar trans_cxc_det - registra datos nota credito
    dmcxp.transCxpNotaCredito.Insert;
    dmcxp.transCxpNotaCreditoSERIE.Value := dmCxp.tblTransCxpserie.AsInteger;

    dmcxp.transCxpNotaCreditoNUM_DOC.Value := xNumDoc;
    dmcxp.transCxpNotaCreditoNUMERO_FACT.Value := xnumfact; 
    if (Serie_Asignadoncf > 0 ) then
    dmcxp.transCxpNotaCreditoSERIE_NCF_ASIGNADO.Value:=Serie_Asignadoncf;

    dmcxp.transCxpNotaCredito.Post;
    dmcxp.transCxpNotaCredito.ApplyUpdates;

    if not dmCxp.transCxpNotaCredito.Transaction.InTransaction then
    dmCxp.transCxpNotaCredito.Transaction.StartTransaction;

    try
      dmCxp.transCxpNotaCredito.Transaction.CommitRetaining;
    except
    dmCxp.transCxpNotaCredito.Transaction.RollbackRetaining;
    end;

    if not dmCxp.tblTransCxp.Transaction.InTransaction then
    dmCxp.tblTransCxp.Transaction.StartTransaction;

    try
      dmCxp.tblTransCxp.Transaction.CommitRetaining;
    except
    dmCxp.tblTransCxp.Transaction.RollbackRetaining;
    end;

    //Habilitar para Reporte
    dmcxp.qryRepTransCxpNDB_NCR.Close;
    dmcxp.qryRepTransCxpNDB_NCR.Params[0].Value:= dmcxp.transCxpNotaCreditoNUM_DOC.Value;
    dmcxp.qryRepTransCxpNDB_NCR.Params[1].Value:= 3;
    dmcxp.qryRepTransCxpNDB_NCR.Open;

    if CheckBox1.Checked then
    BitBtn12Click(Self);
    qckRepTransCxp:=TqckRepTransCxp.Create(Nil);
    try
      qckRepTransCxp.Preview;
    finally
    qckRepTransCxp.Free;
    qckRepTransCxp:=Nil;
    end;
  end;
  xnumfact:=0;
  lblMensagefact.Visible:=False;
end;

procedure TfrmTransCxpProc_R.BitBtn13Click(Sender: TObject);
begin
  if dmCxp.tblTransCxp.State in [dsBrowse] then
  begin
    if (dmCxp.tblTransCxpStatus.Value = 'A') then
    dmCxp.tblTransCxp.Edit else
    begin
      MessageDlg('Transaccion no puede ser modificada, verifique.',mtError, [mbOK], 0);
    end;
  end;
end;

procedure TfrmTransCxpProc_R.BitBtn11Click(Sender: TObject);
begin
  if dmCxp.tblTransCxp.State in [dsEdit, dsInsert] then
  begin
    if MessageDlg('Cancelar transaccions?', mtInformation, [mbYes, mbNo], 0) = mryes then
    dmCxp.tblTransCxp.Cancel;
    Exit;
  end;
  if (dmCxp.tblTransCxpStatus.Value = 'A') then
  begin
    if MessageDlg('Eliminar transacción?', mtInformation, [mbYes, mbNo], 0) = mryes then
    begin
      dmCxp.tblTransCxp.Delete;
      dmCxp.tblTransCxp.ApplyUpdates;
      if not dmCxp.tblTransCxp.Transaction.InTransaction then
      dmCxp.tblTransCxp.Transaction.StartTransaction;

      try
        dmCxp.tblTransCxp.Transaction.CommitRetaining;
      except
      dmCxp.tblTransCxp.Transaction.RollbackRetaining;
      end;
    end;
  end;
end;

procedure TfrmTransCxpProc_R.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if dmCxp.tblTransCxp.State in [dsEdit, dsInsert] then
  begin
    MessageDlg('Transaccion pendiente', mtInformation, [mbOk], 0);
    CanClose:=false;
  end else
  if dmCxp.tblTransCxpStatus.value = 'A' then
  begin
   MessageDlg('Favor postear trans cxc.', mtInformation, [mbOk], 0);
   Pagecontrol1.ActivePage := TabSheet2;
   //BitBtn12.SetFocus;
   CanClose:=false;
  end else
  if dmCxp.tblTransCxp.State in [dsBrowse, dsInactive] then
  CanClose:=True;
end;

procedure TfrmTransCxpProc_R.BitBtn12Click(Sender: TObject);
begin
  if dmCxp.tblTransCxp.State In [dsInsert, dsEdit] then
  Exit;

  if dmcxp.transCxpNotaCredito.State = dsInactive then
  begin
    dmcxp.transCxpNotaCredito.Close;
    dmcxp.transCxpNotaCredito.Open;
  end;
  if dmCxp.tblTransCxpCODIGO_CLIENTE.IsNull then exit;
  dmCxp.tblTransCxp.first;
  While Not dmCxp.tblTransCxp.Eof Do
  begin
    if (dmCxp.tblTransCxpStatus.Value = 'A') then
    begin
      ActBalaceCteP(1);
    end;
    dmCxp.tblTransCxp.next;
  end;                        //TRANS_CXC = R
end;

procedure TfrmTransCxpProc_R.ActBalaceCteP(operacion: smallint);
var
  Monto:Real;
begin
  if dmcxp.QrybalanceCtes.state = dsinactive then
  dmcxp.QrybalanceCtes.Open;
  if (Operacion=2) then
  Monto:=dmCxp.tblTransCxpVALOR_DOCUMENTO.Value*-1
  else Monto:=dmCxp.tblTransCxpVALOR_DOCUMENTO.Value;
  if dmcxp.QrybalanceCtes.Locate('CODIGO;TIPO;MONEDA',
     VarArrayOf([dmCxp.tblTransCxpcodigo_cliente.Value,
                 0,dmCxp.tblTransCxpMONEDA.Value]),[]) then
  begin
    EditarBalanceP(Monto);
  end else
  begin
    InsertaBalanceP(Monto);
  end;
  if dmcxp.qryBalanceCtes.State in [dsEdit, dsInsert] then
  begin
    dmcxp.qryBalanceCtes.Post;
    dmcxp.qryBalanceCtes.ApplyUpdates;
  end;
  dmCxp.tblTransCxp.Edit;
  dmCxp.tblTransCxpSTATUS.Value:= 'R';
  dmCxp.tblTransCxp.Post;
  dmCxp.tblTransCxp.ApplyUpdates;
  if Not dmCxp.tblTransCxp.Transaction.InTransaction then
  dmCxp.tblTransCxp.Transaction.StartTransaction;
  try
    dmCxp.tblTransCxp.Transaction.CommitRetaining;
  except
  dmCxp.tblTransCxp.Transaction.RollbackRetaining;
  end;
  if Not dmcxp.qryBalanceCtes.Transaction.InTransaction then
  dmcxp.qryBalanceCtes.Transaction.StartTransaction;
  try
    dmcxp.qryBalanceCtes.Transaction.CommitRetaining;
  except
  dmcxp.qryBalanceCtes.Transaction.RollbackRetaining;
  end;
end;

procedure TfrmTransCxpProc_R.EditarBalanceP(monto: Real);
begin
  dmcxp.qryBalanceCtes.Edit;
  dmcxp.qryBalanceCtesFECHA_BCE.Value:= dmCxp.tblTransCxpFECHA.Value;
  dmcxp.qryBalanceCtesBALANCE_ANT.Value:=dmcxp.qryBalanceCtesBALANCE_ACT.Value;
  dmcxp.qryBalanceCtesBALANCE_ACT.Value:=//+
  dmcxp.qryBalanceCtesBALANCE_ACT.Value + Monto;//dmCxp.tblTransCxpVALOR_DOCUMENTO.Value;
  dmcxp.qryBalanceCtesDEBITO_MES.Value:=//+
  dmcxp.qryBalanceCtesDEBITO_MES.Value + Monto;//dmCxp.tblTransCxpvalor_documento.Value;
  dmcxp.qryBalanceCtesDEBITO_ACM.Value:=//+
  dmcxp.qryBalanceCtesDEBITO_ACM.Value + Monto;//dmCxp.tblTransCxpvalor_documento.Value;
end;

procedure TfrmTransCxpProc_R.InsertaBalanceP(monto: Real);
begin
  dmcxp.qryBalanceCtes.Insert;
  dmCxp.qryBalanceCtescia_key.value:= GlbCodigoCia;
  dmcxp.qryBalanceCtesCODIGO.Value    := dmCxp.tblTransCxpCODIGO_CLIENTE.Value;
  dmcxp.qryBalanceCtesTIPO.Value      := 0;
  //dmcxp.qryBalanceCtesSERVICIO.Value  := 0; //dmCxc.qryProcServcodigo_serv.Value;
  dmcxp.qryBalanceCtesMONEDA.Value    := '1';// dmCxc.qryProcServmoneda.Value;

  dmcxp.qryBalanceCtesBALANCE_ACT.Value := 0;
  dmcxp.qryBalanceCtesDEBITO_MES.Value  := 0;
  dmcxp.qryBalanceCtesDEBITO_ACM.Value  := 0;
  dmcxp.qryBalanceCtesCREDITO_MES.Value := 0;
  dmcxp.qryBalanceCtesCREDITO_ACM.Value := 0;
  dmcxp.qryBalanceCtesBALANCE_ANT.Value := 0;

  if dmcxp.qryBalanceCtesMONEDA.IsNull then
  dmcxp.qryBalanceCtesMONEDA.Value:='1';
  //chequear moneda
  dmcxp.qryBalanceCtesSTATUS_BCE.Value:= 'A';
  dmcxp.qryBalanceCtesFECHA_BCE.Value := ExtraerFecha(Now);//dmCxc.qryProcServfecha.Value;
  dmcxp.qryBalanceCtesFECHA_IN.Value  :=Now;
  dmcxp.qryBalanceCtesIN_POR.Value    :=StrUserName;
  if (dmCxp.tblTransCxpTIPO_DOC.Value = 1) or (dmCxp.tblTransCxpTIPO_DOC.Value = 3) then
  begin
   dmcxp.qryBalanceCtesBALANCE_ACT.Value:= Monto;
   dmcxp.qryBalanceCtesDEBITO_MES.Value := Monto;
   dmcxp.qryBalanceCtesDEBITO_ACM.Value := Monto;
  end else
  if (dmCxp.tblTransCxpTIPO_DOC.Value = 2) Or (dmCxp.tblTransCxpTIPO_DOC.Value = 4) or
  (dmCxp.tblTransCxpTIPO_DOC.Value = 5) then
  begin
    if (dmCxp.tblTransCxpTIPO_DOC.Value = 4) And ((dmCxp.tblTransCxpTIPO_DOC.Value = 1) ) then
    begin
      dmcxp.qryBalanceCtesBALANCE_ACT.Value:= Monto;
      dmcxp.qryBalanceCtesDEBITO_MES.Value := Monto;
      dmcxp.qryBalanceCtesDEBITO_ACM.Value := Monto;
    end else
    begin
      dmcxp.qryBalanceCtesBALANCE_ACT.Value:=//-
      dmcxp.qryBalanceCtesBALANCE_ACT.Value - monto;//dmCxc.qryProcServVALOR_DOCUMENTO.Value;
      dmcxp.qryBalanceCtesCREDITO_MES.Value:= monto;//dmCxc.qryProcServVALOR_DOCUMENTO.Value;
      dmcxp.qryBalanceCtesCREDITO_ACM.Value:= monto;//dmCxc.qryProcServVALOR_DOCUMENTO.Value;
      dmcxp.qryBalanceCtesFECHA_ULT_PAGO.Value:= Now;//dmCxc.qryProcServfecha.Value;
    end;
  end;
end;

procedure TfrmTransCxpProc_R.RxDBGrid3GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if dmCxp.tblTransCxpSTATUS.Value <> 'A' then
  begin
    BackGround := clyellow;
    Afont.Color:= clGreen;
  end;
end;

procedure TfrmTransCxpProc_R.RxDBLookupCombo4Exit(Sender: TObject);
begin
  if dmCxp.tblTransCxp.State in [dsedit, dsInsert] then
  begin
    if dmCxp.tblTransCxpTIPO_DOC.Value = 3 then
    dmCxp.tblTransCxpTIPO_TRANF.Value:=1
    else if dmCxp.tblTransCxpTIPO_DOC.Value = 5 then
    dmCxp.tblTransCxpTIPO_TRANF.Value:=2;
  end;
end;

procedure TfrmTransCxpProc_R.ReImprimirNDB1Click(Sender: TObject);
begin
  if (ReNumDocumento < 0) then
  ReNumDocumento:=StrToInt(Inputbox('Re-Imprimir Nota Débito','Entre número',''))
  else ReNumDocumento:=StrToInt(Inputbox('Re-Imprimir Nota Débito','Entre número',InttoStr(ReNumDocumento)));
  if (ReNumDocumento > 0) then
  begin
  dmcxp.qryRepTransCxpNDB_NCR.Close;
  dmcxp.qryRepTransCxpNDB_NCR.Params[0].Value:= ReNumDocumento;
  dmcxp.qryRepTransCxpNDB_NCR.Params[1].Value:= 3;//Nota Debito
  dmcxp.qryRepTransCxpNDB_NCR.Open;
  qckRepTransCxp:=TqckRepTransCxp.Create(Nil);
  try
    qckRepTransCxp.qrLabelDescTipoComp.Caption := GlbDescNCF;
    qckRepTransCxp.Preview;
  finally
  qckRepTransCxp.Free;
  qckRepTransCxp:=nil;
  end;
  end;
end;

procedure TfrmTransCxpProc_R.RxDBGrid1CellClick(Column: TColumn);
begin
  xnumfact := qryFactPendienteNUMERO_FACT.Value;
end;

procedure TfrmTransCxpProc_R.TabSheet2Enter(Sender: TObject);
begin
  if (xnumfact <= 0) then
  begin
    lblMensagefact.Visible:= True;
    lblMensagefact.Caption:= 'Debe seleccionar número de factura.';
  end else lblMensagefact.Visible:= False;
end;

procedure TfrmTransCxpProc_R.RxDBGrid4CellClick(Column: TColumn);
begin
  xnumfact := qryFactPendienteNUMERO_FACT.Value;
  TabSheet2Enter(Self);
end;

end.
