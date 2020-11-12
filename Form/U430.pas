unit U430;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, d_MainDm, h_MainLib, h_ReferLib, StdCtrls, DB, ADODB,
  Grids, StrUtils, DBGrids, comobj, frxClass, frxDBSet, DBGridEhGrouping, EhLibADO,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh,DBGridEhImpExp,
  DBGridEh, Vcl.Mask, Vcl.DBCtrls, DBCtrlsEh, PrnDbgeh, Vcl.Buttons, Vcl.Menus,
  Vcl.Imaging.pngimage, Vcl.ComCtrls ;

type
  TfrmU430 = class(TForm)
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
    PnlMATCode: TPanel;
    edtMATCode: TEdit;
    Panel14: TPanel;
    sbt_ITEM: TSpeedButton;
    lblMATCode: TLabel;
    dgInfo: TDBGridEh;
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
    Panel1: TPanel;
    LblCellStatus: TLabel;
    cbCell_Status: TComboBox;
    lblCnt: TLabel;
    lblSearch: TLabel;
    PnlVER_NO: TPanel;
    lblVER_NO: TLabel;
    edtVER_NO: TEdit;
    PnlSpray: TPanel;
    LblSpray: TLabel;
    cbSpray: TComboBox;
    Panel2: TPanel;
    lblBCR_NO: TLabel;
    edtBCR_NO: TEdit;
    Panel3: TPanel;
    lblMATSpec: TLabel;
    edtMATSpec: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtClearClick(Sender: TObject);
    procedure cbKeyPress(Sender: TObject; var Key: Char);
    procedure KeyPress(Sender: TObject; var Key: Char);
    procedure sbt_ITEMClick(Sender: TObject);
    procedure dgInfoTitleClick(Column: TColumnEh);
    procedure cbChange(Sender: TObject);
    procedure dgInfoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
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
  procedure U430Create();

const
  FormNo ='430';
  FIdx   = 4;
  SIdx   = 3;

var
  frmU430: TfrmU430;
  SrtFlag : integer = 0 ;

implementation

uses Main, ItemSearch ;

{$R *.dfm}

//==============================================================================
// U430Create
//==============================================================================
procedure U430Create();
begin
  if not Assigned(frmU430) then
  begin
    frmU430 := TfrmU430.Create(Application);
    with frmU430 do
    begin
      fnCommandStart;
      fnCommandLang;
    end;
  end;
  frmU430.Show;
end;

//==============================================================================
// fnWmMsgRecv
//==============================================================================
procedure TfrmU430.fnWmMsgRecv(var MSG: TMessage);
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
procedure TfrmU430.FormCreate(Sender: TObject);
begin
//
end;

//==============================================================================
// FormShow
//==============================================================================
procedure TfrmU430.FormShow(Sender: TObject);
begin
//
end;

//==============================================================================
// FormActivate
//==============================================================================
procedure TfrmU430.FormActivate(Sender: TObject);
begin
  MainDm.M_Info.ActiveFormID := '430';
  frmMain.LblMenu000.Caption := MainDm.M_Info.ActiveFormID + '. ' + getLangMenuString(MainDm.M_Info.ActiveFormID, frmMain.LblMenu000.Caption, MainDm.M_Info.LANG_TYPE, 'N');
  frmU430.Caption := MainDm.M_Info.ActiveFormName;
  frmMain.TabSetDisplay(frmU430, tsFormChange);
  fnCommandLang;
  fnWmMsgSend(StrToInt(menuGrade[FIdx][SIdx].Grade), 111);
end;

//==============================================================================
// FormDeactivate
//==============================================================================
procedure TfrmU430.FormDeactivate(Sender: TObject);
begin
//
end;

//==============================================================================
// FormClose
//==============================================================================
procedure TfrmU430.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryInfo.Active := False;

  Action := Cafree;
  try
    frmMain.TabSetDisplay(TForm(frmU430), tsDelete);
    frmU430 := Nil ;
  except
  end;
end;

//==============================================================================
// fnCommandStart [시작]
//==============================================================================
procedure TfrmU430.fnCommandStart;
begin
  fnCommandQuery ;
end;

