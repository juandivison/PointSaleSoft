unit UTipoActivo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  db, StdCtrls, Buttons, ExtCtrls, DBCtrls, Grids, DBGrids, RXDBCtrl, Mask,
  WinSkinData, RXCtrls;

type
  TfrmTipoActivo = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    Label4: TLabel;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    RxDBGrid1: TRxDBGrid;
    DBNavigator1: TDBNavigator;
    DBLookupComboBox1: TDBLookupComboBox;
    Label5: TLabel;
    SkinData1: TSkinData;
    DBStatusLabel1: TDBStatusLabel;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTipoActivo: TfrmTipoActivo;

implementation

uses UDatModuloActivos, UDatModConectar;

{$R *.DFM}

procedure TfrmTipoActivo.FormCreate(Sender: TObject);
begin
  dm.tTipoActivos.Close;
  dm.tTipoActivos.Open;
  dm.tClase_Cuenta_Adm.Close;
  dm.tClase_Cuenta_Adm.Open;
end;

procedure TfrmTipoActivo.BitBtn1Click(Sender: TObject);
begin
  if dm.tTipoActivos.State in [dsBrowse] then
  dm.tTipoActivos.Insert;
end;

procedure TfrmTipoActivo.BitBtn2Click(Sender: TObject);
begin
  if dm.tTipoActivos.State in [dsBrowse] then
  dm.tTipoActivos.Edit;
end;

procedure TfrmTipoActivo.BitBtn3Click(Sender: TObject);
begin
  if dm.tTipoActivos.State in [dsEdit,dsinsert] then
  begin
    if not dm.tTipoActivos.Transaction.InTransaction then
    dm.tTipoActivos.Transaction .StartTransaction;
    dm.tTipoActivos.Post;
    try
      dm.tTipoActivos.Transaction.commitretaining;
    except
    dm.tTipoActivos.Transaction.Rollbackretaining;
    end;
  end;
end;

procedure TfrmTipoActivo.BitBtn4Click(Sender: TObject);
begin
  if dm.tTipoActivos.State in [dsEdit,dsinsert] then
  dm.tTipoActivos.Cancel;
end;

end.
