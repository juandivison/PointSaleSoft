{*******************************************************}
{*  ImageZoom v1.2, Component Source                   *}
{*                                                     *}
{*  Copyright (c) 1999-2000 Dott. Cosimo De Michele    *}
{*                                                     *}
{*******************************************************}

unit ImageZoom;

interface

uses
  Windows, Messages, SysUtils, Classes, Forms, Graphics, Controls,
  ExtCtrls, stdctrls;

type
  TTypeScrollbar = (tsNone, tsHorz, tsVert, tsBoth);

  TScaleInfo = record
                  SrcSize: TSize;
                  SrcOffset: TPoint;
                  DstSize: TSize;
                  DstOffset: TPoint;
                end;

  { *** TImageZoom *** }
  TImageZoom = class(TCustomControl)
  private
    { scrollbars }
    FScrollBar: boolean;
    FTypeScrollBar: TTypeScrollbar;
    { zoom }
    FZoomOffset: TPoint;
    FZoom: integer;
    { picture }
    FBitmap: TBitmap;
    FPicture: TPicture;
    FIncrementalDisplay: Boolean;
    FTransparent: Boolean;
    FDrawing: Boolean;
    FAutoFit: Boolean;
    { events }
    FOnProgress: TProgressEvent;
    FOnPaint: TNotifyEvent;
    FOnResize: TNotifyEvent;
    { methods }
    procedure PictureChanged(Sender: TObject);
    procedure SetTransparent(Value: Boolean);
    procedure SetZoom(Value: integer);
    procedure SetPicture(Value: TPicture);
    procedure SetZoomOffset(Value: TPoint);
    procedure SetScrollBar(Value: boolean);
    procedure SetAutoFit(Value: boolean);
    function  ScrollMessage(SbType : integer; var Msg: TWMScroll; ClientSize : integer): integer;
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    procedure WMEraseBkgnd(var Message:TMessage); message WM_ERASEBKGND;
    procedure WMSize(var Message: TWMSize); message WM_SIZE;
    procedure WMHScroll(var Message: TWMHScroll); message WM_HSCROLL;
    procedure WMVScroll(var Message: TWMVScroll); message WM_VSCROLL;
    //function MapRect(s: TRect): TRect;
    procedure Paint; override;
    procedure UpdateScrollBar;
    function DoPaletteChange: Boolean;
    function GetPalette: HPALETTE; override;
    procedure Progress(Sender: TObject; Stage: TProgressStage;
      PercentDone: Byte; RedrawNow: Boolean; const R: TRect; const Msg: string); dynamic;
    procedure DoResize; dynamic;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function ScaleInfo: TScaleInfo;
    function XSrc2Pict(X: integer): integer;
    function YSrc2Pict(Y: integer): integer;
    function XPict2Src(X: integer): integer;
    function YPict2Src(Y: integer): integer;
    function Src2Pict(P: TPoint): TPoint;
    function Pict2Src(P: TPoint): TPoint;
    procedure Fit;
  published
    property Align;
    property Cursor;
    property DragCursor;
    property DragMode;
    property Enabled;
    property IncrementalDisplay: Boolean read FIncrementalDisplay write FIncrementalDisplay default False;
    property ParentShowHint;
    property Picture: TPicture read FPicture write SetPicture;
    property PopupMenu;
    property ShowHint;
    property ScrollBar: boolean read FScrollbar write SetScrollBar default False;
    property Transparent: boolean read FTransparent write SetTransparent default False;
    property Visible;
    property ZoomOffset : TPoint read FZoomOffset write SetZoomOffset;
    property Zoom: integer read FZoom write SetZoom default 100;
    property AutoFit: boolean read FAutoFit write SetAutoFit default false;
    { events }
    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnProgress: TProgressEvent read FOnProgress write FOnProgress;
    property OnPaint: TNotifyEvent read FOnPaint write FOnPaint;
    property OnStartDrag;
    property OnResize: TNotifyEvent read FOnResize write FOnResize;
  end;

  procedure Register;

