unit UCierremescnt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  db, Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, WinSkinData;

type
  TfrmCierremescnt = class(TForm)
    Panel2: TPanel;
    Label4: TLabel;
    BitBtn3: TBitBtn;
    dtpkFechaIni: TDateTimePicker;
    BitBtn1: TBitBtn;
    ScrollBox1: TScrollBox;
    ProgressBar1: TProgressBar;
    SkinData1: TSkinData;
    procedure FormCreate(Sender: TObject);
    procedure dtpkFechaIniChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    procedure CrearCheckbox;
    procedure VerificarDiasPost(diasmes:integer);
    procedure LiberarCheckbox;
    procedure ActCatalogo;
    procedure DiferenciaGyP;// suma balance_act desde cuenta 400 a  6xx
    Procedure ActControles(cta1:String;cta2:String;cta3:String);
    procedure ActBalance;
    procedure qryBceCtamesedit;
    procedure qryBceCtamesinsert;

  public
    { Public declarations }
  end;

var
  frmCierremescnt: TfrmCierremescnt;
  checkbox  : Array[1..31] of TCheckBox;
  tDias,x :Integer;
  diferencia : Real;
  ttl_credito,ttl_debito : Real;
  cuenta_ctrl:String;
  error : Boolean = false;
  
implementation
Uses UGlobal, UDatModControl, UDatModCompania, UDatModCatalogo;
{$R *.dfm}

procedure TfrmCierremescnt.FormCreate(Sender: TObject);
begin
  dmCompania.tblCompania.Close;
  dmCompania.tblCompania.Open;
  if tdias > 0 then
  LiberarCheckbox;
  dmControl.qrycontrolMaster.Close;
  dmControl.qrycontrolMaster.Filtered := False;
  dmControl.qrycontrolMaster.Params[0].Value:=1;//Sistema
  dmControl.qrycontrolMaster.Params[1].Value:=0;//SubSistema
  dmControl.qrycontrolMaster.Params[2].Value:=1;//Cod_cia
  dmControl.qrycontrolMaster.Open;
  dtpkfechaIni.Date:= ExtraerFecha(dmControl.qryControlMasterFECHA_ACT.Value);
  //dmControl.qryControlMaster.Close;
  //dmControl.qryControl.Filtered:=False;
end;

procedure TfrmCierremescnt.dtpkFechaIniChange(Sender: TObject);
var
  dia,mes,anio:word;
begin
  decodedate(dtpkfechaini.Date,anio,mes,dia);
  diasenelmes(anio,mes);
  dtpkfechaini.Date:=EncodeDate(anio,mes,diasenelmes(anio,mes));
end;

procedure TfrmCierremescnt.BitBtn1Click(Sender: TObject);
var
  dia,mes,anio:word;
  dia1,mes1,anio1:word;
  //ExitoDia, ExitoMes, ExitoAnio:Word;
begin
  {DecodeDate(dtpkFechaIni.Date,ExitoDia,ExitoMes,ExitoAnio);
  if (ExitoMes >= 7) And (ExitoAnio >= 2003) then
  begin
    Exit;
  end;}
  ////table1.open;
  dmControl.qryControl.Close;
  dmControl.qryControl.Filtered:=false;
  dmControl.qryControl.Open;

  if Not dmControl.qrycontrol.Locate('sistema;sub_sistema;cod_cia',
  VarArrayOf([1,0,1]), []) then
  MessageDlg('Modulo transacciones contables no encontrado, verifique', mtInformation, [mbOK], 0);

  if dmControl.qryControlstatus.Value = 'R' then
  begin
    MessageDlg('Mes Cerrado, Verifique',mtInformation,[mbOk],0);
    exit;
  end;
  decodedate(dtpkfechaini.Date,anio, mes, dia);
  dtpkfechaini.Date:=encodedate(anio, mes, diasenelmes(anio, mes));
  decodedate(dtpkfechaini.Date, anio, mes, dia);
  if (ExtraerFecha(dtpkfechaini.Date) >= dmCompania.tblCompaniaFECHAI_ACT.Value) And
     (ExtraerFecha(dtpkfechaini.Date) <= dmCompania.tblCompaniaFECHAF_ACT.Value) then
  begin
    tdias:=diasenelmes(anio,mes);
    dtpkfechaini.Date:=encodedate(anio,mes,tdias);
    if tdias >= 0 then
    CrearCheckbox;
    VerificarDiasPost(tdias);
    if error then
    begin
      MessageDlg('Hay dias sin postear, Verifique',mtError,[mbOk],0);
      exit;
    end;
    //verificar temporal
    error := False;
    ActCatalogo;
  end else
  MessageDlg('Fecha difiere del periodo fiscal actual,verifique', mterror, [mbok],0);
  ////table1.Close;
