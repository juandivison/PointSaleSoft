unit UFormMantBlcCteCxc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, RxDBComb, Grids, DBGrids, DBCtrls,
  Mask, rxToolEdit, RXDBCtrl, RXCtrls, ComCtrls, DB, RxLookup, WinSkinData;

type
  TfrmActBlcCteCxc = class(TForm)
    Panel2: TPanel;
    btnSalvar: TBitBtn;
    btnCerarAbrirres: TBitBtn;
    btnModificar: TBitBtn;
    btnCancelar: TBitBtn;
    btnInsertar: TBitBtn;
    BitBtn3: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBStatusLabel1: TDBStatusLabel;
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
  frmActBlcCteCxc: TfrmActBlcCteCxc;

implementation

uses UDatModCxc, Uglobal, UFormSelFecha, UDatModCompania;

{$R *.dfm}

procedure TfrmActBlcCteCxc.btnInsertarClick(Sender: TObject);
begin
  if dmCxc.tblTransCxc.State = dsBrowse then
  begin
    dmCxc.tblTransCxc.Insert;
    dmCxc.tblTransCxcCIA_KEY.Value := GlbCodigoCia; 
    dmCxc.tblTransCxcSTATUS.Value  := 'A';
    dmCxc.tblTransCxcFECHA_IN.Value:= Now;
    dmCxc.tblTransCxcIN_POR.Value  := StrUserName;
    dmCxc.tblTransCxcFECHA.Value := GlbFechaTrnDiaria;
    dmCxc.tblTransCxcTIPO_DOC.Value :=  10;//tnf
    dmCxc.tblTransCxcTIPO_TRANF.Value:=1;//Debito
    dmCxc.tblTransCxcMONEDA.Value:='1';
    dmCxc.tblTransCxcFECHA_IN.Value:=now;
    dmCxc.tblTransCxcIN_POR.Value:= strusername;
    dmCxc.tblTransCxcSTATUS.Value:='A';
    dmCxc.tblTransCxcTIPO_SERV.Value:=0;
    DBDateEdit1.SetFocus;
    //DBLookupComboBox3.SetFocus;
  end;
end;

procedure TfrmActBlcCteCxc.btnModificarClick(Sender: TObject);
begin
  if (dmCxc.tblTransCxcSTATUS.Value = 'R') then
  Exit;
  if dmCxc.tblTransCxc.State = dsBrowse then
  dmCxc.tblTransCxc.Edit;
end;

procedure TfrmActBlcCteCxc.btnSalvarClick(Sender: TObject);
begin
  if dmCxc.tblTransCxc.State in [dsEdit, dsInsert] then
  begin
    dmCxc.tblTransCxc.Post;
    dmCxc.tblTransCxc.ApplyUpdates;
    if Not dmCxc.tblTransCxc.Transaction.InTransaction then
    dmCxc.tblTransCxc.Transaction.StartTransaction;
    try
      dmCxc.tblTransCxc.Transaction.CommitRetaining;
    except
    dmCxc.tblTransCxc.Transaction.RollbackRetaining;
    end;
    if (dmcxc.tblTransCxcSTATUS.Value = 'A') then
    ActBalaceCte;//Actualiza Balance Cliente
  end;
end;

procedure TfrmActBlcCteCxc.btnCancelarClick(Sender: TObject);
begin
  if dmCxc.tblTransCxc.State in [dsEdit, dsInsert] then
  dmCxc.tblTransCxc.Cancel;
end;

procedure TfrmActBlcCteCxc.btnCerarAbrirresClick(Sender: TObject);
begin
  if dmCxc.tblTransCxc.State In [dsBrowse, dsInactive] then
  begin
    frmSelFecha:=TfrmSelFecha.Create(Nil);
    try
      if frmSelFecha.ShowModal = mrOk then
      begin
        dmCxc.tblTransCxc.Close;
        dmCxc.tblTransCxc.Params[0].Value:= ExtraerFecha(frmSelFecha.FechaIni.DateTime);
        dmCxc.tblTransCxc.Params[1].Value:= ExtraerFecha(frmSelFecha.FechaFin.DateTime);
        dmCxc.tblTransCxc.Params[2].Value:=glbCia_Key;        
        dmCxc.tblTransCxc.Open;
      end;
    finally
    frmSelFecha.Free;
    frmSelFecha:=Nil;
    end;
  end;
end;

procedure TfrmActBlcCteCxc.BitBtn9Click(Sender: TObject);
begin
  dmCxc.tblTransCxc.First;
end;

procedure TfrmActBlcCteCxc.BitBtn10Click(Sender: TObject);
begin
  dmCxc.tblTransCxc.Prior;
end;

