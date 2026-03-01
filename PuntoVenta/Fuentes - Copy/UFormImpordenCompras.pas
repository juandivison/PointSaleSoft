unit UFormImpordenCompras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, Grids, DBGrids, RXDBCtrl,
  StdCtrls, Buttons, IBStoredProc, WinSkinData, ComCtrls;

type
  TfrmImpOrden = class(TForm)
    qryDatosOrdenAImp: TIBQuery;
    RxDBGrid1: TRxDBGrid;
    dsqryDatosOrdenAImp: TDataSource;
    BitBtn4: TBitBtn;
    BitBtn15: TBitBtn;
    BitBtn1: TBitBtn;
    stpGenNumOrden: TIBStoredProc;
    stpUpdateOrdnStatus: TIBStoredProc;
    qryDatosOrdenAImpNUMERO: TIntegerField;
    qryDatosOrdenAImpCODIGO_PROVEE: TIntegerField;
    qryDatosOrdenAImpFECHA: TDateTimeField;
    qryDatosOrdenAImpFPAGO: TSmallintField;
    qryDatosOrdenAImpCOD_CAJA_CHICA: TIntegerField;
    qryDatosOrdenAImpCODIGO_BANCO: TIntegerField;
    qryDatosOrdenAImpCUENTABANCO: TIBStringField;
    qryDatosOrdenAImpMONTO: TFloatField;
    qryDatosOrdenAImpSTATUS: TIBStringField;
    qryDatosOrdenAImpIN_POR: TIBStringField;
    qryDatosOrdenAImpFECHA_IN: TDateTimeField;
    qryDatosOrdenAImpMOD_POR: TIBStringField;
    qryDatosOrdenAImpFECHA_MOD: TDateTimeField;
    qryDatosOrdenAImpTIPO_INV: TSmallintField;
    qryDatosOrdenAImpSTATUS_CNT: TIBStringField;
    qryDatosOrdenAImpNUM_ORDEN: TIntegerField;
    qryDatosOrdenAImpSTATUS_ORD: TIBStringField;
    qryDatosOrdenAImpAREA_ORDEN: TIntegerField;
    qryDatosOrdenAImpCIA_KEY: TIntegerField;
    qryDatosOrdenAImpNOMBREPROVEEDOR: TIBStringField;
    qryDatosOrdenAImpOBSERVACION: TIBStringField;
    qryDatosOrdenAImpCODIGO_VENDEDOR: TIntegerField;
    qryDatosOrdenAImpVENDEDORCONTACTO: TIBStringField;
    SkinData1: TSkinData;
    CheckBox1: TCheckBox;
    chkEnviarEmail: TCheckBox;
    DateTimePicker1: TDateTimePicker;
    Label1: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ImpPantalla:Boolean;
  end;

var
  frmImpOrden: TfrmImpOrden;

implementation

uses UDatModConectar, UDatmodDatosGenerales, URepOrdenCompra,
  UQckOrdenCompraNew, UGlobal, UQckOrdenCompraNewBB;

{$R *.dfm}

procedure TfrmImpOrden.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmImpOrden.BitBtn15Click(Sender: TObject);
var
  NumOrdG : Integer;
begin
  stpGenNumOrden.ExecProc;
  if not stpGenNumOrden.Transaction.InTransaction then
  stpGenNumOrden.Transaction.StartTransaction;
  try
    stpGenNumOrden.Transaction.CommitRetaining;
  except
  stpGenNumOrden.Transaction.RollbackRetaining;
  end;

  dmdatos.qryOrdenMaster.Close;
  dmdatos.qryOrdenMaster.Params[0].Value := ExtraerFecha(qryDatosOrdenAImpFECHA.Value);
  dmdatos.qryOrdenMaster.Params[1].Value := ExtraerFecha(qryDatosOrdenAImpFECHA.Value);
  dmdatos.qryOrdenMaster.Open;
  try
  if stpGenNumOrden.Params[1].Value then
  NumOrdG:=dmdatos.qryOrdenMasterNUM_ORDEN.Value
  else
  NumOrdG:=stpGenNumOrden.Params[1].Value;
  except
    if not dmdatos.qryOrdenMasterNUM_ORDEN.IsNull then
    NumOrdG:=dmdatos.qryOrdenMasterNUM_ORDEN.Value
    else NumOrdG:=-1;
  end;

  if NumOrdG < 0 then exit;

  if dmdatos.qryOrdenMaster.Locate('NUM_ORDEN;NUMERO',varArrayOf([
  NumOrdG,qryDatosOrdenAImpNUMERO.Value]),[]) then
  begin
    dmdatos.qryOrdenMaster.Edit;
    dmdatos.qryOrdenMasterFECHA_DEBERECIBIR.Value:= ExtraerFecha(DateTimePicker1.DateTime);
    dmdatos.qryOrdenMasterFECHA_MOD.Value := Now;
    GlbSalvarQuery(dmdatos.qryOrdenMaster);
  end;
  qryDatosOrdenAImp.Close;
  qryDatosOrdenAImp.Open;
