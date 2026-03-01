unit UFormRegServicio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, DB, rxToolEdit, RXDBCtrl, Mask, Grids, DBGrids,
  Buttons, RXCtrls, WinSkinData, ComCtrls, RxLookup, RxMemDS, ExtCtrls,
  Menus, GetAnyDate;

type
  TfrmRegServicioLavanderia = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    SkinData1: TSkinData;
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
  private
    { Private declarations }
    procedure ProcSumarValor;
    procedure GuardarMaster;
    procedure GuardarDetalle;
    function GetCodigoServicio(strvalor:string):Integer;
    procedure procUnchecked;
    procedure InsertarVentaMast;
    procedure InsertarVentaDetalle;
  public
    { Public declarations }
  end;

var
  frmRegServicioLavanderia: TfrmRegServicioLavanderia;

implementation

uses UDatosVentas, UDatModPrestamo, UDatmodDatosGenerales, UGlobal,
  UDatModCompania, UqckRepComprobanteLav;

{$R *.dfm}

procedure TfrmRegServicioLavanderia.BitBtn1Click(Sender: TObject);
begin
  if dmVentas.tblRegServicioDet.State = dsBrowse then
  begin
    dmVentas.tblRegServicioDet.Insert;
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

procedure TfrmRegServicioLavanderia.BitBtn2Click(Sender: TObject);
begin
  if dmVentas.tblRegServicioDet.State = dsBrowse then
  dmVentas.tblRegServicioDet.Edit;
end;

procedure TfrmRegServicioLavanderia.BitBtn3Click(Sender: TObject);
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

procedure TfrmregServicioLavanderia.GuardarMaster;
begin
if dmVentas.tblRegServicioMaster.State in [dsEdit, dsInsert] then
  begin
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
procedure TfrmRegServicioLavanderia.BitBtn4Click(Sender: TObject);
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

procedure TfrmRegServicioLavanderia.BitBtn5Click(Sender: TObject);
begin
  if dmVentas.tblRegServicioMaster.State in [dsInactive, dsBrowse] then
  begin
    dmVentas.tblRegServicioMaster.Close;
    dmVentas.tblRegServicioMaster.Open;
  end;
end;



procedure TfrmRegServicioLavanderia.BitBtn7Click(Sender: TObject);
begin
  dmVentas.tblRegServicioMaster.Insert;
  dmVentas.tblRegServicioMasterFECHA_ENTRADA.Value:=ExtraerFecha(GlbFechaTrnDiaria);
  dmVentas.tblRegServicioMasterFECHA_SALIDA.Value :=ExtraerFecha(GlbFechaTrnDiaria) + 1;
  dmVentas.tblRegServicioMasterSTATUS.Value := 'A';
  BitBtn14.Enabled := True;
  DBEdit1.SetFocus;
end;

procedure TfrmRegServicioLavanderia.FormCreate(Sender: TObject);
begin
  dmVentas.tblRegServicioMaster.Close;
  dmVentas.tblRegServicioMaster.Params[0].AsDateTime :=ExtraerFecha(GlbFechaTrnDiaria)-30;
  dmVentas.tblRegServicioMaster.Params[1].AsDateTime :=ExtraerFecha(GlbFechaTrnDiaria)+5;
  dmVentas.tblRegServicioMaster.Params[2].Value:='A';
  dmVentas.tblRegServicioMaster.Open;

  dmVentas.qryInventarioLavanderia.Close;
  dmVentas.qryInventarioLavanderia.Open;

  dmVentas.qryInventarioLavanderia.First;
  RxCheckListBox1.Clear;
  While Not dmVentas.qryInventarioLavanderia.Eof do
  begin
    RxCheckListBox1.Items.Add(dmVentas.qryInventarioLavanderiaDESCRIPCION.Value);
    dmVentas.qryInventarioLavanderia.Next;
  end;
end;

procedure TfrmRegServicioLavanderia.ProcSumarValor;
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

procedure TfrmRegServicioLavanderia.BitBtn8Click(Sender: TObject);
var
  flag : Boolean;
