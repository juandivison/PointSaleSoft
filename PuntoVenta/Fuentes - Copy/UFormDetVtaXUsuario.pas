unit UFormDetVtaXUsuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, RxToolEdit, Grids, DBGrids, RxDBCtrl, DB,
  IBCustomDataSet, IBQuery, WinSkinData;

type
  TfrmVentaDetXUsuario = class(TForm)
    DataSource1: TDataSource;
    RxDBGrid1: TRxDBGrid;
    DateEdit1: TDateEdit;
    Label1: TLabel;
    Label11: TLabel;
    ComboBox8: TComboBox;
    qryEmpleado: TIBQuery;
    qryEmpleadoCODIGO: TIntegerField;
    qryEmpleadoNOMBRE: TIBStringField;
    qryEmpleadoAPELLIDO: TIBStringField;
    qryEmpleadoNOMBRECOMPLETO: TIBStringField;
    qryEmpleadoCARGO_EMPLEADO: TIBStringField;
    Button1: TButton;
    Button2: TButton;
    SkinData1: TSkinData;
    DateEdit2: TDateEdit;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox8Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVentaDetXUsuario: TfrmVentaDetXUsuario;
  xCodUsr : integer;

implementation

uses UDatosVentas, UGlobal;

{$R *.dfm}

procedure TfrmVentaDetXUsuario.FormCreate(Sender: TObject);
begin
  DateEdit1.Date:= GlbFechaTrnDiaria;
  DateEdit2.Date:= GlbFechaTrnDiaria;
  qryEmpleado.Close;
  qryEmpleado.Open;
  qryEmpleado.First;
  While Not qryEmpleado.Eof do
  begin
    if (qryEmpleadoCARGO_EMPLEADO.Value <> UpperCase('VENDEDOR'))
       Or (qryEmpleadoCARGO_EMPLEADO.Value <> UpperCase('CHOFER'))
       Or (qryEmpleadoCARGO_EMPLEADO.Value <> UpperCase('DESPACHADOR')) then
    ComboBox8.Items.Add(qryEmpleadoNOMBRECOMPLETO.Value);
    qryEmpleado.Next;
  end;
end;

procedure TfrmVentaDetXUsuario.ComboBox8Change(Sender: TObject);
begin
  if qryEmpleado.Locate('NOMBRECOMPLETO', ComboBox8.Text,[]) then
  xCodUsr:= qryEmpleadoCODIGO.Value;
end;

procedure TfrmVentaDetXUsuario.Button1Click(Sender: TObject);
begin
  dmVentas.qryDetVtaXUsr.Close;
  dmVentas.qryDetVtaXUsr.Params[0].Value:= ExtraerFecha(DateEdit1.Date);
  dmVentas.qryDetVtaXUsr.Params[1].Value:= ExtraerFecha(DateEdit2.Date);
  dmVentas.qryDetVtaXUsr.Params[2].Value:= xCodUsr;
  dmVentas.qryDetVtaXUsr.Params[3].Value:= xCodUsr;
  dmVentas.qryDetVtaXUsr.Open;
end;

procedure TfrmVentaDetXUsuario.Button2Click(Sender: TObject);
begin
  if dmVentas.qryDetVtaXUsr.RecordCount = 0 then Exit;
  if (Not DirectoryExists('Informes')) then
  CreateDir('Informes');

  GLBMostrarArchivo:=True;
  if not dmVentas.qryDetVtaXUsrNOMBRECOMPLETO.IsNull then
  ExporToExcel(dmVentas.qryDetVtaXUsr, ExtractFilePath(Application.ExeName)+
  'Informes\RepDetalleVtaXUsr_'+dmVentas.qryDetVtaXUsrNOMBRECOMPLETO.Value+
  FormatDateTime('ddmmyyyy',now)+'_'
  +FormatDateTime('hhmmss',now),false) else
  ExporToExcel(dmVentas.qryDetVtaXUsr, ExtractFilePath(Application.ExeName)+
  'Informes\RepDetalleVtaXUsuario'+
  FormatDateTime('ddmmyyyy',now)+'_'
  +FormatDateTime('hhmmss',now),false);
  GLBMostrarArchivo:=False; 
end;

end.
