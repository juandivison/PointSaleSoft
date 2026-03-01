unit UFormImpFactRecurrentes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, StdCtrls, Buttons, Mask, RxToolEdit, Grids,
  ShellApi, WinSkinData, DBGrids, RxDBCtrl, IBQuery, IBSQL, RxCtrls,
  Registry,OleCtrls, AcroPDFLib_TLB;

type
  TfrmImpresionFactRecurrente = class(TForm)
    tblFactGenerada: TIBDataSet;
    RxDBGrid1: TRxDBGrid;
    Label1: TLabel;
    _fechaFctIni: TDateEdit;
    BitBtn1: TBitBtn;
    tblFactGeneradaSERIE: TIntegerField;
    tblFactGeneradaFECHA_GENERADA: TDateTimeField;
    tblFactGeneradaCODIGO_CTE: TIntegerField;
    tblFactGeneradaNUMERO_FACT: TIntegerField;
    tblFactGeneradaNUMERO_TRN: TIntegerField;
    tblFactGeneradaRUTA: TIBStringField;
    tblFactGeneradaSTATUS: TIBStringField;
    dstblFactGenerada: TDataSource;
    SkinData1: TSkinData;
    BitBtn2: TBitBtn;
    CheckBox1: TCheckBox;
    qryUltFact: TIBQuery;
    qryUltFactNUMFACTMAX: TFloatField;
    BitBtn3: TBitBtn;
    chkEliminarTodas: TCheckBox;
    ibsqlFacturas: TIBSQL;
    rxlblUltNumFact: TRxLabel;
    Edit1: TEdit;
    Label2: TLabel;
    tblFactGeneradaNOMBRECLIENTE: TIBStringField;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Label3: TLabel;
    _fechaFctFin: TDateEdit;
    tblFactGeneradaNUMERO_PROG: TIntegerField;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public

  end;

var
  frmImpresionFactRecurrente: TfrmImpresionFactRecurrente;

implementation

uses UDatModConectar, UGlobal, UDatModFactura, UBuscarClientesPersonasP,
  UDatModClientes, UPrintPDFCustom;

{$R *.dfm}

procedure TfrmImpresionFactRecurrente.BitBtn1Click(Sender: TObject);
begin
  tblFactGenerada.Close;
  tblFactGenerada.Params[0].Value:= ExtraerFecha(_fechaFctIni.Date);
  tblFactGenerada.Params[1].Value:= ExtraerFecha(_fechaFctFin.Date);
  tblFactGenerada.Open;
end;

procedure TfrmImpresionFactRecurrente.FormCreate(Sender: TObject);
begin
  qryUltFact.Close;
  qryUltFact.Open;
  rxlblUltNumFact.Caption:='Ult. Num Fact.:'+qryUltFactNUMFACTMAX.AsString;
  BitBtn1Click(Self);
end;

procedure TfrmImpresionFactRecurrente.BitBtn2Click(Sender: TObject);
var
  i : integer;
  sfln : string;
