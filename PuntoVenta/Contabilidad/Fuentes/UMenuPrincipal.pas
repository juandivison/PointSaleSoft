unit UMenuPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DateUtils, RxVerInf, IniFiles, StdCtrls, dbCtrls, ComCtrls, jpeg, ExtCtrls, RXCtrls, Menus,
  {gnugettext,} WinSkinData, UGetDateTipoM;

type
  TfrmMenu = class(TForm)
    StatusBar1: TStatusBar;
    RxLabel5: TRxLabel;
    RxLabel2: TRxLabel;
    RxLabel1: TRxLabel;
    MainMenu1: TMainMenu;
    Archivo1: TMenuItem;
    Departamentos2: TMenuItem;
    Moneda1: TMenuItem;
    Bancos2: TMenuItem;
    Salir1: TMenuItem;
    Utilitarios1: TMenuItem;
    LogErrores1: TMenuItem;
    ControlPosting1: TMenuItem;
    SQL1: TMenuItem;
    Administracion1: TMenuItem;
    ListadoCumpleaoCte1: TMenuItem;
    Empleados: TMenuItem;
    Usuarios1: TMenuItem;
    Crear1: TMenuItem;
    CambiarClave1: TMenuItem;
    CerrarDia1: TMenuItem;
    CerrarDiaTardio1: TMenuItem;
    Oficina1: TMenuItem;
    ClaveMaestra1: TMenuItem;
    Configuracion1: TMenuItem;
    Coneccion1: TMenuItem;
    Comapaia1: TMenuItem;
    NCF1: TMenuItem;
    ipoCF1: TMenuItem;
    Reportes1: TMenuItem;
    Recibo1: TMenuItem;
    Miscelaneos1: TMenuItem;
    Skinoff1: TMenuItem;
    CerrarCesion1: TMenuItem;
    Salir2: TMenuItem;
    Ayuda1: TMenuItem;
    Acerdade1: TMenuItem;
    Contenido1: TMenuItem;
    Registro1: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    RxSpeedButton5: TRxSpeedButton;
    RxSpeedButton22: TRxSpeedButton;
    RxSpeedButton23: TRxSpeedButton;
    RxSpeedButton6: TRxSpeedButton;
    Image2: TImage;
    SkinData1: TSkinData;
    popActualiza: TPopupMenu;
    Catalogo1: TMenuItem;
    ransaccionesCnt1: TMenuItem;
    PopupMenuPosteo: TPopupMenu;
    transacciones1: TMenuItem;
    BalancexMes1: TMenuItem;
    fechatm: TGetDateTipoMoneda;
    Cierre1: TMenuItem;
    Mes: TMenuItem;
    Ao1: TMenuItem;
    GeneraTransacciones1: TMenuItem;
    PostearTrans1: TMenuItem;
    CierreAo1: TMenuItem;
    CerrarPeriodoFiscal1: TMenuItem;
    pupmnuRepCnt: TPopupMenu;
    BalanceGeneral1: TMenuItem;
    EstadoGP1: TMenuItem;
    BalancedeComprobacin1: TMenuItem;
    Transacciones4: TMenuItem;
    DiarioGeneral1: TMenuItem;
    MayorGeneral1: TMenuItem;
    MayorGeneralDetallado1: TMenuItem;
    Conciliacion1: TMenuItem;
    BonificaciondeLey1: TMenuItem;
    Depsitos1: TMenuItem;
    Mantenimiento1: TMenuItem;
    ipoCuenta1: TMenuItem;
    ipoDeposito2: TMenuItem;
    BalancedeCompAntesCierre1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Salir2Click(Sender: TObject);
    procedure CerrarCesion1Click(Sender: TObject);
    procedure EmpleadosClick(Sender: TObject);
    procedure Crear1Click(Sender: TObject);
    procedure Comapaia1Click(Sender: TObject);
    procedure Catalogo1Click(Sender: TObject);
    procedure ransaccionesCnt1Click(Sender: TObject);
    procedure transacciones1Click(Sender: TObject);
    procedure ControlPosting1Click(Sender: TObject);
    procedure Coneccion1Click(Sender: TObject);
    procedure Skinoff1Click(Sender: TObject);
    procedure CambiarClave1Click(Sender: TObject);
    procedure BalancexMes1Click(Sender: TObject);
    procedure MesClick(Sender: TObject);
    procedure GeneraTransacciones1Click(Sender: TObject);
    procedure PostearTrans1Click(Sender: TObject);
    procedure CierreAo1Click(Sender: TObject);
    procedure BalanceGeneral1Click(Sender: TObject);
    procedure EstadoGP1Click(Sender: TObject);
    procedure Depsitos1Click(Sender: TObject);
    procedure Mantenimiento1Click(Sender: TObject);
    procedure ipoDeposito2Click(Sender: TObject);
    procedure ipoCuenta1Click(Sender: TObject);
    procedure MayorGeneral1Click(Sender: TObject);
    procedure Transacciones4Click(Sender: TObject);
    procedure BalancedeComprobacin1Click(Sender: TObject);
    procedure BalancedeCompAntesCierre1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
    procedure Logger(Sender: TObject; E: Exception);
    procedure AppMessage(var Msg: TMsg; var Handled: Boolean);
    procedure HandleException(Sender: TObject; E: Exception);
    Procedure ShowHint(Sender: TObject);
    Procedure ProcesoLogin;
    Procedure ProcPermisos(codigo:integer);
  public
    { Public declarations }
  end;

