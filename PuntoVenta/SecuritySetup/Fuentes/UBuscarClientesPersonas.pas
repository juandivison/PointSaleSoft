unit UBuscarClientesPersonas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBCtrls, Grids, DBGrids, ComCtrls, ExtCtrls, StdCtrls,
  Buttons, IBCustomDataSet, IBQuery, WinSkinData;

type
  TFrmBuscarClientesPersonas = class(TForm)
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
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure chkBoxFiltrarExit(Sender: TObject);
    procedure DBGrid1Exit(Sender: TObject);
  private
    { Private declarations }
    procedure AsignarSqlText(campo:string;valor:string);
  public
    { Public declarations }
    xCodigoCte:Integer;
  end;

var
  FrmBuscarClientesPersonas: TFrmBuscarClientesPersonas;
   Texto: String;
    qryClienteStd: TIBQuery;
implementation

uses UDatModContrato, UDatModCon, UContrato, UGlobal;

{$R *.dfm}

procedure TFrmBuscarClientesPersonas.FormCreate(Sender: TObject);
begin
  if dmContrato.QryCliente.State = dsInactive then
  dmContrato.QryCliente.Open;
  dmContrato.qryCliente.Filtered:=False;
  qryClienteStd:=TIBQuery.Create(Nil);
  xCodigoCte:=0;
end;

procedure TFrmBuscarClientesPersonas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Assigned(qryClienteStd) then
  begin
    qryClienteStd.Free;
    qryClienteStd:= Nil;
  end;
  Action:=CaFree;
end;

procedure TFrmBuscarClientesPersonas.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmBuscarClientesPersonas.DBGrid1DblClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmBuscarClientesPersonas.RadioGroup1Click(Sender: TObject);
var
  dsAnterio:String;
