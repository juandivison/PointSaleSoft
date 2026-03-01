unit UMaestroActivos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ComCtrls, Grids, DBGrids, RXDBCtrl, Mask,
  db,DBCtrls, ToolEdit, RXCtrls, WinSkinData;

type
  TfrmMaestroActivos = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    PageControl1: TPageControl;
    tabRecord: TTabSheet;
    tabExaminar: TTabSheet;
    jrdi: TScrollBox;
    RxDBGrid1: TRxDBGrid;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    Label14: TLabel;
    DBEdit14: TDBEdit;
    Label15: TLabel;
    DBEdit15: TDBEdit;
    Label16: TLabel;
    DBEdit16: TDBEdit;
    Label17: TLabel;
    DBEdit17: TDBEdit;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    DBEdit20: TDBEdit;
    Label21: TLabel;
    DBEdit21: TDBEdit;
    DBDateEdit1: TDBDateEdit;
    DBDateEdit2: TDBDateEdit;
    DBDateEdit3: TDBDateEdit;
    btnStatus: TBitBtn;
    DBNavigator1: TDBNavigator;
    BitBtn6: TBitBtn;
    SpeedButton1: TSpeedButton;
    BitBtn7: TBitBtn;
    btndistCuentacnt: TBitBtn;
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit8: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    DBStatusLabel1: TDBStatusLabel;
    SkinData1: TSkinData;
    BitBtn25: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure DBEdit21Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure btndistCuentacntClick(Sender: TObject);
    procedure DBEdit11Exit(Sender: TObject);
    procedure DBEdit11Change(Sender: TObject);
    procedure DBEdit12Exit(Sender: TObject);
    procedure BitBtn25Click(Sender: TObject);
  private
    { Private declarations }
     procedure CalculaDepreAnual;
     procedure CalculaDepreMensual; 
  public
    { Public declarations }
  end;

var
  frmMaestroActivos: TfrmMaestroActivos;

implementation

uses UDatModuloActivos, UCargarActivos,UGlobalActivos, UHistoricoActivos,
  UDistribucionCtaActivos;

{$R *.DFM}

procedure TfrmMaestroActivos.BitBtn1Click(Sender: TObject);
begin
  if dm.qryMaestroActivos.State = dsbrowse then
  begin
    dm.qryMaestroActivos.Insert;
    btndistCuentacnt.enabled:=false;
    //dm.qrymaestroactivosstatus_activo.Value:='A';
    DBLookupComboBox1.SetFocus;
  end;
end;

procedure TfrmMaestroActivos.BitBtn2Click(Sender: TObject);
begin
  if dm.qryMaestroActivos.State = dsbrowse then
  begin
    dm.qryMaestroActivos.Edit;
    btndistCuentacnt.enabled:=false;    
  end;
end;

procedure TfrmMaestroActivos.BitBtn3Click(Sender: TObject);
begin
  if dm.qryMaestroActivos.State in [dsInsert,dsEdit] then
  begin
    dm.qryMaestroActivos.Post;
    dm.qryMaestroActivos.ApplyUpdates;
    btndistCuentacnt.enabled:=true;
    if not dm.qryMaestroActivos.Transaction.InTransaction then
    dm.qryMaestroActivos.Transaction.StartTransaction;
    try
      dm.qryMaestroActivos.Transaction.CommitRetaining;
    except
    dm.qryMaestroActivos.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmMaestroActivos.BitBtn4Click(Sender: TObject);
begin
  if dm.qryMaestroActivos.State in [dsInsert,dsEdit] then
  begin
    dm.qryMaestroActivos.Cancel;
    btndistCuentacnt.enabled:=true;    
  end;
end;

procedure TfrmMaestroActivos.DBEdit21Change(Sender: TObject);
begin
  {if dm.qryMaestroActivosSTATUS_ACTIVO.Value = 'A' then
  btnStatus.Glyph.LoadFromFile('led2on.bmp') else
  btnStatus.Glyph.LoadFromFile('led2Off.bmp');}
end;

procedure TfrmMaestroActivos.FormCreate(Sender: TObject);
begin
  dm.qryMaestroActivos.close;
  dm.qryMaestroActivos.filtered:=false;
  dm.qryMaestroActivos.open;
  DBEdit21Change(Self);
end;

procedure TfrmMaestroActivos.BitBtn6Click(Sender: TObject);
begin
  if dm.qryMaestroActivos.state in [dsBrowse,dsInactive] then
  begin
    dm.qryMaestroActivos.close;
    dm.qryMaestroActivos.filtered:=false;
    dm.qryMaestroActivos.open;
    btndistCuentacnt.enabled:=True;    
  end;
end;

procedure TfrmMaestroActivos.SpeedButton1Click(Sender: TObject);
begin
  frmCargarActivos:=tfrmCargarActivos.Create(nil);
  try
    frmCargarActivos.ShowModal;
  finally
  frmCargarActivos.Free;
  frmCargarActivos:=nil;
  end;
