unit UFormActualizaPermisos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  db, Dialogs, StdCtrls, Buttons, DBCtrls, Grids, DBGrids, RXDBCtrl,
  IBCustomDataSet, IBQuery, RxMemDS, WinSkinData;

type
  TfrmAsignarPermisos = class(TForm)
    BitBtn1: TBitBtn;
    RxDBGrid1: TRxDBGrid;
    DataSource1: TDataSource;
    qryUsuarios: TIBQuery;
    qryUsuariosUSERID: TIntegerField;
    qryUsuariosDESCRIPCION: TIBStringField;
    rxUsuarios: TRxMemoryData;
    rxUsuariosrxDescripcion: TStringField;
    qryTareasxProceso: TIBQuery;
    RxDBGrid2: TRxDBGrid;
    DataSource2: TDataSource;
    BitBtn2: TBitBtn;
    qryTareasxProcesoPROCESOID: TIntegerField;
    qryTareasxProcesoTAREAID: TIntegerField;
    qryTareasxProcesoPROCESO: TIBStringField;
    qryTareasxProcesoTAREA: TIBStringField;
    Label1: TLabel;
    Label2: TLabel;
    SkinData1: TSkinData;
    rxUsuariosuserCod: TIntegerField;
    qryPermisosAsignados: TIBQuery;
    qryTareasxProcesostatus: TIntegerField;
    qryPermisosAsignadosPROCESOID: TIntegerField;
    qryPermisosAsignadosTAREAID: TIntegerField;
    qryPermisosAsignadosUSERID: TIntegerField;
    qryPermisosAsignadosSTATUS: TSmallintField;
    RxDBGrid3: TRxDBGrid;
    DataSource3: TDataSource;
    rxUsuariosrxTipo: TBooleanField;
    CheckBox1: TCheckBox;
    edtTarea: TEdit;
    Label3: TLabel;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    qryTareasxProceso_base: TIBQuery;
    procedure BitBtn1Click(Sender: TObject);
    procedure qryUsuariosAfterOpen(DataSet: TDataSet);
    procedure BitBtn2Click(Sender: TObject);
    procedure RxDBGrid1GetCellProps(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor);
    procedure qryTareasxProcesoCalcFields(DataSet: TDataSet);
    procedure qryTareasxProcesoAfterOpen(DataSet: TDataSet);
    procedure RxDBGrid2GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure qryTareasxProcesoBeforeOpen(DataSet: TDataSet);
    procedure qryTareasxProcesoAfterScroll(DataSet: TDataSet);
    procedure rxUsuariosAfterScroll(DataSet: TDataSet);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure qryTareasxProcesoFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure CheckBox3Click(Sender: TObject);
    procedure RxDBGrid2TitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
    xTipo : integer;
    usercod : Integer;
    procedure abrirDatos;
    procedure procTarea(accion : smallint );
  end;

var
  frmAsignarPermisos: TfrmAsignarPermisos;
  _campoFiltrar : string;
  sortOrder : string;
implementation

uses UDatModCon, UDatModUsuarios, UFormDatosTareaxProceso;

{$R *.dfm}

procedure TfrmAsignarPermisos.BitBtn1Click(Sender: TObject);
var
  i,x: Integer;
  sum : Single;
  guardarRec : TBookMark;
begin
  guardarRec := qryTareasxProceso.GetBookmark;
  if rxDBGrid1.SelectedRows.Count > 0 then
  begin
    sum := 0;
    with rxDBGrid1.DataSource.DataSet do
    begin
      for i := 0 to rxDBGrid1.SelectedRows.Count-1 do
      begin
        GotoBookmark(Pointer(rxDBGrid1.SelectedRows.Items[i]));
        if RxDBGrid2.SelectedRows.Count > 0 then
        begin
          with RxDBGrid2.DataSource.DataSet do
          begin
            for x:=0 to RxDBGrid2.SelectedRows.Count-1 do
            begin
              GotoBookmark(Pointer(rxDBGrid2.SelectedRows.Items[x]));
              procTarea(1);
            end;
          end;
        end;
        //sum:= sum + AdoQuery1.FieldByName('Size').AsFloat;
      end;
    end;
    //edSizeSum.Text :=  FloatToStr(sum);
  end;
  MessageDlg('Proceso finalizado.',mtinformation,[mbok],0);
  beep;
  qryTareasxProceso.close;
  qryTareasxProceso.Open;
  qryTareasxProceso.GotoBookmark(guardarRec);
  qryTareasxProceso.FreeBookmark(guardarRec);
  //qryTareasxProceso.Refresh;
  //qryTareasxProceso.First;
end;

procedure TfrmAsignarPermisos.AbrirDatos;
begin
  qryUsuarios.close;
  qryUsuarios.Database:= dmcon.IBDatabase1;
  qryUsuarios.Params[0].Value:= xTipo;
  qryUsuarios.Open;
end;

