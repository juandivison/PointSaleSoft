unit UFormImportGMovil;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  ShellAPI, Dialogs, WinSkinData, DB, IBCustomDataSet, Grids, DBGrids, RxDBCtrl,
  Shlobj, Excel97, OleServer, ExcelXP, comObj,
  StdCtrls, Buttons, ExtCtrls;

type
  TfrmImportarGarantias = class(TForm)
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
    RxDBGrid2: TRxDBGrid;
    Shape1: TShape;
    OpenDialog1: TOpenDialog;
    edtCantColXX: TEdit;
    Label1: TLabel;
    BitBtn3: TBitBtn;
    tblClientesPolizaMastExtDetSERIE: TIntegerField;
    tblClientesPolizaMastExtDetID_ARCHIVO: TIntegerField;
    tblClientesPolizaMastExtDetTIPO_AFILIACION: TIntegerField;
    tblClientesPolizaMastExtDetFECHA: TDateTimeField;
    tblClientesPolizaMastExtDetCODIGO_CLIENTE: TIntegerField;
    tblClientesPolizaMastExtDetCODIGO_DEALER: TIntegerField;
    tblClientesPolizaMastExtDetGARANTIANUM: TIBStringField;
    tblClientesPolizaMastExtDetNOMBRES: TIBStringField;
    tblClientesPolizaMastExtDetAPELLIDOS: TIBStringField;
    tblClientesPolizaMastExtDetCEDULA_PASSPORT: TIBStringField;
    tblClientesPolizaMastExtDetEMAIL: TIBStringField;
    tblClientesPolizaMastExtDetTELEFONO: TIBStringField;
    tblClientesPolizaMastExtDetMOVIL: TIBStringField;
    tblClientesPolizaMastExtDetDIRECCION: TIBStringField;
    tblClientesPolizaMastExtDetPAIS: TIBStringField;
    tblClientesPolizaMastExtDetPROVINCIA: TIBStringField;
    tblClientesPolizaMastExtDetMARCA: TIBStringField;
    tblClientesPolizaMastExtDetMODELO: TIBStringField;
    tblClientesPolizaMastExtDetNO_SERIEEMAI: TIBStringField;
    tblClientesPolizaMastExtDetFECHADEVENTA: TDateTimeField;
    tblClientesPolizaMastExtDetPRECIOVENTA: TFloatField;
    tblClientesPolizaMastExtDetDESCRIPCIONDELPRODUCTO: TMemoField;
    tblClientesPolizaMastExtDetTIEMPOGVENDEDOR: TIntegerField;
    tblClientesPolizaMastExtDetFECHAINICIO: TDateTimeField;
    tblClientesPolizaMastExtDetFECHAVENCE: TDateTimeField;
    tblClientesPolizaMastExtDetVALORDELARTICULO: TFloatField;
    tblClientesPolizaMastExtDetMONTOAPAGARPORMES: TFloatField;
    tblClientesPolizaMastExtDetMONTOTOTALAPAGAR: TFloatField;
    tblClientesPolizaMastExtDetPOLIZA_ESPECIAL: TSmallintField;
    tblClientesPolizaMastExtDetSTATUSCXC: TIBStringField;
    tblClientesPolizaMastExtDetSTATUS: TIBStringField;
    tblClientesPolizaMastExtDetCIUDAD: TIBStringField;
    tblClientesPolizaMastExtID_ARCHIVO: TIntegerField;
    tblClientesPolizaMastExtNOMBRE_ARCHIVO: TIBStringField;
    tblClientesPolizaMastExtFECHA: TDateTimeField;
    tblClientesPolizaMastExtFECHA_IN: TDateTimeField;
    tblClientesPolizaMastExtIN_POR: TIBStringField;
    tblClientesPolizaMastExtSTATUS: TIBStringField;
    tblClientesPolizaMastExtCODIGO_DEALER: TIntegerField;
    tblClientesPolizaMastExtCODIGO_AGENCIA: TIntegerField;
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
  frmImportarGarantias: TfrmImportarGarantias;
  numCampos: integer = 13;
  numFilas: integer = 4;

implementation

uses UformExpExcel, UGlobal, UDatModConectar;

{$R *.dfm}

procedure TfrmImportarGarantias.LeerArchivoExcel;
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

procedure TfrmImportarGarantias.BitBtn1Click(Sender: TObject);
begin
  if (GLBRutaImpGarantia = '') then exit;
  ShellExecute(0, 'Open', PChar(GLBRutaImpGarantia), PChar(''), PChar(''), SW_SHOWNORMAL);
  //LeerArchivoExcel;
end;

procedure TfrmImportarGarantias.FormCreate(Sender: TObject);
begin
  tblClientesPolizaMastExt.close;
  tblClientesPolizaMastExt.open;
end;

procedure TfrmImportarGarantias.tblClientesPolizaMastExtAfterScroll(
  DataSet: TDataSet);
begin
 tblClientesPolizaMastExtDet.close;
 tblClientesPolizaMastExtDet.Params[0].Value:=tblClientesPolizaMastExtID_ARCHIVO.Value;
 tblClientesPolizaMastExtDet.Open;
end;

procedure TfrmImportarGarantias.BitBtn3Click(Sender: TObject);
begin
  tblClientesPolizaMastExt.close;
  tblClientesPolizaMastExt.open;
end;

end.
