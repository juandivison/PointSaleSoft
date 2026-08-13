unit UFormPagosCombinados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, EditNew, Buttons, DBCtrls, Grids, DBGrids, RXDBCtrl,
  Mask, ExtCtrls, DB, RxMemDS, WinSkinData, RXCtrls, IBCustomDataSet,
  IBTable, RxLookup;

type
  TfrmPagosCombinados = class(TForm)
    Label15: TLabel;
    DBText5: TDBText;
    Label1: TLabel;
    DBText1: TDBText;
    rxCobros: TRxMemoryData;
    rxCobrostotalNeto: TFloatField;
    rxCobrosEfectivo: TFloatField;
    rxCobrosTarjeta: TFloatField;
    rxCobrosCheque: TFloatField;
    rxCobrosBono: TFloatField;
    rxCobrosDiferencia: TCurrencyField;
    dsrxCobros: TDataSource;
    SkinData1: TSkinData;
    tblBancos: TIBTable;
    dstblBancos: TDataSource;
    rxPagos: TRxMemoryData;
    rxPagosSerie: TIntegerField;
    RxDBGrid4: TRxDBGrid;
    DataSource1: TDataSource;
    RxDBLookupCombo4: TRxDBLookupCombo;
    BitBtn1: TBitBtn;
    Panel1: TPanel;
    Label24: TLabel;
    RxDBLookupCombo5: TRxDBLookupCombo;
    Label25: TLabel;
    DBEdit11: TDBEdit;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    Label29: TLabel;
    Label30: TLabel;
    DBEdit15: TDBEdit;
    RxDBLookupCombo6: TRxDBLookupCombo;
    Label31: TLabel;
    RxDBLookupCombo7: TRxDBLookupCombo;
    Label32: TLabel;
    DBEdit16: TDBEdit;
    Label33: TLabel;
    DBEdit17: TDBEdit;
    RxDBGrid6: TRxDBGrid;
    DBStatusLabel5: TDBStatusLabel;
    Label34: TLabel;
    Label35: TLabel;
    BitBtn18: TBitBtn;
    BitBtn19: TBitBtn;
    BitBtn20: TBitBtn;
    BitBtn21: TBitBtn;
    DBRadioGroup1: TDBRadioGroup;
    DBText3: TDBText;
    Label8: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    rxCobrosCoberturaARS: TCurrencyField;
    procedure BitBtn5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure rxCobrosCalcFields(DataSet: TDataSet);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure RxDBLookupCombo4Exit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn18Click(Sender: TObject);
    procedure BitBtn19Click(Sender: TObject);
    procedure BitBtn20Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn21Click(Sender: TObject);
    procedure DBEdit16Exit(Sender: TObject);
    procedure DBEdit13Exit(Sender: TObject);
    procedure DBEdit14Change(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure RxDBLookupCombo5Enter(Sender: TObject);
  private
    { Private declarations }
    function SumapagosTarjeta:String;
    function Montospagados(x:real): extended;
    procedure ActualizarrxCobros(tpago:integer);
    function VerificarDatos(const MontoTotal: Double):Boolean;
    procedure MsgError(msj:string);

  public
    { Public declarations }
    areaTrans : integer;
    PermiteEditar : boolean;
    _TienepagoTarjeta : boolean;
    Function GetMontoNotaCreditoPendiente(_moneda:string; codCte:Integer):Currency;
  end;

var
  frmPagosCombinados: TfrmPagosCombinados;

implementation

uses Uglobal, UDatModConectar, UDatModPagoTarjeta, UProcVentaRapida,
  UDatmodDatosGenerales;

{$R *.dfm}

procedure TfrmPagosCombinados.BitBtn5Click(Sender: TObject);
begin
  if dmPagosTarjeta.tblDetallePagos.State in [dsEdit, dsInsert] then
  begin
    dmPagosTarjeta.tblDetallePagos.Post;
    dmPagosTarjeta.tblDetallePagos.ApplyUpdates;
    if not dmPagosTarjeta.tblDetallePagos.Transaction.InTransaction then
    dmPagosTarjeta.tblDetallePagos.Transaction.StartTransaction;
    try
      dmPagosTarjeta.tblDetallePagos.Transaction.CommitRetaining;
    except
    dmPagosTarjeta.tblDetallePagos.Transaction.RollbackRetaining;
    end;
  end;
  if Not rxPagos.Locate('serie', dmPagosTarjeta.tblDetallePagosSERIE.Value,[]) then
  begin
    rxPagos.Insert;
    rxPagosSerie.Value:= dmPagosTarjeta.tblDetallePagosSERIE.Value;
    rxPagos.Post;
  end;
  actualizarrxCobros(dmpagostarjeta.tblDetallePagosTIPO_PAGO.Value);

end;

function TfrmPagosCombinados.SumapagosTarjeta: String;
var
  monto : extended;
begin
  dmPagosTarjeta.tblDetallePagos.First;
  monto := 0;
  While Not dmPagosTarjeta.tblDetallePagos.eof do
  begin
    //if Not dmPagosTarjeta.tblDetallePagosMONTO_PAGADO.IsNull then
    //monto:=monto + dmPagosTarjeta.tblDetallePagosMONTO_PAGADO.Value;
    rxCobros.Edit;
    case dmPagosTarjeta.tblDetallePagosTIPO_PAGO.Value of
      1, 10, 11 :
      begin
        rxCobrosEfectivo.Value:=rxCobrosEfectivo.Value + dmPagosTarjeta.tblDetallePagosMONTO_PAGADO.Value;
      end; //Efectivo, Cupon, Otro, Nota de Credito
      2, 12, 13  : //tarjeta debito, tarjeta propia
      begin
        rxCobrosTarjeta.Value:=rxCobrosTarjeta.Value + dmPagosTarjeta.tblDetallePagosMONTO_PAGADO.Value;
      end;
      3,20,21  : //tarjeta debito, tarjeta propia
      begin
        rxCobrosCheque.Value:=rxCobrosCheque.Value + dmPagosTarjeta.tblDetallePagosMONTO_PAGADO.Value;
      end;
      9 :
      begin
        rxCobrosBono.Value:=rxCobrosBono.Value + dmPagosTarjeta.tblDetallePagosMONTO_PAGADO.Value;
      end;
      18 :  //cobertura ARS
      begin
        rxCobrosCoberturaARS.Value:=rxCobrosCoberturaARS.Value +
        dmPagosTarjeta.tblDetallePagosMONTO_PAGADO.Value;
      end
    end;
    rxCobros.Post;
    dmPagosTarjeta.tblDetallePagos.Next;
  end;
  result:= Format('%8.2f', [monto]);
end;

procedure TfrmPagosCombinados.FormCreate(Sender: TObject);
begin
  PermiteEditar :=False;
  dmPagosTarjeta.qryTipoPago.close;
  dmPagosTarjeta.qryTipoPago.Open;

  dmPagosTarjeta.tbltipotarjeta.Close;
  dmPagosTarjeta.tbltipotarjeta.Open;
  dmPagosTarjeta.tblProvCobroTarjeta.Close;
  dmPagosTarjeta.tblProvCobroTarjeta.Open;
  tblBancos.Close;
  tblBancos.Open;
end;

procedure TfrmPagosCombinados.BitBtn7Click(Sender: TObject);
begin
  if dmPagosTarjeta.tblDetallePagos.State in [dsEdit, dsInsert] then
  begin
    MessageDlg('Favor guardar datos.',mtError,[mbok],0);
  end;
  //if (EditN2.ValueFloat < StrToFloat(SumapagosTarjeta)) then
  //begin
  //  MessageDlg('Detalles de pagos no cuadra con monto indicado, verifique.',mtError,[mbok],0);
  //  EditN2.SetFocus;
  //end;
  
end;

procedure TfrmPagosCombinados.BitBtn8Click(Sender: TObject);
begin
  if dmPagosTarjeta.tblDetallePagos.State in [dsbrowse] then
  begin
    dmPagosTarjeta.tblDetallePagos.append;
    dmPagosTarjeta.tblDetallePagostipo.Value:=1;//Al Contado
    dmPagosTarjeta.tblDetallePagosFECHA.Value:= ExtraerFecha(GlbFechaTrnDiaria);
    dmPagosTarjeta.tblDetallePagosAREA_TRANS.Value := areaTrans;
    dmPagosTarjeta.tblDetallePagosGlbNumVtaPOS.Value  := GlbNumVtaPOS;
    dmPagosTarjeta.tblDetallePagosMONTO_PAGADO.Value:=rxCobrosTarjeta.Value;
  end;
end;

procedure TfrmPagosCombinados.BitBtn6Click(Sender: TObject);
begin
  if dmPagosTarjeta.tblDetallePagos.State in [dsEdit, dsInsert] then
  dmPagosTarjeta.tblDetallePagos.Cancel;
end;

procedure TfrmPagosCombinados.rxCobrosCalcFields(DataSet: TDataSet);
begin
  rxCobrosDiferencia.Value :=
  ( rxCobrosEfectivo.Value
  + rxCobrosTarjeta.Value
  + rxCobrosCheque.Value
  + rxCobrosCoberturaARS.Value
  + rxCobrosBono.Value ) - rxCobrostotalNeto.Value;
  if rxCobrosDiferencia.Value > 0 then
  dbtext1.Font.Color:= clLime
  else dbtext1.Font.Color:= clRed;
end;

function TfrmPagosCombinados.Montospagados(x:real): extended;
begin
  result :=
  x -
  (rxCobrosEfectivo.Value +
  rxCobrosTarjeta.Value  +
  rxCobrosCheque.Value   +
  rxCobrosCoberturaARS.Value +
  rxCobrosBono.Value);
  if (result < 0.001) then
  result:=0;
end;

procedure TfrmPagosCombinados.BitBtn9Click(Sender: TObject);
begin
  if dmPagosTarjeta.tblDetallePagos.State in [dsbrowse] then
  begin
    dmPagosTarjeta.tblDetallePagos.Insert;
    dmPagosTarjeta.tblDetallePagostipo.Value:=1;//Al Contado
    dmPagosTarjeta.tblDetallePagosFECHA.Value:= ExtraerFecha(GlbFechaTrnDiaria);
    dmPagosTarjeta.tblDetallePagosAREA_TRANS.Value := areaTrans;
    dmPagosTarjeta.tblDetallePagosMONTO_PAGADO.Value:=rxCobrosCheque.Value;
  end;
end;

procedure TfrmPagosCombinados.BitBtn13Click(Sender: TObject);
begin
  if dmPagosTarjeta.tblDetallePagos.State in [dsbrowse] then
  begin
    dmPagosTarjeta.tblDetallePagos.Insert;
    dmPagosTarjeta.tblDetallePagostipo.Value:=1;//Al Contado
    dmPagosTarjeta.tblDetallePagosFECHA.Value:= ExtraerFecha(GlbFechaTrnDiaria);
    dmPagosTarjeta.tblDetallePagosAREA_TRANS.Value := areaTrans;
  end;
end;

procedure TfrmPagosCombinados.BitBtn14Click(Sender: TObject);
begin
  if dmPagosTarjeta.tblDetallePagos.State in [dsEdit, dsInsert] then
  begin
    dmPagosTarjeta.tblDetallePagos.Post;
    dmPagosTarjeta.tblDetallePagos.ApplyUpdates;
    if not dmPagosTarjeta.tblDetallePagos.Transaction.InTransaction then
    dmPagosTarjeta.tblDetallePagos.Transaction.StartTransaction;
    try
      dmPagosTarjeta.tblDetallePagos.Transaction.CommitRetaining;
    except
    dmPagosTarjeta.tblDetallePagos.Transaction.RollbackRetaining;
    end;
  end;
  if Not rxPagos.Locate('serie', dmPagosTarjeta.tblDetallePagosSERIE.Value,[]) then
  begin
    rxPagos.Insert;
    rxPagosSerie.Value:= dmPagosTarjeta.tblDetallePagosSERIE.Value;
    rxPagos.Post;
  end;
  actualizarrxCobros(dmpagostarjeta.tblDetallePagosTIPO_PAGO.Value);

end;

procedure TfrmPagosCombinados.BitBtn10Click(Sender: TObject);
begin
  if dmPagosTarjeta.tblDetallePagos.State in [dsEdit, dsInsert] then
  begin
    dmPagosTarjeta.tblDetallePagos.Post;
    dmPagosTarjeta.tblDetallePagos.ApplyUpdates;
    if not dmPagosTarjeta.tblDetallePagos.Transaction.InTransaction then
    dmPagosTarjeta.tblDetallePagos.Transaction.StartTransaction;
    try
      dmPagosTarjeta.tblDetallePagos.Transaction.CommitRetaining;
    except
    dmPagosTarjeta.tblDetallePagos.Transaction.RollbackRetaining;
    end;
  end;
  if Not rxPagos.Locate('serie', dmPagosTarjeta.tblDetallePagosSERIE.Value,[]) then
  begin
    rxPagos.Insert;
    rxPagosSerie.Value:= dmPagosTarjeta.tblDetallePagosSERIE.Value;
    rxPagos.Post;
  end;
  actualizarrxCobros(dmpagostarjeta.tblDetallePagosTIPO_PAGO.Value);
end;

procedure TfrmPagosCombinados.RxDBLookupCombo4Exit(Sender: TObject);
begin
  rxdblookupcombo5.Enabled:=False;
  DBEdit11.Enabled:=False;
  DBEdit13.Enabled:=False;
  DBEdit12.Enabled:=False;
  DBEdit15.Enabled:=False;
  RxDBLookupCombo6.Enabled:=False;

  if dmPagosTarjeta.tblDetallePagosTIPO_PAGO.Value in [2, 12, 13] then //tarjeta
  begin
    //RxDBLookupCombo1.SetFocus;
    rxdblookupcombo5.Enabled:=True;
    DBEdit11.Enabled:=True;
    DBEdit13.Enabled:=True;
    DBEdit12.Enabled:=True;
    DBEdit15.Enabled:=True;
    RxDBLookupCombo6.Enabled:=True;
    if showing then
    RxDBLookupCombo5.SetFocus;
  end else
  if (dmPagosTarjeta.tblDetallePagosTIPO_PAGO.Value = 3) or
     (dmPagosTarjeta.tblDetallePagosTIPO_PAGO.Value = 20) or
     (dmPagosTarjeta.tblDetallePagosTIPO_PAGO.Value = 21) then //Cheque or transf
  begin
    //RxDBLookupCombo3.SetFocus;
    RxDBLookupCombo7.Enabled:=True;
    if showing then
    RxDBLookupCombo7.Setfocus;
    dbedit16.Enabled:=True;
    //dbedit16.SetFocus;
  end else
  if dmPagosTarjeta.tblDetallePagosTIPO_PAGO.Value in [1,9, 10, 11] then //Cupon, Otro, Nota de Credito
  begin
    if (dmPagosTarjeta.tblDetallePagosTIPO_PAGO.Value = 9) then
    begin
      dbedit17.Enabled:=True;
      if showing then
      dbedit17.SetFocus;
    end else
    if showing then
    dbedit14.SetFocus;
  end;
end;

procedure TfrmPagosCombinados.BitBtn2Click(Sender: TObject);
begin
  if dmPagosTarjeta.tblDetallePagos.State in [dsbrowse] then
  begin
    dmPagosTarjeta.tblDetallePagos.Insert;
    dmPagosTarjeta.tblDetallePagostipo.Value:=1;//Al Contado
    dmPagosTarjeta.tblDetallePagosFECHA.Value:= ExtraerFecha(GlbFechaTrnDiaria);
    dmPagosTarjeta.tblDetallePagosAREA_TRANS.Value := areaTrans;
    dmPagosTarjeta.tblDetallePagosGlbNumVtaPOS.Value  := GlbNumVtaPOS;
  end;
end;

procedure TfrmPagosCombinados.BitBtn3Click(Sender: TObject);
begin
  if dmPagosTarjeta.tblDetallePagos.State in [dsEdit, dsInsert] then
  begin
    dmPagosTarjeta.tblDetallePagos.Post;
    dmPagosTarjeta.tblDetallePagos.ApplyUpdates;
    if not dmPagosTarjeta.tblDetallePagos.Transaction.InTransaction then
    dmPagosTarjeta.tblDetallePagos.Transaction.StartTransaction;
    try
      dmPagosTarjeta.tblDetallePagos.Transaction.CommitRetaining;
    except
    dmPagosTarjeta.tblDetallePagos.Transaction.RollbackRetaining;
    end;
  end;
  if Not rxPagos.Locate('serie', dmPagosTarjeta.tblDetallePagosSERIE.Value,[]) then
  begin
    rxPagos.Insert;
    rxPagosSerie.Value:= dmPagosTarjeta.tblDetallePagosSERIE.Value;
    rxPagos.Post;
  end;
  actualizarrxCobros(dmpagostarjeta.tblDetallePagosTIPO_PAGO.Value);
  //label20.Caption:=SumapagosTarjeta;
end;

procedure TfrmPagosCombinados.BitBtn4Click(Sender: TObject);
begin
  if dmPagosTarjeta.tblDetallePagos.State in [dsEdit, dsInsert] then
  dmPagosTarjeta.tblDetallePagos.Cancel;
end;

procedure TfrmPagosCombinados.actualizarrxCobros(tpago: integer);
var
monto : Extended;
begin
  dmPagosTarjeta.tblDetallePagos.First;
  monto:=0;
  rxCobros.AutoCalcFields:=False;
  rxCobros.Edit;
  rxCobrosEfectivo.Value:=0;
  rxCobrosTarjeta.Value:=0;
  rxCobrosCheque.Value:=0;
  rxCobrosCoberturaARS.Value:=0;
  rxCobrosBono.Value:=0;
  While Not dmPagosTarjeta.tblDetallePagos.Eof do
  begin
    Case tpago Of
    1, 10, 11 :
    begin
      rxCobrosEfectivo.Value:=rxCobrosEfectivo.Value + dmPagosTarjeta.tblDetallePagosMONTO_PAGADO.Value;
    end; //Efectivo, Cupon, Otro, Nota de Credito
    2, 12, 13  : //tarjeta debito, tarjeta propia
    begin
      rxCobrosTarjeta.Value:=rxCobrosTarjeta.Value + dmPagosTarjeta.tblDetallePagosMONTO_PAGADO.Value;
    end;
    3,20,21  : //tarjeta debito, tarjeta propia, or transf, or deposito
    begin
      rxCobrosCheque.Value:=rxCobrosCheque.Value + dmPagosTarjeta.tblDetallePagosMONTO_PAGADO.Value;
    end;
    9 :
    begin
      rxCobrosBono.Value:=rxCobrosBono.Value + dmPagosTarjeta.tblDetallePagosMONTO_PAGADO.Value;
    end;
    18 :
    begin
      rxCobrosCoberturaARS.Value:=rxCobrosCoberturaARS.Value + dmPagosTarjeta.tblDetallePagosMONTO_PAGADO.Value;
    end;
  end;
  monto:=monto + dmPagosTarjeta.tblDetallePagosMONTO_PAGADO.Value;

  dmPagosTarjeta.tblDetallePagos.Next;
  end;
  rxCobros.Post;
  Label35.Caption := Format('%8.2f', [monto]);
  rxCobros.AutoCalcFields:=True;
  {if (abs(monto - rxCobrostotalNeto.Value) > 1) then
  begin
    MessageDlg('No se permite sobrante '+ floatTostr(abs(monto - rxCobrostotalNeto.Value))+' en pagos combinados, verifique',mtError,[mbok],0);
    dmPagosTarjeta.tblDetallePagos.Last;
    dmPagosTarjeta.tblDetallePagos.Delete;
    GlbSalvarQuery(dmPagosTarjeta.tblDetallePagos);
    actualizarrxCobros(dmpagostarjeta.tblDetallePagosTIPO_PAGO.Value);
    if showing then
    DBEdit14.SetFocus;
  end;}
end;

procedure TfrmPagosCombinados.BitBtn18Click(Sender: TObject);
begin
  if dmPagosTarjeta.tblDetallePagos.State = dsbrowse then
  begin
    dmPagosTarjeta.tblDetallePagos.Insert;
    dmPagosTarjeta.tblDetallePagostipo.Value := 1;//Al Contado
    dmPagosTarjeta.tblDetallePagosFECHA.Value:= ExtraerFecha(GlbFechaTrnDiaria);
    dmPagosTarjeta.tblDetallePagosAREA_TRANS.Value := areaTrans;

    dmPagosTarjeta.tblDetallePagosGlbNumVtaPOS.Value  := GlbNumVtaPOS;

    dmPagosTarjeta.tblDetallePagosMONTO_PAGADO.Value:= rxCobrostotalNeto.Value -
    rxCobrosEfectivo.Value - rxCobrosTarjeta.Value - rxCobrosCheque.Value -
    rxCobrosCoberturaARS.Value - rxCobrosBono.Value;

    dmPagosTarjeta.tblDetallePagosPAGO.Value:=0;

    if (dmPagosTarjeta.tblDetallePagosMONTO_PAGADO.Value < 0) then
    dmPagosTarjeta.tblDetallePagosMONTO_PAGADO.Value:=0;
    if showing then
    RxDBLookupCombo4.SetFocus;
  end;
end;

procedure TfrmPagosCombinados.BitBtn19Click(Sender: TObject);
begin
  if dmPagosTarjeta.tblDetallePagos.State in [dsEdit, dsInsert] then
  begin
    _TienepagoTarjeta:=True;
    if (dmPagosTarjeta.tblDetallePagosTIPO_PAGO.Value = 20)
    or (dmPagosTarjeta.tblDetallePagosTIPO_PAGO.Value = 21) then
    begin
      if dmPagosTarjeta.tblDetallePagosNUMERO_CHEQUE.IsNull then
      begin
        MessageDlg('Favor indicar número de transferencia/Dep.', mtError,[mbok],0);
        Exit;
      end else
      if dmPagosTarjeta.tblDetallePagosCOD_BANCO_CHEQUE.IsNull then
      begin
        MessageDlg('Favor indicar banco.', mtError,[mbok],0);
        Exit;
      end;
    end;
    if Not dmPagosTarjeta.tblDetallePagosTIPO_TARJETA.IsNull then
    begin
      if dmPagosTarjeta.tblDetallePagosCODIGO_PROVEEDOR.IsNull and not GLBEsFastFood  then
      begin
        MessageDlg('Favor indicar proveedor tarjeta crédito', mtError,[mbok],0);
        exit;
      end;
      if dmPagosTarjeta.tblDetallePagosNUMERO_TARJETA_CRED.IsNull  and not GLBEsFastFood then
      begin
        MessageDlg('Favor indicar proveedor ult 4 digitos tarjeta crédito', mtError,[mbok],0);
        exit;
      end;
      
      if ((dmPagosTarjeta.tblDetallePagosTIPO_PAGO.Value = 20) or
           (dmPagosTarjeta.tblDetallePagosTIPO_PAGO.Value = 21)) And
         ((dmPagosTarjeta.tblDetallePagosNUMERO_CHEQUE.IsNull) or
           (dmPagosTarjeta.tblDetallePagosNUMERO_CHEQUE.Value = 0) ) then
      begin
        MessageDlg('Favor indicar número de transferencia/Depósito', mtError,[mbok],0);
        if IsShowing then
        DBEdit16.setfocus;
        exit;
      end;
    end;
    dmPagosTarjeta.tblDetallePagos.Post;
    dmPagosTarjeta.tblDetallePagos.ApplyUpdates;
    if not dmPagosTarjeta.tblDetallePagos.Transaction.InTransaction then
    dmPagosTarjeta.tblDetallePagos.Transaction.StartTransaction;
    try
      dmPagosTarjeta.tblDetallePagos.Transaction.CommitRetaining;
    except
    dmPagosTarjeta.tblDetallePagos.Transaction.RollbackRetaining;
    end;
  end;
  if rxPagos.State in [dsEdit, dsInsert, dsBrowse] then
  begin
    if Not rxPagos.Locate('serie', dmPagosTarjeta.tblDetallePagosSERIE.Value,[]) then
    begin
      if dmPagosTarjeta.tblDetallePagosMONTO_PAGADO.Value > 0 then
      begin
        rxPagos.Insert;
        rxPagosSerie.Value:= dmPagosTarjeta.tblDetallePagosSERIE.Value;
        rxPagos.Post;
      end;
    end;
    actualizarrxCobros(dmpagostarjeta.tblDetallePagosTIPO_PAGO.Value);
  end;
  //lbltotalPgoTarjeta.Caption:=SumapagosTarjeta;
end;

procedure TfrmPagosCombinados.BitBtn20Click(Sender: TObject);
begin
  if (dmPagosTarjeta.tblDetallePagos.State in [dsBrowse]) and PermiteEditar then
  dmPagosTarjeta.tblDetallePagos.Edit
  else
  if dmPagosTarjeta.tblDetallePagos.State in [dsEdit, dsInsert] then
  dmPagosTarjeta.tblDetallePagos.Cancel
  else
  begin
    if MessageDlg('Borrar record?', mtWarning,[mbYes,mbno],0) = mryes then
    begin
      if rxPagos.Locate('Serie',dmPagosTarjeta.tblDetallePagosSERIE.Value,[]) then
      rxPagos.Delete;
      dmPagosTarjeta.tblDetallePagos.Delete;
      GlbSalvarQuery(dmPagosTarjeta.tblDetallePagos);
      actualizarrxCobros(dmpagostarjeta.tblDetallePagosTIPO_PAGO.Value);
    end;
  end;
end;

procedure TfrmPagosCombinados.BitBtn1Click(Sender: TObject);
begin
  if rxCobrostotalNeto.Value > rxCobrosDiferencia.Value then
  BitBtn18Click(Self)
  else
  begin
    MessageDlg('Monto pendiente fue saldado, verifique', mtError,[mbOk],0);
  end;
end;

procedure TfrmPagosCombinados.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 116) then
  BitBtn19Click(Self)
  else if (key = 113) then
  BitBtn1Click(Self)
  else if (key = 114) then
  BitBtn21Click(Self)
