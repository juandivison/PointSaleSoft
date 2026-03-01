unit uFrmConsultaFactPendCxp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, RXDBCtrl, EditNew, DBCtrls,
  DB, IBCustomDataSet, IBQuery, ComCtrls, WinSkinData;

type
  TfrmFactCxpPendiente = class(TForm)
    RxDBGrid1: TRxDBGrid;
    BitBtn1: TBitBtn;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    qryProv: TIBQuery;
    dsQryProv: TDataSource;
    BitBtn2: TBitBtn;
    edtcodProv: TEditN;
    qryProvCODIGO_CTE: TIntegerField;
    qryProvDESCRIPCION: TIBStringField;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    SkinData1: TSkinData;
    procedure edtcodProvChange(Sender: TObject);
    procedure edtcodProvExit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFactCxpPendiente: TfrmFactCxpPendiente;

implementation

uses UDatModCxp, UDatModConectar, uglobal, UDatModCompania,
  URepFactPendCxp;

{$R *.dfm}

procedure TfrmFactCxpPendiente.edtcodProvChange(Sender: TObject);
begin
  if qryProv.Locate('codigo_cte', edtcodProv.ValueInteger,[loCaseInsensitive,loPartialKey]) then
  ComboBox1.ItemIndex := combobox1.Items.IndexOf(qryProvDESCRIPCION.Value);
end;

procedure TfrmFactCxpPendiente.edtcodProvExit(Sender: TObject);
begin
  if Not qryProv.Locate('codigo_cte', edtcodProv.ValueInteger, []) then
  begin
    MessageDlg('Codigo proveedor no existe?', mtInformation, [mbOK], 0);
    edtcodProv.Text:='';
  end else
  ComboBox1.ItemIndex := combobox1.Items.IndexOf(qryProvDESCRIPCION.Value);
end;

procedure TfrmFactCxpPendiente.BitBtn2Click(Sender: TObject);
begin
  dmcxp.qryFactPendCxp.close;
  dmcxp.qryFactPendCxp.params[0].Value:= ExtraerFecha(DateTimePicker1.Date);
  dmcxp.qryFactPendCxp.params[1].Value:= ExtraerFecha(DateTimePicker2.Date);
  dmcxp.qryFactPendCxp.params[2].Value:= qryProvCODIGO_CTE.Value;
  dmcxp.qryFactPendCxp.open;
end;

procedure TfrmFactCxpPendiente.FormCreate(Sender: TObject);
begin
  qryProv.close;
  qryProv.open;
  qryProv.first;
  while not qryProv.eof do
  begin
    ComboBox1.Items.Add(qryProvDESCRIPCION.Value);
    qryProv.Next;
  end;
end;

procedure TfrmFactCxpPendiente.ComboBox1Change(Sender: TObject);
begin
  qryProv.locate('DESCRIPCION', combobox1.Text,[]);
  edtcodProv.SetInteger(qryProvCODIGO_CTE.Value);
end;

procedure TfrmFactCxpPendiente.ComboBox1Click(Sender: TObject);
begin
  qryProv.locate('DESCRIPCION', combobox1.Text,[]);
  edtcodProv.SetInteger(qryProvCODIGO_CTE.Value);
end;

procedure TfrmFactCxpPendiente.BitBtn1Click(Sender: TObject);
begin
  dmcompania.tblCompania.Close;
  dmcompania.tblcompania.open;
   qckFactCxpPendientes:=TqckFactCxpPendientes.create(nil);
   try
     qckFactCxpPendientes.Preview;
   finally
   qckFactCxpPendientes.free;
   qckFactCxpPendientes:=nil;
   end;
end;

end.
