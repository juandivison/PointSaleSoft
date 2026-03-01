unit UProcesarPedidos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UProcesarDespacho, DB, RxCalc, RxMemDS, Menus, ImgList, DBActns,
  ActnList, DBCtrls, StdCtrls, ToolEdit, RXDBCtrl, RxLookup, ExtCtrls,
  RXCtrls, Buttons, Grids, DBGrids, Mask, WinSkinData;

type
  TfrmRegistrarPedidos = class(TfrmProcesarDespachoVendedores)
    DBEdit3: TDBEdit;
    Label4: TLabel;
    SkinData2: TSkinData;
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure ImprimirRecibo1Click(Sender: TObject);
  private
    { Private declarations }
    procedure ActualizaInventario(tipotrn:Smallint);
  public
    { Public declarations }
  end;

var
  frmRegistrarPedidos: TfrmRegistrarPedidos;

implementation

uses UDatModDespacho, UDatModInventario, UGlobal, UBuscaProductoProcPedido,
  UQckReporteFactura, UQckReporteFacturaPedido;

{$R *.dfm}

procedure TfrmRegistrarPedidos.ActualizaInventario(tipotrn: Smallint);
begin
  dmDespacho.tblDespachoDet.First;
  While Not dmDespacho.tblDespachoDet.Eof do
  begin
    if dmInventario.tblInventarioProd.Locate('CODIGO', dmDespacho.tblDespachoDetCODIGO_PROD.Value,[]) then
    begin
      dmInventario.tblInventarioProd.Edit;
      dmInventario.tblInventarioProdFECHA_ULTIMA_TRN.Value := ExtraerFecha(Date);
      dmInventario.tblInventarioProd.Post;
      dmInventario.tblInventarioProd.ApplyUpdates;
    end;
    dmDespacho.IBStoredProc1.Params[0].Value:= dmDespacho.tblDespachoDetCODIGO_PROD.Value;
    dmDespacho.IBStoredProc1.Params[1].Value:= dmDespacho.tblDespachoDetCANTIDAD.Value;
    dmDespacho.IBStoredProc1.Params[2].Value:= Tipotrn;
    dmDespacho.IBStoredProc1.Params[3].Value:= 1;//Params 0, codigo texto
    dmDespacho.IBStoredProc1.ExecProc;

    if Not dmDespacho.IBStoredProc1.Transaction.InTransaction then
    dmDespacho.IBStoredProc1.Transaction.StartTransaction;
    try
      dmDespacho.IBStoredProc1.Transaction.CommitRetaining;
    except
    dmDespacho.IBStoredProc1.Transaction.RollbackRetaining;
    end;
    if Not dmInventario.tblInventarioProd.Transaction.InTransaction then
    dmInventario.tblInventarioProd.Transaction.StartTransaction;
    try
      dmInventario.tblInventarioProd.Transaction.CommitRetaining;
    except
    dmInventario.tblInventarioProd.Transaction.RollbackRetaining;
    end;
    dmDespacho.tblDespachoDet.Next;
  end;
end;

procedure TfrmRegistrarPedidos.BitBtn7Click(Sender: TObject);
begin
  inherited;
  dmDespacho.tblDespachoMasterTIPO_TRN.Value:=1;//Entrada Pedido
end;

procedure TfrmRegistrarPedidos.BitBtn4Click(Sender: TObject);
begin
  //Inherited;
  if (dmDespacho.tblDespachoMaster.State = dsBrowse) And
     (dmDespacho.tblDespachoMasterSTATUS.Value = 'A') then
  begin
    if dmdespacho.tblDespachoMasterTIPO_TRN.IsNull then
    begin
      dmdespacho.tblDespachoMaster.Edit;
      dmdespacho.tblDespachoMasterTIPO_TRN.Value:=1;
      Guardar;
    end;
    strTipoVenta:='ENTRADA PEDIDO';
    ActualizaInventario(1);//Entrada
    ImprimirRecibo1Click(Self);
    dmdespacho.tblDespachoMaster.Edit;
    dmDespacho.tblDespachoMasterSTATUS.Value := 'P';
    Guardar;
  end;
end;

procedure TfrmRegistrarPedidos.BitBtn6Click(Sender: TObject);
begin
  //Inherited;
  case varTipousuario of
  0,2:begin
        If messagedlg('Procesar devolución',mtWarning,[mbyes,mbno],0)=mryes then
        begin
          strTipoVenta:='DEVOLUCION';
          ActualizaVentaDevolucion;
          ActualizaInventario(0);//Devolucion
          ImprimirRecibo1Click(Self);
          dmdespacho.tblDespachoMaster.Edit;
          dmDespacho.tblDespachoMasterSTATUS.Value := 'P';
          Guardar;
        end;
      end;
  else messagedlg('Usuario activo no tiene suficientes derechos.'#13'Favor llamar al supervisor.',mtError,[mbOk],0);
  end;
end;

procedure TfrmRegistrarPedidos.BitBtn14Click(Sender: TObject);
begin
  //inherited;
  frmBuscarProdProcPed:=TfrmBuscarProdProcPed.create(nil);
  try
    frmBuscarProdProcPed.showmodal;
    //SumarDetalle;
  finally
  frmBuscarProdProcPed.free;
  frmBuscarProdProcPed:=Nil;
  end;
end;

procedure TfrmRegistrarPedidos.ImprimirRecibo1Click(Sender: TObject);
begin
  //inherited;
  dmDespacho.tblDespachoMaster.DisableControls;
  dmDespacho.tblDespachoDet.DisableControls;
  if dmDespacho.tblDespachoMasterTIPO_TRN.Value = 1 then
  begin
  qckFacturaPedido:=TqckFacturaPedido.Create(nil);
  try
    qckFacturaPedido.Prepare;
    qckFacturaPedido.qrtipoVenta.caption:= strTipoVenta;
    qckFacturaPedido.QRLabel1.Caption   := 'Factura #';
    qckFacturaPedido.QRDBText5.Enabled  := False;
    qckFacturaPedido.QRDBText11.Enabled := True;
    qckFacturaPedido.TPag.Caption       := IntToStr(qckFacturaPedido.PageNumber);
    if MessageDlg('Imprimir factura?', mtinformation,[mbYes,mbNo],0)=mrYes then
    begin
      qckFacturaPedido.PrinterSetup;
      qckFacturaPedido.Print;
    end else
    qckFacturaPedido.Preview;
  finally
  qckFacturaPedido.Free;
  qckFacturaPedido:=Nil;
  end;
  end else
  begin
  qckFactura:=TqckFactura.Create(nil);
  try
    qckFactura.Prepare;
    qckFactura.qrtipoVenta.caption:=strTipoVenta;
    qckFactura.QRLabel1.Caption   :='Factura #';
    qckFactura.QRDBText5.Enabled  :=False;
    qckFactura.QRDBText11.Enabled :=True;
    qckFactura.TPag.Caption:=IntToStr(qckFactura.PageNumber);
    if MessageDlg('Imprimir factura?',mtinformation,[mbyes,mbno],0)=mryes then
    begin
      qckFactura.PrinterSetup;
      qckFactura.Print;
    end else
    qckFactura.Preview;
  finally
  qckFactura.free;
  qckFactura:=nil;
  end;
  end;
  dmDespacho.tblDespachoMaster.EnableControls;
  dmDespacho.tblDespachoDet.EnableControls;
end;

end.
