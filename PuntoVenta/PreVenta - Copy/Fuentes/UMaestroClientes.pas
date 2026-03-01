unit UMaestroClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, Menus, Grids, DBGrids, RXDBCtrl, DBCtrls,
  StdCtrls, ExtCtrls, Mask, RXCtrls, ComCtrls, Buttons, ExtDlgs, DBActns,
  ActnList, WinSkinData, RxLookup;

type
  TfrmClientes = class(TForm)
    Panel1: TPanel;
    RxSpeedButton1: TRxSpeedButton;
    btnInsertar: TBitBtn;
    btnModificar: TBitBtn;
    btnSalvar: TBitBtn;
    btnCancelar: TBitBtn;
    btnCerarAbrirres: TBitBtn;
    BitBtn2: TBitBtn;
    PageControl1: TPageControl;
    tabClientes: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    DBStatusLabel2: TDBStatusLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    tabExaminar: TTabSheet;
    RxDBGrid1: TRxDBGrid;
    tabClasifiCte: TTabSheet;
    Label16: TLabel;
    Label17: TLabel;
    DBStatusLabel3: TDBStatusLabel;
    Label18: TLabel;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBGrid1: TDBGrid;
    DBNavigator2: TDBNavigator;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    DBEdit18: TDBEdit;
    dtSource: TDataSource;
    PopupMenu1: TPopupMenu;
    SoloPesos1: TMenuItem;
    SoloDolares1: TMenuItem;
    FiltrartipoAgencia1: TMenuItem;
    Todos1: TMenuItem;
    dstblTipoCliente: TDataSource;
    DBLookupComboBox2: TDBLookupComboBox;
    Label4: TLabel;
    dstblMoneda: TDataSource;
    DBImage1: TDBImage;
    Label20: TLabel;
    BitBtn1: TBitBtn;
    OpenPictureDialog1: TOpenPictureDialog;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    ActionList1: TActionList;
    DataSetFirst1: TDataSetFirst;
    DataSetPrior1: TDataSetPrior;
    DataSetNext1: TDataSetNext;
    DataSetLast1: TDataSetLast;
    SkinData1: TSkinData;
    Label21: TLabel;
    DBEdit4: TDBEdit;
    Label27: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    DBComboBox1: TDBComboBox;
    labelCantDias: TLabel;
    Label28: TLabel;
    DBEdit6: TDBEdit;
    dstblCondicionVenta: TDataSource;
    BitBtn7: TBitBtn;
    RxDBLookupCombo2: TRxDBLookupCombo;
    Label22: TLabel;
    TabSheet1: TTabSheet;
    Panel5: TPanel;
    BitBtn8: TBitBtn;
    RxDBGrid2: TRxDBGrid;
    procedure btnInsertarClick(Sender: TObject);
    procedure btnModificarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnCerarAbrirresClick(Sender: TObject);
    procedure RxSpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ActivaPermiso(proceso:integer);
  end;

var
  frmClientes: TfrmClientes;

implementation

uses UDatModClientes, UDatModReportes, URepClientes, UDatModCompania,
  UBuscarClientesPersonasP, UDatModUsuarios, UGlobal,
  UFormReferenciaClientes;

{$R *.dfm}

procedure TfrmClientes.btnInsertarClick(Sender: TObject);
begin
  if Pagecontrol1.ActivePage = tabClientes then
  begin
    if dmClientes.tblClientes.State in [dsBrowse] then
    begin
      dmClientes.tblClientes.Insert;
      dmClientes.tblClientesMONEDA_FACT.Value := '1';
      dmClientes.tblClientesTipo_cliente.Value := 1;
      dmClientes.tblClientesSTATUS_CLIENTE.Value:='A';
      DBEdit2.SetFocus;
      DBEdit2.SelectAll;
    end;
  end;
end;

procedure TfrmClientes.btnModificarClick(Sender: TObject);
begin
  if Pagecontrol1.ActivePage = tabClientes then
  begin
    if dmClientes.tblClientes.State in [dsBrowse] then
    dmClientes.tblClientes.Edit;
  end;
end;

procedure TfrmClientes.btnSalvarClick(Sender: TObject);
begin
  if Pagecontrol1.ActivePage = tabClientes then
  begin
    if dmClientes.tblclientes.state in [dsEdit,dsInsert] then
    begin
      dmClientes.tblClientes.Post;
      dmClientes.tblClientes.ApplyUpdates;
      if Not dmClientes.tblClientes.Transaction.InTransaction then
      dmClientes.tblClientes.Transaction.StartTransaction;
      try
        dmClientes.tblClientes.Transaction.CommitRetaining;
      except
      dmClientes.tblClientes.Transaction.RollbackRetaining;
      end;
    end;
  end;
end;

procedure TfrmClientes.PageControl1Change(Sender: TObject);
begin
  if Pagecontrol1.ActivePage <> tabClientes then
  begin
    Panel1.Enabled := False;
    Panel1.Color   := clGray;
  end else
  begin
    Panel1.Enabled := True;
    Panel1.Color   := clBtnFace;
  end;
