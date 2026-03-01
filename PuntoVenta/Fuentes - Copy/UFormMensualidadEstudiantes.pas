unit UFormMensualidadEstudiantes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, RXDBCtrl, rxToolEdit, RxLookup, StdCtrls, Mask,
  DB, DBCtrls, RXCtrls, Buttons, WinSkinData;

type
  TfrmMensualidadEstudiantes = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    RxDBLookupCombo3: TRxDBLookupCombo;
    Label13: TLabel;
    Label2: TLabel;
    DBDateEdit1: TDBDateEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    RxDBGrid1: TRxDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    DBStatusLabel2: TDBStatusLabel;
    BitBtn7: TBitBtn;
    SkinData1: TSkinData;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
    procedure InsertaMensualidad;
  public
    { Public declarations }
  end;

var
  frmMensualidadEstudiantes: TfrmMensualidadEstudiantes;

implementation

uses UDatModEstudiante, UGlobal, DateUtils;

{$R *.dfm}

procedure TfrmMensualidadEstudiantes.BitBtn1Click(Sender: TObject);
begin
  if dmEstudiante.tblPagosEstudiantes.State = dsBrowse then
  begin
    dmEstudiante.tblPagosEstudiantes.Insert;
    dmEstudiante.tblPagosEstudiantesIDANOESCOLAR.Value:= GLBIDAnioEscolar;
    dmEstudiante.tblPagosEstudiantesIDESTUDIANTE.Value:=
    dmEstudiante.qryEstudianteMastID_ESTUDIANTE.Value;
    dmEstudiante.tblPagosEstudiantesSTATUS.Value:='A';
    dmEstudiante.tblPagosEstudiantesCOD_USUARIO.Value:= VarUsuarioGlb;
    dmEstudiante.tblPagosEstudiantesFECHA_IN.Value := Now;
    dmEstudiante.tblPagosEstudiantesIN_POR.Value:= StrUserName;

  end;
end;

procedure TfrmMensualidadEstudiantes.BitBtn2Click(Sender: TObject);
begin
  if dmEstudiante.tblPagosEstudiantes.State = dsBrowse then
  dmEstudiante.tblPagosEstudiantes.Edit;
end;

procedure TfrmMensualidadEstudiantes.BitBtn4Click(Sender: TObject);
begin
  if dmEstudiante.tblPagosEstudiantes.state in [dsEdit, dsInsert] then
  begin
    dmEstudiante.tblPagosEstudiantes.Post;
    dmEstudiante.tblPagosEstudiantes.ApplyUpdates;
    if not dmEstudiante.tblPagosEstudiantes.Transaction.InTransaction then
    dmEstudiante.tblPagosEstudiantes.Transaction.StartTransaction;
    try
     dmEstudiante.tblPagosEstudiantes.Transaction.CommitRetaining;
    except
    dmEstudiante.tblPagosEstudiantes.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmMensualidadEstudiantes.BitBtn5Click(Sender: TObject);
begin
  if dmEstudiante.tblPagosEstudiantes.State In [dsBrowse] then
  begin
    dmEstudiante.tblPagosEstudiantes.Close;
    dmEstudiante.tblPagosEstudiantes.Open;
  end;
end;

procedure TfrmMensualidadEstudiantes.InsertaMensualidad;
var
  cant, i,mesIni, mesFin : Integer;
  fechapago : TDate;
  mesActual, diaActual, anoActual : word;
