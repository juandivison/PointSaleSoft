
unit UDistCntGestorProd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, IBDatabase, Grids, DBGrids,
  StdCtrls, Buttons, RxMemDS, RXDBCtrl, Mask, rxToolEdit, ComCtrls,
  WinSkinData;

type
  TfrmPrepararDatosCnt = class(TForm)
    qryDistribucionCnt: TIBQuery;
    qryDistribucionCntSERIE: TIntegerField;
    qryDistribucionCntMODULO: TIntegerField;
    qryDistribucionCntORIGEN: TIntegerField;
    qryDistribucionCntCTA1: TIBStringField;
    qryDistribucionCntCTA2: TIBStringField;
    qryDistribucionCntCTA3: TIBStringField;
    qryDistribucionCntDESCRIPCION: TIBStringField;
    qryDistribucionCntNOMBRE_CAMPO: TIBStringField;
    qryDistribucionCntNOMBRE_TABLA: TIBStringField;
    qryDistribucionCntSTATUS: TIBStringField;
    qryDistribucionCntINSERT_POR: TIBStringField;
    qryDistribucionCntFECHA_INSER: TDateTimeField;
    qryDistribucionCntUPDATE_POR: TIBStringField;
    qryDistribucionCntCNT: TSmallintField;
    qryDistribucionCntIDTIPO_PAGO: TSmallintField;
    qryDistribucionCntNOMBRE_CAMPO_CNTDET: TIBStringField;
    qryDistribucionCntNOMBRE_CAMPO_CNTMASTER: TIBStringField;
    qryDistribucionCntNOMBRE_TABLA_CNT: TIBStringField;
    qryDistribucionCntSENTENCIA_SQL: TIBStringField;
    DBGrid1: TDBGrid;
    dsqryDistribucionCnt: TDataSource;
    BitBtn1: TBitBtn;
    DBGrid2: TDBGrid;
    qryviewDatosParaCnt: TIBQuery;
    dsqryviewDatosParaCnt: TDataSource;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    qryviewDatosParaCntNUMERO: TIntegerField;
    qryviewDatosParaCntSERIE: TIntegerField;
    qryviewDatosParaCntFECHA: TDateTimeField;
    qryviewDatosParaCntOBSERVACION: TIBStringField;
    qryviewDatosParaCntFORMA_PAGO: TSmallintField;
    qryviewDatosParaCntNUMERO_FACTURA: TIntegerField;
    qryviewDatosParaCntNUMERO_DOC_PAGO: TIBStringField;
    qryviewDatosParaCntMONTO_BRUTO: TFloatField;
    qryviewDatosParaCntMONTO_DESCUENTO: TFloatField;
    qryviewDatosParaCntPORC_DESCUENTO_MASTER: TIntegerField;
    qryviewDatosParaCntDESCRIPCION: TIBStringField;
    qryviewDatosParaCntCANTIDAD: TFloatField;
    qryviewDatosParaCntCODIGO_PROD: TIBStringField;
    qryviewDatosParaCntPRECIO: TFloatField;
    qryviewDatosParaCntPORC_DESC_DET: TFloatField;
    qryviewDatosParaCntITBI_DET: TFloatField;
    qryviewDatosParaCntVALOR_SERVICIO_DET: TFloatField;
    qryviewDatosParaCntVALOR_TOTAL_DET: TFloatField;
    qryviewDatosParaCntMONTO_DIETA: TFloatField;
    qryviewDatosParaCntMONTO_AJUSTE: TFloatField;
    qryviewDatosParaCntPRECIO_COMPRA: TFloatField;
    RadioButton3: TRadioButton;
    tablasCnt: TIBQuery;
    ComboBox1: TComboBox;
    tablasCntNOMBRE_TABLA_CNT: TIBStringField;
    qryVentaxFPMonto: TIBQuery;
    qryVentaxFPMontoFORMA_PAGO: TSmallintField;
    qryVentaxFPMontoMONTO: TFloatField;
    dsqryVentaxFPMonto: TDataSource;
    DBGrid3: TDBGrid;
    Button1: TButton;
    BitBtn2: TBitBtn;
    RxDBGrid1: TRxDBGrid;
    dsrxTranCnt: TDataSource;
    qryviewDatosParaCntCOSTO_PRODUCTO: TFloatField;
    qryDistribucionCntDet: TIBQuery;
    RxDBGrid2: TRxDBGrid;
    dsqryDistribucionCntDet: TDataSource;
    qryDistribucionCntDetSERIE: TIntegerField;
    qryDistribucionCntDetNOMBRE_CAMPO: TIBStringField;
    qryDistribucionCntDetNOMBRE_CAMPODET: TIBStringField;
    DateEdit1: TDateEdit;
    rxTranCnt: TRxMemoryData;
    rxTranCntrxCuenta1: TStringField;
    rxTranCntrxCuenta2: TStringField;
    rxTranCntrxCuenta3: TStringField;
    rxTranCntrxCodDepto: TStringField;
    rxTranCntrxFecha: TDateField;
    rxTranCntrxDescripcion: TStringField;
    rxTranCntrxDebito: TFloatField;
    rxTranCntrxCredito: TFloatField;
    rxTranCntNombreCuenta: TStringField;
    rxTranCntrxCuenta: TStringField;
    rxTranCntrxCodCte: TIntegerField;
    rxTranCntrxNumFact: TIntegerField;
    rxTranCntrxDepartamento: TIntegerField;
    rxTranCntDESCSERV: TStringField;
    rxTranCntCUENTA123: TStringField;
    rxTranCntCentroCosto: TIntegerField;
    rxTranCntSerieCampoClave: TIntegerField;
    qryConfCtas: TIBQuery;
    qryConfCtasDESCRIPCION: TIBStringField;
    qryConfCtasID_FPAGO: TSmallintField;
    qryConfCtasMODULO: TIntegerField;
    qryConfCtasDESCRIPCION1: TIBStringField;
    qryConfCtasCODIGO_TIPO_PAGO: TSmallintField;
    qryConfCtasDESCRIPCION2: TIBStringField;
    ProgressBar1: TProgressBar;
    ProgressBar2: TProgressBar;
    ProgressBar3: TProgressBar;
    rxTranCntSERIE: TStringField;
    SkinData1: TSkinData;
    qryviewDatosParaCntMONTO_INGRESOS: TFloatField;
    qryviewDatosParaCntMONTO_RECARGO: TFloatField;
    qryviewDatosParaCntITBISTASA0: TFloatField;
    qryviewDatosParaCntITBISTASA8: TFloatField;
    qryviewDatosParaCntITBISTASA11: TFloatField;
    qryviewDatosParaCntITBISTASA13: TFloatField;
    qryviewDatosParaCntITBISTASA16: TFloatField;
    qryviewDatosParaCntITBISTASA18: TFloatField;
    qryviewDatosParaCntITBISTASAEXO8: TFloatField;
    qryviewDatosParaCntITBISTASAEXO11: TFloatField;
    qryviewDatosParaCntITBISTASAEXO13: TFloatField;
    qryviewDatosParaCntITBISTASAEXO16: TFloatField;
    qryviewDatosParaCntITBISTASAEXO18: TFloatField;
    qryviewDatosParaCntITBISTASAEXO0: TFloatField;
    rxTranCntrxCodigo_Prod: TStringField;
    qryviewDatosParaCntMONTO_VISANET: TFloatField;
    qryviewDatosParaCntMONTO_CARDNET: TFloatField;
    qryviewDatosParaCntPROVEEDOR_TARJETA: TIBStringField;
    qryviewDatosParaCntTIPO_PAGO: TSmallintField;
    qryviewDatosParaCnt_TC: TIBQuery;
    qryviewDatosParaCntBase: TIBQuery;
    qryviewDatosParaCntIngCxc: TIBQuery;
    qryviewDatosOrdenCmpra: TIBQuery;
    qryviewDatosOrdenCmpraDESC_PRODUCTO: TIBStringField;
    qryviewDatosOrdenCmpraSERIE: TIntegerField;
    qryviewDatosOrdenCmpraNUMERO: TIntegerField;
    qryviewDatosOrdenCmpraTIPO_TRN: TSmallintField;
    qryviewDatosOrdenCmpraFECHA: TDateTimeField;
    qryviewDatosOrdenCmpraMONTO_TOTAL: TFloatField;
    qryviewDatosOrdenCmpraFORMA_PAGO: TSmallintField;
    qryviewDatosOrdenCmpraCODIGO_PROD: TIntegerField;
    qryviewDatosOrdenCmpraCANTIDAD: TFloatField;
    qryviewDatosOrdenCmpraPRECIO: TFloatField;
    qryviewDatosOrdenCmpraPORC_DESC_DET: TFloatField;
    qryviewDatosOrdenCmpraITBI_DET: TFloatField;
    qryviewDatosOrdenCmpraVALOR_BRUTO: TFloatField;
    qryviewDatosOrdenCmpraVALOR_TOTAL_DET: TFloatField;
    qryviewDatosOrdenCmpraNUM_ORDEN: TFloatField;
    qryviewDatosOrdenCmpraSTATUS_DET: TIBStringField;
    qryviewDatosOrdenCmpraDESCRIPCION: TIBStringField;
    qryviewDatosOrdenCmpraCANT_UNIDADES: TFloatField;
    qryviewDatosOrdenCmpraSTATUS_CNT: TIBStringField;
    qryviewDatosOrdenCmpraBase: TIBQuery;
    IBStringField1: TIBStringField;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    SmallintField1: TSmallintField;
    DateTimeField1: TDateTimeField;
    FloatField1: TFloatField;
    SmallintField2: TSmallintField;
    IntegerField3: TIntegerField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    IBStringField2: TIBStringField;
    IBStringField3: TIBStringField;
    FloatField9: TFloatField;
    IBStringField4: TIBStringField;
    procedure BitBtn1Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Click(Sender: TObject);
    procedure qryviewDatosParaCntAfterScroll(DataSet: TDataSet);

    procedure BitBtn2Click(Sender: TObject);
    procedure rxTranCntCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    FTipoTRN : Integer;
    nombreView : String;
    esTarjeta : Boolean;
    esVentaCash:Boolean;
    procedure AbrirDatoscnt(origen:Integer);
    function  FCampoValue(tabla:TIBQuery; campoFuente:string): Variant;
    function  FCampoValueRX(tabla:TRxMemoryData; campoFuente:string): Variant;
    //Procesar Datos
    procedure ProcDatos(var datos:TRxMemoryData);
    procedure ProcDatosOrdenes(var datos:TRxMemoryData);
    procedure ProcDatosCostos(var datos:TRxMemoryData);
  end;

