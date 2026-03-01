unit uLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, DBCtrls, Buttons, WinSkinData;

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
    SkinData1: TSkinData;
    ComboBox1: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

uses uGlobal, UDatModUsuarios;

{$R *.dfm}

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
  dmUsuarios.qryUsuarios.close;
  dmUsuarios.qryUsuarios.open;
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
  Label4.Caption:= GLBRUTADB;
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

end.
