unit UFormInvCertificado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, StdCtrls, Mask, DBCtrls, Grids, DBGrids,
   RxDBCtrl, RxToolEdit, Buttons, ExtCtrls, WinSkinData, IBQuery, RxCtrls,
  RxLookup, IBUpdateSQL, RxDBFilter;

type
  TfrmInvCertificados = class(TForm)
    tblInvCertificados: TIBDataSet;
    dstblInvCertificados: TDataSource;
    Label2: TLabel;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    DBDateEdit1: TDBDateEdit;
    RxDBGrid1: TRxDBGrid;
    Panel1: TPanel;
    btnInsertar: TBitBtn;
    btnModificar: TBitBtn;
    btnSalvar: TBitBtn;
    btnCancelar: TBitBtn;
    btnCerarAbrirres: TBitBtn;
    BitBtn2: TBitBtn;
    SkinData1: TSkinData;
    qryUltimaFecha: TIBQuery;
    qryUltimaFechaULTIMAFECHA: TDateTimeField;
    tblInvCertificadosCODIGO: TIntegerField;
    tblInvCertificadosFECHA_INI: TDateTimeField;
    tblInvCertificadosFECHA_FIN: TDateTimeField;
    tblInvCertificadosSECUENCIA_INICIAL: TIntegerField;
    tblInvCertificadosSECUENCIA_FINAL: TIntegerField;
    tblInvCertificadosSECUENCIA_ACTUAL: TIntegerField;
    tblInvCertificadosFECHA_IN: TDateTimeField;
    tblInvCertificadosIN_POR: TIBStringField;
    tblInvCertificadosFECHA_MOD: TDateTimeField;
    tblInvCertificadosMOD_POR: TIBStringField;
    DBStatusLabel1: TDBStatusLabel;
    BitBtn1: TBitBtn;
    btnAsignarSec: TBitBtn;
    qryBuscarSec: TIBQuery;
    qryBuscarSecCODIGO: TIntegerField;
    qryBuscarSecFECHA_INI: TDateTimeField;
    qryBuscarSecFECHA_FIN: TDateTimeField;
    qryBuscarSecSECUENCIA_INICIAL: TIntegerField;
    qryBuscarSecSECUENCIA_FINAL: TIntegerField;
    qryBuscarSecSECUENCIA_ACTUAL: TIntegerField;
    qryBuscarSecFECHA_IN: TDateTimeField;
    qryBuscarSecIN_POR: TIBStringField;
    qryBuscarSecFECHA_MOD: TDateTimeField;
    qryBuscarSecMOD_POR: TIBStringField;
    RxDBGrid2: TRxDBGrid;
    tblInvCertificadosDet: TIBDataSet;
    tblInvCertificadosDetSERIE: TIntegerField;
    tblInvCertificadosDetCODIGO: TIntegerField;
    tblInvCertificadosDetNUMERO_CERTIFICADO: TIntegerField;
    tblInvCertificadosDetCODIGO_CLIENTE: TIntegerField;
    tblInvCertificadosDetFECHA_IN: TDateTimeField;
    tblInvCertificadosDetIN_POR: TIBStringField;
    tblInvCertificadosDetFECHA_MOD: TDateTimeField;
    tblInvCertificadosDetMOD_POR: TIBStringField;
    dstblInvCertificadosDet: TDataSource;
    tblInvCertificadosDetNOMBRECLIENTE: TIBStringField;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    tblCertAsignadoAgente: TIBDataSet;
    Label55: TLabel;
    cboxAgente: TComboBox;
    qryEmpCodV: TIBQuery;
    qryEmpCodVCODIGO: TIntegerField;
    qryEmpCodVNOMBRE: TIBStringField;
    qryEmpCodVAPELLIDO: TIBStringField;
    qryEmpCodVNOMBRECOMPLETO: TIBStringField;
    tblCertAsignadoAgenteIDCERTMASTER: TIntegerField;
    tblCertAsignadoAgenteNUMERO_CERTIFICADO: TIntegerField;
    tblCertAsignadoAgenteCODIGO_AGENTE: TIntegerField;
    tblCertAsignadoAgenteFECHA_IN: TDateTimeField;
    tblCertAsignadoAgenteIN_POR: TIBStringField;
    tblCertAsignadoAgenteFECHA_MOD: TDateTimeField;
    tblCertAsignadoAgenteMOD_POR: TIBStringField;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    Label1: TLabel;
    cboxCliente: TComboBox;
    qryClientes: TIBQuery;
    qryClientesCODIGO_CTE: TIntegerField;
    qryClientesNOMBRECLIENTE: TIBStringField;
    tblCertConsignados: TIBDataSet;
    tblInvCertificadosDetCODCTECONSIGNADO: TIntegerField;
    tblInvCertificadosDetCODAGENTEASIGNADO: TIntegerField;
    tblCertConsignadosIDCERTMASTER: TIntegerField;
    tblCertConsignadosNUMERO_CERTIFICADO: TIntegerField;
    tblCertConsignadosCODIGO_CLIENTE: TIntegerField;
    tblCertConsignadosNOMBRECLIENTE: TIBStringField;
    tblCertConsignadosFECHA_IN: TDateTimeField;
    BitBtn8: TBitBtn;
    qryRepCert: TIBQuery;
    edtCodAgente: TEdit;
    edtCodCliente: TEdit;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    BitBtn9: TBitBtn;
    tblInvCertificadosDetSTATUS: TIBStringField;
    BitBtn10: TBitBtn;
    qryVerAsignado: TIBQuery;
    tblInvCertificadosDetNOMBREAGENTE: TIBStringField;
    BitBtn11: TBitBtn;
    Edit1: TEdit;
    Label9: TLabel;
    BitBtn12: TBitBtn;
    BitBtn13: TBitBtn;
    Label10: TLabel;
    qryLookCert: TIBQuery;
    qryLookCertCODIGO: TIntegerField;
    qryLookCertNUMERO_CERTIFICADO: TIntegerField;
    tblDatosVehiculos: TIBDataSet;
    tblDatosVehiculosSTATUSCXC: TIBStringField;
    tblInvCertCodcte: TIBDataSet;
    tblInvCertCodcteNUMERO_CERTIFICADO: TIntegerField;
    tblInvCertCodcteFECHA_MOD: TDateTimeField;
    tblInvCertCodcteMOD_POR: TIBStringField;
    tblInvCertCodcteCODIGO_CLIENTE: TIntegerField;
    tblInvCert: TIBDataSet;
    tblInvCertCODIGO: TIntegerField;
    tblInvCertFECHA_INI: TDateTimeField;
    tblInvCertFECHA_FIN: TDateTimeField;
    tblInvCertSECUENCIA_INICIAL: TIntegerField;
    tblInvCertSECUENCIA_FINAL: TIntegerField;
    tblInvCertSECUENCIA_ACTUAL: TIntegerField;
    tblInvCertFECHA_IN: TDateTimeField;
    tblInvCertIN_POR: TIBStringField;
    tblInvCertFECHA_MOD: TDateTimeField;
    tblInvCertMOD_POR: TIBStringField;
    tblInvCertificadosDetSTATUSCXC: TIBStringField;
    RxDBGridSorter1: TRxDBGridSorter;
    chkBoxAsignarCte: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure btnCerarAbrirresClick(Sender: TObject);
    procedure btnInsertarClick(Sender: TObject);
    procedure btnModificarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure tblInvCertificadosAfterScroll(DataSet: TDataSet);
    procedure BitBtn3Click(Sender: TObject);
    procedure tblInvCertificadosAfterPost(DataSet: TDataSet);
    procedure BitBtn4Click(Sender: TObject);
    procedure RxDBGrid2GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure cboxAgenteChange(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure cboxClienteChange(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure edtCodAgenteExit(Sender: TObject);
    procedure edtCodClienteExit(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
  private
    { Private declarations }
    function VerificarCertDet: Boolean;
  public
    { Public declarations }
    _secCert : Integer;
  end;

var
  frmInvCertificados: TfrmInvCertificados;
  codAgente : integer;
  codCliente: integer;
implementation

uses UDatModConectar,UGlobal, UFormCertEnConsigna, UFormCertConsignados,
  UFormConsultaCertAvanzado;


{$R *.dfm}

procedure TfrmInvCertificados.FormCreate(Sender: TObject);
begin
  if GlbModeEdit then exit;
  tblInvCertificados.close;
  tblInvCertificados.open;
  qryEmpCodV.close;
  qryEmpCodV.Open;
  qryEmpCodV.first;
  cboxAgente.clear;
  while not qryEmpCodV.Eof do
  begin
    cboxAgente.Items.Add(qryEmpCodVNOMBRECOMPLETO.Value);
    qryEmpCodV.next;
  end;
  cboxAgente.Text:=qryEmpCodVNOMBRECOMPLETO.Value;
  cboxAgenteChange(Self);

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
end;

procedure TfrmInvCertificados.btnCerarAbrirresClick(Sender: TObject);
begin
  tblInvCertificados.close;
  tblInvCertificados.open;
  BitBtn3.Enabled:=true;
end;

procedure TfrmInvCertificados.btnInsertarClick(Sender: TObject);
begin
  if tblInvCertificados.State = dsBrowse then
  begin
    tblInvCertificados.Append;
    BitBtn3.Enabled:=false;
    qryUltimaFecha.Close;
    qryUltimaFecha.Open;

    if not qryUltimaFechaULTIMAFECHA.IsNull then
    tblInvCertificadosFECHA_INI.Value:=qryUltimaFechaULTIMAFECHA.Value + 1;

    tblInvCertificadosFECHA_IN.Value:= now;
    tblInvCertificadosIN_POR.Value := StrUserName;
  end;
end;

procedure TfrmInvCertificados.btnModificarClick(Sender: TObject);
begin
  if tblInvCertificados.State = dsBrowse then
  begin
    tblInvCertificados.Edit;
    tblInvCertificadosFECHA_MOD.Value:= now;
    tblInvCertificadosMOD_POR.Value := StrUserName;
  end;
end;

procedure TfrmInvCertificados.btnSalvarClick(Sender: TObject);
begin
  if tblInvCertificados.State in [dsEdit, dsInsert]  then
  begin
    if tblInvCertificados.State in [dsInsert]  then
    tblInvCertificadosCODIGO.Value:=
    FsqlMaxNumero('INV_CERTIFICADOS','codigo');
    if tblInvCertificadosCODIGO.IsNull then
    tblInvCertificadosCODIGO.Value:=1
    else
    if tblInvCertificadosCODIGO.Value = 0 then
    tblInvCertificadosCODIGO.Value:=1;
    GlbSalvarQuery(tblInvCertificados);
  end;
end;

procedure TfrmInvCertificados.btnCancelarClick(Sender: TObject);
begin
  if tblInvCertificados.State in [dsEdit, dsInsert]  then
  begin
    tblInvCertificados.Cancel;
  end else
  begin
    
  end;
  BitBtn3.Enabled:=true;
end;

procedure TfrmInvCertificados.BitBtn1Click(Sender: TObject);
begin
  if not VerificarCertDet then
  begin
    MessageDlg('Talonario no se puede eliminar por que tiene uno o varios cert asignados.',mtError,[mbok],0);
    exit;
  end;
  if tblInvCertificados.State in [dsBrowse]  then
  begin
    if MessageDlg('Eliminar talonario de certificados?',mtWarning,[mbyes,mbno],0) = mrYes then
    begin
      tblInvCertificados.Delete;
      GlbSalvarQuery(tblInvCertificados);
      BitBtn3.Enabled:= True;
    end;
  end;
end;

procedure TfrmInvCertificados.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := True;
  if btnAsignarSec.Visible then
  begin
    {if (tblInvCertificadosSECUENCIA_ACTUAL.Value >
    tblInvCertificadosSECUENCIA_FINAL.Value) then
    begin
      MessageDlg('Secuencia actual excede limite permitido, verifique.', mtInformation, [mbOk], 0);
      CanClose := False;
    end else
    if (tblInvCertificadosSECUENCIA_ACTUAL.Value <
    tblInvCertificadosSECUENCIA_INICIAL.Value) then
    begin
      MessageDlg('Secuencia actual excede limite permitido, verifique.', mtInformation, [mbOk], 0);
      CanClose := False;
    end else
    _secCert := tblInvCertificadosSECUENCIA_ACTUAL.Value + 1;}
  end;
end;

procedure TfrmInvCertificados.tblInvCertificadosAfterScroll(
  DataSet: TDataSet);
begin
  if tblInvCertificados.ControlsDisabled then exit;
  tblInvCertificadosDet.Close;
  tblInvCertificadosDet.Params[0].Value:= tblInvCertificadosCODIGO.Value;
  tblInvCertificadosDet.Open;
end;

procedure TfrmInvCertificados.BitBtn3Click(Sender: TObject);
var
  x : integer;
begin
  if tblInvCertificados.State in [dsEdit, dsInsert] then exit;
  for x:=tblInvCertificadosSECUENCIA_INICIAL.Value to
  tblInvCertificadosSECUENCIA_FINAL.Value do
  begin
     tblInvCertificadosDet.Append;
     tblInvCertificadosDetCODIGO.Value:= tblInvCertificadosCODIGO.Value;
     tblInvCertificadosDetStatus.Value:='A';
     tblInvCertificadosDetNUMERO_CERTIFICADO.Value:=x;
     tblInvCertificadosDetFECHA_IN.Value:= Now;
     tblInvCertificadosDetIN_POR.Value  := strUserName;
     GlbSalvarQuery(tblInvCertificadosDet);
  end;
end;

procedure TfrmInvCertificados.tblInvCertificadosAfterPost(
  DataSet: TDataSet);
begin
  BitBtn3.Enabled:=true;
end;

procedure TfrmInvCertificados.BitBtn4Click(Sender: TObject);
var
  x: Integer;
  sCert : String;
  xSerie : integer;
begin
  if frmInvCertificados.RxDBGrid2.SelectedRows.Count = 0 then
  begin
    MessageDlg('Favor seleccionar los # certificados a ser asignados.',mtWarning,[mbok],0);
    exit;
  end;
  tblCertAsignadoAgente.Close;
  tblCertAsignadoAgente.Open;
  if frmInvCertificados.RxDBGrid2.SelectedRows.Count > 0 then
  begin
    with frmInvCertificados.RxDBGrid2.DataSource.DataSet do
    begin
      For x := 0 to frmInvCertificados.RxDBGrid2.SelectedRows.Count - 1 do
      begin
        GotoBookmark(Pointer(frmInvCertificados.RxDBGrid2.SelectedRows.Items[x]));
        qryVerAsignado.Close;
        qryVerAsignado.Params[0].Value := tblInvCertificadosDetNUMERO_CERTIFICADO.Value;
        qryVerAsignado.Params[1].Value := codAgente;
        qryVerAsignado.Open;

        if qryVerAsignado.RecordCount >= 1 then
        continue;

        if tblCertAsignadoAgente.Locate('IDCERTMASTER;NUMERO_CERTIFICADO',
        vararrayof([
        tblInvCertificadosCODIGO.Value,
        tblInvCertificadosDetNUMERO_CERTIFICADO.Value
        ]),[]) then
        begin
          if tblCertAsignadoAgenteCODIGO_AGENTE.Value > 0 then
          begin
            MessageDlg('Primero debe liberar el certificado antes de reasignarlo.',mtError,[mbok],0);
            Break;
          end;
        end;

        if not tblCertAsignadoAgente.Locate('IDCERTMASTER;NUMERO_CERTIFICADO;CODIGO_AGENTE',
        vararrayof([
        tblInvCertificadosCODIGO.Value,
        tblInvCertificadosDetNUMERO_CERTIFICADO.Value,
        codAgente
        ]),[]) then
        begin
          tblCertAsignadoAgente.Append;
          tblCertAsignadoAgenteCODIGO_AGENTE.Value := codAgente;
          tblCertAsignadoAgenteIDCERTMASTER.Value  := tblInvCertificadosCODIGO.Value;
          tblCertAsignadoAgenteNUMERO_CERTIFICADO.Value := tblInvCertificadosDetNUMERO_CERTIFICADO.Value;
          tblCertAsignadoAgenteIN_POR.Value  := Strusername;
          tblCertAsignadoAgenteFECHA_IN.Value:= Now;
          GlbSalvarQuery(tblCertAsignadoAgente);
          xSerie := tblInvCertificadosDetSERIE.Value;
        end;
      end;
    end;
  end;
  tblInvCertificadosDet.Close;
  tblInvCertificadosDet.Open;
  tblInvCertificadosDet.Locate('SERIE', xSerie,[]);
end;

procedure TfrmInvCertificados.RxDBGrid2GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if tblInvCertificadosDet.ControlsDisabled then exit;
  if tblInvCertificadosDet.Tag = 99 then exit;
  if (tblInvCertificadosDetSTATUSCXC.Value = 'R') then
  Background := clLime
  else
  if  (tblInvCertificadosDetStatus.Value = 'C') then
  Background := clRed
  else
  if not tblInvCertificadosDetCODIGO_CLIENTE.IsNull then
  Background := $00F9C6AA
  else
  if not tblInvCertificadosDetCODCTECONSIGNADO.IsNull then
  Background := clOlive
  else
  if not tblInvCertificadosDetCODAGENTEASIGNADO.IsNull then
  Background := $00E2BCD7;
end;

procedure TfrmInvCertificados.cboxAgenteChange(Sender: TObject);
begin
  if qryEmpCodV.locate('NOMBRECOMPLETO',cboxAgente.Text,[]) then
  begin
    codAgente:= qryEmpCodVCODIGO.Value;
    edtCodAgente.Text := qryEmpCodVCODIGO.AsString;
  end;
end;

procedure TfrmInvCertificados.BitBtn5Click(Sender: TObject);
begin
  frmCertAsigAgente:=TfrmCertAsigAgente.Create(nil);
  try
    frmCertAsigAgente.showmodal;
  finally
  frmCertAsigAgente.free;
  frmCertAsigAgente:=nil;
  //frmCertAsigAgente:=nil;
  end;
end;

procedure TfrmInvCertificados.BitBtn7Click(Sender: TObject);
begin
  frmCertConsignados:=TfrmCertConsignados.Create(nil);
  try
    frmCertConsignados.showmodal;
  finally
  frmCertConsignados.free;
  frmCertConsignados:=nil;
  end;
end;

procedure TfrmInvCertificados.cboxClienteChange(Sender: TObject);
begin
  if qryClientes.locate('NOMBRECLIENTE',cboxCliente.Text,[]) then
  begin
    codCliente:= qryClientesCODIGO_CTE.Value;
    edtCodCliente.Text := qryClientesCODIGO_CTE.AsString;
  end;
end;

procedure TfrmInvCertificados.BitBtn6Click(Sender: TObject);
var
  x: Integer;
  sCert : String;
  xSerie : integer;
begin
  if frmInvCertificados.RxDBGrid2.SelectedRows.Count = 0 then
  begin
    MessageDlg('Favor seleccionar los # certificados a ser asignados.',mtWarning,[mbok],0);
    exit;
  end;
  tblCertConsignados.close;
  tblCertConsignados.Open;
  if frmInvCertificados.RxDBGrid2.SelectedRows.Count > 0 then
  begin
    with frmInvCertificados.RxDBGrid2.DataSource.DataSet do
    begin
      For x := 0 to frmInvCertificados.RxDBGrid2.SelectedRows.Count - 1 do
      begin
        GotoBookmark(Pointer(frmInvCertificados.RxDBGrid2.SelectedRows.Items[x]));
        if not tblCertConsignados.Locate('IDCERTMASTER;NUMERO_CERTIFICADO;CODIGO_CLIENTE',
        vararrayof([
        tblInvCertificadosCODIGO.Value,
        tblInvCertificadosDetNUMERO_CERTIFICADO.Value,
        codCliente
        ]),[]) then
        begin
          tblCertConsignados.Append;
          tblCertConsignadosCODIGO_CLIENTE.Value := codCliente;
          tblCertConsignadosIDCERTMASTER.Value  := tblInvCertificadosCODIGO.Value;
          tblCertConsignadosNUMERO_CERTIFICADO.Value := tblInvCertificadosDetNUMERO_CERTIFICADO.Value;
          //tblCertConsignadosIN_POR.Value  := Strusername;
          tblCertConsignadosFECHA_IN.Value:= Now;
          GlbSalvarQuery(tblCertConsignados);
          xSerie:= tblInvCertificadosDetSERIE.Value;
        end;
      end;
    end;
  end;
  tblInvCertificadosDet.Close;
  tblInvCertificadosDet.Open;
  tblInvCertificadosDet.Locate('SERIE', xSerie,[]);     
end;

procedure TfrmInvCertificados.BitBtn8Click(Sender: TObject);
begin
  //Where a.CODIGO_AGENTE =:codigoAgente
  //and t.CODIGO_CLIENTE =:codigoCliente
  if (Not DirectoryExists('Informes')) then
  CreateDir('Informes');
  GLBMostrarArchivo:=True;
  //if tblCertAsignadoAgente.Filtered then
  qryRepCert.close;
  qryRepCert.params[0].Value:=tblInvCertificadosCODIGO.Value;
  qryRepCert.open;
  ExporToExcel(qryRepCert,GlbRutaInformes+'\ListadoNumCertificados',true);
end;

procedure TfrmInvCertificados.edtCodAgenteExit(Sender: TObject);
begin
  if not qryEmpCodV.Locate('CODIGO', edtCodAgente.Text,[]) then
  MessageDlg('Codigo no existe.', mtInformation,[mbok],0)
  else
  cboxAgente.Text:= qryEmpCodVNOMBRECOMPLETO.Value;
end;

procedure TfrmInvCertificados.edtCodClienteExit(Sender: TObject);
begin
  if not qryClientes.Locate('CODIGO_cte', edtCodCliente.Text,[]) then
  MessageDlg('Codigo no existe.', mtInformation,[mbok],0)
  else
  cboxCliente.Text:=qryClientesNOMBRECLIENTE.Value;
end;

procedure TfrmInvCertificados.BitBtn9Click(Sender: TObject);
begin
  if (tblInvCertificadosDetStatus.Value = 'C') then
  begin
    if MessageDlg('Reactivar Certificado #'+tblInvCertificadosDetNUMERO_CERTIFICADO.AsString+'?', mtWarning,[mbyes,mbno],0) = mrYes then
    begin
      tblInvCertificadosDet.edit;
      tblInvCertificadosDetStatus.Value:='A';
      GlbSalvarQuery(tblInvCertificadosDet);
      BitBtn3.Enabled:=true;
    end;
  end else
  if MessageDlg('Cancelar Certificado #'+tblInvCertificadosDetNUMERO_CERTIFICADO.AsString+'?', mtWarning,[mbyes,mbno],0) = mrYes then
  begin
    tblInvCertificadosDet.Edit;
    tblInvCertificadosDetStatus.Value:='C';
    GlbSalvarQuery(tblInvCertificadosDet);
    BitBtn3.Enabled:=true;
  end;
end;

procedure TfrmInvCertificados.BitBtn10Click(Sender: TObject);
var
  x, xSerie: integer;
begin
  if frmInvCertificados.RxDBGrid2.SelectedRows.Count = 0 then
  begin
    MessageDlg('Favor seleccionar el/los # certificado(s) a ser asignado(s).',mtWarning,[mbok],0);
    exit;
  end;

  tblCertAsignadoAgente.close;
  tblCertAsignadoAgente.Open;
  if frmInvCertificados.RxDBGrid2.SelectedRows.Count > 0 then
  begin
    with frmInvCertificados.RxDBGrid2.DataSource.DataSet do
    begin
      For x := 0 to frmInvCertificados.RxDBGrid2.SelectedRows.Count - 1 do
      begin
        GotoBookmark(Pointer(frmInvCertificados.RxDBGrid2.SelectedRows.Items[x]));

        qryVerAsignado.Close;
        qryVerAsignado.Params[0].Value := tblInvCertificadosDetNUMERO_CERTIFICADO.Value;
        qryVerAsignado.Params[1].Value := tblInvCertificadosDetCODAGENTEASIGNADO.Value;
        qryVerAsignado.Open;

        if qryVerAsignado.RecordCount = 0 then continue;

        if tblCertAsignadoAgente.Locate('IDCERTMASTER;NUMERO_CERTIFICADO;CODIGO_AGENTE',
        vararrayof([
        tblInvCertificadosCODIGO.Value,
        tblInvCertificadosDetNUMERO_CERTIFICADO.Value,
        tblInvCertificadosDetCODAGENTEASIGNADO.Value]),[]) then
        begin
          tblCertAsignadoAgente.Delete;
          //tblCertAsignadoAgenteCODIGO_AGENTE.AsVariant := null;
          //tblCertAsignadoAgenteMOD_POR.Value  := Strusername;
          //tblCertAsignadoAgenteFECHA_MOD.Value:= Now;
          GlbSalvarQuery(tblCertAsignadoAgente);
          xSerie := tblInvCertificadosDetSERIE.Value;
        end;
      end;
    end;
  end;
  tblInvCertificadosDet.Close;
  tblInvCertificadosDet.Open;
  tblInvCertificadosDet.Locate('SERIE', xSerie,[]);
end;

procedure TfrmInvCertificados.BitBtn11Click(Sender: TObject);
begin
  frmConsultaCertAvanzada:=TfrmConsultaCertAvanzada.Create(nil);
  try
    if frmConsultaCertAvanzada.ShowModal = mrOk then
    begin
      tblInvCertificados.Locate('CODIGO',frmConsultaCertAvanzada.qryDatoscodigo.Value,[]);
      tblInvCertificadosDet.Locate('SERIE',frmConsultaCertAvanzada.qryDatosSERIE.Value,[]);
    end;
  finally
  frmConsultaCertAvanzada.free;
  frmConsultaCertAvanzada:=nil;
  end;
end;

procedure TfrmInvCertificados.BitBtn12Click(Sender: TObject);
begin
  if (Edit1.Text = '') then exit;
  qryLookCert.Close;
  qryLookCert.Params[0].Value:= StrToInt(Edit1.Text);
  qryLookCert.Open;
  qryLookCert.First;
  if qryLookCert.RecordCount > 0 then
  begin
    tblInvCertificados.First;
    tblInvCertificadosDet.Tag := 99;
    tblInvCertificados.DisableControls;
    tblInvCertificadosDet.DisableControls;
    if tblInvCertificados.Locate('CODIGO', qryLookCertCODIGO.Value,[]) then
    begin
      tblInvCertificadosDet.EnableControls;
      tblInvCertificadosDet.Close;
      tblInvCertificadosDet.Params[0].Value:= qryLookCertCODIGO.Value;
      tblInvCertificadosDet.Open;
      tblInvCertificados.EnableControls;
      if not tblInvCertificadosDet.Locate('NUMERO_CERTIFICADO', qryLookCertNUMERO_CERTIFICADO.Value,[]) then
      MessageDlg('No encontrado, verifique.', mtInformation, [mbok],0);
    end;
  end;
  tblInvCertificadosDet.Tag := 0;
  
  Exit;

end;

function TfrmInvCertificados.VerificarCertDet: Boolean;
begin
  tblInvCertificadosDet.first;
  while not tblInvCertificadosDet.Eof do
  begin
    if not tblInvCertificadosDetCODIGO_CLIENTE.IsNull or
    not tblInvCertificadosDetCODCTECONSIGNADO.IsNull or
    not tblInvCertificadosDetCODAGENTEASIGNADO.IsNull then
    begin
      result:=False;
      Break;
    end;
    tblInvCertificadosDet.Next;
  end;
  result:=True;
end;

procedure TfrmInvCertificados.BitBtn13Click(Sender: TObject);
begin
  tblDatosVehiculos.Close;
  tblDatosVehiculos.Params[0].Value:= tblInvCertificadosDetNUMERO_CERTIFICADO.Value;
  tblDatosVehiculos.Params[1].Value:= tblInvCertificadosDetNUMERO_CERTIFICADO.Value;
  tblDatosVehiculos.Open;
  if tblDatosVehiculos.RecordCount > 0 then
  begin
    tblDatosVehiculos.Edit;
    tblInvCertificadosDet.Edit;
    if tblDatosVehiculosSTATUSCXC.IsNull or
    (tblDatosVehiculosSTATUSCXC.Value = 'A') then
    tblDatosVehiculosSTATUSCXC.Value:= 'R'
    else
    if (tblDatosVehiculosSTATUSCXC.Value = 'R') then
    begin
      if MessageDlg('Certificado ya tiene status de pagado, desea quitar status?',mtInformation,[mbyes, mbno],0) = mryes then
      begin
        tblDatosVehiculosSTATUSCXC.Value:= 'A';
        tblInvCertificadosDetSTATUSCXC.Value:= 'A';
      end;
    end else
    begin
     tblDatosVehiculosSTATUSCXC.Value    := 'R';
     tblInvCertificadosDetSTATUSCXC.Value:= 'R';
    end;
    GlbSalvarQuery(tblDatosVehiculos);


    GlbSalvarQuery(tblInvCertificadosDet);

    tblInvCertificadosDet.Prior;
    tblInvCertificadosDet.Next;
  end else
  begin
    //MessageDlg('Cliente no ha sido registrado en DatosVehiculos, verifique.',mtInformation,[mbok],0);
    tblInvCertificadosDet.Edit;
    tblInvCertificadosDetFECHA_MOD.Value:=now;
    tblInvCertificadosDetMOD_POR.Value:= Trim(strUserName);
    tblInvCertificadosDetSTATUSCXC.Value:= 'R';
    GlbSalvarQuery(tblInvCertificadosDet);
  end;
end;

end.
