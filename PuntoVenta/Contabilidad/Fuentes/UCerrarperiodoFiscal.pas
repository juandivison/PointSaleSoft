unit UCerrarperiodoFiscal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, WinSkinData;

type
  TfrmCerrarPFiscal = class(TForm)
    Panel2: TPanel;
    BitBtn3: TBitBtn;
    BitBtn1: TBitBtn;
    Memo1: TMemo;
    ProgressBar1: TProgressBar;
    SkinData1: TSkinData;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure ActCambios;
    procedure ActHistoricoCtas(cta1:string;cta2:string;cta3:string);
    procedure qryBceCtamesedit;
    procedure qryBceCtamesinsert;
    procedure ActControles(cta1:string;cta2:string;cta3:string;valor:Extended);

  public
    { Public declarations }
  end;

var
  frmCerrarPFiscal: TfrmCerrarPFiscal;

implementation

uses UDatModCatalogo, UDatModCompania, uglobal;

{$R *.dfm}

procedure TfrmCerrarPFiscal.ActCambios;
begin
  dmCatalogo.tblqryCatalogoMOD_POR.Value  := StruserName;
  dmCatalogo.tblqryCatalogoFECHA_MOD.Value:= Now;
end;

procedure TfrmCerrarPFiscal.ActControles(cta1, cta2, cta3: string;
  valor: Extended);
var
  ctrl1,ctrl2,ctrl3:String;
begin
  ProgressBar1.Position:=0;
  ProgressBar1.Max:=20;
  While  dmCatalogo.tblqryCatalogonivel_cta.Value > 1 do
  begin
    ProgressBar1.StepIt;
    if dmCatalogo.tblqryCatalogonivel_cta.Value > 1 then break;
    if dmCatalogo.tblqryCatalogo.Locate('cuenta1;cuenta2;cuenta3',
    VarArrayOf([cta1,cta2,cta3]),[]) then
    begin
      ctrl1:= dmCatalogo.tblqryCatalogoCTA_CTRL1.Value;
      ctrl2:= dmCatalogo.tblqryCatalogoCTA_CTRL2.Value;
      ctrl3:= dmCatalogo.tblqryCatalogoCTA_CTRL3.Value;
      dmCatalogo.tblqryCatalogo.Edit;
      dmCatalogo.tblqryCatalogoBALANCE_Ant.Value := dmCatalogo.tblqryCatalogoBALANCE_Act.Value;
      dmCatalogo.tblqryCatalogoBALANCE_ACT.Value := dmCatalogo.tblqryCatalogoBALANCE_ACT.Value + valor;
      dmCatalogo.tblqryCatalogo.Post;
      dmCatalogo.tblqryCatalogo.ApplyUpdates;
      ActHistoricoCtas(cta1,cta2,cta3);
      ActControles(ctrl1,ctrl2,ctrl3,Valor);
    end;
  end;//while
  //tCompaniaCTA1_ULT_RETENIDA

end;

procedure TfrmCerrarPFiscal.ActHistoricoCtas(cta1, cta2, cta3: string);
begin
    if dmCatalogo.qryBceCtames.Locate('CUENTA1_BLC;CUENTA2_BLC;CUENTA3_BLC;STATUS_CIEA',
    VarArrayof([cta1,cta2,cta3,'D']),[]) Then //D =>Despues del Cierre Año
    begin
     if dmCatalogo.tblqryCatalogo.Locate('cuenta1;cuenta2;cuenta3',
     VarArrayOf([cta1,cta2,cta3]),[]) then
      qryBceCtamesEdit;
    end else
    begin
     if dmCatalogo.tblqryCatalogo.Locate('cuenta1;cuenta2;cuenta3',
     VarArrayOf([cta1,cta2,cta3]),[]) then
      qryBceCtamesInsert;
    end;
end;

procedure TfrmCerrarPFiscal.BitBtn1Click(Sender: TObject);
var
  m1,m2,m3,m4:String;
  tBalanceAct:Real;
  tValor : Real;
  ctrl1,ctrl2,ctrl3:String;
