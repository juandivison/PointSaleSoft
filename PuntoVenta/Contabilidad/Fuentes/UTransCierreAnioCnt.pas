unit UTransCierreAnioCnt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  db, Dialogs, StdCtrls, EditNew, ComCtrls, Buttons, ExtCtrls, Menus,
  Grids, DBGrids, RXDBCtrl, Mask, DBCtrls, RXCtrls, WinSkinData, RxToolEdit;

type
  TfrmTransCierreAnioCnt = class(TForm)
    Panel2: TPanel;
    Label12: TLabel;
    Label13: TLabel;
    btnSalvar: TBitBtn;
    btnCerarAbrirres: TBitBtn;
    btnModificar: TBitBtn;
    btnInsertar: TBitBtn;
    BitBtn3: TBitBtn;
    btnRecibo: TBitBtn;
    dtpkFechaCierre: TDateTimePicker;
    btnCancelar: TBitBtn;
    edtCtaingresos: TEditN;
    edtNumDoc: TEditN;
    PageControl1: TPageControl;
    tabRecord: TTabSheet;
    ScrollBox1: TScrollBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    DBStatusLabel1: TDBStatusLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBDateEdit1: TDBDateEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    tabExaminar: TTabSheet;
    RxDBGrid1: TRxDBGrid;
    tabCatalogo: TTabSheet;
    RxDBGrid2: TRxDBGrid;
    dtCatalogo: TDataSource;
    SkinData1: TSkinData;
    procedure btnInsertarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
    procedure PrepararControlM(Sistema:Integer;SubSistema:Integer;Lfecha:TDatetime);
    procedure PrepararControl(Lfecha:TDatetime);
    procedure ActualizaControl;
    procedure ActCamposComunes;
    procedure GenerarAsientoNormal;
    procedure GenerarAsientoCierre;
    procedure DecideValorDb;
    procedure DecideValorCR;
    Function VerificaCtaCierre:Boolean;
    
  public
    { Public declarations }
  end;

var
  frmTransCierreAnioCnt: TfrmTransCierreAnioCnt;
  Abortar : Boolean;
  NumeroItem : Integer = 0;

implementation

uses UDatmodDatos, UDatModControl, UDatModCatalogo,UGlobal;

{$R *.dfm}

procedure TfrmTransCierreAnioCnt.ActCamposComunes;
begin
  Inc(NumeroItem);
  //dmdatos.qryTrnCierreAnioNUMERO.Value :=  stpSerieMaster.Params[0].Value;
  dmdatos.qryTrnCierreAnioSERIE.Value  := NumeroItem;
  dmdatos.qryTrnCierreAnioFECHA.Value  := ExtraerFecha(dtpkfechacierre.date);
  dmdatos.qryTrnCierreAnioIN_POR.Value := StrUserName;
  dmdatos.qryTrnCierreAnioFECHA_IN.value:=Now;
  dmdatos.qryTrnCierreAnioTIPO_DOC.Value:=7;
  if edtNumDoc.ValueInteger > 0 then
  dmdatos.qryTrnCierreAnioNUM_DOC.Value := edtNumDoc.ValueInteger;
  dmdatos.qryTrnCierreAnioDESCRIPCION_TRN.value := 'Asiento de Cierre';
end;

procedure TfrmTransCierreAnioCnt.ActualizaControl;
begin
  dmControl.qrycontrolMaster.Close;
  dmControl.qrycontrolMaster.Filtered := False;
  dmControl.qrycontrolMaster.Params[0].Value:=14;//Sistema
  dmControl.qrycontrolMaster.Params[1].Value:=1;//SubSistema
  dmControl.qrycontrolMaster.Params[2].Value:=1;//Cod_cia
  dmControl.qrycontrolMaster.Open;


  dmControl.qrycontrol.Close;
  dmControl.qrycontrol.Open;
  if Not dmControl.qrycontrol.Locate('sistema;sub_sistema;cod_cia',
  VarArrayOf([14,1,1]), []) then
  begin
    MessageDlg('Sistema 14, subSistema 0 y cod_cia 1 no encontrado.', mtInformation, [mbOK], 0);
    exit;
  end;

