unit UFormCertEnCxc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, RxDBCtrl, IBCustomDataSet, StdCtrls, Buttons,
  ExtCtrls, IBQuery, WinSkinData;

type
  TfrmCertificadosEnCxc = class(TForm)
    tblCertificadosCte: TIBDataSet;
    tblCertificadosCteSERIE: TIntegerField;
    tblCertificadosCteCODIGO: TIntegerField;
    tblCertificadosCteNUMERO_CERTIFICADO: TIntegerField;
    tblCertificadosCteCODIGO_CLIENTE: TIntegerField;
    tblCertificadosCteFECHA_IN: TDateTimeField;
    tblCertificadosCteIN_POR: TIBStringField;
    tblCertificadosCteFECHA_MOD: TDateTimeField;
    tblCertificadosCteMOD_POR: TIBStringField;
    tblCertificadosCteSTATUS: TIBStringField;
    RxDBGrid1: TRxDBGrid;
    dstblCertificadosCte: TDataSource;
    tblCertificadosCteSTATUSCXC: TIBStringField;
    btnAsignarSec: TBitBtn;
    BitBtn1: TBitBtn;
    CheckBox1: TCheckBox;
    tblCertNoAsignados: TIBDataSet;
    tblCertNoAsignadosSERIE: TIntegerField;
    tblCertNoAsignadosCODIGO: TIntegerField;
    tblCertNoAsignadosNUMERO_CERTIFICADO: TIntegerField;
    tblCertNoAsignadosCODIGO_CLIENTE: TIntegerField;
    tblCertNoAsignadosFECHA_IN: TDateTimeField;
    tblCertNoAsignadosIN_POR: TIBStringField;
    tblCertNoAsignadosFECHA_MOD: TDateTimeField;
    tblCertNoAsignadosMOD_POR: TIBStringField;
    tblCertNoAsignadosSTATUS: TIBStringField;
    tblCertNoAsignadosSTATUSCXC: TIBStringField;
    dstblCertNoAsignados: TDataSource;
    RxDBGrid2: TRxDBGrid;
    BitBtn2: TBitBtn;
    edtCertificado: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    cboxCliente: TComboBox;
    edtCodCliente: TEdit;
    rdgFiltrar: TRadioGroup;
    qryClientes: TIBQuery;
    qryClientesCODIGO_CTE: TIntegerField;
    qryClientesNOMBRECLIENTE: TIBStringField;
    SkinData1: TSkinData;
    tblCertNoAsignadosNOMBRECLIENTE: TIBStringField;
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure btnAsignarSecClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure tblCertNoAsignadosFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure rdgFiltrarClick(Sender: TObject);
    procedure cboxClienteChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure edtCertificadoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    xCodCte : Integer;
  end;

var
  frmCertificadosEnCxc: TfrmCertificadosEnCxc;

implementation
  uses UDatModConectar, UGlobal;
  
{$R *.dfm}

procedure TfrmCertificadosEnCxc.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if (tblCertificadosCteSTATUSCXC.Value = 'A') then
  begin
    BackGround:= clGreen;
  end;
end;

procedure TfrmCertificadosEnCxc.btnAsignarSecClick(Sender: TObject);
var
      i, j: Integer;
      s: string;
begin
  if RxDBGrid1.SelectedRows.Count>0 then
  for i:=0 to RxDBGrid1.SelectedRows.Count-1 do
  begin
    rxDBGrid1.DataSource.DataSet.GotoBookmark(pointer(rxDBGrid1.SelectedRows.Items[i]));
    tblCertificadosCte.Edit;
    if (tblCertificadosCteSTATUSCXC.IsNull or
       (tblCertificadosCteSTATUSCXC.Value = 'A')) then
    begin
      tblCertificadosCte.Edit;
      tblCertificadosCteSTATUSCXC.Value:='R';
      tblCertificadosCteFECHA_MOD.Value:=now;
      tblCertificadosCteMOD_POR.Value:=trim(strusername);
      GlbSalvarQuery(tblCertificadosCte);
    end;
  end;
end;

procedure TfrmCertificadosEnCxc.BitBtn1Click(Sender: TObject);
var
  i, j: Integer;
  s: string;
begin
  if RxDBGrid1.SelectedRows.Count>0 then
  for i:=0 to RxDBGrid1.SelectedRows.Count-1 do
  begin
    rxDBGrid1.DataSource.DataSet.GotoBookmark(Pointer(rxDBGrid1.SelectedRows.Items[i]));
    tblCertificadosCte.Edit;
    if (tblCertificadosCteSTATUSCXC.Value = 'R') then
    begin
      tblCertificadosCte.Edit;
      tblCertificadosCteSTATUSCXC.Value:= 'A';
      tblCertificadosCteFECHA_MOD.Value:= Now;
      tblCertificadosCteMOD_POR.Value  := Trim(StrUserName);
      GlbSalvarQuery(tblCertificadosCte);
    end;
  end;
