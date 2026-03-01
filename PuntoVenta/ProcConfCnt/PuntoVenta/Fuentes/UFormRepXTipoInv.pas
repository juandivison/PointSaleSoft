unit UFormRepXTipoInv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, IBCustomDataSet, IBTable, Mask, ToolEdit,
  WinSkinData;

type
  TfrmRepIngXTipo = class(TForm)
    BitBtn1: TBitBtn;
    ComboBox1: TComboBox;
    Label1: TLabel;
    tblTipoInv: TIBTable;
    tblTipoInvCODIGO: TSmallintField;
    tblTipoInvDESCRIPCION: TIBStringField;
    chkBoxTodos: TCheckBox;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    Label2: TLabel;
    Label3: TLabel;
    SkinData1: TSkinData;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRepIngXTipo: TfrmRepIngXTipo;

implementation

uses UDatModConectar, UDatModReportes, URepVentaDiaria, uglobal,
  UFormSelFecha;

{$R *.dfm}

procedure TfrmRepIngXTipo.BitBtn1Click(Sender: TObject);
begin
  dmReportes.qryDatosRepVentaDiaria.Filtered := False;
  if Not chkBoxTodos.Checked Then
  begin
    dmReportes.FiltrarTipoInv := tblTipoInvCodigo.Value;
    dmReportes.DescTipoProd   := ComboBox1.Text;
    dmReportes.qryDatosRepVentaDiaria.Filtered := True;
  end;
  dmReportes.qryDatosRepVentaDiaria.Close;
  dmReportes.qryDatosRepVentaDiaria.Params[0].Value:= ExtraerFecha(DateEdit1.Date);
  dmReportes.qryDatosRepVentaDiaria.Params[1].Value:= ExtraerFecha(DateEdit2.Date);
  dmReportes.qryDatosRepVentaDiaria.Open;

  qckRepVentaDiaria:=tQckRepVentaDiaria.Create(Nil);
  try
    if not chkBoxTodos.Checked then
    begin
      qckRepVentaDiaria.QRLabel14.Visible:=True;
      qckRepVentaDiaria.QRLabel14.Caption:=ComboBox1.Text;
      qckRepVentaDiaria.ChildBand1.Enabled:=False;
    end
    else qckRepVentaDiaria.QRLabel14.Caption:='';
    qckRepVentaDiaria.Prepare;
    qckRepVentaDiaria.qrTpaginas.Caption:= ' de ' + IntToStr(qckRepVentaDiaria.PageNumber);
    qckRepVentaDiaria.Preview;
  finally
  qckRepVentaDiaria.Free;
  qckRepVentaDiaria:= Nil;
  end;
end;

procedure TfrmRepIngXTipo.FormCreate(Sender: TObject);
begin
  tblTipoInv.Close;
  tblTipoInv.Open;
  tblTipoInv.First;
  ComboBox1.Clear;
  While Not tblTipoInv.Eof Do
  begin
    ComboBox1.Items.Add(tblTipoInvDescripcion.Value);
    tblTipoInv.Next;
  end;
  DateEdit1.Date:=GlbFechaTrnDiaria;
  DateEdit2.Date:=GlbFechaTrnDiaria;
end;

procedure TfrmRepIngXTipo.ComboBox1Change(Sender: TObject);
begin
  if tblTipoInv.Locate('Descripcion', ComboBox1.Text, []) then
  
end;

end.
