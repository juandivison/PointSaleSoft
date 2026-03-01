program TestDigitalPersona;

uses
  Forms,
  UFrmMain in 'UFrmMain.pas' {Form1},
  UFingerprintTaskAuth in 'UFingerprintTaskAuth.pas',
  UFingerprintIBX in 'UFingerprintIBX.pas',
  UFingerprintTypes in 'UFingerprintTypes.pas',
  UFrmFpEnroll in 'UFrmFpEnroll.pas',
  UFrmFpVerify in 'UFrmFpVerify.pas',
  UVarBytes in 'UVarBytes.pas',
  UDMdb in 'UDMdb.pas' {dmconectar: TDataModule};


{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tdmconectar, dmconectar);  
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
