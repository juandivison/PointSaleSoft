unit UEditarPedidos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, Mask, rxToolEdit, RXDBCtrl, Grids, DBGrids,
  Buttons, RxLookup, RXCtrls, Menus;

type
  TfrmEditarPedido = class(TForm)
    RxDBGrid1: TRxDBGrid;
    Label1: TLabel;
    DBDateEdit1: TDBDateEdit;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label20: TLabel;
    RxDBLookupCombo3: TRxDBLookupCombo;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    PopupMenu1: TPopupMenu;
    PorFecha1: TMenuItem;
    Proveedor1: TMenuItem;
    Conduce1: TMenuItem;
    NumeroOrden1: TMenuItem;
    FormaPago1: TMenuItem;
    RxSpeedButton1: TRxSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure PorFecha1Click(Sender: TObject);
    procedure Proveedor1Click(Sender: TObject);
    procedure Conduce1Click(Sender: TObject);
    procedure NumeroOrden1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEditarPedido: TfrmEditarPedido;

implementation

uses UDatModDespacho, uglobal, UDatModInventario, UDatModProveedor, UFormSelFecha;

{$R *.dfm}

procedure TfrmEditarPedido.FormCreate(Sender: TObject);
begin
  dmInventario.qryProveedores.close;
  dmInventario.qryProveedores.Filtered:=False;
  dmInventario.qryProveedores.Tag:=glbCia_Key;
  //dmInventario.qryProveedores.Filtered:=True;
  //dmInventario.qryProveedores.Params[0].Value:=glbCia_Key;
  dmInventario.qryProveedores.open;
  dmInventario.qryProveedores.close;
  dmInventario.qryProveedores.Filtered:=False;
  dmInventario.qryProveedores.Tag:=glbCia_Key;
  //dmInventario.qryProveedores.Filtered:=True;
  dmInventario.qryProveedores.open;
end;

procedure TfrmEditarPedido.PorFecha1Click(Sender: TObject);
begin
    //fecha : TDateTime;
    //codProv : integer;
    //fpago : Integer;
    //numConduce : Integer;
    //numOrden : Integer;
    dmDespacho.filtrafecha:=false;
    frmSelFecha:=TfrmSelFecha.create(nil);
    if frmSelFecha.Showmodal = mrok then
    begin
       dmdespacho.fecha:= ExtraerFecha(frmselfecha.FechaFin.Date);
       dmdespacho.tblEditarDespachoMaster.Filtered:=true;
    end;
end;

procedure TfrmEditarPedido.Proveedor1Click(Sender: TObject);
begin
    //fecha : TDateTime;
    //codProv : integer;
    //fpago : Integer;
    //numConduce : Integer;
    //numOrden : Integer;
    dmDespacho.filtracodProv:=false;
    dmdespacho.codProv:=-1;
    dmdespacho.codProv:=
    StrToInt(InputBox('Filtrar por proveedor','Entre codigo proveedor',''));
    if dmdespacho.codProv >=0 then
    dmdespacho.tblEditarDespachoMaster.Filtered:=true;
end;

procedure TfrmEditarPedido.Conduce1Click(Sender: TObject);
begin
    dmDespacho.filtranumConduce:=true;
    dmdespacho.numConduce:=-1;
    dmdespacho.numConduce:=
    StrToInt(InputBox('Filtrar por num conduce','Entre num conduce',''));
    if (dmdespacho.numConduce >= 0) then
    dmdespacho.tblEditarDespachoMaster.Filtered:=true;
end;

procedure TfrmEditarPedido.NumeroOrden1Click(Sender: TObject);
begin
    dmDespacho.filtranumOrden:=true;
    dmdespacho.numOrden:=-1;
    dmdespacho.numOrden:=
    StrToInt(InputBox('Filtrar por # orden','Entre numero orden',''));
    if (dmdespacho.numOrden >= 0) then
    dmdespacho.tblEditarDespachoMaster.Filtered:=true;
end;

procedure TfrmEditarPedido.BitBtn5Click(Sender: TObject);
begin
  dmdespacho.tblEditarDespachoMaster.Close;
  dmdespacho.tblEditarDespachoMaster.Open;
end;

end.
