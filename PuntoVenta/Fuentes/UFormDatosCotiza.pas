unit UFormDatosCotiza;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, Buttons, ExtCtrls, DB, IBCustomDataSet,
  IBQuery, Grids, DBGrids, RXDBCtrl, RXSwitch, IBSQL, Mask,
  QRPrntr, rxToolEdit, WinSkinData, ShellApi, IBStoredProc;

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
    ibqryCotizacionMasterTELEF_CONTACTO: TIBStringField;
    ibqryCotizacionMasterEMAIL: TIBStringField;
    ibqryCotizacionMasterWEBSITE: TIBStringField;
    ibqryCotizacionMasterCIUDAD: TIBStringField;
    ibqryCotizacionMasterPAIS: TIBStringField;
    Shape1: TShape;
    ibqryCotizacionDetSERIE: TIntegerField;
    ibqryCotizacionDetNUMERO: TIntegerField;
    ibqryCotizacionDetCODIGO_PROD: TIBStringField;
    ibqryCotizacionDetCODIGO_BARRA: TIBStringField;
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
    ibqryCotizacionDetDESCRIPCIONESPECIAL: TMemoField;
    ibqryCotizacionDetIN_POR: TIBStringField;
    ibqryCotizacionDetFECHA_MOD: TDateTimeField;
    ibqryCotizacionDetMOD_POR: TIBStringField;
    ibqryCotizacionDetCANT_REGRESO: TFloatField;
    ibqryCotizacionDetCANT_PROMO: TFloatField;
    ibqryCotizacionDetMONTO_DIETA: TFloatField;
    ibqryCotizacionDetMONTO_AJUSTE: TFloatField;
    ibqryCotizacionDetSERIE_PROD: TIBStringField;
    ibqryCotizacionDetSTATUS_CNT: TIBStringField;
    ibqryCotizacionDetTIPO_UNIDAD: TIntegerField;
    ibqryCotizacionDetITBIS_EXENTO: TSmallintField;
    ibqryCotizacionDetTIPO_VENTA: TSmallintField;
    ibqryCotizacionMasterCIA_KEY: TIntegerField;
    ibqryCotizacionMasterMONTO_BRUTO: TFloatField;
    ibqryCotizacionMasterPORC_DESCUENTO: TIntegerField;
    ibqryCotizacionMasterMONTO_DESCUENTO: TFloatField;
    ibqryCotizacionMasterMONTO_INICIAL: TFloatField;
    ibqryCotizacionMasterMONTO_PAGADO: TFloatField;
    ibqryCotizacionMasterMONTO_CAMBIO: TFloatField;
    ibqryCotizacionMasterMONTO_TOTAL_ITBIS: TFloatField;
    ibqryCotizacionMasterMONTODESCGASTOSADMIN: TFloatField;
    ibqryCotizacionMasterMONTODESCITBISGASTOSADMIN: TFloatField;
    ibqryCotizacionMasterMONTODESCTRANSP: TFloatField;
    ibqryCotizacionMasterMONTODESCDIRTECNICA: TFloatField;
    ibqryCotizacionMasterMONTODESCITBISDIRTECNICA: TFloatField;
    ibqryCotizacionMasterMONTODESCIMPREVISTO: TFloatField;
    ibqryCotizacionMasterMONTODESCITBISIMPREVISTO: TFloatField;
    ibqryCotizacionMasterTIPO_FACTURA: TSmallintField;
    ibqryCotizacionMasterAPLICA_TIPODESC: TSmallintField;
    Button1: TButton;
    ibqryCotizacionDetDESCRIPCION: TIBStringField;
    ibqryCotizacionDetDESCRIPCIONPRODUCTO: TMemoField;
    ibqryCotizacionMasterNOMBRE_CLIENTE_GENERAL: TIBStringField;
    ibqryCotizacionMasterDIRECCION_CONT: TIBStringField;
    ibqryCotizacionMasterNOMBRE_CTE: TIBStringField;
    tblCotizaMaster: TIBDataSet;
    tblCotizaMasterNUMERO: TIntegerField;
    tblCotizaMasterFECHA: TDateTimeField;
    tblCotizaMasterCIA_KEY: TIntegerField;
    tblCotizaMasterFECHA_VENCE: TDateTimeField;
    tblCotizaMasterCODIGO_CTE: TIntegerField;
    tblCotizaMasterCODIGO_VENDEDOR: TIntegerField;
    tblCotizaMasterOBSERVACION: TIBStringField;
    tblCotizaMasterMONEDA: TIBStringField;
    tblCotizaMasterVALOR_TOTAL: TFloatField;
    tblCotizaMasterSTATUS: TIBStringField;
    tblCotizaMasterFECHA_IN: TDateTimeField;
    tblCotizaMasterIN_POR: TIBStringField;
    tblCotizaMasterFECHA_MOD: TDateTimeField;
    tblCotizaMasterMOD_POR: TIBStringField;
    tblCotizaMasterNUMERO_FACTURA: TIntegerField;
    tblCotizaMasterNUMERO_DOC_PAGO: TIBStringField;
    tblCotizaMasterSERIE_NCF_ASIGNADO: TIntegerField;
    tblCotizaMasterMONTO_BRUTO: TFloatField;
    tblCotizaMasterPORC_DESCUENTO: TIntegerField;
    tblCotizaMasterMONTO_DESCUENTO: TFloatField;
    tblCotizaMasterMONTO_INICIAL: TFloatField;
    tblCotizaMasterNOMBRE_CLIENTE_GENERAL: TIBStringField;
    tblCotizaMasterMONTO_PAGADO: TFloatField;
    tblCotizaMasterMONTO_CAMBIO: TFloatField;
    tblCotizaMasterMONTO_TOTAL_ITBIS: TFloatField;
    tblCotizaMasterMONTODESCGASTOSADMIN: TFloatField;
    tblCotizaMasterMONTODESCITBISGASTOSADMIN: TFloatField;
    tblCotizaMasterMONTODESCTRANSP: TFloatField;
    tblCotizaMasterMONTODESCDIRTECNICA: TFloatField;
    tblCotizaMasterMONTODESCITBISDIRTECNICA: TFloatField;
    tblCotizaMasterMONTODESCIMPREVISTO: TFloatField;
    tblCotizaMasterMONTODESCITBISIMPREVISTO: TFloatField;
    tblCotizaMasterTIPO_FACTURA: TSmallintField;
    tblCotizaMasterAPLICA_TIPODESC: TSmallintField;
    BitBtn5: TBitBtn;
    ibqryCotizacionMasterCOMENTARIO: TMemoField;
    ibqryCotizacionMaster_Base: TIBQuery;
    IntegerField1: TIntegerField;
    DateTimeField1: TDateTimeField;
    DateTimeField2: TDateTimeField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    IBStringField1: TIBStringField;
    IBStringField2: TIBStringField;
    IBStringField3: TIBStringField;
    FloatField1: TFloatField;
    IBStringField4: TIBStringField;
    IBStringField5: TIBStringField;
    IBStringField6: TIBStringField;
    IBStringField7: TIBStringField;
    IBStringField8: TIBStringField;
    IBStringField9: TIBStringField;
    IBStringField10: TIBStringField;
    IntegerField4: TIntegerField;
    FloatField2: TFloatField;
    IntegerField5: TIntegerField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    FloatField11: TFloatField;
    FloatField12: TFloatField;
    FloatField13: TFloatField;
    FloatField14: TFloatField;
    SmallintField1: TSmallintField;
    SmallintField2: TSmallintField;
    IBStringField11: TIBStringField;
    MemoField1: TMemoField;
    CheckBox1: TCheckBox;
    Label3: TLabel;
    Label4: TLabel;
    dbEditFechaInicial: TDateEdit;
    dbEditFechaFinal: TDateEdit;
    SkinData1: TSkinData;
    cboxOrderby: TComboBox;
    Label2: TLabel;
    CheckBox2: TCheckBox;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    ibqryCotizacionMasterREFERENCIACTE: TIBStringField;
    ibqryCotizacionMaster_BaseREFERENCIACTE: TIBStringField;
    ibqryCotizacionDetCANT_CONDUCE: TFloatField;
    ibqryCotizacionDetPORC_DESC_ITEM: TFloatField;
    ibqryCotizacionMasterMONTO_RECARGO: TFloatField;
    ibqryCotizacionMasterTIPONCFIFISCAL: TIntegerField;
    ibqryCotizacionMasterMONTO_EXONERADO_ITBIS: TFloatField;
    ibqryCotizacionDetMONTO_DESC_ITEM: TFloatField;
    ibqryCotizacionDetMONEDA: TIBStringField;
    ibqryCotizacionDetMONTO_TASA: TFloatField;
    ibqryCotizacionDetIDTASAITBIS: TFloatField;
    ibqryCotizacionDetCANT_VIAJES: TFloatField;
    ibqryCotizacionDetMONTO_DEPOSITO: TFloatField;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    ibsqlBusarFechaOrden: TIBSQL;
    Button3: TButton;
    ibStpInsertCotizaDet: TIBStoredProc;
    ibqryCotizacionDetLEVEL_PRECIO_VENT: TSmallintField;
    ibqryCotizacionMasterPROPINA: TFloatField;
    ibqryCotizacionMasterPROPINALEGAL: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure ibqryCotizacionMasterAfterScroll(DataSet: TDataSet);
    procedure RxSwitch1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure RxDBGrid1TitleBtnClick(Sender: TObject; ACol: Integer;
      Field: TField);
    procedure FormClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure ibqryCotizacionMasterFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);

  private
    procedure ProcCriterioBusqueda;
    procedure AplicaFiltro;
    Function SetOrderBy:String;
    procedure InsertarCotizacionDet(numero : Integer;itmNo:smallint);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCotizaciones: TfrmCotizaciones;

