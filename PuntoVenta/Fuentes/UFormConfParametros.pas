unit UFormConfParametros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, StdCtrls, DBCtrls, Grids, DBGrids, RXDBCtrl,
  Mask, ExtCtrls, ComCtrls, Buttons, WinSkinData, IBQuery, RxLookup,
  ToolEdit, RXCtrls;

type
  TfrmSetup = class(TForm)
    tblPosSetupTipo: TIBDataSet;
    tblPosSetupTipoTIPO: TIntegerField;
    tblPosSetupTipoAREA: TIBStringField;
    tblPosSetup: TIBDataSet;
    tblPosSetupSERIE: TIntegerField;
    tblPosSetupTIPO2: TSmallintField;
    tblPosSetupAREA: TIBStringField;
    tblPosSetupPARAMETRO: TIBStringField;
    tblPosSetupVALORINTEGER: TIntegerField;
    tblPosSetupVALORFECHA: TDateTimeField;
    tblPosSetupVALORSTRING: TIBStringField;
    tblPosSetupNOTA: TMemoField;
    dstblPosSetup: TDataSource;
    dstblPosSetupTipo: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    RxDBGrid2: TRxDBGrid;
    Label1: TLabel;
    DBMemo1: TDBMemo;
    Shape1: TShape;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    chkBoxMostrarTodo: TCheckBox;
    SkinData1: TSkinData;
    BitBtn1: TBitBtn;
    RxDBLookupCombo1: TRxDBLookupCombo;
    qryPosSetupTipo: TIBQuery;
    qryPosSetupTipoTIPO: TIntegerField;
    qryPosSetupTipoAREA: TIBStringField;
    dsqryPosSetupTipo: TDataSource;
    Label6: TLabel;
    DBDateEdit1: TDBDateEdit;
    RxDBGrid1: TRxDBGrid;
    DBStatusLabel1: TDBStatusLabel;
    DBStatusLabel2: TDBStatusLabel;
    BitBtn2: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    DBRadioGroup1: TDBRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure qryPosSetupTipoAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSetup: TfrmSetup;

implementation

uses UDatModConectar, UGlobal;

{$R *.dfm}

procedure TfrmSetup.FormCreate(Sender: TObject);
begin
  //Height := 728;
  qryPosSetupTipo.Close;
  qryPosSetupTipo.Open;
  tblPosSetupTipo.close;
  tblPosSetupTipo.open;
end;

procedure TfrmSetup.BitBtn1Click(Sender: TObject);
begin
  GlbSalvarQuery(tblPosSetup);
  GlbSalvarQuery(tblPosSetupTipo);
end;

procedure TfrmSetup.BitBtn2Click(Sender: TObject);
begin
  tblPosSetupTipo.close;
  tblPosSetupTipo.open;
end;

procedure TfrmSetup.BitBtn9Click(Sender: TObject);
begin
  tblPosSetupTipo.first;
end;

procedure TfrmSetup.BitBtn10Click(Sender: TObject);
begin
  tblPosSetupTipo.prior;
end;

procedure TfrmSetup.BitBtn11Click(Sender: TObject);
begin
  tblPosSetupTipo.next;
end;

procedure TfrmSetup.BitBtn12Click(Sender: TObject);
begin
  tblPosSetupTipo.Last;
end;

procedure TfrmSetup.qryPosSetupTipoAfterScroll(DataSet: TDataSet);
begin
  if not chkBoxMostrarTodo.Checked then
  begin
    tblPosSetup.Close;
    tblPosSetup.Params[0].Value:= tblPosSetupTipoTIPO.Value;
    tblPosSetup.Params[1].Value:= tblPosSetupTipoTIPO.Value;
    tblPosSetup.Open;
  end else
  begin
    tblPosSetup.Close;
    tblPosSetup.Params[0].Value:= 0;
    tblPosSetup.Params[1].Value:= 5000;
    tblPosSetup.Open;
  end;
end;

end.
