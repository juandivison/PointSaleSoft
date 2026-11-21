unit UInventarioCodigoGrupo;

interface

uses SysUtils, Classes, DB, IBDatabase, IBCustomDataSet, Controls, StdCtrls;

function PrefijoGrupo(const Texto: string): string;
function SepararCodigoGrupo(const Texto: string; out Prefijo: string;
  out Secuencia: Integer): Boolean;
procedure CargarPrefijosGrupo(DB: TIBDatabase; Tx: TIBTransaction; Lista: TStrings);
function SiguientePrefijoGrupo(DB: TIBDatabase; Tx: TIBTransaction): string;
function SiguienteCodigoGrupo(DB: TIBDatabase; Tx: TIBTransaction;
  const Prefijo: string): string;
procedure ValidarCodigoGrupo(DB: TIBDatabase; Tx: TIBTransaction;
  const Codigo, Grupo: string; ExcluirProducto: Integer; Bloquear: Boolean);

type
  TInventarioCodigoGrupo = class(TComponent)
  private
    FDatos: TIBDataSet;
    FFuente: TDataSource;
    FCombo: TComboBox;
    FBoton: TButton;
    FAntesPost, FDespuesPost, FNuevoRegistro: TDataSetNotifyEvent;
    FAutomatico: string;
    FPostados: TStringList;
    FInterno: Boolean;
    procedure DatosCambian(Sender: TObject; Campo: TField);
    procedure GrupoSeleccionado(Sender: TObject);
    procedure NuevoGrupo(Sender: TObject);
    procedure NuevoRegistro(Datos: TDataSet);
    procedure AntesPost(Datos: TDataSet);
    procedure DespuesPost(Datos: TDataSet);
    procedure SugerirCodigo;
    function ProximoCodigo(const Grupo: string): string;
  public
    constructor Create(AOwner: TComponent; AParent: TWinControl;
      Datos: TIBDataSet); reintroduce;
    destructor Destroy; override;
  end;

implementation

uses IBQuery, Dialogs, Variants;

function PrefijoGrupo(const Texto: string): string;
var S: string; I, N: Integer;
begin
  Result := '';
  S := UpperCase(Trim(Texto));
  if (Length(S) < 2) or (Length(S) > 20) then Exit;
  if not (S[1] in ['F', 'P']) then Exit;
  for I := 2 to Length(S) do if not (S[I] in ['0'..'9']) then Exit;
  if not TryStrToInt(Copy(S, 2, MaxInt), N) then Exit;
  if N <= 0 then Exit;
  // P es el prefijo importado; F es el utilizado para nuevas altas.
  // Ambos representan la misma familia numerica, incluso con ceros iniciales.
  Result := 'F' + IntToStr(N);
end;

function SepararCodigoGrupo(const Texto: string; out Prefijo: string;
  out Secuencia: Integer): Boolean;
var S, Final: string; I, Posicion: Integer;
begin
  Result := False; Prefijo := ''; Secuencia := 0;
  S := Trim(Texto); Posicion := Pos('-', S);
  if Posicion <= 1 then Exit;
  Prefijo := PrefijoGrupo(Copy(S, 1, Posicion - 1));
  if Prefijo = '' then Exit;
  Final := Copy(S, Posicion + 1, MaxInt);
  if Final = '' then Exit;
  for I := 1 to Length(Final) do if not (Final[I] in ['0'..'9']) then Exit;
  Result := TryStrToInt(Final, Secuencia) and (Secuencia > 0);
end;

function ConsultaInventario(DB: TIBDatabase; Tx: TIBTransaction): TIBQuery;
begin
  Result := TIBQuery.Create(nil);
  try
    Result.Database := DB; Result.Transaction := Tx;
    if not Tx.InTransaction then Tx.StartTransaction;
    Result.SQL.Text := 'SELECT CODIGO, CODIGO_TEXTO FROM INVENTARIO_PRODUCTO ' +
      'WHERE CODIGO_TEXTO IS NOT NULL';
    Result.Open;
  except Result.Free; raise; end;
end;

procedure CargarPrefijosGrupo(DB: TIBDatabase; Tx: TIBTransaction; Lista: TStrings);
var Q: TIBQuery; P, Codigo: string; Posicion: Integer; Valores: TStringList;
begin
  Valores := TStringList.Create;
  try
    Valores.Sorted := True; Valores.Duplicates := dupIgnore;
    Q := ConsultaInventario(DB, Tx);
    try
      while not Q.Eof do begin
        Codigo := Trim(Q.FieldByName('CODIGO_TEXTO').AsString);
        Posicion := Pos('-',Codigo);
        if Posicion>1 then P := PrefijoGrupo(Copy(Codigo,1,Posicion-1))
        else P := PrefijoGrupo(Codigo);
        if P<>'' then Valores.Add(P);
        Q.Next;
      end;
    finally Q.Free; end;
    Lista.Assign(Valores);
  finally Valores.Free; end;