end;

procedure TfrmCierremescnt.ActBalance;
var
  dia,mes,anio:word;
begin
  dmCatalogo.tblqrycatalogo.Filtered:=False;
  dmCatalogo.tblqrycatalogo.First;
  decodedate(dtpkFechaIni.Date,anio,mes,dia);
  PostMessage(ProgressBar1.Handle, $0409, 0, clYellow);
  ProgressBar1.Max := dmCatalogo.tblqrycatalogo.RecordCount;
  ProgressBar1.position:=0;
  While Not dmCatalogo.tblqrycatalogo.Eof Do
  begin
    ProgressBar1.StepIt;
    dmCatalogo.tblqrycatalogo.Edit;
    diasenelmes(anio,mes);
    encodedate(anio,mes,diasenelmes(anio,mes));
    dmCatalogo.tblqrycatalogoFECHA_ACT.Value :=encodedate(anio,mes,diasenelmes(anio,mes));
    if dmCatalogo.qryBceCtames.Locate('CUENTA1_BLC;CUENTA2_BLC;CUENTA3_BLC;STATUS_CIEA',
    VarArrayof([dmCatalogo.tblqrycatalogocuenta1.value,
                dmCatalogo.tblqrycatalogocuenta2.value,
                dmCatalogo.tblqrycatalogocuenta3.value,'A']),[]) then //Antes cierre Año
    begin
      qryBceCtamesEdit;//procedure
    end else
    begin
      qryBceCtamesInsert;//procedure
    end;
    dmCatalogo.tblqrycatalogobalance_ant.Value:=dmCatalogo.tblqrycatalogobalance_act.value;
    dmCatalogo.tblqrycatalogocredito_act.value:=0;
    dmCatalogo.tblqrycatalogodebito_act.value :=0;
    dmCatalogo.tblqrycatalogo.Post;
    dmCatalogo.tblqrycatalogo.ApplyUpdates;
    dmCatalogo.tblqrycatalogo.next;
  end;
  ProgressBar1.position:=0;
  if dmControl.qryControl.filtered then
  begin
    dmControl.qryControl.Edit;
    dmControl.qryControlstatus.Value:='R';
    dmControl.qryControl.Post;
    dmControl.qryControl.ApplyUpdates;
  end;
end;

procedure TfrmCierremescnt.ActCatalogo;
var
  cta1,cta2,cta3:string;
