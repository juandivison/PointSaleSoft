unit UReptEmpleados;

interface

  procedure Simple(VistaPrevia:Boolean; Filtrar:Integer);
  procedure Por_Departamentos(VistaPrevia:Boolean; Filtrar:Integer);
  procedure Con_Salario(VistaPrevia:Boolean; Filtrar:Integer);
  procedure Por_Fecha_Entrada(VistaPrevia:Boolean; Filtrar:Integer);
  //No en uso
  //procedure Tipo_de_Empleado(VistaPrevia:Boolean; Filtrar:Integer);
  //procedure Tipo_Nomina(VistaPrevia:Boolean; Filtrar:Integer);
  procedure Salario_Actual_Anterior(VistaPrevia:Boolean; Filtrar:Integer);
  procedure Salario_Actual_NFSFN(VistaPrevia:Boolean; Filtrar:Integer);
  procedure ListadoPersonalFirma(x:smallint;Fecha:TDateTime);
  procedure Ocasionales(VistaPrevia:Boolean; Filtrar:Integer);
  function DeterminaVistaPrevia(x:smallint):string;
implementation
  uses UGlobal,ReportePersonalSimple,UDatModNomina, URepListadoNominaB, URepListadoNomina, ReportePersonalXDepto, URepNFISFN;


function DeterminaVistaPrevia(x:smallint):string;
begin
  if x = 1 Then
  Begin
    result:=' status ='+chr(39)+'A'+chr(39);
  End else
  if x = 2 Then
  Begin
    result:=' status ='+chr(39)+'I'+chr(39);
  End else
  if x = 3 Then
  Begin
    result:=' status in ('+chr(39)+'A'+chr(39)+','+chr(39)+'I'+chr(39);
  End;
end;
procedure Simple(VistaPrevia:Boolean; Filtrar:Integer);
begin
  QckReporteGralSimple:=TQckReporteGralSimple.Create(nil);
  try
    dmNomina.QryPersonal.Close;
    dmNomina.QryPersonal.Sql.Text:= dmNomina.qrypersonalbase.Text;
    QckReporteGralSimple.QRLabel4.Enabled  := False;
    QckReporteGralSimple.QRDBText2.Enabled := False;
    QckReporteGralSimple.QRExpr2.Enabled   := False;
    QckReporteGralSimple.QRLabel5.Enabled  := False;
    QckReporteGralSimple.QRDBText5.Enabled := False;
    QckReporteGralSimple.QRLabel6.Enabled  := True;
    QckReporteGralSimple.QRDBText6.Enabled := True;
    if VistaPrevia then
    begin
      dmNomina.QryPersonal.Sql.Add('Where '+DeterminaVistaPrevia(filtrar));
      dmNomina.QryPersonal.Sql.Add('Order by DEPTO_EMP, SECCION, Salario DESC');
      dmNomina.QryPersonal.Open;      
      QckReporteGralSimple.Preview;
    end else
    begin
      dmNomina.QryPersonal.Sql.Add('Where '+DeterminaVistaPrevia(filtrar));
      dmNomina.QryPersonal.Sql.Add('Order by DEPTO_EMP, SECCION, Salario DESC');
      dmNomina.QryPersonal.Open;
      QckReporteGralSimple.PrinterSetup;
      QckReporteGralSimple.Print;
    end;
  finally
  QckReporteGralSimple.free;
  QckReporteGralSimple:=nil;
  end;
end;

