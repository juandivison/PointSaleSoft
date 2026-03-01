unit UFormTransCxcDbCr_r;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, Grids, DBGrids, RXDBCtrl,
  WinSkinData, StdCtrls, EditNew, RxMemDS, Buttons, ExtCtrls, RXCtrls,
  IBStoredProc, Menus, RxLookup, IBSQL, DBCtrls, Mask, rxToolEdit, RxDBComb,
  ComCtrls, IBTable;

type
  TfrmTransCxcProc_R = class(TForm)
    SkinData1: TSkinData;
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
    stp_UpdateCxc: TIBStoredProc;
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
  frmTransCxcProc_R: TfrmTransCxcProc_R;
  cont : Integer;
  strNumero : String;
  ReNumDocumento : Integer;

implementation

uses UDatModConectar, UGlobal, UDatModCxc, UDatModIngresos,
  UDatModUsuarios, URepReciboAbonoCXC, UBuscarClientesPersonasP,
  UCobrarFacturas, URepIngresoDet, uFormAsignarNCFVenta, USeleccionarNCF,
  UDatModFactura;

{$R *.dfm}

procedure TfrmTransCxcProc_R.BitBtn1Click(Sender: TObject);
begin
  ProcInsertaFactura(1{solo fact actual},1{Completa});
  BitBtn7Click(Self);
end;

procedure TfrmTransCxcProc_R.ProcInsertaFactura(x, y: smallint);
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
          //t if qryFactPendienteMONTO_PENDIENTE.Value > edtMontoAcobrar.ValueFloat then
          if qryFactPendienteMONTO_PENDIENTE.Value > edtDisponible.ValueFloat then
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

procedure TfrmTransCxcProc_R.RxDBGrid1Exit(Sender: TObject);
begin
  //if rxDBGrid1.SelectedRows.Count > 1 then
  //begin
  //  RadioButton1.Checked := True;
  //end;
  ProcSumar;
end;

procedure TfrmTransCxcProc_R.FormShow(Sender: TObject);
begin
  qryFactPendiente.Close;
  qryFactPendiente.Params[0].Value:= CodCte;
  qryFactPendiente.Open;
  //if frmTransCxcProc_R.Showing then
  //edtMontoAcobrar.SetFocus;
end;

procedure tfrmtransCxcProc_r.ProcesaNCF(var serie_asignadoncf:Integer;var ncf:String; tipoNCF:string; Monto: Real);

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

procedure TfrmTransCxcProc_R.BitBtn5Click(Sender: TObject);
var
   ValorNCF : String;
  Serie_Asignadoncf : Integer;
begin
  dmcxc.transCxcNotaCredito.Close;
  dmcxc.transCxcNotaCredito.Open;
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
    if (frmSelNCF.ShowModal = mrOK) then
    begin
      ProcesaNCF(Serie_Asignadoncf,ValorNCF,dmFactura.ibQryViewNCFTIPO_CF.Value,SumarFactAcobrar);
      GlbDescNCF:=dmFactura.ibQryViewNCFDESCRIPCION.Value;
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
  ReNumDocumento:=dmcxc.transCxcNotaCreditoNUM_DOC.Value;
  dmcxc.qryRepTransCxcNDB_NCR.Close;
  dmcxc.qryRepTransCxcNDB_NCR.Params[0].Value:= dmcxc.transCxcNotaCreditoNUM_DOC.Value;
  dmcxc.qryRepTransCxcNDB_NCR.Params[1].Value:= 5;//Nota Credito  
  dmcxc.qryRepTransCxcNDB_NCR.Open;
  qckRepTransCxc:=TqckRepTransCxc.Create(Nil);
  try
    qckRepTransCxc.qrLabelDescTipoComp.Caption := GlbDescNCF;
    qckRepTransCxc.Preview;
  finally
  qckRepTransCxc.Free;
  qckRepTransCxc:=nil;
  end;
end;

