unit URepConFoto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, WinSkinData, Buttons, DB, IBCustomDataSet, IBTable,
  IBQuery, RXCtrls;

type
  TfrmRepConFoto = class(TForm)
    Label1: TLabel;
    cboxTipoCuota: TComboBox;
    IBTable1: TIBTable;
    IBTable1CODIGO: TIntegerField;
    IBTable1DESCRIPCION: TIBStringField;
    IBTable1FRECUENCIA_DIAS: TIntegerField;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn1: TBitBtn;
    chBoxTipoCuota: TCheckBox;
    SkinData1: TSkinData;
    cboxCodigo: TComboBox;
    Label2: TLabel;
    qryClientes: TIBQuery;
    qryClientesCODIGO: TIntegerField;
    qryClientesNOMBRECTE: TIBStringField;
    RxLabel1: TRxLabel;
    procedure cboxTipoCuotaChange(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cboxCodigoExit(Sender: TObject);
  private
    { Private declarations }
    procedure Imprimir(x : smallint; TipoCuota:Smallint);
  public
    { Public declarations }
  end;

var
  frmRepConFoto: TfrmRepConFoto;
  xCodCte : String;

implementation
uses UDatModCon, UDatModReportes, URepMora, URepMoraCte,
  URepMoraCteDetCuotas;

{$R *.dfm}

procedure TfrmRepConFoto.cboxTipoCuotaChange(Sender: TObject);
begin
  if Not IBTable1.Locate('DESCRIPCION', cboxTipoCuota.Text,[]) then
  begin
    MessageDlg('Descripción tipo cuota no encontrado, verifique',mtInformation, [mbOK], 0);
  end;
end;

procedure TfrmRepConFoto.BitBtn2Click(Sender: TObject);
begin
  RxLabel1.Caption:='Espere...';
  RxLabel1.Visible:=True;
  Imprimir(1,IBTable1FRECUENCIA_DIAS.Value);
  RxLabel1.Visible:=False;
end;

procedure TfrmRepConFoto.BitBtn3Click(Sender: TObject);
begin
  RxLabel1.Caption:='Espere...';
  RxLabel1.Visible:=True;
  Imprimir(2,IBTable1CODIGO.Value);
  RxLabel1.Visible:=False;
end;

procedure TfrmRepConFoto.FormCreate(Sender: TObject);
var
  x : string;
begin
  cboxTipoCuota.Items.Clear;
  ibTable1.close;
  ibTable1.open;
  ibTable1.First;
  x:=IBTable1DESCRIPCION.Value;
  While Not ibTable1.Eof Do
  begin
    cboxTipoCuota.Items.Add(IBTable1DESCRIPCION.Value);
    ibTable1.Next;
  end;
  cboxTipoCuota.Text := x;

  qryClientes.Close;
  qryClientes.Open;
  qryClientes.First;
  cboxCodigo.Clear;
  While Not qryClientes.Eof Do
  Begin
    cboxCodigo.Items.Add(qryClientesNOMBRECTE.Value);
    qryClientes.Next;
  end;
end;

procedure TfrmRepConFoto.Imprimir(x, TipoCuota: Smallint);
var
  tipo: String;
begin
  if chBoxTipoCuota.Checked then
  begin
    dmReportes.qryRepMoraXCte.Close;
    dmReportes.qryRepMoraXCte.Params[0].Value := 0;
    dmReportes.qryRepMoraXCte.Params[1].Value := 100;
    if (cboxCodigo.Text = '') then
    begin
      dmReportes.qryRepMoraXCte.Params[2].Value := 0;
      dmReportes.qryRepMoraXCte.Params[3].Value := 9999;
    end else
    begin
      dmReportes.qryRepMoraXCte.Params[2].Value := qryClientesCODIGO.Value;
      dmReportes.qryRepMoraXCte.Params[3].Value := qryClientesCODIGO.Value;
    end;
    dmReportes.qryRepMoraXCte.Open;
    tipo:='';
  end else
  begin
    dmReportes.qryRepMoraXCte.Close;
    dmReportes.qryRepMoraXCte.Params[0].Value := TipoCuota;
    dmReportes.qryRepMoraXCte.Params[1].Value := TipoCuota;
    if (cboxCodigo.Text = '') then
    begin
      dmReportes.qryRepMoraXCte.Params[2].Value := 0;
      dmReportes.qryRepMoraXCte.Params[3].Value := 9999;
    end else
    begin
      dmReportes.qryRepMoraXCte.Params[2].Value := qryClientesCODIGO.Value;
      dmReportes.qryRepMoraXCte.Params[3].Value := qryClientesCODIGO.Value;
    end;
    dmReportes.qryRepMoraXCte.Open;
    tipo:=cboxTipoCuota.Text;
  end;
  qckRepMoracteCtaDet:=TqckRepMoracteCtaDet.Create(Nil);
  try
    if (tipo = '') then
      qckRepMoracteCtaDet.QRLabel12.Caption:=''
    else qckRepMoracteCtaDet.QRLabel12.Caption:=tipo;
  if x = 1 then
  begin
    qckRepMoracteCtaDet.PrinterSetup;
    qckRepMoracteCtaDet.Print;
  end else
  begin
    qckRepMoracteCtaDet.Preview;
  end;
  finally
  qckRepMoracteCtaDet.Free;
  qckRepMoracteCtaDet:=Nil;
  end;
end;

procedure TfrmRepConFoto.cboxCodigoExit(Sender: TObject);
begin
  xCodCte:=cboxCodigo.Text;
  qryClientes.Locate('NOMBRECTE', xCodCte,[]);
end;

end.