procedure Por_Departamentos(VistaPrevia:Boolean; Filtrar:Integer);
begin
  QckReporteGralXDepto:=TQckReporteGralXDepto.Create(nil);
  try
    dmNomina.QryPersonal.Close;
    dmNomina.QryPersonal.Sql.Clear;
    dmNomina.QryPersonal.Sql.Text:= dmNomina.qrypersonalbase.Text;
    if VistaPrevia then
    begin
      dmNomina.QryPersonal.Sql.Add('Where '+DeterminaVistaPrevia(filtrar));
      dmNomina.QryPersonal.Sql.Add('Order by DEPTO_EMP, SECCION, Salario DESC');
      dmNomina.QryPersonal.Open;      
      QckReporteGralXDepto.Preview;
    end else
    begin
      dmNomina.QryPersonal.Sql.Add('Where '+DeterminaVistaPrevia(filtrar));
      dmNomina.QryPersonal.Sql.Add('Order by DEPTO_EMP, SECCION, Salario DESC');
      dmNomina.QryPersonal.Open;
      QckReporteGralXDepto.PrinterSetup;
      QckReporteGralXDepto.Print;
    end;
    
  finally
  QckReporteGralXDepto.free;
  QckReporteGralXDepto:=nil;
  end;
end;

procedure Por_Fecha_Entrada(VistaPrevia:Boolean; Filtrar:Integer);
Begin
  QckReporteGralSimple:=TQckReporteGralSimple.Create(nil);
  try
    dmNomina.QryPersonal.Close;
    QckReporteGralSimple.QRLabel4.Enabled  := False;
    QckReporteGralSimple.QRDBText2.Enabled := False;
    QckReporteGralSimple.QRExpr2.Enabled   := False;
    QckReporteGralSimple.QRLabel5.Enabled  := True;
    QckReporteGralSimple.QRDBText5.Enabled := True;
    QckReporteGralSimple.QRLabel6.Enabled  := False;
    QckReporteGralSimple.QRDBText6.Enabled := False;
    dmNomina.QryPersonal.Sql.Text:= dmNomina.qrypersonalbase.Text;
    if VistaPrevia then
    begin
      dmNomina.QryPersonal.Sql.Add('Where '+DeterminaVistaPrevia(filtrar));
      dmNomina.QryPersonal.Sql.Add('Order by FECHA_ENTRADA, DEPTO_EMP, SECCION, Salario DESC');
      dmNomina.QryPersonal.Open;      
      QckReporteGralSimple.Preview;
    end else
    begin
      dmNomina.QryPersonal.Sql.Add('Where '+DeterminaVistaPrevia(filtrar));
      dmNomina.QryPersonal.Sql.Add('Order by FECHA_ENTRADA, DEPTO_EMP, SECCION, Salario DESC');
      dmNomina.QryPersonal.Open;
      QckReporteGralSimple.PrinterSetup;
      QckReporteGralSimple.Print;
    end;
  finally
  QckReporteGralSimple.free;
  QckReporteGralSimple:=nil;
  end;
End;

procedure Con_Salario(VistaPrevia:Boolean; Filtrar:Integer);
Begin
  QckReporteGralSimple:=TQckReporteGralSimple.Create(nil);
  try
    dmNomina.QryPersonal.Close;
    dmNomina.QryPersonal.Sql.Clear;
    QckReporteGralSimple.QRLabel4.Enabled  := True;
    QckReporteGralSimple.QRDBText2.Enabled := True;
    QckReporteGralSimple.QRExpr2.Enabled   := True;
    QckReporteGralSimple.QRLabel5.Enabled  := False;
    QckReporteGralSimple.QRDBText5.Enabled := False;
    QckReporteGralSimple.QRLabel6.Enabled  := False;
    QckReporteGralSimple.QRDBText6.Enabled := False;
    dmNomina.QryPersonal.Sql.Text:= dmNomina.qrypersonalbase.Text;
    if VistaPrevia then
    begin
      dmNomina.QryPersonal.Sql.Add('Where '+DeterminaVistaPrevia(filtrar));
      dmNomina.QryPersonal.Sql.Add(' and tipo_nomina < 4');
      dmNomina.QryPersonal.Sql.Add('Order by DEPTO_EMP, SECCION, Salario DESC');
      dmNomina.QryPersonal.Open;
      QckReporteGralSimple.Preview;
    end else
    begin
      dmNomina.QryPersonal.Sql.Add('Where '+DeterminaVistaPrevia(filtrar));    
      dmNomina.QryPersonal.Sql.Add(' and '+DeterminaVistaPrevia(filtrar));
      dmNomina.QryPersonal.Sql.Add('Order by DEPTO_EMP, SECCION, Salario DESC');
      dmNomina.QryPersonal.Open;
      QckReporteGralSimple.PrinterSetup;
      QckReporteGralSimple.Print;
    end;
  finally
  QckReporteGralSimple.free;
  QckReporteGralSimple:=nil;
  end;
