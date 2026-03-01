unit UConsultaInventario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, StdCtrls, EditNew, Buttons, Grids,
  DBGrids, RXDBCtrl, WinSkinData;

type
  TfrmConsultaInventario = class(TForm)
    qryInventario: TIBQuery;
    qryInventarioCODIGO: TIntegerField;
    qryInventarioFECHA: TDateTimeField;
    qryInventarioCODIGO_BARRA: TIBStringField;
    qryInventarioTIPO: TIntegerField;
    qryInventarioCANTIDAD_REORDEN: TIntegerField;
    qryInventarioPRECIO_ANT: TFloatField;
    qryInventarioCANTIDAD: TFloatField;
    qryInventarioPRECIO: TFloatField;
    qryInventarioBLCE_CANT_ENTRADA: TFloatField;
    qryInventarioBLCE_CANT_SALIDA: TFloatField;
    qryInventarioFECHA_ULTIMA_TRN: TDateTimeField;
    qryInventarioSTATUS: TIBStringField;
    qryInventarioPORC_DESCUENTO: TFloatField;
    qryInventarioFOTO: TBlobField;
    qryInventarioPAGA_ITBI: TSmallintField;
    qryInventarioCODIGO_PRECIO: TIBStringField;
    qryInventarioUNIDAD: TFloatField;
    qryInventarioPRECIO_COMPRA: TFloatField;
    qryInventarioPRECIO_MINIMO: TFloatField;
    qryInventarioREFERENCIA: TIBStringField;
    qryInventarioFECHA_VENCIMIENTO: TDateTimeField;
    qryInventarioINVENTARIAR: TSmallintField;
    qryInventarioPRECIO_TIPO_UNIDAD: TFloatField;
    qryInventarioTIPO_UNIDAD: TIntegerField;
    qryInventarioORIGEN: TIntegerField;
    qryInventarioUBICACION: TIBStringField;
    qryInventarioREFERENCIA_ALTERNA: TIBStringField;
    qryInventarioMARCA: TIBStringField;
    qryInventarioMODELO: TIBStringField;
    Label1: TLabel;
    DataSource1: TDataSource;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    EditN1: TEditN;
    EditN2: TEditN;
    EditN3: TEditN;
    EditN4: TEditN;
    EditN5: TEditN;
    EditN6: TEditN;
    RxDBGrid1: TRxDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    IBQuery1: TIBQuery;
    SkinData1: TSkinData;
    IBQuery1CODIGO: TIntegerField;
    IBQuery1CODIGO_TEXTO: TIBStringField;
    IBQuery1FECHA: TDateTimeField;
    IBQuery1CODIGO_BARRA: TIBStringField;
    IBQuery1TIPO: TIntegerField;
    IBQuery1CANTIDAD_REORDEN: TIntegerField;
    IBQuery1PRECIO_ANT: TFloatField;
    IBQuery1CANTIDAD: TFloatField;
    IBQuery1PRECIO: TFloatField;
    IBQuery1BLCE_CANT_ENTRADA: TFloatField;
    IBQuery1BLCE_CANT_SALIDA: TFloatField;
    IBQuery1FECHA_ULTIMA_TRN: TDateTimeField;
    IBQuery1STATUS: TIBStringField;
    IBQuery1PORC_DESCUENTO: TFloatField;
    IBQuery1FOTO: TBlobField;
    IBQuery1PAGA_ITBI: TSmallintField;
    IBQuery1CODIGO_PRECIO: TIBStringField;
    IBQuery1UNIDAD: TFloatField;
    IBQuery1PRECIO_COMPRA: TFloatField;
    IBQuery1PRECIO_MINIMO: TFloatField;
    IBQuery1REFERENCIA: TIBStringField;
    IBQuery1FECHA_VENCIMIENTO: TDateTimeField;
    IBQuery1INVENTARIAR: TSmallintField;
    IBQuery1PRECIO_TIPO_UNIDAD: TFloatField;
    IBQuery1TIPO_UNIDAD: TIntegerField;
    IBQuery1ORIGEN: TIntegerField;
    IBQuery1UBICACION: TIBStringField;
    IBQuery1REFERENCIA_ALTERNA: TIBStringField;
    IBQuery1MARCA: TIBStringField;
    IBQuery1MODELO: TIBStringField;
    IBQuery1DESCRIPCION: TIBStringField;
    qryInventarioCODIGO_TEXTO: TIBStringField;
    qryInventarioDESCRIPCION: TIBStringField;
    qryInventarioDESCRIPCIONADICIONAL: TMemoField;
    qryInventarioPRECIOVENTA1: TFloatField;
    qryInventarioPRECIOVENTA2: TFloatField;
    qryInventarioPRECIOVENTA3: TFloatField;
    qryInventarioPRECIOVENTA4: TFloatField;
    qryInventarioPORCUTILIDAD1: TFloatField;
    qryInventarioPORCUTILIDAD2: TFloatField;
    qryInventarioPORCUTILIDAD3: TFloatField;
    qryInventarioPORCUTILIDAD4: TFloatField;
    qryInventarioUSARLEVELPRECIO: TSmallintField;
    qryInventarioCIA_KEY: TIntegerField;
    qryInventarioSITUACIONPROD: TSmallintField;
    qryInventarioAPLICAIMPTOCOMPRA: TSmallintField;
    qryInventarioCODFABRICANTE: TIntegerField;
    qryInventarioCTAINVENTARIO: TIBStringField;
    qryInventarioCTAVENTA: TIBStringField;
    qryInventarioCTACOMPRA: TIBStringField;
    qryInventarioCODSUBCATEGORIA: TIntegerField;
    qryInventarioCODCATEGORIA: TIntegerField;
    qryInventarioPORCITBIS: TFloatField;
    qryInventarioCOD_MONEDA: TIBStringField;
    qryInventarioKILOMETROS: TFloatField;
    qryInventarioRUTAIMAGEN: TIBStringField;
    IBQuery1PRECIO_ALQUILER: TFloatField;
    qryInventarioPRECIO_ALQUILER: TFloatField;
    procedure qryInventarioFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure EditN1Change(Sender: TObject);
  private
    { Private declarations }
    Procedure BuscarDatos;
    Procedure Limpiar;
  public
    { Public declarations }
  end;

