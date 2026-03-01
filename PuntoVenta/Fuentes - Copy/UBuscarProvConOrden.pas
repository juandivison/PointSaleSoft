unit UBuscarProvConOrden;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBCtrls, Grids, DBGrids, ComCtrls, ExtCtrls, StdCtrls,
  Buttons, IBCustomDataSet, IBQuery, WinSkinData, Menus, RXCtrls, RXDBCtrl;

type
  TfrmProcBuscarProvOrden = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    ScrollBox1: TScrollBox;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    BitBtn1: TBitBtn;
    Panel3: TPanel;
    RadioGroup1: TRadioGroup;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    dsqryClienteStd: TDataSource;
    SkinData1: TSkinData;
    BitBtn2: TBitBtn;
    chkBoxFiltrar: TCheckBox;
    qryClienteStd: TIBQuery;
    DBGrid2: TDBGrid;
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
    qryProveedores: TIBQuery;
    dsqryProveedores: TDataSource;
    IBQuery1: TIBQuery;
    MainMenu1: TMainMenu;
    MaestroCliente1: TMenuItem;
    IBQuery1CODIGO_CTE: TIntegerField;
    IBQuery1TIPO_CLIENTE: TIntegerField;
    IBQuery1DESCRIPCION: TIBStringField;
    IBQuery1CONTACTO: TIBStringField;
    IBQuery1PAIS: TIBStringField;
    IBQuery1ESTADO: TIBStringField;
    IBQuery1CIUDAD: TIBStringField;
    IBQuery1CALYYNUM: TIBStringField;
    IBQuery1TELEFONO: TIBStringField;
    IBQuery1FAX: TIBStringField;
    IBQuery1CODIGOPOSTAL: TIBStringField;
    IBQuery1EMAIL: TIBStringField;
    IBQuery1DIRECCIONWEB: TIBStringField;
    IBQuery1STATUS: TIBStringField;
    IBQuery1FECHA_IN: TDateTimeField;
    IBQuery1IN_POR: TIBStringField;
    IBQuery1FECHA_MOD: TDateTimeField;
    IBQuery1MOD_POR: TIBStringField;
    IBQuery1RNC_PROVEEDOR: TIBStringField;
    IBQuery1MOVIL1: TIBStringField;
    IBQuery1MOVIL2: TIBStringField;
    IBQuery1TELEFONO2: TIBStringField;
    IBQuery1TELEFONO3: TIBStringField;
    IBQuery1EXTENSIONES: TIBStringField;
    IBQuery1CIA_KEY: TIntegerField;
    IBQuery1NOMBRE_ABR: TIBStringField;
    IBQuery1LIMITE_CREDITO: TFloatField;
    IBQuery1COD_VENDEDOR: TIntegerField;
    IBQuery1CONDICION: TIntegerField;
    IBQuery1CANT_DIAS_CREDITO: TSmallintField;
    qryProveedoresCODIGO_CTE: TIntegerField;
    qryProveedoresTIPO_CLIENTE: TIntegerField;
    qryProveedoresDESCRIPCION: TIBStringField;
    qryProveedoresCONTACTO: TIBStringField;
    qryProveedoresPAIS: TIBStringField;
    qryProveedoresESTADO: TIBStringField;
    qryProveedoresCIUDAD: TIBStringField;
    qryProveedoresCALYYNUM: TIBStringField;
    qryProveedoresTELEFONO: TIBStringField;
    qryProveedoresFAX: TIBStringField;
    qryProveedoresCODIGOPOSTAL: TIBStringField;
    qryProveedoresEMAIL: TIBStringField;
    qryProveedoresDIRECCIONWEB: TIBStringField;
    qryProveedoresSTATUS: TIBStringField;
    qryProveedoresFECHA_IN: TDateTimeField;
    qryProveedoresIN_POR: TIBStringField;
    qryProveedoresFECHA_MOD: TDateTimeField;
    qryProveedoresMOD_POR: TIBStringField;
    qryProveedoresRNC_PROVEEDOR: TIBStringField;
    qryProveedoresMOVIL1: TIBStringField;
    qryProveedoresMOVIL2: TIBStringField;
    qryProveedoresTELEFONO2: TIBStringField;
    qryProveedoresTELEFONO3: TIBStringField;
    qryProveedoresEXTENSIONES: TIBStringField;
    qryProveedoresCIA_KEY: TIntegerField;
    qryProveedoresNOMBRE_ABR: TIBStringField;
    qryProveedoresLIMITE_CREDITO: TFloatField;
    qryProveedoresCOD_VENDEDOR: TIntegerField;
    qryProveedoresCONDICION: TIntegerField;
    qryProveedoresCANT_DIAS_CREDITO: TSmallintField;
    qryClienteStdCODIGO_CTE: TIntegerField;
    qryClienteStdTIPO_CLIENTE: TIntegerField;
    qryClienteStdDESCRIPCION: TIBStringField;
    qryClienteStdCONTACTO: TIBStringField;
    qryClienteStdPAIS: TIBStringField;
    qryClienteStdESTADO: TIBStringField;
    qryClienteStdCIUDAD: TIBStringField;
    qryClienteStdCALYYNUM: TIBStringField;
    qryClienteStdTELEFONO: TIBStringField;
    qryClienteStdFAX: TIBStringField;
    qryClienteStdCODIGOPOSTAL: TIBStringField;
    qryClienteStdEMAIL: TIBStringField;
    qryClienteStdDIRECCIONWEB: TIBStringField;
    qryClienteStdSTATUS: TIBStringField;
    qryClienteStdFECHA_IN: TDateTimeField;
    qryClienteStdIN_POR: TIBStringField;
    qryClienteStdFECHA_MOD: TDateTimeField;
    qryClienteStdMOD_POR: TIBStringField;
    qryClienteStdRNC_PROVEEDOR: TIBStringField;
    qryClienteStdMOVIL1: TIBStringField;
    qryClienteStdMOVIL2: TIBStringField;
    qryClienteStdTELEFONO2: TIBStringField;
    qryClienteStdTELEFONO3: TIBStringField;
    qryClienteStdEXTENSIONES: TIBStringField;
    qryClienteStdCIA_KEY: TIntegerField;
    qryClienteStdNOMBRE_ABR: TIBStringField;
    qryClienteStdLIMITE_CREDITO: TFloatField;
    qryClienteStdCOD_VENDEDOR: TIntegerField;
    qryClienteStdCONDICION: TIntegerField;
    qryClienteStdCANT_DIAS_CREDITO: TSmallintField;
    qryClienteStdNUM_ORDEN: TIntegerField;
    qryClienteStdFECHA: TDateTimeField;
    qryClienteStdNUMERO_NCF: TIBStringField;
    qryClienteStdNUMERO_TRN: TIntegerField;
    qryClienteStdSTATUS_ORD: TIBStringField;
    qryClienteStdIDTIPO_PROV: TIntegerField;
    qryClienteStdTIPODOC: TSmallintField;
    qryProveedoresNUM_ORDEN: TIntegerField;
    qryProveedoresFECHA: TDateTimeField;
    qryProveedoresNUMERO_NCF: TIBStringField;
    qryProveedoresNUMERO_TRN: TIntegerField;
    qryProveedoresSTATUS_ORD: TIBStringField;
    qryProveedoresIDTIPO_PROV: TIntegerField;
    qryProveedoresTIPODOC: TSmallintField;
    DBStatusLabel1: TDBStatusLabel;
    DBStatusLabel2: TDBStatusLabel;
    CheckBox1: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RadioGroup1Click(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure chkBoxFiltrarExit(Sender: TObject);
    procedure DBGrid1Exit(Sender: TObject);
    procedure LabelNumHistClick(Sender: TObject);
    procedure labelNSSClick(Sender: TObject);
    procedure labelCedulaClick(Sender: TObject);
    procedure LabelNombreClick(Sender: TObject);
    procedure LabelTelefonoClick(Sender: TObject);
    procedure LabelApodoClick(Sender: TObject);
    procedure DBGrid2Exit(Sender: TObject);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure MaestroCliente1Click(Sender: TObject);
    procedure qryProveedoresAfterScroll(DataSet: TDataSet);
    procedure chkBoxFiltrarClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
    procedure AsignarSqlText(campo:string;valor:string; OrderBy : String);

    procedure AsignarDatos(Numhist, Nss, Cedula, Nombre, Telefono, Apodo:String);
  public
    { Public Declarations }
    xCodigoCte : Integer;
    Numerocks  : Integer;
    CodigoCliente : Integer;
    numOrden:Integer;
    xSerie : Integer;
    xCedula : String;
  end;

var
  frmProcBuscarProvOrden: TfrmProcBuscarProvOrden;
    Texto: String;
    //qryClienteStd: TIBQuery;
implementation

uses UDatModConectar, UGlobal, UDatModClientes, UMaestroClientes,
  UDatModProveedor, UFormProveedores;


{$R *.dfm}

procedure TfrmProcBuscarProvOrden.FormCreate(Sender: TObject);
begin
  //dmproveedor.qryProveCxp.Close;
  //dmproveedor.qryProveCxp.Open;
  qryProveedores.Close;
  qryProveedores.params[0].Value:=glbCia_Key;
  if qryProveedores.State = dsInactive then
  qryProveedores.Open;

  qryProveedores.Close;
  qryProveedores.Filtered:=False;
  qryProveedores.Open;
  qryClienteStd.close;
  qryClienteStd.params[0].Value:=glbCia_Key;
  qryClienteStd.Open;
  //qryClienteStd:=TIBQuery.Create(Nil);
  xCodigoCte:=0;
end;

procedure TfrmProcBuscarProvOrden.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
{  if qryProveedores.State = dsBrowse then
  qryProveedores.Locate('CODIGO_CTE',xCodigoCte,[])
  else
  qryClienteStd.Locate('CODIGO_CTE',xCodigoCte,[]);
  Action:=CaFree;}
end;

procedure TfrmProcBuscarProvOrden.RadioGroup1Click(Sender: TObject);
//var
  //dsAnterio:String;
begin
  if RadioGroup1.ItemIndex = 6 then exit;//esto hasta que agregues apodo a la tabla cliente
  Panel4.Visible:=False;
  Edit1Enter(Self);
  if Edit1.Text <> '' then
  if Not chkBoxFiltrar.Checked then
  begin
    DBGrid1.DataSource:=dsqryProveedores;
    DBGrid1.Visible:=False;
    DBGrid2.Visible:=False;
    Panel4.Visible:=False;
  end;

  if chkBoxFiltrar.Checked And (RadioGroup1.ItemIndex >= 0) then
  begin
    GlbCampoFilterCte:='';
    case RadioGroup1.ItemIndex of
    0: glbCampoFilterCte:='codigo_cte';
    1: glbCampoFilterCte:='RNC_PROVEEDOR';
    2: glbCampoFilterCte:='DESCRIPCION';
    3: glbCampoFilterCte:='NOMBRE_ABR';
    4: glbCampoFilterCte:='TELEFONO';
    6: glbCampoFilterCte:='NUM_ORDEN';
    end;

    case RadioGroup1.ItemIndex of
    0: GlbOrderBy :=' order by codigo_cte';
    1: GlbOrderBy :=' order by RNC_PROVEEDOR';
    2: GlbOrderBy :=' order by DESCRIPCION';
    3: GlbOrderBy :=' order by NOMBRE_ABR';
    4: GlbOrderBy :=' order by TELEFONO';
    6: glbCampoFilterCte:='NUM_ORDEN';
    end;

    if (Edit1.Text <> '') then
    glbValueFilterCte :=UpperCase(Edit1.Text);
    if (glbCampoFilterCte <>'')then
    begin
      AsignarSqlText(GlbcampoFilterCte,chr(39) +GlbValueFilterCte+'%'+chr(39), GlbOrderBy);
      Texto:= qryClienteStd.Text;
      if (GlbValueFilterCte <> '') then
      qryClienteStd.Open;
      dsQryClienteStd.DataSet:= QryClienteStd;
      DBGrid2.DataSource := dsQryClienteStd;
      DBGrid1.Visible:=False;
      DBGrid2.Visible := True;
      AsignarDatos(
      qryClienteStdcodigo_Cte.AsString,
      '',
      qryClienteStdRNC_PROVEEDOR.Value,
      qryClienteStdDESCRIPCION.Value,
      qryClienteStdTELEFONO.Value,'');
      //qryClienteStdAPODO.Value);
      qryProveedores.Filtered:=False;
      CheckBox1.Checked:=False;
      Exit;
    end;
    if DBGrid2.Visible Or DBGrid1.Visible then
    Panel4.Visible := True else Panel4.Visible := False;
  end;

  qryProveedores.Filtered := False;
  qryProveedores.params[0].Value:=glbCia_Key;
  if qryProveedores.State = dsInactive then
  qryProveedores.Open;

  if RadioGroup1.ItemIndex = 0 then
  begin
    if Edit1.Text = '' then Exit;
    qryProveedores.params[0].Value:=glbCia_Key;
    if qryProveedores.state = dsInactive then
    qryProveedores.Open;
    if Not qryProveedores.Locate('codigo_Cte',StrToInt(Edit1.Text),[loCaseInsensitive,loPartialKey]) then
    dbgrid1.Visible:=False else dbgrid1.Visible:=True;
  end else if RadioGroup1.ItemIndex = 1 then
  begin
    if Not qryProveedores.Locate('RNC_PROVEEDOR',Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    dbgrid1.Visible:=False else  dbgrid1.Visible:=True;
  end else if RadioGroup1.ItemIndex = 2 then
  begin
    if not qryProveedores.Locate('DESCRIPCION',Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    dbgrid1.Visible:=False else  dbgrid1.Visible:=True;
  end{  else if RadioGroup1.ItemIndex = 3 then
  begin
    if not qryProveedores.Locate('nombre',Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    dbgrid1.Visible:=False else  dbGrid1.Visible:=True;
  end} else if RadioGroup1.ItemIndex = 3 then
  begin
    if not qryProveedores.Locate('NOMBRE_ABR',Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    dbgrid1.Visible:=False else  dbGrid1.Visible:=True;
  end else if RadioGroup1.ItemIndex = 4 then
  begin
    if not qryProveedores.Locate('TELEFONO',Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    dbgrid1.Visible:=False else  dbGrid1.Visible:=True;
  end else if RadioGroup1.ItemIndex = 5 then
  begin
    //if not qryProveedores.Locate('Apodo',Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    //dbgrid1.Visible:=False else  dbGrid1.Visible:=True;
  end else if RadioGroup1.ItemIndex = 6 then
  begin
    if not qryProveedores.Locate('num_orden',Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    dbgrid1.Visible:=False else  dbGrid1.Visible:=True;
  end;
  Edit1Enter(Self);
  if Showing then
  Edit1.SetFocus;
  if dbGrid1.Visible then
  begin
    //xSerie := qryProveedoresSERIE.Value;
    CodigoCliente:=qryProveedoresCodigo_cte.Value;
    numOrden:=qryProveedoresNUM_ORDEN.Value;
    xCedula:=qryProveedoresRNC_PROVEEDOR.Value;
    AsignarDatos(qryProveedorescodigo_cte.AsString,
                 '',
                 qryProveedoresRNC_PROVEEDOR.Value,
                 qryProveedoresDESCRIPCION.Value,
                 qryProveedoresTELEFONO.Value,''
                 {qryProveedoresAPODO.Value});
  end else
  if dbGrid2.Visible then
  begin
    //xSerie := qryClienteStdSERIE.Value;
    codigoCliente:=qryClienteStdCodigo_cte.Value;
    numOrden:=qryProveedoresNUM_ORDEN.Value;
    xCedula := qryClienteStdRNC_PROVEEDOR.Value;
    AsignarDatos(qryClienteStdcodigo_Cte.AsString,'',
    qryClienteStdRNC_PROVEEDOR.Value,
    qryClienteStdDESCRIPCION.Value,
    qryClienteStdTELEFONO.Value,'');
    //qryClienteStdAPODO.Value);
  end;
end;

procedure TfrmProcBuscarProvOrden.Edit1Enter(Sender: TObject);
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

procedure TfrmProcBuscarProvOrden.Button1Click(Sender: TObject);
begin
  qryProveedores.Filtered := False;
  if RadioGroup1.ItemIndex = 0 then
  begin
    if Not qryProveedores.Locate('CODIGO_CTE', StrToInt(Edit1.Text),[loCaseInsensitive,loPartialKey]) then
    MessageDlg('Código no encontrado', mtInformation, [mbOK], 0);
  end else if RadioGroup1.ItemIndex = 0 then
  begin
    if Not qryProveedores.Locate('codigo_cte',Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    MessageDlg('Codigo cliente no encontrado', mtInformation, [mbOK], 0);
  end else if RadioGroup1.ItemIndex = 1 then
  begin
    if Not qryProveedores.Locate('RNC_PROVEEDOR',Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    MessageDlg('Cédula no encontrada',mtInformation, [mbOK], 0);
  end else if RadioGroup1.ItemIndex = 2 then
  begin
    if Not qryProveedores.Locate('DESCRIPCION',Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    MessageDlg('Nombre no encontrado',mtInformation, [mbOK], 0);
  end else if RadioGroup1.ItemIndex = 3 then
  begin
    if Not qryProveedores.Locate('NOMBRE_ABR',Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    MessageDlg('NOMBRE_ABR no encontrado',mtInformation, [mbOK], 0);
  end else if RadioGroup1.ItemIndex = 4 then
  begin
    if Not qryProveedores.Locate('TELEFONO',Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    MessageDlg('Telefono no encontrado',mtInformation, [mbOK], 0);
  end else if RadioGroup1.ItemIndex = 6 then
  begin
    if Not qryProveedores.Locate('num_orden',Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    MessageDlg('Numero orden no encontrado',mtInformation, [mbOK], 0);
  end;

end;

procedure TfrmProcBuscarProvOrden.chkBoxFiltrarExit(Sender: TObject);
begin
  if not chkBoxFiltrar.Checked then
  begin
    DBGrid1.DataSource:=dsqryProveedores;
    Exit;
  end;
end;

procedure TfrmProcBuscarProvOrden.DBGrid1Exit(Sender: TObject);
begin
  if DBGrid1.DataSource = dsqryProveedores then
  begin
    xCodigoCte   := qryProveedoresCODIGO_Cte.Value;
    CodigoCliente:= qryProveedoresCodigo_cte.Value;
    numOrden:=qryProveedoresNUM_ORDEN.Value;
    //xSerie       := qryProveedoresSERIE.Value;
    xCedula      := qryProveedoresRNC_PROVEEDOR.Value;
  end else
  if qryClienteStd.RecordCount > 0 then
  begin
    xCodigoCte:= qryClienteStd.Fieldbyname('codigo_cte').Value;
    CodigoCliente:= qryClienteStdCodigo_cte.Value;
    numOrden:=qryProveedoresNUM_ORDEN.Value;
    //xSerie       := qryClienteStdSERIE.Value;
    xCedula      := qryClienteStdRNC_PROVEEDOR.Value;
    //if not qryClienteStd.Fieldbyname('NUMERO_cks').IsNull then
    //Numerocks := qryClienteStd.Fieldbyname('NUMERO_cks').AsInteger;
  end;
end;

procedure TfrmProcBuscarProvOrden.AsignarSqlText(Campo : String; Valor : String; OrderBy : String);
begin
  if qryClienteStd.Active then
  qryClienteStd.close;
  qryClienteStd.Database:= dmConectar.IBDatabase1;
  qryClienteStd.SQL.Text:=
  Format(IBQuery1.Text +
  ' WHERE UPPER(%s) like %s %s',[Campo, Valor, OrderBy]);
end;

procedure TfrmProcBuscarProvOrden.AsignarDatos(numhist, nss,cedula,nombre,telefono,apodo:String);
begin
  Panel4.Visible:=True;
  LabelNumHist.Caption := numhist;
  labelNSS.Caption     := nss;
  labelCedula.Caption  := cedula;
  LabelNombre.Caption  := nombre;
  LabelTelefono.Caption:= telefono;
  LabelApodo.Caption   := apodo
end;

procedure TfrmProcBuscarProvOrden.LabelNumHistClick(Sender: TObject);
begin
  edit1.Text:=LabelNumHist.Caption;
  RadioGroup1.ItemIndex:=0;
end;

procedure TfrmProcBuscarProvOrden.labelNSSClick(Sender: TObject);
begin
  edit1.Text:=labelNSS.Caption;
  RadioGroup1.ItemIndex:=1;
end;

procedure TfrmProcBuscarProvOrden.labelCedulaClick(Sender: TObject);
begin
  edit1.Text:=labelCedula.Caption;
    RadioGroup1.ItemIndex:=1;
end;

procedure TfrmProcBuscarProvOrden.LabelNombreClick(Sender: TObject);
begin
  edit1.Text:=LabelNombre.Caption;
    RadioGroup1.ItemIndex:=2;
end;

procedure TfrmProcBuscarProvOrden.LabelTelefonoClick(Sender: TObject);
begin
  edit1.Text:=LabelTelefono.Caption;
    RadioGroup1.ItemIndex:=4;
end;

procedure TfrmProcBuscarProvOrden.LabelApodoClick(Sender: TObject);
begin
  edit1.Text:=LabelApodo.Caption;
  RadioGroup1.ItemIndex:=5;
end;

procedure TfrmProcBuscarProvOrden.DBGrid2Exit(Sender: TObject);
begin
  if DBGrid2.DataSource = dsqryProveedores then
  begin
    xCodigoCte   := qryProveedoresCODIGO_cte.Value;
    CodigoCliente:= qryProveedoresCodigo_cte.Value;
    numOrden:=qryProveedoresNUM_ORDEN.Value;
    //xSerie       := qryProveedoresSERIE.Value;
    xCedula      := qryProveedoresRNC_PROVEEDOR.Value;
  end else
  if qryClienteStd.RecordCount > 0 then
  begin
    xCodigoCte:= qryClienteStd.Fieldbyname('codigo_cte').Value;
    CodigoCliente:= qryClienteStdCodigo_cte.Value;
    //numOrden:=qryProveedoresNUM_ORDEN.Value;
    //xSerie       := qryClienteStdSERIE.Value;
    xCedula  := qryClienteStdRNC_PROVEEDOR.Value;
    //if not qryClienteStd.Fieldbyname('NUMERO_cks').IsNull then
    //Numerocks := qryClienteStd.Fieldbyname('NUMERO_cks').AsInteger;
  end;
end;

procedure TfrmProcBuscarProvOrden.DBGrid2CellClick(Column: TColumn);
begin
  if dbGrid1.Visible then
  begin
    //xSerie := qryProveedoresSERIE.Value;
    CodigoCliente:=qryProveedoresCodigo_Cte.Value;
    numOrden:=qryProveedoresNUM_ORDEN.Value;
    xCedula:=qryProveedoresRNC_PROVEEDOR.Value;
    numOrden:=qryProveedoresNUM_ORDEN.Value;
    AsignarDatos(qryProveedorescodigo_cte.AsString,
                 '',
                 qryProveedoresRNC_PROVEEDOR.Value,
                 qryProveedoresDESCRIPCION.Value,
                 qryProveedoresTELEFONO.Value,''
                 {qryProveedoresAPODO.Value});
  end else
  if dbGrid2.Visible then
  begin
    //xSerie := qryClienteStdSERIE.Value;
    codigoCliente:=qryClienteStdCodigo_cte.Value;
    numOrden:=qryProveedoresNUM_ORDEN.Value;
    numOrden:=qryClienteStdNUM_ORDEN.Value;
    xCedula := qryClienteStdRNC_PROVEEDOR.Value;
    AsignarDatos(qryClienteStdcodigo_cte.AsString,'',
    qryClienteStdRNC_PROVEEDOR.Value,
    qryClienteStdDESCRIPCION.Value,
    qryClienteStdTELEFONO.Value,'');
    //qryClienteStdAPODO.Value);
  end;

end;

procedure TfrmProcBuscarProvOrden.DBGrid1CellClick(Column: TColumn);
begin
  if dbGrid1.Visible then
  begin
    //xSerie := qryProveedoresSERIE.Value;
    CodigoCliente:=qryProveedoresCodigo_cte.Value;
    numOrden:=qryProveedoresNUM_ORDEN.Value;
    xCedula:=qryProveedoresRNC_PROVEEDOR.Value;
    AsignarDatos(qryProveedorescodigo_cte.AsString,
                 '',
                 qryProveedoresRNC_PROVEEDOR.Value,
                 qryProveedoresDESCRIPCION.Value,
                 qryProveedoresTELEFONO.Value,''
                 {qryProveedoresAPODO.Value});
  end else
  if dbGrid2.Visible then
  begin
    //xSerie := qryClienteStdSERIE.Value;
    codigoCliente:=qryClienteStdCodigo_cte.Value;
    numOrden:=qryProveedoresNUM_ORDEN.Value;
    xCedula := qryClienteStdRNC_PROVEEDOR.Value;
    AsignarDatos(qryClienteStdcodigo_cte.AsString,'',
    '',
    qryClienteStdDESCRIPCION.Value,
    qryClienteStdTELEFONO.Value,'');
    //qryClienteStdAPODO.Value);
  end;

end;

procedure TfrmProcBuscarProvOrden.MaestroCliente1Click(Sender: TObject);
begin
  frmProveedores:=TfrmProveedores.Create(Self);
  try
    frmProveedores.ShowModal;
  finally
  frmProveedores.Free;
  frmProveedores:=Nil;
  end;
  qryProveedores.Close;
  qryProveedores.Params[0].Value:=glbCia_Key;
  qryProveedores.Open;
  qryProveedores.Filtered:=False;
  xCodigoCte:=0;
end;

procedure TfrmProcBuscarProvOrden.qryProveedoresAfterScroll(DataSet: TDataSet);
begin
  xCodigoCte := qryProveedoresCODIGO_Cte.Value;
end;

procedure TfrmProcBuscarProvOrden.chkBoxFiltrarClick(Sender: TObject);
begin
  if not chkBoxFiltrar.Checked then
  begin
    DBGrid1.DataSource:=dsqryProveedores;
    DBGrid1.Visible:=True;
    DBGrid2.Visible:=False;
    DBGrid1.BringToFront;
  end;
end;

procedure TfrmProcBuscarProvOrden.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
  begin
    DBGrid1.DataSource:=dsqryProveedores;
    DBGrid1.Visible:=True;
    DBGrid2.Visible:=False;
    DBGrid1.BringToFront;
  end;
end;

end.
