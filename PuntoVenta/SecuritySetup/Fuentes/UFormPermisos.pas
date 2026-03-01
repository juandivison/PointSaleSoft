unit UFormPermisos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  db, Dialogs, StdCtrls, Buttons, Grids, DBGrids, RXDBCtrl, Mask, DBCtrls,
  RXCtrls, RxLookup, ExtCtrls, WinSkinData;

type
  TfrmPermisos = class(TForm)
    Label2: TLabel;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton1: TSpeedButton;
    DBStatusLabel1: TDBStatusLabel;
    RxDBGrid1: TRxDBGrid;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    RxDBLookupCombo1: TRxDBLookupCombo;
    RxDBLookupCombo2: TRxDBLookupCombo;
    Label1: TLabel;
    DBRadioGroup1: TDBRadioGroup;
    BitBtn1: TBitBtn;
    RxDBLookupComboRol: TRxDBLookupCombo;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    SpeedButton4: TSpeedButton;
    SkinData1: TSkinData;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBRadioGroup1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure procTarea(accion : smallint );
  end;

var
  frmPermisos: TfrmPermisos;

implementation

uses UDatModUsuarios, uglobal, UFormDatosTareaxProceso;

{$R *.dfm}

procedure TfrmPermisos.FormCreate(Sender: TObject);
begin
  dmUsuarios.qryUsuarios.Close;
  dmUsuarios.qryUsuarios.Open;
  dmUsuarios.tblSecPermisos.Close;
  dmUsuarios.tblSecPermisos.Open;
  dmUsuarios.qryProcesos.Close;
  dmUsuarios.qryProcesos.Open;
  dmUsuarios.qryRoles.Close;
  dmUsuarios.qryRoles.Open;
end;

procedure TfrmPermisos.BitBtn9Click(Sender: TObject);
begin
  dmUsuarios.tblSecPermisos.first;
end;

procedure TfrmPermisos.BitBtn10Click(Sender: TObject);
begin
  dmUsuarios.tblSecPermisos.prior;
end;

procedure TfrmPermisos.BitBtn11Click(Sender: TObject);
begin
  dmUsuarios.tblSecPermisos.next;
end;

procedure TfrmPermisos.BitBtn12Click(Sender: TObject);
begin
  dmUsuarios.tblSecPermisos.last;
end;

procedure TfrmPermisos.SpeedButton2Click(Sender: TObject);
begin
  if dmUsuarios.tblSecPermisos.state = dsbrowse then
  begin
    dmUsuarios.tblSecPermisos.Insert;
    BitBtn2.Enabled:=True;
    DBRadioGroup1.SetFocus;
  end;
end;

procedure TfrmPermisos.SpeedButton3Click(Sender: TObject);
begin
  if dmUsuarios.tblSecPermisos.state = dsbrowse then
  begin
    dmUsuarios.tblSecPermisos.Cancel;
    //BitBtn2.Enabled:=False;
  end;
end;

procedure TfrmPermisos.SpeedButton1Click(Sender: TObject);
begin
  if dmUsuarios.tblSecPermisos.State In [dsInsert, dsEdit] then
  begin
    //dmUsuarios.tblSecPermisosPERMISOID.Value:= FsqlMaxNumero('PERMISOS','');
    dmUsuarios.tblSecPermisos.Post;
    dmUsuarios.tblSecPermisos.ApplyUpdates;
    if not dmUsuarios.tblSecPermisos.Transaction.InTransaction then
    dmUsuarios.tblSecPermisos.Transaction.StartTransaction;
    try
      dmUsuarios.tblSecPermisos.Transaction.CommitRetaining;
    except
    dmUsuarios.tblSecPermisos.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmPermisos.DBRadioGroup1Change(Sender: TObject);
begin
  if DBRadioGroup1.ItemIndex = 0 then
  begin
    RxDBLookupCombo2.Enabled:=False;
    RxDBLookupCombo2.Visible:=False;
    RxDBLookupCombo2.SendToBack;

    RxDBLookupComboRol.Enabled:=True;
    RxDBLookupComboRol.Visible:=True;
    RxDBLookupComboRol.BringToFront;
    Label2.Caption:='Rol';
    //RxDBLookupCombo2.LookupField  := 'USERID';
    //RxDBLookupCombo2.LookupDisplay:= 'DESCRIPCION';
    //RxDBLookupCombo2.LookupSource := dmUsuarios.dsqryRoles;
  end else
  begin
    Label2.Caption:='Usuario';
    //RxDBLookupCombo2.LookupField  := 'NUMERO';
    //RxDBLookupCombo2.LookupDisplay:= 'NOMBRECOMPLETO';
    //RxDBLookupCombo2.LookupSource := dmUsuarios.dsqryUsuarios;
    RxDBLookupCombo2.Enabled:=True;
    RxDBLookupCombo2.Visible:=True;
    RxDBLookupCombo2.BringToFront;

    RxDBLookupComboRol.Enabled:=False;
    RxDBLookupComboRol.Visible:=False;
    RxDBLookupComboRol.SendToBack;

  end;
