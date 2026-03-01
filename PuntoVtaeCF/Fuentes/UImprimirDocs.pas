unit UImprimirDocs;

interface

uses windows, shellapi, printers, Sysutils, Forms;

implementation


procedure PrintDocument(const documentToPrint : string; _PrinterIndex:integer) ;
var
  printCommand : string;
  printerInfo : string;
  Device, Driver, Port: array[0..255] of Char;
  hDeviceMode: THandle;
begin
  if Printer.PrinterIndex = _PrinterIndex then
  begin
    printCommand := 'print';
    printerInfo := '';
  end
  else
  begin
    printCommand := 'printto';
    Printer.PrinterIndex := _PrinterIndex;
    Printer.GetPrinter(Device, Driver, Port, hDeviceMode) ;
    printerInfo := Format('"%s" "%s" "%s"', [Device, Driver, Port]) ;
  end;

  ShellExecute(Application.Handle, PChar(printCommand), PChar(documentToPrint), PChar(printerInfo), nil, SW_HIDE) ;
end;

end.
 