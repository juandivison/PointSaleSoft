unit UFormHistoricoCierreZ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  ShellApi, Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, WinSkinData;

type
  TfrmHistoricoCierreZ = class(TForm)
    edtNumCierreZInicial: TEdit;
    edtNumCierreZFinal: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label3: TLabel;
    Label4: TLabel;
    DateTimePicker2: TDateTimePicker;
    RadioGroup1: TRadioGroup;
    BitBtn1: TBitBtn;
    RadioGroup2: TRadioGroup;
    SkinData1: TSkinData;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtNumCierreZInicialExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHistoricoCierreZ: TfrmHistoricoCierreZ;

implementation
 uses uglobal;
{$R *.dfm}

procedure TfrmHistoricoCierreZ.BitBtn1Click(Sender: TObject);
var
  ZIni, ZFin : string;
  zRango, parameters : String;
begin
  zRango :='';
  if RadioGroup2.ItemIndex = 0 then
  begin
    ZIni := edtNumCierreZInicial.Text;
    ZFin := edtNumCierreZFinal.Text;
    zRango := '/NumZIni='+ZIni+ ' /NumZFin='+ZFin;
    if (GlbModeloImpresora = GLBIFISCALEPSONTMT881V) then
   begin
     parameters:=Format('/PortComm=%s /Baudrate=%s /ReporteZ=POR_Z_IMP %s '+
     '/TipoDoc=DVF /Status=not /Cancelar=false /ImprimeZ=1 /CierreX=False '+
     'CierreZ=False /Cierre=XX /ImpCierreX=0 /ConfFile=DatosConfIFiscal.dat',
     [IntToStr(GlbPuerto),IntToStr(GlbBaudRate),zRango]);
     ShellExecute(0, 'Open', PChar(GlbExeIFiscal), PChar(parameters), PChar(''), SW_Hide);
   end;

  end else
  begin
    ZIni  := FormatDateTime('ddmmyyyy', DateTimePicker1.Date);
    ZFin  := FormatDateTime('ddmmyyyy', DateTimePicker2.Date);
    zRango:= '/FechaZIni='+ZIni+ ' /FechaZFin='+ZFin;

    if (GlbModeloImpresora = GLBIFISCALEPSONTMT881V) then
    begin
     parameters:=Format('/PortComm=%s /Baudrate=%s /ReporteZ=POR_DIA_IMP %s '+
     '/TipoDoc=DVF /Status=not /Cancelar=false /ImprimeZ=1 /CierreX=False '+
     'CierreZ=False /Cierre=XX /ImpCierreX=0 /ConfFile=DatosConfIFiscal.dat',
     [IntToStr(GlbPuerto),IntToStr(GlbBaudRate),zRango]);
     ShellExecute(0, 'Open', PChar(GlbExeIFiscal), PChar(parameters), PChar(''), SW_Hide);
   end;
  end;
  if (edtNumCierreZInicial.Text = edtNumCierreZFinal.Text) then
  begin
    //Un cierre
  end else
  if ( StrToInt(edtNumCierreZFinal.Text) >
  StrToInt(edtNumCierreZInicial.Text)) then
  begin
    //por rango
  end;
end;

procedure TfrmHistoricoCierreZ.FormCreate(Sender: TObject);
begin
  DateTimePicker1.Date:= GlbFechaTrnDiaria;
  DateTimePicker2.Date:= GlbFechaTrnDiaria;
end;

procedure TfrmHistoricoCierreZ.edtNumCierreZInicialExit(Sender: TObject);
begin
  if (edtNumCierreZInicial.Text <> '') then
  begin
    edtNumCierreZFinal.Text := edtNumCierreZInicial.Text;
    edtNumCierreZFinal.SelectAll;
  end;
end;

end.
