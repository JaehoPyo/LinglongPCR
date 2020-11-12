unit U520;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, d_MainDm, h_MainLib, h_ReferLib, StdCtrls, DB, ADODB,
  Grids, StrUtils, DBGrids, comobj, frxClass, frxDBSet, DBGridEhGrouping, EhLibADO,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh,DBGridEhImpExp,
  DBGridEh, Vcl.Mask, Vcl.DBCtrls, DBCtrlsEh, PrnDbgeh, Vcl.Buttons, Vcl.Menus,
  Vcl.Imaging.pngimage, Vcl.ComCtrls ;

type
  TfrmU520 = class(TForm)
    dsInfo: TDataSource;
    qryInfo: TADOQuery;
    shpB: TShape;
    shpL: TShape;
    shpR: TShape;
    shpT: TShape;
    EhPrint: TPrintDBGridEh;
    Pnl_Base: TPanel;
    Pnl_Main: TPanel;
    Panel26: TPanel;
    Panel27: TPanel;
    dgInfo: TDBGridEh;
    Pnl_Top: TPanel;
    Panel11: TPanel;
    PnlSearch: TPanel;
    lblCnt: TLabel;
    lblSearch: TLabel;
    Panel8: TPanel;
    sbtClear: TSpeedButton;
    Panel6: TPanel;
    DatePicker1: TDateTimePicker;
    TimePicker1: TDateTimePicker;
    Panel3: TPanel;
    PnlCompleteDate: TPanel;
    lblCompleteDate: TLabel;
    Panel2: TPanel;
    Panel18: TPanel;
    DatePicker2: TDateTimePicker;
    TimePicker2: TDateTimePicker;
    edtMATSpec: TEdit;
    PnlMATCode: TPanel;
    lblMATCode: TLabel;
    edtMATCode: TEdit;
    PnlMATSpec: TPanel;
    lblMATSpec: TLabel;
    PnlOrderKind: TPanel;
    lblOrderKind: TLabel;
    PnlBarcode: TPanel;
    lblBarcode: TLabel;
    cbKIND_DESC: TComboBox;
    PnlRowHeight: TPanel;
    lblRowHeight: TLabel;
    PnlFontSize: TPanel;
    lblFontSize: TLabel;
    udRowHeight: TUpDown;
    edtRowHeight: TEdit;
    udFontSize: TUpDown;
    edtFontSize: TEdit;
    Panel4: TPanel;
    lblHOGI: TLabel;
    Panel7: TPanel;
    lblLocation: TLabel;
    cbHogi: TComboBox;
    Panel20: TPanel;
    cbCBank: TComboBox;
    cbCBay: TComboBox;
    Panel21: TPanel;
    cbCLevel: TComboBox;
    Panel22: TPanel;
    Panel5: TPanel;
    lblVersion: TLabel;
    Panel16: TPanel;
    lblCureNo: TLabel;
    edtCURE_NO: TEdit;
    edtVER_NO: TEdit;
    edtBCR_NO: TEdit;
    Panel14: TPanel;
    sbt_ITEM: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtClearClick(Sender: TObject);
    procedure cbChange(Sender: TObject);
    procedure cbKeyPress(Sender: TObject; var Key: Char);
    procedure KeyPress(Sender: TObject; var Key: Char);
    procedure sbt_ITEMClick(Sender: TObject);
    procedure edtRowHeightChange(Sender: TObject);
    procedure edtFontSizeChange(Sender: TObject);
    procedure dgInfoTitleClick(Column: TColumnEh);
    procedure DatePickerKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure ChangeComboLang;
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
  procedure U520Create();

const
  FormNo ='520';
  FIdx   = 5;
  SIdx   = 2;

var
  frmU520: TfrmU520;
  SrtFlag : integer = 0 ;

implementation

uses Main, ItemSearch ;

{$R *.dfm}

//==============================================================================
// U520Create
//==============================================================================
procedure U520Create();
begin
  if not Assigned(frmU520) then
  begin
    frmU520 := TfrmU520.Create(Application);
    with frmU520 do
    begin
      fnCommandStart;
      fnCommandLang;
    end;
  end;
  frmU520.Show;
end;

//==============================================================================
// fnWmMsgRecv
//==============================================================================
procedure TfrmU520.fnWmMsgRecv(var MSG: TMessage);
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
procedure TfrmU520.FormCreate(Sender: TObject);
begin
//
end;

//==============================================================================
// FormShow
//==============================================================================
procedure TfrmU520.FormShow(Sender: TObject);
begin
//
end;

