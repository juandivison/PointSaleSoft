unit UFormCoberturas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WinSkinData, StdCtrls, Buttons, Grids, DBGrids, RxDBCtrl, Mask,
  db, DBCtrls, RxCtrls;

type
  TfrmTipoAfiliacion = class(TForm)
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton1: TSpeedButton;
    DBStatusLabel1: TDBStatusLabel;
    RxDBGrid1: TRxDBGrid;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    SkinData1: TSkinData;
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTipoAfiliacion: TfrmTipoAfiliacion;

implementation

uses UDatModCobertura, UGlobal;

{$R *.dfm}

procedure TfrmTipoAfiliacion.BitBtn10Click(Sender: TObject);
begin
  dmCobertura.tblTipoAfiliacion.prior;
end;

procedure TfrmTipoAfiliacion.BitBtn11Click(Sender: TObject);
begin
  dmCobertura.tblTipoAfiliacion.next;
end;

procedure TfrmTipoAfiliacion.BitBtn12Click(Sender: TObject);
begin
  dmCobertura.tblTipoAfiliacion.Last;
end;

procedure TfrmTipoAfiliacion.BitBtn9Click(Sender: TObject);
begin
  dmCobertura.tblTipoAfiliacion.first;
end;

procedure TfrmTipoAfiliacion.SpeedButton1Click(Sender: TObject);
begin
  if dmCobertura.tblTipoAfiliacion.State in [dsinsert, dsEdit] then
  begin
    if dmCobertura.tblTipoAfiliacion.State in [dsinsert] then
    dmCobertura.tblTipoAfiliacionIDTIPO.Value:= FsqlMaxNumero('TIPO_AFILIADO', 'IDTIPO');
    GlbSalvarQuery(dmCobertura.tblTipoAfiliacion);
  end;
end;

procedure TfrmTipoAfiliacion.SpeedButton2Click(Sender: TObject);
begin                    
  if dmCobertura.tblTipoAfiliacion.State = dsBrowse then
  begin
    dmCobertura.tblTipoAfiliacion.Insert;
    DBEdit2.SetFocus;
  end;
end;

procedure TfrmTipoAfiliacion.SpeedButton3Click(Sender: TObject);
begin
  if dmCobertura.tblTipoAfiliacion.State in [dsInsert, dsEdit] then
  begin
    dmCobertura.tblTipoAfiliacion.Cancel;
  end;
end;

end.
