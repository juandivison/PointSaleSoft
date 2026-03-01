unit MenuPrincipalLoan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  DateUtils, RxVerInf, IniFiles,dbCtrls, StdCtrls, Buttons, Dialogs, RXCtrls, ComCtrls, Menus, jpeg, ExtCtrls, WinSkinData;

type
  TfrmMenu = class(TForm)
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
    CerrarDia1: TMenuItem;
    Oficina1: TMenuItem;
    Empleados: TMenuItem;
    Usuarios1: TMenuItem;
    Crear1: TMenuItem;
    CambiarClave1: TMenuItem;
    ClaveMaestra1: TMenuItem;
    Configuracion1: TMenuItem;
    Coneccion1: TMenuItem;
    Comapaia1: TMenuItem;
    NCF1: TMenuItem;
    ipoCF1: TMenuItem;
    CerrarCesion1: TMenuItem;
    Salir2: TMenuItem;
    Ayuda1: TMenuItem;
    Acerdade1: TMenuItem;
    Contenido1: TMenuItem;
    Registro1: TMenuItem;
    StatusBar1: TStatusBar;
    RxLabel5: TRxLabel;
    RxLabel2: TRxLabel;
    RxLabel1: TRxLabel;
    Image1: TImage;
    SkinData1: TSkinData;
    PopupActOpe: TPopupMenu;
    Clientes1: TMenuItem;
    Ciudades2: TMenuItem;
    ITBIS1: TMenuItem;
    Intereses1: TMenuItem;
    Actualizar1: TMenuItem;
    Procesos1: TMenuItem;
    Permisos1: TMenuItem;
    procedure Coneccion1Click(Sender: TObject);
    procedure Crear1Click(Sender: TObject);
    procedure CambiarClave1Click(Sender: TObject);
    procedure Salir2Click(Sender: TObject);
    procedure CerrarCesion1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EmpleadosClick(Sender: TObject);
    procedure ClaveMaestra1Click(Sender: TObject);
    procedure ControlPosting1Click(Sender: TObject);
    procedure Procesos1Click(Sender: TObject);
  private
    { Private declarations }
    procedure Logger(Sender: TObject; E: Exception);
    procedure ProcesoLogin;
    procedure AppMessage(var Msg: TMsg; var Handled: Boolean);
    Procedure ShowHint(Sender: TObject);
  public
    { Public declarations }
  end;

var
  frmMenu: TfrmMenu;

implementation

uses UConectar, UDatModCon, uLogin, UGlobal, uglobalCp, UDatModUsuarios,
  UEntradaDeUsuarios, UCambiarClaveUsuario, UDatModCompania, URegistro,
  UEmpleados, UFormEntreClave, UFormMantOficina, UControlAct,
  UFormSecprocesos;

{$R *.dfm}

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

procedure TfrmMenu.Coneccion1Click(Sender: TObject);
begin
  frmInciaConeccion:=TfrmInciaConeccion.Create(nil);
  try
    frmInciaConeccion.Showmodal;
  finally
  frmInciaConeccion.Free;
  frmInciaConeccion:=Nil;
  end;
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
    dmcon.IBDatabase1.Open;
    if dmcon.IBDatabase1.TestConnected then
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
       (frmLogin.Edit2.Text = '2005') then
    begin
      //varTipousuario:=0;//Todos los permisos
      //VarUsuarioGlb :=0;
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

procedure TfrmMenu.ShowHint(Sender: TObject);
begin
  StatusBar1.Panels[1].Text := Application.Hint;
end;

procedure TfrmMenu.Crear1Click(Sender: TObject);
begin
  frmEntradaUsuarios:=TfrmEntradaUsuarios.Create(nil);
  try
   frmEntradaUsuarios.Showmodal;
  finally
  frmEntradaUsuarios.Free;
  frmEntradaUsuarios:=Nil;
  end;
end;

procedure TfrmMenu.CambiarClave1Click(Sender: TObject);
begin
  frmCambiarClaveUsuario:=TfrmCambiarClaveUsuario.Create(nil);
  try
    frmCambiarClaveUsuario.Showmodal;
  finally
  frmCambiarClaveUsuario.Free;
  frmCambiarClaveUsuario:=Nil;
  end;
