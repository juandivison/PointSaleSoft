unit UFormMantVarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, StdCtrls, Mask, RxToolEdit,
  Buttons;

type
  TfrmMantVarios = class(TForm)
    qryCiudades: TIBQuery;
    cboxCiudad: TComboBox;
    qryCiudadesCODIGO: TIntegerField;
    qryCiudadesDESCRIPCION: TIBStringField;
    qryCiudadesVALOR: TFloatField;
    qryCiudadesSTATUS: TIBStringField;
    Label1: TLabel;
    cboxCiudadNuevo: TComboBox;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    tblClientes: TIBDataSet;
    tblClientesCODIGO_CTE: TIntegerField;
    tblClientesCIA_KEY: TIntegerField;
    tblClientesTIPO_CLIENTE: TSmallintField;
    tblClientesFOTO: TBlobField;
    tblClientesNOMBRE_CTE: TIBStringField;
    tblClientesNOMBRE_ABREV: TIBStringField;
    tblClientesMONEDA_FACT: TIBStringField;
    tblClientesNOMBRE_FACTURAR: TIBStringField;
    tblClientesCONTACTO: TIBStringField;
    tblClientesDIRECCION_CONT: TIBStringField;
    tblClientesTELEF_CONTACTO: TIBStringField;
    tblClientesFAX_CONTACTO: TIBStringField;
    tblClientesFORMA_PAGO: TSmallintField;
    tblClientesCODIGO_AGENCIA: TSmallintField;
    tblClientesSTATUS_CLIENTE: TIBStringField;
    tblClientesINSERTADO_POR: TIBStringField;
    tblClientesFECHA_INSERTADO: TDateTimeField;
    tblClientesFECHA_MOD: TDateTimeField;
    tblClientesMODI_POR: TIBStringField;
    tblClientesLIMITE_CREDITO: TFloatField;
    tblClientesEMAIL: TIBStringField;
    tblClientesWEBSITE: TIBStringField;
    tblClientesPAIS: TIBStringField;
    tblClientesCIUDAD: TIBStringField;
    tblClientesCEDULA: TIBStringField;
    tblClientesRNC: TIBStringField;
    tblClientesREFERENCIA: TIBStringField;
    tblClientesTELEF_REFERENCIA: TIBStringField;
    tblClientesOTRO_TELEFONO: TIBStringField;
    tblClientesCANT_DIAS_CREDITO: TSmallintField;
    tblClientesTIPO_NCF: TIBStringField;
    tblClientesOBSERVACION: TMemoField;
    tblClientesLUGAR_DE_TRABAJO: TIBStringField;
    tblClientesAPODO: TIBStringField;
    tblClientesCODIGO_USUARIO: TIntegerField;
    tblClientesRNC_NUMERO: TIBStringField;
    tblClientesCOMENTARIO: TMemoField;
    tblClientesCONDICION: TIntegerField;
    tblClientesPRECIO_ID: TIntegerField;
    tblClientesRUTA_FOTO: TIBStringField;
    tblClientesTIPO_CF: TIBStringField;
    tblClientesMOVIL1: TIBStringField;
    tblClientesMOVIL2: TIBStringField;
    tblClientesCODIGO_TEXTO: TIBStringField;
    tblClientesUSARLEVELPRECIO: TSmallintField;
    tblClientesCOD_VENDEDOR: TIntegerField;
    tblClientesFECHA_NACIMIENTO: TDateTimeField;
    tblClientesCODZONA: TIntegerField;
    tblClientesRUTA: TIntegerField;
    tblClientesCOD_CIUDAD: TIntegerField;
    tblClientesDIA_RUTA: TIBStringField;
    procedure FormCreate(Sender: TObject);
    procedure cboxCiudadChange(Sender: TObject);
    procedure cboxCiudadNuevoChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMantVarios: TfrmMantVarios;
  xCodigoCiudad : Integer;
  xCodigoCiudadDest: Integer;
implementation

uses UDatModConectar;

{$R *.dfm}

procedure TfrmMantVarios.FormCreate(Sender: TObject);
begin
  qryCiudades.Close;
  qryCiudades.Open;
  qryCiudades.First;
  cboxCiudad.Clear;
  cboxCiudadNuevo.Clear;
  while not qryCiudades.Eof do
  begin
    cboxCiudad.Items.Add(qryCiudadesDESCRIPCION.Value);
    cboxCiudadNuevo.Items.Add(qryCiudadesDESCRIPCION.Value);
  end;
  cboxCiudad.ItemIndex:=0;
  cboxCiudadChange(Self);
  cboxCiudadNuevoChange(Self);
end;

procedure TfrmMantVarios.cboxCiudadChange(Sender: TObject);
begin
  if qryCiudades.locate('descripcion',cboxCiudad.Text,[]) then
   xCodigoCiudad:= qryCiudadesCodigo.Value;
end;

procedure TfrmMantVarios.cboxCiudadNuevoChange(Sender: TObject);
begin
  if qryCiudades.locate('descripcion',cboxCiudadNuevo.Text,[]) then
   xCodigoCiudadDest:= qryCiudadesCodigo.Value;
end;

end.
