unit UBalanceCxcClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, RXDBCtrl, StdCtrls, Buttons, EditNew,
  RXCtrls;

type
  TfrmBalanceCxcCtes = class(TForm)
    RxDBGrid1: TRxDBGrid;
    dsqryBalanceCte: TDataSource;
    EditN1: TEditN;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    EditN2: TEditN;
    Label2: TLabel;
    RxLabel1: TRxLabel;
    RxLabel2: TRxLabel;
    Label3: TLabel;
    Label4: TLabel;
    BitBtn6: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure dsqryBalanceCteDataChange(Sender: TObject; Field: TField);
    procedure RxDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBalanceCxcCtes: TfrmBalanceCxcCtes;
  strSql:TStringList;
implementation

uses UDatModBalanceCxc, uglobal, UFormSelFecha, UDatModCxc,
  URepFactPendCxc, UDatModCompania;

{$R *.dfm}

procedure TfrmBalanceCxcCtes.FormCreate(Sender: TObject);
begin
  strSql:=TStringlist.Create;
  dmBalanceCxc.qryBalanceCte.Close;
  dmBalanceCxc.qryBalanceCte.Filtered:=False;
  dmBalanceCxc.qryBalanceCte.Open;
  dmbalancecxc.qryBalanceCte.next;
  dmbalancecxc.qryBalanceCte.First;
end;

procedure TfrmBalanceCxcCtes.dsqryBalanceCteDataChange(Sender: TObject;
  Field: TField);
begin
  Label3.Caption:=Format('%*.*m', [10, 2, dmbalancecxc.qryBalanceCteBALANCE_ACT.Value]);
end;

procedure TfrmBalanceCxcCtes.RxDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Picture: TPicture;
  OutRect: TRect;
  PictWidth: Integer;
begin
  // default output rectangle
  {OutRect := Rect;
  if UpperCase(Column.FieldName)  = 'NOMBRE_FACTURAR' then
  Begin
    // Draw the image
    Picture := TPicture.Create;
    try
      Picture.Assign(dmBalanceCxc.qryBalanceCte.FieldByName('foto'));
      PictWidth := (Rect.Bottom - Rect.Top) * 2;
      OutRect.Right := Rect.Left + PictWidth;
      RxDBGrid1.Canvas.StretchDraw (OutRect, Picture.Graphic);
    finally
      Picture.Free;
    end;
    // Reset output rectangle, leaving space for the graphic
    OutRect := Rect;
    OutRect.Left := OutRect.Left + PictWidth;
  end;
   // Default drawing
  RxDBGrid1.DefaultDrawDataCell (OutRect, Column.Field, State);}
end;

procedure TfrmBalanceCxcCtes.FormShow(Sender: TObject);
begin
  dmBalanceCxc.qryTotalCxc.Close;
  dmBalanceCxc.qryTotalCxc.ExecQuery;
  if dmBalanceCxc.qryTotalCxc.Open then
  begin
    Label3.Caption:=Format('m', [10, 2, dmbalancecxc.qryBalanceCteBALANCE_ACT.Value]);
    Label4.Caption:=dmBalanceCxc.qryTotalCxc.Current.Vars[0].AsString;
    if Pos('.',label4.Caption) = 0 then
    Label4.Caption:=Label4.Caption + '.00';
    Label4.Caption:=InsertarComa(Label4.Caption);
  end;
  dmBalanceCxc.qryTotalCxc.Close;
end;

procedure TfrmBalanceCxcCtes.BitBtn6Click(Sender: TObject);
begin
  dmbalancecxc.qryBalanceCte.First;
end;

procedure TfrmBalanceCxcCtes.BitBtn4Click(Sender: TObject);
begin
  dmbalancecxc.qryBalanceCte.Prior;
end;

procedure TfrmBalanceCxcCtes.BitBtn3Click(Sender: TObject);
begin
  dmbalancecxc.qryBalanceCte.Next;
end;

