unit UnitFrmConfigEndpoints;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Db, IBDatabase, IBSQL, IBCustomDataSet, IBQuery,
  StdCtrls, ExtCtrls, Grids, RxDBCtrl, DBGrids, Mask, DBCtrls, WinSkinData;

type
  TFormConfigEndpoints = class(TForm)
    dstblEndPointseCF: TDataSource;
    RxDBGrid1: TRxDBGrid;
    PanelTop: TPanel;
    LabelEnv: TLabel;
    ComboBoxEnv: TComboBox;
    ButtonSave: TButton;
    ButtonCancel: TButton;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    SkinData1: TSkinData;
    procedure FormCreate(Sender: TObject);
    procedure ComboBoxEnvChange(Sender: TObject);
    procedure ButtonSaveClick(Sender: TObject);
    procedure ButtonCancelClick(Sender: TObject);
  private
    procedure LoadData;
  public
  end;

var
  FormConfigEndpoints: TFormConfigEndpoints;

implementation
  uses UGlobal, UDatModFacturaElectronica;
  
{$R *.dfm}

procedure TFormConfigEndpoints.FormCreate(Sender: TObject);
begin
  ComboBoxEnv.Items.Clear;
  ComboBoxEnv.Items.Add('Test');
  ComboBoxEnv.Items.Add('Producción');
  ComboBoxEnv.ItemIndex := 0;
  LoadData;
end;

procedure TFormConfigEndpoints.LoadData;
begin
  dmFactElectronica.tblEndPointseCF.Close;
  dmFactElectronica.tblEndPointseCF.Params[0].AsInteger := ComboBoxEnv.ItemIndex;
  dmFactElectronica.tblEndPointseCF.Open;
end;

procedure TFormConfigEndpoints.ComboBoxEnvChange(Sender: TObject);
begin
  LoadData;
end;

procedure TFormConfigEndpoints.ButtonSaveClick(Sender: TObject);
begin
  if dmFactElectronica.tblEndPointseCF.State in [dsInsert, dsEdit] then
    GlbSalvarQuery(dmFactElectronica.tblEndPointseCF);
end;

procedure TFormConfigEndpoints.ButtonCancelClick(Sender: TObject);
begin
  if dmFactElectronica.tblEndPointseCF.State in [dsEdit, dsInsert] then
    dmFactElectronica.tblEndPointseCF.Cancel;
  GlbSalvarQuery(dmFactElectronica.tblEndPointseCF);
  LoadData;
end;

end.

