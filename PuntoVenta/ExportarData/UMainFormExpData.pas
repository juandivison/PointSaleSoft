unit UMainFormExpData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IBQuery, DB, IBCustomDataSet, StdCtrls, ComCtrls, RXCtrls,
  RXDBCtrl;

type
  TForm1 = class(TForm)
    tblDestino: TIBDataSet;
    tblOrigen: TIBQuery;
    Button1: TButton;
    ProgressBar1: TProgressBar;
    DBStatusLabel1: TDBStatusLabel;
    DataSource1: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
uses UDatModConectarDestino, UDatModConectarOrigen;
{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
x : integer;
begin
  tblOrigen.Close;
  tblOrigen.Open;

  tblDestino.Close;
  tblDestino.Open;
  tblorigen.Last;;
  tblorigen.First;
  ProgressBar1.Max:= tblOrigen.RecordCount;
  while not tblorigen.Eof do
  begin
    Application.ProcessMessages;
    tblDestino.Append;
    for x:=0  to tblorigen.Fields.Count - 1 do
    tbldestino.FieldByName(tblorigen.Fields.Fields[x].FieldName).AsVariant:=
    tblorigen.Fields.Fields[x].Value;
    tbldestino.Post;
    tblOrigen.Next;
    ProgressBar1.StepIt;
  end;
  tblOrigen.Close;
  tblDestino.Close;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  tblOrigen.Close;
  tblOrigen.Open;

  tblDestino.Close;
  tblDestino.Open;
  label1.Caption:= 'Destino ->' + tblDestino.SelectSQL.TExt;
  label2.Caption:= 'Destino ->' + tblOrigen.SQL.Text;
end;

end.
