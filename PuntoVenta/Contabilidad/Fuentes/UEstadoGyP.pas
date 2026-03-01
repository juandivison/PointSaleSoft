unit UEstadoGyP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, RxMemDS, ComCtrls, Grids, DBGrids, RXDBCtrl, StdCtrls,
  Buttons, EditNew, DBCtrls, ExtCtrls, IBCustomDataSet, IBQuery,
  WinSkinData;

type
  TfrmEstadoGyP = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    Label4: TLabel;
    Label5: TLabel;
    dbdif1: TDBText;
    Label6: TLabel;
    dtpkFecha: TDateTimePicker;
    edtTipoCta: TEditN;
    EditN2: TEditN;
    GroupOpciones: TGroupBox;
    rdgMensual: TRadioButton;
    RadioButton2: TRadioButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    DataSource1: TDataSource;
    RxDBGrid1: TRxDBGrid;
    ProgressBar1: TProgressBar;
    DataSource2: TDataSource;
    rxResultado: TRxMemoryData;
    rxResultadoDEBITO: TFloatField;
    rxResultadoCREDITO: TFloatField;
    rxResultadoRESULTADO: TFloatField;
    Query1: TIBQuery;
    rxEgYp: TRxMemoryData;
    rxEgYpFECHA: TDateField;
    rxEgYpCTA1: TStringField;
    rxEgYpCTA2: TStringField;
    rxEgYpCTA3: TStringField;
    rxEgYpDEBITO: TFloatField;
    rxEgYpCREDITO: TFloatField;
    rxEgYpNOMBRE_CTA: TStringField;
    rxEgYpRESULTADO: TFloatField;
    SkinData1: TSkinData;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure CalcularEstado;
    procedure EstadoMensual;
    procedure EstadoAcumulado;
    procedure Insertar;
    procedure Editar;
  public
    { Public declarations }
  end;

var
  frmEstadoGyP: TfrmEstadoGyP;
  totalcredito: real;
  totaldebito:real;
  resultado:real;

implementation

uses UDmRep, UGlobal, URepEstadoGyP, UDatModControl;

{$R *.dfm}

procedure TfrmEstadoGyP.BitBtn3Click(Sender: TObject);
begin
  totalcredito:=0;
  totaldebito:=0;
  resultado:=0;
  dtmodrep.qryEGyP.Close;
  dtmodrep.qryEGyP.Params[0].Value := ExtraerFecha(Dtpkfecha.date);
  dtmodrep.qryEGyP.Open;
  ProgressBar1.Max:= dtmodrep.qryEGyP.recordcount;
  ProgressBar1.position:=0;
  CalcularEstado;
  rxegyp.SortOnFields('cta1;cta2;cta3',true,false);
  rxresultado.Close;
  rxresultado.EmptyTable;
  rxresultado.Open;
  rxresultado.Insert;
  rxresultadodebito.Value   := totaldebito;
  rxresultadocredito.Value  := totalcredito;
  rxResultadoRESULTADO.value:= totaldebito - totalcredito;
  rxresultado.Post;
  rxdbgrid1.Enabled:=true;
  rxdbgrid1.Refresh;
end;

procedure TfrmEstadoGyP.BitBtn1Click(Sender: TObject);
begin
    qckEGyP:=TqckEGyP.Create(nil);
    try
      if messageDlg('Imprimir?', mtinformation, [mbyes, mbno],0)= mryes then
      begin
        qckEGyP.PrinterSetup;
        qckEGyP.print;
      end else
      qckEGyP.preview;
    finally
    qckEGyP.free;
    qckEGyP:=nil;
    end;
end;