procedure TfrmTransCxcProc_R.FormCreate(Sender: TObject);
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
  dmCxc.tblTransCxc.Close;
  dmCxc.tblTransCxc.Params[0].value:= GlbFechaTrnDiaria;
  dmCxc.tblTransCxc.Params[1].value:= GlbFechaTrnDiaria;
  dmCxc.tblTransCxc.Open;
  //dmIngresos.tblFormaPago.First;
  ComboBox1.Clear;

  dmCxc.tblTipoTrnDoc.Close;
  dmCxc.tblTipoTrnDoc.Open;
  
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
end;

procedure TfrmTransCxcProc_R.BitBtn6Click(Sender: TObject);
begin
  rxAcumulador.Close;
  rxAcumulador.Open;
  rxFacturaACobrar.Close;
  rxFacturaACobrar.Open;
  qryfactpendiente.Close;
  qryfactpendiente.Open;
  BitBtn7Click(Self);
end;

function TfrmTransCxcProc_R.TotalFacturas: Real;
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

procedure TfrmTransCxcProc_R.ProcSumar;
  var
    x : Integer;
begin
  if Not Assigned(frmTransCxcProc_R) then Exit;

  if frmTransCxcProc_R.Showing then
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

procedure TfrmTransCxcProc_R.BitBtn7Click(Sender: TObject);
begin
  ProcSumar;
end;

procedure TfrmTransCxcProc_R.BitBtn3Click(Sender: TObject);
begin
  ProcInsertaFactura(2{solo fact actual},1{Completa});
  BitBtn7Click(Self);
end;

procedure TfrmTransCxcProc_R.BitBtn2Click(Sender: TObject);
begin
  if rxFacturaACobrar.RecordCount > 0 then
  rxFacturaACobrar.Delete;
  BitBtn7Click(Self);
end;

procedure TfrmTransCxcProc_R.BitBtn4Click(Sender: TObject);
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


function TfrmTransCxcProc_R.SumarFactAcobrar: Real;
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

procedure TfrmTransCxcProc_R.edtMontoAcobrarChange(Sender: TObject);
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

procedure TfrmTransCxcProc_R.ProcFacturasACxc(Serie_Asignadoncf: integer);
var
  xNumDoc : Integer;
