unit UBuscarClientesPersonasP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBCtrls, Grids, DBGrids, ComCtrls, ExtCtrls, StdCtrls,
  Buttons, IBCustomDataSet, IBQuery, WinSkinData, Menus, RXDBCtrl;

type
  TFrmBuscarClientesPersonas = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    ScrollBox1: TScrollBox;
    DBNavigator1: TDBNavigator;
    BitBtn1: TBitBtn;
    Panel3: TPanel;
    RadioGroup1: TRadioGroup;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    DataSource1: TDataSource;
    SkinData1: TSkinData;
    BitBtn2: TBitBtn;
    chkBoxFiltrar: TCheckBox;
    qryClienteStd: TIBQuery;
    Panel4: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    LabelNumHist: TLabel;
    labelNSS: TLabel;
    labelCedula: TLabel;
    LabelNombre: TLabel;
    LabelTelefono: TLabel;
    LabelApodo: TLabel;
    qryPrestamos: TIBQuery;
    dsqryPrestamos: TDataSource;
    IBQuery1: TIBQuery;
    qryPrestamosCODIGO_CTE: TIntegerField;
    qryPrestamosTIPO_CLIENTE: TSmallintField;
    qryPrestamosFOTO: TBlobField;
    qryPrestamosNOMBRE_CTE: TIBStringField;
    qryPrestamosNOMBRE_ABREV: TIBStringField;
    qryPrestamosMONEDA_FACT: TIBStringField;
    qryPrestamosNOMBRE_FACTURAR: TIBStringField;
    qryPrestamosCONTACTO: TIBStringField;
    qryPrestamosDIRECCION_CONT: TIBStringField;
    qryPrestamosTELEF_CONTACTO: TIBStringField;
    qryPrestamosFAX_CONTACTO: TIBStringField;
    qryPrestamosFORMA_PAGO: TSmallintField;
    qryPrestamosCODIGO_AGENCIA: TSmallintField;
    qryPrestamosSTATUS_CLIENTE: TIBStringField;
    qryPrestamosINSERTADO_POR: TIBStringField;
    qryPrestamosFECHA_INSERTADO: TDateTimeField;
    qryPrestamosFECHA_MOD: TDateTimeField;
    qryPrestamosMODI_POR: TIBStringField;
    qryPrestamosLIMITE_CREDITO: TFloatField;
    qryPrestamosEMAIL: TIBStringField;
    qryPrestamosWEBSITE: TIBStringField;
    qryPrestamosPAIS: TIBStringField;
    qryPrestamosCIUDAD: TIBStringField;
    IBQuery1CODIGO_CTE: TIntegerField;
    IBQuery1TIPO_CLIENTE: TSmallintField;
    IBQuery1FOTO: TBlobField;
    IBQuery1NOMBRE_CTE: TIBStringField;
    IBQuery1NOMBRE_ABREV: TIBStringField;
    IBQuery1MONEDA_FACT: TIBStringField;
    IBQuery1NOMBRE_FACTURAR: TIBStringField;
    IBQuery1CONTACTO: TIBStringField;
    IBQuery1DIRECCION_CONT: TIBStringField;
    IBQuery1TELEF_CONTACTO: TIBStringField;
    IBQuery1FAX_CONTACTO: TIBStringField;
    IBQuery1FORMA_PAGO: TSmallintField;
    IBQuery1CODIGO_AGENCIA: TSmallintField;
    IBQuery1STATUS_CLIENTE: TIBStringField;
    IBQuery1INSERTADO_POR: TIBStringField;
    IBQuery1FECHA_INSERTADO: TDateTimeField;
    IBQuery1FECHA_MOD: TDateTimeField;
    IBQuery1MODI_POR: TIBStringField;
    IBQuery1LIMITE_CREDITO: TFloatField;
    IBQuery1EMAIL: TIBStringField;
    IBQuery1WEBSITE: TIBStringField;
    IBQuery1PAIS: TIBStringField;
    IBQuery1CIUDAD: TIBStringField;
    qryClienteStdCODIGO_CTE: TIntegerField;
    qryClienteStdTIPO_CLIENTE: TSmallintField;
    qryClienteStdFOTO: TBlobField;
    qryClienteStdNOMBRE_CTE: TIBStringField;
    qryClienteStdNOMBRE_ABREV: TIBStringField;
    qryClienteStdMONEDA_FACT: TIBStringField;
    qryClienteStdNOMBRE_FACTURAR: TIBStringField;
    qryClienteStdCONTACTO: TIBStringField;
    qryClienteStdDIRECCION_CONT: TIBStringField;
    qryClienteStdTELEF_CONTACTO: TIBStringField;
    qryClienteStdFAX_CONTACTO: TIBStringField;
    qryClienteStdFORMA_PAGO: TSmallintField;
    qryClienteStdCODIGO_AGENCIA: TSmallintField;
    qryClienteStdSTATUS_CLIENTE: TIBStringField;
    qryClienteStdINSERTADO_POR: TIBStringField;
    qryClienteStdFECHA_INSERTADO: TDateTimeField;
    qryClienteStdFECHA_MOD: TDateTimeField;
    qryClienteStdMODI_POR: TIBStringField;
    qryClienteStdLIMITE_CREDITO: TFloatField;
    qryClienteStdEMAIL: TIBStringField;
    qryClienteStdWEBSITE: TIBStringField;
    qryClienteStdPAIS: TIBStringField;
    qryClienteStdCIUDAD: TIBStringField;
    qryClienteStdCEDULA: TIBStringField;
    qryClienteStdRNC: TIBStringField;
    qryClienteStdREFERENCIA: TIBStringField;
    qryClienteStdTELEF_REFERENCIA: TIBStringField;
    qryClienteStdOTRO_TELEFONO: TIBStringField;
    qryClienteStdCANT_DIAS_CREDITO: TSmallintField;
    qryClienteStdTIPO_NCF: TIBStringField;
    qryClienteStdOBSERVACION: TMemoField;
    qryClienteStdLUGAR_DE_TRABAJO: TIBStringField;
    qryClienteStdAPODO: TIBStringField;
    qryClienteStdCODIGO_USUARIO: TIntegerField;
    IBQuery1CEDULA: TIBStringField;
    IBQuery1RNC: TIBStringField;
    IBQuery1REFERENCIA: TIBStringField;
    IBQuery1TELEF_REFERENCIA: TIBStringField;
    IBQuery1OTRO_TELEFONO: TIBStringField;
    IBQuery1CANT_DIAS_CREDITO: TSmallintField;
    IBQuery1TIPO_NCF: TIBStringField;
    IBQuery1OBSERVACION: TMemoField;
    IBQuery1LUGAR_DE_TRABAJO: TIBStringField;
    IBQuery1APODO: TIBStringField;
    IBQuery1CODIGO_USUARIO: TIntegerField;
    qryPrestamosCEDULA: TIBStringField;
    qryPrestamosRNC: TIBStringField;
    qryPrestamosREFERENCIA: TIBStringField;
    qryPrestamosTELEF_REFERENCIA: TIBStringField;
    qryPrestamosOTRO_TELEFONO: TIBStringField;
    qryPrestamosCANT_DIAS_CREDITO: TSmallintField;
    qryPrestamosTIPO_NCF: TIBStringField;
    qryPrestamosOBSERVACION: TMemoField;
    qryPrestamosLUGAR_DE_TRABAJO: TIBStringField;
    qryPrestamosAPODO: TIBStringField;
    qryPrestamosCODIGO_USUARIO: TIntegerField;
    MainMenu1: TMainMenu;
    MaestroCliente1: TMenuItem;
    qryPrestamosRNC_NUMERO: TIBStringField;
    qryClienteStdRNC_NUMERO: TIBStringField;
    qryCteConCxc: TIBQuery;
    qryCteConCxcCODIGO_CTE: TIntegerField;
    qryPrestamosCodCteconCxc: TIntegerField;
    qryClienteStdCodCteconCxc: TIntegerField;
    DBGrid2: TRxDBGrid;
    DBGrid1: TRxDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RadioGroup1Click(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure chkBoxFiltrarExit(Sender: TObject);
    procedure LabelNumHistClick(Sender: TObject);
    procedure labelNSSClick(Sender: TObject);
    procedure labelCedulaClick(Sender: TObject);
    procedure LabelNombreClick(Sender: TObject);
    procedure LabelTelefonoClick(Sender: TObject);
    procedure LabelApodoClick(Sender: TObject);
    procedure MaestroCliente1Click(Sender: TObject);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure DBGrid2Exit(Sender: TObject);
    procedure DBGrid2GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure RxDBGrid1CellClick(Column: TColumn);
    procedure RxDBGrid1Exit(Sender: TObject);
    procedure DBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
  private
    { Private declarations }
    procedure AsignarSqlText(campo:string;valor:string; OrderBy : String);

    procedure AsignarDatos(Numhist, Nss, Cedula, Nombre, Telefono, Apodo:String);
  public
    { Public Declarations }
    xCodigoCte : Integer;
    Numerocks  : Integer;
    CodigoCliente : Integer;
    xSerie : Integer;
    xCedula : String;
    nombrecliente : String;
  end;

var
  FrmBuscarClientesPersonas: TFrmBuscarClientesPersonas;
   Texto: String;
    //qryClienteStd: TIBQuery;
implementation

uses UDatModConectar, UGlobal, UDatModClientes, UMaestroClientes;

{$R *.dfm}

procedure TFrmBuscarClientesPersonas.FormCreate(Sender: TObject);
begin
  qryCteConCxc.close;
  qryCteConCxc.Open;
  if qryPrestamos.State = dsInactive then
  qryPrestamos.Open;
  qryPrestamos.Close;
  qryPrestamos.Filtered:=False;
  //qryClienteStd:=TIBQuery.Create(Nil);
  xCodigoCte:=0;
  nombrecliente:='';
end;

procedure TFrmBuscarClientesPersonas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
{  if qryPrestamos.State = dsBrowse then
  qryPrestamos.Locate('CODIGO_CTE',xCodigoCte,[])
  else
  qryClienteStd.Locate('CODIGO_CTE',xCodigoCte,[]);
  Action:=CaFree;}
end;

procedure TFrmBuscarClientesPersonas.RadioGroup1Click(Sender: TObject);
//var
  //dsAnterio:String;
begin
  if RadioGroup1.ItemIndex = 6 then exit;//esto hasta que agregues apodo a la tabla cliente
  Panel4.Visible:=False;
  Edit1Enter(Self);
  if Edit1.Text <> '' then
  if Not chkBoxFiltrar.Checked then
  begin
    DBGrid1.DataSource:=dsqryPrestamos;
    DBGrid1.Visible:=False;
    DBGrid2.Visible:=False;
    Panel4.Visible:=False;
  end;

  if chkBoxFiltrar.Checked And (RadioGroup1.ItemIndex >= 0) then
  begin
    GlbCampoFilterCte:='';
    case RadioGroup1.ItemIndex of
    0: glbCampoFilterCte:='codigo_cte';
    1: glbCampoFilterCte:='CEDULA';
    2: glbCampoFilterCte:='NOMBRE_CTE';
    3: glbCampoFilterCte:='NOMBRE_CTE';
    4: glbCampoFilterCte:='Telef_contacto';
    //6: glbCampoFilterCte:='Apodo';
    end;

    case RadioGroup1.ItemIndex of
    0: GlbOrderBy :=' order by codigo_cte';
    1: GlbOrderBy :=' order by CEDULA';
    2: GlbOrderBy :=' order by NOMBRE_cte';
    3: GlbOrderBy :=' order by NOMBRE_CTE';
    4: GlbOrderBy :=' order by Telef_contacto';
    //6: GlbOrderBy :=' order by Apodo';
    end;

    if (Edit1.Text <> '') then
    glbValueFilterCte :=UpperCase(Edit1.Text);
    if (glbCampoFilterCte <>'')then
    begin
      AsignarSqlText(GlbcampoFilterCte,chr(39) +GlbValueFilterCte+'%'+chr(39), GlbOrderBy);
      Texto:= qryClienteStd.Text;
      if (GlbValueFilterCte <> '') then
      qryClienteStd.Open;
      DataSource1.DataSet:= QryClienteStd;
      DBGrid2.DataSource := DataSource1;
      DBGrid1.Visible:=False;
      DBGrid2.Visible := True;
      AsignarDatos(
      qryClienteStdcodigo_Cte.AsString,
      '',
      qryClienteStdCEDULA.Value,
      qryClienteStdNOMBRE_cte.Value,
      qryClienteStdTELEF_contacto.Value,'');
      //qryClienteStdAPODO.Value);
      qryPrestamos.Filtered:=False;
      Exit;
    end;
    if DBGrid2.Visible Or DBGrid1.Visible then
    Panel4.Visible := True else Panel4.Visible := False;
  end;

  qryPrestamos.Filtered := False;
  if qryPrestamos.State = dsInactive then
  qryPrestamos.Open;

  if RadioGroup1.ItemIndex = 0 then
  begin
    if Edit1.Text = '' then Exit;
    if qryPrestamos.state = dsInactive then
    qryPrestamos.Open;
    if Not qryPrestamos.Locate('codigo_Cte',StrToInt(Edit1.Text),[loCaseInsensitive,loPartialKey]) then
    dbgrid1.Visible:=False else dbgrid1.Visible:=True;
  end else if RadioGroup1.ItemIndex = 1 then
  begin
    if Not qryPrestamos.Locate('cedula',Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    dbgrid1.Visible:=False else  dbgrid1.Visible:=True;
  end else if RadioGroup1.ItemIndex = 2 then
  begin
    if not qryPrestamos.Locate('nombre_cte',Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    dbgrid1.Visible:=False else  dbgrid1.Visible:=True;
  end{  else if RadioGroup1.ItemIndex = 3 then
  begin
    if not qryPrestamos.Locate('nombre',Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    dbgrid1.Visible:=False else  dbGrid1.Visible:=True;
  end} else if RadioGroup1.ItemIndex = 3 then
  begin
    if not qryPrestamos.Locate('NOMBRE_CTE',Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    dbgrid1.Visible:=False else  dbGrid1.Visible:=True;
  end else if RadioGroup1.ItemIndex = 4 then
  begin
    if not qryPrestamos.Locate('TELEF_contacto',Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    dbgrid1.Visible:=False else  dbGrid1.Visible:=True;
  end else if RadioGroup1.ItemIndex = 5 then
  begin
    if not qryPrestamos.Locate('Apodo',Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    dbgrid1.Visible:=False else  dbGrid1.Visible:=True;
  end;
  Edit1Enter(Self);
  if FrmBuscarClientesPersonas.Showing then
  Edit1.SetFocus;
  if dbGrid1.Visible then
  begin
    //xSerie := qryPrestamosSERIE.Value;
    CodigoCliente:=qryPrestamosCodigo_cte.Value;
    xCedula:=qryPrestamosCEDULA.Value;
    AsignarDatos(qryPrestamoscodigo_cte.AsString,
                 '',
                 qryPrestamosCEDULA.Value,
                 qryPrestamosNOMBRE_cte.Value,
                 qryPrestamosTELEF_CONTACTO.Value,''
                 {qryPrestamosAPODO.Value});
  end else
  if dbGrid2.Visible then
  begin
    //xSerie := qryClienteStdSERIE.Value;
    codigoCliente:=qryClienteStdCodigo_cte.Value;
    xCedula := qryClienteStdCEDULA.Value;
    AsignarDatos(qryClienteStdcodigo_Cte.AsString,'',
    qryClienteStdCEDULA.Value,
    qryClienteStdNOMBRE_cte.Value,
    qryClienteStdTELEF_CONTACTO.Value,'');
    //qryClienteStdAPODO.Value);
  end;
end;

procedure TFrmBuscarClientesPersonas.Edit1Enter(Sender: TObject);
var
  klk : string;
begin
  Case RadioGroup1.ItemIndex of
  0:begin
      Label2.Caption := RadioGroup1.Items.Names[0];
      klk:= RadioGroup1.Items.Strings[0];
      Label2.Caption:=klk;
    end;
  1:begin
      Label2.Caption := RadioGroup1.Items.Names[1];
      klk:= RadioGroup1.Items.Strings[1];
      Label2.Caption:=klk;
    end;
  2:begin
      Label2.Caption := RadioGroup1.Items.Names[2];
      klk:= RadioGroup1.Items.Strings[2];
      Label2.Caption:=klk;
    end;
  3:begin
      Label2.Caption := RadioGroup1.Items.Names[3];
      klk:= RadioGroup1.Items.Strings[3];
      Label2.Caption:=klk;
    end;
  4:begin
      Label2.Caption := RadioGroup1.Items.Names[4];
      klk:= RadioGroup1.Items.Strings[4];
      Label2.Caption:=klk;
    end;
  5:begin
      Label2.Caption := RadioGroup1.Items.Names[5];
      klk:= RadioGroup1.Items.Strings[5];
      Label2.Caption:=klk;
    end;
  6:begin
      Label2.Caption := RadioGroup1.Items.Names[6];
      klk:= RadioGroup1.Items.Strings[6];
      Label2.Caption := klk;
    end;
  end;
end;

procedure TFrmBuscarClientesPersonas.Button1Click(Sender: TObject);
begin
  qryPrestamos.Filtered := False;
  if (RadioGroup1.ItemIndex = 0) then
  begin
    if Not qryPrestamos.Locate('CODIGO_CTE', StrToInt(Edit1.Text),[loCaseInsensitive,loPartialKey]) then
    MessageDlg('Código no encontrado', mtInformation, [mbOK], 0);
  end else if RadioGroup1.ItemIndex = 0 then
  begin
    if Not qryPrestamos.Locate('codigo_cte', Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    MessageDlg('Codigo cliente no encontrado', mtInformation, [mbOK], 0);
  end else if RadioGroup1.ItemIndex = 1 then
  begin
    if Not qryPrestamos.Locate('CEDULA_cliente', Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    MessageDlg('Cédula no encontrada',mtInformation, [mbOK], 0);
  end else if RadioGroup1.ItemIndex = 2 then
  begin
    if Not qryPrestamos.Locate('nombre_CTE', Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    MessageDlg('Nombre no encontrado',mtInformation, [mbOK], 0);
  end else if RadioGroup1.ItemIndex = 3 then
  begin
    if Not qryPrestamos.Locate('NOMBRE_CTE', Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    MessageDlg('Apellido no encontrado',mtInformation, [mbOK], 0);
  end else if RadioGroup1.ItemIndex = 4 then
  begin
    if Not qryPrestamos.Locate('telef_contacto', Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    MessageDlg('Telefono no encontrado',mtInformation, [mbOK], 0);
  end;
end;

procedure TFrmBuscarClientesPersonas.chkBoxFiltrarExit(Sender: TObject);
begin
  if not chkBoxFiltrar.Checked then
  begin
    DBGrid1.DataSource:=dsqryPrestamos;
    Exit;
  end;
end;

procedure TFrmBuscarClientesPersonas.AsignarSqlText(Campo : String; Valor : String; OrderBy : String);
begin
  if qryClienteStd.Active then
  qryClienteStd.close;
  qryClienteStd.Database:= dmConectar.IBDatabase1;
  qryClienteStd.SQL.Text:=
  Format(IBQuery1.Text +
  ' WHERE UPPER(%s) like %s %s',[Campo, Valor, OrderBy]);
end;

procedure TFrmBuscarClientesPersonas.AsignarDatos(numhist, nss,cedula,nombre,telefono,apodo:String);
begin
  Panel4.Visible:=True;
  LabelNumHist.Caption := numhist;
  labelNSS.Caption     := nss;
  labelCedula.Caption  := cedula;
  LabelNombre.Caption  := nombre;
  LabelTelefono.Caption:= telefono;
  LabelApodo.Caption   := apodo;
  nombrecliente:= nombre;
end;

procedure TFrmBuscarClientesPersonas.LabelNumHistClick(Sender: TObject);
begin
  edit1.Text:=LabelNumHist.Caption;
  RadioGroup1.ItemIndex:=0;
end;

procedure TFrmBuscarClientesPersonas.labelNSSClick(Sender: TObject);
begin
  edit1.Text:=labelNSS.Caption;
  RadioGroup1.ItemIndex:=1;
end;

procedure TFrmBuscarClientesPersonas.labelCedulaClick(Sender: TObject);
begin
  edit1.Text:=labelCedula.Caption;
    RadioGroup1.ItemIndex:=1;
end;

procedure TFrmBuscarClientesPersonas.LabelNombreClick(Sender: TObject);
begin
  edit1.Text:=LabelNombre.Caption;
    RadioGroup1.ItemIndex:=2;
end;

procedure TFrmBuscarClientesPersonas.LabelTelefonoClick(Sender: TObject);
begin
  edit1.Text:=LabelTelefono.Caption;
    RadioGroup1.ItemIndex:=4;
end;

procedure TFrmBuscarClientesPersonas.LabelApodoClick(Sender: TObject);
begin
  edit1.Text:=LabelApodo.Caption;
  RadioGroup1.ItemIndex:=5;
end;

procedure TFrmBuscarClientesPersonas.MaestroCliente1Click(Sender: TObject);
begin
  frmClientes:=TfrmClientes.Create(Self);
  try
    frmClientes.ShowModal;
  finally
  frmClientes.Free;
  frmClientes:=Nil;
  end;
  qryPrestamos.Close;
  qryPrestamos.Open;
  qryPrestamos.Filtered:=False;
  xCodigoCte:=0;
end;

procedure TFrmBuscarClientesPersonas.DBGrid2CellClick(Column: TColumn);
begin
  if dbGrid1.Visible then
  begin
    //xSerie := qryPrestamosSERIE.Value;
    CodigoCliente:=qryPrestamosCodigo_Cte.Value;
    xCedula:=qryPrestamosCEDULA.Value;
    AsignarDatos(qryPrestamoscodigo_cte.AsString,
                 '',
                 qryPrestamosCEDULA.Value,
                 qryPrestamosNOMBRE_cte.Value,
                 qryPrestamosTELEF_CONTACTO.Value,''
                 {qryPrestamosAPODO.Value});
  end else
  if dbGrid2.Visible then
  begin
    //xSerie := qryClienteStdSERIE.Value;
    codigoCliente:=qryClienteStdCodigo_cte.Value;
    xCedula := qryClienteStdCEDULA.Value;
    AsignarDatos(qryClienteStdcodigo_cte.AsString,'',
    qryClienteStdCEDULA.Value,
    qryClienteStdNOMBRE_cte.Value,
    qryClienteStdTELEF_CONTACTO.Value,'');
    //qryClienteStdAPODO.Value);
  end;

end;

procedure TFrmBuscarClientesPersonas.DBGrid2Exit(Sender: TObject);
begin
  if DBGrid2.DataSource = dsqryPrestamos then
  begin
    xCodigoCte   := qryPrestamosCODIGO_cte.Value;
    CodigoCliente:= qryPrestamosCodigo_cte.Value;
    nombrecliente:= qryPrestamosNOMBRE_CTE.Value;
    //xSerie       := qryPrestamosSERIE.Value;
    xCedula      := qryPrestamosCEDULA.Value;
  end else
  if qryClienteStd.RecordCount > 0 then
  begin
    xCodigoCte:= qryClienteStd.Fieldbyname('codigo_cte').Value;
    CodigoCliente:= qryClienteStdCodigo_cte.Value;
    //xSerie       := qryClienteStdSERIE.Value;
    xCedula      := qryClienteStdCEDULA.Value;
    nombrecliente:= qryClienteStdNOMBRE_CTE.Value;
    //if not qryClienteStd.Fieldbyname('NUMERO_cks').IsNull then
    //Numerocks := qryClienteStd.Fieldbyname('NUMERO_cks').AsInteger;
  end;
end;

procedure TFrmBuscarClientesPersonas.DBGrid2GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not qryClienteStdCodCteconCxc.IsNull then
  begin
    BackGround  := clYellow;
    aFont.Color := clGreen;
    aFont.Style := [fsBold];
  end;
end;

procedure TFrmBuscarClientesPersonas.RxDBGrid1CellClick(Column: TColumn);
begin
  if dbGrid1.Visible then
  begin
    //xSerie := qryPrestamosSERIE.Value;
    CodigoCliente:=qryPrestamosCodigo_cte.Value;
    xCedula:=qryPrestamosCEDULA.Value;
    AsignarDatos(qryPrestamoscodigo_cte.AsString,
                 '',
                 qryPrestamosCEDULA.Value,
                 qryPrestamosNOMBRE_cte.Value,
                 qryPrestamosTELEF_CONTACTO.Value,''
                 {qryPrestamosAPODO.Value});
  end else
  if dbGrid2.Visible then
  begin
    //xSerie := qryClienteStdSERIE.Value;
    codigoCliente:=qryClienteStdCodigo_cte.Value;
    xCedula := qryClienteStdCEDULA.Value;
    AsignarDatos(qryClienteStdcodigo_cte.AsString,'',
    '',
    qryClienteStdNOMBRE_cte.Value,
    qryClienteStdTELEF_CONTACTO.Value,'');
    nombrecliente:= qryClienteStdNOMBRE_CTE.Value;
    //qryClienteStdAPODO.Value);
  end;
end;

procedure TFrmBuscarClientesPersonas.RxDBGrid1Exit(Sender: TObject);
begin
  if DBGrid1.DataSource = dsqryPrestamos then
  begin
    xCodigoCte   := qryPrestamosCODIGO_Cte.Value;
    CodigoCliente:= qryPrestamosCodigo_cte.Value;
    //xSerie       := qryPrestamosSERIE.Value;
    xCedula      := qryPrestamosCEDULA.Value;
    nombrecliente:= qryPrestamosNOMBRE_CTE.Value;
  end else
  if qryClienteStd.RecordCount > 0 then
  begin
    xCodigoCte:= qryClienteStd.Fieldbyname('codigo_cte').Value;
    CodigoCliente:= qryClienteStdCodigo_cte.Value;
    //xSerie       := qryClienteStdSERIE.Value;
    xCedula      := qryClienteStdCEDULA.Value;
    nombrecliente:= qryClienteStdNOMBRE_CTE.Value;
    //if not qryClienteStd.Fieldbyname('NUMERO_cks').IsNull then
    //Numerocks := qryClienteStd.Fieldbyname('NUMERO_cks').AsInteger;
  end;
end;

procedure TFrmBuscarClientesPersonas.DBGrid1GetCellParams(
  Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
  Highlight: Boolean);
begin
  if not qryPrestamosCodCteconCxc.IsNull then
  begin
    BackGround := clyellow;
    aFont.Color := clGreen;
    aFont.Style:= [fsBold];
  end;
end;

end.
