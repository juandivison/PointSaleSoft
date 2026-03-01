unit UFormTransaccionesCXP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ExtCtrls, Grids, DBGrids, DBCtrls, StdCtrls, Buttons, Mask,
  ToolEdit, RXDBCtrl, RXCtrls, ComCtrls, RxDBComb, WinSkinData;

type
  TfrmTransaccionesCxP = class(TForm)
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
    DBDateEdit1: TDBDateEdit;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    btnSalvar: TBitBtn;
    btnCerarAbrirres: TBitBtn;
    btnModificar: TBitBtn;
    btnCancelar: TBitBtn;
    btnInsertar: TBitBtn;
    BitBtn3: TBitBtn;
    dstblTransCxp: TDataSource;
    Label6: TLabel;
    RxDBComboBox1: TRxDBComboBox;
    SkinData1: TSkinData;
    rxdbboxmoneda: TRxDBComboBox;
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnCerarAbrirresClick(Sender: TObject);
    procedure btnInsertarClick(Sender: TObject);
    procedure btnModificarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTransaccionesCxP: TfrmTransaccionesCxP;

implementation
uses UDatModCxp, uGlobal, UFormSelFecha;

{$R *.dfm}

procedure TfrmTransaccionesCxP.BitBtn10Click(Sender: TObject);
begin
  dmCxp.tblTransCxp.Prior;
end;

procedure TfrmTransaccionesCxP.BitBtn11Click(Sender: TObject);
begin
  dmCxp.tblTransCxp.Next;
end;

procedure TfrmTransaccionesCxP.BitBtn12Click(Sender: TObject);
begin
  dmCxp.tblTransCxp.Last;
end;

procedure TfrmTransaccionesCxP.BitBtn9Click(Sender: TObject);
begin
  dmCxp.tblTransCxp.First;
end;

procedure TfrmTransaccionesCxP.btnCancelarClick(Sender: TObject);
begin
  if dmCxp.tblTransCxp.State in [dsEdit, dsInsert] then
  dmCxp.tblTransCxp.Cancel;
end;

procedure TfrmTransaccionesCxP.btnCerarAbrirresClick(Sender: TObject);
begin
  if dmCxp.tblTransCxp.State In [dsBrowse, dsInactive] then
  begin
    frmSelFecha:=TfrmSelFecha.Create(Nil);
    try
      if frmSelFecha.Showmodal = mrOk then
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

procedure TfrmTransaccionesCxP.btnInsertarClick(Sender: TObject);
begin
  if dmCxp.tblTransCxp.State = dsBrowse then
  begin
    dmCxp.tblTransCxp.Insert;
    dmCxp.tblTransCxpSTATUS.Value  := 'A';
    dmCxp.tblTransCxpFECHA_IN.Value:= Now;
    dmCxp.tblTransCxpIN_POR.Value  := StrUserName;
    //DBLookupComboBox3.SetFocus;
  end;
end;

procedure TfrmTransaccionesCxP.btnModificarClick(Sender: TObject);
begin
  if dmCxp.tblTransCxp.State = dsBrowse then
  dmCxp.tblTransCxp.Edit;
end;

procedure TfrmTransaccionesCxP.btnSalvarClick(Sender: TObject);
begin
  if dmCxp.tblTransCxp.State in [dsEdit, dsInsert] then
  begin
    dmCxp.tblTransCxp.Post;
    dmCxp.tblTransCxp.ApplyUpdates;
    if not dmCxp.tblTransCxp.Transaction.InTransaction then
    dmCxp.tblTransCxp.Transaction.StartTransaction;
    try
      dmCxp.tblTransCxp.Transaction.CommitRetaining;
    except
    dmCxp.tblTransCxp.Transaction.RollbackRetaining;
    end;
  end;
end;

end.