begin
  if (Length(Edit1.Text) = 0) AND (dmVentas.tblRegServicioMasterSTATUS.Value = 'A') then
  begin
    MessageDlg('Favor indicar monto recibido.', mtWarning, [mbOk], 0);
    Edit1.SetFocus;
    Exit;
  end;
  
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
  qckRepComprobanteLav:=TqckRepComprobanteLav.Create(Nil);
  try
  qckRepComprobanteLav.Prepare;
  repeat
    begin
      if (qckRepComprobanteLav.PageNumber > 1) then
      begin
        qckRepComprobanteLav.Page.Length:=qckRepComprobanteLav.Page.Length + 0.25;
        qckRepComprobanteLav.Prepare;
        flag:=False;
      end else break;
    end;
  until flag = true;

  qckRepComprobanteLav.Preview;
  finally
  qckRepComprobanteLav.free;
  qckRepComprobanteLav:=nil;
  end;
  if (dmVentas.tblRegServicioMasterSTATUS.Value = 'A') then
  begin
    dmVentas.tblRegServicioMaster.Edit;
    dmVentas.tblRegServicioMasterSTATUS.Value:= 'R';
    GuardarMaster;
    InsertarVentaMast;
    dmVentas.tblRegServicioDet.First;
    While Not dmVentas.tblRegServicioDet.Eof Do
    begin
      InsertarVentaDetalle;
      dmVentas.tblRegServicioDet.Next;
    end;
  end;

  dmVentas.tblRegServicioMaster.Close;
  dmVentas.tblRegServicioMaster.Open;
  dmVentas.tblRegServicioDet.Close;
  dmVentas.tblRegServicioDet.Params[0].Value:=null;
  dmVentas.tblRegServicioDet.Open;
  Edit1.Text:='';
  procUnchecked;
end;

procedure TfrmRegServicioLavanderia.procUnchecked;
var
 x : integer;
begin
 For x:=0 To RxCheckListBox1.Items.Count-1 Do
 RxCheckListBox1.Checked[x] := false;
end;

procedure TfrmRegServicioLavanderia.BitBtn9Click(Sender: TObject);
begin
  dmVentas.tblRegServicioMaster.First;
end;

procedure TfrmRegServicioLavanderia.BitBtn10Click(Sender: TObject);
begin
  dmVentas.tblRegServicioMaster.Prior;
end;

procedure TfrmRegServicioLavanderia.BitBtn11Click(Sender: TObject);
begin
  dmVentas.tblRegServicioMaster.Next;
end;

procedure TfrmRegServicioLavanderia.BitBtn12Click(Sender: TObject);
begin
  dmVentas.tblRegServicioMaster.Last;
end;

function TfrmRegServicioLavanderia.GetCodigoServicio(strvalor:string):Integer;
begin
  if dmVentas.qryInventarioLavanderia.Locate('DESCRIPCION',strvalor,[]) then
  result := dmVentas.qryInventarioLavanderiaCODIGO.Value
  else result :=0;
end;

procedure TfrmRegServicioLavanderia.GuardarDetalle;
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

procedure TfrmRegServicioLavanderia.BitBtn14Click(Sender: TObject);
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
  if dmVentas.tblRegServicioMaster.RecordSize = 0 then exit;

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
        dmVentas.tblRegServicioDetPRECIO.Value := dmventas.qryInventarioLavanderiaPRECIO.Value;
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
  end;
end;

procedure TfrmRegServicioLavanderia.BitBtn13Click(Sender: TObject);
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
        dmVentas.tblRegServicioDetPRECIO.Value := dmventas.qryInventarioLavanderiaPRECIO.Value;
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

procedure TfrmRegServicioLavanderia.bblClick(Sender: TObject);
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

procedure TfrmRegServicioLavanderia.RxCheckListBox1Click(Sender: TObject);
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

procedure TfrmRegServicioLavanderia.DBEdit4Change(Sender: TObject);
begin
  if dmVentas.tblRegServicioDet.State In [dsEdit, dsInsert] Then
  dmVentas.tblRegServicioDetVALOR_SERVICIO.Value:=
  dmVentas.tblRegServicioDetPRECIO.Value * dmVentas.tblRegServicioDetCANT.Value;
