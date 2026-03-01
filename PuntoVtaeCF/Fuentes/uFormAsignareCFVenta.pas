unit uFormAsignareCFVenta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, StdCtrls, Mask, DBCtrls, Buttons, RXCtrls,
  StrUtils,RXDBCtrl, Grids, DBGrids, rxToolEdit, WinSkinData, RxLookup, IBStoredProc,
  Menus;

type
  TfrmAsignareCFVenta = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DataSource1: TDataSource;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    DBDateEdit1: TDBDateEdit;
    RxDBGrid1: TRxDBGrid;
    DBStatusLabel1: TDBStatusLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    SkinData1: TSkinData;
    RxDBLookupCombo1: TRxDBLookupCombo;
    DBText1: TDBText;
    Label9: TLabel;
    BitBtn13: TBitBtn;
    ibStpMaxNCF: TIBStoredProc;
    MainMenu1: TMainMenu;
    HistoricoNCF1: TMenuItem;
    IBDataSet1: TIBDataSet;
    IBDataSet1SERIE: TIntegerField;
    IBDataSet1TIPO_NCF: TIBStringField;
    IBDataSet1NUMERO_ECF: TIBStringField;
    IBDataSet1FECHA: TDateTimeField;
    IBDataSet1CODIGO_CTE: TIntegerField;
    IBDataSet1NOMBRE_COMPLETO: TIBStringField;
    IBDataSet1CEDULA: TIBStringField;
    IBDataSet1DIRECCION: TIBStringField;
    IBDataSet1CIUDAD: TIBStringField;
    IBDataSet1MONTO: TFloatField;
    IBDataSet1STATUS: TIBStringField;
    IBDataSet1CODIGO_USUARIO: TIntegerField;
    IBDataSet1FECHA_INSERT: TDateTimeField;
    IBDataSet1FECHA_UPDATE: TDateTimeField;
    IBDataSet1CODIGO_USUARIO_UPD: TIntegerField;
    IBDataSet1ECF: TIBStringField;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure HistoricoNCF1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    Function ProcesaNCF(NCF:string):Boolean;
  public
    { Public declarations }
    asginarncf :string;
    ncfGenerado: String[19];
    descNCF : string;
  end;

var
  frmAsignareCFVenta: TfrmAsignareCFVenta;

implementation
uses UDatModConectar, UGlobal, UDatModFactura, UFormSelFecha,
  USeleccionarNCF, UFormHistSecNCF;

{$R *.dfm}


procedure TfrmAsignareCFVenta.BitBtn10Click(Sender: TObject);
begin
  IBDataSet1.prior;
end;

procedure TfrmAsignareCFVenta.BitBtn11Click(Sender: TObject);
begin
  IBDataSet1.next;
end;

procedure TfrmAsignareCFVenta.BitBtn12Click(Sender: TObject);
begin
  IBDataSet1.last;
end;

procedure TfrmAsignareCFVenta.BitBtn1Click(Sender: TObject);
begin
{  if IBDataSet1.State in [dsBrowse] then
  begin
    IBDataSet1.Insert;
    dbedit2.setfocus;
  end;}
end;

procedure TfrmAsignareCFVenta.BitBtn2Click(Sender: TObject);
begin
  if IBDataSet1.State in [dsBrowse] then
  IBDataSet1.Edit;
end;

procedure TfrmAsignareCFVenta.BitBtn3Click(Sender: TObject);
begin
  if IBDataSet1.State in [dsInsert, dsEdit] then
  begin
    if MessageDlg('Seguro que desea cancelar transacción?',mtInformation, [mbyes,mbno], 0)=mryes then
    IBDataSet1.Cancel;
  end
  else
  begin
    if MessageDlg('Eliminar record?',mtInformation, [mbyes,mbno], 0)=mryes then
    begin
      IBDataSet1.Delete;
      IBDataSet1.Post;
      IBDataSet1.ApplyUpdates;
      try
        IBDataSet1.Transaction.CommitRetaining;
      except
        IBDataSet1.Transaction.RollbackRetaining;
      end;
    end;
  end;

end;

procedure TfrmAsignareCFVenta.BitBtn4Click(Sender: TObject);
begin
  if IBDataSet1.State in [dsInsert, dsEdit] then
  begin
    if IBDataSet1NUMERO_eCF.IsNull then
    begin
      MessageDlg('Favor asignar NCF, para permitir guardar.',mtInformation, [mbOK], 0);
      exit;
    end;
    GlbSalvarQuery(IBDataSet1);
    try
      IBDataSet1.Transaction.CommitRetaining;
    except
        IBDataSet1.Transaction.RollbackRetaining; 
    end;
  end;
