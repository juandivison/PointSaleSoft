unit UBorrarNifDuplicado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBTable, StdCtrls, Buttons, Grids, DBGrids,
  RxDBCtrl, IBQuery, WinSkinData;

type
  TfrmEliminaNIFDuplicado = class(TForm)
    dstblNIFCtrl: TDataSource;
    tblNiFCtrl: TIBDataSet;
    tblNiFCtrlNUMERO_TRN: TIntegerField;
    tblNiFCtrlNIF: TIBStringField;
    tblNiFCtrlFECHA_IN: TDateTimeField;
    tblNiFCtrlFECHA_UPDATE: TDateTimeField;
    tblNiFCtrlSTATUS: TIBStringField;
    RxDBGrid1: TRxDBGrid;
    BitBtn1: TBitBtn;
    qryViewNifDup: TIBQuery;
    dsqryViewNifDup: TDataSource;
    qryViewNifDupNUMERO_TRN: TIntegerField;
    qryViewNifDupNIF: TIBStringField;
    qryViewNifDupFECHA_IN: TDateTimeField;
    qryViewNifDupFECHA_UPDATE: TDateTimeField;
    qryViewNifDupSTATUS: TIBStringField;
    RxDBGrid2: TRxDBGrid;
    SkinData1: TSkinData;
    Label1: TLabel;
    tblVtaMaster: TIBDataSet;
    tblVtaMasterNUMERO: TIntegerField;
    tblVtaMasterNIF_IMPRESO: TSmallintField;
    tblVtaMasterFECHA_MOD: TDateTimeField;
    tblVtaMasterMOD_POR: TIBStringField;
    dstblVtaMaster: TDataSource;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure qryViewNifDupAfterScroll(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure RxDBGrid2GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEliminaNIFDuplicado: TfrmEliminaNIFDuplicado;

implementation

uses UDatModConectar, UGlobal;

{$R *.dfm}

procedure TfrmEliminaNIFDuplicado.BitBtn1Click(Sender: TObject);
begin
  GlbSalvarQuery(tblNiFCtrl);
  if (tblNiFCtrlNIF.IsNull or (tblNiFCtrlNIF.Value = '')) then
  begin
    tblVtaMaster.Close;
    tblVtaMaster.Params[0].Value:= tblNiFCtrlNUMERO_TRN.Value;
    tblVtaMaster.Open;
    if tblVtaMaster.RecordCount = 1 then
    begin
      tblVtaMaster.Edit;
      tblVtaMasterNIF_IMPRESO.Value := 0;
      tblVtaMasterFECHA_MOD.Value := now;
      tblVtaMasterMOD_POR.Value:= StrUserName;
      GlbSalvarQuery(tblVtaMaster);
    end;
  end;
end;

procedure TfrmEliminaNIFDuplicado.FormCreate(Sender: TObject);
begin
  qryViewNifDup.Close;
  qryViewNifDup.Open;
end;

procedure TfrmEliminaNIFDuplicado.qryViewNifDupAfterScroll(
  DataSet: TDataSet);
begin
  tblNiFCtrl.Close;
  tblNiFCtrl.Params[0].Value:= qryViewNifDupNIF.Value;
  tblNiFCtrl.Open;
  tblNiFCtrl.Locate('NUMERO_TRN',qryViewNifDupNUMERO_TRN.Value,[]);
end;

procedure TfrmEliminaNIFDuplicado.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  IF tblNiFCtrl.UpdatesPending THEN
  begin
    if MessageDlg('Tienes una transaccion pendiente, desea salir?',mtwarning,[mbyes,mbno],0) = mryes then
    CanClose:=False
    else
    CanClose:=true;
  end;
end;

procedure TfrmEliminaNIFDuplicado.RxDBGrid1GetCellParams(Sender: TObject;
 Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if (tblNiFCtrlSTATUS.Value = 'T') then
  BackGround:= clYellow;
end;

procedure TfrmEliminaNIFDuplicado.RxDBGrid2GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if (qryViewNifDupSTATUS.Value = 'A') then
  BackGround:= clYellow;
end;

end.
