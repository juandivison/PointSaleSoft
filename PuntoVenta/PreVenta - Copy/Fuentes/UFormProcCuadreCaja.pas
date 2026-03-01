unit UFormProcCuadreCaja;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Mask, DBCtrls, RxMemDS, EditNew, WinSkinData,
  RXDBCtrl, Buttons, RXCtrls, ExtCtrls, RxLookup, RxToolEdit;

type
  TfrmCuadreCaja = class(TForm)
    rxCuadre: TRxMemoryData;
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
    dsrxCuadre: TDataSource;
    Label3: TLabel;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    Label14: TLabel;
    DBEdit14: TDBEdit;
    Label15: TLabel;
    DBEdit15: TDBEdit;
    Label16: TLabel;
    DBEdit16: TDBEdit;
    Label17: TLabel;
    DBEdit17: TDBEdit;
    Label18: TLabel;
    DBEdit18: TDBEdit;
    Label19: TLabel;
    DBEdit19: TDBEdit;
    Label20: TLabel;
    DBEdit20: TDBEdit;
    Label21: TLabel;
    DBEdit21: TDBEdit;
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
    DBEdit22: TDBEdit;
    dsrxTotales: TDataSource;
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
    DBEdit23: TDBEdit;
    DBEdit24: TDBEdit;
    DBEdit25: TDBEdit;
    DBEdit26: TDBEdit;
    DBEdit27: TDBEdit;
    DBEdit28: TDBEdit;
    DBEdit29: TDBEdit;
    DBEdit30: TDBEdit;
    DBEdit31: TDBEdit;
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
    SkinData1: TSkinData;
    Label42: TLabel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn2: TBitBtn;
    DBDateEdit1: TDBDateEdit;
    Label1: TLabel;
    rxTotalesTotalGeneral: TCurrencyField;
    rxTotalesDiferencia: TCurrencyField;
    Label43: TLabel;
    DBStatusLabel1: TDBStatusLabel;
    DBStatusLabel2: TDBStatusLabel;
    rxCuadreVentaACredito: TCurrencyField;
    DBEdit3: TDBEdit;
    Label44: TLabel;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    rxCuadreVentaAlContado: TCurrencyField;
    rxTotalesTotalVenta: TCurrencyField;
    Shape1: TShape;
    Shape2: TShape;
    Label2: TLabel;
    Shape4: TShape;
    Shape5: TShape;
    DBEdit1: TDBEdit;
    Label45: TLabel;
    DBEdit4: TDBEdit;
    Shape3: TShape;
    Shape6: TShape;
    Shape7: TShape;
    rxTotalesMonedas: TCurrencyField;
    DBEdit32: TDBEdit;
    DBEdit33: TDBEdit;
    rxTotalesAjuste: TCurrencyField;
    rxTotalesDieta: TCurrencyField;
    rxTotalesRetiro: TCurrencyField;
    rxCuadreCOD_EMPLEADO: TIntegerField;
    DBEdit34: TDBEdit;
    RxDBLookupCombo1: TRxDBLookupCombo;
    dsQryUsuarios: TDataSource;
    DBEdit35: TDBEdit;
    rxTotalesMontoEnCheque: TCurrencyField;
    DBEdit36: TDBEdit;
    Label46: TLabel;
    rxCuadreFondoEnCaja: TCurrencyField;
    rxTotalesFondoEnCaja: TCurrencyField;
    BitBtn4: TBitBtn;
    rxCuadreNombreEmpleado: TStringField;
    rxCuadreMontoFinanciado: TCurrencyField;
    Label47: TLabel;
    DBEdit37: TDBEdit;
    rxCuadreMontoInicialFinanciamiento: TCurrencyField;
    Label48: TLabel;
    DBEdit38: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure rxTotalesCalcFields(DataSet: TDataSet);
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
    procedure rxCuadreMONEDASChange(Sender: TField);
    procedure rxCuadreAJUSTEChange(Sender: TField);
    procedure rxCuadreRETIROChange(Sender: TField);
    procedure rxCuadreDIETAChange(Sender: TField);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure rxCuadreMONTO_EN_CHEQUEChange(Sender: TField);
    procedure rxCuadreFondoEnCajaChange(Sender: TField);
    procedure BitBtn4Click(Sender: TObject);
    procedure DBEdit34Exit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBEdit36Change(Sender: TObject);
    procedure DBDateEdit1Change(Sender: TObject);
  private
    procedure ProcIniciaRxTotales;
    procedure ProcTotal;
    { Private declarations }
    procedure ProcInsDatosConsulta;
  public
    { Public declarations }
  end;

