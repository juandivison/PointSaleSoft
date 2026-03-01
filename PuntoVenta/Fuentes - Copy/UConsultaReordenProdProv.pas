unit UConsultaReordenProdProv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WinSkinData, DB, IBCustomDataSet, IBQuery, Grids, DBGrids,
  RxDBCtrl, StdCtrls, ExtCtrls, ComCtrls, Buttons;

type
  TfrmConsultaReordenInvXProv = class(TForm)
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    lblFiltrarPor: TLabel;
    BitBtn14: TBitBtn;
    CheckBox2: TCheckBox;
    dtpkFechaIni: TDateTimePicker;
    dtpkFechaFin: TDateTimePicker;
    RadioGroup1: TRadioGroup;
    BitBtn15: TBitBtn;
    ComboBox1: TComboBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    RxDBGrid3: TRxDBGrid;
    qryDatosConsulta: TIBQuery;
    dsqryDatosConsulta: TDataSource;
    SkinData1: TSkinData;
    qryDatosConsulta_Base: TIBQuery;
    qryDatosConsultaCODIGO_PROD: TIntegerField;
    qryDatosConsultaCODIGO_TEXTO: TIBStringField;
    qryDatosConsultaCODIGO_BARRA: TIBStringField;
    qryDatosConsultaCODIGO_PROV: TIntegerField;
    qryDatosConsultaDESC_PROVEEDOR: TIBStringField;
    qryDatosConsultaRNC_PROVEEDOR: TIBStringField;
    qryDatosConsultaDESCRIPCION: TIBStringField;
    qryDatosConsultaCANTIDAD: TFloatField;
    qryDatosConsultaCANTIDAD_REORDEN: TIntegerField;
    qryDatosConsultaPRECIO_COMPRA: TFloatField;
    qryDatosConsultaPRECIO_VENTA: TFloatField;
    qryDatosConsultaDESCTIPOUNIDAD: TIBStringField;
    qryDatosConsultaLOTE_NUM: TIBStringField;
    qryDatosConsultaFECHA_VENCEPROD: TDateTimeField;
    edtCodProdTxt: TEdit;
    BitBtn1: TBitBtn;
    Button1: TButton;
    qryDatosConsultaCIA_KEY: TIntegerField;
    Label1: TLabel;
    RadioGroup2: TRadioGroup;
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure RxDBGrid3CellClick(Column: TColumn);
    procedure BitBtn1Click(Sender: TObject);
    procedure edtCodProdTxtChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaReordenInvXProv: TfrmConsultaReordenInvXProv;
  xcondicion, nombFieldCol : string;
  edtCodProd, edtCodProv : integer;

implementation

uses UConsultaInventario, UDatModReportes, UBuscarProveedores,
  UDatModProveedor, UGlobal, UFormEnviarEmail, UDatModCompania;

{$R *.dfm}

procedure TfrmConsultaReordenInvXProv.BitBtn14Click(Sender: TObject);
begin
  frmProcBuscarProv:=TfrmProcBuscarProv.Create(Nil);
  try
    if frmProcBuscarProv.Showmodal = mrOk then
    begin
      //CodCte:=frmProcBuscarProv.xCodigoCte;
      if dmproveedor.qryProveedores.Locate('CODIGO_CTE', frmProcBuscarProv.xCodigoCte,[]) then
      begin
        edtCodProv:=dmproveedor.qryProveedoresCODIGO_CTE.Value;
        ComboBox1.Text:=dmproveedor.qryProveedoresDESCRIPCION.Value;
        ComboBox1Change(Self);
        BitBtn15Click(Self);
      end;
      //strNombreEmpresa:= dmproveedor.qryProveedoresDESCRIPCION.Value;
    end;
  finally
  frmProcBuscarProv.Free;
  frmProcBuscarProv:=Nil;
  end;
  
end;