//==============================================================================
// FormActivate
//==============================================================================
procedure TfrmU520.FormActivate(Sender: TObject);
begin
  MainDm.M_Info.ActiveFormID := '520';
  frmMain.LblMenu000.Caption := MainDm.M_Info.ActiveFormID + '. ' + getLangMenuString(MainDm.M_Info.ActiveFormID, frmMain.LblMenu000.Caption, MainDm.M_Info.LANG_TYPE, 'N');
  frmU520.Caption := MainDm.M_Info.ActiveFormName;
  frmMain.TabSetDisplay(frmU520, tsFormChange);
  fnCommandLang;
  fnWmMsgSend(StrToInt(menuGrade[FIdx][SIdx].Grade), 111);
end;

//==============================================================================
// FormDeactivate
//==============================================================================
procedure TfrmU520.FormDeactivate(Sender: TObject);
begin
//
end;

//==============================================================================
// FormClose
//==============================================================================
procedure TfrmU520.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryInfo.Active := False;

  Action := Cafree;
  try
    frmMain.TabSetDisplay(TForm(frmU520), tsDelete);
    frmU520 := Nil ;
  except
  end;
end;

//==============================================================================
// fnCommandStart [시작]
//==============================================================================
procedure TfrmU520.fnCommandStart;
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
procedure TfrmU520.fnCommandOrder  ;
begin
//
end;

//==============================================================================
// fnCommandAdd [신규]
//==============================================================================
procedure TfrmU520.fnCommandAdd  ;
begin
//
end;

//==============================================================================
// fnCommandDelete [삭제]
//==============================================================================
procedure TfrmU520.fnCommandDelete;
begin
//
end;

//==============================================================================
// fnCommandDelete [수정]
//==============================================================================
procedure TfrmU520.fnCommandUpdate;
begin
//
end;