begin
  dmCatalogo.tblqrycatalogo.Close;
  dmCatalogo.tblqrycatalogo.Filtered:=False;
  dmCatalogo.tblqryCatalogo.params[0].Value:=GlbCodigoCia;  
  dmCatalogo.tblqrycatalogo.Open;
  dmCatalogo.qryBceCtames.Close;
  dmCatalogo.qryBceCtames.params[0].Value := ExtraerFecha(dtpkFechaIni.Date);
  dmCatalogo.qryBceCtames.params[1].Value := ExtraerFecha(dtpkFechaIni.Date);
  dmCatalogo.qryBceCtames.Open;
  Caption:='Actualizacion de ganancias y/o perdidas';
  DiferenciaGyP;
  Caption:='Actualizacion de controles';

  {Anterior Sentencia
   ActControles(dm.tCompaniaCTA1_GYP_PERIODO.Value,
               dm.tCompaniaCTA2_GYP_PERIODO.Value,
               dm.tCompaniaCTA3_GYP_PERIODO.Value);}

  {ActControles(dm.tCompaniaCTA1_Resumen_Gyp.Value,
               dm.tCompaniaCTA2_Resumen_Gyp.Value,
               dm.tCompaniaCTA3_Resumen_Gyp.Value);}
  ActControles(dmCompania.tblCompaniaCTA1_GYP_MES.Value,
               dmCompania.tblCompaniaCTA2_GYP_MES.Value,
               dmCompania.tblCompaniaCTA3_GYP_MES.Value);                              
  if Error then
  Exit;
  GlbAsignaCuenta(cuenta_ctrl,cta1,cta2,cta3);
  if cta1 <> '' then
  ActControles(cta1,cta2,cta3)
  else error :=true;
  Caption:='Cierre de mes';
  ActBalance;
  if not dmCatalogo.tblqryCatalogo.Transaction.InTransaction then
  dmCatalogo.tblqryCatalogo.Transaction.StartTransaction;
  try
    dmCatalogo.tblqryCatalogo.Transaction.CommitRetaining;
  except
  dmCatalogo.tblqryCatalogo.Transaction.RollbackRetaining;
  end;
  if not dmCatalogo.qryBceCtames.Transaction.InTransaction then
  dmCatalogo.qryBceCtames.Transaction.StartTransaction;
  try
    dmCatalogo.qryBceCtames.Transaction.CommitRetaining;
  except
  dmCatalogo.qryBceCtames.Transaction.RollbackRetaining;
  end;

  if not dmControl.qryControl.Transaction.InTransaction then
  dmControl.qryControl.Transaction.StartTransaction;
  try
    dmControl.qryControl.Transaction.CommitRetaining;
  except
  dmControl.qryControl.Transaction.RollbackRetaining;
  end;
end;

procedure TfrmCierremescnt.ActControles(cta1, cta2, cta3: String);
begin
  if dmCatalogo.tblqrycatalogo.Locate('cuenta1;cuenta2;cuenta3',VarArrayOf([cta1,cta2,cta3]),[]) then
  begin
    dmCatalogo.tblqrycatalogo.edit;
    if (dmCatalogo.tblqrycatalogonivel_cta.Value > 3 )  then
    begin
      dmCatalogo.tblqrycatalogobalance_act.Value := diferencia;
    end;
    if diferencia  < 0 then
    begin
      dmCatalogo.tblqrycatalogodebito_acm.Value:=dmCatalogo.tblqrycatalogodebito_acm.Value + diferencia;
      dmCatalogo.tblqrycatalogodebito_act.Value:=dmCatalogo.tblqrycatalogodebito_act.Value + diferencia;
    end else
    begin
      dmCatalogo.tblqrycatalogocredito_acm.Value:=dmCatalogo.tblqrycatalogocredito_acm.Value + diferencia;
      dmCatalogo.tblqrycatalogocredito_act.Value:=dmCatalogo.tblqrycatalogocredito_act.Value + diferencia;
    end;
    cuenta_ctrl:=dmCatalogo.tblqrycatalogoCTA_CTRL1.Value +
                 dmCatalogo.tblqrycatalogoCTA_CTRL2.Value +
                 dmCatalogo.tblqrycatalogoCTA_CTRL3.Value;
  end else
  begin
    MessageDlg('cuenta '+cta1+cta2+cta3+' no existe',mterror,[mbok],0);
    error:=true;
  end;
end;

procedure TfrmCierremescnt.CrearCheckbox;
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