implementation

uses UDatModConectar, Uglobal, UFormSelFecha, UDatModFactura,
  UQckCotiza8_5_F_1, UDatModReportes, UQckCotiza8_5_F_2, UDatModClientes,
  UFormModificaCotiza, uSortData, UBuscarClientesPersonasP,
  UQckCotiza8_5_F_1ByM, UQckCotiza8_5_FormG, URepCotizacionPapel8_55,
  URepCotizacionPapel3Pulg, UQckCotiza8_5_F_1ByMPrefact,
  UQckCotiza8_5_F_1BB, UDatosVentas, UFormOrdenTrabajo,
  UQckCotServ8_5Ayaco, UQckCotServ8_5AyacoRep, frmImprimirDoc,
  UQckCotizaServ8_5EXDMar, UDatmodDatosGenerales, UQckCotServ8_5SAM,
  UQckCotServ8_5Standar, UQckCotServ8_5StandarFarmacia;

{$R *.dfm}

procedure TfrmCotizaciones.FormCreate(Sender: TObject);
begin
  dbEditFechaInicial.Date:= Now;
  dbEditFechaFinal.Date  := Now;
  ProcCriterioBusqueda;
end;

procedure TfrmCotizaciones.ProcCriterioBusqueda;
begin
  if radiogroup1.ItemIndex = 0 then
  Label1.Caption:='Entre Número de cotizacion'
  else if radiogroup1.ItemIndex = 1 then
  Label1.Caption:='Entre codigo cliente'
  else if radiogroup1.ItemIndex = 2 then
  Label1.Caption:='Entre nombre cliente'
  else if radiogroup1.ItemIndex = 2 then
  begin
    Label1.Caption:='Entre Fecha';
  end;
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
        //if Not ibqryCotizacionMaster.Locate('NUMERO', edit1.Text,[]) then
       // begin
          ibsqlBuscarcotinum.Close;
          ibsqlBuscarcotinum.params[0].Value:= StrToInt(edit1.Text);
          ibsqlBuscarcotinum.ExecQuery;

          ibqryCotizacionMaster.Close;
          ibqryCotizacionMaster.SQL.Text:=
          ibqryCotizacionMaster_Base.SQL.Text + ' Where Fecha between :fechaini and :fechafin' +SetOrderBy;
          ibqryCotizacionMaster.Params[0].AsDateTime:= ExtraerFecha(ibsqlBuscarcotinum.fieldbyname('fecha').AsDate);
          ibqryCotizacionMaster.Params[1].AsDateTime:= ExtraerFecha(ibsqlBuscarcotinum.fieldbyname('fecha').AsDate);
          ibqryCotizacionMaster.Open;

        //end;
        if Not ibqryCotizacionMaster.Locate('NUMERO', StrToInt(edit1.Text),[]) then
           MessageDlg('Numero Cotizacion No existe, verifique',mtInformation, [mbOK], 0);
      end;
  1 : begin
        if (edit1.Text = '') then Exit;
        ibqryCotizacionMaster.Close;
        ibqryCotizacionMaster.SQL.Text:=
        ibqryCotizacionMaster_Base.SQL.Text + ' Where CODIGO_CTE =:codcte ' +SetOrderBy;
        ibqryCotizacionMaster.Params[0].AsInteger := StrToInt(edit1.Text);
        //ibqryCotizacionMaster.Params[0].AsDateTime:= ExtraerFecha(now)-120;
        //ibqryCotizacionMaster.Params[1].AsDateTime:= ExtraerFecha(now)+1;
        ibqryCotizacionMaster.Open;
        if Not ibqryCotizacionMaster.Locate('CODIGO_CTE', StrToInt(edit1.Text),[]) then
        begin
           MessageDlg('Cotizacion no existe con este codigo de cliente, verifique',mtInformation, [mbOK], 0);
        end;
      end;
  2 : begin
        if (edit1.Text = '') then
        begin
          FrmBuscarClientesPersonas:=TFrmBuscarClientesPersonas.Create(nil);
          try
            FrmBuscarClientesPersonas.CodigoCliente := -1;
            if FrmBuscarClientesPersonas.Showmodal = mrOk then
            begin
              edit1.Text := IntToStr(FrmBuscarClientesPersonas.CodigoCliente);
              RadioGroup1.ItemIndex := 1;
              BitBtn1Click(Self);
            end;
          finally
          FrmBuscarClientesPersonas.Free;
          FrmBuscarClientesPersonas:=Nil;
          end;
          Exit;
        end;
        ibqryCotizacionMaster.Close;
        ibqryCotizacionMaster.SQL.Text:=
        ibqryCotizacionMaster_Base.SQL.Text + Format(' Where Fecha between :fechaini and :fechafin '+
        ' and NOMBRE_CTE like %s %s',[chr(39)+edit1.Text+chr(39),SetOrderBy]);
        ibqryCotizacionMaster.Params[0].AsDateTime:= ExtraerFecha(Now)-90;
        ibqryCotizacionMaster.Params[1].AsDateTime:= ExtraerFecha(Now);
        ibqryCotizacionMaster.Open;
  
        //if not ibqryCotizacionMaster.Locate('Nombre_cte', edit1.Text,[loPartialKey,loCaseInsensitive]) then
        //begin
        //   MessageDlg('No existe cotizacion con este nombre, verifique',mtInformation, [mbOK], 0);
        //end;

  end;
  3 : begin
        ibqryCotizacionMaster.Close;
          ibqryCotizacionMaster.SQL.Text:=
          ibqryCotizacionMaster_Base.SQL.Text + ' Where Fecha between :fechaini and :fechafin ' +SetOrderBy;
          ibqryCotizacionMaster.Params[0].AsDateTime:= ExtraerFecha(dbEditFechaInicial.Date);
          ibqryCotizacionMaster.Params[1].AsDateTime:= ExtraerFecha(dbEditFechaFinal.Date);
          ibqryCotizacionMaster.Open;

        //if not ibqryCotizacionMaster.Locate('Nombre_cte', edit1.Text,[loPartialKey,loCaseInsensitive]) then
        //begin
        //   MessageDlg('No existe cotizacion con este nombre, verifique',mtInformation, [mbOK], 0);
        //end;
      end;
  end;
  CheckBox1Click(Self);
  refresh;
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
      ibqryCotizacionMaster.SQL.Text:=
      ibqryCotizacionMaster_Base.SQL.Text +
       format(' Where Status in (%s,%s) and  fecha between %s and  %s',
       [chr(39)+'A'+chr(39),chr(39)+'R'+chr(39),chr(39)+FormatDateTime('mm/dd/yyyy',frmSelFecha.FechaIni.DateTime)+chr(39),
        chr(39)+FormatDateTime('mm/dd/yyyy', frmSelFecha.FechaFin.DateTime)+chr(39)])+' order by numero';
      //ibqryCotizacionMaster.Params[0].Value:= ExtraerFecha(frmSelFecha.FechaIni.DateTime);
      //ibqryCotizacionMaster.Params[1].Value:= ExtraerFecha(frmSelFecha.FechaFin.DateTime);
      ibqryCotizacionMaster.Open;
    end;
  finally
  frmSelFecha.free;
  frmSelFecha:=nil;
  end;
  refresh;