end;

procedure TfrmImpOrden.BitBtn4Click(Sender: TObject);
var
  i: Integer;
begin
  if RxDBGrid1.SelectedRows.Count>0 then
  begin
    with RxDBGrid1.DataSource.DataSet do
      for i:=0 to rxDBGrid1.SelectedRows.Count-1 do
      begin
        GotoBookmark(pointer(rxDBGrid1.SelectedRows.Items[i]));
        if ((qryDatosOrdenAImpNUM_ORDEN.IsNull) or (qryDatosOrdenAImpNUM_ORDEN.Value = 0)) then
        begin
          continue;
        end;
        dmdatos.qryDatosOrdenImp.Close;
        dmdatos.qryDatosOrdenImp.Params[0].Value:= qryDatosOrdenAImpNUM_ORDEN.Value;
        dmdatos.qryDatosOrdenImp.Open;
        //dmdatos.qryDatosOrdenImp.Sql.Text
        //qckOrdenDeCompraNewBB
        if (GlBBurgos = 1) then
        begin
          qckOrdenDeCompraNewBB:=TqckOrdenDeCompraNewBB.Create(Nil);
          try
            qckOrdenDeCompraNewBB.Prepare;
            if (qryDatosOrdenAImpSTATUS_ORD.Value = 'P') then
            qckOrdenDeCompraNewBB.qrLabelReImp.Enabled := True
            else
            qckOrdenDeCompraNewBB.qrLabelReImp.Enabled := False;
            //T qckOrdenDeCompraNew.qrTpaginas.Caption:= ' de '+IntToStr(qckRepOrdenCompra.PageNumber);
            if ImpPantalla then
               qckOrdenDeCompraNewBB.Preview
            else
            begin
              qckOrdenDeCompraNewBB.PrinterSetup;
              qckOrdenDeCompraNewBB.Print;
            end;
          finally
          qckOrdenDeCompraNewBB.Free;
          qckOrdenDeCompraNewBB:=Nil;
          end;
        end else
        begin
          qckOrdenDeCompraNew:=TqckOrdenDeCompraNew.Create(Nil);
          try
            qckOrdenDeCompraNew.Prepare;
            if (qryDatosOrdenAImpSTATUS_ORD.Value = 'P') then
            qckOrdenDeCompraNew.qrLabelReImp.Visible := True
            else
            qckOrdenDeCompraNew.qrLabelReImp.Visible:= False;

            //T qckOrdenDeCompraNew.qrTpaginas.Caption:= ' de '+IntToStr(qckRepOrdenCompra.PageNumber);
            if ImpPantalla then
               qckOrdenDeCompraNew.Preview
            else
            begin
              qckOrdenDeCompraNew.PrinterSetup;
              qckOrdenDeCompraNew.Print;
            end;
            if chkEnviarEmail.Checked then
            begin
              GlbIDTipoEmail:=100;
              GlbEnviaEmail:=True;
              GlbSubject:='Orden de Compra Generada';
              GlbMuestraMensajeEmail:=False;
              ReportExport(qckOrdenDeCompraNew,GlbRutaInformes+'OrdenCompraNum'+dmdatos.qryDatosOrdenImp.Params[0].AsString+'_'+
              FormatDateTime('yyyymmdd', dmdatos.qryDatosOrdenImpFECHA.Value)+'.pdf');
              GlbMuestraMensajeEmail:=True;
              GlbIDTipoEmail:=0;
              GlbSubject:='';
            end;
          finally
          qckOrdenDeCompraNew.Free;
          qckOrdenDeCompraNew:=Nil;
        end;

        stpUpdateOrdnStatus.Params[0].Value:= qryDatosOrdenAImpNUMERO.Value;
        stpUpdateOrdnStatus.Params[1].Value:= 'P';
        stpUpdateOrdnStatus.ExecProc;

        if not stpUpdateOrdnStatus.Transaction.InTransaction then
        stpUpdateOrdnStatus.Transaction.StartTransaction;
        try
          stpUpdateOrdnStatus.Transaction.CommitRetaining;
        except
        stpUpdateOrdnStatus.Transaction.RollbackRetaining;
        end;
      end;
    end;
    Exit;
  end;


  qryDatosOrdenAImp.First;
  While Not qryDatosOrdenAImp.Eof Do
  begin
    if Not qryDatosOrdenAImpNUM_ORDEN.IsNull then
    begin
      dmdatos.qryDatosOrdenImp.Close;
      dmdatos.qryDatosOrdenImp.Params[0].Value:= qryDatosOrdenAImpNUM_ORDEN.Value;
      dmdatos.qryDatosOrdenImp.Open;
        if (GlBBurgos = 1) then
        begin
          qckOrdenDeCompraNewBB:=TqckOrdenDeCompraNewBB.Create(Nil);
          try
            qckOrdenDeCompraNewBB.Prepare;
            if (qryDatosOrdenAImpSTATUS_ORD.Value = 'P') then
            qckOrdenDeCompraNewBB.qrLabelReImp.Enabled := True
            else
            qckOrdenDeCompraNewBB.qrLabelReImp.Enabled := False;            
            //T qckOrdenDeCompraNew.qrTpaginas.Caption:= ' de '+IntToStr(qckRepOrdenCompra.PageNumber);
            if ImpPantalla then
               qckOrdenDeCompraNewBB.Preview
            else
            begin
              qckOrdenDeCompraNewBB.PrinterSetup;
              qckOrdenDeCompraNewBB.Print;
            end;
          finally
          qckOrdenDeCompraNewBB.Free;
          qckOrdenDeCompraNewBB:=Nil;
          end;
        end else
        begin
          qckOrdenDeCompraNew:=TqckOrdenDeCompraNew.Create(Nil);
          try
            qckOrdenDeCompraNew.Prepare;
            if (qryDatosOrdenAImpSTATUS_ORD.Value = 'P') then
            qckOrdenDeCompraNew.qrLabelReImp.Enabled := True
            else
            qckOrdenDeCompraNew.qrLabelReImp.Enabled := False;
            //T qckOrdenDeCompraNew.qrTpaginas.Caption:= ' de '+IntToStr(qckRepOrdenCompra.PageNumber);
            if ImpPantalla then
               qckOrdenDeCompraNew.Preview
            else
            begin
              qckOrdenDeCompraNew.PrinterSetup;
              qckOrdenDeCompraNew.Print;
            end;
          finally
          qckOrdenDeCompraNew.Free;
          qckOrdenDeCompraNew:=Nil;
        end;
      end;
      {formato viejo
      qckRepOrdenCompra:=TqckRepOrdenCompra.create(Nil);
      try
        qckRepOrdenCompra.Prepare;
        if (qryDatosOrdenAImpSTATUS_ORD.Value = 'P') then
        qckRepOrdenCompra.qrLabelReImp.Enabled:=True;
        qckRepOrdenCompra.qrTpaginas.Caption:= ' de '+IntToStr(qckRepOrdenCompra.PageNumber);
        if ImpPantalla then
        qckRepOrdenCompra.Preview
        else
        begin
          qckRepOrdenCompra.PrinterSetup;
          qckRepOrdenCompra.Print;
        end;
      finally
      qckRepOrdenCompra.Free;
      qckRepOrdenCompra:=Nil;

      }//formato viejo
      stpUpdateOrdnStatus.Params[0].Value:= qryDatosOrdenAImpNUMERO.Value;
      stpUpdateOrdnStatus.Params[1].Value:= 'P';
      stpUpdateOrdnStatus.ExecProc;

      if not stpUpdateOrdnStatus.Transaction.InTransaction then
      stpUpdateOrdnStatus.Transaction.StartTransaction;
      try
        stpUpdateOrdnStatus.Transaction.CommitRetaining;
      except
      stpUpdateOrdnStatus.Transaction.RollbackRetaining;
      end;

    end;
    qryDatosOrdenAImp.Next;
  end;
  qryDatosOrdenAImp.close;
  qryDatosOrdenAImp.Open;
end;

procedure TfrmImpOrden.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.checked then
  RxDBGrid1.SelectAll
  else RxDBGrid1.Unselectall;
end;

procedure TfrmImpOrden.FormCreate(Sender: TObject);
begin
  DateTimePicker1.DateTime:=now;
end;

end.