implementation

{****************************************************************************}
{***                           TImageZoom                                 ***}
{****************************************************************************}

procedure TImageZoom.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with Params do
  begin
    Style :=Style or (WS_HSCROLL or WS_VSCROLL);
    WindowClass.style := WindowClass.style and not (CS_HREDRAW or CS_VREDRAW);
  end;
end;

constructor TImageZoom.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle + [csReplicatable];
  FBitmap := TBitmap.Create;
  FPicture := TPicture.Create;
  FPicture.OnChange := PictureChanged;
  FPicture.OnProgress := Progress;
  Height := 105;
  Width  := 105;
  FZoom  := 100;
  FZoomOffset := Point(0,0);
  SetScrollBar(false);
  FTypeScrollBar := tsNone;
end;

destructor TImageZoom.Destroy;
begin
  FBitmap.free;
  FPicture.free;
  inherited Destroy;
end;

procedure TImageZoom.SetZoom(Value: integer);
begin
  if Value<>FZoom then
  begin
    FAutoFit := false;
    FZoom := Value;
    UpdateScrollBar;
  end;
end;

procedure TImageZoom.SetZoomOffset(Value: TPoint);
begin
  if (FZoomOffset.x<>Value.x) or (FZoomOffset.y<>Value.y) then
  begin
    FZoomOffset := Value;
    UpdateScrollBar;
  end;
end;

procedure TImageZoom.SetPicture(Value: TPicture);
begin
  FPicture.Assign(Value);
end;

procedure TImageZoom.SetScrollBar(Value: boolean);
begin
  if FScrollBar <> Value then
  begin
    FScrollBar := Value;
    UpdateScrollBar;
  end;
end;

procedure TImageZoom.SetAutoFit(Value: boolean);
begin
  if FAutoFit <> Value then
  begin
    FAutoFit := Value;
    if FAutoFit then
      Fit
    else
      UpdateScrollBar;
  end;
end;

function TImageZoom.GetPalette: HPALETTE;
begin
  Result := 0;
  if FPicture.Graphic <> nil then
    Result := FPicture.Graphic.Palette;
end;

function TImageZoom.XSrc2Pict(X: integer): integer;
begin
  with ScaleInfo do
    Result := SrcOffset.X + MulDiv(X, SrcSize.cX, DstSize.cX);
end;

function TImageZoom.YSrc2Pict(Y: integer): integer;
begin
  with ScaleInfo do
    Result := SrcOffset.Y + MulDiv(Y, SrcSize.cY, DstSize.cY);
end;

function TImageZoom.XPict2Src(X: integer): integer;
begin
  with ScaleInfo do
    Result := MulDiv(X, DstSize.cX, SrcSize.cX) - SrcOffset.X;
end;

function TImageZoom.YPict2Src(Y: integer): integer;
begin
  with ScaleInfo do
    Result := MulDiv(Y, DstSize.cY, SrcSize.cY) - SrcOffset.Y;
end;

function TImageZoom.Src2Pict(P: TPoint): TPoint;
begin
  Result := Point(XSrc2Pict(P.X), YSrc2Pict(P.Y));
end;

function TImageZoom.Pict2Src(P: TPoint): TPoint;
begin
  Result := Point(XPict2Src(P.X), YPict2Src(P.Y));
end;

function TImageZoom.ScaleInfo: TScaleInfo;
var
  r, sRect: TRect;
