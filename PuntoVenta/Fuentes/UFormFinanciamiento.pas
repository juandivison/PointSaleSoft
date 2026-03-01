unit UFormFinanciamiento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, StdCtrls, RxDBComb, Mask, DBCtrls, RxMemDS,
  RxLookup, Buttons, RXCtrls, RXDBCtrl, Grids, DBGrids, IBTable, IBQuery,
  IBStoredProc, WinSkinData;

type
  TfrmFinanciamiento = class(TForm)
    DataSource1: TDataSource;
    rxDatosFinanc: TRxMemoryData;
    rxDatosFinancfrec_pago: TIntegerField;
    rxDatosFinanccantCuotas: TIntegerField;
    rxDatosFinancPorcInteres: TFloatField;
    rxDatosFinancporcMora: TFloatField;
    rxDatosFinancMontoInicial: TFloatField;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBComboBox1: TDBComboBox;
    DBComboBox2: TDBComboBox;
    RxDBLookupCombo3: TRxDBLookupCombo;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    RxDBGrid1: TRxDBGrid;
    DBStatusLabel1: TDBStatusLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    RxDBGrid2: TRxDBGrid;
    Label7: TLabel;
    rxDatosFinancMontoInteres: TCurrencyField;
    rxDatosFinancMontoFinanciado: TCurrencyField;
    rxDatosFinancMontoCuota: TCurrencyField;
    Label5: TLabel;
    DBEdit2: TDBEdit;
    Label8: TLabel;
    DBEdit3: TDBEdit;
    Label9: TLabel;
    DBEdit4: TDBEdit;
    tblFrecPago: TIBTable;
    DataSource2: TDataSource;
    RxLabel1: TRxLabel;
    rxLabelNombreCliente: TRxLabel;
    qryFinancAbiertos: TIBQuery;
    dsqryFinancAbiertos: TDataSource;
    qryFinancAbiertosSERIE: TIntegerField;
    qryFinancAbiertosNUMERO_TRN: TIntegerField;
    qryFinancAbiertosFECHA: TDateTimeField;
    qryFinancAbiertosCODIGO_CTE: TIntegerField;
    qryFinancAbiertosTIPO_FREC_PAGO: TIntegerField;
    qryFinancAbiertosPORCIENTO: TFloatField;
    qryFinancAbiertosPORC_MORA: TFloatField;
    qryFinancAbiertosCANT_CUOTAS: TIntegerField;
    qryFinancAbiertosMONTOINICIAL: TFloatField;
    qryFinancAbiertosDEBITO_ACUM: TFloatField;
    qryFinancAbiertosCREDITO_ACUM: TFloatField;
    qryFinancAbiertosMONTO_MORA_ACUM: TFloatField;
    qryFinancAbiertosMONTO_DESC_PRONTOPAGO: TFloatField;
    qryFinancAbiertosBALANCE_ACT: TFloatField;
    qryFinancAbiertosFECHA_ULT_PAGO: TDateTimeField;
    qryFinancAbiertosSTATUS: TIBStringField;
    qryFinancAbiertosID_USUARIO_IN: TIntegerField;
    qryFinancAbiertosFECHA_IN: TDateTimeField;
    qryFinancAbiertosNOMBREPC: TIBStringField;
    qryFinancAbiertosFECHA_UPDATE: TDateTimeField;
    qryFinancAbiertosID_USUARIO_UPDATE: TIntegerField;
    tblFrecPagoCODIGO: TIntegerField;
    tblFrecPagoDESCRIPCION: TIBStringField;
    tblFrecPagoFRECUENCIA_DIAS: TIntegerField;
    tblInteres: TIBTable;
    dstblInteres: TDataSource;
    tblInteresCODIGO: TIntegerField;
    tblInteresFECHA_INICIAL: TDateTimeField;
    tblInteresFECHA_FINAL: TDateTimeField;
    tblInteresPORCIENTO: TFloatField;
    tblInteresPORC_MORA: TFloatField;
    DBComboBox3: TDBComboBox;
    rxDatosFinancNumeroFactura: TIntegerField;
    stpInsFinanciamiento: TIBStoredProc;
    Label10: TLabel;
    DBEdit5: TDBEdit;
    rxDatosFinancMontoAFinanciar: TCurrencyField;
    SkinData1: TSkinData;
    Label11: TLabel;
    DBEdit6: TDBEdit;
    rxDatosFinancMontoTotalVenta: TCurrencyField;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure rxDatosFinancCalcFields(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBComboBox1Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    xnumeroTrn : Integer;
    xCodigocliente : integer;
    procedure ProcInsertarDatos;
  end;

var
  frmFinanciamiento: TfrmFinanciamiento;

implementation

uses UDatModConectar, uGlobal;

{$R *.dfm}

procedure TfrmFinanciamiento.FormCreate(Sender: TObject);
begin
  rxDatosFinanc.Close;
  rxDatosFinanc.Open;
  tblFrecPago.close;
  tblFrecPago.Close;
  tblFrecPago.Open;
  tblInteres.Close;
  tblInteres.Open;
  DBComboBox2.Items.Clear;
  DBComboBox3.Items.Clear;
  tblInteres.First;
  While Not tblInteres.Eof Do
  begin
    DBComboBox2.Items.Add(tblInteresPORCIENTO.AsString);
    DBComboBox3.Items.Add(tblInteresPORC_MORA.AsString);
    tblInteres.Next;
  end;
  DBComboBox1.Color:= clyellow;
end;

procedure TfrmFinanciamiento.BitBtn10Click(Sender: TObject);
begin
//  dmCertificacion.tblCertificacion.prior;
end;

procedure TfrmFinanciamiento.BitBtn11Click(Sender: TObject);
begin
//  dmCertificacion.tblCertificacion.next;
end;

procedure TfrmFinanciamiento.BitBtn12Click(Sender: TObject);
begin
//  dmCertificacion.tblCertificacion.last;
end;

procedure TfrmFinanciamiento.BitBtn1Click(Sender: TObject);
begin
  {if dmCertificacion.tblCertificacion.State in [dsBrowse] then
  begin
    dmCertificacion.tblCertificacion.Insert;
    dmCertificacion.tblCertificacionSTATUS.value:='A';
    dmCertificacion.tblCertificacionfecha.value:=ExtraerFecha(date);
    dmCertificacion.tblCertificacionINSERTADO_POR.Value:=strUserName;
    dmCertificacion.tblCertificacionFECHA_IN.Value:=now;
    dmCertificacion.tblCertificacionLUGAR_EXPEDICION.Value:=dmCompania.tblCompaniaCIUDAD.Value;
    dbedit2.setfocus;
  end;}
end;

procedure TfrmFinanciamiento.BitBtn2Click(Sender: TObject);
begin
  if rxDatosFinanc.State in [dsBrowse] then
  rxDatosFinanc.Edit;
end;

procedure TfrmFinanciamiento.BitBtn3Click(Sender: TObject);
begin
  if rxDatosFinanc.State in [dsInsert, dsEdit] then
  rxDatosFinanc.Cancel
  else
  begin
    if MessageDlg('Eliminar record?',mtInformation, [mbyes,mbno], 0)=mryes then
    begin
      rxDatosFinanc.Post;
    end;
  end;

end;


procedure TfrmFinanciamiento.BitBtn4Click(Sender: TObject);
begin
  if rxDatosFinanc.State in [dsInsert, dsEdit] then
  begin
    rxDatosFinanc.Post;
    if showing then
    close;
  end;
end;

procedure TfrmFinanciamiento.ProcInsertarDatos;
var
  nombrepc : String[12];
begin
    //MessageDlg('EN DESARROLLO',mtInformation, [mbOK], 0);
    stpInsFinanciamiento.Params[0].Value := xNumeroTrn;
    stpInsFinanciamiento.Params[1].Value := ExtraerFecha(GlbFechaTrnDiaria);
    stpInsFinanciamiento.Params[2].Value := xCodigoCliente;
    stpInsFinanciamiento.Params[3].Value := rxDatosFinancfrec_pago.Value;
    stpInsFinanciamiento.Params[4].Value := rxDatosFinancPorcInteres.Value;
    stpInsFinanciamiento.Params[5].Value := rxDatosFinancporcMora.Value;
    stpInsFinanciamiento.Params[6].Value := rxDatosFinanccantCuotas.Value;
    stpInsFinanciamiento.Params[7].Value := rxDatosFinancMontoInicial.Value;//rxDatosFinancMontoInicial.Value;
    stpInsFinanciamiento.Params[8].Value := rxDatosFinancMontoAFinanciar.Value - rxDatosFinancMontoInicial.Value;//rxDatosFinancMontoFinanciado.Value;
    stpInsFinanciamiento.Params[9].Value := 0;
    stpInsFinanciamiento.Params[10].Value:= 0;
    stpInsFinanciamiento.Params[11].Value:= 0;
    stpInsFinanciamiento.Params[12].Value:= rxDatosFinancMontoAFinanciar.Value - rxDatosFinancMontoInicial.Value;//rxDatosFinancMontoFinanciado.Value;
    stpInsFinanciamiento.Params[13].Value:= null;
    stpInsFinanciamiento.Params[14].Value:= 'A';
    stpInsFinanciamiento.Params[15].Value:= VarUsuarioGlb;
    stpInsFinanciamiento.Params[16].Value:= now;
    nombrepc := StrUserName;
    stpInsFinanciamiento.Params[17].Value:= NombrePc;
    stpInsFinanciamiento.Params[18].Value:= Null;
    stpInsFinanciamiento.Params[19].Value:= Null;
    stpInsFinanciamiento.Params[20].Value:= rxDatosFinancNumeroFactura.Value;
    stpInsFinanciamiento.Params[21].Value:= rxDatosFinancCantCuotas.Value;
    stpInsFinanciamiento.Params[22].Value:= rxDatosFinancMontoAFinanciar.Value - rxDatosFinancMontoInicial.Value;
    stpInsFinanciamiento.ExecProc;
    //rxDatosFinanc.ApplyUpdates;
    if not stpInsFinanciamiento.Transaction.InTransaction then
    stpInsFinanciamiento.Transaction.StartTransaction;
    try
      stpInsFinanciamiento.Transaction.CommitRetaining;
    except
        stpInsFinanciamiento.Transaction.RollbackRetaining;
    end;
end;

procedure TfrmFinanciamiento.BitBtn5Click(Sender: TObject);
begin
  if rxDatosFinanc.State in [dsBrowse, dsInactive] then
  begin
    rxDatosFinanc.Close;
    rxDatosFinanc.Open;
  end;
end;

procedure TfrmFinanciamiento.rxDatosFinancCalcFields(DataSet: TDataSet);
begin
  if rxDatosFinancPorcInteres.Value > 0 then
  rxDatosFinancMontoInteres.Value:=
  (rxDatosFinancPorcInteres.Value/100) *
  (rxDatosFinancMontoAFinanciar.Value
  - rxDatosFinancMontoInicial.Value);

  rxDatosFinancMontoFinanciado.Value := (rxDatosFinancMontoAFinanciar.Value
  - rxDatosFinancMontoInicial.Value) +
  (rxDatosFinancMontoInteres.Value * rxDatosFinanccantCuotas.Value);

  if rxDatosFinanccantCuotas.Value > 0 then
  rxDatosFinancMontoCuota.Value :=
  rxDatosFinancMontoFinanciado.Value / rxDatosFinanccantCuotas.Value;
end;

procedure TfrmFinanciamiento.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if rxDatosFinanc.State In [dsEdit, dsInsert] then
  begin
     MessageDlg('Existe una transacción en progreso, verifique.',mtInformation, [mbOK], 0);
     CanClose := False;
  end else CanClose := True;
end;

procedure TfrmFinanciamiento.DBComboBox1Exit(Sender: TObject);
begin
  DBComboBox1.Color:=clWindow;
end;

end.