end;

procedure TfrmMaestroActivos.BitBtn7Click(Sender: TObject);
var
  a1,m1,d1 : Word;
begin
  DecodeDate(date,a1,m1,d1); 
  dm.qryHistoricoActivos.Close;
  dm.qryHistoricoActivos.Filtered:= False;
  dm.qryHistoricoActivos.Params[0].Value := EncodeDate(a1,1,31);
  dm.qryHistoricoActivos.Params[1].Value := EncodeDate(a1,12,31);
  //dm.qryHistoricoActivos.Filter:='tipo = '+dm.qryMaestroActivosTIPO.AsString +
  //' and codigo = '+dm.qryMaestroActivosCODIGO.Asstring;
  dm.qryHistoricoActivos.Filtered:= True;
  dm.qryHistoricoActivos.open;
  frmHistoricoActivo:=TfrmHistoricoActivo.Create(nil);
  try
    frmHistoricoActivo.Showmodal;
  finally
  frmHistoricoActivo.free;
  frmHistoricoActivo:=nil;
  end;
end;

procedure TfrmMaestroActivos.btndistCuentacntClick(Sender: TObject);
begin
  frmCtasActivos:=TfrmCtasActivos.Create(nil);
  try
    frmCtasActivos.ShowModal;
  finally
  frmCtasActivos.Free;
  frmCtasActivos:= Nil;
  end;
end;

procedure TfrmMaestroActivos.DBEdit11Exit(Sender: TObject);
begin
  if dm.qryMaestroActivos.State = dsInsert then
  begin
    dm.qryMaestroActivosVALOR_ORIGINAL.Value:= dm.qryMaestroActivosVALOR_COMPRA.Value +
    dm.qryMaestroActivosVALOR_REMODELA.Value;
    dm.qryMaestroActivosBALANCE_DEPRE.Value := dm.qryMaestroActivosVALOR_ORIGINAL.Value; 
  end;
end;

procedure TfrmMaestroActivos.DBEdit11Change(Sender: TObject);
begin
  if dm.qryMaestroActivos.State = dsEdit then
  dm.qryMaestroActivosVALOR_EN_LIBRO.Value:=
  dm.qryMaestroActivosVALOR_EN_LIBRO.Value +
  dm.qryMaestroActivosVALOR_REMODELA.Value;
end;

procedure TfrmMaestroActivos.CalculaDepreAnual;
var
  Porc_cal, adiccion : Real;
begin
  Porc_cal := dm.qryMaestroActivosPORC_ADICCION.Value / 100;
  Adiccion := dm.qryMaestroActivosVALOR_ORIGINAL.Value * Porc_cal;
  Porc_cal := dm.qryMaestroActivosPORC_DEPRE.Value / 100;
  dm.qryMaestroActivosDEPRE_ANUAL.Value:= Adiccion * Porc_cal;
end;

procedure TfrmMaestroActivos.CalculaDepreMensual;
var
  a,m, d : Word;
  AnoCompra,mesCompra, diaCompra : Word;
  Mes_Cal : integer;
begin
  DecodeDate(date,a,m,d);
  DecodeDate(dm.qryMaestroActivosFECHA_COMPRA.AsDateTime,AnoCompra,mesCompra, diaCompra);
  if AnoCompra = a then
  mes_cal := (12 - mescompra) + 1
  else Mes_cal := 12;
  dm.qryMaestroActivosDEPRE_MENSUAL.Value := dm.qryMaestroActivosDEPRE_ANUAL.Value / Mes_Cal;
  if AnoCompra = a then
  dm.qryMaestroActivosVALOR_DEPRECIABLE.Value:=
  dm.qryMaestroActivosVALOR_ORIGINAL.Value;
end;

procedure TfrmMaestroActivos.DBEdit12Exit(Sender: TObject);
begin
  if dm.qryMaestroActivos.State = dsInsert then
  begin
    dm.qryMaestroActivosVALOR_EN_LIBRO.Value:=
    dm.qryMaestroActivosVALOR_ORIGINAL.Value;
    CalculaDepreAnual;
    CalculaDepreMensual;
  end;
end;

procedure TfrmMaestroActivos.BitBtn25Click(Sender: TObject);
begin
  if (Not DirectoryExists('Informes')) then
  CreateDir('Informes');
  dm.qryMaestroActivos.Close;
  dm.qryMaestroActivos.Open;
  dm.qryMaestroActivos.First;
  ExporToExcel(dm.qryMaestroActivos, ExtractFilePath(Application.ExeName)+
  'Informes\MaestroActivos_'+
  FormatDateTime('ddmmyyyy',now)+'_'
  +FormatDateTime('hhmmss',now));
end;

end.
