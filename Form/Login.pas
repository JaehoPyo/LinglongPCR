unit Login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Buttons, d_MainDm, h_MainLib, h_ReferLib,
  DB, ADODB, Vcl.Imaging.pngimage, Main ;

type
  TfrmLoginBox = class(TForm)
    Pnl_Main: TPanel;
    qryInfo: TADOQuery;
    Panel1: TPanel;
    Panel3: TPanel;
    Image1: TImage;
    Panel2: TPanel;
    Question1: TImage;
    edtIDPasswd: TEdit;
    Pnl_Pass: TPanel;
    btnLogin: TBitBtn;
    edtIDCode: TEdit;
    Pnl_ID: TPanel;
    Panel4: TPanel;
    sbtLang1: TSpeedButton;
    sbtLang2: TSpeedButton;
    sbtLang3: TSpeedButton;
    Label1: TLabel;
    procedure edtIDPasswdKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure Question1MouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
    procedure Question1MouseLeave(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure sbtLangClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    { Private declarations }
  public
    { Public declarations }
  end;
  procedure LoginBoxCreate ();
var
  frmLoginBox : TfrmLoginBox;
  CloseChk : Boolean ;
  LangChange : Boolean;
implementation

{$R *.dfm}

//==============================================================================
// LoginBoxCreate
//==============================================================================
procedure LoginBoxCreate();
begin
  with TfrmLoginBox.Create(Application) do
  begin
    try
      ShowModal;
    finally
      Free;
    end;
  end;
end;

//==============================================================================
// FormCreate
//==============================================================================
procedure TfrmLoginBox.FormCreate(Sender: TObject);
begin
  (Sender as TForm).Caption := 'Auto Warehouse Management System ' + MainDm.pVersion;
  LangChange := False;
end;

//==============================================================================
// FormActivate
//==============================================================================
procedure TfrmLoginBox.FormActivate(Sender: TObject);
begin
  MainDm.M_Info.WRHS       := IniRead(INI_PATH, 'UserSeting', 'WRHS', 'PCR');
  MainDm.M_Info.LANG_TYPE  := StrToInt(IniRead(INI_PATH, 'UserSeting', 'LanguageType', '2'));  // Default=영어
  MainDm.M_Info.LANG_STR   := LANG_GUBUN[MainDm.M_Info.LANG_TYPE];
  MainDm.M_Info.PCPosition := StrToInt(IniRead(INI_PATH, 'UserSeting', 'PCposition', '0'));

  sbtLangClick(TSpeedButton(Self.FindComponent('sbtLang'+IntToStr(MainDm.M_Info.LANG_TYPE))));
  TSpeedButton(Self.FindComponent('sbtLang'+IntToStr(MainDm.M_Info.LANG_TYPE))).Down := True;
end;

//==============================================================================
// FormShow
//==============================================================================
procedure TfrmLoginBox.FormShow(Sender: TObject);
begin
  edtIDCode.Text := IniRead(INI_PATH, 'UserSeting', 'UserCode', '');

  if (Trim(edtIDCode.Text) = '') or
     (MainDm.M_Info.ReLogin) then
       edtIDCode.SetFocus
  else edtIDPasswd.SetFocus;
end;

//==============================================================================
// FormClose
//==============================================================================
procedure TfrmLoginBox.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryInfo.Active := False;
  LangChange := False;
  MainDm.M_Info.ReLogin := False;
end;

//==============================================================================
// sbtLangClick
//==============================================================================
procedure TfrmLoginBox.sbtLangClick(Sender: TObject);
begin
  if MainDm.M_Info.LANG_TYPE <> (Sender as TSpeedButton).Tag then LangChange := True;
  MainDm.M_Info.LANG_TYPE := (Sender as TSpeedButton).Tag;
  MainDm.M_Info.LANG_STR  := LANG_GUBUN[MainDm.M_Info.LANG_TYPE];
end;

//==============================================================================
// btnLoginClick
//==============================================================================
procedure TfrmLoginBox.btnLoginClick(Sender: TObject);
var
  StrSQL, tmpStrSQL : String;
begin
  MainDM.M_Info.IdPass := False;

  // 아이디 체크
  if Trim(edtIDCode.Text) = '' then
  begin
    MessageDlg('Please enter a user', mtConfirmation, [mbYes], 0);
    edtIDCode.SetFocus;
    Exit;
  end;

  // 비밀번호 체크
  if Trim(edtIDPasswd.Text) = '' then
  begin
    MessageDlg('Please enter your Password', mtConfirmation, [mbYes], 0);
    edtIDPasswd.SetFocus;
    Exit;
  end;

  // 언어타입 저장
  IniWrite(INI_PATH, 'UserSeting', 'LanguageType', IntToStr(MainDm.M_Info.LANG_TYPE));

  // 데이터베이스 연결
  MainDm.M_Info.DbType := UpperCase(IniRead(INI_PATH, 'Database', 'Connection', 'ORACLE'));
  if MainDm.M_Info.DbType = 'MSSQL' then
  begin
    MainDm.M_Info.DbOle   := IniRead(INI_PATH, 'Database', 'Provider', '');
    MainDm.M_Info.DbAlais := IniRead(INI_PATH, 'Database', 'Alais'   , '');
    MainDm.M_Info.DbUser  := IniRead(INI_PATH, 'Database', 'User'    , '');
    MainDm.M_Info.DbPswd  := IniRead(INI_PATH, 'Database', 'Pswd'    , '');
    MainDm.M_Info.DbFile  := IniRead(INI_PATH, 'Database', 'File'    , '');
  end else
  if MainDm.M_Info.DbType = 'ORACLE' then
  begin
    MainDm.M_Info.DbOle   := IniRead(INI_PATH, 'Database', 'Provider', '');
    MainDm.M_Info.DbAlais := IniRead(INI_PATH, 'Database', 'Alais'   , '');
    MainDm.M_Info.DbUser  := IniRead(INI_PATH, 'Database', 'User'    , '');
    MainDm.M_Info.DbPswd  := IniRead(INI_PATH, 'Database', 'Pswd'    , '');
  end;

  if not m.ConChk then
  begin
    if not ADOConnection('Y') then
    begin
      Exit;
    end;
  end;

  try
    with qryInfo do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' SELECT USER_ID, USER_NAME, USER_USED, USER_GRADE, ' +
                '        PASSWORD, UP_DATE, CR_DATE ' +
                '   FROM C_USER_I ' +
                '  WHERE UPPER(USER_ID)  = ' + QuotedStr(UpperCase(edtIDCode.Text)) +
                '    AND PASSWORD = ' + QuotedStr(edtIDPasswd.Text);

      tmpStrSQL := ' SELECT USER_ID, USER_NAME, USER_USED, USER_GRADE, ' +
                '        PASSWORD, UP_DATE, CR_DATE ' +
                '   FROM C_USER_I ' +
                '  WHERE UPPER(USER_ID)  = ' + QuotedStr(UpperCase(edtIDCode.Text)) +
                '    AND PASSWORD = ' ;
      SQL.Text := StrSQL ;
      Open;

      if isEmpty then
      begin
        MessageDlg('This UserID does not exist or the password has been entered incorrectly. Please enter after checking.', mtConfirmation, [mbYes], 0);
      end else
      begin
        if UpperCase(qryInfo.FieldByName('USER_USED').AsString) = 'N' then
        begin
          MessageDlg('This UserID is prohibited.', mtConfirmation, [mbYes], 0);
        end else
        begin
          MainDM.M_Info.UserCode  := UpperCase(qryInfo.FieldByName('USER_ID').AsString); // 사용자 코드
          MainDM.M_Info.UserName  := qryInfo.FieldByName('USER_NAME' ).AsString;            // 사용자명
          MainDM.M_Info.UserPwd   := qryInfo.FieldByName('PASSWORD'  ).AsString;            // 비밀번호
          MainDM.M_Info.UserGrade := qryInfo.FieldByName('USER_GRADE').AsString;            // 사용자권한
          MainDM.M_Info.IdPass    := True;
          InsertPGMHist('[Login]', 'N', 'btnLoginClick', '', 'Program Login', 'SQL', tmpStrSQL, '', '');
        end;
      end;
      Close;
    end;

    if MainDM.M_Info.IdPass then
    begin
      // 사용자 저장
      IniWrite(INI_PATH, 'UserSeting', 'UserCode', edtIDCode.Text);

      // 재 로그인 이고 언어가 변경 된 경우
      if (MainDm.M_Info.ReLogin) and
         (LangChange) then
      begin
        frmMain.LblLangDblClick(TLabel(frmMain.FindComponent('LblLang'+IntToStr(MainDm.M_Info.LANG_TYPE))));
      end else
      begin
        TLabel(frmMain.FindComponent('LblLang'+IntToStr(MainDm.M_Info.LANG_TYPE))).Font.Color := $00EC8937;
        TLabel(frmMain.FindComponent('LblLang'+IntToStr(MainDm.M_Info.LANG_TYPE))).Font.Style := [fsBold];
      end;
      MainDm.M_Info.ReLogin := False;
      Close;
      Exit;
    end;
  except
    on E : Exception do
    begin
      qryInfo.Close;
      MainDM.M_Info.IdPass := False;
      MessageDlg('Login failed. Please try again.', mtWarning, [mbYes], 0);
      InsertPGMHist('[Login]', 'E', 'btnLoginClick', '', 'Exception Error', 'SQL', tmpStrSQL, '', E.Message);
      TraceLogWrite('[Login] procedure btnLoginClick Fail || ERR['+E.Message+'], SQL['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// Question1MouseLeave
//==============================================================================
procedure TfrmLoginBox.Question1MouseLeave(Sender: TObject);
begin
  if Pnl_ID.Visible   then Pnl_ID.Visible   := False ;
  if Pnl_Pass.Visible then Pnl_Pass.Visible := False ;
end;

//==============================================================================
// Question1MouseMove
//==============================================================================
procedure TfrmLoginBox.Question1MouseMove(Sender: TObject; Shift: TShiftState;X, Y: Integer);
begin
  if not Pnl_ID.Visible   then Pnl_ID.Visible   := True;
  if not Pnl_Pass.Visible then Pnl_Pass.Visible := True;
end;

//==============================================================================
// edtIDPasswdKeyPress
//==============================================================================
procedure TfrmLoginBox.edtIDPasswdKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    btnLoginClick(Self);
  end;
end;

end.
