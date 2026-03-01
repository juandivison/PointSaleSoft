
{***************************************************************************************************}
{                                                                                                   }
{                                         XML Data Binding                                          }
{                                                                                                   }
{         Generated on: 7/21/2013 2:39:35 PM                                                        }
{       Generated from: C:\Proyectos\PointSaleSoftResp\PuntoVenta\ExcelTemplate\ejemplo.xsd         }
{   Settings stored in: C:\Proyectos\PointSaleSoftResp\PuntoVenta\ExcelTemplate\ExporttoExcel.xdb   }
{                                                                                                   }
{***************************************************************************************************}

unit UEXPORTFACTTOXML;

interface

uses xmldom, XMLDoc, XMLIntf;

type

{ Forward Decls }

  IXMLWorkSheet = interface;
  IXMLHeader = interface;
  IXMLTag = interface;
  IXMLSheetData = interface;
  IXMLArrayData = interface;
  IXMLItem = interface;
  IXMLFooter = interface;


{ IXMLWorkSheet }

  IXMLWorkSheet = interface(IXMLNode)
    ['{E7D83246-0C1B-434B-BECD-0F220A6A2A7A}']
    { Property Accessors }
    function Get_Header: IXMLHeader;
    function Get_SheetData: IXMLSheetData;
    function Get_Footer: IXMLFooter;
    { Methods & Properties }
    property Header: IXMLHeader read Get_Header;
    property SheetData: IXMLSheetData read Get_SheetData;
    property Footer: IXMLFooter read Get_Footer;
  end;

{ IXMLHeader }

  IXMLHeader = interface(IXMLNodeCollection)
    ['{C287AF5D-D9BF-4DC7-99F3-43B225D35016}']
    { Property Accessors }
    function Get_Tag(Index: Integer): IXMLTag;
    { Methods & Properties }
    function Add: IXMLTag;
    function Insert(const Index: Integer): IXMLTag;
    property Tag[Index: Integer]: IXMLTag read Get_Tag; default;
  end;

{ IXMLTag }

  IXMLTag = interface(IXMLNode)
    ['{24252ABF-F528-4705-9FC8-4DBD42C485E4}']
    { Property Accessors }
    function Get_Name: WideString;
    function Get_Value: WideString;
    procedure Set_Name(Value: WideString);
    procedure Set_Value(Value: WideString);
    { Methods & Properties }
    property Name: WideString read Get_Name write Set_Name;
    property Value: WideString read Get_Value write Set_Value;
  end;

{ IXMLSheetData }

  IXMLSheetData = interface(IXMLNode)
    ['{4D3DFA13-EDC7-42A1-ACA8-F926D96A0DF4}']
    { Property Accessors }
    function Get_OrginalRange: WideString;
    function Get_ArrayData: IXMLArrayData;
    procedure Set_OrginalRange(Value: WideString);
    { Methods & Properties }
    property OrginalRange: WideString read Get_OrginalRange write Set_OrginalRange;
    property ArrayData: IXMLArrayData read Get_ArrayData;
  end;

{ IXMLArrayData }

  IXMLArrayData = interface(IXMLNodeCollection)
    ['{F0C9BE3C-D016-49EF-BE0B-FFD54952E14A}']
    { Property Accessors }
    function Get_Item(Index: Integer): IXMLItem;
    { Methods & Properties }
    function Add: IXMLItem;
    function Insert(const Index: Integer): IXMLItem;
    property Item[Index: Integer]: IXMLItem read Get_Item; default;
  end;

{ IXMLItem }

  IXMLItem = interface(IXMLNode)
    ['{B17F4BB3-10FE-48BD-A48E-15BB31D8E501}']
    { Property Accessors }
    function Get_Name: WideString;
    function Get_Value: WideString;
    procedure Set_Name(Value: WideString);
    procedure Set_Value(Value: WideString);
    { Methods & Properties }
    property Name: WideString read Get_Name write Set_Name;
    property Value: WideString read Get_Value write Set_Value;
  end;

