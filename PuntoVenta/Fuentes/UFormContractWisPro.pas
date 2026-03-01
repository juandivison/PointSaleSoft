unit UFormContractWisPro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Mask, DBCtrls, Grids, DBGrids, RxDBCtrl,
  RxToolEdit, RxLookup, Buttons, ExtCtrls, WinSkinData, RxDBComb,
  RxDBFilter, ComCtrls, RxCtrls;

type
  TfrmContractosWisPro = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DataSource1: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    Label13: TLabel;
    Label14: TLabel;
    DBDateEdit1: TDBDateEdit;
    DBDateEdit4: TDBDateEdit;
    RxDBGrid1: TRxDBGrid;
    RxDBLookupCombo12: TRxDBLookupCombo;
    RxDBLookupCombo1: TRxDBLookupCombo;
    dsqryClientWisPro: TDataSource;
    Panel1: TPanel;
    btnInsertar: TBitBtn;
    btnModificar: TBitBtn;
    btnSalvar: TBitBtn;
    btnCancelar: TBitBtn;
    btnCerarAbrirres: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn7: TBitBtn;
    SkinData1: TSkinData;
    SpeedButton1: TSpeedButton;
    DBEdit3: TDBEdit;
    Label15: TLabel;
    RxDBComboBox1: TRxDBComboBox;
    RxDBGridSorter1: TRxDBGridSorter;
    DBText1: TDBText;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    SpeedButton2: TSpeedButton;
    CheckBox1: TCheckBox;
    Label16: TLabel;
    Label17: TLabel;
    ProgressBar1: TProgressBar;
    Label18: TLabel;
    DBStatusLabel1: TDBStatusLabel;
    Button1: TButton;
    procedure btnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnInsertarClick(Sender: TObject);
    procedure btnModificarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnCerarAbrirresClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure DBEdit9Exit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmContractosWisPro: TfrmContractosWisPro;

implementation

uses UDatModClientes, Uglobal, UFormClientWisPro, UFormEstatusContratos;

{$R *.dfm}

procedure TfrmContractosWisPro.btnSalvarClick(Sender: TObject);
var
  codcte : integer;
begin
  if dmClientes.tblContractWisPro.State in [dsInsert] then
  begin
    if dmClientes.tblContractWisProID.IsNull then
    dmClientes.tblContractWisProID.Value:='';
  end;
  codcte :=  dmClientes.tblContractWisProCODIGO_CTE.Value;
  if dmClientes.tblContractWisPro.State in [dsEdit, dsInsert] then
  begin
    if (dmClientes.tblContractWisProMACADDRESS.IsNull) or
    (Trim(dmClientes.tblContractWisProMACADDRESS.Value) ='') then
    dmClientes.tblContractWisProMACADDRESS.Value:=' ';
    GlbSalvarQuery(dmClientes.tblContractWisPro);
  end;
  RxDBGrid1.Enabled:= True;

  //exit;//temporal

  if (dmClientes.tblContractWisProID.IsNull) or (Trim(dmClientes.tblContractWisProID.Value)='') then
  begin
    WinExec(PChar(GlbRutaWisPro+Format(' /username=%s /userAutenticated=%s /accion=%s /IDContract=%s /StatusContract=%s /CodigoCliente=%s /AUTO=1',
    [GlbUsuarioLogueado,'1','30','','',
     ''])), SW_HIDE);  //activar
     Sleep(5000);
     Beep;
     dmClientes.tblClientes.close;
     dmClientes.tblClientes.Tag:=-1;
     dmClientes.tblClientes.DisableControls;
     dmClientes.tblClientes.Open;
     dmClientes.tblClientes.Locate('codigo_cte',codcte,[]);
     dmClientes.tblClientes.EnableControls;
     dmClientes.tblClientes.Tag:=0;
     dmClientes.qryClientWisPro.Close;
     dmClientes.qryClientWisPro.Open;
     dmClientes.tblContractWisPro.Close;
     dmClientes.tblContractWisPro.Open;
     dmClientes.tblContractWisPro.Locate('CODIGO_CTE',codcte,[]);
     Refresh;
  end;
end;

procedure TfrmContractosWisPro.FormCreate(Sender: TObject);
begin
  dmClientes.qryPlanesWisPro.Close;
  dmClientes.qryPlanesWisPro.Open;
  dmClientes.qryClientWisPro.Close;
  dmClientes.qryClientWisPro.Open;
  dmClientes.tblContractWisPro.Close;
  dmClientes.tblContractWisPro.Open;
