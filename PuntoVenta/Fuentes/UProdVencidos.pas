unit UProdVencidos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, Grids, DBGrids, RXDBCtrl, DB,
  RXSpin, Mask, WinSkinData;

type
  TfrmProdVencidos = class(TForm)
    DataSource1: TDataSource;
    RxDBGrid1: TRxDBGrid;
    BitBtn1: TBitBtn;
    RadioGroup1: TRadioGroup;
    BitBtn2: TBitBtn;
    RxSpinEdit1: TRxSpinEdit;
    Label1: TLabel;
    cboxProveedor: TComboBox;
    chkFiltraProv: TCheckBox;
    SkinData1: TSkinData;
    edtNumLote: TEdit;
    Label2: TLabel;
    chboxfiltrarLote: TCheckBox;
    Label3: TLabel;
    RxSpinEdit2: TRxSpinEdit;
    Label4: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cboxProveedorChange(Sender: TObject);
    procedure edtNumLoteChange(Sender: TObject);
    procedure chkFiltraProvClick(Sender: TObject);
    procedure chboxfiltrarLoteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProdVencidos: TfrmProdVencidos;
  xCodProveedor : Integer;

implementation

uses UDatModInventario, URepVencimientoProd,uglobal;

{$R *.dfm}

procedure TfrmProdVencidos.BitBtn1Click(Sender: TObject);
begin
  dmInventario.qryRepProdVence.Filtered:=False;
  if chboxfiltrarLote.Checked and (edtNumLote.Text <> '') then
  dmInventario.filterLoteNum:= UpperCase(edtNumLote.Text)
  else
  edtNumLote.Text:='';
  dmInventario.qryMaxMinProv.close;
  dmInventario.qryMaxMinProv.open;
  dmInventario.qryRepProdVence.Filtered := False;
  if (RadioGroup1.ItemIndex = 0) then      //Todos
  begin
    dmInventario.DiasxVencidos := 0;
    dmInventario.DiasxVencer   := 0;
    dmInventario.qryRepProdVence.Close;
    dmInventario.qryRepProdVence.SQL.Text := dmInventario.qryTodo.SQL.Text;
    if not chkFiltraProv.Checked then
    begin
      dmInventario.qryRepProdVence.params[0].Value:=dmInventario.qryMaxMinProvCODMIN.Value;
      dmInventario.qryRepProdVence.params[1].Value:=dmInventario.qryMaxMinProvCODMAX.Value;
    end else
    begin
      dmInventario.qryRepProdVence.params[0].Value:=xCodProveedor;
      dmInventario.qryRepProdVence.params[1].Value:=xCodProveedor;
    end;
    dmInventario.qryRepProdVence.Open;
  end { else
  if (RadioGroup1.ItemIndex = 1) then
  begin
    if RxSpinEdit1.AsInteger = 0 then
    begin
      MessageDlg('Favor indicar cantidad de dias',mterror, [mbOK], 0);
      RxSpinEdit1.SetFocus;
      Exit;
    end;

    dmInventario.DiasxVencidos := RxSpinEdit1.AsInteger;
    dmInventario.DiasxVencer   := 0;
    dmInventario.qryRepProdVence.Filtered := false;
    dmInventario.qryRepProdVence.Close;

    dmInventario.qryRepProdVence.SQL.Text := dmInventario.qryXVencer.SQL.Text;
    dmInventario.qryRepProdVence.params[0].Value:=RxSpinEdit1.AsInteger;
    dmInventario.qryRepProdVence.Open;
  end } else
  if (RadioGroup1.ItemIndex = 1) then //Vence en
  begin
    if RxSpinEdit1.AsInteger = 0 then
    begin
      MessageDlg('Favor indicar cantidad de dias',mterror, [mbOK], 0);
      RxSpinEdit1.SetFocus;
      Exit;
    end;

    dmInventario.DiasxVencidos := RxSpinEdit1.AsInteger;
    dmInventario.DiasxVencer   := 0;
    dmInventario.qryRepProdVence.Filtered := false;
    dmInventario.qryRepProdVence.Close;

    dmInventario.qryRepProdVence.SQL.Text := dmInventario.qryVenceEn.SQL.Text;
    dmInventario.qryRepProdVence.params[0].Value:=RxSpinEdit1.AsInteger;
    if RxSpinEdit2.AsInteger = 0 then
    dmInventario.qryRepProdVence.params[1].Value:=10000
    else
    dmInventario.qryRepProdVence.params[1].Value:=RxSpinEdit2.AsInteger;

    if not chkFiltraProv.Checked then
    begin
      dmInventario.qryRepProdVence.params[2].Value:=dmInventario.qryMaxMinProvCODMIN.Value;
      dmInventario.qryRepProdVence.params[3].Value:=dmInventario.qryMaxMinProvCODMAX.Value;
    end else
    begin
      dmInventario.qryRepProdVence.params[2].Value:=xCodProveedor;
      dmInventario.qryRepProdVence.params[3].Value:=xCodProveedor;
    end;    
    dmInventario.qryRepProdVence.Open;
  end else
  if (RadioGroup1.ItemIndex = 2) then  //Vencidos
  begin
    if RxSpinEdit1.AsInteger = 0 then
    begin
      MessageDlg('Favor indicar cantidad de dias',mterror, [mbOK], 0);
      RxSpinEdit1.SetFocus;
      Exit;
    end;
    dmInventario.DiasxVencidos := 0;
    dmInventario.DiasxVencer   := RxSpinEdit1.AsInteger;
    dmInventario.qryRepProdVence.Filtered := false;
    dmInventario.qryRepProdVence.Close;
    dmInventario.qryRepProdVence.SQL.Text := dmInventario.qryVencido.SQL.Text;
    dmInventario.qryRepProdVence.params[0].Value:=RxSpinEdit1.AsInteger;
     if RxSpinEdit2.AsInteger = 0 then
    dmInventario.qryRepProdVence.params[1].Value:=90
    else
    dmInventario.qryRepProdVence.params[1].Value:=RxSpinEdit2.AsInteger;
    if not chkFiltraProv.Checked then
    begin
      dmInventario.qryRepProdVence.params[2].Value:=dmInventario.qryMaxMinProvCODMIN.Value;
      dmInventario.qryRepProdVence.params[3].Value:=dmInventario.qryMaxMinProvCODMAX.Value;

    end else
    begin
      dmInventario.qryRepProdVence.Params[2].Value:= xCodProveedor;
      dmInventario.qryRepProdVence.Params[3].Value:= xCodProveedor;
    end;
    dmInventario.qryRepProdVence.Open;
  end;
  if chboxfiltrarLote.Checked then
  dmInventario.qryRepProdVence.Filtered:=true else
  dmInventario.qryRepProdVence.Filtered:=false;
