unit UFormAsignarPermisoUsuarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, DB, IBCustomDataSet, IBQuery,
  Grids, DBGrids, RXDBCtrl, WinSkinData;

type
  TfrmPermisousuarios = class(TForm)
    Label1: TLabel;
    RadioGroup1: TRadioGroup;
    edtNombre: TEdit;
    SpeedButton1: TSpeedButton;
    qryPermisos: TIBQuery;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    dsqryPermisos: TDataSource;
    RxDBGrid1: TRxDBGrid;
    qryPermisosTAREA: TIBStringField;
    qryPermisosNOMBRECOMPLETO: TIBStringField;
    qryPermisosPERMISOID: TIntegerField;
    qryPermisosPROCESOID: TIntegerField;
    qryPermisosTAREAID: TIntegerField;
    qryPermisosUSERID: TIntegerField;
    qryPermisosISPERSON: TSmallintField;
    qryPermisosSTATUS: TSmallintField;
    qryPermisosPROCESO: TIBStringField;
    qryUsuarioroles: TIBQuery;
    qryUsuariorolesUSERID: TIntegerField;
    qryUsuariorolesDESCRIPCION: TIBStringField;
    SkinData1: TSkinData;
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPermisousuarios: TfrmPermisousuarios;
  xCodigoUsuario : Integer;


implementation

uses UGlobal, UfrmBuscarusuario, UConectar, UDatModCon,
  UFormActualizaPermisos, UDatModUsuarios, UFormBuscarRoles;

{$R *.dfm}

procedure TfrmPermisousuarios.SpeedButton1Click(Sender: TObject);
begin
  xCodigoUsuario:=-1;
  if RadioGroup1.ItemIndex = 1 then
  begin
  frmBuscarusuario:=TfrmBuscarusuario.Create(Nil);
  try
    if (edtNombre.Text = '') then
    begin
      if frmBuscarusuario.Showmodal = mrOk then
      begin
        edtNombre.Text := frmBuscarusuario.edtNombre.Text;
        if qryUsuarioroles.Locate('DESCRIPCION', edtNombre.Text, []) then
        xCodigoUsuario:=qryUsuariorolesUSERID.Value;
        //xCodigoUsuario := frmBuscarusuario.qryUsuariosCODIGO_EMPLEADO.Value;
        qryPermisos.Close;
        qryPermisos.Params[0].Value := RadioGroup1.ItemIndex;
        qryPermisos.Params[1].Value := 0;//USERID - NO USADO POR AHORA
        qryPermisos.Params[2].Value := xCodigoUsuario;
        qryPermisos.Open;
        
      end;
    end else
    begin
      frmBuscarusuario.edtNombre.Text := Trim(edtNombre.Text);
      if qryUsuarioroles.Locate('DESCRIPCION', Trim(edtNombre.Text), []) then
      xCodigoUsuario:=qryUsuariorolesUSERID.Value;

      if not frmBuscarusuario.Buscar(edtNombre.Text) then
      MessageDlg('Nombre no existe', mtInformation, [mbOk], 0)
      else
      begin
        xCodigoUsuario := frmBuscarusuario.qryUsuariosCODIGO_EMPLEADO.Value;
        qryPermisos.Close;
        qryPermisos.Params[0].Value := RadioGroup1.ItemIndex;
        qryPermisos.Params[1].Value := 0;//USERID - NO USADO POR AHORA
        qryPermisos.Params[2].Value := xCodigoUsuario;
        qryPermisos.Open;
      end;
    end;
  finally
  frmBuscarusuario.Free;
  frmBuscarusuario:= Nil;
  end;
  end else //buscar x rol
  begin
    frmBuscarRol:=TfrmBuscarRol.Create(Nil);
  try
    if (edtNombre.Text = '') then
    begin
      if frmBuscarRol.Showmodal = mrOk then
      begin
        edtNombre.Text := frmBuscarRol.edtNombre.Text;
        if qryUsuarioroles.Locate('DESCRIPCION', edtNombre.Text, []) then
        xCodigoUsuario:=frmBuscarRol.qryRolesUSERID.Value;
        //xCodigoUsuario := frmBuscarusuario.qryUsuariosCODIGO_EMPLEADO.Value;
        qryPermisos.Close;
        qryPermisos.Params[0].Value := RadioGroup1.ItemIndex;
        qryPermisos.Params[1].Value := 0;//USERID - NO USADO POR AHORA
        qryPermisos.Params[2].Value := xCodigoUsuario;
        qryPermisos.Open;

      end;
    end else
    begin
      frmBuscarRol.edtNombre.Text := Trim(edtNombre.Text);
      if qryUsuarioroles.Locate('DESCRIPCION', Trim(edtNombre.Text), []) then
      xCodigoUsuario:=frmBuscarRol.qryRolesUSERID.Value;

      if not frmBuscarRol.Buscar(edtNombre.Text) then
      MessageDlg('Nombre no existe', mtInformation, [mbOk], 0)
      else
      begin
        xCodigoUsuario := frmBuscarRol.qryRolesUSERID.Value;
        qryPermisos.Close;
        qryPermisos.Params[0].Value := RadioGroup1.ItemIndex;
        qryPermisos.Params[1].Value := 0;//USERID - NO USADO POR AHORA
        qryPermisos.Params[2].Value := xCodigoUsuario;
        qryPermisos.Open;
      end;
    end;
  finally
  frmBuscarusuario.Free;
  frmBuscarusuario:= Nil;
  end;
  end;
end;

procedure TfrmPermisousuarios.BitBtn1Click(Sender: TObject);
begin
  if (xCodigoUsuario > 0) then
  begin
    qryPermisos.Close;
    qryPermisos.Params[0].Value := RadioGroup1.ItemIndex;
    qryPermisos.Params[1].Value := 0;//USERID - NO USADO POR AHORA
    qryPermisos.Params[2].Value := xCodigoUsuario;
    qryPermisos.Open;
  end;
end;

procedure TfrmPermisousuarios.FormCreate(Sender: TObject);
begin
  xCodigoUsuario:=-1;
end;

procedure TfrmPermisousuarios.BitBtn2Click(Sender: TObject);
begin
  frmAsignarPermisos:=TfrmAsignarPermisos.create(Nil);
  try
    frmAsignarPermisos.xTipo:= RadioGroup1.ItemIndex;
    frmAsignarPermisos.userCod := xCodigoUsuario;
    frmAsignarPermisos.qryTareasxProceso.Close;
    frmAsignarPermisos.qryTareasxProceso.Open;
    
    qryPermisosNOMBRECOMPLETO.Value;
    frmAsignarPermisos.AbrirDatos;
    frmAsignarPermisos.Showmodal;
  finally
  frmAsignarPermisos.Free;
  frmAsignarPermisos:=Nil;
  end;
end;

procedure TfrmPermisousuarios.RadioGroup1Click(Sender: TObject);
begin
  qryUsuarioroles.Close;
  qryUsuarioroles.Params[0].Value:= RadioGroup1.ItemIndex;
  qryUsuarioroles.Open;
end;

end.
