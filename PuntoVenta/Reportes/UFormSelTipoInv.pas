unit UFormSelTipoInv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, IBCustomDataSet, IBQuery, Buttons, ExtCtrls,
  WinSkinData;

type
  TfrmSelTipoInv = class(TForm)
    qryTipoInv: TIBQuery;
    qryTipoInvCODIGO: TSmallintField;
    qryTipoInvDESCRIPCION: TIBStringField;
    edtTipoInv: TComboBox;
    Label1: TLabel;
    RadioGroup1: TRadioGroup;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    chkBoxtodo: TCheckBox;
    RadioGroup2: TRadioGroup;
    RadioGroup3: TRadioGroup;
    SkinData1: TSkinData;
    procedure FormCreate(Sender: TObject);
    procedure edtTipoInvChange(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
      xTipoInv : integer;
  end;

var
  frmSelTipoInv: TfrmSelTipoInv;


implementation

uses UDatModConectar;

{$R *.dfm}

procedure TfrmSelTipoInv.FormCreate(Sender: TObject);
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

procedure TfrmSelTipoInv.edtTipoInvChange(Sender: TObject);
begin
  if qryTipoInv.Locate('descripcion',edtTipoInv.Text,[]) then
  xTipoInv := qryTipoInvCODIGO.Value;
end;

end.
