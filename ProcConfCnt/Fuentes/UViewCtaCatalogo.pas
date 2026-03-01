unit UViewCtaCatalogo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, Grids, DBGrids, RXDBCtrl,
  StdCtrls, ExtCtrls, EditNew, Buttons, WinSkinData;

type
  TfrmViewCtaCatalogo = class(TForm)
    qryViewCtaCtalogo: TIBQuery;
    RxDBGrid1: TRxDBGrid;
    dsqryViewCtaCtalogo: TDataSource;
    qryViewCtaCtalogoBALANCE_ACT: TFloatField;
    qryViewCtaCtalogoBALANCE_ANT: TFloatField;
    qryViewCtaCtalogoCLASIFICACION_CTA: TIntegerField;
    qryViewCtaCtalogoCREDITO_ACM: TFloatField;
    qryViewCtaCtalogoCREDITO_ACT: TFloatField;
    qryViewCtaCtalogoCTA_CONS1: TIBStringField;
    qryViewCtaCtalogoCTA_CONS2: TIBStringField;
    qryViewCtaCtalogoCTA_CONS3: TIBStringField;
    qryViewCtaCtalogoCTA_CTRL1: TIBStringField;
    qryViewCtaCtalogoCTA_CTRL2: TIBStringField;
    qryViewCtaCtalogoCTA_CTRL3: TIBStringField;
    qryViewCtaCtalogoCTACIE1: TIBStringField;
    qryViewCtaCtalogoCTACIE2: TIBStringField;
    qryViewCtaCtalogoCTACIE3: TIBStringField;
    qryViewCtaCtalogoCUENTA1: TIBStringField;
    qryViewCtaCtalogoCUENTA2: TIBStringField;
    qryViewCtaCtalogoCUENTA3: TIBStringField;
    qryViewCtaCtalogoDEBITO_ACM: TFloatField;
    qryViewCtaCtalogoDEBITO_ACT: TFloatField;
    qryViewCtaCtalogoFECHA_ACT: TDateTimeField;
    qryViewCtaCtalogoFECHA_APE: TDateTimeField;
    qryViewCtaCtalogoFECHA_ULT_TR: TDateTimeField;
    qryViewCtaCtalogoNIVEL_CTA: TSmallintField;
    qryViewCtaCtalogoSIGNO_CTA: TSmallintField;
    qryViewCtaCtalogoSTATUS: TIBStringField;
    qryViewCtaCtalogoTIPO: TIBStringField;
    qryViewCtaCtalogoTIPO_CTA: TIBStringField;
    EditN1: TEditN;
    RadioGroup1: TRadioGroup;
    Label1: TLabel;
    Button1: TButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    SkinData1: TSkinData;
    qryViewCtaCtalogoNOMBRE_CTA: TIBStringField;
    RadioGroup2: TRadioGroup;
    CheckBox1: TCheckBox;
    IBQuery1: TIBQuery;
    qryViewCtaCatalogoFilterLike: TIBQuery;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    IntegerField1: TIntegerField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
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
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    DateTimeField1: TDateTimeField;
    DateTimeField2: TDateTimeField;
    DateTimeField3: TDateTimeField;
    SmallintField1: TSmallintField;
    IBStringField13: TIBStringField;
    SmallintField2: TSmallintField;
    IBStringField14: TIBStringField;
    IBStringField15: TIBStringField;
    IBStringField16: TIBStringField;
    procedure RadioGroup1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
    procedure qryViewCtaCtalogoFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure CheckBox1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmViewCtaCatalogo: TfrmViewCtaCatalogo;
  nivel : string;

implementation
Uses  UDatModConectar, UGlobal;
{$R *.dfm}

procedure TfrmViewCtaCatalogo.RadioGroup1Click(Sender: TObject);
begin
  case RadioGroup1.ItemIndex of
  0: Label1.Caption:='Entre Nombre';
  1: Label1.Caption:='Entre Cuenta';
  2: Label1.Caption:='Entre Cuenta1';
  3: Label1.Caption:='Entre cuenta2';
  4: Label1.Caption:='Entre cuenta3';
  end;  
