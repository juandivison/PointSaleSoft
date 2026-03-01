unit UConfCajaXusuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  db, Dialogs, RxLookup, rxToolEdit, RXDBCtrl, StdCtrls, Mask, DBCtrls, Buttons,
  Grids, DBGrids, WinSkinData;

type
  TfrmConfCajaxUsuario = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBDateEdit1: TDBDateEdit;
    DBDateEdit2: TDBDateEdit;
    RxDBLookupCombo1: TRxDBLookupCombo;
    RxDBLookupCombo2: TRxDBLookupCombo;
    RxDBLookupCombo3: TRxDBLookupCombo;
    RxDBGrid1: TRxDBGrid;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton1: TSpeedButton;
    DBEdit1: TDBEdit;
    Label7: TLabel;
    SkinData1: TSkinData;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfCajaxUsuario: TfrmConfCajaxUsuario;

implementation

uses UDatmodDatosGenerales, Uglobal;

{$R *.dfm}

procedure TfrmConfCajaxUsuario.SpeedButton1Click(Sender: TObject);
begin
  if dmDatos.qryConfCajaXusuario.State in [dsInsert, dsEdit] then
  begin
    //dmDatos.qryConfCajaXusuarioid.Value:= FsqlMaxNumero('SEC_PROCESOS','ID');
    if dmDatos.qryConfCajaXusuarioCOD_EMPLEADO.IsNull then
    begin
      MessageDlg('Debe indicar cliente.',mtError,[mbok],0);
      Exit;
    end;
    if dmDatos.qryConfCajaXusuarioCOD_CAJA.IsNull then
    begin
      MessageDlg('Favor indicar codigo caja.',mtError,[mbok],0);
      Exit;
    end;
    if dmDatos.qryConfCajaXusuarioID_FISCALPRINTER.IsNull then
    begin
      MessageDlg('Favor indicar ID impresora fiscal.',mtError,[mbok],0);
      Exit;
    end;
    dmDatos.qryConfCajaXusuario.Post;
    dmDatos.qryConfCajaXusuario.ApplyUpdates;
    if Not dmDatos.qryConfCajaXusuario.Transaction.InTransaction then
    dmDatos.qryConfCajaXusuario.Transaction.StartTransaction;
    try
      dmDatos.qryConfCajaXusuario.Transaction.CommitRetaining;
    except
    dmDatos.qryConfCajaXusuario.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmConfCajaxUsuario.SpeedButton2Click(Sender: TObject);
begin
  if dmDatos.qryConfCajaXusuario.State = dsBrowse then
  begin
    dmDatos.qryConfCajaXusuario.Insert;
    dmDatos.qryConfCajaXusuarioSTATUS.Value:='A';
    dmDatos.qryConfCajaXusuarioFECHAOPEN.Value:=ExtraerFecha(Now);
    //dmDatos.qryConfCajaXusuarioFECHA_IN.Value:= Now;
    //dmDatos.qryConfCajaXusuarioINS_POR.Value:= StruserName;
    //dmDatos.qryConfCajaXusuarioCOD_UDUARIO.Value:= VarUsuarioGlb;
    RxDBLookupCombo1.SetFocus;
  end;
end;

procedure TfrmConfCajaxUsuario.SpeedButton3Click(Sender: TObject);
begin
  if dmDatos.qryConfCajaXusuario.State in [dsinsert, dsEdit] then
  begin
    dmDatos.qryConfCajaXusuario.Cancel;
  end else
  begin
    if MessageDlg('Cancelar record', mtinformation,[mbyes,mbno],0)=mryes then
    begin
    if dmDatos.qryConfCajaXusuarioSTATUS.Value = 'A' then
    begin
      dmDatos.qryConfCajaXusuario.Edit;
      dmDatos.qryConfCajaXusuarioSTATUS.Value:='C';
      //SpeedButton6Click(Self);
    end;
    end;
  end;
end;

procedure TfrmConfCajaxUsuario.SpeedButton7Click(Sender: TObject);
begin
  dmDatos.qryConfCajaXusuario.Close;
  dmDatos.qryConfCajaXusuario.Open;
end;

procedure TfrmConfCajaxUsuario.SpeedButton8Click(Sender: TObject);
begin
  if MessageDlg('Desea eliminar definitivamente record activo?', mtWarning,[mbyes,mbno],0)=mryes then
  begin
    if dmDatos.qryConfCajaXusuarioSTATUS.Value = 'A' then
    begin
      dmDatos.qryConfCajaXusuario.Delete;
      SpeedButton1Click(Self);
    end;
  end;
end;

procedure TfrmConfCajaxUsuario.FormCreate(Sender: TObject);
begin
  dmDatos.qryConfCajaXusuario.Close;
  dmDatos.qryConfCajaXusuario.Open;
  dmDatos.tblImpresoraFiscal.Close;
  dmDatos.tblImpresoraFiscal.Open;
  dmDatos.tblEmpleados.Close;
  dmDatos.tblEmpleados.Open;
  dmDatos.tblCaja.Close;
  dmDatos.tblCaja.Open;
end;

end.
