unit UPostearTransCnt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Grids, DBGrids, RXDBCtrl, StdCtrls, Buttons, RXCtrls,
  ExtCtrls, DB, IBCustomDataSet, IBQuery, IBStoredProc, WinSkinData;

type
  TfrmActBlcecta = class(TForm)
    Panel2: TPanel;
    Label4: TLabel;
    DBStatusLabel1: TDBStatusLabel;
    DBStatusLabel2: TDBStatusLabel;
    BitBtn3: TBitBtn;
    dtpkFechaIni: TDateTimePicker;
    BitBtn1: TBitBtn;
    btnProcesaTrnCierreA: TBitBtn;
    Label1: TLabel;
    ProgressBar1: TProgressBar;
    ProgressBar2: TProgressBar;
    qryTrn: TIBQuery;
    DataSource2: TDataSource;
    qryTrnSERIE: TFloatField;
    qryTrnNUMERO: TIntegerField;
    qryTrnDEBITO_TRN: TFloatField;
    qryTrnCREDITO_TRN: TFloatField;
    qryTrnCUENTA1: TIBStringField;
    qryTrnCUENTA2: TIBStringField;
    qryTrnCUENTA3: TIBStringField;
    qryTrnFECHA: TDateTimeField;
    stpActFechaCatalogo: TIBStoredProc;
    ScrollBox1: TScrollBox;
    RxDBGrid1: TRxDBGrid;
    SkinData1: TSkinData;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure ActBalaceCatalogo;
    procedure ModificaBalance(ctactrl1:string;ctactrl2:string;ctactrl3:string;trndebito:Real;trnCredito:Real);
    procedure CrearCheckbox;
    procedure LiberarCheckbox;
    procedure ActualizaFechabce;
    Procedure ActBalanceMesHist;//solo en post trn cierre anio
    procedure qryBceCtamesedit;
    procedure qryBceCtamesinsert;
    //procedure ObservarDatos(cc1:string;cc2:string;cc3:string);
    Function VerificaSignoCtrl:Boolean;
    //Procedure GuardarRastro(cta1:string;cta2:string;cta3:string;trndebito:Real;trnCredito:Real);
  public
    EsTrnCierreAnio : Boolean;
  end;

var
  frmActBlcecta: TfrmActBlcecta;
  checkbox  : Array[1..31] of TCheckBox;  
  tDias,x  : Integer;
  c1,c2,c3 : string;
  lserie : Integer;
  BalanceActualTemporal : Extended;

implementation

uses UDatModConectar, UDatModCatalogo, UDatModControl,
  UVerificaBlcdbcrtrncnt, UGlobal;

{$R *.dfm}

{ TfrmActBlcecta }

procedure TfrmActBlcecta.ActBalaceCatalogo;
  var
  procede :  boolean;
