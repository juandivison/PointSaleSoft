unit uFormRegPagoPrestamo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, rxToolEdit, rxCurrEdit, RXCtrls, DB,
  DBCtrls, EditNew, WinSkinData, Grids, DBGrids, RXDBCtrl, RxMemDS,
  ExtCtrls;

type
  TUFormPgoPrestamo = class(TForm)
    RxLabel1: TRxLabel;
    rxMontoPagado: TRxCalcEdit;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    DataSource1: TDataSource;
    Label9: TLabel;
    edtAbonoACapital: TEditN;
    SkinData1: TSkinData;
    RxDBGrid1: TRxDBGrid;
    rxTotales: TRxMemoryData;
    rxTotalesMontoInteresAPagar: TFloatField;
    rxTotalesCuota: TFloatField;
    rxTotalesMontoxMora: TFloatField;
    RxDBGrid2: TRxDBGrid;
    DataSource2: TDataSource;
    rxTotalesTotalAPagar: TFloatField;
    Shape1: TShape;
    Button1: TButton;
    Label1: TLabel;
    procedure edtAbonoACapitalExit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    procedure ActualizaCuotas;
    { Private declarations }
  public
    { Public declarations }
    Procedure Sumartotales;
    Procedure SaldoAbonoACuota;
  end;

var
  UFormPgoPrestamo: TUFormPgoPrestamo;
  CuotasPagadas : String;
implementation

uses UModPagoCuotas, uglobal, UDatModRecibos;

{$R *.dfm}

{ TUFormPgoPrestamo }

procedure TUFormPgoPrestamo.Sumartotales;
begin
  rxTotales.Close;
  rxTotales.Open;
  rxTotales.Insert;
  rxTotalesMontoInteresAPagar.Value := 0;
  rxTotalesCuota.Value      := 0;
  rxTotalesMontoxMora.Value := 0;
  rxTotalesTotalAPagar.Value := 0;
  rxTotalesCuota.Value       := 0;
  rxTotales.Post;
  dmPagoCuotas.qryDatosPagoCuotas.First;
  While Not dmPagoCuotas.qryDatosPagoCuotas.eof do
  begin
    rxTotales.Edit;
    rxTotalesMontoInteresAPagar.Value := rxTotalesMontoInteresAPagar.Value +
                                         dmPagoCuotas.qryDatosPagoCuotasMONTO_INTERES_APAGAR.Value;
    rxTotalesCuota.Value       := rxTotalesCuota.Value +
                                  dmPagoCuotas.qryDatosPagoCuotasMONTO_CUOTA.Value;
    rxTotalesMontoxMora.Value  := rxTotalesMontoxMora.Value +
                                  dmPagoCuotas.qryDatosPagoCuotasMONTO_APAGAR_PORMORA.Value;
    rxTotalesTotalAPagar.Value := rxTotalesTotalAPagar.Value +
                                  dmPagoCuotas.qryDatosPagoCuotasMONTO_APAGAR_PORMORA.Value +
                                  dmPagoCuotas.qryDatosPagoCuotasMONTO_CUOTA.Value;
    rxTotales.Post;
    dmPagoCuotas.qryDatosPagoCuotas.Next;
  end;
  rxMontoPagado.Value:= rxTotalesTotalAPagar.Value;
end;

procedure TUFormPgoPrestamo.edtAbonoACapitalExit(Sender: TObject);
begin
  //rxMontoPagado.Value:= rxTotalesTotalAPagar.Value + edtAbonoACapital.ValueFloat;
end;

procedure TUFormPgoPrestamo.SaldoAbonoACuota;
begin
  dmPagoCuotas.qryDatosPagoCuotas.First;
  CuotasPagadas:='';
  dmRecibos.tblReciboABONO_A_CUOTAS.Value := rxMontoPagado.Value;
  While Not dmPagoCuotas.qryDatosPagoCuotas.Eof Do
  begin
    CuotasPagadas:=CuotasPagadas + dmPagoCuotas.qryDatosPagoCuotasNUM_CUOTA.AsString+',';

    dmPagoCuotas.qryDatosPagoCuotas.Edit;
    if (rxMontoPagado.Value >= (dmPagoCuotas.qryDatosPagoCuotasMONTO_CUOTA.Value+dmPagoCuotas.qryDatosPagoCuotasMONTO_APAGAR_PORMORA.Value)) then
    begin
      dmPagoCuotas.qryDatosPagoCuotasMONTO_PAGADO.Value :=
      dmPagoCuotas.qryDatosPagoCuotasMONTO_CUOTA.Value;
      if dmPagoCuotas.qryDatosPagoCuotasMONTO_APAGAR_PORMORA.Value > 0 then
      dmPagoCuotas.qryDatosPagoCuotasMONTO_MORA_PAGADO.Value:=
      dmPagoCuotas.qryDatosPagoCuotasMONTO_APAGAR_PORMORA.Value;
      rxMontoPagado.Value:=rxMontoPagado.Value -
      (dmPagoCuotas.qryDatosPagoCuotasMONTO_APAGAR_PORMORA.Value +
      dmPagoCuotas.qryDatosPagoCuotasMONTO_CUOTA.Value);
    end else
    begin
      dmPagoCuotas.qryDatosPagoCuotasMONTO_PAGADO.Value := rxMontoPagado.Value;
    end;
    dmPagoCuotas.qryDatosPagoCuotasSTATUS.Value := 'R';
    dmPagoCuotas.qryDatosPagoCuotas.Post;
    dmPagoCuotas.qryDatosPagoCuotas.ApplyUpdates;
    dmPagoCuotas.qryDatosPagoCuotas.Next;
  end;
  if edtAbonoACapital.ValueFloat > 0 then
  begin
    dmPagoCuotas.qryDatosPagoCuotas.Edit;

    dmPagoCuotas.qryDatosPagoCuotasABONO_EXT_A_CAPITAL.Value := edtAbonoACapital.ValueFloat;
    dmPagoCuotas.qryDatosPagoCuotasSTATUS.Value := 'R';
    dmPagoCuotas.qryDatosPagoCuotas.Post;
    dmPagoCuotas.qryDatosPagoCuotas.ApplyUpdates;
  end;
  dmPagoCuotas.qryDatosPagoCuotas.first;
  While Not dmPagoCuotas.qryDatosPagoCuotas.Eof do
  begin
    ActualizaCuotas;
    dmPagoCuotas.qryDatosPagoCuotas.Next;
  end;
  if Not dmPagoCuotas.qryDatosPagoCuotas.Transaction.InTransaction then
  dmPagoCuotas.qryDatosPagoCuotas.Transaction.StartTransaction;
  try
    dmPagoCuotas.qryDatosPagoCuotas.Transaction.CommitRetaining;
  except
  dmPagoCuotas.qryDatosPagoCuotas.Transaction.RollbackRetaining;
  end;
  if CuotasPagadas<>'' then
  dmRecibos.tblReciboNUM_CUOTA.Value:=CuotasPagadas;
  if CuotasPagadas[Length(CuotasPagadas)]=',' then
  Delete(CuotasPagadas,Length(CuotasPagadas),1);
