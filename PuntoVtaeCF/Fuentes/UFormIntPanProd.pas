unit UFormIntPanProd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, WinSkinData;
                 
type
  TfrnIntPanProdNomina = class(TForm)
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    DTPickerFechaNom: TDateTimePicker;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    SkinData1: TSkinData;
    StatusBar1: TStatusBar;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox2DropDown(Sender: TObject);
  private
    { Private declarations }
    procedure VerificarTipoNomina;
    procedure VerificarTipoCia;
    procedure VerificarFechaNomina;
  public
    { Public declarations }
  end;

var
  frnIntPanProdNomina: TfrnIntPanProdNomina;

implementation

{$R *.dfm}

{ TfrnIntPanProdNomina }

procedure TfrnIntPanProdNomina.BitBtn1Click(Sender: TObject);
begin
  glbFechaNom := ExtraerFecha(DTPickerFechaNom.Datetime);
  VerificarTipoCia;
  VerificarTipoNomina;
//  VerificarFechaNomina;
  //****** Trae los Datos de la Nomina *******
  if glbCheckNomina = 1 then   // Buscar Nomina = False
     Begin
       DmNom.QryIntNomina.Close;
       DmNom.QryIntNomina.Params[0].Value := glbCia_Key;
       DmNom.QryIntNomina.Params[1].Value := glbTipoNom;
       DmNom.QryIntNomina.Params[2].Value := glbFechaNom;
       DmNom.QryIntNomina.Open;
       if DmNom.QryIntNomina.RecordCount = 0 Then
          Begin
            ShowMessage('La Nomina para esta fecha no ha sido Creada, Verifique');
            Close;
          End
       Else
         Begin
           if DmNom.QryIntNominaSTATUS_NOMINA.Value = 'P' Then
              if MessageDlg('La Nomina para esta fecha ya ha sido Procesada'#13'    Ver Datos?',mtWarning,[mbYes,mbNo],0) = mrYes Then
              Close
           else
              DmNom.QryIntNomina.close;
              close;
         end;
     End
  Else
  if glbCheckNomina = 2 then  // Integrar Nomina = True
     Begin
       DmNom.QryIntNomina.Close;
       DmNom.QryIntNomina.Params[0].Value := glbCia_Key;
       DmNom.QryIntNomina.Params[1].Value := glbTipoNom;
       DmNom.QryIntNomina.Params[2].Value := glbFechaNom;
       DmNom.QryIntNomina.Open;
       if DmNom.QryIntNomina.RecordCount > 0 Then
          Begin
            ShowMessage('La Nomina para esta fecha Ha sido Creada, Verifique');
            Close;
          End
       Else
          Begin
            //********Integra la nomina************
            DmNom.StpIntNomina.close;
            DmNom.StpIntNomina.Params[0].Value := glbCia_Key;
            DmNom.StpIntNomina.Params[1].Value := glbTipoNom;
            DmNom.StpIntNomina.Params[2].Value := glbFechaNom;
            DmNom.StpIntNomina.Params[3].Value := glbDNomina;
            DmNom.StpIntNomina.ExecProc;
            //*************** Calcular Total *****************
            DmNom.StpCalTotalN.Close;
            Dmnom.StpCalTotalN.Params[0].Value := glbTipoNom;
            Dmnom.StpCalTotalN.Params[1].Value := glbCia_Key;
            Dmnom.StpCalTotalN.Params[2].Value := glbFechaNom;
            Dmnom.StpCalTotalN.ExecProc;
            GlbCheckNomina := 1;
            DmNom.QryIntNomina.Close;
            DmNom.QryIntNomina.Params[0].Value := GlbCia_Key;
            DmNom.QryIntNomina.Params[1].Value := GlbTipoNom;
            DmNom.QryIntNomina.Params[2].Value := GlbFechaNom;
            DmNom.QryIntNomina.Open;
            Close;
          End;
     End
  Else
  if (glbCheckNomina = 3) or // Preliminar
     (glbCheckNomina = 4) or // Definitiva
     (glbCheckNomina = 5) then // Todos
     Begin
       Close;
     End;
end;

procedure TfrnIntPanProdNomina.VerificarTipoNomina;
begin
DmNom.QryTipoNom.Filtered := False;
if ComboBox2.ItemIndex = 0 then
 begin
   DmNom.QryTipoNom.Filter:='CODIGO_TIPO_NOMINA = 1'; //Semanal
   glbTipoNom := 1;
   glbDNomina := 4.33333;
   DmNom.QryTipoNom.Filtered := True;
 end;
if ComboBox2.ItemIndex = 1 then
 begin
   DmNom.QryTipoNom.Filter:='CODIGO_TIPO_NOMINA = 2'; //Quincenal
   glbTipoNom := 2;
   glbDNomina := 2;
   DmNom.QryTipoNom.Filtered := True;
 end;
if ComboBox2.ItemIndex = 2 then
 begin
   DmNom.QryTipoNom.Filter:='CODIGO_TIPO_NOMINA = 3'; //Mensual
   glbTipoNom := 3;
   glbDNomina := 1;
   DmNom.QryTipoNom.Filtered := True;
 end;
if ComboBox2.ItemIndex = 3 then
 begin
   DmNom.QryTipoNom.Filter:='CODIGO_TIPO_NOMINA = 4'; //Ocasionales
   glbTipoNom := 4;
   glbDNomina := 2;
   DmNom.QryTipoNom.Filtered := True;
 end;
DmNom.QryTipoNom.Filtered := False;
end;

procedure TfrnIntPanProdNomina.VerificarTipoCia;
begin
dmCompania.tblCompania.Filtered := False;
if ComboBox1.ItemIndex = 0 then
 begin
   dmCompania.tblCompania.Filter:='CODIGO = 2'; // Tropical Tours, S.A.
   glbCia_Key := dmCompania.tblCompaniaCODIGO.Value;
   dmCompania.tblCompania.Filtered := True;
 end;
{if ComboBox1.ItemIndex = 1 then
 begin
   dmCompania.tblCompania.Filter:='CODIGO = 2';
   glbCia_Key := 2;
 end;
if ComboBox1.ItemIndex = 2 then
 begin
   dmCompania.tblCompania.Filter:='CODIGO = 3';
   glbCia_Key := 3;
 end;}
dmCompania.tblCompania.Filtered := False;
end;

procedure TfrnIntPanProdNomina.VerificarFechaNomina;
var
  Ano, Mes, Dia : Word;
begin
DecodeDate(glbFechaNom, Ano, Mes, Dia);
  if GlbTipoNom = 1 Then
     begin
       if Dia <> DayOfWeek(6) then
          Begin
            MessageDlg('Fecha Incorrecta Nomina Semanal Todos Los Viernes, Verifique',mtWarning,[mbOk],0);
          End;
     end
  Else
  if GlbTipoNom = 2 Then
     Begin
       if (Dia > 15) Then //Primera o segunda Quicena del mes
          Begin
            glbFechaNom := StrToDate(FormatDateTime('yyyy-mm-dd', EncodeDate(Ano, Mes, 15)));
          End
       Else
       If (Dia < 15) Then
          Begin
            glbFechaNom := StrToDate(FormatDateTime('yyyy-mm-dd', EncodeDate(Ano, Mes, 30)));
          End;
     End
  Else
  if GlbTipoNom = 3 Then
     begin
       if Dia <> 30 Then // Nomina Mensual
          Begin
            MessageDlg('Fecha Incorrecta Nomina Mensual Los Días 30 de cada mes, Verifique',mtWarning,[mbOk],0);
          End;
     End;
end;

procedure TfrnIntPanProdNomina.FormCreate(Sender: TObject);
var
  anio1,mes1,dia1:word;
begin
  dmCompania.tblCompania.Close;
  dmCompania.tblCompania.Open;
//************** Compañia************
  ComboBox1.Items.Clear;
  dmCompania.tblCompania.First;
  While Not dmCompania.tblCompania.Eof Do
  begin
    ComboBox1.Items.Add(dmCompania.tblCompaniaNOMBRE.Value);
    dmCompania.tblCompania.Next;
  end;
  ComboBox1.ItemIndex := 0;
  ComboBox1.Text := dmCompania.tblCompaniaNOMBRE.Value;
    
  dmnom.QryTipoNom.Close;
  dmnom.QryTipoNom.open;
  DecodeDate(now,anio1,mes1,dia1);
  if (dia1 <= 15)  then
  DTPickerFechaNom.DateTime := EncodeDate(anio1,mes1,15)
  else
  begin
    if mes1 = 2 then
    DTPickerFechaNom.DateTime := EncodeDate(anio1,mes1,DiasEnElMes(anio1,mes1))
    else DTPickerFechaNom.DateTime := EncodeDate(anio1,mes1,30); 
  end;
end;

procedure TfrnIntPanProdNomina.ComboBox2DropDown(Sender: TObject);
begin
//************ Tipo Nomina ************
  ComboBox2.Items.Clear;
  dmnom.QryTipoNom.first;
  while not dmnom.QryTipoNom.Eof do
  begin
    ComboBox2.Items.Add(dmnom.QryTipoNomDESCRIPCION.Value);
    dmnom.QryTipoNom.Next;
  end;
  ComboBox2.ItemIndex := 0;
  ComboBox2.Text := DmNom.QryTipoNomDESCRIPCION.Value;
end;


end.
