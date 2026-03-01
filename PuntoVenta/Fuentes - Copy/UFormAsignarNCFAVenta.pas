unit UFormAsignarNCFAVenta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfrmAsignarNCFAVenta = class(TForm)
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    _totalnetoValue : Extended;
    _numerotrnvta : integer;
  end;

var
  frmAsignarNCFAVenta: TfrmAsignarNCFAVenta;
  genNcf, flag, showNcfwindows : Boolean;
  
implementation

uses USeleccionarNCF, USolDatos, UDatModFactura, uFormAsignarNCFVenta, UGlobal;

{$R *.dfm}

procedure TfrmAsignarNCFAVenta.BitBtn1Click(Sender: TObject);
var
  showNcfwindows, genNcf, flag: Boolean;
begin
  frmSelNCF := TfrmSelNCF.Create(Self);
  try
    dmFactura.ibQryViewNCF.Locate('TIPO_CF', '01', []);

    showNcfwindows := True;

    if showNcfwindows then
    begin
      flag := True;
      if frmSelNCF.ShowModal = mrOk then
      begin
        showNcfwindows := True;
        genNcf := True;
        flag := True;
      end
      else
      begin
        showNcfwindows := False;
        genNcf := False;
      end;
    end
    else
    begin
      if GlbNCFConfFinal = 1 then
        showNcfwindows := True
      else
        showNcfwindows := False;
    end;

    GlbDescNCF := '';

    dmFactura.ibQryViewNCFTIPO_NCF_IFISCAL.Value;

    if showNcfwindows and genNcf and not flag then
    begin
      if frmSelNCF.ShowModal = mrOk then
      begin
        genNcf := True;
        flag := True;
      end;
    end
    else if not flag and not showNcfwindows and (GlbActivaIFiscal = 0) then
    begin
      if frmSelNCF.ShowModal = mrOk then
      begin
        genNcf := True;
        flag := True;
      end
      else
      begin
        genNcf := False;
      end;
    end;

    if genNcf then
    begin
      if GlbUsaSecNCF2018 = 0 then
        GlbDescNCF := dmFactura.ibQryViewNCFDESCRIPCION.Value
      else
        GlbDescNCF := dmFactura.ibQryViewNCFDESCRIPCION_2018.Value;

      frmAsignarNCFVenta := TfrmAsignarNCFVenta.Create(Self);
      try
        frmAsignarNCFVenta.IBDataSet1.Close;
        frmAsignarNCFVenta.IBDataSet1.Open;
        frmAsignarNCFVenta.IBDataSet1.Append;
        frmAsignarNCFVenta.IBDataSet1FECHA_INSERT.Value := Now;
        frmAsignarNCFVenta.IBDataSet1FECHA.Value := ExtraerFEcha(GlbFechaTrnDiaria);
        if GlbcodVendedor > 0 then
          frmAsignarNCFVenta.IBDataSet1CODIGO_USUARIO.Value := GlbcodVendedor
        else
          frmAsignarNCFVenta.IBDataSet1CODIGO_USUARIO.Value := VarUsuarioGlb;
        frmAsignarNCFVenta.IBDataSet1STATUS.Value := 'A';

        frmAsignarNCFVenta.IBDataSet1TIPO_NCF.Value := dmFactura.ibQryViewNCFTIPO_CF.Value;
        frmAsignarNCFVenta.BitBtn13Click(Self);

        frmAsignarNCFVenta.Asginarncf := frmAsignarNCFVenta.ncfGenerado;

        frmAsignarNCFVenta.IBDataSet1NUMERO_NCF.Value := frmAsignarNCFVenta.ncfGenerado;
        frmAsignarNCFVenta.IBDataSet1MONTO.Value := _totalnetoValue;

        frmAsignarNCFVenta.BitBtn4Click(Self);

        GlbUsandoCotiza := False;
        if frmAsignarNCFVenta.ncfGenerado = '' then
        begin
          if MessageDlg('NCF no fue generado, desea continuar?', mtWarning, [mbYes, mbNo], 0) = mrNo then
            Exit;
        end else
        begin
          dmfactura.tblUpdateVenta.Close;
          dmfactura.tblUpdateVenta.Params[0].Value := _numerotrnvta;
          dmfactura.tblUpdateVenta.Open;
          dmfactura.tblUpdateVenta.Edit;
          dmfactura.tblUpdateVentaSERIE_NCF_ASIGNADO.Value := frmAsignarNCFVenta.IBDataSet1SERIE.Value;
          dmfactura.tblUpdateVentaFECHA_MOD.Value := Now;
          dmfactura.tblUpdateVentaMOD_POR.Value := StrUserName;
          GlbSalvarQuery(dmfactura.tblUpdateVenta);
        end;
      finally
        frmAsignarNCFVenta.Free;
      end;
    end;
  finally
    frmSelNCF.Free;
  end;
end;


end.
