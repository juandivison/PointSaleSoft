unit UFormConsultaRegPedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GetAnyDate, WinSkinData, DB, IBCustomDataSet, IBQuery, Grids,
  DBGrids, RxDBCtrl, StdCtrls, ExtCtrls, ComCtrls, Buttons;

type
  TfrmConsultaRegPedido = class(TForm)
    BitBtn14: TBitBtn;
    CheckBox2: TCheckBox;
    dtpkFechaIni: TDateTimePicker;
    dtpkFechaFin: TDateTimePicker;
    Label24: TLabel;
    Label25: TLabel;
    RadioGroup1: TRadioGroup;
    BitBtn15: TBitBtn;
    ComboBox1: TComboBox;
    Label26: TLabel;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    RxDBGrid3: TRxDBGrid;
    qryDatosConsulta: TIBQuery;
    qryDatosConsultaNUMERO_TRN: TIntegerField;
    qryDatosConsultaSERIE_TRN: TIntegerField;
    qryDatosConsultaCODIGO_PROD: TIntegerField;
    qryDatosConsultaCODIGO_TEXTO: TIBStringField;
    qryDatosConsultaCODIGO_BARRA: TIBStringField;
    qryDatosConsultaCODIGO_PROV: TIntegerField;
    qryDatosConsultaDESC_PROVEEDOR: TIBStringField;
    qryDatosConsultaRNC_PROVEEDOR: TIBStringField;
    qryDatosConsultaFECHA: TDateTimeField;
    qryDatosConsultaINVENTARIO_ID: TIntegerField;
    qryDatosConsultaFORMADEPAGO: TIBStringField;
    qryDatosConsultaTIPOPAGO: TSmallintField;
    qryDatosConsultaNUMERO_FACTURA: TIntegerField;
    qryDatosConsultaNCF: TIBStringField;
    qryDatosConsultaMONTO_TOTAL: TFloatField;
    qryDatosConsultaDESCTIPOTRN: TIBStringField;
    qryDatosConsultaTIPO_TRN: TSmallintField;
    qryDatosConsultaDESCRIPCION: TIBStringField;
    qryDatosConsultaDESCTIPOUNIDAD: TIBStringField;
    qryDatosConsultaLOTE_NUM: TIBStringField;
    qryDatosConsultaFECHA_VENCEPROD: TDateTimeField;
    qryDatosConsultaCANT_UNIDADES: TFloatField;
    qryDatosConsultaCANTIDAD: TFloatField;
    qryDatosConsultaCANT_OFERTA: TIntegerField;
    qryDatosConsultaPRECIO_COMPRA: TFloatField;
    qryDatosConsultaVALOR_BRUTO: TFloatField;
    qryDatosConsultaVALOR_TOTAL_DET: TFloatField;
    qryDatosConsultaITBI_DET: TFloatField;
    qryDatosConsultaSTATUS_DET: TIBStringField;
    dsqryDatosConsulta: TDataSource;
    SkinData1: TSkinData;
    qryDatosConsulta_Base: TIBQuery;
    lblFiltrarPor: TLabel;
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RxDBGrid3CellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaRegPedido: TfrmConsultaRegPedido;
  edtCodProv : string;
  xcondicion,nombFieldCol : string;  

implementation

uses UConsultaInventario, UDatModReportes, UGlobal;

{$R *.dfm}

procedure TfrmConsultaRegPedido.BitBtn14Click(Sender: TObject);
begin
  frmConsultaInventario:=TfrmConsultaInventario.Create(Nil);
  try
    if frmConsultaInventario.Showmodal = mrOk then
    begin
      qryDatosConsulta.close;
      qryDatosConsulta.open;
      qryDatosConsulta.Filtered:=false;
      if qryDatosConsulta.RecordCount > 0 then
      begin
       xcondicion:='CodProd'+frmConsultaInventario.ibquery1codigo.AsString;
       qryDatosConsulta.SQL.Clear;
       qryDatosConsulta.SQL.Text:= qryDatosConsulta_Base.SQL.Text;
       qryDatosConsulta.Sql.Add(' Where CODIGO_PROD = '+frmConsultaInventario.ibquery1codigo.AsString);
       CheckBox2.Checked:= True;
      end;
    end;
  finally
  frmConsultaInventario.Free;
  frmConsultaInventario:=Nil;
  end;
end;