end;

procedure TfrmCotizaciones.ibqryCotizacionMasterAfterScroll(
  DataSet: TDataSet);
begin
  ibqryCotizacionDet.Close;
  ibqryCotizacionDet.Params[0].Value := ibqryCotizacionMasterNUMERO.Value;
  ibqryCotizacionDet.Open;
  dmfactura.qryPorcOtrosCargosCotiza.Close;
  dmfactura.qryPorcOtrosCargosCotiza.Params[0].Value := ibqryCotizacionMasterNUMERO.Value;
  dmfactura.qryPorcOtrosCargosCotiza.Open;

  tblCotizaMaster.close;
  tblCotizaMaster.params[0].value:= ibqryCotizacionMasterNUMERO.Value;
  tblCotizaMaster.Open;

  if ibsqlBusarFechaOrden.Open then
  ibsqlBusarFechaOrden.Close;
  ibsqlBusarFechaOrden.Params[0].Value:= ibqryCotizacionMasterNUMERO.Value;
  ibsqlBusarFechaOrden.ExecQuery;
  if (not ibsqlBusarFechaOrden.FieldByName('Fecha').IsNull) then
  begin
    BitBtn8.Font.Color:= clgreen;
  end else
  BitBtn8.Font.Color:= clWindowText;
end;

procedure TfrmCotizaciones.RxSwitch1Click(Sender: TObject);
begin
  if RxSwitch1.StateOn then
  begin
  RxDBGrid1.Height:=361;
  RxDBGrid1.BringToFront;
  end else
  RxDBGrid1.Height:=65;
end;

procedure TfrmCotizaciones.Button1Click(Sender: TObject);
var
  flag : boolean;
  X, Count : Integer;
