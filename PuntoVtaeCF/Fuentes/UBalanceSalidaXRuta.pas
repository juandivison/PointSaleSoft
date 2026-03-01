unit UBalanceSalidaXRuta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Buttons, EditNew, Grids, DBGrids, RXDBCtrl,
  RXCtrls;

type
  TfrmBalanceDespacho = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    RxLabel1: TRxLabel;
    RxLabel2: TRxLabel;
    Label3: TLabel;
    Label4: TLabel;
    RxDBGrid1: TRxDBGrid;
    EditN1: TEditN;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    EditN2: TEditN;
    BitBtn6: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    dsqryBalanceCte: TDataSource;
    BitBtn9: TBitBtn;
    EditN3: TEditN;
    Label5: TLabel;
    BitBtn10: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBalanceDespacho: TfrmBalanceDespacho;

implementation

uses UDatModCuadrexRuta, UDatModBalanceCxc, uglobal, URepSalidaRuta;

{$R *.dfm}

procedure TfrmBalanceDespacho.FormShow(Sender: TObject);
begin
  dmCuadrexRuta.qryTotalCajas.Close;
  dmCuadrexRuta.qryTotalCajas.ExecQuery;
  if dmCuadrexRuta.qryTotalCajas.Open then
  begin
    Label3.Caption:=Format('m', [10, 2, dmbalancecxc.qryBalanceCteBALANCE_ACT.Value]);
    Label4.Caption:=dmCuadrexRuta.qryTotalCajas.Current.Vars[0].AsString;
    if Pos('.',label4.Caption) = 0 then
    Label4.Caption:=Label4.Caption + '.00';
    Label4.Caption:=InsertarComa(Label4.Caption);
  end;
  dmCuadrexRuta.qryTotalCajas.Close;
end;

procedure TfrmBalanceDespacho.FormCreate(Sender: TObject);
begin
  dmCuadrexRuta.tblBalanceDespacho.Close;
  dmCuadrexRuta.tblBalanceDespacho.Open;
end;

procedure TfrmBalanceDespacho.BitBtn9Click(Sender: TObject);
begin
  dmCuadrexRuta.qryDatosRepBlcDespacho.Close;
  dmCuadrexRuta.qryDatosRepBlcDespacho.Params[0].Value:= EditN3.Text;
  dmCuadrexRuta.qryDatosRepBlcDespacho.Open;
  qckSalidaRuta:=TqckSalidaRuta.Create(nil);
  try
  qckSalidaRuta.Preview;
  finally
  qckSalidaRuta.Free;
  qckSalidaRuta:=Nil;
  end;
end;

procedure TfrmBalanceDespacho.BitBtn1Click(Sender: TObject);
begin
  if Not dmCuadrexRuta.tblBalanceDespacho.Locate('CODIGO_TEXTO;codigo_ruta',
  VarArrayOf([EditN1.Text,EditN3.Text]),[]) then
  MessageDlg('Codigo No encontrado, verifique',mtInformation, [mbOk], 0);
end;

procedure TfrmBalanceDespacho.BitBtn10Click(Sender: TObject);
begin
  if dmCuadrexRuta.tblBalanceDespacho.State in [dsEdit, dsInsert] then
  dmCuadrexRuta.tblBalanceDespacho.Post;
  if dmCuadrexRuta.tblBalanceDespacho.UpdatesPending then
  begin
    if not dmCuadrexRuta.tblBalanceDespacho.Transaction.InTransaction then
    dmCuadrexRuta.tblBalanceDespacho.Transaction.StartTransaction;
    try
      dmCuadrexRuta.tblBalanceDespacho.Transaction.CommitRetaining;
    finally
    dmCuadrexRuta.tblBalanceDespacho.Transaction.RollbackRetaining;
    end;
  end;
end;

end.