var
  frmCuadreCaja: TfrmCuadreCaja;

implementation

uses UDatModCuadrexRuta, uglobal, UDatModUsuarios, UDatModCxc,
  UFrmConsultaCuadreCaja, URepCuadreCaja;

{$R *.dfm}

procedure TfrmCuadreCaja.FormCreate(Sender: TObject);
begin
  dmUsuarios.qryUsuarios.Close;
  dmUsuarios.qryUsuarios.Open;
  dmUsuarios.qryUsuarios.First;
  rxCuadre.Close;
  rxCuadre.Open;
  rxTotales.Close;
  rxTotales.Open;
end;

procedure TfrmCuadreCaja.BitBtn1Click(Sender: TObject);
begin
  if rxCuadre.State = dsBrowse then
  begin
    rxCuadre.Insert;
    rxCuadreFECHA.Value := ExtraerFecha(GlbFechaTrnDiaria);
    ProcIniciaRxTotales;
    DBEdit34.SetFocus;
  end;
end;


procedure TfrmCuadreCaja.BitBtn3Click(Sender: TObject);
begin
  if rxCuadre.State In [dsInsert, dsEdit] then
  begin
    rxCuadre.Post;
  end;
  if rxTotales.State In [dsInsert, dsEdit] then
  begin
    rxTotales.Post;
  end;
  dmCuadrexRuta.sp_InsertCuadreCaja.Params[0].Value:= rxCuadreCod_Empleado.Value;
  dmCuadrexRuta.sp_InsertCuadreCaja.Params[1].Value:= ExtraerFecha(rxCuadreFecha.Value);
  dmCuadrexRuta.sp_InsertCuadreCaja.Params[2].Value:= rxCuadreIngreso_Cxc.Value;
  dmCuadrexRuta.sp_InsertCuadreCaja.Params[3].Value:= rxCuadreVentaACredito.Value;
  dmCuadrexRuta.sp_InsertCuadreCaja.Params[4].Value:= rxcuadreVentaAlcontado.Value;
  dmCuadrexRuta.sp_InsertCuadreCaja.Params[5].Value:= rxCuadreMONTO_DEVOLUCION.Value;
  dmCuadrexRuta.sp_InsertCuadreCaja.Params[6].Value:= rxCuadremonto_En_cheque.Value;
  dmCuadrexRuta.sp_InsertCuadreCaja.Params[7].Value:= rxCuadreM2000.Value;
  dmCuadrexRuta.sp_InsertCuadreCaja.Params[8].Value:= rxCuadreM1000.Value;
  dmCuadrexRuta.sp_InsertCuadreCaja.Params[9].Value:= rxCuadreM500.Value;
  dmCuadrexRuta.sp_InsertCuadreCaja.Params[10].Value:= rxCuadreM200.Value;
  dmCuadrexRuta.sp_InsertCuadreCaja.Params[11].Value:= rxCuadreM100.Value;
  dmCuadrexRuta.sp_InsertCuadreCaja.Params[12].Value:= rxCuadreM50.Value;
  dmCuadrexRuta.sp_InsertCuadreCaja.Params[13].Value:= rxCuadreM25.Value;
  dmCuadrexRuta.sp_InsertCuadreCaja.Params[14].Value:= rxCuadreM20.Value;
  dmCuadrexRuta.sp_InsertCuadreCaja.Params[15].Value:= rxCuadreM10.Value;
  dmCuadrexRuta.sp_InsertCuadreCaja.Params[16].Value:= rxCuadreM5.Value;
  dmCuadrexRuta.sp_InsertCuadreCaja.Params[17].Value:= rxCuadreMONEDAS.Value;
  dmCuadrexRuta.sp_InsertCuadreCaja.Params[18].Value:= rxCuadreAJUSTE.Value;
  dmCuadrexRuta.sp_InsertCuadreCaja.Params[19].Value:= rxcuadredieta.Value;
  dmCuadrexRuta.sp_InsertCuadreCaja.Params[20].Value:= rxcuadreRetiro.Value;
  dmCuadrexRuta.sp_InsertCuadreCaja.Params[21].Value:= VarUsuarioGlb;
  dmCuadrexRuta.sp_InsertCuadreCaja.Params[22].Value:= 'A';
  dmCuadrexRuta.sp_InsertCuadreCaja.Params[23].Value:= Now;
  dmCuadrexRuta.sp_InsertCuadreCaja.Params[24].Value:= Null;
  dmCuadrexRuta.sp_InsertCuadreCaja.Params[25].Value:= rxCuadreFondoEnCaja.Value;
  dmCuadrexRuta.sp_InsertCuadreCaja.Params[26].Value:= rxCuadreMontoInicialFinanciamiento.Value;
  dmCuadrexRuta.sp_InsertCuadreCaja.ExecProc;
  if not dmCuadrexRuta.sp_InsertCuadreCaja.Transaction.InTransaction then
  dmCuadrexRuta.sp_InsertCuadreCaja.Transaction.StartTransaction;
  try
  dmCuadrexRuta.sp_InsertCuadreCaja.Transaction.CommitRetaining;
  except
  dmCuadrexRuta.sp_InsertCuadreCaja.Transaction.RollbackRetaining;
  end;
  //rxTotales.Close;
  //rxTotales.Open;
  //rxCuadre.Close;
  //rxCuadre.Open;
