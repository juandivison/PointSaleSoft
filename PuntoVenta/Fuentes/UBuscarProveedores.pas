unit UBuscarProveedores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBCtrls, Grids, DBGrids, ComCtrls, ExtCtrls, StdCtrls,
  Buttons, IBCustomDataSet, IBQuery, WinSkinData, Menus;

type
  TfrmProcBuscarProv = class(TForm)
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
    DataSource1: TDataSource;
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
    qryPrestamos: TIBQuery;
    dsqryPrestamos: TDataSource;
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
    qryPrestamosCODIGO_CTE: TIntegerField;
    qryPrestamosTIPO_CLIENTE: TIntegerField;
    qryPrestamosDESCRIPCION: TIBStringField;
    qryPrestamosCONTACTO: TIBStringField;
    qryPrestamosPAIS: TIBStringField;
    qryPrestamosESTADO: TIBStringField;
    qryPrestamosCIUDAD: TIBStringField;
    qryPrestamosCALYYNUM: TIBStringField;
    qryPrestamosTELEFONO: TIBStringField;
    qryPrestamosFAX: TIBStringField;
    qryPrestamosCODIGOPOSTAL: TIBStringField;
    qryPrestamosEMAIL: TIBStringField;
    qryPrestamosDIRECCIONWEB: TIBStringField;
    qryPrestamosSTATUS: TIBStringField;
    qryPrestamosFECHA_IN: TDateTimeField;
    qryPrestamosIN_POR: TIBStringField;
    qryPrestamosFECHA_MOD: TDateTimeField;
    qryPrestamosMOD_POR: TIBStringField;
    qryPrestamosRNC_PROVEEDOR: TIBStringField;
    qryPrestamosMOVIL1: TIBStringField;
    qryPrestamosMOVIL2: TIBStringField;
    qryPrestamosTELEFONO2: TIBStringField;
    qryPrestamosTELEFONO3: TIBStringField;
    qryPrestamosEXTENSIONES: TIBStringField;
    qryPrestamosCIA_KEY: TIntegerField;
    qryPrestamosNOMBRE_ABR: TIBStringField;
    qryPrestamosLIMITE_CREDITO: TFloatField;
    qryPrestamosCOD_VENDEDOR: TIntegerField;
    qryPrestamosCONDICION: TIntegerField;
    qryPrestamosCANT_DIAS_CREDITO: TSmallintField;
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
    procedure qryPrestamosAfterScroll(DataSet: TDataSet);
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
  end;

var
  frmProcBuscarProv: TfrmProcBuscarProv;
    Texto: String;
    //qryClienteStd: TIBQuery;
implementation

uses UDatModConectar, UGlobal, UDatModClientes, UMaestroClientes,
  UBuscarClientesPersonasP, UFormProveedores, UDatModProveedor;

{$R *.dfm}

procedure TfrmProcBuscarProv.FormCreate(Sender: TObject);
begin
  qryClienteStd.Close;
  dmproveedor.qryProveCxp.Close;
  dmproveedor.qryProveCxp.params[0].Value:=glbCia_Key;
  dmproveedor.qryProveCxp.Open;
  if qryPrestamos.State = dsInactive then
  qryPrestamos.Open;
  qryPrestamos.Close;
  qryPrestamos.Filtered:=False;
  //qryClienteStd:=TIBQuery.Create(Nil);
  xCodigoCte:=0;
end;

procedure TfrmProcBuscarProv.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
{  if qryPrestamos.State = dsBrowse then
  qryPrestamos.Locate('CODIGO_CTE',xCodigoCte,[])
  else
  qryClienteStd.Locate('CODIGO_CTE',xCodigoCte,[]);
  Action:=CaFree;}
end;

