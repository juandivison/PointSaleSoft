unit UElijeTipockReg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GetAnyDate, DB, IBCustomDataSet, IBQuery, StdCtrls, Buttons,
  EditNew;

type
  TfrmElijeBcoCksReg = class(TForm)
    Label1: TLabel;
    Label10: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label7: TLabel;
    Label4: TLabel;
    dboxBancos: TComboBox;
    edtCodBco: TEditN;
    dboxCompania: TComboBox;
    edtcodcia: TEditN;
    cboxTipocks: TComboBox;
    edtTipoCks: TEditN;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    edtCtaxP: TEditN;
    qryDatosCksReg: TIBQuery;
    qryDatosCksRegNUM_TRANS: TFloatField;
    qryDatosCksRegBENEFICIARIO: TStringField;
    qryDatosCksRegMONTO: TFloatField;
    qryDatosCksRegTIPO_CKS: TSmallintField;
    qryDatosCksRegCOD_BANCO: TIntegerField;
    qryDatosCksRegTIPO_NOMINA: TSmallintField;
    qryDatosCksRegSUBTIPO: TSmallintField;
    qryDatosCksRegSTATUS: TStringField;
    qryDatosCksRegTIPOSERVICIO: TIntegerField;
    qryDatosCksRegSUBTIPOSERV: TIntegerField;
    fechacks: TGetAnyDate;
  private
    procedure ArreglarCksDetalles(cta1, cta2, cta3: String);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure ChequesDetalle(cta1, cta2, cta3: String; db, cr: Real);
    procedure CrearCheques;
    procedure dboxBancosChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure InsertarDetalle;
    procedure qryDatosCksRegAfterScroll(DataSet: TDataSet);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmElijeBcoCksReg: TfrmElijeBcoCksReg;
  numtrans : Integer;
  XfechaCks : TDatetime;

implementation

uses UDatmodDatosGenerales, UGlobal, UDatModBanco, UDatModCompania,
  UDatModCheques, UDatModNomina;

{$R *.dfm}

procedure TfrmElijeBcoCksReg.FormCreate(Sender: TObject);
begin
  dmBancos.qrybancos.close;
  dmbancos.qrybancos.params[0].Value:= glbCia_Key;
  dmbancos.qrybancos.open;
  dmbancos.qrybancos.First;
  dboxBancos.Clear;
  dmCompania.tblCompania.close;
  dmCompania.tblCompania.open;
  While Not dmBancos.qrybancos.eof do
  begin
    dboxBancos.Items.Add(dmBancos.qrybancosdescripcion.Value);
    dmBancos.qrybancos.next;
  end;
  dboxbancos.ItemIndex:=0;
  dmCompania.tblCompania.First;
  dboxCompania.Clear;
  While Not dmCompania.tblCompania.Eof do
  begin
    dboxCompania.Items.Add(dmCompania.tblCompaniacodigo.AsString+'-'+dmCompania.tblCompaniaNOMBRE.Value);
    dmCompania.tblCompania.Next;
  end;
  cboxTipocks.ItemIndex:=0;
  dboxCompania.ItemIndex:=0;
end;

procedure TfrmElijeBcoCksReg.dboxBancosChange(Sender: TObject);
begin
  if dmBancos.qrybancos.Locate('Descripcion',dboxBancos.Text,[]) then
  edtCodBco.Text := dmBancos.qrybancoscodigo.AsString;
end;

procedure TfrmElijeBcoCksReg.CrearCheques;
var
  cta1,cta2,cta3:String;
