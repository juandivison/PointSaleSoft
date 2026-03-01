unit UGlobalActivos;

interface
Uses Forms,Dbtables, db, Sysutils, windows, Dialogs, Controls,Printers,Classes,
    ShellApi, DateUtils, Messages, Graphics,IniFiles, Variants, IBCustomDataSet,
    IBQuery, IBSQL, ExtCtrls, QuickRpt, QRCtrls,Grids,
    IBDatabase, VCLUnZip, VCLZip, StdCtrls, Registry, OleServer, ExcelXP, comObj, ComCtrls;
 var
    strUserName : String;
    strAppPath  : String;
    dateCurr    : string;
    Size        : DWord;
    StatusGlb   : String = 'A';
    Consulta    : Boolean = True;
    glbTipores  : Integer;
    bolProcGrupo : Boolean;
    glbFechaInicial : TDatetime;
    glbFechaFinal   : TDatetime;
    GLBMostrarArchivo : Boolean;
    glbFechaCierre  : TDate;
    glbFechaCarta   : TDate;
    glbTipoCarta, glbTPag :  Integer;
    glbHoraServicio : String;
    glbAgregado,nada : Boolean;
    glbStatusFactNormal : Boolean;
    glbMoneda       : Smallint;
    glbNombreCta    : String;
    glbCredito      : Real;
    GlbPrueba       : Boolean;
    glbDebito       : Real;
    glbBalanceIni   : Real = 0;
    GlbDif          : Real;
    glbCambioTarifa : Real;
    blCalV: Boolean;//V = calcula valor buscando tarifa
    EsReporte : Boolean = false;
    //cheques
    glbCodBanco         :Integer = 0;
    PideFecha  :Boolean = True;
    GlbCnt     :Boolean;
    GlBCntSistema,
    GlbCntSub_sistema,
    GlbCntCod_cia: Integer;

    Boo_auxiglb:Boolean = False;// Usado en UEstadodeGyp para Label Rep
                               // True = Mensual
                               // False = Acumulado
//Function
Function  Imprime(db,cr:Real;cero:smallint):Boolean;//determina si imprime banda en reporte
Function  FCalcPax(CantPax:Integer):Integer;//determina pax para rango tarifa
//seara 1130401 en cta1=113;cta2=04...
Procedure GlbAsignaCuenta(cuenta:String;var cta1:String;var cta2:String;var cta3:String);
Function VerificarFechaPostCnt(Fecha:TDatetime;FechaFinal:TDatetime): Boolean;
function  InsertarComa(fuente:string):String;
Function  MyStrCopy(Fuente:String;Desde:Integer;Hasta:Integer):String;
Function FBuscarCodServicio(xTipoS:Integer;xTPax:Integer;xCPax:integer;{xScP:Integer;}cError:Smallint):Integer;
procedure GlbSalvarquery(Tabla:TIBQuery;database:TIBDatabase);
procedure GlbSalvarTable(Tabla:TIBDataSet;database:TIBDatabase);
FuncTion DiasEnElMes(anio : Integer; Mes : Integer) : Smallint;
Function ExtraerFecha(Fecha : TDatetime) : TDatetime;
Function ExtraerHora(Hora: TDateTime) : TDatetime;
Function FsqlMaxNumero(tabla:string;campo:string): Integer;
Function sqlConsulta(tabla:string;campo:string;condicion:string;valor:String): Boolean;
Function EsMayorista(Agencia:Integer):Boolean;
Procedure glbTrnPendiente;
Function  CtaExiste(cuenta1:String;cuenta2:String;cuenta3:String;Error:Boolean):Boolean;
Function FCtaTipo(cuenta1:String;cuenta2:String;cuenta3:String;Error:Boolean):Integer;//retorna -> debito o credito
Procedure VerificaValorTrn;
Procedure CalculaTotales(Debito:Real;Credito:Real);
Function FTarifaMayorista(codigo:Integer;fechaservicio:TDateTime;cant:Integer;origen:Integer;destino:integer;error:Boolean):Real;
Function FTarifaBasica(fechaservicio:TDateTime;cant:Integer;origen:Integer;destino:integer;error:Boolean):Real;
Procedure glbNoExiste;//Desplega mensage de no existe en un locate
//Function  FBuscarUltNum(tabla:string): LongInt;
Function FTotalDias(fechaini:TDatetime;fechafin:TDateTime):Integer;


Function GlbVerificaControl(sistema:integer;subsistema:integer;ciakey:Integer;Fecha:TDateTime;var cfecha:tdatetime;cstatus:string):Boolean;
Function GlbPermiteDato(sistema:integer;subsistema:integer;ciakey:Integer;Fecha:TDateTime):Boolean;
procedure ExporToExcel(mTabla : TIBQuery; NombreArchivo : String);

