unit UFormCobroEstudiantes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, StdCtrls, Buttons, Grids, DBGrids,
  RXDBCtrl, Mask, DBCtrls, WinSkinData, IBStoredProc, IBSQL, RXCtrls,
  ComCtrls, RxMemDS;

type
  TfrmCobroEstudiantes = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    dsqryRepPagosAtrasoEstudianteMaster: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    RxDBGrid1: TRxDBGrid;
    dsqryRepPagosAtrasoEstudiante: TDataSource;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    SkinData1: TSkinData;
    stpactfctingresos: TIBStoredProc;
    Label4: TLabel;
    tblPagosEst: TIBDataSet;
    dstblPagosEst: TDataSource;
    tblPagosEstIDANOESCOLAR: TIntegerField;
    tblPagosEstIDESTUDIANTE: TIntegerField;
    tblPagosEstFECHA_PAGO: TDateTimeField;
    tblPagosEstNUMERO_RECIBO: TIntegerField;
    tblPagosEstMONTO: TFloatField;
    tblPagosEstSTATUS: TIBStringField;
    tblPagosEstCOD_USUARIO: TIntegerField;
    tblPagosEstFECHA_IN: TDateTimeField;
    tblPagosEstIN_POR: TIBStringField;
    tblPagosEstFECHA_UPDATE: TDateTimeField;
    ibsqlMaxRecibo: TIBSQL;
    RxLabel1: TRxLabel;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    Label5: TLabel;
    qryListadoEstudiantes: TIBQuery;
    TreeView1: TTreeView;
    qryListadoEstudiantesCODIGO_CTE: TIntegerField;
    qryListadoEstudiantesNOMBRE_CTE: TIBStringField;
    qryListadoEstudiantesDIRECCION_CONT: TIBStringField;
    qryListadoEstudiantesTELEF_CONTACTO: TIBStringField;
    qryListadoEstudiantesCIUDAD: TIBStringField;
    qryListadoEstudiantesCEDULA: TIBStringField;
    qryListadoEstudiantesID_ESTUDIANTE: TIntegerField;
    qryListadoEstudiantesSECCION: TIBStringField;
    qryListadoEstudiantesDESCRIPCION: TIBStringField;
    qryListadoEstudiantesIDANOESCOLAR: TIntegerField;
    qryListadoEstudiantesNOMBREESTUDIANTE: TIBStringField;
    RxDBGrid2: TRxDBGrid;
    dsqryListadoEstudiantes: TDataSource;
    rxDatosACobrar: TRxMemoryData;
    rxDatosACobrarCodigoCte: TIntegerField;
    rxDatosACobrarIdEstudiante: TIntegerField;
    rxDatosACobrarIdAnoEscolar: TIntegerField;
    rxDatosACobrarFechaPago: TDateTimeField;
    rxDatosACobrarMonto: TCurrencyField;
    dsrxDatosACobrar: TDataSource;
    RxDBGrid3: TRxDBGrid;
    Label6: TLabel;
    rxTotal: TRxMemoryData;
    rxTotalMontoTotal: TCurrencyField;
    DBEdit4: TDBEdit;
    dsrxTotal: TDataSource;
    Button1: TButton;
    Button2: TButton;
    edtCodFamilia: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    edtObservacion: TEdit;
    rxDatosACobrarNombreEstudiante: TStringField;
    BitBtn3: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure TreeView1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure rxDatosACobrarAfterPost(DataSet: TDataSet);
    procedure qryListadoEstudiantesAfterScroll(DataSet: TDataSet);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
  private
    { Private declarations }
    procedure ProcInsertaIngresos(monto : Currency; Var Abortar : Boolean);
    procedure ProcInsertaIngresosDet(monto : Currency; Var Abortar : Boolean);
    function GetFormaPago:Integer;
    procedure ProcInsertarSubItem(tnode:TTreeNode;idEst: integer);
    procedure InsertarItem(NombreFamilia : String);
    function FindRootNode(ACaption: String;
      ATreeView: TTreeView): TTreeNode;
    function GetNodeByText(ATree: TTreeView; AValue: String;
      AVisible: Boolean): TTreeNode;
    procedure SumarMontos;
    procedure ProcActualizarStatus(idEst : Integer; fecha : TDateTime);
    procedure ImprimirRecibo(recibo_numero:integer);
    procedure BuscaUltNumRecibo;
  public
    { Public declarations }
  end;

