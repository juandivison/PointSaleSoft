unit URegistrarTransOpeDiaria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DBDateTimePicker, DBCtrls, StdCtrls, Mask, RxDBComb,
  db,Grids, DBGrids, Buttons, ExtCtrls, RXCtrls, RXDBCtrl, WinSkinData,
  rxToolEdit, RxLookup, IBCustomDataSet, IBStoredProc, IBSQL, GetAnyDate,
  IBQuery, IBTable;

type
  TfrmRegTransOpeDiaria = class(TForm)                                             
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Shape1: TShape;
    DBStatusLabel1: TDBStatusLabel;
    DBStatusLabel2: TDBStatusLabel;
    Label14: TLabel;
    Label6: TLabel;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    BitBtn1: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    DBEdit1: TDBEdit;
    BitBtn8: TBitBtn;
    DBDateEdit1: TDBDateEdit;
    RxDBLookupCombo1: TRxDBLookupCombo;
    RxDBLookupCombo2: TRxDBLookupCombo;
    RxDBLookupCombo3: TRxDBLookupCombo;
    RxDBLookupCombo4: TRxDBLookupCombo;
    RxDBLookupCombo5: TRxDBLookupCombo;
    SkinData1: TSkinData;
    DBEdit2: TDBEdit;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;
    Label15: TLabel;
    Label16: TLabel;
    RxDBLookupCombo6: TRxDBLookupCombo;
    DBEdit10: TDBEdit;
    ibSqlUpdateTransCostoStatus: TIBSQL;
    ibSqlUpdateTransCostoStatusDet: TIBSQL;
    stpProcUpdateTrncxp: TIBStoredProc;
    stpProcActBalanceProvcxp: TIBStoredProc;
    SelFecha: TGetAnyDate;
    DBEdit11: TDBEdit;
    Label17: TLabel;
    RxDBGrid1: TRxDBGrid;
    RxDBGrid2: TRxDBGrid;
    DBEdit12: TDBEdit;
    Label18: TLabel;
    BitBtn15: TBitBtn;
    DBEdit13: TDBEdit;
    Label19: TLabel;
    qryTasaItbis: TIBQuery;
    qryTasaItbisIDTASAITBIS: TSmallintField;
    qryTasaItbisFECHAINI: TDateTimeField;
    qryTasaItbisFECHAFIN: TDateTimeField;
    qryTasaItbisDESCRIPCION: TIBStringField;
    qryTasaItbisPORCIENTO: TFloatField;
    qryTasaItbisUSER_IN: TIntegerField;
    qryTasaItbisUSER_MOD: TIntegerField;
    qryTasaItbisIN_POR: TIBStringField;
    qryTasaItbisFECHA_IN: TDateTimeField;
    qryTasaItbisMOD_POR: TIBStringField;
    qryTasaItbisSTATUS: TIBStringField;
    qryTasaItbisFECHA_UPDATE: TDateTimeField;
    qryTasaItbisSIMBOLO_TASA: TIBStringField;
    dsqryTasaItbis: TDataSource;
    RxDBLookupCombo7: TRxDBLookupCombo;
    Label20: TLabel;
    RxDBLookupCombo8: TRxDBLookupCombo;
    Label21: TLabel;
    DBEdit14: TDBEdit;
    DBDateEdit2: TDBDateEdit;
    Label22: TLabel;
    BitBtn16: TBitBtn;
    BitBtn17: TBitBtn;
    BitBtn18: TBitBtn;
    RxDBLookupCombo9: TRxDBLookupCombo;
    Label23: TLabel;
    dsqryVehiculos: TDataSource;
    qryVehiculos: TIBQuery;
    qryVehiculosFICHA: TIntegerField;
    qryVehiculosPLACA: TIBStringField;
    tblTipoPagoCxp: TIBTable;
    tblTipoPagoCxpCODIGO: TSmallintField;
    tblTipoPagoCxpDESCRIPCION: TIBStringField;
    dstblTipoPagoCxp: TDataSource;
    RxDBLookupCombo10: TRxDBLookupCombo;
    Label24: TLabel;
    BitBtn19: TBitBtn;
    BitBtn20: TBitBtn;
    BitBtn21: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure DBEdit6Exit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure RxDBGrid2GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure DBEdit10Exit(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure DBDateEdit1Change(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure BitBtn18Click(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn19Click(Sender: TObject);
    procedure BitBtn20Click(Sender: TObject);
    procedure BitBtn21Click(Sender: TObject);
  private
    { Private declarations }
    procedure sumar;
    procedure CalcularValor;
    procedure ProcInsertarCXP(monto : Real; serieDoc:Integer;codProveedor:Integer; tipo:smallint;concepto:string);
    procedure ProcInsertarCXPActual(monto : Real; serieDoc:Integer;codProveedor:Integer; tipo:smallint;concepto:string);
    function ProcVerificaNCF : Boolean;

  public
    { Public declarations }
  end;

var
  frmRegTransOpeDiaria: TfrmRegTransOpeDiaria;
  esRevertir : Boolean;

implementation

uses UDatModRegOpeDiaria, UFormSelFecha, UGlobal, URepTransOpeDiaria,
  UDatModReportes, UDatModConectar, UDatModCxp,
  UDatModFactura, uFormAsignarNCFVentaGastos, USeleccionarNCFGastos,
  URepTransCostoGastos, UFormDatosRepCostosGastos, UDatModCompania,
  UBuscarProveedores, UFormCentroDeCostos, UFormProductosServicios;

{$R *.dfm}

procedure TfrmRegTransOpeDiaria.BitBtn1Click(Sender: TObject);
begin
  if dtmTransOpeDiaria.tblRegTransOpeDiariaMast.State = dsbrowse then
  begin
    dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Append;
    dtmTransOpeDiaria.tblRegTransOpeDiariaMastCIA_KEY.Value := glbCia_Key;
    
    dtmTransOpeDiaria.tblRegTransOpeDiariaMastFECHA.Value:=ExtraerFecha(GlbFechaTrnDiaria);
    dtmTransOpeDiaria.tblRegTransOpeDiariaMastSTATUS.Value  := 'A';
    dtmTransOpeDiaria.tblRegTransOpeDiariaMastCOD_PROVEEDOR.Value:=0;
    dtmTransOpeDiaria.tblRegTransOpeDiariaMastFPAGO.Value   := 1;
    dtmTransOpeDiaria.tblRegTransOpeDiariaMastFECHA_IN.Value:= Now;
    dtmTransOpeDiaria.tblRegTransOpeDiariaMastIN_POR.Value  := StrUserName;
    dtmTransOpeDiaria.tblRegTransOpeDiariaDet.Append;
    dtmTransOpeDiaria.tblRegTransOpeDiariaDetIN_POR.Value   := StrUserName;
    dtmTransOpeDiaria.tblRegTransOpeDiariaDetFECHA_IN.Value := Now;
    dtmTransOpeDiaria.tblRegTransOpeDiariaDetSTATUS.Value   := 'A';
    RxDBLookupCombo1.SetFocus;
  end;
end;

procedure TfrmRegTransOpeDiaria.FormCreate(Sender: TObject);
begin
  dtmTransOpeDiaria.tblRegTransOpeDiariaDet.Close;
  dtmTransOpeDiaria.tblRegTransOpeDiariaDet.Params[0].Value:=-1;
  dtmTransOpeDiaria.tblRegTransOpeDiariaDet.Open;
  tblTipoPagoCxp.close;
  tblTipoPagoCxp.open;
  frmSelFecha:=TfrmSelFecha.Create(Nil);
  try

    frmSelFecha.CheckBox1.Visible := False;
    frmSelFecha.FechaIni.DateTime:=GlbFechaTrnDiaria;
    frmSelFecha.FechaFin.DateTime:=GlbFechaTrnDiaria;
    if frmSelFecha.ShowModal = mrOk then
    begin
      dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Close;
      dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Params[0].Value:= ExtraerFecha(frmSelFecha.FechaIni.DateTime);
      dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Params[1].Value:= ExtraerFecha(frmSelFecha.FechaFin.DateTime);
      dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Open;

      qryTasaItbis.Close;
      qryTasaItbis.Open;
    end;
  finally
  frmSelFecha.Free;
  frmSelFecha:=Nil;
  end;

  dtmTransOpeDiaria.tblTipoCompra.Close;
  dtmTransOpeDiaria.tblTipoCompra.Open;
  dtmTransOpeDiaria.tblProductosServicios.close;
  dtmTransOpeDiaria.tblProductosServicios.Open;
  dtmtransopediaria.qryProdServicio.Close;
  dtmtransopediaria.qryProdServicio.Open;
  dtmtransopediaria.qryDeptos.Close;
  dtmtransopediaria.qryDeptos.Open;
  dtmtransopediaria.qryCentroCostos.Close;
  dtmtransopediaria.qryCentroCostos.Open;
  dtmTransOpeDiaria.tblCondicion.Close;
  dtmTransOpeDiaria.tblCondicion.Open;
  dtmTransOpeDiaria.qryProveedor.Close;
  dtmTransOpeDiaria.qryProveedor.Open;
  dtmTransOpeDiaria.tblTipoCF.Close;
  dtmTransOpeDiaria.tblTipoCF.Open;
  qryVehiculos.Close;
  qryVehiculos.Open;
end;

procedure TfrmRegTransOpeDiaria.BitBtn5Click(Sender: TObject);
begin
  if dtmTransOpeDiaria.tblRegTransOpeDiariaMast.State in [dsBrowse, dsInactive] then
  begin
  frmSelFecha:=TfrmSelFecha.Create(Nil);
  try
    if frmSelFecha.ShowModal = mrOk then
    begin
      dtmTransOpeDiaria.tblOrdenCompraDet.Close;
      dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Close;
      dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Params[0].Value:= ExtraerFecha(frmSelFecha.FechaIni.DateTime);
      dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Params[1].Value:= ExtraerFecha(frmSelFecha.FechaFin.DateTime);
      dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Open;
    end;
  finally
  frmSelFecha.Free;
  frmSelFecha:=Nil;
  end;
  end;
end;

procedure TfrmRegTransOpeDiaria.BitBtn7Click(Sender: TObject);
begin
  if dtmTransOpeDiaria.tblRegTransOpeDiariaMast.State In [dsInsert, dsEdit] then
  begin
    dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Post;
    dtmTransOpeDiaria.tblRegTransOpeDiariaMast.ApplyUpdates;
    if Not dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Transaction.InTransaction then
    dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Transaction.StartTransaction;
    try
      dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Transaction.CommitRetaining;
    except
    dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Transaction.RollbackRetaining;
    end;
  end;
  
  if dtmTransOpeDiaria.tblRegTransOpeDiariaDet.State in [dsBrowse] then
  begin
    dtmTransOpeDiaria.tblRegTransOpeDiariaDet.Insert;
    dtmTransOpeDiaria.tblRegTransOpeDiariaDetIN_POR.Value   := StrUserName;
    dtmTransOpeDiaria.tblRegTransOpeDiariaDetFECHA_IN.Value := Now;
    dtmTransOpeDiaria.tblRegTransOpeDiariaDetSTATUS.Value   := 'A';
    RxDBLookupCombo3.SetFocus;
  end;
end;

procedure TfrmRegTransOpeDiaria.BitBtn4Click(Sender: TObject);
begin
  if dtmTransOpeDiaria.tblRegTransOpeDiariaMast.State In [dsInsert, dsEdit] then
  begin
    {if (dtmTransOpeDiaria.tblRegTransOpeDiariaMastTIPO_CF.Value <>
    MyStrCopyRango(dtmTransOpeDiaria.tblRegTransOpeDiariaMastNUMERO_NCF.Value, 10,11)) then
    begin
      MessageDlg('Tipo de comprobante no coincide con el NCF indicado, verifique', mtInformation, [mbOK], 0);
      exit;
    end;  }
    if not ProcVerificaNCF then
    begin
      MessageDlg('Tipo de comprobante no coincide con el NCF indicado, verifique', mtInformation, [mbOK], 0);
      exit;
    end;
    if dtmTransOpeDiaria.tblRegTransOpeDiariaMastCIA_KEY.IsNull then
    dtmTransOpeDiaria.tblRegTransOpeDiariaMastCIA_KEY.Value:=glbCia_Key;
    GlbSalvarQuery(dtmTransOpeDiaria.tblRegTransOpeDiariaMast);
  end;
  if dtmTransOpeDiaria.tblRegTransOpeDiariaDet.State In [dsInsert] then
  begin
    if dtmTransOpeDiaria.tblRegTransOpeDiariaDetNUMERO.IsNull then
    dtmTransOpeDiaria.tblRegTransOpeDiariaDetNumero.Value:=
    dtmTransOpeDiaria.tblRegTransOpeDiariaMastNUMERO.Value;
  end;

  if dtmTransOpeDiaria.tblRegTransOpeDiariaDet.State In [dsInsert, dsEdit] then
  begin
    dtmTransOpeDiaria.tblRegTransOpeDiariaDetCODIGO_USUARIO.Value := VarUsuarioGlb;
    GlbSalvarQuery(dtmTransOpeDiaria.tblRegTransOpeDiariaDet);
    Sumar;
    if dtmTransOpeDiaria.tblRegTransOpeDiariaMastMonto.IsNull or 
       (dtmTransOpeDiaria.tblRegTransOpeDiariaMastMonto.Value <= 0) then
    begin
      MessageDlg('Monto no puede ser nulo o cero, verifique', mtInformation, [mbOK], 0);
      exit;
    end;
  end;
end;

procedure TfrmRegTransOpeDiaria.BitBtn3Click(Sender: TObject);
begin
  if dtmTransOpeDiaria.tblRegTransOpeDiariaDet.State In [dsInsert, dsEdit] then
  dtmTransOpeDiaria.tblRegTransOpeDiariaDet.Cancel;
  if dtmTransOpeDiaria.tblRegTransOpeDiariaMast.State In [dsInsert, dsEdit] then
  dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Cancel;  
end;

procedure TfrmRegTransOpeDiaria.BitBtn2Click(Sender: TObject);
begin
  if dtmTransOpeDiaria.tblRegTransOpeDiariaMast.State = dsBrowse then
  dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Edit;
end;

procedure TfrmRegTransOpeDiaria.sumar;
var
  Suma : Real;
begin
  if dtmTransOpeDiaria.tblRegTransOpeDiariaDet.State in [dsBrowse] then
  begin
    if dtmTransOpeDiaria.tblRegTransOpeDiariaDet.RecordCount = 0 then exit;
    dtmTransOpeDiaria.tblRegTransOpeDiariaDet.DisableControls;
    dtmTransOpeDiaria.tblRegTransOpeDiariaDet.First;
    Suma:=0;
    
    While Not dtmTransOpeDiaria.tblRegTransOpeDiariaDet.eof do
    begin
      Suma:=Suma + dtmTransOpeDiaria.tblRegTransOpeDiariaDetVALOR.Value;
      dtmTransOpeDiaria.tblRegTransOpeDiariaDet.Next;
    end;
    dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Edit;
    dtmTransOpeDiaria.tblRegTransOpeDiariaMastMONTO.Value:=Suma;

    if dtmTransOpeDiaria.tblRegTransOpeDiariaMast.State In [dsInsert, dsEdit] then
    GlbSalvarQuery(dtmTransOpeDiaria.tblRegTransOpeDiariaMast);

    dtmTransOpeDiaria.tblRegTransOpeDiariaDet.EnableControls;
  end;
end;

procedure TfrmRegTransOpeDiaria.BitBtn8Click(Sender: TObject);
begin
  if (GlbFormatoConduce <> 444) then //and (GlbFarmacia = 0) then
  begin
    frmDatosRepCostos:=TfrmDatosRepCostos.Create(nil);
    try
      if frmDatosRepCostos.ShowModal = mrOk then
      begin
        dmReportes.qryRepTransOpeDiaria.close;
        dmReportes.qryRepTransOpeDiaria.params[0].Value:= ExtraerFecha(frmDatosRepCostos.DateTimePicker1.Date);
        dmReportes.qryRepTransOpeDiaria.params[1].Value:= ExtraerFecha(frmDatosRepCostos.DateTimePicker2.Date);
        dmReportes.qryRepTransOpeDiaria.open;

        dmReportes._FPago := frmDatosRepCostos._FPago;
        dmReportes._FCodProv := frmDatosRepCostos._FCodProv;
        if (frmDatosRepCostos._FPago > 0) or (frmDatosRepCostos._FCodProv > 0) then
        dmReportes.qryRepTransOpeDiaria.Filtered:= True
        else
        dmReportes.qryRepTransOpeDiaria.Filtered:= False;

        qckTransCostosGastos:=TqckTransCostosGastos.Create(nil);
        try
          qckTransCostosGastos.Prepare;
          qckTransCostosGastos.TPag.Caption:= IntToStr(qckTransCostosGastos.PageNumber);        
          qckTransCostosGastos.Preview;

          if frmDatosRepCostos.chboxExportExcel.Checked then
          begin
            dmCompania.tblCompania.Close;
            dmCompania.tblCompania.Open;
            dmCompania.tblCompania.Locate('codigo',glbCia_Key,[]);
            GLBMostrarArchivo:=True;
            ExporToExcel(dmreportes.qryRepTransOpeDiaria, ExtractFilePath(Application.ExeName)+
            'Informes\RelacionGastosRep606'+
            FormatDateTime('ddmmyyyy',dmreportes.qryRepTransOpeDiaria.Params[0].Value)+'_'
            +FormatDateTime('ddmmyyyy',dmreportes.qryRepTransOpeDiaria.Params[1].Value),false);
            GLBMostrarArchivo:=False;
          end;
                    
        finally
        qckTransCostosGastos.Free;
        qckTransCostosGastos:=Nil;
        end;
      end;
    finally
    frmDatosRepCostos.free;
    frmDatosRepCostos:=nil;
    end;
  end else
  begin
    frmSelFEcha:=TfrmSelFEcha.create(nil);
    try
      if frmSelFEcha.showmodal = mrOk then
      begin
        dmReportes.qryRepTransOpeDiaria.close;
        dmReportes.qryRepTransOpeDiaria.params[0].Value:= ExtraerFecha(frmSelfecha.FechaIni.Date);
        dmReportes.qryRepTransOpeDiaria.params[1].Value:= ExtraerFecha(frmSelfecha.FechaFin.Date);
        dmReportes.qryRepTransOpeDiaria.open;

        qckTransOpeDiaria:=TqckTransOpeDiaria.Create(nil);
        try
          qckTransOpeDiaria.Prepare;
          qckTransOpeDiaria.TPag.Caption:= IntToStr(qckTransOpeDiaria.PageNumber);
          qckTransOpeDiaria.Preview;
        finally
        qckTransOpeDiaria.Free;
        qckTransOpeDiaria:=Nil;
        end;
      end;
    finally
    frmSelFEcha.Free;
    frmSelFEcha:=Nil;
    end;
  end;
end;

procedure TfrmRegTransOpeDiaria.BitBtn9Click(Sender: TObject);
begin
  dtmTransOpeDiaria.tblRegTransOpeDiariaMast.First;
end;

procedure TfrmRegTransOpeDiaria.BitBtn10Click(Sender: TObject);
begin
  dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Prior;
end;

procedure TfrmRegTransOpeDiaria.BitBtn11Click(Sender: TObject);
begin
  dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Next;
end;

procedure TfrmRegTransOpeDiaria.BitBtn12Click(Sender: TObject);
begin
  dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Last;
end;

procedure TfrmRegTransOpeDiaria.CalcularValor;
begin
  if dtmTransOpeDiaria.tblRegTransOpeDiariaDet.State in [dsEdit, dsInsert] then
  begin
    dtmTransOpeDiaria.tblRegTransOpeDiariaDetValor.Value:=
    dtmTransOpeDiaria.tblRegTransOpeDiariaDetCantidad.Value *
    dtmTransOpeDiaria.tblRegTransOpeDiariaDetPrecio.Value;
  end;
end;

procedure TfrmRegTransOpeDiaria.DBEdit3Exit(Sender: TObject);
begin
  CalcularValor;
end;

procedure TfrmRegTransOpeDiaria.DBEdit6Exit(Sender: TObject);
begin
  CalcularValor;
end;

procedure TfrmRegTransOpeDiaria.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if dtmTransOpeDiaria.tblRegTransOpeDiariaDet.State in [dsEdit, dsInsert] then
  begin
    if not dtmTransOpeDiaria.tblRegTransOpeDiariaMastNUMERO_NCF.IsNull then
    begin
       MessageDlg('Hay una transacción pendiente, Verifique', mtInformation,[mbOK],0);
       Exit;
    end;
    if MessageDlg('Hay una transacción pendiente, desea salir?', mtWarning,[mbYes, mbNo],0)= mrNo then
    CanClose:= False
    else CanClose:= True;
  end;
  if (CanClose) then
  begin
    if dtmTransOpeDiaria.tblRegTransOpeDiariaMast.State in [dsEdit, dsInsert] then
    begin
      if MessageDlg('Hay una transacción pendiente, desea salir?', mtWarning,[mbYes, mbNo],0)= mrNo then
      CanClose:= False
      else CanClose:= True;
    end;
  end;
end;

procedure TfrmRegTransOpeDiaria.BitBtn13Click(Sender: TObject);
var
   fechaI, fechaF : TDateTime;
   flag : Boolean;
   strFecha : String;
begin
  flag:=False;
  if dtmTransOpeDiaria.tblRegTransOpeDiariaMastMonto.IsNull or 
    (dtmTransOpeDiaria.tblRegTransOpeDiariaMastMonto.Value <= 0) then
  begin
    MessageDlg('Monto no puede ser nulo o cero, verifique', mtInformation, [mbOK], 0);
    exit;
  end;

  //if (dtmTransOpeDiaria.tblRegTransOpeDiariaMastFPAGO.Value <> 2) then
  //begin
  //  MessageDlg('Operación no procede para: '+UpperCase(dtmTransOpeDiaria.tblCondicionDESCRIPCION.Value), mtInformation, [mbOK], 0);
  //  Exit;
  //end;

  if dtmTransOpeDiaria.tblRegTransOpeDiariaMast.State in [dsEdit, dsInsert] then Exit;
  if dtmTransOpeDiaria.tblRegTransOpeDiariaDet.State in [dsEdit, dsInsert] then Exit;

  if dtmTransOpeDiaria.tblRegTransOpeDiariaDet.RecordCount = 0 then
  begin
    MessageDlg('No tienes detalle registrado, verifique.', mtError, [mbOK], 0);
    Exit;
  end;

  fechaI := dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Params[0].Value;
  fechaF := dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Params[1].Value;

  strFecha:= FormatDateTime('dd/mmm/yyyy',fechaI)+' hasta '+FormatDateTime('dd/mmm/yyyy',fechaF);

  SelFecha.UsaFechaCierre:=True;
  SelFecha.Fecha      := fechaI;
  SelFecha.FechaCierre:= fechaI;
  SelFecha.FechaFinal := fechaF;
  if SelFecha.Execute then
  begin
    dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Close;
    dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Params[0].Value:= ExtraerFecha(SelFecha.Fecha);
    dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Params[1].Value:= ExtraerFecha(SelFecha.FechaFinal);
    dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Open;
    dtmTransOpeDiaria.tblRegTransOpeDiariaMast.DisableControls;
    dtmTransOpeDiaria.tblRegTransOpeDiariaMast.First;

    fechaI := dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Params[0].Value;
    fechaF := dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Params[1].Value;

    While Not dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Eof do
    begin
      if (dtmTransOpeDiaria.tblRegTransOpeDiariaMastFPAGO.Value <> 2) then
      begin
        dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Next;
        continue;
      end;
      if (dtmTransOpeDiaria.tblRegTransOpeDiariaMastSTATUS.Value = 'R') then
      begin
        dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Next;
        continue;
      end;

      ProcInsertarCXP(dtmTransOpeDiaria.tblRegTransOpeDiariaMastMONTO.Value,
      dtmTransOpeDiaria.tblRegTransOpeDiariaMastNumero.Value,
      dtmTransOpeDiaria.tblRegTransOpeDiariaMastCOD_PROVEEDOR.Value,
      2,dtmTransOpeDiaria.tblRegTransOpeDiariaMastOBSERVACION.Value);

      if (ibSqlUpdateTransCostoStatus.Open) then
      ibSqlUpdateTransCostoStatus.Close;
      ibSqlUpdateTransCostoStatus.Params[0].Value := 'R';
      ibSqlUpdateTransCostoStatus.Params[1].Value := 'R';
      ibSqlUpdateTransCostoStatus.Params[2].Value := dtmTransOpeDiaria.tblRegTransOpeDiariaMastNumero.Value;
      ibSqlUpdateTransCostoStatus.ExecQuery;

      ibSqlUpdateTransCostoStatusDet.Params[0].Value := 'R';
      ibSqlUpdateTransCostoStatusDet.Params[1].Value := 'R';
      ibSqlUpdateTransCostoStatusDet.Params[2].Value := dtmTransOpeDiaria.tblRegTransOpeDiariaMastNumero.Value;

      if (ibSqlUpdateTransCostoStatusDet.Open) then
      ibSqlUpdateTransCostoStatusDet.Close;
      flag := true;
      dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Next;
    end;
    dtmTransOpeDiaria.tblRegTransOpeDiariaMast.EnableControls;
    if flag then
    MessageDlg('Proceso realizado',mtInformation,[mbok], 0);
    strFecha:= FormatDateTime('dd/mmm/yyyy',fechaI)+' hasta '+FormatDateTime('dd/mmm/yyyy',fechaF);

    dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Close;
    dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Params[0].Value:= ExtraerFecha(FechaI);
    dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Params[1].Value:= ExtraerFecha(FechaF);
    dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Open;
    dtmTransOpeDiaria.tblRegTransOpeDiariaMast.First;
  end;
end;

procedure TfrmRegTransOpeDiaria.BitBtn14Click(Sender: TObject);
begin
  if dtmTransOpeDiaria.tblRegTransOpeDiariaMast.State in [dsEdit, dsInsert] then exit;
  if (dtmTransOpeDiaria.tblRegTransOpeDiariaMastSTATUS.Value = 'R') And
     (dtmTransOpeDiaria.tblRegTransOpeDiariaMastFPAGO.Value = 2 ) then
  begin
    if MessageDlg('Revertir monto cxp?', mtWarning, [mbYes, mbNo], 0) = mrYes then
    begin
      esRevertir:=True;
      ProcInsertarCXPActual(dtmTransOpeDiaria.tblRegTransOpeDiariaMastMONTO.Value,
      dtmTransOpeDiaria.tblRegTransOpeDiariaMastNumero.Value,
      dtmTransOpeDiaria.tblRegTransOpeDiariaMastCOD_PROVEEDOR.Value,
      1,'REVERTIR');
    end;
    esRevertir:=False;
  end;
end;

procedure TfrmRegTransOpeDiaria.ProcInsertarCXP(monto: Real; serieDoc,
  codProveedor: Integer; tipo: smallint; concepto: string);
begin
  if (monto = 0) then exit;
  if dmCxp.tblTransCxp.State = dsInactive then
  begin
    dmCxp.tblTransCxp.Close;
    dmCxp.tblTransCxp.Params[0].Value:=ExtraerFecha(dtmTransOpeDiaria.tblRegTransOpeDiariaMastFecha.Value);
    dmCxp.tblTransCxp.Params[1].Value:=ExtraerFecha(dtmTransOpeDiaria.tblRegTransOpeDiariaMastFecha.Value);
    dmCxp.tblTransCxp.Open;
  end;

    dmCxp.tblTransCxp.Insert;
    dmCxp.tblTransCxpserieTRNCOSTO.Value := serieDoc;
    dmCxp.tblTransCxpCODIGO_USUARIO.Value:= VarUsuarioGlb;
    dmCxp.tblTransCxpCIA_KEY.Value := GlbCia_Key;

    dmCxp.tblTransCxpSTATUS.Value  :='A';
    //dmCxc.tblTransCxcconcepto.Value  := 'Pago cuota';
    //if (tipo = 1) then
    //begin
    dmCxp.tblTransCxpTIPO_DOC.Value := tipo;//1; //Factura
    dmCxp.tblTransCxpconcepto.Value := Concepto + '#Fact.'+dtmTransOpeDiaria.tblRegTransOpeDiariaMastNUMERO.AsString;//'Servicio Transporte';
    //end else dmCxp.tblTransCxpTIPO_DOC.Value := 2; //Recibo
    dmCxp.tblTransCxpmoneda.Value   := '1';//pesos
    dmCxp.tblTransCxpfecha.Value    := ExtraerFecha(GlbFechatrndiaria);

    dmCxp.tblTransCxpcodigo_cliente.Value := codProveedor;//rxViajesCodPropietario.Value;
    dmCxp.tblTransCxpcodigo_serv.Value    := 0;
    dmCxp.tblTransCxpNUMERO_DOC.Value     := dtmTransOpeDiaria.tblRegTransOpeDiariaMastNUMERO.Value;

    dmCxp.tblTransCxpvalor_documento.Value:= monto;
    //rxViajesMONTO_CXP.Value - rxViajesMontoTotalRetenciones.Value;
    if tipo = 2 then
    dmCxp.tblTransCxptipo_tranf.Value     := 1 //1-Debito; 2-Credito
    else
    dmCxp.tblTransCxptipo_tranf.Value     := 2;

    dmCxp.tblTransCxptipo_serv.Value      := 0;
    dmCxp.tblTransCxpfecha_in.Value       := Now;
    dmCxp.tblTransCxpIN_POR.Value         := StrUserName;
    dmCxp.tblTransCxp.Post;
    dmCxp.tblTransCxp.ApplyUpdates;

    if Not dmCxp.tblTransCxp.Transaction.InTransaction then
    dmCxp.tblTransCxp.Transaction.StartTransaction;
    try
      dmCxp.tblTransCxp.Transaction.CommitRetaining;
    except
    dmCxp.tblTransCxp.Transaction.RollbackRetaining;
    end;
    //Insertar Factura pendiente de pago
    //PARA LOS GASTOS NO ES NECESARIO, YA QUE SE APLICA DIRECTO AL CXP PROVEEDORES
    if (dmCxp.tblTransCxptipo_tranf.Value = 1) then //factura
    begin
      dmcxp.stpInsFactPendiente.Params[0].Value := codProveedor;
      dmcxp.stpInsFactPendiente.Params[1].Value := 0;
      dmcxp.stpInsFactPendiente.Params[2].Value := '1';
      dmcxp.stpInsFactPendiente.Params[3].Value := dtmTransOpeDiaria.tblRegTransOpeDiariaMastNUMERO.Value;
      dmcxp.stpInsFactPendiente.Params[4].Value := Monto;
      dmcxp.stpInsFactPendiente.Params[5].Value := ExtraerFecha(dmCxp.tblTransCxpFECHA.Value);
      if Not dtmTransOpeDiaria.tblRegTransOpeDiariaMastTIPO_CF.IsNull then
      dmcxp.stpInsFactPendiente.Params[6].Value := dtmTransOpeDiaria.tblRegTransOpeDiariaMastTIPO_CF.Value
      else
      dmcxp.stpInsFactPendiente.Params[6].Value := null;
      dmcxp.stpInsFactPendiente.Params[7].Value := ExtraerFecha(dtmTransOpeDiaria.tblRegTransOpeDiariaMastFECHA_VENCE.Value);
      if not dtmTransOpeDiaria.tblRegTransOpeDiariaDetNUMERO_FACTURA.IsNull then
      dmcxp.stpInsFactPendiente.Params[8].Value := dtmTransOpeDiaria.tblRegTransOpeDiariaDetNUMERO_FACTURA.AsString //num_fact_prov
      else
      dmcxp.stpInsFactPendiente.Params[8].Value := dtmTransOpeDiaria.tblRegTransOpeDiariaDetNUMERO_DOCUMENTO.AsString; //num_fact_prov
      dmcxp.stpInsFactPendiente.ExecProc;
    end;
    if Not dmCxp.stpInsFactPendiente.Transaction.InTransaction then
    dmCxp.stpInsFactPendiente.Transaction.StartTransaction;
    try
      dmCxp.stpInsFactPendiente.Transaction.CommitRetaining;
    except
    dmCxp.stpInsFactPendiente.Transaction.RollbackRetaining;
    end;
    //stpProcActBalanceProvcxp.Params[0].Value -return Valor_Pendiente
    //Actualiza factura pendiente y balance cxp a proveedor
    stpProcActBalanceProvcxp.Params[1].Value := dmCxp.tblTransCxpCODIGO_SERV.Value;
    stpProcActBalanceProvcxp.Params[2].Value := dmCxp.tblTransCxpMONEDA.Value;
    stpProcActBalanceProvcxp.Params[3].Value := dmCxp.tblTransCxpNUMERO_DOC.Value;// tipo;//1;
    stpProcActBalanceProvcxp.Params[4].Value := dmCxp.tblTransCxpVALOR_DOCUMENTO.Value;
    stpProcActBalanceProvcxp.Params[5].Value := 'A';
    if (Tipo = 2) then
    stpProcActBalanceProvcxp.Params[6].Value := -1//add balance
    else
    stpProcActBalanceProvcxp.Params[6].Value := 1;//update balance
    stpProcActBalanceProvcxp.Params[7].Value := codProveedor;
    stpProcActBalanceProvcxp.Params[8].Value := dmCxp.tblTransCxpFECHA.Value;
    stpProcActBalanceProvcxp.Params[9].Value := dmCxp.tblTransCxpSERIE.Value;
    stpProcActBalanceProvcxp.ExecProc;

    if Not stpProcActBalanceProvcxp.Transaction.InTransaction then
    stpProcActBalanceProvcxp.Transaction.StartTransaction;
    try
      stpProcActBalanceProvcxp.Transaction.CommitRetaining;
    except
    stpProcActBalanceProvcxp.Transaction.RollbackRetaining;
    end;  
end;

procedure TfrmRegTransOpeDiaria.ProcInsertarCXPActual(monto: Real;
  serieDoc, codProveedor: Integer; tipo: smallint; concepto: string);
begin
  if dtmTransOpeDiaria.tblRegTransOpeDiariaMast.State in [dsEdit, dsInsert] then Exit;
  if (dtmTransOpeDiaria.tblRegTransOpeDiariaMastSTATUS.Value = 'A') then exit;
  dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Edit;
  dtmTransOpeDiaria.tblRegTransOpeDiariaMastSTATUS.Value:='A';
  GlbSalvarQuery(dtmTransOpeDiaria.tblRegTransOpeDiariaMast);
  
  if dmCxp.tblTransCxp.State = dsInactive then
  begin
    dmCxp.tblTransCxp.Close;
    dmCxp.tblTransCxp.Params[0].Value:=ExtraerFecha(dtmTransOpeDiaria.tblRegTransOpeDiariaMastFecha.Value);
    dmCxp.tblTransCxp.Params[1].Value:=ExtraerFecha(dtmTransOpeDiaria.tblRegTransOpeDiariaMastFecha.Value);
    dmCxp.tblTransCxp.Open;
  end;
  if (esRevertir) and (dmCxp.tblTransCxp.Locate(
  'serieTRNCOSTO;cia_key;TIPO_DOC;moneda;codigo_cliente;NUMERO_DOC;tipo_tranf'
  ,VarArrayOf([serieDoc,GLBCODIGO_CIA, 2, '1', codProveedor, dtmTransOpeDiaria.tblRegTransOpeDiariaMastNUMERO.Value, 1]),[])) then
  begin
    dmCxp.tblTransCxp.Edit;
    dmCxp.tblTransCxpSTATUS.Value   := 'C';
    dmCxp.tblTransCxpFECHA_MOD.Value:= Now;
    dmCxp.tblTransCxpMOD_POR.Value  := strUserName;
    dmCxp.tblTransCxpconcepto.Value := '*** Cancelado ***';
    GlbSalvarQuery(dmCxp.tblTransCxp);

    //Actualiza factura pendiente y balance cxp a proveedor
    stpProcActBalanceProvcxp.Params[1].Value := dmCxp.tblTransCxpCODIGO_SERV.Value;
    stpProcActBalanceProvcxp.Params[2].Value := dmCxp.tblTransCxpMONEDA.Value;
    stpProcActBalanceProvcxp.Params[3].Value := dmCxp.tblTransCxpNUMERO_DOC.Value;// tipo;//1;
    stpProcActBalanceProvcxp.Params[4].Value := dmCxp.tblTransCxpVALOR_DOCUMENTO.Value;
    stpProcActBalanceProvcxp.Params[5].Value := 'A';
    //if (tipo = 1) then
    //stpProcActBalanceProvcxp.Params[6].Value := -1//add balance
    //else
    stpProcActBalanceProvcxp.Params[6].Value := 1;//update balance
    stpProcActBalanceProvcxp.Params[7].Value := codProveedor;
    stpProcActBalanceProvcxp.Params[8].Value := dmCxp.tblTransCxpFECHA.Value;
    stpProcActBalanceProvcxp.Params[9].Value := dmCxp.tblTransCxpSERIE.Value;
    stpProcActBalanceProvcxp.ExecProc;
    
    if Not stpProcActBalanceProvcxp.Transaction.InTransaction then
    stpProcActBalanceProvcxp.Transaction.StartTransaction;
    try
      stpProcActBalanceProvcxp.Transaction.CommitRetaining;
    except
    stpProcActBalanceProvcxp.Transaction.RollbackRetaining;
    end;

    dmCxp.tblTransCxp.Edit;
    dmCxp.tblTransCxpSTATUS.Value   := 'C';
    dmCxp.tblTransCxpFECHA_MOD.Value:= Now;
    dmCxp.tblTransCxpMOD_POR.Value  := strUserName;
    dmCxp.tblTransCxpconcepto.Value := '*** CANCELADO ***';
    GlbSalvarQuery(dmCxp.tblTransCxp);
  end else
  begin
    MessageDlg('Transaccion no encontrada en Trans CxP.',mtInformation,[mbok],0);
  end;
end;

procedure TfrmRegTransOpeDiaria.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if (dtmTransOpeDiaria.tblRegTransOpeDiariaDetSTATUS.Value = 'R') then
  Background := clgreen
  else
  if (dtmTransOpeDiaria.tblRegTransOpeDiariaDetSTATUS.Value = 'C') then
  Background := clSilver;
end;

procedure TfrmRegTransOpeDiaria.RxDBGrid2GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if (dtmTransOpeDiaria.tblRegTransOpeDiariaMastSTATUS.Value = 'R') then
  Background := clgreen
  else
  if (dtmTransOpeDiaria.tblRegTransOpeDiariaMastSTATUS.Value = 'C') then
  Background := clSilver;
end;

procedure TfrmRegTransOpeDiaria.DBEdit10Exit(Sender: TObject);
begin
  ProcVerificaNCF;
end;

function TfrmRegTransOpeDiaria.ProcVerificaNCF:Boolean;
begin
  result:= True;
  if dtmTransOpeDiaria.tblRegTransOpeDiariaMast.State In [dsInsert, dsEdit] then
  begin
  if Length(dtmTransOpeDiaria.tblRegTransOpeDiariaMastNUMERO_NCF.Value) > 11 then
  begin
    if (dtmTransOpeDiaria.tblRegTransOpeDiariaMastTIPO_CF.Value <>
    MyStrCopyRango(dtmTransOpeDiaria.tblRegTransOpeDiariaMastNUMERO_NCF.Value, 10,11)) then
    begin
      MessageDlg('Tipo de comprobante no coincide con el NCF indicado, verifique', mtInformation, [mbOK], 0);
      //dtmTransOpeDiaria.tblRegTransOpeDiariaMastNUMERO_NCF.AsVariant:=null;
      RxDBLookupCombo6.SetFocus;
      result:= False;
    end;
  end else
  if Length(dtmTransOpeDiaria.tblRegTransOpeDiariaMastNUMERO_NCF.Value) <= 11 then
  begin
    if (dtmTransOpeDiaria.tblRegTransOpeDiariaMastTIPO_CF.Value <>
    MyStrCopyRango(dtmTransOpeDiaria.tblRegTransOpeDiariaMastNUMERO_NCF.Value, 2,3)) then
    begin
      MessageDlg('Tipo de comprobante no coincide con el NCF indicado, verifique', mtInformation, [mbOK], 0);
      //dtmTransOpeDiaria.tblRegTransOpeDiariaMastNUMERO_NCF.AsVariant:=null;
      RxDBLookupCombo6.SetFocus;
      result:= False;
    end;
  end;
  end;
end;

procedure TfrmRegTransOpeDiaria.BitBtn15Click(Sender: TObject);
begin
  if dtmTransOpeDiaria.tblRegTransOpeDiariaDet.State In [dsBrowse] then
  dtmTransOpeDiaria.tblRegTransOpeDiariaDet.Edit;
end;

procedure TfrmRegTransOpeDiaria.DBDateEdit1Change(Sender: TObject);
begin
  if dtmTransOpeDiaria.tblRegTransOpeDiariaMast.State in [dsBrowse, dsInactive] then exit;
  if not dtmTransOpeDiaria.tblRegTransOpeDiariaMastCOD_PROVEEDOR.IsNull then
    if not dtmTransOpeDiaria.qryProveedorCANT_DIAS_CREDITO.IsNull then
  dtmTransOpeDiaria.tblRegTransOpeDiariaMastFECHA_VENCE.Value :=
  dtmTransOpeDiaria.tblRegTransOpeDiariaMastFECHA.Value +
  dtmTransOpeDiaria.qryProveedorCANT_DIAS_CREDITO.Value
  else
    dtmTransOpeDiaria.tblRegTransOpeDiariaMastFECHA_VENCE.Value :=
  dtmTransOpeDiaria.tblRegTransOpeDiariaMastFECHA.Value + 30;
end;

procedure TfrmRegTransOpeDiaria.BitBtn16Click(Sender: TObject);
var
  genNcf : Boolean;
  serie_asignadoncf : Integer;
  valorNCF : String;
begin
  if dtmTransOpeDiaria.tblRegTransOpeDiariaMastNUMERO.IsNull then Exit;
  
  if dtmTransOpeDiaria.tblRegTransOpeDiariaMast.State = dsbrowse then
  dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Edit;
  if not Assigned(frmSelNCFGastos) then
  frmSelNCFGastos:=TfrmSelNCFGastos.Create(Self);
  try

    if (frmSelNCFGastos.ShowModal = mrOK) then
    begin
      genNcf := True;
      if (GlbUsaSecNCF2018 = 0) then
      GlbDescNCF:=dmFactura.ibQryViewNCFGastosDESCRIPCION.Value
      else
      GlbDescNCF:=dmFactura.ibQryViewNCFGastosDESCRIPCION_2018.Value;
      //dmFactura.ibQryViewNCFTIPO_CF.Value, ValorNCF, serieDoc, serie_asignadoncf);
      //ProcVenta(valorNCF, Serie_Asignadoncf,serieDoc);//Aqui voy
      //ProcesaFacturar(1, serieDoc, xcodigocte);
    end;
    if genNcf then
    begin
      if (GlbUsaSecNCF2018 = 0) then
      GlbDescNCF   := dmFactura.ibQryViewNCFGastosDESCRIPCION.Value
      else
      GlbDescNCF:=dmFactura.ibQryViewNCFGastosDESCRIPCION_2018.Value;

      frmAsignarNCFGastos:= TfrmAsignarNCFGastos.Create(self);
       try
         frmAsignarNCFGastos.IBDataSet1.Close;
         frmAsignarNCFGastos.IBDataSet1.Open;
         frmAsignarNCFGastos.IBDataSet1.Insert;
         frmAsignarNCFGastos.IBDataSet1FECHA_INSERT.Value := Now;
         frmAsignarNCFGastos.IBDataSet1FECHA.Value := ExtraerFEcha(GlbFechaTrnDiaria);
         if GlbcodVendedor > 0 then
            frmAsignarNCFGastos.IBDataSet1CODIGO_USUARIO.Value := GlbcodVendedor
         else
         frmAsignarNCFGastos.IBDataSet1CODIGO_USUARIO.Value := VarUsuarioGlb;
         frmAsignarNCFGastos.IBDataSet1STATUS.Value := 'A';

         frmAsignarNCFGastos.IBDataSet1TIPO_NCF.Value := dmFactura.ibQryViewNCFGastosTIPO_CF.Value;

         valorNCF:= frmAsignarNCFGastos.ncfGenerado;
         dtmTransOpeDiaria.tblRegTransOpeDiariaMastNUMERO_NCF.Value:=frmAsignarNCFGastos.ncfGenerado;
         dtmTransOpeDiaria.tblRegTransOpeDiariaMastTIPO_CF.Value:= frmAsignarNCFGastos.IBDataSet1TIPO_NCF.Value;
                  
         frmAsignarNCFGastos.BitBtn13Click(Self);

         frmAsignarNCFGastos.Asginarncf := frmAsignarNCFGastos.ncfGenerado;

         if (frmAsignarNCFGastos.ncfGenerado <> '') then
         begin
           frmAsignarNCFGastos.IBDataSet1NUMERO_NCF.Value := frmAsignarNCFGastos.ncfGenerado;
           frmAsignarNCFGastos.IBDataSet1MONTO.Value      := dtmTransOpeDiaria.tblRegTransOpeDiariaMastMONTO.Value;

           frmAsignarNCFGastos.BitBtn4Click(Self); //Guardar

         //if (frmAsignarNCFGastos.ncfGenerado = '') then
         //begin
         //  if MessageDlg('NCF no fue generado, desea continuar?', mtWarning, [mbYes, mbNo], 0) = mrNO then
         //  Exit;
         //end;

         serie_asignadoncf := frmAsignarNCFGastos.IBDataSet1SERIE.Value;
         valorNCF:= frmAsignarNCFGastos.ncfGenerado;
         dtmTransOpeDiaria.tblRegTransOpeDiariaMastNUMERO_NCF.Value:=frmAsignarNCFGastos.ncfGenerado;
         dtmTransOpeDiaria.tblRegTransOpeDiariaMastTIPO_CF.Value:= frmAsignarNCFGastos.IBDataSet1TIPO_NCF.Value;
         end else
         frmAsignarNCFGastos.IBDataSet1.Cancel;
         //t  RxDBLookupCombo3Change(Self);
         //t if Totales.State = dsBrowse then
         //t Totales.Edit;

         //t if Totales.State In [dsInsert, dsEdit] then
         //t begin
         //t   Totales.Edit;
         //t   Totalesncf_numero.Value := valorNCF;
         //t   TotalesqrLabelNcfDesc.Value:=GlbDescNCF;
         //t   Totales.Post;
         //t end;
         finally
         end;
       end;//if genNcf
     finally
    end;
end;

procedure TfrmRegTransOpeDiaria.BitBtn18Click(Sender: TObject);
var _Guarda : boolean;
begin
  _Guarda:=False;
  if dtmTransOpeDiaria.tblRegTransOpeDiariaMast.State = dsBrowse then
  begin
    dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Edit;
    _Guarda:=True;
  end;
  dtmTransOpeDiaria.tblRegTransOpeDiariaMastTIPO_CF.AsVariant:=null;
  dtmTransOpeDiaria.tblRegTransOpeDiariaMastNUMERO_NCF.AsVariant:=null;
  if _Guarda then
  BitBtn4Click(Self);
end;

procedure TfrmRegTransOpeDiaria.BitBtn17Click(Sender: TObject);
var _Guarda : boolean;
begin
  _Guarda:=False;
  if dtmTransOpeDiaria.tblRegTransOpeDiariaMast.State = dsBrowse then
  begin
    dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Edit;
    _Guarda:=True;
  end;
  dtmTransOpeDiaria.tblRegTransOpeDiariaMastIDTIPO_COMPRA.AsVariant:=null;
  if _Guarda then
  BitBtn4Click(Self);
end;

procedure TfrmRegTransOpeDiaria.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dtmTransOpeDiaria.tblRegTransOpeDiariaMast.Close;
  dtmTransOpeDiaria.tblRegTransOpeDiariaDet.Close;
  dmCxp.tblTransCxp.Close;  
end;

procedure TfrmRegTransOpeDiaria.BitBtn19Click(Sender: TObject);
begin
  frmProcBuscarProv:=TfrmProcBuscarProv.Create(Nil);
  try
    if frmProcBuscarProv.Showmodal = mrOk then
    begin
        if dtmTransOpeDiaria.tblRegTransOpeDiariaMast.State In [dsInsert, dsEdit] then
      dtmTransOpeDiaria.tblRegTransOpeDiariaMastCOD_PROVEEDOR.Value:= frmProcBuscarProv.xCodigoCte;
    end;
  finally
  frmProcBuscarProv.Free;
  frmProcBuscarProv:=Nil;
  end
end;

procedure TfrmRegTransOpeDiaria.BitBtn20Click(Sender: TObject);
begin
  frmCentroDeCostos:=TfrmCentroDeCostos.create(Nil);
  try
   frmCentroDeCostos.Showmodal;
  finally
  frmCentroDeCostos.Free;
  frmCentroDeCostos:=Nil;
  end;
  dtmTransOpeDiaria.qryCentroCostos.Close;
  dtmTransOpeDiaria.qryCentroCostos.Open;
end;

procedure TfrmRegTransOpeDiaria.BitBtn21Click(Sender: TObject);
begin
  frmProductosServ:=TfrmProductosServ.create(Nil);
  try
    frmProductosServ.Showmodal;
  finally
  frmProductosServ.Free;
  frmProductosServ:=Nil;
  end;
  dtmTransOpeDiaria.tblProductosServicios.Close;
  dtmTransOpeDiaria.tblProductosServicios.Open;  
end;

end.


