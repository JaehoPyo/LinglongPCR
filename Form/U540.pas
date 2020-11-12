unit U540;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, d_MainDm, h_MainLib, h_ReferLib, StdCtrls, DB, ADODB,
  Grids, StrUtils, DBGrids, comobj, DBGridEhGrouping, EhLibADO, frxClass, frxDBSet,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh,DBGridEhImpExp,
  DBGridEh, Vcl.Mask, Vcl.DBCtrls, DBCtrlsEh, PrnDbgeh, Vcl.Buttons, Vcl.Menus,
  Vcl.Imaging.pngimage, Vcl.ComCtrls ;

type
  TfrmU540 = class(TForm)
    dsInfo: TDataSource;
    shpB: TShape;
    shpL: TShape;
    shpR: TShape;
    shpT: TShape;
    EhPrint: TPrintDBGridEh;
    Pnl_Base: TPanel;
    Pnl_Main: TPanel;
    Pnl_Top: TPanel;
    Panel26: TPanel;
    Panel27: TPanel;
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
    Panel7: TPanel;
    Panel12: TPanel;
    Panel14: TPanel;
    DatePicker2: TDateTimePicker;
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
    procedure Display_WH_IN(PeriodStr: String);
    procedure Display_WH_OUT(PeriodStr: String);
  end;
  procedure U540Create();

const
  FormNo ='540';
  FIdx   = 5;
  SIdx   = 4;

var
  frmU540: TfrmU540;
  SrtFlag : integer = 0 ;

implementation

uses Main, ItemSearch ;

{$R *.dfm}

//==============================================================================
// U540Create
//==============================================================================
procedure U540Create();
begin
  if not Assigned(frmU540) then
  begin
    frmU540 := TfrmU540.Create(Application);
    with frmU540 do
    begin
      fnCommandStart;
      fnCommandLang;
    end;
  end;
  frmU540.Show;
end;

//==============================================================================
// fnWmMsgRecv
//==============================================================================
procedure TfrmU540.fnWmMsgRecv(var MSG: TMessage);
begin
  case MSG.WParam of
    MSG_MDI_WIN_ORDER   : begin fnCommandOrder   ; end;           // MSG_MDI_WIN_ORDER   = 11 ; // Áö½Ã
    MSG_MDI_WIN_ADD     : begin fnCommandAdd     ; end;           // MSG_MDI_WIN_ADD     = 12 ; // ½Å±Ô
    MSG_MDI_WIN_DELETE  : begin fnCommandDelete  ; end;           // MSG_MDI_WIN_DELETE  = 13 ; // »èÁ¦
    MSG_MDI_WIN_UPDATE  : begin fnCommandUpdate  ; end;           // MSG_MDI_WIN_UPDATE  = 14 ; // ¼öÁ¤
    MSG_MDI_WIN_EXCEL   : begin fnCommandExcel   ; end;           // MSG_MDI_WIN_EXCEL   = 15 ; // ¿¢¼¿
    MSG_MDI_WIN_PRINT   : begin fnCommandPrint   ; end;           // MSG_MDI_WIN_PRINT   = 16 ; // ÀÎ¼â
    MSG_MDI_WIN_QUERY   : begin fnCommandQuery   ; end;           // MSG_MDI_WIN_QUERY   = 17 ; // Á¶È¸
    MSG_MDI_WIN_CLOSE   : begin fnCommandClose   ; Close; end;    // MSG_MDI_WIN_CLOSE   = 20 ; // ´Ý±â
    MSG_MDI_WIN_LANG    : begin fnCommandLang    ; end;           // MSG_MDI_WIN_LANG    = 21 ; // ¾ð¾î
  end;
end;

//==============================================================================
// FormCreate
//==============================================================================
procedure TfrmU540.FormCreate(Sender: TObject);
begin
//
end;

//==============================================================================
// FormShow
//==============================================================================
procedure TfrmU540.FormShow(Sender: TObject);
begin
//
end;

