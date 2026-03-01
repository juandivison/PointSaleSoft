unit UFormCertConsignados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, WinSkinData, DB, IBCustomDataSet, Grids, DBGrids,
  RxDBCtrl, IBQuery, RxCtrls, Buttons, ExtCtrls;

type
  TfrmCertConsignados = class(TForm)
    tblCertConsignados: TIBDataSet;
    SkinData1: TSkinData;
    Label55: TLabel;
    cboxClientes: TComboBox;
    qryClientes: TIBQuery;
    RxDBGrid2: TRxDBGrid;
    DataSource1: TDataSource;
    Label1: TLabel;
    DBStatusLabel1: TDBStatusLabel;
    Panel1: TPanel;
    btnModificar: TBitBtn;
    btnSalvar: TBitBtn;
    btnCerarAbrirres: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    qryClientesCODIGO_CTE: TIntegerField;
    qryClientesNOMBRECLIENTE: TIBStringField;
    tblCertConsignadosIDCERTMASTER: TIntegerField;
    tblCertConsignadosNUMERO_CERTIFICADO: TIntegerField;
    tblCertConsignadosCODIGO_CLIENTE: TIntegerField;
    tblCertConsignadosNOMBRECLIENTE: TIBStringField;
    tblCertConsignadosFECHA_IN: TDateTimeField;
    BitBtn3: TBitBtn;
    edtNumCert: TEdit;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure cboxClientesChange(Sender: TObject);
    procedure tblCertConsignadosFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure btnModificarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnCerarAbrirresClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure edtNumCertChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCertConsignados: TfrmCertConsignados;
  codAgente : integer;
implementation

uses UDatModConectar,UGlobal, UFormCertEnConsigna;

{$R *.dfm}

procedure TfrmCertConsignados.FormCreate(Sender: TObject);
begin
  //CERTConsignados
  qryClientes.close;
  qryClientes.Open;
  qryClientes.First;
  cboxClientes.clear;
  while not qryClientes.Eof do
  begin
    cboxClientes.Items.Add(qryClientesNOMBRECLIENTE.Value);
    qryClientes.next;
  end;
  cboxClientes.Items.Add('Todos');
  cboxClientes.Text:= 'Todos';//qryEmpCodVNOMBRECOMPLETO.Value;
  cboxClientesChange(Self);
  tblCertConsignados.close;
  tblCertConsignados.Open;
end;

procedure TfrmCertConsignados.cboxClientesChange(Sender: TObject);
begin
  if (cboxClientes.Text = 'Todos') then
  begin
    codAgente:=-1;
    tblCertConsignados.Filtered:=False;
    Label1.Visible:=False;
  end else
  if qryClientes.locate('NOMBRECLIENTE',cboxClientes.Text,[]) then
  begin
    tblCertConsignados.Filtered := False;
    codAgente:= qryClientesCODIGO_CTE.Value;
    tblCertConsignados.Filtered:=True;
    Label1.Caption:='*** Filtrado ***';
    Label1.Visible:=true;
  end;// else
  //if codAgente > 0 then
  //tblCertConsignados.Filtered:=True
  //else tblCertConsignados.Filtered:=False;
end;

procedure TfrmCertConsignados.tblCertConsignadosFilterRecord(
  DataSet: TDataSet; var Accept: Boolean);
begin
  if codAgente > 0 then
  Accept:= Dataset['CODIGO_CLIENTE'] = codAgente;
end;

procedure TfrmCertConsignados.btnModificarClick(Sender: TObject);
begin
  tblCertConsignados.Edit;
end;

procedure TfrmCertConsignados.btnSalvarClick(Sender: TObject);
begin
  GlbSalvarQuery(tblCertConsignados);
end;

procedure TfrmCertConsignados.BitBtn1Click(Sender: TObject);
begin
  if MessageDlg('Desea eliminar record?', mtInformation,[mbYes, mbNo],0) = mryes then
  begin
    tblCertConsignados.Delete;
    GlbSalvarQuery(tblCertConsignados);
  end;
end;

procedure TfrmCertConsignados.btnCerarAbrirresClick(Sender: TObject);
begin
  tblCertConsignados.Close;
  tblCertConsignados.Open;
end;

procedure TfrmCertConsignados.BitBtn3Click(Sender: TObject);
begin
  GLBMostrarArchivo := True;
  if (Not DirectoryExists('Informes')) then
  CreateDir('Informes');

  if tblCertConsignados.Filtered then
  ExporToExcelCert(tblCertConsignados,GlbRutaInformes+'\CertificadosConsignado' + cboxClientes.Text)
  else
  ExporToExcelCert(tblCertConsignados,GlbRutaInformes+'\CertificadosConsignado');
end;

procedure TfrmCertConsignados.edtNumCertChange(Sender: TObject);
begin
  tblCertConsignados.Locate('NUMERO_CERTIFICADO',edtNumCert.Text,[loCaseInsensitive,loPartialKey]);
end;

end.