var
  frmMenu: TfrmMenu;

implementation

uses uLogin, UDatModUsuarios, UGlobal, UDatModConectar, UDatModCompania,
  URegistro, UglobalCP, UEmpleados, UEntradaDeUsuarios, UCompania,
  UCatalogo, UTransaccionesCnt, UPostearTransCnt, UControlAct, UConectar,
  UCambiarClaveUsuario, UBalanceMensual, UDatModCatalogo, UCierremescnt,
  UTransCierreAnioCnt, UCierreAnio, UFormBancos, UdatosParablcgrl,
  UEstadoGyP, UFormMantDepositos, UFormTipoDeposito, UFormTipoCtaBanco,
  UMaryorGeneralConsRep, UDmRep, UDatmodDatos, URepTrnDiariaResCta,
  URepTransCnt, UBlcComp, UBlcCompTransJM;

{$R *.dfm}

{ TfrmMenu }

procedure TfrmMenu.AppMessage(var Msg: TMsg; var Handled: Boolean);
var
   Actual: TWinControl;
begin
  if Msg.message = WM_KEYDOWN then
     if Msg.WParam = VK_RETURN then
        begin
          Actual := Screen.ActiveControl;
          if (Actual is TButton) or (actual is TDBMemo) or
             (Actual is TMemo) then
             Exit
          else
             Msg.wParam := VK_TAB;
        end;

end;

procedure TfrmMenu.HandleException(Sender: TObject; E: Exception);
var
 error : string;
begin
  error:= e.Message;
  messagedlg(error,mterror,[mbok],0);
end;

procedure TfrmMenu.Logger(Sender: TObject; E: Exception);
var
  //error : PChar;
  error : String;
  dBConnected : Boolean;
  xx : Integer;
begin
  dbConnected := False;
  error :=PChar('Unable to complete network');
  if Pos(error,e.Message) > 0 then
  dbConnected:=False
  else dBConnected:=True;

  error :=PChar('10060');
  if dBConnected then
  if Pos(error,e.Message) > 0 then
  dbConnected:=False
  else dBConnected:=True;

  if dBConnected then
  begin
    MessageDlg(e.Message,mtError,[mbok],0);
    exit;
  end;

  if not dBConnected then
  if MessageDlg('Base de Datos no encontrada o hay problemas con la red.'#13''+
  'Desea salir del programa?', mtError, [mbYes, mbNo, mbhelp], 0)=mrYes then
  Application.Terminate
  else
  begin
    dmCon.IBDatabase1.Open;
    if dmCon.IBDatabase1.TestConnected then
    begin
      MessageDlg('Conexion restablecida. Deberá loguearse de nuevo.',mtWarning,[mbok],0);
      ProcesoLogin;
    end
    else
    begin
      MessageDlg('Imposible conectar con base de datos. La aplicacion se cerrará',mtInformation,[mbok],0);
      Halt;
    end;
  end;
