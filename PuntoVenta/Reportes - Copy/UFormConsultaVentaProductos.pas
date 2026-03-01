unit UFormConsultaVentaProductos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WinSkinData, DB, StdCtrls, Buttons, Grids, DBGrids, RxDBCtrl,
  ComCtrls, IBCustomDataSet, IBQuery, RxCtrls;

type
  TfrmConsultaVtaProductos = class(TForm)
    Label1: TLabel;
    edtIni: TEdit;
    RxDBGrid1: TRxDBGrid;
    BitBtn1: TBitBtn;
    DataSource1: TDataSource;
    SkinData1: TSkinData;
    BitBtn35: TBitBtn;
    DateTimePicker1: TDateTimePicker;
    Label2: TLabel;
    DateTimePicker2: TDateTimePicker;
    Label3: TLabel;
    qryVenta: TIBQuery;
    qryVentaFECHA: TDateTimeField;
    qryVentaCODIGO_CTE: TIntegerField;
    qryVentaNOMBRECLIENTE: TIBStringField;
    qryVentaCODIGO_PROD: TIBStringField;
    qryVentaCANT: TFloatField;
    qryVentaDESCRIPCION: TIBStringField;
    qryTotales: TIBQuery;
    qryTotalesFECHA: TDateTimeField;
    qryTotalesCANT: TFloatField;
    RxDBGrid2: TRxDBGrid;
    dsqryTotales: TDataSource;
    Label4: TLabel;
    RxLabel1: TRxLabel;
    RxLabel2: TRxLabel;
    BitBtn2: TBitBtn;
    procedure BitBtn35Click(Sender: TObject);
    procedure qryVentaAfterOpen(DataSet: TDataSet);
    procedure qryVentaAfterClose(DataSet: TDataSet);
    procedure qryTotalesAfterOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaVtaProductos: TfrmConsultaVtaProductos;

implementation

uses UDatModConectar, uglobal, UConsultaInventario, UDatModCompania;

{$R *.dfm}

procedure TfrmConsultaVtaProductos.BitBtn35Click(Sender: TObject);
begin
  if (edtIni.Text <> '') then
  begin
    BitBtn1Click(Self);
    Exit;
  end;
  frmConsultaInventario:=TfrmConsultaInventario.Create(Nil);
  try
    frmConsultaInventario.EditN1.Text:=edtIni.Text;
    if frmConsultaInventario.Showmodal = mrOk then
    edtIni.Text :=frmConsultaInventario.ibquery1codigo.AsString;
    qryVenta.Close;
    
    if (edtIni.Text <> '') then
    begin
      qryVenta.Params[0].Value:= ExtraerFecha(DateTimePicker1.DateTime);
      qryVenta.Params[1].Value:= ExtraerFecha(DateTimePicker2.DateTime);
      qryVenta.Params[2].Value:= StrToInt(edtIni.Text);
      qryVenta.Open;
    end;
  finally
  frmConsultaInventario.Free;
  frmConsultaInventario:=Nil;
  end;
end;

procedure TfrmConsultaVtaProductos.qryVentaAfterOpen(DataSet: TDataSet);
begin
  qryTotales.Close;
  qryTotales.Params[0].Value:= ExtraerFecha(DateTimePicker1.DateTime);
  qryTotales.Params[1].Value:= ExtraerFecha(DateTimePicker2.DateTime);
  if (edtIni.Text <> '') then
  begin
    qryTotales.Params[2].Value:= StrToInt(edtIni.Text);
    qryTotales.Open;
  end;
end;

procedure TfrmConsultaVtaProductos.qryVentaAfterClose(DataSet: TDataSet);
begin
  qryTotales.Close;
  RxLabel2.Caption:= '';
end;

procedure TfrmConsultaVtaProductos.qryTotalesAfterOpen(DataSet: TDataSet);
var
  cant : Currency;
begin
  qryTotales.First;
  cant:=0;
  while not qryTotales.Eof do
  begin
    cant:=cant + qryTotalescant.Value;
    qryTotales.Next;
  end;
  RxLabel2.Caption:= InsertarComa(FloatToStr(cant));
end;

procedure TfrmConsultaVtaProductos.FormCreate(Sender: TObject);
begin
  RxLabel2.Caption:='';
  DateTimePicker1.DateTime:=GlbFechaTrnDiaria;
  DateTimePicker2.DateTime:=GlbFechaTrnDiaria;
end;

procedure TfrmConsultaVtaProductos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qryTotales.Close;
  qryVenta.Close;
end;

procedure TfrmConsultaVtaProductos.BitBtn1Click(Sender: TObject);
begin
  qryVenta.Close;
  if (edtIni.Text = '') then Exit;
  qryVenta.Params[0].Value:= ExtraerFecha(DateTimePicker1.DateTime);
  qryVenta.Params[1].Value:= ExtraerFecha(DateTimePicker2.DateTime);
  qryVenta.Params[2].Value:= StrToInt(edtIni.Text);
  qryVenta.Open;
end;

procedure TfrmConsultaVtaProductos.BitBtn2Click(Sender: TObject);
begin
  dmCompania.tblCompania.Close;
  dmCompania.tblCompania.Open;
  dmCompania.tblCompania.Locate('codigo',glbCia_Key,[]);
  GLBMostrarArchivo:=True;
  ExporToExcel(qryVenta, ExtractFilePath(Application.ExeName)+
  'Informes\ListadoDeVenta'+qryVentaDESCRIPCION.Value+
   FormatDateTime('ddmmyyyy',qryVenta.Params[0].Value)+'_'
  +FormatDateTime('ddmmyyyy',qryVenta.Params[1].Value),false);
  GLBMostrarArchivo:=False;
end;

end.
