unit UDescLineaDocfiscal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RXCtrls, RXDBCtrl, Buttons, Grids, DBGrids, StdCtrls, Mask,
  db, DBCtrls, ExtCtrls, WinSkinData, EditNew;

type
  TfrmConfLineaDocFiscal = class(TForm)
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
    Shape1: TShape;
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

  frmConfLineaDocFiscal: TfrmConfLineaDocFiscal;

implementation

uses UDatmodDatosGenerales, Uglobal;

{$R *.dfm}

procedure TfrmConfLineaDocFiscal.SpeedButton1Click(Sender: TObject);
begin
  if dmDatos.tblLineaDescDocF.State in [dsInsert, dsEdit] then
  begin
    if dmDatos.tblLineaDescDocF.State in [dsInsert] then
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
      dmDatos.tblLineaDescDocFITEM.Value := dmDatos.sqlLineaDescDocFGenMax.FieldByName('maxitem').Value + 1
      else dmDatos.tblLineaDescDocFITEM.Value := 1;
    end;

    dmDatos.tblLineaDescDocF.Post;
    dmDatos.tblLineaDescDocF.ApplyUpdates;
    if Not dmDatos.tblLineaDescDocF.Transaction.InTransaction Then
    dmDatos.tblLineaDescDocF.Transaction.StartTransaction;
    try
      dmDatos.tblLineaDescDocF.Transaction.CommitRetaining;
    except
    dmDatos.tblLineaDescDocF.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmConfLineaDocFiscal.SpeedButton2Click(Sender: TObject);
begin
  if dmDatos.tblLineaDescDocF.State = dsBrowse then
  begin
    if rdgItem.ItemIndex = 0 then
    begin
      dmDatos.tblLineaDescDocF.Insert;
      dmDatos.tblLineaDescDocFIDLINEA.Value:=1
    end else
    if rdgItem.ItemIndex = 1 then
    begin
      dmDatos.tblLineaDescDocF.Insert;
      dmDatos.tblLineaDescDocFIDLINEA.Value:=2
    end else
    if rdgItem.ItemIndex = 2 then
    begin
      dmDatos.tblLineaDescDocF.Insert;
      dmDatos.tblLineaDescDocFIDLINEA.Value:=2
    end else
    if rdgItem.ItemIndex = 3 then
    begin
      if dmDatos.tblLineaDescDocF.RecordCount = 40 then
      begin
        MessageDlg('No se aceptan mas de 40 lineas de comentario', mtError,[mbOk, mbNo],0);
      end;
      dmDatos.tblLineaDescDocF.Insert;
      dmDatos.tblLineaDescDocFIDLINEA.Value:=4;
    end;

    dmDatos.tblLineaDescDocFITEM.Value
  end;
end;

procedure TfrmConfLineaDocFiscal.SpeedButton3Click(Sender: TObject);
begin
  if dmDatos.tblLineaDescDocF.State In [dsInsert, dsEdit] then
  begin
    dmDatos.tblLineaDescDocF.Cancel;
  end;
end;

procedure TfrmConfLineaDocFiscal.SpeedButton7Click(Sender: TObject);
begin
  dmDatos.tblLineaDescDocF.Close;
  dmDatos.tblLineaDescDocF.Open;
end;

procedure TfrmConfLineaDocFiscal.SpeedButton8Click(Sender: TObject);
begin
  if MessageDlg('Eliminar record?', mtWarning,[mbYes, mbNo],0) = mrYes then
  begin
    dmDatos.tblLineaDescDocF.Delete;
    dmDatos.tblLineaDescDocF.ApplyUpdates;
    if not dmDatos.tblLineaDescDocF.Transaction.InTransaction then
    dmDatos.tblLineaDescDocF.Transaction.StartTransaction;
    try
      dmDatos.tblLineaDescDocF.Transaction.CommitRetaining;
    except
    dmDatos.tblLineaDescDocF.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmConfLineaDocFiscal.FormCreate(Sender: TObject);
begin
  dmDatos.tblLineaDescDocF.Close;
  dmDatos.tblLineaDescDocF.Open;
end;

procedure TfrmConfLineaDocFiscal.rdgItemClick(Sender: TObject);
begin
  dmdatos.tblLineaDescDocF.Close;
  dmdatos.tblLineaDescDocF.Params[0].Value := rdgItem.ItemIndex + 1;
  dmdatos.tblLineaDescDocF.Open;
end;

end.
