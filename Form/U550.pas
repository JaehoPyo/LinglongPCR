unit U550;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, d_MainDm, h_MainLib, h_ReferLib, StdCtrls, DB, ADODB,
  Grids, StrUtils, DBGrids, comobj, frxClass, frxDBSet, DBGridEhGrouping, EhLibADO,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh,DBGridEhImpExp,
  DBGridEh, Vcl.Mask, Vcl.DBCtrls, DBCtrlsEh, PrnDbgeh, Vcl.Buttons, Vcl.Menus,
  Vcl.Imaging.pngimage, Vcl.ComCtrls, VclTee.TeeGDIPlus, VCLTee.TeEngine,
  VCLTee.Series, VCLTee.TeeProcs, VCLTee.Chart, VCLTee.DBChart ;

type
  TfrmU550 = class(TForm)
    dsInfo: TDataSource;
    qryInfo: TADOQuery;
    shpB: TShape;
    shpL: TShape;
    shpR: TShape;
    shpT: TShape;
    EhPrint: TPrintDBGridEh;
    Pnl_Base: TPanel;
    Pnl_Main: TPanel;
    Pnl_Top: TPanel;
    Panel11: TPanel;
    PnlSearch: TPanel;
    Panel8: TPanel;
    sbtClear: TSpeedButton;
    Panel6: TPanel;
    DatePicker1: TDateTimePicker;
    TimePicker1: TDateTimePicker;
    PnlCompleteDate: TPanel;
    Panel3: TPanel;
    Panel2: TPanel;
    Panel18: TPanel;
    DatePicker2: TDateTimePicker;
    TimePicker2: TDateTimePicker;
    lblCnt: TLabel;
    edtErrorCode: TEdit;
    PnlMachine: TPanel;
    PnlErrorCode: TPanel;
    cbMACHINE: TComboBox;
    PnlRowHeight: TPanel;
    PnlFontSize: TPanel;
    udRowHeight: TUpDown;
    edtRowHeight: TEdit;
    udFontSize: TUpDown;
    edtFontSize: TEdit;
    lblSearch: TLabel;
    lblOccurDate: TLabel;
    lblRowHeight: TLabel;
    lblFontSize: TLabel;
    Panel4: TPanel;
    Panel5: TPanel;
    dgInfo: TDBGridEh;
    qrySummary: TADOQuery;
    dsSummary: TDataSource;
    Pnl_Bottom: TPanel;
    Splitter1: TSplitter;
    Splitter3: TSplitter;
    Pnl_Bottom_Right: TPanel;
    DBChart1: TDBChart;
    Series2: TBarSeries;
    Pnl_Bottom_Left: TPanel;
    dgSummary: TDBGridEh;
    Panel10: TPanel;
    LblSummary: TPanel;
    Panel7: TPanel;
    LblChart: TPanel;
    chkGridMain: TCheckBox;
    chkGridSub: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtClearClick(Sender: TObject);
    procedure cbKeyPress(Sender: TObject; var Key: Char);
    procedure KeyPress(Sender: TObject; var Key: Char);
    procedure edtRowHeightChange(Sender: TObject);
    procedure edtFontSizeChange(Sender: TObject);
    procedure dgInfoTitleClick(Column: TColumnEh);
    procedure DatePickerKeyPress(Sender: TObject; var Key: Char);
    procedure cbChange(Sender: TObject);
    procedure Pnl_MainResize(Sender: TObject);
    procedure chkGridMainClick(Sender: TObject);
    procedure chkGridSubClick(Sender: TObject);
  private
    { Private declarations }
    procedure DisplayChart ;
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
  end;
  procedure U550Create();

const
  FormNo ='550';
  FIdx   = 5;
  SIdx   = 5;

var
  frmU550: TfrmU550;
  SrtFlag : integer = 0 ;

implementation

uses Main ;

{$R *.dfm}

//==============================================================================
// U550Create
//==============================================================================
procedure U550Create();
begin
  if not Assigned(frmU550) then
  begin
    frmU550 := TfrmU550.Create(Application);
    with frmU550 do
    begin
      fnCommandStart;
      fnCommandLang;
    end;
  end;
  frmU550.Show;
end;

//==============================================================================
// fnWmMsgRecv
//==============================================================================
procedure TfrmU550.fnWmMsgRecv(var MSG: TMessage);
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
procedure TfrmU550.FormCreate(Sender: TObject);
begin
//
end;