var
  frmCobroEstudiantes: TfrmCobroEstudiantes;
  xCodCte : Integer;
  FnumRecibo : Integer;

implementation

uses UDatModConectar, UDatModEstudiante, UGlobal, UBuscarClientesPersonasP,
  UDatModIngresos, URegFpago, UDatosVentas, URepIngCobroMensualidadEst,
  UDatModUsuarios, UFormBuscarDatosEstudiantes, DateUtils,
  UReversaCobroEstudiante, UFormEditaReciboIngresos;

{$R *.dfm}

procedure TfrmCobroEstudiantes.BitBtn1Click(Sender: TObject);
begin
  frmBuscarEstudiantes:=TfrmBuscarEstudiantes.Create(nil);
  try
    if edtCodFamilia.Text = '' then
    begin
    frmBuscarEstudiantes.CodigoCliente := -1;
    if frmBuscarEstudiantes.Showmodal = mrOk then
    xCodCte:=frmBuscarEstudiantes.CodigoCliente;
    end else
    xCodCte := StrToInt(edtCodFamilia.Text);
    dmEstudiante.qryCobroMensEstudiantes.Close;
    dmEstudiante.qryCobroMensEstudiantes.Params[0].Value:= GLBIDAnioEscolar;
    dmEstudiante.qryCobroMensEstudiantes.Params[1].Value:= xCodCte;
    dmEstudiante.qryCobroMensEstudiantes.Open;
  finally
  frmBuscarEstudiantes.Free;
  frmBuscarEstudiantes:=Nil;
  end;

  dmEstudiante.qryRepPagosAtrasoEstudiante.Close;
  dmEstudiante.qryRepPagosAtrasoEstudiante.Open;

  TreeView1.Items.Clear;
  qryListadoEstudiantes.Close;
  qryListadoEstudiantes.Params[0].Value := GLBIDAnioEscolar;
  qryListadoEstudiantes.Params[1].Value := xCodCte;
  qryListadoEstudiantes.Open;
  qryListadoEstudiantes.First;
  While Not qryListadoEstudiantes.Eof do
  begin
    InsertarItem(qryListadoEstudiantesNOMBREESTUDIANTE.Value);
    qryListadoEstudiantes.Next;
  end;
  qryListadoEstudiantes.First;
end;

procedure TfrmCobroEstudiantes.BitBtn2Click(Sender: TObject);
var
  i : Integer;
  totalAPagar : Currency;
  Abortar: boolean;
