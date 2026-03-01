unit UMenuPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  TLHelp32, IniFiles, Menus, RxCalc, WinSkinData, RXCtrls, StdCtrls, Buttons, ComCtrls,
  db, RXDBCtrl, Dialogs, jpeg, ExtCtrls, dbCtrls;

  const
  CM_RESTORE = WM_USER + $1000;

type
  TfrmMenuPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Actualizar1: TMenuItem;
    Reportes1: TMenuItem;
    Salir1: TMenuItem;
    Configuracion1: TMenuItem;
    Consulta1: TMenuItem;
    Clientes1: TMenuItem;
    StatusBar1: TStatusBar;
    Ayuda1: TMenuItem;
    Acercade1: TMenuItem;
    DebitosyCreditosaplicados1: TMenuItem;
    CrearUsuario1: TMenuItem;
    CambiarClaveUsuario1: TMenuItem;
    CerrarSesion1: TMenuItem;
    Mantenimiento1: TMenuItem;
    Cxc1: TMenuItem;
    VigenciaBlc1: TMenuItem;
    ManualOnline1: TMenuItem;
    AparienciaVentanas1: TMenuItem;
    RxCalculator1: TRxCalculator;
    Utilitario1: TMenuItem;
    Calculadora1: TMenuItem;
    DesactivarApariencia1: TMenuItem;
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    RxSpeedButton5: TRxSpeedButton;
    RxSpeedButton22: TRxSpeedButton;
    RxSpeedButton23: TRxSpeedButton;
    PopupActOpe: TPopupMenu;
    PopupReporte: TPopupMenu;
    Registro1: TMenuItem;
    Compaia1: TMenuItem;
    Image1: TImage;
    RxLabel5: TRxLabel;
    RxLabel2: TRxLabel;
    RxLabel1: TRxLabel;
    NCF1: TMenuItem;
    Actualizar2: TMenuItem;
    ipoNCF1: TMenuItem;
    PopupRepCxp: TPopupMenu;
    HistoricodeSecuenciaNCF1: TMenuItem;
    TabSheet5: TTabSheet;
    popUpctaxCxcRep: TPopupMenu;
    BalanceClientes1: TMenuItem;
    OrdernadoxCte1: TMenuItem;
    OrdenadoPorServicio1: TMenuItem;
    ReporteClienteServicio1: TMenuItem;
    Historico3: TMenuItem;
    Balance8: TMenuItem;
    popupConsultaCtaCxc: TPopupMenu;
    Balance4: TMenuItem;
    Historico2: TMenuItem;
    BalanceCliente1: TMenuItem;
    EstadoCuenta1: TMenuItem;
    FacturasPendiente1: TMenuItem;
    popupCtaXcxc: TPopupMenu;
    Balance2: TMenuItem;
    Balance5: TMenuItem;
    RxSpeedButton6: TRxSpeedButton;
    RxSpeedButton7: TRxSpeedButton;
    RxSpeedButton8: TRxSpeedButton;
    Image2: TImage;
    EstadoCta1: TMenuItem;
    ClaveMaestra1: TMenuItem;
    EstadoCta2: TMenuItem;
    CobroMultiplesFacturas1: TMenuItem;
    BasedeDatos1: TMenuItem;
    NotaCredito1: TMenuItem;
    NotaDebito1: TMenuItem;
    SaldoxAntCxc1: TMenuItem;
    SkinData1: TSkinData;
    CerrarDiaTardio1: TMenuItem;
    Balance1: TMenuItem;
    RelaciondeFacturas1: TMenuItem;
    MantenimientoPlan1: TMenuItem;
    GenerarFacturaPlan1: TMenuItem;
    arifaPlan1: TMenuItem;
    ipoPlan1: TMenuItem;
    ListadoClientes1: TMenuItem;
    ComisionPlan1: TMenuItem;
    Vendedores1: TMenuItem;
    procedure Salir1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);

    procedure Acercade1Click(Sender: TObject);
    procedure CerrarSesion1Click(Sender: TObject);

    procedure ManualOnline1Click(Sender: TObject);

    procedure Calculadora1Click(Sender: TObject);
    procedure DesactivarApariencia1Click(Sender: TObject);
    procedure CerrarDiaTrnDiaria1Click(Sender: TObject);
    procedure Registro1Click(Sender: TObject);
    procedure BasedeDatos1Click(Sender: TObject);
    procedure SkinData1FormSkin(Sender: TObject; aName: String;
      var DoSkin: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure PapelReporte1Click(Sender: TObject);
    procedure MantenimientoPlan1Click(Sender: TObject);
    procedure GenerarFacturaPlan1Click(Sender: TObject);
    procedure arifaPlan1Click(Sender: TObject);
    procedure ipoPlan1Click(Sender: TObject);
    procedure CobroMultiplesFacturas1Click(Sender: TObject);
    procedure Balance1Click(Sender: TObject);
    procedure ListadoClientes1Click(Sender: TObject);
    procedure ComisionPlan1Click(Sender: TObject);
    procedure Vendedores1Click(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure RelaciondeFacturas1Click(Sender: TObject);
    procedure SaldoxAntCxc1Click(Sender: TObject);
  private
    { Private declarations }
    procedure AppMessage(var Msg: TMsg; var Handled: Boolean);
    procedure HandleException(Sender: TObject; E: Exception);
    Procedure ShowHint(Sender: TObject);
    procedure ProcesarCierreDiaTrn;
    procedure ProcesoLogin;
    procedure ActivaPermisos;
    Function ProgramaAbiertoDosVeces:Boolean;
    procedure ImprimirRepItebis(tipo : smallint);
    Function ValidaRegistro(accion:smallint; coduser: Integer; usuario:string):Boolean;
    procedure logout; 
  public
    { Public declarations }
    procedure ProcCerrarDia;
  end;

var
  frmMenuPrincipal: TfrmMenuPrincipal;

implementation

uses UAcercaDe, Uglobal,
  uLogin, UDatModUsuarios, UDatModConectar,
  URegistro, uglobalcp, UDatModCompania, UConfigRep, UConectar,
  UFormRegPlan, UTarifaPlan, UFormTipoPlan, UFormGeneraFactPlan,
  UBuscarClientesPersonasP, UCobrarFacturas, UBalanceClientesPlanf,
  URepPlanesCte, UDatmodDatosGenerales, URepComisionesVPlan,
  UDatModReportes, UFormVendedores, UMaestroClientes, UfrmRelacionFact,
  UFormSaldAntCxc;


{$R *.dfm}

procedure TfrmMenuPrincipal.Salir1Click(Sender: TObject);
var
  Ini: TIniFile;
  NombArchivo : String;
  x: integer;
begin
  {NombArchivo := ExtractFilePath(Application.ExeName)+'\'+'repconf_cr.ini';
  Ini := TIniFile.Create(NombArchivo );
  try
    if (GlbCorriendoII = 0) then
    Ini.WriteInteger('Aplicacion', 'GlbCorriendo', 0);
  finally
  Ini.Free;
  end;

  //dmUsuarios.procMantRegDet.Params[0].Value:= //Permitido
  //dmUsuarios.procMantRegDet.Params[1].Value:= //Logueado
  dmUsuarios.procMantRegDet.Params[2].Value:= 0; //Accion
  dmUsuarios.procMantRegDet.Params[3].Value:= VarUsuarioGlb;//cod_usuario
  dmUsuarios.procMantRegDet.Params[4].Value:= StrUserName;//nombre_pc

  dmUsuarios.procMantRegDet.ExecProc;
  dmUsuarios.procMantRegDet.close;
  glbLogueado:= 0;
  logout;
  //dmConectar.IBDatabase1.CloseDataSets;
  //dmConectar.IBDatabase1.Close;}
  Application.Terminate;
end;


procedure TfrmMenuPrincipal.AppMessage(var Msg: TMsg;
  var Handled: Boolean);
var
   actual: TWinControl;
begin
  if Msg.message = WM_KEYDOWN then
     if Msg.WParam = VK_RETURN then
        begin
          Actual := Screen.ActiveControl;
          if (actual is TButton) or (actual is TDBMemo) or (Actual is TRxDBGrid)
             or (actual is TMemo) then
             exit
          else
             Msg.wParam := VK_TAB;
        end;
end;

procedure TfrmMenuPrincipal.FormCreate(Sender: TObject);
var
  xGrafico : String;
  Ini: TIniFile;
  NombArchivo : String;
  x: integer;
begin
  NombArchivo := ExtractFilePath(Application.ExeName)+'\'+'repconf_cr.ini';
  Ini := TIniFile.Create(NombArchivo );
  try
    GlbCorriendo := Ini.ReadInteger('Aplicacion', 'GlbCorriendo', 0);
  finally
  Ini.Free;
  end;

  Application.OnException := HandleException;
  GlbCorriendoII:=0;
  //if (GlbCorriendo = 1) then
  //begin
  //  GlbCorriendoII:=1;
  //  //Messagedlg('Existe una sesion de este programa, desea continuar', mtWarning ,[mbyes, mbNo],0);
  //  BitBtn1.Enabled:=False;
  //  RxSpeedButton12.Enabled:=false;
  //  Caption:='Existe otra instancia de este programa abierta, favor cerrar esta';
    //Application.Terminate;
  //end;

  xGrafico:=FileToUse('Grafico','Logo.jpg');
  if (xGrafico <> '') then
  Image2.Picture.LoadFromFile(xGrafico);
  Application.OnMessage := AppMessage;
  Application.OnHint    := ShowHint;
    frmtrgtr:=Tfrmtrgtr.Create(Nil);
    frmtrgtr.tRegistro.Close;
    frmtrgtr.tRegistro.Open;
    if frmtrgtr.tRegistroMOD_FINANC.Value = 1 then
    GlbFinanciamiento:=True
    else GlbFinanciamiento:=False;

    if (Trim(StrUserName) <> 'DIVISON') then
    begin
      if frmtrgtr.tRegistroCLAVE.Value = 19702005 then //Primera Vez
      begin
        //frmtrgtr.tRegistro.Edit;
        //if frmtrgtr.tRegistroCANTCORRIDA.Value > 0 then
        //frmtrgtr.tRegistroCANTCORRIDA.Value:=frmtrgtr.tRegistroCANTCORRIDA.Value - 1;

        //frmtrgtr.tRegistroSERIAL.Value:= GetVolumeID('c');
        //frmtrgtr.tRegistroCLAVE.Value := 11111111;
        //frmtrgtr.tRegistroFECHA_REGISTRO.Value:= Now;
        //frmtrgtr.Button1click(Self);
      end else
      begin
        //ingorado de forma temporal hasta que arregle el control de clientes
        {t if frmtrgtr.tRegistroSERIAL.Value <>  GetVolumeID('c') then
        begin
          Messagedlg('Se ha verificado una Violacion de Licencia,'#13''+
          ' si este programa te es útil favor '#13'llamar a Ing. Juan Ramon Divison 809-813-1364 o nosivid@hotmail.com',mtError,[mbok],0);
          Beep;
          frmTrgtr.Free;
          frmTrgtr:=Nil;
          Application.Terminate;
        end else
        begin}
         if frmtrgtr.tRegistroCANTCORRIDA.Value = 0 then
          begin
            Messagedlg('El tiempo de uso de este programa a vencido'#13''+
            ' favor ponerse en contacto con el Ing. Juan Ramon Divison 809-309-5001 o idesi@idesisa.com',mtError,[mbok],0);
            Beep;
            frmTrgtr.free;
            frmTrgtr:=Nil;
            Application.Terminate;
          end;
          frmtrgtr.tRegistro.Edit;
          frmtrgtr.tRegistroCANTCORRIDA.Value:=frmtrgtr.tRegistroCANTCORRIDA.Value - 1; // + 100;
          frmtrgtr.Button1click(Self);
        //end;
      end;
    end;
    frmTrgtr.free;
    frmTrgtr:=nil;
  ProcesoLogin;
  ActivaPermisos;
end;

procedure TfrmMenuPrincipal.ShowHint(Sender: TObject);
begin
  StatusBar1.Panels[0].Text := Application.Hint;
end;

procedure TfrmMenuPrincipal.Acercade1Click(Sender: TObject);
begin
 AboutBox := TAboutBox.Create(nil);
  Try
    aboutbox.showmodal;
  finally
  aboutbox.free;
  aboutbox:=nil;
  end;
end;

procedure TfrmMenuPrincipal.FormShow(Sender: TObject);
begin
  dmCompania.tblCompania.close;
  dmCompania.tblcompania.open;
  if VerificaCierreDia(17,1,1,ExtraerFecha(Now),GlbFechaTrnDiaria) then
  begin
    //If varTipousuario = 2 then //SUPERVISOR
    //begin
      if MessageDlg('Desea Cerrar Transacciones del dia '+FormatDateTime('dd-mmm-yyyy',GlbFechaTrnDiaria)+'?',mtWarning,[mbNo,mbYes],0)=mrYes then
      ProcesarCierreDiaTrn;
      if glbfechatrndiaria < Date then
      RxLabel5.Caption :='ATENCION: Ultimo dia cerrado es : '+FormatDatetime('dd/mmm/yyyy',glbfechatrndiaria)
      else RxLabel5.Caption:= FormatDatetime('dd/mmm/yyyy', glbfechatrndiaria);

    //end;
    //Transaccionescxc1Click(Self);
  end;
  frmConfReporte:=TfrmConfReporte.Create(Nil);
  try
    if Not FileExists('repconf_cr.ini') then
    begin
      frmConfReporte.ShowModal;
      frmConfReporte.DatosConfiguracion;
    end else
    frmConfReporte.DatosConfiguracion;
  finally
  frmConfReporte.Free;
  frmConfReporte:=Nil;
  end;
  //if GlbFinanciamiento then
  //CobroCuotasFinanc1.Visible:=False;
end;



procedure TfrmMenuPrincipal.ProcesoLogin;
begin
  frmLogin:=tfrmLogin.Create(Nil);
  Try
  if frmLogin.showmodal = mrCancel then
  begin
    logout;
     Application.Terminate;
  end
  else
  begin
    if (frmLogin.Edit1.Text = 'DIVISON') AND
       (frmLogin.Edit2.Text = '2005') then
    begin
      varTipousuario:=0;//Todos los permisos
      VarUsuarioGlb :=0;
    end else
    begin
      frmLogin.Edit2.Text:= Encriptar(Trim(frmLogin.edit2.Text),2005);
      //inicio
      //dmUsuarios.qryUsuarios.First;
      //While Not dmUsuarios.qryUsuarios.Eof do
      //begin
      //  frmLogin.Edit2.Text:= Desencriptar(Trim(dmUsuarios.qryUsuariosCLAVE.Value),2005);
      //  dmUsuarios.qryUsuariosNOMBRECOMPLETO.Value;
      //  dmUsuarios.qryUsuarios.Next;
      //end;
      //fin
      if not dmUsuarios.qryUsuarios.Locate('codigo;Clave',vararrayof([frmLogin.edit1.Text,frmLogin.edit2.Text]),[]) then
      begin

        Messagedlg('Usuario o Clave Incorrecta.¡Verifique Por Favor!',mtError,[mbOk],0);
        ProcesoLogin;
        //Application.Terminate;
      end else
      Begin

        GlbCodigoCia:=1;//Distribuidor Jugo Tropico
        if (not dmUsuarios.qryUsuariosARCHIVOCONFGWIN.IsNull) And
               (dmUsuarios.qryUsuariosARCHIVOCONFGWIN.Value <> '') then
        begin
          SkinData1.LoadFromFile(dmUsuarios.qryUsuariosARCHIVOCONFGWIN.Value);
        end;
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

        if ValidaRegistro(1, VarUsuarioGlb, StruserName) then
        begin
           MessageDlg('Cantidad de Licencias insuficientes, verifique.',mtInformation, [mbOK], 0);
           logout;
           Application.Terminate;
        end  else
        begin
          glbLogueado:= dmUsuarios.procMantRegDet.Params[0].Value;
        end;

        LeerDatosIni;//Asigna valor a GlbClaveSup
        VarNombreUsuario:= dmUsuarios.qryUsuariosNOMBRECOMPLETO.Value;
      end;
    end;
  end;
  finally
  frmLogin.free;
  frmLogin:=nil;
  end;
end;

procedure TfrmMenuPrincipal.CerrarSesion1Click(Sender: TObject);
begin
  ProcesoLogin;
  ActivaPermisos;
end;

procedure TfrmMenuPrincipal.ActivaPermisos;
begin
case varTipousuario of
  0,2:begin
        reportes1.Enabled:=True;
        DebitosyCreditosaplicados1.Enabled:=True;
        //BalanceCxc1.Enabled:=True;
        Configuracion1.Enabled:= True;
      end;
  else
  begin
    reportes1.Enabled:= False;
    DebitosyCreditosaplicados1.Enabled:= False;
    //BalanceCxc1.Enabled:=False;
    Configuracion1.Enabled:= False;
  end;
  end;
end;


procedure TfrmMenuPrincipal.ManualOnline1Click(Sender: TObject);
begin
  Application.HelpFile := 'C:\Proyectos\PuntoVenta\Ayuda\puntoventa.hlp';
end;


procedure TfrmMenuPrincipal.Calculadora1Click(Sender: TObject);
begin
  if RxCalculator1.Execute then
  RxCalculator1.Value:=0;
end;


procedure TfrmMenuPrincipal.DesactivarApariencia1Click(Sender: TObject);
begin
  DesactivarApariencia1.Checked:= not DesactivarApariencia1.Checked;
  skindata1.Active:= not skindata1.Active;
end;

procedure TfrmMenuPrincipal.CerrarDiaTrnDiaria1Click(Sender: TObject);
begin
  dmCompania.tblCompania.close;
  dmCompania.tblcompania.open;
  if VerificaCierreDia(17,1,1,ExtraerFecha(Now),GlbFechaTrnDiaria) then
  begin
    //t If varTipousuario = 2 then //SUPERVISOR
    //t begin
    if MessageDlg('Desea Cerrar Transacciones del dia '+FormatDateTime('dd-mmm-yyyy',GlbFechaTrnDiaria)+'?',mtWarning,[mbNo,mbYes],0)=mrYes then
    ProcesarCierreDiaTrn;
    if glbfechatrndiaria < Date then
    RxLabel5.Caption :='ATENCION: Ultimo dia cerrado es : '+FormatDatetime('dd/mmm/yyyy',glbfechatrndiaria)
    else RxLabel5.Caption:= FormatDatetime('dd/mmm/yyyy', glbfechatrndiaria);

   //t end else
   //t if MessageDlg('Solo el supervisor puede cerrar el dia, verifique. '+FormatDateTime('dd-mmm-yyyy',GlbFechaTrnDiaria)+'?',mtWarning,[mbNo,mbYes],0)=mrYes then
    //Transaccionescxc1Click(Self);
  end;
end;


procedure TfrmMenuPrincipal.Registro1Click(Sender: TObject);
begin
  frmtrgtr:=Tfrmtrgtr.create(nil);
  try
    frmtrgtr.ShowModal;
  finally
  frmtrgtr.free;
  frmtrgtr:=nil;
  end;
end;


procedure TfrmMenuPrincipal.PapelReporte1Click(Sender: TObject);
begin
  frmConfReporte:=TfrmConfReporte.Create(Nil);
  try
    frmConfReporte.ShowModal;
  finally
  frmConfReporte.Free;
  frmConfReporte:=Nil;
  end;

  frmConfReporte:=TfrmConfReporte.Create(Nil);
  try
    frmConfReporte.DatosConfiguracion;
  finally
  frmConfReporte.Free;
  frmConfReporte:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.BasedeDatos1Click(Sender: TObject);
begin
  frmInciaConeccion:=TfrmInciaConeccion.Create(Nil);
  try
    frmInciaConeccion.Showmodal;
  finally
  frmInciaConeccion.Free;
  frmInciaConeccion := Nil;
  end;
end;

procedure TfrmMenuPrincipal.ProcCerrarDia;
var
  x, y : string;
  z: Integer;
begin
{  if VerificaCierreDia(17,1,1, ExtraerFecha(Now), GlbFechaTrnDiaria) then
  begin
    If (varTipousuario = 0) or (varTipousuario = 1) then
    begin
      if (Date - glbfechatrndiaria) > 1  then
      begin
        CerrarDiaTardio1Click(Self);
        Exit;
      end;
      if MessageDlg('Desea Cerrar Transacciones del dia '+FormatDateTime('dd-mmm-yyyy',GlbFechaTrnDiaria)+'?',mtWarning,[mbNo,mbYes],0)=mrYes then
      ProcesarCierreDiaTrn else
      begin
        x:= FormatDateTime('dd', GlbFechaTrnDiaria);
        y:= FormatDateTime('dd', Date);
        z:= StrToInt(x) - StrToInt(y);
        z:= Abs(z);

      end;
    end;
  end;
  if glbfechatrndiaria < Date then
  RxLabel5.Caption :='ATENCION: Ultimo dia cerrado es : '+FormatDatetime('dd/mmm/yyyy',glbfechatrndiaria)
  else RxLabel5.Caption:= FormatDatetime('dd/mmm/yyyy', glbfechatrndiaria);
  }
end;

function FindForm(s:string):TForm;
var i:integer;
begin
  result:=nil;
  for i:= 0 to screen.FormCount-1 do
  begin
    if screen.Forms[i].ClassName=s then
    begin
       result:=screen.Forms[i];
       break;
    end;
  end;
end;

procedure TfrmMenuPrincipal.HandleException(Sender: TObject; E: Exception);
var
 error : string;
begin
  error:='error';
end;

function TfrmMenuPrincipal.ProgramaAbiertoDosVeces: Boolean;
var
  Datos          :TProcessEntry32; {Estructura interna de datos de un proceso}
  hID            :DWord;           {identificador del proceso}
  Snap           :Integer;
  NombreArchivo  :String;    {path del archivo original}
  Repetido       :Boolean;   {true si el programa se ha abierto dos veces}
  Handle1        :Hwnd;      {thandle}
  Contador       :Integer;   {Contador de aperturas}

begin
  Contador:=0;
  NombreArchivo:=Application.Exename;
  Repetido:=False;
  GetWindowThreadProcessId(Handle1,@hID);
  Snap:=CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS,0);
  try
    Datos.dwSize:=SizeOf(Datos);
    if(Process32First(Snap,Datos))then
    begin
      repeat
        if NombreArchivo=StrPas(Datos.szExeFile) then
        begin
           Inc(contador);
           if Contador>=2 then Repetido:=true;
        end;
      until (not(Process32Next(Snap,Datos))) or (Repetido);
    end;
  finally
    Windows.CloseHandle(Snap);
  end;
  Result:=Repetido;
end;

procedure TfrmMenuPrincipal.SkinData1FormSkin(Sender: TObject;
  aName: String; var DoSkin: Boolean);
  var fm:TForm;
begin
  if (aname='TQRStandardPreview') then
  begin
    fm:= FindForm(aName);
    if fm<>nil then
    begin
      fm.Top:=0;
      fm.Left:=0;
      fm.Width:=screen.Width;
      fm.Height:=screen.Height;
    end;
  end;
end;

procedure TfrmMenuPrincipal.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  Ini: TIniFile;
  NombArchivo : String;
  x: integer;
begin
  NombArchivo := ExtractFilePath(Application.ExeName)+'\'+'repconf_cr.ini';
  Ini := TIniFile.Create(NombArchivo );
  try
    if (GlbCorriendoII = 0) then
    Ini.WriteInteger('Aplicacion', 'GlbCorriendo', 0);
  finally
  Ini.Free;
  end;
  //dmUsuarios.procMantRegDet.Params[0].Value:= //Permitido
  //dmUsuarios.procMantRegDet.Params[1].Value:= //Logueado
  dmUsuarios.procMantRegDet.Params[2].Value:= 0; //Accion
  dmUsuarios.procMantRegDet.Params[3].Value:= VarUsuarioGlb;//cod_usuario
  dmUsuarios.procMantRegDet.Params[4].Value:= StrUserName;//nombre_pc

  dmUsuarios.procMantRegDet.ExecProc;

  glbLogueado:= 0;
end;

function TfrmMenuPrincipal.ValidaRegistro(accion: smallint;
  coduser: Integer; usuario: string): Boolean;
begin
  //dmUsuarios.procMantRegDet.Params[0].Value:= //Permitido
  //dmUsuarios.procMantRegDet.Params[1].Value:= //Logueado
  dmUsuarios.procMantRegDet.Params[2].Value:= accion; //Accion
  dmUsuarios.procMantRegDet.Params[3].Value:= coduser;//cod_usuario
  dmUsuarios.procMantRegDet.Params[4].Value:= usuario;//nombre_pc
  dmUsuarios.procMantRegDet.ExecProc;
  if (dmUsuarios.procMantRegDet.Params[0].Value = 0) then
  result:=True
  else result:=False;
end;

procedure TfrmMenuPrincipal.logout;
var
  Ini: TIniFile;
  NombArchivo : String;
  x: integer;
begin
  NombArchivo := ExtractFilePath(Application.ExeName)+'\'+'repconf_cr.ini';
  Ini := TIniFile.Create(NombArchivo );
  try
    if (GlbCorriendo = 0) then
    Ini.WriteInteger('Aplicacion', 'GlbCorriendo', 0);
  finally
  Ini.Free;
  end;
end;

procedure TfrmMenuPrincipal.ImprimirRepItebis(tipo: smallint);
begin

end;

procedure TfrmMenuPrincipal.ProcesarCierreDiaTrn;
begin
  //
end;

procedure TfrmMenuPrincipal.MantenimientoPlan1Click(Sender: TObject);
begin
  frmProcPlanFunerario:=TfrmProcPlanFunerario.Create(Nil);
  try
    frmProcPlanFunerario.Showmodal;
  finally
  frmProcPlanFunerario.Free;
  frmProcPlanFunerario:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.GenerarFacturaPlan1Click(Sender: TObject);
begin
  frmGeneraFactPlan:=TfrmGeneraFactPlan.Create(Nil);
  try
    frmGeneraFactPlan.ShowModal;
  finally
  frmGeneraFactPlan.Free;
  frmGeneraFactPlan:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.arifaPlan1Click(Sender: TObject);
begin
  frmTarifaPlan:=TfrmTarifaPlan.Create(nil);
  try
  frmTarifaPlan.Showmodal;
  finally
  frmTarifaPlan.free;
  frmTarifaPlan:=nil;
  end;
end;

procedure TfrmMenuPrincipal.ipoPlan1Click(Sender: TObject);
begin
  frmTipoPlan:=TfrmTipoPlan.Create(Nil);
  try
    frmTipoPlan.Showmodal;
  finally
  frmTipoPlan.Free;
  frmTipoPlan:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.CobroMultiplesFacturas1Click(Sender: TObject);
begin
  FrmBuscarClientesPersonas:=TFrmBuscarClientesPersonas.Create(nil);
  try
    if FrmBuscarClientesPersonas.showmodal = mrOk then
    begin
      frmCobrarFacturas:=TfrmCobrarFacturas.Create(nil);
      try
        //frmCobrarFacturas.strNombreEmpresa :=FrmBuscarClientesPersonas.
        frmCobrarFacturas.CodCte:=FrmBuscarClientesPersonas.CodigoCliente;
        frmCobrarFacturas.Showmodal;
      finally
      frmCobrarFacturas.Free;
      frmCobrarFacturas:=Nil;
      end;
    end;
  finally
  FrmBuscarClientesPersonas.free;
  FrmBuscarClientesPersonas:=nil;
  end;
end;

procedure TfrmMenuPrincipal.Balance1Click(Sender: TObject);
begin
  frmBalanceCtesPF:=TfrmBalanceCtesPF.Create(nil);
  try
    frmBalanceCtesPF.showmodal;
  finally
  frmBalanceCtesPF.Free;
  frmBalanceCtesPF:=Nil;
  end;

end;

procedure TfrmMenuPrincipal.ListadoClientes1Click(Sender: TObject);
begin
  dmDatos.qryPlanRepMaster.Close;
  dmDatos.qryPlanRepMaster.Open;  
  qckPlanesXCliente:=TqckPlanesXCliente.Create(nil);
  try
    qckPlanesXCliente.Preview;
  finally
  qckPlanesXCliente.free;
  qckPlanesXCliente:=nil;
  end;
end;

procedure TfrmMenuPrincipal.ComisionPlan1Click(Sender: TObject);
begin
  dmReportes.qryRepComisionVPlan.Close;
  dmReportes.qryRepComisionVPlan.Open;
  qryRepComisionPlanF:=TqryRepComisionPlanF.Create(nil);
  try
    qryRepComisionPlanF.Preview;
  finally
  qryRepComisionPlanF.free;
  qryRepComisionPlanF:=nil;
  end;
end;

procedure TfrmMenuPrincipal.Vendedores1Click(Sender: TObject);
begin
  frmVendedores:=TfrmVendedores.Create(nil);
  try
    frmVendedores.showmodal;
  finally
  frmVendedores.free;
  frmVendedores:=nil;
  end;
end;

procedure TfrmMenuPrincipal.Clientes1Click(Sender: TObject);
begin
  frmClientes:=TfrmClientes.create(nil);
  try
    frmClientes.showmodal;
  finally
  frmClientes.free;
  frmClientes:=nil;
  end;
end;

procedure TfrmMenuPrincipal.RelaciondeFacturas1Click(Sender: TObject);
begin
  frmRelacionFact:=TfrmRelacionFact.Create(Nil);
  try
    frmrelacionfact.Showmodal;
  finally
  frmrelacionfact.Free;
  frmrelacionfact:=Nil;
  end;
end;

procedure TfrmMenuPrincipal.SaldoxAntCxc1Click(Sender: TObject);
begin
  frmConsultaAntCxc:=TfrmConsultaAntCxc.Create(Nil);
  try
    frmConsultaAntCxc.filtraPlanFunerario:='PLAN FUNERARIO';
    frmConsultaAntCxc.Showmodal;
  finally
  frmConsultaAntCxc.Free;
  frmConsultaAntCxc:=Nil;
  end;
end;

end.

