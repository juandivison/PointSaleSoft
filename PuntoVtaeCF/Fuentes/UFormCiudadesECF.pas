unit UFormCiudadesECF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WinSkinData, StdCtrls, Buttons, Grids, DBGrids, RxDBCtrl, Mask,
  DB, DBCtrls, RxCtrls;

type
  Tfrmciudadesecf = class(TForm)
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
    edtBuscar: TEdit;
    Label1: TLabel;
    SpeedButton4: TSpeedButton;
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure edtBuscarChange(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmciudadesecf: Tfrmciudadesecf;

implementation
     uses UDatModConectar,uglobal, UDatmodDatosGenerales;
     
{$R *.dfm}

procedure Tfrmciudadesecf.BitBtn10Click(Sender: TObject);
begin
  dmDatos.tblEcfCiudades.prior;
end;

procedure Tfrmciudadesecf.BitBtn11Click(Sender: TObject);
begin
  dmDatos.tblEcfCiudades.next;
end;

procedure Tfrmciudadesecf.BitBtn12Click(Sender: TObject);
begin
  dmDatos.tblEcfCiudades.Last;
end;

procedure Tfrmciudadesecf.BitBtn9Click(Sender: TObject);
begin
  dmDatos.tblEcfCiudades.first;
end;

procedure Tfrmciudadesecf.SpeedButton1Click(Sender: TObject);
begin
  if dmDatos.tblEcfCiudades.State in [dsinsert, dsEdit] then
  begin
     if dmDatos.tblEcfCiudades.State in [dsInsert] then
    dmDatos.tblEcfCiudadesCodigo.Value:= FsqlMaxNumero('ECF_TERRITORIO','Codigo');
    GlbSalvarQuery(dmDatos.tblEcfCiudades);
  end;
end;

procedure Tfrmciudadesecf.SpeedButton2Click(Sender: TObject);
begin
  if dmDatos.tblEcfCiudades.State = dsBrowse then
  begin
    dmDatos.tblEcfCiudades.Insert;
    DBEdit2.SetFocus;
  end;
end;

procedure Tfrmciudadesecf.SpeedButton3Click(Sender: TObject);
begin
  if dmDatos.tblEcfCiudades.State in [dsinsert, dsEdit] then
  begin
    dmDatos.tblEcfCiudades.Cancel;
  end;
end;

procedure Tfrmciudadesecf.edtBuscarChange(Sender: TObject);
begin
  dmDatos.tblEcfCiudades.locate('descripcion',edtbuscar.text,[]);
end;

procedure Tfrmciudadesecf.SpeedButton4Click(Sender: TObject);
begin
  if not dmDatos.tblEcfCiudades.locate('descripcion',edtbuscar.text,[]) then
  MessageDlg('No existe',mtinformation,[mbok],0);
end;

end.
