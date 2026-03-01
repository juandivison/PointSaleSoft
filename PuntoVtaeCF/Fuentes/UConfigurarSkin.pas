unit UConfigurarSkin;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Menus, WinSkinForm, WinSkinData,
   Buttons, Grids, ToolWin, ExtCtrls, ImgList, ExtDlgs,inifiles,
   WinSkinStore;

const
  ininame= 'Config.ini';

type
  TfrmConfSkin = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    DialogM: TMenuItem;
    Help1: TMenuItem;
    Open1: TMenuItem;
    Save1: TMenuItem;
    Close1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    Skin11: TMenuItem;
    Skin21: TMenuItem;
    Skin31: TMenuItem;
    Content1: TMenuItem;
    Homepage1: TMenuItem;
    About1: TMenuItem;
    sd1: TSkinData;
    Dialog1: TOpenDialog;
    Dialog2: TFontDialog;
    Dialog3: TColorDialog;
    Dialog4: TPrintDialog;
    PrintDialog2: TMenuItem;
    BuildinSkins1: TMenuItem;
    Skin12: TMenuItem;
    Skin22: TMenuItem;
    Skin32: TMenuItem;
    ImageList1: TImageList;
    Opd1: TOpenPictureDialog;
    SkinStore1: TSkinStore;
    Timer1: TTimer;
    OpenwithPreview1: TMenuItem;
    Button5: TButton;
    BitBtn1: TBitBtn;
    Delete1: TMenuItem;
    BitBtn2: TBitBtn;
    procedure Exit1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sf1CaptionBtnClick(Sender: TObject; action: Integer);
    procedure SpeedButton1Click(Sender: TObject);
    procedure LoadBtnClick(Sender: TObject);
    procedure ExceptionBtnClick(Sender: TObject);
    procedure MessageBtnClick(Sender: TObject);
    procedure Skin21Click(Sender: TObject);
    procedure Skin31Click(Sender: TObject);
    procedure PrintDialog2Click(Sender: TObject);
    procedure Skin12Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure StatusBar1DrawPanel(StatusBar: TStatusBar;
      Panel: TStatusPanel; const Rect: TRect);
    procedure Button5Click(Sender: TObject);
    procedure Open1Click(Sender: TObject);
    procedure Save1Click(Sender: TObject);
  private
    { Private declarations }
    procedure ReadSkinfile( apath : string );
    procedure Loadskin(aname:string);
    procedure Readini;
    procedure Writeini;
    //procedure CNTabClose(var Message: TMessage); message CN_TabSheetClose;
  public
    { Public declarations }
    Ep:integer;
  end;

var
  frmConfSkin: TfrmConfSkin;
  root:string;
  path:string;

implementation

uses SkinGraphic;
{$R *.dfm}

procedure TfrmConfSkin.Exit1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmConfSkin.ReadSkinfile( apath : string );
var
  sts: Integer ;
  SR: TSearchRec;
  list: Tstringlist;

  procedure AddFile;
  begin
    list.add(sr.name);
  end;

begin
  list:=Tstringlist.create;
  sts := FindFirst( apath + '*.skn' , faAnyFile , SR );
  if sts = 0 then begin
      if ( SR.Name <> '.' ) and ( SR.Name <> '..' ) then begin
          if pos('.', SR.Name) <> 0 then
            Addfile;
      end;
      while FindNext( SR ) = 0 do begin
          if ( SR.Name <> '.' ) and ( SR.Name <> '..' ) then begin
              //Put User Feedback here if desired
//              Application.ProcessMessages;
              if Pos('.', SR.Name) <> 0 then  Addfile;
          end;
      end;
  end ;
  FindClose( SR ) ;
  list.sort;

  list.free;
end;

procedure TfrmConfSkin.FormCreate(Sender: TObject);
var i,j:integer;
begin
    root:= ExtractFilePath(ParamStr(0));
    path:=root+'skins\';
    readskinfile(path);

//   load skin file from TSkinStore
   Sd1.LoadFromCollection(skinstore1,2);
   if not sd1.active then sd1.active:=true;



//    Readini;
end;

procedure TfrmConfSkin.sf1CaptionBtnClick(Sender: TObject; action: Integer);
begin
     showmessage('Custom Caption Button Click No:'+inttostr(action));
end;