end;

procedure TUFormPgoPrestamo.ActualizaCuotas;
begin
  dmPagoCuotas.ibstpUpdateCuotas.params[0].Value; //serie_new;
  dmPagoCuotas.ibstpUpdateCuotas.params[1].Value; //numero_new;
  dmPagoCuotas.ibstpUpdateCuotas.params[2].Value; //capital act new;
  dmPagoCuotas.ibstpUpdateCuotas.params[3].Value := 1; //operacion;
  dmPagoCuotas.ibstpUpdateCuotas.params[4].Value := 0;//dmPagoCuotas.qryDatosPagoCuotasSerie.Value; //serie;
  dmPagoCuotas.ibstpUpdateCuotas.params[5].Value := 0;//dmPagoCuotas.qryDatosPagoCuotasNumero.value; //numero;
  dmPagoCuotas.ibstpUpdateCuotas.params[6].Value := dmPagoCuotas.qryDatosPagoCuotasCODIGO_CTE.Value; //codigocte;
  dmPagoCuotas.ibstpUpdateCuotas.params[7].Value := dmPagoCuotas.qryDatosPagoCuotasSerie.Value; //serie_proy;
  dmPagoCuotas.ibstpUpdateCuotas.params[8].Value := dmPagoCuotas.qryDatosPagoCuotasNumero.Value; //numero_proy;
  dmPagoCuotas.ibstpUpdateCuotas.params[9].Value := dmPagoCuotas.qryDatosPagoCuotasNUM_CUOTA.Value; //num cuota proy;
  dmPagoCuotas.ibstpUpdateCuotas.params[10].Value:= ExtraerFecha(GlbFechaTrnDiaria);//dmPagoCuotas.qryDatosPagoCuotasFECHA_REAL_PAGO.Value;//fecha real pago;
  //tabla cuotas
  dmPagoCuotas.ibstpUpdateCuotas.params[11].Value:= dmPagoCuotas.qryDatosPagoCuotasMONTO_CAPITAL_INICIAL.Value;// - dmPagoCuotas.qryDatosPagoCuotasABONO_EXT_A_CAPITAL.Value; //capital_act;
  dmPagoCuotas.ibstpUpdateCuotas.params[12].Value:= dmPagoCuotas.qryDatosPagoCuotasMONTO_CAPITAL_INICIAL.Value; //Capital_ant;
  dmRecibos.tblReciboBALANCE_ANT.Value           := dmPagoCuotas.qryDatosPagoCuotasMONTO_CAPITAL_INICIAL.Value;// - dmPagoCuotas.qryDatosPagoCuotasABONO_EXT_A_CAPITAL.Value; //capital_act;
  dmPagoCuotas.ibstpUpdateCuotas.params[13].Value:= dmPagoCuotas.qryDatosPagoCuotasABONO_EXT_A_CAPITAL.Value;
  dmPagoCuotas.ibstpUpdateCuotas.params[14].Value:= Now; //Fechain;
  dmPagoCuotas.ibstpUpdateCuotas.params[15].Value:= Null; //Fecha Update;
  dmPagoCuotas.ibstpUpdateCuotas.params[16].Value:= VarUsuarioGlb; //Cod Usuario;
  dmPagoCuotas.ibstpUpdateCuotas.params[17].Value:= 'R'; //Status;
  dmPagoCuotas.ibstpUpdateCuotas.ExecProc;
end;

procedure TUFormPgoPrestamo.Button1Click(Sender: TObject);
begin
  //dmpagocuotas.ibstpBuscarBlcAct.Params[2].Value:=640;
  //dmpagocuotas.ibstpBuscarBlcAct.ExecProc;
  //Label1.Caption:= 'Balance Actual '+dmpagocuotas.ibstpBuscarBlcAct.Params[1].AsString +
  //' Num Cuota '+ dmpagocuotas.ibstpBuscarBlcAct.Params[0].AsString;
end;

end.
