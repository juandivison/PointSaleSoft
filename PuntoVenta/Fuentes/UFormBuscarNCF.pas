unit UFormBuscarNCF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, Grids, DBGrids, RXDBCtrl,
  WinSkinData, StdCtrls, Buttons;

type
  TfrmBuscarNCF = class(TForm)
    qryDatosNCF: TIBQuery;
    dsqryDatosNCF: TDataSource;
    qryDatosNCFDESC_TIPO_NCF: TIBStringField;
    qryDatosNCFNUMERO_FACTURA: TIntegerField;
    qryDatosNCFSERIE_NCF_ASIGNADO: TIntegerField;
    qryDatosNCFNUMERO_NCF: TIBStringField;
    qryDatosNCFMONTO_PENDIENTE: TFloatField;
    qryDatosNCFCODIGO_CTE: TIntegerField;
    qryDatosNCFNOMBRE_CTE: TIBStringField;
    qryDatosNCFRNC_NUMERO: TIBStringField;
    RxDBGrid1: TRxDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    SkinData1: TSkinData;
    qryDatosNCFFECHA: TDateTimeField;
    qryDatosNCFTIPO_CF: TIBStringField;
    qryDatosNCFNOMBRE_ABREV: TIBStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBuscarNCF: TfrmBuscarNCF;

implementation

uses UDatModConectar;

{$R *.dfm}

end.
