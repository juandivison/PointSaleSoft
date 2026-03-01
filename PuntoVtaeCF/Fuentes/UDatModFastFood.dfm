object dmFastfood: TdmFastfood
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 714
  Top = 225
  Height = 262
  Width = 512
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=D:\Proyectos\Datos\' +
      'Base de Datos BarArea31\BarArea31.mdb;Persist Security Info=Fals' +
      'e;'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 200
    Top = 16
  end
  object ADOQueryTicketDet: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'ticketid'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'Select * from TICKET_ITEM'
      'Where ticket_id =:ticketid')
    Left = 200
    Top = 72
    object ADOQueryTicketDetTICKET_ITEM_ID: TAutoIncField
      FieldName = 'TICKET_ITEM_ID'
      ReadOnly = True
    end
    object ADOQueryTicketDetTICKET_ID: TIntegerField
      FieldName = 'TICKET_ID'
    end
    object ADOQueryTicketDetMENU_ITEM_ID: TIntegerField
      FieldName = 'MENU_ITEM_ID'
    end
    object ADOQueryTicketDetMENU_ITEM_COUNT: TIntegerField
      FieldName = 'MENU_ITEM_COUNT'
    end
    object ADOQueryTicketDetMENU_ITEM_NAME: TWideStringField
      FieldName = 'MENU_ITEM_NAME'
      Size = 254
    end
    object ADOQueryTicketDetMENU_GROUP_NAME: TWideStringField
      FieldName = 'MENU_GROUP_NAME'
      Size = 40
    end
    object ADOQueryTicketDetMENU_CATEGORY_NAME: TWideStringField
      FieldName = 'MENU_CATEGORY_NAME'
      Size = 40
    end
    object ADOQueryTicketDetMENU_ITEM_PRICE: TBCDField
      FieldName = 'MENU_ITEM_PRICE'
      Precision = 19
    end
    object ADOQueryTicketDetDISCOUNT_RATE: TFloatField
      FieldName = 'DISCOUNT_RATE'
    end
    object ADOQueryTicketDetTAX1_NAME: TWideStringField
      FieldName = 'TAX1_NAME'
      Size = 40
    end
    object ADOQueryTicketDetTAX1_ID: TIntegerField
      FieldName = 'TAX1_ID'
    end
    object ADOQueryTicketDetTAX1_RATE: TFloatField
      FieldName = 'TAX1_RATE'
    end
    object ADOQueryTicketDetTAX1_AMOUNT: TBCDField
      FieldName = 'TAX1_AMOUNT'
      Precision = 19
    end
    object ADOQueryTicketDetTAX2_NAME: TWideStringField
      FieldName = 'TAX2_NAME'
      Size = 40
    end
    object ADOQueryTicketDetTAX2_ID: TIntegerField
      FieldName = 'TAX2_ID'
    end
    object ADOQueryTicketDetTAX2_RATE: TFloatField
      FieldName = 'TAX2_RATE'
    end
    object ADOQueryTicketDetTAX2_AMOUNT: TBCDField
      FieldName = 'TAX2_AMOUNT'
      Precision = 19
    end
    object ADOQueryTicketDetTAX3_NAME: TWideStringField
      FieldName = 'TAX3_NAME'
      Size = 40
    end
    object ADOQueryTicketDetTAX3_ID: TIntegerField
      FieldName = 'TAX3_ID'
    end
    object ADOQueryTicketDetTAX3_RATE: TFloatField
      FieldName = 'TAX3_RATE'
    end
    object ADOQueryTicketDetTAX3_AMOUNT: TBCDField
      FieldName = 'TAX3_AMOUNT'
      Precision = 19
    end
    object ADOQueryTicketDetTOTAL_PRICE_BT: TBCDField
      FieldName = 'TOTAL_PRICE_BT'
      Precision = 19
    end
    object ADOQueryTicketDetTOTAL_PRICE_WITH_MOD_BT: TBCDField
      FieldName = 'TOTAL_PRICE_WITH_MOD_BT'
      Precision = 19
    end
    object ADOQueryTicketDetTOTAL_TAX_WITH_MOD: TBCDField
      FieldName = 'TOTAL_TAX_WITH_MOD'
      Precision = 19
    end
    object ADOQueryTicketDetORDER_PRINTED_YN: TWideStringField
      FieldName = 'ORDER_PRINTED_YN'
      FixedChar = True
      Size = 1
    end
    object ADOQueryTicketDetORDER_ACCEPTED_YN: TWideStringField
      FieldName = 'ORDER_ACCEPTED_YN'
      FixedChar = True
      Size = 1
    end
    object ADOQueryTicketDetORDER_READY_YN: TWideStringField
      FieldName = 'ORDER_READY_YN'
      FixedChar = True
      Size = 1
    end
    object ADOQueryTicketDetORDER_CANCELED_YN: TWideStringField
      FieldName = 'ORDER_CANCELED_YN'
      FixedChar = True
      Size = 1
    end
    object ADOQueryTicketDetCREATED_DATETIME: TDateTimeField
      FieldName = 'CREATED_DATETIME'
    end
    object ADOQueryTicketDetCREATED_TERMINAL_NAME: TWideStringField
      FieldName = 'CREATED_TERMINAL_NAME'
      Size = 100
    end
    object ADOQueryTicketDetCREATED_EMPLOYEE_ID: TIntegerField
      FieldName = 'CREATED_EMPLOYEE_ID'
    end
    object ADOQueryTicketDetCREATED_ACTION_NAME: TWideStringField
      FieldName = 'CREATED_ACTION_NAME'
      Size = 100
    end
    object ADOQueryTicketDetUPDATED_DATETIME: TDateTimeField
      FieldName = 'UPDATED_DATETIME'
    end
    object ADOQueryTicketDetUPDATED_TERMINAL_NAME: TWideStringField
      FieldName = 'UPDATED_TERMINAL_NAME'
      Size = 100
    end
    object ADOQueryTicketDetUPDATED_EMPLOYEE_ID: TIntegerField
      FieldName = 'UPDATED_EMPLOYEE_ID'
    end
    object ADOQueryTicketDetUPDATED_ACTION_NAME: TWideStringField
      FieldName = 'UPDATED_ACTION_NAME'
      Size = 100
    end
    object ADOQueryTicketDetHASH_KEY: TWideStringField
      FieldName = 'HASH_KEY'
    end
    object ADOQueryTicketDetSERVED_BY_EMPLOYEE_ID: TIntegerField
      FieldName = 'SERVED_BY_EMPLOYEE_ID'
    end
    object ADOQueryTicketDetSALE_BY_WEIGHT_YN: TWideStringField
      FieldName = 'SALE_BY_WEIGHT_YN'
      FixedChar = True
      Size = 1
    end
    object ADOQueryTicketDetSALE_WEIGHT_UNIT: TWideStringField
      FieldName = 'SALE_WEIGHT_UNIT'
      Size = 10
    end
    object ADOQueryTicketDetSALE_WEIGHT: TBCDField
      FieldName = 'SALE_WEIGHT'
      Precision = 19
    end
    object ADOQueryTicketDetUNIT_COST: TBCDField
      FieldName = 'UNIT_COST'
      Precision = 19
    end
    object ADOQueryTicketDetSALE_BY_TIME_YN: TWideStringField
      FieldName = 'SALE_BY_TIME_YN'
      FixedChar = True
      Size = 1
    end
    object ADOQueryTicketDetSALE_BY_TIME_UNIT_NAME: TWideStringField
      FieldName = 'SALE_BY_TIME_UNIT_NAME'
      Size = 40
    end
    object ADOQueryTicketDetSALE_BY_TIME_UNIT_MIN: TIntegerField
      FieldName = 'SALE_BY_TIME_UNIT_MIN'
    end
    object ADOQueryTicketDetSALE_BY_TIME_UNIT: TIntegerField
      FieldName = 'SALE_BY_TIME_UNIT'
    end
    object ADOQueryTicketDetSALE_BY_TIME_ROUND: TWideStringField
      FieldName = 'SALE_BY_TIME_ROUND'
      Size = 40
    end
    object ADOQueryTicketDetSALE_BY_TIME_UNIT_MAX: TIntegerField
      FieldName = 'SALE_BY_TIME_UNIT_MAX'
    end
    object ADOQueryTicketDetSALE_BY_TIME_STARTUP_PRICE: TBCDField
      FieldName = 'SALE_BY_TIME_STARTUP_PRICE'
      Precision = 19
    end
    object ADOQueryTicketDetSALE_BY_TIME_SURCHARGE: TBCDField
      FieldName = 'SALE_BY_TIME_SURCHARGE'
      Precision = 19
    end
    object ADOQueryTicketDetSALE_BY_TIME_USAGE: TIntegerField
      FieldName = 'SALE_BY_TIME_USAGE'
    end
    object ADOQueryTicketDetSALE_BY_TIME_FROM: TDateTimeField
      FieldName = 'SALE_BY_TIME_FROM'
    end
    object ADOQueryTicketDetSALE_BY_TIME_TO: TDateTimeField
      FieldName = 'SALE_BY_TIME_TO'
    end
    object ADOQueryTicketDetMENU_ITEM_UPC: TWideStringField
      FieldName = 'MENU_ITEM_UPC'
      Size = 255
    end
    object ADOQueryTicketDetBARCODE: TWideStringField
      FieldName = 'BARCODE'
      Size = 255
    end
    object ADOQueryTicketDetALTER_TAX_YN: TWideStringField
      FieldName = 'ALTER_TAX_YN'
      FixedChar = True
      Size = 1
    end
    object ADOQueryTicketDetEBT_YN: TWideStringField
      FieldName = 'EBT_YN'
      FixedChar = True
      Size = 1
    end
  end
  object ADOQryTicket: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    AfterScroll = ADOQryTicketAfterScroll
    Parameters = <
      item
        Name = 'ticket.ProcessFiscalYN'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = '0'
      end>
    SQL.Strings = (
      
        'Select  customer.first_name, customer.last_name,  ticket.TICKET_' +
        'ID, ticket.CLoSED_DATETIME'
      ',ticket.updated_datetime, ticket.created_datetime,'
      'ticket.CLOSED_YN,ticket.paid_yn,  ticket.CREATED_EMPLOYEE_ID,'
      'ticket.CUSTOMER_ID,'
      'ticket.DUE_AMOUNT,'
      'ticket.ORDER_TYPE,'
      'ticket.PAID_AMOUNT,'
      'ticket.SERVED_BY_EMPLOYEE_ID,'
      'ticket.VOID_BY_EMPLOYEE_ID, '
      'ticket.ProcessFiscalYN'
      'From ticket'
      
        'left outer Join Customer on Customer.customer_id = ticket.custom' +
        'er_id'
      'Where (ticket.closed_yn = '#39'Y'#39') and (ticket.paid_yn = '#39'Y'#39')'
      
        'And (ticket.Processfiscalyn is null or ticket.Processfiscalyn = ' +
        #39'N'#39' or  ticket.Processfiscalyn ='#39#39')')
    Left = 200
    Top = 136
    object ADOQryTicketTICKET_ID: TAutoIncField
      FieldName = 'TICKET_ID'
      ReadOnly = True
    end
    object ADOQryTicketCLoSED_DATETIME: TDateTimeField
      FieldName = 'CLoSED_DATETIME'
    end
    object ADOQryTicketupdated_datetime: TDateTimeField
      FieldName = 'updated_datetime'
    end
    object ADOQryTicketcreated_datetime: TDateTimeField
      FieldName = 'created_datetime'
    end
    object ADOQryTicketCLOSED_YN: TWideStringField
      FieldName = 'CLOSED_YN'
      FixedChar = True
      Size = 1
    end
    object ADOQryTicketpaid_yn: TWideStringField
      FieldName = 'paid_yn'
      FixedChar = True
      Size = 1
    end
    object ADOQryTicketCREATED_EMPLOYEE_ID: TIntegerField
      FieldName = 'CREATED_EMPLOYEE_ID'
    end
    object ADOQryTicketCUSTOMER_ID: TIntegerField
      FieldName = 'CUSTOMER_ID'
    end
    object ADOQryTicketDUE_AMOUNT: TBCDField
      FieldName = 'DUE_AMOUNT'
      Precision = 19
    end
    object ADOQryTicketORDER_TYPE: TWideStringField
      FieldName = 'ORDER_TYPE'
      FixedChar = True
      Size = 2
    end
    object ADOQryTicketPAID_AMOUNT: TBCDField
      FieldName = 'PAID_AMOUNT'
      Precision = 19
    end
    object ADOQryTicketSERVED_BY_EMPLOYEE_ID: TIntegerField
      FieldName = 'SERVED_BY_EMPLOYEE_ID'
    end
    object ADOQryTicketVOID_BY_EMPLOYEE_ID: TIntegerField
      FieldName = 'VOID_BY_EMPLOYEE_ID'
    end
    object ADOQryTicketProcessFiscalYN: TWideStringField
      FieldName = 'ProcessFiscalYN'
      Size = 1
    end
  end
  object tblAdoTICKET_ITEM: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'ticketid'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'Select * From TICKET_ITEM'
      'Where ticket_id =:ticketid ')
    Left = 88
    Top = 32
    object tblAdoTICKET_ITEMTICKET_ITEM_ID: TAutoIncField
      FieldName = 'TICKET_ITEM_ID'
      ReadOnly = True
    end
    object tblAdoTICKET_ITEMTICKET_ID: TIntegerField
      FieldName = 'TICKET_ID'
    end
    object tblAdoTICKET_ITEMMENU_ITEM_ID: TIntegerField
      FieldName = 'MENU_ITEM_ID'
    end
    object tblAdoTICKET_ITEMMENU_ITEM_COUNT: TIntegerField
      FieldName = 'MENU_ITEM_COUNT'
    end
    object tblAdoTICKET_ITEMMENU_ITEM_NAME: TWideStringField
      FieldName = 'MENU_ITEM_NAME'
      Size = 254
    end
    object tblAdoTICKET_ITEMMENU_GROUP_NAME: TWideStringField
      FieldName = 'MENU_GROUP_NAME'
      Size = 40
    end
    object tblAdoTICKET_ITEMMENU_CATEGORY_NAME: TWideStringField
      FieldName = 'MENU_CATEGORY_NAME'
      Size = 40
    end
    object tblAdoTICKET_ITEMMENU_ITEM_PRICE: TBCDField
      FieldName = 'MENU_ITEM_PRICE'
      Precision = 19
    end
    object tblAdoTICKET_ITEMDISCOUNT_RATE: TFloatField
      FieldName = 'DISCOUNT_RATE'
    end
    object tblAdoTICKET_ITEMTAX1_NAME: TWideStringField
      FieldName = 'TAX1_NAME'
      Size = 40
    end
    object tblAdoTICKET_ITEMTAX1_ID: TIntegerField
      FieldName = 'TAX1_ID'
    end
    object tblAdoTICKET_ITEMTAX1_RATE: TFloatField
      FieldName = 'TAX1_RATE'
    end
    object tblAdoTICKET_ITEMTAX1_AMOUNT: TBCDField
      FieldName = 'TAX1_AMOUNT'
      Precision = 19
    end
    object tblAdoTICKET_ITEMTAX2_NAME: TWideStringField
      FieldName = 'TAX2_NAME'
      Size = 40
    end
    object tblAdoTICKET_ITEMTAX2_ID: TIntegerField
      FieldName = 'TAX2_ID'
    end
    object tblAdoTICKET_ITEMTAX2_RATE: TFloatField
      FieldName = 'TAX2_RATE'
    end
    object tblAdoTICKET_ITEMTAX2_AMOUNT: TBCDField
      FieldName = 'TAX2_AMOUNT'
      Precision = 19
    end
    object tblAdoTICKET_ITEMTAX3_NAME: TWideStringField
      FieldName = 'TAX3_NAME'
      Size = 40
    end
    object tblAdoTICKET_ITEMTAX3_ID: TIntegerField
      FieldName = 'TAX3_ID'
    end
    object tblAdoTICKET_ITEMTAX3_RATE: TFloatField
      FieldName = 'TAX3_RATE'
    end
    object tblAdoTICKET_ITEMTAX3_AMOUNT: TBCDField
      FieldName = 'TAX3_AMOUNT'
      Precision = 19
    end
    object tblAdoTICKET_ITEMTOTAL_PRICE_BT: TBCDField
      FieldName = 'TOTAL_PRICE_BT'
      Precision = 19
    end
    object tblAdoTICKET_ITEMTOTAL_PRICE_WITH_MOD_BT: TBCDField
      FieldName = 'TOTAL_PRICE_WITH_MOD_BT'
      Precision = 19
    end
    object tblAdoTICKET_ITEMTOTAL_TAX_WITH_MOD: TBCDField
      FieldName = 'TOTAL_TAX_WITH_MOD'
      Precision = 19
    end
    object tblAdoTICKET_ITEMORDER_PRINTED_YN: TWideStringField
      FieldName = 'ORDER_PRINTED_YN'
      FixedChar = True
      Size = 1
    end
    object tblAdoTICKET_ITEMORDER_ACCEPTED_YN: TWideStringField
      FieldName = 'ORDER_ACCEPTED_YN'
      FixedChar = True
      Size = 1
    end
    object tblAdoTICKET_ITEMORDER_READY_YN: TWideStringField
      FieldName = 'ORDER_READY_YN'
      FixedChar = True
      Size = 1
    end
    object tblAdoTICKET_ITEMORDER_CANCELED_YN: TWideStringField
      FieldName = 'ORDER_CANCELED_YN'
      FixedChar = True
      Size = 1
    end
    object tblAdoTICKET_ITEMCREATED_DATETIME: TDateTimeField
      FieldName = 'CREATED_DATETIME'
    end
    object tblAdoTICKET_ITEMCREATED_TERMINAL_NAME: TWideStringField
      FieldName = 'CREATED_TERMINAL_NAME'
      Size = 100
    end
    object tblAdoTICKET_ITEMCREATED_EMPLOYEE_ID: TIntegerField
      FieldName = 'CREATED_EMPLOYEE_ID'
    end
    object tblAdoTICKET_ITEMCREATED_ACTION_NAME: TWideStringField
      FieldName = 'CREATED_ACTION_NAME'
      Size = 100
    end
    object tblAdoTICKET_ITEMUPDATED_DATETIME: TDateTimeField
      FieldName = 'UPDATED_DATETIME'
    end
    object tblAdoTICKET_ITEMUPDATED_TERMINAL_NAME: TWideStringField
      FieldName = 'UPDATED_TERMINAL_NAME'
      Size = 100
    end
    object tblAdoTICKET_ITEMUPDATED_EMPLOYEE_ID: TIntegerField
      FieldName = 'UPDATED_EMPLOYEE_ID'
    end
    object tblAdoTICKET_ITEMUPDATED_ACTION_NAME: TWideStringField
      FieldName = 'UPDATED_ACTION_NAME'
      Size = 100
    end
    object tblAdoTICKET_ITEMHASH_KEY: TWideStringField
      FieldName = 'HASH_KEY'
    end
    object tblAdoTICKET_ITEMSERVED_BY_EMPLOYEE_ID: TIntegerField
      FieldName = 'SERVED_BY_EMPLOYEE_ID'
    end
    object tblAdoTICKET_ITEMSALE_BY_WEIGHT_YN: TWideStringField
      FieldName = 'SALE_BY_WEIGHT_YN'
      FixedChar = True
      Size = 1
    end
    object tblAdoTICKET_ITEMSALE_WEIGHT_UNIT: TWideStringField
      FieldName = 'SALE_WEIGHT_UNIT'
      Size = 10
    end
    object tblAdoTICKET_ITEMSALE_WEIGHT: TBCDField
      FieldName = 'SALE_WEIGHT'
      Precision = 19
    end
    object tblAdoTICKET_ITEMUNIT_COST: TBCDField
      FieldName = 'UNIT_COST'
      Precision = 19
    end
    object tblAdoTICKET_ITEMSALE_BY_TIME_YN: TWideStringField
      FieldName = 'SALE_BY_TIME_YN'
      FixedChar = True
      Size = 1
    end
    object tblAdoTICKET_ITEMSALE_BY_TIME_UNIT_NAME: TWideStringField
      FieldName = 'SALE_BY_TIME_UNIT_NAME'
      Size = 40
    end
    object tblAdoTICKET_ITEMSALE_BY_TIME_UNIT_MIN: TIntegerField
      FieldName = 'SALE_BY_TIME_UNIT_MIN'
    end
    object tblAdoTICKET_ITEMSALE_BY_TIME_UNIT: TIntegerField
      FieldName = 'SALE_BY_TIME_UNIT'
    end
    object tblAdoTICKET_ITEMSALE_BY_TIME_ROUND: TWideStringField
      FieldName = 'SALE_BY_TIME_ROUND'
      Size = 40
    end
    object tblAdoTICKET_ITEMSALE_BY_TIME_UNIT_MAX: TIntegerField
      FieldName = 'SALE_BY_TIME_UNIT_MAX'
    end
    object tblAdoTICKET_ITEMSALE_BY_TIME_STARTUP_PRICE: TBCDField
      FieldName = 'SALE_BY_TIME_STARTUP_PRICE'
      Precision = 19
    end
    object tblAdoTICKET_ITEMSALE_BY_TIME_SURCHARGE: TBCDField
      FieldName = 'SALE_BY_TIME_SURCHARGE'
      Precision = 19
    end
    object tblAdoTICKET_ITEMSALE_BY_TIME_USAGE: TIntegerField
      FieldName = 'SALE_BY_TIME_USAGE'
    end
    object tblAdoTICKET_ITEMSALE_BY_TIME_FROM: TDateTimeField
      FieldName = 'SALE_BY_TIME_FROM'
    end
    object tblAdoTICKET_ITEMSALE_BY_TIME_TO: TDateTimeField
      FieldName = 'SALE_BY_TIME_TO'
    end
    object tblAdoTICKET_ITEMMENU_ITEM_UPC: TWideStringField
      FieldName = 'MENU_ITEM_UPC'
      Size = 255
    end
    object tblAdoTICKET_ITEMBARCODE: TWideStringField
      FieldName = 'BARCODE'
      Size = 255
    end
    object tblAdoTICKET_ITEMALTER_TAX_YN: TWideStringField
      FieldName = 'ALTER_TAX_YN'
      FixedChar = True
      Size = 1
    end
    object tblAdoTICKET_ITEMEBT_YN: TWideStringField
      FieldName = 'EBT_YN'
      FixedChar = True
      Size = 1
    end
  end
  object tblAdoTicketUpdate: TADODataSet
    Connection = ADOConnection1
    CommandText = 
      'Select  Ticket_ID,  ProcessFiscalYN  '#13#10'From TICKET'#13#10'where ticket' +
      '_id=:ticketid'
    Parameters = <
      item
        Name = 'ticketid'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    Left = 88
    Top = 144
    object tblAdoTicketUpdateTicket_ID: TAutoIncField
      FieldName = 'Ticket_ID'
      ReadOnly = True
    end
    object tblAdoTicketUpdateProcessFiscalYN: TWideStringField
      FieldName = 'ProcessFiscalYN'
      Size = 1
    end
  end
  object tblMenuItem: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select m.menu_item_id, m.menu_item_name,   m.price1, m.picture_n' +
        'ame,m.qty, m.tax_group_id,'
      't.tax_item_id1,t.tax_item_id2, cost'
      'From menu_item m, tax_group t'
      'Where t.tax_group_id = m.tax_group_id')
    Left = 24
    Top = 96
    object tblMenuItemmenu_item_id: TAutoIncField
      FieldName = 'menu_item_id'
      ReadOnly = True
    end
    object tblMenuItemmenu_item_name: TWideStringField
      FieldName = 'menu_item_name'
      Size = 254
    end
    object tblMenuItemprice1: TBCDField
      FieldName = 'price1'
      Precision = 19
    end
    object tblMenuItempicture_name: TWideStringField
      FieldName = 'picture_name'
      Size = 255
    end
    object tblMenuItemqty: TIntegerField
      FieldName = 'qty'
    end
    object tblMenuItemtax_group_id: TIntegerField
      FieldName = 'tax_group_id'
    end
    object tblMenuItemtax_item_id1: TIntegerField
      FieldName = 'tax_item_id1'
    end
    object tblMenuItemtax_item_id2: TIntegerField
      FieldName = 'tax_item_id2'
    end
    object tblMenuItemcost: TBCDField
      FieldName = 'cost'
      Precision = 19
    end
  end
end
