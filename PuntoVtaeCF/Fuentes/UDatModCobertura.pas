unit UDatModCobertura;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBTable, IBStoredProc;

type
  TdmCobertura = class(TDataModule)
    tblTipoAfiliacion: TIBDataSet;
    tblTipoAfiliacionIDTIPO: TIntegerField;
    tblTipoAfiliacionDESCRIPCION: TIBStringField;
    tblTipoAfiliacionMONTOCOBERTURA: TFloatField;
    tblTipoAfiliacionDIASDECARENCIA: TIntegerField;
    tblTipoAfiliacionYEARANTIGUEDAD: TIntegerField;
    tblTipoAfiliacionSTATUS: TIBStringField;
    dstblTipoAfiliacion: TDataSource;
    tblCobertura: TIBDataSet;
    tblCoberturaIDCOBERTURA: TIntegerField;
    tblCoberturaIDTIPO: TIntegerField;
    dstblCobertura: TDataSource;
    tblTipoAfiliadoLookup: TIBTable;
    dstblTipoAfiliadoLookup: TDataSource;
    tblCoberturaDet: TIBDataSet;
    tblCoberturaDetIDCOBERTURA: TIntegerField;
    tblCoberturaDetYEAR_INI: TIntegerField;
    tblCoberturaDetYEAR_FIN: TIntegerField;
    tblCoberturaDetPORC_INDEMNIZACION: TFloatField;
    dstblCoberturaDet: TDataSource;
    tblCoberturaFECHA_INI: TDateTimeField;
    tblCoberturaFECHA_FIN: TDateTimeField;
    tblCoberturaDetKM_INI: TIntegerField;
    tblCoberturaDetKM_FIN: TIntegerField;
    ipstpProc_ConvierteCteEnProv: TIBStoredProc;
    tblTipoAfiliacionRUTACARTABIENVENIDA: TIBStringField;
    procedure tblCoberturaAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmCobertura: TdmCobertura;

implementation

uses UDatModConectar;

{$R *.dfm}

procedure TdmCobertura.tblCoberturaAfterScroll(DataSet: TDataSet);
begin
  if dmCobertura.tblCoberturaDet.State in [dsBrowse, dsInactive] then
  begin
    dmCobertura.tblCoberturaDet.Close;
    dmCobertura.tblCoberturaDet.params[0].Value:=tblCoberturaIDCOBERTURA.Value;
    dmCobertura.tblCoberturaDet.Open;
  end;
end;

end.
