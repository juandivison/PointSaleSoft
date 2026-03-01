unit UfrmlECF_TIMBRE_LOG;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  ShellAPI, Dialogs, DB, StdCtrls, Buttons, Grids, DBGrids, RxDBCtrl;

type
  TfrmConsultaTimbreEcf = class(TForm)
    dstblECF_TIMBRE_LOG: TDataSource;
    RxDBGrid1: TRxDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    function OpenUrl(const AUrl: string): Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaTimbreEcf: TfrmConsultaTimbreEcf;

implementation

uses UDatModFacturaElectronica;

{$R *.dfm}

procedure TfrmConsultaTimbreEcf.FormCreate(Sender: TObject);
begin
  dmFactElectronica.tblECF_TIMBRE_LOG.close;
  dmFactElectronica.tblECF_TIMBRE_LOG.open;
end;

procedure TfrmConsultaTimbreEcf.BitBtn1Click(Sender: TObject);
begin
  dmFactElectronica.tblECF_TIMBRE_LOG.close;
  dmFactElectronica.tblECF_TIMBRE_LOG.open;
end;

function TfrmConsultaTimbreEcf.OpenUrl(const AUrl: string): Boolean;
var
  r: HINST;
begin
  // "open" usa la asociación por defecto del sistema (navegador)
  r := ShellExecute(0, 'open', PChar(AUrl), nil, nil, SW_SHOWNORMAL);
  Result := r > 32; // >32 = éxito
end;
procedure TfrmConsultaTimbreEcf.BitBtn2Click(Sender: TObject);
begin
  ShellExecute(0, 'open', PChar(dmFactElectronica.tblECF_TIMBRE_LOGURL_IMAGE.Value), nil, nil, SW_SHOWNORMAL);
end;

end.
