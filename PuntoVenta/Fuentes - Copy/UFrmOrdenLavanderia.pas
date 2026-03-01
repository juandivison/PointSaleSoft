// frmOrdenLavanderia.pas
unit UFrmOrdenLavanderia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DBCtrls, DBGrids, Grids, DB, Buttons, Mask,
  ComCtrls,RxDBCtrl, ImgList, RxToolEdit, RxCtrls, RxLookup, CheckLst,
  Menus, RxCurrEdit, RxDBCurrEdit, USelFechaCnt, WinSkinData;

type
  TfrmOrdenLavanderia = class(TForm)
    PageControl1: TPageControl;
    tabsheetorden: TTabSheet;
    tabsheetexaminar: TTabSheet;
    pnlTop: TPanel;
    lblCliente: TLabel;
    lblFechaEntrada: TLabel;
    lblFechaEntrega: TLabel;
    lblOperador: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    lblBuscar: TLabel;
    Label9: TLabel;
    dtpFechaEntrada: TDBDateEdit;
    dtpFechaEntrega: TDBDateEdit;
    chkAplicaITBIS: TDBCheckBox;
    RxDBLookupCombo1: TRxDBLookupCombo;
    RxDBLookupCombo2: TRxDBLookupCombo;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    edtBuscar: TEdit;
    chklistaprocesos: TCheckListBox;
    cbClientes: TRxDBLookupCombo;
    cbOperador: TRxDBLookupCombo;
    pnlItems: TPanel;
    scrlItems: TScrollBox;
    pnlInventario: TPanel;
    RxDBGrid1: TRxDBGrid;
    pnlCesta: TPanel;
    lblCesta: TLabel;
    lblTotal: TLabel;
    DBStatusLabel2: TDBStatusLabel;
    DBStatusLabel1: TDBStatusLabel;
    btnGuardar: TBitBtn;
    btnCancelar: TBitBtn;
    dbgCesta: TRxDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ImageList1: TImageList;
    dsqryClientes: TDataSource;
    dsqryUsuarios: TDataSource;
    dsqryInventario: TDataSource;
    SpeedButton1: TSpeedButton;
    MainMenu1: TMainMenu;
    Opciones1: TMenuItem;
    Clientes1: TMenuItem;
    RxDBGrid2: TRxDBGrid;
    DBStatusLabel3: TDBStatusLabel;
    DBStatusLabel4: TDBStatusLabel;
    DBStatusLabel5: TDBStatusLabel;
    DBStatusLabel6: TDBStatusLabel;
    BitBtn3: TBitBtn;
    ProgressBar1: TProgressBar;
    DBEdit9: TDBEdit;
    dstblLAV_PRENDA_SERVICIO: TDataSource;
    TabSheet1: TTabSheet;
    RxDBGrid3: TRxDBGrid;
    chkCodigoQR: TCheckBox;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    SelFechaCnt1: TSelFechaCnt;
    lblConsultan: TLabel;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    Label10: TLabel;
    edtBuscarQROrden: TEdit;
    dstblLAV_ORDEN: TDataSource;
    dtpHoraEntrada: TDateTimePicker;
    dtpHoraEntrega: TDateTimePicker;
    SkinData1: TSkinData;
    procedure FormCreate(Sender: TObject);
    procedure btnGuardarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure edtBuscarChange(Sender: TObject);
    procedure RxDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure RxDBGrid1Exit(Sender: TObject);
    procedure pnlTopClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure chklistaprocesosClickCheck(Sender: TObject);
    procedure dbgCestaCellClick(Column: TColumn);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure edtBuscarQROrdenChange(Sender: TObject);
    procedure dstblLAV_ORDENDataChange(Sender: TObject; Field: TField);
  private
    procedure CargarItems;
    procedure AgregarProducto(CODIGO: Integer);
    procedure ItemPanelClick(Sender: TObject);
    procedure ItemPanelMouseEnter(Sender: TObject);
    procedure ItemPanelMouseLeave(Sender: TObject);
    procedure ActualizarTotal;
    procedure AgregarOrdenNueva;
    procedure ItemClick(Sender: TObject);
    procedure ProcesaCalculos;
    procedure CancelarOrden;
    procedure InicializarServicios;
    procedure GuardarServiciosPorPrenda(IDPrenda: Integer);
    procedure CargarServiciosDePrenda(IDPrenda: Integer);
    procedure chkServiciosClickCheck(Sender: TObject);
  public
    { Public declarations }
  end;

var
  frmOrdenLavanderia: TfrmOrdenLavanderia;
  FActualizando: Boolean;

implementation
 uses UActivapermisos, UDatModLavanderia, UDatModUsuarios, UDatModClientes,
  UDatModInventario, UqrOrdenLavanderia, 
  UMaestroClientes, UGlobal, UQckStickerprendalavanderia,
  UBuscarClientesPersonasP;

