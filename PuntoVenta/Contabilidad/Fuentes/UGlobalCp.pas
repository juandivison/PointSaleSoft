unit UGlobalCp;

interface

uses
  Windows,SysUtils;


function GetVolumeID(DriveChar: Char): String;

implementation

function GetVolumeID(DriveChar: Char): String;
var
   MaxFileNameLength, VolFlags, SerNum: DWord; 
begin 
   if GetVolumeInformation(PChar(DriveChar + ':\'), nil, 0, 
      @SerNum, MaxFileNameLength, VolFlags, nil, 0) 
   then 
   begin 
     Result := IntToHex(SerNum,8); 
     Insert('-', Result, 5); 
   end 
   else 
       Result := ''; 
end; 


end.
 