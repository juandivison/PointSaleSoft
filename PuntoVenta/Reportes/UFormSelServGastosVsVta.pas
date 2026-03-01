unit UFormSelServGastosVsVta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WinSkinData, StdCtrls, ExtCtrls, Buttons, Mask, RxToolEdit,
  EditNew, DB, IBCustomDataSet, IBQuery;

type
  TfrmRelGastosCostos = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ComboBox1: TComboBox;
    edtFichaPlaca: TEditN;
    ComboBox2: TComboBox;
    edtFichaRotulo: TEditN;
    dbEditFechaInicial: TDateEdit;
    dbEditFechaFinal: TDateEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    RadioGroup1: TRadioGroup;
    SkinData1: TSkinData;
    Label5: TLabel;
    ComboBox3: TComboBox;
    edtCodVendedor: TEditN;
    Label6: TLabel;
    ComboBox4: TComboBox;
    edtCodigoCliente: TEditN;
    qryVehiculos: TIBQuery;
    dsqryVehiculos: TDataSource;
    qryVehiculosFICHA: TIntegerField;
    qryVehiculosPLACAROTULO: TIBStringField;
    qryVehiculosPLACA: TIBStringField;
    qryVehiculosROTULO: TIBStringField;
    qryEmpCodV: TIBQuery;
    dsqryEmpCodV: TDataSource;
    qryEmpCodVCODIGO: TIntegerField;
    qryEmpCodVNOMBRE: TIBStringField;
    qryEmpCodVAPELLIDO: TIBStringField;
    qryEmpCodVCEDULA: TIBStringField;
    qryEmpCodVNOMBRECOMPLETO: TIBStringField;
    qryClientes: TIBQuery;
    dsqryClientes: TDataSource;
    qryClientesDESC_CIUDAD: TIBStringField;
    qryClientesDESC_SECTOR: TIBStringField;
    qryClientesCODIGO_CTE: TIntegerField;
    qryClientesCIA_KEY: TIntegerField;
    qryClientesTIPO_CLIENTE: TSmallintField;
    qryClientesFOTO: TBlobField;
    qryClientesNOMBRE_CTE: TIBStringField;
    qryClientesNOMBRE_ABREV: TIBStringField;
    qryClientesMONEDA_FACT: TIBStringField;
    qryClientesNOMBRE_FACTURAR: TIBStringField;
    qryClientesCONTACTO: TIBStringField;
    qryClientesDIRECCION_CONT: TIBStringField;
    qryClientesTELEF_CONTACTO: TIBStringField;
    qryClientesFAX_CONTACTO: TIBStringField;
    qryClientesFORMA_PAGO: TSmallintField;
    qryClientesCODIGO_AGENCIA: TSmallintField;
    qryClientesSTATUS_CLIENTE: TIBStringField;
    qryClientesINSERTADO_POR: TIBStringField;
    qryClientesFECHA_INSERTADO: TDateTimeField;
    qryClientesFECHA_MOD: TDateTimeField;
    qryClientesMODI_POR: TIBStringField;
    qryClientesLIMITE_CREDITO: TFloatField;
    qryClientesEMAIL: TIBStringField;
    qryClientesWEBSITE: TIBStringField;
    qryClientesPAIS: TIBStringField;
    qryClientesCIUDAD: TIBStringField;
    qryClientesCEDULA: TIBStringField;
    qryClientesRNC: TIBStringField;
    qryClientesREFERENCIA: TIBStringField;
    qryClientesTELEF_REFERENCIA: TIBStringField;
    qryClientesOTRO_TELEFONO: TIBStringField;
    qryClientesCANT_DIAS_CREDITO: TSmallintField;
    qryClientesTIPO_NCF: TIBStringField;
    qryClientesOBSERVACION: TMemoField;
    qryClientesLUGAR_DE_TRABAJO: TIBStringField;
    qryClientesAPODO: TIBStringField;
    qryClientesCODIGO_USUARIO: TIntegerField;
    qryClientesRNC_NUMERO: TIBStringField;
    qryClientesCOMENTARIO: TMemoField;
    qryClientesCONDICION: TIntegerField;
    qryClientesPRECIO_ID: TIntegerField;
    qryClientesRUTA_FOTO: TIBStringField;
    qryClientesTIPO_CF: TIBStringField;
    qryClientesMOVIL1: TIBStringField;
    qryClientesMOVIL2: TIBStringField;
    qryClientesCODIGO_TEXTO: TIBStringField;
    qryClientesUSARLEVELPRECIO: TSmallintField;
    qryClientesCOD_VENDEDOR: TIntegerField;
    qryClientesFECHA_NACIMIENTO: TDateTimeField;
    qryClientesCODZONA: TIntegerField;
    qryClientesRUTA: TIntegerField;
    qryClientesCOD_CIUDAD: TIntegerField;
    qryClientesDIA_RUTA: TIBStringField;
    chkIgnoreFecha: TCheckBox;
    chkExpExcel: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure ComboBox4Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AbrirDatos;
  end;