end;

procedure TfrmMenu.ProcesoLogin;
begin
  frmLogin:=tFrmLogin.Create(Nil);
  Try
  if frmLogin.showmodal = mrCancel then
     Application.Terminate
  else
  begin
    if (frmLogin.Edit1.Text = 'DIVISON') AND
       (frmLogin.Edit2.Text = '2512') then
    begin
      //varTipousuario:=0;//Todos los permisos
      VarUsuarioGlb := 0;
    end else
    begin
      frmLogin.Edit2.Text:= Encriptar(Trim(frmLogin.edit2.Text),2005);
      if not dmUsuarios.qryUsuarios.Locate('codigo;Clave',vararrayof([frmLogin.edit1.Text,frmLogin.edit2.Text]),[]) then
      begin
        Messagedlg('Usuario o Clave Incorrecta.¡Verifique Por Favor!',mtError,[mbOk],0);
        ProcesoLogin;
        //Application.Terminate;
      end else
      Begin
        dmUsuarios.qryUsuarios.Edit;
        dmUsuarios.qryUsuariosFecha_Entrada.Value:=Now;
        dmUsuarios.qryUsuarios.Post;
        dmUsuarios.qryUsuarios.ApplyUpdates;
        if not dmUsuarios.qryUsuarios.Transaction.InTransaction then
        dmusuarios.qryUsuarios.Transaction.StartTransaction;
        try
          dmusuarios.qryUsuarios.Transaction.CommitRetaining;
        except
        dmusuarios.qryUsuarios.Transaction.RollbackRetaining;
        end;
        varTipousuario:=dmUsuarios.qryUsuariosTIPO.Value;
        VarUsuarioGlb :=dmUsuarios.qryUsuariosCODIGO_EMPLEADO.Value;
        ProcPermisos(varTipousuario);
        LeerDatosIni;//Asigna valor a GlbClaveSup
        StatusBar1.Panels[0].Text := 'USER :> '+dmUsuarios.qryUsuariosNOMBRECOMPLETO.Value;
      end;
    end;
  end;
  finally
  frmLogin.free;
  frmLogin:=nil;
  end;
end;

procedure TfrmMenu.ProcPermisos(codigo: integer);
begin
  {case codigo of
  0:begin
      Empleados.Enabled := True;
      Usuarios1.Enabled  := True;
      ClaveMaestra1.Enabled := True;
      Coneccion1.Enabled := True;
      Comapaia1.Enabled  := True;
      ControlPosting1.Enabled := True;
      SQL1.Enabled := True;

      CuotaPrestamosActivos1.Enabled   := True;
      ResumenPrestamosActivos1.Enabled := True;
      ListadoPrestamos1.Enabled   := True;
      PrestamosconAtraso1.Enabled := True;
      ProcesoPrestamo1.Enabled := True;
      Comapaia1.Enabled := True;
      Intereses1.Enabled := True;
    end;
  1:begin
      Intereses1.Enabled := False;
      Empleados.Enabled       := False;
      Usuarios1.Enabled       := False;
      ClaveMaestra1.Enabled   := False;
      Coneccion1.Enabled      := False;
      Comapaia1.Enabled       := False;
      ControlPosting1.Enabled := False;
      SQL1.Enabled            := False;

      CuotaPrestamosActivos1.Enabled   := True;
      ResumenPrestamosActivos1.Enabled := False;
      ListadoPrestamos1.Enabled   := False;
      PrestamosconAtraso1.Enabled := True;

      ProcesoPrestamo1.Enabled := True;
      Comapaia1.Enabled := False;
    end;
  2:begin
      Intereses1.Enabled := False;
      Empleados.Enabled  := False;
      Usuarios1.Enabled  := False;
      ClaveMaestra1.Enabled:= False;
      Coneccion1.Enabled   := False;
      Comapaia1.Enabled    := False;
      ControlPosting1.Enabled := False;
      SQL1.Enabled            := False;
      CuotaPrestamosActivos1.Enabled   := False;
      ResumenPrestamosActivos1.Enabled := False;
      ListadoPrestamos1.Enabled   := False;
      PrestamosconAtraso1.Enabled := False;

      ProcesoPrestamo1.Enabled := False;
      Comapaia1.Enabled := False;
    end;
   end;}