var
  frmPrepararDatosCnt: TfrmPrepararDatosCnt;
  varMonto : Extended;
  varString: String;
implementation

uses UGlobal, UDatModConectar;

{$R *.dfm}


  
procedure TfrmPrepararDatosCnt.AbrirDatoscnt(origen: integer);
begin
  qryviewDatosParaCnt.Close;
  //qryviewDatosParaCnt.Params[0].Value:= nombreView;
  qryviewDatosParaCnt.Params[0].Value:= ExtraerFecha(DateEdit1.Date);
  qryviewDatosParaCnt.Params[1].value:= 1;//contado
  qryviewDatosParaCnt.Open;//qryviewDatosParaCnt.SQL.Text
end;

procedure TfrmPrepararDatosCnt.BitBtn1Click(Sender: TObject);
begin
  qryDistribucionCnt.Close;
  qryDistribucionCnt.Params[0].Value:= combobox1.Text;
  qryDistribucionCnt.Params[1].Value:= 1;
  qryDistribucionCnt.Open;
  RadioButton3Click(Self);
  RadioButton2Click(Self);
  RadioButton1Click(Self);

  //buscar el monto de la venta por tipo
  qryVentaxFPMonto.close;
  
  qryVentaxFPMonto.Open;
end;

procedure TfrmPrepararDatosCnt.RadioButton1Click(Sender: TObject);
begin
  if RadioButton1.Checked then
  AbrirDatoscnt(1);
