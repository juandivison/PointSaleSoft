unit UFormMantPrecioColegio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RxLookup, StdCtrls, Buttons, Grids, DBGrids, RXDBCtrl, DBCtrls,
  DB, Mask, rxToolEdit, RXCtrls, ComCtrls, WinSkinData;

type
  TfrmPrecioXNivelColegio = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label10: TLabel;
    SpeedButton2: TSpeedButton;
    Label4: TLabel;
    Label3: TLabel;
    DBStatusLabel2: TDBStatusLabel;
    RxCheckListBox1: TRxCheckListBox;
    DBEdit2: TDBEdit;
    RxDBGrid1: TRxDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    RxDBLookupCombo1: TRxDBLookupCombo;
    TabSheet2: TTabSheet;
    RxDBGrid2: TRxDBGrid;
    RxDBLookupCombo2: TRxDBLookupCombo;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    SkinData1: TSkinData;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
    function GetCodigoServicio(strvalor:string):Integer;
    procedure CheckList;
  public
    { Public declarations }
  end;

var
  frmPrecioXNivelColegio: TfrmPrecioXNivelColegio;

implementation

uses UDatModEstudiante, uglobal;

{$R *.dfm}

procedure TfrmPrecioXNivelColegio.FormCreate(Sender: TObject);
begin
  dmEstudiante.tblPrecioXNivelColegio.Close;
  dmEstudiante.tblPrecioXNivelColegio.Params[0].Value := GLBIDAnioEscolar;
  dmEstudiante.tblPrecioXNivelColegio.Open;
  dmEstudiante.qryAnoEscolar.Close;
  dmEstudiante.qryAnoEscolar.Open;

  dmEstudiante.qryNivelModalidad.Close;
  dmEstudiante.qryNivelModalidad.Open;
  dmEstudiante.qryNivelModalidad.First;
  RxCheckListBox1.Clear;
  While Not dmEstudiante.qryNivelModalidad.Eof Do
  begin
    RxCheckListBox1.Items.Add(dmEstudiante.qryNivelModalidadDescripcion.Value);
    dmEstudiante.qryNivelModalidad.Next;
  end;
  CheckList;
end;

procedure TfrmPrecioXNivelColegio.BitBtn9Click(Sender: TObject);
begin
  dmEstudiante.tblPrecioXNivelColegio.First;
end;

procedure TfrmPrecioXNivelColegio.BitBtn10Click(Sender: TObject);
begin
  dmEstudiante.tblPrecioXNivelColegio.Prior;
end;

procedure TfrmPrecioXNivelColegio.BitBtn11Click(Sender: TObject);
begin
  dmEstudiante.tblPrecioXNivelColegio.Next;
end;

procedure TfrmPrecioXNivelColegio.BitBtn12Click(Sender: TObject);
begin
  dmEstudiante.tblPrecioXNivelColegio.Last;
end;

procedure TfrmPrecioXNivelColegio.BitBtn1Click(Sender: TObject);
begin
  if dmEstudiante.tblPrecioXNivelColegio.State = dsBrowse then
  begin
    dmEstudiante.tblPrecioXNivelColegio.Insert;
    dmEstudiante.tblPrecioXNivelColegioIDANIOESCOLAR.Value:= GLBIDAnioEscolar;
    dmEstudiante.tblPrecioXNivelColegioSTATUS.Value:='A';
    dmEstudiante.tblPrecioXNivelColegioCOD_USUARIO.Value:= VarUsuarioGlb;
    dmEstudiante.tblPrecioXNivelColegioFECHA_IN.Value:=now;
    dmEstudiante.tblPrecioXNivelColegioIN_POR.Value:= strUserName;
    RxDBLookupCombo1.SetFocus;
  end;
end;

