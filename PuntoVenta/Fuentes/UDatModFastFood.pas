unit UDatModFastFood;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TdmFastfood = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADOQueryTicketDet: TADOQuery;
    ADOQryTicket: TADOQuery;
    ADOQueryTicketDetTICKET_ITEM_ID: TAutoIncField;
    ADOQueryTicketDetTICKET_ID: TIntegerField;
    ADOQueryTicketDetMENU_ITEM_ID: TIntegerField;
    ADOQueryTicketDetMENU_ITEM_COUNT: TIntegerField;
    ADOQueryTicketDetMENU_ITEM_NAME: TWideStringField;
    ADOQueryTicketDetMENU_GROUP_NAME: TWideStringField;
    ADOQueryTicketDetMENU_CATEGORY_NAME: TWideStringField;
    ADOQueryTicketDetMENU_ITEM_PRICE: TBCDField;
    ADOQueryTicketDetDISCOUNT_RATE: TFloatField;
    ADOQueryTicketDetTAX1_NAME: TWideStringField;
    ADOQueryTicketDetTAX1_ID: TIntegerField;
    ADOQueryTicketDetTAX1_RATE: TFloatField;
    ADOQueryTicketDetTAX1_AMOUNT: TBCDField;
    ADOQueryTicketDetTAX2_NAME: TWideStringField;
    ADOQueryTicketDetTAX2_ID: TIntegerField;
    ADOQueryTicketDetTAX2_RATE: TFloatField;
    ADOQueryTicketDetTAX2_AMOUNT: TBCDField;
    ADOQueryTicketDetTAX3_NAME: TWideStringField;
    ADOQueryTicketDetTAX3_ID: TIntegerField;
    ADOQueryTicketDetTAX3_RATE: TFloatField;
    ADOQueryTicketDetTAX3_AMOUNT: TBCDField;
    ADOQueryTicketDetTOTAL_PRICE_BT: TBCDField;
    ADOQueryTicketDetTOTAL_PRICE_WITH_MOD_BT: TBCDField;
    ADOQueryTicketDetTOTAL_TAX_WITH_MOD: TBCDField;
    ADOQueryTicketDetORDER_PRINTED_YN: TWideStringField;
    ADOQueryTicketDetORDER_ACCEPTED_YN: TWideStringField;
    ADOQueryTicketDetORDER_READY_YN: TWideStringField;
    ADOQueryTicketDetORDER_CANCELED_YN: TWideStringField;
    ADOQueryTicketDetCREATED_DATETIME: TDateTimeField;
    ADOQueryTicketDetCREATED_TERMINAL_NAME: TWideStringField;
    ADOQueryTicketDetCREATED_EMPLOYEE_ID: TIntegerField;
    ADOQueryTicketDetCREATED_ACTION_NAME: TWideStringField;
    ADOQueryTicketDetUPDATED_DATETIME: TDateTimeField;
    ADOQueryTicketDetUPDATED_TERMINAL_NAME: TWideStringField;
    ADOQueryTicketDetUPDATED_EMPLOYEE_ID: TIntegerField;
    ADOQueryTicketDetUPDATED_ACTION_NAME: TWideStringField;
    ADOQueryTicketDetHASH_KEY: TWideStringField;
    ADOQueryTicketDetSERVED_BY_EMPLOYEE_ID: TIntegerField;
    ADOQueryTicketDetSALE_BY_WEIGHT_YN: TWideStringField;
    ADOQueryTicketDetSALE_WEIGHT_UNIT: TWideStringField;
    ADOQueryTicketDetSALE_WEIGHT: TBCDField;
    ADOQueryTicketDetUNIT_COST: TBCDField;
    ADOQueryTicketDetSALE_BY_TIME_YN: TWideStringField;
    ADOQueryTicketDetSALE_BY_TIME_UNIT_NAME: TWideStringField;
    ADOQueryTicketDetSALE_BY_TIME_UNIT_MIN: TIntegerField;
    ADOQueryTicketDetSALE_BY_TIME_UNIT: TIntegerField;
    ADOQueryTicketDetSALE_BY_TIME_ROUND: TWideStringField;
    ADOQueryTicketDetSALE_BY_TIME_UNIT_MAX: TIntegerField;
    ADOQueryTicketDetSALE_BY_TIME_STARTUP_PRICE: TBCDField;
    ADOQueryTicketDetSALE_BY_TIME_SURCHARGE: TBCDField;
    ADOQueryTicketDetSALE_BY_TIME_USAGE: TIntegerField;
    ADOQueryTicketDetSALE_BY_TIME_FROM: TDateTimeField;
    ADOQueryTicketDetSALE_BY_TIME_TO: TDateTimeField;
    ADOQueryTicketDetMENU_ITEM_UPC: TWideStringField;
    ADOQueryTicketDetBARCODE: TWideStringField;
    ADOQueryTicketDetALTER_TAX_YN: TWideStringField;
    ADOQueryTicketDetEBT_YN: TWideStringField;
    tblAdoTICKET_ITEM: TADOQuery;
    ADOQryTicketTICKET_ID: TAutoIncField;
    ADOQryTicketCLoSED_DATETIME: TDateTimeField;
    ADOQryTicketupdated_datetime: TDateTimeField;
    ADOQryTicketcreated_datetime: TDateTimeField;
    ADOQryTicketCLOSED_YN: TWideStringField;
    ADOQryTicketpaid_yn: TWideStringField;
    ADOQryTicketCREATED_EMPLOYEE_ID: TIntegerField;
    ADOQryTicketCUSTOMER_ID: TIntegerField;
    ADOQryTicketDUE_AMOUNT: TBCDField;
    ADOQryTicketORDER_TYPE: TWideStringField;
    ADOQryTicketPAID_AMOUNT: TBCDField;
    ADOQryTicketSERVED_BY_EMPLOYEE_ID: TIntegerField;
    ADOQryTicketVOID_BY_EMPLOYEE_ID: TIntegerField;
    tblAdoTICKET_ITEMTICKET_ITEM_ID: TAutoIncField;
    tblAdoTICKET_ITEMTICKET_ID: TIntegerField;
    tblAdoTICKET_ITEMMENU_ITEM_ID: TIntegerField;
    tblAdoTICKET_ITEMMENU_ITEM_COUNT: TIntegerField;
    tblAdoTICKET_ITEMMENU_ITEM_NAME: TWideStringField;
    tblAdoTICKET_ITEMMENU_GROUP_NAME: TWideStringField;
    tblAdoTICKET_ITEMMENU_CATEGORY_NAME: TWideStringField;
    tblAdoTICKET_ITEMMENU_ITEM_PRICE: TBCDField;
    tblAdoTICKET_ITEMDISCOUNT_RATE: TFloatField;
    tblAdoTICKET_ITEMTAX1_NAME: TWideStringField;
    tblAdoTICKET_ITEMTAX1_ID: TIntegerField;
    tblAdoTICKET_ITEMTAX1_RATE: TFloatField;
    tblAdoTICKET_ITEMTAX1_AMOUNT: TBCDField;
    tblAdoTICKET_ITEMTAX2_NAME: TWideStringField;
    tblAdoTICKET_ITEMTAX2_ID: TIntegerField;
    tblAdoTICKET_ITEMTAX2_RATE: TFloatField;
    tblAdoTICKET_ITEMTAX2_AMOUNT: TBCDField;
    tblAdoTICKET_ITEMTAX3_NAME: TWideStringField;
    tblAdoTICKET_ITEMTAX3_ID: TIntegerField;
    tblAdoTICKET_ITEMTAX3_RATE: TFloatField;
    tblAdoTICKET_ITEMTAX3_AMOUNT: TBCDField;
    tblAdoTICKET_ITEMTOTAL_PRICE_BT: TBCDField;
    tblAdoTICKET_ITEMTOTAL_PRICE_WITH_MOD_BT: TBCDField;
    tblAdoTICKET_ITEMTOTAL_TAX_WITH_MOD: TBCDField;
    tblAdoTICKET_ITEMORDER_PRINTED_YN: TWideStringField;
    tblAdoTICKET_ITEMORDER_ACCEPTED_YN: TWideStringField;
    tblAdoTICKET_ITEMORDER_READY_YN: TWideStringField;
    tblAdoTICKET_ITEMORDER_CANCELED_YN: TWideStringField;
    tblAdoTICKET_ITEMCREATED_DATETIME: TDateTimeField;
    tblAdoTICKET_ITEMCREATED_TERMINAL_NAME: TWideStringField;
    tblAdoTICKET_ITEMCREATED_EMPLOYEE_ID: TIntegerField;
    tblAdoTICKET_ITEMCREATED_ACTION_NAME: TWideStringField;
    tblAdoTICKET_ITEMUPDATED_DATETIME: TDateTimeField;
    tblAdoTICKET_ITEMUPDATED_TERMINAL_NAME: TWideStringField;
    tblAdoTICKET_ITEMUPDATED_EMPLOYEE_ID: TIntegerField;
    tblAdoTICKET_ITEMUPDATED_ACTION_NAME: TWideStringField;
    tblAdoTICKET_ITEMHASH_KEY: TWideStringField;
    tblAdoTICKET_ITEMSERVED_BY_EMPLOYEE_ID: TIntegerField;
    tblAdoTICKET_ITEMSALE_BY_WEIGHT_YN: TWideStringField;
    tblAdoTICKET_ITEMSALE_WEIGHT_UNIT: TWideStringField;
    tblAdoTICKET_ITEMSALE_WEIGHT: TBCDField;
    tblAdoTICKET_ITEMUNIT_COST: TBCDField;
    tblAdoTICKET_ITEMSALE_BY_TIME_YN: TWideStringField;
    tblAdoTICKET_ITEMSALE_BY_TIME_UNIT_NAME: TWideStringField;
    tblAdoTICKET_ITEMSALE_BY_TIME_UNIT_MIN: TIntegerField;
    tblAdoTICKET_ITEMSALE_BY_TIME_UNIT: TIntegerField;
    tblAdoTICKET_ITEMSALE_BY_TIME_ROUND: TWideStringField;
    tblAdoTICKET_ITEMSALE_BY_TIME_UNIT_MAX: TIntegerField;
    tblAdoTICKET_ITEMSALE_BY_TIME_STARTUP_PRICE: TBCDField;
    tblAdoTICKET_ITEMSALE_BY_TIME_SURCHARGE: TBCDField;
    tblAdoTICKET_ITEMSALE_BY_TIME_USAGE: TIntegerField;
    tblAdoTICKET_ITEMSALE_BY_TIME_FROM: TDateTimeField;
    tblAdoTICKET_ITEMSALE_BY_TIME_TO: TDateTimeField;
    tblAdoTICKET_ITEMMENU_ITEM_UPC: TWideStringField;
    tblAdoTICKET_ITEMBARCODE: TWideStringField;
    tblAdoTICKET_ITEMALTER_TAX_YN: TWideStringField;
    tblAdoTICKET_ITEMEBT_YN: TWideStringField;
    ADOQryTicketProcessFiscalYN: TWideStringField;
    tblAdoTicketUpdate: TADODataSet;
    tblAdoTicketUpdateTicket_ID: TAutoIncField;
    tblAdoTicketUpdateProcessFiscalYN: TWideStringField;
    tblMenuItem: TADOQuery;
    tblMenuItemmenu_item_id: TAutoIncField;
    tblMenuItemmenu_item_name: TWideStringField;
    tblMenuItemprice1: TBCDField;
    tblMenuItempicture_name: TWideStringField;
    tblMenuItemqty: TIntegerField;
    tblMenuItemtax_group_id: TIntegerField;
    tblMenuItemtax_item_id1: TIntegerField;
    tblMenuItemtax_item_id2: TIntegerField;
    tblMenuItemcost: TBCDField;
    procedure ADOQryTicketAfterScroll(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmFastfood: TdmFastfood;

implementation
uses uGlobal;

{$R *.dfm}

procedure TdmFastfood.ADOQryTicketAfterScroll(DataSet: TDataSet);
begin
  tblAdoTICKET_ITEM.Close;
  tblAdoTICKET_ITEM.Parameters.Items[0].Value :=  ADOQryTicketTICKET_ID.Value;
  tblAdoTICKET_ITEM.Open;
end;

procedure TdmFastfood.DataModuleCreate(Sender: TObject);
begin
  if (GlbAccessDBConn <> '') then
  ADOConnection1.ConnectionString:=GlbAccessDBConn;
end;

end.