implementation
uses UDatModuloActivos, UDatModConectar;

procedure ExporToExcel(mTabla : TIBQuery; NombreArchivo : String);
const
  xlWBATWorksheet = -4167;

var
  rangoExcel : Variant;
  i, fila : integer;
  mMarcador : Tbookmarkstr;
  AplicacionExcel : Olevariant;
  frm: TForm;
  ProgressBar1: TProgressBar;
  ProgressBar2: TProgressBar;
  targetFile : string;
begin
  rangoExcel:= ExcelXp.xlRange;
  aplicacionExcel := CreateOleObject('Excel.Application');
  aplicacionExcel.Visible:= false;
  aplicacionExcel.workbooks.add(xlWBATWorksheet);
  rangoExcel := aplicacionExcel.ActiveCell;

  frm := TForm.Create(Nil);
  //frm.OnKeyPress := my;
  ProgressBar1:= TProgressBar.Create(Nil);
  ProgressBar2:= TProgressBar.Create(Nil);
  try
  With Frm Do
  begin
    Frm.Color := clCream;
    Frm.Position:= poOwnerFormCenter;
    Frm.BorderStyle := bsNone;
    Caption:= 'Creado en ejecución';
    Height:= 100;
    Width := 800;
    With TLabel.Create(Nil) Do
    begin
      Caption:='Generando reporte...espere.';
      Left:= 8;
      Top:= 8;
      Height:= 25;
      Width:= 200;
      Parent:= Frm;
    end;

    //With TProgressBar.Create(Nil) Do
    //begin
      ProgressBar1.Left:= 8;
      ProgressBar1.Top := 22;
      ProgressBar1.width:= 600;
      ProgressBar1.Max:= mTabla.RecordCount;
      ProgressBar1.StepBy(1);
      ProgressBar1.Position:=0;
      ProgressBar1.Parent:= Frm;

      ProgressBar2.Left:= 8;
      ProgressBar2.Top := 56;
      ProgressBar2.width:= 600;
      ProgressBar2.Max:=  mTabla.Fields.Count;
      ProgressBar2.StepBy(1);
      ProgressBar2.Parent:= Frm;
    //end;

  For i:= 0 To mTabla.Fields.Count - 1 Do
  begin
    rangoExcel.Value := mTabla.Fields[i].DisplayLabel;
    rangoExcel := rangoExcel.Next;
  end;

  mTabla.DisableControls;
  try
    mMarcador := mTabla.Bookmark;
    try
      mTabla.Last;
      ProgressBar1.Max:= mTabla.RecordCount;
      mTabla.First;
      ProgressBar1.Position:= 0;
      ProgressBar1.Step    := 1;
      fila := 2;
      frm.Show;

      While Not mTabla.Eof do
      begin
        //ProgressBar1.StepBy(1);
        rangoExcel := AplicacionExcel.Range['A' + IntToStr(fila), 'A' + IntToStr(fila)];
        ProgressBar2.Position:=0;
        for i := 0 to mTabla.Fields.Count - 1 do
        begin
          rangoExcel.Value := mTabla.Fields[i].AsString;
          rangoExcel := rangoExcel.Next;
          ProgressBar2.StepIt;
          //Application.ProcessMessages;
        end;
        ProgressBar1.StepIt;
        mTabla.Next;
        Inc(fila);
        Application.ProcessMessages;

      end;
      finally
        mTabla.Bookmark := mMarcador;
      end;
    finally
    end;
  end;
  finally
  frm.Hide;
  FreeAndNil(frm);
  end;
  mTabla.EnableControls;

  NombreArchivo:=NombreArchivo +FormatDateTime('ddmmyy_hhmm',Now)+'.xls';
  AplicacionExcel.Workbooks[1].SaveAs(NombreArchivo);

  AplicacionExcel.Quit;
  if GLBMostrarArchivo then
  begin
    if (FileExists(NombreArchivo)) then
    ShellExecute(0,'open',PChar(NombreArchivo), '','',SW_SHOWNORMAL);
    GLBMostrarArchivo:=False;
  end;
  Application.ProcessMessages;
  MessageDlg('Archivo de clientes exportado a excel.#13 '+NombreArchivo, mtInformation,[mbok], 0);
end;

Function  Imprime(db,cr:Real;cero:smallint):Boolean;//determina si imprime banda en reporte
begin
  if Cero = 0 then
  begin
    if ((db <> 0) or (cr <> 0)) then Result := True else Result := False;
  end else
  begin
  if ((db >= 0.0001) or (db < -0.0001)) OR
     ((CR >= 0.0001) or (CR < -0.0001)) THEN
     Result := True else Result := False;
  end;