var
  frmRelGastosCostos: TfrmRelGastosCostos;

implementation

uses UDatModConectar, UDatModReportes,UGlobal;

{$R *.dfm}

procedure TfrmRelGastosCostos.FormCreate(Sender: TObject);
begin
  dbEditFechaInicial.Date := Now;
  dbEditFechaFinal.Date := Now;
  qryVehiculos.Close;
  qryVehiculos.Open;
  qryVehiculos.First;
  ComboBox1.Clear;
  ComboBox2.Clear;
  ComboBox3.Clear;
  ComboBox4.Clear;
  While Not qryVehiculos.Eof Do
  begin
    ComboBox1.Items.Add(qryVehiculosPLACA.Value);
    ComboBox2.Items.Add(qryVehiculosRotulo.Value);
    qryVehiculos.Next;
  end;
  ComboBox1.ItemIndex := 0;
  ComboBox2.ItemIndex := 0;
  ComboBox1Change(Self);
  qryEmpCodV.Close;
  qryEmpCodV.Open;
  while not qryEmpCodV.Eof Do
  begin
    ComboBox3.Items.Add(qryEmpCodVNOMBRECOMPLETO.Value);
    qryEmpCodV.Next;
  end;
  ComboBox3.ItemIndex := 0;
  ComboBox3Change(Self);
  qryClientes.Close;
  qryClientes.Open;
  while not qryClientes.Eof Do
  begin
    ComboBox4.Items.Add(qryClientesNOMBRE_FACTURAR.Value);
    qryClientes.Next;
  end;
  ComboBox4.ItemIndex := 0;
  ComboBox4Change(Self);
end;

procedure TfrmRelGastosCostos.ComboBox1Change(Sender: TObject);
begin
  if qryVehiculos.Locate('PLACA',ComboBox1.Text,[]) then
  edtFichaPlaca.SetInteger(qryVehiculosFICHA.Value);
end;

procedure TfrmRelGastosCostos.ComboBox2Change(Sender: TObject);
begin
  if qryVehiculos.Locate('ROTULO',ComboBox1.Text,[]) then
  edtFichaRotulo.SetInteger(qryVehiculosFICHA.Value);
end;


procedure TfrmRelGastosCostos.ComboBox3Change(Sender: TObject);
begin
  if qryEmpCodV.Locate('NOMBRECOMPLETO',ComboBox1.Text,[]) then
  edtCodVendedor.SetInteger(qryEmpCodVCODIGO.Value);
end;

procedure TfrmRelGastosCostos.ComboBox4Change(Sender: TObject);
begin
  if qryClientes.Locate('NOMBRE_FACTURAR',ComboBox4.Text,[]) then
  edtCodigoCliente.SetInteger(qryClientesCODIGO_CTE.Value);
end;

procedure TfrmRelGastosCostos.AbrirDatos;
var
   strCond : string;
