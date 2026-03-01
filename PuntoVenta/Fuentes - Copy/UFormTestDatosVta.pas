unit UFormTestDatosVta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, RXDBCtrl;

type
  TfrmDatosVtaTest = class(TForm)
    RxDBGrid1: TRxDBGrid;
    RxDBGrid2: TRxDBGrid;
    RxDBGrid3: TRxDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDatosVtaTest: TfrmDatosVtaTest;

implementation

uses UFormVentaRapidaPOS;

{$R *.dfm}

procedure TfrmDatosVtaTest.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Hide;
end;

end.
