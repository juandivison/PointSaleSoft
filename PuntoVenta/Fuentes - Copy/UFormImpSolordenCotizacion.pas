unit UFormImpSolordenCotizacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, Grids, DBGrids, RXDBCtrl,
  StdCtrls, Buttons, IBStoredProc, WinSkinData;

type
  TfrmImpSolOrden = class(TForm)
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
    SkinData1: TSkinData;
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
  frmImpSolOrden: TfrmImpSolOrden;

implementation

uses UDatModConectar, UDatmodDatosGenerales, URepOrdenCompra,
  UGlobal, UQckOrdenSolCompraNew;

{$R *.dfm}

procedure TfrmImpSolOrden.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmImpSolOrden.BitBtn15Click(Sender: TObject);
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

procedure TfrmImpSolOrden.BitBtn4Click(Sender: TObject);
var
  i: Integer;
begin
  if RxDBGrid1.SelectedRows.Count>0 then
  begin
    with RxDBGrid1.DataSource.DataSet do
      for i:=0 to rxDBGrid1.SelectedRows.Count-1 do
      begin
        GotoBookmark(pointer(rxDBGrid1.SelectedRows.Items[i]));
        dmdatos.qryDatosSolOrdenImp.Close;
        dmdatos.qryDatosSolOrdenImp.Params[0].Value:= qryDatosOrdenAImpNUM_ORDEN.Value;
        dmdatos.qryDatosSolOrdenImp.Open;
        
        qckSolOrdenDeCompraNew:=TqckSolOrdenDeCompraNew.Create(Nil);
        try
          qckSolOrdenDeCompraNew.Prepare;
          if (qryDatosOrdenAImpSTATUS_ORD.Value = 'P') then
          qckSolOrdenDeCompraNew.qrLabelReImp.Enabled := True;
          //T qckOrdenDeCompraNew.qrTpaginas.Caption:= ' de '+IntToStr(qckRepOrdenCompra.PageNumber);
          if ImpPantalla then
             qckSolOrdenDeCompraNew.Preview
          else
          begin
            qckSolOrdenDeCompraNew.PrinterSetup;
            qckSolOrdenDeCompraNew.Print;
          end;
        finally
        qckSolOrdenDeCompraNew.Free;
        qckSolOrdenDeCompraNew:=Nil;

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
      dmdatos.qryDatosSolOrdenImp.Close;
      dmdatos.qryDatosSolOrdenImp.Params[0].Value:= qryDatosOrdenAImpNUM_ORDEN.Value;
      dmdatos.qryDatosSolOrdenImp.Open;
      qckSolOrdenDeCompraNew:=TqckSolOrdenDeCompraNew.Create(Nil);
        try
          qckSolOrdenDeCompraNew.Prepare;
          if (qryDatosOrdenAImpSTATUS_ORD.Value = 'P') then
          qckSolOrdenDeCompraNew.qrLabelReImp.Enabled := True;
          //T qckOrdenDeCompraNew.qrTpaginas.Caption:= ' de '+IntToStr(qckRepOrdenCompra.PageNumber);
          if ImpPantalla then
             qckSolOrdenDeCompraNew.Preview
          else
          begin
            qckSolOrdenDeCompraNew.PrinterSetup;
            qckSolOrdenDeCompraNew.Print;
          end;
        finally
        qckSolOrdenDeCompraNew.Free;
        qckSolOrdenDeCompraNew:=Nil;
        
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
    end;
    qryDatosOrdenAImp.Next;
  end;
  qryDatosOrdenAImp.close;
  qryDatosOrdenAImp.Open;
end;

end.
