unit UFormDatosOrdenConduce;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WinSkinData, Grids, DBGrids, RxDBCtrl, RxLookup, StdCtrls,
  QRPrntr,Buttons, DB, Mask, DBCtrls, IBCustomDataSet, IBQuery, ComCtrls,
  RxCtrls;

type
  TfrmDatosOrdConduce = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DataSource1: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    RxDBLookupCombo1: TRxDBLookupCombo;
    RxDBLookupCombo2: TRxDBLookupCombo;
    RxDBLookupCombo3: TRxDBLookupCombo;
    RxDBLookupCombo4: TRxDBLookupCombo;
    RxDBGrid1: TRxDBGrid;
    SkinData1: TSkinData;
    qryEmpD: TIBQuery;
    qryEmpCodV: TIBQuery;
    qryCodChofer: TIBQuery;
    qryClientes: TIBQuery;
    dsqryEmpD: TDataSource;
    dsqryEmpCodV: TDataSource;
    dsqryCodChofer: TDataSource;
    dsqryClientes: TDataSource;
    ProgressBar1: TProgressBar;
    DBStatusLabel1: TDBStatusLabel;
    DBText1: TDBText;
    Label7: TLabel;
    Label8: TLabel;
    DBText2: TDBText;
    Label10: TLabel;
    DBText3: TDBText;
    qryVehiculos: TIBQuery;
    qryVehiculosFICHA: TIntegerField;
    qryVehiculosPLACA: TIBStringField;
    dsqryVehiculos: TDataSource;
    qryDatosVta: TIBQuery;
    qryDatosVtaNUMERO: TIntegerField;
    qryDatosVtaNUMERO_FACTURA: TIntegerField;
    qryDatosVtaFECHA: TDateTimeField;
    qryDatosVtaNUMERO_DOC_PAGO: TIBStringField;
    qryDatosVtaFORMA_PAGO: TSmallintField;
    procedure BitBtn8Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cerrarAlImp : Boolean;
  end;

var
  frmDatosOrdConduce: TfrmDatosOrdConduce;

implementation

uses UDatosVentas, UGlobal, UQckRepOrdenAlmacen, UDatModConectar,
  UDatmodDatosGenerales, frmImprimirDoc, UQckRepOrdenAlmacenPOS,
  UDatModFactura, UProcVentaRapida, UFormFacturas, UFormGenerarConduceFct,
  UQckFactServIngeservis8_5_NConduce, UDatModReportes, UQckRepConduce,
  URepRecibo8x5_5Conduce;

{$R *.dfm}

procedure TfrmDatosOrdConduce.BitBtn8Click(Sender: TObject);
var
  flag : boolean;
