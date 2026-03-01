unit UFormCuadreConduce;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, RxCtrls, Mask, RxToolEdit, Grids, DBGrids,
  RxDBCtrl, DB, UActivapermisos, IBCustomDataSet, IBQuery, RxMemDS, WinSkinData, DBCtrls,
  EditNew;

type
  TfrmCuadraConduce = class(TForm)
    qryConduceMaster: TIBQuery;
    qryConduceMasterFECHA: TDateTimeField;
    qryConduceMasterCODIGO_VENDEDOR: TIntegerField;
    qryConduceMasterNUMEROCONDUCE: TIntegerField;
    qryConduceMasterNUMEROFACTURA: TIBStringField;
    qryConduceMasterCODIGO_CHOFER: TIntegerField;
    qryConduceMasterNOMBRECHOFER: TIBStringField;
    qryConduceMasterNOMBRE_FACTURAR: TIBStringField;
    qryConduceMasterVALOR_TOTAL_DET: TFloatField;
    qryConduceMasterNUM_TRN: TIntegerField;
    qryConduceMasterDESPACHADO_POR: TIntegerField;
    qryConduceMasterCOD_CLIENTE: TIntegerField;
    qryConduceMasterCOD_VENDEDOR: TIntegerField;
    qryConduceMasterCOD_CHOFER: TIntegerField;
    qryConduceMasterNUM_CONDUCE: TIntegerField;
    qryConduceMasterFECHA_IN: TDateTimeField;
    qryConduceMasterIN_POR: TIBStringField;
    qryConduceMasterSTATUS: TIBStringField;
    RxDBGrid1: TRxDBGrid;
    Label1: TLabel;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    RxLabel1: TRxLabel;
    BitBtn1: TBitBtn;
    dsqryConduceMaster: TDataSource;
    rxTotal: TRxMemoryData;
    rxTotalMonto: TCurrencyField;
    SkinData1: TSkinData;
    DBText1: TDBText;
    dsrxTotal: TDataSource;
    Label2: TLabel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    qryConduceMasterFORMA_PAGO: TSmallintField;
    qryConduceMasterSTATUSCONDUCE: TIBStringField;
    Label7: TLabel;
    edtNumConduce: TEditN;
    Button1: TButton;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure qryConduceMasterAfterOpen(DataSet: TDataSet);
    procedure BitBtn2Click(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure BitBtn3Click(Sender: TObject);
    procedure PrepararDatos;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Procedure ProcesaTotales;
    Procedure RefrescarDatos;
    procedure ActivaPermisos;
  end;

var
  frmCuadraConduce: TfrmCuadraConduce;

implementation

uses UDatModConectar, UGlobal, UDatosVentas, UDatModCompania,
  USelInventario, UDatModUsuarios, UProcVentaRapida, UDatModEstudiante,
  UFormFacturas, UDatModFactura;

{$R *.dfm}

procedure TfrmCuadraConduce.BitBtn1Click(Sender: TObject);
var
  bookMark : TBookmark;
begin
  if qryConduceMaster.RecordCount > 0 then
  begin
    bookMark := qryConduceMaster.GetBookmark;
    qryConduceMaster.close;
    qryConduceMaster.Params[0].Value:=ExtraerFecha(DateEdit1.Date);
    qryConduceMaster.Params[1].Value:=ExtraerFecha(DateEdit2.Date);
    qryConduceMaster.open;
    qryConduceMaster.GotoBookmark(bookMark);
    qryConduceMaster.FreeBookmark(bookMark);
  end else
  begin
    qryConduceMaster.close;
    qryConduceMaster.Params[0].Value:=ExtraerFecha(DateEdit1.Date);
    qryConduceMaster.Params[1].Value:=ExtraerFecha(DateEdit2.Date);
    qryConduceMaster.open;
  end; 
end;

procedure TfrmCuadraConduce.FormCreate(Sender: TObject);
begin
  DateEdit1.Date:= GlbFechaTrnDiaria;
  DateEdit2.Date:= GlbFechaTrnDiaria;
  BitBtn1Click(Self);
end;

procedure TfrmCuadraConduce.ProcesaTotales;
var
  bookmark : TBookmark;
begin
  rxTotal.Close;
  rxTotal.Open;
  rxTotal.Append;
  rxTotalMonto.Value:=0;
  rxTotal.Post;
  bookmark:= qryConduceMaster.GetBookmark;
  qryConduceMaster.First;
  While not qryConduceMaster.Eof do
  begin
    if (qryConduceMasterSTATUS.Value = 'C') then
    begin
      qryConduceMaster.Next;
      Continue;
    end;
    rxTotal.Edit;
    rxTotalMonto.Value:= rxTotalMonto.Value +
    qryConduceMasterVALOR_TOTAL_DET.Value;
    rxTotal.Post;
    qryConduceMaster.Next;
  end;
  qryConduceMaster.GotoBookmark(bookmark);
  qryConduceMaster.FreeBookmark(bookmark);
end;

procedure TfrmCuadraConduce.qryConduceMasterAfterOpen(DataSet: TDataSet);
begin
  ProcesaTotales;
end;

procedure TfrmCuadraConduce.BitBtn2Click(Sender: TObject);
var
  i : integer;
  bookMark : TBookmark;
begin
  if MessageDlg('Desea cancelar conduce?',mtWarning ,[mbyes,mbno],0) = mryes then
  begin
    if RxDBGrid1.SelectedRows.Count > 0 then
    begin
      with RxDBGrid1.DataSource.DataSet do
      begin
        for i := 0 to RxDBGrid1.SelectedRows.Count-1 do
        begin
          GotoBookmark(Pointer(RxDBGrid1.SelectedRows.Items[i]));          
          dmventas.ibsqlCancelaStVtaConduce.Params[0].value:= qryConduceMasterNUM_TRN.Value;
          dmventas.ibsqlCancelaStVtaConduce.ExecQuery;
        end;
      end;
      if not dmventas.ibsqlCancelaStVtaConduce.Transaction.InTransaction then
      dmventas.ibsqlCancelaStVtaConduce.Transaction.StartTransaction;
      try
        dmventas.ibsqlCancelaStVtaConduce.Transaction.CommitRetaining;
      except
      dmventas.ibsqlCancelaStVtaConduce.Transaction.RollbackRetaining;
      end;
    end;
  end;
  RefrescarDatos;
end;


procedure TfrmCuadraConduce.ActivaPermisos;
begin

end;
procedure TfrmCuadraConduce.RefrescarDatos;
begin
  qryConduceMaster.close;
  qryConduceMaster.Params[0].Value:=ExtraerFecha(DateEdit1.Date);
  qryConduceMaster.Params[1].Value:=ExtraerFecha(DateEdit2.Date);
  qryConduceMaster.open;
end;

procedure TfrmCuadraConduce.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if (qryConduceMasterSTATUS.Value = 'C') then
  BackGround := clSilver
  else
  if (qryConduceMasterSTATUSCONDUCE.Value = 'R') then
  BackGround := clGreen;
end;

procedure TfrmCuadraConduce.BitBtn3Click(Sender: TObject);
begin
try
  GlbFacturaArtioffice:=0;//temporal hasta definir que hacer
  BitBtn1.Enabled:=False;
  dmcompania.tblCompania.Close;
  dmcompania.tblCompania.Open;
  dmCompania.tblCompania.Locate('codigo',glbCia_Key,[]);
  EsConduce:=True;
  if (GlbVenderDesdeAlmacenP = 0) then
  begin
    frmSelInventario:=TfrmSelInventario.Create(nil);
    if frmSelInventario.ShowModal = mrOk then
    begin
      dmUsuarios.qryRoles.Close;
      dmUsuarios.qryRoles.Params[0].Value:= VarUsuarioGlb;
      frmProcVentaRapida := TfrmProcVentaRapida.Create(Nil);
      dmUsuarios.qryRoles.Open;
      dmUsuarios.qryRoles.First;
      While Not dmUsuarios.qryRoles.Eof Do
      begin
        ActivaPermiso(TForm(frmProcVentaRapida),1000, dmUsuarios.qryRolesID_ROL.Value, 0);//menu principal: 1000 debe estar en la tabla PROCESOS
        dmUsuarios.qryRoles.Next;
      end;
      GlbCodDivInventario:=frmSelInventario.tblDivInventarioINVENTARIO_ID.Value;

      try
        if GlbScaledform then
        ScaleForm(frmProcVentaRapida,GlbScreenWith,GlbScreenHeight);
        frmProcVentaRapida.lblInventario.Caption :=
        frmSelInventario.tblDivInventarioDESCRIPCION.Value;
        frmProcVentaRapida.ShowModal;
      finally
      frmProcVentaRapida.Free;
      frmProcVentaRapida:= Nil;
      end;
      GlbCodDivInventario:=-1;
      BitBtn1Click(Self);
    end;
  end else
  begin
    GlbCodDivInventario:= 1;
    EsConduce:=True;
    frmProcVentaRapida := TfrmProcVentaRapida.Create(Nil);
    try
      dmUsuarios.qryRoles.Close;
      dmUsuarios.qryRoles.Params[0].Value:= VarUsuarioGlb;
      dmUsuarios.qryRoles.Open;
      dmUsuarios.qryRoles.First;
      While Not dmUsuarios.qryRoles.Eof Do
      begin
        ActivaPermiso(TForm(frmProcVentaRapida), 1000, dmUsuarios.qryRolesID_ROL.Value, 0);//menu principal: 1000 debe estar en la tabla PROCESOS
        dmUsuarios.qryRoles.Next;
      end;
      frmProcVentaRapida.lblInventario.Caption :='ALMACEN PRINCIPAL';
      PrepararDatos;
    finally
    frmProcVentaRapida.Free;
    frmProcVentaRapida:= Nil;
    end;
    GlbCodDivInventario:= -1;
    BitBtn1Click(Self);
  end;
  BitBtn1.Enabled:=True;
  except on E : Exception do
     WriteToLog (E.ClassName+' Error. Mensaje: '+E.Message);
  end;
  RefrescarDatos;
end;

procedure TfrmCuadraConduce.PrepararDatos;
begin
  frmConsultaFacturas:=TfrmConsultaFacturas.Create(Nil);
  try
    frmConsultaFacturas.EsActualizaConduce:=True; 
    //if frmConsultaFacturas.Showmodal = mrOK then
    //begin
      if (qryConduceMasterSTATUS.Value[1] in ['C','R']) then
      begin
        MessageDlg('Factura no está activa, no puede ser modificada.', mtInformation,[mbok],0);
        FreeAndNil(frmConsultaFacturas);
        exit;
      end;
      //if VerificaClave then
      //begin
        frmConsultaFacturas.EditN1.SetInteger(qryConduceMasterNUM_TRN.Value);
        frmConsultaFacturas.BitBtn1Click(Self);
        if qryConduceMasterFORMA_PAGO.Value = 1 then
        if frmConsultaFacturas.rdgContado.Checked then
        frmProcVentaRapida.esContado:=True
        else
        frmProcVentaRapida.esContado:=False;
        
        if frmProcVentaRapida.esContado then
        frmProcVentaRapida.numerodocReimp := qryConduceMasterNUM_TRN.Value
        else
        frmProcVentaRapida.numerodocReimp := qryConduceMasterNUM_TRN.Value;

        frmProcVentaRapida.LlenandoDatos:=True;
        frmProcVentaRapida.CargarDatosAModificar;
        frmProcVentaRapida.LlenandoDatos :=False;
        frmProcVentaRapida.DBEdit10Exit(Self);
        frmProcVentaRapida.Edit1Enter(Self);
        frmProcVentaRapida.ActivarBotonesEnModifica;
        frmProcVentaRapida.ShowModal;
        //bitBtnEditarFact.Left:=713;
        //bitBtnEditarFact.Left:=BitBtn6.Left;
      //end;
    //end;
  finally
  frmConsultaFacturas.Free;
  frmConsultaFacturas:= Nil;
  end;
end;

procedure TfrmCuadraConduce.Button1Click(Sender: TObject);
begin
  if edtNumConduce.ValueInteger > 0 then
  if not qryConduceMaster.Locate('NUMEROCONDUCE',edtNumConduce.ValueInteger,[])  then
  MessageDlg('Num conduce no encontrado en rango de fecha indicado, verifique.', mtInformation,[mbok],0);
end;

end.