end;

procedure TfrmPagosCombinados.BitBtn21Click(Sender: TObject);
begin
  if dmPagosTarjeta.tblDetallePagos.State in [dsInsert, dsEdit] then
  begin
     MessageDlg('Transacción activa, verifique', mtError,[mbOk],0);
     exit;
  end else
  if dmPagosTarjeta.tblDetallePagos.State in [dsBrowse] then
  begin
    if rxCobrostotalNeto.Value < rxCobrosDiferencia.Value then
    begin
     MessageDlg('Monto pendiente, verifique', mtError,[mbOk],0);
     exit;
    end;
  end;
end;

procedure TfrmPagosCombinados.DBEdit16Exit(Sender: TObject);
begin
  dbedit14.SetFocus;
  dbedit14.SelectAll;
end;

procedure TfrmPagosCombinados.DBEdit13Exit(Sender: TObject);
begin
  if (dmPagosTarjeta.tblDetallePagosMES_VENCE.Value > 12) Or
  (dmPagosTarjeta.tblDetallePagosMES_VENCE.Value < 1) And (Not dmPagosTarjeta.tblDetallePagosMES_VENCE.IsNull) then
  begin
    MessageDlg('Verificar mes.',mtError,[mbok], 0);
    dbedit13.SetFocus; 
  end;