end;
Function GlbPermiteDato(sistema:integer;subsistema:integer;ciakey:Integer;Fecha:TDateTime):Boolean;
var
  sqlQuery : TIBQuery;
  tFecha :Tdatetime;
  tanio,tmes,tdia:word;
  anio,mes,dia:word;
  Error:Boolean;
begin
  sqlQuery:=TIBQuery.Create(nil);
  sqlQuery.Database := dmCon.IBDatabase1;
  sqlQuery.Sql.Clear;
  sqlQuery.Sql.Text :='Select sistema, fecha_Act, status  '+
  ' From control '+
  ' where sistema = :sistema '+
  ' and sub_sistema = :subsistema '+
  ' and cod_cia = :ciakey';
  sqlQuery.prepare;
  sqlQuery.Params[0].ParamType := ptInput;
  sqlQuery.Params[0].AsInteger    := sistema;
  sqlQuery.Params[1].ParamType := ptInput;
  sqlQuery.Params[1].AsInteger := subsistema;
  sqlQuery.Params[2].ParamType := ptInput;
  sqlQuery.Params[2].AsInteger := ciakey;
  sqlQuery.Open;
  error:=false;
  if sqlQuery.RecordCount = 1 then
  begin
    DecodeDate(sqlquery.fieldbyname('fecha_Act').Value,tanio,tmes,tdia);
    DecodeDate(Fecha,anio,mes,dia);
    Result:=True;
    if (tmes = mes) and (sqlquery.Fieldbyname('Status').Value = 'R') then
    begin
      Messagedlg('Mes Cerrado, verifique',mtError,[mbok],0);
      Error := true;
      Result := False;
    end;
    {temporal if (tmes > mes) then
    begin
      Messagedlg('Mes es menor que el último mes cerrado, verifique',mterror,[mbok],0);
      Result := False;
      Error:=true;
    end;}
    if (DiasEnElMes(tanio,tmes) = tdia) and
       (sqlquery.Fieldbyname('Status').Value = 'R') then
    Begin
      Inc(tmes);
      tdia:=1;
    end;
    if (tmes = mes ) And (tdia > dia) then
    Begin
      Messagedlg('Dia es menor que el último dia posteado, verifique',mterror,[mbok],0);
      Error := True;
    end;
    if (tanio <> anio) and (sistema = 1) and (subsistema = 0) then
    begin
      Result := False;
      Error:=True;
      Messagedlg('Año difiere de período fiscal, verifique',mterror,[mbok],0);
    end;
    dm.qryControlDet.close;
    dm.qryControlDet.filtered:=false;
    dm.qryControlDet.params[0].value := sistema;
    dm.qryControlDet.params[1].value := subsistema;
    dm.qryControlDet.params[2].value := ciakey;
    dm.qryControlDet.open;
    if dm.qryControlDet.Locate('FECHA_ACT',ExtraerFecha(fecha),[]) then
    begin
      Messagedlg('Dia posteado, verifique',mtError,[mbok],0);
      Result := false;
    end else Result := true;
    if Error then
    Result := False;
    dm.qryControlDet.Close;
  end else
  Begin
    Messagedlg('Sistema ='+InttoStr(sistema)+' SubSistema ='+InttoStr(SubSistema)+' Cia'+InttoStr(ciakey)+'no contemplado en Control, verifique',mterror,[mbok],0);
    Result := false;
  end;
  sqlQuery.free;
  sqlQuery:=nil;
end;

Function GlbVerificaControl(sistema:integer;subsistema:integer;ciakey:Integer;Fecha:TDateTime;var cfecha:tdatetime;cstatus:string):Boolean;
var
  sqlQuery : TIBQuery;
  tFecha :Tdatetime;
begin
  sqlQuery:=TIBQuery.Create(nil);
  sqlQuery.Database:= dmcon.IBDatabase1;
  sqlQuery.Sql.Clear;
  sqlQuery.Sql.Text :='Select sistema, fecha_Act, status  '+
  ' From control '+
  ' where sistema = :sistema '+
  ' and sub_sistema = :subsistema '+
  ' and cod_cia = :ciakey';
  sqlQuery.prepare;
  sqlQuery.Params[0].ParamType := ptInput;
  sqlQuery.Params[0].AsInteger    := sistema;
  sqlQuery.Params[1].ParamType := ptInput;
  sqlQuery.Params[1].AsInteger := subsistema;
  sqlQuery.Params[2].ParamType := ptInput;
  sqlQuery.Params[2].AsInteger := ciakey;
  sqlQuery.Open;

  if sqlQuery.RecordCount = 1 then
  begin
    tfecha:=sqlquery.fieldbyname('fecha_Act').Value+1;
    if (sqlquery.fieldbyname('Status').Value = 'F') or
       (tfecha <> Fecha) then Result := False else Result:=True;
    cFecha:= sqlquery.fieldbyname('fecha_Act').Value;
    cStatus:=sqlquery.fieldbyname('Status').Value;
  end else Result := false;
  sqlQuery.free;
  sqlQuery:=nil;
