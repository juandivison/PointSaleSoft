unit UFormCteXCiudad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfrmRepCteXCiudad = class(TForm)
    Label1: TLabel;
    ComboBox2: TComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRepCteXCiudad: TfrmRepCteXCiudad;

implementation

uses UDatModClientes, UDatModUsuarios, UDatModReportes, UDatModCompania,
  UGlobal, URepClientes;

{$R *.dfm}

procedure TfrmRepCteXCiudad.FormCreate(Sender: TObject);
begin
  ComboBox2.Clear;
  dmclientes.tblCiudades.close;
  dmclientes.tblCiudades.open;
  While Not dmclientes.tblCiudades.Eof Do
  begin
    ComboBox2.Items.Add(dmclientes.tblCiudadesDESCRIPCION.Value);
    dmclientes.tblCiudades.Next;
  end;
  ComboBox2.ItemIndex:=0;
  ComboBox2Change(Self);
end;

procedure TfrmRepCteXCiudad.ComboBox2Change(Sender: TObject);
begin
  if dmClientes.tblCiudades.Locate('DESCRIPCION', ComboBox2.Text,[]) then
  dmreportes.codCiudad:= dmclientes.tblCiudadesCodigo.Value;
end;

procedure TfrmRepCteXCiudad.BitBtn2Click(Sender: TObject);
begin
  dmReportes.qryDatosRepClientes.Filtered:=False;
  dmReportes.qryDatosRepClientes.Close;

//dmReportes.qryDatosRepClientes.SQL.Text:=dmReportes.sqlScriptDatosCte.SQLActual;
  dmReportes.qryDatosRepClientes.Filtered:=True;
  dmReportes.qryDatosRepClientes.Open;

  dmCompania.tblCompania.Close;
  dmCompania.tblCompania.Open;
  dmCompania.tblCompania.Locate('codigo',glbCia_Key,[]);
  qckRepClientes:=TqckRepClientes.Create(Nil);
  try
    if Messagedlg('Imprimir?',mtInformation,[mbYes,mbNo],0 )= mrYes then
    begin
      qckRepClientes.Printersetup;
      qckRepClientes.Print;
    end else qckRepClientes.Preview;
  finally
  qckRepClientes.Free;
  qckRepClientes:=Nil;
  end;

end;

end.
