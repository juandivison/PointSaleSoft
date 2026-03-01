unit UBuscarProveedores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, EditNew, DB, Grids, DBGrids, RXDBCtrl,
  Buttons, WinSkinData;

type
  TfrmProcBuscarProv = class(TForm)
    RxDBGrid1: TRxDBGrid;
    dsqryProveCxp: TDataSource;
    EditN1: TEditN;
    Label1: TLabel;
    RadioGroup1: TRadioGroup;
    Button1: TButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    SkinData1: TSkinData;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure EditN1Change(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure RxDBGrid1Exit(Sender: TObject);
    procedure RxDBGrid1CellClick(Column: TColumn);

  private
      procedure ProcbuscarCodigo(parcial:boolean);
      procedure ProcbuscarNombre(parcial:boolean);
  public
    xCodigoCte : Integer;
  end;

var
  frmProcBuscarProv: TfrmProcBuscarProv;

implementation

uses UDatModProveedor;

{$R *.dfm}

procedure TfrmProcBuscarProv.FormCreate(Sender: TObject);
begin
  dmproveedor.qryProveCxp.Close;
  dmproveedor.qryProveCxp.Open;
end;

procedure TfrmProcBuscarProv.Button1Click(Sender: TObject);
begin
  if RadioGroup1.ItemIndex = 0 then
  ProcbuscarCodigo(false) else
  ProcbuscarNombre(false);
end;

procedure TfrmProcBuscarProv.ProcbuscarCodigo(parcial:boolean);
begin
  if parcial then
  begin
    dmproveedor.qryProveCxp.Locate('codigo_PROV',EditN1.ValueInteger,[loCaseInsensitive,loPartialKey]);
  end else
  begin
    if not dmproveedor.qryProveCxp.Locate('codigo_PROV',EditN1.ValueInteger,[]) then
    MessageDlg('Codigo proveedor no encontrado',mtInformation, [mbOK], 0);
  end;
end;

procedure TfrmProcBuscarProv.ProcbuscarNombre(parcial:boolean);
begin
  if parcial then
  begin
    dmproveedor.qryProveCxp.Locate('Descripcion', EditN1.Text,[loCaseInsensitive, loPartialKey]);
  end else
  begin
    if not dmproveedor.qryProveCxp.Locate('Descripcion',EditN1.Text,[]) then
    MessageDlg('Nombre proveedor no encontrado', mtInformation, [mbOK], 0);
  end;
end;

procedure TfrmProcBuscarProv.EditN1Change(Sender: TObject);
begin
  if RadioGroup1.ItemIndex = 0 then
  ProcbuscarCodigo(true) else
  ProcbuscarNombre(true);
end;

procedure TfrmProcBuscarProv.RadioGroup1Click(Sender: TObject);
begin
  if RadioGroup1.ItemIndex = 0 then
  Label1.Caption:='Entre codigo'
  else Label1.Caption:='Entre nombre proveedor';
end;

procedure TfrmProcBuscarProv.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if dmproveedor.qryProveCxpBALANCE_ACT.Value > 0 then
  BackGround := clGreen;
end;

procedure TfrmProcBuscarProv.RxDBGrid1Exit(Sender: TObject);
begin
  xCodigoCte:=dmProveedor.qryProveCxpCODIGO_CTE.Value;
end;

procedure TfrmProcBuscarProv.RxDBGrid1CellClick(Column: TColumn);
begin
  xCodigoCte:=dmProveedor.qryProveCxpCODIGO_CTE.Value;
end;

end.