begin
  with Result, FPicture  do
  begin
    SrcOffset := FZoomOffSet;
    Fillchar(DstOffset, sizeof(TPoint), 0);
    SrcSize.cx := MulDiv(ClientWidth, 100, FZoom);
    SrcSize.cy := MulDiv(ClientHeight, 100, FZoom);
    { calcolo rettangolo di destinazione }
    sRect := Rect(0, 0, SrcSize.cx, SrcSize.cy);
    IntersectRect(r, sRect, Rect(0, 0, Width, Height));
    if EqualRect(sRect, r) then
    begin
      DstSize.cx := ClientWidth;
      DstSize.cy := ClientHeight;
      FTypeScrollBar := tsBoth;
    end
    else
    begin
      DstSize.cx := MulDiv(Width, FZoom, 100);
      DstSize.cy := MulDiv(Height, FZoom, 100);
      IntersectRect(r, ClientRect, Rect(0, 0, DstSize.cx, DstSize.cy));
      if EqualRect(Rect(0, 0, DstSize.cx, DstSize.cy), r) then
      begin
        SrcSize.cx := Width;
        SrcSize.cy := Height;
        FTypeScrollBar := tsNone;
        Fillchar(SrcOffset, sizeof(TPoint), 0);
      end
      else
      begin
        if DstSize.cx = r.Right then
          SrcSize.cx := Width
        else
        begin
          SrcSize.cx := MulDiv(r.Right, Height, DstSize.cy);
          FTypeScrollBar := tsHorz;
          SrcOffset.Y := 0;
        end;
        if DstSize.cy = r.Bottom then
          SrcSize.cy := Height
        else
        begin
          SrcSize.cy := MulDiv(r.Bottom, SrcSize.cx, DstSize.cx);
          FTypeScrollBar := tsVert;
          SrcOffset.X := 0;
        end;
        DstSize.cx := r.Right;
        DstSize.cy := r.Bottom;
      end;
    end;
    //DstOffset.X := MulDiv(SrcOffset.X, SrcSize.cX, DstSize.cX);
    //DstOffset.Y := MulDiv(SrcOffset.Y, SrcSize.cY, DstSize.cY);
  end;
end;

{function TImageZoom.MapRect(s: TRect): TRect;
begin
 with ScaleInfo do
 begin
   Result.Left := MulDiv(s.Left - SrcOffset.X, DstSize.cX, SrcSize.cX);
   Result.Top := MulDiv(s.Top - SrcOffset.Y, DstSize.cY, SrcSize.cY);
   Result.Right := MulDiv(s.Right - SrcOffset.X, DstSize.cX, SrcSize.cX);
   Result.Bottom := MulDiv(s.Bottom - SrcOffset.Y, DstSize.cY, SrcSize.cY);
 end;
end;
}

{$WARNINGS OFF}
procedure TImageZoom.Paint;
var
  PaintDC: HDC;
//  BmpRect: TRect;
  Save: Boolean;
  OldBrushStyle: TBrushStyle;
  OldBrushColor: TColor;
begin
  { imposto la nuova viewport tenendo presente il fattore di zoom }
  Save := FDrawing;
  FDrawing := True;
  OldBrushStyle := Canvas.Brush.Style;
  Canvas.Brush.Style := bsSolid;
  OldBrushColor := Canvas.Brush.Color;
  Canvas.Brush.Color := clBtnFace;

  try
    With ScaleInfo do
    begin
      if FTransparent then
        Canvas.BrushCopy(Rect(0, 0, DstSize.cx, DstSize.cy),
                        FBitmap,
                        Rect(SrcOffset.X, SrcOffset.Y, SrcOffset.X + SrcSize.cx, SrcOffset.Y + SrcSize.cy),
                        FBitmap.TransparentColor)
      else
        Canvas.CopyRect(Rect(0, 0, DstSize.cx, DstSize.cy),
                        FBitmap.Canvas,
                        Rect(SrcOffset.X, SrcOffset.Y, SrcOffset.X + SrcSize.cx, SrcOffset.Y + SrcSize.cy));


    end;
  finally
    FDrawing := Save;
  end;
  { OnPaint event }
  if Assigned(FOnPaint) then
    FOnPaint(Self);
  { escludo la parte disegnata e cancello immagine rimanente }
  With ScaleInfo do
  begin
    { RunTime mode }
    PaintDC := Canvas.Handle;
    ExcludeClipRect(PaintDC, 0, 0, DstSize.cx, DstSize.cy);
  end;

  Canvas.FillRect(ClientRect);
  Canvas.Brush.Style := OldBrushStyle;
  Canvas.Brush.Color := OldBrushColor;
  { Designing mode }
  if csDesigning in ComponentState then
  with Canvas do
  begin
    Pen.Style := psDash;
    Brush.Style := bsClear;
    Rectangle(0, 0, ClientWidth, ClientHeight);
  end;
