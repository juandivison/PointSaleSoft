unit URecibosYCtaXCobrar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, IBCustomDataSet, IBQuery, Grids, DBGrids,
  DBCtrls, Buttons, WinSkinData, EditNew, RxMemDS, Mask, RxLookup;

type
  TFrmRecibosYCtaXCobrar = class(TForm)
    Edit1: TEdit;
    RadioGroup1: TRadioGroup;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    qryDatosBlcCxc: TIBQuery;
    dsqryDatosBlcCxc: TDataSource;
    DBGrid1: TDBGrid;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBText4: TDBText;
    DBText5: TDBText;
    DBText6: TDBText;
    Label9: TLabel;
    DBText7: TDBText;
    Label10: TLabel;
    DBText8: TDBText;
    BitBtn2: TBitBtn;
    Label11: TLabel;
    DBMemo1: TDBMemo;
    dsqryFactPend: TDataSource;
    Label12: TLabel;
    SkinData1: TSkinData;
    qryFactPend: TIBQuery;
    edtMontoAplicar: TEditN;
    Label13: TLabel;
    rxFormaPago: TRxMemoryData;
    rxFormaPagoformaPago: TSmallintField;
    rxFormaPagoNumeroDocumento: TStringField;
    rxFormaPagoNumeroTarjeta: TStringField;
    rxFormaPagoTipoTarjeta: TSmallintField;
    rxFormaPagoProveedorTarjeta: TSmallintField;
    rxFormaPagoNumeroAutorizacion: TStringField;
    rxFormaPagoMes: TSmallintField;
    rxFormaPagoAnio: TSmallintField;
    dsrxFormaPago: TDataSource;
    BitBtn1: TBitBtn;
    rxFormaPagoMONTOAUTORIZADO: TFloatField;
    qryDatosBlcCxcCODIGO_CTE: TIntegerField;
    qryDatosBlcCxcNOMBRE_CTE: TIBStringField;
    qryDatosBlcCxcNOMBRE_EMPRESA: TIBStringField;
    qryDatosBlcCxcTIPO_CLIENTE: TSmallintField;
    qryDatosBlcCxcCEDULA: TIBStringField;
    qryDatosBlcCxcRNC_NUMERO: TIBStringField;
    qryDatosBlcCxcCOMENTARIO: TMemoField;
    qryDatosBlcCxcBALANCE_ACT: TFloatField;
    qryDatosBlcCxcDESCRIPCION: TIBStringField;
    qryFactPendMONTO_US: TFloatField;
    qryFactPendFECHA: TDateTimeField;
    qryFactPendTIPO: TIntegerField;
    qryFactPendNUMERO_FACT: TIntegerField;
    qryFactPendMONTO_PENDIENTE: TFloatField;
    qryFactPendSTATUS: TIBStringField;
    qryFactPendCODIGO_CTE: TIntegerField;
    qryFactPendNOMBRE_EMPRESA: TIBStringField;
    qryFactPendNOMBRE_PERSONAL: TIBStringField;
    qryFactPendDESCTIPO: TStringField;
    qryFactPendMONEDA: TIBStringField;
    Label14: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label15: TLabel;
    Label16: TLabel;
    DBEdit2: TDBEdit;
    edtNumFact: TEditN;
    procedure RadioGroup1Enter(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure qryFactPendCalcFields(DataSet: TDataSet);
    procedure qryFactPendFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure edtMontoAplicarExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    xNumeroFact : Integer;
    CerrarVentana : Boolean;
  end;
                       
var
  FrmRecibosYCtaXCobrar: TFrmRecibosYCtaXCobrar;

implementation

uses UDatModConectar, UDatModCxc, UDatmodDatosGenerales, UPagoFacturas,
  UDetalleFormaDePago, UDatModIngresos, URepReciboIngreso, UDatModUsuarios, uGlobal,
  UDatModPagoTarjeta, UDatModCompania, URepReciboAbonoCXC;

{$R *.dfm}

procedure TFrmRecibosYCtaXCobrar.RadioGroup1Enter(Sender: TObject);
begin
  Case RadioGroup1.ItemIndex of
  0:begin
      Label2.Caption := RadioGroup1.Items.Names[0];
    end;
  1:begin
      Label2.Caption := RadioGroup1.Items.Names[1];
    end;
  2:begin
      Label2.Caption := RadioGroup1.Items.Names[2];
    end;
  3:begin
      Label2.Caption := RadioGroup1.Items.Names[3];
    end;
  end;
end;

procedure TFrmRecibosYCtaXCobrar.Edit1Change(Sender: TObject);
          procedure MostrarDatos(x:Boolean);
          begin
            if x then
            begin
              dbText1.DataField:='CEDULA';
              dbText2.DataField:='CODIGO_CTE';
              //dbText3.DataField:='PASAPORTE';
              dbText4.DataField:='NOMBRE_CTE';
              //dbText5.DataField:='APELLIDO';
              dbText6.DataField:='NOMBRE_EMPRESA';
              dbText7.DataField:='DESCRIPCION';
              dbText8.DataField:='BALANCE_ACT';
              qryFactPend.Filtered:=True;
            end else
            begin
              dbText1.DataField:='';
              dbText2.DataField:='';
              dbText3.DataField:='';
              dbText4.DataField:='';
              dbText5.DataField:='';
              dbText6.DataField:='';
              dbText7.DataField:='';
              dbText8.DataField:='';
              qryFactPend.Filtered:= False;
            end;
          end;
begin
  if RadioGroup1.ItemIndex = 0 then
  begin
    if Edit1.Text = '' then Exit;
    if not qryDatosBlcCxc.Locate('CODIGO_cte',StrToInt(Edit1.Text),[loCaseInsensitive,loPartialKey]) then
    MostrarDatos(false) else MostrarDatos(True);
  end else if RadioGroup1.ItemIndex = 1 then
  begin
    if not qryDatosBlcCxc.Locate('CEDULA',Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    MostrarDatos(false) else MostrarDatos(True);
  end else if RadioGroup1.ItemIndex = 2 then
  begin
    if not qryDatosBlcCxc.Locate('NOMBRE_CTE',Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    MostrarDatos(false) else MostrarDatos(True);
  end  else if RadioGroup1.ItemIndex = 3 then
  begin
    if not qryDatosBlcCxc.Locate('RNC_NUMERO',Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    MostrarDatos(false) else MostrarDatos(True);
  end;
end;

procedure TFrmRecibosYCtaXCobrar.FormCreate(Sender: TObject);
begin
  //if not assigned(dmdatos) then dmDatos.Create(self);
  qryDatosBlcCxc.Close;
  qryDatosBlcCxc.Open;
  qryFactPend.Close;
  qryFactPend.Open;
  dmIngresos.tblFormaPago.Close;
  dmIngresos.tblFormaPago.Open;

  dmPagosTarjeta.tbltipotarjeta.Close;
  dmPagosTarjeta.tbltipotarjeta.Open;
  dmPagosTarjeta.tblProvCobroTarjeta.Close;
  dmPagosTarjeta.tblProvCobroTarjeta.Open;
  dmCompania.tblCompania.Close;
  dmCompania.tblCompania.Open;
end;

procedure TFrmRecibosYCtaXCobrar.Button1Click(Sender: TObject);
begin
  if RadioGroup1.ItemIndex = 0 then
  begin
    if Not qryDatosBlcCxc.Locate('CODIGO_CTE',StrToInt(Edit1.Text),[loCaseInsensitive,loPartialKey]) then
    MessageDlg('Codigo Cliente no encontrado',mtInformation, [mbOK], 0);
  end else{ if RadioGroup1.ItemIndex = 1 then
  begin
    if not qryDatosBlcCxc.Locate('LICENCIA',Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    MessageDlg('Licencia Cliente no encontrado',mtInformation, [mbOK], 0);
  end else }if RadioGroup1.ItemIndex = 2 then
  begin
    if not qryDatosBlcCxc.Locate('nombre_cte',Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    MessageDlg('Nombre no encontrado',mtInformation, [mbOK], 0);
  end else if RadioGroup1.ItemIndex = 3 then
  if not qryDatosBlcCxc.Locate('rnc_numero',Edit1.Text,[loCaseInsensitive,loPartialKey]) then
  MessageDlg('RNC no encontrado',mtInformation, [mbOK], 0);
end;

procedure TFrmRecibosYCtaXCobrar.qryFactPendCalcFields(DataSet: TDataSet);
begin
case qryfactpendtipo.value of
  1:qryfactpenddesctipo.Value:='R.Veh';
  2:qryfactpenddesctipo.Value:='****';
  3:qryfactpenddesctipo.Value:='****';
  else qryfactpenddesctipo.Value:='C. Serv';
  end;
  if qryFactPendMONTO_PENDIENTE.value > 0 then
  begin
    if not dmdatos.qryTasa.Prepared then
    dmdatos.qryTasa.prepare;
    qryFactPendMONTO_US.Value := 0;
    dmdatos.qryTasa.close;
    if qryFactPendMONEDA.value = '1' then
    dmdatos.qryTasa.params[0].Value:= '2' else
    dmdatos.qryTasa.params[0].Value:= '1';
    dmdatos.qryTasa.params[1].Value:= qryFactPendFECHA.Value;
    dmdatos.qryTasa.open;
    if dmdatos.qryTasa.RecordCount > 0 then
      if qryFactPendMONEDA.value = '2' then
        qryFactPendMONTO_US.Value := qryFactPendMONTO_PENDIENTE.value / dmdatos.qrytasavalormoneda.value
    else qryFactPendMONTO_US.Value := 0;
  end;
end;

procedure TFrmRecibosYCtaXCobrar.qryFactPendFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept := (DataSet['CODIGO_CTE'] = qryDatosBlcCxcCODIGO_CTE.Value);
end;

procedure TFrmRecibosYCtaXCobrar.BitBtn2Click(Sender: TObject);
begin
  dmIngresos.tblFormaPago.Close;
  dmIngresos.tblFormaPago.Open;
  dmPagosTarjeta.tbltipotarjeta.Close;
  dmPagosTarjeta.tbltipotarjeta.Open;
  dmPagosTarjeta.tblProvCobroTarjeta.Close;
  dmPagosTarjeta.tblProvCobroTarjeta.Open;

  edtNumFact.SetInteger(xNumeroFact);

  if (xNumeroFact = 0) then
  begin
    xNumeroFact:=edtNumFact.ValueInteger;
    if (xNumeroFact = 0) then
    MessageDlg('Favor seleccionar en el grid el numero de factura', mtError, [mbOK], 0);
    Exit;
  end;

  if dmIngresos.tblFormaPagoCODIGO.IsNull then
  begin
    MessageDlg('Favor seleccionar forma de pago', mtError, [mbOK], 0);
    Exit;
  end;

  if Not qryFactPend.Filtered then
  begin
    MessageDlg('Para aplicar pago debe elegir el cliente, verifique',mtError, [mbOK], 0);
    Exit;
  end;

  if edtMontoAplicar.ValueFloat = 0  then
  begin
    MessageDlg('Favor indicar el monto para aplicar pago',mtError, [mbOK], 0);
    edtMontoAplicar.SetFocus;
    Exit;
  end;

  //frmAceptaDetalleFormaPago:=TfrmAceptaDetalleFormaPago.Create(Nil);
  //try
    rxFormaPago.Close;
    rxFormaPago.Open;
    dmIngresos.tblIngresoDet.Close;
    dmIngresos.tblIngresoDet.Open;

    //if frmAceptaDetalleFormaPago.Showmodal = mrOk then
    //begin

      if rxFormaPago.State In [dsEdit, dsInsert] then
      rxFormaPago.Post;

      frmpagofacturas:=Tfrmpagofacturas.Create(Nil);
      try
        if xNumeroFact > 0 then
        frmpagofacturas.edtnumfact.Text    := IntToStr(xNumeroFact);
        frmpagofacturas.EdtMontoApagar.Text:= Format('%8.2f',[edtMontoAplicar.ValueFloat]);
        frmpagofacturas.edtMontoPendiente.Text:= Format('%8.2f',[qryFactPendMONTO_PENDIENTE.Value]);

        if (edtMontoAplicar.ValueFloat < qryFactPendMonto_Pendiente.Value) then 
        frmpagofacturas.xtipoVenta := 'Abono'
        else frmpagofacturas.xtipoVenta := 'Saldo';
        
        frmpagofacturas.IngresReciboMaster    := True;
        frmpagofacturas.btnProcesarClick(Self);
        frmpagofacturas.edtnumfact.SetFloat(0);

        //frmpagofacturas.Showmodal;
      finally
      frmpagofacturas.Free;
      frmpagofacturas:=Nil;
      end;
  //end;
  //finally
  //frmAceptaDetalleFormaPago.Free;
  //frmAceptaDetalleFormaPago:=Nil;
  //end;
  qryDatosBlcCxc.Close;
  qryDatosBlcCxc.Open;
  if CerrarVentana Then
  begin
    CerrarVentana:= False;
    Close;
  end;
end;

procedure TFrmRecibosYCtaXCobrar.BitBtn1Click(Sender: TObject);
var
  strNumero : String;
begin
  strNumero:='';
  strNumero := InputBox('Imprimir recibo de ingreso','Entre Número de Recibo','');
  if strNumero = '' then exit;

  dmIngresos.qryRepIngMaster.Close;
  dmIngresos.qryRepIngMaster.Params[0].Value:= StrToInt(strNumero);
  dmIngresos.qryRepIngMaster.Open;
  dmUsuarios.qryUsuarios.Locate('CODIGO_EMPLEADO',VarUsuarioGlb,[]);
  //qckReciboIngreso:=TqckReciboIngreso.Create(Nil);
  qckReciboAbonoCXC:=TqckReciboAbonoCXC.Create(nil);
  try
    qckReciboAbonoCXC.LabelNombUser.Caption:= dmUsuarios.qryUsuariosNOMBRECOMPLETO.Value;
    if dmIngresos.tblIngresoMasterSTATUS.Value = 'P' then
    qckReciboAbonoCXC.qrLabelReimprimir.Caption:='Re-Impresion' else
    qckReciboAbonoCXC.qrLabelReimprimir.Caption:='';
    qckReciboAbonoCXC.Preview;
    if dmIngresos.tblIngresoMasterSTATUS.Value = 'A' then
    begin
      qckReciboAbonoCXC.qrLabelReimprimir.Caption:='';
      dmIngresos.tblIngresoMaster.Edit;
      dmIngresos.tblIngresoMasterSTATUS.Value := 'P';
      dmIngresos.tblIngresoMaster.Post;
      dmIngresos.tblIngresoMaster.ApplyUpdates;
      if Not dmIngresos.tblIngresoMaster.Transaction.InTransaction then
      dmIngresos.tblIngresoMaster.Transaction.StartTransaction;
      try
        dmIngresos.tblIngresoMaster.Transaction.CommitRetaining;
      except
      dmIngresos.tblIngresoMaster.Transaction.RollbackRetaining;
      end;
    end;
  finally
  qckReciboAbonoCXC.Free;
  qckReciboAbonoCXC:=Nil;
  end;
end;

procedure TFrmRecibosYCtaXCobrar.DBGrid1CellClick(Column: TColumn);
begin
  if qryFactPend.RecordCount > 0 then
  begin
    Edit1.text := qryFactPendCODIGO_CTE.AsString;
    xNumeroFact:= qryFactPendNUMERO_FACT.Value;
    edtNumFact.SetInteger(xNumeroFact);
  end;
end;

procedure TFrmRecibosYCtaXCobrar.edtMontoAplicarExit(Sender: TObject);
begin
  rxFormaPago.Open;
  rxFormaPago.Insert;
end;

end.

