unit UFormConsultarOrdenCompra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WinSkinData, StdCtrls, ExtCtrls, Buttons, Mask, rxToolEdit,
  EditNew, Grids, DBGrids, RxDBCtrl, DB;

type
  TfrmConsultaOrdenCompra = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ComboBox1: TComboBox;
    edtCodCteIni: TEditN;
    ComboBox2: TComboBox;
    edtAsignadoA: TEditN;
    dbEditFechaInicial: TDateEdit;
    dbEditFechaFinal: TDateEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    RadioGroup1: TRadioGroup;
    SkinData1: TSkinData;
    Label5: TLabel;
    edtOrdenIni: TEditN;
    Label6: TLabel;
    edtOrdenFin: TEditN;
    RadioGroup2: TRadioGroup;
    RxDBGrid1: TRxDBGrid;
    BitBtn3: TBitBtn;
    DataSource1: TDataSource;
    BitBtn4: TBitBtn;
    CheckBox1: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure edtCodCteIniChange(Sender: TObject);
    procedure edtAsignadoAChange(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn4Click(Sender: TObject);
  private
    procedure ProcEstadoOrdenesPorProv;
    procedure ProcEstadoOrdenesPorUsuario;
    procedure ProcEstadoOrdenesPorFCreada;
    procedure ProcEstadoOrdenesPorFRecibida;
    procedure ProcEstadoOrdenesPorFRecibir;
    { Private declarations }
  public
    { Public declarations }
    orderTipo : integer;
    labelCretrioRep : String;

    Procedure Abrir;
  end;

var
  frmConsultaOrdenCompra: TfrmConsultaOrdenCompra;
   orderByText, iniCond : string;
  _statusF, _statusI : string;
  esResumen : boolean;
  
implementation

uses UDatModReportes, UREpListadoOrdenesCompra, UDatmodDatosGenerales,
  UREpListadoOrdenesCompraRes, UGlobal;

{$R *.dfm}

{ TfrmConsultaOrdenes }

procedure TfrmConsultaOrdenCompra.Abrir;
begin
  orderByText:='';
  //Reporte
  labelCretrioRep:='';
  dmReportes.qryReporteOrdenesComp.Close;
  //dmReportes.qryReporteOrdenesComp.SQL.Clear;

  _statusF:='';
   if RadioGroup2.ItemIndex = 1 then
  _statusF := 'R';

  if (RadioGroup1.ItemIndex = 4) and (RadioGroup2.ItemIndex = 2) then
  orderByText:=' Order by m.CODIGO_PROVEE, l.codigo, m.NUM_ORDEN';

  if esResumen then
  orderByText:=' order by descproveedor,CODIGO_EMPLEADO,NUM_ORDEN,COD_SERV_PROD ';

  iniCond:=format(' Where m.Fecha between %s and  %s ',[
  chr(39)+FormatDateTime('mm/dd/yyyy',dbEditFechaInicial.Date)+chr(39),
  chr(39)+FormatDateTime('mm/dd/yyyy',dbEditFechaFinal.Date)+chr(39)]);

  case RadioGroup2.ItemIndex of
  0: begin
       iniCond:=format(' Where m.Fecha between %s and  %s ',[
       chr(39)+FormatDateTime('mm/dd/yyyy',dbEditFechaInicial.Date)+chr(39),
       chr(39)+FormatDateTime('mm/dd/yyyy',dbEditFechaFinal.Date)+chr(39)]);
     end;
  1: begin
       iniCond:=format(' Where m.Fecha_recibida between %s and  %s ',[
       chr(39)+FormatDateTime('mm/dd/yyyy',dbEditFechaInicial.Date)+chr(39),
       chr(39)+FormatDateTime('mm/dd/yyyy',dbEditFechaFinal.Date)+chr(39)]);
     end;
  2: begin
       iniCond:=format(' Where m.FECHA_DEBERECIBIR between %s and  %s ',[
       chr(39)+FormatDateTime('mm/dd/yyyy',dbEditFechaInicial.Date)+chr(39),
       chr(39)+FormatDateTime('mm/dd/yyyy',dbEditFechaFinal.Date)+chr(39)]);
     end;

  end;

  if (edtCodCteIni.Text <> '') and (RadioGroup1.ItemIndex = 0) then
  iniCond:=iniCond + ' and m.CODIGO_PROVEE ='+edtCodCteIni.Text+' ';

  if (edtAsignadoA.Text <> '') and (RadioGroup1.ItemIndex = 1) then
  iniCond:=iniCond + ' and l.codigo ='+edtAsignadoA.Text+' ';

  if (edtOrdenIni.Text <> '') and (edtOrdenFin.Text <> '') then
  begin
    iniCond:=iniCond + format(' and (m.NUM_ORDEN  between %s and %s) ',
    [edtOrdenIni.Text, edtOrdenFin.Text]);
    labelCretrioRep:= ' Desde #Orden '+ edtOrdenIni.Text + ' ' +' Hasta '+edtOrdenFin.Text;
  end else
  if (edtOrdenIni.Text <> '') and (edtOrdenFin.Text = '') then
  begin
    iniCond:=iniCond + format(' and (m.NUM_ORDEN  = %s ) ',[edtOrdenIni.Text]);
    labelCretrioRep:= ' Desde #Orden '+ edtOrdenFin.Text + ' ' +' Hasta '+edtOrdenFin.Text;
  end else
  if (edtOrdenIni.Text = '') and (edtOrdenFin.Text <> '') then
  begin
    iniCond:=iniCond + format(' and (m.NUM_ORDEN = %s ) ',[edtOrdenFin.Text]);
    labelCretrioRep:= ' Desde #Orden '+ edtOrdenFin.Text + ' ' +' Hasta '+edtOrdenFin.Text;
  end;

  dmReportes.qryReporteOrdenesComp.SQL.Text:=
  dmReportes.qryReporteOrdenesComp_base.SQL.Text + iniCond + orderByText;

  if (RadioGroup2.ItemIndex = 0) and (RadioGroup1.ItemIndex = 4) then
  iniCond:=iniCond + ' and  (m.status_ord is null or m.status_ord = '+chr(39)+''+chr(39)+')'
  else
  if (RadioGroup2.ItemIndex = 1) and (RadioGroup1.ItemIndex = 4) then
  iniCond:=iniCond + ' and  (m.status_ord = '+chr(39)+'R'+chr(39)+')';  

    case RadioGroup1.ItemIndex of
    0 : begin
          ProcEstadoOrdenesPorProv;
       end;
    1 : begin
          ProcEstadoOrdenesPorFCreada;
       end;
    2 : begin
          ProcEstadoOrdenesPorUsuario;
        end;
    3 : begin
          ProcEstadoOrdenesPorFRecibida;
        end;
    4 : begin
          ProcEstadoOrdenesPorFRecibir;
        end;
    5 : begin
          dmReportes.qryReporteOrdenesComp.SQL.Text:=
          dmReportes.qryReporteOrdenesComp_base.SQL.Text + iniCond + orderByText;
        end;
    end;//case
  
  dmReportes.qryReporteOrdenesComp.Open;
end;

procedure TfrmConsultaOrdenCompra.ProcEstadoOrdenesPorFRecibida;
begin
  case RadioGroup2.ItemIndex of
  0: begin
       dmReportes.qryReporteOrdenesComp.SQL.Text:=
       dmReportes.qryReporteOrdenesComp_base.SQL.Text + iniCond +
       Format(' and  (m.status_ord is null or m.status_ord = '''') ',
       [edtCodCteIni.Text])+orderByText;
     end;
     1: begin
          dmReportes.qryReporteOrdenesComp.SQL.Text:=
          dmReportes.qryReporteOrdenesComp_base.SQL.Text + iniCond +
          Format(' and  (m.status_ord = %s) ',
          [chr(39)+'P'+chr(39)])+orderByText;
        end;
     2: begin
          dmReportes.qryReporteOrdenesComp.SQL.Text:=
          dmReportes.qryReporteOrdenesComp_base.SQL.Text + iniCond +
          orderByText;
        end;
   end;
end;

procedure TfrmConsultaOrdenCompra.ProcEstadoOrdenesPorFCreada;
begin
  case RadioGroup2.ItemIndex of
  0: begin
       dmReportes.qryReporteOrdenesComp.SQL.Text:=
       dmReportes.qryReporteOrdenesComp_base.SQL.Text + iniCond +
       Format(' and  (m.status_ord is null or m.status_ord = '''') ',
       [edtCodCteIni.Text])+orderByText;
     end;
     1: begin
          dmReportes.qryReporteOrdenesComp.SQL.Text:=
          dmReportes.qryReporteOrdenesComp_base.SQL.Text + iniCond +
          Format(' and  (m.status_ord =  %s) ',
          [chr(39)+'P'+chr(39)])+orderByText;
        end;
     2: begin
          dmReportes.qryReporteOrdenesComp.SQL.Text:=
          dmReportes.qryReporteOrdenesComp_base.SQL.Text + iniCond +
          orderByText;
        end;
   end;
end;

procedure TfrmConsultaOrdenCompra.ProcEstadoOrdenesPorUsuario;
begin
  case RadioGroup2.ItemIndex of
  0: begin
       dmReportes.qryReporteOrdenesComp.SQL.Text:=
       dmReportes.qryReporteOrdenesComp_base.SQL.Text + iniCond +
       Format(' and (l.codigo = %s) and  (m.status_ord is null or m.status_ord = '''') ',
       [edtAsignadoA.Text])+orderByText;
     end;
     1: begin
          dmReportes.qryReporteOrdenesComp.SQL.Text:=
          dmReportes.qryReporteOrdenesComp_base.SQL.Text + iniCond +
          Format('  and  (m.status_ord = %s)',
          [chr(39)+'P'+chr(39)])+orderByText;
        end;
     2: begin
          dmReportes.qryReporteOrdenesComp.SQL.Text:=
          dmReportes.qryReporteOrdenesComp_base.SQL.Text + iniCond + orderByText;
        end;
   end;
end;

procedure TfrmConsultaOrdenCompra.ProcEstadoOrdenesPorProv;
begin
  case RadioGroup2.ItemIndex of
  0: begin
       dmReportes.qryReporteOrdenesComp.SQL.Text:=
       dmReportes.qryReporteOrdenesComp_base.SQL.Text + iniCond +
       ' and (m.status_ord is null or m.status_ord = '''') '+orderByText;
     end;
  1: begin
          dmReportes.qryReporteOrdenesComp.SQL.Text:=
          dmReportes.qryReporteOrdenesComp_base.SQL.Text + iniCond +
          Format(' and  (m.status_ord = %s) ',[chr(39)+'P'+chr(39)])+orderByText;
     end;
  2: begin
      dmReportes.qryReporteOrdenesComp.SQL.Text:=
      dmReportes.qryReporteOrdenesComp_base.SQL.Text + iniCond+orderByText;
     end;
  end;
end;
procedure TfrmConsultaOrdenCompra.FormCreate(Sender: TObject);
begin
  dmReportes.qryReporteOrdenesComp.close;
  dbEditFechaInicial.Date:=now;
  dbEditFechaFinal.Date:=now;
  dmreportes.qryProvInvLook.Close;
  dmreportes.qryProvInvLook.Open;
  dmreportes.qryProvInvLook.First;
  ComboBox1.Clear;
  ComboBox1.Text:='';
  While not dmreportes.qryProvInvLook.Eof do
  begin
    ComboBox1.Items.Add(dmreportes.qryProvInvLookDESCRIPCION.Value);
    dmreportes.qryProvInvLook.Next;
  end;
  ComboBox1Change(Self);

  dmreportes.qryUsuarios.Close;
  dmreportes.qryUsuarios.Open;
  dmreportes.qryUsuarios.First;
  ComboBox2.Clear;
  ComboBox2.Text:=dmreportes.qryUsuariosNOMBRECOMPLETO.Value;
  While not dmreportes.qryUsuarios.Eof do
  begin
    ComboBox2.Items.Add(dmreportes.qryUsuariosNOMBRECOMPLETO.Value);
    dmreportes.qryUsuarios.Next;
  end;
  ComboBox2Change(Self);
end;

procedure TfrmConsultaOrdenCompra.ComboBox1Change(Sender: TObject);
begin
  if dmreportes.qryProvInvLook.Locate('DESCRIPCION',ComboBox1.Text,[]) then
  edtCodCteIni.SetInteger(dmreportes.qryProvInvLookCODIGO_CTE.Value)
  else
  edtCodCteIni.Text:='';
end;

procedure TfrmConsultaOrdenCompra.ComboBox2Change(Sender: TObject);
begin
  if dmreportes.qryUsuarios.Locate('NOMBRECOMPLETO',ComboBox2.Text,[]) then
  edtAsignadoA.SetInteger(dmreportes.qryUsuariosCODIGO_EMPLEADO.Value)
  else
  edtAsignadoA.Text:='';
end;

procedure TfrmConsultaOrdenCompra.edtCodCteIniChange(Sender: TObject);
begin
  if dmreportes.qryProvInvLook.Locate('codigo_cte',edtCodCteIni.ValueInteger,[]) then
  ComboBox1.Text :=dmreportes.qryProvInvLookDESCRIPCION.Value;
end;

procedure TfrmConsultaOrdenCompra.edtAsignadoAChange(Sender: TObject);
begin
  if dmreportes.qryUsuarios.Locate('CODIGO_EMPLEADO',edtAsignadoA.ValueInteger,[]) then
  ComboBox2.Text :=dmreportes.qryUsuariosNOMBRECOMPLETO.Value;
end;

procedure TfrmConsultaOrdenCompra.BitBtn3Click(Sender: TObject);
begin
  Abrir;
end;

procedure TfrmConsultaOrdenCompra.BitBtn1Click(Sender: TObject);
begin
  esResumen := false;
  if dmReportes.qryReporteOrdenesComp.state = dsInactive then
  BitBtn3Click(Self);

  qckListadoOrdenesCompra:=TqckListadoOrdenesCompra.Create(nil);
  try
      if RadioGroup2.ItemIndex = 1 then
      qckListadoOrdenesCompra.QRLabel3.Caption:=
      'Recibidas en fecha '+FormatDateTime('dd/MMM/yyyy', dbEditFechaInicial.Date)+'_'+FormatDateTime('dd/MMM/yyyy', dbEditFechaFinal.Date)
      else
      if RadioGroup2.ItemIndex = 2 then
      qckListadoOrdenesCompra.QRLabel3.Caption:=
      'Recibir en fecha '+FormatDateTime('dd/MMM/yyyy', dbEditFechaInicial.Date)+'_'+FormatDateTime('dd/MMM/yyyy', dbEditFechaFinal.Date)
      else
      if RadioGroup2.ItemIndex = 0 then
      qckListadoOrdenesCompra.QRLabel3.Caption:=
      'Creadas en fecha '+FormatDateTime('dd/MMM/yyyy', dbEditFechaInicial.Date)+'_'+FormatDateTime('dd/MMM/yyyy', dbEditFechaFinal.Date)
      else
      if RadioGroup2.ItemIndex = 3 then
      qckListadoOrdenesCompra.QRLabel3.Caption:='';

    qckListadoOrdenesCompra.Preview;
    if CheckBox1.Checked then
    begin
      GlbIDTipoEmail:=100;
      GlbEnviaEmail:=True;

      GlbSubject:='Relación Ordene(s) de compra(s).';
      ReportExport(qckListadoOrdenesCompra,GlbRutaInformes+'RelacionOrdenCompra'+dmdatos.qryDatosOrdenImp.Params[0].AsString+'_'+
      FormatDateTime('yyyymmdd', dbEditFechaInicial.Date)+'_'+FormatDateTime('yyyymmdd', dbEditFechaFinal.Date)+'.pdf');
      GlbIDTipoEmail:=0;
      GlbSubject:='';
    end;
  finally
  qckListadoOrdenesCompra.free;
  qckListadoOrdenesCompra:=nil;
  end;
end;


procedure TfrmConsultaOrdenCompra.RadioGroup1Click(Sender: TObject);
begin
  if (RadioGroup1.ItemIndex = 1) then
  RadioGroup2.ItemIndex := 0
  else
  if (RadioGroup1.ItemIndex = 3) then
  RadioGroup2.ItemIndex := 1;
  BitBtn3Click(Self);
end;

procedure TfrmConsultaOrdenCompra.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if (dmReportes.qryReporteOrdenesCompSTATUS_ORD.Value = 'R') then
  BackGround := clTeal;
end;

procedure TfrmConsultaOrdenCompra.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmReportes.qryReporteOrdenesComp.close;
end;

procedure TfrmConsultaOrdenCompra.BitBtn4Click(Sender: TObject);
begin
  esResumen:=true;
  if dmReportes.qryReporteOrdenesComp.state = dsInactive then
  BitBtn3Click(Self);

  qckListadoOrdenesCompraRes:=TqckListadoOrdenesCompraRes.Create(nil);
  try
    qckListadoOrdenesCompraRes.Preview;
    if CheckBox1.Checked then
    begin
      GlbIDTipoEmail:=100;
      GlbEnviaEmail:=True;
      GlbSubject:='Resumen Relación Ordene(s) de compra(s).';
      ReportExport(qckListadoOrdenesCompraRes,GlbRutaInformes+'ResumenOrdenCompra'+dmdatos.qryDatosOrdenImp.Params[0].AsString+'_'+
      FormatDateTime('yyyymmdd', dbEditFechaInicial.Date)+'_'+FormatDateTime('yyyymmdd', dbEditFechaFinal.Date)+'.pdf');
      GlbIDTipoEmail:=0;
      GlbSubject:='';
    end;
  finally
  qckListadoOrdenesCompraRes.free;
  qckListadoOrdenesCompraRes:=nil;
  end;
end;

procedure TfrmConsultaOrdenCompra.ProcEstadoOrdenesPorFRecibir;
begin
  case RadioGroup2.ItemIndex of
  0: begin
       dmReportes.qryReporteOrdenesComp.SQL.Text:=
       dmReportes.qryReporteOrdenesComp_base.SQL.Text + iniCond +
       Format(' and  (m.status_ord is null or m.status_ord = '''') ',
       [edtCodCteIni.Text])+orderByText;
     end;
     1: begin
          dmReportes.qryReporteOrdenesComp.SQL.Text:=
          dmReportes.qryReporteOrdenesComp_base.SQL.Text + iniCond +
          Format(' and  (m.status_ord = %s) ',
          [chr(39)+'P'+chr(39)])+orderByText;
        end;           //FECHA_DEBERECIBIR
     2: begin
          dmReportes.qryReporteOrdenesComp.SQL.Text:=
          dmReportes.qryReporteOrdenesComp_base.SQL.Text + iniCond +
          orderByText;
        end;
     3: begin
          dmReportes.qryReporteOrdenesComp.SQL.Text:=
          dmReportes.qryReporteOrdenesComp_base.SQL.Text + iniCond +
          orderByText;
        end;
   end;
end;

end.

{
procedure TfrmConsultaOrdenCompra.Abrir;
var
  orderByText : string;
  _statusF, _statusI : string;
begin
  orderByText:='';
  //Reporte

  if RadioGroup2.ItemIndex = 0 then
  begin
    _statusF:='';
    _statusI:='';
  end else
  if RadioGroup2.ItemIndex = 1 then
  begin
    _statusF:='P';
    _statusI:='P';
  end else
  begin
    _statusF:='';
    _statusI:='P';
  end;

  dmReportes.qryReporteOrdenesComp.Close;
  dmReportes.qryReporteOrdenesComp.SQL.Clear;

  if edtOrdenIni.ValueInteger > 0 then
  begin
    if (edtCodCteIni.ValueInteger >=0) then
    begin
      if RadioGroup2.ItemIndex = 0 then
      dmReportes.qryReporteOrdenesComp.SQL.Text:=
      dmReportes.qryReporteOrdenesComp_base.SQL.Text + format(' Where  (m.status_ord is null or m.status_ord = '''') and NUM_ORDEN Between %d and %d',
      [edtOrdenIni.ValueInteger, edtOrdenFin.ValueInteger])+orderByText
      else
      if RadioGroup2.ItemIndex = 1 then
      dmReportes.qryReporteOrdenesComp.SQL.Text:=
      dmReportes.qryReporteOrdenesComp_base.SQL.Text + format(' Where  m.status_ord in (%s,%s) and NUM_ORDEN Between %d and %d',
      [chr(39)+_statusI+chr(39),chr(39)+_statusF+chr(39),edtOrdenIni.ValueInteger, edtOrdenFin.ValueInteger])+orderByText
      else
      dmReportes.qryReporteOrdenesComp.SQL.Text:=
      dmReportes.qryReporteOrdenesComp_base.SQL.Text + format(' Where  m.status_ord in (%s,%s) and NUM_ORDEN Between %d and %d',
      [chr(39)+_statusI+chr(39),chr(39)+_statusF+chr(39),edtOrdenIni.ValueInteger, edtOrdenFin.ValueInteger])+orderByText


      labelCretrioRep:= ' Desde #Orden '+ edtOrdenIni.Text + ' ' +' Hasta '+edtOrdenFin.Text;
    end;
    dmReportes.qryReporteOrdenesComp.Open;
    Exit;
  end;
  case RadioGroup1.ItemIndex of
  0: begin
       if (edtCodCteIni.ValueInteger >=0) then
       dmReportes.qryReporteOrdenesComp.SQL.Text:=
       dmReportes.qryReporteOrdenesComp_base.SQL.Text + format(' Where status in (%s,%s) and p.CODIGO_CTE Between %d and %d',
       [chr(39)+_statusI+chr(39),chr(39)+_statusF+chr(39),edtCodCteIni.ValueInteger, edtCodCteIni.ValueInteger])+orderByText;
       
       labelCretrioRep:= ' Desde '+ edtCodCteIni.Text + ' ' +' Hasta '+edtCodCteIni.Text;
     end;
  1: begin
       dmReportes.qryReporteOrdenesComp.SQL.Text:=
       dmReportes.qryReporteOrdenesComp_base.SQL.Text + format(' Where Status in (%s,%s) and fecha between %s and  %s',
       [chr(39)+_statusI+chr(39),chr(39)+_statusF+chr(39),chr(39)+
       FormatDateTime('mm/dd/yyyy',dbEditFechaInicial.Date)+chr(39),chr(39)+
       FormatDateTime('mm/dd/yyyy',  dbEditFechaFinal.Date)+chr(39)])+orderByText;

       labelCretrioRep:= ' Desde '+ FormatDateTime('dd/mm/yyyy',dbEditFechaInicial.Date)
        + ' ' +' Hasta '+FormatDateTime('dd/mm/yyyy',dbEditFechaFinal.Date);
     end;
  2: begin
       dmReportes.qryReporteOrdenesComp.SQL.Text:=
       dmReportes.qryReporteOrdenesComp_base.SQL.Text + format(' Where Status in (%s,%s) ',
       [chr(39)+_statusI+chr(39),chr(39)+_statusF+chr(39)])+
       //,chr(39)+
       Format(' and ASIGNADO_A between %d and  %d ',[edtAsignadoA.ValueInteger, edtAsignadoA.ValueInteger])+
       orderByText;

       labelCretrioRep:= ' Desde '+ edtCodCteIni.Text + ' ' +' Hasta '+edtCodCteIni.Text+
       '-.- Del '+
       FormatDateTime('dd/mm/yyyy',dbEditFechaInicial.Date)
       + ' ' +' Al '+FormatDateTime('dd/mm/yyyy',dbEditFechaFinal.Date)
     end;
  3: begin
       dmReportes.qryReporteOrdenesComp.SQL.Text:=
       dmReportes.qryReporteOrdenesComp_base.SQL.Text + format(' Where Status in (%s,%s) ',
       [chr(39)+_statusI+chr(39),chr(39)+_statusF+chr(39)])+
       //,chr(39)+
       Format(' and FECHA_ENTREGA between %s and  %s ',[
       chr(39)+FormatDateTime('mm/dd/yyyy',dbEditFechaInicial.Date)+chr(39),
       chr(39)+FormatDateTime('mm/dd/yyyy',dbEditFechaFinal.Date)+chr(39)])+
       orderByText;

       labelCretrioRep:= ' Desde '+
       FormatDateTime('dd/mm/yyyy',dbEditFechaInicial.Date)
       + ' ' +' Al '+FormatDateTime('dd/mm/yyyy',dbEditFechaFinal.Date)
     end;
  4: begin
       dmReportes.qryReporteOrdenesComp.SQL.Text:=
       dmReportes.qryReporteOrdenesComp_base.SQL.Text + format(' Where Status in (%s,%s) ',
       [chr(39)+_statusI+chr(39),chr(39)+_statusF+chr(39)])+
       orderByText;

       labelCretrioRep:= ' Desde '+ edtCodCteIni.Text + ' ' +' Hasta '+edtCodCteIni.Text+
       '-.- Del '+
       FormatDateTime('dd/mm/yyyy',dbEditFechaInicial.Date)
       + ' ' +' Al '+FormatDateTime('dd/mm/yyyy',dbEditFechaFinal.Date)
     end;
  end;
  dmReportes.qryReporteOrdenesComp.Open;
end;
}
