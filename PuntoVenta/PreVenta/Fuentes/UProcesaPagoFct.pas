unit UProcesaPagoFct;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, Mask, Grids, DBGrids,
  db,RXDBCtrl, Buttons, RxToolEdit, RxCurrEdit;

type
  TfrmProcesaPagoFactura = class(TForm)
    RxCalcEdit1: TRxCalcEdit;
    Label4: TLabel;
    RxDBGrid1: TRxDBGrid;
    RxDBGrid2: TRxDBGrid;
    BitBtn1: TBitBtn;
    DBText1: TDBText;
    Label1: TLabel;
    DBText2: TDBText;
    edtNumFactura: TEdit;
    Label2: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure edtNumFacturaExit(Sender: TObject);
  private
    { Private declarations }
    Procedure ActualizaFactura;
  public
    { Public declarations }
  end;

var
  frmProcesaPagoFactura: TfrmProcesaPagoFactura;

implementation

uses UDatModFactura, UDatModIngresos;



{$R *.dfm}

procedure TfrmProcesaPagoFactura.ActualizaFactura;
begin
  if dmfactura.IBDatosFctPago.Locate('numero',edtNumFactura.Text,[]) then
  begin
    dmfactura.IBDatosFctPago.Edit;
    dmfactura.IBDatosFctPagoMONTO_FACT.Value:=dmfactura.IBDatosFctPagoMONTO_FACT.Value - RxCalcEdit1.Value;
    dmfactura.IBDatosFctPago.Post;
    dmfactura.IBDatosFctPago.ApplyUpdates;
  end;
end;

procedure TfrmProcesaPagoFactura.BitBtn1Click(Sender: TObject);
begin
  dmFactura.IBDataSetPagoFct.Insert;
  dmFactura.IBDataSetPagoFctNUMERO_FACTURA.Value:= StrToInt(edtNumFactura.Text);
  dmFactura.IBDataSetPagoFctNUMERO_RECIBO.Value := dmIngresos.tblIngresoMasterNUMERO.AsInteger;
  dmFactura.IBDataSetPagoFctMONTO_PAGADO.Value  := RxCalcEdit1.Value;
  dmFactura.IBDataSetPagoFctSTATUS.Value        := 'A';

  if dmFactura.IBDataSetPagoFct.State in [dsEdit, dsInsert] then
  begin
    dmFactura.IBDataSetPagoFct.Post;
    dmFactura.IBDataSetPagoFct.ApplyUpdates;
    ActualizaFactura;    
    if not dmFactura.IBDataSetPagoFct.Transaction.InTransaction then
    dmFactura.IBDataSetPagoFct.Transaction.StartTransaction;
    try
      dmFactura.IBDataSetPagoFct.Transaction.CommitRetaining;
    except
    dmFactura.IBDataSetPagoFct.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmProcesaPagoFactura.edtNumFacturaExit(Sender: TObject);
begin
  if dmfactura.IBDatosFctPago.Locate('numero',edtNumFactura.Text,[]) then
  begin
    if RxCalcEdit1.Value <= dmfactura.IBDatosFctPagoMONTO_FACT.Value then
    begin
      MessageDlg('Monto pagado es mayor que monto factura, verifique',mtInformation,[mbOk],0);
      RxCalcEdit1.SetFocus;
    end;
  end;
end;

end.
