unit UFormGenerarConduce;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, StdCtrls, Mask, DBCtrls, Grids, DBGrids,
  RXDBCtrl, WinSkinData, RXCtrls, Buttons;

type
  TfrmGenerarConduce = class(TForm)
    tblCotizacionDet: TIBDataSet;
    tblCotizacionDetDESCRIPCION: TIBStringField;
    tblCotizacionDetSERIE: TIntegerField;
    tblCotizacionDetNUMERO: TIntegerField;
    tblCotizacionDetCODIGO_PROD: TIBStringField;
    tblCotizacionDetCODIGO_BARRA: TIBStringField;
    tblCotizacionDetDESCRIPCIONESPECIAL: TMemoField;
    tblCotizacionDetCANTIDAD: TFloatField;
    tblCotizacionDetPRECIO: TFloatField;
    tblCotizacionDetPORC_DESC_DET: TFloatField;
    tblCotizacionDetITBI_DET: TFloatField;
    tblCotizacionDetVALOR_SERVICIO_DET: TFloatField;
    tblCotizacionDetVALOR_TOTAL_DET: TFloatField;
    tblCotizacionDetSTATUS_DET: TIBStringField;
    tblCotizacionDetFECHA_IN: TDateTimeField;
    tblCotizacionDetIN_POR: TIBStringField;
    tblCotizacionDetFECHA_MOD: TDateTimeField;
    tblCotizacionDetMOD_POR: TIBStringField;
    tblCotizacionDetCANT_REGRESO: TFloatField;
    tblCotizacionDetCANT_PROMO: TFloatField;
    tblCotizacionDetMONTO_DIETA: TFloatField;
    tblCotizacionDetMONTO_AJUSTE: TFloatField;
    tblCotizacionDetSERIE_PROD: TIBStringField;
    tblCotizacionDetSTATUS_CNT: TIBStringField;
    tblCotizacionDetTIPO_UNIDAD: TIntegerField;
    tblCotizacionDetITBIS_EXENTO: TSmallintField;
    tblCotizacionDetTIPO_VENTA: TSmallintField;
    tblCotizacionDetDESCRIPCIONPRODUCTO: TMemoField;
    tblCotizacionDetCANT_CONDUCE: TFloatField;
    dstblCotizacionDet: TDataSource;
    RxDBGrid1: TRxDBGrid;
    SkinData1: TSkinData;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    DBStatusLabel2: TDBStatusLabel;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn1: TBitBtn;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    procedure ProcAbrirDatos(numCotiza : Integer);
    procedure ProcAsignaCantConduce;
  end;

var
  frmGenerarConduce: TfrmGenerarConduce;

implementation

uses UDatModConectar, UGlobal, UDatModFactura;

{$R *.dfm}

procedure TfrmGenerarConduce.ProcAbrirDatos(numCotiza : Integer);
begin
  tblCotizacionDet.Close;
  tblCotizacionDet.Params[0].Value:=numCotiza;
  tblCotizacionDet.Open;
  {dmFactura.qryCotizacionConduceDet.Close;
  dmFactura.qryCotizacionConduceDet.Params[0].Value :=numCotiza;
  dmFactura.qryCotizacionConduceDet.Open;}
end;

procedure TfrmGenerarConduce.BitBtn3Click(Sender: TObject);
begin
  if tblCotizacionDet.State = dsBrowse then
  tblCotizacionDet.Edit;
end;

procedure TfrmGenerarConduce.BitBtn4Click(Sender: TObject);
begin
  if tblCotizacionDet.State In [dsEdit] then
  begin
    tblCotizacionDetMOD_POR.Value  := StrUserName;
    tblCotizacionDetFECHA_MOD.Value:= Now;

    GlbSalvarQuery(tblCotizacionDet);
  end;
end;

procedure TfrmGenerarConduce.ProcAsignaCantConduce;
begin
  tblCotizacionDet.First;
  tblCotizacionDet.DisableControls;
  While Not tblCotizacionDet.Eof Do
  begin
    tblCotizacionDet.Edit;
    tblCotizacionDetCANT_CONDUCE.Value := tblCotizacionDetCANTIDAD.Value;
    GlbSalvarQuery(tblCotizacionDet);
    tblCotizacionDet.Next;
  end;
  tblCotizacionDet.First;
  tblCotizacionDet.EnableControls;
end;

procedure TfrmGenerarConduce.BitBtn5Click(Sender: TObject);
begin
  tblCotizacionDet.Close;
  tblCotizacionDet.Open;
end;

procedure TfrmGenerarConduce.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  BitBtn4Click(Self);
  if tblCotizacionDet.UpdatesPending then
  GlbSalvarQuery(tblCotizacionDet);
end;

end.
