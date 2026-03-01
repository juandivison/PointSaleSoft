unit UFormNCFAsignados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, StdCtrls, ComCtrls, Grids, DBGrids,
  ShellAPI, RxDBCtrl, WinSkinData, Buttons, ExtCtrls, CheckLst, RxCtrls;

type
  TfrmNCFAsignados = class(TForm)
    tblNCFAsignados: TIBDataSet;
    tblNCFAsignadosSERIE: TIntegerField;
    tblNCFAsignadosTIPO_NCF: TIBStringField;
    tblNCFAsignadosNUMERO_NCF: TIBStringField;
    tblNCFAsignadosFECHA: TDateTimeField;
    tblNCFAsignadosCODIGO_CTE: TIntegerField;
    tblNCFAsignadosNOMBRE_COMPLETO: TIBStringField;
    tblNCFAsignadosCEDULA: TIBStringField;
    tblNCFAsignadosDIRECCION: TIBStringField;
    tblNCFAsignadosCIUDAD: TIBStringField;
    tblNCFAsignadosMONTO: TFloatField;
    tblNCFAsignadosSTATUS: TIBStringField;
    tblNCFAsignadosCODIGO_USUARIO: TIntegerField;
    tblNCFAsignadosFECHA_INSERT: TDateTimeField;
    tblNCFAsignadosFECHA_UPDATE: TDateTimeField;
    tblNCFAsignadosCODIGO_USUARIO_UPD: TIntegerField;
    tblNCFAsignadosECF: TIBStringField;
    tblNCFAsignadosNUMERO_NCF_REFERENCIA: TIBStringField;
    tblNCFAsignadosDGII_STATUS: TIBStringField;
    tblNCFAsignadosTRACK_ID: TIBStringField;
    tblNCFAsignadosLAST_ERROR: TMemoField;
    tblNCFAsignadosFECHA_INTENTO: TDateTimeField;
    tblNCFAsignadosFECHA_ESTADO: TDateTimeField;
    tblNCFAsignadosREINTENTOS: TIntegerField;
    tblNCFAsignadosNCF_ANTERIOR: TIBStringField;
    tblNCFAsignadosBLOQUEADO: TSmallintField;
    tblNCFAsignadosHASH_FACTURA: TIBStringField;
    tblNCFAsignadosRECHAZADO_POR_NOSOTROS: TSmallintField;
    dstblNCFAsignados: TDataSource;
    RxDBGrid1: TRxDBGrid;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    SkinData1: TSkinData;
    edtBuscarECF: TEdit;
    Label3: TLabel;
    CheckListBox1: TCheckListBox;
    Label4: TLabel;
    BitBtn2: TBitBtn;
    DBStatusLabel1: TDBStatusLabel;
    Label5: TLabel;
    Label6: TLabel;
    tblNCFAsignadosURL_IMAGE: TIBStringField;
    tblNCFAsignadosNUMERO_TRN: TIntegerField;
    SpeedButton1: TSpeedButton;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckListBox1Click(Sender: TObject);
    procedure edtBuscarECFChange(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure RxDBGrid1TitleClick(Column: TColumn);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    FSqlBaseNCF: string;
    FBaseSQLNCF      : TStringList;
    FLastOrderField  : string;
    FLastOrderDesc   : Boolean;
    procedure AplicarFiltrosNCF;
  public
    { Public declarations }
  end;

var
  frmNCFAsignados: TfrmNCFAsignados;

implementation
  uses UDatModConectar, UUtilecf, Uglobal;
  
{$R *.dfm}

procedure TfrmNCFAsignados.AplicarFiltrosNCF;
var
  i: Integer;
  ListaTipos : string;
  SqlWhere   : string;
  TextoECF   : string;
  strFecha : string;
begin
  TextoECF := Trim(edtBuscarECF.Text);

  tblNCFAsignados.Close;
  tblNCFAsignados.SelectSQL.Text := FSqlBaseNCF; // volvemos al SQL base

  SqlWhere   := '';
  ListaTipos := '';
  strFecha:= ' n.Fecha Between '+chr(39)+FormatDateTime('mm/dd/yyyy',DateTimePicker1.DateTime)+chr(39)+
  ' and ' +chr(39)+FormatDateTime('mm/dd/yyyy',DateTimePicker2.DateTime)+chr(39);
  // 1) Si estamos buscando por número ECF, solo filtrar por NUMERO_NCF
  if TextoECF <> '' then
  begin
    SqlWhere := 'NUMERO_NCF LIKE :P_NUMERO_NCF';
  end
  else
  begin
    // 2) Armar lista de TIPO_NCF desde CheckListBox1, ignorando "Todos"
    for i := 0 to CheckListBox1.Count - 1 do
    begin
      if CheckListBox1.Checked[i] then
      begin
        if SameText(CheckListBox1.Items[i], 'Todos') then
        begin
          // “Todos” anula cualquier filtro por tipo
          ListaTipos := '';
          Break;
        end
        else
        begin
          if ListaTipos <> '' then
            ListaTipos := ListaTipos + ',';
          // Si TIPO_NCF es CHAR(2) en la BD, deja QuotedStr;
          // si es entero, reemplaza por ListaTipos := ListaTipos + CheckListBox1.Items[i];
          ListaTipos := ListaTipos + QuotedStr(CheckListBox1.Items[i]);
        end;
      end;
    end;

    if ListaTipos <> '' then
      SqlWhere := 'TIPO_NCF IN (' + ListaTipos + ')';
  end;

  // 3) Agregar WHERE al SelectSQL
  if SqlWhere <> '' then
    tblNCFAsignados.SelectSQL.Add('WHERE ' + SqlWhere);
  if (strFecha <> '') and (SqlWhere <> '') then
  tblNCFAsignados.SelectSQL.Add(' and '+ strFecha)
  else
  tblNCFAsignados.SelectSQL.Add(' Where '+strFecha);

  // 4) Asignar parámetros
  if TextoECF <> '' then
    tblNCFAsignados.ParamByName('P_NUMERO_NCF').AsString := TextoECF + '%';

  tblNCFAsignados.Open;
  tblNCFAsignados.DisableControls;
  tblNCFAsignados.Last;
  tblNCFAsignados.EnableControls;
end;

procedure TfrmNCFAsignados.BitBtn1Click(Sender: TObject);
begin
  AplicarFiltrosNCF;
end;

procedure TfrmNCFAsignados.FormCreate(Sender: TObject);
begin
  // Importante: en diseño deja en SelectSQL SOLO el SELECT/FROM sin WHERE
  DateTimePicker1.DateTime:=GlbFechaTrnDiaria;
  DateTimePicker2.DateTime:=GlbFechaTrnDiaria;
  FSqlBaseNCF := tblNCFAsignados.SelectSQL.Text;
  FBaseSQLNCF := TStringList.Create;
  FBaseSQLNCF.Assign(tblNCFAsignados.SelectSQL);
  FLastOrderField := '';
  FLastOrderDesc  := False;
end;

procedure TfrmNCFAsignados.CheckListBox1Click(Sender: TObject);
begin
  AplicarFiltrosNCF;
end;

procedure TfrmNCFAsignados.edtBuscarECFChange(Sender: TObject);
begin
  AplicarFiltrosNCF;
end;

procedure TfrmNCFAsignados.BitBtn2Click(Sender: TObject);
begin
  GlbSalvarQuery(tblNCFAsignados);
end;

procedure TfrmNCFAsignados.Label5Click(Sender: TObject);
begin
  if not tblNCFAsignadosURL_IMAGE.IsNull then
  ShellExecute(0, 'open', PChar(tblNCFAsignadosURL_IMAGE.AsString), nil, nil, SW_SHOWNORMAL);
end;

procedure TfrmNCFAsignados.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if tblNCFAsignadosURL_IMAGE.IsNull then
  begin
    Background:= clYellow;
    Label6.Visible:=True;
  end else Label6.Visible:=False;
end;

procedure TfrmNCFAsignados.FormDestroy(Sender: TObject);
begin
  FBaseSQLNCF.Free;
end;

procedure TfrmNCFAsignados.RxDBGrid1TitleClick(Column: TColumn);
var
  fieldName: string;
  orderSQL : string;
begin
  if (Column = nil) or (Column.Field = nil) then
    Exit;

  fieldName := Column.Field.FieldName;
  if fieldName = '' then
    Exit;

  // Evitar ordenar por campos tipo Memo/Blob (por si tuvieras LAST_ERROR, etc.)
  if Column.Field.DataType in [ftBlob, ftMemo, ftGraphic] then
    Exit;

  tblNCFAsignados.DisableControls;
  try
    tblNCFAsignados.Close;

    // Partimos SIEMPRE del SQL base actual (con join y posibles WHERE),
    // pero sin ORDER BY.
    tblNCFAsignados.SelectSQL.Assign(FBaseSQLNCF);

    // Alternar ASC/DESC si el usuario vuelve a hacer click en la misma columna
    if SameText(FLastOrderField, fieldName) then
      FLastOrderDesc := not FLastOrderDesc
    else
    begin
      FLastOrderField := fieldName;
      FLastOrderDesc  := False; // primera vez para esta columna: ASC
    end;

    orderSQL := ' ORDER BY ' + fieldName;
    if FLastOrderDesc then
      orderSQL := orderSQL + ' DESC'
    else
      orderSQL := orderSQL + ' ASC';

    // Añadimos el ORDER BY al final del SelectSQL
    tblNCFAsignados.SelectSQL.Add(orderSQL);

    tblNCFAsignados.Open;
  finally
    tblNCFAsignados.EnableControls;
  end;
end;


procedure TfrmNCFAsignados.SpeedButton1Click(Sender: TObject);
var
  _smg : string;
begin
  _smg:='';
  if tblNCFAsignadosNUMERO_NCF.IsNull then exit;
  if not UUtilecf.EjecutarECF_DownQRXML(GlbRutaEcf, tblNCFAsignadosNUMERO_NCF.Value, _smg) then
       LogInformacionTxt(PChar(' -Rutina Descargar QR y XML Firmado- ' + _smg))
  else
      LogInformacionTxt(PChar(' -Rutina Descargar QR y XML Firmado- ' + _smg));
  if (_smg <> '') then
  ShowMessage(_smg);
end;

end.
