unit UCobroDeCuotasFinanc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, StdCtrls, Buttons, Grids, DBGrids,
  RXDBCtrl, Mask, DBCtrls, RxMemDS, ToolEdit, CurrEdit, RXCtrls, EditNew;

type
  TfrmCobroCuotasXFinanc = class(TForm)
    tblCobroDeCuotasFinanc: TIBDataSet;
    dstblCobroDeCuotasFinanc: TDataSource;
    qryDatosCuota: TIBQuery;
    qryDatosCuotaSERIE: TIntegerField;
    qryDatosCuotaNUMERO_TRN: TIntegerField;
    qryDatosCuotaFECHA: TDateTimeField;
    qryDatosCuotaCODIGO_CTE: TIntegerField;
    qryDatosCuotaTIPO_FREC_PAGO: TIntegerField;
    qryDatosCuotaPORCIENTO: TFloatField;
    qryDatosCuotaPORC_MORA: TFloatField;
    qryDatosCuotaCANT_CUOTAS: TIntegerField;
    qryDatosCuotaBALANCE_ACT: TFloatField;
    qryDatosCuotaFECHA_ULT_PAGO: TDateTimeField;
    qryDatosCuotaMONTO_APAGAR_PORMORA: TFloatField;
    qryDatosCuotaMONTO_INTERES: TFloatField;
    qryDatosCuotaMONTO_CUOTA: TFloatField;
    qryDatosCuotaMONTO_CUOTA_TOTAL: TFloatField;
    qryDatosCuotaDIASTRANS: TIntegerField;
    qryDatosCuotaCANTPERIODOSATRASO: TIntegerField;
    RxDBGrid1: TRxDBGrid;
    dsqryDatosCuota: TDataSource;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    tblCobroDeCuotasFinancSERIE: TIntegerField;
    tblCobroDeCuotasFinancNUMERO_TRN: TIntegerField;
    tblCobroDeCuotasFinancFECHA: TDateTimeField;
    tblCobroDeCuotasFinancCODIGO_CTE: TIntegerField;
    tblCobroDeCuotasFinancTIPO_FREC_PAGO: TIntegerField;
    tblCobroDeCuotasFinancPORCIENTO: TFloatField;
    tblCobroDeCuotasFinancPORC_MORA: TFloatField;
    tblCobroDeCuotasFinancCANT_CUOTAS: TIntegerField;
    tblCobroDeCuotasFinancMONTOINICIAL: TFloatField;
    tblCobroDeCuotasFinancDEBITO_ACUM: TFloatField;
    tblCobroDeCuotasFinancCREDITO_ACUM: TFloatField;
    tblCobroDeCuotasFinancMONTO_MORA_ACUM: TFloatField;
    tblCobroDeCuotasFinancMONTO_DESC_PRONTOPAGO: TFloatField;
    tblCobroDeCuotasFinancBALANCE_ACT: TFloatField;
    tblCobroDeCuotasFinancFECHA_ULT_PAGO: TDateTimeField;
    tblCobroDeCuotasFinancSTATUS: TIBStringField;
    tblCobroDeCuotasFinancID_USUARIO_IN: TIntegerField;
    tblCobroDeCuotasFinancFECHA_IN: TDateTimeField;
    tblCobroDeCuotasFinancNOMBREPC: TIBStringField;
    tblCobroDeCuotasFinancFECHA_UPDATE: TDateTimeField;
    tblCobroDeCuotasFinancID_USUARIO_UPDATE: TIntegerField;
    tblCobroDeCuotasFinancCUOTASPEND: TIntegerField;
    rxDatos: TRxMemoryData;
    rxDatosMontoPagado: TCurrencyField;
    rxDatosDescuentoProntoPago: TCurrencyField;
    DataSource1: TDataSource;
    rxDatosMontoTotalCuota: TCurrencyField;
    rxDatosMontoCuota: TFloatField;
    qryDatosCuotaCANTMESATRASO: TIntegerField;
    qryDatosCuotaNUM_FACTURA: TIntegerField;
    RxDBGrid2: TRxDBGrid;
    edtAbonoACapital: TEditN;
    Label9: TLabel;
    RxLabel1: TRxLabel;
    rxMontoPagado: TRxCalcEdit;
    Label5: TLabel;
    RxCalcEditNeto: TRxCalcEdit;
    Label6: TLabel;
    RxLabel3: TRxLabel;
    DataSource2: TDataSource;
    rxTotales: TRxMemoryData;
    rxTotalesMontoInteresAPagar: TFloatField;
    rxTotalesCuota: TFloatField;
    rxTotalesMontoxMora: TFloatField;
    rxTotalesTotalAPagar: TFloatField;
    rxTotalesMontoCapital: TCurrencyField;
    rxTotalesMontoInteres: TFloatField;
    qryDatosCuotaCUOTASPEND: TIntegerField;
    qryDatosCuotaMONTOINICIAL: TFloatField;
    qryDatosCuotaMONTO_CAP_INICIAL: TFloatField;
    procedure BitBtn1Click(Sender: TObject);
    procedure RxDBGrid1CellClick(Column: TColumn);
    procedure edtAbonoACapitalExit(Sender: TObject);
    procedure RxLabel3Click(Sender: TObject);
    procedure rxMontoPagadoChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Procedure SumarDatosFinanc;
    Procedure SumarTotales;
  end;

