unit UChequesRegalia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Printers, RxMemDS, StdCtrls, ExtCtrls, DBCtrls, RxCombos, ComCtrls, Buttons,
  EditNew;

type
  TfrmCksRegalia = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label11: TLabel;
    DBText1: TDBText;
    Label12: TLabel;
    Label13: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    edtCksNumIni: TEditN;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    dtpkFechaini: TDateTimePicker;
    edtCksNumFin: TEditN;
    edtNumCksI: TEditN;
    Button1: TButton;
    Button2: TButton;
    BitBtn3: TBitBtn;
    dtpkfechapago: TDateTimePicker;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    DBLookupComboBox3: TDBLookupComboBox;
    DBRadioGroup1: TDBRadioGroup;
    DBLookupComboBox4: TDBLookupComboBox;
    DBLookupComboBox5: TDBLookupComboBox;
    RxMemo: TRxMemoryData;
    RxMemoRxCia_Key: TIntegerField;
    RxMemoRxTipoNomina: TIntegerField;
    RxMemoRxBanco: TIntegerField;
    RxMemoRxTipoCks: TSmallintField;
    RxMemoRxSubTipoCks: TIntegerField;
    RxMemoRxStatus: TStringField;
    DsMemo: TDataSource;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DBLookupComboBox1Exit(Sender: TObject);
    procedure DBLookupComboBox2Exit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCksRegalia: TfrmCksRegalia;

implementation

uses UDatModNomina, URepCksNomPer,UGlobal, UMenuPrincipal, URepCksProg,
  UVercksDanados, UCksRegalia, UDatModCheques, UDatModCompania,
  UDatModBanco;

{$R *.DFM}

procedure TfrmCksRegalia.BitBtn1Click(Sender: TObject);
begin
  glbFechaPagoCks:=ExtraerFecha(dtpkfechapago.date);
  glbNumcks:=StrToInt(edtNumCksI.text);
  glbFechaInicial := ExtraerFecha(dtpkFechaini.date);
//glbFechaFinal   := ExtraerFecha(dtpkFechafin.date);
  glbCia_Key := RxMemoRxCia_Key.Value;
  glbTipoNom := RxMemoRxTipoNomina.Value;
  glbBancos  := RxMemoRxBanco.Value;
  glbTipocks := RxMemoRxTipoCks.Value;
  glbSubTipo := RxMemoRxSubTipoCks.Value;
  edtNumCksI.Text := IntToStr(glbProcGetNumcks('PROC_NUM_CKS',1,glbBancos));
  if RxMemoRxStatus.Value = 'A' Then
     Begin
       glbStatusCksNormal:=true;
       dmNomina.QryRepCksN.close;
       //fecha_emision
       dmNomina.QryRepCksN.params[0].Value:= ExtraerFecha(dtpkFechaini.date);
       dmNomina.QryRepCksN.params[1].Value:= ExtraerFecha(dtpkFechaini.date);
       dmNomina.QryRepCksN.params[2].Value:= glbCia_Key;
       dmNomina.QryRepCksN.params[3].Value:= glbTipoNom;
       dmNomina.QryRepCksN.params[4].Value:= glbBancos;
       dmNomina.QryRepCksN.params[5].Value:= glbTipocks;
       dmNomina.QryRepCksN.params[6].Value:= glbSubTipo;
       dmNomina.QryRepCksN.params[7].Value:= 'A';
       dmNomina.QryRepCksN.open;
     End
  Else
     Begin
       glbStatusCksNormal:=False;
       if (edtcksnumini.ValueInteger <=0) or
          (edtcksnumfin.ValueInteger <=0) then
           begin
             edtcksnumini.setfocus;
             edtcksnumini.SelectAll;
             exit;
           end;
       dmNomina.QryRepCksN.sql.clear;
       dmNomina.QryRepCksN.sql.add('select * from cheques_Nomina');
       dmNomina.QryRepCksN.sql.add('where fecha_emision between :fechaini and :fechafin');
       dmNomina.QryRepCksN.sql.add('and codigo_cia = :edtcodcia');
       dmNomina.QryRepCksN.sql.add('and Tipo_Nomina = :edttiponomina');
       dmNomina.QryRepCksN.sql.add('and cod_banco  = :edtCodBco');
       dmNomina.QryRepCksN.sql.add('and Tipo_Cks   = :TipoCks');
       dmNomina.QryRepCksN.sql.add('and SubTipo    = :SubTipo');
       dmNomina.QryRepCksN.sql.add('and numero_cks between :numeroini and :numerofin');
       dmNomina.QryRepCksN.sql.add('and status     = :status');
       dmNomina.QryRepCksN.sql.add('order by fecha_emision, NUM_TRANS');

       dmNomina.QryRepCksN.params[0].ParamType:= ptInput;
       dmNomina.QryRepCksN.params[0].DataType := ftDate;   //fechaini
       dmNomina.QryRepCksN.params[0].Value    := dtpkFechaini.date;

       dmNomina.QryRepCksN.params[1].ParamType:= ptInput;
       dmNomina.QryRepCksN.params[1].DataType := ftDate;   //fechafin
       dmNomina.QryRepCksN.params[1].Value    := dtpkFechaini.date;

       dmNomina.QryRepCksN.params[2].ParamType:= ptInput;
       dmNomina.QryRepCksN.params[2].DataType := ftInteger;//edtcodcia
       dmNomina.QryRepCksN.params[2].Value    := glbCia_Key;

       dmNomina.QryRepCksN.params[3].ParamType:= ptInput;
       dmNomina.QryRepCksN.params[3].DataType := ftInteger;//edttipoNomina
       dmnomina.QryRepCksN.params[3].Value    := glbTipoNom;

       dmnomina.QryRepCksN.params[4].ParamType:= ptInput;
       dmnomina.QryRepCksN.params[4].DataType := ftInteger;//edtcodbco
       dmnomina.QryRepCksN.params[4].Value    := glbBancos;

       dmnomina.QryRepCksN.params[5].ParamType:= ptInput;
       dmnomina.QryRepCksN.params[5].DataType := ftInteger;//tipocks
       dmnomina.QryRepCksN.params[5].Value    := glbTipocks;

       dmnomina.QryRepCksN.params[6].ParamType:= ptInput;
       dmnomina.QryRepCksN.params[6].DataType := ftInteger;//subtipo
       dmnomina.QryRepCksN.params[6].Value    := glbSubTipo;

       dmnomina.QryRepCksN.params[7].ParamType:= ptInput;
       dmnomina.QryRepCksN.params[7].DataType := ftInteger;//edtCksNumIni
       dmnomina.QryRepCksN.params[7].Value    := edtCksNumIni.ValueInteger;

       dmnomina.QryRepCksN.params[8].ParamType:= ptInput;
       dmnomina.QryRepCksN.params[8].DataType := ftInteger;//edtCksNumFin
       dmNomina.QryRepCksN.params[8].Value    := edtCksNumFin.ValueInteger;

       dmnomina.QryRepCksN.params[9].ParamType:= ptInput;
       dmnomina.QryRepCksN.params[9].DataType := ftString; //status
       dmnomina.QryRepCksN.params[9].Value    := 'P';
       dmnomina.QryRepCksN.Open;
     end;
  If (glbSubTipo = 4) then //and (frmMainCnt.Check_Int_Cks = 0) Then
     Begin
       dmnomina.QryRepNomGral.Close;
       dmnomina.QryRepNomGral.Params[0].Value := glbCia_Key;
       dmnomina.QryRepNomGral.Params[1].value := glbTipoNom;
       dmnomina.QryRepNomGral.Params[2].value := glbFechaPagoCks;
       dmnomina.QryRepNomGral.Open;
       qckCksRegalia:=TqckCksRegalia.Create(nil);
       try
         if Messagedlg('Imprimir?',mtInformation,[mbYes,mbNo],0 )= mrYes then
            Begin
              //qckCksRegalia.Font.Name :=tipodefuente.FontName;
              qckCksRegalia.PrinterSetup;
              qckCksRegalia.print;
            end else qckCksRegalia.Preview;//temporal
         finally
         qckCksRegalia.free;
         qckCksRegalia:=nil;
         end;
     End;
  edtNumCksI.Text := IntToStr(glbProcGetNumcks('PROC_NUM_CKS',1,glbBancos));
