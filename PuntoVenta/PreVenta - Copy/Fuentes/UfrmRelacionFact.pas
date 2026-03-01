unit UfrmRelacionFact;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, DB, Grids, DBGrids, RXDBCtrl;

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
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelacionFact: TfrmRelacionFact;

implementation

uses UDatModReportes, UGlobal, UBuscarClientesPersonasP, UCobrarFacturas,
  URepQckRelacionFactCxc;

{$R *.dfm}

procedure TfrmRelacionFact.BitBtn1Click(Sender: TObject);
begin
  if (edtCodCte.Text <> '') then
  begin
    dmReportes.qryRelacionFacturas.Close;
    dmReportes.qryRelacionFacturas.Params[0].Value:= StrToInt(edtCodCte.Text);
    dmReportes.qryRelacionFacturas.Params[1].Value:= ExtraerFecha(datetimepicker1.DateTime);
    dmReportes.qryRelacionFacturas.Params[2].Value:= ExtraerFecha(datetimepicker2.DateTime);
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
        dmReportes.qryRelacionFacturas.Params[1].Value:= ExtraerFecha(datetimepicker1.DateTime);
        dmReportes.qryRelacionFacturas.Params[2].Value:= ExtraerFecha(datetimepicker2.DateTime);
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
  dmReportes.qryRelacionFacturas.Close;
  dmReportes.qryRelacionFacturas.Params[0].Value:= StrToInt(edtCodCte.Text);
  dmReportes.qryRelacionFacturas.Params[1].Value:= ExtraerFecha(datetimepicker1.DateTime);
  dmReportes.qryRelacionFacturas.Params[2].Value:= ExtraerFecha(datetimepicker2.DateTime);
  dmReportes.qryRelacionFacturas.Open;
  
  qckRepRelacionFactCxc:=TqckRepRelacionFactCxc.Create(Nil);
  try
    qckRepRelacionFactCxc.Preview;
  finally
  qckRepRelacionFactCxc.Free;
  qckRepRelacionFactCxc:=Nil;
  end;
end;

end.
