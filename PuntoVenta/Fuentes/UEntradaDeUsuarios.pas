unit UEntradaDeUsuarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, StdCtrls, Mask, DBActns, ActnList, Buttons,
  RXCtrls, RXDBCtrl, DB, ExtDlgs, RxDBComb;

type
  TfrmEntradaUsuarios = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Panel1: TPanel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    ActionList1: TActionList;
    DataSetInsert1: TDataSetInsert;
    DataSetEdit1: TDataSetEdit;
    DataSetPost1: TDataSetPost;
    DataSetCancel1: TDataSetCancel;
    DataSetRefresh1: TDataSetRefresh;
    DataSetFirst1: TDataSetFirst;
    DataSetPrior1: TDataSetPrior;
    DataSetNext1: TDataSetNext;
    DataSetLast1: TDataSetLast;
    DBStatusLabel1: TDBStatusLabel;
    dstblUsuarios: TDataSource;
    Panel3: TPanel;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    DBImage1: TDBImage;
    BitBtn1: TBitBtn;
    OpenPictureDialog1: TOpenPictureDialog;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DataSource2: TDataSource;
    DBLookupComboBox2: TDBLookupComboBox;
    dsqryEmpleados: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure DBLookupComboBox2Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEntradaUsuarios: TfrmEntradaUsuarios;

implementation

uses UDatModUsuarios, uglobal, UDatModEmpleados;

{$R *.dfm}

procedure TfrmEntradaUsuarios.FormCreate(Sender: TObject);
begin
  dmUsuarios.tblUsuarios.Close;
  dmUsuarios.tblUsuarios.Open;
  dmUsuarios.tblTipoUsuario.Close;
  dmUsuarios.tblTipoUsuario.Open;
  dmusuarios.qryEmpleados.close;
  dmusuarios.qryEmpleados.open;
end;

procedure TfrmEntradaUsuarios.BitBtn1Click(Sender: TObject);
begin
  If OpenPictureDialog1.Execute then begin
     DBImage1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
   end;
end;

procedure TfrmEntradaUsuarios.BitBtn8Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmEntradaUsuarios.BitBtn5Click(Sender: TObject);
begin
  if dmUsuarios.tblUsuarios.State in [dsEdit,dsInsert] then
  begin
    if dmUsuarios.tblUsuarios.state = dsInsert then
    dmUsuarios.tblUsuariosClave.Value:=Encriptar(Trim(dmUsuarios.tblUsuariosClave.Value),2005);
    dmUsuarios.tblUsuarios.Post;
    dmUsuarios.tblUsuarios.ApplyUpdates;
    if not dmUsuarios.tblUsuarios.Transaction.InTransaction then
    dmUsuarios.tblUsuarios.Transaction.StartTransaction;
    try
      dmUsuarios.tblUsuarios.Transaction.CommitRetaining;
    except
    dmUsuarios.tblUsuarios.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmEntradaUsuarios.DBLookupComboBox2Exit(Sender: TObject);
begin
  if dmUsuarios.tblUsuarios.state in [dsEdit, dsInsert] then
  dmUsuarios.tblUsuariosNOMBRECOMPLETO.Value:= dmUsuarios.qryEmpleados.Fieldbyname('nombre').value;
  if dmUsuarios.tblUsuarios.state in [dsInsert] then
  dmUsuarios.tblUsuariosSTATUS.Value:='A';
end;

end.