end;

procedure TfrmCksRegalia.BitBtn3Click(Sender: TObject);
begin
  frmCksDaniados:=tfrmCksDaniados.Create(nil);
  try
    frmCksDaniados.showmodal;
  finally
  frmCksDaniados.free;
  frmCksDaniados:=nil;
  end;
end;

procedure TfrmCksRegalia.Button1Click(Sender: TObject);
begin
  {if not Assigned(qckRepprueba) then
  qckRepprueba:=TqckRepprueba.create(nil);
  try
    //qckRepprueba.Font.Name :=tipodefuente.FontName;
    qckRepprueba.print;
  finally
  qckRepprueba.free;
  qckRepprueba:=nil;
  end;}
end;

procedure TfrmCksRegalia.Button2Click(Sender: TObject);
begin
  if printer.Printing then
  printer.Abort;
end;

procedure TfrmCksRegalia.DBLookupComboBox1Exit(Sender: TObject);
begin
  glbTipocks := RxMemoRxTipoCks.Value;
  edtNumCksI.Text := IntToStr(glbProcGetNumcks('PROC_NUM_CKS',1,glbBancos));
end;

procedure TfrmCksRegalia.DBLookupComboBox2Exit(Sender: TObject);
begin
  glbBancos  := RxMemoRxBanco.Value;
end;

procedure TfrmCksRegalia.FormCreate(Sender: TObject);
begin
  dtpkfechapago.date:=date;
  RxMemo.Close;
  RxMemo.EmptyTable;
  RxMemo.Open;
  dmcompania.tblCompania.Open;
  dmnomina.QryTipoNom.close;
  dmnomina.QryTipoNom.Open;
  dmbancos.qryBancos.close;
  dmbancos.qryBancos.Open;
  dmcks.tblTipoCheque.Close;
  dmcks.tblTipoCheque.Open;
  DmCks.QryCks_Clasif.Close;
  DmCks.QryCks_Clasif.Open;

  dtpkFechaini.DateTime:=now;
//  dtpkFechafin.DateTime:=now;

  //tipodefuente.Text:= 'Draft 10cpi';
end;

end.
