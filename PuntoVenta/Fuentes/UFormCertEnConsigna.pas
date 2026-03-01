unit UFormCertEnConsigna;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, WinSkinData, DB, IBCustomDataSet, Grids, DBGrids,
  RxDBCtrl, IBQuery, RxCtrls, Buttons, ExtCtrls;

type
  TfrmCertAsigAgente = class(TForm)
    tblCertAsignadoAgente: TIBDataSet;
    SkinData1: TSkinData;
    Label55: TLabel;
    cboxAgente: TComboBox;
    qryEmpCodV: TIBQuery;
    qryEmpCodVCODIGO: TIntegerField;
    qryEmpCodVNOMBRE: TIBStringField;
    qryEmpCodVAPELLIDO: TIBStringField;
    qryEmpCodVNOMBRECOMPLETO: TIBStringField;
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
    tblCertAsignadoAgenteIDCERTMASTER: TIntegerField;
    tblCertAsignadoAgenteNUMERO_CERTIFICADO: TIntegerField;
    tblCertAsignadoAgenteCODIGO_AGENTE: TIntegerField;
    tblCertAsignadoAgenteNOMBREAGENTE: TIBStringField;
    tblCertAsignadoAgenteFECHA_IN: TDateTimeField;
    BitBtn3: TBitBtn;
    edtNumCert: TEdit;
    Label2: TLabel;
    qryEstadoCert: TIBQuery;
    BitBtn4: TBitBtn;
    qryRelacionCert: TIBQuery;
    qryRelacionCertSERIE: TIntegerField;
    qryRelacionCertCODIGO: TIntegerField;
    qryRelacionCertNUMERO_CERTIFICADO: TIntegerField;
    qryRelacionCertCODIGO_CLIENTE: TIntegerField;
    qryRelacionCertCODIGO_AGENTE: TIntegerField;
    qryRelacionCertNOMBREAGENTE: TIBStringField;
    qryRelacionCertSTATUS: TIBStringField;
    qryRelacionCertSTATUSCXC: TIBStringField;
    qryRelacionCertCODIGO_CTE: TIntegerField;
    qryRelacionCertNOMBRE_CLIENTE: TIBStringField;
    qryRelacionCertESTADO: TIBStringField;
    qryRelacionCertFECHA_VENCE_GARANTIA: TDateTimeField;
    cboxEstados: TComboBox;
    Label3: TLabel;
    qryEstadoCertESTADO: TIBStringField;
    edtNumCertIni: TEdit;
    edtNumCertFin: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    qryRelacionCertBase: TIBQuery;
    BitBtn5: TBitBtn;
    RxDBGrid1: TRxDBGrid;
    DataSource2: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure cboxAgenteChange(Sender: TObject);
    procedure tblCertAsignadoAgenteFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure btnModificarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnCerarAbrirresClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure edtNumCertChange(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure qryRelacionCertFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure BitBtn5Click(Sender: TObject);
  private
    procedure ProcDatosEstados(_t : smallint);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCertAsigAgente: TfrmCertAsigAgente;
  codAgente : integer;
implementation

uses UDatModConectar,UGlobal;

{$R *.dfm}

procedure TfrmCertAsigAgente.FormCreate(Sender: TObject);
begin
  //CERTConsignados
  qryEmpCodV.close;
  qryEmpCodV.Open;
  qryEmpCodV.First;
  cboxAgente.Clear;
  while not qryEmpCodV.Eof do
  begin
    cboxAgente.Items.Add(qryEmpCodVNOMBRECOMPLETO.Value);
    qryEmpCodV.next;
  end;
  cboxAgente.Items.Add('Todos');
  cboxAgente.Text:= 'Todos';//qryEmpCodVNOMBRECOMPLETO.Value;
  cboxAgenteChange(Self);
  tblCertAsignadoAgente.close;
  tblCertAsignadoAgente.Open;
  cboxEstados.Clear;
  qryEstadoCert.Close;
  qryEstadoCert.open;
  qryEstadoCert.First;
  while Not qryEstadoCert.Eof do
  begin
    cboxEstados.Items.Add(qryEstadoCertESTADO.Value);
    qryEstadoCert.Next;
  end;
  cboxEstados.Items.Add('TODOS');
  cboxEstados.Text:='TODOS';
end;

procedure TfrmCertAsigAgente.cboxAgenteChange(Sender: TObject);
begin
  if (cboxAgente.Text = 'Todos') then
  begin
    codAgente:=-1;
    tblCertAsignadoAgente.Filtered:=False;
    Label1.Visible:=False;
  end else
  if qryEmpCodV.locate('NOMBRECOMPLETO',cboxAgente.Text,[]) then
  begin
    tblCertAsignadoAgente.Filtered := False;
    codAgente:= qryEmpCodVCODIGO.Value;
    tblCertAsignadoAgente.Filtered:=True;
    Label1.Caption:='*** Filtrado ***';
    Label1.Visible:=true;
  end;// else
  //if codAgente > 0 then
  //tblCertAsignadoAgente.Filtered:=True
  //else tblCertAsignadoAgente.Filtered:=False;
end;

procedure TfrmCertAsigAgente.tblCertAsignadoAgenteFilterRecord(
  DataSet: TDataSet; var Accept: Boolean);
begin
  if codAgente > 0 then
  Accept:= Dataset['CODIGO_AGENTE'] = codAgente;
end;

procedure TfrmCertAsigAgente.btnModificarClick(Sender: TObject);
begin
  tblCertAsignadoAgente.Edit;
end;

procedure TfrmCertAsigAgente.btnSalvarClick(Sender: TObject);
begin
  GlbSalvarQuery(tblCertAsignadoAgente);
end;

procedure TfrmCertAsigAgente.BitBtn1Click(Sender: TObject);
begin
  if MessageDlg('Desea eliminar record?', mtInformation,[mbYes,mbNo],0) = mryes then
  begin
    tblCertAsignadoAgente.Delete;
    GlbSalvarQuery(tblCertAsignadoAgente);
  end;
end;

procedure TfrmCertAsigAgente.btnCerarAbrirresClick(Sender: TObject);
begin
  tblCertAsignadoAgente.Close;
  tblCertAsignadoAgente.Open;
end;

procedure TfrmCertAsigAgente.BitBtn3Click(Sender: TObject);
begin
  GLBMostrarArchivo:=True;
  if (Not DirectoryExists('Informes')) then
  CreateDir('Informes');
  
  if tblCertAsignadoAgente.Filtered then
  ExporToExcelCert(tblCertAsignadoAgente,GlbRutaInformes+'\CertificadosAsignados_'+cboxAgente.Text)
  else
  ExporToExcelCert(tblCertAsignadoAgente,GlbRutaInformes+'\CertificadosAsignados');
end;

procedure TfrmCertAsigAgente.edtNumCertChange(Sender: TObject);
begin
  tblCertAsignadoAgente.Locate('NUMERO_CERTIFICADO',edtNumCert.Text,[loCaseInsensitive,loPartialKey]);
end;

procedure TfrmCertAsigAgente.BitBtn4Click(Sender: TObject);
begin
  ProcDatosEstados(1);
end;

procedure TfrmCertAsigAgente.qryRelacionCertFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
{  if (Uppercase(ComboBox1.Text) = 'CANCELADO') then
  Accept:=Dataset['STATUS'] = UpperCase(ComboBox1.Text);
  else
  Accept:=Dataset'Estado'] = UpperCase(ComboBox1.Text);}
