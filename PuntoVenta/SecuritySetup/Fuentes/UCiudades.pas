unit UCiudades;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, Grids, DBGrids, ExtCtrls,
  Db, RXCtrls, RXDBCtrl, WinSkinData;

type
  TfrmCiudades = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    GroupBox1: TGroupBox;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    DBEdit4: TDBEdit;
    Label11: TLabel;
    DBGrid1: TDBGrid;
    btnInsertar: TBitBtn;
    Label12: TLabel;
    DBStatusLabel1: TDBStatusLabel;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    SkinData1: TSkinData;
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnInsertarClick(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCiudades: TfrmCiudades;

implementation

uses UDatModCiudades;

{$R *.dfm}

procedure TfrmCiudades.BitBtn7Click(Sender: TObject);
begin
Close;
end;

procedure TfrmCiudades.BitBtn2Click(Sender: TObject);
begin
  if dmCiudades.tblCiudades.State in [dsInsert, dsEdit] then
  begin
    dmCiudades.tblCiudades.Post;
    if not dmCiudades.tblCiudades.Transaction.InTransaction then
    dmCiudades.tblCiudades.Transaction.StartTransaction;
    try
      dmCiudades.tblCiudades.Transaction.CommitRetaining;
    except
    dmCiudades.tblCiudades.Transaction.RollbackRetaining;
    end;
    dmCiudades.tblCiudades.Close;
    dmCiudades.tblCiudades.Open;
  end;
end;

procedure TfrmCiudades.BitBtn5Click(Sender: TObject);
begin
  if dmCiudades.tblCiudades.State in [dsInsert, dsEdit] then
  dmCiudades.tblCiudades.Cancel else
  if MessageDlg('Borrar Record?',mtInformation, [mbNo,mbYes], 0)=mryes then
  begin
    dmCiudades.tblCiudades.Delete;
    if not dmCiudades.tblCiudades.Transaction.InTransaction then
    dmCiudades.tblCiudades.Transaction.StartTransaction;
    try
      dmCiudades.tblCiudades.Transaction.CommitRetaining;
    except
    dmCiudades.tblCiudades.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmCiudades.BitBtn4Click(Sender: TObject);
begin
  if Not dmCiudades.tblCiudades.Locate('Descripcion',InputBox('Buscar por descripcion','Entre Ciudad',''),[]) then
  MessageDlg('Ciudad no encontrada, verifique',mtInformation, [mbOK], 0);
end;

procedure TfrmCiudades.FormCreate(Sender: TObject);
begin
  dmCiudades.tblCiudades.Close;
  dmCiudades.tblCiudades.Open;  
end;

procedure TfrmCiudades.btnInsertarClick(Sender: TObject);
begin
  if dmCiudades.tblCiudades.State = dsBrowse then
  begin
    dmCiudades.tblCiudades.Insert;
    dmCiudades.tblCiudadesSTATUS.Value := 'A';
    DBEdit2.SetFocus;    
  end;
end;

procedure TfrmCiudades.BitBtn9Click(Sender: TObject);
begin
  dmCiudades.tblCiudades.First;
end;

procedure TfrmCiudades.BitBtn10Click(Sender: TObject);
begin
  dmCiudades.tblCiudades.Prior;
end;

procedure TfrmCiudades.BitBtn11Click(Sender: TObject);
begin
  dmCiudades.tblCiudades.Next;
end;

procedure TfrmCiudades.BitBtn12Click(Sender: TObject);
begin
  dmCiudades.tblCiudades.Last;
end;

end.
