unit UGrupoCtaActivos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, RXCtrls, RXDBCtrl, ExtCtrls, DBCtrls, Mask, Grids,
  db, ibquery, DBGrids, IBCustomDataSet;

type
  TfrmGrupocuentaActivo = class(TForm)
    Panel1: TPanel;
    DBStatusLabel1: TDBStatusLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn5: TBitBtn;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    DBLookupComboBox4: TDBLookupComboBox;
    DBLookupComboBox5: TDBLookupComboBox;
    Button1: TButton;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    dtqryCtasCat: TDataSource;
    qryCtasCat: TIBDataSet;
    qryCtasCatCUENTA1: TIBStringField;
    qryCtasCatCUENTA2: TIBStringField;
    qryCtasCatCUENTA3: TIBStringField;
    qryCtasCatNOMBRE_CTA: TIBStringField;
    qryCtasCatSIGNO_CTA: TSmallintField;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGrupocuentaActivo: TfrmGrupocuentaActivo;

implementation
uses UDatModuloActivos, UDatModConectar;
{$R *.DFM}

procedure TfrmGrupocuentaActivo.BitBtn1Click(Sender: TObject);
begin
  if dm.tActivoCuentaGrupo.State in [dsBrowse] then
  begin
    dm.tActivoCuentaGrupo.Insert;
    DBEdit1.SetFocus;
    DBEdit1.SelectAll;
  end;
end;

procedure TfrmGrupocuentaActivo.BitBtn2Click(Sender: TObject);
begin
  if dm.tActivoCuentaGrupo.State in [dsBrowse] then
  begin
    dm.tActivoCuentaGrupo.Edit;
  end;
end;

procedure TfrmGrupocuentaActivo.BitBtn3Click(Sender: TObject);
begin
  if dm.tActivoCuentaGrupo.State In [dsInsert,dsEdit] then
  begin
    dm.tActivoCuentaGrupo.Post;
    if not dm.tActivoCuentaGrupo.Transaction.InTransaction then
    dm.tActivoCuentaGrupo.Transaction.StartTransaction;
    try
      dm.tActivoCuentaGrupo.Transaction.CommitRetaining;
    except
    dm.tActivoCuentaGrupo.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmGrupocuentaActivo.BitBtn4Click(Sender: TObject);
begin
  if dm.tActivoCuentaGrupo.State In [dsInsert,dsEdit] then
  dm.tActivoCuentaGrupo.Cancel;
end;

procedure TfrmGrupocuentaActivo.BitBtn6Click(Sender: TObject);
begin
  dm.tActivoCuentaGrupo.Filtered:=False;
  dm.tActivoCuentaGrupo.close;
  dm.tactivocuentagrupo.open;
end;

procedure TfrmGrupocuentaActivo.FormCreate(Sender: TObject);
begin
  dm.tTipoActivos.Close;
  dm.tTipoActivos.Open;
  dm.tActivoCuentaGrupo.Close;
  dm.tActivoCuentaGrupo.Filtered:=False;
  dm.tActivoCuentaGrupo.Open;
  qryCtasCat.close;
  qryCtasCat.open;
end;

procedure TfrmGrupocuentaActivo.Button1Click(Sender: TObject);
begin
  DBGrid2.Visible     := True;
  DBGrid2.BringToFront;
  qryCtasCat.Close;
  qryCtasCat.Filtered := False;
  qryCtasCat.Open;
end;

procedure TfrmGrupocuentaActivo.DBGrid2DblClick(Sender: TObject);
begin
  if dm.tActivoCuentaGrupo.State in [dsInsert] then
  begin
    dm.tActivoCuentaGrupocta1.Value := qryctascatcuenta1.Value;
    dm.tActivoCuentaGrupocta2.Value:= qryctascatcuenta2.Value;
    dm.tActivoCuentaGrupocta3.Value:= qryctascatcuenta3.Value;
    dm.tActivoCuentaGrupoCTA_ORIGEN.Value:=qryCtasCatSIGNO_CTA.Value;
  end;
  DBGrid2.Visible := False;
  DBGrid2.SendToBack;
end;

end.