end;
{$WARNINGS ON}

function TImageZoom.DoPaletteChange: Boolean;
var
  ParentForm: TCustomForm;
  Tmp: TGraphic;
begin
  Result := False;
  Tmp := Picture.Graphic;
  if Visible and (not (csLoading in ComponentState)) and (Tmp <> nil) and
    (Tmp.PaletteModified) then
  begin
    if (Tmp.Palette = 0) then
      Tmp.PaletteModified := False
    else
    begin
      ParentForm := GetParentForm(Self);
      if Assigned(ParentForm) and ParentForm.Active and Parentform.HandleAllocated then
      begin
        if FDrawing then
          ParentForm.Perform(wm_QueryNewPalette, 0, 0)
        else
          PostMessage(ParentForm.Handle, wm_QueryNewPalette, 0, 0);
        Result := True;
        Tmp.PaletteModified := False;
      end;
    end;
  end;
end;

procedure TImageZoom.Progress(Sender: TObject; Stage: TProgressStage;
  PercentDone: Byte; RedrawNow: Boolean; const R: TRect; const Msg: string);
begin
  if FIncrementalDisplay and RedrawNow then
  begin
    if DoPaletteChange then
      Update
    else
      Paint;
  end;
  if Assigned(FOnProgress) then
    FOnProgress(Sender, Stage, PercentDone, RedrawNow, R, Msg);
end;

procedure TImageZoom.SetTransparent(Value: Boolean);
begin
  if Value <> FTransparent then
  begin
    FTransparent := Value;
    PictureChanged(Self);
  end;
end;

procedure TImageZoom.UpdateScrollBar;
var
  maxWidth, maxHeight: integer;
  ScrollInfo : TScrollInfo;