begin
  ProgressBar1.Visible:=true;
  ProgressBar1.Max:=4;  
  m1:='';m2:='';m3:='';
  dmCompania.tblCompania.Close;
  dmCompania.tblCompania.Filtered:=False;
  //dmCompania.tblCompania.Filter  :='CODIGO = 2';//tropical tours
  //dmCompania.tblCompania.Filtered:=True;
  dmCompania.tblCompania.Open;
  dmCatalogo.tblqryCatalogo.Close;
  dmCatalogo.tblqryCatalogo.Filtered := False;
  dmCatalogo.tblqryCatalogo.params[0].Value:=GlbCodigoCia;
  dmCatalogo.tblqryCatalogo.Open;

  dmCatalogo.qryBceCtames.Close;
  dmCatalogo.qryBceCtames.Filtered := False;
  dmCatalogo.qryBceCtames.Params[0].VAlue := ExtraerFecha(dmCatalogo.tblqryCatalogofecha_act.Value);
  dmCatalogo.qryBceCtames.Params[1].VAlue := ExtraerFecha(dmCatalogo.tblqryCatalogofecha_act.Value);
  dmCatalogo.qryBceCtames.Open;

    if not dmCatalogo.tblqryCatalogo.Locate('cuenta1;cuenta2;cuenta3',
    VarArrayOf([dmCompania.tblCompaniaCTA1_RESUMEN_GYP.Value,
                dmCompania.tblCompaniaCTA2_RESUMEN_GYP.Value,
                dmCompania.tblCompaniaCTA3_RESUMEN_GYP.Value]),[]) then
    begin
      m1:='Cuenta de Resumen de Gyp no existe en catalogo';
    end;

    if not dmCatalogo.tblqryCatalogo.Locate('cuenta1;cuenta2;cuenta3',
    VarArrayOf([dmCompania.tblCompaniaCTA1_GYP_PERIODO.Value,
                dmCompania.tblCompaniaCTA2_GYP_PERIODO.Value,
                dmCompania.tblCompaniaCTA3_GYP_PERIODO.Value]),[]) then
    begin
      m2:='Cuenta de Gyp del Periodo no existe en catalogo';
    end;
    if not dmCatalogo.tblqryCatalogo.Locate('cuenta1;cuenta2;cuenta3',
       VarArrayOf([dmCompania.tblCompaniaCTA1_SUPERAVIT_ACM.Value,//gyp periodo anterior,
                   dmCompania.tblCompaniaCTA2_SUPERAVIT_ACM.Value,//cambiar nombre field
                   dmCompania.tblCompaniaCTA3_SUPERAVIT_ACM.Value]),[]) then
    begin
      m3:='Cuenta de GyP Periodo Anterior no existe en catalogo';
    end;
    if not dmCatalogo.tblqryCatalogo.Locate('cuenta1;cuenta2;cuenta3',
       VarArrayOf([dmCompania.tblCompaniaCTA1_ult_retenida.Value,
                   dmCompania.tblCompaniaCTA2_ult_retenida.Value,
                   dmCompania.tblCompaniaCTA3_ult_retenida.Value]),[]) then
    begin
      m4:='Cuenta de Utilidades Retenida no existe en catalogo';
    end;
    if (m1 <> '') or (m2 <> '') or (m3 <> '') or (m4 <> '') then
    begin
      MessageDlg(m1+'#13'+m2+'#13'+m3+','+'#13'+m4+','+'#13'+'Verifique en descripcion de Compañia',
      mtError,[mbok],0);
      Exit;
    end;
    //******************periodo Actual***************
{    if dmCatalogo.tblqryCatalogo.Locate('cuenta1;cuenta2;cuenta3',
    VarArrayOf(['313','02','00']),[]) then
    begin
      dmCatalogo.tblqryCatalogo.Edit;
      dmCatalogo.tblqryCatalogoBalance_Ant.Value := 0;
      dmCatalogo.tblqryCatalogoBalance_Act.Value := 0;
      ActCambios;
      dmCatalogo.tblqryCatalogo.Post;
      dmCatalogo.tblqryCatalogo.ApplyUpdates;
      ActHistoricoCtas('313','02','00');
    end;}
    //******************fin periodo actual **********

    //************** Inicia Proceso *************
    if dmCatalogo.tblqryCatalogo.Locate('cuenta1;cuenta2;cuenta3',
    VarArrayOf([dmCompania.tblCompaniaCTA1_RESUMEN_GYP.Value,
                dmCompania.tblCompaniaCTA2_RESUMEN_GYP.Value,
                dmCompania.tblCompaniaCTA3_RESUMEN_GYP.Value]),[]) then
    begin
      dmCatalogo.tblqryCatalogo.Edit;
      dmCatalogo.tblqryCatalogoBalance_Ant.Value:=dmCatalogo.tblqryCatalogoBalance_Act.Value;
      tValor:= dmCatalogo.tblqryCatalogoBalance_Act.Value;
      dmCatalogo.tblqryCatalogoBalance_Act.Value := 0;
      ActCambios;
      dmCatalogo.tblqryCatalogo.Post;
      dmCatalogo.tblqryCatalogo.ApplyUpdates;
      ActHistoricoCtas(dmCompania.tblCompaniaCTA1_RESUMEN_GYP.Value,
                dmCompania.tblCompaniaCTA2_RESUMEN_GYP.Value,
                dmCompania.tblCompaniaCTA3_RESUMEN_GYP.Value);
    end;

    if dmCatalogo.tblqryCatalogo.Locate('cuenta1;cuenta2;cuenta3',
    VarArrayOf([dmCompania.tblCompaniaCTA1_GYP_PERIODO.Value,
                dmCompania.tblCompaniaCTA2_GYP_PERIODO.Value,
                dmCompania.tblCompaniaCTA3_GYP_PERIODO.Value]),[]) then
    begin
      ctrl1:= dmCatalogo.tblqryCatalogoCTA_CTRL1.Value;
      ctrl2:= dmCatalogo.tblqryCatalogoCTA_CTRL2.Value;
      ctrl3:= dmCatalogo.tblqryCatalogoCTA_CTRL3.Value;
      dmCatalogo.tblqryCatalogo.Edit;
      dmCatalogo.tblqryCatalogoBalance_Ant.Value:=dmCatalogo.tblqryCatalogoBalance_Act.Value;
      dmCatalogo.tblqryCatalogoBalance_Act.Value:=tValor;
      ActCambios;
      dmCatalogo.tblqryCatalogo.Post;
      dmCatalogo.tblqryCatalogo.ApplyUpdates;
      ActHistoricoCtas(dmCompania.tblCompaniaCTA1_GYP_PERIODO.Value,
                       dmCompania.tblCompaniaCTA2_GYP_PERIODO.Value,
                       dmCompania.tblCompaniaCTA3_GYP_PERIODO.Value)
    end;
    if dmCatalogo.tblqryCatalogo.Locate('cuenta1;cuenta2;cuenta3',
       VarArrayOf([dmCompania.tblCompaniaCTA1_SUPERAVIT_ACM.Value,
                   dmCompania.tblCompaniaCTA2_SUPERAVIT_ACM.Value,
                   dmCompania.tblCompaniaCTA3_SUPERAVIT_ACM.Value]),[]) then
    begin
      ctrl1:= dmCatalogo.tblqryCatalogoCTA_CTRL1.Value;
      ctrl2:= dmCatalogo.tblqryCatalogoCTA_CTRL2.Value;
      ctrl3:= dmCatalogo.tblqryCatalogoCTA_CTRL3.Value;
      dmCatalogo.tblqryCatalogo.Edit;
      dmCatalogo.tblqryCatalogoBalance_Ant.Value:=dmCatalogo.tblqryCatalogoBalance_Act.Value;
      tBalanceAct:=dmCatalogo.tblqryCatalogoBalance_Act.Value;
      dmCatalogo.tblqryCatalogoBalance_Act.Value := 0;
      ActCambios;
      dmCatalogo.tblqryCatalogo.Post;
      dmCatalogo.tblqryCatalogo.ApplyUpdates;
      ActHistoricoCtas(dmCompania.tblCompaniaCTA1_SUPERAVIT_ACM.Value,
                       dmCompania.tblCompaniaCTA2_SUPERAVIT_ACM.Value,
                       dmCompania.tblCompaniaCTA3_SUPERAVIT_ACM.Value);
      ActControles(ctrl1,ctrl2,ctrl3,tBalanceAct);
    end;
    // Utilidades Retenidas          //
    if dmCatalogo.tblqryCatalogo.Locate('cuenta1;cuenta2;cuenta3',
       VarArrayOf([dmCompania.tblCompaniaCTA1_Ult_Retenida.Value,
                   dmCompania.tblCompaniaCTA2_Ult_Retenida.Value,
                   dmCompania.tblCompaniaCTA3_Ult_Retenida.Value]),[]) then
    begin
      ctrl1:= dmCatalogo.tblqryCatalogoCTA_CTRL1.Value;
      ctrl2:= dmCatalogo.tblqryCatalogoCTA_CTRL2.Value;
      ctrl3:= dmCatalogo.tblqryCatalogoCTA_CTRL3.Value;
      dmCatalogo.tblqryCatalogo.Edit;
      dmCatalogo.tblqryCatalogoBalance_Ant.Value := dmCatalogo.tblqryCatalogoBalance_Act.Value;
      dmCatalogo.tblqryCatalogoBalance_Act.Value := dmCatalogo.tblqryCatalogoBalance_Act.Value + tBalanceAct;
      ActCambios;
      dmCatalogo.tblqryCatalogo.Post;
      dmCatalogo.tblqryCatalogo.ApplyUpdates;
      ActHistoricoCtas(dmCompania.tblCompaniaCTA1_Ult_Retenida.Value,
                       dmCompania.tblCompaniaCTA2_Ult_Retenida.Value,
                       dmCompania.tblCompaniaCTA3_Ult_Retenida.Value);
      ActControles(Ctrl1,Ctrl2,Ctrl3,tBalanceAct);
    end;
    //        ******************** /////////
    if not dmCatalogo.tblqryCatalogo.Transaction.InTransaction then
    dmCatalogo.tblqryCatalogo.Transaction.StartTransaction;
    try
      dmCatalogo.tblqryCatalogo.Transaction.CommitRetaining;
    except
    dmCatalogo.tblqryCatalogo.Transaction.RollbackRetaining;
    end;

    MessageDlg('Proceso realizado con exito',mtInformation,[mbok],0);
    Beep;
    ProgressBar1.Visible:=False;
    //************** Finaliza Proceso *************

