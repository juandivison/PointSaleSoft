unit UImpChequesNomina;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  db, printers, StdCtrls, DBCtrls, EditNew, ExtCtrls, Buttons, ComCtrls, RxCombos,
  RxMemDS;

type
  TFrmImpcksNomina = class(TForm)
    Label1: TLabel;
    edtCksNumIni: TEditN;
    Label2: TLabel;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    dtpkFechaini: TDateTimePicker;
    dtpkFechafin: TDateTimePicker;
    Label4: TLabel;
    Label5: TLabel;
    edtCksNumFin: TEditN;
    Label6: TLabel;
    Label7: TLabel;
    edtNumCksI: TEditN;
    Label8: TLabel;
    Button1: TButton;
    Button2: TButton;
    Label11: TLabel;
    BitBtn3: TBitBtn;
    DBText1: TDBText;
    Label12: TLabel;
    dtpkfechapago: TDateTimePicker;
    Label13: TLabel;
    Bevel1: TBevel;
    RxMemo: TRxMemoryData;
    RxMemoRxCia_Key: TIntegerField;
    RxMemoRxBanco: TIntegerField;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    DBLookupComboBox3: TDBLookupComboBox;
    DsMemo: TDataSource;
    DBRadioGroup1: TDBRadioGroup;
    RxMemoRxSubTipoCks: TIntegerField;
    DBLookupComboBox4: TDBLookupComboBox;
    Label9: TLabel;
    RxMemoRxTipoCks: TSmallintField;
    RxMemoRxTipoNomina: TIntegerField;
    Label10: TLabel;
    DBLookupComboBox5: TDBLookupComboBox;
    RxMemoRxStatus: TStringField;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBLookupComboBox1Exit(Sender: TObject);
    procedure DBLookupComboBox2Exit(Sender: TObject);
    procedure dtpkFechainiExit(Sender: TObject);
    procedure edtCksNumFinExit(Sender: TObject);
  private
    { Private declarations }
    //procedure GetFontNames;
  public
    { Public declarations }
  end;

var
  FrmImpcksNomina: TFrmImpcksNomina;

implementation
uses UDatModCheques, Uglobal, 
  UVercksDanados, UDatModNomina, URepCksNomPer,
  URepCksProg, UDatModCompania;
{$R *.DFM}

procedure TFrmImpcksNomina.BitBtn1Click(Sender: TObject);
var
  strStatuscks : String;