begin
  totalAPagar:= 0;
  //if rxDBGrid1.SelectedRows.Count>0 then
  //With rxDBGrid1.DataSource.DataSet do
  //For i:=0 to rxDBGrid1.SelectedRows.Count-1 do
  //rxDatosACobrar.First;
  //if Not rxDatosACobrar.Eof do
  //begin
    //GotoBookmark(pointer(rxDBGrid1.SelectedRows.Items[i]));
    //if (dmEstudiante.qryRepPagosAtrasoEstudianteSTATUS.Value = 'A') then
    //begin
      //totalAPagar := totalAPagar + dmEstudiante.qryRepPagosAtrasoEstudianteMONTO.Value;
      totalAPagar := rxTotalMontoTotal.Value;
      //dmEstudiante.qryRepPagosAtrasoEstudiante.ApplyUpdates;
      //if Not dmEstudiante.qryRepPagosAtrasoEstudiante.Transaction.InTransaction then
      //dmEstudiante.qryRepPagosAtrasoEstudiante.Transaction.StartTransaction;
      //try
      //  dmEstudiante.qryRepPagosAtrasoEstudiante.Transaction.CommitRetaining;
      //except
     //dmEstudiante.qryRepPagosAtrasoEstudiante.Transaction.RollbackRetaining;
     //end;
    //end;
    //rxDatosACobrar.Next;
  //end;

  ProcInsertaIngresos(totalAPagar,Abortar);
  FnumRecibo := -1;
  if Abortar then Exit;
  FnumRecibo:=dmIngresos.tblIngresoMasterNUMERO.AsInteger;
  //if rxDBGrid1.SelectedRows.Count>0 then
  //With rxDBGrid1.DataSource.DataSet do
    //For i:=0 to rxDBGrid1.SelectedRows.Count-1 do
    rxDatosACobrar.First;
    While Not rxDatosACobrar.Eof do
    begin
      //GotoBookmark(pointer(rxDBGrid1.SelectedRows.Items[i]));
      //if (dmEstudiante.qryRepPagosAtrasoEstudianteSTATUS.Value = 'A') then
      //begin
        ProcInsertaIngresosDet(rxDatosACobrarMONTO.Value, Abortar);
        if Abortar then
        Break
        else
        begin
          //'Where idestudiante=:idestudiante
          //'And idanoescolar=:idanoescolar
          //'And fecha_pago =:fecha_pago
          tblPagosEst.Close;
          tblPagosEst.Params[0].Value:= rxDatosACobrarIdEstudiante.Value;
          tblPagosEst.Params[1].Value:= rxDatosACobrarIdAnoEscolar.Value;
          tblPagosEst.Params[2].Value:= rxDatosACobrarFechaPago.Value;
          tblPagosEst.Open;
          if (tblPagosEst.Recordcount = 1) then
          begin
            tblPagosEst.Edit;
            tblPagosEstSTATUS.Value:= 'R';
            tblPagosEstNUMERO_RECIBO.Value:= dmIngresos.tblIngresoMasterNUMERO.AsInteger;
            tblPagosEstCOD_USUARIO.Value  := VarUsuarioGlb;
            tblPagosEstFECHA_UPDATE.Value := Now;
            tblPagosEst.Post;
            tblPagosEst.ApplyUpdates;
            if Not tblPagosEst.Transaction.InTransaction then
            tblPagosEst.Transaction.StartTransaction;
            try
              tblPagosEst.Transaction.CommitRetaining;
            except
            tblPagosEst.Transaction.RollbackRetaining;
            end;
          end;
        end;
        ProcActualizarStatus(rxDatosACobrarIdEstudiante.Value, rxDatosACobrarFechaPago.Value);
        rxDatosACobrar.Next;
      end;
    dmEstudiante.qryRepPagosAtrasoEstudiante.Close;
    dmEstudiante.qryRepPagosAtrasoEstudiante.Open;
    if ( FnumRecibo > 0 ) then
    ImprimirRecibo(FnumRecibo);
    rxDatosACobrar.EmptyTable;
end;

function TfrmCobroEstudiantes.GetFormaPago: Integer;
begin
  frmFormaPago:=TfrmFormaPago.Create(Nil); //dmIngresos.tblIngresoMasterFORMA_PAGO.Value
  try
    dmVentas.TblFormaPago.Locate('CODIGO',1,[]);
    frmFormaPago.setEfectivo:=1;
    if frmFormaPago.Showmodal = mrOk then
    result := dmVentas.TblFormaPagoCODIGO.Value
    else result:= -1;
  finally
  frmFormaPago.Free;
  frmFormaPago:=Nil;
  end;
end;

