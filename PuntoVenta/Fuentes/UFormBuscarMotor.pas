unit UFormBuscarMotor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, RxDBCtrl, DB, IBCustomDataSet, IBQuery,
  StdCtrls, Buttons, ExtCtrls, RxCtrls, WinSkinData;

type
  TfrmBuscarMotor = class(TForm)
    RadioGroup1: TRadioGroup;
    lblBuscarPor: TLabel;
    edtValue: TEdit;
    BitBtn1: TBitBtn;
    qryMotoresEntrada: TIBQuery;
    qryMotoresEntradaNUMERO: TIntegerField;
    qryMotoresEntradaTIPO: TSmallintField;
    qryMotoresEntradaFECHA_INGRESO: TDateTimeField;
    qryMotoresEntradaCHASIS: TIBStringField;
    qryMotoresEntradaCOLOR: TIBStringField;
    qryMotoresEntradaMODELO: TIBStringField;
    qryMotoresEntradaMATRICULA: TIBStringField;
    qryMotoresEntradaPLACA: TIBStringField;
    qryMotoresEntradaSTATUS: TIBStringField;
    qryMotoresEntradaCOD_USUARIO: TIntegerField;
    qryMotoresEntradaFECHA_IN: TDateTimeField;
    qryMotoresEntradaIN_POR: TIBStringField;
    qryMotoresEntradaFECHA_UPD: TDateTimeField;
    qryMotoresEntradaUPD_POR: TIBStringField;
    qryMotoresEntradaNOMBRECLIENTE: TIBStringField;
    qryMotoresEntradaFECHA_ASIGNADO: TDateTimeField;
    qryMotoresEntradaBase: TIBQuery;
    dsqryMotoresEntrada: TDataSource;
    RxDBGrid1: TRxDBGrid;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    SkinData1: TSkinData;
    DBStatusLabel1: TDBStatusLabel;
    qryMotoresEntradaYEAR_FAB: TIntegerField;
    qryMotoresEntradaDESCRIPCION: TIBStringField;
    qryMotoresEntradaIDNUMEROVEH: TIntegerField;
    qryMotoresEntradaCODIGO_PROD: TIntegerField;
    qryMotoresEntradaCODIGO_CTE_ANT: TIntegerField;
    qryMotoresEntradaCODIGO_CTE: TIntegerField;
    procedure RadioGroup1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure edtValueChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    _Tipo : integer;
    _Vendidos : boolean;
    EsVenta : smallint;
    CodProd : Integer;
  end;

var
  frmBuscarMotor: TfrmBuscarMotor;

implementation
  uses Uglobal, UDatModVehiculo;
{$R *.dfm}

procedure TfrmBuscarMotor.RadioGroup1Click(Sender: TObject);
begin
  case RadioGroup1.ItemIndex of
  0:begin
      lblBuscarPor.Caption:='Entre Matrícula';
  end;
  1:begin
      lblBuscarPor.Caption:='Entre Placa';
  end;
  2:begin
      lblBuscarPor.Caption:='Entre Chasis';
  end;
  3:begin
      lblBuscarPor.Caption:='Entre Modelo';
  end;
  4:begin
      lblBuscarPor.Caption:='Entre Color';
  end;
  5:begin
      lblBuscarPor.Caption:='Entre Nomb Cliente';
      BitBtn1Click(Self);
  end;
  6:begin
      lblBuscarPor.Caption:='Mostrando todos';
      BitBtn1Click(Self);
  end;
  end;
end;

procedure TfrmBuscarMotor.BitBtn1Click(Sender: TObject);
var
  _strCond : string;
