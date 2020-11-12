unit U530;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, d_MainDm, h_MainLib, h_ReferLib, StdCtrls, DB, ADODB,
  Grids, StrUtils, DBGrids, comobj, DBGridEhGrouping, EhLibADO, frxClass, frxDBSet,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh,DBGridEhImpExp,
  DBGridEh, Vcl.Mask, Vcl.DBCtrls, DBCtrlsEh, PrnDbgeh, Vcl.Buttons, Vcl.Menus,
  Vcl.Imaging.pngimage, Vcl.ComCtrls ;

type
  TfrmU530 = class(TForm)
    dsInfo: TDataSource;
    shpB: TShape;
    shpL: TShape;
    shpR: TShape;
    shpT: TShape;
    EhPrint: TPrintDBGridEh;
    Pnl_Base: TPanel;
    Pnl_Main: TPanel;
    Pnl_Top: TPanel;
    PnlMatCode: TPanel;
    edtMATCode: TEdit;
    Panel26: TPanel;
    Panel27: TPanel;
    PnlSpec: TPanel;
    edtMATSpec: TEdit;
    Panel11: TPanel;
    PnlSearch: TPanel;
    Panel8: TPanel;
    sbtClear: TSpeedButton;
    Panel6: TPanel;
    PnlCompleteDate: TPanel;
    Panel3: TPanel;
    Panel2: TPanel;
    Panel18: TPanel;
    Pnl_Main_Left: TPanel;
    Pnl_Main_Client: TPanel;
    PnlCode_perform: TPanel;
    Pnl_Sub_Top: TPanel;
    Pnl_Sub_Client: TPanel;
    PnlIn_Put: TPanel;
    PnlOut_Put: TPanel;
    Panel5: TPanel;
    DatePicker1: TDateTimePicker;
    TimePicker1: TDateTimePicker;
    Panel7: TPanel;
    Panel12: TPanel;
    Panel14: TPanel;
    DatePicker2: TDateTimePicker;
    TimePicker2: TDateTimePicker;
    qryInfo: TADOQuery;
    dgInfo: TDBGridEh;
    qryIn: TADOQuery;
    dsIn: TDataSource;
    qryOut: TADOQuery;
    dsOut: TDataSource;
    dgInfo_In: TDBGridEh;
    dgInfo_Out: TDBGridEh;
    chkGridInfo_IN: TCheckBox;
    chkGridInfo_OUT: TCheckBox;
    chkGridInfo: TCheckBox;
    Panel1: TPanel;
    sbt_ITEM: TSpeedButton;
    lblCompleteDate: TLabel;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    Panel9: TPanel;
    Panel4: TPanel;
    PnlCuringLine: TPanel;
    cbLine: TComboBox;
    LblCode_perform: TPanel;
    LblIn_Put: TPanel;
    LblOut_Put: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dgInfoTitleClick(Column: TColumnEh);
    procedure KeyPress(Sender: TObject; var Key: Char);
    procedure sbtClearClick(Sender: TObject);
    procedure sbt_ITEMClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure cbLineChange(Sender: TObject);
    procedure chkGridInfoClick(Sender: TObject);
    procedure dgInfoSelectionChanged(Sender: TObject);
    procedure DatePickerKeyPress(Sender: TObject; var Key: Char);
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
    procedure fnWmMsgRecv(var MSG: TMessage); message WM_USER ;
    procedure Display_WH_IN(MAT_CODE, VER_NO: String);
    procedure Display_WH_OUT (MAT_CODE, VER_NO: String);
  end;
  procedure U530Create();

const
  FormNo ='530';
  FIdx   = 5;
  SIdx   = 3;

var
  frmU530: TfrmU530;
  SrtFlag : integer = 0 ;

implementation

uses Main, ItemSearch ;

{$R *.dfm}

//==============================================================================
// U530Create
//==============================================================================
procedure U530Create();
begin
  if not Assigned(frmU530) then
  begin
    frmU530 := TfrmU530.Create(Application);
    with frmU530 do
    begin
      fnCommandStart;
      fnCommandLang;
    end;
  end;
  frmU530.Show;
end;

//==============================================================================
// fnWmMsgRecv
//==============================================================================
procedure TfrmU530.fnWmMsgRecv(var MSG: TMessage);
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
procedure TfrmU530.FormCreate(Sender: TObject);
begin
//
end;

