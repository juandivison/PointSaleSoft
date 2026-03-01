unit UFormDetalleAdicionalVta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WinSkinData, Grids, DBGrids, RxDBCtrl, RxLookup, StdCtrls,
  QRPrntr,Buttons, DB, Mask, DBCtrls, IBCustomDataSet, IBQuery, ComCtrls,
  RxCtrls, ExtCtrls;
type
  TfrmDatosAdicConduce = class(TForm)
    Label9: TLabel;
    DBStatusLabel1: TDBStatusLabel;
    DBText1: TDBText;
    Label7: TLabel;
    Label8: TLabel;
    DBText2: TDBText;
    Label10: TLabel;
    DBText3: TDBText;
    Label11: TLabel;
    Label12: TLabel;
    DBEdit9: TDBEdit;
    BitBtn6: TBitBtn;
    RxDBGrid1: TRxDBGrid;
    DBEdit7: TDBEdit;
    RxDBLookupCombo5: TRxDBLookupCombo;
    DataSource1: TDataSource;
    SkinData1: TSkinData;
    qryEmpD: TIBQuery;
    qryEmpCodV: TIBQuery;
    qryCodChofer: TIBQuery;
    qryClientes: TIBQuery;
    dsqryEmpD: TDataSource;
    dsqryEmpCodV: TDataSource;
    dsqryCodChofer: TDataSource;
    dsqryClientes: TDataSource;
    qryVehiculos: TIBQuery;
    qryVehiculosFICHA: TIntegerField;
    qryVehiculosPLACA: TIBStringField;
    dsqryVehiculos: TDataSource;
    Shape1: TShape;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDatosAdicConduce: TfrmDatosAdicConduce;

implementation
  uses UDatosVentas, UGlobal, UQckRepOrdenAlmacen, UDatModConectar,
  UDatmodDatosGenerales, frmImprimirDoc, UQckRepOrdenAlmacenPOS,
  UDatModFactura, UProcVentaRapida;
{$R *.dfm}

procedure TfrmDatosAdicConduce.BitBtn2Click(Sender: TObject);
begin
  dmventas.tblDatosConduce.Edit;
end;

procedure TfrmDatosAdicConduce.BitBtn3Click(Sender: TObject);
begin
  if dmventas.tblDatosConduce.State in [dsEdit, dsInsert] then
  dmventas.tblDatosConduce.Cancel;
end;

procedure TfrmDatosAdicConduce.FormCreate(Sender: TObject);
 begin
    qryVehiculos.close;
    qryVehiculos.Open;


  qryEmpD.CLOSE;
  qryEmpD.OPEN;
  qryEmpCodV.CLOSE;
  qryEmpCodV.Open;
  qryCodChofer.Close;
  qryCodChofer.Open;
  qryClientes.Close;
  qryClientes.Open;
  
end;

procedure TfrmDatosAdicConduce.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if frmProcVentaRapida.rxVenta.State = dsEdit then
  frmProcVentaRapida.rxVenta.Post;
end;

procedure TfrmDatosAdicConduce.BitBtn9Click(Sender: TObject);
begin
frmProcVentaRapida.rxVenta.first;
end;

procedure TfrmDatosAdicConduce.BitBtn10Click(Sender: TObject);
begin
frmProcVentaRapida.rxVenta.prior;
end;

procedure TfrmDatosAdicConduce.BitBtn11Click(Sender: TObject);
begin
frmProcVentaRapida.rxVenta.next;
end;

procedure TfrmDatosAdicConduce.BitBtn12Click(Sender: TObject);
begin
  frmProcVentaRapida.rxVenta.last;
end;

end.
