unit UFormClientWisPro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, RxDBCtrl, DB, WinSkinData;

type
  TfrmClientWisPro = class(TForm)
    DataSource1: TDataSource;
    RxDBGrid1: TRxDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    SkinData1: TSkinData;
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClientWisPro: TfrmClientWisPro;

implementation

uses UDatModClientes, UBuscarClientesPersonasP;

{$R *.dfm}

procedure TfrmClientWisPro.BitBtn3Click(Sender: TObject);
begin
  FrmBuscarClientesPersonas:=TFrmBuscarClientesPersonas.Create(Nil);
  try
    if FrmBuscarClientesPersonas.showmodal = mrOk then
    begin
      if not dmClientes.tblClientwisPro.Locate('codigo_cte', FrmBuscarClientesPersonas.CodigoCliente,[]) then
      MessageDlg('Cliente no encontrado.', mtInformation, [mbOK], 0);
    end;
  finally
  FrmBuscarClientesPersonas.Free;
  FrmBuscarClientesPersonas:=Nil;
  end;
end;

procedure TfrmClientWisPro.FormCreate(Sender: TObject);
begin
  dmClientes.tblClientwisPro.close;
  dmClientes.tblClientwisPro.open;
end;

end.