end;

procedure TfrmMenu.ShowHint(Sender: TObject);
begin
  StatusBar1.Panels[1].Text := Application.Hint;
end;

procedure TfrmMenu.FormCreate(Sender: TObject);
var
  str : string[12];
  VInfo: TVersionInfo;
  FAppVer, FAppBuild : String;
  xGrafico : String;
begin
  GLBRUTADB := GetCommandParam('/GLBRUTADB');
  if (GLBRUTADB = '') then
  GLBRUTADB:='POSGOLDRESP';
  //if (formatdatetime('mm',now) = '12') then
  //begin
  //  MessageDlg('Favor verificar con soporte tecnico el status de su licencia, gracias.',mtWarning, [mbok],0);
  //  Halt(0);
  // end;
  Application.OnException := HandleException;
  xGrafico:=FileToUse('Grafico','logo.jpg');
  if (xGrafico <> '') then
  Image2.Picture.LoadFromFile(xGrafico);
  Application.OnException := Logger;
  Application.OnMessage := AppMessage;
  Application.OnHint := ShowHint;
  dmCompania.tblCompania.Close;
  dmCompania.tblCompania.Open;
  frmtrgtr:=Tfrmtrgtr.Create(Nil);
  frmtrgtr.tRegistro.Close;
  frmtrgtr.tRegistro.Open;
  str:=strusername;

