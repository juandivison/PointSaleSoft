unit UFormTipoTrnCNT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, ExtCtrls, RxDBComb, Grids, DBGrids,
  DB, RXDBCtrl, RxLookup, Buttons, WinSkinData, rxToolEdit;

type
  TfrmTipoTrnConfig = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBRadioGroup1: TDBRadioGroup;
    DBRadioGroup2: TDBRadioGroup;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    RxDBGrid1: TRxDBGrid;
    RxDBLookupCombo2: TRxDBLookupCombo;
    RxDBComboBox2: TRxDBComboBox;
    RxDBLookupCombo1: TRxDBLookupCombo;
    SkinData1: TSkinData;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton1: TSpeedButton;
    DBDateEdit1: TDBDateEdit;
    DBDateEdit2: TDBDateEdit;
    Label8: TLabel;
    Label9: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTipoTrnConfig: TfrmTipoTrnConfig;

implementation

uses UDatmodDatosGenerales, UDatModRegOpeDiaria, Uglobal;

{$R *.dfm}

procedure TfrmTipoTrnConfig.FormCreate(Sender: TObject);
begin
  dmDatos.tblCriterioTipodoc.Close;
  dmDatos.tblCriterioTipodoc.Open;
  dmdatos.tblTipoTrnCnt.Close;
  dmdatos.tblTipoTrnCnt.Open;
  dtmTransOpeDiaria.tblPersonaJuridica.Close;
  dtmTransOpeDiaria.tblPersonaJuridica.Open;
end;

procedure TfrmTipoTrnConfig.SpeedButton1Click(Sender: TObject);
begin
  if dmDatos.tblTipoTrnCnt.State in [dsInsert, dsEdit] then
  begin
    dmDatos.tblTipoTrnCntFECHA_INICIAL.Value:=
    ExtraerFecha(dmDatos.tblTipoTrnCntFECHA_INICIAL.Value);

    dmDatos.tblTipoTrnCntFECHA_FINAL.Value:=
    ExtraerFecha(dmDatos.tblTipoTrnCntFECHA_FINAL.Value);

    dmDatos.tblTipoTrnCnt.Post;
    dmDatos.tblTipoTrnCnt.ApplyUpdates;
    GlbSalvarQuery(dmDatos.tblTipoTrnCnt);
  end;
end;

procedure TfrmTipoTrnConfig.SpeedButton2Click(Sender: TObject);
begin
  if dmDatos.tblTipoTrnCnt.State = dsBrowse then
  begin
    dmDatos.tblTipoTrnCnt.Insert;
    //dmDatos.tblTipoTrnCntSTATUS.Value:='A';
    //dmDatos.tblTipoTrnCntFECHA_APERTURA.Value:=ExtraerFecha(Now);
    //dmDatos.tblTipoTrnCntFECHA_IN.Value:= Now;
    //dmDatos.tblTipoTrnCntINS_POR.Value:= StruserName;
    //dmDatos.tblTipoTrnCntCOD_UDUARIO.Value:= VarUsuarioGlb;
    //RxDBLookupCombo1.SetFocus;
  end;
end;

procedure TfrmTipoTrnConfig.SpeedButton3Click(Sender: TObject);
begin
  if dmDatos.tblTipoTrnCnt.State in [dsinsert, dsEdit] then
  begin
    dmDatos.tblTipoTrnCnt.Cancel;
  end else
  begin
    //dmDatos.tblTipoTrnCnt.Edit;
    //dmDatos.tblTipoTrnCntDetSTATUS.Value:='C';
    SpeedButton1Click(Self);
  end;
end;

procedure TfrmTipoTrnConfig.SpeedButton7Click(Sender: TObject);
begin
  dmDatos.tblTipoTrnCnt.Close;
  dmDatos.tblTipoTrnCnt.Open;
end;

end.
