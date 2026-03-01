unit UFormConsServXTipoBuscar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFormConsServXTipo, DB, Grids, DBGrids, RXDBCtrl,
  IBCustomDataSet, IBQuery, WinSkinData, StdCtrls, ExtCtrls, Mask,
  rxToolEdit, Buttons, EditNew;

type
  TfrmListadoServXTipoBuscar = class(TfrmListadoServXTipo)
    RxDBGrid1: TRxDBGrid;
    DataSource1: TDataSource;
    BitBtn3: TBitBtn;
    edtBuscar: TEditN;
    Label1: TLabel;
    chkBoxFiltrar: TCheckBox;
    procedure edtBuscarChange(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure chkBoxFiltrarClick(Sender: TObject);
    
  private
    { Private declarations }
    procedure AbrirDatos;
  public
    { Public declarations }
  end;

var
  frmListadoServXTipoBuscar: TfrmListadoServXTipoBuscar;

implementation

{$R *.dfm}

{ TfrmListadoServXTipoBuscar }

procedure TfrmListadoServXTipoBuscar.AbrirDatos;
var
  orderByText : string;
  strCond : String;
begin

  case rdgTipoOpe.ItemIndex of
  0:begin
      strCond := ' and r.tipo_ope = 1 ';
    end;
  1:begin
       strCond := ' and r.tipo_ope = 2 ';
    end;
  2:begin
      strCond := ' and r.tipo_ope = 3 ';
    end;
  end;

  Case rdgFecha.ItemIndex Of
  0:begin
      strCond := strCond + ' And r.fecha Between '+chr(39)+
      FormatDateTime('mm/dd/yyyy', edtFechaIni.Date)+chr(39)+
      ' and ' +chr(39)+
      FormatDateTime('mm/dd/yyyy', edtFechaFin.Date)+chr(39);
    end;
  1:begin
      strCond := strCond + ' And r.fecha_Entrada Between '+chr(39)+
      FormatDateTime('mm/dd/yyyy', edtFechaIni.Date)+chr(39)+
      ' and ' +chr(39)+
      FormatDateTime('mm/dd/yyyy', edtFechaFin.Date)+chr(39);
    end;
  2:begin
      strCond := strCond + ' And r.FECHA_ENT_ESTIMADA Between '+chr(39)+
      FormatDateTime('mm/dd/yyyy', edtFechaIni.Date)+chr(39)+
      ' and ' +chr(39)+
      FormatDateTime('mm/dd/yyyy', edtFechaFin.Date)+chr(39);
    end;
  end;
  case rdgRecibidos.ItemIndex of
  0:begin
      strCond := strCond + ' And r.fecha_Entrada is not null ';
    end;
  1:begin
       strCond := strCond + ' And r.fecha_Entrada is  null ';
    end;
  end;
  qryStatusAlquilerMaster.SQL.Text := qryStatusAlquiler_Base.SQL.Text +
  strCond + 
  ' Order By R.TIPO_OPE, r.COD_CLIENTE, r.idserie desc';

  qryStatusAlquilerMaster.Open;
end;

procedure TfrmListadoServXTipoBuscar.edtBuscarChange(Sender: TObject);
begin
  //inherited;
  if chkBoxFiltrar.Checked then
  begin
    qryStatusAlquilerMaster.Close;
    qryStatusAlquilerMaster.SQL.Text := qryStatusAlquiler_Base.SQL.Text +
    ' and UPPER(c.NOMBRE_CTE) like '+Chr(39)+'%'+UpperCase(edtbuscar.Text)+'%'+Chr(39);
    qryStatusAlquilerMaster.Open;
  end else
  begin
    qryStatusAlquilerMaster.Locate('NOMBRE_CTE',edtBuscar.Text,[loPartialKey,loCaseInsensitive]);
  end;
end;

procedure TfrmListadoServXTipoBuscar.BitBtn3Click(Sender: TObject);
begin
  //inherited;
  AbrirDatos;
end;

procedure TfrmListadoServXTipoBuscar.chkBoxFiltrarClick(Sender: TObject);
begin
  //inherited;
  if not chkBoxFiltrar.Checked then
  AbrirDatos;
end;

end.
