unit UDatModDGII;

interface

uses
  SysUtils, Dialogs, Classes, IBSQL, IBDatabase, DB, IBCustomDataSet, IBQuery;

type
  TdmDGII = class(TDataModule)
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    ibsqlBuscarRazonSocial: TIBQuery;
    ibsqlBuscarRazonSocialRAZONSOCIAL: TIBStringField;
    ibsqlBuscarRazonSocialRNC: TIBStringField;
    ibsqlBuscarRazonSocialSTATUS: TIBStringField;
    procedure IBDatabase1BeforeConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function BuscarRazonSocial(rnc:string):string;
  end;

var
  dmDGII: TdmDGII;


implementation
uses UGlobal;
{$R *.dfm}

{ TdmDGII }

function TdmDGII.BuscarRazonSocial(rnc: string): string;
begin
  ibsqlBuscarRazonSocial.Close;
  ibsqlBuscarRazonSocial.SQL.Text:='';
  ibsqlBuscarRazonSocial.sql.Add('Select RAZONSOCIAL, RNC, STATUS');
  ibsqlBuscarRazonSocial.sql.Add('From RNCCEDULA  ');
  ibsqlBuscarRazonSocial.sql.Add('Where rnc LIKE '+Chr(39)+rnc+'%'+chr(39));   //'13017709%'
  ibsqlBuscarRazonSocial.Open;
end;

procedure TdmDGII.IBDatabase1BeforeConnect(Sender: TObject);
begin
  if (GlbDBIIDBConn <> '') then
  begin
    if not FileExists(GlbDBIIDBConn) then
    begin
      MessageDlg('Base de Datos DGII no existe, verifique.'#10#13''+
      GlbDBIIDBConn,mtError,[mbok],0);
    end else
    IBDatabase1.DatabaseName:= GlbDBIIDBConn;
  end;
end;

end.
