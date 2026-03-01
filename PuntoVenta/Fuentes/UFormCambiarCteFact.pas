unit UFormCambiarCteFact;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, EditNew, Buttons;

type
  TfrmCambiarCteFact = class(TForm)
    edtCodCte: TEditN;
    BitBtn1: TBitBtn;
    edtNombreCte: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    labelNumFactura: TLabel;
    Label4: TLabel;
    labelNombreActual: TLabel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCambiarCteFact: TfrmCambiarCteFact;

implementation

uses UBuscarClientesPersonasP, UDatModClientes;

{$R *.dfm}

procedure TfrmCambiarCteFact.BitBtn1Click(Sender: TObject);
begin
  FrmBuscarClientesPersonas:=TFrmBuscarClientesPersonas.Create(nil);
  try
    if FrmBuscarClientesPersonas.showmodal = mrOk then
    begin
      edtCodCte.SetInteger(FrmBuscarClientesPersonas.CodigoCliente);
      edtNombreCte.Caption:=FrmBuscarClientesPersonas.nombrecliente;
    end;
  finally
  FrmBuscarClientesPersonas.free;
  FrmBuscarClientesPersonas:=nil;
  end;
end;

procedure TfrmCambiarCteFact.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  dmclientes.qryClientes.Close;
  dmclientes.qryClientes.Open;
  if (edtCodCte.ValueInteger > 0) then
  begin
    if not dmclientes.qryClientes.Locate('CODIGO_CTE',edtCodCte.ValueInteger,[]) then
    begin
      MessageDlg('Cliente no existe verifique.',mterror,[mbyes,mbno],0);
      edtCodCte.SetInteger(0);
      CanClose:=False;
    end
    else CanClose:=True;
   end;
end;

end.
