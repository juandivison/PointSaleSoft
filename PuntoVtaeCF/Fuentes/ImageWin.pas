unit ImageWin;

interface

uses Windows, Classes, Graphics, Forms, Controls,
  FileCtrl, StdCtrls, ExtCtrls, Buttons, Spin, ComCtrls, Dialogs;

type
  TImageForm = class(TForm)
    DirectoryListBox1: TDirectoryListBox;
    DriveComboBox1: TDriveComboBox;
    FileEdit: TEdit;
    Panel1: TPanel;
    Image1: TImage;
    FileListBox1: TFileListBox;
    ViewBtn: TBitBtn;
    Bevel1: TBevel;
    FilterComboBox1: TFilterComboBox;
    StretchCheck: TCheckBox;
    Label2: TLabel;
    Panel2: TPanel;
    Edit1: TEdit;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    BitBtn13: TBitBtn;
    Label3: TLabel;
    procedure FileListBox1Click(Sender: TObject);
    procedure ViewBtnClick(Sender: TObject);
    procedure StretchCheckClick(Sender: TObject);
    procedure FileEditKeyPress(Sender: TObject; var Key: Char);

    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FormCaption: string;
  public
   _rutaInv : String;
   procedure setDirectorio;
  end;

var
  ImageForm: TImageForm;

implementation

uses ViewWin, SysUtils, UGlobal;

{$R *.dfm}

procedure TImageForm.FileListBox1Click(Sender: TObject);
var
  FileExt: string[4];
begin
  FileExt := AnsiUpperCase(ExtractFileExt(FileListBox1.Filename));
  if (FileExt = '.PNG') or (FileExt = '.BMP') or (FileExt = '.ICO') or (FileExt = '.WMF') or
    (FileExt = '.EMF') or (FileExt = '.JPEG') or (FileExt = '.JPG')   then
  begin
    Image1.Picture.LoadFromFile(FileListBox1.Filename);
    Caption := FormCaption + ExtractFilename(FileListBox1.Filename);
    if (FileExt = '.BMP') or (FileExt = '.PNG') or (FileExt = '.JPEG') or  (FileExt = '.JPG') then
    begin
      Caption := Caption +
        Format(' (%d x %d)', [Image1.Picture.Width, Image1.Picture.Height]);
      ViewForm.Image1.Picture := Image1.Picture;
      ViewForm.Caption := Caption;
      //t if GlyphCheck.Checked then ViewAsGlyph(FileExt);
    end;
    //t else
      //t GlyphCheck.Checked := False;
    if FileExt = '.ICO' then
    begin
      Icon := Image1.Picture.Icon;
      ViewForm.Image1.Picture.Icon := Icon;
    end;
    if (FileExt = '.WMF') or (FileExt = '.EMF') then
      ViewForm.Image1.Picture.Metafile := Image1.Picture.Metafile;
  end;
end;

procedure TImageForm.ViewBtnClick(Sender: TObject);
begin
  if not Assigned(ViewForm) then
  ViewForm:=TViewForm.Create(nil);
  ViewForm.HorzScrollBar.Range := Image1.Picture.Width;
  ViewForm.VertScrollBar.Range := Image1.Picture.Height;
  ViewForm.Caption := Caption;
  ViewForm.Show;
  ViewForm.WindowState := wsNormal;
end;

procedure TImageForm.StretchCheckClick(Sender: TObject);
begin
  Image1.Stretch := StretchCheck.Checked;
end;

procedure TImageForm.FileEditKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    FileListBox1.ApplyFilePath(FileEdit.Text);
    Key := #0;
  end;
end;

procedure TImageForm.FormCreate(Sender: TObject);
begin
  setDirectorio;
  if Not Assigned(ViewForm) then
  ViewForm:=TViewForm.Create(Nil);
  FormCaption := Caption + ' - ';
  //t UpDown1.Min := 1;
  //t UpDown1.Max := 4;
end;

procedure TImageForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(ViewForm) then
  begin
    ViewForm.Free;
    ViewForm:=nil;
  end;
end;

procedure TImageForm.setDirectorio;
begin
  if (_rutaInv <> '') then
  if (DirectoryExists(GlbRootImg + '\' + _rutaInv)) then
  DirectoryListBox1.Directory := GlbRootImg + '\' + _rutaInv
  else
  DirectoryListBox1.Directory := GlbRootImg;
end;

end.
