unit UFormMargenBeneficio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, EditNew, ExtCtrls, Mask, RxToolEdit, Grids,
  DBGrids, RxDBCtrl, DB, RxCtrls, IBCustomDataSet, IBQuery, WinSkinData,
  ComCtrls;

type
  TfrmMargenBeneficio = class(TForm)
    BitBtn1: TBitBtn;
    Label3: TLabel;
    Label4: TLabel;
    RadioGroup1: TRadioGroup;
    Label1: TLabel;
    ComboBox1: TComboBox;
    edtTipoInv: TEditN;
    CheckBox1: TCheckBox;
    RxDBGrid1: TRxDBGrid;
    BitBtn2: TBitBtn;
    DataSource1: TDataSource;
    DBStatusLabel1: TDBStatusLabel;
    sqlQueryBase: TIBQuery;
    SkinData1: TSkinData;
    CheckBox2: TCheckBox;
    dbEditFechaInicial: TDateTimePicker;
    dbEditFechaFinal: TDateTimePicker;
    chkDet: TCheckBox;
    SpeedButton1: TSpeedButton;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    procedure AbrirDatos;
  public
    { Public declarations }
  end;

var
  frmMargenBeneficio: TfrmMargenBeneficio;

implementation

uses UFormSelFecha, UGlobal, UDatModReportes, URepInvMargenGananciaXVenta,
  UDatModConectar;

{$R *.dfm}

procedure TfrmMargenBeneficio.BitBtn1Click(Sender: TObject);
begin
  AbrirDatos;
end;

procedure TfrmMargenBeneficio.FormCreate(Sender: TObject);
begin
  dbEditFechaInicial.Date:= GlbPrimerDiaMes(GlbUltimoDiaMesAnt(Now));
  dbEditFechaFinal.Date  := GlbUltimoDiaMesAnt(Now);
  dmReportes.qryTipoInv.Close;
  dmReportes.qryTipoInv.Open;
  dmReportes.qryTipoInv.First;
  ComboBox1.Clear;
  While Not dmReportes.qryTipoInv.Eof Do
  begin
    ComboBox1.Items.Add(dmReportes.qryTipoInvDESCRIPCION.Value);
    dmReportes.qryTipoInv.Next;
  end;
  ComboBox1.ItemIndex:=0;
  ComboBox1Change(Self);
end;

procedure TfrmMargenBeneficio.ComboBox1Change(Sender: TObject);
begin
  if dmReportes.qryTipoInv.Locate('DESCRIPCION',ComboBox1.Text,[]) then
  edtTipoInv.SetInteger(dmReportes.qryTipoInvCodigo.Value);
end;

procedure TfrmMargenBeneficio.BitBtn2Click(Sender: TObject);
var  Codigo: Integer;
  Output: string;
begin
  if CheckBox2.Checked then
  begin
    GlbEnviaEmail:=False;
    if chkDet.Checked then
    begin
      dmreportes.qryMargenBrutoDet.Close;
      dmreportes.qryMargenBrutoDet.Params[0].Value:= ExtraerFecha(dbEditFechaInicial.Date);
      dmreportes.qryMargenBrutoDet.Params[1].Value:= ExtraerFecha(dbEditFechaFinal.Date);
      dmreportes.qryMargenBrutoDet.Params[2].Value:= glbCia_Key;
      dmreportes.qryMargenBrutoDet.Open;
      GLBMostrarArchivo:=False;
      GlbNombreArchivo:=GlbRutaInformes+'\Rel_MargenXProd_'+FormatDateTime('yyyymmdd',dbEditFechaInicial.Date)+
       '_'+FormatDateTime('yyyymmdd',dbEditFechaFinal.Date)+'.xlsx';

      EjecutarFormatearExcelYEsperar(
      'FormatearExcel.exe',
      FormatDateTime('mm/dd/yyyy',dbEditFechaInicial.Date), // fecha ini
      FormatDateTime('mm/dd/yyyy',dbEditFechaFinal.Date), // fecha fin
      IntToStr(glbCia_Key), // cia_key
      GlbRutaInformes+'\Cia'+IntToStr(glbCia_Key)+'Rel_MargenXProd_'+
      FormatDateTime('yyyymm',dbEditFechaInicial.Date)+
      '_'+FormatDateTime('yyyymm',dbEditFechaFinal.Date)+'.xlsx',
      Output
      );
      ShowMessage(Output);  
    end;
    Exit;
  end;
  qckRepMargenBeneficioVenta:=TqckRepMargenBeneficioVenta.Create(Nil);
  try
    qckRepMargenBeneficioVenta.Prepare;
    glbTPag := qckRepMargenBeneficioVenta.PageNumber;
    qckRepMargenBeneficioVenta.Preview;
  finally
  qckRepMargenBeneficioVenta.Free;
  qckRepMargenBeneficioVenta:=Nil;
  end;
end;

procedure TfrmMargenBeneficio.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
  begin
    dmReportes.qryMargenBruto.Filtered := False;
    dmreportes.filtrarTipoInv := edtTipoInv.ValueInteger;
    dmReportes.qryMargenBruto.Filtered := True;
  end else
  begin
    dmReportes.qryMargenBruto.Filtered := False;
    dmreportes.filtrarTipoInv := -1;
  end;
end;

procedure TfrmMargenBeneficio.AbrirDatos;
begin
  case  RadioGroup1.ItemIndex of
  0: begin     // en cero
       dmreportes._FieldNTRep:='BENEFICIO';
       dmreportes._TipoB := 0;
     end;
  1: begin     // negativo
       dmreportes._FieldNTRep:='BENEFICIO';
       dmreportes._TipoB := 1;
     end;
  2: begin     // mayor cero
       dmreportes._FieldNTRep:='BENEFICIO';
       dmreportes._TipoB := 2;
     end;
  3: begin     //todo
       dmreportes._FieldNTRep:='BENEFICIO';
       dmreportes._TipoB := 3;
     end;
  end;

  dmreportes.qryMargenBruto.Close;
  dmreportes.qryMargenBruto.filtered:=False;
  dmreportes.qryMargenBruto.Params[0].Value:= ExtraerFecha(dbEditFechaInicial.Date);
  dmreportes.qryMargenBruto.Params[1].Value:= ExtraerFecha(dbEditFechaFinal.Date);
  dmreportes.qryMargenBruto.Params[2].Value:= glbCia_Key;
  dmreportes.qryMargenBruto.Open;
  if RadioGroup1.ItemIndex = 3 then
  dmreportes.qryMargenBruto.Filtered:=False
  else
  dmreportes.qryMargenBruto.Filtered:= True;
end;

procedure TfrmMargenBeneficio.SpeedButton1Click(Sender: TObject);
var
  output : string;
begin
  if FileExists(GlbNombreArchivo) then
   EjecutarFormatearExcelYEsperar(
      'FormatearExcel.exe',
      FormatDateTime('mm/dd/yyyy',dbEditFechaInicial.Date), // fecha ini
      FormatDateTime('mm/dd/yyyy',dbEditFechaFinal.Date), // fecha fin
      IntToStr(glbCia_Key), // cia_key
      GlbRutaInformes+'\Cia'+IntToStr(glbCia_Key)+'Rel_MargenXProd_'+
      FormatDateTime('yyyymm',dbEditFechaInicial.Date)+
      '_'+FormatDateTime('yyyymm',dbEditFechaFinal.Date)+'.xlsx',
      Output
      );

      ShowMessage(output);
end;

end.