begin
  if _Vendidos then 
  _strCond:= ' (d.CODIGO_CTE > 0) and '
  else _strCond:= '';
  
  case RadioGroup1.ItemIndex of
  0:begin
      //lblBuscarPor.Caption:='Entre Matrícula';
      qryMotoresEntrada.Close;
      qryMotoresEntrada.SQL.Clear;
      qryMotoresEntrada.SQL.Text:= qryMotoresEntradaBase.SQL.Text+
      ' Where '+_strCond+'(tipo = '+IntToStr(_tipo)+ ') and  Upper(Matricula) Like '+chr(39)+'%'+UpperCase(edtValue.Text)+'%'+chr(39);
      qryMotoresEntrada.Open;
  end;
  1:begin
      //lblBuscarPor.Caption:='Entre Placa';
      qryMotoresEntrada.Close;
      qryMotoresEntrada.SQL.Clear;
      qryMotoresEntrada.SQL.Text:= qryMotoresEntradaBase.SQL.Text+
      ' Where '+_strCond+' (tipo = '+IntToStr(_tipo)+ ') and  Upper(Placa) Like '+chr(39)+'%'+UpperCase(edtValue.Text)+'%'+chr(39);
      qryMotoresEntrada.Open;
  end;
  2:begin
      //lblBuscarPor.Caption:='Entre Chasis';
      qryMotoresEntrada.Close;
      qryMotoresEntrada.SQL.Clear;
      qryMotoresEntrada.SQL.Text:= qryMotoresEntradaBase.SQL.Text+
      ' Where '+_strCond+'  (tipo = '+IntToStr(_tipo)+ ') and  Upper(Chasis) Like '+chr(39)+'%'+UpperCase(edtValue.Text)+'%'+chr(39);
      qryMotoresEntrada.Open;
  end;
  3:begin
      //lblBuscarPor.Caption:='Entre Modelo';
      qryMotoresEntrada.Close;
      qryMotoresEntrada.SQL.Clear;
      qryMotoresEntrada.SQL.Text:= qryMotoresEntradaBase.SQL.Text+
      ' Where '+_strCond+' (tipo = '+IntToStr(_tipo)+ ') and  Upper(Modelo) Like '+chr(39)+'%'+UpperCase(edtValue.Text)+'%'+chr(39);
      qryMotoresEntrada.Open;
  end;
  4:begin
      //lblBuscarPor.Caption:='Entre Color';
      qryMotoresEntrada.Close;
      qryMotoresEntrada.SQL.Clear;
      qryMotoresEntrada.SQL.Text:= qryMotoresEntradaBase.SQL.Text+
      ' Where '+_strCond+' (tipo = '+IntToStr(_tipo)+ ') and  Upper(Color) Like '+chr(39)+'%'+UpperCase(edtValue.Text)+'%'+chr(39);
      qryMotoresEntrada.Open;
  end;
  5:begin
      qryMotoresEntrada.Close;
      qryMotoresEntrada.SQL.Clear;
      qryMotoresEntrada.SQL.Text:= qryMotoresEntradaBase.SQL.Text+
      ' Where '+_strCond+' (tipo = '+IntToStr(_tipo)+ ') and  Upper(NOMBRECLIENTE) Like '+chr(39)+'%'+UpperCase(edtValue.Text)+'%'+chr(39);
      qryMotoresEntrada.Open;
  end;
  6:begin
      //Todo
     if _Vendidos then
     _strCond:= ' (d.CODIGO_CTE > 0) and '
     else _strCond:= '';
      qryMotoresEntrada.Close;
      qryMotoresEntrada.SQL.Clear;
      //ShowMessage('EsVenta: '+IntToStr(esVenta)+' CodProd: '+IntToStr(CodProd));
      If (EsVenta  = 1 ) and (CodProd > 0) then
      begin
      qryMotoresEntrada.SQL.Text:= qryMotoresEntradaBase.SQL.Text+
      ' Where '+_strCond+' tipo = '+IntToStr(_tipo) +
      ' and v.CODIGO_PROD = '+InttoStr(CodProd)+
      ' and (m.nombrecliente is null or m.nombrecliente ='+chr(39)+''+chr(39)+')';
       lblBuscarPor.Caption:='Vehículos filtrados';
      end
      else
      qryMotoresEntrada.SQL.Text:= qryMotoresEntradaBase.SQL.Text+
      ' Where '+_strCond+' tipo = '+IntToStr(_tipo);

      qryMotoresEntrada.Open;
  end;
  end;
end;

procedure TfrmBuscarMotor.edtValueChange(Sender: TObject);
begin
  BitBtn1Click(Self);
end;

procedure TfrmBuscarMotor.FormCreate(Sender: TObject);
begin
  _Vendidos:=False;
  _Tipo:=GlbTipoTransMotores;
  RadioGroup1Click(Self);
end;

procedure TfrmBuscarMotor.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (EsVenta = 1 ) then
  begin
    dmVehiculo.qryVerificaVeh.Close;
    dmVehiculo.qryVerificaVeh.Params[0].Value:=qryMotoresEntradaCHASIS.Value;
    dmVehiculo.qryVerificaVeh.Open;
    dmVehiculo.qryVerificaVeh.First;
    if dmVehiculo.qryVerificaVeh.RecordCount > 0 then
    begin
      MessageDlg('Vehículo/Motor ya está asignado en otra venta, verifique', mtinformation,[mbok],0);
      //CanClose:=False;
    end else CanClose:=True;
  end;
end;

end.
