unit UConciliarNIF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, StdCtrls, Grids, DBGrids, RXDBCtrl, IBQuery,
  Buttons, ComCtrls, WinSkinData;

type
  TfrmConciliarNIFvsVenta = class(TForm)
    tblNIFCtrl: TIBDataSet;
    tblNIFCtrlNUMERO_TRN: TIntegerField;
    tblNIFCtrlNIF: TIBStringField;
    tblNIFCtrlFECHA_IN: TDateTimeField;
    tblNIFCtrlFECHA_UPDATE: TDateTimeField;
    tblNIFCtrlSTATUS: TIBStringField;
    RxDBGrid1: TRxDBGrid;
    dstblNIFCtrl: TDataSource;
    Label1: TLabel;
    tblEstadoFiscal: TIBDataSet;
    tblEstadoFiscalNUMERO: TIntegerField;
    tblEstadoFiscalNIF: TIBStringField;
    tblEstadoFiscalTIPO: TIntegerField;
    tblEstadoFiscalTOTAL_BRUTO: TFloatField;
    tblEstadoFiscalMONTO_ITBIS: TFloatField;
    tblEstadoFiscalTOTAL_NETO: TFloatField;
    tblEstadoFiscalSTATUS: TIBStringField;
    tblEstadoFiscalEXONERAITBIS: TFloatField;
    tblEstadoFiscalRECARGO: TFloatField;
    tblEstadoFiscalMONTODESCUENTO: TFloatField;
    RxDBGrid2: TRxDBGrid;
    dstblEstadoFiscal: TDataSource;
    Label2: TLabel;
    qryVentaMast: TIBQuery;
    qryVentaMastNUMERO: TIntegerField;
    qryVentaMastFECHA: TDateTimeField;
    qryVentaMastCODIGO_CTE: TIntegerField;
    qryVentaMastNIF_IMPRESO: TSmallintField;
    RxDBGrid3: TRxDBGrid;
    dsqryVentaMast: TDataSource;
    Label3: TLabel;
    qryNCFGenrado: TIBQuery;
    qryVentaMastSERIE_NCF_ASIGNADO: TIntegerField;
    RxDBGrid4: TRxDBGrid;
    Label4: TLabel;
    qryNCFGenradoSERIE: TIntegerField;
    qryNCFGenradoTIPO_NCF: TIBStringField;
    qryNCFGenradoNUMERO_NCF: TIBStringField;
    qryNCFGenradoFECHA: TDateTimeField;
    qryNCFGenradoCODIGO_CTE: TIntegerField;
    qryNCFGenradoNOMBRE_COMPLETO: TIBStringField;
    qryNCFGenradoCEDULA: TIBStringField;
    qryNCFGenradoDIRECCION: TIBStringField;
    qryNCFGenradoCIUDAD: TIBStringField;
    qryNCFGenradoMONTO: TFloatField;
    qryNCFGenradoSTATUS: TIBStringField;
    qryNCFGenradoCODIGO_USUARIO: TIntegerField;
    qryNCFGenradoFECHA_INSERT: TDateTimeField;
    qryNCFGenradoFECHA_UPDATE: TDateTimeField;
    qryNCFGenradoCODIGO_USUARIO_UPD: TIntegerField;
    dsqryNCFGenrado: TDataSource;
    dtpkFecha: TDateTimePicker;
    Label5: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    SkinData1: TSkinData;
    qryVentaMastSTATUS: TIBStringField;
    Button1: TButton;
    procedure tblNIFCtrlAfterScroll(DataSet: TDataSet);
    procedure qryVentaMastAfterScroll(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure RxDBGrid3GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConciliarNIFvsVenta: TfrmConciliarNIFvsVenta;

implementation

uses UDatModConectar, UGlobal, UBorrarNifDuplicado;

{$R *.dfm}

procedure TfrmConciliarNIFvsVenta.tblNIFCtrlAfterScroll(DataSet: TDataSet);
begin
  tblEstadoFiscal.Close;
  tblEstadoFiscal.params[0].value:=tblNIFCtrlNIF.value;
  tblEstadoFiscal.Open;

  qryVentaMast.Close;
  qryVentaMast.params[0].value:=tblNIFCtrlNUMERO_TRN.value;
  qryVentaMast.Open;
end;

procedure TfrmConciliarNIFvsVenta.qryVentaMastAfterScroll(
  DataSet: TDataSet);
begin
  qryNCFGenrado.Close;
  qryNCFGenrado.Params[0].Value := qryVentaMastSERIE_NCF_ASIGNADO.Value;
  qryNCFGenrado.Open;
end;

procedure TfrmConciliarNIFvsVenta.FormCreate(Sender: TObject);
begin
  dtpkFecha.DateTime := GlbFechaTrnDiaria;
  bitbtn1Click(Self);
end;

procedure TfrmConciliarNIFvsVenta.BitBtn1Click(Sender: TObject);
begin
  tblNIFCtrl.Close;
  tblNIFCtrl.Params[0].Value := ExtraerFecha(dtpkFecha.Date);
  tblNIFCtrl.Open;
end;

procedure TfrmConciliarNIFvsVenta.BitBtn2Click(Sender: TObject);
begin
  tblNIFCtrl.Close;
  tblNIFCtrl.Params[0].Value := tblNIFCtrl.Params[0].Value + 1;
  dtpkFecha.Date:=tblNIFCtrl.Params[0].Value;
  tblNIFCtrl.Open;
end;

procedure TfrmConciliarNIFvsVenta.BitBtn3Click(Sender: TObject);
begin
  tblNIFCtrl.Close;
  tblNIFCtrl.Params[0].Value := tblNIFCtrl.Params[0].Value - 1;
  dtpkFecha.Date:=tblNIFCtrl.Params[0].Value;
  tblNIFCtrl.Open;
end;

procedure TfrmConciliarNIFvsVenta.RxDBGrid3GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if qryVentaMastNIF_IMPRESO.Value = 0 then
  BackGround := clYellow;
  if qryVentaMastSTATUS.Value = 'C' then
  BackGround := clSilver;
end;

procedure TfrmConciliarNIFvsVenta.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if tblNIFCtrlSTATUS.Value = 'T' then
  Background := clYellow;
end;

procedure TfrmConciliarNIFvsVenta.Button1Click(Sender: TObject);
begin
  try
    tblNIFCtrl.CancelUpdates;
  except
  end;

  frmEliminaNIFDuplicado:=TfrmEliminaNIFDuplicado.Create(Nil);
  try
    frmEliminaNIFDuplicado.Showmodal;
  finally
  FreeAndNil(frmEliminaNIFDuplicado);
  end;
  BitBtn1Click(Self);
end;

end.
