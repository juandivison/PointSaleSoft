unit UFrmMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IBDatabase, IBQuery, DB;

type
  TForm1 = class(TForm)
    lblUser: TLabel;
    cbUsuario: TComboBox;
    btnReload: TButton;
    btnEnroll: TButton;
    btnAuthGlobal: TButton;
    btnDeviceInfo: TButton;
    lblTask: TLabel;
    cbTarea: TComboBox;
    btnAuth: TButton;
    memoLog: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure btnReloadClick(Sender: TObject);
    procedure btnEnrollClick(Sender: TObject);
    procedure btnAuthGlobalClick(Sender: TObject);
    procedure btnDeviceInfoClick(Sender: TObject);
    procedure btnAuthClick(Sender: TObject);
  private
    procedure Log(const S: string);
    procedure EnsureDbConnected;
    procedure LoadUsuarios;
    procedure LoadTareas;
    function SelectedUsuarioNumero: Integer;
    function SelectedTaskCode: string;
  public
  end;

var
  Form1: TForm1;

implementation

uses
  UDMdb, UFingerprintIBX, UFrmFpDeviceInfo;

{$R *.dfm}

procedure TForm1.Log(const S: string);
begin
  memoLog.Lines.Add(FormatDateTime('hh:nn:ss', Now) + ' | ' + S);
end;

procedure TForm1.EnsureDbConnected;
begin
  if (dmconectar = nil) or (dmconectar.IBDatabase1 = nil) then
    raise Exception.Create('DataModule/IBDatabase no disponible.');

  if not dmconectar.IBDatabase1.Connected then
  begin
    dmconectar.IBDatabase1.Open;
    Log('DB Connected: ' + dmconectar.IBDatabase1.DatabaseName);
  end;
end;

procedure TForm1.LoadUsuarios;
var
  Q: TIBQuery;
  num: Integer;
  cod: string;
begin
  cbUsuario.Items.Clear;
  Q := TIBQuery.Create(nil);
  try
    Q.Database := dmconectar.IBDatabase1;
    Q.Transaction := dmconectar.IBTransaction1;
    Q.SQL.Text := 'select numero, codigo from usuario order by codigo';
    Q.Open;
    while not Q.Eof do
    begin
      num := Q.FieldByName('NUMERO').AsInteger;
      cod := Trim(Q.FieldByName('CODIGO').AsString);
      cbUsuario.Items.AddObject(cod + ' (' + IntToStr(num) + ')', TObject(num));
      Q.Next;
    end;
  finally
    Q.Free;
  end;

  if cbUsuario.Items.Count > 0 then cbUsuario.ItemIndex := 0;
  Log('Usuarios cargados: ' + IntToStr(cbUsuario.Items.Count));
end;

procedure TForm1.LoadTareas;
var
  Q: TIBQuery;
  code, desc: string;
begin
  cbTarea.Items.Clear;
  Q := TIBQuery.Create(nil);
  try
    Q.Database := dmconectar.IBDatabase1;
    Q.Transaction := dmconectar.IBTransaction1;
    Q.SQL.Text := 'select codigo, descripcion from sec_tarea where activa = 1 order by codigo';
    Q.Open;
    while not Q.Eof do
    begin
      code := Trim(Q.FieldByName('CODIGO').AsString);
      desc := Trim(Q.FieldByName('DESCRIPCION').AsString);
      if desc <> '' then
        cbTarea.Items.Add(code + ' - ' + desc)
      else
        cbTarea.Items.Add(code);
      Q.Next;
    end;
  finally
    Q.Free;
  end;

  if cbTarea.Items.Count > 0 then cbTarea.ItemIndex := 0;
  Log('Tareas cargadas: ' + IntToStr(cbTarea.Items.Count));
end;

function TForm1.SelectedUsuarioNumero: Integer;
begin
  Result := 0;
  if cbUsuario.ItemIndex < 0 then Exit;
  Result := Integer(cbUsuario.Items.Objects[cbUsuario.ItemIndex]);
end;

function TForm1.SelectedTaskCode: string;
var
  s: string;
  p: Integer;
begin
  Result := '';
  if cbTarea.ItemIndex < 0 then Exit;
  s := cbTarea.Items[cbTarea.ItemIndex];
  p := Pos(' - ', s);
  if p > 0 then
    Result := Copy(s, 1, p-1)
  else
    Result := s;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Caption := 'Test DigitalPersona - Enroll/Verify';
  EnsureDbConnected;
  LoadUsuarios;
  LoadTareas;
end;

procedure TForm1.btnReloadClick(Sender: TObject);
begin
  EnsureDbConnected;
  LoadUsuarios;
  LoadTareas;
end;

procedure TForm1.btnEnrollClick(Sender: TObject);
var
  u: Integer;
begin
  EnsureDbConnected;
  u := SelectedUsuarioNumero;
  if u <= 0 then
  begin
    Log('Seleccione un usuario.');
    Exit;
  end;

  Log('Enrolando huella para usuario #' + IntToStr(u));
  EnrolarHuellaUsuarioIBX(u, dmconectar.IBDatabase1);
  Log('Enroll finalizado (si el lector/OCX esta disponible, el template queda guardado).');
end;


procedure TForm1.btnAuthGlobalClick(Sender: TObject);
var
  u, far: Integer;
begin
  EnsureDbConnected;

  Log('Validando huella (global, cualquier usuario enrolado)...');
  if HuellaEnroladaIBX(dmconectar.IBDatabase1, u, far) then
    Log('HUELLA ENROLADA: usuario #' + IntToStr(u) + ' | FAR=' + IntToStr(far))
  else
    Log('HUELLA NO ENCONTRADA / Cancelado / Sin huellas enroladas.');
end;


procedure TForm1.btnDeviceInfoClick(Sender: TObject);
begin
  ShowFingerprintDeviceInfo(Application);
end;

procedure TForm1.btnAuthClick(Sender: TObject);
var
  task: string;
  u, far: Integer;
begin
  EnsureDbConnected;
  task := SelectedTaskCode;
  if task = '' then
  begin
    Log('Seleccione una tarea.');
    Exit;
  end;

  Log('Autorizando tarea: ' + task);
  if AutorizarTareaPorHuellaIBX(task, dmconectar.IBDatabase1, u, far) then
    Log('AUTORIZADO por usuario #' + IntToStr(u) + ' | FAR=' + IntToStr(far))
  else
    Log('NO AUTORIZADO (sin match / cancelado / sin candidatos).');
end;

end.