end;

procedure TfrmPrepararDatosCnt.RadioButton2Click(Sender: TObject);
begin
  if RadioButton2.Checked then
  AbrirDatoscnt(2);
end;

procedure TfrmPrepararDatosCnt.RadioButton3Click(Sender: TObject);
begin
  if RadioButton3.Checked then
  AbrirDatoscnt(0);
end;

procedure TfrmPrepararDatosCnt.FormCreate(Sender: TObject);
begin
  //DateEdit1.Date := EncodeDate(2009,11,13);
  qryDistribucionCntDet.Close;
  qryDistribucionCntDet.Open;
  tablasCnt.Close;
  tablasCnt.Open;
  tablasCnt.First;
  combobox1.Clear;
  While Not tablasCnt.Eof Do
  begin
    combobox1.Items.Add(tablasCntNOMBRE_TABLA_CNT.Value);
    tablasCnt.Next;
  end;
  FTipoTRN  := -1;
  esTarjeta := False;
end;

procedure TfrmPrepararDatosCnt.ComboBox1Click(Sender: TObject);
begin
  BitBtn1Click(Self);
end;

procedure TfrmPrepararDatosCnt.qryviewDatosParaCntAfterScroll(DataSet: TDataSet);
begin
  qryVentaxFPMonto.Close;
  qryVentaxFPMonto.Params[0].Value:= dateEdit1.Date;
  qryVentaxFPMonto.Params[1].Value:= qryviewDatosParaCntFORMA_PAGO.Value;
  qryVentaxFPMonto.Open;
