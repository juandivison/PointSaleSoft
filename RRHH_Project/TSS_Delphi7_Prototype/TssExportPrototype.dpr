program TssExportPrototype;

uses
  Forms,
  // MidasLib evita depender de MIDAS.DLL al usar TClientDataSet.
  // Si su edicion de Delphi 7 no trae MidasLib, quite esta linea y distribuya MIDAS.DLL.
  MidasLib,
  UFrmTssExportCenter in 'UFrmTssExportCenter.pas' {frmTssExportCenter},
  UTssTypes in 'UTssTypes.pas',
  UTssFormatUtils in 'UTssFormatUtils.pas',
  UTssValidator in 'UTssValidator.pas',
  UTssExporters in 'UTssExporters.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Centro de Exportacion TSS';
  Application.CreateForm(TfrmTssExportCenter, frmTssExportCenter);
  Application.Run;
end.
