unit UFormGenerarConduceFct;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, StdCtrls, Mask, DBCtrls, Grids, DBGrids,
  RXDBCtrl, WinSkinData, RXCtrls, Buttons;

type
  TfrmGenerarConduceFCT = class(TForm)
    tblDatosFacturaDet: TIBDataSet;
    RxDBGrid1: TRxDBGrid;
    SkinData1: TSkinData;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    DBStatusLabel2: TDBStatusLabel;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn1: TBitBtn;
    dstblDatosFacturaDet: TDataSource;
    tblDatosFacturaDetSERIE: TIntegerField;
    tblDatosFacturaDetNUMERO: TIntegerField;
    tblDatosFacturaDetCODIGO_PROD: TIBStringField;
    tblDatosFacturaDetDESCRIPCION: TIBStringField;
    tblDatosFacturaDetCANTIDAD: TFloatField;
    tblDatosFacturaDetCANT_CONDUCE: TFloatField;
    tblDatosFacturaDetFECHA_MOD: TDateTimeField;
    tblDatosFacturaDetMOD_POR: TIBStringField;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    procedure ProcAbrirDatos(numTrnVta : Integer);
    procedure ProcAsignaCantConduce;
  end;

var
  frmGenerarConduceFCT: TfrmGenerarConduceFCT;

implementation

uses UDatModConectar, UGlobal;

{$R *.dfm}

procedure TfrmGenerarConduceFCT.ProcAbrirDatos(numTrnVta : Integer);
begin
  tblDatosFacturaDet.Close;
  tblDatosFacturaDet.Params[0].Value:=numTrnVta;
  tblDatosFacturaDet.Open;
end;

procedure TfrmGenerarConduceFCT.BitBtn3Click(Sender: TObject);
begin
  if tblDatosFacturaDet.State = dsBrowse then
  tblDatosFacturaDet.Edit;
end;

procedure TfrmGenerarConduceFCT.BitBtn4Click(Sender: TObject);
begin
  if tblDatosFacturaDet.State In [dsEdit] then
  begin
    tblDatosFacturaDetMOD_POR.Value  := StrUserName;
    tblDatosFacturaDetFECHA_MOD.Value:= Now;
    
    GlbSalvarQuery(tblDatosFacturaDet);
  end;
end;

procedure TfrmGenerarConduceFCT.ProcAsignaCantConduce;
begin
  tblDatosFacturaDet.First;
  tblDatosFacturaDet.DisableControls;
  While Not tblDatosFacturaDet.Eof Do
  begin
    tblDatosFacturaDet.Edit;
    tblDatosFacturaDetCANT_CONDUCE.Value := tblDatosFacturaDetCANTIDAD.Value;
    GlbSalvarQuery(tblDatosFacturaDet);
    tblDatosFacturaDet.Next;
  end;
  tblDatosFacturaDet.First;
  tblDatosFacturaDet.EnableControls;
end;

procedure TfrmGenerarConduceFCT.BitBtn5Click(Sender: TObject);
begin
  tblDatosFacturaDet.Close;
  tblDatosFacturaDet.Open;
end;

procedure TfrmGenerarConduceFCT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  BitBtn4Click(Self);
  GlbSalvarQuery(tblDatosFacturaDet);  
end;

end.