end;

procedure TfrmPagosCombinados.DBEdit14Change(Sender: TObject);
begin
  if (dmPagosTarjeta.tblDetallePagosTIPO_PAGO.Value = 10) then //Nota de Crdito
  begin
    frmProcVentaRapida.Totales.Edit;
    frmProcVentaRapida.TotalesMontoNotaCredito.Value:=
    GetMontoNotaCreditoPendiente(frmProcVentaRapida.TotalesMoneda.Value,
    frmProcVentaRapida.tablaPropietarioCodigoPropietario.Value) -
    dmPagosTarjeta.tblDetallePagosMONTO_PAGADO.Value;
  end;
  Refresh;
end;

function TfrmPagosCombinados.GetMontoNotaCreditoPendiente(_moneda: string;
  codCte: Integer): Currency;
var
  montoNCR : Currency;
begin
  montoNCR:=0;
  dmDatos.tblDevolucionAbierta.Close;
  dmDatos.tblDevolucionAbierta.Params[0].Value := _moneda;
  dmDatos.tblDevolucionAbierta.Params[1].Value := codCte;
  dmDatos.tblDevolucionAbierta.Open;
  dmDatos.tblDevolucionAbierta.Filtered:=False;
  dmDatos.tblDevolucionAbierta.First;
  While Not dmDatos.tblDevolucionAbierta.Eof do
  begin
    montoNCR:= montoNCR + dmDatos.tblDevolucionAbiertaMONTO_PENDIENTE.Value;
    dmDatos.tblDevolucionAbierta.Next;
  end;
  result:=montoNCR;
  Label11.Caption:= InsertarComa(FloatToStr(montoNCR));
  Refresh;
