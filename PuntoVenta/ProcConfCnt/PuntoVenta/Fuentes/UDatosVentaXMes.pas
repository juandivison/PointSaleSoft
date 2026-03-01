unit UDatosVentaXMes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, DB,IBQuery, ExtCtrls;

type
  TfrmConsultaDatosVentaXMes = class(TForm)
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormDblClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
       procedure OrganizarDatosMesXdia(datosX:TIBQuery);
  public
    { Public declarations }
  end;

var
  frmConsultaDatosVentaXMes: TfrmConsultaDatosVentaXMes;

implementation

uses URepVentaMesxDia, UDatModReportes, UGlobal, UFormSelFecha;

{$R *.dfm}

procedure TfrmConsultaDatosVentaXMes.BitBtn1Click(Sender: TObject);
begin
  qckRepVentaMesxDia:=tqckRepVentaMesxDia.Create(Nil);
  try
   qckRepVentaMesxDia.Prepare;
   qckRepVentaMesxDia.qrTpaginas.Caption:=' de '+IntToStr(qckRepVentaMesxDia.PageNumber);
   qckRepVentaMesxDia.Preview;
  finally
  qckRepVentaMesxDia.Free;
  qckRepVentaMesxDia:=Nil;
  end;
end;

procedure TfrmConsultaDatosVentaXMes.FormDblClick(Sender: TObject);
begin
dmReportes.rxDatosOrganizadosDiaxMes.RecordCount;
end;

Procedure TfrmConsultaDatosVentaXMes.OrganizarDatosMesXdia(datosX:TIBQuery);
var
  Tabla : Array[1..12,1..31] of real;
  StrArchivo : TStringList;
  Linea:String;
  x, y,m :Integer;
  strValoresDia, Valor:String;
  diaAuxi,cont : Integer;
  NombreCampo  : String;
  xMonto : Real;
begin
  dmReportes.rxDatosOrganizadosDiaxMes.close;
  dmReportes.rxDatosOrganizadosDiaxMes.emptytable;
  if dmReportes.rxDatosOrganizadosDiaxMes.FieldDefs.Count > 0 then
  dmReportes.rxDatosOrganizadosDiaxMes.FieldDefs.Clear;
  cont:=0;
  dmReportes.rxDatosOrganizadosDiaxMes.FieldDefs.Add('MesNo',ftInteger,0,false);
  dmReportes.rxDatosOrganizadosDiaxMes.FieldDefs.Add('Mes',ftString,12,false);

  dmReportes.rxDatosOrganizadosDiaxMes.FieldDefs.Add('Total',ftFloat,0,false);
  if FormatDateTime('mm',datosx.Params[0].Value) = FormatDateTime('mm',datosx.Params[1].Value) then
  y:=StrToInt(FormatDateTime('dd',datosx.Params[1].Value)) else
  y:=31;
  for x:=StrToInt(FormatDateTime('dd',datosx.Params[0].Value)) to y do
  dmReportes.rxDatosOrganizadosDiaxMes.FieldDefs.Add(IntToStr(x),ftFloat,0,false);

  dmReportes.rxDatosOrganizadosDiaxMes.FieldDefs.AddFieldDef;
  dmReportes.rxDatosOrganizadosDiaxMes.Open;

  DatosX.First;
  While Not Datosx.Eof do
  begin
    if not dmReportes.rxDatosOrganizadosDiaxMes.Locate('Mes',NombreMes[DatosX.FieldByName('Mes').AsInteger],[]) then
    begin
      dmReportes.rxDatosOrganizadosDiaxMes.Insert;
      dmReportes.rxDatosOrganizadosDiaxMes.FieldByName('MesNo').Value:=Datosx.fieldbyname('Mes').AsInteger;
      dmReportes.rxDatosOrganizadosDiaxMes.FieldByName('Mes').Value:=
      NombreMes[Datosx.fieldbyname('Mes').AsInteger];
      dmReportes.rxDatosOrganizadosDiaxMes.FieldByName('Total').Value:=0;
      dmReportes.rxDatosOrganizadosDiaxMes.FieldByName(DatosX.FieldByName('Dia').AsString).Value:=
      DatosX.FieldByName('Monto').Value;
      dmReportes.rxDatosOrganizadosDiaxMes.Post;
    end else
    begin
      dmReportes.rxDatosOrganizadosDiaxMes.Edit;
      dmReportes.rxDatosOrganizadosDiaxMes.FieldByName(DatosX.FieldByName('Dia').AsString).Value:=
      DatosX.FieldByName('Monto').Value;
      dmReportes.rxDatosOrganizadosDiaxMes.Post;
    end;
    Tabla[DatosX.FieldByName('Mes').AsInteger,DatosX.FieldByName('Dia').Asinteger]:=DatosX.fieldbyname('monto').Value;
    DatosX.Next;
  end;
  //dmReportes.rxDatosOrganizadosDiaxMes.DisableControls;


  dmReportes.rxDatosOrganizadosDiaxMes.DisableControls;

  dmreportes.rxDatosOrganizadosDiaxMes.Last;
  dmreportes.rxDatosOrganizadosDiaxMes.Insert ;
  dmreportes.rxDatosOrganizadosDiaxMes.FieldByName('Mes').Value:='Total';
  dmreportes.rxDatosOrganizadosDiaxMes.FieldByName('MesNo').Value:=13;
  dmreportes.rxDatosOrganizadosDiaxMes.Post;
  dmReportes.rxDatosOrganizadosDiaxMes.SortOnFields('MesNo',true,false);  
  if (StrToInt(FormatDateTime('dd',datosx.Params[1].Value))) <
     (DiasEnElMES(StrToInt(FormatDateTime('yyyy',datosx.Params[1].Value)),
                 StrToInt(FormatDateTime('mm',datosx.Params[1].Value)))) then
     m:=DiasEnElMES(StrToInt(FormatDateTime('yyyy',datosx.Params[1].Value)),
                 StrToInt(FormatDateTime('mm',datosx.Params[1].Value)))
     else m:= StrToInt(FormatDateTime('dd',datosx.Params[1].Value));
  for x:=1 to StrToInt(FormatDateTime('mm',datosx.Params[1].Value)) do
    for y:=1 to m do
  begin
    if dmReportes.rxDatosOrganizadosDiaxMes.locate('mes',NombreMes[x],[]) then
    begin
    dmReportes.rxDatosOrganizadosDiaxMes.Edit;
    dmReportes.rxDatosOrganizadosDiaxMes.FieldByName('Total').Value:=
    dmReportes.rxDatosOrganizadosDiaxMes.FieldByName('Total').Value + Tabla[x,y];
    dmReportes.rxDatosOrganizadosDiaxMes.Post;
    end;
  end;
