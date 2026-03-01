unit UFormCompFiscal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, db, Buttons, Grids, DBGrids, StdCtrls, Mask, DBCtrls,
  WinSkinData, jpeg, ExtCtrls, ComCtrls, RXCtrls, RXDBCtrl;

type
  TfrmTipoCompFiscal = class(TForm)
    SkinData1: TSkinData;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton1: TSpeedButton;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBGrid1: TDBGrid;
    Image1: TImage;
    DBStatusLabel1: TDBStatusLabel;
    DBEdit3: TDBEdit;
    Label3: TLabel;
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTipoCompFiscal: TfrmTipoCompFiscal;

implementation

uses UDatModFactura;

{$R *.dfm}

procedure TfrmTipoCompFiscal.SpeedButton2Click(Sender: TObject);
begin
  if dmFactura.tblTipoCF.State = dsBrowse then
  begin
    dmFactura.tblTipoCF.Insert;
    DBEdit1.SetFocus;
  end;
end;

procedure TfrmTipoCompFiscal.SpeedButton1Click(Sender: TObject);
begin
  if dmFactura.tblTipoCF.State in [dsInsert, dsEdit] then
  begin
    dmFactura.tblTipoCF.Post;
    if not dmFactura.tblTipoCF.Transaction.InTransaction then
    dmFactura.tblTipoCF.Transaction.StartTransaction;
    try
      dmFactura.tblTipoCF.Transaction.CommitRetaining;
    except
    dmFactura.tblTipoCF.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmTipoCompFiscal.SpeedButton3Click(Sender: TObject);
begin
  if dmFactura.tblTipoCF.State in [dsBrowse] then
  begin
    if MessageDlg('Seguro que desea eliminar record?',mtWarning, [mbYes, mbNO], 0) = mryes then
    begin
      dmFactura.tblTipoCF.Delete;
      if not dmFactura.tblTipoCF.Transaction.InTransaction then
      dmFactura.tblTipoCF.Transaction.StartTransaction;
      try
        dmFactura.tblTipoCF.Transaction.CommitRetaining;
      except
      dmFactura.tblTipoCF.Transaction.RollbackRetaining;
      end;
    end;
  end else
  if dmFactura.tblTipoCF.State in [dsEdit, dsInsert] then
  begin
    dmFactura.tblTipoCF.Cancel;
  end;
end;

procedure TfrmTipoCompFiscal.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
    if dmFactura.tblTipoCF.State in [dsEdit, dsInsert] then
  begin
    MessageDlg('Hay una transacccion pendiente, verifique',mtInformation, [mbOK], 0);
    CanClose:=False;
  end else CanClose:=True;
end;

procedure TfrmTipoCompFiscal.FormCreate(Sender: TObject);
begin
  dmFactura.tblTipoCF.Close;
  dmFactura.tblTipoCF.Open;
end;

end.
