unit UFormPanProcesoProduccionEmp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, RxMemDS, Grids, DBGrids, RXDBCtrl, Buttons, StdCtrls,
  Math, RXCtrls, Mask, rxToolEdit, Menus;

  type
   TColumnWidthHelper = record
    Index : integer;
    MaxWidth : integer;
   end;

type
  TfrmProcProdEmpleados = class(TForm)
    rxEmpleados: TRxMemoryData;
    dsrxEmpleados: TDataSource;
    RxDBGrid1: TRxDBGrid;
    RxLabel1: TRxLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    RxLabel2: TRxLabel;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    BitBtn3: TBitBtn;
    PopupMenu1: TPopupMenu;
    EliminaRecordActual1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure ProcLlenarDatos;
    procedure RxDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure EliminaRecordActual1Click(Sender: TObject);
    procedure RxDBGrid1Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    procedure CrearTablaTemporal;
    procedure preparaDatosDia(diaI:Integer;DiaF:Integer);
    procedure FixDBGridColumnsWidth(const DBGrid: TRxDBGrid);

  public
    { Public declarations }
    tipoNomina : Integer;
  end;

var
  frmProcProdEmpleados: TfrmProcProdEmpleados;
  diaIni, diaFin : Integer;

  ColumnWidthHelper : TColumnWidthHelper;
implementation

uses UDatModPanaderia, UDatModUsuarios, Uglobal;


{$R *.dfm}

procedure TfrmProcProdEmpleados.FixDBGridColumnsWidth(const DBGrid: TRxDBGrid);
var
  i : integer;
  TotWidth : integer;
  VarWidth : integer;
  ResizableColumnCount : integer;
  AColumn : TColumn;
begin
  //total width of all columns before resize
  TotWidth := 0;
  //how to divide any extra space in the grid
  VarWidth := 0;
  //how many columns need to be auto-resized
  ResizableColumnCount := 0;

  for i := 0 to -1 + DBGrid.Columns.Count do
  begin
    TotWidth := TotWidth + DBGrid.Columns[i].Width;
    if DBGrid.Columns[i].Field.Tag <> 0 then 
      Inc(ResizableColumnCount);
  end;

  //add 1px for the column separator line
  if dgColLines in DBGrid.Options then
    TotWidth := TotWidth + DBGrid.Columns.Count;

  //add indicator column width
  if dgIndicator in DBGrid.Options then
    TotWidth := TotWidth + IndicatorWidth;

  //width vale "left"
  VarWidth :=  DBGrid.ClientWidth - TotWidth;

  //Equally distribute VarWidth
  //to all auto-resizable columns
  if ResizableColumnCount > 0 then
    VarWidth := varWidth div ResizableColumnCount;

  for i := 0 to -1 + DBGrid.Columns.Count do
  begin
    AColumn := DBGrid.Columns[i];
    if AColumn.Field.Tag <> 0 then
    begin
      AColumn.Width := AColumn.Width + VarWidth;
      if AColumn.Width < AColumn.Field.Tag then
        AColumn.Width := AColumn.Field.Tag;
    end;
  end;
end; (*FixDBGridColumnsWidth*)

procedure TfrmProcProdEmpleados.CrearTablaTemporal;
var
  diaAuxi,cont : Integer;
  {temporal,}nombrecampo:string;
