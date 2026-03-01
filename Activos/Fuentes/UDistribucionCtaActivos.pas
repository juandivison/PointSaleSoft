unit UDistribucionCtaActivos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, DBCtrls, Mask, Grids, DBGrids, Db, IBCustomDataSet,
  variants, RXCtrls, RXDBCtrl, ComCtrls, EditNew, DBTables, WinSkinData;

type
  TfrmCtasActivos = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn5: TBitBtn;
    qryCtasCatx: TQuery;
    qryCtasCatxCUENTA1: TStringField;
    qryCtasCatxCUENTA2: TStringField;
    qryCtasCatxCUENTA3: TStringField;
    qryCtasCatxNOMBRE_CTA: TStringField;
    dtqryCtasCat: TDataSource;
    DBStatusLabel1: TDBStatusLabel;
    qryActivosz: TQuery;
    dtqryActivos: TDataSource;
    qryActivoszTIPO: TIntegerField;
    qryActivoszCODIGO: TIntegerField;
    qryActivoszDESCRIPCION: TStringField;
    PageControl1: TPageControl;
    tabActivos: TTabSheet;
    DBGrid3: TDBGrid;
    tabCuentas: TTabSheet;
    ScrollBox1: TScrollBox;
    DBNavigator1: TDBNavigator;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Splitter1: TSplitter;
    DBGrid1: TDBGrid;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    Button1: TButton;
    DBGrid2: TDBGrid;
    qryCtasCatxSIGNO_CTA: TSmallintField;
    BitBtn7: TBitBtn;
    DBGrid4: TDBGrid;
    Panel2: TPanel;
    DBNavigator2: TDBNavigator;
    edtCodGrupo: TEditN;
    Label5: TLabel;
    btnProcesar: TBitBtn;
    edtconcepto: TEditN;
    Label6: TLabel;
    ProgressBar1: TProgressBar;
    Label7: TLabel;
    qryActivos: TIBDataSet;
    qryCtasCat: TIBDataSet;
    qryActivosTIPO: TIntegerField;
    qryActivosCODIGO: TIntegerField;
    qryActivosDESCRIPCION: TIBStringField;
    qryCtasCatCUENTA1: TIBStringField;
    qryCtasCatCUENTA2: TIBStringField;
    qryCtasCatCUENTA3: TIBStringField;
    qryCtasCatNOMBRE_CTA: TIBStringField;
    qryCtasCatSIGNO_CTA: TSmallintField;
    SkinData1: TSkinData;
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn7Click(Sender: TObject);
    procedure DBEdit1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnProcesarClick(Sender: TObject);
    procedure edtconceptoExit(Sender: TObject);
    procedure DBEdit2Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCtasActivos: TfrmCtasActivos;

implementation

uses UDatModuloActivos, UGrupoCtaActivos, UDatModConectar;

{$R *.DFM}

procedure TfrmCtasActivos.Button1Click(Sender: TObject);
begin
  DBGrid1.Visible := True;
  DBGrid1.BringToFront;
  qryCtasCat.close;
  qryCtasCat.filtered:=false;
  qryCtasCat.open;
end;

procedure TfrmCtasActivos.DBGrid1DblClick(Sender: TObject);
begin
  if dm.tActivoCuenta.State in [dsInsert] then
  begin
{    dm.tActivoCuentacta1.Value:= qryctascatcuenta1.Value;
    dm.tActivoCuentacta2.Value:= qryctascatcuenta2.Value;
    dm.tActivoCuentacta3.Value:= qryctascatcuenta3.Value;
    dm.tActivoCuentacta1.Value:= qryctascatcuenta1.Value;
    dm.tActivoCuentaCTA_ORIGEN.Value:=qryCtasCatSIGNO_CTA.Value;}
  end;
  DBGrid1.Visible := False;
  DBGrid1.SendToBack;
end;

procedure TfrmCtasActivos.FormCreate(Sender: TObject);
begin
  qryActivos.Close;
  qryActivos.Open;
  dm.qryClase_Cuenta_Adm.close;
  dm.qryClase_Cuenta_Adm.Open;
  dm.tClase_Cuenta_Adm.Close;
  dm.tClase_Cuenta_Adm.filtered:=False;
  //dm.tClase_Cuenta_Adm.Filter:='nombre = '+chr(39)+'D*'+chr(39);
  dm.tClase_Cuenta_Adm.filtered:=True;
  dm.tSubTipoCta.Close;
  dm.tActivoCuentaGrupo.Close;
  dm.tActivoCuentaGrupo.Filtered:=False;
  dm.tActivoCuentaGrupo.Open;
  dm.tClase_Cuenta_Adm.Open;
  dm.tSubTipoCta.Open;
  dm.tClasif_cuentas.Close;
  dm.tClasif_cuentas.Open;
  dm.tActivoCuenta.Close;
  dm.tActivoCuenta.Filtered:=False;
  dm.tActivoCuenta.Open;
end;

procedure TfrmCtasActivos.BitBtn6Click(Sender: TObject);
begin
  dm.tActivoCuenta.Close;
  dm.tActivoCuenta.Filtered:=False;
  dm.tActivoCuenta.Open;
end;

procedure TfrmCtasActivos.BitBtn1Click(Sender: TObject);
begin
  if dm.tActivoCuenta.State in [dsBrowse] then
  begin
    dm.tActivoCuenta.Insert;
    DBEdit1.SetFocus;
    DBEdit1.SelectAll;
  end;
