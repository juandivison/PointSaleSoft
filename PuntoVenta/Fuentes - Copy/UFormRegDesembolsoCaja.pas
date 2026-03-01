unit UFormRegDesembolsoCaja;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RxDBComb, rxToolEdit, RXDBCtrl, Buttons, Grids, DBGrids,
  db,Mask, DBCtrls, RXCtrls, WinSkinData, GetAnyDate, RxLookup;

type
  TfrmDesembolsos = class(TForm)
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
    DBDateEdit1: TDBDateEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    BitBtn1: TBitBtn;
    SkinData1: TSkinData;
    dsQryUsuarios: TDataSource;
    Label5: TLabel;
    Label1: TLabel;
    GetAnyDate1: TGetAnyDate;
    RxDBLookupCombo1: TRxDBLookupCombo;
    rxdbboxmoneda: TRxDBComboBox;
    Label18: TLabel;
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDesembolsos: TfrmDesembolsos;

implementation

uses UDatModCuadrexRuta, UDatModUsuarios, UGlobal;

{$R *.dfm}

procedure TfrmDesembolsos.BitBtn10Click(Sender: TObject);
begin
  dmCuadrexRuta.tblDesembolsoCaja.prior;
end;

procedure TfrmDesembolsos.BitBtn11Click(Sender: TObject);
begin
  dmCuadrexRuta.tblDesembolsoCaja.next;
end;

procedure TfrmDesembolsos.BitBtn12Click(Sender: TObject);
begin
  dmCuadrexRuta.tblDesembolsoCaja.Last;
end;

procedure TfrmDesembolsos.BitBtn9Click(Sender: TObject);
begin
  dmCuadrexRuta.tblDesembolsoCaja.first;
end;

procedure TfrmDesembolsos.SpeedButton1Click(Sender: TObject);
begin
  if dmCuadrexRuta.tblDesembolsoCaja.State in [dsinsert, dsEdit] then
  begin
    //dmCuadrexRuta.tblDesembolsoCajaIDDESEMBOLSO.Value:= FsqlMaxNumero('SEC_PROCESOS','ID');
    dmCuadrexRuta.tblDesembolsoCaja.Post;
    dmCuadrexRuta.tblDesembolsoCaja.ApplyUpdates;
    if not dmCuadrexRuta.tblDesembolsoCaja.Transaction.InTransaction then
    dmCuadrexRuta.tblDesembolsoCaja.Transaction.StartTransaction;
    try
      dmCuadrexRuta.tblDesembolsoCaja.Transaction.CommitRetaining;
    except
    dmCuadrexRuta.tblDesembolsoCaja.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmDesembolsos.SpeedButton2Click(Sender: TObject);
begin
  if dmCuadrexRuta.tblDesembolsoCaja.State = dsBrowse then
  begin
    dmCuadrexRuta.tblDesembolsoCaja.Insert;
    dmCuadrexRuta.tblDesembolsoCajaCIA_KEY.Value:= GlbCodigoCia;
    dmCuadrexRuta.tblDesembolsoCajaCOD_OFICINA.Value:= GlbCodOficina;
    dmCuadrexRuta.tblDesembolsoCajaFECHA.Value  := ExtraerFecha(GlbFechaTrnDiaria);
    dmCuadrexRuta.tblDesembolsoCajaMoneda.Value := '1';
    dmCuadrexRuta.tblDesembolsoCajaSTATUS.Value := 'A';
    DBDateEdit1.SetFocus;
  end;
end;

procedure TfrmDesembolsos.SpeedButton3Click(Sender: TObject);
begin
  if dmCuadrexRuta.tblDesembolsoCaja.State in [dsinsert, dsEdit] then
  begin
    dmCuadrexRuta.tblDesembolsoCaja.Cancel;
  end;
end;

procedure TfrmDesembolsos.BitBtn1Click(Sender: TObject);
begin
  dmCuadrexRuta.tblDesembolsoCaja.Close;
  dmCuadrexRuta.tblDesembolsoCaja.Open;
end;

procedure TfrmDesembolsos.FormCreate(Sender: TObject);
begin
  GetAnyDate1.UsaFechaCierre:= True;
  GetAnyDate1.FechaCierre   := GlbFechaTrnDiaria;
  if GetAnyDate1.Execute then
  begin
    dmCuadrexRuta.tblDesembolsoCaja.Close;
    dmCuadrexRuta.tblDesembolsoCaja.Params[0].Value:=ExtraerFecha(GetAnyDate1.Fecha);
    dmCuadrexRuta.tblDesembolsoCaja.Open;
  end;
  dmUsuarios.qryEmpleados.Close;
  dmUsuarios.qryEmpleados.Open;
end;

end.
