unit UFormRetencionesTercero;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, Grids, DBGrids, RXDBCtrl, Mask,
  db, DBCtrls, RXCtrls, USelFechaCnt, rxToolEdit, RxLookup, ExtCtrls,
  WinSkinData, GetAnyDate;

type
  TfrmRetencionestercero = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Label2: TLabel;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton1: TSpeedButton;
    DBStatusLabel1: TDBStatusLabel;
    DBEdit2: TDBEdit;
    RxDBGrid1: TRxDBGrid;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    SpeedButton4: TSpeedButton;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    DBDateEdit1: TDBDateEdit;
    DBDateEdit2: TDBDateEdit;
    Label3: TLabel;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    DBStatusLabel2: TDBStatusLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    RxDBLookupCombo1: TRxDBLookupCombo;
    DBEdit3: TDBEdit;
    BitBtn5: TBitBtn;
    RxDBGrid2: TRxDBGrid;
    RxDBGrid3: TRxDBGrid;
    RxDBLookupCombo2: TRxDBLookupCombo;
    Shape1: TShape;
    Label4: TLabel;
    DBStatusLabel3: TDBStatusLabel;
    SpeedButton8: TSpeedButton;
    DBText1: TDBText;
    SpeedButton9: TSpeedButton;
    SkinData1: TSkinData;
    GetAnyDate1: TGetAnyDate;
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    codCte : integer;
    function BuscarCliente(codcte:integer):Boolean;
  end;

var
  frmRetencionestercero: TfrmRetencionestercero;

implementation

uses UDatModUsuarios, UDatModIngresos, uglobal, UBuscarClientesPersonasP;

{$R *.dfm}

procedure TfrmRetencionestercero.BitBtn10Click(Sender: TObject);
begin
  dmIngresos.tblRetencionesDgii.prior;
end;

procedure TfrmRetencionestercero.BitBtn11Click(Sender: TObject);
begin
  dmIngresos.tblRetencionesDgii.next;
end;

procedure TfrmRetencionestercero.BitBtn12Click(Sender: TObject);
begin
  dmIngresos.tblRetencionesDgii.Last;
end;

procedure TfrmRetencionestercero.BitBtn9Click(Sender: TObject);
begin
  dmIngresos.tblRetencionesDgii.first;
end;

procedure TfrmRetencionestercero.SpeedButton1Click(Sender: TObject);
begin
  if dmIngresos.tblRetencionesDgii.State in [dsinsert, dsEdit] then
  begin
    dmIngresos.tblRetencionesDgiiIDRETENCION.Value:= FsqlMaxNumero('retenciones_dgii','idRetencion');
    dmIngresos.tblRetencionesDgii.Post;
    dmIngresos.tblRetencionesDgii.ApplyUpdates;
    if not dmIngresos.tblRetencionesDgii.Transaction.InTransaction then
    dmIngresos.tblRetencionesDgii.Transaction.StartTransaction;
    try
      dmIngresos.tblRetencionesDgii.Transaction.CommitRetaining;
    except
    dmIngresos.tblRetencionesDgii.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmRetencionestercero.SpeedButton2Click(Sender: TObject);
begin
  if dmIngresos.tblRetencionesDgii.State = dsBrowse then
  begin
    dmIngresos.tblRetencionesDgii.Insert;
    dmIngresos.tblRetencionesDgiiFECHAINI.Value:= ExtraerFecha(GlbFechaTrnDiaria);
    dmIngresos.tblRetencionesDgiiFECHAFINAL.Value:= ExtraerFecha(GlbFechaTrnDiaria)+1095;
    dmIngresos.tblRetencionesDgiiSTATUS.Value:='A';
    DBEdit2.SetFocus;
  end;
end;

procedure TfrmRetencionestercero.SpeedButton3Click(Sender: TObject);
begin
  if dmIngresos.tblRetencionesDgii.State in [dsinsert, dsEdit] then
  begin
    dmIngresos.tblRetencionesDgii.Cancel;
  end;
end;

procedure TfrmRetencionestercero.FormCreate(Sender: TObject);
begin
  dmIngresos.IBQryCliente.Close;
  dmIngresos.IBQryCliente.Open;
  dmIngresos.tblRetencioensDgiiMaster.Close;
  dmIngresos.tblRetencioensDgiiMaster.Open;
  dmIngresos.tblRetencionesDgii.Close;
  dmIngresos.tblRetencionesDgii.Params[0].value:= GlbFechaTrnDiaria;
  dmIngresos.tblRetencionesDgii.Open;
  dmIngresos.qryRetencionesDgii.Close;
  dmIngresos.qryRetencionesDgii.Params[0].Value:= dmIngresos.tblRetencionesDgii.Params[0].Value;
  dmIngresos.qryRetencionesDgii.Open;  
end;

procedure TfrmRetencionestercero.SpeedButton4Click(Sender: TObject);
begin
 if GetAnyDate1.Execute then
 begin
  dmIngresos.tblRetencionesDgii.Close;
  dmIngresos.tblRetencionesDgii.Params[0].Value:= ExtraerFecha(GetAnyDate1.Fecha);
  dmIngresos.tblRetencionesDgii.Open;

  dmIngresos.qryRetencionesDgii.Close;
  dmIngresos.qryRetencionesDgii.Params[0].Value:= dmIngresos.tblRetencionesDgii.Params[0].Value;
  dmIngresos.qryRetencionesDgii.Open;
 end;
end;

procedure TfrmRetencionestercero.BitBtn1Click(Sender: TObject);
begin

  dmIngresos.tblRetencioensDgiiMaster.first;
