unit UFormaRepParaDos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls,
  pr_Common, pr_Txclasses, pr_Txdesigner, ImgList, Buttons, pr_Dataset,
  WinSkinData;

type
  TfrmRepParaDos = class(TForm)
    Button1: TButton;
    CBTemplates: TComboBox;
    ImageList1: TImageList;
    BitBtn1: TBitBtn;
    CBShowProgress: TCheckBox;
    Label1: TLabel;
    prEventsDataset1: TprEventsDataset;
    SkinData1: TSkinData;
    procedure Button1Click(Sender: TObject);
    procedure CBTemplatesDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    procedure OnDestroyDesigner(Sender : TObject);
    procedure OnDesignerSaveTemplate(Sender : TObject; var FileName : string; IsSaveAs: Boolean);//OnDesignerSaveTemplate(Sender : TObject; var FileName : string; var Stream : TStream; var CancelSave : boolean; var IsBinaryFormat : boolean; IsSaveAs : boolean);

    procedure InitTemplatesList;
    function  InitReport : TprTxReport;
    
  public
    { Public declarations }
  end;

var
  frmRepParaDos: TfrmRepParaDos;

implementation

{$R *.DFM}

function TfrmRepParaDos.InitReport: TprTxReport;
begin
  Result:=TprTxReport.Create(Self);
  Result.OnDestroyDesigner:=OnDestroyDesigner;
  Result.OnDestroyPreview :=OnDestroyDesigner;
  Result.OnCreateDesigner :=OnDestroyDesigner;
  Result.OnCreatePreview  :=OnDestroyDesigner;
  Result.OnDesignerSave := OnDesignerSaveTemplate;
end;


procedure TfrmRepParaDos.OnDesignerSaveTemplate(Sender : TObject; var FileName : string; IsSaveAs: Boolean);
//OnDesignerSaveTemplate(Sender: TObject;
//  var FileName: string; var Stream: TStream; var CancelSave,
//  IsBinaryFormat: boolean; IsSaveAs: boolean);
var
  i,ii : Integer;
begin
  if IsSaveAs then
     FileName := ExtractFilePath(ParamStr(0))+ExtractFileName(FileName);
  ii := CBTemplates.ItemIndex;
  i := CBTemplates.Items.IndexOfObject(Sender);
  if i<>-1 then
     CBTemplates.Items[i] := ExtractFileName(FileName);
     CBTemplates.ItemIndex := ii;
end;

procedure TfrmRepParaDos.OnDestroyDesigner;
begin
  CBTemplates.Repaint;
end;


procedure TfrmRepParaDos.Button1Click(Sender: TObject);
var
  r : TprTxReport;
begin
  if CBTemplates.Items.Objects[CBTemplates.ItemIndex]=nil then
  begin
    R:=InitReport;
    R.LoadTemplateFromFile(ExtractFilePath(ParamStr(0))+CBTemplates.Items[CBTemplates.ItemIndex],false);
    CBTemplates.Items.Objects[CBTemplates.ItemIndex]:=R;
  end
  else
     R:=TprTxReport(CBTemplates.Items.Objects[CBTemplates.ItemIndex]);
  R.DesignReport(false);
end;

procedure TfrmRepParaDos.CBTemplatesDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
var
  Report : TprTxReport;
begin
Report:=TprTxReport(CBTemplates.Items.Objects[index]);
with CBTemplates.Canvas do
  begin
    FillRect(Rect);
    if Report<>nil then
      begin
        Font.Style:=[fsBold];
        if Report.DesignerForm<>nil then
          ImageList1.Draw(CBTemplates.Canvas,Rect.Left+1,Rect.Top,0);
        if Report.PreviewForm<>nil then
          ImageList1.Draw(CBTemplates.Canvas,Rect.Left+ImageList1.Width+2,Rect.Top,1);
      end
    else
      Font.Style:=[];
    TextOut(Rect.Left+ImageList1.Width*2+2,Rect.Top+1,CBTemplates.Items[index]);
  end;
end;

procedure TfrmRepParaDos.FormCreate(Sender: TObject);
begin
  ThousandSeparator:=',';
  Left := 0;
  Top := 0;
  InitTemplatesList;
end;

procedure TfrmRepParaDos.InitTemplatesList;
var
  SearchRec : TSearchRec;
  ruta : string;
begin
  CBTemplates.Clear;
  Ruta:=ExtractFilePath(ParamStr(0))+'*.prt';
  if FindFirst(ruta, faAnyFile, SearchRec)=0 then
     CBTemplates.Items.Add(SearchRec.Name);
  While FindNext(SearchRec) = 0 Do
        CBTemplates.Items.Add(SearchRec.Name);
  FindClose(SearchRec);

  if CBTemplates.Items.Count>0 then
     CBTemplates.ItemIndex:=0;
end;


procedure TfrmRepParaDos.BitBtn1Click(Sender: TObject);
var
  R : TprTxReport;
  tc : cardinal;
begin
if CBTemplates.Items.Objects[CBTemplates.ItemIndex]=nil then
  begin
    R := InitReport;
    R.LoadTemplateFromFile(ExtractFilePath(ParamStr(0))+CBTemplates.Items[CBTemplates.ItemIndex],false);
    CBTemplates.Items.Objects[CBTemplates.ItemIndex]:=R;
  end
else
  R:=TprTxReport(CBTemplates.Items.Objects[CBTemplates.ItemIndex]);

R.ShowProgress:=CBShowProgress.Checked;
if R.PreviewForm=nil then
  begin
    tc := GetTickCount;
    R.PrepareReport;
    tc := GetTickCount-tc;
    Label1.Caption := Trim(Format('Report generate time: %-12.4f',[tc/1000]))+' sec';
  end;

  if R.ReportPrepared then
  R.PreviewPreparedReport(false);
end;

end.
