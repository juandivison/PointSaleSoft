unit UConfirmaConduce;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Mask, DBCtrls, Grids, DBGrids, RxDBCtrl, Buttons,
  RxToolEdit, WinSkinData, EditNew;

type
  TfrmConfirmaConduce = class(TForm)
    dsqryVentaConduce: TDataSource;
    RxDBGrid1: TRxDBGrid;
    RxDBGrid2: TRxDBGrid;
    dsqryVentaConduceMaster: TDataSource;
    rxDateIni: TDateEdit;
    Label1: TLabel;
    rxDateFin: TDateEdit;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    SkinData1: TSkinData;
    BitBtn2: TBitBtn;
    chkMarcarTodo: TCheckBox;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Label7: TLabel;
    edtNumConduce: TEditN;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure chkMarcarTodoClick(Sender: TObject);
    procedure RxDBGrid2GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    
  private
    { Private declarations }
    procedure RefrescarDatos;
  public
    { Public declarations }
  end;

var
  frmConfirmaConduce: TfrmConfirmaConduce;

implementation

uses UDatosVentas, UGlobal, UFormFacturas, UDatModFactura;

{$R *.dfm}

procedure TfrmConfirmaConduce.BitBtn1Click(Sender: TObject);
begin
  dmVentas.qryVentaConduceMaster.Close;
  dmVentas.qryVentaConduceMaster.Params[0].Value:= ExtraerFecha(rxDateIni.Date);
  dmVentas.qryVentaConduceMaster.Params[1].Value:= ExtraerFecha(rxDateFin.Date);
  dmVentas.qryVentaConduceMaster.Open;
end;

procedure TfrmConfirmaConduce.BitBtn2Click(Sender: TObject);
begin
  if (edtNumConduce.ValueInteger > 0) and (edtNumConduce.Text <> '') then
  begin
    dmVentas.qryVentaConduceMaster.DisableControls;
    dmVentas.qryVentaConduce.DisableControls;
    if not dmventas.qryVentaConduceMaster.Locate('NUMERO',edtNumConduce.ValueInteger,[]) then
    MessageDlg('Num conduce no encontrado en rango de fecha indicado.',mtInformation,[mbok],0);
    dmVentas.qryVentaConduceMaster.EnableControls;
    dmVentas.qryVentaConduce.EnableControls;
    Exit;
  end;
  frmConsultaFacturas:=TfrmConsultaFacturas.Create(Nil);
  try
    frmConsultaFacturas.BitBtn2.Caption := '&Aceptar';
    if frmConsultaFacturas.Showmodal = mrOK then
    begin
      dmVentas.qryVentaConduceMaster.Close;
      dmVentas.qryVentaConduceMaster.Params[0].Value:= ExtraerFecha(dmFactura.qryVentaFacturaFecha.Value);
      dmVentas.qryVentaConduceMaster.Params[1].Value:= ExtraerFecha(dmFactura.qryVentaFacturaFecha.Value);
      dmVentas.qryVentaConduceMaster.Open;
      if not dmVentas.qryVentaConduceMaster.Locate('NUMERO',dmFactura.qryVentaFacturaNUMERO.Value,[]) then
      MessageDlg('Transacción seleccionada no encontrado, verifique.', mtInformation,[mbok],0);
    end;
  finally
  frmConsultaFacturas.Free;
  frmConsultaFacturas:= Nil;
  end;
end;

procedure TfrmConfirmaConduce.CheckBox1Click(Sender: TObject);
begin
  if chkMarcarTodo.Checked then
  RxDBGrid2.SelectAll
  else RxDBGrid2.UnselectAll;
end;

procedure TfrmConfirmaConduce.BitBtn3Click(Sender: TObject);
var
  i, idx : integer;
  fpago : integer;
  suma : Currency;
  procesado : Boolean;
  fname : string;
begin
  if RxDBGrid2.SelectedRows.Count = 0 then
  begin
    MessageDlg('No ha seleccionado ningún record.', mtWarning, [mbOK], 0);
    Exit;
  end;
  procesado:=false;
  if RxDBGrid2.SelectedRows.Count > 0 then
  begin
    with RxDBGrid2.DataSource.DataSet do
    begin
      for i := 0 to RxDBGrid2.SelectedRows.Count-1 do
      begin
        GotoBookmark(Pointer(RxDBGrid2.SelectedRows.Items[i]));
        if (dmVentas.qryVentaConduceMasterSTATUS_DET.Value = 'C') then
        Continue;
        dmventas.ibsqlUpdateStVtaConduce.params[0].value:= dmVentas.qryVentaConduceMasterNUMERO.Value;
        dmventas.ibsqlUpdateStVtaConduce.ExecQuery;
      end;
    end;
    if not dmventas.ibsqlUpdateStVtaConduce.Transaction.InTransaction then
    dmventas.ibsqlUpdateStVtaConduce.Transaction.StartTransaction;
    try
      dmventas.ibsqlUpdateStVtaConduce.Transaction.CommitRetaining;
    except
    dmventas.ibsqlUpdateStVtaConduce.Transaction.RollbackRetaining;
    end;
  end;
  RefrescarDatos;
end;

procedure TfrmConfirmaConduce.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if (dmVentas.qryVentaConduceStatus_Det.value = 'R') then
  BackGround := clgreen
  else
  if (dmVentas.qryVentaConduceStatus_Det.value = 'C') then
  BackGround := clSilver;
end;

procedure TfrmConfirmaConduce.FormCreate(Sender: TObject);
begin
  rxDateIni.Date := ExtraerFecha(GlbFechaTrnDiaria);
  rxDateFin.Date := ExtraerFecha(GlbFechaTrnDiaria);
end;

procedure TfrmConfirmaConduce.BitBtn4Click(Sender: TObject);
var
  i : integer;
  bookMark : TBookmark;
begin
  if MessageDlg('Desea cancelar conduce?',mtWarning ,[mbyes,mbno],0) = mryes then
  begin
    if RxDBGrid2.SelectedRows.Count > 0 then
    begin
      with RxDBGrid2.DataSource.DataSet do
      begin
        for i := 0 to RxDBGrid2.SelectedRows.Count-1 do
        begin
          GotoBookmark(Pointer(RxDBGrid2.SelectedRows.Items[i]));

          dmventas.ibsqlCancelaStVtaConduce.Params[0].value:= dmVentas.qryVentaConduceMasterNUMERO.Value;
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

procedure TfrmConfirmaConduce.RefrescarDatos;
var
  bookMark : TBookmark;
begin
  bookMark:=dmVentas.qryVentaConduceMaster.GetBookmark;
  dmVentas.qryVentaConduceMaster.Close;
  dmVentas.qryVentaConduceMaster.Open;
  dmVentas.qryVentaConduceMaster.GotoBookmark(bookMark);

  if Assigned(bookMark) then
  begin
    dmVentas.qryVentaConduceMaster.GotoBookmark(bookMark);
    dmVentas.qryVentaConduceMaster.FreeBookmark(bookMark);
  end;
end;

procedure TfrmConfirmaConduce.chkMarcarTodoClick(Sender: TObject);
begin
  if chkMarcarTodo.Checked then
  RxDBGrid2.SelectAll
  else RxDBGrid2.UnselectAll;
end;

procedure TfrmConfirmaConduce.RxDBGrid2GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if (dmVentas.qryVentaConduceMasterSTATUS_DET.value = 'R') then
  BackGround := clgreen
  else
  if (dmVentas.qryVentaConduceMasterSTATUS_DET.value = 'C') then
  BackGround := clSilver;
end;

end.