begin
{  dmdatos.rxDias.close;
  dmdatos.rxDias.emptytable;
  if dmdatos.rxDias.FieldDefs.Count > 0 then
  dmdatos.rxDias.FieldDefs.Clear;
  cont:=0;
  dmdatos.rxHorasTrab.First;
  //dmdatos.rxDias.FieldDefs.Add('CodEmp',ftInteger,0,false);
  //dmdatos.rxDias.FieldDefs.Add('NombreEmpleado',ftString,80,false);
  //dmdatos.rxDias.FieldDefs.Add('Dia',ftInteger,0,false);
  //dmdatos.rxDias.FieldDefs.Add('Cant',ftFloat,0,false);


  While Not dmdatos.rxHorasTrab.Eof Do
  begin
    if cont = 0 then
    DiaAuxi:= dmdatos.rxHorasTrabDia.Value;
    if cont = 0 then
    begin
      dmdatos.rxDias.FieldDefs.Add(dmdatos.rxHorasTrabDia.AsString,ftInteger,0,false);
    end;
    if (DiaAuxi <> dmdatos.rxHorasTrabDia.Value) And (cont > 0) Then
    begin
      dmdatos.rxDias.FieldDefs.Add(dmdatos.rxHorasTrabDia.AsString,ftInteger,0,false);
      DiaAuxi:= dmdatos.rxHorasTrabDia.Value;
      Cont:=0;
    end;
    dmdatos.rxHorasTrab.Edit;
    dmdatos.rxHorasTrabIndiceCampoRxDias.value:= dmdatos.rxDias.FieldDefs.IndexOf(dmdatos.rxHorasTrabDia.AsString);
    dmdatos.rxHorasTrab.Post;
    Inc(Cont);
    dmdatos.rxHorasTrab.Next;
  end;
 dmdatos.rxDias.FieldDefs.AddFieldDef;
 dmdatos.rxDias.open;
 dmdatos.rxHorasTrab.First;
 While not dmdatos.rxHorasTrab.Eof do
 begin
   if Not dmdatos.RxDias.Locate('Codigo',
      dmdatos.rxHorasTrabCodEmp.Value,[]) then
   begin
     dmdatos.rxDias.Insert;
     nombrecampo := dmdatos.rxHorasTrabDia.AsString;
     dmdatos.rxDias.FieldByName(nombrecampo).Value :=dmdatos.rxHorasTrabCantHorasExt.Value;
     dmdatos.rxDias.FieldByName('Codigo').Value := dmdatos.rxHorasTrabCodEmp.Value;
     dmdatos.rxDias.FieldByName('Nombre').Value    := dmdatos.rxHorasTrabNombre.Value +' '+dmdatos.rxHorasTrabApellido.Value;
     dmdatos.rxDias.FieldByName('PHora').Value:= dmdatos.rxHorasTrabPHoraExt.Value;
     dmdatos.rxDias.Post;
   end else
   begin
     dmdatos.rxDias.Edit;
     nombrecampo := dmdatos.rxHorasTrabDia.AsString;
     if dmdatos.rxDias.FieldByName(Nombrecampo).IsNull then
     dmdatos.rxDias.FieldByName(Nombrecampo).Value:=0;
     dmdatos.rxDias.FieldByName(Nombrecampo).Value:=
     dmdatos.rxDias.FieldByName(Nombrecampo).Value + dmdatos.rxHorasTrabCantHorasExt.Value;
     dmdatos.rxDias.Post;
   end;
   dmdatos.rxHorasTrab.Next;
 end;
 dmdatos.rxDias.SortOnFields('Codigo',True,False);}

end;

procedure TfrmProcProdEmpleados.FormCreate(Sender: TObject);
begin
  ColumnWidthHelper.Index := -1;
  ColumnWidthHelper.MaxWidth := -1;

  DateEdit1.Date:=ExtraerFecha(GlbFechaTrnDiaria);
  DateEdit2.Date:=ExtraerFecha(GlbFechaTrnDiaria);
  diaIni := StrToInt(FormatDatetime('dd', DateEdit1.Date));
  diaFin := StrToInt(FormatDatetime('dd', DateEdit2.Date));
  preparaDatosDia(diaIni,diaFin);

  rxEmpleados.Close;
  rxEmpleados.Open;

  ProcLlenarDatos;
  //dmdatos.rxDias.FieldDefs.Add('Dia',ftInteger,0,false);

end;

procedure TfrmProcProdEmpleados.preparaDatosDia(diaI, DiaF: Integer);
 var
   x : integer;
   nombrecampo : String;
   campo : TField;
