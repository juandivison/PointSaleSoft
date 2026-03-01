unit UQckRepConduce;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, RxMemDS,
  IBCustomDataSet, IBQuery;

type
  TqckRepConduce = class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    SummaryBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText5: TQRDBText;
    ChildBand1: TQRChildBand;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRSubDetail1: TQRSubDetail;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    PageFooterBand1: TQRBand;
    QRLabel23: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel12: TQRLabel;
    qryEmpCodV: TIBQuery;
    qryEmpCodVCODIGO: TIntegerField;
    qryEmpCodVCODIGO_CIA: TIntegerField;
    qryEmpCodVNOMBRE: TIBStringField;
    qryEmpCodVAPELLIDO: TIBStringField;
    qryEmpCodVCEDULA: TIBStringField;
    qryEmpCodVFOTO: TBlobField;
    qryEmpCodVPASSPORT: TIBStringField;
    qryEmpCodVCALLE: TIBStringField;
    qryEmpCodVNUM_CASA: TSmallintField;
    qryEmpCodVCIUDAD: TIBStringField;
    qryEmpCodVPAIS: TIBStringField;
    qryEmpCodVTELEF_CASA: TIBStringField;
    qryEmpCodVTELEF_OFICINA: TIBStringField;
    qryEmpCodVCELULAR: TIBStringField;
    qryEmpCodVEMAIL: TIBStringField;
    qryEmpCodVSEXO: TIBStringField;
    qryEmpCodVESTADO_CIVIL: TIBStringField;
    qryEmpCodVTELEF_REFERENCIA: TIBStringField;
    qryEmpCodVNOMBRE_REFERENCIA: TIBStringField;
    qryEmpCodVFECHA_NAC: TDateTimeField;
    qryEmpCodVNACIONALIDAD: TIBStringField;
    qryEmpCodVFECHA_ENTRADA: TDateTimeField;
    qryEmpCodVFECHA_SALIDA: TDateTimeField;
    qryEmpCodVSALARIO: TFloatField;
    qryEmpCodVTIPO_NOMINA: TSmallintField;
    qryEmpCodVTIPO_EMPLEADO: TSmallintField;
    qryEmpCodVDEPTO_EMP: TSmallintField;
    qryEmpCodVSECCION: TSmallintField;
    qryEmpCodVCARGO: TSmallintField;
    qryEmpCodVPAGA_AFP: TSmallintField;
    qryEmpCodVPAGA_TSS: TSmallintField;
    qryEmpCodVSTATUS: TIBStringField;
    qryEmpCodVFECHA_IN: TDateTimeField;
    qryEmpCodVIN_POR: TIBStringField;
    qryEmpCodVFECHA_MOD: TDateTimeField;
    qryEmpCodVMOD_POR: TIBStringField;
    qryEmpCodVLICENCIA: TIBStringField;
    qryEmpCodVFECHA_VENCE_LICENCIA: TDateTimeField;
    qryEmpCodVFECHAVACACIONES: TDateTimeField;
    QRLabel14: TQRLabel;
    QRLabel18: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel9: TQRLabel;
    ChildBand2: TQRChildBand;
    QRDBText13: TQRDBText;
    QRExpr1: TQRExpr;
    QRDBText14: TQRDBText;
    QRBand1: TQRBand;
    QRExpr2: TQRExpr;
    QRLabel19: TQRLabel;
    QRExpr3: TQRExpr;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    procedure QRDBText9Print(sender: TObject; var Value: String);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRLabel9Print(sender: TObject; var Value: String);
    procedure QRDBText6Print(sender: TObject; var Value: String);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRExpr2Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  qckRepConduce: TqckRepConduce;

implementation

uses UDatModFactura, UDatModClientes, UGlobal, UDatosVentas;

{$R *.DFM}

procedure TqckRepConduce.QRDBText9Print(sender: TObject;
  var Value: String);
begin
  Value:= Value +'-'+dmFactura.qryVentaFacturaDESC_SECTOR.Value;
end;

procedure TqckRepConduce.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
   qryEmpCodV.Close;
   qryEmpCodV.Open;
   if qryEmpCodV.Locate('CODIGO', dmVentas.qryRepOrdenConduceCOD_VENDEDOR.Value,[]) then
   QRLabel14.Caption:= qryEmpCodVNOMBRE.Value+' '+qryEmpCodVAPELLIDO.Value
   else
   QRLabel14.Caption:= '';
   if qryEmpCodV.Locate('CODIGO', dmVentas.qryRepOrdenConduceDESPACHADOPOR.Value,[]) then
   QRLabel21.Caption:= qryEmpCodVNOMBRE.Value+' '+qryEmpCodVAPELLIDO.Value
   else
   QRLabel21.Caption:= '';
end;

procedure TqckRepConduce.QRLabel9Print(sender: TObject; var Value: String);
begin
  Value:=VarNombreUsuario;
end;

procedure TqckRepConduce.QRDBText6Print(sender: TObject;
  var Value: String);
begin
  Value:=dmFactura.qryVentaFacturaCODIGO_CTE.AsString+ '-'+Value;
end;

procedure TqckRepConduce.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if Length(trim(dmFactura.qryVentaFacturaDetDESCRIPCIONAdicional.Value)) = 0 then
  ChildBand2.Height :=0
  //QRSubDetail1.HasChild:=False
  else
  ChildBand2.Height:=23;
  //QRSubDetail1.HasChild:=True;//dmFactura.qryVentaFacturaDet.sql.text
  //dmFactura.qryVentaFacturaDetDESCRIPCIONProducto.value
end;

procedure TqckRepConduce.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if (dmfactura.qryVentaFacturaMONTO_DESCUENTO.Value > 0) then
  PrintBand:= True else
  begin
    SummaryBand1.Frame.DrawTop:=True;
    PrintBand:= False;
  end;
end;

procedure TqckRepConduce.QRExpr2Print(sender: TObject; var Value: String);
begin
  Value:='-'+Value;
end;

end.
