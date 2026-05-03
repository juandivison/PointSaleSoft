unit UFrmEditProvinciaMunicipio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, DB, IBCustomDataSet, IBQuery, Buttons,
  RxCtrls, RxDBCtrl, RxLookup, WinSkinData, Mask;

type
  TfrmEditProvinciaMunicipio = class(TForm)
    lblProv: TLabel;
    lblMuni: TLabel;
    btnGuardar: TBitBtn;
    btnCancelar: TBitBtn;
    dsCliente: TDataSource;
    qProvincias: TIBQuery;
    dsProvincias: TDataSource;
    qMunicipios: TIBQuery;
    dsMunicipios: TDataSource;
    qProvinciasNOMBRE: TIBStringField;
    qMunicipiosNOMBRE: TIBStringField;
    DBStatusLabel2: TDBStatusLabel;
    qProvinciasCODIGO: TIntegerField;
    qMunicipiosCODIGO: TIntegerField;
    dblProvincia: TRxDBLookupCombo;
    dblMunicipio: TRxDBLookupCombo;
    SkinData1: TSkinData;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    procedure btnGuardarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure dsClienteDataChange(Sender: TObject; Field: TField);
    procedure FormCreate(Sender: TObject);
  private
    procedure CargarMunicipiosParaProvincia(const CodProvInt: Integer);
  public
    { Public declarations }
    idProv: integer;
  end;

var
  frmEditProvinciaMunicipio: TfrmEditProvinciaMunicipio;

implementation

uses
  UDatModConectar, UDatModClientes, UDatmodDatosGenerales, uglobal;

{$R *.dfm}

procedure TfrmEditProvinciaMunicipio.CargarMunicipiosParaProvincia(
  const CodProvInt: Integer);
var
  codProvStr, prefijo: string;
begin
  // Formatear a 5 dígitos (p.ej. 40000)
  if frmEditProvinciaMunicipio = nil then Exit;  
  qProvincias.Locate('CODIGO',CodProvInt,[]);
  qMunicipios.Close;
  qMunicipios.Params[0].AsString := qProvinciasCODIGO.AsString;
  qMunicipios.Params[1].AsString := qProvinciasCODIGO.AsString;
  qMunicipios.Open;

  // Si el municipio actual no pertenece a la nueva lista, limpiarlo
  if not dmClientes.tblClienteTerritorio.FieldByName('ID_MUNICIPIO').IsNull then
    if not qMunicipios.Locate('CODIGO',
        dmClientes.tblClienteTerritorio.FieldByName('ID_MUNICIPIO').AsInteger, []) then
      dmClientes.tblClienteTerritorio.FieldByName('ID_MUNICIPIO').AsVariant:=null;
end;

procedure TfrmEditProvinciaMunicipio.dsClienteDataChange(Sender: TObject;
  Field: TField);
begin
  // Cuando cambie la provincia, actualizar lista de municipios
  if (Field = nil) or (SameText(Field.FieldName, 'ID_PROVINCIA')) then
    if not dmClientes.tblClienteTerritorio.FieldByName('ID_PROVINCIA').IsNull then
      CargarMunicipiosParaProvincia(
        dmClientes.tblClienteTerritorio.FieldByName('ID_PROVINCIA').AsInteger
      )
    else begin
      // Sin provincia: limpiar municipios
    qMunicipios.Close;
    end;
end;

procedure TfrmEditProvinciaMunicipio.btnGuardarClick(Sender: TObject);
begin
  if dmClientes.tblClienteTerritorio.State in [dsEdit] then
  begin
    GlbSalvarQuery(dmClientes.tblClienteTerritorio);
  end;
  ModalResult := mrOk;
end;

procedure TfrmEditProvinciaMunicipio.btnCancelarClick(Sender: TObject);
begin
  if dmClientes.tblClienteTerritorio.State in [dsEdit, dsInsert] then
    dmClientes.tblClienteTerritorio.Cancel;
  ModalResult := mrCancel;
end;

procedure TfrmEditProvinciaMunicipio.FormCreate(Sender: TObject);
begin
  // SQL de provincias
  qProvincias.Close;
  qProvincias.SQL.Text := dmdatos.qryProvinciaseCF.Sql.Text;
  qProvincias.Open;

  // SQL base de municipios
  qMunicipios.Close;
  qMunicipios.SQL.Text := dmdatos.qryMunicipioseCF.Sql.Text;
  qMunicipios.Params[0].AsString := qProvinciasCODIGO.AsString;
  qMunicipios.Params[1].AsString := qProvinciasCODIGO.AsString;
  qMunicipios.Open;

  // Si ya hay provincia, cargar municipios correspondientes
  if not dmClientes.tblClienteTerritorio.FieldByName('ID_PROVINCIA').IsNull then
    CargarMunicipiosParaProvincia(
      dmClientes.tblClienteTerritorio.FieldByName('ID_PROVINCIA').AsInteger
    );
  if dmClientes.tblClienteTerritorio.State = dsInsert then
  begin
    dmClientes.tblClienteTerritorioID_PROVINCIA.Value:=idProv;
  end;
end;

end.
