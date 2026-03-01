unit UFrmConsultaCuadreCaja;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, DBCtrls, RxMemDS, Mask, rxToolEdit, Buttons,
  RxLookup, RXDBCtrl, WinSkinData, IBCustomDataSet, IBTable;

type
  TfrmConsultaDatosCCaja = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    rxConsulta: TRxMemoryData;
    rxConsultatodos: TSmallintField;
    rxConsultafechaini: TDateTimeField;
    rxConsultafechafin: TDateTimeField;
    rxConsultacodEmpleado: TIntegerField;
    DBCheckBox1: TDBCheckBox;
    dsrxConsulta: TDataSource;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBDateEdit1: TDBDateEdit;
    DBDateEdit2: TDBDateEdit;
    SkinData1: TSkinData;
    dsqryUsuarios: TDataSource;
    tblMoneda: TIBTable;
    tblMonedaCODIGO: TIBStringField;
    tblMonedaDESCRIPCION: TIBStringField;
    tblMonedaFECHA_IN: TDateTimeField;
    tblMonedaFECHA_UPCAMPO_FECHA_HORA: TDateTimeField;
    tblMonedaMODIFICADO_POR: TIBStringField;
    tblMonedaSIMBOLO: TIBStringField;
    dstblMoneda: TDataSource;
    rxConsultaMoneda: TStringField;
    Label58: TLabel;
    RxDBLookupCombo2: TRxDBLookupCombo;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaDatosCCaja: TfrmConsultaDatosCCaja;

implementation
  uses UDatModUsuarios, Uglobal, UDatModConectar;

{$R *.dfm}

procedure TfrmConsultaDatosCCaja.FormCreate(Sender: TObject);
begin
  rxConsulta.Close;
  rxConsulta.Open;
  rxConsulta.Insert;
  //t DBCheckBox1.Checked:=False;
  rxConsultatodos.Value := 0;
  rxConsultafechaini.Value := ExtraerFecha(GlbFechaTrnDiaria);
  rxConsultafechafin.Value := ExtraerFecha(GlbFechaTrnDiaria);
  dmUsuarios.qryUsuarios.Close;
  dmUsuarios.qryUsuarios.Open;
  tblMoneda.Close;
  tblMoneda.Open;
end;

procedure TfrmConsultaDatosCCaja.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if rxConsulta.State in [dsInsert, dsEdit] then
  rxConsulta.Post;
end;

end.