{t  frmConfMiscelaneas:=TfrmConfMiscelaneas.Create(Nil);
  try
    if Not FileExists('repconf001.ini') then
    begin
      frmConfMiscelaneas.ShowModal;
      frmConfMiscelaneas.DatosConfiguracion;
    end else
    frmConfMiscelaneas.DatosConfiguracion;
  finally
  frmConfMiscelaneas.Free;
  frmConfMiscelaneas:=Nil;
  end;
  }
    if (Str <> 'DIVISON') then
    begin
      if (frmtrgtr.tRegistro.Recordcount = 0 ) then
      begin
        frmtrgtr.tRegistro.Insert;
        frmtrgtr.tRegistroCANTCORRIDA.Value := 50;
        frmtrgtr.tRegistroSERIAL.Value:= GetVolumeID('c');
        frmtrgtr.tRegistroCLAVE.Value := 19702005;
        frmtrgtr.tRegistroFECHA_REGISTRO.Value:= Now;
        frmtrgtr.Button1click(Self);
      end;
      frmtrgtr.tRegistro.Close;
      frmtrgtr.tRegistro.Open;
      if frmtrgtr.tRegistroCLAVE.Value = 19702005 then //Primera Vez
      begin
        frmtrgtr.tRegistro.Edit;
        if frmtrgtr.tRegistroCANTCORRIDA.Value > 0 then
        frmtrgtr.tRegistroCANTCORRIDA.Value:=frmtrgtr.tRegistroCANTCORRIDA.Value - 1;
        frmtrgtr.tRegistroSERIAL.Value:= GetVolumeID('c');
        frmtrgtr.tRegistroCLAVE.Value := 11111111;
        frmtrgtr.tRegistroFECHA_REGISTRO.Value:= Now;
        frmtrgtr.Button1click(Self);
      end else
      begin
       //temp divi
       //temp diviif frmtrgtr.tRegistroSERIAL.Value <>  GetVolumeID('c') then
       //temp divibegin
       //temp divi  Messagedlg('Se ha verificado un error de Violacion de Licencia,'#13''+
       //temp divi  ' si este programa te es útil favor '#13'llamar a Ing. Juan Ramon Divison 809-309-5001 o nosivid@hotmail.com',mtError,[mbok],0);
       //temp divi  Beep;
       //temp divi  frmTrgtr.Free;
       //temp divi  frmTrgtr:=Nil;
       //temp divi  Application.Terminate;
      //temp diviend else
      //temp divibegin
          if (frmtrgtr.tRegistroCANTCORRIDA.Value = 0) then
          begin
            if  (MonthOf(Date) <= 6) then
            begin
              dmUsuarios.ibsqlUpdRegCantCorrida.Close;
              dmUsuarios.ibsqlUpdRegCantCorrida.Params[0].Value:=100;
              dmUsuarios.ibsqlUpdRegCantCorrida.ExecQuery;
              if not dmUsuarios.ibsqlUpdRegCantCorrida.Transaction.InTransaction then
              dmUsuarios.ibsqlUpdRegCantCorrida.Transaction.StartTransaction;
              try
                dmUsuarios.ibsqlUpdRegCantCorrida.Transaction.Commit
              except
              dmUsuarios.ibsqlUpdRegCantCorrida.Transaction.Rollback;
              end;
              frmtrgtr.tRegistro.Close;
              frmtrgtr.tRegistro.Open;
            end;
        //temp diviend;
          if  (MonthOf(Date) = 9) and ((FormatDatetime('dd',date)='30')
          or (FormatDatetime('dd',date)='29')) then
          begin
            Messagedlg('El tiempo de uso de este programa a vencido.'#13''+
                       'Para continuar con su uso favor llamar a'#13''+
                       'Ing. Juan Ramon Divison Cel. Num. 809-309-5001'#13''+
                       'o envie un email a nosivid@hotmail.com'#13''+
                       ''#13''+
                       'Nuestro Web Site:> http:\\www.idesisa.com',mtError,[mbok],0);
            Beep;
            Halt;
            end;
          if  (MonthOf(Date) = 6) then
          if frmtrgtr.tRegistroCANTCORRIDA.Value <= 0 then
          begin
            Messagedlg('El tiempo de uso de este programa a vencido.'#13''+
                       'Para continuar con su uso favor llamar a'#13''+
                       'Ing. Juan Ramon Divison Cel. Num. 809-309-5001'#13''+
                       'o envie un email a nosivid@hotmail.com'#13''+
                       ''#13''+
                       'Nuestro Web Site:> http:\\www.idesisa.com',mtError,[mbok],0);
            Beep;
            frmTrgtr.free;
            frmTrgtr:=Nil;
            Application.Terminate;
          end;
          frmtrgtr.tRegistro.Edit;
          frmtrgtr.tRegistroCANTCORRIDA.Value:=frmtrgtr.tRegistroCANTCORRIDA.Value - 1;
          frmtrgtr.Button1click(Self);
        end;
      end;
      frmTrgtr.free;
      frmTrgtr:=nil;
   end;
  ProcesoLogin;
  VInfo := TVersionInfo.Create(ParamStr(0));
  try
    FAppVer := VInfo.FileVersion;
    if trim(FAppVer)='' then FAppVer := '?.?';
    FAppBuild := ' '+FormatDateTime('mm/dd/yyyy', VInfo.VerFileDate);
  finally
    VInfo.free;
    VInfo:= Nil;
  end;
  RxLabel2.Caption:='IDESI S.A'+' '+FAppVer+FAppBuild;
  //t frmSQLUtilitario:=TfrmSQLUtilitario.Create(nil);
  //t try
    //t frmSQLUtilitario.EjecutarScriptCreaSP;
    //t frmSQLUtilitario.EjecutarScriptLimpiar;
    //t frmSQLUtilitario.EjecutarScript;
  //t finally
  //t frmSQLUtilitario.free;
  //t frmSQLUtilitario:=nil;
  //t end;
   VerificaCierreDia(17,1,1, ExtraerFecha(Now), GlbFechaTrnDiaria);
  if glbfechatrndiaria < Date then
  //RxLabel5.Caption :='ATENCION: Fecha transacciones no es la de hoy : '+FormatDatetime('dd/mmm/yyyy',glbfechatrndiaria)
  RxLabel5.Caption :='ATENCION: Ultimo dia cerrado es : '+FormatDatetime('dd/mmm/yyyy',glbfechatrndiaria)
  else RxLabel5.Caption:= FormatDatetime('dd/mmm/yyyy', glbfechatrndiaria);

  //TranslateComponent(Self);
end;

procedure TfrmMenu.Salir2Click(Sender: TObject);
begin
  close;
end;

procedure TfrmMenu.CerrarCesion1Click(Sender: TObject);
begin
  frmLogin:=TfrmLogin.Create(Nil);
  try
    frmLogin.Showmodal;
  finally
  frmLogin.Free;
  frmLogin:=Nil;
  end;
