unit UFormComisiones;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, DB, Grids, DBGrids, dbnavE, ComCtrls,
  DBDateTimePicker, RXCtrls, RXDBCtrl, Buttons, RxLookup, rxToolEdit,
  WinSkinData;

type
  TfrmComisiones = class(TForm)
    Label1: TLabel;
    dstblComisiones: TDataSource;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    DBNavigatorE1: TDBNavigatorE;
    DBGrid1: TDBGrid;
    Label4: TLabel;
    dstblTipoComision: TDataSource;
    BitBtn1: TBitBtn;
    DBStatusLabel1: TDBStatusLabel;
    BitBtn7: TBitBtn;
    Label5: TLabel;
    BitBtn5: TBitBtn;
    RxDBLookupCombo2: TRxDBLookupCombo;
    RxDBLookupCombo1: TRxDBLookupCombo;
    DBDateEdit1: TDBDateEdit;
    DBDateEdit2: TDBDateEdit;
    DBEdit1: TDBEdit;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    SkinData1: TSkinData;
    BitBtn4: TBitBtn;
    DBText1: TDBText;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmComisiones: TfrmComisiones;

implementation

uses UDatModComisiones, uglobal, UDatModReportes, UFormSelFecha,
  URepPreciocomiciones, UDatModInventario, UConsultaInventario;

{$R *.dfm}

procedure TfrmComisiones.FormCreate(Sender: TObject);
begin
  dmComision.tblComisiones.close;
  dmComision.tblComisiones.params[0].value:=ExtraerFecha(date);
  dmComision.tblComisiones.open;
  dmcomision.tblTipoComision.Close;
  dmcomision.tblTipoComision.Open;
  dmcomision.tblInventarioProd.Close;
  //dmInventario.tblInventarioProd.Params[0].Value:=glbCia_Key;
  dmcomision.tblInventarioProd.Open;
end;

procedure TfrmComisiones.BitBtn1Click(Sender: TObject);
begin
  if dmComision.tblComisiones.State in [dsEdit, dsinsert] then
  begin
    dmcomision.tblComisiones.Post;
    dmcomision.tblComisiones.ApplyUpdates;
    if not dmcomision.tblComisiones.Transaction.InTransaction then
    dmcomision.tblComisiones.Transaction.StartTransaction;
    try
      dmcomision.tblComisiones.Transaction.CommitRetaining;
    except
    dmcomision.tblComisiones.Transaction.RollbackRetaining;
    end;
    dmcomision.tblComisiones.Close;
    dmcomision.tblComisiones.Open;
    dmcomision.tblComisiones.Last;
  end;
end;

procedure TfrmComisiones.BitBtn7Click(Sender: TObject);
begin
  if dmcomision.tblComisiones.state = dsbrowse then
  begin
    dmcomision.tblComisiones.Insert;
    dmcomision.tblComisionesFECHA_INICIAL.Value := ExtraerFecha(Date);
    dmcomision.tblComisionesFECHA_FINAL.Value   := ExtraerFecha(Date)+365;
    dmcomision.tblComisionesSTATUS.Value := 'A';
    DBEdit1.SetFocus;    
  end;
end;

procedure TfrmComisiones.BitBtn5Click(Sender: TObject);
begin
  if dmComision.tblComisiones.State in [dsInactive, dsBrowse] then
  begin
    dmcomision.tblComisiones.Close;
    dmcomision.tblComisiones.Open;
  end;
end;

procedure TfrmComisiones.BitBtn2Click(Sender: TObject);
begin
  frmSelFecha:=TfrmSelfecha.create(nil);
  try
    if frmselfecha.showmodal = mrOk then
    begin
      dmreportes.qryPrecioComisiones.Close;
      dmreportes.qryPrecioComisiones.Params[0].Value:= ExtraerFecha(frmSelfecha.FechaIni.Date);
      dmreportes.qryPrecioComisiones.Open;
      qckPrecioComision:=TqckPrecioComision.Create(Nil);
      try
        qckPrecioComision.Preview;
      finally
      qckPrecioComision.free;
      qckPrecioComision:=nil;
      end;
    end;
  finally
  frmselfecha.free;
  frmselfecha:=nil;
  end;
end;

procedure TfrmComisiones.BitBtn3Click(Sender: TObject);
begin
  frmConsultaInventario:=TfrmConsultaInventario.Create(Nil);
  try
    if frmConsultaInventario.Showmodal = mrOk then
    begin
      if dmComision.tblComisiones.State In [dsEdit, dsInsert] then
      dmComision.tblComisionesCODIGO.Value := frmConsultaInventario.IBQuery1CODIGO_TEXTO.AsString;
    end;
  finally
  frmConsultaInventario.Free;
  frmConsultaInventario:=Nil;
  end;
end;

procedure TfrmComisiones.BitBtn4Click(Sender: TObject);
begin
  if dmComision.tblComisiones.State In [dsBrowse] then
  dmcomision.tblComisiones.Edit;
end;

end.
