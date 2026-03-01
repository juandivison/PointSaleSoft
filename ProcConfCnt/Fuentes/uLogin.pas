unit uLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, DBCtrls, Buttons, WinSkinData, RXCtrls;

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
    RxLabel1: TRxLabel;
    RxLabel2: TRxLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
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
   RxLabel2.Caption := GLBRUTADB;
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
  edit1.SetFocus;
end;

end.
