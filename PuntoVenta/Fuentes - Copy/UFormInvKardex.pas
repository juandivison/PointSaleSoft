unit UFormInvKardex;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, Grids, DBGrids, RxDBCtrl,
  StdCtrls, Buttons, ComCtrls, WinSkinData;

type
  Tfrmkardex = class(TForm)
    DataSource1: TDataSource;
    qryKardexDet: TIBQuery;
    qryInventario: TIBQuery;
    dsqryInventario: TDataSource;
    qryInventarioCODIGO: TIntegerField;
    qryInventarioCODIGO_BARRA: TIBStringField;
    qryInventarioDESCRIPCION: TIBStringField;
    qryInventarioCANTIDAD: TFloatField;
    qryInventarioPRECIO_VENTA: TFloatField;
    qryInventarioCOSTO_UNITARIO: TFloatField;
    qryKardexDetSERIE: TIntegerField;
    qryKardexDetCODIGO_PRODUCTO: TIntegerField;
    qryKardexDetTIPO_OPERACION: TIBStringField;
    qryKardexDetDESCRIPCION: TIBStringField;
    qryKardexDetCANTIDAD_TOTAL: TFloatField;
    qryKardexDetENTRADA_TOTAL: TFloatField;
    qryKardexDetSALIDA_TOTAL: TFloatField;
    qryKardexDetPRECIO_VENTA: TFloatField;
    qryKardexDetCOSTO_PRODUCTO: TFloatField;
    qryKardexDetCOSTO_TOTAL: TFloatField;
    qryBlckardex: TIBQuery;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    RxDBGrid1: TRxDBGrid;
    BitBtn1: TBitBtn;
    RxDBGrid2: TRxDBGrid;
    BitBtn35: TBitBtn;
    TabSheet2: TTabSheet;
    BitBtn2: TBitBtn;
    dsqryBlckardex: TDataSource;
    RxDBGrid3: TRxDBGrid;
    qryBlckardexCODIGO_PRODUCTO: TIBStringField;
    qryBlckardexDESCRIPCION: TIBStringField;
    qryBlckardexBALANCE_ANTERIOR: TFloatField;
    qryBlckardexCANT_INV: TFloatField;
    qryBlckardexENTRADA_TOTAL: TFloatField;
    qryBlckardexSALIDA_TOTAL: TFloatField;
    qryBlckardexBALANCE_ACTUAL: TFloatField;
    qryBlckardexCOSTO_TOTAL: TFloatField;
    qryBlckardexOTRO_INV: TFloatField;
    SkinData1: TSkinData;
    procedure BitBtn1Click(Sender: TObject);
    procedure qryInventarioAfterScroll(DataSet: TDataSet);
    procedure BitBtn35Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmkardex: Tfrmkardex;

implementation
 uses UDatModConectar, UGlobal, UConsultaInventario;
{$R *.dfm}

procedure Tfrmkardex.BitBtn1Click(Sender: TObject);
begin
  qryInventario.close;
  qryInventario.open;
end;

procedure Tfrmkardex.qryInventarioAfterScroll(DataSet: TDataSet);
begin
  qryKardexDet.Close;
  qryKardexDet.Params[0].Value:= qryInventarioCODIGO.Value;
  qryKardexDet.Open;
end;

procedure Tfrmkardex.BitBtn35Click(Sender: TObject);
begin
  if qryInventario.state = dsInactive then
  qryInventario.Open;
  frmConsultaInventario:=TfrmConsultaInventario.Create(Nil);
  try
    if frmConsultaInventario.Showmodal = mrOk then
    qryInventario.Locate('codigo',frmConsultaInventario.ibquery1codigo.Value,[]);
  finally
  frmConsultaInventario.Free;
  frmConsultaInventario:=Nil;
  end;
end;

procedure Tfrmkardex.BitBtn2Click(Sender: TObject);
begin
  qryBlckardex.Close;
  qryBlckardex.params[0].value:=0;
  qryBlckardex.open;
end;

end.
