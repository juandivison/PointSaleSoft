unit UFormAsignareCFAVentasSineCF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, Grids, DBGrids, RxDBCtrl, DB,
  IBCustomDataSet, IBStoredProc, WinSkinData;

type
  TfrmAsignareCFAVtasGen = class(TForm)
    Memo1: TMemo;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    dsqryAsignarECFASerieB: TDataSource;
    RxDBGrid1: TRxDBGrid;
    ProgressBar1: TProgressBar;
    ibStpMaxNCF: TIBStoredProc;
    SkinData1: TSkinData;
    lblTotalVtas: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    function ProcesaNCF(tipoNCF: string): Boolean;
  public
    { Public declarations }
  end;

var
  frmAsignareCFAVtasGen: TfrmAsignareCFAVtasGen;
  ncfGenerado: String[13];

implementation

uses UDatModConectar, UFormAsignarNCFAVenta, UDatModFactura, UDatModFacturaElectronica,
  USeleccionarNCF, UGlobal;

{$R *.dfm}

function TfrmAsignareCFAVtasGen.ProcesaNCF(tipoNCF: string): Boolean;
var
  strX : String[8];
  xSalir : Boolean;
begin
  xSalir:=False;
    if not Assigned(frmSelNCF) then
    frmSelNCF:=TfrmSelNCF.Create(Nil);
      try
        dmfactura.ibqryViewNCF.Filtered := False;

        if dmfactura.ibqryViewNCF.Locate('TIPO_CF',tipoNCF,[]) then
        begin
              //if dmfactura.ibQryViewNCFFECHA_VENCE.IsNull then
              //descNCF:= dmfactura.ibQryViewNCFDESCRIPCION.Value
              //else
              //descNCF:= dmfactura.ibQryViewNCFDESCRIPCION_2018.Value;
              ibStpMaxNCF.Params[7].Value := dmfactura.ibQryViewNCFSERIE.Value;
              ibStpMaxNCF.Params[8].Value := dmfactura.ibQryViewNCFDIV_NEGOCIO.Value;
              ibStpMaxNCF.Params[9].Value := dmfactura.ibQryViewNCFPECF.Value;
              ibStpMaxNCF.Params[10].Value := dmfactura.ibQryViewNCFAICF.Value;
              ibStpMaxNCF.Params[11].Value :=dmfactura.ibQryViewNCFTIPO_CF.Value;
              ibStpMaxNCF.ExecProc;
              if (ibStpMaxNCF.Params[06].Value = '') Or (ibStpMaxNCF.Params[06].IsNull) then
              begin
                strX:=PadLeftCharacter(8,ibStpMaxNCF.Params[0].Value,'0');
                if Not ibStpMaxNCF.Params[0].IsNull or (dmfactura.ibQryViewNCFSERIE.Value = 'E') then
                begin
                 if (dmfactura.ibQryViewNCFSERIE.Value = 'E') then
                  begin
                    ncfGenerado :='E'+ibStpMaxNCF.Params[5].Value + strX;
                    if (Length(ncfGenerado) < 13) and
                    (GlbActivaECF = 1) then
                    ncfGenerado := ibStpMaxNCF.Params[1].Value+
                    ibStpMaxNCF.Params[5].Value+
                    RightPad(strX,'0',10) else
                    ncfGenerado := ibStpMaxNCF.Params[1].Value+
                    ibStpMaxNCF.Params[5].Value+strX;
                  end else
                  if (GlbUsaSecNCF2018 = 0) then
                  begin
                    ncfGenerado := ibStpMaxNCF.Params[1].Value+
                    ibStpMaxNCF.Params[5].Value+ strX;
                    if (Length(ncfGenerado) < 19) and
                    (GlbActivaIFiscal = 1) and (GLBEsFastFood) then
                    //Impresora Epson no Fast Food no acepta los ceros a la derecha
                    ncfGenerado :=
                    RightPad('','0',8)+
                    ibStpMaxNCF.Params[1].Value+
                    ibStpMaxNCF.Params[5].Value+
                    strX
                    else
                    if (Length(ncfGenerado) < 19) and
                    (GlbActivaIFiscal = 1) then
                    ncfGenerado := ibStpMaxNCF.Params[1].Value+
                    ibStpMaxNCF.Params[5].Value+
                    RightPad(strX,'0',8) else
                    ncfGenerado := ibStpMaxNCF.Params[1].Value+
                    ibStpMaxNCF.Params[5].Value+strX;
                  end else
                  if (GlbUsaSecNCF2018 = 1) then
                  begin
                    if (GLBEsFastFood) and (GlbUsaPUnidadLevel = 0) then
                    begin
                      if (GlbActivaECF = 1) then
                      if (GlbActivaIFiscal = 1) then
                       ncfGenerado :=
                       'E'+
                       ibStpMaxNCF.Params[5].Value+
                       strX
                       else
                      if (GlbActivaIFiscal = 1) then
                       ncfGenerado :=
                       'B'+
                       ibStpMaxNCF.Params[5].Value+
                       strX
                       //+RightPad('','0',8)
                       else
                       ncfGenerado :=
                       'B'+
                       ibStpMaxNCF.Params[5].Value + strX
                    end
                    else
                  if (GlbActivaECF= 1) and (not GLBEsFastFood) then
                       ncfGenerado := 'E'+ibStpMaxNCF.Params[5].Value+strX
                      else
                      if (GlbActivaIFiscal = 1) and (not GLBEsFastFood) then
                       ncfGenerado :='B'+ibStpMaxNCF.Params[5].Value+strX //+RightPad('','0',8)
                    else
                     ncfGenerado :='B'+ibStpMaxNCF.Params[5].Value+strX;
                  end else
                  begin
                    ncfGenerado :=
                    ibStpMaxNCF.Params[1].Value+
                    ibStpMaxNCF.Params[2].Value+
                    ibStpMaxNCF.Params[3].Value+
                    ibStpMaxNCF.Params[4].Value+
                    ibStpMaxNCF.Params[5].Value+ strX;//TIPO_CF Pendiente de Revision
                  end
                end;
              end else xSalir := True;
        end else
        xSalir := True;
    finally
    try
    if Assigned(frmSelNCF) then
    begin
      frmSelNCF.free;
      frmSelNCF:=nil;
    end;
    except
     frmSelNCF:=nil;
    end;
    end;
    if xSalir then
    begin
      MessageDlg(ibStpMaxNCF.Params[06].Value+' o se generó algún otro error, verifique.',mtError, [mbOK], 0);
      Result:=False;
    end else Result:=True;