//    dmControl.qryControl.Close;          // Trans. Cierre Anio
//    dmControl.qryControl.Filter:='Sistema = 14 '+' and sub_sistema = 1 '+
//                          ' And cod_cia = 2 ';
//    dmControl.qryControl.open;
//    dmControl.qryControl.Filtered:=true;
    if dmControl.qryControlSTATUS.Value = 'A' then //Atualiza fecha
      begin
        dmControl.qryControl.Edit;
        dmControl.qryControlFECHA_ACT.Value:=ExtraerFecha(dtpkFechaCierre.Date);
        dmControl.qryControl.post;
        dmControl.qryControl.ApplyUpdates;
        PrepararControl(ExtraerFecha(dtpkFechaCierre.Date));
        Abortar:=false;
      end else
      begin
        MessageDlg('Mes fue cerrado, verifique',mterror,[mbok],0);
        Abortar:=true;
      end;

end;

procedure TfrmTransCierreAnioCnt.btnInsertarClick(Sender: TObject);
var
  cta1,cta2,cta3:string;
begin
  PrepararControlM(14,1,dtpkFechaCierre.Date);
  if Abortar then Exit;
  GlbAsignaCuenta(edtCtaingresos.Text,cta1,cta2,cta3);
  if not CtaExiste(cta1,cta2,cta3,False) then
  begin
    MessageDlg('Cuenta de Ingresos no existe en catalogo, verifique',mtError,[mbok],0);
    exit;
  end;
  if edtNumDoc.ValueInteger <= 0 then
  begin
    MessageDlg('Falta número de Documento, verifique',mtError,[mbok],0);
    exit;
  end;
  dmCatalogo.qryCuentas400_700.Close;
  dmCatalogo.qryCuentas400_700.Open;
  //dm.qryCatalogo.Filtered:=False;
  //dm.qryCatalogo.Filter  :=' cuenta1 > '+chr(39)+'399'+chr(39)+
  //' and '+' cuenta1 < '+chr(39)+'701'+chr(39)+
  //' and tipo_cta = '+chr(39)+'A'+chr(39)+
  //' and balance_act <> 0';
  //dm.qryCatalogo.Filtered:=True;
  //dm.qryCatalogo.Open;
  if VerificaCtaCierre then
  begin
    MessageDlg('Existe(n) cuenta(s) sin cuenta de cierre, verifique',mtError,[mbok],0);
    exit;
  end;
  dmCatalogo.qryCatalogo.Close;
  dmCatalogo.qryCatalogo.params[0].Value:=GlbCodigoCia;
  dmCatalogo.qryCatalogo.Open;
  dmCatalogo.qryCatalogo.First;
  //stpSerieMaster.ExecProc;//Genera Numero Transaccion;
  while not dmCatalogo.qryCatalogo.Eof do
  begin
    dmdatos.qryTrnCierreAnio.Insert;
    ActCamposComunes;
    GenerarAsientoNormal;
    dmdatos.qryTrnCierreAnio.Insert;
    ActCamposComunes;
    GenerarAsientoCierre;
    dmCatalogo.qryCatalogo.next;
  end;
  ActualizaControl;
end;

