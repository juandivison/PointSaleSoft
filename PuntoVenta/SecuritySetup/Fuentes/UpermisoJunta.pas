unit UpermisoJunta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, RXCtrls, RXDBCtrl, DB, Grids, DBGrids,
  RxLookup, WinSkinData;

type
  TfrmPermisoJunta = class(TForm)
    Label2: TLabel;
    Label1: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    RxDBLookupCombo2: TRxDBLookupCombo;
    RxDBGrid1: TRxDBGrid;
    dstblJuntas: TDataSource;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton1: TSpeedButton;
    DBStatusLabel1: TDBStatusLabel;
    SpeedButton4: TSpeedButton;
    BitBtn1: TBitBtn;
    SkinData1: TSkinData;
    RxDBGrid2: TRxDBGrid;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    Label3: TLabel;
    RxDBGrid3: TRxDBGrid;
    Label4: TLabel;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
  private
    { Private declarations }
    procedure AsignarPermiso(accion : smallint);
  public
    { Public declarations }
  end;

var
  frmPermisoJunta: TfrmPermisoJunta;

implementation
uses UDatModUsuarios, uglobal, UFormDatosTareaxProceso, UDatmodPermisos;
{$R *.dfm}

procedure TfrmPermisoJunta.FormCreate(Sender: TObject);
begin
  if (dmpermisos = nil) then
  dmpermisos:=tdmpermisos.Create(Nil);
  dmpermisos.tblPermisoJunta.close;
  dmpermisos.tblPermisoJunta.Open;
  dmPermisos.qryJuntas.Close;
  dmPermisos.qryJuntas.Open;
  dmUsuarios.qryUsuarios.Close;
  dmUsuarios.qryUsuarios.Open;
end;

procedure TfrmPermisoJunta.SpeedButton2Click(Sender: TObject);
begin
  if dmpermisos.tblPermisoJunta.state = dsBrowse then
  begin
    dmpermisos.tblPermisoJunta.Insert;
    dmpermisos.tblPermisoJuntaSTATUS.Value := 'A';
  end;
end;

procedure TfrmPermisoJunta.SpeedButton4Click(Sender: TObject);
begin
  if dmpermisos.tblPermisoJunta.state = dsBrowse then
  dmpermisos.tblPermisoJunta.Edit;

end;

procedure TfrmPermisoJunta.SpeedButton3Click(Sender: TObject);
begin
  if dmpermisos.tblPermisoJunta.State In [dsEdit, dsInsert] then
  dmpermisos.tblPermisoJunta.Edit;
end;

procedure TfrmPermisoJunta.BitBtn1Click(Sender: TObject);
begin
  if dmpermisos.tblPermisoJunta.State In [dsInactive, dsBrowse] then
  begin
    dmpermisos.tblPermisoJunta.Close;
    dmpermisos.tblPermisoJunta.Open;
  end;
end;

procedure TfrmPermisoJunta.SpeedButton1Click(Sender: TObject);
begin
  GlbSalvarQuery(dmpermisos.tblPermisoJunta);
end;

procedure TfrmPermisoJunta.SpeedButton5Click(Sender: TObject);
var
 x, i : integer;
begin
  if RxDBGrid2.SelectedRows.Count > 0 then
  begin
    with RxDBGrid2.DataSource.DataSet do
    begin
      for i := 0 to RxDBGrid2.SelectedRows.Count-1 do
      begin
        GotoBookmark(Pointer(RxDBGrid2.SelectedRows.Items[i]));
        if RxDBGrid3.SelectedRows.Count > 0 then
        begin
          with RxDBGrid3.DataSource.DataSet do
          begin
            for x:=0 to RxDBGrid3.SelectedRows.Count-1 do
            begin
              GotoBookmark(Pointer(RxDBGrid3.SelectedRows.Items[x]));
              AsignarPermiso(1);
            end;
          end;
        end;
      end;
    end;
  end;
  RxDBGrid2.SelectedRows.Clear;
  RxDBGrid3.SelectedRows.Clear;
end;

