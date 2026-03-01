unit USelParamReports;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WinSkinData, StdCtrls, Buttons, ComCtrls;

type
  TfrmParamsReport = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    FechaIni: TDateTimePicker;
    FechaFin: TDateTimePicker;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    SkinData1: TSkinData;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamsReport: TfrmParamsReport;

implementation

uses UDatModUsuarios, uGlobal;

{$R *.dfm}

procedure TfrmParamsReport.FormCreate(Sender: TObject);
begin
  dmUsuarios.tblOficina.Close;
  dmUsuarios.tblOficina.Open;
  FechaIni.DateTime:= GlbFechaTrnDiaria;
  FechaFin.DateTime:= GlbFechaTrnDiaria;
end;

end.
