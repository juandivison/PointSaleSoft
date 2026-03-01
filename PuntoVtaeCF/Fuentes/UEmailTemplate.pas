unit UEmailTemplate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, DBCtrls, DB, StdCtrls, WinSkinData, Buttons, Grids,
  DBGrids, RxDBCtrl, RxCtrls, RxLookup, Menus;

type
  TfrmEmailTemplate = class(TForm)
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton1: TSpeedButton;
    DBStatusLabel1: TDBStatusLabel;
    RxDBGrid1: TRxDBGrid;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    SkinData1: TSkinData;
    Label1: TLabel;
    DBMemo1: TDBMemo;
    DataSource1: TDataSource;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    RxDBLookupCombo2: TRxDBLookupCombo;
    Label3: TLabel;
    dstblTipoAfiliado: TDataSource;
    BitBtn1: TBitBtn;
    Label26: TLabel;
    RxDBLookupCombo4: TRxDBLookupCombo;
    Label4: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    dsqryEmailProcesoLookup: TDataSource;
    RxSpeedButton1: TRxSpeedButton;
    PopupMenu1: TPopupMenu;
    Replicar1: TMenuItem;
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure RxDBLookupCombo4Exit(Sender: TObject);
    procedure Replicar1Click(Sender: TObject);
  private
  function VerSiTieneTamplate(ciakey:integer;idtipo:integer;tipoAfiliado:integer):boolean;

  public
    { Public declarations }
  end;

var
  frmEmailTemplate: TfrmEmailTemplate;

implementation

uses UGlobal, UDatModCompania, UDatmodDatosGenerales;

{$R *.dfm}

procedure TfrmEmailTemplate.BitBtn10Click(Sender: TObject);
begin
  dmDatos.tblEmailTemplate.prior;
end;

procedure TfrmEmailTemplate.BitBtn11Click(Sender: TObject);
begin
  dmDatos.tblEmailTemplate.next;
end;

procedure TfrmEmailTemplate.BitBtn12Click(Sender: TObject);
begin
  dmDatos.tblEmailTemplate.Last;
end;

procedure TfrmEmailTemplate.BitBtn9Click(Sender: TObject);
begin
  dmDatos.tblEmailTemplate.first;
end;

procedure TfrmEmailTemplate.SpeedButton1Click(Sender: TObject);
var
  bookm:TBookmark;
begin
  if dmDatos.tblEmailTemplate.State in [dsinsert, dsEdit] then
  begin
    if dmDatos.tblEmailTemplate.State in [dsinsert] then
    begin
      dmDatos.tblEmailTemplateID.Value:= FsqlMaxNumero('email_template','id');
      dmDatos.tblEmailTemplateCIA_KEY.Value:= glbCia_Key;
    end;
    GlbSalvarQuery(dmDatos.tblEmailTemplate);
    bookm:=dmDatos.tblEmailTemplate.GetBookmark;
    dmDatos.tblEmailTemplate.close;
    dmDatos.tblEmailTemplate.open;
    dmDatos.tblEmailTemplate.FreeBookmark(bookm);
  end;
end;

procedure TfrmEmailTemplate.SpeedButton2Click(Sender: TObject);
begin
  if dmDatos.tblEmailTemplate.State = dsBrowse then
  begin
    dmDatos.tblEmailTemplate.Append;
    dmDatos.tblEmailTemplateCIA_KEY.Value:= glbCia_Key;
    if showing then
    RxDBLookupCombo4.SetFocus;
  end;
end;

procedure TfrmEmailTemplate.SpeedButton3Click(Sender: TObject);
begin
  if dmDatos.tblEmailTemplate.State in [dsinsert, dsEdit] then
  begin
    dmDatos.tblEmailTemplate.Cancel;
  end;
end;