begin
  qrytrn.First;
  dmCatalogo.qryCatalogo.Close;
  dmCatalogo.qryCatalogo.params[0].Value:=GlbCodigoCia;
  dmCatalogo.qryCatalogo.Open;
  if VerificaSignoCtrl then Exit;
  progressbar1.max:= qrytrn.RecordCount;
  lserie:=0;
  While Not qrytrn.Eof Do
  begin
    if dmControl.qryControldet.Locate('fecha_Act', ExtraerFecha(qrytrnfecha.Value),[]) then
    begin
       procede := false;
     end else procede := true;
     if procede then
     begin
       progressBar2.Position:=0;
       progressBar2.Max:=7;
       ModificaBalance(qryTrnCUENTA1.Value,
                       qryTrnCUENTA2.Value,
                       qryTrnCUENTA3.Value,
                       qrytrnDEBITO_trn.Value,
                       qrytrnCREDITO_trn.Value);
     end;//procede
     progressbar1.StepIt;
     qrytrn.Next;
   end;//end while
   progressbar1.position := 0;
   dmControl.qryControl.Edit;
   dmControl.qryControlFECHA_ACT.Value := ExtraerFecha(dtpkFechaIni.Date);
   dmControl.qryControlFECHA_MOD.Value := Now;
   dmControl.qryControlMOD_POR.Value   := strusername;
   GlbSalvarQuery(dmControl.qryControl);
   if Not dmControl.qryControldet.Locate('fecha_Act',ExtraerFEcha(dmControl.qryControlFECHA_ACT.Value),[]) then
   begin
     dmControl.qryControldet.Insert;
     dmControl.qryControldetFECHA_IN.Value := Now;
     dmControl.qryControldetIN_POR.Value := strUserName;
     dmControl.qryControldetSERIE.Value  := FsqlMaxNumero('Control_Det','serie');
     if dmControl.qryControldetSERIE.Value = 0 then
     dmControl.qryControldetSERIE.Value  :=1;
     dmControl.qryControldetCOD_CIA.Value:=1;
     dmControl.qryControldetSISTEMA.Value:=dmControl.qryControlSISTEMA.Value;
     dmControl.qryControldetSUB_SISTEMA.Value:=dmControl.qryControlSUB_SISTEMA.Value;
     dmControl.qryControldetFECHA_ACT.Value:=dmControl.qryControlFECHA_ACT.Value;
     dmControl.qryControldetFECHA_IN.Value := now;
     dmControl.qryControldetIN_POR.Value := strUserName;
     dmControl.qryControldetSTATUS.value := 'A';
     //dmControl.qryControldet.post;
     //dmControl.qryControldet.ApplyUpdates;
     GlbSalvarQuery(dmControl.qryControldet);
   end;
   ActualizaFechabce;
   if dmCatalogo.qryCatalogo.State = dsInsert then
   Showmessage('Error: Se pretende insertar una cuenta datos en Catalogo, Verifique...');
   if not dmCatalogo.qryCatalogo.Transaction.InTransaction then
   dmCatalogo.qryCatalogo.Transaction.StartTransaction;
   try
     dmCatalogo.qryCatalogo.Transaction.CommitRetaining;
   except
     dmCatalogo.qryCatalogo.Transaction.RollbackRetaining;
   end;
end;

procedure TfrmActBlcecta.ActBalanceMesHist;
begin
  ProgressBar1.Max:= dmCatalogo.qrycatalogo.RecordCount;
  ProgressBar1.Position := 0;
  dmCatalogo.qrycatalogo.First;
  while not dmCatalogo.qrycatalogo.Eof do
  begin
    {if dmCatalogo.qryBceCtames.Locate('CUENTA1_BLC;CUENTA2_BLC;CUENTA3_BLC;STATUS_CIEA',
    VarArrayof([dmCatalogo.qryCatalogocuenta1.value,
              dmCatalogo.qryCatalogocuenta2.value,
              dmCatalogo.qryCatalogocuenta3.value,'D']),[]) then //D =>Despues del Cierre Año
    begin
      qryBceCtamesEdit;
    end else
    begin}
      qryBceCtamesInsert;
    //end;
    ProgressBar1.StepIt;
    dmCatalogo.qrycatalogo.next;
  end;//while
  dmCatalogo.qryBceCtames.ApplyUpdates;
  if Not dmCatalogo.qryBceCtames.Transaction.InTransaction then
  dmCatalogo.qryBceCtames.Transaction.StartTransaction;
  try
    dmCatalogo.qryBceCtames.Transaction.commitRetaining;
  except
  dmCatalogo.qryBceCtames.Transaction.RollbackRetaining;
  end;

  if Not dmCatalogo.qryCatalogo.Transaction.InTransaction then
  dmCatalogo.qryCatalogo.Transaction.StartTransaction;
  try
    dmCatalogo.qryCatalogo.Transaction.CommitRetaining;
  except
    dmCatalogo.qryCatalogo.Transaction.RollbackRetaining;
  end;
  ProgressBar1.Position := 0;
end;

procedure TfrmActBlcecta.ActualizaFechabce;
begin
  progressbar1.Position:=0;
  ProgressBar1.Max := 1;
  stpActFechaCatalogo.Params[0].Value := ExtraerFecha(dtpkFechaIni.DateTime);
  stpActFechaCatalogo.ExecProc;
  progressbar1.StepIt;
  progressbar1.position:=0;
end;

procedure TfrmActBlcecta.BitBtn1Click(Sender: TObject);
var
  fecha:TDatetime;