//==============================================================================
// FormActivate
//==============================================================================
procedure TfrmU540.FormActivate(Sender: TObject);
begin
  MainDm.M_Info.ActiveFormID := '540';
  frmMain.LblMenu000.Caption := MainDm.M_Info.ActiveFormID + '. ' + getLangMenuString(MainDm.M_Info.ActiveFormID, frmMain.LblMenu000.Caption, MainDm.M_Info.LANG_TYPE, 'N');
  frmU540.Caption := MainDm.M_Info.ActiveFormName;
  frmMain.TabSetDisplay(frmU540, tsFormChange);
  fnCommandLang;
  fnWmMsgSend(StrToInt(menuGrade[FIdx][SIdx].Grade), 111);
end;

//==============================================================================
// FormDeactivate
//==============================================================================
procedure TfrmU540.FormDeactivate(Sender: TObject);
begin
//
end;

//==============================================================================
// FormClose
//==============================================================================
procedure TfrmU540.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryInfo.Active := False;
  qryIn.Active   := False;
  qryOut.Active  := False;

  Action := Cafree;
  try
    frmMain.TabSetDisplay(TForm(frmU540), tsDelete);
    frmU540 := Nil ;
  except
  end;
end;

//==============================================================================
// fnCommandStart [½ÃÀÛ]
//==============================================================================
procedure TfrmU540.fnCommandStart;
begin
  DatePicker1.Date := Now-7;
  DatePicker2.Date := Now;
  fnCommandQuery ;
end;

//==============================================================================
// fnCommandOrder [Áö½Ã]
//==============================================================================
procedure TfrmU540.fnCommandOrder  ;
begin
//
end;

//==============================================================================
// fnCommandAdd [½Å±Ô]
//==============================================================================
procedure TfrmU540.fnCommandAdd  ;
begin
//
end;

//==============================================================================
// fnCommandDelete [»èÁ¦]
//==============================================================================
procedure TfrmU540.fnCommandDelete;
begin
//
end;

//==============================================================================
// fnCommandDelete [¼öÁ¤]
//==============================================================================
procedure TfrmU540.fnCommandUpdate;
begin
//
end;

