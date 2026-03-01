unit UPresentacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, RxGIF, WinSkinData;

type
  TfrmPresentacion = class(TForm)
    Image2: TImage;
    Label1: TLabel;
    Label2: TLabel;
    SkinData1: TSkinData;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
       

var
  frmPresentacion: TfrmPresentacion;

implementation

{$R *.dfm}

procedure TfrmPresentacion.FormCreate(Sender: TObject);
var
  h,m,s,ms:Word;
begin
  DecodeTime(now,h,m,s,ms);
  Case h of
  01..11:label2.Caption:='Buenos dias...';
  12..18:label2.Caption:='Buenas tardes...';
  19..23:label2.Caption:='Buenas noches...';
  end;  
end;

end.