procedure TfrmConfSkin.SpeedButton1Click(Sender: TObject);
begin
//   sd1.skinfile:='..\skins\'+combobox1.items[1];
//   stringgrid1.fixedcolor:=sd1.colors[csButtonFace];
//    skinaddlog('****************************');
   timer1.enabled:= not timer1.enabled;
end;

procedure TfrmConfSkin.LoadBtnClick(Sender: TObject);
begin
  Dialog1.filter:='Skin files (*.skn)|*.SKN';
  Dialog1.initialdir:=path;
  if Dialog1.execute then
     sd1.skinfile:=dialog1.filename;
  if not sd1.Active then
   sd1.Active:=true;

end;

procedure TfrmConfSkin.ExceptionBtnClick(Sender: TObject);
var i:integer;
begin
    i:=1;
    Ep:= 100 div (i-1);
end;

procedure TfrmConfSkin.MessageBtnClick(Sender: TObject);
begin
   MessageDlg('El éxito es para quien lo busca',
        mtInformation,[mbOk], 0);
end;

procedure TfrmConfSkin.Skin21Click(Sender: TObject);
begin
   Dialog2.execute;
end;

procedure TfrmConfSkin.Skin31Click(Sender: TObject);
begin
  Dialog3.execute;
end;

procedure TfrmConfSkin.PrintDialog2Click(Sender: TObject);
begin
  Dialog4.execute;
end;

procedure TfrmConfSkin.Loadskin(aname:string);
var  RS: TResourceStream;
begin
    RS := TResourceStream.Create(HInstance,aname,RT_RCDATA);
    sd1.loadfromstream(rs);
    rs.free;
end;

procedure TfrmConfSkin.Skin12Click(Sender: TObject);
var i:integer;
begin
   i:=Tcomponent(sender).tag;
   Sd1.LoadFromCollection(skinstore1,i);
end;

procedure TfrmConfSkin.Timer1Timer(Sender: TObject);
begin
{   ProgressBar1.position:=ProgressBar1.position+1;
   if ProgressBar1.position>99 then
      ProgressBar1.position:=0;}
end;

procedure TfrmConfSkin.Readini;
var ini3:Tinifile;
begin
   ini3 := TIniFile.Create(root+ininame);
   ClientHeight:=ini3.readinteger('Path','height',400);
   ClientWidth:=ini3.readinteger('Path','width',400);
   top:=ini3.readinteger('Path','top',0);
   left:=ini3.readinteger('Path','left',0);
   ini3.free;
end;

procedure TfrmConfSkin.Writeini;
var ini3:Tinifile;
begin
   ini3 := TIniFile.Create(root+ininame);
   ini3.writeinteger('Path','Width',ClientWidth);
   ini3.writeinteger('Path','Height',ClientHeight);
   ini3.writeinteger('Path','Left',left);
   ini3.writeinteger('Path','Top',top);
   ini3.free;
end;

procedure TfrmConfSkin.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  //Writeini;
end;

procedure TfrmConfSkin.StatusBar1DrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
var r:Trect;
begin
    if panel=StatusBar.Panels[1] then begin
       r:=rect;
       InflateRect( r, -4, -2 );
       statusbar.Canvas.brush.color:=clblue;
       statusbar.Canvas.FillRect(r);
    end;
end;

procedure TfrmConfSkin.Button5Click(Sender: TObject);
begin
    opd1.InitialDir:=path;//ExtractFilePath(ParamStr(0));
    opd1.Filter:= 'Text files (*.skn)|*.skn';
    if opd1.Execute then
    begin
       sd1.Active:=false;
       sd1.SkinFile:=opd1.FileName;
       sd1.Active:=true;
    end;
end;

{procedure TfrmConfSkin.CNTabClose(var Message: TMessage);
var tab:TPagecontrol;
begin
   tab := Tpagecontrol(findcontrol(message.WParam));
   if tab = nil then exit;
   if MessageDlg('Do you want to close TabSheet '+tab.Pages[message.lparam].Name+' ?',
        mtInformation,[mbYes,mbNo], 0)=mrYes then
        message.Result:=0 //result=0,close
   else message.Result:=1;
end;}

procedure TfrmConfSkin.Open1Click(Sender: TObject);
begin
  Button5Click(Self);
end;

procedure TfrmConfSkin.Save1Click(Sender: TObject);
begin
  BitBtn1.Click;
end;

end.
