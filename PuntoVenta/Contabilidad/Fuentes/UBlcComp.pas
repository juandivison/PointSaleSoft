unit UBlcComp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, Db, StdCtrls, EditNew, ComCtrls, Buttons,
  variants, ExtCtrls, RXDBCtrl, RxMemDS, DBCtrls;

type
  TfrmBlcComp = class(TForm)
    dtpkFecha: TDateTimePicker;
    edtTipoCta: TEditN;
    edtNivel: TEditN;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    GroupOpciones: TGroupBox;
    chkAntesCMes: TCheckBox;
    CheckBox2: TCheckBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    RxDBGrid1: TRxDBGrid;
    BitBtn3: TBitBtn;
    DBNavigator1: TDBNavigator;
    DBText1: TDBText;
    DBText2: TDBText;
    rxTotales: TRxMemoryData;
    dtrxTotales: TDataSource;
    rxTotalesDebito: TFloatField;
    rxTotalesCredito: TFloatField;
    Label4: TLabel;
    Label5: TLabel;
    rxTotalesDiferencia: TFloatField;
    dbdif1: TDBText;
    dbdif2: TDBText;
    Label6: TLabel;
    edtDecimales: TEditN;
    Label7: TLabel;
    chBoxCierre: TCheckBox;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rxTotalesCalcFields(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chkAntesCMesClick(Sender: TObject);
    procedure chBoxCierreClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBlcComp: TfrmBlcComp;

implementation

uses UDmRep, uglobal, URepBceDeComp, UDatModControl;

{$R *.DFM}

procedure TfrmBlcComp.BitBtn3Click(Sender: TObject);
var
  TDebito, TCredito:Real;
  strString:String;
  EsCatalogo:Boolean;
  entra:Boolean;
  sqlQuery: String;


begin
  EsCatalogo:=True;
  TDebito:=0;
  TCredito:=0;
  rxtotales.Close;
  rxtotales.EmptyTable;
  rxtotales.Open;
  dtmodrep.rxBalanceComp.Close;
  dtmodrep.rxBalanceComp.Emptytable;
  dtmodrep.rxBalanceComp.Open;
  dtmodrep.qryblcComp.Close;
  dtmodrep.qryblcComp.sql.Clear;
  if chkAntesCMes.Checked then
  begin
    sqlQuery:=dtmodrep.sqlScriptBlcComp_0.SQL.Text;
    EsCatalogo:=True;
  end else
  begin
    sqlQuery:=dtmodrep.sqlScriptBlcComp_1.SQL.Text;
    EsCatalogo := False;
  end;
  dtmodrep.FnivelCta := edtNivel.Text;
  dtmodrep.FTipoCta := edtTipoCta.Text;
  dtmodrep.qryblcComp.sql.Text := sqlQuery;
  if not dtmodrep.qryblcComp.Prepared then
  dtmodrep.qryblcComp.Prepare;  dtmodrep.qryblcComp.Recordcount;
  dtmodrep.qryblcComp.params[0].ParamType := ptInput;
  dtmodrep.qryblcComp.Params[0].AsDateTime := ExtraerFecha(dtpkFecha.date);
  if not EsCatalogo then
  begin
    dtmodrep.qryblcComp.Params[1].Value := 'A';
    if FormatDatetime('dd',dtpkfecha.date) = '12' then
    begin
      if chBoxCierre.Checked then
      dtmodrep.qryblcComp.Params[1].Value := 'A'
      else dtmodrep.qryblcComp.Params[1].Value := 'D';
    end;
  end;
  if (edtDecimales.text <> '') then
  begin
    dtmodrep.qryBlcCompDEBITO_ACT.DisplayFormat:=edtDecimales.text;
    dtmodrep.qryBlcCompCREDITO_ACT.DisplayFormat:=edtDecimales.text;
  end;
  dtmodrep.qryblcComp.open;
  dtmodrep.qryblcComp.filtered:=false;

  dtmodrep.qryblcComp.Filtered:=true;
  dtmodrep.qryblcComp.First;
  While Not dtmodrep.qryblcComp.Eof do
  begin
    if (((dtmodrep.qryblccompcuenta1.Value = '313') and
        (dtmodrep.qryblccompcuenta2.Value = '01')  and
        (dtmodrep.qryblccompcuenta3.Value = '04')) or
        ((dtmodrep.qryblccompcuenta1.Value = '313') and
        (dtmodrep.qryblccompcuenta2.Value = '02')  and
        (dtmodrep.qryblccompcuenta3.Value = '00'))
        ) and (not chBoxCierre.Checked) then
    begin
      entra:=False;
    end else entra:=True;
    if entra then
    begin
    dtmodrep.rxBalanceComp.Insert;
    dtmodrep.rxBalanceCompCUENTA1.Value:= dtmodrep.qryblccompcuenta1.Value;
    dtmodrep.rxBalanceCompCUENTA2.Value:= dtmodrep.qryblccompcuenta2.Value;
    dtmodrep.rxBalanceCompCUENTA3.Value:= dtmodrep.qryblccompcuenta3.Value;
    dtmodrep.rxbalancecompnivel.Value  := dtmodrep.qryblccompnivel_cta.Value;
    dtmodrep.rxBalanceCompSIGNO.Value:=dtmodrep.qryBlcCompSIGNO_CTA.value;
    dtmodrep.rxBalanceCompTIPO.Value:= dtmodrep.qryBlcCompTIPO_CTA.Value;
    dtmodrep.rxBalanceCompNOMBRE.Value:=dtmodrep.qryblccompnombre_Cta.Value;
    if dtmodrep.qryblccompsigno_cta.Value = 1 then
    begin
      if dtmodrep.qryBlcCompBALANCE_ACT.Value < 0 then
      begin
        dtmodrep.rxBalanceCompCREDITO.Value := Abs(dtmodrep.qryBlcCompBALANCE_ACT.Value);
        TCredito:=TCredito + dtmodrep.rxBalanceCompCREDITO.Value;
      end
      else
      begin
        dtmodrep.rxBalanceCompDEBITO.Value := dtmodrep.qryBlcCompBALANCE_ACT.Value;
        TDebito:=TDebito+ dtmodrep.rxBalanceCompDebito.Value;
      end;
    end else
    if dtmodrep.qryblccompsigno_cta.Value = 2 then
    begin
      if dtmodrep.qryBlcCompBALANCE_ACT.Value < 0 then
      begin
        dtmodrep.rxBalanceCompDEBITO.Value := Abs(dtmodrep.qryBlcCompBALANCE_ACT.Value);
        TDebito:=TDebito+ dtmodrep.rxBalanceCompDebito.Value;
      end
      else
      begin
        dtmodrep.rxBalanceCompCREDITO.Value := dtmodrep.qryBlcCompBALANCE_ACT.Value;
        TCredito:=TCredito + dtmodrep.rxBalanceCompCREDITO.Value;
      end;
    end else Messagedlg('Cuenta '+dtmodrep.qryblccompcuenta1.value+
             dtmodrep.qryblccompcuenta2.value+
             dtmodrep.qryblccompcuenta3.value+' no tiene signo',mterror,[mbok],0);
    dtmodrep.rxbalancecomp.post;
    end;
    dtmodrep.qryblcComp.next;
  end;
  dtmodrep.rxBalanceComp.SortOnFields('cuenta1;cuenta2;cuenta3',true,false);
  rxtotales.Insert;
  rxtotalesDebito.value := TDebito;
  rxtotalesCredito.value:= TCredito;
  rxtotales.Post;
end;

procedure TfrmBlcComp.BitBtn1Click(Sender: TObject);
begin
  glbfechainicial :=dtpkfecha.Date;
  qckBalancedeComp:=TqckBalancedeComp.create(nil);
  try
    if Messagedlg('Imprimir?',mtinformation,[mbyes,mbno],0) = mryes then
    begin
      qckBalancedeComp.PrinterSetup;
      qckBalancedeComp.Print;
    end
    else
    qckBalancedeComp.Preview;
  finally
  qckBalancedeComp.free;
  qckBalancedeComp:=nil;
  end;
end;

procedure TfrmBlcComp.FormCreate(Sender: TObject);
begin
  dmControl.qryControl.close;          // Transacciones contables
  dmControl.qryControl.filtered:=False;
  dmcontrol.qrycontrol.Open;
  dmControl.qrycontrol.locate('sistema;sub_sistema;cod_cia',
  vararrayof([1,0,1]),[]);//tropical tours
  dtpkfecha.Date:= ExtraerFecha(dmControl.qryControlFECHA_ACT.Value);
  dmcontrol.qrycontrol.close;
end;

procedure TfrmBlcComp.FormShow(Sender: TObject);
begin
  BitBtn3click(self);
end;

procedure TfrmBlcComp.rxTotalesCalcFields(DataSet: TDataSet);
begin
  dbdif1.Visible:= false;
  dbdif2.Visible:= false;
  rxtotalesdiferencia.Value:= rxtotalesdebito.Value - rxtotalescredito.Value;
  if rxtotalesdebito.Value > rxtotalescredito.Value then
  dbdif1.Visible:= true else dbdif2.Visible:= False;  
end;

procedure TfrmBlcComp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dtmodrep.qryblcComp.close;
  if dtmodrep.qryblcComp.Prepared then
  dtmodrep.qryblcComp.UnPrepare;
end;

procedure TfrmBlcComp.chkAntesCMesClick(Sender: TObject);
begin
  if chkAntesCMes.Checked then
  chkAntesCMes.caption:= 'Mes Actual'
  else chkAntesCMes.Caption := 'Mes Anterior';
end;

procedure TfrmBlcComp.chBoxCierreClick(Sender: TObject);
begin
  if chBoxCierre.Checked then
  chBoxCierre.Caption:='Desp.C.P.F.'
  else chBoxCierre.Caption:='Antes.C.P.F.';
end;

end.
{     PROCESAR-CAMPOS.
           MOVE ZEROES TO WDEBITO WCREDITO.
           IF WCUENTAS = "S"
              MOVE CTA1-BCE TO WCTA-01
              MOVE CTA2-BCE TO WCTA-02
              MOVE CTA3-BCE TO WCTA-03
              MOVE WCUENTA  TO CUENTA-DT
              MOVE "CUENTA" TO CUENTA-07
           ELSE
           MOVE SPACES     TO CUENTA-DT CUENTA-07.
           MOVE NIVEL-BCE  TO NIVEL-DT.
           MOVE NOMBRE-BCE TO NOMBRE-DT.

           IF SIGNO-BCE = "1"
              IF BALANCE-MES < ZEROES
                 MOVE BALANCE-MES TO CREDITO-DT WCREDITO
                 MOVE ZEROES TO DEBITO-DT
              ELSE
              MOVE BALANCE-MES TO DEBITO-DT WDEBITO
              MOVE ZEROES TO CREDITO-DT
           ELSE
           IF SIGNO-BCE = "2"
              IF BALANCE-MES < ZEROES
                 MOVE BALANCE-MES TO DEBITO-DT WDEBITO
                 MOVE ZEROES TO CREDITO-DT
              ELSE
              MOVE BALANCE-MES TO CREDITO-DT WCREDITO
              MOVE ZEROES TO DEBITO-DT. aqui

           IF CONT-LINE > 58
              PERFORM ENCABEZADO.
           IF NIVEL-BCE = 1
              WRITE REG-SALIDA FROM LINEA-DT AFTER 2
              WRITE REG-SALIDA AFTER 0
              ADD 2 TO CONT-LINE
              MOVE NIVEL-BCE TO NIVEL-ANT
           ELSE
           IF NIVEL-ANT = NIVEL-BCE
              WRITE REG-SALIDA FROM LINEA-DT AFTER 1
              ADD 1 TO CONT-LINE
           ELSE
           WRITE REG-SALIDA FROM LINEA-DT AFTER 2
           ADD 2 TO CONT-LINE
           MOVE NIVEL-BCE TO NIVEL-ANT.

           IF WNIVEL = 1 OR 4
              IF TIPO-CTA-BCE = "A"
                 ADD WCREDITO TO TTL-CREDITO
                 ADD WDEBITO TO TTL-DEBITO
              ELSE
              NEXT SENTENCE
           ELSE
           IF WNIVEL = 2 OR 3
              ADD WCREDITO TO TTL-CREDITO
              ADD WDEBITO TO TTL-DEBITO.}
              
{CREAR-ARCHIVO.
           READ CATALOGO NEXT RECORD WITH NO LOCK AT END
                MOVE "OFF" TO SW-DATOS.
           IF SW-DATOS = SPACES
      * QUITAR LAS TRES LINEAS SIGUIENTES, JRD.
              IF KEY-CUENTA = 3120101
                 NEXT SENTENCE
              ELSE
              IF KEY-CUENTA = 3130200 OR 3130201
                 NEXT SENTENCE
              ELSE
              IF KEY-CUENTA = 3130201 AND DIR-LINK = "PROVESA1"
                 NEXT SENTENCE
              ELSE
              PERFORM DESPLEGAR-PORCENTAJE
              IF WNIVEL = 1
                 PERFORM PROCESAR-SORT
              ELSE
              IF WNIVEL = 2 AND NIVEL-CTA = 1
                 PERFORM PROCESAR-SORT
              ELSE
              IF WNIVEL = 3 AND TIPO-CTA = "A"
                 PERFORM PROCESAR-SORT
              ELSE
              IF WNIVEL = 4 AND NIVEL-CTA NOT = 5
                 PERFORM PROCESAR-SORT.
       PROCESAR-SORT.
           MOVE KEY-CUENTA   TO CUENTA-BCE.
           MOVE NIVEL-CTA    TO NIVEL-BCE.
           MOVE NOMBRE-CTA   TO NOMBRE-BCE.
           MOVE TIPO-CTA     TO TIPO-CTA-BCE.
*********  IF WMES = 12
************* MOVE BALANCE-ACT TO WBALANCE-MES
*********  ELSE
           IF WPOS = "N"
              MOVE BALANCE-ACT TO WBALANCE-MES
           ELSE
           IF WPOS = "S" AND WMES = 12
              MOVE BALANCE-ACT TO WBALANCE-MES
           ELSE
           MOVE TAB-BLCEACT (WMES) TO WBALANCE-MES.
           MOVE WBALANCE-MES TO BALANCE-MES.
           MOVE SIGNO-CTA    TO SIGNO-BCE.
           WRITE REG-BALANCE.
       PANTALLA-IMPRESION.
           MOVE "BALANCE DE COMPROBACION" TO ENCABEZADO-LINK.
           MOVE "Num‚rico" TO ORDEN-LINK.
           COPY "\SISTEMAS\CNT\PANT-004.PRC".
       C000-PROCESO.
           READ BALANCE-COMPROBACION NEXT RECORD WITH NO LOCK
                AT END
                   MOVE "END" TO SW-END
                   PERFORM RUTINA-TOTAL
                NOT AT END
      *QUITAR LAS 4 LINEAS SIGUIENTES.
      *          IF CUENTA-BCE = 3130301 AND BALANCE-MES = ZEROES
      *             MOVE -242861.88 TO BALANCE-MES
      *             MOVE "2" TO SIGNO-BCE
      *          END-IF
                IF BALANCE-MES NOT = ZEROES
                   PERFORM PROCESAR-CAMPOS
                END-IF.
       PROCESAR-CAMPOS.
           MOVE ZEROES TO WDEBITO WCREDITO.
           IF WCUENTAS = "S"
              MOVE CTA1-BCE TO WCTA-01
              MOVE CTA2-BCE TO WCTA-02
              MOVE CTA3-BCE TO WCTA-03
              MOVE WCUENTA  TO CUENTA-DT
              MOVE "CUENTA" TO CUENTA-07
           ELSE
           MOVE SPACES     TO CUENTA-DT CUENTA-07.
           MOVE NIVEL-BCE  TO NIVEL-DT.
           MOVE NOMBRE-BCE TO NOMBRE-DT.

           IF SIGNO-BCE = "1"
              IF BALANCE-MES < ZEROES
                 MOVE BALANCE-MES TO CREDITO-DT WCREDITO
                 MOVE ZEROES TO DEBITO-DT
              ELSE
              MOVE BALANCE-MES TO DEBITO-DT WDEBITO
              MOVE ZEROES TO CREDITO-DT
           ELSE
           IF SIGNO-BCE = "2"
              IF BALANCE-MES < ZEROES
                 MOVE BALANCE-MES TO DEBITO-DT WDEBITO
                 MOVE ZEROES TO CREDITO-DT
              ELSE
              MOVE BALANCE-MES TO CREDITO-DT WCREDITO
              MOVE ZEROES TO DEBITO-DT.

           IF CONT-LINE > 58
              PERFORM ENCABEZADO.
           IF NIVEL-BCE = 1
              WRITE REG-SALIDA FROM LINEA-DT AFTER 2
              WRITE REG-SALIDA AFTER 0
              ADD 2 TO CONT-LINE
              MOVE NIVEL-BCE TO NIVEL-ANT
           ELSE
           IF NIVEL-ANT = NIVEL-BCE
              WRITE REG-SALIDA FROM LINEA-DT AFTER 1
              ADD 1 TO CONT-LINE
           ELSE
           WRITE REG-SALIDA FROM LINEA-DT AFTER 2
           ADD 2 TO CONT-LINE
           MOVE NIVEL-BCE TO NIVEL-ANT.

           IF WNIVEL = 1 OR 4
              IF TIPO-CTA-BCE = "A"
                 ADD WCREDITO TO TTL-CREDITO
                 ADD WDEBITO TO TTL-DEBITO
              ELSE
              NEXT SENTENCE
           ELSE
           IF WNIVEL = 2 OR 3
              ADD WCREDITO TO TTL-CREDITO
              ADD WDEBITO TO TTL-DEBITO.}