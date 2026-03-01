unit UFormConfServCafeteria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RXCtrls, Buttons, WinSkinData, Grids, DBGrids,
  DB,RXDBCtrl, DBCtrls, Mask, rxToolEdit, ComCtrls, RxLookup, ExtCtrls;

type
  TfrmConfServCafeteria = class(TForm)
    SkinData1: TSkinData;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    RxCheckListBox1: TRxCheckListBox;
    Label10: TLabel;
    RxCheckListBox2: TRxCheckListBox;
    Label1: TLabel;
    SpeedButton2: TSpeedButton;
    DBDateEdit1: TDBDateEdit;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    RxDBGrid1: TRxDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    DBStatusLabel1: TDBStatusLabel;
    DBStatusLabel2: TDBStatusLabel;
    RxLabel1: TRxLabel;
    BitBtn12: TBitBtn;
    RxDBGrid2: TRxDBGrid;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label5: TLabel;
    RxDBLookupCombo2: TRxDBLookupCombo;
    Label6: TLabel;
    DBEdit3: TDBEdit;
    Label7: TLabel;
    DBEdit4: TDBEdit;
    Label8: TLabel;
    Shape1: TShape;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SkinData1SkinControl(Sender: TComponent; SkinData: TSkinData;
      Form, Control: TControl; ControlClass: String;
      var SkinnedControl: TComponent);
  private
    { Private declarations }
    function GetCodigoServicio(strvalor:string):Integer;
    function GetCodigoServicioIng(strvalor:string):Integer;
    procedure ProcServDetalle;
    procedure GuardarMaster;
    procedure GuardarDetalle;

  public
    { Public declarations }
  end;

var
  frmConfServCafeteria: TfrmConfServCafeteria;

implementation

uses UDatModPanaderia, UGlobal, UDatosVentas;

{$R *.dfm}

procedure TfrmConfServCafeteria.FormCreate(Sender: TObject);
begin
  dmPanaderia.tblCafeteriaMaster.Close;
  dmPanaderia.tblCafeteriaMaster.Open;

  dmVentas.qryInventarioCafeteria.Close;
  if (GlbActivaProduccion = 1) then
  begin
    dmVentas.qryInventarioCafeteria.SQL.Text:= dmVentas.qryInventarioProduccion_base.SQL.Text;
    dmPanaderia.qryInvLookup.Sql.Text :=dmPanaderia.qryInvLookup_Prodbase.Sql.Text; 
  end else
  begin
    dmVentas.qryInventarioCafeteria.SQL.Text:= dmVentas.qryInventarioCafeteria_base.SQL.Text;
    dmPanaderia.qryInvLookup.Sql.Text := dmPanaderia.qryInvLookup_Cafbase.Sql.Text;
  end;

  dmVentas.qryInventarioCafeteria.Open;
  dmVentas.qryInventarioCafeteria.First;

  dmVentas.qryInventarioCafeteriaIng.Close;
  dmVentas.qryInventarioCafeteriaIng.Open;
  dmVentas.qryInventarioCafeteriaIng.First;

  dmPanaderia.qryInvLookup.Close;
  dmPanaderia.qryInvLookup.Open;

  dmPanaderia.qryInvLookupIngrediente.Close;
  dmPanaderia.qryInvLookupIngrediente.Open;
    
  RxCheckListBox1.Clear;
  While Not dmVentas.qryInventarioCafeteria.Eof do
  begin
    RxCheckListBox1.Items.Add(dmVentas.qryInventarioCafeteriaDESCRIPCION.Value);
    dmVentas.qryInventarioCafeteria.Next;
  end;

  RxCheckListBox2.Clear;
  While Not dmVentas.qryInventarioCafeteriaIng.Eof do
  begin
    RxCheckListBox2.Items.Add(dmVentas.qryInventarioCafeteriaIngDESCRIPCION.Value);
    dmVentas.qryInventarioCafeteriaIng.Next;
  end;
  if (GlbActivaProduccion = 1) then
  Caption:='Ingredientes por Piezas';
end;