end;

function  InsertarComa(fuente:string):String;
 var
   ContC,x,y,z :Integer;
   auxi  :string;
   Inicia:boolean;
   ControlaSigno:string;
begin
  y:=-1;
  z:=0;
  ContC:=0;
  Fuente:=Trim(fuente);
  z:=Length(fuente);
  if z <= 6 then
  begin
    Result:= fuente;
    exit;
  end;
  z:=0;
  for x:=Length(fuente) downto 1  do
  begin
    if fuente[x] = '.' then
    Inicia := true;
    auxi:=auxi + fuente[x];
    if Inicia then
    y:=0;
    if y = 0 then
    Inc(z) else z:=0;
    if z = 4 then
    begin
      Inc(ContC);
      if x > 1 then
      auxi:= auxi+',';
      if contc > 0   then
      z:=1 else z:=0;
    end;
  end;
  Result:='';
  z:=0;
  for x:=Length(auxi) downto 1 do
  begin
    Inc(z);
    if z = 1 then
    ControlaSigno:= auxi[x];
    if (controlaSigno = '-') and (z = 2) and (auxi[x] = ',') then
    y:=0 else Result:=Result+ auxi[x];
  end;
end;



Function  FCalcPax(CantPax:Integer):Integer;
begin
  case cantPax of
  1..2 :Result:=CantPax;
  3..6 :Result:= 3;
  7..11:Result:= 7;
  else  Result:=12;
  end;
end;

Procedure CalculaTotales(Debito:Real;Credito:Real);
begin
{  if dm.rxTotales.RecordCount = 0 then
  Begin
    dm.rxTotales.Insert;
    dm.rxtotalesdebito.Value:=debito;
    dm.rxtotalesCREDITO.Value:=credito;
    dm.rxTotales.Post;
  end
  else
  begin
    dm.rxTotales.Edit;
    dm.rxtotalesdebito.Value :=dm.rxtotalesdebito.Value + debito;
    dm.rxtotalesCREDITO.Value:=dm.rxtotalescredito.Value + credito;
    dm.rxTotales.Post;
  end;}
end;

Function FTarifaBasica(fechaservicio:TDateTime;cant:Integer;origen:Integer;destino:integer;error:Boolean):Real;
var
  sqlQuery : TIBQuery;
begin
  sqlQuery:=TIBQuery.Create(nil);
  sqlQuery.Database:= dmcon.IBDatabase1;
  sqlQuery.Sql.Clear;
  sqlQuery.Sql.Text :='Select valor_tarifa  '+
  ' from Tarifa_Por_Cantidad'+
  ' where :fecha between fecha_inicial and fecha_finaliza '+
  ' and cantidad_pax = :cantpax '+
  ' and origen_tarifa = :origen and destino_tarifa =:destino';
  sqlQuery.prepare;
  sqlQuery.Params[0].ParamType := ptInput;
  sqlQuery.Params[0].AsDate    := fechaservicio;
  sqlQuery.Params[1].ParamType := ptInput;
  sqlQuery.Params[1].AsInteger := FCalcPax(cant);//determina rango pax para tarifa
  sqlQuery.Params[2].ParamType := ptInput;
  sqlQuery.Params[2].AsInteger := origen;
  sqlQuery.Params[3].ParamType := ptInput;
  sqlQuery.Params[3].AsInteger := destino;
  sqlQuery.Open;
  if sqlQuery.RecordCount = 0 then
  begin
    sqlQuery.close;
    sqlQuery.Params[2].AsInteger := destino;
    sqlQuery.Params[3].AsInteger := origen;
    sqlQuery.Open;
  end;
  if (sqlQuery.RecordCount = 0) and error  then
  MessageDlg('No hay tarifa para esta ruta, verifique',mtError,[mbok],0);
  if sqlQuery.FieldByName('valor_tarifa').IsNull then
  Result:=0 else
  Result:= sqlQuery.FieldByName('Valor_tarifa').Value;
  sqlQuery.close;
  sqlQuery.Unprepare;
  sqlQuery.free;
  sqlQuery:=nil;
end;

Function FTarifaMayorista(codigo:Integer;fechaservicio:TDateTime;cant:Integer;origen:Integer;destino:integer;error:Boolean):Real;
var
  sqlQuery : TIBQuery;