begin
  BitBtn4Click(Self);
  dmVentas.qryRepOrdenConduce.Close;
  dmVentas.qryRepOrdenConduce.Params[0].Value:= dmVentas.tblDatosConducenum_conduce.Value;
  dmVentas.qryRepOrdenConduce.Open;
  
  qryDatosVta.close;
  qryDatosVta.params[0].value:=dmVentas.qryRepOrdenConduceNUM_TRN.Value;
  qryDatosVta.open;
  if (GlbActivaFarmacia = 1) and (GlbFOrdDespAlmcenPOS = 0) then
  begin
     if Assigned(frmProcVentaRapida) then
     begin
       if not (qryDatosVtaFORMA_PAGO.AsInteger  in [7,8]) then
       frmProcVentaRapida.AbrirDatosParaTicket(false,false,dmVentas.qryRepOrdenConduceCOD_CLIENTE.AsString,
       qryDatosVtaNUMERO_DOC_PAGO.AsInteger,
       qryDatosVtaFECHA.Value)
       else
       if (qryDatosVtaFORMA_PAGO.AsInteger in [7,8]) then
       frmProcVentaRapida.AbrirDatosParaTicket(false,true,dmReportes.qryViewVentasMastCODIGO_CTE.AsString,
       qryDatosVtaNUMERO_FACTURA.AsInteger,
       qryDatosVtaFECHA.Value);
     end;
     dmFactura.qryVentaFacturaDet.Close;
     dmFactura.qryVentaFacturaDet.Params[0].Value:= dmVentas.qryRepOrdenConduceNUM_TRN.Value;
     dmFactura.qryVentaFacturaDet.Open;
     if GlbFormatoConduce = 444 then
     begin
        qckRepConduce:=tqckRepConduce.Create(Nil);
        try

        if (GlbImpReciboSinPreg = 1) then
           qckRepConduce.Print
        else
        begin
          ProgressBar1.Visible:= False;
          frmImprimir:=TfrmImprimir.Create(nil);
          try
            if frmImprimir.Showmodal = mrOk then
            begin
              if frmImprimir.RadioGroup1.ItemIndex = 0 then
              qckRepConduce.Page.PaperSize := Letter;

              if frmImprimir.RadioButton1.Checked then
              begin
                qckRepConduce.PrinterSetup;
                qckRepConduce.Print;
              end else
              qckRepConduce.Preview;
            end;
          finally
          frmImprimir.Free;
          frmImprimir:=Nil;
          end;
        end;
        //end else
        //QCKFactRepuesto8x5_5Conduce.Preview;

        if (GlbImpReciboSinPreg = 0) then
        if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
        begin
          qckRepConduce.Preview;
        end;
        if GlbImpPDF then
        if not dmFactura.qryVentaFacturaNUMERO_FACTURA.IsNull then
        ReportExportPDF(qckRepConduce,GlbRutaFacturas+'\ConduceF'+IntToStr(dmVentas.qryRepOrdenConduceNUM_TRN.Value)+'.pdf')
        else
        if not dmFactura.qryVentaFacturaNUMERO_DOC_PAGO.IsNull then
        ReportExportPDF(qckRepConduce,GlbRutaFacturas+'\ConduceF'+IntToStr(dmVentas.qryRepOrdenConduceNUM_TRN.Value)+'.pdf')
      finally
      qckRepConduce.Free;
      qckRepConduce:=Nil;
      end;
      end else
      begin
        QCKFactRepuesto8x5_5Conduce:=TQCKFactRepuesto8x5_5Conduce.Create(Nil);
        try
          if GlbEsCopia then
          QCKFactRepuesto8x5_5Conduce.xtipoVenta := TipoVenta +' (Copia)'
          else QCKFactRepuesto8x5_5Conduce.xtipoVenta := TipoVenta;
          QCKFactRepuesto8x5_5Conduce.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;
          if (GlbImpReciboSinPreg = 1) then
             QCKFactRepuesto8x5_5Conduce.Print
          else
          begin
            ProgressBar1.Visible:= False;
            frmImprimir:=TfrmImprimir.Create(nil);
            try
              if frmImprimir.Showmodal = mrOk then
              begin
                if frmImprimir.RadioGroup1.ItemIndex = 0 then
                QCKFactRepuesto8x5_5Conduce.Page.PaperSize := Letter;
                //if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
                if frmImprimir.RadioButton1.Checked then
                begin
                  QCKFactRepuesto8x5_5Conduce.PrinterSetup;
                  QCKFactRepuesto8x5_5Conduce.Print;
                end else
                QCKFactRepuesto8x5_5Conduce.Preview;
            end;
            finally
            frmImprimir.Free;
            frmImprimir:=Nil;
            end;
      end;
      if (GlbImpReciboSinPreg = 0) then
      if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
      begin
        QCKFactRepuesto8x5_5Conduce.Preview;
      end;
      if GlbImpPDF then
      if not dmFactura.qryVentaFacturaNUMERO_FACTURA.IsNull then
      ReportExportPDF(QCKFactRepuesto8x5_5Conduce,GlbRutaFacturas+'\ConduceF'+IntToStr(dmVentas.qryRepOrdenConduceNUM_TRN.Value)+'.pdf')
      else
      if not dmFactura.qryVentaFacturaNUMERO_DOC_PAGO.IsNull then
      ReportExportPDF(QCKFactRepuesto8x5_5Conduce,GlbRutaFacturas+'\ConduceF'+IntToStr(dmVentas.qryRepOrdenConduceNUM_TRN.Value)+'.pdf')

      finally
      QCKFactRepuesto8x5_5Conduce.Free;
      QCKFactRepuesto8x5_5Conduce:=Nil;
      end;
    end;
  end else
  if (GlbFOrdDespAlmcenPOS = 1) then
  begin
    qckRepOrdenAlmacenPOS:=TqckRepOrdenAlmacenPOS.Create(Nil);
    try
      if dmFactura.qryVentaFacturaDet.RecordCount = 1 then
      qckRepOrdenAlmacenPOS.Page.Length:=4.344
      else
      if dmFactura.qryVentaFacturaDet.RecordCount >= 2 then
      qckRepOrdenAlmacenPOS.Page.Length:= qckRepOrdenAlmacenPOS.Page.Length +
      (dmFactura.qryVentaFacturaDet.RecordCount - 1 ) * 0.25;

      flag:=true;
      qckRepOrdenAlmacenPOS.Prepare;
      if ((dmFactura.qryVentaFacturaDet.RecordCount >= 1) and
         ((dmFactura.qryVentaFacturaDet.RecordCount < 10)
         or (qckRepOrdenAlmacenPOS.PageNumber = 2))) then
      begin
        ProgressBar1.Visible:=true;
        ProgressBar1.Position:=0;
        ProgressBar1.Max:=dmFactura.qryVentaFacturaDet.RecordCount;
        if (GlbIncLargoPapel = 1) then
        begin
          repeat
            begin
              ProgressBar1.StepIt;
              if (qckRepOrdenAlmacenPOS.PageNumber > 1) then
              begin
                qckRepOrdenAlmacenPOS.Page.Length:=qckRepOrdenAlmacenPOS.Page.Length + 0.26;
                qckRepOrdenAlmacenPOS.Prepare;
                flag:=False;
              end else
              if (qckRepOrdenAlmacenPOS.PageNumber = 1) then
              break;
              if (qckRepOrdenAlmacenPOS.PageNumber = 1) then
                   break;
          end;
          until flag = true;
        end;
      end;
      ProgressBar1.Visible := False;
      qckRepOrdenAlmacenPOS.Prepare;

      dmDatos.qryImpresoras.Close;
      dmDatos.qryImpresoras.Open;
      if dmDatos.qryImpresoras.Locate('IDMODULO;IDREPORTE',
         VarArrayOf([1,1]),[]) then //Orden Despacho Almacen
      qckRepOrdenAlmacenPOS.PrinterSettings.PrinterIndex:=
      GetImpresora(dmDatos.qryImpresorasNOMBRE_IMPRESORA.Value);

      frmImprimir:=TfrmImprimir.Create(nil);
      try
        if frmImprimir.Showmodal = mrOk then
        begin
          if frmImprimir.RadioGroup1.ItemIndex = 0 then
          qckRepOrdenAlmacenPOS.Page.PaperSize := Letter;
          if frmImprimir.RadioButton1.Checked then
          begin
            qckRepOrdenAlmacenPOS.PrinterSetup;
            qckRepOrdenAlmacenPOS.Print;
          end else
          qckRepOrdenAlmacenPOS.Preview;

        end;
        finally
        frmImprimir.Free;
        frmImprimir:=Nil;
        end; //dmFactura.qryVentaFacturaDet.
      finally
      qckRepOrdenAlmacenPOS.Free;
      qckRepOrdenAlmacenPOS:=Nil;
      end;
    end else
    begin
      qckRepOrdenAlmacen:=TqckRepOrdenAlmacen.Create(nil);
      try
      dmDatos.qryImpresoras.Close;
      dmDatos.qryImpresoras.Open;
      if dmDatos.qryImpresoras.Locate('IDMODULO;IDREPORTE',
      VarArrayOf([1,1]),[]) then //Orden Despacho Almacen
      qckRepOrdenAlmacen.PrinterSettings.PrinterIndex:=
      GetImpresora(dmDatos.qryImpresorasNOMBRE_IMPRESORA.Value);

      frmImprimir:=TfrmImprimir.Create(nil);
      try
        if frmImprimir.Showmodal = mrOk then
        begin
          if frmImprimir.RadioGroup1.ItemIndex = 0 then
          qckRepOrdenAlmacen.Page.PaperSize := Letter;
          if frmImprimir.RadioButton1.Checked then
          begin
            qckRepOrdenAlmacen.PrinterSetup;
            qckRepOrdenAlmacen.Print;
          end else
          qckRepOrdenAlmacen.Preview;
        end;
      finally
      frmImprimir.Free;
      frmImprimir:=Nil;
    end;
  finally
  qckRepOrdenAlmacen.Free;
  qckRepOrdenAlmacen:=Nil;
  end;
  end;
  if cerrarAlImp then close;         