end;

procedure TfrmProdVencidos.BitBtn2Click(Sender: TObject);
begin
  qckRepVencimientoProd :=tqckRepVencimientoProd.Create(nil);
  try
    qckRepVencimientoProd.Todo:=false;
    qckRepVencimientoProd.TipoReporte:='';
    if radiogroup1.ItemIndex = 1 then
     qckRepVencimientoProd.TipoReporte:='Por vencer'
     else if radiogroup1.ItemIndex = 2 then
     qckRepVencimientoProd.TipoReporte:='Vencidos'

     else if radiogroup1.ItemIndex = 3 then
     qckRepVencimientoProd.TipoReporte:='Vencidos'
     else
     qckRepVencimientoProd.Todo:=true;
    qckRepVencimientoProd.Preview;
  finally
  qckRepVencimientoProd.free;
  qckRepVencimientoProd:=nil;
  end;
end;

procedure TfrmProdVencidos.FormCreate(Sender: TObject);
begin
  cboxProveedor.Clear;
  dminventario.qryProveedores.Close;
  dmInventario.qryProveedores.Filtered:=False;
  dmInventario.qryProveedores.Tag:=glbCia_Key;
  //dmInventario.qryProveedores.Filtered:=True;
  //dmInventario.qryProveedores.Params[0].Value:=glbCia_Key;
  dminventario.qryProveedores.Open;
  dminventario.qryProveedores.First;
  while not dminventario.qryProveedores.Eof do
  begin
    cboxProveedor.Items.Add(dminventario.qryProveedoresDESCRIPCION.Value);
    dminventario.qryProveedores.Next;
  end;
  dminventario.qryProveedores.First;
  cboxProveedor.Text:=dminventario.qryProveedoresDESCRIPCION.Value;
end;

procedure TfrmProdVencidos.cboxProveedorChange(Sender: TObject);
begin
  if dminventario.qryProveedores.Locate('DESCRIPCION', cboxProveedor.Text,[]) then
  begin
    xCodProveedor:=dminventario.qryProveedoresCODIGO_CTE.Value;
  end;
  BitBtn1Click(Self);
end;

procedure TfrmProdVencidos.edtNumLoteChange(Sender: TObject);
begin
  if dmInventario.qryRepProdVence.State = dsBrowse then
  dmInventario.qryRepProdVence.Locate('LOTE_NUM',edtNumLote.Text,[loCaseInsensitive,loPartialKey]);
end;

procedure TfrmProdVencidos.chkFiltraProvClick(Sender: TObject);
begin
  BitBtn1Click(Self);
end;

procedure TfrmProdVencidos.chboxfiltrarLoteClick(Sender: TObject);
begin
  BitBtn1Click(Self);
end;

end.