begin
  GlbRutaLogoDoc:='';
  if GetFormatoTipoDoc(2,GlbRutaLogoDoc) then  //2 	Cotizacion 8.5 Estandar
     GlbDocStandar:=1
  else
  GlbDocStandar:=0;
  GlbEsCopia:=True;
  dmfactura.qryRepCotizaNew.Close;
  dmfactura.qryRepCotizaNew.Params[0].Value:=ibqryCotizacionMasterNUMERO.Value;
  dmfactura.qryRepCotizaNew.Open;

  dmfactura.qryPorcOtrosCargosCotiza.Close;
  dmfactura.qryPorcOtrosCargosCotiza.Params[0].Value:=dmfactura.qryRepCotizaNewNUMERO.Value;
  dmfactura.qryPorcOtrosCargosCotiza.Open;
  dmclientes.tblClientes.Close;
  dmclientes.tblClientes.Open;
  if dmclientes.tblClientes.Locate('CODIGO_CTE',dmfactura.qryRepCotizaNewCODIGO_CTE.Value,[]) then
  glbcodVendedor:=dmclientes.tblClientesCOD_VENDEDOR.Value
  else
  glbcodVendedor:= VarUsuarioGlb;

  //qckCotiza8_5_FormG
  //qckCotizacion8_55
  //sqckCotizacion8_55 //usar este modelo para matisa
  //GLBCOTI55EST
  if (GlbFarmacia = 1) and (GlbFact55Pulg = 1) then
  begin
    qckCotServ8_5Farmacia:=TqckCotServ8_5Farmacia.Create(Nil);
    try
      if (Not DirectoryExists('Informes')) then
      CreateDir('Informes');
      if (Not DirectoryExists(GlbRutaCotizaciones)) then
      CreateDir(GlbRutaCotizaciones);

      if CheckBox2.Checked then
      ReportExport(qckCotServ8_5Farmacia,
      GlbRutaCotizaciones+ 'Cotizacion_'+dmfactura.qryRepCotizaNewNOMBRE_FACTURAR.Value+'_'+dmfactura.qryRepCotizaNewNUMERO.AsString+'.pdf');

      if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
      begin
        qckCotServ8_5Farmacia.PrinterSetup;
        qckCotServ8_5Farmacia.Print;
      end else
      qckCotServ8_5Farmacia.Preview;
    finally
    qckCotServ8_5Farmacia.Free;
    qckCotServ8_5Farmacia:=Nil;
    end;

    if CheckBox2.Checked then
    ShellExecute(0,nil,PChar(glbZipFile),'','',SW_SHOWNORMAL);

  end else
  if ((GlBAyaco = 1) or (GlBInveraf =1) or (GlBTapiceria = 1)) AND (GlbSizeCotiza8x11 = 1) then
  begin
    qckCotServ8_5Ayaco:=TqckCotServ8_5Ayaco.Create(Nil);
    try
      if (Not DirectoryExists('Informes')) then
      CreateDir('Informes');
      if (Not DirectoryExists('Informes\Cotizaciones')) then
      CreateDir('Informes\Cotizaciones');

      if CheckBox2.Checked then
      ReportExport(qckCotServ8_5Ayaco,
      GlbRutaCotizaciones+'\Cotizacion_'+dmfactura.qryRepCotizaNewNOMBRE_ABREV.Value+dmfactura.qryRepCotizaNewNUMERO.AsString+'.pdf');

      if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
      begin
        qckCotServ8_5Ayaco.PrinterSetup;
        qckCotServ8_5Ayaco.Print;
      end else
      qckCotServ8_5Ayaco.Preview;
    finally
    qckCotServ8_5Ayaco.Free;
    qckCotServ8_5Ayaco:=Nil;
    end;

    if CheckBox2.Checked then
      ShellExecute(0,nil,PChar(
      ExtractFilePath(Application.ExeName)+
      'Informes\Cotizaciones\Cotizacion_'+dmfactura.qryRepCotizaNewNOMBRE_ABREV.Value+dmfactura.qryRepCotizaNewNUMERO.AsString+'.pdf'
      ),'','',SW_SHOWNORMAL);
  end else
  if (UpperCase(GLBFormatoFactura) = 'FORMAFACOCO') And (GLBCOTI55EST = 'COTI5.5EST') then
  begin
   qckCotizacion8_55:=TqckCotizacion8_55.Create(Nil);
    try

      if (GlbRutaCotizaciones <> '') then
      begin
        if (Not DirectoryExists(GlbRutaCotizaciones)) then
         CreateDir(GlbRutaCotizaciones);
      end else
      begin
        if (Not DirectoryExists('Informes')) then
           CreateDir('Informes');
        if (Not DirectoryExists('Informes\Cotizaciones')) then
          CreateDir('Informes\Cotizaciones');
      end;
      frmImprimir:=TfrmImprimir.Create(nil);
      try
        qckCotizacion8_55.Prepare;
        glbTPag :=qckCotizacion8_55.PageNumber;
        if frmImprimir.Showmodal = mrOk then
        begin
          if frmImprimir.RadioGroup1.ItemIndex = 0 then
          qckCotizacion8_55.Page.PaperSize := Letter;
          if frmImprimir.RadioButton1.Checked then
          begin
            qckCotizacion8_55.PrinterSetup;
            qckCotizacion8_55.Print;
          end else
          qckCotizacion8_55.Preview;
        end;
        finally
        frmImprimir.Free;
        frmImprimir:=Nil;
        end;
        finally

      if CheckBox2.Checked then
      ReportExport(qckCotizacion8_55,
      GlbRutaCotizaciones+'\Cotizacion_'+dmfactura.qryRepCotizaNewNOMBRE_ABREV.Value+dmfactura.qryRepCotizaNewNUMERO.AsString+'.pdf');

      qckCotizacion8_55.Free;
      qckCotizacion8_55:=Nil;
      end;
  end else
  if (UpperCase(GLBFormatoFactura) = 'FORMAFACOCO') and (GlBBurgos = 0)
  and (GlbSizeCotiza8x11 = 0) then
  begin
    qckCotServ8_5AyacoRep:=TqckCotServ8_5AyacoRep.Create(Nil);
    try

      if (GlbRutaCotizaciones <> '') then
      begin
        if (Not DirectoryExists(GlbRutaCotizaciones)) then
         CreateDir(GlbRutaCotizaciones);
      end else
      begin
        if (Not DirectoryExists('Informes')) then
           CreateDir('Informes');
        if (Not DirectoryExists('Informes')) then
          CreateDir('Informes\Cotizaciones');
      end;
      frmImprimir:=TfrmImprimir.Create(nil);
      try
        qckCotServ8_5AyacoRep.Prepare;
        qckCotServ8_5AyacoRep.totalPag :=qckCotServ8_5AyacoRep.PageNumber;
        if frmImprimir.Showmodal = mrOk then
        begin
          if frmImprimir.RadioGroup1.ItemIndex = 0 then
          qckCotServ8_5AyacoRep.Page.PaperSize := Letter;
          if frmImprimir.RadioButton1.Checked then
          begin
            qckCotServ8_5AyacoRep.PrinterSetup;
            qckCotServ8_5AyacoRep.Print;
          end else
          qckCotServ8_5AyacoRep.Preview;
        end;
        finally
        frmImprimir.Free;
        frmImprimir:=Nil;
        end;
        finally

      if CheckBox2.Checked then
      ReportExport(qckCotServ8_5AyacoRep,
      GlbRutaCotizaciones+'\Cotizacion_'+dmfactura.qryRepCotizaNewNOMBRE_ABREV.Value+dmfactura.qryRepCotizaNewNUMERO.AsString+'.pdf');

      qckCotServ8_5AyacoRep.Free;
      qckCotServ8_5AyacoRep:=Nil;
      end;
      if CheckBox2.Checked then
      ShellExecute(0,nil,PChar(
      ExtractFilePath(Application.ExeName)+
      GlbRutaCotizaciones+'\Cotizacion_'+dmfactura.qryRepCotizaNewNOMBRE_ABREV.Value+dmfactura.qryRepCotizaNewNUMERO.AsString+'.pdf'
      ),'','',SW_SHOWNORMAL);
      end else
      if (GlBSAM= 1) then
      begin
        qckCotServ8_5SAM:=TqckCotServ8_5SAM.Create(Nil);
        try
          if (Not DirectoryExists('Informes')) then
          CreateDir('Informes');
          if (Not DirectoryExists('Informes\Cotizaciones')) then
          CreateDir('Informes\Cotizaciones');

          if CheckBox2.Checked then
             ReportExport(qckCotServ8_5SAM,
             GlbRutaCotizaciones+'\Cotizacion_'+dmfactura.qryRepCotizaNewNOMBRE_ABREV.Value+dmfactura.qryRepCotizaNewNUMERO.AsString+'.pdf');

          if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
          begin
            qckCotServ8_5SAM.PrinterSetup;
            qckCotServ8_5SAM.Print;
          end else
          qckCotServ8_5SAM.Preview;
        finally
        qckCotServ8_5SAM.Free;
        qckCotServ8_5SAM:=Nil;
        end;

        if CheckBox2.Checked then
             ShellExecute(0,nil,PChar(
             ExtractFilePath(Application.ExeName)+
            'Informes\Cotizaciones\Cotizacion_'+dmfactura.qryRepCotizaNewNOMBRE_ABREV.Value+dmfactura.qryRepCotizaNewNUMERO.AsString+'.pdf'
             ),'','',SW_SHOWNORMAL);
          end else
      if (GlbDocStandar = 1) then
      begin
        qckCotServ8_5Standar:=TqckCotServ8_5Standar.Create(Nil);
        try
          if (Not DirectoryExists('Informes')) then
          CreateDir('Informes');
          if (Not DirectoryExists('Informes\Cotizaciones')) then
          CreateDir('Informes\Cotizaciones');

          if CheckBox2.Checked then
             ReportExport(qckCotServ8_5SAM,
             GlbRutaCotizaciones+'\Cotizacion_'+dmfactura.qryRepCotizaNewNOMBRE_ABREV.Value+dmfactura.qryRepCotizaNewNUMERO.AsString+'.pdf');

          if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
          begin
            qckCotServ8_5Standar.PrinterSetup;
            qckCotServ8_5Standar.Print;
          end else
          qckCotServ8_5Standar.Preview;
        finally
        qckCotServ8_5Standar.Free;
        qckCotServ8_5Standar:=Nil;
        end;

        if CheckBox2.Checked then
             ShellExecute(0,nil,PChar(
             ExtractFilePath(Application.ExeName)+
            'Informes\Cotizaciones\Cotizacion_'+dmfactura.qryRepCotizaNewNOMBRE_ABREV.Value+dmfactura.qryRepCotizaNewNUMERO.AsString+'.pdf'
             ),'','',SW_SHOWNORMAL);
          end else
  if (GlBBurgos = 1) then
  begin
    qckCotiza8_5_F_1BB:=TqckCotiza8_5_F_1BB.Create(Nil);
    try
      qckCotiza8_5_F_1BB.Prepare;

      glbTPag := qckCotiza8_5_F_1BB.PageNumber;
      if MessageDlg('Imprimir?',mtInformation,[mbyes,mbno],0) = mrYes then
      begin
        qckCotiza8_5_F_1BB.PrinterSetup;
        qckCotiza8_5_F_1BB.Print;
      end else
      qckCotiza8_5_F_1BB.Preview;

      if (Not DirectoryExists('Informes')) then
            CreateDir('Informes');
            if (Not DirectoryExists('Informes\Cotizaciones')) then
            CreateDir('Informes\Cotizaciones');

      //if CheckBox2.Checked then
      //ReportExport(qckCotiza8_5_F_1BB,GlbRutaCotizaciones+'\Cotizacion'+dmfactura.qryRepCotizaNewNUMERO.AsString+'.pdf');
      if CheckBox2.Checked then
      ReportExport(qckCotiza8_5_F_1BB,GlbRutaCotizaciones+'\Cotizacion'+dmfactura.qryRepCotizaNewNUMERO.AsString+'.pdf');

    finally
    qckCotiza8_5_F_1BB.Free;
    qckCotiza8_5_F_1BB:=Nil;
    end;
  end else
  if (GlbCot3Pulg = 1) And (UpperCase(GLBFormatoFactura) = 'FORMATOGENERAL') then
  begin
    qckCotizacion3Pulg:=TqckCotizacion3Pulg.Create(Nil);
    try
      qckCotizacion3Pulg.Prepare;
      flag:=true;

      if (dmfactura.qryRepCotizaNew.RecordCount > 1) or (qckCotizacion3Pulg.PageNumber > 1) then
      begin
        repeat
          begin
            if (qckCotizacion3Pulg.PageNumber > 1) then
            begin
              qckCotizacion3Pulg.Page.Length:=qckCotizacion3Pulg.Page.Length + 0.25;
              qckCotizacion3Pulg.Prepare;
              flag:=False;
            end else break;
          end;
        until flag = true;
      end;
      glbTPag := qckCotizacion3Pulg.PageNumber;
        dmDatos.qryImpresoras.Close;
        dmDatos.qryImpresoras.Open;
        if dmDatos.qryImpresoras.Locate('IDMODULO;IDREPORTE',
        VarArrayOf([1,9]),[]) then     //Factura/Recibo Punto Venta
        qckCotizacion3Pulg.PrinterSettings.PrinterIndex:=
        GetImpresora(dmDatos.qryImpresorasNOMBRE_IMPRESORA.Value);      
      if MessageDlg('Imprimir?', mtInformation,[mbyes,mbno],0) = mrYes then
      begin
        qckCotizacion3Pulg.PrinterSetup;
        qckCotizacion3Pulg.Print;
      end else
      qckCotizacion3Pulg.Preview;
      if (Not DirectoryExists('Informes')) then
            CreateDir('Informes');
            if (Not DirectoryExists('Informes\Cotizaciones')) then
            CreateDir('Informes\Cotizaciones');
      if CheckBox2.Checked then
      ReportExport(qckCotizacion3Pulg,GlbRutaCotizaciones+'\Cotización' + dmfactura.qryRepCotizaNewNUMERO.AsString+'.pdf');
    finally
    qckCotizacion3Pulg.Free;
    qckCotizacion3Pulg:=Nil;
    end;
   //   if (Not DirectoryExists('Informes')) then
   //         CreateDir('Informes');
   //         if (Not DirectoryExists('Informes')) then
   //         CreateDir('Informes\Cotizaciones');
   // if CheckBox2.Checked then
   // ReportExport(qckCotizacion8_55,GlbRutaInformes+'\Cotizacion'+dmfactura.qryRepCotizaNewNUMERO.AsString+'.pdf');
  end else
  if (GlbSizeCotiza8x11 = 0) and (GlbCot55Pulg = 1) And (UpperCase(GLBFormatoFactura) = 'FORMATOGENERAL') then
  begin
    qckCotizacion8_55:=TqckCotizacion8_55.Create(Nil);
    try
      qckCotizacion8_55.Prepare;

      glbTPag := qckCotizacion8_55.PageNumber;
      if MessageDlg('Imprimir?',mtInformation,[mbyes,mbno],0) = mrYes then
      begin
        qckCotizacion8_55.PrinterSetup;
        qckCotizacion8_55.Print;
      end else
      qckCotizacion8_55.Preview;

      if (Not DirectoryExists('Informes')) then
      CreateDir('Informes');
      if (Not DirectoryExists('Informes\Cotizaciones')) then
      CreateDir('Informes\Cotizaciones');

      if CheckBox2.Checked then
      ReportExport(qckCotizacion8_55,GlbRutaCotizaciones+'\Cotizacion'+dmfactura.qryRepCotizaNewNUMERO.AsString+'.pdf');
    finally
    qckCotizacion8_55.Free;
    qckCotizacion8_55:=Nil;
    end;
    //if CheckBox2.Checked then
    //ReportExport(qckCotizacion8_55,GlbRutaCotizaciones+'\Cotizacion'+dmfactura.qryRepCotizaNewNUMERO.AsString+'.pdf');
  end else
  if (UpperCase(GLBFormatoFactura) = 'FORMATOGENERAL') then
  begin
    qckCotiza8_5_FormG:=TqckCotiza8_5_FormG.Create(Nil);
    try
      qckCotiza8_5_FormG.Prepare;
      glbTPag := qckCotiza8_5_FormG.PageNumber;
        dmDatos.qryImpresoras.Close;
        dmDatos.qryImpresoras.Open;
        if dmDatos.qryImpresoras.Locate('IDMODULO;IDREPORTE',
        VarArrayOf([1,10]),[]) then     //Factura/Recibo Punto Venta
        qckCotiza8_5_FormG.PrinterSettings.PrinterIndex:=
        GetImpresora(dmDatos.qryImpresorasNOMBRE_IMPRESORA.Value);
      if MessageDlg('Imprimir?',mtInformation,[mbyes,mbno],0) = mryes then
      begin
        qckCotiza8_5_FormG.PrinterSetup;
        qckCotiza8_5_FormG.Print;
      end else
      qckCotiza8_5_FormG.Preview;

      if (Not DirectoryExists('Informes')) then
      CreateDir('Informes');
      if (Not DirectoryExists('Informes\Cotizaciones')) then
      CreateDir('Informes\Cotizaciones');

      if CheckBox2.Checked then
      ReportExport(qckCotiza8_5_FormG,GlbRutaCotizaciones+'\Cotizacion'+dmfactura.qryRepCotizaNewNUMERO.AsString+'.pdf');
    finally
    qckCotiza8_5_FormG.Free;
    qckCotiza8_5_FormG:=Nil;
    end;
  end else
  if (UpperCase(GLBFormatoFactura) = 'FORMAEXPLODISMAR') then
  begin
    qckCotizaServ8_5EXDMar:=TqckCotizaServ8_5EXDMar.Create(Nil);
    try
      qckCotizaServ8_5EXDMar.Prepare;
      glbTPag := qckCotizaServ8_5EXDMar.PageNumber;
        dmDatos.qryImpresoras.Close;
        dmDatos.qryImpresoras.Open;
        if dmDatos.qryImpresoras.Locate('IDMODULO;IDREPORTE',
        VarArrayOf([1,10]),[]) then     //Factura/Recibo Punto Venta
        qckCotizaServ8_5EXDMar.PrinterSettings.PrinterIndex:=
        GetImpresora(dmDatos.qryImpresorasNOMBRE_IMPRESORA.Value);
      if MessageDlg('Imprimir?',mtInformation,[mbyes,mbno],0) = mryes then
      begin
        qckCotizaServ8_5EXDMar.PrinterSetup;
        qckCotizaServ8_5EXDMar.Print;
      end else
      qckCotizaServ8_5EXDMar.Preview;
      if CheckBox2.Checked then
      ReportExport(qckCotizaServ8_5EXDMar,GlbRutaCotizaciones+'\Cotizacion'+dmfactura.qryRepCotizaNewNUMERO.AsString+'.pdf');
    finally
    qckCotizaServ8_5EXDMar.Free;
    qckCotizaServ8_5EXDMar:=Nil;
    end;
  end else
  if (UpperCase(GLBFormatoFactura) = 'BYMSERVICIOS') then
  begin
    qckCotiza8_5_F_1ByM:=TqckCotiza8_5_F_1ByM.Create(Nil);
    try
      qckCotiza8_5_F_1ByM.Prepare;
      glbTPag := qckCotiza8_5_F_1ByM.PageNumber;

      if MessageDlg('Imprimir?',mtInformation,[mbyes,mbno],0) = mryes then
      begin
        qckCotiza8_5_F_1ByM.PrinterSetup;
        qckCotiza8_5_F_1ByM.Print;
      end else
      qckCotiza8_5_F_1ByM.Preview;
      if CheckBox2.Checked then
      ReportExport(qckCotiza8_5_F_1ByM,GlbRutaCotizaciones+'\Cotizacion'+dmfactura.qryRepCotizaNewNUMERO.AsString+'.pdf');
    finally
    qckCotiza8_5_F_1ByM.Free;
    qckCotiza8_5_F_1ByM:=Nil;
    end;
  end else
  if dmfactura.qryRepCotizaNewTIPO_FACTURA.Value = 1 then
  begin
  qckCotiza8_5_F_1:=TqckCotiza8_5_F_1.Create(Nil);
  try
    if Assigned(qckCotiza8_5_F_1) then
    begin
      qckCotiza8_5_F_1.Prepare;
      glbTPag := qckCotiza8_5_F_1.PageNumber;
      if MessageDlg('Imprimir?',mtInformation,[mbyes,mbno],0) = mryes then
      begin
        qckCotiza8_5_F_1.PrinterSetup;
        qckCotiza8_5_F_1.Print;
      end else
      qckCotiza8_5_F_1.Preview;
      if CheckBox2.Checked then
      ReportExport(qckCotiza8_5_F_1,GlbRutaCotizaciones+'\Cotizacion'+dmfactura.qryRepCotizaNewNUMERO.AsString+'.pdf');
    end;
  finally
  qckCotiza8_5_F_1.Free;
  qckCotiza8_5_F_1:=Nil;
  end;
  end else
  begin
  qckCotiza8_5_F_2:=TqckCotiza8_5_F_2.Create(Nil);
  try
    if Assigned(qckCotiza8_5_F_2) then
    begin
      if MessageDlg('Imprimir?',mtInformation,[mbyes,mbno],0) = mryes then
      begin
        qckCotiza8_5_F_2.PrinterSetup;
        qckCotiza8_5_F_2.Print;
      end else
      qckCotiza8_5_F_2.Preview;
      if CheckBox2.Checked then
      ReportExport(qckCotiza8_5_F_2,GlbRutaCotizaciones+'\Cotizacion'+dmfactura.qryRepCotizaNewNUMERO.AsString+'.pdf');
    end;
  finally
  qckCotiza8_5_F_2.Free;
  qckCotiza8_5_F_2:=Nil;
  end;
  end;
