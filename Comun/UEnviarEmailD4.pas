unit UEnviarEmailD4;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Psock, NMsmtp, StdCtrls, Buttons, ExtCtrls;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    LabelStatus: TLabel;
    edtFrom: TEdit;
    MemoBody: TMemo;
    BitBtn6: TBitBtn;
    edtTo: TEdit;
    edtNombreEnvia: TEdit;
    NMSMTP1: TNMSMTP;
    OpenDialog1: TOpenDialog;
    procedure BitBtn6Click(Sender: TObject);
    procedure NMSMTP1ConnectionFailed(Sender: TObject);
    procedure NMSMTP1Connect(Sender: TObject);
    procedure NMSMTP1Success(Sender: TObject);
    procedure NMSMTP1Disconnect(Sender: TObject);
    procedure NMSMTP1SendStart(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

   FfileName:String;
   FDirectorioAct:String;
   FfileExt:String;
   Conectado : Boolean;
   cont : Integer = 0;
   xVeces : Integer = 0;
  
implementation

{$R *.DFM}

procedure TForm1.BitBtn6Click(Sender: TObject);
function IsEMail(EMail: string): Boolean;
  var
    s: string;
    ETpos: Integer;
  begin
    ETpos := pos('@', EMail);
    if ETpos > 1 then
    begin
      s := copy(EMail, ETpos + 1, Length(EMail));
      if (pos('.', s) > 1) and (pos('.', s) < length(s)) then
        Result := True
      else
        Result := False;
    end
    else
      Result := False;
  end;

begin
//  if opendialog1.Execute then
//  FfileName:=opendialog1.FileName;
  if not IsEMail(edtFrom.Text) then edtfrom.SetFocus;
  if not IsEMail(edtTo.Text) then edtto.SetFocus;
  NMSMTP1.Host:= 'mx1.hotmail.com';

  NMSMTP1.Connect; //para que se conecte
  NMSMTP1.PostMessage.FromAddress := edtFrom.Text;  //Direccion de quien envia
  NMSMTP1.PostMessage.FromName    := edtNombreEnvia.Text; //Nombre de quien lo envia

  NMSMTP1.PostMessage.Subject     := 'Capacitación Informática'; //el tema
  NMSMTP1.PostMessage.ToAddress.Add(edtTo.Text); //Email de destino
  NMSMTP1.PostMessage.ToCarbonCopy.add('nosivid@hotmail.com');

  NMSMTP1.PostMessage.Date:=FormatDatetime('mm-dd-yyyy hh:mm',date);
  NMSMTP1.PostMessage.LocalProgram:='Idesi';
//  NMSMTP1.PostMessage.Attachments.Add(FfileName); //Los attachments si quieren lo pueden colocar en un listbox ya que asi se pueden mandar varios
  NMSMTP1.PostMessage.Body.Assign(MemoBody.Lines);  //El mensaje cuerpo
  NMSMTP1.SendMail;  //enviar mail
  NMSMTP1.Disconnect;
end;

procedure TForm1.NMSMTP1ConnectionFailed(Sender: TObject);
begin
  Conectado:=False;
  MessageDlg('Conección falló, verifique conección a Internet',mterror,[mbok],0);
end;

procedure TForm1.NMSMTP1Connect(Sender: TObject);
begin
  Conectado:=True;
end;

procedure TForm1.NMSMTP1Success(Sender: TObject);
begin
  LabelStatus.Caption := 'Success...';
end;

procedure TForm1.NMSMTP1Disconnect(Sender: TObject);
begin
  LabelStatus.Caption := 'Desconectado...';
end;

procedure TForm1.NMSMTP1SendStart(Sender: TObject);
begin
  LabelStatus.Caption := 'Enviando email...';
end;

end.
