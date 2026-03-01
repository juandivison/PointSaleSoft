unit URepCajaGeneral;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFormProcCuadreCaja, UGetDateTipoM, IBCustomDataSet, IBTable,
  WinSkinData, DB, RxMemDS, Grids, DBGrids, RXDBCtrl, ComCtrls, DBCtrls,
  ExtCtrls, RxLookup, rxToolEdit, StdCtrls, Buttons, Mask, RXCtrls;

type
  TfrmCuadreCajaRepGen = class(TfrmCuadreCaja)
    Label62: TLabel;
    DBDateEdit2: TDBDateEdit;
    rxCuadreFechaFinal: TDateTimeField;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCuadreCajaRepGen: TfrmCuadreCajaRepGen;

implementation

{$R *.dfm}

procedure TfrmCuadreCajaRepGen.FormCreate(Sender: TObject);
begin
  //inherited;
    tblMoneda.Close;
  tblMoneda.Open;
  dmUsuarios.qryUsuarios.Close;
  dmUsuarios.qryUsuarios.Open;
  dmUsuarios.qryUsuarios.First;
  rxCuadre.Close;
  rxCuadre.Open;
  rxTotales.Close;
  rxTotales.Open;
  rxSubtotal_1.Close;
  rxSubtotal_1.Open;
  rxSubtotal_1.Insert;
  rxSubtotal_1SubTotalVtaCredito.Value:=0;
  if GlbColegio= 1 then
  Panel1.Visible:= False
  else
  Panel1.Visible:= True;
  DateTimePicker2.Date:=GlbFechaTrnDiaria - 30;
  DateTimePicker3.Date:=GlbFechaTrnDiaria;

end;

end.
