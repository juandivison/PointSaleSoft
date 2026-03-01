program CodBarra;

uses
  Forms,
  ULabelImpCodBarra in '..\Fuentes\ULabelImpCodBarra.pas' {frmCodigoBarra},
  urepImpLabelCodBarra in 'URepImpLabelCodBarra.pas' {qckRepTickect: TQuickRep},
  UDatModConectar in '..\Fuentes\UDatModConectar.pas' {dmConectar: TDataModule},
  UConectar in '..\Fuentes\UConectar.pas' {frmInciaConeccion},
  DSim in 'DSim.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmConectar, dmConectar);
  Application.CreateForm(TfrmCodigoBarra, frmCodigoBarra);
  Application.Run;
end.
