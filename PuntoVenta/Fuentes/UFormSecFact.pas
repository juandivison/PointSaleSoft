unit UFormSecFact;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, RxDBCtrl, StdCtrls, Mask, DBCtrls,
  IBCustomDataSet, RxCtrls, Buttons, WinSkinData;

type
  TfrmSecuenciaFct = class(TForm)
    tblSecuencia: TIBDataSet;
    tblSecuenciaTIPO: TIntegerField;
    tblSecuenciaSECUENCIA: TIntegerField;
    tblSecuenciaFECHA_UPDATE: TDateTimeField;
    tblSecuenciaCOD_USUARIO: TIntegerField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DataSource1: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    RxDBGrid1: TRxDBGrid;
    tblSecuenciaDescTipo: TStringField;
    BitBtn5: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn4: TBitBtn;
    DBStatusLabel4: TDBStatusLabel;
    SkinData1: TSkinData;
    procedure tblSecuenciaCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSecuenciaFct: TfrmSecuenciaFct;

implementation
 uses UDatModConectar, UGlobal;
{$R *.dfm}

procedure TfrmSecuenciaFct.tblSecuenciaCalcFields(DataSet: TDataSet);
begin
  if tblSecuenciaTipo.Value = 1 then
  tblSecuenciaDescTipo.Value:='Factura a Crédito'
  else   if tblSecuenciaTipo.Value = 6 then
  tblSecuenciaDescTipo.Value:='Devoluciones'
  else
  tblSecuenciaDescTipo.Value:='Desconocido';
end;

procedure TfrmSecuenciaFct.FormCreate(Sender: TObject);
begin
  tblSecuencia.close;
  tblSecuencia.open;
end;

procedure TfrmSecuenciaFct.BitBtn1Click(Sender: TObject);
begin
  tblSecuencia.Append;
end;

procedure TfrmSecuenciaFct.BitBtn4Click(Sender: TObject);
begin
  GlbSalvarQuery(tblSecuencia);
end;

procedure TfrmSecuenciaFct.BitBtn5Click(Sender: TObject);
begin
  tblSecuencia.close;
  tblSecuencia.open;
end;

end.
