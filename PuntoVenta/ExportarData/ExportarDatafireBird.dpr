program ExportarDatafireBird;

uses
  Forms,
  UMainFormExpData in 'UMainFormExpData.pas' {Form1},
  UDatModConectarOrigen in 'UDatModConectarOrigen.pas' {dmConectarOrigen: TDataModule},
  UDatModConectarDestino in 'UDatModConectarDestino.pas' {dmConectarDestino: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TdmConectarOrigen, dmConectarOrigen);
  Application.CreateForm(TdmConectarDestino, dmConectarDestino);
  Application.Run;
end.