end;

procedure TfrmCotizaciones.BitBtn5Click(Sender: TObject);
begin
  frmModificaCotiza:=TfrmModificaCotiza.Create(Nil);
  try
   if (tblCotizaMaster.RecordCount = 1) then
   tblCotizaMaster.Edit;

   frmModificaCotiza.Showmodal;
  finally
  frmModificaCotiza.Free;
  frmModificaCotiza:=Nil;
  end;
end;

procedure TfrmCotizaciones.RxDBGrid1TitleBtnClick(Sender: TObject;
  ACol: Integer; Field: TField);
begin
  Exit;
  with TGridSort.Create do
  begin
    // First param is the column that was clicked on,
    // second, sort order
    GridSort(RxDBGrid1.Columns.Items[ACol], 'ASCENDING');
   Free;
  end;
end;

procedure TfrmCotizaciones.AplicaFiltro;
begin
  ibqryCotizacionMaster.Close;
  ibqryCotizacionMaster.SQL.Text:=
  ibqryCotizacionMaster_Base.SQL.Text + ' '+
  'WHERE VIEW_COTIZACION_MASTER.FECHA BETWEEN :FECHAINI AND :FECHAFIN'+
  'ORDER BY VIEW_COTIZACION_MASTER.NUMERO';
end;

procedure TfrmCotizaciones.FormClick(Sender: TObject);
begin
  refresh;
