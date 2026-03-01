unit UDatosCambioTasa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, EditNew, Buttons;

type
  TfrmDatosCambioTasa = class(TForm)
    Label1: TLabel;
    dtpkFechaInicia: TDateTimePicker;
    edtValorTasa: TEditN;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    Procedure ActualizaTasa(mCodigo : String);
  public
    { Public declarations }
  end;

var
  frmDatosCambioTasa: TfrmDatosCambioTasa;

implementation
uses UTasaDolar, Uglobal;
{$R *.DFM}

procedure TfrmDatosCambioTasa.ActualizaTasa(mCodigo : String);
var
  mFechaF : TDatetime;
begin
  mFechaF := Extraerfecha(dtpkFechaInicia.Date)-1;//correcto jrd
  if mcodigo = '2' then
  begin
    frmMoneda.qryMonedaDet.Filtered:= False;
    frmMoneda.mCodigo:= mcodigo;
    //frmMoneda.qryMonedaDet.Filter  := 'Codigo = '+chr(39)+mcodigo+chr(39);
    frmMoneda.qryMonedaDet.Filtered:= True;
    //frmMoneda.qryMonedaDet.Last;
  end;
  if frmMoneda.qryMonedaDet.RecordCount = 0 then
  begin
    frmMoneda.qryMonedaDet.Filtered:= False;
    BitBtn1.ModalResult := mrCancel;
  end;
  frmMoneda.qryMonedaDet.Edit;
  frmMoneda.qryMonedaDetFecha_Final.Value := ExtraerFecha(mFechaF);
  frmmoneda.qryMonedaDetMOD_POR.Value     := StrUserName;
  frmmoneda.qryMonedaDetFECHA_UPD.Value   := Now;
  frmMoneda.qryMonedaDet.Post;
  frmMoneda.qryMonedaDet.ApplyUpdates;
  if not frmMoneda.qryMonedaDet.Transaction.InTransaction then
  frmMoneda.qryMonedaDet.Transaction.StartTransaction;
  try
    frmMoneda.qryMonedaDet.Transaction.CommitRetaining;
  except
  frmMoneda.qryMonedaDet.Transaction.RollbackRetaining;
  end;
  
  frmMoneda.qryMonedaDet.Insert;
  frmMoneda.qryMonedaDetSerie.Value := FsqlMaxNumero('Moneda_Det','Serie');
  frmMoneda.qryMonedaDetCodigo.Value := mcodigo;
  frmMoneda.qryMonedaDetFecha_Inicial.Value := ExtraerFecha(dtpkFechaInicia.Date);
  frmMoneda.qryMonedaDetFecha_Final.Value   := ExtraerFecha(dtpkFechaInicia.Date)+364;
  if mcodigo = '1' then
  frmmoneda.qryMonedaDetVALOR.Value := 1
  else frmmoneda.qryMonedaDetVALOR.Value := edtValorTasa.ValueFloat;
  frmMoneda.qryMonedaDetFECHA_IN.value := Now;
  frmMoneda.qryMonedaDetINSERTADO_POR.value := StrUserName;
  frmMoneda.qryMonedaDet.Post;
  frmMoneda.qryMonedaDet.ApplyUpdates;
  if not frmMoneda.qryMonedaDet.Transaction.InTransaction then
  frmMoneda.qryMonedaDet.Transaction.StartTransaction;
  try
    frmMoneda.qryMonedaDet.Transaction.CommitRetaining;
  except
  frmMoneda.qryMonedaDet.Transaction.RollbackRetaining;
  end;
  frmMoneda.qryMonedaDet.Filtered:= False;
end;

procedure TfrmDatosCambioTasa.BitBtn1Click(Sender: TObject);
begin
  if edtValorTasa.ValueFloat <= 0 then
  begin
    MessageDlg('Valor tasa no puede ser cero, verifique',mtError, [mbOK], 0);
    Exit
  end;
  if edtValorTasa.ValueFloat > 0 then
  begin
    ActualizaTasa(frmMoneda.qryMonedaDetCodigo.Value);//pesos
    ActualizaTasa('2');//dollar
  end else
  BitBtn1.ModalResult:=mrCancel;
end;

procedure TfrmDatosCambioTasa.FormCreate(Sender: TObject);
begin
  dtpkFechaInicia.Date:=date;
end;

end.