procedure TfrmTransCierreAnioCnt.DecideValorCR;
begin
 if dmCatalogo.qryCatalogoSIGNO_CTA.Value = 1 then //db
  begin
    if dmCatalogo.qrycatalogobalance_act.Value < 0 then
    begin
      dmdatos.qryTrnCierreAnioCREDITO_TRN.Value := Abs(dmCatalogo.qrycatalogobalance_act.Value);
      dmdatos.qryTrnCierreAnioDEBITO_TRN.Value  := 0;
    end else
    begin
      dmdatos.qryTrnCierreAnioDEBITO_TRN.Value := dmCatalogo.qrycatalogobalance_act.Value;
      dmdatos.qryTrnCierreAnioCREDITO_TRN.Value:= 0;
    end;
  end else //cr
  begin
    if dmCatalogo.qrycatalogobalance_act.Value < 0 then
    begin
      dmdatos.qryTrnCierreAnioDEBITO_TRN.Value := Abs(dmCatalogo.qrycatalogobalance_act.Value);
      dmdatos.qryTrnCierreAnioCREDITO_TRN.Value:= 0;
    end else
    begin
      dmdatos.qryTrnCierreAnioCREDITO_TRN.Value := dmCatalogo.qrycatalogobalance_act.Value;
      dmdatos.qryTrnCierreAnioDEBITO_TRN.Value  := 0;
    end;
  end;
end;

procedure TfrmTransCierreAnioCnt.DecideValorDb;
begin
 if dmCatalogo.qryCatalogoSIGNO_CTA.Value = 1 then //db
  begin
    if dmCatalogo.qrycatalogobalance_act.Value < 0 then
    begin
      dmdatos.qryTrnCierreAnioDEBITO_TRN.Value := Abs(dmCatalogo.qrycatalogobalance_act.Value);
      dmdatos.qryTrnCierreAnioCREDITO_TRN.Value:= 0;
    end else
    begin
      dmdatos.qryTrnCierreAnioCREDITO_TRN.Value := dmCatalogo.qrycatalogobalance_act.Value;
      dmdatos.qryTrnCierreAnioDEBITO_TRN.Value  := 0;
    end;
  end else //cr
  begin
    if dmCatalogo.qrycatalogobalance_act.Value < 0 then
    begin
      dmdatos.qryTrnCierreAnioCREDITO_TRN.Value := Abs(dmCatalogo.qrycatalogobalance_act.Value);
      dmdatos.qryTrnCierreAnioDEBITO_TRN.Value  := 0;
    end else
    begin
      dmdatos.qryTrnCierreAnioDEBITO_TRN.Value := dmCatalogo.qrycatalogobalance_act.Value;
      dmdatos.qryTrnCierreAnioCREDITO_TRN.Value:= 0;
    end;
  end;
end;

procedure TfrmTransCierreAnioCnt.GenerarAsientoCierre;
begin
 dmdatos.qryTrnCierreAnioCUENTA1.Value := dmCatalogo.qryCatalogoCTACIE1.Value;
  dmdatos.qryTrnCierreAnioCUENTA2.Value := dmCatalogo.qryCatalogoCTACIE2.Value;
  dmdatos.qryTrnCierreAnioCUENTA3.Value := dmCatalogo.qryCatalogoCTACIE3.Value;
  DecideValorCR;
  btnSalvarClick(Self);
end;

procedure TfrmTransCierreAnioCnt.GenerarAsientoNormal;
begin
  dmdatos.qryTrnCierreAnioCUENTA1.Value := dmCatalogo.qryCatalogoCUENTA1.Value;
  dmdatos.qryTrnCierreAnioCUENTA2.Value := dmCatalogo.qryCatalogoCUENTA2.Value;
  dmdatos.qryTrnCierreAnioCUENTA3.Value := dmCatalogo.qryCatalogoCUENTA3.Value;
  DecideValorDB;
  btnSalvarClick(Self);
end;

