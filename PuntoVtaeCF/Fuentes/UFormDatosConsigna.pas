unit UFormDatosConsigna;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, RXDBCtrl, StdCtrls, Buttons, DBCtrls, EditNew,
  ComCtrls, WinSkinData, DB, IBCustomDataSet, IBQuery;

type
  TfrmConsultaConsignaciones = class(TForm)
    RxDBGrid1: TRxDBGrid;
    RxDBGrid2: TRxDBGrid;
    DateTimePicker1: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    EditN1: TEditN;
    DBText1: TDBText;
    Label3: TLabel;
    DBText2: TDBText;
    Label4: TLabel;
    BitBtn1: TBitBtn;
    CheckBox1: TCheckBox;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    cboxClientes: TComboBox;
    Label5: TLabel;
    edtCodCte: TEditN;
    Label6: TLabel;
    SkinData1: TSkinData;
    qryEmpleado: TIBQuery;
    qryEmpleadoNOMBREVENDEDOR: TIBStringField;
    qryEmpleadoCODIGO: TIntegerField;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cboxClientesChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaConsignaciones: TfrmConsultaConsignaciones;

implementation
USES UDatModFactura, uglobal, UDatModClientes;
{$R *.dfm}

procedure TfrmConsultaConsignaciones.BitBtn1Click(Sender: TObject);
begin
  dmFactura.qryVentaFacturaConsigna.Close;
  dmFactura.qryVentaFacturaConsigna.SQL.Text:=dmFactura.qryVentaFactura_csg0.SQL.Text+
  ' Where VENTAS_MAST_CONSIGNA.NUMERO_FACTURA is not null';
  if CheckBox1.Checked then
  begin
    dmFactura.qryVentaFacturaConsigna.Open;
  end else
  if (EditN1.ValueInteger > 0) then
  begin
    if (edtCodCte.Text = '') then
    begin
      dmFactura.qryVentaFacturaConsigna.SQL.Text:=
      dmFactura.qryVentaFactura_csg0.SQL.Text + ' Where VENTAS_MAST_CONSIGNA.NUMERO_FACTURA =:numero '+
      ' And ventas_mast_CONSIGNA.cia_key =:ciakey';
      dmFactura.qryVentaFacturaConsigna.Params[0].AsInteger:= editn1.ValueInteger;
      dmFactura.qryVentaFacturaConsigna.Params[1].AsInteger:= glbCia_Key;
    end else
    begin
      if edtCodCte.ValueInteger > 0 then
      begin
        dmFactura.qryVentaFacturaConsigna.SQL.Text:=
        dmFactura.qryVentaFactura_csg0.SQL.Text + ' Where VENTAS_MAST_CONSIGNA.NUMERO_FACTURA =:numero '+
        ' and VENTAS_MAST_CONSIGNA.Codigo_cte =:codcte  And ventas_mast_CONSIGNA.cia_key =:ciakey';
        dmFactura.qryVentaFacturaConsigna.Params[0].AsInteger := editn1.ValueInteger;
        dmFactura.qryVentaFacturaConsigna.Params[1].AsInteger:= edtCodCte.ValueInteger;
        dmFactura.qryVentaFacturaConsigna.Params[2].AsInteger:= glbCia_Key;
      end else
      begin
        dmFactura.qryVentaFacturaConsigna.SQL.Text:=
        dmFactura.qryVentaFactura_csg0.SQL.Text + ' Where '+
        'VENTAS_MAST_CONSIGNA.Codigo_cte =:codcte '+
        'And ventas_mast_CONSIGNA.cia_key =:ciakey';
        dmFactura.qryVentaFacturaConsigna.Params[0].AsInteger := edtCodCte.ValueInteger;
        dmFactura.qryVentaFacturaConsigna.Params[1].AsInteger := glbCia_Key;
      end;
    end;
    dmFactura.qryVentaFacturaConsigna.Open;
  end else
  if edtCodCte.ValueInteger > 0 then
  begin
    dmFactura.qryVentaFacturaConsigna.SQL.Text:=
    dmFactura.qryVentaFactura_csg0.SQL.Text + ' Where '+
    'VENTAS_MAST_CONSIGNA.NUMERO_FACTURA is not null'+
    ' and VENTAS_MAST_CONSIGNA.Codigo_cte =:codcte '+
    'And ventas_mast_CONSIGNA.cia_key =:ciakey';
    dmFactura.qryVentaFacturaConsigna.Params[0].AsInteger := edtCodCte.ValueInteger;
    dmFactura.qryVentaFacturaConsigna.Params[1].AsInteger := glbCia_Key;
    dmFactura.qryVentaFacturaConsigna.Open;
  end else
  begin
    dmFactura.qryVentaFacturaConsigna.SQL.Text:=
    dmFactura.qryVentaFactura_csg0.SQL.Text + ' Where VENTAS_MAST_CONSIGNA.fecha =:fecha '+
    ' and VENTAS_MAST_CONSIGNA.NUMERO_FACTURA is not null'+
    ' And ventas_mast_CONSIGNA.cia_key =:ciakey';
    dmFactura.qryVentaFacturaConsigna.Params[0].AsDateTime := ExtraerFecha(DateTimePicker1.Date);
    dmFactura.qryVentaFacturaConsigna.Params[1].AsInteger := glbCia_Key;
    dmFactura.qryVentaFacturaConsigna.Open; dmFactura.qryVentaFacturaConsigna.RecordCount
  end;
  {dmFactura.qryDatosTrncxc.Close;  //dmFactura.qryVentaFacturaConsigna.RecordCount;
  dmFactura.qryDatosTrncxc.Params[0].AsInteger:=dmFactura.qryVentaFacturaConsignaNUMERO_FACTURA.Value;
  dmFactura.qryDatosTrncxc.Params[1].AsInteger:=glbCia_Key;
  dmFactura.qryDatosTrncxc.Open;}
end;

procedure TfrmConsultaConsignaciones.FormCreate(Sender: TObject);
begin
  dmclientes.tblClientes.Close;
  dmclientes.tblClientes.Open;
  dmclientes.tblClientes.First;
  While Not dmclientes.tblClientes.Eof do
  begin
    cboxClientes.Items.Add(dmclientes.tblClientesNOMBRE_FACTURAR.Value);
    dmclientes.tblClientes.Next;
  end;
end;

procedure TfrmConsultaConsignaciones.cboxClientesChange(Sender: TObject);
begin
  if dmclientes.tblClientes.Locate('NOMBRE_FACTURAR',cboxClientes.Text,[]) then
  edtCodCte.SetInteger(dmclientes.tblClientesCODIGO_CTE.Value);
end;

end.
