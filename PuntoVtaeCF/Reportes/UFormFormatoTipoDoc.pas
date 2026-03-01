unit UFormFormatoTipoDoc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBTable, StdCtrls, ExtCtrls, DBCtrls,
  RxDBComb, WinSkinData, Buttons, Grids, DBGrids, RxDBCtrl, Mask, RxCtrls;

type
  TfrmFormatoReportes = class(TForm)
    tblFormatoReporte: TIBTable;
    tblFormatoReporteIDREPORTE: TIntegerField;
    tblFormatoReporteTIPO_DOC: TSmallintField;
    tblFormatoReporteNOMBRE_REPORTE: TIBStringField;
    tblFormatoReporteSTATUS: TIBStringField;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton1: TSpeedButton;
    DBStatusLabel1: TDBStatusLabel;
    RxDBGrid1: TRxDBGrid;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    SkinData1: TSkinData;
    RxDBComboBox1: TRxDBComboBox;
    dstblFormatoReporte: TDataSource;
    Label3: TLabel;
    DBRadioGroup1: TDBRadioGroup;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    tblFormatoReporteRUTALOGO: TIBStringField;
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFormatoReportes: TfrmFormatoReportes;

implementation

uses UDatModConectar, UGlobal;

{$R *.dfm}

procedure TfrmFormatoReportes.BitBtn10Click(Sender: TObject);
begin
  tblFormatoReporte.prior;
end;

procedure TfrmFormatoReportes.BitBtn11Click(Sender: TObject);
begin
  tblFormatoReporte.next;
end;

procedure TfrmFormatoReportes.BitBtn12Click(Sender: TObject);
begin
  tblFormatoReporte.Last;
end;

procedure TfrmFormatoReportes.BitBtn9Click(Sender: TObject);
begin
  tblFormatoReporte.first;
end;

procedure TfrmFormatoReportes.SpeedButton1Click(Sender: TObject);
begin
  if tblFormatoReporte.State in [dsinsert, dsEdit] then
  begin
    if tblFormatoReporte.State in [dsinsert] then
    tblFormatoReporteIDREPORTE.Value:= FsqlMaxNumero('FormatoReporte','IDREPORTE');
    if tblFormatoReporteSTATUS.IsNull then
    tblFormatoReporteSTATUS.Value:='A';
    tblFormatoReporte.Post;
    tblFormatoReporte.ApplyUpdates;
    if not tblFormatoReporte.Transaction.InTransaction then
    tblFormatoReporte.Transaction.StartTransaction;
    try
      tblFormatoReporte.Transaction.CommitRetaining;
    except
    tblFormatoReporte.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmFormatoReportes.SpeedButton2Click(Sender: TObject);
begin
  if tblFormatoReporte.State = dsBrowse then
  begin
    tblFormatoReporte.Insert;
    tblFormatoReporteSTATUS.Value:='A';
    RxDBComboBox1.SetFocus;
  end;
end;

procedure TfrmFormatoReportes.SpeedButton3Click(Sender: TObject);
begin
  if tblFormatoReporte.State in [dsInsert, dsEdit] then
  begin
    tblFormatoReporte.Cancel;
  end;
end;

procedure TfrmFormatoReportes.FormCreate(Sender: TObject);
begin
  tblFormatoReporte.Close;
  tblFormatoReporte.Open;
end;

procedure TfrmFormatoReportes.BitBtn1Click(Sender: TObject);
var
  selectedFile: string;
  dlg: TOpenDialog;
begin
  tblFormatoReporte.Edit;
  selectedFile := '';
  dlg := TOpenDialog.Create(nil);
  try
    if tblFormatoReporteRUTALOGO.IsNull then
    dlg.InitialDir := 'C:\'
    else
    dlg.InitialDir := ExtractFileDir (tblFormatoReporteRUTALOGO.Value);
    dlg.Filter := 'All files (*.*)|*.*';
    if dlg.Execute then
      selectedFile := dlg.FileName;
  finally
    dlg.Free;
  end;

  if (selectedFile <> '') then
    tblFormatoReporteRUTALOGO.Value:=selectedFile;
end;

end.
