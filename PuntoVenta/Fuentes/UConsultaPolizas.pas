unit UConsultaPolizas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, RxDBCtrl, StdCtrls, Buttons;

type
  TfrmConsultaPolizas = class(TForm)
    dsqryRepCertificadoSam: TDataSource;
    RxDBGrid1: TRxDBGrid;
    BitBtn1: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaPolizas: TfrmConsultaPolizas;

implementation

uses UDatModClientes;

{$R *.dfm}

{
  if (dmClientes.qryRepCertificadoSamFECHAFIN.Value < now) then
  BackGround:=$000080FF;

}
end.
