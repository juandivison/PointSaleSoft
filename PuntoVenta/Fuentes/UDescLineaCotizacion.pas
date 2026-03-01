unit UDescLineaCotizacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RXCtrls, RXDBCtrl, Buttons, Grids, DBGrids, StdCtrls, Mask,
  db, DBCtrls, ExtCtrls, WinSkinData;

type
  TfrmConfLineaCotizacion = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    RxDBGrid1: TRxDBGrid;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton1: TSpeedButton;
    DBStatusLabel1: TDBStatusLabel;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    SkinData1: TSkinData;
    rdgItem: TRadioGroup;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rdgItemClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfLineaCotizacion: TfrmConfLineaCotizacion;

implementation

uses UDatmodDatosGenerales;

{$R *.dfm}

procedure TfrmConfLineaCotizacion.SpeedButton1Click(Sender: TObject);
begin
  if dmDatos.tblDescCotizacion.State in [dsInsert, dsEdit] then
  begin
    if dmDatos.tblDescCotizacion.State in [dsInsert] then
    begin
      dmDatos.sqlLineaDescDocFGenMax.Close;
      if rdgItem.ItemIndex = 0 then
      dmDatos.sqlLineaDescDocFGenMax.Params[0].Value:= 1
      else if rdgItem.ItemIndex = 1 then
      dmDatos.sqlLineaDescDocFGenMax.Params[0].Value:= 2
      else if rdgItem.ItemIndex = 2 then
      dmDatos.sqlLineaDescDocFGenMax.Params[0].Value:= 3;
      dmDatos.sqlLineaDescDocFGenMax.ExecQuery;
      if Not dmDatos.sqlLineaDescDocFGenMax.FieldByName('maxitem').IsNull then
      dmDatos.tblDescCotizacionITEM.Value := dmDatos.sqlLineaDescDocFGenMax.FieldByName('maxitem').Value + 1
      else dmDatos.tblDescCotizacionITEM.Value := 1;
    end;

    dmDatos.tblDescCotizacion.Post;
    dmDatos.tblDescCotizacion.ApplyUpdates;
    if Not dmDatos.tblDescCotizacion.Transaction.InTransaction Then
    dmDatos.tblDescCotizacion.Transaction.StartTransaction;
    try
      dmDatos.tblDescCotizacion.Transaction.CommitRetaining;
    except
    dmDatos.tblDescCotizacion.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmConfLineaCotizacion.SpeedButton2Click(Sender: TObject);
begin
  if dmDatos.tblDescCotizacion.State = dsBrowse then
  begin
    dmDatos.tblDescCotizacion.Insert;
    if rdgItem.ItemIndex = 0 then
    dmDatos.tblDescCotizacionIDLINEA.Value:=1
    else
    if rdgItem.ItemIndex = 1 then
    dmDatos.tblDescCotizacionIDLINEA.Value:=2
    else
    if rdgItem.ItemIndex = 2 then
    dmDatos.tblDescCotizacionIDLINEA.Value:=3
    else
    if rdgItem.ItemIndex = 3 then
    dmDatos.tblDescCotizacionIDLINEA.Value:=4;

    dmDatos.tblDescCotizacionITEM.Value
  end;
end;

procedure TfrmConfLineaCotizacion.SpeedButton3Click(Sender: TObject);
begin
  if dmDatos.tblDescCotizacion.State In [dsInsert, dsEdit] then
  begin
    dmDatos.tblDescCotizacion.Cancel;
  end;
end;

procedure TfrmConfLineaCotizacion.SpeedButton7Click(Sender: TObject);
begin
  dmDatos.tblDescCotizacion.Close;
  dmDatos.tblDescCotizacion.Open;
end;

procedure TfrmConfLineaCotizacion.SpeedButton8Click(Sender: TObject);
begin
  if MessageDlg('Eliminar record?', mtWarning,[mbYes, mbNo],0) = mrYes then
  begin
    dmDatos.tblDescCotizacion.Delete;
    dmDatos.tblDescCotizacion.ApplyUpdates;
    if not dmDatos.tblDescCotizacion.Transaction.InTransaction then
    dmDatos.tblDescCotizacion.Transaction.StartTransaction;
    try
      dmDatos.tblDescCotizacion.Transaction.CommitRetaining;
    except
    dmDatos.tblDescCotizacion.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmConfLineaCotizacion.FormCreate(Sender: TObject);
begin
  dmDatos.tblDescCotizacion.Close;
  dmDatos.tblDescCotizacion.Open;
  rdgItemClick(Self);  
end;

procedure TfrmConfLineaCotizacion.rdgItemClick(Sender: TObject);
begin
  dmdatos.tblDescCotizacion.Close;
  dmdatos.tblDescCotizacion.Params[0].Value := rdgItem.ItemIndex + 1;
  dmdatos.tblDescCotizacion.Open;
end;

end.