begin
  xNumDoc :=-1;
  if dmcxc.tblTransCxc.State = dsInactive then
  begin
    dmcxc.tblTransCxc.Close;
    dmcxc.tblTransCxc.Open;
  end;
  rxFacturaACobrar.First;
  While Not rxFacturaACobrar.Eof do
  begin
    dmcxc.tblTransCxc.Insert;
    dmcxc.tblTransCxcserie.Value := FsqlMaxNumero('TRANS_CXC','SERIE');
    if dmcxc.tblTransCxcserie.Value = 0 then
    dmcxc.tblTransCxcserie.Value          := 1;
    dmcxc.tblTransCxctipo_doc.Value       := tblDocTransCxcCODIGO.Value; //Recibo
    dmcxc.tblTransCxcmoneda.Value         := '1';
    dmcxc.tblTransCxcfecha.Value          := ExtraerFecha(GlbFechaTrnDiaria);
    dmcxc.tblTransCxcnumero_doc.Value     := rxFacturaACobrarNumFactura.Value;
    dmcxc.tblTransCxctipo_serv.Value      := 1;
    dmcxc.tblTransCxccodigo_cliente.Value := rxFacturaACobrarCodCte.Value;
    dmcxc.tblTransCxccodigo_serv.Value    := 0;
    dmcxc.tblTransCxcValor_documento.Value:= rxFacturaACobrarMontoAbonado.Value;
    if (tblDocTransCxcCODIGO.Value = 5) then //Nota Credito
    begin
      dmcxc.tblTransCxcTipo_tranf.Value   := 2;
      if rxFacturaACobrarConcepto.IsNull then
      dmcxc.tblTransCxcconcepto.Value     := 'Nota Crédito Fact. #' + rxFacturaACobrarNumFactura.AsString
      else
      dmcxc.tblTransCxcconcepto.Value     :=rxFacturaACobrarConcepto.Value;
    end;
    dmcxc.tblTransCxcStatus.Value         := 'R';
    dmcxc.tblTransCxc.Post;
    dmcxc.tblTransCxc.ApplyUpdates;
    if (xNumDoc < 0 ) then
    begin
      stpProcNumDoc.Params[1].Value:= 5;
      stpProcNumDoc.ExecProc;
      xNumDoc := stpProcNumDoc.Params[0].Value;
    end;
    //Actualizar trans_cxc_det - registra datos nota credito
    dmcxc.transCxcNotaCredito.Insert;
    dmcxc.transCxcNotaCreditoSERIE.Value   := dmcxc.tblTransCxcserie.AsInteger;
    dmcxc.transCxcNotaCreditoNUM_DOC.Value := xNumDoc;
    dmcxc.transCxcNotaCreditoNUMERO_FACT.Value:= rxFacturaACobrarNumFactura.Value;
    if (Serie_Asignadoncf > 0 ) then
    dmcxc.transCxcNotaCreditoSERIE_NCF_ASIGNADO.Value:=Serie_Asignadoncf;

    dmcxc.transCxcNotaCredito.Post;
    dmcxc.transCxcNotaCredito.ApplyUpdates;

    ProcUpdateFactPendiente;//Actualiza tabla factura pendiente

    rxFacturaACobrar.Next;
  end;
  
  if Not dmcxc.transCxcNotaCredito.Transaction.InTransaction then
  dmcxc.transCxcNotaCredito.transaction.StartTransaction;
  try
    dmcxc.transCxcNotaCredito.transaction.CommitRetaining;
  except
  dmcxc.transCxcNotaCredito.transaction.RollbackRetaining;
  end;

  if Not dmcxc.tblTransCxc.Transaction.InTransaction then
  dmcxc.tblTransCxc.transaction.StartTransaction;
  try
    dmcxc.tblTransCxc.transaction.CommitRetaining;
  except
  dmcxc.tblTransCxc.transaction.RollbackRetaining;
  end;

  if Not stp_UpdateCxc.Transaction.InTransaction then
  stp_UpdateCxc.transaction.StartTransaction;
  try
    stp_UpdateCxc.transaction.CommitRetaining;
  except
  stp_UpdateCxc.transaction.RollbackRetaining;
  end;
end;

procedure TfrmTransCxcProc_R.ProcUpdateFactPendiente;
begin
  //stp_UpdateCxc.Params[0].Value:= //Valor_Pendiente;
  stp_UpdateCxc.Params[1].Value:= 2;//tipo
  stp_UpdateCxc.Params[2].Value:= '1';//moneda
  stp_UpdateCxc.Params[3].Value:= rxFacturaACobrarNumFactura.Value;//numero_fact
  stp_UpdateCxc.Params[4].Value:= rxFacturaACobrarMontoAbonado.Value;//monto_pagado
  stp_UpdateCxc.Params[5].Value:= 'A';//status
  stp_UpdateCxc.Params[6].Value:= 1;//accion 1 = abono
  stp_UpdateCxc.Params[7].Value:= rxFacturaACobrarCodCte.Value;//CODIGO_CTE_IN
  stp_UpdateCxc.Params[8].Value:= GlbFechaTrnDiaria;
  stp_UpdateCxc.Params[9].Value:= dmcxc.tblTransCxcserie.Value;

  stp_UpdateCxc.ExecProc;    //UPDATE balance_cte, facturas_pendiente,
                             //TRANS_CXC = R
end;

