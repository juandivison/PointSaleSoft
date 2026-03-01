unit UFormDatosPendCrearTicket;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, WinSkinData, StdCtrls, Buttons,
  Grids, DBGrids, RXDBCtrl, RXCtrls;

type
  TfrmDatosVenta = class(TForm)
    RxLabel1: TRxLabel;
    Label1: TLabel;
    RxDBGrid1: TRxDBGrid;
    RxDBGrid2: TRxDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Edit1: TEdit;
    BitBtn4: TBitBtn;
    dsblAdoTICKET_ITEM: TDataSource;
    dsADOQryTicket: TDataSource;
    SkinData1: TSkinData;
    qryClientes: TIBQuery;
    qryClientesCODIGO_CTE: TIntegerField;
    qryClientesNOMBRE_CTE: TIBStringField;
    qryClientesNOMBRE_FACTURAR: TIBStringField;
    qryClientesCONTACTO: TIBStringField;
    qryEmpleado: TIBQuery;
    qryEmpleadoCODIGO: TIntegerField;
    qryEmpleadoNOMBRE: TIBStringField;
    qryEmpleadoAPELLIDO: TIBStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDatosVenta: TfrmDatosVenta;

implementation

uses UDatModConectar, UDatModFastFood;

{$R *.dfm}

end.
