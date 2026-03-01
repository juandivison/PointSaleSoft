unit UFormSectores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WinSkinData, StdCtrls, Buttons, Grids, DBGrids, RxDBCtrl, Mask,
  DB, DBCtrls, RxCtrls, RxLookup;

type
  TfrmSectores = class(TForm)
    Label2: TLabel;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton1: TSpeedButton;
    DBStatusLabel1: TDBStatusLabel;
    DBEdit2: TDBEdit;
    RxDBGrid1: TRxDBGrid;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    SkinData1: TSkinData;
    Label1: TLabel;
    RxDBLookupCombo2: TRxDBLookupCombo;
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSectores: TfrmSectores;

implementation

uses UGlobal,UDatModClientes, UDatmodDatosGenerales;

{$R *.dfm}

procedure TfrmSectores.BitBtn10Click(Sender: TObject);
begin
  dmClientes.tblSectores.prior;
end;

procedure TfrmSectores.BitBtn11Click(Sender: TObject);
begin
  dmClientes.tblSectores.next;
end;

procedure TfrmSectores.BitBtn12Click(Sender: TObject);
begin
  dmClientes.tblSectores.Last;
end;

procedure TfrmSectores.BitBtn9Click(Sender: TObject);
begin
  dmClientes.tblSectores.first;
end;

procedure TfrmSectores.SpeedButton1Click(Sender: TObject);
begin
  if dmClientes.tblSectores.State in [dsinsert, dsEdit] then
  begin
    if dmClientes.tblSectores.State in [dsInsert] then
    dmClientes.tblSectoresCODIGO.Value:= FsqlMaxNumero('sectores','codigo');
    dmClientes.tblSectores.Post;
    dmClientes.tblSectores.ApplyUpdates;
    if not dmClientes.tblSectores.Transaction.InTransaction then
    dmClientes.tblSectores.Transaction.StartTransaction;
    try
      dmClientes.tblSectores.Transaction.CommitRetaining;
    except
    dmClientes.tblSectores.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmSectores.SpeedButton2Click(Sender: TObject);
begin
  if dmClientes.tblSectores.State = dsBrowse then
  begin
    dmClientes.tblSectores.Insert;
    DBEdit2.SetFocus;
  end;
end;

procedure TfrmSectores.SpeedButton3Click(Sender: TObject);
begin
  if dmClientes.tblSectores.State in [dsinsert, dsEdit] then
  begin
    dmClientes.tblSectores.Cancel;
  end;
end;

procedure TfrmSectores.FormCreate(Sender: TObject);
begin
  dmClientes.tblSectores.close;
  dmClientes.tblSectores.Open;
  dmClientes.tblCiudades.Close;
  dmClientes.tblCiudades.Open;
end;

end.
