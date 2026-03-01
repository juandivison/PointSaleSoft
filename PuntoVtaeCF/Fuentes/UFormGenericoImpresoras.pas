unit UFormGenericoImpresoras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  DB, Dialogs, WinSkinData, StdCtrls, Buttons, Grids, DBGrids, RxDBCtrl, Mask,
  Printers, DBCtrls, RxCtrls, RxLookup, RxDBComb, RxMemDS;

type
  TfrmConfImpresoras = class(TForm)
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton1: TSpeedButton;
    DBStatusLabel1: TDBStatusLabel;
    RxDBGrid1: TRxDBGrid;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    SkinData1: TSkinData;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    RxDBComboBox1: TRxDBComboBox;
    RxDBComboBox2: TRxDBComboBox;
    RxDBComboBox3: TRxDBComboBox;
    BitBtn1: TBitBtn;
    rxData: TRxMemoryData;
    rxDataModulo: TIntegerField;
    rxDataidReporte: TIntegerField;
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    procedure InsertaDatos;
  public
    { Public declarations }
  end;

var
  frmConfImpresoras: TfrmConfImpresoras;

implementation

Uses UGlobal,UDatmodDatosGenerales;

{$R *.dfm}

procedure TfrmConfImpresoras.BitBtn10Click(Sender: TObject);
begin
  dmDatos.tblImpresora.prior;
end;

procedure TfrmConfImpresoras.BitBtn11Click(Sender: TObject);
begin
  dmDatos.tblImpresora.next;
end;

procedure TfrmConfImpresoras.BitBtn12Click(Sender: TObject);
begin
  dmDatos.tblImpresora.Last;
end;

procedure TfrmConfImpresoras.BitBtn9Click(Sender: TObject);
begin
  dmDatos.tblImpresora.first;
end;

procedure TfrmConfImpresoras.SpeedButton1Click(Sender: TObject);
begin
  if dmDatos.tblImpresora.State in [dsinsert, dsEdit] then
  begin
    //dmDatos.tblImpresoraIDTIPOVEH.Value:= FsqlMaxNumero('tipo_vehiculo','IDTIPOVEH');
    dmDatos.tblImpresora.Post;
    dmDatos.tblImpresora.ApplyUpdates;
    if not dmDatos.tblImpresora.Transaction.InTransaction then
    dmDatos.tblImpresora.Transaction.StartTransaction;
    try
      dmDatos.tblImpresora.Transaction.CommitRetaining;
    except
    dmDatos.tblImpresora.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmConfImpresoras.SpeedButton2Click(Sender: TObject);
begin
  if dmDatos.tblImpresora.State = dsBrowse then
  begin
    dmDatos.tblImpresora.Insert;
    RxDBComboBox2.SetFocus;
  end;
end;

procedure TfrmConfImpresoras.SpeedButton3Click(Sender: TObject);
begin
  if dmDatos.tblImpresora.State in [dsinsert, dsEdit] then
  begin
    dmDatos.tblImpresora.Cancel;
  end;
end;

procedure TfrmConfImpresoras.FormCreate(Sender: TObject);
begin
  //RxDBComboBox1.Values.Assign(GetNombreImpresoras);
  RxDBComboBox1.Items.Assign(Printer.Printers);
  dmDatos.tblImpresora.Close;
  dmDatos.tblImpresora.Open;
  InsertaDatos;//inicializa datos impresora;
end;

procedure TfrmConfImpresoras.BitBtn1Click(Sender: TObject);
begin
  dmDatos.tblImpresora.Close;
  dmDatos.tblImpresora.Open;
end;

procedure TfrmConfImpresoras.InsertaDatos;
var
  idx : integer;
begin
  idx := 11;
{
1 Orden Entrega Almacen
2 Conduce
3 Factura Punto Venta
4 Factura 8.5 x 11
5 Factura 8.5 x 5.5
6 Recibo Punto Venta
7 Recibo  8.5 x 11
8 Recibo  8.5 x 5.5
9 Cotizacion Punto Venta
10 Cotizacion 8.5 x 11
11 Ticket -agua delta
}
  rxData.Close;
  rxData.Open;
  for idx:=1 to 11 do
  begin
    rxData.Append;
    rxDataModulo.Value:=1;
    rxDataidReporte.Value:=idx;
    rxData.Post;
  end;
  rxData.First;
  RxDBGrid1.DisableScroll;
  while not rxData.Eof do
  begin
    if not dmDatos.tblImpresora.Locate('IDMODULO;IDREPORTE',VarArrayOf([rxDataModulo.Value, rxDataidReporte.Value]),[]) then
    begin
      dmDatos.tblImpresora.Append;
      dmDatos.tblImpresoraIDMODULO.Value:=rxDataModulo.Value;
      dmDatos.tblImpresoraIDREPORTE.Value:=rxDataidReporte.Value;
      GlbSalvarQuery(dmDatos.tblImpresora);
    end;
    rxData.Next;
  end;
  RxDBGrid1.EnableScroll;
end;

end.
