unit UFormConsultaCteXManzana;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WinSkinData, StdCtrls, Buttons, Mask, rxToolEdit, EditNew,
  ExtCtrls, DB, IBCustomDataSet, IBQuery;

type
  TfrmListadoClientesDireccion = class(TForm)
    cBoxSectores: TComboBox;
    Label1: TLabel;
    cBoxCalles: TComboBox;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    SkinData1: TSkinData;
    RadioGroup1: TRadioGroup;
    Label5: TLabel;
    Label6: TLabel;
    cBoxManzana: TComboBox;
    cBoxEdificio: TComboBox;
    qrySectores: TIBQuery;
    qryCalles: TIBQuery;
    qryManzana: TIBQuery;
    qryEdificio: TIBQuery;
    qryEdificioEDIFICIO: TIBStringField;
    qryManzanaMANZANA: TIBStringField;
    qryCallesCALLE: TIBStringField;
    qrySectoresCODIGO: TIntegerField;
    qrySectoresDESCRIPCION: TIBStringField;
    qrySectoresCOD_CIUDAD: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure cBoxSectoresChange(Sender: TObject);

  private
    { Private declarations }
  public

    Procedure AbrirDatos;
  end;

var
  frmListadoClientesDireccion: TfrmListadoClientesDireccion;
  CodSector : smallint;
  labelCretrioRep : String;

  implementation
uses uglobal, UDatModConectar, UDatModClientes, UDatModReportes,
  UDatModCompania, URepClientesXManzana;

{$R *.dfm}

procedure TfrmListadoClientesDireccion.FormCreate(Sender: TObject);
begin
  dmclientes.tblRutaVta.Close;
  dmclientes.tblRutaVta.Open;
  dmReportes.qryClientes.Close;
  dmReportes.qryClientes.Open;
  dmReportes.qryClientes.First;

  qrySectores.Close;
  qrySectores.Open;
  qrySectores.First;
  
  qryCalles.Close;
  qryCalles.Open;
  qryCalles.First;

  qryManzana.Close;
  qryManzana.Open;
  qryManzana.First;

  qryEdificio.Close;
  qryEdificio.Open;
  qryEdificio.First;

  cBoxSectores.Items.Clear;
  cBoxCalles.Items.Clear;
  cBoxManzana.Items.Clear;
  cBoxEdificio.Items.Clear;
  
  While Not qrySectores.Eof Do
  begin
    cBoxSectores.Items.Add(qrySectoresDESCRIPCION.Value);
    qrySectores.Next;
  end;

  While Not qryCalles.Eof Do
  begin
    cBoxCalles.Items.Add(qryCallesCALLE.Value);
    qryCalles.Next;
  end;

  While Not qrySectores.Eof Do
  begin
    cBoxSectores.Items.Add(qrySectoresDESCRIPCION.Value);
    qrySectores.Next;
  end;

  While Not qryEdificio.Eof Do
  begin
    cBoxEdificio.Items.Add(qryEdificioEDIFICIO.Value);
    qryEdificio.Next;
  end;

end;

procedure TfrmListadoClientesDireccion.cBoxSectoresChange(Sender: TObject);
begin
  if qrySectores.Locate('DESCRIPCION',cBoxSectores.Text,[]) then
  CodSector:= qrySectoresCODIGO.Value;
end;

procedure TfrmListadoClientesDireccion.AbrirDatos;
//var
//  orderByText : string;
begin
  //frmListadoClientesDireccion:=TfrmListadoClientesDireccion.Create(nil);
  try
    dmReportes.qryDatosRepClientes.Filtered:=False;
    dmReportes.qryDatosRepClientes.Close;
    dmReportes.qryDatosRepClientes.SQL.Text:=
    dmReportes.qryDatosRepClientesBase.SQL.Text;

    dmReportes.qryDatosRepClientes.SQL.Add('ORDER by C.TIPO_CLIENTE, C.RUTA, c.calle, c.manzana, c.edificio');
    dmReportes.qryDatosRepClientes.Open;
    case frmListadoClientesDireccion.RadioGroup1.ItemIndex of
      0: begin    //Calle
           dmReportes.cteFName:='Calle';
           dmReportes.cteFValor:= cBoxCalles.Text;
         end;
      1: begin    //Manzana
           dmReportes.cteFName:='Manzana';
           dmReportes.cteFValor:= cBoxManzana.Text;
         end;
      2: begin    //Edificio
           dmReportes.cteFName:='Edificio';
           dmReportes.cteFValor:= cBoxEdificio.Text;
         end;
      3: begin    //Sector
           dmReportes.cteFName:='codZona';
           dmReportes.cteFValor:= IntToStr(CodSector);
         end;
    end;
    dmReportes.qryDatosRepClientes.Filtered:=True;
    dmCompania.tblCompania.Close;
    dmCompania.tblCompania.Open;
    dmCompania.tblCompania.Locate('codigo', glbCia_Key,[]);
    qckRepClientesXDirCalleMEdif:=TqckRepClientesXDirCalleMEdif.Create(Nil);
    try
      if Messagedlg('Imprimir?', mtInformation,[mbYes, mbNo],0) = mrYes then
      begin
        qckRepClientesXDirCalleMEdif.PrinterSetUp;
        qckRepClientesXDirCalleMEdif.Print;
      end else qckRepClientesXDirCalleMEdif.Preview;
    finally
    qckRepClientesXDirCalleMEdif.Free;
    qckRepClientesXDirCalleMEdif:= Nil;
    end;
  finally
  //FreeAndNil(frmListadoClientesDireccion);
  end;
  dmReportes.cteFName:='';
end;

end.
