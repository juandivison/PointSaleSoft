unit UFormMantBlcCteCxp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, RxDBComb, Grids, DBGrids, DBCtrls,
  Mask, rxToolEdit, RXDBCtrl, RXCtrls, ComCtrls, DB, RxLookup, WinSkinData;

type
  TfrmActBlcCteCxp = class(TForm)
    Panel2: TPanel;
    btnSalvar: TBitBtn;
    btnCerarAbrirres: TBitBtn;
    btnModificar: TBitBtn;
    btnCancelar: TBitBtn;
    btnInsertar: TBitBtn;
    BitBtn3: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBStatusLabel2: TDBStatusLabel;
    Label6: TLabel;
    DBDateEdit1: TDBDateEdit;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    RxDBComboBox1: TRxDBComboBox;
    rxdbboxmoneda: TRxDBComboBox;
    dstblTipoTrnDoc: TDataSource;
    TabSheet2: TTabSheet;
    Label7: TLabel;
    dstblClientes: TDataSource;
    RxDBLookupCombo3: TRxDBLookupCombo;
    dstblServicio: TDataSource;
    SkinData1: TSkinData;
    TabSheet3: TTabSheet;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    dsqryBalanceCtes: TDataSource;
    RxDBLookupCombo1: TRxDBLookupCombo;
    DBEdit3: TDBEdit;
    Label10: TLabel;
    RxDBLookupCombo4: TRxDBLookupCombo;
    Label11: TLabel;
    Label12: TLabel;
    DBEdit4: TDBEdit;
    RxDBGrid1: TRxDBGrid;
    procedure btnInsertarClick(Sender: TObject);
    procedure btnModificarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnCerarAbrirresClick(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBDateEdit1Exit(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);

  private
    procedure EditarBalance;
    Procedure ActBalaceCte;
    procedure InsertaBalance;
    
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmActBlcCteCxp: TfrmActBlcCteCxp;

implementation

uses Uglobal, UFormSelFecha, UDatModCompania, UDatModCxp;

{$R *.dfm}

procedure TfrmActBlcCteCxp.btnInsertarClick(Sender: TObject);
begin
  if dmCxp.tblTransCxp.State = dsBrowse then
  begin
    dmCxp.tblTransCxp.Insert;
    dmCxp.tblTransCxpCIA_KEY.Value := GlbCodigoCia;
    dmCxp.tblTransCxpCODIGO_SERV.Value := 0; 
    dmCxp.tblTransCxpSTATUS.Value  := 'A';
    dmCxp.tblTransCxpFECHA_IN.Value:= Now;
    dmCxp.tblTransCxpIN_POR.Value  := StrUserName;
    dmCxp.tblTransCxpFECHA.Value := GlbFechaTrnDiaria;
    dmCxp.tblTransCxpTIPO_DOC.Value :=  10;//tnf
    dmCxp.tblTransCxpTIPO_TRANF.Value:=1;//Debito
    dmCxp.tblTransCxpMONEDA.Value:='1';
    dmCxp.tblTransCxpFECHA_IN.Value:=now;
    dmCxp.tblTransCxpIN_POR.Value:= strusername;
    dmCxp.tblTransCxpSTATUS.Value:='A';
    dmCxp.tblTransCxpTIPO_SERV.Value:=0;
    DBDateEdit1.SetFocus;
    //DBLookupComboBox3.SetFocus;
  end;
end;

procedure TfrmActBlcCteCxp.btnModificarClick(Sender: TObject);
begin
  if (dmCxp.tblTransCxpSTATUS.Value = 'R') then
  Exit;
  if dmCxp.tblTransCxp.State = dsBrowse then
  dmCxp.tblTransCxp.Edit;
end;

procedure TfrmActBlcCteCxp.btnSalvarClick(Sender: TObject);
begin
  if dmCxp.tblTransCxp.State in [dsEdit, dsInsert] then
  begin
    dmCxp.tblTransCxp.Post;
    dmCxp.tblTransCxp.ApplyUpdates;
    if Not dmCxp.tblTransCxp.Transaction.InTransaction then
    dmCxp.tblTransCxp.Transaction.StartTransaction;
    try
      dmCxp.tblTransCxp.Transaction.CommitRetaining;
    except
    dmCxp.tblTransCxp.Transaction.RollbackRetaining;
    end;
    if (dmCxp.tblTransCxpSTATUS.Value = 'A') then
    ActBalaceCte;//Actualiza Balance Cliente
  end;
end;

procedure TfrmActBlcCteCxp.btnCancelarClick(Sender: TObject);
begin
  if dmCxp.tblTransCxp.State in [dsEdit, dsInsert] then
  dmCxp.tblTransCxp.Cancel;
end;

procedure TfrmActBlcCteCxp.btnCerarAbrirresClick(Sender: TObject);
begin
  if dmCxp.tblTransCxp.State In [dsBrowse, dsInactive] then
  begin
    frmSelFecha:=TfrmSelFecha.Create(Nil);
    try
      if frmSelFecha.ShowModal = mrOk then
      begin
        dmCxp.tblTransCxp.Close;
        dmCxp.tblTransCxp.Params[0].Value:= ExtraerFecha(frmSelFecha.FechaIni.DateTime);
        dmCxp.tblTransCxp.Params[1].Value:= ExtraerFecha(frmSelFecha.FechaFin.DateTime);
        dmCxp.tblTransCxp.Open;
      end;
    finally
    frmSelFecha.Free;
    frmSelFecha:=Nil;
    end;
  end;
end;

procedure TfrmActBlcCteCxp.BitBtn9Click(Sender: TObject);
begin
  dmCxp.tblTransCxp.First;
end;

procedure TfrmActBlcCteCxp.BitBtn10Click(Sender: TObject);
begin
  dmCxp.tblTransCxp.Prior;
end;

procedure TfrmActBlcCteCxp.BitBtn11Click(Sender: TObject);
begin
  dmCxp.tblTransCxp.Next;
end;

procedure TfrmActBlcCteCxp.BitBtn12Click(Sender: TObject);
begin
  dmCxp.tblTransCxp.Last;
end;

procedure TfrmActBlcCteCxp.FormCreate(Sender: TObject);
begin
  //rxDatosProcCxp.close;
  //rxDatosProcCxp.open;
  //dmCxp.tblServicio.close;
  //dmCxp.tblServicio.open;
  dmCompania.tblCompania.Close;
  dmCompania.tblCompania.Open;
  dmCompania.tblCompania.Locate('codigo',glbCia_Key,[]);  
  //dmCxp.tblTipoServ.Close;
  //dmCxp.tblTipoServ.open;
  dmCxp.tblTipoTrnDoc.Close;
  dmCxp.tblTipoTrnDoc.Open;
  dmCxp.qryBalanceCtes.Close;
  dmCxp.qryBalanceCtes.Open;
  dmCxp.qryproveedor.Close;
  dmCxp.qryproveedor.Open;
  dmCxp.tblTransCxp.Close;
  dmCxp.tblTransCxp.Filtered:= False;
  dmCxp.tblTransCxp.Params[0].Value := ExtraerFecha(GlbFechaTrnDiaria);
  dmCxp.tblTransCxp.Params[1].Value := ExtraerFecha(GlbFechaTrnDiaria);
  dmCxp.tblTransCxp.Open;

  glbfechainicial:=GlbFechaTrnDiaria;
  glbfechaFinal  :=GlbFechaTrnDiaria;
end;

procedure TfrmActBlcCteCxp.DBDateEdit1Exit(Sender: TObject);
begin
  if dmCxp.tblTransCxp.State in [dsInsert, dsEdit] then
  begin
    if Not GlbPermiteDato(3,1,1,dmCxp.tblTransCxpfecha.Value) then
    begin
      MessageDlg('Fecha trans esta cerrada, verifique', mtError,[mbok],0);
      dmCxp.tblTransCxp.Cancel;
    end;
  end;
end;

procedure TfrmActBlcCteCxp.EditarBalance;
begin
  if (dmCxp.tblTransCxpTIPO_DOC.Value = 10) then
  begin
    dmCxp.qryBalanceCtes.Edit;
    dmCxp.qryBalanceCtesBALANCE_ANT.Value:= dmCxp.qryBalanceCtesBALANCE_ACT.Value;
    dmCxp.qryBalanceCtesBALANCE_ACT.Value:=
    dmCxp.qryBalanceCtesBALANCE_ACT.Value +
    dmCxp.tblTransCxpVALOR_DOCUMENTO.Value;
    dmCxp.qryBalanceCtesDEBITO_MES.Value :=
    dmCxp.qryBalanceCtesDEBITO_MES.Value + dmCxp.tblTransCxpVALOR_DOCUMENTO.Value;
    dmCxp.qryBalanceCtesDEBITO_ACM.Value :=
    dmCxp.qryBalanceCtesDEBITO_ACM.Value + dmCxp.tblTransCxpVALOR_DOCUMENTO.Value;
    dmCxp.tblTransCxp.Edit;
    dmCxp.tblTransCxpSTATUS.Value := 'R';
    //dmCxp.qryBalanceCtesFECHA_ULT_PAGO.Value:= dmCxp.tblTransCxpfecha.Value;
  end;
end;
procedure TfrmActBlcCteCxp.ActBalaceCte;
begin
  dmCxp.qryBalanceCtes.Close;
  dmCxp.qryBalanceCtes.Open;
    if   dmCxp.qrybalancectes.Locate('CODIGO;TIPO;MONEDA',
         VarArrayOf([dmCxp.tblTransCxpCODIGO_CLIENTE.Value,
                     0,dmCxp.tblTransCxpMoneda.Value]),[]) then
    begin
      EditarBalance;
    end else
    begin
      InsertaBalance;
    end;//locate
    if dmCxp.qryBalanceCtes.State in [dsEdit, dsInsert] then
    dmCxp.qryBalanceCtes.Post;
    dmCxp.qryBalanceCtes.ApplyUpdates;
    if not dmCxp.qryBalanceCtes.Transaction.InTransaction then
    dmCxp.qryBalanceCtes.Transaction.StartTransaction;
    try
      dmCxp.qryBalanceCtes.Transaction.Commitretaining;
    except
    dmCxp.qryBalanceCtes.Transaction.Rollbackretaining;
    end;
  btnSalvarClick(Self);
end;

procedure TfrmActBlcCteCxp.InsertaBalance;
begin
  dmCxp.qryBalanceCtes.Insert;
  dmCxp.qryBalanceCtescia_key.value:= GlbCodigoCia; 
  dmCxp.qryBalanceCtesCODIGO.Value  := dmCxp.tblTransCxpCODIGO_CLIENTE.Value;
  dmCxp.qryBalanceCtesTIPO.Value    := 0;
  //dmCxp.qryBalanceCtesSERVICIO.Value:= dmCxp.tblTransCxpcodigo_serv.Value;
  dmCxp.qryBalanceCtesMONEDA.Value  := dmCxp.tblTransCxpmoneda.Value;
  dmCxp.qryBalanceCtesSTATUS_BCE.Value:= 'A';
  dmCxp.qryBalanceCtesFECHA_BCE.Value := dmCxp.tblTransCxpfecha.Value;
  dmCxp.qryBalanceCtesFECHA_IN.Value  := Now;
  dmCxp.qryBalanceCtesIN_POR.Value    := StrUserName;
  dmCxp.tblTransCxp.Edit;
  dmCxp.tblTransCxpSTATUS.Value := 'R';

  if (dmCxp.tblTransCxpTIPO_DOC.Value = 10) then
  begin
    dmCxp.qryBalanceCtesBALANCE_ACT.Value:=dmCxp.tblTransCxpVALOR_DOCUMENTO.Value;
    dmCxp.qryBalanceCtesDEBITO_MES.Value :=dmCxp.tblTransCxpVALOR_DOCUMENTO.Value;
    dmCxp.qryBalanceCtesDEBITO_ACM.Value :=dmCxp.tblTransCxpVALOR_DOCUMENTO.Value;
    dmCxp.qryBalanceCtesCREDITO_MES.Value:=0;
    dmCxp.qryBalanceCtesCREDITO_ACM.Value:=0;
    //dmCxp.qryBalanceCtesFECHA_ULT_PAGO.Value:= dmCxp.tblTransCxpfecha.Value;
  end; {else
  if (dmCxp.tblTransCxptipo_doc.Value = 1) or (dmCxp.tblTransCxptipo_doc.Value = 3) then
      begin
        dmCxp.qryBalanceCtesBALANCE_ACT.Value:= dmCxp.tblTransCxpVALOR_DOCUMENTO.Value;
        dmCxp.qryBalanceCtesDEBITO_MES.Value:=  dmCxp.tblTransCxpVALOR_DOCUMENTO.Value;
        dmCxp.qryBalanceCtesDEBITO_ACM.Value:=  dmCxp.tblTransCxpVALOR_DOCUMENTO.Value;
      end else
      if (dmCxp.tblTransCxptipo_doc.Value = 2) or (dmCxp.tblTransCxptipo_doc.Value = 4) or
         (dmCxp.tblTransCxptipo_doc.Value = 5) then
      begin
        if (dmCxp.tblTransCxptipo_doc.Value = 4) and ((dmCxp.tblTransCxptipo_tranf.Value = 1) ) then
        begin
          dmCxp.qryBalanceCtesBALANCE_ACT.Value:= dmCxp.tblTransCxpVALOR_DOCUMENTO.Value;
          dmCxp.qryBalanceCtesDEBITO_MES.Value:=  dmCxp.tblTransCxpVALOR_DOCUMENTO.Value;
          dmCxp.qryBalanceCtesDEBITO_ACM.Value:=  dmCxp.tblTransCxpVALOR_DOCUMENTO.Value;
        end else
        begin
          dmCxp.qryBalanceCtesBALANCE_ACT.Value:=//-
          dmCxp.qryBalanceCtesBALANCE_ACT.Value - dmCxp.tblTransCxpVALOR_DOCUMENTO.Value;
          dmCxp.qryBalanceCtesCREDITO_MES.Value:= dmCxp.tblTransCxpVALOR_DOCUMENTO.Value;
          dmCxp.qryBalanceCtesCREDITO_ACM.Value:= dmCxp.tblTransCxpVALOR_DOCUMENTO.Value;
          dmCxp.qryBalanceCtesFECHA_ULT_PAGO.Value:= dmCxp.tblTransCxpfecha.Value;
        end;
      end; }
end;

procedure TfrmActBlcCteCxp.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if (dmcxp.tblTransCxpSTATUS.Value = 'R') then
  BackGround:=clGreen
  else
  if (dmcxp.tblTransCxpSTATUS.Value = 'C') then
  BackGround:=clGray
  else
  if (dmcxp.tblTransCxpSTATUS.IsNull) then
  BackGround:=clRed;
end;

end.