end;

function SiguientePrefijoGrupo(DB: TIBDatabase; Tx: TIBTransaction): string;
var Lista: TStringList; I, N, Mayor: Integer;
begin
  Lista := TStringList.Create;
  try
    CargarPrefijosGrupo(DB, Tx, Lista); Mayor := 10000;
    for I := 0 to Lista.Count - 1 do begin
      N := StrToInt(Copy(Lista[I],2,MaxInt));
      if N > Mayor then Mayor := N;
    end;
    if Mayor = MaxInt then raise Exception.Create('No hay un prefijo siguiente disponible.');
    Result := 'F' + IntToStr(Mayor + 1);
  finally Lista.Free; end;
end;

function SiguienteCodigoGrupo(DB: TIBDatabase; Tx: TIBTransaction;
  const Prefijo: string): string;
var Q: TIBQuery; P, Grupo: string; N, Mayor: Integer;
begin
  Grupo := PrefijoGrupo(Prefijo);
  if Grupo = '' then raise Exception.Create('Indique un prefijo de grupo, por ejemplo F10001.');
  Mayor := 0; Q := ConsultaInventario(DB, Tx);
  try
    while not Q.Eof do begin
      if SepararCodigoGrupo(Q.FieldByName('CODIGO_TEXTO').AsString,P,N) then
        if (P = Grupo) and (N > Mayor) then Mayor := N;
      Q.Next;
    end;
  finally Q.Free; end;
  if Mayor = MaxInt then raise Exception.Create('La secuencia de este grupo esta agotada.');
  Result := Grupo + '-' + IntToStr(Mayor + 1);
end;

procedure BloquearGuardado(DB: TIBDatabase; Tx: TIBTransaction);
var Q: TIBQuery;
begin
  if not Tx.InTransaction then Tx.StartTransaction;
    // El bloqueo dura hasta el commit/rollback del guardado original, sin
    // consumir generadores ni crear reservas durante la sugerencia.
    Q := TIBQuery.Create(nil);
    try
      Q.Database := DB; Q.Transaction := Tx;
      Q.SQL.Text := 'SELECT CODIGO FROM TIPO_INVENTARIO WHERE CODIGO=1 WITH LOCK';
      try Q.Open;
      except on E: Exception do
        raise Exception.Create('Otro usuario esta guardando inventario. Reintente guardar. ' + E.Message);
      end;
      if Q.Eof then raise Exception.Create('Debe existir Tipo inventario 1-Bienes.');
    finally Q.Free; end;
end;

procedure ValidarCodigoGrupo(DB: TIBDatabase; Tx: TIBTransaction;
  const Codigo, Grupo: string; ExcluirProducto: Integer; Bloquear: Boolean);
var Q: TIBQuery; P, OtroP: string; N, OtroN: Integer;
begin
  if not SepararCodigoGrupo(Codigo,P,N) then
    raise Exception.Create('Codigo de producto invalido. Use grupo-consecutivo, por ejemplo F10001-41.');
  if P <> PrefijoGrupo(Grupo) then
    raise Exception.Create('El codigo no pertenece al grupo seleccionado. Seleccione el grupo correcto.');
  if not Tx.InTransaction then Tx.StartTransaction;
  if Bloquear then BloquearGuardado(DB,Tx);
  Q := ConsultaInventario(DB, Tx);
  try
    while not Q.Eof do begin
      if Q.FieldByName('CODIGO').AsInteger <> ExcluirProducto then begin
        if SepararCodigoGrupo(Q.FieldByName('CODIGO_TEXTO').AsString,OtroP,OtroN) then
          if (P=OtroP) and (N=OtroN) then
            raise Exception.Create('Este codigo ya pertenece a otro producto. Siguiente disponible: ' +
              SiguienteCodigoGrupo(DB,Tx,P));
      end;
      Q.Next;
    end;
  finally Q.Free; end;
end;

constructor TInventarioCodigoGrupo.Create(AOwner: TComponent;
  AParent: TWinControl; Datos: TIBDataSet);
