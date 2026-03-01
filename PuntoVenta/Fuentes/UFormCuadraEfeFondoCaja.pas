unit UFormCuadraEfeFondoCaja;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, RxMemDS, StdCtrls, Mask, DBCtrls, ExtCtrls, Buttons,
  Printers,RXCtrls, RXDBCtrl, WinSkinData;
  
type
  TfrmCuadreEfeFondoCaja = class(TForm)
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Shape1: TShape;
    Label2: TLabel;
    Shape4: TShape;
    Shape5: TShape;
    Label45: TLabel;
    Shape3: TShape;
    Shape6: TShape;
    Shape7: TShape;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit23: TDBEdit;
    DBEdit24: TDBEdit;
    DBEdit25: TDBEdit;
    DBEdit26: TDBEdit;
    DBEdit27: TDBEdit;
    DBEdit28: TDBEdit;
    DBEdit29: TDBEdit;
    DBEdit30: TDBEdit;
    DBEdit31: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit32: TDBEdit;
    DBEdit35: TDBEdit;
    rxCuadre: TRxMemoryData;
    dsrxCuadre: TDataSource;
    rxTotales: TRxMemoryData;
    rxTotalesC2000: TCurrencyField;
    rxTotalesC1000: TCurrencyField;
    rxTotalesC500: TCurrencyField;
    rxTotalesC200: TCurrencyField;
    rxTotalesC100: TCurrencyField;
    rxTotalesC50: TCurrencyField;
    rxTotalesC25: TCurrencyField;
    rxTotalesC20: TCurrencyField;
    rxTotalesC10: TCurrencyField;
    rxTotalesC5: TCurrencyField;
    rxTotalesTotalGeneral: TCurrencyField;
    rxTotalesDiferencia: TCurrencyField;
    rxTotalesTotalVenta: TCurrencyField;
    rxTotalesMonedas: TCurrencyField;
    rxTotalesAjuste: TCurrencyField;
    rxTotalesDieta: TCurrencyField;
    rxTotalesRetiro: TCurrencyField;
    rxTotalesMontoEnCheque: TCurrencyField;
    rxTotalesFondoEnCaja: TCurrencyField;
    dsrxTotales: TDataSource;
    Label1: TLabel;
    DBEdit33: TDBEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    rxCuadreCOD_EMPLEADO: TIntegerField;
    rxCuadreTURNO: TIntegerField;
    rxCuadreFECHA: TDateTimeField;
    rxCuadreINGRESO_CXC: TCurrencyField;
    rxCuadreMONTO_DEVOLUCION: TCurrencyField;
    rxCuadreM2000: TCurrencyField;
    rxCuadreM1000: TCurrencyField;
    rxCuadreM500: TCurrencyField;
    rxCuadreM200: TCurrencyField;
    rxCuadreM100: TCurrencyField;
    rxCuadreM50: TCurrencyField;
    rxCuadreM25: TCurrencyField;
    rxCuadreM20: TCurrencyField;
    rxCuadreM10: TCurrencyField;
    rxCuadreM5: TCurrencyField;
    rxCuadreMONTO_EN_CHEQUE: TCurrencyField;
    rxCuadreMONEDAS: TCurrencyField;
    rxCuadreAJUSTE: TCurrencyField;
    rxCuadreDIETA: TCurrencyField;
    rxCuadreRETIRO: TCurrencyField;
    rxCuadreVentaACredito: TCurrencyField;
    rxCuadreVentaAlContado: TCurrencyField;
    rxCuadreFondoEnCaja: TCurrencyField;
    rxCuadreNombreEmpleado: TStringField;
    DBStatusLabel1: TDBStatusLabel;
    DBStatusLabel2: TDBStatusLabel;
    SkinData1: TSkinData;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    procedure rxTotalesCalcFields(DataSet: TDataSet);
    procedure BitBtn1Enter(Sender: TObject);
    procedure rxCuadreM2000Change(Sender: TField);
    procedure rxCuadreM1000Change(Sender: TField);
    procedure rxCuadreM500Change(Sender: TField);
    procedure rxCuadreM200Change(Sender: TField);
    procedure rxCuadreM100Change(Sender: TField);
    procedure rxCuadreM50Change(Sender: TField);
    procedure rxCuadreM25Change(Sender: TField);
    procedure rxCuadreM20Change(Sender: TField);
    procedure rxCuadreM10Change(Sender: TField);
    procedure rxCuadreM5Change(Sender: TField);
    procedure rxCuadreMONTO_EN_CHEQUEChange(Sender: TField);
    procedure rxCuadreMONEDASChange(Sender: TField);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
     procedure ProcIniciaRxTotales;

  public
    { Public declarations }
    xtVenta : Real;
    xCodEmp:Integer;
    xFechaCuadre : TDateTime;
    xNombreempleado: string;
    procedure ProcInserta;
    procedure GuardarDatosDistBilletes;
  end;

