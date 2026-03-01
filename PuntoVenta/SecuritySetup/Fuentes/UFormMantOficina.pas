unit UFormMantOficina;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  db,Dialogs, RxLookup, StdCtrls, Mask, DBCtrls, Buttons, RXCtrls, RXDBCtrl,
  ExtCtrls, WinSkinData;

type
  TfrmOficina = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton1: TSpeedButton;
    DBStatusLabel1: TDBStatusLabel;
    DBNavigator1: TDBNavigator;
    SkinData1: TSkinData;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOficina: TfrmOficina;

implementation

uses UDatModOficina, UGlobal;

{$R *.dfm}

procedure TfrmOficina.FormCreate(Sender: TObject);
begin
  dmOficina.tblOficina.Close;
  dmOficina.tblOficina.Open;
  dmOficina.tblCiudades.Close;
  dmOficina.tblCiudades.Open;
end;

procedure TfrmOficina.SpeedButton2Click(Sender: TObject);
begin
  if dmOficina.tblOficina.State = dsBrowse then
  begin
    dmOficina.tblOficina.Insert;
    dmOficina.tblOficinaCODIGO.Value:= FsqlMaxNumero('Oficina','Codigo');
    DBEdit2.SetFocus;
  end;
end;

procedure TfrmOficina.SpeedButton1Click(Sender: TObject);
begin
  if dmOficina.tblOficina.State in [dsInsert, dsEdit] then
  dmOficina.tblOficina.Post;
  if not dmoficina.tblOficina.Transaction.InTransaction then
  dmoficina.tblOficina.Transaction.StartTransaction;
  try
    dmoficina.tblOficina.Transaction.CommitRetaining;
  except
  dmoficina.tblOficina.Transaction.RollbackRetaining;
  end;
end;

procedure TfrmOficina.SpeedButton3Click(Sender: TObject);
begin
  if dmOficina.tblOficina.State in [dsInsert, dsEdit] then
  dmOficina.tblOficina.Cancel;
end;

end.

