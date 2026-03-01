unit USelTipoNomIntegrar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, DBCtrls;

type
  TfrmSelDatosIntegrarNom = class(TForm)
    dtpkFechaNom: TDateTimePicker;
    Label2: TLabel;
    ComboBox2: TComboBox;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure dtpkFechaNomExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelDatosIntegrarNom: TfrmSelDatosIntegrarNom;

implementation

uses UDatModEmpleados, UGlobal, UDatModCompania;

{$R *.dfm}

procedure TfrmSelDatosIntegrarNom.FormCreate(Sender: TObject);
var
  FechaNom : tDatetime;
  Anio1,Mes1,Dia1:Word;
begin
  dmcompania.tblCompania.Close;
  dmcompania.tblCompania.Open;
  dmcompania.tblCompania.First;
  ComboBox2.Items.Clear;
  While Not dmcompania.tblCompania.Eof do
  begin
    ComboBox2.Items.Add(dmcompania.tblCompaniaNOMBRE.Value);
    dmcompania.tblCompania.Next;
  end;
  ComboBox2.ItemIndex:=0;
  ComboBox2Change(Self);

  FRangoFechaNomina(FechaNom,FechaNom);

  DecodeDate(FechaNom,Anio1,Mes1,Dia1);
  if (dia1 <= 15)  then
  dtpkFechaNom.DateTime := EncodeDate(Anio1,Mes1,15)
  else
  begin
    if Mes1 = 2 then
    dtpkFechaNom.DateTime      := EncodeDate(Anio1,Mes1,DiasEnElMes(Anio1,Mes1))
    else dtpkFechaNom.DateTime := EncodeDate(Anio1,Mes1,30);
  end;
  dtpkFechaNomExit(Self);
end;

procedure TfrmSelDatosIntegrarNom.ComboBox2Change(Sender: TObject);
begin
  if dmCompania.tblCompania.Locate('NOMBRE',ComboBox2.Text,[]) then
  glbCodigoCia := dmCompania.tblCompaniaCODIGO.Value;
end;

procedure TfrmSelDatosIntegrarNom.dtpkFechaNomExit(Sender: TObject);
begin
  glbFechaNomina:= ExtraerFecha(dtpkFechaNom.Date);
end;

end.