end;

procedure TfrmClientes.btnCancelarClick(Sender: TObject);
begin
  if dmClientes.tblclientes.State In [dsEdit,dsInsert] then
  dmClientes.tblclientes.Cancel;
end;

procedure TfrmClientes.btnCerarAbrirresClick(Sender: TObject);
begin
  if dmClientes.tblclientes.State In [dsBrowse, dsInactive] then
  begin
    dmClientes.tblclientes.Close;
    dmClientes.tblclientes.Open;
  end;
end;

procedure TfrmClientes.RxSpeedButton1Click(Sender: TObject);
begin
//dmReportes.sqlScriptDatosCte.ExecStatement(0);
  dmReportes.qryDatosRepClientes.Close;
//dmReportes.qryDatosRepClientes.SQL.Text:=dmReportes.sqlScriptDatosCte.SQLActual;
  dmReportes.qryDatosRepClientes.Open;
  dmCompania.tblCompania.Close;
  dmCompania.tblCompania.Open;

  qckRepClientes:=TqckRepClientes.Create(Nil);
  try
    if Messagedlg('Imprimir?',mtInformation,[mbYes,mbNo],0 )= mrYes then
    begin
      qckRepClientes.Printersetup;
      qckRepClientes.Print;
    end else qckRepClientes.Preview;
  finally
  qckRepClientes.Free;
  qckRepClientes:=Nil;
  end;
end;

procedure TfrmClientes.FormCreate(Sender: TObject);
begin
  dmClientes.tblClientes.Close;
  dmClientes.tblClientes.Open;
  dmClientes.tblTipoCliente.Close;
  dmClientes.tblTipoCliente.Open;
  dmClientes.tblMoneda.Close;
  dmClientes.tblMoneda.Open;
  dmClientes.tblTipoPrecio.Close;
  dmClientes.tblTipoPrecio.Open;
  dmClientes.tblCondicionVenta.Close;
  dmClientes.tblCondicionVenta.Open;
end;

procedure TfrmClientes.BitBtn1Click(Sender: TObject);
begin
  if OpenPictureDialog1.Execute then
  begin
    if dmClientes.tblClientes.State = dsBrowse then
    dmClientes.tblClientes.Edit;
    dmClientes.tblClientesFOTO.LoadFromFile(OpenPictureDialog1.FileName);
  end;
end;

procedure TfrmClientes.BitBtn3Click(Sender: TObject);
begin
  if dmClientes.tblTipoCliente.State = dsBrowse then
  begin
    dmClientes.tblTipoCliente.Insert;
    DBEdit16.SetFocus;
  end;
end;

procedure TfrmClientes.BitBtn4Click(Sender: TObject);
begin
  if dmClientes.tblTipoCliente.State = dsBrowse then
  begin
    dmClientes.tblTipoCliente.Edit;
    DBEdit17.SetFocus;
  end;
end;

procedure TfrmClientes.BitBtn5Click(Sender: TObject);
begin
  if dmClientes.tblTipoCliente.State in [dsInsert, dsEdit] then
  begin
    dmClientes.tblTipoCliente.Post;
  end;
end;

procedure TfrmClientes.BitBtn6Click(Sender: TObject);
begin
  if dmClientes.tblTipoCliente.State in [dsInactive, dsBrowse] then
  begin
    dmClientes.tblTipoCliente.close;
    dmClientes.tblTipoCliente.open;
  end;
end;

procedure TfrmClientes.BitBtn7Click(Sender: TObject);
begin
  FrmBuscarClientesPersonas:=TFrmBuscarClientesPersonas.Create(Nil);
  try
    if FrmBuscarClientesPersonas.showmodal = mrOk then
    begin
      if not dmClientes.tblClientes.Locate('codigo_cte', FrmBuscarClientesPersonas.CodigoCliente,[]) then
      MessageDlg('Cliente no encontrado verifique codigo.', mtInformation, [mbOK], 0);
    end;
  finally
  FrmBuscarClientesPersonas.Free;
  FrmBuscarClientesPersonas:=Nil;
  end;
end;

procedure TfrmClientes.ActivaPermiso(proceso: integer);
var
  X, y, z:integer;
