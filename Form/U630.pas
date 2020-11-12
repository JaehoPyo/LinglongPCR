unit U630;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, d_MainDm, h_MainLib, h_ReferLib, StdCtrls, DB, ADODB,
  Grids, StrUtils, DBGrids, comobj, DBGridEhGrouping, EhLibADO,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh,DBGridEhImpExp,
  DBGridEh, Vcl.Mask, Vcl.DBCtrls, DBCtrlsEh, PrnDbgeh, Vcl.Buttons, Vcl.Menus,
  Vcl.ComCtrls ;

type
  TfrmU630 = class(TForm)
    dsInfo: TDataSource;
    qryInfo: TADOQuery;
    shpB: TShape;
    shpL: TShape;
    shpR: TShape;
    shpT: TShape;
    EhPrint: TPrintDBGridEh;
    Pnl_Base: TPanel;
    Pnl_Main: TPanel;
    dgInfo: TDBGridEh;
    Panel2: TPanel;
    Panel3: TPanel;
    Pnl_Top: TPanel;
    PnlCode: TPanel;
    Panel11: TPanel;
    PnlSearch: TPanel;
    Panel8: TPanel;
    sbtClear: TSpeedButton;
    edtCode: TEdit;
    PnlName: TPanel;
    edtName: TEdit;
    Panel6: TPanel;
    PnlRowHeight: TPanel;
    lblRowHeight: TLabel;
    PnlFontSize: TPanel;
    lblFontSize: TLabel;
    udRowHeight: TUpDown;
    edtRowHeight: TEdit;
    udFontSize: TUpDown;
    edtFontSize: TEdit;
    lblSearch: TLabel;
    lblCnt: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dgInfoTitleClick(Column: TColumnEh);
    procedure KeyPress(Sender: TObject; var Key: Char);
    procedure sbtClearClick(Sender: TObject);
    procedure qryInfoAfterPost(DataSet: TDataSet);
    procedure qryInfoBeforeEdit(DataSet: TDataSet);
    procedure dgInfoKeyPress(Sender: TObject; var Key: Char);
    procedure edtRowHeightChange(Sender: TObject);
    procedure edtFontSizeChange(Sender: TObject);
    procedure dgInfoMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure fnCommandStart;
    procedure fnCommandOrder ;
    procedure fnCommandAdd  ;
    procedure fnCommandDelete;
    procedure fnCommandUpdate;
    procedure fnCommandExcel;
    procedure fnCommandPrint;
    procedure fnCommandQuery;
    procedure fnCommandLang;
    procedure fnCommandClose;
    procedure fnWmMsgRecv (var MSG : TMessage) ; message WM_USER ;
    function  fnCompareCellInfo(beforeD, afterD: TDATA_INFO): Boolean;
  end;
  procedure U630Create();

const
  FormNo ='630';
  FIdx   = 6;
  SIdx   = 3;

var
  frmU630: TfrmU630;
  SrtFlag : integer = 0 ;

  beforeData, afterData : TDATA_INFO;

implementation

uses Main ;

{$R *.dfm}

//==============================================================================
// U630Create
//==============================================================================
procedure U630Create();
begin
  if not Assigned(frmU630) then
  begin
    frmU630 := TfrmU630.Create(Application);
    with frmU630 do
    begin
      fnCommandStart;
      fnCommandLang;
    end;
  end;
  frmU630.Show;
end;