procedure TfrmPrecioXNivelColegio.BitBtn3Click(Sender: TObject);
begin
  if dmEstudiante.tblPrecioXNivelColegio.State in [dsInsert, dsEdit] then
  begin
    dmEstudiante.tblPrecioXNivelColegio.Cancel;
  end else
  begin
    dmEstudiante.tblPrecioXNivelColegio.Delete;
    dmEstudiante.tblPrecioXNivelColegio.ApplyUpdates;
    if not dmEstudiante.tblPrecioXNivelColegio.Transaction.InTransaction then
    dmEstudiante.tblPrecioXNivelColegio.Transaction.StartTransaction;
    try
      dmEstudiante.tblPrecioXNivelColegio.Transaction.CommitRetaining;
    except
    dmEstudiante.tblPrecioXNivelColegio.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmPrecioXNivelColegio.BitBtn4Click(Sender: TObject);
begin
  if dmEstudiante.tblPrecioXNivelColegio.state in [dsEdit, dsInsert] then
  begin
    dmEstudiante.tblPrecioXNivelColegio.Post;
    dmEstudiante.tblPrecioXNivelColegio.ApplyUpdates;
    if Not dmEstudiante.tblPrecioXNivelColegio.Transaction.InTransaction then
    dmEstudiante.tblPrecioXNivelColegio.Transaction.StartTransaction;
    try
      dmEstudiante.tblPrecioXNivelColegio.Transaction.CommitRetaining;
    except
    dmEstudiante.tblPrecioXNivelColegio.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmPrecioXNivelColegio.SpeedButton2Click(Sender: TObject);
var
  i, xcodServicio : integer;
begin
  For i:=0 To RxCheckListBox1.Items.Count-1 Do
    begin
      if (RxCheckListBox1.Checked[i] = true) then
      begin
        xcodServicio := GetCodigoServicio(rxCheckListBox1.Items.Strings[i]);
        if dmEstudiante.tblPrecioXNivelColegio.Locate('IDANIOESCOLAR;IDNIVEL', VarArrayof([GLBIDAnioEscolar,xcodServicio]),[]) then
        continue;
        dmEstudiante.tblPrecioXNivelColegio.Append;
        dmEstudiante.tblPrecioXNivelColegioIDNIVEL.Value:= xcodServicio;
        dmEstudiante.tblPrecioXNivelColegioIDANIOESCOLAR.Value:= GLBIDAnioEscolar;
        dmEstudiante.tblPrecioXNivelColegioSTATUS.Value:='A';
        dmEstudiante.tblPrecioXNivelColegioCOD_USUARIO.Value:= VarUsuarioGlb;
        dmEstudiante.tblPrecioXNivelColegioFECHA_IN.Value:=now;
        dmEstudiante.tblPrecioXNivelColegioIN_POR.Value:= strUserName;
      end;
    end;
end;

function TfrmPrecioXNivelColegio.GetCodigoServicio(
  strvalor: string): Integer;
begin
  if dmEstudiante.qryNivelModalidad.Locate('DESCRIPCION', strvalor, []) then
  result := dmEstudiante.qryNivelModalidadCODIGO.Value else result :=0;
end;

procedure TfrmPrecioXNivelColegio.CheckList;
var
 idx : Integer;
begin
  dmEstudiante.tblPrecioXNivelColegio.First;
  While Not dmEstudiante.tblPrecioXNivelColegio.Eof Do
  begin
    dmEstudiante.qryNivelModalidad.Locate('CODIGO',dmEstudiante.tblPrecioXNivelColegioIDNIVEL.Value,[]);
    idx :=  RxCheckListBox1.Items.IndexOf(dmEstudiante.qryNivelModalidadDESCRIPCION.Value);
    RxCheckListBox1.Checked[idx] := True;
    dmEstudiante.tblPrecioXNivelColegio.Next;
  end;
  dmEstudiante.tblPrecioXNivelColegio.First;
end;

procedure TfrmPrecioXNivelColegio.BitBtn2Click(Sender: TObject);
begin
  if dmEstudiante.tblPrecioXNivelColegio.State = dsBrowse then
  dmEstudiante.tblPrecioXNivelColegio.Edit;
end;

procedure TfrmPrecioXNivelColegio.BitBtn5Click(Sender: TObject);
begin
  if dmEstudiante.tblPrecioXNivelColegio.state = dsBrowse then
  begin
    dmEstudiante.tblPrecioXNivelColegio.Close;
    dmEstudiante.tblPrecioXNivelColegio.Open;
  end;
end;

end.