{$R *.dfm}

procedure TfrmOrdenLavanderia.FormCreate(Sender: TObject);
begin
  dmLavanderia.qryLavServicios.close;
  dmLavanderia.qryLavServicios.Open;
  dmLavanderia.qryInvLookup.Close;
  dmLavanderia.qryInvLookup.Open;
  dmUsuarios.qryUsuarios.Close;
  dmUsuarios.qryUsuarios.Open;
  dmClientes.qryClientes.close;
  dmClientes.qryClientes.Open;
  dmInventario.qryInventario.close;
  dmInventario.qryInventario.Filtered:=False;
  dmInventario.qryInventario.Open;
  dmInventario.qryInvLookup.close;
  dmInventario.qryInvLookup.open;
  dtpFechaEntrada.Date:= Now;
  dtpFechaEntrega.Date:= Now + 1;

  {dmLavanderia.tblLAV_ORDEN.Close;
  dmLavanderia.tblLAV_ORDEN.params[0].Value:= ExtraerFecha(GlbFechaTrnDiaria);
  dmLavanderia.tblLAV_ORDEN.params[1].Value:= ExtraerFecha(GlbFechaTrnDiaria);
  dmLavanderia.tblLAV_ORDEN.Open; }

  dmLavanderia.tblLAV_ORDEN.Close;
  dmLavanderia.tblLAV_ORDEN.SelectSQL.Clear;
  lblConsultan.Caption:='';
  dmLavanderia.tblLAV_ORDEN.SelectSQL.Text:=
  'Select * From LAV_ORDEN Where fecha_entrada between :fechaini and :fechafin';
  lblConsultan.Caption:='';
  dmLavanderia.tblLAV_ORDEN.params[0].Value:= ExtraerFecha(GlbFechaTrnDiaria);
  dmLavanderia.tblLAV_ORDEN.params[1].Value:= ExtraerFecha(GlbFechaTrnDiaria);
  dmLavanderia.tblLAV_ORDEN.Open;

  dmlavanderia.qryLavServicios.Close;
  dmlavanderia.qryLavServicios.Open;
  while not dmlavanderia.qryLavServicios.eof do
  begin
    chklistaprocesos.Items.Add(dmlavanderia.qryLavServiciosDESCRIPCION.Value);
    dmlavanderia.qryLavServicios.Next;
  end;
  CargarItems;
  InicializarServicios;
  if not dmLavanderia.tblLAV_PRENDA.IsEmpty then
  CargarServiciosDePrenda(dmLavanderia.tblLAV_PRENDAID.AsInteger);
end;

procedure TfrmOrdenLavanderia.btnGuardarClick(Sender: TObject);
begin
  FActualizando:=True;
  if dmLavanderia.tblLAV_ORDEN.State in [dsEdit, dsInsert] then
  begin
   //dmLavanderia.tblLAV_ORDENhora_entrada.AsDateTime := ExtraerHora(dtpHoraEntrada.Time);
   //dmLavanderia.tblLAV_ORDENhora_ENTREGA.AsDateTime := ExtraerHora(dtpHoraEntrega.Time);

   dmLavanderia.tblLAV_ORDENhora_entrada.AsDateTime := dtpHoraEntrada.Time;
   dmLavanderia.tblLAV_ORDENhora_ENTREGA.AsDateTime := dtpHoraEntrega.Time;
  end;
  if not dmLavanderia.tblLAV_ORDENHORA_ENTREGA.IsNull then
  GlbSalvarQuery(dmLavanderia.tblLAV_ORDEN)
  else
  begin
    MessageDlg('Asignar valor a hora de entrega', mtConfirmation, [mbok], 0);
    exit;
  end;

  if not dmLavanderia.tblLAV_PRENDAID_ORDEN.IsNull then
  GlbSalvarQuery(dmLavanderia.tblLAV_PRENDA);
  if not dmLavanderia.tblLAV_PRENDAID.IsNull then
  GuardarServiciosPorPrenda(dmLavanderia.tblLAV_PRENDAID.Value);

   ActualizarTotal;
  FActualizando := False
  //ShowMessage('Orden guardada correctamente.');
end;