procedure TfrmCierremescnt.DiferenciaGyP;
var
  LSerie:Integer;
begin
  PostMessage(ProgressBar1.Handle, $0409, 0, clGreen);
  dmCatalogo.qryCuentas400_700.Close;
  dmCatalogo.qryCuentas400_700.Open;
  dmCatalogo.qryCuentas400_700.First;
  //dmCatalogo.qrycatalogo.Filtered:=false;
  //dmCatalogo.qrycatalogo.Filter:='cuenta1 > '+chr(39)+'399'+chr(39)+' and '+
  //                       'cuenta1 < '+chr(39)+'700'+chr(39)+
  //                       ' AND TIPO_CTA = '+chr(39)+'A'+chr(39);
  //dmCatalogo.qrycatalogo.filtered:=true;
  ttl_credito:=0;
  ttl_debito:=0;
  ProgressBar1.Max := dmCatalogo.qryCuentas400_700.RecordCount;
  ProgressBar1.position:=0;
  LSerie:=0;
  While Not dmCatalogo.qryCuentas400_700.Eof do
  begin
    Inc(LSerie);
    case dmCatalogo.qryCuentas400_700signo_cta.Value of
    1: begin //debito
         if dmCatalogo.qryCuentas400_700balance_act.Value < 0 then
         begin
           ttl_credito:=ttl_credito + Abs(dmCatalogo.qryCuentas400_700balance_act.Value);
           //ignorar //table1
           //table1.Insert;
           //table1serie.value:=lserie;
           //table1cuenta.Value:= dmCatalogo.qryCuentas400_700CUENTA1.Value+
           //dmCatalogo.qryCuentas400_700CUENTA2.Value + dmCatalogo.qryCuentas400_700CUENTA3.Value;
           //table1credito.Value :=Abs(dmCatalogo.qrycatalogobalance_act.Value);
           //table1.Post;
         end else
         begin
           ttl_debito:=ttl_debito + dmCatalogo.qryCuentas400_700balance_act.Value;
           //ignorar //table1
           //table1.insert;
           //table1serie.value:=lserie;
           //table1cuenta.Value:= dmCatalogo.qryCuentas400_700CUENTA1.Value+
           //dmCatalogo.qryCuentas400_700CUENTA2.Value + dmCatalogo.qryCuentas400_700CUENTA3.Value;
           //table1debito.Value :=dmCatalogo.qrycatalogobalance_act.Value;
           //table1.Post;
         end;
       end;
    2: begin //credito
         if dmCatalogo.qryCuentas400_700balance_act.Value < 0 then
         begin
           ttl_debito:=ttl_debito + Abs(dmCatalogo.qryCuentas400_700balance_act.Value);
           //table1.insert;
           //table1serie.value:=lserie;
           //table1cuenta.Value:= dmCatalogo.qryCuentas400_700CUENTA1.Value+
           //dmCatalogo.qryCuentas400_700CUENTA2.Value + dmCatalogo.qryCuentas400_700CUENTA3.Value;
           //table1debito.value  :=Abs(dmCatalogo.qrycatalogobalance_act.Value);
           //table1.Post;
         end else
         begin
           ttl_credito:=ttl_credito + dmCatalogo.qryCuentas400_700balance_act.Value;
           //table1.insert;
           //table1serie.value:=lserie;
           //table1cuenta.Value:= dmCatalogo.qryCuentas400_700CUENTA1.Value +
           //dmCatalogo.qryCuentas400_700CUENTA2.Value + dmCatalogo.qryCuentas400_700CUENTA3.Value;
           //table1credito.Value :=dmCatalogo.qrycatalogobalance_act.Value;
           //table1.Post;
         end;
       end;
    end;
    ProgressBar1.StepIt;
  dmCatalogo.qryCuentas400_700.Next;
  end;//while
  diferencia := ttl_credito - ttl_debito;
  dmCatalogo.qryCuentas400_700.Close;
  //dmCatalogo.qrycatalogo.Filtered := False;
