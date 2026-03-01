unit UFormInspecciones;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, StdCtrls, DBCtrls, Mask, RxLookup,
  RxToolEdit, RxDBCtrl, Grids, DBGrids, ExtCtrls, RxCtrls, RxDBComb,
  ShellApi, Buttons, WinSkinData, ComCtrls, IBQuery;

type
  TfrmInspecciones = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    RxLabel1: TRxLabel;
    Shape1: TShape;
    RxLabel2: TRxLabel;
    Shape2: TShape;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBMemo1: TDBMemo;
    DBEdit12: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    RxDBLookupCombo5: TRxDBLookupCombo;
    DBDateEdit1: TDBDateEdit;
    RxDBLookupCombo3: TRxDBLookupCombo;
    RxDBComboBox1: TRxDBComboBox;
    RxDBGrid1: TRxDBGrid;
    tblInspecciones: TIBDataSet;
    tblInspeccionesCODIGO: TIntegerField;
    tblInspeccionesCIA_KEY: TIntegerField;
    tblInspeccionesFECHA: TDateTimeField;
    tblInspeccionesNOMBRE: TIBStringField;
    tblInspeccionesAPELLIDO: TIBStringField;
    tblInspeccionesDIRECCION_CONT: TIBStringField;
    tblInspeccionesCIUDAD: TIBStringField;
    tblInspeccionesESTADO: TIBStringField;
    tblInspeccionesPAIS: TIBStringField;
    tblInspeccionesTELEF_CONTACTO: TIBStringField;
    tblInspeccionesMOVIL1: TIBStringField;
    tblInspeccionesEMAIL: TIBStringField;
    tblInspeccionesCOMENTARIO: TMemoField;
    tblInspeccionesCOD_VENDEDOR: TIntegerField;
    tblInspeccionesKILOMETRAJE: TIntegerField;
    tblInspeccionesTIPO_AFILIADO: TSmallintField;
    tblInspeccionesMARCA: TIBStringField;
    tblInspeccionesMODELO: TIBStringField;
    tblInspeccionesANO_VEH: TIntegerField;
    tblInspeccionesCHASSIS: TIBStringField;
    tblInspeccionesCOLOR: TIBStringField;
    tblInspeccionesTIPO_SEGURO: TSmallintField;
    tblInspeccionesINSERTADO_POR: TIBStringField;
    tblInspeccionesFECHA_INSERTADO: TDateTimeField;
    tblInspeccionesFECHA_MOD: TDateTimeField;
    tblInspeccionesUPD_POR: TIBStringField;
    tblInspeccionesSYNC_STATUS: TSmallintField;
    DataSource1: TDataSource;
    Panel1: TPanel;
    RxSpeedButton1: TRxSpeedButton;
    btnInsertar: TBitBtn;
    btnModificar: TBitBtn;
    btnSalvar: TBitBtn;
    btnCancelar: TBitBtn;
    btnCerarAbrirres: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn7: TBitBtn;
    SkinData1: TSkinData;
    tblInspeccionesESTADO_INSPECCION: TSmallintField;
    Label21: TLabel;
    tblInspeccionesDet: TIBDataSet;
    tblInspeccionesDetID: TIntegerField;
    tblInspeccionesDetCODIGO: TIntegerField;
    tblInspeccionesDetTIPO_DOC: TSmallintField;
    tblInspeccionesDetRUTA_FOTO: TIBStringField;
    Label22: TLabel;
    DataSource2: TDataSource;
    Label23: TLabel;
    DBEdit13: TDBEdit;
    RxDBGrid2: TRxDBGrid;
    RxDBComboBox2: TRxDBComboBox;
    SpeedButton1: TSpeedButton;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    RxDBComboBox3: TRxDBComboBox;
    OpenDialog1: TOpenDialog;
    BitBtn8: TBitBtn;
    DBEdit1: TDBEdit;
    DBText1: TDBText;
    BitBtn12: TBitBtn;
    DBRadioGroup4: TDBRadioGroup;
    tblInspeccionesCONCARENCIA: TSmallintField;
    procedure FormCreate(Sender: TObject);
    procedure btnInsertarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure tblInspeccionesAfterScroll(DataSet: TDataSet);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure RxSpeedButton1Click(Sender: TObject);
    procedure btnModificarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnCerarAbrirresClick(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInspecciones: TfrmInspecciones;

implementation

uses UDatModConectar, Uglobal, UDatModUsuarios,UDatModCobertura,
  URepAfiliaciones, UFormbuscarAfiliacion;

{$R *.dfm}

procedure TfrmInspecciones.FormCreate(Sender: TObject);
begin
  dmUsuarios.qryEmpleados.close;
  dmUsuarios.qryEmpleados.open;
  dmCobertura.tblTipoAfiliadoLookup.Close;
  dmCobertura.tblTipoAfiliadoLookup.Open;
  
  tblInspecciones.Close;
  tblInspecciones.Params[0].Value:= ExtraerFecha(GlbFechaTrnDiaria);
  tblInspecciones.Params[1].Value:= ExtraerFecha(GlbFechaTrnDiaria);
  tblInspecciones.Open;
end;

procedure TfrmInspecciones.btnInsertarClick(Sender: TObject);
begin
  if tblInspecciones.State = dsBrowse then
  begin
    tblInspecciones.Append;
    tblInspeccionesFECHA_INSERTADO.Value:= Now;
    tblInspeccionesINSERTADO_POR.Value  := Trim(StrUserName);
    tblInspeccionesSYNC_STATUS.Value:=0;
    tblInspeccionesCIA_KEY.Value:= glbCia_Key;
    tblInspeccionesFECHA.Value:=ExtraerFecha(GlbFechaTrnDiaria);
    tblInspeccionesPAIS.Value:='Republica Dominicana';
    //1	Garantía Mecánica SAM
    //2	SAM For Quattro Motorsports
    //3	Garantía Móvil SAM
    tblInspeccionesTIPO_AFILIADO.Value:=1;
    tblInspeccionesESTADO_INSPECCION.Value:=1;
  end;
end;

procedure TfrmInspecciones.BitBtn1Click(Sender: TObject);
begin
  if tblInspeccionesDet.State in [dsBrowse] then
  begin
    tblInspeccionesDet.Append;
    tblInspeccionesDetTIPO_DOC.Value:=1;
    tblInspeccionesDetCODIGO.Value:=tblInspeccionesCODIGO.Value;
  end;
end;

procedure TfrmInspecciones.BitBtn3Click(Sender: TObject);
begin
  if tblInspeccionesDet.State in [dsBrowse] then
  begin
    tblInspeccionesDet.Edit;
  end;
end;

procedure TfrmInspecciones.BitBtn4Click(Sender: TObject);
begin
  if tblInspeccionesDet.State in [dsEdit, dsInsert] then
  begin
    if tblInspeccionesDetTIPO_DOC.IsNull then
    begin
      MessageDlg('Debe indicar el tipo de documento.', mtInformation,[mbyes, mbno],0);
      Exit;
    end;

    if tblInspeccionesDetCODIGO.IsNull then
    tblInspeccionesDetCODIGO.Value:=tblInspeccionesCODIGO.Value;
    GlbSalvarQuery(tblInspeccionesDet);
  end;
end;

procedure TfrmInspecciones.BitBtn5Click(Sender: TObject);
begin
  if tblInspeccionesDet.State in [dsBrowse] then
  begin
    if MessageDlg('¿Desea eliminar record?',mtInformation,[mbyes,mbno],0)=mryes then
    tblInspeccionesDet.Delete;
  end else
  if tblInspeccionesDet.State in [dsInsert, dsEdit] then
  begin
    tblInspeccionesDet.cancel;
  end;
end;

procedure TfrmInspecciones.SpeedButton1Click(Sender: TObject);
begin
  OpenDialog1.InitialDir:= GlbRutaMisDocumentos;
  if OpenDialog1.Execute then
  begin
    if tblInspeccionesDet.State in [dsBrowse] then
    tblInspeccionesDet.Edit;
    tblInspeccionesDetRUTA_FOTO.Value:= ExtractFileName(OpenDialog1.FileName);

    if not DirectoryExists(GlbReposDocs+'Inspecciones') then
    if not ForceDirectories(GlbReposDocs+'Inspecciones') then
    begin
      LogInformacionTxt('Log Inspecciones. '+strUserName+ '. Usuario : '+
      VarNombreUsuario+ '. Fecha :'+DateTimeToStr(now)+'. Error creando directorio: '+
      GlbReposDocs+'Inspecciones');
    end;

    tblInspeccionesDetRUTA_FOTO.Value:= GlbReposDocs+'Inspecciones\Insp_'+
    tblInspeccionesDetCODIGO.AsString+'_'+tblInspeccionesDetRUTA_FOTO.Value;

    if Not CopyFile(PAnsiChar(OpenDialog1.FileName), PAnsiChar(tblInspeccionesDetRUTA_FOTO.Value),True) then
    begin
      if MessageDlg('Archivo no puede ser copiado, re-intentarlo?', mtInformation,[mbyes, mbno],0) = mrYes then
      if not CopyFile(PAnsiChar(OpenDialog1.FileName),PAnsiChar(tblInspeccionesDetRUTA_FOTO.Value),false) then
      MessageDlg('Archivo no puede ser copiado, verifique', mtInformation,[mbyes, mbno],0);
    end;
  end;
  BitBtn4Click(Self);
end;

procedure TfrmInspecciones.tblInspeccionesAfterScroll(DataSet: TDataSet);
begin
  tblInspeccionesDet.Close;
  tblInspeccionesDet.Params[0].Value:= tblInspeccionesCODIGO.Value;
  tblInspeccionesDet.open;
end;

procedure TfrmInspecciones.BitBtn6Click(Sender: TObject);
begin
  if tblInspeccionesDet.State in [dsBrowse] then
  begin
    tblInspeccionesDet.close;
    tblInspeccionesDet.Open;
  end;
end;

procedure TfrmInspecciones.BitBtn8Click(Sender: TObject);
begin
  if not tblInspeccionesDetRUTA_FOTO.IsNull then
  begin
    if FileExists(tblInspeccionesDetRUTA_FOTO.Value) then
    ShellExecute(0, 'Open', PChar(tblInspeccionesDetRUTA_FOTO.Value), PChar(''), PChar(''), SW_SHOWNORMAL);
  end;
end;

procedure TfrmInspecciones.RxSpeedButton1Click(Sender: TObject);
begin
  frmRepInspecciones:=TfrmRepInspecciones.Create(Nil);
  try
    frmRepInspecciones.ShowModal;
  finally
  frmRepInspecciones.free;
  frmRepInspecciones:=Nil;
  end;
end;

procedure TfrmInspecciones.btnModificarClick(Sender: TObject);
begin
  if tblInspecciones.State in [dsBrowse] then
  begin
    tblInspecciones.Edit;
  end;
end;

procedure TfrmInspecciones.btnSalvarClick(Sender: TObject);
begin
  if tblInspecciones.State in [dsEdit, dsInsert] then
  begin
    GlbSalvarQuery(tblInspecciones);
  end;
end;

procedure TfrmInspecciones.btnCancelarClick(Sender: TObject);
begin
  if tblInspecciones.State in [dsEdit, dsInsert] then
  begin
    tblInspecciones.Cancel;
  end;
end;

procedure TfrmInspecciones.btnCerarAbrirresClick(Sender: TObject);
begin
  if tblInspecciones.state in [dsbrowse] then
  begin
    tblInspecciones.close;
    tblInspecciones.open;
  end;
end;

procedure TfrmInspecciones.BitBtn7Click(Sender: TObject);
begin
  frmBuscarInspecciones:=TfrmBuscarInspecciones.Create(nil);
  try
    frmBuscarInspecciones.BitBtn1.Visible:=True;
    if frmBuscarInspecciones.Showmodal = mrOk then
    begin
      tblInspecciones.Close;
      tblInspecciones.Params[0].Value:= ExtraerFecha(frmBuscarInspecciones.qryRepInspeccionesFECHA.Value);
      tblInspecciones.Params[1].Value:= ExtraerFecha(frmBuscarInspecciones.qryRepInspeccionesFECHA.Value);
      tblInspecciones.Open;
      if not tblInspecciones.Locate('codigo',frmBuscarInspecciones.qryRepInspeccionesCODIGO.Value,[]) then
      MessageDlg('Record no existe, verifique fecha',mtInformation,[mbok],0);
    end;
  finally
  frmBuscarInspecciones.free;
  frmBuscarInspecciones:=nil;
  end;
end;

procedure TfrmInspecciones.BitBtn12Click(Sender: TObject);
begin
  if tblInspeccionesDet.State in [dsBrowse] then
  begin
    if MessageDlg('¿Desea eliminar enlace a documento?',mtInformation,[mbyes,mbno],0)=mryes then
    begin
      tblInspeccionesDet.Delete;
      GlbSalvarQuery(tblInspeccionesDet);
    end;
  end;
end;

end.
