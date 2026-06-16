unit UEscalaISR;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IBCustomDataSet, Db, Grids, DBGrids, RXDBCtrl, RXCtrls, StdCtrls, Buttons,
  ExtCtrls, rxToolEdit, Mask, DBCtrls, USelCntCta, RxMemDS, Placemnt,
  IBUpdateSQL, IBQuery, GetAnyDate, WinSkinData, RxPlacemnt;

type
  TfrmEscalaIsr = class(TForm)
    qryEscalaISR: TIBQuery;
    dtqryEscalaISR: TDataSource;
    updQryEscalaISR: TIBUpdateSQL;
    RxDBGrid1: TRxDBGrid;
    BitBtn1: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    qryEscalaISRCODIGO_ESCALA: TIntegerField;
    qryEscalaISRESCALA_RETENCION: TFloatField;
    qryEscalaISRTASA_EXENTO: TFloatField;
    qryEscalaISREXCEDENTE: TFloatField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    DBDateEdit1: TDBDateEdit;
    DBDateEdit2: TDBDateEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    Label8: TLabel;
    rxDatos: TRxMemoryData;
    rxDatosCODIGO_RETENCION: TIntegerField;
    rxDatosCODIGO_ESCALA: TIntegerField;
    rxDatosESCALA_RETENCION: TFloatField;
    rxDatosTASA_EXENTO: TFloatField;
    rxDatosEXCEDENTE: TFloatField;
    rxDatosFECHA_INI: TDateTimeField;
    rxDatosFECHA_FIN: TDateTimeField;
    rxDatosOBSERVACIONES: TStringField;
    rxDatosSTATUS_RETEN: TStringField;
    dtrxDatos: TDataSource;
    FormStorage1: TFormStorage;
    GetAnyDate1: TGetAnyDate;
    qryEscalaISROBSERVACIONES: TIBStringField;
    qryEscalaISRSTATUS_RETEN: TIBStringField;
    qryEscalaISRCODIGO_RETENCION: TIntegerField;
    qryEscalaISRFECHA_INI: TDateTimeField;
    qryEscalaISRFECHA_FIN: TDateTimeField;
    DBStatusLabel1: TDBStatusLabel;
    SkinData1: TSkinData;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEscalaIsr: TfrmEscalaIsr;

implementation
   uses UGlobal, UDatosTempEscalaIsr, UFechaFinEscalaIsr, UDatModConectar;

{$R *.DFM}

procedure TfrmEscalaIsr.BitBtn4Click(Sender: TObject);
begin
  GetAnyDate1.FechaCierre := ExtraerFecha(GlbFechaTrnDiaria);
  if GetAnyDate1.Execute then
  begin
    qryEscalaISR.Close;
    qryEscalaISR.Params[0].Value := ExtraerFecha(GetAnyDate1.Fecha);
    qryEscalaISR.Open;
  end;
end;

procedure TfrmEscalaIsr.BitBtn1Click(Sender: TObject);
var
  CodR : Integer;
  xFecha :TDatetime;
