unit URegistrarTransOpeDiaria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DBDateTimePicker, DBCtrls, StdCtrls, Mask, RxDBComb,
  db,Grids, DBGrids, Buttons, ExtCtrls, RXCtrls, RXDBCtrl, WinSkinData,
  RxToolEdit;


type
  TfrmRegTransOpeDiaria = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit3: TDBEdit;
    Label9: TLabel;
    DBEdit6: TDBEdit;
    Label10: TLabel;
    DBEdit7: TDBEdit;
    Label11: TLabel;
    DBEdit8: TDBEdit;
    Label12: TLabel;
    DBEdit9: TDBEdit;
    Label13: TLabel;
    DBLookupComboBox4: TDBLookupComboBox;
    DBLookupComboBox5: TDBLookupComboBox;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    Shape1: TShape;
    DBStatusLabel1: TDBStatusLabel;
    DBStatusLabel2: TDBStatusLabel;
    DBEdit1: TDBEdit;
    Label14: TLabel;
    SkinData1: TSkinData;
    BitBtn8: TBitBtn;
    DBLookupComboBox3: TDBLookupComboBox;
    Label6: TLabel;
    DBDateEdit1: TDBDateEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
  private
    { Private declarations }
    procedure sumar;
  public
    { Public declarations }
  end;

var
  frmRegTransOpeDiaria: TfrmRegTransOpeDiaria;

implementation

uses UDatModRegOpeDiaria, UFormSelFecha, UGlobal, URepTransOpeDiaria,
  UDatModReportes;

{$R *.dfm}

procedure TfrmRegTransOpeDiaria.BitBtn1Click(Sender: TObject);
begin
  if dtmTransOpeDiaria.tblRegTransOpeDiariaMast.State = dsbrowse then
  begin
    dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Insert;
    dtmTransOpeDiaria.tblRegTransOpeDiariaMastFECHA.Value:=ExtraerFecha(date);
    dtmTransOpeDiaria.tblRegTransOpeDiariaMastSTATUS.Value  := 'A';
    dtmTransOpeDiaria.tblRegTransOpeDiariaMastCOD_PROVEEDOR.Value:=0;
    dtmTransOpeDiaria.tblRegTransOpeDiariaMastFPAGO.Value:=1;
    dtmTransOpeDiaria.tblRegTransOpeDiariaMastFECHA_IN.Value:= ExtraerFecha(Date);
    dtmTransOpeDiaria.tblRegTransOpeDiariaMastIN_POR.Value  := StrUserName;
    dtmTransOpeDiaria.tblRegTransOpeDiariaDet.Insert;
    dtmTransOpeDiaria.tblRegTransOpeDiariaDetIN_POR.Value   := StrUserName;
    dtmTransOpeDiaria.tblRegTransOpeDiariaDetFECHA_IN.Value := Now;
    dtmTransOpeDiaria.tblRegTransOpeDiariaDetSTATUS.Value   := 'A';
    DBLookupComboBox1.SetFocus;
  end;
end;

procedure TfrmRegTransOpeDiaria.FormCreate(Sender: TObject);
begin
  frmSelFecha:=TfrmSelFecha.Create(Nil);
  try
    if frmSelFecha.ShowModal = mrOk then
    begin
      dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Close;
      dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Params[0].Value:= ExtraerFecha(frmSelFecha.FechaIni.DateTime);
      dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Params[1].Value:= ExtraerFecha(frmSelFecha.FechaFin.DateTime);
      dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Open;
    end;
  finally
  frmSelFecha.Free;
  frmSelFecha:=Nil;
  end;
  dtmTransOpeDiaria.tblProductosServicios.close;
  dtmTransOpeDiaria.tblProductosServicios.Open;
  dtmtransopediaria.qryProdServicio.Close;
  dtmtransopediaria.qryProdServicio.Open;
  dtmtransopediaria.qryDeptos.Close;
  dtmtransopediaria.qryDeptos.Open;
  dtmtransopediaria.qryCentroCostos.Close;
  dtmtransopediaria.qryCentroCostos.Open;
  dtmTransOpeDiaria.tblCondicion.Close;
  dtmTransOpeDiaria.tblCondicion.Open;
  dtmTransOpeDiaria.qryProveedor.Close;
  dtmTransOpeDiaria.qryProveedor.Open;
end;

procedure TfrmRegTransOpeDiaria.BitBtn5Click(Sender: TObject);
begin
  if dtmTransOpeDiaria.tblRegTransOpeDiariaMast.State in [dsBrowse, dsInactive] then
  begin
  frmSelFecha:=TfrmSelFecha.Create(Nil);
  try
    dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Close;
    dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Params[0].Value:= ExtraerFecha(frmSelFecha.FechaIni.DateTime);
    dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Params[1].Value:= ExtraerFecha(frmSelFecha.FechaFin.DateTime);
    dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Open;
  finally
  frmSelFecha.Free;
  frmSelFecha:=Nil;
  end;
  end;
end;