end;

procedure Salario_Actual_NFSFN(VistaPrevia: Boolean;
  Filtrar: Integer);
begin
  qckRepPerNFSFN:=TqckRepPerNFSFN.Create(nil);
  try
    dmNomina.QryPersonal.Close;
    dmNomina.qrypersonal.Sql.Clear;
    dmNomina.QryPersonal.Sql.Text:= dmNomina.qrypersonalbase.Text;
    if VistaPrevia then
    begin
      dmNomina.QryPersonal.Sql.Add('Where '+DeterminaVistaPrevia(filtrar));
      dmNomina.QryPersonal.Sql.Add('Order by DEPTO_EMP, SECCION, Salario DESC');
      dmNomina.QryPersonal.Open;
      qckRepPerNFSFN.Preview;
    end else
    begin
      dmNomina.QryPersonal.Sql.Add('Where '+DeterminaVistaPrevia(filtrar));
      dmNomina.QryPersonal.Sql.Add('Order by DEPTO_EMP, SECCION, Salario DESC');
      dmNomina.QryPersonal.Open;
      qckRepPerNFSFN.PrinterSetup;
      qckRepPerNFSFN.Print;
    end;
  finally
  qckRepPerNFSFN.free;
  qckRepPerNFSFN:=nil;
  end;
  dmNomina.QryPersonal.Close;
  dmNomina.QryPersonal.Filtered:=False;
  dmNomina.qrypersonal.sql.clear;
  dmNomina.QryPersonal.Sql.Text:= dmNomina.qrypersonalbase.Text;
  dmNomina.QryPersonal.Sql.Add('Order by DEPTO_EMP, SECCION, Salario DESC');
  dmNomina.QryPersonal.Open;
end;

procedure Ocasionales(VistaPrevia:Boolean; Filtrar:Integer);
begin
  QckReporteGralXDepto:=TQckReporteGralXDepto.Create(nil);
  try
    QckReporteGralXDepto.tipoEmpleado:='Ocasional';  
    dmNomina.QryPersonal.Close;
    dmNomina.QryPersonal.Sql.Clear;
    dmNomina.QryPersonal.Sql.Text:= dmNomina.qrypersonalbase.Text;
    dmNomina.QryPersonal.Sql.Add('Order by DEPTO_EMP, SECCION, Salario DESC');
    dmNomina.QryPersonal.Sql.Text:= dmNomina.qrypersonalbase.Text;
    if VistaPrevia then
    begin
      dmNomina.QryPersonal.Sql.Add('Where tipo_nomina = 4');
      dmNomina.QryPersonal.Sql.Add('and  '+DeterminaVistaPrevia(filtrar));
      dmNomina.QryPersonal.Sql.Add('Order by DEPTO_EMP, SECCION, Salario DESC');
      dmNomina.QryPersonal.Open;
      QckReporteGralXDepto.Preview;
    end else
    begin
      dmNomina.QryPersonal.Sql.Add('Where tipo_nomina = 4');
      dmNomina.QryPersonal.Sql.Add('and  '+DeterminaVistaPrevia(filtrar));
      dmNomina.QryPersonal.Sql.Add('Order by DEPTO_EMP, SECCION, Salario DESC');
      dmNomina.QryPersonal.Open;
      QckReporteGralXDepto.PrinterSetup;
      QckReporteGralXDepto.Print;
    end;
  finally
  QckReporteGralXDepto.free;
  QckReporteGralXDepto:=nil;
  end;  
end;

