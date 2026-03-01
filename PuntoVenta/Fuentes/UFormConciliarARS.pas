unit UFormConciliarARS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, RxDBCtrl, StdCtrls, Buttons, Mask, RxToolEdit,
  ShellApi, DB, IBCustomDataSet, WinSkinData, IBQuery, DBCtrls, Menus, ComCtrls,
  RxMemDS, RxCtrls;

type
  TfrmConciliacionDeFctSeguro = class(TForm)
    DateEdit1: TDateEdit;
    DateEdit3: TDateEdit;
    Label1: TLabel;
    Label2: TLabel;
    cboxARS: TComboBox;
    Label3: TLabel;
    ComboBox2: TComboBox;
    Label4: TLabel;
    BitBtn1: TBitBtn;
    RxDBGrid1: TRxDBGrid;
    tblArsConciliarMaster: TIBDataSet;
    tblArsConciliarDet: TIBDataSet;
    tblArsConciliarDetSERIE: TIntegerField;
    tblArsConciliarDetNUMERO: TIntegerField;
    tblArsConciliarDetNUM_AUTORIZACION: TIBStringField;
    tblArsConciliarDetAFILIADO: TIBStringField;
    tblArsConciliarDetNSS: TIBStringField;
    tblArsConciliarDetNUM_FACTURA: TIBStringField;
    tblArsConciliarDetMONTO_COBERTURA: TFloatField;
    tblArsConciliarDetMOTIVO: TMemoField;
    tblArsConciliarDetSTATUS: TIBStringField;
    tblArsConciliarDetFECHA_IN: TDateTimeField;
    tblArsConciliarDetFECHA_UPDATE: TDateTimeField;
    tblArsConciliarDetIN_POR: TIBStringField;
    tblArsConciliarDetUPDATE_POR: TIBStringField;
    tblArsConciliarMasterIDARS: TIntegerField;
    tblArsConciliarMasterFECHA: TDateTimeField;
    tblArsConciliarMasterSTATUS: TIBStringField;
    tblArsConciliarMasterFECHA_IN: TDateTimeField;
    tblArsConciliarMasterFECHA_UPDATE: TDateTimeField;
    tblArsConciliarMasterIN_POR: TIBStringField;
    tblArsConciliarMasterUPDATE_POR: TIBStringField;
    dstblArsConciliarDet: TDataSource;
    dstblArsConciliarMaster: TDataSource;
    RxDBGrid3: TRxDBGrid;
    Label5: TLabel;
    SkinData1: TSkinData;
    qryDatosConciliacion: TIBQuery;
    qryDatosConciliacionIDARS: TIntegerField;
    qryDatosConciliacionNOMBRE: TIBStringField;
    qryDatosConciliacionFECHA: TDateTimeField;
    qryDatosConciliacionNUM_AUTORIZACION: TIBStringField;
    qryDatosConciliacionAFILIADO: TIBStringField;
    qryDatosConciliacionNOMBRE_FACTURAR: TIBStringField;
    qryDatosConciliacionNOMBRE_DEPENDIENTE: TIBStringField;
    qryDatosConciliacionCANTMEDS: TIntegerField;
    qryDatosConciliacionMONTO_RECLAMADO: TFloatField;
    qryDatosConciliacionPAGO_AFILIADO: TFloatField;
    qryDatosConciliacionMONTO_COBERTURA: TFloatField;
    qryMaxFechaConc: TIBQuery;
    qryMaxFechaConcULTIMAFECHA: TDateTimeField;
    qryARS: TIBQuery;
    qryARSIDARS: TIntegerField;
    qryARSRNC: TIBStringField;
    qryARSNOMBRE: TIBStringField;
    qryARSLETRAAUTORIZACION: TIBStringField;
    qryARSCONTACTO: TIBStringField;
    qryARSSTATUS: TIBStringField;
    qryARSNOMBRE_DEPENDIENTE: TIBStringField;
    qryDatosConciliacionNUMERO_DOC: TIBStringField;
    BitBtn2: TBitBtn;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    qryMinFechaConc: TIBQuery;
    qryMinFechaConcULTIMAFECHA: TDateTimeField;
    tblArsConciliarMasterNUMERO: TIntegerField;
    Label7: TLabel;
    Edit1: TEdit;
    qryTotalFact: TIBQuery;
    qryTotalFactCANTFACT: TIntegerField;
    qryTotalFactMOTIVO: TMemoField;
    qryTotalFactMONTOCOBERTURA: TFloatField;
    RxDBGrid2: TRxDBGrid;
    dsqryTotalFact: TDataSource;
    Label6: TLabel;
    DBMemo1: TDBMemo;
    BitBtn3: TBitBtn;
    PopupMenu1: TPopupMenu;
    EliminarRecord1: TMenuItem;
    ProgressBar1: TProgressBar;
    tblArsConciliarDetNUMERO_TRN: TIntegerField;
    qryDatosConciliacionNUMERO_TRN: TIntegerField;
    qryRepConcFactReclam: TIBQuery;
    qryExiste: TIBQuery;
    DBText1: TDBText;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    qryARSDIRECCION: TMemoField;
    qryARSTELEFONO: TIBStringField;
    qryARSTIPO_NCF: TIBStringField;
    qryARSDIASDECREDITO: TIntegerField;
    qryARSPORC_DESCUENTO: TFloatField;
    qryARSFECHA_IN: TDateTimeField;
    qryARSFECHA_UPDATE: TDateTimeField;
    qryARSIN_POR: TIBStringField;
    qryARSUPDATE_POR: TIBStringField;
    qryARSMONTO_RECLAMADO: TFloatField;
    tblArsConciliarMasterSERIE_NCFASIGNADO: TIntegerField;
    tblArsConciliarMasterNUMERO_FACTURAARS: TIntegerField;
    qryCliente: TIBQuery;
    qryClienteCODIGO_CTE: TIntegerField;
    qryClienteNOMBRE_FACTURAR: TIBStringField;
    qryClienteRNC_NUMERO: TIBStringField;
    qryClienteDIRECCION_CONT: TIBStringField;
    qryClienteCODIGO_AGENCIA: TSmallintField;
    rxSolDatoscte: TRxMemoryData;
    rxSolDatoscteNombre: TStringField;
    rxSolDatoscteDireccion1: TStringField;
    rxSolDatoscteDireccion2: TStringField;
    rxSolDatoscteCedula: TStringField;
    rxSolDatoscteCelular: TStringField;
    rxSolDatoscteSector: TStringField;
    rxSolDatoscteCiudad: TStringField;
    rxSolDatoscteApodo: TStringField;
    rxSolDatoscteTelefono: TStringField;
    rxSolDatoscteOtraPersona: TStringField;
    rxSolDatosctencfDescripcion: TStringField;
    qryVentaDet: TIBQuery;
    qryVentaDetNUMERO_TRN: TIntegerField;
    qryVentaDetSERIE: TIntegerField;
    qryVentaDetDESCRIPCION: TIBStringField;
    qryVentaDetPRECIO: TFloatField;
    qryVentaDetCOPAGO: TFloatField;
    qryVentaDetCOBERTURA: TFloatField;
    qryVentaFactCoberturaArs: TIBQuery;
    qryVentaFactCoberturaArsNUMERO: TIntegerField;
    qryVentaFactCoberturaArsNUMERO_NCF: TIBStringField;
    qryVentaFactCoberturaArsFECHA_VENCE: TDateTimeField;
    qryVentaFactCoberturaArsTIPO_NCF: TIBStringField;
    qryVentaFactCoberturaArsFECHA: TDateTimeField;
    qryVentaFactCoberturaArsSERIE: TIntegerField;
    qryVentaFactCoberturaArsDESCRIPCION: TIBStringField;
    qryVentaFactCoberturaArsPRECIO: TFloatField;
    qryVentaFactCoberturaArsCOPAGO: TFloatField;
    qryVentaFactCoberturaArsCOBERTURA: TFloatField;
    qryVentaFactCoberturaArsDESCRIPCION_2018: TIBStringField;
    qryVentaFactCoberturaArsNUMERO_FACTURAARS: TIntegerField;
    qryClienteCIUDAD: TIBStringField;
    qryClienteTELEF_CONTACTO: TIBStringField;
    qryRepConcFactReclamFECHA: TDateTimeField;
    qryRepConcFactReclamAUTORIZACION: TIBStringField;
    qryRepConcFactReclamCARNET: TIBStringField;
    qryRepConcFactReclamNOMBREAFILIADO: TIBStringField;
    qryRepConcFactReclamDEPENDIENTEFARMACIA: TIBStringField;
    qryRepConcFactReclamCANTMEDS: TIntegerField;
    qryRepConcFactReclamMONTO_RECLAMADO: TFloatField;
    qryRepConcFactReclamCOPAGO: TFloatField;
    qryRepConcFactReclamCOBERTURA: TFloatField;
    qryVentaFactCoberturaArsIDARS: TIntegerField;
    qryRepConcFactReclamNUMERODOCPAGO: TIBStringField;
    qryRepConcFactReclamIDARS: TIntegerField;
    qryRepConcFactReclamCANTDOCS: TIntegerField;
    RxSpeedButton1: TRxSpeedButton;
    PopupMenu2: TPopupMenu;
    ReImprimirFactura1: TMenuItem;
    Reclamacion1: TMenuItem;
    ExportarFactPDF1: TMenuItem;
    ExportarReclamacionPDF1: TMenuItem;
    CheckBox3: TCheckBox;
    tblArsConciliarMasterNombreArchivo: TStringField;
    tblArsConciliarMasterARCHIVO: TIBStringField;
    CheckBox4: TCheckBox;
    Label8: TLabel;
    BitBtn6: TBitBtn;
    Label9: TLabel;
    DBMemo2: TDBMemo;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure tblArsConciliarMasterAfterScroll(DataSet: TDataSet);
    procedure cboxARSChange(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure EliminarRecord1Click(Sender: TObject);
    procedure RxDBGrid3DblClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure RxDBGrid3GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure qryVentaFactCoberturaArsAfterScroll(DataSet: TDataSet);
    procedure ReImprimirFactura1Click(Sender: TObject);
    procedure Reclamacion1Click(Sender: TObject);
    procedure ExportarFactPDF1Click(Sender: TObject);
    procedure ExportarReclamacionPDF1Click(Sender: TObject);
    procedure tblArsConciliarMasterCalcFields(DataSet: TDataSet);
    procedure qryDatosConciliacionAfterOpen(DataSet: TDataSet);
    procedure BitBtn6Click(Sender: TObject);
  private
    { Private declarations }
    procedure InsertarDetalle(num:integer);
    procedure CrearNCF(tiponcf:String;var ValorNCF:String;var NumFacturaGen:Integer; var serie_asignadoncf : Integer);
    procedure InsertarDatosFactura(numdoc:integer;numtrnvta:integer;codcte:integer);
    procedure ImprimirFactura(codCte: integer;NumFact: Integer; xFecha:TDateTime);
    procedure RepReclamaciones(codCte: integer;NumFact: Integer; xFecha:TDateTime);
    procedure LlenarrxSolDatoscte(codCte:integer);
  public
    { Public declarations }
  end;

var
  frmConciliacionDeFctSeguro: TfrmConciliacionDeFctSeguro;
  _IDARS, _XCIA : integer;
  ExpPDF : Boolean;
implementation

uses UDatModConectar, UGlobal, UDatModCompania, UFormRecordConciARS,
  uFormAsignarNCFVenta, UDatModFactura, URepFacturaARS,
  URepReclamacionesARS, USeleccionarNCF;

{$R *.dfm}

procedure TfrmConciliacionDeFctSeguro.FormCreate(Sender: TObject);
begin
  try
  if Assigned(frmSelNCF) then
  begin
    frmSelNCF.Free;
    frmSelNCF:=nil;
  end;
  except
  end;
  qryCliente.Close;
  qryCliente.Open;
  if qryMaxFechaConcULTIMAFECHA.IsNull then
  DateEdit1.Date:=ExtraerFecha(now)
  else
  DateEdit1.Date:= qryMaxFechaConcULTIMAFECHA.Value;
  
  DateEdit3.Date:=ExtraerFecha(now);

  qryARS.Close;
  qryARS.Open;
  qryARS.First;
  While not qryARS.eof do
  begin
    cboxARS.Items.Add(qryARSNOMBRE.Value);
    qryARS.Next;
  end;
  qryARS.First;
  cboxARS.Text:=qryARSNOMBRE.Value;

  dmcompania.tblCompania.Close;
  dmcompania.tblCompania.Open;

  dmcompania.tblCompania.First;
  ComboBox2.Clear;
  while not dmcompania.tblCompania.eof do
  begin
    ComboBox2.Items.Add(dmcompania.tblCompaniaNOMBRE.Value);
    dmcompania.tblCompania.Next;
  end;
 cboxARSChange(Self);
end;

procedure TfrmConciliacionDeFctSeguro.BitBtn1Click(Sender: TObject);
begin
  cboxARSChange(Self);
  ComboBox2Change(Self);

  if ExtraerFecha(DateEdit1.Date) <= ExtraerFecha(qryMaxFechaConcULTIMAFECHA.Value) then
  begin
    MessageDlg('Fecha no puede ser menor o igual que el último cierre',mtError,[mbok],0);
    DateEdit1.SetFocus;
  end;

  if ExtraerFecha(DateEdit3.Date) >  ExtraerFecha(Now) then
  begin
    MessageDlg('Fecha final no puede ser futura verifique',mtError,[mbok],0);
    DateEdit3.SetFocus;
  end;

  qryDatosConciliacion.Close;
  qryDatosConciliacion.Params[0].Value:= ExtraerFecha(DateEdit1.Date);
  qryDatosConciliacion.Params[1].Value:= ExtraerFecha(DateEdit3.Date);
  qryDatosConciliacion.Params[2].Value:= _IDARS;
  qryDatosConciliacion.Open;
  qryDatosConciliacion.first;
  if qryDatosConciliacion.recordcount = 0 then
  begin
    MessageDlg('No existen records en el rango de fecha selecionado, verifique',mtInformation,[mbok],0);
    Exit;
  end;
  if (Not DirectoryExists(GlbRutaInformes)) then
          CreateDir(GlbRutaInformes);

  tblArsConciliarMaster.Close;
  tblArsConciliarMaster.Params[0].Value:= ExtraerFecha(DateEdit1.Date);
  tblArsConciliarMaster.Params[1].Value:= ExtraerFecha(DateEdit3.Date);
  tblArsConciliarMaster.Open;
  tblArsConciliarMaster.First;
  if not CheckBox1.Checked then
  begin
    if tblArsConciliarMaster.RecordCount = 0 then
    begin
      qryExiste.Close;
      qryExiste.Params[0].Value := ExtraerFecha(DateEdit3.Date);
      qryExiste.Params[1].Value := _IDARS;
      qryExiste.Open;
      qryExiste.First;
      if qryExiste.RecordCount > 0 then
      begin
        MessageDlg('Archivo ya existe, verifique el procedimiento.', mtError, [mbOk], 0);
        Exit;
      end;
      tblArsConciliarMaster.Append;
      tblArsConciliarMasterIDARS.Value    := _IDARS;
      tblArsConciliarMasterSTATUS.Value   := 'A';
      tblArsConciliarMasterFECHA_IN.Value := Now;
      tblArsConciliarMasterIN_POR.Value := StrUserName;
      tblArsConciliarMasterFECHA.Value  := ExtraerFecha(DateEdit3.Date);
      if GlbEsDebugEntradas = 1 then
      LogInformacionTxt('GlbRutaInformes='+GlbRutaInformes);
      tblArsConciliarMasterARCHIVO.Value  := GlbRutaInformes+'\'+cboxARS.Text+'_'+Edit1.Text;
      tblArsConciliarMasterARCHIVO.Value:=
      ExtractFilePath(tblArsConciliarMasterARCHIVO.Value)+'\'+
      StringReplace(ExtractFileName(tblArsConciliarMasterARCHIVO.Value),
      ExtractFileExt(tblArsConciliarMasterARCHIVO.Value),'',[rfReplaceAll])
      +FormatDateTime('ddmmyyyy',Now)+'.xls';

      tblArsConciliarMasterARCHIVO.Value:=
      StringReplace(tblArsConciliarMasterARCHIVO.Value,'\\','\',[rfReplaceAll]);

      if GlbEsDebugEntradas = 1 then
      LogInformacionTxt('Nombre archivo='+tblArsConciliarMasterARCHIVO.Value);
      GlbSalvarQuery(tblArsConciliarMaster);
      qryDatosConciliacion.Close;
      qryDatosConciliacion.Params[0].Value:= ExtraerFecha(DateEdit1.Date);
      qryDatosConciliacion.Params[1].Value:= ExtraerFecha(DateEdit3.Date);
      qryDatosConciliacion.Params[2].Value:= _IDARS;
      qryDatosConciliacion.Open;
      InsertarDetalle(tblArsConciliarMasterNUMERO.Value);
    end else
    MessageDlg('Verifique rango de fecha, ya existe(n) archivo(s) en rango.',mtError,[mbok],0);
  end;
  qryRepConcFactReclam.Close;
  qryRepConcFactReclam.Params[0].Value := ExtraerFecha(DateEdit1.Date);
  qryRepConcFactReclam.Params[1].Value := ExtraerFecha(DateEdit3.Date);
  qryRepConcFactReclam.Params[2].Value := _IDARS;
  qryRepConcFactReclam.Open;
  
  GLBMostrarArchivo:=CheckBox4.Checked;
  if qryDatosConciliacion.RecordCount = 0 then Exit;

  if not FileExists(tblArsConciliarMasterARCHIVO.Value) then
  begin
    if CheckBox3.Checked then
    ExporToExcelARSFact(qryDatosConciliacion, qryRepConcFactReclam,tblArsConciliarMasterARCHIVO.Value,
    'Fecha de: ' +FormatDateTime('dd/mm/yy',qryDatosConciliacion.Params[0].Value)+ ' AL '+
    FormatDateTime('dd/mm/yy',qryDatosConciliacion.Params[1].Value));
  end else
  if CheckBox1.Checked then
  if CheckBox3.Checked then
    ExporToExcelARSFact(qryDatosConciliacion, qryRepConcFactReclam,tblArsConciliarMasterARCHIVO.Value,
    'Fecha de: ' +FormatDateTime('dd/mm/yy',qryDatosConciliacion.Params[0].Value)+ ' AL '+
    FormatDateTime('dd/mm/yy',qryDatosConciliacion.Params[1].Value));
  if (GlbNombreArchivo <> '') then
  begin
    if tblArsConciliarMaster.RecordCount > 0 then
    begin
      tblArsConciliarMaster.Edit;
      tblArsConciliarMasterARCHIVO.Value := GlbNombreArchivo;
      GlbSalvarQuery(tblArsConciliarMaster);
    end;
  end;
end;

procedure TfrmConciliacionDeFctSeguro.CheckBox2Click(Sender: TObject);
begin
  qryMinFechaConc.Close;
  qryMinFechaConc.Open;

  qryMaxFechaConc.Close;
  qryMaxFechaConc.Open;

  if not qryMinFechaConcULTIMAFECHA.IsNull then
  DateEdit1.Date:= qryMinFechaConcULTIMAFECHA.Value;

  if not qryMaxFechaConcULTIMAFECHA.IsNull then
  DateEdit3.Date:= qryMaxFechaConcULTIMAFECHA.Value;
  
end;

procedure TfrmConciliacionDeFctSeguro.tblArsConciliarMasterAfterScroll(
  DataSet: TDataSet);
begin
  tblArsConciliarDet.Close;
  if not tblArsConciliarMasterNUMERO.IsNull then
  tblArsConciliarDet.Params[0].Value:= tblArsConciliarMasterNUMERO.Value
  else
  tblArsConciliarDet.Params[0].Value := -1;
  tblArsConciliarDet.Open;

  qryTotalFact.Close;
  if tblArsConciliarMasterNUMERO.IsNull then
  qryTotalFact.Params[0].Value:= -1
  else
  qryTotalFact.Params[0].Value:= tblArsConciliarMasterNUMERO.Value;
  qryTotalFact.Open;
end;

procedure TfrmConciliacionDeFctSeguro.InsertarDetalle(num: Integer);
begin
  ProgressBar1.Visible:=True;
  tblArsConciliarDet.Close;
  tblArsConciliarDet.Params[0].Value:= num;
  tblArsConciliarDet.Open;
  qryDatosConciliacion.First;
  ProgressBar1.Position:=0;
  ProgressBar1.Max:= qryDatosConciliacion.RecordCount;
  while not qryDatosConciliacion.eof do
  begin
  tblArsConciliarDet.Append;
  tblArsConciliarDetNUMERO.Value := num;
   
  tblArsConciliarDetNUM_AUTORIZACION.Value:= qryDatosConciliacionNUM_AUTORIZACION.Value;
  tblArsConciliarDetAFILIADO.Value:= qryDatosConciliacionNOMBRE_FACTURAR.Value;
  tblArsConciliarDetNSS.Value     := qryDatosConciliacionAFILIADO.Value;
  tblArsConciliarDetNUM_FACTURA.Value := qryDatosConciliacionNUMERO_DOC.Value;
  tblArsConciliarDetMONTO_COBERTURA.Value:= qryDatosConciliacionMONTO_COBERTURA.Value;
  tblArsConciliarDetSTATUS.Value  := 'A';
  tblArsConciliarDetNUMERO_TRN.Value := qryDatosConciliacionNUMERO_TRN.Value;
  tblArsConciliarDetIN_POR.Value     := StrUserName;
  tblArsConciliarDetFECHA_IN.Value   := Now;
  GlbSalvarQuery(tblArsConciliarDet);
  ProgressBar1.StepIt;
  qryDatosConciliacion.next;
  end;
  ProgressBar1.Visible:=False;
end;

procedure TfrmConciliacionDeFctSeguro.cboxARSChange(Sender: TObject);
begin
  if qryARS.locate('NOMBRE', cboxARS.Text,[]) then
  _IDARS:= qryARSIDARS.Value;
  BitBtn3Click(Self);
end;

procedure TfrmConciliacionDeFctSeguro.ComboBox2Change(Sender: TObject);
begin
  if dmcompania.tblCompania.Locate('NOMBRE',ComboBox2.Text,[]) then
  _XCIA := dmcompania.tblCompaniaCODIGO.Value;
end;

procedure TfrmConciliacionDeFctSeguro.BitBtn3Click(Sender: TObject);
begin
  tblArsConciliarMaster.Close;
  tblArsConciliarDet.Close;
  tblArsConciliarMaster.Params[0].Value:= ExtraerFecha(DateEdit1.Date);
  tblArsConciliarMaster.Params[1].Value:= ExtraerFecha(DateEdit3.Date);
  tblArsConciliarMaster.Params[2].Value:= _IDARS;
  tblArsConciliarMaster.Open;

  qryDatosConciliacion.Close;
  qryDatosConciliacion.Params[0].Value:= ExtraerFecha(DateEdit1.Date);
  qryDatosConciliacion.Params[1].Value:= ExtraerFecha(DateEdit3.Date);
  qryDatosConciliacion.Params[2].Value:= _IDARS;
  qryDatosConciliacion.Open;
    
  qryTotalFact.Close;
  qryTotalFact.Params[0].Value:= tblArsConciliarMasterNUMERO.Value;
  qryTotalFact.Open;
end;

procedure TfrmConciliacionDeFctSeguro.EliminarRecord1Click(
  Sender: TObject);
begin
 if (tblArsConciliarMasterSTATUS.Value = 'A') then
 begin
   tblArsConciliarMaster.Delete;
   GlbSalvarQuery(tblArsConciliarMaster);
 end else
 if (tblArsConciliarMasterSTATUS.Value = 'A') then
 MessageDlg('Record cerrado, no puedes eliminarlo, verique.', mtInformation, [mbOk], 0);
end;

procedure TfrmConciliacionDeFctSeguro.RxDBGrid3DblClick(Sender: TObject);
begin
  frmConcARSRRecord:=TfrmConcARSRRecord.Create(Nil);
  try
    tblArsConciliarDet.Edit;
    if frmConcARSRRecord.Showmodal = mrOk then
    GlbSalvarQuery(tblArsConciliarDet) else
    tblArsConciliarDet.Cancel;
  finally
  FreeAndNil(frmConcARSRRecord);
  end;
end;

procedure TfrmConciliacionDeFctSeguro.BitBtn2Click(Sender: TObject);
begin
  if (FileExists(tblArsConciliarMasterARCHIVO.Value)) then
  ShellExecute(0,'open',PChar(tblArsConciliarMasterARCHIVO.Value), '','',SW_SHOWNORMAL);
end;

procedure TfrmConciliacionDeFctSeguro.RxDBGrid3GetCellParams(
  Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
  Highlight: Boolean);
begin
  if (tblArsConciliarDetSTATUS.Value = 'R') then
  Background := clGreen;
end;

procedure TfrmConciliacionDeFctSeguro.RxDBGrid1GetCellParams(
  Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
  Highlight: Boolean);
begin
  if (tblArsConciliarMasterSTATUS.Value = 'R') then
  Background := clGreen;
end;

procedure TfrmConciliacionDeFctSeguro.BitBtn4Click(Sender: TObject);
begin
  if (tblArsConciliarDetSTATUS.Value = 'A') then
  begin
    frmConcARSRRecord:=TfrmConcARSRRecord.Create(Nil);
    try
      tblArsConciliarDet.Edit;
      tblArsConciliarDetSTATUS.Value := 'C';
      frmConcARSRRecord.DBMemo1.TabOrder:= 0;
      if frmConcARSRRecord.Showmodal = mrOk then
      GlbSalvarQuery(tblArsConciliarDet) else
      tblArsConciliarDet.Cancel;
    finally
    FreeAndNil(frmConcARSRRecord);
    end;
  end;
  qryTotalFact.Close;
  qryTotalFact.Open;
end;

procedure TfrmConciliacionDeFctSeguro.CrearNCF(tiponcf:String;var ValorNCF:String;var NumFacturaGen:Integer; var serie_asignadoncf : Integer);
var
  abortar : boolean;
begin
//Generar y Asignar Numero de Comprobante Fiscal
  valorNCF:='';
  NumFacturaGen:= -1;//indica que no se generó el NCF

  //if CheckBox1.Checked then
  //begin
    frmAsignarNCFVenta:=tfrmAsignarNCFVenta.Create(nil);
    try
      frmAsignarNCFVenta.IBDataSet1.Close;
      frmAsignarNCFVenta.IBDataSet1.Open;
      frmAsignarNCFVenta.IBDataSet1.Insert;
      frmAsignarNCFVenta.IBDataSet1FECHA_INSERT.Value := Now;
      frmAsignarNCFVenta.IBDataSet1FECHA.Value := ExtraerFEcha(GlbFechaTrnDiaria);
      if (GlbcodVendedor > 0) then
      frmAsignarNCFVenta.IBDataSet1CODIGO_USUARIO.Value := GlbcodVendedor
      else
      frmAsignarNCFVenta.IBDataSet1CODIGO_USUARIO.Value := VarUsuarioGlb;

      frmAsignarNCFVenta.IBDataSet1STATUS.Value := 'A';

      frmAsignarNCFVenta.IBDataSet1TIPO_NCF.Value := tipoNCF;
      frmAsignarNCFVenta.BitBtn13Click(Self);

      frmAsignarNCFVenta.Asginarncf := frmAsignarNCFVenta.ncfGenerado;
      GlbDescNCF := frmAsignarNCFVenta.descNCF;
      frmAsignarNCFVenta.IBDataSet1NUMERO_NCF.Value := frmAsignarNCFVenta.ncfGenerado;//rxVentaNCF.Value;
      frmAsignarNCFVenta.IBDataSet1MONTO.Value      := qryTotalFactMONTOCOBERTURA.Value; //StrToFloat(EditN1.Text);

      frmAsignarNCFVenta.BitBtn4Click(Self); //Guardar

      if (frmAsignarNCFVenta.ncfGenerado = '') then
      begin
        MessageDlg('NCF no fue generado, verifique configuración', mtError, [mbOk], 0);
        abortar:=True;
      end;

      if abortar then
      begin
        FreeAndNil(frmAsignarNCFVenta);
      end;

      serie_asignadoncf := frmAsignarNCFVenta.IBDataSet1SERIE.Value;
      //Select Gen_id(gen_num_factura,1) From rdb$database
      NumFacturaGen:= FsqlMaxNumeroFactura('gen_num_factura');
      //RxDBLookupCombo3Change(Self);
      if (NumFacturaGen = 0) then
      NumFacturaGen:=1;

      valorNCF:= frmAsignarNCFVenta.ncfGenerado;

      //if Totales.State = dsBrowse then
      //Totales.Edit;

      {if Totales.State In [dsInsert, dsEdit] then
      begin
        Totales.Edit;
        Totalesncf_numero.Value := valorNCF;
        TotalesqrLabelNcfDesc.Value:=GlbDescNCF;
        Totales.Post;
      end;}
    finally
    frmAsignarNCFVenta.free;
    frmAsignarNCFVenta:=nil;
    end;
  //end;//Fin if CheckBox1.Checked then
end;

procedure TfrmConciliacionDeFctSeguro.BitBtn5Click(Sender: TObject);
var
  NumNCF : string;
  NumFactura, serieNCF : Integer;
begin
  if (tblArsConciliarMasterSTATUS.Value = 'A') then
  begin
    if not tblArsConciliarMasterNUMERO_FACTURAARS.IsNull then
    begin
      MessageDlg('Factura ya fue creada, verifique.',mtError,[mbok],0);
      exit;
    end;

    if not qryCliente.Locate('CODIGO_AGENCIA',tblArsConciliarMasterIDARS.Value,[]) then
    begin
      MessageDlg('ARS no ha sido creada en cliente, verifique.',mtError,[mbok],0);
      exit;
    end;
    CrearNCF(qryARSTIPO_NCF.Value,NumNCF,NumFactura,serieNCF);
    tblArsConciliarMaster.Edit;
    tblArsConciliarMasterSERIE_NCFASIGNADO.Value:=serieNCF;
    tblArsConciliarMasterNUMERO_FACTURAARS.Value:=NumFactura;
    tblArsConciliarMasterSTATUS.Value:='R';
    GlbSalvarQuery(tblArsConciliarMaster);
    tblArsConciliarDet.First;
    While Not tblArsConciliarDet.Eof Do
    begin
      tblArsConciliarDet.Edit;
      tblArsConciliarDetSTATUS.Value := 'R';
      GlbSalvarQuery(tblArsConciliarDet);
      tblArsConciliarDet.Next;
    end;
    if qryCliente.Locate('CODIGO_AGENCIA',tblArsConciliarMasterIDARS.Value,[]) then
    InsertarDatosFactura(numfactura,tblArsConciliarDetNUMERO_TRN.Value,qryClienteCODIGO_CTE.Value);
    if qryCliente.Locate('CODIGO_AGENCIA',tblArsConciliarMasterIDARS.Value,[]) then
    ImprimirFactura(qryClienteCODIGO_CTE.Value,NumFactura,tblArsConciliarMasterFECHA.Value);
  end;
end;

procedure TfrmConciliacionDeFctSeguro.InsertarDatosFactura(numdoc:integer;numtrnvta:integer;codcte:integer);
begin
dmfactura.IBDataSetFacturas.Close;
  dmfactura.IBDataSetFacturas.Open;

  dmfactura.IBDataSetFacturas.Append;
  dmfactura.IBDataSetFacturasPORC_ATRASOCXC.Value := GLBPORC_ATRASOCXC;
  dmfactura.IBDataSetFacturasNUMERO.Value  := numdoc;
  dmfactura.IBDataSetFacturasNUMERO_TRN_VTA.Value := numtrnvta;
  dmfactura.IBDataSetFacturasCIA_KEY.Value := glbCia_Key;
  dmfactura.IBDataSetFacturasMONEDA.Value  := '1';

  dmfactura.IBDataSetFacturasTIPO.Value   := 2;
  dmfactura.IBDataSetFacturasCODIGO_CTE.Value := codcte;
  dmfactura.IBDataSetFacturasFECHA.Value      := ExtraerFecha(tblArsConciliarMasterFECHA.Value);
  dmfactura.IBDataSetFacturasDESCRIPCION.Value:= 'Venta con Cobertura ARS';
  dmfactura.IBDataSetFacturasMONTO_FACT.Value := qryTotalFactMONTOCOBERTURA.Value;
  dmfactura.IBDataSetFacturasRCXC.Value       := 'R';
  dmfactura.IBDataSetFacturasSTATUS.Value     := 'P';
  dmfactura.IBDataSetFacturasFECHA_IN.Value   := Now;
  dmfactura.IBDataSetFacturasFECHA_VENCE.Value:= dmfactura.IBDataSetFacturasFECHA.Value + qryARSDIASDECREDITO.Value;

  dmfactura.IBDataSetFacturasTIPO_FACTURA.Value:=1;//otros

  dmfactura.IBDataSetFacturasAPLICA_TIPODESC.Value:=0;

  dmfactura.IBDataSetFacturas.Post;
  dmfactura.IBDataSetFacturas.ApplyUpdates;
  if Not dmfactura.IBDataSetFacturas.Transaction.InTransaction then
  dmfactura.IBDataSetFacturas.Transaction.StartTransaction;
  try
    dmfactura.IBDataSetFacturas.Transaction.CommitRetaining;
  except
  dmfactura.IBDataSetFacturas.Transaction.RollbackRetaining;
  end;

  //Inserta factura en tabla factura_pendiente y pone status factura igual a F donde
  //status igual a P
  dmfactura.stpProcInsFactPendiente.Params[0].Value:= ExtraerFecha(tblArsConciliarMasterFECHA.Value);
  dmfactura.stpProcInsFactPendiente.Params[1].Value:= ExtraerFecha(tblArsConciliarMasterFECHA.Value);

  dmfactura.stpProcInsFactPendiente.Params[2].Value:= '1';
  dmfactura.stpProcInsFactPendiente.Params[3].Value:= '1';

  dmfactura.stpProcInsFactPendiente.ExecProc;
  if Not dmfactura.stpProcInsFactPendiente.Transaction.InTransaction then
  dmfactura.stpProcInsFactPendiente.Transaction.StartTransaction;
  try
    dmfactura.stpProcInsFactPendiente.Transaction.CommitRetaining;
  except
  dmfactura.stpProcInsFactPendiente.Transaction.RollbackRetaining;
  end;
end;

procedure TfrmConciliacionDeFctSeguro.ImprimirFactura(codCte,
  NumFact: Integer; xFecha:TDateTime);
begin
  LlenarrxSolDatoscte(codCte);

  qryVentaFactCoberturaArs.Close;
  qryVentaFactCoberturaArs.Params[0].Value:= numfact;
  qryVentaFactCoberturaArs.open;
  qryVentaFactCoberturaArs.First;

  qryRepConcFactReclam.Close;
  qryRepConcFactReclam.Params[0].Value :=ExtraerFecha(DateEdit1.Date);
  qryRepConcFactReclam.Params[1].Value :=ExtraerFecha(DateEdit3.Date);
  qryRepConcFactReclam.Params[2].Value :=tblArsConciliarMasterIDARS.Value;
  qryRepConcFactReclam.Open;
  qryRepConcFactReclam.First;

  qryVentaDet.RecordCount;
  qckRepFactARS:=TqckRepFactARS.Create(Nil);
  try
    qckRepFactARS.Prepare;
    qckRepFactARS.TPag.Caption:= ' de '+IntToStr(qckRepFactARS.PageNumber);
    if ExpPDF then
    begin
      GLBMostrarArchivo:=True;
      ReportExportPDF(qckRepFactARS,ExtractFileDir(tblArsConciliarMasterARCHIVO.Value)+'\FACT_'+cboxARS.Text+'_'+Extractfilename(ChangeFileExt(tblArsConciliarMasterARCHIVO.Value,'.pdf')));
    end else
    qckRepFactARS.Preview;
  finally
  qckRepFactARS.free;
  qckRepFactARS:=nil
  end;
end;

procedure TfrmConciliacionDeFctSeguro.LlenarrxSolDatoscte(codCte: integer);
begin
  rxSolDatoscte.Close;
  rxSolDatoscte.Open;

  if qryCliente.state = dsInactive then
  qryCliente.Open;

  if not qryCliente.Locate('CODIGO_Cte', codCte, []) then
  begin
    rxSolDatoscte.Insert;
    rxSolDatoscteNombre.Value  := '*** ERROR ERROR ***';
    rxSolDatoscte.Post;
    MessageDlg('Cliente no existe:'+IntToStr(codcte),mterror,[mbok],0);
    Exit;
  end;
    
  rxSolDatoscte.EmptyTable;

  if rxSolDatoscte.State In [dsInactive] then
     rxSolDatoscte.Open;

  if (rxSolDatoscte.RecordCount = 0) Or (rxSolDatoscteNombre.IsNull) then
  begin
    rxSolDatoscte.Insert;

    rxSolDatoscteNombre.Value    := qryClienteNOMBRE_FACTURAR.Value;

    rxSolDatoscteDireccion1.Value:= qryClienteDIRECCION_CONT.Value;
    rxSolDatoscteDireccion2.Value:= '';

    if qryClienteRNC_NUMERO.IsNull then
       rxSolDatoscteCedula.Value := ''
    else
        rxSolDatoscteCedula.Value := qryClienteRNC_NUMERO.Value;

    rxSolDatoscteCiudad.Value    := qryClienteCIUDAD.Value;
    rxSolDatoscteTelefono.Value  := qryClienteTELEF_CONTACTO.Value;

  end else
  begin
    rxSolDatoscte.Close;
    rxSolDatoscte.Open;
    rxSolDatoscte.Insert;
    rxSolDatoscteNombre.Value  := '*** Cliente Generico ***';
  end;
  rxSolDatosctencfDescripcion.Value := GlbDescNCF;
  rxSolDatoscte.Post;
end;

procedure TfrmConciliacionDeFctSeguro.qryVentaFactCoberturaArsAfterScroll(
  DataSet: TDataSet);
begin
  qryVentaDet.Close;
  qryVentaDet.Params[0].Value:= qryVentaFactCoberturaArsFECHA.Value;
  qryVentaDet.Params[1].Value:=  qryVentaFactCoberturaArsIDARS.Value;
  qryVentaDet.Open;
end;

procedure TfrmConciliacionDeFctSeguro.RepReclamaciones(codCte,
  NumFact: Integer; xFecha: TDateTime);
begin
  LlenarrxSolDatoscte(codCte);

  qryVentaFactCoberturaArs.Close;
  qryVentaFactCoberturaArs.Params[0].Value:= numfact;
  qryVentaFactCoberturaArs.open;
  qryVentaFactCoberturaArs.First;

  qryRepConcFactReclam.Close;
  qryRepConcFactReclam.Params[0].Value :=ExtraerFecha(DateEdit1.Date);
  qryRepConcFactReclam.Params[1].Value :=ExtraerFecha(DateEdit3.Date);
  qryRepConcFactReclam.Params[2].Value :=tblArsConciliarMasterIDARS.Value;
  qryRepConcFactReclam.Open;
  qryRepConcFactReclam.First;

  qckRepReclamacionesARS:=TqckRepReclamacionesARS.Create(Nil);
  try
    qckRepReclamacionesARS.Prepare;
    qckRepReclamacionesARS.TPag.Caption:= ' de '+IntToStr(qckRepReclamacionesARS.PageNumber);
    if not ExpPDF then
    qckRepReclamacionesARS.Preview
    else
    Begin
      GLBMostrarArchivo:=True;
      ReportExportPDF(qckRepReclamacionesARS,ExtractFileDir(tblArsConciliarMasterARCHIVO.Value)+'\'+cboxARS.Text+'_'+Extractfilename(ChangeFileExt(tblArsConciliarMasterARCHIVO.Value,'.pdf')));
    end;
  finally
  qckRepReclamacionesARS.Free;
  qckRepReclamacionesARS:=Nil;
  end;
end;

procedure TfrmConciliacionDeFctSeguro.ReImprimirFactura1Click(
  Sender: TObject);
begin
  if qryCliente.Locate('CODIGO_AGENCIA',tblArsConciliarMasterIDARS.Value,[]) then
  ImprimirFactura(qryClienteCODIGO_CTE.Value,tblArsConciliarMasterNUMERO_FACTURAARS.Value,tblArsConciliarMasterFECHA.Value);
end;

procedure TfrmConciliacionDeFctSeguro.Reclamacion1Click(Sender: TObject);
begin
  if qryCliente.Locate('CODIGO_AGENCIA',tblArsConciliarMasterIDARS.Value,[]) then
  RepReclamaciones(qryClienteCODIGO_CTE.Value,tblArsConciliarMasterNUMERO_FACTURAARS.Value,tblArsConciliarMasterFECHA.Value);
end;

procedure TfrmConciliacionDeFctSeguro.ExportarFactPDF1Click(
  Sender: TObject);
begin
  ExpPDF:=True;
  GLBMostrarArchivo:=True;
  if qryCliente.Locate('CODIGO_AGENCIA',tblArsConciliarMasterIDARS.Value,[]) then
  ImprimirFactura(qryClienteCODIGO_CTE.Value,tblArsConciliarMasterNUMERO_FACTURAARS.Value,tblArsConciliarMasterFECHA.Value);
end;

procedure TfrmConciliacionDeFctSeguro.ExportarReclamacionPDF1Click(
  Sender: TObject);
begin
  ExpPDF:=True;
  GLBMostrarArchivo:=True;
  if qryCliente.Locate('CODIGO_AGENCIA',tblArsConciliarMasterIDARS.Value,[]) then
  RepReclamaciones(qryClienteCODIGO_CTE.Value,tblArsConciliarMasterNUMERO_FACTURAARS.Value,tblArsConciliarMasterFECHA.Value);
end;

procedure TfrmConciliacionDeFctSeguro.tblArsConciliarMasterCalcFields(
  DataSet: TDataSet);
begin
  if Not tblArsConciliarMasterArchivo.IsNull then
  tblArsConciliarMasterNombreArchivo.Value:=
  Extractfilename(tblArsConciliarMasterArchivo.Value);
end;

procedure TfrmConciliacionDeFctSeguro.qryDatosConciliacionAfterOpen(
  DataSet: TDataSet);
begin
  Label8.Visible:=False;
  qryDatosConciliacion.First;
  if (qryDatosConciliacion.RecordCount > 0) then
  begin
    Label8.Caption := cboxARS.text+'. Total Ventas: '+IntToStr(qryDatosConciliacion.RecordCount);
    Label8.Visible:=True;
  end;
  Label8.Caption := '';
end;

procedure TfrmConciliacionDeFctSeguro.BitBtn6Click(Sender: TObject);
begin
  GlbSalvarQuery(tblArsConciliarDet);
end;

end.
