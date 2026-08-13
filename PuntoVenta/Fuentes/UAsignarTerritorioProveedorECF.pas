unit UAsignarTerritorioProveedorECF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, IBDatabase, IBCustomDataSet, IBQuery;

type
  TTerritorioItem = class
  public
    Codigo: string;
    Nombre: string;
  end;

  TfrmAsignarTerritorioProveedorECF = class(TForm)
    pnlTitulo: TPanel;
    lblTitulo: TLabel;
    lblAyuda: TLabel;
    grpProveedor: TGroupBox;
    lblProveedorTitulo: TLabel;
    lblProveedor: TLabel;
    lblDocumentoTitulo: TLabel;
    lblDocumento: TLabel;
    lblProvincia: TLabel;
    cmbProvincia: TComboBox;
    lblMunicipio: TLabel;
    cmbMunicipio: TComboBox;
    lblCodigoProvincia: TLabel;
    lblCodigoMunicipio: TLabel;
    btnGuardar: TBitBtn;
    btnCancelar: TBitBtn;
    procedure cmbProvinciaChange(Sender: TObject);
    procedure cmbMunicipioChange(Sender: TObject);
    procedure btnGuardarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FDatabase: TIBDatabase;
    FCodigoProveedor: Integer;
    FProvinciaOriginal: Integer;
    FMunicipioOriginal: Integer;
    FGuardado: Boolean;
    procedure LiberarItems(ACombo: TComboBox);
    procedure ConfigurarTransaccion(ATransaction: TIBTransaction);
    procedure CargarProveedor;
    procedure CargarProvincias;
    procedure CargarMunicipios;
    procedure SeleccionarCodigo(ACombo: TComboBox; ACodigo: Integer);
    function CodigoSeleccionado(ACombo: TComboBox): string;
    function CodigoSeleccionadoEntero(ACombo: TComboBox): Integer;
    function NormalizarCodigo(const ACodigo: string): string;
    function TerritorioValido(out AMensaje: string): Boolean;
    procedure ActualizarCodigosVista;
  public
    function Ejecutar(ADatabase: TIBDatabase; ACodigoProveedor: Integer): Boolean;
  end;

function ObtenerTerritorioProveedorECF(
  ADatabase: TIBDatabase;
  ACodigoProveedor: Integer;
  out AProvincia, AMunicipio: string
): Boolean;

function EditarTerritorioProveedorECF(
  ADatabase: TIBDatabase;
  ACodigoProveedor: Integer
): Boolean;

implementation

{$R *.dfm}

procedure ConfigurarTransaccionLectura(
  ATransaction: TIBTransaction;
  ADatabase: TIBDatabase
);
begin
  ATransaction.DefaultDatabase := ADatabase;
  ATransaction.Params.Clear;
  ATransaction.Params.Add('read_committed');
  ATransaction.Params.Add('rec_version');
  ATransaction.Params.Add('wait');
  ATransaction.Params.Add('read');
end;

function FormatearCodigoEntero(AValor: Integer): string;
begin
  if AValor <= 0 then
    Result := ''
  else
    Result := FormatFloat('000000', AValor);
end;

function ObtenerTerritorioProveedorECF(
  ADatabase: TIBDatabase;
  ACodigoProveedor: Integer;
  out AProvincia, AMunicipio: string
): Boolean;
var
  Tr: TIBTransaction;
  Q: TIBQuery;
  IdProvincia: Integer;
  IdMunicipio: Integer;
begin
  Result := False;
  AProvincia := '';
  AMunicipio := '';

  if (ADatabase = nil) or (ACodigoProveedor <= 0) then
    Exit;

  Tr := TIBTransaction.Create(nil);
  Q := TIBQuery.Create(nil);
  try
    ConfigurarTransaccionLectura(Tr, ADatabase);
    Q.Database := ADatabase;
    Q.Transaction := Tr;
    Q.SQL.Text :=
      'SELECT ID_PROVINCIA, ID_MUNICIPIO ' +
      'FROM PROVEEDORES ' +
      'WHERE CODIGO_CTE = :CODIGO';

    Tr.StartTransaction;
    try
      Q.ParamByName('CODIGO').AsInteger := ACodigoProveedor;
      Q.Open;

      if Q.IsEmpty then
      begin
        Tr.Commit;
        Exit;
      end;

      if Q.FieldByName('ID_PROVINCIA').IsNull then
        IdProvincia := 0
      else
        IdProvincia := Q.FieldByName('ID_PROVINCIA').AsInteger;

      if Q.FieldByName('ID_MUNICIPIO').IsNull then
        IdMunicipio := 0
      else
        IdMunicipio := Q.FieldByName('ID_MUNICIPIO').AsInteger;

      AProvincia := FormatearCodigoEntero(IdProvincia);
      AMunicipio := FormatearCodigoEntero(IdMunicipio);

      Result :=
        (Length(AProvincia) = 6) and
        (Length(AMunicipio) = 6);

      Tr.Commit;
    except
      if Tr.InTransaction then
        Tr.Rollback;
      raise;
    end;
  finally
    Q.Free;
    Tr.Free;
  end;