end;

procedure TfrmCierremescnt.LiberarCheckbox;
var
  x: Integer;
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

procedure TfrmCierremescnt.qryBceCtamesedit;
begin
  dmCatalogo.qryBceCtames.edit;
  dmCatalogo.qryBceCtamesDEBITO.Value := dmCatalogo.tblqrycatalogodebito_act.Value;
  dmCatalogo.qryBceCtamesCREDITO.Value:= dmCatalogo.tblqrycatalogocredito_act.Value;
  dmCatalogo.qryBceCtamesBALANCE_ACT.Value:=dmCatalogo.tblqrycatalogoBALANCE_ACT.Value;
  dmCatalogo.qryBceCtamesBALANCE_ANT.Value:=dmCatalogo.tblqrycatalogoBALANCE_ANT.Value;
  dmCatalogo.qryBceCtames.Post;
  dmCatalogo.qryBceCtames.ApplyUpdates;
end;

procedure TfrmCierremescnt.qryBceCtamesinsert;
begin
  dmCatalogo.qryBceCtames.Insert;
  dmCatalogo.qryBceCtamesDEBITO.Value     := dmCatalogo.tblqrycatalogodebito_act.Value;
  dmCatalogo.qryBceCtamesCREDITO.Value    := dmCatalogo.tblqrycatalogocredito_act.Value;
  dmCatalogo.qryBceCtamesBALANCE_ACT.Value:= dmCatalogo.tblqrycatalogoBALANCE_ACT.Value;
  dmCatalogo.qryBceCtamesBALANCE_ANT.Value:= dmCatalogo.tblqrycatalogoBALANCE_ANT.Value;
  dmCatalogo.qryBceCtamesCUENTA1_BLC.Value:= dmCatalogo.tblqrycatalogocuenta1.Value;
  dmCatalogo.qryBceCtamesCUENTA2_BLC.Value:= dmCatalogo.tblqrycatalogocuenta2.Value;
  dmCatalogo.qryBceCtamesCUENTA3_BLC.Value:= dmCatalogo.tblqrycatalogocuenta3.Value;
  dmCatalogo.qryBceCtamesFECHA_BLC.Value  := dmCatalogo.tblqrycatalogoFECHA_ACT.Value;
  dmCatalogo.qryBceCtamesSTATUS_CIEA.Value:= 'A';
  dmCatalogo.qryBceCtamesTIPO_CTA.Value   := dmCatalogo.tblqrycatalogotipo_cta.value;
  dmCatalogo.qryBceCtamesSIGNO_CTA.Value  := dmCatalogo.tblqrycatalogoSIGNO_CTA.AsString;
  dmCatalogo.qryBceCtamesNIVEL_CTA.Value  := dmCatalogo.tblqrycatalogoNIVEL_CTA.Value;
  dmCatalogo.qryBceCtamesFECHA_IN.Value   := Now;
  dmCatalogo.qryBceCtamesIN_POR.Value     := strUserName;
  dmCatalogo.qryBceCtames.Post;
  dmCatalogo.qryBceCtames.ApplyUpdates;
end;

procedure TfrmCierremescnt.VerificarDiasPost(diasmes: integer);
var
  x : Integer;
  anio,mes,dia:word;
begin
  if dmControl.qryControldet.State = dsBrowse then
  begin
    dmControl.qryControldet.First;
    error:=false;
    while not dmControl.qryControldet.eof do
    begin
      decodedate(dmControl.qryControldetfecha_Act.value,anio,mes,dia);
      try
        checkbox[dia].Checked :=true;
      except raise;
      end;
      dmControl.qryControldet.Next;
    end;
    error := false;
    for x:=1 to diasmes  do
    begin
      try
        if checkbox[x].checked = false then
        error := true;
      except raise;
      end;
    end;
  end;
end;

end.
