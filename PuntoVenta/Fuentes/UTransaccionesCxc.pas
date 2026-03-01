unit UTransaccionesCxc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RxLookup, Mask, DBCtrls, DB, Menus, RxMemDS, Grids, DBGrids,
  RXDBCtrl, ComCtrls, StdCtrls, RxDBComb, RXCtrls, EditNew, Buttons,
  ExtCtrls, rxToolEdit;

type
  TfrmTransaccionesCxc = class(TForm)
    Panel2: TPanel;
    btnSalvar: TBitBtn;
    btnCerarAbrirres: TBitBtn;
    btnModificar: TBitBtn;
    btnCancelar: TBitBtn;
    btnInsertar: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    edtCodCteRep: TEditN;
    PageControl1: TPageControl;
    tabRecord: TTabSheet;
    ScrollBox1: TScrollBox;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBStatusLabel1: TDBStatusLabel;
    Label16: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label24: TLabel;
    Label13: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBText1: TDBText;
    Label9: TLabel;
    RxLabel1: TRxLabel;
    DBText2: TDBText;
    rxdbboxmoneda: TRxDBComboBox;
    RxDBComboBox1: TRxDBComboBox;
    BitBtn1: TBitBtn;
    DBNavigator2: TDBNavigator;
    BitBtn2: TBitBtn;
    ProgressBar1: TProgressBar;
    BitBtn5: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn15: TBitBtn;
    ScrollBox2: TScrollBox;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    BitBtn16: TBitBtn;
    BitBtn17: TBitBtn;
    BitBtn18: TBitBtn;
    tabExaminar: TTabSheet;
    RxDBGrid1: TRxDBGrid;
    PanelProcServicios: TPanel;
    Label10: TLabel;
    DBStatusLabel2: TDBStatusLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    Label20: TLabel;
    LabelFechaTrn: TLabel;
    RxDBGrid2: TRxDBGrid;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    DBNavigator1: TDBNavigator;
    RxDBGrid3: TRxDBGrid;
    BitBtn11: TBitBtn;
    EditN1: TEditN;
    EditN2: TEditN;
    EditN3: TEditN;
    BitBtn12: TBitBtn;
    BitBtn13: TBitBtn;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    BitBtn14: TBitBtn;
    RxMemoryData1: TRxMemoryData;
    RxMemoryData1Total: TFloatField;
    PopupMenu2: TPopupMenu;
    BuscarCliente1: TMenuItem;
    Filtraruncliente1: TMenuItem;
    FiltrarPendientes1: TMenuItem;
    FiltrarProcesados1: TMenuItem;
    FiltrarFacturas1: TMenuItem;
    FiltrarIngresos1: TMenuItem;
    QuitarFiltro1: TMenuItem;
    tempoqryrepserv: TDataSource;
    PopupMenu1: TPopupMenu;
    Filtrar1: TMenuItem;
    PorCliente1: TMenuItem;
    Facturas1: TMenuItem;
    Ingresos1: TMenuItem;
    NotaCredito1: TMenuItem;
    NotaDebito1: TMenuItem;
    Todas1: TMenuItem;
    DataSource1: TDataSource;
    tempqrybcehis: TDataSource;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    RxDBLookupCombo1: TRxDBLookupCombo;
    RxDBLookupCombo3: TRxDBLookupCombo;
    RxDBLookupCombo4: TRxDBLookupCombo;
    DBDateEdit1: TDBDateEdit;
    dsqryBalanceCtes: TDataSource;
    dsqryTranCxc: TDataSource;
    dstblTipoServ: TDataSource;
    dstblServicio: TDataSource;
    RxDBLookupCombo2: TRxDBLookupCombo;
    dstblClientes: TDataSource;
    dstblTipoTrnDoc: TDataSource;
    tiempoIni: TLabel;
    tiempoFin: TLabel;
    VerDebitosCreditosdelDia1: TMenuItem;
    rxDatosProcCxc: TRxMemoryData;
    dsrxDatosProcCxc: TDataSource;
    RxDBGrid4: TRxDBGrid;
    rxDatosProcCxcNOMBRE_FACTURAR: TStringField;
    rxDatosProcCxcCODIGO_CLIENTE: TIntegerField;
    rxDatosProcCxcNUMERO_DOC: TIntegerField;
    rxDatosProcCxcVALOR_DOCUMENTO: TFloatField;
    rxDatosProcCxcBALANCE_ACT: TFloatField;
    rxDatosProcCxcOrigen: TSmallintField;
    rxDatosProcCxcNumeroSerie: TIntegerField;
    DBStatusLabel3: TDBStatusLabel;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure EditN3Exit(Sender: TObject);
    procedure DBEdit7Change(Sender: TObject);
    procedure DBEdit7Exit(Sender: TObject);
    procedure RxDBLookupCombo4Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn18Click(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnCerarAbrirresClick(Sender: TObject);

    procedure Filtraruncliente1Click(Sender: TObject);
    procedure FiltrarPendientes1Click(Sender: TObject);
    procedure FiltrarProcesados1Click(Sender: TObject);
    procedure FiltrarFacturas1Click(Sender: TObject);
    procedure FiltrarIngresos1Click(Sender: TObject);
    procedure QuitarFiltro1Click(Sender: TObject);
    procedure RxDBGrid2GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure PorCliente1Click(Sender: TObject);
    procedure Facturas1Click(Sender: TObject);
    procedure Ingresos1Click(Sender: TObject);
    procedure NotaCredito1Click(Sender: TObject);
    procedure Todas1Click(Sender: TObject);
    procedure BuscarCliente1Click(Sender: TObject);
    procedure VerDebitosCreditosdelDia1Click(Sender: TObject);
  private
    { Private declarations }
    Procedure ActBalaceCteP;
    procedure EditarBalanceP;
    procedure InsertaBalanceP;

    Procedure ActBalaceCte;
    procedure InsertaBalance;       
    procedure EditarBalance;
    procedure ActFechaBalance;
    procedure ProcesarCierreDiaTrn;
    procedure ProcRepBlcActual(xfechaIni:TDatetime;xfechaFin:TDatetime;bCodCte:Integer);


  public
    { Public declarations }
  end;

var
  frmTransaccionesCxc: TfrmTransaccionesCxc;
  PasaACnt:Boolean;
  tipoD : Integer;
implementation

uses UDatModCxc, UFormSelFecha, uGlobal, UDatModConectar, UMaestroClientes,
  URepEstadoCtaCxc, UDatModCompania,
  UDebitosycreditosaplicados, UCerrarHistoriocxc;

{$R *.dfm}

procedure TfrmTransaccionesCxc.FormCreate(Sender: TObject);
begin
  rxDatosProcCxc.close;
  rxDatosProcCxc.open;
  dmcxc.tblServicio.close;
  dmcxc.tblServicio.open;
  dmCompania.tblCompania.Close;
  dmCompania.tblCompania.Open;
  dmCompania.tblCompania.Locate('codigo',glbCia_Key,[]);  
  dmcxc.tblTipoServ.Close;
  dmcxc.tblTipoServ.open;
  dmcxc.tblClientes.Close;
  dmcxc.tblClientes.Open;
  dmcxc.tblTipoTrnDoc.Close;
  dmcxc.tblTipoTrnDoc.Open;
  dmcxc.qryBalanceCtes.Close;
  dmcxc.qryBalanceCtes.Open;
  PanelProcServicios.Visible:=False;
  PanelProcServicios.SendToBack;
  LabelFechaTrn.Caption:='Procesando Datos de '+FormatDatetime('dd-mmm-yyyy',GlbFechaTrnDiaria);
  PanelProcServicios.Top:=70;
  dmcxc.tblTransCxc.Close;
  dmcxc.tblTransCxc.Filtered:= False;
  dmcxc.tblTransCxc.Params[0].Value := ExtraerFecha(GlbFechaTrnDiaria);
  dmcxc.tblTransCxc.Params[1].Value := ExtraerFecha(GlbFechaTrnDiaria);
  dmCxc.tblTransCxc.Params[2].Value:=glbCia_Key;
  dmcxc.tblTransCxc.Open;
  dmcxc.qryProcServ.Close;
  dmcxc.qryProcServ.Params[0].Value := ExtraerFecha(GlbFechaTrnDiaria);
  dmcxc.qryProcServ.Params[1].Value := ExtraerFecha(GlbFechaTrnDiaria);
  dmcxc.qryProcServ.Open;

  glbfechainicial:=GlbFechaTrnDiaria;
  glbfechaFinal  :=GlbFechaTrnDiaria;
end;

procedure TfrmTransaccionesCxc.BitBtn12Click(Sender: TObject);
begin
  dmcxc.qryProcServ.filtered:=False;
  if BitBtn12.Caption ='Créditos por Aplicar' then
  begin
    BitBtn9Click(self);
  end else if BitBtn12.Caption ='Aplicar Pagos' then
  begin
    BitBtn10Click(Self);
  end;
end;

procedure TfrmTransaccionesCxc.BitBtn14Click(Sender: TObject);
var
  NoSalir : Smallint;
begin
  if dmcxc.qryProcServ.State in [dsInsert,dsEdit,dsInactive] then Exit;
  dmcxc.qryProcServ.First;
  While not dmcxc.qryProcServ.Eof do
  begin
    if dmCxc.qryProcServStatus.Value = 'A' then
    begin
      NoSalir:=1;
      Break;
    end;
    dmcxc.qryProcServ.Next;
  end;
  dmcxc.qryProcServ.First;
  dmcxc.qryProcServ.EnableControls;
  if NoSalir = 1 then
  MessageDlg('Hay registros sin procesar, dia no puede ser cerrado.',mtError, [mbok],0)
  else ProcesarCierreDiaTrn;
end;

procedure TfrmTransaccionesCxc.BitBtn13Click(Sender: TObject);
begin
  if dmCxc.qryProcServStatus.Value = 'R' then exit;
  if dmcxc.qryProcServ.State in [dsBrowse] then
  dmcxc.qryProcServ.Edit;
end;

procedure TfrmTransaccionesCxc.BitBtn11Click(Sender: TObject);
begin
  if dmcxc.qryProcServ.State in [dsEdit,dsInsert] then
  dmcxc.qryProcServ.Cancel;
end;

procedure TfrmTransaccionesCxc.BitBtn6Click(Sender: TObject);
begin
  if dmcxc.qryProcServ.State in [dsEdit] then
    if dmcxc.qryProcServStatus.Value = 'R' then
    begin
      dmcxc.qryProcServ.cancel;
     exit;
    end;
  if dmcxc.qryProcServ.State in [dsEdit,dsInsert] then
  begin
    dmcxc.qryProcServ.Post;
    dmcxc.qryProcServ.ApplyUpdates;
    GlbSalvarQuery (dmcxc.qryProcServ);
  end;
end;

procedure TfrmTransaccionesCxc.BitBtn8Click(Sender: TObject);
begin
  rxDatosProcCxc.First;
  if not dmcxc.StpProcActBlceCteyTrncxcStatus.Transaction.InTransaction then
  dmcxc.StpProcActBlceCteyTrncxcStatus.Transaction.StartTransaction;
  While Not rxDatosProcCxc.Eof Do
  begin
    dmcxc.StpProcActBlceCteyTrncxcStatus.Params[0].Value:= rxDatosProcCxcCODIGO_CLIENTE.Value;
    dmcxc.StpProcActBlceCteyTrncxcStatus.Params[1].Value:= 0;//1;//codservicio
    dmcxc.StpProcActBlceCteyTrncxcStatus.Params[2].Value:= '1';//codmoneda
    dmcxc.StpProcActBlceCteyTrncxcStatus.Params[3].Value:= rxDatosProcCxcOrigen.Value;
    dmcxc.StpProcActBlceCteyTrncxcStatus.Params[4].Value:= rxDatosProcCxcVALOR_DOCUMENTO.Value;
    dmcxc.StpProcActBlceCteyTrncxcStatus.Params[5].Value:= GlbFechaTrnDiaria;
    dmcxc.StpProcActBlceCteyTrncxcStatus.Params[6].Value:= rxDatosProcCxcNumeroSerie.Value;
    dmcxc.StpProcActBlceCteyTrncxcStatus.ExecQuery;
    rxDatosProcCxc.Next;
  end;
  RxDBGrid4.Visible:=False;
  RxDBGrid2.Visible:=True;
  rxDatosProcCxc.Close;
  rxDatosProcCxc.open;

  {if dmcxc.qryProcServ.State in [dsEdit,dsInsert] then
  dmcxc.qryProcServ.Cancel;

  dmcxc.qryProcServ.Filtered:=False;
  dmcxc.qryProcServ.First;
  EsProcBlcCte:=True;
  While Not dmcxc.qryProcServ.Eof do
  begin
    if dmCxc.qryProcServStatus.Value = 'A' then
    begin
      ActBalaceCteP;
    end;
    //if dmcxc.qryProcServ.State = dsBrowse then //temporal arreglalo
    dmcxc.qryProcServ.Next;
  end;}
  {if not dmcxc.StpProcActBlceCteyTrncxcStatus.Transaction.InTransaction then
  dmcxc.StpProcActBlceCteyTrncxcStatus.Transaction.StartTransaction;}
  try
    dmcxc.StpProcActBlceCteyTrncxcStatus.Transaction.Commit;
  except
  dmcxc.StpProcActBlceCteyTrncxcStatus.Transaction.Rollback;
  end;

  if not dmCxc.qryProcServ.Transaction.InTransaction then
  dmCxc.qryProcServ.Transaction.StartTransaction;
  try
    dmCxc.qryProcServ.Transaction.CommitRetaining;
  except
  dmCxc.qryProcServ.Transaction.RollbackRetaining;
  end;
  if not dmcxc.qryBalanceCtes.Transaction.InTransaction then
  dmcxc.qryBalanceCtes.Transaction.StartTransaction;
  try
    dmcxc.qryBalanceCtes.Transaction.CommitRetaining
  except
  dmcxc.qryBalanceCtes.Transaction.RollbackRetaining;
  end;
  dmcxc.qryProcServ.Close;
  dmcxc.qryProcServ.Params[0].Value := ExtraerFecha(GlbFechaTrnDiaria);
  dmcxc.qryProcServ.Params[1].Value := ExtraerFecha(GlbFechaTrnDiaria);
  dmcxc.qryProcServ.Open;
  dmcxc.tblTransCxc.Close;
  dmCxc.tblTransCxc.Params[2].Value:=glbCia_Key;
  dmcxc.tblTransCxc.Open;
  EsProcBlcCte:=False;
  RxDBGrid2.Visible:=True;
  RxDBGrid2.BringToFront;
  RxDBGrid4.Visible:=False;
end;

procedure TfrmTransaccionesCxc.BitBtn7Click(Sender: TObject);
var
  NoSalir : Byte;
begin
  dmcxc.tblTransCxc.close;
  dmCxc.tblTransCxc.Params[2].Value:=glbCia_Key;
  dmcxc.tblTransCxc.open;
  dmcxc.qryProcServ.DisableControls;
  dmcxc.qryProcServ.First;
  NoSalir:=0;
  While not dmcxc.qryProcServ.Eof do
  begin
    if dmCxc.qryProcServStatus.Value = 'A' then
    begin
      NoSalir:=1;
      Break;
    end;
    dmcxc.qryProcServ.Next;
  end;
  dmcxc.qryProcServ.First;
  dmcxc.qryProcServ.EnableControls;
  if NoSalir = 1 then
  begin
    if MessageDlg('Hay registros sin procesar, realmente quiere salir?',mtWarning, [mbyes,mbno],0) = mryes then
    begin
      PanelProcServicios.Visible:=False;
      PanelProcServicios.SendToBack;
    end else
    Exit;
  end else
  begin
    PanelProcServicios.Visible:=False;
    PanelProcServicios.SendToBack;
  end;
end;

procedure TfrmTransaccionesCxc.BitBtn4Click(Sender: TObject);
var
  a,m,d : Word;
  codCte:Integer;
begin
  tiempoini.Caption:=DateTimeToStr(now);
  GlbBalanceAnt:=0;
  if edtCodCteRep.ValueInteger <=0 then
  edtCodCteRep.SetFocus;
  frmSelFecha:=TfrmSelFecha.create(nil);
  try
  if frmSelFecha.Showmodal = mrOk then
  begin
    GlbFechaInicial:=Extraerfecha(frmselfecha.FechaIni.Date);
    GlbFechaFinal:=ExtraerFecha(frmselfecha.FechaFin.Date);
  end;
  finally
  frmSelFecha.Free;
  frmSelFecha:=Nil;
  end;
  DecodeDate(GlbFechaInicial,a,m,d);
  if (m = 1) and (d = 1 ) then
  begin
    M:=12;
    Dec(a);
  end;
  if (d = 1) then
  begin
    Dec(m);
    d:=DiasEnElMes(a,m)
  end else Dec(d);

  dmCxc.qrybceHistCte.Close;
  dmCxc.qrybceHistCte.Params[0].Value:= 0;//historico
  dmCxc.qrybceHistCte.params[1].Value:= EncodeDate(a,m,d);
  dmCxc.qrybceHistCte.Params[2].Value:= EncodeDate(a,m,d);
  dmCxc.qrybceHistCte.Params[3].Value:= '1';
  dmCxc.qrybceHistCte.Params[4].Value:= edtCodCteRep.ValueInteger;
  dmCxc.qrybceHistCte.Params[5].Value:= edtCodCteRep.ValueInteger;
  dmCxc.qrybceHistCte.Open;
  dmCxc.qryRepServ.Close;
  dmCxc.qryRepServ.Params[0].Value := ExtraerFecha(GlbFechaInicial);
  dmCxc.qryRepServ.Params[1].Value := ExtraerFecha(GlbFechaFinal);
  dmCxc.qryRepServ.Params[2].Value := edtCodCteRep.ValueInteger;
  dmCxc.qryRepServ.Open;
  codCte:=edtCodCteRep.ValueInteger;

  //usar siguiente query para estado general de cxc
  dmCxc.qrySQLBlceAntCxcCte.Close;
  if not dmCxc.qrySQLBlceAntCxcCte.Prepared then
  dmCxc.qrySQLBlceAntCxcCte.Prepare;
  dmCxc.qrySQLBlceAntCxcCte.Params[0].Value:=edtCodCteRep.ValueInteger; //codigoclienteini
  dmCxc.qrySQLBlceAntCxcCte.Params[1].Value:=edtCodCteRep.ValueInteger; //codigoclientefin
  dmCxc.qrySQLBlceAntCxcCte.Params[2].Value:=ExtraerFecha(GlbUltimoDiaMesAnt(glbfechaInicial)+1); //FechaIni
  dmCxc.qrySQLBlceAntCxcCte.Params[3].Value:=ExtraerFecha(GlbFechaInicial-1); //FechaFin
  dmCxc.qrySQLBlceAntCxcCte.Params[4].Value:='1'; //Moneda
  dmCxc.qrySQLBlceAntCxcCte.Params[5].Value:=GlbUltimoDiaMesAnt(glbfechaInicial); //fecha_blc_Anterior
  dmCxc.qrySQLBlceAntCxcCte.ExecQuery;
  if dmCxc.qrySQLBlceAntCxcCte.Open then
  begin
    GlbBalanceAnt:=dmCxc.qrySQLBlceAntCxcCte.fieldbyname('BALANCE_ANT').AsFloat+
                   dmCxc.qrySQLBlceAntCxcCte.fieldbyname('DEBITO').AsFloat+
                   dmCxc.qrySQLBlceAntCxcCte.fieldbyname('CREDITO').AsFloat;
  end;
    qckRepXServ:=TqckRepXServ.Create(nil);
   tiempofin.Caption:=DateTimeToStr(Now);//quitar
    try
      qckRepXServ.Prepare;
      glbTPag := qckRepXServ.PageNumber;
      qckRepXServ.Preview;
    finally
    qckRepXServ.Free;
    qckRepXServ:=Nil;
    end;
end;

procedure TfrmTransaccionesCxc.BitBtn5Click(Sender: TObject);
begin
  frmClientes:=TfrmClientes.create(nil);
  try
    frmClientes.Showmodal;
  finally
  frmClientes.Free;
  frmClientes:=Nil;
  end;
end;

procedure TfrmTransaccionesCxc.BitBtn9Click(Sender: TObject);
begin
  dmcxc.qryProcServ.close;
  dmcxc.qryProcServ.filtered:=false;
  dmcxc.qryProcServ.open;
  BitBtn12.Caption:='Aplicar Pagos';
  Label12.Caption := 'Num Fact';
  Label10.Caption:='Créditos por Aplicar';
  PanelProcServicios.BringToFront;
  PanelProcServicios.Visible:=True;
  dmcxc.RxMemoryData1.close;
  dmcxc.RxMemoryData1.EmptyTable;
  dmcxc.RxMemoryData1.open;
  dmcxc.RxMemoryData1.Insert;
  dmcxc.RxMemoryData1TipoDoc.value:=1;
  dmcxc.RxMemoryData1.Post;
  tipoD := 1;
  EditN1.SetFocus;
end;

procedure TfrmTransaccionesCxc.BitBtn10Click(Sender: TObject);
begin
  dmcxc.qryProcServ.Close;
  dmcxc.qryProcServ.filtered:=false;
  dmcxc.qryProcServ.open;
  BitBtn12.Caption:='Créditos por Aplicar';
  Label12.Caption := 'Num Recibo';
  Label10.Caption:='Ingresos';
  PanelProcServicios.BringToFront;
  PanelProcServicios.Visible:=True;
  dmcxc.RxMemoryData1.close;
  dmcxc.RxMemoryData1.EmptyTable;
  dmcxc.RxMemoryData1.open;

  dmcxc.RxMemoryData1.Insert;
  dmcxc.RxMemoryData1TipoDoc.value:=2;
  dmcxc.RxMemoryData1.Post;
  tipoD := 2;
  EditN1.SetFocus;
end;

procedure TfrmTransaccionesCxc.BitBtn15Click(Sender: TObject);
begin
  ScrollBox2.Visible:=False;
  dmCxc.dstblTransCxc.AutoEdit:=false;
  dmcxc.qryBlceCteSQL.Close;
  dmcxc.qryBlceCteSQL.SQL.Clear;
  edtCodCteRep.Text:= InputBox('Buscar balance de cliente por codigo','Entre Codigo','');
  {dmcxc.qryBlceCteSQL.SQL.Text:='Select Max(Fecha) fecha From trans_cxc Where codigo_cliente =:cc';
  if not dmcxc.qryBlceCteSQL.Prepared then
  dmcxc.qryBlceCteSQL.Prepare;
  if edtCodCteRep.ValueInteger > 0 then
  begin
    dmcxc.qryBlceCteSQL.Params[0].Value:=edtCodCteRep.Text;
    dmcxc.qryBlceCteSQL.ExecQuery;
    if dmcxc.qryBlceCteSQL.Open then
       if dmcxc.qryBlceCteSQL.RecordCount > 0 then
          GlbFechaInicial:=Extraerfecha(dmcxc.qryBlceCteSQL.FieldByName('fecha').Value)
      else
      GlbFechaInicial:=date - 30;
    end;    //aqui mi dios }
  if dmcxc.Qrybalancectes.State in [dsbrowse] then
  if dmcxc.Qrybalancectes.Locate('CODIGO',edtCodCteRep.ValueInteger,[]) then
  begin
    DBText2.Visible:=False;
    ScrollBox2.Visible:=True;
    Label23.Caption:=Format('%8.2n', [dmcxc.qrybalancectesbalance_act.Value]);
    Label27.Caption:=dmcxc.qryBalanceCtesNombreCliente.Value;
    if dmcxc.qryBalanceCtesFECHA_ULT_PAGO.Value = 0 then
    Label28.Caption:='' else
    Label28.Caption:=Formatdatetime('dd-mmm-yy',dmcxc.qryBalanceCtesFECHA_ULT_PAGO.Value);
    dmcxc.tblTransCxc.Locate('CODIGO_CLIENTE',edtCodCteRep.ValueInteger,[]);
    DBText2.Visible:=True;
  end else
  Begin
    MessageDlg('Codigo cliente no encontrado',mtInformation,[mbok],0);
    DBText2.Visible:=False;
  end;
end;

procedure TfrmTransaccionesCxc.BitBtn17Click(Sender: TObject);
var
  xNombre : String;
begin
  ScrollBox2.Visible:=False;
  dmCxc.dstblTransCxc.AutoEdit:=false;
  xNombre:= InputBox('Buscar balance de cliente por Nombre','Entre Nombre','');
  if xNombre <> '' then xNombre:= UpperCase(xNombre);
  dmcxc.qryBlceCteSQL.close;
  dmcxc.qryBlceCteSQL.Sql.Text:='Select codigo_cte From clientes Where upper(nombre_facturar) '+
  'Like :Nomb';
  dmcxc.qryBlceCteSQL.Params[0].Value := '%' + xNombre + '%';
  dmcxc.qryBlceCteSQL.ExecQuery;
  if dmcxc.qryBlceCteSQL.Open then
     if dmcxc.qryBlceCteSQL.RecordCount > 0 then
        edtCodCteRep.Text := dmcxc.qryBlceCteSQL.FieldByname('codigo_cte').AssTring
      else
      begin
        MessageDlg('Nombre Cliente No Existe, Verifique',mtInformation,[mbOk],0);
        exit;
      end;
//*****************
  {dmcxc.qryBlceCteSQL.Close;
  dmcxc.qryBlceCteSQL.SQL.Clear;
  edtCodCteRep.Text:= InputBox('Buscar balance de cliente por codigo','Entre Codigo','');
  dmcxc.qryBlceCteSQL.SQL.Text:='Select Max(Fecha) fecha From trans_cxc Where codigo_cliente =:cc';
  if not dmcxc.qryBlceCteSQL.Prepared then
  dmcxc.qryBlceCteSQL.Prepare;}
  {if edtCodCteRep.ValueInteger > 0 then
  begin
    dmcxc.qryBlceCteSQL.Params[0].Value:=edtCodCteRep.Text;
    //dmcxc.qryBlceCteSQL.CheckOpen;
    if dmcxc.qryBlceCteSQL.Open then
       if dmcxc.qryBlceCteSQL.RecordCount > 0 then
          GlbFechaInicial:=Extraerfecha(dmcxc.qryBlceCteSQL.FieldByName('fecha').Value)
      else
      GlbFechaInicial:=date - 30;
    end;    //aqui mi dios}
//*****************
  if dmcxc.Qrybalancectes.State in [dsbrowse] then
  if dmcxc.Qrybalancectes.Locate('CODIGO',edtCodCteRep.ValueInteger,[]) then
  begin
    DBText2.Visible:=False;
    ScrollBox2.Visible:=True;
    Label23.Caption:=Format('%8.2n', [dmcxc.qrybalancectesbalance_act.Value]);
    Label27.Caption:=dmcxc.qryBalanceCtesNombreCliente.Value;
    if dmcxc.qryBalanceCtesFECHA_ULT_PAGO.Value = 0 then
    Label28.Caption:='' else
    Label28.Caption:=Formatdatetime('dd-mmm-yy',dmcxc.qryBalanceCtesFECHA_ULT_PAGO.Value);
  end else
  Begin
    MessageDlg('Codigo cliente no encontrado',mtInformation,[mbok],0);
    DBText2.Visible:=False;
  end;
end;

procedure TfrmTransaccionesCxc.BitBtn16Click(Sender: TObject);
begin
  ProcRepBlcActual(GlbFechaInicial,ExtraerFecha(Date),edtCodCteRep.ValueInteger);
end;

procedure TfrmTransaccionesCxc.ActBalaceCteP;
begin
    if   dmcxc.QrybalanceCtes.Locate('CODIGO;SERVICIO;MONEDA',
         VarArrayOf([dmCxc.qryProcServCodigo_Cliente.Value,
                     dmCxc.qryProcServCodigo_Serv.Value,
                     dmCxc.qryProcServMoneda.Value]),[]) then
    begin
      EditarBalanceP;
    end else
    begin
      InsertaBalanceP;
    end;//locate
    if dmcxc.qryBalanceCtes.state in [dsedit,dsinsert] then
    begin
      dmcxc.qryBalanceCtes.Post;
      dmcxc.qryBalanceCtes.ApplyUpdates;
      glblineacodigo:='586';
    end;
    glblineacodigo:='595';
    if dmCxc.qryProcServ.State = dsInactive then
    dmCxc.qryProcServ.Open;
    dmCxc.qryProcServ.Edit;
    dmCxc.qryProcServStatus.Value:= 'R';
    dmCxc.qryProcServ.Post;
    dmCxc.qryProcServ.ApplyUpdates;
end;

procedure TfrmTransaccionesCxc.InsertaBalanceP;
begin
  dmcxc.qryBalanceCtes.Insert;
  dmcxc.qryBalanceCtesCODIGO.Value:=dmCxc.qryProcServcodigo_cliente.Value;
  dmcxc.qryBalanceCtesSERVICIO.Value:=dmCxc.qryProcServcodigo_serv.Value;
  dmcxc.qryBalanceCtesMONEDA.Value  :=dmCxc.qryProcServmoneda.Value;
  dmcxc.qryBalanceCtesSTATUS_BCE.Value:='A';
  dmcxc.qryBalanceCtesFECHA_BCE.Value :=dmCxc.qryProcServfecha.Value;
  dmcxc.qryBalanceCtesFECHA_IN.Value  :=Now;
  dmcxc.qryBalanceCtesIN_POR.Value    :=StrUserName;
  if (dmCxc.qryProcServtipo_doc.Value = 1) or (dmCxc.qryProcServtipo_doc.Value= 3) then
      begin
        dmcxc.qryBalanceCtesBALANCE_ACT.Value:= dmCxc.qryProcServVALOR_DOCUMENTO.Value;
        dmcxc.qryBalanceCtesDEBITO_MES.Value:=  dmCxc.qryProcServVALOR_DOCUMENTO.Value;
        dmcxc.qryBalanceCtesDEBITO_ACM.Value:=  dmCxc.qryProcServVALOR_DOCUMENTO.Value;
      end else
      if (dmCxc.qryProcServtipo_doc.Value= 2) or (dmCxc.qryProcServtipo_doc.Value= 4) or
         (dmCxc.qryProcServtipo_doc.Value= 5) then
      begin
        if (dmCxc.qryProcServtipo_doc.Value= 4) and ((dmCxc.qryProcServtipo_doc.Value= 1) ) then
        begin
          dmcxc.qryBalanceCtesBALANCE_ACT.Value:= dmCxc.qryProcServVALOR_DOCUMENTO.Value;
          dmcxc.qryBalanceCtesDEBITO_MES.Value:=  dmCxc.qryProcServVALOR_DOCUMENTO.Value;
          dmcxc.qryBalanceCtesDEBITO_ACM.Value:=  dmCxc.qryProcServVALOR_DOCUMENTO.Value;
        end else
        begin
          dmcxc.qryBalanceCtesBALANCE_ACT.Value:=//-
          dmcxc.qryBalanceCtesBALANCE_ACT.Value - dmCxc.qryProcServVALOR_DOCUMENTO.Value;
          dmcxc.qryBalanceCtesCREDITO_MES.Value:= dmCxc.qryProcServVALOR_DOCUMENTO.Value;
          dmcxc.qryBalanceCtesCREDITO_ACM.Value:= dmCxc.qryProcServVALOR_DOCUMENTO.Value;
          dmcxc.qryBalanceCtesFECHA_ULT_PAGO.Value:= dmCxc.qryProcServfecha.Value;
        end;
      end;
end;

procedure TfrmTransaccionesCxc.EditarBalanceP;
begin
  dmcxc.qryProcServ.edit;
  dmcxc.qryProcServTIPO_TRANF.Value:=tipoD;
  dmcxc.qryBalanceCtes.Edit;
  dmcxc.qryBalanceCtesFECHA_BCE.Value:= dmcxc.qryProcServfecha.Value;
  if (dmCxc.qryProcServTipo_Doc.Value = 1) Or (dmCxc.qryProcServtipo_doc.Value = 3) then
  begin
    dmcxc.qryBalanceCtesBALANCE_ACT.Value:=//+
    dmcxc.qryBalanceCtesBALANCE_ACT.Value + dmCxc.qryProcServvalor_documento.Value;
    dmcxc.qryBalanceCtesDEBITO_MES.Value:=//+
    dmcxc.qryBalanceCtesDEBITO_MES.Value + dmCxc.qryProcServvalor_documento.Value;
    dmcxc.qryBalanceCtesDEBITO_ACM.Value:=//+
    dmcxc.qryBalanceCtesDEBITO_ACM.Value + dmCxc.qryProcServvalor_documento.Value;
  end else //4-10-> tnf
  if (dmCxc.qryProcServtipo_doc.Value = 2) or (dmCxc.qryProcServtipo_doc.Value = 10) or
     (dmCxc.qryProcServtipo_doc.Value = 5) then
      begin
        if (dmCxc.qryProcServtipo_doc.Value = 10) and ((dmCxc.qryProcServtipo_tranf.Value = 1) ) then
        begin
          if (dmCxc.qryProcServtipo_doc.Value = 10) and ( dmCxc.qryProcServTIPO_TRANF.Value = 1 ) then
          begin
          dmcxc.qryBalanceCtesBALANCE_ACT.Value:=//+
          dmcxc.qryBalanceCtesBALANCE_ACT.Value + dmCxc.qryProcServvalor_documento.Value;
          dmcxc.qryBalanceCtesDEBITO_MES.Value:= //+
          dmcxc.qryBalanceCtesDEBITO_MES.Value + dmCxc.qryProcServvalor_documento.Value;
          dmcxc.qryBalanceCtesDEBITO_ACM.Value:=//+
          dmcxc.qryBalanceCtesDEBITO_ACM.Value + dmCxc.qryProcServvalor_documento.Value;
          end else
          if (dmCxc.qryProcServtipo_doc.Value = 10) and ( dmCxc.qryProcServTIPO_TRANF.Value = 2 ) then
          begin
            dmcxc.qryBalanceCtesBALANCE_ACT.Value:=//-
            dmcxc.qryBalanceCtesBALANCE_ACT.Value - dmCxc.qryProcServvalor_documento.Value;
            dmcxc.qryBalanceCtesCREDITO_MES.Value:= //+
            dmcxc.qryBalanceCtesCREDITO_MES.Value + dmCxc.qryProcServvalor_documento.Value;
            dmcxc.qryBalanceCtesCREDITO_ACM.Value:=//+
            dmcxc.qryBalanceCtesCREDITO_ACM.Value + dmCxc.qryProcServvalor_documento.Value;
          end;
        end else
        begin
          dmcxc.qryBalanceCtesBALANCE_ACT.Value:= //-
          dmcxc.qryBalanceCtesBALANCE_ACT.Value - dmCxc.qryProcServvalor_documento.Value;
          dmcxc.qryBalanceCtesCREDITO_MES.Value:= //+
          dmcxc.qryBalanceCtesCREDITO_MES.Value + dmCxc.qryProcServvalor_documento.Value;
          dmcxc.qryBalanceCtesCREDITO_ACM.Value:= //+
          dmcxc.qryBalanceCtesCREDITO_ACM.Value + dmCxc.qryProcServvalor_documento.Value;
          dmcxc.qryBalanceCtesFECHA_ULT_PAGO.Value:= dmCxc.qryProcServfecha.Value;
        end;
      end;
end;

procedure TfrmTransaccionesCxc.FiltrarFacturas1Click(Sender: TObject);
begin
  dmcxc.qryProcServ.Filtered:=False;
  //dmcxc.qryProcServ.Filter  :='TIPO_DOC = 1';
  GlbNombreCampo:='TIPO_DOC';
     GlbCampoInt:=1;
  dmcxc.qryProcServ.Filtered:=True;
end;

procedure TfrmTransaccionesCxc.FiltrarIngresos1Click(Sender: TObject);
begin
  dmcxc.qryProcServ.Filtered:=False;
  dmcxc.qryProcServ.Filter  :='TIPO_DOC = 2';
  GlbNombreCampo:='TIPO_DOC';                  
     GlbCampoInt:=2;
  dmcxc.qryProcServ.Filtered:=True;
end;

procedure TfrmTransaccionesCxc.Filtraruncliente1Click(Sender: TObject);
begin
  dmcxc.qryProcServ.Filtered:=False;
  //dmcxc.qryProcServ.Filter  :='CODIGO_CLIENTE = '+
  GlbNombreCampo:='CODIGO_CLIENTE';
     GlbCampoInt:=StrToInt(InputBox('Filtrar por codigo cliente','Entre codigo','0'));
  dmcxc.qryProcServ.Filtered:=True;
end;

procedure TfrmTransaccionesCxc.FiltrarProcesados1Click(Sender: TObject);
begin
  dmcxc.qryProcServ.Filtered:=False;
  dmcxc.qryProcServ.Filter  :='Status = '+chr(39)+'R'+chr(39);
  dmcxc.qryProcServ.Filtered:=True;
end;

procedure TfrmTransaccionesCxc.FiltrarPendientes1Click(Sender: TObject);
begin
 GlbSalirFiltro:=False;
  dmcxc.qryProcServ.Filtered:=False;
  //dmcxc.qryProcServ.Filter  :='Status = '+chr(39)+'A'+chr(39);
  GlbNombreCampo:='STATUS';
     GlbCampoStr:='A';
  dmcxc.qryProcServ.Filtered:=True;
end;

procedure TfrmTransaccionesCxc.QuitarFiltro1Click(Sender: TObject);
begin
  dmcxc.qryProcServ.Filtered:=False;
end;

procedure TfrmTransaccionesCxc.ProcesarCierreDiaTrn;
var
  Cierra:Boolean;
begin
  Cierra:=false;
  if VerificaCierreDia(17,1,1,ExtraerFecha(Now),GlbFechaTrnDiaria) then
  begin
    if MessageDlg('Desea Cerrar Transacciones del dia '+FormatDateTime('dd-mmm-yyyy',GlbFechaTrnDiaria)+'?',mtWarning,[mbNo,mbYes],0)=mrNo then
    Cierra:=false else Cierra:= True;
    if Cierra then
    begin
      dmcxc.qryBalanceCtes.Close;
      dmcxc.qryBalanceCtes.Filtered:=False;
      dmcxc.qryBalanceCtes.Open;
      frmVTrnDiaria:=TfrmVTrnDiaria.Create(Nil);
      try
        if StrToInt(FormatDateTime('dd',GlbFechaTrnDiaria)) = DiasEnElMes(StrToInt(FormatDateTime('yyyy',GlbFechaTrnDiaria)),
                                       StrToInt(FormatDateTime('mm',GlbFechaTrnDiaria))) then
        begin
          if MessageDlg('Es hora de cerrar el mes y el dia, desea cerrarlo ahora?',mtInformation,[mbyes,mbno,mbhelp],0)=mrYes then
          frmVTrnDiaria.CerrarMesBalanceCxc;
      end else
      frmVTrnDiaria.ActualizaHistorico;
        //frmVTrnDiaria.ActualizaHistorico;
      finally
      frmVTrnDiaria.Free;
      frmVTrnDiaria:=Nil;
      end;
      dmcxc.qryBalanceCtes.Close;
      dmcxc.tblTransCxc.Close;
      dmcxc.tblTransCxc.Filtered:=false;
      dmcxc.tblTransCxc.Params[0].Value := ExtraerFecha(GlbFechaTrnDiaria);
      dmcxc.tblTransCxc.Params[1].Value := ExtraerFecha(GlbFechaTrnDiaria);
      dmCxc.tblTransCxc.Params[2].Value:=glbCia_Key;      
      dmcxc.tblTransCxc.Open;
      dmcxc.qryProcServ.Close;
      dmcxc.qryProcServ.Params[0].Value := ExtraerFecha(GlbFechaTrnDiaria);
      dmcxc.qryProcServ.Params[1].Value := ExtraerFecha(GlbFechaTrnDiaria);
      dmcxc.qryProcServ.Open;
      glbfechainicial:=ExtraerFecha(GlbFechaTrnDiaria);
      glbfechaFinal  :=ExtraerFecha(GlbFechaTrnDiaria);
      LabelFechaTrn.Caption:='Procesando Datos de '+FormatDatetime('dd-mmm-yyyy',GlbFechaTrnDiaria);
      Beep;
      MessageDlg('Transcciones diarias posteada con exito',mtInformation,[mbok],0);
    end;
  end;
end;

procedure TfrmTransaccionesCxc.ProcRepBlcActual(xfechaIni:TDatetime;xfechaFin:TDatetime;bCodCte:Integer);
var
  a,m,d : Word;
begin
  DecodeDate(xfechaIni,a,m,d);
  if m = 1 then
  begin
    M:=12;
    Dec(a);
  end;
  if (d = 1) then
  begin
    Dec(m);
    d:=DiasEnElMes(a,m)
  end
  else Dec(d);
  dmCxc.qrybceHistCte.Close;
  dmCxc.qrybceHistCte.Params[0].Value:= 0;//historico
  dmCxc.qrybceHistCte.params[1].Value:= EncodeDate(a,m,d);
  dmCxc.qrybceHistCte.Params[2].Value:= EncodeDate(a,m,d);
  dmCxc.qrybceHistCte.Params[3].Value:= '1';
  dmCxc.qrybceHistCte.Params[4].Value:= bCodCte;
  dmCxc.qrybceHistCte.Params[5].Value:= bCodCte;  
  dmCxc.qrybceHistCte.Open;
  dmcxc.qryRepServ.Close;
  dmcxc.qryRepServ.Params[0].Value := ExtraerFecha(xFechaIni);
  dmcxc.qryRepServ.Params[1].Value := ExtraerFecha(xFechaFin);
  dmcxc.qryRepServ.Params[2].Value := bCodCte;
  dmcxc.qryRepServ.Open;

  //dmcxc.qrybceHistCte.Filtered:=False;
  //dmcxc.qrybceHistCte.Filter  :='CODIGO = '+Inttostr(bCodCte);
  //dmcxc.qrybceHistCte.Filtered:=True;
  //dmcxc.qryRepServ.Filtered   :=False;
  //dmcxc.qryRepServ.Filter     :='CODIGO_CTE = '+IntTostr(bCodCte);
  //dmcxc.qryRepServ.Filtered   :=True;

    qckRepXServ:=TqckRepXServ.Create(nil);
    try
      qckRepXServ.Prepare;
      glbTPag := qckRepXServ.PageNumber;
    finally
    qckRepXServ.QRPrinter.Free;
    end;
    qckRepXServ:=nil;


  qckRepXServ:=TqckRepXServ.Create(Nil);
  try
   qckRepXServ.Preview;
  finally
  qckRepXServ.Free;
  qckRepXServ:=Nil;
  end;
end;


procedure TfrmTransaccionesCxc.EditN3Exit(Sender: TObject);
begin
  if EditN3.text = '' then Exit;
  if (EditN1.ValueInteger <= 0) or (EditN2.ValueInteger <= 0) or
     (EditN3.ValueFloat <= 0) then Exit;
  //dmcxc.qryProcServ.AutoCalcFields:=False;
  //dmcxc.qryProcServ.Refresh;
  {if dmcxc.qryProcServ.State = dsInactive then
  begin
    dmcxc.qryProcServ.Close;
    dmcxc.qryProcServ.Params[0].Value := ExtraerFecha(GlbFechaTrnDiaria);
    dmcxc.qryProcServ.Params[1].Value := ExtraerFecha(GlbFechaTrnDiaria);
    dmcxc.qryProcServ.Open;
  end;}

  dmcxc.StpProcInsRecTrnCxc.Params[0].Value :=dmcxc.RxMemoryData1TipoDoc.Value;
  dmcxc.StpProcInsRecTrnCxc.Params[1].Value :='1';
  dmcxc.StpProcInsRecTrnCxc.Params[2].Value :=ExtraerFecha(GlbFechaTrnDiaria);
  dmcxc.StpProcInsRecTrnCxc.Params[3].Value :=EditN2.ValueInteger;
  dmcxc.StpProcInsRecTrnCxc.Params[4].Value :=EditN1.ValueInteger;
  dmcxc.StpProcInsRecTrnCxc.Params[5].Value :=1;
  dmcxc.StpProcInsRecTrnCxc.Params[6].Value :=Null;
  dmcxc.StpProcInsRecTrnCxc.Params[7].Value :=EditN3.ValueFloat;
  dmcxc.StpProcInsRecTrnCxc.Params[8].Value :=dmcxc.RxMemoryData1TipoDoc.Value;
  dmcxc.StpProcInsRecTrnCxc.Params[9].Value :='A';
  dmcxc.StpProcInsRecTrnCxc.Params[10].Value :=2;
  dmcxc.StpProcInsRecTrnCxc.Params[11].Value:=Null;
  dmcxc.StpProcInsRecTrnCxc.Params[12].Value:=VarUsuarioGlb;
  dmcxc.StpProcInsRecTrnCxc.ExecQuery;

  if Not dmcxc.StpProcInsRecTrnCxc.Transaction.InTransaction then
  dmcxc.StpProcInsRecTrnCxc.Transaction.StartTransaction;
  try
    dmcxc.StpProcInsRecTrnCxc.Transaction.CommitRetaining
  Except
  dmcxc.StpProcInsRecTrnCxc.Transaction.RollbackRetaining;
  end;
  BitBtn6Click(Self);
  EditN1.Text:='';
  EditN2.Text:='';
  EditN3.Text:='';
  EditN1.SetFocus;
  dmcxc.StpProcNombyBlcCte.Params[0].Value:=EditN1.ValueInteger;
  dmcxc.StpProcNombyBlcCte.ExecQuery;
  if dmcxc.StpProcNombyBlcCte.open then
  rxDatosProcCxc.InsertRecord([dmcxc.StpProcNombyBlcCte.Current.Vars[0].Value,
                               EditN1.ValueInteger,
                               EditN2.ValueInteger,
                               EditN3.ValueFloat,
                               dmcxc.StpProcNombyBlcCte.Current.Vars[1].Value,
                               tipoD,
                               dmcxc.StpProcInsRecTrnCxc.Current.Vars[0].Value]);
  dmcxc.StpProcNombyBlcCte.close;
  {dmcxc.qryProcServ.Close;
  dmcxc.qryProcServ.Params[0].Value := ExtraerFecha(GlbFechaTrnDiaria);
  dmcxc.qryProcServ.Params[1].Value := ExtraerFecha(GlbFechaTrnDiaria);
  dmcxc.qryProcServ.Open;
  dmcxc.qryProcServ.Last;}
  RxDBGrid2.Visible:=False;
  RxDBGrid4.Visible:=True;
  RxDBGrid4.BringToFront;
end;

procedure TfrmTransaccionesCxc.DBEdit7Change(Sender: TObject);
begin
  dmcxc.qryProcServ.AutoCalcFields:=True;
  if dmcxc.Qrybalancectes.State in [dsbrowse] then
  if   dmcxc.Qrybalancectes.Locate('CODIGO;SERVICIO;MONEDA',
         VarArrayOf([dmCxc.tblTransCxcCodigo_Cliente.Value,
                     dmCxc.tblTransCxcCodigo_Serv.Value,
                     dmCxc.tblTransCxcMoneda.Value]),[]) then
  DBText2.Visible:=True else DBText2.Visible:=False;
end;

procedure TfrmTransaccionesCxc.DBEdit7Exit(Sender: TObject);
begin
  if dmcxc.Qrybalancectes.State in [dsbrowse] then
  if   dmcxc.Qrybalancectes.Locate('CODIGO;SERVICIO;MONEDA',
         VarArrayOf([dmCxc.tblTransCxcCodigo_Cliente.Value,
                     dmCxc.tblTransCxcCodigo_Serv.Value,
                     dmCxc.tblTransCxcMoneda.Value]),[]) then
  DBText2.Visible:=True else DBText2.Visible:=False;
end;

procedure TfrmTransaccionesCxc.RxDBLookupCombo4Exit(Sender: TObject);
begin
  if dmcxc.tblTransCxcTIPO_DOC.Value = 1 then //fact
  dmcxc.tblTransCxcTIPO_TRANF.Value := 1 else
  if dmcxc.tblTransCxcTIPO_DOC.Value = 2 then //Ing
  dmcxc.tblTransCxcTIPO_TRANF.Value := 2 else
  if dmcxc.tblTransCxcTIPO_DOC.Value = 5 then
  dmcxc.tblTransCxcTIPO_TRANF.Value := 2 else
  if dmcxc.tblTransCxcTIPO_DOC.Value = 10 then
  dmcxc.tblTransCxcTIPO_TRANF.Value := 1;
end;

procedure TfrmTransaccionesCxc.BitBtn1Click(Sender: TObject);
begin
  {if dmcxc.tblTransCxc.State in [dsedit,dsinsert] then
  begin
    Messagedlg('Es obligatorio salvar, antes de procesar facturas',mtError,[mbok],0);
    exit;
  end;
  frmFctIngresos:=TfrmFctIngresos.Create(nil);
  try
    frmfctingresos.tipo     :=dmcxc.tblTransCxcTIPO_SERV.value;
    frmfctingresos.moneda   :=dmcxc.tblTransCxcMONEDA.Value;
    frmfctingresos.numerodoc:=dmcxc.tblTransCxcNUMERO_DOC.Value;
    dming.qryfctingresos.close;
    dming.qryfctingresos.Sql.Clear;
    dming.sqlScripqryfctingresos.ExecStatement(0);
    dming.qryfctingresos.Sql.Text:= dming.sqlScripqryfctingresos.SqlActual;
    dming.qryfctingresos.params[0].Value := dmcxc.tblTransCxcNUMERO_DOC.Value;
    dming.qryfctingresos.params[1].Value := dmcxc.tblTransCxcTIPO_Serv.Value;
    dming.qryfctingresos.params[2].Value := dmcxc.tblTransCxcTIPO_DOC.Value;
    //dming.qryfctingresos.params[1].Value := dmcxc.tblTransCxcTIPO_SERV.Value;
    dming.qryfctingresos.Open;
    frmFctIngresos.Showmodal;
  finally
  frmFctIngresos.Free;
  frmFctIngresos:= Nil;
  end;}
  Messagedlg('Opcion no contiene codigo',mtInformation,[mbok],0);
end;

procedure TfrmTransaccionesCxc.BitBtn2Click(Sender: TObject);
begin
  {PideFecha:=false;
  frmTransaccionesCnt:=TfrmTransaccionesCnt.Create(nil);
  try
    glbfechaInicial:=ExtraerFecha(dmcxc.tblTransCxcfecha.value);
    dm.qryMastertrncnt.Insert;
    dm.qryMastertrncntFECHA.Value:= ExtraerFecha(dmcxc.tblTransCxcfecha.value);
    dm.qryMastertrncntSTATUS.Value:='A';
    dm.qryMastertrncntDESCRIPCION.Value:= dmcxc.tblTransCxcCONCEPTO.Value;
    dm.qryMastertrncntMONTO.Value      := dmcxc.tblTransCxcVALOR_DOCUMENTO.Value;
    dm.qryMastertrncntTIPO_DOC.Value:= dmcxc.tblTransCxcTIPO_DOC.Value;
    dm.qryMastertrncntIN_POR.Value:=strUserName;
    dm.qryMastertrncntFECHA_IN.value := now;
    frmTransaccionesCnt.ShowModal;
  finally
  frmTransaccionesCnt.Free;
  frmTransaccionesCnt:=nil;
  end;
  PideFecha:=true; }
  Messagedlg('Opcion no contiene codigo',mtInformation,[mbok],0);
end;

procedure TfrmTransaccionesCxc.BitBtn18Click(Sender: TObject);
begin
{  frmConsultaMovCte:=TfrmConsultaMovCte.Create(nil);
  try
    frmConsultaMovCte.Showmodal;
  finally
  frmConsultaMovCte.free;
  frmConsultaMovCte:=nil;
  end;}
end;

procedure TfrmTransaccionesCxc.btnSalvarClick(Sender: TObject);
begin
  PasaACnt:=False;
  if dmcxc.tblTransCxc.State in [dsedit,dsinsert] then
  begin
    if not GlbPermiteDato(3,1,1,dmCxc.tblTransCxcfecha.Value) then
    begin
      dmCxc.tblTransCxc.Cancel;
    end;
    if dmcxc.tblTransCxc.State = dsinsert then
    begin
      PasaACnt:=true;
    end else PasaACnt:=False;
    dmcxc.tblTransCxc.post;
    dmcxc.tblTransCxc.ApplyUpdates;
    GlbSalvarQuery(dmcxc.tblTransCxc);
    if PasaACnt  then ActBalaceCte;
    //ActFechaBalance;
    if dmcxc.tblTransCxc.state in [dsedit] then
    begin
      dmcxc.tblTransCxc.post;
      dmcxc.tblTransCxc.ApplyUpdates;
    end;
    GlbSalvarQuery(dmcxc.tblTransCxc);
    if not dmcxc.tblTransCxc.Transaction.InTransaction then
    dmcxc.tblTransCxc.Transaction.StartTransaction;
    try
      dmcxc.tblTransCxc.Transaction.Commit;
    except
    dmcxc.tblTransCxc.Transaction.Rollback;
    end;
    dbnavigator2.Enabled:=true;
  end;
end;

procedure TfrmTransaccionesCxc.btnCancelarClick(Sender: TObject);
begin
  if dmcxc.tblTransCxc.State in [dsedit,dsinsert] then
  begin
    if Messagedlg('Cancelar Edición?',mtinformation,[mbyes,mbno],0) = mryes then
    dmcxc.tblTransCxc.cancel;
  end else
  if Messagedlg('Cancelar Record?',mtinformation,[mbyes,mbno],0) = mryes then
  begin
    if dmcxc.tblTransCxcSTATUS.Value = 'A' then
    begin
      dmcxc.tblTransCxc.Edit;
      dmcxc.tblTransCxcSTATUS.Value := 'C';
      btnSalvarClick(self);
    end;
  end;
end;

procedure TfrmTransaccionesCxc.btnCerarAbrirresClick(Sender: TObject);
begin
  if dmcxc.tblTransCxc.State in [dsInactive,dsBrowse] then
  begin
    frmSelfecha:=TfrmSelfecha.Create(Nil);
    try
    if frmSelfecha.Showmodal = mrOk then
    begin
      dmcxc.tblTransCxc.Close;
      dmcxc.tblTransCxc.Filtered:= False;
      dmcxc.tblTransCxc.Params[0].Value := ExtraerFecha(frmselfecha.fechaini.date);
      dmcxc.tblTransCxc.Params[1].Value := ExtraerFecha(frmselfecha.fechafin.date);
      dmCxc.tblTransCxc.Params[2].Value:=glbCia_Key;      
      dmcxc.tblTransCxc.Open;
      dmcxc.qryProcServ.Close;
      dmcxc.qryProcServ.Params[0].Value := ExtraerFecha(frmSelfecha.FechaIni.Date);
      dmcxc.qryProcServ.Params[1].Value := ExtraerFecha(frmSelfecha.FechaIni.Date);
      dmcxc.qryProcServ.Open;
      glbfechainicial:=ExtraerFecha(frmSelfecha.FechaIni.Date);
      glbfechaFinal  :=ExtraerFecha(frmSelfecha.FechaIni.Date);
    end;
    dmcxc.RxMemoryData1.close;
    dmcxc.RxMemoryData1.EmptyTable;
    dmcxc.RxMemoryData1.open;
    finally
    frmSelfecha.free;
    frmSelfecha:=nil;
    end;
  end;
end;


procedure TfrmTransaccionesCxc.ActFechaBalance;
begin

end;

procedure TfrmTransaccionesCxc.EditarBalance;
begin

end;

procedure TfrmTransaccionesCxc.ActBalaceCte;
begin
  dmcxc.qryBalanceCtes.Close;
  dmcxc.qryBalanceCtes.Open;
    if   dmcxc.qrybalancectes.Locate('CODIGO;SERVICIO;MONEDA',
         VarArrayOf([dmCxc.tblTransCxcCODIGO_CLIENTE.Value,
                     dmCxc.tblTransCxcCODIGO_SERV.Value,
                     dmCxc.tblTransCxcMoneda.Value]),[]) then
    begin
      EditarBalance;
    end else
    begin
      InsertaBalance;
    end;//locate
    dmcxc.qryBalanceCtes.post;
    dmcxc.qryBalanceCtes.ApplyUpdates;
    if not dmcxc.qryBalanceCtes.Transaction.InTransaction then
    dmcxc.qryBalanceCtes.Transaction.StartTransaction;
    try
      dmcxc.qryBalanceCtes.Transaction.Commit;
    except
    dmcxc.qryBalanceCtes.Transaction.Rollback;
  end;
end;

procedure TfrmTransaccionesCxc.InsertaBalance;
begin
  dmcxc.qryBalanceCtes.Insert;
  dmcxc.qryBalanceCtesCODIGO.Value  :=dmCxc.tblTransCxcCODIGO_CLIENTE.Value;
  dmcxc.qryBalanceCtesSERVICIO.Value:=dmCxc.tblTransCxccodigo_serv.Value;
  dmcxc.qryBalanceCtesMONEDA.Value  :=dmCxc.tblTransCxcmoneda.Value;
  dmcxc.qryBalanceCtesSTATUS_BCE.Value:='A';
  dmcxc.qryBalanceCtesFECHA_BCE.Value :=dmCxc.tblTransCxcfecha.Value;
  dmcxc.qryBalanceCtesFECHA_IN.Value  :=Now;
  dmcxc.qryBalanceCtesIN_POR.Value    :=StrUserName;
  dmcxc.tblTransCxc.Edit;
  dmcxc.tblTransCxcSTATUS.Value := 'R';
  if (dmCxc.tblTransCxctipo_doc.Value = 1) or (dmCxc.tblTransCxctipo_doc.Value = 3) then
      begin
        dmcxc.qryBalanceCtesBALANCE_ACT.Value:= dmCxc.tblTransCxcVALOR_DOCUMENTO.Value;
        dmcxc.qryBalanceCtesDEBITO_MES.Value:=  dmCxc.tblTransCxcVALOR_DOCUMENTO.Value;
        dmcxc.qryBalanceCtesDEBITO_ACM.Value:=  dmCxc.tblTransCxcVALOR_DOCUMENTO.Value;
      end else
      if (dmCxc.tblTransCxctipo_doc.Value = 2) or (dmCxc.tblTransCxctipo_doc.Value = 4) or
         (dmCxc.tblTransCxctipo_doc.Value = 5) then
      begin
        if (dmCxc.tblTransCxctipo_doc.Value = 4) and ((dmCxc.tblTransCxctipo_tranf.Value = 1) ) then
        begin
          dmcxc.qryBalanceCtesBALANCE_ACT.Value:= dmCxc.tblTransCxcVALOR_DOCUMENTO.Value;
          dmcxc.qryBalanceCtesDEBITO_MES.Value:=  dmCxc.tblTransCxcVALOR_DOCUMENTO.Value;
          dmcxc.qryBalanceCtesDEBITO_ACM.Value:=  dmCxc.tblTransCxcVALOR_DOCUMENTO.Value;
        end else
        begin
          dmcxc.qryBalanceCtesBALANCE_ACT.Value:=//-
          dmcxc.qryBalanceCtesBALANCE_ACT.Value - dmCxc.tblTransCxcVALOR_DOCUMENTO.Value;
          dmcxc.qryBalanceCtesCREDITO_MES.Value:= dmCxc.tblTransCxcVALOR_DOCUMENTO.Value;
          dmcxc.qryBalanceCtesCREDITO_ACM.Value:= dmCxc.tblTransCxcVALOR_DOCUMENTO.Value;
          dmcxc.qryBalanceCtesFECHA_ULT_PAGO.Value:= dmCxc.tblTransCxcfecha.Value;
        end;
      end;

end;

procedure TfrmTransaccionesCxc.RxDBGrid2GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if Field.FullName = 'Balance_Act' then
  Background := $00A4BC63;
  if (dmcxc.qryProcServSTATUS.Value = 'R') and (dmcxc.qryProcServTIPO_DOC.Value = 1) then
  begin
    Background := $00CAFFCA;
    Afont.Color:= clBlack;
  end else if (dmcxc.qryProcServSTATUS.Value = 'R') and
      ((dmcxc.qryProcServTIPO_DOC.Value = 2) or (dmcxc.qryProcServTIPO_DOC.Value = 10)) then
  begin
    Background := clTeal;
    Afont.Color:= clBlack;
  end;
end;

procedure TfrmTransaccionesCxc.DBGrid1DblClick(Sender: TObject);
begin
  DBGrid1.Visible:=false;
  DBGrid1.SendToBack;
end;

procedure TfrmTransaccionesCxc.DBGrid2DblClick(Sender: TObject);
begin
  DBGrid2.Visible:=false;
  DBGrid2.SendToBack;
end;

procedure TfrmTransaccionesCxc.PorCliente1Click(Sender: TObject);
begin
{  Accept := (DataSet['codigo_cte'] = StrToInt(EditN1.Text)) and
            (DataSet['TIPO_CLIENTE'] = 1);}
  dmcxc.tblTransCxc.Filtered:=False;
  //Accept := (DataSet[GlbNombreCampo] = GlbCampoInt);
  GlbNombreCampo:='CODIGO_CLIENTE';
  GlbCampoInt:=StrToInt(InputBox('Filtrar por codigo cliente','Entre codigo','0'));
  dmcxc.tblTransCxc.Filtered:=True;
end;

procedure TfrmTransaccionesCxc.Facturas1Click(Sender: TObject);
begin
  dmcxc.tblTransCxc.Filtered:=False;
  //dmcxc.tblTransCxc.Filter  :='TIPO_DOC = 1';
  GlbNombreCampo:='TIPO_DOC';
     GlbCampoInt:=1;
  dmcxc.tblTransCxc.Filtered:=True;
end;

procedure TfrmTransaccionesCxc.Ingresos1Click(Sender: TObject);
begin
  dmcxc.tblTransCxc.Filtered:=False;
  //dmcxc.tblTransCxc.Filter  :='TIPO_DOC = 2';
  GlbNombreCampo:='TIPO_DOC';
     GlbCampoInt:=2;
  dmcxc.tblTransCxc.Filtered:=True;
end;

procedure TfrmTransaccionesCxc.NotaCredito1Click(Sender: TObject);
begin
  dmcxc.tblTransCxc.Filtered:=False;
  //dmcxc.tblTransCxc.Filter  :='TIPO_DOC = 5';
  GlbNombreCampo:='TIPO_DOC';
     GlbCampoInt:=5;
  dmcxc.tblTransCxc.Filtered:=True;
end;

procedure TfrmTransaccionesCxc.Todas1Click(Sender: TObject);
begin
  dmcxc.tblTransCxc.Filtered:=False;
end;

procedure TfrmTransaccionesCxc.BuscarCliente1Click(Sender: TObject);
begin
  dmcxc.qryProcServ.Filtered:=False;
  if not dmcxc.qryProcServ.Locate('CODIGO_CLIENTE',StrToInt(
       InputBox('Filtrar por codigo cliente','Entre codigo','')),[]) then
  Messagedlg('Cliente no encontrado',mtinformation,[mbOk],0);
end;

procedure TfrmTransaccionesCxc.VerDebitosCreditosdelDia1Click(
  Sender: TObject);
begin
  frmVerCreditosyDebitosAplicados :=TfrmVerCreditosyDebitosAplicados.Create(nil);
  try
    frmVerCreditosyDebitosAplicados.BuscarDatos(GlbFechaTrnDiaria,GlbFechaTrnDiaria,'1','3');
    frmVerCreditosyDebitosAplicados.Label3.Caption:=FormatDatetime('dd-mmm-yyyy',GlbFechaTrnDiaria);
    frmVerCreditosyDebitosAplicados.Showmodal;
  finally
  frmVerCreditosyDebitosAplicados.Free;
  frmVerCreditosyDebitosAplicados:=nil;
  end;
end;

end.
