unit UPresentacionA;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RXCtrls, ExtCtrls, StdCtrls;

type
  TfrmPresentacion = class(TForm)
    Image1: TImage;
    RxLabel1: TRxLabel;
    Label1: TLabel;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPresentacion: TfrmPresentacion;

implementation

uses UDatModConectar, UDatModuloActivos;

{$R *.DFM}

procedure TfrmPresentacion.FormCreate(Sender: TObject);
begin
  timer1.Enabled:=true;
  if StrToInt(formatDatetime('HH',now)) < 05 then
  RxLabel1.Caption:='BUENOS DIAS'
  ELSE
  if StrToInt(formatDatetime('HH',now)) < 17 then
  RxLabel1.Caption:='BUENAS TARDES'
  else
  RxLabel1.Caption:='BUENAS NOCHES';
end;

procedure TfrmPresentacion.Timer1Timer(Sender: TObject);
var
x:integer;
begin
  if (timer1.tag mod 2) = 1 then
     label1.Color := clYellow
  else
     label1.Caption:='Loading...';
  timer1.Tag:=timer1.Tag + 1;
end;

procedure TfrmPresentacion.FormDestroy(Sender: TObject);
begin
  timer1.Enabled:=false;
end;

end.