begin
  dmEstudiante.tblPrecioXNivelColegio.Close;
  dmEstudiante.tblPrecioXNivelColegio.Params[0].Value := GLBIDAnioEscolar;
  dmEstudiante.tblPrecioXNivelColegio.Open;

  if Not dmEstudiante.tblPrecioXNivelColegio.Locate('IDNIVEL',
  dmEstudiante.qryEstudianteDetIDNIVEL.Value,[]) then
  begin
    MessageDlg('Tarifa para nivel seleccionado no existe, verifique.', mtError,[mbOk], 0);
    exit;
  end;
  mesIni := MonthOf(dmEstudiante.qryAnoEscolarActivoMESINICIAMENSUALIDAD.Value);
  mesFin := MonthOf(dmEstudiante.qryAnoEscolarActivoMESFINMENSUALIDAD.Value);
  cant := MonthsBetween(dmEstudiante.qryAnoEscolarActivoMESINICIAMENSUALIDAD.Value,
                        dmEstudiante.qryAnoEscolarActivoMESFINMENSUALIDAD.Value);
  fechapago:= EncodeDate(StrToInt(FormatDateTime('yyyy',dmEstudiante.qryAnoEscolarActivoMESINICIAMENSUALIDAD.Value)),
                          mesIni, StrToInt(FormatDateTime('dd',GlbDiaFactMensualidad)));
  for i:=0 to cant do
  begin
    if Not dmEstudiante.tblPagosEstudiantes.Locate('IDANOESCOLAR;IDESTUDIANTE;FECHA_PAGO',
    varArrayOf([GLBIDAnioEscolar,
                dmEstudiante.qryEstudianteMastID_ESTUDIANTE.Value,
                fechapago]), []) then
    begin
      dmEstudiante.tblPagosEstudiantes.Insert;
      dmEstudiante.tblPagosEstudiantesIDANOESCOLAR.Value:= GLBIDAnioEscolar;
      dmEstudiante.tblPagosEstudiantesIDESTUDIANTE.Value:= dmEstudiante.qryEstudianteMastID_ESTUDIANTE.Value;
      dmEstudiante.tblPagosEstudiantesMONTO.Value       := dmEstudiante.tblPrecioXNivelColegioPRECIO.Value;
      dmEstudiante.tblPagosEstudiantesFECHA_PAGO.Value  := fechapago;
      {if (StrToInt(FormatDateTime('mm',fechapago)) = 2) then
      begin
        if IsInLeapYear(fechapago) then
        fechapago:=EncodeDate(StrToInt(FormatDateTime('yyyy',fechapago)),
                          mesIni, 29) else
        fechapago:=EncodeDate(StrToInt(FormatDateTime('yyyy',fechapago)),
                          mesIni, 28);
        dmEstudiante.tblPagosEstudiantesFECHA_PAGO.Value  := fechapago;
      end;}
      dmEstudiante.tblPagosEstudiantesSTATUS.Value      :='A';
      dmEstudiante.tblPagosEstudiantesCOD_USUARIO.Value := VarUsuarioGlb;
      dmEstudiante.tblPagosEstudiantesFECHA_IN.Value    := Now;
      dmEstudiante.tblPagosEstudiantesIN_POR.Value      := StrUserName;
      BitBtn4Click(Self);
    end;
    fechapago:=IncMonth(fechapago);
    DecodeDate(fechapago, anoActual, mesActual, diaActual);
    if ((diaActual = 28) or (diaActual = 29)) and (mesActual = 3) then
    fechapago:=EncodeDate(anoActual,mesActual,StrToInt(FormatDateTime('dd',GlbDiaFactMensualidad)));
  end;
end;

procedure TfrmMensualidadEstudiantes.BitBtn7Click(Sender: TObject);
begin
  InsertaMensualidad;
end;

procedure TfrmMensualidadEstudiantes.BitBtn3Click(Sender: TObject);
begin
  if dmEstudiante.tblPagosEstudiantes.State In [dsBrowse] then
  begin
    dmEstudiante.tblPagosEstudiantes.Delete;
    dmEstudiante.tblPagosEstudiantes.ApplyUpdates;
    if not dmEstudiante.tblPagosEstudiantes.Transaction.InTransaction then
    dmEstudiante.tblPagosEstudiantes.Transaction.StartTransaction;
    try
     dmEstudiante.tblPagosEstudiantes.Transaction.CommitRetaining;
    except
    dmEstudiante.tblPagosEstudiantes.Transaction.RollbackRetaining;
    end;
  end;
end;

end.
