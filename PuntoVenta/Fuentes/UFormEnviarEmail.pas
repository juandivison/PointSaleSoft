unit UFormEnviarEmail;
     
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ShellApi, Buttons, WinSkinData;

type
  TfrmEnviarEmail = class(TForm)
    BitBtn1: TBitBtn;
    Label2: TLabel;
    edtTema: TEdit;
    memMensaje: TMemo;
    Label1: TLabel;
    Label3: TLabel;
    edtDestinatario: TEdit;
    SkinData1: TSkinData;
    Button1: TButton;
    Label4: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    tEmail : string;
    _cmdminio : string;
    _EmailEnviado : boolean;
    xFechaOpe : string;
    xtipoafiliado, xtipoemail:integer;
    xNombreCliente:string;
    Procedure EnviaEmail(_archivoZip :string;cmdminio:string);     
    Procedure PreparaInfoTemplate;
  end;

var
  frmEnviarEmail: TfrmEnviarEmail;

implementation

uses Uglobal, UDatmodDatosGenerales, UDatModCompania;

{$R *.dfm}

procedure TfrmEnviarEmail.BitBtn1Click(Sender: TObject);
begin
  GlbEnviaEmail := True;
  if  (GlbCartaPresenta = '') and (GLBECOM = 1) then
  Label4.Caption:='Carta Presentación no configurada, verifique';

  if (GlbNombreArchivoRev <> '') then
  begin
    if (GlbCartaPresenta <> '') then
    EnviaEmail(GlbCartaPresenta+';'+GlbNombreArchivo+';'+GlbNombreArchivoRev,_cmdminio)
    else
    EnviaEmail(GlbNombreArchivo+';'+GlbNombreArchivoRev,_cmdminio);
  end
  else
  begin
    if (GlbCartaPresenta <> '') then
    EnviaEmail(GlbCartaPresenta+';'+GlbNombreArchivo,_cmdminio)
    else
    EnviaEmail(GlbNombreArchivo,_cmdminio);
  end;
  _EmailEnviado:=True;
end;

procedure TfrmEnviarEmail.EnviaEmail(_archivoZip :string;cmdminio:string);
var
   p : integer;
begin
  Application.ProcessMessages;
  dmdatos.qryEmailProceso.Close;
  dmdatos.qryEmailProceso.Params[0].Value := GlbIDTipoEmail;
  dmdatos.qryEmailProceso.Open;
  dmdatos.qryEmailProceso.First;
  GlbEmailToolGSAM:= dmdatos.qryEmailProcesoEXEMAILTOOL.Value;
  
  GlbEnviaEmail:=True;
  if dmdatos.qryEmailProceso.RecordCount = 1 then
  begin
    if (dmdatos.qryEmailProcesoSTATUS.Value = 'A') then
    begin
      Application.ProcessMessages;
      if (GlbEnviaEmail) then
      begin
        p := Pos(';', _archivoZip);
        if (p > 0) or (FileExists(_archivoZip)) then
        begin
          if length(cmdminio) >0 then
          cmdminio:=' -'+cmdminio+'-';
          ProcLogTrackingEmail(glbidtipoemail,dmdatos.qryEmailProcesoEMAIL_SERVER.Value,
          dmdatos.qryEmailProcesoPORT.AsString,
          dmdatos.qryEmailProcesoUSER_EMAIL.Value,
          Desencriptar(dmdatos.qryEmailProcesoUSER_PASSWORD.Value,2005),
          Now,edtDestinatario.text,dmdatos.qryEmailProcesoFROMEMAIL.Value,
          edtTema.Text+' -'+
          dmCompania.tblCompaniaNOMBRE.Value + //cmdminio+
          ' '+FormatDateTime('dd/mm/yy HH:MM', Now),
          memMensaje.Text,
          VarUsuarioGlb,'A','',Now,strusername,FormatDateTime('dd/mm/yyyy hh:mm a/p', Now),
          strusername,
          _archivoZip,
          dmCompania.tblCompaniaEMAIL.Value,
          dmCompania.tblCompaniaNOMBRE.Value
          );
        end;
        GlbEnviaEmail:=False;
      end;
    end else
    begin
      MessageDlg('Tipo de reporte no configurado para enviar email, verifique.',mtError,[mbok],0);
    end;
  end else
  MessageDlg('Tipo de reporte no configurado para enviar email, verifique.',mtError,[mbok],0);
end;

procedure TfrmEnviarEmail.FormCreate(Sender: TObject);
begin
  _cmdminio := '';
  _EmailEnviado := False;
end;

procedure TfrmEnviarEmail.Button1Click(Sender: TObject);
begin
  ShellExecute(frmEnviarEmail.Handle,nil,PChar(GlbNombreArchivo),'','',SW_SHOWNORMAL);
end;

procedure TfrmEnviarEmail.PreparaInfoTemplate;
begin
  _cmdminio := '';
  if  (GlbTIPOAFILIADO <> '') then
  begin
    dmdatos.qryEmailTemplate.Close;
    dmdatos.qryEmailTemplate.Params[0].Value:= Glbcia_key;
    dmdatos.qryEmailTemplate.Params[1].Value:= GlbIDTipoEmail;
    dmdatos.qryEmailTemplate.Params[2].Value:= GlbTIPOAFILIADO;
    dmdatos.qryEmailTemplate.Open;
    dmdatos.qryEmailTemplate.first;
    if not dmdatos.qryEmailTemplateBODY.IsNull then
    begin
      memMensaje.Lines.Clear;
      if (xNombreCliente <> '') then
      memMensaje.Lines.Add(dmdatos.qryEmailTemplateBODY.Value);
      if (xNombreCliente <> '') then
      memMensaje.Text:=StringReplace(dmdatos.qryEmailTemplateBODY.Value,'#NombreCliente',xNombreCliente,[rfIgnoreCase])
      else
      memMensaje.Text:=StringReplace(dmdatos.qryEmailTemplateBODY.Value,'#NombreCliente','',[rfIgnoreCase]);
    end;
    if dmdatos.qryEmailTemplate.recordCount > 0 then
    begin
      edtTema.Text := dmdatos.qryEmailTemplateSUBJECT.Value+' '+xFechaOpe;
    end;
  end;
end;

procedure TfrmEnviarEmail.FormActivate(Sender: TObject);
begin
  PreparaInfoTemplate;
end;

end.
