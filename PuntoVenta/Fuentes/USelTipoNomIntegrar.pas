unit USelTipoNomIntegrar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, DBCtrls, WinSkinData, EditNew;

type
  TfrmSelDatosIntegrarNom = class(TForm)
    dtpkFechaNom: TDateTimePicker;
    Label2: TLabel;
    ComboBox2: TComboBox;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    ComboBox1: TComboBox;
    SkinData1: TSkinData;
    edtAnioBono: TEditN;
    lblAnioBono: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure dtpkFechaNomExit(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox1Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    xTipoNomina : Integer;
    procedure VerificarTipoNomina(tNomina: integer);
    procedure VerificarTipoCia;
    procedure VerificarFechaNomina;    
  end;

var
  frmSelDatosIntegrarNom: TfrmSelDatosIntegrarNom;

implementation

uses UDatModEmpleados, UGlobal, UDatModCompania, UDatModNomina;

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
  dmCompania.tblCompania.Locate('codigo',glbCia_Key,[]);
  ComboBox2.Text:=dmCompania.tblCompaniaNOMBRE.Value;
  ComboBox2.ItemIndex:= ComboBox2.Items.IndexOf(trim(ComboBox2.Text));
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

  dmNomina.qryTipoNomina.close;
  dmNomina.qryTipoNomina.Open;
  dmNomina.qryTipoNomina.First;
  ComboBox1.Clear;
  While Not dmNomina.qryTipoNomina.Eof Do
  begin
    ComboBox1.Items.Append(dmNomina.qryTipoNominaDESCRIPCION.Value);
    dmNomina.qryTipoNomina.Next;
  end;
  if dmNomina.qryTipoNomina.Locate('codigo',2,[]) then
  Combobox1.Text:= dmNomina.qryTipoNominaDESCRIPCION.Value
  else MessageDlg('Tipo nomina 2 no encontrado, verifique que nómina quincenal sea tipo 2.',mtError,[mbok],0);
  ComboBox1Change(Self);
  ComboBox1Exit(Self);
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

procedure TfrmSelDatosIntegrarNom.ComboBox1Change(Sender: TObject);
begin
  if dmNomina.qryTipoNomina.Locate('descripcion',combobox1.Text,[]) then
  xTipoNomina:= dmNomina.qryTipoNominaCODIGO.Value;
end;

procedure TfrmSelDatosIntegrarNom.ComboBox1Exit(Sender: TObject);
begin
  VerificarTipoNomina(xTipoNomina);
end;

procedure TfrmSelDatosIntegrarNom.VerificarTipoNomina(tNomina: integer);
begin
 if tNomina = 1 then //Semanal
 begin
   glbTipoNom := 2;
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

procedure TfrmSelDatosIntegrarNom.VerificarFechaNomina;
begin

end;

procedure TfrmSelDatosIntegrarNom.VerificarTipoCia;
begin
  //Dm.tCompania.Filtered := False;
  if ComboBox2.ItemIndex = 0 then
  begin
    //Dm.tCompania.Filter:='CODIGO = 2'; // Tropical Tours, S.A.
    glbCia_Key := glbCodigoCia;
    //Dm.tCompania.Filtered := True;
  end;
end;



end.