var Etiqueta: TLabel;
begin
  inherited Create(AOwner);
  FPostados := TStringList.Create;
  FDatos := Datos;
  Etiqueta := TLabel.Create(Self); Etiqueta.Parent := AParent;
  Etiqueta.SetBounds(8,126,210,13); Etiqueta.Caption := 'Grupo / prefijo del codigo';
  FCombo := TComboBox.Create(Self); FCombo.Parent := AParent;
  FCombo.Name := 'cmbGrupoCodigoFerreteria';
  FCombo.SetBounds(8,142,209,21); FCombo.CharCase := ecUpperCase;
  FCombo.Sorted := True;
  FCombo.Style := csDropDown; FCombo.OnSelect := GrupoSeleccionado;
  FCombo.OnExit := GrupoSeleccionado;
  FCombo.Hint := 'Seleccione un grupo existente o escriba un prefijo F seguido de numeros.';
  FCombo.ShowHint := True;
  FBoton := TButton.Create(Self); FBoton.Parent := AParent;
  FBoton.Name := 'btnNuevoGrupoCodigoFerreteria';
  FBoton.SetBounds(225,140,209,25); FBoton.Caption := 'Nuevo grupo...';
  FBoton.OnClick := NuevoGrupo;
  CargarPrefijosGrupo(Datos.Database,Datos.Transaction,FCombo.Items);
  FAntesPost := Datos.BeforePost; FDespuesPost := Datos.AfterPost;
  FNuevoRegistro := Datos.OnNewRecord;
  Datos.BeforePost := AntesPost; Datos.AfterPost := DespuesPost;
  Datos.OnNewRecord := NuevoRegistro;
  FFuente := TDataSource.Create(Self); FFuente.DataSet := Datos;
  FFuente.OnDataChange := DatosCambian;
  DatosCambian(nil,nil);
end;

destructor TInventarioCodigoGrupo.Destroy;
begin
  if Assigned(FDatos) then begin
    if TMethod(FDatos.BeforePost).Data=Self then FDatos.BeforePost := FAntesPost;
    if TMethod(FDatos.AfterPost).Data=Self then FDatos.AfterPost := FDespuesPost;
    if TMethod(FDatos.OnNewRecord).Data=Self then FDatos.OnNewRecord := FNuevoRegistro;
  end;
  FPostados.Free;
  inherited Destroy;
end;

function TInventarioCodigoGrupo.ProximoCodigo(const Grupo: string): string;
var I, N, Mayor: Integer; P, Codigo: string;
begin
  Codigo := SiguienteCodigoGrupo(FDatos.Database,FDatos.Transaction,Grupo);
  SepararCodigoGrupo(Codigo,P,Mayor);
  Dec(Mayor);
  // Incluye los registros ya Post pero aun pendientes de ApplyUpdates.
  for I := 0 to FPostados.Count-1 do
    if SepararCodigoGrupo(FPostados.Names[I],P,N) then
      if (P=PrefijoGrupo(Grupo)) and (N>Mayor) then Mayor := N;
  if Mayor=MaxInt then raise Exception.Create('La secuencia de este grupo esta agotada.');
  Result := PrefijoGrupo(Grupo) + '-' + IntToStr(Mayor+1);
end;

procedure TInventarioCodigoGrupo.DatosCambian(Sender: TObject; Campo: TField);
var P: string; N: Integer;
begin
  if FInterno then Exit;
  FCombo.Enabled := FDatos.State=dsInsert;
  FBoton.Enabled := FDatos.State=dsInsert;
  if FDatos.Active and (FDatos.State=dsBrowse) then begin
    if not FDatos.UpdatesPending then FPostados.Clear;
    FAutomatico := '';
    if SepararCodigoGrupo(FDatos.FieldByName('CODIGO_TEXTO').AsString,P,N) then
      FCombo.Text := P
    else FCombo.Text := '';
  end;
end;

procedure TInventarioCodigoGrupo.SugerirCodigo;
var Actual, P: string;
begin
  if FInterno or (FDatos.State<>dsInsert) then Exit;
  P := PrefijoGrupo(FCombo.Text);
  if P='' then raise Exception.Create('Indique un prefijo valido, por ejemplo F10001.');
  Actual := Trim(FDatos.FieldByName('CODIGO_TEXTO').AsString);
  if (Actual<>'') and (Actual<>FAutomatico) then begin
    if MessageDlg('El codigo fue escrito manualmente. Cambiarlo por el siguiente del grupo ' +
      P + '?',mtConfirmation,[mbYes,mbNo],0)<>mrYes then Exit;
  end;
  FInterno := True;
  try
    FCombo.Text := P;
    FAutomatico := ProximoCodigo(P);
    FDatos.FieldByName('CODIGO_TEXTO').AsString := FAutomatico;
  finally FInterno := False; end;
end;

procedure TInventarioCodigoGrupo.GrupoSeleccionado(Sender: TObject);
begin
  if (FDatos.State=dsInsert) and (Trim(FCombo.Text)<>'') then SugerirCodigo;
end;