procedure TfrmConsultaRegPedido.BitBtn15Click(Sender: TObject);
begin
  qryDatosConsulta.DisableControls;
  qryDatosConsulta.close;
  qryDatosConsulta.Filtered:=False;
  CheckBox2.Checked:=False;

  case RadioGroup1.ItemIndex of
  0: begin
       qryDatosConsulta.SQL.Clear;
       qryDatosConsulta.SQL.Text:= qryDatosConsulta_Base.SQL.Text;
       qryDatosConsulta.SQL.Add(Format(' where fecha between %s and %s',
       [chr(39)+FormatDateTime('mm/dd/yyyy',dtpkFechaIni.DateTime)+chr(39),
       chr(39)+FormatDateTime('mm/dd/yyyy',dtpkFechaFin.DateTime)+chr(39)]));
       xcondicion:='_'+FormatDateTime('ddmmmyyyy',dtpkFechaIni.DateTime)+'_'+
       FormatDateTime('ddmmmyyyy',dtpkFechaIni.DateTime)
     end;
  1: begin
       ComboBox1Change(Self);
       qryDatosConsulta.SQL.Clear;
       qryDatosConsulta.SQL.Text:= qryDatosConsulta_Base.SQL.Text;
       qryDatosConsulta.SQL.Add(Format(' where codigo_prov =  %s',[edtCodProv]));
       xcondicion:='_'+'Proveedor'+ComboBox1.text;

     end;
  2: begin
       qryDatosConsulta.SQL.Clear;
       qryDatosConsulta.SQL.Text:= qryDatosConsulta_Base.SQL.Text;
       xcondicion:='';
     end;
  end;
  qryDatosConsulta.open;
  qryDatosConsulta.EnableControls;
  qryDatosConsulta.First;
  if CheckBox3.Checked and (qryDatosConsulta.RecordCount > 0) then
  begin
    GLBMostrarArchivo := True;
    GlbEnviaEmail:=True;
    
    ExporToExcel(qryDatosConsulta,GlbRutaInformes+'RelacionDePedidosRegistrados_'+xcondicion+'.xls',false);
  end;
end;

procedure TfrmConsultaRegPedido.ComboBox1Change(Sender: TObject);
begin
  if dmreportes.qryProvInvLook.Locate('DESCRIPCION',ComboBox1.Text,[]) then
  edtCodProv:=dmreportes.qryProvInvLookCODIGO_CTE.AsString;
end;

procedure TfrmConsultaRegPedido.CheckBox2Click(Sender: TObject);
var
  codD : string;
begin
  codD:=qryDatosConsulta.fieldbyname(nombFieldCol).AsSTring;
  if not checkbox2.Checked then
  begin
    checkbox2.Checked:=False;
    checkbox2.Caption:='Filtrar';
    BitBtn15Click(Self);
    lblFiltrarPor.Visible:=False;
  end else
  if (nombFieldCol <> '') then
  begin
    lblFiltrarPor.Visible:=True;
      checkbox2.Caption:='Filtrado';
      qryDatosConsulta.close;
      qryDatosConsulta.Filtered:=false;
      //if qryDatosConsulta.RecordCount > 0 then
      //begin
       xcondicion:='CodProd'+codD;
       qryDatosConsulta.SQL.Clear;
       qryDatosConsulta.SQL.Text:= qryDatosConsulta_Base.SQL.Text;
       qryDatosConsulta.Sql.Add(' Where '+nombFieldCol +' = '+chr(39)+codD+chr(39));
       CheckBox2.Checked:= True;
      qryDatosConsulta.open;
      //end;
  end;
end;

procedure TfrmConsultaRegPedido.FormCreate(Sender: TObject);
begin
  dtpkFechaIni.Date:=date;
  dtpkFechaFin.Date:=date;
  dmreportes.qryProvInvLook.Close;
  dmreportes.qryProvInvLook.Open;
  dmreportes.qryProvInvLook.First;
  ComboBox1.Clear;
  ComboBox1.Text:='';
  While not dmreportes.qryProvInvLook.Eof do
  begin
    ComboBox1.Items.Add(dmreportes.qryProvInvLookDESCRIPCION.Value);
    dmreportes.qryProvInvLook.Next;
  end;
  ComboBox1Change(Self);  
end;

procedure TfrmConsultaRegPedido.RxDBGrid3CellClick(Column: TColumn);
begin
  nombFieldCol:= Column.FieldName;
  lblFiltrarPor.Caption := 'Columna a Filtrar: '+nombFieldCol;
  lblFiltrarPor.Visible:=True;
end;

end.
