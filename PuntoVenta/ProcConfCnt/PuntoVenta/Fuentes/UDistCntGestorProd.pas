
unit UDistCntGestorProd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, IBDatabase, Grids, DBGrids,
  StdCtrls, Buttons, RxMemDS, RXDBCtrl, Mask, ToolEdit, ComCtrls;

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
    procedure AbrirDatoscnt(origen:integer);
    function  FCampoValue(tabla:TIBQuery; campoFuente:string): Variant;
    function  FCampoValueRX(tabla:TRxMemoryData; campoFuente:string): Variant;
    //Procesar Datos
    procedure ProcDatos(var datos:TRxMemoryData);
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
  qryviewDatosParaCnt.Params[0].Value:= DateEdit1.Date;
  qryviewDatosParaCnt.Params[1].value:= 1;//contado
  qryviewDatosParaCnt.Open;
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
  qryDistribucionCntDet.close;
  qryDistribucionCntDet.Open;
  tablasCnt.Close;
  tablasCnt.Open;
  tablasCnt.First;
  combobox1.clear;
  While Not tablasCnt.Eof Do
  begin
    combobox1.Items.Add(tablasCntNOMBRE_TABLA_CNT.Value);
    tablasCnt.Next;
  end;
end;

procedure TfrmPrepararDatosCnt.ComboBox1Click(Sender: TObject);
begin
  BitBtn1Click(Self);
end;

procedure TfrmPrepararDatosCnt.qryviewDatosParaCntAfterScroll(DataSet: TDataSet);
begin
  qryVentaxFPMonto.close;
  qryVentaxFPMonto.Params[0].Value:= dateedit1.Date;
  qryVentaxFPMonto.params[1].Value:= qryviewDatosParaCntFORMA_PAGO.Value;
  qryVentaxFPMonto.Open;
end;

procedure TfrmPrepararDatosCnt.BitBtn2Click(Sender: TObject);
begin
  //ProcDatos;
end;


procedure TfrmPrepararDatosCnt.rxTranCntCalcFields(DataSet: TDataSet);
begin
  {if CtaExiste(rxTrancntrxCUENTA1.Value,
               rxTrancntrxCUENTA2.Value,
               rxTrancntrxCUENTA3.Value,false) then
  rxTranCntNombreCuenta.Value := glbNombreCta;
  rxTranCntrxCuenta.Value:=
  rxTranCntrxCuenta1.Value + rxTranCntrxCuenta2.Value + rxTranCntrxCuenta3.Value;}
end;

function EsNumero(tipo : TFieldType): Boolean;
  begin
    case tipo of
       ftString,
       ftMemo, ftDate, ftBoolean : result:= false;
       ftInteger,
       ftSmallint,
       ftFloat,
       ftCurrency  : Result := true;
    end;//case
  end;
  
procedure TfrmPrepararDatosCnt.ProcDatos(var datos:TRxMemoryData);
var
  monto : Extended;
begin
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
  qryConfCtas.close;
  qryConfCtas.Open;
  qryConfCtas.first;

  ProgressBar1.Max := qryConfCtas.RecordCount;

  While Not qryConfCtas.Eof Do
  begin
    ProgressBar1.StepIt;
    qryviewDatosParaCnt.Close;
    qryviewDatosParaCnt.params[0].Value := ExtraerFecha(DateEdit1.Date);
    qryviewDatosParaCnt.params[1].Value := qryConfCtasCODIGO_TIPO_PAGO.Value;
    qryviewDatosParaCnt.Open;
    ProgressBar2.Max := qryviewDatosParaCnt.RecordCount;
    qryDistribucionCnt.Close;
    qryDistribucionCnt.Params[0].Value:= 'TRNCNT_DETALLE';
    qryDistribucionCnt.Params[1].Value:= 1;
    qryDistribucionCnt.Params[2].Value:= qryConfCtasCODIGO_TIPO_PAGO.Value;
    qryDistribucionCnt.Open;
    qryDistribucionCnt.First;
    While Not qryDistribucionCnt.Eof Do
    begin
      ProgressBar2.StepIt;
      qryviewDatosParaCnt.First;
      monto:=0;
      //if cnt es igual a 1 entonces contabilizar
      if (qryDistribucionCntCNT.Value = 1) then
      begin
        While Not qryviewDatosParaCnt.Eof do
        begin
          rxTranCnt.Insert;
          monto:= FCampoValue(qryviewDatosParaCnt, qryDistribucionCntNOMBRE_CAMPO.Value);
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
    if not field.IsNull then
    result:= field.Value
    else result:=0;
    end
    else result:= 0;
  end else
  result:=-1;
end;
end.