procedure TfrmTransCierreAnioCnt.PrepararControl(Lfecha: TDatetime);
begin
  if not dmControl.qryControldet.Locate('fecha_Act',ExtraerFEcha(Lfecha),[]) then
  begin
    dmControl.qryControldet.Insert;
    dmControl.qryControlDetFECHA_IN.Value := now;
    dmControl.qryControlDetIN_POR.Value := strUserName;
    //dmcxc.stpActSerieCtrl.Close;
    //dmcxc.stpActSerieCtrl.ExecProc;
    dmControl.qryControlDetSERIE.Value:= FsqlMaxNumero('Control_det','serie');//dmcxc.stpActSerieCtrl.Params[0].value;
    if dmControl.qryControlDetSERIE.Value = 0 then
    dmControl.qryControlDetSERIE.Value:=1;
    dmControl.qryControlDetCOD_CIA.Value:=2;//tropical tours
    dmControl.qryControlDetSISTEMA.Value:=dmControl.qryControlSISTEMA.Value;
    dmControl.qryControlDetSUB_SISTEMA.Value:=dmControl.qryControlSUB_SISTEMA.Value;
    dmControl.qryControldetFECHA_ACT.Value:=ExtraerFecha(LFecha);
    dmControl.qryControldetSTATUS.value := 'A';
    dmControl.qryControldet.Post;
    dmControl.qryControldet.ApplyUpdates;
    if not dmControl.qryControldet.Transaction.InTransaction then
    dmControl.qryControldet.Transaction.StartTransaction;
    try
      dmControl.qryControldet.Transaction.CommitRetaining;
    except
    dmControl.qryControldet.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmTransCierreAnioCnt.PrepararControlM(Sistema,
  SubSistema: Integer; Lfecha: TDatetime);
begin
  dmControl.qrycontrolMaster.Close;
  dmControl.qrycontrolMaster.Filtered := False;
  dmControl.qrycontrolMaster.Params[0].Value:=Sistema;
  dmControl.qrycontrolMaster.Params[1].Value:=SubSistema;
  dmControl.qrycontrolMaster.Params[2].Value:=1;//Cod_cia
  dmControl.qrycontrolMaster.Open;

  dmControl.qrycontrol.Close;
  dmControl.qrycontrol.Open;
  if Not dmControl.qrycontrol.Locate('sistema;sub_sistema;cod_cia',
  VarArrayOf([sistema,subsistema,1]), []) then
  MessageDlg('Modulo transacciones año no encontrado, verifique.', mtInformation, [mbOK], 0);

  //dmControl.qryControl.close;          // Trans. Cierre Anio
  //dmControl.qryControl.Filter:='sistema = '+IntToStr(sistema)+
  //                      ' and sub_sistema = '+IntToStr(subsistema)+
  //                      ' and cod_cia = 1 ';
  //dmControl.qryControl.open;
  //dmControl.qryControl.Filtered:=true; //
  if (ExtraerFecha(dmControl.qryControlFECHA_ACT.Value) = ExtraerFecha(Lfecha)) then
  begin
    MessageDlg('Transacciones Generadas, Verifique',mterror,[mbok],0);
    exit;
  end;
end;

function TfrmTransCierreAnioCnt.VerificaCtaCierre: Boolean;
begin
 dmCatalogo.qryCuentas400_700.First;
  while not dmCatalogo.qryCuentas400_700.Eof do
  begin
    if dmCatalogo.qryCuentas400_700CTACIE1.IsNull then
    Begin
      Result := True;
      Break;
    end else Result := False;
    dmCatalogo.qryCuentas400_700.Next;
  end;
end;

procedure TfrmTransCierreAnioCnt.btnSalvarClick(Sender: TObject);
begin
  if dmdatos.qryTrnCierreAnio.state in [dsInsert] then
  begin
    dmdatos.qryTrnCierreAnio.Post;
    dmdatos.qryTrnCierreAnio.ApplyUpdates;
    if not dmdatos.qryTrnCierreAnio.Transaction.InTransaction then
    dmdatos.qryTrnCierreAnio.Transaction.StartTransaction;
    try
      dmdatos.qryTrnCierreAnio.Transaction.CommitRetaining;
    except
    dmdatos.qryTrnCierreAnio.Transaction.RollbackRetaining;
    end;
  end;
end;

end.
