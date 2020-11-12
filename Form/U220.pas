unit U220;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, d_MainDm, h_MainLib, h_ReferLib, StdCtrls, DB, ADODB,
  Grids, StrUtils, DBGrids, comobj, frxClass, frxDBSet, DBGridEhGrouping, EhLibADO,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh,DBGridEhImpExp,
  DBGridEh, Vcl.Mask, Vcl.DBCtrls, DBCtrlsEh, PrnDbgeh, Vcl.Buttons, Vcl.Menus,
  Vcl.Imaging.pngimage, Vcl.ComCtrls ;

type
  TfrmU220 = class(TForm)
    Pnl_Base: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Pnl_Main: TPanel;
    dgInfo: TDBGridEh;
    Pnl_Top: TPanel;
    Panel11: TPanel;
    PnlSearch: TPanel;
    lblCnt: TLabel;
    lblSearch: TLabel;
    Panel8: TPanel;
    sbtClear: TSpeedButton;
    Panel1: TPanel;
    DatePicker1: TDateTimePicker;
    TimePicker1: TDateTimePicker;
    Panel4: TPanel;
    Panel7: TPanel;
    Panel18: TPanel;
    DatePicker2: TDateTimePicker;
    TimePicker2: TDateTimePicker;
    edtMATSpec: TEdit;
    PnlMATCode: TPanel;
    lblMATCode: TLabel;
    edtMATCode: TEdit;
    PnlMATSpec: TPanel;
    lblMATSpec: TLabel;
    PnlBarcode: TPanel;
    lblBarcode: TLabel;
    PnlRowHeight: TPanel;
    lblRowHeight: TLabel;
    PnlFontSize: TPanel;
    lblFontSize: TLabel;
    udRowHeight: TUpDown;
    edtRowHeight: TEdit;
    udFontSize: TUpDown;
    edtFontSize: TEdit;
    Panel9: TPanel;
    lblHOGI: TLabel;
    Panel10: TPanel;
    lblLocation: TLabel;
    cbHogi: TComboBox;
    Panel20: TPanel;
    cbCBank: TComboBox;
    cbCBay: TComboBox;
    Panel21: TPanel;
    cbCLevel: TComboBox;
    Panel22: TPanel;
    Panel12: TPanel;
    lblVersion: TLabel;
    Panel16: TPanel;
    lblTBMNo: TLabel;
    edtTBM_NO: TEdit;
    edtVER_NO: TEdit;
    edtBCR_NO: TEdit;
    Panel14: TPanel;
    sbt_ITEM: TSpeedButton;
    PnlInDate: TPanel;
    lblInDate: TLabel;
    cbInDate: TCheckBox;
    qryInfo: TADOQuery;
    dsInfo: TDataSource;
    EhPrint: TPrintDBGridEh;
    qryTemp: TADOQuery;
    Panel5: TPanel;
    lblItem_Type: TLabel;
    cbItem_Type: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dgInfoTitleClick(Column: TColumnEh);
    procedure cbChange(Sender: TObject);
    procedure cbKeyPress(Sender: TObject; var Key: Char);
    procedure KeyPress(Sender: TObject; var Key: Char);
    procedure sbtClearClick(Sender: TObject);
    procedure sbt_ITEMClick(Sender: TObject);
    procedure cbInDateClick(Sender: TObject);
    procedure edtRowHeightChange(Sender: TObject);
    procedure edtFontSizeChange(Sender: TObject);
    procedure DatePickerKeyPress(Sender: TObject; var Key: Char);
    procedure dgInfoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
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
    procedure fnWmMsgRecv(var MSG: TMessage); message WM_USER;
    procedure Manual_Out_Reserved(S, RackNo, Code, Bcr: String);
    procedure ChangeComboLang;
  end;
  procedure U220Create();

Const
  FormNo ='220';
  FIdx   = 2;
  SIdx   = 2;

var
  frmU220: TfrmU220;
  SrtFlag : integer = 0 ;

implementation

uses Main, ItemSearch;

{$R *.dfm}

//==============================================================================
// U220Create
//==============================================================================
procedure U220Create();
begin
  if not Assigned(frmU220) then
  begin
    frmU220 := TfrmU220.Create(Application);
    with frmU220 do
    begin
      fnCommandStart;
      fnCommandLang;
    end;
  end;
  frmU220.Show;
