unit UFormConsultaOrden;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, ComCtrls, Grids, DBGrids, RXDBCtrl,
  WinSkinData;

type
  TfrmConsultaOrden = class(TForm)
    RadioGroup1: TRadioGroup;
    Edit1: TEdit;
    Label1: TLabel;
    dtpkFechaIni: TDateTimePicker;
    dtpkFechaFin: TDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    chkBoxIncluyeFecha: TCheckBox;
    SpeedButton1: TSpeedButton;
    RxDBGrid1: TRxDBGrid;
    RxDBGrid2: TRxDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    SkinData1: TSkinData;
    procedure RadioGroup1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
    procedure AbrirDatos;
  public
    { Public declarations }
  end;

var
  frmConsultaOrden: TfrmConsultaOrden;
  sqlText : string;


implementation

uses UDatmodDatosGenerales, UGlobal;


{$R *.dfm}

procedure TfrmConsultaOrden.AbrirDatos;
begin
  dmdatos.qryViewOrdenCompMast.Close;
  dmdatos.qryViewOrdenCompMast.SQL.Text:=
  dmdatos.qryViewOrdenCompMastBase.SQL.Text + sqlText;
  dmdatos.qryViewOrdenCompMast.Open;
end;

procedure TfrmConsultaOrden.RadioGroup1Click(Sender: TObject);
begin
  Case RadioGroup1.ItemIndex Of
  0 : begin
        label1.Caption := 'Entre # Orden';
        Edit1.SetFocus;
      end;
  1 : begin
        label1.Caption := 'Entre Código Proveedor';
        Edit1.SetFocus;
      end;
  2 : begin
        label1.Caption := 'Entre Código Nombre Proveedor';
        Edit1.SetFocus;
      end;
  3 : begin
        dtpkFechaIni.SetFocus;
      end;
  end;
end;

procedure TfrmConsultaOrden.SpeedButton1Click(Sender: TObject);
begin
  Case RadioGroup1.ItemIndex Of
  0 : begin
        //label1.Caption := 'Entre # Orden';
         sqlText := ' Where NUM_ORDEN = '+edit1.Text;
      end;
  1 : begin
        //label1.Caption := 'Entre Código Proveedor';
        sqlText := ' Where CODIGO_PROVEE = '+edit1.Text;
        //Edit1.SetFocus;
      end;
  2 : begin
        //label1.Caption := 'Entre Código Nombre Proveedor';
        //Edit1.SetFocus;
        sqlText := format(' Where NOMBREPROVEEDOR like %s ',[chr(39)+'%'+edit1.Text+'%'+chr(39)]);
      end;
  3 : begin
        sqlText := Format(' Where Fecha between %s and %s ',
       [chr(39)+FormatDateTime('mm/dd/yyyy',dtpkFechaIni.Date)+chr(39),
       chr(39)+FormatDateTime('mm/dd/yyyy',dtpkFechaFin.Date)+chr(39)]);
       chkBoxIncluyeFecha.Checked:=False;
      end;
  5 : begin
        
      end;

  end;
  if chkBoxIncluyeFecha.Checked then
  sqlText := Format(sqlText + ' And Fecha between %s and %s ',
  [chr(39)+FormatDateTime('mm/dd/yyyy',dtpkFechaIni.Date)+chr(39),
  chr(39)+FormatDateTime('mm/dd/yyyy',dtpkFechaFin.Date)+chr(39)]);

  AbrirDatos;
  Refresh;

end;

procedure TfrmConsultaOrden.FormCreate(Sender: TObject);
begin
  dtpkFechaIni.Date:=GlbPrimerDiaMes(GlbFechaTrnDiaria);
  dtpkFechaFin.Date:=GlbUltimoDiaMes(GlbFechaTrnDiaria);
end;

end.
