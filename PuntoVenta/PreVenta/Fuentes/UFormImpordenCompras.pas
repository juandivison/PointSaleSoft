unit UFormImpordenCompras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, Grids, DBGrids, RXDBCtrl,
  StdCtrls, Buttons, IBStoredProc;

type
  TfrmImpOrden = class(TForm)
    qryDatosOrdenAImp: TIBQuery;
    RxDBGrid1: TRxDBGrid;
    dsqryDatosOrdenAImp: TDataSource;
    qryDatosOrdenAImpNUMERO: TIntegerField;
    qryDatosOrdenAImpCODIGO_PROVEE: TIntegerField;
    qryDatosOrdenAImpFECHA: TDateTimeField;
    qryDatosOrdenAImpFPAGO: TSmallintField;
    qryDatosOrdenAImpCOD_CAJA_CHICA: TIntegerField;
    qryDatosOrdenAImpCODIGO_BANCO: TIntegerField;
    qryDatosOrdenAImpCUENTABANCO: TIBStringField;
    qryDatosOrdenAImpOBSERVACION: TIBStringField;
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
    qryDatosOrdenAImpNOMBREPROVEEDOR: TIBStringField;
    BitBtn4: TBitBtn;
    BitBtn15: TBitBtn;
    BitBtn1: TBitBtn;
    stpGenNumOrden: TIBStoredProc;
    stpUpdateOrdnStatus: TIBStoredProc;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ImpPantalla:Boolean;
  end;

var
  frmImpOrden: TfrmImpOrden;

implementation

uses UDatModConectar, UDatmodDatosGenerales, URepOrdenCompra;

{$R *.dfm}

procedure TfrmImpOrden.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmImpOrden.BitBtn15Click(Sender: TObject);
begin
  stpGenNumOrden.ExecProc;
  if not stpGenNumOrden.Transaction.InTransaction then
  stpGenNumOrden.Transaction.StartTransaction;
  try
    stpGenNumOrden.Transaction.CommitRetaining;
  except
  stpGenNumOrden.Transaction.RollbackRetaining;
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
        dmdatos.qryDatosOrdenImp.Close;
        dmdatos.qryDatosOrdenImp.Params[0].Value:= qryDatosOrdenAImpNUM_ORDEN.Value;
        dmdatos.qryDatosOrdenImp.Open;
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
    qryDatosOrdenAImp.Next;
  end;
  qryDatosOrdenAImp.close;
  qryDatosOrdenAImp.Open;
end;

end.
