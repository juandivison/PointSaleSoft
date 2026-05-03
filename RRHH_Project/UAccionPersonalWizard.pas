unit UAccionPersonalWizard;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, StdCtrls, ExtCtrls, IBDatabase,
  DBCtrls, Grids, DBGrids;

type
  TfrmAccionPersonalWizard = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtDatoAnterior: TEdit;
    Label4: TLabel;
    edtDatoNuevo: TEdit;
    Label5: TLabel;
    memoJustificacion: TMemo;
    Label6: TLabel;
    edtRutaSoporte: TEdit;
    btnBuscarSoporte: TButton;
    btnProcesar: TButton;
    OpenDialog1: TOpenDialog;
    qEmpleados: TIBQuery;
    qTiposAccion: TIBQuery;
    dsEmpleados: TDataSource;
    dsTiposAccion: TDataSource;
    dbcbEmpleado: TDBLookupComboBox;
    dbcbTipoAccion: TDBLookupComboBox;
    qTransaccion: TIBQuery;
    IBTransactionTrans: TIBTransaction;
    procedure FormCreate(Sender: TObject);
    procedure btnBuscarSoporteClick(Sender: TObject);
    procedure btnProcesarClick(Sender: TObject);
    procedure dbcbEmpleadoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAccionPersonalWizard: TfrmAccionPersonalWizard;

implementation

uses UDataModule;

{$R *.dfm}

procedure TfrmAccionPersonalWizard.FormCreate(Sender: TObject);
begin
  if not DataModule1.IBDatabase1.Connected then
    DataModule1.IBDatabase1.Connected := True;
    
  qEmpleados.Open;
  qTiposAccion.Open;
end;

procedure TfrmAccionPersonalWizard.dbcbEmpleadoClick(Sender: TObject);
begin
  // Al seleccionar el empleado, podemos mostrar su salario actual o cargo en DatoAnterior
  // Aquí es un ejemplo asumiendo que qEmpleados trae el SALARIO
  if not qEmpleados.IsEmpty then
    edtDatoAnterior.Text := 'Salario: ' + qEmpleados.FieldByName('SALARIO').AsString;
end;

procedure TfrmAccionPersonalWizard.btnBuscarSoporteClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
    edtRutaSoporte.Text := OpenDialog1.FileName;
end;

procedure TfrmAccionPersonalWizard.btnProcesarClick(Sender: TObject);
var
  CodEmpleado, TipoAccion: Integer;
begin
  if (dbcbEmpleado.KeyValue = null) or (dbcbTipoAccion.KeyValue = null) then
  begin
    ShowMessage('Debe seleccionar un empleado y un tipo de acción.');
    Exit;
  end;

  if Trim(edtDatoNuevo.Text) = '' then
  begin
    ShowMessage('Debe ingresar el nuevo dato.');
    Exit;
  end;

  CodEmpleado := dbcbEmpleado.KeyValue;
  TipoAccion := dbcbTipoAccion.KeyValue;

  if not IBTransactionTrans.InTransaction then
    IBTransactionTrans.StartTransaction;

  try
    // Paso A: Insertar el histórico en RRHH_ACCIONES_PERSONAL
    qTransaccion.SQL.Text := 
      'INSERT INTO RRHH_ACCIONES_PERSONAL (CODIGO, COD_EMPLEADO, FECHA_ACCION, ' +
      'TIPO_ACCION, DATO_ANTERIOR, DATO_NUEVO, JUSTIFICACION, RUTA_DOCUMENTO_SOPORTE) ' +
      'VALUES (GEN_ID(GEN_RRHH_ACCIONES_ID, 1), :EMP, CURRENT_TIMESTAMP, :TIPO, :ANT, :NUEVO, :JUST, :RUTA)';
    qTransaccion.ParamByName('EMP').AsInteger := CodEmpleado;
    qTransaccion.ParamByName('TIPO').AsInteger := TipoAccion;
    qTransaccion.ParamByName('ANT').AsString := edtDatoAnterior.Text;
    qTransaccion.ParamByName('NUEVO').AsString := edtDatoNuevo.Text;
    qTransaccion.ParamByName('JUST').AsString := memoJustificacion.Text;
    qTransaccion.ParamByName('RUTA').AsString := edtRutaSoporte.Text;
    qTransaccion.ExecSQL;

    // Paso B: Actualizar la tabla EMPLEADO (Ej: actualizando el SALARIO)
    // Se asume que el usuario digitó el monto en edtDatoNuevo (o en otro campo específico)
    qTransaccion.SQL.Text := 
      'UPDATE EMPLEADO SET SALARIO = :NUEVOSALARIO ' +
      'WHERE CODIGO = :EMP';
    // Aqui se asume que DATO_NUEVO contiene solo el numero para este ejemplo
    // En produccion puede haber campos especificos para el nuevo salario.
    qTransaccion.ParamByName('NUEVOSALARIO').AsFloat := StrToFloatDef(edtDatoNuevo.Text, 0);
    qTransaccion.ParamByName('EMP').AsInteger := CodEmpleado;
    qTransaccion.ExecSQL;

    // Paso C: Commit de la transaccion
    IBTransactionTrans.Commit;
    
    ShowMessage('Acción de personal procesada y registrada exitosamente.');
    
    // Limpiar campos
    edtDatoAnterior.Clear;
    edtDatoNuevo.Clear;
    memoJustificacion.Clear;
    edtRutaSoporte.Clear;
    
    // Refrescar dataset de empleados
    qEmpleados.Close;
    qEmpleados.Open;
  except
    on E: Exception do
    begin
      IBTransactionTrans.Rollback;
      ShowMessage('Error al procesar la acción: ' + E.Message);
    end;
  end;
end;

end.