end;

procedure TfrmPagosCombinados.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose:=True;
  if dmPagosTarjeta.tblDetallePagos.State in [dsInsert, dsEdit] then
  begin
     MessageDlg('Transacción activa, verifique. Cancelar para salir.', mtError,[mbOk],0);
     if showing then
     BitBtn20.SetFocus;
     CanClose:=False;
     exit;
  end;
  if dmPagosTarjeta.tblDetallePagos.RecordCount = 0 then
  begin
    _TienepagoTarjeta:=false;
    rxCobros.EmptyTable;
    CanClose:=True;
  end else
  if (ABS(rxCobrosDiferencia.Value) > 0.50) then
  begin
     //T MessageDlg('Favor verificar pago exacto. ',mtError,[mbok], 0);
     //T CanClose:=False;
  end;
  if (rxCobrostotalNeto.Value > 0) then
  if not VerificarDatos(rxCobrostotalNeto.Value) then CanClose:=False;
end;

procedure TfrmPagosCombinados.RxDBLookupCombo5Enter(Sender: TObject);
begin
  if not dmPagosTarjeta.tblDetallePagosTIPO_PAGO.Value in [2, 12, 13] then //tarjeta
  begin
    MessageDlg('Verifica la forma de pago.',mtError,[mbok], 0);
    RxDBLookupCombo4.SetFocus;
    Exit;
  end;