end;


function TfrmCotizaciones.SetOrderBy: String;
begin
  if UPPERCASE(cboxOrderby.Text) = 'FECHA' then
  Result := ' Order by Fecha'
  else
  if UPPERCASE(cboxOrderby.Text) = 'NUMERO' then
  Result := ' Order by NUMERO'
  else
  if UPPERCASE(cboxOrderby.Text) = 'NOMBRE' then
  Result := ' Order by NOMBRE_CTE'
  else
  if UPPERCASE(cboxOrderby.Text) = 'CODIGOCTE' then
  Result := ' Order by CODIGO_CTE'
  else
  if UPPERCASE(cboxOrderby.Text) = 'MONEDA' then
  Result := ' Order by MONEDA'
  else
  if UPPERCASE(cboxOrderby.Text) = 'FECHAVENCE' then
  Result := ' Order by Fecha_VENCE'
  else
  if UPPERCASE(cboxOrderby.Text) = 'CodVendedor' then
  Result := ' Order by CODIGO_VENDEDOR'
  else
  if UPPERCASE(cboxOrderby.Text) = 'STATUS' then
  Result := ' Order by STATUS';
  {
  Fecha
Numero
CodigoCte
Nombre
Moneda
FechaVence
CodVendedor
Status

  }
end;

procedure TfrmCotizaciones.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
    ibqryCotizacionMaster.Filtered:= True
  else
      ibqryCotizacionMaster.Filtered:= False;
