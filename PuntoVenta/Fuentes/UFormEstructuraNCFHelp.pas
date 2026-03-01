unit UFormEstructuraNCFHelp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  ShellApi, Dialogs, ExtCtrls, RXCtrls, WinSkinData, jpeg;

type
  TfrmHelpNCF = class(TForm)
    Image1: TImage;
    RxLabel1: TRxLabel;
    Image2: TImage;
    procedure RxLabel1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHelpNCF: TfrmHelpNCF;

implementation

{$R *.dfm}

procedure TfrmHelpNCF.RxLabel1Click(Sender: TObject);
begin
 ShellExecute(Handle, 
               'open',
               PChar(RxLabel1.Caption),
               nil,
               nil,
               SW_SHOW);
end;

end.