begin
  for x:=diaI to DiaF do
  begin
    nombrecampo:='v'+IntToStr(x);
    campo:=nil;
    campo := rxEmpleados.FindField(nombrecampo);
    try
    rxEmpleados.FieldDefs.Add(nombrecampo,ftInteger,0,false);
    except
      //do nothing
    end;
  end;
  rxEmpleados.FieldDefs.AddFieldDef;
end;

procedure TfrmProcProdEmpleados.BitBtn3Click(Sender: TObject);
begin
    bitbtn1.Enabled:=True;
  rxEmpleados.Close;
  diaIni := StrToInt(FormatDatetime('dd', DateEdit1.Date));
  diaFin := StrToInt(FormatDatetime('dd', DateEdit2.Date));
  preparaDatosDia(diaIni,diaFin);

  //FixDBGridColumnsWidth(rxDBGrid1);

  rxEmpleados.Close;
  rxEmpleados.Open;
  ProcLlenarDatos;
end;

procedure TfrmProcProdEmpleados.ProcLlenarDatos;
begin
  dmUsuarios.qryUsuarios.Close;
  dmUsuarios.qryUsuarios.Open;
  dmUsuarios.qryUsuarios.First;
  While Not dmUsuarios.qryUsuarios.Eof Do
  begin
    rxEmpleados.Insert;
    rxEmpleados.FieldByName('CodEmp').Value := dmUsuarios.qryUsuariosCODIGO_EMPLEADO.Value;
    rxEmpleados.FieldByName('NombreEmpleado').Value := trim(dmUsuarios.qryUsuariosNOMBRECOMPLETO.Value);
    //rxEmpleadosDia.Value:=
    rxEmpleados.Post;
    dmUsuarios.qryUsuarios.Next;
  end;
end;

procedure TfrmProcProdEmpleados.RxDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);

begin

//is this is the column we want to auto-size?
   if DataCol = ColumnWidthHelper.Index then
   begin
    //Column has field?
    if Assigned(Column.Field) then
    begin
     //find the widest string
     ColumnWidthHelper.MaxWidth := Max(ColumnWidthHelper.MaxWidth, rxDBGrid1.Canvas.TextWidth(Column.Field.DisplayText)) ;
    end;
   end;
end;

procedure TfrmProcProdEmpleados.RxDBGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin
 If Key = #13 Then Begin
    If HiWord(GetKeyState(VK_SHIFT)) <> 0 then begin
     with (Sender as TDBGrid) do
     if selectedindex > 0 then
      selectedindex := selectedindex - 1
     else begin
      DataSource.DataSet.Prior;
      selectedindex := fieldcount - 1;
     end;
    end else begin
     with (Sender as TDBGrid) do
     if selectedindex < (fieldcount - 1) then
      selectedindex := selectedindex + 1
     else begin
      DataSource.DataSet.Next;
      selectedindex := 0;
     end;
   end;
   Key := #0
   end;
end;

procedure TfrmProcProdEmpleados.EliminaRecordActual1Click(Sender: TObject);
begin
  if MessageDlg('Eliminar Record?',mtWarning,[mbyes, mbno],0)=mryes then
  rxEmpleados.Delete
end;

procedure TfrmProcProdEmpleados.RxDBGrid1Exit(Sender: TObject);
begin
  if rxEmpleados.State In [dsEdit, dsInsert] then
  rxEmpleados.Post;
end;

procedure TfrmProcProdEmpleados.BitBtn1Click(Sender: TObject);
var
  x : Integer;
  campo : TField;
  dd, mm, yy : Word;
  nombrecampo : String;
