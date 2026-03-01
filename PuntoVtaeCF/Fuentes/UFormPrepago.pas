unit UFormPrepago;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, DB, Mask, IBCustomDataSet, IBQuery, Buttons,
  RxLookup, RxToolEdit, RxDBCtrl, WinSkinData, RxCtrls, Grids, DBGrids,
  ComCtrls;

type
  TfrmProcesarPrepago = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DBStatusLabel1: TDBStatusLabel;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    DBMemo1: TDBMemo;
    DBEdit6: TDBEdit;
    DBDateEdit2: TDBDateEdit;
    RxDBLookupCombo2: TRxDBLookupCombo;
    BitBtn17: TBitBtn;
    btnInsertar: TBitBtn;
    btnModificar: TBitBtn;
    btnSalvar: TBitBtn;
    btnCancelar: TBitBtn;
    btnCerarAbrirres: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    RxDBLookupCombo1: TRxDBLookupCombo;
    dmtblPrepagoCte: TDataSource;
    qryCteLookup: TIBQuery;
    dsqryCteLookup: TDataSource;
    SkinData1: TSkinData;
    dstblFormaPago: TDataSource;
    RxDBGrid1: TRxDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure btnInsertarClick(Sender: TObject);
    procedure btnModificarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnCerarAbrirresClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    _codigoCte : integer;
  end;

var
  frmProcesarPrepago: TfrmProcesarPrepago;

implementation

uses UDatModFactura, Uglobal, UMaestroClientes, UDatModClientes,
  UDatModPanaderia, UQckComprobantePrepago, UQckCotizacionOrdenTrab,
  UDatosVentas;

{$R *.dfm}

procedure TfrmProcesarPrepago.FormCreate(Sender: TObject);
begin
  dmVentas.tblFormaPago.Close;
  dmVentas.tblFormaPago.Open;
  qryCteLookup.close;
  qryCteLookup.open;
end;

procedure TfrmProcesarPrepago.BitBtn17Click(Sender: TObject);
var
  codcte : integer;
begin
  frmClientes:=TfrmClientes.Create(Nil);
  try
    dmclientes.tblClientes.Tag:=-1;
    dmclientes.tblClientes.DisableControls;
    dmclientes.tblClientes.Locate('CODIGO_CTE', dmPanaderia.tblPrecioCuadrosCODIGO_CTE.Value,[]);
    dmclientes.tblClientes.Tag:=0;
    dmclientes.tblClientes.EnableControls;

    frmClientes.Showmodal;
    codcte := dmClientes.tblClientesCODIGO_CTE.Value;
  finally
  frmClientes.Free;
  frmClientes:=Nil;
  end;
  if (dmFactura.tblPrepagoCteCODIGO_CTE.Value <> codcte) then
  begin
    dmFactura.tblPrepagoCte.Close;
    dmFactura.tblPrepagoCte.Params[0].Value:= codcte;
    dmFactura.tblPrepagoCte.Open;
  end;
  if dmFactura.tblPrepagoCte.State in [dsEdit, dsInsert] then
  begin
     dmFactura.tblPrepagoCteCODIGO_CTE.Value :=  codcte;
  end else
  dmFactura.tblPrepagoCte.Locate('CODIGO_CTE',codcte,[]);
end;

procedure TfrmProcesarPrepago.btnInsertarClick(Sender: TObject);
begin
  if dmFactura.tblPrepagoCte.State in [dsBrowse] then
  dmFactura.tblPrepagoCte.Append;
end;

procedure TfrmProcesarPrepago.btnModificarClick(Sender: TObject);
begin
  if dmFactura.tblPrepagoCte.State in [dsBrowse] then
  begin
    dmFactura.tblPrepagoCte.Edit;
  end;
end;

procedure TfrmProcesarPrepago.btnSalvarClick(Sender: TObject);
begin
  if (dmFactura.tblPrepagoCteMONTO.Value <=0) then
  begin
    MessageDlg('Debes indicar monto, verifique.',mtError,[mbok],0);
    Exit;
  end;
  if dmFactura.tblPrepagoCte.State in [dsInsert, dsEdit] then
  begin
    if (dmFactura.tblPrepagoCteNOTA.IsNull) then
    dmFactura.tblPrepagoCteNota.Value:=' ';
    if dmFactura.tblPrepagoCte.State in [dsInsert] then
    dmFactura.tblPrepagoCteNUMERO.Value:= FsqlMaxNumero('PRE_PAGO','NUMERO');
    GlbSalvarQuery(dmFactura.tblPrepagoCte);
  end;
end;

procedure TfrmProcesarPrepago.BitBtn1Click(Sender: TObject);
begin
  if dmFactura.tblPrepagoCte.State in [dsBrowse] then
  begin
    if MessageDlg('¿Desea eliminar record?', mtWarning,[mbyes, mbno],0) = mryes then
    begin
      dmFactura.tblPrepagoCte.Delete;
      GlbSalvarQuery(dmFactura.tblPrepagoCte);
    end;
  end;
end;

procedure TfrmProcesarPrepago.btnCancelarClick(Sender: TObject);
begin
  if dmFactura.tblPrepagoCte.State in [dsInsert, dsEdit] then
  begin
    dmFactura.tblPrepagoCte.Cancel;
  end;
end;

procedure TfrmProcesarPrepago.btnCerarAbrirresClick(Sender: TObject);
begin
  if dmFactura.tblPrepagoCte.State in [dsInactive, dsBrowse] then
  begin
    dmFactura.tblPrepagoCte.Close;
    dmFactura.tblPrepagoCte.Open;
  end;
end;

procedure TfrmProcesarPrepago.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 113) then
  btnModificarClick(Self)
  else
  if (key = 116) then
  begin
    btnSalvarClick(Self);
  end;
end;

procedure TfrmProcesarPrepago.BitBtn3Click(Sender: TObject);
var
  flag:boolean;
begin
  dmFactura.qryAbonoPrepago.Close;
  dmFactura.qryAbonoPrepago.params[0].Value:=dmFactura.tblPrepagoCteNUMERO.Value;
  dmFactura.qryAbonoPrepago.Open;
  qckComprobanteAbonoPrep:=TqckComprobanteAbonoPrep.Create(nil);
  try
    qckComprobanteAbonoPrep.hCImpreso:=False;
    if dmFactura.qryAbonoPrepagoNOTA.IsNull then
    begin
      qckComprobanteAbonoPrep.Page.Length:=qckComprobanteAbonoPrep.Page.Length - 1.10;
    end;
      //qckComprobanteAbonoPrep.Prepare;
      {repeat
        begin
          if (qckComprobanteAbonoPrep.PageNumber > 1) then
          begin
            qckComprobanteAbonoPrep.Page.Length:=qckComprobanteAbonoPrep.Page.Length + 0.26;
            qckComprobanteAbonoPrep.Prepare;
            flag:=False;
          end else
          if (qckComprobanteAbonoPrep.PageNumber = 1) then
          begin
            flag:=true;
            break;
          end;
        end;
      until flag = true;}

  qckComprobanteAbonoPrep.Preview;
  finally
  qckComprobanteAbonoPrep.free;
  qckComprobanteAbonoPrep:=nil;
  end;

end;

end.
