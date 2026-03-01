unit UDistCuotasFinanc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, RxMemDS, Grids, DBGrids, RXDBCtrl, StdCtrls, Buttons, Mask,
  DBCtrls;

type
  TfrmDistCuotas = class(TForm)
    rxtotales: TRxMemoryData;
    rxtotalesCapital: TFloatField;
    rxtotalesInteres: TFloatField;
    rxtotalesCapitalExtra: TFloatField;
    rxtotalesMora: TFloatField;
    DataSource1: TDataSource;
    rxCuotas: TRxMemoryData;
    rxCuotasMontoCapitalInicial: TCurrencyField;
    rxCuotasMontoCuota: TCurrencyField;
    rxCuotasMontoInteres: TCurrencyField;
    rxCuotasPorcInteres: TFloatField;
    rxCuotasTotalCuota: TCurrencyField;
    rxCuotasNUM_CUOTA: TIntegerField;
    rxCuotasFRECUENCIA_DIAS: TIntegerField;
    rxCuotasFECHA_PAGO_CUOTA: TDateTimeField;
    rxCuotasMONTO_CAPITAL_APAGAR: TCurrencyField;
    RxDBGrid1: TRxDBGrid;
    dsrxCuotas: TDataSource;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    procedure rxCuotasCalcFields(DataSet: TDataSet);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Procedure InsertarCuotas(Cantidad : Integer;MontoCapital:Real;PorcInteres:Real;FECHA_APERTURA:TDatetime;FRECUENCIA_DIAS:Integer);    
  end;

var
  frmDistCuotas: TfrmDistCuotas;

implementation

uses URepTarjeta_dePago;

{$R *.dfm}

{ TfrmDistCuotas }

procedure TfrmDistCuotas.InsertarCuotas(Cantidad : Integer;MontoCapital:Real;
PorcInteres:Real;FECHA_APERTURA:TDatetime;FRECUENCIA_DIAS:Integer);

var
       x : Integer;
   Fecha : TDate;
  xCuota : Integer;
  MontoCapitalInical : Real;
begin
  Fecha := FECHA_APERTURA;
  xCuota := Cantidad;
  rxtotales.Close;
  rxtotales.Open;
  rxtotales.Insert;
  rxtotalesCapital.Value := 0;
  rxtotalesInteres.Value := 0;
  rxtotalesCapitalExtra.Value:=0;
  rxtotalesMora.Value :=0;
  rxTotales.Post;
  MontoCapitalInical:=MontoCapital;
  For x:=1 to Cantidad do
  begin
    rxCuotas.Insert;
    rxCuotasNUM_CUOTA.Value := x;
    rxCuotasMontoCapitalInicial.Value := MontoCapital;
    Fecha := Fecha + FRECUENCIA_DIAS;
    rxCuotasFECHA_PAGO_CUOTA.Value := Fecha;

    //MontoCapital := MontoCapitalInical / xCuota;

    if (xCuota > 0) then
    begin
      rxCuotasMONTO_CAPITAL_APAGAR.Value := (MontoCapital / Cantidad);
      rxCuotasMontoInteres.Value := MontoCapital * (PorcInteres/100);
      rxCuotasMontoCuota.Value   := rxCuotasMONTO_CAPITAL_APAGAR.Value +  MontoCapital * (PorcInteres/100);
      //if (x = Cantidad) then
      //begin
      //  rxCuotasMONTO_CAPITAL_APAGAR.Value := MontoCapital;
      //  rxCuotasMontoCuota.Value:= MontoCapital + rxCuotasMONTO_CAPITAL_APAGAR.Value * (PorcInteres/100);
      //end;
    end;
    rxTotales.Edit;
    rxtotalesCapital.Value:= rxtotalesCapital.Value + rxCuotasMONTO_CAPITAL_APAGAR.Value;
    rxtotalesInteres.Value:= rxtotalesInteres.Value +
                             rxCuotasMontoInteres.Value;
                           
    {rxtotalesCapitalExtra.Value:= rxtotalesCapitalExtra.Value +
                                  dmPagos.tblPagosABONO_EXT_A_CAPITAL.Value;}
    rxCuotas.Post;
    rxTotales.Post;
    xCuota:=xCuota - 1;
  end;
  rxCuotas.SortOnFields('NUM_CUOTA',true,false);
end;

procedure TfrmDistCuotas.rxCuotasCalcFields(DataSet: TDataSet);
begin
  rxCuotasTotalCuota.Value:= rxCuotasMONTO_CAPITAL_APAGAR.Value + rxCuotasMontoInteres.Value;
end;

procedure TfrmDistCuotas.BitBtn1Click(Sender: TObject);
var
  renova : String;
  cc : integer;
begin
  {if (dmPagos.tblPagosTIPO_INTERES.Value = 2) then
  begin
    dmPagos.tblPagos.Last;
    cc:=dmPagos.tblPagosNUM_CUOTA.Value - 1;
    dmPagos.tblPagos.Prior;
    renova:=IntToStr(cc) + ' PAGOS '+dmPrestamo.tblFrecPagosDESCRIPCION.Value + ' DE: '+ dmPagos.tblPagosMONTO_CUOTA.AsString +
    ' Ultimo pago de ';
    dmPagos.tblPagos.Last;
    renova:=renova+dmPagos.tblPagosMONTO_CUOTA.AsString;
  end;}
  qckRepTarjetaDePago:=TqckRepTarjetaDePago.Create(Nil);
  try
    //qckRepTarjetaDePago.QRLabel24.Caption:=renova;
    qckRepTarjetaDePago.QRLabel24.Caption:=''; 
    qckRepTarjetaDePago.Preview;
  finally
  qckRepTarjetaDePago.Free;
  qckRepTarjetaDePago:=Nil;
  end;
end;

procedure TfrmDistCuotas.FormCreate(Sender: TObject);
begin
  rxCuotas.Close;
  rxCuotas.Open;
end;

end.