end;

procedure TfrmCuadreCaja.ProcIniciaRxTotales;
begin
  rxTotales.close;
  rxTotales.Open;
  rxTotales.Insert;

  //rxCuadreMONTO.Value := 0;
  if rxCuadre.State = dsInactive then exit;
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

procedure TfrmCuadreCaja.rxTotalesCalcFields(DataSet: TDataSet);
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

procedure TfrmCuadreCaja.rxCuadreM2000Change(Sender: TField);
begin
  rxTotalesC2000.Value:= 2000 * rxCuadreM2000.Value;
end;

procedure TfrmCuadreCaja.rxCuadreM1000Change(Sender: TField);
begin
  rxTotalesC1000.Value:= 1000 * rxCuadreM1000.Value;
end;

procedure TfrmCuadreCaja.rxCuadreM500Change(Sender: TField);
begin
  rxTotalesC500.Value:= 500 * rxCuadreM500.Value;
end;

procedure TfrmCuadreCaja.rxCuadreM200Change(Sender: TField);
begin
  rxTotalesC200.Value:= 200 * rxCuadreM200.Value;
end;

procedure TfrmCuadreCaja.rxCuadreM100Change(Sender: TField);
begin
  rxTotalesC100.Value:= 100 * rxCuadreM100.Value;
end;

procedure TfrmCuadreCaja.rxCuadreM50Change(Sender: TField);
begin
  rxTotalesC50.Value:= 50 * rxCuadreM50.Value;
end;

procedure TfrmCuadreCaja.rxCuadreM25Change(Sender: TField);
begin
  rxTotalesC25.Value:= 25 * rxCuadreM25.Value;
end;