procedure Salario_Actual_Anterior(VistaPrevia:Boolean; Filtrar:Integer);
begin
  QckReporteGralSimple:=TQckReporteGralSimple.Create(nil);
  try
    dmNomina.QryPersonal.Close;
    QckReporteGralSimple.QRLabel4.Enabled  := True;
    QckReporteGralSimple.QRDBText2.Enabled := True;
    QckReporteGralSimple.QRExpr2.Enabled   := True;
    QckReporteGralSimple.QRLabel5.Enabled  := True;
    QckReporteGralSimple.QRLabel5.Enabled  := False;
    QckReporteGralSimple.QRDBText5.Enabled := False;
    QckReporteGralSimple.QRLabel6.Enabled  := False;
    QckReporteGralSimple.QRDBText6.Enabled := False;
    dmNomina.QryPersonal.Sql.Clear;
    dmNomina.QryPersonal.Sql.Text:= dmNomina.qrypersonalbase.Text;
    if VistaPrevia then
    begin
      dmNomina.QryPersonal.Sql.Add('Order by DEPTO_EMP, SECCION, Salario DESC');
      dmNomina.QryPersonal.Open;
      QckReporteGralSimple.Preview;
    end else
    begin
      dmNomina.QryPersonal.Sql.Add('Where tipo_nomina = 4');
      dmNomina.QryPersonal.Sql.Add('and  '+DeterminaVistaPrevia(filtrar));
      dmNomina.QryPersonal.Sql.Add('Order by DEPTO_EMP, SECCION, Salario DESC');
      dmNomina.QryPersonal.Open;
      QckReporteGralSimple.PrinterSetup;
      QckReporteGralSimple.Print;
    end;
  finally
  QckReporteGralSimple.free;
  QckReporteGralSimple:=nil;
  end;
End;


procedure ListadoPersonalFirma(x:smallint;Fecha:TDateTime);
begin
  //if Fecha.Execute then
  begin
    dmNomina.qryRepListNombNom.Close;
    //buscar en la version de delphi4
    //t dmnom.SQLScript1qryRepListNombNom.ExecStatement(x);
    //t DmNom.qryRepListNombNom.Sql.text:=dmnom.SQLScript1qryRepListNombNom.SqlActual;

    if x = 1 then
    begin
      dmNomina.qryRepListNombNom.Sql.Assign(dmNomina.qryRepListNombNom_bonibase.SQL);
      dmNomina.qryRepListNombNom.Params[0].Value := ExtraerFecha(fecha);
      dmNomina.qryRepListNombNom.Open;
      //dmNomina.qryRepListNombNom.Filtered:= False;  //5
      //dmNomina.qryRepListNombNom.Filter  :='DEPTO_EMP <>'+intToStr(y);
      //dmNomina.qryRepListNombNom.Filtered:= True;
      dmNomina.qryRepListNombNom.Filtered:= False;
      qckListadoNominaB:=tqckListadoNominaB.Create(Nil);
      try
      qckListadoNominaB.Preview;
      finally
      qckListadoNominaB.Free;
      qckListadoNominaB:=nil;
      end;
    end else
    begin
      dmNomina.qryRepListNombNom.Sql.Assign(dmNomina.qryRepListNombNomBase.SQL);
      dmNomina.qryRepListNombNom.Params[0].Value := ExtraerFecha(fecha);
      dmNomina.qryRepListNombNom.Open;
      //dmNomina.qryRepListNombNom.Filtered:= False;  //5
      //dmNomina.qryRepListNombNom.Filter  := 'DEPTO_EMP <> '+intToStr(y);
      //dmNomina.qryRepListNombNom.Filtered:= True;
      dmNomina.qryRepListNombNom.Filtered:= False;
      qckListadoNomina:=tQckListadoNomina.Create(Nil);
      try
        qckListadoNomina.Preview;
      finally
      qckListadoNomina.Free;
      qckListadoNomina:=Nil;
      end;
    end;
    dmNomina.qryRepListNombNom.Close;
  end;
end;

end.
