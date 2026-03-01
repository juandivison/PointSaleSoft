unit UFormVentaSumXRuta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, RxToolEdit, RxDBCtrl, DB, IBCustomDataSet,
  IBQuery, Buttons, Grids, DBGrids, WinSkinData;

type
  TfrmVentasSumXRuta = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    ComboBox1: TComboBox;
    Label3: TLabel;
    qryRuta: TIBQuery;
    qryRutaCODIGO: TIntegerField;
    qryRutaDESCRIPCION: TIBStringField;
    qryDatosVta: TIBQuery;
    qryDatosVta_1: TIBQuery;
    qryDatosVta_2: TIBQuery;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    CheckBox1: TCheckBox;
    qryDatosVta_3: TIBQuery;
    CheckBox2: TCheckBox;
    RxDBGrid1: TRxDBGrid;
    DataSource1: TDataSource;
    dbEditFechaIni: TDateEdit;
    dbEditFechaFin: TDateEdit;
    SkinData1: TSkinData;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVentasSumXRuta: TfrmVentasSumXRuta;
  CodigoRuta : Integer;
  
implementation

uses UDatModConectar, UGlobal;

{$R *.dfm}

procedure TfrmVentasSumXRuta.FormCreate(Sender: TObject);
begin
  dbEditFechaIni.Date:=GlbFechaTrnDiaria;
  dbEditFechaFin.Date:=GlbFechaTrnDiaria;
  qryRuta.Close;
  qryRuta.Open;

  qryRuta.First;
  ComboBox1.Clear;
  While Not qryRuta.Eof Do
  begin
    ComboBox1.Items.Add(qryRutaDESCRIPCION.Value);
    qryRuta.Next;
  end;
  ComboBox1.ItemIndex:=0;
  ComboBox1Change(Self);
end;

procedure TfrmVentasSumXRuta.BitBtn1Click(Sender: TObject);
var
   labelCretrioRep : String;
begin
  qryDatosVta.Close;
  qryDatosVta.SQL.Clear;

    if CheckBox1.Checked then     //todas las rutas
    begin
      if CheckBox2.Checked then   //incluye vendedor
      begin
        qryDatosVta.SQL.Text:=
        qryDatosVta_2.SQL.Text + format(' Where r.fecha Between %s and %s',
        [chr(39)+FormatDateTime('mm/dd/yyyy',dbEditFechaIni.Date)+chr(39),
        chr(39)+FormatDateTime('mm/dd/yyyy',dbEditFechaFin.Date)+chr(39)]);
        labelCretrioRep:= ' Desde Ruta '+ ComboBox1.Text;

        qryDatosVta.sql.Add('Group By r.fecha, r.CODIGO_VENDEDOR, r.NOMBRE_VENDEDOR, r.DESC_RUTA');
        qryDatosVta.sql.Add('Order By r.fecha desc, sum(distinct r.MONTO_BRUTO) desc');
      end else
      begin
        qryDatosVta.SQL.Text:=
        qryDatosVta_3.SQL.Text + format(' Where r.fecha Between %s and %s and r.ruta = %d',
        [chr(39)+FormatDateTime('mm/dd/yyyy',dbEditFechaIni.Date)+chr(39),
        chr(39)+FormatDateTime('mm/dd/yyyy',dbEditFechaFin.Date)+chr(39),CodigoRuta]);
        labelCretrioRep:= ' Desde '+ FormatDateTime('mm/dd/yyyy',dbEditFechaIni.Date) + ' ' +
        ' Hasta '+FormatDateTime('mm/dd/yyyy',dbEditFechaFin.Date);

        qryDatosVta.sql.Add('Group By r.fecha, r.DESC_RUTA');
        qryDatosVta.sql.Add('Order By r.fecha desc, sum(distinct r.MONTO_BRUTO) desc');
      end;
    end else
    begin
      qryDatosVta.SQL.Text:=
      qryDatosVta_2.SQL.Text + format(' Where r.fecha Between %s and %s and r.ruta = %d',
      [chr(39)+FormatDateTime('mm/dd/yyyy',dbEditFechaIni.Date)+chr(39),
      chr(39)+FormatDateTime('mm/dd/yyyy',  dbEditFechaFin.Date)+chr(39),
      CodigoRuta]);
      labelCretrioRep:= ' Desde '+ FormatDateTime('mm/dd/yyyy',dbEditFechaIni.Date) + ' ' +
      ' Hasta '+FormatDateTime('mm/dd/yyyy',dbEditFechaFin.Date);

      qryDatosVta.sql.Add('Group By r.FECHA, r.DESC_RUTA, r.CODIGO_VENDEDOR, r.NOMBRE_VENDEDOR');
      qryDatosVta.sql.Add('Order By  r.fecha desc,r.CODIGO_VENDEDOR');
    end;

  qryDatosVta.Open;
end;

procedure TfrmVentasSumXRuta.ComboBox1Change(Sender: TObject);
begin
  if qryruta.Locate('DESCRIPCION',ComboBox1.Text,[]) THEN
  CodigoRuta:=qryRutaCODIGO.Value;
end;

end.