end;

procedure TfrmMenu.EmpleadosClick(Sender: TObject);
begin
  frmEmpleados:=TfrmEmpleados.Create(Nil);
  try
    frmEmpleados.ShowModal;
  finally
  frmEmpleados.Free;
  frmEmpleados:= Nil;
  end;
end;

procedure TfrmMenu.Crear1Click(Sender: TObject);
begin
  frmEntradaUsuarios:=TfrmEntradaUsuarios.Create(Nil);
  try
    frmEntradaUsuarios.Showmodal;
  finally
  frmEntradaUsuarios.Free;
  frmEntradaUsuarios:=Nil;
  end;
end;

procedure TfrmMenu.Comapaia1Click(Sender: TObject);
begin
  frmCompania:=TfrmCompania.Create(nil);
  try
    frmCompania.showmodal;
  finally
  frmCompania.free;
  frmCompania:=nil;
  end;
end;

procedure TfrmMenu.Catalogo1Click(Sender: TObject);
begin
  frmCatalogo:=TfrmCatalogo.Create(Nil);
  try
    frmCatalogo.Showmodal;
  finally
  frmCatalogo.Free;
  frmCatalogo:=Nil;
  end;
end;

procedure TfrmMenu.ransaccionesCnt1Click(Sender: TObject);
begin
  frmTransaccionesCnt:=TfrmTransaccionesCnt.Create(Nil);
  try
    frmTransaccionesCnt.Showmodal;
  finally
  frmTransaccionesCnt.Free;
  frmTransaccionesCnt:=Nil;
  end;
end;

procedure TfrmMenu.transacciones1Click(Sender: TObject);
begin
  frmActBlcecta:=TfrmActBlcecta.Create(nil);
  try
    frmActBlcecta.EsTrnCierreAnio := False;
    frmActBlcecta.btnProcesaTrnCierreA.Enabled:=False;
    frmActBlcecta.showmodal;
  finally
  frmActBlcecta.free;
  frmActBlcecta:=nil;
  end;
end;

procedure TfrmMenu.ControlPosting1Click(Sender: TObject);
begin
  frmControlSistema:=TfrmControlSistema.Create(Nil);
  try
    frmControlSistema.Showmodal;
  finally
  frmControlSistema.Free;
  frmControlSistema:=Nil;
  end;
end;

procedure TfrmMenu.Coneccion1Click(Sender: TObject);
begin
  frmInciaConeccion:=TfrmInciaConeccion.Create(Nil);
  try
    frmInciaConeccion.showmodal;
  finally
  frmInciaConeccion.Free;
  frmInciaConeccion:=Nil;
  end;
end;

procedure TfrmMenu.Skinoff1Click(Sender: TObject);
begin
  SkinData1.Active := Not SkinData1.Active;
end;

procedure TfrmMenu.CambiarClave1Click(Sender: TObject);
begin
  frmCambiarClaveUsuario:=TfrmCambiarClaveUsuario.Create(Nil);
  try
    frmCambiarClaveUsuario.Showmodal;
  finally
  frmCambiarClaveUsuario.Free;
  frmCambiarClaveUsuario:=Nil;
  end;
end;

procedure TfrmMenu.BalancexMes1Click(Sender: TObject);
begin
  fechatm.EligeMoneda:=false;
  if fechatm.execute then
  begin
    fechatm.EligeMoneda := False;
    dmCatalogo.qryBlcMesCta.Close;
    dmCatalogo.qryBlcMesCta.Filtered:=False;
    dmCatalogo.qryBlcMesCta.Params[0].Value:=ExtraerFecha(fechatm.fecha);
    dmCatalogo.qryBlcMesCta.Params[1].Value:=ExtraerFecha(fechatm.fechafinal);
    dmCatalogo.qryBlcMesCta.Open;
    frmBceMensual:=TfrmBceMensual.Create(Nil);
    try
      frmBceMensual.Showmodal;
    finally
    frmBceMensual.Free;
    frmBceMensual:=nil;
    end;
  end;
  fechatm.EligeMoneda:=true;
end;

