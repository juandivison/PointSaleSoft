unit UCalculoDepMensual;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls, Buttons, Db, IBCustomDataSet, Grids, DBGrids,
  IBTable, Variants, Math,RXDBCtrl, RxMemDS, Mask, ToolEdit, DBTables,
  IBQuery, WinSkinData;

type
  TfrmCalculoDepMensual = class(TForm)
    Panel1: TPanel;
    dtpkfecha: TDateTimePicker;
    Label1: TLabel;
    btnCalcular: TBitBtn;
    qryDatosActivos: TIBQuery;
    ProgressBar1: TProgressBar;
    dtqryDatosActivos: TDataSource;
    qryDatosActivosFECHA_COMPRA: TDateTimeField;
    qryDatosActivosVALOR_ORIGINAL: TFloatField;
    qryDatosActivosVALOR_DEPRECIABLE: TFloatField;
    qryDatosActivosDEPRE_ACUM_ANUAL: TFloatField;
    qryDatosActivosDEPRE_ANUAL: TFloatField;
    qryDatosActivosTIPO: TIntegerField;
    qryDatosActivosCODIGO: TIntegerField;
    qryDatosActivosSTATUS_ACTIVO: TStringField;
    PageControl1: TPageControl;
    tabDatosActivos: TTabSheet;
    RxDBGrid1: TRxDBGrid;
    tabCalDepre: TTabSheet;
    RxDBGrid2: TRxDBGrid;
    tabDeprePreliminar: TTabSheet;
    RxDBGrid3: TRxDBGrid;
    btnActualiza: TBitBtn;
    BitBtn3: TBitBtn;
    qryDatosActivosDESCRIPCION: TStringField;
    qryDatosActivosVALOR_EN_LIBRO: TFloatField;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    qryDatosActivosDEPRE_ACUMULADA: TFloatField;
    qryDatosActivosBALANCE_DEPRE: TFloatField;
    qryDatosActivosPORC_DEPRE: TFloatField;
    tActivosControl: TIBTable;
    tActivosControlFECHA_ACTUALIZAR: TDateTimeField;
    tActivosControlIN_POR: TStringField;
    tActivosControlFECHA_IN: TDateTimeField;
    tActivosControlUPD_POR: TStringField;
    tActivosControlFECHA_UPD: TDateTimeField;
    dtActivosControl: TDataSource;
    TabSheet1: TTabSheet;
    Label2: TLabel;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn6: TBitBtn;
    DBDateEdit1: TDBDateEdit;
    SkinData1: TSkinData;
    procedure btnCalcularClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure btnActualizaClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure dtpkfechaExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
  private
    { Private declarations }
    procedure CalculoDepre;
    procedure DepreProcesada;
    procedure ActualizaDepreAnual;//correr este procedure en Enero de Cada Año    
  public
    { Public declarations }
  end;

var
  frmCalculoDepMensual: TfrmCalculoDepMensual;

implementation
uses UDatModuloActivos,UGlobalActivos, URepDeprePreliminar, UDatModConectar;
{$R *.DFM}

procedure TfrmCalculoDepMensual.btnCalcularClick(Sender: TObject);
begin
  dm.qryDepreciacion.Close;
  dm.qryDepreciacion.Filtered:=False;
  dm.qryDepreciacion.Params[0].Value := ExtraerFecha(dtpkfecha.Datetime);
  dm.qryDepreciacion.Params[1].Value := ExtraerFecha(dtpkfecha.Datetime);
  dm.qryDepreciacion.Open;
  if dm.qrycontrolstatus.Value = 'R'  then
  begin
    DepreProcesada;
    Exit;
  end;
  qryDatosActivos.Close;
  qryDatosActivos.Filtered:=false;
  qryDatosActivos.Open;
  progressbar1.Max := qryDatosActivos.Recordcount;
  progressbar1.Position:=0;
  dm.rxDepreciacion.Close;
  dm.rxDepreciacion.Emptytable;
  dm.rxDepreciacion.Open;
  CalculoDepre;
  dm.rxDepreciacion.SortOnFields('TIPO;CODIGO',True,False);
  PageControl1.ActivePage := tabDeprePreliminar;
  Progressbar1.Position:=0;
  if dm.rxDepreciacion.Recordcount = 0 then
  btnActualiza.Enabled:=False else btnActualiza.Enabled:= True;
end;

procedure TfrmCalculoDepMensual.CalculoDepre;
Var
  AnioCompra, MesCompra, DiaCompra : Word;
  AnioActual, MesActual, DiaActual : Word;
  ValorDepreciable : Real;
