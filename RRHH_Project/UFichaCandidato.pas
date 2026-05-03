unit UFichaCandidato;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, Grids, DBGrids, StdCtrls, DBCtrls,
  ExtCtrls,Mask,IBUpdateSQL;

type
  TfrmFichaCandidato = class(TForm)
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    DBMemo1: TDBMemo;
    Image1: TImage;
    btnBuscarCV: TButton;
    OpenDialog1: TOpenDialog;
    qCandidatos: TIBQuery;
    dsCandidatos: TDataSource;
    btnGuardar: TButton;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    IBUpdateSQL2: TIBUpdateSQL;
    procedure FormCreate(Sender: TObject);
    procedure btnBuscarCVClick(Sender: TObject);
    procedure dsCandidatosDataChange(Sender: TObject; Field: TField);
    procedure btnGuardarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFichaCandidato: TfrmFichaCandidato;

implementation

uses UDataModule;

{$R *.dfm}

procedure TfrmFichaCandidato.FormCreate(Sender: TObject);
begin
  qCandidatos.Open;
end;

procedure TfrmFichaCandidato.btnBuscarCVClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    if not (qCandidatos.State in [dsEdit, dsInsert]) then
      qCandidatos.Edit;
    qCandidatos.FieldByName('RUTA_CV').AsString := OpenDialog1.FileName;
  end;
end;

procedure TfrmFichaCandidato.dsCandidatosDataChange(Sender: TObject;
  Field: TField);
var
  RutaFoto: string;
begin
  RutaFoto := qCandidatos.FieldByName('RUTA_FOTO').AsString;
  if (RutaFoto <> '') and FileExists(RutaFoto) then
  begin
    try
      Image1.Picture.LoadFromFile(RutaFoto);
    except
      Image1.Picture := nil;
    end;
  end
  else
    Image1.Picture := nil;
end;

procedure TfrmFichaCandidato.btnGuardarClick(Sender: TObject);
begin
  if qCandidatos.State in [dsEdit, dsInsert] then
  begin
    qCandidatos.Post;
    qCandidatos.Transaction.CommitRetaining;
  end;
end;

end.