procedure TfrmAsignarPermisos.qryUsuariosAfterOpen(DataSet: TDataSet);
begin
  qryUsuarios.First;
  rxUsuarios.close;
  rxUsuarios.open;
  While Not qryUsuarios.Eof do
  begin
    //rxUsuariosrxTipo
    rxUsuarios.InsertRecord([false, qryUsuariosDESCRIPCION.Value, qryUsuariosUSERID.Value]);
    qryUsuarios.Next;
  end;
  if rxUsuarios.Locate('userCod', userCod, []) then
  RxDBGrid1.SelectedRows.CurrentRowSelected := True;
end;

procedure TfrmAsignarPermisos.procTarea(accion: smallint);
var
  i : Integer;
  isperson: smallint;
  codigousuario : integer;
  codigoproceso : integer;
begin
  //dmUsuarios.qryTareas.Close;
 // dmUsuarios.qryTareas.Params[0].Value:=qryTareasxProcesoPROCESOID.Value;
  //dmUsuarios.qryTareas.Open;

  if Not qryUsuarios.Locate('DESCRIPCION', rxUsuariosrxDescripcion.Value,[])
  then exit;
  dmusuarios.tblSecPermisos.close;
  dmusuarios.tblSecPermisos.open;
  isperson:=  qryUsuarios.Params[0].Value;
  codigousuario := qryUsuariosUSERID.Value;
  codigoproceso := qryTareasxProcesoPROCESOID.Value;
  if dmusuarios.tblSecPermisos.Locate('procesoid;tareaid;userid;isperson',
    VarArrayOf([qryTareasxProcesoPROCESOID.Value,
    qryTareasxProcesoTAREAID.Value,
    codigousuario, isperson]), []) then
    begin
      dmUsuarios.tblSecPermisos.Edit
    end else
    begin
      dmUsuarios.tblSecPermisos.Insert;
      dmUsuarios.tblSecPermisosISPERSON.Value := isperson;
      dmUsuarios.tblSecPermisosPROCESOID.Value:= codigoproceso;
      dmUsuarios.tblSecPermisosUSERID.Value   := codigousuario;
      dmUsuarios.tblSecPermisosTAREAID.Value  := qryTareasxProcesoTAREAID.Value;
    end;

  if dmUsuarios.tblSecPermisos.State In [dsInsert, dsEdit] then
  begin
    dmUsuarios.tblSecPermisosSTATUS.Value := accion;
    dmUsuarios.tblSecPermisos.Post;
    dmUsuarios.tblSecPermisos.ApplyUpdates;
    if Not dmUsuarios.tblSecPermisos.Transaction.InTransaction then
    dmUsuarios.tblSecPermisos.Transaction.StartTransaction;
    try
      dmUsuarios.tblSecPermisos.Transaction.CommitRetaining;
    finally
    dmUsuarios.tblSecPermisos.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmAsignarPermisos.BitBtn2Click(Sender: TObject);
var
  i,x: Integer;
  sum : Single;
  guardarRec : TBookMark;
begin
  guardarRec := qryTareasxProceso.GetBookmark;
  //rxUsuariosrxTipo;
  if rxDBGrid1.SelectedRows.Count > 0 then
  begin
    sum := 0;
    with rxDBGrid1.DataSource.DataSet do
    begin
      for i := 0 to rxDBGrid1.SelectedRows.Count-1 do
      begin
        GotoBookmark(Pointer(rxDBGrid1.SelectedRows.Items[i]));
        if RxDBGrid2.SelectedRows.Count > 0 then
        begin
          with RxDBGrid2.DataSource.DataSet do
          begin
            for x:=0 to RxDBGrid2.SelectedRows.Count-1 do
            begin
              GotoBookmark(Pointer(rxDBGrid2.SelectedRows.Items[x]));
              procTarea(0);
            end;
          end;
        end;
        //sum:= sum + AdoQuery1.FieldByName('Size').AsFloat;
      end;
    end;
    //edSizeSum.Text :=  FloatToStr(sum);
  end;
  MessageDlg('Proceso finalizado.',mtinformation,[mbok],0);
  beep;
  qryTareasxProceso.close;
  qryTareasxProceso.Open;
  qryTareasxProceso.GotoBookmark(guardarRec);
  qryTareasxProceso.FreeBookmark(guardarRec);
end;

procedure TfrmAsignarPermisos.RxDBGrid1GetCellProps(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor);
begin
  if (Field.FieldName = 'usercod')  then
  begin
    //if (Field.Value = userCod) then

  end;
end;

procedure TfrmAsignarPermisos.qryTareasxProcesoCalcFields(
  DataSet: TDataSet);
begin
  if qryPermisosAsignados.State = dsInactive then
  Exit;
  if qryPermisosAsignados.Locate('procesoid;tareaid', VararrayOf([
  qryTareasxProcesoPROCESOID.Value,
  qryTareasxProcesoTAREAID.Value]),[]) then
  qryTareasxProcesostatus.Value := qryPermisosAsignadosstatus.Value;
