unit UFormBuscarDatosEstudiantes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WinSkinData, Menus, ComCtrls, Grids, DBGrids, RXDBCtrl,
  StdCtrls, ExtCtrls, DBCtrls, Buttons, DB, IBCustomDataSet, IBQuery;

type
  TfrmBuscarEstudiantes = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel2: TPanel;
    ScrollBox1: TScrollBox;
    DBNavigator1: TDBNavigator;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    RadioGroup1: TRadioGroup;
    Edit1: TEdit;
    Button1: TButton;
    chkBoxFiltrar: TCheckBox;
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
    DBGrid1: TRxDBGrid;
    DBGrid2: TRxDBGrid;
    StatusBar1: TStatusBar;
    MainMenu1: TMainMenu;
    MaestroCliente1: TMenuItem;
    SkinData1: TSkinData;
    DataSource1: TDataSource;
    qryClienteStd: TIBQuery;
    qryClienteStdCODIGO_CTE: TIntegerField;
    qryClienteStdTIPO_CLIENTE: TSmallintField;
    qryClienteStdFOTO: TBlobField;
    qryClienteStdNOMBRE_CTE: TIBStringField;
    qryClienteStdNOMBRE_ABREV: TIBStringField;
    qryClienteStdMONEDA_FACT: TIBStringField;
    qryClienteStdNOMBRE_FACTURAR: TIBStringField;
    qryClienteStdCONTACTO: TIBStringField;
    qryClienteStdDIRECCION_CONT: TIBStringField;
    qryClienteStdTELEF_CONTACTO: TIBStringField;
    qryClienteStdFAX_CONTACTO: TIBStringField;
    qryClienteStdFORMA_PAGO: TSmallintField;
    qryClienteStdCODIGO_AGENCIA: TSmallintField;
    qryClienteStdSTATUS_CLIENTE: TIBStringField;
    qryClienteStdINSERTADO_POR: TIBStringField;
    qryClienteStdFECHA_INSERTADO: TDateTimeField;
    qryClienteStdFECHA_MOD: TDateTimeField;
    qryClienteStdMODI_POR: TIBStringField;
    qryClienteStdLIMITE_CREDITO: TFloatField;
    qryClienteStdEMAIL: TIBStringField;
    qryClienteStdWEBSITE: TIBStringField;
    qryClienteStdPAIS: TIBStringField;
    qryClienteStdCodCteconCxc: TIntegerField;
    qryClienteStdCIUDAD: TIBStringField;
    qryClienteStdCEDULA: TIBStringField;
    qryClienteStdRNC: TIBStringField;
    qryClienteStdREFERENCIA: TIBStringField;
    qryClienteStdTELEF_REFERENCIA: TIBStringField;
    qryClienteStdOTRO_TELEFONO: TIBStringField;
    qryClienteStdCANT_DIAS_CREDITO: TSmallintField;
    qryClienteStdTIPO_NCF: TIBStringField;
    qryClienteStdOBSERVACION: TMemoField;
    qryClienteStdLUGAR_DE_TRABAJO: TIBStringField;
    qryClienteStdAPODO: TIBStringField;
    qryClienteStdCODIGO_USUARIO: TIntegerField;
    qryClienteStdRNC_NUMERO: TIBStringField;
    dsqryClientes: TDataSource;
    qryClientes: TIBQuery;
    IBQuery1: TIBQuery;
    qryCteConCxc: TIBQuery;
    qryCteConCxcCODIGO_CTE: TIntegerField;
    qryListaEstudiantes: TIBQuery;
    dsqryListaEstudiantes: TDataSource;
    qryListaEstudiantesID_ESTUDIANTE: TIntegerField;
    qryListaEstudiantesIDFAMILIA: TIntegerField;
    qryListaEstudiantesPRIMERNOMBRE: TIBStringField;
    qryListaEstudiantesSEGUNDONOMBRE: TIBStringField;
    qryListaEstudiantesPRIMERAPELLIDO: TIBStringField;
    qryListaEstudiantesSEGUNDOAPELLIDO: TIBStringField;
    qryListaEstudiantesFECHANACIMIENTO: TDateTimeField;
    qryListaEstudiantesTELEFONO: TIBStringField;
    qryListaEstudiantesCELULAR: TIBStringField;
    qryListaEstudiantesEMAIL: TIBStringField;
    qryListaEstudiantesFECHA_IN: TDateTimeField;
    qryListaEstudiantesIN_POR: TIBStringField;
    qryListaEstudiantesCOD_USUARIO: TIntegerField;
    qryListaEstudiantesSTATUS: TIBStringField;
    qryListaEstudiantesIDANOESCOLAR: TIntegerField;
    qryListaEstudiantesIDCURSO: TIntegerField;
    qryListaEstudiantesID_ESTUDIANTE1: TIntegerField;
    qryListaEstudiantesIDNIVEL: TIntegerField;
    qryListaEstudiantesFECHA_IN1: TDateTimeField;
    qryListaEstudiantesIN_POR1: TIBStringField;
    qryListaEstudiantesCOD_USUARIO1: TIntegerField;
    qryListaEstudiantesSTATUS1: TIBStringField;
    qryListaEstudiantesNUMERO_ESTUDIANTE: TIBStringField;
    qryListaEstudiantesCODIGO_CTE: TIntegerField;
    qryListaEstudiantesCIA_KEY: TIntegerField;
    qryListaEstudiantesTIPO_CLIENTE: TSmallintField;
    qryListaEstudiantesFOTO: TBlobField;
    qryListaEstudiantesNOMBRE_CTE: TIBStringField;
    qryListaEstudiantesNOMBRE_ABREV: TIBStringField;
    qryListaEstudiantesMONEDA_FACT: TIBStringField;
    qryListaEstudiantesNOMBRE_FACTURAR: TIBStringField;
    qryListaEstudiantesCONTACTO: TIBStringField;
    qryListaEstudiantesDIRECCION_CONT: TIBStringField;
    qryListaEstudiantesTELEF_CONTACTO: TIBStringField;
    qryListaEstudiantesFAX_CONTACTO: TIBStringField;
    qryListaEstudiantesFORMA_PAGO: TSmallintField;
    qryListaEstudiantesCODIGO_AGENCIA: TSmallintField;
    qryListaEstudiantesSTATUS_CLIENTE: TIBStringField;
    qryListaEstudiantesINSERTADO_POR: TIBStringField;
    qryListaEstudiantesFECHA_INSERTADO: TDateTimeField;
    qryListaEstudiantesFECHA_MOD: TDateTimeField;
    qryListaEstudiantesMODI_POR: TIBStringField;
    qryListaEstudiantesLIMITE_CREDITO: TFloatField;
    qryListaEstudiantesEMAIL1: TIBStringField;
    qryListaEstudiantesWEBSITE: TIBStringField;
    qryListaEstudiantesPAIS: TIBStringField;
    qryListaEstudiantesCIUDAD: TIBStringField;
    qryListaEstudiantesCEDULA: TIBStringField;
    qryListaEstudiantesRNC: TIBStringField;
    qryListaEstudiantesREFERENCIA: TIBStringField;
    qryListaEstudiantesTELEF_REFERENCIA: TIBStringField;
    qryListaEstudiantesOTRO_TELEFONO: TIBStringField;
    qryListaEstudiantesCANT_DIAS_CREDITO: TSmallintField;
    qryListaEstudiantesTIPO_NCF: TIBStringField;
    qryListaEstudiantesOBSERVACION: TMemoField;
    qryListaEstudiantesLUGAR_DE_TRABAJO: TIBStringField;
    qryListaEstudiantesAPODO: TIBStringField;
    qryListaEstudiantesCODIGO_USUARIO: TIntegerField;
    qryListaEstudiantesRNC_NUMERO: TIBStringField;
    qryListaEstudiantesCOMENTARIO: TMemoField;
    qryListaEstudiantesCONDICION: TIntegerField;
    qryListaEstudiantesPRECIO_ID: TIntegerField;
    qryListaEstudiantesCODIGO: TIntegerField;
    qryListaEstudiantesFECHASALIDA: TDateTimeField;
    qryListaEstudiantesFECHAENTRADA: TDateTimeField;
    qryListaEstudiantesCEDULA_PADRE: TIBStringField;
    qryListaEstudiantesPRIMERNOMBREPADRE: TIBStringField;
    qryListaEstudiantesSEGUNDONOMBREPADRE: TIBStringField;
    qryListaEstudiantesPRIMERAPELLIDOPADRE: TIBStringField;
    qryListaEstudiantesSEGUNDOAPELLIDOPADRE: TIBStringField;
    qryListaEstudiantesCEDULA_MADRE: TIBStringField;
    qryListaEstudiantesPRIMERNOMBREMADRE: TIBStringField;
    qryListaEstudiantesSEGUNDONOMBREMADRE: TIBStringField;
    qryListaEstudiantesPRIMERAPELLIDOMADRE: TIBStringField;
    qryListaEstudiantesSEGUNDOAPELLIDOMADRE: TIBStringField;
    qryListaEstudiantesSTATUS2: TIBStringField;
    qryClientesID_ESTUDIANTE: TIntegerField;
    qryClientesIDFAMILIA: TIntegerField;
    qryClientesPRIMERNOMBRE: TIBStringField;
    qryClientesSEGUNDONOMBRE: TIBStringField;
    qryClientesPRIMERAPELLIDO: TIBStringField;
    qryClientesSEGUNDOAPELLIDO: TIBStringField;
    qryClientesFECHANACIMIENTO: TDateTimeField;
    qryClientesTELEFONO: TIBStringField;
    qryClientesCELULAR: TIBStringField;
    qryClientesEMAIL: TIBStringField;
    qryClientesFECHA_IN: TDateTimeField;
    qryClientesIN_POR: TIBStringField;
    qryClientesCOD_USUARIO: TIntegerField;
    qryClientesSTATUS: TIBStringField;
    qryClientesIDANOESCOLAR: TIntegerField;
    qryClientesIDCURSO: TIntegerField;
    qryClientesID_ESTUDIANTE1: TIntegerField;
    qryClientesIDNIVEL: TIntegerField;
    qryClientesFECHA_IN1: TDateTimeField;
    qryClientesIN_POR1: TIBStringField;
    qryClientesCOD_USUARIO1: TIntegerField;
    qryClientesSTATUS1: TIBStringField;
    qryClientesNUMERO_ESTUDIANTE: TIBStringField;
    qryClientesCODIGO_CTE: TIntegerField;
    qryClientesCIA_KEY: TIntegerField;
    qryClientesTIPO_CLIENTE: TSmallintField;
    qryClientesFOTO: TBlobField;
    qryClientesNOMBRE_CTE: TIBStringField;
    qryClientesNOMBRE_ABREV: TIBStringField;
    qryClientesMONEDA_FACT: TIBStringField;
    qryClientesNOMBRE_FACTURAR: TIBStringField;
    qryClientesCONTACTO: TIBStringField;
    qryClientesDIRECCION_CONT: TIBStringField;
    qryClientesTELEF_CONTACTO: TIBStringField;
    qryClientesFAX_CONTACTO: TIBStringField;
    qryClientesFORMA_PAGO: TSmallintField;
    qryClientesCODIGO_AGENCIA: TSmallintField;
    qryClientesSTATUS_CLIENTE: TIBStringField;
    qryClientesINSERTADO_POR: TIBStringField;
    qryClientesFECHA_INSERTADO: TDateTimeField;
    qryClientesFECHA_MOD: TDateTimeField;
    qryClientesMODI_POR: TIBStringField;
    qryClientesLIMITE_CREDITO: TFloatField;
    qryClientesEMAIL1: TIBStringField;
    qryClientesWEBSITE: TIBStringField;
    qryClientesPAIS: TIBStringField;
    qryClientesCIUDAD: TIBStringField;
    qryClientesCEDULA: TIBStringField;
    qryClientesRNC: TIBStringField;
    qryClientesREFERENCIA: TIBStringField;
    qryClientesTELEF_REFERENCIA: TIBStringField;
    qryClientesOTRO_TELEFONO: TIBStringField;
    qryClientesCANT_DIAS_CREDITO: TSmallintField;
    qryClientesTIPO_NCF: TIBStringField;
    qryClientesOBSERVACION: TMemoField;
    qryClientesLUGAR_DE_TRABAJO: TIBStringField;
    qryClientesAPODO: TIBStringField;
    qryClientesCODIGO_USUARIO: TIntegerField;
    qryClientesRNC_NUMERO: TIBStringField;
    qryClientesCOMENTARIO: TMemoField;
    qryClientesCONDICION: TIntegerField;
    qryClientesPRECIO_ID: TIntegerField;
    qryClientesCODIGO: TIntegerField;
    qryClientesFECHASALIDA: TDateTimeField;
    qryClientesFECHAENTRADA: TDateTimeField;
    qryClientesCEDULA_PADRE: TIBStringField;
    qryClientesPRIMERNOMBREPADRE: TIBStringField;
    qryClientesSEGUNDONOMBREPADRE: TIBStringField;
    qryClientesPRIMERAPELLIDOPADRE: TIBStringField;
    qryClientesSEGUNDOAPELLIDOPADRE: TIBStringField;
    qryClientesCEDULA_MADRE: TIBStringField;
    qryClientesPRIMERNOMBREMADRE: TIBStringField;
    qryClientesSEGUNDONOMBREMADRE: TIBStringField;
    qryClientesPRIMERAPELLIDOMADRE: TIBStringField;
    qryClientesSEGUNDOAPELLIDOMADRE: TIBStringField;
    qryClientesSTATUS2: TIBStringField;
    IBQuery1ID_ESTUDIANTE: TIntegerField;
    IBQuery1IDFAMILIA: TIntegerField;
    IBQuery1PRIMERNOMBRE: TIBStringField;
    IBQuery1SEGUNDONOMBRE: TIBStringField;
    IBQuery1PRIMERAPELLIDO: TIBStringField;
    IBQuery1SEGUNDOAPELLIDO: TIBStringField;
    IBQuery1FECHANACIMIENTO: TDateTimeField;
    IBQuery1TELEFONO: TIBStringField;
    IBQuery1CELULAR: TIBStringField;
    IBQuery1EMAIL: TIBStringField;
    IBQuery1FECHA_IN: TDateTimeField;
    IBQuery1IN_POR: TIBStringField;
    IBQuery1COD_USUARIO: TIntegerField;
    IBQuery1STATUS: TIBStringField;
    IBQuery1IDANOESCOLAR: TIntegerField;
    IBQuery1IDCURSO: TIntegerField;
    IBQuery1ID_ESTUDIANTE1: TIntegerField;
    IBQuery1IDNIVEL: TIntegerField;
    IBQuery1FECHA_IN1: TDateTimeField;
    IBQuery1IN_POR1: TIBStringField;
    IBQuery1COD_USUARIO1: TIntegerField;
    IBQuery1STATUS1: TIBStringField;
    IBQuery1NUMERO_ESTUDIANTE: TIBStringField;
    IBQuery1CODIGO_CTE: TIntegerField;
    IBQuery1CIA_KEY: TIntegerField;
    IBQuery1TIPO_CLIENTE: TSmallintField;
    IBQuery1FOTO: TBlobField;
    IBQuery1NOMBRE_CTE: TIBStringField;
    IBQuery1NOMBRE_ABREV: TIBStringField;
    IBQuery1MONEDA_FACT: TIBStringField;
    IBQuery1NOMBRE_FACTURAR: TIBStringField;
    IBQuery1CONTACTO: TIBStringField;
    IBQuery1DIRECCION_CONT: TIBStringField;
    IBQuery1TELEF_CONTACTO: TIBStringField;
    IBQuery1FAX_CONTACTO: TIBStringField;
    IBQuery1FORMA_PAGO: TSmallintField;
    IBQuery1CODIGO_AGENCIA: TSmallintField;
    IBQuery1STATUS_CLIENTE: TIBStringField;
    IBQuery1INSERTADO_POR: TIBStringField;
    IBQuery1FECHA_INSERTADO: TDateTimeField;
    IBQuery1FECHA_MOD: TDateTimeField;
    IBQuery1MODI_POR: TIBStringField;
    IBQuery1LIMITE_CREDITO: TFloatField;
    IBQuery1EMAIL1: TIBStringField;
    IBQuery1WEBSITE: TIBStringField;
    IBQuery1PAIS: TIBStringField;
    IBQuery1CIUDAD: TIBStringField;
    IBQuery1CEDULA: TIBStringField;
    IBQuery1RNC: TIBStringField;
    IBQuery1REFERENCIA: TIBStringField;
    IBQuery1TELEF_REFERENCIA: TIBStringField;
    IBQuery1OTRO_TELEFONO: TIBStringField;
    IBQuery1CANT_DIAS_CREDITO: TSmallintField;
    IBQuery1TIPO_NCF: TIBStringField;
    IBQuery1OBSERVACION: TMemoField;
    IBQuery1LUGAR_DE_TRABAJO: TIBStringField;
    IBQuery1APODO: TIBStringField;
    IBQuery1CODIGO_USUARIO: TIntegerField;
    IBQuery1RNC_NUMERO: TIBStringField;
    IBQuery1COMENTARIO: TMemoField;
    IBQuery1CONDICION: TIntegerField;
    IBQuery1PRECIO_ID: TIntegerField;
    IBQuery1CODIGO: TIntegerField;
    IBQuery1FECHASALIDA: TDateTimeField;
    IBQuery1FECHAENTRADA: TDateTimeField;
    IBQuery1CEDULA_PADRE: TIBStringField;
    IBQuery1PRIMERNOMBREPADRE: TIBStringField;
    IBQuery1SEGUNDONOMBREPADRE: TIBStringField;
    IBQuery1PRIMERAPELLIDOPADRE: TIBStringField;
    IBQuery1SEGUNDOAPELLIDOPADRE: TIBStringField;
    IBQuery1CEDULA_MADRE: TIBStringField;
    IBQuery1PRIMERNOMBREMADRE: TIBStringField;
    IBQuery1SEGUNDONOMBREMADRE: TIBStringField;
    IBQuery1PRIMERAPELLIDOMADRE: TIBStringField;
    IBQuery1SEGUNDOAPELLIDOMADRE: TIBStringField;
    IBQuery1STATUS2: TIBStringField;
    IBQuery1SECCION: TIBStringField;
    IBQuery1DESC_CURSO: TIBStringField;
    qryListaEstudiantesSECCION: TIBStringField;
    qryListaEstudiantesDESC_CURSO: TIBStringField;
    qryClientesSECCION: TIBStringField;
    qryClientesDESC_CURSO: TIBStringField;
    qryClienteStdID_ESTUDIANTE: TIntegerField;
    qryClienteStdIDFAMILIA: TIntegerField;
    qryClienteStdPRIMERNOMBRE: TIBStringField;
    qryClienteStdSEGUNDONOMBRE: TIBStringField;
    qryClienteStdPRIMERAPELLIDO: TIBStringField;
    qryClienteStdSEGUNDOAPELLIDO: TIBStringField;
    qryClienteStdFECHANACIMIENTO: TDateTimeField;
    qryClienteStdTELEFONO: TIBStringField;
    qryClienteStdCELULAR: TIBStringField;
    qryClienteStdCOD_USUARIO: TIntegerField;
    qryClienteStdSTATUS: TIBStringField;
    qryClienteStdIDANOESCOLAR: TIntegerField;
    qryClienteStdIDCURSO: TIntegerField;
    qryClienteStdID_ESTUDIANTE1: TIntegerField;
    qryClienteStdIDNIVEL: TIntegerField;
    qryClienteStdFECHA_IN1: TDateTimeField;
    qryClienteStdIN_POR1: TIBStringField;
    qryClienteStdCOD_USUARIO1: TIntegerField;
    qryClienteStdSTATUS1: TIBStringField;
    qryClienteStdNUMERO_ESTUDIANTE: TIBStringField;
    qryClienteStdCIA_KEY: TIntegerField;
    qryClienteStdEMAIL1: TIBStringField;
    qryClienteStdCOMENTARIO: TMemoField;
    qryClienteStdCONDICION: TIntegerField;
    qryClienteStdPRECIO_ID: TIntegerField;
    qryClienteStdCODIGO: TIntegerField;
    qryClienteStdFECHASALIDA: TDateTimeField;
    qryClienteStdFECHAENTRADA: TDateTimeField;
    qryClienteStdCEDULA_PADRE: TIBStringField;
    qryClienteStdPRIMERNOMBREPADRE: TIBStringField;
    qryClienteStdSEGUNDONOMBREPADRE: TIBStringField;
    qryClienteStdPRIMERAPELLIDOPADRE: TIBStringField;
    qryClienteStdSEGUNDOAPELLIDOPADRE: TIBStringField;
    qryClienteStdCEDULA_MADRE: TIBStringField;
    qryClienteStdPRIMERNOMBREMADRE: TIBStringField;
    qryClienteStdSEGUNDONOMBREMADRE: TIBStringField;
    qryClienteStdPRIMERAPELLIDOMADRE: TIBStringField;
    qryClienteStdSEGUNDOAPELLIDOMADRE: TIBStringField;
    qryClienteStdSECCION: TIBStringField;
    qryClienteStdDESC_CURSO: TIBStringField;
    Label9: TLabel;
    cboxListaCursos: TComboBox;
    qryCursos: TIBQuery;
    qryCursosIDCURSO: TIntegerField;
    qryCursosIDNIVEL: TIntegerField;
    qryCursosSECCION: TIBStringField;
    qryCursosDESCRIPCION: TIBStringField;
    qryCursosSTATUS: TIBStringField;
    spbtnFiltracurso: TSpeedButton;
    procedure Edit1Enter(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure spbtnFiltracursoClick(Sender: TObject);
    procedure DBGrid2CellClick(Column: TColumn);
  private
    procedure AsignarSqlText(campo:string;valor:string; OrderBy : String);
    procedure AsignarSqlTextFiltraCurso;
    procedure AsignarDatos(Numhist, Nss, Cedula, Nombre, Telefono, Apodo:String);
  public
    { Public declarations }
    xCodigoCte : Integer;
    Numerocks  : Integer;
    CodigoCliente : Integer;
    xSerie : Integer;
    xCedula : String;
    nombrecliente : String;
  end;

var
  frmBuscarEstudiantes: TfrmBuscarEstudiantes;

implementation
uses UDatModConectar, UGlobal, UDatModClientes, UMaestroClientes,
  UBuscarClientesPersonasP;

{$R *.dfm}

procedure TfrmBuscarEstudiantes.AsignarSqlText(campo, valor,
  OrderBy: String);
begin
  if qryClienteStd.Active then
  qryClienteStd.close;
  qryClienteStd.Database:= dmConectar.IBDatabase1;
  if (Length(cboxListaCursos.Text) > 0) then
  qryClienteStd.SQL.Text:=
  Format(IBQuery1.Text +
  ' WHERE UPPER(%s) Like %s and upper(SECCION) = %s order by %s',[Campo, Valor, chr(39)+uppercase(trim(cboxListaCursos.Text))+chr(39),OrderBy])
  else
  qryClienteStd.SQL.Text:=
  Format(IBQuery1.Text +
  ' WHERE UPPER(%s) Like %s order by %s',[Campo, Valor, OrderBy]);
end;

procedure TfrmBuscarEstudiantes.Edit1Enter(Sender: TObject);
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

procedure TfrmBuscarEstudiantes.RadioGroup1Click(Sender: TObject);
begin
  if (Edit1.Text = '') and (Sender is TComboBox ) then
  begin
    spbtnFiltracursoClick(self);
    Exit;
  end;
  if RadioGroup1.ItemIndex = 6 then exit;//esto hasta que agregues apodo a la tabla cliente
  Panel4.Visible:=False;
  Edit1Enter(Self);
  if Edit1.Text <> '' then
  if Not chkBoxFiltrar.Checked then
  begin
    DBGrid1.DataSource:=dsqryClientes;
    DBGrid1.Visible:=False;
    DBGrid2.Visible:=False;
    Panel4.Visible:=False;
  end;
  if chkBoxFiltrar.Checked And (RadioGroup1.ItemIndex >= 0) then
  begin
    GlbCampoFilterCte:='';
    case RadioGroup1.ItemIndex of
    0: glbCampoFilterCte:='NUMERO_ESTUDIANTE';
    1: glbCampoFilterCte:='CEDULA';
    2: glbCampoFilterCte:='PRIMERNOMBRE';
    3: glbCampoFilterCte:='PRIMERAPELLIDO';
    4: glbCampoFilterCte:='Telef_contacto';
    end;

    case RadioGroup1.ItemIndex of
    0: GlbOrderBy :=' order by NUMERO_ESTUDIANTE';
    1: GlbOrderBy :=' order by CEDULA';
    2: GlbOrderBy :=' order by PRIMERNOMBRE';
    3: GlbOrderBy :=' order by PRIMERAPELLIDO';
    4: GlbOrderBy :=' order by Telef_contacto';
    end;

    if (Edit1.Text <> '') then
    glbValueFilterCte :=UpperCase(Edit1.Text);
    if (glbCampoFilterCte <>'')then
    begin
      AsignarSqlText(GlbcampoFilterCte,chr(39) +GlbValueFilterCte+'%'+chr(39), GlbOrderBy);
      Texto:= qryClienteStd.Text;
      if (GlbValueFilterCte <> '') then
      qryClienteStd.Open;
      DataSource1.DataSet:= QryClienteStd;
      DBGrid2.DataSource := DataSource1;
      DBGrid1.Visible:=False;
      DBGrid2.Visible := True;
      AsignarDatos(
      qryClienteStdcodigo_Cte.AsString,
      '',
      qryClienteStdCEDULA.Value,
      qryClienteStdNOMBRE_cte.Value,
      qryClienteStdTELEF_contacto.Value,'');
      qryClientes.Filtered:=False;
      Exit;
    end;
    if DBGrid2.Visible Or DBGrid1.Visible then
    Panel4.Visible := True else Panel4.Visible := False;
  end;

  qryClientes.Filtered := False;
  if qryClientes.State = dsInactive then
  qryClientes.Open;

  if RadioGroup1.ItemIndex = 0 then
  begin
    if Edit1.Text = '' then Exit;
    if qryClientes.state = dsInactive then
    qryClientes.Open;
    if Not qryClientes.Locate('NUMERO_ESTUDIANTE',StrToInt(Edit1.Text),[loCaseInsensitive,loPartialKey]) then
    dbgrid1.Visible:=False else dbgrid1.Visible:=True;
  end else if RadioGroup1.ItemIndex = 1 then
  begin
    if Not qryClientes.Locate('cedula',Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    dbgrid1.Visible:=False else  dbgrid1.Visible:=True;
  end else if RadioGroup1.ItemIndex = 2 then
  begin
    if not qryClientes.Locate('PRIMERNOMBRE',Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    dbgrid1.Visible:=False else  dbgrid1.Visible:=True;
  end else if RadioGroup1.ItemIndex = 3 then
  begin
    if not qryClientes.Locate('PRIMERAPELLIDO',Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    dbgrid1.Visible:=False else  dbGrid1.Visible:=True;
  end else if RadioGroup1.ItemIndex = 4 then
  begin
    if not qryClientes.Locate('TELEF_contacto',Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    dbgrid1.Visible:=False else  dbGrid1.Visible:=True;
  end else if RadioGroup1.ItemIndex = 5 then
  begin
    if not qryClientes.Locate('Apodo',Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    dbgrid1.Visible:=False else  dbGrid1.Visible:=True;
  end;
  Edit1Enter(Self);
  if frmBuscarEstudiantes.Showing then
  Edit1.SetFocus;
  if dbGrid1.Visible then
  begin
    CodigoCliente:=qryClientesCodigo_cte.Value;
    xCedula:=qryClientesCEDULA.Value;
    AsignarDatos(qryClientescodigo_cte.AsString,
                 '',
                 qryClientesCEDULA.Value,
                 qryClientesNOMBRE_cte.Value,
                 qryClientesTELEF_CONTACTO.Value,'');
  end else
  if dbGrid2.Visible then
  begin
    codigoCliente:=qryClienteStdCodigo_cte.Value;
    xCedula := qryClienteStdCEDULA.Value;
    AsignarDatos(qryClienteStdcodigo_Cte.AsString,'',
    qryClienteStdCEDULA.Value,
    qryClienteStdNOMBRE_cte.Value,
    qryClienteStdTELEF_CONTACTO.Value,'');
  end;
end;

procedure TfrmBuscarEstudiantes.FormCreate(Sender: TObject);
begin
  qryListaEstudiantes.Close;
  qryListaEstudiantes.Open;
  cboxListaCursos.Items.Clear;
  qryCursos.Close;
  qryCursos.Open;
  qryCursos.First;
  While Not qryCursos.Eof Do
  begin
    cboxListaCursos.Items.Add(qryCursosSECCION.Value);
    qryCursos.Next;
  end;
  cboxListaCursos.ItemIndex:=0;
  if qryClientes.State = dsInactive then
  qryClientes.Open;
  qryClientes.Close;
  qryClientes.Filtered:=False;
  xCodigoCte:=0;
  nombrecliente:='';
end;

procedure TfrmBuscarEstudiantes.AsignarDatos(Numhist, Nss, Cedula, Nombre,
  Telefono, Apodo: String);
begin
  Panel4.Visible:=True;
  LabelNumHist.Caption := numhist;
  labelNSS.Caption     := nss;
  labelCedula.Caption  := cedula;
  LabelNombre.Caption  := nombre;
  LabelTelefono.Caption:= telefono;
  LabelApodo.Caption   := apodo;
  nombrecliente:= nombre;
end;

procedure TfrmBuscarEstudiantes.AsignarSqlTextFiltraCurso;
begin
  if qryClienteStd.Active then
  qryClienteStd.close;
  qryClienteStd.Database:= dmConectar.IBDatabase1;
  if (spbtnFiltracurso.Caption = 'Quita Filtro') then
  begin
    qryClienteStd.SQL.Text:= IBQuery1.Text;
    spbtnFiltracurso.Caption := 'Filtrar';
    spbtnFiltracurso.Font.Color := clBlack;
  end else
  if (Length(cboxListaCursos.Text) > 0) then
  begin
    qryClienteStd.SQL.Text:=
    Format(IBQuery1.Text +
    ' WHERE upper(SECCION) = %s ',[chr(39)+uppercase(trim(cboxListaCursos.Text))+chr(39)]);
    spbtnFiltracurso.Font.Color := clRed;
    spbtnFiltracurso.Caption := 'Quita Filtro';
  end;
{  else
  qryClienteStd.SQL.Text:=
  Format(IBQuery1.Text +
  ' WHERE UPPER(%s) Like %s %s',[Campo, Valor, OrderBy]);}

  qryClienteStd.Open;
  DataSource1.DataSet:= QryClienteStd;
  DBGrid2.DataSource := DataSource1;
  DBGrid1.Visible:=False;
  DBGrid2.Visible := True;
  AsignarDatos(
  qryClienteStdcodigo_Cte.AsString,
  '',
  qryClienteStdCEDULA.Value,
  qryClienteStdNOMBRE_cte.Value,
  qryClienteStdTELEF_contacto.Value,'');
  qryClientes.Filtered:=False;
end;

procedure TfrmBuscarEstudiantes.spbtnFiltracursoClick(Sender: TObject);
begin
  AsignarSqlTextFiltraCurso;
end;

procedure TfrmBuscarEstudiantes.DBGrid2CellClick(Column: TColumn);
begin
  if dbGrid1.Visible then
  begin
    //xSerie := qryPrestamosSERIE.Value;
    CodigoCliente:=qryClientesCodigo_Cte.Value;
    xCedula:=qryClientesCEDULA.Value;
    AsignarDatos(qryClientescodigo_cte.AsString,
                 '',
                 qryClientesCEDULA.Value,
                 qryClientesNOMBRE_cte.Value,
                 qryClientesTELEF_CONTACTO.Value,''
                 {qryPrestamosAPODO.Value});
  end else
  if dbGrid2.Visible then
  begin
    //xSerie := qryClienteStdSERIE.Value;
    if (qryListaEstudiantes.state = dsBrowse) and (qryClienteStd.State = dsInactive) then
    begin
      codigoCliente:=qryListaEstudiantesCodigo_cte.Value;
      xCedula := qryListaEstudiantesCEDULA.Value;
      AsignarDatos(qryListaEstudiantescodigo_cte.AsString,'',
      qryListaEstudiantesCEDULA.Value,
      qryListaEstudiantesNOMBRE_cte.Value,
      qryListaEstudiantesTELEF_CONTACTO.Value,'');
    end else
    begin
      codigoCliente:=qryClienteStdCodigo_cte.Value;
      xCedula := qryClienteStdCEDULA.Value;
      AsignarDatos(qryClienteStdcodigo_cte.AsString,'',
      qryClienteStdCEDULA.Value,
      qryClienteStdNOMBRE_cte.Value,
      qryClienteStdTELEF_CONTACTO.Value,'');
    end;
    //qryClienteStdAPODO.Value);
  end;
end;

end.