//==============================================================================
// fnWmMsgRecv
//==============================================================================
procedure TfrmU630.fnWmMsgRecv(var MSG: TMessage);
begin
  case MSG.WParam of
    MSG_MDI_WIN_ORDER   : begin fnCommandOrder   ; end;           // MSG_MDI_WIN_ORDER   = 11 ; // 지시
    MSG_MDI_WIN_ADD     : begin fnCommandAdd     ; end;           // MSG_MDI_WIN_ADD     = 12 ; // 신규
    MSG_MDI_WIN_DELETE  : begin fnCommandDelete  ; end;           // MSG_MDI_WIN_DELETE  = 13 ; // 삭제
    MSG_MDI_WIN_UPDATE  : begin fnCommandUpdate  ; end;           // MSG_MDI_WIN_UPDATE  = 14 ; // 수정
    MSG_MDI_WIN_EXCEL   : begin fnCommandExcel   ; end;           // MSG_MDI_WIN_EXCEL   = 15 ; // 엑셀
    MSG_MDI_WIN_PRINT   : begin fnCommandPrint   ; end;           // MSG_MDI_WIN_PRINT   = 16 ; // 인쇄
    MSG_MDI_WIN_QUERY   : begin fnCommandQuery   ; end;           // MSG_MDI_WIN_QUERY   = 17 ; // 조회
    MSG_MDI_WIN_CLOSE   : begin fnCommandClose   ; Close; end;    // MSG_MDI_WIN_CLOSE   = 20 ; // 닫기
    MSG_MDI_WIN_LANG    : begin fnCommandLang    ; end;           // MSG_MDI_WIN_LANG    = 21 ; // 언어
  end;
end;

//==============================================================================
// FormCreate
//==============================================================================
procedure TfrmU630.FormCreate(Sender: TObject);
begin
//
end;

//==============================================================================
// FormShow
//==============================================================================
procedure TfrmU630.FormShow(Sender: TObject);
begin
//
end;

//==============================================================================
// FormActivate
//==============================================================================
procedure TfrmU630.FormActivate(Sender: TObject);
var
  i : integer;
begin
  MainDm.M_Info.ActiveFormID := '630';
  frmMain.LblMenu000.Caption := MainDm.M_Info.ActiveFormID + '. ' + getLangMenuString(MainDm.M_Info.ActiveFormID, frmMain.LblMenu000.Caption, MainDm.M_Info.LANG_TYPE, 'N');
  frmU630.Caption := MainDm.M_Info.ActiveFormName;
  frmMain.TabSetDisplay(frmU630, tsFormChange);
  fnCommandLang;
  fnWmMsgSend(StrToInt(menuGrade[FIdx][SIdx].Grade), 111);
  fnCommandQuery ;

  if not frmMain.cmdUPDATE.Enabled then
       dgInfo.Options := dgInfo.Options - [dgEditing] + [dgRowSelect]
  else dgInfo.Options := dgInfo.Options + [dgEditing] - [dgRowSelect];
end;

//==============================================================================
// FormDeactivate
//==============================================================================
procedure TfrmU630.FormDeactivate(Sender: TObject);
begin
  if qryInfo.State in [dsEdit, dsInsert] then
  begin
    qryInfo.Post;
  end;
end;

//==============================================================================
// FormClose
//==============================================================================
procedure TfrmU630.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if qryInfo.State in [dsEdit, dsInsert] then
  begin
    qryInfo.Post;
  end;

  qryInfo.Active := False;

  Action := Cafree;
  try
    frmMain.TabSetDisplay(TForm(frmU630), tsDelete);
    frmU630 := Nil ;
  except
  end;
end;

//==============================================================================
// fnCommandStart [시작]
//==============================================================================
procedure TfrmU630.fnCommandStart;
begin
//
end;

//==============================================================================
// fnCommandOrder [지시]
//==============================================================================
procedure TfrmU630.fnCommandOrder;
begin
//
end;

//==============================================================================
// fnCommandAdd [신규]
//==============================================================================
procedure TfrmU630.fnCommandAdd  ;
begin
//
end;

//==============================================================================
// fnCommandDelete [삭제]
//==============================================================================
procedure TfrmU630.fnCommandDelete;
begin
//
end;

