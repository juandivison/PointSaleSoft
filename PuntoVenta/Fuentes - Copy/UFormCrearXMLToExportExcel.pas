unit UFormCrearXMLToExportExcel;
///GLBRUTADB="IngerService"
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    ShellApi, xmldom, XMLIntf, XMLDoc, Dialogs, StdCtrls, Buttons, msxmldom, DB;


type
  TfrmExportarRepXML = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    XMLDocument1: TXMLDocument;
    Memo1: TMemo;
    Button1: TButton;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);

  private


  public
    { Public declarations }
    IsTesting : Boolean;
  end;

var
  frmExportarRepXML: TfrmExportarRepXML;

implementation
uses UEXPORTFACTTOXML, UDatModFactura, UFormFacturas, UGlobal,
  UDatModCompania;
{$R *.dfm}


procedure TfrmExportarRepXML.BitBtn2Click(Sender: TObject);
var
  xml : IXMLWorkSheet;
  sheetData : IXMLSheetData;
  arraydata : IXMLArrayData;
  item : IXMLItem;
  itemarray : IXMLItem;
  header : IXMLHeader;
  footer : IXMLFooter;
  tag : IXMLTag;
  idxCampo : Integer;
  field : TField;

begin
{
function GetWorkSheet(Doc: IXMLDocument): IXMLWorkSheet;
function LoadWorkSheet(const FileName: WideString): IXMLWorkSheet;
function NewWorkSheet: IXMLWorkSheet;
}
  xml := NewWorkSheet;

  dmFactura.tblTemplateMaster.Close;
  dmFactura.tblTemplateMaster.Open;
  dmFactura.strFilterSeccion := 'HEADER';
  dmFactura.tblTemplateDet.Filtered := False;
  dmFactura.tblTemplateDet.Filtered := True;
  dmFactura.tblTemplateDet.Close;
  dmFactura.tblTemplateDet.Open;
  header:= xml.Header;

  if IsTesting then
  begin
    frmConsultaFacturas:=TfrmConsultaFacturas.Create(Nil);
    try
      frmConsultaFacturas.BitBtn2.Caption:='&Aceptar';
      if frmConsultaFacturas.Showmodal = mrOK then
      begin
        dmFactura.qryVentaFactura.Close;
        dmFactura.qryVentaFactura.SQL.Text:=
        dmFactura.qryVentaFactura_0.SQL.Text + ' Where VENTAS_MAST.NUMERO_FACTURA =:numero '+
        ' And ventas_mast.cia_key =:ciakey';
        dmFactura.qryVentaFactura.Params[0].Value := frmConsultaFacturas.EditN1.ValueInteger;
        dmFactura.qryVentaFactura.Params[1].Value := glbCia_Key;
      end;
    finally
    frmConsultaFacturas.Free;
    frmConsultaFacturas:= Nil;
    end;
    dmFactura.qryVentaFactura.Open;
  end;
  dmFactura.tblTemplateDet.First;
  While Not dmFactura.tblTemplateDet.Eof do
  begin
    tag :=  header.Add;
    tag.Name := dmFactura.tblTemplateDetDESCRIPCION_LABEL.Value;//dmFactura.tblTemplateDetNOMBRE_CAMPO.Value;
    idxCampo := 0;
    try
      field := dmFactura.qryVentaFactura.FieldByName(dmFactura.tblTemplateDetNOMBRE_CAMPO.Value);
      idxCampo := dmFactura.qryVentaFactura.Fields.IndexOf(field);
    except
    end;

    //dmFactura.tblTemplateDetNOMBRE_CAMPO.AsString));

    try
    if (idxCampo >=0) then
    begin
      if (Length(Trim(dmFactura.tblTemplateDetNOMBRE_CAMPO.Value)) > 0) then
      tag.Value:= dmFactura.qryVentaFactura.FieldByName(dmFactura.tblTemplateDetNOMBRE_CAMPO.Value).AsString
      else
      tag.Value := '';
    end else
    begin
      tag.Value := '';
    end;
    except
    end;
    dmFactura.tblTemplateDet.Next;
  end;
  {item := xml.SheetData;
  item.Name:='itemname';
  item.Value:='itemvalue';
  sheetData.ArrayData.Add(item)
  }
  sheetData := xml.SheetData;
  sheetData.OrginalRange := '17:44';
  arraydata := sheetData.ArrayData;

  dmFactura.strFilterSeccion := 'DETAIL';
  dmFactura.tblTemplateDet.Filtered := False;
  dmFactura.tblTemplateDet.Filtered := True;
  dmFactura.tblTemplateDet.First;
  While Not dmFactura.tblTemplateDet.Eof do
  begin
    itemarray := sheetData.ArrayData.Add;
    itemarray.Name :=  dmFactura.tblTemplateDetDESCRIPCION_LABEL.Value;
    idxCampo := 0;
    try
      field := dmFactura.qryVentaFacturaDet.FieldByName(dmFactura.tblTemplateDetNOMBRE_CAMPO.Value);
      idxCampo := dmFactura.qryVentaFacturaDet.Fields.IndexOf(field);
   except
    end;
    //dmFactura.tblTemplateDetNOMBRE_CAMPO.AsString));

    try
    if (idxCampo >=0) then
    begin
      //xml.SheetData.ArrayData.Add;
      if (Length(Trim(dmFactura.tblTemplateDetNOMBRE_CAMPO.Value)) > 0) then
      itemarray.Value:= dmFactura.qryVentaFacturaDet.FieldByName(dmFactura.tblTemplateDetNOMBRE_CAMPO.Value).AsString
      else
      itemarray.Value := '';
    end else
    begin
      itemarray.Value := '';
    end;
    except
    end;
    //arraydata.Add;
    dmFactura.tblTemplateDet.Next;
  end;

  //Procesar Footer
  dmFactura.strFilterSeccion := 'FOOTER';
  dmFactura.tblTemplateDet.Filtered := False;
  dmFactura.tblTemplateDet.Filtered := True;  
  dmFactura.tblTemplateDet.First;
  footer := xml.Footer;
  While Not dmFactura.tblTemplateDet.Eof do
  begin
    tag :=  footer.Add;
    tag.Name := dmFactura.tblTemplateDetDESCRIPCION_LABEL.Value;
    idxCampo := 0;
    try
      field := dmFactura.qryVentaFactura.FieldByName(dmFactura.tblTemplateDetNOMBRE_CAMPO.Value);
      idxCampo := dmFactura.qryVentaFactura.Fields.IndexOf(field);
    except
    end;

    try
    if (idxCampo >=0) then
    begin
      if (Length(Trim(dmFactura.tblTemplateDetNOMBRE_CAMPO.Value)) > 0) then
      tag.Value:= dmFactura.qryVentaFactura.FieldByName(dmFactura.tblTemplateDetNOMBRE_CAMPO.Value).AsString
      else
      tag.Value := '';
    end else
    begin
      tag.Value := '';
    end;
    except
    end;
    dmFactura.tblTemplateDet.Next;
  end;

  memo1.Lines.Text:= '<?xml version="1.0"?>'+#13#10+xml.XML;
  dmcompania.tblCompania.Locate('CODIGO',GlbCodigoCia,[]);
  memo1.Lines.SaveToFile('Fact_'+dmcompania.tblCompaniaNOMBRE.Value+'_'+dmFactura.qryVentaFacturaNUMERO_FACTURA.AsString+'.xml');
  dmFactura.qryVentaFactura.Close;
end;

procedure TfrmExportarRepXML.FormCreate(Sender: TObject);
begin
  IsTesting:=False;
end;

procedure TfrmExportarRepXML.Button1Click(Sender: TObject);
var
  archivo : String;
begin
  archivo:=ExtractFilePath('C:\Proyectos\PointSaleSoftResp\PuntoVenta\ProgramExcelExport\Invoices.Importer.exe');
  //ShellExecute(0, 'Open', PChar(archivo), PChar(''), PChar(''), SW_SHOWNORMAL);

  ShellExecute(0, 'Open', PChar(archivo),
  PChar('/XmlData=C:\Proyectos\PointSaleSoftResp\PuntoVenta\Bin\Fact_REPUESTOS CASANDRA 2_1015.xml ' +
  '/Invoice=C:\Proyectos\PointSaleSoftResp\PuntoVenta\Bin\ArtiOfic /AutoX=true'),
  PChar(''), SW_SHOWNORMAL);

end;

end.