begin
  {rxCtasAfectadas.close;
  rxCtasAfectadas.open;
  RxDBGrid1.visible:=true;}
  glbfechainicial:= ExtraerFecha(dtpkfechaini.DateTime);

  //dmControl.qrycontrolMaster.Filter:= 'Sistema = 1 and sub_sistema = 0 and cod_cia = 2 ';
  //dmControl.qrycontrolMaster.Filtered:= True;   //Transacciones contables
  if dmControl.qryControlStatus.Value = 'R' then
  begin
    if MessageDlg('Está seguro que quiere iniciar posteo de transacciones contables?', mtWarning,[mbYes,mbNo],0) = mrYes then
    begin
      if dmControl.qrycontrol.Locate('sistema;sub_sistema;cod_cia', VarArrayOf([1, 0, 1]), []) then
      begin
        dmControl.qrycontrol.Edit;
        dmControl.qryControlStatus.Value := 'A';
        dmControl.qrycontrol.Post;
        dmControl.qrycontrol.ApplyUpdates;

        if Not dmControl.qrycontrol.Transaction.InTransaction then
        dmControl.qrycontrol.Transaction.StartTransaction;
        try
          dmControl.qrycontrol.Transaction.CommitRetaining;
        except
        dmControl.qrycontrol.Transaction.RollbackRetaining;
        end;
      end;
    end else Exit;
  end;
  fecha := ExtraerFecha(dmControl.qryControlFECHA_ACT.Value) + 1;
  if ExtraerFecha(fecha) <> ExtraerFecha(dtpkfechaini.Date) then
  begin
    MessageDlg('Fecha incorrecta, Verifique', mtError,[mbOk],0);
    Exit;
  end;
  if frmVeriDbcrtrncnt = Nil then
  frmVeriDbcrtrncnt:=TfrmVeriDbcrtrncnt.Create(Nil);
  try
    frmVeriDbcrtrncnt.Showmodal;
  finally
  frmVeriDbcrtrncnt.Free;
  frmVeriDbcrtrncnt:=Nil;
  end;
  if not GlbProcede then
  exit;
  qrytrn.close;
  qrytrn.params[0].Value :=ExtraerFecha(dtpkFechaIni.Date);
  qrytrn.params[1].Value :=ExtraerFecha(dtpkFechaIni.Date);
  qrytrn.open;
  PostMessage(ProgressBar2.Handle, $0409, 0, clGreen);//cambiar color
  ProgressBar1.Position:=0;
  ProgressBar1.Max := qrytrn.RecordCount;
  CrearCheckbox;
  ActBalaceCatalogo;
  dtpkfechaini.date := dtpkfechaini.date + 1;
  progressbar1.position:=0;
  progressbar2.position:=0;
end;

procedure TfrmActBlcecta.CrearCheckbox;
var
  top,left,x,y:Integer;
begin
  top:=24;
  left:=32;
  y:=0;
  for x:=1 to tDias do
  begin
    checkbox[x]:=TCheckbox.Create(nil);
    checkbox[x].parent:=ScrollBox1;
    checkbox[x].Hint:='Indica si el dia está posteado';
    checkbox[x].Showhint:=true;
    checkBox[x].Caption:=Inttostr(x);
    if (x = 11) or (x = 21) or (x=31) then
    y:=1;
    case x of
    1..10  : begin
               checkbox[x].Top:=top;
               checkbox[x].left:=left*x;
             end;
    11..20 : begin
               checkbox[x].top:=top*2;
               checkbox[x].left:=left*y;
             end;
    21..30 : begin
               checkbox[x].top:=top*3;
               checkbox[x].left:=left*y;
             end;
        31 : begin
               checkbox[x].top:=top*4;
               checkbox[x].left:=left*y;
             end;
    end;
    inc(y);
  end;
end;

procedure TfrmActBlcecta.LiberarCheckbox;
begin
  for x:=1 to tdias do
  begin
    if Assigned(checkbox[x]) then
    begin
      checkbox[x].free;
      checkbox[x]:=nil;
    end;
  end;
end;

procedure TfrmActBlcecta.ModificaBalance(ctactrl1, ctactrl2,
  ctactrl3: string; trndebito, trnCredito: Real);
var
  cta : String;
