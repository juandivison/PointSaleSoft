unit UDetValoresCuadre;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Mask, DB, Buttons, ExtCtrls, RXCtrls,
  RXDBCtrl;

type
  TfrmValoresCuadreRuta = class(TForm)
    dsqryDetalleCuadreRuta: TDataSource;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    DBEdit7: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit15: TDBEdit;
    Label27: TLabel;
    Label28: TLabel;
    DBMemo1: TDBMemo;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit8: TDBEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Image1: TImage;
    Image2: TImage;
    DBEdit9: TDBEdit;
    Shape1: TShape;
    Shape2: TShape;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit10: TDBEdit;
    DBStatusLabel1: TDBStatusLabel;
    DBEdit11: TDBEdit;
    Shape3: TShape;
    Shape4: TShape;
    Label6: TLabel;
    procedure DBEdit3Click(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure DBEdit4Click(Sender: TObject);
    procedure DBEdit5Click(Sender: TObject);
    procedure DBEdit6Click(Sender: TObject);
    procedure DBEdit7Click(Sender: TObject);
    procedure DBEdit15Click(Sender: TObject);
    procedure DBEdit1Click(Sender: TObject);
    procedure DBEdit2Click(Sender: TObject);
    procedure DBEdit8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmValoresCuadreRuta: TfrmValoresCuadreRuta;

implementation

uses UDatModCuadrexRuta, UCuadreVentaxRuta, UFormPromociones, Uglobal;

{$R *.dfm}

procedure TfrmValoresCuadreRuta.DBEdit3Click(Sender: TObject);
begin
  if dmcuadrexruta.qryDetalleCuadreRuta.State in [dsEdit, dsInsert] then
  dmcuadrexruta.qryDetalleCuadreRutaCHEQUE.Value:=
  frmCuadreXRuta.rxVentaTotalMonto.Value -
  (dmcuadrexruta.qryDetalleCuadreRutaEFECTIVO.Value        +
   dmcuadrexruta.qryDetalleCuadreRutaPROMOCION.Value     +
  dmcuadrexruta.qryDetalleCuadreRutaCREDITO_DIRECTO.Value +
  dmcuadrexruta.qryDetalleCuadreRutaCREDITO_NORMAL.Value  +
  dmcuadrexruta.qryDetalleCuadreRutaAJUSTE.Value  +
  dmcuadrexruta.qryDetalleCuadreRutaDIETA.Value  +
  dmcuadrexruta.qryDetalleCuadreRutaCOMBUSTIBLE.Value +
  dmcuadrexruta.qryDetalleCuadreRutaREP_CAMION.Value );
  DBEdit3.SelectAll;
end;

procedure TfrmValoresCuadreRuta.DBEdit3Exit(Sender: TObject);
begin
  dmCuadrexRuta.qryInventario.Close;
  dmCuadrexRuta.qryInventario.Open;
  frmCuadreXRuta.Sumar;
  if dmCuadrexRuta.qryDetalleCuadreRuta.State in [dsEdit, dsInsert] then
  begin
    dmcuadrexRuta.tblPromociones.Close;
    dmcuadrexRuta.tblPromociones.Params[0].Value:= dmcuadrexRuta.qryDetalleCuadreRutaRUTA.Value;
    dmcuadrexRuta.tblPromociones.Params[1].Value:= ExtraerFecha(dmcuadrexRuta.qryDetalleCuadreRutaFECHA.Value);
    dmcuadrexRuta.tblPromociones.Params[2].Value:= ExtraerFecha(dmcuadrexRuta.qryDetalleCuadreRutaFECHA.Value);    
    dmcuadrexRuta.tblPromociones.Open;
    if dmCuadrexRuta.qryDetalleCuadreRutaPROMOCION.Value > 0 then
    begin
      frmPromociones := TfrmPromociones.Create(Nil);
      try
        frmPromociones.Showmodal;
      finally
      frmPromociones.Free;
      frmPromociones := Nil;
      end;
    end;
  end;
end;

procedure TfrmValoresCuadreRuta.DBEdit4Click(Sender: TObject);
begin
  if dmcuadrexruta.qryDetalleCuadreRuta.State in [dsEdit, dsInsert] then
  dmcuadrexruta.qryDetalleCuadreRutaEFECTIVO.Value:=
  frmCuadreXRuta.rxVentaTotalMonto.Value -
  (  dmcuadrexruta.qryDetalleCuadreRutaCHEQUE.Value +
  dmcuadrexruta.qryDetalleCuadreRutaEFECTIVO.Value        +
   dmcuadrexruta.qryDetalleCuadreRutaPROMOCION.Value     +
  dmcuadrexruta.qryDetalleCuadreRutaCREDITO_DIRECTO.Value +
  dmcuadrexruta.qryDetalleCuadreRutaCREDITO_NORMAL.Value  +
  dmcuadrexruta.qryDetalleCuadreRutaAJUSTE.Value  +
  dmcuadrexruta.qryDetalleCuadreRutaDIETA.Value  +
  dmcuadrexruta.qryDetalleCuadreRutaCOMBUSTIBLE.Value +
  dmcuadrexruta.qryDetalleCuadreRutaREP_CAMION.Value );
  DBEdit4.SelectAll;
end;

procedure TfrmValoresCuadreRuta.DBEdit5Click(Sender: TObject);
begin
  if dmcuadrexruta.qryDetalleCuadreRuta.State in [dsEdit, dsInsert] then
  dmcuadrexruta.qryDetalleCuadreRutaPROMOCION.Value:=
  frmCuadreXRuta.rxVentaTotalMonto.Value -
 (dmcuadrexruta.qryDetalleCuadreRutaCHEQUE.Value          +
  dmcuadrexruta.qryDetalleCuadreRutaCREDITO_DIRECTO.Value +
  dmcuadrexruta.qryDetalleCuadreRutaCREDITO_NORMAL.Value  +
  dmcuadrexruta.qryDetalleCuadreRutaDIETA.Value           +
  dmcuadrexruta.qryDetalleCuadreRutaCOMBUSTIBLE.Value +
  dmcuadrexruta.qryDetalleCuadreRutaREP_CAMION.Value  +
  dmcuadrexruta.qryDetalleCuadreRutaAJUSTE.Value      +
  dmcuadrexruta.qryDetalleCuadreRutaEFECTIVO.Value);
  DBEdit5.SelectAll;  
end;

procedure TfrmValoresCuadreRuta.DBEdit6Click(Sender: TObject);
begin
  if dmcuadrexruta.qryDetalleCuadreRuta.State in [dsEdit, dsInsert] then
  dmcuadrexruta.qryDetalleCuadreRutaCREDITO_DIRECTO.Value:=
  frmCuadreXRuta.rxVentaTotalMonto.Value -
  (dmcuadrexruta.qryDetalleCuadreRutaCHEQUE.Value +
  dmcuadrexruta.qryDetalleCuadreRutaCREDITO_NORMAL.Value  +
  dmcuadrexruta.qryDetalleCuadreRutaEFECTIVO.Value        +
  dmcuadrexruta.qryDetalleCuadreRutaCOMBUSTIBLE.Value +
  dmcuadrexruta.qryDetalleCuadreRutaREP_CAMION.Value  +
  dmcuadrexruta.qryDetalleCuadreRutaDIETA.Value  +
  dmcuadrexruta.qryDetalleCuadreRutaAJUSTE.Value  +
  dmcuadrexruta.qryDetalleCuadreRutaPROMOCION.Value);
  DBEdit6.SelectAll;  
end;

procedure TfrmValoresCuadreRuta.DBEdit7Click(Sender: TObject);
begin
  if dmcuadrexruta.qryDetalleCuadreRuta.State in [dsEdit, dsInsert] then
  dmcuadrexruta.qryDetalleCuadreRutaCREDITO_NORMAL.Value:=
  frmCuadreXRuta.rxVentaTotalMonto.Value -
  (dmcuadrexruta.qryDetalleCuadreRutaCHEQUE.Value         +
  dmcuadrexruta.qryDetalleCuadreRutaCREDITO_DIRECTO.Value +
  dmcuadrexruta.qryDetalleCuadreRutaEFECTIVO.Value        +
  dmcuadrexruta.qryDetalleCuadreRutaCOMBUSTIBLE.Value +
  dmcuadrexruta.qryDetalleCuadreRutaREP_CAMION.Value  +
  dmcuadrexruta.qryDetalleCuadreRutaDIETA.Value  +
  dmcuadrexruta.qryDetalleCuadreRutaAJUSTE.Value  +
  dmcuadrexruta.qryDetalleCuadreRutaPROMOCION.Value);
  DBEdit7.SelectAll;  
end;

procedure TfrmValoresCuadreRuta.DBEdit15Click(Sender: TObject);
begin
  if dmcuadrexruta.qryDetalleCuadreRuta.State in [dsEdit, dsInsert] then
  dmcuadrexruta.qryDetalleCuadreRutaAJUSTE.Value:=
  frmCuadreXRuta.rxVentaTotalMonto.Value -
  (dmcuadrexruta.qryDetalleCuadreRutaCHEQUE.Value         +
  dmcuadrexruta.qryDetalleCuadreRutaCREDITO_DIRECTO.Value +
  dmcuadrexruta.qryDetalleCuadreRutaEFECTIVO.Value        +
  dmcuadrexruta.qryDetalleCuadreRutaCOMBUSTIBLE.Value +
  dmcuadrexruta.qryDetalleCuadreRutaREP_CAMION.Value  +
  dmcuadrexruta.qryDetalleCuadreRutaCREDITO_NORMAL.Value  +
  dmcuadrexruta.qryDetalleCuadreRutaDIETA.Value  +
  dmcuadrexruta.qryDetalleCuadreRutaPROMOCION.Value);
  DBEdit15.SelectAll;
end;

procedure TfrmValoresCuadreRuta.DBEdit1Click(Sender: TObject);
begin
  if dmcuadrexruta.qryDetalleCuadreRuta.State In [dsEdit, dsInsert] then
  dmcuadrexruta.qryDetalleCuadreRutaDieta.Value:=
  frmCuadreXRuta.rxVentaTotalMonto.Value -
  (dmcuadrexruta.qryDetalleCuadreRutaCHEQUE.Value         +
  dmcuadrexruta.qryDetalleCuadreRutaCREDITO_DIRECTO.Value +
  dmcuadrexruta.qryDetalleCuadreRutaEFECTIVO.Value        +
  dmcuadrexruta.qryDetalleCuadreRutaCREDITO_NORMAL.Value  +
  dmcuadrexruta.qryDetalleCuadreRutaCOMBUSTIBLE.Value +
  dmcuadrexruta.qryDetalleCuadreRutaREP_CAMION.Value  +
  dmcuadrexruta.qryDetalleCuadreRutaAJUSTE.Value +
  dmcuadrexruta.qryDetalleCuadreRutaPROMOCION.Value);
  DBEdit1.SelectAll;
end;

procedure TfrmValoresCuadreRuta.DBEdit2Click(Sender: TObject);
begin
  if dmcuadrexruta.qryDetalleCuadreRuta.State In [dsEdit, dsInsert] then
  dmcuadrexruta.qryDetalleCuadreRutaCOMBUSTIBLE.Value :=
  frmCuadreXRuta.rxVentaTotalMonto.Value -
 (dmcuadrexruta.qryDetalleCuadreRutaCHEQUE.Value     +
  dmcuadrexruta.qryDetalleCuadreRutaREP_CAMION.Value +
  dmcuadrexruta.qryDetalleCuadreRutaDieta.Value +
  dmcuadrexruta.qryDetalleCuadreRutaCREDITO_DIRECTO.Value +
  dmcuadrexruta.qryDetalleCuadreRutaEFECTIVO.Value        +
  dmcuadrexruta.qryDetalleCuadreRutaCREDITO_NORMAL.Value  +
  dmcuadrexruta.qryDetalleCuadreRutaAJUSTE.Value          +
  dmcuadrexruta.qryDetalleCuadreRutaPROMOCION.Value);
  DBEdit2.SelectAll;  
end;

procedure TfrmValoresCuadreRuta.DBEdit8Click(Sender: TObject);
begin
  if dmcuadrexruta.qryDetalleCuadreRuta.State In [dsEdit, dsInsert] then
  dmcuadrexruta.qryDetalleCuadreRutaREP_CAMION.Value:=
  frmCuadreXRuta.rxVentaTotalMonto.Value -
 (dmcuadrexruta.qryDetalleCuadreRutaCHEQUE.Value          +
  dmcuadrexruta.qryDetalleCuadreRutaDieta.Value           +
  dmcuadrexruta.qryDetalleCuadreRutaCREDITO_DIRECTO.Value +
  dmcuadrexruta.qryDetalleCuadreRutaEFECTIVO.Value        +
  dmcuadrexruta.qryDetalleCuadreRutaCREDITO_NORMAL.Value  +
  dmcuadrexruta.qryDetalleCuadreRutaCOMBUSTIBLE.Value     +
  dmcuadrexruta.qryDetalleCuadreRutaAJUSTE.Value          +
  dmcuadrexruta.qryDetalleCuadreRutaPROMOCION.Value);
  DBEdit8.SelectAll;  
end;

end.