procedure TfrmPermisoJunta.AsignarPermiso(accion : smallint);
begin
  if Not dmpermisos.tblPermisoJunta.Locate('IDJUNTA;CODIGO_USUARIO',
  VarArrayOf([dmpermisos.qryJuntasACCOUNT_ID.Value,
              dmUsuarios.qryUsuariosCODIGO_EMPLEADO.Value]),[]) then
  begin
    if (accion = 1) then
    begin
      dmpermisos.tblPermisoJunta.Insert;
      dmpermisos.tblPermisoJuntaIDJUNTA.Value := dmpermisos.qryJuntasACCOUNT_ID.Value;
      dmpermisos.tblPermisoJuntaCODIGO_USUARIO.Value:= dmUsuarios.qryUsuariosCODIGO_EMPLEADO.Value;
      dmpermisos.tblPermisoJuntaSTATUS.Value := 'A';
      dmpermisos.tblPermisoJunta.Post;
      GlbSalvarQuery(dmpermisos.tblPermisoJunta);
    end;
  end else
  begin
    if (Accion = 0) then
    begin
      dmpermisos.tblPermisoJunta.Delete;
      GlbSalvarQuery(dmpermisos.tblPermisoJunta);
    end;
  end;
end;

procedure TfrmPermisoJunta.SpeedButton6Click(Sender: TObject);
var
 x, i : integer;
begin
  if RxDBGrid2.SelectedRows.Count > 0 then
  begin
    with RxDBGrid2.DataSource.DataSet do
    begin
      for i := 0 to RxDBGrid2.SelectedRows.Count-1 do
      begin
        GotoBookmark(Pointer(RxDBGrid2.SelectedRows.Items[i]));
        if RxDBGrid3.SelectedRows.Count > 0 then
        begin
          with RxDBGrid3.DataSource.DataSet do
          begin
            for x:=0 to RxDBGrid3.SelectedRows.Count-1 do
            begin
              GotoBookmark(Pointer(RxDBGrid3.SelectedRows.Items[x]));
              AsignarPermiso(1);
            end;
          end;
        end;
      end;
    end;
  end;
  RxDBGrid2.SelectedRows.Clear;
  RxDBGrid3.SelectedRows.Clear;
end;

procedure TfrmPermisoJunta.SpeedButton7Click(Sender: TObject);
var
 x, i : integer;
begin
  if RxDBGrid2.SelectedRows.Count > 0 then
  begin
    with RxDBGrid2.DataSource.DataSet do
    begin
      for i := 0 to RxDBGrid2.SelectedRows.Count-1 do
      begin
        GotoBookmark(Pointer(RxDBGrid2.SelectedRows.Items[i]));
        if RxDBGrid3.SelectedRows.Count > 0 then
        begin
          with RxDBGrid3.DataSource.DataSet do
          begin
            for x:=0 to RxDBGrid3.SelectedRows.Count-1 do
            begin
              GotoBookmark(Pointer(RxDBGrid3.SelectedRows.Items[x]));
              AsignarPermiso(0);
            end;
          end;
        end;
      end;
    end;
  end;
  RxDBGrid2.SelectedRows.Clear;
  RxDBGrid3.SelectedRows.Clear;
end;

procedure TfrmPermisoJunta.SpeedButton8Click(Sender: TObject);
var
 x, i : integer;
begin
  if RxDBGrid2.SelectedRows.Count > 0 then
  begin
    with RxDBGrid2.DataSource.DataSet do
    begin
      for i := 0 to RxDBGrid2.SelectedRows.Count-1 do
      begin
        GotoBookmark(Pointer(RxDBGrid2.SelectedRows.Items[i]));
        if RxDBGrid3.SelectedRows.Count > 0 then
        begin
          with RxDBGrid3.DataSource.DataSet do
          begin
            for x:=0 to RxDBGrid3.SelectedRows.Count-1 do
            begin
              GotoBookmark(Pointer(RxDBGrid3.SelectedRows.Items[x]));
              AsignarPermiso(0);
            end;
          end;
        end;
      end;
    end;
  end;
  RxDBGrid2.SelectedRows.Clear;
  RxDBGrid3.SelectedRows.Clear;
end;

end.