procedure TfrmConsultaReordenInvXProv.BitBtn15Click(Sender: TObject);
begin
  if RadioGroup1.ItemIndex = 1 then
  begin
    if (edtCodProdTxt.Text = '') then
    begin
      MessageDlg('Indique el codigo del Producto del producto',mtinformation,[mbok],0);
      edtCodProdTxt.SetFocus;
      exit;
    end;
  end;
  if (edtCodProv = -1) then
  begin
    ComboBox1.SetFocus;
    exit;
  end;

  qryDatosConsulta.DisableControls;
  qryDatosConsulta.close;
  qryDatosConsulta.Filtered:=False;
  CheckBox2.Checked:=False;

  case RadioGroup1.ItemIndex of
  {0: begin
       qryDatosConsulta.SQL.Clear;
       qryDatosConsulta.SQL.Text:= qryDatosConsulta_Base.SQL.Text;
       qryDatosConsulta.SQL.Add(Format(' where fecha between %s and %s',
       [chr(39)+FormatDateTime('mm/dd/yyyy',dtpkFechaIni.DateTime)+chr(39),
       chr(39)+FormatDateTime('mm/dd/yyyy',dtpkFechaFin.DateTime)+chr(39)]));
       xcondicion:='_'+FormatDateTime('ddmmmyyyy',dtpkFechaIni.DateTime)+'_'+
       FormatDateTime('ddmmmyyyy',dtpkFechaIni.DateTime)
     end;
  } 0: begin
       nombFieldCol:='codigo_prov';
       ComboBox1Change(Self);
       qryDatosConsulta.SQL.Clear;
       qryDatosConsulta.SQL.Text:= qryDatosConsulta_Base.SQL.Text;
       qryDatosConsulta.SQL.Add(Format(' where codigo_prov =  %s',[IntToStr(edtCodProv)]));
       if RadioGroup2.ItemIndex = 0 then
       begin
         qryDatosConsulta.SQL.Add(' and Cantidad <= CANTIDAD_REORDEN');
       end else
       if RadioGroup2.ItemIndex =1 then
       begin
         qryDatosConsulta.SQL.Add(' and CANTIDAD_REORDEN > 0');
       end;
       xcondicion:='_'+'Proveedor '+ComboBox1.text;
     end;
  1: begin
       nombFieldCol:='CODIGO_PROD';
       qryDatosConsulta.SQL.Clear;
       qryDatosConsulta.SQL.Text:= qryDatosConsulta_Base.SQL.Text;
       qryDatosConsulta.SQL.Add(Format(' where CODIGO_PROD = %s',[edtCodProdTxt.Text]));
       if RadioGroup2.ItemIndex = 0 then
       begin
         qryDatosConsulta.SQL.Add(' and Cantidad <= CANTIDAD_REORDEN');
       end else
       if RadioGroup2.ItemIndex =1 then
       begin
         qryDatosConsulta.SQL.Add(' and CANTIDAD_REORDEN > 0');
       end;

       xcondicion:='_'+'Proveedor '+ComboBox1.text;
     end;
  2: begin
       nombFieldCol:='';
       qryDatosConsulta.SQL.Clear;
       qryDatosConsulta.SQL.Text:= qryDatosConsulta_Base.SQL.Text;
       if RadioGroup2.ItemIndex = 0 then
       begin
         qryDatosConsulta.SQL.Add(' Where Cantidad <= CANTIDAD_REORDEN');
         if RadioGroup1.ItemIndex = 0 then
         begin
           ComboBox1Change(Self);
           qryDatosConsulta.SQL.Add(Format(' and codigo_prov =  %s',[IntToStr(edtCodProv)]));
         end;
       end else
       if RadioGroup2.ItemIndex =1 then
       begin
         qryDatosConsulta.SQL.Add(' Where CANTIDAD_REORDEN > 0');
         if RadioGroup1.ItemIndex = 0 then
         begin
           ComboBox1Change(Self);
           qryDatosConsulta.SQL.Add(Format(' and codigo_prov =  %s',[IntToStr(edtCodProv)]));
         end;
       end;
       xcondicion:='';
     end;
  end;
  qryDatosConsulta.open;
  qryDatosConsulta.EnableControls;
  qryDatosConsulta.First;
end;

procedure TfrmConsultaReordenInvXProv.CheckBox2Click(Sender: TObject);
var
  codD : string;
begin
  if (nombFieldCol = '') then exit;
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

procedure TfrmConsultaReordenInvXProv.ComboBox1Change(Sender: TObject);
begin
  if dmproveedor.qryProveedores.Locate('DESCRIPCION',ComboBox1.Text,[]) then
  edtCodProv:=dmproveedor.qryProveedoresCODIGO_CTE.Value
  else
  edtCodProv:=-1;
  //BitBtn15Click(Self);
end;

procedure TfrmConsultaReordenInvXProv.RxDBGrid3CellClick(Column: TColumn);
begin
  nombFieldCol:= Column.FieldName;
  lblFiltrarPor.Caption := 'Columna a Filtrar: '+nombFieldCol;
  lblFiltrarPor.Visible:=True;
end;