procedure TfrmTransCxcProc_R.ReImprimirRecibo1Click(Sender: TObject);
begin
  if (ReNumDocumento < 0) then
  ReNumDocumento:=StrToInt(Inputbox('Re-Imprimir Nota Crédito','Entre número',''))
  else ReNumDocumento:=StrToInt(Inputbox('Re-Imprimir Nota Crédito','Entre número',InttoStr(ReNumDocumento)));
  if (ReNumDocumento > 0) then
  begin
  dmcxc.qryRepTransCxcNDB_NCR.Close;
  dmcxc.qryRepTransCxcNDB_NCR.Params[0].Value:= ReNumDocumento;
  dmcxc.qryRepTransCxcNDB_NCR.Params[1].Value:= 5;//Nota Credito
  dmcxc.qryRepTransCxcNDB_NCR.Open;
  qckRepTransCxc:=TqckRepTransCxc.Create(Nil);
  try
    qckRepTransCxc.qrLabelDescTipoComp.Caption := GlbDescNCF;
    qckRepTransCxc.Preview;
  finally
  qckRepTransCxc.Free;
  qckRepTransCxc:=nil;
  end;
  end;
end;

procedure TfrmTransCxcProc_R.BuscarCliente1Click(Sender: TObject);
begin
  FrmBuscarClientesPersonas:=TFrmBuscarClientesPersonas.Create(Nil);
  try
    if FrmBuscarClientesPersonas.ShowModal = mrOk then
    begin
      frmTransCxcProc_R.CodCte:=FrmBuscarClientesPersonas.CodigoCliente;
      strNombreEmpresa:= FrmBuscarClientesPersonas.Nombrecliente;
      FormShow(Self);
    end;
  finally
  FrmBuscarClientesPersonas.free;
  FrmBuscarClientesPersonas:=nil;
  end;
end;

procedure TfrmTransCxcProc_R.RxDBLookupCombo1Exit(Sender: TObject);
begin
  if rxFormaPago.State in [dsEdit, dsInsert] then
  rxFormaPago.Post;
end;

function TfrmTransCxcProc_R.FNumReciboMax: Integer;
begin
  ibsqlLastNum.Close;
  ibsqlLastNum.ExecQuery;
  Result := ibsqlLastNum.FieldByName('numeromax').AsInteger;
end;

procedure TfrmTransCxcProc_R.BitBtn10Click(Sender: TObject);
begin
  if dmCxc.tblTransCxc.state in [dsEdit, dsInsert] then exit;
  dmCxc.tblTransCxc.Close;
  dmCxc.tblTransCxc.Params[0].value:= GlbFechaTrnDiaria;
  dmCxc.tblTransCxc.Params[1].value:= GlbFechaTrnDiaria;
  dmCxc.tblTransCxc.Open;
end;

procedure TfrmTransCxcProc_R.ComboBox1Change(Sender: TObject);
begin
  if Not tblDocTransCxc.Locate('DESCRIPCION', Combobox1.Text,[]) then
  MessageDlg('Tipo transacción no encontrada, verifique.', mtInformation, [mbOK], 0);
end;

procedure TfrmTransCxcProc_R.BitBtn9Click(Sender: TObject);
begin
  close;
end;

procedure TfrmTransCxcProc_R.btnInsertarClick(Sender: TObject);
begin
  if dmcxc.transCxcNotaCredito.State = dsInactive then
  begin
    dmcxc.transCxcNotaCredito.Close;
    dmcxc.transCxcNotaCredito.Open;
  end;
  
  if dmCxc.tblTransCxc.State = dsBrowse then
  begin
    dmCxc.tblTransCxc.Insert;
    dmCxc.tblTransCxcIN_POR.Value  :=StrUserName;
    dmCxc.tblTransCxcFECHA_IN.Value:= Now;
    dmCxc.tblTransCxcTIPO_SERV.value:=1;
    dmCxc.tblTransCxcMONEDA.Value:='1';
    dmCxc.tblTransCxcSTATUS.Value  :='A';
    dmCxc.tblTransCxcCODIGO_CLIENTE.Value := CodCte; 
    dmCxc.tblTransCxcFECHA.Value:= ExtraerFecha(GlbFechaTrnDiaria);
    dmCxc.tblTransCxcCODIGO_VENDEDOR.Value:= VarUsuarioGlb;
    
    //dmCxc.tblTransCxcCONCEPTO.Value:='Nota Debito';
    dmcxc.tblTransCxcTIPO_DOC.Value:=3;
    RxDBLookupCombo4.SetFocus;
  end;
