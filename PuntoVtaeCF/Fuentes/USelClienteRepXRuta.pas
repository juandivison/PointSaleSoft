unit USelClienteRepXRuta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfrmSelRepXRuta = class(TForm)
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
    procedure ImprimirRep(tipo: smallint;codRuta : integer);
  public
    { Public declarations }
  end;

var
  frmSelRepXRuta: TfrmSelRepXRuta;
  CodigoEmp : Integer;

implementation

uses UDatModClientes, UDatModUsuarios, UDatModCompania, UDatModReportes,
  URepClientes, UGlobal;

{$R *.dfm}

procedure TfrmSelRepXRuta.FormCreate(Sender: TObject);
begin
  dmclientes.qryRuta.Close;
  dmclientes.qryRuta.Open;

  dmclientes.qryRuta.First;
  ComboBox2.Clear;
  While Not dmclientes.qryRuta.Eof Do
  begin
    ComboBox2.Items.Add(dmclientes.qryRutaDESCRIPCION.Value);
    dmclientes.qryRuta.Next;
  end;
  ComboBox2.Items.Add('TODAS LAS RUTAS');
  ComboBox2.ItemIndex:=0;
  ComboBox2Change(Self);
end;

procedure TfrmSelRepXRuta.ComboBox2Change(Sender: TObject);
begin
  if (ComboBox2.Text = 'TODAS LAS RUTAS') then
  CodigoEmp:= -1
  else
  if dmclientes.qryRuta.Locate('DESCRIPCION',ComboBox2.Text,[]) then
  CodigoEmp:= dmclientes.qryRutaCodigo.Value;
end;

procedure TfrmSelRepXRuta.ImprimirRep(tipo: Smallint;codRuta : integer);
begin
  dmReportes.tipRptCte := 3;
  dmReportes.qryDatosRepClientes.Filtered:=false;
  dmReportes.qryDatosRepClientes.Close;
  dmReportes.qryDatosRepClientes.SQL.Text:=
  dmReportes.qryDatosRepClientesBase.SQL.Text;
  
  dmReportes.qryDatosRepClientes.SQL.Add('ORDER by C.TIPO_CLIENTE, C.RUTA, c.CODZONA');
  dmReportes.codRuta := codRuta;
  dmReportes.qryDatosRepClientes.Open;
  if codRuta > 0  then
  dmReportes.qryDatosRepClientes.Filtered:=true;
  dmCompania.tblCompania.Close;
  dmCompania.tblCompania.Open;
  dmCompania.tblCompania.Locate('codigo', glbCia_Key,[]);
  qckRepClientes:=TqckRepClientes.Create(Nil);
  try
    qckRepClientes.QRGroup1.Enabled:=False;
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
  dmReportes.tipRptCte := 0;
end;

procedure TfrmSelRepXRuta.BitBtn2Click(Sender: TObject);
begin
  ImprimirRep(1,CodigoEmp);
end;

procedure TfrmSelRepXRuta.BitBtn1Click(Sender: TObject);
begin
  ImprimirRep(2,CodigoEmp);
end;

end.