end;

procedure TfrmCertAsigAgente.BitBtn5Click(Sender: TObject);
begin
  RxDBGrid1.Top:=48;
  RxDBGrid1.Height:=345;
  RxDBGrid1.Visible:=True;
  RxDBGrid1.BringToFront;
  RxDBGrid2.Visible:=False;
  ProcDatosEstados(0);
end;

procedure TfrmCertAsigAgente.ProcDatosEstados(_t : smallint);
begin
  GLBMostrarArchivo:=True;
  if (Not DirectoryExists('Informes')) then
  CreateDir('Informes');
  cboxAgenteChange(Self);
  qryRelacionCert.close;
  if (codAgente > 0)  then
  begin
    qryRelacionCert.SQL.Text:= qryRelacionCertBase.SQL.Text;
    qryRelacionCert.SQL.Add('Where a.CODIGO_AGENTE = :codigoagente) ');
    qryRelacionCert.SQL.Add('Select Distinct  datos.* ');
    qryRelacionCert.SQL.Add('From datos ');
    if (UpperCase(cboxEstados.Text) <> 'TODOS' ) THEN
    begin
      if (UpperCase(cboxEstados.Text) = 'CANCELADO') then
      qryRelacionCert.SQL.Add('Where status = '+chr(39)+'CANCELADO'+chr(39))
      else
      qryRelacionCert.SQL.Add('Where (status <>'+chr(39)+'CANCELADO'+chr(39)+') and (estado = '+chr(39)+cboxEstados.Text+chr(39)+')');
    end;
    qryRelacionCert.SQL.Add('Order by datos.NUMERO_CERTIFICADO');
    qryRelacionCert.params[0].Value:= codAgente;
    qryRelacionCert.open;
  end else
  begin
    qryRelacionCert.SQL.Text:= qryRelacionCertBase.SQL.Text;
    if (edtNumCertIni.Text <> '') and (edtNumCertIni.Text <> '') then
    begin
      qryRelacionCert.SQL.Add('Where numero_certificado between :cini and :cfin');
      qryRelacionCert.params[0].Value:= StrToInt(edtNumCertIni.Text);
      qryRelacionCert.params[1].Value:= StrToInt(edtNumCertFin.Text);
    end;
    qryRelacionCert.SQL.Add(') Select Distinct  datos.* ');
    qryRelacionCert.SQL.Add('From datos ');
    if (UpperCase(cboxEstados.Text) <> 'TODOS' ) THEN
    begin
      if (UpperCase(cboxEstados.Text) = 'CANCELADO') then
      qryRelacionCert.SQL.Add('Where status = '+chr(39)+'CANCELADO'+chr(39))
      else
      qryRelacionCert.SQL.Add('Where (status <>'+chr(39)+'CANCELADO'+chr(39)+') and (estado = '+chr(39)+cboxEstados.Text+chr(39)+')');
    end;
    qryRelacionCert.SQL.Add('Order by datos.NUMERO_CERTIFICADO');
                    //qryRelacionCert.sql.text
    qryRelacionCert.open;
  end;
  //qryRelacionCert.Filtered:=False;
  //if (Uppercase(ComboBox1.Text) <> 'TODOS') then
  //qryRelacionCert.Filtered:=True;
  qryRelacionCert.First;
  if (_t = 1) then
  begin
    if qryRelacionCert.RecordCount > 0 then
    ExporToExcelCertQ(qryRelacionCert,GlbRutaInformes+'\EstadoCertificadosAsignados_'+cboxAgente.Text)
    else
    begin
      MessageDlg('No existen datos para agente indicado, verifique.',mtinformation,[mbok],0);
    end;
  end;
  //else
  //ExporToExcelCertQ(qryRelacionCert,GlbRutaInformes+'\EstadoCertificadosAsignados');
end;

end.