//==============================================================================
// fnCommandUpdate [수정]
//==============================================================================
procedure TfrmU630.fnCommandUpdate;
begin
  try
    if qryInfo.State in [dsEdit, dsInsert] then
    begin
      qryInfo.Post;
    end;
  except
    on E : Exception do
    begin
      InsertPGMHist('['+FormNo+']', 'E', 'fnCommandUpdate', 'Update', 'Exception Error', 'PGM', '', '', E.Message);
      TraceLogWrite('[630] procedure fnCommandUpdate Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// fnCommandExcel [엑셀]
//==============================================================================
procedure TfrmU630.fnCommandExcel;
begin
  try
    if hlbEhgridListExcel(dgInfo, Copy(MainDm.M_Info.ActiveFormName, 6, Length(MainDm.M_Info.ActiveFormName)-5) + '_' + FormatDatetime('YYYYMMDD', Now)) then
    begin
      MessageDlg('Excel save completed.', mtConfirmation, [mbYes], 0);
    end else
    begin
      MessageDlg('Excel save failed.', mtWarning, [mbYes], 0);
    end;
  except
    on E : Exception do
    begin
      InsertPGMHist('['+FormNo+']', 'E', 'fnCommandExcel', 'Excel', 'Exception Error', 'PGM', '', '', E.Message);
      TraceLogWrite('[630] procedure fnCommandExcel Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// fnCommandPrint [인쇄]
//==============================================================================
procedure TfrmU630.fnCommandPrint;
begin
  try
    if not qryInfo.Active then Exit;
    fnCommandQuery;
    EhPrint.DBGridEh := dgInfo;
    EhPrint.PageHeader.LeftText.Clear;
    EhPrint.PageHeader.LeftText.Add(Copy(MainDm.M_Info.ActiveFormName, 6,
                                    Length(MainDm.M_Info.ActiveFormName)-5) );
    EhPrint.PageHeader.Font.Name := '돋움';
    EhPrint.PageHeader.Font.Size := 10;
    EhPrint.PageFooter.RightText.Clear;
    EhPrint.PageFooter.RightText.Add(FormatDateTime('YYYY-MM-DD HH:NN:SS', Now) + '   ' +
                                     MainDM.M_Info.UserCode+' / '+MainDM.M_Info.UserName);
    EhPrint.PageFooter.Font.Name := '돋움';
    EhPrint.PageFooter.Font.Size := 10;
    EhPrint.Preview;
  except
    on E : Exception do
    begin
      InsertPGMHist('['+FormNo+']', 'E', 'fnCommandPrint', 'Print', 'Exception Error', 'PGM', '', '', E.Message);
      TraceLogWrite('[630] procedure fnCommandPrint Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// fnCommandQuery [조회]
//==============================================================================
procedure TfrmU630.fnCommandQuery;
var
  WhereStr, StrSQL : String;
begin
  try
    WhereStr := '' ;
    // 메뉴번호
    if (Trim(edtCode.Text) <> '') then
      WhereStr := WhereStr + ' AND MENU_ID LIKE ' + QuotedStr('%'+edtCode.Text+'%');
    // 메뉴명
    if (Trim(edtName.Text) <> '') then
      WhereStr := WhereStr + ' AND ( MENU_NM_KOR LIKE ' + QuotedStr('%'+edtName.Text+'%') +
                             '  OR   MENU_NM_CHI LIKE ' + QuotedStr('%'+edtName.Text+'%') +
                             '  OR   UPPER(MENU_NM_ENG) LIKE ' + QuotedStr('%'+UpperCase(edtName.Text)+'%') + ')'; // 영문은 대문자로 변환해서 비교

    with qryInfo do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' SELECT WRHS, MENU_ID, MENU_LVL, MENU_USED, ' +
                '        MENU_NM_KOR, MENU_NM_ENG, MENU_NM_CHI, ' +
                '        UP_DATE, CR_DATE ' +
                '   FROM C_MENU_I ' +
                '  WHERE 1 = 1 ' + WhereStr +
                '  ORDER BY MENU_ID ';
      SQL.Text := StrSQL;
      Open;
      lblCnt.Caption := '('+FormatFloat('###,###,##0',RecordCount)+')';
    end;
  except
    on E : Exception do
    begin
      qryInfo.Close;
      InsertPGMHist('['+FormNo+']', 'E', 'fnCommandQuery', 'Inquiry', 'Exception Error', 'SQL', StrSQL, '', E.Message);
      TraceLogWrite('[630] procedure fnCommandQuery Fail || ERR['+E.Message+'], SQL['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// fnCommandClose [닫기]
//==============================================================================
procedure TfrmU630.fnCommandClose;
begin
//
end;

//==============================================================================
// fnCommandLang [언어]
//==============================================================================
procedure TfrmU630.fnCommandLang;
var
  i : integer;
begin
  try
    frmU630.Caption      := MainDm.M_Info.ActiveFormName;
    LblSearch.Caption    := getLangString(FormNo, 'pSEARCH'    , 'Search'    , MainDm.M_Info.LANG_TYPE, 'N');
    PnlCode.Caption      := getLangString(FormNo, 'MENU_ID'    , 'Menu Code' , MainDm.M_Info.LANG_TYPE, 'N');
    PnlName.Caption      := getLangString(FormNo, 'MENU_NM'    , 'Menu Name' , MainDm.M_Info.LANG_TYPE, 'N');
    lblRowHeight.Caption := getLangString(FormNo, 'pROW_HEIGHT', 'Row Height', MainDm.M_Info.LANG_TYPE, 'N');
    lblFontSize.Caption  := getLangString(FormNo, 'pFONT_SIZE' , 'Font Size' , MainDm.M_Info.LANG_TYPE, 'N');

    for i := 0 to dgInfo.Columns.Count-1 do
    begin
      if not dgInfo.Columns[i].Visible then Continue;
      dgInfo.Columns[i].Title.Caption := getLangString(FormNo, dgInfo.Columns[i].FieldName, dgInfo.Columns[i].Title.Caption, MainDm.M_Info.LANG_TYPE, 'N');
    end;
  except
    on E : Exception do
    begin
      InsertPGMHist('['+FormNo+']', 'E', 'fnCommandLang', 'Language', 'Exception Error', 'PGM', '', '', E.Message);
      TraceLogWrite('[630] procedure fnCommandLang || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// KeyPress
//==============================================================================
procedure TfrmU630.KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    fnCommandQuery;
  end else
  if (Key = #27) then
  begin
    (Sender as TEdit).Text := '';
  end;
end;

//==============================================================================
// sbtClearClick
//==============================================================================
procedure TfrmU630.sbtClearClick(Sender: TObject);
begin
  edtCode.Text := '';
  edtName.Text := '';
  edtCode.SetFocus;
  dgInfo.SelectedRows.Clear;
  fnCommandQuery;
end;

//==============================================================================
// dgInfoMouseMove
//==============================================================================
procedure TfrmU630.dgInfoMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  if (qryInfo.Active = false ) then Exit;

  if qryInfo.State in [dsEdit, dsInsert] then
  begin
    qryInfo.Post;
  end;
end;

//==============================================================================
// dgInfoTitleClick
//==============================================================================
procedure TfrmU630.dgInfoTitleClick(Column: TColumnEh);
begin
  if Column.Field = nil then Exit;
  if Column.Field.DataSet is TADOQuery then
  begin
    with TADOQuery(Column.Field.DataSet) do
    begin
      if RecordCount = 0 then Exit ;
      if SrtFlag = 0 then
      begin
        SrtFlag := 1; Sort := Column.FieldName + ' DESC' ;
      end else
      begin
        SrtFlag := 0; Sort := Column.FieldName + ' ASC' ;
      end;
    end;
  end;
end;

//==============================================================================
// fnCompareCellInfo
//==============================================================================
function TfrmU630.fnCompareCellInfo(beforeD, afterD: TDATA_INFO): Boolean;
var
  i : Integer;
begin
  i := 0;
  try
    if beforeData.DATA3 <> afterData.DATA3 then Inc(i);
    if beforeData.DATA4 <> afterData.DATA4 then Inc(i);
    if beforeData.DATA5 <> afterData.DATA5 then Inc(i);
    Result := Boolean(i > 0);
  except
    on E : Exception do
    begin
      InsertPGMHist('['+FormNo+']', 'E', 'fnCompareCellInfo', '', 'Exception Error', 'PGM', '', '', E.Message);
      TraceLogWrite('[630] function fnCompareCellInfo Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// qryInfoAfterPost
//==============================================================================
procedure TfrmU630.qryInfoAfterPost(DataSet: TDataSet);
begin
  try
    afterData.FrmNo := FormNo;
    afterData.DATA1 := DataSet.FieldByName('WRHS'       ).AsString;
    afterData.DATA2 := DataSet.FieldByName('MENU_ID'    ).AsString;
    afterData.DATA3 := DataSet.FieldByName('MENU_NM_KOR').AsString;
    afterData.DATA4 := DataSet.FieldByName('MENU_NM_ENG').AsString;
    afterData.DATA5 := DataSet.FieldByName('MENU_NM_CHI').AsString;

    if fnCompareCellInfo(beforeData, afterData) then
    begin
      afterData.CompareStr := 'Warehouse[' + afterData.DATA1 + '], Menu Code['+afterData.DATA2+'], Update[';
      if beforeData.DATA3 <> afterData.DATA3 then afterData.CompareStr := afterData.CompareStr + '('+beforeData.DATA3+'->'+afterData.DATA3+')';
      if beforeData.DATA4 <> afterData.DATA4 then afterData.CompareStr := afterData.CompareStr + '('+beforeData.DATA4+'->'+afterData.DATA4+')';
      if beforeData.DATA5 <> afterData.DATA5 then afterData.CompareStr := afterData.CompareStr + '('+beforeData.DATA5+'->'+afterData.DATA5+')';
      afterData.CompareStr := afterData.CompareStr + ']';
    end else
    begin
      afterData.CompareStr := '';
      Exit;
    end;
    InsertPGMHist('['+FormNo+']', 'N', 'qryInfoAfterPost', 'Update', afterData.CompareStr, 'PGM', '', '', '');
    TraceLogWrite('[630] Program Name Update || ' + afterData.CompareStr);

    DataSet.Edit ;
    DataSet.FieldByName('UP_DATE').AsDateTime := Now;
    DataSet.Post;

    // 변경 된 내용으로 디스플레이 변경
    MainDm.M_Info.LANG_PGM := fnMenuNameGetRecord(MainDm.M_Info.WRHS, MainDm.M_Info.LANG_TYPE);
    frmMain.fnNameChange;
  except
    on E : Exception do
    begin
      InsertPGMHist('['+FormNo+']', 'E', 'qryInfoAfterPost', 'Update', 'Exception Error', 'PGM', '', '', E.Message);
      TraceLogWrite('[630] procedure qryInfoAfterPost Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// qryInfoBeforeEdit
//==============================================================================
procedure TfrmU630.qryInfoBeforeEdit(DataSet: TDataSet);
begin
  try
    beforeData.FrmNo := FormNo;
    beforeData.DATA1 := DataSet.FieldByName('WRHS'       ).AsString;
    beforeData.DATA2 := DataSet.FieldByName('MENU_ID'    ).AsString;
    beforeData.DATA3 := DataSet.FieldByName('MENU_NM_KOR').AsString;
    beforeData.DATA4 := DataSet.FieldByName('MENU_NM_ENG').AsString;
    beforeData.DATA5 := DataSet.FieldByName('MENU_NM_CHI').AsString;
  except
    on E : Exception do
    begin
      InsertPGMHist('['+FormNo+']', 'E', 'qryInfoBeforeEdit', '', 'Exception Error', 'PGM', '', '', E.Message);
      TraceLogWrite('[630] procedure qryInfoBeforeEdit Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// dgInfoKeyPress
//==============================================================================
procedure TfrmU630.dgInfoKeyPress(Sender: TObject; var Key: Char);
begin
  if (qryInfo.Active = false ) then Exit;

  if key = #13 then
  begin
    if qryInfo.State in [dsEdit, dsInsert] then
    begin
      qryInfo.Post;
    end;
  end;
end;

//==============================================================================
// edtFontSizeChange
//==============================================================================
procedure TfrmU630.edtFontSizeChange(Sender: TObject);
begin
  dgInfo.Font.Size := StrToIntDef((Sender as TEdit).Text,11);
end;

//==============================================================================
// edtRowHeightChange
//==============================================================================
procedure TfrmU630.edtRowHeightChange(Sender: TObject);
begin
  dgInfo.RowLines := StrToIntDef((Sender as TEdit).Text,0);
end;

end.




