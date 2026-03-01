unit UFormRepTipoXInv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, WinSkinData, DB, IBCustomDataSet, IBQuery,
  ExtCtrls;

type
  TfrmRepTipoXInv = class(TForm)
    Label1: TLabel;
    edtTipoInv: TComboBox;
    chkBoxtodo: TCheckBox;
    qryTipoInv: TIBQuery;
    qryTipoInvCODIGO: TSmallintField;
    qryTipoInvDESCRIPCION: TIBStringField;
    SkinData1: TSkinData;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    RadioGroup1: TRadioGroup;
    procedure edtTipoInvChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
      xTipoInv : integer;
  end;

var
  frmRepTipoXInv: TfrmRepTipoXInv;

implementation
uses UDatModConectar;

{$R *.dfm}

procedure TfrmRepTipoXInv.edtTipoInvChange(Sender: TObject);
begin
  if qryTipoInv.Locate('descripcion',edtTipoInv.Text,[]) then
  xTipoInv := qryTipoInvCODIGO.Value;
end;

procedure TfrmRepTipoXInv.FormCreate(Sender: TObject);
begin
  edtTipoInv.Clear;
  try
    qryTipoInv.Close;
    qryTipoInv.Open;
    qryTipoInv.First;
    while Not qryTipoInv.Eof Do
    begin
      edtTipoInv.Items.Add(qryTipoInvDESCRIPCION.Value);
      qryTipoInv.Next;
    end;
    qryTipoInv.First;
    edtTipoInv.Text := qryTipoInvDESCRIPCION.Value;
    edtTipoInvChange(Self);
  finally
  end;
end;

end.
 