end;

procedure TfrmCotizaciones.ibqryCotizacionMasterFilterRecord(
  DataSet: TDataSet; var Accept: Boolean);
begin
  if RadioGroup1.ItemIndex = 2 then
  Accept:=DataSet['NOMBRE_CTE'] = Edit1.Text
  else
  if RadioGroup1.ItemIndex = 1 then  
    Accept:=DataSet['codigo_cte'] = StrToInt(Edit1.Text);
end;

procedure TfrmCotizaciones.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if ibqryCotizacionMasterSTATUS.Value = 'C' then
  BackGround := clSilver;
end;

procedure TfrmCotizaciones.BitBtn9Click(Sender: TObject);
begin
  dsibqryCotizacionMaster.DataSet.First;
end;

procedure TfrmCotizaciones.BitBtn10Click(Sender: TObject);
begin
  dsibqryCotizacionMaster.DataSet.Prior;
end;

procedure TfrmCotizaciones.BitBtn11Click(Sender: TObject);
begin
  dsibqryCotizacionMaster.DataSet.Next;
end;

procedure TfrmCotizaciones.BitBtn12Click(Sender: TObject);
begin
  dsibqryCotizacionMaster.DataSet.Last;
end;

procedure TfrmCotizaciones.BitBtn6Click(Sender: TObject);
begin
  dmfactura.qryRepCotizaNew.Close;
  dmfactura.qryRepCotizaNew.Params[0].Value:=ibqryCotizacionMasterNUMERO.Value;
  dmfactura.qryRepCotizaNew.Open;

  dmfactura.qryPorcOtrosCargosCotiza.Close;
  dmfactura.qryPorcOtrosCargosCotiza.Params[0].Value:=dmfactura.qryRepCotizaNewNUMERO.Value;
  dmfactura.qryPorcOtrosCargosCotiza.Open;
  dmclientes.tblClientes.Close;
  dmclientes.tblClientes.Open;
  if dmclientes.tblClientes.Locate('CODIGO_CTE',dmfactura.qryRepCotizaNewCODIGO_CTE.Value,[]) then
  glbcodVendedor:=dmclientes.tblClientesCOD_VENDEDOR.Value
  else
  glbcodVendedor:= VarUsuarioGlb;

  qckCotiza8_5_F_1ByMPreFct:=TqckCotiza8_5_F_1ByMPreFct.Create(Nil);
  try
    qckCotiza8_5_F_1ByMPreFct.Preview;
    if CheckBox2.Checked then
    ReportExport(qckCotiza8_5_F_1ByMPreFct,GlbRutaCotizaciones+'\Cotizacion'+dmfactura.qryRepCotizaNewNUMERO.AsString+'.pdf');

  finally
  qckCotiza8_5_F_1ByMPreFct.Free;
  qckCotiza8_5_F_1ByMPreFct:=Nil;
  end;
end;

procedure TfrmCotizaciones.BitBtn7Click(Sender: TObject);
begin
  frmOrdenTrabajo:=TfrmOrdenTrabajo.Create(Nil);
  try
  dmVentas.tblOrdenTrabajo.Close;
  dmVentas.tblOrdenTrabajo.Params[0].Value := ExtraerFecha(GlbFechaTrnDiaria);
  dmVentas.tblOrdenTrabajo.Params[1].Value := ExtraerFecha(GlbFechaTrnDiaria);
  dmVentas.tblOrdenTrabajo.Open;
  dmVentas.tblOrdenTrabajo.Append;
  dmVentas.tblOrdenTrabajoNUM_COTIZACION.Value:= ibqryCotizacionMasterNUMERO.Value;
  dmVentas.tblOrdenTrabajoFECHA.Value         := ExtraerFecha(GlbFechaTrnDiaria);
  dmVentas.tblOrdenTrabajoCODIGO_CTE.Value    := ibqryCotizacionMasterCODIGO_CTE.Value;
  dmVentas.tblOrdenTrabajoCOD_MONEDA.Value    := ibqryCotizacionMasterMONEDA.Value;
  dmVentas.tblOrdenTrabajoMONTO_TOTAL.Value   := ibqryCotizacionMasterVALOR_TOTAL.Value;
  dmVentas.tblOrdenTrabajoCODIGO_USER.Value   := ibqryCotizacionMasterCODIGO_VENDEDOR.Value;

  dmVentas.tblOrdenTrabajoSTATUS.Value   := 'A';
  dmVentas.tblOrdenTrabajoFECHA_IN.Value := Now;
  dmVentas.tblOrdenTrabajoIN_POR.Value   := StrUserName;
  frmOrdenTrabajo.Showmodal;
  finally
  frmOrdenTrabajo.Free;
  frmOrdenTrabajo:=Nil;
  end;