begin
  qryDatosActivos.First;
  qryDatosActivos.DisableControls;
  While not qryDatosActivos.Eof do
  begin
    dm.rxDepreciacion.Insert;
    DecodeDate(qryDatosActivosFECHA_COMPRA.Value,AnioCompra, MesCompra, DiaCompra);
    DecodeDate(dtpkfecha.Date,AnioActual,MesActual,DiaActual);

{temporal    if (AnioCompra = AnioActual) And (MesCompra <= MesActual) then
    MesActual := 12 - MesCompra + 1 else MesActual := 12;}

    if (AnioCompra = AnioActual) And (MesCompra <= MesActual) then
    MesActual := 12 - MesCompra + 1 else MesActual := 12;


    // temporal if MesActual = 12 then Dec(AnioActual);
    
    if qryDatosActivosVALOR_EN_LIBRO.Value > 100.01 then
    begin
      ValorDepreciable:= qryDatosActivosVALOR_DEPRECIABLE.Value;
      if (MesCompra <= MesActual) And (Aniocompra = AnioActual) then
      ValorDepreciable:=qryDatosActivosValor_Original.Value;
      //dm.rxDepreciacionDepre_Anual.Value := ValorDepreciable * 0.25;qryDatosActivosPORC_DEPRE
      dm.rxDepreciacionDepre_Anual.Value := ValorDepreciable * (qryDatosActivosPORC_DEPRE.Value/2)/100;      
      if (AnioCompra = AnioActual) then //si es el primer año
      dm.rxDepreciacionDepre_Anual.Value :=
      dm.rxDepreciacionDepre_Anual.Value / 2;
    end else
    dm.rxDepreciacionDepre_Anual.Value := qryDatosActivosDEPRE_ANUAL.Value;
    if (MesCompra = MesActual) and (AnioCompra = AnioActual) then
    dm.rxDepreciacionVALOR.Value       := dm.rxDepreciacionDepre_Anual.Value
    else dm.rxDepreciacionVALOR.Value       := dm.rxDepreciacionDepre_Anual.Value / MesActual;
    dm.rxDepreciacionTIPO.Value        := qryDatosActivosTIPO.Value;
    dm.rxDepreciacionDescripcion.Value := qryDatosActivosDESCRIPCION.Value;
    dm.rxDepreciacionCODIGO.Value      := qryDatosActivosCODIGO.Value;
    dm.rxDepreciacionFECHA.Value       := ExtraerFecha(dtpkFecha.Datetime);
    dm.rxDepreciacionSTATUS.Value      := 'A';
    dm.rxDepreciacion.Post;
    Progressbar1.StepIt;
    qryDatosActivos.Next;
  end;
  qryDatosActivos.EnableControls;
end;

procedure TfrmCalculoDepMensual.FormCreate(Sender: TObject);
var
  a,m,d:word;
begin
  dm.qryControl.close;
  dm.qryControl.Filtered:= False;//16--> Depreciacion de Activos
    GlBCntSistema := 16;
  GlbCntSub_sistema:=1;
  GlbCntCod_cia:=1;
  dm.qryControl.Filtered:= True;
  dm.qryControl.Open;
  DecodeDate(dm.qryControlFECHA_ACT.Value,a,m,d);
  if (dm.qryControlSTATUS.Value = 'R') then
  begin
    if (m = 12) then
    begin
      m:=1;
      Inc(a);
    end else Inc(m);
    dtpkfecha.DateTime:= EncodeDate(a,m,DiasEnElMes(a,m));
  end else
  dtpkfecha.Date := ExtraerFecha(dm.qryControlFECHA_ACT.Value);
  dm.qryNombreActivo.Close;
  dm.qryNombreActivo.Open;  
end;

procedure TfrmCalculoDepMensual.BitBtn3Click(Sender: TObject);
begin
  glbFechaInicial:=ExtraerFecha(dtpkfecha.Datetime);
  ActualizaDepreAnual;  
  dm.qryDepreciacion.Close;
  dm.qryDepreciacion.Filtered:=False;
  dm.qryDepreciacion.Params[0].Value := ExtraerFecha(dtpkfecha.Datetime);
  dm.qryDepreciacion.Params[1].Value := ExtraerFecha(dtpkfecha.Datetime);
  dm.qryDepreciacion.Open;
  dm.rxDepreciacion.Close;
  dm.rxDepreciacion.Emptytable;
  dm.rxDepreciacion.Open;  
  qryDatosActivos.Close;
  qryDatosActivos.Filtered:= False;
  qryDatosActivos.Open;
  if qryDatosActivos.RecordCount > 0 then
  btnCalcular.Enabled := True;