end;

procedure TfrmContractosWisPro.btnInsertarClick(Sender: TObject);
begin
  if dmClientes.tblContractWisPro.State = dsBrowse then
  begin
    dmClientes.tblContractWisPro.Append;
    dmClientes.tblContractWisProcodigo_cte.Value:=
    dmClientes.tblClientwisProCodigo_cte.Value;
    dmClientes.tblContractWisProCLIENTID.Value:=dmClientes.tblClientwisProID.Value;
    dmClientes.tblContractWisProMACADDRESS.Value:='';
    dmClientes.tblContractWisProSERVERCONFIGURATIONID.Value:= GlbServerConfigID;
    RxDBGrid1.Enabled:= False;
  end;
end;
   
procedure TfrmContractosWisPro.btnModificarClick(Sender: TObject);
begin
  if dmClientes.tblContractWisPro.State in [dsEdit, dsInsert] then
  begin
    dmClientes.tblContractWisPro.Edit;
    RxDBGrid1.Enabled:= False;
  end;
end;

procedure TfrmContractosWisPro.btnCancelarClick(Sender: TObject);
begin
  if dmClientes.tblContractWisPro.State in [dsEdit, dsInsert] then
  begin
    dmClientes.tblContractWisPro.Cancel;
    RxDBGrid1.Enabled:= True;
  end;
end;

procedure TfrmContractosWisPro.btnCerarAbrirresClick(Sender: TObject);
begin
  if dmClientes.tblContractWisPro.State in [dsBrowse, dsInactive] then
  begin
    dmClientes.tblContractWisPro.close;

   dmClientes.tblContractWisPro.open;
  end;
end;

procedure TfrmContractosWisPro.SpeedButton1Click(Sender: TObject);
begin
  frmClientWisPro:=TfrmClientWisPro.Create(nil);
  try
    if frmClientWisPro.ShowModal = mrOk then
    begin
      dmClientes.tblContractWisProcodigo_cte.Value:=
      dmClientes.tblClientwisProCodigo_cte.Value;
      dmClientes.tblContractWisProCLIENTID.Value:=
      dmClientes.tblClientwisProID.Value;
    end;
  finally
  frmClientWisPro.free;
  frmClientWisPro:=nil;
  end;
end;

procedure TfrmContractosWisPro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if dmClientes.tblContractWisPro.State In [dsEdit, dsInsert] then
  begin
    MessageDlg('Tienes una transacción pendiente, verifique.', mtinformation,[mbOk],0);  
  end;
end;

procedure TfrmContractosWisPro.BitBtn1Click(Sender: TObject);
var
  idx : integer;
begin
  try
    WinExec(PChar(GlbRutaWisPro+Format(' /username=%s /userAutenticated=%s /accion=%s /AUTO=1',
    [GlbUsuarioLogueado,'1','40'])), SW_HIDE);
  except
  end;
  ProgressBar1.Visible:=True;

  for idx:=0 to 999 do
  begin
    Sleep(10);
    ProgressBar1.StepIt;
    Application.ProcessMessages;
  end;
  btnCerarAbrirresClick(Self);
  dmClientes.tblclientes.Close;
  dmClientes.tblclientes.Tag:=-99;
  dmClientes.tblclientes.Open;
  dmClientes.tblClientes.Locate('CODIGO_CTE',dmClientes.tblContractWisProCODIGO_CTE.Value,[]);
  dmClientes.tblclientes.Tag:=-99;
  ProgressBar1.Visible:=False;
  Beep;
  MessageDlg('Datos descargados, verifique.',mtinformation,[mbok],0);
end;

procedure TfrmContractosWisPro.BitBtn3Click(Sender: TObject);
var
   codCte, i: integer;
