unit U610;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, d_MainDm, h_MainLib, h_ReferLib, StdCtrls, DB, ADODB,
  Grids, StrUtils, DBGrids, comobj, DBGridEhGrouping, EhLibADO,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh,DBGridEhImpExp,
  DBGridEh, Vcl.Mask, Vcl.DBCtrls, DBCtrlsEh, PrnDbgeh, Vcl.Buttons, Vcl.Menus ;

type
  TfrmU610 = class(TForm)
    dsInfo: TDataSource;
    qryInfo: TADOQuery;
    qryTemp: TADOQuery;
    shpB: TShape;
    shpL: TShape;
    shpR: TShape;
    shpT: TShape;
    EhPrint: TPrintDBGridEh;
    pmControl: TPopupMenu;
    mnCodeDel: TMenuItem;
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
    PnlGrade: TPanel;
    cbGrade: TComboBox;
    Panel6: TPanel;
    mnCodeReg: TMenuItem;
    mnCodeUdt: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dgInfoTitleClick(Column: TColumnEh);
    procedure cbChange(Sender: TObject);
    procedure KeyPress(Sender: TObject; var Key: Char);
    procedure mnClick(Sender: TObject);
    procedure sbtClearClick(Sender: TObject);
    procedure pmControlPopup(Sender: TObject);
    procedure dgInfoDblClick(Sender: TObject);
    procedure cbKeyPress(Sender: TObject; var Key: Char);
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
    procedure ProcDeleteCode(Code: String);
  end;
  procedure U610Create();

const
  FormNo ='610';
  FIdx   = 6;
  SIdx   = 1;

var
  frmU610: TfrmU610;
  SrtFlag : integer = 0 ;

implementation

uses Main, U610_Pop;

{$R *.dfm}

//==============================================================================
// U610Create
//==============================================================================
procedure U610Create();
begin
  if not Assigned(frmU610) then
  begin
    frmU610 := TfrmU610.Create(Application);
    with frmU610 do
    begin
      fnCommandStart;
      fnCommandLang;
    end;
  end;
  frmU610.Show;
end;

//==============================================================================
// fnWmMsgRecv
//==============================================================================
procedure TfrmU610.fnWmMsgRecv(var MSG: TMessage);
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
procedure TfrmU610.FormCreate(Sender: TObject);
begin
//
end;

//==============================================================================
// FormShow
//==============================================================================
procedure TfrmU610.FormShow(Sender: TObject);
begin
//
end;

//==============================================================================
// FormActivate
//==============================================================================
procedure TfrmU610.FormActivate(Sender: TObject);
begin
  MainDm.M_Info.ActiveFormID := '610';
  frmMain.LblMenu000.Caption := MainDm.M_Info.ActiveFormID + '. ' + getLangMenuString(MainDm.M_Info.ActiveFormID, frmMain.LblMenu000.Caption, MainDm.M_Info.LANG_TYPE, 'N');
  frmU610.Caption := MainDm.M_Info.ActiveFormName;
  frmMain.TabSetDisplay(frmU610, tsFormChange);
  fnCommandLang;
  fnWmMsgSend(StrToInt(menuGrade[FIdx][SIdx].Grade), 111);
  SetComboBox;
  fnCommandQuery ;
end;

//==============================================================================
// FormDeactivate
//==============================================================================
procedure TfrmU610.FormDeactivate(Sender: TObject);
begin
//
end;

//==============================================================================
// FormClose
//==============================================================================
procedure TfrmU610.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryInfo.Active := False;
  qryTemp.Active := False;

  Action := Cafree;
  try
    frmMain.TabSetDisplay(TForm(frmU610), tsDelete);
    frmU610 := Nil ;
  except
  end;
end;

//==============================================================================
// fnCommandStart [시작]
//==============================================================================
procedure TfrmU610.fnCommandStart;
begin
//
end;

//==============================================================================
// fnCommandOrder [지시]
//==============================================================================
procedure TfrmU610.fnCommandOrder;
begin
//
end;