end;

function EditarTerritorioProveedorECF(
  ADatabase: TIBDatabase;
  ACodigoProveedor: Integer
): Boolean;
var
  Frm: TfrmAsignarTerritorioProveedorECF;
begin
  Frm := TfrmAsignarTerritorioProveedorECF.Create(nil);
  try
    Result := Frm.Ejecutar(ADatabase, ACodigoProveedor);
  finally
    Frm.Free;
  end;
end;

procedure TfrmAsignarTerritorioProveedorECF.ConfigurarTransaccion(
  ATransaction: TIBTransaction);
begin
  ATransaction.DefaultDatabase := FDatabase;
  ATransaction.Params.Clear;
  ATransaction.Params.Add('read_committed');
  ATransaction.Params.Add('rec_version');
  ATransaction.Params.Add('wait');
  ATransaction.Params.Add('write');
end;

function TfrmAsignarTerritorioProveedorECF.NormalizarCodigo(
  const ACodigo: string): string;
var
  N: Integer;
begin
  N := StrToIntDef(Trim(ACodigo), 0);
  if N <= 0 then
    Result := ''
  else
    Result := FormatFloat('000000', N);
end;

procedure TfrmAsignarTerritorioProveedorECF.LiberarItems(ACombo: TComboBox);
var
  I: Integer;
begin
  for I := 0 to ACombo.Items.Count - 1 do
    ACombo.Items.Objects[I].Free;
  ACombo.Items.Clear;
end;

procedure TfrmAsignarTerritorioProveedorECF.CargarProveedor;
var
  Tr: TIBTransaction;
  Q: TIBQuery;
  TipoDoc: Integer;
  NombreTipo: string;
begin
  Tr := TIBTransaction.Create(nil);
  Q := TIBQuery.Create(nil);
  try
    ConfigurarTransaccion(Tr);
    Q.Database := FDatabase;
    Q.Transaction := Tr;
    Q.SQL.Text :=
      'SELECT CODIGO_CTE, DESCRIPCION, NOMBRE_ABR, RNC_PROVEEDOR, ' +
      '       TIPODOC, ID_PROVINCIA, ID_MUNICIPIO ' +
      'FROM PROVEEDORES ' +
      'WHERE CODIGO_CTE = :CODIGO';

    Tr.StartTransaction;
    try
      Q.ParamByName('CODIGO').AsInteger := FCodigoProveedor;
      Q.Open;

      if Q.IsEmpty then
        raise Exception.Create('Proveedor no encontrado.');

      lblProveedor.Caption := Trim(Q.FieldByName('DESCRIPCION').AsString);
      if lblProveedor.Caption = '' then
        lblProveedor.Caption := Trim(Q.FieldByName('NOMBRE_ABR').AsString);

      TipoDoc := Q.FieldByName('TIPODOC').AsInteger;
      case TipoDoc of
        1: NombreTipo := 'RNC';
        2: NombreTipo := 'Cedula';
        3: NombreTipo := 'Otro / Pasaporte';
      else
        NombreTipo := 'Documento';
      end;

      lblDocumento.Caption :=
        NombreTipo + ': ' + Trim(Q.FieldByName('RNC_PROVEEDOR').AsString);

      if Q.FieldByName('ID_PROVINCIA').IsNull then
        FProvinciaOriginal := 0
      else
        FProvinciaOriginal := Q.FieldByName('ID_PROVINCIA').AsInteger;

      if Q.FieldByName('ID_MUNICIPIO').IsNull then
        FMunicipioOriginal := 0
      else
        FMunicipioOriginal := Q.FieldByName('ID_MUNICIPIO').AsInteger;

      Tr.Commit;
    except
      if Tr.InTransaction then
        Tr.Rollback;
      raise;
    end;
  finally
    Q.Free;
    Tr.Free;
  end;
end;

procedure TfrmAsignarTerritorioProveedorECF.CargarProvincias;
var
  Tr: TIBTransaction;
  Q: TIBQuery;
  Item: TTerritorioItem;
  CodigoVista: string;