procedure TfrmCuadreCaja.rxCuadreM20Change(Sender: TField);
begin
  rxTotalesC20.Value:= 20 * rxCuadreM20.Value;
end;

procedure TfrmCuadreCaja.rxCuadreM10Change(Sender: TField);
begin
  rxTotalesC10.Value:= 10 * rxCuadreM10.Value;
end;

procedure TfrmCuadreCaja.rxCuadreM5Change(Sender: TField);
begin
  rxTotalesC5.Value:= 5 * rxCuadreM5.Value;
end;

procedure TfrmCuadreCaja.ProcTotal;
var
  Suma, Total : Extended;
begin
  if (rxCuadre.State in [dsBrowse, dsInactive]) then
  exit;
  Suma:=0;
  dmcxc.qryTipoMvtoIngresoCuadre.Close;
  dmcxc.qryTipoMvtoIngresoCuadre.Params[0].Value := ExtraerFecha(rxCuadreFECHA.Value);
  dmcxc.qryTipoMvtoIngresoCuadre.Params[1].Value := ExtraerFecha(rxCuadreFECHA.Value);
  dmcxc.qryTipoMvtoIngresoCuadre.Params[2].Value := rxCuadreCOD_EMPLEADO.Value;
  dmcxc.qryTipoMvtoIngresoCuadre.ExecQuery;
  Total:=0;
  rxCuadreVentaAlContado.Value  :=0;
  rxCuadreINGRESO_CXC.Value     :=0;
  rxCuadreMONTO_DEVOLUCION.Value:=0;
  rxCuadreVentaACredito.Value   :=0;
  rxCuadreMontoFinanciado.Value :=0;
  rxCuadreMontoInicialFinanciamiento.Value:=0;

  if dmcxc.qryTipoMvtoIngresoCuadre.Open then
  begin
    While Not dmcxc.qryTipoMvtoIngresoCuadre.Eof do
    begin
      if (dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('tipo_doc').AsInteger = 1) or
         (dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('tipo_doc').AsInteger = 3) or
         (dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('tipo_doc').AsInteger = 4) then
      begin
        rxCuadreVentaAlContado.Value := rxCuadreVentaAlContado.Value +
        dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('Monto').AsCurrency;
        Total:=dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('Monto').Value;
      end else
      if (dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('tipo_doc').AsInteger = 2) then
      begin
        Total:=dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('Monto').AsCurrency;
        rxCuadreINGRESO_CXC.Value:=rxCuadreINGRESO_CXC.Value +
        dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('Monto').Value;
      end else
      if (dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('tipo_doc').AsInteger = 6) then
      begin
        Total:=dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('Monto').AsCurrency;
        rxCuadreMONTO_DEVOLUCION.Value:=rxCuadreMONTO_DEVOLUCION.Value +
        dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('Monto').Value;
      end else
      if (dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('tipo_doc').AsInteger = 16) then
      begin
        Total := dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('Monto').AsCurrency;
        rxCuadreMontoFinanciado.Value:= rxCuadreMontoFinanciado.Value +
        dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('Monto').Value;
      end else
      if (dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('tipo_doc').AsInteger = 7) or
         (dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('tipo_doc').AsInteger = 8)
      then
      begin
        Total := dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('Monto').AsCurrency;
        rxCuadreVentaACredito.Value:= rxCuadreVentaACredito.Value +
        dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('Monto').Value;
      end else
      begin
        if (dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('tipo_doc').AsInteger = 15) then
        begin
          Total := dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('Monto').AsCurrency;
          rxCuadreMontoInicialFinanciamiento.Value:= rxCuadreMontoInicialFinanciamiento.Value +
          dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('Monto').Value;
        end;
      end;
      Suma:=Suma + total; //t+ rxTotalesFondoEnCaja.Value;
      dmcxc.qryTipoMvtoIngresoCuadre.Next;
    end;
    Suma:=Suma + rxTotalesFondoEnCaja.Value;
    //qrTotalG.Caption := Format('%*.*m', [10,2, Suma]);
    if rxTotales.State = dsBrowse then
    rxTotales.Edit;
    rxTotalesTotalVenta.Value:= Suma;
  end;