//==============================================================================
// fnCommandExcel [¿¢¼¿]
//==============================================================================
procedure TfrmU540.fnCommandExcel;
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
      TraceLogWrite('[540] procedure fnCommandExcel Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// fnCommandPrint [ÀÎ¼â]
//==============================================================================
procedure TfrmU540.fnCommandPrint;
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
    EhPrint.PageHeader.Font.Name := 'µ¸¿ò';
    EhPrint.PageHeader.Font.Size := 10;
    EhPrint.PageFooter.RightText.Clear;
    EhPrint.PageFooter.RightText.Add(FormatDateTime('YYYY-MM-DD HH:NN:SS', Now) + '   ' +
                                     MainDM.M_Info.UserCode+' / '+MainDM.M_Info.UserName);
    EhPrint.PageFooter.Font.Name := 'µ¸¿ò';
    EhPrint.PageFooter.Font.Size := 10;
    EhPrint.Preview;
  except
    on E : Exception do
    begin
      InsertPGMHist('['+FormNo+']', 'E', 'fnCommandPrint', 'Print', 'Exception Error', 'PGM', '', '', E.Message);
      TraceLogWrite('[540] procedure fnCommandPrint Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// fnCommandQuery [Á¶È¸]
//==============================================================================
procedure TfrmU540.fnCommandQuery;
var
  WhereStr, StrSQL : String;
  TmpDate1, TmpDate2, TmpTime1, TmpTime2 : String;
begin
  WhereStr := '' ;

  // ¿Ï·áÀÏÀÚ
  TmpDate1 := FormatDateTime('YYYY-MM-DD', DatePicker1.Date);
  TmpTime1 := ' 00:00:00.000';

  TmpDate2 := FormatDateTime('YYYY-MM-DD', DatePicker2.Date);
  TmpTime2 := ' 23:59:59.999';

  WhereStr := WhereStr + ' AND TO_CHAR(COMPLETE_DATETIME, ''yyyy-mm-dd hh24:mi:ss'') BETWEEN ''' + TmpDate1 + TmpTime1 + ''' ' +
                                                                                       ' AND ''' + TmpDate2 + TmpTime2 + ''' ' ;
  try
    with qryInfo do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' SELECT TO_CHAR(COMPLETE_DATETIME, ''YYYYMMDD'') as JOB_DATE, ' +
                '        COUNT(*) AS JOB_CNT, ' +
                '        NVL(SUM(CASE WHEN ORDER_TYPE IN ( 110, 120 ) THEN 1 ELSE 0 END),0) AS IN_CNT, ' +
                '        NVL(SUM(CASE WHEN ORDER_TYPE IN ( 210, 220 ) THEN 1 ELSE 0 END),0) AS OT_CNT ' +
                '   FROM VW_JOBORDER_H ' +
                '  WHERE 1 = 1 ' + WhereStr +
                '    AND ORDER_STATUS = ''90'' ' + // 90 = Complete, 97=Cancel
                '    AND ORDER_TYPE IN ( 110, 120, 210, 220 ) ' +
                '  GROUP BY TO_CHAR(COMPLETE_DATETIME, ''YYYYMMDD'') ' +
                '  ORDER BY TO_CHAR(COMPLETE_DATETIME, ''YYYYMMDD'') ' ;
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
      TraceLogWrite('[540] procedure fnCommandQuery Fail || ERR['+E.Message+'], SQL['+StrSQL+']');
    end;
  end ;
end;

//==============================================================================
// fnCommandClose [´Ý±â]
//==============================================================================
procedure TfrmU540.fnCommandClose;
begin
//
end;

//==============================================================================
// fnCommandLang [¾ð¾î]
//==============================================================================
procedure TfrmU540.fnCommandLang;
var
  i : integer;
begin
  try
    frmU540.Caption         := MainDm.M_Info.ActiveFormName;
    pnlSearch.Caption       := getLangString(FormNo, 'pSEARCH'        , 'Search'                   , MainDm.M_Info.LANG_TYPE, 'N');
    LblCompleteDate.Caption := getLangString(FormNo, 'JOB_DATE'       , 'Complete Date'            , MainDm.M_Info.LANG_TYPE, 'N');
    LblCode_perform.Caption := getLangString(FormNo, 'pPERIOD_PERFORM', '[ Performance By Period ]', MainDm.M_Info.LANG_TYPE, 'N');
    LblIn_Put.Caption       := getLangString(FormNo, 'pIN_PUT'        , '[ Input Performance ]'    , MainDm.M_Info.LANG_TYPE, 'N');
    LblOut_Put.Caption      := getLangString(FormNo, 'pOUT_PUT'       , '[ Output Performance ]'   , MainDm.M_Info.LANG_TYPE, 'N');
    PnlCuringLine.Caption   := getLangString(FormNo, 'pCURING_LINE'   , 'Curing Line'              , MainDm.M_Info.LANG_TYPE, 'N');

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
      TraceLogWrite('[540] procedure fnCommandLang || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// dgInfoSelectionChanged
//==============================================================================
procedure TfrmU540.dgInfoSelectionChanged(Sender: TObject);
begin
  try
    if (not qryInfo.Active) or (qryInfo.RecordCount = 0) then Exit;
    Display_WH_IN (dginfo.Fields[0].AsString) ;
    Display_WH_OUT(dginfo.Fields[0].AsString) ;
  except
    on E : Exception do
    begin
      InsertPGMHist('['+FormNo+']', 'E', 'dgInfoSelectionChanged', '', 'Exception Error', 'PGM', '', '', E.Message);
      TraceLogWrite('[540] procedure dgInfoSelectionChanged || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// Display_WH_IN
//==============================================================================
procedure TfrmU540.Display_WH_IN(PeriodStr: String);
var
  StrSQL, tStr, Mch_Id, FId, FCnt, tCol : String;
  i : Integer;
begin
  if Trim(PeriodStr) = '' then Exit;

  tStr := ''; tCol := '';

  for i := 1 to TBM_MAX_COUNT do
  begin
    //Mch_Id := 'TBM #' + FormatFloat('00', i);
    Mch_Id := MainDm.MACH_TBM[i].ID;
    FId    := 'M' + FormatFloat('00', i) + '_ID' ;
    FCnt   := 'M' + FormatFloat('00', i) + '_CNT';
    tStr   := tStr + ', ' + QuotedStr(Mch_Id) + ' as ' + FId +
                     ', Nvl(SUM(Decode(TBM_NO, ' + QuotedStr(Mch_Id) + ', 1, 0)), 0) as ' + FCnt;
    tCol   := tCol + ', NVL('+FId+','+QuotedStr(Mch_Id)+') as ' + FId +
                     ', NVL('+FCnt+',0) as ' + FCnt ;
  end;

  try
    with qryIn do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' SELECT TMR.TIME_NUM, NVL(HIS.TOTAL,0) as TOTAL_DESC, ' +
                '        NVL(HIS.M00_ID,''MAN'') as M00_ID, NVL(HIS.M00_CNT,0) as M00_CNT ' + tCol +
                '   FROM ( SELECT COUNT(TO_CHAR(COMPLETE_DATETIME, ''YYYYMMDD'')) as TOTAL, ' +
                '                 TO_CHAR(COMPLETE_DATETIME, ''hh24'') as TIME_HIS, ' +
                '                 ''MAN'' AS M00_ID, ' +
                '                 NVL(SUM(DECODE(TBM_NO, ''MAN'', 1, 0)), 0) AS M00_CNT ' + tStr +
                '            FROM VW_JOBORDER_H ' +
                '           WHERE ORDER_STATUS = 90 ' +           // 90 = Complete, 97=Cancel
                '             AND ORDER_TYPE IN ( 110, 120 ) ' +  // 110, 120 ÀÔ°í
                '             AND TO_CHAR(COMPLETE_DATETIME, ''YYYYMMDD'') = ' + QuotedStr(PeriodStr) +
                '           GROUP BY TO_CHAR(COMPLETE_DATETIME, ''hh24'') ' +
                '           ORDER BY TO_CHAR(COMPLETE_DATETIME, ''hh24'')) HIS, ' +
                '        ( SELECT TRIM(TO_CHAR(LEVEL-1, ''00'')) as TIME_NUM ' +
                '            FROM DUAL ' +
                '         CONNECT BY LEVEL <= 24) TMR ' +
                '  WHERE HIS.TIME_HIS(+) = TMR.TIME_NUM ' +
                '   ORDER BY TMR.TIME_NUM ' ;
      SQL.Text := StrSQL;
      Open;
    end;
  except
    on E : Exception do
    begin
      qryIn.Close;
      InsertPGMHist('['+FormNo+']', 'E', 'Display_WH_IN', 'Inquiry', 'Exception Error', 'SQL', StrSQL, '', E.Message);
      TraceLogWrite('[540] procedure Display_WH_IN Fail || ERR['+E.Message+'], SQL['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// Display_WH_OUT
//==============================================================================
procedure TfrmU540.Display_WH_OUT(PeriodStr: String);
var
  StrSQL, WhereStr, tStr, Mch_Id, FId, FCnt, tCol : String;
  i : Integer;
begin
  if Trim(PeriodStr) = '' then Exit;

  tStr := ''; tCol := '';

  for i := 1 to CUR_LINE_COUNT do
  begin
    //Mch_Id := cbLine.Text + '_' + FormatFloat('00', i);
    Mch_Id := MainDm.MACH_CUR[(cbLine.ItemIndex*17)+ i].ID;
    FId  := 'M' + FormatFloat('00', i) + '_ID';
    FCnt := 'M' + FormatFloat('00', i) + '_CNT';

    tStr := tStr + ', ' + QuotedStr(Mch_Id) + ' as ' + FId +
                   ', Nvl(SUM(Decode(CURE_NO, ' + QuotedStr(Mch_Id) + ', 1, 0)), 0) as ' + FCnt;
    tCol := tCol + ', NVL('+FId+','+QuotedStr(Mch_Id)+') as ' + FId +
                   ', NVL('+FCnt+',0) as ' + FCnt ;
  end;

  try
    with qryOut do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' SELECT TMR.TIME_NUM, NVL(HIS.TOTAL,0) as TOTAL_DESC, ' +
                '        NVL(HIS.M00_ID,''MAN'') as M00_ID, NVL(HIS.M00_CNT,0) as M00_CNT ' + tCol +
                '   FROM ( SELECT COUNT(TO_CHAR(COMPLETE_DATETIME, ''YYYYMMDD'')) as TOTAL, ' +
                '                 TO_CHAR(COMPLETE_DATETIME, ''hh24'') as TIME_HIS, ' +
                '                 ''MAN'' AS M00_ID, ' +
                '                 NVL(SUM(DECODE(CURE_NO, ''MAN'', 1, 0)), 0) AS M00_CNT ' + tStr +
                '            FROM VW_JOBORDER_H ' +
                '           WHERE ORDER_STATUS = 90 ' +           // 90 = Complete, 97=Cancel
                '             AND ORDER_TYPE IN ( 210, 220 ) ' +  // 110, 120 ÀÔ°í
                '             AND TO_CHAR(COMPLETE_DATETIME, ''YYYYMMDD'') = ' + QuotedStr(PeriodStr) +
                '           GROUP BY TO_CHAR(COMPLETE_DATETIME, ''hh24'') ' +
                '           ORDER BY TO_CHAR(COMPLETE_DATETIME, ''hh24'')) HIS, ' +
                '        ( SELECT TRIM(TO_CHAR(LEVEL-1, ''00'')) as TIME_NUM ' +
                '            FROM DUAL ' +
                '         CONNECT BY LEVEL <= 24) TMR ' +
                '  WHERE HIS.TIME_HIS(+) = TMR.TIME_NUM ' +
                '   ORDER BY TMR.TIME_NUM ' ;
      SQL.Text := StrSQL;
      Open;
    end;
  except
    on E : Exception do
    begin
      qryOut.Close;
      InsertPGMHist('['+FormNo+']', 'E', 'Display_WH_OUT', 'Inquiry', 'Exception Error', 'SQL', StrSQL, '', E.Message);
      TraceLogWrite('[540] procedure Display_WH_OUT Fail || ERR['+E.Message+'], SQL['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// KeyPress
//==============================================================================
procedure TfrmU540.KeyPress(Sender: TObject; var Key: Char);
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
procedure TfrmU540.sbtClearClick(Sender: TObject);
begin
  DatePicker1.Date := Now-7;
  DatePicker2.Date := Now;
  DatePicker1.SetFocus;
  qryIn.Close;
  qryOut.Close;
  fnCommandQuery;
end;

//==============================================================================
// dgInfoTitleClick
//==============================================================================
procedure TfrmU540.dgInfoTitleClick(Column: TColumnEh);
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
// cbLineChange
//==============================================================================
procedure TfrmU540.cbLineChange(Sender: TObject);
begin
  Display_WH_OUT(qryInfo.FieldByName('JOB_DATE').AsString);
end;

//==============================================================================
// FormResize
//==============================================================================
procedure TfrmU540.FormResize(Sender: TObject);
begin
  Pnl_Sub_Top.Height := (Pnl_Base.Height - Panel2.Height - Splitter2.Height) div 2;
end;

//==============================================================================
// chkGridInfo_INClick
//==============================================================================
procedure TfrmU540.chkGridInfoClick(Sender: TObject);
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
      end else
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
procedure TfrmU540.DatePickerKeyPress(Sender: TObject; var Key: Char);
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
    end;
  end;
end;

end.

