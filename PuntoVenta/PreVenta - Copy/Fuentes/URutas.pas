unit URutas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ComCtrls, DB, StdCtrls, Mask, DBCtrls, Buttons,
  RXCtrls, ExtCtrls, rxToolEdit, RXDBCtrl, RxLookup, dbnavE;

type
  TfrmRutas = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DataSource1: TDataSource;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    RxSpeedButton1: TRxSpeedButton;
    btnInsertar: TBitBtn;
    btnModificar: TBitBtn;
    btnSalvar: TBitBtn;
    btnCancelar: TBitBtn;
    btnCerarAbrirres: TBitBtn;
    BitBtn2: TBitBtn;
    DBDateEdit1: TDBDateEdit;
    RxDBLookupCombo2: TRxDBLookupCombo;
    dsQryEmpleados: TDataSource;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label6: TLabel;
    dstblTipoComision: TDataSource;
    DBNavigatorE1: TDBNavigatorE;
    procedure btnInsertarClick(Sender: TObject);
    procedure btnModificarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnCerarAbrirresClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRutas: TfrmRutas;

implementation

uses UDatModRuta, uglobal;

{$R *.dfm}

procedure TfrmRutas.btnInsertarClick(Sender: TObject);
begin
  if dmRutas.tblRutas.State = dsBrowse then
  begin
    dmRutas.tblRutas.Insert;
    dmRutas.tblRutasSTATUS.Value:='A';
    dmRutas.tblRutasFECHA.Value:=ExtraerFecha(date);
    DBEdit1.SetFocus;
  end;
end;

procedure TfrmRutas.btnModificarClick(Sender: TObject);
begin
  if dmRutas.tblRutas.State = dsBrowse then
  dmrutas.tblRutas.Edit;
end;

procedure TfrmRutas.btnSalvarClick(Sender: TObject);
begin
  if dmRutas.tblRutas.State in [dsInsert, dsEdit] then
  begin
    if not dmRutas.tblRutas.Transaction.InTransaction then
    dmRutas.tblRutas.Transaction.StartTransaction;
    dmRutas.tblRutas.Post;
    dmRutas.tblRutas.ApplyUpdates;
    try
      dmRutas.tblRutas.Transaction.CommitRetaining;
    except
    dmRutas.tblRutas.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmRutas.btnCancelarClick(Sender: TObject);
begin
  if dmRutas.tblRutas.State in [dsInsert, dsEdit] then
  dmRutas.tblRutas.Cancel else
  begin
    if MessageDlg('Borrar record?',mtInformation, [mbyes, mbno], 0) = mryes then
    begin
      dmRutas.tblRutas.Delete;
      if not dmRutas.tblRutas.Transaction.InTransaction then
      dmRutas.tblRutas.Transaction.StartTransaction;
      dmRutas.tblRutas.ApplyUpdates;
      try
        dmRutas.tblRutas.Transaction.CommitRetaining;
      except
      dmRutas.tblRutas.Transaction.RollbackRetaining;
      end;
    end;
  end;
end;

procedure TfrmRutas.btnCerarAbrirresClick(Sender: TObject);
begin
  if dmRutas.tblRutas.state in [dsBrowse, dsInactive] then
  begin
    dmRutas.tblRutas.close;
    dmRutas.tblRutas.open;
  end;
end;

procedure TfrmRutas.FormCreate(Sender: TObject);
begin
  btnCerarAbrirresClick(Self);
  dmrutas.qryEmpleados.Close;
  dmrutas.qryEmpleados.Open;
  dmRutas.tblTipoComision.Close;
  dmRutas.tblTipoComision.Open;
end;

end.
