unit UConfDescuentosNomina;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, RXCtrls, RXDBCtrl, StdCtrls, Buttons, DB, Mask,
  DBCtrls, rxToolEdit,IBCustomDataSet, EditNew, RxLookup, RxToolEdit;

type
  TfrmConfDescuentosNomina = class(TForm)
    BitBtn29: TBitBtn;
    BitBtn31: TBitBtn;
    BitBtn32: TBitBtn;
    BitBtn34: TBitBtn;
    BitBtn54: TBitBtn;
    DBStatusLabel9: TDBStatusLabel;
    DBGrid9: TDBGrid;
    BitBtn4: TBitBtn;
    dstblDescNomina: TDataSource;
    DBDateEdit1: TDBDateEdit;
    DBDateEdit2: TDBDateEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    RxDBLookupCombo2: TRxDBLookupCombo;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn29Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn32Click(Sender: TObject);
    procedure BitBtn34Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    procedure Guardar(tabla:TIBDataSet);
  public
    { Public declarations }
  end;

var
  frmConfDescuentosNomina: TfrmConfDescuentosNomina;

implementation

uses UDatModDescuentosNom, UGlobal, UFormSelFecha;

{$R *.dfm}

procedure TfrmConfDescuentosNomina.FormCreate(Sender: TObject);
begin
  dmDescuentosNom.tblTipoDescuento.Close;
  dmDescuentosNom.tblTipoDescuento.Open;
  dmDescuentosNom.tblTipoNomina.Close;
  dmDescuentosNom.tblTipoNomina.Open;
  dmDescuentosNom.tblDescNomina.Close;
  dmDescuentosNom.tblDescNomina.Params[0].Value:=ExtraerFecha(Date);
  dmDescuentosNom.tblDescNomina.Open;
end;

procedure TfrmConfDescuentosNomina.BitBtn29Click(Sender: TObject);
begin
  if dmDescuentosNom.tblDescNomina.State = dsBrowse then
  begin
    dmDescuentosNom.tblDescNomina.Insert;
    dmDescuentosNom.tblDescNominaFECHA_INICIAL.Value:= ExtraerFecha(Date);
    dmDescuentosNom.tblDescNominaFECHA_Final.Value  := ExtraerFecha(Date) + 365;
    dmDescuentosNom.tblDescNominaSTATUS.Value       := 'A';
    RxDBLookupCombo1.SetFocus;
  end;
end;

procedure TfrmConfDescuentosNomina.BitBtn4Click(Sender: TObject);
begin
  if dmDescuentosNom.tblDescNomina.State In [dsEdit, dsInsert] then
    begin
      dmDescuentosNom.tblDescNomina.Post;
      Guardar(dmDescuentosNom.tblDescNomina);
    end;
end;

procedure TfrmConfDescuentosNomina.Guardar(Tabla: TIBDataSet);
begin
  if Not Tabla.Transaction.InTransaction then
  Tabla.Transaction.StartTransaction;
  try
    Tabla.Transaction.CommitRetaining;
  except
  Tabla.Transaction.RollbackRetaining;
  end;
end;

procedure TfrmConfDescuentosNomina.BitBtn32Click(Sender: TObject);
begin
  if dmDescuentosNom.tblDescNomina.State In [dsEdit, dsInsert] then
  dmDescuentosNom.tblDescNomina.Cancel;
end;

procedure TfrmConfDescuentosNomina.BitBtn34Click(Sender: TObject);
begin
  if dmDescuentosNom.tblDescNomina.State In [dsInactive, dsBrowse] then
  begin
    dmDescuentosNom.tblDescNomina.Close;
    dmDescuentosNom.tblDescNomina.Open;
  end;
end;

procedure TfrmConfDescuentosNomina.BitBtn1Click(Sender: TObject);
begin
  frmSelFecha:=TfrmSelFecha.create(Nil);
  try
    if frmSelFecha.showmodal= mrOk then
    begin
      dmDescuentosNom.tblDescNomina.Close;
      dmDescuentosNom.tblDescNomina.Params[0].Value := ExtraerFecha(Date);
      dmDescuentosNom.tblDescNomina.Open;
    end;
  finally
  frmSelFecha.Free;
  frmSelFecha:=Nil;
  end;
end;

end.