begin
  sqlQuery:=TIBQuery.Create(nil);
  sqlQuery.Database:= dmcon.IBDatabase1;
  sqlQuery.Sql.Clear;
  sqlQuery.Sql.Text :='Select porc_m  '+
  ' from tarifa_mayorista '+
  ' where codigo_cte = :codigocte and '+
  ' :fecha between fecha_inicial and fecha_finaliza '+
  ' and cantidad_pax = :cantpax '+
  ' and origen = :origen and destino =:destino';
  sqlQuery.prepare;
  sqlQuery.Params[0].ParamType := ptInput;
  sqlQuery.Params[0].AsInteger := codigo;
  sqlQuery.Params[1].ParamType := ptInput;
  sqlQuery.Params[1].AsDate    := fechaservicio;
  sqlQuery.Params[2].ParamType := ptInput;
  sqlQuery.Params[2].AsInteger := FCalcPax(cant);//determina rango pax para tarifa
  sqlQuery.Params[3].ParamType := ptInput;
  sqlQuery.Params[3].AsInteger := origen;
  sqlQuery.Params[4].ParamType := ptInput;
  sqlQuery.Params[4].AsInteger := destino;
  sqlQuery.Open;
  if sqlQuery.RecordCount = 0 then
  begin
    sqlQuery.close;
    sqlQuery.Params[3].AsInteger := destino;
    sqlQuery.Params[4].AsInteger := origen;
    sqlQuery.Open;
  end;
  if (sqlQuery.RecordCount = 0) and error  then
  MessageDlg('Mayorista no tiene tarifa para esta ruta, verifique',mtError,[mbok],0);
  if sqlQuery.FieldByName('porc_m').IsNull then
  Result:=0 else
  Result:= sqlQuery.FieldByName('porc_m').Value;
  sqlQuery.close;
  sqlQuery.Unprepare;
  sqlQuery.free;
  sqlQuery:=nil;
end;

Procedure VerificaValorTrn;
var
   strV1,strv2:String;
   strv3:String;
   diferencia : Real;
begin
{  if (dm.qrymastertrncnt.RecordCount > 0 ) and (dm.qryDetTrnCnt.RecordCount > 0 ) then
  begin
    dm.qrydettrncnt.DisableControls;
    dm.qrydettrncnt.first;
    glbCredito:=0;
    glbDebito:=0;
    While Not dm.qrydettrncnt.eof do
    begin
      glbCredito:= glbCredito + dm.qryDetTrnCntCREDITO_TRN.Value;
      glbDebito := glbDebito +  dm.qryDetTrnCntDebito_TRN.Value;
      dm.qrydettrncnt.next;
    end;
    diferencia:= Abs(glbdebito - glbcredito);
    dm.rxtotales.close;
    dm.rxtotales.EmptyTable;
    dm.rxtotales.open;
    strV1:=Format('%8.2f', [glbCredito]);
    strV2:=Format('%8.2f', [glbDebito]);
    dm.rxtotales.insert;
    dm.rxtotalesdebito.value:=StrToFloat(strV1);
    dm.rxtotalescredito.value:=StrToFloat(StrV2);
    dm.rxtotales.post;
    dm.qrydettrncnt.EnableControls;
    GlbProcede:=true;
    if strv1 <> Strv2 then
    begin
      if diferencia > 0.05 then
      begin
        MessageDlg('Transaccion no cuadra verifique',mtError,[mbOk],0);
        GlbProcede:=false;
        GlbEditar := True;
      end;
    end;
    strV3:=Format('%8.2f', [dm.qryMastertrncntMONTO.Value]);
    if (strV1 <> strv3) or
       (strV2 <> strv3) then
    begin
      GlbDif:= StrToFloat(strv1) - StrToFloat(strv3);
      if GlbDif > 0.01 then
      Begin
        GlbProcede:=false;
        GlbEditar := True;
        MessageDlg('Transaccion no cuadra verifique',mtError,[mbOk],0);
      end;
    end;
  end;}

end;

Function CtaExiste(cuenta1:String;cuenta2:String;cuenta3:String;Error:Boolean):Boolean;
var
  sqlQuery : TIBQuery;
