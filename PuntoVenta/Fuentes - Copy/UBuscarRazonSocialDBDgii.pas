unit UBuscarRazonSocialDBDgii;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, RXDBCtrl, DB,
  WinSkinData;

type
  TfrmBuscarRNC = class(TForm)
    DataSource1: TDataSource;
    RxDBGrid1: TRxDBGrid;
    Panel2: TPanel;
    edtBuscarRNC: TEdit;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    CheckBox1: TCheckBox;
    SkinData1: TSkinData;
    procedure edtBuscarRNCChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBuscarRNC: TfrmBuscarRNC;

implementation

uses UDatModDGII;

{$R *.dfm}

procedure TfrmBuscarRNC.edtBuscarRNCChange(Sender: TObject);
begin
  if not Assigned(dmDGII) then
  dmDGII := TdmDGII.Create(nil);
  if (Length(edtBuscarRNC.Text) >=4) then
  dmDGII.BuscarRazonSocial(edtBuscarRNC.Text);
end;

procedure TfrmBuscarRNC.FormCreate(Sender: TObject);
begin
  if not Assigned(dmDGII) then
  dmDGII := TdmDGII.Create(nil);
end;

procedure TfrmBuscarRNC.BitBtn1Click(Sender: TObject);
begin
  if not Assigned(dmDGII) then
  dmDGII := TdmDGII.Create(nil);
  if (Length(edtBuscarRNC.Text) >=4) then
  dmDGII.BuscarRazonSocial(edtBuscarRNC.Text);
end;

end.
