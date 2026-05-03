unit UGestionPermisos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, StdCtrls, DBCtrls, ComCtrls;

type
  TfrmGestionPermisos = class(TForm)
    Label1: TLabel;
    dbcbEmpleado: TDBLookupComboBox;
    Label2: TLabel;
    dtpFechaVence: TDateTimePicker;
    edtLicencia: TEdit;
    Label3: TLabel;
    btnActualizar: TButton;
    qEmpleados: TIBQuery;
    dsEmpleados: TDataSource;
    qUpdate: TIBQuery;
    procedure FormCreate(Sender: TObject);
    procedure btnActualizarClick(Sender: TObject);
    procedure dbcbEmpleadoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGestionPermisos: TfrmGestionPermisos;

implementation

uses UDataModule;

{$R *.dfm}

procedure TfrmGestionPermisos.FormCreate(Sender: TObject);
begin
  qEmpleados.Open;
  dtpFechaVence.Date := Now;
end;

procedure TfrmGestionPermisos.dbcbEmpleadoClick(Sender: TObject);
begin
  if not qEmpleados.IsEmpty then
  begin
    edtLicencia.Text := qEmpleados.FieldByName('LICENCIA').AsString;
    if not qEmpleados.FieldByName('FECHA_VENCE_LICENCIA').IsNull then
      dtpFechaVence.Date := qEmpleados.FieldByName('FECHA_VENCE_LICENCIA').AsDateTime;
  end;
end;

procedure TfrmGestionPermisos.btnActualizarClick(Sender: TObject);
begin
  if dbcbEmpleado.KeyValue = null then Exit;

  if not DataModule1.IBTransaction1.InTransaction then
    DataModule1.IBTransaction1.StartTransaction;

  try
    qUpdate.SQL.Text := 'UPDATE EMPLEADO SET LICENCIA = :LIC, FECHA_VENCE_LICENCIA = :FV WHERE CODIGO = :EMP';
    qUpdate.ParamByName('LIC').AsString := edtLicencia.Text;
    qUpdate.ParamByName('FV').AsDateTime := dtpFechaVence.Date;
    qUpdate.ParamByName('EMP').AsInteger := dbcbEmpleado.KeyValue;
    qUpdate.ExecSQL;
    
    DataModule1.IBTransaction1.CommitRetaining;
    
    ShowMessage('Licencia actualizada correctamente.');
    
    qEmpleados.Close;
    qEmpleados.Open;
  except
    on E: Exception do
    begin
      DataModule1.IBTransaction1.RollbackRetaining;
      ShowMessage('Error: ' + E.Message);
    end;
  end;
end;

end.
