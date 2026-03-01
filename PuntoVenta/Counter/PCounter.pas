program PCounter;

uses
  Forms,
  UFormMain in 'UFormMain.pas' {frmMain},
  UDatModConectar in '..\Fuentes\UDatModConectar.pas' {dmConectar: TDataModule},
  UConectar in 'UConectar.pas' {frmInciaConeccion},
  UFormProcVentas in 'UFormProcVentas.pas' {frmProcVentas},
  UDatModCxc in '..\Fuentes\UDatModCxc.pas' {dmCxc: TDataModule},
  UDatModFactura in '..\Fuentes\UDatModFactura.pas' {dmFactura: TDataModule},
  UDatModInventario in '..\Fuentes\UDatModInventario.pas' {dmInventario: TDataModule},
  UDatModUsuarios in '..\Fuentes\UDatModUsuarios.pas' {dmUsuarios: TDataModule},
  UDatModClientes in '..\Fuentes\UDatModClientes.pas' {dmClientes: TDataModule},
  UDatModITBIS in '..\Fuentes\UDatModITBIS.pas' {dmItbis: TDataModule},
  UDatosVentas in '..\Fuentes\UDatosVentas.pas' {dmVentas: TDataModule},
  UDatModControl in '..\Fuentes\UDatModControl.pas' {dmControl: TDataModule},
  UDatModCompania in '..\Fuentes\UDatModCompania.pas' {dmCompania: TDataModule},
  UGlobal in '..\Fuentes\UGlobal.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'PointSaleSoft-Ventas';
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TdmConectar, dmConectar);
  Application.CreateForm(TfrmInciaConeccion, frmInciaConeccion);
  Application.CreateForm(TfrmProcVentas, frmProcVentas);
  Application.CreateForm(TdmCxc, dmCxc);
  Application.CreateForm(TdmFactura, dmFactura);
  Application.CreateForm(TdmInventario, dmInventario);
  Application.CreateForm(TdmUsuarios, dmUsuarios);
  Application.CreateForm(TdmClientes, dmClientes);
  Application.CreateForm(TdmItbis, dmItbis);
  Application.CreateForm(TdmVentas, dmVentas);
  Application.CreateForm(TdmControl, dmControl);
  Application.CreateForm(TdmCompania, dmCompania);
  Application.CreateForm(TdmReportes, dmReportes);

  Application.Run;
end.