var
  frmCobroCuotasXFinanc: TfrmCobroCuotasXFinanc;
  MontoInicial : Extended;

implementation

uses UDatModConectar, URecibosYCtaXCobrar,uglobal;

{$R *.dfm}

procedure TfrmCobroCuotasXFinanc.SumarDatosFinanc;
begin
  qryDatosCuota.First;
  rxDatos.Close;
  rxDatos.Open;
  rxDatos.Insert;
  rxDatosMontoPagado.Value:=0;
  rxDatosMontoTotalCuota.Value :=0;
  rxDatosDescuentoProntoPago.Value :=0;
  rxDatos.Post;
  While Not qryDatosCuota.Eof Do
  begin
    rxDatos.Edit;
    rxDatosMontoTotalCuota.Value:= rxDatosMontoTotalCuota.Value + qryDatosCuotaMONTO_CUOTA_TOTAL.Value;
    qryDatosCuota.Next;
  end;
end;

procedure TfrmCobroCuotasXFinanc.BitBtn1Click(Sender: TObject);
var
  xMonto : Real;
  MCapital : Real;
begin
  tblCobroDeCuotasFinanc.Close;
  tblCobroDeCuotasFinanc.Params[0].Value:=qryDatosCuotaCODIGO_CTE.Value;
  tblCobroDeCuotasFinanc.Params[1].Value:=qryDatosCuotaSERIE.Value;
  tblCobroDeCuotasFinanc.Open;

  xMonto := edtAbonoACapital.ValueFloat + rxTotalesMontoCapital.Value + rxTotalesMontoInteres.Value;
  MCapital := edtAbonoACapital.ValueFloat + rxTotalesMontoCapital.Value + rxTotalesMontoInteres.Value;
  
  FrmRecibosYCtaXCobrar:=TFrmRecibosYCtaXCobrar.create(Nil);
  try
    FrmRecibosYCtaXCobrar.xNumeroFact := qryDatosCuotaNUM_FACTURA.Value;
    FrmRecibosYCtaXCobrar.Edit1.Text  := qryDatosCuotaCODIGO_CTE.AsString;
    FrmRecibosYCtaXCobrar.edtMontoAplicar.Text := FloatToStr(MCapital);//rxDatosMontoCuota.AsString;

    GlbMontoInteresMoraPgdo := rxTotalesMontoxMora.Value;
    
    FrmRecibosYCtaXCobrar.CerrarVentana := True;
    FrmRecibosYCtaXCobrar.Showmodal;
    FrmRecibosYCtaXCobrar.CerrarVentana := False;
    
    tblCobroDeCuotasFinanc.Edit;
    tblCobroDeCuotasFinancFECHA_ULT_PAGO.Value := ExtraerFecha(GlbFechaTrnDiaria);
    tblCobroDeCuotasFinancFECHA_UPDATE.Value   := ExtraerFecha(Now);
    tblCobroDeCuotasFinancID_USUARIO_UPDATE.Value := VarUsuarioGlb;

    tblCobroDeCuotasFinancCREDITO_ACUM.Value :=
    tblCobroDeCuotasFinancCREDITO_ACUM.Value + xMonto;

    tblCobroDeCuotasFinancBALANCE_ACT.Value :=
    tblCobroDeCuotasFinancBALANCE_ACT.Value - xMonto;

    tblCobroDeCuotasFinancCUOTASPEND.Value :=
    tblCobroDeCuotasFinancCUOTASPEND.Value - 1;
    tblCobroDeCuotasFinanc.ApplyUpdates;
    if Not tblCobroDeCuotasFinanc.Transaction.InTransaction then
    tblCobroDeCuotasFinanc.Transaction.StartTransaction;
    try
      tblCobroDeCuotasFinanc.Transaction.CommitRetaining;
    except
    tblCobroDeCuotasFinanc.Transaction.RollbackRetaining;
    end;
  finally
  FrmRecibosYCtaXCobrar.Free;
  FrmRecibosYCtaXCobrar:=Nil;
  end;
  Close;
end;

