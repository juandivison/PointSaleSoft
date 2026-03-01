unit UFormRepEquipos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, WinSkinData, DB, IBCustomDataSet, IBQuery,
  ExtCtrls, Grids, DBGrids, RxDBCtrl;

type
  TfrmReporteEquipos = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    cboxClientes: TComboBox;
    rdgEstatus: TRadioGroup;
    chkBoxtodo: TCheckBox;
    rdgOrdenarPor: TRadioGroup;
    rdgOrden: TRadioGroup;
    qryClientes: TIBQuery;
    SkinData1: TSkinData;
    BitBtn3: TBitBtn;
    dsqryClientes: TDataSource;
    qryClientesCODIGO_CTE: TIntegerField;
    qryClientesNOMBRE_FACTURAR: TIBStringField;
    BitBtn4: TBitBtn;
    RxDBGrid1: TRxDBGrid;
    qryRepEquiposBase: TIBQuery;
    dsqryRepEquipos: TDataSource;
    BitBtn37: TBitBtn;
    qryEmpleado: TIBQuery;
    qryEmpleadoNOMBREVENDEDOR: TIBStringField;
    qryEmpleadoCODIGO: TIntegerField;
    Label2: TLabel;
    cboxEmpleado: TComboBox;
    BitBtn5: TBitBtn;
    Label3: TLabel;
    edtSerieEquipo: TEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn37Click(Sender: TObject);
    procedure cboxClientesChange(Sender: TObject);
    procedure cboxEmpleadoChange(Sender: TObject);
    procedure edtSerieEquipoChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReporteEquipos: TfrmReporteEquipos;
  _buscarSerie : boolean;
  
implementation

uses UDatModReportes, UQckRepEquipos, UGlobal, UBuscarClientesPersonasP;

{$R *.dfm}

procedure TfrmReporteEquipos.BitBtn1Click(Sender: TObject);
begin
  dmReportes.qryRepEquipos.Close;
  dmreportes.qryRepEquipos.Open;
  qckRepEquipos:=TqckRepEquipos.Create(nil);
  try
    qckRepEquipos.Preview;
  finally
  qckRepEquipos.free;
  qckRepEquipos:=nil;
  end;
end;

procedure TfrmReporteEquipos.BitBtn3Click(Sender: TObject);
begin
  FrmBuscarClientesPersonas:=TFrmBuscarClientesPersonas.Create(nil);
  try
    FrmBuscarClientesPersonas.CodigoCliente := -1;
    if FrmBuscarClientesPersonas.Showmodal = mrOk then
    begin
      qryClientes.Locate('CODIGO_CTE',FrmBuscarClientesPersonas.CodigoCliente,[]);
      cboxClientes.Text:=qryClientesNOMBRE_FACTURAR.Value;
    end;
  finally
  FrmBuscarClientesPersonas.Free;
  FrmBuscarClientesPersonas:=Nil;
  end;
end;

procedure TfrmReporteEquipos.FormCreate(Sender: TObject);
begin
  qryClientes.Close;
  qryClientes.Params[0].Value:= glbCia_Key;
  qryClientes.Open;
  cboxClientes.Items.Clear;
  qryClientes.first;
  while not qryClientes.eof do
  begin
    cboxClientes.Items.Add(qryClientesNOMBRE_FACTURAR.Value);
    qryClientes.Next;
  end;
  qryClientes.First;
  cboxClientes.Text:=qryClientesNOMBRE_FACTURAR.Value;
  cboxClientesChange(Self);

  qryEmpleado.Close;
  qryEmpleado.Open;
  cboxEmpleado.Items.Clear;
  qryEmpleado.first;
  while not qryEmpleado.eof do
  begin
    cboxEmpleado.Items.Add(qryEmpleadoNOMBREVENDEDOR.Value);
    qryEmpleado.Next;
  end;
  qryEmpleado.First;
  cboxEmpleado.Text:=qryEmpleadoNOMBREVENDEDOR.Value;
  cboxEmpleadoChange(Self); 
end;

procedure TfrmReporteEquipos.BitBtn4Click(Sender: TObject);
var
  strCond : String;
begin
  if not _buscarSerie then
  edtSerieEquipo.Text:='';
  qryRepEquiposBase.SQL.Text;
  strCond:='';
  case rdgEstatus.ItemIndex of
  0:begin  //disponible
      strCond:=' Where s.STATUS_EQUIPO = 1';
    end;
  1:begin  //asignado
      strCond:=' Where s.STATUS_EQUIPO = 2';
    end;
  2:begin  //RMA
      strCond:=' Where s.STATUS_EQUIPO = 3';
    end;
  3:begin  //Cliente
     if not chkBoxtodo.Checked then
      strCond:=' Where c.CODIGO_CTE = '+qryClientesCODIGO_CTE.AsString;
    end;
  4:begin //Técnico
      if not chkBoxtodo.Checked then
      strCond:=' Where r.codigo_tecnico = '+qryEmpleadoCODIGO.AsString;
    end;
  5:begin //Todo
      strCond:='';
    end;
  end;
  if (edtSerieEquipo.Text <> '') then
  begin
    strCond:=' Where upper(s.serie) like '+chr(39)+'%'+UpperCase(edtSerieEquipo.Text)+'%'+chr(39);
  end;

  case rdgOrdenarPor.ItemIndex of
  0:begin   //Estatus
      strCond:=strCond + ' order by s.STATUS_EQUIPO';
    end;
  1:begin   //Cliente
      strCond:=strCond + ' order by c.CODIGO_CTE';
    end;
  2:begin   //Producto
      strCond:=strCond + ' order by i.CODIGO';
    end;
  3:begin   //Fecha
      strCond:=strCond + ' order by r.codigo_tecnico';
    end;
  4:begin   //Fecha
      strCond:=strCond + ' order by i.FECHA';
    end;
  end;

    case rdgOrden.ItemIndex of
  0:begin
      strCond:=strCond + ' ';
    end;
  1:begin
       strCond:=strCond + ' DESC';
    end;
  end;
  dmReportes.qryRepEquipos.close;
  dmReportes.qryRepEquipos.SQL.Text:=
  qryRepEquiposBase.SQL.Text + strCond;
  dmReportes.qryRepEquipos.Open;
end;

procedure TfrmReporteEquipos.BitBtn37Click(Sender: TObject);
begin
  GLBMostrarArchivo:=True;
  ExporToExcel(dmReportes.qryRepEquipos, ExtractFilePath(Application.ExeName)+
  'Informes\RelacionEquipos_'+
  FormatDateTime('ddmmyyyy',now),true);
  GLBMostrarArchivo:=False;
end;

procedure TfrmReporteEquipos.cboxClientesChange(Sender: TObject);
begin
  qryClientes.Locate('NOMBRE_FACTURAR', cboxClientes.Text,[loCaseInsensitive,loPartialKey]);
end;

procedure TfrmReporteEquipos.cboxEmpleadoChange(Sender: TObject);
begin
  qryEmpleado.Locate('NOMBREVENDEDOR', cboxEmpleado.Text,[loCaseInsensitive,loPartialKey]);
end;

procedure TfrmReporteEquipos.edtSerieEquipoChange(Sender: TObject);
begin
  _buscarSerie:=True;
  BitBtn4Click(Self);
  _buscarSerie:=False;
end;

end.