end;

procedure TfrmCertificadosEnCxc.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
  RxDBGrid1.SelectAll
  else
  RxDBGrid1.UnselectAll;
end;

procedure TfrmCertificadosEnCxc.tblCertNoAsignadosFilterRecord(
 DataSet: TDataSet; var Accept: Boolean);
begin
  if rdgFiltrar.ItemIndex = 0 then
  begin
    if (Trim(edtCertificado.Text) <> '') then
    Accept:= DataSet['NUMERO_CERTIFICADO'] = Trim(edtCertificado.Text)
  end else
  if rdgFiltrar.ItemIndex = 1 then
  begin
    if (Trim(edtCodCliente.Text) <> '') then
    Accept:= DataSet['CODIGO_CLIENTE'] = StrToInt(edtCodCliente.Text);
  end;
  //else
  //if rdgFiltrar.ItemIndex = 2 then
  //Accept:= DataSet['NUMERO_CERTIFICADO'] = Trim(edtCertificado.Text);
end;

procedure TfrmCertificadosEnCxc.rdgFiltrarClick(Sender: TObject);
begin
  tblCertNoAsignados.Filtered:=False;
  if (rdgFiltrar.ItemIndex = 0) and (edtCertificado.Text = '')  then
  begin
    edtCertificado.SetFocus;
    exit;
  end;
  if (edtCertificado.Text <> '') or (edtCodCliente.Text <> '') then
  tblCertNoAsignados.Filtered:=True;
end;

procedure TfrmCertificadosEnCxc.cboxClienteChange(Sender: TObject);
begin
  if qryClientes.Locate('NOMBRECLIENTE',cboxCliente.Text,[]) then
  begin
    //codCliente:= qryClientesCODIGO_CTE.Value;
    edtCodCliente.Text := qryClientesCODIGO_CTE.AsString;
  end;
end;

procedure TfrmCertificadosEnCxc.FormCreate(Sender: TObject);
begin
  qryClientes.close;
  qryClientes.Open;
  qryClientes.first;
  cboxCliente.Clear();
  while not qryClientes.Eof do
  begin
    cboxCliente.Items.Add(qryClientesNOMBRECLIENTE.Value);
    qryClientes.next;
  end;
  cboxCliente.Text:=qryClientesNOMBRECLIENTE.Value;
  cboxClienteChange(Self);
  tblCertNoAsignados.Close;
  tblCertNoAsignados.Open;
  tblCertificadosCte.Close;
  tblCertificadosCte.Open;
end;

procedure TfrmCertificadosEnCxc.BitBtn2Click(Sender: TObject);
var
  i, j: Integer;
  s: string;
  certInt : Integer;
begin
  if (edtCodCliente.Text = '') then
  edtCodCliente.Text:='';
  certInt:=-1;
  if RxDBGrid2.SelectedRows.Count = 0 then
  begin
    MessageDlg('Debe seleccionar uno o mas records',mtInformation,[mbok],0);
    RxDBGrid2.FixedColor:=$008CFFFF;
    Exit;
  end;
  if RxDBGrid2.SelectedRows.Count>0 then
  for i:=0 to RxDBGrid2.SelectedRows.Count-1 do
  begin
    rxDBGrid2.DataSource.DataSet.GotoBookmark(Pointer(rxDBGrid2.SelectedRows.Items[i]));
    tblCertificadosCte.Edit;
    if (tblCertificadosCteCODIGO_CLIENTE.IsNull) then
    begin
       certInt:=tblCertificadosCteNUMERO_CERTIFICADO.Value;
      tblCertificadosCte.Edit;
      tblCertificadosCteCODIGO_CLIENTE.Value:= StrToInt(edtCodCliente.Text);
      tblCertificadosCteFECHA_MOD.Value:= Now;
      tblCertificadosCteMOD_POR.Value  := Trim(StrUserName);
      GlbSalvarQuery(tblCertificadosCte);
    end;
  end;
  tblCertificadosCte.Close;
  tblCertificadosCte.params[0].Value:= tblCertificadosCteCODIGO_CLIENTE.Value;
  tblCertificadosCte.Open;
  if certInt >  0 then
  tblCertificadosCte.Locate('NUMERO_CERTIFICADO',certInt,[]);
end;

procedure TfrmCertificadosEnCxc.edtCertificadoExit(Sender: TObject);
begin
  if (edtCertificado.Text <> '') or (edtCodCliente.Text <> '') then
  begin
    tblCertNoAsignados.Filtered:=False;
    tblCertNoAsignados.Filtered:=True;
  end;
end;

end.
