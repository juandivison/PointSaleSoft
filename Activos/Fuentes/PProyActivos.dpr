program PProyActivos;

uses
  Forms,
  UMenuPrincipal in 'UMenuPrincipal.pas' {frmMenuP},
  UDatModuloActivos in 'UDatModuloActivos.pas' {dm: TDataModule},
  UTipoActivo in 'UTipoActivo.pas' {frmTipoActivo},
  UPresentacionA in 'UPresentacionA.pas' {frmPresentacion},
  UMaestroActivos in 'UMaestroActivos.pas' {frmMaestroActivos},
  UCargarActivos in 'UCargarActivos.pas' {frmCargarActivos},
  UCalculoDepMensual in 'UCalculoDepMensual.pas' {frmCalculoDepMensual},
  URepDeprePreliminar in '..\Reportes\URepDeprePreliminar.pas' {qckRepDeprePreliminar: TQuickRep},
  UPosteoTrnDepre in 'UPosteoTrnDepre.pas' {frmPosteoTransDepre},
  UHistoricoActivos in 'UHistoricoActivos.pas' {frmHistoricoActivo},
  UContDepreciacionActivos in 'UContDepreciacionActivos.pas' {frmContDepreciacion},
  UDistribucionCtaActivos in 'UDistribucionCtaActivos.pas' {frmCtasActivos},
  URepEntradaDepCnt in '..\Reportes\URepEntradaDepCnt.pas' {qckRepDepAcntDet: TQuickRep},
  URepEntradaRDepCnt in '..\Reportes\URepEntradaRDepCnt.pas' {qckRepDepAcnt: TQuickRep},
  URepMaestroActivos in '..\Reportes\URepMaestroActivos.pas' {qckMaestroActivos: TQuickRep},
  UGrupoCtaActivos in 'UGrupoCtaActivos.pas' {frmGrupocuentaActivo},
  UDatModConectar in 'UDatModConectar.pas' {dmCon: TDataModule},
  UDatmodAdm in 'UDatmodAdm.pas' {dtAdm: TDataModule},
  UActCtaTrampolinAdm in 'UActCtaTrampolinAdm.pas' {frmActCtaTrampAdm},
  UConectar in 'UConectar.pas' {frmInciaConeccion},
  UConsultaDepreciacion in 'UConsultaDepreciacion.pas' {frmConsultaDepreciacion};

{$R *.RES}

begin
  Application.Initialize;
  frmPresentacion:=TfrmPresentacion.create(nil);
  frmPresentacion.show;
  frmPresentacion.Update;
  Application.ProcessMessages;
  Application.HelpFile := 'ManualModuloActivos.hlp';
  Application.CreateForm(TdmCon, dmCon);
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TdtAdm, dtAdm);
  Application.CreateForm(TfrmMenuP, frmMenuP);
  frmPresentacion.Hide;
  frmPresentacion.Free;
  Application.Run;
end.
