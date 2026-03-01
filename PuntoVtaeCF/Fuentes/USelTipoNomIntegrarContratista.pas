unit USelTipoNomIntegrarContratista;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, DBCtrls;

type
  TfrmSelDatosIntegrarNomCont = class(TForm)
    dtpkFechaNom: TDateTimePicker;
    Label2: TLabel;
    ComboBox2: TComboBox;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    ComboBox1: TComboBox;
    ComboBox3: TComboBox;
    Label4: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure dtpkFechaNomExit(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox1Exit(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    xTipoNomina : Integer;
    xCodigoProyecto : Integer;
    procedure VerificarTipoNomina(tNomina: integer);
    procedure VerificarTipoCia;
    procedure VerificarFechaNomina;    
  end;

var
  frmSelDatosIntegrarNomCont: TfrmSelDatosIntegrarNomCont;

implementation

uses UDatModEmpleados, UGlobal, UDatModCompania, UDatModNomina;

{$R *.dfm}

procedure TfrmSelDatosIntegrarNomCont.FormCreate(Sender: TObject);
var
  FechaNom : tDatetime;
  Anio1,Mes1,Dia1:Word;
begin
  dmcompania.tblCompania.Close;
  dmcompania.tblCompania.Open;
  dmcompania.tblCompania.First;

  ComboBox3.Items.Clear;
  dmNOmina.qryProyectos.Close;
  dmNOmina.qryProyectos.Open;
  dmNOmina.qryProyectos.First;
  While Not dmNOmina.qryProyectos.Eof do
  begin
    ComboBox3.Items.Add(dmNOmina.qryProyectosNOMBRE_PROYECTO.Value);
    dmNOmina.qryProyectos.Next;
  end;
  Combobox3.ItemIndex:=0;
  ComboBox3Change(Self);
  
  ComboBox2.Items.Clear;
  While Not dmcompania.tblCompania.Eof do
  begin
    ComboBox2.Items.Add(dmcompania.tblCompaniaNOMBRE.Value);
    dmcompania.tblCompania.Next;
  end;
  dmCompania.tblCompania.Locate('codigo',glbCia_Key,[]);
  ComboBox2.Text := dmCompania.tblCompaniaNOMBRE.Value;
  ComboBox2.ItemIndex:= ComboBox2.Items.IndexOf(trim(ComboBox2.Text));
  ComboBox2Change(Self);

  FRangoFechaNominaContratista(FechaNom,FechaNom);

  DecodeDate(FechaNom,Anio1,Mes1,Dia1);
  if (dia1 <= 7)  then
  dtpkFechaNom.DateTime := EncodeDate(Anio1,Mes1,7)
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
  if dmNomina.qryTipoNomina.Locate('CODIGO', 1, []) then
  Combobox1.Text:= dmNomina.qryTipoNominaDESCRIPCION.Value;
  ComboBox1Change(Self);
  ComboBox1Exit(Self);
  ComboBox1Exit(Self);
end;

procedure TfrmSelDatosIntegrarNomCont.ComboBox2Change(Sender: TObject);
begin
  if dmCompania.tblCompania.Locate('NOMBRE',ComboBox2.Text,[]) then
  GlbCodigoCia := dmCompania.tblCompaniaCODIGO.Value;
end;

procedure TfrmSelDatosIntegrarNomCont.dtpkFechaNomExit(Sender: TObject);
begin
  GlbFechaNomina:= ExtraerFecha(dtpkFechaNom.Date);
end;

procedure TfrmSelDatosIntegrarNomCont.ComboBox1Change(Sender: TObject);
begin
  if dmNomina.qryTipoNomina.Locate('descripcion',combobox1.Text,[]) then
  xTipoNomina:= dmNomina.qryTipoNominaCODIGO.Value;
end;

procedure TfrmSelDatosIntegrarNomCont.ComboBox1Exit(Sender: TObject);
begin
  VerificarTipoNomina(xTipoNomina);
end;

procedure TfrmSelDatosIntegrarNomCont.VerificarTipoNomina(tNomina: integer);
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

procedure TfrmSelDatosIntegrarNomCont.VerificarFechaNomina;
begin

end;

procedure TfrmSelDatosIntegrarNomCont.VerificarTipoCia;
begin
  //Dm.tCompania.Filtered := False;
  if ComboBox2.ItemIndex = 0 then
  begin
    //Dm.tCompania.Filter:='CODIGO = 2'; // Tropical Tours, S.A.
    glbCia_Key := GlbCodigoCia;
    //Dm.tCompania.Filtered := True;
  end;
end;



procedure TfrmSelDatosIntegrarNomCont.ComboBox3Change(Sender: TObject);
begin
  if dmNomina.qryProyectos.Locate('NOMBRE_PROYECTO',combobox3.Text,[]) then
  xCodigoProyecto:= dmNomina.qryProyectosCodigo.Value; ;
end;

end.
