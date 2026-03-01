unit UEdicionVenta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, Grids, DBGrids, RXDBCtrl, RXCtrls, StdCtrls,
  Buttons, EditNew, IBQuery;

type
  TfrmEdicionVenta = class(TForm)
    tblDatosVenta: TIBDataSet;
    tblDatosVentaNUMERO: TIntegerField;
    tblDatosVentaFECHA: TDateTimeField;
    tblDatosVentaCODIGO_CTE: TIntegerField;
    tblDatosVentaCODIGO_VENDEDOR: TIntegerField;
    tblDatosVentaFORMA_PAGO: TSmallintField;
    tblDatosVentaOBSERVACION: TIBStringField;
    tblDatosVentaMONEDA: TIBStringField;
    tblDatosVentaVALOR_TOTAL_DET: TFloatField;
    tblDatosVentaSTATUS: TIBStringField;
    tblDatosVentaFECHA_IN: TDateTimeField;
    tblDatosVentaIN_POR: TIBStringField;
    tblDatosVentaFECHA_MOD: TDateTimeField;
    tblDatosVentaMOD_POR: TIBStringField;
    tblDatosVentaNUMERO_FACTURA: TIntegerField;
    tblDatosVentaNUMERO_DOC_PAGO: TIBStringField;
    tblDatosVentaSERIE_NCF_ASIGNADO: TIntegerField;
    tblDatosVentaMONTO_BRUTO: TFloatField;
    tblDatosVentaPORC_DESCUENTO: TIntegerField;
    tblDatosVentaMONTO_DESCUENTO: TFloatField;
    RxDBGrid1: TRxDBGrid;
    dstblDatosVenta: TDataSource;
    tblDatosDet: TIBDataSet;
    tblDatosDetSERIE: TIntegerField;
    tblDatosDetNUMERO: TIntegerField;
    tblDatosDetCODIGO_PROD: TIBStringField;
    tblDatosDetCODIGO_BARRA: TIBStringField;
    tblDatosDetDESCRIPCION: TIBStringField;
    tblDatosDetCANTIDAD: TFloatField;
    tblDatosDetPRECIO: TFloatField;
    tblDatosDetPORC_DESC_DET: TFloatField;
    tblDatosDetITBI_DET: TFloatField;
    tblDatosDetVALOR_SERVICIO_DET: TFloatField;
    tblDatosDetVALOR_TOTAL_DET: TFloatField;
    tblDatosDetNUM_FACTURA: TFloatField;
    tblDatosDetSTATUS_DET: TIBStringField;
    tblDatosDetFECHA_IN: TDateTimeField;
    tblDatosDetIN_POR: TIBStringField;
    tblDatosDetFECHA_MOD: TDateTimeField;
    tblDatosDetMOD_POR: TIBStringField;
    tblDatosDetCANT_REGRESO: TFloatField;
    tblDatosDetCANT_PROMO: TFloatField;
    tblDatosDetMONTO_DIETA: TFloatField;
    tblDatosDetMONTO_AJUSTE: TFloatField;
    RxDBGrid2: TRxDBGrid;
    RxLabel1: TRxLabel;
    dstblDatosDet: TDataSource;
    BitBtn1: TBitBtn;
    DBStatusLabel1: TDBStatusLabel;
    DBStatusLabel2: TDBStatusLabel;
    BitBtn2: TBitBtn;
    Button1: TButton;
    BitBtn3: TBitBtn;
    EditN1: TEditN;
    Label1: TLabel;
    qryFechaTrn: TIBQuery;
    qryClientes: TIBQuery;
    tblDatosVentaNOMBRE_CTE: TStringField;
    qryClientesNOMBRE_CTE: TIBStringField;
    qryClientesDIRECCION_CONT: TIBStringField;
    qryClientesCEDULA: TIBStringField;
    qryClientesRNC_NUMERO: TIBStringField;
    qryClientesCIUDAD: TIBStringField;
    qryClientesTELEF_CONTACTO: TIBStringField;
    qryClientesCODIGO_CTE: TIntegerField;
    tblDatosVentaNOMBRECLIENTE: TIBStringField;
    tblDatosVentaDIRECCION_CONT: TIBStringField;
    tblDatosVentaCIUDAD: TIBStringField;
    tblDatosVentaRNC_NUMERO: TIBStringField;
    qryNCFData: TIBQuery;
    qryNCFDataNUMERO_NCF: TIBStringField;
    qryNCFDataTIPO_NCF: TIBStringField;
    qryNCFDataDESCRIPCION: TIBStringField;
    procedure tblDatosVentaAfterScroll(DataSet: TDataSet);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure RxDBGrid2GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEdicionVenta: TfrmEdicionVenta;

implementation

uses UDatModConectar, UFormSelFecha, UGlobal;

{$R *.dfm}

