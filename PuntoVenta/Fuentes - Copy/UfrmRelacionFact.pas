unit UfrmRelacionFact;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, DB, Grids, DBGrids, RXDBCtrl,
  WinSkinData;

type
  TfrmRelacionFact = class(TForm)
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    edtCodCte: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    RxDBGrid1: TRxDBGrid;
    DataSource1: TDataSource;
    SkinData1: TSkinData;
    BitBtn3: TBitBtn;
    CheckBox1: TCheckBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelacionFact: TfrmRelacionFact;

implementation

uses UDatModReportes, UGlobal, UBuscarClientesPersonasP, UCobrarFacturas,
  URepQckRelacionFactCxc, URepQckRelacionFactCxcDet;

{$R *.dfm}

procedure TfrmRelacionFact.BitBtn1Click(Sender: TObject);
begin
  if (edtCodCte.Text <> '') then
  begin
    dmReportes.qryRelacionFacturas.Close;
    dmReportes.qryRelacionFacturas.Params[0].Value:= StrToInt(edtCodCte.Text);
    dmReportes.qryRelacionFacturas.Params[1].Value:= StrToInt(edtCodCte.Text);
    dmReportes.qryRelacionFacturas.Params[2].Value:= ExtraerFecha(datetimepicker1.DateTime);
    dmReportes.qryRelacionFacturas.Params[3].Value:= ExtraerFecha(datetimepicker2.DateTime);
    dmReportes.qryRelacionFacturas.Open;
    if dmReportes.qryRelacionFacturas.Recordcount = 0 then
    MessageDlg('No se encontraron record para este codigo, verifique.',mtInformation, [mbOK], 0);
    exit;
  end;

  FrmBuscarClientesPersonas:=TFrmBuscarClientesPersonas.Create(Nil);
  try
    if FrmBuscarClientesPersonas.showmodal = mrOk then
    begin
      frmCobrarFacturas:=TfrmCobrarFacturas.Create(Nil);
      try
        edtCodCte.Text := IntToStr(FrmBuscarClientesPersonas.CodigoCliente);
        dmReportes.qryRelacionFacturas.Close;
        dmReportes.qryRelacionFacturas.Params[0].Value:= StrToInt(edtCodCte.Text);
        dmReportes.qryRelacionFacturas.Params[1].Value:= StrToInt(edtCodCte.Text);
        dmReportes.qryRelacionFacturas.Params[2].Value:= ExtraerFecha(datetimepicker1.DateTime);
        dmReportes.qryRelacionFacturas.Params[3].Value:= ExtraerFecha(datetimepicker2.DateTime);
        dmReportes.qryRelacionFacturas.Open;
        if (dmReportes.qryRelacionFacturas.RecordCount = 0) then
        MessageDlg('No se encontraron record para este cliente y rango de fecha',mtInformation, [mbOK], 0);
      finally
      frmCobrarFacturas.Free;
      frmCobrarFacturas:=Nil;
      end;
    end;
  finally
  FrmBuscarClientesPersonas.Free;
  FrmBuscarClientesPersonas:=Nil;
  end;
end;

procedure TfrmRelacionFact.BitBtn2Click(Sender: TObject);
begin
  if CheckBox1.Checked then
  begin
    dmReportes.qryRelacionFacturas.Close;
    dmReportes.qryRelacionFacturas.Params[0].Value:= 0;
    dmReportes.qryRelacionFacturas.Params[1].Value:= 90000;
    dmReportes.qryRelacionFacturas.Params[2].Value:= ExtraerFecha(DateTimePicker1.Date);
    dmReportes.qryRelacionFacturas.Params[3].Value:= ExtraerFecha(DateTimePicker1.Date);
    dmReportes.qryRelacionFacturas.Open;
  end else
  begin
    dmReportes.qryRelacionFacturas.Close;
    dmReportes.qryRelacionFacturas.Params[0].Value:= StrToInt(edtCodCte.Text);
    dmReportes.qryRelacionFacturas.Params[1].Value:= StrToInt(edtCodCte.Text);
    dmReportes.qryRelacionFacturas.Params[2].Value:= ExtraerFecha(datetimepicker1.DateTime);
    dmReportes.qryRelacionFacturas.Params[3].Value:= ExtraerFecha(datetimepicker2.DateTime);
    dmReportes.qryRelacionFacturas.Open;
  end;
  dmReportes.qryRelacionFacturas.First;
  if dmReportes.qryRelacionFacturas.Recordcount = 0 then
  begin
    MessageDlg('No se encontraron records, verifique.',mtInformation, [mbOK], 0);
    exit;
  end;
  qckRepRelacionFactCxc:=TqckRepRelacionFactCxc.Create(Nil);
  try
    qckRepRelacionFactCxc.Preview;
  finally
  qckRepRelacionFactCxc.Free;
  qckRepRelacionFactCxc:=Nil;
  end;
