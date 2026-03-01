unit uLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, DBCtrls, Buttons, WinSkinData, RXCtrls,
  Gradiente, jpeg;

type
  TfrmLogin = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Edit1: TEdit;
    Edit2: TEdit;
    SkinData1old: TSkinData;
    RxLabel1: TRxLabel;
    Label3: TLabel;
    ComboBox1: TComboBox;
    Label4: TLabel;
    ComboBox2: TComboBox;
    SkinData1: TSkinData;
    Gradiente1: TGradiente;
    Gradiente2: TGradiente;
    Label5: TLabel;
    Label6: TLabel;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure DetectaMayuscula;
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;
   k: TKeyboardState;
   
implementation

uses uGlobal, UDatModUsuarios, UDatModCompania;

{$R *.dfm}

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
  DetectaMayuscula;
  //Edit3.Text := IntToStr(k[VK_SCROLL]);

  dmUsuarios.qryUsuarios.Close;
  dmUsuarios.qryUsuarios.Open;

  dmUsuarios.tblOficina.Close;
  dmUsuarios.tblOficina.Open;

  dmCompania.tblCompania.Close;
  dmCompania.tblCompania.Open;
  dmCompania.tblCompania.First;
  ComboBox2.Clear;
  While Not dmCompania.tblCompania.Eof Do
  begin
    ComboBox2.Items.Add(dmCompania.tblCompaniaNOMBRE.Value);
    dmCompania.tblCompania.Next;
  end;
  ComboBox2.ItemIndex:=0;
  ComboBox2Change(Self);

  dmUsuarios.tblOficina.close;
  dmUsuarios.tblOficina.open;
  dmUsuarios.tblOficina.first;
  ComboBox1.Clear;
  While Not dmUsuarios.tblOficina.Eof Do
  begin
    ComboBox1.Items.Add(dmUsuarios.tblOficinaDESCRIPCION.Value);
    dmUsuarios.tblOficina.next;
  end;
  ComboBox1.ItemIndex:=0;
  ComboBox1Change(Self);
  Label5.Visible:=False;
  if GlbModoHistorico then
  begin
    Gradiente1.ColorDesde:= clRed;
    Gradiente2.ColorDesde:= clRed;
    Label5.Caption:='*DB Historico';
      Label5.Visible:=True;
    Label5.BringToFront;
  end;
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
  edit1.SetFocus;
end;

procedure TfrmLogin.ComboBox1Change(Sender: TObject);
begin
  if dmUsuarios.tblOficina.Locate('DESCRIPCION',ComboBox1.Text,[]) then
  begin
    GlbCodOficina:= dmUsuarios.tblOficinaCodigo.Value;
    GlbCodCiudad := dmUsuarios.tblOficinaCODIGO_CIUDDAD.Value;
  end else
  MessageDlg('Oficina Seleccionada no existe, verifique',mtInformation, [mbOK], 0);
end;

procedure TfrmLogin.ComboBox2Change(Sender: TObject);
begin
  if dmCompania.tblCompania.Locate('NOMBRE',ComboBox2.Text,[]) then
  GlbCodigoCia:= dmCompania.tblCompaniaCODIGO.Value;
  GLBCODIGO_CIA:=GlbCodigoCia; 
  glbCia_Key:=GlbCodigoCia;
end;

procedure TfrmLogin.Edit1Exit(Sender: TObject);
begin
  GlbUsuarioLogueado:= Edit1.Text;
end;

procedure TfrmLogin.DetectaMayuscula;
var KeyState: TKeyboardState;
begin
  GetKeyboardState(KeyState) ;
 if (KeyState[VK_CAPITAL] = 1) then
  Label6.Caption :='CapsLK ON'
  else Label6.Caption:='';
end;

procedure TfrmLogin.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);

begin
  if Key = VK_CAPITAL then
  //ShowMessage('Caps Lock Pressed');
  DetectaMayuscula;
end;

end.
