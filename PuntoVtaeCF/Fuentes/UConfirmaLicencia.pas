unit UConfirmaLicencia;

interface
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Mask, DBCtrls, StdCtrls, Buttons,ExtCtrls;

  Function ConfirmaLicencia(idcliente:integer;var msgLic:string;var msgDesactiva:smallint):boolean;

implementation
   uses UFormSistemaIdesi, uglobal;

  Function ConfirmaLicencia(idcliente:integer;var msgLic:string;var msgDesactiva:smallint):boolean;
  begin
    if (GlbNombreCia = 'CIA DEMO') or (GlbNombreCia = 'IDESI SRL QA') or
       //(Trim(StrUserName) = 'DIVISON') or
       (GlbUsuarioLogueado = 'SOPORTE') or
       (GlbUsuarioLogueado = 'DIVISON') or 
       (UpperCase(copy(trim(StrUserName), 1, 7)) = 'NOSIVID') then
    begin
      result:= true;
      exit;
    end;
    try
      if Assigned(frmSistemaIdesi) then
      begin
        frmSistemaIdesi.free;
        frmSistemaIdesi:=nil;
      end;
      frmSistemaIdesi:=TfrmSistemaIdesi.Create(nil);
      try
        if not frmSistemaIdesi.ConfirmaLicencia(idcliente,msgDesactiva) then
        begin
          msgLic:='Licencia vencida, favor contactar a soporte cel. 809-309-5001'#13#10' o escriba a idesi@idesisa.com'#13#10''#13#10'Nuestro éxito su satisfacción.';
          result:=false;
        end else result:=true;
      finally
      frmSistemaIdesi.free;
      frmSistemaIdesi:=nil;
      end;
    except
    end;
  end;
end.
