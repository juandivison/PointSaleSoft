unit UnFrmMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, ImageZoom, GraphicEx,jpeg,ExtCtrls, StdCtrls, ImgList;
  
type
  PFileEntry = ^TFileEntry;
  TFileEntry = record
    Name: String;
    Path: String;
    Bitmap: TBitmap;
  end;
type
  TFrmMain = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar: TToolBar;
    tbOpen: TToolButton;
    tbZoomIn: TToolButton;
    tbZoomOut: TToolButton;
    ImageList: TImageList;
    StatusBar: TStatusBar;
    OpenDialog: TOpenDialog;
    ToolButton4: TToolButton;
    tbFit: TToolButton;
    ToolButton6: TToolButton;
    TrackBar: TTrackBar;
    ToolButton7: TToolButton;
    tbClose: TToolButton;
    ToolButton1: TToolButton;
    tbScrollbar: TToolButton;
    ProgressBar: TProgressBar;
    imp: TImageZoom;
    cbTransparent: TCheckBox;
    ToolButton2: TToolButton;
    GroupBox1: TGroupBox;
    ListView: TListView;
    Imgthumbnail: TImageList;
    procedure tbOpenClick(Sender: TObject);
    procedure tbZoomInClick(Sender: TObject);
    procedure tbZoomOutClick(Sender: TObject);
    procedure TrackBarChange(Sender: TObject);
    procedure tbCloseClick(Sender: TObject);
    procedure tbFitClick(Sender: TObject);
    procedure tbScrollbarClick(Sender: TObject);
    procedure impProgress(Sender: TObject; Stage: TProgressStage;
      PercentDone: Byte; RedrawNow: Boolean; const R: TRect;
      const Msg: String);
    procedure cbTransparentClick(Sender: TObject);
    procedure ClearFileList;
    procedure SearchDirectory;
    procedure CreateThumbnails;
     procedure RescaleImage(Source, Target: TBitmap; FastStretch: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure ListViewSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
  private
       FFileList: TList;
     ImageData: PFileEntry;

  public
   FDirectory: String;
    FThumbWidth,
    FThumbHeight :integer;

  end;

var
  FrmMain: TFrmMain;


implementation

{$R *.DFM}

procedure MakeThumbNail(src, dest: TBitmap; ThumbSize: Word);
type
  PRGB24 = ^TRGB24;
  TRGB24 = packed record
    B: Byte;
    G: Byte;
    R: Byte;
  end;
var
  x, y, ix, iy: integer;
  x1, x2, x3: integer;

  xscale, yscale: single;
  iRed, iGrn, iBlu, iRatio: Longword;
  p, c1, c2, c3, c4, c5: tRGB24;
  pt, pt1: pRGB24;
  iSrc, iDst, s1: integer;
  i, j, r, g, b, tmpY: integer;

  RowDest, RowSource, RowSourceStart: integer;
  w, h: integer;
  dxmin, dymin: integer;
  ny1, ny2, ny3: integer;
  dx, dy: integer;
  lutX, lutY: array of integer;

begin
  if src.PixelFormat <> pf24bit then src.PixelFormat := pf24bit;
  if dest.PixelFormat <> pf24bit then dest.PixelFormat := pf24bit;
  dest.Width := ThumbSize;
  dest.Height := ThumbSize;
  w := ThumbSize;
  h := ThumbSize;

  if (src.Width <= ThumbSize) and (src.Height <= ThumbSize) then
  begin
    dest.Assign(src);
    exit;
  end;

  iDst := (w * 24 + 31) and not 31;
  iDst := iDst div 8; //BytesPerScanline
  iSrc := (Src.Width * 24 + 31) and not 31;
  iSrc := iSrc div 8;

  xscale := 1 / (w / src.Width);
  yscale := 1 / (h / src.Height);

  // X lookup table
  SetLength(lutX, w);
  x1 := 0;
  x2 := trunc(xscale);
  for x := 0 to w - 1 do
  begin
    lutX[x] := x2 - x1;
    x1 := x2;
    x2 := trunc((x + 2) * xscale);
  end;

  // Y lookup table
  SetLength(lutY, h);
  x1 := 0;
  x2 := trunc(yscale);
  for x := 0 to h - 1 do
  begin
    lutY[x] := x2 - x1;
    x1 := x2;
    x2 := trunc((x + 2) * yscale);
  end;

  dec(w);
  dec(h);
  RowDest := integer(Dest.Scanline[0]);
  RowSourceStart := integer(Src.Scanline[0]);
  RowSource := RowSourceStart;
  for y := 0 to h do
  begin
    dy := lutY[y];
    x1 := 0;
    x3 := 0;
    for x := 0 to w do
    begin
      dx := lutX[x];
      iRed := 0;
      iGrn := 0;
      iBlu := 0;
      RowSource := RowSourceStart;
      for iy := 1 to dy do
      begin
        pt := PRGB24(RowSource + x1);
        for ix := 1 to dx do
        begin
          iRed := iRed + pt.R;
          iGrn := iGrn + pt.G;
          iBlu := iBlu + pt.B;
          inc(pt);
        end;
        RowSource := RowSource - iSrc;
      end;
      iRatio := 65535 div (dx * dy);
      pt1 := PRGB24(RowDest + x3);
      pt1.R := (iRed * iRatio) shr 16;
      pt1.G := (iGrn * iRatio) shr 16;
      pt1.B := (iBlu * iRatio) shr 16;
      x1 := x1 + 3 * dx;
      inc(x3, 3);
    end;
    RowDest := RowDest - iDst;
    RowSourceStart := RowSource;
  end;

  if dest.Height < 3 then exit;

  // Sharpening...
  s1 := integer(dest.ScanLine[0]);
  iDst := integer(dest.ScanLine[1]) - s1;
  ny1 := Integer(s1);
  ny2 := ny1 + iDst;
  ny3 := ny2 + iDst;
  for y := 1 to dest.Height - 2 do
  begin
    for x := 0 to dest.Width - 3 do
    begin
      x1 := x * 3;
      x2 := x1 + 3;
      x3 := x1 + 6;

      c1 := pRGB24(ny1 + x1)^;
      c2 := pRGB24(ny1 + x3)^;
      c3 := pRGB24(ny2 + x2)^;
      c4 := pRGB24(ny3 + x1)^;
      c5 := pRGB24(ny3 + x3)^;

      r := (c1.R + c2.R + (c3.R * -12) + c4.R + c5.R) div -8;
      g := (c1.G + c2.G + (c3.G * -12) + c4.G + c5.G) div -8;
      b := (c1.B + c2.B + (c3.B * -12) + c4.B + c5.B) div -8;

      if r < 0 then r := 0 else if r > 255 then r := 255;
      if g < 0 then g := 0 else if g > 255 then g := 255;
      if b < 0 then b := 0 else if b > 255 then b := 255;

      pt1 := pRGB24(ny2 + x2);
      pt1.R := r;
      pt1.G := g;
      pt1.B := b;
    end;
    inc(ny1, iDst);
    inc(ny2, iDst);
    inc(ny3, iDst);
  end;
end;


procedure TFrmMain.RescaleImage(Source, Target: TBitmap; FastStretch: Boolean);

// if source is in at least one dimension larger than the thumb size then rescale source
// but keep aspect ratio

var
  NewWidth,
  NewHeight: Integer;
  
begin
  if (Source.Width > FThumbWidth) or (Source.Height > FThumbHeight) then
  begin
    // Note: rescaling does only work for 24 bit images hence even monochrom images
    //       are converted to RGB.
    if Source.Width > Source.Height then
    begin
      NewWidth := FThumbWidth;
      NewHeight := Round(FThumbHeight * Source.Height / Source.Width);
    end
    else
    begin
      NewHeight := FThumbHeight;
      NewWidth := Round(FThumbWidth * Source.Width / Source.Height);
    end;
    if FastStretch then
    begin
      Target.PixelFormat := pf24Bit;
      Target.Width := NewWidth;
      Target.Height := NewHeight;
      Target.Palette := Source.Palette;
      SetStretchBltMode(Target.Canvas.Handle, COLORONCOLOR);
      StretchBlt(Target.Canvas.Handle, 0, 0, NewWidth, NewHeight, Source.Canvas.Handle, 0, 0,
                 Source.Width, Source.Height, SRCCOPY);
      //Target.Canvas.CopyRect(Rect(0, 0, NewWidth, NewHeight), Source.Canvas, Rect(0, 0, Source.Width, Source.Height));
    end
    else Stretch(NewWidth, NewHeight, sfTriangle, 0, Source, Target);
  end
  else Target.Assign(Source);
end;

//----------------------------------------------------------------------------------------------------------------------

//----------------------------------------------------------------------------------------------------------------------
procedure TFrmMain.CreateThumbnails;
Var
  Path    : String;
  Entry: PFileEntry;
   MyPicture :TPicture;
 currentimage,currentimaged :Tbitmap;
 image,I : integer;
  li : TListItem;
begin


       //  if Index < FFileList.Count then
      try

         ListView.Items.Clear;
         Image := 0 ;
         Imgthumbnail.Clear;

        for I := 0 to FFileList.Count - 1 do
         begin

              try
                  Entry := FFileList[I];
                   li := ListView.Items.Add;
                  li.Caption := Entry.Name;
                    myPicture :=Tpicture.Create;
                    currentimage := TBitmap.Create;
                    currentimaged := TBitmap.Create;
                    MyPicture.LoadFromFile(Entry.Path);   //load image to jpg holder
                  currentimaged.Width := Imgthumbnail.Width;       //set width same as jpg
                  currentimaged.Height:= Imgthumbnail.Width;      //set height same as jpg
                  currentimaged.Canvas.Draw(0, 0, myPicture.Graphic);     //draw jpg on bmp
                 // clTrans:=currentimage.TransparentColor;           //unknown if needed?
                   MakeThumbNail(currentimaged,Currentimage,Imgthumbnail.Width);
                   Imgthumbnail.AddMasked(Currentimage,clNone);     //add to imagelist

                    mypicture.Free;
                   currentimage.Free;
                   currentimaged.Free;
                  li.ImageIndex:=image;
              finally
                      image := image +1;                          //add one so it adds next page
              end;
        end;

     //do your stuff

    finally
     //DirList.Free;
    end;


end;
procedure TFrmMain.SearchDirectory;
var
  Picture: TPicture;
  SR: TSearchRec;
  Extensions: TStringList;
  I: Integer;
  Entry: PFileEntry;
  Ext: String;
  Count,
  XCount,
  YCount,
  YPos,
  HeightPerLine,
  ImageWidth: Integer;
  R: TRect;

begin
  Ext := FDirectory;
  // copy current folder to another variable because it is cleared on call of the
  // select function
  if Ext<>'' then
  begin
    ClearFileList;
    Count := 0;
    VertScrollBar.Range := 0;

    // precalculations for optimized invalidation
   // CalculateCounts(XCount, YCount, HeightPerLine, ImageWidth);
    YPos := 5 - VertScrollBar.Position + YCount * HeightPerLine;
    R := ClientRect;

    if AnsiLastChar(FDirectory)^ <> '\' then FDirectory := FDirectory + '\';
    Picture := TPicture.Create;
    Extensions := TStringList.Create;
    try
      FileFormatList.GetExtensionList(Extensions);
      for I := 0 to Extensions.Count - 1 do Extensions[I] := '.' + UpperCase(Extensions[I]);
      Extensions.Sort;
      if FindFirst(FDirectory + '*.*', faAnyFile, SR) = 0 then
      begin
        // iterate through the picked folder and collect all known image files
        repeat
          if SR.Attr <> faDirectory then
          begin
            // check whether this file is an image file we can show
            Ext := ExtractFileExt(SR.Name);
            if Extensions.Find(Ext, I) then
            begin
              // fine, we found an image file, so add it to our internal list
              New(Entry);
              Entry.Name := SR.Name;
               Entry.Path := FDirectory + SR.Name;
              Entry.Bitmap := TBitmap.Create;
              try
                Picture.LoadFromFile(FDirectory + SR.Name);
                if not (Picture.Graphic is TBitmap) then
                begin
                  // Some extra steps needed to keep non TBitmap descentant alive when scaling.
                  // This is needed because when accessing Picture.Bitmap all non-TBitmap content
                  // will simply be erased (definitly the wrong action, but we can't do anything
                  // to prevent this). Hence we must draw the graphic to a bitmap.
                  with Entry.Bitmap do
                  begin
                    PixelFormat := pf24Bit;
                    Width := Picture.Width;
                    Height := Picture.Height;
                    Canvas.Draw(0, 0, Picture.Graphic);
                  end;
                  Picture.Bitmap.Assign(Entry.Bitmap);
                end
                else
                Picture.Bitmap.Assign(Entry.Bitmap);

                 RescaleImage(Picture.Bitmap, Entry.Bitmap, True);

                FFileList.Add(Entry);
                Caption := IntToStr(Count) + ' images loaded';
                R.Top := YPos + (Count div XCount) * HeightPerLine;
                if R.Top < R.Bottom then
                begin
                  InvalidateRect(Handle, @R, False);
                  UpdateWindow(Handle);
                end;
                Inc(Count);
              except
                // no exceptions please, just ignore invalid images
                Application.ProcessMessages;
              end;
            end;
          end;
        until FindNext(SR) <> 0;
        FindCLose(SR);
      end;
    //  CalculateSize;
    //  FFileList.Sort(Compare);
      Invalidate;
    finally
      Extensions.Free;
      Picture.Free;
      Caption := 'Directory image browser demo program (' + IntToStr(Count) + ' images loaded)';
      //FLastIndex := -1;
    end;
  end
  else FDirectory := Ext;
end;

procedure TFrmMain.ClearFileList;

var
  I: Integer;
  ImageData: PFileEntry;

begin

  for I := 0 to FFileList.Count - 1 do
  begin
    ImageData := FFileList[I];
    ImageData.Bitmap.Free;
    Dispose(ImageData);
  end;

  FFileList.Clear;
end;
procedure TFrmMain.tbOpenClick(Sender: TObject);
begin

  if OpenDialog.Execute then
  begin
    imp.Picture.LoadFromFile(OpenDialog.FileName);
    imp.Zoom := 100;
    TrackBar.Position := imp.Zoom;
    TrackBarChange(TrackBar);
  end;

end;

procedure TFrmMain.tbZoomInClick(Sender: TObject);
begin
  imp.Zoom := imp.Zoom + 10;
  TrackBar.Position := imp.Zoom;
  TrackBarChange(TrackBar);
end;

procedure TFrmMain.tbZoomOutClick(Sender: TObject);
begin
  imp.Zoom := imp.Zoom - 10;
  TrackBar.Position := imp.Zoom;
  TrackBarChange(TrackBar);
end;

procedure TFrmMain.TrackBarChange(Sender: TObject);
begin
  imp.Zoom := TrackBar.Position;
  StatusBar.Panels[0].Text := 'Zoom : ' + IntToStr(imp.Zoom) + '%';
end;

procedure TFrmMain.tbCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmMain.tbFitClick(Sender: TObject);
begin
  imp.Fit;
  TrackBar.Position := imp.Zoom;
  TrackBarChange(TrackBar);
end;

procedure TFrmMain.tbScrollbarClick(Sender: TObject);
begin
  imp.Scrollbar := tbScrollbar.Down;
end;

procedure TFrmMain.impProgress(Sender: TObject; Stage: TProgressStage;
  PercentDone: Byte; RedrawNow: Boolean; const R: TRect;
  const Msg: String);
begin
  case Stage of
    psStarting: begin
                  ProgressBar.Visible := true;
                end;
    psRunning: begin
                 ProgressBar.Position := PercentDone;
               end;
    psEnding: begin
                ProgressBar.Visible := false;
              end;
  end;
end;

procedure TFrmMain.cbTransparentClick(Sender: TObject);
begin
  imp.Transparent := cbTransparent.Checked;
end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
        
     // thumb size
  FThumbWidth := 128;
  FThumbHeight := 128;

  FFileList := TList.Create;
  FDirectory:='C:\Downloads\Delphi\TMagnifyPublish\EXEDEMOS';
  Imgthumbnail.Width:=FThumbWidth;
  Imgthumbnail.Height:=FThumbHeight;
  SearchDirectory;
  CreateThumbnails;
  Caption:=FDirectory;
end;

procedure TFrmMain.ListViewSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
var
  I: Integer;
  ImageData: PFileEntry;

begin

    ImageData := FFileList[Item.Index];
    imp.Picture.LoadFromFile(ImageData.Path);
    
    imp.Zoom := 100;
    TrackBar.Position := imp.Zoom;
    TrackBarChange(TrackBar);

end;

end.