var
  frmCuadreEfeFondoCaja: TfrmCuadreEfeFondoCaja;

implementation
uses UGlobal, UDatModTransCnt, URepCuadreFondoCajaPOS;

{$R *.dfm}

procedure TfrmCuadreEfeFondoCaja.ProcIniciaRxTotales;
begin
  rxTotales.close;
  rxTotales.Open;
  rxTotales.Insert;
  rxTotalesTotalVenta.Value := xtVenta;

  //rxCuadreMONTO.Value := 0;
  if rxCuadre.State = dsInactive then exit;
  if rxCuadre.State = dsBrowse then
  if rxCuadre.RecordCount = 0 then
     rxCuadre.Insert
  else rxCuadre.Edit;
  rxCuadreMONTO_DEVOLUCION.Value := 0;
  rxCuadreM2000.Value := 0;
  rxCuadreM1000.Value := 0;
  rxCuadreM500.Value  := 0;
  rxCuadreM200.Value  := 0;
  rxCuadreM100.Value  := 0;
  rxCuadreM50.Value   := 0;
  rxCuadreM25.Value   := 0;
  rxCuadreM20.Value   := 0;
  rxCuadreM10.Value   := 0;
  rxCuadreM5.Value    := 0;
  rxCuadreMONTO_EN_CHEQUE.Value := 0;
  rxCuadreMONEDAS.Value := 0;
  rxCuadreAJUSTE.Value  := 0;
  rxCuadreDIETA.Value   := 0;
  rxCuadreRETIRO.Value  := 0;
end;

