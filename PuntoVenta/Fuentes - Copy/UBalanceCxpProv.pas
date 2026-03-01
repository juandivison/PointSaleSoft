unit  UBalanceCxpProv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, RXDBCtrl, StdCtrls, Buttons, EditNew,
  RXCtrls, WinSkinData;

type
  TfrmBalanceCxpProv = class(TForm)
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
    SkinData1: TSkinData;
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBalanceCxpProv: TfrmBalanceCxpProv;
  strSql:TStringList;
implementation

uses UDatModCxc, uglobal, UDatModBalanceCxc;

{$R *.dfm}

procedure TfrmBalanceCxpProv.FormCreate(Sender: TObject);
begin
  strSql:=TStringlist.Create;
  dmCxc.qryBalanceProv.Close;
  dmCxc.qryBalanceProv.Filtered := False;
  dmCxc.qryBalanceProv.Open;
  dmCxc.qryBalanceProv.Next;
  dmCxc.qryBalanceProv.First;
end;

procedure TfrmBalanceCxpProv.dsqryBalanceCteDataChange(Sender: TObject;
  Field: TField);
begin
  Label3.Caption:=Format('%*.*m', [10, 2, dmCxc.qryBalanceProvBALANCE_ACT.Value]);
end;

procedure TfrmBalanceCxpProv.RxDBGrid1DrawColumnCell(Sender: TObject;
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
      Picture.Assign(dmCxc.qryBalanceProv.FieldByName('foto'));
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

procedure TfrmBalanceCxpProv.FormShow(Sender: TObject);
begin
  dmBalanceCxc.qryTotalCxP.Close;
  dmBalanceCxc.qryTotalCxP.ExecQuery;

  if dmBalanceCxc.qryTotalCxP.Open then
  begin
    Label3.Caption:=Format('m', [10, 2, dmCxc.qryBalanceProvBALANCE_ACT.Value]);
    Label4.Caption:=dmBalanceCxc.qryTotalCxP.Current.Vars[0].AsString;
    if Pos('.',label4.Caption) = 0 then
    Label4.Caption := Label4.Caption + '.00';
    Label4.Caption := InsertarComa(Label4.Caption);
  end;
  dmBalanceCxc.qryTotalCxP.Close;
end;

procedure TfrmBalanceCxpProv.BitBtn6Click(Sender: TObject);
begin
  dmCxc.qryBalanceProv.First;
end;

procedure TfrmBalanceCxpProv.BitBtn4Click(Sender: TObject);
begin
  dmCxc.qryBalanceProv.Prior;
end;

procedure TfrmBalanceCxpProv.BitBtn3Click(Sender: TObject);
begin
  dmCxc.qryBalanceProv.Next;
end;

procedure TfrmBalanceCxpProv.BitBtn5Click(Sender: TObject);
begin
  dmCxc.qryBalanceProv.Last;
end;



procedure TfrmBalanceCxpProv.BitBtn1Click(Sender: TObject);
begin
  if EditN1.text <> '' then
  begin
    if not dmCxc.qryBalanceProv.Locate('CODIGO',EditN1.ValueInteger,[]) then
    MessageDlg('Codigo '+editn1.Text+' no encontrado, verifique',mtInformation, [mbOK], 0);
  end else
  begin
    MessageDlg('Opcion en construccion...',mtInformation, [mbOK], 0);
  end; 
end;

procedure TfrmBalanceCxpProv.BitBtn7Click(Sender: TObject);
begin
  if strSql.Count = 0 then
  strSql.Text:=dmCxc.qryBalanceProv.SelectSQL.Text;
  dmCxc.qryBalanceProv.DisableControls;
  dmCxc.qryBalanceProv.Close;
  {dmCxc.qryBalanceProv.SelectSQL.Text:='SELECT '+
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
  //'b.SERVICIO, '+
  'b.STATUS_BCE, '+
  'c.nombre_facturar, '+
  'c.telef_contacto, '+
  'c.contacto, '+
  'c.foto '+
  'FROM BALANCE_cxp b, Proveedores c '+
  'Where b.codigo = c.codigo_cte '+
  'Order By c.nombre_facturar ';    }
  dmCxc.qryBalanceProv.Open;//dmCxc.qryBalanceProv.SelectSQL.Text;
  dmCxc.qryBalanceProv.EnableControls;
end;

procedure TfrmBalanceCxpProv.BitBtn8Click(Sender: TObject);
begin
  if strSql.Count = 0 then Exit; 
  dmCxc.qryBalanceProv.DisableControls;
  dmCxc.qryBalanceProv.Close;
  dmCxc.qryBalanceProv.SelectSQL.Text := StrSql.Text;
  dmCxc.qryBalanceProv.EnableControls;
  dmCxc.qryBalanceProv.Open;
end;

procedure TfrmBalanceCxpProv.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Assigned(StrSql) then
  begin
    strSql.Free;
    strSql := Nil;
  end;
  dmCxc.qryBalanceProv.Close;
end;

end.
