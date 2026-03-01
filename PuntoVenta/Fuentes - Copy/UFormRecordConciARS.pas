unit UFormRecordConciARS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls, Mask;

type
  TfrmConcARSRRecord = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBMemo1: TDBMemo;
    btnCancelar: TBitBtn;
    btnSalvar: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConcARSRRecord: TfrmConcARSRRecord;

implementation

uses UFormConciliarARS;

{$R *.dfm}

end.