end;

procedure TfrmTransCxcProc_R.BitBtn8Click(Sender: TObject);
var
ValorNCF: String;
  Serie_Asignadoncf: Integer;
  xNumDoc : Integer;
begin
  xNumDoc:=-1;
  if dmCxc.tblTransCxc.State in [dsInsert, dsEdit] then
  begin
    if dmCxc.tblTransCxcCONCEPTO.Isnull then
    DBEdit3.setfocus;
    dmCxc.tblTransCxc.Post;
    dmCxc.tblTransCxc.ApplyUpdates;

  ValorNCF:='';
  Serie_Asignadoncf:=-1;
  frmSelNCF:=TfrmSelNCF.Create(Nil);
  try
    if (frmSelNCF.ShowModal = mrOK) then
    begin
      ProcesaNCF(Serie_Asignadoncf,ValorNCF,dmFactura.ibQryViewNCFTIPO_CF.Value,dmCxc.tblTransCxcVALOR_DOCUMENTO.Value);
      GlbDescNCF:=dmFactura.ibQryViewNCFDESCRIPCION.Value;
    end;
    //aquissss ProcVentaConNCF(dmFactura.ibQryViewNCFTIPO_CF.Value, ValorNCF, serieDoc);
    finally
    frmSelNCF.Free;
    frmSelNCF:= Nil;
    end;

    if (xNumDoc < 0 ) then
    begin
      stpProcNumDoc.Params[1].Value:= 3;
      stpProcNumDoc.ExecProc;
      xNumDoc := stpProcNumDoc.Params[0].Value;
    end;

    //Actualizar trans_cxc_det - registra datos nota credito
    dmcxc.transCxcNotaCredito.Insert;
    dmcxc.transCxcNotaCreditoSERIE.Value := dmcxc.tblTransCxcserie.AsInteger;

    dmcxc.transCxcNotaCreditoNUM_DOC.Value := xNumDoc;
    
    if (Serie_Asignadoncf > 0 ) then
    dmcxc.transCxcNotaCreditoSERIE_NCF_ASIGNADO.Value:=Serie_Asignadoncf;

    dmcxc.transCxcNotaCredito.Post;
    dmcxc.transCxcNotaCredito.ApplyUpdates;

    if not dmCxc.transCxcNotaCredito.Transaction.InTransaction then
    dmCxc.transCxcNotaCredito.Transaction.StartTransaction;

    try
      dmCxc.transCxcNotaCredito.Transaction.CommitRetaining;
    except
    dmCxc.transCxcNotaCredito.Transaction.RollbackRetaining;
    end;

    if not dmCxc.tblTransCxc.Transaction.InTransaction then
    dmCxc.tblTransCxc.Transaction.StartTransaction;

    try
      dmCxc.tblTransCxc.Transaction.CommitRetaining;
    except
    dmCxc.tblTransCxc.Transaction.RollbackRetaining;
    end;

    //Habilitar para Reporte
    dmcxc.qryRepTransCxcNDB_NCR.Close;
    dmcxc.qryRepTransCxcNDB_NCR.Params[0].Value:= dmcxc.transCxcNotaCreditoNUM_DOC.Value;
    dmcxc.qryRepTransCxcNDB_NCR.Params[1].Value:= 3;
    dmcxc.qryRepTransCxcNDB_NCR.Open;
    if CheckBox1.Checked then
    BitBtn12Click(Self);
    qckRepTransCxc:=TqckRepTransCxc.Create(Nil);
    try
      qckRepTransCxc.Preview;
    finally
    qckRepTransCxc.Free;
    qckRepTransCxc:=nil;
    end;

  end;
