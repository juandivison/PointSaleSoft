unit UFormPrecioXUnidadNivel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  DB, Dialogs, StdCtrls, Mask, DBCtrls, RxLookup, Buttons, Grids, DBGrids,
  RXDBCtrl, RXCtrls, WinSkinData, RxMemDS, RxCalc;

type
  TfrmPrecioUnidadNivel = class(TForm)
    Label1: TLabel;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    RxDBLookupCombo5: TRxDBLookupCombo;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    RxDBGrid1: TRxDBGrid;
    SkinData1: TSkinData;
    DBStatusLabel1: TDBStatusLabel;
    DBText1: TDBText;
    Label3: TLabel;
    BitBtn7: TBitBtn;
    CheckBoxAplicaItbis: TCheckBox;
    CheckBox1: TCheckBox;
    rxData: TRxMemoryData;
    rxDataPrecioXUnidad: TCurrencyField;
    Label13: TLabel;
    DataSource1: TDataSource;
    DBText2: TDBText;
    RxCalculator1: TRxCalculator;
    BitBtn8: TBitBtn;
    rxDataPMinimo: TCurrencyField;
    Label14: TLabel;
    DBText3: TDBText;
    lblPrecioComer1ro: TLabel;
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBEdit9Exit(Sender: TObject);
    procedure DBEdit10Exit(Sender: TObject);
    procedure DBEdit11Exit(Sender: TObject);
    procedure DBEdit12Exit(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure RxDBLookupCombo5Exit(Sender: TObject);
    procedure DBEdit5Change(Sender: TObject);
    procedure DBEdit6Change(Sender: TObject);
    procedure DBEdit7Change(Sender: TObject);
    procedure DBEdit8Change(Sender: TObject);
    procedure DBEdit5Exit(Sender: TObject);
    procedure DBEdit6Exit(Sender: TObject);
    procedure DBEdit7Exit(Sender: TObject);
    procedure DBEdit8Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn8Click(Sender: TObject);
    procedure DBEdit5Enter(Sender: TObject);
    procedure DBEdit6Enter(Sender: TObject);
    procedure DBEdit7Enter(Sender: TObject);
    procedure DBEdit8Enter(Sender: TObject);
    procedure DBEdit9Enter(Sender: TObject);
  private
    { Private declarations }
    procedure CalcPrecio(idx:smallint);
    function StrConvertirToFloat(valor: string): Extended;
    procedure PrepararSincronizacionComer1ro;
  public
    { Public declarations }
    xProd : integer;
    _NoInsert : boolean;
   procedure buscarCodigo(codigo:integer);
   Procedure CalcularPorcentaje(idx:smallint;Precio:Extended);
   Procedure ActRxData(idx:integer);
   procedure GuardarPrecio;
  end;

var
  frmPrecioUnidadNivel: TfrmPrecioUnidadNivel;
  PrecioAnterior:Real;
implementation

uses UDatModInventario, UGlobal, UFormUnidades, USincronizarPrecioUnidadSurtidora,
  UInventarioProd, UDatModConectar;

{$R *.dfm}


procedure TfrmPrecioUnidadNivel.BitBtn5Click(Sender: TObject);
begin
  dmInventario.tblLookupUnidad.Close;
  dmInventario.tblLookupUnidad.Open;
  dmInventario.tblPrecioUnidadXNivel.Close;
  dmInventario.tblPrecioUnidadXNivel.Open;
  PrecioAnterior:=0;  
end;

procedure TfrmPrecioUnidadNivel.PrepararSincronizacionComer1ro;
begin
  // ORIGEN
  //dmInventario.tblInventarioProd.Database := dmConectar.IBDatabase1;
  //dmInventario.tblInventarioProd.Transaction := dmConectar.IBTransaction1;

  dmInventario.tblPrecioUnidadXNivel.Database := dmConectar.IBDatabase1;
  dmInventario.tblPrecioUnidadXNivel.Transaction := dmConectar.IBTransaction1;

  // DESTINO
  frmInventarioProd.tblInvComer1ro.Database := dmConectar.IBDatabase2;
  frmInventarioProd.tblInvComer1ro.Transaction := dmConectar.IBTransaction2;

  frmInventarioProd.tblPrecioUnidadXNivelComer1ro.Database := dmConectar.IBDatabase2;
  frmInventarioProd.tblPrecioUnidadXNivelComer1ro.Transaction := dmConectar.IBTransaction2;

  if not dmConectar.IBDatabase1.Connected then
    dmConectar.IBDatabase1.Connected := True;
    
  if (GlbRutaDBActual2 <> '') then
  if not dmConectar.IBDatabase2.Connected then
    dmConectar.IBDatabase2.Connected := True;

  if not dmConectar.IBTransaction1.InTransaction then
    dmConectar.IBTransaction1.StartTransaction;

  if (GlbRutaDBActual2 <> '') then
  if not dmConectar.IBTransaction2.InTransaction then
    dmConectar.IBTransaction2.StartTransaction;
end;

procedure TfrmPrecioUnidadNivel.BitBtn4Click(Sender: TObject);
var
  bookM : TBookmark;
begin
  if (dmInventario.tblPrecioUnidadXNivel.State = dsEdit) then  
  begin
    //dmInventario.tblPrecioUnidadXNivel.FieldByName('AUD_COD_USUARIO').AsInteger := VarUsuarioGlb;
    //dmInventario.tblPrecioUnidadXNivel.FieldByName('AUD_APP_USER').AsString := GlbUsuarioLogueado;
    //dmInventario.tblPrecioUnidadXNivel.FieldByName('AUD_PC_NAME').AsString := GetComputerNameStr;
    if dmInventario.tblPrecioUnidadXNivel.FindField('AUD_COD_USUARIO') <> nil then
      dmInventario.tblPrecioUnidadXNivel.FieldByName('AUD_COD_USUARIO').AsInteger := VarUsuarioGlb;

    if dmInventario.tblPrecioUnidadXNivel.FindField('AUD_APP_USER') <> nil then
      dmInventario.tblPrecioUnidadXNivel.FieldByName('AUD_APP_USER').AsString := GlbUsuarioLogueado;

    if dmInventario.tblPrecioUnidadXNivel.FindField('AUD_PC_NAME') <> nil then
      dmInventario.tblPrecioUnidadXNivel.FieldByName('AUD_PC_NAME').AsString := GetComputerNameStr;

  end;

  GlbSalvarQuery(dmInventario.tblPrecioUnidadXNivel);
  try
    GuardarPrecio;
    lblPrecioComer1ro.Visible:=False;
  except on E : Exception do
  begin
    LogInformacionTxt('procedure TfrmPrecioUnidadNivel.BitBtn4Click(Sender: TObject);'#13#10''+e.Message);
    lblPrecioComer1ro.Visible:=True;
  end;
  end;
  bookM := dmInventario.tblPrecioUnidadXNivel.GetBookmark;
  BitBtn5Click(Self);
  dmInventario.tblPrecioUnidadXNivel.GotoBookmark(bookM);
  dmInventario.tblPrecioUnidadXNivel.FreeBookmark(bookM);
  PrecioAnterior:=0;
end;

procedure TfrmPrecioUnidadNivel.BitBtn1Click(Sender: TObject);
begin
  if _NoInsert then exit;
  if dmInventario.tblPrecioUnidadXNivel.State = dsBrowse then
  begin
    dmInventario.tblPrecioUnidadXNivel.Insert;
    dmInventario.tblPrecioUnidadXNivelCOD_PRODUCTO.Value:=
    dmInventario.tblInventarioProdCODIGO.Value;
    dmInventario.tblPrecioUnidadXNivelIN_POR.Value   := StrUserName;
    dmInventario.tblPrecioUnidadXNivelFECHA_IN.Value := Now;
    dmInventario.tblPrecioUnidadXNivelCOD_USUARIO_IN.Value:= VarUsuarioGlb;
    PrecioAnterior:=-1;
    if (Showing) then
    DBEdit4.SetFocus;
  end;
end;

procedure TfrmPrecioUnidadNivel.BitBtn2Click(Sender: TObject);
begin
  if dmInventario.tblPrecioUnidadXNivel.State in [dsBrowse] then
  begin
    dmInventario.tblPrecioUnidadXNivel.Edit;
    dmInventario.tblPrecioUnidadXNivelCOD_USUARIO_UPD.Value:= VarUsuarioGlb;
    dmInventario.tblPrecioUnidadXNivelFECHA_MOD.Value := Now;
  end;
end;

procedure TfrmPrecioUnidadNivel.BitBtn3Click(Sender: TObject);
begin
  if dmInventario.tblPrecioUnidadXNivel.State in [dsInsert, dsEdit] then
  begin
    dmInventario.tblPrecioUnidadXNivel.Cancel;
  end else
  begin
    if MessageDlg('Eliminar record?', mtInformation,[mbYes,mbNo],0) = mrYes then
    begin
      dmInventario.tblPrecioUnidadXNivel.Delete;
      BitBtn4Click(Self);
    end;
  end;
  PrecioAnterior:=0;
end;

procedure TfrmPrecioUnidadNivel.buscarCodigo(codigo: integer);
begin
  dmInventario.tblPrecioUnidadXNivel.Close;
  dmInventario.tblPrecioUnidadXNivel.DisableControls;
  dmInventario.tblPrecioUnidadXNivel.AutoCalcFields:=False;
  dmInventario.tblPrecioUnidadXNivel.Params[0].Value:=codigo;
  dmInventario.tblPrecioUnidadXNivel.Open;
  dmInventario.tblPrecioUnidadXNivel.Last;
  if dmInventario.tblPrecioUnidadXNivel.RecordCount = 0 then
  begin
  if dmInventario.tblPrecioUnidadXNivel.State = dsBrowse then
  begin
    dmInventario.tblPrecioUnidadXNivel.Insert;
    dmInventario.tblPrecioUnidadXNivelCOD_PRODUCTO.Value:= codigo;
    dmInventario.tblPrecioUnidadXNivelIN_POR.Value   := StrUserName;
    dmInventario.tblPrecioUnidadXNivelFECHA_IN.Value := Now;
    dmInventario.tblPrecioUnidadXNivelCOD_USUARIO_IN.Value:= VarUsuarioGlb;
    if (Showing) then
    DBEdit4.SetFocus;
  end;
  end;
  dmInventario.tblPrecioUnidadXNivel.EnableControls;
  dmInventario.tblPrecioUnidadXNivel.AutoCalcFields:=True;  
end;

procedure TfrmPrecioUnidadNivel.FormCreate(Sender: TObject);
begin
  _NoInsert:=False;
  rxData.close;
  rxData.Open;         
  dmInventario.tblLookupUnidad.Close;
  dmInventario.tblLookupUnidad.Open;

  //if (GLBAplicaITBISLevel = 1) then
  //CheckBoxAplicaItbis.Checked:=true
  //else CheckBoxAplicaItbis.Checked:=False;
  {if dmInventario.tblPrecioUnidadXNivelCANTIDAD.IsNull then
  begin
    MessageDlg('Cant x unidad no indicada en UNIDADES, verifique',mtError,[mbok],0);
    BitBtn4.Enabled:=false;
  end; }
end;

procedure TfrmPrecioUnidadNivel.CalcPrecio(idx:smallint);
begin
  ActRxData(idx);
  if (dmInventario.tblPrecioUnidadXNivel.state = dsbrowse) then Exit;
  Case idx Of
  1:begin
      dmInventario.tblPrecioUnidadXNivelPRECIOVENTA1.Value:=
      (dmInventario.tblInventarioProdPRECIO_COMPRA.Value * dmInventario.tblPrecioUnidadXNivelCANTIDAD.Value) *
      (1 + dmInventario.tblPrecioUnidadXNivelPORCUTILIDAD1.Value/100);
  
      if CheckBoxAplicaItbis.Checked then
      dmInventario.tblPrecioUnidadXNivelPRECIOVENTA1.Value:= dmInventario.tblPrecioUnidadXNivelPRECIOVENTA1.Value
      * (1 +FGlbPorcItbi(ExtraerFecha(GlbFechaTrnDiaria), dmInventario.tblInventarioProdCODIGO.Value)/100);
    end;
  2:begin
      dmInventario.tblPrecioUnidadXNivelPRECIOVENTA2.Value:=
      (dmInventario.tblInventarioProdPRECIO_COMPRA.Value * dmInventario.tblPrecioUnidadXNivelCANTIDAD.Value) *
      (1 + dmInventario.tblPrecioUnidadXNivelPORCUTILIDAD2.Value/100);

      if CheckBoxAplicaItbis.Checked then
      dmInventario.tblPrecioUnidadXNivelPRECIOVENTA2.Value:=
      dmInventario.tblPrecioUnidadXNivelPRECIOVENTA2.Value
       * (1 +FGlbPorcItbi(ExtraerFecha(GlbFechaTrnDiaria), dmInventario.tblInventarioProdCODIGO.Value)/100);
  end;
  3: begin
      dmInventario.tblPrecioUnidadXNivelPRECIOVENTA3.Value:=
      (dmInventario.tblInventarioProdPRECIO_COMPRA.Value * dmInventario.tblPrecioUnidadXNivelCANTIDAD.Value) *
      (1 + dmInventario.tblPrecioUnidadXNivelPORCUTILIDAD3.Value/100);

      if CheckBoxAplicaItbis.Checked then
      dmInventario.tblPrecioUnidadXNivelPRECIOVENTA3.Value:=
      dmInventario.tblPrecioUnidadXNivelPRECIOVENTA3.Value
      * (1 +FGlbPorcItbi(ExtraerFecha(GlbFechaTrnDiaria), dmInventario.tblInventarioProdCODIGO.Value)/100);
  end;
  4:begin
      dmInventario.tblPrecioUnidadXNivelPRECIOVENTA4.Value:=
      (dmInventario.tblInventarioProdPRECIO_COMPRA.Value * dmInventario.tblPrecioUnidadXNivelCANTIDAD.Value) *
      (1 + dmInventario.tblPrecioUnidadXNivelPORCUTILIDAD4.Value/100);

      if CheckBoxAplicaItbis.Checked then
      dmInventario.tblPrecioUnidadXNivelPRECIOVENTA4.Value:=
      dmInventario.tblPrecioUnidadXNivelPRECIOVENTA4.Value
      * (1 +FGlbPorcItbi(ExtraerFecha(GlbFechaTrnDiaria), dmInventario.tblInventarioProdCODIGO.Value)/100);
  end;
  end;
  if (PrecioAnterior > dmInventario.tblPrecioUnidadXNivelPRECIOVENTA1.Value) then
  begin
    if MessageDlg('Precio de venta menor a precio anterior, Cancelar transacción?',mtError,[mbyes,mbno],0) = mryes then
    begin
      dmInventario.tblPrecioUnidadXNivel.Cancel;
      exit;
    end;
  end;
end;

procedure TfrmPrecioUnidadNivel.DBEdit9Exit(Sender: TObject);
begin
  if CheckBox1.Checked then Exit;
  CalcPrecio(1);
end;

procedure TfrmPrecioUnidadNivel.DBEdit10Exit(Sender: TObject);
begin
  if CheckBox1.Checked then Exit;
  CalcPrecio(2);
end;

procedure TfrmPrecioUnidadNivel.DBEdit11Exit(Sender: TObject);
begin
  if CheckBox1.Checked then Exit;
  CalcPrecio(3);
end;

procedure TfrmPrecioUnidadNivel.DBEdit12Exit(Sender: TObject);
begin
  if CheckBox1.Checked then Exit;
  CalcPrecio(4);
end;

procedure TfrmPrecioUnidadNivel.BitBtn7Click(Sender: TObject);
begin
 frmUnidades:=TfrmUnidades.Create(Nil);
 try
   frmUnidades.Showmodal;
 finally
 frmUnidades.Free;
 frmUnidades:=Nil;
 end;
 dmInventario.tblLookupUnidad.Close;
 dmInventario.tblLookupUnidad.Open;
 BitBtn4.Enabled:=true;
end;

procedure TfrmPrecioUnidadNivel.RxDBLookupCombo5Exit(Sender: TObject);
begin
  if (xProd <> dmInventario.tblInventarioProdCODIGO.Value) then
  begin
    dmInventario.tblInventarioProd.DisableControls;
    dmInventario.tblInventarioProd.Locate('CODIGO',xProd,[]);
    dmInventario.tblInventarioProd.EnableControls;
  end;
  
  if dmInventario.tblPrecioUnidadXNivel.State in [dsinsert, dsedit] then
  dmInventario.tblPrecioUnidadXNivelCANTIDAD.Value :=
  dmInventario.tblLookupUnidadCANTIDAD.Value;
end;

procedure TfrmPrecioUnidadNivel.CalcularPorcentaje(idx: smallint;
  Precio: Extended);
  var xValorAuxi : extended;
begin
  ActRxData(idx);
  if (rxDataPrecioXUnidad.Value = 0) or (rxDataPrecioXUnidad.IsNull) then
  begin
    if showing then
    begin
      if dmInventario.tblInventarioProdPRECIO_COMPRA.Value > 0 then
      begin
        rxData.Edit;
        rxDataPrecioXUnidad.Value:= dmInventario.tblInventarioProdPRECIO_COMPRA.Value;
        rxData.Post;
      end else
      begin
        MessageDlg('Favor indicar costo del producto.',mtwarning,[mbok],0);
        dmInventario.tblPrecioUnidadXNivel.Cancel;
        Exit;
      end;
    end;
  end;
  if Not CheckBox1.Checked then Exit;
  //MU = (Precio de Venta - Costo) / Precio de Venta obtenemos:
  if dmInventario.tblPrecioUnidadXNivel.State in [dsBrowse,dsInactive] then Exit;
  case idx of
  1:begin                        //(1700-1440)/1440*100
      //if (rxDataPrecioXUnidad.Value > dmInventario.tblPrecioUnidadXNivelPRECIOVENTA3.Value) then
      xValorAuxi:= (Precio - //dmInventario.tblPrecioUnidadXNivelPRECIOVENTA1.Value -
      rxDataPrecioXUnidad.Value)/rxDataPrecioXUnidad.Value*100;

   if Precio > 0 then
      dmInventario.tblPrecioUnidadXNivelPORCUTILIDAD1.Value:=
      (Precio -
      rxDataPrecioXUnidad.Value)/rxDataPrecioXUnidad.Value*100
      else
      dmInventario.tblPrecioUnidadXNivelPORCUTILIDAD1.AsVariant:=null;
    end;
  2:begin
      //if dmInventario.tblInventarioProdPORCUTILIDAD2.Value > 0 then
   if Precio > 0 then
      dmInventario.tblPrecioUnidadXNivelPORCUTILIDAD2.Value:=
     (Precio -
      rxDataPrecioXUnidad.Value)/rxDataPrecioXUnidad.Value*100
    else
    dmInventario.tblPrecioUnidadXNivelPORCUTILIDAD2.AsVariant:= Null;
    end;
  3:begin
     //if dmInventario.tblInventarioProdPORCUTILIDAD3.Value > 0 then
   if Precio > 0 then
      dmInventario.tblPrecioUnidadXNivelPORCUTILIDAD3.Value:=
    (Precio -
      rxDataPrecioXUnidad.Value)/rxDataPrecioXUnidad.Value*100
      else
      dmInventario.tblPrecioUnidadXNivelPORCUTILIDAD3.AsVariant:= Null;
    end;
  4:begin
   if Precio > 0 then
      dmInventario.tblPrecioUnidadXNivelPORCUTILIDAD4.Value:=
     (Precio -
      rxDataPrecioXUnidad.Value)/rxDataPrecioXUnidad.Value*100
      else
      dmInventario.tblPrecioUnidadXNivelPORCUTILIDAD4.AsVariant:=null;
    end;
  end;//case
end;
function  TfrmPrecioUnidadNivel.StrConvertirToFloat(valor:string):Extended;
begin
  if (valor <> '') then
  result:= StrToFloat(StringReplace(valor, ',','',[rfReplaceAll, rfIgnoreCase]));
end;

procedure TfrmPrecioUnidadNivel.DBEdit5Change(Sender: TObject);
begin
  if (DBEdit5.Text <> '') then
  begin
    if StrConvertirToFloat(DBEdit5.Text) > rxDataPrecioXUnidad.Value then
    CalcularPorcentaje(1,StrConvertirToFloat(DBEdit5.Text));
  end;
end;

procedure TfrmPrecioUnidadNivel.DBEdit6Change(Sender: TObject);
begin
  if (DBEdit6.Text <> '') then
  begin
    if StrConvertirToFloat(DBEdit6.Text) > rxDataPrecioXUnidad.Value then
    CalcularPorcentaje(2,StrConvertirToFloat(DBEdit6.Text));
  end;
end;

procedure TfrmPrecioUnidadNivel.DBEdit7Change(Sender: TObject);
begin
  if (DBEdit7.Text <> '') then
  begin
    if StrConvertirToFloat(DBEdit7.Text) > rxDataPrecioXUnidad.Value then
    CalcularPorcentaje(3,StrConvertirToFloat(DBEdit7.Text));
  end;
end;

procedure TfrmPrecioUnidadNivel.DBEdit8Change(Sender: TObject);
begin
  if (DBEdit8.Text <> '') then
  begin
    if StrConvertirToFloat(DBEdit8.Text) > rxDataPrecioXUnidad.Value then
    CalcularPorcentaje(4,StrConvertirToFloat(DBEdit8.Text));
  end;
end;

procedure TfrmPrecioUnidadNivel.ActRxData(idx: integer);
begin
  if rxData.State = dsInactive then
  rxData.Open;
  if Not rxData.Locate('PrecioXUnidad',idx,[]) then
  begin
    rxData.Append;
    rxDataPrecioXUnidad.Value:=dmInventario.tblInventarioProdPRECIO_COMPRA.Value *
    dmInventario.tblPrecioUnidadXNivelCANTIDAD.Value;
    rxDataPMinimo.Value := dmInventario.tblInventarioProdPRECIO_COMPRA.Value;
    rxData.Post;
  end;
end;

procedure TfrmPrecioUnidadNivel.DBEdit5Exit(Sender: TObject);
begin
  if (PrecioAnterior > dmInventario.tblPrecioUnidadXNivelPRECIOVENTA1.Value) then
  begin
    if MessageDlg('Precio de venta menor a precio anterior, Cancelar transacción?',mtError,[mbyes,mbno],0) = mryes then
    begin
      dmInventario.tblPrecioUnidadXNivel.Cancel;
      exit;
    end;
  end;

  if dmInventario.tblPrecioUnidadXNivelPRECIOVENTA1.Value < rxDataPrecioXUnidad.Value then
  begin
    if MessageDlg('Precio de venta menor a precio de compra, Cancelar transacción?',mtError,[mbyes,mbno],0) = mryes then
    begin
      dmInventario.tblPrecioUnidadXNivel.Cancel;
      exit;
    end;
    if dmInventario.tblPrecioUnidadXNivel.state in [dsEdit, dsInsert] then
    dmInventario.tblPrecioUnidadXNivelPORCUTILIDAD1.AsVariant:=null;
    DBEdit5.SetFocus;
  end;

  if dmInventario.tblPrecioUnidadXNivelPRECIOVENTA1.Value <= rxDataPMinimo.Value then
  begin
    if MessageDlg('Precio de venta menor a precio minimo, Cancelar transacción?',mtError,[mbyes,mbno],0) = mryes then
    begin
      dmInventario.tblPrecioUnidadXNivel.Cancel;
      exit;
    end;
    if dmInventario.tblPrecioUnidadXNivel.state in [dsEdit, dsInsert] then
    dmInventario.tblPrecioUnidadXNivelPORCUTILIDAD1.AsVariant:=null;
    DBEdit5.SetFocus;
  end;

end;

procedure TfrmPrecioUnidadNivel.DBEdit6Exit(Sender: TObject);
begin

  if dmInventario.tblPrecioUnidadXNivelPRECIOVENTA2.Value < rxDataPrecioXUnidad.Value then
  begin
    if dmInventario.tblPrecioUnidadXNivel.state in [dsEdit, dsInsert] then
    dmInventario.tblPrecioUnidadXNivelPORCUTILIDAD2.AsVariant:=null;
    if MessageDlg('Precio de venta menor a precio de compra, Cancelar transacción?', mtError, [mbok],0) = mryes then
    begin
      dmInventario.tblPrecioUnidadXNivel.Cancel;
      exit;
    end;
  end;

  if dmInventario.tblPrecioUnidadXNivelPRECIOVENTA2.Value <= rxDataPMinimo.Value then
  begin
    if MessageDlg('Precio de venta menor a precio minimo, Cancelar transacción?',mtError,[mbyes,mbno],0) = mryes then
    begin
      dmInventario.tblPrecioUnidadXNivel.Cancel;
      exit;
    end;
    if dmInventario.tblPrecioUnidadXNivel.state in [dsEdit, dsInsert] then
    dmInventario.tblPrecioUnidadXNivelPORCUTILIDAD1.AsVariant:=null;
    DBEdit5.SetFocus;
  end;

end;

procedure TfrmPrecioUnidadNivel.DBEdit7Exit(Sender: TObject);
begin
  if dmInventario.tblPrecioUnidadXNivelPRECIOVENTA3.Value < rxDataPrecioXUnidad.Value then
  begin
    if dmInventario.tblPrecioUnidadXNivel.state in [dsEdit, dsInsert] then
    dmInventario.tblPrecioUnidadXNivelPORCUTILIDAD3.AsVariant:=null;
    if MessageDlg('Precio de venta menor a precio de compra, Cancelar transacción?',mtError,[mbok],0) = mryes then
    begin
      dmInventario.tblPrecioUnidadXNivel.Cancel;
      Exit;
    end;
  end;
  if dmInventario.tblPrecioUnidadXNivelPRECIOVENTA3.Value <= rxDataPMinimo.Value then
  begin
    if MessageDlg('Precio de venta menor a precio minimo, Cancelar transacción?',mtError,[mbyes,mbno],0) = mryes then
    begin
      dmInventario.tblPrecioUnidadXNivel.Cancel;
      Exit;
    end;
    if dmInventario.tblPrecioUnidadXNivel.state in [dsEdit, dsInsert] then
    dmInventario.tblPrecioUnidadXNivelPORCUTILIDAD1.AsVariant:=null;
    DBEdit5.SetFocus;
  end;
end;

procedure TfrmPrecioUnidadNivel.DBEdit8Exit(Sender: TObject);
begin
  if dmInventario.tblPrecioUnidadXNivelPRECIOVENTA4.Value < rxDataPrecioXUnidad.Value then
  begin
    if dmInventario.tblPrecioUnidadXNivel.state in [dsEdit, dsInsert] then
    dmInventario.tblPrecioUnidadXNivelPORCUTILIDAD4.AsVariant:=null;  
    if MessageDlg('Precio de venta menor a precio de compra, Cancelar transacción?', mtError,[mbok],0) = mryes then
    begin
      dmInventario.tblPrecioUnidadXNivel.Cancel;
      Exit;
    end;
  end;
  if dmInventario.tblPrecioUnidadXNivelPRECIOVENTA4.Value <= rxDataPMinimo.Value then
  begin
    if MessageDlg('Precio de venta menor a precio minimo, Cancelar transacción?',mtError,[mbyes,mbno],0) = mryes then
    begin
      dmInventario.tblPrecioUnidadXNivel.Cancel;
      exit;
    end;
    if dmInventario.tblPrecioUnidadXNivel.state in [dsEdit, dsInsert] then
    dmInventario.tblPrecioUnidadXNivelPORCUTILIDAD1.AsVariant:=null;
    DBEdit5.SetFocus;
  end;
end;

procedure TfrmPrecioUnidadNivel.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  rxData.EmptyTable;
end;

procedure TfrmPrecioUnidadNivel.BitBtn8Click(Sender: TObject);
begin
  RxCalculator1.Execute;
end;

procedure TfrmPrecioUnidadNivel.DBEdit5Enter(Sender: TObject);
begin
  PrecioAnterior:=-1;
  if (dmInventario.tblPrecioUnidadXNivel.State = dsEdit) then
  begin
    if (dmInventario.tblPrecioUnidadXNivelPRECIOVENTA1.Value > 0.01) then
    PrecioAnterior:=dmInventario.tblPrecioUnidadXNivelPRECIOVENTA1.Value;
  end;
  ActRxData(1);
end;

procedure TfrmPrecioUnidadNivel.DBEdit6Enter(Sender: TObject);
begin
  ActRxData(2);
end;

procedure TfrmPrecioUnidadNivel.DBEdit7Enter(Sender: TObject);
begin
  ActRxData(3);
end;

procedure TfrmPrecioUnidadNivel.DBEdit8Enter(Sender: TObject);
begin
  ActRxData(4);
end;

procedure TfrmPrecioUnidadNivel.GuardarPrecio;
begin
  if GlbProsesur = 0 then exit;
  if dmInventario.tblPrecioUnidadXNivel.State in [dsEdit, dsInsert] then
    dmInventario.tblPrecioUnidadXNivel.Post;

  PrepararSincronizacionComer1ro;
    
  SincronizarPrecioUnidadSurtidora(
    dmInventario.tblPrecioUnidadXNivel, // precio origen
    frmInventarioProd.tblPrecioUnidadXNivelComer1ro,              // precio destino
    dmInventario.tblInventarioProd,      // inventario origen
    frmInventarioProd.tblInvComer1ro    // inventario destino
  );

  GlbSalvarQuery(frmInventarioProd.tblPrecioUnidadXNivelComer1ro);
  GlbSalvarQuery(frmInventarioProd.tblInvComer1ro);
end;

procedure TfrmPrecioUnidadNivel.DBEdit9Enter(Sender: TObject);
begin
  PrecioAnterior:=0;
  if (dmInventario.tblPrecioUnidadXNivelPRECIOVENTA1.Value > 0.01) then
  PrecioAnterior:=dmInventario.tblPrecioUnidadXNivelPRECIOVENTA1.Value;
end;

end.
