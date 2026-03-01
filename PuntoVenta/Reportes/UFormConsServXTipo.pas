unit UFormConsServXTipo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WinSkinData, StdCtrls, Buttons, Mask, rxToolEdit, EditNew,
  ExtCtrls, DB, IBCustomDataSet, IBQuery;

type
  TfrmListadoServXTipo = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    SkinData1: TSkinData;
    Label44: TLabel;
    Label45: TLabel;
    edtFechaIni: TDateEdit;
    rdgTipoOpe: TRadioGroup;
    rdgFecha: TRadioGroup;
    edtFechaFin: TDateEdit;
    rdgRecibidos: TRadioGroup;
    qryStatusAlquilerMaster: TIBQuery;
    qryStatusAlquilerMasterNOMBRE_CTE: TIBStringField;
    qryStatusAlquilerMasterDESCRIPCION: TIBStringField;
    qryStatusAlquilerMasterIDSERIE: TIntegerField;
    qryStatusAlquilerMasterTIPOTRN: TIntegerField;
    qryStatusAlquilerMasterFECHA: TDateTimeField;
    qryStatusAlquilerMasterFECHA_ENTRADA: TDateTimeField;
    qryStatusAlquilerMasterFECHA_ENT_ESTIMADA: TDateTimeField;
    qryStatusAlquilerMasterCOD_CLIENTE: TIntegerField;
    qryStatusAlquilerMasterNUMERO_FACTURA: TIntegerField;
    qryStatusAlquilerMasterMONTO_TOTAL: TFloatField;
    qryStatusAlquilerMasterOBSERVACION: TMemoField;
    qryStatusAlquilerMasterSTATUS: TIBStringField;
    qryStatusAlquilerMasterFECHA_IN: TDateTimeField;
    qryStatusAlquilerMasterIN_POR: TIBStringField;
    qryStatusAlquilerMasterFECHA_MOD: TDateTimeField;
    qryStatusAlquilerMasterMOD_POR: TIBStringField;
    qryStatusAlquilerMasterCODIGO_USUARIO: TIntegerField;
    qryStatusAlquilerMasterNUM_TRNVENTA: TIntegerField;
    qryStatusAlquilerMasterTIPO_OPE: TSmallintField;
    qryStatusAlquilerMasterINV_UPD: TIBStringField;
    qryStatusAlquilerMasterCOD_PROD_ALQ: TIntegerField;
    qryStatusAlquilerMasterSERIE: TIntegerField;
    qryStatusAlquilerMasterIDSERIE1: TIntegerField;
    qryStatusAlquilerMasterCOD_PRODUCTO: TIntegerField;
    qryStatusAlquilerMasterSERIE_TRN: TIntegerField;
    qryStatusAlquilerMasterSTATUS1: TIBStringField;
    qryStatusAlquilerMasterFECHA_IN1: TDateTimeField;
    qryStatusAlquilerMasterIN_POR1: TIBStringField;
    qryStatusAlquilerMasterFECHA_MOD1: TDateTimeField;
    qryStatusAlquilerMasterMOD_POR1: TIBStringField;
    qryStatusAlquilerMasterCODIGO_USUARIO1: TIntegerField;
    qryStatusAlquilerMasterCANT_DIAS: TFloatField;
    qryStatusAlquilerMasterPRECIO_XDIA: TFloatField;
    qryStatusAlquilerMasterMONTO: TFloatField;
    qryStatusAlquilerMasterDESCRIPCIONSERVICIO: TMemoField;
    qryStatusAlquilerMasterPORC_SEGURO: TFloatField;
    qryStatusAlquilerMasterMONTO_SEGURO: TFloatField;
    qryStatusAlquilerMasterCANTIDAD: TIntegerField;
    qryStatusAlquiler_Base: TIBQuery;
    qryStatusAlquilerDet: TIBQuery;
    qryStatusAlquilerDetNOMBRE_CTE: TIBStringField;
    qryStatusAlquilerDetDESCRIPCION: TIBStringField;
    qryStatusAlquilerDetIDSERIE: TIntegerField;
    qryStatusAlquilerDetTIPOTRN: TIntegerField;
    qryStatusAlquilerDetFECHA: TDateTimeField;
    qryStatusAlquilerDetFECHA_ENTRADA: TDateTimeField;
    qryStatusAlquilerDetFECHA_ENT_ESTIMADA: TDateTimeField;
    qryStatusAlquilerDetCOD_CLIENTE: TIntegerField;
    qryStatusAlquilerDetNUMERO_FACTURA: TIntegerField;
    qryStatusAlquilerDetMONTO_TOTAL: TFloatField;
    qryStatusAlquilerDetOBSERVACION: TMemoField;
    qryStatusAlquilerDetSTATUS: TIBStringField;
    qryStatusAlquilerDetFECHA_IN: TDateTimeField;
    qryStatusAlquilerDetIN_POR: TIBStringField;
    qryStatusAlquilerDetFECHA_MOD: TDateTimeField;
    qryStatusAlquilerDetMOD_POR: TIBStringField;
    qryStatusAlquilerDetCODIGO_USUARIO: TIntegerField;
    qryStatusAlquilerDetNUM_TRNVENTA: TIntegerField;
    qryStatusAlquilerDetTIPO_OPE: TSmallintField;
    qryStatusAlquilerDetINV_UPD: TIBStringField;
    qryStatusAlquilerDetCOD_PROD_ALQ: TIntegerField;
    qryStatusAlquilerDetSERIE: TIntegerField;
    qryStatusAlquilerDetIDSERIE1: TIntegerField;
    qryStatusAlquilerDetCOD_PRODUCTO: TIntegerField;
    qryStatusAlquilerDetSERIE_TRN: TIntegerField;
    qryStatusAlquilerDetSTATUS1: TIBStringField;
    qryStatusAlquilerDetFECHA_IN1: TDateTimeField;
    qryStatusAlquilerDetIN_POR1: TIBStringField;
    qryStatusAlquilerDetFECHA_MOD1: TDateTimeField;
    qryStatusAlquilerDetMOD_POR1: TIBStringField;
    qryStatusAlquilerDetCODIGO_USUARIO1: TIntegerField;
    qryStatusAlquilerDetCANT_DIAS: TFloatField;
    qryStatusAlquilerDetPRECIO_XDIA: TFloatField;
    qryStatusAlquilerDetMONTO: TFloatField;
    qryStatusAlquilerDetDESCRIPCIONSERVICIO: TMemoField;
    qryStatusAlquilerDetPORC_SEGURO: TFloatField;
    qryStatusAlquilerDetMONTO_SEGURO: TFloatField;
    qryStatusAlquilerDetCANTIDAD: TIntegerField;
    qryStatusAlquilerMasterTIPOOPE: TIBStringField;
    qryStatusAlquilerMasterMONEDA: TIBStringField;
    qryStatusAlquilerMasterVALOR_TASA: TFloatField;
    qryStatusAlquilerMasterMONTO_DEPOSITO: TFloatField;
    qryStatusAlquilerDetMONEDA: TIBStringField;
    qryStatusAlquilerDetVALOR_TASA: TFloatField;
    qryStatusAlquilerDetMONTO_DEPOSITO: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure qryStatusAlquilerMasterAfterScroll(DataSet: TDataSet);

  private
    { Private declarations }
  public
    orderTipo : smallint;
    Procedure AbrirDatos;
  end;