procedure TfrmEmailTemplate.FormCreate(Sender: TObject);
begin
  dmDatos.tblTipoAfiliado.close;
  dmDatos.tblTipoAfiliado.open;
  dmDatos.tblEmailTemplate.Close;
  dmDatos.tblEmailTemplate.Open;
  dmCompania.tblCompania.Close;
  dmCompania.tblCompania.Open;
  dmCompania.tblCompania.Locate('CODIGO',GlbCia_Key,[]);
  dmDatos.qryEmailProcesoLookup.Close;
  dmDatos.qryEmailProcesoLookup.Open;
end;

procedure TfrmEmailTemplate.BitBtn1Click(Sender: TObject);
begin
  if dmDatos.tblEmailTemplate.State = dsBrowse then
  begin
    dmDatos.tblEmailTemplate.Delete;
    SpeedButton1Click(Self);
  end;
end;

procedure TfrmEmailTemplate.RxDBLookupCombo4Exit(Sender: TObject);
begin
  dmdatos.tblTipoAfiliado.Close;
  dmdatos.tblTipoAfiliado.Open;
end;

procedure TfrmEmailTemplate.Replicar1Click(Sender: TObject);
var
  x,xciakey:integer;
  xidtipo:integer;
  xtipoAfiliado:integer;
  subject:string;
  body:TMemo;
begin
  {frmReplicarEmailTemp:=TfrmReplicarEmailTemp.Create(nil);
  try
    xciakey   := dmDatos.tblEmailTemplateCIA_KEY.Value;
    xidtipo   := dmDatos.tblEmailTemplateIDTIPO.Value;
    xtipoAfiliado:= dmDatos.tblEmailTemplateACCOUNT_ID.Value;
    subject   := dmDatos.tblEmailTemplateSUBJECT.Value;
    body      := Tmemo.Create(self);
    body.Text:= dmDatos.tblEmailTemplateBody.Value;
    
    if frmReplicarEmailTemp.showmodal = mrok then
    begin
      for x:=0 to frmReplicarEmailTemp.RxDBGrid1.SelCount-1 do
      begin
        with frmReplicarEmailTemp.RxDBGrid1.DataSource.DataSet do
        GotoBookmark(Pointer(frmReplicarEmailTemp.RxDBGrid1.SelectedRows.Items[x]));
        xtipoAfiliado:=dmResidentes.qryAccountACCOUNT_ID.Value;
        if not VerSiTieneTamplate(xciakey,xidtipo,xtipoAfiliado) then
        begin
          dmDatos.tblEmailTemplate.Append;
          dmDatos.tblEmailTemplateIDTIPO.Value :=xidtipo;
          dmDatos.tblEmailTemplateCIA_KEY.Value:=xciakey;
          dmDatos.tblEmailTemplateACCOUNT_ID.Value:=xtipoAfiliado;
          dmDatos.tblEmailTemplateBODY.Value   :=body.Text;
          dmDatos.tblEmailTemplateSUBJECT.Value:=subject;
          if dmDatos.tblEmailTemplateID.IsNull then
          dmDatos.tblEmailTemplateID.Value:= FsqlMaxNumero('email_template','id');
          GlbSalvarQuery(dmDatos.tblEmailTemplate);
        end;
      end;
    end;
  finally
  frmReplicarEmailTemp.free;
  frmReplicarEmailTemp:=nil;
  dmDatos.tblEmailTemplate.close;
  dmDatos.tblEmailTemplate.open;
  end;}
end;

function TfrmEmailTemplate.VerSiTieneTamplate(ciakey, idtipo,
  tipoAfiliado: integer): boolean;
begin
  dmdatos.qryBuscarEmailTemplate.Close;
  dmdatos.qryBuscarEmailTemplate.Params[0].Value:=ciakey;
  dmdatos.qryBuscarEmailTemplate.Params[1].Value:=idtipo;
  dmdatos.qryBuscarEmailTemplate.Params[2].Value:=tipoAfiliado;
  dmdatos.qryBuscarEmailTemplate.Open;
  dmdatos.qryBuscarEmailTemplate.First;
  if dmdatos.qryBuscarEmailTemplate.RecordCount > 0 then
  result:=true else result:=false;
end;

end.