procedure TfrmProcBuscarProv.RadioGroup1Click(Sender: TObject);
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
    1: glbCampoFilterCte:='RNC_PROVEEDOR';
    2: glbCampoFilterCte:='DESCRIPCION';
    3: glbCampoFilterCte:='NOMBRE_ABR';
    4: glbCampoFilterCte:='TELEFONO';
    //6: glbCampoFilterCte:='Apodo';
    end;

    case RadioGroup1.ItemIndex of
    0: GlbOrderBy :=' order by codigo_cte';
    1: GlbOrderBy :=' order by RNC_PROVEEDOR';
    2: GlbOrderBy :=' order by DESCRIPCION';
    3: GlbOrderBy :=' order by NOMBRE_ABR';
    4: GlbOrderBy :=' order by TELEFONO';
    //6: GlbOrderBy :=' order by Apodo';
    end;

    if (Edit1.Text <> '') then
    glbValueFilterCte :=UpperCase(Edit1.Text);
    if (glbCampoFilterCte <>'')then
    begin
      AsignarSqlText(GlbcampoFilterCte,chr(39) +GlbValueFilterCte+'%'+chr(39), GlbOrderBy);
      Texto:= qryClienteStd.Text;
      if (GlbValueFilterCte <> '') or (qryClienteStd.State = dsInactive) then
      qryClienteStd.Open;
      DataSource1.DataSet:= QryClienteStd;
      DBGrid2.DataSource := DataSource1;
      DBGrid1.Visible:=False;
      DBGrid2.Visible := True;
      AsignarDatos(
      qryClienteStdcodigo_Cte.AsString,
      '',
      qryClienteStdRNC_PROVEEDOR.Value,
      qryClienteStdDESCRIPCION.Value,
      qryClienteStdTELEFONO.Value,'');
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
    if Not qryPrestamos.Locate('RNC_PROVEEDOR',Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    dbgrid1.Visible:=False else  dbgrid1.Visible:=True;
  end else if RadioGroup1.ItemIndex = 2 then
  begin
    if not qryPrestamos.Locate('DESCRIPCION',Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    dbgrid1.Visible:=False else  dbgrid1.Visible:=True;
  end{  else if RadioGroup1.ItemIndex = 3 then
  begin
    if not qryPrestamos.Locate('nombre',Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    dbgrid1.Visible:=False else  dbGrid1.Visible:=True;
  end} else if RadioGroup1.ItemIndex = 3 then
  begin
    if not qryPrestamos.Locate('NOMBRE_ABR',Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    dbgrid1.Visible:=False else  dbGrid1.Visible:=True;
  end else if RadioGroup1.ItemIndex = 4 then
  begin
    if not qryPrestamos.Locate('TELEFONO',Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    dbgrid1.Visible:=False else  dbGrid1.Visible:=True;
  end else if RadioGroup1.ItemIndex = 5 then
  begin
    if not qryPrestamos.Locate('Apodo',Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    dbgrid1.Visible:=False else  dbGrid1.Visible:=True;
  end;
  Edit1Enter(Self);
  if frmProcBuscarProv.Showing then
  Edit1.SetFocus;
  if dbGrid1.Visible then
  begin
    //xSerie := qryPrestamosSERIE.Value;
    CodigoCliente:=qryPrestamosCodigo_cte.Value;
    xCedula:=qryPrestamosRNC_PROVEEDOR.Value;
    AsignarDatos(qryPrestamoscodigo_cte.AsString,
                 '',
                 qryPrestamosRNC_PROVEEDOR.Value,
                 qryPrestamosDESCRIPCION.Value,
                 qryPrestamosTELEFONO.Value,''
                 {qryPrestamosAPODO.Value});
  end else
  if dbGrid2.Visible then
  begin
    //xSerie := qryClienteStdSERIE.Value;
    codigoCliente:=qryClienteStdCodigo_cte.Value;
    xCedula := qryClienteStdRNC_PROVEEDOR.Value;
    AsignarDatos(qryClienteStdcodigo_Cte.AsString,'',
    qryClienteStdRNC_PROVEEDOR.Value,
    qryClienteStdDESCRIPCION.Value,
    qryClienteStdTELEFONO.Value,'');
    //qryClienteStdAPODO.Value);
  end;
end;

procedure TfrmProcBuscarProv.Edit1Enter(Sender: TObject);
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

procedure TfrmProcBuscarProv.Button1Click(Sender: TObject);
begin
  qryPrestamos.Filtered := False;
  if RadioGroup1.ItemIndex = 0 then
  begin
    if Not qryPrestamos.Locate('CODIGO_CTE', StrToInt(Edit1.Text),[loCaseInsensitive,loPartialKey]) then
    MessageDlg('Código no encontrado', mtInformation, [mbOK], 0);
  end else if RadioGroup1.ItemIndex = 0 then
  begin
    if Not qryPrestamos.Locate('codigo_cte',Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    MessageDlg('Codigo cliente no encontrado', mtInformation, [mbOK], 0);
  end else if RadioGroup1.ItemIndex = 1 then
  begin
    if Not qryPrestamos.Locate('RNC_PROVEEDOR',Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    MessageDlg('Cédula no encontrada',mtInformation, [mbOK], 0);
  end else if RadioGroup1.ItemIndex = 2 then
  begin
    if Not qryPrestamos.Locate('DESCRIPCION',Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    MessageDlg('Nombre no encontrado',mtInformation, [mbOK], 0);
  end else if RadioGroup1.ItemIndex = 3 then
  begin
    if Not qryPrestamos.Locate('NOMBRE_ABR',Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    MessageDlg('NOMBRE_ABR no encontrado',mtInformation, [mbOK], 0);
  end else if RadioGroup1.ItemIndex = 4 then
  begin
    if Not qryPrestamos.Locate('TELEFONO',Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    MessageDlg('Telefono no encontrado',mtInformation, [mbOK], 0);
  end;
end;

procedure TfrmProcBuscarProv.chkBoxFiltrarExit(Sender: TObject);
begin
  if not chkBoxFiltrar.Checked then
  begin
    DBGrid1.DataSource:=dsqryPrestamos;
    Exit;
  end;
end;

procedure TfrmProcBuscarProv.DBGrid1Exit(Sender: TObject);
begin
  if DBGrid1.DataSource = dsqryPrestamos then
  begin
    xCodigoCte   := qryPrestamosCODIGO_Cte.Value;
    CodigoCliente:= qryPrestamosCodigo_cte.Value;
    //xSerie       := qryPrestamosSERIE.Value;
    xCedula      := qryPrestamosRNC_PROVEEDOR.Value;
  end else
  if qryClienteStd.RecordCount > 0 then
  begin
    xCodigoCte:= qryClienteStd.Fieldbyname('codigo_cte').Value;
    CodigoCliente:= qryClienteStdCodigo_cte.Value;
    //xSerie       := qryClienteStdSERIE.Value;
    xCedula      := qryClienteStdRNC_PROVEEDOR.Value;
    //if not qryClienteStd.Fieldbyname('NUMERO_cks').IsNull then
    //Numerocks := qryClienteStd.Fieldbyname('NUMERO_cks').AsInteger;
  end;
end;

procedure TfrmProcBuscarProv.AsignarSqlText(Campo : String; Valor : String; OrderBy : String);
begin
  if qryClienteStd.Active then
  qryClienteStd.close;
  qryClienteStd.Database:= dmConectar.IBDatabase1;
  qryClienteStd.SQL.Text:=
  Format(IBQuery1.Text +
  ' WHERE UPPER(%s) like %s %s',[Campo, Valor, OrderBy]);
end;

procedure TfrmProcBuscarProv.AsignarDatos(numhist, nss,cedula,nombre,telefono,apodo:String);
begin
  Panel4.Visible:=True;
  LabelNumHist.Caption := numhist;
  labelNSS.Caption     := nss;
  labelCedula.Caption  := cedula;
  LabelNombre.Caption  := nombre;
  LabelTelefono.Caption:= telefono;
  LabelApodo.Caption   := apodo
end;

procedure TfrmProcBuscarProv.LabelNumHistClick(Sender: TObject);
begin
  edit1.Text:=LabelNumHist.Caption;
  RadioGroup1.ItemIndex:=0;
end;

procedure TfrmProcBuscarProv.labelNSSClick(Sender: TObject);
begin
  edit1.Text:=labelNSS.Caption;
  RadioGroup1.ItemIndex:=1;
end;

procedure TfrmProcBuscarProv.labelCedulaClick(Sender: TObject);
begin
  edit1.Text:=labelCedula.Caption;
    RadioGroup1.ItemIndex:=1;
end;

procedure TfrmProcBuscarProv.LabelNombreClick(Sender: TObject);
begin
  edit1.Text:=LabelNombre.Caption;
    RadioGroup1.ItemIndex:=2;
end;

procedure TfrmProcBuscarProv.LabelTelefonoClick(Sender: TObject);
begin
  edit1.Text:=LabelTelefono.Caption;
    RadioGroup1.ItemIndex:=4;
end;

procedure TfrmProcBuscarProv.LabelApodoClick(Sender: TObject);
begin
  edit1.Text:=LabelApodo.Caption;
  RadioGroup1.ItemIndex:=5;
end;

procedure TfrmProcBuscarProv.DBGrid2Exit(Sender: TObject);
begin
  if DBGrid2.DataSource = dsqryPrestamos then
  begin
    xCodigoCte   := qryPrestamosCODIGO_cte.Value;
    CodigoCliente:= qryPrestamosCodigo_cte.Value;
    //xSerie       := qryPrestamosSERIE.Value;
    xCedula      := qryPrestamosRNC_PROVEEDOR.Value;
  end else
  if qryClienteStd.RecordCount > 0 then
  begin
    xCodigoCte:= qryClienteStd.Fieldbyname('codigo_cte').Value;
    CodigoCliente:= qryClienteStdCodigo_cte.Value;
    //xSerie       := qryClienteStdSERIE.Value;
    xCedula      := qryClienteStdRNC_PROVEEDOR.Value;
    //if not qryClienteStd.Fieldbyname('NUMERO_cks').IsNull then
    //Numerocks := qryClienteStd.Fieldbyname('NUMERO_cks').AsInteger;
  end;
end;

procedure TfrmProcBuscarProv.DBGrid2CellClick(Column: TColumn);
begin
  if dbGrid1.Visible then
  begin
    //xSerie := qryPrestamosSERIE.Value;
    CodigoCliente:=qryPrestamosCodigo_Cte.Value;
    xCedula:=qryPrestamosRNC_PROVEEDOR.Value;
    AsignarDatos(qryPrestamoscodigo_cte.AsString,
                 '',
                 qryPrestamosRNC_PROVEEDOR.Value,
                 qryPrestamosDESCRIPCION.Value,
                 qryPrestamosTELEFONO.Value,''
                 {qryPrestamosAPODO.Value});
  end else
  if dbGrid2.Visible then
  begin
    //xSerie := qryClienteStdSERIE.Value;
    codigoCliente:=qryClienteStdCodigo_cte.Value;
    xCedula := qryClienteStdRNC_PROVEEDOR.Value;
    AsignarDatos(qryClienteStdcodigo_cte.AsString,'',
    qryClienteStdRNC_PROVEEDOR.Value,
    qryClienteStdDESCRIPCION.Value,
    qryClienteStdTELEFONO.Value,'');
    //qryClienteStdAPODO.Value);
  end;

end;

procedure TfrmProcBuscarProv.DBGrid1CellClick(Column: TColumn);
begin
  if dbGrid1.Visible then
  begin
    //xSerie := qryPrestamosSERIE.Value;
    CodigoCliente:=qryPrestamosCodigo_cte.Value;
    xCedula:=qryPrestamosRNC_PROVEEDOR.Value;
    AsignarDatos(qryPrestamoscodigo_cte.AsString,
                 '',
                 qryPrestamosRNC_PROVEEDOR.Value,
                 qryPrestamosDESCRIPCION.Value,
                 qryPrestamosTELEFONO.Value,''
                 {qryPrestamosAPODO.Value});
  end else
  if dbGrid2.Visible then
  begin
    //xSerie := qryClienteStdSERIE.Value;
    codigoCliente:=qryClienteStdCodigo_cte.Value;
    xCedula := qryClienteStdRNC_PROVEEDOR.Value;
    AsignarDatos(qryClienteStdcodigo_cte.AsString,'',
    '',
    qryClienteStdDESCRIPCION.Value,
    qryClienteStdTELEFONO.Value,'');
    //qryClienteStdAPODO.Value);
  end;

end;

procedure TfrmProcBuscarProv.MaestroCliente1Click(Sender: TObject);
begin
  frmProveedores:=TfrmProveedores.Create(Self);
  try
    frmProveedores.ShowModal;
  finally
  frmProveedores.Free;
  frmProveedores:=Nil;
  end;
  qryPrestamos.Close;
  qryPrestamos.Open;
  qryPrestamos.Filtered:=False;
  xCodigoCte:=0;
end;

procedure TfrmProcBuscarProv.qryPrestamosAfterScroll(DataSet: TDataSet);
begin
  xCodigoCte   := qryPrestamosCODIGO_Cte.Value;
end;

end.
