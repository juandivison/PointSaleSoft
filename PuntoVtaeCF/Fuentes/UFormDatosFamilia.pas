unit UFormDatosFamilia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  DB, Dialogs, RXCtrls, StdCtrls, Mask, DBCtrls, Buttons, RXDBCtrl, WinSkinData;

type
  TfrmFamila = class(TForm)
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
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    RxLabel1: TRxLabel;
    RxLabel2: TRxLabel;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton1: TSpeedButton;
    BitBtn1: TBitBtn;
    DBStatusLabel1: TDBStatusLabel;
    SkinData1: TSkinData;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBEdit1Enter(Sender: TObject);
    procedure DBEdit2Enter(Sender: TObject);
    procedure DBEdit3Change(Sender: TObject);
    procedure DBEdit4Enter(Sender: TObject);
    procedure DBEdit7Enter(Sender: TObject);
    procedure DBEdit6Enter(Sender: TObject);
    procedure DBEdit5Enter(Sender: TObject);
    procedure DBEdit8Enter(Sender: TObject);
    procedure DBEdit10Enter(Sender: TObject);
    procedure DBEdit11Enter(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure DBEdit3Enter(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure DBEdit4Exit(Sender: TObject);
    procedure DBEdit7Exit(Sender: TObject);
    procedure DBEdit6Exit(Sender: TObject);
    procedure DBEdit5Exit(Sender: TObject);
    procedure DBEdit8Exit(Sender: TObject);
    procedure DBEdit9Exit(Sender: TObject);
    procedure DBEdit10Exit(Sender: TObject);
    procedure DBEdit11Exit(Sender: TObject);
    procedure DBEdit9Enter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFamila: TfrmFamila;

implementation

uses UDatModEstudiante, UDatModClientes;

{$R *.dfm}

procedure TfrmFamila.SpeedButton1Click(Sender: TObject);
begin
  if dmEstudiante.tblFamilia.State in [dsInsert, dsEdit] then
  begin
    if dmEstudiante.tblFamiliaCODIGO.IsNull then
    begin
      MessageDlg('Debe indicar codigo familia',mtError,[mbok],0);
      Exit;
    end;
    dmEstudiante.tblFamilia.Post;
    dmEstudiante.tblFamilia.ApplyUpdates;
    if not dmEstudiante.tblFamilia.Transaction.InTransaction then
    dmEstudiante.tblFamilia.Transaction.StartTransaction;
    try
      dmEstudiante.tblFamilia.Transaction.CommitRetaining;
    except
    dmEstudiante.tblFamilia.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmFamila.SpeedButton2Click(Sender: TObject);
begin
  if dmEstudiante.tblFamilia.State = dsBrowse then
  begin
    dmEstudiante.tblFamilia.Insert;
    dmEstudiante.tblFamiliaCODIGO.Value:= dmclientes.tblClientesCODIGO_CTE.Value;
    dmEstudiante.tblFamiliaSTATUS.Value:='A';
  end;
end;

procedure TfrmFamila.SpeedButton3Click(Sender: TObject);
begin
  if dmEstudiante.tblFamilia.State in [dsinsert, dsEdit] then
  begin
    dmEstudiante.tblFamilia.Cancel;
  end else
  begin
  end;
end;

procedure TfrmFamila.SpeedButton7Click(Sender: TObject);
begin
  dmEstudiante.tblFamilia.Close;
  dmEstudiante.tblFamilia.Open;
end;

procedure TfrmFamila.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if dmEstudiante.tblFamilia.State in [dsInsert, dsEdit] then
  begin
    MessageDlg('Hay una transaccion pendiente, verifique',mtError,[mbok],0);
    CanClose:=False;
  end else CanClose:= True;
end;

procedure TfrmFamila.DBEdit1Enter(Sender: TObject);
begin
  dbedit1.Color:= clyellow;
end;

procedure TfrmFamila.DBEdit2Enter(Sender: TObject);
begin
  dbedit2.Color:= clyellow;
end;

procedure TfrmFamila.DBEdit3Change(Sender: TObject);
begin
  dbedit3.Color:= clyellow;
end;

procedure TfrmFamila.DBEdit4Enter(Sender: TObject);
begin
  dbedit4.Color:= clyellow;
end;

procedure TfrmFamila.DBEdit7Enter(Sender: TObject);
begin
  dbedit7.Color:= clyellow;
end;

procedure TfrmFamila.DBEdit6Enter(Sender: TObject);
begin
  dbedit7.Color:= clyellow;
end;

procedure TfrmFamila.DBEdit5Enter(Sender: TObject);
begin
  dbedit5.Color:= clyellow;
end;

procedure TfrmFamila.DBEdit8Enter(Sender: TObject);
begin
  dbedit8.Color:= clyellow;
end;

procedure TfrmFamila.DBEdit10Enter(Sender: TObject);
begin
  dbedit10.Color:= clyellow;
end;

procedure TfrmFamila.DBEdit11Enter(Sender: TObject);
begin
  dbedit11.Color:= clyellow;
end;

procedure TfrmFamila.DBEdit1Exit(Sender: TObject);
begin
  dbedit1.Color:= clWhite;
end;

procedure TfrmFamila.DBEdit2Exit(Sender: TObject);
begin
  dbedit2.Color:= clWhite;
end;

procedure TfrmFamila.DBEdit3Enter(Sender: TObject);
begin
  dbedit3.Color:= clyellow;
end;

procedure TfrmFamila.DBEdit3Exit(Sender: TObject);
begin
  dbedit3.Color:= clWhite;
end;

procedure TfrmFamila.DBEdit4Exit(Sender: TObject);
begin
  dbedit4.Color:= clWhite;
end;

procedure TfrmFamila.DBEdit7Exit(Sender: TObject);
begin
  dbedit7.Color:= clWhite;
end;

procedure TfrmFamila.DBEdit6Exit(Sender: TObject);
begin
  dbedit6.Color:= clWhite;
end;

procedure TfrmFamila.DBEdit5Exit(Sender: TObject);
begin
  dbedit5.Color:= clWhite;
end;

procedure TfrmFamila.DBEdit8Exit(Sender: TObject);
begin
  dbedit8.Color:= clWhite;
end;

procedure TfrmFamila.DBEdit9Exit(Sender: TObject);
begin
  dbedit9.Color:= clWhite;
end;

procedure TfrmFamila.DBEdit10Exit(Sender: TObject);
begin
  dbedit10.Color:= clWhite;
end;

procedure TfrmFamila.DBEdit11Exit(Sender: TObject);
begin
  dbedit11.Color:= clWhite;
end;

procedure TfrmFamila.DBEdit9Enter(Sender: TObject);
begin
  dbedit9.Color:= clyellow;
end;

end.