end;

procedure TfrmCuadreCaja.rxCuadreMONEDASChange(Sender: TField);
begin
  rxTotalesMonedas.Value := rxCuadreMONEDAS.Value; 
end;

procedure TfrmCuadreCaja.rxCuadreAJUSTEChange(Sender: TField);
begin
  rxTotalesAjuste.value:= rxCuadreAJUSTE.value;
end;

procedure TfrmCuadreCaja.rxCuadreRETIROChange(Sender: TField);
begin
  rxTotalesRetiro.Value:= rxCuadreRetiro.Value;
end;

procedure TfrmCuadreCaja.rxCuadreDIETAChange(Sender: TField);
begin
  rxTotalesDieta.value:= rxCuadreDieta.value;
end;

procedure TfrmCuadreCaja.BitBtn5Click(Sender: TObject);
begin
  rxTotales.Close;
  rxTotales.Open;
  rxCuadre.Close;
  rxCuadre.Open;
end;

procedure TfrmCuadreCaja.BitBtn2Click(Sender: TObject);
begin
  frmConsultaDatosCCaja:=TfrmConsultaDatosCCaja.Create(Nil);
  try
    if frmConsultaDatosCCaja.ShowModal = mrOk then
    begin
      dmCuadrexRuta.qryDatosCuadreCaja.Close;
      if frmConsultaDatosCCaja.rxConsultatodos.Value = 1 then
      dmCuadrexRuta.qryDatosCuadreCaja.Params[0].Value:= Null
      else
      dmCuadrexRuta.qryDatosCuadreCaja.Params[0].Value:=
      frmConsultaDatosCCaja.rxConsultacodEmpleado.Value;
      
      dmCuadrexRuta.qryDatosCuadreCaja.Params[1].Value:=
      ExtraerFecha(frmConsultaDatosCCaja.rxConsultafechaIni.Value);

      dmCuadrexRuta.qryDatosCuadreCaja.Open;
      if (dmCuadrexRuta.qryDatosCuadreCaja.RecordCount > 0) then
      begin
        ProcInsDatosConsulta;
        ProcTotal;
      end else
      MessageDlg('No existen datos para los parámetros suministrados.',mtInformation, [mbOK], 0);
    end;
  finally
  frmConsultaDatosCCaja.Free;
  frmConsultaDatosCCaja:=Nil;
  end;
end;