procedure TfrmCobroEstudiantes.ProcInsertaIngresosDet(monto : Currency; Var Abortar : Boolean);
begin
  Abortar:=True;
  if dmIngresos.tblIngresoDet.State = dsInactive then
  dmIngresos.tblIngresoDet.Open;
  dmIngresos.tblIngresoDet.Insert;
  if dmIngresos.tblIngresoDet.State In [dsEdit, dsInsert] then
  begin
    if dmIngresos.tblIngresoDet.State In [dsInsert] then
    begin
      dmIngresos.tblIngresoDetNUMERO_ing.Value   := dmIngresos.tblIngresoMasterNUMERO.AsInteger;
      dmIngresos.tblIngresoDetSERIE_MASTER.Value := dmIngresos.tblIngresoMasterNUMERO.AsInteger;
    end;
    dmIngresos.tblIngresoDetDETALLE.Value  := rxDatosACobrarNombreEstudiante.Value;
    // + ' ('+ NombreMes[StrToInt(FormatDateTime('mm',rxDatosACobrarFechaPago.Value))]+')';

    dmIngresos.tblIngresoDetVALOR_DET.Value:= monto;
    dmIngresos.tblIngresoDetSTATUS.Value   := 'A';
    dmIngresos.tblIngresoDetFECHA_IN.Value := GlbFechaTrnDiaria;
    dmIngresos.tblIngresoDetIN_POR.Value   := StrUserName;
    dmIngresos.tblIngresoDetVALOR_IMPUESTO.Value  := 0;
    dmIngresos.tblIngresoDetPORC_DESCUENTO.Value  := 0;
    dmIngresos.tblIngresoDetMONTOAUTORIZADO.Value := 0;
    dmIngresos.tblIngresoDetCOD_SERVICIO.Value    := 0;
    dmIngresos.tblIngresoDetMES_PAGADO.Value := rxDatosACobrarFechaPago.Value;
    dmIngresos.tblIngresoDet.Post;
    dmIngresos.tblIngresoDet.ApplyUpdates;
    if Not dmIngresos.tblIngresoDet.Transaction.InTransaction then
    dmIngresos.tblIngresoDet.Transaction.StartTransaction;
    try
      dmIngresos.tblIngresoDet.Transaction.CommitRetaining;
    except
    dmIngresos.tblIngresoDet.Transaction.RollbackRetaining;
    end;
  end;
  Abortar:=False;
end;

procedure TfrmCobroEstudiantes.ProcInsertaIngresos(monto : Currency; Var Abortar : Boolean);
var
  strNumero : String;
begin
  dmIngresos.tblIngresoMaster.Close;
  dmIngresos.tblIngresoMaster.Open;
  dmIngresos.tblIngresoMaster.Insert;
  if dmIngresos.tblIngresoMaster.State in [dsEdit, dsInsert] then
  begin
    dmIngresos.tblIngresoMasterFECHA_IN.Value:=Now;
    dmIngresos.tblIngresoMasterIN_POR.Value := StrUserName;
    dmIngresos.tblIngresoMasterSTATUS.Value:='A';
    dmIngresos.tblIngresoMasterCODIGO_CTE.Value:=dmEstudiante.qryCobroMensEstudiantesCODIGO_CTE.Value;
    dmIngresos.tblIngresoMasterMONEDA.Value := '1';
    dmIngresos.tblIngresoMasterFECHA.Value := GlbFechaTrnDiaria;
    dmIngresos.tblIngresoMasterVALOR_ING.Value:= monto;
    dmIngresos.tblIngresoMasterTIPO.Value:= 2;

    dmIngresos.tblIngresoMasterTIPO_ING.Value:= 2;
    dmIngresos.tblIngresoMasterFORMA_PAGO.Value:= GetFormaPago;
    if (edtObservacion.Text <> '') then
    dmIngresos.tblIngresoMasterOBSERVACION.Value:= edtObservacion.Text;
    if dmIngresos.tblIngresoMasterFORMA_PAGO.Value = -1 then
    begin
      dmIngresos.tblIngresoMaster.Cancel;
      Abortar:=True;
      Exit;
    end;
    dmIngresos.tblIngresoMasterNOMBRE_CTE.Value:= dmEstudiante.qryCobroMensEstudiantesNOMBRE_CTE.Value;
    dmIngresos.tblIngresoMasterCONCEPTO.Value:='Pago Mensualidad';
    dmIngresos.tblIngresoMasterCOD_EMPLEADO.Value := VarUsuarioGlb;
    dmIngresos.tblIngresoMasterNOTA_DEBITO.Value := 0;
    dmIngresos.tblIngresoMasterNOTA_CREDITO.Value := 0;
    
    if dmIngresos.tblIngresoMaster.State in [dsInsert] then
    dmIngresos.tblIngresoMasterNUMERO.Value:= FsqlMaxNumero('ingresos','numero');
    strNumero:= dmIngresos.tblIngresoMasterNUMERO.AsString;
    dmIngresos.tblIngresoMaster.Post;
    dmIngresos.tblIngresoMaster.ApplyUpdates;
    if Not dmIngresos.tblIngresoMaster.Transaction.InTransaction then
    dmIngresos.tblIngresoMaster.Transaction.StartTransaction;
    try
      dmIngresos.tblIngresoMaster.Transaction.CommitRetaining;
    except
    dmIngresos.tblIngresoMaster.Transaction.RollbackRetaining;
    end;
  end;
         
    if Not dmIngresos.tblIngresoMaster.Transaction.InTransaction then
    dmIngresos.tblIngresoMaster.Transaction.StartTransaction;
    try
      dmIngresos.tblIngresoMaster.Transaction.CommitRetaining;
    except
    dmIngresos.tblIngresoMaster.Transaction.RollbackRetaining;
    end;

