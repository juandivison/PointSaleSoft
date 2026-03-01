unit UAcercaDe;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
   RxVerInf, Buttons, ExtCtrls, RxGIF;

type
  TAboutBox = class(TForm)
    Panel1: TPanel;
    ProductName: TLabel;
    Version: TLabel;
    Copyright: TLabel;
    OKButton: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Image2: TImage;
    Label9: TLabel;
    Label10: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutBox: TAboutBox;

implementation

{$R *.DFM}

procedure TAboutBox.FormCreate(Sender: TObject);
var
  VInfo: TVersionInfo;
  FAppVer, FAppBuild : String;
begin

  VInfo := TVersionInfo.Create(ParamStr(0));
  try
    FAppVer := VInfo.FileVersion;
    if trim(FAppVer)='' then FAppVer := '?.?';
    FAppBuild := ' '+FormatDateTime('mm/dd/yyyy', VInfo.VerFileDate);
    label6.Caption:= vinFO.CompanyName+' ';//  'IDESI SRL'+' ';
  finally
    VInfo.free;
    VInfo:= Nil;
  end;
  Version.Caption:='Version '+FAppVer+FAppBuild;

end;

end.
 