end;

//==============================================================================
// fnWmMsgRecv
//==============================================================================
procedure TfrmU220.fnWmMsgRecv(var MSG: TMessage);
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
procedure TfrmU220.FormCreate(Sender: TObject);
begin
//
end;

//==============================================================================
// FormShow
//==============================================================================
procedure TfrmU220.FormShow(Sender: TObject);
begin
//
end;

//==============================================================================
// FormActivate
//==============================================================================
procedure TfrmU220.FormActivate(Sender: TObject);
begin
  MainDm.M_Info.ActiveFormID := '220';
  frmMain.LblMenu000.Caption := MainDm.M_Info.ActiveFormID + '. ' + getLangMenuString(MainDm.M_Info.ActiveFormID, frmMain.LblMenu000.Caption, MainDm.M_Info.LANG_TYPE, 'N');
  frmU220.Caption := MainDm.M_Info.ActiveFormName;
  frmMain.TabSetDisplay(frmU220, tsFormChange);
  fnCommandLang;
  fnWmMsgSend(StrToInt(menuGrade[FIdx][SIdx].Grade), 111);
  fnCommandQuery;
end;

//==============================================================================
// FormDeactivate
//==============================================================================
procedure TfrmU220.FormDeactivate(Sender: TObject);
begin
//
end;

//==============================================================================
// FormClose
//==============================================================================
procedure TfrmU220.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryInfo.Active  := False;
  qryTemp.Active  := False;

  Action := Cafree;
  try
    frmMain.TabSetDisplay(TForm(frmU220), tsDelete);
    frmU220 := Nil ;
  except
  end;
end;

//==============================================================================
// fnCommandStart [시작]
//==============================================================================
procedure TfrmU220.fnCommandStart;
begin
  DatePicker1.Date := Now-7;
  TimePicker1.Time := StrToTime('00:00:00.000');
  DatePicker2.Date := Now;
  TimePicker2.Time := StrToTime('23:59:59.999');
end;

//==============================================================================
// fnCommandOrder [지시]
//==============================================================================
procedure TfrmU220.fnCommandOrder;
var
  i : Integer;
  tmpCode : String;