//==============================================================================
// FormShow
//==============================================================================
procedure TfrmU530.FormShow(Sender: TObject);
begin
//
end;

//==============================================================================
// FormActivate
//==============================================================================
procedure TfrmU530.FormActivate(Sender: TObject);
begin
  MainDm.M_Info.ActiveFormID := '530';
  frmMain.LblMenu000.Caption := MainDm.M_Info.ActiveFormID + '. ' + getLangMenuString(MainDm.M_Info.ActiveFormID, frmMain.LblMenu000.Caption, MainDm.M_Info.LANG_TYPE, 'N');
  frmU530.Caption := MainDm.M_Info.ActiveFormName;
  frmMain.TabSetDisplay(frmU530, tsFormChange);
  fnCommandLang;
  fnWmMsgSend(StrToInt(menuGrade[FIdx][SIdx].Grade), 111);
end;

//==============================================================================
// FormDeactivate
//==============================================================================
procedure TfrmU530.FormDeactivate(Sender: TObject);
begin
//
end;

//==============================================================================
// FormClose
//==============================================================================
procedure TfrmU530.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryInfo.Active := False;
  qryIn.Active   := False;
  qryOut.Active  := False;

  Action := Cafree;
  try
    frmMain.TabSetDisplay(TForm(frmU530), tsDelete);
    frmU530 := Nil ;
  except
  end;
end;

//==============================================================================
// fnCommandStart [시작]
//==============================================================================
procedure TfrmU530.fnCommandStart;
begin
  DatePicker1.Date := Now-7;
  TimePicker1.Time := StrToTime('00:00:00.000');
  DatePicker2.Date := Now;
  TimePicker2.Time := StrToTime('23:59:59.999');
  fnCommandQuery ;
end;

//==============================================================================
// fnCommandOrder [지시]
//==============================================================================
procedure TfrmU530.fnCommandOrder  ;
begin
//
end;

//==============================================================================
// fnCommandAdd [신규]
//==============================================================================
procedure TfrmU530.fnCommandAdd  ;
begin
//
end;

//==============================================================================
// fnCommandDelete [삭제]
//==============================================================================
procedure TfrmU530.fnCommandDelete;
begin
//
end;

//==============================================================================
// fnCommandDelete [수정]
//==============================================================================
procedure TfrmU530.fnCommandUpdate;
begin
//
end;

//==============================================================================
// fnCommandExcel [엑셀]
//==============================================================================
procedure TfrmU530.fnCommandExcel;
var
  tmpGrid : TDBGridEh;
  tStr : String;