end;

procedure TfrmCtasActivos.BitBtn2Click(Sender: TObject);
begin
  if dm.tActivoCuenta.State in [dsBrowse] then
  begin
    dm.tActivoCuenta.Edit;
  end;
end;

procedure TfrmCtasActivos.BitBtn3Click(Sender: TObject);
begin
  if dm.tActivoCuenta.State In [dsInsert,dsEdit] then
  begin
    dm.tActivoCuenta.Post;
    if not dm.tActivoCuentaGrupo.Transaction.InTransaction then
    dm.tActivoCuentaGrupo.Transaction.StartTransaction;
    try
      dm.tActivoCuentaGrupo.Transaction.CommitRetaining;
    except
    dm.tActivoCuentaGrupo.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmCtasActivos.BitBtn4Click(Sender: TObject);
begin
  if dm.tActivoCuenta.State In [dsInsert,dsEdit] then
  dm.tActivoCuenta.Cancel;
end;

procedure TfrmCtasActivos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dm.tClase_Cuenta_Adm.Close;
  dm.tClase_Cuenta_Adm.Filtered:=False;
end;

procedure TfrmCtasActivos.BitBtn7Click(Sender: TObject);
begin
  frmGrupocuentaActivo:=TfrmGrupocuentaActivo.Create(nil);
  try
    frmGrupocuentaActivo.showmodal;
  finally
  frmGrupocuentaActivo.free;
  frmGrupocuentaActivo:=nil;
  end;
end;

procedure TfrmCtasActivos.DBEdit1Change(Sender: TObject);
begin
  if dm.tActivoCuentaGrupo.State = dsBrowse then
  begin
    if (dm.tActivoCuentaCODGRUPOCTA.Value > 0) or
       (not dm.tActivoCuentaCODGRUPOCTA.IsNull ) then
    begin
      dm.tActivoCuentaGrupo.Filtered:= False;
      //dm.tActivoCuentaGrupo.Filter  := 'Codigogrupo = ' + dm.tActivoCuentaCODGRUPOCTA.AsString;
      dm.tActivoCuentaGrupo.Filtered:= True;
    end;
  end;
end;

procedure TfrmCtasActivos.FormShow(Sender: TObject);
begin
  if dm.tActivoCuentaCODGRUPOCTA.IsNull then Exit;
  if dm.tActivoCuentaGrupo.State = dsBrowse then
  begin
    dm.tActivoCuentaGrupo.Filtered:=False;
    //dm.tActivoCuentaGrupo.Filter:='Codigogrupo = '+ dm.tActivoCuentaCODGRUPOCTA.AsString;
    dm.tActivoCuentaGrupo.Filtered:=True;
  end;
end;

procedure TfrmCtasActivos.btnProcesarClick(Sender: TObject);
var
  i, j: integer;
  s,t: string;
begin
  ProgressBar1.Max :=DBGrid3.SelectedRows.Count;
  ProgressBar1.Position := 0;
  ProgressBar1.Visible:=true;
  if DBGrid3.SelectedRows.Count>0 then
   With DBGrid3.DataSource.DataSet do
    for i:=0 to DBGrid3.SelectedRows.Count-1 do
      begin
        GotoBookmark(pointer(DBGrid3.SelectedRows.Items[i]));
        With DBGrid3.DataSource.DataSet do
        for j := 0 to FieldCount-1 do
        begin
          if not dm.tactivocuenta.Locate('tipo;codigo',
          VarArrayOf([Fields.FieldByName('tipo').Value,
                      Fields.FieldByName('codigo').Value ]),[]) then
          begin
            dm.tActivoCuenta.Insert;
            dm.tActivoCuentaTIPO.Value  :=Fields.FieldByName('Tipo').Value;
            dm.tActivoCuentaCODIGO.Value:= Fields.FieldByName('codigo').Value;
            dm.tActivoCuentaCODIGO_CONCEPTO.Value:= edtconcepto.ValueInteger;
            dm.tActivoCuentaCODGRUPOCTA.Value    := edtCodGrupo.ValueInteger;
            dm.tActivoCuenta.Post;
            ProgressBar1.StepIt;
          end;
        end;
      end;
    if not dm.tActivoCuenta.Transaction.InTransaction then
    dm.tActivoCuenta.Transaction.StartTransaction;
    try
      dm.tActivoCuenta.Transaction.CommitRetaining;
    except
    dm.tActivoCuenta.Transaction.RollbackRetaining;
    end;
    ProgressBar1.Position:=0;
    ProgressBar1.Visible:=false;
end;

procedure TfrmCtasActivos.edtconceptoExit(Sender: TObject);
begin
  if (edtconcepto.ValueInteger > 0)  and
     (edtCodGrupo.ValueInteger > 0) then
  btnProcesar.Enabled := True Else
  btnProcesar.Enabled := False;
end;

procedure TfrmCtasActivos.DBEdit2Change(Sender: TObject);
begin
  if qryActivos.state = dsInactive then exit;
  if qryActivos.Locate('TIPO;codigo',
  VarArrayOf([dm.tActivoCuentatipo.Value,
              dm.tActivoCuentacodigo.Value]),[]) then
  begin
    Label7.Caption:= qryActivosDESCRIPCION.Value;
  end else Label7.Caption:='???????';
end;

end.
