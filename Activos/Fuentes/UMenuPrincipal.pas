unit UMenuPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ExtCtrls, Stdctrls,dbctrls, ComCtrls, ImgList, ToolWin,
  WinSkinData;

type
  TfrmMenuP = class(TForm)
    MainMenu1: TMainMenu;
    Activos1: TMenuItem;
    MaestroActivos1: TMenuItem;
    Depreciacion1: TMenuItem;
    TipoActivo1: TMenuItem;
    TransaccionDepreciacion1: TMenuItem;
    PosteoDepreciacionMensual1: TMenuItem;
    ContabilizarDepreciacion1: TMenuItem;
    Reportes1: TMenuItem;
    Consulta1: TMenuItem;
    Depreciacion2: TMenuItem;
    TipoActivo2: TMenuItem;
    ActivoFijo1: TMenuItem;
    Depreciacion3: TMenuItem;
    EntradaCont1: TMenuItem;
    ValorEnLibro1: TMenuItem;
    Ayuda1: TMenuItem;
    Salir1: TMenuItem;
    Salir2: TMenuItem;
    StatusBar1: TStatusBar;
    Shape1: TShape;
    CuentasActivos1: TMenuItem;
    ImageList1: TImageList;
    SkinData1: TSkinData;
    Label1: TLabel;
    Configurar1: TMenuItem;
    RutaBasedeDatos1: TMenuItem;
    procedure Salir1Click(Sender: TObject);
    procedure Salir2Click(Sender: TObject);
    procedure TipoActivo1Click(Sender: TObject);
    procedure MaestroActivos1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Depreciacion1Click(Sender: TObject);
    procedure PosteoDepreciacionMensual1Click(Sender: TObject);
    procedure ContabilizarDepreciacion1Click(Sender: TObject);
    procedure CuentasActivos1Click(Sender: TObject);
    procedure ActivoFijo1Click(Sender: TObject);
    procedure Ayuda1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RutaBasedeDatos1Click(Sender: TObject);
    procedure Depreciacion2Click(Sender: TObject);
  private
    { Private declarations }
    Procedure ShowHint(Sender: TObject);    
    procedure AppMessage(var Msg: TMsg; var Handled: Boolean);
  public
    { Public declarations }
  end;

var
  frmMenuP: TfrmMenuP;

implementation

uses UTipoActivo, UMaestroActivos, UCalculoDepMensual, UPosteoTrnDepre,
  UContDepreciacionActivos, UDistribucionCtaActivos, URepMaestroActivos,
  UDatModuloActivos,UGlobalActivos, UConectar, UConsultaDepreciacion;

{$R *.DFM}

procedure TfrmMenuP.AppMessage(var Msg: TMsg; var Handled: Boolean);
var
   actual: TWinControl;
begin
  if Msg.message = WM_KEYDOWN then
     if Msg.WParam = VK_RETURN then
        begin
          Actual := Screen.ActiveControl;
          if (actual is TButton) or (actual is TDBMemo) or
             (actual is TMemo) then
             exit
          else
             Msg.wParam := VK_TAB;
        end;
end;

procedure TfrmMenuP.Salir1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmMenuP.Salir2Click(Sender: TObject);
begin
  Salir1Click(Self);
end;

procedure TfrmMenuP.TipoActivo1Click(Sender: TObject);
begin
  frmTipoActivo:=TfrmTipoActivo.Create(nil);
  try
    frmTipoActivo.ShowModal;
  finally
  frmTipoActivo.free;
  frmTipoActivo:=nil;
  end;
end;

procedure TfrmMenuP.MaestroActivos1Click(Sender: TObject);
begin
  frmMaestroActivos:=TfrmMaestroActivos.Create(nil);
  try
    frmMaestroActivos.Showmodal;
  finally
  frmMaestroActivos.free;
  frmMaestroActivos:=nil;
  end;
end;

procedure TfrmMenuP.FormCreate(Sender: TObject);
begin
  Application.OnMessage := AppMessage;
  Application.OnHint := ShowHint;
  label1.Visible:=false;
