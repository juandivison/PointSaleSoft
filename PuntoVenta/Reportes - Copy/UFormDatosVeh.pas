unit UFormDatosVeh;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  db, Dialogs, WinSkinData, StdCtrls, Buttons, Mask, DBCtrls, RxMemDS;

type
  TfrmDatosVeh = class(TForm)
    rxData: TRxMemoryData;
    rxDataCODZON: TIntegerField;
    rxDataSTACOT: TSmallintField;
    rxDataIMPCOT: TSmallintField;
    rxDataMARCOT: TStringField;
    rxDataMODCOT: TStringField;
    rxDataCHACOT: TStringField;
    rxDataKILCOT: TStringField;
    rxDataPLACOT: TStringField;
    rxDataANOCOT: TStringField;
    rxDataCOLCOT: TStringField;
    DataSource1: TDataSource;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    SkinData1: TSkinData;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    rxDataCCMOTORCOT: TStringField;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDatosVeh: TfrmDatosVeh;

implementation

{$R *.dfm}

procedure TfrmDatosVeh.FormCreate(Sender: TObject);
begin
  rxData.close;
  rxData.Open;
end;

procedure TfrmDatosVeh.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if rxData.state in [dsInsert, dsEdit] then
  rxData.post;
end;

end.