end;

procedure TfrmTransCxcProc_R.BitBtn13Click(Sender: TObject);
begin
  if dmCxc.tblTransCxc.State in [dsBrowse] then
  begin
    if (dmCxc.tblTransCxcStatus.Value = 'A') then
    dmCxc.tblTransCxc.Edit else
    begin
      MessageDlg('Transaccion no puede ser modificada, verifique.',mtError, [mbOK], 0);
    end;
  end;
end;

procedure TfrmTransCxcProc_R.BitBtn11Click(Sender: TObject);
begin
  if dmCxc.tblTransCxc.State in [dsEdit, dsInsert] then
  begin
    if MessageDlg('Cancelar transaccions?', mtInformation, [mbYes, mbNo], 0) = mryes then
    dmCxc.tblTransCxc.Cancel;
    Exit;
  end;
  if (dmCxc.tblTransCxcStatus.Value = 'A') then
  begin
    if MessageDlg('Eliminar transacción?', mtInformation, [mbYes, mbNo], 0) = mryes then
    begin
      dmCxc.tblTransCxc.Delete;
      dmCxc.tblTransCxc.ApplyUpdates;
      if not dmCxc.tblTransCxc.Transaction.InTransaction then
      dmCxc.tblTransCxc.Transaction.StartTransaction;

      try
        dmCxc.tblTransCxc.Transaction.CommitRetaining;
      except
      dmCxc.tblTransCxc.Transaction.RollbackRetaining;
      end;
    end;
  end;
end;

procedure TfrmTransCxcProc_R.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if dmCxc.tblTransCxc.State in [dsEdit, dsInsert] then
  begin
    MessageDlg('Transaccion pendiente', mtInformation, [mbOk], 0);
    CanClose:=false;
  end else
  if dmCxc.tblTransCxcStatus.value = 'A' then
  begin
   MessageDlg('Favor postear trans cxc.', mtInformation, [mbOk], 0);
   Pagecontrol1.ActivePage := TabSheet2;
   //BitBtn12.SetFocus;
   CanClose:=false;
  end else
  if dmCxc.tblTransCxc.State in [dsBrowse, dsInactive] then
  CanClose:=True;
end;

procedure TfrmTransCxcProc_R.BitBtn12Click(Sender: TObject);
begin
  if dmCxc.tblTransCxc.State In [dsInsert, dsEdit] then
  Exit;

  if dmcxc.transCxcNotaCredito.State = dsInactive then
  begin
    dmcxc.transCxcNotaCredito.Close;
    dmcxc.transCxcNotaCredito.Open;
  end;
  if dmCxc.tblTransCxcCODIGO_CLIENTE.IsNull then exit;
  dmCxc.tblTransCxc.first;
  While Not dmCxc.tblTransCxc.Eof Do
  begin
    if (dmCxc.tblTransCxcStatus.Value = 'A') then
    begin
      ActBalaceCteP(1);
    end;
    dmCxc.tblTransCxc.next;
  end;                        //TRANS_CXC = R
end;

procedure TfrmTransCxcProc_R.ActBalaceCteP(operacion: smallint);
var
  Monto:Real;
