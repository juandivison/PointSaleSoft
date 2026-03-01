unit UCambiarPrecios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  db, Dialogs, StdCtrls, Mask, DBCtrls, ExtCtrls, Buttons, RXToolEdit, 
  RXDBCtrl, Grids, DBGrids, RxGrdCpt, RxCurrEdit;

type
  TfrmCambiarPrecio = class(TForm)
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    Label5: TLabel;
    BitBtn2: TBitBtn;
    RadioGroup1: TRadioGroup;
    RxCalcEdit1: TRxCalcEdit;
    RxCalcEdit2: TRxCalcEdit;
    RxDBGrid1: TRxDBGrid;
    RxDBGrid2: TRxDBGrid;
    Label6: TLabel;
    Label7: TLabel;
    RxGradientCaption1: TRxGradientCaption;
    BitBtn1: TBitBtn;
    RxDBGrid3: TRxDBGrid;
    Label8: TLabel;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure DBEdit3Change(Sender: TObject);
  private
    { Private declarations }
    procedure Salvar;
    procedure GuardarHistorico;
  public
    { Public declarations }
  end;

var
  frmCambiarPrecio: TfrmCambiarPrecio;

implementation

uses UDatModInventario;

{$R *.dfm}

procedure TfrmCambiarPrecio.BitBtn2Click(Sender: TObject);
begin
  if RadioGroup1.ItemIndex = 0 then
  begin
    dmInventario.tblInventarioProd.Edit;
    dmInventario.tblInventarioProdPRECIO_ANT.Value:= dmInventario.tblInventarioProdPRECIO.Value;
    dmInventario.tblInventarioProdPRECIO.Value    := RxCalcEdit2.Value * (1 + RxCalcEdit1.Value/100);
    Salvar;
    GuardarHistorico;    
  end else
  begin
    if MessageDlg('PRECAUCION: El precio de todos los productos será aumentado en '#13''+
                  RxCalcEdit1.Text+'%. Continuar?',mtWarning,[mbyes,mbno],0)=mryes then
    begin
      dmInventario.tblInventarioProd.First;
      While Not dmInventario.tblInventarioProd.Eof do
      begin
        dmInventario.tblInventarioProd.Edit;
        dmInventario.tblInventarioProdPRECIO_ANT.Value:= dmInventario.tblInventarioProdPRECIO.Value;
        dmInventario.tblInventarioProdPRECIO.Value    :=
        (dmInventario.tblInventarioProdPRECIO.Value * (1 + RxCalcEdit1.Value/100 ));
        Salvar;
        GuardarHistorico;
        dmInventario.tblInventarioProd.Next;
      end;
    end;
  end;
  dmInventario.qryConsultaInvActual.Close;
  dmInventario.qryConsultaInvActual.Open;
  dmInventario.qryConsultaInvhist.Close;
  dmInventario.qryConsultaInvhist.Open;
end;

procedure TfrmCambiarPrecio.GuardarHistorico;
begin
  dmInventario.tblInventarioHistorico.Insert;
  dmInventario.tblInventarioHistoricoCODIGO.Value      := dmInventario.tblInventarioProdCODIGO.AsString;
  dmInventario.tblInventarioHistoricoPRECIO.Value      := dmInventario.tblInventarioProdPRECIO_ANT.Value;
  dmInventario.tblInventarioHistoricoFECHA_INICIO.Value:= Now;
  //dmInventario.tblInventarioHistoricoFECHA_FINAL.Value :=
  dmInventario.tblInventarioHistoricoDESCRIPCION.Value := dmInventario.tblInventarioProdDESCRIPCION.Value;
  dmInventario.tblInventarioHistoricoSTATUS.Value      := 'A';
  if dmInventario.tblInventarioHistorico.State In [dsEdit,dsInsert] then
  begin
    dmInventario.tblInventarioHistorico.Post;
    dmInventario.tblInventarioHistorico.ApplyUpdates;
    if not dmInventario.tblInventarioHistorico.Transaction.InTransaction then
    dmInventario.tblInventarioHistorico.Transaction.StartTransaction;
    try
      dmInventario.tblInventarioHistorico.Transaction.CommitRetaining;
    except
    dmInventario.tblInventarioHistorico.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmCambiarPrecio.Salvar;
begin
  if dmInventario.tblInventarioProd.State In [dsEdit] then
  begin
    dmInventario.tblInventarioProd.Post;
    dmInventario.tblInventarioProd.ApplyUpdates;
    if not dmInventario.tblInventarioProd.Transaction.InTransaction then
    dmInventario.tblInventarioProd.Transaction.StartTransaction;
    try
      dmInventario.tblInventarioProd.Transaction.CommitRetaining;
    except
    dmInventario.tblInventarioProd.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmCambiarPrecio.FormCreate(Sender: TObject);
begin
  //RxCalcEdit2.Value := dmInventario.tblInventarioProdPRECIO.Value; 
  dmInventario.tblInventarioHistorico.close;
  dmInventario.tblInventarioHistorico.Open;
  dmInventario.qryConsultaInvActual.Close;
  dmInventario.qryConsultaInvActual.Open;
  dmInventario.qryConsultaInvhist.Close;  
  dmInventario.qryConsultaInvhist.Open;
end;

procedure TfrmCambiarPrecio.BitBtn1Click(Sender: TObject);
begin
  dmInventario.qryConsultaInvActual.Close;
  dmInventario.qryConsultaInvActual.Open;
  dmInventario.qryConsultaInvhist.Close;
  dmInventario.qryConsultaInvhist.Open;
end;

procedure TfrmCambiarPrecio.BitBtn4Click(Sender: TObject);
begin
  dmInventario.tblInventarioProd.Prior;
end;

procedure TfrmCambiarPrecio.BitBtn3Click(Sender: TObject);
begin
  dmInventario.tblInventarioProd.Next;
end;

procedure TfrmCambiarPrecio.BitBtn5Click(Sender: TObject);
begin
  dmInventario.tblInventarioProd.Last;
end;

procedure TfrmCambiarPrecio.BitBtn6Click(Sender: TObject);
begin
  dmInventario.tblInventarioProd.First;
end;

procedure TfrmCambiarPrecio.DBEdit3Change(Sender: TObject);
begin
  //RxCalcEdit2.Value := dmInventario.tblInventarioProdPRECIO.Value;
end;

end.
