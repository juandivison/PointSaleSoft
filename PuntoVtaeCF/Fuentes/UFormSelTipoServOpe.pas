unit UFormRegServicioTaller;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, DB, rxToolEdit, RXDBCtrl, Mask, Grids, DBGrids,
  Buttons, RXCtrls, WinSkinData, ComCtrls, RxLookup, RxMemDS, ExtCtrls,
  Menus, GetAnyDate, IBCustomDataSet, IBStoredProc;

type
  TfrmRegServicioTaller = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBStatusLabel1: TDBStatusLabel;
    DBStatusLabel2: TDBStatusLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBDateEdit1: TDBDateEdit;
    DBDateEdit2: TDBDateEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    RxDBGrid1: TRxDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    RxDBGrid2: TRxDBGrid;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    rxData: TRxMemoryData;
    rxDataCodServicio: TIntegerField;
    rxDataDescProducto: TStringField;
    RxCheckListBox1: TRxCheckListBox;
    Label10: TLabel;
    BitBtn13: TBitBtn;
    Shape1: TShape;
    BitBtn14: TBitBtn;
    RxSpeedButton5: TRxSpeedButton;
    PopupMenu1: TPopupMenu;
    ReimprimirComprobante1: TMenuItem;
    Salir1: TMenuItem;
    Consultar1: TMenuItem;
    GetAnyDate1: TGetAnyDate;
    DBEdit8: TDBEdit;
    Label11: TLabel;
    Label12: TLabel;
    Label15: TLabel;
    DBText5: TDBText;
    Edit1: TEdit;
    Label13: TLabel;
    DBText7: TDBText;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label14: TLabel;
    ConsultarActivos1: TMenuItem;
    Listarservicios1: TMenuItem;
    ibstpProcSecuencia: TIBStoredProc;
    BitBtn15: TBitBtn;
    DBMemo1: TDBMemo;
    Label27: TLabel;
    BitBtn16: TBitBtn;
    DBEdit9: TDBEdit;
    Label16: TLabel;
    SpeedButton1: TSpeedButton;
    BitBtn17: TBitBtn;
    PopupMenu2: TPopupMenu;
    EliminarRecordDet1: TMenuItem;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure bblClick(Sender: TObject);
    procedure RxCheckListBox1Click(Sender: TObject);
    procedure DBEdit4Change(Sender: TObject);
    procedure Salir1Click(Sender: TObject);
    procedure Consultar1Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure ConsultarActivos1Click(Sender: TObject);
    procedure Listarservicios1Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBEdit9Exit(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure EliminarRecordDet1Click(Sender: TObject);
    procedure DBEdit8Exit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    procedure ProcSumarValor;
    procedure GuardarMaster;
    procedure GuardarDetalle;
    function GetCodigoServicio(strvalor:string):Integer;
    procedure procUnchecked;
    procedure InsertarVentaMast;
    procedure InsertarVentaDetalle;

    Procedure PostearEnVentas;
  public
    { Public declarations }
  end;

var
  frmRegServicioTaller: TfrmRegServicioTaller;

implementation

uses UDatosVentas, UDatModPrestamo, UDatmodDatosGenerales, UGlobal,
  UDatModCompania, UDatModReportes, URepComisionOpeServ,
  UqckRepComprobanteTaller, UProcVentaRapida, UConsultaInventario,
  UBuscarClientesPersonasP, UFormConsServTaller, UQckRepServVendedor,
  UMaestroClientes, UDatModUsuarios, UDatModClientes, UActivapermisos,
  UDatModCalculos;

{$R *.dfm}

procedure TfrmRegServicioTaller.BitBtn1Click(Sender: TObject);
begin
  GuardarMaster;
  if dmVentas.tblRegServicioDet.State = dsBrowse then
  begin
    dmVentas.tblRegServicioDet.Append;
    dmVentas.tblRegServicioDetNUMERO.Value     := dmVentas.tblRegServicioMasterNUMERO.Value;
    dmVentas.tblRegServicioDetSTATUS.Value     :='A';
    dmVentas.tblRegServicioDetFECHA.Value      := ExtraerFecha(GlbFechaTrnDiaria);
    dmVentas.tblRegServicioDetCOD_USUARIO.Value:= VarUsuarioGlb;
    dmVentas.tblRegServicioDetIN_POR.Value     := strUserName;
    dmVentas.tblRegServicioDetFECHA_IN.Value   := Now;
    dmVentas.tblRegServicioDetPORC_ITBIS.Value := 0;
    dmVentas.tblRegServicioDetVALOR_ITBIS.Value:= 0;
    RxCheckListBox1.SetFocus;
    //DBEdit4.SetFocus;
  end;
end;

procedure TfrmRegServicioTaller.BitBtn2Click(Sender: TObject);
begin
  if dmVentas.tblRegServicioDet.State = dsBrowse then
  dmVentas.tblRegServicioDet.Edit;
  if dmVentas.tblRegServicioMaster.State = dsBrowse then
  dmVentas.tblRegServicioMaster.Edit;
end;

procedure TfrmRegServicioTaller.BitBtn3Click(Sender: TObject);
begin
  if dmVentas.tblRegServicioMaster.State In [dsEdit, dsInsert] then
  begin
    dmVentas.tblRegServicioMaster.Cancel;
    Exit;
  end;
  if dmVentas.tblRegServicioDet.State In [dsEdit, dsInsert] then
  begin
    dmVentas.tblRegServicioDet.Cancel;
    Exit;
  end;

  if dmVentas.tblRegServicioMaster.State = dsBrowse then
  begin
    if MessageDlg('Eliminar Transacción?', mtInformation, [mbYes, mbNo],0)= mrYes then
    begin
      if (dmVentas.tblRegServicioMasterSTATUS.Value = 'R') then
      begin
        MessageDlg('Transacción no puede ser eliminada, verifique.', mtInformation, [mbYes, mbNo],0);
        exit;
      end;
      dmVentas.tblRegServicioDet.First;
      While not dmVentas.tblRegServicioDet.eof do
      begin
        dmVentas.tblRegServicioDet.Delete;
      end;
      dmVentas.tblRegServicioMaster.Delete;
      dmVentas.tblRegServicioMaster.ApplyUpdates;
      if not dmVentas.tblRegServicioMaster.Transaction.InTransaction then
      dmVentas.tblRegServicioMaster.Transaction.StartTransaction;
      try
        dmVentas.tblRegServicioMaster.Transaction.CommitRetaining;
      except
      dmVentas.tblRegServicioMaster.Transaction.RollbackRetaining;
      end;
      if not dmVentas.tblRegServicioDet.Transaction.InTransaction then
      dmVentas.tblRegServicioDet.Transaction.StartTransaction;
      try
        dmVentas.tblRegServicioDet.Transaction.CommitRetaining;
      except
      dmVentas.tblRegServicioDet.Transaction.RollbackRetaining;
      end;
    end;
  end;
end;

procedure TfrmRegServicioTaller.GuardarMaster;
begin
  if dmVentas.tblRegServicioMaster.State in [dsEdit, dsInsert] then
  begin
    if dmVentas.tblRegServicioMasterFECHA_ENTRADA.IsNull then
    begin
      MessageDlg('Favor indicar fecha de entrada, verifique.', mtWarning,[mbOk], 0);
      DBDateEdit1.SetFocus;
      exit;
    end;
    if dmVentas.tblRegServicioMasterCODIGO_EMP.IsNull then
    begin
      MessageDlg('Favor indicar facilitador servicio, verifique.', mtWarning,[mbOk], 0);
      RxDBLookupCombo1.SetFocus;
      exit;
    end;    
    if dmVentas.tblRegServicioMaster.State = dsInsert then
    begin
      dmVentas.tblRegServicioMasterNUMERO.Value := FsqlMaxNumero('SERVICIOS_MASTER','NUMERO');
      if dmVentas.tblRegServicioMasterNUMERO.IsNull Or (dmVentas.tblRegServicioMasterNUMERO.Value = 0) then
      dmVentas.tblRegServicioMasterNUMERO.Value := 1;
    end;
    dmVentas.tblRegServicioMaster.Post;
    dmVentas.tblRegServicioMaster.ApplyUpdates;
    if not dmVentas.tblRegServicioMaster.Transaction.InTransaction then
    dmVentas.tblRegServicioMaster.Transaction.StartTransaction;
    try
      dmVentas.tblRegServicioMaster.Transaction.CommitRetaining;
    except
    dmVentas.tblRegServicioMaster.Transaction.RollbackRetaining;
    end;
  end;
end;
procedure TfrmRegServicioTaller.BitBtn4Click(Sender: TObject);
begin
  GuardarMaster;

  if dmVentas.tblRegServicioDet.State in [dsEdit, dsInsert] then
  begin
    if dmVentas.tblRegServicioDet.State = dsInsert then
    begin
      dmVentas.tblRegServicioDetSERIE.Value := FsqlMaxNumero('DETALLE_SERVICIO','SERIE');
      if dmVentas.tblRegServicioDetSERIE.IsNull Or (dmVentas.tblRegServicioDetSERIE.Value = 0) then
      dmVentas.tblRegServicioDetSERIE.Value := 1;
    end;
    dmVentas.tblRegServicioDet.Post;
    dmVentas.tblRegServicioDet.ApplyUpdates;
    if not dmVentas.tblRegServicioDet.Transaction.InTransaction then
    dmVentas.tblRegServicioDet.Transaction.StartTransaction;
    try
      dmVentas.tblRegServicioDet.Transaction.CommitRetaining;
    except
    dmVentas.tblRegServicioDet.Transaction.RollbackRetaining;
    end;
  end;
  ProcSumarValor;
end;

procedure TfrmRegServicioTaller.BitBtn5Click(Sender: TObject);
begin
  if dmVentas.tblRegServicioMaster.State in [dsInactive, dsBrowse] then
  begin
    dmVentas.tblRegServicioMaster.Close;
    dmVentas.tblRegServicioMaster.Open;
  end;
end;



procedure TfrmRegServicioTaller.BitBtn7Click(Sender: TObject);
begin
  dmVentas.tblRegServicioMaster.Append;
  dmVentas.tblRegServicioMasterFECHA_ENTRADA.Value:=ExtraerFecha(GlbFechaTrnDiaria);
  dmVentas.tblRegServicioMasterFECHA_SALIDA.Value :=ExtraerFecha(GlbFechaTrnDiaria);
  dmVentas.tblRegServicioMasterCODIGO_CTE.Value   := 0;  
  dmVentas.tblRegServicioMasterSTATUS.Value     := 'A';
  BitBtn14.Enabled := True;
  DBEdit1.SetFocus;
end;

procedure TfrmRegServicioTaller.FormCreate(Sender: TObject);
begin
  //if (GetOSVersion = '2600') then
  //SkinData1.Active:=False;
  dmVentas.tblRegServicioMaster.Close;
  dmVentas.tblRegServicioMaster.Params[0].AsDateTime :=ExtraerFecha(GlbFechaTrnDiaria)-30;
  dmVentas.tblRegServicioMaster.Params[1].AsDateTime :=ExtraerFecha(GlbFechaTrnDiaria)+50;
  dmVentas.tblRegServicioMaster.Params[2].Value:='A';
  dmVentas.tblRegServicioMaster.Open;

  dmVentas.qryInventarioServTaller.Close;
  dmVentas.qryInventarioServTaller.Open;
  dmVentas.qryEmpleado.Close;
  dmVentas.qryEmpleado.Open;
  dmVentas.qryInventarioServTaller.First;
  RxCheckListBox1.Clear;
  While Not dmVentas.qryInventarioServTaller.Eof do
  begin
    RxCheckListBox1.Items.Add(dmVentas.qryInventarioServTallerDESCRIPCION.Value);
    dmVentas.qryInventarioServTaller.Next;
  end;
end;

procedure TfrmRegServicioTaller.ProcSumarValor;
var
  valorServicio : Real;
begin
  valorServicio := 0;
  if dmVentas.tblRegServicioDet.State in [dsInsert, dsEdit] then exit;
  dmVentas.tblRegServicioDet.First;
  While Not dmVentas.tblRegServicioDet.Eof do
  begin
    valorServicio:= valorServicio + dmVentas.tblRegServicioDetVALOR_SERVICIO.Value;
    dmVentas.tblRegServicioDet.Next;
  end;
  if dmVentas.tblRegServicioMaster.State = dsBrowse then
  dmVentas.tblRegServicioMaster.Edit;
  dmVentas.tblRegServicioMasterMONTO_TOTAL.Value :=valorServicio;
  GuardarMaster;  
end;

procedure TfrmRegServicioTaller.BitBtn8Click(Sender: TObject);
var
  flag : Boolean;
  guardarRec : TBookMark;
begin
  //temp if (Length(Edit1.Text) = 0) AND (dmVentas.tblRegServicioMasterSTATUS.Value = 'A') then
  //temp begin
  //temp   MessageDlg('Favor indicar monto recibido.', mtWarning, [mbOk], 0);
  //temp   Edit1.SetFocus;
  //temp   Exit;
  //temp end;
  guardarRec:= dmVentas.tblRegServicioMaster.GetBookmark;  
  if (dmVentas.tblRegServicioMasterSTATUS.Value = 'C') then
  begin
    MessageDlg('Transacción tiene status cancelado, verifique.', mtWarning,[mbOk], 0);
    Exit;
  end;
  dmCompania.tblCompania.Close;
  dmCompania.tblCompania.Open;
  dmCompania.tblCompania.Locate('codigo',glbCia_Key,[]);  
  if (dmVentas.tblRegServicioMasterSTATUS.Value = 'A') then
  begin
    dmVentas.qryRegServMasterRep.Close;
    dmVentas.qryRegServMasterRep.Params[0].Value:= dmVentas.tblRegServicioMasterNUMERO.Value;
    dmVentas.qryRegServMasterRep.Open;
  end else
  begin
    dmVentas.qryRegServMasterRep.Close;
    dmVentas.qryRegServMasterRep.Params[0].Value:= StrToInt(InputBox('Re-Imprimir comprobante','Entre numero a imprimir:',dmVentas.tblRegServicioMasterNUMERO.AsString));
    dmVentas.qryRegServMasterRep.Open;
  end;
  qckRepComprobanteTaller:=TqckRepComprobanteTaller.Create(Nil);
  try
    if (dmVentas.tblRegServicioMasterSTATUS.Value = 'A') then
    begin
      qckRepComprobanteTaller.QRLabel27.Caption:='No es una venta.';
    end;
    qckRepComprobanteTaller.Prepare;
    repeat
      begin
        if (qckRepComprobanteTaller.PageNumber > 1) then
        begin
          qckRepComprobanteTaller.Page.Length:= qckRepComprobanteTaller.Page.Length + 0.25;
          qckRepComprobanteTaller.Prepare;
          flag:=False;
        end else break;
      end;
    until flag = true;

    qckRepComprobanteTaller.Preview;
    finally
    qckRepComprobanteTaller.Free;
    qckRepComprobanteTaller:=nil;
    end;
  //if (dmVentas.tblRegServicioMasterSTATUS.Value = 'A') then
  //begin
    //qckRepComprobanteTaller.QRLabel27.Caption:='No es una venta.';
    //temp Estoy verificando hacer el cierre en la ventana de ventas
    //temp dmVentas.tblRegServicioMaster.Edit;
    //temp dmVentas.tblRegServicioMasterSTATUS.Value:= 'R';
    //temp GuardarMaster;
    //temp InsertarVentaMast;
    //temp dmVentas.tblRegServicioDet.First;
    //temp While Not dmVentas.tblRegServicioDet.Eof Do
    //temp begin
    //temp  InsertarVentaDetalle;
    //temp  dmVentas.tblRegServicioDet.Next;
    //temp end;
  //end;

  dmVentas.tblRegServicioMaster.Close;
  dmVentas.tblRegServicioMaster.Open;
  dmVentas.tblRegServicioDet.Close;
  //dmVentas.tblRegServicioDet.Params[0].Value:=null;
  dmVentas.tblRegServicioDet.Open;
  dmVentas.tblRegServicioMaster.Last;
  Edit1.Text:='';
  procUnchecked;
  dmVentas.tblRegServicioMaster.GotoBookmark(guardarRec);
  dmVentas.tblRegServicioMaster.FreeBookmark(guardarRec);  
end;

procedure TfrmRegServicioTaller.procUnchecked;
var
 x : integer;
begin
 For x:=0 To RxCheckListBox1.Items.Count-1 Do
 RxCheckListBox1.Checked[x] := false;
end;

procedure TfrmRegServicioTaller.BitBtn9Click(Sender: TObject);
begin
  dmVentas.tblRegServicioMaster.First;
end;

procedure TfrmRegServicioTaller.BitBtn10Click(Sender: TObject);
begin
  dmVentas.tblRegServicioMaster.Prior;
end;

procedure TfrmRegServicioTaller.BitBtn11Click(Sender: TObject);
begin
  dmVentas.tblRegServicioMaster.Next;
end;

procedure TfrmRegServicioTaller.BitBtn12Click(Sender: TObject);
begin
  dmVentas.tblRegServicioMaster.Last;
end;

function TfrmRegServicioTaller.GetCodigoServicio(strvalor:string):Integer;
begin
  if dmVentas.qryInventarioServTaller.Locate('DESCRIPCION',strvalor,[]) then
  result := dmVentas.qryInventarioServTallerCODIGO.Value
  else result :=0;
end;

procedure TfrmRegServicioTaller.GuardarDetalle;
begin
  if dmVentas.tblRegServicioDet.State in [dsEdit, dsInsert] then
  begin
    if dmVentas.tblRegServicioDet.State = dsInsert then
    begin
      dmVentas.tblRegServicioDetNUMERO.Value := dmVentas.tblRegServicioMasterNUMERO.Value;
      
      dmVentas.tblRegServicioDetSERIE.Value  := FsqlMaxNumero('DETALLE_SERVICIO','SERIE');
      if dmVentas.tblRegServicioDetSERIE.IsNull Or (dmVentas.tblRegServicioDetSERIE.Value = 0) then
      dmVentas.tblRegServicioDetSERIE.Value  := 1;
    end;
    dmVentas.tblRegServicioDet.Post;
    dmVentas.tblRegServicioDet.ApplyUpdates;
    if not dmVentas.tblRegServicioDet.Transaction.InTransaction then
    dmVentas.tblRegServicioDet.Transaction.StartTransaction;
    try
      dmVentas.tblRegServicioDet.Transaction.CommitRetaining;
    except
    dmVentas.tblRegServicioDet.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmRegServicioTaller.BitBtn14Click(Sender: TObject);
var
  i,xcodServicio : Integer;
begin
  //if (dmVentas.tblRegServicioMaster.State = dsBrowse) then
  {begin
    dmVentas.tblRegServicioMaster.Insert;
    dmVentas.tblRegServicioMasterFECHA_ENTRADA.Value:= ExtraerFecha(GlbFechaTrnDiaria);
    dmVentas.tblRegServicioMasterFECHA_SALIDA.Value := ExtraerFecha(GlbFechaTrnDiaria)+1;
    dmVentas.tblRegServicioMasterCOD_USUARIO.Value  := VarUsuarioGlb;
    dmVentas.tblRegServicioMasterSTATUS.Value:='A';
  end; }
  if dmVentas.tblRegServicioMaster.RecordCount = 0 then exit;

  if dmVentas.tblRegServicioDet.State = dsBrowse then
  begin
    GuardarMaster;
    For i:=0 To RxCheckListBox1.Items.Count-1 Do
    begin
      if (RxCheckListBox1.Checked[i] = true) then
      begin
        xcodServicio := GetCodigoServicio(rxCheckListBox1.Items.Strings[i]);
        if dmVentas.tblRegServicioDet.Locate('COD_SERVICIO', xcodServicio,[]) then
        continue;
        dmVentas.tblRegServicioDet.Append;
        dmVentas.tblRegServicioDetCANT.Value:=1;
        dmVentas.tblRegServicioDetCOD_SERVICIO.Value:= xcodServicio;
        dmVentas.tblRegServicioDetDESCRIPCION.Value := rxCheckListBox1.Items.Strings[i];
        dmVentas.tblRegServicioDetPRECIO.Value := dmventas.qryInventarioServTallerPRECIO.Value;
        dmVentas.tblRegServicioDetVALOR_SERVICIO.Value:= dmVentas.tblRegServicioDetCANT.Value * 
        dmVentas.tblRegServicioDetPRECIO.Value;

        dmVentas.tblRegServicioDetNUMERO.Value      := dmVentas.tblRegServicioMasterNUMERO.Value;
        dmVentas.tblRegServicioDetSTATUS.Value      := 'A';
        dmVentas.tblRegServicioDetFECHA.Value       := ExtraerFecha(GlbFechaTrnDiaria);
        dmVentas.tblRegServicioDetCOD_USUARIO.Value := VarUsuarioGlb;
        dmVentas.tblRegServicioDetIN_POR.Value      := strUserName;
        dmVentas.tblRegServicioDetFECHA_IN.Value    := Now;
        dmVentas.tblRegServicioDetPORC_ITBIS.Value  := 0;
        dmVentas.tblRegServicioDetVALOR_ITBIS.Value := 0;
        GuardarDetalle;
      end;
    end;
    ProcSumarValor;
    dmVentas.tblRegServicioDet.Last;
    //BitBtn14.Enabled := False;
    DBEdit4.SetFocus;
    //BitBtn8.SetFocus;
  end else
  if dmVentas.tblRegServicioDet.State = dsInsert then
  begin
    dmVentas.tblRegServicioDetCANT.Value:=1;
    dmVentas.tblRegServicioDetCOD_SERVICIO.Value:= xcodServicio;
    dmVentas.tblRegServicioDetDESCRIPCION.Value := rxCheckListBox1.Items.Strings[i];
    dmVentas.tblRegServicioDetPRECIO.Value := dmventas.qryInventarioServTallerPRECIO.Value;
    dmVentas.tblRegServicioDetVALOR_SERVICIO.Value:= dmVentas.tblRegServicioDetCANT.Value *
    dmVentas.tblRegServicioDetPRECIO.Value;

    dmVentas.tblRegServicioDetNUMERO.Value      := dmVentas.tblRegServicioMasterNUMERO.Value;
    dmVentas.tblRegServicioDetSTATUS.Value      := 'A';
    dmVentas.tblRegServicioDetFECHA.Value       := ExtraerFecha(GlbFechaTrnDiaria);
    dmVentas.tblRegServicioDetCOD_USUARIO.Value := VarUsuarioGlb;
    dmVentas.tblRegServicioDetIN_POR.Value      := strUserName;
    dmVentas.tblRegServicioDetFECHA_IN.Value    := Now;
    dmVentas.tblRegServicioDetPORC_ITBIS.Value  := 0;
    dmVentas.tblRegServicioDetVALOR_ITBIS.Value := 0;
    GuardarDetalle;    
    ProcSumarValor;
    dmVentas.tblRegServicioDet.Last;
  end;
end;

procedure TfrmRegServicioTaller.BitBtn13Click(Sender: TObject);
var
  i, xcodServicio : Integer;
begin
  For i:= 0 To RxCheckListBox1.Items.Count-1 Do
    begin
      if (RxCheckListBox1.Checked[i] = true) then
      begin
        xcodServicio := GetCodigoServicio(rxCheckListBox1.Items.Strings[i]);
        if dmVentas.tblRegServicioDet.Locate('COD_SERVICIO', xcodServicio,[]) then
        continue;
        dmVentas.tblRegServicioDet.Insert;
        dmVentas.tblRegServicioDetCANT.Value := 1;
        dmVentas.tblRegServicioDetCOD_SERVICIO.Value:= xcodServicio;
        dmVentas.tblRegServicioDetPRECIO.Value := dmventas.qryInventarioServTallerPRECIO.Value;
        dmVentas.tblRegServicioDetVALOR_SERVICIO.Value:= dmVentas.tblRegServicioDetCANT.Value * 
        dmVentas.tblRegServicioDetPRECIO.Value;
        dmVentas.tblRegServicioDetDESCRIPCION.Value := rxCheckListBox1.Items.Strings[i];
        dmVentas.tblRegServicioDetNUMERO.Value      := dmVentas.tblRegServicioMasterNUMERO.Value;
        dmVentas.tblRegServicioDetSTATUS.Value      := 'A';
        dmVentas.tblRegServicioDetFECHA.Value       := ExtraerFecha(GlbFechaTrnDiaria);
        dmVentas.tblRegServicioDetCOD_USUARIO.Value := VarUsuarioGlb;
        dmVentas.tblRegServicioDetIN_POR.Value      := strUserName;
        dmVentas.tblRegServicioDetFECHA_IN.Value    := Now;
        dmVentas.tblRegServicioDetPORC_ITBIS.Value  := 0;
        dmVentas.tblRegServicioDetVALOR_ITBIS.Value := 0;
        GuardarDetalle;
      end;
    end;
    ProcSumarValor;
end;

procedure TfrmRegServicioTaller.bblClick(Sender: TObject);
begin
  if (dmVentas.tblRegServicioDet.RecordCount > 0) then
  begin
    if MessageDlg('Eliminar Record?', mtInformation, [mbYes, mbNo],0)= mrYes then
    begin
      if (dmVentas.tblRegServicioDetSTATUS.Value = 'A') then
      dmVentas.tblRegServicioDet.Delete;
      GuardarDetalle;
    end;
  end;
end;

procedure TfrmRegServicioTaller.RxCheckListBox1Click(Sender: TObject);
begin
  if RxCheckListBox1.SelCount > 1 then
  begin
    BitBtn13.Enabled:=True;
    BitBtn14.Enabled:=False;
  end else
  if RxCheckListBox1.SelCount = 1 then
  begin
    BitBtn14.Enabled:=True;
    BitBtn14Click(Self);
    BitBtn13.Enabled:=False;    
  end else
  begin
    BitBtn13.Enabled:=False;
    BitBtn14.Enabled:=False;
  end;
end;

procedure TfrmRegServicioTaller.DBEdit4Change(Sender: TObject);
begin
  if dmVentas.tblRegServicioDet.State In [dsEdit, dsInsert] Then
  dmVentas.tblRegServicioDetVALOR_SERVICIO.Value:=
  dmVentas.tblRegServicioDetPRECIO.Value * dmVentas.tblRegServicioDetCANT.Value;
end;

procedure TfrmRegServicioTaller.Salir1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmRegServicioTaller.Consultar1Click(Sender: TObject);
begin
  GetAnyDate1.FechaCierre := ExtraerFecha(GlbFechaTrnDiaria);
  if GetAnyDate1.Execute Then
  begin
    dmVentas.tblRegServicioMaster.Close;
    dmVentas.tblRegServicioMaster.Params[0].AsDateTime := ExtraerFecha(GetAnyDate1.Fecha);
    dmVentas.tblRegServicioMaster.Params[1].AsDateTime := ExtraerFecha(GetAnyDate1.FechaFinal);
    dmVentas.tblRegServicioMaster.Params[2].Value      := 'R';
    dmVentas.tblRegServicioMaster.Open;
  end;
end;

procedure TfrmRegServicioTaller.Edit1Exit(Sender: TObject);
var
  x,y : Real;
  Activa : Boolean;
  svalue : String;
  xvalue : String;
begin
  Activa:=True;
  if Edit1.text = '' then exit;
  x := StrToFloat(Edit1.Text);

  xvalue := Format('%8.2f', [StrToFloat(Edit1.Text)]);
  svalue := Format('%8.2f', [dmVentas.tblRegServicioMasterMONTO_TOTAL.Value]);
  x:= StrToFloat(xvalue);
  y:= StrToFloat(svalue);
  if (xvalue = svalue) then
  Activa:=True
  else
  if ((x - y) > 0 ) then
  begin
    Activa := False;
  end else Activa := True;

  x := StrToFloat(xvalue) - StrToFloat(svalue);
  //Totales.Edit;
  
  //BitBtn4.Enabled := True;
  //if Not EsFactura Or Not EsFinanciamiento then
    if (x < -0.01 ) then
    begin
      MessageDlg('Monto entregado es menor que total a pagar, verifique',mtInformation, [mbOK], 0);
      Edit1.SetFocus;
      BitBtn4.Enabled := False;
      Exit;
    end;
  //Totalesmontorecibido.AsString := Edit1.Text;
  dmVentas.tblRegServicioMaster.Edit;
  dmVentas.tblRegServicioMasterMONTO_RECIBIDO.AsString:= Edit1.Text;
  dmVentas.tblRegServicioMasterMONTO_DEVUELTO.Value:=x;

  GuardarMaster;

  {if (x > 0) then
  Totalesdevolucion.Value := x;
  Totales.Post;}

  BitBtn8.Enabled := True;
  BitBtn8.SetFocus;
end;

procedure TfrmRegServicioTaller.InsertarVentaMast;
begin
  //dmVentas.ibstpProcInsVentaMast.params[0].Value
  dmVentas.ibstpProcInsVentaMast.params[1].Value:=dmVentas.tblRegServicioMasterFECHA_ENTRADA.Value;
  dmVentas.ibstpProcInsVentaMast.params[2].Value:=glbCia_Key;
  dmVentas.ibstpProcInsVentaMast.params[3].Value:=0;
  dmVentas.ibstpProcInsVentaMast.params[4].Value:=VarUsuarioGlb;
  dmVentas.ibstpProcInsVentaMast.params[5].Value:=1;
  dmVentas.ibstpProcInsVentaMast.params[6].Value:='Servicio';
  dmVentas.ibstpProcInsVentaMast.params[7].Value:='1';
  dmVentas.ibstpProcInsVentaMast.params[8].Value:= dmVentas.tblRegServicioMasterMONTO_TOTAL.Value;
  dmVentas.ibstpProcInsVentaMast.params[9].Value:= 'A';
  dmVentas.ibstpProcInsVentaMast.params[10].Value:= Now;
  dmVentas.ibstpProcInsVentaMast.params[11].Value:= StrUserName;
  dmVentas.ibstpProcInsVentaMast.params[12].Value:= null;
  dmVentas.ibstpProcInsVentaMast.params[13].Value:= null;
  dmVentas.ibstpProcInsVentaMast.params[14].Value:= null;//dmVentas.tblRegServicioMasterNUMERO.Value;
  ibstpProcSecuencia.Params[1].Value := 1;
  ibstpProcSecuencia.Params[2].Value := VarUsuarioGlb;
  ibstpProcSecuencia.ExecProc;  
  dmVentas.ibstpProcInsVentaMast.params[15].Value:=ibstpProcSecuencia.Params[0].Value;//dmVentas.tblRegServicioMasterNUMERO.AsString;
  dmVentas.ibstpProcInsVentaMast.params[16].Value:=null;
  dmVentas.ibstpProcInsVentaMast.params[17].Value:=dmVentas.tblRegServicioMasterMONTO_TOTAL.Value;
  dmVentas.ibstpProcInsVentaMast.params[18].Value:=0;
  dmVentas.ibstpProcInsVentaMast.params[19].Value:=0;
  dmVentas.ibstpProcInsVentaMast.params[20].Value:=dmVentas.tblRegServicioMasterMONTO_RECIBIDO.Value;
  dmVentas.ibstpProcInsVentaMast.params[21].Value:=dmVentas.tblRegServicioMasterMONTO_DEVUELTO.Value;
  dmVentas.ibstpProcInsVentaMast.params[22].Value:=0;
  dmVentas.ibstpProcInsVentaMast.params[23].Value:=0;
  dmVentas.ibstpProcInsVentaMast.params[24].Value:=dmVentas.tblRegServicioMasterNOMBRE_CLIENTE.Value;

  dmVentas.ibstpProcInsVentaMast.Params[25].Value:= 0;//TotalesMontoDescGastosAdmin.Value;
  dmVentas.ibstpProcInsVentaMast.Params[26].Value:= 0;//TotalesMontoDescItbisGastosAdmin.Value;
  dmVentas.ibstpProcInsVentaMast.Params[27].Value:= 0;//TotalesMontoDescTransp.Value;
  dmVentas.ibstpProcInsVentaMast.Params[28].Value:= 0;//TotalesMontoDescDirtecnica.Value;
  dmVentas.ibstpProcInsVentaMast.Params[29].Value:= 0;//TotalesMontoDescItbisDirTecnica.Value;
  dmVentas.ibstpProcInsVentaMast.Params[30].Value:= 0;//TotalesMontoDescImprevisto.Value;
  dmVentas.ibstpProcInsVentaMast.Params[31].Value:= 0;//TotalesMontoDescItbisImprevisto.Value;
  dmVentas.ibstpProcInsVentaMast.Params[32].Value:= null;//totalesComentario.Value;
  dmVentas.ibstpProcInsVentaMast.Params[33].Value:= null;//rxVentaNumeroCotiza.Value;
  dmVentas.ibstpProcInsVentaMast.Params[34].Value:= 0;//totalesReferenciaCte.Value;
  dmVentas.ibstpProcInsVentaMast.Params[35].Value:= 0;//TotalesRecargo.Value;

  dmVentas.ibstpProcInsVentaMast.Params[37].Value:= 0;// TotalesMontoExoneraITBIS.Value;
  dmVentas.ibstpProcInsVentaMast.Params[38].Value:= 0;

  //t if Serie_asignadoncf > 0 then
  //t begin
  //t   dmVentas.ibstpProcInsVentaMast.Params[16].Value  := Serie_asignadoncf;
  //t     dmVentas.ibstpProcInsVentaMast.Params[36].Value:= TotalesTipoNCFIFiscal.Value;
  //t end else
  begin
    dmVentas.ibstpProcInsVentaMast.Params[16].Value:= Null;
    dmVentas.ibstpProcInsVentaMast.Params[36].Value:= Null;
  end;

  dmVentas.ibstpProcInsVentaMast.ExecProc;
  if not dmVentas.ibstpProcInsVentaMast.Transaction.InTransaction then
  dmVentas.ibstpProcInsVentaMast.Transaction.StartTransaction;
  try
    dmVentas.ibstpProcInsVentaMast.Transaction.CommitRetaining;
  except
  dmVentas.ibstpProcInsVentaMast.Transaction.RollbackRetaining;
  end;
end;

procedure TfrmRegServicioTaller.InsertarVentaDetalle;
begin
  dmVentas.ibstpProcInsVentaDetalle.params[0].Value:=dmVentas.ibstpProcInsVentaMast.params[0].Value;
  dmVentas.ibstpProcInsVentaDetalle.params[1].Value:=dmventas.tblRegServicioDetCOD_SERVICIO.Value;
  dmVentas.ibstpProcInsVentaDetalle.params[2].Value:=null;
  dmVentas.ibstpProcInsVentaDetalle.params[3].Value:=dmventas.tblRegServicioDetDESCRIPCION.Value;
  dmVentas.ibstpProcInsVentaDetalle.params[4].Value:=dmventas.tblRegServicioDetCANT.Value;
  dmVentas.ibstpProcInsVentaDetalle.params[5].Value:=dmventas.tblRegServicioDetPRECIO.Value;
  dmVentas.ibstpProcInsVentaDetalle.params[6].Value:=dmventas.tblRegServicioDetPORC_DESC.Value;
  dmVentas.ibstpProcInsVentaDetalle.params[7].Value:=dmventas.tblRegServicioDetVALOR_ITBIS.Value;

  dmVentas.ibstpProcInsVentaDetalle.params[8].Value:=dmventas.tblRegServicioDetVALOR_SERVICIO.Value;
  dmVentas.ibstpProcInsVentaDetalle.params[9].Value:=dmventas.tblRegServicioDetVALOR_SERVICIO.Value;
  dmVentas.ibstpProcInsVentaDetalle.params[10].Value:=dmventas.tblRegServicioMasterNUMERO.Value;
  dmVentas.ibstpProcInsVentaDetalle.params[11].Value:='A';
  dmVentas.ibstpProcInsVentaDetalle.params[12].Value:=Now;
  dmVentas.ibstpProcInsVentaDetalle.params[13].Value:=strusername;
  dmVentas.ibstpProcInsVentaDetalle.params[14].Value:=null;
  dmVentas.ibstpProcInsVentaDetalle.params[15].Value:=null;
  dmVentas.ibstpProcInsVentaDetalle.params[16].Value:=null;
  dmVentas.ibstpProcInsVentaDetalle.params[17].Value:=null;
  dmVentas.ibstpProcInsVentaDetalle.params[18].Value:=null;
  dmVentas.ibstpProcInsVentaDetalle.params[19].Value:=null;
  dmVentas.ibstpProcInsVentaDetalle.params[20].Value:=null;
  dmVentas.ibstpProcInsVentaDetalle.params[21].Value:=null;
  dmVentas.ibstpProcInsVentaDetalle.params[22].Value:=null;
  dmVentas.ibstpProcInsVentaDetalle.params[23].Value:=null;
  //dmVentas.ibstpProcInsVentaDetalle.params[24].Value:=dmVentas.tblRegServicioMasterNOMBRE_CLIENTE.Value;
  dmVentas.ibstpProcInsVentaDetalle.Params[24].Value := dmventas.tblRegServicioDetDESCRIPCIONESPECIAL.Value;//rxVentaDescripcionEspecial.Value;//Item de Venta
  dmVentas.ibstpProcInsVentaDetalle.Params[25].Value := null;//rxVentaCostoProducto.Value;
  dmVentas.ibstpProcInsVentaDetalle.Params[26].Value := 0;//rxVentaPorcDescItem.Value;
  //t if (rxVentaMontoDescItem.Value > 0) then
  dmVentas.ibstpProcInsVentaDetalle.Params[27].Value := 0;//rxVentaMontoDescItem.Value
  //t else
  //t dmVentas.ibstpProcInsVentaDetalle.Params[27].Value := rxVentaMontoDesGlobal.Value;
  dmVentas.ibstpProcInsVentaDetalle.Params[28].Value := 0;//rxVentaMontoDescuento.Value;
  dmVentas.ibstpProcInsVentaDetalle.Params[29].Value := 6;//Temporal 18Porc rxVentaIDTasaITBIS.Value;
  dmVentas.ibstpProcInsVentaDetalle.Params[30].Value := 0;//rxVentaMontoItbisRecargo.Value;
  dmVentas.ibstpProcInsVentaDetalle.Params[31].Value := 1;//rxVentaMoneda.Value;
  dmVentas.ibstpProcInsVentaDetalle.Params[32].Value := 1;//Peso -// rxVentamonto_tasa.Value;

  dmVentas.ibstpProcInsVentaDetalle.ExecProc;
  if not dmVentas.ibstpProcInsVentaDetalle.Transaction.InTransaction then
  dmVentas.ibstpProcInsVentaDetalle.Transaction.StartTransaction;
  try
    dmVentas.ibstpProcInsVentaDetalle.Transaction.CommitRetaining;
  except
  dmVentas.ibstpProcInsVentaDetalle.Transaction.RollbackRetaining;
  end;
end;

procedure TfrmRegServicioTaller.ConsultarActivos1Click(Sender: TObject);
begin
  GetAnyDate1.FechaCierre := ExtraerFecha(GlbFechaTrnDiaria);
  if GetAnyDate1.Execute Then
  begin
    dmVentas.tblRegServicioMaster.Close;
    dmVentas.tblRegServicioMaster.Params[0].AsDateTime := ExtraerFecha(GetAnyDate1.Fecha);
    dmVentas.tblRegServicioMaster.Params[1].AsDateTime := ExtraerFecha(GetAnyDate1.FechaFinal);
    dmVentas.tblRegServicioMaster.Params[2].Value      := 'A';
    dmVentas.tblRegServicioMaster.Open;
  end;
end;

procedure TfrmRegServicioTaller.Listarservicios1Click(Sender: TObject);
begin
  //MessageDlg('En desarrollo',mtinformation,[mbok],0);
  frmListadoServTaller:= TfrmListadoServTaller.Create(Nil);
  try
    if frmListadoServTaller.ShowModal = mrOk then
    begin
      frmListadoServTaller.orderTipo:= 2;
      frmListadoServTaller.AbrirDatos;
      if dmReportes.qryRepServTallerM.RecordCount > 0 then
      begin
        qckListaServtXVendedor:=TqckListaServtXVendedor.Create(Nil);
        try
          qckListaServtXVendedor.qrLabelCriterioDatos.Caption:= labelCretrioRep;
          qckListaServtXVendedor.Preview;
        finally
        qckListaServtXVendedor.Free;
        qckListaServtXVendedor:=Nil;
        end;
      end else
      MessageDlg('No data con criterio seleccionado.', mtinformation,[mbok],0);
    end;
  finally
  frmListadoServTaller.Free;
  frmListadoServTaller:=Nil;
  end;
end;

procedure TfrmRegServicioTaller.PostearEnVentas;
var
  xserie : integer;
begin
  xserie := 0;
  if not Assigned(frmProcVentaRapida) then
  raise Exception.Create('Debe salir al menu principal y regresar.');
  dmCalculos.esFeedback := False;//autoriza ejecuta calculos
  frmProcVentaRapida.sumarDatos := false;
  frmProcVentaRapida.tablaPropietario.Close;
  frmProcVentaRapida.tablaPropietario.Open;
  frmProcVentaRapida.tablaPropietario.Insert;
  frmProcVentaRapida.tablaPropietarioCodigoPropietario.Value := dmventas.tblRegServicioMasterCODIGO_CTE.Value;
  frmProcVentaRapida.tablaPropietario.Post;
  dmVentas.tblRegServicioDet.First;
  While Not dmVentas.tblRegServicioDet.Eof Do
  begin
    //InsertarVentaDetalle; 
    Inc(xserie);
    frmProcVentaRapida.rxVenta.Append;
    frmProcVentaRapida.rxVentaTipoVenta.Value := 0;//Item venta;
    if (GlbcodVendedor > 0) then
    frmProcVentaRapida.rxVentaCodUsuario.Value:= GlbcodVendedor
    else
    frmProcVentaRapida.rxVentaCodUsuario.Value := VarUsuarioGlb;
    frmProcVentaRapida.rxVentaglbcodVendedor.Value := dmventas.tblRegServicioDetcod_usuario.Value;
    frmProcVentaRapida.rxVentaFecha.Value := ExtraerFecha(GlbFechaTrnDiaria);
    frmProcVentaRapida.rxVentaSerie.Value := xserie;
                                         
    frmProcVentaRapida.rxVentaCodArticulo.Value:=dmventas.tblRegServicioDetCOD_SERVICIO.Value;
    frmProcVentaRapida.rxVentaCodTexto.Value   :=dmventas.tblRegServicioDetCOD_SERVICIO.AsString;
    //dmVentas.ibstpProcInsVentaDetalle.params[2].Value:=null;
    frmProcVentaRapida.rxVentaDescripcion.Value :=dmventas.tblRegServicioDetDESCRIPCION.Value;
    frmProcVentaRapida.rxVentaCant.Value     := dmventas.tblRegServicioDetCANT.Value;
    frmProcVentaRapida.rxVentaPrecio.Value   := dmventas.tblRegServicioDetPRECIO.Value;
    frmProcVentaRapida.rxVentaporc_desc.Value:= dmventas.tblRegServicioDetPORC_DESC.Value;
    //dmVentas.ibstpProcInsVentaDetalle.params[7].Value:=dmventas.tblRegServicioDetVALOR_ITBIS.Value;

    //dmVentas.ibstpProcInsVentaDetalle.params[8].Value:=dmventas.tblRegServicioDetVALOR_SERVICIO.Value;
    //dmVentas.ibstpProcInsVentaDetalle.params[9].Value:=dmventas.tblRegServicioDetVALOR_SERVICIO.Value;
    //dmVentas.ibstpProcInsVentaDetalle.params[10].Value:=dmventas.tblRegServicioMasterNUMERO.Value;
    frmProcVentaRapida.rxVentaStatus.Value:='A';
    //dmVentas.ibstpProcInsVentaDetalle.params[12].Value:=Now;
    //dmVentas.ibstpProcInsVentaDetalle.params[13].Value:=strusername;
    //dmVentas.ibstpProcInsVentaDetalle.params[14].Value:=null;
    //dmVentas.ibstpProcInsVentaDetalle.params[15].Value:=null;
    //dmVentas.ibstpProcInsVentaDetalle.params[16].Value:=null;
    //dmVentas.ibstpProcInsVentaDetalle.params[17].Value:=null;
    //dmVentas.ibstpProcInsVentaDetalle.params[18].Value:=null;
    //dmVentas.ibstpProcInsVentaDetalle.params[19].Value:=null;
    //dmVentas.ibstpProcInsVentaDetalle.params[20].Value:=null;
    //dmVentas.ibstpProcInsVentaDetalle.params[21].Value:=null;
    //dmVentas.ibstpProcInsVentaDetalle.params[22].Value:=null;
    //dmVentas.ibstpProcInsVentaDetalle.params[23].Value:=null;
    //dmVentas.ibstpProcInsVentaDetalle.params[24].Value:=dmVentas.tblRegServicioMasterNOMBRE_CLIENTE.Value;
    frmProcVentaRapida.rxVentaDescripcionEspecial.Value := dmventas.tblRegServicioDetDESCRIPCIONESPECIAL.Value;//rxVentaDescripcionEspecial.Value;//Item de Venta
    //dmVentas.ibstpProcInsVentaDetalle.Params[25].Value := null;//rxVentaCostoProducto.Value;
    //dmVentas.ibstpProcInsVentaDetalle.Params[26].Value := 0;//rxVentaPorcDescItem.Value;
    //t if (rxVentaMontoDescItem.Value > 0) then
    //dmVentas.ibstpProcInsVentaDetalle.Params[27].Value := 0;//rxVentaMontoDescItem.Value
    //t else
    //t dmVentas.ibstpProcInsVentaDetalle.Params[27].Value := rxVentaMontoDesGlobal.Value;
    //dmVentas.ibstpProcInsVentaDetalle.Params[28].Value := 0;//rxVentaMontoDescuento.Value;
    //dmVentas.ibstpProcInsVentaDetalle.Params[29].Value := 6;//Temporal 18Porc rxVentaIDTasaITBIS.Value;
    //dmVentas.ibstpProcInsVentaDetalle.Params[30].Value := 0;//rxVentaMontoItbisRecargo.Value;
    frmProcVentaRapida.rxVentaMoneda.Value := '1';//rxVentaMoneda.Value;
    frmProcVentaRapida.rxVentamonto_tasa.Value:= 1;
    //dmVentas.ibstpProcInsVentaDetalle.Params[32].Value := 1;//Peso -// rxVentamonto_tasa.Value;

    if (dmVentas.dstblRegServicioDet.DataSet.Bof) and (frmProcVentaRapida.rxVenta.RecordCount > 0) then
    begin
      dmCalculos.esFeedback := false;
      frmProcVentaRapida.sumarDatos := true;
    end;

    if frmProcVentaRapida.rxVenta.state in [dsedit, dsInsert] then
    frmProcVentaRapida.rxVenta.Post;
    frmProcVentaRapida.DBEdit1Exit(Self);

    dmVentas.tblRegServicioDet.Next;
  end;
  frmProcVentaRapida.NumTrnServ := dmVentas.tblRegServicioMasterNUMERO.Value;
  frmProcVentaRapida.Show;
  //frmProcVentaRapida.BringToFront;
end;

procedure TfrmRegServicioTaller.BitBtn15Click(Sender: TObject);
var
  guardarRec : TBookMark;
begin
  guardarRec:= dmVentas.tblRegServicioMaster.GetBookmark;
  if (dmVentas.tblRegServicioMasterSTATUS.Value = 'A') then
  begin
    PostearEnVentas;
    //Se hace en el Stored Procedure the ventas_mast
    //if (not frmProcVentaRapida.AbortarPostServTaller) then
    //begin
    //dmVentas.tblRegServicioMaster.Edit;
    //dmVentas.tblRegServicioMasterFECHA_SALIDA.Value := ExtraerFecha(GlbFechaTrnDiaria);
    //dmVentas.tblRegServicioMasterSTATUS.Value:= 'R';
    //GuardarMaster;
    //end;
  end else
  begin
    MessageDlg('Verifique que la transaccón no esté cerrada o cancelada.', mtInformation ,[mbok], 0);
    exit;
  end;

  dmVentas.tblRegServicioMaster.GotoBookmark(guardarRec);
  dmVentas.tblRegServicioMaster.FreeBookmark(guardarRec);
  if Assigned(frmProcVentaRapida) then
  begin
    frmProcVentaRapida.SumarDatos := True;
    dmCalculos.esFeedback := True;
    frmProcVentaRapida.BitBtn27Click(Self);
  end;
end;

procedure TfrmRegServicioTaller.BitBtn16Click(Sender: TObject);
var
  xcodServicio : Integer;
begin
  if dmVentas.tblRegServicioMaster.RecordCount = 0 then exit;
  if dmVentas.tblRegServicioDet.State in [dsInsert, dsEdit] then
  exit;
  xcodServicio:=-1;
  frmConsultaInventario:=TfrmConsultaInventario.Create(Nil);
  try
    if frmConsultaInventario.Showmodal = mrOk then
    xcodServicio := frmConsultaInventario.ibquery1codigo.Value;

  //if (Length(edtcodigo.Text) > 0) then
  //edtcodigo.SetFocus;

  if dmVentas.tblRegServicioDet.State = dsBrowse then
  begin
    GuardarMaster;
    if xcodServicio > 0 then
    begin
      //if (RxCheckListBox1.Checked[i] = true) then
      //begin
        //xcodServicio := GetCodigoServicio(rxCheckListBox1.Items.Strings[i]);
        //if dmVentas.tblRegServicioDet.Locate('COD_SERVICIO', xcodServicio,[]) then
        //continue;
        dmVentas.tblRegServicioDet.Append;
        dmVentas.tblRegServicioDetCANT.Value:=1;
        dmVentas.tblRegServicioDetCOD_SERVICIO.Value:= xcodServicio;
        dmVentas.tblRegServicioDetDESCRIPCION.Value := frmConsultaInventario.ibquery1descripcion.Value;
        dmVentas.tblRegServicioDetPRECIO.Value := frmConsultaInventario.ibquery1Precio.Value;
        dmVentas.tblRegServicioDetVALOR_SERVICIO.Value:= dmVentas.tblRegServicioDetCANT.Value *
        dmVentas.tblRegServicioDetPRECIO.Value;

        dmVentas.tblRegServicioDetNUMERO.Value      := dmVentas.tblRegServicioMasterNUMERO.Value;
        dmVentas.tblRegServicioDetSTATUS.Value      := 'A';
        dmVentas.tblRegServicioDetFECHA.Value       := ExtraerFecha(GlbFechaTrnDiaria);
        dmVentas.tblRegServicioDetCOD_USUARIO.Value := VarUsuarioGlb;
        dmVentas.tblRegServicioDetIN_POR.Value      := strUserName;
        dmVentas.tblRegServicioDetFECHA_IN.Value    := Now;
        dmVentas.tblRegServicioDetPORC_ITBIS.Value  := 0;
        dmVentas.tblRegServicioDetVALOR_ITBIS.Value := 0;
        GuardarDetalle;
      //end;
    end;
    ProcSumarValor;
    dmVentas.tblRegServicioDet.Last;
    //BitBtn14.Enabled := False;
    DBEdit4.SetFocus;
    //BitBtn8.SetFocus;
  end else
  if dmVentas.tblRegServicioDet.State = dsInsert then
  begin
    dmVentas.tblRegServicioDetCANT.Value:=1;
    dmVentas.tblRegServicioDetCOD_SERVICIO.Value:= xcodServicio;
    dmVentas.tblRegServicioDetDESCRIPCION.Value := frmConsultaInventario.ibquery1descripcion.Value;
    dmVentas.tblRegServicioDetPRECIO.Value := frmConsultaInventario.ibquery1Precio.Value;
    dmVentas.tblRegServicioDetVALOR_SERVICIO.Value:= dmVentas.tblRegServicioDetCANT.Value *
    dmVentas.tblRegServicioDetPRECIO.Value;

    dmVentas.tblRegServicioDetNUMERO.Value      := dmVentas.tblRegServicioMasterNUMERO.Value;
    dmVentas.tblRegServicioDetSTATUS.Value      := 'A';
    dmVentas.tblRegServicioDetFECHA.Value       := ExtraerFecha(GlbFechaTrnDiaria);
    dmVentas.tblRegServicioDetCOD_USUARIO.Value := VarUsuarioGlb;
    dmVentas.tblRegServicioDetIN_POR.Value      := strUserName;
    dmVentas.tblRegServicioDetFECHA_IN.Value    := Now;
    dmVentas.tblRegServicioDetPORC_ITBIS.Value  := 0;
    dmVentas.tblRegServicioDetVALOR_ITBIS.Value := 0;
    GuardarDetalle;    
    ProcSumarValor;
    dmVentas.tblRegServicioDet.Last;
  end;
  finally
  frmConsultaInventario.Free;
  frmConsultaInventario:=Nil;
  end;  
end;

procedure TfrmRegServicioTaller.SpeedButton1Click(Sender: TObject);
begin
FrmBuscarClientesPersonas:=TFrmBuscarClientesPersonas.Create(nil);
  try
    FrmBuscarClientesPersonas.CodigoCliente := -1;
    if FrmBuscarClientesPersonas.Showmodal = mrOk then
    begin
      if dmVentas.tblRegServicioMaster.State In [dsBrowse] then
      dmVentas.tblRegServicioMaster.Edit;
      dmVentas.tblRegServicioMasterCODIGO_CTE.Value := FrmBuscarClientesPersonas.CodigoCliente;
      dmVentas.tblRegServicioMasterNOMBRE_CLIENTE.Value:= FrmBuscarClientesPersonas.nombrecliente;
    end;
  finally
  FrmBuscarClientesPersonas.Free;
  FrmBuscarClientesPersonas:=Nil;
  end;
end;

procedure TfrmRegServicioTaller.DBEdit9Exit(Sender: TObject);
begin
  if dmventas.qryClientes.State = dsInactive then
  dmventas.qryClientes.Open;
  if dmVentas.tblRegServicioMaster.State in [dsEdit, dsInsert] then
  begin
    if dmventas.qryClientes.Locate('CODIGO_CTE',dmVentas.tblRegServicioMasterCODIGO_CTE.Value,[]) then
    begin
      if Length(dmventas.qryClientesNOMBRE_FACTURAR.Value) > 0 then
      dmVentas.tblRegServicioMasterNOMBRE_CLIENTE.Value :=
      dmventas.qryClientesNOMBRE_Facturar.Value
      else
      dmVentas.tblRegServicioMasterNOMBRE_CLIENTE.Value :=
      dmventas.qryClientesNOMBRE_CTE.Value;
    end;
  end;
end;

procedure TfrmRegServicioTaller.BitBtn17Click(Sender: TObject);
var
  codcte : integer;
begin
  frmClientes:=TfrmClientes.Create(Nil);
  try
    dmUsuarios.qryRoles.Close;
    dmUsuarios.qryRoles.Params[0].Value:= VarUsuarioGlb;
    dmUsuarios.qryRoles.Open;
    dmUsuarios.qryRoles.First;
    While Not dmUsuarios.qryRoles.Eof Do
    begin
      ActivaPermiso(TForm(frmClientes), 1000, dmUsuarios.qryRolesID_ROL.Value, 0);//menu principal: 1000 debe estar en la tabla PROCESOS
      dmUsuarios.qryRoles.Next;
    end;
    frmClientes.Showmodal;
    codcte := dmClientes.tblClientesCODIGO_CTE.Value;
  finally
  frmClientes.Free;
  frmClientes:=Nil;
  end;
  if dmVentas.tblRegServicioMaster.State in [dsEdit, dsInsert] then
  begin
     dmVentas.tblRegServicioMasterCODIGO_CTE.Value :=  codcte;
     DBEdit9Exit(Self);
  end;
  dmventas.qryClientes.Close;
  dmventas.qryClientes.Open;
  DBEdit9Exit(Self);
end;

procedure TfrmRegServicioTaller.EliminarRecordDet1Click(Sender: TObject);
begin
if dmVentas.tblRegServicioDet.State = dsBrowse then
  begin
    if MessageDlg('Eliminar Detalle?', mtInformation, [mbYes, mbNo],0)= mrYes then
    begin
      if (dmVentas.tblRegServicioMasterSTATUS.Value = 'R') then
      begin
        MessageDlg('Transacción no puede ser eliminada, verifique.', mtInformation, [mbYes, mbNo],0);
        exit;
      end;
      dmVentas.tblRegServicioDet.Delete;
      dmVentas.tblRegServicioDet.ApplyUpdates;
      if not dmVentas.tblRegServicioDet.Transaction.InTransaction then
      dmVentas.tblRegServicioDet.Transaction.StartTransaction;
      try
        dmVentas.tblRegServicioDet.Transaction.CommitRetaining;
      except
      dmVentas.tblRegServicioDet.Transaction.RollbackRetaining;
      end;
    end;
  end;
end;

procedure TfrmRegServicioTaller.DBEdit8Exit(Sender: TObject);
begin
  DBEdit4Change(Self);
end;

procedure TfrmRegServicioTaller.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if dmVentas.tblRegServicioMaster.State In [dsEdit, dsInsert] then
  begin
    canClose:=False;
    MessageDlg('Hay una transacción en curso, verifique.',mtInformation,[mbok],0);
  end else
  begin
    canClose:=True;
    if Assigned(frmProcVentaRapida) then
    try
      frmProcVentaRapida.BringToFront;
      frmProcVentaRapida.Show;
    except
    end;
  end;
end;

end.