procedure TfrmConfServCafeteria.SpeedButton2Click(Sender: TObject);
VAR
  i, xcodServicio : integer;
begin
  For i:=0 To RxCheckListBox1.Items.Count-1 Do
    begin
      if (RxCheckListBox1.Checked[i] = true) then
      begin
        xcodServicio := GetCodigoServicio(rxCheckListBox1.Items.Strings[i]);
        if dmPanaderia.tblCafeteriaMaster.Locate('CODIGO_PROD', xcodServicio,[]) then
        continue;
        dmPanaderia.tblCafeteriaMaster.Append;
        dmPanaderia.tblCafeteriaMasterCODIGO_PROD.Value:= xcodServicio;

        dmPanaderia.tblCafeteriaMasterSTATUS.Value      := 'A';
        dmPanaderia.tblCafeteriaMasterFECHA.Value       := ExtraerFecha(GlbFechaTrnDiaria);
        GuardarMaster;
      end;
    end;
    ProcServDetalle;
end;

procedure TfrmConfServCafeteria.BitBtn9Click(Sender: TObject);
begin
  dmPanaderia.tblCafeteriaMaster.First;
end;

procedure TfrmConfServCafeteria.BitBtn10Click(Sender: TObject);
begin
  dmPanaderia.tblCafeteriaMaster.Prior;
end;

procedure TfrmConfServCafeteria.BitBtn11Click(Sender: TObject);
begin
  dmPanaderia.tblCafeteriaMaster.Next;
end;

procedure TfrmConfServCafeteria.BitBtn12Click(Sender: TObject);
begin
  dmPanaderia.tblCafeteriaMaster.Last;
end;

procedure TfrmConfServCafeteria.BitBtn5Click(Sender: TObject);
begin
  dmPanaderia.tblCafeteriaMaster.Close;
  dmPanaderia.tblCafeteriaMaster.Open;
end;

function TfrmConfServCafeteria.GetCodigoServicio(
  strvalor: string): Integer;
begin
  if dmVentas.qryInventarioCafeteria.Locate('DESCRIPCION', strvalor,[]) then
  result := dmVentas.qryInventarioCafeteriaCODIGO.Value
  else result :=0;
end;

procedure TfrmConfServCafeteria.ProcServDetalle;
var
  i, xcodServicio : Integer;
begin
  For i:= 0 To RxCheckListBox2.Items.Count-1 Do
    begin
      if (RxCheckListBox2.Checked[i] = true) then
      begin
        xcodServicio := GetCodigoServicioIng(rxCheckListBox2.Items.Strings[i]);
        if dmPanaderia.tblCafeteriaDetalle.Locate('CODIGO_PROD', xcodServicio,[]) then
        continue;
        dmPanaderia.tblCafeteriaDetalle.Append;
        dmPanaderia.tblCafeteriaDetalleCODIGO_PROD.Value:= xcodServicio;
        dmPanaderia.tblCafeteriaDetalleNUMERO.Value      := dmPanaderia.tblCafeteriaMasterNUMERO.Value;
        dmPanaderia.tblCafeteriaDetalleSTATUS.Value      := 'A';

        GuardarDetalle;
      end;
    end;
end;

procedure TfrmConfServCafeteria.GuardarDetalle;
begin
  if dmpanaderia.tblCafeteriaDetalle.State in [dsEdit, dsInsert] then
  begin
    if dmpanaderia.tblCafeteriaDetalle.State = dsInsert then
    begin
      dmpanaderia.tblCafeteriaDetalleNUMERO.Value := dmpanaderia.tblCafeteriaMasterNUMERO.Value;

      dmpanaderia.tblCafeteriaDetalleSERIE.Value  := FsqlMaxNumero('CAFE_MASTER_DET','SERIE');
      if dmpanaderia.tblCafeteriaDetalleSERIE.IsNull Or (dmpanaderia.tblCafeteriaDetalleSERIE.Value = 0) then
      dmpanaderia.tblCafeteriaDetalleSERIE.Value  := 1;
    end;
    dmpanaderia.tblCafeteriaDetalle.Post;
    dmpanaderia.tblCafeteriaDetalle.ApplyUpdates;
    if not dmpanaderia.tblCafeteriaDetalle.Transaction.InTransaction then
    dmpanaderia.tblCafeteriaDetalle.Transaction.StartTransaction;
    try
      dmpanaderia.tblCafeteriaDetalle.Transaction.CommitRetaining;
    except
    dmpanaderia.tblCafeteriaDetalle.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmConfServCafeteria.GuardarMaster;
