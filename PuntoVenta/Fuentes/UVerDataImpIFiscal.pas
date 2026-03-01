unit UVerDataImpIFiscal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, RXDBCtrl;

type
  TfrmInfoParaTicketFiscal = class(TForm)
    RxDBGrid1: TRxDBGrid;
    RxDBGrid2: TRxDBGrid;
    RxDBGrid3: TRxDBGrid;
    RxDBGrid4: TRxDBGrid;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    DataSource4: TDataSource;
    RxDBGrid5: TRxDBGrid;
    DataSource5: TDataSource;
    DataSource6: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInfoParaTicketFiscal: TfrmInfoParaTicketFiscal;

implementation

uses UDatModReportes, UDatModFactura;

{$R *.dfm}

end.