begin
  sqlQuery:=TIBQuery.Create(nil);
  sqlQuery.Database:= dmcon.IBDatabase1;
  sqlQuery.Sql.Clear;
  sqlQuery.Sql.Text :='Select nombre_cta '+
  ' from catalogo '+
  ' where cuenta1 = :cuenta1 '+
  ' and   cuenta2 = :cuenta2 '+
  ' and   cuenta3 = :cuenta3 ';
  sqlQuery.prepare;
  sqlQuery.Params[0].ParamType := ptInput;
  sqlQuery.Params[0].AsString  := cuenta1;
  sqlQuery.Params[1].ParamType := ptInput;
  sqlQuery.Params[1].AsString  := cuenta2;
  sqlQuery.Params[2].ParamType := ptInput;
  sqlQuery.Params[2].AsString  := cuenta3;
  sqlQuery.Open;
  if not sqlQuery.FieldByName('nombre_cta').IsNull then
  glbNombreCta:=sqlQuery.FieldByName('nombre_cta').Value;
  if sqlquery.RecordCount > 0 then
  Result := True else
  begin
    Result := False;
    if error then
    MessageDlg('Cuenta '+cuenta1+'-'+cuenta2+'-'+cuenta3+'-'+'no existe',mtError,[mbOk],0);
  end;
  sqlQuery.Close;
  sqlQuery.Free;
  sqlQuery:=Nil;
end;

Function FCtaTipo(cuenta1:String;cuenta2:String;cuenta3:String;Error:Boolean):Integer;
var
  sqlQuery : TIBQuery;
begin
  sqlQuery:=TIBQuery.Create(nil);
  sqlQuery.Database:= dmcon.IBDatabase1;
  sqlQuery.Sql.Clear;
  sqlQuery.Sql.Text :='Select SIGNO_CTA'+
  ' from catalogo '+
  ' where cuenta1 = :cuenta1 '+
  ' and   cuenta2 = :cuenta2 '+
  ' and   cuenta3 = :cuenta3 ';
  sqlQuery.prepare;
  sqlQuery.Params[0].ParamType := ptInput;
  sqlQuery.Params[0].AsString  := cuenta1;
  sqlQuery.Params[1].ParamType := ptInput;
  sqlQuery.Params[1].AsString  := cuenta2;
  sqlQuery.Params[2].ParamType := ptInput;
  sqlQuery.Params[2].AsString  := cuenta3;
  sqlQuery.Open;
  //SIGNO_CTA ----> 1-DEBITO 2-CREDITO
  if sqlquery.RecordCount > 0 then
  Result := sqlQuery.FieldByName('SIGNO_CTA').Value  else
  begin
    Result := 0;
    if error then
    MessageDlg('Cuenta no existe',mtError,[mbOk],0);
  end;
  sqlQuery.Close;
  sqlQuery.Free;
  sqlQuery:=Nil;
end;

Procedure glbTrnPendiente;
begin
  MessageDlg('Hay Una Transación pendiente, verifique',mtWarning,[mbOk],0);
end;

Procedure glbNoExiste;//usada en un locate o find 
begin
  MessageDlg('No existe',mtInformation,[mbOk],0);
end;

Function EsMayorista(Agencia:Integer):Boolean;
var
  sqlQuery : TIBQuery;
begin
  sqlQuery:=TIBQuery.Create(nil);
//  sqlQuery.DatabaseName:= dtmodulo.Database1.DatabaseName;
  sqlQuery.Sql.Clear;
  sqlQuery.Sql.Text :='Select codigo_pago '+
  ' from clientes, pagocliente '+
  ' where codigo_cte = :agencia '+
  ' and codigo_pago  = codigo '+
  ' and codigo in (3,4) ';
  sqlQuery.prepare;
  sqlQuery.Params[0].ParamType := ptInput;
  sqlQuery.Params[0].AsInteger :=Agencia;
  sqlQuery.Open;
  if sqlquery.RecordCount > 0 then
  Result := True else Result := False;
  sqlQuery.Close;
  sqlQuery.Free;
  sqlQuery:=Nil;
end;

FuncTion DiasEnElMes(anio : Integer; Mes : Integer):Smallint;
var
  a : string;
begin
  Result := MonthDays[IsLeapYear(anio), mes];
  a:='string';
end;

Function sqlConsulta(tabla:string;campo:string;condicion:string;valor:String): Boolean;
var
  qry : TIBQuery;
begin
//  FillChar(valor, SizeOf(valor), ' ');
  qry := TIBQuery.create(nil);
  //qry.DatabaseName:= dm.dbDatos.DatabaseName;
  qry.Database:= dmcon.IBDatabase1;
  qry.sql.Clear;
  qry.SQL.Text :='Select '+campo+' from '+tabla+' where '+campo+' '+condicion+' '+chr(39)+valor+chr(39);
  qry.open;

  If qry.RecordCount > 0 then
  begin
    if Uppercase(tabla) = 'CATALOGO' THEN
    glbNombreCta:= qry.fieldbyname('nombre_cta').Value;
    Result := true
  end
  else Result := false;
  qry.Close;
  qry.free;
end;

Function ExtraerFecha(Fecha : TDatetime) : TDatetime;
begin
  //Result := StrToDate(FormatDatetime('yyyy-mm-dd', fecha));
  Result := StrToDate(FormatDatetime(ShortDateFormat, fecha));
end;

