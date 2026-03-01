unit UActivapermisos;

interface
uses Windows, Messages, SysUtils, Forms, Variants, Classes, Menus, Graphics, Controls;

procedure ActivaPermiso(var xform: TForm; proceso:integer; iduser:Integer; isperson:integer);

implementation
uses UDatModUsuarios;

procedure ActivaPermiso(var xform: TForm; proceso:integer; iduser:Integer; isperson:integer);
var
  X, y, z:integer;
  flag: boolean;
begin
  dmusuarios.stpBuscarPermisos.Close;
  //dmusuarios.stpBuscarPermisos.Params[0].Value:=  //Out
  //dmusuarios.stpBuscarPermisos.Params[1].Value:=  //Out
  //dmusuarios.stpBuscarPermisos.Params[2].Value:=  //Out
  dmusuarios.stpBuscarPermisos.Params[0].Value:=  isperson;//Persona
  dmusuarios.stpBuscarPermisos.Params[1].Value:=  iduser;//In
  dmusuarios.stpBuscarPermisos.Open; 

  For x:=0 To xform.ControlCount - 1 Do
  begin
    if xform.controls[x].Tag > 0 then
    begin
    if dmusuarios.stpBuscarPermisos.Locate('procesoid;tareaid', Vararrayof([proceso,
    xform.controls[x].Tag]),[]) then
    begin
      if dmusuarios.stpBuscarPermisos.FieldByName('status').Value = 1 then
      xform.controls[x].Enabled:=True
      else
      begin
        xform.controls[x].Enabled:=False;
        if dmusuarios.stpBuscarPermisosVISIBLE.Value = 0 then
        xform.controls[x].Visible:=false;
      end
    end else
    begin
      xform.controls[x].Enabled:=False;
      if dmusuarios.stpBuscarPermisosVISIBLE.Value = 0 then
      xform.controls[x].Visible:=false;
    end;
    end;
  end;

  for x:=0 to xform.ComponentCount - 1 do
  begin
    if (xform.Components[x] is TPopupMenu) then
    begin
        for y:=0 to TPopupMenu(xform.Components[x]).Items.Count -1 do
        begin
          if TPopupMenu(xform.Components[x]).Items[y].Tag > 0 then
          begin
            if dmusuarios.stpBuscarPermisos.Locate('procesoid;tareaid', Vararrayof([proceso,
            TPopupMenu(xform.Components[x]).Items[y].Tag]),[]) then
            begin
              if dmusuarios.stpBuscarPermisos.FieldByName('status').Value = 1 then
              TPopupMenu(xform.Components[x]).Items[y].Enabled:=True
              else
              begin
                TPopupMenu(xform.Components[x]).Items[y].Enabled:=False;
                if dmusuarios.stpBuscarPermisos.FieldByName('visible').Value = 0 then
                TPopupMenu(xform.Components[x]).Items[y].Visible:=False;
              end;
            end else
            begin
              TPopupMenu(xform.Components[x]).Items[y].Enabled:=False;
              if dmusuarios.stpBuscarPermisos.FieldByName('visible').Value = 0 then
              TPopupMenu(xform.Components[x]).Items[y].Visible:=False;
            end;
          end;
        end;
    end;

    if (xform.Components[x] is TMainMenu) then
    begin
      for y:=0 to TMainMenu(xform.Components[x]).Items.Count -1 do
      begin
        for z:=0 to TMainMenu(xform.Components[x]).Items[y].Count - 1 do
        begin
          if TMainMenu(xform.Components[x]).Items[y].Items[z].Tag > 0 then
          begin
            if dmusuarios.stpBuscarPermisos.Locate('procesoid;tareaid', Vararrayof([proceso,
            TMainMenu(xform.Components[x]).Items[y].Items[z].Tag]),[]) then
            begin
              if dmusuarios.stpBuscarPermisos.FieldByName('status').Value = 1 then
              TMainMenu(xform.Components[x]).Items[y].Items[z].Enabled:=True
              else
              TMainMenu(xform.Components[x]).Items[y].Items[z].Enabled:=False;
            end else
            TMainMenu(xform.Components[x]).Items[y].Items[z].Enabled:=False;
          end;
        end;
      end;
    end;
  end;
end;

end.