begin
  dmreportes.qryRepGastosVtas.close;
  case RadioGroup1.ItemIndex of
    0:begin
        strCond:=Format('  TRANS_OPERACION_DET.FICHA_VEH = %s ',[edtFichaPlaca.Text]);
      end;
    1:begin
        strCond:=Format('  TRANS_OPERACION_DET.FICHA_VEH = %s ',[edtFichaRotulo.Text]);
      end;
    2:begin
        strCond:=Format('  VENTAS_MAST.CODIGO_VENDEDOR = %s ',[edtCodVendedor.Text]);
      end;
    //3:begin
    //    strCond:=Format('  VENTAS_MAST.CODIGO_CTE = %s ',[edtNumConduceCte.Text]);
    //  end;
  end;

  {if edtNumConduceCte.ValueInteger > 0 then
  strCond:=Format('  VENTAS_DET.NUM_CONDUCE_CTE = %s ',[edtNumConduceCte.Text])
  else
  if edtNumIdentifica.ValueInteger > 0 then
  strCond:=Format('  VENTAS_DET.NUM_IDENT=%s ',[edtNumIdentifica.Text]);}
  //VENTAS_DET.NUM_CONDUCE_CTE VENTAS_DET.NUM_IDENT
  dmreportes.qryRepGastosVtas.Sql.Text:=
  dmreportes.qryRepGastosVtas_Base.Sql.Text;
  if RadioGroup1.ItemIndex = 3 then
  begin
    strCond:=' Where TRANS_OPERACION_MASTER.fecha between :fechaini and :fechafin';
    dmreportes.qryRepGastosVtas.SQL.Add(strCond);
    if not dmreportes.qryRepGastosVtas.Prepared then
    dmreportes.qryRepGastosVtas.Prepare;
    dmreportes.qryRepGastosVtas.Params[0].Value:= ExtraerFecha(dbEditFechaInicial.Date);
    dmreportes.qryRepGastosVtas.Params[1].Value:= ExtraerFecha(dbEditFechaFinal.Date);
  end else
  begin
    if not chkIgnoreFecha.Checked then
    begin
      dmreportes.qryRepGastosVtas.Sql.Add(' Where TRANS_OPERACION_MASTER.fecha between :fechaini and :fechafin');
      dmreportes.qryRepGastosVtas.Sql.Add(' And '+strCond);
      if not dmreportes.qryRepGastosVtas.Prepared then
      dmreportes.qryRepGastosVtas.Prepare;
      dmreportes.qryRepGastosVtas.Params[0].Value:= ExtraerFecha(dbEditFechaInicial.Date);
      dmreportes.qryRepGastosVtas.Params[1].Value:= ExtraerFecha(dbEditFechaFinal.Date);
    end else
    begin
      dmreportes.qryRepGastosVtas.Sql.Clear;
      dmreportes.qryRepGastosVtas.Sql.Text:=
      dmreportes.qryRepGastosVtas_Base.Sql.Text;
       if not dmreportes.qryRepGastosVtas.Prepared then
      dmreportes.qryRepGastosVtas.Prepare;
      dmreportes.qryRepGastosVtas.Sql.Add(' Where '+strCond);
    end;
  end;

  dmreportes.qryRepGastosVtas.Sql.Add('Order By TRANS_OPERACION_DET.FICHA_VEH, TRANS_OPERACION_DET.CODIGO_USUARIO ,');
  dmreportes.qryRepGastosVtas.Sql.Add('TRANS_OPERACION_MASTER.FECHA,');
  dmreportes.qryRepGastosVtas.Sql.Add('TRANS_OPERACION_DET.IDTASAITBIS,');
  dmreportes.qryRepGastosVtas.Sql.Add('TRANS_OPERACION_MASTER.NUMERO');

  if not dmreportes.qryRepGastosVtas.Prepared then
  dmreportes.qryRepGastosVtas.Prepare;
  dmreportes.qryRepGastosVtas.Open;
end;

end.
