unit UFormTipoAfiliacion;

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
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    BitBtn1: TBitBtn;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTipoAfiliacion: TfrmTipoAfiliacion;

implementation

uses UDatModCobertura, UGlobal, UFormLogoTipoAfiliado;

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
    dmCobertura.tblTipoAfiliacion.Append;
    dmCobertura.tblTipoAfiliacionSTATUS.Value:='A';
    DBEdit1.SetFocus;
  end;
end;

procedure TfrmTipoAfiliacion.SpeedButton3Click(Sender: TObject);
begin
  if dmCobertura.tblTipoAfiliacion.State in [dsInsert, dsEdit] then
  begin
    dmCobertura.tblTipoAfiliacion.Cancel;
  end;
end;

procedure TfrmTipoAfiliacion.FormCreate(Sender: TObject);
begin
  dmCobertura.tblTipoAfiliacion.Close;
  dmcobertura.tblTipoAfiliacion.Open;
end;

procedure TfrmTipoAfiliacion.BitBtn1Click(Sender: TObject);
begin
  frmLogoTipoAfiliado:=TfrmLogoTipoAfiliado.Create(nil);
  try
    frmLogoTipoAfiliado.showmodal;
  finally
  FreeAndNil(frmLogoTipoAfiliado);
  end;
end;

end.
