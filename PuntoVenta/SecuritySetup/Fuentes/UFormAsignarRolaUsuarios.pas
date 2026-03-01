unit UFormAsignarRolaUsuarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  db, Dialogs, RxLookup, StdCtrls, Buttons, Grids, DBGrids, RXDBCtrl, RXCtrls,
  WinSkinData;

type
  TfrmAsignarRol = class(TForm)
    Label2: TLabel;
    RxDBLookupCombo2: TRxDBLookupCombo;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label1: TLabel;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton1: TSpeedButton;
    DBStatusLabel1: TDBStatusLabel;
    RxDBGrid1: TRxDBGrid;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    BitBtn1: TBitBtn;
    SpeedButton4: TSpeedButton;
    RxDBGrid2: TRxDBGrid;
    Label3: TLabel;
    Label4: TLabel;
    RxDBGrid3: TRxDBGrid;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SkinData1: TSkinData;
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure RxDBGrid3CellClick(Column: TColumn);
  private
    { Private declarations }
    procedure procAsignarol(accion : Integer);
  public
    { Public declarations }
  end;

var
  frmAsignarRol: TfrmAsignarRol;

implementation

uses UDatModUsuarios, uglobal;

{$R *.dfm}

procedure TfrmAsignarRol.BitBtn10Click(Sender: TObject);
begin
  dmUsuarios.tblRolUsuario.Prior;
end;

procedure TfrmAsignarRol.BitBtn11Click(Sender: TObject);
begin
  dmUsuarios.tblRolUsuario.Next;
end;

procedure TfrmAsignarRol.BitBtn12Click(Sender: TObject);
begin
  dmUsuarios.tblRolUsuario.Last;
end;

procedure TfrmAsignarRol.BitBtn9Click(Sender: TObject);
begin
  dmUsuarios.tblRolUsuario.first;
end;

procedure TfrmAsignarRol.SpeedButton1Click(Sender: TObject);
begin
  if dmUsuarios.tblRolUsuario.State in [dsinsert, dsEdit] then
  begin
    if dmUsuarios.tblRolUsuario.State in [dsEdit] then
    dmUsuarios.tblRolUsuarioFECHA_UPDATE.Value:=now;
    dmUsuarios.tblRolUsuario.Post;
    dmUsuarios.tblRolUsuario.ApplyUpdates;
    if not dmUsuarios.tblRolUsuario.Transaction.InTransaction then
    dmUsuarios.tblRolUsuario.Transaction.StartTransaction;
    try
      dmUsuarios.tblRolUsuario.Transaction.CommitRetaining;
    except
    dmUsuarios.tblRolUsuario.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmAsignarRol.SpeedButton2Click(Sender: TObject);
begin
  if dmUsuarios.tblRolUsuario.State = dsBrowse then
  begin
    dmUsuarios.tblRolUsuario.Insert;
    dmUsuarios.tblRolUsuarioCODIGO_USER.Value:= VarUsuarioGlb;
    dmUsuarios.tblRolUsuarioFECHA_IN.Value:=now;
    RxDBLookupCombo2.SetFocus;
  end;
end;

procedure TfrmAsignarRol.SpeedButton3Click(Sender: TObject);
begin
  if dmUsuarios.tblRolUsuario.State in [dsinsert, dsEdit] then
  begin
    dmUsuarios.tblRolUsuario.Cancel;
  end;
end;

procedure TfrmAsignarRol.BitBtn1Click(Sender: TObject);
begin
  dmUsuarios.tblRolUsuario.Close;
  dmUsuarios.tblRolUsuario.Open;
end;

procedure TfrmAsignarRol.FormCreate(Sender: TObject);
begin
  dmUsuarios.qryUsuarios.Close;
  dmUsuarios.qryUsuarios.Open;
  dmUsuarios.qryRoles.Close;
  dmUsuarios.qryRoles.Open;
  dmUsuarios.tblRolUsuario.Close;
  dmUsuarios.tblRolUsuario.Open;
  dmUsuarios.tblRolLookup.Close;
  dmUsuarios.tblRolLookup.Open;
  dmUsuarios.tblUsuarioLookup.Close;
  dmUsuarios.tblUsuarioLookup.Open;
end;

procedure TfrmAsignarRol.SpeedButton4Click(Sender: TObject);
begin
  dmUsuarios.tblRolUsuario.Edit;