procedure TfrmRegTransOpeDiaria.BitBtn7Click(Sender: TObject);
begin
  if dtmTransOpeDiaria.tblRegTransOpeDiariaDet.State in [dsBrowse] then
  begin
    dtmTransOpeDiaria.tblRegTransOpeDiariaDet.Insert;
    dtmTransOpeDiaria.tblRegTransOpeDiariaDetIN_POR.Value   := StrUserName;
    dtmTransOpeDiaria.tblRegTransOpeDiariaDetFECHA_IN.Value := Now;
    dtmTransOpeDiaria.tblRegTransOpeDiariaDetSTATUS.Value   := 'A';
    DBLookupComboBox4.SetFocus;
  end;
end;

procedure TfrmRegTransOpeDiaria.BitBtn4Click(Sender: TObject);
begin
  if dtmTransOpeDiaria.tblRegTransOpeDiariaMast.State In [dsInsert, dsEdit] then
  begin
    dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Post;
    dtmTransOpeDiaria.tblRegTransOpeDiariaMast.ApplyUpdates;
    if Not dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Transaction.InTransaction then
    dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Transaction.StartTransaction;
    try
      dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Transaction.CommitRetaining;
    except
    dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Transaction.RollbackRetaining;
    end;
  end;
  if dtmTransOpeDiaria.tblRegTransOpeDiariaDet.State In [dsInsert, dsEdit] then
  begin
    dtmTransOpeDiaria.tblRegTransOpeDiariaDetCODIGO_USUARIO.Value := VarUsuarioGlb;
    dtmTransOpeDiaria.tblRegTransOpeDiariaDet.Post;
    dtmTransOpeDiaria.tblRegTransOpeDiariaDet.ApplyUpdates;
    if Not dtmTransOpeDiaria.tblRegTransOpeDiariaDet.Transaction.InTransaction then
    dtmTransOpeDiaria.tblRegTransOpeDiariaDet.Transaction.StartTransaction;
    try
      dtmTransOpeDiaria.tblRegTransOpeDiariaDet.Transaction.CommitRetaining;
    except
    dtmTransOpeDiaria.tblRegTransOpeDiariaDet.Transaction.RollbackRetaining;
    end;
    Sumar;    
  end;

end;

procedure TfrmRegTransOpeDiaria.BitBtn3Click(Sender: TObject);
begin
  if dtmTransOpeDiaria.tblRegTransOpeDiariaDet.State In [dsInsert, dsEdit] then
  dtmTransOpeDiaria.tblRegTransOpeDiariaDet.Cancel;
  if dtmTransOpeDiaria.tblRegTransOpeDiariaMast.State In [dsInsert, dsEdit] then
  dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Cancel;  
end;

procedure TfrmRegTransOpeDiaria.BitBtn2Click(Sender: TObject);
begin
  if dtmTransOpeDiaria.tblRegTransOpeDiariaMast.State = dsBrowse then
  dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Edit;
end;

procedure TfrmRegTransOpeDiaria.sumar;
var
  Suma : Real;
begin
  if dtmTransOpeDiaria.tblRegTransOpeDiariaDet.State in [dsBrowse] then
  begin
    if dtmTransOpeDiaria.tblRegTransOpeDiariaDet.RecordCount = 0 then exit;
    dtmTransOpeDiaria.tblRegTransOpeDiariaDet.DisableControls;
    dtmTransOpeDiaria.tblRegTransOpeDiariaDet.First;
    Suma:=0;
    While Not dtmTransOpeDiaria.tblRegTransOpeDiariaDet.eof do
    begin
      Suma:=Suma + dtmTransOpeDiaria.tblRegTransOpeDiariaDetVALOR.Value;
      dtmTransOpeDiaria.tblRegTransOpeDiariaDet.Next;
    end;
    dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Edit;
    dtmTransOpeDiaria.tblRegTransOpeDiariaMastMONTO.Value:=Suma;
    dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Post;
      if dtmTransOpeDiaria.tblRegTransOpeDiariaMast.State In [dsInsert, dsEdit] then
  begin
    dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Post;
    dtmTransOpeDiaria.tblRegTransOpeDiariaMast.ApplyUpdates;
    if Not dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Transaction.InTransaction then
    dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Transaction.StartTransaction;
    try
      dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Transaction.CommitRetaining;
    except
    dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Transaction.RollbackRetaining;
    end;
  end;
    dtmTransOpeDiaria.tblRegTransOpeDiariaDet.EnableControls;
  end;
end;

procedure TfrmRegTransOpeDiaria.BitBtn8Click(Sender: TObject);
begin
  frmSelFEcha:=TfrmSelFEcha.create(nil);
  try
    if frmSelFEcha.showmodal = mrOk then
    begin
      dmReportes.qryRepTransOpeDiaria.close;
      dmReportes.qryRepTransOpeDiaria.params[0].Value:= ExtraerFecha(frmSelfecha.FechaIni.Date);
      dmReportes.qryRepTransOpeDiaria.params[1].Value:= ExtraerFecha(frmSelfecha.FechaFin.Date);
      dmReportes.qryRepTransOpeDiaria.open;
      qckTransOpeDiaria:=TqckTransOpeDiaria.Create(nil);
      try
        qckTransOpeDiaria.preview;
      finally
      qckTransOpeDiaria.free;
      qckTransOpeDiaria:=nil;
      end;
    end;
  finally
  frmSelFEcha.Free;
  frmSelFEcha:=Nil;
  end;
end;

end.
