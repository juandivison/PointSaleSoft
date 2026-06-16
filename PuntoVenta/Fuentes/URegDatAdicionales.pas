unit URegDatAdicionales;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  DB, Dialogs, GetAnyDate, StdCtrls, Buttons, Grids, DBGrids, RxDBCtrl, Mask,
  DBCtrls, ImgList, DBActns, ActnList, WinSkinData;

type
  TfrmDatosAdicRegalia = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    RxDBGrid1: TRxDBGrid;
    BitBtn7: TBitBtn;
    BitBtn4: TBitBtn;
    btnSalvarDet: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn1: TBitBtn;
    FechaDatos: TGetAnyDate;
    ImageList1: TImageList;
    SkinData1: TSkinData;
    ActionList1: TActionList;
    DataSetFirst1: TDataSetFirst;
    DataSetPrior1: TDataSetPrior;
    DataSetNext1: TDataSetNext;
    DataSetLast1: TDataSetLast;
    BitBtn9: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure btnSalvarDetClick(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDatosAdicRegalia: TfrmDatosAdicRegalia;

implementation
  uses UDatmodDatosGenerales, uglobal;
{$R *.dfm}


procedure TfrmDatosAdicRegalia.FormCreate(Sender: TObject);
begin
  dmdatos.qryRegAdicional.Close;
  dmdatos.qryRegAdicional.Filtered:=False;
  dmdatos.qryRegAdicional.Params[0].Value := StrToInt(FormatDateTime('yyyy',Now));
  dmdatos.qryRegAdicional.Open;
end;

procedure TfrmDatosAdicRegalia.BitBtn1Click(Sender: TObject);
begin
  if FechaDatos.Execute then
  begin
    dmdatos.qryRegAdicional.Close;
    dmdatos.qryRegAdicional.Filtered:=False;
    dmdatos.qryRegAdicional.Params[0].Value := StrToInt(FormatDateTime('yyyy',FechaDatos.Fecha));
    dmdatos.qryRegAdicional.Open;
  end;
end;

procedure TfrmDatosAdicRegalia.BitBtn7Click(Sender: TObject);
begin
  if dmdatos.qryRegAdicional.State = dsBrowse then
  begin
    dmdatos.qryRegAdicional.Insert;
    dmdatos.qryRegAdicionalCODIGO_CIA.Value := 2;
    dmdatos.qryRegAdicionalStatus.Value:='A';
    dmdatos.qryRegAdicionalANIO_REGALIA.Value:=StrToInt(FormatDateTime('yyyy',Date));
    dmdatos.qryRegAdicionalFecha_In.value:=Now;
    dmdatos.qryRegAdicionalINSERTADO_POR.Value := strUserName;
    DBEdit2.SetFocus;
    DBEdit2.SelectAll;
  end;
end;

procedure TfrmDatosAdicRegalia.BitBtn4Click(Sender: TObject);
begin
  if dmdatos.qryRegAdicional.State = dsBrowse then
  begin
    dmdatos.qryRegAdicional.Edit;
    DBEdit4.SetFocus;
    DBEdit4.SelectAll;
  end;
end;

procedure TfrmDatosAdicRegalia.btnSalvarDetClick(Sender: TObject);
begin
  if dmdatos.qryRegAdicional.State in [dsEdit,dsInsert] then
  begin
    dmdatos.qryRegAdicional.Post;
    dmdatos.qryRegAdicional.ApplyUpdates;
    if not dmdatos.qryRegAdicional.Transaction.InTransaction then
    dmdatos.qryRegAdicional.Transaction.StartTransaction;
    try
      dmdatos.qryRegAdicional.Transaction.CommitRetaining;
    except
    dmdatos.qryRegAdicional.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmDatosAdicRegalia.BitBtn10Click(Sender: TObject);
begin
  if dmdatos.qryRegAdicional.State in [dsEdit,dsInsert] then
  begin
    dmdatos.qryRegAdicional.cancel;
  end;
end;

procedure TfrmDatosAdicRegalia.BitBtn8Click(Sender: TObject);
begin
  if dmdatos.qryRegAdicional.State = dsBrowse then
  begin
    if messageDlg('Borrar Record',mtWarning,[mbYes,mbNo],0)=mrYes then
    begin
      dmdatos.qryRegAdicional.Delete;
      dmdatos.qryRegAdicional.ApplyUpdates;
      if not dmdatos.qryRegAdicional.Transaction.InTransaction then
      dmdatos.qryRegAdicional.Transaction.StartTransaction;
      try
        dmdatos.qryRegAdicional.Transaction.CommitRetaining;
      except
      dmdatos.qryRegAdicional.Transaction.RollbackRetaining;
      end;
    end;
  end;
end;

end.
