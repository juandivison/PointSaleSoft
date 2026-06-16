unit UformConsultarVerificaMontosVtas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Buttons, StdCtrls, ExtCtrls, Grids, DBGrids, RxDBCtrl,
  DB, IBCustomDataSet, IBQuery, WinSkinData;

type
  TfrmConsultarVtasVerDiff = class(TForm)
    qryDatos: TIBQuery;
    qryDatosNUMERO: TIntegerField;
    qryDatosFECHA: TDateTimeField;
    qryDatosFORMA_PAGO: TIBStringField;
    qryDatosES_CREDITO: TSmallintField;
    qryDatosMASTER_MONTO_BRUTO: TFloatField;
    qryDatosMASTER_MONTO_DESCUENTO: TFloatField;
    qryDatosMASTER_VALOR_TOTAL_DET: TFloatField;
    qryDatosMASTER_MONTO_TOTAL_ITBIS: TFloatField;
    qryDatosMASTER_MONTO_PAGADO: TFloatField;
    qryDatosMASTER_MONTO_CAMBIO: TFloatField;
    qryDatosCALC_BRUTO_X_PRECIO: TFloatField;
    qryDatosCALC_DESCUENTO_PORC: TFloatField;
    qryDatosCALC_VALOR_TOTAL_DET: TFloatField;
    qryDatosCALC_BASE_SIN_ITBIS: TFloatField;
    qryDatosBD_VALOR_TOTAL_DET: TFloatField;
    qryDatosBD_ITBIS_FISCAL_DET: TFloatField;
    qryDatosBD_ITBI_DET: TFloatField;
    qryDatosBD_VALOR_SERVICIO_DET: TFloatField;
    qryDatosBD_BASE_SIN_ITBIS: TFloatField;
    qryDatosPAGO_NETO: TFloatField;
    qryDatosDIF_CALC_TOTAL_VS_BD: TFloatField;
    qryDatosDIF_TOTAL_CON_ITBIS_VS_MASTER: TFloatField;
    qryDatosDIF_BASE_SIN_ITBIS_VS_MASTER: TFloatField;
    qryDatosDIF_ITBIS_VS_MASTER: TFloatField;
    qryDatosDIF_DESCUENTO_PORC_VS_MASTER: TFloatField;
    qryDatosDIF_PAGO_NETO_VS_TOTAL: TFloatField;
    qryDatosCANT_LINEAS: TIntegerField;
    qryDatosESTADO_CUADRE: TIBStringField;
    qryDatosOBSERVACION: TIBStringField;
    DataSource1: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    RxDBGrid1: TRxDBGrid;
    Panel1: TPanel;
    Label60: TLabel;
    Label61: TLabel;
    Button3: TButton;
    Button4: TButton;
    BitBtn8: TBitBtn;
    DateTimePicker2: TDateTimePicker;
    DateTimePicker3: TDateTimePicker;
    SkinData1: TSkinData;
    procedure BitBtn8Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultarVtasVerDiff: TfrmConsultarVtasVerDiff;

implementation

uses UDatModConectar, UGlobal;

{$R *.dfm}

procedure TfrmConsultarVtasVerDiff.BitBtn8Click(Sender: TObject);
begin
  qryDatos.close;
  qryDatos.params[0].Value:=ExtraerFEcha(DateTimePicker2.DateTime);
  qryDatos.params[1].Value:=ExtraerFEcha(DateTimePicker3.DateTime);
  qryDatos.Open;
end;

procedure TfrmConsultarVtasVerDiff.FormCreate(Sender: TObject);
begin
  DateTimePicker2.Date:=GlbFechaTrnDiaria - 30;
  DateTimePicker3.Date:=GlbFechaTrnDiaria;
end;

procedure TfrmConsultarVtasVerDiff.Button3Click(Sender: TObject);
begin
  DateTimePicker2.Date:=DateTimePicker2.Date + 1;
  DateTimePicker2.Date:=DateTimePicker2.Date + 1;
end;

procedure TfrmConsultarVtasVerDiff.Button4Click(Sender: TObject);
begin
  DateTimePicker2.Date:=DateTimePicker2.Date - 1;
  DateTimePicker2.Date:=DateTimePicker2.Date - 1;
end;

end.