//==============================================================================
// FormShow
//==============================================================================
procedure TfrmU550.FormShow(Sender: TObject);
begin
//
end;

//==============================================================================
// FormActivate
//==============================================================================
procedure TfrmU550.FormActivate(Sender: TObject);
begin
  MainDm.M_Info.ActiveFormID := '550';
  frmMain.LblMenu000.Caption := MainDm.M_Info.ActiveFormID + '. ' + getLangMenuString(MainDm.M_Info.ActiveFormID, frmMain.LblMenu000.Caption, MainDm.M_Info.LANG_TYPE, 'N');
  frmU550.Caption := MainDm.M_Info.ActiveFormName;
  frmMain.TabSetDisplay(frmU550, tsFormChange);
  fnCommandLang;
  fnWmMsgSend(StrToInt(menuGrade[FIdx][SIdx].Grade), 111);
end;

//==============================================================================
// FormDeactivate
//==============================================================================
procedure TfrmU550.FormDeactivate(Sender: TObject);
begin
//
end;

//==============================================================================
// FormClose
//==============================================================================
procedure TfrmU550.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryInfo.Active    := False;
  qrySummary.Active := False;

  Action := Cafree;
  try
    frmMain.TabSetDisplay(TForm(frmU550), tsDelete);
    frmU550 := Nil ;
  except
  end;
end;

//==============================================================================
// fnCommandStart [시작]
//==============================================================================
procedure TfrmU550.fnCommandStart;
begin
  DatePicker1.Date := Now;
  TimePicker1.Time := StrToTime('00:00:00.000');
  DatePicker2.Date := Now;
  TimePicker2.Time := StrToTime('23:59:59.999');
  fnCommandQuery ;
end;

//==============================================================================
// fnCommandOrder [지시]
//==============================================================================
procedure TfrmU550.fnCommandOrder  ;
begin
//
end;

//==============================================================================
// fnCommandAdd [신규]
//==============================================================================
procedure TfrmU550.fnCommandAdd  ;
begin
//
end;

//==============================================================================
// fnCommandDelete [삭제]
//==============================================================================
procedure TfrmU550.fnCommandDelete;
begin
//
end;

//==============================================================================
// fnCommandDelete [수정]
//==============================================================================
procedure TfrmU550.fnCommandUpdate;
begin
//
end;

//==============================================================================
// fnCommandExcel [엑셀]
//==============================================================================
procedure TfrmU550.fnCommandExcel;
var
  TmpGrid : TDBGridEh;
  tStr : String;