begin
  glbFechaPagoCks:=ExtraerFecha(dtpkfechapago.date);
  glbNumcks      :=StrToInt(edtNumCksI.text);
  glbFechaInicial := ExtraerFecha(dtpkFechaini.date);
  glbFechaFinal   := ExtraerFecha(dtpkFechafin.date);
  glbCia_Key := RxMemoRxCia_Key.Value;
  glbTipoNom := RxMemoRxTipoNomina.Value;
  glbBancos  := RxMemoRxBanco.Value;
  glbTipocks := RxMemoRxTipoCks.Value;
  glbSubTipo := RxMemoRxSubTipoCks.Value;
  glbContImpCks:=False;
  edtNumCksI.Text := IntToStr(glbProcGetNumcks('PROC_NUM_CKS',1,glbBancos));
  if (RxMemoRxStatus.Value = 'A')  Then
     Begin
       glbStatusCksNormal:=true;
       dmNomina.QryRepCksN.close;
       //fecha_emision
       dmNomina.QryRepCksN.params[0].Value:= ExtraerFecha(dtpkFechaini.date);
       dmNomina.QryRepCksN.params[1].Value:= ExtraerFecha(dtpkFechafin.date);
       dmNomina.QryRepCksN.params[2].Value:= glbCia_Key;
       dmNomina.QryRepCksN.params[3].Value:= glbTipoNom;
       dmNomina.QryRepCksN.params[4].Value:= glbBancos;
       dmNomina.QryRepCksN.params[5].Value:= glbTipocks;
       dmNomina.QryRepCksN.params[6].Value:= glbSubTipo;
       dmNomina.QryRepCksN.params[7].Value:= 'A';
       dmNomina.QryRepCksN.Open;
     End
  Else
     Begin
       if (RxMemoRxStatus.Value = 'P')  Then
       glbStatusCksNormal:=False else
       if (RxMemoRxStatus.Value = 'C') then
       Begin
         glbStatusCksNormal:=True;
         glbContImpCks:=True;
       end else Exit;
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
       dmNomina.QryRepCksN.sql.add('order by codigo_empleado, fecha_emision, NUM_TRANS');

       dmNomina.QryRepCksN.params[0].ParamType:= ptInput;
       dmNomina.QryRepCksN.params[0].DataType := ftDate;   //fechaini
       dmNomina.QryRepCksN.params[0].Value    := dtpkFechaini.date;

       dmNomina.QryRepCksN.params[1].ParamType:= ptInput;
       dmNomina.QryRepCksN.params[1].DataType := ftDate;   //fechafin
       dmNomina.QryRepCksN.params[1].Value    := dtpkFechafin.date;

       dmNomina.QryRepCksN.params[2].ParamType:= ptInput;
       dmNomina.QryRepCksN.params[2].DataType := ftInteger;//edtcodcia
       dmNomina.QryRepCksN.params[2].Value    := glbCia_Key;

       dmNomina.QryRepCksN.params[3].ParamType:= ptInput;
       dmNomina.QryRepCksN.params[3].DataType := ftInteger;//edttipoNomina
       dmNomina.QryRepCksN.params[3].Value    := glbTipoNom;

       dmNomina.QryRepCksN.params[4].ParamType:= ptInput;
       dmNomina.QryRepCksN.params[4].DataType := ftInteger;//edtcodbco
       dmNomina.QryRepCksN.params[4].Value    := glbBancos;

       dmNomina.QryRepCksN.params[5].ParamType:= ptInput;
       dmNomina.QryRepCksN.params[5].DataType := ftInteger;//tipocks
       dmNomina.QryRepCksN.params[5].Value    := glbTipocks;

       dmNomina.QryRepCksN.params[6].ParamType:= ptInput;
       dmNomina.QryRepCksN.params[6].DataType := ftInteger;//subtipo
       dmNomina.QryRepCksN.params[6].Value    := glbSubTipo;

       dmNomina.QryRepCksN.params[7].ParamType:= ptInput;
       dmNomina.QryRepCksN.params[7].DataType := ftInteger;//edtCksNumIni
       dmNomina.QryRepCksN.params[7].Value    := edtCksNumIni.ValueInteger;

       dmNomina.QryRepCksN.params[8].ParamType:= ptInput;
       dmNomina.QryRepCksN.params[8].DataType := ftInteger;//edtCksNumFin
       dmNomina.QryRepCksN.params[8].Value    := edtCksNumFin.ValueInteger;

       dmNomina.QryRepCksN.params[9].ParamType:= ptInput;
       dmNomina.QryRepCksN.params[9].DataType := ftString; //status
       dmNomina.QryRepCksN.params[9].Value    := 'P';
       dmNomina.QryRepCksN.Open;
     end;
  If (glbSubTipo = 1) then //and (frmMainCnt.Check_Int_Cks = 1) Then
     Begin
       dmNomina.QryRepNomGral.Close;
       dmNomina.QryRepNomGral.Params[0].Value := glbCia_Key;
       dmNomina.QryRepNomGral.Params[1].value := glbTipoNom;
       dmNomina.QryRepNomGral.Params[2].value := glbFechaPagoCks;
       dmNomina.QryRepNomGral.Open;
       QckRepCksNomPer:=TQckRepCksNomPer.Create(nil);
       try
         if Messagedlg('Imprimir?',mtInformation,[mbYes,mbNo],0 )= mrYes then
            Begin
              //QckRepCksNomPer.Font.Name :=tipodefuente.FontName;
              QckRepCksNomPer.PrinterSetup;
              QckRepCksNomPer.print;
            end else QckRepCksNomPer.preview;//temporal
         finally
         QckRepCksNomPer.free;
         QckRepCksNomPer:=nil;
         end;
     End
  Else
     If (glbSubTipo = 2) then //and (frmMainCnt.Check_Int_Cks = 2) Then
        Begin
          QckRepCksProg:=TQckRepCksProg.Create(nil);
          try
            if Messagedlg('Imprimir?',mtInformation,[mbYes,mbNo],0 )= mrYes then
               Begin
                 //QckRepCksProg.Font.Name :=tipodefuente.FontName;
                 QckRepCksProg.PrinterSetup;
                 QckRepCksProg.print;
               end;
               finally
               QckRepCksProg.free;
               QckRepCksProg:=nil;
               end;
        End;
  edtNumCksI.Text := IntToStr(glbProcGetNumcks('PROC_NUM_CKS',1,glbBancos));
  glbContImpCks:=False;