begin
  LiberarItems(cmbProvincia);

  Tr := TIBTransaction.Create(nil);
  Q := TIBQuery.Create(nil);
  try
    ConfigurarTransaccionLectura(Tr, FDatabase);
    Q.Database := FDatabase;
    Q.Transaction := Tr;
    Q.SQL.Text :=
      'SELECT Cast(CODIGO as integer) codigo, NOMBRE ' +
      'FROM ECF_TERRITORIO ' +
      'WHERE (CHAR_LENGTH(CODIGO) <=6 ' +
      'AND SUBSTRING(CODIGO FROM 3 FOR 4) = ''0000'') ' +
      'OR (NOMBRE LIKE ''PROVINCIA%'') OR (CODIGO = ''10000'')';

    Tr.StartTransaction;
    try
      Q.Open;
      while not Q.Eof do
      begin
        Item := TTerritorioItem.Create;
        Item.Codigo := IntToStr(Q.FieldByName('CODIGO').AsInteger);
        Item.Nombre := Trim(Q.FieldByName('NOMBRE').AsString);
        CodigoVista := NormalizarCodigo(Item.Codigo);
        cmbProvincia.Items.AddObject(
          Item.Nombre + '  [' + CodigoVista + ']',
          Item
        );
        Q.Next;
      end;
      Tr.Commit;
    except
      if Tr.InTransaction then
        Tr.Rollback;
      raise;
    end;
  finally
    Q.Free;
    Tr.Free;
  end;

  SeleccionarCodigo(cmbProvincia, FProvinciaOriginal);
end;

procedure TfrmAsignarTerritorioProveedorECF.CargarMunicipios;
var
  Tr: TIBTransaction;
  Q: TIBQuery;
  Item: TTerritorioItem;
  Provincia: string;
  CodigoVista: string;
begin
  LiberarItems(cmbMunicipio);

  Provincia := CodigoSeleccionado(cmbProvincia);
  if Provincia = '' then
  begin
    ActualizarCodigosVista;
    Exit;
  end;

  Tr := TIBTransaction.Create(nil);
  Q := TIBQuery.Create(nil);
  try
    ConfigurarTransaccionLectura(Tr, FDatabase);
    Q.Database := FDatabase;
    Q.Transaction := Tr;
    Q.SQL.Text :=
      'SELECT Cast(CODIGO as integer) CODIGO, NOMBRE ' +
      'FROM ECF_TERRITORIO ' +
      'WHERE CODIGO LIKE SUBSTRING(:codsel1 FROM 1 FOR 2) || ''%'' ' +
      'AND CODIGO <> :codsel2';

    Tr.StartTransaction;
    try
      Q.ParamByName('codsel1').AsString := Provincia;
      Q.ParamByName('codsel2').AsString := Provincia;
      Q.Open;

      while not Q.Eof do
      begin
        Item := TTerritorioItem.Create;
        Item.Codigo := IntToStr(Q.FieldByName('CODIGO').AsInteger);
        Item.Nombre := Trim(Q.FieldByName('NOMBRE').AsString);
        CodigoVista := NormalizarCodigo(Item.Codigo);
        cmbMunicipio.Items.AddObject(
          Item.Nombre + '  [' + CodigoVista + ']',
          Item
        );
        Q.Next;
      end;

      Tr.Commit;
    except
      if Tr.InTransaction then
        Tr.Rollback;
      raise;
    end;
  finally
    Q.Free;
    Tr.Free;
  end;

  SeleccionarCodigo(cmbMunicipio, FMunicipioOriginal);
  ActualizarCodigosVista;
end;

procedure TfrmAsignarTerritorioProveedorECF.SeleccionarCodigo(
  ACombo: TComboBox; ACodigo: Integer);
var
  I: Integer;
  Item: TTerritorioItem;
begin
  ACombo.ItemIndex := -1;
  if ACodigo <= 0 then
    Exit;

  for I := 0 to ACombo.Items.Count - 1 do
  begin
    Item := TTerritorioItem(ACombo.Items.Objects[I]);
    if StrToIntDef(Item.Codigo, 0) = ACodigo then
    begin
      ACombo.ItemIndex := I;
      Exit;
    end;
  end;
end;

function TfrmAsignarTerritorioProveedorECF.CodigoSeleccionado(
  ACombo: TComboBox): string;
var
  Item: TTerritorioItem;
begin
  Result := '';
  if (ACombo.ItemIndex < 0) or
     (ACombo.ItemIndex >= ACombo.Items.Count) then
    Exit;

  Item := TTerritorioItem(ACombo.Items.Objects[ACombo.ItemIndex]);
  if Item <> nil then
    Result := Trim(Item.Codigo);
end;

function TfrmAsignarTerritorioProveedorECF.CodigoSeleccionadoEntero(
  ACombo: TComboBox): Integer;
begin
  Result := StrToIntDef(CodigoSeleccionado(ACombo), 0);
end;

procedure TfrmAsignarTerritorioProveedorECF.ActualizarCodigosVista;
var
  Provincia: string;
  Municipio: string;