procedure TfrmOrdenLavanderia.CancelarOrden;
begin
  if MessageDlg('¿Desea cancelar esta orden?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    if dmLavanderia.tblLAV_ORDEN.State = dsBrowse then
      dmLavanderia.tblLAV_ORDEN.Edit;
    dmLavanderia.tblLAV_ORDENESTADO.AsString := 'C';
  end;
end;

procedure TfrmOrdenLavanderia.btnCancelarClick(Sender: TObject);
begin
  if dmlavanderia.tblLAV_ORDEN.State = dsBrowse then
  begin
    CancelarOrden;
  end else
  begin
    dmLavanderia.tblLAV_ORDEN.Cancel;
    dmLavanderia.tblLAV_PRENDA.Cancel;
  end;
  GlbSalvarQuery(dmLavanderia.tblLAV_ORDEN);
  GlbSalvarQuery(dmLavanderia.tblLAV_PRENDA);
  ActualizarTotal;  
end;

procedure TfrmOrdenLavanderia.AgregarOrdenNueva;
begin
  if dmLavanderia.tblLAV_ORDEN.State = dsBrowse then
  dmLavanderia.tblLAV_ORDEN.Append;

  // Cliente
  //dmLavanderia.tblLAV_ORDENID_CLIENTE.AsInteger :=
  //  cbClientes.KeyValue;

  // Fechas
  dmLavanderia.tblLAV_ORDENFECHA_ENTRADA.AsDateTime := ExtraerFecha(now);
  dmLavanderia.tblLAV_ORDENFECHA_ENTREGA.AsDateTime := ExtraerFecha(now)+1;
  dmLavanderia.tblLAV_ORDENHORA_ENTRADA.AsDateTime :=
  ExtraerFecha(dmLavanderia.tblLAV_ORDENFECHA_ENTRADA.Value)+ExtraerHora(now);
  dmLavanderia.tblLAV_ORDENHORA_ENTREGA.AsDateTime :=
  ExtraerFecha(dmLavanderia.tblLAV_ORDENFECHA_ENTREGA.Value)+ExtraerHora(now);

  // Estado inicial
  dmLavanderia.tblLAV_ORDENESTADO.AsString := 'PENDIENTE';
  dmLavanderia.tblLAV_ORDENID_CLIENTE.Value:= 0;
  dmLavanderia.tblLAV_ORDENID_OPERADOR.Value:= VarUsuarioGlb;
  // ITBIS
  dmLavanderia.tblLAV_ORDENAPLICA_ITBIS.AsInteger :=
    Ord(chkAplicaITBIS.Checked);

  // Operador
  //dmLavanderia.tblLAV_ORDENID_OPERADOR.AsInteger :=
  //  cbOperador.KeyValue;

  // Total provisional
  dmLavanderia.tblLAV_ORDENTOTAL.AsFloat := 0;

  // Notas (si tienes un campo para eso)
  dmLavanderia.tblLAV_ORDENNOTAS.AsString := '';

  if dmLavanderia.tblLAV_ORDENID_CLIENTE.IsNull then
  begin
    cbClientes.SetFocus;
    exit;
  end;
  if dmLavanderia.tblLAV_ORDENID_OPERADOR.IsNull then
  begin
    cbOperador.SetFocus;
    exit;
  end;
  GlbSalvarQuery(dmLavanderia.tblLAV_ORDEN);
end;

procedure TfrmOrdenLavanderia.CargarItems;
var
  ItemPanel: TPanel;
  Img: TImage;
  Lbl: TLabel;
  Row, Col: Integer;
  imgPath: string;
  bmp: TPicture;
  imgCurrentPath : String;
begin
  Row := 0;
  Col := 0;
  dmInventario.qryInventario.Close; 
  dmInventario.qryInventario.Open;
  dmInventario.qryInventario.First;
  while not dmInventario.qryInventario.Eof do
  begin
    ItemPanel := TPanel.Create(scrlItems);
    ItemPanel.Parent := scrlItems;
    ItemPanel.Width := 100;
    ItemPanel.Height := 120;
    ItemPanel.Top := Row * 130;
    ItemPanel.Left := Col * 110;
    ItemPanel.Tag := dmInventario.qryInventarioCODIGO.AsInteger;
    ItemPanel.OnClick := ItemClick;
    ItemPanel.BevelOuter := bvNone;

    // Imagen
    Img := TImage.Create(ItemPanel);
    Img.Parent := ItemPanel;
    Img.Width := 80;
    Img.Height := 80;
    Img.Stretch := True;
    Img.Top := 0;
    Img.Left := 10;
    Img.Center := True;
    Img.OnClick := ItemClick;

    //imgPath := 'C:\\Lavanderia\\imagenes\\' + dmInventario.qryInventarioCODIGO_TEXTO.AsString + '.png';

    imgPath := dmInventario.qryInventarioRUTAIMAGEN.Value;
    if dmInventario.qryInventarioRUTAIMAGEN.IsNull then
    begin
      imgCurrentPath:=imgCurrentPath+'\'+'SinImagen.bmp';
      Img.Picture.LoadFromFile(imgCurrentPath);
    end else
    if FileExists(imgPath) then
    begin
      Img.Picture.LoadFromFile(imgPath);
      if (imgCurrentPath = '') then
      imgCurrentPath:= ExtractFilePath(imgPath);
    end;

    // Etiqueta
    Lbl := TLabel.Create(ItemPanel);
    Lbl.Parent := ItemPanel;
    Lbl.Caption := dmInventario.qryInventarioDESCRIPCION.AsString;
    Lbl.AutoSize := False;
    Lbl.Alignment := taCenter;
    Lbl.SetBounds(0, 85, 100, 16);
    Lbl.OnClick := ItemClick;

    // Layout
    Inc(Col);
    if Col = 5 then
    begin
      Col := 0;
      Inc(Row);
    end;

    dmInventario.qryInventario.Next;
  end;
end;

procedure TfrmOrdenLavanderia.ProcesaCalculos;
begin
  if not (dmLavanderia.tblLAV_PRENDA.State in  [dsEdit, dsInsert]) then Exit;
  dmLavanderia.tblLAV_PRENDAMONTO_BASE.AsFloat := dmLavanderia.tblLAV_PRENDAPRECIO_UNITARIO.Value*
  dmLavanderia.tblLAV_PRENDACANTIDAD.Value;
  dmLavanderia.tblLAV_PRENDAMONTO_ITBIS.AsFloat := 0;
  dmLavanderia.tblLAV_PRENDATOTAL_LINEA.AsFloat := dmInventario.qryInventarioPRECIO.AsFloat;
end;

procedure TfrmOrdenLavanderia.AgregarProducto(CODIGO: Integer);
begin
  dmInventario.qryInventario.Locate('CODIGO', CODIGO, []);
  if dmLavanderia.tblLAV_ORDENid.IsNull then
  GlbSalvarQuery(dmLavanderia.tblLAV_ORDEN);
  dmLavanderia.tblLAV_PRENDA.Append;
  dmLavanderia.tblLAV_PRENDAID_ORDEN.Value:=dmLavanderia.tblLAV_ORDENid.Value;
  dmLavanderia.tblLAV_PRENDACODIGO_PRODUCTO.AsInteger := CODIGO;
  dmLavanderia.tblLAV_PRENDACANTIDAD.AsInteger := 1;
  dmLavanderia.tblLAV_PRENDAPRECIO_UNITARIO.AsFloat := dmInventario.qryInventarioPRECIO.AsFloat;
  ProcesaCalculos;
  GlbSalvarQuery(dmLavanderia.tblLAV_PRENDA);
  GuardarServiciosPorPrenda(dmLavanderia.tblLAV_PRENDAID.Value);
  ActualizarTotal;  
end;
procedure TfrmOrdenLavanderia.ItemClick(Sender: TObject);
var
  Panel: TPanel;
begin
  if Sender is TPanel then
    Panel := TPanel(Sender)
  else if Sender is TImage then
    Panel := TPanel(TImage(Sender).Parent)
  else if Sender is TLabel then
    Panel := TPanel(TLabel(Sender).Parent)
  else
    Exit;

  AgregarProducto(Panel.Tag);
end;


procedure TfrmOrdenLavanderia.ItemPanelClick(Sender: TObject);
begin
  if Sender is TPanel then
    AgregarProducto(TPanel(Sender).Tag)
  else if Sender is TImage then
    AgregarProducto(TPanel(TImage(Sender).Parent).Tag)
  else if Sender is TLabel then
    AgregarProducto(TPanel(TLabel(Sender).Parent).Tag);    
end;

procedure TfrmOrdenLavanderia.ItemPanelMouseEnter(Sender: TObject);
begin
  if Sender is TPanel then
    TPanel(Sender).Color := clMoneyGreen;
end;

procedure TfrmOrdenLavanderia.ItemPanelMouseLeave(Sender: TObject);
begin
  if Sender is TPanel then
    TPanel(Sender).Color := clBtnFace;
end;

procedure TfrmOrdenLavanderia.ActualizarTotal;
var
  Total: Double;
  guardarRec : TBookMark;
begin
  Total := 0;
  guardarRec := dmLavanderia.tblLAV_PRENDA.GetBookmark;
  if (dmLavanderia.tblLAV_ORDEN.RecordCount = 0) then Exit;
  dmLavanderia.tblLAV_PRENDA.First;
  while not dmLavanderia.tblLAV_PRENDA.Eof do
  begin
    Total := Total + dmLavanderia.tblLAV_PRENDATOTAL_LINEA.AsFloat;
    dmLavanderia.tblLAV_PRENDA.Next;
  end;
  if Total = 0 then
  begin
    //edtTotal.Text := '';
    dmLavanderia.tblLAV_ORDEN.Edit;
    dmLavanderia.tblLAV_ORDENTOTAL.AsFloat := Total;
    GlbSalvarQuery(dmLavanderia.tblLAV_ORDEN);
    Exit;
  end;
  //edtTotal.Text := FormatFloat('#,##0.00', Total);
  dmLavanderia.tblLAV_ORDEN.Edit;
  dmLavanderia.tblLAV_ORDENTOTAL.AsFloat := Total;
  GlbSalvarQuery(dmLavanderia.tblLAV_ORDEN);
  Refresh;
  dmLavanderia.tblLAV_PRENDA.GotoBookmark(guardarRec);
  dmLavanderia.tblLAV_PRENDA.FreeBookmark(guardarRec);
end;

procedure TfrmOrdenLavanderia.BitBtn1Click(Sender: TObject);
begin
  if dmLavanderia.tblLAV_ORDEN.State in [dsBrowse] then
  begin
    AgregarOrdenNueva;
  end;
  Refresh;
end;

procedure TfrmOrdenLavanderia.DBEdit1Exit(Sender: TObject);
begin
  ProcesaCalculos
end;

procedure TfrmOrdenLavanderia.DBEdit2Exit(Sender: TObject);
begin
  ProcesaCalculos
end;

procedure TfrmOrdenLavanderia.DBEdit3Exit(Sender: TObject);
begin
  ProcesaCalculos;
end;

procedure TfrmOrdenLavanderia.edtBuscarChange(Sender: TObject);
begin
  if not pnlInventario.Visible then
  begin
    pnlInventario.Visible:=True;
    dmInventario.qryInventario.Locate('DESCRIPCION', edtBuscar.Text, [loPartialKey, loCaseInsensitive]);
    pnlInventario.BringToFront;
  end;
end;

procedure TfrmOrdenLavanderia.RxDBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = 13 then
  begin
    if (dmLavanderia.tblLAV_PRENDAid.IsNull) and (dmLavanderia.tblLAV_ORDENID.IsNull) then
    begin
     AgregarOrdenNueva;
     AgregarProducto(dmInventario.qryInvLookupCODIGO.Value);
    end else
    AgregarProducto(dmInventario.qryInvLookupCODIGO.Value);
    pnlInventario.Visible:=False;
    edtBuscar.Text:='';
  end;
end;

procedure TfrmOrdenLavanderia.RxDBGrid1DblClick(Sender: TObject);
begin
  if dmLavanderia.tblLAV_PRENDA.State  in [dsBrowse, dsInactive] then exit;
  if (dmLavanderia.tblLAV_PRENDAid.IsNull) and (dmLavanderia.tblLAV_ORDENID.IsNull) then
  begin
    AgregarOrdenNueva;
    AgregarProducto(dmInventario.qryInvLookupCODIGO.Value);
  end else
  AgregarProducto(dmInventario.qryInvLookupCODIGO.Value);
  pnlInventario.Visible:=False;
  edtBuscar.Text:='';
end;

procedure TfrmOrdenLavanderia.RxDBGrid1Exit(Sender: TObject);
begin
  pnlInventario.Visible:=False;
  pnlInventario.SendToBack;
  edtBuscar.Text:='';
end;

procedure TfrmOrdenLavanderia.pnlTopClick(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmOrdenLavanderia.BitBtn2Click(Sender: TObject);
var
  OrdenID: Integer;
  tR : Integer;
  flag:boolean;
begin
  btnGuardarClick(self);
  OrdenID := dmLavanderia.tblLAV_ORDENID.AsInteger;
  qrOrdenLavanderia:=TqrOrdenLavanderia.Create(nil);
  qrOrdenLavanderia.chkCodigoQR:= chkCodigoQR.Checked;

  try
    qrOrdenLavanderia.PrepararReporte(OrdenID);
    dmLavanderia.qryreportOrdenLavanderia.Last;
    tR := dmLavanderia.qryreportOrdenLavanderia.RecordCount;
    dmLavanderia.qryreportOrdenLavanderia.First;

    qrOrdenLavanderia.Prepare;

    //*****************
    if (qrOrdenLavanderia.PageNumber >= 2) then
    qrOrdenLavanderia.Page.Length:=4.0;

    if ((tR >= 1) and
       ((tR < 10)
       or (qrOrdenLavanderia.PageNumber = 2))) then
    begin
      ProgressBar1.Visible :=True;
      ProgressBar1.Position:=0;
      ProgressBar1.Max:=tR;

      repeat
      begin
        ProgressBar1.StepIt;
        //cRc:=cRc + 1;
        if (qrOrdenLavanderia.PageNumber > 1) then
        begin
          if (tR = 1) then
          qrOrdenLavanderia.Page.Length:= qrOrdenLavanderia.Page.Length + 0.75
          else
          qrOrdenLavanderia.Page.Length:= qrOrdenLavanderia.Page.Length +
          (tR - 1 ) * 0.25;

          qrOrdenLavanderia.Prepare;
          flag:=False;
        end else break;
        if (qrOrdenLavanderia.PageNumber = 1) then
        break;
      end;
      until flag = true;
    end;
    //*****************
    ProgressBar1.Visible :=False;
    qrOrdenLavanderia.Preview;
  finally
  FreeAndNil(qrOrdenLavanderia);
  end;
  Refresh;
end;

procedure TfrmOrdenLavanderia.InicializarServicios;
begin
  chklistaprocesos.Clear;
  dmlavanderia.qryLavServicios.close;
  dmlavanderia.qryLavServicios.Open;
  dmlavanderia.qryLavServicios.first;

  while not dmlavanderia.qryLavServicios.eof do  begin
    chklistaprocesos.Items.AddObject(dmLavanderia.qryLavServiciosDESCRIPCION.AsString,
      TObject(dmLavanderia.qryLavServiciosID.AsInteger));
    dmLavanderia.qryLavServicios.Next;
  end;
  chklistaprocesos.OnClickCheck := chkServiciosClickCheck;
end;

procedure TfrmOrdenLavanderia.GuardarServiciosPorPrenda(IDPrenda: Integer);
var
  i, idServicio: Integer;
begin
  // Eliminar servicios anteriores
  dmLavanderia.tblLAV_PRENDA_SERVICIO.DisableControls;
  dmLavanderia.tblLAV_PRENDA_SERVICIO.Cancel;
  dmLavanderia.tblLAV_PRENDA_SERVICIO.First;
  while not dmLavanderia.tblLAV_PRENDA_SERVICIO.Eof do
  begin
    if dmLavanderia.tbllav_prenda_servicioID_PRENDA.AsInteger = IDPrenda then
      dmLavanderia.tblLAV_PRENDA_SERVICIO.Delete
    else
      dmLavanderia.tblLAV_PRENDA_SERVICIO.Next;
  end;
  dmLavanderia.tblLAV_PRENDA_SERVICIO.EnableControls;

  // Insertar servicios seleccionados
  for i := 0 to chklistaprocesos.Items.Count - 1 do
  begin
    if chklistaprocesos.Checked[i] then
    begin
      idServicio := Integer(chklistaprocesos.Items.Objects[i]);
      dmLavanderia.tblLAV_PRENDA_SERVICIO.Append;
      dmLavanderia.tbllav_prenda_servicioID_PRENDA.AsInteger := IDPrenda;
      dmLavanderia.tbllav_prenda_servicioID_SERVICIO.AsInteger := idServicio;
      GlbSalvarQuery(dmLavanderia.tbllav_prenda_servicio);
    end;
  end;
end;

procedure TfrmOrdenLavanderia.CargarServiciosDePrenda(IDPrenda: Integer);
var
  i: Integer;
  idServicio: Integer;
begin
  for i := 0 to chklistaprocesos.Items.Count - 1 do
    chklistaprocesos.Checked[i] := False;

  dmLavanderia.tblLAV_PRENDA_SERVICIO.First;
  while not dmLavanderia.tblLAV_PRENDA_SERVICIO.Eof do
  begin
    if dmLavanderia.tblLAV_PRENDA_SERVICIOID_PRENDA.AsInteger = IDPrenda then
    begin
      idServicio := dmLavanderia.tblLAV_PRENDA_SERVICIOID_SERVICIO.AsInteger;
      for i := 0 to chklistaprocesos.Items.Count - 1 do
      begin
        if Integer(chklistaprocesos.Items.Objects[i]) = idServicio then
        begin
          chklistaprocesos.Checked[i] := True;
          Break;
        end;
      end;
    end;
    dmLavanderia.tblLAV_PRENDA_SERVICIO.Next;
  end;
end;

procedure TfrmOrdenLavanderia.chklistaprocesosClickCheck(Sender: TObject);
var
  idPrenda, idServicio: Integer;
  i: Integer;
begin
  if dmLavanderia.tblLAV_PRENDA.IsEmpty then
    Exit;

  idPrenda := dmLavanderia.tblLAV_PRENDAID.AsInteger;
  i := chklistaprocesos.ItemIndex;
  if i < 0 then Exit;

  idServicio := Integer(chklistaprocesos.Items.Objects[i]);

  if chklistaprocesos.Checked[i] then
  begin
    // Agregar servicio
    with dmLavanderia.tblLAV_PRENDA_SERVICIO do
    begin
      Append;
      FieldByName('ID_PRENDA').AsInteger := idPrenda;
      FieldByName('ID_SERVICIO').AsInteger := idServicio;
      GlbSalvarQuery(dmLavanderia.tblLAV_PRENDA_SERVICIO);
    end;
  end
  else
  begin
    // Eliminar servicio
    with dmLavanderia.tblLAV_PRENDA_SERVICIO do
    begin
      First;
      while not EOF do
      begin
        if (FieldByName('ID_PRENDA').AsInteger = idPrenda) and
           (FieldByName('ID_SERVICIO').AsInteger = idServicio) then
        begin
          Delete;
          GlbSalvarQuery(dmLavanderia.tblLAV_PRENDA_SERVICIO);
          Break;
        end;
        Next;
      end;
    end;
  end;
end;

procedure TfrmOrdenLavanderia.chkServiciosClickCheck(Sender: TObject);
var
  idPrenda, idServicio: Integer;
  i: Integer;
begin
  if dmLavanderia.tblLAV_PRENDA.IsEmpty then Exit;
  idPrenda := dmLavanderia.tblLAV_PRENDAID.AsInteger;
  i := chklistaprocesos.ItemIndex;
  if i < 0 then Exit;
  idServicio := Integer(chklistaprocesos.Items.Objects[i]);

  if chklistaprocesos.Checked[i] then
  begin
    dmLavanderia.tblLAV_PRENDA_SERVICIO.Append;
    dmLavanderia.tblLAV_PRENDA_SERVICIOID_PRENDA.AsInteger := idPrenda;
    dmLavanderia.tblLAV_PRENDA_SERVICIOID_SERVICIO.AsInteger := idServicio;
    GlbSalvarQuery(dmLavanderia.tblLAV_PRENDA_SERVICIO);
  end
  else
  begin
    dmLavanderia.tblLAV_PRENDA_SERVICIO.First;
    while not dmLavanderia.tblLAV_PRENDA_SERVICIO.Eof do
    begin
      if (dmLavanderia.tblLAV_PRENDA_SERVICIOID_PRENDA.AsInteger = idPrenda) and
         (dmLavanderia.tblLAV_PRENDA_SERVICIOID_SERVICIO.AsInteger = idServicio) then
      begin
        dmLavanderia.tblLAV_PRENDA_SERVICIO.Delete;
        GlbSalvarQuery(dmLavanderia.tblLAV_PRENDA_SERVICIO);
        Break;
      end;
      dmLavanderia.tblLAV_PRENDA_SERVICIO.Next;
    end;
  end;
end;

procedure TfrmOrdenLavanderia.dbgCestaCellClick(Column: TColumn);
begin
  if not dmLavanderia.tblLAV_PRENDA.IsEmpty then
    CargarServiciosDePrenda(dmLavanderia.tblLAV_PRENDAID.AsInteger);
end;

procedure TfrmOrdenLavanderia.SpeedButton1Click(Sender: TObject);
begin
  FrmBuscarClientesPersonas:=TFrmBuscarClientesPersonas.Create(nil);
    try
      FrmBuscarClientesPersonas.CodigoCliente := -1;
      if FrmBuscarClientesPersonas.Showmodal = mrOk then
      begin
        if dmLavanderia.dstblLAV_ORDEN.State In [dsInsert, dsEdit] then
           dmLavanderia.tblLAV_ORDENID_CLIENTE.Value:=FrmBuscarClientesPersonas.CodigoCliente;
      end;
    finally
    FrmBuscarClientesPersonas.Free;
    FrmBuscarClientesPersonas:=Nil;
    end;
end;

procedure TfrmOrdenLavanderia.Clientes1Click(Sender: TObject);
begin
  frmClientes:=TfrmClientes.Create(Self);
  try
    dmUsuarios.qryRoles.Close;
    dmUsuarios.qryRoles.Params[0].Value:= VarUsuarioGlb;
    dmUsuarios.qryRoles.Open;
    dmUsuarios.qryRoles.First;
    While Not dmUsuarios.qryRoles.Eof Do
    begin
      ActivaPermiso(TForm(frmClientes), 1000, dmUsuarios.qryRolesID_ROL.Value, 0);//menu principal: 1000 debe estar en la tabla PROCESOS
      dmUsuarios.qryRoles.Next;
    end;
    if dmLavanderia.tblLAV_ORDENid_cliente.Value > 0 then
    begin
      dmclientes.tblClientes.Tag:=-1;
      dmclientes.tblClientes.DisableControls;
      dmclientes.tblClientes.Locate('CODIGO_CTE', dmLavanderia.tblLAV_ORDENid_cliente.Value,[]);
      dmclientes.tblClientes.Tag:=0;
      dmclientes.tblClientes.EnableControls;
    end;
    frmClientes.PageControl1.ActivePageIndex:=0;
    frmClientes.Showmodal;
  finally
  frmClientes.Free;
  frmClientes:=Nil;
  end;
end;

procedure TfrmOrdenLavanderia.BitBtn3Click(Sender: TObject);
begin
  if dmLavanderia.tblLAV_ORDENID.IsNull then exit;
  dmLavanderia.tblLAV_ORDEN.Edit;
  dmLavanderia.tblLAV_PRENDA.Edit;
end;


procedure TfrmOrdenLavanderia.BitBtn4Click(Sender: TObject);
var
  x,y:integer;
begin
  btnGuardarClick(self);
  dmLavanderia.tblLAV_PRENDA.Last;
  y:=dmLavanderia.tblLAV_PRENDA.RecordCount;
  x:=0;
  dmLavanderia.tblLAV_PRENDA.First;
  dmLavanderia.qryrepstickersprendas.Close;
  dmLavanderia.qryrepstickersprendas.Params[0].Value:=dmLavanderia.tblLAV_ORDENID.Value;
  dmLavanderia.qryrepstickersprendas.Open;
  dmLavanderia.qryrepstickersprendas.Last;
  y:=dmLavanderia.qryrepstickersprendas.RecordCount;

  dmLavanderia.qryrepstickersprendas.First;
  while not dmLavanderia.qryrepstickersprendas.eof do
    begin
      x:=x + 1;
      qckstickerprenda:=Tqckstickerprenda.Create(Nil);
      try
        qckstickerprenda.chkCodigoQR:=chkCodigoQR.Checked;
        qckstickerprenda.QRLabelIDOrden.Caption:= '#lspc' + IntToStr(dmLavanderia.qryrepstickersprendasID_ORDEN.Value);
        qckstickerprenda.QRLabelFechaEntrega.Caption :=
        NombreDia[DayOfWeek(dmLavanderia.qryrepstickersprendasFECHA_ENTREGA.Value)]+' '+
        FormatDateTime('dd/mm', dmLavanderia.qryrepstickersprendasFECHA_ENTREGA.AsDateTime)+' '+
        FormatDateTime('hh:mma/p', dmLavanderia.qryrepstickersprendasHORA_ENTREGA.AsDateTime);
        qckstickerprenda.Preview;
      finally
      qckstickerprenda.free;
      qckstickerprenda:=nil;
      end;
      dmLavanderia.qryrepstickersprendas.Next;
    end;
end;

procedure TfrmOrdenLavanderia.BitBtn5Click(Sender: TObject);
begin
  SelFechaCnt1.EsLavanderia:=True;
  if SelFechaCnt1.Execute then
  begin
    dmLavanderia.tblLAV_ORDEN.Close;
    dmLavanderia.tblLAV_ORDEN.SelectSQL.Clear;
    lblConsultan.Caption:='';
    if SelFechaCnt1.TipoRes = 1 then
    begin
      dmLavanderia.tblLAV_ORDEN.SelectSQL.Text:=
      'Select * From LAV_ORDEN where fecha_entrada between :fechaini and :fechafin';
      lblConsultan.Caption:='Consultando Entradas';
    end else
    if SelFechaCnt1.TipoRes = 2 then
    begin
      dmLavanderia.tblLAV_ORDEN.SelectSQL.Text:=
      'Select * From LAV_ORDEN where fecha_entrega between :fechaini and :fechafin';
      lblConsultan.Caption:='Consultando Salidas';
    end else
    begin
      dmLavanderia.tblLAV_ORDEN.SelectSQL.Text:=
      'Select * From LAV_ORDEN where fecha_entrada between :fechaini and :fechafin';
      lblConsultan.Caption:='';
    end;
    dmLavanderia.tblLAV_ORDEN.params[0].Value:= ExtraerFecha(SelFechaCnt1.Fecha);
    dmLavanderia.tblLAV_ORDEN.params[1].Value:= ExtraerFecha(SelFechaCnt1.FechaFinal);
    dmLavanderia.tblLAV_ORDEN.Open;
  end;
end;

procedure TfrmOrdenLavanderia.BitBtn9Click(Sender: TObject);
begin
  dmLavanderia.tblLAV_ORDEN.First;
end;

procedure TfrmOrdenLavanderia.BitBtn10Click(Sender: TObject);
begin
  dmLavanderia.tblLAV_ORDEN.Prior;
end;

procedure TfrmOrdenLavanderia.BitBtn11Click(Sender: TObject);
begin
  dmLavanderia.tblLAV_ORDEN.next;
end;

procedure TfrmOrdenLavanderia.BitBtn12Click(Sender: TObject);
begin
  dmLavanderia.tblLAV_ORDEN.Last;
end;

procedure TfrmOrdenLavanderia.edtBuscarQROrdenChange(Sender: TObject);
begin
  //Pendiente codificar;
  //edtBuscarQROrden.Text;
end;

procedure TfrmOrdenLavanderia.dstblLAV_ORDENDataChange(Sender: TObject;
  Field: TField);
begin
  if FActualizando then exit;
  if not dmLavanderia.tblLAV_ORDEN.IsEmpty then
  begin
    if not dmLavanderia.tblLAV_ORDENhora_entrada.IsNull then
      dtpHoraEntrada.Time := ExtraerHora(dmLavanderia.tblLAV_ORDENhora_entrada.AsDateTime)
    else
      dtpHoraEntrada.Time := Now;

    if not dmLavanderia.tblLAV_ORDENhora_ENTREGA.IsNull then
      dtpHoraEntrega.Time := ExtraerHora(dmLavanderia.tblLAV_ORDENhora_ENTREGA.AsDateTime)
    else
      dtpHoraEntrega.Time := Now;
  end;
end;

end.