end;

procedure TfrmDatosOrdConduce.FormCreate(Sender: TObject);
begin
  if GLBNumConduceCte = 0 then
  begin
    {DBEdit7.Visible:=False;
    Label11.Visible:=False;
    RxDBLookupCombo5.Visible:=False;
    Label12.Visible:=False }
  end else
  begin
    qryVehiculos.close;
    qryVehiculos.Open;
  end;
  cerrarAlImp:=False;
  qryEmpD.CLOSE;
  qryEmpD.OPEN;
  qryEmpCodV.CLOSE;
  qryEmpCodV.Open;
  qryCodChofer.Close;
  qryCodChofer.Open;
  qryClientes.Close;
  qryClientes.Open;
  if (dmVentas.tblDatosConduce.State = dsInsert) then
  begin
    if Assigned(frmProcVentaRapida) then
    dmVentas.tblDatosConduceCOD_CLIENTE.Value:=
    frmProcVentaRapida.tablaPropietarioCodigoPropietario.Value;
    if dmVentas.tblDatosConduceCOD_VENDEDOR.IsNull then
    dmVentas.tblDatosConduceCOD_VENDEDOR.Value:= GlbcodVendedor;
  end else
  if dmVentas.tblDatosConduce.State in [dsBrowse, dsedit] then
  begin
    dmVentas.tblDatosConduce.Edit;
    if dmVentas.tblDatosConduceCOD_VENDEDOR.IsNull then
    if GlbcodVendedor > 0 then
    dmVentas.tblDatosConduceCOD_VENDEDOR.Value:= GlbcodVendedor;
  end;
end;

procedure TfrmDatosOrdConduce.BitBtn4Click(Sender: TObject);
begin
  if dmventas.tblDatosConduce.State in [dsEdit, dsInsert] then
  GlbSalvarQuery(dmventas.tblDatosConduce);
end;

procedure TfrmDatosOrdConduce.BitBtn3Click(Sender: TObject);
begin
  if dmventas.tblDatosConduce.State in [dsEdit, dsInsert] then
  dmventas.tblDatosConduce.Cancel;
end;

procedure TfrmDatosOrdConduce.BitBtn5Click(Sender: TObject);
begin
  if dmventas.tblDatosConduce.State in [dsInactive, dsBrowse] then
  begin
    dmventas.tblDatosConduce.Close;
    dmventas.tblDatosConduce.Open;
  end;
end;

procedure TfrmDatosOrdConduce.BitBtn2Click(Sender: TObject);
begin
  dmventas.tblDatosConduce.Edit;
end;

end.
