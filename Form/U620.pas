unit U620;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, d_MainDm, h_MainLib, h_ReferLib, StdCtrls, DB, ADODB,
  Grids, StrUtils, DBGrids, comobj, DBGridEhGrouping, EhLibADO,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh,DBGridEhImpExp,
  DBGridEh, Vcl.Mask, Vcl.DBCtrls, DBCtrlsEh, PrnDbgeh, Vcl.Buttons, Vcl.Menus ;

type
  TfrmU620 = class(TForm)
    dsInfo: TDataSource;
    qryInfo: TADOQuery;
    qryTemp: TADOQuery;
    shpB: TShape;
    shpL: TShape;
    shpR: TShape;
    shpT: TShape;
    EhPrint: TPrintDBGridEh;
    Pnl_Base: TPanel;
    Pnl_Main: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Pnl_Top: TPanel;
    qryInfoSub: TADOQuery;
    dsInfoSub: TDataSource;
    Panel6: TPanel;
    Pnl_Main_Top: TPanel;
    Splitter2: TSplitter;
    qryInfoMenu: TADOQuery;
    dsInfoMenu: TDataSource;
    Pnl_Main_Bottom: TPanel;
    dgInfoSub: TDBGridEh;
    Panel11: TPanel;
    PnlInfo: TPanel;
    Panel9: TPanel;
    sbtClear: TSpeedButton;
    PnlMenuCode: TPanel;
    edtCode: TEdit;
    PnlMenuName: TPanel;
    edtName: TEdit;
    Splitter3: TSplitter;
    Splitter1: TSplitter;
    Pnl_Main_Top_Left: TPanel;
    dgInfo: TDBGridEh;
    PnlUserGroup: TPanel;
    Pnl_Main_Top_Client: TPanel;
    dgInfoMenu: TDBGridEh;
    PnlMenuList: TPanel;
    PnlUserGrade: TPanel;
    PnlGroupCode: TPanel;
    edtGroup: TEdit;
    PnlGroupName: TPanel;
    edtGroupName: TEdit;
    edtUSED_YN: TEdit;
    LblUserGroup: TPanel;
    LblMenuList: TPanel;
    LblUserGrade: TPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure dgInfoTitleClick(Column: TColumnEh);
    procedure FormShow(Sender: TObject);
    procedure KeyPress(Sender: TObject; var Key: Char);
    procedure mnCodeDelClick(Sender: TObject);
    procedure dgInfoCellClick(Column: TColumnEh);
    procedure dgInfoMenuCellClick(Column: TColumnEh);
    procedure FormResize(Sender: TObject);
    procedure qryInfoSubAfterPost(DataSet: TDataSet);
    procedure qryInfoSubBeforeEdit(DataSet: TDataSet);
    procedure dgInfoSubKeyPress(Sender: TObject; var Key: Char);
    procedure dgInfoSelectionChanged(Sender: TObject);
    procedure dgInfoSubCellClick(Column: TColumnEh);
    procedure dgInfoSubMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
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
    procedure SetComboBox ;
    procedure fnCommandQueryMenu(Grade: String);
    procedure fnCommandQuerySub(Grade: String);
    procedure ProcDeleteCode(Grade, Menu: String);
    function  fnCompareCellInfo(beforeD, afterD: TDATA_INFO): Boolean;
  end;
  procedure U620Create();

const
  FormNo = '620';
  FIdx   = 6;
  SIdx   = 2;

var
  frmU620: TfrmU620;
  SrtFlag : integer = 0 ;

  beforeData, afterData : TDATA_INFO;

implementation

uses Main;

{$R *.dfm}

//==============================================================================
// U620Create
//==============================================================================
procedure U620Create();
begin
  if not Assigned(frmU620) then
  begin
    frmU620 := TfrmU620.Create(Application);
    with frmU620 do
    begin
      fnCommandStart;
      fnCommandLang;
    end;
  end;
  frmU620.Show;
end;

//==============================================================================
// fnWmMsgRecv
//==============================================================================
procedure TfrmU620.fnWmMsgRecv(var MSG: TMessage);
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
procedure TfrmU620.FormCreate(Sender: TObject);
begin
//
end;