begin
  GetAnyDate1.FechaCierre := ExtraerFecha(qryEscalaISRFECHA_INI.Value);
  if GetAnyDate1.Execute then
  begin
    qryEscalaISR.Close;
    qryEscalaISR.Params[0].Value := ExtraerFecha(GetAnyDate1.Fecha);
    qryEscalaISR.Open;
    qryEscalaISR.First;
    CodR := FsqlMaxNumero('RETENCION_ISR','CODIGO_RETENCION');
    rxDatos.close;
    rxDatos.open;
    While Not qryEscalaISR.Eof do
    begin
      rxDatos.AppendRecord([CodR,
                            qryEscalaISRCodigo_Escala.Value,
                            qryEscalaISREscala_Retencion.Value,
                            qryEscalaISRTASA_EXENTO.Value,
                            qryEscalaISREXCEDENTE.Value,
                            qryEscalaISRFecha_Ini.Value,
                            qryEscalaISRFecha_Fin.Value,
                            qryEscalaISRObservaciones.Value,
                            qryEscalaISRStatus_reten.Value]);
      Inc(CodR);                            
      qryEscalaISR.Next;
    end;
    frmDatosTempEscalaIsr:=TfrmDatosTempEscalaIsr.Create(nil);
    try
      if frmDatosTempEscalaIsr.Showmodal = mrOk then
      begin
        frmFechaEscalaFinIsr:=TfrmFechaEscalaFinIsr.Create(nil);
        if frmFechaEscalaFinIsr.ShowModal = mrOk then
        frmFechaEscalaFinIsr.DateTimePicker1.Date:=ExtraerFecha(qryEscalaISRFecha_Fin.Value);
        qryEscalaISR.First;
        While Not qryEscalaISR.Eof do
        begin
          qryEscalaISR.Edit;
          qryEscalaISRFecha_fin.Value:= ExtraerFecha(frmFechaEscalaFinIsr.DateTimePicker1.Date);
          qryEscalaISR.Post;
          qryEscalaISR.ApplyUpdates;
          if not qryEscalaISR.Transaction.InTransaction then
          qryEscalaISR.Transaction.StartTransaction;
          try
          qryEscalaISR.Transaction.CommitRetaining;
          except
          qryEscalaISR.Transaction.RollbackRetaining;
          end;
          qryEscalaISR.Next;
       end;
      end else Exit;
      xFecha:=ExtraerFecha(frmFechaEscalaFinIsr.DateTimePicker1.Date) + 1;
      ShowMessage('Fecha inicial para nueva escala:'+FormatDatetime('yyyy-mm-dd',xFecha));
      frmFechaEscalaFinIsr.Free;
      frmFechaEscalaFinIsr:=Nil;
      if rxDatos.State = dsEdit then rxDatos.Post;
      rxDatos.First;
      While Not rxDatos.Eof Do
      begin
        qryEscalaISR.Append;
        qryEscalaISRCODIGO_RETENCION.Value:=rxDatosCodigo_Retencion.Value;
        qryEscalaISRCODIGO_ESCALA.Value:= rxDatosCodigo_Escala.Value;
        qryEscalaISRESCALA_RETENCION.Value:= rxDatosEscala_Retencion.Value;
        qryEscalaISRTASA_EXENTO.Value:= rxDatosTasa_Exento.Value;
        qryEscalaISREXCEDENTE.Value:= rxDatosExcedente.Value;
        qryEscalaISRFECHA_INI.Value:=ExtraerFecha(xFecha);
        qryEscalaISRFECHA_FIN.Value:= ExtraerFecha(xFecha)+365;
        qryEscalaISROBSERVACIONES.Value:=  rxDatosObservaciones.Value;
        qryEscalaISRSTATUS_RETEN.Value:= rxDatosstatus_reten.Value;
          qryEscalaISR.ApplyUpdates;
          if not qryEscalaISR.Transaction.InTransaction then
          qryEscalaISR.Transaction.StartTransaction;
          try
          qryEscalaISR.Transaction.CommitRetaining;
          except
          qryEscalaISR.Transaction.RollbackRetaining;
          end;
          rxDatos.Next;
        end;
    finally
    frmDatosTempEscalaIsr.Free;
    frmDatosTempEscalaIsr := Nil;
    end;
  end;
  //t if not dm.dbDatos.InTransaction then
  //t dm.dbDatos.StartTransaction;
  //t try
  //t  dmCon.IBDatabase1.CommitRetaining;
  //t except
  //t dmCon.IBDatabase1.RollbackRetaining;
  //t end;
end;

procedure TfrmEscalaIsr.BitBtn3Click(Sender: TObject);
begin
  if qryEscalaISR.State in [dsEdit, dsInsert] then
  begin
    qryEscalaISR.Post;
    qryEscalaISR.ApplyUpdates;
    if not qryEscalaISR.Transaction.InTransaction then
    qryEscalaISR.Transaction.StartTransaction;
    try
      qryEscalaISR.Transaction.CommitRetaining;
    except
    qryEscalaISR.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmEscalaIsr.BitBtn2Click(Sender: TObject);
begin
  if qryEscalaISR.State in [dsBrowse] then
  qryEscalaISR.First;
end;

procedure TfrmEscalaIsr.BitBtn10Click(Sender: TObject);
begin
  if qryEscalaISR.State in [dsBrowse] then
  qryEscalaISR.Prior;
end;

procedure TfrmEscalaIsr.BitBtn11Click(Sender: TObject);
begin
  if qryEscalaISR.State in [dsBrowse] then
  qryEscalaISR.Next;
end;

procedure TfrmEscalaIsr.BitBtn12Click(Sender: TObject);
begin
  if qryEscalaISR.State In [dsBrowse] then
  qryEscalaISR.Last;
end;

procedure TfrmEscalaIsr.FormCreate(Sender: TObject);
begin
  qryEscalaISR.Close;
  qryEscalaISR.Params[0].Value := ExtraerFecha(GlbFechaTrnDiaria);
  qryEscalaISR.Open;
end;

end.