begin
  { imposto le scrollbar }
  with ScaleInfo do
  begin
    if (HandleAllocated) and not(FDrawing) then
    begin
      if (FScrollBar) then
      begin
        maxWidth := FPicture.Width - SrcSize.cx;
        maxHeight := FPicture.Height - SrcSize.cy;
        FZoomOffSet := SrcOffset;
        { controllo se l'immagine è fuori dall'area stampabile }
        if (maxWidth>0) and (maxWidth<FZoomOffSet.x) then
          FZoomOffset := Point(maxWidth, FZoomOffSet.y);
        if (maxHeight>0) and (maxHeight<FZoomOffSet.y) then
          FZoomOffset := Point(FZoomOffset.x, maxHeight);
        case FTypeScrollBar of
          tsNone: begin
                    SetScrollRange(Handle, SB_HORZ, 0, 0, false);
                    SetScrollRange(Handle, SB_VERT, 0, 0, false);
                  end;
          tsHorz: begin
                    ScrollInfo.cbSize := Sizeof (ScrollInfo) ;
                    ScrollInfo.fMask := SIF_RANGE ;
                    ScrollInfo.nMin := 0;
                    ScrollInfo.nMax := FPicture.Width - 1;
                    SetScrollInfo (Handle, SB_HORZ, ScrollInfo, false) ;
                    ScrollInfo.nMin := 0;
                    ScrollInfo.nMax := 0;
                    SetScrollInfo (Handle, SB_VERT, ScrollInfo, false) ;
                    { aggiorno valore scrollbar }
                    ScrollInfo.nPos := FZoomOffset.y;
                    ScrollInfo.fMask := SIF_POS;
                    SetScrollInfo (Handle, SB_VERT, ScrollInfo, false) ;
                  end;
          tsVert: begin
                    ScrollInfo.cbSize := Sizeof (ScrollInfo) ;
                    ScrollInfo.fMask := SIF_RANGE ;
                    ScrollInfo.nMin := 0;
                    ScrollInfo.nMax := 0;
                    SetScrollInfo (Handle, SB_HORZ, ScrollInfo, false) ;
                    ScrollInfo.nMin := 0;
                    ScrollInfo.nMax := FPicture.Height - 1;
                    SetScrollInfo (Handle, SB_VERT, ScrollInfo, false) ;
                    { aggiorno valore scrollbar }
                    ScrollInfo.nPos := FZoomOffset.y;
                    ScrollInfo.fMask := SIF_POS;
                    SetScrollInfo (Handle, SB_VERT, ScrollInfo, false) ;
                  end;
          tsBoth: begin
                    ScrollInfo.cbSize := Sizeof (ScrollInfo) ;
                    ScrollInfo.fMask := SIF_RANGE ;
                    ScrollInfo.nMin := 0;
                    ScrollInfo.nMax := FPicture.Width - 1;
                    SetScrollInfo (Handle, SB_HORZ, ScrollInfo, false) ;
                    ScrollInfo.nMin := 0;
                    ScrollInfo.nMax := FPicture.Height - 1;
                    SetScrollInfo (Handle, SB_VERT, ScrollInfo, false) ;
                    { aggiorno valore scrollbar }
                    ScrollInfo.nPos := FZoomOffset.y;
                    ScrollInfo.fMask := SIF_POS;
                    SetScrollInfo (Handle, SB_VERT, ScrollInfo, false) ;
                    ScrollInfo.nPos := FZoomOffset.x;
                    ScrollInfo.fMask := SIF_POS;
                    SetScrollInfo (Handle, SB_HORZ, ScrollInfo, false) ;
                  end;
        end;
        { set page scrollbars }
        ScrollInfo.cbSize := Sizeof (ScrollInfo) ;
        ScrollInfo.fMask := SIF_PAGE ;
        ScrollInfo.nPage := SrcSize.cx;
        SetScrollInfo (Handle, SB_HORZ, ScrollInfo, true) ;
        ScrollInfo.cbSize := Sizeof (ScrollInfo) ;
        ScrollInfo.fMask := SIF_PAGE ;
        ScrollInfo.nPage := SrcSize.cy;
        SetScrollInfo (Handle, SB_VERT, ScrollInfo, true) ;
        {TForm(Owner).caption := format('zo:%d x %d, i:%d x %d, c:%d x %d, s:%d x %d, d:%d x %d',
                                       [FZoomOffset.X, FZoomOffset.Y,
                                       FPicture.Width, FPicture.Height,
                                       ClientWidth, ClientHeight,
                                       SrcSize.cx, SrcSize.cy,
                                       DstSize.cx, DstSize.cy]);}
      end
      else
        ShowScrollBar(Handle, SB_BOTH, false);
    end;
  end;
  { ridisegno se necessario }
  if not FDrawing then
    Invalidate;
end;

procedure TImageZoom.PictureChanged(Sender: TObject);
var
  G: TGraphic;