end;

procedure TfrmCalculoDepMensual.BitBtn4Click(Sender: TObject);
begin
  qckRepDeprePreliminar:=TqckRepDeprePreliminar.Create(nil);
  try
    qckRepDeprePreliminar.Preliminar:=False;
    qckRepDeprePreliminar.Preview;
  finally
  qckRepDeprePreliminar.Free;
  qckRepDeprePreliminar:=nil;
  end;
end;

{ function SLNDepreciation(Cost, Salvage: Extended; Life: Integer): Extended;
  function SYDDepreciation(Cost, Salvage: Extended; Life, Period: Integer): Extended;
 x:= SYDDepreciation(100,0,5,12);
  ShowMessage(FloattoStr(x));}

procedure TfrmCalculoDepMensual.btnActualizaClick(Sender: TObject);
var
  ActControl:Boolean;
begin
  dm.rxDepreciacion.First;
  ActControl:=False;
  progressbar1.Position := 0 ;
  progressbar1.Max := dm.rxDepreciacion.RecordCount;
  While not dm.rxDepreciacion.Eof Do
  begin
    dm.rxDepreciacion.DisableControls;
    progressbar1.StepIt;
    if dm.rxDepreciacionVALOR.Value > 0 then
    begin
      {if dm.qryDepreciacionSTATUS.Value <> 'R' then
      begin}
      if Not dm.qryDepreciacion.Locate('Tipo;Codigo;Fecha',
      VarArrayOf([dm.rxdepreciacionTipo.Value,
                  dm.rxDepreciacionCODIGO.Value,
                  ExtraerFecha(dm.rxDepreciacionFECHA.Value)]),[]) then
        begin
          dm.qryDepreciacion.Insert;
          dm.qryDepreciacionTIPO.Value     := dm.rxDepreciacionTipo.Value;
          dm.qryDepreciacionCODIGO.Value   := dm.rxDepreciacionCODIGO.Value;
          dm.qryDepreciacionFECHA.Value    := dm.rxDepreciacionFECHA.value;
          dm.qryDepreciacionVALOR.Value    := dm.rxDepreciacionVALOR.Value;
          dm.qryDepreciacionSTATUS.Value   := 'A';
          dm.qryDepreciacionIN_POR.Value   := StrUsername;
          dm.qryDepreciacionFECHA_IN.Value := Now;
          try
            dm.qryDepreciacion.Post;
            dm.qryDepreciacion.ApplyUpdates;
            ActControl := True;
          except
          end;
        end else
        begin
          dm.qryDepreciacion.Edit;
          dm.qryDepreciacionVALOR.Value     := dm.rxDepreciacionVALOR.Value;
          dm.qryDepreciacionFECHA_UPD.Value := Now;
          dm.qrydepreciacionUpd_por.Value   := StrUserName;
          dm.qryDepreciacion.Post;
          dm.qryDepreciacion.ApplyUpdates;
        end;//if Not dm.qryDepreciacion.Locate('tipo;codigo;fecha',
      //end;//if dm.qryDepreciacionSTATUS.Value = 'R' then
    end;//if dm.rxDepreciacionVALOR.Value > 0 then
    dm.rxDepreciacion.Next;
  end;//while not eof do
  if ActControl then
  begin
    dm.qryControl.Edit;
    dm.qryControlFECHA_ACT.Value:=ExtraerFecha(dtpkfecha.DateTime);
    dm.qryControlFECHA_MOD.Value := Now;
    dm.qryControlMOD_POR.Value:=strusername;
    dm.qryControlStatus.Value:='A';
    dm.qryControl.Post;
    dm.qryControl.ApplyUpdates;
  end;
  if not dm.qryControl.Transaction.InTransaction then
  dm.qryControl.Transaction.StartTransaction;
  try
    dm.qryControl.Transaction.CommitRetaining;
  except
  dm.qryControl.Transaction.RollbackRetaining;
  end;
  progressbar1.Position := 0 ;
  dm.rxDepreciacion.EnableControls;
  btnActualiza.Enabled:=False; 
end;

procedure TfrmCalculoDepMensual.BitBtn5Click(Sender: TObject);
begin
  qckRepDeprePreliminar:=TqckRepDeprePreliminar.Create(nil);
  try
    qckRepDeprePreliminar.Preliminar:=False;
    qckRepDeprePreliminar.Preview;
  finally
  qckRepDeprePreliminar.Free;
  qckRepDeprePreliminar:=nil;
  end;  
