unit UFormAplicarDbCrCxc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, RxMemDS, StdCtrls, ExtCtrls, DBCtrls, Mask, RxToolEdit,
  RxDBCtrl, RxDBComb, Buttons, WinSkinData;

type
  TfrmAplicarDbCrCxc = class(TForm)
    rxData: TRxMemoryData;
    rxDataCodigoCliente: TIntegerField;
    rxDataNumeroDoc: TIntegerField;
    rxDataTipo_tranf: TSmallintField;
    rxDataMonto: TCurrencyField;
    rxDataNota: TStringField;
    rxDataFecha: TDateTimeField;
    rxDataMoneda: TStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DataSource1: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    rxdbboxmoneda: TRxDBComboBox;
    Label6: TLabel;
    DBDateEdit1: TDBDateEdit;
    Label7: TLabel;
    DBEdit5: TDBEdit;
    BitBtn8: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn7: TBitBtn;
    SkinData1: TSkinData;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure FormClick(Sender: TObject);
    procedure DBEdit2Enter(Sender: TObject);
  private
    { Private declarations }
    procedure EditarBalanceP(monto : Real);
  public
    { Public declarations }
  end;

var
  frmAplicarDbCrCxc: TfrmAplicarDbCrCxc;

implementation
  uses UDatModConectar, UGlobal, UDatModCxc, UFormAuditoriaBlcCxc;
{$R *.dfm}

procedure TfrmAplicarDbCrCxc.FormCreate(Sender: TObject);
begin
  rxData.Close;
  rxData.Open;
end;

procedure TfrmAplicarDbCrCxc.BitBtn8Click(Sender: TObject);
var
  xserie:integer;
begin
  if rxData.State = dsInactive then exit;
  if rxData.State in [dsEdit, dsInsert] then
     rxData.Post;
     
  if dmcxc.qryTrancxc.State = dsInactive then
  begin
    dmcxc.qrytrancxc.Filtered:=False;
    dmcxc.qrytrancxc.Close;
    dmcxc.qrytrancxc.Params[2].Value := GlbCia_Key;
    dmcxc.qrytrancxc.Open;
  end;

  rxData.First;
  While Not rxData.Eof do
  begin
    dmcxc.qrytrancxc.Insert;
    dmcxc.qryTrancxcnumero_recibo.Value:=rxDataNumeroDoc.Value;

    if rxDataTipo_tranf.Value = 1 then
    begin
      dmcxc.qrytrancxctipo_doc.Value := 3;
      EditarBalanceP(rxDataMonto.Value);
    end else
    if rxDataTipo_tranf.Value = 2 then
    begin
      dmcxc.qrytrancxctipo_doc.Value := 5;
      EditarBalanceP(rxDataMonto.Value*-1);
    end;

    dmcxc.qrytrancxccia_key.Value        := GlbCia_Key;
    dmcxc.qrytrancxcmoneda.Value         := rxDataMONEDA.Value;

    dmcxc.qrytrancxcfecha.Value := ExtraerFecha(rxDatafecha.Value);

    dmcxc.qrytrancxcnumero_doc.Value     := rxDataNumeroDoc.Value;
    dmcxc.qrytrancxctipo_serv.Value      := 2;
    dmcxc.qrytrancxccodigo_cliente.Value := rxDataCodigoCliente.Value;
    dmcxc.qrytrancxccodigo_serv.Value    := 0;
    dmcxc.qrytrancxcconcepto.Value       := rxDataNota.Value;
    dmcxc.qrytrancxcValor_documento.Value:= rxDataMonto.Value;
    dmcxc.qrytrancxcTipo_tranf.Value     := rxDataTipo_tranf.Value;
    dmcxc.qryTrancxcCODIGO_VENDEDOR.Value:= VarUsuarioGlb;
    dmcxc.qryTrancxcIN_POR.Value         := strusername;
    dmcxc.qryTrancxcFECHA_IN.Value       := Now;
    dmcxc.qrytrancxcStatus.Value         := 'A';
    dmcxc.qrytrancxc.Post;
    dmcxc.qrytrancxc.ApplyUpdates;

    GlbSalvarQuery(dmcxc.qrytrancxc);
    xserie:=dmcxc.qrytrancxcserie.AsInteger;
    GlbSalvarQuery(frmAuditoriaBlcCxc.tblBalanceCteCxc);
    rxData.Next;
  end;
  frmAuditoriaBlcCxc.tblTranscxc.Close;
  frmAuditoriaBlcCxc.tblTranscxc.Open;
  frmAuditoriaBlcCxc.tblTranscxc.Locate('serie',xserie,[]);
  frmAuditoriaBlcCxc.tblBalanceCteCxc.Close;
  frmAuditoriaBlcCxc.tblBalanceCteCxc.Open;
end;

procedure TfrmAplicarDbCrCxc.EditarBalanceP(monto: Real);
begin
  frmAuditoriaBlcCxc.tblBalanceCteCxc.Edit;
  frmAuditoriaBlcCxc.tblBalanceCteCxcBALANCE_ANT.Value:=frmAuditoriaBlcCxc.tblBalanceCteCxcBALANCE_ACT.Value;
  frmAuditoriaBlcCxc.tblBalanceCteCxcBALANCE_ACT.Value:=frmAuditoriaBlcCxc.tblBalanceCteCxcBALANCE_ACT.Value + monto;//+
  frmAuditoriaBlcCxc.tblBalanceCteCxcDEBITO_MES.Value:=//+
  frmAuditoriaBlcCxc.tblBalanceCteCxcDEBITO_MES.Value + Monto;//dmCxc.tblTransCxcvalor_documento.Value;
  frmAuditoriaBlcCxc.tblBalanceCteCxcDEBITO_ACM.Value:=//+
  frmAuditoriaBlcCxc.tblBalanceCteCxcDEBITO_ACM.Value + Monto;//dmCxc.tblTransCxcvalor_documento.Value;
  frmAuditoriaBlcCxc.tblBalanceCteCxcFECHA_MOD.Value:=now;
  frmAuditoriaBlcCxc.tblBalanceCteCxcMOD_POR.Value:= strusername;
end;

procedure TfrmAplicarDbCrCxc.BitBtn7Click(Sender: TObject);
begin
  close;
end;

procedure TfrmAplicarDbCrCxc.BitBtn11Click(Sender: TObject);
begin
  rxData.Cancel;
end;

procedure TfrmAplicarDbCrCxc.FormClick(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmAplicarDbCrCxc.DBEdit2Enter(Sender: TObject);
begin
  DBEdit2.SelectAll;
end;

end.