procedure TfrmEdicionVenta.tblDatosVentaAfterScroll(DataSet: TDataSet);
begin
  if tblDatosDet.State In [dsBrowse, dsInactive] then
  begin
    tblDatosDet.Close;
    tblDatosDet.Params[0].Value:= tblDatosVentaNUMERO.Value;
    tblDatosDet.Open;
  end;
  qryClientes.close;
  qryClientes.Params[0].Value := tblDatosVentaCODIGO_CTE.Value;
  qryClientes.open;
  qryNCFData.Close;
  qryNCFData.Params[0].Value:= tblDatosVentaSERIE_NCF_ASIGNADO.Value;
  qryNCFData.Open;
end;

procedure TfrmEdicionVenta.BitBtn1Click(Sender: TObject);
begin
  if tblDatosVenta.State In [dsEdit] then
  begin
    tblDatosVenta.Post;
    tblDatosVenta.ApplyUpdates;
    if Not tblDatosVenta.Transaction.InTransaction then
    tblDatosVenta.Transaction.StartTransaction;
    try
      tblDatosVenta.Transaction.CommitRetaining;
    except
    tblDatosVenta.Transaction.RollbackRetaining;
    end;
  end;
  if tblDatosDet.State In [dsEdit] then
  begin
    tblDatosDet.Post;
    tblDatosDet.ApplyUpdates;
    if Not tblDatosDet.Transaction.InTransaction then
    tblDatosDet.Transaction.StartTransaction;
    try
      tblDatosDet.Transaction.CommitRetaining;
    except
    tblDatosDet.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmEdicionVenta.BitBtn2Click(Sender: TObject);
begin
  if tblDatosVenta.State In [dsEdit,dsInsert] then
  begin
    tblDatosVenta.Cancel;
  end else
  begin
    if MessageDlg('Cancelar venta?', mtInformation, [mbyes, mbno], 0) = mryes then
    begin
      tblDatosVenta.Edit;
      tblDatosVentaSTATUS.Value:='C';
      tblDatosVenta.Post;
      tblDatosVenta.ApplyUpdates;
      if Not tblDatosVenta.Transaction.InTransaction then
      tblDatosVenta.Transaction.StartTransaction;
      try
        tblDatosVenta.Transaction.CommitRetaining;
      except
      tblDatosVenta.Transaction.RollbackRetaining;
      end;

      tblDatosDet.First;
      While Not tblDatosDet.Eof Do
      begin
        tblDatosDet.Edit;
        tblDatosDetSTATUS_DET.Value:='C';
        tblDatosDet.Post;
        tblDatosDet.ApplyUpdates;
        tblDatosDet.Next;
      end;
      if Not tblDatosDet.Transaction.InTransaction then
      tblDatosDet.Transaction.StartTransaction;
      try
        tblDatosDet.Transaction.CommitRetaining;
      except
      tblDatosDet.Transaction.RollbackRetaining;
      end;
    end;
  end;

  if tblDatosDet.State In [dsEdit,dsInsert] then
  tblDatosDet.Cancel;
end;

procedure TfrmEdicionVenta.Button1Click(Sender: TObject);
begin
  if Length(EditN1.Text) > 0 then
  begin
    qryFechaTrn.Close;
    qryFechaTrn.Params[0].value:= StrToInt(EditN1.Text);
    qryFechaTrn.Open;
    if qryFechaTrn.RecordCount > 0 then
    begin
      tblDatosVenta.Close;
      tblDatosVenta.Params[0].Value:= ExtraerFecha(qryFechaTrn.fieldbyname('fecha').AsDateTime);
      tblDatosVenta.Open;
      if not tblDatosVenta.Locate('NUMERO_DOC_PAGO;FORMA_PAGO', VarArrayOf([strToInt(editn1.Text),1]), []) then
      MessageDlg('Numero trn no encontrado, verifique', mtInformation, [mbOK], 0);
      Exit;
    end else
    begin
      if not tblDatosVenta.Locate('NUMERO_DOC_PAGO;forma_pago', VarArrayOf([strToInt(editn1.Text),1]),[]) then
      MessageDlg('Numero trn no encontrado, verifique',mtInformation, [mbOK], 0);
      Exit;
    end;
  end;
  frmSelFecha:=TfrmSelFecha.create(nil);
  try
    frmSelFecha.FechaIni.DateTime:=GlbFechaTrnDiaria;
    frmSelFecha.FechaFin.DateTime:=GlbFechaTrnDiaria;
    if frmSelFecha.Showmodal = mrok then
    begin
      tblDatosVenta.Close;
      tblDatosVenta.Params[0].Value:= ExtraerFecha(frmSelFecha.FechaIni.DateTime);
      tblDatosVenta.Open;
    end;
  finally
  frmSelFecha.Free;
  frmSelFecha := Nil;
  end;
end;

procedure TfrmEdicionVenta.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if (tblDatosVentaSTATUS.Value = 'C' ) then
  BackGround := clGray else
  if Length(EditN1.Text) > 0 then
  if  (tblDatosVentaNUMERO.Value =  StrToInt(EditN1.Text)) then
  Begin
    BackGround:= $0000DDDD;
    AFont.Color:=clRed;
  end;

end;

procedure TfrmEdicionVenta.RxDBGrid2GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if (tblDatosDetSTATUS_DET.Value = 'C' ) then
  BackGround := clGray;
end;

end.
