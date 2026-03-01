unit UFormServiciosFijos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ToolEdit, RXDBCtrl, StdCtrls, Mask, DBCtrls, Buttons, Grids,
  DB, DBGrids, ExtCtrls, RXCtrls, ComCtrls, IBCustomDataSet, IBStoredProc,
  RxMemDS, RxLookup, WinSkinData;

type
  TfrmGeneraFactPlan = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBStatusLabel4: TDBStatusLabel;
    Shape1: TShape;
    RxDBGrid4: TRxDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    ipStpInsertVentMast: TIBStoredProc;
    ibStpInsertVentaDet: TIBStoredProc;
    DBRadioGroup1: TDBRadioGroup;
    rxDatos: TRxMemoryData;
    rxDatosNumero: TIntegerField;
    rxDatosstatus: TStringField;
    Label3: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    BitBtn8: TBitBtn;
    SkinData1: TSkinData;
    ibStpGenFactPlan: TIBStoredProc;
    procedure BitBtn2Click2(Sender: TObject);
    procedure BitBtn3Click2(Sender: TObject);
    procedure BitBtn4Click2(Sender: TObject);
    procedure BitBtn5Click2(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure ProcCrearFacturas;
    procedure ProcVentaConNCF(totalneto: Extended;tiponcf:String; Var valorNCF:String; Var seriedoc:Integer);
    procedure ProcVenta(monto:Extended; valorNCF:String; Var Serie_Asignadoncf:Integer; Var serieDoc:Integer; codCliente:Integer);
    procedure ProcesaFacturar(monto:Extended; tipo : smallint; numdoc: Integer);

    procedure InsertarDet(numero : Integer);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGeneraFactPlan: TfrmGeneraFactPlan;
  porcientoItbi : Real;
  Serie_Asignadoncf : Integer;
implementation

uses UDatModFactura, uglobal, UDatModCxc,
  uFormAsignarNCFVenta, UDatModCompania, UDatModConectar,
  UFactServicio, UDatmodDatosGenerales;
{$R *.dfm}

procedure TfrmGeneraFactPlan.BitBtn2Click2(Sender: TObject);
begin
 if dmDatos.tblPlanFunerario.State = dsBrowse then
  begin
    dmDatos.tblPlanFunerario.Edit;
  end;
end;

procedure TfrmGeneraFactPlan.BitBtn3Click2(Sender: TObject);
begin
  if dmDatos.tblPlanFunerario.State in [dsEdit,dsInsert] then
  begin
    dmDatos.tblPlanFunerario.Cancel;
  end else
  if MessageDlg('Borrar record?',mtWarning,[mbYes,mbNo],0) = mrYes then
  begin
    dmDatos.tblPlanFunerario.Delete;
    if not dmDatos.tblPlanFunerario.Transaction.InTransaction then
    dmDatos.tblPlanFunerario.Transaction.StartTransaction;
    try
      dmDatos.tblPlanFunerario.Transaction.CommitRetaining;
    except
    dmDatos.tblPlanFunerario.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmGeneraFactPlan.BitBtn4Click2(Sender: TObject);
begin
  if dmDatos.tblPlanFunerario.State in [dsEdit,dsInsert] then
  begin
    dmDatos.tblPlanFunerario.Post;
    dmDatos.tblPlanFunerario.ApplyUpdates;
    if not dmDatos.tblPlanFunerario.Transaction.InTransaction then
    dmDatos.tblPlanFunerario.Transaction.StartTransaction;
    try
      dmDatos.tblPlanFunerario.Transaction.CommitRetaining;
    except
    dmDatos.tblPlanFunerario.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmGeneraFactPlan.BitBtn5Click2(Sender: TObject);
begin
  if dmDatos.tblPlanFunerario.State in [dsInactive, dsBrowse] then
  begin
    dmDatos.tblPlanFunerario.Close;
    dmDatos.tblPlanFunerario.Open;
  end;
end;

procedure TfrmGeneraFactPlan.BitBtn7Click(Sender: TObject);
var
  fini, ffin : Integer;
begin
  dmCompania.tblcompania.Close;
  dmCompania.tblcompania.Open;
  dmcxc.QrybalanceCtes.Close;
  dmcxc.QrybalanceCtes.Open;
  rxDatos.Close;
  rxDatos.Open;
  porcientoItbi := FGlbPorcItbi(ExtraerFecha(GlbFechaTrnDiaria));

  ProcCrearFacturas;
  if rxDatos.state in [dsedit, dsInsert] then
  rxDatos.Post;

  if rxDatos.State = dsbrowse then
  begin
    rxDatos.SortOnFields('numero',true,false);
    rxDatos.First;
    fini := rxDatosNumero.Value;
    rxdatos.Last;
    ffin := rxDatosNumero.Value;
    //while not rxDatos.eof do
    //begin
      dmFactura.qryFactServFReimpMaster.Close;
      dmFactura.qryFactServFReimpMaster.Params[0].Value:= fini;
      dmFactura.qryFactServFReimpMaster.Params[1].Value:= ffin;
      dmFactura.qryFactServFReimpMaster.Open;
      if rxDatosstatus.Value = 'A' then
      begin
        qckFactServicio:=TQckFactServicio.Create(Nil);
        try
          if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
          begin
            qckFactServicio.PrinterSetup;
            qckFactServicio.Print;
          end else
          qckFactServicio.Preview
        finally
        qckFactServicio.Free;
        qckFactServicio:=Nil;
        end;
      end;
  end;
end;

procedure TfrmGeneraFactPlan.ProcCrearFacturas;
  var
  serieDoc : Integer;
  valorNCF : String;
  MontoItbis : Extended;
  montoneto: Extended;
  generof : boolean;
begin
  dmFactura.ibQryViewNCF.Close;
  dmFactura.ibQryViewNCF.Open;
  generof := false;
  MontoItbis := 0;
  montoneto  := 0;
  serieDoc   := 0;
  dmDatos.tblPlanFunerario.First;
  While Not dmDatos.tblPlanFunerario.Eof Do
  Begin
    dmDatos.qryPrecioTipoPlan.Close;
    dmDatos.qryPrecioTipoPlan.Params[0].Value:= dmDatos.tblPlanFunerarioID_TIPO_PLAN.Value;
    dmDatos.qryPrecioTipoPlan.Params[1].Value:= ExtraerFecha(GlbFechaTrnDiaria);
    dmDatos.qryPrecioTipoPlan.Open;

    MontoItbis:=0;
    if (dmDatos.tblPlanFunerarioCARGAR_ITBIS.Value = 1) then
    MontoItbis := (dmDatos.qryPrecioTipoPlanPrecio.Value * porcientoItbi / 100);
    montoneto:= dmDatos.qryPrecioTipoPlanPrecio.Value + MontoItbis;

    if (dmDatos.tblPlanFunerarioFECHA_ULT_FACT.Value >= GlbFechaTrnDiaria) then
    begin
      dmDatos.tblPlanFunerario.Next;
      continue;
    end;
    generof:=true;
    ValorNCF:='';
    Serie_Asignadoncf:=-1;

    if dmFactura.ibQryViewNCF.locate('TIPO_CF', dmDatos.tblPlanFunerarioTIPO_NCF.Value,[]) then
    begin
      GlbDescNCF := dmFactura.ibQryViewNCFDESCRIPCION.Value;
      ProcVentaConNCF(montoneto, dmFactura.ibQryViewNCFTIPO_CF.Value, ValorNCF, serieDoc);
      ProcVenta(montoneto, valorNCF, Serie_Asignadoncf, serieDoc, dmDatos.tblPlanFunerarioCODIGO_CTE.Value);//Aqui voy
      ProcesaFacturar(montoneto, 1, SerieDoc);
    end else
    begin
      GlbDescNCF:='';
      ProcVenta(montoneto, ValorNCF,Serie_Asignadoncf,serieDoc, dmDatos.tblPlanFunerarioCODIGO_CTE.Value);//Aqui voy
      ProcesaFacturar(montoneto, 1, serieDoc);
      serieDoc:=-1;
      Serie_Asignadoncf:=-1;
    end;
    dmDatos.tblPlanFunerario.Edit;
    dmDatos.tblPlanFunerarioFECHA_ULT_FACT.Value:= GlbFechaTrnDiaria+30;
    dmDatos.tblPlanFunerario.Post;
    dmDatos.tblPlanFunerario.ApplyUpdates;
    if not dmDatos.tblPlanFunerario.Transaction.InTransaction then
    dmDatos.tblPlanFunerario.Transaction.StartTransaction;
    try
      dmDatos.tblPlanFunerario.Transaction.CommitRetaining;
    except
    dmDatos.tblPlanFunerario.Transaction.RollbackRetaining;
    end;
    //dmDatos.tblPlanFunerario.Next;
    dmDatos.tblPlanFunerario.Next;
  end;
  if Not generof then
  MessageDlg('No se generaron facturas, verificar fecha ultima factura.',mtInformation, [mbOK], 0); 
end;


procedure TfrmGeneraFactPlan.ProcesaFacturar(monto:Extended; tipo: Smallint; numdoc: Integer);
begin
  ibStpGenFactPlan.params[0].Value:= ExtraerFecha(GlbFechaTrnDiaria);//fecha
  ibStpGenFactPlan.params[1].Value:= 'PLAN FUNERARIO';//xdescripcion
  ibStpGenFactPlan.params[2].Value:= VarUsuarioGlb;//codigousuario
  ibStpGenFactPlan.params[3].Value:= dmDatos.tblPlanFunerarioid_tipo_plan.Value; //id_tipo_plan
  ibStpGenFactPlan.params[4].Value:= dmDatos.tblPlanFunerariocodigo_cte.Value;//codigo_cte
  ibStpGenFactPlan.params[5].Value:= monto;//precio
  ibStpGenFactPlan.params[6].Value:= numdoc;//serie
  ibStpGenFactPlan.params[7].Value:= dmDatos.tblPlanFunerariotipo_ncf.value; //tipo_ncf
  ibStpGenFactPlan.params[8].Value:= dmDatos.tblPlanFunerariocargar_itbis.value;//cargar_itbis
  ibStpGenFactPlan.ExecProc;
end;

procedure TfrmGeneraFactPlan.ProcVenta(monto:Extended; valorNCF: String;
  Var Serie_Asignadoncf: Integer; var serieDoc: Integer;codCliente:Integer);
  var
    descS : String[60];
begin
  if (seriedoc <= 0 ) then
  begin
    serieDoc:= FsqlMaxNumero('facturas', 'numero');
    if (serieDoc = 0) then
    serieDoc:=1;
  end;

  ipStpInsertVentMast.Params[1].Value:= GlbFechaTrnDiaria;

  ipStpInsertVentMast.Params[2].Value := codCliente;

  ipStpInsertVentMast.Params[3].Value    := VarUsuarioGlb;
  //Asignar tipo Venta
  ipStpInsertVentMast.Params[4].Value    := 7;//Credito Normal

  descS:='PLAN FUNERARIO';
  ipStpInsertVentMast.Params[5].Value := descS;
  ipStpInsertVentMast.Params[6].Value := '1';
  ipStpInsertVentMast.Params[7].Value := Monto; //EditN1.Text;
  ipStpInsertVentMast.Params[8].Value := 'A';
  ipStpInsertVentMast.Params[9].Value := Now;
  ipStpInsertVentMast.Params[10].Value:= Null;
  ipStpInsertVentMast.Params[11].Value:= Null;
  ipStpInsertVentMast.Params[12].Value:= Null;
  ipStpInsertVentMast.Params[13].Value:= SerieDoc;//Numero Factura
  ipStpInsertVentMast.Params[14].Value:= Null;
  ipStpInsertVentMast.Params[16].Value:= Monto;
  ipStpInsertVentMast.Params[17].Value:= 0;
  ipStpInsertVentMast.Params[18].Value:= 0;

  if (Serie_asignadoncf > 0) then
  ipStpInsertVentMast.Params[15].Value     := Serie_Asignadoncf
  else ipStpInsertVentMast.Params[15].Value:= Null;

  ipStpInsertVentMast.ExecProc;
  if rxDatos.state in  [dsInactive] then
  rxDatos.Open;
  rxDatos.Insert;
  rxDatosNumero.Value:= serieDoc;
  rxDatosstatus.Value:= 'A';
  rxDatos.Post;
  if Not ipStpInsertVentMast.Transaction.InTransaction then
  ipStpInsertVentMast.Transaction.StartTransaction;
  try
    ipStpInsertVentMast.Transaction.CommitRetaining;
  except
  ipStpInsertVentMast.Transaction.RollbackRetaining;
  end;

  InsertarDet(ipStpInsertVentMast.Params[0].Value);

  if Not ibStpInsertVentaDet.Transaction.InTransaction then
  ibStpInsertVentaDet.Transaction.StartTransaction;
  try
    ibStpInsertVentaDet.Transaction.CommitRetaining;
  except
  ibStpInsertVentaDet.Transaction.RollbackRetaining;
  end;
end;

procedure TfrmGeneraFactPlan.ProcVentaConNCF(totalneto: Extended;tiponcf: String;
  var valorNCF: String; var seriedoc: Integer);
begin
  //Generar y Asignar Numero de Comprobante Fiscal
  valorNCF:='';
  serieDoc:= -1;//indica que no se generó el NCF
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

    frmAsignarNCFVenta.IBDataSet1MONTO.Value      := totalneto; //StrToFloat(EditN1.Text);

    frmAsignarNCFVenta.BitBtn4Click(Self); //Guardar

      if (frmAsignarNCFVenta.ncfGenerado = '') then
      begin
        if MessageDlg('NCF no fue generado, desea continuar?',mtWarning, [mbyes,mbno], 0) = mrNO then
        Exit;
      end;

      serie_asignadoncf := frmAsignarNCFVenta.IBDataSet1SERIE.Value;
      serieDoc:= FsqlMaxNumero('facturas','numero');
      if (serieDoc = 0) then
      serieDoc:=1;

      valorNCF:= frmAsignarNCFVenta.ncfGenerado;
    finally
    frmAsignarNCFVenta.free;
    frmAsignarNCFVenta:=nil;
    end;
end;

procedure TfrmGeneraFactPlan.InsertarDet(numero: Integer);
var
  MontoItbis : Extended;
  descS : String[60];
begin
  ibStpInsertVentaDet.Params[0].Value  := Numero;
  ibStpInsertVentaDet.Params[1].Value  := Null;//rxVentaCodArticulo.Value;
  ibStpInsertVentaDet.Params[2].Value  := Null;
  descS:= 'PLAN FUNERARIO';
  ibStpInsertVentaDet.Params[3].Value  := descS;//dmDatos.tblPlanFunerarioDescripcionServicio.Value; //rxVentaDescripcion.Value;
  ibStpInsertVentaDet.Params[4].Value  := 1;//rxVentaCant.Value;
  ibStpInsertVentaDet.Params[5].Value  := dmdatos.qryPrecioTipoPlanPRECIO.Value;//rxVentaPrecio.Value;
  ibStpInsertVentaDet.Params[6].Value  := 0;//rxVentaporc_desc.Value;//Descuento

  if (dmDatos.tblPlanFunerarioCARGAR_ITBIS.Value = 1) then
  MontoItbis := (dmdatos.qryPrecioTipoPlanPRECIO.Value * porcientoItbi / 100);
  ibStpInsertVentaDet.Params[9].Value  :=
  dmdatos.qryPrecioTipoPlanPRECIO.Value + MontoItbis;

  ibStpInsertVentaDet.Params[7].Value  := MontoItbis;//itbi_det
  ibStpInsertVentaDet.Params[8].Value  := dmdatos.qryPrecioTipoPlanPRECIO.Value;//rxVentaMontoBruto.Value;

  ibStpInsertVentaDet.Params[10].Value := Null;
  ibStpInsertVentaDet.Params[11].Value := 'A';
  ibStpInsertVentaDet.Params[12].Value := Now;
  ibStpInsertVentaDet.Params[13].Value := Null;
  ibStpInsertVentaDet.Params[14].Value := Null;
  ibStpInsertVentaDet.Params[15].Value := Null;
  ibStpInsertVentaDet.Params[16].Value := Null;
  ibStpInsertVentaDet.Params[17].Value := Null;
  ibStpInsertVentaDet.Params[18].Value := Null;
  ibStpInsertVentaDet.Params[19].Value := Null;
  ibStpInsertVentaDet.ExecProc;
end;

procedure TfrmGeneraFactPlan.FormCreate(Sender: TObject);
begin
  dmFactura.tblServProgIgualas.Close;
  dmFactura.tblServProgIgualas.Open;
  dmDatos.tblPlanFunerario.Close;
  dmDatos.tblPlanFunerario.Open;
  dmFactura.tblTipoCF.Close;
  dmFactura.tblTipoCF.Open;
  dmDatos.tblPlanFunerario.Close;
  dmDatos.tblPlanFunerario.Open;
  dmCxc.qryClientes.Open;
end;

procedure TfrmGeneraFactPlan.BitBtn8Click(Sender: TObject);
var
  f : integer;
begin
  f:=StrTOInt(Inputbox('Re-imprimir factura','Entre numero',''));
  dmFactura.qryFactServFReimpMaster.Close;
  dmFactura.qryFactServFReimpMaster.Params[0].Value:= f;
  dmFactura.qryFactServFReimpMaster.Params[1].Value:= f;
  dmFactura.qryFactServFReimpMaster.Open;
  if dmFactura.qryFactServFReimpMaster.Recordcount = 0 then
  begin
    MessageDlg('Numero factura no existe, verifique', mtInformation, [mbOK], 0);
    exit;
  end;
  qckFactServicio:=TQckFactServicio.Create(Nil);
  try
   if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
   begin
     qckFactServicio.PrinterSetup;
     qckFactServicio.Print;
   end else
   qckFactServicio.Preview
   finally
   qckFactServicio.Free;
   qckFactServicio:=Nil;
   end;
end;

end.
