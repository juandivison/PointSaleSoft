unit UTemporalVtaFormPos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Grids, DBGrids, RXDBCtrl, DB, Buttons;

type
  TfrmTemporalFormPos = class(TForm)
    dsTotal: TDataSource;
    dstblPOSVentadet: TDataSource;
    RxDBGrid1: TRxDBGrid;
    RxDBGrid2: TRxDBGrid;
    Label4: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    Label29: TLabel;
    Label41: TLabel;
    Label44: TLabel;
    chkExento: TCheckBox;
    DBText2: TDBText;
    DBEdit10: TDBEdit;
    DBText16: TDBText;
    DBText3: TDBText;
    dbTextMontoExoneraITBIS: TDBText;
    DBText15: TDBText;
    Edit1: TEdit;
    DBText5: TDBText;
    DBText7: TDBText;
    BitBtn1: TBitBtn;
    RxDBGrid3: TRxDBGrid;
    dsrxError: TDataSource;
    RxDBGrid4: TRxDBGrid;
    DataSource1: TDataSource;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTemporalFormPos: TfrmTemporalFormPos;

implementation

uses UDatModCalculos, UProcVentaRapida, UGlobal, UFormVentaRapidaPOS;

{$R *.dfm}

procedure TfrmTemporalFormPos.BitBtn1Click(Sender: TObject);
var
  guardarRec : TBookMark;
begin
  //Temporal Fix Loop
  //Exit;
  //Temporal Fix Loop fin
  dmCalculos.FMontoDescNivelItem:=dmCalculos.GettotalMontoDescuentoItem;
  guardarRec:= dmCalculos.rxVenta.GetBookmark;
  dmCalculos.rxVenta.DisableControls;
  dmCalculos.rxVenta.First;

  if frmProcVentaRapidaPOS.qryInventario.State = dsInactive then
  begin
    frmProcVentaRapidaPOS.qryInventario.params[0].Value:=glbCia_Key;
    frmProcVentaRapidaPOS.qryInventario.Open;
  end;

  //Exito dmCalculos.ProcesarSumaTotal;

  While not dmCalculos.rxVenta.Eof do
  begin
    {if (dmCalculos.rxVenta.fieldbyname('CodArticulo').Value <> frmProcVentaRapidaPOS.qryproductosCODIGO.Value) then
    begin
      if frmProcVentaRapidaPOS.qryproductos.Locate('codigo', dmCalculos.rxVenta.fieldbyname('CodArticulo').Value,[]) then
      begin
        if not frmProcVentaRapidaPOS.qryInventario.Locate('CODIGO', frmProcVentaRapidaPOS.qryProductosCODIGO.Value,[]) then
        begin
          continue;
          dmCalculos.rxVenta.Next;
        end;
      end else
      begin
        if not frmProcVentaRapidaPOS.qryInventario.Locate('CODIGO', dmCalculos.rxVenta.fieldbyname('CodArticulo').Value,[]) then
        begin
          continue;
          dmCalculos.rxVenta.Next;
        end;
      end;
    end else
    if not frmProcVentaRapidaPOS.qryInventario.Locate('CODIGO', dmCalculos.rxVenta.fieldbyname('CodArticulo').Value,[]) then
    begin
      continue;
      dmCalculos.rxVenta.Next;
    end; }

    dmCalculos.POSProcesaCalculos;

    dmCalculos.rxVenta.Next;

  end;

  application.ProcessMessages;
  //t Exito poner dmCalculos.SetDataVenta(frmProcVentaRapidaPOS.rxVenta);  

 { dmCalculos.ProcesarSumaTotal;
  dmCalculos.SetTotalVenta(frmProcVentaRapidaPOS.Totales);

  if Assigned(guardarRec) then
  begin
    dmCalculos.rxVenta.GotoBookmark(guardarRec);
    dmCalculos.rxVenta.FreeBookmark(guardarRec);
  end;
  dmCalculos.rxVenta.EnableControls;
  dmCalculos.rxVenta.RecordCount   }
end;

procedure TfrmTemporalFormPos.FormCreate(Sender: TObject);
begin
  dmCalculos.tblPOSVentadet.Close;
  dmCalculos.tblPOSVentadet.params[0].value:=frmProcVentaRapidaPOS.tblPosVentaDetnumero.value;
  dmCalculos.tblPOSVentadet.Open;
end;

end.