procedure TfrmActBlcCteCxc.BitBtn11Click(Sender: TObject);
begin
  dmCxc.tblTransCxc.Next;
end;

procedure TfrmActBlcCteCxc.BitBtn12Click(Sender: TObject);
begin
  dmCxc.tblTransCxc.Last;
end;

procedure TfrmActBlcCteCxc.FormCreate(Sender: TObject);
begin
  //rxDatosProcCxc.close;
  //rxDatosProcCxc.open;
  dmcxc.tblServicio.close;
  dmcxc.tblServicio.open;
  dmCompania.tblCompania.Close;
  dmCompania.tblCompania.Open;
  dmCompania.tblCompania.Locate('codigo',glbCia_Key,[]);  
  dmcxc.tblTipoServ.Close;
  dmcxc.tblTipoServ.open;
  dmcxc.tblClientes.Close;
  dmcxc.tblClientes.Open;
  dmcxc.tblTipoTrnDoc.Close;
  dmcxc.tblTipoTrnDoc.Open;
  dmcxc.qryBalanceCtes.Close;
  dmcxc.qryBalanceCtes.Open;
  dmCxc.tblClientes.Close;
  dmCxc.tblClientes.Open;
  dmCxc.qryClientes.Close;
  dmCxc.qryClientes.Open;
  dmcxc.tblTransCxc.Close;
  dmcxc.tblTransCxc.Filtered:= False;
  dmcxc.tblTransCxc.Params[0].Value := ExtraerFecha(GlbFechaTrnDiaria);
  dmcxc.tblTransCxc.Params[1].Value := ExtraerFecha(GlbFechaTrnDiaria);
  dmCxc.tblTransCxc.Params[2].Value := GlbCia_Key;
  dmcxc.tblTransCxc.Open;

  glbfechainicial:=GlbFechaTrnDiaria;
  glbfechaFinal  :=GlbFechaTrnDiaria;
end;

procedure TfrmActBlcCteCxc.DBDateEdit1Exit(Sender: TObject);
begin
  if dmcxc.tblTransCxc.State in [dsInsert, dsEdit] then
  begin
    if Not GlbPermiteDato(3,1,1,dmCxc.tblTransCxcfecha.Value) then
    begin
      MessageDlg('Fecha trans esta cerrada, verifique', mtError,[mbok],0);
      dmcxc.tblTransCxc.Cancel;
    end;
  end;
end;

procedure TfrmActBlcCteCxc.EditarBalance;
begin
  if (dmCxc.tblTransCxcTIPO_DOC.Value = 10) then
  begin
    dmcxc.qryBalanceCtes.Edit;
    dmcxc.qryBalanceCtesBALANCE_ANT.Value:=dmcxc.qryBalanceCtesBALANCE_ACT.Value;
    dmcxc.qryBalanceCtesBALANCE_ACT.Value:=
    dmcxc.qryBalanceCtesBALANCE_ACT.Value +
    dmCxc.tblTransCxcVALOR_DOCUMENTO.Value;
    dmcxc.qryBalanceCtesDEBITO_MES.Value :=
    dmcxc.qryBalanceCtesDEBITO_MES.Value + dmCxc.tblTransCxcVALOR_DOCUMENTO.Value;
    dmcxc.qryBalanceCtesDEBITO_ACM.Value :=
    dmcxc.qryBalanceCtesDEBITO_ACM.Value + dmCxc.tblTransCxcVALOR_DOCUMENTO.Value;
    dmcxc.tblTransCxc.Edit;
    dmcxc.tblTransCxcSTATUS.Value := 'R';
    //dmcxc.qryBalanceCtesFECHA_ULT_PAGO.Value:= dmCxc.tblTransCxcfecha.Value;
  end;
end;
procedure TfrmActBlcCteCxc.ActBalaceCte;
begin
  dmcxc.qryBalanceCtes.Close;
  dmcxc.qryBalanceCtes.Open;
    if   dmcxc.qrybalancectes.Locate('CODIGO;SERVICIO;MONEDA',
         VarArrayOf([dmCxc.tblTransCxcCODIGO_CLIENTE.Value,
                     dmCxc.tblTransCxcCODIGO_SERV.Value,
                     dmCxc.tblTransCxcMoneda.Value]),[]) then
    begin
      EditarBalance;
    end else
    begin
      InsertaBalance;
    end;//locate
    if dmcxc.qryBalanceCtes.State in [dsEdit, dsInsert] then
    dmcxc.qryBalanceCtes.Post;
    dmcxc.qryBalanceCtes.ApplyUpdates;
    if not dmcxc.qryBalanceCtes.Transaction.InTransaction then
    dmcxc.qryBalanceCtes.Transaction.StartTransaction;
    try
      dmcxc.qryBalanceCtes.Transaction.Commitretaining;
    except
    dmcxc.qryBalanceCtes.Transaction.Rollbackretaining;
    end;
  btnSalvarClick(Self);
