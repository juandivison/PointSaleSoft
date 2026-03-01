unit UFormSelEstatusVeh;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, WinSkinData;

type
  TfrmEstatusVeh = class(TForm)
    ComboBox1: TComboBox;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    SkinData1: TSkinData;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    _statusveh: string;
  end;

var
  frmEstatusVeh: TfrmEstatusVeh;

implementation

uses UDatModVehiculo;

{$R *.dfm}

procedure TfrmEstatusVeh.FormCreate(Sender: TObject);
begin
  _statusveh:='';
  dmVehiculo.qryEstusVeh.Close;
  dmVehiculo.qryEstusVeh.Open;
  dmVehiculo.qryEstusVeh.First;
  ComboBox1.Clear;
  While Not dmVehiculo.qryEstusVeh.Eof Do
  begin
    ComboBox1.Items.Add(dmVehiculo.qryEstusVehDESCRIPCION.Value);
    dmVehiculo.qryEstusVeh.Next;
  end;
  dmVehiculo.qryEstusVeh.First; 
  ComboBox1.Text := dmVehiculo.qryEstusVehDESCRIPCION.Value;
  ComboBox1Change(Self);
end;

procedure TfrmEstatusVeh.ComboBox1Change(Sender: TObject);
begin
  if dmVehiculo.qryEstusVeh.Locate('DESCRIPCION', ComboBox1.Text,[]) then
  _statusveh:= dmVehiculo.qryEstusVehCODIGO.AsString
  else _statusveh:= '';
end;

end.
