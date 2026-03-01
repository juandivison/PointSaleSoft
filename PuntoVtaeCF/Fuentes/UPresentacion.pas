unit UPresentacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, RXCtrls, RxGIF, WinSkinData, jpeg;

type
  TfrmPresentacion = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    RxLabel1: TRxLabel;
    Image1: TImage;
    Label3: TLabel;
    RxLabel2: TRxLabel;
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
