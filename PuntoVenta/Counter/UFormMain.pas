unit UFormMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WinSkinData, Menus, ImgList, ComCtrls, ToolWin;

type
  TfrmMain = class(TForm)
    SkinData1: TSkinData;
    MainMenu1: TMainMenu;
    Operaciones1: TMenuItem;
    Salir1: TMenuItem;
    Ventas1: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ImageList1: TImageList;
    procedure Salir1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.Salir1Click(Sender: TObject);
begin
  Application.Terminate;
end;

end.