end;

procedure TfrmRelacionFact.FormCreate(Sender: TObject);
begin
  DateTimePicker1.DateTime:= ExtraerFecha(GlbFechaTrnDiaria)-90;
  DateTimePicker2.DateTime:= ExtraerFecha(GlbFechaTrnDiaria);
end;

procedure TfrmRelacionFact.BitBtn3Click(Sender: TObject);
begin
  if CheckBox1.Checked then
  begin
    dmReportes.qryRelacionFacturas.Close;
    dmReportes.qryRelacionFacturas.Params[0].Value:= 0;
    dmReportes.qryRelacionFacturas.Params[1].Value:= 90000;
    dmReportes.qryRelacionFacturas.Params[2].Value:= ExtraerFecha(DateTimePicker1.Date);
    dmReportes.qryRelacionFacturas.Params[3].Value:= ExtraerFecha(DateTimePicker1.Date);
    dmReportes.qryRelacionFacturas.Open;
  end else
  begin
    dmReportes.qryRelacionFacturas.Close;
    dmReportes.qryRelacionFacturas.Params[0].Value:= StrToInt(edtCodCte.Text);
    dmReportes.qryRelacionFacturas.Params[1].Value:= StrToInt(edtCodCte.Text);
    dmReportes.qryRelacionFacturas.Params[2].Value:= ExtraerFecha(datetimepicker1.DateTime);
    dmReportes.qryRelacionFacturas.Params[3].Value:= ExtraerFecha(datetimepicker2.DateTime);
    dmReportes.qryRelacionFacturas.Open;
  end;

  dmReportes.qryRelacionFacturas.First;
  if dmReportes.qryRelacionFacturas.Recordcount = 0 then
  begin
    MessageDlg('No se encontraron records, verifique.',mtInformation, [mbOK], 0);
    Exit;
  end;

  qckRepRelacionFactCxcDet:=TqckRepRelacionFactCxcDet.Create(Nil);
  try
    qckRepRelacionFactCxcDet.Preview;
  finally
  qckRepRelacionFactCxcDet.Free;
  qckRepRelacionFactCxcDet:=Nil;
  end;
end;

procedure TfrmRelacionFact.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
  begin
    dmReportes.qryRelacionFacturas.Close;
    dmReportes.qryRelacionFacturas.Params[0].Value:= 0;
    dmReportes.qryRelacionFacturas.Params[1].Value:= 90000;
    dmReportes.qryRelacionFacturas.Params[2].Value:= ExtraerFecha(DateTimePicker1.Date);
    dmReportes.qryRelacionFacturas.Params[3].Value:= ExtraerFecha(DateTimePicker1.Date);
    dmReportes.qryRelacionFacturas.Open;
    dmReportes.qryRelacionFacturas.First;
    if dmReportes.qryRelacionFacturas.Recordcount = 0 then
    MessageDlg('No se encontraron records, verifique.',mtInformation, [mbOK], 0);
  end;
end;

procedure TfrmRelacionFact.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if (dmReportes.qryRelacionFacturasSTATUS.Value = 'C') then
  BackGround := clSilver;
end;

end.