Function ExtraerHora(Hora: TDatetime) : TDateTime;
begin
  Result := StrToTime(FormatDatetime('hh:mm:ss',hora));
end;

Function FsqlMaxNumero(tabla:string;campo:string): Integer;
var
  qryMax : TIBQuery;
begin
  qryMax := TIBQuery.create(nil);
  qryMax.Database := dmcon.IBDatabase1;
  
  qryMax.sql.Clear;
  qryMax.SQL.Text:='Select max('+campo+') NumMax'+' from '+tabla;
  qryMax.open;
  Result := qryMax.fieldbyname('NumMax').AsInteger + 1;
  qryMax.Close;
  qryMax.Free;
end;

procedure GlbSalvarQuery(Tabla:TIBQuery;database:TIBDatabase);
begin
  if tabla.State in [dsEdit,dsInsert] then
  begin
    if not tabla.Transaction.InTransaction then
    tabla.Transaction.StartTransaction;
    tabla.Post;
    if  tabla.UpdatesPending then
    begin
      tabla.applyupdates;
    end;
    try
      tabla.Transaction.CommitRetaining;
    except
      tabla.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure GlbSalvarTable(Tabla:TIBDataSet;database:TIBDatabase);
begin
  if tabla.State in [dsEdit,dsInsert] then
  begin
    if not tabla.Transaction.InTransaction then
    tabla.Transaction.StartTransaction;
    tabla.Post;
    if  tabla.UpdatesPending then
    begin
      tabla.applyupdates;
    end;
    try
      tabla.Transaction.CommitRetaining;
    except
      tabla.Transaction.RollbackRetaining;
    end;
  end;
end;

Function FBuscarCodServicio(xTipoS:Integer;xTPax:Integer;xCPax:integer;{xScP:Integer;}cError:Smallint):Integer;
var
  sqlQuery : TIBQuery;
begin
//  QryGenerico(strSql : String);
  sqlQuery:=TIBQuery.Create(nil);
  sqlQuery.Database := dmcon.IBDatabase1;
  sqlQuery.sql.Clear;
  sqlQuery.sql.Text :=
  'Select codigo From  ' +
  'servicios ' +
  'where TIPOSERVI = :TipoS and '+
  'TIPOPAX =:TipoP and CLASEPAXS =:ClaseP '{ +
  'and SUBCLASEPAX =:SupClaP'};
  sqlQuery.prepare;
  sqlQuery.Params[0].ParamType := ptInput;
  sqlQuery.Params[0].AsInteger :=xTipoS;

  sqlQuery.Params[1].ParamType := ptInput;
  sqlQuery.Params[1].AsInteger := xTPax;
  sqlQuery.Params[2].ParamType := ptInput;
  sqlQuery.Params[2].AsInteger := xCPax;