end;

procedure TfrmCobroEstudiantes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmEstudiante.qryCobroMensEstudiantes.Close;
  dmEstudiante.qryRepPagosAtrasoEstudiante.Close;
end;

procedure TfrmCobroEstudiantes.FormCreate(Sender: TObject);
begin
  BuscaUltNumRecibo;
  FnumRecibo:= -1;
  dmEstudiante.qryRepPagosAtrasoEstudiante.Close;
end;

function TfrmCobroEstudiantes.FindRootNode(ACaption: String; ATreeView: TTreeView): TTreeNode;
var LCount: Integer;
begin
  result := nil;
  LCount := 0;
  while (LCount < TreeView1.Items.Count) and (result = nil) do
  begin
    if (TreeView1.Items.Item[LCount].Text = ACaption) and
       (TreeView1.Items.Item[LCount].Parent = nil) then
      result := TreeView1.Items.Item[LCount];
    inc(LCount);
  end;
end;

procedure TfrmCobroEstudiantes.InsertarItem(NombreFamilia : String);
var
  Host: TTreeNode;
  Lobby: TTreeNode;
begin
  //Host := TreeView1.Items.AddChild(nil, '@host');
  Lobby := TreeView1.Items.AddChild(nil, NombreFamilia);
  ProcInsertarSubItem(Lobby, qryListadoEstudiantesID_ESTUDIANTE.Value);
  //TreeView1.Items.AddChild(Lobby, 'Room 1');
  //TreeView1.Items.AddChild(Lobby, 'Room 2');
  {Lobby := TreeView1.Items.AddChild(nil, 'Lobby Two');
  TreeView1.Items.AddChild(Lobby, 'Room 3');
  TreeView1.Items.AddChild(Lobby, 'Room 4');}
end;

procedure TfrmCobroEstudiantes.ProcInsertarSubItem(tnode:TTreeNode;idEst: integer);
begin
  dmEstudiante.qryRepPagosAtrasoEstudiante.Close;
  dmEstudiante.qryRepPagosAtrasoEstudiante.Params[0].Value:= GLBIDAnioEscolar;
  dmEstudiante.qryRepPagosAtrasoEstudiante.Params[1].Value:= idEst;
  dmEstudiante.qryRepPagosAtrasoEstudiante.Params[2].Value:= GlbFechaTrnDiaria + 365;
  dmEstudiante.qryRepPagosAtrasoEstudiante.Open;
  dmEstudiante.qryRepPagosAtrasoEstudiante.First;
  While Not dmEstudiante.qryRepPagosAtrasoEstudiante.Eof do
  begin
    TreeView1.Items.AddChild(tnode,dmEstudiante.qryRepPagosAtrasoEstudianteIDESTUDIANTE.AsString+'=>'+
    FormatDatetime('dd-mmm-yyyy', dmEstudiante.qryRepPagosAtrasoEstudianteFECHA_PAGO.Value));
    dmEstudiante.qryRepPagosAtrasoEstudiante.Next;
  end;
end;


function TfrmCobroEstudiantes.GetNodeByText
(ATree : TTreeView; AValue:String; 
 AVisible: Boolean): TTreeNode;
var
    Node: TTreeNode;