procedure TfrmEstadoGyP.CalcularEstado;
begin
  rxegyp.close;
  rxegyp.EmptyTable;
  rxegyp.Open;
  dtmodrep.qryEGyP.First;
  rxdbgrid1.Enabled:=false;
  Boo_auxiglb:=False;//Acumulado;
  while not dtmodrep.qryegyp.Eof do
  begin
    if rdgmensual.Checked then
    begin
      Boo_auxiglb:=True;//Mensual;
      if (dtmodrep.qryEGyPCUENTA1.value > '399') and
         (dtmodrep.qryEGyPCUENTA1.value < '500') then
      begin
        EstadoMensual;
      end else
      if (dtmodrep.qryEGyPCUENTA.value > 499 ) and
         (dtmodrep.qryEGyPCUENTA1.value < '700') then
      begin
        EstadoMensual;
      end;
    end else
    begin
      if (dtmodrep.qryEGyPCUENTA1.value > '399') and
         (dtmodrep.qryEGyPCUENTA1.value < '500') then
      begin
        EstadoAcumulado;
      end else
      if (dtmodrep.qryEGyPCUENTA.value > 499) and
         (dtmodrep.qryEGyPCUENTA1.value < '700') then
      begin
        EstadoAcumulado;
      end;
    end;
    ProgressBar1.StepIt;
    dtmodrep.qryEGyP.next;
  end;
  ProgressBar1.position:=0;
  rxdbgrid1.enabled:=true;
end;

procedure TfrmEstadoGyP.Editar;
begin
  //dtmodrep.qryEGyPVALORC
    rxegyp.Edit;
    rxegypcta1.Value:=dtmodrep.qryegypcuenta1.value;
    rxegypcta2.Value:=dtmodrep.qryegypcuenta2.value;
    rxegypcta3.Value:=dtmodrep.qryegypcuenta3.value;
    rxEgYpNOMBRE_CTA.value:= dtmodrep.qryegypnombre_cta.value;
    if dtmodrep.qryEGyPSIGNO_CTA.Value = 1 then
    begin
      resultado:= dtmodrep.qryEGyPVALORd.VAlue - dtmodrep.qryEGyPVALORC.Value;
      if resultado < 0 then
      Begin
        rxEgYpDEBITO.Value:=0;
        Resultado:= Resultado * -1;
        rxEgYpCREDITO.Value:=resultado;
        TotalCredito:=totalcredito + resultado;
      end else
      begin
        rxEgYpCREDITO.Value:=0;
        rxEgYpDEBITO.Value:=resultado;
        TotalDebito:=totaldebito + resultado;
      end;
    end else
    begin
      if dtmodrep.qryEGyPSIGNO_CTA.Value = 2 then
      begin
        resultado:= dtmodrep.qryEGyPVALORC.Value - dtmodrep.qryEGyPVALORD.Value;
        if resultado < 0 then
        Begin
          rxEgYpcredito.value:=0;
          Resultado:= Resultado * -1;
          rxEgYpDEBITO.Value:=resultado;
          TotalDebito:=totalDebito+ resultado;
        end else
        begin
          rxEgYpdebito.Value:=0;
          rxEgYpcredito.Value:=resultado;
          TotalCredito:=totalcredito+ resultado;
        end;
    end;
  end;
end;

procedure TfrmEstadoGyP.EstadoAcumulado;
begin
  if not rxEgYp.locate('CTA1;cta2;cta3',vararrayof([
     dtmodrep.qryegypcuenta1.value,
     dtmodrep.qryegypcuenta2.value,
     dtmodrep.qryegypcuenta3.value]),[]) then
  begin
    rxegyp.Insert;
    rxegypcta1.Value:=dtmodrep.qryegypcuenta1.Value;
    rxegypcta2.Value:=dtmodrep.qryegypcuenta2.Value;
    rxegypcta3.Value:=dtmodrep.qryegypcuenta3.Value;
    rxEgYpNOMBRE_CTA.Value:= dtmodrep.qryegypnombre_cta.Value;
    if dtmodrep.qryEGyPSIGNO_CTA.Value = 1 then //db
    begin
      //resultado:= dtmodrep.qryEGyPDB_ACUM.Value - dtmodrep.qryEGyPCR_ACUM.Value;
      resultado:= dtmodrep.qryEGyPvalord.Value - dtmodrep.qryEGyPvalorc.Value;
      if Resultado < 0 then
      Begin
        //Resultado:= Resultado * -1;
        rxEgYpDEBITO.Value:=0;
        rxEgYpCREDITO.Value:=Abs(resultado);
        TotalCredito:=Totalcredito + Abs(resultado);
      end else
      begin
        rxEgYpCREDITO.Value:= 0;
        rxEgYpDEBITO.Value := Resultado;
        TotalDebito:=Totaldebito + Resultado;
      end;// if resultado < 0
      rxegyp.Post;
    end else //si db
    if dtmodrep.qryEGyPSIGNO_CTA.Value = 2 then
    begin
      resultado:= dtmodrep.qryEGyPvalorc.Value - dtmodrep.qryEGyPvalord.Value;
      if resultado < 0 then
      Begin
        //Resultado:= Resultado * -1;
        rxEgYpDEBITO.Value:=Abs(resultado);
        TotalDebito:=totalDebito+ Abs(resultado);
        rxEgYpcredito.value:=0;
      end else
      begin
        rxEgYpdebito.Value:=0;
        rxEgYpcredito.Value:=resultado;
        Totalcredito:=totalcredito+ resultado;
      end;
      rxegyp.Post;
    end;
  end;