begin
  if dmcxc.QrybalanceCtes.state = dsinactive then
  dmcxc.QrybalanceCtes.Open;
  if (Operacion=2) then
  Monto:=dmcxc.tblTransCxcVALOR_DOCUMENTO.Value*-1
  else Monto:=dmcxc.tblTransCxcVALOR_DOCUMENTO.Value;
  if dmcxc.QrybalanceCtes.Locate('CODIGO;SERVICIO;MONEDA',
     VarArrayOf([dmCxc.tblTransCxccodigo_cliente.Value,
                 dmCxc.tblTransCxcCODIGO_SERV.Value,dmCxc.tblTransCxcMONEDA.Value]),[]) then
  begin
    EditarBalanceP(Monto);
  end else
  begin
    InsertaBalanceP(Monto);
  end;
  if dmcxc.qryBalanceCtes.State in [dsEdit, dsInsert] then
  begin
    dmcxc.qryBalanceCtes.Post;
    dmcxc.qryBalanceCtes.ApplyUpdates;
  end;
  dmCxc.tblTranscxc.Edit;
  dmCxc.tblTransCxcSTATUS.Value:= 'R';
  dmCxc.tblTranscxc.Post;
  dmCxc.tblTranscxc.ApplyUpdates;
  if Not dmCxc.tblTranscxc.Transaction.InTransaction then
  dmCxc.tblTranscxc.Transaction.StartTransaction;
  try
    dmCxc.tblTranscxc.Transaction.CommitRetaining;
  except
  dmCxc.tblTranscxc.Transaction.RollbackRetaining;
  end;
  if Not dmcxc.qryBalanceCtes.Transaction.InTransaction then
  dmcxc.qryBalanceCtes.Transaction.StartTransaction;
  try
    dmcxc.qryBalanceCtes.Transaction.CommitRetaining;
  except
  dmcxc.qryBalanceCtes.Transaction.RollbackRetaining;
  end;
end;

procedure TfrmTransCxcProc_R.EditarBalanceP(monto: Real);
begin
  dmcxc.qryBalanceCtes.Edit;
  dmcxc.qryBalanceCtesFECHA_BCE.Value:= dmcxc.tblTransCxcFECHA.Value;
  dmcxc.qryBalanceCtesBALANCE_ANT.Value:=dmcxc.qryBalanceCtesBALANCE_ACT.Value;
  dmcxc.qryBalanceCtesBALANCE_ACT.Value:=//+
  dmcxc.qryBalanceCtesBALANCE_ACT.Value + Monto;//dmCxc.tblTransCxcVALOR_DOCUMENTO.Value;
  dmcxc.qryBalanceCtesDEBITO_MES.Value:=//+
  dmcxc.qryBalanceCtesDEBITO_MES.Value + Monto;//dmCxc.tblTransCxcvalor_documento.Value;
  dmcxc.qryBalanceCtesDEBITO_ACM.Value:=//+
  dmcxc.qryBalanceCtesDEBITO_ACM.Value + Monto;//dmCxc.tblTransCxcvalor_documento.Value;
end;

