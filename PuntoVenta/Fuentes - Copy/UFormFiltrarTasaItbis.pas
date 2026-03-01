unit UFormFiltrarTasaItbis;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, StdCtrls, Buttons;

type
  TfrmFiltrarTasaItbis = class(TForm)
    qryTasaItbis: TIBQuery;
    qryTasaItbisIDTASAITBIS: TSmallintField;
    qryTasaItbisFECHAINI: TDateTimeField;
    qryTasaItbisFECHAFIN: TDateTimeField;
    qryTasaItbisDESCRIPCION: TIBStringField;
    qryTasaItbisPORCIENTO: TFloatField;
    qryTasaItbisSTATUS: TIBStringField;
    ComboBox1: TComboBox;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    _idtasa : integer;
  end;

var
  frmFiltrarTasaItbis: TfrmFiltrarTasaItbis;

implementation

uses UDatModConectar;

{$R *.dfm}

procedure TfrmFiltrarTasaItbis.FormCreate(Sender: TObject);
begin
  ComboBox1.Clear;
  qryTasaItbis.Close;
  qryTasaItbis.Open;
  qryTasaItbis.first;
  while not qryTasaItbis.eof do
  begin
    ComboBox1.Items.Add(qryTasaItbisDESCRIPCION.Value);
    qryTasaItbis.Next;
    ComboBox1.ItemIndex:=0;
  end;
end;

procedure TfrmFiltrarTasaItbis.ComboBox1Change(Sender: TObject);
begin
  if qryTasaItbis.Locate('DESCRIPCION',ComboBox1.Text,[]) then
  _idtasa:= qryTasaItbisIDTASAITBIS.Value;
end;

end.