begin
  if (rxDBGrid1.SelectedRows.Count = 0) then
  begin
    MessageDlg('Seleccionar la(s) factura(s) a imprimir.',mtInformation,[mbok],0);
    exit;
  end;
  try
  if (rxDBGrid1.SelectedRows.Count > 0) then
  with rxDBGrid1.DataSource.DataSet do
  for i:=0 to rxDBGrid1.SelectedRows.Count-1 do
  begin
    GotoBookmark(pointer(rxDBGrid1.SelectedRows.Items[i]));
    if Length(tblFactGeneradaRUTA.Value) > 0 then
    begin
      if (tblFactGeneradaSTATUS.Value = 'P') And 
         (rxDBGrid1.SelectedRows.Count > 0) then continue;

      if FileExists(tblFactGeneradaRUTA.Value) then
      begin
        sfln:= tblFactGeneradaRUTA.Value;
        sfln:= StringReplace(sfln,'\\','\',[rfReplaceAll]);
        PrintUsingShell(sfln);
        tblFactGenerada.Edit;
        tblFactGeneradaSTATUS.Value:='P';
        GlbSalvarQuery(tblFactGenerada);
      end;
    end;
  end;
  except
    MessageDlg('Error tratando de imprimir facturas, verifique.',mtInformation,[mbok],0);
  end;
end;

procedure TfrmImpresionFactRecurrente.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
  RxDBGrid1.SelectAll else
  RxDBGrid1.UnselectAll;
end;

procedure TfrmImpresionFactRecurrente.RxDBGrid1GetCellParams(
  Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
  Highlight: Boolean);
begin
  if (tblFactGeneradaSTATUS.Value = 'R') then
  Background:= clMoneyGreen;
end;

procedure TfrmImpresionFactRecurrente.BitBtn3Click(Sender: TObject);
begin
  qryUltFact.Close;
  qryUltFact.Open;
  if chkEliminarTodas.Checked then
  begin
    tblFactGenerada.First;
    if (qryUltFactNUMFACTMAX.Value > tblFactGeneradaNUMERO_FACT.Value ) then
     begin
       MessageDlg('Existe(n) secuencia(s) de factura mayor, operacion no procede.', mtError,[mbOk],0);
       Exit;
    end;
    while not tblFactGenerada.eof do
    begin
      if dmFactura.tblProgServIguala.Locate('CODIGO_CTE;NUMERO',
      VarArrayOf([tblFactGeneradaCODIGO_CTE.Value,tblFactGeneradaNUMERO_PROG.Value]),[]) then
      begin
        dmFactura.tblProgServIguala.Edit;
        if dmFactura.tblProgServIgualaFECHA_ULT_FACT.Value > 0 then
        dmFactura.tblProgServIgualaFECHA_ULT_FACT.Value:=
        GlbUltimoDiaMesAnt(dmFactura.tblProgServIgualaFECHA_ULT_FACT.Value);
        dmFactura.tblProgServIguala.Post;
        dmFactura.tblProgServIguala.ApplyUpdates;
      end;
      ibsqlFacturas.Params[0].Value:=tblFactGeneradaNUMERO_FACT.Value;
      ibsqlFacturas.ExecQuery;

      if not ibsqlFacturas.Transaction.InTransaction then
      ibsqlFacturas.Transaction.StartTransaction;

      try
        ibsqlFacturas.Transaction.CommitRetaining;
      except
      ibsqlFacturas.Transaction.RollbackRetaining;
      end;
      tblFactGenerada.next;
    end;
  end else
  if (qryUltFactNUMFACTMAX.Value = tblFactGeneradaNUMERO_FACT.Value) then
  begin
    if not tblFactGenerada.Locate('NUMERO_FACT', qryUltFactNUMFACTMAX.Value,[]) then
    MessageDlg('Factura no existe.', mtInformation,[mbok],0)
    else
    begin
      if dmFactura.tblProgServIguala.Locate('CODIGO_CTE',tblFactGeneradaCODIGO_CTE.Value,[]) then
      begin
        dmFactura.tblProgServIguala.Edit;
        if dmFactura.tblProgServIgualaFECHA_ULT_FACT.Value > 0 then
        dmFactura.tblProgServIgualaFECHA_ULT_FACT.Value:=
        dmFactura.tblProgServIgualaFECHA_ULT_FACT.Value - 30;
        dmFactura.tblProgServIguala.Post;
        dmFactura.tblProgServIguala.ApplyUpdates;
      end;

      ibsqlFacturas.Params[0].Value:=tblFactGeneradaNUMERO_FACT.Value;
      ibsqlFacturas.ExecQuery;

      if not ibsqlFacturas.Transaction.InTransaction then
      ibsqlFacturas.Transaction.StartTransaction;

      try
        ibsqlFacturas.Transaction.CommitRetaining;
      except
      ibsqlFacturas.Transaction.RollbackRetaining;
      end;
    end;
  end;
  GlbSalvarQuery(dmFactura.tblProgServIguala);
  dmFactura.tblProgServIguala.Close;
  dmFactura.tblProgServIguala.Open;
  qryUltFact.Close;
  qryUltFact.Open;
  rxlblUltNumFact.Caption:='Ult. Num Fact.:'+qryUltFactNUMFACTMAX.AsString;
  BitBtn1Click(Self);
end;

procedure TfrmImpresionFactRecurrente.BitBtn4Click(Sender: TObject);
begin
  FrmBuscarClientesPersonas:=TFrmBuscarClientesPersonas.Create(Nil);
  try
    if FrmBuscarClientesPersonas.showmodal = mrOk then
    begin
      dmClientes.tblClientes.DisableControls;
      dmClientes.tblClientes.Tag := -1;
      if dmFactura.tblProgServIguala.State = dsBrowse then
      if not tblFactGenerada.Locate('codigo_cte', FrmBuscarClientesPersonas.CodigoCliente,[]) then
      MessageDlg('Cliente no encontrado verifique codigo.', mtInformation, [mbOK], 0);
           
      dmClientes.tblClientes.EnableControls;
      dmClientes.tblClientes.Tag := 0;
    end;
  finally
  FrmBuscarClientesPersonas.Free;
  FrmBuscarClientesPersonas:=Nil;
  end;
end;

procedure TfrmImpresionFactRecurrente.Edit1Change(Sender: TObject);
begin
  tblFactGenerada.Locate('NOMBRECLIENTE', Edit1.Text,[loCaseInsensitive,loPartialKey]);
end;

procedure TfrmImpresionFactRecurrente.BitBtn5Click(Sender: TObject);
begin
  if (FileExists(tblFactGeneradaRUTA.Value)) then
  ShellExecute(0,'open',PChar(tblFactGeneradaRUTA.Value), '','',SW_SHOWNORMAL);
end;

procedure TfrmImpresionFactRecurrente.FormShow(Sender: TObject);
begin
  BitBtn1Click(Self);
end;

end.
