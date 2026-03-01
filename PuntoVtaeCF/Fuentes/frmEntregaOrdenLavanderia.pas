// frmEntregaOrdenLavanderia.pas
unit frmEntregaOrdenLavanderia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DBCtrls, DBGrids, Grids, DB, Buttons, Mask,
  ComCtrls, IBCustomDataSet, IBQuery, RxDBCtrl, WinSkinData;

type
  TfrmEntregarOrdenLavanderia = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    pnlTop: TPanel;
    lblBuscarOrden: TLabel;
    edtBuscarOrden: TEdit;
    btnBuscar: TButton;
    pnlOrden: TPanel;
    lblCliente: TLabel;
    lblEstado: TLabel;
    lblTotal: TLabel;
    lblSaldo: TLabel;
    edtCliente: TEdit;
    edtEstado: TEdit;
    edtTotal: TEdit;
    edtSaldo: TEdit;
    pnlPrendas: TPanel;
    lblPrendas: TLabel;
    dbgPrendas: TDBGrid;
    pnlEntrega: TPanel;
    lblCantidadEntregada: TLabel;
    lblFechaEntrega: TLabel;
    edtCantidadEntregada: TEdit;
    dtpFechaEntrega: TDateTimePicker;
    btnMarcarEntregadas: TButton;
    pnlPago: TPanel;
    lblPago: TLabel;
    lblMetodoPago: TLabel;
    lblObservaciones: TLabel;
    edtMontoPago: TEdit;
    cmbMetodoPago: TComboBox;
    memObservaciones: TMemo;
    btnGuardar: TBitBtn;
    btnCerrar: TBitBtn;
    dsOrden: TDataSource;
    dsPrendas: TDataSource;
    dbgPagos: TRxDBGrid;
    dsPagos: TDataSource;
    SkinData1: TSkinData;
    procedure FormCreate(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure btnGuardarClick(Sender: TObject);
    procedure btnMarcarEntregadasClick(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
  private
    FIDOrdenActual: Integer;
    procedure CargarOrden(IDOrden: Integer);
    procedure GuardarEntregaYPago;
    procedure ImprimirReciboPago(IDOrden: Integer);
  public
    { Public declarations }
  end;

var
  frmEntregarOrdenLavanderia: TfrmEntregarOrdenLavanderia;

implementation

uses UDatModConectar, UDatModLavanderia, qrReciboPagoLavanderia;

{$R *.dfm}

procedure TfrmEntregarOrdenLavanderia.FormCreate(Sender: TObject);
begin
  dtpFechaEntrega.Date := Date;
  cmbMetodoPago.Items.Add('Efectivo');
  cmbMetodoPago.Items.Add('Tarjeta');
  cmbMetodoPago.Items.Add('Transferencia');
  cmbMetodoPago.Items.Add('Otro');
end;

procedure TfrmEntregarOrdenLavanderia.btnBuscarClick(Sender: TObject);
begin
  if TryStrToInt(edtBuscarOrden.Text, FIDOrdenActual) then
    CargarOrden(FIDOrdenActual)
  else
    ShowMessage('Ingrese un ID de orden v'#225'lido.');
end;

procedure TfrmEntregarOrdenLavanderia.CargarOrden(IDOrden: Integer);
begin
  with dmLavanderia do
  begin
    qryOrdenEntrega.Close;
    qryOrdenEntrega.ParamByName('ID_ORDEN').AsInteger := IDOrden;
    qryOrdenEntrega.Open;

    qryPrendasEntrega.Close;
    qryPrendasEntrega.ParamByName('ID_ORDEN').AsInteger := IDOrden;
    qryPrendasEntrega.Open;

    if not qryOrdenEntrega.IsEmpty then
    begin
      edtCliente.Text := qryOrdenEntrega.FieldByName('NOMBRE_CLIENTE').AsString;
      edtEstado.Text := qryOrdenEntrega.FieldByName('ESTADO').AsString;
      edtTotal.Text := qryOrdenEntrega.FieldByName('TOTAL').AsString;
      edtSaldo.Text := qryOrdenEntrega.FieldByName('SALDO').AsString;
    end
    else
      ShowMessage('Orden no encontrada.');
  end;
end;

procedure TfrmEntregarOrdenLavanderia.btnMarcarEntregadasClick(Sender: TObject);
begin
  if not dmLavanderia.qryPrendasEntrega.IsEmpty then
  begin
    dmLavanderia.qryPrendasEntrega.Edit;
    dmLavanderia.qryPrendasEntrega.FieldByName('CANTIDAD_ENTREGADA').AsFloat :=
      StrToFloatDef(edtCantidadEntregada.Text, 0);
    dmLavanderia.qryPrendasEntrega.FieldByName('FECHA_ENTREGA').AsDateTime := dtpFechaEntrega.Date;
    dmLavanderia.qryPrendasEntrega.Post;
  end;
end;

procedure TfrmEntregarOrdenLavanderia.btnGuardarClick(Sender: TObject);
begin
  GuardarEntregaYPago;
end;

procedure TfrmEntregarOrdenLavanderia.GuardarEntregaYPago;
var
  monto: Double;
begin
  monto := StrToFloatDef(edtMontoPago.Text, 0);
  if monto <= 0 then
  begin
    ShowMessage('Ingrese un monto de pago v'#225'lido.');
    Exit;
  end;

  with dmLavanderia do
  begin
    if not qryOrdenEntrega.IsEmpty then
    begin
      tblLAV_PAGO.Append;
      tblLAV_PAGO.FieldByName('ID_ORDEN').AsInteger := FIDOrdenActual;
      tblLAV_PAGO.FieldByName('FECHA_PAGO').AsDateTime := Now;
      tblLAV_PAGO.FieldByName('MONTO').AsFloat := monto;
      tblLAV_PAGO.FieldByName('METODO_PAGO').AsString := cmbMetodoPago.Text;
      tblLAV_PAGO.FieldByName('OBSERVACIONES').AsString := memObservaciones.Text;
      tblLAV_PAGO.Post;

      qryOrdenEntrega.Edit;
      qryOrdenEntrega.FieldByName('SALDO').AsFloat :=
        qryOrdenEntrega.FieldByName('SALDO').AsFloat - monto;

      if qryOrdenEntrega.FieldByName('SALDO').AsFloat <= 0 then
        qryOrdenEntrega.FieldByName('ESTADO').AsString := 'ENTREGADA'
      else
        qryOrdenEntrega.FieldByName('ESTADO').AsString := 'PARCIAL';

      qryOrdenEntrega.Post;

      ShowMessage('Entrega y pago registrados.');
      ImprimirReciboPago(FIDOrdenActual);
    end;
  end;
end;

procedure TfrmEntregarOrdenLavanderia.btnCerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmEntregarOrdenLavanderia.ImprimirReciboPago(IDOrden: Integer);
begin
  Application.CreateForm(TqckrReciboPagoLavanderia, qckrReciboPagoLavanderia);
  qckrReciboPagoLavanderia.PrepararReporte(IDOrden);
  qckrReciboPagoLavanderia.Preview;
end;


end.