procedure TfrmCobroCuotasXFinanc.RxDBGrid1CellClick(Column: TColumn);
begin
  rxDatos.close;
  rxDatos.Open;
  rxDatos.Insert;
  rxDatosMontoCuota.Value:=qryDatosCuotaMONTO_CUOTA.Value;
  rxDatosMontoTotalCuota.Value:=qryDatosCuotaMONTO_CUOTA_TOTAL.Value;
  rxDatos.Post;
end;

procedure TfrmCobroCuotasXFinanc.edtAbonoACapitalExit(Sender: TObject);
begin
  if edtAbonoACapital.ValueFloat > 0 then
  begin
    RxCalcEditNeto.Visible := True;
    Label5.Visible := True;
    RxCalcEditNeto.Value := rxMontoPagado.Value + edtAbonoACapital.ValueFloat;
    //if chBoxNoCobrarCapital.Checked then
    //RxCalcEditNeto.Value:=RxCalcEditNeto.Value - rxTotalesMontoCapital.Value;
  end else
  begin
    //if not chBoxNoCobrarCapital.Checked then
    //begin
    //  RxCalcEditNeto.Visible:=False;
    //  Label5.Visible := False;
    //end else chBoxNoCobrarCapitalClick(Self);
  end;
  if (edtAbonoACapital.ValueFloat > (MontoInicial + 1 + rxTotalesMontoxMora.Value)) then
  begin
    MessageDlg('Favor verifique valores', mtInformation, [mbOK], 0);
    edtAbonoACapital.SetFocus;
  end;
end;

procedure TfrmCobroCuotasXFinanc.RxLabel3Click(Sender: TObject);
begin
  if (RxLabel3.Caption <> '') then
  begin
    if (MontoInicial > 0) then
    edtAbonoACapital.Text:= FloatToStr(MontoInicial)
  end;
end;

procedure TfrmCobroCuotasXFinanc.SumarTotales;
begin
  rxTotales.Close;
  rxTotales.Open;
  rxTotales.Insert;
  rxTotalesMontoInteresAPagar.Value := 0;
  rxTotalesCuota.Value       := 0;
  rxTotalesMontoxMora.Value  := 0;
  rxTotalesTotalAPagar.Value := 0;
  rxTotalesCuota.Value       := 0;
  rxTotalesMontoCapital.Value:= 0;
  rxTotalesMontoInteres.Value:= 0;
  rxTotales.Post;
  qryDatosCuota.First;
  While Not qryDatosCuota.Eof do
  begin
    rxTotales.Edit;
    rxTotalesMontoInteresAPagar.Value := rxTotalesMontoInteresAPagar.Value{ +
                                         qryDatosCuotaTotal_Interes.Value};
    rxTotalesCuota.Value       := rxTotalesCuota.Value +
                                  qryDatosCuotaMONTO_CUOTA.Value;
    rxTotalesMontoxMora.Value  := rxTotalesMontoxMora.Value  +
                                  qryDatosCuotaMONTO_APAGAR_PORMORA.Value;
    rxTotalesTotalAPagar.Value := rxTotalesTotalAPagar.Value +
                                  qryDatosCuotaMONTO_APAGAR_PORMORA.Value +
                                  qryDatosCuotaMONTO_CUOTA.Value +
                                  qryDatosCuotaMONTO_INTERES.Value;
                                  //qryDatosCuotaMONTO_CAPITAL_APAGAR.Value +
                                  //rxTotalesMontoInteresAPagar.Value;
    rxTotalesMontoCapital.Value:= rxTotalesMontoCapital.Value +
                                  qryDatosCuotaMONTO_CUOTA.Value;
                                  //qryDatosCuotaMONTO_CAPITAL_APAGAR.Value;
    rxTotalesMontoInteres.Value:= rxTotalesMontoInteres.Value +
                                  qryDatosCuotaMONTO_INTERES.Value;{ +
                                  qryDatosCuotaTotal_Interes.Value;}
    rxTotales.Post;
    qryDatosCuota.Next;
  end;
  rxMontoPagado.Value:= rxTotalesTotalAPagar.Value;
  //if (qryDatosCuota.RecordCount > 1) then
  //begin
    //chBoxNoCobrarCapital.Checked:=False;
    //chBoxNoCobrarCapital.Enabled:=False;
  //end else chBoxNoCobrarCapital.Enabled:=True;
  RxCalcEditNeto.Value := rxMontoPagado.Value + edtAbonoACapital.ValueFloat;
  edtAbonoACapitalExit(Self);
end;

procedure TfrmCobroCuotasXFinanc.rxMontoPagadoChange(Sender: TObject);
begin
  Label5.Visible := True;
  RxCalcEditNeto.Value:= rxMontoPagado.Value + edtAbonoACapital.ValueFloat;
end;

end.