begin
  if not chkBoxFiltrar.Checked then
  DBGrid1.DataSource:=dmContrato.DSQryClientes;

  if chkBoxFiltrar.Checked and (RadioGroup1.ItemIndex > 0) then
  begin
    GlbCampoFilterCte:='';
    case RadioGroup1.ItemIndex of
    1: glbCampoFilterCte:='LICENCIA';
    2: glbCampoFilterCte:='CEDULA';
    3: glbCampoFilterCte:='PASAPORTE';
    4: glbCampoFilterCte:='NOMBRE';
    5: glbCampoFilterCte:='APELLIDO';
    6: glbCampoFilterCte:='Telefono_Local';
    end;
    if (Edit1.Text <> '') then
    glbValueFilterCte :=UpperCase(Edit1.Text);
    if (glbCampoFilterCte<>'')then
    begin
      AsignarSqlText(glbcampoFilterCte,chr(39) +'%'+GlbValueFilterCte+'%'+chr(39));
      Texto:= qryClienteStd.Text;
      if (GlbValueFilterCte <> '') then
      qryClienteStd.Open;
      DataSource1.DataSet:=qryClienteStd;
      DBGrid1.DataSource:=DataSource1;
      dmContrato.QryCliente.Filtered:=False;
      Exit;
    end;
  end;

  dmContrato.QryCliente.Filtered:=False;
  if RadioGroup1.ItemIndex = 0 then
  begin
    if Edit1.Text = '' then Exit;
    if Not dmContrato.QryCliente.Locate('CODIGO',StrToInt(Edit1.Text),[loCaseInsensitive,loPartialKey]) then
    dbgrid1.Visible:=False else  dbgrid1.Visible:=True;
  end else if RadioGroup1.ItemIndex = 1 then
  begin
    if Not dmContrato.QryCliente.Locate('LICENCIA',Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    dbgrid1.Visible:=False else  dbgrid1.Visible:=True;
  end else if RadioGroup1.ItemIndex = 2 then
  begin
    if not dmContrato.QryCliente.Locate('CEDULA',Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    dbgrid1.Visible:=False else  dbgrid1.Visible:=True;
  end  else if RadioGroup1.ItemIndex = 3 then
  begin
    if not dmContrato.QryCliente.Locate('PASAPORTE',Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    dbgrid1.Visible:=False else  dbGrid1.Visible:=True;
  end else if RadioGroup1.ItemIndex = 4 then
  begin
    if not dmContrato.QryCliente.Locate('NOMBRE',Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    dbgrid1.Visible:=False else  dbGrid1.Visible:=True;
  end else if RadioGroup1.ItemIndex = 5 then
  begin
    if not dmContrato.QryCliente.Locate('APELLIDO',Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    dbgrid1.Visible:=False else  dbGrid1.Visible:=True;
  end else if RadioGroup1.ItemIndex = 6 then
  begin
    if not dmContrato.QryCliente.Locate('TELEFONO_LOCAL',Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    dbgrid1.Visible:=False else  dbGrid1.Visible:=True;
  end;
  Edit1Enter(Self);
  Edit1.SetFocus;
end;

procedure TFrmBuscarClientesPersonas.Edit1Enter(Sender: TObject);
begin
  Case RadioGroup1.ItemIndex of
  0:begin
      Label2.Caption := RadioGroup1.Items.Names[0];
    end;
  1:begin
      Label2.Caption := RadioGroup1.Items.Names[1];
    end;
  2:begin
      Label2.Caption := RadioGroup1.Items.Names[2];
    end;
  3:begin
      Label2.Caption := RadioGroup1.Items.Names[3];
    end;
  4:begin
      Label2.Caption := RadioGroup1.Items.Names[4];
    end;
  5:begin
      Label2.Caption := RadioGroup1.Items.Names[5];
    end;
  6:begin
      Label2.Caption := RadioGroup1.Items.Names[6];
    end;
  end;
end;

procedure TFrmBuscarClientesPersonas.Button1Click(Sender: TObject);
begin
  dmContrato.QryCliente.Filtered:=False;
  if RadioGroup1.ItemIndex = 0 then
  begin
    if Not dmContrato.QryCliente.Locate('CODIGO',StrToInt(Edit1.Text),[loCaseInsensitive,loPartialKey]) then
    MessageDlg('Código Cliente no encontrado',mtInformation, [mbOK], 0);
  end else if RadioGroup1.ItemIndex = 1 then
  begin
    if Not dmContrato.QryCliente.Locate('LICENCIA',Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    MessageDlg('Licencia Cliente no encontrado',mtInformation, [mbOK], 0);
  end else if RadioGroup1.ItemIndex = 2 then
  begin
    if Not dmContrato.QryCliente.Locate('CEDULA',Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    MessageDlg('Cédula Cliente no encontrado',mtInformation, [mbOK], 0);
  end else if RadioGroup1.ItemIndex = 3 then
  begin
    if Not dmContrato.QryCliente.Locate('PASAPORTE',Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    MessageDlg('Pasaporte Cliente no encontrado',mtInformation, [mbOK], 0);
  end else if RadioGroup1.ItemIndex = 4 then
  begin
    if Not dmContrato.QryCliente.Locate('Nombre',Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    MessageDlg('Nombre Cliente no encontrado',mtInformation, [mbOK], 0);
  end else if RadioGroup1.ItemIndex = 5 then
  begin
    if Not dmContrato.QryCliente.Locate('Apellido',Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    MessageDlg('Apellido no encontrado',mtInformation, [mbOK], 0);
  end else if RadioGroup1.ItemIndex = 6 then
  begin
    if Not dmContrato.QryCliente.Locate('Telefono_Local',Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    MessageDlg('Telefono cliente no encontrado',mtInformation, [mbOK], 0);
  end;
end;

procedure TFrmBuscarClientesPersonas.chkBoxFiltrarExit(Sender: TObject);
begin
  if not chkBoxFiltrar.Checked then
  begin
    DBGrid1.DataSource:=dmContrato.DSQryClientes;
    Exit;
  end;
end;

procedure TFrmBuscarClientesPersonas.DBGrid1Exit(Sender: TObject);
begin
  if DBGrid1.DataSource = dmContrato.DSQryClientes then
  xCodigoCte:= dmContrato.qryClienteCODIGO.Value
  else
  xCodigoCte:= qryClienteStd.fieldbyname('CODIGO').Value;
end;

procedure TFrmBuscarClientesPersonas.AsignarSqlText(campo:string;valor:string);
begin
  if qryClienteStd.Active then
  qryClienteStd.close;
  qryClienteStd.Database:= dmcon.IBDatabase1;
  qryClienteStd.SQL.Text:=
  Format(
  'SELECT '+
  'C.CODIGO, '+
  'C.NOMBRE_EMPRESA, '+
  'C.LIMITE_CREDITO, '+
  'C.NOMBRE, '+
  'C.LICENCIA, '+
  'C.CEDULA, '+
  'C.status_cliente, '+
  'C.FECHA_VENCE_LICENCIA, '+
  'C.PASAPORTE,C.FECHA_VENCE_PASAPORTE,C.TIPO_CLIENTE, '+
  'T.DESCRIPCION DESC_TIPOCLIENTE,RNC, '+
  'APELLIDO,CIUDAD,TELEFONO_LOCAL,DIRECCION_REAL, '+
  'OTRO_TELEFONO,DIRECCION_LOCAL,REFERENCIA, '+
  'TELEF_REFERENCIA,C.NOMBRE||" "||C.APELLIDO NOMBRECOMPLETO, '+
  'C.observacion '+
  'From CLIENTES C, TIPO_CLIENTE T '+
  'WHERE C.TIPO_CLIENTE = T.CODIGO  '+
  'and UPPER(%s) like %s',[campo,valor]);
end;

end.
