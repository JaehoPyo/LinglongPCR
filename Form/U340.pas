unit U340;

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
  TfrmU340 = class(TForm)
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
    PnlMonitoring: TPanel;
    Panel8: TPanel;
    sbtClear: TSpeedButton;
    PnlRowHeight: TPanel;
    PnlFontSize: TPanel;
    udRowHeight: TUpDown;
    edtRowHeight: TEdit;
    udFontSize: TUpDown;
    edtFontSize: TEdit;
    lblRowHeight: TLabel;
    lblFontSize: TLabel;
    Panel4: TPanel;
    Panel5: TPanel;
    dgInfo: TDBGridEh;
    qryStatus: TADOQuery;
    dsStatus: TDataSource;
    Pnl_Bottom: TPanel;
    Splitter3: TSplitter;
    chkGridMain: TCheckBox;
    Panel10: TPanel;
    LblStatus: TPanel;
    dgStatus: TDBGridEh;
    tmrQry: TTimer;
    Panel1: TPanel;
    LblStock: TPanel;
    chkGridSub: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtClearClick(Sender: TObject);
    procedure edtRowHeightChange(Sender: TObject);
    procedure edtFontSizeChange(Sender: TObject);
    procedure dgInfoTitleClick(Column: TColumnEh);
    procedure Pnl_MainResize(Sender: TObject);
    procedure chkGridMainClick(Sender: TObject);
    procedure chkGridSubClick(Sender: TObject);
    procedure tmrQryTimer(Sender: TObject);
    procedure dgInfoSelectionChanged(Sender: TObject);
    procedure dgStatusSelectionChanged(Sender: TObject);
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
    procedure fnCommandQuerySub ;
  end;
  procedure U340Create();

const
  FormNo ='340';
  FIdx   = 3;
  SIdx   = 4;

var
  frmU340: TfrmU340;
  SrtFlag : integer = 0 ;
  SelectIdx1  : integer = 0;
  bRecordCnt1 : integer = 0;
  aRecordCnt1 : integer = 0;
  SelectIdx2  : integer = 0;
  bRecordCnt2 : integer = 0;
  aRecordCnt2 : integer = 0;

implementation

uses Main ;

{$R *.dfm}

//==============================================================================
// U340Create
//==============================================================================
procedure U340Create();
begin
  if not Assigned(frmU340) then
  begin
    frmU340 := TfrmU340.Create(Application);
    with frmU340 do
    begin
      fnCommandStart;
      fnCommandLang;
    end;
  end;
  frmU340.Show;
end;

//==============================================================================
// fnWmMsgRecv
//==============================================================================
procedure TfrmU340.fnWmMsgRecv(var MSG: TMessage);
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
procedure TfrmU340.FormCreate(Sender: TObject);
begin
//
end;

//==============================================================================
// FormShow
//==============================================================================
procedure TfrmU340.FormShow(Sender: TObject);
begin
//
end;

//==============================================================================
// FormActivate
//==============================================================================
procedure TfrmU340.FormActivate(Sender: TObject);
begin
  MainDm.M_Info.ActiveFormID := '340';
  frmMain.LblMenu000.Caption := MainDm.M_Info.ActiveFormID + '. ' + getLangMenuString(MainDm.M_Info.ActiveFormID, frmMain.LblMenu000.Caption, MainDm.M_Info.LANG_TYPE, 'N');
  frmU340.Caption := MainDm.M_Info.ActiveFormName;
  frmMain.TabSetDisplay(frmU340, tsFormChange);
  fnCommandLang;
  fnWmMsgSend(StrToInt(menuGrade[FIdx][SIdx].Grade), 111);
  fnCommandQuery ;
  fnCommandQuerySub ;
  if not tmrQry.Enabled then tmrQry.Enabled := True;
end;

//==============================================================================
// FormDeactivate
//==============================================================================
procedure TfrmU340.FormDeactivate(Sender: TObject);
begin
  tmrQry.Enabled := False;
end;

//==============================================================================
// FormClose
//==============================================================================
procedure TfrmU340.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tmrQry.Enabled   := False;
  qryInfo.Active   := False;
  qryStatus.Active := False;

  Action := Cafree;
  try
    frmMain.TabSetDisplay(TForm(frmU340), tsDelete);
    frmU340 := Nil ;
  except
  end;
