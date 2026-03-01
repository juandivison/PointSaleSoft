unit UConsultaPrecio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, EditNew, DB, IBCustomDataSet, IBQuery,
  Buttons, ExtCtrls;

type
  TfrmConsultaPrecio = class(TForm)
    Label6: TLabel;
    qryProductos: TIBQuery;
    qryProductosCODIGO: TIntegerField;
    qryProductosCODIGO_TEXTO: TIBStringField;
    qryProductosCANTIDAD: TFloatField;
    qryProductosPRECIO_MINIMO: TFloatField;
    qryProductosPRECIO: TFloatField;
    qryProductosDESCRIPCION: TIBStringField;
    qryProductosREFERENCIA: TIBStringField;
    qryProductosINVENTARIAR: TSmallintField;
    qryProductosPAGA_ITBI: TSmallintField;
    dsqryProductos: TDataSource;
    BitBtn1: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    DBText2: TDBText;
    Label2: TLabel;
    Label3: TLabel;
    edtCodigo: TEditN;
    BitBtn2: TBitBtn;
    Shape1: TShape;
    DBText1: TDBText;
    DBText3: TDBText;
    Label4: TLabel;
    Label5: TLabel;
    DBText4: TDBText;
    BitBtn3: TBitBtn;
    CheckBox1: TCheckBox;
    BitBtn4: TBitBtn;
    procedure edtCodigoChange(Sender: TObject);
    procedure qryProductosAfterScroll(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure edtCodigoExit(Sender: TObject);
    procedure edtCodigoEnter(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
    procedure AsignarSqlText(campo:String; valor:string; OrderBy : String);
  public
    { Public declarations }
  end;

var
  frmConsultaPrecio: TfrmConsultaPrecio;
  BuscandoPorDesc: Boolean = false;
  Prod_existe    : Boolean = false;

implementation
uses UDatModConectar, UFormMostrarTodoInventario;
{$R *.dfm}

procedure TfrmConsultaPrecio.AsignarSqlText(campo, valor, OrderBy: String);
begin
  qryProductos.DisableControls;
  if qryProductos.Active then
  qryProductos.Close;
  if (campo = '') then
  begin
    qryProductos.SQL.Text:=
    'Select *  From INVENTARIO_PRODUCTO ' +
    'ORDER BY tipo,descripcion, Referencia, codigo';
  end else
  qryProductos.SQL.Text:=
  Format('Select *  From INVENTARIO_PRODUCTO ' +
        ' WHERE UPPER(%s) like %s ',[Campo, Valor]) +
        ' ORDER BY tipo,descripcion, Referencia, codigo';
  qryProductos.Open;
  qryProductos.EnableControls;
end;

procedure TfrmConsultaPrecio.edtCodigoChange(Sender: TObject);
  function esNumero(valor:String):Boolean;
  begin
    if (Valor[1] =  '0') or (Valor[1] =  '1') or (Valor[1] =  '2')
    or (Valor[1] =  '3') or (Valor[1] =  '4') or (Valor[1] =  '5')
    or (Valor[1] =  '6') or (Valor[1] =  '7')
    or (Valor[1] =  '8') or (Valor[1] =  '9') then
    result:= True else result:= False;
  end;
begin
  if not CheckBox1.Checked then exit;
  BuscandoPorDesc := False;
  Prod_existe := False;
  if edtCodigo.Text = '' then Exit;
  if esNumero(edtCodigo.Text) then
  begin
    AsignarSqlText('','','');
    if qryProductos.Locate('Codigo_Texto', edtCodigo.Text,[loCaseInsensitive, loPartialKey]) then
    begin
      panel1.Visible := True;
      panel1.BringToFront;
      Prod_existe  := True;
    end else
    panel1.Visible := false;
  end else
  begin
    BuscandoPorDesc := True;
    AsignarSqlText('descripcion',chr(39) + edtCodigo.Text +'%'+chr(39),'');
    if qryProductos.Locate('Descripcion', edtCodigo.Text,[loCaseInsensitive, loPartialKey]) then
    begin
      panel1.Visible := True;
      panel1.BringToFront;
      Prod_existe  := True;
    end  else
    panel1.Visible := false;
  end;
end;

procedure TfrmConsultaPrecio.qryProductosAfterScroll(DataSet: TDataSet);
begin
  if (qryProductosPAGA_ITBI.Value = 1) then
  Label3.Caption:='Sí'
  else
  Label3.Caption:='No';
end;

procedure TfrmConsultaPrecio.FormCreate(Sender: TObject);
begin
  qryProductos.Close;
  qryProductos.Open;
end;

procedure TfrmConsultaPrecio.edtCodigoExit(Sender: TObject);
 function esNumero(valor:String):Boolean;
  begin
    if (Valor[1] =  '0') or (Valor[1] =  '1') or (Valor[1] =  '2')
    or (Valor[1] =  '3') or (Valor[1] =  '4') or (Valor[1] =  '5')
    or (Valor[1] =  '6') or (Valor[1] =  '7')
    or (Valor[1] =  '8') or (Valor[1] =  '9') then
    result:= True else result:= False;
  end;
begin
  if CheckBox1.Checked then Exit;
  
  BuscandoPorDesc := False;
  Prod_existe := False;
  if edtCodigo.Text = '' then Exit;
  if esNumero(edtCodigo.Text) then
  begin
    AsignarSqlText('','','');
    if qryProductos.Locate('Codigo_Texto', edtCodigo.Text,[loCaseInsensitive, loPartialKey]) then
    begin
      panel1.Visible := True;
      panel1.BringToFront;
      Prod_existe  := True;
    end else
    panel1.Visible := false;
  end else
  begin
    BuscandoPorDesc := True;
    AsignarSqlText('descripcion',chr(39) + edtCodigo.Text +'%'+chr(39),'');
    if qryProductos.Locate('Descripcion', edtCodigo.Text,[loCaseInsensitive, loPartialKey]) then
    begin
      panel1.Visible := True;
      panel1.BringToFront;
      Prod_existe  := True;
    end  else
    panel1.Visible := false;
  end;
  if Prod_existe then
  begin
    edtCodigo.Text := qryProductoscodigo_texto.Value; 
  end;
  //if Not qryProductos.Locate('codigo_Texto', edtCodigo.Text,[]) then
  //begin
  //  Prod_existe:=False;
  //end;
end;

procedure TfrmConsultaPrecio.edtCodigoEnter(Sender: TObject);
begin
  edtCodigo.SelectAll;
end;

procedure TfrmConsultaPrecio.BitBtn2Click(Sender: TObject);
begin
  frmMostrarTodo:=TfrmMostrarTodo.Create(Nil);
  try
    frmMostrarTodo.Showmodal;
  finally
  frmMostrarTodo.Free;
  frmMostrarTodo:=Nil;
  end;
end;

end.