var
  frmConsultaInventario: TfrmConsultaInventario;

implementation

uses UDatModConectar, uGlobal;

{$R *.dfm}

procedure TfrmConsultaInventario.qryInventarioFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  if Length(EditN1.Text) > 0 then
  Accept := DataSet['codigo'] = editn1.Text
  else if Length(EditN2.Text) > 0 then
  Accept := DataSet['codigo_barra'] = editn2.Text
  else if Length(EditN3.Text) > 0 then
  Accept := DataSet['descripcion'] = editn3.Text
  else if Length(EditN4.Text) > 0 then
  Accept := DataSet['referencia'] = editn4.Text
  else if Length(EditN5.Text) > 0 then
  Accept := DataSet['referencia_alterna'] = editn5.Text
  else if Length(EditN6.Text) > 0 then
  Accept := DataSet['modelo'] = editn6.Text;
end;

procedure TfrmConsultaInventario.EditN1Change(Sender: TObject);
begin
  Limpiar;
  BuscarDatos;
end;

procedure TfrmConsultaInventario.BuscarDatos;
var
   strInvTxt : string;
begin
  if (GlbVenderDesdeAlmacenP = 1) or (GlbCodDivInventario = 1)then
  strInvTxt:='Select * From inventario_producto r Where '
  else
  begin
    strInvTxt:='Select r.* From inventario_producto r '+
               'left outer join INVENTARIO_ALMACEN m on m.CODIGO = r.CODIGO '+
               ' and m.INVENTARIO_ID ='+IntToStr(GlbCodDivInventario)+
    '  left outer join lote l on l.codigo = r.CODIGO '+
    '  where r.CIA_KEY= '+IntToStr(GlbCia_Key)+ ' and ';

    //'Select * From inventario_producto Where';
    //Format('Select INV.*,tipo_inv.Descripcion Desc_tipoInv  From %s(%s) INV, TIPO_INVENTARIO tipo_inv ' +
    //   ' WHERE CIA_KEY=:CIAKEY and inv.tipo = tipo_inv.codigo AND UPPER(inv.%s) like %s ',[nombProc, IntToStr(GlbCodDivInventario), Campo, Valor]) +
    //    ' ORDER BY codigo, tipo,descripcion, Referencia';
  

  end;
  IBQuery1.close;
  if Length(EditN1.Text) > 0 then
  IBQuery1.SQL.Text:= Format(strInvTxt + ' r.codigo Like %s',[chr(39)+editn1.Text+'%'+chr(39)])
  else if Length(EditN2.Text) > 0 then
  IBQuery1.SQL.Text:= Format(strInvTxt + ' upper(r.codigo_barra) Like %s',[chr(39)+UPPERCASE(editn2.Text)+'%'+chr(39)])
  else if Length(EditN3.Text) > 0 then
  IBQuery1.SQL.Text:= Format(strInvTxt + ' upper(r.descripcion) Like %s',[chr(39)+'%'+uppercase(editn3.Text)+'%'+chr(39)])
  else if Length(EditN4.Text) > 0 then
  IBQuery1.SQL.Text:= Format(strInvTxt + ' upper(r.referencia) Like %s',[chr(39)+'%'+uppercase(editn4.Text)+'%'+chr(39)])
  else if Length(EditN5.Text) > 0 then
  IBQuery1.SQL.Text:= Format(strInvTxt + ' UPPER(r.referencia_alterna) Like %s',[chr(39)+'%'+uppercase(editn5.Text)+'%'+chr(39)])
  else if Length(EditN6.Text) > 0 then
  IBQuery1.SQL.Text:= Format(strInvTxt + ' UPPER(r.codigo_texto) like %s',[chr(39)+'%'+uppercase(editn6.Text)+'%'+chr(39)]);
  IBQuery1.sql.add(' and r.cia_key ='+intTostr(glbCia_Key));
  IBQuery1.Open;
  IBQuery1.First;
  if IBQuery1.recordcount > 0 then
  DataSource1.DataSet:= IBQuery1
  else DataSource1.dataset := qryInventario;
