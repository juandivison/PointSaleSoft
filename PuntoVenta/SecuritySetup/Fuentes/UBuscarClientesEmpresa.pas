unit UBuscarClientesEmpresa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UBuscarClientesPersonas, ComCtrls, DBCtrls, Grids, DBGrids,
  StdCtrls, Buttons, ExtCtrls, WinSkinData, DB;

type
  TFrmBuscarClientesEmpresas = class(TFrmBuscarClientesPersonas)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBuscarClientesEmpresas: TFrmBuscarClientesEmpresas;

implementation

uses UContrato, UDatModContrato;

{$R *.dfm}

procedure TFrmBuscarClientesEmpresas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //inherited;
  frmContrato.EditEmpresas.Text:=dmContrato.qryClienteRNC.Value;
  Action:=CaFree;
end;

procedure TFrmBuscarClientesEmpresas.Button1Click(Sender: TObject);
begin
//  inherited;
  if RadioGroup1.ItemIndex = 0 then
  begin
    if Not dmContrato.QryCliente.Locate('CODIGO',StrToInt(Edit1.Text),[loCaseInsensitive,loPartialKey]) then
    MessageDlg('Código Cliente no encontrado',mtInformation, [mbOK], 0);
  end else if RadioGroup1.ItemIndex = 1 then
  begin
    if Not dmContrato.QryCliente.Locate('LICENCIA',Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    MessageDlg('Licencia Cliente no encontrado',mtInformation, [mbOK], 0);
  end else if RadioGroup1.ItemIndex = 2 then
  begin
    if Not dmContrato.QryCliente.Locate('rnc',Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    MessageDlg('RNC Cliente no encontrado',mtInformation, [mbOK], 0);
  end else if RadioGroup1.ItemIndex = 3 then
  begin
    if Not dmContrato.QryCliente.Locate('PASAPORTE',Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    MessageDlg('Pasaporte Cliente no encontrado',mtInformation, [mbOK], 0);
  end else if RadioGroup1.ItemIndex = 4 then
  begin
    if Not dmContrato.QryCliente.Locate('NOMBRE_EMPRESA',Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    MessageDlg('Nombre Cliente no encontrado',mtInformation, [mbOK], 0);
  end else if RadioGroup1.ItemIndex = 5 then
  begin
    if Not dmContrato.QryCliente.Locate('Apellido',Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    MessageDlg('Apellido no encontrado',mtInformation, [mbOK], 0);
  end else if RadioGroup1.ItemIndex = 6 then
  begin
    if Not dmContrato.QryCliente.Locate('Telefono_Local',Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    MessageDlg('Telefono cliente no encontrado',mtInformation, [mbOK], 0);
  end;
end;

procedure TFrmBuscarClientesEmpresas.RadioGroup1Click(Sender: TObject);
begin
  //inherited;
  if RadioGroup1.ItemIndex = 0 then
  begin
    if Edit1.Text = '' then Exit;
    if not dmContrato.QryCliente.Locate('CODIGO',StrToInt(Edit1.Text),[loCaseInsensitive,loPartialKey]) then
    dbgrid1.Visible:=False else  dbgrid1.Visible:=True;
  end else if RadioGroup1.ItemIndex = 1 then
  begin
    if Not dmContrato.QryCliente.Locate('LICENCIA',Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    dbgrid1.Visible:=False else  dbgrid1.Visible:=True;
  end else if RadioGroup1.ItemIndex = 2 then
  begin
    if not dmContrato.QryCliente.Locate('Rnc',Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    dbgrid1.Visible:=False else  dbgrid1.Visible:=True;
  end  else if RadioGroup1.ItemIndex = 3 then
  begin
    if not dmContrato.QryCliente.Locate('PASAPORTE',Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    dbgrid1.Visible:=False else  dbGrid1.Visible:=True;
  end else if RadioGroup1.ItemIndex = 4 then
  begin
    if not dmContrato.QryCliente.Locate('Nombre_Empresa',Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    dbgrid1.Visible:=False else  dbGrid1.Visible:=True;
  end else if RadioGroup1.ItemIndex = 5 then
  begin
    if not dmContrato.QryCliente.Locate('APELLIDO',Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    dbgrid1.Visible:=False else  dbGrid1.Visible:=True;
  end else if RadioGroup1.ItemIndex = 6 then
  begin
    if not dmContrato.QryCliente.Locate('TELEFONO_LOCAL',Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    dbgrid1.Visible:=False else  dbGrid1.Visible:=True;
  end;
  Edit1Enter(Self);
  Edit1.SetFocus;
end;

end.