begin
  //qrytrncuenta1.value,qrytrncuenta2.value,qrytrncuenta3.value
  cta:= ctactrl1+ctactrl2+ctactrl3;
  if (Length(cta) < 7) then exit;
  progressBar2.StepIt;
  if dmCatalogo.qrycatalogo.Locate('cuenta1;cuenta2;cuenta3',
     VarArrayof([ctactrl1,ctactrl2,ctactrl3]),[]) then
  begin
    dmCatalogo.qryCatalogo.Edit;
    if dmCatalogo.qryCatalogoSIGNO_CTA.Value = 1 then //db
    begin
      BalanceActualTemporal:= dmCatalogo.qryCatalogoBALANCE_ACT.Value;
      dmCatalogo.qryCatalogoBALANCE_ACT.Value := dmCatalogo.qryCatalogoBALANCE_ACT.Value +
      trndebito - trnCREDITO;
    end else
    begin
      BalanceActualTemporal:= dmCatalogo.qryCatalogoBALANCE_ACT.Value;
      dmCatalogo.qryCatalogoBALANCE_ACT.Value := dmCatalogo.qryCatalogoBALANCE_ACT.Value +
      trnCREDITO - trndebito;
    end;
    dmCatalogo.qryCatalogoCREDITO_ACT.Value :=dmCatalogo.qryCatalogoCREDITO_ACT.Value + trnCREDITO;
    dmCatalogo.qryCatalogoDEBITO_ACT.Value  :=dmCatalogo.qryCatalogoDEBITO_ACT.Value  + trndebito;
    dmCatalogo.qryCatalogoDEBITO_ACM.value  :=dmCatalogo.qryCatalogoDEBITO_ACM.value  + trndebito;
    dmCatalogo.qryCatalogoCREDITO_ACM.value :=dmCatalogo.qryCatalogoCREDITO_ACM.value + trnCREDITO;
    {GuardarRastro(dmCatalogo.qryCatalogocuenta1.value,
                  dmCatalogo.qryCatalogocuenta2.value,
                  dmCatalogo.qryCatalogocuenta3.value,
                  trndebito,trnCREDITO);}
    c1:='';
    c1 := dmCatalogo.qryCatalogoCTA_CTRL1.Value;
    c2 := dmCatalogo.qryCatalogoCTA_CTRL2.Value;
    c3 := dmCatalogo.qryCatalogoCTA_CTRL3.Value;

    //GuardarRastro(c1,c2,c3,trndebito,trnCREDITO);;
    {if c1 <> '' then
    ObservarDatos(c1,c2,c3);}
    dmCatalogo.qryCatalogo.Post;
    dmCatalogo.qryCatalogo.ApplyUpdates;
    if dmCatalogo.qryCatalogoNIVEL_CTA.Value > 1 then
    ModificaBalance(c1,c2,c3,trndebito,trnCREDITO);
  end else
  begin
    if not EsTrnCierreAnio then
    Messagedlg('Serie: '+qrytrnserie.AsString+' control=> '+qrytrnnumero.AsString
               +'. Cuenta No.' +ctactrl1+ctactrl2+ctactrl3+', no existe, verifique',mterror,[mbok],0);
  end;
end;

procedure TfrmActBlcecta.qryBceCtamesedit;
begin
  dmCatalogo.qryBceCtames.Edit;
  dmCatalogo.qryBceCtamesDEBITO.Value := dmCatalogo.qryCatalogoDEBITO_ACT.Value;
  dmCatalogo.qryBceCtamesCREDITO.Value:= dmCatalogo.qryCatalogoCREDITO_ACT.Value; 
  dmCatalogo.qryBceCtamesBALANCE_ACT.Value:= dmCatalogo.qryCatalogoBALANCE_ACT.Value;
  dmCatalogo.qryBceCtamesBALANCE_ANT.Value:= dmCatalogo.qryCatalogoBALANCE_ANT.Value;
  dmCatalogo.qryBceCtames.Post;
  dmCatalogo.qryBceCtames.ApplyUpdates;
end;