end;

procedure TfrmPermisos.BitBtn1Click(Sender: TObject);
begin
  dmUsuarios.tblSecPermisos.Close;
  dmUsuarios.tblSecPermisos.Open;
  //BitBtn2.Enabled:=False;
end;

procedure TfrmPermisos.BitBtn2Click(Sender: TObject);
begin
  procTarea(1);
end;

procedure TfrmPermisos.procTarea(accion: smallint);
var
  i : Integer;
  isperson: smallint;
  codigousuario : integer;
  codigoproceso : integer;
begin
  dmUsuarios.qryTareas.Close;
  dmUsuarios.qryTareas.Params[0].Value:=dmUsuarios.qryProcesosPROCESOID.Value;
  dmUsuarios.qryTareas.Open;
  frmSelTareaProceso:=TfrmSelTareaProceso.Create(Nil);
  try
    if frmSelTareaProceso.Showmodal = mrok then
    begin
      //dmUsuarios.qryTareas.
      //dmUsuarios.tblSecPermisosTAREAID.Value:=dmUsuarios.qryTareasTAREAID.Value;
      isperson:=  dmusuarios.tblSecPermisosISPERSON.Value;
      codigousuario := dmusuarios.tblSecPermisosUSERID.Value;
      codigoproceso := dmusuarios.tblSecPermisosPERMISOID.Value;
      if frmSelTareaProceso.rxDBGrid1.SelectedRows.Count > 0 then
      begin
        With frmSelTareaProceso.rxDBGrid1.DataSource.DataSet do
        begin
          for i := 0 to frmSelTareaProceso.rxDBGrid1.SelectedRows.Count - 1 do
          begin
            GotoBookmark(Pointer(frmSelTareaProceso.rxDBGrid1.SelectedRows.Items[i]));
            IF dmUsuarios.tblSecPermisos.RecordCount > 0 THEN
              if dmUsuarios.tblSecPermisos.State In [dsbrowse] then
              dmUsuarios.tblSecPermisos.Edit;
            if dmUsuarios.tblSecPermisos.State In [dsInsert] then
            begin
              dmUsuarios.tblSecPermisosTAREAID.Value:=dmUsuarios.qryTareasTAREAID.Value;
            end else
            begin
              if dmusuarios.tblSecPermisos.Locate('procesoid;tareaid;userid;isperson',
              VarArrayOf([dmUsuarios.tblSecPermisosPROCESOID.Value,
              dmUsuarios.qryTareasTAREAID.Value,
              dmUsuarios.tblSecPermisosUSERID.Value,
              dmUsuarios.tblSecPermisosISPERSON.Value]),[]) then
              dmUsuarios.tblSecPermisos.Edit else
              dmUsuarios.tblSecPermisos.Insert;
              dmUsuarios.tblSecPermisosISPERSON.Value := isperson;
              dmUsuarios.tblSecPermisosPROCESOID.Value:= codigoproceso;
              dmUsuarios.tblSecPermisosUSERID.Value   := codigousuario;
              dmUsuarios.tblSecPermisosTAREAID.Value :=dmUsuarios.qryTareasTAREAID.Value;
            end;
            dmUsuarios.tblSecPermisosSTATUS.Value :=accion;
            SpeedButton1Click(Self);//guardar
            //sum:= sum + AdoQuery1.FieldByName('Size').AsFloat;
          end;
        end;
        //edSizeSum.Text :=  FloatToStr(sum);
     end;
    end;
  finally
  frmSelTareaProceso.Free;
  frmSelTareaProceso:=Nil;
  end;

end;

procedure TfrmPermisos.BitBtn3Click(Sender: TObject);
begin
  procTarea(0);
end;

procedure TfrmPermisos.SpeedButton4Click(Sender: TObject);
begin
  dmUsuarios.tblSecPermisos.Edit;
end;

procedure TfrmPermisos.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if (dmUsuarios.tblSecPermisosSTATUS.Value = 1) then
  BackGround := clGreen; 
end;

end.