if (StrToInt(FormatDateTime('dd',datosx.Params[1].Value))) <
     (DiasEnElMES(StrToInt(FormatDateTime('yyyy',datosx.Params[1].Value)),StrToInt(FormatDateTime('mm',datosx.Params[1].Value)))) then
    m:= StrToInt(FormatDateTime('dd',datosx.Params[1].Value)) else
    if (StrToInt(FormatDateTime('dd',datosx.Params[1].Value))) =  DiasEnElMES(StrToInt(FormatDateTime('yyyy',datosx.Params[1].Value)),
                 StrToInt(FormatDateTime('mm',datosx.Params[1].Value))) then
     m:=DiasEnElMES(StrToInt(FormatDateTime('yyyy',datosx.Params[1].Value)),
                 StrToInt(FormatDateTime('mm',datosx.Params[1].Value)));

  dmReportes.rxDatosOrganizadosDiaxMes.first;
  while not dmReportes.rxDatosOrganizadosDiaxMes.eof do
  begin
    for y:=1 to m do
    if not dmReportes.rxDatosOrganizadosDiaxMes.FieldByName(IntToStr(y)).IsNull then
    xMonto:=xMonto + dmReportes.rxDatosOrganizadosDiaxMes.FieldByName(IntToStr(y)).Value;
    dmReportes.rxDatosOrganizadosDiaxMes.Next;
  end;
  if dmReportes.rxDatosOrganizadosDiaxMes.Locate('mes','Total',[]) then
  begin
    dmReportes.rxDatosOrganizadosDiaxMes.Edit;
    dmReportes.rxDatosOrganizadosDiaxMes.fieldbyname('Total').Value:=xMonto;
    dmReportes.rxDatosOrganizadosDiaxMes.Post;
  end;
  dmReportes.rxDatosOrganizadosDiaxMes.EnableControls;
end;

procedure TfrmConsultaDatosVentaXMes.BitBtn2Click(Sender: TObject);
begin
  frmSelFecha:=TfrmSelFecha.Create(nil);
  try
    frmSelFecha.FechaIni.Date:=GlbFechaTrnDiaria;
    frmSelFecha.FechaFin.Date:=GlbFechaTrnDiaria;
    if frmSelFecha.showmodal = mrOk then
    begin
      dmReportes.qryDatosRepVentaMesxDia.close;
      dmReportes.qryDatosRepVentaMesxDia.params[0].value:= ExtraerFecha(frmSelFecha.FechaIni.Date);
      dmReportes.qryDatosRepVentaMesxDia.params[1].value:= ExtraerFecha(frmSelFecha.FechaFin.Date);
      dmReportes.qryDatosRepVentaMesxDia.Open;
    end;
  finally
  frmSelFecha.Free;
  frmSelFecha:=Nil;
  end;
  OrganizarDatosMesXdia(dmreportes.qryDatosRepVentaMesxDia);
end;

end.
