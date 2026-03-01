unit UCambiarClaveUsuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, Buttons, Mask, RXCtrls, RXDBCtrl, ExtCtrls,
  DB;

type
  TfrmCambiarClaveUsuario = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Panel1: TPanel;
    BitBtn5: TBitBtn;
    BitBtn8: TBitBtn;
    DBImage1: TDBImage;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    dstblCambiarClaveUsuario: TDataSource;
    Label5: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCambiarClaveUsuario: TfrmCambiarClaveUsuario;

implementation

uses uGlobal, UDatModUsuarios;

{$R *.dfm}

procedure TfrmCambiarClaveUsuario.FormCreate(Sender: TObject);
begin
  dmusuarios.tblUsuarios.close;
  dmusuarios.tblUsuarios.open;
  if not dmusuarios.tblUsuarios.Locate('numero',varUsuarioGlb,[]) then
  begin
    MessageDlg('Usuario no encontrado, la sesion será cerrada',mtError,[mbok],0);
    Application.Terminate;
  end;
end;

procedure TfrmCambiarClaveUsuario.BitBtn5Click(Sender: TObject);
begin
  if not dmUsuarios.tblUsuarios.Locate('codigo;clave',VarArrayof([edit1.Text,Encriptar(edit2.Text,2005)]),[]) then
  begin
    Messagedlg('Usuario o Clave Incorrecta.¡Verifique Por Favor!',mtError,[mbOk],0);
    Application.terminate;
  end else
  begin
    if Edit3.Text = Edit4.Text then
    begin
       dmUsuarios.tblUsuarios.Edit;
       dmUsuarios.tblUsuariosClave.Value := Encriptar(edit3.Text,2005);
       dmUsuarios.tblUsuarios.Post;
       if dmUsuarios.tblUsuarios.State in [dsEdit,dsInsert] then
       begin
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
       Messagedlg('Clave cambiada con éxito!',mtError,[mbOk],0);
       dmUsuarios.tblUsuarios.Close;
       Close;
    end else
    begin
      Messagedlg('Clave nueva no concuerdan. ¡Verifique Por Favor!',mtInformation,[mbOk],0);
      Edit2.SetFocus;
      Edit2.SelectAll;
    end;
  end;
end;

end.
