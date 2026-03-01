unit UFormPromoverEstudiantes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, DB, IBCustomDataSet, IBQuery, Grids, DBGrids,
  RXDBCtrl, ExtCtrls, RxMemDS, WinSkinData;

type
  TfrmPromoverEstudiantes = class(TForm)
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
    qryListaEstudiantes: TIBQuery;
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
    qryListaEstudiantesSECCION: TIBStringField;
    qryListaEstudiantesDESC_CURSO: TIBStringField;
    dsqryListaEstudiantes: TDataSource;
    IBQuery1: TIBQuery;
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
    DataSource1: TDataSource;
    Panel1: TPanel;
    Label9: TLabel;
    cboxListaCursos: TComboBox;
    spbtnFiltracurso: TSpeedButton;
    chkBoxFiltrar: TCheckBox;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    DBGrid1: TRxDBGrid;
    DBGrid2: TRxDBGrid;
    qryCursos: TIBQuery;
    qryCursosIDCURSO: TIntegerField;
    qryCursosIDNIVEL: TIntegerField;
    qryCursosSECCION: TIBStringField;
    qryCursosDESCRIPCION: TIBStringField;
    qryCursosSTATUS: TIBStringField;
    dsqryClientes: TDataSource;
    qryClientes: TIBQuery;
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
    qryClientesSECCION: TIBStringField;
    qryClientesDESC_CURSO: TIBStringField;
    RadioGroup1: TRadioGroup;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Button1: TButton;
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
    dsqryPrestamos: TDataSource;
    qryCteConCxc: TIBQuery;
    qryCteConCxcCODIGO_CTE: TIntegerField;
    qryPrestamos: TIBQuery;
    qryPrestamosCODIGO_CTE: TIntegerField;
    qryPrestamosTIPO_CLIENTE: TSmallintField;
    qryPrestamosFOTO: TBlobField;
    qryPrestamosNOMBRE_CTE: TIBStringField;
    qryPrestamosNOMBRE_ABREV: TIBStringField;
    qryPrestamosMONEDA_FACT: TIBStringField;
    qryPrestamosNOMBRE_FACTURAR: TIBStringField;
    qryPrestamosCONTACTO: TIBStringField;
    qryPrestamosDIRECCION_CONT: TIBStringField;
    qryPrestamosTELEF_CONTACTO: TIBStringField;
    qryPrestamosFAX_CONTACTO: TIBStringField;
    qryPrestamosFORMA_PAGO: TSmallintField;
    qryPrestamosCODIGO_AGENCIA: TSmallintField;
    qryPrestamosSTATUS_CLIENTE: TIBStringField;
    qryPrestamosINSERTADO_POR: TIBStringField;
    qryPrestamosFECHA_INSERTADO: TDateTimeField;
    qryPrestamosFECHA_MOD: TDateTimeField;
    qryPrestamosMODI_POR: TIBStringField;
    qryPrestamosLIMITE_CREDITO: TFloatField;
    qryPrestamosEMAIL: TIBStringField;
    qryPrestamosWEBSITE: TIBStringField;
    qryPrestamosPAIS: TIBStringField;
    qryPrestamosCIUDAD: TIBStringField;
    qryPrestamosCEDULA: TIBStringField;
    qryPrestamosRNC: TIBStringField;
    qryPrestamosREFERENCIA: TIBStringField;
    qryPrestamosTELEF_REFERENCIA: TIBStringField;
    qryPrestamosOTRO_TELEFONO: TIBStringField;
    qryPrestamosCANT_DIAS_CREDITO: TSmallintField;
    qryPrestamosTIPO_NCF: TIBStringField;
    qryPrestamosOBSERVACION: TMemoField;
    qryPrestamosLUGAR_DE_TRABAJO: TIBStringField;
    qryPrestamosAPODO: TIBStringField;
    qryPrestamosCODIGO_USUARIO: TIntegerField;
    qryPrestamosRNC_NUMERO: TIBStringField;
    qryPrestamosCodCteconCxc: TIntegerField;
    Label10: TLabel;
    ComboBox1: TComboBox;
    Label11: TLabel;
    edtNewAnoEscolar: TComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    RxDBGrid1: TRxDBGrid;
    rxNuevoCursoDet: TRxMemoryData;
    rxNuevoCursoDetNombreEstudiante: TStringField;
    rxNuevoCursoDetidAnoEscolar: TIntegerField;
    rxNuevoCursoDetIdCurso: TIntegerField;
    rxNuevoCursoDetId_Estudiante: TIntegerField;
    rxNuevoCursoDetIdNivel: TIntegerField;
    BitBtn5: TBitBtn;
    Label12: TLabel;
    Label13: TLabel;
    SkinData1: TSkinData;
    dsrxNuevoCursoDet: TDataSource;
    rxNuevoCursoDetNumeroEstudiante: TStringField;
    Label14: TLabel;
    edtCursoNew: TComboBox;
    edtNivelModalidad: TComboBox;
    Label15: TLabel;
    qryCursosNew: TIBQuery;
    qryCursosNewIDCURSO: TIntegerField;
    qryCursosNewIDNIVEL: TIntegerField;
    qryCursosNewSECCION: TIBStringField;
    qryCursosNewDESCRIPCION: TIBStringField;
    qryCursosNewSTATUS: TIBStringField;
    qryAnoEscolar: TIBQuery;
    qryAnoEscolarCODIGO: TIntegerField;
    qryAnoEscolarIDANO_INICIAL: TIntegerField;
    qryAnoEscolarIDANO_FINAL: TIntegerField;
    qryAnoEscolarDESCRIPCION: TIBStringField;
    qryAnoEscolarMESINICIAMENSUALIDAD: TDateTimeField;
    qryAnoEscolarMESFINMENSUALIDAD: TDateTimeField;
    qryAnoEscolarSTATUS: TIBStringField;
    BitBtn6: TBitBtn;
    tblActualizarCursoDet: TIBDataSet;
    tblActualizarCursoDetIDANOESCOLAR: TIntegerField;
    tblActualizarCursoDetIDCURSO: TIntegerField;
    tblActualizarCursoDetID_ESTUDIANTE: TIntegerField;
    tblActualizarCursoDetIDNIVEL: TIntegerField;
    tblActualizarCursoDetFECHA_IN: TDateTimeField;
    tblActualizarCursoDetIN_POR: TIBStringField;
    tblActualizarCursoDetCOD_USUARIO: TIntegerField;
    tblActualizarCursoDetSTATUS: TIBStringField;
    tblActualizarCursoDetNUMERO_ESTUDIANTE: TIBStringField;
    procedure spbtnFiltracursoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cboxListaCursosChange(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure edtNivelModalidadChange(Sender: TObject);
    procedure edtNewAnoEscolarChange(Sender: TObject);
    procedure edtCursoNewChange(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure DBGrid2CellClick(Column: TColumn);


  private
    procedure ShowTotalRcd(accion:smallint);
    { Private declarations }
    procedure AsignarDatos(Numhist, Nss, Cedula, Nombre, Telefono, Apodo:String);
    procedure AsignarSqlText(campo:string;valor:string; OrderBy : String);
    procedure PreCargarEstudiante(accion:smallint);
    procedure ProcActualizaCursoAnterior;
    procedure ProcinsertCursoNewCurso;
  public
    { Public declarations }
    xCodigoCte : Integer;
    Numerocks  : Integer;
    CodigoCliente : Integer;
    xSerie : Integer;
    xCedula : String;
    nombrecliente : String;
    codAnioEscolar : Integer;
    codAnioEscolarNew : Integer;
    CodNivelModalidadNew : Integer;
    codNewCurso : Integer;
  end;

var
  frmPromoverEstudiantes: TfrmPromoverEstudiantes;
  Texto: String;
implementation

uses UDatModConectar, Uglobal, UDatModClientes, UMaestroClientes,
  UDatModEstudiante;


{$R *.dfm}

procedure DBGridSelectAll(AGrid: TDBGrid) ;
begin
   AGrid.SelectedRows.Clear;
   with AGrid.DataSource.DataSet do
   begin
     DisableControls;
     First;
     try
       while not EOF do
       begin
         AGrid.SelectedRows.CurrentRowSelected := True;
         Next;
       end;
     finally
       EnableControls;
     end;
   end;
end;

procedure TfrmPromoverEstudiantes.AsignarDatos(Numhist, Nss, Cedula,
  Nombre, Telefono, Apodo: String);
begin

end;

procedure TfrmPromoverEstudiantes.spbtnFiltracursoClick(Sender: TObject);
begin
  if qryClienteStd.Active then
  qryClienteStd.close;
  qryClienteStd.Database:= dmConectar.IBDatabase1;
  if (spbtnFiltracurso.Caption = 'Quita Filtro') then
  begin
    qryClienteStd.SQL.Text:= IBQuery1.Text;
    spbtnFiltracurso.Caption := 'Filtrar';
    spbtnFiltracurso.Font.Color := clBlack;
    Edit1.Enabled:=True;
  end;
  //else
  if (Length(cboxListaCursos.Text) > 0) then
  begin
    qryClienteStd.SQL.Text:=
    Format(IBQuery1.Text +
    ' WHERE upper(SECCION) = %s and IDANOESCOLAR = %d',[chr(39)+uppercase(trim(cboxListaCursos.Text))+chr(39),codAnioEscolar]);
    spbtnFiltracurso.Font.Color := clRed;
    spbtnFiltracurso.Caption := 'Quita Filtro';
    Edit1.Enabled:=False;
  end;


  qryClienteStd.Open;

  edtNivelModalidadChange(Self);
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
  ShowTotalRcd(0);
  //qryClientes.Filtered:=False;
end;

procedure TfrmPromoverEstudiantes.FormCreate(Sender: TObject);
begin
  BitBtn5.Enabled  := False;
  BitBtn4.Enabled  := False;
  BitBtn3.Enabled  := False;
  BitBtn2.Enabled  := False;
  BitBtn1.Enabled  := False;
  if qryPrestamos.State = dsInactive then
  qryPrestamos.Open;
  qryPrestamos.Close;
  qryPrestamos.Filtered:=False;
  qryCteConCxc.close;
  qryCteConCxc.Open;

  edtNewAnoEscolar.Items.Clear;
  qryAnoEscolar.Close;
  qryAnoEscolar.Open;
  While Not qryAnoEscolar.Eof Do
  begin
    if (qryAnoEscolarSTATUS.Value = 'A') then
    edtNewAnoEscolar.Items.Add(qryAnoEscolarDESCRIPCION.Value);
    qryAnoEscolar.Next;
  end;
  edtNewAnoEscolar.Text:=qryAnoEscolarDESCRIPCION.Value;
  edtNewAnoEscolarChange(Self);

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

  edtNivelModalidad.Items.Clear;
  dmEstudiante.qryNivelModalidad.Close;
  dmEstudiante.qryNivelModalidad.Open;
  dmEstudiante.qryNivelModalidad.First;
  While Not dmEstudiante.qryNivelModalidad.Eof Do
  begin
    edtNivelModalidad.Items.Add(dmEstudiante.qryNivelModalidadDESCRIPCION.Value);
    dmEstudiante.qryNivelModalidad.Next;
  end;
  edtNivelModalidad.ItemIndex:=0;

  ComboBox1.Items.Clear;
  dmEstudiante.qryAnoEscolar.close;
  dmEstudiante.qryAnoEscolar.Open;
  dmEstudiante.qryAnoEscolar.First;
  While Not dmEstudiante.qryAnoEscolar.Eof Do
  begin
    if (dmEstudiante.qryAnoEscolarSTATUS.Value = 'R') then
    ComboBox1.Items.Add(dmEstudiante.qryAnoEscolarDESCRIPCION.Value);
    dmEstudiante.qryAnoEscolar.Next;
  end;
  dmEstudiante.qryAnoEscolar.Locate('codigo',dmEstudiante.qryAnoEscolarCODIGO.Value,[]);
  ComboBox1.Text:=dmEstudiante.qryAnoEscolarDESCRIPCION.Value;
  ComboBox1Change(self);

    dmEstudiante.qryNivelModalidad.First;
  While Not dmEstudiante.qryNivelModalidad.Eof Do
  begin
    edtNivelModalidad.Items.Add(dmEstudiante.qryNivelModalidadDESCRIPCION.Value);
    dmEstudiante.qryNivelModalidad.Next;
  end;

  dmEstudiante.qryNivelModalidad.Locate('Descripcion', edtNivelModalidad.Text, []);
  edtNivelModalidad.Text := dmEstudiante.qryNivelModalidadDESCRIPCION.Value;
  edtNivelModalidadChange(Self);

  if qryClientes.State = dsInactive then
  qryClientes.Open;
  qryClientes.Close;
  qryClientes.Filtered:=False;
  xCodigoCte:=0;
  nombrecliente:='';
  rxNuevoCursoDet.close;
  rxNuevoCursoDet.open;
end;

procedure TfrmPromoverEstudiantes.cboxListaCursosChange(Sender: TObject);
begin
  //if (Edit1.Text = '') and (Sender is TComboBox ) then
  //begin
  //  spbtnFiltracursoClick(self);
  //  Exit;
  //end;
  //if RadioGroup1.ItemIndex = 6 then exit;//esto hasta que agregues apodo a la tabla cliente
  //Panel4.Visible:=False;
  //Edit1Enter(Self);
  //if Edit1.Text <> '' then
  if Not chkBoxFiltrar.Checked then
  begin
    DBGrid1.DataSource:=dsqryClientes;
    DBGrid1.Visible:=False;
    DBGrid2.Visible:=False;
    //Panel4.Visible:=False;
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
  if frmPromoverEstudiantes.Showing then
  begin
    if Edit1.Enabled then
    Edit1.SetFocus;
  end;
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
  spbtnFiltracursoClick(Self);
end;

procedure TfrmPromoverEstudiantes.AsignarSqlText(campo, valor,
  OrderBy: String);
begin
  if qryClienteStd.Active then
  qryClienteStd.close;
  qryClienteStd.Database:= dmConectar.IBDatabase1;
  if (Length(cboxListaCursos.Text) > 0) then
  qryClienteStd.SQL.Text:=
  Format(IBQuery1.Text +
  ' WHERE UPPER(%s) Like %s and upper(SECCION) = %s %s',[Campo, Valor, chr(39)+uppercase(trim(cboxListaCursos.Text))+chr(39),OrderBy])
  else
  qryClienteStd.SQL.Text:=
  Format(IBQuery1.Text +
  ' WHERE UPPER(%s) Like %s %s',[Campo, Valor, OrderBy]);
end;

procedure TfrmPromoverEstudiantes.Edit1Enter(Sender: TObject);
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

procedure TfrmPromoverEstudiantes.Edit1Change(Sender: TObject);
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
  if frmPromoverEstudiantes.Showing then
      if Edit1.Enabled then
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

procedure TfrmPromoverEstudiantes.RadioGroup1Click(Sender: TObject);
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
  if frmPromoverEstudiantes.Showing then
      if Edit1.Enabled then
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

procedure TfrmPromoverEstudiantes.Button1Click(Sender: TObject);
begin
  qryPrestamos.Filtered := False;
  if (RadioGroup1.ItemIndex = 0) then
  begin
    if Not qryPrestamos.Locate('CODIGO_CTE', StrToInt(Edit1.Text),[loCaseInsensitive,loPartialKey]) then
    MessageDlg('Código no encontrado', mtInformation, [mbOK], 0);
  end else if RadioGroup1.ItemIndex = 0 then
  begin
    if Not qryPrestamos.Locate('codigo_cte', Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    MessageDlg('Codigo cliente no encontrado', mtInformation, [mbOK], 0);
  end else if RadioGroup1.ItemIndex = 1 then
  begin
    if Not qryPrestamos.Locate('CEDULA_cliente', Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    MessageDlg('Cédula no encontrada',mtInformation, [mbOK], 0);
  end else if RadioGroup1.ItemIndex = 2 then
  begin
    if Not qryPrestamos.Locate('nombre_CTE', Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    MessageDlg('Nombre no encontrado',mtInformation, [mbOK], 0);
  end else if RadioGroup1.ItemIndex = 3 then
  begin
    if Not qryPrestamos.Locate('NOMBRE_CTE', Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    MessageDlg('Apellido no encontrado',mtInformation, [mbOK], 0);
  end else if RadioGroup1.ItemIndex = 4 then
  begin
    if Not qryPrestamos.Locate('telef_contacto', Edit1.Text,[loCaseInsensitive,loPartialKey]) then
    MessageDlg('Telefono no encontrado',mtInformation, [mbOK], 0);
  end;
end;

procedure TfrmPromoverEstudiantes.ComboBox1Change(Sender: TObject);
begin
 if (Length(ComboBox1.Text) > 0) then
 begin
   if dmestudiante.qryAnoEscolar.Locate('DESCRIPCION', combobox1.Text,[]) then
   codAnioEscolar:= dmestudiante.qryAnoEscolarCODIGO.Value
   else codAnioEscolar:= -1;
 end;
 if (codAnioEscolar > 0) then
 begin
   spbtnFiltracursoClick(self);  
 end;
end;

procedure TfrmPromoverEstudiantes.FormShow(Sender: TObject);
begin
  spbtnFiltracursoClick(Self);
end;

procedure TfrmPromoverEstudiantes.PreCargarEstudiante(accion: smallint);
var
  i : Integer;
begin
  //qryListaEstudiantes.First;
  if accion = 1 then
  begin
    if DBGrid2.SelectedRows.Count > 0 then
    begin
      With DBGrid2.DataSource.DataSet Do
      begin //qryClienteStdNombre_facturar.value
        For i := 0 To DBGrid2.SelectedRows.Count-1 Do
        begin
          GotoBookmark(Pointer(DBGrid2.SelectedRows.Items[i]));
          if not rxNuevoCursoDet.Locate('idAnoEscolar;IdNivel;IdCurso;Id_Estudiante',
          varArrayOf([codAnioEscolarNew,
          qryClienteStdIDNIVEL.Value,
          qryClienteStdIDCURSO.Value,
          qryClienteStdID_ESTUDIANTE.Value]),[]) then
          begin
            rxNuevoCursoDet.Append;
            rxNuevoCursoDetId_Estudiante.Value:= qryClienteStdID_ESTUDIANTE.Value;
            rxNuevoCursoDetIdCurso.Value      := qryClienteStdIDCURSO.Value;
            rxNuevoCursoDetidAnoEscolar.Value := codAnioEscolarNew;
            rxNuevoCursoDetIdNivel.Value      := qryClienteStdIDNIVEL.Value;
            rxNuevoCursoDetNumeroEstudiante.Value := qryClienteStdNUMERO_ESTUDIANTE.Value;
            rxNuevoCursoDetNombreEstudiante.Value := qryClienteStdNOMBRE_CTE.Value;
          end;
          rxNuevoCursoDet.Post;
        end;
      end;
    end;
  end else
  begin
    if DBGrid2.SelectedRows.Count > 0 then
    begin
      With DBGrid2.DataSource.DataSet Do
      begin //qryClienteStdNombre_facturar.value
        For i := 0 To DBGrid2.SelectedRows.Count-1 Do
        begin
          GotoBookmark(Pointer(DBGrid2.SelectedRows.Items[i]));
          if  rxNuevoCursoDet.Locate('idAnoEscolar;IdNivel;IdCurso;Id_Estudiante',
          varArrayOf([codAnioEscolarNew,
          qryClienteStdIDNIVEL.Value,
          qryClienteStdIDCURSO.Value,
          qryClienteStdID_ESTUDIANTE.Value]),[]) then
          rxNuevoCursoDet.Delete;
        end;
      end;
    end;
  end;
end;

procedure TfrmPromoverEstudiantes.BitBtn5Click(Sender: TObject);
begin
  DBGridSelectAll(DBGrid2);
  ShowTotalRcd(1);
  BitBtn2Click(Self);
end;

procedure TfrmPromoverEstudiantes.BitBtn2Click(Sender: TObject);
begin
  PreCargarEstudiante(1);
  ShowTotalRcd(1);
end;

procedure TfrmPromoverEstudiantes.BitBtn1Click(Sender: TObject);
begin
  PreCargarEstudiante(1);
  ShowTotalRcd(1);
end;

procedure TfrmPromoverEstudiantes.BitBtn4Click(Sender: TObject);
begin
  PreCargarEstudiante(0);
  ShowTotalRcd(0);
end;

procedure TfrmPromoverEstudiantes.BitBtn3Click(Sender: TObject);
begin
  PreCargarEstudiante(0);
  ShowTotalRcd(1);
end;

procedure TfrmPromoverEstudiantes.ShowTotalRcd(accion : smallint);
begin
  Label13.Caption:= IntToStr(rxNuevoCursoDet.RecordCount);
  if Dbgrid2.SelectedRows.Count = 0 then Exit;
  Case accion Of
  1: begin
       Label13.Visible:=True;
       Label12.Visible:=True;
     end;
  0: begin
       Label13.Visible:=False;
       Label12.Visible:=False;
     end;
  end;
end;

procedure TfrmPromoverEstudiantes.edtNivelModalidadChange(Sender: TObject);
begin
  if dmEstudiante.qryNivelModalidad.Locate('DESCRIPCION', edtNivelModalidad.Text,[]) then
  CodNivelModalidadNew:= dmEstudiante.qryNivelModalidadCODIGO.Value;

  qryCursosNew.Close;
  qryCursosNew.Params[0].Value :=CodNivelModalidadNew;
  qryCursosNew.Open;
  qryCursosNew.First;
  edtCursoNew.Items.Clear;
  While Not qryCursosNew.Eof Do
  begin
    edtCursoNew.Items.Add(qryCursosNewSECCION.Value);
    qryCursosNew.Next;
  end;
  edtCursoNew.ItemIndex:=0;
end;

procedure TfrmPromoverEstudiantes.edtNewAnoEscolarChange(Sender: TObject);
begin
 if (Length(edtNewAnoEscolar.Text) > 0) then
 begin
   if qryAnoEscolar.Locate('DESCRIPCION', edtNewAnoEscolar.Text, []) then
   begin
     codAnioEscolarNew:= qryAnoEscolarCODIGO.Value;
     BitBtn5.Enabled  := True;
     BitBtn4.Enabled  := True;
     BitBtn3.Enabled  := True;
     BitBtn2.Enabled  := True;
     BitBtn1.Enabled  := True;
   end else codAnioEscolarNew:= -1;
 end;
  qryCursosNew.Close;
  qryCursosNew.Params[0].Value :=CodNivelModalidadNew;
  qryCursosNew.Open;
end;

procedure TfrmPromoverEstudiantes.edtCursoNewChange(Sender: TObject);
begin
 if (Length(edtCursoNew.Text) > 0) then
 begin
   if qryCursosNew.Locate('seccion', edtCursoNew.Text, []) then
   begin
     codNewCurso:= qryCursosNewIDCURSO.Value;
     BitBtn5.Enabled  := True;
     BitBtn4.Enabled  := True;
     BitBtn3.Enabled  := True;
     BitBtn2.Enabled  := True;
     BitBtn1.Enabled  := True;
   end else codNewCurso:= -1;
 end;
end;

procedure TfrmPromoverEstudiantes.BitBtn6Click(Sender: TObject);
begin
  if (cboxListaCursos.Text = edtCursoNew.Text) then
  begin
    MessageDlg('Nuevo curso no puede ser igual al anterior, verifique.', mtError, [mbOk], 0);
    Exit;
  end;
  if (edtCursoNew.Text = '') then
  begin
    MessageDlg('Favor indicar el curso a promover.', mtError, [mbOk], 0);
    edtCursoNew.SetFocus;
    Exit;
  end;
  if (edtNewAnoEscolar.Text = '') then
  Exit;

  if (edtNivelModalidad.Text = '') then
  Exit;

  if MessageDlg('¿PROMOVER LISTA DE ESTUDIATES: '#13'DESDE CURSO : '+cboxListaCursos.Text+
  ''#13'AÑO ESCOLAR: '+edtNewAnoEscolar.Text+
  ''#13'MODALIDAD  : '+edtNivelModalidad.Text+
  ''#13'HASTA CURSO: '+ edtCursoNew.Text+' ?',mtWarning,[mbyes,mbno],0) = mrYes then
  begin
    //Set status 'R' en estudiantes_Det
    ProcActualizaCursoAnterior;
    ProcinsertCursoNewCurso;
    rxNuevoCursoDet.Close;
    rxNuevoCursoDet.Open;
  end;
end;

procedure TfrmPromoverEstudiantes.ProcActualizaCursoAnterior;
begin
  rxNuevoCursoDet.First;
  while not rxNuevoCursoDet.Eof do
  begin
    tblActualizarCursoDet.Close;
    tblActualizarCursoDet.params[0].Value:= codAnioEscolar;
    tblActualizarCursoDet.params[1].Value:= rxNuevoCursoDetIdCurso.Value;
    tblActualizarCursoDet.params[2].Value:= rxNuevoCursoDetId_Estudiante.Value;
    tblActualizarCursoDet.params[3].Value:= rxNuevoCursoDetIdNivel.Value;
    tblActualizarCursoDet.params[4].Value:= rxNuevoCursoDetNumeroEstudiante.Value;
    tblActualizarCursoDet.Open;
    if (tblActualizarCursoDet.RecordCount = 1) then
    begin
      tblActualizarCursoDet.Edit;
      tblActualizarCursoDetCOD_USUARIO.Value := VarUsuarioGlb;
      tblActualizarCursoDetSTATUS.Value := 'R';
      tblActualizarCursoDet.Post;
      tblActualizarCursoDet.ApplyUpdates;
      if not tblActualizarCursoDet.Transaction.InTransaction then
      tblActualizarCursoDet.Transaction.StartTransaction;
      try
        tblActualizarCursoDet.Transaction.CommitRetaining;
      except
      tblActualizarCursoDet.Transaction.RollbackRetaining;
      end;
    end;
    rxNuevoCursoDet.Next;
  end;
end;

procedure TfrmPromoverEstudiantes.ProcinsertCursoNewCurso;
begin
  dmEstudiante.qryEstudianteDet.Close;
  dmEstudiante.qryEstudianteDet.Open;
  rxNuevoCursoDet.First;
  While Not rxNuevoCursoDet.Eof do
  begin
    dmEstudiante.qryEstudianteDet.Insert;
    dmEstudiante.qryEstudianteDetID_ESTUDIANTE.Value:= rxNuevoCursoDetID_ESTUDIANTE.Value;
    dmEstudiante.qryEstudianteDetIDANOESCOLAR.Value := codAnioEscolarNew;
    dmEstudiante.qryEstudianteDetIDCURSO.Value      := codNewCurso;
    dmEstudiante.qryEstudianteDetIDNIVEL.Value      := CodNivelModalidadNew;
    dmEstudiante.qryEstudianteDetNUMERO_ESTUDIANTE.Value:= rxNuevoCursoDetNumeroEstudiante.Value;
    dmEstudiante.qryEstudianteDetFECHA_IN.Value    := Now;
    dmEstudiante.qryEstudianteDetIN_POR.Value      := StrUserName;
    dmEstudiante.qryEstudianteDetSTATUS.Value      := 'A';
    dmEstudiante.qryEstudianteDetCOD_USUARIO.Value := VarUsuarioGlb;
    dmEstudiante.qryEstudianteDet.Post;
    dmEstudiante.qryEstudianteDet.ApplyUpdates;
    if Not dmEstudiante.qryEstudianteDet.Transaction.InTransaction then
    dmEstudiante.qryEstudianteDet.Transaction.StartTransaction;
    try
     dmEstudiante.qryEstudianteDet.Transaction.CommitRetaining;
    except
    dmEstudiante.qryEstudianteDet.Transaction.RollbackRetaining;
    end;
    rxNuevoCursoDet.Next;
  end;
end;

procedure TfrmPromoverEstudiantes.DBGrid2CellClick(Column: TColumn);
begin
  if dmEstudiante.qryNivelModalidad.Locate('CODIGO',qryListaEstudiantesIDNIVEL.Value,[]) then
  edtNivelModalidad.Text := dmEstudiante.qryNivelModalidadDESCRIPCION.Value;
  edtNivelModalidadChange(Self);
end;

end.
