unit UFormImportPolizas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  ShellAPI, Dialogs, WinSkinData, DB, IBCustomDataSet, Grids, DBGrids, RxDBCtrl,
  Shlobj, Excel97, OleServer, ExcelXP, comObj,
  StdCtrls, Buttons, ExtCtrls, Mask, DBCtrls;

type
  TfrmImportarPolizas = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox4: TCheckBox;
    RxDBGrid1: TRxDBGrid;
    tblClientesPolizaMastExtDet: TIBDataSet;
    tblClientesPolizaMastExt: TIBDataSet;
    dstblClientesPolizaMastExt: TDataSource;
    dstblClientesPolizaMastExtDet: TDataSource;
    SkinData1: TSkinData;
    tblClientesPolizaMastExtID_ARCHIVO: TIntegerField;
    tblClientesPolizaMastExtFECHA: TDateTimeField;
    tblClientesPolizaMastExtFECHA_IN: TDateTimeField;
    tblClientesPolizaMastExtIN_POR: TIBStringField;
    tblClientesPolizaMastExtSTATUS: TIBStringField;
    RxDBGrid2: TRxDBGrid;
    Shape1: TShape;
    OpenDialog1: TOpenDialog;
    edtCantColXX: TEdit;
    Label1: TLabel;
    tblClientesPolizaMastExtNOMBRE_ARCHIVO: TIBStringField;
    tblClientesPolizaMastExtDetSERIE: TIntegerField;
    tblClientesPolizaMastExtDetID_ARCHIVO: TIntegerField;
    tblClientesPolizaMastExtDetNUMPOL: TIntegerField;
    tblClientesPolizaMastExtDetCIUDAD: TIBStringField;
    tblClientesPolizaMastExtDetDIRECCION: TIBStringField;
    tblClientesPolizaMastExtDetNOMBRE: TIBStringField;
    tblClientesPolizaMastExtDetTELEFONO: TIBStringField;
    tblClientesPolizaMastExtDetIDENTIFICACION: TIBStringField;
    tblClientesPolizaMastExtDetMODELO: TIBStringField;
    tblClientesPolizaMastExtDetVEHICULO: TIBStringField;
    tblClientesPolizaMastExtDetMARCA: TIBStringField;
    tblClientesPolizaMastExtDetANOVEH: TIntegerField;
    tblClientesPolizaMastExtDetCOLOR: TIBStringField;
    tblClientesPolizaMastExtDetCHASSIS: TIBStringField;
    tblClientesPolizaMastExtDetNUMPLACA: TIBStringField;
    tblClientesPolizaMastExtDetFECING: TDateTimeField;
    tblClientesPolizaMastExtDetFECFIN: TDateTimeField;
    tblClientesPolizaMastExtDetSERIALMOTOR: TIBStringField;
    tblClientesPolizaMastExtDetKILOMETRAJE: TIBStringField;
    BitBtn3: TBitBtn;
    Label2: TLabel;
    DBText1: TDBText;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tblClientesPolizaMastExtAfterScroll(DataSet: TDataSet);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
    procedure LeerArchivoExcel;
  public
    { Public declarations }
  end;

var
  frmImportarPolizas: TfrmImportarPolizas;
  numCampos: integer = 13;
  numFilas: integer = 4;

implementation

uses UformExpExcel;

{$R *.dfm}

procedure TfrmImportarPolizas.LeerArchivoExcel;
var
  appExcel: Variant;
  i, j: integer;
  sql: String;
  x: string;
  Columnas : string;
begin
  //GLBMostrarArchivo:=True;
  //t if dmReporte.qryRelIngGastosExpXLS.RecordCount > 0 then
  //t begin
    //frmExportarExcel:=TfrmExportarExcel.Create(nil);
    //try
      //frmExportarExcel.rangoFecha:='Desde '+FormatDateTime('dd/mm/yyyy',dmReporte.qryRelIngGastosExpXLS.params[0].Value)+' Hasta '+
      //FormatDateTime('dd/mm/yyyy',dmReporte.qryRelIngGastosExpXLS.params[1].Value);
      //if OpenDialog1.Execute then
      //frmExportarExcel.ExporToExcel(OpenDialog1.FileName)
      //else exit;

      //sql := 'insert into CLIENTES_POLIZASEXT('+Columnas+') values(''' + sql + ')';
     // Memo1.Lines.Add(sql);
    //except
    //frmExportarExcel.free;
    //frmExportarExcel:=nil;
    //end;
  //t end;
  {
  appExcel := CreateOleObject('Excel.Application');
  if OpenDialog1.Execute then
  appExcel.WorkBooks.Open(OpenDialog1.FileName)
  else exit;

  Columnas :='';
  if (edtCantCol.Text <> '') then
  numCampos := StrToInt(edtCantCol.Text);
  Memo1.Lines.Clear;
  Columnas:='SERIE,ID_ARCHIVO';
  for j := 1 to numCampos do
    begin
      x := appExcel.WorkBooks[0].Worksheets[0].Cells[i, j];
      Columnas := Columnas + trim(x);
      if j <> numCampos then
      Columnas := Columnas + ',';
    end;

  for i := 2 to (numfilas + 2) do // en la fila 1 esta el nombre del campo
  begin
    sql := '';
    for j := 1 to numCampos do
    begin
      x := appExcel.WorkBooks[1].Worksheets[1].Cells[i, j];
      sql := sql + trim(x) + '''';
      if j <> numCampos then
      sql := sql + ',''';
    end;

    sql := 'insert into CLIENTES_POLIZASEXT('+Columnas+') values(''' + sql + ')';
    Memo1.Lines.Add(sql);
  end;

  appExcel.Quit;
  appExcel := Unassigned; }
end;

procedure TfrmImportarPolizas.BitBtn1Click(Sender: TObject);
begin
  ShellExecute(0, 'Open', PChar('ImportExcelFile.exe'), PChar(''), PChar(''), SW_SHOWNORMAL);
  //LeerArchivoExcel;
end;

procedure TfrmImportarPolizas.FormCreate(Sender: TObject);
begin
  tblClientesPolizaMastExt.close;
  tblClientesPolizaMastExt.open;
end;

procedure TfrmImportarPolizas.tblClientesPolizaMastExtAfterScroll(
  DataSet: TDataSet);
begin
 tblClientesPolizaMastExtDet.close;
 tblClientesPolizaMastExtDet.Params[0].Value:=tblClientesPolizaMastExtID_ARCHIVO.Value;
 tblClientesPolizaMastExtDet.Open;
end;

procedure TfrmImportarPolizas.BitBtn3Click(Sender: TObject);
begin
   tblClientesPolizaMastExt.close;
  tblClientesPolizaMastExt.open;
end;

end.
