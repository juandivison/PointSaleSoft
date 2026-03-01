unit UBuscarClientesPersonasMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBCtrls, Grids, DBGrids, ComCtrls, ExtCtrls, StdCtrls,
  Buttons, IBCustomDataSet, IBQuery, WinSkinData, RXDBCtrl;

type
  TFrmBuscarClientesPersonas = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    ScrollBox1: TScrollBox;
    DBNavigator1: TDBNavigator;
    BitBtn1: TBitBtn;
    Panel3: TPanel;
    RadioGroup1: TRadioGroup;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    DataSource1: TDataSource;
    SkinData1: TSkinData;
    BitBtn2: TBitBtn;
    chkBoxFiltrar: TCheckBox;
    qryClienteStd: TIBQuery;
    DBGrid2: TDBGrid;
    Panel4: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    LabelNumHist: TLabel;
    labelNSS: TLabel;
    labelCedula: TLabel;
    LabelNombre: TLabel;
    LabelTelefono: TLabel;
    LabelApodo: TLabel;
    qryPrestamos: TIBQuery;
    dsqryPrestamos: TDataSource;
    qryPrestamosCODIGO: TIntegerField;
    qryPrestamosNOMBRE: TIBStringField;
    qryPrestamosAPELLIDO: TIBStringField;
    qryPrestamosNOMBRE_EMPRESA: TIBStringField;
    qryPrestamosCEDULA: TIBStringField;
    qryPrestamosPASAPORTE: TIBStringField;
    qryPrestamosLUGAR_DE_TRABAJO: TIBStringField;
    qryPrestamosDIRECCION_REAL: TIBStringField;
    qryPrestamosDIRECCION_LOCAL: TIBStringField;
    qryPrestamosESTADO: TIBStringField;
    qryPrestamosPAIS: TIBStringField;
    qryPrestamosCIUDAD: TIBStringField;
    qryPrestamosEMAIL: TIBStringField;
    qryPrestamosWEBSITE: TIBStringField;
    qryPrestamosOTRO_TELEFONO: TIBStringField;
    qryPrestamosTELEF_REFERENCIA: TIBStringField;
    qryPrestamosREFERENCIA: TIBStringField;
    qryPrestamosTELEF_CONTACTO: TIBStringField;
    qryPrestamosTELEFONO_LOCAL: TIBStringField;
    qryPrestamosRNC: TIBStringField;
    qryPrestamosCEDULA_GARANTE: TIBStringField;
    qryPrestamosSERIE: TIntegerField;
    qryPrestamosID_OFICINA: TIntegerField;
    qryPrestamosNUMERO_CKS: TIBStringField;
    qryPrestamosMONTO_CAPITAL_PENDIENTE: TFloatField;
    qryPrestamosMONTO_CAPITAL: TFloatField;
    qryPrestamosOBERVACION: TMemoField;
    qryClienteStdCODIGO: TIntegerField;
    qryClienteStdNOMBRE: TIBStringField;
    qryClienteStdAPELLIDO: TIBStringField;
    qryClienteStdNOMBRE_EMPRESA: TIBStringField;
    qryClienteStdCEDULA: TIBStringField;
    qryClienteStdPASAPORTE: TIBStringField;
    qryClienteStdLUGAR_DE_TRABAJO: TIBStringField;
    qryClienteStdDIRECCION_REAL: TIBStringField;
    qryClienteStdDIRECCION_LOCAL: TIBStringField;
    qryClienteStdESTADO: TIBStringField;
    qryClienteStdPAIS: TIBStringField;
    qryClienteStdCIUDAD: TIBStringField;
    qryClienteStdEMAIL: TIBStringField;
    qryClienteStdWEBSITE: TIBStringField;
    qryClienteStdOTRO_TELEFONO: TIBStringField;
    qryClienteStdTELEF_REFERENCIA: TIBStringField;
    qryClienteStdREFERENCIA: TIBStringField;
    qryClienteStdTELEF_CONTACTO: TIBStringField;
    qryClienteStdTELEFONO_LOCAL: TIBStringField;
    qryClienteStdRNC: TIBStringField;
    qryClienteStdCEDULA_GARANTE: TIBStringField;
    qryClienteStdSERIE: TIntegerField;
    qryClienteStdID_OFICINA: TIntegerField;
    qryClienteStdNUMERO_CKS: TIBStringField;
    qryClienteStdMONTO_CAPITAL_PENDIENTE: TFloatField;
    qryClienteStdMONTO_CAPITAL: TFloatField;
    qryClienteStdOBERVACION: TMemoField;
    IBQuery1: TIBQuery;
    IntegerField1: TIntegerField;
    IBStringField1: TIBStringField;
    IBStringField2: TIBStringField;
    IBStringField3: TIBStringField;
    IBStringField4: TIBStringField;
    IBStringField5: TIBStringField;
    IBStringField6: TIBStringField;
    IBStringField7: TIBStringField;
    IBStringField8: TIBStringField;
    IBStringField9: TIBStringField;
    IBStringField10: TIBStringField;
    IBStringField11: TIBStringField;
    IBStringField12: TIBStringField;
    IBStringField13: TIBStringField;
    IBStringField14: TIBStringField;
    IBStringField15: TIBStringField;
    IBStringField16: TIBStringField;
    IBStringField17: TIBStringField;
    IBStringField18: TIBStringField;
    IBStringField19: TIBStringField;
    IBStringField20: TIBStringField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    IBStringField21: TIBStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    MemoField1: TMemoField;
    qryPrestamosCANT_CUOTAS: TFloatField;
    qryClienteStdCANT_CUOTAS: TFloatField;
    IBQuery1CANT_CUOTAS: TFloatField;
    DBGrid1: TRxDBGrid;
    qryPrestamosSTATUS: TIBStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RadioGroup1Click(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure chkBoxFiltrarExit(Sender: TObject);
    procedure LabelNumHistClick(Sender: TObject);
    procedure labelNSSClick(Sender: TObject);
    procedure labelCedulaClick(Sender: TObject);
    procedure LabelNombreClick(Sender: TObject);
    procedure LabelTelefonoClick(Sender: TObject);
    procedure LabelApodoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid2Exit(Sender: TObject);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1Exit(Sender: TObject);
    procedure DBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
  private
    { Private declarations }
    procedure AsignarSqlText(campo:string;valor:string; OrderBy : String);

    procedure AsignarDatos(Numhist, Nss, Cedula, Nombre, Telefono, Apodo:String);
  public
    { Public Declarations }
    xCodigoCte : Integer;
    Numerocks  : Integer;
    CodigoCliente : Integer;
    xSerie : Integer;
    xCedula : String;
  end;

var
  FrmBuscarClientesPersonas: TFrmBuscarClientesPersonas;
   Texto: String;
    //qryClienteStd: TIBQuery;
implementation

uses UDatModCon, UGlobal, UDatModClientes;

{$R *.dfm}

procedure TFrmBuscarClientesPersonas.FormCreate(Sender: TObject);
begin
  if qryPrestamos.State = dsInactive then
  qryPrestamos.Open;
  qryPrestamos.Close;
  qryPrestamos.Filtered:=False;
  //qryClienteStd:=TIBQuery.Create(Nil);
  xCodigoCte:=0;
end;

procedure TFrmBuscarClientesPersonas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //if Assigned(qryClienteStd) then
  //begin
  //  qryClienteStd.Free;
  //  qryClienteStd:= Nil;
  //end;
  Action:=CaFree;
end;

procedure TFrmBuscarClientesPersonas.RadioGroup1Click(Sender: TObject);
var
  dsAnterio:String;
begin
  if RadioGroup1.ItemIndex = 6 then exit;//esto hasta que agregues apodo a la tabla cliente
  Panel4.Visible:=False;
  Edit1Enter(Self);
  if Edit1.Text <> '' then
  if Not chkBoxFiltrar.Checked then
  begin
    DBGrid1.DataSource:=dsqryPrestamos;
    DBGrid1.Visible:=False;
    DBGrid2.Visible:=False;
    Panel4.Visible:=False;
  end;

  if chkBoxFiltrar.Checked And (RadioGroup1.ItemIndex >= 0) then
  begin
    GlbCampoFilterCte:='';
    case RadioGroup1.ItemIndex of
    0: glbCampoFilterCte:='numero';
    1: glbCampoFilterCte:='NUMERO_cks';
    2: glbCampoFilterCte:='CEDULA';
    3: glbCampoFilterCte:='NOMBRE';
    4: glbCampoFilterCte:='APELLIDO';
    5: glbCampoFilterCte:='Telef_contacto';
    //6: glbCampoFilterCte:='Apodo';
    end;

    case RadioGroup1.ItemIndex of
    0: GlbOrderBy :=' order by Numero';
    1: glbOrderBy :=' order by NUMERO_cks';
    2: GlbOrderBy :=' order by CEDULA';
    3: GlbOrderBy :=' order by NOMBRE';
    4: GlbOrderBy :=' order by APELLIDO';
    5: GlbOrderBy :=' order by Telef_contacto';
    //6: GlbOrderBy :=' order by Apodo';
    end;

    if (Edit1.Text <> '') then
    glbValueFilterCte :=UpperCase(Edit1.Text);
    if (glbCampoFilterCte <>'')then
    begin
      AsignarSqlText(GlbcampoFilterCte,chr(39) +'%'+GlbValueFilterCte+'%'+chr(39), GlbOrderBy);
      Texto:= qryClienteStd.Text;
      if (GlbValueFilterCte <> '') then
      qryClienteStd.Open;
      DataSource1.DataSet:= QryClienteStd;
      DBGrid2.DataSource := DataSource1;
      DBGrid1.Visible:=False;
      DBGrid2.Visible := True;
      AsignarDatos(
      qryClienteStdSerie.AsString,
      qryClienteStdNUMERO_cks.Value,
      qryClienteStdCEDULA.Value,
      qryClienteStdNOMBRE.Value,
      qryClienteStdTELEF_contacto.Value,'');
      //qryClienteStdAPODO.Value);
      qryPrestamos.Filtered:=False;
      Exit;
    end;
    if DBGrid2.Visible Or DBGrid1.Visible then
    Panel4.Visible := True else Panel4.Visible := False;
  end;

  qryPrestamos.Filtered := False;
  if qryPrestamos.State = dsInactive then
  qryPrestamos.Open;

  if RadioGroup1.ItemIndex = 0 then
  begin
    if Edit1.Text = '' then Exit;
    if qryPrestamos.state = dsInactive then
    qryPrestamos.Open;
    if Not qryPrestamos.Locate('SERIE',StrToInt(Edit1.Text),[loCaseInsensitive,loPartialKey]) then
    dbgrid1.Visible:=False else dbgrid1.Visible:=True;
  end else if RadioGroup1.ItemIndex = 1 then
  begin
    if Not qryPrestamos.Locate('NUMERO_CKS',Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    dbgrid1.Visible:=False else  dbgrid1.Visible:=True;
  end else if RadioGroup1.ItemIndex = 2 then
  begin
    if not qryPrestamos.Locate('CEDULA',Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    dbgrid1.Visible:=False else  dbgrid1.Visible:=True;
  end  else if RadioGroup1.ItemIndex = 3 then
  begin
    if not qryPrestamos.Locate('nombre',Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    dbgrid1.Visible:=False else  dbGrid1.Visible:=True;
  end else if RadioGroup1.ItemIndex = 4 then
  begin
    if not qryPrestamos.Locate('APELLIDO',Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    dbgrid1.Visible:=False else  dbGrid1.Visible:=True;
  end else if RadioGroup1.ItemIndex = 5 then
  begin
    if not qryPrestamos.Locate('TELEF_contacto',Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    dbgrid1.Visible:=False else  dbGrid1.Visible:=True;
  end else if RadioGroup1.ItemIndex = 6 then
  begin
    if not qryPrestamos.Locate('Apodo',Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    dbgrid1.Visible:=False else  dbGrid1.Visible:=True;
  end;
  Edit1Enter(Self);
  if FrmBuscarClientesPersonas.Showing then
  Edit1.SetFocus;
  if dbGrid1.Visible then
  begin
    xSerie := qryPrestamosSERIE.Value;
    CodigoCliente:=qryPrestamosCodigo.Value;
    xCedula:=qryPrestamosCEDULA.Value;
    AsignarDatos(qryPrestamosSerie.AsString,
                 qryPrestamosNUMERO_cks.Value,
                 qryPrestamosCEDULA.Value,
                 qryPrestamosNOMBRE.Value,
                 qryPrestamosTELEF_CONTACTO.Value,''
                 {qryPrestamosAPODO.Value});
  end else
  if dbGrid2.Visible then
  begin
    xSerie := qryClienteStdSERIE.Value;
    codigoCliente:=qryClienteStdCodigo.Value;
    xCedula := qryClienteStdCEDULA.Value;
    AsignarDatos(qryClienteStdserie.AsString,qryClienteStdNUMERO_cks.Value,
    qryClienteStdCEDULA.Value,
    qryClienteStdNOMBRE.Value,
    qryClienteStdTELEF_CONTACTO.Value,'');
    //qryClienteStdAPODO.Value);
  end;
end;

procedure TFrmBuscarClientesPersonas.Edit1Enter(Sender: TObject);
var
  klk : string;
begin
  Case RadioGroup1.ItemIndex of
  0:begin
      Label2.Caption := RadioGroup1.Items.Names[0];
      klk:= RadioGroup1.Items.Strings[0];
      Label2.Caption:=klk;
    end;
  1:begin
      Label2.Caption := RadioGroup1.Items.Names[1];
      klk:= RadioGroup1.Items.Strings[1];
      Label2.Caption:=klk;
    end;
  2:begin
      Label2.Caption := RadioGroup1.Items.Names[2];
      klk:= RadioGroup1.Items.Strings[2];
      Label2.Caption:=klk;
    end;
  3:begin
      Label2.Caption := RadioGroup1.Items.Names[3];
      klk:= RadioGroup1.Items.Strings[3];
      Label2.Caption:=klk;
    end;
  4:begin
      Label2.Caption := RadioGroup1.Items.Names[4];
      klk:= RadioGroup1.Items.Strings[4];
      Label2.Caption:=klk;
    end;
  5:begin
      Label2.Caption := RadioGroup1.Items.Names[5];
      klk:= RadioGroup1.Items.Strings[5];
      Label2.Caption:=klk;
    end;
  6:begin
      Label2.Caption := RadioGroup1.Items.Names[6];
      klk:= RadioGroup1.Items.Strings[6];
      Label2.Caption := klk;
    end;
  end;
end;

procedure TFrmBuscarClientesPersonas.Button1Click(Sender: TObject);
begin
  qryPrestamos.Filtered := False;
  if RadioGroup1.ItemIndex = 0 then
  begin
    if Not qryPrestamos.Locate('serie', StrToInt(Edit1.Text),[loCaseInsensitive,loPartialKey]) then
    MessageDlg('Código no encontrado', mtInformation, [mbOK], 0);
  end else if RadioGroup1.ItemIndex = 1 then
  begin
    if Not qryPrestamos.Locate('numero_cks',Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    MessageDlg('Numero cks no encontrado', mtInformation, [mbOK], 0);
  end else if RadioGroup1.ItemIndex = 2 then
  begin
    if Not qryPrestamos.Locate('CEDULA_cliente',Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    MessageDlg('Cédula no encontrada',mtInformation, [mbOK], 0);
  end else if RadioGroup1.ItemIndex = 3 then
  begin
    if Not qryPrestamos.Locate('nombre',Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    MessageDlg('Pasaporte no encontrado',mtInformation, [mbOK], 0);
  end else if RadioGroup1.ItemIndex = 4 then
  begin
    if Not qryPrestamos.Locate('apellido',Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    MessageDlg('Nombre no encontrado',mtInformation, [mbOK], 0);
  end else if RadioGroup1.ItemIndex = 5 then
  begin
    if Not qryPrestamos.Locate('telef_contacto',Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    MessageDlg('Apellido no encontrado',mtInformation, [mbOK], 0);
  end;
end;

procedure TFrmBuscarClientesPersonas.chkBoxFiltrarExit(Sender: TObject);
begin
  if not chkBoxFiltrar.Checked then
  begin
    DBGrid1.DataSource:=dsqryPrestamos;
    Exit;
  end;
end;

procedure TFrmBuscarClientesPersonas.AsignarSqlText(Campo : String; Valor : String; OrderBy : String);
begin
  if qryClienteStd.Active then
  qryClienteStd.close;
  qryClienteStd.Database:= dmcon.IBDatabase1;
  qryClienteStd.SQL.Text:=
  Format(IBQuery1.Text +
  ' WHERE Prestamo.Status = '+chr(39)+'A'+chr(39)+' AND UPPER(%s) like %s %s',[Campo, Valor, OrderBy]);
end;

procedure TFrmBuscarClientesPersonas.AsignarDatos(numhist, nss,cedula,nombre,telefono,apodo:String);
begin
  Panel4.Visible:=True;
  LabelNumHist.Caption := numhist;
  labelNSS.Caption     := nss;
  labelCedula.Caption  := cedula;
  LabelNombre.Caption  := nombre;
  LabelTelefono.Caption:= telefono;
  LabelApodo.Caption   := apodo
end;

procedure TFrmBuscarClientesPersonas.LabelNumHistClick(Sender: TObject);
begin
  edit1.Text:=LabelNumHist.Caption;
  RadioGroup1.ItemIndex:=0;
end;

procedure TFrmBuscarClientesPersonas.labelNSSClick(Sender: TObject);
begin
  edit1.Text:=labelNSS.Caption;
  RadioGroup1.ItemIndex:=1;
end;

procedure TFrmBuscarClientesPersonas.labelCedulaClick(Sender: TObject);
begin
  edit1.Text:=labelCedula.Caption;
    RadioGroup1.ItemIndex:=2;
end;

procedure TFrmBuscarClientesPersonas.LabelNombreClick(Sender: TObject);
begin
  edit1.Text:=LabelNombre.Caption;
    RadioGroup1.ItemIndex:=3;
end;

procedure TFrmBuscarClientesPersonas.LabelTelefonoClick(Sender: TObject);
begin
  edit1.Text:=LabelTelefono.Caption;
    RadioGroup1.ItemIndex:=5;
end;

procedure TFrmBuscarClientesPersonas.LabelApodoClick(Sender: TObject);
begin
  edit1.Text:=LabelApodo.Caption;
  RadioGroup1.ItemIndex:=6;
end;

procedure TFrmBuscarClientesPersonas.FormShow(Sender: TObject);
begin
  Edit1.SetFocus;
end;

procedure TFrmBuscarClientesPersonas.DBGrid2Exit(Sender: TObject);
begin
  if DBGrid2.DataSource = dsqryPrestamos then
  begin
    xCodigoCte   := qryPrestamosCODIGO.Value;
    CodigoCliente:= qryPrestamosCodigo.Value;
    xSerie       := qryPrestamosSERIE.Value;
    xCedula      := qryPrestamosCEDULA.Value;
  end else
  if qryClienteStd.RecordCount > 0 then
  begin
    xCodigoCte:= qryClienteStd.Fieldbyname('codigo').Value;
    CodigoCliente:= qryClienteStdCodigo.Value;
    xSerie       := qryClienteStdSERIE.Value;
    xCedula      := qryClienteStdCEDULA.Value;
    if not qryClienteStd.Fieldbyname('NUMERO_cks').IsNull then
    Numerocks := qryClienteStd.Fieldbyname('NUMERO_cks').AsInteger;
  end;
end;

procedure TFrmBuscarClientesPersonas.DBGrid2CellClick(Column: TColumn);
begin
  if dbGrid1.Visible then
  begin
    xSerie := qryPrestamosSERIE.Value;
    CodigoCliente:=qryPrestamosCodigo.Value;
    xCedula:=qryPrestamosCEDULA.Value;
    AsignarDatos(qryPrestamosSerie.AsString,
                 qryPrestamosNUMERO_cks.Value,
                 qryPrestamosCEDULA.Value,
                 qryPrestamosNOMBRE.Value,
                 qryPrestamosTELEF_CONTACTO.Value,''
                 {qryPrestamosAPODO.Value});
  end else
  if dbGrid2.Visible then
  begin
    xSerie := qryClienteStdSERIE.Value;
    codigoCliente:=qryClienteStdCodigo.Value;
    xCedula := qryClienteStdCEDULA.Value;
    AsignarDatos(qryClienteStdserie.AsString,qryClienteStdNUMERO_cks.Value,
    qryClienteStdCEDULA.Value,
    qryClienteStdNOMBRE.Value,
    qryClienteStdTELEF_CONTACTO.Value,'');
    //qryClienteStdAPODO.Value);
  end;

end;

procedure TFrmBuscarClientesPersonas.DBGrid1CellClick(Column: TColumn);
begin
  if dbGrid1.Visible then
  begin
    xSerie := qryPrestamosSERIE.Value;
    CodigoCliente:=qryPrestamosCodigo.Value;
    xCedula:=qryPrestamosCEDULA.Value;
    AsignarDatos(qryPrestamosSerie.AsString,
                 qryPrestamosNUMERO_cks.Value,
                 qryPrestamosCEDULA.Value,
                 qryPrestamosNOMBRE.Value,
                 qryPrestamosTELEF_CONTACTO.Value,''
                 {qryPrestamosAPODO.Value});
  end else
  if dbGrid2.Visible then
  begin
    xSerie := qryClienteStdSERIE.Value;
    codigoCliente:=qryClienteStdCodigo.Value;
    xCedula := qryClienteStdCEDULA.Value;
    AsignarDatos(qryClienteStdserie.AsString,qryClienteStdNUMERO_cks.Value,
    qryClienteStdCEDULA.Value,
    qryClienteStdNOMBRE.Value,
    qryClienteStdTELEF_CONTACTO.Value,'');
    //qryClienteStdAPODO.Value);
  end;

end;

procedure TFrmBuscarClientesPersonas.DBGrid1Exit(Sender: TObject);
begin
  if DBGrid1.DataSource = dsqryPrestamos then
  begin
    xCodigoCte   := qryPrestamosCODIGO.Value;
    CodigoCliente:= qryPrestamosCodigo.Value;
    xSerie       := qryPrestamosSERIE.Value;
    xCedula      := qryPrestamosCEDULA.Value;
  end else
  if qryClienteStd.RecordCount > 0 then
  begin
    xCodigoCte:= qryClienteStd.Fieldbyname('codigo').Value;
    CodigoCliente:= qryClienteStdCodigo.Value;
    xSerie       := qryClienteStdSERIE.Value;
    xCedula      := qryClienteStdCEDULA.Value;
    if not qryClienteStd.Fieldbyname('NUMERO_cks').IsNull then
    Numerocks := qryClienteStd.Fieldbyname('NUMERO_cks').AsInteger;
  end;
end;

procedure TFrmBuscarClientesPersonas.DBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
//  if (field.FieldName = 'Status') and (Field.Value = 'R') then
  if (qryPrestamosSTATUS.Value = 'C') then
  BackGround := clGray else
  if (qryPrestamosSTATUS.Value = 'R') then
  BackGround := $0080FFFF;
end;

end.
