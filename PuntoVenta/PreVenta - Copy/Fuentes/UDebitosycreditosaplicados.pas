unit UDebitosycreditosaplicados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, EditNew, Buttons;

type
  TfrmVerCreditosyDebitosAplicados = class(TForm)
    EditN1: TEditN;
    Label1: TLabel;
    EditN2: TEditN;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    Label3: TLabel;
    Label4: TLabel;
    EditN3: TEditN;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    procedure BuscarDatos(fechaini,fechafin:TDateTime);
  end;

var
  frmVerCreditosyDebitosAplicados: TfrmVerCreditosyDebitosAplicados;

implementation

uses UDatModCxc, uglobal, UFormSelFecha;

{$R *.dfm}

procedure TfrmVerCreditosyDebitosAplicados.BuscarDatos(fechaini,fechafin:TDateTime);
var
  suma,total:real;

begin
  suma:=0;
  dmcxc.qryTipoMvtoCxc.Close;
  dmcxc.qryTipoMvtoCxc.Params[0].Value:=ExtraerFecha(fechaini);
  dmcxc.qryTipoMvtoCxc.Params[1].Value:=ExtraerFecha(fechafin);
  dmcxc.qryTipoMvtoCxc.Params[2].Value:=1;//debito
  dmcxc.qryTipoMvtoCxc.ExecQuery;
  if dmcxc.qryTipoMvtoCxc.open then
  begin
    total:=dmcxc.qryTipoMvtoCxc.current.Vars[0].AsFloat;
    suma:=suma + total;    
    EditN1.Text:= Format('%*.*m',[10,2,Total]);
  end;
  dmcxc.qryTipoMvtoCxc.close;
  dmcxc.qryTipoMvtoCxc.Params[2].Value:=2;//debito
  dmcxc.qryTipoMvtoCxc.ExecQuery;
  if dmcxc.qryTipoMvtoCxc.Open then
  begin
    Total:=dmcxc.qryTipoMvtoCxc.current.Vars[0].AsFloat;
    suma:=suma + total;      
    EditN2.Text:= Format('%*.*m',[10,2,Total]);
  end;
  Total:=Suma;
  EditN3.Text:=Format('%*.*m',[10,2,Total]);
end;

procedure TfrmVerCreditosyDebitosAplicados.BitBtn1Click(Sender: TObject);
begin
  frmSelFecha:=TfrmSelFecha.create(nil);
  try
  if frmSelFecha.Showmodal = mrOk then
  begin
    BuscarDatos(Extraerfecha(frmselfecha.FechaIni.Date),
                Extraerfecha(frmselfecha.FechaFin.Date));
    Label3.Caption:=FormatDatetime('dd-mmm-yyyy',frmselfecha.FechaIni.Date)+
              ' a '+FormatDatetime('dd-mmm-yyyy',frmselfecha.FechaFin.Date);
  end;
  finally
  frmSelFecha.Free;
  frmSelFecha:=Nil;
  end;
end;

end.
