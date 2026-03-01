unit UFormActTipoNomina;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WinSkinData, StdCtrls, Buttons, Grids, DBGrids, RxDBCtrl, Mask,
  DBCtrls, Db, RxCtrls, RxToolEdit;

type
  TfrmActTipoNomina = class(TForm)
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
    dtpkFechaNom: TDBDateEdit;
    Label1: TLabel;
    dsTblTipoNomina: TDataSource;
    Button1: TButton;
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure dtpkFechaNomExit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    Procedure SetFechNomina;
  public
    { Public declarations }
  end;

var
  frmActTipoNomina: TfrmActTipoNomina;

implementation

uses UDatModNomina, UGlobal;

{$R *.dfm}

procedure TfrmActTipoNomina.BitBtn10Click(Sender: TObject);
begin
  dmNomina.tblTipoNomina.Prior;
end;

procedure TfrmActTipoNomina.BitBtn11Click(Sender: TObject);
begin
  dmNomina.tblTipoNomina.next;
end;

procedure TfrmActTipoNomina.BitBtn12Click(Sender: TObject);
begin
  dmNomina.tblTipoNomina.Last;
end;

procedure TfrmActTipoNomina.BitBtn9Click(Sender: TObject);
begin
  dmNomina.tblTipoNomina.first;
end;

procedure TfrmActTipoNomina.SpeedButton1Click(Sender: TObject);
begin
  if dmNomina.tblTipoNomina.State in [dsInsert, dsEdit] then
  begin
    if dmNomina.tblTipoNomina.State in [dsInsert] then
    dmNomina.tblTipoNominaCODIGO.Value:= FsqlMaxNumero('tipo_nomina','codigo');
    dmNomina.tblTipoNomina.Post;
    dmNomina.tblTipoNomina.ApplyUpdates;
    if not dmNomina.tblTipoNomina.Transaction.InTransaction then
    dmNomina.tblTipoNomina.Transaction.StartTransaction;
    try
      dmNomina.tblTipoNomina.Transaction.CommitRetaining;
    except
    dmNomina.tblTipoNomina.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmActTipoNomina.SpeedButton2Click(Sender: TObject);
begin
  if dmNomina.tblTipoNomina.State = dsBrowse then
  begin
    dmNomina.tblTipoNomina.Insert;
    DBEdit2.SetFocus;
  end;
end;

procedure TfrmActTipoNomina.SpeedButton3Click(Sender: TObject);
begin
  if dmNomina.tblTipoNomina.State in [dsInsert, dsEdit] then
  begin
    dmNomina.tblTipoNomina.Cancel;
  end;
end;

procedure TfrmActTipoNomina.dtpkFechaNomExit(Sender: TObject);
begin
  glbFechaNomina:= ExtraerFecha(dtpkFechaNom.Date);
end;

procedure TfrmActTipoNomina.SetFechNomina;
var
  FechaNom : TDateTime;
  Anio1,Mes1,Dia1 : word;
begin
   FRangoFechaNomina(FechaNom,FechaNom);

  DecodeDate(FechaNom,Anio1,Mes1,Dia1);
  if (dia1 <= 15)  then
  dtpkFechaNom.Date := EncodeDate(Anio1,Mes1,15)
  else
  begin
    if Mes1 = 2 then
    dtpkFechaNom.Date     := EncodeDate(Anio1,Mes1,DiasEnElMes(Anio1,Mes1))
    else dtpkFechaNom.Date:= EncodeDate(Anio1,Mes1,30);
  end;
  dtpkFechaNomExit(Self);
  dmNomina.tblTipoNomina.Edit;
  dmNomina.tblTipoNominaULT_FECHA_NOM.Value:= glbFechaNomina;
end;

procedure TfrmActTipoNomina.Button1Click(Sender: TObject);
begin
  SetFechNomina;
end;

procedure TfrmActTipoNomina.FormCreate(Sender: TObject);
begin
  dmNomina.tblTipoNomina.Close;
  dmNomina.tblTipoNomina.Open;
end;

procedure TfrmActTipoNomina.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if dmNomina.tblTipoNomina.state in [dsEdit, dsInsert] then
  begin
    MessageDlg('Transaccion pendiente, verifique.',mtInformation,[mbok],0);
    CanClose:=False;
  end;
end;

end.
