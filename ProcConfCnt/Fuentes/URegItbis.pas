unit URegItbis;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Db, Grids, DBGrids, StdCtrls, Buttons, RXCtrls, ExtCtrls, Mask,
  DBCtrls, WinSkinData, RXDBCtrl;

type
  TfrmItbis = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Panel2: TPanel;
    RxSpeedButton18: TRxSpeedButton;
    btnSalvar: TBitBtn;
    btnCerarAbrirres: TBitBtn;
    btnModificar: TBitBtn;
    btnCancelar: TBitBtn;
    btnInsertar: TBitBtn;
    BitBtn3: TBitBtn;
    DBGrid1: TDBGrid;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    SkinData1: TSkinData;
    DBStatusLabel1: TDBStatusLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnInsertarClick(Sender: TObject);
    procedure btnModificarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCerarAbrirresClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmItbis: TfrmItbis;

implementation

uses UDatModITBIS, uglobal;

{$R *.dfm}

procedure TfrmItbis.FormCreate(Sender: TObject);
begin
 // dmItbis:=TdmItbis.Create(nil);
  dmItbis.tblItbis.Close;
  dmItbis.tblItbis.Open;
end;

procedure TfrmItbis.btnInsertarClick(Sender: TObject);
begin
  if dmItbis.tblItbis.State = dsBrowse then
  begin
    dmItbis.tblItbis.Insert;
    dmItbis.tblItbisFECHA_INI.Value:=ExtraerFEcha(Date);
    dmItbis.tblItbisFECHA_FIN.Value:=ExtraerFEcha(Date)+730;
    dmItbis.tblItbisSTATUS.Value:='A';
    dbEdit4.SetFocus;
  end;
end;

procedure TfrmItbis.btnModificarClick(Sender: TObject);
begin
  if dmItbis.tblItbis.State = dsBrowse then
  begin
    dmItbis.tblItbis.Edit;
  end;
end;

procedure TfrmItbis.btnSalvarClick(Sender: TObject);
begin
  if dmItbis.tblItbis.State in [dsEdit,dsInsert] then
  begin
    if dmitbis.tblItbis.State = dsInsert then
    dmitbis.tblItbisGRUPO.Value:=FsqlMaxNumero('itbi','grupo');
    dmItbis.tblItbis.Post;
    dmItbis.tblItbis.ApplyUpdates;
    if not dmItbis.tblItbis.Transaction.InTransaction then
    dmItbis.tblItbis.Transaction.StartTransaction;
    try
      dmItbis.tblItbis.Transaction.CommitRetaining;
    except
    dmItbis.tblItbis.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmItbis.btnCancelarClick(Sender: TObject);
begin
 if dmItbis.tblItbis.State in [dsEdit,dsInsert] then
 dmItbis.tblItbis.Cancel
 else
 if MessageDlg('Borrar Record?',mtInformation, [mbNo,mbYes], 0)=mryes then
 dmItbis.tblItbis.Delete
 else
 begin
   if not dmItbis.tblItbis.Transaction.InTransaction then
   dmItbis.tblItbis.Transaction.StartTransaction;
   try
     dmItbis.tblItbis.Transaction.CommitRetaining;
   except
   dmItbis.tblItbis.Transaction.RollbackRetaining;
   end;
 end;
end;

procedure TfrmItbis.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmitbis.tblItbis.Close;
  //if Assigned(dmItbis) then
  //begin
  //  dmItbis.Free;
  //  dmItbis:=Nil;
  //end;
end;

procedure TfrmItbis.btnCerarAbrirresClick(Sender: TObject);
begin
  dmItbis.tblItbis.Close;
  dmItbis.tblItbis.Open;
end;

end.
