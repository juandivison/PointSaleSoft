unit UFormConsultaTransf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, RxToolEdit, EditNew, Grids,
  DBGrids, RxDBCtrl, DB, IBCustomDataSet, IBQuery, WinSkinData, ComCtrls;

type
  TfrmConsultaTransf = class(TForm)
    Label6: TLabel;
    edtNumTransf: TEditN;
    Label3: TLabel;
    Label4: TLabel;
    RadioGroup1: TRadioGroup;
    BitBtn2: TBitBtn;
    chboxExportarPDF: TCheckBox;
    cBoxBanco: TComboBox;
    Label1: TLabel;
    CheckBox1: TCheckBox;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    RxDBGrid1: TRxDBGrid;
    qryDatosRepVentaDiaria_0: TIBQuery;
    SkinData1: TSkinData;
    dsqryDatosRepVentaDiaria: TDataSource;
    Edit1: TEdit;
    Label2: TLabel;
    BitBtn4: TBitBtn;
    rdgOrden: TRadioGroup;
    dbEditFechaInicial: TDateTimePicker;
    dbEditFechaFinal: TDateTimePicker;
    procedure FormCreate(Sender: TObject);
    procedure cBoxBancoChange(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaTransf: TfrmConsultaTransf;
  labelCretrioRep : string;
implementation

uses UDatModCxc, UDatModReportes, UGlobal, URepVentaDiaria, URepItebis;

{$R *.dfm}

procedure TfrmConsultaTransf.FormCreate(Sender: TObject);
begin
  labelCretrioRep:='';
  dbEditFechaInicial.Date:= GlbFechaTrnDiaria;
  dbEditFechaFinal.Date  := GlbFechaTrnDiaria;
  cBoxBanco.Clear;
  dmcxc.qryBancos.Close;
  dmcxc.qryBancos.Params[0].Value:= glbCia_Key;
  dmcxc.qryBancos.Open;
  dmcxc.qryBancos.First;
  while not dmcxc.qryBancos.eof do
  begin
    cBoxBanco.Items.Add(dmcxc.qryBancosDESCRIPCION.Value);
    dmcxc.qryBancos.Next;
  end;
  dmcxc.qryBancos.first;
  cBoxBanco.Text:=dmcxc.qryBancosDESCRIPCION.Value;
end;

procedure TfrmConsultaTransf.cBoxBancoChange(Sender: TObject);
begin
  dmcxc.qryBancos.Locate('DESCRIPCION',cBoxBanco.Text,[]);
end;

procedure TfrmConsultaTransf.BitBtn3Click(Sender: TObject);
var
   strCond : string;
   strOrden : string;
begin
  {
  Where moneda between :monedaini and :monedafin
  ORDER BY tipo_documento, moneda, CODIGO_EMPLEADO, moneda, tipo_doc, tipo_tranf, FECHA,
  NUMERO_DOCUMENTO, CODIGO_CLIENTE
  }
  labelCretrioRep:='';
  dmReportes.qryDatosRepVentaDiaria.Params[0].Value:= ExtraerFecha(dbEditFechaInicial.Date);
  dmReportes.qryDatosRepVentaDiaria.Params[1].Value:= ExtraerFecha(dbEditFechaFinal.Date);
  dmReportes.qryDatosRepVentaDiaria.Params[2].Value:= GlbCodigoCia;
  //dmReportes.qryDatosRepVentaDiaria.Params[2].Value:= '1';
  //dmReportes.qryDatosRepVentaDiaria.Params[3].Value:= '1';
  if (edtNumTransf.Text <> '') then
  begin
    strCond:=' Where r.NUM_TRANSFERENCIA = ' + edtNumTransf.Text;
    labelCretrioRep:='PorNumTransf';
  end;
  if not CheckBox1.Checked then
  if (dmcxc.qryBancosCODIGO.Text <> '') then
  begin
    if (edtNumTransf.Text <> '') then
    strCond:=strCond + ' and t.CODIGO_BANCO = '+dmcxc.qryBancosCODIGO.AsString
    else
    strCond:=strCond + ' Where t.CODIGO_BANCO = '+dmcxc.qryBancosCODIGO.AsString;
  end;

  case RadioGroup1.ItemIndex of
  0: begin       //Solo Fecha
       if rdgOrden.ItemIndex = 1 then
       strOrden:=' Order by r.fecha, r.tipo_documento'
       else strOrden:=' Order by r.fecha, r.tipo_documento DESC';
     end;
  1: begin
       if rdgOrden.ItemIndex = 1 then
       strOrden:=' Order by r.codigo_empleado DESC ,r.fecha,r.tipo_documento'
       else strOrden:=' Order by r.codigo_empleado,r.fecha,r.tipo_documento';
     end;
  2: begin
       if rdgOrden.ItemIndex = 1 then
       strOrden:=' Order by r.NUM_TRANSFERENCIA DESC, r.fecha,r.tipo_documento'
       else
       strOrden:=' Order by r.NUM_TRANSFERENCIA, r.fecha,r.tipo_documento';
     end;
  3: begin
       if rdgOrden.ItemIndex = 1 then
       strOrden:=' Order by t.CODIGO_BANCO desc, r.fecha,r.tipo_documento'
       else strOrden:=' Order by t.CODIGO_BANCO, r.fecha,r.tipo_documento';
     end;
  end;
  if rdgOrden.ItemIndex = 0 then
  strOrden:=strOrden + ' ASC'
  else strOrden:=strOrden + ' DESC';
  dmReportes.qryDatosRepVentaDiaria.SQL.Text :=
  qryDatosRepVentaDiaria_0.SQL.Text + strcond + strOrden;

  dmReportes.qryDatosRepVentaDiaria.SQL.Text:=
  StringReplace(dmReportes.qryDatosRepVentaDiaria.SQL.Text,'DESC ASC','ASC',[rfIgnoreCase,rfReplaceAll]);
  dmReportes.qryDatosRepVentaDiaria.SQL.Text:=
  StringReplace(dmReportes.qryDatosRepVentaDiaria.SQL.Text,'DESC DESC','DESC',[rfIgnoreCase,rfReplaceAll]);
  dmReportes.qryDatosRepVentaDiaria.SQL.Text:=
  StringReplace(dmReportes.qryDatosRepVentaDiaria.SQL.Text,'ASC DESC','DESC',[rfIgnoreCase,rfReplaceAll]);

    dmReportes.qryDatosRepVentaDiaria.SQL.Text:=
  StringReplace(dmReportes.qryDatosRepVentaDiaria.SQL.Text,'ASC ASC','ASC',[rfIgnoreCase,rfReplaceAll]);

  dmReportes.qryDatosRepVentaDiaria.Filtered:=false;

  dmReportes.qryDatosRepVentaDiaria.Open;
  if (dmReportes.qryDatosRepVentaDiaria.RecordCount > 0) then
  begin
    Edit1.Enabled  := True;
    BitBtn1.Enabled:= True;
    BitBtn4.Enabled:= True;
  end;
end;

procedure TfrmConsultaTransf.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
  CheckBox1.Caption:='Banco Sel...'
  else CheckBox1.Caption:='Todos';
end;

procedure TfrmConsultaTransf.Edit1Change(Sender: TObject);
begin
  dmReportes.qryDatosRepVentaDiaria.Locate('NUM_TRANSFERENCIA',Edit1.Text,[]);
end;

procedure TfrmConsultaTransf.BitBtn1Click(Sender: TObject);
begin
  qckRepVentaDiaria:=tQckRepVentaDiaria.Create(Nil);
  try
    qckRepVentaDiaria.QRLabel2.Caption := 'LISTADO INGRESOS CXC';
    qckRepVentaDiaria.PrinterSettings.PrinterIndex:=GetImpresorarpt(2,12);
    qckRepVentaDiaria.Prepare;
    qckRepVentaDiaria.qrTpaginas.Caption:= ' de '+IntToStr(qckRepVentaDiaria.PageNumber);
    qckRepVentaDiaria.QRLabel14.Caption := '';
    qckRepVentaDiaria.ChildBand1.Enabled:= False;
    qckRepVentaDiaria.QRLabel10.Caption:='#Transf';
    qckRepVentaDiaria.QRDBText6.DataField:='NUM_TRANSFERENCIA';
    if MessageDlg('Imprimir?', mtInformation, [mbyes, mbno], 0) = mrYes then
    begin
      qckRepVentaDiaria.PrinterSetup;
      qckRepVentaDiaria.Print;
    end else
    qckRepVentaDiaria.Preview;

    if chboxExportarPDF.Checked then
    ReportExport(qckRepVentaDiaria,GlbRutaInformes+'\ReporteDeIngresos.pdf');

  finally
  qckRepVentaDiaria.Free;
  qckRepVentaDiaria:= Nil;
  
  dmReportes.qryDatosRepVentaDiaria.Filtered:= False;
  end;
end;

procedure TfrmConsultaTransf.BitBtn4Click(Sender: TObject);
begin
  GLBMostrarArchivo:=True;
  ExporToExcel(dmReportes.qryDatosRepVentaDiaria,
  ExtractFilePath(Application.ExeName)+
  'Informes\ReporteDeIngresos_'+labelCretrioRep,true);
  GLBMostrarArchivo:=False;
end;

end.
