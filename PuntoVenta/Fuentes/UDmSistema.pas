unit UDmSistema;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TdmSistema = class(TDataModule)
    ADOConnection1: TADOConnection;
    tblADOSistema: TADODataSet;
    tblADOSistemaid: TAutoIncField;
    tblADOSistemaidsistema: TIntegerField;
    tblADOSistemaidcliente: TIntegerField;
    tblADOSistemanombrecliente: TStringField;
    tblADOSistemacont_aviso: TSmallintField;
    tblADOSistemaFecha_Suspencion: TDateField;
    tblADOSistemaFecha_activado: TDateField;
    tblADOSistemaestado: TStringField;
    procedure ADOConnection1Login(Sender: TObject; Username,
      Password: String);
    procedure DataModuleCreate(Sender: TObject);
    procedure ADOConnection1BeforeConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmSistema: TdmSistema;

implementation

{$R *.dfm}

procedure TdmSistema.ADOConnection1Login(Sender: TObject; Username,
  Password: String);
begin
  UserName:='idesi_sqllogin_1';
  Password:='Darlin@2005';
end;

procedure TdmSistema.DataModuleCreate(Sender: TObject);
begin
  ADOConnection1.ConnectionString:=
  'Provider=SQLNCLI11.1;Persist Security Info=False;User ID=idesi_sqllogin_1;'+
  'Password=Darlin@2005;Initial Catalog=idesidbpos;Data Source=209.17.116.13;'+
  'Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;'+
  'Initial File Name="";Use Encryption for Data=False;'+
  'Tag with column collation when possible=False;MARS Connection=False;'+
  'DataTypeCompatibility=0;Trust Server Certificate=False;Server SPN="";Application Intent=READWRITE';
end;

procedure TdmSistema.ADOConnection1BeforeConnect(Sender: TObject);
begin
  ADOConnection1.ConnectionString:=
  'Provider=SQLNCLI11.1;Persist Security Info=False;User ID=idesi_sqllogin_1;'+
  'Password=Darlin@2005;Initial Catalog=idesidbpos;Data Source=209.17.116.13;'+
  'Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;'+
  'Initial File Name="";Use Encryption for Data=False;'+
  'Tag with column collation when possible=False;MARS Connection=False;'+
  'DataTypeCompatibility=0;Trust Server Certificate=False;Server SPN="";Application Intent=READWRITE';
end;

end.
