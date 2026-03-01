unit UConsultaDepreciacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, Grids, DBGrids, RXDBCtrl,
  WinSkinData;

type
  TfrmConsultaDepreciacion = class(TForm)
    RxDBGrid1: TRxDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    dtpkfechaIni: TDateTimePicker;
    dtpkfechafin: TDateTimePicker;
    BitBtn1: TBitBtn;
    ComboBox1: TComboBox;
    Label3: TLabel;
    CheckBox1: TCheckBox;
    SkinData1: TSkinData;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure ComboBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaDepreciacion: TfrmConsultaDepreciacion;
  _codigotipoActivo : integer;

implementation

uses UDatModuloActivos, UGlobalActivos;

{$R *.dfm}

procedure TfrmConsultaDepreciacion.BitBtn1Click(Sender: TObject);
begin
  dm.qryNombreActivo.close;
  dm.qryNombreActivo.open;
  dm.tTipoActivos.Close;
  dm.tTipoActivos.Filtered:=false;
  dm.tTipoActivos.Open;
  dm.tTipoActivos.First;

  dm.qryDepreciacionCons.Close;
  dm.qryDepreciacionCons.Filtered:=False;
  dm.qryDepreciacionCons.Params[0].Value := ExtraerFecha(dtpkfechaIni.Datetime);
  dm.qryDepreciacionCons.Params[1].Value := ExtraerFecha(dtpkfechafin.Datetime);
  if CheckBox1.Checked then
  begin
    dm.qryDepreciacionCons.Params[2].Value := 0;
    dm.qryDepreciacionCons.Params[3].Value := 3000;
  end else
  begin
    ComboBox1Change(Self);
    dm.qryDepreciacionCons.Params[2].Value := _codigotipoActivo;
    dm.qryDepreciacionCons.Params[3].Value := _codigotipoActivo;    
  end;
  dm.qryDepreciacionCons.Open;  
end;

procedure TfrmConsultaDepreciacion.FormCreate(Sender: TObject);
var
  xtipo : string;
begin
  dm.qryNombreActivo.close;
  dm.qryNombreActivo.open;
  dm.tTipoActivos.Close;
  dm.tTipoActivos.Filtered:=false;
  dm.tTipoActivos.Open;
  dm.tTipoActivos.First;
  xtipo:= dm.tTipoActivosDESCRIPCION.Value;

  ComboBox1.Clear;
  while not dm.tTipoActivos.Eof do
  begin
    ComboBox1.Items.Add(dm.tTipoActivosDESCRIPCION.Value);
    dm.tTipoActivos.Next;
  end;
  ComboBox1.Text:=xtipo;
  ComboBox1Change(Self);
  dtpkfechaIni.DateTime:=now;
  dtpkfechafin.DateTime:=now;
end;

procedure TfrmConsultaDepreciacion.ComboBox1Change(Sender: TObject);
begin
  if dm.tTipoActivos.Locate('DESCRIPCION',ComboBox1.Text,[]) then
  _codigotipoActivo:= dm.tTipoActivosTipo.Value;
  dm.activoTipo := IntToStr(_codigotipoActivo);
end;

procedure TfrmConsultaDepreciacion.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
  begin
    ComboBox1Change(Self);
    dm.qryDepreciacion.Filtered:=False;
    dm.qryDepreciacion.Filtered:=True;
  end else
  dm.qryDepreciacion.Filtered:=False;
end;

procedure TfrmConsultaDepreciacion.ComboBox1Click(Sender: TObject);
begin
  BitBtn1Click(self);
end;

end.