procedure TfrmCuadreEfeFondoCaja.ProcInserta;
begin
  rxCuadre.close;
  rxCuadre.Open;
  ProcIniciaRxTotales;  
  if rxTotales.state in [dsBrowse] then
  rxTotales.Edit;
  dmTransCnt.tblDistCashEnCaja.Close;
  dmTransCnt.tblDistCashEnCaja.Params[0].Value:=xCodEmp;
  dmTransCnt.tblDistCashEnCaja.Params[1].Value:=xCodEmp;
  dmTransCnt.tblDistCashEnCaja.Params[2].Value:=ExtraerFecha(xFechaCuadre);
  dmTransCnt.tblDistCashEnCaja.params[3].Value:=ExtraerFecha(xFechaCuadre);
  dmTransCnt.tblDistCashEnCaja.Open;

  if dmTransCnt.tblDistCashEnCaja.RecordCount > 0 then
  begin
    rxCuadre.Insert;
    rxCuadreNombreEmpleado.Value  := xNombreempleado;
    rxCuadreFECHA.Value           := ExtraerFecha(dmTransCnt.tblDistCashEnCajaFECHA.Value);
    rxCuadreCOD_EMPLEADO.Value    := xCodEmp;
    rxCuadreMONTO_EN_CHEQUE.Value := dmTransCnt.tblDistCashEnCajaMONTO_EN_CHEQUE.Value;
    rxCuadreM2000.AsInteger       := dmTransCnt.tblDistCashEnCajaM2000.Value;
    rxCuadreM1000.AsInteger       := dmTransCnt.tblDistCashEnCajaM1000.Value;
    rxCuadreM500.AsInteger        := dmTransCnt.tblDistCashEnCajaM500.Value;
    rxCuadreM200.AsInteger        := dmTransCnt.tblDistCashEnCajaM200.Value;
    rxCuadreM100.AsInteger        := dmTransCnt.tblDistCashEnCajaM100.Value;
    rxCuadreM50.AsInteger         := dmTransCnt.tblDistCashEnCajaM50.Value;
    rxCuadreM25.AsInteger         := dmTransCnt.tblDistCashEnCajaM25.Value;
    rxCuadreM20.AsInteger         := dmTransCnt.tblDistCashEnCajaM20.Value;
    rxCuadreM10.AsInteger         := dmTransCnt.tblDistCashEnCajaM10.Value;
    rxCuadreM5.AsInteger          := dmTransCnt.tblDistCashEnCajaM5.Value;
    rxCuadreMONEDAS.Value         := dmTransCnt.tblDistCashEnCajaMONTO_MONEDAS.Value;
    rxCuadre.Post;
    if rxTotales.state in [dsBrowse] then
    rxTotales.Edit;
  end else
  if rxCuadre.State = dsBrowse then
  begin
    if rxTotales.state in [dsBrowse] then
    rxTotales.Edit;  
    rxCuadre.Insert;
    rxCuadreNombreEmpleado.Value  := xNombreempleado;
    rxCuadreFECHA.Value := ExtraerFecha(xFechaCuadre);
    rxCuadreCOD_EMPLEADO.Value    := xCodEmp;
  end;
end;

procedure TfrmCuadreEfeFondoCaja.rxTotalesCalcFields(DataSet: TDataSet);
begin
  rxTotalesTotalGeneral.Value :=
  rxTotalesC2000.Value +
  rxTotalesC1000.Value +
  rxTotalesC500.Value +
  rxTotalesC200.Value +
  rxTotalesC100.Value +
  rxTotalesC50.Value +
  rxTotalesC25.Value +
  rxTotalesC20.Value +
  rxTotalesC10.Value +
  rxTotalesC5.Value +
  rxTotalesMonedas.Value +
  rxTotalesMontoEnCheque.Value;

  rxTotalesDiferencia.Value:= rxTotalesTotalGeneral.Value -
  rxTotalesTotalVenta.value +
  rxTotalesAjuste.Value -
  rxTotalesDieta.Value +
  //t rxTotalesFondoEnCaja.Value -
  rxTotalesRetiro.Value;
  if rxTotalesDiferencia.Value < 0 then
  begin
    DBEdit33.Font.Color := clRed;
    Label1.Font.Color := clRed;
    Label1.Caption := 'Faltante';
  end else
  begin
    DBEdit33.Font.Color := clGreen;
    Label1.Font.Color := clGreen;
    Label1.Caption := 'Sobrante';
  end;
end;

procedure TfrmCuadreEfeFondoCaja.BitBtn1Enter(Sender: TObject);
begin
  if rxTotales.State in [dsInsert, dsEdit] then
  rxTotales.Post;
  if rxCuadre.State in [dsInsert, dsEdit] then
  rxCuadre.Post;
end;

procedure TfrmCuadreEfeFondoCaja.rxCuadreM2000Change(Sender: TField);
begin
  rxTotalesC2000.Value:= 2000 * rxCuadreM2000.Value;
end;

procedure TfrmCuadreEfeFondoCaja.rxCuadreM1000Change(Sender: TField);
begin
  rxTotalesC1000.Value:= 1000 * rxCuadreM1000.Value;
end;

procedure TfrmCuadreEfeFondoCaja.rxCuadreM500Change(Sender: TField);
begin
  rxTotalesC500.Value:= 500 * rxCuadreM500.Value;
end;

procedure TfrmCuadreEfeFondoCaja.rxCuadreM200Change(Sender: TField);
begin
  rxTotalesC200.Value:= 200 * rxCuadreM200.Value;