begin
  if dmBancos.qryBancos.Locate('codigo',StrToInt(edtTipoCks.Text),[]) then
  begin
    cta1:=dmBancos.qryBancosDetCUENTA1.Value;
    cta2:=dmBancos.qryBancosDetCUENTA2.Value;
    cta3:=dmBancos.qryBancosDetCUENTA3.Value;
  end else
  begin
    Messagedlg('Banco no tiene cuenta catalogo asignada, verifique',mtError,[mbok],0);
    exit;
  end;
  dmdatos.QryProyRegalia.First;
  dmNomina.qryChequesM.Close;
  dmNomina.qryChequesM.params[0].Value := ExtraerFecha(Date);
  dmNomina.qryChequesM.params[1].Value := ExtraerFecha(Date);
  dmNomina.qryChequesM.Open;
  //Numtrans := 2691;//FsqlMaxNumero('CHEQUES_NOMINA','NUM_TRANS');
  XfechaCks:=0;
  While Not dmdatos.QryProyRegalia.Eof Do
  begin
    if dmdatos.QryProyRegaliaREG_PROY.Value > 0 then
    begin
      dmNomina.qryChequesM.Insert;
      dmNomina.qryChequesMCodigo_Cia.AsString:=edtcodcia.Text;
      dmNomina.qryChequesMSol_Expno.value := 0;
      dmNomina.qryChequesMcodigo_Empleado.Value:=dmdatos.QryProyRegaliaCODIGO.Value;
      dmNomina.qryChequesMFecha_Emision.Value  := ExtraerFecha(Date);
      dmNomina.qryChequesMFecha_Pago.Value     := ExtraerFecha(Date);
      if XfechaCks = 0 then XfechaCks:= ExtraerFecha(Date);
      dmNomina.qrychequesmBeneFiciario.Value   := sqlNombreAbr(dmNomina.qryChequesMcodigo_Empleado.Value);
      dmNomina.qryChequesMMonto.Value    := dmdatos.QryProyRegaliaREG_PROY.Value;
      dmNomina.qryChequesMConcepto.Value := 'Pago regalia pascual correspondiente al año '+FormatDateTime('yyyy',dmNomina.qryChequesMFecha_Emision.Value);
      dmNomina.qryChequesMTIPO_NOMINA.Value := 2;
      dmNomina.qryChequesMTipo_Cks.value:= 2;
      dmNomina.qryChequesMSUBTIPO.Value := 4;//regalia;
      dmNomina.qryChequesMCod_Banco.AsString:= edtCodBco.Text;
      dmNomina.qryChequesMStatus.Value := 'A';
      try
        dmNomina.qryChequesM.Post;
        dmNomina.qryChequesM.ApplyUpdates;
      except raise;
      end;
{      Inc(numtrans);
      if numtrans > 0 then
      begin
        ChequesDetalle(cta1,cta2,cta3,dmNomina.qryChequesMMONTO.Value,0);
        ChequesDetalle(dmdatos.qryChequesPTipoCUENTA1_CAT.Value,
                       dmdatos.qryChequesPTipoCUENTA2_CAT.Value,
                       dmdatos.qryChequesPTipoCUENTA3_CAT.Value,
                       0,dmNomina.qryChequesMMONTO.Value);
      end;}
    end;
    dmdatos.QryProyRegalia.Next;
  end;
  if Not dmdatos.QryProyRegalia.Transaction.InTransaction then
  dmdatos.QryProyRegalia.Transaction.StartTransaction;
  try
  dmdatos.QryProyRegalia.Transaction.CommitRetaining;
  except
  dmdatos.QryProyRegalia.Transaction.RollbackRetaining;
  end;
  InsertarDetalle;
  if Not qryDatosCksReg.Transaction.InTransaction then
  qryDatosCksReg.Transaction.StartTransaction;
  try
  qryDatosCksReg.Transaction.CommitRetaining;
  except
  qryDatosCksReg.Transaction.RollbackRetaining;
  end;
end;

procedure TfrmElijeBcoCksReg.BitBtn1Click(Sender: TObject);
begin
  CrearCheques;
end;


procedure TfrmElijeBcoCksReg.ChequesDetalle(cta1,cta2,cta3:String;db,cr:Real);
begin
  dmNomina.qryChequesDet.Insert;
  dmNomina.qryChequesDetNUM_TRANS.Value    := numtrans;
  dmNomina.qryChequesDetCUENTA1.Value      := cta1;
  dmNomina.qryChequesDetCUENTA2.Value      := cta2;
  dmNomina.qryChequesDetCUENTA3.Value      := cta3;
  dmNomina.qryChequesDetDEBITO.Value       := db;  
  dmNomina.qryChequesDetCREDITO.Value      := cr;
  dmNomina.qryChequesDetSTATUS.Value       := 'A';
  //dmNomina.qryChequesDetCOD_CONCEPTO.Value := dmDatos.qryChequesPTipoCTA_CONCEPTO.Value;
  dmNomina.qryChequesDet.Post;
  dmNomina.qryChequesDet.ApplyUpdates;
end;

