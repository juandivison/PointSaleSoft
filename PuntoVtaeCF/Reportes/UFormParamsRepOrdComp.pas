unit UFormParamsRepOrdComp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WinSkinData, StdCtrls, Buttons, Mask, rxToolEdit, EditNew,
  ExtCtrls;

type
  TfrmDatosRepOrdenCompra = class(TForm)
    ComboBox1: TComboBox;
    Label1: TLabel;
    edtCodCteIni: TEditN;
    ComboBox2: TComboBox;
    Label2: TLabel;
    edtCodCteFin: TEditN;
    dbEditFechaInicial: TDateEdit;
    dbEditFechaFinal: TDateEdit;
    Label3: TLabel;
    Label4: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    SkinData1: TSkinData;
    RadioGroup1: TRadioGroup;
    chboxExportarPDF: TCheckBox;
    edtNumOrden: TEditN;
    Label5: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure edtCodCteIniExit(Sender: TObject);
    procedure edtCodCteFinExit(Sender: TObject);

  private
    { Private declarations }
  public
    orderTipo : smallint;
    labelCretrioRep : String;    
    Procedure AbrirDatos;
  end;

var
  frmDatosRepOrdenCompra: TfrmDatosRepOrdenCompra;

implementation
uses uglobal, UDatModReportes;

{$R *.dfm}

procedure TfrmDatosRepOrdenCompra.FormCreate(Sender: TObject);
begin
  dbEditFechaInicial.Date := ExtraerFecha(GlbFechaTrnDiaria);
  dbEditFechaFinal.Date := ExtraerFecha(GlbFechaTrnDiaria);
  dmReportes.qryProvInvLook.Close;
  dmReportes.qryProvInvLook.Open;
  ComboBox1.Items.Clear;
  ComboBox2.Items.Clear;
  dmReportes.qryProvInvLook.First;
  While Not dmReportes.qryProvInvLook.Eof Do
  begin
    ComboBox1.Items.Add(dmReportes.qryProvInvLookDESCRIPCION.Value);
    ComboBox2.Items.Add(dmReportes.qryProvInvLookDESCRIPCION.Value);
    dmReportes.qryProvInvLook.Next;
  end;
  ComboBox1.ItemIndex:=0;
  ComboBox1Change(Self);
  ComboBox2.ItemIndex:=0;
  ComboBox2Change(Self);
end;

procedure TfrmDatosRepOrdenCompra.ComboBox1Change(Sender: TObject);
begin
  if dmReportes.qryProvInvLook.Locate('DESCRIPCION',ComboBox1.Text,[]) then
  edtCodCteIni.SetInteger(dmReportes.qryProvInvLookCODIGO_CTE .Value);
end;

procedure TfrmDatosRepOrdenCompra.ComboBox2Change(Sender: TObject);
begin
  if dmReportes.qryProvInvLook.Locate('DESCRIPCION',ComboBox2.Text,[]) then
  edtCodCteFin.SetInteger(dmReportes.qryProvInvLookCODIGO_CTE.Value);
end;

procedure TfrmDatosRepOrdenCompra.AbrirDatos;
var
  orderByText : string;
