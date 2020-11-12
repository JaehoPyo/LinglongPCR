unit U420;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, d_MainDm, h_MainLib, h_ReferLib, StdCtrls, DB, ADODB,
  Grids, StrUtils, DBGrids, comobj, frxClass, frxDBSet, DBGridEhGrouping, EhLibADO,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh,DBGridEhImpExp,
  DBGridEh, Vcl.Mask, Vcl.DBCtrls, DBCtrlsEh, PrnDbgeh, Vcl.Buttons, Vcl.Menus,
  Vcl.Imaging.pngimage, Vcl.ComCtrls ;

type
  TfrmU420 = class(TForm)
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
    Panel26: TPanel;
    Panel27: TPanel;
    Panel11: TPanel;
    PnlSearch: TPanel;
    Panel8: TPanel;
    sbtClear: TSpeedButton;
    Panel6: TPanel;
    DatePicker1: TDateTimePicker;
    TimePicker1: TDateTimePicker;
    PnlInDate: TPanel;
    Panel3: TPanel;
    Panel2: TPanel;
    Panel18: TPanel;
    DatePicker2: TDateTimePicker;
    TimePicker2: TDateTimePicker;
    dgInfo: TDBGridEh;
    edtMATSpec: TEdit;
    PnlMATCode: TPanel;
    edtMATCode: TEdit;
    PnlMATSpec: TPanel;
    Panel5: TPanel;
    edtVER_NO: TEdit;
    Panel14: TPanel;
    sbt_ITEM: TSpeedButton;
    lblSearch: TLabel;
    lblInDate: TLabel;
    lblMATCode: TLabel;
    lblMATSpec: TLabel;
    lblVersion: TLabel;
    Splitter1: TSplitter;
    dgInfoSub: TDBGridEh;
    qryInfoSub: TADOQuery;
    dsInfoSub: TDataSource;
    cbInDate: TCheckBox;
    chkGridMain: TCheckBox;
    chkGridSub: TCheckBox;
    PnlSpray: TPanel;
    LblSpray: TLabel;
    cbSpray: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtClearClick(Sender: TObject);
    procedure KeyPress(Sender: TObject; var Key: Char);
    procedure sbt_ITEMClick(Sender: TObject);
    procedure dgInfoTitleClick(Column: TColumnEh);
    procedure DatePickerKeyPress(Sender: TObject; var Key: Char);
    procedure cbInDateClick(Sender: TObject);
    procedure chkGridMainClick(Sender: TObject);
    procedure chkGridSubClick(Sender: TObject);
    procedure Pnl_MainResize(Sender: TObject);
    procedure Splitter1Moved(Sender: TObject);
    procedure dgInfoSelectionChanged(Sender: TObject);
    procedure cbChange(Sender: TObject);
    procedure cbKeyPress(Sender: TObject; var Key: Char);
    procedure dgInfoSubDrawColumnCell(Sender: TObject; const Rect: TRect;
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
    procedure fnWmMsgRecv(var MSG: TMessage); message WM_USER ;
    procedure fnCommandQuerySub(mCode, vNO: String);
  end;
  procedure U420Create();

const
  FormNo ='420';
  FIdx   = 4;
  SIdx   = 2;

var
  frmU420: TfrmU420;
  SrtFlag : integer = 0 ;

implementation

uses Main, ItemSearch ;

{$R *.dfm}

//==============================================================================
// U420Create
//==============================================================================
procedure U420Create();
begin
  if not Assigned(frmU420) then
  begin
    frmU420 := TfrmU420.Create(Application);
    with frmU420 do
    begin
      fnCommandStart;
      fnCommandLang;
    end;
  end;
  frmU420.Show;
end;

//==============================================================================
// fnWmMsgRecv
//==============================================================================
procedure TfrmU420.fnWmMsgRecv(var MSG: TMessage);
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
procedure TfrmU420.FormCreate(Sender: TObject);
begin
//
end;

//==============================================================================
// FormShow
//==============================================================================
procedure TfrmU420.FormShow(Sender: TObject);
begin
//
end;

//==============================================================================
// FormActivate
//==============================================================================
procedure TfrmU420.FormActivate(Sender: TObject);
begin
  MainDm.M_Info.ActiveFormID := '420';
  frmMain.LblMenu000.Caption := MainDm.M_Info.ActiveFormID + '. ' + getLangMenuString(MainDm.M_Info.ActiveFormID, frmMain.LblMenu000.Caption, MainDm.M_Info.LANG_TYPE, 'N');
  frmU420.Caption := MainDm.M_Info.ActiveFormName;
  frmMain.TabSetDisplay(frmU420, tsFormChange);
  fnCommandLang;
  fnWmMsgSend(StrToInt(menuGrade[FIdx][SIdx].Grade), 111);
end;

//==============================================================================
// FormDeactivate
//==============================================================================
procedure TfrmU420.FormDeactivate(Sender: TObject);
begin
//
end;

//==============================================================================
// FormClose
//==============================================================================
procedure TfrmU420.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryInfo.Active    := False;
  qryInfoSub.Active := False;

  Action := Cafree;
  try
    frmMain.TabSetDisplay(TForm(frmU420), tsDelete);
    frmU420 := Nil ;
  except
  end;
end;

//==============================================================================
// fnCommandStart [시작]
//==============================================================================
procedure TfrmU420.fnCommandStart;
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
procedure TfrmU420.fnCommandOrder  ;
begin
//
end;

//==============================================================================
// fnCommandAdd [신규]
//==============================================================================
procedure TfrmU420.fnCommandAdd  ;
begin
//
end;

//==============================================================================
// fnCommandDelete [삭제]
//==============================================================================
procedure TfrmU420.fnCommandDelete;
begin
//
end;

//==============================================================================
// fnCommandDelete [수정]
//==============================================================================
procedure TfrmU420.fnCommandUpdate;
begin
//
end;

//==============================================================================
// fnCommandExcel [엑셀]
//==============================================================================
procedure TfrmU420.fnCommandExcel;
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
      TmpGrid := dgInfoSub;
      tStr := '(Detail)';
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
      TraceLogWrite('[420] procedure fnCommandExcel Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// fnCommandPrint [인쇄]
//==============================================================================
procedure TfrmU420.fnCommandPrint;
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
      TmpGrid := dgInfoSub;
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
      TraceLogWrite('[420] procedure fnCommandPrint Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// fnCommandQuery [조회]
//==============================================================================
procedure TfrmU420.fnCommandQuery;
var
  WhereStr, StrSQL : String;
  TmpDate1, TmpDate2, TmpTime1, TmpTime2 : String;
begin
  WhereStr := '' ;

  // MAT코드
  if (Trim(edtMATCode.Text) <> '') then
    WhereStr := WhereStr + ' AND UPPER(S.GT_MAT_CODE) LIKE ' + QuotedStr('%'+UpperCase(edtMATCode.Text)+'%') ;

  // MAT사양
  if (Trim(edtMATSpec.Text) <> '') then
    WhereStr := WhereStr + ' AND UPPER(S.GT_MAT_SPEC) LIKE ' + QuotedStr('%'+UpperCase(edtMATSpec.Text)+'%');

  // VER No
  if (Trim(edtVER_NO.Text) <> '') then
    WhereStr := WhereStr + ' AND UPPER(S.VER_NO) LIKE ' + QuotedStr('%'+UpperCase(edtVER_NO.Text)+'%');

  // 스프레이
  if (cbSpray.ItemIndex > 0) then
    WhereStr := WhereStr + ' AND S.SPRAY = ' + QuotedStr(IntToStr(cbSpray.ItemIndex-1)) ;

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
      StrSQL := ' SELECT S.GT_MAT_CODE, S.GT_MAT_SPEC, S.VER_NO, COUNT(*) AS TOTAL ' +
                '   FROM W_STOCK_I S, C_RACK_I R ' +
                '  WHERE S.RACK_NO = R.RACK_NO ' +
                '    AND R.LUGG IN ( 1, 2 ) ' + WhereStr +
                '  GROUP BY S.GT_MAT_CODE, S.GT_MAT_SPEC, S.VER_NO ' +
                '  ORDER BY S.GT_MAT_CODE, S.GT_MAT_SPEC, S.VER_NO ' ;
      SQL.Text := StrSQL;
      Open;
    end;
    qryInfoSub.Close;
  except
    on E : Exception do
    begin
      qryInfo.Close;
      InsertPGMHist('['+FormNo+']', 'E', 'fnCommandQuery', 'Inquiry', 'Exception Error', 'SQL', StrSQL, '', E.Message);
      TraceLogWrite('[420] procedure fnCommandQuery Fail || ERR['+E.Message+'], SQL['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// fnCommandClose [닫기]
//==============================================================================
procedure TfrmU420.fnCommandClose;
begin
//
end;

//==============================================================================
// fnCommandLang [언어]
//==============================================================================
procedure TfrmU420.fnCommandLang;
var
  i : integer;
  cbIndex : Array [0..5] of Integer;
begin
  try
    frmU420.Caption    := MainDm.M_Info.ActiveFormName;
    lblSearch.Caption  := getLangString(FormNo, 'pSEARCH'  , 'Search'  , MainDm.M_Info.LANG_TYPE, 'N');
    lblInDate.Caption  := getLangString(FormNo, 'pIN_DATE' , 'In Date' , MainDm.M_Info.LANG_TYPE, 'N');
    cbInDate.Caption   := getLangString(FormNo, 'cIN_DATE' , 'ALL'     , MainDm.M_Info.LANG_TYPE, 'N');
    lblMATCode.Caption := getLangString(FormNo, 'pMAT_CODE', 'MAT Code', MainDm.M_Info.LANG_TYPE, 'N');
    lblMATSpec.Caption := getLangString(FormNo, 'pMAT_SPEC', 'MAT Spec', MainDm.M_Info.LANG_TYPE, 'N');
    lblVersion.Caption := getLangString(FormNo, 'pVER_NO'  , 'VER No'  , MainDm.M_Info.LANG_TYPE, 'N');
    lblSPRAY.Caption   := getLangString(FormNo, 'SPRAY'    , 'Spray'   , MainDm.M_Info.LANG_TYPE, 'N');

    for i := 0 to dgInfoSub.Columns.Count-1 do
    begin
      dgInfoSub.Columns[i].Title.Caption := getLangString(FormNo, dgInfoSub.Columns[i].FieldName, dgInfoSub.Columns[i].Title.Caption, MainDm.M_Info.LANG_TYPE, 'N');

      if i <= dgInfo.Columns.Count-1 then
      begin
        dgInfo.Columns[i].Title.Caption := getLangString(FormNo, dgInfo.Columns[i].FieldName, dgInfo.Columns[i].Title.Caption, MainDm.M_Info.LANG_TYPE, 'N');
      end;
    end;

    cbIndex[0] := cbSpray.ItemIndex;
    cbSpray.Items.Clear();
    cbSpray.Items.Add(getLangString(FormNo, 'cbALL'  , 'ALL'  , MainDm.M_Info.LANG_TYPE, 'N'));
    cbSpray.Items.Add('NO');
    cbSpray.Items.Add('OK');
    cbSpray.ItemIndex := cbIndex[0];
  except
    on E : Exception do
    begin
      InsertPGMHist('['+FormNo+']', 'E', 'fnCommandLang', 'Language', 'Exception Error', 'PGM', '', '', E.Message);
      TraceLogWrite('[420] procedure fnCommandLang || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// dgInfoSelectionChanged
//==============================================================================
procedure TfrmU420.dgInfoSelectionChanged(Sender: TObject);
begin
  try
    if (not qryInfo.Active) or (qryInfo.RecordCount = 0) then Exit;
    fnCommandQuerySub(qryInfo.FieldByName('GT_MAT_CODE').AsString,
                      qryInfo.FieldByName('VER_NO'     ).AsString);
  except
    on E : Exception do
    begin
      InsertPGMHist('['+FormNo+']', 'E', 'dgInfoSelectionChanged', '', 'Exception Error', 'PGM', '', '', E.Message);
      TraceLogWrite('[420] procedure dgInfoSelectionChanged Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// fnCommandQuery [하위조회]
//==============================================================================
procedure TfrmU420.fnCommandQuerySub(mCode, vNO: String);
var
  WhereStr, StrSQL : String;
  TmpDate1, TmpDate2, TmpTime1, TmpTime2 : String;
begin
  WhereStr := '' ;

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

  // 스프레이
  if (cbSpray.ItemIndex > 0) then
    WhereStr := WhereStr + ' AND S.SPRAY = ' + QuotedStr(IntToStr(cbSpray.ItemIndex-1)) ;

  try
    with qryInfoSub do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' SELECT FN_GETLOC_STR(R.S, R.Z, R.X, R.Y, 1) AS LOCATION ' +
                '      , FN_GETRACK_STR(R.LUGG, R.STATUS) AS STATUS_DESC ' +
                '      , TRUNC(SYSDATE) - TRUNC(S.CREATE_DT) AS EXPIRY ' +
                '      , FN_GETENTERTYPE(S.ENTER_TYPE) AS ENTER_TYPE_DESC ' +
                '      , S.* ' +
                '      , CASE WHEN TRUNC(SYSDATE) - TRUNC(S.CREATE_DT) > FN_GETPARAMDEFINE(''EXPIRY_DATE'') THEN 1 ELSE 0 END EXPIRY_CHECK ' +
                '   FROM W_STOCK_I S, C_RACK_I R ' +
                '  WHERE S.RACK_NO = R.RACK_NO   ' +
                '    AND R.LUGG IN ( 1, 2 ) ' +
                '    AND S.GT_MAT_CODE = ' + QuotedStr(mCode) +
                '    AND NVL(S.VER_NO, '''') = ' + QuotedStr(vNO) + WhereStr +
                '  ORDER BY R.RACK_NO  ' ;
      SQL.Text := StrSQL;
      Open;
    end;
  except
    on E : Exception do
    begin
      qryInfoSub.Close;
      InsertPGMHist('['+FormNo+']', 'E', 'fnCommandQuerySub', 'Inquiry', 'Exception Error', 'SQL', StrSQL, '', E.Message);
      TraceLogWrite('[420] procedure fnCommandQuerySub Fail || ERR['+E.Message+'], SQL['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// cbInDateClick
//==============================================================================
procedure TfrmU420.cbInDateClick(Sender: TObject);
begin
  fnCommandQuery;
end;

//==============================================================================
// KeyPress
//==============================================================================
procedure TfrmU420.KeyPress(Sender: TObject; var Key: Char);
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
procedure TfrmU420.cbKeyPress(Sender: TObject; var Key: Char);
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
procedure TfrmU420.cbChange(Sender: TObject);
begin
  fnCommandQuery;
end;

//==============================================================================
// DatePickerKeyPress
//==============================================================================
procedure TfrmU420.DatePickerKeyPress(Sender: TObject; var Key: Char);
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
procedure TfrmU420.sbtClearClick(Sender: TObject);
begin
  edtMATCode.Text   := ''; // MAT코드
  edtMATSpec.Text   := ''; // MAT사양
  edtVER_NO.Text    := ''; // VER No
  cbSpray.ItemIndex := 0;  // 스프레이
  DatePicker1.Date := Now;
  TimePicker1.Time := StrToTime('00:00:00');
  DatePicker2.Date := Now;
  TimePicker2.Time := StrToTime('23:59:59');
  DatePicker1.SetFocus;
  if cbInDate.Checked then fnCommandQuery;
  cbInDate.Checked := True;
  dgInfo.SelectedRows.Clear;
end;

//==============================================================================
// sbt_ITEMClick [품목찾기]
//==============================================================================
procedure TfrmU420.sbt_ITEMClick(Sender: TObject);
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
      TraceLogWrite('[420] procedure sbt_ITEMClick || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// dgInfoTitleClick
//==============================================================================
procedure TfrmU420.dgInfoTitleClick(Column: TColumnEh);
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
// chkGridMainClick
//==============================================================================
procedure TfrmU420.chkGridMainClick(Sender: TObject);
begin
  if (Sender as TCheckBox).Checked then
       chkGridSub.Checked := False
  else chkGridSub.Checked := True;
end;

//==============================================================================
// chkGridSubClick
//==============================================================================
procedure TfrmU420.chkGridSubClick(Sender: TObject);
begin
  if (Sender as TCheckBox).Checked then
       chkGridMain.Checked := False
  else chkGridMain.Checked := True;
end;

//==============================================================================
// Pnl_MainResize
//==============================================================================
procedure TfrmU420.Pnl_MainResize(Sender: TObject);
begin
  chkGridSub.Left := dgInfoSub.Left + 4;
end;

//==============================================================================
// Splitter1Moved
//==============================================================================
procedure TfrmU420.Splitter1Moved(Sender: TObject);
begin
  chkGridSub.Left := dgInfoSub.Left + 4;
end;

//==============================================================================
// dgInfoSubDrawColumnCell
//==============================================================================
procedure TfrmU420.dgInfoSubDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  if (Column.FieldName <> 'EXPIRY') then Exit;

  if (Column.Field.DataSet.FieldByName('EXPIRY_CHECK').AsInteger = 1) then
  begin
    dgInfoSub.Canvas.Font.Color := clRed;
    dgInfoSub.Canvas.Font.Style := [fsBold];
  end
  else
  begin
    dgInfoSub.Canvas.Font.Color := clBlack;
    dgInfoSub.Canvas.Font.Style := [];
  end;
  dgInfoSub.DefaultDrawColumnCell(rect, datacol, column, state);

end;

end.