procedure TfrmElijeBcoCksReg.ArreglarCksDetalles(cta1,cta2,cta3:String);
var
  xcta1,xcta2,xcta3 : String;
begin
  if edtCtaxP.Text = '' then Exit;
  GlbAsignaCuenta(edtCtaxP.Text,xcta1,xcta2,xcta3);
  ChequesDetalle(Cta1,Cta2,Cta3,qryDatosCksRegMONTO.Value,0);
  ChequesDetalle({dmdatos.qryChequesPTipoCUENTA1_CAT.Value,
                 dmdatos.qryChequesPTipoCUENTA2_CAT.Value,
                 dmdatos.qryChequesPTipoCUENTA3_CAT.Value,}
                 xcta1,xcta2,xcta3,0,qryDatosCksRegMONTO.Value);
end;

procedure TfrmElijeBcoCksReg.qryDatosCksRegAfterScroll(DataSet: TDataSet);
begin
  dmNomina.qryChequesDet.DisableControls;
  dmNomina.qryChequesDet.close;
  dmNomina.qryChequesDet.params[0].value := qryDatosCksRegNUM_TRANS.value;
  dmNomina.qryChequesDet.open;
  dmNomina.qryChequesDet.EnableControls;

  dmdatos.qryChequesPTipo.Close;
  dmdatos.qryChequesPTipo.Params[0].Value:=qryDatosCksRegTIPOSERVICIO.Value;
  dmdatos.qryChequesPTipo.Params[1].Value:=qryDatosCksRegSUBTIPOSERV.Value;
  dmdatos.qryChequesPTipo.Open;
end;

procedure TfrmElijeBcoCksReg.BitBtn3Click(Sender: TObject);
var
  cta1,cta2,cta3:String;
begin
  //Inicio Codigo Temporal para arreglar cheques Regalia
  if Messagedlg('Atencion: Esta opcion solo debe ser Procesada solo en el caso '#13''+
     'que el detalle de cada cheque no se haya salvado en el momento de generarlos.'#13''+
     '¿Continuar con el proceso?',mtwarning,[mbNo,mbYes],0)=mrno then
  exit;
  Showmessage('A continuacion Indique la fecha que fueron emitidos los cheques');
  if fechacks.Execute then
  begin
    qryDatosCksReg.Close;
    qryDatosCksReg.Params[0].Value := ExtraerFecha(Fechacks.fecha);
    qryDatosCksReg.Open;
  end else Exit;
  if dmBancos.qryBancos.Locate('codigo',StrToInt(edtTipoCks.Text),[]) then
  begin
    cta1:=dmBancos.qryBancosDetCUENTA1.Value;
    cta2:=dmBancos.qryBancosDetCUENTA2.Value;
    cta3:=dmBancos.qryBancosDetCUENTA3.Value;
  end else
  begin
    Messagedlg('Banco no tiene cuenta catalogo asignada, verifique',mtError,[mbok],0);
    exit;
  end;
  qryDatosCksReg.First;
  While Not qryDatosCksReg.eof do
  begin
    Numtrans:=qryDatosCksRegNUM_TRANS.AsInteger;
    ArreglarCksDetalles(cta1,cta2,cta3);
    qryDatosCksReg.Next;
  end;
  //Fin Codigo Temporal para arreglar cheques Regalia
end;

procedure TfrmElijeBcoCksReg.InsertarDetalle;
var
  cta1,cta2,cta3 : String;
begin
  qryDatosCksReg.Close;
  qryDatosCksReg.Params[0].Value := ExtraerFecha(XfechaCks);
  qryDatosCksReg.Open;
  if dmBancos.qryBancos.Locate('codigo',StrToInt(edtTipoCks.Text),[]) then
  begin
    cta1:=dmBancos.qryBancosDetCUENTA1.Value;
    cta2:=dmBancos.qryBancosDetCUENTA2.Value;
    cta3:=dmBancos.qryBancosDetCUENTA3.Value;
  end else
  begin
    Messagedlg('Banco no tiene cuenta catalogo asignada, verifique',mtError,[mbok],0);
    exit;
  end;
  qryDatosCksReg.First;
  While Not qryDatosCksReg.Eof do
  begin
    Numtrans:=qryDatosCksRegNUM_TRANS.AsInteger;
    ArreglarCksDetalles(Cta1,Cta2,Cta3);
    qryDatosCksReg.Next;
  end;
end;

end.