end;

procedure TfrmAsignarPermisos.qryTareasxProcesoAfterOpen(
  DataSet: TDataSet);
begin
  qryPermisosAsignados.Close;
  qryPermisosAsignados.Params[0].Value:= usercod; //userid
  qryPermisosAsignados.Params[1].Value:= xTipo;//isPerson
  qryPermisosAsignados.Open;
  qryTareasxProceso.AutoCalcFields:= True;
end;

procedure TfrmAsignarPermisos.RxDBGrid2GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if (qryTareasxProcesostatus.Value = 1) then
  begin
    Background := clMoneyGreen;
    //AFont.Color:=clBlack;
  end;
end;

procedure TfrmAsignarPermisos.qryTareasxProcesoBeforeOpen(
  DataSet: TDataSet);
begin
  qryTareasxProceso.AutoCalcFields:= False;
end;

procedure TfrmAsignarPermisos.qryTareasxProcesoAfterScroll(
  DataSet: TDataSet);
begin
  if qryPermisosAsignados.Locate('procesoid;tareaid', vararrayOf([
  qryTareasxProcesoPROCESOID.Value,
  qryTareasxProcesoTAREAID.Value]),[]) then
  qryTareasxProceso.AutoCalcFields:=true;
end;

procedure TfrmAsignarPermisos.rxUsuariosAfterScroll(DataSet: TDataSet);
begin
  qryPermisosAsignados.Close;
  qryPermisosAsignados.Params[0].Value := rxUsuariosuserCod.Value;
  qryPermisosAsignados.Open;
  qryTareasxProceso.First;
end;

procedure TfrmAsignarPermisos.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
  RxDBGrid2.SelectAll
  else RxDBGrid2.UnselectAll;
end;

procedure TfrmAsignarPermisos.CheckBox2Click(Sender: TObject);
begin
  if (edtTarea.Text = '') then exit;
  _campoFiltrar:='Tarea';
  qryTareasxProceso.Filtered:=False;
  if CheckBox2.Checked then
  begin
    //qryTareasxProceso.Filtered:=True
    qryTareasxProceso.DisableControls;
    qryTareasxProceso.Close;
    qryTareasxProceso.SQL.Text := qryTareasxProceso_base.Sql.Text+
    ' Where upper(TAREAS.DESCRIPCION) like '+chr(39)+'%'+uppercase(edtTarea.Text)+'%'+chr(39)+
    ' Order By TAREAS.DESCRIPCION ';
    qryTareasxProceso.Open;
    qryTareasxProceso.EnableControls;
  end else
  begin
    qryTareasxProceso.DisableControls;
    qryTareasxProceso.Close;
    qryTareasxProceso.SQL.Text := qryTareasxProceso_base.Sql.Text+
    ' Order By TAREAS.DESCRIPCION ';
    qryTareasxProceso.Open;
    qryTareasxProceso.EnableControls;
  end;
end;

procedure TfrmAsignarPermisos.qryTareasxProcesoFilterRecord(
  DataSet: TDataSet; var Accept: Boolean);
begin
  if (_campoFiltrar = 'Status') then
  Accept:= DataSet[_campoFiltrar] = 0
  else
  Accept:= UpperCase(DataSet[_campoFiltrar]) = edtTarea.Text;
end;

procedure TfrmAsignarPermisos.CheckBox3Click(Sender: TObject);
begin
 _campoFiltrar:='Status';
  if CheckBox3.Checked then
  qryTareasxProceso.Filtered:=True
  else
    qryTareasxProceso.Filtered:=false;

end;

procedure TfrmAsignarPermisos.RxDBGrid2TitleClick(Column: TColumn);
{$J+}
const PreviousColumnIndex : integer = -1;
{$J-}
var   Sort : String;

begin
  //dm.tblVendor.
  if (sortOrder = '') then
  sortOrder := ' ASC';
  if RxDBGrid2.DataSource.DataSet is TibQuery then
  With TibQuery(RxDBGrid2.DataSource.DataSet) do

  begin
    if (Uppercase(Column.FieldName) = 'STATUS') then exit;//campo calculado
    try
      RxDBGrid2.Columns[PreviousColumnIndex].title.Font.Style :=
      RxDBGrid2.Columns[PreviousColumnIndex].title.Font.Style - [fsBold]; 
    except
    end;

    if (sortOrder = ' DESC') then
    sortOrder := ' ASC'
    else
    sortOrder := ' DESC';
    Column.title.Font.Style :=
    Column.title.Font.Style + [fsBold];
    PreviousColumnIndex := Column.Index;

    qryTareasxProceso.DisableControls;
    qryTareasxProceso.Close;
    qryTareasxProceso.SQL.Text := qryTareasxProceso_base.Sql.Text
    + ' Order By '+Column.FieldName +' '+ sortOrder;
    qryTareasxProceso.Open;
    qryTareasxProceso.EnableControls;
  end;
end;

end.
