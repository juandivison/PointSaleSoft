unit UFormRepVentaDet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls;

type
  TfrmReporteVentaDet = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    FechaIni: TDateTimePicker;
    FechaFin: TDateTimePicker;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReporteVentaDet: TfrmReporteVentaDet;

implementation

uses UDatModReportes;

{$R *.dfm}

procedure TfrmReporteVentaDet.BitBtn1Click(Sender: TObject);
begin
  dmReportes.qryRepLibroVentaDet.Close;
  dmReportes.qryRepLibroVentaDet.Open;
end;

end.