begin
  if dmPanaderia.tblCafeteriaMaster.State in [dsEdit, dsInsert] then
  begin
    if dmPanaderia.tblCafeteriaMaster.State = dsInsert then
    begin
      dmPanaderia.tblCafeteriaMasterNUMERO.Value := FsqlMaxNumero('CAFE_MASTER','NUMERO');
      if dmPanaderia.tblCafeteriaMasterNUMERO.IsNull Or (dmPanaderia.tblCafeteriaMasterNUMERO.Value = 0) then
      dmPanaderia.tblCafeteriaMasterNUMERO.Value := 1;
    end;
    dmPanaderia.tblCafeteriaMaster.Post;
    dmPanaderia.tblCafeteriaMaster.ApplyUpdates;
    if not dmPanaderia.tblCafeteriaMaster.Transaction.InTransaction then
    dmPanaderia.tblCafeteriaMaster.Transaction.StartTransaction;
    try
      dmPanaderia.tblCafeteriaMaster.Transaction.CommitRetaining;
    except
    dmPanaderia.tblCafeteriaMaster.Transaction.RollbackRetaining;
    end;
  end;

end;

function TfrmConfServCafeteria.GetCodigoServicioIng(
  strvalor: string): Integer;
begin
  if dmVentas.qryInventarioCafeteriaIng.Locate('DESCRIPCION',strvalor,[]) then
  result := dmVentas.qryInventarioCafeteriaIngCODIGO.Value
  else result :=0;
end;

procedure TfrmConfServCafeteria.BitBtn3Click(Sender: TObject);
begin
  if dmPanaderia.tblCafeteriaMaster.State In [dsEdit, dsInsert] then
  begin
    dmPanaderia.tblCafeteriaMaster.Cancel;
    Exit;
  end;
  if dmPanaderia.tblCafeteriaDetalle.State In [dsEdit, dsInsert] then
  begin
    dmPanaderia.tblCafeteriaDetalle.Cancel;
    Exit;
  end;
  if MessageDlg('Eliminar record detalle?', mtInformation, [mbYes, mbNo],0)= mrYes then
  begin
     dmPanaderia.tblCafeteriaDetalle.Delete;
     dmPanaderia.tblCafeteriaDetalle.ApplyUpdates;
     if Not dmPanaderia.tblCafeteriaDetalle.Transaction.InTransaction then
     dmPanaderia.tblCafeteriaDetalle.Transaction.StartTransaction;
     try
       dmPanaderia.tblCafeteriaDetalle.Transaction.CommitRetaining;
     except
     dmPanaderia.tblCafeteriaDetalle.Transaction.RollbackRetaining;
     end;
  end;

end;

procedure TfrmConfServCafeteria.BitBtn2Click(Sender: TObject);
begin
  dmPanaderia.tblCafeteriaDetalle.Edit;
end;

procedure TfrmConfServCafeteria.BitBtn4Click(Sender: TObject);
begin
  GuardarMaster;
  GuardarDetalle;
end;

procedure TfrmConfServCafeteria.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if dmPanaderia.tblCafeteriaDetalle.State In [dsInsert, dsEdit] then
  begin
    MessageDlg('Hay una transaccion en curso, verifique.', mtInformation, [mbOk],0);
    CanClose:=False;
  end else CanClose:=True;
end;

procedure TfrmConfServCafeteria.SkinData1SkinControl(Sender: TComponent;
  SkinData: TSkinData; Form, Control: TControl; ControlClass: String;
  var SkinnedControl: TComponent);
begin
  if (GlbActivaProduccion = 1) then
  Caption:='Ingredientes por Piezas';
end;

end.