{ IXMLFooter }

  IXMLFooter = interface(IXMLNodeCollection)
    ['{9E00157B-A4CE-4F2A-8291-C5A62CD99341}']
    { Property Accessors }
    function Get_Tag(Index: Integer): IXMLTag;
    { Methods & Properties }
    function Add: IXMLTag;
    function Insert(const Index: Integer): IXMLTag;
    property Tag[Index: Integer]: IXMLTag read Get_Tag; default;
  end;

{ Forward Decls }

  TXMLWorkSheet = class;
  TXMLHeader = class;
  TXMLTag = class;
  TXMLSheetData = class;
  TXMLArrayData = class;
  TXMLItem = class;
  TXMLFooter = class;
  //TXMLTag = class;

{ TXMLWorkSheet }

  TXMLWorkSheet = class(TXMLNode, IXMLWorkSheet)
  protected
    { IXMLWorkSheet }
    function Get_Header: IXMLHeader;
    function Get_SheetData: IXMLSheetData;
    function Get_Footer: IXMLFooter;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLHeader }

  TXMLHeader = class(TXMLNodeCollection, IXMLHeader)
  protected
    { IXMLHeader }
    function Get_Tag(Index: Integer): IXMLTag;
    function Add: IXMLTag;
    function Insert(const Index: Integer): IXMLTag;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLTag }

  TXMLTag = class(TXMLNode, IXMLTag)
  protected
    { IXMLTag }
    function Get_Name: WideString;
    function Get_Value: WideString;
    procedure Set_Name(Value: WideString);
    procedure Set_Value(Value: WideString);
  end;

{ TXMLSheetData }

  TXMLSheetData = class(TXMLNode, IXMLSheetData)
  protected
    { IXMLSheetData }
    function Get_OrginalRange: WideString;
    function Get_ArrayData: IXMLArrayData;
    procedure Set_OrginalRange(Value: WideString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLArrayData }

  TXMLArrayData = class(TXMLNodeCollection, IXMLArrayData)
  protected
    { IXMLArrayData }
    function Get_Item(Index: Integer): IXMLItem;
    function Add: IXMLItem;
    function Insert(const Index: Integer): IXMLItem;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLItem }

  TXMLItem = class(TXMLNode, IXMLItem)
  protected
    { IXMLItem }
    function Get_Name: WideString;
    function Get_Value: WideString;
    procedure Set_Name(Value: WideString);
    procedure Set_Value(Value: WideString);
  end;

{ TXMLFooter }

  TXMLFooter = class(TXMLNodeCollection, IXMLFooter)
  protected
    { IXMLFooter }
    function Get_Tag(Index: Integer): IXMLTag;
    function Add: IXMLTag;
    function Insert(const Index: Integer): IXMLTag;
  public
    procedure AfterConstruction; override;
  end;

{ Global Functions }

function GetWorkSheet(Doc: IXMLDocument): IXMLWorkSheet;
function LoadWorkSheet(const FileName: WideString): IXMLWorkSheet;
function NewWorkSheet: IXMLWorkSheet;

const
  TargetNamespace = '';

implementation

{ Global Functions }

function GetWorkSheet(Doc: IXMLDocument): IXMLWorkSheet;
begin
  Result :=Doc.GetDocBinding('WorkSheet', TXMLWorkSheet, TargetNamespace) as IXMLWorkSheet;
end;

function LoadWorkSheet(const FileName: WideString): IXMLWorkSheet;
begin
  Result := LoadXMLDocument(FileName).GetDocBinding('WorkSheet', TXMLWorkSheet, TargetNamespace) as IXMLWorkSheet;
end;

function NewWorkSheet: IXMLWorkSheet;
begin
  Result := NewXMLDocument.GetDocBinding('WorkSheet', TXMLWorkSheet, TargetNamespace) as IXMLWorkSheet;
end;

{ TXMLWorkSheet }

procedure TXMLWorkSheet.AfterConstruction;
begin
  RegisterChildNode('Header', TXMLHeader);
  RegisterChildNode('SheetData', TXMLSheetData);
  RegisterChildNode('Footer', TXMLFooter);
  inherited;