begin
  //Reporte
  //qckListaFactXCteXProducto
  if orderTipo = 0 then
  orderByText:= ' order by CODIGO_PROVEE, NUM_ORDEN, fecha '
  else
  if orderTipo = 1 then
  orderByText:= ' order by CODIGO_PROVEE, COD_SERV_PROD, NUM_ORDEN, fecha '
  else
  if orderTipo = 2 then
  orderByText:= ' order by CODIGO_PROVEE, NUM_ORDEN, fecha ';

  dmReportes.qryDatosRepOrdenComp.Close;
  dmReportes.qryDatosRepOrdenComp.SQL.Clear;
  if (edtNumOrden.ValueInteger > 0) then
  begin
    dmReportes.qryDatosRepOrdenComp.SQL.Text:=
    dmReportes.qryDatosRepOrdenComp_base.SQL.Text + format(' Where Status_ORD in (%s) And NUM_ORDEN = %d',
    [chr(39)+'R'+chr(39), edtNumOrden.ValueInteger])+orderByText;
    labelCretrioRep:= ' Orden Número '+ edtNumOrden.Text;
  end else
  begin
    Case RadioGroup1.ItemIndex Of
    0: begin
         if (edtCodCteIni.ValueInteger >=0) And (edtCodCteFin.ValueInteger >=0) then
         dmReportes.qryDatosRepOrdenComp.SQL.Text:=
         dmReportes.qryDatosRepOrdenComp_base.SQL.Text + format(' Where Status_ORD In (%s,%s) and codigo_provee between %d and  %d',
         [chr(39)+'A'+chr(39),chr(39)+'R'+chr(39), edtCodCteIni.ValueInteger, edtCodCteFin.ValueInteger])+orderByText;
         labelCretrioRep:= ' Desde '+ edtCodCteIni.Text + ' ' +' Hasta ' + edtCodCteFin.Text;
       end;
    1: begin
         dmReportes.qryDatosRepOrdenComp.SQL.Text:=
         dmReportes.qryDatosRepOrdenComp_base.SQL.Text + format(' Where Status_ORD In (%s,%s) and  fecha between %s and  %s',
         [chr(39)+'A'+chr(39),chr(39)+'R'+chr(39),
         chr(39)+FormatDateTime('mm/dd/yyyy', dbEditFechaInicial.Date)+chr(39),
         chr(39)+FormatDateTime('mm/dd/yyyy', dbEditFechaFinal.Date)+chr(39)])+orderByText;
         labelCretrioRep:= ' Desde '+ FormatDateTime('dd/mm/yyyy', dbEditFechaInicial.Date)
         + ' ' +' Hasta '+ FormatDateTime('dd/mm/yyyy', dbEditFechaFinal.Date);
       end;
    2: begin
         dmReportes.qryDatosRepOrdenComp.SQL.Text:=
         dmReportes.qryDatosRepOrdenComp_base.SQL.Text + format(' Where Status_ORD In (%s,%s) and fecha between %s and %s',
         [chr(39)+'A'+chr(39),chr(39)+'R'+chr(39),chr(39)+FormatDateTime('mm/dd/yyyy',dbEditFechaInicial.Date)+chr(39),
         chr(39)+FormatDateTime('mm/dd/yyyy',  dbEditFechaFinal.Date)+chr(39)])+
         format(' and codigo_provee between %d and  %d ',[edtCodCteIni.ValueInteger, edtCodCteFin.ValueInteger])+
         orderByText;
         labelCretrioRep:= ' Desde '+ edtCodCteIni.Text + ' ' +' Hasta '+edtCodCteFin.Text+'-.- Del '+
         FormatDateTime('dd/mm/yyyy', dbEditFechaInicial.Date)
          + ' ' +' Al '+FormatDateTime('dd/mm/yyyy', dbEditFechaFinal.Date)
       end;
    end;
  end;
  dmReportes.qryDatosRepOrdenComp.Open;
end;

procedure TfrmDatosRepOrdenCompra.edtCodCteIniExit(Sender: TObject);
begin
  if (edtCodCteIni.Text <> '') then
  if dmReportes.qryProvInvLook.Locate('CODIGO_CTE', edtCodCteIni.ValueInteger,[]) then
  ComboBox1.Text :=  dmReportes.qryProvInvLookDESCRIPCION.Value;
end;

procedure TfrmDatosRepOrdenCompra.edtCodCteFinExit(Sender: TObject);
begin
  if (edtCodCteFin.Text <> '') then
  if dmReportes.qryProvInvLook.Locate('CODIGO_CTE', edtCodCteFin.ValueInteger,[]) then
  ComboBox2.Text :=  dmReportes.qryProvInvLookDESCRIPCION.Value;
end;

end.
