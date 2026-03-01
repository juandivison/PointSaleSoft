unit UFormCambiarCtePoliza;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, StdCtrls, Buttons, RxLookup,
  RxMemDS, WinSkinData;

type
  TfrmCambiarCtePoliza = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    qryCliente: TIBQuery;
    qryClienteCODIGO_CTE: TIntegerField;
    qryClienteNOMBRE_FACTURAR: TIBStringField;
    rxCliente: TRxMemoryData;
    rxClientecodigo: TIntegerField;
    Label1: TLabel;
    dsrxCliente: TDataSource;
    RxDBLookupCombo1: TRxDBLookupCombo;
    dsqryCliente: TDataSource;
    BitBtn3: TBitBtn;
    SkinData1: TSkinData;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCambiarCtePoliza: TfrmCambiarCtePoliza;

implementation
  uses UGlobal, UBuscarClientesPersonasP, UDatModClientes;
{$R *.dfm}

procedure TfrmCambiarCtePoliza.FormCreate(Sender: TObject);
begin
  rxCliente.Close;
  rxCliente.Open;
  rxCliente.Append;
  rxClienteCodigo.Value:=-1;
  rxCliente.Post;
  
  qryCliente.close;
  qryCliente.params[0].Value:= glbCia_Key;
  qryCliente.open;
end;

procedure TfrmCambiarCtePoliza.BitBtn3Click(Sender: TObject);
begin
  FrmBuscarClientesPersonas:=TFrmBuscarClientesPersonas.Create(Nil);
  try
    if FrmBuscarClientesPersonas.showmodal = mrOk then
    begin
      rxCliente.Edit;
      rxClientecodigo.Value := FrmBuscarClientesPersonas.CodigoCliente;
      rxCliente.Open;      
    end;
  finally
  FrmBuscarClientesPersonas.Free;
  FrmBuscarClientesPersonas:=Nil;
  end;
end;

procedure TfrmCambiarCtePoliza.RxDBLookupCombo1Exit(Sender: TObject);
begin
  if rxCliente.State in [dsEdit, dsInsert] then rxCliente.Post;
end;

end.