end;

procedure TfrmCuadreEfeFondoCaja.rxCuadreM100Change(Sender: TField);
begin
  rxTotalesC100.Value:= 100 * rxCuadreM100.Value;
end;

procedure TfrmCuadreEfeFondoCaja.rxCuadreM50Change(Sender: TField);
begin
  rxTotalesC50.Value:= 50 * rxCuadreM50.Value;
end;

procedure TfrmCuadreEfeFondoCaja.rxCuadreM25Change(Sender: TField);
begin
  rxTotalesC25.Value:= 25 * rxCuadreM25.Value;
end;

procedure TfrmCuadreEfeFondoCaja.rxCuadreM20Change(Sender: TField);
begin
  rxTotalesC20.Value:= 20 * rxCuadreM20.Value;
end;

procedure TfrmCuadreEfeFondoCaja.rxCuadreM10Change(Sender: TField);
begin
  rxTotalesC10.Value:= 10 * rxCuadreM10.Value;
end;

procedure TfrmCuadreEfeFondoCaja.rxCuadreM5Change(Sender: TField);
begin
  rxTotalesC5.Value:= 5 * rxCuadreM5.Value;
end;

procedure TfrmCuadreEfeFondoCaja.rxCuadreMONTO_EN_CHEQUEChange(
  Sender: TField);
begin
  rxTotalesMontoEnCheque.Value := rxCuadreMONTO_EN_CHEQUE.Value;
end;

procedure TfrmCuadreEfeFondoCaja.rxCuadreMONEDASChange(Sender: TField);
begin
  rxTotalesMonedas.Value := rxCuadreMONEDAS.Value;  
end;

procedure TfrmCuadreEfeFondoCaja.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if rxTotalesDiferencia.Value < 0 then
  begin
    MessageDlg('Verificar diferencia antes de procesar.', mtInformation, [mbOk], 0);
    CanClose:=False;
  end;
end;