procedure TfrmActBlcecta.qryBceCtamesinsert;
begin
  dmCatalogo.qryBceCtames.Insert;
  dmCatalogo.qryBceCtamesDEBITO.Value      := dmCatalogo.qryCatalogodebito_act.Value;
  dmCatalogo.qryBceCtamesCREDITO.Value     := dmCatalogo.qryCatalogocredito_act.Value;
  dmCatalogo.qryBceCtamesBALANCE_ACT.Value := dmCatalogo.qryCatalogoBALANCE_ACT.Value;
  dmCatalogo.qryBceCtamesBALANCE_ANT.Value := dmCatalogo.qryCatalogoBALANCE_ANT.Value;
  dmCatalogo.qryBceCtamesCUENTA1_BLC.Value := dmCatalogo.qryCatalogocuenta1.Value;
  dmCatalogo.qryBceCtamesCUENTA2_BLC.Value := dmCatalogo.qryCatalogocuenta2.Value;
  dmCatalogo.qryBceCtamesCUENTA3_BLC.Value := dmCatalogo.qryCatalogocuenta3.Value;
  dmCatalogo.qryBceCtamesFECHA_BLC.Value   := dmCatalogo.qryCatalogoFECHA_ACT.Value;
  dmCatalogo.qryBceCtamesstatus_cieA.value := 'D';//Despues del cierre de Anio
  dmCatalogo.qryBceCtamesTIPO_CTA.Value    := dmCatalogo.qryCatalogotipo_cta.value;
  dmCatalogo.qryBceCtamesSIGNO_CTA.Value   := dmCatalogo.qryCatalogoSIGNO_CTA.AsString;
  dmCatalogo.qryBceCtamesNIVEL_CTA.Value   := dmCatalogo.qryCatalogoNIVEL_CTA.Value;
  dmCatalogo.qryBceCtamesFECHA_IN.Value    := Now;
  dmCatalogo.qryBceCtamesIN_POR.Value      := StrUserName;
  dmCatalogo.qryBceCtames.Post;
  //dmCatalogo.qryBceCtames.ApplyUpdates;
end;

function TfrmActBlcecta.VerificaSignoCtrl: Boolean;
begin
  dmCatalogo.qryCatalogo.First;
  Result:= False;
  While not dmCatalogo.qryCatalogo.eof do
  begin
    if (dmCatalogo.qryCatalogoSIGNO_CTA.IsNull) or
       (dmCatalogo.qryCatalogoSIGNO_CTA.Asstring= '') then
    begin
      MessageDlg('Anote la Sigte. Cuenta '+dmCatalogo.qryCatalogocuenta1.Asstring+
      dmCatalogo.qryCatalogocuenta2.Asstring+dmCatalogo.qryCatalogocuenta3.Asstring+'. No tienen signo en catalogo,'+
      ' verifique',mtError,[mbok],0);
      Result:= True;
    end;
    if (dmCatalogo.qryCatalogoTIPO_CTA.Value = 'A') and
       ((dmCatalogo.qryCatalogoCTA_CTRL1.IsNull) Or
        (dmCatalogo.qryCatalogoCTA_CTRL1.Value = '')) then
      begin
        MessageDlg('Anote la Sigte. Cuenta '+dmCatalogo.qryCatalogocuenta1.Asstring+
        dmCatalogo.qryCatalogocuenta2.Asstring+dmCatalogo.qryCatalogocuenta3.Asstring+'. No tienen cta ctrl en catalogo,'+
        ' verifique',mtError,[mbok],0);
        Result:= True;
      end;
    dmCatalogo.qryCatalogo.Next;
  end;
end;

procedure TfrmActBlcecta.FormCreate(Sender: TObject);
begin
  if tdias > 0 then
  LiberarCheckbox;

  dmControl.qrycontrolMaster.Close;
  dmControl.qrycontrolMaster.Filtered := False;
  dmControl.qrycontrolMaster.Params[0].Value:=1;//Sistema
  dmControl.qrycontrolMaster.Params[1].Value:=0;//SubSistema
  dmControl.qrycontrolMaster.Params[2].Value:=1;//Cod_cia
  dmControl.qrycontrolMaster.Open;

  //'sistema         = 1 '+
  //' and sub_sistema = 0 '+
  //' and cod_cia     = 2 ';

  dmControl.qrycontrol.Close;
  dmControl.qrycontrol.Open;
  if Not dmControl.qrycontrol.Locate('sistema;sub_sistema;cod_cia',
  VarArrayOf([1,0,1]), []) then
  MessageDlg('Sistema 1, subSistema 0 y cod_cia 1 no encontrado.', mtInformation, [mbOK], 0);
  dmControl.qryControlSistema.value;dmControl.qryControlDescripcion.Value;
  //dm.qrycontrol.Open;
  //dm.qrycontrol.Filtered:=true; //Transacciones facturas
  dtpkfechaIni.Date:= ExtraerFecha(dmControl.qryControlFECHA_ACT.Value) + 1;
  dtpkfechaIni.Date:= dtpkfechaIni.Date;
  //dmControl.qryControl.Close;
  //dmControl.qrycontrol.Filtered:=False;
end;

end.
