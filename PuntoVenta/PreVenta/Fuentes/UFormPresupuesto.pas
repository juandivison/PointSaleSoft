unit UFormPresupuesto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, StdCtrls, Buttons, Grids, DBGrids,
  RxDBCtrl, RxMemDS, Mask, RxToolEdit, RxCurrEdit, WinSkinData;

type
  TfrmPresupuestoVta = class(TForm)
    qryProductos: TIBQuery;
    qryProductosCODIGO: TIntegerField;
    qryProductosPROVEEDOR: TIBStringField;
    qryProductosDESCRIPCION: TIBStringField;
    qryProductosCANTIDAD: TFloatField;
    qryProductosPRECIO: TFloatField;
    qryProductosCODIGO1: TIntegerField;
    qryProductosLOTE_NUM: TIBStringField;
    qryProductosCODIGO_PROV: TIntegerField;
    qryProductosFECHA: TDateTimeField;
    qryProductosCANT_IN: TIntegerField;
    qryProductosCANT_OUT: TIntegerField;
    qryProductosFECHA_VENCIMIENTO: TDateTimeField;
    qryProductosSERIE_TRN_REGPED: TIntegerField;
    qryProductosCOD_PROV_ANT: TIntegerField;
    edtCodigo: TEdit;
    Label1: TLabel;
    RxDBGrid1: TRxDBGrid;
    BitBtn1: TBitBtn;
    qryInv_base: TIBQuery;
    DataSource1: TDataSource;
    qryProductosPRECIO_MINIMO: TFloatField;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    rxPresupuesto: TRxMemoryData;
    RxDBGrid2: TRxDBGrid;
    DataSource2: TDataSource;
    BitBtn5: TBitBtn;
    rxTotal: TRxMemoryData;
    rxTotalMontoTotal: TCurrencyField;
    RxDBCalcEdit1: TRxDBCalcEdit;
    rxPresupuestocodigo: TIntegerField;
    rxPresupuestoDescripcion: TStringField;
    rxPresupuestoCantidad: TCurrencyField;
    rxPresupuestoPrecio: TCurrencyField;
    rxPresupuestoValor: TCurrencyField;
    dsrxTotal: TDataSource;
    SkinData1: TSkinData;
    BitBtn6: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure edtCodigoChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure rxPresupuestoAfterPost(DataSet: TDataSet);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
    Procedure Totalizar;
  public
    { Public declarations }
  end;

var
  frmPresupuestoVta: TfrmPresupuestoVta;

implementation
  uses UDatModConectar, URepPresupuestoFcia;
{$R *.dfm}

procedure TfrmPresupuestoVta.BitBtn1Click(Sender: TObject);
begin
  qryProductos.Close;
  qryProductos.Sql.Text:=qryInv_base.SQL.Text;
  qryProductos.Sql.Add('Order by i.DESCRIPCION');
  qryProductos.Open;
  qryProductos.First;
end;

procedure TfrmPresupuestoVta.edtCodigoChange(Sender: TObject);
begin
  if (edtCodigo.Text = '') then
  begin
    qryProductos.Close;
    qryProductos.Open;
  end else
  begin
    qryProductos.Close;
    qryProductos.Sql.Text:=qryInv_base.SQL.Text;
    qryProductos.Sql.Add(Format('Where upper(i.Descripcion) like %s',[chr(39)+UpperCase(edtCodigo.Text)+'%'+chr(39)]));
    qryProductos.Sql.Add('Order by i.DESCRIPCION');
    qryProductos.Open;
  end;
end;

procedure TfrmPresupuestoVta.FormCreate(Sender: TObject);
begin
  qryProductos.Close;
  qryProductos.Open;
  qryProductos.First;
  rxPresupuesto.close;
  rxPresupuesto.open;  
end;

procedure TfrmPresupuestoVta.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if qryProductosCANTIDAD.Value <=0 then
  begin
    BackGround := $00BDECE9;
    aFont.Color := clblack;
  end else
  if qryProductosCANTIDAD.Value <=5 then
  begin
    BackGround := clYellow;
    aFont.Color := clblack;
  end;// else
  if (qryProductosPrecio.Value < qryProductosPrecio_Minimo.Value) then
  begin
    BackGround := clRed;
    aFont.Color := clblack;
  end;
  {if (qryVence.State = dsBrowse) then
  begin
    if qryVence.Locate('codigo', qryProductosCodigo.Value,[]) then
    begin
     if (qryVenceDiasVencidos.Value > 0) then
     begin
       BackGround := clPurple;
      aFont.Color := clWhite;
     end;
    end;
  end;}
end;

procedure TfrmPresupuestoVta.BitBtn2Click(Sender: TObject);
begin
  edtCodigo.Text:='';
  BitBtn1Click(Self);
end;

procedure TfrmPresupuestoVta.BitBtn3Click(Sender: TObject);
begin
  rxPresupuesto.Insert;
  rxPresupuestocodigo.Value:=qryProductosCODIGO.Value;
  rxPresupuestoDescripcion.Value:=qryProductosDESCRIPCION.Value;
  rxPresupuestoCantidad.Value:=1.0;
  rxPresupuestoPrecio.Value:=qryProductosPRECIO.Value;
  rxPresupuestoValor.Value:=rxPresupuestoPrecio.Value * rxPresupuestoCantidad.Value;
  rxPresupuesto.Post;
end;

procedure TfrmPresupuestoVta.BitBtn5Click(Sender: TObject);
begin
  rxPresupuesto.close;
  rxPresupuesto.open;
end;

procedure TfrmPresupuestoVta.rxPresupuestoAfterPost(DataSet: TDataSet);
begin
  Totalizar;
end;

procedure TfrmPresupuestoVta.BitBtn4Click(Sender: TObject);
begin
  if rxPresupuesto.Locate('',qryProductosCODIGO.Value,[]) then
  begin
    rxPresupuesto.Delete;
  end else
  rxPresupuesto.Delete;
  totalizar;
end;

procedure TfrmPresupuestoVta.Totalizar;
begin
  rxPresupuesto.First;
  rxTotal.Close;
  rxTotal.Open;
  rxTotal.Insert;
  rxTotalMontoTotal.Value:=0;
  rxTotal.Post;
  
  while not rxPresupuesto.Eof do
  begin
    rxTotal.Edit;
    rxTotalMontoTotal.Value:=rxTotalMontoTotal.Value + rxPresupuestoValor.Value;
    rxTotal.Post;
    rxPresupuesto.Next;
  end;
  rxPresupuesto.Last;
end;

procedure TfrmPresupuestoVta.BitBtn6Click(Sender: TObject);
var
  flag : boolean;
begin
  rxPresupuesto.DisableControls;
  RxDBGrid2.DisableScroll;
  qckPresupuesto:=TqckPresupuesto.Create(nil);
  try
    flag:=true;
    repeat
      qckPresupuesto.Prepare;
                begin

                  if (qckPresupuesto.PageNumber > 1) then
                  begin
                    qckPresupuesto.Page.Length:=qckPresupuesto.Page.Length + 0.26;
                    qckPresupuesto.Prepare;
                    flag:=False;
                  end else break;
                  if (qckPresupuesto.PageNumber = 1) then
                  break;
                end;
                until flag = true;
    qckPresupuesto.Preview;
  finally
  FreeAndNil(qckPresupuesto);
  end;
  rxPresupuesto.EnableControls;
  RxDBGrid2.EnableScroll;
  BitBtn5Click(Self);
end;

procedure TfrmPresupuestoVta.RxDBGrid1DblClick(Sender: TObject);
begin
  BitBtn3Click(Self);
end;

end.