end;

procedure TfrmAsignarRol.SpeedButton5Click(Sender: TObject);
var
 x, i : integer;
begin
  if RxDBGrid3.SelectedRows.Count > 0 then
  begin
    with RxDBGrid3.DataSource.DataSet do
    begin
      for i := 0 to RxDBGrid3.SelectedRows.Count-1 do
      begin
        GotoBookmark(Pointer(RxDBGrid3.SelectedRows.Items[i]));
        if RxDBGrid2.SelectedRows.Count > 0 then
        begin
          with RxDBGrid2.DataSource.DataSet do
          begin
            for x:=0 to RxDBGrid2.SelectedRows.Count-1 do
            begin
              GotoBookmark(Pointer(rxDBGrid2.SelectedRows.Items[x]));
              procAsignarol(1);
            end;
          end;
        end;
        //sum:= sum + AdoQuery1.FieldByName('Size').AsFloat;
      end;
    end;
    //edSizeSum.Text :=  FloatToStr(sum);
  end;
end;

procedure TfrmAsignarRol.procAsignarol(accion: Integer);
begin
  if (accion = 1) then
  begin
    if not dmUsuarios.tblRolUsuario.Locate('ID_ROL;ID_USUARIO',
    VarArrayOf([dmUsuarios.qryRolesUSERID.Value,
    dmUsuarios.qryUsuariosCODIGO_EMPLEADO.Value]),[]) then
    begin
      dmUsuarios.tblRolUsuario.Insert;
      dmUsuarios.tblRolUsuarioID_ROL.Value    := dmUsuarios.qryRolesUSERID.Value;
      dmUsuarios.tblRolUsuarioID_USUARIO.Value:= dmUsuarios.qryUsuariosCODIGO_EMPLEADO.Value;
      dmUsuarios.tblRolUsuarioFECHA_IN.Value  := Now;
      dmUsuarios.tblRolUsuarioCODIGO_USER.Value:= VarUsuarioGlb;
      dmUsuarios.tblRolUsuarioFECHA_IN.Value   := Now;
      SpeedButton1Click(self);
    end else
    begin
      MessageDlg('Rol ya fue asignado, verifique', mtError, [mbOk],0);
    end;
  end else
  if (accion = 0) then
  begin
    if dmUsuarios.tblRolUsuario.Locate('id_rol;Id_usuario',
    VarArrayOf([dmUsuarios.qryRolesUSERID.Value,
    dmUsuarios.qryUsuariosCodigo_empleado.Value]), []) then
    begin
      //dmUsuarios.dsqryRoles
      dmUsuarios.tblRolUsuario.Delete;
      dmUsuarios.tblRolUsuario.ApplyUpdates;
      if Not dmUsuarios.tblRolUsuario.Transaction.InTransaction then
      dmUsuarios.tblRolUsuario.Transaction.StartTransaction;
      try
        dmUsuarios.tblRolUsuario.Transaction.CommitRetaining;
      except
      dmUsuarios.tblRolUsuario.Transaction.RollbackRetaining;
      end;
    end;
    SpeedButton1Click(self);
  end;
end;

procedure TfrmAsignarRol.SpeedButton6Click(Sender: TObject);
var
 x, i : integer;
begin
  if RxDBGrid1.SelectedRows.Count > 0 then
  begin
    with RxDBGrid1.DataSource.DataSet do
    begin
      for i := 0 to RxDBGrid1.SelectedRows.Count-1 do
      begin
        GotoBookmark(Pointer(RxDBGrid1.SelectedRows.Items[i]));
        procAsignarol(0);
      end;
    end;
  end;
  dmUsuarios.qryUsuarios.Close;
  dmUsuarios.qryUsuarios.Open;
  dmUsuarios.qryRoles.Close;
  dmUsuarios.qryRoles.Open;
  dmUsuarios.tblRolUsuario.Close;
  dmUsuarios.tblRolUsuario.Open;
end;

procedure TfrmAsignarRol.RxDBGrid3CellClick(Column: TColumn);
begin
  dmUsuarios.tblRolUsuario.Locate('ID_ROL;ID_USUARIO',
  VarArrayOf([dmUsuarios.qryRolesUSERID.Value,
  dmUsuarios.qryUsuariosCODIGO_EMPLEADO.Value]),[]);
end;

end.