begin
  codCte:= dmClientes.tblContractWisProCODIGO_CTE.Value;
  if (rxDBGrid1.SelectedRows.Count > 0) then
  begin
    with rxDBGrid1.DataSource.DataSet do
    for i:=0 to rxDBGrid1.SelectedRows.Count-1 do
    begin
      GotoBookmark(pointer(rxDBGrid1.SelectedRows.Items[i]));
      codCte:= dmClientes.tblContractWisProCODIGO_CTE.Value;
      try
        if (UpperCase(dmClientes.tblContractWisProSTATE.Value) = 'ALERTED') OR
       (UpperCase(dmClientes.tblContractWisProSTATE.Value) = 'DISABLED') then
       WinExec(PChar(GlbRutaWisPro+Format(' /username=%s /userAutenticated=%s /accion=%s /IDContract=%s /StatusContract=%s /CodigoCliente=%s /AUTO=1',
       [GlbUsuarioLogueado,'1','70',dmClientes.tblContractWisProID.Value,'enabled',
       dmClientes.tblContractWisProCODIGO_CTE.AsString])), SW_HIDE)  //activar
       else
       WinExec(PChar(GlbRutaWisPro+Format(' /username=%s /userAutenticated=%s /accion=%s /IDContract=%s /StatusContract=%s /CodigoCliente=%s /AUTO=1',
       [GlbUsuarioLogueado,'1','70',dmClientes.tblContractWisProID.Value,'disabled',
        dmClientes.tblContractWisProCODIGO_CTE.AsString])), SW_HIDE); //desactivar
      except
      end;
    end;
  end else
  begin
    try
      codCte:= dmClientes.tblContractWisProCODIGO_CTE.Value;
      if (UpperCase(dmClientes.tblContractWisProSTATE.Value) = 'ALERTED') OR
      (UpperCase(dmClientes.tblContractWisProSTATE.Value) = 'DISABLED') then
      WinExec(PChar(GlbRutaWisPro+Format(' /username=%s /userAutenticated=%s /accion=%s /IDContract=%s /StatusContract=%s /CodigoCliente=%s /AUTO=1',
      [GlbUsuarioLogueado,'1','70',dmClientes.tblContractWisProID.Value,'enabled',
      dmClientes.tblContractWisProCODIGO_CTE.AsString])), SW_HIDE)  //activar
      else
      WinExec(PChar(GlbRutaWisPro+Format(' /username=%s /userAutenticated=%s /accion=%s /IDContract=%s /StatusContract=%s /CodigoCliente=%s /AUTO=1',
      [GlbUsuarioLogueado,'1','70',dmClientes.tblContractWisProID.Value,'disabled',
       dmClientes.tblContractWisProCODIGO_CTE.AsString])), SW_HIDE); //desactivar
    except
    end;
  end;
  dmClientes.tblContractWisPro.close;
  dmClientes.tblContractWisPro.open;
  dmClientes.tblContractWisPro.Locate('CODIGO_CTE',codCte,[]);
end;

procedure TfrmContractosWisPro.SpeedButton2Click(Sender: TObject);
begin
  frmEstadoWisPro:=TfrmEstadoWisPro.Create(nil);
  try
    frmEstadoWisPro.ShowModal;
  finally
  frmEstadoWisPro.free;
  frmEstadoWisPro:=nil;
  end;
end;

procedure TfrmContractosWisPro.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
  RxDBGrid1.SelectAll else
  RxDBGrid1.UnselectAll;
end;

procedure TfrmContractosWisPro.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if (UpperCase(Trim(dmClientes.tblContractWisProSTATE.Value)) = 'ALERTED') then
  begin
    BackGround:=$00BCF1E6;
    AFont.Color:=clBlack;
  end else
  if (UpperCase(Trim(dmClientes.tblContractWisProSTATE.Value)) = 'DISABLED') then
  BackGround:=$007586CC;
end;

procedure TfrmContractosWisPro.DBEdit9Exit(Sender: TObject);
begin
  dbedit9.Color:=clWindow;
end;

procedure TfrmContractosWisPro.Button1Click(Sender: TObject);
begin
  //if dmClientes.tblContractWisPro.State in [dsInsert, dsEdit] then
  //begin
  //  if (Trim(dmClientes.tblContractWisProMACADDRESS.Value) <>'') then
  //  begin
  //    PerlRegEx1.RegEx :='^([0-9a-fA-F]{2}(?:(?:-[0-9a-fA-F]{2}){5}|(?::[0-9a-fA-F]{2}){5}|[0-9a-fA-F]{10}))$';
  //    PerlRegEx1.Subject:=dmClientes.tblContractWisProMACADDRESS.Value;
  //    // '58-FB-84-9C-EE-74'
  //
  //    if PerlRegEx1.Match then
  //    begin
  //      DBEdit9.Color:=clMoneyGreen;
  //      Label18.Caption:='';
  //    end else
  //    begin
  //      Label18.Caption:=' -Valor incorrecto';
  //      dbedit9.SetFocus;
  //      dbedit9.SelectAll;
  //      dbedit9.Color:=clyellow;
  //      Exit;
  //    end;
  //  end;
  //end;
  //dbedit9.Color:=clWindow;
  //Label18.Caption:='';
end;

end.
