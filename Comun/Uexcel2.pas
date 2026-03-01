unit Uexcel2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, DB, ADODB, Grids, DBGrids, OleServer, ExcelXP, comObj,
  ComCtrls, Menus, ExtCtrls, IBCustomDataSet, IBQuery, WinSkinData;

type
  TfrmConsultaCustom = class(TForm)
    ExcelApplication1: TExcelApplication;
    PageControl1: TPageControl;
    MainMenu1: TMainMenu;
    Opciones1: TMenuItem;
    Datosfuentes1: TMenuItem;
    TabSheet3: TTabSheet;
    Memo1: TMemo;
    dsConsulta: TDataSource;
    DBGrid3: TDBGrid;
    Panel1: TPanel;
    Button2: TButton;
    btnexp: TButton;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Exportar1: TMenuItem;
    Abrirconsulta1: TMenuItem;
    GuardarConsulta1: TMenuItem;
    N1: TMenuItem;
    Salir1: TMenuItem;
    AQConsulta: TIBQuery;
    SkinData1: TSkinData;
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btnexpClick(Sender: TObject);
    procedure Salir1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Datosfuentes1Click(Sender: TObject);
    procedure Exportar1Click(Sender: TObject);
    procedure Abrirconsulta1Click(Sender: TObject);
    procedure GuardarConsulta1Click(Sender: TObject);
  private
  procedure exportarGridExcel(mGrid : tdbgrid; mtabla:TIBQuery; var NombreArchivo:String);
    { Private declarations }
  public
    { Public declarations }

  end;

var
  frmConsultaCustom: TfrmConsultaCustom;

implementation

uses  DateUtils, UDatModConectar;

{$R *.dfm}


procedure tfrmConsultaCustom.exportarGridExcel (mGrid : tdbgrid; mtabla:TIBQuery;var NombreArchivo:String);
const
  xlWBATWorksheet = -4167;

var
  rangoExcel : Variant;
  i, fila : integer;
  mMarcador : Tbookmarkstr;
  aplicacionExcel : Olevariant;

begin
  rangoExcel:= ExcelXp.xlRange;
  aplicacionExcel := CreateOleObject('Excel.Application');
  aplicacionExcel.Visible:= true;
  aplicacionExcel.workbooks.add(xlWBATWorksheet);
  rangoExcel := aplicacionExcel.ActiveCell;

  for i:= 0 to mTabla.Fields.Count - 1 do
  begin
    rangoExcel.Value := mTabla.Fields[i].DisplayLabel;
    rangoExcel := rangoExcel.Next;
  end;

  mTabla.DisableControls;
  try
    mMarcador := mTabla.Bookmark;
    try
      mTabla.First;
      fila := 2;
      while not mTabla.Eof do
      begin
        rangoExcel := aplicacionExcel.Range['A' + inttostr(fila), 'A' + inttostr(fila)];
        for i := 0 to mTabla.Fields.Count - 1 do
        begin
          rangoExcel.Value := mTabla.Fields[i].AsString;
          rangoExcel := rangoExcel.Next;
        end;
        mTabla.Next;
        Inc(fila);
      end;

      finally
        mTabla.Bookmark := mMarcador;
      end;
    finally
      mTabla.EnableControls;
    end;
    NombreArchivo:=NombreArchivo +FormatDateTime('ddmmyy_hhmm',Now)+'.xls';
    aplicacionExcel.Workbooks[1].SaveAs(NombreArchivo);
    aplicacionExcel.Quit;
 end;


procedure TfrmConsultaCustom.FormCreate(Sender: TObject);
var
      filename : string;
begin
{
   filename := ExtractFilePath(Application.ExeName)+'conect.udl';
   if not FileExists(filename) then
   begin
     Messagedlg('Archivo con.udl no encontrado, favor verificar.', mtInformation, [mbok], 0);
     Halt;
   end;
   }
   
   //AssignFile(SomeTxtFile, filename);
   //Reset(SomeTxtFile) ;
   //ReadLn(SomeTxtFile, buffer) ;
   //Provider = F:\Cooprac\Exporta ExcelVersionRobinson\coopracdb.udl
   //ADOConnection1.ConnectionString :=  'FILE NAME='+filename;
   //ADOConnection1.Provider := filename;
   //CloseFile(SomeTxtFile) ;
end;

procedure TfrmConsultaCustom.Button2Click(Sender: TObject);
begin
if memo1.Lines.Count > 0 then
begin
With AQConsulta do
begin
   Close;
   SQL.Text:= MEMO1.Lines.TEXT;
   Open;
   if isempty then
    begin
     Showmessage('La consulta no devuelve ningun dato');
     Close;
    end;

    btnexp.Enabled:= not (isempty);
end;
end;
end;

procedure TfrmConsultaCustom.btnexpClick(Sender: TObject);
 var
 Archivo:String;
begin
if AQConsulta.IsEmpty then exit;
   Archivo:=ExtractFilePath(Application.ExeName);
   exportarGridExcel(dbgrid3, AQConsulta,Archivo);
  Showmessage('Archivo Guardado:  '+ Archivo);
end;

procedure TfrmConsultaCustom.Salir1Click(Sender: TObject);
begin
Close;
end;

procedure TfrmConsultaCustom.SpeedButton2Click(Sender: TObject);
begin
if OpenDialog1.Execute then
  begin
  memo1.Lines.LoadFromFile(OpenDialog1.FileName);
  end
end;

procedure TfrmConsultaCustom.SpeedButton1Click(Sender: TObject);
begin
if memo1.Lines.Count > 0 then
begin
if SaveDialog1.Execute then
  begin
  memo1.Lines.SavetoFile(OpenDialog1.FileName);
  end

end;
end;

procedure TfrmConsultaCustom.Datosfuentes1Click(Sender: TObject);
begin
Button2Click(self);
end;

procedure TfrmConsultaCustom.Exportar1Click(Sender: TObject);
begin
btnexpClick(Self);
end;

procedure TfrmConsultaCustom.Abrirconsulta1Click(Sender: TObject);
begin
SpeedButton2Click(Self)
end;

procedure TfrmConsultaCustom.GuardarConsulta1Click(Sender: TObject);
begin
SpeedButton1Click(Self)
end;

end.