begin
  dmusuarios.stpBuscarPermisos.Close;
  //dmusuarios.stpBuscarPermisos.Params[0].Value:=  //Out
  //dmusuarios.stpBuscarPermisos.Params[1].Value:=  //Out
  //dmusuarios.stpBuscarPermisos.Params[2].Value:=  //Out
  dmusuarios.stpBuscarPermisos.Params[0].Value:=  VarUsuarioGlb;//In
  dmusuarios.stpBuscarPermisos.Open;

  For x:=0 To frmClientes.controlcount -1 Do
  begin
    if frmClientes.controls[x].Tag > 0 then
    begin
    if dmusuarios.stpBuscarPermisos.Locate('procesoid;tareaid', Vararrayof([proceso,
    frmClientes.controls[x].Tag]),[]) then
    begin
      if dmusuarios.stpBuscarPermisos.FieldByName('status').Value = 1 then
      frmClientes.controls[x].Enabled:=True
      else
      begin
        frmClientes.controls[x].Enabled:=False;
        if dmusuarios.stpBuscarPermisosVISIBLE.Value = 0 then
        frmClientes.controls[x].Visible:=false;
      end
    end else
    begin
      frmClientes.controls[x].Enabled:=False;
      if dmusuarios.stpBuscarPermisosVISIBLE.Value = 0 then
      frmClientes.controls[x].Visible:=false;
    end;
    end;
  end;

  for x:=0 to ComponentCount-1 do
  begin
    if (Components[x] is TPopupMenu) then
    begin
      for y:=0 to TPopupMenu(Components[x]).Items.Count -1 do
      begin
        if TPopupMenu(Components[x]).Items[y].Tag > 0 then
        begin
          if dmusuarios.stpBuscarPermisos.Locate('procesoid;tareaid', Vararrayof([proceso,
          TPopupMenu(Components[x]).Items[y].Tag]),[]) then
          begin
            if dmusuarios.stpBuscarPermisos.FieldByName('status').Value = 1 then
            TPopupMenu(Components[x]).Items[y].Enabled:=True
            else
            begin
              TPopupMenu(Components[x]).Items[y].Enabled:=False;
              if dmusuarios.stpBuscarPermisos.FieldByName('status').Value = 1 then
              TPopupMenu(Components[x]).Items[y].Visible:=False;
            end;
            end else
            begin
              TPopupMenu(Components[x]).Items[y].Enabled:=False;
              if dmusuarios.stpBuscarPermisos.FieldByName('status').Value = 1 then
              TPopupMenu(Components[x]).Items[y].Visible:=False;
            end;
          end;
        end;
    end;

    //TPanel
    if (Components[x] is TPanel) then
    begin
      //for y:=0 to TPanel(Components[x])do
      //begin
        if TPanel(Components[x]).Tag > 0 then
        begin
          if dmusuarios.stpBuscarPermisos.Locate('procesoid;tareaid', Vararrayof([proceso,
          TPanel(Components[x]).Tag]),[]) then
          begin
            if dmusuarios.stpBuscarPermisos.FieldByName('status').Value = 1 then
            TPanel(Components[x]).Enabled:=True
            else
            begin
              TPanel(Components[x]).Enabled:=False;
              if dmusuarios.stpBuscarPermisos.FieldByName('status').Value = 1 then
              TPanel(Components[x]).Visible:=False;
            end;
            end else
            begin
              TPanel(Components[x]).Enabled:=False;
              if dmusuarios.stpBuscarPermisos.FieldByName('status').Value = 1 then
              TPanel(Components[x]).Visible:=False;
            end;
          end;
      //  end;
    end;
    //TPanel

    if (Components[x] is TMainMenu) then
    begin
        for y:=0 to TMainMenu(Components[x]).Items.Count -1 do
        begin
          for z:=0 to TMainMenu(Components[x]).Items[y].Count - 1 do
          begin

            if TMainMenu(Components[x]).Items[y].Items[z].Tag > 0 then
            begin 
              if dmusuarios.stpBuscarPermisos.Locate('procesoid;tareaid', Vararrayof([proceso,
              TMainMenu(Components[x]).Items[y].Items[z].Tag]),[]) then
              begin
                if dmusuarios.stpBuscarPermisos.FieldByName('status').Value = 1 then
                TMainMenu(Components[x]).Items[y].Items[z].Enabled:=True
                else
                TMainMenu(Components[x]).Items[y].Items[z].Enabled:=False;
              end else
              TMainMenu(Components[x]).Items[y].Items[z].Enabled:=False;
            end;
          end;
        end;
    end;
  end;
end;

procedure TfrmClientes.BitBtn8Click(Sender: TObject);
begin
  frmReferenciaClientes:=TfrmReferenciaClientes.Create(nil);
  try
    dmClientes.tblCteReferenciaMaster.Close;
    dmClientes.tblCteReferenciaMaster.Params[0].Value:=dmclientes.tblClientesCODIGO_CTE.Value;
    dmClientes.tblCteReferenciaMaster.Open;
    dmClientes.qryReferenciacliente.Close;
    dmClientes.qryReferenciacliente.Params[0].Value:= dmclientes.tblClientesCODIGO_CTE.Value;
    dmClientes.qryReferenciacliente.Open;
    frmReferenciaClientes.Showmodal;
  finally
  frmReferenciaClientes.Free;
  frmReferenciaClientes:=Nil;
  end;
  dmClientes.qryReferenciacliente.Close;
  dmClientes.qryReferenciacliente.Params[0].Value:= dmclientes.tblClientesCODIGO_CTE.Value;
  dmClientes.qryReferenciacliente.Open;
end;

end.