end;

procedure TFrmImpcksNomina.FormCreate(Sender: TObject);
var
  anio1,mes1,dia1:Word;
begin
  dtpkfechapago.date:=date;
  RxMemo.Close;
  RxMemo.EmptyTable;         
  RxMemo.Open;
  dmcompania.tblCompania.Open;
  dmNomina.QryTipoNom.close;
  dmNomina.QryTipoNom.Open;
  dmcks.qryBancos.close;
  dmcks.qryBancos.Open;
  dmcks.tTipocheque.Open;
  DmCks.QryCks_Clasif.Close;
  DmCks.QryCks_Clasif.Open;

  dtpkFechaini.DateTime:=now;
  dtpkFechafin.DateTime:=now;
  DecodeDate(date,anio1,mes1,dia1);
  if dia1 <= 14 then dia1:=15
  else if dia1 >=16 then dia1:=30;
  if (mes1 = 2) and (dia1 > 16 )then
  begin
    if IsLeapYear(anio1) then
    dia1:= 29 else dia1:= 28;
  end;
  dtpkfechapago.DateTime:=EncodeDate(anio1,mes1,dia1);
  //tipodefuente.Text:= 'Draft 10cpi';
end;

procedure TFrmImpcksNomina.Button2Click(Sender: TObject);
begin
  if printer.Printing then
  printer.Abort;
end;

procedure TFrmImpcksNomina.BitBtn3Click(Sender: TObject);
begin
  frmCksDaniados:=tfrmCksDaniados.Create(nil);
  try
    frmCksDaniados.showmodal;
  finally
  frmCksDaniados.free;
  frmCksDaniados:=nil;
  end;
end;

procedure TFrmImpcksNomina.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  RxMemo.Close;
  dmcompania.tblCompania.Close;
  dmNomina.QryTipoNom.close;
  dmcks.qryBancos.Close;
  dmcks.tTipocheque.Close;
  DmCks.QryCks_Clasif.Close;
  dmNomina.QryRepCksN.Close;
  dmNomina.QryRepNomGral.Close;
end;

procedure TFrmImpcksNomina.DBLookupComboBox1Exit(Sender: TObject);
begin
  glbTipocks := RxMemoRxTipoCks.Value;
  edtNumCksI.Text := IntToStr(glbProcGetNumcks('PROC_NUM_CKS',1,glbBancos));
end;

procedure TFrmImpcksNomina.DBLookupComboBox2Exit(Sender: TObject);
begin
  glbBancos  := RxMemoRxBanco.Value;
end;

procedure TFrmImpcksNomina.dtpkFechainiExit(Sender: TObject);
begin
  dtpkFechafin.datetime:=dtpkFechaini.DateTime;
end;

procedure TFrmImpcksNomina.edtCksNumFinExit(Sender: TObject);
var
  x : integer;
begin
  if (edtCksNumFin.ValueInteger > 0) and
     (edtCksNumIni.ValueInteger > edtCksNumFin.ValueInteger ) then
  begin
    Messagedlg('Numero cks Final es mayor que inicial, verifique',
    mtWarning,[mbOk],0);
    edtCksNumIni.SetFocus;
    edtCksNumIni.SelectAll;
  end;
  x:=edtCksNumFin.ValueInteger -  edtCksNumIni.ValueInteger;
  if Messagedlg('Seguro que quiere imprimir '+IntToStr(x)+' cheques',
  mtWarning,[mbyes,mbno],0)= mrNo then
  begin
    edtCksNumIni.SetFocus;
    edtCksNumIni.SelectAll;
  end else
  begin
    if x > 20 then
    begin
      Messagedlg('Solo se puede imprimir 20 cheques dañados, Verifique',
      mtWarning,[mbOk],0);
      edtCksNumIni.SetFocus;
      edtCksNumIni.SelectAll;      
    end;
  end;
end;

end.
