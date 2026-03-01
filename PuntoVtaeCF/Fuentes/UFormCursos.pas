unit UFormCursos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  DB, Dialogs, StdCtrls, Buttons, Grids, DBGrids, RXDBCtrl, Mask, DBCtrls,
  RXCtrls, WinSkinData, RxLookup;

type
  TfrmCursos = class(TForm)
    Label2: TLabel;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton1: TSpeedButton;
    DBStatusLabel1: TDBStatusLabel;
    DBEdit2: TDBEdit;
    RxDBGrid1: TRxDBGrid;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    SkinData1: TSkinData;
    Label1: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    SpeedButton4: TSpeedButton;
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCursos: TfrmCursos;

implementation
  uses UGlobal, UDatModEstudiante;


{$R *.dfm}

procedure TfrmCursos.BitBtn10Click(Sender: TObject);
begin
  dmEstudiante.tblCursos.prior;
end;

procedure TfrmCursos.BitBtn11Click(Sender: TObject);
begin
  dmEstudiante.tblCursos.next;
end;

procedure TfrmCursos.BitBtn12Click(Sender: TObject);
begin
  dmEstudiante.tblCursos.Last;
end;

procedure TfrmCursos.BitBtn9Click(Sender: TObject);
begin
  dmEstudiante.tblCursos.first;
end;

procedure TfrmCursos.SpeedButton1Click(Sender: TObject);
begin
  if dmEstudiante.tblCursos.State in [dsinsert, dsEdit] then
  begin
    if dmEstudiante.tblCursos.State in [dsinsert] then
    dmEstudiante.tblCursosIDCURSO.Value:= FsqlMaxNumero('CURSOS','IDCURSO');
    dmEstudiante.tblCursos.Post;
    dmEstudiante.tblCursos.ApplyUpdates;
    if not dmEstudiante.tblCursos.Transaction.InTransaction then
    dmEstudiante.tblCursos.Transaction.StartTransaction;
    try
      dmEstudiante.tblCursos.Transaction.CommitRetaining;
    except
    dmEstudiante.tblCursos.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmCursos.SpeedButton2Click(Sender: TObject);
begin
  if dmEstudiante.tblCursos.State = dsBrowse then
  begin
    dmEstudiante.tblCursos.Insert;
    dmEstudiante.tblCursosSTATUS.Value:='A';
    RxDBLookupCombo1.SetFocus;
  end;
end;

procedure TfrmCursos.SpeedButton3Click(Sender: TObject);
begin
  if dmEstudiante.tblCursos.State in [dsinsert, dsEdit] then
  begin
    dmEstudiante.tblCursos.Cancel;
  end;
end;

procedure TfrmCursos.FormCreate(Sender: TObject);
begin
  dmEstudiante.qryNivelModalidad.Close;
  dmEstudiante.qryNivelModalidad.Open;
  dmEstudiante.tblCursos.Close;
  dmEstudiante.tblCursos.Open;
end;

procedure TfrmCursos.SpeedButton4Click(Sender: TObject);
begin
  if dmEstudiante.tblCursos.State in [dsBrowse] then
  begin
    if MessageDlg('Desea eliminar record activo?',mtWarning,[mbyes,mbno],0) = mryes then
    begin
    dmEstudiante.tblCursos.Delete;
    dmEstudiante.tblCursos.ApplyUpdates;
    if not dmEstudiante.tblCursos.Transaction.InTransaction then
    dmEstudiante.tblCursos.Transaction.StartTransaction;
    try
      dmEstudiante.tblCursos.Transaction.CommitRetaining;
    except
    dmEstudiante.tblCursos.Transaction.RollbackRetaining;
    end;
    end;
  end;
end;

end.