end;

procedure TfrmAsignareCFAVtasGen.BitBtn1Click(Sender: TObject);
var
  n_ecf:string;
  _cont:integer;
begin
  _cont:=0;
  dmFactElectronica.qryAsignarECFASerieB.Last;
  ProgressBar1.Max:=dmFactElectronica.qryAsignarECFASerieB.RecordCount;
  ProgressBar1.Position:=0;
  frmAsignarNCFAVenta:=TfrmAsignarNCFAVenta.Create(nil);
  Memo1.Lines.Clear;
  LogInformacionTxt('Total ventas a re-asignar número de ecf:'+IntToStr(ProgressBar1.Max));

  dmFactElectronica.qryAsignarECFASerieB.First;
  while not dmFactElectronica.qryAsignarECFASerieB.Eof do
  begin
    Inc(_cont);
    n_ecf:='';
    Application.ProcessMessages;
    if (GetAsyncKeyState(VK_ESCAPE) <> 0) then
    begin
      Memo1.Lines.Add('Proceso cancelado por el usuario (ESC).');
      LogInformacionTxt(PChar(' -Rutina Re-Asignar eCF- CANCELADO POR USUARIO (ESC)'));
      Break;
    end;
    if (dmFactElectronica.qryAsignarECFASerieBTIPO_NCF.Value = '02') then
    begin
      frmAsignarNCFAVenta._totalnetoValue:=dmFactElectronica.qryAsignarECFASerieBVALOR_TOTAL_DET.Value;
      frmAsignarNCFAVenta._numerotrnvta  :=dmFactElectronica.qryAsignarECFASerieBNUMERO.Value;
      if ProcesaNCF('32') then
        frmAsignarNCFAVenta.ProcReAsignareCF(frmAsignarNCFAVenta._numerotrnvta,
                     dmFactElectronica.qryAsignarECFASerieBSERIE.Value,false,
                     ncfGenerado,dmFactElectronica.qryAsignarECFASerieBNUMERO_NCF.Value,'32',
                     n_ecf);
      Memo1.Lines.Add(
      '#TRN:'+dmFactElectronica.qryAsignarECFASerieBNUMERO.AsString+'|'+
      '#NCF_Anterior:'+dmFactElectronica.qryAsignarECFASerieBNUMERO_NCF.Value+'|'+
      '#NCF_Nuevo:'+n_ecf+'| '+IntToStr(_cont)+' de '+IntToStr(dmFactElectronica.qryAsignarECFASerieB.RecordCount));
      
      LogInformacionTxt('#TRN:'+dmFactElectronica.qryAsignarECFASerieBNUMERO.AsString+'|'+
      '#NCF_Anterior:'+dmFactElectronica.qryAsignarECFASerieBNUMERO_NCF.Value+'|'+
      '#NCF_Nuevo:'+n_ecf+'| '+IntToStr(_cont)+' de '+IntToStr(dmFactElectronica.qryAsignarECFASerieB.RecordCount));

    end;
    dmFactElectronica.qryAsignarECFASerieB.next;
    ProgressBar1.StepIt;
  end;
  Memo1.Lines.Add('');
  Memo1.Lines.Add('Total Records procesados: '+IntToStr(_cont));
  LogInformacionTxt('Total Records procesados: '+IntToStr(_cont));
  Memo1.Lines.Add('***Proceso terminado***');
end;


procedure TfrmAsignareCFAVtasGen.BitBtn2Click(Sender: TObject);
begin
  dmFactElectronica.qryAsignarECFASerieB.Close;
  dmFactElectronica.qryAsignarECFASerieB.Open;
  dmFactElectronica.qryAsignarECFASerieB.Last;
  lblTotalVtas.Caption:='Total Ventas:'+IntToStr(dmFactElectronica.qryAsignarECFASerieB.RecordCount);
  lblTotalVtas.Visible:=True;
  if dmFactElectronica.qryAsignarECFASerieB.RecordCount > 0 then
  BitBtn1.Enabled:=True
  else BitBtn1.Enabled:=False;
  dmFactElectronica.qryAsignarECFASerieB.First;
end;

procedure TfrmAsignareCFAVtasGen.FormCreate(Sender: TObject);
begin
  Memo1.Lines.Clear;
end;

end.
