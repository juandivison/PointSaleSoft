unit UCierreAnio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, WinSkinData;

type
  TfrmCierreAnio = class(TForm)
    ProgressBar1: TProgressBar;
    Memo1: TMemo;
    Panel2: TPanel;
    BitBtn3: TBitBtn;
    BitBtn1: TBitBtn;
    SkinData1: TSkinData;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCierreAnio: TfrmCierreAnio;

implementation

uses UDatModCatalogo,Uglobal;

{$R *.dfm}

procedure TfrmCierreAnio.BitBtn1Click(Sender: TObject);
begin
  if MessageDlg('Iniciar Proceso inicializa Ctas catalogo',
     mtwarning,[mbyes,mbno],0)= mrno then
  Exit;
  dmCatalogo.tblqryCatalogo.Close;
  dmCatalogo.tblqryCatalogo.Filtered := False;
  dmCatalogo.tblqryCatalogo.params[0].Value:=GlbCodigoCia;
  dmCatalogo.tblqryCatalogo.Open;
  ProgressBar1.Max := dmCatalogo.tblqryCatalogo.RecordCount;
  ProgressBar1.Position := 0;
  while Not dmCatalogo.tblqryCatalogo.Eof Do
  begin
    dmCatalogo.tblqryCatalogo.Edit;
    dmCatalogo.tblqryCatalogoDEBITO_ACT.Value  := 0;
    dmCatalogo.tblqryCatalogoCREDITO_ACT.Value := 0;
    dmCatalogo.tblqryCatalogoDEBITO_ACM.Value  := 0;
    dmCatalogo.tblqryCatalogoCREDITO_ACM.Value := 0;
    if (dmCatalogo.tblqryCatalogoCuenta1.AsInteger >= 400) then
    begin
      dmCatalogo.tblqryCatalogoBalance_Ant.Value  := 0;
      dmCatalogo.tblqryCatalogoBalance_Act.Value  := 0; 
    end;
    dmCatalogo.tblqryCatalogo.Post;
    dmCatalogo.tblqryCatalogo.ApplyUpdates;
    dmCatalogo.tblqryCatalogo.Next;
    ProgressBar1.StepIt;
  end;
  ProgressBar1.Position:=0;
  if not dmCatalogo.tblqryCatalogo.Transaction.InTransaction then
  dmCatalogo.tblqryCatalogo.Transaction.StartTransaction;
  try
    dmCatalogo.tblqryCatalogo.Transaction.CommitRetaining;
  except
  dmCatalogo.tblqryCatalogo.Transaction.RollbackRetaining;
  end;
end;

end.
