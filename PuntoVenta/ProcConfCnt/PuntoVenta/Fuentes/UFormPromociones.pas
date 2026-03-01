unit UFormPromociones;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Mask, DBCtrls, Buttons, RxLookup, Grids, DBGrids,
  RXDBCtrl, IBCustomDataSet, IBTable, RXCtrls;

type
  TfrmPromociones = class(TForm)
    Label1: TLabel;
    dstblPromociones: TDataSource;
    RxDBGrid1: TRxDBGrid;
    RxDBLookupCombo1: TRxDBLookupCombo;
    RxDBLookupCombo2: TRxDBLookupCombo;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    dsqryInventario: TDataSource;
    dstblCliente: TDataSource;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    tblCliente: TIBTable;
    DBStatusLabel1: TDBStatusLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    Function fsumarPromo:Real;
  public
    { Public declarations }
  end;

var
  frmPromociones: TfrmPromociones;

implementation

uses UDatModCuadrexRuta, UGlobal, UDatModConectar;

{$R *.dfm}

procedure TfrmPromociones.BitBtn1Click(Sender: TObject);
begin
  if dmCuadrexRuta.tblPromociones.State = dsBrowse then
  begin
    dmCuadrexRuta.tblPromociones.Insert;
    dmCuadrexRuta.tblPromocionesRUTA.Value     := dmCuadrexRuta.qryDetalleCuadreRutaRUTA.Value;
    dmCuadrexRuta.tblPromocionesCODIGO_USUARIO.Value := VarUsuarioGlb;
    dmCuadrexRuta.tblPromocionesFECHA_IN.Value := Now;
    dmCuadrexRuta.tblPromocionesFECHA.Value    := ExtraerFecha(dmCuadrexRuta.qryDetalleCuadreRutaFECHA.Value);
    dmCuadrexRuta.tblPromocionesSTATUS.Value   := 'A';
    RxDBLookupCombo2.SetFocus;
  end;
end;

procedure TfrmPromociones.BitBtn2Click(Sender: TObject);
begin
  if dmCuadrexRuta.tblPromociones.State = dsBrowse then
  dmCuadrexRuta.tblPromociones.Edit;
end;

procedure TfrmPromociones.BitBtn3Click(Sender: TObject);
begin
  if dmCuadrexRuta.tblPromociones.State in [dsEdit, dsInsert] then
  dmCuadrexRuta.tblPromociones.cancel;
end;

procedure TfrmPromociones.BitBtn4Click(Sender: TObject);
var
  sumar : Real;
begin
  if dmCuadrexRuta.tblPromociones.State in [dsEdit, dsInsert] then
  begin
    dmCuadrexRuta.tblPromociones.Post;
    dmCuadrexRuta.tblPromociones.ApplyUpdates;
    if not dmCuadrexRuta.tblPromociones.Transaction.InTransaction then
    dmCuadrexRuta.tblPromociones.Transaction.StartTransaction;
    try
      dmCuadrexRuta.tblPromociones.Transaction.CommitRetaining;
    except
    dmCuadrexRuta.tblPromociones.Transaction.RollbackRetaining;
    end;
  end;
  Sumar := FSumarPromo;
  Label7.Caption := Format('%n', [Sumar]);
  Label9.Caption := FloatToStr(dmCuadrexRuta.QryDetalleCuadreRutaPROMOCION.Value - Sumar);
end;

procedure TfrmPromociones.BitBtn5Click(Sender: TObject);
begin
  if dmCuadrexRuta.tblPromociones.State in [dsInactive, dsBrowse] then
  begin
    dmCuadrexRuta.tblPromociones.Close;
    dmCuadrexRuta.tblPromociones.Open;
  end;
end;

procedure TfrmPromociones.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
  SumaPromo : Real;
begin
  if dmcuadrexRuta.tblPromociones.State in [dsEdit, dsInsert] then
  begin
    CanClose:=False;
    MessageDlg('Transacción pendiente, verifique',mtInformation, [mbOK], 0);
    DBEdit1.SetFocus;
    Exit;
  end;
  if dmcuadrexRuta.tblPromociones.RecordCount > 0 then
  begin
    SumaPromo := FsumarPromo;
  end;
  if SumaPromo = dmCuadrexRuta.qryDetalleCuadreRutaPROMOCION.Value then
  CanClose:=True
  else
  begin
    MessageDlg('Antes de Salir el monto debe cuadrar con el valor original',mtInformation, [mbOK], 0);
    CanClose:=True;
  end;
end;

procedure TfrmPromociones.FormCreate(Sender: TObject);
begin
  Label4.Caption:= dmCuadrexRuta.qryDetalleCuadreRutaPROMOCION.AsString;
  dmCuadrexRuta.qryInventario.Close;
  dmCuadrexRuta.qryInventario.Open;
  tblCliente.Close;
  tblCliente.Open;
  Label7.Caption := Format('%n', [FSumarPromo]);
  Label9.Caption := FloatToStr(dmCuadrexRuta.QryDetalleCuadreRutaPROMOCION.Value - FSumarPromo);
end;

function TfrmPromociones.FsumarPromo: Real;
var
  SumaPromo : Real;
begin
  if dmcuadrexRuta.tblPromociones.RecordCount > 0 then
  begin
    SumaPromo := 0;
    dmcuadrexRuta.tblPromociones.First;
    While Not dmcuadrexRuta.tblPromociones.Eof do
    begin
      SumaPromo := SumaPromo + dmcuadrexRuta.tblPromocionesMonto.Value;
      dmcuadrexRuta.tblPromociones.Next;
    end;
  end;
  Result:=SumaPromo;  
end;

end.