end;

procedure TfrmCotizaciones.BitBtn8Click(Sender: TObject);
begin
  if ibsqlBusarFechaOrden.Open then
  ibsqlBusarFechaOrden.Close;
  ibsqlBusarFechaOrden.Params[0].Value:= ibqryCotizacionMasterNUMERO.Value;
  ibsqlBusarFechaOrden.ExecQuery;

  frmOrdenTrabajo:=TfrmOrdenTrabajo.Create(Nil);
  try
  if (not ibsqlBusarFechaOrden.FieldByName('Fecha').IsNull) then
  begin
    dmVentas.tblOrdenTrabajo.Close;  
    dmVentas.tblOrdenTrabajo.Params[0].Value := ExtraerFecha(ibsqlBusarFechaOrden.FieldByName('Fecha').AsDate);
    dmVentas.tblOrdenTrabajo.Params[1].Value := ExtraerFecha(ibsqlBusarFechaOrden.FieldByName('Fecha').AsDate);
    dmVentas.tblOrdenTrabajo.Filtered := False;
    dmVentas.tblOrdenTrabajo.Open;
  end else
  begin
   dmVentas.tblOrdenTrabajo.Close;
   dmVentas.tblOrdenTrabajo.Params[0].Value := ExtraerFecha(GlbFechaTrnDiaria);
   dmVentas.tblOrdenTrabajo.Params[1].Value := ExtraerFecha(GlbFechaTrnDiaria);
   dmVentas.tblOrdenTrabajo.Open;
  end;
  dmVentas.tblOrdenTrabajo.Locate('NUM_COTIZACION',ibqryCotizacionMasterNUMERO.Value,[]);
  frmOrdenTrabajo.Showmodal;
  finally
  frmOrdenTrabajo.Free;
  frmOrdenTrabajo:=Nil;
  end;

end;

procedure TfrmCotizaciones.Button3Click(Sender: TObject);
var
  x, cant : smallint;

begin
  cant:= StrToInt(InputBox('Agregar item','Entre cantidad','1'));
  for x:=1 to cant do
  begin
    InsertarCotizacionDet(ibqryCotizacionMasterNUMERO.Value,x);
  end;
  if Not ibStpInsertCotizaDet.Transaction.InTransaction then
  ibStpInsertCotizaDet.Transaction.StartTransaction;
  try
    ibStpInsertCotizaDet.Transaction.CommitRetaining;
  except
  ibStpInsertCotizaDet.Transaction.RollbackRetaining;
  end;
end;

procedure TfrmCotizaciones.InsertarCotizacionDet(numero : Integer;itmNo:smallint);
begin
  //ibStpInsertCotizaDet.Params[0].Value := Numero;
  ibStpInsertCotizaDet.Params[1].Value    := ibqryCotizacionDetNumero.Value;    //Numero
  ibStpInsertCotizaDet.Params[2].Value    := ibqryCotizacionDetCODIGO_PROD.Value; //Codigo_Prod
  ibStpInsertCotizaDet.Params[3].Value    := Null;    //codigo_barra
  ibStpInsertCotizaDet.Params[4].Value    := ibqryCotizacionDetDESCRIPCION.Value+' '+IntToStr(itmNo); //Descripcion
  ibStpInsertCotizaDet.Params[5].Value    := ibqryCotizacionDetDescripcionEspecial.Value;//DescripcionEspecial
  ibStpInsertCotizaDet.Params[6].Value    := ibqryCotizacionDetCANTIDAD.Value;        //Cantidad
  ibStpInsertCotizaDet.Params[7].Value    := ibqryCotizacionDetPRECIO.Value;      //Precio
  ibStpInsertCotizaDet.Params[8].Value    := 0;                        //Porc_desc_det
  ibStpInsertCotizaDet.Params[9].Value    := ibqryCotizacionDetITBI_DET.Value;        //Itbi_det
  ibStpInsertCotizaDet.Params[10].Value   := ibqryCotizacionDetVALOR_SERVICIO_DET.Value;  //Valor_servicio_det
  ibStpInsertCotizaDet.Params[11].Value   := ibqryCotizacionDetVALOR_TOTAL_DET.Value;   //Valor_Total_Det
  ibStpInsertCotizaDet.Params[12].Value   := 'A';                      //Status_det
  ibStpInsertCotizaDet.Params[13].Value   := Now;                      //Fecha_in
  ibStpInsertCotizaDet.Params[14].Value   := Null;        //In_Por
  ibStpInsertCotizaDet.Params[15].Value   := Null;                      //Fecha_mod
  ibStpInsertCotizaDet.Params[16].AsString:= Trim(StrUserName);        //Mod_por
  ibStpInsertCotizaDet.Params[17].Value   := ibqryCotizacionDetTIPO_UNIDAD.Value;  //Tipo_Unidad
  //if (ABS(TotalesMontoExoneraITBIS.Value) > 0) then
  //ibStpInsertCotizaDet.Params[18].Value := 1
  //else
  ibStpInsertCotizaDet.Params[18].Value   := ibqryCotizacionDetITBIS_EXENTO.Value; //Itbis_Exento
  ibStpInsertCotizaDet.Params[19].Value   := ibqryCotizacionDetTIPO_VENTA.Value;   //Tipo_Venta
  ibStpInsertCotizaDet.Params[20].Value   := 0;//ibqryCotizacionDetPORC_DESC_DET.Value;//Porc_Desc_Item
  //if (ibqryCotizacionMasterMONTO_DESCUENTO.Value > 0) then
  //ibStpInsertCotizaDet.Params[21].Value    := rxVentaMontoDescItem.Value //Monto_Desc_Item
  //else
  ibStpInsertCotizaDet.Params[21].Value    := 0;

  ibStpInsertCotizaDet.Params[22].Value    := ibqryCotizacionMasterMoneda.Value;
  ibStpInsertCotizaDet.Params[23].Value    := ibqryCotizacionDetMONTO_TASA.Value;
  ibStpInsertCotizaDet.Params[24].Value    := ibqryCotizacionDetIDTASAITBIS.Value;
  ibStpInsertCotizaDet.Params[25].Value    := ibqryCotizacionDetCANT_VIAJES.Value;
  ibStpInsertCotizaDet.Params[26].Value    := ibqryCotizacionDetLEVEL_PRECIO_VENT.Value;
  //ibStpInsertCotizaDet.Params[21].Value := rxVentaMontoDescItem.Value;
  ibStpInsertCotizaDet.ExecProc;
end;

end.
.