end;

procedure TfrmRegServicioLavanderia.Salir1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmRegServicioLavanderia.Consultar1Click(Sender: TObject);
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

procedure TfrmRegServicioLavanderia.Edit1Exit(Sender: TObject);
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

procedure TfrmRegServicioLavanderia.InsertarVentaMast;
begin
  //dmVentas.ibstpProcInsVentaMast.params[0].Value
  dmVentas.ibstpProcInsVentaMast.params[1].Value:=dmVentas.tblRegServicioMasterFECHA_ENTRADA.Value;
  dmVentas.ibstpProcInsVentaMast.params[2].Value:=glbCia_Key;
  dmVentas.ibstpProcInsVentaMast.params[3].Value:=0;
  dmVentas.ibstpProcInsVentaMast.params[4].Value:=VarUsuarioGlb;
  dmVentas.ibstpProcInsVentaMast.params[5].Value:=1;
  dmVentas.ibstpProcInsVentaMast.params[6].Value:='Servicio Lavanderia';
  dmVentas.ibstpProcInsVentaMast.params[7].Value:='1';
  dmVentas.ibstpProcInsVentaMast.params[8].Value:=dmVentas.tblRegServicioMasterMONTO_TOTAL.Value;
  dmVentas.ibstpProcInsVentaMast.params[9].Value:='A';
  dmVentas.ibstpProcInsVentaMast.params[10].Value:=now;
  dmVentas.ibstpProcInsVentaMast.params[11].Value:=strusername;
  dmVentas.ibstpProcInsVentaMast.params[12].Value:=null;
  dmVentas.ibstpProcInsVentaMast.params[13].Value:=null;
  dmVentas.ibstpProcInsVentaMast.params[14].Value:=dmVentas.tblRegServicioMasterNUMERO.Value;
  dmVentas.ibstpProcInsVentaMast.params[15].Value:=dmVentas.tblRegServicioMasterNUMERO.AsString;
  dmVentas.ibstpProcInsVentaMast.params[16].Value:=null;
  dmVentas.ibstpProcInsVentaMast.params[17].Value:=dmVentas.tblRegServicioMasterMONTO_TOTAL.Value;
  dmVentas.ibstpProcInsVentaMast.params[18].Value:=0;
  dmVentas.ibstpProcInsVentaMast.params[19].Value:=0;
  dmVentas.ibstpProcInsVentaMast.params[20].Value:=dmVentas.tblRegServicioMasterMONTO_RECIBIDO.Value;
  dmVentas.ibstpProcInsVentaMast.params[21].Value:=dmVentas.tblRegServicioMasterMONTO_DEVUELTO.Value;
  dmVentas.ibstpProcInsVentaMast.params[22].Value:=0;
  dmVentas.ibstpProcInsVentaMast.params[23].Value:=0;
  dmVentas.ibstpProcInsVentaMast.params[24].Value:=dmVentas.tblRegServicioMasterNOMBRE_CLIENTE.Value;
  dmVentas.ibstpProcInsVentaMast.ExecProc;
  if not dmVentas.ibstpProcInsVentaMast.Transaction.InTransaction then
  dmVentas.ibstpProcInsVentaMast.Transaction.StartTransaction;
  try
    dmVentas.ibstpProcInsVentaMast.Transaction.CommitRetaining;
  except
  dmVentas.ibstpProcInsVentaMast.Transaction.RollbackRetaining;
  end;
end;

procedure TfrmRegServicioLavanderia.InsertarVentaDetalle;
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
  dmVentas.ibstpProcInsVentaDetalle.ExecProc;
  if not dmVentas.ibstpProcInsVentaDetalle.Transaction.InTransaction then
  dmVentas.ibstpProcInsVentaDetalle.Transaction.StartTransaction;
  try
    dmVentas.ibstpProcInsVentaDetalle.Transaction.CommitRetaining;
  except
  dmVentas.ibstpProcInsVentaDetalle.Transaction.RollbackRetaining;
  end;
end;

end.