end;

function TfrmPagosCombinados.VerificarDatos(const MontoTotal: Double):boolean;
var
  TotalPagado: Double;
begin
  TotalPagado := 0;
  dmPagosTarjeta.tblDetallePagos.First;
  result:=False;
  while not dmPagosTarjeta.tblDetallePagos.Eof do
  begin
    // Validación general de monto pagado
    if (dmPagosTarjeta.tblDetallePagosMONTO_PAGADO.IsNull) or 
       (dmPagosTarjeta.tblDetallePagosMONTO_PAGADO.Value <= 0) then
    begin
      MsgError('El monto pagado no puede estar vacío ni ser menor o igual a cero.');
      break;
      // Aquí puedes posicionar el foco donde prefieras, por ejemplo en el grid de montos
      Exit;
    end;

    // Suma para validar al final
    TotalPagado := TotalPagado + dmPagosTarjeta.tblDetallePagosMONTO_PAGADO.Value;

    case dmPagosTarjeta.tblDetallePagosTIPO_PAGO.Value of
      1: // Efectivo
      begin
        // No debe tener datos de tarjeta, aprobación, cheque, banco, etc.
        if (not dmPagosTarjeta.tblDetallePagosTIPO_TARJETA.IsNull) or
           (not dmPagosTarjeta.tblDetallePagosNUMERO_APROBACION.IsNull) or
           (not dmPagosTarjeta.tblDetallePagosNUMERO_CHEQUE.IsNull) then
        begin
          MsgError('Si indicas efectivo, no puedes tener datos de tarjeta ni cheque.');
          break;
          Exit;
        end;
      end;
      20: // Transferencia
      begin
        // No debe tener datos de tarjeta, aprobación, cheque, banco, etc.
        if (dmPagosTarjeta.tblDetallePagosNUMERO_CHEQUE.IsNull) or
           (dmPagosTarjeta.tblDetallePagosCOD_BANCO_CHEQUE.IsNull) then
        begin
          MsgError('Favor completar banco y/o número de transferencia.');
          break;
          Exit;
        end;
      end;
      2, 12, 13, 21: // Tarjeta, Tarjeta Débito, Propia, Travel, etc.
      begin
        // Datos obligatorios para tarjetas
        if (dmPagosTarjeta.tblDetallePagosTIPO_TARJETA.IsNull) or
           (dmPagosTarjeta.tblDetallePagosNUMERO_APROBACION.IsNull) or
           (dmPagosTarjeta.tblDetallePagosNUMERO_TARJETA_CRED.IsNull) then
        begin
          MsgError('Debes indicar todos los datos de la tarjeta (tipo, número y aprobación).');
          break;
          Exit;
        end;
        // No debe tener datos de cheque
        if (not dmPagosTarjeta.tblDetallePagosNUMERO_CHEQUE.IsNull) then
        begin
          MsgError('No puedes ingresar número de cheque para un pago con tarjeta.');
          break;
          Exit;
        end;
      end;
      3: // Cheque
      begin
        // Debe tener número de cheque y banco
        if (dmPagosTarjeta.tblDetallePagosNUMERO_CHEQUE.IsNull) or
           (dmPagosTarjeta.tblDetallePagosCOD_BANCO_CHEQUE.IsNull) then
        begin
          MsgError('Debes indicar el número de cheque y el banco.');
          break;
          Exit;
        end;
        // No debe tener datos de tarjeta
        if (not dmPagosTarjeta.tblDetallePagosTIPO_TARJETA.IsNull) or
            (not dmPagosTarjeta.tblDetallePagosNUMERO_APROBACION.IsNull) then
        begin
          MsgError('No puedes ingresar datos de tarjeta para un pago con cheque.');
          break;
          Exit;
        end;
      end;
      10, 11, 14, 15, 16, 17: // Otros, nota de crédito, etc.
      begin
        // Personaliza si estos requieren datos obligatorios adicionales
        // Ejemplo: si requieren campo de referencia o proveedor
      end;
      // Agrega más casos según tu tabla y lógica de negocio
    end;
    dmPagosTarjeta.tblDetallePagos.Next;
  end;

  // Validación global: total pagado vs monto requerido
  if (Abs(TotalPagado - MontoTotal) > 0.01) then
  begin
    MsgError('La suma de los pagos no coincide con el monto total requerido.');
    // Aquí también puedes colocar el foco donde prefieras
    Exit;
  end;
  result:=True;
end;

procedure TfrmPagosCombinados.MsgError(msj: string);
begin
  MessageDlg(msj,mtError,[mbOk],0);
end;

end.
