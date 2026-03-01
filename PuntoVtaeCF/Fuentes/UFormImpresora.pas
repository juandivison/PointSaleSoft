unit UFormImpresora;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  db, Dialogs, Buttons, rxToolEdit, RXDBCtrl, StdCtrls, Mask, DBCtrls, Grids,
  DBGrids, WinSkinData, RxDBComb;

type
  TfrmImpresoraFiscal = class(TForm)
    RxDBGrid1: TRxDBGrid;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    DBDateEdit1: TDBDateEdit;
    Label8: TLabel;
    DBDateEdit2: TDBDateEdit;
    Label9: TLabel;
    DBEdit2: TDBEdit;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton1: TSpeedButton;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    DBEdit10: TDBEdit;
    SkinData1: TSkinData;
    RxDBComboBox1: TRxDBComboBox;
    RxDBComboBox2: TRxDBComboBox;
    DBEdit8: TDBEdit;
    Label13: TLabel;
    DBEdit9: TDBEdit;
    Label14: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImpresoraFiscal: TfrmImpresoraFiscal;

implementation

uses UDatmodDatosGenerales, UGlobal;

{$R *.dfm}

procedure TfrmImpresoraFiscal.SpeedButton1Click(Sender: TObject);
begin
  if dmDatos.tblImpresoraFiscal.State in [dsInsert, dsEdit] then
  begin
    //dmDatos.tblImpresoraFiscalSERIE.Value:= FsqlMaxNumero('IMPRESORAFISCAL','SERIE');
    //if dmDatos.tblImpresoraFiscalCODIGO_CTE.IsNull then
    //begin
    //  MessageDlg('Debe indicar cliente',mtError,[mbok],0);
    //  Exit;
    //end;
    if (dmDatos.tblImpresoraFiscalID_FISCALPRINTER.IsNull) Or
    (dmDatos.tblImpresoraFiscalID_FISCALPRINTER.Value = 0) then
     dmDatos.tblImpresoraFiscalID_FISCALPRINTER.Value := 1;

    dmDatos.tblImpresoraFiscal.Post;
    dmDatos.tblImpresoraFiscal.ApplyUpdates;
    if not dmDatos.tblImpresoraFiscal.Transaction.InTransaction then
    dmDatos.tblImpresoraFiscal.Transaction.StartTransaction;
    try
      dmDatos.tblImpresoraFiscal.Transaction.CommitRetaining;
    except
    dmDatos.tblImpresoraFiscal.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmImpresoraFiscal.SpeedButton2Click(Sender: TObject);
begin
  if dmDatos.tblImpresoraFiscal.State = dsBrowse then
  begin
    dmDatos.tblImpresoraFiscal.Insert;
    dmDatos.tblImpresoraFiscalSTATUS.Value:='A';
    dmDatos.tblImpresoraFiscalFECHA_ENTRADA.Value:=ExtraerFecha(Now);
    //dmDatos.tblImpresoraFiscalFECHA_IN.Value:= Now;
    //dmDatos.tblImpresoraFiscalINS_POR.Value:= StruserName;
    //dmDatos.tblImpresoraFiscalCOD_UDUARIO.Value:= VarUsuarioGlb;
    DBEdit1.SetFocus;
  end;
end;

procedure TfrmImpresoraFiscal.SpeedButton3Click(Sender: TObject);
begin
  if dmDatos.tblImpresoraFiscal.State in [dsinsert, dsEdit] then
  begin
    dmDatos.tblImpresoraFiscal.Cancel;
  end;
end;

procedure TfrmImpresoraFiscal.SpeedButton7Click(Sender: TObject);
begin
  dmDatos.tblImpresoraFiscal.Close;
  dmDatos.tblImpresoraFiscal.Open;
end;

procedure TfrmImpresoraFiscal.SpeedButton8Click(Sender: TObject);
begin
  if dmDatos.tblImpresoraFiscalSTATUS.Value = 'A' then
  begin
    dmDatos.tblImpresoraFiscal.Delete;
    SpeedButton1Click(Self);
  end;
end;

procedure TfrmImpresoraFiscal.FormCreate(Sender: TObject);
begin
  SpeedButton7Click(Self);
end;

procedure TfrmImpresoraFiscal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmDatos.tblImpresoraFiscal.Close;
  dmDatos.tblImpresoraFiscal.Open;
end;

end.
