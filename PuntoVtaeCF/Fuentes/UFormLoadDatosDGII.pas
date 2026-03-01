unit UFormLoadDatosDGII;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IBEvents, IBDatabaseInfo, IBDatabase, DB, IBSQL, StdCtrls,
  Buttons, IniFiles, Registry, IBCustomDataSet, IBQuery, Grids, DBGrids,
  RXDBCtrl, ComCtrls, WinSkinData, EditNew;

type
  TfrmCargarRNCDGII = class(TForm)
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    IBDatabaseInfo1: TIBDatabaseInfo;
    IBEvents1: TIBEvents;
    BitBtn1: TBitBtn;
    ibsqlInsertDatos: TIBSQL;
    qryDatosRNCDGII: TIBQuery;
    RxDBGrid1: TRxDBGrid;
    dsqryDatosRNCDGII: TDataSource;
    ProgressBar1: TProgressBar;
    SkinData1: TSkinData;
    edtRecordProc: TEditN;
    Label1: TLabel;
    edtnRecErr: TEditN;
    Label2: TLabel;
    procedure IBDatabase1BeforeConnect(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCargarRNCDGII: TfrmCargarRNCDGII;

implementation

uses uGlobal;

{$R *.dfm}

procedure TfrmCargarRNCDGII.IBDatabase1BeforeConnect(Sender: TObject);
begin
  IBDatabase1.Connected    := False;
  IBDatabase1.DatabaseName := Trim(GLBRUTADBDGII);
  if IBDatabase1.TestConnected = False then
  begin
    close;
  end else
  begin
    MessageDlg('La conección a la base de datos RNC DGII falló, verifique', mtInformation, [mbOK], 0);
    Halt;
  end;
end;

procedure TfrmCargarRNCDGII.BitBtn1Click(Sender: TObject);
var f : TextFile;
     lineaactual : string;
     OutPutList: TStringList;
     recProc : integer;
     recErr : integer;
begin
  recProc:=0;
  recErr:=0;
  ProgressBar1.Position:=0;
  ProgressBar1.Max:=2100000;
  AssignFile(f,GLBRUTABDGIITXT);
  try
    reset(f);
    while not Eof(f) do
    begin
      ProgressBar1.StepIt;
      Readln(f, lineaactual);  //creo que es así, busca en la ayuda de Delphi para asegurarte

      OutPutList := TStringList.Create;

      //if not ibsqlInsertDatos.Open then
      //ibsqlInsertDatos.CheckOpen;

      try
        OutPutList:=Split('|', lineaactual);
        //for i := 0 to OutPutList.Count-1 do
        begin
          try
          ibsqlInsertDatos.params[0].value := OutPutList[0];  //:RNC,
          ibsqlInsertDatos.params[1].value:= OutPutList[1];  //:RAZONSOCIAL,
          ibsqlInsertDatos.params[2].value:= OutPutList[2];  //:NOMBRE_CIA,
          ibsqlInsertDatos.params[3].value:= OutPutList[3];  //:ACTIVIDAD,
          ibsqlInsertDatos.params[4].value:= OutPutList[4];  //:DIR_CALLE,
          ibsqlInsertDatos.params[5].value:= OutPutList[5];  //:DIR_NUMERO,
          ibsqlInsertDatos.params[6].value:= OutPutList[6];  //:SECTOR,
          ibsqlInsertDatos.params[7].value:= OutPutList[7];  //:T ELEFONO,
          ibsqlInsertDatos.params[8].value:= OutPutList[8];  //:FECHA_INI_OPE,
          ibsqlInsertDatos.params[9].value:= OutPutList[9];  //:STATUS,
          ibsqlInsertDatos.params[10].value:= OutPutList[10];  //:CONDICION

          ibsqlInsertDatos.ExecQuery;
          Inc(recProc);
          edtRecordProc.SetInteger(recProc);
          except
          Inc(recErr);
          edtnRecErr.SetInteger(recErr);
          RegistrarLogError('Cargar RNC DGII','UFormLoadDatosDGII', 'Record Error:'+lineaactual);
          end;
          Application.ProcessMessages;
        end;
      finally
      OutPutList.Free;
      end;
    end;
  finally
    Closefile(f);
  end;
  if ibsqlInsertDatos.Transaction.InTransaction then
  ibsqlInsertDatos.Transaction.StartTransaction;
  try
    ibsqlInsertDatos.Transaction.CommitRetaining;
  except
  ibsqlInsertDatos.Transaction.RollbackRetaining;
  end;

  qryDatosRNCDGII.Close;
  qryDatosRNCDGII.Open;
end;

procedure TfrmCargarRNCDGII.FormCreate(Sender: TObject);
begin
  qryDatosRNCDGII.Close;
  qryDatosRNCDGII.Open;
end;

end.
