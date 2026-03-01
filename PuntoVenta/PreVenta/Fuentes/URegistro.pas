unit URegistro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Mask, DBCtrls, IBCustomDataSet, IBTable, StdCtrls, Buttons,
  RXCtrls, RXDBCtrl, WinSkinData, RxDBComb, ExtCtrls, RxMemDS;

type
  TfrmTrgtr = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DataSource1: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Button1: TButton;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    tRegistro: TIBTable;
    tRegistroCLAVE: TIntegerField;
    tRegistroSERIAL: TIBStringField;
    tRegistroFECHA_REGISTRO: TDateTimeField;
    tRegistroCANTCABINAS: TSmallintField;
    tRegistroCANTCORRIDA: TIntegerField;
    BitBtn1: TBitBtn;
    DBStatusLabel1: TDBStatusLabel;
    SkinData1: TSkinData;
    tRegistroCODIGO_PC: TIntegerField;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    chkFinanciamiento: TCheckBox;
    tRegistroMOD_FINANC: TSmallintField;
    tRegistroCANT_LICENCIAS: TIntegerField;
    DBEdit6: TDBEdit;
    Label6: TLabel;
    tRegistroROOTRUTAIMGINVENTARIO: TIBStringField;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    rxdbboxmoneda: TRxDBComboBox;
    Label40: TLabel;
    tRegistroMONEDABASE: TIBStringField;
    tRegistroFORMATOFACT: TIBStringField;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    tRegistroINCLUYEITBISPVTA: TSmallintField;
    tRegistroDBHIST: TSmallintField;
    DBRadioGroup2: TDBRadioGroup;
    tRegistroCLAVE_MAESTRA: TIBStringField;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    Label9: TLabel;
    Label10: TLabel;
    tClaveMaster: TRxMemoryData;
    tClaveMasterClave: TStringField;
    tClaveMasterClaveConfirme: TStringField;
    DataSource2: TDataSource;
    DBRadioGroup3: TDBRadioGroup;
    tRegistroFASTFOOD: TSmallintField;
    tRegistroPORCPROPLEGAL: TFloatField;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    DBRadioGroup4: TDBRadioGroup;
    tRegistroTRANSP_ITBIS: TSmallintField;
    tRegistroSEC_NUM_REC_IGUAL: TSmallintField;
    tRegistroPORC_COMISION: TFloatField;
    DBRadioGroup5: TDBRadioGroup;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    DBRadioGroup6: TDBRadioGroup;
    tRegistroMOSTRARSUBTOTALSINITBIS: TSmallintField;
    DBRadioGroup7: TDBRadioGroup;
    tRegistroFORMATOFACTPREIMP: TSmallintField;
    DBEdit13: TDBEdit;
    Label13: TLabel;
    BitBtn2: TBitBtn;
    tRegistroPATHDOCREPOSITORY: TIBStringField;
    Label14: TLabel;
    DBEdit14: TDBEdit;
    tRegistroPORC_ATRASOCXC: TFloatField;
    Label15: TLabel;
    DBEdit15: TDBEdit;
    tRegistroGLBCARTAPRESENTA: TIBStringField;
    Label16: TLabel;
    DBEdit16: TDBEdit;
    tRegistroSERVERCONFIGID: TIBStringField;
    tRegistroEXEGARANTIAMOVIL: TIBStringField;
    Label17: TLabel;
    DBEdit17: TDBEdit;
    Button2: TButton;
    tRegistroPORC_UTILIDAD1: TFloatField;
    tRegistroPORC_UTILIDAD2: TFloatField;
    tRegistroPORC_UTILIDAD3: TFloatField;
    tRegistroPORC_UTILIDAD4: TFloatField;
    Panel1: TPanel;
    Label18: TLabel;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    Label19: TLabel;
    DBEdit20: TDBEdit;
    Label20: TLabel;
    DBEdit21: TDBEdit;
    Label21: TLabel;
    Label22: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure chkFinanciamientoClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBEdit9Exit(Sender: TObject);
    procedure DBEdit10Exit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DBRadioGroup3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  const
  SECTION = 'POSGOLDRESP';

  var
  frmTrgtr: TfrmTrgtr;

implementation

uses uglobal,registry, UDatModConectar, UFormSistemaIdesi;

{$R *.DFM}

procedure TfrmTrgtr.Button1Click(Sender: TObject);
Var
  FIniFile: TRegIniFile;
  Registro: TRegistry;  