end;

procedure TfrmAsignareCFVenta.BitBtn5Click(Sender: TObject);
begin
  if IBDataSet1.State in [dsBrowse, dsInactive] then
  begin
    IBDataSet1.Close;
    IBDataSet1.Open;
  end;
end;

procedure TfrmAsignareCFVenta.BitBtn9Click(Sender: TObject);
begin
  IBDataSet1.First;
end;

procedure TfrmAsignareCFVenta.BitBtn7Click(Sender: TObject);
begin
  frmSelFecha:=tfrmSelFecha.create(nil);
  try
   if frmSelFecha.Showmodal = mrok then
   begin
     IBDataSet1.Close;
     IBDataSet1.Params[0].Value:=ExtraerFecha(frmSelFecha.FechaIni.DateTime);
     IBDataSet1.Open;
   end;
  finally
  frmSelFecha.Free;
  frmSelFecha:=Nil;
  end;
end;

procedure TfrmAsignareCFVenta.FormCreate(Sender: TObject);
begin
  try
    if Assigned(frmSelNCF) then
    begin
      frmSelNCF.Free;
      frmSelNCF:=nil;
    end;
  except
  end;
  dmFactura.tblTipoCF.Close;
  dmFactura.tblTipoCF.Open;
end;

function TfrmAsignareCFVenta.ProcesaNCF(NCF: string): Boolean;
var
  strX : String[8];
  xSalir : Boolean;
begin
  xSalir:=False;
    if not Assigned(frmSelNCF) then
    frmSelNCF:=TfrmSelNCF.Create(Nil);
      try
        dmfactura.ibqryViewNCF.Filtered := False;

        if dmfactura.ibqryViewNCF.Locate('TIPO_CF',NCF,[]) then
        begin
              if dmfactura.ibQryViewNCFFECHA_VENCE.IsNull then
              descNCF:= dmfactura.ibQryViewNCFDESCRIPCION.Value
              else
              descNCF:= dmfactura.ibQryViewNCFDESCRIPCION_2018.Value;
              ibStpMaxNCF.Params[7].Value := dmfactura.ibQryViewNCFSERIE.Value;
              ibStpMaxNCF.Params[8].Value := dmfactura.ibQryViewNCFDIV_NEGOCIO.Value;
              ibStpMaxNCF.Params[9].Value := dmfactura.ibQryViewNCFPECF.Value;
              ibStpMaxNCF.Params[10].Value := dmfactura.ibQryViewNCFAICF.Value;
              ibStpMaxNCF.Params[11].Value :=dmfactura.ibQryViewNCFTIPO_CF.Value;
              ibStpMaxNCF.ExecProc;
              if (ibStpMaxNCF.Params[06].Value = '') Or (ibStpMaxNCF.Params[06].IsNull) then
              begin
                strX:=PadLeftCharacter(8,ibStpMaxNCF.Params[0].Value,'0');
                if Not ibStpMaxNCF.Params[0].IsNull then
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
                    if (GlbActivaIFiscal = 1) and (not GLBEsFastFood) then
                       ncfGenerado :=
                      'B'+
                      ibStpMaxNCF.Params[5].Value+
                      strX //+RightPad('','0',8)
                    else
                     ncfGenerado :=
                    'B'+
                    ibStpMaxNCF.Params[5].Value+
                    strX;
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

procedure TfrmAsignareCFVenta.BitBtn13Click(Sender: TObject);
begin
  if not IBDataSet1TIPO_NCF.IsNull then
  begin
    if not ProcesaNCF(IBDataSet1TIPO_NCF.Value) then
    MessageDlg('Error generando eCF, verifique',mtInformation, [mbOK], 0)
    else IBDataSet1NUMERO_eCF.Value:=ncfGenerado;
  end;
end;

procedure TfrmAsignareCFVenta.HistoricoNCF1Click(Sender: TObject);
begin
  frmMantHistoricoNCF:=TfrmMantHistoricoNCF.create(Nil);
  try
   frmMantHistoricoNCF.Showmodal;
  finally
  frmMantHistoricoNCF.Free;
  frmMantHistoricoNCF:=Nil;
  end;
end;

procedure TfrmAsignareCFVenta.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
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

end.