end;

procedure TfrmViewCtaCatalogo.Button1Click(Sender: TObject);
var
  c1, c2, c3 : String;
begin
  qryViewCtaCtalogo.Close;
   qryViewCtaCtalogo.sql.Text:= IBQuery1.sql.Text;
  if radiogroup1.ItemIndex = 0 then
  begin
    qryViewCtaCtalogo.Filtered:=false;
    qryViewCtaCtalogo.sql.Text:= qryViewCtaCatalogoFilterLike.SQL.Text;
    qryViewCtaCtalogo.Params[0].value:= 1;//cia_key
    qryViewCtaCtalogo.Params[1].Value := '%'+editn1.Text+'%';
    qryViewCtaCtalogo.Open;
  end else
  begin
   qryViewCtaCtalogo.Open;  
    GlbAsignaCuenta(EditN1.Text, c1, c2, c3);
    case RadioGroup1.ItemIndex of
    0:if Not qryViewCtaCtalogo.Locate('nombre_cta', EditN1.Text,[loCaseInsensitive,loPartialKey]) then
      MessageDlg('Nombre cuenta no encontrado, verifique',mtInformation, [mbOK], 0);
    1:if Not qryViewCtaCtalogo.Locate('cuenta1;cuenta2;cuenta3',VarArrayOf([c1, c2, c3]),[]) then
      MessageDlg('Cuenta no encontrada, verifique', mtInformation, [mbOK], 0);
    2:if Not qryViewCtaCtalogo.Locate('cuenta1',EditN1.Text,[loCaseInsensitive,loPartialKey]) then
      MessageDlg('Cuenta no encontrado, verifique', mtInformation, [mbOK], 0);
    3:if Not qryViewCtaCtalogo.Locate('cuenta2',EditN1.Text,[loCaseInsensitive,loPartialKey]) then
      MessageDlg('Cuenta no encontrado, verifique', mtInformation, [mbOK], 0);
    4:if Not qryViewCtaCtalogo.Locate('cuenta3',EditN1.Text,[loCaseInsensitive,loPartialKey]) then
      MessageDlg('Cuenta no encontrado, verifique', mtInformation, [mbOK], 0);
    end;
  end;
end;

procedure TfrmViewCtaCatalogo.FormCreate(Sender: TObject);
begin
  qryViewCtaCtalogo.Close;
  qryViewCtaCtalogo.Open;
end;

procedure TfrmViewCtaCatalogo.RadioGroup2Click(Sender: TObject);
begin
  qryViewCtaCtalogo.Close;
  qryViewCtaCtalogo.Sql.Text:= IBQuery1.sql.Text;
  qryViewCtaCtalogo.Params[0].Value:=1;
  qryViewCtaCtalogo.Open;
  CheckBox1.Checked := True;
  CheckBox1.Visible := True;
  qryViewCtaCtalogo.Filtered:=False;  
  case RadioGroup2.ItemIndex of
  0 : Nivel:='1';
  1 : Nivel:='2';
  2 : Nivel:='3';
  3 : Nivel:='4';
  4 : Nivel:='5';
  5 : Nivel:='6';
  end;
  EditN1.Text := '';
  qryViewCtaCtalogo.Filtered:=True;
  CheckBox1.Checked:=True;
end;

procedure TfrmViewCtaCatalogo.qryViewCtaCtalogoFilterRecord(
  DataSet: TDataSet; var Accept: Boolean);
begin
  Accept := Dataset.FieldByName('cuenta1').AsString[1] = nivel
end;

procedure TfrmViewCtaCatalogo.CheckBox1Click(Sender: TObject);
begin
  if not CheckBox1.Checked then
  begin
    CheckBox1.Visible    :=True;
    RadioGroup2.ItemIndex:=-1;
    qryViewCtaCtalogo.Filtered:=False;
  end;
end;

end.


