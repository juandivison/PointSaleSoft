unit UCompania;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, RXDBCtrl, StdCtrls, Mask, DBCtrls, ComCtrls, DB,
  Buttons, RXCtrls, ExtCtrls, WinSkinData;

type
  TfrmCompania = class(TForm)
    PageControl1: TPageControl;
    tabRecord: TTabSheet;
    ScrollBox1: TScrollBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label17: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit23: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit24: TDBEdit;
    DBEdit25: TDBEdit;
    DBEdit26: TDBEdit;
    DBEdit27: TDBEdit;
    tabExaminar: TTabSheet;
    RxDBGrid3: TRxDBGrid;
    DataSource1: TDataSource;
    Panel2: TPanel;
    RxSpeedButton18: TRxSpeedButton;
    btnSalvar: TBitBtn;
    btnCerarAbrirres: TBitBtn;
    btnModificar: TBitBtn;
    btnCancelar: TBitBtn;
    btnInsertar: TBitBtn;
    BitBtn3: TBitBtn;
    SkinData1: TSkinData;
    procedure btnInsertarClick(Sender: TObject);
    procedure btnModificarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCerarAbrirresClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCompania: TfrmCompania;

implementation

uses UDatModCompania;

{$R *.dfm}

procedure TfrmCompania.btnInsertarClick(Sender: TObject);
begin
  dmcompania.tblCompania.Insert;
end;

procedure TfrmCompania.btnModificarClick(Sender: TObject);
begin
  dmcompania.tblCompania.Edit;
end;

procedure TfrmCompania.btnSalvarClick(Sender: TObject);
begin
  if dmcompania.tblCompania.State In [dsEdit, dsInsert] then
  begin
    dmcompania.tblCompania.Post;
    if not dmcompania.tblCompania.Transaction.InTransaction then
    dmcompania.tblCompania.Transaction.StartTransaction;
    try
      dmcompania.tblCompania.Transaction.CommitRetaining;
    except
    dmcompania.tblCompania.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmCompania.btnCerarAbrirresClick(Sender: TObject);
begin
  dmcompania.tblCompania.close;
  dmcompania.tblCompania.open;
end;

procedure TfrmCompania.btnCancelarClick(Sender: TObject);
begin
  if dmcompania.tblCompania.State In [dsEdit, dsInsert] then
  dmcompania.tblCompania.Cancel;
end;

end.
