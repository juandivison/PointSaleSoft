unit UBalanceClientesPlanf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, RXDBCtrl, StdCtrls, Buttons, EditNew,
  RXCtrls;

type
  TfrmBalanceCtesPF = class(TForm)
    RxDBGrid1: TRxDBGrid;
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
  frmBalanceCtesPF: TfrmBalanceCtesPF;
  strSql:TStringList;
implementation

uses uglobal, UFormSelFecha, UDatModCxc,
  URepFactPendCxc, UDatModCompania, UDatModBalanceCxc;

{$R *.dfm}

procedure TfrmBalanceCtesPF.FormCreate(Sender: TObject);
begin
  strSql:=TStringlist.Create;
  dmBalanceCxc.qryBalancePlanF.Close;
  dmBalanceCxc.qryBalancePlanF.Filtered:=False;
  dmBalanceCxc.qryBalancePlanF.Open;
  dmbalancecxc.qryBalancePlanF.next;
  dmbalancecxc.qryBalancePlanF.First;
end;

procedure TfrmBalanceCtesPF.dsqryBalanceCteDataChange(Sender: TObject;
  Field: TField);
begin
  Label3.Caption:=Format('%*.*m', [10, 2, dmbalancecxc.qryBalancePlanFBALANCE_ACT.Value]);
end;

procedure TfrmBalanceCtesPF.RxDBGrid1DrawColumnCell(Sender: TObject;
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

procedure TfrmBalanceCtesPF.FormShow(Sender: TObject);
begin
  dmBalanceCxc.qryTotalBalancePF.Close;
  dmBalanceCxc.qryTotalBalancePF.ExecQuery;
  if dmBalanceCxc.qryTotalBalancePF.Open then
  begin
    Label3.Caption:=dmbalancecxc.qryBalancePlanFBALANCE_ACT.AsString;

    if Pos('.',label3.Caption) = 0 then
    Label3.Caption:=Label3.Caption + '.00';
    Label3.Caption:=InsertarComa(Label3.Caption);

    Label4.Caption:=dmBalanceCxc.qryTotalBalancePF.Current.Vars[0].AsString;
    if Pos('.',label4.Caption) = 0 then
    Label4.Caption:=Label4.Caption + '.00';
    Label4.Caption:=InsertarComa(Label4.Caption);
  end;
  dmBalanceCxc.qryTotalBalancePF.Close;
end;

procedure TfrmBalanceCtesPF.BitBtn6Click(Sender: TObject);
begin
  dmbalancecxc.qryBalancePlanF.First;
end;

procedure TfrmBalanceCtesPF.BitBtn4Click(Sender: TObject);
begin
  dmbalancecxc.qryBalancePlanF.Prior;
end;

procedure TfrmBalanceCtesPF.BitBtn3Click(Sender: TObject);
begin
  dmbalancecxc.qryBalancePlanF.Next;
end;

procedure TfrmBalanceCtesPF.BitBtn5Click(Sender: TObject);
begin
  dmbalancecxc.qryBalancePlanF.Last;
end;



procedure TfrmBalanceCtesPF.BitBtn1Click(Sender: TObject);
begin
  if EditN1.text <> '' then
  begin
    if not dmbalancecxc.qryBalancePlanF.Locate('CODIGO',EditN1.ValueInteger,[]) then
    MessageDlg('Codigo '+editn1.Text+' no encontrado, verifique',mtInformation, [mbOK], 0);
  end else
  begin
    MessageDlg('Opcion en construccion...',mtInformation, [mbOK], 0);
  end;
end;

procedure TfrmBalanceCtesPF.BitBtn7Click(Sender: TObject);
begin
  if strSql.Count = 0 then
  strSql.Text:=dmbalancecxc.qryBalancePlanF.SQL.Text;
  dmbalancecxc.qryBalancePlanF.DisableControls;
  dmbalancecxc.qryBalancePlanF.Close;
  dmbalancecxc.qryBalancePlanF.SQL.Text:=
  'SELECT '+
  'b.BALANCE_ACT,'+
  'b.BALANCE_ANT,'+
  'b.CODIGO_CTE CODIGO,'+
  'b.CREDITO_ACM,'+
  'b.DEBITO_ACM,'+
  'b.FECHA_BLCE,'+
  'b.FECHA_ULT_PAGO,'+
  'b.STATUS,'+
  'c.nombre_facturar,'+
  'c.telef_contacto,'+
  'c.contacto,'+
  'c.foto ' +
  'FROM BLC_PLAN_FUNERARIO b, CLIENTES c '+
  'WHERE b.codigo_cte = c.codigo_cte '+
  'ORDER BY c.codigo_cte';
  dmbalancecxc.qryBalancePlanF.Open;
  dmbalancecxc.qryBalancePlanF.EnableControls;
end;

procedure TfrmBalanceCtesPF.BitBtn8Click(Sender: TObject);
begin
  if strSql.Count = 0 then exit;
  dmbalancecxc.qryBalancePlanF.DisableControls;
  dmbalancecxc.qryBalancePlanF.Close;
  dmbalancecxc.qryBalancePlanF.SQL.Text:=strSql.Text;
  dmbalancecxc.qryBalancePlanF.EnableControls;
  dmbalancecxc.qryBalancePlanF.Open;
end;

procedure TfrmBalanceCtesPF.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Assigned(strsql) then
  begin
    strSql.free;
    strSql:=nil;
  end;
end;

procedure TfrmBalanceCtesPF.BitBtn2Click(Sender: TObject);
begin
  frmselFecha:=TfrmselFecha.Create(nil);
  try
    if frmselFecha.showmodal = mrok then
    begin
      dmcxc.fDesc:='PLAN FUNERARIO';
      dmCxc.qryFactPendientes.Close;
      dmCxc.qryFactPendientes.Filtered:=False;      
      dmCxc.qryFactPendientes.Params[0].Value:= ExtraerFecha(frmSelFecha.FechaIni.Date);
      dmCxc.qryFactPendientes.Params[1].Value:= ExtraerFecha(frmSelFecha.FechaFin.Date);
      dmCxc.qryFactPendientes.Params[2].Value:= dmBalanceCxc.qryBalancePlanFCODIGO.Value;
      dmCxc.qryFactPendientes.Filtered:=True;
      dmCxc.qryFactPendientes.Open;
      dmcompania.tblCompania.Close;
      dmcompania.tblCompania.Open;
      qckFactPendCxc:=TqckFactPendCxc.Create(nil);
      try
        qckFactPendCxc.Prepare;
        glbTPag := qckFactPendCxc.PageNumber;
        qckFactPendCxc.qrTpaginas.Caption:= IntToStr(glbTPag);
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