begin
  if tregistro.state in [dsInsert,dsEdit] then
  begin
    if (varTipousuario = 0) then //adm
    begin
      tClaveMaster.Edit;
      if (Length(tClaveMasterClave.Value) > 0) then
      tRegistroCLAVE_MAESTRA.Value := Encriptar(tClaveMasterClave.Value,2005)
      else
      tRegistroCLAVE_MAESTRA.Value := '';
      tClaveMaster.Post;
    end;
    tRegistro.Post;
    tRegistro.ApplyUpdates;
    if not tregistro.Transaction.InTransaction then
    tregistro.Transaction.StartTransaction;
    try
      tregistro.Transaction.CommitRetaining;
    except
    tregistro.Transaction.RollbackRetaining;
  end;
  end;
  if Not tRegistroROOTRUTAIMGINVENTARIO.IsNull then 
  GlbRootImg :=tRegistroROOTRUTAIMGINVENTARIO.Value;
  BitBtn1Click(self);
  if (not GlbRegistrado) then
  begin
   Registro := TRegistry.Create;
   FIniFile := TRegIniFile.Create('IDESI S.A.');
   FIniFile.WriteString(SECTION, 'Version', 'k448');
   Messagedlg('Version registrada satisfactoriamente. Reiniciar aplicación.', mtInformation,[mbok],0);
  end;
   if not frmtrgtr.tRegistroMONEDABASE.IsNull then
  GlbMonedabase  := frmtrgtr.tRegistroMONEDABASE.AsInteger;
  if not frmtrgtr.tRegistroFORMATOFACT.IsNull then
  GLBFormatoFactura:=frmtrgtr.tRegistroFORMATOFACT.Value;
  GLBFORMATOFACTPREIMP := frmtrgtr.tRegistroFORMATOFACTPREIMP.Value;
  GLBRutaImpGarantia:=frmtrgtr.tRegistroEXEGARANTIAMOVIL.Value;
end;

procedure TfrmTrgtr.FormCreate(Sender: TObject);
var
  usr : string[7];
begin
  if (glbUsaescalaPrecio = 1) then
  Panel1.Visible:=true
  else
  Panel1.Visible:=false;
  if GLBECOM = 1 then
  begin
    Label16.Visible:= True;
    DBEdit16.Visible:=True;
  end;
  usr := Trim(StrUserName);
  if (usr <> 'DIVISON') and (VarUsuarioGlb > 0) then
  begin
    label4.Visible := False;
    dbedit4.Visible:= False;
    dbedit6.Visible:= False;
    if  (tRegistroMOD_FINANC.Value = 1) then
    chkFinanciamiento.Checked:=true
    else chkFinanciamiento.Checked:=False;
  end else
  begin
    label4.Visible := True;
    dbedit4.Visible:= True;
    dbedit6.Visible:= True;
    Button2.Visible:= True;
  end;
  
  if tRegistro.State = dsInactive then
  tRegistro.Open;
  if (tRegistroMOD_FINANC.Value = 1) then
  begin
    chkFinanciamiento.Checked:=True;
  end else
  chkFinanciamiento.Checked := False;
  if (varTipousuario = 0) then //adm
  begin
    tClaveMaster.Close;
    tClaveMaster.Open;
    tClaveMaster.Insert;
    tClaveMasterClave.Value:= Desencriptar(tRegistroCLAVE_MAESTRA.Value,2005);
    tClaveMasterClaveConfirme.Value:= Desencriptar(tRegistroCLAVE_MAESTRA.Value,2005);
    tClaveMaster.Post;
  end else
  begin
    dbedit9.Enabled:=false;
    dbedit10.Enabled:=false;
  end;
  BitBtn1Click(self);
end;

procedure TfrmTrgtr.BitBtn1Click(Sender: TObject);
begin
  tRegistro.close;
  tRegistro.Open;
  
end;

procedure TfrmTrgtr.chkFinanciamientoClick(Sender: TObject);
begin
  if  chkFinanciamiento.Checked then
  begin
    tRegistro.Edit;
    tRegistroMOD_FINANC.Value := 1;
  end else
  begin
    tRegistro.Edit;
    tRegistroMOD_FINANC.Value := 0;  
  end;
end;

procedure TfrmTrgtr.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if not frmtrgtr.tRegistroCLAVE_MAESTRA.IsNull then
  GlbClaveSupEncrypted := frmtrgtr.tRegistroCLAVE_MAESTRA.Value
  else
  GlbClaveSupEncrypted := '';

  if tRegistro.State in [dsEdit, dsInsert] then
  begin
    MessageDlg('Transaccion pendiente, verifique', mtInformation, [mbOK], 0);
    CanClose:=False;
  end else
  CanClose:=True;

  GLBFORMATOFACTPREIMP := frmtrgtr.tRegistroFORMATOFACTPREIMP.Value;
  GlbCartaPresenta:=frmtrgtr.tRegistroGlbCartaPresenta.Value;
  
  LeerDatosIni;
end;

procedure TfrmTrgtr.DBEdit9Exit(Sender: TObject);
begin
  if (tClaveMaster.State in [dsEdit, dsInsert]) then
  begin
    if (tClaveMasterClave.Value <> tClaveMasterClaveConfirme.Value) then
    begin
      MessageDlg('Favor confirme la clave.',mtInformation, [mbOK], 0);
      tClaveMasterClaveConfirme.Value:='';
      tClaveMasterClave.Value := '';
      DBEdit10.SetFocus;
    end;
  end;
end;

procedure TfrmTrgtr.DBEdit10Exit(Sender: TObject);
begin
  if (tClaveMaster.State in [dsEdit, dsInsert]) then
  tregistro.Edit;