{  sqlQuery.Params[3].ParamType := ptInput;
  sqlQuery.Params[3].AsInteger := xScP;}

  sqlQuery.open;
  if sqlQuery.RecordCount = 1 then
  Result := sqlQuery.fieldbyname('codigo').Value
  else
  Begin
    Result := 0;
    if cError = 1 then
    MessageDlg('Servicio no ha sido registrado.'#13'Contacte al encargado...',mtWarning,[mbOk],0);
  end;
  sqlQuery.Close;
  sqlQuery.Free;
  sqlQuery:=Nil;
end;

Function  MyStrCopy(Fuente:String;Desde:Integer;Hasta:Integer):String;
var x :Integer;
begin
  Result:='';
  for x:=1 to Length(Fuente) do
  begin
    if Desde <= Hasta then
    begin
      Result:=Result + fuente[Desde];
      Inc(Desde);
    end else exit;
  end;
end;

Procedure GlbAsignaCuenta(cuenta:String;var cta1:String;var cta2:String;var cta3:String);
begin
  cta1:=MyStrCopy(cuenta,1,3);
  cta2:=MyStrCopy(cuenta,4,5);
  cta3:=MyStrCopy(cuenta,6,7);
end;

{
Function  FBuscarUltNum(tabla:string): LongInt;
const ntMaxTries = 100;
var
LastNumberTbl: TIBTable;
     DataSetN: TDatasource;
I,WaitCount,Tries: Integer;
RecordLocked: Boolean;
ErrorMsg: String;
begin
  LastNumberTbl:=TIBTable.Create(nil);
  //LastNumberTbl.DatabaseName:=dm.dbDatos.DatabaseName;
  LastNumberTbl.Database := dmcon.IBDatabase1;
  LastNumberTbl.TableName :=tabla;
  //Lastnumbertbl.SessionName:='Default';
  DataSetN:=TDatasource.create(nil);
  DataSetN.DataSet:=LastNumberTbl;
  LastNumberTbl.open;
  Tries := 0;
  With LastNumberTbl do
    begin
      {Make sure the table contains a record. If not, add
      one and set the first field to zero.}
{      if RecordCount = 0 then
         begin
           Insert;
           Fields[0].AsInteger := 0;
           Post;
         end; //if
         }
      {Try to put the table that holds the last used
      number into edit mode. If calling Edit raises
      an exception wait a random period and try again.}
{      Randomize;
      While Tries < ntMaxTries do
        try
        Inc(Tries);
        Edit;
        Break;
        except
        on E: IDBApplication do
        {The call to Edit failed because the record
        could not be locked.}
  //      begin
           {See if the lock failed because the record is locked by
           another user.}
 {          RecordLocked := False;
           for I := 0 to Pred(E.ErrorCount) do
           if E.Errors[I].ErrorCode = 10241 then RecordLocked := True;
           if RecordLocked then
              begin
                {Wait for a random period and try again.}
 {               WaitCount := Random(20);
                for I := 1 to WaitCount do
                Application.ProcessMessages;
                Continue;
                end else
                   begin
                     {The record lock failed for some reason other than another
                     user has the record locked. Display the BDE error stack
                     and exit.}
 {                    ErrorMsg := '';
                     for I := 0 to Pred(E.ErrorCount) do
                     ErrorMsg := ErrorMsg + E.Errors[I].Message +
                     ' (' + IntToStr(E.Errors[I].ErrorCode) + '). ';
                     MessageDlg(ErrorMsg, mtError, [mbOK], 0);
                     Exit;
           end; //if
        end;
        end; {try}
 {     if State = dsEdit then
         begin
           Result := Fields[0].AsInteger + 1;
           Fields[0].AsInteger := Result;
           Post;
         End
      Else
  Raise Exception.Create('Imposible asignar número único.(FBuscarUltNum)');
  end;
  LastNumberTbl.Free;
  LastNumberTbl:=Nil;
  DataSetN.Free;
  DataSetN:=Nil;
end;    }

Function FTotalDias(fechaini:TDatetime;fechafin:TDateTime):Integer;
var
   anio1,mes1,dia1:Word;
   anio2,mes2,dia2:Word;
begin
  if (fechaini = fechafin) then
     Result:=0
  else
  begin
    DecodeDate(fechaini,anio1,mes1,dia1);
    DecodeDate(fechafin,anio2,mes2,dia2);
    if mes2 <> mes1 then
    begin
      MessageDlg('Imposible procesar meses diferentes,verifique',mtError,[mbOk],0);
      result:=0;
      exit;
    end;
    if anio1 <> anio2 then
    begin
      MessageDlg('Año Inicial difiere de año final',mtError,[mbOk],0);
      result:=0;
      exit;
    end;
    if dia2 < dia1  then
    begin
      MessageDlg('Dia final no puede ser menor',mtError,[mbOk],0);
      result:=0;
      exit;
    end;
    Result:=dia2 - dia1+1;
  end;
end;

function VerificarFechaPostCnt(Fecha:TDatetime;FechaFinal:TDatetime): Boolean;
begin
  dm.qryControl.close;          // Transacciones contables
  dm.qrycontrol.Filter:=' sistema         = 1 '+
                        ' and sub_sistema = 0 '+
                        ' and cod_cia     = 2 ';
  dm.qrycontrol.Open;
  dm.qrycontrol.Filtered := True; //Transacciones facturas
  if  (ExtraerFecha(Fecha) <=
      ExtraerFecha(dm.qryControlFECHA_ACT.Value)) Or
      ( ExtraerFecha(FechaFinal) >=
       ExtraerFecha(dm.qryControlFECHA_ACT.Value)) Then
  Result := True else Result := False;
  dm.qryControl.Close;
  dm.qrycontrol.Filtered := False;
end;

Begin
  Size := 128;
  SetLength ( strUsername, Size);
  GetUserName (Pchar(strUserName),size);
  dateCurr:=FormatDatetime('yyyy-mm-dd',date);
  //GlbProcede:=false;
end.

{procedure TForm1.Button1Click(Sender: TObject);

var

    XD,YD:Integer;

begin

    XD:=GetDeviceCaps(Printer.Handle,LogPixelSX); // pixels/inch horizontales 

    YD:=GetDeviceCaps(Printer.Handle,LogPixelSY); // pixels/inch verticales 

    with Printer,Printer.Canvas do begin

      Title:='Test de Impresión';

      BeginDoc;

      try

       // Una línea diagonal atraves del papel 

        MoveTo(PageWidth,0);LineTo(0,PageHeight);

        MoveTo(0,0);LineTo(XD,YD);

      finally

        EndDoc;

      end;

    end;

end;}

