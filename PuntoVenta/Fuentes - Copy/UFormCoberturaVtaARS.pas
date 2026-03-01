unit UFormCoberturaVtaARS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, WinSkinData, DB,
  IBCustomDataSet, IBQuery, RxLookup, RxCtrls, RxDBCtrl;

type
  TfrmCoberturaVtaARS = class(TForm)
    btnSalvar: TBitBtn;
    Label4: TLabel;
    Label6: TLabel;
    DBEdit2: TDBEdit;
    DBEdit4: TDBEdit;
    Label9: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    DBEdit6: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    SkinData1: TSkinData;
    DBMemo1: TDBMemo;
    DataSource1: TDataSource;
    qryARS: TIBQuery;
    qryARSIDARS: TIntegerField;
    qryARSRNC: TIBStringField;
    qryARSNOMBRE: TIBStringField;
    qryARSLETRAAUTORIZACION: TIBStringField;
    qryARSCONTACTO: TIBStringField;
    qryARSDIRECCION: TMemoField;
    qryARSTELEFONO: TIBStringField;
    qryARSTIPO_NCF: TIBStringField;
    qryARSDIASDECREDITO: TIntegerField;
    qryARSPORC_DESCUENTO: TFloatField;
    qryARSSTATUS: TIBStringField;
    qryARSFECHA_IN: TDateTimeField;
    qryARSFECHA_UPDATE: TDateTimeField;
    qryARSIN_POR: TIBStringField;
    qryARSUPDATE_POR: TIBStringField;
    dsqryARS: TDataSource;
    DBStatusLabel1: TDBStatusLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    Label1: TLabel;
    RxDBLookupCombo7: TRxDBLookupCombo;
    DBEdit5: TDBEdit;
    Label5: TLabel;
    DBEdit7: TDBEdit;
    Label7: TLabel;
    DBText1: TDBText;
    Label8: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure DBEdit7Change(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure DBEdit4Exit(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCoberturaVtaARS: TfrmCoberturaVtaARS;

implementation

uses UProcVentaRapida, UDatModConectar, UDatModClientes;

{$R *.dfm}

procedure TfrmCoberturaVtaARS.FormCreate(Sender: TObject);
begin
  qryARS.Close;
  qryARS.Open;
  refresh;
end;

procedure TfrmCoberturaVtaARS.btnSalvarClick(Sender: TObject);
begin
  if frmProcVentaRapida.rxCobertura.state in [dsEdit, dsInsert] then
  begin
    IF (frmProcVentaRapida.rxCoberturaNum_Autorizacion.IsNull OR
    frmProcVentaRapida.rxCoberturaAfiliado.IsNull) THEN
    BEGIN
      MessageDlg('Favor completar los datos.',mtError,[mbok],0);
      DBEdit1.SetFocus;
      DBEdit1.Color:=clYellow;
      DBEdit4.Color:=clYellow;
      exit;
    END;
    dmclientes.tblClientes.Close;
    dmclientes.tblClientes.Open;
    dmclientes.qryClientes.close;
    dmclientes.qryClientes.Open;
    if dmclientes.qryClientes.Locate('CODIGO_AGENCIA',frmProcVentaRapida.rxCoberturaIDARS .Value,[]) then
    begin
      frmProcVentaRapida.rxCoberturaCodigo_Cliente.Value:=dmclientes.qryClientescodigo_cte.value;
    end;
    frmProcVentaRapida.rxCobertura.Post;
  end;
  Close;
end;

procedure TfrmCoberturaVtaARS.DBEdit7Change(Sender: TObject);
begin
  if frmProcVentaRapida.rxCobertura.state in [dsedit, dsinsert] then
  if frmProcVentaRapida.rxCoberturaAplicaDesc.Value > 0 then
  frmProcVentaRapida.rxCoberturaMontoCobertura.Value :=
  frmProcVentaRapida.rxCoberturaMontoTotal.Value *
  frmProcVentaRapida.rxCoberturaAplicaDesc.Value / 100;
end;

procedure TfrmCoberturaVtaARS.DBEdit2Exit(Sender: TObject);
begin
  if frmProcVentaRapida.rxCoberturaMontoCobertura.Value > 0 then
  begin
    frmProcVentaRapida.rxCoberturaAplicaDesc.Value:=
    (frmProcVentaRapida.rxCoberturaMontoCobertura.Value /
    frmProcVentaRapida.rxCoberturaMontoTotal.Value) * 100
  end;
end;

procedure TfrmCoberturaVtaARS.DBEdit4Exit(Sender: TObject);
begin
  DBEdit4.Color:=clWindow;
end;

procedure TfrmCoberturaVtaARS.DBEdit1Exit(Sender: TObject);
begin
  DBEdit1.Color:=clWindow;
end;

end.