end;

procedure TfrmEstadoGyP.EstadoMensual;
var
  resultado:real;
begin
  if not rxEgYp.locate('CTA1;cta2;cta3',vararrayof([
     dtmodrep.qryegypcuenta1.value,
     dtmodrep.qryegypcuenta2.value,
     dtmodrep.qryegypcuenta3.value]),[]) then
    Insertar
  else Editar;
  rxegyp.post;
end;

procedure TfrmEstadoGyP.Insertar;
begin
  rxegyp.Insert;
  rxegypcta1.Value:=dtmodrep.qryegypcuenta1.value;
  rxegypcta2.Value:=dtmodrep.qryegypcuenta2.value;
  rxegypcta3.Value:=dtmodrep.qryegypcuenta3.value;
  rxEgYpNOMBRE_CTA.value:= dtmodrep.qryegypnombre_cta.value;
  if dtmodrep.qryEGyPSIGNO_CTA.Value = 1 then
  begin
    resultado:= dtmodrep.qryEGyPVALORd.VAlue - dtmodrep.qryEGyPVALORC.Value;
    if resultado < 0 then
    Begin
      rxEgYpDEBITO.Value:=0;
      Resultado:= Resultado * -1;
      rxEgYpCREDITO.Value:=resultado;
      TotalCredito:=totalcredito + resultado;
    end else
    begin
      rxEgYpCREDITO.Value:=0;
      rxEgYpDEBITO.Value:=resultado;
      TotalDebito:=totaldebito + resultado;
    end;
  end else
  begin
    if dtmodrep.qryEGyPSIGNO_CTA.Value = 2 then
    begin
      resultado:= dtmodrep.qryEGyPVALORC.Value - dtmodrep.qryEGyPVALORD.Value;
      if resultado < 0 then
      Begin
        rxEgYpcredito.value:=0;
        Resultado:= Resultado * -1;
        rxEgYpDEBITO.Value:=resultado;
        TotalDebito:=totalDebito+ resultado;
      end else
      begin
        rxEgYpdebito.Value:=0;
        rxEgYpcredito.Value:=resultado;
        TotalCredito:=totalcredito+ resultado;
      end;
    end;
  end;
end;

procedure TfrmEstadoGyP.FormCreate(Sender: TObject);
begin
  dmControl.qrycontrolMaster.Close;
  dmControl.qrycontrolMaster.Filtered := False;
  dmControl.qrycontrolMaster.Params[0].Value:=1;//// Transacciones contables
  dmControl.qrycontrolMaster.Params[1].Value:=0;//SubSistema
  dmControl.qrycontrolMaster.Params[2].Value:=1;//Cod_cia
  dmControl.qrycontrolMaster.Open;

  dtpkfecha.Date:= ExtraerFecha(dmControl.qrycontrolMasterFECHA_ACT.Value);
  dmControl.qrycontrolMaster.close;
end;

end.
