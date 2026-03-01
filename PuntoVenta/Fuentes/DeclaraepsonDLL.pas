unit DeclaraepsonDLL;

interface

function OpenSerialPort(iSerialPort:Integer; iBaudRate:Integer):Integer;StdCall; External 'EpsonFiscalProtocol.dll';
function CloseSerialPort():Integer;StdCall; External 'EpsonFiscalProtocol.dll';
function SendSerialMessage():Integer;StdCall; External 'EpsonFiscalProtocol.dll';
function ResendSerialMessage():Integer;StdCall; External 'EpsonFiscalProtocol.dll';
function AddMessageField( szField:PChar;  iFieldLength:Integer):Integer;StdCall; External 'EpsonFiscalProtocol.dll';
function AddMessageFieldEx( szField:PChar;  iFieldLength:Integer;  uiFieldType:Integer;  bSeparator:Boolean):Integer;StdCall; External 'EpsonFiscalProtocol.dll';
procedure PurgeMessage();StdCall; External 'EpsonFiscalProtocol.dll';
function GetMessageField( szField:PChar;  var iFieldLength:Integer;  iAnswerField:Integer):Integer;StdCall; External 'EpsonFiscalProtocol.dll';
function GetMessageFieldEx( var iField:Integer;  var iFieldLength:Integer;  iAnswerField:Integer;  iType:Integer):Integer;StdCall; External 'EpsonFiscalProtocol.dll';
function GetFieldCounter():Integer;StdCall; External 'EpsonFiscalProtocol.dll';
function GetCommunicationState():Integer;StdCall; External 'EpsonFiscalProtocol.dll';
function GetLastCommError():Integer;StdCall; External 'EpsonFiscalProtocol.dll';
procedure GetApiVersion();StdCall; External 'EpsonFiscalProtocol.dll';
function GetSentFrame( szBuffer:PChar;  var iBufferLength:Integer):Integer;StdCall; External 'EpsonFiscalProtocol.dll';
function GetReceivedFrame(szBuffer:PChar;  var iBufferLength:Integer):Integer;StdCall; External 'EpsonFiscalProtocol.dll';

implementation

end.
