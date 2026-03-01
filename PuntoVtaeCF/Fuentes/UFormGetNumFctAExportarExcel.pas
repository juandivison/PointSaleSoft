unit UFormGetNumFctAExportarExcel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, EditNew;

type
  TfrmGetNumFactExpExcel = class(TForm)
    edtNumFactura: TEditN;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGetNumFactExpExcel: TfrmGetNumFactExpExcel;

implementation

uses UFormFacturas;

{$R *.dfm}

procedure TfrmGetNumFactExpExcel.BitBtn2Click(Sender: TObject);
begin
  frmConsultaFacturas:=TfrmConsultaFacturas.Create(Nil);
  try
    frmConsultaFacturas.BitBtn2.Caption:='&OK';
    if frmConsultaFacturas.ShowModal = mrOk then
    edtNumFactura.SetInteger(frmConsultaFacturas.EditN1.ValueInteger);
    if (edtNumFactura.ValueInteger <= 0) then
    BitBtn1.Enabled:=False;
  finally
  if Assigned(frmConsultaFacturas) then
  frmConsultaFacturas.Free;
  frmConsultaFacturas:=Nil;
  end;
end;

end.