procedure TfrmCuadreEfeFondoCaja.GuardarDatosDistBilletes;
begin       //tblDistCashEnCaja
  dmTransCnt.tblDistCashEnCaja.Close;
  dmTransCnt.tblDistCashEnCaja.Params[0].Value:=xCodEmp;
  dmTransCnt.tblDistCashEnCaja.Params[1].Value:=xCodEmp;
  dmTransCnt.tblDistCashEnCaja.Params[2].Value:=ExtraerFecha(xFechaCuadre);
  dmTransCnt.tblDistCashEnCaja.params[3].Value:=ExtraerFecha(xFechaCuadre);
  dmTransCnt.tblDistCashEnCaja.Open;
  if dmTransCnt.tblDistCashEnCaja.RecordCount = 0 then
  begin
  dmTransCnt.tblDistCashEnCaja.Insert;
  dmTransCnt.tblDistCashEnCajaFECHA.Value     :=ExtraerFecha(xFechaCuadre);
  dmTransCnt.tblDistCashEnCajaCOD_EMPLEADO.Value:=xCodEmp;
  dmTransCnt.tblDistCashEnCajaMONTO_EN_CHEQUE.Value:=rxCuadreMONTO_EN_CHEQUE.Value;
  dmTransCnt.tblDistCashEnCajaM2000.Value:=rxCuadreM2000.AsInteger;
  dmTransCnt.tblDistCashEnCajaM1000.Value:=rxCuadreM1000.AsInteger;
  dmTransCnt.tblDistCashEnCajaM500.Value:=rxCuadreM500.AsInteger;
  dmTransCnt.tblDistCashEnCajaM200.Value:=rxCuadreM200.AsInteger;
  dmTransCnt.tblDistCashEnCajaM100.Value:=rxCuadreM100.AsInteger;
  dmTransCnt.tblDistCashEnCajaM50.Value:=rxCuadreM50.AsInteger;
  dmTransCnt.tblDistCashEnCajaM25.Value:=rxCuadreM25.AsInteger;
  dmTransCnt.tblDistCashEnCajaM20.Value:=rxCuadreM20.AsInteger;
  dmTransCnt.tblDistCashEnCajaM10.Value:=rxCuadreM10.AsInteger;
  dmTransCnt.tblDistCashEnCajaM5.Value :=rxCuadreM5.AsInteger;
  dmTransCnt.tblDistCashEnCajaMONTO_MONEDAS.Value:=rxCuadreMONEDAS.AsInteger;
  dmTransCnt.tblDistCashEnCajaCOD_USUARIO.Value:= VarUsuarioGlb;
  dmTransCnt.tblDistCashEnCajaSTATUS.Value:='A';
  dmTransCnt.tblDistCashEnCajaFECHA_IN.Value:=now;
  end else
  begin
    dmTransCnt.tblDistCashEnCaja.Edit;
    dmTransCnt.tblDistCashEnCajaMONTO_EN_CHEQUE.Value:=rxCuadreMONTO_EN_CHEQUE.Value;
    dmTransCnt.tblDistCashEnCajaM2000.Value:=rxCuadreM2000.AsInteger;
    dmTransCnt.tblDistCashEnCajaM1000.Value:=rxCuadreM1000.AsInteger;
    dmTransCnt.tblDistCashEnCajaM500.Value:=rxCuadreM500.AsInteger;
    dmTransCnt.tblDistCashEnCajaM200.Value:=rxCuadreM200.AsInteger;
    dmTransCnt.tblDistCashEnCajaM100.Value:=rxCuadreM100.AsInteger;
    dmTransCnt.tblDistCashEnCajaM50.Value:=rxCuadreM50.AsInteger;
    dmTransCnt.tblDistCashEnCajaM25.Value:=rxCuadreM25.AsInteger;
    dmTransCnt.tblDistCashEnCajaM20.Value:=rxCuadreM20.AsInteger;
    dmTransCnt.tblDistCashEnCajaM10.Value:=rxCuadreM10.AsInteger;
    dmTransCnt.tblDistCashEnCajaM5.Value:=rxCuadreM5.AsInteger;
    dmTransCnt.tblDistCashEnCajaMONTO_MONEDAS.Value:=rxCuadreMONEDAS.AsInteger;
    dmTransCnt.tblDistCashEnCajaCOD_USUARIO.Value:= VarUsuarioGlb;
    //dmTransCnt.tblDistCashEnCajaSTATUS.Value:='A';
    dmTransCnt.tblDistCashEnCajaFECHA_UPDATE.Value:=now;
  end;
  dmTransCnt.tblDistCashEnCaja.Post;
  dmTransCnt.tblDistCashEnCaja.ApplyUpdates;
  if not dmTransCnt.tblDistCashEnCaja.Transaction.InTransaction then
  dmTransCnt.tblDistCashEnCaja.Transaction.StartTransaction;
  try
    dmTransCnt.tblDistCashEnCaja.Transaction.CommitRetaining;
  except
  dmTransCnt.tblDistCashEnCaja.Transaction.RollbackRetaining;
  end;

end;

procedure TfrmCuadreEfeFondoCaja.BitBtn3Click(Sender: TObject);
begin
  rxTotales.Close;
  rxTotales.open;
  if rxCuadre.state in [dsEdit, dsInsert] then
  rxCuadre.Cancel;
end;

procedure TfrmCuadreEfeFondoCaja.BitBtn4Click(Sender: TObject);
begin
  qckRepCuadreFondoCajaPOS:=TqckRepCuadreFondoCajaPOS.Create(Nil);
    try
      //qckRepCuadreFondoCajaPOS.QRLabel46.Caption := Label1.Caption;
      qckRepCuadreFondoCajaPOS.Prepare;
      glbTPag := qckRepCuadreFondoCajaPOS.PageNumber;
      qckRepCuadreFondoCajaPOS.Preview;
    finally
    qckRepCuadreFondoCajaPOS.Free;
    qckRepCuadreFondoCajaPOS:= Nil;
    end;

end;

end.
