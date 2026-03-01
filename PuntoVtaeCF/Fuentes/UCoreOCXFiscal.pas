unit UCoreOCXFiscal;

interface
    Uses ActiveX, EpsonFPHostControlX_TLB,  SysUtils, Variants, Classes, Controls,
  OleCtrls, StdCtrls;

  var

      FiscalPrinter: TEpsonFPHostControl;
      GlbFiscalStatus, GlbPrinterStatus : Smallint;
      GlbReturnCode  : Integer;

  Function GetFiscalStatus : String;
  Function GetFiscalError : String;
  Function GeneraCierreZ : Boolean;
  Procedure CerrarPuerto;
  Procedure AbrirPuerto;
  Function GetError : String;

implementation
  Uses UGlobal;

  Function GetError : String;
  begin
  result:='';
  Case FiscalPrinter.LastError Of
      EFP_Success : Result := '';
      EFP_E_ComInUse : Result := 'Puerto en uso';
      EFP_E_InvalidCom : Result := 'Error de comm';
      EFP_E_ComAlreadyOpen : begin
                               GLBIFiscalOnline:=True;
                               Result := 'Ready';
                             end;
      EFP_E_ComAlreadyClose : Result := 'Puerto ya cerrado';
      EFP_E_BadInitialization : Result := 'Inicialización incorrecta';
      EFP_E_ComClose : Result := 'Puerto Cerrado';
      EFP_E_MaxDataLengthReached : Result := 'Dato excede longitud';
      EFP_E_InvalidDataInField : Result := 'Valor invalido para campo';
      EFP_E_OperationInProgress : begin
      Result := 'Operación en progreso';
      GLBIFiscalOpeAbierta := True;
      end;
      EFP_E_WriteError : Result := 'Error de escritura';
      EFP_E_ReadTimeOut : Result := 'TimeOut';
      EFP_E_NackReceived : Result := 'No ack recibido';
      EFP_E_InvalidIndex : Result := 'Indice invalido';
    end;
  end;

  Procedure CerrarPuerto;
  begin
    //if GLBIFiscalOnline And Not GLBIFiscalBusy then
    if FiscalPrinter.ClosePort then
    begin
      GlbPuetoCerrado:=True;
      GLBIFiscalBusy:=False;
    end;
  end;

  Procedure AbrirPuerto;
  begin
    //if GLBIFiscalOnline And Not GLBIFiscalBusy then
    GlbIFiscalError := '';
    if not FiscalPrinter.OpenPort then
    begin
      //GlbPuetoCerrado:=True;
      //GLBIFiscalBusy:=False;
      GLBIFiscalOnline := False;
      GlbIFiscalError:= GetError;
    end else
    begin
      GlbPuetoCerrado:=False;
      GLBIFiscalOnline:=true;
    end;
  end;


  Function GeneraCierreZ : Boolean;
  var
        sAux : String;
        lAux : Integer;
        lreturn : Integer;
        msg : string;
        Const FLD_XNUMBER = 6;
  begin
        //'sAux = Chr(&H8) & Chr(&H1);
        //'AddField(sAux);
        //'sAux = Chr(&H0) & Chr(&H1);
        //'AddField(sAux);
        //'Call SendCommand();
        //'Initialize string

        //'sAux = chr(8)

        //'Debug to check answer
        //'no time out. just for debugging
        //lreturn = 1
        //While lreturn <> 0
        //lreturn = GetMessageField(sAux, lAux, FLD_XNUMBER);
        //msg :='Msg: ' + sStringToHexString(sAux);
        if GLBIFiscalOnline  and not GLBIFiscalBusy then
        begin
          if not FiscalPrinter.AddDataField('$0801') then
          GetFiscalError;
          if not FiscalPrinter.AddDataField('$0001') then
          if FiscalPrinter.SendCommand then
          begin
            msg := FiscalPrinter.GetExtraField(6);
          end;
          GetFiscalError;
        end;
  end;

  Function GetFiscalStatus : String;
  begin
    Result:= '';
    if not GlbPuetoCerrado then
    AbrirPuerto;
    
    GLBIFiscalBusy:=False;
    Case FiscalPrinter.State of
     EFP_S_Close : begin
                     Result:='Impresora Offline';
                     GLBIFiscalOnline:=False;
                   end;
     EFP_S_Idle : begin
                    Result:='Impresora en linea';
                    GLBIFiscalOnline:=True;
                    GlbPuetoCerrado:=True;
                  end;
     EFP_S_Busy : begin
                    Result:='Impresora Ocupada';
                    GLBIFiscalBusy :=True;
                  end;
    end;
    GlbFiscalStatus:= FiscalPrinter .FiscalStatus;
    GlbPrinterStatus:= FiscalPrinter.PrinterStatus;
    GlbReturnCode := FiscalPrinter.ReturnCode;
  end;

  Function GetFiscalError : String;
  begin
    if GlbPuetoCerrado then
    AbrirPuerto;
    Result:='';
    Case FiscalPrinter.LastError Of
      EFP_Success : Result := '';
      EFP_E_ComInUse : Result := 'Puerto en uso';
      EFP_E_InvalidCom : Result := 'Error de comm';
      EFP_E_ComAlreadyOpen : begin
                               GLBIFiscalOnline:=True;
                               Result := 'Ready';
                             end;
      EFP_E_ComAlreadyClose : Result := 'Puerto ya cerrado';
      EFP_E_BadInitialization : Result := 'Inicialización incorrecta';
      EFP_E_ComClose : Result := 'Puerto Cerrado';
      EFP_E_MaxDataLengthReached : Result := 'Dato excede longitud';
      EFP_E_InvalidDataInField : Result := 'Valor invalido para campo';
      EFP_E_OperationInProgress : begin
                                    Result := 'Operación en progreso';
                                    GLBIFiscalOpeAbierta := True;
                                  end;
      EFP_E_WriteError : Result := 'Error de escritura';
      EFP_E_ReadTimeOut : Result := 'TimeOut';
      EFP_E_NackReceived : Result := 'No ack recibido';
      EFP_E_InvalidIndex : Result := 'Indice invalido';
    end;
    GlbStatusFiscalError := Result;
  end;

  initialization
  CoInitialize(nil); // <-- manually call CoInitialize()
  //puerto :=

  FiscalPrinter:=TEpsonFPHostControl.Create(Nil);
  if GlbPuerto = 4 then
  begin
    FiscalPrinter.CommPort:= Com4;//Puerto;
  end;
  if GlbBaudRate = 4800 then
  FiscalPrinter.BaudRate:= br4800 //BaudRate;
  else
  if GlbBaudRate = 9600 then
  FiscalPrinter.BaudRate:= br9600 //BaudRate;
  else
  if GlbBaudRate = 19200 then
  FiscalPrinter.BaudRate:= br19200 //BaudRate;
  else
  if GlbBaudRate = 38400 then
  FiscalPrinter.BaudRate:= br38400;

  GlbPuetoCerrado := True;
  GLBIFiscalOnline := False;
finalization
  FreeAndNil(FiscalPrinter);
  CoUnInitialize; //
  {  br2400 = $00000001;
  br4800 = $00000002;
  br9600 = $00000003;
  br19200 = $00000004;
  br38400 = $00000005;
}

end.