end;

procedure TfrmPrepararDatosCnt.BitBtn2Click(Sender: TObject);
begin
  //ProcDatos;
end;


procedure TfrmPrepararDatosCnt.rxTranCntCalcFields(DataSet: TDataSet);
begin
{  if CtaExiste(rxTrancntrxCUENTA1.Value,
               rxTrancntrxCUENTA2.Value,
               rxTrancntrxCUENTA3.Value,false) then
  rxTranCntNombreCuenta.Value := glbNombreCta
  else
  rxTranCntNombreCuenta.Value := glbNombreCta;
  rxTranCntrxCuenta.Value:=
  rxTranCntrxCuenta1.Value + rxTranCntrxCuenta2.Value + rxTranCntrxCuenta3.Value; }
end;

function EsNumero(tipo : TFieldType): Boolean;
  begin
    Case tipo Of
       ftString,
       ftMemo, ftDate, ftBoolean : result:= false;
       ftInteger,
       ftSmallint,
       ftFloat,
       ftCurrency : Result := true;
    end;//case
  end;

procedure TfrmPrepararDatosCnt.ProcDatos(var datos:TRxMemoryData);
var
  monto : Extended;
begin
  if (FTipoTRN = -1 ) then
  begin
    MessageDlg('Grupo de transacciones a ser procesada, no ha sido indicado.', mtError, [mbOk], 0);
    Exit;
  end;
  qryDistribucionCntDet.Close;
  qryDistribucionCntDet.Open;
  qryDistribucionCnt.Close;
  qryDistribucionCnt.Params[0].Value:= 'TRNCNT_DETALLE';
  qryDistribucionCnt.Params[1].Value:= 1;
  qryDistribucionCnt.Open;
  RadioButton3Click(Self);
  RadioButton2Click(Self);
  RadioButton1Click(Self);

  //buscar el monto de la venta por tipo
  qryVentaxFPMonto.Close;
  qryVentaxFPMonto.Open;
  //Procesar Detalles
  qryDistribucionCnt.First;
  rxTranCnt.Close;
  rxTranCnt.Open;
  qryConfCtas.Close;
  qryConfCtas.Params[0].Value:=FTipoTRN;
  qryConfCtas.Open;
  qryConfCtas.First;

  ProgressBar1.Max := qryConfCtas.RecordCount;
  if (GlbEsDebugEntradas = 1) then
  WriteToLog('***** CAMPO ENTRADA DE DIARIO ********');

  While Not qryConfCtas.Eof Do
  begin
    ProgressBar1.StepIt;
    qryviewDatosParaCnt.Close;
    if (nombreView = 'VIEW_Cobros_cxcACNT') then
    qryviewDatosParaCnt.SQL.Text :=  qryviewDatosParaCntIngCxc.SQL.Text;
    if (nombreView = 'view_RegPedidoACnt') then
    qryviewDatosParaCnt.SQL.Text :=  qryviewDatosOrdenCmpra.SQL.Text;
    //if esTarjeta then
    //qryviewDatosParaCnt.SQL.Text :=  qryviewDatosParaCnt_TC.SQL.Text;
    //if not qryviewDatosParaCnt.Prepared then
    //qryviewDatosParaCnt.Prepare;
  //qryviewDatosParaCnt.params[0].Value := nombreView;
    qryviewDatosParaCnt.Params[0].Value := ExtraerFecha(DateEdit1.Date);
    qryviewDatosParaCnt.Params[1].Value := qryConfCtasCODIGO_TIPO_PAGO.Value;
    qryviewDatosParaCnt.Open;
    ProgressBar2.Max := qryviewDatosParaCnt.RecordCount;
    qryDistribucionCnt.Close;
    qryDistribucionCnt.Params[0].Value:= 'TRNCNT_DETALLE';
    qryDistribucionCnt.Params[1].Value:= GLBMODULO_CNT;
    qryDistribucionCnt.Params[2].Value:= qryConfCtasCODIGO_TIPO_PAGO.Value;
    qryDistribucionCnt.Open;
    qryDistribucionCnt.First; //qryDistribucionCnt.recordcount
    While Not qryDistribucionCnt.Eof Do
    begin
      ProgressBar2.StepIt;
      qryviewDatosParaCnt.First; //qryviewDatosParaCnt.recordcount
      monto:=0;
      if (esTarjeta) then
      begin
        if (UpperCase(trim(qryDistribucionCntnombre_tabla.value)) <> UpperCase(nombreView)) then
        begin
          qryDistribucionCnt.Next;
          Continue;
        end;
      end;
      //if CNT es igual a 1 entonces contabilizar
      if (qryDistribucionCntCNT.Value = 1) then
      begin
        While Not qryviewDatosParaCnt.Eof Do
        begin
          //if (GlbEsDebugEntradas = 1) then
          //WriteToLog('Campo Mast : ' + qryDistribucionCntNOMBRE_CAMPO.Value);

          monto:= FCampoValue(qryviewDatosParaCnt, qryDistribucionCntNOMBRE_CAMPO.Value);
          //tt if (monto = 0) then
          //tt begin
          //tt   qryviewDatosParaCnt.Next;
          //tt   Continue;
          //tt end;
          rxTranCnt.Append;
          qryDistribucionCntDet.First;
          ProgressBar3.Max := qryDistribucionCntDet.RecordCount;
          While Not qryDistribucionCntDet.Eof Do
          begin
            ProgressBar3.StepIt;
            FCampoValue(qryviewDatosParaCnt, qryDistribucionCntDetNOMBRE_CAMPO.Value);
            if (Length(varString) > 0) Then
            rxTranCnt.FieldByName(qryDistribucionCntDetNOMBRE_CAMPODET.Value).Value:= varString;
            qryDistribucionCntDet.Next;
          end;

          if FCampoValueRX(rxTranCnt, qryDistribucionCntNOMBRE_CAMPO_CNTDET.Value) >=0 then
          rxTranCnt.FieldByName(qryDistribucionCntNOMBRE_CAMPO_CNTDET.Value).Value:= monto;

          rxTranCntrxCuenta1.Value:= qryDistribucionCntCTA1.Value;
          rxTranCntrxCuenta2.Value:= qryDistribucionCntCTA2.Value;
          rxTranCntrxCuenta3.Value:= qryDistribucionCntCTA3.Value;

          rxTranCntrxFecha.Value  := DateEdit1.Date;
          if (rxTranCnt.FieldByName('rxDebito').Value = 0) Or
             (rxTranCnt.FieldByName('rxCredito').Value = 0) then
          rxTranCnt.Cancel;

          if rxTranCnt.State = dsInsert then
          rxTranCnt.Post;

          if (GlbEsDebugEntradas = 1) then
          begin
            WriteToLog('Campo Det Cuenta : ' + rxTranCntrxCuenta1.Value+
            '-'+rxTranCntrxCuenta2.Value+'-'+rxTranCntrxCuenta3.Value+ ' '+
            glbNombreCta);
          end;

          qryviewDatosParaCnt.Next;
        end;
      end;
      qryDistribucionCnt.Next;
    end;
    qryConfCtas.Next;
  end;
  if (GlbEsDebugEntradas = 1) then
  WriteToLog('Total de Records: ' + InttoStr(rxTranCnt.RecordCount));

  if rxTranCnt.State in [dsBrowse] then
  datos.LoadFromDataSet(rxTranCnt,0, lmAppend);

  datos.FieldByName('rxdebito').Value;  
  qryviewDatosParaCnt.SQL.Text :=  qryviewDatosParaCntBase.SQL.Text;
  //if datos.State in [dsBrowse] then
  //Showmessage('datos.state = dsBrowse');