//==============================================================================
// fnCommandOrder [지시]
//==============================================================================
procedure TfrmU430.fnCommandOrder  ;
begin
//
end;

//==============================================================================
// fnCommandAdd [신규]
//==============================================================================
procedure TfrmU430.fnCommandAdd  ;
begin
//
end;

//==============================================================================
// fnCommandDelete [삭제]
//==============================================================================
procedure TfrmU430.fnCommandDelete;
begin
//
end;

//==============================================================================
// fnCommandDelete [수정]
//==============================================================================
procedure TfrmU430.fnCommandUpdate;
begin
//
end;

//==============================================================================
// fnCommandExcel [엑셀]
//==============================================================================
procedure TfrmU430.fnCommandExcel;
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
      TraceLogWrite('[430] procedure fnCommandExcel Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// fnCommandPrint [인쇄]
//==============================================================================
procedure TfrmU430.fnCommandPrint;
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
      TraceLogWrite('[430] procedure fnCommandPrint Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// fnCommandQuery [조회]
//==============================================================================
procedure TfrmU430.fnCommandQuery;
var
  WhereStr, StrSQL : String;
  TmpDate1, TmpDate2, TmpTime1, TmpTime2 : String;
begin
  WhereStr := '' ;

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

    // 셀상태
  if (cbCell_Status.ItemIndex > 0) then
  begin
    case cbCell_Status.ItemIndex of
      1 : WhereStr := WhereStr + ' And R.STATUS = 0 And R.LUGG = 0 ' ;  // Empty
      2 : WhereStr := WhereStr + ' And R.STATUS = 0 And R.LUGG = 1 ' ;  // Goods
      3 : WhereStr := WhereStr + ' And R.STATUS = 0 And R.LUGG = 2 ' ;  // Pallet
      4 : WhereStr := WhereStr + ' And R.STATUS = 1 ' ;                 // Input
      5 : WhereStr := WhereStr + ' And R.STATUS = 2 ' ;                 // Output
      6 : WhereStr := WhereStr + ' And R.STATUS = 3 ' ;                 // Reserved
      7 : WhereStr := WhereStr + ' And R.STATUS = 5 ' ;                 // Double Error
      8 : WhereStr := WhereStr + ' And R.STATUS = 6 ' ;                 // Empty Error
      9 : WhereStr := WhereStr + ' And R.STATUS = 8 ' ;                 // Block
    end;
  end;

  // MAT코드
  if (Trim(edtMATCode.Text) <> '') then
    WhereStr := WhereStr + ' AND UPPER(S.GT_MAT_CODE) LIKE ' + QuotedStr('%'+UpperCase(edtMATCode.Text)+'%') ;

  // MAT사양
  if (Trim(edtMATSpec.Text) <> '') then
    WhereStr := WhereStr + ' AND UPPER(S.GT_MAT_SPEC) LIKE ' + QuotedStr('%'+UpperCase(edtMATSpec.Text)+'%') ;

  // Ver No
  if (Trim(edtVER_NO.Text) <> '') then
    WhereStr := WhereStr + ' AND UPPER(S.VER_NO) LIKE ' + QuotedStr('%'+UpperCase(edtVER_NO.Text)+'%') ;

  // 스프레이
  if (cbSpray.ItemIndex > 0) then
    WhereStr := WhereStr + ' AND S.SPRAY = ' + QuotedStr(IntToStr(cbSpray.ItemIndex-1)) ;

  // 바코드
  if (Trim(edtBCR_NO.Text) <> '') then
    WhereStr := WhereStr + ' AND UPPER(S.BCR_NO) LIKE ' + QuotedStr('%'+UpperCase(edtBCR_NO.Text)+'%') ;

  try
    with qryInfo do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' SELECT S.*, R.* ' +
                '      , FN_GETLOC_STR(R.S, R.Z, R.X, R.Y, 1) AS LOCATION ' +
                '      , FN_GETRACK_STR(R.LUGG, R.STATUS) AS STATUS_DESC ' +
                '      , TRUNC(SYSDATE) - TRUNC(S.CREATE_DT) AS EXPIRY ' +
                '      , FN_GETENTERTYPE(S.ENTER_TYPE) AS ENTER_TYPE_DESC ' +
                '      , CASE WHEN TRUNC(SYSDATE) - TRUNC(S.CREATE_DT) > FN_GETPARAMDEFINE(''EXPIRY_DATE'') THEN 1 ELSE 0 END EXPIRY_CHECK ' +
                '   FROM W_STOCK_I S, C_RACK_I R ' +
                '  WHERE R.RACK_NO = S.RACK_NO(+) ' + WhereStr +
//                '    AND R.STATUS <> ''99'' ' +
                '  ORDER BY R.RACK_NO ' ;
      SQL.Text := StrSQL;
      Open;
      lblCnt.Caption := '('+FormatFloat('###,###,##0',RecordCount)+')';
    end;
  except
    on E : Exception do
    begin
      qryInfo.Close;
      InsertPGMHist('['+FormNo+']', 'E', 'fnCommandQuery', 'Inquiry', 'Exception Error', 'SQL', StrSQL, '', E.Message);
      TraceLogWrite('[430] procedure fnCommandQuery Fail || ERR['+E.Message+'], SQL['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// fnCommandClose [닫기]
//==============================================================================
procedure TfrmU430.fnCommandClose;
begin
//
end;

//==============================================================================
// fnCommandLang [언어]
//==============================================================================
procedure TfrmU430.fnCommandLang;
var
  i : integer;
  cbIndex : Array [0..5] of Integer;
begin
  try
    frmU430.Caption       := MainDm.M_Info.ActiveFormName;
    lblSearch.Caption     := getLangString(FormNo, 'pSEARCH'    , 'Search'  , MainDm.M_Info.LANG_TYPE, 'N');
    lblHOGI.Caption       := getLangString(FormNo, 'pHOGI'      , 'SC'      , MainDm.M_Info.LANG_TYPE, 'N');
    lblLocation.Caption   := getLangString(FormNo, 'LOCATION'   , 'Location', MainDm.M_Info.LANG_TYPE, 'N');
    LblCellStatus.Caption := getLangString(FormNo, 'STATUS_DESC', 'State'   , MainDm.M_Info.LANG_TYPE, 'N');
    lblMATCode.Caption    := getLangString(FormNo, 'GT_MAT_CODE', 'MAT Code', MainDm.M_Info.LANG_TYPE, 'N');
    lblMATSpec.Caption    := getLangString(FormNo, 'GT_MAT_SPEC', 'MAT Spec', MainDm.M_Info.LANG_TYPE, 'N');
    lblVER_NO.Caption     := getLangString(FormNo, 'pVER_NO'    , 'VER No'  , MainDm.M_Info.LANG_TYPE, 'N');
    lblSPRAY.Caption      := getLangString(FormNo, 'SPRAY'      , 'Spray'   , MainDm.M_Info.LANG_TYPE, 'N');
    lblBCR_NO.Caption     := getLangString(FormNo, 'BCR_NO'     , 'Barcode' , MainDm.M_Info.LANG_TYPE, 'N');

    // 콤보박스 아이템 설정
    // 현재 선택된 아이템 저장
    cbIndex[0] := cbCell_Status.ItemIndex;
    cbIndex[1] := cbHOGI.ItemIndex;
    cbIndex[2] := cbCBank.ItemIndex;
    cbIndex[3] := cbCBay.ItemIndex;
    cbIndex[4] := cbCLevel.ItemIndex;
    cbIndex[5] := cbSpray.ItemIndex;

    // 콤보박스 아이템 언어 변경
    ChangeComboLang;

    // 언어 변경 후 복원
    cbCell_Status.ItemIndex := cbIndex[0];
    cbHogi.ItemIndex        := cbIndex[1];
    cbCBank.ItemIndex       := cbIndex[2];
    cbCBay.ItemIndex        := cbIndex[3];
    cbCLevel.ItemIndex      := cbIndex[4];
    cbSpray.ItemIndex       := cbIndex[5];

    for i := 0 to dgInfo.Columns.Count-1 do
    begin
      dgInfo.Columns[i].Title.Caption := getLangString(FormNo, dgInfo.Columns[i].FieldName, dgInfo.Columns[i].Title.Caption, MainDm.M_Info.LANG_TYPE, 'N');
    end;
  except
    on E : Exception do
    begin
      InsertPGMHist('['+FormNo+']', 'E', 'fnCommandLang', 'Language', 'Exception Error', 'PGM', '', '', E.Message);
      TraceLogWrite('[430] procedure fnCommandLang || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// ChangeComboLang ( 언어에 따라 콤보 박스 안의 내용을 바꿈)
//==============================================================================
procedure TfrmU430.ChangeComboLang;
var
  i : Integer;
  tStr : String;
begin
  try
    tStr := getLangString(FormNo, 'cbALL', 'ALL', MainDm.M_Info.LANG_TYPE, 'N');
    // 지시구분
    cbCell_Status.Items.Clear();
    cbCell_Status.Items.Add(tStr);
    cbCell_Status.Items.Add('Empty');
    cbCell_Status.Items.Add('Goods');
    cbCell_Status.Items.Add('Pallet');
    cbCell_Status.Items.Add('Input');
    cbCell_Status.Items.Add('Output');
    cbCell_Status.Items.Add('Reserved');
    cbCell_Status.Items.Add('Double Error');
    cbCell_Status.Items.Add('Empty Error');
    cbCell_Status.Items.Add('Block');

    // 적치호기
    cbHOGI.Items.Clear();
    cbHOGI.Items.Add(tStr);
    cbHOGI.Items.Add(getLangString(FormNo, 'cbHOGI_1', 'Stacker Crane 1', MainDm.M_Info.LANG_TYPE, 'N'));
    cbHOGI.Items.Add(getLangString(FormNo, 'cbHOGI_2', 'Stacker Crane 2', MainDm.M_Info.LANG_TYPE, 'N'));
    cbHOGI.Items.Add(getLangString(FormNo, 'cbHOGI_3', 'Stacker Crane 3', MainDm.M_Info.LANG_TYPE, 'N'));
    cbHOGI.Items.Add(getLangString(FormNo, 'cbHOGI_4', 'Stacker Crane 4', MainDm.M_Info.LANG_TYPE, 'N'));

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

    cbSpray.Items.Clear();
    cbSpray.Items.Add(tStr);
    cbSpray.Items.Add('NO');
    cbSpray.Items.Add('OK');
  except
    on E : Exception do
    begin
      InsertPGMHist('['+FormNo+']', 'E', 'ChangeComboLang', '', 'Exception Error', 'PGM', '', '', E.Message);
      TraceLogWrite('[430] procedure ChangeComboLang || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// KeyPress
//==============================================================================
procedure TfrmU430.KeyPress(Sender: TObject; var Key: Char);
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
procedure TfrmU430.cbKeyPress(Sender: TObject; var Key: Char);
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
procedure TfrmU430.cbChange(Sender: TObject);
begin
  fnCommandQuery;
end;

//==============================================================================
// sbtClearClick
//==============================================================================
procedure TfrmU430.sbtClearClick(Sender: TObject);
begin
  cbHogi.ItemIndex        := 0;  // 적치호기
  cbCBank.ItemIndex       := 0;  // 적치 열
  cbCBay.ItemIndex        := 0;  // 적치 연
  cbCLEvel.ItemIndex      := 0;  // 적치 단
  cbCell_Status.ItemIndex := 0;  // 셀 상태
  edtMATCode.Text         := ''; // MAT코드
  edtMATSpec.Text         := ''; // MAT사양
  edtVER_NO.Text          := ''; // VER No
  cbSpray.ItemIndex       := 0;  // 스프레이
  edtBCR_NO.Text          := '';
  fnCommandQuery;
end;

//==============================================================================
// sbt_ITEMClick [품목찾기]
//==============================================================================
procedure TfrmU430.sbt_ITEMClick(Sender: TObject);
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
      TraceLogWrite('[430] procedure sbt_ITEMClick || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// dgInfoTitleClick
//==============================================================================
procedure TfrmU430.dgInfoTitleClick(Column: TColumnEh);
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
// dgInfoSubDrawColumnCell
//==============================================================================
procedure TfrmU430.dgInfoDrawColumnCell(Sender: TObject; const Rect: TRect;
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

