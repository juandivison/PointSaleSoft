unit UFormNominaContratista;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  db, Dialogs, rxToolEdit, RXDBCtrl, StdCtrls, Mask, DBCtrls, WinSkinData, Menus,
  RXCtrls, Buttons, Grids, DBGrids;

type
  TfrmNominaContratista = class(TForm)
    Label12: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    Label13: TLabel;
    DBEdit10: TDBEdit;
    Label14: TLabel;
    DBEdit11: TDBEdit;
    Label15: TLabel;
    Label16: TLabel;
    DBDateEdit1: TDBDateEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    SkinData1: TSkinData;
    DBLookupComboBox2: TDBLookupComboBox;
    RxDBGrid1: TRxDBGrid;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn31: TBitBtn;
    RxSpeedButton1: TRxSpeedButton;
    PopupMenu1: TPopupMenu;
    PostearNomina1: TMenuItem;
    Imprimir1: TMenuItem;
    ComprobantePago1: TMenuItem;
    BitBtn7: TBitBtn;
    DBStatusLabel1: TDBStatusLabel;
    Label8: TLabel;
    DBEdit7: TDBEdit;
    DataSource1: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure DBEdit2Change(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn31Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Imprimir1Click(Sender: TObject);
    procedure PostearNomina1Click(Sender: TObject);
    procedure ComprobantePago1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    _xTipoNomina : Integer;
    _xcodigoProy : Integer;

    Procedure CalcularMontos;
    Procedure AplicaDescuentos;
    Procedure AplicaDescLey(idProy:integer);
    Function CantDiasTrabajado(tipoN:smallint):real;
    Procedure ProcInsertarDatos(tnomina:integer;codProy:integer);
  end;

var
  frmNominaContratista: TfrmNominaContratista;

implementation
Uses UDatModNomina, UDatModReportes, USelTipoNomIntegrarContratista, uGlobal,
  URepNominaContratista, UReporteSobreNominaEmpCont;

{$R *.dfm}

procedure TfrmNominaContratista.FormCreate(Sender: TObject);
begin
  dmNomina.qryProyectos.Close;
  dmNomina.qryProyectos.Open;
  dmNomina.qryContratistas.Close;
  dmNomina.qryContratistas.Params[0].Value:=  _xTipoNomina;
  dmNomina.qryContratistas.Params[1].Value:= GlbCodigoCia;
  dmnomina.qryContratistas.Params[2].Value:= _xcodigoProy;
  dmNomina.qryContratistas.Open;
  dmNomina.tblNominaContratista.Close;
  dmNomina.tblNominaContratista.Params[0].Value:= ExtraerFEcha(GlbFechaNomina);
  dmNomina.tblNominaContratista.Open;
end;

procedure TfrmNominaContratista.BitBtn7Click(Sender: TObject);
var
  flag : boolean;
  tipoNomina : Integer;
  xcodigoProy : Integer;
begin
  frmSelDatosIntegrarNomCont:=TfrmSelDatosIntegrarNomCont.Create(Nil);
  try
    if frmSelDatosIntegrarNomCont.Showmodal = mrCancel then
    flag:=true else
    begin
      tipoNomina:= frmSelDatosIntegrarNomCont.xTipoNomina;
      xcodigoProy := frmSelDatosIntegrarNomCont.xCodigoProyecto;
    end;
  finally
  frmSelDatosIntegrarNomCont.Free;
  frmSelDatosIntegrarNomCont:=Nil;
  end;

  if flag then Exit;

  ProcInsertarDatos(tipoNomina,xcodigoProy);
end;

procedure TfrmNominaContratista.ProcInsertarDatos(tnomina:integer;codProy:integer);
begin
  dmnomina.qryContratistas.Close;
  dmnomina.qryContratistas.Params[0].Value:= tNomina;
  dmnomina.qryContratistas.Params[1].Value:= GlbCodigoCia;
  dmnomina.qryContratistas.Params[2].Value:= codProy;
  dmnomina.qryContratistas.Open;
  dmnomina.tblNominaContratista.Close;
  dmnomina.tblNominaContratista.Open;
  dmnomina.qryContratistas.First;
  if dmnomina.qryContratistas.RecordCount = 0 then
  begin
    MessageDlg('No se encontraron empleados para Nómina Proyecto seleccionado, verifique.',mtInformation, [mbOK], 0);
    Exit;
  end;

  While Not dmnomina.qryContratistas.Eof Do
  begin
    if Not dmnomina.tblNominaContratista.Locate('cia_key;CODIGO_EMP;codigo_proy;fecha_nomina',
    VarArrayOf([dmnomina.qryContratistasCIA_KEY.Value,
    dmnomina.qryContratistasCODIGO.Value,codProy,ExtraerFecha(GlbFechaNomina)]),[]) then
    begin
      dmnomina.tblNominaContratista.Append;
      dmnomina.tblNominaContratistaCOOPERATIVA.Value   := 0;
      dmnomina.tblNominaContratistaCUOTA_PRESTAMO.Value:= 0;
      dmnomina.tblNominaContratistaCANT_DIAS.Value     := CantDiasTrabajado(tNomina);
      dmnomina.tblNominaContratistaCIA_KEY.Value       := dmnomina.qryContratistasCIA_KEY.Value;
      dmnomina.tblNominaContratistaCODIGO_EMP.Value    := dmnomina.qryContratistasCODIGO.Value;
      dmnomina.tblNominaContratistaCODIGO_PROY.Value   := codProy;
      dmnomina.tblNominaContratistaFECHA_NOMINA.Value  := GlbFechaNomina;
      dmnomina.tblNominaContratistaPRECIO_XDIA.Value   := dmnomina.qryContratistasSALARIO_XDIA.Value;
      dmnomina.tblNominaContratistaSTATUS.Value        := 'A';
      GlbSalvarQuery(dmnomina.tblNominaContratista);
    end else
    begin
      if (dmnomina.tblNominaContratistaSTATUS.Value = 'A') then
      begin
        dmnomina.tblNominaContratista.Edit;
        dmnomina.tblNominaContratistaFECHA_MOD.Value:= Now;
        dmnomina.tblNominaContratistaMOD_POR.Value  := StrUserName;
        dmnomina.tblNominaContratistaCANT_DIAS.Value     := CantDiasTrabajado(tNomina);
        dmnomina.tblNominaContratistaPRECIO_XDIA.Value:=dmnomina.qryContratistasSALARIO_XDIA.Value;
      end;
    end;
    dmnomina.qryContratistas.Next;
  end;
  CalcularMontos;
end;

procedure TfrmNominaContratista.CalcularMontos;
begin
  dmnomina.qryEscalaISR.Close;
  dmnomina.qryEscalaISR.Params[0].Value:= ExtraerFecha(GlbFechaTrnDiaria);
  dmnomina.qryEscalaISR.Open;

  dmNomina.qryDeducciones.Close;
  dmNomina.qryDeducciones.Params[0].Value:= ExtraerFecha(GlbFechaTrnDiaria);
  dmNomina.qryDeducciones.Open;

  dmnomina.tblNominaContratista.First;
  While Not dmnomina.tblNominaContratista.Eof do
  begin
    if (dmnomina.tblNominaContratistaSTATUS.Value = 'A') then
    begin
      dmnomina.tblNominaContratista.Edit;
      dmnomina.tblNominaContratistaSALARIO_BRUTO.Value:=
      dmnomina.tblNominaContratistaCANT_DIAS.Value  * dmnomina.tblNominaContratistaPRECIO_XDIA.Value;
      dmnomina.tblNominaContratistaFECHA_MOD.Value := Now;
      dmnomina.tblNominaContratistaMOD_POR.Value   := StrUserName;
      //t Hasta que me Pasen mas Info 
      //t AplicaDescLey(dmnomina.tblNominaContratistaCODIGO_PROY.Value);
      AplicaDescuentos;
      GlbSalvarQuery(dmnomina.tblNominaContratista);
    end;
    dmnomina.tblNominaContratista.Next;
  end;
end;

procedure TfrmNominaContratista.AplicaDescuentos;
begin
 dmnomina.tblNominaContratistaSALARIO_BRUTO.Value:=
 dmnomina.tblNominaContratistaCANT_DIAS.Value  * dmnomina.tblNominaContratistaPRECIO_XDIA.Value;
  dmnomina.tblNominaContratistaMONTO_RETENCIONDGII.Value :=
  (dmnomina.tblNominaContratistaSALARIO_BRUTO.Value  +
  dmnomina.tblNominaContratistaOTROS_INGRESOS.Value) *
  dmNomina.qryProyectosPORC_RETENCION.Value / 100;

  dmnomina.tblNominaContratistaSALARIO_NETO.Value:=
  (dmnomina.tblNominaContratistaSALARIO_BRUTO.Value   +
   dmnomina.tblNominaContratistaOTROS_INGRESOS.Value) -
  (dmnomina.tblNominaContratistaCOOPERATIVA.Value +
   dmnomina.tblNominaContratistaMONTO_AFP.Value   +
   dmnomina.tblNominaContratistaTSS.Value +
   dmnomina.tblNominaContratistaISR.Value +
   dmnomina.tblNominaContratistaSFS_DEPENDIENTES.Value   +
   dmnomina.tblNominaContratistaSFS_COMPLEMENTARIO.Value +
   dmnomina.tblNominaContratistaOTRAS_DEDUCCIONES.Value  + {Retenciones}
   dmnomina.tblNominaContratistaCUOTA_PRESTAMO.Value     +
   dmnomina.tblNominaContratistaMONTO_RETENCIONDGII.Value);
end;

procedure TfrmNominaContratista.DBEdit2Change(Sender: TObject);
begin
  if dmnomina.tblNominaContratista.State in [dsEdit] then
  AplicaDescuentos;
end;

procedure TfrmNominaContratista.BitBtn4Click(Sender: TObject);
begin
  if dmNomina.tblNominaContratistaSTATUS.Value = 'R' then
  begin
    MessageDlg('Nómina fue posteada, verifique.',mtInformation, [mbOK], 0);
    Exit;
  end;
  if dmnomina.tblNominaContratista.State in [dsEdit, dsInsert] then
  GlbSalvarQuery(dmnomina.tblNominaContratista);
end;

procedure TfrmNominaContratista.BitBtn5Click(Sender: TObject);
begin
  dmnomina.tblNominaContratista.Close;
  dmnomina.tblNominaContratista.Open;
end;

procedure TfrmNominaContratista.BitBtn31Click(Sender: TObject);
begin
  CalcularMontos;
end;

procedure TfrmNominaContratista.BitBtn3Click(Sender: TObject);
begin
  if dmnomina.tblNominaContratista.State In [dsEdit, dsInsert] then
  dmnomina.tblNominaContratista.Cancel;
end;

procedure TfrmNominaContratista.BitBtn2Click(Sender: TObject);
begin
  if dmNomina.tblNominaContratistaSTATUS.Value = 'R' then
  begin
    MessageDlg('Nómina fue posteada, verifique.', mtInformation, [mbOK], 0);
    Exit;
  end;

  if dmnomina.tblNominaContratista.State In [dsBrowse] then
  dmnomina.tblNominaContratista.Edit;
end;

procedure TfrmNominaContratista.Imprimir1Click(Sender: TObject);
begin
  dmNomina.qryRepNominaContratista.Close;
  dmNomina.qryRepNominaContratista.Params[0].Value:= dmnomina.tblNominaContratistaCIA_KEY.Value;
  dmNomina.qryRepNominaContratista.Params[1].Value:= dmnomina.tblNominaContratistaCODIGO_PROY.Value;
  dmNomina.qryRepNominaContratista.Params[2].Value:= ExtraerFecha(dmnomina.tblNominaContratistaFECHA_NOMINA.Value);
  dmNomina.qryRepNominaContratista.Open;
  dmNomina.qryRepNominaContratista.First;

  if (dmNomina.qryRepNominaContratistaSTATUS.Value = 'R') then
  glbCheckNomina:=1
  else
  glbCheckNomina := 3;
  if dmNomina.qryRepNominaContratista.RecordCount > 0 then
  begin
    QckRepNominaContratista:=TQckRepNominaContratista.Create(Nil);
    try
      QckRepNominaContratista.Preview;
    finally
    QckRepNominaContratista.Free;
    QckRepNominaContratista:=Nil;
    end;
  end else
  begin
    MessageDlg('No existen datos con el criterio seleccionado, verifique.', mtInformation,[mbOk], 0);
  end;
end;

procedure TfrmNominaContratista.PostearNomina1Click(Sender: TObject);
begin
  if MessageDlg('Continuar con posteo de nómina contratista?', mtInformation, [mbYes, mbNo], 0) = mrNo then
  Exit;

  dmNomina.tblControl.Close;
  dmNomina.tblControl.Params[0].Value:= 5;
  dmNomina.tblControl.Params[1].Value:= 6;
  dmNomina.tblControl.Open;

  if (dmNomina.tblControl.RecordCount = 0) then
  begin
    MessageDlg('Sistema 5 sub-sistema 6 no ha sido configurado en control posteo, verifique.', mtInformation, [mbOK], 0);
    Exit;  
  end;
  if  ExtraerFecha(GlbFechaNomina) < dmNomina.tblControlFECHA_ACT.Value then
  begin
    MessageDlg('Nómina no puede ser posteada, verifique', mtInformation, [mbOK], 0);
    Exit;
  end;
    dmNomina.tblControl.Edit;
    dmNomina.tblControlFECHA_ACT.Value:= ExtraerFecha(GlbFechaNomina);
    dmNomina.tblControl.post;
    dmNomina.tblControl.ApplyUpdates;

    GlbSalvarQuery(dmNomina.tblControl);
    dmNomina.tblControl.Close;
    
    //ProcActBlcPrestamo;

    dmnomina.tblNominaContratista.First;

    While Not dmnomina.tblNominaContratista.Eof do
    begin
      dmnomina.tblNominaContratista.Edit;
      dmnomina.tblNominaContratistaSTATUS.Value := 'R';
      dmnomina.tblNominaContratistaMOD_POR.Value:= StrUserName;
      dmnomina.tblNominaContratistaFECHA_MOD.Value := Now;
      dmnomina.tblNominaContratistaCODIGO_USUARIO.Value:= VarUsuarioGlb;
      GlbSalvarQuery(dmnomina.tblNominaContratista);
      dmnomina.tblNominaContratista.Next;
    end;
    MessageDlg('Nómina posteada.', mtInformation, [mbOK], 0);

end;

function TfrmNominaContratista.CantDiasTrabajado(tipoN: smallint): real;
begin
  //diario 5.5 quincenal 11.915 mensual 23.83
  Case tipoN Of
  1: begin
       result := 5.5;
     end;
  2: begin
       result := 11.915;
     end;
  3: begin
       result := 23.83;
     end;
  4: begin
       result := 0;
     end;
  end;
end;

procedure TfrmNominaContratista.AplicaDescLey(idProy:integer);
var
  PorcAFP : Currency;
  PorcTSS : Currency;
begin
  if dmNomina.qryDeducciones.Locate('CODIGO_DESCUENTO', 2, []) then //Afp
  PorcAFP :=dmNomina.qryDeduccionesPORCIENTO_EMP.Value;

  if dmNomina.qryDeducciones.Locate('CODIGO_DESCUENTO', 3, []) then //SFS
  PorcTSS :=dmNomina.qryDeduccionesPORCIENTO_EMP.Value;

  dmnomina.ibstpAplicaISRC.Params[0].Value:= glbCia_Key;
  //dmnomina.ibstpAplicaISRC.Params[1].Value:= glbTipoNom;
  dmnomina.ibstpAplicaISRC.Params[1].Value:= ExtraerFecha(GlbFechaNomina);
  dmnomina.ibstpAplicaISRC.Params[2].Value:= dmnomina.qryEscalaISRR1.Value;
  dmnomina.ibstpAplicaISRC.Params[3].Value:= dmnomina.qryEscalaISRR2.Value;
  dmnomina.ibstpAplicaISRC.Params[4].Value:= dmnomina.qryEscalaISRR3.Value;
  dmnomina.ibstpAplicaISRC.Params[5].Value:= PorcAFP;
  dmnomina.ibstpAplicaISRC.Params[6].Value:= PorcTSS;
  dmnomina.ibstpAplicaISRC.Params[7].Value:= idProy;
  dmnomina.ibstpAplicaISRC.ExecProc;
  if Not dmnomina.ibstpAplicaISRC.Transaction.InTransaction then
  dmnomina.ibstpAplicaISRC.Transaction.StartTransaction;
  try
    dmnomina.ibstpAplicaISRC.Transaction.CommitRetaining;
  except
  dmnomina.ibstpAplicaISRC.Transaction.RollbackRetaining;
  end;
end;

procedure TfrmNominaContratista.ComprobantePago1Click(Sender: TObject);
begin
  dmNomina.qryRepNominaContratista.Close;
  dmNomina.qryRepNominaContratista.Params[0].Value:= dmnomina.tblNominaContratistaCIA_KEY.Value;
  dmNomina.qryRepNominaContratista.Params[1].Value:= dmnomina.tblNominaContratistaCODIGO_PROY.Value;
  dmNomina.qryRepNominaContratista.Params[2].Value:= ExtraerFecha(dmnomina.tblNominaContratistaFECHA_NOMINA.Value);
  dmNomina.qryRepNominaContratista.Open;
  
  qckSobrePagoNominaCont:=tqckSobrePagoNominaCont.Create(nil);
  try
    if dmNomina.qryRepNominaContratistaSTATUS.Value = 'A' then
    qckSobrePagoNominaCont.QRLabel11.caption       := 'Preliminar' else
    if dmNomina.qryRepNominaContratistaSTATUS.Value = 'R' then
    qckSobrePagoNominaCont.QRLabel11.caption       := 'Definitiva' else
    qckSobrePagoNominaCont.QRLabel11.caption       := 'Status nómina sin definir';
    qckSobrePagoNominaCont.Preview;
  finally
  qckSobrePagoNominaCont.Free;
  qckSobrePagoNominaCont:=Nil;
  end;
end;

end.
