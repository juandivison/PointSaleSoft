unit UdatosParablcgrl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DB, StdCtrls, EditNew, Buttons, ExtCtrls, DBCtrls,
  Grids, DBGrids, IBCustomDataSet, IBQuery, WinSkinData;

type
  TfrmDatosblcgrl = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBGrid1: TDBGrid;
    TabSheet2: TTabSheet;
    DBGrid2: TDBGrid;
    DBNavigator2: TDBNavigator;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    edtDesde: TEdit;
    edtHasta: TEdit;
    Edit4: TEdit;
    Button3: TButton;
    dtpkMesBalance: TDateTimePicker;
    BitBtn1: TBitBtn;
    edtNivel: TEditN;
    chkAntesCAF: TCheckBox;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    ProgressBar1: TProgressBar;
    tFuente: TIBQuery;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    tFuenteCUENTA1_BLC: TIBStringField;
    tFuenteCUENTA2_BLC: TIBStringField;
    tFuenteCUENTA3_BLC: TIBStringField;
    tFuenteNOMBRE_CTA: TIBStringField;
    tFuenteBALANCE_ACT: TFloatField;
    tFuenteBALANCE_ANT: TFloatField;
    tFuenteSIGNO_CTA: TIBStringField;
    tFuenteMES_BALANCE: TDateTimeField;
    tFuenteNIVEL_CTA: TSmallintField;
    tFuenteTIPO_CTA: TIBStringField;
    SkinData1: TSkinData;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure chkAntesCAFClick(Sender: TObject);
  private
    { Private declarations }
    procedure ProcBalanceAct;
    procedure ProcBalanceAnt;
  public
    { Public declarations }
  end;

var
  frmDatosblcgrl: TfrmDatosblcgrl;
  dbValor, crValor : Real;
  
implementation

uses UDatModConectar, UDmRep, URepbleGrl, uglobal;

{$R *.dfm}

procedure TfrmDatosblcgrl.FormCreate(Sender: TObject);
begin
  dtpkMesBalance.Date:=Date;
end;

procedure TfrmDatosblcgrl.Button1Click(Sender: TObject);
begin
  tfuente.close;
  tfuente.Params[0].Value:= edtDesde.text;
  tfuente.Params[1].Value:= edtHasta.text;
  tfuente.Params[2].Value := ExtraerFecha(dtpkMesBalance.Date);
  tfuente.Params[3].Value := edtNivel.ValueInteger;
  tfuente.Params[4].value := edit4.text;//TIPO_CTA
  if chkAntesCAF.Checked then
  tfuente.Params[5].value :='A' //Antes del periodo fiscal
  else tfuente.Params[5].value :='D';  
  tfuente.open;
  dtmodrep.rxBalance.close;
  dtmodrep.rxBalance.emptytable;
  dtmodrep.rxBalance.open;
  progressbar1.Max:=tfuente.RecordCount;
  dbValor:=0;
  crValor:=0;
  tFuente.DisableControls;
  tFuente.first;
  with tFuente do
    begin
      first;
      while not tfuente.eof do
      begin
        progressbar1.StepIt;
        {Ignorado de manera temporal, porque se presento el caso
         de que la cuenta 113-05-00 no tenia balance en mayo-31,
         y mostraba el balance de Abril-30
         if frmDatosblcgrl.tFuenteBALANCE_ACT.value = 0 then
        ProcBalanceAnt else }
        ProcBalanceAct;
        //temporal
        {if (dtmodrep.rxBalanceCUENTA1_BLC.value = '113') and
           (dtmodrep.rxBalanceCUENTA2_BLC.value  = '05') and
           (dtmodrep.rxBalanceCUENTA3_BLC.value  = '00') then
          begin
            ShowMessage('dbValor = '+FloatToStr(dbValor)+
            ' dbValor = '+FloatToStr(CrValor));
          end;}