begin
  Result := nil;
  if ATree.Items.Count = 0 then Exit;
  Node := ATree.Items[0];
  while Node <> nil do
  begin
    if UpperCase(Node.Text) = UpperCase(AValue) then
    begin
      Result := Node;
      if AVisible then
        Result.MakeVisible;
      Break;
    end;
    Node := Node.GetNext;
  end;
end;
procedure TfrmCobroEstudiantes.TreeView1Click(Sender: TObject);
var
  tn : TTreeNode;
begin
{   tn:=GetNodeByText(TreeView1,'hola',True);
   if tn = nil then
    ShowMessage('Not found!')
   else
    begin
      TreeView1.SetFocus;
      tn.Selected := True;
    end;}
end;

procedure TfrmCobroEstudiantes.Button1Click(Sender: TObject);
begin
  if not rxDatosACobrar.Locate('codigocte;idEstudiante;IdAnoEscolar;FechaPago',
  VarArrayOf([
  qryListadoEstudiantesCODIGO_CTE.Value,
  dmEstudiante.qryRepPagosAtrasoEstudianteIDESTUDIANTE.Value,
  dmEstudiante.qryRepPagosAtrasoEstudianteIDANOESCOLAR.Value,
  dmEstudiante.qryRepPagosAtrasoEstudianteFECHA_PAGO.Value
  ]),[]) then
  begin
    rxDatosACobrar.Append;
    rxDatosACobrarCodigoCte.Value    := qryListadoEstudiantesCODIGO_CTE.Value;
    rxDatosACobrarIdEstudiante.Value := dmEstudiante.qryRepPagosAtrasoEstudianteIDESTUDIANTE.Value;
    rxDatosACobrarIdAnoEscolar.Value := dmEstudiante.qryRepPagosAtrasoEstudianteIDANOESCOLAR.Value;
    rxDatosACobrarFechaPago.Value    := dmEstudiante.qryRepPagosAtrasoEstudianteFECHA_PAGO.Value;
    rxDatosACobrarMonto.Value        := dmEstudiante.qryRepPagosAtrasoEstudianteMONTO.Value;
    rxDatosACobrarNombreEstudiante.Value:= qryListadoEstudiantesNOMBREESTUDIANTE.Value;
    rxDatosACobrar.Post;
  end;
  rxDatosACobrar.SortOnFields('FechaPago',false,false);
end;

procedure TfrmCobroEstudiantes.Button2Click(Sender: TObject);
begin
  if (rxDatosACobrar.RecordCount > 0) then
  begin
  rxDatosACobrar.Delete;
  sumarMontos;
  end;
end;

procedure TfrmCobroEstudiantes.rxDatosACobrarAfterPost(DataSet: TDataSet);
begin
  sumarMontos;
end;

procedure TfrmCobroEstudiantes.SumarMontos;
var
  monto : Currency;
begin
  monto := 0;
  rxDatosACobrar.First;
  While Not rxDatosACobrar.Eof Do
  Begin
    monto:= monto + rxDatosACobrarMonto.Value;
    rxDatosACobrar.Next;
  end;
  rxDatosACobrar.Last;
  rxTotal.close;
  rxTotal.Open;
  rxTotal.Insert;
  rxTotalMontoTotal.Value:=monto;
  rxTotal.Post;
end;
procedure TfrmCobroEstudiantes.qryListadoEstudiantesAfterScroll(
  DataSet: TDataSet);
begin
  dmEstudiante.qryRepPagosAtrasoEstudiante.Close;
  dmEstudiante.qryRepPagosAtrasoEstudiante.Params[0].Value:= GLBIDAnioEscolar;
  dmEstudiante.qryRepPagosAtrasoEstudiante.Params[1].Value:= qryListadoEstudiantesID_ESTUDIANTE.Value;
  dmEstudiante.qryRepPagosAtrasoEstudiante.Params[2].Value:= GlbFechaTrnDiaria + 365;
  dmEstudiante.qryRepPagosAtrasoEstudiante.Open;
end;

