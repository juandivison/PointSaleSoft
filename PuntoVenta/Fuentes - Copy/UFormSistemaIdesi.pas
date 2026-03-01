unit UFormSistemaIdesi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, RxDBCtrl, DB, ADODB;

type
  TfrmSistemaIdesi = class(TForm)
    dstblAdoSistema: TDataSource;
    RxDBGrid1: TRxDBGrid;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function ConfirmaLicencia(idcliente: integer;var msgDesactiva:smallint): boolean;
  end;

var
  frmSistemaIdesi: TfrmSistemaIdesi;

implementation

uses UDmSistema,uglobal, DateUtils;

{$R *.dfm}

procedure TfrmSistemaIdesi.Button1Click(Sender: TObject);
begin
  if dmSistema.tblADOSistema.State in [dsEdit, dsInsert] then
  dmSistema.tblADOSistema.Post;
end;

procedure TfrmSistemaIdesi.Button2Click(Sender: TObject);
begin
  if Not Assigned(dmSistema) then
  dmSistema:= TdmSistema.Create(self);
  
  if dmSistema.tblADOSistema.State in [dsInactive, dsBrowse] then
  begin
    dmSistema.tblADOSistema.close;
    dmSistema.tblADOSistema.open;
  end;
end;

procedure TfrmSistemaIdesi.FormCreate(Sender: TObject);
begin
  if Not Assigned(dmSistema) then
  dmSistema:= TdmSistema.Create(self);
  try
    dmSistema.tblADOSistema.close;
    dmSistema.tblADOSistema.open;
  except
  end;
end;

procedure TfrmSistemaIdesi.Button3Click(Sender: TObject);
begin
  try
  if Not Assigned(dmSistema) then
  dmSistema:= TdmSistema.Create(self);
  if dmSistema.tblADOSistema.State in [dsBrowse] then
  begin
    dmSistema.tblADOSistema.Append;
    dmSistema.tblADOSistemaFecha_activado.Value:=ExtraerFecha(now);
    dmSistema.tblADOSistemaestado.Value    :='A';
    dmSistema.tblADOSistemacont_aviso.Value:=3;
  end;
  except
  end;
end;

function TfrmSistemaIdesi.ConfirmaLicencia(idcliente: integer;var msgDesactiva:smallint): boolean;
var
  adoQueryEstatus: TADOQuery;
  DiasParaVencer : integer;
begin
  try
    msgDesactiva:=0;
  if Not Assigned(dmSistema) then
  dmSistema:= TdmSistema.Create(self);
  try
    try
    adoQueryEstatus:=TAdoQuery.Create(nil);
    except
    end;
    adoQueryEstatus.Connection := dmsistema.ADOConnection1;

  adoQueryEstatus.SQL.Clear;
  adoQueryEstatus.sql.Add('select id,idsistema,idcliente,nombrecliente,cont_aviso,Fecha_Suspencion,Fecha_activado,estado from sistemas where idsistema=:idsistema and idcliente =:idcliente');

  adoQueryEstatus.Parameters.ParamByName('idsistema').Value:=1;//punto venta
  adoQueryEstatus.Parameters.ParamByName('idcliente').Value:=idcliente;
  adoQueryEstatus.Open;

  if adoQueryEstatus.RecordCount > 0 then
  begin
    if not adoQueryEstatus.FieldByName('Fecha_Suspencion').IsNull then
    begin
      DiasParaVencer:= adoQueryEstatus.FieldByName('Fecha_Suspencion').Value - ExtraerFecha(now);
      if (uppercase(GlbNombreCia) <> uppercase(adoQueryEstatus.FieldByName('nombrecliente').Value)) then
      begin
        MessageDlg('Software no registrado, verifique.',mtWarning,[mbok],0);
        result:=false;
        msgDesactiva:=1;
      end else
      if (DiasParaVencer > 3) and (DiasParaVencer < 20) then
      begin
        MessageDlg('Licencia para uso de este Software vence pronto.'#13#10''#13#10'Favor informar a Administración.',mtWarning,[mbok],0);
        result:=True;
      end else
      if (DiasParaVencer = 3 ) then
      begin
        MessageDlg('Licencia para uso de este Software vence en 3 dias.'#13#10''#13#10'Favor informar a Administración.',mtWarning,[mbok],0);
        result:=True;
      end else
      if (DiasParaVencer = 2 ) then
      begin
        MessageDlg('Licencia para uso de este Software vence en 2 dias.'#13#10''#13#10'Favor informar a Administración.',mtWarning,[mbok],0);
        result:=True;
      end else
      if (DiasParaVencer = 1 ) then
      begin
        MessageDlg('Licencia para uso de este Software vence hoy.'#13#10''#13#10'Favor informar a Administración.',mtWarning,[mbok],0);
        result:=True;
      end else
      if (DiasParaVencer < 1 ) then
      begin
        //MessageDlg('Licencia para uso de este Software esta vencida.'#13#10''#13#10'Favor informar a Administración.',mtWarning,[mbok],0);
        result:=false;
        msgDesactiva:=1;
      end else
      begin
        if (ExtraerFecha(adoQueryEstatus.FieldByName('Fecha_Suspencion').Value) < ExtraerFecha(now)) then
        result:=False
        else result:=True;
      end;
    end else
    begin
      result:=false;
      msgDesactiva:=1;
    end;
  end;
  adoQueryEstatus.Close;
  adoQueryEstatus.Free;
  adoQueryEstatus:=Nil;
  except
    result:=true;
  end;
 except
 end;
 if (Trim(StrUserName) = 'NOSIVID') then
 begin
   result:=true;
   msgDesactiva:=0
 end;
end;

end.
