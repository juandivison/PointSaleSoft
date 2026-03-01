unit UHistoricoActivos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, ExtCtrls, Grids, DBGrids, RXDBCtrl, EditNew;

type
  TfrmHistoricoActivo = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    dtpkfechaIni: TDateTimePicker;
    btnProcesar: TBitBtn;
    BitBtn1: TBitBtn;
    RxDBGrid1: TRxDBGrid;
    dtpkfechafin: TDateTimePicker;
    Label2: TLabel;
    edtTipo: TEditN;
    edtCodigo: TEditN;
    Label3: TLabel;
    Label4: TLabel;
    procedure btnProcesarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHistoricoActivo: TfrmHistoricoActivo;

implementation
uses UDatModuloActivos, UGlobalActivos; 
{$R *.DFM}

procedure TfrmHistoricoActivo.btnProcesarClick(Sender: TObject);
begin
  dm.qryHistoricoActivos.Close;
  dm.qryHistoricoActivos.Filtered:= False;
  dm.qryHistoricoActivos.Params[0].Value := ExtraerFecha(dtpkfechaini.Datetime);
  dm.qryHistoricoActivos.Params[1].Value := ExtraerFecha(dtpkfechafin.Datetime);

  if (edttipo.ValueInteger > 0) and  (edtCodigo.Valueinteger > 0 ) then
  begin
    //dm.qryHistoricoActivos.Filter:='Tipo = ' + edtTipo.Text+ ' And Codigo = ' + edtCodigo.Text
    dm.activoTipo  := edtTipo.Text;
    dm.activoCodigo:= edtCodigo.Text;
  end else
  if (edttipo.ValueInteger > 0) then
  begin
    //dm.qryHistoricoActivos.Filter:='Tipo = ' + edtTipo.Text;
    dm.activoCodigo := '';
    dm.activoTipo  := edtTipo.Text;
  end
  else if (edtCodigo.Valueinteger > 0 ) then
  begin
    //dm.qryHistoricoActivos.Filter:='Codigo = ' + edtCodigo.Text;
    dm.activoCodigo := edtCodigo.Text;
    dm.activoTipo   := '';
  end;
  if (edttipo.ValueInteger > 0) or (edtCodigo.Valueinteger > 0 ) then
  dm.qryHistoricoActivos.Filtered:= True;
  dm.qryHistoricoActivos.open;
end;

end.