procedure TfrmBalanceCxcCtes.BitBtn5Click(Sender: TObject);
begin
  dmbalancecxc.qryBalanceCte.Last;
end;



procedure TfrmBalanceCxcCtes.BitBtn1Click(Sender: TObject);
begin
  if EditN1.text <> '' then
  begin
    if not dmbalancecxc.qryBalanceCte.Locate('CODIGO',EditN1.ValueInteger,[]) then
    MessageDlg('Codigo '+editn1.Text+' no encontrado, verifique',mtInformation, [mbOK], 0);
  end else
  begin
    MessageDlg('Opcion en construccion...',mtInformation, [mbOK], 0);
  end; 
end;

procedure TfrmBalanceCxcCtes.BitBtn7Click(Sender: TObject);
begin
  if strSql.Count = 0 then
  strSql.Text:=dmbalancecxc.qryBalanceCte.SelectSQL.Text;
  dmbalancecxc.qryBalanceCte.DisableControls;
  dmbalancecxc.qryBalanceCte.Close;
  dmbalancecxc.qryBalanceCte.SelectSQL.Text:='SELECT '+
  'b.BALANCE_ACT, '+
  'b.BALANCE_ANT, '+
  'b.CODIGO, '+
  'b.CREDITO_ACM, '+
  'b.CREDITO_MES, '+
  'b.DEBITO_ACM, '+
  'b.DEBITO_MES, '+
  'b.FECHA_BCE, '+
  'b.FECHA_IN, '+
  'b.FECHA_MOD, '+
  'b.FECHA_ULT_PAGO, '+
  'b.IN_POR, '+
  'b.MOD_POR, '+
  'b.MONEDA, '+
  'b.SERVICIO, '+
  'b.STATUS_BCE, '+
  'c.nombre_facturar, '+
  'c.telef_contacto, '+
  'c.contacto, '+
  'c.foto '+
  'FROM BALANCE_CTE b, CLIENTES c '+
  'Where b.codigo = c.codigo_cte '+
  'order by c.nombre_facturar ';
  dmbalancecxc.qryBalanceCte.Open;
  dmbalancecxc.qryBalanceCte.EnableControls;
end;

procedure TfrmBalanceCxcCtes.BitBtn8Click(Sender: TObject);
begin
  if strSql.Count = 0 then exit; 
  dmbalancecxc.qryBalanceCte.DisableControls;
  dmbalancecxc.qryBalanceCte.Close;
  dmbalancecxc.qryBalanceCte.SelectSQL.Text:=strSql.Text;
  dmbalancecxc.qryBalanceCte.EnableControls;
  dmbalancecxc.qryBalanceCte.Open;
end;

procedure TfrmBalanceCxcCtes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Assigned(strsql) then
  begin
    strSql.free;
    strSql:=nil;
  end;
end;

procedure TfrmBalanceCxcCtes.BitBtn2Click(Sender: TObject);
begin
  frmselFecha:=TfrmselFecha.Create(nil);
  try
    if frmselFecha.showmodal = mrok then
    begin
      dmCxc.qryFactPendientes.Close;
      dmCxc.qryFactPendientes.Params[0].Value:= ExtraerFecha(frmSelFecha.FechaIni.Date);
      dmCxc.qryFactPendientes.Params[1].Value:= ExtraerFecha(frmSelFecha.FechaFin.Date);
      dmCxc.qryFactPendientes.Params[2].Value:= dmBalanceCxc.qryBalanceCteCODIGO.Value;
      dmCxc.qryFactPendientes.Open;
      dmcompania.tblCompania.Close;
      dmcompania.tblCompania.Open;
      qckFactPendCxc:=TqckFactPendCxc.Create(nil);
      try
        qckFactPendCxc.Preview;
      finally
      qckFactPendCxc.free;
      qckFactPendCxc:=nil;
      end;
    end;
  finally
  frmselFecha.free;
  frmselFecha:=nil;
  end;

end;

end.