procedure TfrmConsultaReordenInvXProv.BitBtn1Click(Sender: TObject);
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
       qryDatosConsulta.close;      
       xcondicion:='CodProd'+frmConsultaInventario.ibquery1codigo.AsString;
       edtCodProdTxt.Text:= frmConsultaInventario.ibquery1codigo.AsString;
       qryDatosConsulta.SQL.Clear;
       qryDatosConsulta.SQL.Text:= qryDatosConsulta_Base.SQL.Text;
       qryDatosConsulta.Sql.Add(' Where CODIGO_PROD = ' + frmConsultaInventario.ibquery1codigo.AsString);
       qryDatosConsulta.Sql.Add(' and cia_key='+IntToStr(glbCia_Key));
       qryDatosConsulta.open;
       CheckBox2.Checked:= True;
      end;
    end;
  finally
  frmConsultaInventario.Free;
  frmConsultaInventario:=Nil;
  end;
  exit;
  frmConsultaInventario:=TfrmConsultaInventario.Create(Nil);
  try
    if frmConsultaInventario.Showmodal = mrOk then
    begin
      edtCodProdTxt.Text:= frmConsultaInventario.ibquery1codigo.AsString;
    end;
  finally
  frmConsultaInventario.Free;
  frmConsultaInventario:=Nil;
  end;
end;

procedure TfrmConsultaReordenInvXProv.edtCodProdTxtChange(Sender: TObject);
begin
  if qryDatosConsulta.State = dsBrowse then
  qryDatosConsulta.Locate('CODIGO_PROD', edtCodProdTxt.Text, [loCaseInsensitive,loPartialKey]);
end;

procedure TfrmConsultaReordenInvXProv.FormCreate(Sender: TObject);
begin
  dtpkFechaIni.DateTime:=Extraerfecha(GlbFechaTrnDiaria);
  dtpkFechaFin.DateTime:=Extraerfecha(GlbFechaTrnDiaria);
  edtCodProv:=-1;
  dmproveedor.qryProveedores.Close;
  dmproveedor.qryProveedores.params[0].value:=glbCia_Key;
  dmproveedor.qryProveedores.Open;
  dmproveedor.qryProveedores.First;
  ComboBox1.Clear;
  while not dmproveedor.qryProveedores.eof do
  begin
    ComboBox1.Items.Add(dmproveedor.qryProveedoresDESCRIPCION.Value);
    dmproveedor.qryProveedores.next;
  end;
  dmproveedor.qryProveedores.First;
  ComboBox1.Text:=dmproveedor.qryProveedoresDESCRIPCION.Value;
  ComboBox1Change(Self);
end;

procedure TfrmConsultaReordenInvXProv.Button1Click(Sender: TObject);
begin
  if qryDatosConsulta.state = dsInactive then Exit;
  qryDatosConsulta.First;
  if CheckBox3.Checked and (qryDatosConsulta.RecordCount > 0) then
  begin
    GlbIDTipoEmail:= 100;
    GLBMostrarArchivo := True;
    if CheckBox4.Checked then
    GlbEnviaEmail:=True
    else GlbEnviaEmail:=False;
    qryDatosConsulta.First;
    ExporToExcel(qryDatosConsulta,GlbRutaInformes+'\Rel_Prod_EnReorden'+'.xls',false,false);
    if FileExists(glbZipFile) and GlbEnviaEmail then
         begin

           frmEnviarEmail:=TfrmEnviarEmail.Create(Nil);
           try
            GlbIDTipoEmail := 100; //Estandar

           if dmCompania.tblCompania.State = dsInactive then
           dmCompania.tblCompania.Open;
           dmCompania.tblCompania.Locate('codigo',glbCia_Key,[]);
           frmEnviarEmail._cmdminio:= dmCompania.tblCompaniaNOMBRE.Value;// dmReporte.qryReporteIngACCOUNT_NAME.Value;
           frmEnviarEmail.edtDestinatario.Text := dmCompania.tblCompaniaEMAIL.Value;
           frmEnviarEmail.edtTema.Text         := 'Resumen de Ventas por Producto';
           //'_Al'+ FormatDateTime('dd-mmm-yy', ExtraerFecha(Now))+'.pdf';
           frmEnviarEmail.memMensaje.Lines.Clear;
           frmEnviarEmail.memMensaje.Lines.Add('Re-orden inventario');
           frmEnviarEmail.memMensaje.Lines.Add('');
           frmEnviarEmail.memMensaje.Lines.Add('');
           frmEnviarEmail.memMensaje.Lines.Add('');

           frmEnviarEmail.Showmodal;
         finally
         frmEnviarEmail.Free;
         frmEnviarEmail:= Nil;
         end;
    end;
  end;
end;

procedure TfrmConsultaReordenInvXProv.CheckBox4Click(Sender: TObject);
begin
  if CheckBox4.Checked then
  CheckBox3.Checked:=True;
end;

procedure TfrmConsultaReordenInvXProv.RadioGroup2Click(Sender: TObject);
begin
  BitBtn15Click(Self);
end;

end.