procedure TInventarioCodigoGrupo.NuevoGrupo(Sender: TObject);
var P: string; Lista: TStringList;
begin
  if FDatos.State<>dsInsert then Exit;
  P := SiguientePrefijoGrupo(FDatos.Database,FDatos.Transaction);
  if not InputQuery('Nuevo grupo','Prefijo del grupo (puede cambiarlo):',P) then Exit;
  P := PrefijoGrupo(P);
  if P='' then raise Exception.Create('Prefijo invalido. Use F seguido de numeros.');
  Lista := TStringList.Create;
  try
    CargarPrefijosGrupo(FDatos.Database,FDatos.Transaction,Lista);
    if Lista.IndexOf(P)>=0 then
      raise Exception.Create('El prefijo ya pertenece a un grupo. Seleccionelo en la lista o use otro para el nuevo grupo.');
  finally Lista.Free; end;
  FCombo.Text := P;
  SugerirCodigo;
end;

procedure TInventarioCodigoGrupo.NuevoRegistro(Datos: TDataSet);
begin
  if Assigned(FNuevoRegistro) then FNuevoRegistro(Datos);
  FAutomatico := '';
  Datos.FieldByName('TIPO').AsInteger := 1;
  if PrefijoGrupo(FCombo.Text)<>'' then SugerirCodigo;
end;

procedure TInventarioCodigoGrupo.AntesPost(Datos: TDataSet);
var Codigo, Grupo, Anterior, AnteriorP: string; N, ID, I: Integer;
begin
  if Assigned(FAntesPost) then FAntesPost(Datos);
  if FInterno or not (Datos.State in [dsInsert,dsEdit]) then Exit;
  Codigo := Trim(Datos.FieldByName('CODIGO_TEXTO').AsString);
  ID := -1;
  if Datos.State=dsEdit then begin
    ID := Datos.FieldByName('CODIGO').AsInteger;
    Anterior := VarToStr(Datos.FieldByName('CODIGO_TEXTO').OldValue);
    if Codigo=Trim(Anterior) then Exit; // No exige recodificar productos historicos.
    if SepararCodigoGrupo(Anterior,AnteriorP,N) then Grupo := AnteriorP
    else Grupo := FCombo.Text;
  end else Grupo := FCombo.Text;
  if (PrefijoGrupo(Grupo)='') and SepararCodigoGrupo(Codigo,AnteriorP,N) then Grupo := AnteriorP;
  if Codigo='' then begin
    Codigo := ProximoCodigo(Grupo);
    FAutomatico := Codigo;
  end;
  if SepararCodigoGrupo(Codigo,AnteriorP,N) then
    Codigo := AnteriorP + '-' + IntToStr(N);
  if (Datos.State=dsInsert) and (Codigo=FAutomatico) then begin
    BloquearGuardado(FDatos.Database,FDatos.Transaction);
    // Otra terminal pudo guardar desde que se mostro la sugerencia.
    Codigo := ProximoCodigo(Grupo);
    FAutomatico := Codigo;
  end;
  I := FPostados.IndexOfName(Codigo);
  if (I>=0) and (StrToIntDef(FPostados.ValueFromIndex[I],-2)<>ID) then
    raise Exception.Create('Este codigo ya pertenece a un producto pendiente de guardar.');
  ValidarCodigoGrupo(FDatos.Database,FDatos.Transaction,Codigo,Grupo,ID,True);
  Datos.FieldByName('CODIGO_TEXTO').AsString := Codigo;
end;

procedure TInventarioCodigoGrupo.DespuesPost(Datos: TDataSet);
var P, Codigo: string; N, I: Integer;
begin
  if Assigned(FDespuesPost) then FDespuesPost(Datos);
  if FInterno then Exit;
  if SepararCodigoGrupo(Datos.FieldByName('CODIGO_TEXTO').AsString,P,N) then begin
    if FCombo.Items.IndexOf(P)<0 then FCombo.Items.Add(P);
    // Un registro editado puede haber cambiado su consecutivo.
    for I := FPostados.Count-1 downto 0 do
      if FPostados.ValueFromIndex[I]=Datos.FieldByName('CODIGO').AsString then FPostados.Delete(I);
    Codigo := P+'-'+IntToStr(N);
    FPostados.Values[Codigo] := Datos.FieldByName('CODIGO').AsString;
  end;
  // El generador gamOnPost ya asigno CODIGO. Se conserva toda barra explicita.
  if (Trim(Datos.FieldByName('CODIGO_BARRA').AsString)='') and
     not Datos.FieldByName('CODIGO').IsNull then begin
    FInterno := True;
    try
      Datos.Edit;
      Datos.FieldByName('CODIGO_BARRA').AsString := Datos.FieldByName('CODIGO').AsString;
      Datos.Post;
    finally FInterno := False; end;
  end;
end;

end.