procedure TfrmCuadreCaja.ProcInsDatosConsulta;
begin
  rxTotales.close;
  rxTotales.Open;
  rxTotales.Insert;
  rxCuadre.close;
  rxCuadre.Open;
  rxCuadre.Insert;
  rxCuadreCod_Empleado.Value := dmCuadrexRuta.qryDatosCuadreCajaCOD_EMPLEADO.Value;
  rxCuadreNombreEmpleado.Value:= UpperCase(dmUsuarios.qryUsuariosNOMBRECOMPLETO.Value);

  rxCuadreFecha.Value        := dmCuadrexRuta.qryDatosCuadreCajaFECHA.Value;
  //rxCuadreIngreso_Cxc.Value  := dmCuadrexRuta.qryDatosCuadreCajaINGRESO_CXC.Value;
  //rxCuadreVentaACredito.Value:= dmCuadrexRuta.qryDatosCuadreCajaVENTA_A_CREDITO.Value;
  //rxcuadreVentaAlcontado.Value := dmCuadrexRuta.qryDatosCuadreCajaVENTA_AL_CONTADO.Value;
  //rxCuadreMONTO_DEVOLUCION.Value := dmCuadrexRuta.qryDatosCuadreCajaMONTO_DEVOLUCION.Value;
  rxCuadremonto_En_cheque.Value  := dmCuadrexRuta.qryDatosCuadreCajaMONTO_EN_CHEQUE.Value;
  rxCuadreM2000.Value := dmCuadrexRuta.qryDatosCuadreCajaM2000.Value;
  rxCuadreM1000.Value := dmCuadrexRuta.qryDatosCuadreCajaM1000.Value;
  rxCuadreM500.Value  := dmCuadrexRuta.qryDatosCuadreCajaM500.Value;
  rxCuadreM200.Value  := dmCuadrexRuta.qryDatosCuadreCajaM200.Value;
  rxCuadreM100.Value  := dmCuadrexRuta.qryDatosCuadreCajaM100.Value;
  rxCuadreM50.Value   := dmCuadrexRuta.qryDatosCuadreCajaM50.Value;
  rxCuadreM25.Value   := dmCuadrexRuta.qryDatosCuadreCajaM25.Value;
  rxCuadreM20.Value   := dmCuadrexRuta.qryDatosCuadreCajaM20.Value;
  rxCuadreM10.Value   := dmCuadrexRuta.qryDatosCuadreCajaM10.Value;
  rxCuadreM5.Value    := dmCuadrexRuta.qryDatosCuadreCajaM5.Value;
  rxCuadreMONEDAS.Value := dmCuadrexRuta.qryDatosCuadreCajaMONTO_MONEDAS.Value;
  rxCuadreAJUSTE.Value  := dmCuadrexRuta.qryDatosCuadreCajaMONTO_AJUSTE.Value;
  rxcuadredieta.Value   := dmCuadrexRuta.qryDatosCuadreCajaMONTO_DIETA.Value;
  rxcuadreRetiro.Value  := dmCuadrexRuta.qryDatosCuadreCajaMONTO_RETIRO.Value;
  rxCuadreFondoEnCaja.Value :=  dmCuadrexRuta.qryDatosCuadreCajaMONTO_EN_FONDO.Value;
end;

procedure TfrmCuadreCaja.rxCuadreMONTO_EN_CHEQUEChange(Sender: TField);
begin
  rxTotalesMontoEnCheque.Value := rxCuadreMONTO_EN_CHEQUE.Value;
end;

procedure TfrmCuadreCaja.rxCuadreFondoEnCajaChange(Sender: TField);
begin
  rxTotalesFondoEnCaja.value:= rxCuadreFondoEnCaja.value;
end;

procedure TfrmCuadreCaja.BitBtn4Click(Sender: TObject);
begin
  qckRepCuadreCaja:=TqckRepCuadreCaja.Create(Nil);
  try
    qckRepCuadreCaja.QRLabel46.Caption := Label1.Caption;
    qckRepCuadreCaja.Preview;
  finally
  qckRepCuadreCaja.Free;
  qckRepCuadreCaja:= Nil;
  end;
  rxTotales.Close;
  rxTotales.Open;
  rxCuadre.Close;
  rxCuadre.Open;
end;

procedure TfrmCuadreCaja.DBEdit34Exit(Sender: TObject);
begin
  if rxCuadre.State In [dsEdit, dsInsert] then
  rxCuadreNombreEmpleado.Value:= UpperCase(dmUsuarios.qryUsuariosNOMBRECOMPLETO.Value);
  ProcTotal;
end;

procedure TfrmCuadreCaja.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose:=False;
  if (rxCuadre.State In [dsEdit, dsInsert]) OR
     (rxTotales.State In [dsEdit, dsInsert])then
  begin
    MessageDlg('Hay una transaccion activa, verifique', mtInformation, [mbOK], 0);
    Exit;
  end;
  CanClose:=True;
end;

procedure TfrmCuadreCaja.DBEdit36Change(Sender: TObject);
begin
  ProcTotal;
end;

procedure TfrmCuadreCaja.DBDateEdit1Change(Sender: TObject);
begin
  ProcTotal;
end;

end.
