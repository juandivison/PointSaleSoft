unit UFormTurno;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, Mask, DBCtrls, ToolEdit,
  Db, RXDBCtrl, RXCtrls, EditNew, IBCustomDataSet, IBTable;

type
  TfrmTurno = class(TForm)
    Label2: TLabel;
    DBEdit2: TDBEdit;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    Label3: TLabel;
    Label4: TLabel;
    DBStatusLabel1: TDBStatusLabel;
    edtHoraIni: TEditN;
    edtHorafin: TEditN;
    tblTurno: TIBTable;
    tblTurnoCODIGO_TURNO: TIntegerField;
    tblTurnoDESCRIPCION: TIBStringField;
    tblTurnoHORAINI: TDateTimeField;
    tblTurnoHORAFIN: TDateTimeField;
    tblTurnoSTATUS: TIBStringField;
    dstblTurno: TDataSource;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtHoraIniExit(Sender: TObject);
    procedure edtHorafinExit(Sender: TObject);
    procedure tblTurnoAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTurno: TfrmTurno;

implementation

uses UDatModConectar, UDatModRegOpeDiaria, uglobal;

{$R *.dfm}

procedure TfrmTurno.BitBtn1Click(Sender: TObject);
begin
  if tblTurno.State In [dsBrowse] then
  begin
    tblTurno.Insert;
    dbedit2.setfocus;
  end;
end;

procedure TfrmTurno.BitBtn2Click(Sender: TObject);
begin
  if tblTurno.State in [dsBrowse] then
  tblTurno.Edit;
end;

procedure TfrmTurno.BitBtn3Click(Sender: TObject);
begin
  if tblTurno.State in [dsInsert, dsEdit] then
  tblTurno.Cancel;
end;

procedure TfrmTurno.BitBtn4Click(Sender: TObject);
begin
  if tblTurno.State in [dsInsert, dsEdit] then
  begin
    tblTurnoCODIGO_TURNO.Value:= FsqlMaxNumero('Turno','codigo_turno');
    tblTurnoSTATUS.Value:='A';
    tblTurno.Post;
    tblTurno.ApplyUpdates;
    try
      tblTurno.Transaction.CommitRetaining;
    except
        tblTurno.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmTurno.BitBtn5Click(Sender: TObject);
begin
  if tblTurno.State In [dsBrowse, dsInactive] then
  begin
    tblTurno.Close;
    tblTurno.Open;
  end;
end;

procedure TfrmTurno.FormCreate(Sender: TObject);
begin
  tblTurno.Close;
  tblTurno.Open;
end;

procedure TfrmTurno.edtHoraIniExit(Sender: TObject);
begin
  if tblTurno.state in [dsedit, dsinsert] then
  tblTurnoHORAINI.Value:= ExtraerFecha(GlbFechaTrnDiaria) + edtHoraIni.ValueTime;
end;

procedure TfrmTurno.edtHorafinExit(Sender: TObject);
begin
  if tblTurno.state in [dsEdit, dsInsert] then
  tblTurnoHORAFIN.Value:= ExtraerFecha(GlbFechaTrnDiaria) + edtHorafin.ValueTime;
end;

procedure TfrmTurno.tblTurnoAfterScroll(DataSet: TDataSet);
begin
  if tblTurno.State In [dsBrowse] then
  begin
    edtHoraIni.Text := TimeToStr(ExtraerHora(tblTurnoHORAINI.Value));
    edtHorafin.Text := TimeToStr(ExtraerHora(tblTurnoHORAFIN.Value));
  end;
end;

end.