end;

function TfrmPrepararDatosCnt.FCampoValue(tabla: TIBQuery; campoFuente: string):Variant;
var
  field : TField;

begin
  field := tabla.FindField(campoFuente);
  varString:='';
  result:=0;
  if field <> nil then
  begin
    if EsNumero(field.DataType) then
    begin
      if Not field.IsNull then
      begin
        result:= field.Value;
        varString:= field.AsString;
      end
      else result:=0;
    end
    else
    begin
      result:= 0;
      if not field.IsNull then
      varString:= field.Value;
    end;
  end;
end;

function TfrmPrepararDatosCnt.FCampoValueRX(tabla: TRxMemoryData;
  campoFuente: string): Variant;
var
  field : TField;
begin
  field := tabla.FindField(campoFuente);
  if field <> nil then
  begin
    if EsNumero(field.DataType) then
    begin
      if Not Field.IsNull then
         result:= Field.Value
      else result:= 0;
    end else result:= 0;
  end else
  result:=-1;
end;
procedure TfrmPrepararDatosCnt.ProcDatosCostos(var datos: TRxMemoryData);
var
  monto : Extended;
begin
  if (FTipoTRN = -1 ) then
  begin
    MessageDlg('Grupo de Transacciones a ser procesada, no ha sido indicado.', mtError, [mbOk], 0);
    Exit;
  end;
  qryDistribucionCntDet.Close;
  qryDistribucionCntDet.Open;
  qryDistribucionCnt.Close;
  qryDistribucionCnt.Params[0].Value:= 'TRNCNT_DETALLE';
  qryDistribucionCnt.Params[1].Value:= 1;
  qryDistribucionCnt.Open;
  RadioButton3Click(Self);
  RadioButton2Click(Self);
  RadioButton1Click(Self);

  //buscar el monto de la venta por tipo
  qryVentaxFPMonto.Close;
  qryVentaxFPMonto.Open;
  //Procesar Detalles
  qryDistribucionCnt.First;
  rxTranCnt.Close;
  rxTranCnt.Open;
  qryConfCtas.Close;
  qryConfCtas.Params[0].Value:=FTipoTRN;
  qryConfCtas.Open;
  qryConfCtas.First;

  ProgressBar1.Max := qryConfCtas.RecordCount;

  While Not qryConfCtas.Eof Do
  begin
    ProgressBar1.StepIt;
    qryviewDatosParaCnt.Close;
    qryviewDatosParaCnt.Params[0].Value := ExtraerFecha(DateEdit1.Date);
    qryviewDatosParaCnt.Params[1].Value := qryConfCtasCODIGO_TIPO_PAGO.Value;
    qryviewDatosParaCnt.Open;
    ProgressBar2.Max := qryviewDatosParaCnt.RecordCount;
    qryDistribucionCnt.Close;
    qryDistribucionCnt.Params[0].Value:= 'TRNCNT_DETALLE';
    qryDistribucionCnt.Params[1].Value:= GLBMODULO_CNT;
    qryDistribucionCnt.Params[2].Value:= qryConfCtasCODIGO_TIPO_PAGO.Value;
    qryDistribucionCnt.Open;
    qryDistribucionCnt.First;
    While Not qryDistribucionCnt.Eof Do
    begin
      ProgressBar2.StepIt;
      qryviewDatosParaCnt.First;
      monto:=0;
      if (esTarjeta) then
      begin
        if (UpperCase(trim(qryDistribucionCntnombre_tabla.value)) <> UpperCase(nombreView)) then
        begin
          qryDistribucionCnt.Next;
          Continue;
        end;
      end;
      //if CNT es igual a 1 entonces contabilizar
      if (qryDistribucionCntCNT.Value = 1) then
      begin
        While Not qryviewDatosParaCnt.Eof Do
        begin
          monto:= FCampoValue(qryviewDatosParaCnt, qryDistribucionCntNOMBRE_CAMPO.Value);
          rxTranCnt.Insert;
          qryDistribucionCntDet.First;
          ProgressBar3.Max := qryDistribucionCntDet.RecordCount;
          While Not qryDistribucionCntDet.Eof Do
          begin
            ProgressBar3.StepIt;
            FCampoValue(qryviewDatosParaCnt, qryDistribucionCntDetNOMBRE_CAMPO.Value);
            if (Length(varString) > 0) Then
            rxTranCnt.FieldByName(qryDistribucionCntDetNOMBRE_CAMPODET.Value).Value:= varString;
            qryDistribucionCntDet.Next;
          end;

          if FCampoValueRX(rxTranCnt, qryDistribucionCntNOMBRE_CAMPO_CNTDET.Value) >=0 then
          rxTranCnt.FieldByName(qryDistribucionCntNOMBRE_CAMPO_CNTDET.Value).Value:= monto;
          
          rxTranCntrxCuenta1.Value:= qryDistribucionCntCTA1.Value;
          rxTranCntrxCuenta2.Value:= qryDistribucionCntCTA2.Value;
          rxTranCntrxCuenta3.Value:= qryDistribucionCntCTA3.Value;
          rxTranCntrxFecha.Value  := DateEdit1.Date;
          if (rxTranCnt.FieldByName('rxDebito').Value = 0) Or
             (rxTranCnt.FieldByName('rxCredito').Value = 0) then
          rxTranCnt.Cancel;

          if rxTranCnt.State = dsInsert then
          rxTranCnt.Post;
          qryviewDatosParaCnt.Next;
        end;
      end;
      qryDistribucionCnt.Next;
    end;
    qryConfCtas.Next;
  end;
  if rxTranCnt.State in [dsBrowse] then
  datos.LoadFromDataSet(rxTranCnt,0, lmAppend);
  datos.FieldByName('rxdebito').Value;
  qryviewDatosParaCnt.SQL.Text :=  qryviewDatosParaCntBase.SQL.Text;