end;

function TXMLWorkSheet.Get_Header: IXMLHeader;
begin
  Result := ChildNodes['Header'] as IXMLHeader;
end;

function TXMLWorkSheet.Get_SheetData: IXMLSheetData;
begin
  Result := ChildNodes['SheetData'] as IXMLSheetData;
end;

function TXMLWorkSheet.Get_Footer: IXMLFooter;
begin
  Result := ChildNodes['Footer'] as IXMLFooter;
end;

{ TXMLHeader }

procedure TXMLHeader.AfterConstruction;
begin
  RegisterChildNode('Tag', TXMLTag);
  ItemTag := 'Tag';
  ItemInterface := IXMLTag;
  inherited;
end;

function TXMLHeader.Get_Tag(Index: Integer): IXMLTag;
begin
  Result := List[Index] as IXMLTag;
end;

function TXMLHeader.Add: IXMLTag;
begin
  Result := AddItem(-1) as IXMLTag;
end;

function TXMLHeader.Insert(const Index: Integer): IXMLTag;
begin
  Result := AddItem(Index) as IXMLTag;
end;

{ TXMLTag }

function TXMLTag.Get_Name: WideString;
begin
  Result := AttributeNodes['name'].Text;
end;

procedure TXMLTag.Set_Name(Value: WideString);
begin
  SetAttribute('name', Value);
end;

function TXMLTag.Get_Value: WideString;
begin
  Result := AttributeNodes['value'].Text;
end;

procedure TXMLTag.Set_Value(Value: WideString);
begin
  SetAttribute('value', Value);
end;

{ TXMLSheetData }

procedure TXMLSheetData.AfterConstruction;
begin
  RegisterChildNode('ArrayData', TXMLArrayData);
  inherited;
end;

function TXMLSheetData.Get_OrginalRange: WideString;
begin
  Result := AttributeNodes['OrginalRange'].Text;
end;

procedure TXMLSheetData.Set_OrginalRange(Value: WideString);
begin
  SetAttribute('OrginalRange', Value);
end;

function TXMLSheetData.Get_ArrayData: IXMLArrayData;
begin
  Result := ChildNodes['ArrayData'] as IXMLArrayData;
end;

{ TXMLArrayData }

procedure TXMLArrayData.AfterConstruction;
begin
  RegisterChildNode('item', TXMLItem);
  ItemTag := 'item';
  ItemInterface := IXMLItem;
  inherited;
end;

function TXMLArrayData.Get_Item(Index: Integer): IXMLItem;
begin
  Result := List[Index] as IXMLItem;
end;

function TXMLArrayData.Add: IXMLItem;
begin
  Result := AddItem(-1) as IXMLItem;
end;

function TXMLArrayData.Insert(const Index: Integer): IXMLItem;
begin
  Result := AddItem(Index) as IXMLItem;
end;

{ TXMLItem }

function TXMLItem.Get_Name: WideString;
begin
  Result := AttributeNodes['name'].Text;
end;

procedure TXMLItem.Set_Name(Value: WideString);
begin
  SetAttribute('name', Value);
end;

function TXMLItem.Get_Value: WideString;
begin
  Result := AttributeNodes['value'].Text;
end;

procedure TXMLItem.Set_Value(Value: WideString);
begin
  SetAttribute('value', Value);
end;

{ TXMLFooter }

procedure TXMLFooter.AfterConstruction;
begin
  RegisterChildNode('Tag', TXMLTag);
  ItemTag := 'Tag';
  ItemInterface := IXMLTag;
  inherited;
end;

function TXMLFooter.Get_Tag(Index: Integer): IXMLTag;
begin
  Result := List[Index] as IXMLTag;
end;

function TXMLFooter.Add: IXMLTag;
begin
  Result := AddItem(-1) as IXMLTag;
end;

function TXMLFooter.Insert(const Index: Integer): IXMLTag;
begin
  Result := AddItem(Index) as IXMLTag;
end;


end.