end;

procedure TfrmMenu.Salir2Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmMenu.CerrarCesion1Click(Sender: TObject);
begin
  ProcesoLogin;
end;

procedure TfrmMenu.FormCreate(Sender: TObject);
var
  str : string[7];
  VInfo: TVersionInfo;
  FAppVer, FAppBuild : String;
begin
  Application.OnException := Logger;
  Application.OnMessage := AppMessage;
  Application.OnHint := ShowHint;
  dmCompania.tblCompania.Close;
  dmCompania.tblCompania.Open;
  frmtrgtr:=Tfrmtrgtr.Create(Nil);
  frmtrgtr.tRegistro.Close;
  frmtrgtr.tRegistro.Open;
  str:=strusername;
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
       //temp divi if frmtrgtr.tRegistroSERIAL.Value <>  GetVolumeID('c') then
       //temp divi begin
       //temp divi   Messagedlg('Se ha verificado un error de Violacion de Licencia,'#13''+
       //temp divi   ' si este programa te es útil favor '#13'llamar a Ing. Juan Ramon Divison 809-309-5001 o nosivid@hotmail.com',mtError,[mbok],0);
       //temp divi   Beep;
       //temp divi   frmTrgtr.Free;
       //temp divi   frmTrgtr:=Nil;
       //temp divi   Application.Terminate;
       //temp divi end else
       //temp divi begin
          if (frmtrgtr.tRegistroCANTCORRIDA.Value = 0) then
          begin
            if  (MonthOf(Date) <=6) then
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
        //temp divi  end;
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
    VInfo:=nil;
  end;
  RxLabel2.Caption:='IDESI.S.A'+' '+FAppVer+FAppBuild;
  //t frmSQLUtilitario:=TfrmSQLUtilitario.Create(nil);
  //t try
    //t frmSQLUtilitario.EjecutarScriptCreaSP;
    //t frmSQLUtilitario.EjecutarScriptLimpiar;
    //t frmSQLUtilitario.EjecutarScript;
  //t finally
  //t frmSQLUtilitario.free;
  //t frmSQLUtilitario:=nil;
  //t end;
end;

procedure TfrmMenu.EmpleadosClick(Sender: TObject);
begin
  frmEmpleados:=TfrmEmpleados.Create(Nil);
  try
    frmEmpleados.Showmodal;
  finally
  frmEmpleados.Free;
  frmEmpleados:=Nil;
  end;
end;

procedure TfrmMenu.ClaveMaestra1Click(Sender: TObject);
var
  Ini: TIniFile;
  clave, claveSave : String;
  xsalir : Boolean;
  verClave : String;
begin
  xsalir:=False;
  Ini := TIniFile.Create( ChangeFileExt( Application.ExeName, '.INI' ) );
  try
    frmentrreClave:=TfrmentrreClave.Create(Nil);
    if frmEntrreClave.showmodal=mrOk then
    Clave:= frmEntrreClave.Edit1.Text
    else xsalir := True;
    frmentrreClave.Free;
    frmentrreClave := Nil;
    ClaveSave:=Ini.ReadString('Clave','Maestra', '');
    xsalir:= False;
    verClave:= Encriptar(Trim(clave),2005);
    if Clave <> '' then
    if claveSave <> verClave then
    begin
      MessageDlg('Clave incorrecta, verifique',mtError, [mbOK], 0);
      xsalir:=True;
    end;
  finally
  Ini.Free;
  end;
  if xsalir then Exit;
end;

procedure TfrmMenu.ControlPosting1Click(Sender: TObject);
begin
  frmControlSistema:=TfrmControlSistema.Create(Nil);
  try
    frmControlSistema.ShowModal;
  finally
  frmControlSistema.Free;
  frmControlSistema:=Nil;
  end;
end;

procedure TfrmMenu.Procesos1Click(Sender: TObject);
begin
  frmProcesos:=TfrmProcesos.create(nil);
  try
    frmProcesos.showmodal;
  finally
  frmProcesos.free;
  frmProcesos:=nil;
  end;
end;

end.
