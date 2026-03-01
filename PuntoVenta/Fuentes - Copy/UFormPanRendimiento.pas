unit UFormPanRendimiento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RxLookup, StdCtrls, Mask, DBCtrls, Buttons, Grids, DBGrids,
  RXDBCtrl, DB, RXCtrls;

type
  TfrmPanRendimiento = class(TForm)
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label2: TLabel;
    RxDBGrid1: TRxDBGrid;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBStatusLabel1: TDBStatusLabel;
    RxDBLookupCombo2: TRxDBLookupCombo;
    Label6: TLabel;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    BitBtn1: TBitBtn;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    BitBtn29: TBitBtn;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn29Click(Sender: TObject);
  private
    { Private declarations }
    procedure ActualizaInventario;
  public
    { Public declarations }
  end;

var
  frmPanRendimiento: TfrmPanRendimiento;
  StatusProd : String;

implementation

uses UDatModPanaderia, UDatModUsuarios, Uglobal, UDatmodDatosGenerales,
  UPrecioProdXUnidad;

{$R *.dfm}

procedure TfrmPanRendimiento.SpeedButton1Click(Sender: TObject);
begin
  if dmPanaderia.tblPanRendimiento.State in [dsInsert, dsEdit] then
  begin
    if dmPanaderia.tblPanRendimiento.State in [dsInsert] then
    dmPanaderia.tblPanRendimientoID_RENDIMIENTO.Value:= FsqlMaxNumero('PAN_RENDIMIENTO','ID_RENDIMIENTO');

    if (dmPanaderia.tblPanRendimientoID_RENDIMIENTO.Value = 0) Or (dmPanaderia.tblPanRendimientoID_RENDIMIENTO.IsNull) then
    dmPanaderia.tblPanRendimientoID_RENDIMIENTO.Value:=1;

    dmPanaderia.tblPanRendimiento.Post;
    dmPanaderia.tblPanRendimiento.ApplyUpdates;
    if not dmPanaderia.tblPanRendimiento.Transaction.InTransaction then
    dmPanaderia.tblPanRendimiento.Transaction.StartTransaction;
    try
      dmPanaderia.tblPanRendimiento.Transaction.CommitRetaining;
    except
    dmPanaderia.tblPanRendimiento.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmPanRendimiento.SpeedButton2Click(Sender: TObject);
begin
  if dmPanaderia.tblPanRendimiento.State = dsBrowse then
  begin
    dmPanaderia.tblPanRendimiento.Insert;
    dmPanaderia.tblPanRendimientoID_REQUISICION.Value:=dmPanaderia.tblPanReqMateriaPMastID_REQUISICION.Value;
    dmPanaderia.tblPanRendimientoSTATUS.Value  :='A';
    DBEdit1.SetFocus;
  end;
end;

procedure TfrmPanRendimiento.SpeedButton3Click(Sender: TObject);
begin
  if dmPanaderia.tblPanRendimiento.State in [dsinsert, dsEdit] then
  begin
    dmPanaderia.tblPanRendimiento.Cancel;
  end;
end;

procedure TfrmPanRendimiento.SpeedButton7Click(Sender: TObject);
begin
  dmPanaderia.tblPanRendimiento.Close;
  dmPanaderia.tblPanRendimiento.Open;
end;

procedure TfrmPanRendimiento.FormCreate(Sender: TObject);
begin
  dmPanaderia.tblTipoUnidades.Close;
  dmPanaderia.tblTipoUnidades.Open;
  dmPanaderia.qryInventario.Close;
  dmPanaderia.qryInventario.Open;
end;

procedure TfrmPanRendimiento.ActualizaInventario;
begin
  dmPanaderia.stpProcActInvPan.Params[0].Value:= dmPanaderia.tblPanRendimientoCODIGO_PROD.Value;//Codigo_producto
  dmPanaderia.stpProcActInvPan.Params[1].Value:= dmPanaderia.tblPanRendimientoCantidad.Value;  //Nuevacantidad
  dmPanaderia.stpProcActInvPan.Params[2].Value:= dmPanaderia.tblPanRendimientoTipo_Unidad.Value;//rxDataPrecioCompra.Value;//I_precio_compra
  dmPanaderia.stpProcActInvPan.ExecProc;

  if Not dmPanaderia.stpProcActInvPan.Transaction.InTransaction then
  dmPanaderia.stpProcActInvPan.Transaction.StartTransaction;
  try
  dmPanaderia.stpProcActInvPan.Transaction.CommitRetaining;
  except
  dmPanaderia.stpProcActInvPan.Transaction.RollbackRetaining;
  end;
  
  StatusProd:='R';
end;

procedure TfrmPanRendimiento.BitBtn1Click(Sender: TObject);
begin
  if (dmPanaderia.tblPanRendimientoSTATUS.Value = 'A') then
  begin
  StatusProd:='';
  ActualizaInventario;
  if (StatusProd = 'R') then
  begin
    dmPanaderia.tblPanRendimiento.Edit;
    dmPanaderia.tblPanRendimientoSTATUS.Value:='R';
    SpeedButton1Click(Self);
  end;
  end else
  MessageDlg('Inventario fue actualizado, verifique.', mtError,[mbOk],0);
end;

procedure TfrmPanRendimiento.BitBtn29Click(Sender: TObject);
begin
  frmPrecioProdXUnidad:=TfrmPrecioProdXUnidad.Create(Nil);
  try
    frmPrecioProdXUnidad.buscarCodigo(dmPanaderia.tblPanRendimientoCODIGO_PROD.Value);
    frmPrecioProdXUnidad.Showmodal;
  finally
  frmPrecioProdXUnidad.Free;
  frmPrecioProdXUnidad:=Nil;
  end;
end;

end.
