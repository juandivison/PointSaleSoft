unit UFormDatosCotiza;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, Buttons, ExtCtrls, DB, IBCustomDataSet,
  IBQuery, Grids, DBGrids, RXDBCtrl, RXSwitch, IBSQL;

type
  TfrmCotizaciones = class(TForm)
    ibqryCotizacionMaster: TIBQuery;
    dsibqryCotizacionMaster: TDataSource;
    ibqryCotizacionDet: TIBQuery;
    dsibqryCotizacionDet: TDataSource;
    RxDBGrid1: TRxDBGrid;
    RxDBGrid2: TRxDBGrid;
    ibqryCotizacionMasterNUMERO: TIntegerField;
    ibqryCotizacionMasterFECHA: TDateTimeField;
    ibqryCotizacionMasterFECHA_VENCE: TDateTimeField;
    ibqryCotizacionMasterCODIGO_CTE: TIntegerField;
    ibqryCotizacionMasterCODIGO_VENDEDOR: TIntegerField;
    ibqryCotizacionMasterOBSERVACION: TIBStringField;
    ibqryCotizacionMasterMONEDA: TIBStringField;
    ibqryCotizacionMasterVALOR_TOTAL: TFloatField;
    ibqryCotizacionMasterSTATUS: TIBStringField;
    ibqryCotizacionMasterNOMBRE_CTE: TIBStringField;
    ibqryCotizacionMasterTELEF_CONTACTO: TIBStringField;
    ibqryCotizacionMasterDIRECCION_CONT: TIBStringField;
    ibqryCotizacionMasterEMAIL: TIBStringField;
    ibqryCotizacionMasterWEBSITE: TIBStringField;
    ibqryCotizacionMasterCIUDAD: TIBStringField;
    ibqryCotizacionMasterPAIS: TIBStringField;
    Shape1: TShape;
    ibqryCotizacionDetSERIE: TIntegerField;
    ibqryCotizacionDetNUMERO: TIntegerField;
    ibqryCotizacionDetCODIGO_PROD: TIBStringField;
    ibqryCotizacionDetCODIGO_BARRA: TIBStringField;
    ibqryCotizacionDetDESCRIPCION: TIBStringField;
    ibqryCotizacionDetCANTIDAD: TFloatField;
    ibqryCotizacionDetPRECIO: TFloatField;
    ibqryCotizacionDetPORC_DESC_DET: TFloatField;
    ibqryCotizacionDetITBI_DET: TFloatField;
    ibqryCotizacionDetVALOR_SERVICIO_DET: TFloatField;
    ibqryCotizacionDetVALOR_TOTAL_DET: TFloatField;
    ibqryCotizacionDetSTATUS_DET: TIBStringField;
    ibqryCotizacionDetFECHA_IN: TDateTimeField;
    RadioGroup1: TRadioGroup;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    RxSwitch1: TRxSwitch;
    ibsqlBuscarcotinum: TIBSQL;
    procedure FormCreate(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure ibqryCotizacionMasterAfterScroll(DataSet: TDataSet);
    procedure RxSwitch1Click(Sender: TObject);

  private
    procedure ProcCriterioBusqueda;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCotizaciones: TfrmCotizaciones;

implementation

uses UDatModConectar, Uglobal, UFormSelFecha;

{$R *.dfm}

procedure TfrmCotizaciones.FormCreate(Sender: TObject);
begin
  ProcCriterioBusqueda;
end;

procedure TfrmCotizaciones.ProcCriterioBusqueda;
begin
  if radiogroup1.ItemIndex = 0 then
  Label1.Caption:='Entre Número de cotizacion'
  else if radiogroup1.ItemIndex = 1 then
  Label1.Caption:='Entre codigo cliente'
  else if radiogroup1.ItemIndex = 2 then
  Label1.Caption:='Entre nombre cliente';
end;

procedure TfrmCotizaciones.RadioGroup1Click(Sender: TObject);
begin
 ProcCriterioBusqueda;
 Edit1.SetFocus;
end;

procedure TfrmCotizaciones.BitBtn1Click(Sender: TObject);
begin
  case radiogroup1.ItemIndex of
  0 : begin
        if Not ibqryCotizacionMaster.Locate('NUMERO', edit1.Text,[]) then
        begin
          ibsqlBuscarcotinum.Close;
          ibsqlBuscarcotinum.params[0].Value:= StrToInt(edit1.Text);
          ibsqlBuscarcotinum.ExecQuery;

          ibqryCotizacionMaster.Close;
          ibqryCotizacionMaster.Params[0].Value:= ExtraerFecha(ibsqlBuscarcotinum.fieldbyname('fecha').AsDate);
          ibqryCotizacionMaster.Params[1].Value:= ExtraerFecha(ibsqlBuscarcotinum.fieldbyname('fecha').AsDate);
          ibqryCotizacionMaster.Open;

        end;
        if not ibqryCotizacionMaster.Locate('NUMERO', edit1.Text,[]) then
        begin
           MessageDlg('Numero Cotizacion No existe, verifique',mtInformation, [mbOK], 0);
        end;
      end;
  1 : begin
        if not ibqryCotizacionMaster.Locate('CODIGO_CTE', StrToInt(edit1.Text),[]) then
        begin
           MessageDlg('Nombre existe cotizacion con este codigo de cliente, verifique',mtInformation, [mbOK], 0);
        end;
      end;
  2 : begin
        if not ibqryCotizacionMaster.Locate('Nombre_cte', edit1.Text,[loCaseInsensitive]) then
        begin
           MessageDlg('Nombre existe cotizacion con este nombre, verifique',mtInformation, [mbOK], 0);
        end;
      end;
  end;
end;

procedure TfrmCotizaciones.BitBtn4Click(Sender: TObject);
begin
  frmSelFecha:=TfrmSelFecha.Create(nil);
  try
    frmSelFecha.FechaIni.DateTime:=GlbFechaTrnDiaria-30;
    frmSelFecha.FechaFin.DateTime:=GlbFechaTrnDiaria+30;
    if frmSelFecha.Showmodal = mrOk then
    begin
      ibqryCotizacionMaster.Close;
      ibqryCotizacionMaster.Params[0].Value:= ExtraerFecha(frmSelFecha.FechaIni.DateTime);
      ibqryCotizacionMaster.Params[1].Value:= ExtraerFecha(frmSelFecha.FechaFin.DateTime);
      ibqryCotizacionMaster.Open;
    end;
  finally
  frmSelFecha.free;
  frmSelFecha:=nil;
  end;
end;

procedure TfrmCotizaciones.ibqryCotizacionMasterAfterScroll(
  DataSet: TDataSet);
begin
  ibqryCotizacionDet.Close;
  ibqryCotizacionDet.Params[0].Value := ibqryCotizacionMasterNUMERO.Value;
  ibqryCotizacionDet.Open;
end;

procedure TfrmCotizaciones.RxSwitch1Click(Sender: TObject);
begin
  if RxSwitch1.StateOn then
  begin
  RxDBGrid1.Height:=281; 
  RxDBGrid1.BringToFront;
  end else
  RxDBGrid1.Height:=65;
end;

end.
