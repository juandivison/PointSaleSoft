unit UImprimirzebralabel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs,
  Printers, StdCtrls, WinSpool, Buttons;

type
  TfrmImpZebraLabel = class(TForm)
    Button1: TButton;
    cboxImpresoras: TComboBox;
    Label1: TLabel;
    Memo1: TMemo;
    Memo2: TMemo;
    btnGuardar: TBitBtn;
    edtNombreFileZPL: TEdit;
    btnReset: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnGuardarClick(Sender: TObject);
    procedure btnResetClick(Sender: TObject);

  private
    procedure ImprimirLabelZebraZPL(const ZPLLabel: AnsiString;
      const PrinterName: string);
    procedure ProcResetLabel(FFile:String);

    { Private declarations }
  public
    desctuni:ansistring;
    procedure CargarConfLabel;
    procedure EjemploImprimirLabel;overload;
    procedure EjemploImprimirLabel(cia:AnsiString;
              Telefono:AnsiString;descprod:AnsiString;precioprod:AnsiString;
              codigoprod:AnsiString;cboxImpresorastext:AnsiString;desctipounidadprod:AnsiString);overload;
  end;

var
  frmImpZebraLabel: TfrmImpZebraLabel;

implementation
  uses uglobal;

{$R *.dfm}

procedure TfrmImpZebraLabel.Button1Click(Sender: TObject);
begin
  EjemploImprimirLabel;
end;


procedure TfrmImpZebraLabel.ImprimirLabelZebraZPL(const ZPLLabel: AnsiString; const PrinterName: string);
var
  PrinterHandle: THandle;
  DocumentInfo: TDocInfo1;
  BytesWritten: DWORD;
begin
  // Abrir la impresora
  if (ZPLLabel = '') then
  begin
    ShowMessage('Nada para imprimir, verifique');
    exit;
  end;
  if not OpenPrinter(PChar(PrinterName), PrinterHandle, nil) then
    RaiseLastOSError;

  try
    // Iniciar un nuevo documento de impresión
    FillChar(DocumentInfo, SizeOf(DocumentInfo), 0);
    DocumentInfo.pDocName := 'Etiqueta ZPL';
    DocumentInfo.pOutputFile := nil;
    DocumentInfo.pDatatype := 'RAW';
    if StartDocPrinter(PrinterHandle, 1, @DocumentInfo) = 0 then
      RaiseLastOSError;

    // Iniciar una nueva página de impresión
    if not StartPagePrinter(PrinterHandle) then
      RaiseLastOSError;

    // Enviar el comando ZPL a la impresora
    if not WritePrinter(PrinterHandle, PAnsiChar(ZPLLabel), Length(ZPLLabel), BytesWritten) then
      RaiseLastOSError;

    // Finalizar la página de impresión
    if not EndPagePrinter(PrinterHandle) then
      RaiseLastOSError;

    // Finalizar el documento de impresión
    if not EndDocPrinter(PrinterHandle) then
      RaiseLastOSError;
  finally
    // Cerrar la impresora
    ClosePrinter(PrinterHandle);
  end;
end;

procedure TfrmImpZebraLabel.EjemploImprimirLabel;
var
  ZPLLabel: AnsiString;
begin
  // Contenido del label en formato ZPL
  ZPLLabel := Memo1.Text;
{    '^XA' +
    '^FO100,50^A0N,25,25^FDEl Tejedor^FS' +
    '^FO100,100^A0N,18,18^FD809-309-5001^FS' +
    '^FO100,150^A0N,18,18^FDCodigo: 1000^FS' +
    '^FO100,200^A0N,25,25^FDCOMPUTADORA DE ESCRITORIO^FS' +
    '^FO100,250^A0N,18,18^FDPRECIO RD\$225.00^FS' +
    '^FO50,300^BY2,3,150^B3N,N,100,Y,N^FD1000^FS' +
    '^XZ';}

  // Imprimir el label en la impresora Zebra
  ImprimirLabelZebraZPL(ZPLLabel, cboxImpresoras.text);
end;


procedure TfrmImpZebraLabel.EjemploImprimirLabel(cia:AnsiString;
Telefono:AnsiString;descprod:AnsiString;precioprod:AnsiString;
codigoprod:AnsiString;cboxImpresorastext:AnsiString;desctipounidadprod:AnsiString);
var
  ZPLLabel: AnsiString;