var
  frmListadoServXTipo: TfrmListadoServXTipo;
  labelCretrioRep : String;
  tipotrnini, tipotrnfin : integer;
implementation
uses uglobal, UDatModReportes, UQckRepListaFactura, UDatosVentas;

{$R *.dfm}

procedure TfrmListadoServXTipo.FormCreate(Sender: TObject);
begin
  edtFechaIni.Date := ExtraerFecha(GlbFechaTrnDiaria);
  edtFechaFin.Date := ExtraerFecha(GlbFechaTrnDiaria);
  dmReportes.qryClientes.Close;
  dmReportes.qryClientes.Open;
  dmReportes.qryClientes.First;
end;

procedure TfrmListadoServXTipo.AbrirDatos;
var
  orderByText : string;
  strCond : String;
begin
  
  case rdgTipoOpe.ItemIndex of
  0:begin
      strCond := ' and r.tipo_ope = 1 ';
    end;
  1:begin
       strCond := ' and r.tipo_ope = 2 ';
    end;
  2:begin
      strCond := ' and r.tipo_ope = 3 ';
    end;
  end;

  Case rdgFecha.ItemIndex Of
  0:begin
      strCond := strCond + ' And r.fecha Between '+chr(39)+
      FormatDateTime('mm/dd/yyyy', edtFechaIni.Date)+chr(39)+
      ' and ' +chr(39)+
      FormatDateTime('mm/dd/yyyy', edtFechaFin.Date)+chr(39);
    end;
  1:begin
      strCond := strCond + ' And r.fecha_Entrada Between '+chr(39)+
      FormatDateTime('mm/dd/yyyy', edtFechaIni.Date)+chr(39)+
      ' and ' +chr(39)+
      FormatDateTime('mm/dd/yyyy', edtFechaFin.Date)+chr(39);
    end;
  2:begin
      strCond := strCond + ' And r.FECHA_ENT_ESTIMADA Between '+chr(39)+
      FormatDateTime('mm/dd/yyyy', edtFechaIni.Date)+chr(39)+
      ' and ' +chr(39)+
      FormatDateTime('mm/dd/yyyy', edtFechaFin.Date)+chr(39);
    end;
  end;
  case rdgRecibidos.ItemIndex of
  0:begin
      strCond := strCond + ' And r.fecha_Entrada is not null ';
    end;
  1:begin
       strCond := strCond + ' And r.fecha_Entrada is  null ';
    end;
  end;
  qryStatusAlquilerMaster.SQL.Text := qryStatusAlquiler_Base.SQL.Text +
  strCond + 
  ' Order By R.TIPO_OPE, r.COD_CLIENTE, r.idserie desc';

  qryStatusAlquilerMaster.Open;

  {
  if orderTipo = 0 then
  orderByText:= ' order by CODIGO_EMP, SERVICIOS_MASTER.fecha_entrada '
  else
  if orderTipo = 1 then
  orderByText:= ' order by CODIGO_EMP, SERVICIOS_MASTER.fecha_entrada '
  else
  if orderTipo = 2 then
  orderByText:= ' order by CODIGO_EMP ';
  }

  //dmReportes.qryRepServXTipoMaster.Close;
  //dmReportes.qryRepServXTipoMaster.SQL.Clear;
  //dmReportes.qryRepServXTipoMaster.SQL.Text:=
  //dmReportes.qryRepServXTipoMaster_base.SQL.Text +
  //strCond;

  {dmReportes.qryRepServXTipoDet.Close;
  dmReportes.qryRepServXTipoDet.Params[0].Value:= ExtraerFecha(edtFechaIni.Date);
  dmReportes.qryRepServXTipoDet.Params[1].Value:= ExtraerFecha(edtFechaFin.Date);
  dmReportes.qryRepServXTipoMaster.Open;}

  //dmReportes.qryRepServTallerM.Close;
  //dmReportes.qryRepServTallerM.Open;
end;

procedure TfrmListadoServXTipo.qryStatusAlquilerMasterAfterScroll(
  DataSet: TDataSet);
begin
  qryStatusAlquilerDet.close;
  qryStatusAlquilerDet.Params[0].Value:= qryStatusAlquilerMasterIDSERIE.Value;
  qryStatusAlquilerDet.Open;
end;

end.