end;

procedure TfrmRetencionestercero.BitBtn2Click(Sender: TObject);
begin
  dmIngresos.tblRetencioensDgiiMaster.prior;
end;

procedure TfrmRetencionestercero.BitBtn3Click(Sender: TObject);
begin
  dmIngresos.tblRetencioensDgiiMaster.next;
end;

procedure TfrmRetencionestercero.BitBtn4Click(Sender: TObject);
begin
  dmIngresos.tblRetencioensDgiiMaster.Last;
end;

procedure TfrmRetencionestercero.SpeedButton5Click(Sender: TObject);
begin
  if dmIngresos.tblRetencioensDgiiMaster.State = dsBrowse then
  begin
    dmIngresos.tblRetencioensDgiiMaster.Insert;
    if (codCte > 0) then
    begin
      dmIngresos.tblRetencioensDgiiMasterCODIGO_CTE.Value:= codCte;
      codCte := -1;
    end;
    if frmRetencionestercero.Showing then
    DBEdit3.SetFocus;
  end;
end;

procedure TfrmRetencionestercero.SpeedButton6Click(Sender: TObject);
begin
  if dmIngresos.tblRetencioensDgiiMaster.State in [dsinsert, dsEdit] then
  begin
    dmIngresos.tblRetencioensDgiiMaster.Cancel;
  end;
end;
procedure TfrmRetencionestercero.SpeedButton7Click(Sender: TObject);
begin
  if dmIngresos.tblRetencioensDgiiMaster.State in [dsinsert, dsEdit] then
  begin
    dmIngresos.tblRetencioensDgiiMasterNUMERO.Value:= FsqlMaxNumero('retenciones_dgiiMaster','numero');
    dmIngresos.tblRetencioensDgiiMaster.Post;
    dmIngresos.tblRetencioensDgiiMaster.ApplyUpdates;
    if not dmIngresos.tblRetencioensDgiiMaster.Transaction.InTransaction then
    dmIngresos.tblRetencioensDgiiMaster.Transaction.StartTransaction;
    try
      dmIngresos.tblRetencioensDgiiMaster.Transaction.CommitRetaining;
    except
    dmIngresos.tblRetencioensDgiiMaster.Transaction.RollbackRetaining;
    end;
  end;
  if dmIngresos.tblRetencionesDgiiDet.State in [dsinsert, dsEdit] then
  begin
    dmIngresos.tblRetencionesDgiiDetIDSERIE.Value:= FsqlMaxNumero('retenciones_dgiiDet','idSerie');
    dmIngresos.tblRetencionesDgiiDet.Post;
    dmIngresos.tblRetencionesDgiiDet.ApplyUpdates;
    if not dmIngresos.tblRetencionesDgiiDet.Transaction.InTransaction then
    dmIngresos.tblRetencionesDgiiDet.Transaction.StartTransaction;
    try
      dmIngresos.tblRetencionesDgiiDet.Transaction.CommitRetaining;
    except
    dmIngresos.tblRetencionesDgiiDet.Transaction.RollbackRetaining;
    end;
  end;
end;


procedure TfrmRetencionestercero.BitBtn5Click(Sender: TObject);
begin
  FrmBuscarClientesPersonas:=TFrmBuscarClientesPersonas.Create(nil);
  try
    if FrmBuscarClientesPersonas.showmodal = mrOk then
    begin
      if dmIngresos.tblRetencioensDgiiMaster.State in [dsEdit, dsInsert] then
      dmIngresos.tblRetencioensDgiiMasterCODIGO_CTE.Value :=FrmBuscarClientesPersonas.CodigoCliente;
    end;
  finally
  FrmBuscarClientesPersonas.Free;
  FrmBuscarClientesPersonas:=Nil;
  end;
end;

procedure TfrmRetencionestercero.SpeedButton8Click(Sender: TObject);
begin
  if dmIngresos.tblRetencionesDgiiDet.State = dsBrowse then
  begin
    if dmIngresos.tblRetencioensDgiiMaster.State in [dsEdit, dsInsert] then
    SpeedButton7Click(self);
    dmIngresos.tblRetencionesDgiiDet.Insert;
    dmIngresos.tblRetencionesDgiiDetNUMERO.Value:=
    dmIngresos.tblRetencioensDgiiMasterNUMERO.Value;
    RxDBLookupCombo2.SetFocus;
  end;
end;

Function TfrmRetencionestercero.BuscarCliente(codcte: integer):Boolean;
begin
  if dmIngresos.tblRetencioensDgiiMaster.Locate('CODIGO_CTE',codcte,[]) then
  result:=True
  else result:=False;
end;

procedure TfrmRetencionestercero.SpeedButton9Click(Sender: TObject);
begin
  if dmIngresos.tblRetencionesDgiiDet.State = dsBrowse then
  begin
    if MessageDlg('Eliminar record detalle?', mtWarning,[mbYes, mbNo],0)= mrYes then
    begin
      dmIngresos.tblRetencionesDgiiDet.Delete;
      dmIngresos.tblRetencionesDgiiDet.ApplyUpdates;
      if Not dmIngresos.tblRetencionesDgiiDet.Transaction.InTransaction then
      dmIngresos.tblRetencionesDgiiDet.Transaction.StartTransaction;
      try
        dmIngresos.tblRetencionesDgiiDet.Transaction.CommitRetaining;
      except
      dmIngresos.tblRetencionesDgiiDet.Transaction.RollbackRetaining;
      end;
    end;
  end;
end;

end.