end;


procedure TfrmMenuP.ShowHint(Sender: TObject);
begin
  StatusBar1.Panels[0].Text := Application.Hint;
end;

procedure TfrmMenuP.Depreciacion1Click(Sender: TObject);
begin
   frmCalculoDepMensual:=TfrmCalculoDepMensual.Create(nil);
   try
     frmCalculoDepMensual.Showmodal;
   finally
   frmCalculoDepMensual.free;
   frmCalculoDepMensual:=nil;
   end;
end;

procedure TfrmMenuP.PosteoDepreciacionMensual1Click(Sender: TObject);
begin
  frmPosteoTransDepre:= TfrmPosteoTransDepre.Create(nil);
  try
    frmPosteoTransDepre.Showmodal;
  finally
  frmPosteoTransDepre.free;
  frmPosteoTransDepre:=nil;
  end;
end;

procedure TfrmMenuP.ContabilizarDepreciacion1Click(Sender: TObject);
begin
  frmContDepreciacion:=TfrmContDepreciacion.Create(nil);
  try
    frmContDepreciacion.showmodal;
  finally
  frmContDepreciacion.free;
  frmContDepreciacion:=nil;
  end;
end;

procedure TfrmMenuP.CuentasActivos1Click(Sender: TObject);
begin
  frmCtasActivos:=TfrmCtasActivos.Create(nil);
  try
    frmCtasActivos.ShowModal;
  finally
  frmCtasActivos.Free;
  frmCtasActivos:= Nil;
  end;
end;

procedure TfrmMenuP.ActivoFijo1Click(Sender: TObject);
begin
  dm.qryMaestroActivos.Close;
  //dm.qryMaestroActivos.Filter:='STATUS_ACTIVO = '+chr(39)+'A'+chr(39)+
  //                             ' or STATUS_ACTIVO = '+chr(39)+' '+chr(39)+
  //                             ' or STATUS_ACTIVO is null';
  dm.qryMaestroActivos.Filtered:=false;
  //dm.qryMaestroActivos.Filtered:=True;
  dm.qryMaestroActivos.Open;
  qckMaestroActivos:=TqckMaestroActivos.Create(nil);
  try
    qckMaestroActivos.Prepare;
    GlbTPag := qckMaestroActivos.PageNumber;
  finally
  qckMaestroActivos.QRPrinter.Free;
  qckMaestroActivos := Nil;
  end;

  qckMaestroActivos:=TqckMaestroActivos.Create(nil);
  try
    qckMaestroActivos.Preview;
  finally
  qckMaestroActivos.Free;
  qckMaestroActivos:=nil;
  end;
end;

procedure TfrmMenuP.Ayuda1Click(Sender: TObject);
begin
  Application.HelpJump('TApplication_HelpJump');
end;

procedure TfrmMenuP.FormShow(Sender: TObject);
begin
  if StrToInt(FormatDatetime('mm',now)) >9 then
  begin
    MessageDlg('ESTA VERSION ESTA VENCIDA, VERIFIQUE',mtError,[mbok],0);
    Activos1.Enabled:=FALSE;
    Reportes1.Enabled:=FALSE;
    label1.Visible:=true;
    label1.Caption:='ESTA VERSION ESTA VENCIDA, VERIFIQUE -NOSIVID@HOTMAIL.COM';
  end;
end;

procedure TfrmMenuP.RutaBasedeDatos1Click(Sender: TObject);
begin
  frmInciaConeccion:=TfrmInciaConeccion.Create(Nil);
  try
    frmInciaConeccion.showmodal;
  finally
  frmInciaConeccion.Free;
  frmInciaConeccion:=Nil;
  end;
end;

procedure TfrmMenuP.Depreciacion2Click(Sender: TObject);
begin
  frmConsultaDepreciacion:=TfrmConsultaDepreciacion.Create(Nil);
  try
    frmConsultaDepreciacion.Showmodal;
  finally
  frmConsultaDepreciacion.Free;
  frmConsultaDepreciacion:=Nil;
  end;
end;

end.