procedure TfrmCobroEstudiantes.ProcActualizarStatus(idEst : Integer; fecha : TDateTime);
begin
  dmEstudiante.tblPagosEstudiantes.close;
  dmEstudiante.tblPagosEstudiantes.Params[0].Value:= GLBIDAnioEscolar;
  dmEstudiante.tblPagosEstudiantes.Params[1].Value:= idEst;
  dmEstudiante.tblPagosEstudiantes.Open;
  if dmEstudiante.tblPagosEstudiantes.Locate('FECHA_PAGO', ExtraerFecha(fecha),[]) then
  begin
    dmEstudiante.tblPagosEstudiantes.Edit;
    dmEstudiante.tblPagosEstudiantesSTATUS.Value := 'R';
    dmEstudiante.tblPagosEstudiantes.Post;
    dmEstudiante.tblPagosEstudiantes.ApplyUpdates;
    try
      dmEstudiante.tblPagosEstudiantes.Transaction.CommitRetaining;
    except
    dmEstudiante.tblPagosEstudiantes.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmCobroEstudiantes.ImprimirRecibo(recibo_numero: integer);
  var xnum : Integer;
begin
  xnum:= recibo_numero;
  if xnum  = 0 then
  xnum:= StrToInt(InputBox('Imprimir recibo de ingreso','Entre Número de Recibo','0'));
  if xnum<= 0 then exit;

  dmIngresos.qryRepIngMaster.Close;
  dmIngresos.qryRepIngMaster.Params[0].Value:= xnum;
  dmIngresos.qryRepIngMaster.Open;

  dmIngresos.tblIngresoMaster.Close;
  dmIngresos.tblIngresoMaster.Params[0].Value := dmIngresos.qryRepIngMasterFECHA.Value;
  dmIngresos.tblIngresoMaster.Params[1].Value := dmIngresos.qryRepIngMasterFECHA.Value;
  dmIngresos.tblIngresoMaster.Open;

  if dmUsuarios.qryUsuarios.state = dsInactive then
  dmUsuarios.qryUsuarios.Open;
  dmUsuarios.qryUsuarios.Locate('CODIGO_EMPLEADO',VarUsuarioGlb,[]);

  qckRepIngCobroMensEst:=TqckRepIngCobroMensEst.Create(Nil);

  try
    qckRepIngCobroMensEst.LabelNombUser.Caption:= dmUsuarios.qryUsuariosNOMBRECOMPLETO.Value;
    if dmIngresos.tblIngresoMasterSTATUS.Value = 'P' then
    qckRepIngCobroMensEst.qrLabelReimprimir.Caption:='Re-Impresion' else
    qckRepIngCobroMensEst.qrLabelReimprimir.Caption:='';
    if MessageDlg('Imprimir?', mtInformation,[mbYes, mbNo],0) = mrYes then
    begin
      qckRepIngCobroMensEst.PrinterSetup;
      qckRepIngCobroMensEst.Print;
    end else
    qckRepIngCobroMensEst.Preview;
    if dmIngresos.tblIngresoMasterSTATUS.Value = 'A' then
    begin
      qckRepIngCobroMensEst.qrLabelReimprimir.Caption:='';
      dmIngresos.tblIngresoMaster.Edit;
      dmIngresos.tblIngresoMasterSTATUS.Value := 'P';
      dmIngresos.tblIngresoMaster.Post;
      dmIngresos.tblIngresoMaster.ApplyUpdates;
      if Not dmIngresos.tblIngresoMaster.Transaction.InTransaction then
      dmIngresos.tblIngresoMaster.Transaction.StartTransaction;
      try
        dmIngresos.tblIngresoMaster.Transaction.CommitRetaining;
      except
      dmIngresos.tblIngresoMaster.Transaction.RollbackRetaining;
      end;
    end;
  finally
  qckRepIngCobroMensEst.Free;
  qckRepIngCobroMensEst:=nil;
  end;

end;

procedure TfrmCobroEstudiantes.BitBtn4Click(Sender: TObject);
begin
  if (FnumRecibo > 0) then
  ImprimirRecibo(FnumRecibo) else
  ImprimirRecibo(0);
  BuscaUltNumRecibo;
end;