end;

//***********************
//** Choose a directory **
//**   uses Messages   **
//***********************
  //General usage here:
  //  http://www.delphipages.com/forum/showthread.php?p=185734
  //Need a class to hold a procedure to be called by Dialog.OnShow:
  type TOpenDir = class(TObject)
  public
    Dialog: TOpenDialog;
    procedure HideControls(Sender: TObject);
  end;
  //This procedure hides de combo box of file types...
  procedure TOpenDir.HideControls(Sender: TObject);
  const
    //CDM_HIDECONTROL and CDM_SETCONTROLTEXT values from:
    //  doc.ddart.net/msdn/header/include/commdlg.h.html
    //  CMD_HIDECONTROL = CMD_FIRST + 5 = (WM_USER + 100) + 5;
    //Usage of CDM_HIDECONTROL and CDM_SETCONTROLTEXT here:
    //  msdn.microsoft.com/en-us/library/ms646853%28VS.85%29.aspx
    //  msdn.microsoft.com/en-us/library/ms646855%28VS.85%29.aspx
    CDM_HIDECONTROL =    WM_USER + 100 + 5;
    CDM_SETCONTROLTEXT = WM_USER + 100 + 4;
    //Component IDs from:
    //  msdn.microsoft.com/en-us/library/ms646960%28VS.85%29.aspx#_win32_Open_and_Save_As_Dialog_Box_Customization
    //Translation into exadecimal in dlgs.h:
    //  www.koders.com/c/fidCD2C946367FEE401460B8A91A3DB62F7D9CE3244.aspx
    //
    //File type filter...
    cmb1: integer  = $470; //Combo box with list of file type filters
    stc2: integer  = $441; //Label of the file type
    //File name const...
    cmb13: integer = $47c; //Combo box with name of the current file
    edt1: integer  = $480; //Edit with the name of the current file
    stc3: integer  = $442; //Label of the file name combo
  var H: THandle;
  begin
    H:= GetParent(Dialog.Handle);
    //Hide file types combo...
    SendMessage(H, CDM_HIDECONTROL, cmb1,  0);
    SendMessage(H, CDM_HIDECONTROL, stc2,  0);
    //Hide file name label, edit and combo...
    SendMessage(H, CDM_HIDECONTROL, cmb13, 0);
    SendMessage(H, CDM_HIDECONTROL, edt1,  0);
    SendMessage(H, CDM_HIDECONTROL, stc3,  0);
    //NOTE: How to change label text (the lentgh is not auto):
    //SendMessage(H, CDM_SETCONTROLTEXT, stc3, DWORD(pChar('Hello!')));
  end;
//Call it when you need the user to chose a folder for you...
function GimmeDir(var Dir: string): boolean;
var
  OpenDialog: TOpenDialog;
  OpenDir: TOpenDir;
begin
  //The standard dialog...
  OpenDialog:= TOpenDialog.Create(nil);
  //Objetc that holds the OnShow code to hide controls
  OpenDir:= TOpenDir.create;
  try
    //Conect both components...
    OpenDir.Dialog:= OpenDialog;
    OpenDialog.OnShow:= OpenDir.HideControls;
    //Configure it so only folders are shown (and file without extension!)...
    OpenDialog.FileName:= '*.';
    OpenDialog.Filter:=   '*.';
    OpenDialog.Title:=    'Seleccione un folder';
    //No need to check file existis!
    OpenDialog.Options:= OpenDialog.Options + [ofNoValidate];
    //Initial folder...
    OpenDialog.InitialDir:= Dir;
    //Ask user...
    if OpenDialog.Execute then begin
      Dir:= ExtractFilePath(OpenDialog.FileName);
      result:= true;
    end else begin
      result:= false;
    end;
  finally
    //Clean up...
    OpenDir.Free;
    OpenDialog.Free;
  end;
end;

procedure TfrmTrgtr.BitBtn2Click(Sender: TObject);
var
  xDir : string;
begin
  if GimmeDir(xDir) then
  begin
    if tRegistro.State = dsBrowse then
    tRegistro.Edit;
    tRegistroPATHDOCREPOSITORY.Value:= xDir;
    Button1Click(Self);
  end;
end;

procedure TfrmTrgtr.Button2Click(Sender: TObject);
begin
  //if (GlbFarmacia = 1) then
  //begin
    try
      frmSistemaIdesi:=TfrmSistemaIdesi.Create(nil);
      try
        frmSistemaIdesi.showmodal;
      finally
      frmSistemaIdesi.free;
      frmSistemaIdesi:=nil;
      end;
    except
    end;
  //end;
end;

procedure TfrmTrgtr.DBRadioGroup3Click(Sender: TObject);
begin
  if tRegistroFASTFOOD.Value =  2 then
  begin
    tRegistroTRANSP_ITBIS.Value:=0;
    tRegistroMOSTRARSUBTOTALSINITBIS.Value:=0;
    tRegistroINCLUYEITBISPVTA.Value:=0;
  end;
end;

end.