end;

procedure TfrmCalculoDepMensual.DepreProcesada;
begin
  dm.qryDepreciacion.First;
  progressbar1.Max := dm.qryDepreciacion.RecordCount;
  dm.qryDepreciacion.DisableControls;
  While not dm.qryDepreciacion.Eof do
  begin
    dm.rxDepreciacion.Insert;
    dm.rxDepreciacionVALOR.Value := dm.qryDepreciacionValor.Value;
    dm.rxDepreciacionTIPO.Value  := dm.qryDepreciacionTIPO.Value;
    dm.rxDepreciacionDescripcion.Value := dm.qryDepreciacionDESCRIPCION_ACTIVO.Value;
    dm.rxDepreciacionCODIGO.Value:= dm.qryDepreciacionCODIGO.Value;
    dm.rxDepreciacionFECHA.Value := dm.qryDepreciacionFECHA.Value;
    dm.rxDepreciacionSTATUS.Value:= dm.qryDepreciacionSTATUS.Value;
    dm.rxDepreciacion.Post;
    progressbar1.StepIt;
    dm.qryDepreciacion.Next;
  end;
  progressbar1.Position:=0;
  dm.qryDepreciacion.EnableControls;
end;

procedure TfrmCalculoDepMensual.dtpkfechaExit(Sender: TObject);
var
  a,m,d:Word;
begin
  DecodeDate(dtpkfecha.datetime,a,m,d);
  if (d <> DiasEnElMes(a,m)) then
  begin
    MessageDlg('El dia tiene que ser el último del mes',mtwarning,[mbok],0);
    dtpkfecha.datetime:=EncodeDAte(a,m,DiasEnElMes(a,m));
  end;
end;

procedure TfrmCalculoDepMensual.ActualizaDepreAnual;
var
  a1 : Integer;
begin
  dm.qryMaestroActivos.Close;
  dm.qryMaestroActivos.Open;
  dm.qryMaestroActivos.First;
  tActivosControl.close;
  tActivosControl.Open;
  if ExtraerFecha(tActivosControlFECHA_ACTUALIZAR.Value) =
     ExtraerFecha(dtpkfecha.Date) then
  begin
    if MessageDlg('Iniciar proceso de Actualización Valor en Libro?',mtinformation,[mbyes,mbno],0)=mrNo then
    Exit else
    begin
      While Not dm.qryMaestroActivos.Eof do
      begin
        dm.qryMaestroActivos.Edit;
        dm.qryMaestroActivosValor_depreciable.Value:= dm.qryMaestroActivosVALOR_EN_LIBRO.Value;
        dm.qryMaestroActivos.Post;
        dm.qryMaestroActivos.ApplyUpdates;
        dm.qryMaestroActivos.Next;
      end;
      tActivosControl.Edit;
      a1:= StrToInt(FormatDatetime('yyyy',Date));
      Inc(a1);
      tActivosControlFecha_Actualizar.Value := EncodeDate(a1,1,31);
      tactivoscontrolupd_por.Value  := StrUserName;
      tActivosControlfecha_upd.Value:= Now;
      tActivosControl.Post;
      if Not tActivosControl.Transaction.InTransaction then
      tActivosControl.Transaction.StartTransaction;
      try
        tActivosControl.Transaction.CommitRetaining;
      except
      tActivosControl.Transaction.RollbackRetaining;
      end;
    end;
//else MessageDlg('Iniciar proceso de Actualizacion '+
     //'de Valor en Libro?',mtinformation,[mbyes,mbno],0)=mrNo then
  end;
end;

procedure TfrmCalculoDepMensual.BitBtn1Click(Sender: TObject);
begin
  if (FormatDateTime('mm',tActivosControlFECHA_ACTUALIZAR.Value) = '1') and
     (FormatDateTime('dd',tActivosControlFECHA_ACTUALIZAR.Value) = '31') then
  begin
    if tActivosControl.State = dsEdit then
    begin
      tActivosControl.Post;
      if not tActivosControl.Transaction.InTransaction then
      tActivosControl.Transaction.StartTransaction;
      try
        tActivosControl.Transaction.CommitRetaining;
      except
      tActivosControl.Transaction.RollbackRetaining;
      end;
    end;
  end else
  begin
    MessageDlg('Fecha debe ser xxxx-Enero-31, Verifique',mterror,[mbok],0);
    DBDateEdit1.SetFocus;
  end;
end;

procedure TfrmCalculoDepMensual.BitBtn6Click(Sender: TObject);
begin
  tActivosControl.close;
  tActivosControl.open;
end;

end.
