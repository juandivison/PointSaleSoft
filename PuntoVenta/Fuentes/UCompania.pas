unit UCompania;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBTable, StdCtrls, Mask, DBCtrls, dbnavE,
  Grids, DBGrids, jpeg, ExtCtrls, RxGIF, Buttons, rxToolEdit, RXDBCtrl,
  WinSkinData, RxLookup, RXCtrls;

type
  TfrmCompania = class(TForm)
    tblCompania: TIBTable;
    tblCompaniaCODIGO: TSmallintField;
    tblCompaniaNOMBRE: TIBStringField;
    tblCompaniaCALLEYNUMERO: TIBStringField;
    tblCompaniaTELEFONO: TIBStringField;
    tblCompaniaFAX: TIBStringField;
    tblCompaniaEMAIL: TIBStringField;
    tblCompaniaWEBSITE: TIBStringField;
    tblCompaniaCIUDAD: TIBStringField;
    tblCompaniaPAIS: TIBStringField;
    tblCompaniaRNC_NUMERO: TIBStringField;
    tblCompaniaDIRECTORIO: TIBStringField;
    tblCompaniaFECHAI_ACT: TDateTimeField;
    tblCompaniaFECHAF_ACT: TDateTimeField;
    tblCompaniaCTA1_GYP_PERIODO: TIBStringField;
    tblCompaniaCTA2_GYP_PERIODO: TIBStringField;
    tblCompaniaCTA3_GYP_PERIODO: TIBStringField;
    tblCompaniaCTA1_SUPERAVIT_ACM: TIBStringField;
    tblCompaniaCTA2_SUPERAVIT_ACM: TIBStringField;
    tblCompaniaCTA3_SUPERAVIT_ACM: TIBStringField;
    tblCompaniaCTA1_RESUMEN_GYP: TIBStringField;
    tblCompaniaCTA2_RESUMEN_GYP: TIBStringField;
    tblCompaniaCTA3_RESUMEN_GYP: TIBStringField;
    tblCompaniaOBSERVACION: TIBStringField;
    tblCompaniaSTATUS: TIBStringField;
    tblCompaniaNUM_PATENTE: TIBStringField;
    tblCompaniaCTA1_ULT_RETENIDA: TIBStringField;
    tblCompaniaCTA2_ULT_RETENIDA: TIBStringField;
    tblCompaniaCTA3_ULT_RETENIDA: TIBStringField;
    tblCompaniaCTA1_GYP_MES: TIBStringField;
    tblCompaniaCTA2_GYP_MES: TIBStringField;
    tblCompaniaCTA3_GYP_MES: TIBStringField;
    tblCompaniaFECHA_IN: TDateTimeField;
    tblCompaniaIN_POR: TIBStringField;
    tblCompaniaFECHA_MOD: TDateTimeField;
    tblCompaniaMOD_POR: TIBStringField;
    DataSource1: TDataSource;
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
    Label7: TLabel;
    Label8: TLabel;
    DBGrid1: TDBGrid;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Image1: TImage;
    DBEdit9: TDBEdit;
    Label9: TLabel;
    Panel3: TPanel;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    Label11: TLabel;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    Label12: TLabel;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    Label13: TLabel;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    Label14: TLabel;
    DBEdit22: TDBEdit;
    DBEdit23: TDBEdit;
    DBEdit24: TDBEdit;
    Label15: TLabel;
    DBEdit25: TDBEdit;
    Label16: TLabel;
    DBEdit26: TDBEdit;
    DBDateEdit1: TDBDateEdit;
    DBDateEdit2: TDBDateEdit;
    SkinData1: TSkinData;
    Label17: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label18: TLabel;
    tblCompaniaOFFICE_ID: TIntegerField;
    BitBtn8: TBitBtn;
    DBText1: TDBText;
    tblCompaniaLOGOCIA: TIBStringField;
    DBEdit7: TDBEdit;
    OpenDialog1: TOpenDialog;
    DBStatusLabel1: TDBStatusLabel;
    DBEdit8: TDBEdit;
    Label19: TLabel;
    tblCompaniaNUM_SUCURSAL: TIBStringField;
    DBEdit27: TDBEdit;
    Label20: TLabel;
    BitBtn7: TBitBtn;
    tblMembrete: TIBDataSet;
    tblMembreteCODIGO_CIA: TIntegerField;
    tblMembreteLINE_NO: TIntegerField;
    tblMembreteLINEA1: TIBStringField;
    tblMembreteLINEA2: TIBStringField;
    tblMembreteLINEA3: TIBStringField;
    tblMembreteLINEA4: TIBStringField;
    tblMembreteLINEA5: TIBStringField;
    tblOficina: TIBTable;
    tblOficinaCODIGO: TIntegerField;
    tblOficinaDESCRIPCION: TIBStringField;
    tblOficinaCODIGO_CIUDDAD: TIntegerField;
    dstbloficina: TDataSource;
    Image2: TImage;
    DBEdit28: TDBEdit;
    tblCompaniaIMAGEN_DESKTOP: TIBStringField;
    dsqryMunicipioseCF: TDataSource;
    dsqryProvinciaseCF: TDataSource;
    Label74: TLabel;
    RxDBLookupCombo13: TRxDBLookupCombo;
    Label73: TLabel;
    RxDBLookupCombo15: TRxDBLookupCombo;
    tblCompaniaID_PROVINCIA: TIntegerField;
    tblCompaniaID_MUNICIPIO: TIntegerField;
    RxDBLookupCombo2: TRxDBLookupCombo;
    Label21: TLabel;
    dstbltiporiesgoarl: TDataSource;
    tbltipo_riesgo_arl: TIBTable;
    tbltipo_riesgo_arlID: TIntegerField;
    tbltipo_riesgo_arlTIPO: TIBStringField;
    tbltipo_riesgo_arlFECHA_INI: TDateTimeField;
    tbltipo_riesgo_arlFECHA_FIN: TDateTimeField;
    tbltipo_riesgo_arlPORCIENTO: TFloatField;
    tblCompaniaTIPO_RIESGO_ARL: TIBStringField;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure DBEdit12Exit(Sender: TObject);
    procedure DBEdit15Exit(Sender: TObject);
    procedure DBEdit18Exit(Sender: TObject);
    procedure DBEdit21Exit(Sender: TObject);
    procedure DBEdit24Exit(Sender: TObject);
    procedure DBEdit10Enter(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure RxDBLookupCombo1Change(Sender: TObject);
    procedure DBEdit7DblClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBEdit7Change(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure DBEdit28Change(Sender: TObject);
    procedure DBEdit28DblClick(Sender: TObject);
    procedure RxDBLookupCombo13Enter(Sender: TObject);
    procedure RxDBLookupCombo13Exit(Sender: TObject);
    procedure RxDBLookupCombo13Change(Sender: TObject);
    procedure RxDBLookupCombo15Enter(Sender: TObject);
  private
    { Private declarations }
    procedure ProcOpenTerritorios;
  public
    { Public declarations }
  end;

var
  frmCompania: TfrmCompania;

implementation

uses UDatModConectar, uglobal, UDatModUsuarios, UViewCtaCatalogo,
  UMembreteCia, UDatmodDatosGenerales;

{$R *.dfm}

procedure TfrmCompania.FormCreate(Sender: TObject);
var
  xGrafico : String;
begin
  tbltipo_riesgo_arl.close;
  tbltipo_riesgo_arl.open;
  dmDatos.qryProvinciaseCF.Close;
  dmDatos.qryProvinciaseCF.Open;
  dmDatos.qryMunicipioseCF.Close;
  dmdatos.qryMunicipioseCF.Params[0].Value:=dmDatos.qryProvinciaseCFCODIGO.Value;
  dmDatos.qryMunicipioseCF.Open;
  tblOficina.Close;
  tblOficina.Open;
  tblcompania.Close;
  tblcompania.Open;
  if tblCompania.Locate('codigo',GlbCodigoCia,[]) then
  if not tblCompaniaLOGOCIA.IsNull and (tblCompaniaLOGOCIA.Value <> '') then
  xGrafico:=FileToUse('Graficos',tblCompaniaLOGOCIA.Value);
  if (xGrafico <> '') then
  Image1.Picture.LoadFromFile(xGrafico);
  RxDBLookupCombo15Enter(Self);
end;

procedure TfrmCompania.BitBtn1Click(Sender: TObject);
begin
  if tblCompania.State = dsBrowse then
  begin
    tblCompania.Insert;
{    tblCompaniaCODIGO.Value := FsqlMaxNumero('Servicio','Codigo');
    if tblCompaniaCODIGO.IsNull Or (tblCompaniaCODIGO.Value = 0) then
    tblCompaniaCODIGO.Value := 0;}    
    tblCompaniaSTATUS.Value := 'A';
    DBEdit2.SetFocus;
  end;
end;

procedure TfrmCompania.BitBtn2Click(Sender: TObject);
begin
  if tblCompania.State = dsBrowse then
  tblCompania.Edit;
end;

procedure TfrmCompania.BitBtn3Click(Sender: TObject);
begin
  if tblCompania.State in [dsEdit, dsInsert] then
  tblCompania.cancel;
end;

procedure TfrmCompania.BitBtn4Click(Sender: TObject);
begin
  if tblCompania.State in [dsEdit, dsInsert] then
  begin
    if tblCompania.State = dsInsert then
    begin
      tblCompaniaCODIGO.Value:=FsqlMaxNumero('Compania','codigo');
      if (tblCompaniaCODIGO.IsNull or (tblCompaniaCODIGO.Value = 0)) then
      tblCompaniaCODIGO.Value:=1;
    end;
    if (tblCompaniaEMAIL.Value = '') Or (tblCompaniaEMAIL.IsNull) then
    begin
      MessageDlg('Favor indicar un email.', mtError, [mbOk],0);
      DBEdit25.SetFocus;
    end else
    begin
      if not emailValido(tblCompaniaEMAIL.Value) then
      showmessage('El E-Mail NO es correcto');
    end;
    tblCompania.Post;
    tblCompania.ApplyUpdates;
    if not tblCompania.Transaction.InTransaction then
    tblCompania.Transaction.StartTransaction;
    try
      tblCompania.Transaction.CommitRetaining;
    except
    tblCompania.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmCompania.BitBtn5Click(Sender: TObject);
begin
  if tblCompania.State in [dsInactive, dsBrowse] then
  begin
    tblCompania.Close;
    tblCompania.Open;
    dmdatos.qryProvinciaseCF.Close;
    dmdatos.qryProvinciaseCF.Open;
    ProcOpenTerritorios;
  end;
end;

procedure TfrmCompania.DBEdit12Exit(Sender: TObject);
begin
  if tblCompania.State in [dsbrowse, dsInactive] then exit;
  if tblCompaniaCTA3_GYP_PERIODO.IsNull then exit;

  if not CtaExiste(tblCompaniaCTA1_GYP_PERIODO.AsString,
  tblCompaniaCTA2_GYP_PERIODO.AsString,
  tblCompaniaCTA3_GYP_PERIODO.AsString, true) then
  DBEdit10.SetFocus else
  label17.Caption := glbNombreCta;
end;

procedure TfrmCompania.DBEdit15Exit(Sender: TObject);
begin
  if tblCompania.State in [dsbrowse, dsInactive] then exit;
  if tblCompaniaCTA3_SUPERAVIT_ACM.IsNull then Exit;

  if not CtaExiste(tblCompaniaCTA1_SUPERAVIT_ACM.AsString,
  tblCompaniaCTA2_SUPERAVIT_ACM.AsString,
  tblCompaniaCTA3_SUPERAVIT_ACM.AsString, true) then
  DBEdit13.SetFocus else
  label17.Caption := glbNombreCta;
end;

procedure TfrmCompania.DBEdit18Exit(Sender: TObject);
begin
  if tblCompania.State in [dsbrowse, dsInactive] then exit;
  if tblCompaniaCTA3_RESUMEN_GYP.IsNull then Exit;

  if not CtaExiste(tblCompaniaCTA1_RESUMEN_GYP.AsString,
  tblCompaniaCTA2_RESUMEN_GYP.AsString,
  tblCompaniaCTA3_RESUMEN_GYP.AsString, true) then
  DBEdit18.SetFocus else
  label17.Caption := glbNombreCta;
end;

procedure TfrmCompania.DBEdit21Exit(Sender: TObject);
begin
  if tblCompania.State in [dsbrowse, dsInactive] then exit;
  if tblCompaniaCTA3_ULT_RETENIDA.IsNull then Exit;

  if not CtaExiste(tblCompaniaCTA1_ULT_RETENIDA.AsString,
  tblCompaniaCTA2_ULT_RETENIDA.AsString,
  tblCompaniaCTA3_ULT_RETENIDA.AsString, true) then
  DBEdit21.SetFocus else
  label17.Caption := glbNombreCta;
end;

procedure TfrmCompania.DBEdit24Exit(Sender: TObject);
begin
  if tblCompania.State in [dsbrowse, dsInactive] then exit;
  if tblCompaniaCTA3_GYP_MES.IsNull then Exit;

  if not CtaExiste(tblCompaniaCTA1_GYP_MES.AsString,
  tblCompaniaCTA2_GYP_MES.AsString,
  tblCompaniaCTA3_GYP_MES.AsString, true) then
  DBEdit24.SetFocus else
  label17.Caption := glbNombreCta;
end;

procedure TfrmCompania.DBEdit10Enter(Sender: TObject);
begin
  label17.Caption:='';
end;

procedure TfrmCompania.BitBtn8Click(Sender: TObject);
begin
  frmViewCtaCatalogo:=TfrmViewCtaCatalogo.Create(Nil);
  try
    if frmViewCtaCatalogo.Showmodal = mrOk then
    begin
      {if dmTransCnt.tblTransCntDet.state In [dsEdit, dsInsert] then
      begin
        if not frmViewCtaCatalogo.qryViewCtaCtalogoCUENTA1.IsNull then
        begin
          if (frmViewCtaCatalogo.qryViewCtaCtalogoTIPO_CTA.Value = 'C') then
          begin
            MessageDlg('Control Account can not be use, check.', mtError, [mbok],0);
            dbeditcta1.SetFocus;
          end else
          begin
            dmTransCnt.tblTransCntDetCUENTA1.Value:= frmViewCtaCatalogo.qryViewCtaCtalogoCUENTA1.Value;
            dmTransCnt.tblTransCntDetCUENTA2.Value:= frmViewCtaCatalogo.qryViewCtaCtalogoCUENTA2.Value;
            dmTransCnt.tblTransCntDetCUENTA3.Value:= frmViewCtaCatalogo.qryViewCtaCtalogoCUENTA3.Value;
          end;
        end;
      end; }
    end;
  finally
  frmViewCtaCatalogo.Free;
  frmViewCtaCatalogo:=Nil;
  end;
end;

procedure TfrmCompania.RxDBLookupCombo1Change(Sender: TObject);
begin
  GlbCodOficina:= tblCompaniaOFFICE_ID.Value;
end;

procedure TfrmCompania.DBEdit7DblClick(Sender: TObject);
begin
  OpenDialog1.Filter := ExtractFilePath(Application.ExeName);
  if OpenDialog1.Execute then
  begin
    if tblCompania.State = dsBrowse then
    tblCompania.Edit;
    tblCompaniaLOGOCIA.Value := OpenDialog1.FileName;
  end;
end;

procedure TfrmCompania.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if tblCompania.State In [dsInsert, dsEdit] then
  begin
    MessageDlg('Hay una transaccion pendiente, verifique', mtError, [mbOk],0);
    CanClose:=False;
  end else CanClose:=true;
end;

procedure TfrmCompania.DBEdit7Change(Sender: TObject);
begin
  if (Length(tblCompaniaLOGOCIA.Value) > 0) then
  IF FILEEXISTS(tblCompaniaLOGOCIA.Value) THEN
  Image1.Picture.LoadFromFile(tblCompaniaLOGOCIA.Value);
end;

procedure TfrmCompania.BitBtn7Click(Sender: TObject);
begin
  frmMembrete:=TfrmMembrete.Create(Nil);
  try
    frmCompania.tblMembrete.Close;
    frmCompania.tblMembrete.Params[0].Value:= tblCompaniaCODIGO.Value;
    frmCompania.tblMembrete.Open;
    frmMembrete.Showmodal;
  finally
  frmMembrete.Free;
  frmMembrete:=Nil;
  end;
end;

procedure TfrmCompania.DBEdit28Change(Sender: TObject);
begin
  if (Length(tblCompaniaIMAGEN_DESKTOP.Value) > 0) then
  IF FILEEXISTS(tblCompaniaIMAGEN_DESKTOP.Value) THEN
  Image2.Picture.LoadFromFile(tblCompaniaIMAGEN_DESKTOP.Value);
end;

procedure TfrmCompania.DBEdit28DblClick(Sender: TObject);
begin
  OpenDialog1.Filter := ExtractFilePath(Application.ExeName);
  if OpenDialog1.Execute then
  begin
    if tblCompania.State = dsBrowse then
    tblCompania.Edit;
    tblCompaniaIMAGEN_DESKTOP.Value := OpenDialog1.FileName;
  end;
end;

procedure TfrmCompania.RxDBLookupCombo13Enter(Sender: TObject);
begin
  ProcOpenTerritorios;
end;

procedure TfrmCompania.RxDBLookupCombo13Exit(Sender: TObject);
begin
  ProcOpenTerritorios;
end;

procedure TfrmCompania.ProcOpenTerritorios;
begin
  dmDatos.qryMunicipioseCF.Close;
  dmDatos.qryMunicipioseCF.Params[0].Value:=tblCompaniaID_PROVINCIA.Value;
  dmDatos.qryMunicipioseCF.Params[1].Value:=tblCompaniaID_PROVINCIA.Value;
  dmDatos.qryMunicipioseCF.Open;
end;

procedure TfrmCompania.RxDBLookupCombo13Change(Sender: TObject);
begin
  ProcOpenTerritorios;
end;

procedure TfrmCompania.RxDBLookupCombo15Enter(Sender: TObject);
begin
  dmDatos.qryMunicipioseCF.Close;
  dmDatos.qryMunicipioseCF.Params[0].Value:=tblCompaniaID_PROVINCIA.Value;
  dmDatos.qryMunicipioseCF.Params[1].Value:=tblCompaniaID_PROVINCIA.Value;
  dmDatos.qryMunicipioseCF.Open;
end;

end.
