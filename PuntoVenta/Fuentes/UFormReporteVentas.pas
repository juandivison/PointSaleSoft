unit UFormReporteVentas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, StdCtrls, Mask, RxToolEdit,
  RxDBCtrl, Buttons, WinSkinData;

type
  TfrmReporteVentas = class(TForm)
    qryReporteVentas: TIBQuery;
    Label1: TLabel;
    Label2: TLabel;
    dtpkFechaIni: TDateEdit;
    dtpkFechaFin: TDateEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    CheckBox1: TCheckBox;
    SkinData1: TSkinData;
    qryReporteVentasECF: TIBQuery;
    chkeCF: TCheckBox;
    chkResumeneCF: TCheckBox;
    qryReporteVentasECFResumen: TIBQuery;
    procedure FormCreate(Sender: TObject);
    procedure dtpkFechaIniExit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    procedure ExporNCFListToExcel(mTabla : TIBQuery; NombreArchivo : String);
  public
    { Public declarations }
  end;

var
  frmReporteVentas: TfrmReporteVentas;

implementation

uses UDatModConectar, UGlobal, UFormSelFecha;

{$R *.dfm}

procedure TfrmReporteVentas.FormCreate(Sender: TObject);
begin
  dtpkFechaIni.Date:= GlbPrimerDiaMes(GlbFechaTrnDiaria);
  dtpkFechaFin.Date:= GlbUltimoDiaMes(GlbFechaTrnDiaria);  
end;

procedure TfrmReporteVentas.dtpkFechaIniExit(Sender: TObject);
begin
  dtpkFechaFin.Date:= GlbUltimoDiaMes(dtpkFechaIni.Date);
end;

procedure TfrmReporteVentas.ExporNCFListToExcel(mTabla: TIBQuery;
  NombreArchivo: String);
begin

end;

procedure TfrmReporteVentas.BitBtn2Click(Sender: TObject);
begin
  GLBMostrarArchivo := True;
  GlbEnviaEmail := CheckBox1.Checked;
  
  GlbIDTipoEmail:= 1; //Detalle NCF
  if (Not DirectoryExists('Informes')) then
  CreateDir('Informes');
  if chkeCF.Checked then
  begin
    qryReporteVentasECF.Close;
    qryReporteVentasECF.Params[0].Value:= ExtraerFecha(dtpkFechaIni.Date);
    qryReporteVentasECF.Params[1].Value:= ExtraerFecha(dtpkFechaFin.Date);
    qryReporteVentasECF.Open;

    ExporNCFListToExcelFPago(qryReporteVentasECF, ExtractFilePath(Application.ExeName)+
    'Informes\RelacionNCFConFormaPagoECF'+
    FormatDateTime('ddmmyyyy',qryReporteVentas.Params[0].Value)+'_A_'+
    FormatDateTime('ddmmyyyy',qryReporteVentas.Params[1].Value))
  end else
  if chkResumeneCF.Checked then
  begin
    qryReporteVentasECFResumen.Close;
    qryReporteVentasECFResumen.Params[0].Value:= ExtraerFecha(dtpkFechaIni.Date);
    qryReporteVentasECFResumen.Params[1].Value:= ExtraerFecha(dtpkFechaFin.Date);
    qryReporteVentasECFResumen.Open;
    ExporNCFListToExcelFPago(qryReporteVentasECFResumen, ExtractFilePath(Application.ExeName)+
    'Informes\RelacionNCFConFormaPagoECF_Resumen'+
    FormatDateTime('ddmmyyyy',qryReporteVentas.Params[0].Value)+'_A_'+
    FormatDateTime('ddmmyyyy',qryReporteVentas.Params[1].Value))
  end else
  begin
    qryReporteVentas.Close;
    qryReporteVentas.Params[0].Value:= ExtraerFecha(dtpkFechaIni.Date);
    qryReporteVentas.Params[1].Value:= ExtraerFecha(dtpkFechaFin.Date);
    qryReporteVentas.Open;
    ExporNCFListToExcelFPago(qryReporteVentas, ExtractFilePath(Application.ExeName)+
    'Informes\RelacionNCFConFormaPago'+
    FormatDateTime('ddmmyyyy',qryReporteVentas.Params[0].Value)+'_A_'+
    FormatDateTime('ddmmyyyy',qryReporteVentas.Params[1].Value));
  end;
  MessageDlg('Archivo de Excel generado.', mtInformation,[mbok], 0);
end;

procedure TfrmReporteVentas.BitBtn1Click(Sender: TObject);
begin
  qryReporteVentas.Close;
  qryReporteVentas.Params[0].Value:= ExtraerFecha(dtpkFechaIni.Date);
  qryReporteVentas.Params[1].Value:= ExtraerFecha(dtpkFechaFin.Date);
  qryReporteVentas.Open;
  if qryReporteVentas.RecordCount = 0 then
  begin
    MessageDlg('No hay datos con fecha indicada',mtInformation,[mbok],0);
    BitBtn2.Enabled:=False;
  end;
  BitBtn2.Enabled:=True;
  qryReporteVentas.First;
end;

end.
