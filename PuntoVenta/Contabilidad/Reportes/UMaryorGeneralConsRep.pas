unit UMaryorGeneralConsRep;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, EditNew, Buttons, DBCtrls, RXCtrls, ExtCtrls, Grids,
  DBGrids, Db, DBTables, pr_Dataset;

type
  TfrmMayorGeneral = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    Label8: TLabel;
    Label9: TLabel;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText5: TDBText;
    Shape1: TShape;
    Shape2: TShape;
    RxSpeedButton18: TRxSpeedButton;
    DBNavigator2: TDBNavigator;
    BitBtn3: TBitBtn;
    edtCuentaIni: TEditN;
    dtpkFechaIni: TDateTimePicker;
    edtTipoDoc: TEditN;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    BitBtn2: TBitBtn;
    chkDetalle: TCheckBox;
    BitBtn4: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure RxSpeedButton18Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMayorGeneral: TfrmMayorGeneral;

implementation

Uses UDmRep, UDatmodAdm, UGlobal, URepMayorGeneral, UDatamodulocnt1,
  URepMayorDetallado, UFormaRepParaDos;

{$R *.DFM}

procedure TfrmMayorGeneral.BitBtn1Click(Sender: TObject);
var
  cI1,cI2,cI3:String;
  FilterString:String;
  Anio1,Mes1,Dia1 : Word;
begin
  if chkDetalle.Checked then
  GlbMGendet := True else GlbMGendet:=False;
  FilterString:='';
  if edtCuentaIni.Text <> '' then
  begin
    GlbAsignaCuenta(edtCuentaIni.Text,cI1,cI2,cI3);
    FilterString:=
    '     Cuenta1 = '+chr(39)+cI1+chr(39)+
    ' and Cuenta2 = '+chr(39)+cI2+chr(39)+
    ' and Cuenta3 = '+chr(39)+cI3+chr(39);
  end else
  {if edtTipoDoc.valueinteger > 0 then
  FilterString:=''
  else } FilterString:='';

  DecodeDate(dtpkFechaIni.Date,Anio1,Mes1,Dia1);
  GlbFechaInicial:= EncodeDate(anio1,mes1,1);
  GlbFechaFinal  := ExtraerFecha(dtpkFechaIni.Date);
  dtAdm.tClase_cuentas_adm.Close;
  dtAdm.tClase_cuentas_adm.Open;
  dtmodrep.qryRepMayorGen.Close;
  dtmodrep.qryrepmayorgen.Filtered := False;  
  dtmodrep.qryRepMayorGen.Params[0].Value := ExtraerFecha(GlbFechaFinal);
  {FilterString:='cuenta1 = '+chr(39)+'411'+chr(39)+
                ' or  cuenta1 = '+chr(39)+'412'+chr(39)+
                ' or  cuenta1 = '+chr(39)+'511'+chr(39);//temporal quitar divi 12-31-02}
  if FilterString<>'' then
  begin
    dtmodrep.qryrepmayorgen.Filter  := FilterString;
    dtmodrep.qryrepmayorgen.Filtered:= True;
  end;
  dtmodrep.qryTotalDbcr.Close;
  dtmodrep.qryTotalDbcr.Params[0].Value := ExtraerFecha(GlbFechaInicial);
  dtmodrep.qryTotalDbcr.Params[1].Value := ExtraerFecha(GlbFechaFinal);
  dtmodrep.qryTotalDbcr.Open;  
  dtmodrep.qryRepMayorGen.Open;
end;

procedure TfrmMayorGeneral.RxSpeedButton18Click(Sender: TObject);
begin
  dtmodrep.qryRepMayorGenDet.DisableControls;
  dtmodrep.qryrepmayorgen.DisableControls;
  if Not Assigned(qckRepMayorGeneral) then
  qckRepMayorGeneral:=TqckRepMayorGeneral.Create(Nil);
  try
    qckRepMayorGeneral.Prepare;
    glbTPag := qckRepMayorGeneral.PageNumber;
  finally
  qckRepMayorGeneral.QRPrinter.Free;
  end;
  qckRepMayorGeneral:=Nil;

  qckRepMayorGeneral:=TqckRepMayorGeneral.Create(Nil);
  try
    if MessageDlg('Imprimir?',mtinformation,[mbYes,mbNo],0)=mryes then
    begin
      qckRepMayorGeneral.printerSetup;
      qckRepMayorGeneral.Print;
    end else
    qckRepMayorGeneral.Preview;
  finally
    qckRepMayorGeneral.Free;
    qckRepMayorGeneral:=Nil;
  end;
  dtmodrep.qryRepMayorGenDet.EnableControls;
  dtmodrep.qryrepmayorgen.EnableControls;
end;

procedure TfrmMayorGeneral.FormCreate(Sender: TObject);
var
  tanio,tmes,tdia:word;
begin
  edtCuentaIni.Text:='';
  dm.qryControl.close;          // Transacciones contables
  dm.qrycontrol.Filter:=' sistema         = 1 '+
                        ' and sub_sistema = 0 '+
                        ' and cod_cia     = 2 ';
  dm.qrycontrol.Open;
  dm.qrycontrol.Filtered:=true; //Transacciones facturas
  DecodeDAte(dm.qrycontrolfecha_act.value,tanio,tmes,tdia);
  dtpkfechaIni.Date:= EncodeDate(tanio,tmes, DiasEnElMes(tanio,tmes));
  dm.qryControl.Close;
  dm.qrycontrol.Filtered:=False;
end;

procedure TfrmMayorGeneral.BitBtn2Click(Sender: TObject);
begin
  dtmodrep.qryRepMayorGenDet.DisableControls;
  dtmodrep.qryrepmayorgen.DisableControls;
  if Not Assigned(qckRepMayorGDet) then
  qckRepMayorGDet:=TqckRepMayorGDet.Create(nil);
  try
    qckRepMayorGDet.Prepare;
    glbTPag := qckRepMayorGDet.PageNumber;
  finally
  qckRepMayorGDet.QRPrinter.Free;
  end;
  qckRepMayorGDet:=nil;

  qckRepMayorGDet:=TqckRepMayorGDet.Create(nil);
  try
    if MessageDlg('Imprimir?',mtinformation,[mbYes,mbNo],0)=mryes then
    begin
      qckRepMayorGDet.printerSetup;
      qckRepMayorGDet.Print;
    end else
    qckRepMayorGDet.Preview;
  finally
    qckRepMayorGDet.Free;
    qckRepMayorGDet:=Nil;
  end;
  dtmodrep.qryRepMayorGenDet.EnableControls;
  dtmodrep.qryrepmayorgen.EnableControls;
end;

procedure TfrmMayorGeneral.BitBtn4Click(Sender: TObject);
begin
  frmRepParaDos:=TfrmRepParaDos.Create(Nil);
  try
    frmRepParaDos.ShowModal;
  finally
  frmRepParaDos.Free;
  frmRepParaDos:=Nil;
  end;
end;

procedure TfrmMayorGeneral.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dtmodrep.qryTotalDbcr.Close;
end;

end.