procedure TfrmCobroEstudiantes.BitBtn3Click(Sender: TObject);
begin
  frmBuscarEstudiantes:=TfrmBuscarEstudiantes.Create(Nil);
  try
    frmBuscarEstudiantes.Showmodal;
  finally
  frmBuscarEstudiantes.Free;
  frmBuscarEstudiantes:=Nil;
  end;
end;

procedure TfrmCobroEstudiantes.BuscaUltNumRecibo;
begin
  if ibsqlMaxRecibo.Open then
  ibsqlMaxRecibo.Close;
  ibsqlMaxRecibo.ExecQuery;
  RxLabel1.Caption := 'Ult. #Recibo: ' + ibsqlMaxRecibo.FieldByName('numerorecibo').AsString;
  rxDatosACobrar.Close;
  rxDatosACobrar.Open;
end;

procedure TfrmCobroEstudiantes.BitBtn6Click(Sender: TObject);
begin
  //dmIngresos.ibstpProcReversarCobroEst.Params[0].Value:= //output
 // dmIngresos.ibstpProcReversarCobroEst.Params[1].Value:=
 // dmIngresos.ibstpProcReversarCobroEst.Params[2].Value:=
 frmReversarCobroEst:=TfrmReversarCobroEst.Create(Nil);
 try
   if frmReversarCobroEst.Showmodal = mrOk then
   begin
     if MessageDlg('Seguro que desea cancelar cobro?',mtWarning,[mbyes,mbno],0) = mryes then
     begin
       dmIngresos.ibstpProcReversarCobroEst.Params[1].Value:= StrToInt(frmReversarCobroEst.Edit1.Text);
       dmIngresos.ibstpProcReversarCobroEst.Params[2].Value:= VarUsuarioGlb;
       dmIngresos.ibstpProcReversarCobroEst.ExecProc;
       if dmIngresos.ibstpProcReversarCobroEst.Params[0].Value = 1 then
       begin
         MessageDlg('Recibo cancelado.',mtInformation,[mbok],0);
       end;
     end;
   end;
 finally
 frmReversarCobroEst.Free;
 frmReversarCobroEst:=Nil;
 end;
end;

procedure TfrmCobroEstudiantes.BitBtn7Click(Sender: TObject);
var
  strNumeroRecibo : String;
begin
   frmEditaReciboIngresos:=TfrmEditaReciboIngresos.Create(Nil);
   try
     strNumeroRecibo:=Inputbox('Modificar fecha recibo','Entre número  recibo','');
     if (length(strNumeroRecibo) > 0) then
     begin
       dmIngresos.tblIngresoMaster.Close;
       dmIngresos.tblIngresoMaster.Params[0].Value:=ExtraerFecha(GlbFechaTrnDiaria);
       dmIngresos.tblIngresoMaster.Params[1].Value:=ExtraerFecha(now);
       dmIngresos.tblIngresoMaster.Open;
       if dmIngresos.tblIngresoMaster.Locate('NUMERO',StrToInt(strNumeroRecibo),[]) then
       begin
         dmIngresos.tblIngresoMaster.Edit;
         dmIngresos.tblIngresoMasterFECHA_MOD.Value := Now;
         dmIngresos.tblIngresoMasterCOD_EMPLEADO.Value := VarUsuarioGlb;
         if frmEditaReciboIngresos.Showmodal = mrOk then
         begin
           if dmIngresos.tblIngresoMaster.state = dsEdit then
           begin
             dmIngresos.tblIngresoMaster.Post;
             dmIngresos.tblIngresoMaster.ApplyUpdates;
             if not dmIngresos.tblIngresoMaster.Transaction.InTransaction then
             dmIngresos.tblIngresoMaster.Transaction.StartTransaction;
             try
               dmIngresos.tblIngresoMaster.Transaction.CommitRetaining;
             except
             dmIngresos.tblIngresoMaster.Transaction.RollbackRetaining;
             end;
           end;
         end else
         dmIngresos.tblIngresoMaster.Cancel;
       end
       else
       begin
         MessageDlg('Numero recibo no existe, verifique.', mtInformation,[mbok],0);
       end;
     end;
   finally
   frmEditaReciboIngresos.Free;
   frmEditaReciboIngresos:=Nil;
   end;
end;

end.