end;

procedure TfrmConsultaInventario.Limpiar;
begin
  if Length(EditN1.Text) > 0 then
  begin
    EditN2.Text:='';
    EditN3.Text:='';
    EditN4.Text:='';
    EditN5.Text:='';
    EditN6.Text:='';
  end else
  if Length(EditN2.Text) > 0 then
  begin
    EditN1.Text:='';
    EditN3.Text:='';
    EditN4.Text:='';
    EditN5.Text:='';
    EditN6.Text:='';
  end else
  if Length(EditN3.Text) > 0 then
  begin
    EditN1.Text:='';
    EditN2.Text:='';
    EditN4.Text:='';
    EditN5.Text:='';
    EditN6.Text:='';
  end else
  if Length(EditN4.Text) > 0 then
  begin
    EditN1.Text:='';
    EditN2.Text:='';
    EditN3.Text:='';
    EditN5.Text:='';
    EditN6.Text:='';
  end else
  if Length(EditN5.Text) > 0 then
  begin
    EditN1.Text:='';
    EditN2.Text:='';
    EditN3.Text:='';
    EditN4.Text:='';
    EditN6.Text:='';
  end else
  if Length(EditN6.Text) > 0 then
  begin
    EditN1.Text:='';
    EditN2.Text:='';
    EditN3.Text:='';
    EditN4.Text:='';
    EditN5.Text:='';
  end;
end;

end.