//==============================================================================
// FormShow
//==============================================================================
procedure TfrmU620.FormShow(Sender: TObject);
begin
//
end;

//==============================================================================
// FormActivate
//==============================================================================
procedure TfrmU620.FormActivate(Sender: TObject);
var
  i : integer;
begin
  MainDm.M_Info.ActiveFormID := '620';
  frmMain.LblMenu000.Caption := MainDm.M_Info.ActiveFormID + '. ' + getLangMenuString(MainDm.M_Info.ActiveFormID, frmMain.LblMenu000.Caption, MainDm.M_Info.LANG_TYPE, 'N');
  frmU620.Caption := MainDm.M_Info.ActiveFormName;
  frmMain.TabSetDisplay(frmU620, tsFormChange);
  fnCommandLang;

  if MainDM.M_Info.UserGrade = '0' then
  begin
    fnWmMsgSend(2111111, 111);
  end else
  begin
    fnWmMsgSend(StrToInt(menuGrade[FIdx][SIdx].Grade), 111);
  end;
  fnCommandQuery;

  if not frmMain.cmdUPDATE.Enabled then
       dgInfoSub.Options := dgInfoSub.Options - [dgEditing] + [dgRowSelect]
  else dgInfoSub.Options := dgInfoSub.Options + [dgEditing] - [dgRowSelect];
end;

//==============================================================================
// FormDeactivate
//==============================================================================
procedure TfrmU620.FormDeactivate(Sender: TObject);
begin
  if (qryInfoSub.Active = false ) then Exit;

  if qryInfoSub.State in [dsEdit, dsInsert] then
  begin
    qryInfoSub.Post;
  end;
end;

//==============================================================================
// FormClose
//==============================================================================
procedure TfrmU620.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if qryInfoSub.State in [dsEdit, dsInsert] then
  begin
    qryInfoSub.Post;
  end;

  qryInfo.Active     := False;
  qryTemp.Active     := False;
  qryInfoMenu.Active := False;
  qryInfoSub.Active  := False;

  Action := Cafree;
  try
    frmMain.TabSetDisplay(TForm(frmU620), tsDelete);
    frmU620 := Nil ;
  except
  end;
end;

//==============================================================================
// fnCommandStart [시작]
//==============================================================================
procedure TfrmU620.fnCommandStart;
begin
//
end;

//==============================================================================
// fnCommandOrder [지시]
//==============================================================================
procedure TfrmU620.fnCommandOrder;
begin
//
end;

//==============================================================================
// fnCommandAdd [신규]
//==============================================================================
procedure TfrmU620.fnCommandAdd;
var
  StrSQL : String;
  ExecNo : integer;
