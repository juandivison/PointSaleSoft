unit UFiscalrutina;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, EpsonFPHostControlX_TLB, StdCtrls, Buttons, ComCtrls,
  ExtCtrls, Menus, RXCtrls;

type
  TfrmIFiscal = class(TForm)
    BitBtn1: TBitBtn;
    StatusBar1: TStatusBar;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Edit1: TEdit;
    Label5: TLabel;
    Edit2: TEdit;
    Label6: TLabel;
    Button1: TButton;
    Panel1: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    T1: TEdit;
    T4: TEdit;
    T5: TEdit;
    T6: TEdit;
    T7: TListBox;
    cBoxPuertocomm: TComboBox;
    Label12: TLabel;
    cboxBaudRate: TComboBox;
    Label13: TLabel;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    PopupMenu1: TPopupMenu;
    RxSpeedButton1: TRxSpeedButton;
    Abrir1: TMenuItem;
    Item1: TMenuItem;
    SubTotal1: TMenuItem;
    Descuentoe1: TMenuItem;
    RegistrodePago1: TMenuItem;
    CerrarCuponFiscal1: TMenuItem;
    InformacionessobreCuponFiscal1: TMenuItem;
    Cancelaritemparcialmente1: TMenuItem;
    Cancelar1: TMenuItem;
    EnviardatosConsumidor1: TMenuItem;
    Enviarlineaadicionalfechadecupon1: TMenuItem;
    Enviaridentificaciondelaplicativo1: TMenuItem;
    RxSpeedButton2: TRxSpeedButton;
    PopupMenu2: TPopupMenu;
    CierreZ1: TMenuItem;
    InformeCierreCajero1: TMenuItem;
    IniciarInformeX1: TMenuItem;
    Informacion1: TMenuItem;
    InformaciondeITBIS1: TMenuItem;
    InformaciondePagos1: TMenuItem;
    Acumuladores1: TMenuItem;
    BitBtn12: TBitBtn;
    Label1: TLabel;
    BitBtn13: TBitBtn;
    Button2: TButton;
    procedure BitBtn1Click(Sender: TObject);
    procedure printerfAck(Sender: TObject);
    procedure printerfNack(Sender: TObject);
    procedure printerfOpen(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure printerfRead(ASender: TObject; const Value: WideString);
    procedure printerfWrite(ASender: TObject; const Value: WideString);
    procedure printerfFinalAnswer(Sender: TObject);
    procedure printerfIntermediateAnswer(Sender: TObject);
    procedure printerfError(Sender: TObject);
    procedure printerfClose(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure rdbPuertoOpenClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure Abrir1Click(Sender: TObject);
    procedure Item1Click(Sender: TObject);
    procedure SubTotal1Click(Sender: TObject);
    procedure Descuentoe1Click(Sender: TObject);
    procedure RegistrodePago1Click(Sender: TObject);
    procedure CerrarCuponFiscal1Click(Sender: TObject);
    procedure InformacionessobreCuponFiscal1Click(Sender: TObject);
    procedure Cancelaritemparcialmente1Click(Sender: TObject);
    procedure Cancelar1Click(Sender: TObject);
    procedure EnviardatosConsumidor1Click(Sender: TObject);
    procedure Enviarlineaadicionalfechadecupon1Click(Sender: TObject);
    procedure Enviaridentificaciondelaplicativo1Click(Sender: TObject);
    procedure CierreZ1Click(Sender: TObject);
    procedure InformeCierreCajero1Click(Sender: TObject);
    procedure IniciarInformeX1Click(Sender: TObject);
    procedure Informacion1Click(Sender: TObject);
    procedure InformaciondeITBIS1Click(Sender: TObject);
    procedure InformaciondePagos1Click(Sender: TObject);
    procedure Acumuladores1Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);

  private
    procedure esperaEnviocmd;
    function HextoInt(HexStr: string): String;
    { Private declarations }
  public
    { Public declarations }
    Procedure atualizaRetorno(szComando:String; iStatusImpressora:Integer; iStatusFiscal:Integer; iErro:Integer);    
    Function AbrirSerial():Boolean;
    Function FecharSerial():Boolean;    
  end;

var
  frmIFiscal: TfrmIFiscal;
  ackRecibido : boolean;
  cmdExitoso : Boolean;
  cmdTexto : String;
  
  //variables 
  iRetorno: Integer;
  iRet, iState:Integer;
  retorno1, retorno2, retorno4 : Integer;
  tamanho:Integer;

implementation
uses DeclaraepsonDLL;
{$R *.dfm}

procedure TfrmIFiscal.esperaEnviocmd;
var
  xdummy : smallint;
begin
   repeat
   begin
     sleep(60);
     //xdummy := printerf.State;
     break;
   end;
   until (true)
   //until (printerf.State <> EFP_S_Busy);

  {
   Dim Start1 As Single
    Start1 = Timer                  '
    Do While Me.EpsonFP.State = EFP_S_Busy
        Do While Timer < Start1 + 0.125     '   Timer delay
            DoEvents
            If Start1 > Timer Then          '   This is to
                Exit Do                     '   compensate for the
            End If                          '   AM to PM change
        Loop
    Loop                  '}

end;

procedure TfrmIFiscal.BitBtn1Click(Sender: TObject);
begin
{  if printerf.OpenPort then
  begin
    printerf.ShowAboutBox;
  end;}
end;

procedure TfrmIFiscal.printerfAck(Sender: TObject);
var
  num : TOleEnum;
begin
{  num:=printerf.State;
  Memo3.Lines.Add('Ack recibido');
  ackRecibido:=True;}
end;

procedure TfrmIFiscal.printerfNack(Sender: TObject);
var
  num : TOleEnum;
begin
{  num := printerf.State;
  memo3.Lines.Add('State '+IntToStr(num));
  printerf.SendCommand;}
end;

procedure TfrmIFiscal.printerfOpen(Sender: TObject);
begin
{  rdbPuertoOpen.Checked:= printerf.OpenPort;
  memo3.Lines.Add('Puerto Open');
  rdbPuertoOpen.Checked:=True;}
end;

procedure TfrmIFiscal.FormCreate(Sender: TObject);
begin
  //if printerf.OpenPort then
  //rdbPuertoOpen.Checked := True;
{  Memo1.Clear;
  Memo2.Clear;
  Memo3.Clear;
  cmdExitoso:=True;}
  //StatusBar1.Panels[0].Text:='COM';
  //StatusBar1.Panels[1].Text:=IntToStr(printerf.CommPort);
  //StatusBar1.Panels[2].Text:='BaudRate';
  //StatusBar1.Panels[3].Text:=IntToStr(printerf.BaudRate);
end;

procedure TfrmIFiscal.printerfRead(ASender: TObject; const Value: WideString);
begin
  //Memo1.Lines.Add(value);
end;

procedure TfrmIFiscal.printerfWrite(ASender: TObject; const Value: WideString);
begin
  //Memo2.Lines.Add(value);
end;

procedure TfrmIFiscal.printerfFinalAnswer(Sender: TObject);
begin
  //Memo3.Lines.Add('Final Answer');
end;

procedure TfrmIFiscal.printerfIntermediateAnswer(Sender: TObject);
begin
  //Memo3.Lines.Add('InterMediate Answer');
end;

procedure TfrmIFiscal.printerfError(Sender: TObject);
begin
  //Memo3.Lines.Add('Error Generado');
end;

procedure TfrmIFiscal.printerfClose(Sender: TObject);
begin
  //Memo3.Lines.Add('Puerto Cerrado');
end;

procedure TfrmIFiscal.RadioButton1Click(Sender: TObject);
begin
{  if Not Printerf.ClosePort Then
  Memo3.lines.Add('Error cerrando puerto'+  IntTostr(printerf.CommPort));}
end;

procedure TfrmIFiscal.rdbPuertoOpenClick(Sender: TObject);
begin
 //Printerf.OpenPort;
 // Memo3.lines.Add('Puerto no abierto'+  IntTostr(printerf.CommPort));
end;

procedure TfrmIFiscal.BitBtn2Click(Sender: TObject);
 var
   stat : smallint;
   error : integer;
begin
  T7.Items.Clear();
  If (AbrirSerial() = True) Then
  begin
    PurgeMessage();
    error:=0;
    error:=AddMessageFieldEx(PChar('0701'), 4, 1, true);//, 1, True);
    //error:=AddMessageField(PChar(StrToInt('$'+'0000')), 4);//, 1, True);
    //'0000' – Estação fiscal.
    //'0001' – Estação slip.
    //'0002' – Estação de autenticação.

    error:=AddMessageFieldEx(PChar('0000'), 4,1,true);//, 1, True);
    error:=AddMessageFieldEx(PChar('10'), 2,2,false);//, 2, False);

    If (SendSerialMessage() = 0) Then
    begin
      esperaEnviocmd;
      Repeat
        iState := GetCommunicationState();
      Until iState = 1;
      If (GetLastCommError() = 0) Then
      begin
        GetMessageField(Pchar(retorno1), tamanho, 1);//, 2);
        GetMessageField(Pchar(retorno2), tamanho, 2);//, 2);
        GetMessageField(Pchar(retorno4), tamanho, 4);//, 2);
        atualizaRetorno('Avanzar una linea', retorno1, retorno2, retorno4);
      end;
    end;
    //FecharSerial();
  end;
  {
  ackRecibido:=False;
  if printerf.State = EFP_S_Idle then
  begin
  //cmdExitoso := printerf.AddDataField('0x02');
  //cmdExitoso := printerf.AddDataField('0701');
  //cmdExitoso := printerf.AddDataField('|');
  if cmdExitoso then
  cmdExitoso := printerf.AddDataField(chr(07));
  if cmdExitoso then
  cmdExitoso := printerf.AddDataField(chr(01));

  if cmdExitoso then
  cmdExitoso:=printerf.SendCommand;
  stat:= printerf.FiscalStatus;
  if cmdExitoso then
  esperaEnviocmd;
  end;
  //WaitMessage;    }
end;

procedure TfrmIFiscal.BitBtn3Click(Sender: TObject);
begin
  //@TIQUETEXTO|00002|ESTE MENSAJE SERA IMPRESO
  {ackRecibido:=False;
  printerf.AddDataField(chr(0002));
  //printerf.AddDataField('|');
  printerf.AddDataField('ESTE MENSAJE SERA IMPRESO');
  if not ackRecibido then
  printerf.SendCommand;
  esperaEnviocmd;}
end;

procedure TfrmIFiscal.BitBtn4Click(Sender: TObject);
var
  fvalor : string;
begin
  T7.Items.Clear();
  If (AbrirSerial() = True) Then
  begin
    PurgeMessage();
    fvalor:='$0702';
    AddMessageField(PansiChar(fvalor), 5);//, 1, True);
    fvalor:='$0000';
    AddMessageField(PansiChar(fvalor), 5);//, 1, False);
    If (SendSerialMessage() = 0) Then
    begin
      Repeat
        iState := GetCommunicationState();
      Until iState = 1;
      If (GetLastCommError() = 0) Then
      begin
        GetMessageField(pchar(retorno1), tamanho, 1);//, 2);
        GetMessageField(pchar(retorno2), tamanho, 2);//, 2);
        GetMessageField(pchar(retorno4), tamanho, 4);//, 2);
        atualizaRetorno('Cortar papel', retorno1, retorno2, retorno4);
      end;
    end;
    //FecharSerial();
  end;
{  este funciona
  T7.Items.Clear();
  If (AbrirSerial() = True) Then
  begin
    PurgeMessage();
    AddMessageFieldEx('0702', 4, 1, True);
    AddMessageFieldEx('0000', 4, 1, False);
    If (SendSerialMessage() = 0) Then
    begin
      Repeat
        iState := GetCommunicationState();
      Until iState = 1;
      If (GetLastCommError() = 0) Then
      begin
        GetMessageFieldEx(retorno1, tamanho, 1, 2);
        GetMessageFieldEx(retorno2, tamanho, 2, 2);
        GetMessageFieldEx(retorno4, tamanho, 4, 2);
        atualizaRetorno('Cortar papel', retorno1, retorno2, retorno4);
      end;
    end;
    FecharSerial();
  end; }
end;

function TfrmIFiscal.HextoInt(HexStr:string):String;
const Hex : array['A'..'F'] of integer = (10,11,12,13,14,15);
var
    i   : integer;
    xresult : integer;
begin
  xresult:=0;
  for i := 1 to Length(HexStr) do
    if HexStr[i] < 'A' then xresult:= xresult* 16 + Ord(HexStr[i]) - 48
                       else xresult:= xresult* 16 + Hex[HexStr[i]];
  result:= intToStr(xresult);

end;

procedure TfrmIFiscal.BitBtn5Click(Sender: TObject);
begin
  T7.Items.Clear();
  //FecharSerial;
  If (AbrirSerial() = True) Then
  BEGIN
    PurgeMessage();
    AddMessageField(pchar('$0001'), 5);//, 1, True);
    AddMessageField(pchar('$0000'), 5);//, 1, False);
    If (SendSerialMessage() = 0) Then
    BEGIN
      Repeat
        iState := GetCommunicationState();
      Until iState = 1;
      if (GetLastCommError() = 0) Then
      BEGIN
        GetMessageField(pchar(retorno1), tamanho, 1);//, 2);
        GetMessageField(pchar(retorno2), tamanho, 2);//, 2);
        GetMessageField(pchar(retorno4), tamanho, 4);//, 2);
        atualizaRetorno('Obtener estado', retorno1, retorno2, retorno4);
      End;
    End;
    //FecharSerial;
  End;
end;

procedure TfrmIFiscal.Button1Click(Sender: TObject);
begin
  edit2.Text:= HextoInt(edit1.Text);
end;

function TfrmIFiscal.AbrirSerial: Boolean;
var iRet:Integer;
var bRetorno:Boolean;
begin
  bRetorno := True;
  try
  iRet := OpenSerialPort(StrToInt(cBoxPuertocomm.Text), StrToInt(cboxBaudRate.Text));
  except
  bRetorno := False;
  end;
  Case iRet of
      0: bRetorno := True;
      1: statusbar1.Panels[0].Text:='Puerto serie ya está abierto.';
      2: statusbar1.Panels[0].Text:='Puerto serial en uso por otra aplicacion.';
      3: statusbar1.Panels[0].Text:='Puerto serial cerrado.';
      4: statusbar1.Panels[0].Text:='Puerto serie utilizado para apertura no existe.';
      5: statusbar1.Panels[0].Text:='Velocidad utilizada para apertura es invalida.';
      Else statusbar1.Panels[0].Text:='Error interno de libreria.';
  End;
  Result := bRetorno;
end;

Procedure TfrmIFiscal.atualizaRetorno(szComando:String; iStatusImpressora:Integer; iStatusFiscal:Integer; iErro:Integer);
  var flagB15, flagB14, flagB12, flagB11, flagB10, flagB09, flagB07:Boolean;
begin
  T1.Text := '';
  T4.Text := '';
  T5.Text := '';
  T6.Text := '';

  //==============================================================================
  //Estado da Impressora
  //==============================================================================
  flagB09 := false;
  flagB10 := false;
  T4.Text := '';
  //****************************************************************************
  //                       TRATAMENTO DO BIT 15                                *
  //****************************************************************************
  If (iStatusImpressora >= 32768) Then
  BEGIN
    T4.Text := 'Impresora(Offline) - ';
    iStatusImpressora := iStatusImpressora - 32768;
  END;

  //****************************************************************************
  //                       TRATAMENTO DO BIT 14                                *
  //****************************************************************************
  If (iStatusImpressora >= 16384) Then
  BEGIN
    T4.Text := T4.Text + 'Error de impresora - ';
    iStatusImpressora := iStatusImpressora - 16384;
  END;

  //****************************************************************************
  //                       TRATAMENTO DO BIT 13                                *
  //****************************************************************************
  If (iStatusImpressora >= 8192) Then
  BEGIN
    T4.Text := T4.Text + 'Tapa impresora abierta - ';
    iStatusImpressora := iStatusImpressora - 8192;
  END;

  //****************************************************************************
  //                       TRATAMENTO DO BIT 12                                *
  //****************************************************************************
  If (iStatusImpressora >= 4096) Then
  BEGIN
    T4.Text := T4.Text + 'Estado de caja registradora = 1 - ';
    iStatusImpressora := iStatusImpressora - 4096;
  END;

  //****************************************************************************
  //                       TRATAMENTO DOS BITS 10 E 9                          *
  //****************************************************************************
  If (iStatusImpressora >= 1024) Then
  BEGIN
    flagB10 := true;
    iStatusImpressora := iStatusImpressora - 1024;
  END;

  If (iStatusImpressora >= 512) Then
  BEGIN
    flagB09 := true;
    iStatusImpressora := iStatusImpressora - 512;
  END;

  If ((flagB10 = True) And (flagB09 = True)) Then
    T4.Text := T4.Text + 'Lectura de MICR - '
  Else If ((flagB10 = True) And (flagB09 = False)) Then
    T4.Text := T4.Text + 'Estacion de Autenticacion (TM-T88IV ) - '
  Else If ((flagB10 = False) And (flagB09 = True)) Then
    T4.Text := T4.Text + 'Verifique la estación - '
  Else If ((flagB10 = False) And (flagB09 = False)) Then
    T4.Text := T4.Text + 'Impresora en linea - ';

  //****************************************************************************
  //                       TRATAMENTO DO BIT 8                                 *
  //****************************************************************************
  If (iStatusImpressora >= 256) Then
  BEGIN
    T4.Text := T4.Text + 'Papel listo para ser retirado - ';
    iStatusImpressora := iStatusImpressora - 256;
  END;

  //****************************************************************************
  //                       TRATAMENTO DO BIT 7                                 *
  //****************************************************************************
  If (iStatusImpressora >= 128) Then
  BEGIN
    T4.Text := T4.Text + 'Recargue la impresora con papel - ';
    iStatusImpressora := iStatusImpressora - 128;
  END;

  //****************************************************************************
  //                       TRATAMENTO DO BIT 6                                 *
  //****************************************************************************
  If (iStatusImpressora >= 64) Then
  BEGIN
    T4.Text := T4.Text + 'Estado de sensor inferior = 1 - ';
    iStatusImpressora := iStatusImpressora - 64;
  END;

  //****************************************************************************
  //                       TRATAMENTO DO BIT 5                                 *
  //****************************************************************************
  If (iStatusImpressora >= 32) Then
  BEGIN
    T4.Text := T4.Text + 'Estado de sensor superior = 1 - ';
    iStatusImpressora := iStatusImpressora - 32;
  END;

  //****************************************************************************
  //                       TRATAMENTO DO BIT 4                                 *
  //****************************************************************************
  If (iStatusImpressora >= 16) Then
  BEGIN
    T4.Text := T4.Text + 'Estado de sensor autenticado = 1 - ';
    iStatusImpressora := iStatusImpressora - 16;
  END;

  //****************************************************************************
  //                       TRATAMENTO DO BIT 3                                 *
  //****************************************************************************
  If (iStatusImpressora >= 8) Then
  BEGIN
    T4.Text := T4.Text + 'Impresora sin papel - ';
    iStatusImpressora := iStatusImpressora - 8;
  END;

  //****************************************************************************
  //                       TRATAMENTO DO BIT 2                                 *
  //****************************************************************************
  If (iStatusImpressora >= 4) Then
  BEGIN
    T4.Text := T4.Text + 'Poco papel - ';
    iStatusImpressora := iStatusImpressora - 4;
  END;

  //****************************************************************************
  //                       TRATAMENTO DO BIT 1                                 *
  //****************************************************************************
  If (iStatusImpressora >= 2) Then
  BEGIN
    T4.Text := T4.Text + 'Impresora sin papel - ';
    iStatusImpressora := iStatusImpressora - 2;
  END;

  //****************************************************************************
  //                       TRATAMENTO DO BIT 0                                 *
  //****************************************************************************
  If (iStatusImpressora >= 1) Then
  BEGIN
    T4.Text := T4.Text + 'Poco papel - ';
  END;

  //==============================================================================
  //Estado fiscal
  //==============================================================================
  flagB15 := false;
  flagB14 := false;
  flagB11 := false;
  flagB10 := false;
  T5.Text := '';

  //****************************************************************************
  //                       TRATAMENTO DOS BITS 15 E 14                         *
  //****************************************************************************
  If (iStatusFiscal >= 32768) Then
  BEGIN
    flagB15 := true;
    iStatusFiscal := iStatusFiscal - 32768;
  END;

  If (iStatusFiscal >= 16384) Then
  BEGIN
    flagB14 := true;
    iStatusFiscal := iStatusFiscal - 16384;
  END;

  If ((flagB15 = True) And (flagB14 = True)) Then
    T5.Text := T5.Text + 'Modo fiscalizacion - '
  Else If ((flagB15 = True) And (flagB14 = False)) Then
    T5.Text := T5.Text + 'Modo de fabrica (No-Fiscalizado ) - '
  Else If ((flagB15 = False) And (flagB14 = False)) Then
    T5.Text := T5.Text + 'Modo bloqueado - ';
  //****************************************************************************

  //****************************************************************************
  //                           TRATAMENTO DO BITS 12                           *
  //****************************************************************************
  If (iStatusFiscal >= 4096) Then
  BEGIN
    T5.Text := T5.Text + 'Impresora en modo intervención técnica - ';
    iStatusFiscal := iStatusFiscal - 4096;
  END
  Else
    T5.Text := T5.Text + 'Modo de operación normal - ';
  //****************************************************************************

  //****************************************************************************
  //                       TRATAMENTO DOS BITS 11 E 10                         *
  //****************************************************************************
  If (iStatusFiscal >= 2048) Then
  BEGIN
    flagB11 := true;
    iStatusFiscal := iStatusFiscal - 2048;
  END;

  If (iStatusFiscal >= 1024) Then
  BEGIN
    flagB10 := true;
    iStatusFiscal := iStatusFiscal - 1024;
  END;

  If ((flagB11 = True) And (flagB10 = True)) Then
    T4.Text := T4.Text + 'Error de lectura/escritura de Memoria Fiscal - '
  Else If ((flagB11 = True) And (flagB10 = False)) Then
    T4.Text := T4.Text + 'Memoria fiscal esta llena - '
  Else If ((flagB11 = False) And (flagB10 = True)) Then
    T4.Text := T4.Text + 'Moria fiscal esta casi por agotar - '
  Else If ((flagB11 = False) And (flagB10 = False)) Then
    T4.Text := T4.Text + 'Memoria Fiscal en operacion normal - ';
  //****************************************************************************

  //****************************************************************************
  //                           TRATAMENTO DO BIT7                              *
  //****************************************************************************
  If (iStatusFiscal >= 128) Then
  BEGIN
    T5.Text := T5.Text + 'Período de ventas abierto - ';
    iStatusFiscal := iStatusFiscal - 128;
  END
  ELSE
    T5.Text := T5.Text + 'Periodo de ventas cerrado - ';
  //****************************************************************************

  //****************************************************************************
  //                       TRATAMENTO DOS BITS 3,2,1 E 0                       *
  //****************************************************************************
  If iStatusFiscal = 9 Then
    T5.Text := T5.Text + 'Chequeo de autenticacion (TMH6000 e TM-T88IV) - '
  Else If iStatusFiscal = 8 Then
    T5.Text := T5.Text + 'Comprobante no fiscal - '
  Else If iStatusFiscal = 4 Then
    T5.Text := T5.Text + 'Informe de Gestion - '
  Else If iStatusFiscal = 3 Then
    T5.Text := T5.Text + 'Estorno de Comprobante de Crédito o Débito - '
  Else If iStatusFiscal = 2 Then
    T5.Text := T5.Text + 'Comprobante de Crédito o Débito - '
  Else If iStatusFiscal = 1 Then
    T5.Text := T5.Text + 'Cupom Fiscal abierto - '
  Else If iStatusFiscal = 0 Then
    T5.Text := T5.Text + 'Documento cerrado - ';
  //****************************************************************************

  //==============================================================================
  //Estado de ejecucion de último comando
  //==============================================================================
  Case iErro of
      $0000: T6.Text := 'Resultado sin error';
      $0001: T6.Text := 'Error interno';
      $0002: T6.Text := 'Error de inicialización del equipo';
      $0003: T6.Text := 'Error de proceso interno';
      $0101: T6.Text := 'Comando inválido para o estado atual';
      $0102: T6.Text := 'Comando inválido para o documento atual';
      $0106: T6.Text := 'Comando aceito apenas fora de intervenção';
      $0107: T6.Text := 'Comando aceito apenas dentro de intervension';
      $0108: T6.Text := 'Comando inválido durante processo de scan';
      $0109: T6.Text := 'Exceso de intervensiones';
      $0201: T6.Text := 'Comando con frame inválido';
      $0202: T6.Text := 'Comando inválido';
      $0203: T6.Text := 'Campos en exceso';
      $0204: T6.Text := 'Campos en defecto';
      $0205: T6.Text := 'Campo não opcional';
      $0206: T6.Text := 'Campo alfanumérico inválido';
      $0207: T6.Text := 'Campo alfabético inválido';
      $0208: T6.Text := 'Campo numérico inválido';
      $0209: T6.Text := 'Campo binário inválido';
      $020A: T6.Text := 'Campo imprimible inválido';
      $020B: T6.Text := 'Campo hexadecimal inválido';
      $020C: T6.Text := 'Campo data inválido';
      $020D: T6.Text := 'Campo hora inválido';
      $020E: T6.Text := 'Campo con atributos de impresion inválidos';
      $020F: T6.Text := 'Campo booleano inválido';
      $0210: T6.Text := 'Campo con tamaño inválido';
      $0211: T6.Text := 'Extension de comando inválida';
      $0212: T6.Text := 'Código de barra no permitido';
      $0213: T6.Text := 'Atributos de impresion no permitidos';
      $0214: T6.Text := 'Atributos de impresion inválidos';
      $0215: T6.Text := 'Código de barras incorretamente definido';
      $0217: T6.Text := 'Comando invalido para a porta seleccionada';
      $0301: T6.Text := 'Erro de hardware';
      $0302: T6.Text := 'Impresora no está lista';
      $0303: T6.Text := 'Error de Impresion';
      $0304: T6.Text := 'Falta de papel';
      $0305: T6.Text := 'Poco papel disponíble';
      $0306: T6.Text := 'Error en carga o expulsion de papel';
      $0307: T6.Text := 'Característica no suportada por impresora';
      $0308: T6.Text := 'Error de display';
      $0309: T6.Text := 'Sequencia de scan inválida';
      $300A: T6.Text := 'Número de área de recorte inválido';
      $300B: T6.Text := 'Scanner no preparado';
      $300C: T6.Text := 'Qualidad de Logotipo no suportada por impresora';
      $030E: T6.Text := 'Erro de leitura do microcódigo';
      $0401: T6.Text := 'Número de série inválido';
      $0402: T6.Text := 'Requer dados de fiscalização já configurados';
      $0501: T6.Text := 'Data / Hora não configurada';
      $0502: T6.Text := 'Data inválida';
      $0503: T6.Text := 'Data em intervalo inválido';
      $0504: T6.Text := 'Nome operador inválido';
      $0505: T6.Text := 'Número de caixa inválido';
      $0508: T6.Text := 'Dados de Cabeçalho ou rodapé inválidos';
      $0509: T6.Text := 'Excesso de fiscalização';
      $500C: T6.Text := 'Número máximo de meios de pagamento já definidos';
      $050D: T6.Text := 'Meio de pagamento já definido';
      $050E: T6.Text := 'Meio de pagamento inválido';
      $050F: T6.Text := 'Descrição do meio de pagamento inválido';
      $0510: T6.Text := 'Valor máximo de desconto inválido';
      $0513: T6.Text := 'Logotipo do usuário inválido';
      $0514: T6.Text := 'Seqüência de logotipo inválido';
      $0515: T6.Text := 'Configuração de display inválida';
      $0516: T6.Text := 'Dados do MICR inválidos';
      $0517: T6.Text := 'Campo de endereço inválido';
      $0518: T6.Text := 'Nome da loja não definido';
      $0519: T6.Text := 'Dados fiscais não definidos';
      $510A: T6.Text := 'Número seqüencial do ECF inválido';
      $510B: T6.Text := 'Simbologia do GT inválida, devem ser todos diferentes';
      $510C: T6.Text := 'Número de CNPJ inválido';
      $051D: T6.Text := 'Senha de fiscalização inválida';
      $051E: T6.Text := 'Último documento debe ser uma redução Z';
      $051F: T6.Text := 'Símbolo da moeda igual ao atualmente cadastrado';
      $0520: T6.Text := 'Identificação da alíquota não cadastrada';
      $0521: T6.Text := 'Alíquota não cadastrada';
      $0601: T6.Text := 'Memória de Fita-detalhe esgotada';
      $0605: T6.Text := 'Número de série invalido para a Memória de Fita-detalhe';
      $0606: T6.Text := 'Memória de Fita-detalhe não iniciada';
      $0607: T6.Text := 'Memória de Fita-detalhe não pode estar iniciada';
      $0608: T6.Text := 'Número de série da Memória de Fita-detalhe não confere';
      $0609: T6.Text := 'Erro Interno na Memória de Fita-detalhe';
      $0701: T6.Text := 'Valor inválido para o número do registro';
      $0702: T6.Text := 'Valor inválido para o número do item';
      $0703: T6.Text := 'Intervalo inválido para a leitura da MFD';
      $0704: T6.Text := 'Número de usuário inválido para MFD';
      $0801: T6.Text := 'Comando inválido com jornada fiscal fechada';
      $0802: T6.Text := 'Comando inválido com jornada fiscal aberta';
      $0803: T6.Text := 'Memória Fiscal esgotada';
      $0804: T6.Text := 'Jornada fiscal deve ser fechada';
      $0805: T6.Text := 'Não há meios de pagamento definidos';
      $0806: T6.Text := 'Excesso de meios de pagamento utilizados na jornada fiscal';
      $0807: T6.Text := 'Jornada fiscal sem movimento de vendas';
      $0808: T6.Text := 'Intervalo de jornada fiscal inválido';
      $0809: T6.Text := 'Existem mais dados para serem lidos';
      $800A: T6.Text := 'Não existem mais dados para serem lidos';
      $800B: T6.Text := 'Não pode abrir jornada fiscal';
      $800C: T6.Text := 'Não pode fechar jornada fiscal';
      $080D: T6.Text := 'Limite máximo do período fiscal atingido';
      $080E: T6.Text := 'Limite máximo do período fiscal não atingido';
      $080F: T6.Text := 'Abertura da jornada fiscal não permitida';
      $0901: T6.Text := 'Valor muito grande';
      $0902: T6.Text := 'Valor muito pequeno';
      $0903: T6.Text := 'Itens em excesso';
      $0904: T6.Text := 'Alíquotas em excesso';
      $0905: T6.Text := 'Desconto ou acréscimos em excesso';
      $0906: T6.Text := 'Meios de pagamento em excesso';
      $0907: T6.Text := 'Item não encontrado';
      $0908: T6.Text := 'Meio de pagamento não encontrado';
      $0909: T6.Text := 'Total nulo';
      $900C: T6.Text := 'Tipo de pagamento não definido';
      $090F: T6.Text := 'Alíquota não encontrada';
      $0910: T6.Text := 'Alíquota inválida';
      $0911: T6.Text := 'Excesso de meios de pagamento com CDC';
      $0912: T6.Text := 'Meio de pagamento com CDC já emitido';
      $0913: T6.Text := 'Meio de pagamento com CDC ainda não emitido';
      $0914: T6.Text := 'Lectura de Memoria Fiscal – intervalo CRZ inválido';
      $0915: T6.Text := 'Lectura da Memória Fiscal – intervalo de data inválido';
      $0A01: T6.Text := 'Operaçoion no permitida após desconto / acréscimo';
      $0A02: T6.Text := 'Operación não permitida após registro de pagamentos';
      $0A03: T6.Text := 'Tipo de item inválido';
      $0A04: T6.Text := 'Linha de descrição em branco';
      $0A05: T6.Text := 'Quantidade muito pequena';
      $0A06: T6.Text := 'Quantidade muito grande';
      $0A07: T6.Text := 'Total do item com valor muito alto';
      $0A08: T6.Text := 'Operación não permitida antes do registro de pagamentos';
      $0A09: T6.Text := 'Registro de pagamento incompleto';
      $0A0A: T6.Text := 'Registro de pagamento finalizado';
      $0A0B: T6.Text := 'Valor pago inválido';
      $0A0C: T6.Text := 'Valor de desconto ou acréscimo não permitido';
      $0A0E: T6.Text := 'Valor não pode ser zero';
      $0A0F: T6.Text := 'Operación não permitida antes do registro de itens';
      $0A11: T6.Text := 'Cancelamento de desconto e acréscimo somente para item atual';
      $0A12: T6.Text := 'Não foi possível cancelar último Cupom Fiscal';
      $0A13: T6.Text := 'Último Cupom Fiscal não encontrado';
      $0A14: T6.Text := 'Último Comprovante Não-Fiscal não encontrado';
      $0A15: T6.Text := 'Cancelamento de CDC necessária';
      $0A16: T6.Text := 'Número de item em Cupom Fiscal inválido';
      $0A17: T6.Text := 'Operación somente permitida após subtotalização';
      $0A18: T6.Text := 'Operación somente permitida durante a venda de itens';
      $0A19: T6.Text := 'Operación não permitida em item com desconto ou acréscimo';
      $0A1A: T6.Text := 'Dígitos de quantidade inválidos';
      $0A1B: T6.Text := 'Dígitos de valor unitário inválido';
      $0A1C: T6.Text := 'Não há desconto ou acréscimo a cancelar';
      $0A1D: T6.Text := 'Não há item para cancelar';
      $0A1E: T6.Text := 'Desconto ou acréscimo somente no item atual';
      $0A1F: T6.Text := 'Desconto ou acréscimo já efetuado';
      $0A20: T6.Text := 'Desconto ou acréscimo nulo não permitido';
      $0A21: T6.Text := 'Valor unitário inválido';
      $0A22: T6.Text := 'Quantidade inválida';
      $0A23: T6.Text := 'Código de item inválido';
      $0A24: T6.Text := 'Descrição inválida';
      $0A25: T6.Text := 'Operación de desconto ou acréscimo não permitida';
      $0A26: T6.Text := 'Mensagem promocional já impressa';
      $0A27: T6.Text := 'Linhas adicionais não podem ser impressas';
      $0A28: T6.Text := 'Dados do consumidor já impresso';
      $0A29: T6.Text := 'Dados do consumidor somente no fim do documento';
      $0A2A: T6.Text := 'Dados do consumidor somente no inicio do documento';
      $0A2B: T6.Text := 'Comando Inválido para o item';
      $0E01: T6.Text := 'Número de linhas em documento excedido';
      $0E02: T6.Text := 'Número do relatório inválido';
      $0E03: T6.Text := 'Operación não permitida após registro de itens';
      $0E04: T6.Text := 'Registro de valor nulo não permitido';
      $0E05: T6.Text := 'Não há desconto a cancelar';
      $0E06: T6.Text := 'Não há acréscimo a cancelar';
      $0E07: T6.Text := 'Operación somente permitida após subtotalização';
      $0E08: T6.Text := 'Operación somente permitida durante registro de itens';
      $0E09: T6.Text := 'Operación não-fiscal inválida';
      $0E0A: T6.Text := 'Último comprovante Não-Fiscal não encontrado';
      $0E0B: T6.Text := 'Meio de pagamento não encontrado';
      $0E0C: T6.Text := 'Não foi possível imprimir nova via';
      $0E0D: T6.Text := 'Não foi possível realizar reimpressão';
      $0E0E: T6.Text := 'Não foi possível imprimir nova parcela';
      $0E0F: T6.Text := 'Não há mais parcelas a imprimir';
      $0E10: T6.Text := 'Registro de item Não-Fiscal inválido';
      $0E11: T6.Text := 'Desconto ou acréscimo já efetuado';
      $0E12: T6.Text := 'Valor de desconto ou acréscimo inválido';
      $0E13: T6.Text := 'Não foi possível cancelar o item';
      $0E14: T6.Text := 'Itens em excesso';
      $0E15: T6.Text := 'Operación Não-Fiscal não cadastrada';
      $0E16: T6.Text := 'Excesso de relatórios / operações não-fiscais cadastradas';
      $0E17: T6.Text := 'Relatório não encontrado';
      $0E18: T6.Text := 'Comando no permitido';
      $0E19: T6.Text := 'Comando no permitido em operações não-fiscais para movimento de monetário';
      $0E1A: T6.Text := 'Comando permitido apenas em operações não-fiscais para movimento de monetário';
      $0E1B: T6.Text := 'Número de parcelas inválido para a emissão de CCD';
      $0E1C: T6.Text := 'Operación não fiscal já cadastrada';
      $0E1D: T6.Text := 'Relatório gerencial já cadastrado';
      $0E1E: T6.Text := 'Relatório Gerencial Inválido';
      $3001: T6.Text := 'Configuração de cheque não registrada';
      $3002: T6.Text := 'Configuração de cheque não encontrada';
      $3003: T6.Text := 'Valor do cheque já impresso';
      $3004: T6.Text := 'Nominal ao cheque já impresso';
      $3005: T6.Text := 'Linhas adicionais no cheque já impresso';
      $3006: T6.Text := 'Documento ya impreso';
      $3007: T6.Text := 'Número máximo de documentos ya impresos';
    Else    T6.Text := 'Error desconocido';
  end;
  //==============================================================================
  T1.Text := szComando;
end;

function TfrmIFiscal.FecharSerial: Boolean;
var iRet:Integer;
var bRetorno:Boolean;
begin
  iRet := CloseSerialPort();
  bRetorno := False;
  Case iRet of
      0: bRetorno := True;
      3: //ShowMessage('Puerto serial esta cerrado.');
      Else ShowMessage('Error interno de libreria abriendo puerto.');
  End;
  Result := bRetorno;
end;

procedure TfrmIFiscal.BitBtn6Click(Sender: TObject);

var szRazaoSocial, szNomeFantasia, szEndereco1, szEndereco2, szEndereco3:String;
var szCNPJ, szIE, szIM, szNumeroECF, szNumeroLoja, szDataFiscalizacao, szNumeroUsuario:String;
var iConta:Integer;
begin
  T7.Items.Clear();
  If (AbrirSerial() = True) Then
  begin
    PurgeMessage();
    AddMessageFieldEx('0507', 4, 1, True);
    AddMessageFieldEx('0000', 4, 1, False);
    If (SendSerialMessage() = 0) Then
    begin
      Repeat
        iState := GetCommunicationState()
      Until iState = 1;
      If (GetLastCommError() = 0) Then
      begin
        GetMessageFieldEx(retorno1, tamanho, 1, 2);
        GetMessageFieldEx(retorno2, tamanho, 2, 2);
        GetMessageFieldEx(retorno4, tamanho, 4, 2);
        If (GetFieldCounter() > 5) Then
        begin
          For iConta := 1 To 40 Do
            szRazaoSocial := szRazaoSocial + ' ';
          For iConta := 1 To 40 Do
            szNomeFantasia := szNomeFantasia + ' ';
          For iConta := 1 To 40 Do
            szEndereco1 := szEndereco1 + ' ';
          For iConta := 1 To 40 Do
            szEndereco2 := szEndereco2 + ' ';
          For iConta := 1 To 40 Do
            szEndereco3 := szEndereco3 + ' ';
          For iConta := 1 To 20 Do
            szCNPJ := szCNPJ + ' ';
          For iConta := 1 To 20 Do
            szIE := szIE + ' ';
          For iConta := 1 To 20 Do
            szIM := szIM + ' ';
          For iConta := 1 To 3 Do
            szNumeroECF := szNumeroECF + ' ';
          For iConta := 1 To 4 Do
            szNumeroLoja := szNumeroLoja + ' ';
          For iConta := 1 To 8 Do
            szDataFiscalizacao := szDataFiscalizacao + ' ';

          szNumeroUsuario := szNumeroUsuario + ' ';

          GetMessageField(PChar(szRazaoSocial), tamanho, 6);
          GetMessageField(PChar(szNomeFantasia), tamanho, 7);
          GetMessageField(PChar(szEndereco1), tamanho, 8);
          GetMessageField(PChar(szEndereco2), tamanho, 9);
          GetMessageField(PChar(szEndereco3), tamanho, 10);
          GetMessageField(PChar(szCNPJ), tamanho, 11);
          GetMessageField(PChar(szIE), tamanho, 12);
          GetMessageField(PChar(szIM), tamanho, 13);
          GetMessageField(PChar(szNumeroECF), tamanho, 14);
          GetMessageField(PChar(szNumeroLoja), tamanho, 15);
          GetMessageField(PChar(szDataFiscalizacao), tamanho, 16);
          GetMessageField(PChar(szNumeroUsuario), tamanho, 17);

          T7.Items.Add('Razon Social: ' + szRazaoSocial);
          T7.Items.Add('RNC: ' + szNomeFantasia);
          T7.Items.Add('Dirección 1: ' + szEndereco1);
          T7.Items.Add('Dirección 2: ' + szEndereco2);
          T7.Items.Add('Dirección 3: ' + szEndereco3);
          T7.Items.Add('CNPJ: ' + szCNPJ);
          T7.Items.Add('IE: ' + szIE);
          T7.Items.Add('IM: ' + szIM);
          T7.Items.Add('Número do ECF: ' + szNumeroECF);
          T7.Items.Add('Número Sucursal: ' + szNumeroLoja);
          T7.Items.Add('Fecha de Fiscalización: ' + szDataFiscalizacao);
          T7.Items.Add('Número do Usuario: ' + szNumeroUsuario);

        end;
      atualizaRetorno('Obtener datos de fiscalizacion', retorno1, retorno2, retorno4);
      end;
    end;
    //FecharSerial();
  end;
end;

procedure TfrmIFiscal.BitBtn7Click(Sender: TObject);
var szData:String;
var szHora:String;
var iConta:Integer;
begin
  T7.Items.Clear();
  If (AbrirSerial() = True) Then
  begin
    PurgeMessage();
    AddMessageFieldEx('0502', 4, 1, True);
    AddMessageFieldEx('0000', 4, 1, False);
    If (SendSerialMessage() = 0) Then
    begin
      Repeat
        iState := GetCommunicationState();
      Until iState = 1;
      If (GetLastCommError() = 0) Then
      begin
        GetMessageFieldEx(retorno1, tamanho, 1, 2);
        GetMessageFieldEx(retorno2, tamanho, 2, 2);
        GetMessageFieldEx(retorno4, tamanho, 4, 2);
        If (GetFieldCounter() > 5) Then
        begin
          For iConta := 1 To 8 Do
            szData := szData + ' ';
          For iConta := 1 To 6 Do
            szHora := szHora + ' ';

          GetMessageField(PChar(szData), tamanho, 6);
          GetMessageField(PChar(szHora), tamanho, 7);

          T7.Items.Add('Data: ' + szData);
          T7.Items.Add('Hora: ' + szHora);

        end;
        atualizaRetorno('Obter a data e hora', retorno1, retorno2, retorno4);
      end;
    end;
    //FecharSerial()
  end;
end;

procedure TfrmIFiscal.BitBtn8Click(Sender: TObject);
var iConta:Integer;
var szRZ:String;
begin
  T7.Items.Clear();
  If (AbrirSerial() = True) Then
  begin
    PurgeMessage();
    AddMessageFieldEx('0801', 4, 1, True);
    //'0001' – Redução Z com ajuste de + ou  - 5 minutos.
    //'0002' – Entrar em horario de verão sem ajuste de + ou - 5 minutos.
    //'0003' – Entrar em horario de verão com ajuste de + ou - 5 minutos.
    //'0004' – Sair do horário de verão sem ajuste de + ou  - 5 minutos.
    //'0005' – Sair do horário de verão com ajuste de + ou  - 5 minutos.
    AddMessageFieldEx('0000', 4, 1, True);
    AddMessageFieldEx('', 0, 2, True);
    AddMessageFieldEx('', 0, 2, False);
    If (SendSerialMessage() = 0) Then
    begin
      Repeat
        iState := GetCommunicationState();
      Until iState = 1;
      If (GetLastCommError() = 0) Then
      begin
        GetMessageFieldEx(retorno1, tamanho, 1, 2);
        GetMessageFieldEx(retorno2, tamanho, 2, 2);
        GetMessageFieldEx(retorno4, tamanho, 4, 2);
        If (GetFieldCounter() > 5) Then
        begin
          For iConta := 1 To 4 Do
            szRZ := szRZ + ' ';

          GetMessageField(PChar(szRZ), tamanho, 6);
          T7.Items.Add('Valor contador cierre Z: ' + szRZ);
        end;
        atualizaRetorno('Cierre Z', retorno1, retorno2, retorno4);
      end;
    end;
    //FecharSerial();
  end;
end;

procedure TfrmIFiscal.BitBtn9Click(Sender: TObject);
var szLX:String;
var iConta:Integer;
begin
  T7.Items.Clear();
  If (AbrirSerial() = True) Then
  begin
    PurgeMessage();
    AddMessageFieldEx('0802', 4, 1, True);
    AddMessageFieldEx('0000', 4, 1, False);
    If (SendSerialMessage() = 0) Then
    begin
      Repeat
        iState := GetCommunicationState();
      Until iState = 1;
      If (GetLastCommError() = 0) Then
      begin
        GetMessageFieldEx(retorno1, tamanho, 1, 2);
        GetMessageFieldEx(retorno2, tamanho, 2, 2);
        GetMessageFieldEx(retorno4, tamanho, 4, 2);
        If (GetFieldCounter() > 5) Then
        begin
          For iConta := 1 To 5 Do
            szLX := szLX + ' ';

          GetMessageField(PChar(szLX), tamanho, 6);
          T7.Items.Add('Numero Cierre X: ' + szLX);
        end;
        atualizaRetorno('Cierre X', retorno1, retorno2, retorno4);
      end;
    end;
    //FecharSerial();
  end;
end;

procedure TfrmIFiscal.BitBtn10Click(Sender: TObject);
begin
T7.Items.Clear();
  If (AbrirSerial() = True) Then
  begin
    PurgeMessage();
    AddMessageFieldEx('0805', 4, 1, True);
    AddMessageFieldEx('0000', 4, 1, False);
    If (SendSerialMessage() = 0) Then
    begin
      Repeat
        iState := GetCommunicationState();
      Until iState = 1;
      If (GetLastCommError() = 0) Then
      begin
        GetMessageFieldEx(retorno1, tamanho, 1, 2);
        GetMessageFieldEx(retorno2, tamanho, 2, 2);
        GetMessageFieldEx(retorno4, tamanho, 4, 2);
        atualizaRetorno('Abrir Jornada Fiscal', retorno1, retorno2, retorno4);
      end;
    end;
    //FecharSerial();
  end;

end;

procedure TfrmIFiscal.BitBtn11Click(Sender: TObject);

var DataJornadaFiscal, HoraJornadaFiscal, DataReducaoZ:String;
var HoraReducaoZ, COOAbertura, COOReducaoZ, NumUltimaZ:String;
var NumReducoesRestantes, PrimeiroCupom, UltimoCupomFiscal:String;
var EstadoJornadaFiscal, PeriodoJornadaFiscal, PermiteAberturaJornada:String;
var TotalPagado : String;
var iConta:Integer;
begin
  T7.Items.Clear();
  If (AbrirSerial() = True) Then
  begin
    PurgeMessage();
    AddMessageFieldEx('080A', 4, 1, True);
    AddMessageFieldEx('0000', 4, 1, False);
    If (SendSerialMessage() = 0) Then
    begin
      Repeat
        iState := GetCommunicationState();
      Until iState = 1;
      If (GetLastCommError() = 0) Then
      begin
        GetMessageFieldEx(retorno1, tamanho, 1, 2);
        GetMessageFieldEx(retorno2, tamanho, 2, 2);
        GetMessageFieldEx(retorno4, tamanho, 4, 2);
        If (GetFieldCounter() > 5) Then
        begin
          For iConta := 1 To 8 Do
            DataJornadaFiscal := DataJornadaFiscal + ' ';
          For iConta := 1 To 6 Do
            HoraJornadaFiscal := HoraJornadaFiscal + ' ';
          For iConta := 1 To 5 Do
            DataReducaoZ := DataReducaoZ + ' ';
          For iConta := 1 To 8 Do
            HoraReducaoZ := HoraReducaoZ + ' ';
          For iConta := 1 To 8 Do
            COOAbertura := COOAbertura + ' ';
          For iConta := 1 To 6 Do
            COOReducaoZ := COOReducaoZ + ' ';
          For iConta := 1 To 6 Do
            NumUltimaZ := NumUltimaZ + ' ';
          For iConta := 1 To 6 Do
            NumReducoesRestantes := NumReducoesRestantes + ' ';
          For iConta := 1 To 6 Do
            PrimeiroCupom := PrimeiroCupom + ' ';
          For iConta := 1 To 6 Do
            UltimoCupomFiscal := UltimoCupomFiscal + ' ';
          For iConta := 1 To 12 Do
            TotalPagado := TotalPagado+ ' ';

          EstadoJornadaFiscal := EstadoJornadaFiscal + ' ';
          PeriodoJornadaFiscal := PeriodoJornadaFiscal + ' ';
          PermiteAberturaJornada := PermiteAberturaJornada + ' ';

          GetMessageField(PChar(DataJornadaFiscal), tamanho, 6);
          GetMessageField(PChar(HoraJornadaFiscal), tamanho, 7);
          GetMessageField(PChar(DataReducaoZ), tamanho, 8);
          GetMessageField(PChar(HoraReducaoZ), tamanho, 9);
          GetMessageField(PChar(COOAbertura), tamanho, 10);
          GetMessageField(PChar(COOReducaoZ), tamanho, 11);
          GetMessageField(PChar(NumUltimaZ), tamanho, 12);
          GetMessageField(PChar(NumReducoesRestantes), tamanho, 13);
          GetMessageField(PChar(PrimeiroCupom), tamanho, 14);
          GetMessageField(PChar(UltimoCupomFiscal), tamanho, 15);
          GetMessageField(PChar(EstadoJornadaFiscal), tamanho, 16);
          GetMessageField(PChar(PeriodoJornadaFiscal), tamanho, 17);
          GetMessageField(PChar(PermiteAberturaJornada), tamanho, 18);
          GetMessageField(PChar(TotalPagado), tamanho, 22);
          GetMessageField(PChar(TotalPagado), tamanho, 19);
          GetMessageField(PChar(TotalPagado), tamanho, 18);
          GetMessageField(PChar(TotalPagado), tamanho, 17);
          GetMessageField(PChar(TotalPagado), tamanho, 16);

          T7.Items.Add('Data da abertura da jornada fiscal: ' + DataJornadaFiscal);
          T7.Items.Add('Hora da abertura da jornada fiscal: ' + HoraJornadaFiscal);
          T7.Items.Add('Fecha emision de cierre Z: ' + DataReducaoZ);
          T7.Items.Add('Hora de cierre Z: ' + HoraReducaoZ);
          T7.Items.Add('COO da abertura do dia: ' + COOAbertura);
          T7.Items.Add('COO da redução Z: ' + COOReducaoZ);
          T7.Items.Add('Número de último cierre Z: ' + NumUltimaZ);
          T7.Items.Add('Número de reduções restantes: ' + NumReducoesRestantes);
          T7.Items.Add('Primer comprobante fiscal: ' + PrimeiroCupom);
          T7.Items.Add('Último comprobante fiscal: ' + UltimoCupomFiscal);
          T7.Items.Add('Estado da jornada fiscal: ' + EstadoJornadaFiscal);
          T7.Items.Add('Período da jornada fiscal: ' + PeriodoJornadaFiscal);
          T7.Items.Add('Fecha termina jornada fiscal: ' + PermiteAberturaJornada);
          T7.Items.Add('Total Pagado: ' + TotalPagado);

        end;
        atualizaRetorno('Informaciones de la jornada fiscal', retorno1, retorno2, retorno4);
      end;
    end;
    //FecharSerial();
  end;
end;

procedure TfrmIFiscal.Abrir1Click(Sender: TObject);
var
  error : integer;
  fvalor : string;
begin
   T7.Items.Clear();
  If (AbrirSerial() = True) Then
  begin
    PurgeMessage();
    {AddMessageFieldEx( szField:PChar;
                  iFieldLength:Integer;
                   uiFieldType:Integer;
                    bSeparator:Boolean)  }
{    fvalor:= '#$0A';
    error:= AddMessageFieldEx(PChar(fvalor), length(fvalor), 1, False);//comando

    fvalor:= '#$01';
    error:= AddMessageFieldEx(PChar(fvalor), length(fvalor), 1, True );//comando
 }
    fvalor:= '0A01';
    error:= AddMessageFieldEx(PChar(fvalor), 4, 1, True );//comando

    if error = 0 then
    error:= AddMessageField(Pchar('0000'), 4);//Extension Bit 0

    //if error = 0 then
    //error:= AddMessageFieldEx(Pchar(fValor), length(fvalor), 1, True);//Extension Bit 0

    fValor:='';
    if error = 0 then
    error:= AddMessageFieldEx(Pchar(fvalor), length(fValor),2,True);//Logo

    fValor:='0001';
    if error = 0 then
    error:= AddMessageFieldEx(Pchar(fValor), length(fValor),2,True);//Numero de sucursal

    fValor:='0001';
    if error = 0 then
    error:= AddMessageFieldEx(Pchar(fValor), length(fValor),2,True);//Numero de caja

    fvalor := '1234567890123456789';
    if error = 0 then
    error:= AddMessageFieldEx(Pchar(fvalor), Length(fvalor), 2, True);//Numero NCF

    fvalor:='Razon Social del Comprador              ';
    if error = 0 then
    error:= AddMessageFieldEx(Pchar(fvalor),length(fvalor), 2, True);//Razon Social Comprador

    fvalor :='44444044444';
    if error = 0 then
    error:= AddMessageFieldEx(Pchar(fvalor), Length(fvalor), 2, True);//RNC del comprador

    fvalor :='0987654321098765432';
    if error = 0 then
    error:= AddMessageFieldEx(Pchar(fvalor), Length(fvalor), 2, False);//NCF Referencia

    if error > 0 then
    begin
      label1.Caption:= '*** Error ***';
      label1.Visible:= True;
      label1.Color:=clRed;
    end;

    //wait
    //esperaEnviocmd;
    error:=SendSerialMessage();

    If ( error = 0) Then
    begin
      Repeat
        iState := GetCommunicationState();
        Application.ProcessMessages;
      Until iState = 1;

      If (GetLastCommError() = 0) Then
      begin
      //GetMessageField  (szField:PChar;  var iFieldLength:Integer;  iAnswerField:Integer):Integer;StdCall; External 'EpsonFiscalProtocol.dll';
      //GetMessageFieldEx( iField:Integer;var iFieldLength:Integer;  iAnswerField:Integer;  iType:Integer):Integer;StdCall; External 'EpsonFiscalProtocol.dll';
        GetMessageFieldEx(retorno1, tamanho, 1, 2);
        GetMessageFieldEx(retorno2, tamanho, 2, 2);
        GetMessageFieldEx(retorno4, tamanho, 4, 2);
        atualizaRetorno('Abrir Comprobante Fiscal', retorno1, retorno2, retorno4);
      end;
    end;
    //FecharSerial();
  end;
end;

procedure TfrmIFiscal.Item1Click(Sender: TObject);

var szNumero:String;
var iConta:Integer;
vfield: string;
begin
  T7.Items.Clear();
  If (AbrirSerial() = True) Then
  begin
    PurgeMessage();
    vfield:='0A02';
    AddMessageField(PAnsiChar(vfield), length(vfield));
    //'0000' – Impressão em 1 linha (se possível).
    //'0001' – Impressão em 2 linhas.
    vfield:='0000';
    AddMessageField(PAnsiChar(vfield), length(vfield));

    AddMessageField(PAnsiChar('0000000000017'), length(vfield));
    AddMessageField(PAnsiChar('Produto teste'), length(vfield));
    AddMessageField(PAnsiChar('2000'), length(vfield));
    AddMessageField(PAnsiChar('PCT'), length(vfield));
    AddMessageField(PAnsiChar('100'), length(vfield));
    AddMessageField(PAnsiChar('N'),length(vfield));

    If (SendSerialMessage() = 0) Then
    begin
      Repeat
          iState := GetCommunicationState();
      Until iState = 1;
      If (GetLastCommError() = 0) Then
      begin
        GetMessageField(PAnsichar(retorno1), tamanho, 1);//, 2);
        GetMessageField(PAnsichar(retorno2), tamanho, 2);//, 2);
        GetMessageField(PAnsichar(retorno4), tamanho, 4);//, 2);
        If (GetFieldCounter() > 5) Then
        begin
          For iConta := 1 To 3 Do
            szNumero := szNumero + ' ';
          GetMessageField(PChar(szNumero), tamanho, 6);
          T7.Items.Add('Numero do Item: ' + szNumero);
        end;
        atualizaRetorno('Vender Item', retorno1, retorno2, retorno4);
      end;
    end;
    //FecharSerial();
  end;
end;

procedure TfrmIFiscal.SubTotal1Click(Sender: TObject);
var Subtotal:String;
var iConta:Integer;
begin
  T7.Items.Clear();
  If (AbrirSerial() = True) Then
  begin
    PurgeMessage();
    AddMessageField(PAnsiChar('0A03'), 4);//, 1, True);
    AddMessageField(PAnsiChar('0000'), 4);//, 1, False);
    If (SendSerialMessage() = 0) Then
    begin
      Repeat
        iState := GetCommunicationState();
      Until iState = 1;
      If (GetLastCommError() = 0) Then
      begin
        GetMessageField(PAnsiChar(retorno1), tamanho, 1);//, 2);
        GetMessageField(PAnsiChar(retorno2), tamanho, 2);//, 2);
        GetMessageField(PAnsiChar(retorno4), tamanho, 4);//, 2);
        If (GetFieldCounter() > 5) Then
        begin
          For iConta := 1 To 13 Do
            Subtotal := Subtotal + ' ';

          GetMessageField(PChar(Subtotal), tamanho, 6);
          T7.Items.Add('Subtotal parcial do cupom fiscal: ' + Subtotal);
        end;
        atualizaRetorno('Subtotal do cupom', retorno1, retorno2, retorno4);
      end;
    end;
    //FecharSerial();
  end;

end;

procedure TfrmIFiscal.Descuentoe1Click(Sender: TObject);
var Subtotal:String;
var iConta:Integer;
begin
  T7.Items.Clear();
  If (AbrirSerial() = True) Then
  begin
    PurgeMessage();
    AddMessageFieldEx('0A04', 4, 1, True);
    //'0000' – Desconto percentual sobre item.
    //'0001' – Acréscimo percentual sobre item.
    //'0002' – Desconto percentual sobre subtotal.
    //'0003' – Acréscimo percentual sobre subtotal.
    //'0004' – Desconto valor sobre item.
    //'0005' – Acréscimo valor sobre item.
    //'0006' – Desconto valor sobre subtotal
    //'0007' – Acréscimo valor sobre subtotal.
    AddMessageFieldEx('0000', 4, 1, True);
    AddMessageFieldEx('1000', 4, 2, False);
    If (SendSerialMessage() = 0) Then
    begin
      Repeat
        iState := GetCommunicationState()
      Until iState = 1;
      If (GetLastCommError() = 0) Then
      begin
        GetMessageFieldEx(retorno1, tamanho, 1, 2);
        GetMessageFieldEx(retorno2, tamanho, 2, 2);
        GetMessageFieldEx(retorno4, tamanho, 4, 2);
        If (GetFieldCounter() > 5) Then
        begin
          For iConta := 1 To 13 Do
            Subtotal := Subtotal + ' ';
          GetMessageField(PChar(Subtotal), tamanho, 6);
          T7.Items.Add('Subtotal parcial do cupom fiscal: ' + Subtotal);
        end;
        atualizaRetorno('Descontos e Acréscimos', retorno1, retorno2, retorno4);
      end;
    end;
    //FecharSerial();
  end;
end;

procedure TfrmIFiscal.RegistrodePago1Click(Sender: TObject);
var szRestante:String;
var szTroco:String;
var iConta:Integer;
begin
  T7.Items.Clear();
  If (AbrirSerial() = True) Then
  begin
    PurgeMessage();
    AddMessageField(PAnsichar('0A05'), 4);//, 1, True);
    AddMessageField(PAnsichar('0000'), 4);//, 1, True);

    AddMessageField(PAnsichar('1'), 1);//, 2, True);
    AddMessageField(PAnsichar('1000'),4);// 4, 2, True);
    AddMessageField(PAnsichar(''), 0);//, 2, True);
    AddMessageField(PAnsichar(''), 0);//, 2, False);
    If (SendSerialMessage() = 0) Then
    begin
      Repeat
        iState := GetCommunicationState();
      Until iState = 1;
      If (GetLastCommError() = 0) Then
      begin
        GetMessageField(PAnsiChar(retorno1), tamanho, 1);//, 2);
        GetMessageField(PAnsiChar(retorno2), tamanho, 2);//, 2);
        GetMessageField(PAnsiChar(retorno4), tamanho, 4);//, 2);
        If (GetFieldCounter() > 5) Then
        begin
          For iConta := 1 To 13 Do
            szRestante := szRestante + ' ';
          For iConta := 1 To 13 Do
            szTroco := szTroco + ' ';

          GetMessageField(PChar(szRestante), tamanho, 6);
          GetMessageField(PChar(szTroco), tamanho, 7);
          T7.Items.Add('Total restante a pagar: ' + szRestante);
          T7.Items.Add('Total do troco: ' + szTroco);
        end;
        atualizaRetorno('Registro de pagamentos', retorno1, retorno2, retorno4);
      end;
    end;
    //FecharSerial();
  end;
end;

procedure TfrmIFiscal.CerrarCuponFiscal1Click(Sender: TObject);
var szNumeroCupomFiscal:String;
var szValorTotal:String;
var szTroco:String;
var iConta:Integer;
begin
  T7.Items.Clear();
  If (AbrirSerial() = True) Then
  begin
    PurgeMessage();
    AddMessageField(PChar('0A06'), 4);//, 1, True);
    //'0000' – Não corta o papel.
    //'0001' – Corta o papel.
    //'000C' – Imprime cupom adicional junto com o cupom fiscal.
    //'000D' – Imprime cupom adicional separado do cupom fiscal.
    AddMessageField(PChar('0001'), 4);//, 1, False);
    If (SendSerialMessage() = 0) Then
    begin
      Repeat
        iState := GetCommunicationState();
      Until iState = 1;
      If (GetLastCommError() = 0) Then
      begin
        GetMessageField(Pchar(retorno1), tamanho, 1);//, 2);
        GetMessageField(Pchar(retorno2), tamanho, 2);//, 2);
        GetMessageField(Pchar(retorno4), tamanho, 4);//, 2);
        If (GetFieldCounter() > 5) Then
        begin
          For iConta := 1 To 11 Do
            szNumeroCupomFiscal := szNumeroCupomFiscal + ' ';
          For iConta := 1 To 13 Do
            szValorTotal := szValorTotal + ' ';
          For iConta := 1 To 13 Do
            szTroco := szTroco + ' ';

          GetMessageField(PChar(szNumeroCupomFiscal), tamanho, 6);
          GetMessageField(PChar(szValorTotal), tamanho, 7);
          GetMessageField(PChar(szTroco), tamanho, 8);
          T7.Items.Add('Número de cupon fiscal: ' + szNumeroCupomFiscal);
          T7.Items.Add('Valor total pago no cupom fiscal: ' + szValorTotal);
          T7.Items.Add('Total de troco: ' + szTroco);
        end;
        atualizaRetorno('CerrarCupon Fiscal', retorno1, retorno2, retorno4);
      end;
    end;
    //FecharSerial();
  end;
end;

procedure TfrmIFiscal.InformacionessobreCuponFiscal1Click(Sender: TObject);
var szCCF, szTotal, szPago, szQtdItensVendidos, szQtdMaximaItens:String;
var szQtdItensRestantes, szQtdAliquotas, szQtdMaximaAliquotas:String;
var szQtdPagtosRegistrados, szQtdMaximaPagtos, szFaseAtual:String;
var iConta:Integer;
begin
  T7.Items.Clear();
  If (AbrirSerial() = True) Then
  begin
    PurgeMessage();
    AddMessageFieldEx('0A0A', 4, 1, True);
    AddMessageFieldEx('0000', 4, 1, False);
    If (SendSerialMessage() = 0) Then
    begin
      Repeat
        iState := GetCommunicationState();
      Until iState = 1;
      If (GetLastCommError() = 0) Then
      begin
        GetMessageFieldEx(retorno1, tamanho, 1, 2);
        GetMessageFieldEx(retorno2, tamanho, 2, 2);
        GetMessageFieldEx(retorno4, tamanho, 4, 2);
        If (GetFieldCounter() > 5) Then
        begin
          For iConta := 1 To 6 Do
            szCCF := szCCF + ' ';
          For iConta := 1 To 13 Do
           szTotal := szTotal + ' ';
          For iConta := 1 To 13 Do
           szPago := szPago + ' ';
          For iConta := 1 To 3 Do
            szQtdItensVendidos := szQtdItensVendidos + ' ';
          For iConta := 1 To 3 Do
            szQtdMaximaItens := szQtdMaximaItens + ' ';
          For iConta := 1 To 3 Do
           szQtdItensRestantes := szQtdItensRestantes + ' ';
          For iConta := 1 To 2 Do
           szQtdAliquotas := szQtdAliquotas + ' ';
          For iConta := 1 To 2 Do
            szQtdMaximaAliquotas := szQtdMaximaAliquotas + ' ';
          For iConta := 1 To 2 Do
            szQtdPagtosRegistrados := szQtdPagtosRegistrados + ' ';
          For iConta := 1 To 2 Do
           szQtdMaximaPagtos := szQtdMaximaPagtos + ' ';
          For iConta := 1 To 2 Do
           szFaseAtual := szFaseAtual + ' ';

          GetMessageField(PChar(szCCF), tamanho, 6);
          GetMessageField(PChar(szTotal), tamanho, 7);
          GetMessageField(PChar(szPago), tamanho, 8);
          GetMessageField(PChar(szQtdItensVendidos), tamanho, 9);
          GetMessageField(PChar(szQtdMaximaItens), tamanho, 10);
          GetMessageField(PChar(szQtdItensRestantes), tamanho, 11);
          GetMessageField(PChar(szQtdAliquotas), tamanho, 12);
          GetMessageField(PChar(szQtdMaximaAliquotas), tamanho, 13);
          GetMessageField(PChar(szQtdPagtosRegistrados), tamanho, 14);
          GetMessageField(PChar(szQtdMaximaPagtos), tamanho, 15);
          GetMessageField(PChar(szFaseAtual), tamanho, 16);

          T7.Items.Add('Contador de cupom fiscal: ' + szCCF);
          T7.Items.Add('Total do cupom fiscal até o momento: ' + szTotal);
          T7.Items.Add('Total pago: ' + szPago);
          T7.Items.Add('Quantidade de itens vendidos: ' + szQtdItensVendidos);
          T7.Items.Add('Quantidade máxima de itens permitida: ' + szQtdMaximaItens);
          T7.Items.Add('Quantidade de itens restantes: ' + szQtdItensRestantes);
          T7.Items.Add('Quantidade de alíquotas registradas: ' + szQtdAliquotas);
          T7.Items.Add('Quantidade máxima de alíquotas disponíveis: ' + szQtdMaximaAliquotas);
          T7.Items.Add('Quantidade de pagamentos registrados: ' + szQtdPagtosRegistrados);
          T7.Items.Add('Quantidade máxima de pagamentos permitidos: ' + szQtdMaximaPagtos);
          T7.Items.Add('Fase atual do cupom fiscal: ' + szFaseAtual);
        end;
        atualizaRetorno('Informações sobre Cupom Fiscal', retorno1, retorno2, retorno4);
      end;
    end;
    //FecharSerial();
  end;
end;

procedure TfrmIFiscal.Cancelaritemparcialmente1Click(Sender: TObject);
var szSubtotal, szValor:String;
var iConta:Integer;
begin
  T7.Items.Clear();
  If (AbrirSerial() = True) Then
  begin
    PurgeMessage();
    AddMessageFieldEx('0A15', 4, 1, True);
    AddMessageFieldEx('0000', 4, 1, True);
    AddMessageFieldEx('1', 1, 2, True);
    AddMessageFieldEx('1000', 4, 2, False);
    If (SendSerialMessage() = 0) Then
    begin
      Repeat
        iState := GetCommunicationState();
      Until iState = 1;
      If (GetLastCommError() = 0) Then
      begin
        GetMessageFieldEx(retorno1, tamanho, 1, 2);
        GetMessageFieldEx(retorno2, tamanho, 2, 2);
        GetMessageFieldEx(retorno4, tamanho, 4, 2);
        If (GetFieldCounter() > 5) Then
        begin
          For iConta := 1 To 13 Do
            szSubtotal := szSubtotal + ' ';
          For iConta := 1 To 13 Do
            szValor := szValor + ' ';

          GetMessageField(PChar(szSubtotal), tamanho, 6);
          GetMessageField(PChar(szValor), tamanho, 7);

          T7.Items.Add('Subtotal parcial do cupom fiscal: ' + szSubtotal);
          T7.Items.Add('Valor cancelado: ' + szValor);
        end;
      atualizaRetorno('Cancelamento parcial de itens', retorno1, retorno2, retorno4);
      end;
    end;
    FecharSerial();
  end;
end;

procedure TfrmIFiscal.Cancelar1Click(Sender: TObject);
var szSubtotal, szValor:String;
var iConta:Integer;
begin
  T7.Items.Clear();
  If (AbrirSerial() = True) Then
  begin
    PurgeMessage();
    AddMessageFieldEx('0A18', 4, 1, True);
    //'0000' – Cancela desconto sobre item.
    //'0001' – Cancela acréscimo sobre item.
    //'0002' – Cancela desconto sobre subtotal.
    //'0003' – Cancela acréscimo sobre subtotal.
    //'0004' – Cancela item.
    //'0008' – Cancela o cupom fiscal.
    AddMessageFieldEx('0008', 4, 1, True);
    AddMessageFieldEx('', 0, 2, False);

    If(SendSerialMessage() = 0) Then
    begin
      Repeat
        iState := GetCommunicationState();
      Until iState = 1;
      If (GetLastCommError() = 0) Then
      begin
        GetMessageFieldEx(retorno1, tamanho, 1, 2);
        GetMessageFieldEx(retorno2, tamanho, 2, 2);
        GetMessageFieldEx(retorno4, tamanho, 4, 2);
        If (GetFieldCounter() > 5) Then
        begin
          For iConta := 1 To 13 Do
            szSubtotal := szSubtotal + ' ';
          For iConta := 1 To 13 Do
            szValor := szValor + ' ';

          GetMessageField(PChar(szSubtotal), tamanho, 6);
          GetMessageField(PChar(szValor), tamanho, 7);

          T7.Items.Add('Subtotal parcial do cupom fiscal: ' + szSubtotal);
          T7.Items.Add('Valor cancelado: ' + szValor);
        end;
        atualizaRetorno('Cancelamentos', retorno1, retorno2, retorno4);
      end;
    end;
    FecharSerial();
  end;
end;

procedure TfrmIFiscal.EnviardatosConsumidor1Click(Sender: TObject);
begin
  T7.Items.Clear();
  If (AbrirSerial() = True) Then
  begin
    PurgeMessage();
    AddMessageFieldEx('0A20', 4, 1, True);
    //'0000' – Apaga dados do consumidor.
    //'0001' – Configura dados do consumidor no inicio do documento.
    //'0002' – Configura dados do consumidor no fim do documento.
    AddMessageFieldEx('0001', 4, 1, True);

    AddMessageFieldEx('00.000.000/0000-00', 18, 2, True);
    AddMessageFieldEx('Nome do consumidor', 18, 2, True);
    AddMessageFieldEx('Endereco 1', 10, 2, True);
    AddMessageFieldEx('Endereco 2', 10, 2, False);

    If (SendSerialMessage() = 0) Then
    begin
      Repeat
        iState := GetCommunicationState();
      Until iState = 1;
      If (GetLastCommError() = 0) Then
      begin
        GetMessageFieldEx(retorno1, tamanho, 1, 2);
        GetMessageFieldEx(retorno2, tamanho, 2, 2);
        GetMessageFieldEx(retorno4, tamanho, 4, 2);
        atualizaRetorno('Enviar dados do Consumidor', retorno1, retorno2, retorno4);
      end;
    end;
    FecharSerial();
  end;
end;

procedure TfrmIFiscal.Enviarlineaadicionalfechadecupon1Click(Sender: TObject);
begin
  T7.Items.Clear();
  If (AbrirSerial() = True) Then
  begin
    PurgeMessage();
    AddMessageFieldEx('0A22', 4, 1, True);
    AddMessageFieldEx('0000', 4, 1, True);

    AddMessageFieldEx('Linha 1', 7, 2, True);
    AddMessageFieldEx('Linha 2', 7, 2, True);
    AddMessageFieldEx('Linha 3', 7, 2, True);
    AddMessageFieldEx('Linha 4', 7, 2, True);
    AddMessageFieldEx('Linha 5', 7, 2, True);
    AddMessageFieldEx('Linha 6', 7, 2, True);
    AddMessageFieldEx('Linha 7', 7, 2, True);
    AddMessageFieldEx('Linha 8', 7, 2, False);

    If (SendSerialMessage() = 0) Then
    begin
      Repeat
        iState := GetCommunicationState();
      Until iState = 1;
      If (GetLastCommError() = 0) Then
      begin
        GetMessageFieldEx(retorno1, tamanho, 1, 2);
        GetMessageFieldEx(retorno2, tamanho, 2, 2);
        GetMessageFieldEx(retorno4, tamanho, 4, 2);
        atualizaRetorno('Enviar linhas adicionais de fechamento de cupom', retorno1, retorno2, retorno4);
      end;
    end;
    FecharSerial();
  end;
end;

procedure TfrmIFiscal.Enviaridentificaciondelaplicativo1Click(Sender: TObject);
begin
  T7.Items.Clear();
  If (AbrirSerial() = True) Then
  begin
    PurgeMessage();
    //t AddMessageFieldEx('0A23', 4, 1, True);
    AddMessageFieldEx('0A0A', 4, 1, True);
    AddMessageFieldEx('0000', 4, 1, True);

    AddMessageFieldEx('Aplicativo', 10, 2, True);
    AddMessageFieldEx('Versao 1.0.0', 12, 2, False);
    If (SendSerialMessage() = 0) Then
    begin
      Repeat
        iState := GetCommunicationState();
      Until iState = 1;
      If (GetLastCommError() = 0) Then
      begin
        GetMessageFieldEx(retorno1, tamanho, 1, 2);
        GetMessageFieldEx(retorno2, tamanho, 2, 2);
        GetMessageFieldEx(retorno4, tamanho, 4, 2);
        atualizaRetorno('Enviar ID del aplicativo', retorno1, retorno2, retorno4);
      end;
    end;
    FecharSerial();
  end;
end;

procedure TfrmIFiscal.CierreZ1Click(Sender: TObject);
begin
//0801
end;

procedure TfrmIFiscal.InformeCierreCajero1Click(Sender: TObject);
begin
//0802
end;

procedure TfrmIFiscal.IniciarInformeX1Click(Sender: TObject);
begin
//0805
end;

procedure TfrmIFiscal.Informacion1Click(Sender: TObject);
begin
//080A
end;

procedure TfrmIFiscal.InformaciondeITBIS1Click(Sender: TObject);
begin
//080B
end;

procedure TfrmIFiscal.InformaciondePagos1Click(Sender: TObject);
begin
  //080C
end;

procedure TfrmIFiscal.Acumuladores1Click(Sender: TObject);
begin
  //0830
  T7.Items.Clear();
  If (AbrirSerial() = True) Then
  begin
    PurgeMessage();
    //t AddMessageFieldEx('0A23', 4, 1, True);
    AddMessageFieldEx('0830', 4, 1, True);
    AddMessageFieldEx('0000', 4, 1, True);

    AddMessageFieldEx('Aplicativo', 10, 2, True);
    AddMessageFieldEx('Version 1.0.0', 12, 2, False);
    If (SendSerialMessage() = 0) Then
    begin
      Repeat
        iState := GetCommunicationState();
      Until iState = 1;
      If (GetLastCommError() = 0) Then
      begin
        GetMessageFieldEx(retorno1, tamanho, 1, 2);
        GetMessageFieldEx(retorno2, tamanho, 2, 2);
        //GetMessageFieldEx(retorno4, tamanho, 4, 2);
        atualizaRetorno('Acumuladores', retorno1, retorno2, retorno4);
      end;
    end;
    FecharSerial();
  end;
end;

procedure TfrmIFiscal.BitBtn12Click(Sender: TObject);
var RazonSocial, rnc, itbis,porcLey,fechafiscalizada : String;
var iConta:Integer;
begin
  T7.Items.Clear();
  If (AbrirSerial() = True) Then
  begin
    PurgeMessage();
    AddMessageFieldEx('0507', 4, 1, True);
    AddMessageFieldEx('0000', 4, 1, False);
    If (SendSerialMessage() = 0) Then
    begin
      Repeat
        iState := GetCommunicationState();
      Until iState = 1;
      If (GetLastCommError() = 0) Then
      begin
        GetMessageFieldEx(retorno1, tamanho, 1, 2);
        GetMessageFieldEx(retorno2, tamanho, 2, 2);
        GetMessageFieldEx(retorno4, tamanho, 4, 2);
        If (GetFieldCounter() > 5) Then
        begin
          For iConta := 1 To 40 Do
            RazonSocial := RazonSocial + ' ';
          For iConta := 1 To 11 Do
            rnc := rnc + ' ';
          For iConta := 1 To 4 Do
            itbis := itbis + ' ';
          For iConta := 1 To 4 Do
            porcLey := porcLey + ' ';
          For iConta := 1 To 8 Do
            fechafiscalizada := fechafiscalizada + ' ';

          GetMessageField(PChar(RazonSocial), tamanho, 1);
          GetMessageField(PChar(rnc), tamanho, 2);
          GetMessageField(PChar(itbis), tamanho, 7);
          GetMessageField(PChar(porcLey), tamanho, 17);
          GetMessageField(PChar(fechafiscalizada), tamanho, 18);

          T7.Items.Add('Razon Social: ' + RazonSocial);
          T7.Items.Add('#RNC: ' + rnc);
          T7.Items.Add('ITBIS: ' + itbis);
          T7.Items.Add('Porc Ley: ' + porcLey);
          T7.Items.Add('Fecha Fiscalizada: ' + fechafiscalizada);
        end;
        atualizaRetorno('Datos de Fiscalizacion', retorno1, retorno2, retorno4);
      end;
    end;
    //if (FecharSerial()) then
    //begin
    //end;
  end;
end;
    {if error = 0 then
    error:= AddMessageFieldEx('', 0, 1, False);//Extension Bit 3
    if error = 0 then
    error:= AddMessageFieldEx('0', 1, 1, False);//Extension Bit 4-5

    if error = 0 then
    error:= AddMessageFieldEx('0', 1, 1, False);//Extension Bit 6-8
    if error = 0 then
    error:= AddMessageFieldEx('', 7, 1, False);//Extension Bit 6-8

    if error = 0 then
    error:= AddMessageFieldEx('001', 3, 1, True);//1 #logo

    if error = 0 then
    error:= AddMessageFieldEx('1', 1, 1, True);//2 Densidad

    if error = 0 then
    error:= AddMessageFieldEx('0001', 4,1, True);//3 Sucursal
    if error = 0 then
    error:= AddMessageFieldEx('0001', 4,1, True);//4 Caja
    if error = 0 then
    error:= AddMessageFieldEx('1234567890123456789', 19, 1, True);//5 NCF
    if error = 0 then
    error:= AddMessageFieldEx('Razon Social Comprador', 40, 2, True);//6 Razon Social Comprador
    if error = 0 then
    error:= AddMessageFieldEx('130411867', 11, 1, True);//7 RNC Comprador
    if error = 0 then
    error:= AddMessageFieldEx('1234567890123456789', 19, 1, False);//8 NCF Referencia
    label1.visible:=false;}
procedure TfrmIFiscal.BitBtn13Click(Sender: TObject);
begin
  FecharSerial;
end;

procedure TfrmIFiscal.Button2Click(Sender: TObject);
var
  error : integer;
  fvalor : string;
begin
   T7.Items.Clear();
  If (AbrirSerial() = True) Then
  begin
    PurgeMessage();
    error:= AddMessageField(Pchar('0A01'), 4);//comando
    if error = 0 then
    error:= AddMessageField(Pchar('0000'), 4);//Extension Bit 0
    if error = 0 then
    error:= AddMessageField(Pchar(''), 0);//Logo

    if error = 0 then
    error:= AddMessageField(Pchar('0001'), 4);//Numero de sucursal

    if error = 0 then
    error:= AddMessageField(Pchar('0001'), 4);//Numero de caja

    fvalor := '1234567890123456789';
    if error = 0 then
    error:= AddMessageField(Pchar(fvalor), Length(fvalor));//Numero NCF

    fvalor:='Razon Social del Comprador';
    if error = 0 then
    error:= AddMessageField(Pchar(fvalor),length(fvalor));//Razon Social Comprador

    fvalor :='44444044444';
    if error = 0 then
    error:= AddMessageField(Pchar(fvalor), Length(fvalor));//RNC del comprador

    fvalor :='0987654321098765432';
    if error = 0 then
    error:= AddMessageField(Pchar(fvalor), Length(fvalor));//NCF Referencia

    if error > 0 then
    begin
      label1.Caption:= '*** Error ***';
      label1.Visible:= True;
      label1.Color:=clRed;
    end;

    //wait
    //esperaEnviocmd;
    error:=SendSerialMessage();

    If ( error = 0) Then
    begin
      Repeat
        iState := GetCommunicationState();
        Application.ProcessMessages;
      Until iState = 1;

      If (GetLastCommError() = 0) Then
      begin
      //GetMessageField  (szField:PChar;  var iFieldLength:Integer;  iAnswerField:Integer):Integer;StdCall; External 'EpsonFiscalProtocol.dll';
      //GetMessageFieldEx( iField:Integer;var iFieldLength:Integer;  iAnswerField:Integer;  iType:Integer):Integer;StdCall; External 'EpsonFiscalProtocol.dll';
        GetMessageField(Pchar(retorno1), tamanho, 1);
        GetMessageField(Pchar(retorno2), tamanho, 2);
        GetMessageField(Pchar(retorno4), tamanho, 4);
        atualizaRetorno('Abrir Comprobante Fiscal', retorno1, retorno2, retorno4);
      end;
    end;
    //FecharSerial();
  end;

end;

end.
