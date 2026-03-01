program PointSaleSoftResp;

uses
  Forms,
  UMenuPrincipal in 'UMenuPrincipal.pas' {frmMenuPrincipal},
  UDatosVentas in 'UDatosVentas.pas' {dmVentas: TDataModule},
  UDatModInventario in 'UDatModInventario.pas' {dmInventario: TDataModule},
  UGlobal in 'UGlobal.pas',
  UDatModCxc in 'UDatModCxc.pas' {dmCxc: TDataModule},
  UDatModIngresos in 'UDatModIngresos.pas' {dmIngresos: TDataModule},
  UDatModFactura in 'UDatModFactura.pas' {dmFactura: TDataModule},
  UPresentacion in 'UPresentacion.pas' {frmPresentacion},
  UDatModClientes in 'UDatModClientes.pas' {dmClientes: TDataModule},
  UDatModCompania in 'UDatModCompania.pas' {dmCompania: TDataModule},
  UDatModReportes in '..\Reportes\UDatModReportes.pas' {dmReportes: TDataModule},
  UDatModControl in 'UDatModControl.pas' {dmControl: TDataModule},
  UAcercaDe in 'UAcercaDe.pas' {AboutBox},
  UDatModBalanceCxc in 'UDatModBalanceCxc.pas' {dmBalanceCxc: TDataModule},
  UDatModUsuarios in 'UDatModUsuarios.pas' {dmUsuarios: TDataModule},
  uLogin in 'uLogin.pas' {frmLogin},
  UDatModEmpleados in 'UDatModEmpleados.pas' {dmEmpleados: TDataModule},
  UDatModDespacho in 'UDatModDespacho.pas' {dmDespacho: TDataModule},
  UDatModRuta in 'UDatModRuta.pas' {dmRutas: TDataModule},
  UDatModCuadrexRuta in 'UDatModCuadrexRuta.pas' {dmCuadrexRuta: TDataModule},
  UGlobalCp in '..\..\..\Comun\UGlobalCp.pas',
  UDatModCostos in 'UDatModCostos.pas' {dmCostos: TDataModule},
  UDatModPrestamo in 'UDatModPrestamo.pas' {dmPrestamo: TDataModule},
  UDatModComisiones in 'UDatModComisiones.pas' {dmComision: TDataModule},
  UDatModRegOpeDiaria in 'UDatModRegOpeDiaria.pas' {dtmTransOpeDiaria: TDataModule},
  UDatModNomina in 'UDatModNomina.pas' {dmNomina: TDataModule},
  UControlAct in '..\..\..\Comun\UControlAct.pas' {frmControlSistema},
  UDatModDescuentosNom in 'UDatModDescuentosNom.pas' {dmDescuentosNom: TDataModule},
  UDatModConectar in 'UDatModConectar.pas' {dmConectar: TDataModule},
  UDatModITBIS in 'UDatModITBIS.pas' {dmItbis: TDataModule},
  UConectar in 'UConectar.pas' {frmInciaConeccion},
  UDatmodDatosGenerales in 'UDatmodDatosGenerales.pas' {dmDatos: TDataModule},
  UDatModPagoTarjeta in 'UDatModPagoTarjeta.pas' {dmPagosTarjeta: TDataModule},
  UDatModProveedor in 'UDatModProveedor.pas' {dmProveedor: TDataModule},
  UDatModCxp in 'UDatModCxp.pas' {dmCxp: TDataModule},
  UConfigRep in 'UConfigRep.pas' {frmConfReporte},
  DSim in 'DSim.pas',
  UDatModDistCNT in 'UDatModDistCNT.pas' {dmDistCnt: TDataModule},
  UContabilizarformBase in 'UContabilizarformBase.pas' {frmContabilizaDatos},
  UDatModTransCnt in 'UDatModTransCnt.pas' {dmTransCnt: TDataModule},
  UContabilizarVentas in 'UContabilizarVentas.pas' {frmContabilizarVentas};

{$R *.res}

begin
  Application.Initialize;
  frmPresentacion:=TfrmPresentacion.Create(nil);
  frmPresentacion.Show;
  frmPresentacion.Update;
  Application.HelpFile := '';
  Application.Title := 'Punto de Ventas';
  Application.CreateForm(TdmConectar, dmConectar);
  Application.CreateForm(TdmControl, dmControl);
  Application.CreateForm(TdmCompania, dmCompania);
  Application.CreateForm(TdmEmpleados, dmEmpleados);
  Application.CreateForm(TdmUsuarios, dmUsuarios);
  Application.CreateForm(TdmInventario, dmInventario);
  Application.CreateForm(TdmCxc, dmCxc);
  Application.CreateForm(TdmIngresos, dmIngresos);
  Application.CreateForm(TdmFactura, dmFactura);
  Application.CreateForm(TdmClientes, dmClientes);
  Application.CreateForm(TdmVentas, dmVentas);
  Application.CreateForm(TdmReportes, dmReportes);
  Application.CreateForm(TdmBalanceCxc, dmBalanceCxc);
  Application.CreateForm(TdmDespacho, dmDespacho);
  Application.CreateForm(TdmRutas, dmRutas);
  Application.CreateForm(TdmCuadrexRuta, dmCuadrexRuta);
  Application.CreateForm(TdmCostos, dmCostos);
  Application.CreateForm(TdmCxp, dmCxp);
  Application.CreateForm(TdmPrestamo, dmPrestamo);
  Application.CreateForm(TdmComision, dmComision);
  Application.CreateForm(TdtmTransOpeDiaria, dtmTransOpeDiaria);
  Application.CreateForm(TdmNomina, dmNomina);
  Application.CreateForm(TdmDescuentosNom, dmDescuentosNom);
  Application.CreateForm(TdmItbis, dmItbis);
  Application.CreateForm(TdmDatos, dmDatos);
  Application.CreateForm(TdmPagosTarjeta, dmPagosTarjeta);
  Application.CreateForm(TdmProveedor, dmProveedor);
  Application.CreateForm(TdmDistCnt, dmDistCnt);
  Application.CreateForm(TdmTransCnt, dmTransCnt);
  Application.CreateForm(TfrmMenuPrincipal, frmMenuPrincipal);
  frmPresentacion.Close;
  frmPresentacion.Free;
  frmPresentacion:=Nil;
  Application.Run;
end.