begin
  G := FPicture.Graphic;
  if G <> nil then
  begin
    {if not ((G is TMetaFile) or (G is TIcon)) then
      G.Transparent := FTransparent;
    if (not G.Transparent) and ((G.Width >= Width)
      and (G.Height >= Height)) or ((G is TBitmap) and (not G.Transparent)) then
      ControlStyle := ControlStyle + [csOpaque]
    else
      ControlStyle := ControlStyle - [csOpaque];
    }
    if (not FTransparent) and ((G.Width >= Width)
      and (G.Height >= Height)) then
      ControlStyle := ControlStyle + [csOpaque]
    else
      ControlStyle := ControlStyle - [csOpaque];

    if DoPaletteChange and FDrawing then
      Update;
    FBitmap.Transparent := FTransparent;
    FBitmap.Canvas.FillRect(FBitmap.Canvas.ClipRect);
    FBitmap.Width := G.Width;
    FBitmap.Height := G.Height;
    FBitmap.Canvas.Draw(0, 0, G);
    //FBitmap.TransparentColor := FBitmap.Canvas.Pixels[0,0];
  end
  else
    ControlStyle := ControlStyle - [csOpaque];
  { aggiorno le scrollbars }
  UpdateScrollBar;
end;

procedure TImageZoom.Fit;
var
  zX, zY : integer;
begin
  if HandleAllocated then
  begin
    ShowScrollBar(Handle, SB_BOTH, false);
    SetScrollRange(Handle, SB_BOTH, 0, 0, true);
  end;
  FZoomOffset := Point(0, 0);
  FAutoFit := true;
  zX := Trunc((ClientWidth * 100) / FPicture.Width);
  zY := Trunc((ClientHeight * 100) / FPicture.Height);
  if zX<zY then
    FZoom := zX
  else
    FZoom := zY;
  { ridisegno se necessario }
  if not FDrawing then
    Invalidate;
end;

procedure TImageZoom.DoResize;
begin
  UpdateScrollBar;
  if Assigned(FOnResize) then
    FOnResize(Self);
end;

procedure TImageZoom.WMEraseBkgnd(var Message:TMessage);
begin
  Message.Result:=0;
end;

procedure TImageZoom.WMSize(var Message: TWMSize);
begin
  inherited;
  if not (csLoading in ComponentState) then
    DoResize;
end;

procedure TImageZoom.WMHScroll(var Message: TWMHScroll);
var
  sp : integer;
begin
  sp := ScrollMessage(SB_HORZ, Message, ClientHeight);
  if sp<>FZoomOffset.x then
  begin
    FZoomOffset := Point(sp, FZoomOffset.y);
    UpdateScrollBar;
  end;
end;

procedure TImageZoom.WMVScroll(var Message: TWMVScroll);
var
  sp : integer;
begin
  sp := ScrollMessage(SB_VERT, Message, ClientHeight);
  if sp<>FZoomOffset.y then
  begin
    FZoomOffset := Point(FZoomOffset.x, sp);
    UpdateScrollBar;
  end;
end;

function TImageZoom.ScrollMessage(SbType : integer; var Msg: TWMScroll; ClientSize : integer): integer;
var
  ScrollPos,
  MinPos,
  MaxPos : integer;
begin
  with Msg do
  begin
    ScrollPos := GetScrollPos(Handle, SbType);
    GetScrollRange(Handle, SbType, MinPos, MaxPos);
    case ScrollCode of
      SB_LINEUP: Dec(ScrollPos);
      SB_LINEDOWN: inc(ScrollPos);
      SB_PAGEUP: dec(ScrollPos, (ClientSize div 2));
      SB_PAGEDOWN: inc(ScrollPos, (ClientSize div 2));
      SB_THUMBPOSITION,
      SB_THUMBTRACK: ScrollPos := Pos;
      SB_TOP: ScrollPos := MinPos;
      SB_BOTTOM: ScrollPos := MaxPos;
      //SB_ENDSCROLL: showmessage('fine');
    end;
    if ScrollPos<MinPos then
      ScrollPos := MinPos;
    if ScrollPos>MaxPos then
      ScrollPos := MaxPos;
  end;
  Result := ScrollPos;
end;

{****************************************************************************}
{***                  TImageZoom - Register Component                     ***}
{****************************************************************************}

procedure Register;
begin
  RegisterComponents('Samples', [TImageZoom]);
end;

end.
