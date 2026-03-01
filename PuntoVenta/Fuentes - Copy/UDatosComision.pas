unit UDatosComision;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, StdCtrls, Buttons, Grids, DBGrids,
  WinSkinData;

type
  TfrmDatosComision = class(TForm)
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    DataSource1: TDataSource;
    QryDatosComsionxVenta: TIBQuery;
    SkinData1: TSkinData;
    Label1: TLabel;
    Label2: TLabel;
    QryDatosComsionxVentaCODIGO_EMP: TIntegerField;
    QryDatosComsionxVentaCODIGO_RUTA: TIntegerField;
    QryDatosComsionxVentaTIPO_COMISION: TIntegerField;
    QryDatosComsionxVentaCODIGO_PROD: TIBStringField;
    QryDatosComsionxVentaMONTO_COMISION: TFloatField;
    QryDatosComsionxVentaCANT_CAJAS_VENDIDAS: TFloatField;
    QryDatosComsionxVentaCOMISION_NETA: TFloatField;
    QryDatosComsionxVentaDESC_PRODUCTO: TIBStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDatosComision: TfrmDatosComision;

implementation

uses UDatModConectar;

{$R *.dfm}

end.
