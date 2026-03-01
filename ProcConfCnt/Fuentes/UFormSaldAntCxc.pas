unit UFormSaldAntCxc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  db, Dialogs, StdCtrls, Buttons, Grids, DBGrids, RXDBCtrl, WinSkinData,
  EditNew;

type
  TfrmConsultaAntCxc = class(TForm)
    RxDBGrid1: TRxDBGrid;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    SkinData1: TSkinData;
    BitBtn3: TBitBtn;
    EditN1: TEditN;
    BitBtn4: TBitBtn;
    CheckBox1: TCheckBox;
    Label1: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure EditN1Change(Sender: TObject);
    procedure EditN1Exit(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaAntCxc: TfrmConsultaAntCxc;

implementation

uses UDatModReportes, URepSaldoXAntCxc, UDatModCompania,
     URepSaldoAntCxcRes, UGlobal;

{$R *.dfm}

procedure TfrmConsultaAntCxc.BitBtn1Click(Sender: TObject);
begin
  dmreportes.qryDatosSaldoAntiguedadCxc.Close;
  dmreportes.qryDatosSaldoAntiguedadCxc.Open;
  dmReportes.rxSaldoAntCxc.SortOnFields('codigo',true,false);
end;

procedure TfrmConsultaAntCxc.FormCreate(Sender: TObject);
begin
  dmreportes.SaldoResumen := False;
  dmcompania.tblcompania.Close;
  dmcompania.tblcompania.Open;
  BitBtn1Click(Self);
end;

procedure TfrmConsultaAntCxc.BitBtn2Click(Sender: TObject);
begin
  if dmreportes.SaldoResumen then
  begin
    dmreportes.SaldoResumen:=False;
    BitBtn1Click(Self);    
  end;
  qckRepSaldoXAntCxc:=TqckRepSaldoXAntCxc.create(Nil);
  try
    if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
    begin
      qckRepSaldoXAntCxc.PrinterSetup;
      qckRepSaldoXAntCxc.Print;
    end else
    qckRepSaldoXAntCxc.Preview;
  finally
  qckRepSaldoXAntCxc.Free;
  qckRepSaldoXAntCxc:=Nil;
  end;
end;

procedure TfrmConsultaAntCxc.EditN1Change(Sender: TObject);
begin
  if (length(EditN1.Text)) <=0 then Exit;
  if IsNumerico(EditN1.Text) then
  dmReportes.rxSaldoAntCxc.Locate('codigo', StrToInt(EditN1.Text),[loCaseInsensitive,loPartialKey])
  else
  dmReportes.rxSaldoAntCxc.Locate('NombreCliente', EditN1.Text,[loCaseInsensitive,loPartialKey])
end;

procedure TfrmConsultaAntCxc.EditN1Exit(Sender: TObject);
begin
  if IsNumerico(EditN1.Text) then
  begin
    if not dmReportes.rxSaldoAntCxc.Locate('codigo', StrToInt(EditN1.Text),[]) then
    MessageDlg('Nombre cliente no encontrado',mtInformation, [mbOK], 0)
  end else
  if not dmReportes.rxSaldoAntCxc.Locate('NombreCliente', EditN1.Text,[loCaseInsensitive]) then
  MessageDlg('Nombre cliente no encontrado',mtInformation, [mbOK], 0);
end;

procedure TfrmConsultaAntCxc.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
  begin
    if Length(EditN1.Text) > 0 then
    begin
      dmreportes.FiltrarxCodCte:=dmreportes.rxSaldoAntCxccodigo.Value;
      dmreportes.rxSaldoAntCxc.Filtered:=True;
    end;
  end else
  dmreportes.rxSaldoAntCxc.Filtered:=False;
end;

procedure TfrmConsultaAntCxc.BitBtn3Click(Sender: TObject);
begin
  dmreportes.qryDatosSaldoAntiguedadCxc.Close;
  dmreportes.SaldoResumen:=True;
  dmreportes.qryDatosSaldoAntiguedadCxc.Open;
  dmReportes.rxSaldoAntCxc.SortOnFields('codigo',true,false);

  qckRepSaldoXantCxcRes:=TqckRepSaldoXantCxcRes.Create(Nil);
  try
    if MessageDlg('Imprimir?', mtInformation, [mbyes, mbno], 0) = mrYes then
    begin
      qckRepSaldoXantCxcRes.PrinterSetup;
      qckRepSaldoXantCxcRes.Print;
    end else
    qckRepSaldoXantCxcRes.Preview;
  finally
  qckRepSaldoXantCxcRes.Free;
  qckRepSaldoXantCxcRes:=Nil;
  end;
end;

end.
