unit UClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, RXCtrls, ExtCtrls, DB, Grids, DBGrids,
  RXDBCtrl, ToolEdit, Mask, DBCtrls, ComCtrls, WinSkinData, RxLookup, Menus;

type
  TfrmClientes = class(TForm)
    Panel2: TPanel;
    RxSpeedButton18: TRxSpeedButton;
    btnSalvar: TBitBtn;
    btnCerarAbrirres: TBitBtn;
    btnModificar: TBitBtn;
    btnCancelar: TBitBtn;
    btnInsertar: TBitBtn;
    BitBtn3: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBDateEdit2: TDBDateEdit;
    TabSheet2: TTabSheet;
    Label2: TLabel;
    Label3: TLabel;
    Label15: TLabel;
    DBEdit9: TDBEdit;
    Label11: TLabel;
    Label12: TLabel;
    DBEdit5: TDBEdit;
    Label13: TLabel;
    DBEdit6: TDBEdit;
    Label16: TLabel;
    DBEdit7: TDBEdit;
    Label17: TLabel;
    Label18: TLabel;
    DBEdit10: TDBEdit;
    Label19: TLabel;
    DBEdit11: TDBEdit;
    Label20: TLabel;
    DBEdit12: TDBEdit;
    Label22: TLabel;
    DBEdit13: TDBEdit;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit2: TDBEdit;
    Label9: TLabel;
    DBEdit3: TDBEdit;
    Label23: TLabel;
    Label24: TLabel;
    DBEdit14: TDBEdit;
    Label25: TLabel;
    DBEdit15: TDBEdit;
    Label26: TLabel;
    DBDateEdit1: TDBDateEdit;
    Label27: TLabel;
    Label28: TLabel;
    DBEdit16: TDBEdit;
    DBText1: TDBText;
    DBEdit1: TDBEdit;
    Image1: TImage;
    dstblTipoclientes: TDataSource;
    Label4: TLabel;
    Label29: TLabel;
    DBEdit18: TDBEdit;
    DBEdit17: TDBEdit;
    DBGrid1: TDBGrid;
    dstblCondicionVenta: TDataSource;
    dsTblClientes: TDataSource;
    SkinData1: TSkinData;
    DBComboBox1: TDBComboBox;
    labelCantDias: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    RxDBLookupCombo2: TRxDBLookupCombo;
    RxLabel1: TRxLabel;
    PopupMenu1: TPopupMenu;
    Buscarporcodigo1: TMenuItem;
    TabSheet3: TTabSheet;
    Panel1: TPanel;
    Image2: TImage;
    Label1: TLabel;
    Label6: TLabel;
    Label21: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    DBText2: TDBText;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    RxLabel2: TRxLabel;
    DBDateEdit3: TDBDateEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit23: TDBEdit;
    DBEdit24: TDBEdit;
    DBEdit25: TDBEdit;
    DBEdit26: TDBEdit;
    DBEdit27: TDBEdit;
    DBEdit28: TDBEdit;
    DBEdit29: TDBEdit;
    DBEdit30: TDBEdit;
    DBEdit31: TDBEdit;
    DBEdit32: TDBEdit;
    DBComboBox2: TDBComboBox;
    RxDBLookupCombo3: TRxDBLookupCombo;
    RxDBLookupCombo4: TRxDBLookupCombo;
    Panel3: TPanel;
    DBStatusLabel1: TDBStatusLabel;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    BitBtn1: TBitBtn;
    RxDBLookupCombo5: TRxDBLookupCombo;
    Label10: TLabel;
    Label14: TLabel;
    DBMemo1: TDBMemo;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    Label48: TLabel;
    RxDBLookupCombo6: TRxDBLookupCombo;
    Panel4: TPanel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Edit1: TEdit;
    Button1: TButton;
    BuscarDifCriterios1: TMenuItem;
    Button2: TButton;
    procedure btnInsertarClick(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure btnCerarAbrirresClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnModificarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RxDBLookupCombo1Click(Sender: TObject);
    procedure Buscarporcodigo1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBEdit20Exit(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure RxDBLookupCombo2Exit(Sender: TObject);
    procedure RxDBLookupCombo4Exit(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBEdit20KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure dsTblClientesStateChange(Sender: TObject);
    procedure DBEdit9Exit(Sender: TObject);
    procedure BuscarDifCriterios1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure MostrarTabSheet;
    Function VerificaAutorizacion:Boolean;
  public
    { Public declarations }
    InsertarDesdeContrato : Boolean;
    xCodCte : Integer;
  end;

var
  frmClientes: TfrmClientes;

implementation

uses UDatModClientes, UGlobal, UFormEntreClave;

{$R *.dfm}

procedure TfrmClientes.btnInsertarClick(Sender: TObject);
begin
  if dmclientes.tblClientes.State = dsBrowse then
  begin
    dmclientes.tblClientes.Insert;
    dmclientes.tblClientesSTATUS_CLIENTE.Value  := 'A';
    dmclientes.tblClientesFECHA_INSERTADO.Value := Now;
    dmclientes.tblClientesPAIS.Value            := 'REPUBLICA DOMINICANA';
    dmclientes.tblClientesCIUDAD.Value          := 'LA ROMANA';
    dmclientes.tblClientesCONDICION.Value       := 1;
    dmClientes.tblClientesTIPO_CLIENTE.Value    := 1;
    dmclientes.tblClientesTIPO_NCF.Value        := '02';
    dmclientes.tblClientesINSERTADO_POR.Value   := strUserName;
    if frmClientes.FormState = [fsVisible] then RxDBLookupCombo2.SetFocus;    
  end;
end;

procedure TfrmClientes.BitBtn9Click(Sender: TObject);
begin
  if dmclientes.tblClientes.state = dsbrowse then
  begin
    dmclientes.tblClientes.First;
    MostrarTabSheet;
    RxDBLookupCombo1Click(self);
    if dmclientes.tblClientesSTATUS_CLIENTE.Value = 'R' then
    DBMemo1.Font.Color:= clRed else DBMemo1.Font.Color:= clBlack;
  end;
end;

procedure TfrmClientes.BitBtn10Click(Sender: TObject);
begin
  if dmclientes.tblClientes.state = dsbrowse then
  begin
    dmclientes.tblClientes.Prior;
    MostrarTabSheet;

    RxDBLookupCombo1Click(self);
    if dmclientes.tblClientesSTATUS_CLIENTE.Value = 'R' then
    DBMemo1.Font.Color:= clRed else DBMemo1.Font.Color:= clBlack;    

  end;
end;

procedure TfrmClientes.BitBtn11Click(Sender: TObject);
begin
  if dmclientes.tblClientes.state = dsbrowse then
  begin
    dmclientes.tblClientes.Next;
    MostrarTabSheet;
    RxDBLookupCombo1Click(self);
    if dmclientes.tblClientesSTATUS_CLIENTE.Value = 'R' then
    DBMemo1.Font.Color:= clRed else DBMemo1.Font.Color:= clBlack;
  end;
end;

procedure TfrmClientes.BitBtn12Click(Sender: TObject);
begin
  if dmclientes.tblClientes.state = dsbrowse then
  begin
    dmclientes.tblClientes.Last;
    MostrarTabSheet;
    RxDBLookupCombo1Click(self);
    if dmclientes.tblClientesSTATUS_CLIENTE.Value = 'R' then
    DBMemo1.Font.Color:= clRed else DBMemo1.Font.Color:= clBlack;
  end;
end;

procedure TfrmClientes.btnCerarAbrirresClick(Sender: TObject);
begin
  if dmclientes.tblClientes.State in [dsInactive,dsBrowse] then
  begin
    dmclientes.tblClientes.close;
    dmclientes.tblClientes.open;
  end;
end;

procedure TfrmClientes.btnSalvarClick(Sender: TObject);
begin
  if dmclientes.tblClientes.State in [dsInsert,dsEdit] then
  begin
    if dmclientes.tblclientesFECHA_VENCE_LICENCIA.IsNull then
    begin
      MessageDlg('Introduzca fecha vencimiento licencia',mtError, [mbOK], 0);
      if (dmclientes.tblClientesTIPO_CLIENTE.Value = 1) then //Personal
      PageControl1.ActivePage := TabSheet1 else
      if (dmclientes.tblClientesTIPO_CLIENTE.Value = 2) then //Compañia
      PageControl1.ActivePage := TabSheet3;
      DBDateEdit2.SetFocus;
      Exit;
    end;
    if (dmclientes.tblClientesSTATUS_CLIENTE.Value='R') and
    (dmclientes.tblClientesobservacion.IsNull )then
    begin
      MessageDlg('Favor indicar observacion, dato requerido',mtInformation, [mbOK], 0);
      DBMemo1.SetFocus;
      Exit;
    end;
    if dmclientes.tblClientes.State in [dsInsert] then
    GlbCteInsertado:=True;
    dmclientes.tblClientes.Post;
    dmclientes.tblClientes.ApplyUpdates;
    if not dmclientes.tblClientes.Transaction.InTransaction then
    dmclientes.tblClientes.Transaction.StartTransaction;
    try
      dmclientes.tblClientes.Transaction.CommitRetaining;
    except
    dmclientes.tblClientes.Transaction.RollbackRetaining;
    end;
    if InsertarDesdeContrato then Close;
  end;
end;

procedure TfrmClientes.btnCancelarClick(Sender: TObject);
begin
  if dmclientes.tblClientes.State in [dsInsert,dsEdit] then
  dmclientes.tblClientes.Cancel;
end;

procedure TfrmClientes.btnModificarClick(Sender: TObject);
begin
  if dmclientes.tblClientes.State In [dsBrowse] then
  dmclientes.tblClientes.Edit;
end;

procedure TfrmClientes.FormShow(Sender: TObject);
begin
  MostrarTabSheet;
  if dmclientes.tblClientes.State In [dsInsert] then
  begin
    if dmClientes.tblClientesTIPO_CLIENTE.Value = 2 then
    DBEdit19.SetFocus
    else if dmClientes.tblClientesRNC.IsNull then
    DBDateEdit2.SetFocus;
  end;
end;

procedure TfrmClientes.RxDBLookupCombo1Click(Sender: TObject);
begin
  if dmclientes.tblClientes.state in [dsBrowse, dsInactive] then exit; 
  if dmclientes.tblClientesCONDICION.Value = 2 then
  begin
    if VerificaAutorizacion then
    begin
      labelCantDias.Visible := True;
      DBComboBox1.Visible   := True;
    end else
    begin
      dmclientes.tblClientesCONDICION.Value:=1;
      labelCantDias.Visible := False;
      DBComboBox1.Visible   := False;
    end;
  end else
  begin
    labelCantDias.Visible := False;
    DBComboBox1.Visible   := False;
  end;
end;

procedure TfrmClientes.Buscarporcodigo1Click(Sender: TObject);
begin
  if dmClientes.tblclientes.State = dsBrowse then
  begin
    if not dmClientes.IbsqlBuscarCte.Open then
    begin
      dmClientes.IbsqlBuscarCte.params[0].Value:='';
      dmClientes.IbsqlBuscarCte.params[1].Value:='';
      dmClientes.IbsqlBuscarCte.params[2].Value:='';
      dmClientes.IbsqlBuscarCte.ExecQuery;
    end;
    if not dmClientes.IbsqlBuscarCte.FieldByName('CODIGO').IsNull then
    dmclientes.tblClientes.Locate('codigo',
    InputBox('Buscar por codigo cliente','Entre codigo',
    dmClientes.IbsqlBuscarCte.FieldByName('CODIGO').AsString),[])
    else
    if not dmclientes.tblClientes.Locate('codigo',
    InputBox('Buscar por codigo cliente','Entre codigo',
    ''),[]) then
    MessageDlg('Codigo no encontrado, verifique',mtInformation, [mbOK], 0)
    else
    MostrarTabSheet;
  end;
end;

procedure TfrmClientes.BitBtn1Click(Sender: TObject);
begin
{  FrmBuscarClientesPersonas:=TFrmBuscarClientesPersonas.Create(nil);
  try
    FrmBuscarClientesPersonas.Showmodal;
    if FrmBuscarClientesPersonas.xCodigoCte > 0 then
    begin
      dmClientes.tblClientes.Locate('codigo',FrmBuscarClientesPersonas.xCodigoCte,[]);
      MostrarTabSheet;
    end;
  finally
  FrmBuscarClientesPersonas.Free;
  FrmBuscarClientesPersonas:=Nil;
  end;}
end;

procedure TfrmClientes.DBEdit20Exit(Sender: TObject);
var
  strField : String;
begin
  if dmClientes.tblClientes.State in [dsEdit, dsInsert] then
  begin
    if (dmClientes.tblClientesTIPO_CLIENTE.Value = 2) then
    if (Length(dmClientes.tblClientesRNC.Value) < 9) Or (Length(dmClientes.tblClientesRNC.Value) > 9) then
    begin
      MessageDlg('RNC incorrecto, verifique', mtError, [mbok], 0);
      DBEdit20.SetFocus;
      Exit;
    end;
    dmClientes.ibsqlBuscarCte.Close;
    if not dmClientes.tblClientesRNC.IsNull then
    dmClientes.ibsqlBuscarCte.Params[0].Value:= dmClientes.tblClientesRNC.Value// RNC =:rnc or
    else dmClientes.ibsqlBuscarCte.Params[0].Value:= '';
    if not dmClientes.tblClientesLICENCIA.IsNull then
    dmClientes.ibsqlBuscarCte.Params[1].Value:= dmClientes.tblClientesLICENCIA.Value // =:licencia or

    else dmClientes.ibsqlBuscarCte.Params[1].Value:='';
    if not dmClientes.tblClientesPASAPORTE.IsNull then
    dmClientes.ibsqlBuscarCte.Params[2].Value:= dmClientes.tblClientesPASAPORTE.Value// =:pasaporte
    else dmClientes.ibsqlBuscarCte.Params[2].Value:='';
    dmClientes.ibsqlBuscarCte.ExecQuery;
    if dmClientes.ibsqlBuscarCte.RecordCount > 0 then
    begin
      if MessageDlg('Cliente ya fue registrado con RNC, CEDULA O PASAPORTE, VERIFIQUE'#13''
      + 'CODIGO: ' + dmClientes.IbsqlBuscarCte.FieldByName('CODIGO').AsString+
      '. Desea modificarlo?',mtInformation, [mbyes, mbno], 0)=mryes then
      begin
        dmClientes.tblClientes.Cancel;
        if dmClientes.tblClientes.Locate('codigo',dmClientes.IbsqlBuscarCte.FieldByName('CODIGO').AsString,[]) then
        dmClientes.tblClientes.Edit;
        RxDBLookupCombo2.SetFocus;
      end;
      btnCancelar.SetFocus;
    end;
  end;
end;

procedure TfrmClientes.MostrarTabSheet;
begin
  if (dmclientes.tblClientesTIPO_CLIENTE.Value = 1) then //Personal
  PageControl1.ActivePage := TabSheet1 else

  if (dmclientes.tblClientesTIPO_CLIENTE.Value = 1) then //Personal
  if dmclientes.tblClientes.State = dsInsert then
  DBEdit9.SetFocus;

  if (dmclientes.tblClientesTIPO_CLIENTE.Value = 2) then //Compañia
  PageControl1.ActivePage := TabSheet3;

  if (dmclientes.tblClientesTIPO_CLIENTE.Value = 2) then //Compañia
  if dmclientes.tblClientes.State = dsInsert then
  DBEdit20.SetFocus;
end;

procedure TfrmClientes.PageControl1Change(Sender: TObject);
begin
  //MostrarTabSheet;
end;

procedure TfrmClientes.RxDBLookupCombo2Exit(Sender: TObject);
begin
  MostrarTabSheet;
end;

procedure TfrmClientes.RxDBLookupCombo4Exit(Sender: TObject);
begin
  MostrarTabSheet;
end;

function TfrmClientes.VerificaAutorizacion: Boolean;
var
  Clave : string;
begin
  frmEntrreClave:=TfrmentrreClave.Create(nil);
  if frmEntrreClave.showmodal=mrOk then
  Clave:= frmEntrreClave.Edit1.Text
  else Result := False;
  frmentrreClave.Free;
  frmentrreClave:=Nil;
  if GlbClaveSup <> Encriptar(Trim(clave),2005) then
  begin
    MessageDlg('Clave incorrecta, verifique', mtError, [mbOK], 0);
    Result:=False;
  end else Result:=True;
end;

procedure TfrmClientes.DBGrid1DblClick(Sender: TObject);
begin
  MostrarTabSheet;
end;

procedure TfrmClientes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 27) and (dmclientes.tblClientes.State In [dsEdit, dsInsert])  then
  begin
    if MessageDlg('Cancelar transacción?', mtWarning, [mbYes, mbNo], 0)=mrYes then
    begin
      dmclientes.tblClientes.Cancel;
    end;
  end;
end;

procedure TfrmClientes.BitBtn2Click(Sender: TObject);
begin
  if MessageDlg('Este cliente no podrá realizar operacion renta vehiculo, continuar?',mtwarning, [mbyes, mbno], 0)=mryes then
  begin
    btnModificarClick(Self);
    dmclientes.tblClientesSTATUS_CLIENTE.Value:='R';
    DBMemo1.SetFocus;
  end;
end;

procedure TfrmClientes.DBEdit20KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 27) and (dmclientes.tblClientes.State In [dsEdit, dsInsert])  then
  begin
    if MessageDlg('Cancelar transacción?', mtWarning, [mbYes, mbNo], 0)=mrYes then
    begin
      dmclientes.tblClientes.Cancel;
    end;
  end;
end;

procedure TfrmClientes.Button1Click(Sender: TObject);
begin
  if RadioButton1.Checked then
  begin
    if Not dmclientes.tblClientes.Locate('licencia',
    edit1.Text,[]) then
    MessageDlg('Cliente no encontrado, verifique licencia',mtInformation, [mbOK], 0)
  end else
  begin
    if Not dmclientes.tblClientes.Locate('nombre',
    edit1.Text,[loCaseInsensitive, loPartialKey]) then
    MessageDlg('Cliente no encontrado, verifique nombre',mtInformation, [mbOK], 0)
  end;
end;

procedure TfrmClientes.Edit1Change(Sender: TObject);
begin
  if dmclientes.tblClientes.State <> dsBrowse then exit;
  if RadioButton1.Checked then
  begin
    if dmclientes.tblClientes.Locate('licencia',
      edit1.Text,[loCaseInsensitive,loPartialKey]) then
      Panel4.Color:= $00D2EBBA else
      Panel4.Color:= clBtnFace;
  end else
  begin
    if dmclientes.tblClientes.Locate('nombre',
    edit1.Text,[loCaseInsensitive,loPartialKey]) then
    Panel4.Color:= $00D2EBBA else
    Panel4.Color:= clBtnFace;
  end;
end;

procedure TfrmClientes.dsTblClientesStateChange(Sender: TObject);
begin
  if dmclientes.tblClientes.State in [dsInsert, dsEdit] then
  Panel4.Enabled := False
  else Panel4.Enabled := True;
end;

procedure TfrmClientes.DBEdit9Exit(Sender: TObject);
var
  strField : String;
begin
  if dmClientes.tblClientes.State in [dsEdit, dsInsert] then
  begin
    if (dmClientes.tblClientesTIPO_CLIENTE.Value = 2) then
    if (Length(dmClientes.tblClientesRNC.Value) < 9) Or (Length(dmClientes.tblClientesRNC.Value) > 9) then
    begin
      MessageDlg('RNC incorrecto, verifique', mtError, [mbok], 0);
      DBEdit20.SetFocus;
      Exit;
    end;
    dmClientes.ibsqlBuscarCte.Close;
    if not dmClientes.tblClientesRNC.IsNull then
    dmClientes.ibsqlBuscarCte.Params[0].Value:= dmClientes.tblClientesRNC.Value// RNC =:rnc or
    else dmClientes.ibsqlBuscarCte.Params[0].Value:= '';
    if not dmClientes.tblClientesLICENCIA.IsNull then
    dmClientes.ibsqlBuscarCte.Params[1].Value:= dmClientes.tblClientesLICENCIA.Value // =:licencia or

    else dmClientes.ibsqlBuscarCte.Params[1].Value:='';
    if not dmClientes.tblClientesPASAPORTE.IsNull then
    dmClientes.ibsqlBuscarCte.Params[2].Value:= dmClientes.tblClientesPASAPORTE.Value// =:pasaporte
    else dmClientes.ibsqlBuscarCte.Params[2].Value:='';
    dmClientes.ibsqlBuscarCte.ExecQuery;
    if dmClientes.ibsqlBuscarCte.RecordCount > 0 then
    begin
      if MessageDlg('Cliente ya fue registrado, VERIFIQUE'#13''
      + 'CODIGO: ' + dmClientes.IbsqlBuscarCte.FieldByName('CODIGO').AsString+
      '. Desea modificarlo?',mtInformation, [mbyes, mbno], 0)=mryes then
      begin
        dmClientes.tblClientes.Cancel;
        if dmClientes.tblClientes.Locate('codigo',dmClientes.IbsqlBuscarCte.FieldByName('CODIGO').AsString,[]) then
        dmClientes.tblClientes.Edit;
        RxDBLookupCombo2.SetFocus;
      end;
      btnCancelar.SetFocus;
    end;
  end;
end;

procedure TfrmClientes.BuscarDifCriterios1Click(Sender: TObject);
var
  codigo : Integer;
begin
  {FrmBuscarClientesPersonas:=TFrmBuscarClientesPersonas.Create(nil);
  try
    FrmBuscarClientesPersonas.Showmodal;
    if dmClientes.tblClientes.State = dsBrowse then
    if FrmBuscarClientesPersonas.xCodigoCte > 0 then
    dmClientes.tblClientes.Locate('codigo',FrmBuscarClientesPersonas.xCodigoCte,[]);
    MostrarTabSheet;    
  finally
  FrmBuscarClientesPersonas.Free;
  FrmBuscarClientesPersonas:=Nil;
  end;}
end;

procedure TfrmClientes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  xCodCte:=dmClientes.tblClientesCODIGO.Value;
end;

end.