procedure TfrmTransCxcProc_R.InsertaBalanceP(monto: Real);
begin
  dmcxc.qryBalanceCtes.Insert;
  dmcxc.qryBalanceCtesCODIGO.Value    := dmCxc.tblTransCxcCODIGO_CLIENTE.Value;
  dmcxc.qryBalanceCtesSERVICIO.Value  := 0; //dmCxc.qryProcServcodigo_serv.Value;
  dmcxc.qryBalanceCtesMONEDA.Value    := '1';// dmCxc.qryProcServmoneda.Value;

  dmcxc.qryBalanceCtesBALANCE_ACT.Value := 0;
  dmcxc.qryBalanceCtesDEBITO_MES.Value  := 0;
  dmcxc.qryBalanceCtesDEBITO_ACM.Value  := 0;
  dmcxc.qryBalanceCtesCREDITO_MES.Value := 0;
  dmcxc.qryBalanceCtesCREDITO_ACM.Value := 0;
  dmcxc.qryBalanceCtesBALANCE_ANT.Value := 0;

  if dmcxc.qryBalanceCtesMONEDA.IsNull then
  dmcxc.qryBalanceCtesMONEDA.Value:='1';
  //chequear moneda
  dmcxc.qryBalanceCtesSTATUS_BCE.Value:= 'A';
  dmcxc.qryBalanceCtesFECHA_BCE.Value := ExtraerFecha(Now);//dmCxc.qryProcServfecha.Value;
  dmcxc.qryBalanceCtesFECHA_IN.Value  :=Now;
  dmcxc.qryBalanceCtesIN_POR.Value    :=StrUserName;
  if (dmCxc.tblTransCxcTIPO_DOC.Value = 1) or (dmCxc.tblTransCxcTIPO_DOC.Value = 3) then
  begin
   dmcxc.qryBalanceCtesBALANCE_ACT.Value:= Monto;
   dmcxc.qryBalanceCtesDEBITO_MES.Value := Monto;
   dmcxc.qryBalanceCtesDEBITO_ACM.Value := Monto;
  end else
  if (dmCxc.tblTransCxcTIPO_DOC.Value = 2) Or (dmCxc.tblTransCxcTIPO_DOC.Value = 4) or
  (dmCxc.tblTransCxcTIPO_DOC.Value = 5) then
  begin
    if (dmCxc.tblTransCxcTIPO_DOC.Value = 4) And ((dmCxc.tblTransCxcTIPO_DOC.Value = 1) ) then
    begin
      dmcxc.qryBalanceCtesBALANCE_ACT.Value:= Monto;
      dmcxc.qryBalanceCtesDEBITO_MES.Value := Monto;
      dmcxc.qryBalanceCtesDEBITO_ACM.Value := Monto;
    end else
    begin
      dmcxc.qryBalanceCtesBALANCE_ACT.Value:=//-
      dmcxc.qryBalanceCtesBALANCE_ACT.Value - monto;//dmCxc.qryProcServVALOR_DOCUMENTO.Value;
      dmcxc.qryBalanceCtesCREDITO_MES.Value:= monto;//dmCxc.qryProcServVALOR_DOCUMENTO.Value;
      dmcxc.qryBalanceCtesCREDITO_ACM.Value:= monto;//dmCxc.qryProcServVALOR_DOCUMENTO.Value;
      dmcxc.qryBalanceCtesFECHA_ULT_PAGO.Value:= now;       //dmCxc.qryProcServfecha.Value;
    end;
  end;
end;

procedure TfrmTransCxcProc_R.RxDBGrid3GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if dmcxc.tblTransCxcSTATUS.Value <> 'A' then
  begin
    BackGround := clyellow;
    Afont.Color:= clGreen;
  end;
end;

procedure TfrmTransCxcProc_R.RxDBLookupCombo4Exit(Sender: TObject);
begin
  if dmcxc.tblTransCxc.State in [dsedit, dsInsert] then
  begin
    if dmcxc.tblTransCxcTIPO_DOC.Value = 3 then
    dmcxc.tblTransCxcTIPO_TRANF.Value:=1
    else if dmcxc.tblTransCxcTIPO_DOC.Value = 5 then
    dmcxc.tblTransCxcTIPO_TRANF.Value:=2;
  end;
end;

procedure TfrmTransCxcProc_R.ReImprimirNDB1Click(Sender: TObject);
begin
  if (ReNumDocumento < 0) then
  ReNumDocumento:=StrToInt(Inputbox('Re-Imprimir Nota Débito','Entre número',''))
  else ReNumDocumento:=StrToInt(Inputbox('Re-Imprimir Nota Débito','Entre número',InttoStr(ReNumDocumento)));
  if (ReNumDocumento > 0) then
  begin
  dmcxc.qryRepTransCxcNDB_NCR.Close;
  dmcxc.qryRepTransCxcNDB_NCR.Params[0].Value:= ReNumDocumento;
  dmcxc.qryRepTransCxcNDB_NCR.Params[1].Value:= 3;//Nota Credito
  dmcxc.qryRepTransCxcNDB_NCR.Open;
  qckRepTransCxc:=TqckRepTransCxc.Create(Nil);
  try
    qckRepTransCxc.qrLabelDescTipoComp.Caption := GlbDescNCF;
    qckRepTransCxc.Preview;
  finally
  qckRepTransCxc.Free;
  qckRepTransCxc:=nil;
  end;
  end;
end;

end.
