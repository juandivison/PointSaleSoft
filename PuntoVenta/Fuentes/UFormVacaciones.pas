unit UFormVacaciones;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, RXDBCtrl, DB, StdCtrls, Buttons, RXCtrls,
  ExtCtrls, rxToolEdit, Mask, DBCtrls, ComCtrls, GetAnyDate;

type
  TfrmVacaciones = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    DBDateEdit2: TDBDateEdit;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    RxSpeedButton2: TRxSpeedButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn4: TBitBtn;
    dsQryVaca: TDataSource;
    RxDBGrid1: TRxDBGrid;
    DBText1: TDBText;
    RxDBGrid2: TRxDBGrid;
    DBStatusLabel1: TDBStatusLabel;
    Fecha: TGetAnyDate;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure RxSpeedButton2Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVacaciones: TfrmVacaciones;

implementation

uses UDatModNomina, uglobal;

{$R *.dfm}

procedure TfrmVacaciones.BitBtn1Click(Sender: TObject);
var
  Ano, Mes, Dia : Word;
  Ano1, Mes1, Dia1 : Word;
begin
  if Fecha.Execute Then
  Begin
    glbFechaInicial := ExtraerFecha(Fecha.Fecha);
    glbFechaFinal   := ExtraerFecha(Fecha.FechaFinal);
    DecodeDate(glbFechaInicial, Ano, Mes, Dia);
    DecodeDate(glbFechaFinal, Ano1, Mes1, Dia1);
    //StpVacaciones
    //dmNomina.StpVacaciones.Close;
    dmNomina.StpVacaciones.Params[0].Value := 6;
    dmNomina.StpVacaciones.Params[1].Value := GlbCodigoCia;
    dmNomina.StpVacaciones.Params[2].Value := glbFechaInicial;
    dmNomina.StpVacaciones.Params[3].Value := glbFechaFinal;
    dmNomina.StpVacaciones.ExecProc;
    if not dmNomina.StpVacaciones.Transaction.InTransaction then
    dmNomina.StpVacaciones.Transaction.StartTransaction;
    try
      dmNomina.StpVacaciones.Transaction.CommitRetaining;
    except
    dmNomina.StpVacaciones.Transaction.RollbackRetaining;
    end;
    dmNomina.QryVaca.close;
    dmNomina.QryVaca.Params[0].Value := glbFechaInicial;
    dmNomina.QryVaca.Params[1].Value := glbFechaFinal;
    dmNomina.QryVaca.Open;
  End;
end;

procedure TfrmVacaciones.RxSpeedButton2Click(Sender: TObject);
  var
  StrFiltro :string;
begin
  StrFiltro:=InputBox('Buscar empleado','Entre Codigo','');
  if Not dmNomina.QryVaca.Locate('Codigo',strFiltro,[]) Then
  ShowMessage('Codigo no existe, verifique.');
end;

procedure TfrmVacaciones.BitBtn2Click(Sender: TObject);
begin
  if dmNomina.QryVaca.State in [dsBrowse]  then
  begin
    dmNomina.QryVaca.Edit;
  end
end;

procedure TfrmVacaciones.BitBtn3Click(Sender: TObject);
begin
  if dmNomina.QryVaca.State in [dsInsert, dsEdit]  then
  begin
    GlbSalvarQuery(dmNomina.QryVaca);
  end;
end;

procedure TfrmVacaciones.BitBtn5Click(Sender: TObject);
begin
  if dmNomina.QryVaca.State in [dsEdit]  then
  begin
    dmNomina.QryVaca.Cancel;
  end;
end;

procedure TfrmVacaciones.BitBtn7Click(Sender: TObject);
 var
   idx : integer;
begin
  if dmNomina.QryVaca.State In [dsBrowse]  then
  begin
    if MessageDlg('Desea eliminar record(s)?',mtInformation,[mbok],0) = mrNo then Exit;
    if RxDBGrid2.SelectedRows.Count > 0 then
    begin
      For idx:=0 to RxDBGrid2.SelectedRows.Count - 1 do
      begin
        if (dmNomina.QryVacaSTATUS_TRANS.Value = 'P') then
        begin
          RxDBGrid2.DataSource.DataSet.GotoBookmark(Pointer(RxDBGrid2.SelectedRows.Items[idx]));
          dmNomina.QryVaca.Delete;
        end;
      end;
    end else
    if (dmNomina.QryVacaSTATUS_TRANS.Value = 'P') then
    dmNomina.QryVaca.Delete;
    GlbSalvarQuery(dmNomina.QryVaca);
  end;
end;

procedure TfrmVacaciones.FormCreate(Sender: TObject);
begin
  dmNomina.QryVaca.Close;
  dmNomina.QryVaca.Params[0].Value := GlbFechaInicial;
  dmNomina.QryVaca.Params[1].Value := GlbFechaFinal;
  dmNomina.QryVaca.Open;
end;

procedure TfrmVacaciones.BitBtn8Click(Sender: TObject);
begin
  dmNomina.QryVaca.Close;
  dmNomina.QryVaca.Open;
end;

end.
