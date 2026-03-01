unit UFormAnioEscolar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  db, Dialogs, StdCtrls, Buttons, Grids, DBGrids, RXDBCtrl, Mask, DBCtrls,
  RXCtrls, WinSkinData,   rxToolEdit;

type
  TfrmAnoEscolar = class(TForm)
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
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Label4: TLabel;
    SpeedButton4: TSpeedButton;
    SkinData1: TSkinData;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    DBDateEdit1: TDBDateEdit;
    DBDateEdit2: TDBDateEdit;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    Label8: TLabel;
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
  frmAnoEscolar: TfrmAnoEscolar;

implementation
 uses UDatModEstudiante, DateUtils, Uglobal;
{$R *.dfm}

procedure TfrmAnoEscolar.BitBtn10Click(Sender: TObject);
begin
  dmEstudiante.tblAnoEscolar.prior;
end;

procedure TfrmAnoEscolar.BitBtn11Click(Sender: TObject);
begin
  dmEstudiante.tblAnoEscolar.next;
end;

procedure TfrmAnoEscolar.BitBtn12Click(Sender: TObject);
begin
  dmEstudiante.tblAnoEscolar.Last;
end;

procedure TfrmAnoEscolar.BitBtn9Click(Sender: TObject);
begin
  dmEstudiante.tblAnoEscolar.first;
end;

procedure TfrmAnoEscolar.SpeedButton1Click(Sender: TObject);
begin
  if dmEstudiante.tblAnoEscolar.State in [dsinsert, dsEdit] then
  begin
    dmEstudiante.tblAnoEscolar.Post;
    dmEstudiante.tblAnoEscolar.ApplyUpdates;
    if not dmEstudiante.tblAnoEscolar.Transaction.InTransaction then
    dmEstudiante.tblAnoEscolar.Transaction.StartTransaction;
    try
      dmEstudiante.tblAnoEscolar.Transaction.CommitRetaining;
    except
    dmEstudiante.tblAnoEscolar.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmAnoEscolar.SpeedButton2Click(Sender: TObject);
var
  anioFinal : Integer;
  mesIni, mesFin : String;
begin
  if dmEstudiante.tblAnoEscolar.State = dsBrowse then
  begin
    if dmEstudiante.tblAnoEscolar.RecordCount > 0 then
    begin
      dmEstudiante.tblAnoEscolar.First;
      While Not dmEstudiante.tblAnoEscolar.Eof do
      begin
        if (dmEstudiante.tblAnoEscolarSTATUS.Value = 'A') then
        begin
          anioFinal:= dmEstudiante.tblAnoEscolarIDANO_FINAL.Value;
          mesIni := FormatDateTime('mm',dmEstudiante.tblAnoEscolarMESINICIAMENSUALIDAD.Value);
          mesFin := FormatDateTime('mm',dmEstudiante.tblAnoEscolarMESFINMENSUALIDAD.Value);
          dmEstudiante.tblAnoEscolar.Edit;
          dmEstudiante.tblAnoEscolarSTATUS.Value := 'R';
          SpeedButton1Click(Self);//Guardar
          dmEstudiante.tblAnoEscolar.Append;
          dmEstudiante.tblAnoEscolarIDANO_INICIAL.Value:=anioFinal;
          dmEstudiante.tblAnoEscolarIDANO_FINAL.Value:=  anioFinal+1;
          dmEstudiante.tblAnoEscolarDESCRIPCION.Value:=Format('Año Escolar %s-%s',
          [dmEstudiante.tblAnoEscolarIDANO_INICIAL.AsString,
          dmEstudiante.tblAnoEscolarIDANO_FINAL.AsString]);
          dmEstudiante.tblAnoEscolarMESINICIAMENSUALIDAD.Value:=
          EncodeDate(dmEstudiante.tblAnoEscolarIDANO_INICIAL.Value,
                     StrToInt(mesIni),
                     25);
          dmEstudiante.tblAnoEscolarMESFINMENSUALIDAD.Value:=
          EncodeDate(dmEstudiante.tblAnoEscolarIDANO_FINAL.Value,
                     StrToInt(mesIni),
                     25)+10;
          dmEstudiante.tblAnoEscolarSTATUS.Value:='A';
          break;
        end else
        dmEstudiante.tblAnoEscolar.Next;
      end;
    end else
    begin
      dmEstudiante.tblAnoEscolar.Insert;
      dmEstudiante.tblAnoEscolarIDANO_INICIAL.Value := YearOf(now);
      dmEstudiante.tblAnoEscolarIDANO_FINAL.Value :=  dmEstudiante.tblAnoEscolarIDANO_INICIAL.Value+1;
      dmEstudiante.tblAnoEscolarDESCRIPCION.Value := Format('Año Escolar %s-%s',
      [dmEstudiante.tblAnoEscolarIDANO_INICIAL.AsString,
      dmEstudiante.tblAnoEscolarIDANO_FINAL.AsString]);
      dmEstudiante.tblAnoEscolarSTATUS.Value := 'A';
      SpeedButton1Click(Self);
    end;
    DBEdit2.SetFocus;
  end;
end;

procedure TfrmAnoEscolar.SpeedButton3Click(Sender: TObject);
begin
  if dmEstudiante.tblAnoEscolar.State in [dsinsert, dsEdit] then
  begin
    dmEstudiante.tblAnoEscolar.Cancel;
  end;
end;

procedure TfrmAnoEscolar.FormCreate(Sender: TObject);
begin
  dmEstudiante.tblAnoEscolar.Close;
  dmEstudiante.tblAnoEscolar.Open;
end;

procedure TfrmAnoEscolar.SpeedButton4Click(Sender: TObject);
begin
  if (dmEstudiante.tblAnoEscolarSTATUS.Value = 'R') then
  begin
    MessageDlg('Record no puede ser eliminado', mtError, [mbOk],0);
    Exit;
  end;
  If MessageDlg('Desea eliminar record?',mtWarning,[mbYes,mbNo],0) = mrYes then
  begin
    dmEstudiante.tblAnoEscolar.Delete;
    dmEstudiante.tblAnoEscolar.ApplyUpdates;
    if not dmEstudiante.tblAnoEscolar.Transaction.InTransaction then
    dmEstudiante.tblAnoEscolar.Transaction.StartTransaction;
    try
      dmEstudiante.tblAnoEscolar.Transaction.CommitRetaining;
    except
    dmEstudiante.tblAnoEscolar.Transaction.RollbackRetaining;
    end;
  end;
end;

end.