begin
  try
    if (chkGridInfo.Checked) then
    begin
      tmpGrid := dgInfo;
      tStr := '';
    end else
    if (chkGridInfo_IN.Checked) then
    begin
      tmpGrid := dgInfo_IN;
      tStr := '(StoreIn)';
    end else
    if (chkGridInfo_OUT.Checked) then
    begin
      tmpGrid := dgInfo_OUT;
      tStr := '(StoreOut)';
    end;

    if hlbEhgridListExcel(tmpGrid, Copy(MainDm.M_Info.ActiveFormName, 6, Length(MainDm.M_Info.ActiveFormName)-5) + tStr + '_' + FormatDatetime('YYYYMMDD', Now)) then
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
      TraceLogWrite('[530] procedure fnCommandExcel Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// fnCommandPrint [인쇄]
//==============================================================================
procedure TfrmU530.fnCommandPrint;
var
  tmpGrid : TDBGridEh;
  tStr : String;
begin
  try
    if (chkGridInfo.Checked) then
    begin
      tmpGrid := dgInfo;
      tStr := '';
    end else
    if (chkGridInfo_IN.Checked) then
    begin
      tmpGrid := dgInfo_IN;
      tStr := '(StoreIn)';
    end else
    if (chkGridInfo_OUT.Checked) then
    begin
      tmpGrid := dgInfo_OUT;
      tStr := '(StoreOut)';
    end;
    if not qryInfo.Active then Exit;

    EhPrint.DBGridEh := TmpGrid;
    EhPrint.PageHeader.LeftText.Clear;
    EhPrint.PageHeader.LeftText.Add(Copy(MainDm.M_Info.ActiveFormName, 6,
                                    Length(MainDm.M_Info.ActiveFormName)-5) + tStr);
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
      TraceLogWrite('[530] procedure fnCommandPrint Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// fnCommandQuery [조회]
//==============================================================================
procedure TfrmU530.fnCommandQuery;
var
  WhereStr, StrSQL : String;
  TmpDate1, TmpDate2, TmpTime1, TmpTime2 : String;
begin
  WhereStr := '' ;

  // MAT코드
  if (Trim(edtMATCode.Text) <> '') then
    WhereStr := WhereStr + ' AND Upper(GT_MAT_CODE) LIKE ' + QuotedStr('%'+UpperCase(edtMATCode.Text)+'%') ;

  // MAT사양
  if (Trim(edtMATSpec.Text) <> '') then
    WhereStr := WhereStr + ' AND Upper(GT_MAT_SPEC) LIKE ' + QuotedStr('%'+UpperCase(edtMATSpec.Text)+'%');

  // 완료일자
  TmpDate1 := FormatDateTime('YYYY-MM-DD'   , DatePicker1.Date);
  TmpTime1 := FormatDateTime(' HH:NN:SS.ZZZ', TimePicker1.Time);

  TmpDate2 := FormatDateTime('YYYY-MM-DD'   , DatePicker2.Date);
  TmpTime2 := FormatDateTime(' HH:NN:SS.ZZZ', TimePicker2.Time);

  WhereStr := WhereStr + ' AND TO_CHAR(COMPLETE_DATETIME, ''yyyy-mm-dd hh24:mi:ss'') BETWEEN ''' + TmpDate1 + TmpTime1 + ''' ' +
                                                                                       ' AND ''' + TmpDate2 + TmpTime2 + ''' ' ;
  try
    with qryInfo do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' SELECT GT_MAT_CODE, GT_MAT_SPEC, VER_NO, COUNT(*) AS JOB_CNT, ' +
                '        NVL(SUM(CASE WHEN ORDER_TYPE IN ( 110, 120 ) THEN 1 ELSE 0 END),0) AS IN_CNT, ' +
                '        NVL(SUM(CASE WHEN ORDER_TYPE IN ( 210, 220 ) THEN 1 ELSE 0 END),0) AS OT_CNT, ' +
                '        NVL((SELECT COUNT(*) ' +
                '               FROM W_STOCK_I S, C_RACK_I R ' +
                '              WHERE S.RACK_NO = R.RACK_NO ' +
                '                AND S.GT_MAT_CODE = VW_JOBORDER_H.GT_MAT_CODE ' +
                '                AND S.VER_NO = VW_JOBORDER_H.VER_NO ' +
                '                AND R.LUGG IN ( 1, 2 ) ' +
                '                AND R.STATUS = 0), 0) AS STK_CNT ' +
                '   FROM VW_JOBORDER_H ' +
                '  WHERE 1 = 1 ' + WhereStr +
                '    AND ORDER_STATUS = ''90'' ' + // 90 = Complete, 97=Cancel
                '  GROUP BY GT_MAT_CODE, GT_MAT_SPEC, VER_NO ' +
                '  ORDER BY GT_MAT_CODE, GT_MAT_SPEC, VER_NO ' ;
      SQL.Text := StrSQL;
      Open;
    end;
    qryIn.Close;
    qryOut.Close;
  except
    on E : Exception do
    begin
      qryInfo.Close;
      InsertPGMHist('['+FormNo+']', 'E', 'fnCommandQuery', 'Inquiry', 'Exception Error', 'SQL', StrSQL, '', E.Message);
      TraceLogWrite('[530] procedure fnCommandQuery Fail || ERR['+E.Message+'], SQL['+StrSQL+']');
    end;
  end ;
end;

//==============================================================================
// fnCommandClose [닫기]
//==============================================================================
procedure TfrmU530.fnCommandClose;
begin
//
end;

//==============================================================================
// fnCommandLang [언어]
//==============================================================================
procedure TfrmU530.fnCommandLang;
var
  i : integer;
begin
  try
    frmU530.Caption         := MainDm.M_Info.ActiveFormName;
    pnlSearch.Caption       := getLangString(FormNo, 'pSEARCH'      , 'Search'                 , MainDm.M_Info.LANG_TYPE, 'N');
    LblCompleteDate.Caption := getLangString(FormNo, 'HIS_DATE'     , 'Complete Date'          , MainDm.M_Info.LANG_TYPE, 'N');
    PnlMatCode.Caption      := getLangString(FormNo, 'GT_MAT_CODE'  , 'MAT Code'               , MainDm.M_Info.LANG_TYPE, 'N');
    PnlSpec.Caption         := getLangString(FormNo, 'GT_MAT_SPEC'  , 'MAT Spec'               , MainDm.M_Info.LANG_TYPE, 'N');
    LblCode_perform.Caption := getLangString(FormNo, 'pITEM_PERFORM', '[ Performance By Item ]', MainDm.M_Info.LANG_TYPE, 'N');
    LblIn_Put.Caption       := getLangString(FormNo, 'pIN_PUT'      , '[ Input Performance ]'  , MainDm.M_Info.LANG_TYPE, 'N');
    LblOut_Put.Caption      := getLangString(FormNo, 'pOUT_PUT'     , '[ Output Performance ]' , MainDm.M_Info.LANG_TYPE, 'N');
    PnlCuringLine.Caption   := getLangString(FormNo, 'pCURING_LINE' , 'Curing Line'            , MainDm.M_Info.LANG_TYPE, 'N');

    for i := 0 to dgInfo.Columns.Count-1 do
    begin
      dgInfo.Columns[i].Title.Caption := getLangString(FormNo, dgInfo.Columns[i].FieldName, dgInfo.Columns[i].Title.Caption, MainDm.M_Info.LANG_TYPE, 'N');
      if i <= 3 then
      begin
        dgInfo_IN.Columns[i].Title.Caption  := getLangString(FormNo, dgInfo_IN.Columns[i].FieldName, dgInfo_IN.Columns[i].Title.Caption, MainDm.M_Info.LANG_TYPE, 'N');
        dgInfo_OUT.Columns[i].Title.Caption := getLangString(FormNo, dgInfo_OUT.Columns[i].FieldName, dgInfo_OUT.Columns[i].Title.Caption, MainDm.M_Info.LANG_TYPE, 'N');
      end;
    end;
  except
    on E : Exception do
    begin
      InsertPGMHist('['+FormNo+']', 'E', 'fnCommandLang', 'Language', 'Exception Error', 'PGM', '', '', E.Message);
      TraceLogWrite('[530] procedure fnCommandLang || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// dgInfoSelectionChanged
//==============================================================================
procedure TfrmU530.dgInfoSelectionChanged(Sender: TObject);
begin
  try
    if (not qryInfo.Active) or (qryInfo.RecordCount = 0) then Exit;
    Display_WH_IN (dginfo.Fields[0].AsString, dgInfo.Fields[2].AsString) ;
    Display_WH_OUT(dginfo.Fields[0].AsString, dgInfo.Fields[2].AsString) ;
  except
    on E : Exception do
    begin
      InsertPGMHist('['+FormNo+']', 'E', 'dgInfoSelectionChanged', '', 'Exception Error', 'PGM', '', '', E.Message);
      TraceLogWrite('[530] procedure dgInfoSelectionChanged || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// Display_WH_IN
//==============================================================================
procedure TfrmU530.Display_WH_IN(MAT_CODE,VER_NO: String);
var
  TmpDate1, TmpDate2, TmpTime1, TmpTime2 : String;
  StrSQL, WhereStr, tStr, Mch_Id, FId, FCnt : String;
  i : Integer;
begin
  if Trim(MAT_CODE) = '' then Exit;

  tStr := '';
  TmpDate1 := FormatDateTime('YYYY-MM-DD'   , DatePicker1.Date);
  TmpTime1 := FormatDateTime(' HH:NN:SS.ZZZ', TimePicker1.Time);

  TmpDate2 := FormatDateTime('YYYY-MM-DD'   , DatePicker2.Date);
  TmpTime2 := FormatDateTime(' HH:NN:SS.ZZZ', TimePicker2.Time);

  WhereStr := WhereStr + ' AND TO_CHAR(COMPLETE_DATETIME, ''yyyy-mm-dd hh24:mi:ss'') BETWEEN ''' + TmpDate1 + TmpTime1 + ''' ' +
                                                                                       ' AND ''' + TmpDate2 + TmpTime2 + ''' ' ;

  for i := 1 to TBM_MAX_COUNT do
  begin
    //Mch_Id := 'TBM #' + FormatFloat('00', i);
    Mch_Id := MainDm.MACH_TBM[i].ID;
    FId    := 'M' + FormatFloat('00', i) + '_ID' ;
    FCnt   := 'M' + FormatFloat('00', i) + '_CNT';
    tStr   := tStr +', ' + QuotedStr(Mch_Id) + ' as ' + FId +
                    ', Nvl(SUM(Decode(TBM_NO, ' + QuotedStr(Mch_Id) + ', 1, 0)), 0) as ' + FCnt;
  end;

  try
    with qryIn do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' SELECT TO_CHAR(COMPLETE_DATETIME, ''YYYYMMDD'') AS HIS_DATE ' +
                '      , COUNT(GT_MAT_CODE) TOTAL ' +
                '      , ''MAN'' AS M00_ID ' +
                '      , NVL(SUM(DECODE(TBM_NO, ''MAN'', 1, 0)), 0) AS M00_CNT ' + tStr +
                '   FROM VW_JOBORDER_H ' +
                '  WHERE ORDER_STATUS = 90 ' +                     // 90 = Complete
                '    AND ORDER_TYPE IN ( 110, 120 ) ' + WhereStr + // 110, 120 입고
                '    AND GT_MAT_CODE = ' + QuotedStr(MAT_CODE) +
                '    AND VER_NO = ' + QuotedStr(VER_NO) +
                '  GROUP BY TO_CHAR(COMPLETE_DATETIME, ''YYYYMMDD'') ' +
                '  ORDER BY TO_CHAR(COMPLETE_DATETIME, ''YYYYMMDD'') ' ;
      SQL.Text := StrSQL;
      Open;
    end;
  except
    on E : Exception do
    begin
      qryIn.Close;
      InsertPGMHist('['+FormNo+']', 'E', 'Display_WH_IN', 'Inquiry', 'Exception Error', 'SQL', StrSQL, '', E.Message);
      TraceLogWrite('[530] procedure Display_WH_IN Fail || ERR['+E.Message+'], SQL['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// Display_WH_OUT
//==============================================================================
procedure TfrmU530.Display_WH_OUT(MAT_CODE, VER_NO: String);
var
  TmpDate1, TmpDate2, TmpTime1, TmpTime2 : String;
  StrSQL, WhereStr, tStr, Mch_Id, FId, FCnt : String;
  i : Integer;
begin
  if Trim(MAT_CODE) = '' then Exit;

  tStr := '';
  TmpDate1 := FormatDateTime('YYYY-MM-DD'   , DatePicker1.Date);
  TmpTime1 := FormatDateTime(' HH:NN:SS.ZZZ', TimePicker1.Time);

  TmpDate2 := FormatDateTime('YYYY-MM-DD'   , DatePicker2.Date);
  TmpTime2 := FormatDateTime(' HH:NN:SS.ZZZ', TimePicker2.Time);

  WhereStr := WhereStr + ' AND TO_CHAR(COMPLETE_DATETIME, ''yyyy-mm-dd hh24:mi:ss'') BETWEEN ''' + TmpDate1 + TmpTime1 + ''' ' +
                                                                                       ' AND ''' + TmpDate2 + TmpTime2 + ''' ' ;
  for i := 1 to CUR_LINE_COUNT do
  begin
    //Mch_Id := cbLine.Text + '_' + FormatFloat('00', i);
    Mch_Id := MainDm.MACH_CUR[(cbLine.ItemIndex*17)+ i].ID;

    FId  := 'M' + FormatFloat('00', i) + '_ID';
    FCnt := 'M' + FormatFloat('00', i) + '_CNT';

    tStr := tStr +', ' + QuotedStr(Mch_Id) + ' as ' + FId +
                  ', Nvl(SUM(Decode(CURE_NO, ' + QuotedStr(Mch_Id) + ', 1, 0)), 0) as ' + FCnt;
  end;

  try
    with qryOut do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' SELECT TO_CHAR(COMPLETE_DATETIME, ''YYYYMMDD'') AS HIS_DATE ' +
                '      , COUNT(GT_MAT_CODE) TOTAL ' +
                '      , ''MAN'' AS M00_ID ' +
                '      , NVL(SUM(DECODE(CURE_NO, ''MAN'', 1, 0)), 0) AS M00_CNT ' + tStr +
                '   FROM VW_JOBORDER_H ' +
                '  WHERE ORDER_STATUS = 90 ' +
                '    AND ORDER_TYPE IN ( 210, 220 ) ' + WhereStr +
                '    AND GT_MAT_CODE = ' + QuotedStr(MAT_CODE) +
                '    AND VER_NO = ' + QuotedStr(VER_NO) +
                '  GROUP BY TO_CHAR(COMPLETE_DATETIME, ''YYYYMMDD'') ' +
                '  ORDER BY TO_CHAR(COMPLETE_DATETIME, ''YYYYMMDD'') ' ;
      SQL.Text := StrSQL;
      Open;
    end;
  except
    on E : Exception do
    begin
      qryOut.Close;
      InsertPGMHist('['+FormNo+']', 'E', 'Display_WH_OUT', 'Inquiry', 'Exception Error', 'SQL', StrSQL, '', E.Message);
      TraceLogWrite('[530] procedure Display_WH_OUT Fail || ERR['+E.Message+'], SQL['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// KeyPress
//==============================================================================
procedure TfrmU530.KeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
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
procedure TfrmU530.sbtClearClick(Sender: TObject);
begin
  edtMATCode.Text := ''; // 제품코드
  edtMATSpec.Text := ''; // 제품명
  DatePicker1.Date := Now-7;
  TimePicker1.Time := StrToTime('00:00:00');
  DatePicker2.Date := Now;
  TimePicker2.Time := StrToTime('23:59:59');
  DatePicker1.SetFocus;
  qryIn.Close;
  qryOut.Close;
  fnCommandQuery;
end;

//==============================================================================
// sbt_ITEMClick [품목찾기]
//==============================================================================
procedure TfrmU530.sbt_ITEMClick(Sender: TObject);
begin
  try
    frmItemSearch := TfrmItemSearch.Create(Application);
    frmItemSearch.edtCode.Text := edtMATCode.Text;
    frmItemSearch.ShowModal ;

    if m.Popup_ItemInfo.ResultCd = 'OK' then
    begin
      edtMATCode.Text := m.Popup_ItemInfo.DATA01;
      edtMATCode.SetFocus;
      fnCommandQuery;
    end;
  except
    on E : Exception do
    begin
      InsertPGMHist('['+FormNo+']', 'E', 'sbt_ITEMClick', '', 'Exception Error', 'PGM', '', '', E.Message);
      TraceLogWrite('[530] procedure sbt_ITEMClick || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// dgInfoTitleClick
//==============================================================================
procedure TfrmU530.dgInfoTitleClick(Column: TColumnEh);
begin
  if Column.Field = nil then Exit;
  if Column.Field.DataSet is TADOQuery then
  begin
    with TADOQuery(Column.Field.DataSet) do
    begin
      if RecordCount=0 then Exit ;
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
// cbLineChange   //가류기 라인 선택
//==============================================================================
procedure TfrmU530.cbLineChange(Sender: TObject);
begin
  Display_WH_OUT(qryInfo.FieldByName('GT_MAT_CODE').AsString,
                 qryInfo.FieldByName('VER_NO'     ).AsString);
end;

//==============================================================================
// FormResize
//==============================================================================
procedure TfrmU530.FormResize(Sender: TObject);
begin
  Pnl_Sub_Top.Height := (Pnl_Base.Height - Panel2.Height - Splitter2.Height) div 2;
end;

//==============================================================================
// chkGridInfo_INClick
//==============================================================================
procedure TfrmU530.chkGridInfoClick(Sender: TObject);
var
  i : integer;
  eArrChkBox : TArray<TCheckBox>;
begin
  if (Sender as TCheckBox).Checked then
  begin
    eArrChkBox := TArray<TCheckBox>.Create(
    chkGridInfo, chkGridInfo_IN, chkGridInfo_OUT);

    for i := 0 to Length(eArrChkBox) - 1 do
    begin
      if Sender as TCheckBox = eArrChkBox[i] then
      begin
        eArrChkBox[i].Checked := True;
        eArrChkBox[i].Enabled := False
      end
      else
      begin
       eArrChkBox[i].Checked := False;
       eArrChkBox[i].Enabled := True;
      end;
    end;
  end;
end;

//==============================================================================
// DatePickerKeyPress
//==============================================================================
procedure TfrmU530.DatePickerKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
  begin
    fnCommandQuery;
  end else
  if (Key = #27) then
  begin
    Case (Sender as TDateTimePicker).Tag of
      0 : (Sender as TDateTimePicker).Date := Now-7;
      1 : (Sender as TDateTimePicker).Date := Now;
      2 : (Sender as TDateTimePicker).Time := StrToTime('00:00:00.000');
      3 : (Sender as TDateTimePicker).Time := StrToTime('23:59:59.999');
    end;
  end;
end;

end.