begin
  bitbtn1.Enabled:=false;
  dmPanaderia.tblPanProduccionMast.Close;
  dmPanaderia.tblPanProduccionMast.Open;

  rxEmpleados.First;
  diaIni := StrToInt(FormatDatetime('dd', DateEdit1.Date));
  diaFin := StrToInt(FormatDatetime('dd', DateEdit2.Date));
  dmPanaderia.tblPanReqMateriaPMast.Close;
  dmPanaderia.tblPanReqMateriaPMast.Params[0].Value:= ExtraerFecha(DateEdit1.Date);
  dmPanaderia.tblPanReqMateriaPMast.Params[1].Value:= ExtraerFecha(DateEdit2.Date);
  dmPanaderia.tblPanReqMateriaPMast.Open;

  While Not rxEmpleados.Eof Do
  begin
    if rxEmpleados.fieldbyname('Precio').IsNull or
    (rxEmpleados.fieldbyname('Precio').Value = 0) then
    begin
      rxEmpleados.Next;
      Continue;
    end;
    dmPanaderia.tblPanProduccionMast.Insert;
    dmPanaderia.tblPanProduccionMastCIA_KEY.Value:= GlbCodigoCia;
    dmPanaderia.tblPanProduccionMastFECHA_PRODUCCION.Value:=ExtraerFecha(DateEdit1.Date);
    dmPanaderia.tblPanProduccionMastTIPO_NOMINA.Value :=tipoNomina;
    dmPanaderia.tblPanProduccionMastCOD_EMPLEADO.Value:= rxEmpleados.fieldbyname('CodEmp').Value;
    dmPanaderia.tblPanProduccionMastSTATUS.Value:='A';
    dmPanaderia.tblPanProduccionMast.Post;
    dmPanaderia.tblPanProduccionMast.ApplyUpdates;
    if Not dmPanaderia.tblPanProduccionMast.Transaction.InTransaction then
    dmPanaderia.tblPanProduccionMast.Transaction.StartTransaction;
    try
      dmPanaderia.tblPanProduccionMast.Transaction.CommitRetaining;
    except
    dmPanaderia.tblPanProduccionMast.Transaction.RollbackRetaining;
    end;

    for x:=diaIni to diaFin do
    begin
      if rxEmpleados.fieldbyname('Precio').IsNull or
      (rxEmpleados.fieldbyname('Precio').Value = 0) then
      continue;
      
      DecodeDate(DateEdit1.Date, yy, mm, dd);
      nombrecampo:='v'+IntToStr(x);
      campo:=nil;
      campo:= rxEmpleados.FindField(nombrecampo);
      if dmPanaderia.tblPanProduccionDet.State = dsInactive then
      dmPanaderia.tblPanProduccionDet.Open;
      try
        dmPanaderia.tblPanProduccionDet.Insert;
        dmPanaderia.tblPanProduccionDetID_PRODUCCION.Value:= dmPanaderia.tblPanProduccionMastID_PRODUCCION.Value;
        dmPanaderia.tblPanProduccionDetFECHA.Value:=EncodeDate(yy, mm, x);
        dmPanaderia.tblPanProduccionDetCANTIDAD.Value := rxEmpleados.fieldbyname(nombrecampo).Value;
        dmPanaderia.tblPanProduccionDetCOD_EMPLEADO.Value:=rxEmpleados.fieldbyname('CodEmp').Value;
        dmPanaderia.tblPanProduccionDetPrecio.Value   := rxEmpleados.fieldbyname('Precio').Value;
        dmPanaderia.tblPanProduccionDetDESCRIPCION.Value:='Produccion';
        dmPanaderia.tblPanProduccionDetSTATUS.Value   := 'A';
        dmPanaderia.tblPanProduccionDetFECHA_IN.Value := Now;
        dmPanaderia.tblPanProduccionDetIN_POR.Value   := StrUserName;
        dmPanaderia.tblPanProduccionDet.Post;
        dmPanaderia.tblPanProduccionDet.ApplyUpdates;
        if Not dmPanaderia.tblPanProduccionDet.Transaction.InTransaction then
           dmPanaderia.tblPanProduccionDet.Transaction.StartTransaction;
           try
             dmPanaderia.tblPanProduccionDet.Transaction.CommitRetaining;
           except
           dmPanaderia.tblPanProduccionDet.Transaction.RollbackRetaining;
           end;
        except
        //do nothing
        end;
    end;
    rxEmpleados.Next;
  end;
end;

end.