begin
  if Trim(edtGroup.Text) = '' then
  begin
    MessageDlg('Please select a row. (Add)(Group)', mtConfirmation, [mbYes], 0);
    Exit ;
  end;

  if Trim(edtCode.Text) = '' then
  begin
    MessageDlg('Please select a row. (Add)(Menu)', mtConfirmation, [mbYes], 0);
    Exit ;
  end;

  if edtUSED_YN.Text = 'Y' then
  begin
    MessageDlg('This menu is already registered.', mtWarning, [mbYes], 0);
    Exit ;
  end;


  try
    with qryTemp do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' INSERT INTO C_USER_ROLE ( ' +
                '        PROGRAM_ID, USER_GRADE, USE_ORDER , ' +
                '        USE_REGIST, USE_DELETE, USE_UPDATE, ' +
                '        USE_EXCEL , USE_PRINT , USE_QUERY ) ' +
                '     VALUES ( ' +
                         QuotedStr(edtCode.Text)  + ',' + //우측 상단 그리드에 MENU CODE
                         QuotedStr(edtGroup.Text) + ',' + //죄측 상단 그리드에 GRADE CODE
                '        0, 0, 0, 0, 0, 0, 1 ) ' ;        // 처음 생성시 모든 상단툴 사용 불가
      SQL.Text := StrSQL;
      ExecNo := ExecSQL;
      if ExecNo > 0 then
      begin
        InsertPGMHist('['+FormNo+']', 'N', 'fnCommandAdd', 'Regist', 'User Grade['+edtGroupName.Text+'], Menu Code['+edtCode.Text+'], Menu Name['+edtName.Text+']', 'SQL', StrSQL, '', '');
        TraceLogWrite('[620] User Grade Add || User Grade['+edtGroupName.Text+'], ' +
                      'Menu Code['+edtCode.Text+'], ' +
                      'Menu Name['+edtName.Text+'], ' +
                      'Add User['+MainDm.M_Info.UserCode+']');
        fnCommandQuerySub(edtGroup.Text);
        fnCommandQueryMenu(edtGroup.Text);
        frmMain.fnMenuPermit;
      end else
      begin
        InsertPGMHist('['+FormNo+']', 'E', 'fnCommandAdd', 'Regist', 'User Grade['+edtGroupName.Text+'], Menu Code['+edtCode.Text+'], Menu Name['+edtName.Text+']', 'SQL', StrSQL, '', '');
        TraceLogWrite('[620] User Grade Add Fail || User Grade['+edtGroupName.Text+'], ' +
                      'Menu Code['+edtCode.Text+'], ' +
                      'Menu Name['+edtName.Text+'], ' +
                      'Add User['+MainDm.M_Info.UserCode+']');
      end;
      Close;
    end;
  except
    on E : Exception do
    begin
      qryTemp.Close;
      InsertPGMHist('['+FormNo+']', 'E', 'fnCommandAdd', 'Regist', 'Exception Error', 'SQL', StrSQL, '', E.Message);
      TraceLogWrite('[620] procedure fnCommandAdd Fail || ERR['+E.Message+'], SQL['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// fnCommandDelete [삭제]
//==============================================================================
procedure TfrmU620.fnCommandDelete;
var
  i : Integer;
begin
  if Trim(edtGroup.Text) = '' then
  begin
    MessageDlg('Please select a row. (Add)(Group)', mtConfirmation, [mbYes], 0);
    Exit ;
  end;

  if Trim(edtCode.Text) = '' then
  begin
    MessageDlg('Please select a row. (Add)(Menu)', mtConfirmation, [mbYes], 0);
    Exit ;
  end;

  if (Trim(edtGroup.Text) = '0') and
     (Trim(edtCode.Text) = '620') then
  begin
    MessageDlg('Supervisor permissions cannot delete (620)UserGroup Management Forms.', mtWarning, [mbYes], 0);
    Exit ;
  end;

  if MessageDlg('Are you want to delete the selected code?' + #13#10 + #13#10 +
                    '['+edtGroupName.Text + ' / ' + edtName.Text +']', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit ;

  try
    ProcDeleteCode(edtGroup.Text, edtCode.Text);
    SetComboBox;
    fnCommandQuerySub(edtGroup.Text);
    fnCommandQueryMenu(edtGroup.Text);
  except
    on E : Exception do
    begin
      InsertPGMHist('['+FormNo+']', 'E', 'fnCommandDelete', 'Delete', 'Exception Error', 'PGM', '', '', E.Message);
      TraceLogWrite('[620] procedure fnCommandDelete Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// fnCommandUpdate [수정]
//==============================================================================
procedure TfrmU620.fnCommandUpdate;
begin
  try
    if qryInfoSub.State in [dsEdit, dsInsert] then
    begin
      qryInfoSub.Post;
    end;
  except
    on E : Exception do
    begin
      InsertPGMHist('['+FormNo+']', 'E', 'fnCommandUpdate', 'Update', 'Exception Error', 'PGM', '', '', E.Message);
      TraceLogWrite('[620] procedure fnCommandUpdate Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// fnCommandExcel [엑셀]
//==============================================================================
procedure TfrmU620.fnCommandExcel;
begin
  try
    if hlbEhgridListExcel(dgInfoSub, Copy(MainDm.M_Info.ActiveFormName, 6, Length(MainDm.M_Info.ActiveFormName)-5) + '_' + FormatDatetime('YYYYMMDD', Now)) then
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
      TraceLogWrite('[620] procedure fnCommandExcel Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// fnCommandPrint [인쇄]
//==============================================================================
procedure TfrmU620.fnCommandPrint;
begin
  try
    if not qryInfoSub.Active then Exit;
    fnCommandQuerySub(edtGroup.Text);
    EhPrint.DBGridEh := dgInfoSub;
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
      TraceLogWrite('[620] procedure fnCommandPrint Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// fnCommandQuery [조회]
//==============================================================================
procedure TfrmU620.fnCommandQuery;
var
  WhereStr, StrSQL : String;
begin
  //=============================
  // 유저 그룹
  //=============================
  try
    with qryInfo do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' SELECT * FROM C_USER_GRADE ORDER BY USER_GRADE ' ;
      SQL.Text := StrSQL;
      Open;
    end;
  except
    on E : Exception do
    begin
      qryInfo.Close;
      InsertPGMHist('['+FormNo+']', 'E', 'fnCommandQuery', 'Inquery', 'Exception Error', 'SQL', StrSQL, '', E.Message);
      TraceLogWrite('[620] procedure fnCommandQuery Fail || ERR['+E.Message+'], SQL['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// fnCommandQueryMenu [하위조회]
//==============================================================================
procedure TfrmU620.fnCommandQueryMenu(Grade: String);
var
  WhereStr, StrSQL : String;
begin
  try
    //=============================
    // 메뉴
    //=============================
    edtCode.Text := '';
    edtName.Text := '';
    edtUSED_YN.Text := '';
    if Trim(Grade) = '' then Exit;

    with qryInfoMenu do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' SELECT M.MENU_ID, MENU_NM_' + MainDm.M_Info.LANG_STR + ' AS PROGRAM_NAME, ' +
                '        (CASE WHEN (R.PROGRAM_ID = '''') or (R.PROGRAM_ID is NULL) THEN ''N'' ' +
                '              ELSE ''Y'' END) as MENU_USED ' +
                '   FROM C_MENU_I M ' +
                '   LEFT OUTER JOIN ' +
                '   (SELECT PROGRAM_ID ' +
                '      FROM C_USER_ROLE ' +
                '     WHERE USER_GRADE = ' + QuotedStr(Grade) + ') R' +
                '     ON M.MENU_ID = R.PROGRAM_ID ' +
                '  WHERE M.MENU_LVL = ''2'' ' +
                '  ORDER BY M.MENU_ID ' ;
      SQL.Text := StrSQL;
      Open;
    end;
  except
    on E : Exception do
    begin
      qryInfoMenu.Close;
      InsertPGMHist('['+FormNo+']', 'E', 'fnCommandQueryMenu', 'Inquery', 'Exception Error', 'SQL', StrSQL, '', E.Message);
      TraceLogWrite('[620] procedure fnCommandQueryMenu Fail || ERR['+E.Message+'], SQL['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// fnCommandQuery [하위조회]
//==============================================================================
procedure TfrmU620.fnCommandQuerySub(Grade: String);
var
  WhereStr, StrSQL : String;
begin
  try
    //=============================
    // 권한
    //=============================
    if Trim(Grade) = '' then Exit;

    with qryInfoSub do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' SELECT R.*, MENU_NM_' + MainDm.M_Info.LANG_STR + ' AS PROGRAM_NAME, ' +
                '        DECODE(R.USER_GRADE, ''0'',''Supervisor'',''1'',''CCR'',''2'',''ASRS'',''3'',''ProductManager'') as GRADE_DESC ' +
                '   FROM C_USER_ROLE R ' +
                '   LEFT JOIN C_MENU_I I ' +
                '     ON R.PROGRAM_ID = I.MENU_ID ' +
                '  WHERE USER_GRADE = ' + Grade +
                '  ORDER BY R.PROGRAM_ID ' ;
      SQL.Text := StrSQL;
      Open;
    end;
  except
    on E : Exception do
    begin
      qryInfoSub.Close;
      InsertPGMHist('['+FormNo+']', 'E', 'fnCommandQuerySub', 'Inquery', 'Exception Error', 'SQL', StrSQL, '', E.Message);
      TraceLogWrite('[620] procedure fnCommandQuerySub Fail || ERR['+E.Message+'], SQL['+StrSQL+']');
    end;
  end ;
end;

//==============================================================================
// fnCommandClose [닫기]
//==============================================================================
procedure TfrmU620.fnCommandClose;
begin
//
end;

//==============================================================================
// fnCommandLang [언어]
//==============================================================================
procedure TfrmU620.fnCommandLang;
var
  i : integer;
begin
  try
    frmU620.Caption      := MainDm.M_Info.ActiveFormName;
    PnlGroupCode.Caption := getLangString(FormNo, 'USER_GRADE'  , 'Group Code'     , MainDm.M_Info.LANG_TYPE, 'N');
    PnlGroupName.Caption := getLangString(FormNo, 'GRADE_DESC'  , 'Group Name'     , MainDm.M_Info.LANG_TYPE, 'N');
    PnlMenuCode.Caption  := getLangString(FormNo, 'MENU_ID'     , 'Menu Code'      , MainDm.M_Info.LANG_TYPE, 'N');
    PnlMenuName.Caption  := getLangString(FormNo, 'PROGRAM_NAME', 'Menu Name'      , MainDm.M_Info.LANG_TYPE, 'N');
    PnlInfo.Caption      := getLangString(FormNo, 'pInfo'       , 'Select Info'    , MainDm.M_Info.LANG_TYPE, 'N');
    LblMenuList.Caption  := getLangString(FormNo, 'pMENU_LIST'  , '[ Menu List ]'  , MainDm.M_Info.LANG_TYPE, 'N');
    LblUserGroup.Caption := getLangString(FormNo, 'pUSER_GROUP' , '[ User Group ]' , MainDm.M_Info.LANG_TYPE, 'N');
    LblUserGrade.Caption := getLangString(FormNo, 'pUSER_GADE'  , '[ User Grade ]' , MainDm.M_Info.LANG_TYPE, 'N');

    for i := 0 to dgInfoSub.Columns.Count-1 do
    begin
      dgInfoSub.Columns[i].Title.Caption := getLangString(FormNo, dgInfoSub.Columns[i].FieldName, dgInfoSub.Columns[i].Title.Caption, MainDm.M_Info.LANG_TYPE, 'N');

      if i <= dgInfo.Columns.Count-1 then
      begin
        dgInfo.Columns[i].Title.Caption := getLangString(FormNo, dgInfo.Columns[i].FieldName, dgInfo.Columns[i].Title.Caption, MainDm.M_Info.LANG_TYPE, 'N');
      end;

      if i <= dgInfoMenu.Columns.Count-1 then
      begin
        dgInfoMenu.Columns[i].Title.Caption := getLangString(FormNo, dgInfoMenu.Columns[i].FieldName, dgInfoMenu.Columns[i].Title.Caption, MainDm.M_Info.LANG_TYPE, 'N');
      end;
    end;

    fnCommandQuery;
    fnCommandQuerySub(edtGroup.Text);
    fnCommandQueryMenu(edtGroup.Text);
  except
    on E : Exception do
    begin
      InsertPGMHist('['+FormNo+']', 'E', 'fnCommandLang', 'Language', 'Exception Error', 'PGM', '', '', E.Message);
      TraceLogWrite('[620] procedure fnCommandLang Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// SetComboBox
//==============================================================================
procedure TfrmU620.SetComboBox;
begin
//
end;

//==============================================================================
// dgInfoCellClick
//==============================================================================
procedure TfrmU620.dgInfoCellClick(Column: TColumnEh);
begin
  try
    dgInfoSub.SelectedRows.Clear;
    dgInfoMenu.SelectedRows.Clear;
    if (not qryInfo.Active) or (qryInfo.RecordCount = 0) then Exit;
    edtGroup.Text     := qryInfo.FieldByName('USER_GRADE').AsString;
    edtGroupName.Text := qryInfo.FieldByName('GRADE_DESC').AsString;
    edtCode.Text := '';
    edtName.Text := '';
    fnCommandQuerySub(edtGroup.Text);
    fnCommandQueryMenu(edtGroup.Text);
    qryInfoMenu.First;
  except
    on E : Exception do
    begin
      InsertPGMHist('['+FormNo+']', 'E', 'dgInfoCellClick', '', 'Exception Error', 'PGM', '', '', E.Message);
      TraceLogWrite('[620] procedure dgInfoCellClick Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// ProcDeleteCode [선택코드삭제]
//==============================================================================
procedure TfrmU620.ProcDeleteCode(Grade, Menu: String);
var
  ExecNo : integer;
  StrSQL : String;
begin
  try
    //=======================
    // 사용자 메뉴 삭제
    //=======================
    StrSQL := ' DELETE FROM C_USER_ROLE ' +
              '  WHERE PROGRAM_ID = ' + QuotedStr(Menu) +  //우측 상단 그리드에 MENU CODE
              '    AND USER_GRADE = ' + QuotedStr(Grade);  //죄측 상단 그리드에 GRADE CODE

    with qryTemp do
    begin
      Close;
      SQL.Clear;
      SQL.Text := StrSQL;
      ExecNo := ExecSQL;
      if ExecNo > 0 then
      begin
        InsertPGMHist('['+FormNo+']', 'N', 'ProcDeleteCode', 'Delete', 'User Grade['+edtGroupName.Text+'], Menu Code['+edtCode.Text+'], Menu Name['+edtName.Text+']', 'SQL', StrSQL, '', '');
        TraceLogWrite('[620] User Grade Delete || User Grade['+edtGroupName.Text+'], ' +
                      'Menu Code['+edtCode.Text+'], ' +
                      'Menu Name['+edtName.Text+'], ' +
                      'Add User['+MainDm.M_Info.UserCode+']');
        frmMain.fnMenuPermit;
      end else
      begin
        InsertPGMHist('['+FormNo+']', 'E', 'ProcDeleteCode', 'Delete', 'User Grade['+edtGroupName.Text+'], Menu Code['+edtCode.Text+'], Menu Name['+edtName.Text+']', 'SQL', StrSQL, '', '');
        TraceLogWrite('[620] User Grade Delete Fail || User Grade['+edtGroupName.Text+'], ' +
                      'Menu Code['+edtCode.Text+'], ' +
                      'Menu Name['+edtName.Text+'], ' +
                      'Add User['+MainDm.M_Info.UserCode+']');
      end;
      Close;
    end;
  except
    on E : Exception do
    begin
      qryTemp.Close;
      InsertPGMHist('['+FormNo+']', 'E', 'ProcDeleteCode', 'Delete', 'Exception Error', 'SQL', StrSQL, '', E.Message);
      TraceLogWrite('[620] procedure ProcDeleteCode Fail || ERR['+E.Message+'], SQL['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// KeyPress
//==============================================================================
procedure TfrmU620.KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    fnCommandQuery;
  end;
end;

//==============================================================================
// mnCodeDelClick
//==============================================================================
procedure TfrmU620.mnCodeDelClick(Sender: TObject);
begin
  fnCommandDelete;
end;

//==============================================================================
// dgInfoTitleClick
//==============================================================================
procedure TfrmU620.dgInfoTitleClick(Column: TColumnEh);
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
// dgInfoMenuCellClick : 우측 상단 그리드 셀 클릭시
//==============================================================================
procedure TfrmU620.dgInfoMenuCellClick(Column: TColumnEh);
begin
  edtCode.Text := qryInfoMenu.FieldByName('MENU_ID').AsString;
  edtName.Text := qryInfoMenu.FieldByName('PROGRAM_NAME').AsString;
  edtUSED_YN.Text := qryInfoMenu.FieldByName('MENU_USED').AsString;
end;

//==============================================================================
// dgInfoSubCellClick
//==============================================================================
procedure TfrmU620.dgInfoSubCellClick(Column: TColumnEh);
begin
  if (qryInfoSub.Active = false ) then Exit;

  edtCode.Text := qryInfoSub.FieldByName('PROGRAM_ID').AsString;
  edtName.Text := qryInfoSub.FieldByName('PROGRAM_NAME').AsString;
  edtUSED_YN.Text := 'Y';
end;

//==============================================================================
// FormResize
//==============================================================================
procedure TfrmU620.FormResize(Sender: TObject);
begin
  Pnl_Main_Top.Height := ((Pnl_Base.Height - Panel2.Height - Splitter3.Height) div 2) - 200;
  Pnl_Main_Top_Left.Width := (Pnl_Base.Width - Splitter1.Width) div 2;
end;

//==============================================================================
// fnCompareCellInfo
//==============================================================================
function TfrmU620.fnCompareCellInfo(beforeD, afterD: TDATA_INFO): Boolean;
var
  i : Integer;
begin
  i := 0;
  try
    if beforeData.DATA4  <> afterData.DATA4  then Inc(i);
    if beforeData.DATA5  <> afterData.DATA5  then Inc(i);
    if beforeData.DATA6  <> afterData.DATA6  then Inc(i);
    if beforeData.DATA7  <> afterData.DATA7  then Inc(i);
    if beforeData.DATA8  <> afterData.DATA8  then Inc(i);
    if beforeData.DATA9  <> afterData.DATA9  then Inc(i);
    if beforeData.DATA10 <> afterData.DATA10 then Inc(i);
    Result := Boolean(i > 0);
  except
    on E : Exception do
    begin
      InsertPGMHist('['+FormNo+']', 'E', 'fnCompareCellInfo', '', 'Exception Error', 'PGM', '', '', E.Message);
      TraceLogWrite('[620] function fnCompareCellInfo Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// qryInfoSubBeforeEdit
//==============================================================================
procedure TfrmU620.qryInfoSubBeforeEdit(DataSet: TDataSet);
begin
  try
    beforeData.FrmNo  := FormNo;
    beforeData.DATA1  := DataSet.FieldByName('GRADE_DESC'  ).AsString;
    beforeData.DATA2  := DataSet.FieldByName('PROGRAM_ID'  ).AsString;
    beforeData.DATA3  := DataSet.FieldByName('PROGRAM_NAME').AsString;
    beforeData.DATA4  := DataSet.FieldByName('USE_ORDER'   ).AsString;
    beforeData.DATA5  := DataSet.FieldByName('USE_REGIST'  ).AsString;
    beforeData.DATA6  := DataSet.FieldByName('USE_DELETE'  ).AsString;
    beforeData.DATA7  := DataSet.FieldByName('USE_UPDATE'  ).AsString;
    beforeData.DATA8  := DataSet.FieldByName('USE_EXCEL'   ).AsString;
    beforeData.DATA9  := DataSet.FieldByName('USE_PRINT'   ).AsString;
    beforeData.DATA10 := DataSet.FieldByName('USE_QUERY'   ).AsString;
  except
    on E : Exception do
    begin
      InsertPGMHist('['+FormNo+']', 'E', 'qryInfoSubBeforeEdit', '', 'Exception Error', 'PGM', '', '', E.Message);
      TraceLogWrite('[620] procedure qryInfoSubBeforeEdit Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// qryInfoSubAfterPost
//==============================================================================
procedure TfrmU620.qryInfoSubAfterPost(DataSet: TDataSet);
var
  tFIdx, tSIdx : integer;
begin
  try
    afterData.FrmNo  := FormNo;
    afterData.DATA1  := DataSet.FieldByName('GRADE_DESC'  ).AsString;
    afterData.DATA2  := DataSet.FieldByName('PROGRAM_ID'  ).AsString;
    afterData.DATA3  := DataSet.FieldByName('PROGRAM_NAME').AsString;
    afterData.DATA4  := DataSet.FieldByName('USE_ORDER'   ).AsString;
    afterData.DATA5  := DataSet.FieldByName('USE_REGIST'  ).AsString;
    afterData.DATA6  := DataSet.FieldByName('USE_DELETE'  ).AsString;
    afterData.DATA7  := DataSet.FieldByName('USE_UPDATE'  ).AsString;
    afterData.DATA8  := DataSet.FieldByName('USE_EXCEL'   ).AsString;
    afterData.DATA9  := DataSet.FieldByName('USE_PRINT'   ).AsString;
    afterData.DATA10 := DataSet.FieldByName('USE_QUERY'   ).AsString;

    if fnCompareCellInfo(beforeData, afterData) then
    begin
      afterData.CompareStr := 'User Grade[' + afterData.DATA1 + '], Menu Code['+afterData.DATA2+'], Update[';
      if beforeData.DATA4  <> afterData.DATA4  then afterData.CompareStr := afterData.CompareStr + 'Order('+beforeData.DATA4  +'->'+afterData.DATA4 +')';
      if beforeData.DATA5  <> afterData.DATA5  then afterData.CompareStr := afterData.CompareStr + 'Regist('+beforeData.DATA5 +'->'+afterData.DATA5 +')';
      if beforeData.DATA6  <> afterData.DATA6  then afterData.CompareStr := afterData.CompareStr + 'Delete('+beforeData.DATA6 +'->'+afterData.DATA6 +')';
      if beforeData.DATA7  <> afterData.DATA7  then afterData.CompareStr := afterData.CompareStr + 'Update('+beforeData.DATA7 +'->'+afterData.DATA7 +')';
      if beforeData.DATA8  <> afterData.DATA8  then afterData.CompareStr := afterData.CompareStr + 'Excel('+beforeData.DATA8  +'->'+afterData.DATA8 +')';
      if beforeData.DATA9  <> afterData.DATA9  then afterData.CompareStr := afterData.CompareStr + 'Print('+beforeData.DATA9  +'->'+afterData.DATA9 +')';
      if beforeData.DATA10 <> afterData.DATA10 then afterData.CompareStr := afterData.CompareStr + 'Query('+beforeData.DATA10 +'->'+afterData.DATA10+')';
      afterData.CompareStr := afterData.CompareStr + ']';
    end else
    begin
      afterData.CompareStr := '';
      Exit;
    end;
    InsertPGMHist('['+FormNo+']', 'N', 'qryInfoSubAfterPost', 'Update', afterData.CompareStr, 'PGM', '', '', '');
    TraceLogWrite('[620] Group Grade Update || ' + afterData.CompareStr);

    tFIdx := StrToInt(Copy(beforeData.DATA2, 1, 1));
    tSIdx := StrToInt(Copy(beforeData.DATA2, 2, 1));
    menuGrade[tFIdx][tSIdx].Grade := afterData.DATA4 + afterData.DATA5 + afterData.DATA6  +
                                     afterData.DATA7 + afterData.DATA8 + afterData.DATA9  + afterData.DATA10 ;
    menuGrade[tFIdx][tSIdx].Grade := StringReplace(menuGrade[tFIdx][tSIdx].Grade, '0', '2', [rfReplaceAll, rfIgnoreCase]);

    if beforeData.DATA2 = FormNo then
    begin
      fnWmMsgSend(StrToInt(menuGrade[tFIdx][tSIdx].Grade), 111);
    end;

    DataSet.Edit ;
    DataSet.FieldByName('UP_DATE').AsDateTime := Now;
    DataSet.Post;
  except
    on E : Exception do
    begin
      InsertPGMHist('['+FormNo+']', 'E', 'qryInfoSubAfterPost', 'Update', 'Exception Error', 'PGM', '', '', E.Message);
      TraceLogWrite('[620] procedure qryInfoSubAfterPost Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// dgInfoSubKeyPress
//==============================================================================
procedure TfrmU620.dgInfoSubKeyPress(Sender: TObject; var Key: Char);
begin
  if (qryInfoSub.Active = false ) then Exit;

  if key = #13 then
  begin
    if qryInfoSub.State in [dsEdit, dsInsert] then
    begin
      qryInfoSub.Post;
    end;
  end;
end;

//==============================================================================
// dgInfoSubMouseUp
//==============================================================================
procedure TfrmU620.dgInfoSubMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if (qryInfoSub.Active = false ) then Exit;

  if qryInfoSub.State in [dsEdit, dsInsert] then
  begin
    qryInfoSub.Post;
  end;
end;

//==============================================================================
// dgInfoSelectionChanged
//==============================================================================
procedure TfrmU620.dgInfoSelectionChanged(Sender: TObject);
begin
  edtCode.Text := '';
  edtName.Text := '';
end;

end.




