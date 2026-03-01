unit UFormVerCierreZ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, StdCtrls, Grids, DBGrids, RXDBCtrl,
  Mask, rxToolEdit, EditNew, RxMemDS, Buttons;

type
  TfrmCierreZ = class(TForm)
    qryDatosVenta: TIBQuery;
    qryDatosVentaDESTTIPOVENTA: TIBStringField;
    qryDatosVentaNUMERO: TIntegerField;
    qryDatosVentaFECHA: TDateTimeField;
    qryDatosVentaDESCRIPCION: TIBStringField;
    qryDatosVentaNIF: TIBStringField;
    qryDatosVentaTIPO: TIntegerField;
    qryDatosVentaMONTO_ITBIS: TFloatField;
    qryDatosVentaNUMERO_NCF: TIBStringField;
    qryDatosVentaTIPONCFIFISCAL: TIntegerField;
    qryDatosVentaTIPO_NCF: TIBStringField;
    qryDatosVentaMONTO_TOTAL_ITBIS: TFloatField;
    qryDatosVentaMONTO_RECARGO: TFloatField;
    qryDatosVentaMONTO_EXONERADO_ITBIS: TFloatField;
    qryDatosVentaMONTO_DESCUENTO: TFloatField;
    qryDatosVentaTIPO_VENTA: TSmallintField;
    qryDatosVentaDESCRIPCIONPRODUCTO: TMemoField;
    qryDatosVentaIDTASAITBIS: TFloatField;
    qryDatosVentaCANTIDAD: TFloatField;
    qryDatosVentaPRECIO: TFloatField;
    qryDatosVentaITBIS_FISCAL_DET: TFloatField;
    qryDatosVentaITBI_DET: TFloatField;
    qryDatosVentaMONTO_DESC_ITEM: TFloatField;
    qryDatosVentaPORC_DESC_DET: TFloatField;
    qryDatosVentaPORC_DESC_DET1: TFloatField;
    qryDatosVentaMONTO_AJUSTE: TFloatField;
    qryDatosVentaMONTO_DIETA: TFloatField;
    qryDatosVentaVALOR_SERVICIO_DET: TFloatField;
    qryDatosVentaVALOR_TOTAL_DET: TFloatField;
    qryDatosVentaSTATUS_DET: TIBStringField;
    qryDatosVentaFORMA_PAGO: TSmallintField;
    RxDBGrid1: TRxDBGrid;
    Button1: TButton;
    Label3: TLabel;
    Label4: TLabel;
    dbEditFechaInicial: TDateEdit;
    dbEditFechaFinal: TDateEdit;
    dsqryDatosVenta: TDataSource;
    rxData: TRxMemoryData;
    edtCierreZIni: TEditN;
    Label1: TLabel;
    edtCierreZFinal: TEditN;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure edtCierreZFinalExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCierreZ: TfrmCierreZ;

implementation

uses UDatModConectar, UGlobal, UDatModReportes, URepVentaFiscalDet;

{$R *.dfm}

procedure TfrmCierreZ.Button1Click(Sender: TObject);
begin
  qryDatosVenta.Close;
  qryDatosVenta.Params[0].Value := ExtraerFecha(dbEditFechaInicial.Date);
  qryDatosVenta.Params[1].Value := ExtraerFecha(dbEditFechaFinal.Date);
  qryDatosVenta.Open;
end;

procedure TfrmCierreZ.FormCreate(Sender: TObject);
begin
  dbEditFechaInicial.Date := GlbFechaTrnDiaria;
  dbEditFechaFinal.Date := GlbFechaTrnDiaria;  
end;

procedure TfrmCierreZ.BitBtn1Click(Sender: TObject);
begin
  dmReportes.qryRepLibroVentaDet.Close;
  dmReportes.qryRepLibroVentaDet.Params[0].Value:= ExtraerFecha(dbEditFechaInicial.Date);
  dmReportes.qryRepLibroVentaDet.Params[1].Value:= ExtraerFecha(dbEditFechaFinal.Date);
  if (edtCierreZIni.Text <> '') then
  dmReportes.qryRepLibroVentaDet.Params[2].Value:= strtoint(edtCierreZIni.Text);
  if (edtCierreZFinal.Text <> '') then
  dmReportes.qryRepLibroVentaDet.Params[3].Value:= strtoint(edtCierreZFinal.Text);
  dmReportes.qryRepLibroVentaDet.Open;
  qckRepVentaFiscalDet:=tqckRepVentaFiscalDet.Create(nil);
  try
    qckRepVentaFiscalDet.Preview;
  finally
  qckRepVentaFiscalDet.free;
  qckRepVentaFiscalDet:=nil;
  end;
end;

procedure TfrmCierreZ.edtCierreZFinalExit(Sender: TObject);
begin
  if (edtCierreZFinal.Text <> '') then
  begin
    if (edtCierreZFinal.ValueInteger < edtCierreZFinal.ValueInteger) then
    MessageDlg('Verifique numero cierre Z es menor que cierre z inicial.',mtInformation,[mbok],0);
  end;
end;

end.
