unit UFormServiciosFijos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, rxToolEdit, RXDBCtrl, StdCtrls, Mask, DBCtrls, Buttons, Grids,
  DB, DBGrids, ExtCtrls, RXCtrls, ComCtrls, IBCustomDataSet, IBStoredProc,
  RxMemDS, RxLookup, WinSkinData;

type
  TfrmProgServFijos = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBStatusLabel4: TDBStatusLabel;
    Shape1: TShape;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    RxDBGrid4: TRxDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    DBDateEdit1: TDBDateEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    BitBtn7: TBitBtn;
    ipStpInsertVentMast: TIBStoredProc;
    ibStpInsertVentaDet: TIBStoredProc;
    DBDateEdit2: TDBDateEdit;
    Label6: TLabel;
    DBRadioGroup1: TDBRadioGroup;
    rxDatos: TRxMemoryData;
    rxDatosNumero: TIntegerField;
    rxDatosstatus: TStringField;
    Label3: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    RxDBLookupCombo2: TRxDBLookupCombo;
    RxDBLookupCombo3: TRxDBLookupCombo;
    Label7: TLabel;
    BitBtn8: TBitBtn;
    SkinData1: TSkinData;
    edtFechaFactura: TDateEdit;
    RxLabel1: TRxLabel;
    procedure BitBtn1Click2(Sender: TObject);
    procedure BitBtn2Click2(Sender: TObject);
    procedure BitBtn3Click2(Sender: TObject);
    procedure BitBtn4Click2(Sender: TObject);
    procedure BitBtn5Click2(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure ProcCrearFacturas;
    procedure ProcVentaConNCF(totalneto: Extended;tiponcf:String; Var valorNCF:String; Var seriedoc:Integer);
    procedure ProcVenta(monto:Extended; valorNCF:String; Var Serie_Asignadoncf:Integer; Var serieDoc:Integer; codCliente:Integer);
    procedure ProcesaFacturar(monto:Extended; tipo : smallint; numdoc: Integer);
    procedure InsertaBalanceP(monto: Extended; codCliente: Integer);

    procedure ActBalaceCteP(operacion:smallint; codCliente: Integer);
    procedure EditarBalanceP(monto : Extended; codCliente: Integer);

    procedure InsertarDet(numero : Integer);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProgServFijos: TfrmProgServFijos;
  porcientoItbi : Real;
  Serie_Asignadoncf : Integer;
implementation

uses UDatModFactura, uglobal, UDatModCxc, UFactServicio,
  uFormAsignarNCFVenta, UDatModCompania, UDatosVentas;
{$R *.dfm}

procedure TfrmProgServFijos.ActBalaceCteP(operacion: smallint;codCliente: Integer);
var
  Monto:Extended;
begin
  if (Operacion=2) then
  Monto:=dmcxc.tblTransCxcVALOR_DOCUMENTO.Value * -1
  else Monto:=dmcxc.tblTransCxcVALOR_DOCUMENTO.Value;
  if dmcxc.QrybalanceCtes.Locate('CODIGO;SERVICIO;MONEDA',
     VarArrayOf([dmCxc.tblTransCxccodigo_cliente.Value,
                 dmcxc.tblTransCxcCODIGO_SERV.Value,dmCxc.tblTransCxcMONEDA.Value]),[]) then
  begin
    EditarBalanceP(Monto, codcliente);
  end else
  begin
    InsertaBalanceP(Monto, codcliente);
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

procedure TfrmProgServFijos.BitBtn1Click2(Sender: TObject);
begin
 if dmFactura.tblProgServIguala.State = dsBrowse then
  begin
    dmFactura.tblProgServIguala.Insert;
    dmFactura.tblProgServIgualaSTATUS.Value:='A';
    dmFactura.tblProgServIgualaFECHA_INI.Value := ExtraerFecha(GlbFechaTrnDiaria);
    dmFactura.tblProgServIgualaFECHA_Fin.Value := ExtraerFecha(GlbFechaTrnDiaria)+365;
    dmFactura.tblProgServIgualaINSERTADO_POR.Value := strUserName;
    dmFactura.tblProgServIgualaCOD_USUARIO_IN.Value:= VarUsuarioGlb;
    dmFactura.tblProgServIgualaFECHA_IN.Value  := Now;
    DBDateEdit1.SetFocus;
  end;
end;

procedure TfrmProgServFijos.BitBtn2Click2(Sender: TObject);
begin
 if dmFactura.tblProgServIguala.State = dsBrowse then
  begin
    dmFactura.tblProgServIguala.Edit;
  end;
end;

procedure TfrmProgServFijos.BitBtn3Click2(Sender: TObject);
begin
  if dmFactura.tblProgServIguala.State in [dsEdit,dsInsert] then
  begin
    dmFactura.tblProgServIguala.Cancel;
  end else
  if MessageDlg('Borrar record?',mtWarning,[mbYes,mbNo],0) = mrYes then
  begin
    dmFactura.tblProgServIguala.Delete;
    if not dmFactura.tblProgServIguala.Transaction.InTransaction then
    dmFactura.tblProgServIguala.Transaction.StartTransaction;
    try
      dmFactura.tblProgServIguala.Transaction.CommitRetaining;
    except
    dmFactura.tblProgServIguala.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmProgServFijos.BitBtn4Click2(Sender: TObject);
begin
  if dmFactura.tblProgServIguala.State in [dsEdit,dsInsert] then
  begin
    if dmFactura.tblProgServIguala.State = dsInsert then
    begin
      dmFactura.tblProgServIgualaNumero.Value:=FsqlMaxNumero('PROG_IGUALAS ','numero');
      if dmFactura.tblProgServIgualaNumero.IsNull or (dmFactura.tblProgServIgualaNumero.Value = 0) then
     dmFactura.tblProgServIgualaNumero.Value:=1;
    end;
    dmFactura.tblProgServIguala.Post;
    dmFactura.tblProgServIguala.ApplyUpdates;
    if not dmFactura.tblProgServIguala.Transaction.InTransaction then
    dmFactura.tblProgServIguala.Transaction.StartTransaction;
    try
      dmFactura.tblProgServIguala.Transaction.CommitRetaining;
    except
    dmFactura.tblProgServIguala.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmProgServFijos.BitBtn5Click2(Sender: TObject);
begin
  if dmFactura.tblProgServIguala.State in [dsInactive, dsBrowse] then
  begin
    dmFactura.tblProgServIguala.Close;
    dmFactura.tblProgServIguala.Open;
  end;
end;

procedure TfrmProgServFijos.BitBtn7Click(Sender: TObject);
var
  fini, ffin : Integer;
begin
  dmCompania.tblcompania.Close;
  dmCompania.tblcompania.Open;
  dmCompania.tblCompania.Locate('codigo',glbCia_Key,[]);  
  dmcxc.QrybalanceCtes.Close;
  dmcxc.QrybalanceCtes.Open;
  rxDatos.Close;
  rxDatos.Open;
  porcientoItbi := FGlbPorcItbi(ExtraerFecha(GlbFechaTrnDiaria),-1);
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

procedure TfrmProgServFijos.ProcCrearFacturas;
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
  dmFactura.tblProgServIguala.First;
  While Not dmFactura.tblProgServIguala.Eof Do
  begin
    MontoItbis:=0;
    if (dmFactura.tblProgServIgualaCARGAR_ITBIS.Value = 1) then
    MontoItbis := (dmFactura.tblProgServIgualaMonto.Value * porcientoItbi / 100);
    montoneto:= dmFactura.tblProgServIgualaMonto.Value + MontoItbis;

    if (dmFactura.tblProgServIgualaFECHA_ULT_FACT.Value >= GlbFechaTrnDiaria) then
    begin
      dmFactura.tblProgServIguala.Next;
      continue;
    end;
    generof := True;
    ValorNCF:= '';
    Serie_Asignadoncf:=-1;

    if dmFactura.ibQryViewNCF.locate('TIPO_CF', dmFactura.tblProgServIgualaTIPO_NCF.Value,[]) then
    begin
      if (GlbUsaSecNCF2018 = 0) then
      GlbDescNCF := dmFactura.ibQryViewNCFDESCRIPCION.Value
      else
      GlbDescNCF := dmFactura.ibQryViewNCFDESCRIPCION_2018.Value;
      ProcVentaConNCF(montoneto, dmFactura.ibQryViewNCFTIPO_CF.Value, ValorNCF, serieDoc);
      ProcVenta(montoneto, valorNCF, Serie_Asignadoncf, serieDoc, dmFactura.tblProgServIgualaCODIGO_CTE.Value);//Aqui voy
      ProcesaFacturar(montoneto, 1, SerieDoc);
    end else
    begin
      GlbDescNCF:='';
      ProcVenta(montoneto, ValorNCF,Serie_Asignadoncf,serieDoc, dmFactura.tblProgServIgualaCODIGO_CTE.Value);//Aqui voy
      ProcesaFacturar(montoneto, 1, serieDoc);
      serieDoc:=-1;
      Serie_Asignadoncf:=-1;
    end;
    dmFactura.tblProgServIguala.Edit;
    dmFactura.tblProgServIgualaFECHA_ULT_FACT.Value:= GlbFechaTrnDiaria+30;
    dmFactura.tblProgServIguala.Post;
        dmFactura.tblProgServIguala.ApplyUpdates;
    if not dmFactura.tblProgServIguala.Transaction.InTransaction then
    dmFactura.tblProgServIguala.Transaction.StartTransaction;
    try
      dmFactura.tblProgServIguala.Transaction.CommitRetaining;
    except
    dmFactura.tblProgServIguala.Transaction.RollbackRetaining;
    end;
    dmFactura.tblProgServIguala.Next;
  end;
  if not generof then
  MessageDlg('No se generaron facturas, verificar fecha ultima factura.',mtInformation, [mbOK], 0); 
end;

procedure TfrmProgServFijos.EditarBalanceP(monto: Extended; codCliente: Integer);
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

procedure TfrmProgServFijos.InsertaBalanceP(monto: Extended; codCliente: Integer);
begin
  dmcxc.qryBalanceCtes.Insert;
  dmcxc.qryBalanceCtesCODIGO.Value    := CodCliente;
  dmcxc.qryBalanceCtesSERVICIO.Value  := 0;
  dmcxc.qryBalanceCtesMONEDA.Value    := '1';

  dmcxc.qryBalanceCtesBALANCE_ACT.Value := 0;
  dmcxc.qryBalanceCtesDEBITO_MES.Value  := 0;
  dmcxc.qryBalanceCtesDEBITO_ACM.Value  := 0;
  dmcxc.qryBalanceCtesCREDITO_MES.Value := 0;
  dmcxc.qryBalanceCtesCREDITO_ACM.Value := 0;
  dmcxc.qryBalanceCtesBALANCE_ANT.Value := 0;

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
      dmcxc.qryBalanceCtesBALANCE_ACT.Value - Monto;
      dmcxc.qryBalanceCtesCREDITO_MES.Value:= Monto;
      dmcxc.qryBalanceCtesCREDITO_ACM.Value:= Monto;
      dmcxc.qryBalanceCtesFECHA_ULT_PAGO.Value:= Now;
    end;
  end;
end;
  
procedure TfrmProgServFijos.ProcesaFacturar(monto:Extended; tipo: Smallint; numdoc: Integer);
begin
  dmfactura.IBDataSetFacturas.close;
  dmfactura.IBDataSetFacturas.open;

  dmfactura.IBDataSetFacturas.Append;
  dmfactura.IBDataSetFacturasNUMERO.Value := numdoc;
  dmfactura.IBDataSetFacturasPORC_ATRASOCXC.Value := GLBPORC_ATRASOCXC;
  dmfactura.IBDataSetFacturasMONEDA.Value := '1';
  dmfactura.IBDataSetFacturasTIPO.Value := 2;
  dmfactura.IBDataSetFacturasCODIGO_CTE.Value := dmFactura.tblProgServIgualaCODIGO_CTE.Value;
  dmfactura.IBDataSetFacturasFECHA.Value      :=ExtraerFecha(GlbFechatrndiaria);
  dmfactura.IBDataSetFacturasDESCRIPCION.Value:='Servicio de Iguala';
  dmfactura.IBDataSetFacturasMONTO_FACT.Value:=Monto;
  dmfactura.IBDataSetFacturasRCXC.Value:='R';
  dmfactura.IBDataSetFacturasSTATUS.Value:='P';
  dmfactura.IBDataSetFacturasFECHA_IN.Value:=now;

  dmfactura.IBDataSetFacturas.Post;
  dmfactura.IBDataSetFacturas.ApplyUpdates;
  if Not dmfactura.IBDataSetFacturas.Transaction.InTransaction then
  dmfactura.IBDataSetFacturas.Transaction.StartTransaction;
  try
    dmfactura.IBDataSetFacturas.Transaction.CommitRetaining;
  except
  dmfactura.IBDataSetFacturas.Transaction.RollbackRetaining;
  end;

  dmfactura.stpProcInsFactPendiente.Params[0].Value:=ExtraerFecha(GlbFechatrndiaria);
  dmfactura.stpProcInsFactPendiente.Params[1].Value:=ExtraerFecha(GlbFechatrndiaria);
  dmfactura.stpProcInsFactPendiente.Params[2].Value:='1';
  dmfactura.stpProcInsFactPendiente.Params[3].Value:='1';
  dmfactura.stpProcInsFactPendiente.ExecProc;
  dmCxc.tblTransCxc.Params[2].Value:=glbCia_Key;
  if dmCxc.tblTransCxc.state = dsinactive then
  dmCxc.tblTransCxc.Open;
  dmCxc.tblTransCxc.Insert;
  dmCxc.tblTransCxcCIA_KEY.Value:=GlbCodigoCia;
  dmCxc.tblTransCxcSTATUS.Value := 'A';
    //dmCxc.tblTransCxcconcepto.Value     := 'Pago cuota';
    if (tipo = 1) then
    begin
      dmCxc.tblTransCxcTIPO_DOC.Value := 1; //Factura
      dmCxc.tblTransCxcconcepto.Value := 'Servicio Iguala';
    end else dmCxc.tblTransCxcTIPO_DOC.Value := 2; //Recibo

    dmCxc.tblTransCxcmoneda.Value  := '1';
    dmCxc.tblTransCxcfecha.Value   := ExtraerFecha(GlbFechatrndiaria);

    dmCxc.tblTransCxccodigo_cliente.Value := dmFactura.tblProgServIgualaCODIGO_CTE.Value;
    dmCxc.tblTransCxccodigo_serv.Value    := 0;
    dmCxc.tblTransCxcNUMERO_DOC.Value     := Numdoc;

    dmCxc.tblTransCxcvalor_documento.Value:= Monto;
    dmCxc.tblTransCxctipo_tranf.Value     := 1;//Debito
    dmCxc.tblTransCxctipo_serv.Value      := 2;//General
    dmCxc.tblTransCxcfecha_in.Value       := Now;
    dmCxc.tblTransCxcIN_POR.Value := StrUserName;
    dmCxc.tblTransCxc.Post;
    dmCxc.tblTransCxc.ApplyUpdates;
    if Not dmCxc.tblTransCxc.Transaction.InTransaction then
    dmCxc.tblTransCxc.Transaction.StartTransaction;
    try
      dmCxc.tblTransCxc.Transaction.CommitRetaining;
    except
    dmCxc.tblTransCxc.Transaction.RollbackRetaining;
    end;
    //actualiza balance cliente cxc
    ActBalaceCteP(tipo,dmCxc.tblTransCxccodigo_cliente.Value);

    if Not dmCxc.tblTranscxc.Transaction.InTransaction then
    dmCxc.tblTranscxc.Transaction.StartTransaction;
    try
      dmCxc.tblTranscxc.Transaction.CommitRetaining;
    except
    dmCxc.tblTranscxc.Transaction.RollbackRetaining;
    end;
end;

procedure TfrmProgServFijos.ProcVenta(monto:Extended; valorNCF: String;
  Var Serie_Asignadoncf: Integer; var serieDoc: Integer;codCliente:Integer);
  var
    descS : String[60];
begin
  if (seriedoc <= 0 ) then
  begin
    //serieDoc:= FsqlMaxNumero('facturas', 'numero');
    dmVentas.GenNumFactura.ExecQuery;
    if dmVentas.GenNumFactura.Open then
    try
      serieDoc:=dmVentas.GenNumFactura.Fields[0].AsInteger;
    finally
    dmventas.GenNumFactura.Close;
    end;

    if (serieDoc = 0) then
    serieDoc:=1;
  end;

  //if (GlbUsaFctMexico = 1) and (not TotalesFechaIniciaPoliza.IsNull) then
  //ipStpInsertVentMast.Params[1].Value := ExtraerFecha(TotalesFechaIniciaPoliza.Value)
  //else
  //ipStpInsertVentMast.Params[1].Value := ExtraerFecha(GlbFechaTrnDiaria);

  ipStpInsertVentMast.Params[1].Value:= GlbFechaTrnDiaria;
  ipStpInsertVentMast.Params[2].Value:= GlbCodigoCia;
  ipStpInsertVentMast.Params[3].Value :=codCliente;

  ipStpInsertVentMast.Params[4].Value    := VarUsuarioGlb;
  //Asignar tipo Venta
  ipStpInsertVentMast.Params[5].Value    := 7;//Credito Normal

  descS:= dmfactura.tblProgServIgualaDescripcionServicio.Value;
  ipStpInsertVentMast.Params[6].Value := descS;
  ipStpInsertVentMast.Params[7].Value := '1';
  ipStpInsertVentMast.Params[8].Value := Monto; //EditN1.Text;
  ipStpInsertVentMast.Params[9].Value := 'A';
  ipStpInsertVentMast.Params[10].Value := Now;
  ipStpInsertVentMast.Params[11].Value:= Null;
  ipStpInsertVentMast.Params[12].Value:= Null;
  ipStpInsertVentMast.Params[13].Value:= Null;
  ipStpInsertVentMast.Params[14].Value:= SerieDoc;//Numero Factura
  if Serie_asignadoncf > 0 then
  ipStpInsertVentMast.Params[16].Value     := Serie_Asignadoncf
  else ipStpInsertVentMast.Params[16].Value:= Null;

  ipStpInsertVentMast.Params[17].Value:= dmfactura.tblProgServIgualaMONTO.Value;
  ipStpInsertVentMast.Params[18].Value:= 0;
  ipStpInsertVentMast.Params[19].Value:= 0;
  ipStpInsertVentMast.Params[20].Value:= 0;
  ipStpInsertVentMast.Params[21].Value:= 0;
  ipStpInsertVentMast.Params[22].Value:= 0;
  ipStpInsertVentMast.Params[23].Value:= 0;
  ipStpInsertVentMast.Params[24].Value:= '';

  if (Serie_asignadoncf > 0) then
  ipStpInsertVentMast.Params[15].Value     := Serie_Asignadoncf
  else ipStpInsertVentMast.Params[15].Value:= Null;

  ipStpInsertVentMast.Params[39].Value:= 0;
  ipStpInsertVentMast.Params[40].Value:= 0;
  ipStpInsertVentMast.Params[41].Value:= 0;
  //if not rxPreventaticket_id.IsNull then
  //ipStpInsertVentMast.Params[42].Value:= rxPreventaticket_id.Value //ticket fast food limao
  //else
  ipStpInsertVentMast.Params[42].Value:= null;
  ipStpInsertVentMast.Params[43].Value:= 0;

  ipStpInsertVentMast.Params[44].Value:= Null;
  ipStpInsertVentMast.Params[45].Value:= Null;
  ipStpInsertVentMast.Params[46].Value:= Null;//TotalesidNumeroDVeh.Value;  
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

   ActualizaCodUsrCaja(ipStpInsertVentMast.Params[0].Value);

  InsertarDet(ipStpInsertVentMast.Params[0].Value);

  if Not ibStpInsertVentaDet.Transaction.InTransaction then
  ibStpInsertVentaDet.Transaction.StartTransaction;
  try
    ibStpInsertVentaDet.Transaction.CommitRetaining;
  except
  ibStpInsertVentaDet.Transaction.RollbackRetaining;
  end;
end;

procedure TfrmProgServFijos.ProcVentaConNCF(totalneto: Extended;tiponcf: String;
  var
  valorNCF: String;
  var seriedoc: Integer);
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
      serieDoc:= FsqlMaxNumeroFactura('gen_num_factura');//FsqlMaxNumero('facturas','numero');
      if (serieDoc = 0) then
      serieDoc:=1;

      valorNCF:= frmAsignarNCFVenta.ncfGenerado;
    finally
    frmAsignarNCFVenta.free;
    frmAsignarNCFVenta:=nil;
    end;
end;

procedure TfrmProgServFijos.InsertarDet(numero: Integer);
var
  MontoItbis : Extended;
  descS : String[60];
begin
  ibStpInsertVentaDet.Params[0].Value  := Numero;
  ibStpInsertVentaDet.Params[1].Value  := Null;//rxVentaCodArticulo.Value;
  ibStpInsertVentaDet.Params[2].Value  := Null;
  descS:= dmfactura.tblProgServIgualaDescripcionServicio.Value;
  ibStpInsertVentaDet.Params[3].Value  := descS;//dmFactura.tblProgServIgualaDescripcionServicio.Value; //rxVentaDescripcion.Value;
  ibStpInsertVentaDet.Params[4].Value  := 1;//rxVentaCant.Value;
  ibStpInsertVentaDet.Params[5].Value  := dmFactura.tblProgServIgualaMonto.Value;//rxVentaPrecio.Value;
  ibStpInsertVentaDet.Params[6].Value  := 0;//rxVentaporc_desc.Value;//Descuento

  if (dmFactura.tblProgServIgualaCARGAR_ITBIS.Value = 1) then
  MontoItbis := (dmFactura.tblProgServIgualaMonto.Value * porcientoItbi / 100);
  ibStpInsertVentaDet.Params[9].Value  :=
  dmFactura.tblProgServIgualaMonto.Value + MontoItbis;

  ibStpInsertVentaDet.Params[7].Value  := MontoItbis;//itbi_det
  ibStpInsertVentaDet.Params[8].Value  := dmFactura.tblProgServIgualaMonto.Value;//rxVentaMontoBruto.Value;

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

procedure TfrmProgServFijos.FormCreate(Sender: TObject);
begin
  dmFactura.tblServProgIguala.Close;
  dmFactura.tblServProgIguala.Open;
  dmFactura.tblProgServIguala.Close;
  dmFactura.tblProgServIguala.Open;
  dmFactura.tblTipoCF.Close;
  dmFactura.tblTipoCF.Open;
  dmFactura.tblProgServIguala.Close;
  dmFactura.tblProgServIguala.Open;
  dmCxc.qryClientes.Open;
end;

procedure TfrmProgServFijos.BitBtn8Click(Sender: TObject);
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