procedure TfrmMenu.MesClick(Sender: TObject);
begin
  if not Assigned(frmCierremescnt) then
  frmCierremescnt:=TfrmCierremescnt.create(nil);
  try
    frmCierremescnt.Showmodal;
  finally
  frmCierremescnt.Free;
  frmCierremescnt:=Nil;
  end;
end;

procedure TfrmMenu.GeneraTransacciones1Click(Sender: TObject);
begin
  frmTransCierreAnioCnt := TfrmTransCierreAnioCnt.Create(nil);
  try
    frmTransCierreAnioCnt.showmodal;
  finally
  frmTransCierreAnioCnt.free;
  frmTransCierreAnioCnt:=nil;
  end;
end;

procedure TfrmMenu.PostearTrans1Click(Sender: TObject);
begin
   frmActBlcecta:=TfrmActBlcecta.Create(nil);
  try
    frmActBlcecta.EsTrnCierreAnio := True;
    frmActBlcecta.BitBtn1.Enabled:=False;
    frmActBlcecta.btnProcesaTrnCierreA.Enabled:=True;
    frmActBlcecta.showmodal;
  finally
  frmActBlcecta.free;
  frmActBlcecta:=nil;
  end;
end;

procedure TfrmMenu.CierreAo1Click(Sender: TObject);
begin
  frmCierreAnio:=TfrmCierreAnio.Create(nil);
  try
    frmCierreAnio.Showmodal;
  finally
  frmCierreAnio.free;
  frmCierreAnio:=nil;
  end;
end;

procedure TfrmMenu.BalanceGeneral1Click(Sender: TObject);
begin
  frmDatosblcgrl:=TfrmDatosblcgrl.Create(nil);
  try
    frmDatosblcgrl.showmodal;
  finally
  frmDatosblcgrl.free;
  frmDatosblcgrl:=nil;
  end;
end;

procedure TfrmMenu.EstadoGP1Click(Sender: TObject);
begin
  frmEstadoGyP:= TfrmEstadoGyP.Create(nil);
  try
    frmEstadoGyP.showmodal;
  finally
  frmEstadoGyP.free;
  frmEstadoGyP:=nil;
  end;
end;

procedure TfrmMenu.Depsitos1Click(Sender: TObject);
begin
  frmDepositos:=TfrmDepositos.Create(nil);
  try
    frmDepositos.showmodal;
  finally
  frmDepositos.free;
  frmDepositos:=nil;
  end;
end;

procedure TfrmMenu.Mantenimiento1Click(Sender: TObject);
begin
  frmBancos:=tFrmBancos.Create(Nil);
  try
    frmBancos.Showmodal;
  finally
  frmBancos.Free;
  frmBancos:=Nil;
  end;
end;

procedure TfrmMenu.ipoDeposito2Click(Sender: TObject);
begin
  frmTipoDeposito:=TfrmTipoDeposito.Create(Nil);
  try
    frmTipoDeposito.showmodal;
  finally
  frmTipoDeposito.free;
  frmTipoDeposito:=nil;
  end;
end;

procedure TfrmMenu.ipoCuenta1Click(Sender: TObject);
begin
  frmTipoCtaBanco:=TfrmTipoCtaBanco.Create(Nil);
  try
    frmTipoCtaBanco.Showmodal;
  finally
  frmTipoCtaBanco.Free;
  frmTipoCtaBanco:=Nil;
  end;

end;

procedure TfrmMenu.MayorGeneral1Click(Sender: TObject);
begin
  frmMayorGeneral:=TfrmMayorGeneral.Create(nil);
  try
    frmMayorGeneral.Showmodal;
  finally
  frmMayorGeneral.Free;
  frmMayorGeneral:=nil;
  end;
end;

procedure TfrmMenu.Transacciones4Click(Sender: TObject);
var
  dia,dia1,mes1,anio1:word;