end;

procedure TfrmActBlcCteCxc.InsertaBalance;
begin
  dmcxc.qryBalanceCtes.Insert;
  dmcxc.qryBalanceCtesCODIGO.Value  := dmCxc.tblTransCxcCODIGO_CLIENTE.Value;
  dmcxc.qryBalanceCtesSERVICIO.Value:= dmCxc.tblTransCxccodigo_serv.Value;
  dmcxc.qryBalanceCtesMONEDA.Value  := dmCxc.tblTransCxcmoneda.Value;
  dmcxc.qryBalanceCtesSTATUS_BCE.Value:= 'A';
  dmcxc.qryBalanceCtesFECHA_BCE.Value := dmCxc.tblTransCxcfecha.Value;
  dmcxc.qryBalanceCtesFECHA_IN.Value  := Now;
  dmcxc.qryBalanceCtesIN_POR.Value    := StrUserName;
  dmcxc.tblTransCxc.Edit;
  dmcxc.tblTransCxcSTATUS.Value := 'R';

  if (dmCxc.tblTransCxcTIPO_DOC.Value = 10) then
  begin
    dmcxc.qryBalanceCtesBALANCE_ACT.Value:=dmCxc.tblTransCxcVALOR_DOCUMENTO.Value;
    dmcxc.qryBalanceCtesDEBITO_MES.Value :=dmCxc.tblTransCxcVALOR_DOCUMENTO.Value;
    dmcxc.qryBalanceCtesDEBITO_ACM.Value :=dmCxc.tblTransCxcVALOR_DOCUMENTO.Value;
    dmcxc.qryBalanceCtesCREDITO_MES.Value:=0;
    dmcxc.qryBalanceCtesCREDITO_ACM.Value:=0;
    //dmcxc.qryBalanceCtesFECHA_ULT_PAGO.Value:= dmCxc.tblTransCxcfecha.Value;
  end; {else
  if (dmCxc.tblTransCxctipo_doc.Value = 1) or (dmCxc.tblTransCxctipo_doc.Value = 3) then
      begin
        dmcxc.qryBalanceCtesBALANCE_ACT.Value:= dmCxc.tblTransCxcVALOR_DOCUMENTO.Value;
        dmcxc.qryBalanceCtesDEBITO_MES.Value:=  dmCxc.tblTransCxcVALOR_DOCUMENTO.Value;
        dmcxc.qryBalanceCtesDEBITO_ACM.Value:=  dmCxc.tblTransCxcVALOR_DOCUMENTO.Value;
      end else
      if (dmCxc.tblTransCxctipo_doc.Value = 2) or (dmCxc.tblTransCxctipo_doc.Value = 4) or
         (dmCxc.tblTransCxctipo_doc.Value = 5) then
      begin
        if (dmCxc.tblTransCxctipo_doc.Value = 4) and ((dmCxc.tblTransCxctipo_tranf.Value = 1) ) then
        begin
          dmcxc.qryBalanceCtesBALANCE_ACT.Value:= dmCxc.tblTransCxcVALOR_DOCUMENTO.Value;
          dmcxc.qryBalanceCtesDEBITO_MES.Value:=  dmCxc.tblTransCxcVALOR_DOCUMENTO.Value;
          dmcxc.qryBalanceCtesDEBITO_ACM.Value:=  dmCxc.tblTransCxcVALOR_DOCUMENTO.Value;
        end else
        begin
          dmcxc.qryBalanceCtesBALANCE_ACT.Value:=//-
          dmcxc.qryBalanceCtesBALANCE_ACT.Value - dmCxc.tblTransCxcVALOR_DOCUMENTO.Value;
          dmcxc.qryBalanceCtesCREDITO_MES.Value:= dmCxc.tblTransCxcVALOR_DOCUMENTO.Value;
          dmcxc.qryBalanceCtesCREDITO_ACM.Value:= dmCxc.tblTransCxcVALOR_DOCUMENTO.Value;
          dmcxc.qryBalanceCtesFECHA_ULT_PAGO.Value:= dmCxc.tblTransCxcfecha.Value;
        end;
      end; }
end;

procedure TfrmActBlcCteCxc.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if (dmcxc.tblTransCxcSTATUS.Value = 'R') then
  BackGround:=clGreen
  else
  if (dmcxc.tblTransCxcSTATUS.Value = 'C') then
  BackGround:=clGray
  else
  if (dmcxc.tblTransCxcSTATUS.IsNull) then
  BackGround:=clRed;
end;

end.