end;

procedure TfrmCerrarPFiscal.qryBceCtamesedit;
begin
  dmCatalogo.qryBceCtames.Edit;
  dmCatalogo.qryBceCtamesDEBITO.Value := dmCatalogo.tblqryCatalogoDEBITO_ACT.Value;
  dmCatalogo.qryBceCtamesCREDITO.Value:= dmCatalogo.tblqryCatalogoCREDITO_ACT.Value;
  dmCatalogo.qryBceCtamesBALANCE_ACT.Value:=dmCatalogo.tblqryCatalogoBALANCE_ACT.Value;
  dmCatalogo.qryBceCtamesBALANCE_ANT.Value:= dmCatalogo.tblqryCatalogoBALANCE_ANT.Value;
  dmCatalogo.qryBceCtames.Post;
  dmCatalogo.qryBceCtames.ApplyUpdates;
end;

procedure TfrmCerrarPFiscal.qryBceCtamesinsert;
begin
  dmCatalogo.qryBceCtames.Insert;
  dmCatalogo.qryBceCtamesDEBITO.Value      := dmCatalogo.tblqryCatalogodebito_act.Value;
  dmCatalogo.qryBceCtamesCREDITO.Value     := dmCatalogo.tblqryCatalogocredito_act.Value;
  dmCatalogo.qryBceCtamesBALANCE_ACT.Value := dmCatalogo.tblqryCatalogoBALANCE_ACT.Value;
  dmCatalogo.qryBceCtamesBALANCE_ANT.Value := dmCatalogo.tblqryCatalogoBALANCE_ANT.Value;
  dmCatalogo.qryBceCtamesCUENTA1_BLC.Value := dmCatalogo.tblqryCatalogocuenta1.Value;
  dmCatalogo.qryBceCtamesCUENTA2_BLC.Value := dmCatalogo.tblqryCatalogocuenta2.Value;
  dmCatalogo.qryBceCtamesCUENTA3_BLC.Value := dmCatalogo.tblqryCatalogocuenta3.Value;
  dmCatalogo.qryBceCtamesFECHA_BLC.Value   := dmCatalogo.tblqryCatalogoFECHA_ACT.Value;
  dmCatalogo.qryBceCtamesstatus_cieA.value := 'D';//Despues del cierre de Anio
  dmCatalogo.qryBceCtamesTIPO_CTA.Value    := dmCatalogo.tblqryCatalogotipo_cta.value;
  dmCatalogo.qryBceCtamesSIGNO_CTA.Value   := dmCatalogo.tblqryCatalogoSIGNO_CTA.AsString;
  dmCatalogo.qryBceCtamesNIVEL_CTA.Value   := dmCatalogo.tblqryCatalogoNIVEL_CTA.Value;
  dmCatalogo.qryBceCtamesFECHA_IN.Value    := Now;
  dmCatalogo.qryBceCtamesIN_POR.Value      := StrUserName;
  dmCatalogo.qryBceCtames.Post;
  dmCatalogo.qryBceCtames.ApplyUpdates;
end;

procedure TfrmCerrarPFiscal.FormCreate(Sender: TObject);
begin
  dmCatalogo.qryBceCtames.Close;
  dmCatalogo.tblqryCatalogo.close;
end;

end.