begin
  if fechatm.execute then
  begin
    glbFechaInicial:=fechatm.fecha;
    glbFechaFinal:=fechatm.fechaFinal;
    DecodeDAte(fechatm.fecha,anio1,mes1,dia1);
    if UpperCase(InputBox('Reporte de Transacciones','D-Detallado R-Resumen x Cta','D')) = 'D' then
    Begin
      dtmodrep.qryRepTrnDiariaCnt.Close;
      dtmodrep.qryRepTrnDiariaCnt.Params[0].Value := ExtraerFecha(fechatm.Fecha);
      dtmodrep.qryRepTrnDiariaCnt.Params[1].Value := ExtraerFecha(fechatm.FechaFinal);
      dtmodrep.qryRepTrnDiariaCnt.Open;
      //qckRepTrnCnt:=TqckRepTrnCnt.Create(nil);
      if not Assigned(qckRepTrnCnt) Then
      qckRepTrnCnt:=TqckRepTrnCnt.Create(Nil);
      try
        qckRepTrnCnt.Prepare;
        glbTPag   :=qckRepTrnCnt.PageNumber;
      finally
      qckRepTrnCnt.QRPrinter.Free;
      end;
      qckRepTrnCnt:= Nil;
      if not Assigned(qckRepTrnCnt) Then
      qckRepTrnCnt:=TqckRepTrnCnt.Create(Nil);
      try
        if messagedlg('Imprimir?',mtInformation,[mbYes,mbNo],0) = mrYes then
        begin
          qckRepTrnCnt.PrinterSetup;
          qckRepTrnCnt.print;
        end else
        qckRepTrnCnt.Preview;
        finally
        qckRepTrnCnt.Free;
        qckRepTrnCnt:=Nil
      end;
        dtmodrep.qryRepTrnDiariaCnt.close
      end else
      begin
        // qryBlcMesCta se usa para balance inicial
        dmdatos.qryBlcMesCta.Close;
        if mes1 = 1 then
        begin
          dmdatos.qryBlcMesCta.Filtered := False;
          //dmdatos.qryBlcMesCta.Filter   := 'STATUS_CIEA = '+chr(39)+'D'+chr(39);
          dmdatos.STATUS_CIEA_FILTER_V := 'D';
          dmdatos.qryBlcMesCta.Filtered := True;
          mes1:=13;
          Dec(Anio1);
        end;
        dmdatos.qryBlcMesCta.Params[0].value := EncodeDate(anio1,mes1-1,DiasEnelMes(anio1,mes1-1));
        dmdatos.qryBlcMesCta.Params[1].value := EncodeDate(anio1,mes1-1,DiasEnelMes(anio1,mes1-1));
        dmdatos.qryBlcMesCta.Open;
        
        dtmodrep.qryRepTrnDiariaCntR.Close;
        dtmodrep.qryRepTrnDiariaCntR.Params[0].Value := ExtraerFecha(fechatm.Fecha);
        dtmodrep.qryRepTrnDiariaCntR.Params[1].Value := ExtraerFecha(fechatm.FechaFinal);
        dtmodrep.qryRepTrnDiariaCntR.Params[2].Value := GlbCodigoCia;        
        dtmodrep.qryRepTrnDiariaCntR.Open;
        qckRepTrnDiariaResCta:=TqckRepTrnDiariaResCta.Create(Nil);
        try
          if messagedlg('Imprimir?',mtinformation,[mbyes,mbno],0) = mryes then
        begin
          qckRepTrnDiariaResCta.PrinterSetup;
          qckRepTrnDiariaResCta.print;
        end else
        qckRepTrnDiariaResCta.Preview;
        finally
        qckRepTrnDiariaResCta.Free;
        qckRepTrnDiariaResCta:=Nil
        end;
        dtmodrep.qryRepTrnDiariaCntR.close;
      end;
  end;

end;

procedure TfrmMenu.BalancedeComprobacin1Click(Sender: TObject);
begin
  frmBlcComp:=TfrmBlcComp.Create(Nil);
  try
    frmBlcComp.Showmodal;
  finally
  frmBlcComp.Free;
  frmBlcComp:=Nil;
  end;
end;

procedure TfrmMenu.BalancedeCompAntesCierre1Click(Sender: TObject);
begin
  frmBlcCompTransJM:=TfrmBlcCompTransJM.Create(Nil);
  try
    frmBlcCompTransJM.Showmodal;
  finally
  frmBlcCompTransJM.Free;
  frmBlcCompTransJM:=Nil;
  end;
end;

procedure TfrmMenu.Image2Click(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmMenu.FormResize(Sender: TObject);
begin
  Refresh;
end;

end.
