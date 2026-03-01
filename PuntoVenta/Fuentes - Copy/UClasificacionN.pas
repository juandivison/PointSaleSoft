unit UClasificacionN;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  db,StdCtrls, Buttons, RXCtrls, ExtCtrls, ComCtrls, Grids, DBGrids, Mask,
  DBCtrls, RXDBCtrl, WinSkinData;

type
  TfrmClasifNomina = class(TForm)
    Panel1: TPanel;
    RxSpeedButton2: TRxSpeedButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn4: TBitBtn;
    PageControl1: TPageControl;
    tabDepartamentos: TTabSheet;
    tabSeccion: TTabSheet;
    tabCargos: TTabSheet;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    DBGrid1: TDBGrid;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    DBStatusLabel1: TDBStatusLabel;
    DBStatusLabel2: TDBStatusLabel;
    DBStatusLabel3: TDBStatusLabel;
    SkinData1: TSkinData;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClasifNomina: TfrmClasifNomina;

implementation

uses uglobal,UDatModNomina;

{$R *.DFM}

procedure TfrmClasifNomina.BitBtn1Click(Sender: TObject);
begin
  Case PageControl1.ActivePage.TabIndex of
  0:begin
      if dmNomina.tDeptosEmp.State = dsBrowse then
      begin
        dmNomina.tDeptosEmp.Insert;
        dmNomina.tDeptosEmpCodigo.Value   := FsqlMaxNumero('Deptos','Codigo');
        dmNomina.tDeptosEmpStatus.Value   := 'A';
        dmNomina.tDeptosEmpFECHA_IN.Value := Now;
        dmNomina.tDeptosEmpIN_POR.Value   := StrUserName;
        DBEdit2.SetFocus;
      end;
    end;
  1:begin
      if dmNomina.tDeptoSeccion.State = dsBrowse then
      begin
        dmNomina.tDeptoSeccion.Insert;
        dmNomina.tDeptoSeccionCodigo.Value   := FsqlMaxNumero('DEPTO_SECCION','Codigo');        
        dmNomina.tDeptoSeccionStatus.Value:= 'A';
        dmNomina.tDeptoSeccionFECHA_IN.value:= Now;
        dmNomina.tDeptoSeccionIN_POR.value  := StrUserName;
        DBEdit5.SetFocus;
      end;
    end;
  2:begin
      if dmNomina.tCargosEmp.State = dsBrowse then
      begin
        dmNomina.tCargosEmp.Insert;
        dmNomina.tCargosEmpCodigo.Value   := FsqlMaxNumero('CARGO_EMPLEADOS','Codigo');
        dmNomina.tCargosEmpStatus.Value   := 'A';
        dmNomina.tCargosEmpFECHA_IN.value := Now;
        dmNomina.tCargosEmpIN_POR.value   := StrUserName;
        DBEdit8.SetFocus;
      end;
    end;
  end;
end;

procedure TfrmClasifNomina.BitBtn2Click(Sender: TObject);
begin
  Case PageControl1.ActivePage.TabIndex of
  0:begin
      if dmNomina.tDeptosEmp.State = dsBrowse then
      dmNomina.tDeptosEmp.Edit;
    end;
  1:begin
      if dmNomina.tDeptoSeccion.State = dsBrowse then
      dmNomina.tDeptoSeccion.Edit;
    end;
  2:begin
      if dmNomina.tCargosEmp.State = dsBrowse then
      dmNomina.tCargosEmp.Edit;
    end;
  end;
end;

procedure TfrmClasifNomina.BitBtn3Click(Sender: TObject);
begin
  Case PageControl1.ActivePage.TabIndex of
  0:begin
      if dmNomina.tDeptosEmp.State in [dsEdit,dsInsert] then
      GlbSalvarQuery(dmNomina.tDeptosEmp);
    end;
  1:begin
      if dmNomina.tDeptoSeccion.State in [dsEdit,dsInsert] then
      GlbSalvarQuery(dmNomina.tDeptoSeccion);
    end;
  2:begin
      if dmNomina.tCargosEmp.State in [dsEdit,dsInsert] then
      GlbSalvarQuery(dmNomina.tCargosEmp);
    end;
  end;
end;

procedure TfrmClasifNomina.BitBtn5Click(Sender: TObject);
begin
  Case PageControl1.ActivePage.TabIndex of
  0:begin
      if dmNomina.tDeptosEmp.State in [dsEdit,dsInsert] then
      dmNomina.tDeptosEmp.Cancel;
    end;
  1:begin
      if dmNomina.tDeptoSeccion.State in [dsEdit,dsInsert] then
      dmNomina.tDeptoSeccion.Cancel;
    end;
  2:begin
      if dmNomina.tCargosEmp.State in [dsEdit,dsInsert] then
      dmNomina.tCargosEmp.Cancel;
    end;
  end;
end;

procedure TfrmClasifNomina.BitBtn4Click(Sender: TObject);
begin
  Case PageControl1.ActivePage.TabIndex of
  0:begin
      if Dmnomina.tDeptosEmp.State in [dsbrowse,dsInactive] then
      begin
        dmNomina.tDeptosEmp.Close;
        dmNomina.tDeptosEmp.Open;
      end;
    end;
  1:begin
      if dmNomina.tDeptoSeccion.State in [dsbrowse,dsInactive] then
      begin
        dmNomina.tDeptoSeccion.Close;
        dmNomina.tDeptoSeccion.Open;
      end;
    end;
  2:begin
      if dmNomina.tCargosEmp.State in [dsbrowse,dsInactive] then
      begin
        dmNomina.tCargosEmp.Close;
        dmNomina.tCargosEmp.Open;
      end;
    end;
  end;
end;

procedure TfrmClasifNomina.FormActivate(Sender: TObject);
begin
  BitBtn4Click(Self);
end;

procedure TfrmClasifNomina.BitBtn6Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmClasifNomina.PageControl1Change(Sender: TObject);
begin
  BitBtn4Click(Self);
end;

procedure TfrmClasifNomina.FormCreate(Sender: TObject);
begin
  BitBtn4Click(Self);
end;

end.