//==============================================================================
// fnCommandExcel [엑셀]
//==============================================================================
procedure TfrmU520.fnCommandExcel;
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
      TraceLogWrite('[520] procedure fnCommandExcel Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// fnCommandPrint [인쇄]
//==============================================================================
procedure TfrmU520.fnCommandPrint;
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
      TraceLogWrite('[520] procedure fnCommandPrint Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// fnCommandQuery [조회]
//==============================================================================
procedure TfrmU520.fnCommandQuery;
var
  WhereStr, StrSQL : String;
  TmpDate1, TmpDate2, TmpTime1, TmpTime2 : String;
begin
  WhereStr := '' ;

  // MAT코드
  if (Trim(edtMATCode.Text) <> '') then
    WhereStr := WhereStr + ' AND UPPER(GT_MAT_CODE) LIKE ' + QuotedStr('%'+UpperCase(edtMATCode.Text)+'%') ;

  // MAT사양
  if (Trim(edtMATSpec.Text) <> '') then
    WhereStr := WhereStr + ' AND UPPER(GT_MAT_SPEC) LIKE ' + QuotedStr('%'+UpperCase(edtMATSpec.Text)+'%');

  //  지시구분
  if (cbKIND_DESC.ItemIndex > 0 ) then
    WhereStr := WhereStr + ' AND KIND_DESC LIKE ' + QuotedStr('%'+cbKIND_DESC.Text+'%');

  // 바코드
  if (Trim(edtBCR_NO.Text) <> '') then
    WhereStr := WhereStr + ' AND UPPER(BCR_NO) LIKE ' + QuotedStr('%'+UpperCase(edtBCR_NO.Text)+'%');

  // VER No
  if (Trim(edtVER_NO.Text) <> '') then
    WhereStr := WhereStr + ' AND UPPER(VER_NO) LIKE ' + QuotedStr('%'+UpperCase(edtVER_NO.Text)+'%');

  // TBM No
  if (Trim(edtCURE_NO.Text) <> '') then
    WhereStr := WhereStr + ' AND UPPER(CURE_NO) LIKE ' + QuotedStr('%'+UpperCase(edtCURE_NO.Text)+'%');

  // 적치호기
  if (cbHogi.ItemIndex > 0)  then
    WhereStr := WhereStr + ' AND SS = ' + QuotedStr(IntToStr(cbHogi.ItemIndex));

  // 적치열
  if (cbCBank.ItemIndex > 0)  then
    WhereStr := WhereStr + ' AND SZ = ' + QuotedStr(IntToStr(cbCBank.ItemIndex));

  // 적치연
  if (cbCBay.ItemIndex > 0)  then
    WhereStr := WhereStr + ' AND SX = ' + QuotedStr(IntToStr(cbCBay.ItemIndex));

  // 적치단
  if (cbCLevel.ItemIndex > 0)  then
    WhereStr := WhereStr + ' AND SY = ' + QuotedStr(IntToStr(cbCLevel.ItemIndex));

  // 완료일시
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
      StrSQL := ' SELECT * ' + #13#10 +
                '   FROM VW_JOBORDER_H ' + #13#10 +
                '  WHERE SUBSTR(ORDER_TYPE, 1, 1) In ( 2, 7 ) ' + #13#10 + WhereStr + #13#10 +
                '  ORDER BY COMPLETE_DATETIME, ORDER_ID, JOB_NO ' ;
      SQL.Text := StrSQL;
      Open;
      lblCnt.Caption := '('+FormatFloat('###,###,##0',RecordCount)+')';
    end;
  except
    on E : Exception do
    begin
      qryInfo.Close;
      InsertPGMHist('['+FormNo+']', 'E', 'fnCommandQuery', 'Inquiry', 'Exception Error', 'SQL', StrSQL, '', E.Message);
      TraceLogWrite('[520] procedure fnCommandQuery Fail || ERR['+E.Message+'], SQL['+StrSQL+']');
    end;
  end ;
end;

//==============================================================================
// fnCommandClose [닫기]
//==============================================================================
procedure TfrmU520.fnCommandClose;
begin
//
end;

//==============================================================================
// fnCommandLang [언어]
//==============================================================================
procedure TfrmU520.fnCommandLang;
var
  i : integer;
  cbIndex : Array [0..5] of Integer;
begin
  try
    frmU520.Caption         := MainDm.M_Info.ActiveFormName;
    lblSearch.Caption       := getLangString(FormNo, 'pSEARCH'          , 'Search'       , MainDm.M_Info.LANG_TYPE, 'N');
    lblCompleteDate.Caption := getLangString(FormNo, 'COMPLETE_DATETIME', 'Complete Date', MainDm.M_Info.LANG_TYPE, 'N');
    lblMATCode.Caption      := getLangString(FormNo, 'GT_MAT_CODE'      , 'MAT Code'     , MainDm.M_Info.LANG_TYPE, 'N');
    lblMATSpec.Caption      := getLangString(FormNo, 'GT_MAT_SPEC'      , 'MAT Spec'     , MainDm.M_Info.LANG_TYPE, 'N');
    lblOrderKind.Caption    := getLangString(FormNo, 'pORDER_KIND'      , 'Order Kind'   , MainDm.M_Info.LANG_TYPE, 'N');
    lblBarcode.Caption      := getLangString(FormNo, 'BCR_NO'           , 'Barcode'      , MainDm.M_Info.LANG_TYPE, 'N');
    lblVersion.Caption      := getLangString(FormNo, 'pVER_NO'          , 'Ver No'       , MainDm.M_Info.LANG_TYPE, 'N');
    lblCureNo.Caption       := getLangString(FormNo, 'CURE_NO'          , 'Cure No'      , MainDm.M_Info.LANG_TYPE, 'N');
    lblHOGI.Caption         := getLangString(FormNo, 'pHOGI'            , 'SC'           , MainDm.M_Info.LANG_TYPE, 'N');
    lblLocation.Caption     := getLangString(FormNo, 'pLocation'        , 'Location'     , MainDm.M_Info.LANG_TYPE, 'N');
    lblRowHeight.Caption    := getLangString(FormNo, 'pROW_HEIGHT'      , 'Row Height'   , MainDm.M_Info.LANG_TYPE, 'N');
    lblFontSize.Caption     := getLangString(FormNo, 'pFONT_SIZE'       , 'Font Size'    , MainDm.M_Info.LANG_TYPE, 'N');

    // 콤보박스 아이템 설정
    // 현재 선택된 아이템 저장
    cbIndex[0] := cbKIND_DESC.ItemIndex;
    cbIndex[1] := cbHOGI.ItemIndex;
    cbIndex[2] := cbCBank.ItemIndex;
    cbIndex[3] := cbCBay.ItemIndex;
    cbIndex[4] := cbCLevel.ItemIndex;

    // 콤보박스 아이템 언어 변경
    ChangeComboLang;

    // 언어 변경 후 복원
    cbKIND_DESC.ItemIndex := cbIndex[0];
    cbHogi.ItemIndex      := cbIndex[1];
    cbCBank.ItemIndex     := cbIndex[2];
    cbCBay.ItemIndex      := cbIndex[3];
    cbCLevel.ItemIndex    := cbIndex[4];

    for i := 0 to dgInfo.Columns.Count-1 do
    begin
      dgInfo.Columns[i].Title.Caption := getLangString(FormNo, dgInfo.Columns[i].FieldName, dgInfo.Columns[i].Title.Caption, MainDm.M_Info.LANG_TYPE, 'N');
    end;
  except
    on E : Exception do
    begin
      InsertPGMHist('['+FormNo+']', 'E', 'fnCommandLang', 'Language', 'Exception Error', 'PGM', '', '', E.Message);
      TraceLogWrite('[520] procedure fnCommandLang || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// KeyPress
//==============================================================================
procedure TfrmU520.KeyPress(Sender: TObject; var Key: Char);
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
procedure TfrmU520.cbKeyPress(Sender: TObject; var Key: Char);
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
procedure TfrmU520.cbChange(Sender: TObject);
begin
  fnCommandQuery;
end;

//==============================================================================
// DatePickerKeyPress
//==============================================================================
procedure TfrmU520.DatePickerKeyPress(Sender: TObject; var Key: Char);
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
procedure TfrmU520.sbtClearClick(Sender: TObject);
begin
  edtMATCode.Text       := ''; // MAT코드
  edtMATSpec.Text       := ''; // MAT사양
  cbKIND_DESC.ItemIndex := 0;  // 지시구분
  edtBCR_NO.Text        := ''; // 바코드
  edtVER_NO.Text        := ''; // 버전 No
  edtCURE_NO.Text       := ''; // Cure No
  cbHogi.ItemIndex      := 0;  // 적치호기
  cbCBank.ItemIndex     := 0;  // 적치 열
  cbCBay.ItemIndex      := 0;  // 적치 연
  cbCLEvel.ItemIndex    := 0;  // 적치 단
  DatePicker1.Date      := Now;
  TimePicker1.Time      := StrToTime('00:00:00');
  DatePicker2.Date      := Now;
  TimePicker2.Time      := StrToTime('23:59:59');
  DatePicker1.SetFocus;
  fnCommandQuery;
end;

//==============================================================================
// sbt_ITEMClick [품목찾기]
//==============================================================================
procedure TfrmU520.sbt_ITEMClick(Sender: TObject);
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
      TraceLogWrite('[520] procedure sbt_ITEMClick || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// edtRowHeightChange
//==============================================================================
procedure TfrmU520.edtRowHeightChange(Sender: TObject);
begin
  dgInfo.RowLines := StrToIntDef((Sender as TEdit).Text,0);
end;

//==============================================================================
// edtFontSizeChange
//==============================================================================
procedure TfrmU520.edtFontSizeChange(Sender: TObject);
begin
  dgInfo.Font.Size := StrToIntDef((Sender as TEdit).Text,11);
end;

//==============================================================================
// dgInfoTitleClick
//==============================================================================
procedure TfrmU520.dgInfoTitleClick(Column: TColumnEh);
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
// ChangeComboLang ( 언어에 따라 콤보 박스 안의 내용을 바꿈)
//==============================================================================
procedure TfrmU520.ChangeComboLang;
var
  i : Integer;
  tStr : String;
begin
  try
    tStr := getLangString(FormNo, 'cbALL', 'ALL', MainDm.M_Info.LANG_TYPE, 'N');
    // 지시구분
    cbKIND_DESC.Items.Clear();
    cbKIND_DESC.Items.Add(tStr);
    cbKIND_DESC.Items.Add('OUTPUT');
    cbKIND_DESC.Items.Add('MOVE');
    cbKIND_DESC.ItemIndex := 0;

    // 적치호기
    cbHOGI.Items.Clear();
    cbHOGI.Items.Add(tStr);
    cbHOGI.Items.Add(getLangString(FormNo, 'cbHOGI_1', 'Stacker Crane 1', MainDm.M_Info.LANG_TYPE, 'N'));
    cbHOGI.Items.Add(getLangString(FormNo, 'cbHOGI_2', 'Stacker Crane 2', MainDm.M_Info.LANG_TYPE, 'N'));
    cbHOGI.Items.Add(getLangString(FormNo, 'cbHOGI_3', 'Stacker Crane 3', MainDm.M_Info.LANG_TYPE, 'N'));
    cbHOGI.Items.Add(getLangString(FormNo, 'cbHOGI_4', 'Stacker Crane 4', MainDm.M_Info.LANG_TYPE, 'N'));
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
      TraceLogWrite('[520] procedure ChangeComboLang || ERR['+E.Message+']');
    end;
  end;
end;

end.