begin
  try
    if chkGridMain.Checked then
    begin
      TmpGrid := dgInfo;
      tStr := '';
    end else
    begin
      TmpGrid := dgSummary;
      tStr := '(Summary)';
    end;

    if hlbEhgridListExcel(TmpGrid, Copy(MainDm.M_Info.ActiveFormName, 6, Length(MainDm.M_Info.ActiveFormName)-5) + tStr + '_' + FormatDatetime('YYYYMMDD', Now)) then
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
      TraceLogWrite('[550] procedure fnCommandExcel Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// fnCommandPrint [인쇄]
//==============================================================================
procedure TfrmU550.fnCommandPrint;
var
  TmpGrid : TDBGridEh;
  tStr : String;
begin
  try
    if chkGridMain.Checked then
    begin
      TmpGrid := dgInfo;
      tStr := '';
    end else
    begin
      TmpGrid := dgSummary;
      tStr := '(Detail)';
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
      TraceLogWrite('[550] procedure fnCommandPrint Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// fnCommandQuery [조회]
//==============================================================================
procedure TfrmU550.fnCommandQuery;
var
  WhereStr, StrSQL : String;
  TmpDate1, TmpDate2, TmpTime1, TmpTime2 : String;
begin
  WhereStr := '' ;

  // 에러코드
  if (Trim(edtErrorCode.Text) <> '') then
    WhereStr := WhereStr + ' AND UPPER(ERROR_CODE) LIKE ' + QuotedStr('%'+UpperCase(edtErrorCode.Text)+'%');

  // 설비 명
  if (cbMACHINE.ItemIndex <> 0 ) then
    WhereStr := WhereStr + ' AND UPPER(ERROR_MACHINE_NM) LIKE ' + QuotedStr('%'+UpperCase(cbMACHINE.Text)+'%');

  // 발생일시
  TmpDate1 := FormatDateTime('YYYY-MM-DD'   , DatePicker1.Date);
  TmpTime1 := FormatDateTime(' HH:NN:SS.ZZZ', TimePicker1.Time);

  TmpDate2 := FormatDateTime('YYYY-MM-DD'   , DatePicker2.Date);
  TmpTime2 := FormatDateTime(' HH:NN:SS.ZZZ', TimePicker2.Time);

  WhereStr := WhereStr + ' AND TO_CHAR(ERROR_LOG_DATETIME, ''yyyy-mm-dd hh24:mi:ss'') BETWEEN ''' + TmpDate1 + TmpTime1 + ''' ' +
                                                                                        ' AND ''' + TmpDate2 + TmpTime2 + ''' ' ;
  try
    with qryInfo do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' SELECT * ' +
                '   FROM ( SELECT ERROR_LOG_DATETIME, ERROR_CODE, ' +
                '                 CASE WHEN A.ERROR_MACHINE < 30 THEN ''S/C#'' || TO_CHAR(ERROR_MACHINE) ' +
                '                      WHEN A.ERROR_MACHINE IN (31, 32, 33, 34, 35) THEN ''PLC#'' || TO_CHAR(ERROR_MACHINE - 30) ' +
                '                      WHEN A.ERROR_MACHINE IN (41, 42, 43, 44, 45) THEN ''EMS#'' || TO_CHAR(ERROR_MACHINE - 40) ' +
                '                      ELSE TO_CHAR(A.ERROR_MACHINE) END ERROR_MACHINE_NM, ' +
                '                 NVL( ( SELECT B.ERROR_NAME AS ERROR_NAME ' + // ERROR_CODE || ''-'' ||
                '                          FROM C_ERROR_D B ' +
                '                         WHERE B.ERROR_MACHINE = CASE WHEN A.ERROR_MACHINE < 30 THEN 1 ' +
                '                                                      WHEN (A.ERROR_MACHINE >= 30) AND (A.ERROR_MACHINE < 40) THEN 3 ' +
                '                                                      ELSE 4 END ' +
                '                           AND ERROR_CODE = A.ERROR_CODE ), ''N/A'') ERROR_NAME, ' +
                '                 RESET_DATETIME, ERROR_SITE, ERROR_BAY, ERROR_LEVEL, ORDER_ID, JOB_NO ' +
                '            FROM C_ERROR_L A ' +
                '           WHERE ERROR_CODE <> ''0'' ' +
                '           ORDER BY ERROR_LOG_DATETIME DESC, ERROR_MACHINE ' +
                '         ) ' +
                '  WHERE 1=1 ' + WhereStr ;
      SQL.Text := StrSQL;
      Open;
      lblCnt.Caption := '('+IntToStr(RecordCount)+')';
    end;
    DisplayChart;
  except
    on E : Exception do
    begin
      qryInfo.Close;
      InsertPGMHist('['+FormNo+']', 'E', 'fnCommandQuery', 'Inquiry', 'Exception Error', 'SQL', StrSQL, '', E.Message);
      TraceLogWrite('[550] procedure fnCommandQuery Fail || ERR['+E.Message+'], SQL['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// fnCommandClose [닫기]
//==============================================================================
procedure TfrmU550.fnCommandClose;
begin
//
end;

//==============================================================================
// fnCommandLang [언어]
//==============================================================================
procedure TfrmU550.fnCommandLang;
var
  i : integer;
  cbIndex : Integer;
begin
  try
    frmU550.Caption         := MainDm.M_Info.ActiveFormName;
    lblSearch.Caption       := getLangString(FormNo, 'pSEARCH'           , 'Search'           , MainDm.M_Info.LANG_TYPE, 'N');
    lblOccurDate.Caption    := getLangString(FormNo, 'ERROR_LOG_DATETIME', 'Occurrence Date'  , MainDm.M_Info.LANG_TYPE, 'N');
    PnlMachine.Caption      := getLangString(FormNo, 'ERROR_MACHINE_NM'  , 'Machine'          , MainDm.M_Info.LANG_TYPE, 'N');
    PnlErrorCode.Caption    := getLangString(FormNo, 'ERROR_CODE'        , 'Error Code'       , MainDm.M_Info.LANG_TYPE, 'N');
    lblRowHeight.Caption    := getLangString(FormNo, 'pROW_HEIGHT'       , 'Row Height'       , MainDm.M_Info.LANG_TYPE, 'N');
    lblFontSize.Caption     := getLangString(FormNo, 'pFONT_SIZE'        , 'Font Size'        , MainDm.M_Info.LANG_TYPE, 'N');
    lblSummary.Caption      := getLangString(FormNo, 'pSummary'          , '[ Error Summary ]', MainDm.M_Info.LANG_TYPE, 'N');
    LblChart.Caption        := getLangString(FormNo, 'pChart'            , '[ Error Chart ]'  , MainDm.M_Info.LANG_TYPE, 'N');

    for i := 0 to dgInfo.Columns.Count-1 do
    begin
      dgInfo.Columns[i].Title.Caption := getLangString(FormNo, dgInfo.Columns[i].FieldName, dgInfo.Columns[i].Title.Caption, MainDm.M_Info.LANG_TYPE, 'N');

      if i <= dgSummary.Columns.Count-1 then
      begin
        dgSummary.Columns[i].Title.Caption := getLangString(FormNo, dgSummary.Columns[i].FieldName, dgSummary.Columns[i].Title.Caption, MainDm.M_Info.LANG_TYPE, 'N');
      end;
    end;

    cbIndex := cbMACHINE.ItemIndex;
    cbMACHINE.Items.Clear();
    cbMACHINE.Items.Add(getLangString(FormNo, 'cbALL', 'ALL', MainDm.M_Info.LANG_TYPE, 'N'));
    cbMACHINE.Items.Add('EMS');
    cbMACHINE.Items.Add('S/C');
    cbMACHINE.Items.Add('PLC');
    cbMACHINE.ItemIndex := cbIndex;
  except
    on E : Exception do
    begin
      InsertPGMHist('['+FormNo+']', 'E', 'fnCommandLang', 'Language', 'Exception Error', 'PGM', '', '', E.Message);
      TraceLogWrite('[550] procedure fnCommandLang || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// 에러 집계
//==============================================================================
procedure TfrmU550.DisplayChart;
var
  StrSQL, WhereStr1, WhereStr2 : String;
  TmpDate1, TmpDate2, TmpTime1, TmpTime2 : String;
begin
  WhereStr1 := ''; WhereStr2 := '';

  // 에러코드
  if (Trim(edtErrorCode.Text) <> '') then
    WhereStr1 := WhereStr1 + ' AND UPPER(ERROR_CODE) LIKE ' + QuotedStr('%'+UpperCase(edtErrorCode.Text)+'%');

  // 설비 명
  if (cbMACHINE.ItemIndex <> 0 ) then
    WhereStr2 := WhereStr2 + ' AND UPPER(ERROR_MACHINE_NM) LIKE ' + QuotedStr('%'+UpperCase(cbMACHINE.Text)+'%');

  // 발생일시
  TmpDate1 := FormatDateTime('YYYY-MM-DD'   , DatePicker1.Date);
  TmpTime1 := FormatDateTime(' HH:NN:SS.ZZZ', TimePicker1.Time);

  TmpDate2 := FormatDateTime('YYYY-MM-DD'   , DatePicker2.Date);
  TmpTime2 := FormatDateTime(' HH:NN:SS.ZZZ', TimePicker2.Time);

  WhereStr1 := WhereStr1 + ' AND TO_CHAR(ERROR_LOG_DATETIME, ''yyyy-mm-dd hh24:mi:ss'') BETWEEN ''' + TmpDate1 + TmpTime1 + ''' ' +
                                                                                          ' AND ''' + TmpDate2 + TmpTime2 + ''' ' ;

  try
    with qrySummary do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' SELECT LST.ERROR_MACHINE_NM||''-''||LST.ERROR_CODE AS ERROR_DATA, ' +
                '        NVL(MAS.ERROR_NAME,''N/A'' ) AS ERROR_NAME, LST.ERROR_CNT ' +
                '   FROM ( SELECT CASE WHEN ERROR_MACHINE IN (31, 32, 33, 34, 35) THEN 3 ' +
                '                      WHEN ERROR_MACHINE IN (41, 42, 43, 44, 45) THEN 4 ' +
                '                      ELSE ERROR_MACHINE END AS ERROR_MACHINE, ' +
                '                 CASE WHEN ERROR_MACHINE < 30 THEN ''S/C#'' || TO_CHAR(ERROR_MACHINE) ' +
                '                      WHEN ERROR_MACHINE IN (31, 32, 33, 34, 35) THEN ''PLC#'' || TO_CHAR(ERROR_MACHINE - 30) ' +
                '                      WHEN ERROR_MACHINE IN (41, 42, 43, 44, 45) THEN ''EMS#'' || TO_CHAR(ERROR_MACHINE - 40) ' +
                '                      ELSE TO_CHAR(ERROR_MACHINE) END AS ERROR_MACHINE_NM, ' +
                '                 ERROR_CODE, COUNT(*) ERROR_CNT ' +
                '            FROM C_ERROR_L ' +
                '           WHERE ERROR_CODE <> ''0'' ' + WhereStr1 +
                '           GROUP BY ERROR_MACHINE, ERROR_CODE ' +
                '           ORDER BY ERROR_MACHINE, ERROR_CODE ' +
                '         ) LST, C_ERROR_D MAS ' +
                '   WHERE LST.ERROR_CODE = MAS.ERROR_CODE(+) ' +
                '     AND LST.ERROR_MACHINE = MAS.ERROR_MACHINE(+) ' + WhereStr2 +
                '   ORDER BY LST.ERROR_MACHINE_NM, LST.ERROR_CODE ' ;
      SQL.Text := StrSQL;
      Open;
    end;
  except
    on E: Exception do
    begin
      qrySummary.Close;
      InsertPGMHist('['+FormNo+']', 'E', 'DisplayChart', 'Inquiry', 'Exception Error', 'SQL', StrSQL, '', E.Message);
      TraceLogWrite('[550] procedure DisplayChart Fail || ERR['+E.Message+'], SQL['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// KeyPress
//==============================================================================
procedure TfrmU550.KeyPress(Sender: TObject; var Key: Char);
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
// cbKeyPress
//==============================================================================
procedure TfrmU550.cbKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
  begin
    fnCommandQuery;
  end else
  if (Key = #27) then
  begin
    (Sender as TComboBox).ItemIndex := 0;
    fnCommandQuery;
  end;
end;

//==============================================================================
// cbChange
//==============================================================================
procedure TfrmU550.cbChange(Sender: TObject);
begin
  fnCommandQuery;
end;

//==============================================================================
// DatePickerKeyPress
//==============================================================================
procedure TfrmU550.DatePickerKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
  begin
    fnCommandQuery;
  end else
  if (Key = #27) then
  begin
    Case (Sender as TDateTimePicker).Tag of
      0 : (Sender as TDateTimePicker).Date := Now;
      1 : (Sender as TDateTimePicker).Time := StrToTime('00:00:00.000');
      2 : (Sender as TDateTimePicker).Time := StrToTime('23:59:59.999');
    end;
  end;
end;

//==============================================================================
// sbtClearClick
//==============================================================================
procedure TfrmU550.sbtClearClick(Sender: TObject);
begin
  edtErrorCode.Text   := ''; // 에러코드
  cbMACHINE.ItemIndex := 0;   // 설비
  DatePicker1.Date    := Now;
  TimePicker1.Time    := StrToTime('00:00:00');
  DatePicker2.Date    := Now;
  TimePicker2.Time    := StrToTime('23:59:59');
  DatePicker1.SetFocus;
  fnCommandQuery;
end;

//==============================================================================
// edtRowHeightChange
//==============================================================================
procedure TfrmU550.edtRowHeightChange(Sender: TObject);
begin
  dgInfo.RowLines    := StrToIntDef((Sender as TEdit).Text, 0);
  dgSummary.RowLines := StrToIntDef((Sender as TEdit).Text, 0);
end;

//==============================================================================
// edtFontSizeChange
//==============================================================================
procedure TfrmU550.edtFontSizeChange(Sender: TObject);
begin
  dgInfo.Font.Size    := StrToIntDef((Sender as TEdit).Text, 11);
  dgSummary.Font.Size := StrToIntDef((Sender as TEdit).Text, 11);
end;

//==============================================================================
// dgInfoTitleClick
//==============================================================================
procedure TfrmU550.dgInfoTitleClick(Column: TColumnEh);
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
// Pnl_MainResize
//==============================================================================
procedure TfrmU550.Pnl_MainResize(Sender: TObject);
begin
  Pnl_Bottom.Height := (Pnl_Main.Height div 2) - 50;
end;

//==============================================================================
// chkGridMainClick
//==============================================================================
procedure TfrmU550.chkGridMainClick(Sender: TObject);
begin
  if (Sender as TCheckBox).Checked then
       chkGridSub.Checked := False
  else chkGridSub.Checked := True;
end;

//==============================================================================
// chkGridSubClick
//==============================================================================
procedure TfrmU550.chkGridSubClick(Sender: TObject);
begin
  if (Sender as TCheckBox).Checked then
       chkGridMain.Checked := False
  else chkGridMain.Checked := True;
end;

end.