end;

//==============================================================================
// fnCommandStart [시작]
//==============================================================================
procedure TfrmU340.fnCommandStart;
begin
//
end;

//==============================================================================
// fnCommandOrder [지시]
//==============================================================================
procedure TfrmU340.fnCommandOrder  ;
begin
//
end;

//==============================================================================
// fnCommandAdd [신규]
//==============================================================================
procedure TfrmU340.fnCommandAdd  ;
begin
//
end;

//==============================================================================
// fnCommandDelete [삭제]
//==============================================================================
procedure TfrmU340.fnCommandDelete;
begin
//
end;

//==============================================================================
// fnCommandDelete [수정]
//==============================================================================
procedure TfrmU340.fnCommandUpdate;
begin
//
end;

//==============================================================================
// fnCommandExcel [엑셀]
//==============================================================================
procedure TfrmU340.fnCommandExcel;
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
      TmpGrid := dgStatus;
      tStr := '(Rack Usage Status)';
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
      TraceLogWrite('[340] procedure fnCommandExcel Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// fnCommandPrint [인쇄]
//==============================================================================
procedure TfrmU340.fnCommandPrint;
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
      TmpGrid := dgStatus;
      tStr := '(Rack Usage Status)';
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
      TraceLogWrite('[340] procedure fnCommandPrint Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// fnCommandQuery [조회]
//==============================================================================
procedure TfrmU340.fnCommandQuery;
var
  StrSQL : String;
begin
  bRecordCnt1 := aRecordCnt1;
  try
    try
      qryInfo.DisableControls;
      with qryInfo do
      begin
        Close;
        SQL.Clear;
        StrSQL := ' SELECT GT_MAT_CODE, MAX(GT_MAT_SPEC) AS GT_MAT_SPEC, ' +
                  '        VER_NO, COUNT(*) AS TOTAL, ' +
                  '        FN_TBM_MACHNO(GT_MAT_CODE) AS TBM_NO, ' +
                  '        FN_CUR_MACHNO(GT_MAT_CODE) AS CUR_NO, ' +
                  '        SUM(SC1) AS STC1_CNT, SUM(SC2) AS STC2_CNT, ' +
                  '        SUM(SC3) AS STC3_CNT, SUM(SC4) AS STC4_CNT ' +
                  '   FROM ( ' +
                  '         SELECT GT_MAT_CODE, GT_MAT_SPEC, VER_NO, ' +
                  '                DECODE(R.S, 1, 1, 0) SC1, DECODE(R.S, 2, 1, 0) SC2, ' +
                  '                DECODE(R.S, 3, 1, 0) SC3, DECODE(R.S, 4, 1, 0) SC4 ' +
                  '           FROM W_STOCK_I S, C_RACK_I R ' +
                  '          WHERE S.STORAGE_ID = R.STORAGE_ID ' +
                  '            AND S.RACK_NO = R.RACK_NO ' +
                  '            AND R.LUGG in (1, 2) ' +
                  '            AND R.STATUS = 0 ' +
                  '        ) ' +
                  '  GROUP BY GT_MAT_CODE, VER_NO ' +
                  '  ORDER BY GT_MAT_CODE, VER_NO ' ;
        SQL.Text := StrSQL;
        Open;

        aRecordCnt1 := qryInfo.RecordCount;
        if bRecordCnt1 <> aRecordCnt1 then
             dgInfo.SelectedRows.Clear
        else dgInfo.MoveBy(SelectIdx1-1);
      end;
    finally
      qryInfo.EnableControls;
    end;
  except
    on E : Exception do
    begin
      qryInfo.Close;
      InsertPGMHist('['+FormNo+']', 'E', 'fnCommandQuery', 'Inquiry', 'Exception Error', 'SQL', StrSQL, '', E.Message);
      TraceLogWrite('[340] procedure fnCommandQuery Fail || ERR['+E.Message+'], SQL['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// fnCommandClose [닫기]
//==============================================================================
procedure TfrmU340.fnCommandClose;
begin
//
end;

//==============================================================================
// fnCommandLang [언어]
//==============================================================================
procedure TfrmU340.fnCommandLang;
var
  i : integer;
begin
  try
    frmU340.Caption       := MainDm.M_Info.ActiveFormName;
    PnlMonitoring.Caption := getLangString(FormNo, 'pMONITORING', 'Monitoring'           , MainDm.M_Info.LANG_TYPE, 'N');
    lblRowHeight.Caption  := getLangString(FormNo, 'pROW_HEIGHT', 'Row Height'           , MainDm.M_Info.LANG_TYPE, 'N');
    lblFontSize.Caption   := getLangString(FormNo, 'pFONT_SIZE' , 'Font Size'            , MainDm.M_Info.LANG_TYPE, 'N');
    lblStock.Caption      := getLangString(FormNo, 'pSTOCK'     , '[ Stock Status ]'     , MainDm.M_Info.LANG_TYPE, 'N');
    lblStatus.Caption     := getLangString(FormNo, 'pRACK'      , '[ Rack Usage Status ]', MainDm.M_Info.LANG_TYPE, 'N');

    for i := 0 to dgStatus.Columns.Count-1 do
    begin
      dgStatus.Columns[i].Title.Caption := getLangString(FormNo, dgStatus.Columns[i].FieldName, dgStatus.Columns[i].Title.Caption, MainDm.M_Info.LANG_TYPE, 'N');

      if i <= dgInfo.Columns.Count-1 then
      begin
        dgInfo.Columns[i].Title.Caption := getLangString(FormNo, dgInfo.Columns[i].FieldName, dgInfo.Columns[i].Title.Caption, MainDm.M_Info.LANG_TYPE, 'N');
      end;
    end;
  except
    on E : Exception do
    begin
      InsertPGMHist('['+FormNo+']', 'E', 'fnCommandLang', 'Language', 'Exception Error', 'PGM', '', '', E.Message);
      TraceLogWrite('[340] procedure fnCommandLang || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// fnCommandQuerySub
//==============================================================================
procedure TfrmU340.fnCommandQuerySub;
var
  StrSQL : String;
begin
  bRecordCnt2 := aRecordCnt2;
  try
    try
      qryStatus.DisableControls;
      with qryStatus do
      begin
        Close;
        SQL.Clear;
        StrSQL := ' SELECT S, COUNT(*) AS CELL_TOT, ' +
                  '        100-TRUNC(SUM(CELL_CNT1) / SUM(CELL_TOT) * 100, 1) AS CELL_RATIO, ' +
                  '        SUM(CELL_CNT1)  AS CELL_CNT1, SUM(CELL_CNT2)  AS CELL_CNT2, ' +
                  '        SUM(CELL_CNT3)  AS CELL_CNT3, SUM(CELL_CNT4)  AS CELL_CNT4, ' +
                  '        SUM(CELL_CNT5)  AS CELL_CNT5, SUM(CELL_CNT6)  AS CELL_CNT6, ' +
                  '        SUM(CELL_CNT7)  AS CELL_CNT7, SUM(CELL_CNT8)  AS CELL_CNT8, ' +
                  '        SUM(CELL_CNT9)  AS CELL_CNT9, SUM(CELL_CNT10) AS CELL_CNT10, ' +
                  '        SUM(CELL_CNT11) AS CELL_CNT11 ' +
                  '   FROM ( ' +
                  '         SELECT S, 1 AS CELL_TOT, ' +
                  '               (CASE WHEN STATUS = ''0'' AND LUGG = ''0'' THEN 1 ELSE 0 END) AS CELL_CNT1, ' + // 빈셀
                  '               (CASE WHEN STATUS = ''0'' AND LUGG = ''1'' THEN 1 ELSE 0 END) AS CELL_CNT2, ' + // 제품
                  '               (CASE WHEN STATUS = ''0'' AND LUGG = ''2'' THEN 1 ELSE 0 END) AS CELL_CNT3, ' + // 파레트
                  '                DECODE(STATUS, ''1'', 1, 0) AS CELL_CNT4, ' +                                  // 입고중
                  '                DECODE(STATUS, ''2'', 1, 0) AS CELL_CNT5, ' +                                  // 출고중
                  '                DECODE(STATUS, ''3'', 1, 0) AS CELL_CNT6, ' +                                  // 예약
                  '                DECODE(STATUS, ''4'', 1, 0) AS CELL_CNT7, ' +                                  // 피킹
                  '                DECODE(STATUS, ''5'', 1, 0) AS CELL_CNT8, ' +                                  // 이중입고
                  '                DECODE(STATUS, ''6'', 1, 0) AS CELL_CNT9, ' +                                  // 공출고
                  '                DECODE(STATUS, ''8'', 1, 0) AS CELL_CNT10, ' +                                 // 금지
                  '                DECODE(STATUS, ''99'', 1, 0) AS CELL_CNT11 ' +                                 // 셀없음
                  '           FROM C_RACK_I ' +
                  '        ) ' +
                  '  GROUP BY S ' +
                  '  ORDER BY S ' ;
        SQL.Text := StrSQL;
        Open;

        aRecordCnt2 := qryStatus.RecordCount;
        if bRecordCnt2 <> aRecordCnt2 then
             dgStatus.SelectedRows.Clear
        else dgStatus.MoveBy(SelectIdx2-1);
      end;
    finally
      qryStatus.EnableControls;
    end;
  except
    on E: Exception do
    begin
      qryStatus.Close;
      InsertPGMHist('['+FormNo+']', 'E', 'fnCommandQuerySub', 'Inquiry', 'Exception Error', 'SQL', StrSQL, '', E.Message);
      TraceLogWrite('[340] procedure fnCommandQuerySub Fail || ERR['+E.Message+'], SQL['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// sbtClearClick
//==============================================================================
procedure TfrmU340.sbtClearClick(Sender: TObject);
begin
  dgInfo.SelectedRows.Clear;
  dgStatus.SelectedRows.Clear;
  SelectIdx1 := 0;
  SelectIdx2 := 0;
  fnCommandQuery ;
  fnCommandQuerySub ;
end;

//==============================================================================
// tmrQryTimer
//==============================================================================
procedure TfrmU340.tmrQryTimer(Sender: TObject);
begin
  try
    tmrQry.Enabled := False ;
    if m.ConChk then fnCommandQuery;
    if m.ConChk then fnCommandQuerySub;
  finally
    tmrQry.Enabled := True ;
  end;
end;

//==============================================================================
// edtRowHeightChange
//==============================================================================
procedure TfrmU340.edtRowHeightChange(Sender: TObject);
begin
  dgInfo.RowLines   := StrToIntDef((Sender as TEdit).Text, 0);
//  dgStatus.RowLines := StrToIntDef((Sender as TEdit).Text, 0);
end;

//==============================================================================
// edtFontSizeChange
//==============================================================================
procedure TfrmU340.edtFontSizeChange(Sender: TObject);
begin
  dgInfo.Font.Size   := StrToIntDef((Sender as TEdit).Text, 11);
//  dgStatus.Font.Size := StrToIntDef((Sender as TEdit).Text, 11);
end;

//==============================================================================
// dgInfoTitleClick
//==============================================================================
procedure TfrmU340.dgInfoTitleClick(Column: TColumnEh);
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
procedure TfrmU340.Pnl_MainResize(Sender: TObject);
begin
  Pnl_Bottom.Height := (Pnl_Main.Height div 2) - 130 ;
end;

//==============================================================================
// chkGridMainClick
//==============================================================================
procedure TfrmU340.chkGridMainClick(Sender: TObject);
begin
  if (Sender as TCheckBox).Checked then
       chkGridSub.Checked := False
  else chkGridSub.Checked := True;
end;

//==============================================================================
// chkGridSubClick
//==============================================================================
procedure TfrmU340.chkGridSubClick(Sender: TObject);
begin
  if (Sender as TCheckBox).Checked then
       chkGridMain.Checked := False
  else chkGridMain.Checked := True;
end;

//==============================================================================
// dgInfoSelectionChanged
//==============================================================================
procedure TfrmU340.dgInfoSelectionChanged(Sender: TObject);
begin
  if dgInfo.DataSource.DataSet.Active then
       SelectIdx1 := dgInfo.DataSource.DataSet.RecNo
  else SelectIdx1 := 0;
end;

//==============================================================================
// dgStatusSelectionChanged
//==============================================================================
procedure TfrmU340.dgStatusSelectionChanged(Sender: TObject);
begin
  if dgStatus.DataSource.DataSet.Active then
       SelectIdx2 := dgStatus.DataSource.DataSet.RecNo
  else SelectIdx2 := 0;
end;

end.

