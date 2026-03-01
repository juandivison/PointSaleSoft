unit UTransNcNbDev;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, EditNew, ExtCtrls, Grids, DBGrids, RXDBCtrl, DB,
  IBCustomDataSet, IBQuery, Buttons, IBStoredProc, WinSkinData;

type
  TfrmTransCxcNCdbDev = class(TForm)
    EditN1: TEditN;
    Label1: TLabel;
    RxDBGrid1: TRxDBGrid;
    RadioGroup1: TRadioGroup;
    CheckBox1: TCheckBox;
    Button1: TButton;
    qryFacturas: TIBQuery;
    dsqryFacturas: TDataSource;
    qryFacturasNOMBRE_CTE: TIBStringField;
    qryFacturasNOMBRE_FACTURAR: TIBStringField;
    qryFacturasMONTO_PENDIENTE: TFloatField;
    qryFacturasNUMERO: TIntegerField;
    qryFacturasFECHA: TDateTimeField;
    qryFacturasCODIGO_CTE: TIntegerField;
    qryFacturasVALOR_TOTAL_DET: TFloatField;
    qryFacturasNUMERO_FACTURA: TIntegerField;
    qryFacturasMONTO_FACT: TFloatField;
    qryFacturasRCXC: TIBStringField;
    qryFacturasRCNT: TIBStringField;
    qryFacturasSTATUS: TIBStringField;
    qryFacturasBALANCE_ACT: TFloatField;
    qryFacturasFECHA_ULT_PAGO: TDateTimeField;
    qryFacturasFECHA_BCE: TDateTimeField;
    BitBtn1: TBitBtn;
    edtMontoTrn: TEditN;
    Label2: TLabel;
    tblVentas: TIBDataSet;
    tblVentasSERIE: TIntegerField;
    tblVentasCANTIDAD: TFloatField;
    tblVentasSTATUS_DET: TIBStringField;
    tblVentasCODIGO_PROD: TIBStringField;
    ibStpActualizaInvProd: TIBStoredProc;
    dstblVentas: TDataSource;
    qryInventario: TIBQuery;
    qryInventarioCODIGO_TEXTO: TIBStringField;
    qryInventarioDESCRIPCION: TIBStringField;
    qryInventarioCODIGO: TIntegerField;
    tblVentasDescripcionProducto: TStringField;
    ibStpCancelaVenta: TIBStoredProc;
    qryFacturasNOMBRE_ABREV: TIBStringField;
    qryFacturasTELEF_CONTACTO: TIBStringField;
    qryFacturasCIUDAD: TIBStringField;
    qryFacturasDIRECCION_CONT: TIBStringField;
    qryBuscaFactura: TIBQuery;
    chBoxGenNCF: TCheckBox;
    ibStpFactPendiente: TIBStoredProc;
    ibStpProcSaldarFact: TIBStoredProc;
    SkinData1: TSkinData;
    procedure Button1Click(Sender: TObject);
    procedure EditN1Change(Sender: TObject);
    procedure EditN1Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure qryFacturasAfterScroll(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    Procedure ProcCrearNotaCredito;
    Procedure ActBalaceCteP(Operacion : Smallint);
    procedure EditarBalanceP(monto:Real;fecha:TDateTime);overload;
    procedure EditarBalanceP(monto : Real);overload;
    procedure InsertaBalanceP(monto: Real);
    procedure ImprimirDoc(valorNCF : String);

    procedure ProcVentaConNCF(tiponcf : String; Var ncf : String);

    procedure ProcFactPendiente;

  public
    { Public declarations }
  end;

var
  frmTransCxcNCdbDev: TfrmTransCxcNCdbDev;

implementation

uses UDatModConectar, UFormSelFecha, UGlobal, UDatModCxc, UTransCxcDoc,
  uFormAsignarNCFVenta, UMostrarProdTranscxc, USeleccionarNCF,
  UDatModFactura, UDatModCompania, uFormAsignareCFVenta;

{$R *.dfm}

procedure TfrmTransCxcNCdbDev.Button1Click(Sender: TObject);
begin
  frmSelFecha:=TfrmSelFecha.Create(nil);
  try
    if frmSelFecha.Showmodal = mrOk then
    begin
      qryFacturas.Close;
      qryFacturas.Params[0].Value:= ExtraerFecha(frmSelFecha.FechaIni.DateTime);
      qryFacturas.Params[1].Value:= ExtraerFecha(frmSelFecha.FechaFin.DateTime);
      qryFacturas.Open;
    end;
  finally
  frmSelFecha.Free;
  frmSelFecha:=Nil;
  end;
end;

procedure TfrmTransCxcNCdbDev.EditN1Change(Sender: TObject);
begin
  if qryFacturas.State = dsBrowse then
  qryFacturas.Locate('numero_factura', EditN1.Text,[loCaseInsensitive,loPartialKey])
  else
  begin
    BitBtn1click(Self);
  end;
end;

procedure TfrmTransCxcNCdbDev.EditN1Exit(Sender: TObject);
begin
  if qryFacturas.State = dsBrowse then
  if Not qryFacturas.Locate('numero_factura', EditN1.Text, []) then
  MessageDlg('Número factura no existe, verifique', mtInformation, [mbOK], 0);
end;

procedure TfrmTransCxcNCdbDev.BitBtn1Click(Sender: TObject);
var
  ncfGen :string;
begin
  if ( RadioGroup1.ItemIndex = -1 ) then
  begin
    MessageDlg('Favor indicar tipo operación', mtInformation, [mbOK], 0);
    RadioGroup1.Color := clYellow;
    Exit;
  end;
  if (edtMontoTrn.ValueFloat = 0) then
  begin
    MessageDlg('Favor indicar el monto de la operación', mtInformation, [mbOK], 0);
    edtMontoTrn.SetFocus;
    Exit;
  end;
  ProcCrearNotaCredito;
  frmSelNCF:=tfrmSelNCF.Create(Nil);
  try
    if chBoxGenNCF.Checked then
    begin
      if (frmSelNCF.ShowModal = mrOK) then
      begin
        ProcVentaConNCF(dmFactura.ibQryViewNCFTIPO_CF.Value, ncfGen);
        ImprimirDoc(ncfGen);
      end;
    end else
    begin
      ProcVentaConNCF(dmFactura.ibQryViewNCFTIPO_CF.Value, ncfGen);
      ImprimirDoc(ncfGen);
    end;
  finally
  frmSelNCF.Free;
  frmSelNCF:= Nil;
  end;
  if (RadioGroup1.ItemIndex = 0) then //Actualiza Factura Pendiente
  ProcFactPendiente;
  
  if (qryFacturasMONTO_PENDIENTE.Value <= edtMontoTrn.ValueFloat) then
  begin
    if not ibStpProcSaldarFact.Prepared then
    ibStpProcSaldarFact.Prepare;
    ibStpProcSaldarFact.Params[0].AsInteger :=qryFacturasNUMERO_FACTURA.AsInteger;
    ibStpProcSaldarFact.ExecProc;
  end;
  if not ibStpProcSaldarFact.Transaction.InTransaction then
  ibStpProcSaldarFact.Transaction.StartTransaction;
  try
    ibStpProcSaldarFact.Transaction.CommitRetaining;
  except
  ibStpProcSaldarFact.Transaction.RollbackRetaining;
  end;
  if not ibStpFactPendiente.Transaction.InTransaction then
  ibStpFactPendiente.Transaction.StartTransaction;
  try
    ibStpFactPendiente.Transaction.CommitRetaining;
  except
  ibStpFactPendiente.Transaction.RollbackRetaining;
  end;
end;

procedure TfrmTransCxcNCdbDev.RadioGroup1Click(Sender: TObject);
begin
  RadioGroup1.Color := clBtnFace;
end;

procedure TfrmTransCxcNCdbDev.ProcCrearNotaCredito;
begin
  dmcxc.tblTransCxc.Close;
  dmcxc.tblTransCxc.Params[0].Value:= ExtraerFecha(GlbFechaTrnDiaria);
  dmcxc.tblTransCxc.Params[1].Value:= ExtraerFecha(GlbFechaTrnDiaria);
  dmCxc.tblTransCxc.Params[2].Value:=glbCia_Key;  
  dmcxc.tblTransCxc.Open;

  dmCxc.qryBalanceCtes.Close;
  dmCxc.qryBalanceCtes.Open;

  dmcxc.tblTransCxc.Insert;
  dmCxc.tblTransCxcCIA_KEY.Value:=GlbCodigoCia;
  dmCxc.tblTransCxcSTATUS.Value:='A';
  if (RadioGroup1.ItemIndex = 0) then
  begin
    dmCxc.tblTransCxcTIPO_DOC.Value := 5; //NC
    dmCxc.tblTransCxcconcepto.Value := 'Nota de Crédito';
    dmCxc.tblTransCxctipo_tranf.Value:= 2;//Credito
  end else
  if (RadioGroup1.ItemIndex = 1) then
  begin
    dmCxc.tblTransCxcTIPO_DOC.Value  := 3; //ND
    dmCxc.tblTransCxctipo_tranf.Value:= 1;//Debito
    dmCxc.tblTransCxcconcepto.Value := 'Nota de Débito';
  end;
  dmCxc.tblTransCxcmoneda.Value  := '1';
  dmCxc.tblTransCxcfecha.Value   := ExtraerFecha(GlbFechatrndiaria);

  dmCxc.tblTransCxccodigo_cliente.Value :=  qryFacturasCODIGO_CTE.Value;
  dmCxc.tblTransCxccodigo_serv.Value    := 0;
  dmCxc.tblTransCxcNUMERO_DOC.Value     := qryFacturasNUMERO_FACTURA.Value;

  dmCxc.tblTransCxcvalor_documento.Value:= edtMontoTrn.ValueFloat;
  dmCxc.tblTransCxctipo_serv.Value      := 1;
  dmCxc.tblTransCxcfecha_in.Value       := Now;
  dmCxc.tblTransCxcIN_POR.Value := StrUserName;
  dmCxc.tblTransCxcCODIGO_VENDEDOR.Value:=VarUsuarioGlb; 

  dmCxc.tblTransCxc.Post;
  dmCxc.tblTransCxc.ApplyUpdates;
  if Not dmCxc.tblTransCxc.Transaction.InTransaction then
  dmCxc.tblTransCxc.Transaction.StartTransaction;
  try
    dmCxc.tblTransCxc.Transaction.CommitRetaining;
  except
  dmCxc.tblTransCxc.Transaction.RollbackRetaining;
  end;

  if (RadioGroup1.ItemIndex = 0) then
  ActBalaceCteP(1)
  else
  if (RadioGroup1.ItemIndex = 1) then
  ActBalaceCteP(2)
end;

procedure TfrmTransCxcNCdbDev.ActBalaceCteP(operacion: smallint);
var
  Monto:Real;
begin
  if (Operacion = 2) then
  Monto:=dmcxc.tblTransCxcVALOR_DOCUMENTO.Value*-1
  else Monto:=dmcxc.tblTransCxcVALOR_DOCUMENTO.Value;
  if dmcxc.QrybalanceCtes.Locate('CODIGO;SERVICIO;MONEDA',
     VarArrayOf([dmCxc.tblTransCxccodigo_cliente.Value,
                 dmcxc.tblTransCxcCODIGO_SERV.Value,dmCxc.tblTransCxcMONEDA.Value]),[]) then
  begin
    EditarBalanceP(Monto,dmcxc.tblTransCxcFECHA.Value);
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

procedure TfrmTransCxcNCdbDev.EditarBalanceP(monto: Real;
  fecha: TDateTime);
begin
  dmcxc.qryBalanceCtes.Edit;
  dmcxc.qryBalanceCtesFECHA_BCE.Value:= Fecha;
  dmcxc.qryBalanceCtesBALANCE_ANT.Value:=dmcxc.qryBalanceCtesBALANCE_ACT.Value;
  dmcxc.qryBalanceCtesBALANCE_ACT.Value:=
  dmcxc.qryBalanceCtesBALANCE_ACT.Value - Monto;
  dmcxc.qryBalanceCtesCREDITO_MES.Value:=
  dmcxc.qryBalanceCtesCREDITO_MES.Value - Monto;
  dmcxc.qryBalanceCtesCREDITO_ACM.Value:=
  dmcxc.qryBalanceCtesCREDITO_ACM.Value - Monto;
  dmcxc.qryBalanceCtesFECHA_MOD.Value:=Now;
  dmcxc.qryBalanceCtesFECHA_ULT_PAGO.Value:=ExtraerFecha(Now);
end;

procedure TfrmTransCxcNCdbDev.EditarBalanceP(monto: Real);
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

procedure TfrmTransCxcNCdbDev.InsertaBalanceP(monto: Real);
begin
  dmcxc.qryBalanceCtes.Insert;
  dmcxc.qryBalanceCtesCODIGO.Value    := qryFacturasCODIGO_CTE.Value;
  dmcxc.qryBalanceCtesSERVICIO.Value  := 0;
  dmcxc.qryBalanceCtesMONEDA.Value    := '1';
  if dmcxc.qryBalanceCtesMONEDA.IsNull then
  dmcxc.qryBalanceCtesMONEDA.Value:='1';

  dmcxc.qryBalanceCtesSTATUS_BCE.Value:= 'A';
  dmcxc.qryBalanceCtesFECHA_BCE.Value := ExtraerFecha(Now);
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
      dmcxc.qryBalanceCtesBALANCE_ACT.Value:=
      dmcxc.qryBalanceCtesBALANCE_ACT.Value - monto;
      dmcxc.qryBalanceCtesCREDITO_MES.Value:= monto;
      dmcxc.qryBalanceCtesCREDITO_ACM.Value:= monto;
      dmcxc.qryBalanceCtesFECHA_ULT_PAGO.Value:= Now;
    end;
  end;
end;

procedure TfrmTransCxcNCdbDev.ImprimirDoc(valorNCF : String);
begin
  qckRepTransCxcDoc:=TqckRepTransCxcDoc.Create(Nil);
  try
    qckRepTransCxcDoc.valorNCF:= valorNCF;
    if (RadioGroup1.ItemIndex = 0) then
    qckRepTransCxcDoc.qryLabelTipoDoc.Caption:= 'Trans. No.'
    else qckRepTransCxcDoc.qryLabelTipoDoc.Caption:= 'Trans. No.';
    
    if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
    begin
      qckRepTransCxcDoc.PrinterSetup;
      qckRepTransCxcDoc.Print;
    end else
    qckRepTransCxcDoc.Preview;
  finally
  qckRepTransCxcDoc.Free;
  qckRepTransCxcDoc:=Nil;
  end;
end;

procedure TfrmTransCxcNCdbDev.ProcVentaConNCF(tiponcf : String;
                      Var ncf : String);
Var
  serie_asignadoncf : Integer;
  valorNCF : String;
  i : Integer;
begin
  //Generar y asignar Numero de Comprobante Fiscal
  valorNCF:='';
  if chBoxGenNCF.Checked then
  begin
    if GlbActivaECF = 1 then
    begin
    frmAsignareCFVenta:=TfrmAsignareCFVenta.Create(Nil);
    try
      frmAsignareCFVenta.IBDataSet1.Close;
      frmAsignareCFVenta.IBDataSet1.Open;
      frmAsignareCFVenta.IBDataSet1.Insert;
      frmAsignareCFVenta.IBDataSet1FECHA_INSERT.Value := Now;
      frmAsignareCFVenta.IBDataSet1FECHA.Value := ExtraerFecha(GlbFechaTrnDiaria);
      frmAsignareCFVenta.IBDataSet1CODIGO_USUARIO.Value := VarUsuarioGlb;
      frmAsignareCFVenta.IBDataSet1STATUS.Value         := 'A';

      frmAsignareCFVenta.IBDataSet1TIPO_NCF.Value       := tipoNCF;
      frmAsignareCFVenta.BitBtn13Click(Self);

      frmAsignareCFVenta.Asginarncf := frmAsignareCFVenta.ncfGenerado;
      ncf := frmAsignareCFVenta.ncfGenerado;
      frmAsignareCFVenta.IBDataSet1NUMERO_eCF.Value := frmAsignareCFVenta.ncfGenerado;//rxVentaNCF.Value;
      frmAsignareCFVenta.IBDataSet1MONTO.Value      := edtMontoTrn.ValueFloat; //StrToFloat(EditN1.Text);

      frmAsignareCFVenta.BitBtn4Click(Self); //Guardar

      if (frmAsignareCFVenta.ncfGenerado = '') then
      begin
        MessageDlg('NCF no fue generado.', mtWarning, [mbOk], 0);
      end;
    finally
    frmAsignareCFVenta.free;
    frmAsignareCFVenta:=nil;
    end;
    end else
    begin
    frmAsignarNCFVenta:=tfrmAsignarNCFVenta.Create(Nil);
    try
      frmAsignarNCFVenta.IBDataSet1.Close;
      frmAsignarNCFVenta.IBDataSet1.Open;
      frmAsignarNCFVenta.IBDataSet1.Insert;
      frmAsignarNCFVenta.IBDataSet1FECHA_INSERT.Value := Now;
      frmAsignarNCFVenta.IBDataSet1FECHA.Value := ExtraerFecha(GlbFechaTrnDiaria);
      frmAsignarNCFVenta.IBDataSet1CODIGO_USUARIO.Value := VarUsuarioGlb;
      frmAsignarNCFVenta.IBDataSet1STATUS.Value         := 'A';

      frmAsignarNCFVenta.IBDataSet1TIPO_NCF.Value       := tipoNCF;
      frmAsignarNCFVenta.BitBtn13Click(Self);

      frmAsignarNCFVenta.Asginarncf := frmAsignarNCFVenta.ncfGenerado;
      ncf := frmAsignarNCFVenta.ncfGenerado;
      frmAsignarNCFVenta.IBDataSet1NUMERO_NCF.Value := frmAsignarNCFVenta.ncfGenerado;//rxVentaNCF.Value;
      frmAsignarNCFVenta.IBDataSet1MONTO.Value      := edtMontoTrn.ValueFloat; //StrToFloat(EditN1.Text);

      frmAsignarNCFVenta.BitBtn4Click(Self); //Guardar

      if (frmAsignarNCFVenta.ncfGenerado = '') then
      begin
        MessageDlg('NCF no fue generado.', mtWarning, [mbOk], 0);
      end;
    finally
    frmAsignarNCFVenta.free;
    frmAsignarNCFVenta:=nil;
    end;
    end;
  end;

  if CheckBox1.Checked then
  begin
    frmProdTranscxc:=TfrmProdTranscxc.Create(Nil);
    try
      if frmProdTranscxc.Showmodal = mrOk then
      begin
        tblVentas.First;
        if frmProdTranscxc.RxDBGrid1.SelectedRows.Count>0 then
        With frmProdTranscxc.RxDBGrid1.DataSource.DataSet do
        For i:=0 to frmProdTranscxc.RxDBGrid1.SelectedRows.Count-1 do
        begin
          GotoBookmark(pointer(frmProdTranscxc.RxDBGrid1.SelectedRows.Items[i]));

          ibStpActualizaInvProd.Params[0].Value:= tblVentasCODIGO_PROD.Value;
          ibStpActualizaInvProd.Params[1].Value:= tblVentasCANTIDAD.Value;
          ibStpActualizaInvProd.Params[2].Value:= 1;//Aumenta
          ibStpActualizaInvProd.Params[3].Value:= 0;
          ibStpActualizaInvProd.ExecProc;
        end;
      end;
    finally
    frmProdTranscxc.free;
    frmProdTranscxc:=nil;
    end;

    ibStpCancelaVenta.Params[0].Value:= qryFacturasNUMERO.Value;
    ibStpCancelaVenta.ExecProc;

    if Not ibStpCancelaVenta.Transaction.InTransaction then
    ibStpCancelaVenta.Transaction.StartTransaction;
    try
      ibStpCancelaVenta.Transaction.CommitRetaining;
    except
    ibStpCancelaVenta.Transaction.RollbackRetaining;
    end;

    if Not ibStpActualizaInvProd.Transaction.InTransaction then
    ibStpActualizaInvProd.Transaction.StartTransaction;
    Try
      ibStpActualizaInvProd.Transaction.CommitRetaining;
    Except
    ibStpActualizaInvProd.Transaction.RollbackRetaining;
    end;
  end;//End if CheckBox1.Checked then
end;

procedure TfrmTransCxcNCdbDev.qryFacturasAfterScroll(DataSet: TDataSet);
begin
  tblVentas.Close;
  tblVentas.Params[0].Value:= qryFacturasNUMERO.Value;
  tblVentas.Open;
end;

procedure TfrmTransCxcNCdbDev.FormCreate(Sender: TObject);
begin
  qryInventario.Close;
  qryInventario.Open;
  dmCompania.tblCompania.Close;
  dmCompania.tblCompania.Open;
  dmCompania.tblCompania.Locate('codigo',glbCia_Key,[]);  
end;

procedure TfrmTransCxcNCdbDev.ProcFactPendiente;
var
  montoPend : Currency;
begin
  ibStpFactPendiente.Params[1].Value:= 2;//Tipo
  ibStpFactPendiente.Params[2].Value:= '1';//Moneda
  ibStpFactPendiente.Params[3].Value:= qryFacturasNUMERO_FACTURA.Value;//Numero_fact
  ibStpFactPendiente.Params[4].Value:= qryFacturasMONTO_PENDIENTE.Value - edtMontoTrn.ValueFloat;//Monto_pendiente
  ibStpFactPendiente.Params[5].Value:= 'A';//Status
  ibStpFactPendiente.Params[6].Value:= -1;//Accion -1 Devuelve Monto Pendiente
                                       //        1 Actualiza Monto Pendiente
  ibStpFactPendiente.ExecProc;
  if not ibStpFactPendiente.Params[0].IsNull then
  montoPend := ibStpFactPendiente.Params[0].AsFloat//Valor Pendiente
  else montoPend:=0;
  
  ibStpFactPendiente.Params[1].Value:= 2;//Tipo
  ibStpFactPendiente.Params[2].Value:= '1';//Moneda
  ibStpFactPendiente.Params[3].Value:= qryFacturasNUMERO_FACTURA.Value;//Numero_fact
  ibStpFactPendiente.Params[5].Value:= 'A';//Status
  if montoPend > 0 then
  begin
    if (montoPend - edtMontoTrn.ValueFloat) > 0 then
    ibStpFactPendiente.Params[4].Value:= montoPend - edtMontoTrn.ValueFloat//Monto_pendiente
    else ibStpFactPendiente.Params[4].Value:= 0;
    ibStpFactPendiente.Params[6].Value:= 1;
    ibStpFactPendiente.ExecProc;
  end;
end;

end.