begin
  if (not qryInfo.Active) or
     (dgInfo.SelectedRows.Count < 1) then
  begin
    MessageDlg('Please select a row. (Order)', mtConfirmation, [mbYes], 0);
    Exit ;
  end;

  if (qryInfo.FieldByName('SC_USED').AsString <> 'O') then
  begin
    MessageDlg('Stacker Crane'+qryInfo.FieldByName('S').AsString+' Unstoring prohibited (Order)', mtWarning, [mbYes], 0);
    Exit ;
  end;

  if dgInfo.SelectedRows.Count = 1 then
  begin
    tmpCode := UpperCase(qryInfo.FieldByName('GT_MAT_CODE').AsString) + ' / ' + qryInfo.FieldByName('LOCATION').AsString;
    if MessageDlg('Do you want to take out the product?' + #13#10 + #13#10 +
                  '['+tmpCode+']', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit ;
  end else
  begin
    if MessageDlg('Do you want to take out the product?' + #13#10 + #13#10 +
                  'Row Count='+IntToStr(dgInfo.SelectedRows.Count), mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit ;
  end;

  try
    if not MainDm.MainDatabase.InTransaction then MainDm.MainDatabase.BeginTrans;

    for i := 0 to (dgInfo.SelectedRows.Count - 1) do
    begin
      with dgInfo.DataSource.DataSet do
      begin
        GotoBookmark(Pointer(dgInfo.SelectedRows.Items[i]));
        Manual_Out_Reserved(qryInfo.FieldByName('S'          ).AsString,
                            qryInfo.FieldByName('RACK_NO'    ).AsString,
                            qryInfo.FieldByName('GT_MAT_CODE').AsString,
                            qryInfo.FieldByName('BCR_NO'     ).AsString);
      end;
    end;
    if MainDm.MainDatabase.InTransaction then MainDm.MainDatabase.CommitTrans;
  except
    on E : Exception do
    begin
      if MainDm.MainDatabase.InTransaction then MainDm.MainDatabase.RollbackTrans;
      InsertPGMHist('['+FormNo+']', 'E', 'fnCommandOrder', 'Order', 'Exception Error', 'PGM', '', '', E.Message);
      TraceLogWrite('[220] procedure fnCommandOrder Fail || ERR['+E.Message+']');
      MessageDlg('Unstoring Order Failed.' + #13#10 + #13#10 + '['+E.Message+']', mtWarning, [mbYes], 0) ;
    end;
  end;
  fnCommandQuery;
end;

//==============================================================================
// fnCommandAdd [신규]
//==============================================================================
procedure TfrmU220.fnCommandAdd  ;
begin
//
end;

//==============================================================================
// fnCommandDelete [삭제]
//==============================================================================
procedure TfrmU220.fnCommandDelete;
begin
//
end;

//==============================================================================
// fnCommandUpdate [수정]
//==============================================================================
procedure TfrmU220.fnCommandUpdate;
begin
//
end;

//==============================================================================
// fnCommandExcel [엑셀]
//==============================================================================
procedure TfrmU220.fnCommandExcel;
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
      TraceLogWrite('[220] procedure fnCommandExcel Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// fnCommandPrint [인쇄]
//==============================================================================
procedure TfrmU220.fnCommandPrint;
begin
  try
    if not qryInfo.Active then Exit;
    EhPrint.DBGridEh := dgInfo;
    EhPrint.PageHeader.LeftText.Clear;
    EhPrint.PageHeader.LeftText.Add(Copy(MainDm.M_Info.ActiveFormName, 6,
                                    Length(MainDm.M_Info.ActiveFormName)-5));
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
      TraceLogWrite('[220] procedure fnCommandPrint Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// fnCommandQuery [조회]
//==============================================================================
procedure TfrmU220.fnCommandQuery;
var
  WhereStr, StrSQL : String;
  TmpDate1, TmpDate2, TmpTime1, TmpTime2 : String;
begin
  WhereStr := '' ;

  // 재고타입
  if      (cbItem_Type.ItemIndex = 0 ) then
       WhereStr := WhereStr + ' And R.LUGG = 1 '
  else if (cbItem_Type.ItemIndex = 1 ) then
       WhereStr := WhereStr + ' And R.LUGG = 2 '
  else WhereStr := WhereStr + ' And R.LUGG in (1,2) ';

  // MAT코드
  if (Trim(edtMATCode.Text) <> '') then
    WhereStr := WhereStr + ' AND UPPER(GT_MAT_CODE) LIKE ' + QuotedStr('%'+UpperCase(edtMATCode.Text)+'%') ;

  // MAT사양
  if (Trim(edtMATSpec.Text) <> '') then
    WhereStr := WhereStr + ' AND UPPER(GT_MAT_SPEC) LIKE ' + QuotedStr('%'+UpperCase(edtMATSpec.Text)+'%');

  // VER No
  if (Trim(edtVER_NO.Text) <> '') then
    WhereStr := WhereStr + ' AND UPPER(VER_NO) LIKE ' + QuotedStr('%'+UpperCase(edtVER_NO.Text)+'%');

  // 바코드
  if (Trim(edtBCR_NO.Text) <> '') then
    WhereStr := WhereStr + ' AND UPPER(BCR_NO) LIKE ' + QuotedStr('%'+UpperCase(edtBCR_NO.Text)+'%');

  // TBM No
  if (Trim(edtTBM_NO.Text) <> '') then
    WhereStr := WhereStr + ' AND UPPER(MCH_NO) LIKE ' + QuotedStr('%'+UpperCase(edtTBM_NO.Text)+'%');

  // 적치호기
  if (cbHogi.ItemIndex > 0)  then
    WhereStr := WhereStr + ' AND R.S = ' + QuotedStr(IntToStr(cbHogi.ItemIndex));

  // 적치열
  if (cbCBank.ItemIndex > 0)  then
    WhereStr := WhereStr + ' AND R.Z = ' + QuotedStr(IntToStr(cbCBank.ItemIndex));

  // 적치연
  if (cbCBay.ItemIndex > 0)  then
    WhereStr := WhereStr + ' AND R.X = ' + QuotedStr(IntToStr(cbCBay.ItemIndex));

  // 적치단
  if (cbCLevel.ItemIndex > 0)  then
    WhereStr := WhereStr + ' AND R.Y = ' + QuotedStr(IntToStr(cbCLevel.ItemIndex));

  // 입고일시
  if not cbInDate.Checked then
  begin
    TmpDate1 := FormatDateTime('YYYY-MM-DD'   , DatePicker1.Date);
    TmpTime1 := FormatDateTime(' HH:NN:SS.ZZZ', TimePicker1.Time);

    TmpDate2 := FormatDateTime('YYYY-MM-DD'   , DatePicker2.Date);
    TmpTime2 := FormatDateTime(' HH:NN:SS.ZZZ', TimePicker2.Time);

    WhereStr := WhereStr + ' AND TO_CHAR(S.CREATE_DT, ''yyyy-mm-dd hh24:mi:ss'') BETWEEN ''' + TmpDate1 + TmpTime1 + ''' ' +
                                                                                   ' AND ''' + TmpDate2 + TmpTime2 + ''' ' ;
  end;

  try
    with qryInfo do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' SELECT S.*, R.S, R.Z, R.X, R.Y ' +
                '      , FN_GETRACK_STR(R.LUGG, R.STATUS) AS STATUS_DESC ' +
                '      , TRUNC(SYSDATE) - TRUNC(S.CREATE_DT) AS EXPIRY ' +
                '      , FN_GETLOC_STR(R.S, R.Z, R.X, R.Y, 1) AS LOCATION ' +
                '      , DECODE((SELECT NVL(CURR_VAL, 0) FROM C_PARAM_D ' +
                '                 WHERE PARAM_NAME = ''STC''||R.S||''_USE''), ''2'',''O'',''3'',''O'',''X'') as SC_USED ' +
                '      , FN_GETENTERTYPE(S.ENTER_TYPE) AS ENTER_TYPE_DESC ' +
                '      , CASE WHEN TRUNC(SYSDATE) - TRUNC(S.CREATE_DT) > FN_GETPARAMDEFINE(''EXPIRY_DATE'') THEN 1 ELSE 0 END EXPIRY_CHECK ' +
                '   FROM W_STOCK_I S, C_RACK_I R ' +
                '  WHERE S.RACK_NO = R.RACK_NO   ' +
                '    AND R.STATUS = 0 ' + WhereStr +
                '  ORDER BY S.CREATE_DT ' ;
      SQL.Text := StrSQL;
      Open;
      lblCnt.Caption := '('+FormatFloat('###,###,##0',RecordCount)+')';
    end;
  except
    on E : Exception do
    begin
      qryInfo.Close;
      InsertPGMHist('['+FormNo+']', 'E', 'fnCommandQuery', 'Inquiry', 'Exception Error', 'SQL', StrSQL, '', E.Message);
      TraceLogWrite('[220] procedure fnCommandQuery Fail || ERR['+E.Message+'], SQL['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// fnCommandClose [닫기]
//==============================================================================
procedure TfrmU220.fnCommandClose;
begin
//
end;

//==============================================================================
// fnCommandLang [언어]
//==============================================================================
procedure TfrmU220.fnCommandLang;
var
  i : integer;
  cbIndex : Array [0..4] of Integer;
begin
  try
    frmU220.Caption      := MainDm.M_Info.ActiveFormName;
    lblSearch.Caption    := getLangString(FormNo, 'pSEARCH'    , 'Search'    , MainDm.M_Info.LANG_TYPE, 'N');
    lblInDate.Caption    := getLangString(FormNo, 'pIN_DATE'   , 'In Date'   , MainDm.M_Info.LANG_TYPE, 'N');
    cbInDate.Caption     := getLangString(FormNo, 'cbALL'      , 'ALL'       , MainDm.M_Info.LANG_TYPE, 'N');
    lblMATCode.Caption   := getLangString(FormNo, 'GT_MAT_CODE', 'MAT Code'  , MainDm.M_Info.LANG_TYPE, 'N');
    lblMATSpec.Caption   := getLangString(FormNo, 'GT_MAT_SPEC', 'MAT Spec'  , MainDm.M_Info.LANG_TYPE, 'N');
    lblVersion.Caption   := getLangString(FormNo, 'pVER_NO'    , 'Ver No'    , MainDm.M_Info.LANG_TYPE, 'N');
    lblBarcode.Caption   := getLangString(FormNo, 'BCR_NO'     , 'Barcode'   , MainDm.M_Info.LANG_TYPE, 'N');
    lblTBMNo.Caption     := getLangString(FormNo, 'MCH_NO'     , 'TBM No'    , MainDm.M_Info.LANG_TYPE, 'N');
    lblITEM_TYPE.Caption := getLangString(FormNo, 'pITEM_TYPE' , 'Item Type' , MainDm.M_Info.LANG_TYPE, 'N');
    lblHOGI.Caption      := getLangString(FormNo, 'pHOGI'      , 'SC'        , MainDm.M_Info.LANG_TYPE, 'N');
    lblLocation.Caption  := getLangString(FormNo, 'LOCATION'   , 'Location'  , MainDm.M_Info.LANG_TYPE, 'N');
    lblRowHeight.Caption := getLangString(FormNo, 'pROW_HEIGHT', 'Row Height', MainDm.M_Info.LANG_TYPE, 'N');
    lblFontSize.Caption  := getLangString(FormNo, 'pFONT_SIZE' , 'Font Size' , MainDm.M_Info.LANG_TYPE, 'N');

    // 현재 선택된 아이템 저장
    cbIndex[0] := cbHOGI.ItemIndex;
    cbIndex[1] := cbCBank.ItemIndex;
    cbIndex[2] := cbCBay.ItemIndex;
    cbIndex[3] := cbCLevel.ItemIndex;
    cbIndex[4] := cbItem_Type.ItemIndex;

    // 콤보박스 아이템 언어 변경
    ChangeComboLang;

    // 언어 변경 후 복원
    cbHogi.ItemIndex      := cbIndex[0];
    cbCBank.ItemIndex     := cbIndex[1];
    cbCBay.ItemIndex      := cbIndex[2];
    cbCLevel.ItemIndex    := cbIndex[3];
    cbItem_Type.ItemIndex := cbIndex[4];

    for i := 0 to dgInfo.Columns.Count-1 do
    begin
      if not dgInfo.Columns[i].Visible then Continue;
      dgInfo.Columns[i].Title.Caption  := getLangString(FormNo, dgInfo.Columns[i].FieldName, dgInfo.Columns[i].Title.Caption, MainDm.M_Info.LANG_TYPE, 'N');
    end;
  except
    on E : Exception do
    begin
      InsertPGMHist('['+FormNo+']', 'E', 'fnCommandLang', 'Language', 'Exception Error', 'PGM', '', '', E.Message);
      TraceLogWrite('[220] procedure fnCommandLang Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// Manual_Out_Reserved -> 랙 예약 상태로 변경 (작업생성은 PD_USERROUTINE300에서 실행)
//==============================================================================
procedure TfrmU220.Manual_Out_Reserved(S, RackNo, Code, Bcr: String);
var
  ExecNo : integer;
  StrSQL : String;
begin
  try
    with qryTemp do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' UPDATE C_RACK_I ' +
                '    SET STATUS  = ''3'' ' +
                '  WHERE (SELECT NVL(CURR_VAL, 0) ' +
                '           FROM C_PARAM_D ' +
                '          WHERE PARAM_NAME = ''STC' + Trim(S) + '_USE'') IN (2, 3) ' +
                '    AND RACK_NO = ' + QuotedStr(RackNo) ;
      SQL.Text := StrSQL;
      ExecNo := ExecSQL;
      if ExecNo = 1 then
      begin
        InsertPGMHist('['+FormNo+']', 'N', 'Manual_Out_Reserved', 'Order', 'Loc['+RackNo+'], Code['+Code+'], Bcr['+Bcr+']', 'SQL', StrSQL, '', '');
      end else
      begin
        InsertPGMHist('['+FormNo+']', 'E', 'Manual_Out_Reserved', 'Order', 'Loc['+RackNo+'], Code['+Code+'], Bcr['+Bcr+']', 'SQL', StrSQL, '', 'Stacker Crane'+S+' Unstoring Prohibition');
      end;
      Close;
    end;
  except
    on E : Exception do
    begin
      InsertPGMHist('['+FormNo+']', 'E', 'Manual_Out_Reserved', '', 'Exception Error', 'SQL', StrSQL, '', E.Message);
      TraceLogWrite('[220] procedure Manual_Out_Reserved || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// KeyPress
//==============================================================================
procedure TfrmU220.KeyPress(Sender: TObject; var Key: Char);
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
// cbKeyPress
//==============================================================================
procedure TfrmU220.cbKeyPress(Sender: TObject; var Key: Char);
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
procedure TfrmU220.cbChange(Sender: TObject);
begin
  fnCommandQuery;
end;

//==============================================================================
// DatePickerKeyPress
//==============================================================================
procedure TfrmU220.DatePickerKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
  begin
    fnCommandQuery;
  end else
  if (Key = #27) then
  begin
    Case (Sender as TDateTimePicker).Tag of
      0 : (Sender as TDateTimePicker).Date := Now - 7;
      1 : (Sender as TDateTimePicker).Date := Now;
      2 : (Sender as TDateTimePicker).Time := StrToTime('00:00:00.000');
      3 : (Sender as TDateTimePicker).Time := StrToTime('23:59:59.999');
    end;
  end;
end;

//==============================================================================
// cbInDateClick
//==============================================================================
procedure TfrmU220.cbInDateClick(Sender: TObject);
begin
  fnCommandQuery;
end;

//==============================================================================
// sbtClearClick
//==============================================================================
procedure TfrmU220.sbtClearClick(Sender: TObject);
begin
  dginfo.SelectedRows.Clear;
  edtMATCode.Text       := ''; // MAT코드
  edtMATSpec.Text       := ''; // MAT사양
  edtVER_NO.Text        := ''; // 버전
  edtBCR_NO.Text        := ''; // 바코드
  edtTBM_NO.Text        := ''; // TBM No
  cbITEM_TYPE.ItemIndex := 0;
  cbHogi.ItemIndex      := 0;  // 적치호기
  cbCBank.ItemIndex     := 0;  // 적치 열
  cbCBay.ItemIndex      := 0;  // 적치 연
  cbCLEvel.ItemIndex    := 0;  // 적치 단
  DatePicker1.Date      := Now-7;
  TimePicker1.Time      := StrToTime('00:00:00');
  DatePicker2.Date      := Now;
  TimePicker2.Time      := StrToTime('23:59:59');
  DatePicker1.SetFocus;
  if cbInDate.Checked then fnCommandQuery;
  cbInDate.Checked := True;
end;

//==============================================================================
// sbt_ITEMClick [품목찾기]
//==============================================================================
procedure TfrmU220.sbt_ITEMClick(Sender: TObject);
begin
  try
    frmItemSearch := TfrmItemSearch.Create(Application);
    frmItemSearch.edtCode.Text := edtMATCode.Text;
    frmItemSearch.ShowModal ;

    if m.Popup_ItemInfo.ResultCd = 'OK' then
    begin
      edtMATCode.Text := m.Popup_ItemInfo.DATA01;
      edtMATSpec.Text := m.Popup_ItemInfo.DATA02;
      edtMATCode.SetFocus;
      fnCommandQuery;
    end;
  except
    on E : Exception do
    begin
      InsertPGMHist('['+FormNo+']', 'E', 'sbt_ITEMClick', '', 'Exception Error', 'PGM', '', '', E.Message);
      TraceLogWrite('[220] procedure sbt_ITEMClick || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// ChangeComboLang ( 언어에 따라 콤보 박스 안의 내용을 바꿈)
//==============================================================================
procedure TfrmU220.ChangeComboLang;
var
  i : Integer;
  tStr : String;
begin
  try
    tStr := getLangString(FormNo, 'cbALL', 'ALL', MainDm.M_Info.LANG_TYPE, 'N');

    // 재고타입
    cbItem_Type.Items.Clear();
    cbItem_Type.Items.Add('Tire');
    cbItem_Type.Items.Add('Pallet');
    cbItem_Type.Items.Add(tStr);
    cbItem_Type.ItemIndex := 0;

    // 적치호기
    cbHOGI.Items.Clear();
    cbHOGI.Items.Add(tStr);
    cbHOGI.Items.Add(getLangString(FormNo, 'cbHOGI_1', 'Stacker Crane 1', MainDm.M_Info.LANG_TYPE, 'N'));
    cbHOGI.Items.Add(getLangString(FormNo, 'cbHOGI_2', 'Stacker Crane 2', MainDm.M_Info.LANG_TYPE, 'N'));
    cbHOGI.Items.Add(getLangString(FormNo, 'cbHOGI_3', 'Stacker Crane 3', MainDm.M_Info.LANG_TYPE, 'N'));
    cbHOGI.Items.Add(getLangString(FormNo, 'cbHOGI_4', 'Stacker Crane 4', MainDm.M_Info.LANG_TYPE, 'N'));
    cbHOGI.Items.Add(getLangString(FormNo, 'cbHOGI_5', 'Stacker Crane 5', MainDm.M_Info.LANG_TYPE, 'N'));
    cbHOGI.Items.Add(getLangString(FormNo, 'cbHOGI_7', 'Stacker Crane 7', MainDm.M_Info.LANG_TYPE, 'N'));
    cbHOGI.Items.Add(getLangString(FormNo, 'cbHOGI_8', 'Stacker Crane 8', MainDm.M_Info.LANG_TYPE, 'N'));
    cbHOGI.Items.Add(getLangString(FormNo, 'cbHOGI_9', 'Stacker Crane 9', MainDm.M_Info.LANG_TYPE, 'N'));
    cbHOGI.Items.Add(getLangString(FormNo, 'cbHOGI_10', 'Stacker Crane 10', MainDm.M_Info.LANG_TYPE, 'N'));
    cbHOGI.Items.Add(getLangString(FormNo, 'cbHOGI_11', 'Stacker Crane 11', MainDm.M_Info.LANG_TYPE, 'N'));
    cbHOGI.ItemIndex := 0;

    // 열, 연, 단
    cbCBank.Items.Clear();
    cbCBank.Items.Add(tStr);
    cbCBay.Items.Clear();
    cbCBay.Items.Add(tStr);
    cbCLevel.Items.Clear();
    cbCLevel.Items.Add(tStr);
    for i := 1 to CELL_MAX_BAY do
    begin
     if i <= CELL_MAX_BANK  then cbCBank.Items.Add(FormatFloat('0', i));
     if i <= CELL_MAX_BAY   then cbCBay.Items.Add(FormatFloat('000', i));
     if i <= CELL_MAX_LEVEL then cbCLevel.Items.Add(FormatFloat('00', i));
    end;
  except
    on E : Exception do
    begin
      InsertPGMHist('['+FormNo+']', 'E', 'ChangeComboLang', '', 'Exception Error', 'PGM', '', '', E.Message);
      TraceLogWrite('[220] procedure ChangeComboLang || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// edtRowHeightChange
//==============================================================================
procedure TfrmU220.edtRowHeightChange(Sender: TObject);
begin
  dgInfo.RowLines := StrToIntDef((Sender as TEdit).Text,0);
end;

//==============================================================================
// edtFontSizeChange
//==============================================================================
procedure TfrmU220.edtFontSizeChange(Sender: TObject);
begin
  dgInfo.Font.Size := StrToIntDef((Sender as TEdit).Text,11);
end;

//==============================================================================
// dgInfoTitleClick
//==============================================================================
procedure TfrmU220.dgInfoTitleClick(Column: TColumnEh);
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
// dgInfoDrawColumnCell
//==============================================================================
procedure TfrmU220.dgInfoDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin

  if (Column.FieldName <> 'EXPIRY') then Exit;

  if (Column.Field.DataSet.FieldByName('EXPIRY_CHECK').AsInteger = 1) then
  begin
    dgInfo.Canvas.Font.Color := clRed;
    dgInfo.Canvas.Font.Style := [fsBold];
  end
  else
  begin
    dgInfo.Canvas.Font.Color := clBlack;
    dgInfo.Canvas.Font.Style := [];
  end;
  dgInfo.DefaultDrawColumnCell(rect, datacol, column, state);

end;


end.