begin
  Provincia := NormalizarCodigo(CodigoSeleccionado(cmbProvincia));
  Municipio := NormalizarCodigo(CodigoSeleccionado(cmbMunicipio));

  if Provincia = '' then
    lblCodigoProvincia.Caption := 'Codigo DGII: no seleccionado'
  else
    lblCodigoProvincia.Caption := 'Codigo DGII: ' + Provincia;

  if Municipio = '' then
    lblCodigoMunicipio.Caption := 'Codigo DGII: no seleccionado'
  else
    lblCodigoMunicipio.Caption := 'Codigo DGII: ' + Municipio;
end;

function TfrmAsignarTerritorioProveedorECF.TerritorioValido(
  out AMensaje: string): Boolean;
var
  Provincia: string;
  Municipio: string;
begin
  Result := False;
  AMensaje := '';

  Provincia := NormalizarCodigo(CodigoSeleccionado(cmbProvincia));
  Municipio := NormalizarCodigo(CodigoSeleccionado(cmbMunicipio));

  if Length(Provincia) <> 6 then
  begin
    AMensaje := 'Seleccione la provincia e-CF del proveedor.';
    Exit;
  end;

  if Length(Municipio) <> 6 then
  begin
    AMensaje := 'Seleccione el municipio e-CF del proveedor.';
    Exit;
  end;

  Result := True;
end;

procedure TfrmAsignarTerritorioProveedorECF.cmbProvinciaChange(
  Sender: TObject);
begin
  FMunicipioOriginal := 0;
  CargarMunicipios;
  ActualizarCodigosVista;
end;

procedure TfrmAsignarTerritorioProveedorECF.cmbMunicipioChange(
  Sender: TObject);
begin
  ActualizarCodigosVista;
end;

procedure TfrmAsignarTerritorioProveedorECF.btnGuardarClick(Sender: TObject);
var
  Mensaje: string;
  Tr: TIBTransaction;
  Q: TIBQuery;
  IdProvincia: Integer;
  IdMunicipio: Integer;
begin
  if not TerritorioValido(Mensaje) then
  begin
    MessageDlg(Mensaje, mtInformation, [mbOK], 0);
    Exit;
  end;

  IdProvincia := CodigoSeleccionadoEntero(cmbProvincia);
  IdMunicipio := CodigoSeleccionadoEntero(cmbMunicipio);

  Tr := TIBTransaction.Create(nil);
  Q := TIBQuery.Create(nil);
  try
    ConfigurarTransaccion(Tr);
    Q.Database := FDatabase;
    Q.Transaction := Tr;
    Q.SQL.Text :=
      'UPDATE PROVEEDORES ' +
      'SET ID_PROVINCIA = :ID_PROVINCIA, ' +
      '    ID_MUNICIPIO = :ID_MUNICIPIO ' +
      'WHERE CODIGO_CTE = :CODIGO';

    Tr.StartTransaction;
    try
      Q.ParamByName('ID_PROVINCIA').AsInteger := IdProvincia;
      Q.ParamByName('ID_MUNICIPIO').AsInteger := IdMunicipio;
      Q.ParamByName('CODIGO').AsInteger := FCodigoProveedor;
      Q.ExecSQL;

      if Q.RowsAffected <> 1 then
        raise Exception.Create(
          'No fue posible actualizar el territorio del proveedor.');

      Tr.Commit;
      FGuardado := True;
      ModalResult := mrOK;
    except
      if Tr.InTransaction then
        Tr.Rollback;
      raise;
    end;
  finally
    Q.Free;
    Tr.Free;
  end;
end;

procedure TfrmAsignarTerritorioProveedorECF.btnCancelarClick(Sender: TObject);
begin
  FGuardado := False;
  ModalResult := mrCancel;
end;

procedure TfrmAsignarTerritorioProveedorECF.FormDestroy(Sender: TObject);
begin
  LiberarItems(cmbMunicipio);
  LiberarItems(cmbProvincia);
end;

function TfrmAsignarTerritorioProveedorECF.Ejecutar(
  ADatabase: TIBDatabase;
  ACodigoProveedor: Integer): Boolean;
begin
  Result := False;

  if ADatabase = nil then
    raise Exception.Create('No se recibio la conexion a la base de datos.');

  if ACodigoProveedor <= 0 then
    raise Exception.Create('Codigo de proveedor invalido.');

  FDatabase := ADatabase;
  FCodigoProveedor := ACodigoProveedor;
  FGuardado := False;

  CargarProveedor;
  CargarProvincias;
  CargarMunicipios;
  ActualizarCodigosVista;

  Result := (ShowModal = mrOK) and FGuardado;
end;

end.