//Insertar en tabla destino
        if (dbValor > 0) or (crValor > 0) then
        begin
          dtmodrep.rxBalance.Insert;
          dtmodrep.rxBalanceCUENTA1_BLC.value:=tfuentecuenta1_blc.Value;
          dtmodrep.rxBalanceCUENTA2_BLC.value:=tfuentecuenta2_blc.Value;
          dtmodrep.rxBalanceCUENTA3_BLC.value:=tfuentecuenta3_blc.Value;
          dtmodrep.rxBalanceMES_BALANCE.Value:=tfuentemes_balance.Value;
          dtmodrep.rxbalancedebito.Value:=dbValor;
          dtmodrep.rxbalancecredito.Value:=crValor;
          dtmodrep.rxBalance.Post;
          dbValor:=0;
          crValor:=0;
        end;
        tfuente.next;
      end;//while
      progressbar1.position:=0;
      dtmodrep.rxBalance.SortOnFields('cuenta1_blc;cuenta2_blc;cuenta3_blc',true,false);
  end;
  //  dtmodrep.rxBalance.post;
  tFuente.EnableControls;
  Progressbar1.Position:=0;
end;

procedure TfrmDatosblcgrl.Button3Click(Sender: TObject);
begin
    if not Assigned(qckBceGral) then
    qckBceGral:=TqckBceGral.Create(nil);
  try
    qckBceGral.Prepare;
    glbTPag := qckBceGral.PageNumber;
  finally
  qckBceGral.QRPrinter.Free;
  end;
  qckBceGral:=nil;

  qckBceGral:= tqckBceGral.Create(nil);
  try
      if messageDlg('Imprimir?',mtinformation,[mbyes,mbno],0)= mryes then
      begin
        qckBceGral.PrinterSetup;
        qckBceGral.print;
      end else
    qckBceGral.preview;
  finally
  qckBceGral.free;
  qckBceGral:=nil;
  end;
end;

procedure TfrmDatosblcgrl.Button2Click(Sender: TObject);
begin
  with dtmodrep.rxBalance do
  begin
    close;
    emptytable;
    open;
  end;
end;

procedure TfrmDatosblcgrl.chkAntesCAFClick(Sender: TObject);
begin
  if chkantescaf.Checked then
  Label5.Caption := 'Antes C.'
  else Label5.Caption := 'Desp. C.';
end;

procedure TfrmDatosblcgrl.ProcBalanceAct;
begin
  if frmDatosblcgrl.tFuenteSIGNO_CTA.value = '1' then
  Begin
    if frmDatosblcgrl.tFuenteBALANCE_ACT.value < 0 then
    begin
      crValor :=abs(frmDatosblcgrl.tFuenteBALANCE_ACT.value);
    end
    else
    dbValor :=(frmDatosblcgrl.tFuenteBALANCE_ACT.value)
  end // = '1'
  else
  if frmDatosblcgrl.tFuenteSIGNO_CTA.value = '2' then
  begin
    if frmDatosblcgrl.tFuenteBALANCE_ACT.value < 0 then
    begin
      dbvalor :=abs(frmDatosblcgrl.tFuenteBALANCE_ACT.value)
    end
    else
    crvalor :=(frmDatosblcgrl.tFuenteBALANCE_ACT.value);
  end;
end;

procedure TfrmDatosblcgrl.ProcBalanceAnt;
begin
  if frmDatosblcgrl.tFuenteSIGNO_CTA.value = '1' then
  Begin
    if frmDatosblcgrl.tFuenteBALANCE_ANT.value < 0 then
    begin
      crValor :=abs(frmDatosblcgrl.tFuenteBALANCE_ANT.value);
    end
    else
      dbvalor :=(frmDatosblcgrl.tFuenteBALANCE_ANT.value)
  end // = '1'
  else
  if frmDatosblcgrl.tFuenteSIGNO_CTA.value = '2' then
  begin
    if frmDatosblcgrl.tFuenteBALANCE_ANT.value < 0 then
    begin
      dbValor :=abs(frmDatosblcgrl.tFuenteBALANCE_ANT.value)
    end
    else
       crvalor :=(frmDatosblcgrl.tFuenteBALANCE_ANT.value);
  end;
end;

end.