end;

procedure TfrmPrepararDatosCnt.ProcDatosOrdenes(var datos: TRxMemoryData);
var
  monto : Extended;
begin
  if (FTipoTRN = -1 ) then
  begin
    MessageDlg('Grupo de Transacciones a ser procesada, no ha sido indicado.', mtError, [mbOk], 0);
    Exit;
  end;
  qryDistribucionCntDet.Close;
  qryDistribucionCntDet.Open;
  qryDistribucionCnt.Close;
  qryDistribucionCnt.Params[0].Value:= 'TRNCNT_DETALLE';
  qryDistribucionCnt.Params[1].Value:= 1;
  qryDistribucionCnt.Open;
  RadioButton3Click(Self);
  RadioButton2Click(Self);
  RadioButton1Click(Self);

  //Procesar Detalles
  qryDistribucionCnt.First;
  rxTranCnt.Close;
  rxTranCnt.Open;
  qryConfCtas.Close;
  qryConfCtas.Params[0].Value:= FTipoTRN;
  qryConfCtas.Open;
  qryConfCtas.First;

  ProgressBar1.Max := qryConfCtas.RecordCount;

  While Not qryConfCtas.Eof Do
  begin
    ProgressBar1.StepIt;
    qryviewDatosOrdenCmpra.Close;
    qryviewDatosOrdenCmpra.Params[0].Value := ExtraerFecha(DateEdit1.Date);
    qryviewDatosOrdenCmpra.Params[1].Value := qryConfCtasCODIGO_TIPO_PAGO.Value;
    qryviewDatosOrdenCmpra.Open;
    ProgressBar2.Max := qryviewDatosOrdenCmpra.RecordCount;
    qryDistribucionCnt.Close;
    qryDistribucionCnt.Params[0].Value:= 'TRNCNT_DETALLE';
    qryDistribucionCnt.Params[1].Value:= GLBMODULO_CNT;
    qryDistribucionCnt.Params[2].Value:= qryConfCtasCODIGO_TIPO_PAGO.Value;
    qryDistribucionCnt.Open;
    qryDistribucionCnt.First; //qryDistribucionCnt.Recordcount
    While Not qryDistribucionCnt.Eof Do
    begin
      ProgressBar2.StepIt;
      qryviewDatosOrdenCmpra.First;
      monto:=0;
      if (esTarjeta) then
      begin
        if (UpperCase(trim(qryDistribucionCntnombre_tabla.value)) <> UpperCase(nombreView)) then
        begin
          qryDistribucionCnt.Next;
          Continue;
        end;
      end;
      //if CNT es igual a 1 entonces contabilizar
      if (qryDistribucionCntCNT.Value = 1) then
      begin
        While Not qryviewDatosOrdenCmpra.Eof Do
        begin
          monto:= FCampoValue(qryviewDatosOrdenCmpra, qryDistribucionCntNOMBRE_CAMPO.Value);
          rxTranCnt.Insert;
          qryDistribucionCntDet.First;
          ProgressBar3.Max := qryDistribucionCntDet.RecordCount;
          While Not qryDistribucionCntDet.Eof Do
          begin
            ProgressBar3.StepIt;
            FCampoValue(qryviewDatosOrdenCmpra, qryDistribucionCntDetNOMBRE_CAMPO.Value);
            if (Length(varString) > 0) Then
            rxTranCnt.FieldByName(qryDistribucionCntDetNOMBRE_CAMPODET.Value).Value:= varString;
            qryDistribucionCntDet.Next;
          end;

          if FCampoValueRX(rxTranCnt, qryDistribucionCntNOMBRE_CAMPO_CNTDET.Value) >=0 then
          rxTranCnt.FieldByName(qryDistribucionCntNOMBRE_CAMPO_CNTDET.Value).Value:= monto;

          rxTranCntrxCuenta1.Value:= qryDistribucionCntCTA1.Value;
          rxTranCntrxCuenta2.Value:= qryDistribucionCntCTA2.Value;
          rxTranCntrxCuenta3.Value:= qryDistribucionCntCTA3.Value;
          rxTranCntrxFecha.Value  := DateEdit1.Date;
          if (rxTranCnt.FieldByName('rxDebito').Value = 0) Or
             (rxTranCnt.FieldByName('rxCredito').Value = 0) then
          rxTranCnt.Cancel;

          if rxTranCnt.State = dsInsert then
          rxTranCnt.Post;
          qryviewDatosOrdenCmpra.Next;
        end;
      end;
      qryDistribucionCnt.Next;
    end;
    qryConfCtas.Next;
  end;
  if rxTranCnt.State in [dsBrowse] then
  datos.LoadFromDataSet(rxTranCnt,0, lmAppend);
  datos.FieldByName('rxdebito').Value;
  qryviewDatosOrdenCmpra.SQL.Text :=  qryviewDatosOrdenCmpraBase.SQL.Text;
end;

end.
