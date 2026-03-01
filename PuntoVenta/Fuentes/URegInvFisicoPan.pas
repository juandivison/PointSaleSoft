unit URegInvFisicoPan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  db, Dialogs, RxLookup, StdCtrls, Mask, DBCtrls, EditNew, Grids, DBGrids,
  RXDBCtrl, Buttons, RXCtrls, WinSkinData, IBCustomDataSet, IBStoredProc,
  ExtCtrls;

type
  TfrmRegInvFisicoPan = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    RxDBLookupCombo1: TRxDBLookupCombo;
    edtCodigo: TEditN;
    Label6: TLabel;
    Label5: TLabel;
    RxDBGrid1: TRxDBGrid;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton1: TSpeedButton;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    DBStatusLabel1: TDBStatusLabel;
    SkinData1: TSkinData;
    ibStpActualizaInvProd: TIBStoredProc;
    SpeedButtonPInv: TSpeedButton;
    Panel1: TPanel;
    RxDBGrid2: TRxDBGrid;
    SpeedButton4: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure edtCodigoChange(Sender: TObject);
    procedure edtCodigoExit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure SpeedButtonPInvClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure RxDBGrid2DblClick(Sender: TObject);
    procedure RxDBGrid2KeyPress(Sender: TObject; var Key: Char);
    procedure RxDBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RxDBGrid2Exit(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure DBEdit2Enter(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
  private
    { Private declarations }
    procedure ProcActualizaInventario;
    function verificastatus:Boolean;
  public
    { Public declarations }
  end;

var
  frmRegInvFisicoPan: TfrmRegInvFisicoPan;
  noExiste : Boolean;
  CodProd : Integer = -1;
implementation

uses UDatModInventario, UGlobal, UFormSelFecha, UDatModReportes,
  UDatModCompania, URepInvFisicoPan;

{$R *.dfm}

procedure TfrmRegInvFisicoPan.FormCreate(Sender: TObject);
begin
  panel1.Visible:=False;
  panel1.SendToBack;
  dminventario.qryInvLookup.Close;
  dminventario.qryInvLookup.Open;
  frmSelFecha:=TfrmSelFecha.Create(Nil);
  try
    if frmSelFecha.ShowModal = mrOk then
    begin
      dmInventario.tblTranInvFisicoPan.Close;
      dmInventario.tblTranInvFisicoPan.params[0].Value:=ExtraerFecha(frmSelFecha.FechaIni.Date);
      dmInventario.tblTranInvFisicoPan.params[0].Value:=ExtraerFecha(frmSelFecha.FechaFin.Date);
      dmInventario.tblTranInvFisicoPan.Open;
    end;
  finally
  frmSelFecha.Free;
  frmSelFecha:=Nil;
  end;  
end;

procedure TfrmRegInvFisicoPan.edtCodigoChange(Sender: TObject);
begin
  noExiste:=False;
  if edtCodigo.Text = '' then exit;
  CodProd:= -1;
  if IsNumerico(edtCodigo.Text) then
  begin
    if dmInventario.qryInvLookup.Locate('Codigo', StrToInt(edtCodigo.Text), [loCaseInsensitive, loPartialKey]) then
    begin
      panel1.Visible:=True;
      panel1.BringToFront;
      Label5.Caption:= dmInventario.qryInvLookupDESCRIPCION.Value;
      CodProd:=dmInventario.qryInvLookupCODIGO.Value;
    end else
    begin
      panel1.Visible:=False;
      panel1.SendToBack;
      noExiste:= True;
      Label5.Caption:='';
    end;
  end else
  begin
    if dmInventario.qryInvLookup.Locate('Descripcion', edtCodigo.Text, [loCaseInsensitive, loPartialKey]) then
    begin
      panel1.Visible:=True;
      panel1.BringToFront;    
      Label5.Caption:= dmInventario.qryInvLookupDESCRIPCION.Value;
      CodProd:=dmInventario.qryInvLookupCODIGO.Value;
    end else
    begin
      panel1.Visible:=False;
      panel1.SendToBack;
      noExiste:= True;
      Label5.Caption:='';
    end;
  end;
end;

procedure TfrmRegInvFisicoPan.edtCodigoExit(Sender: TObject);
begin
  if (Length(edtcodigo.Text) > 0) And ( noExiste) then
  begin
    MessageDlg('Código producto no encontrado, verifique.', mtInformation, [mbOK], 0);
    edtCodigo.SetFocus;
    Exit;
  end;
  if (dmInventario.tblTranInvFisicoPan.State in [dsInsert]) And (CodProd > 0) then
  dmInventario.tblTranInvFisicoPanCODIGO_PROD.Value := CodProd;

end;

procedure TfrmRegInvFisicoPan.SpeedButton1Click(Sender: TObject);
begin
  if dmInventario.tblTranInvFisicoPan.State In [dsInsert, dsEdit] then
  begin
    if dmInventario.tblTranInvFisicoPanCODIGO_PROD.IsNull then
    begin
      MessageDlg('Debe indicar codigo producto', mtError, [mbok], 0);
      Exit;
    end;
    dmInventario.tblTranInvFisicoPan.Post;
    dmInventario.tblTranInvFisicoPan.ApplyUpdates;
    if not dmInventario.tblTranInvFisicoPan.Transaction.InTransaction then
    dmInventario.tblTranInvFisicoPan.Transaction.StartTransaction;
    try
      dmInventario.tblTranInvFisicoPan.Transaction.CommitRetaining;
    except
    dmInventario.tblTranInvFisicoPan.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmRegInvFisicoPan.SpeedButton2Click(Sender: TObject);
begin
  if dmInventario.tblTranInvFisicoPan.State = dsBrowse then
  begin
    dmInventario.tblTranInvFisicoPan.Insert;
    dmInventario.tblTranInvFisicoPanFECHA.Value:=ExtraerFecha(GlbFechaTrnDiaria);
    dmInventario.tblTranInvFisicoPanFECHA_IN.Value:= Now;
    dmInventario.tblTranInvFisicoPanIN_POR.Value := StruserName;
    dmInventario.tblTranInvFisicoPanCOD_EMPLEADO.Value:= VarUsuarioGlb;
    dmInventario.tblTranInvFisicoPanSTATUS.Value:='A';
    edtCodigo.SetFocus;
  end;
end;

procedure TfrmRegInvFisicoPan.SpeedButton3Click(Sender: TObject);
begin
  if dmInventario.tblTranInvFisicoPan.State in [dsinsert, dsEdit] then
  begin
    dmInventario.tblTranInvFisicoPan.Cancel;
  end;
end;

procedure TfrmRegInvFisicoPan.SpeedButton7Click(Sender: TObject);
begin
  frmSelFecha:=TfrmSelFecha.Create(Nil);
  try
    if frmSelFecha.ShowModal = mrOk then
    begin
      dmInventario.tblTranInvFisicoPan.Close;
      dmInventario.tblTranInvFisicoPan.params[0].Value:=ExtraerFecha(frmSelFecha.FechaIni.Date);
      dmInventario.tblTranInvFisicoPan.params[0].Value:=ExtraerFecha(frmSelFecha.FechaFin.Date);
      dmInventario.tblTranInvFisicoPan.Open;
    end;
  finally
  frmSelFecha.Free;
  frmSelFecha:=Nil;
  end;
end;

procedure TfrmRegInvFisicoPan.SpeedButton8Click(Sender: TObject);
begin
  if dmInventario.tblTranInvFisicoPan.State In [dsBrowse] then
  begin
    if (dmInventario.tblTranInvFisicoPanSTATUS.Value ='A') then
    begin
      if MessageDlg('Eliminar record?',mtWarning,[mbyes,mbno],0)=mryes then
      begin
        dmInventario.tblTranInvFisicoPan.Delete;
        dmInventario.tblTranInvFisicoPan.ApplyUpdates;
        if not dmInventario.tblTranInvFisicoPan.Transaction.InTransaction then
        dmInventario.tblTranInvFisicoPan.Transaction.StartTransaction;
        try
          dmInventario.tblTranInvFisicoPan.Transaction.CommitRetaining;
        except
        dmInventario.tblTranInvFisicoPan.Transaction.RollbackRetaining;
        end;
      end;
    end;
  end;
end;

procedure TfrmRegInvFisicoPan.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if (dmInventario.tblTranInvFisicoPanSTATUS.Value = 'R') then
  BackGround := clGreen;
end;

procedure TfrmRegInvFisicoPan.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 113) then
     SpeedButton2Click(Self);
  if (key = 116) then
          
end;

procedure TfrmRegInvFisicoPan.BitBtn9Click(Sender: TObject);
begin
  dmInventario.tblTranInvFisicoPan.First;
end;

procedure TfrmRegInvFisicoPan.BitBtn10Click(Sender: TObject);
begin
  dmInventario.tblTranInvFisicoPan.Prior;
end;

procedure TfrmRegInvFisicoPan.BitBtn11Click(Sender: TObject);
begin
  dmInventario.tblTranInvFisicoPan.Next;
end;

procedure TfrmRegInvFisicoPan.BitBtn12Click(Sender: TObject);
begin
  dmInventario.tblTranInvFisicoPan.Last;
end;

procedure TfrmRegInvFisicoPan.ProcActualizaInventario;
begin
  if (dmInventario.tblTranInvFisicoPanSTATUS.Value ='R') then exit;
  ibStpActualizaInvProd.Params[0].Value:= dmInventario.tblTranInvFisicoPanCODIGO_PROD.Value;
  ibStpActualizaInvProd.Params[1].Value:= dmInventario.tblTranInvFisicoPanCant.Value;
  ibStpActualizaInvProd.Params[2].Value:= 1;//tipoTrn
  ibStpActualizaInvProd.Params[3].Value:= 1;//porCodigo
  ibStpActualizaInvProd.Params[4].Value:= dmInventario.tblTranInvFisicoPanPRECIO_COMPRA.Value;//porCodigo  
  ibStpActualizaInvProd.ExecProc;
  if Not ibStpActualizaInvProd.Transaction.InTransaction then
  ibStpActualizaInvProd.Transaction.StartTransaction;
  try
    ibStpActualizaInvProd.Transaction.CommitRetaining;
  except
  ibStpActualizaInvProd.Transaction.RollbackRetaining;
  end;
end;

procedure TfrmRegInvFisicoPan.SpeedButtonPInvClick(Sender: TObject);
begin
  dmInventario.tblTranInvFisicoPan.First;
  While Not dmInventario.tblTranInvFisicoPan.eof do
  begin
    ProcActualizaInventario;
    dmInventario.tblTranInvFisicoPan.Edit;
    dmInventario.tblTranInvFisicoPanSTATUS.Value:='R';
    SpeedButton1Click(Self);
    dmInventario.tblTranInvFisicoPan.Next;
  end;
end;

Function TfrmRegInvFisicoPan.verificastatus:Boolean;
begin
  result:=True;
  While Not dmInventario.tblTranInvFisicoPan.eof do
  begin
    if dmInventario.tblTranInvFisicoPanSTATUS.Value = 'A' then
    begin
      MessageDlg('Hay transaccion/nes sin inventariar, favor verificar.',mtError,[mbok],0);
      result:=False;
      Break;
    end;
    dmInventario.tblTranInvFisicoPan.Next;
  end;
end;

procedure TfrmRegInvFisicoPan.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if verificastatus then
  CanClose:=True else
  canclose:=False;
end;

procedure TfrmRegInvFisicoPan.RxDBGrid2DblClick(Sender: TObject);
begin
  edtCodigo.Text := dmInventario.qryInvLookupCODIGO.AsString;
  CodProd:=dmInventario.qryInvLookupCODIGO.Value;
  panel1.Visible := False;
  panel1.SendToBack;
  edtCodigo.SetFocus;
end;

procedure TfrmRegInvFisicoPan.RxDBGrid2KeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = '#13' then
  RxDBGrid2DblClick(Self);
end;

procedure TfrmRegInvFisicoPan.RxDBGrid2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = 13 then
  RxDBGrid2DblClick(Self);
end;

procedure TfrmRegInvFisicoPan.RxDBGrid2Exit(Sender: TObject);
begin
  CodProd:=dmInventario.qryInvLookupCODIGO.Value;
  if (dmInventario.tblTranInvFisicoPan.State in [dsInsert]) And (CodProd > 0) then
  dmInventario.tblTranInvFisicoPanCODIGO_PROD.Value := CodProd;
end;

procedure TfrmRegInvFisicoPan.DBEdit1Exit(Sender: TObject);
begin
  panel1.Visible := False;
  panel1.SendToBack;
end;

procedure TfrmRegInvFisicoPan.DBEdit2Enter(Sender: TObject);
begin
  panel1.Visible := False;
  panel1.SendToBack;
end;

procedure TfrmRegInvFisicoPan.SpeedButton4Click(Sender: TObject);
begin
  dmCompania.tblCompania.Close;
  dmCompania.tblCompania.Open;
  dmCompania.tblCompania.Locate('CODIGO', GlbCodigoCia,[]);
  frmSelFecha:=TfrmSelFecha.Create(Nil);
  try
    if frmSelFecha.ShowModal = mrOk then
    begin
      dmReportes.qryRepInvFisicoPan.Close;
      dmReportes.qryRepInvFisicoPan.Params[0].Value := ExtraerFecha(frmSelFecha.FechaIni.Date);
      dmReportes.qryRepInvFisicoPan.Params[1].Value := ExtraerFecha(frmSelFecha.FechaFin.Date);
      dmReportes.qryRepInvFisicoPan.Open;
      qckRepInvFisicoPan:=TqckRepInvFisicoPan.Create(Nil);
      try
        qckRepInvFisicoPan.Preview;
      finally
      qckRepInvFisicoPan.Free;
      qckRepInvFisicoPan:=Nil;
      end;
    end;
  finally
  frmSelFecha.Free;
  frmSelFecha:=Nil;
  end;
end;

end.
