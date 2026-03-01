unit UFormTipoNomina;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfrmTipoNomina = class(TForm)
    ComboBox1: TComboBox;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox1Exit(Sender: TObject);
  private
    { Private declarations }
    procedure VerificarTipoNomina(tNomina : integer);
  public
    { Public declarations }
    xTipoNomina : Integer;
  end;

var
  frmTipoNomina: TfrmTipoNomina;

implementation
uses UDatModNomina, UGlobal;
{$R *.dfm}

procedure TfrmTipoNomina.FormCreate(Sender: TObject);
begin
  dmNomina.qryTipoNomina.close;
  dmNomina.qryTipoNomina.Open;
  dmNomina.qryTipoNomina.First;
  ComboBox1.Clear;
  While Not dmNomina.qryTipoNomina.Eof do
  begin
    ComboBox1.Items.Append(dmNomina.qryTipoNominaDESCRIPCION.Value);
    dmNomina.qryTipoNomina.Next;
  end;
  ComboBox1.ItemIndex:=1;
  ComboBox1Change(Self);
end;

procedure TfrmTipoNomina.ComboBox1Change(Sender: TObject);
begin
  if dmNomina.qryTipoNomina.Locate('descripcion',combobox1.Text,[]) then
  xTipoNomina:= dmNomina.qryTipoNominaCODIGO.Value;
end;

procedure TfrmTipoNomina.VerificarTipoNomina(tNomina:integer);
begin
 if tNomina = 1 then //Semanal
 begin
   glbTipoNom := 1;
   glbDNomina := 4.33333;
 end else
 if tNomina = 2 then //Quincenal
 begin
   glbTipoNom := 2;
   glbDNomina := 2;
 end else
 if tNomina = 3 then //Mensual
 begin
   glbTipoNom := 3;
   glbDNomina := 1;
 end else
 if tNomina = 4 then //Ocasionales
 begin
   glbTipoNom := 4;
   glbDNomina := 2;
 end;
end;

procedure TfrmTipoNomina.ComboBox1Exit(Sender: TObject);
begin
  VerificarTipoNomina(xTipoNomina);
end;

end.