//==============================================================================
// fnCommandAdd [신규]
//==============================================================================
procedure TfrmU610.fnCommandAdd  ;
begin
  try
    frmU610_Pop := TfrmU610_Pop.Create(Application);
    frmU610_Pop.Caption := frmU610.Caption;
    frmU610_Pop.PnlFormName.Caption := getLangString(FormNo, 'pUSER_R', 'User Regist', MainDm.M_Info.LANG_TYPE, 'N');
    frmU610_Pop.btnSave.Caption     := getLangString(FormNo, 'bREGIST', 'Regist', MainDm.M_Info.LANG_TYPE, 'N');
    frmU610_Pop.btnClose.Caption    := getLangString(FormNo, 'bCLOSE', 'Close', MainDm.M_Info.LANG_TYPE, 'N');
    frmU610_Pop.btnSave.Tag         := 1; // 등록

    // 사용자코드
    frmU610_Pop.PnlUSERID.Caption  := getLangString(FormNo, 'USER_ID', 'User Cdoe', MainDm.M_Info.LANG_TYPE, 'N');
    frmU610_Pop.edtUSERID.Text     := '';
    frmU610_Pop.edtUSERID.Color    := clWhite;
    frmU610_Pop.edtUSERID.ReadOnly := False;

    // 사용자명
    frmU610_Pop.PnlUSERNM.Caption  := getLangString(FormNo, 'USER_NAME', 'User Name', MainDm.M_Info.LANG_TYPE, 'N');
    frmU610_Pop.edtUSERNM.Text     := '';
    frmU610_Pop.edtUSERNM.Color    := clWhite;
    frmU610_Pop.edtUSERNM.ReadOnly := False;

    // 사용자암호
    frmU610_Pop.PnlPW.Caption  := getLangString(FormNo, 'pUSER_P', 'Password', MainDm.M_Info.LANG_TYPE, 'N');
    frmU610_Pop.edtPW.Text     := '';
    frmU610_Pop.edtPW.Color    := clWhite;
    frmU610_Pop.edtPW.ReadOnly := False;

    // 암호확인
    frmU610_Pop.PnlPWCheck.Caption  := getLangString(FormNo, 'pPWDCHECK', 'Check Password', MainDm.M_Info.LANG_TYPE, 'N');
    frmU610_Pop.edtPWCheck.Text     := '';
    frmU610_Pop.edtPWCheck.Color    := clWhite;
    frmU610_Pop.edtPWCheck.ReadOnly := False;

    // 사용자권한
    frmU610_Pop.PnlGrade.Caption  := getLangString(FormNo, 'GRADE_DESC', 'User Authority', MainDm.M_Info.LANG_TYPE, 'N');
    frmU610_Pop.cbGrade.ItemIndex := 2;
    frmU610_Pop.cbGrade.Color     := clWhite;

    // 현재암호
    frmU610_Pop.PnlCurrPW.Caption := getLangString(FormNo, 'pCURRPWD', 'Current Password', MainDm.M_Info.LANG_TYPE, 'N');
    frmU610_Pop.PnlCurrPW.Visible := False;
    frmU610_Pop.edtCurrPW.Visible := False;

    frmU610_Pop.ShowModal ;
  except
    on E : Exception do
    begin
      InsertPGMHist('['+FormNo+']', 'E', 'fnCommandAdd', 'Regist', 'Exception Error', 'PGM', '', '', E.Message);
      TraceLogWrite('[610] procedure fnCommandAdd Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// fnCommandDelete [삭제]
//==============================================================================
procedure TfrmU610.fnCommandDelete;
var
  i : Integer;
  tmpCode : String;
begin
  try
    if (not qryInfo.Active) or
       (dgInfo.SelectedRows.Count < 1) then
    begin
      MessageDlg('Please select a row. (Delete)', mtConfirmation, [mbYes], 0);
      Exit ;
    end;

    // 전속한 계정
    if qryInfo.FieldByName('USER_ID').AsString = MainDM.M_Info.UserCode then
    begin
      MessageDlg('Currently logged in user cannot be deleted.', mtWarning, [mbYes], 0) ;
      Exit;
    end;

    // Supervisor
    if MainDM.M_Info.UserGrade <> '0' then
    begin
      MessageDlg('Only administrators can delete it.', mtWarning, [mbYes], 0) ;
      Exit;
    end;

    tmpCode := UpperCase(qryInfo.FieldByName('USER_ID').AsString);
    if MessageDlg('Are you want to delete the selected user?' + #13#10 + #13#10 +
                  '['+tmpCode+']', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit ;

    for i := 0 to (dgInfo.SelectedRows.Count-1) do
    begin
      with dgInfo.DataSource.DataSet do
      begin
        GotoBookmark(Pointer(dgInfo.SelectedRows.Items[i]));
        ProcDeleteCode(UpperCase(qryInfo.FieldByName('USER_ID').AsString));
      end;
    end;
    SetComboBox;
    fnCommandQuery;
  except
    on E : Exception do
    begin
      InsertPGMHist('['+FormNo+']', 'E', 'fnCommandDelete', 'Delete', 'Exception Error', 'PGM', '', '', E.Message);
      TraceLogWrite('[610] procedure fnCommandDelete Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// fnCommandUpdate [수정]
//==============================================================================
procedure TfrmU610.fnCommandUpdate;
begin
  try
    if (not qryInfo.Active) or
       (dgInfo.SelectedRows.Count < 1) then
    begin
      MessageDlg('Please select a row. (Update)', mtConfirmation, [mbYes], 0);
      Exit ;
    end;

    frmU610_Pop := TfrmU610_Pop.Create(Application);
    frmU610_Pop.Caption := frmU610.Caption;
    frmU610_Pop.PnlFormName.Caption := getLangString(FormNo, 'pUSER_U', 'User Update', MainDm.M_Info.LANG_TYPE, 'N');
    frmU610_Pop.btnSave.Caption  := getLangString(FormNo, 'bUPDATE', 'Update', MainDm.M_Info.LANG_TYPE, 'N');
    frmU610_Pop.btnClose.Caption := getLangString(FormNo, 'bCLOSE', 'Close', MainDm.M_Info.LANG_TYPE, 'N');
    frmU610_Pop.btnSave.Tag      := 2; // 수정

    // 사용자코드
    frmU610_Pop.PnlUSERID.Caption  := getLangString(FormNo, 'USER_ID', 'User Cdoe', MainDm.M_Info.LANG_TYPE, 'N');
    frmU610_Pop.edtUSERID.Text     := qryInfo.FieldByName('USER_ID').AsString;
    frmU610_Pop.edtUSERID.Color    := $00DDDDDD;
    frmU610_Pop.edtUSERID.ReadOnly := True;

    // 사용자명
    frmU610_Pop.PnlUSERNM.Caption  := getLangString(FormNo, 'USER_NAME', 'User Name', MainDm.M_Info.LANG_TYPE, 'N');
    frmU610_Pop.edtUSERNM.Text     := qryInfo.FieldByName('USER_NAME').AsString;
    frmU610_Pop.edtUSERNM.Color    := clWhite;
    frmU610_Pop.edtUSERNM.ReadOnly := False;

    // 사용자암호
    frmU610_Pop.PnlPW.Caption  := getLangString(FormNo, 'pUSER_P', 'Password', MainDm.M_Info.LANG_TYPE, 'N');
    frmU610_Pop.edtPW.Text     := qryInfo.FieldByName('PASSWORD').AsString;
    frmU610_Pop.edtPW.Color    := clWhite;
    frmU610_Pop.edtPW.ReadOnly := False;

    // 암호확인
    frmU610_Pop.PnlPWCheck.Caption  := getLangString(FormNo, 'pPWDCHECK', 'Check Password', MainDm.M_Info.LANG_TYPE, 'N');
    frmU610_Pop.edtPWCheck.Text     := qryInfo.FieldByName('PASSWORD').AsString;
    frmU610_Pop.edtPWCheck.Color    := clWhite;
    frmU610_Pop.edtPWCheck.ReadOnly := False;

    // 사용자권한
    frmU610_Pop.PnlGrade.Caption  := getLangString(FormNo, 'GRADE_DESC', 'User Authority', MainDm.M_Info.LANG_TYPE, 'N');
    frmU610_Pop.cbGrade.ItemIndex := StrToIntDef(qryInfo.FieldByName('USER_GRADE').AsString, 0);
    frmU610_Pop.cbGrade.Color     := clWhite;

    // 현재암호
    frmU610_Pop.PnlCurrPW.Caption := getLangString(FormNo, 'pCURRPWD', 'Current Password', MainDm.M_Info.LANG_TYPE, 'N');
    frmU610_Pop.PnlCurrPW.Visible := True;
    frmU610_Pop.edtCurrPW.Visible := True;

    frmU610_Pop.ShowModal ;
  except
    on E : Exception do
    begin
      InsertPGMHist('['+FormNo+']', 'E', 'fnCommandUpdate', 'Update', 'Exception Error', 'PGM', '', '', E.Message);
      TraceLogWrite('[610] procedure fnCommandUpdate Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// fnCommandExcel [엑셀]
//==============================================================================
procedure TfrmU610.fnCommandExcel;
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
      TraceLogWrite('[610] procedure fnCommandExcel Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// fnCommandPrint [인쇄]
//==============================================================================
procedure TfrmU610.fnCommandPrint;
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
      TraceLogWrite('[610] procedure fnCommandPrint Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// fnCommandQuery [조회]
//==============================================================================
procedure TfrmU610.fnCommandQuery;
var
  WhereStr, StrSQL : String;
begin
  try
    WhereStr := '' ;
    // 사용자코드
    if (Trim(edtCode.Text) <> '') then
      WhereStr := WhereStr + ' AND UPPER(USER_ID) LIKE ' + QuotedStr('%'+UpperCase(edtCode.Text)+'%');
    // 사용자명
    if (Trim(edtName.Text) <> '') then
      WhereStr := WhereStr + ' AND UPPER(USER_NAME) LIKE ' + QuotedStr('%'+UpperCase(edtName.Text)+'%');
    // 사용자권한
    if (cbGrade.ItemIndex > 0) then
      WhereStr := WhereStr + ' AND USER_GRADE = ' + QuotedStr(IntToStr(cbGrade.ItemIndex-1)) ;

    with qryInfo do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' SELECT UPPER(USER_ID) as USER_ID, USER_NAME, USER_GRADE, PASSWORD, ' +
                '        DECODE(USER_GRADE, ''0'', ''Supervisor'', ''1'', ''CCR'', '+
                '               ''2'', ''ASRS'', ''3'', ''ProductManager'' ) as GRADE_DESC, ' +
                '        CR_DATE, UP_DATE ' +
                '   FROM C_USER_I ' +
                '  WHERE 1 = 1 ' + WhereStr +
                '  ORDER BY USER_ID ';
      SQL.Text := StrSQL;
      Open;
    end;
  except
    on E : Exception do
    begin
      qryInfo.Close;
      InsertPGMHist('['+FormNo+']', 'E', 'fnCommandQuery', 'Inquiry', 'Exception Error', 'SQL', StrSQL, '', E.Message);
      TraceLogWrite('[610] procedure fnCommandQuery Fail || ERR['+E.Message+'], SQL['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// fnCommandClose [닫기]
//==============================================================================
procedure TfrmU610.fnCommandClose;
begin
//
end;

//==============================================================================
// fnCommandLang [언어]
//==============================================================================
procedure TfrmU610.fnCommandLang;
var
  i : integer;
begin
  try
    frmU610.Caption   := MainDm.M_Info.ActiveFormName;
    PnlSearch.Caption := getLangString(FormNo, 'pSEARCH'   , 'Search'   , MainDm.M_Info.LANG_TYPE, 'N');
    PnlCode.Caption   := getLangString(FormNo, 'USER_ID'   , 'User Code', MainDm.M_Info.LANG_TYPE, 'N');
    PnlName.Caption   := getLangString(FormNo, 'USER_NAME' , 'User Name', MainDm.M_Info.LANG_TYPE, 'N');
    PnlGrade.Caption  := getLangString(FormNo, 'GRADE_DESC', 'Authority', MainDm.M_Info.LANG_TYPE, 'N');

    for i := 0 to dgInfo.Columns.Count-1 do
    begin
      if not dgInfo.Columns[i].Visible then Continue;
      dgInfo.Columns[i].Title.Caption := getLangString(FormNo, dgInfo.Columns[i].FieldName, dgInfo.Columns[i].Title.Caption, MainDm.M_Info.LANG_TYPE, 'N');
    end;

    cbGrade.Items.Clear();
    cbGrade.Items.Add(getLangString(FormNo, 'cbALL', 'ALL', MainDm.M_Info.LANG_TYPE, 'N'));
    cbGrade.Items.Add('Supervisor');
    cbGrade.Items.Add('CCR');
    cbGrade.Items.Add('ASRS');
    cbGrade.Items.Add('ProductManager');
    cbGrade.ItemIndex := 0;
  except
    on E : Exception do
    begin
      InsertPGMHist('['+FormNo+']', 'E', 'fnCommandLang', 'Language', 'Exception Error', 'PGM', '', '', E.Message);
      TraceLogWrite('[610] procedure fnCommandLang || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// ProcDeleteCode [선택코드삭제]
//==============================================================================
procedure TfrmU610.ProcDeleteCode(CODE: String);
var
  ExecNo : integer;
  StrSQL : String;
begin
  try
    StrSQL := ' DELETE FROM C_USER_I ' +
              '  WHERE USER_ID  = ' + QuotedStr(CODE) ;

    with qryTemp do
    begin
      Close;
      SQL.Clear;
      SQL.Text := StrSQL;
      ExecNo := ExecSQL;
      if ExecNo > 0 then
      begin
        InsertPGMHist('['+FormNo+']', 'N', 'ProcDeleteCode', 'Delete', 'User Code['+CODE+']', 'SQL', StrSQL, '', '');
        TraceLogWrite('[610] User Delete || User Code['+CODE+'], Delete User['+MainDm.M_Info.UserCode+']');
      end else
      begin
        InsertPGMHist('['+FormNo+']', 'E', 'ProcDeleteCode', 'Delete', 'User Code['+CODE+']', 'SQL', StrSQL, '', '');
        TraceLogWrite('[610] User Delete Fail || User Code['+CODE+'], Delete User['+MainDm.M_Info.UserCode+']');
      end;
      Close;
    end;
  except
    on E : Exception do
    begin
      qryTemp.Close;
      InsertPGMHist('['+FormNo+']', 'E', 'ProcDeleteCode', 'Delete', 'Exception Error', 'SQL', StrSQL, '', E.Message);
      TraceLogWrite('[610] procedure ProcDeleteCode Fail || ERR['+E.Message+'], SQL['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// dgInfoDblClick
//==============================================================================
procedure TfrmU610.dgInfoDblClick(Sender: TObject);
begin
  if frmMain.cmdUPDATE.Enabled then
  begin
    fnCommandUpdate;
  end;
end;

//==============================================================================
// pmControlPopup
//==============================================================================
procedure TfrmU610.pmControlPopup(Sender: TObject);
begin
  try
    mnCodeReg.Visible := False;
    mnCodeDel.Visible := False;
    mnCodeUdt.Visible := False;

    if (not qryInfo.Active) or
       (dgInfo.SelectedRows.Count < 1) then
    begin
      MessageDlg('Please select a row.', mtConfirmation, [mbYes], 0);
      Exit ;
    end;

    if frmMain.cmdREGISTER.Enabled then
    begin // 등록
      mnCodeReg.Caption := getLangString(FormNo, 'pUSER_R', 'User Regist', MainDm.M_Info.LANG_TYPE, 'N');
      mnCodeReg.Visible := True;
    end else
    begin
      mnCodeReg.Visible := False;
    end;

    if frmMain.cmdDELETE.Enabled then
    begin // 삭제
      mnCodeDel.Caption := getLangString(FormNo, 'pUSER_D', 'User Delete', MainDm.M_Info.LANG_TYPE, 'N');
      mnCodeDel.Visible := True;
    end else
    begin
      mnCodeDel.Visible := False;
    end;

    if frmMain.cmdUPDATE.Enabled then
    begin // 수정
      mnCodeUdt.Caption := getLangString(FormNo, 'pUSER_U', 'User Update', MainDm.M_Info.LANG_TYPE, 'N');
      mnCodeUdt.Visible := True;
    end else
    begin
      mnCodeUdt.Visible := False;
    end;
  except
    on E : Exception do
    begin
      InsertPGMHist('['+FormNo+']', 'E', 'pmControlPopup', '', 'Exception Error', 'PGM', '', '', E.Message);
      TraceLogWrite('[610] procedure pmControlPopup Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// mnClick
//==============================================================================
procedure TfrmU610.mnClick(Sender: TObject);
begin
  case (Sender as TComponent).Tag of
    1 : fnCommandAdd;    // 등록
    2 : fnCommandDelete; // 삭제
    3 : fnCommandUpdate; // 수정
  end;
end;

//==============================================================================
// SetComboBox
//==============================================================================
procedure TfrmU610.SetComboBox;
begin
//
end;

//==============================================================================
// KeyPress
//==============================================================================
procedure TfrmU610.KeyPress(Sender: TObject; var Key: Char);
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
procedure TfrmU610.cbKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
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
procedure TfrmU610.cbChange(Sender: TObject);
begin
  fnCommandQuery;
end;

//==============================================================================
// sbtClearClick
//==============================================================================
procedure TfrmU610.sbtClearClick(Sender: TObject);
begin
  edtCode.Text := '';
  edtName.Text := '';
  cbGrade.ItemIndex := 0;
  edtCode.SetFocus;
  dgInfo.SelectedRows.Clear;
  fnCommandQuery;
end;

//==============================================================================
// dgInfoTitleClick
//==============================================================================
procedure TfrmU610.dgInfoTitleClick(Column: TColumnEh);
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

end.




