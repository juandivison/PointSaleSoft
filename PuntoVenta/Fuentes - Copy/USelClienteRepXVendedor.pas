unit USelClienteRepXVendedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfrmSelRepXVendedor = class(TForm)
    ComboBox2: TComboBox;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    procedure ImprimirRep(tipo: smallint;codEmp : integer);
  public
    { Public declarations }
  end;

var
  frmSelRepXVendedor: TfrmSelRepXVendedor;
  CodigoEmp : Integer;

implementation

uses UDatModClientes, UDatModUsuarios, UDatModCompania, UDatModReportes,
  URepClientes, UGlobal;

{$R *.dfm}

procedure TfrmSelRepXVendedor.FormCreate(Sender: TObject);
begin
  dmUsuarios.qryEmpleados.Close;
  dmUsuarios.qryEmpleados.Open;

  dmUsuarios.qryEmpleados.First;
  ComboBox2.Clear;
  While Not dmUsuarios.qryEmpleados.Eof Do
  begin
    if (dmUsuarios.qryEmpleadosDESC_CARGO.Value = 'VENDEDOR') then
    ComboBox2.Items.Add(dmUsuarios.qryEmpleadosNOMBRE.Value);
    dmUsuarios.qryEmpleados.Next;
  end;
  ComboBox2.Items.Add('SIN VENDEDOR');
  ComboBox2.ItemIndex:=0;
  ComboBox2Change(Self);
end;

procedure TfrmSelRepXVendedor.ComboBox2Change(Sender: TObject);
begin
  if (ComboBox2.Text = 'SIN VENDEDOR') then
  CodigoEmp:= -1
  else
  if  dmUsuarios.qryEmpleados.Locate('NOMBRE',ComboBox2.Text,[]) then
  CodigoEmp:= dmUsuarios.qryEmpleadosCodigo.Value;
end;

procedure TfrmSelRepXVendedor.ImprimirRep(tipo: smallint;codEmp : integer);
begin
  dmReportes.qryDatosRepClientes.Filtered:=false;
  dmReportes.qryDatosRepClientes.Close;
  dmReportes.codEmp := codEmp;
  dmReportes.qryDatosRepClientes.Filtered:=true;
  dmReportes.qryDatosRepClientes.SQL.Text:=
  dmReportes.qryDatosRepClientesBase.SQL.Text;
  
  dmReportes.qryDatosRepClientes.SQL.Add('ORDER by C.TIPO_CLIENTE, C.COD_VENDEDOR');
  
  dmReportes.qryDatosRepClientes.Open;
  dmCompania.tblCompania.Close;
  dmCompania.tblCompania.Open;
  dmCompania.tblCompania.Locate('codigo',glbCia_Key,[]);
  qckRepClientes:=TqckRepClientes.Create(Nil);
  try
    qckRepClientes.QRLabel12.Caption:=ComboBox2.Text;
    if (tipo = 2) then
    begin
      qckRepClientes.Printersetup;
      qckRepClientes.Print;
    end else qckRepClientes.Preview;
  finally
  qckRepClientes.Free;
  qckRepClientes:=Nil;
  end;
end;

procedure TfrmSelRepXVendedor.BitBtn2Click(Sender: TObject);
begin
  ImprimirRep(1,CodigoEmp);
end;

procedure TfrmSelRepXVendedor.BitBtn1Click(Sender: TObject);
begin
  ImprimirRep(2,CodigoEmp);
end;

end.
