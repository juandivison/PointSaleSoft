unit UActivapermisos;

interface
uses Windows, DbCtrls, StdCtrls, Buttons, Messages, SysUtils, Forms, Variants, Classes, Menus, Graphics, Controls;

procedure ActivaPermiso(var xform: TForm; proceso:integer; iduser:Integer; isperson:integer);

implementation
uses UDatModUsuarios, uglobal;

procedure ActivaPermiso(var xform: TForm; proceso:integer; iduser:Integer; isperson:integer);
var
  X, y, z:integer;
  flag: boolean;
  temp : string;
begin
  dmusuarios.stpBuscarPermisos.Close;
  //dmusuarios.stpBuscarPermisos.Params[0].Value:=  //Out
  //dmusuarios.stpBuscarPermisos.Params[1].Value:=  //Out
  //dmusuarios.stpBuscarPermisos.Params[2].Value:=  //Out
  dmusuarios.stpBuscarPermisos.Params[0].Value:=  isperson;//Persona
  dmusuarios.stpBuscarPermisos.Params[1].Value:=  iduser;//In
  dmusuarios.stpBuscarPermisos.Open;

  dmusuarios.qryProcesos.close;
  dmusuarios.qryProcesos.Params[0].value:= isperson;
  dmusuarios.qryProcesos.Params[1].value:= iduser;
  dmusuarios.qryProcesos.Open;
  dmusuarios.qryProcesos.first;  

  For x:=0 To xform.ControlCount - 1 Do
  begin
    if xform.controls[x].Tag > 0 then
    begin
      //WriteToLogTag(IntToStr(xform.controls[x].Tag)+','+xform.controls[x].Name);
    if dmusuarios.stpBuscarPermisos.Locate('procesoid;tareaid', Vararrayof([dmusuarios.qryProcesosPROCESOID.Value,
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

  if (xform.Components[x] is TDbEdit) then
    begin
      if TDbEdit(xform.Components[x]).Tag > 0 then
      begin
        if dmusuarios.stpBuscarPermisos.Locate('procesoid;tareaid', Vararrayof([dmusuarios.qryProcesosPROCESOID.Value,
        TDbEdit(xform.Components[x]).Tag]),[]) then
        begin
          if dmusuarios.stpBuscarPermisos.FieldByName('status').Value = 1 then
          TDbEdit(xform.Components[x]).Enabled:=True
          else
          begin
            TDbEdit(xform.Components[x]).Enabled:=False;
            if dmusuarios.stpBuscarPermisos.FieldByName('visible').Value = 0 then
            TDbEdit(xform.Components[x]).Visible:=False;
          end;
          end else
          begin
            TDbEdit(xform.Components[x]).Enabled:=False;
            if dmusuarios.stpBuscarPermisos.FieldByName('visible').Value = 0 then
            TDbEdit(xform.Components[x]).Visible:=False;
          end;
        end;
      end;

    if (xform.Components[x] is TBitBtn) then
    begin
      if TBitBtn(xform.Components[x]).Tag > 0 then
      begin
        if dmusuarios.stpBuscarPermisos.Locate('procesoid;tareaid', Vararrayof([dmusuarios.qryProcesosPROCESOID.Value,
        TBitBtn(xform.Components[x]).Tag]),[]) then
        begin
          if dmusuarios.stpBuscarPermisos.FieldByName('status').Value = 1 then
          TBitBtn(xform.Components[x]).Enabled:=True
          else
          begin
            TBitBtn(xform.Components[x]).Enabled:=False;
            if dmusuarios.stpBuscarPermisos.FieldByName('visible').Value = 0 then
            TBitBtn(xform.Components[x]).Visible:=False;
          end;
          end else
          begin
            TBitBtn(xform.Components[x]).Enabled:=False;
            if dmusuarios.stpBuscarPermisos.FieldByName('visible').Value = 0 then
            TBitBtn(xform.Components[x]).Visible:=False;
          end;
        end;
      end;
    if (xform.Components[x] is TBUTTON) then
    begin
      if TBUTTON(xform.Components[x]).Tag > 0 then
      begin
        if dmusuarios.stpBuscarPermisos.Locate('procesoid;tareaid', Vararrayof([dmusuarios.qryProcesosPROCESOID.Value,
        TBUTTON(xform.Components[x]).Tag]),[]) then
        begin
          if dmusuarios.stpBuscarPermisos.FieldByName('status').Value = 1 then
          TBUTTON(xform.Components[x]).Enabled:=True
          else
          begin
            TBUTTON(xform.Components[x]).Enabled:=False;
            if dmusuarios.stpBuscarPermisos.FieldByName('visible').Value = 0 then
            TBUTTON(xform.Components[x]).Visible:=False;
          end;
          end else
          begin
            TBUTTON(xform.Components[x]).Enabled:=False;
            if dmusuarios.stpBuscarPermisos.FieldByName('visible').Value = 0 then
            TBUTTON(xform.Components[x]).Visible:=False;
          end;
        end;
      end;

    if (xform.Components[x] is TDBRadioGroup) then
    begin
      if (TDBRadioGroup(xform.Components[x]).Tag > 0) then
      begin
        if dmusuarios.stpBuscarPermisos.Locate('procesoid;tareaid', Vararrayof([dmusuarios.qryProcesosPROCESOID.Value,
            TDBRadioGroup(xform.Components[x]).Tag]),[]) then
        begin
          if dmusuarios.stpBuscarPermisos.FieldByName('status').Value = 1 then
          TDBRadioGroup(xform.Components[x]).Enabled:=True
          else
          begin
            TDBRadioGroup(xform.Components[x]).Enabled:=False;
            if dmusuarios.stpBuscarPermisos.FieldByName('visible').Value = 0 then
            TDBRadioGroup(xform.Components[x]).Visible:=False;
          end;
        end else
            begin
              TDBRadioGroup(xform.Components[x]).Enabled:=False;
              if dmusuarios.stpBuscarPermisos.FieldByName('visible').Value = 0 then
              TDBRadioGroup(xform.Components[x]).Visible:=False;
            end;
      end;
    end;      
    if (xform.Components[x] is TPopupMenu) then
    begin
        for y:=0 to TPopupMenu(xform.Components[x]).Items.Count -1 do
        begin
          if TPopupMenu(xform.Components[x]).Items[y].Tag > 0 then
          begin
            if TPopupMenu(xform.Components[x]).Items[y].Tag = 3127 then
            begin
              TPopupMenu(xform.Components[x]).Items[y].Tag:=3127;
            end;
            if dmusuarios.stpBuscarPermisos.Locate('procesoid;tareaid', Vararrayof([dmusuarios.qryProcesosPROCESOID.Value,
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
            if TMainMenu(xform.Components[x]).Items[y].Items[z].Tag = 509 then
            begin
               temp:='temporal';
            end;
            if dmusuarios.stpBuscarPermisos.Locate('procesoid;tareaid', Vararrayof([dmusuarios.qryProcesosPROCESOID.Value,
            TMainMenu(xform.Components[x]).Items[y].Items[z].Tag]),[]) then
            begin
              if dmusuarios.stpBuscarPermisos.FieldByName('status').Value = 1 then
              TMainMenu(xform.Components[x]).Items[y].Items[z].Enabled:=True
              else
              begin
                TMainMenu(xform.Components[x]).Items[y].Items[z].Enabled:=False;
                if dmusuarios.stpBuscarPermisos.FieldByName('visible').Value = 0 then
                TMainMenu(xform.Components[x]).Items[y].Items[z].Visible:=False;
              end;
            end else
            begin
              TMainMenu(xform.Components[x]).Items[y].Items[z].Enabled:=False;
              if dmusuarios.stpBuscarPermisos.FieldByName('visible').Value = 0 then
              TMainMenu(xform.Components[x]).Items[y].Items[z].Visible:=False;
            end;
          end;
        end;
      end;
    end;
  end;
end;

end.