begin
  // Contenido del label en formato ZPL
  {
^XA
^FO10,10^A0N,16,26^FDEL TEJEDOR^FS
^FO10,30^A0N,12,20^FD809-309-5001^FS
^FO10,44^A0N,12,12^FDJACKQUARD LISO YACAL DE 108"^FS
^FO10,58^A0N,12,14^FDPRECIO RD\$225.00^FS
^FO10,72^BY2,3,10^B3N,N,30,Y,N^FD1000^FS
^XZ
  }
  {
  ^XA
  ^FO10,10^A0N,16,26^FD[nombrecia]^FS
  ^FO10,30^A0N,12,20^FD[telefonocia]^FS
  ^FO10,44^A0N,12,12^FD[descripcionproducto]^FS
  ^FO10,58^A0N,12,14^FDPRECIO RD\$[precioprod]^FS
  ^FO10,72^BY2,3,10^B3N,N,30,Y,N^FD[codigoprod]^FS
  ^XZ
  }
  Memo1.text:=StringReplace(Memo1.text,'[nombrecia]',cia,[rfReplaceAll]);
  Memo1.text:=StringReplace(Memo1.text,'[telefonocia]',Telefono,[rfReplaceAll]);
  Memo1.text:=StringReplace(Memo1.text,'[descripcionproducto]',descprod,[rfReplaceAll]);
  Memo1.text:=StringReplace(Memo1.text,'[tipounidad]',desctipounidadprod,[rfReplaceAll]);
  Memo1.text:=StringReplace(Memo1.text,'[precioprod]',precioprod,[rfReplaceAll]);
  Memo1.text:=StringReplace(Memo1.text,'[codigoprod]',codigoprod,[rfReplaceAll]);
  ZPLLabel := Memo1.Text;
  // Imprimir el label en la impresora Zebra
  if not frmImpZebraLabel.showing then
  ImprimirLabelZebraZPL(Memo1.text, cboxImpresorastext)
  else
  ImprimirLabelZebraZPL(ZPLLabel, cboxImpresoras.text);
  Memo1.Lines.Clear;
  Memo1.Text:=Memo2.Text;
end;

procedure TfrmImpZebraLabel.FormCreate(Sender: TObject);
begin
  cboxImpresoras.Items.Assign(Printer.Printers);
end;


procedure TfrmImpZebraLabel.btnGuardarClick(Sender: TObject);
var
  _file : string;
begin
  if (edtNombreFileZPL.Text = '') then
  begin
    MessageDlg('Indique nombre del archivo con extensión zpl',mtError,[mbok],0);
    exit;
  end;
 _file:=ExtractFilePath(Application.ExeName)+edtNombreFileZPL.Text;
 if (ExtractFileExt(_file) <> '.zpl') then
 begin
    MessageDlg('La extensión debe ser zpl',mtError,[mbok],0);
    Exit;
 end;
 Memo2.Text:=Memo1.Text;
 Memo1.Lines.SaveToFile(_file);
end;

procedure TfrmImpZebraLabel.btnResetClick(Sender: TObject);
var
  _filename : string;
begin
  _filename:=ExtractFilePath(Application.ExeName)+'LabelZPLDefault.zpl';
  if FileExists(_filename) then
     ProcResetLabel(_filename)
  else
  begin
    _filename:=ExtractFilePath(Application.ExeName)+GlbRutaConfZPL;
    if FileExists(_filename) then
       ProcResetLabel(_filename)
  end;
end;

procedure TfrmImpZebraLabel.ProcResetLabel(FFile:String);
begin
 if FileExists(FFile) then
 begin
   Memo2.Clear;
   Memo2.Lines.LoadFromFile(FFile);
 end;
 if (Memo2.Lines.Count > 0) then
 Memo1.Text:=Memo2.Text;
end;

procedure TfrmImpZebraLabel.CargarConfLabel;
var
  _filename : string;
begin
  _filename:=ExtractFilePath(Application.ExeName)+GlbRutaConfZPL;
  if FileExists(_filename) then
  begin
    Memo1.lines.Clear;
    Memo1.lines.LoadFromFile(_filename);
    Memo2.Text:=Memo1.Text;
  end else
  begin
    _filename:=ExtractFilePath(Application.ExeName)+'LabelZPLDefault.zpl';
    if FileExists(_filename) then
    begin
      Memo1.lines.LoadFromFile(_filename);
      Memo2.Lines.Clear;
      Memo2.Text:=Memo1.Text;
    end else
    begin
      //MessageDlg('Archivo de configuracion ZPL no existe, será creado con valores default.',mtError,[mbok],0);
      if Memo2.Lines.Count > 0 then
      Memo2.Lines.SaveToFile(_filename);
      Memo2.Lines.SaveToFile(ExtractFilePath(Application.ExeName)+GlbRutaConfZPL);
      Exit;
    end;
  end;
end;

end.
