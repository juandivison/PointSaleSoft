unit UBalanceMensual;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, DBActns, ActnList, Grids, DBGrids, RXDBCtrl, StdCtrls,
  db, Mask, DBCtrls, RXCtrls, ComCtrls, Buttons, ExtCtrls, WinSkinData;

type
  TfrmBceMensual = class(TForm)
    Panel2: TPanel;
    btnSalvar: TBitBtn;
    btnCerarAbrirres: TBitBtn;
    btnModificar: TBitBtn;
    btnCancelar: TBitBtn;
    BitBtn3: TBitBtn;
    btnRecibo: TBitBtn;
    BitBtn1: TBitBtn;
    PageControl1: TPageControl;
    tabRecord: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBText1: TDBText;
    DBStatusLabel1: TDBStatusLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    tabExaminar: TTabSheet;
    RxDBGrid1: TRxDBGrid;
    ActionList1: TActionList;
    DataSetFirst1: TDataSetFirst;
    DataSetPrior1: TDataSetPrior;
    DataSetNext1: TDataSetNext;
    DataSetLast1: TDataSetLast;
    ImageList1: TImageList;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    SkinData1: TSkinData;
    procedure btnModificarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnCerarAbrirresClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBceMensual: TfrmBceMensual;

implementation
uses UDatModCatalogo, UGlobal;
{$R *.dfm}

procedure TfrmBceMensual.btnModificarClick(Sender: TObject);
begin
  if dmCatalogo.qryBlcMesCta.state = dsBrowse then
  begin
    dmCatalogo.qryBlcMesCta.edit;
  end;
end;

procedure TfrmBceMensual.btnSalvarClick(Sender: TObject);
begin
  if dmCatalogo.qryBlcMesCta.state in [dsEdit] then
  begin
    dmCatalogo.qryBlcMesCtaIN_POR.Value    := StrUserName;
    dmCatalogo.qryBlcMesCtaFECHA_mod.Value := Now;
    try
    dmCatalogo.qryBlcMesCta.post;
    dmCatalogo.qryBlcMesCta.ApplyUpdates;
    if not dmCatalogo.qryBlcMesCta.Transaction.inTransaction then
    dmCatalogo.qryBlcMesCta.Transaction.StartTransaction;
    dmCatalogo.qryBlcMesCta.Transaction.Commitretaining;
    except
    dmCatalogo.qryBlcMesCta.Transaction.Rollbackretaining;
    end;
  end;
end;

procedure TfrmBceMensual.btnCancelarClick(Sender: TObject);
begin
  if dmCatalogo.qryBlcMesCta.state in [dsEdit] then
  begin
    if MessageDlg('Cancelar edición de transacción?',mtInformation,[mbYes,mbNo],0) = mryes then
    begin
      dmCatalogo.qryBlcMesCta.cancel;
    end;
  end;
end;

procedure TfrmBceMensual.BitBtn1Click(Sender: TObject);
var
  cta1,cta2,cta3:string;
begin
  GlbAsignaCuenta(InputBox('Buscar por cuenta','Entre cuenta',''),cta1,cta2,cta3);
  if not dmCatalogo.qryBlcMesCta.locate('cuenta1_blc;cuenta2_blc;cuenta3_blc',VarArrayOf([cta1,cta2,cta3]),[]) then
  MessageDlg('Cuenta no existe',mtInformation,[mbok],0);
end;

procedure TfrmBceMensual.btnCerarAbrirresClick(Sender: TObject);
begin
  dmCatalogo.qryBlcMesCta.close;
  dmCatalogo.qryBlcMesCta.open;
end;

end.
